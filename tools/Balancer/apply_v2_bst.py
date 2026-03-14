#!/usr/bin/env python3
"""
apply_v2_bst.py

Applies v2 equalized base stats (Gen 3 National Dex 1..386) to pret/pokefirered
by rewriting src/data/pokemon/base_stats.h

Usage:
  python apply_v2_bst.py --csv gen3_national_equalized_bst.csv --base-stats src/data/pokemon/base_stats.h

Notes:
- Updates only:
    .baseHP, .baseAttack, .baseDefense, .baseSpeed, .baseSpAttack, .baseSpDefense
- Keeps all other fields intact.
- Creates a .bak backup of base_stats.h before writing.
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Dict, Tuple


def name_to_species_constant(name: str) -> str:
    """
    Convert PokéAPI-ish species names from the CSV to pret species constants.

    Examples:
      "mr-mime"   -> "SPECIES_MR_MIME"
      "ho-oh"     -> "SPECIES_HO_OH"
      "nidoran-f" -> "SPECIES_NIDORAN_F"
      "farfetchd" -> "SPECIES_FARFETCHD"
      "porygon2"  -> "SPECIES_PORYGON2"
    """
    n = name.strip().lower()

    # handle a couple of known awkward ones explicitly (safe even if redundant)
    special = {
        "mr-mime": "SPECIES_MR_MIME",
        "ho-oh": "SPECIES_HO_OH",
        "nidoran-f": "SPECIES_NIDORAN_F",
        "nidoran-m": "SPECIES_NIDORAN_M",
        "farfetchd": "SPECIES_FARFETCHD",
    }
    if n in special:
        return special[n]

    n = n.replace("-", "_")
    n = n.replace(".", "")
    return "SPECIES_" + n.upper()


def read_csv_stats(csv_path: Path) -> Dict[str, Tuple[int, int, int, int, int, int]]:
    """
    Returns mapping:
      SPECIES_XXX -> (hp, atk, def, spe, spa, spd)
    Note: pokefirered struct order uses Speed before SpA/SpD.
    """
    out: Dict[str, Tuple[int, int, int, int, int, int]] = {}

    with csv_path.open("r", encoding="utf-8", newline="") as f:
        r = csv.DictReader(f)
        required = ["name", "new_hp", "new_atk", "new_def", "new_spa", "new_spd", "new_spe"]
        for k in required:
            if k not in r.fieldnames:
                raise SystemExit(f"CSV missing required column: {k}")

        for row in r:
            sp = name_to_species_constant(row["name"])
            hp = int(row["new_hp"])
            atk = int(row["new_atk"])
            deff = int(row["new_def"])
            spa = int(row["new_spa"])
            spd = int(row["new_spd"])
            spe = int(row["new_spe"])

            out[sp] = (hp, atk, deff, spe, spa, spd)

    return out


def patch_block(block: str, stats: Tuple[int, int, int, int, int, int]) -> str:
    hp, atk, deff, spe, spa, spd = stats

    def sub(field: str, value: int, text: str) -> str:
        # matches ".baseHP = 45" with flexible whitespace
        pattern = rf"(\.{re.escape(field)}\s*=\s*)\d+"
        if not re.search(pattern, text):
            raise ValueError(f"Field {field} not found in block")
        return re.sub(pattern, rf"\g<1>{value}", text, count=1)

    block = sub("baseHP", hp, block)
    block = sub("baseAttack", atk, block)
    block = sub("baseDefense", deff, block)
    block = sub("baseSpeed", spe, block)
    block = sub("baseSpAttack", spa, block)
    block = sub("baseSpDefense", spd, block)
    return block


def apply_to_base_stats(base_stats_path: Path, mapping: Dict[str, Tuple[int, int, int, int, int, int]]) -> None:
    text = base_stats_path.read_text(encoding="utf-8")

    # Regex to capture each species entry:
    #   [SPECIES_X] = { ... },
    entry_re = re.compile(
        r"(\[\s*(SPECIES_[A-Z0-9_]+)\s*\]\s*=\s*\{)(.*?)(\}\s*,)",
        re.DOTALL,
    )

    patched = 0
    missing = []

    def repl(m: re.Match) -> str:
        nonlocal patched
        prefix, species_const, body, suffix = m.group(1), m.group(2), m.group(3), m.group(4)
        if species_const not in mapping:
            return m.group(0)
        try:
            new_body = patch_block(body, mapping[species_const])
        except Exception as ex:
            raise RuntimeError(f"Failed patching {species_const}: {ex}") from ex
        patched += 1
        return prefix + new_body + suffix

    new_text = entry_re.sub(repl, text)

    # Report which CSV species weren't found in file
    present_species = set(m.group(2) for m in entry_re.finditer(text))
    for sp in mapping.keys():
        if sp not in present_species:
            missing.append(sp)

    # Backup then write
    backup = base_stats_path.with_suffix(base_stats_path.suffix + ".bak")
    backup.write_text(text, encoding="utf-8")
    base_stats_path.write_text(new_text, encoding="utf-8")

    print(f"Patched species entries: {patched}")
    if missing:
        print(f"WARNING: {len(missing)} species from CSV not found in {base_stats_path}:")
        print("  " + ", ".join(missing[:30]) + (" ..." if len(missing) > 30 else ""))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--csv", required=True, help="v2 output CSV path (Gen 3 national 1..386)")
    ap.add_argument("--base-stats", default="src/data/pokemon/base_stats.h", help="Path to base_stats.h")
    args = ap.parse_args()

    csv_path = Path(args.csv)
    base_stats_path = Path(args.base_stats)

    if not csv_path.exists():
        raise SystemExit(f"CSV not found: {csv_path}")
    if not base_stats_path.exists():
        raise SystemExit(f"base_stats.h not found: {base_stats_path}")

    mapping = read_csv_stats(csv_path)
    apply_to_base_stats(base_stats_path, mapping)


if __name__ == "__main__":
    main()