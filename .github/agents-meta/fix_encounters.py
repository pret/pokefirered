#!/usr/bin/env python3
"""
Modify wild_encounters.json to add all planned Gen 3 species.
Each encounter type has FIXED slot counts:
  - land_mons: 12 slots (20%, 20%, 10%, 10%, 10%, 10%, 5%, 5%, 4%, 4%, 1%, 1%)
  - fishing_mons: 10 slots (Old Rod: 0-1, Good Rod: 2-4, Super Rod: 5-9)
  - water_mons: 5 slots
We replace existing entries in specific slots.
"""

import json
import sys

INPUT = "src/data/wild_encounters.json"

def modify_slot(encounters, map_name, enc_type, slot_idx, species, min_level, max_level):
    """Find a map entry and replace a specific slot."""
    found = False
    for entry in encounters:
        if entry.get("map") == map_name:
            if enc_type in entry:
                mons = entry[enc_type]["mons"]
                if slot_idx < len(mons):
                    old = mons[slot_idx]["species"]
                    mons[slot_idx]["species"] = species
                    mons[slot_idx]["min_level"] = min_level
                    mons[slot_idx]["max_level"] = max_level
                    found = True
                    print(f"  {map_name} {enc_type}[{slot_idx}]: {old} -> {species} (Lv {min_level}-{max_level})")
                else:
                    print(f"  WARNING: {map_name} {enc_type} has only {len(mons)} slots, tried slot {slot_idx}", file=sys.stderr)
            else:
                print(f"  WARNING: {map_name} has no {enc_type}", file=sys.stderr)
    if not found:
        print(f"  ERROR: Could not find {map_name}", file=sys.stderr)

def main():
    with open(INPUT, "r") as f:
        data = json.load(f)

    # Process all encounter groups (FireRed and LeafGreen)
    for group in data["wild_encounter_groups"]:
        group_label = group.get("label", "unknown")
        print(f"\n=== Processing group: {group_label} ===")
        enc = group["encounters"]

        # 1. FEEBAS - Pallet Town fishing slot 1 (Old Rod)
        modify_slot(enc, "MAP_PALLET_TOWN", "fishing_mons", 1,
                    "SPECIES_FEEBAS", 2, 5)

        # 2. NINCADA - Viridian Forest land slot 7 (5% rate, was Kakuna)
        modify_slot(enc, "MAP_VIRIDIAN_FOREST", "land_mons", 7,
                    "SPECIES_NINCADA", 4, 4)

        # 3. SNUBBULL - Route 1 land slot 7 (5% rate, was Rattata)
        modify_slot(enc, "MAP_ROUTE1", "land_mons", 7,
                    "SPECIES_SNUBBULL", 3, 3)

        # 4. POOCHYENA - Route 3 land slot 8 (4% rate, was Nidoran_F)
        modify_slot(enc, "MAP_ROUTE3", "land_mons", 8,
                    "SPECIES_POOCHYENA", 6, 6)

        # 5. SPOINK - Route 3 land slot 9 (4% rate, was Jigglypuff)
        modify_slot(enc, "MAP_ROUTE3", "land_mons", 9,
                    "SPECIES_SPOINK", 6, 6)

        # 6. TRAPINCH - Mt. Moon 1F land slot 9 (4% rate, was Zubat)
        modify_slot(enc, "MAP_MT_MOON_1F", "land_mons", 9,
                    "SPECIES_TRAPINCH", 8, 8)

        # 7. MAWILE - Rock Tunnel 1F land slot 10 (1% rate, was Geodude)
        modify_slot(enc, "MAP_ROCK_TUNNEL_1F", "land_mons", 10,
                    "SPECIES_MAWILE", 15, 15)

        # 8-12. Pokemon Tower ghosts + Houndour
        # Tower 3F: SHUPPET (slot 8, 4%), DUSKULL (slot 10, 1%)
        modify_slot(enc, "MAP_POKEMON_TOWER_3F", "land_mons", 8,
                    "SPECIES_SHUPPET", 15, 15)
        modify_slot(enc, "MAP_POKEMON_TOWER_3F", "land_mons", 10,
                    "SPECIES_DUSKULL", 15, 15)

        # Tower 4F: HOUNDOUR (slot 8, 4%), SABLEYE (slot 10, 1%)
        modify_slot(enc, "MAP_POKEMON_TOWER_4F", "land_mons", 8,
                    "SPECIES_HOUNDOUR", 17, 17)
        modify_slot(enc, "MAP_POKEMON_TOWER_4F", "land_mons", 10,
                    "SPECIES_SABLEYE", 17, 17)

        # Tower 5F: SHUPPET (slot 8, 4%), DUSKULL (slot 10, 1%)
        modify_slot(enc, "MAP_POKEMON_TOWER_5F", "land_mons", 8,
                    "SPECIES_SHUPPET", 17, 17)
        modify_slot(enc, "MAP_POKEMON_TOWER_5F", "land_mons", 10,
                    "SPECIES_DUSKULL", 17, 17)

        # Tower 6F: HOUNDOUR (slot 8, 4%), SABLEYE (slot 10, 1%)
        modify_slot(enc, "MAP_POKEMON_TOWER_6F", "land_mons", 8,
                    "SPECIES_HOUNDOUR", 18, 18)
        modify_slot(enc, "MAP_POKEMON_TOWER_6F", "land_mons", 10,
                    "SPECIES_SABLEYE", 18, 18)

        # Tower 7F: SHUPPET (slot 8, 4%), DUSKULL (slot 10, 1%)
        modify_slot(enc, "MAP_POKEMON_TOWER_7F", "land_mons", 8,
                    "SPECIES_SHUPPET", 18, 18)
        modify_slot(enc, "MAP_POKEMON_TOWER_7F", "land_mons", 10,
                    "SPECIES_DUSKULL", 18, 18)

        # 13-14. SNEASEL + SNORUNT - Seafoam Islands B3F land
        # B3F slot 9 (4%, was Golbat) -> SNEASEL
        modify_slot(enc, "MAP_SEAFOAM_ISLANDS_B3F", "land_mons", 9,
                    "SPECIES_SNEASEL", 30, 30)
        # B3F slot 10 (1%, was Dewgong) -> SNORUNT
        modify_slot(enc, "MAP_SEAFOAM_ISLANDS_B3F", "land_mons", 10,
                    "SPECIES_SNORUNT", 30, 30)

        # Also add on B1F for better encounter rates
        # B1F slot 9 (4%, was Zubat) -> SNEASEL
        modify_slot(enc, "MAP_SEAFOAM_ISLANDS_B1F", "land_mons", 9,
                    "SPECIES_SNEASEL", 28, 28)
        # B1F slot 10 (1%, was Slowbro) -> SNORUNT
        modify_slot(enc, "MAP_SEAFOAM_ISLANDS_B1F", "land_mons", 10,
                    "SPECIES_SNORUNT", 28, 28)

        # 15. BAGON - Safari Zone Center land slot 10 (1%, was Venonat)
        modify_slot(enc, "MAP_SAFARI_ZONE_CENTER", "land_mons", 10,
                    "SPECIES_BAGON", 25, 25)

        # 16. HERACROSS - Safari Zone North land slot 10 (1%, was Paras)
        # slot 8 index (which is actually the 9th mon, 4% rate)
        modify_slot(enc, "MAP_SAFARI_ZONE_NORTH", "land_mons", 8,
                    "SPECIES_HERACROSS", 26, 26)

        # 17. SKARMORY - Victory Road 2F land slot 10 (1%, was Machoke)
        modify_slot(enc, "MAP_VICTORY_ROAD_2F", "land_mons", 10,
                    "SPECIES_SKARMORY", 44, 44)

        # 18. MURKROW - Route 16 land slot 10 (1%, was Rattata)
        modify_slot(enc, "MAP_ROUTE16", "land_mons", 10,
                    "SPECIES_MURKROW", 20, 20)

        # 19. NATU - Route 24 land slot 10 (1%, was Metapod)
        modify_slot(enc, "MAP_ROUTE24", "land_mons", 10,
                    "SPECIES_NATU", 10, 10)

        # 20. SLUGMA - Route 8 land slot 10 (1%, was Sandshrew)
        # Gives earlier access than Mt. Ember (postgame)
        modify_slot(enc, "MAP_ROUTE8", "land_mons", 10,
                    "SPECIES_SLUGMA", 18, 18)

    # Write back
    with open(INPUT, "w") as f:
        json.dump(data, f, indent=2)
        f.write("\n")

    print("\nDone! All encounters updated.")

if __name__ == "__main__":
    main()
