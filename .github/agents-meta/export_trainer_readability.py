#!/usr/bin/env python3

import argparse
import re
from dataclasses import dataclass
from pathlib import Path


@dataclass
class PartyMon:
    species: str
    level: int


@dataclass
class TrainerRecord:
    trainer_id: str
    trainer_num: int
    trainer_class: str
    trainer_name: str
    party_symbol: str
    party_type: str
    party: list


TRAINER_ID_RE = re.compile(r"^#define\s+(TRAINER_[A-Z0-9_]+)\s+(\d+)\s*$", re.MULTILINE)
MIN_REAL_TRAINER_ID = 89


def parse_trainer_ids(opponents_h: str) -> dict:
    ids = {}
    for name, value in TRAINER_ID_RE.findall(opponents_h):
        ids[name] = int(value)
    return ids


def find_block(content: str, anchor: str) -> str:
    start = content.find(anchor)
    if start == -1:
        return ""
    return content[start:]


def iter_named_initializer_blocks(content: str):
    i = 0
    n = len(content)
    while i < n:
        open_bracket = content.find("[", i)
        if open_bracket == -1:
            break
        close_bracket = content.find("]", open_bracket)
        if close_bracket == -1:
            break
        symbol = content[open_bracket + 1:close_bracket].strip()
        eq_pos = content.find("=", close_bracket)
        if eq_pos == -1:
            break
        brace_start = content.find("{", eq_pos)
        if brace_start == -1:
            break
        depth = 0
        j = brace_start
        while j < n:
            ch = content[j]
            if ch == "{":
                depth += 1
            elif ch == "}":
                depth -= 1
                if depth == 0:
                    yield symbol, content[brace_start:j + 1]
                    i = j + 1
                    break
            j += 1
        else:
            break


PARTY_DECL_RE = re.compile(
    r"static\s+const\s+struct\s+(\w+)\s+(sParty_[A-Za-z0-9_]+)\s*\[\]\s*=\s*\{",
    re.MULTILINE,
)


def parse_party_entries(block: str) -> list:
    entries = []
    lvl_re = re.compile(r"\.lvl\s*=\s*(\d+)")
    lvl_matches = list(lvl_re.finditer(block))

    for idx, lvl_match in enumerate(lvl_matches):
        start = lvl_match.end()
        end = lvl_matches[idx + 1].start() if idx + 1 < len(lvl_matches) else len(block)
        window = block[start:end]
        species_match = re.search(r"\.species\s*=\s*(SPECIES_[A-Z0-9_]+)", window)
        if species_match:
            entries.append(
                PartyMon(
                    species=species_match.group(1).replace("SPECIES_", ""),
                    level=int(lvl_match.group(1)),
                )
            )
    return entries


def parse_macro_mons(trainer_parties_h: str) -> dict:
    macros = {}
    lines = trainer_parties_h.splitlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r"^#define\s+(\w+)\s+(.*)$", line)
        if not m:
            i += 1
            continue

        macro_name = m.group(1)
        body = m.group(2).rstrip()
        while body.endswith("\\") and i + 1 < len(lines):
            body = body[:-1] + "\n" + lines[i + 1].rstrip()
            i += 1

        lvl_match = re.search(r"\.lvl\s*=\s*(\d+)", body)
        species_match = re.search(r"\.species\s*=\s*(SPECIES_[A-Z0-9_]+)", body)
        if lvl_match and species_match:
            macros[macro_name] = PartyMon(
                species=species_match.group(1).replace("SPECIES_", ""),
                level=int(lvl_match.group(1)),
            )

        i += 1

    return macros


def parse_macro_party_tokens(block: str, macro_mons: dict) -> list:
    tokens = re.findall(r"\b([A-Z][A-Z0-9_]+)\b", block)
    mons = []
    for token in tokens:
        if token in macro_mons:
            mons.append(macro_mons[token])
    return mons


def parse_parties(trainer_parties_h: str) -> dict:
    parties = {}
    macro_mons = parse_macro_mons(trainer_parties_h)
    for match in PARTY_DECL_RE.finditer(trainer_parties_h):
        party_type = match.group(1)
        party_symbol = match.group(2)
        start = match.end() - 1
        depth = 0
        i = start
        while i < len(trainer_parties_h):
            ch = trainer_parties_h[i]
            if ch == "{":
                depth += 1
            elif ch == "}":
                depth -= 1
                if depth == 0:
                    # Include trailing semicolon.
                    end = trainer_parties_h.find(";", i)
                    block = trainer_parties_h[start:end + 1] if end != -1 else trainer_parties_h[start:i + 1]
                    mons = parse_party_entries(block)
                    if not mons:
                        mons = parse_macro_party_tokens(block, macro_mons)

                    parties[party_symbol] = {
                        "party_type": party_type,
                        "mons": mons,
                    }
                    break
            i += 1
    return parties


def parse_trainer_name(raw_block: str) -> str:
    m = re.search(r"\.trainerName\s*=\s*_\(\"([^\"]*)\"\)", raw_block)
    return m.group(1) if m else ""


def parse_trainers(trainers_h: str, trainer_ids: dict, parties: dict) -> list:
    records = []
    g_trainers = find_block(trainers_h, "const struct Trainer gTrainers[] = {")
    table_start = g_trainers.find("{")
    if table_start == -1:
        return records
    table_body = g_trainers[table_start + 1:]

    for trainer_symbol, block in iter_named_initializer_blocks(table_body):
        class_match = re.search(r"\.trainerClass\s*=\s*(TRAINER_CLASS_[A-Z0-9_]+)", block)
        party_match = re.search(r"\.party\s*=\s*(\w+)\((sParty_[A-Za-z0-9_]+)\)", block)
        if not class_match or not party_match:
            continue
        if trainer_symbol not in trainer_ids:
            continue
        if trainer_ids[trainer_symbol] < MIN_REAL_TRAINER_ID:
            continue
        party_symbol = party_match.group(2)
        party_info = parties.get(party_symbol, {"party_type": "Unknown", "mons": []})
        records.append(
            TrainerRecord(
                trainer_id=trainer_symbol,
                trainer_num=trainer_ids[trainer_symbol],
                trainer_class=class_match.group(1),
                trainer_name=parse_trainer_name(block),
                party_symbol=party_symbol,
                party_type=party_info["party_type"],
                party=party_info["mons"],
            )
        )
    records.sort(key=lambda r: r.trainer_num)
    return records


def trainer_level_summary(mons: list) -> tuple:
    if not mons:
        return 0.0, 0, 0
    levels = [m.level for m in mons]
    avg = sum(levels) / len(levels)
    return avg, min(levels), max(levels)


def is_boss(trainer_class: str) -> bool:
    boss_classes = {
        "TRAINER_CLASS_LEADER",
        "TRAINER_CLASS_ELITE_FOUR",
        "TRAINER_CLASS_CHAMPION",
        "TRAINER_CLASS_RIVAL_EARLY",
        "TRAINER_CLASS_RIVAL_LATE",
        "TRAINER_CLASS_RS_LEADER",
        "TRAINER_CLASS_RS_ELITE_FOUR",
        "TRAINER_CLASS_RS_CHAMPION",
        "TRAINER_CLASS_AQUA_LEADER",
        "TRAINER_CLASS_MAGMA_LEADER",
        "TRAINER_CLASS_AQUA_ADMIN",
        "TRAINER_CLASS_MAGMA_ADMIN",
    }
    return trainer_class in boss_classes


def yaml_escape(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


def write_yaml(records: list, out_path: Path):
    lines = []
    lines.append("# Auto-generated by tools/export_trainer_readability.py")
    lines.append("# Trainer level is represented as average/min/max Pokemon party levels.")
    lines.append("trainers:")
    for rec in records:
        avg, min_lvl, max_lvl = trainer_level_summary(rec.party)
        lines.append(f"  - trainer_id: {rec.trainer_id}")
        lines.append(f"    trainer_num: {rec.trainer_num}")
        lines.append(f"    name: \"{yaml_escape(rec.trainer_name)}\"")
        lines.append(f"    trainer_class: {rec.trainer_class}")
        lines.append(f"    party_symbol: {rec.party_symbol}")
        lines.append(f"    party_type: {rec.party_type}")
        lines.append("    trainer_level:")
        lines.append(f"      average: {avg:.2f}")
        lines.append(f"      min: {min_lvl}")
        lines.append(f"      max: {max_lvl}")
        lines.append("    pokemon:")
        if not rec.party:
            lines.append("      []")
        else:
            for mon in rec.party:
                lines.append(f"      - species: {mon.species}")
                lines.append(f"        level: {mon.level}")
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def write_boss_markdown(records: list, out_path: Path):
    lines = []
    lines.append("# Boss Encounters")
    lines.append("")
    lines.append("Auto-generated from trainer data in source files.")
    lines.append("")
    lines.append("| Trainer ID | Name | Class | Trainer Level (avg/min/max) | Party |")
    lines.append("| --- | --- | --- | --- | --- |")
    for rec in records:
        if not is_boss(rec.trainer_class):
            continue
        avg, min_lvl, max_lvl = trainer_level_summary(rec.party)
        level_summary = f"{avg:.2f}/{min_lvl}/{max_lvl}"
        party_summary = ", ".join(f"{m.species} Lv{m.level}" for m in rec.party) if rec.party else "-"
        display_name = rec.trainer_name if rec.trainer_name else "(unnamed)"
        lines.append(
            f"| {rec.trainer_id} | {display_name} | {rec.trainer_class} | {level_summary} | {party_summary} |"
        )
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Export trainer readability docs.")
    parser.add_argument("--repo", default=".", help="Repository root")
    parser.add_argument("--yaml-out", default="docs/npc_trainers.yaml", help="YAML output path")
    parser.add_argument("--boss-md-out", default="docs/boss_encounters.md", help="Boss markdown output path")
    args = parser.parse_args()

    repo = Path(args.repo).resolve()
    trainers_h = (repo / "src/data/trainers.h").read_text(encoding="utf-8")
    trainer_parties_h = (repo / "src/data/trainer_parties.h").read_text(encoding="utf-8")
    opponents_h = (repo / "include/constants/opponents.h").read_text(encoding="utf-8")

    trainer_ids = parse_trainer_ids(opponents_h)
    parties = parse_parties(trainer_parties_h)
    records = parse_trainers(trainers_h, trainer_ids, parties)

    yaml_out = (repo / args.yaml_out).resolve()
    md_out = (repo / args.boss_md_out).resolve()
    yaml_out.parent.mkdir(parents=True, exist_ok=True)
    md_out.parent.mkdir(parents=True, exist_ok=True)

    write_yaml(records, yaml_out)
    write_boss_markdown(records, md_out)

    print(f"Wrote {len(records)} trainer entries to {yaml_out}")
    print(f"Wrote boss encounter table to {md_out}")


if __name__ == "__main__":
    main()