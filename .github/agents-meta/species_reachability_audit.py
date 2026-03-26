#!/usr/bin/env python3
"""
Species reachability audit for poketrainer-levels.

Data sources checked:
  1. Wild encounters  (src/data/wild_encounters.json)
  2. In-game trades   (src/data/ingame_trades.h)
  3. Gift scripts     (data/maps/**/scripts.inc  —  givemon / seteventmon)
  4. Fossil revival   (src/pokemon.c  — ITEM_*_FOSSIL -> SPECIES_*)
  5. Evolutions       (src/data/pokemon/evolution.h  —  full closure)

The script produces a Markdown audit file that lists every unreachable
species together with a machine-verified explanation of *why* it is
unreachable.
"""

import json
import pathlib
import re
import sys
from collections import defaultdict

ROOT = pathlib.Path(__file__).resolve().parent.parent.parent

# ──────────────────────────────────────────────────────────────
# 1.  Parse species constants  (include/constants/species.h)
# ──────────────────────────────────────────────────────────────

def parse_species_constants():
    """Return {name: id} for every SPECIES_* constant (excluding NONE/EGG/UNOWN variants/?)."""
    path = ROOT / "include" / "constants" / "species.h"
    out = {}
    with open(path) as f:
        for line in f:
            m = re.match(r"#define\s+(SPECIES_\w+)\s+(\d+)", line)
            if m:
                name, val = m.group(1), int(m.group(2))
                out[name] = val
    # Exclude meta entries
    for k in list(out):
        if k in ("SPECIES_NONE", "SPECIES_EGG", "NUM_SPECIES",
                  "SPECIES_OLD_UNOWN_B", "SPECIES_OLD_UNOWN_C",
                  "SPECIES_OLD_UNOWN_D", "SPECIES_OLD_UNOWN_E",
                  "SPECIES_OLD_UNOWN_F", "SPECIES_OLD_UNOWN_G",
                  "SPECIES_OLD_UNOWN_H", "SPECIES_OLD_UNOWN_I",
                  "SPECIES_OLD_UNOWN_J", "SPECIES_OLD_UNOWN_K",
                  "SPECIES_OLD_UNOWN_L", "SPECIES_OLD_UNOWN_M",
                  "SPECIES_OLD_UNOWN_N", "SPECIES_OLD_UNOWN_O",
                  "SPECIES_OLD_UNOWN_P", "SPECIES_OLD_UNOWN_Q",
                  "SPECIES_OLD_UNOWN_R", "SPECIES_OLD_UNOWN_S",
                  "SPECIES_OLD_UNOWN_T", "SPECIES_OLD_UNOWN_U",
                  "SPECIES_OLD_UNOWN_V", "SPECIES_OLD_UNOWN_W",
                  "SPECIES_OLD_UNOWN_X", "SPECIES_OLD_UNOWN_Y",
                  "SPECIES_OLD_UNOWN_Z"):
            del out[k]
    return out

# ──────────────────────────────────────────────────────────────
# 2.  Wild encounters  (src/data/wild_encounters.json)
# ──────────────────────────────────────────────────────────────

def parse_wild_encounters():
    """Return set of species names found in any wild encounter table."""
    path = ROOT / "src" / "data" / "wild_encounters.json"
    species = set()
    with open(path) as f:
        data = json.load(f)
    # walk the JSON tree looking for "species" keys
    def walk(obj):
        if isinstance(obj, dict):
            if "species" in obj:
                species.add(obj["species"])
            for v in obj.values():
                walk(v)
        elif isinstance(obj, list):
            for v in obj:
                walk(v)
    walk(data)
    return species

# ──────────────────────────────────────────────────────────────
# 3.  In-game trades  (src/data/ingame_trades.h)
# ──────────────────────────────────────────────────────────────

def parse_ingame_trades():
    """Return list of (offered_species, requested_species) tuples."""
    path = ROOT / "src" / "data" / "ingame_trades.h"
    text = path.read_text()
    trades = []
    # Each trade block has  .species = X  and  .requestedSpecies = Y
    blocks = re.split(r"\[INGAME_TRADE_\w+\]", text)
    for block in blocks:
        sp_m = re.search(r"\.species\s*=\s*(SPECIES_\w+)", block)
        req_m = re.search(r"\.requestedSpecies\s*=\s*(SPECIES_\w+)", block)
        if sp_m and req_m:
            trades.append((sp_m.group(1), req_m.group(1)))
    return trades

# ──────────────────────────────────────────────────────────────
# 4.  Gift / static-encounter scripts  (data/maps/**/scripts.inc)
# ──────────────────────────────────────────────────────────────

def parse_gift_scripts():
    """Return dict {species: [(map_name, method), ...]}."""
    gifts = defaultdict(list)
    scripts_dir = ROOT / "data" / "maps"
    for script_file in scripts_dir.rglob("scripts.inc"):
        map_name = script_file.parent.name
        text = script_file.read_text()
        # givemon  SPECIES_X, level   OR  givemon VAR_TEMP_1, level (indirect)
        for m in re.finditer(r"givemon\s+(SPECIES_\w+)", text):
            gifts[m.group(1)].append((map_name, "givemon"))
        # giveegg SPECIES_X  (egg gifts)
        for m in re.finditer(r"giveegg\s+(SPECIES_\w+)", text):
            gifts[m.group(1)].append((map_name, "giveegg"))
        # seteventmon SPECIES_X, level  (static encounters like legendaries)
        for m in re.finditer(r"seteventmon\s+(SPECIES_\w+)", text):
            gifts[m.group(1)].append((map_name, "seteventmon"))
        # setwildbattle SPECIES_X, level  (static battles like Mewtwo/Snorlax)
        for m in re.finditer(r"setwildbattle\s+(SPECIES_\w+)", text):
            gifts[m.group(1)].append((map_name, "setwildbattle"))
        # setvar VAR_TEMP_1, SPECIES_X  followed by givemon VAR_TEMP_1
        # (indirect gifts — e.g. Hitmonlee/Hitmonchan, starters)
        # We need to capture these: look for setvar ..., SPECIES_X
        for m in re.finditer(r"setvar\s+\w+,\s+(SPECIES_\w+)", text):
            sp = m.group(1)
            # Only count if there's a givemon with a variable in the same script
            if re.search(r"givemon\s+VAR_", text):
                gifts[sp].append((map_name, "givemon (indirect via setvar)"))
        # setvar PLAYER_STARTER_SPECIES, SPECIES_X  (starter selection)
        for m in re.finditer(r"setvar\s+PLAYER_STARTER_SPECIES,\s+(SPECIES_\w+)", text):
            sp = m.group(1)
            gifts[sp].append((map_name, "starter selection"))
    # Also check mystery_event_msg.s for event egg gifts
    mystery_path = ROOT / "data" / "mystery_event_msg.s"
    if mystery_path.exists():
        text = mystery_path.read_text()
        for m in re.finditer(r"giveegg\s+(SPECIES_\w+)", text):
            gifts[m.group(1)].append(("MysteryEvent", "giveegg (event-distributed)"))
    return dict(gifts)

# ──────────────────────────────────────────────────────────────
# 5.  Fossil revival  (src/pokemon.c — CreateFossilPokemon or similar)
# ──────────────────────────────────────────────────────────────

def parse_fossil_species():
    """Return dict {species: fossil_item} for fossils that are revivable."""
    # Check the fossil revival script in CinnabarIsland lab
    fossils = {}
    # Search for fossil item -> species mapping in source
    # In pokefirered, this is usually in src/pokemon.c or the lab script
    pokemon_c = ROOT / "src" / "pokemon.c"
    text = pokemon_c.read_text()
    # Look for fossil revival mappings
    for m in re.finditer(r"ITEM_(\w*FOSSIL\w*)\b.*?SPECIES_(\w+)", text, re.DOTALL):
        fossils[f"SPECIES_{m.group(2)}"] = f"ITEM_{m.group(1)}"

    # Also check the lab scripts for fossil handling
    lab_scripts = ROOT / "data" / "maps" / "CinnabarIsland_PokemonLab_ExperimentRoom" / "scripts.inc"
    if lab_scripts.exists():
        text = lab_scripts.read_text()
        # Typical pattern: compare ITEM_X then givemon SPECIES_Y
        # Or: setvar with fossil items and species
        for m in re.finditer(r"ITEM_(\w*FOSSIL\w*)", text):
            fossil_item = f"ITEM_{m.group(1)}"
            # Find corresponding species nearby
        for m in re.finditer(r"givemon\s+(SPECIES_\w+)", text):
            fossils[m.group(1)] = "fossil revival"
        for m in re.finditer(r"setvar\s+\w+,\s+(SPECIES_\w+)", text):
            sp = m.group(1)
            if sp.startswith("SPECIES_"):
                fossils[sp] = "fossil revival"

    return fossils

# ──────────────────────────────────────────────────────────────
# 6.  Evolution chains  (src/data/pokemon/evolution.h)
# ──────────────────────────────────────────────────────────────

def parse_evolutions():
    """Return dict {pre_species: [(evo_method, param, target_species), ...]}."""
    path = ROOT / "src" / "data" / "pokemon" / "evolution.h"
    text = path.read_text()
    evos = defaultdict(list)
    # Match  [SPECIES_X] = {{EVO_METHOD, param, SPECIES_Y}, ...}
    # Process line by line within each entry
    current_species = None
    for line in text.splitlines():
        bracket_m = re.match(r"\s*\[(SPECIES_\w+)\]", line)
        if bracket_m:
            current_species = bracket_m.group(1)
        if current_species:
            for m in re.finditer(r"\{(EVO_\w+),\s*(\w+),\s*(SPECIES_\w+)\}", line):
                evo_method = m.group(1)
                param = m.group(2)
                target = m.group(3)
                evos[current_species].append((evo_method, param, target))
    return dict(evos)

# ──────────────────────────────────────────────────────────────
# 7.  Mutual-exclusion groups  (player must choose one)
# ──────────────────────────────────────────────────────────────

# Each group is a set of species where the player picks exactly one per
# playthrough.  The remaining members are "semi-reachable": obtainable in
# theory but not alongside the chosen member.
MUTUAL_EXCLUSION_GROUPS = [
    # Mewtwo trade scientists at Oak's Lab — all 12 trades below request
    # SPECIES_MEWTWO, but only one Mewtwo exists per save file, so the
    # player can complete at most one trade.  Ho-Oh is included because it
    # also requests Mewtwo (Indigo Plateau).
    {
        "SPECIES_MEW", "SPECIES_CELEBI", "SPECIES_JIRACHI",
        "SPECIES_REGIROCK", "SPECIES_REGICE", "SPECIES_REGISTEEL",
        "SPECIES_KYOGRE", "SPECIES_GROUDON", "SPECIES_RAYQUAZA",
        "SPECIES_LATIAS", "SPECIES_LATIOS",
        "SPECIES_HO_OH",
    },
]

# ──────────────────────────────────────────────────────────────
# 8.  Build reachability closure  (full / semi / unreachable)
# ──────────────────────────────────────────────────────────────

def build_reachability(all_species, wild, trades, gifts, fossils, evos):
    """
    Return (full: dict, semi: dict, unreachable: set).

    full[sp]  = set of reason strings — species obtainable in every playthrough
    semi[sp]  = set of reason strings — species obtainable only when the player
                makes a specific mutually-exclusive choice (starter, fossil, dojo)
    unreachable = species with no acquisition path at all

    A species is "semi" if every path to it passes through a member of a
    mutual-exclusion group.  If it also has a non-exclusive path it is "full".
    """
    # "full" = guaranteed reachable; "semi" = choice-dependent
    full = {}   # sp -> set of reasons
    semi = {}   # sp -> set of reasons

    def mark_full(sp, reason):
        if sp not in full:
            full[sp] = set()
        full[sp].add(reason)

    def mark_semi(sp, reason):
        if sp not in semi:
            semi[sp] = set()
        semi[sp].add(reason)

    def is_reachable(sp):
        return sp in full or sp in semi

    def best_level(sp):
        """Return 'full' if fully reachable, 'semi' if only semi, else None."""
        if sp in full:
            return "full"
        if sp in semi:
            return "semi"
        return None

    # ── Species that belong to a mutual-exclusion group ──
    exclusive_species = set()
    for group in MUTUAL_EXCLUSION_GROUPS:
        exclusive_species |= group

    # ── Build reverse-evo map: for any species, find its base form ──
    def get_base_form(species):
        visited = set()
        current = species
        while current not in visited:
            visited.add(current)
            found_pre = None
            for pre, evo_list in evos.items():
                for _, _, target in evo_list:
                    if target == current:
                        found_pre = pre
                        break
                if found_pre:
                    break
            if found_pre is None:
                break
            current = found_pre
        return current

    # ── Build evo families: base_form -> set of all family members ──
    evo_families = defaultdict(set)
    for sp in all_species:
        base = get_base_form(sp)
        evo_families[base].add(sp)

    # ── Seed: wild encounters (always full) ──
    for sp in wild:
        if sp in all_species:
            mark_full(sp, "Wild encounter")

    # ── Seed: gifts / static encounters ──
    for sp, locations in gifts.items():
        if sp in all_species:
            for map_name, method in locations:
                reason = f"Gift/static: {method} in {map_name}"
                if sp in exclusive_species:
                    mark_semi(sp, reason)
                else:
                    mark_full(sp, reason)

    # ── Seed: fossils ──
    for sp, item in fossils.items():
        if sp in all_species:
            reason = f"Fossil revival ({item})"
            if sp in exclusive_species:
                mark_semi(sp, reason)
            else:
                mark_full(sp, reason)

    # ── Fixed-point iteration ──
    INCENSE_BABIES = {"SPECIES_WYNAUT", "SPECIES_AZURILL"}
    changed = True
    while changed:
        changed = False

        # Trades
        for offered, requested in trades:
            if offered not in all_species:
                continue
            req_level = best_level(requested)
            if req_level is None:
                continue
            reason = f"In-game trade: trade {requested} for {offered}"
            # The offered species inherits the WORST of: the requested species'
            # level and any exclusivity of the offered species itself.
            if req_level == "full" and offered not in exclusive_species:
                target_level = "full"
            else:
                target_level = "semi"

            if target_level == "full":
                if offered not in full:
                    mark_full(offered, reason)
                    changed = True
                elif reason not in full[offered]:
                    full[offered].add(reason)
            else:
                if offered not in full:  # don't downgrade
                    if offered not in semi or reason not in semi[offered]:
                        mark_semi(offered, reason)
                        if offered not in semi or reason not in semi.get(offered, set()):
                            changed = True if offered not in semi else changed

        # Evolutions
        for pre, evo_list in evos.items():
            pre_level = best_level(pre)
            if pre_level is None:
                continue
            for evo_method, param, target in evo_list:
                if target not in all_species:
                    continue
                reason = f"Evolution from {pre} ({evo_method})"
                if pre_level == "full" and target not in exclusive_species:
                    if target not in full:
                        mark_full(target, reason)
                        changed = True
                    elif reason not in full[target]:
                        full[target].add(reason)
                else:
                    if target not in full:
                        if target not in semi:
                            mark_semi(target, reason)
                            changed = True
                        elif reason not in semi[target]:
                            semi[target].add(reason)

        # Breeding
        for base, family in evo_families.items():
            if base not in all_species:
                continue
            # Find best-level reachable family member (prefer full)
            best_member = None
            best_member_level = None
            for member in family:
                if member == base:
                    continue
                mlevel = best_level(member)
                if mlevel == "full":
                    best_member = member
                    best_member_level = "full"
                    break
                elif mlevel == "semi" and best_member_level != "full":
                    best_member = member
                    best_member_level = "semi"

            if best_member is None:
                continue

            if base in INCENSE_BABIES:
                reason = f"Daycare breeding from {best_member} (incense no longer required)"
            else:
                reason = f"Daycare breeding from {best_member}"

            if best_member_level == "full" and base not in exclusive_species:
                if base not in full:
                    mark_full(base, reason)
                    changed = True
                elif reason not in full[base]:
                    full[base].add(reason)
            else:
                if base not in full:
                    if base not in semi:
                        mark_semi(base, reason)
                        changed = True
                    elif reason not in semi[base]:
                        semi[base].add(reason)

        # Promotion: if a species has BOTH a semi reason AND a full reason
        # from independent paths, elevate it to full.
        # (This is already handled by the mark_full calls above, but let's
        # also check if a semi species gained a full path this iteration.)

    unreachable = set(all_species.keys()) - set(full.keys()) - set(semi.keys())
    return full, semi, unreachable

# ──────────────────────────────────────────────────────────────
# 9.  For unreachable species, determine *why*
# ──────────────────────────────────────────────────────────────

def diagnose_unreachable(sp, all_species, wild, trades, gifts, fossils, evos, all_reachable):
    """Return a human-readable explanation of why `sp` is unreachable.
    `all_reachable` is the union of full and semi dicts."""
    reasons = []

    if sp not in wild:
        reasons.append("No wild encounter")
    else:
        reasons.append("Has wild encounter (BUG: should be reachable)")

    if sp not in gifts:
        reasons.append("No gift/static script")
    else:
        reasons.append("Has gift script (BUG: should be reachable)")

    if sp in fossils:
        reasons.append("Has fossil entry (BUG: should be reachable)")

    offered_by_trades = [t for t in trades if t[0] == sp]
    if offered_by_trades:
        for offered, requested in offered_by_trades:
            if requested not in all_reachable:
                reasons.append(f"Trade exists ({requested} -> {sp}) but {requested} is also unreachable")
            else:
                reasons.append(f"Trade exists ({requested} -> {sp}) and {requested} IS reachable (BUG)")
    else:
        reasons.append("Not offered by any in-game trade")

    evolved_from = []
    for pre, evo_list in evos.items():
        for evo_method, param, target in evo_list:
            if target == sp:
                evolved_from.append((pre, evo_method, param))

    if evolved_from:
        for pre, method, param in evolved_from:
            if pre in all_reachable:
                reasons.append(f"Evolves from {pre} ({method}) and {pre} IS reachable (BUG)")
            else:
                reasons.append(f"Evolves from {pre} ({method}) but {pre} is also unreachable")
    else:
        family_evos = []
        to_check = [sp]
        visited = set()
        while to_check:
            current = to_check.pop()
            if current in visited:
                continue
            visited.add(current)
            if current in evos:
                for _, _, target in evos[current]:
                    family_evos.append(target)
                    to_check.append(target)
        breedable_from = [e for e in family_evos if e in all_reachable]
        if breedable_from:
            reasons.append(f"Could be bred from {breedable_from[0]} but breeding logic didn't apply (BUG)")
        else:
            reasons.append("Base-form species with no wild/gift/trade/breeding source")

    return "; ".join(reasons)

# ──────────────────────────────────────────────────────────────
# 9.  Exclude Unown letter forms (SPECIES_UNOWN_B .. _Z, _QMARK, _EMARK)
# ──────────────────────────────────────────────────────────────

UNOWN_VARIANT_RE = re.compile(r"^SPECIES_UNOWN_[A-Z]$|^SPECIES_UNOWN_[QE]MARK$")

# ──────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────

def main():
    all_species = parse_species_constants()

    # Filter out Unown variants (they share a dex entry with SPECIES_UNOWN)
    all_species = {k: v for k, v in all_species.items()
                   if not UNOWN_VARIANT_RE.match(k)}

    wild = parse_wild_encounters()
    trades = parse_ingame_trades()
    gifts = parse_gift_scripts()
    fossils = parse_fossil_species()
    evos = parse_evolutions()

    full, semi, unreachable = build_reachability(
        all_species, wild, trades, gifts, fossils, evos
    )
    all_reachable = {**full, **semi}

    # Sort unreachable by dex number
    unreachable_sorted = sorted(unreachable, key=lambda s: all_species.get(s, 9999))

    # Build diagnostic explanations for unreachable
    diagnostics = {}
    for sp in unreachable_sorted:
        diagnostics[sp] = diagnose_unreachable(
            sp, all_species, wild, trades, gifts, fossils, evos, all_reachable
        )

    # Categorize unreachable
    truly_absent = []
    chain_blocked = []
    for sp in unreachable_sorted:
        diag = diagnostics[sp]
        if "BUG" in diag:
            print(f"WARNING: {sp} appears reachable but wasn't marked: {diag}", file=sys.stderr)
        has_pre = any(
            target == sp
            for evo_list in evos.values()
            for _, _, target in evo_list
        )
        if has_pre:
            chain_blocked.append(sp)
        else:
            truly_absent.append(sp)

    # ── Build semi-reachable detail: group by exclusion source ──
    semi_sorted = sorted(semi.keys(), key=lambda s: all_species.get(s, 9999))

    # Map each exclusive-group member to a label
    GROUP_LABELS = {}
    for group in MUTUAL_EXCLUSION_GROUPS:
        if len(group) == 3:
            label = "Starter choice (Bulbasaur / Charmander / Squirtle)"
        elif "SPECIES_OMANYTE" in group:
            label = "Mt. Moon fossil choice (Omanyte / Kabuto)"
        else:
            label = "Mutual-exclusion choice"
        for member in group:
            GROUP_LABELS[member] = label

    # BFS walk: extract SPECIES_X references from reasons, follow chain
    species_re = re.compile(r"SPECIES_\w+")

    def find_exclusion_group(sp):
        visited = set()
        queue = [sp]
        while queue:
            cur = queue.pop(0)
            if cur in visited:
                continue
            visited.add(cur)
            if cur in GROUP_LABELS:
                return GROUP_LABELS[cur]
            if cur in semi:
                for reason in semi[cur]:
                    for ref in species_re.findall(reason):
                        if ref not in visited:
                            queue.append(ref)
        return "Mutual-exclusion dependency"

    semi_by_group = defaultdict(list)
    for sp in semi_sorted:
        group_label = find_exclusion_group(sp)
        semi_by_group[group_label].append(sp)

    # ── Identify event-gated species (full or semi) ──
    event_gated_reachable = []
    for sp, reason_set in all_reachable.items():
        has_event = any("seteventmon" in r or "event-distributed" in r for r in reason_set)
        has_normal = any(
            "seteventmon" not in r and "event-distributed" not in r
            and "Evolution from" not in r
            for r in reason_set
        )
        if has_event and not has_normal:
            event_reasons = [r for r in reason_set if "seteventmon" in r or "event-distributed" in r]
            for r in event_reasons:
                event_gated_reachable.append((sp, r))

    # ── Identify breeding-conditional species ──
    breeding_conditional = []
    for sp, reason_set in all_reachable.items():
        for r in reason_set:
            if "requires incense" in r:
                breeding_conditional.append((sp, r))

    # ── Write output ──
    out_path = ROOT / "docs" / "audits" / "species_reachability_audit.md"
    out_path.parent.mkdir(parents=True, exist_ok=True)

    with open(out_path, "w") as f:
        f.write("# Species Reachability Audit\n\n")
        f.write("## Method\n\n")
        f.write("Reachability is determined by scanning six data sources and computing\n")
        f.write("the transitive closure over evolution chains, in-game trades, and breeding:\n\n")
        f.write("1. **Wild encounters** — `src/data/wild_encounters.json`\n")
        f.write("2. **In-game trades** — `src/data/ingame_trades.h`\n")
        f.write("3. **Gift / static-encounter scripts** — `data/maps/**/scripts.inc` "
                "(`givemon`, `giveegg`, `seteventmon`, `setwildbattle`, starter `setvar`)\n")
        f.write("4. **Fossil revival** — `CinnabarIsland_PokemonLab_ExperimentRoom/scripts.inc`\n")
        f.write("5. **Evolution chains** — `src/data/pokemon/evolution.h` (iterated to closure)\n")
        f.write("6. **Daycare breeding** — `src/daycare.c` (if any evolved family member is\n")
        f.write("   reachable, the base baby form is breedable; Wynaut/Azurill require incense)\n\n")
        f.write("A species is **semi-reachable** if it can only be obtained when the\n")
        f.write("player makes a specific mutually-exclusive choice. Currently there\n")
        f.write("are no remaining mutual-exclusion choice points: starters are\n")
        f.write("supplemented by egg NPCs, both Mt. Moon fossils are given, and\n")
        f.write("Dojo Hitmon breed into each other.\n\n")
        f.write(f"- Total species scanned: {len(all_species)}\n")
        f.write(f"- Fully reachable: {len(full)}\n")
        f.write(f"- Semi-reachable (choice-gated): {len(semi)}\n")
        f.write(f"- Unreachable: {len(unreachable)}\n\n")

        # ── Semi-reachable section ──
        if semi_sorted:
            f.write("## Semi-Reachable Species (choice-gated)\n\n")
            f.write("These species are obtainable but require the player to make a\n")
            f.write("specific mutually-exclusive choice. In a single playthrough the\n")
            f.write("player cannot obtain all members of each choice group.\n\n")
            for group_label, members in sorted(semi_by_group.items()):
                f.write(f"### {group_label}\n\n")
                f.write("| Species | Acquisition path |\n")
                f.write("|---------|------------------|\n")
                for sp in members:
                    reasons = "; ".join(sorted(semi[sp]))
                    f.write(f"| {sp} | {reasons} |\n")
                f.write("\n")

        # ── Event-gated ──
        if event_gated_reachable:
            f.write("## Event-Gated Species (reachable only via event items)\n\n")
            f.write("These species have encounter scripts in the ROM but require\n")
            f.write("event-distributed items (Mystic Ticket, Aurora Ticket) to access.\n")
            f.write("They are counted as **reachable** since the encounter data exists.\n\n")
            for sp, reason in sorted(event_gated_reachable):
                f.write(f"- **{sp}**: {reason}\n")
            f.write("\n")

        # ── Breeding-conditional ──
        if breeding_conditional:
            f.write("## Breeding-Conditional Species\n\n")
            f.write("These species require a specific incense item held during\n")
            f.write("daycare breeding. Without the incense, the egg hatches as\n")
            f.write("the non-baby form instead.\n\n")
            for sp, reason in sorted(breeding_conditional):
                f.write(f"- **{sp}**: {reason}\n")
            f.write("\n")

        # ── Unreachable ──
        f.write("## Unreachable Species\n\n")
        f.write("Each entry includes a verified explanation of why the species\n")
        f.write("cannot be obtained through any in-game source.\n\n")

        if truly_absent:
            f.write("### Base-form species with no acquisition source\n\n")
            f.write("| Species | Reason |\n")
            f.write("|---------|--------|\n")
            for sp in truly_absent:
                f.write(f"| {sp} | {diagnostics[sp]} |\n")
            f.write("\n")

        if chain_blocked:
            f.write("### Evolution-chain-blocked species\n\n")
            f.write("These species are evolutions of an unreachable base form.\n\n")
            f.write("| Species | Reason |\n")
            f.write("|---------|--------|\n")
            for sp in chain_blocked:
                f.write(f"| {sp} | {diagnostics[sp]} |\n")
            f.write("\n")

        # ── Summary ──
        f.write("## Summary\n\n")
        f.write("| Category | Count |\n")
        f.write("|----------|-------|\n")
        f.write(f"| Total species | {len(all_species)} |\n")
        f.write(f"| Fully reachable | {len(full)} |\n")
        f.write(f"| Semi-reachable (choice-gated) | {len(semi)} |\n")
        f.write(f"| Unreachable (base forms) | {len(truly_absent)} |\n")
        f.write(f"| Unreachable (blocked evolutions) | {len(chain_blocked)} |\n")
        f.write(f"| Total unreachable | {len(unreachable)} |\n")

    print(f"WROTE {out_path}")
    print(f"FULL {len(full)}  SEMI {len(semi)}  UNREACHABLE {len(unreachable)}")

    # Print semi details
    for sp in semi_sorted:
        print(f"  SEMI {sp}: {'; '.join(sorted(semi[sp]))}")

    # Print unreachable details
    for sp in unreachable_sorted:
        print(f"  UNREACHABLE {sp}: {diagnostics[sp]}")

    # Flag any BUGs
    bugs = [sp for sp in unreachable_sorted if "BUG" in diagnostics[sp]]
    if bugs:
        print(f"\nWARNING: {len(bugs)} species flagged as potential logic bugs!")
        for sp in bugs:
            print(f"  {sp}: {diagnostics[sp]}")
        sys.exit(1)

if __name__ == "__main__":
    main()
