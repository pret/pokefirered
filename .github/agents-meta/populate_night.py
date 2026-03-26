#!/usr/bin/env python3
"""Populate Night encounters with missing Gen 2/3 Pokemon families."""
import json
import copy

with open('src/data/wild_encounters.json') as f:
    data = json.load(f)

# Replacement table: for each Night map, specify which slot indices to replace
# and what species/levels to use. Slots 0-1 are 20% each, 2-3 10%, 4-5 10%, 
# 6-7 5%, 8-9 4%, 10-11 1% (rare).
# We'll replace specific slots in Night land_mons to add missing species.
# Strategy: replace lower-value duplicate species with new Gen 2/3 species,
# keeping levels appropriate for the area.

def find_entry(label):
    """Find a Night encounter entry by exact label."""
    for group in data['wild_encounter_groups']:
        for entry in group['encounters']:
            if entry.get('base_label', '') == label:
                return entry
    return None

def replace_land_slot(entry, slot_idx, species, min_level, max_level):
    """Replace a land_mons slot with a new species."""
    if 'land_mons' in entry and slot_idx < len(entry['land_mons']['mons']):
        entry['land_mons']['mons'][slot_idx]['species'] = f'SPECIES_{species}'
        entry['land_mons']['mons'][slot_idx]['min_level'] = min_level
        entry['land_mons']['mons'][slot_idx]['max_level'] = max_level

def replace_water_slot(entry, slot_idx, species, min_level, max_level):
    if 'water_mons' in entry and slot_idx < len(entry['water_mons']['mons']):
        entry['water_mons']['mons'][slot_idx]['species'] = f'SPECIES_{species}'
        entry['water_mons']['mons'][slot_idx]['min_level'] = min_level
        entry['water_mons']['mons'][slot_idx]['max_level'] = max_level

def replace_fishing_slot(entry, slot_idx, species, min_level, max_level):
    if 'fishing_mons' in entry and slot_idx < len(entry['fishing_mons']['mons']):
        entry['fishing_mons']['mons'][slot_idx]['species'] = f'SPECIES_{species}'
        entry['fishing_mons']['mons'][slot_idx]['min_level'] = min_level
        entry['fishing_mons']['mons'][slot_idx]['max_level'] = max_level

# ============================================================
# ROUTE 1 (Lv2-5): Add ZIGZAGOON, HOOTHOOT, WURMPLE
# ============================================================
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute1_Night':
            replace_land_slot(entry, 2, 'ZIGZAGOON', 2, 3)   # 10% slot
            replace_land_slot(entry, 4, 'HOOTHOOT', 2, 4)     # 10% slot
            replace_land_slot(entry, 6, 'WURMPLE', 2, 3)      # 5% slot
            break

# ROUTE 2 (Lv2-5): Add SEEDOT, LOTAD
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute2_Night':
            replace_land_slot(entry, 3, 'SEEDOT', 3, 5)
            replace_land_slot(entry, 5, 'LOTAD', 3, 5)
            replace_land_slot(entry, 7, 'TAILLOW', 3, 5)
            break

# ROUTE 3 (Lv3-8): Add RALTS, SHROOMISH, SURSKIT
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute3_Night':
            replace_land_slot(entry, 4, 'RALTS', 4, 6)
            replace_land_slot(entry, 6, 'SHROOMISH', 4, 7)
            replace_land_slot(entry, 8, 'SURSKIT', 5, 7)
            break

# ROUTE 4 (Lv6-12): Add MAKUHITA, WHISMUR
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute4_Night':
            replace_land_slot(entry, 2, 'MAKUHITA', 8, 12)
            replace_land_slot(entry, 5, 'WHISMUR', 8, 12)
            break

# ROUTE 5 (Lv10-16): Add SKITTY, WINGULL
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute5_Night':
            replace_land_slot(entry, 3, 'SKITTY', 11, 14)
            replace_land_slot(entry, 5, 'WINGULL', 10, 13)
            break

# ROUTE 6 (Lv10-16): Add ELECTRIKE, GULPIN
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute6_Night':
            replace_land_slot(entry, 3, 'ELECTRIKE', 11, 14)
            replace_land_slot(entry, 5, 'GULPIN', 10, 14)
            break

# ROUTE 7 (Lv17-22): Add ROSELIA, EEVEE, PLUSLE
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute7_Night':
            replace_land_slot(entry, 4, 'ROSELIA', 17, 20)
            replace_land_slot(entry, 10, 'EEVEE', 18, 20)  # 1% rare slot
            replace_land_slot(entry, 6, 'PLUSLE', 17, 20)
            break

# ROUTE 8 (Lv15-20): Add MINUN, VOLBEAT, ILLUMISE
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute8_Night':
            replace_land_slot(entry, 4, 'MINUN', 16, 19)
            replace_land_slot(entry, 6, 'VOLBEAT', 16, 19)
            replace_land_slot(entry, 7, 'ILLUMISE', 16, 19)
            replace_land_slot(entry, 11, 'EEVEE', 17, 19)  # 1% rare
            break

# ROUTE 9 (Lv11-17): Add SLAKOTH, MEDITITE
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute9_Night':
            replace_land_slot(entry, 2, 'SLAKOTH', 12, 15)
            replace_land_slot(entry, 4, 'MEDITITE', 13, 16)
            break

# ROUTE 10 (Lv11-17): Add NOSEPASS
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute10_Night':
            replace_land_slot(entry, 4, 'NOSEPASS', 13, 16)
            break

# ROUTE 11 (Lv11-17): Add GIRAFARIG, SUDOWOODO
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute11_Night':
            replace_land_slot(entry, 2, 'GIRAFARIG', 13, 16)
            replace_land_slot(entry, 8, 'SUDOWOODO', 14, 16)
            break

# ROUTE 12 (Lv22-30): Add SPINDA, TROPIUS
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute12_Night':
            replace_land_slot(entry, 4, 'SPINDA', 23, 27)
            replace_land_slot(entry, 10, 'TROPIUS', 25, 28)
            break

# ROUTE 13 (Lv22-30): Add ZANGOOSE, SEVIPER
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute13_Night':
            replace_land_slot(entry, 4, 'ZANGOOSE', 23, 27)
            replace_land_slot(entry, 6, 'SEVIPER', 24, 28)
            break

# ROUTE 14 (Lv22-30): Add TORKOAL, MILTANK
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute14_Night':
            replace_land_slot(entry, 6, 'TORKOAL', 24, 28)
            replace_land_slot(entry, 10, 'MILTANK', 25, 28)
            break

# ROUTE 15 (Lv22-30): Add GLIGAR, CHIMECHO
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute15_Night':
            replace_land_slot(entry, 6, 'GLIGAR', 24, 28)
            replace_land_slot(entry, 10, 'CHIMECHO', 25, 28)
            break

# ROUTE 16 (Lv18-25): Add CORSOLA (unusual but variety)
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute16_Night':
            replace_land_slot(entry, 10, 'EEVEE', 19, 22)  # 1% rare
            break

# ROCK TUNNEL 1F (Lv13-17): Add ARON
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRockTunnel1F_Night':
            replace_land_slot(entry, 4, 'ARON', 14, 16)
            break

# ROCK TUNNEL B1F (Lv13-17): Add NOSEPASS extra
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRockTunnelB1F_Night':
            replace_land_slot(entry, 6, 'ARON', 14, 16)
            break

# MT MOON 1F (Lv7-10): Add WHISMUR
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sMtMoon1F_Night':
            replace_land_slot(entry, 6, 'WHISMUR', 7, 9)
            break

# VIRIDIAN FOREST (Lv3-6): Add WURMPLE, SHROOMISH
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sViridianForest_Night':
            replace_land_slot(entry, 3, 'WURMPLE', 3, 5)
            replace_land_slot(entry, 5, 'SHROOMISH', 4, 6)
            break

# SAFARI ZONE CENTER (Lv22-31): Add GIRAFARIG, SUDOWOODO, MILTANK
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sSafariZoneCenter_Night':
            replace_land_slot(entry, 6, 'GIRAFARIG', 25, 29)
            replace_land_slot(entry, 8, 'SUDOWOODO', 26, 30)
            replace_land_slot(entry, 10, 'MILTANK', 27, 30)
            break

# SAFARI ZONE EAST (Lv22-33): Add TROPIUS, ZANGOOSE
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sSafariZoneEast_Night':
            replace_land_slot(entry, 8, 'TROPIUS', 26, 31)
            replace_land_slot(entry, 10, 'ZANGOOSE', 25, 30)
            break

# SAFARI ZONE NORTH (Lv23-32): Add CORSOLA (in grass near water)
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sSafariZoneNorth_Night':
            replace_land_slot(entry, 10, 'CORSOLA', 26, 30)
            break

# VICTORY ROAD 1F (Lv32-46): Add LUNATONE, SOLROCK
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sVictoryRoad1F_Night':
            replace_land_slot(entry, 8, 'LUNATONE', 38, 44)
            replace_land_slot(entry, 10, 'SOLROCK', 38, 44)
            break

# VICTORY ROAD 2F (Lv34-48): Add ARON high level
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sVictoryRoad2F_Night':
            replace_land_slot(entry, 10, 'LUNATONE', 40, 46)
            break

# POKEMON MANSION 1F (Lv26-36): Add TORKOAL, MAGBY
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sPokemonMansion1F_Night':
            replace_land_slot(entry, 8, 'TORKOAL', 28, 34)
            replace_land_slot(entry, 10, 'MAGBY', 28, 34)
            break

# POKEMON MANSION B1F: Add MAGBY too
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sPokemonMansionB1F_Night':
            replace_land_slot(entry, 10, 'MAGBY', 30, 36)
            break

# POWER PLANT: Add ELEKID
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sPowerPlant_Night':
            replace_land_slot(entry, 8, 'ELEKID', 24, 30)
            break

# ROUTE 3 (near Mt Moon): Add IGGLYBUFF (Jigglypuff is nearby)
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute3_Night':
            replace_land_slot(entry, 10, 'IGGLYBUFF', 3, 5)
            break

# ROUTE 21 NORTH (Lv17-28): Add WINGULL
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute21North_Night':
            replace_land_slot(entry, 2, 'WINGULL', 18, 24)
            replace_land_slot(entry, 4, 'TROPIUS', 20, 26)
            replace_land_slot(entry, 6, 'LOTAD', 18, 22)
            break

# ROUTE 21 SOUTH (Lv17-28): Add more variety
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute21South_Night':
            replace_land_slot(entry, 2, 'WINGULL', 18, 24)
            replace_land_slot(entry, 4, 'SEEDOT', 18, 24)
            replace_land_slot(entry, 6, 'ROSELIA', 20, 26)
            break

# ROUTE 22 (Lv2-5): Add ZIGZAGOON
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute22_Night':
            replace_land_slot(entry, 4, 'ZIGZAGOON', 3, 5)
            break

# ROUTE 23 (Lv32-44): Add SPINDA, SOLROCK
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute23_Night':
            replace_land_slot(entry, 8, 'SPINDA', 35, 40)
            replace_land_slot(entry, 10, 'SOLROCK', 36, 42)
            break

# ROUTE 24 (Lv7-14): Add LOTAD, SURSKIT
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute24_Night':
            replace_land_slot(entry, 6, 'LOTAD', 8, 12)
            replace_land_slot(entry, 8, 'SURSKIT', 9, 13)
            break

# ROUTE 25 (Lv8-14): Add SEEDOT
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sRoute25_Night':
            replace_land_slot(entry, 6, 'SEEDOT', 9, 13)
            break

# DIGLETT'S CAVE (Lv15-31): Add BALTOY
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sDiglettsCaveB1F_Night':
            replace_land_slot(entry, 4, 'BALTOY', 18, 26)
            break

# POWER PLANT (Lv22-34): Add ELECTRIKE
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sPowerPlant_Night':
            replace_land_slot(entry, 4, 'ELECTRIKE', 24, 30)
            break

# CERULEAN CAVE 1F (Lv46-61): Rare encounters
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sCeruleanCave1F_Night':
            replace_land_slot(entry, 10, 'CHIMECHO', 48, 56)
            break

# ============================================================
# SEVII ISLANDS - Add more Gen 2/3 variety
# ============================================================

# ONE ISLAND KINDLE ROAD (Lv30-40): Add TORKOAL
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sOneIslandKindleRoad_Night':
            replace_land_slot(entry, 6, 'TORKOAL', 32, 38)
            replace_land_slot(entry, 10, 'GLIGAR', 33, 38)
            break

# TWO ISLAND CAPE BRINK (Lv30-40): Add ROSELIA, SUNKERN
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sTwoIslandCapeBrink_Night':
            replace_land_slot(entry, 6, 'ROSELIA', 32, 38)
            replace_land_slot(entry, 8, 'SUNKERN', 30, 36)
            break

# THREE ISLAND BERRY FOREST (Lv30-40): Add SLAKOTH, SHROOMISH
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sThreeIslandBerryForest_Night':
            replace_land_slot(entry, 6, 'SLAKOTH', 31, 37)
            replace_land_slot(entry, 8, 'SHROOMISH', 30, 36)
            break

# FIVE ISLAND MEADOW (Lv10-50): Add SKITTY, TAILLOW
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sFiveIslandMeadow_Night':
            replace_land_slot(entry, 6, 'SKITTY', 20, 35)
            replace_land_slot(entry, 8, 'TAILLOW', 15, 30)
            break

# SIX ISLAND WATER PATH (Lv10-50): Add GULPIN, ELECTRIKE
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sSixIslandWaterPath_Night':
            replace_land_slot(entry, 6, 'GULPIN', 20, 38)
            replace_land_slot(entry, 8, 'ELECTRIKE', 20, 38)
            break

# SIX ISLAND RUIN VALLEY (Lv15-52): Add BALTOY, CHIMECHO
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sSixIslandRuinValley_Night':
            replace_land_slot(entry, 6, 'BALTOY', 25, 42)
            replace_land_slot(entry, 10, 'CHIMECHO', 30, 48)
            break

# SEVEN ISLAND SEVAULT CANYON (Lv15-54): Add SPINDA, ZANGOOSE, SEVIPER
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sSevenIslandSevaultCanyon_Night':
            replace_land_slot(entry, 6, 'SPINDA', 25, 42)
            replace_land_slot(entry, 8, 'ZANGOOSE', 30, 48)
            replace_land_slot(entry, 10, 'SEVIPER', 30, 48)
            break

# SEVAULT CANYON ENTRANCE (Lv10-50): Add MAKUHITA
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        if entry.get('base_label') == 'sSevenIslandSevaultCanyonEntrance_Night':
            replace_land_slot(entry, 6, 'MAKUHITA', 20, 38)
            replace_land_slot(entry, 8, 'MEDITITE', 22, 40)
            break

# ============================================================
# WATER/FISHING encounters for aquatic species
# ============================================================
# Add CHINCHOU, CORSOLA, CARVANHA, WAILMER, BARBOACH, SPHEAL, CLAMPERL, RELICANTH, LUVDISC

# Route 19/20 - ocean routes, good for water species
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        label = entry.get('base_label', '')
        if '_Night' in label:
            # Add CHINCHOU to water encounters on ocean routes
            if 'Route19' in label or 'Route20' in label:
                if 'water_mons' in entry:
                    replace_water_slot(entry, 3, 'CHINCHOU', 25, 35)
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 7, 'CARVANHA', 25, 35)
                    replace_fishing_slot(entry, 9, 'WAILMER', 30, 40)

            # Seafoam Islands water
            if 'SeafoamIslands' in label:
                if 'water_mons' in entry:
                    replace_water_slot(entry, 3, 'SPHEAL', 25, 35)
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 7, 'CLAMPERL', 25, 35)

            # Sevii water routes
            if 'OneIslandKindleRoad' in label or 'OneIslandTreasureBeach' in label:
                if 'water_mons' in entry:
                    replace_water_slot(entry, 3, 'WAILMER', 30, 40)
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 7, 'LUVDISC', 25, 35)
                    replace_fishing_slot(entry, 9, 'CORSOLA', 30, 38)

            if 'TwoIslandCapeBrink' in label or 'ThreeIslandBondBridge' in label:
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 7, 'BARBOACH', 20, 30)
                    replace_fishing_slot(entry, 8, 'CORPHISH', 25, 35)
                    replace_fishing_slot(entry, 9, 'CHINCHOU', 25, 35)

            if 'FiveIsland' in label and 'water_mons' in entry:
                replace_water_slot(entry, 3, 'CHINCHOU', 25, 35)

            if 'SixIslandWaterPath' in label or 'SixIslandGreenPath' in label:
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 7, 'RELICANTH', 30, 40)
                    replace_fishing_slot(entry, 9, 'CARVANHA', 25, 35)

            if 'SevenIsland' in label and 'Tanoby' not in label:
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 7, 'CLAMPERL', 25, 35)

            # Route 12 fishing - add BARBOACH and CORPHISH
            if 'Route12' in label:
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 8, 'CORPHISH', 20, 28)
                    replace_fishing_slot(entry, 9, 'BARBOACH', 20, 28)

            # Vermilion fishing
            if 'Route6' in label or 'VermilionCity' in label:
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 9, 'BARBOACH', 15, 25)

            # Route 13-15 fishing - add CORPHISH too
            if 'Route13' in label or 'Route14' in label or 'Route15' in label:
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 8, 'CORPHISH', 22, 30)
                    replace_fishing_slot(entry, 9, 'CARVANHA', 20, 28)

            # Cerulean/Route 24/25 water
            if 'Route24' in label or 'Route25' in label:
                if 'water_mons' in entry:
                    replace_water_slot(entry, 3, 'LOTAD', 10, 15)              
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 9, 'BARBOACH', 10, 15)

            # Route 4 water/fishing (near Cerulean)
            if 'Route4' in label and 'PokemonCenter' not in label:
                if 'fishing_mons' in entry:
                    replace_fishing_slot(entry, 9, 'BARBOACH', 10, 15)

# ============================================================
# EEVEE specific additions - multiple routes for Eeveelution variety
# ============================================================
# Already added to Route 7 (slot 10, 1%) and Route 8 (slot 11, 1%)
# Let's also add to Route 16 (already done above, slot 10, 1%)

# Also add Eevee to Five Island Meadow and Safari Zone
for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        label = entry.get('base_label', '')
        if label == 'sFiveIslandMeadow_Night':
            replace_land_slot(entry, 10, 'EEVEE', 25, 35)
            break

for group in data['wild_encounter_groups']:
    for entry in group['encounters']:
        label = entry.get('base_label', '')
        if label == 'sSafariZoneWest_Night':
            replace_land_slot(entry, 10, 'EEVEE', 25, 30)
            break

# Write output
with open('src/data/wild_encounters.json', 'w') as f:
    json.dump(data, f, indent=2)
    f.write('\n')

# Verify changes
with open('src/data/wild_encounters.json') as f:
    data2 = json.load(f)
wild_new = set()
for group in data2['wild_encounter_groups']:
    for entry in group['encounters']:
        for ft in ['land_mons', 'water_mons', 'fishing_mons', 'rock_smash_mons']:
            if ft in entry:
                for mon in entry[ft]['mons']:
                    wild_new.add(mon['species'].replace('SPECIES_', ''))

print(f"Wild species count: {len(wild_new)} (was 148)")
# Check newly added
new_added = wild_new - {'PIDGEY','RATTATA','SPEAROW','CATERPIE','WEEDLE','ZUBAT','GEODUDE','MACHOP'}
newly_added_species = []
check_missing = ['ZIGZAGOON','HOOTHOOT','WURMPLE','SEEDOT','LOTAD','TAILLOW','RALTS',
    'SHROOMISH','SURSKIT','MAKUHITA','WHISMUR','WINGULL','SKITTY','ELECTRIKE',
    'GULPIN','ROSELIA','PLUSLE','MINUN','VOLBEAT','ILLUMISE','SLAKOTH','MEDITITE',
    'NOSEPASS','GIRAFARIG','SUDOWOODO','SPINDA','TROPIUS','ZANGOOSE','SEVIPER',
    'TORKOAL','MILTANK','GLIGAR','CHIMECHO','LUNATONE','SOLROCK','ARON','BALTOY',
    'SUNKERN','EEVEE','CHINCHOU','CORSOLA','CARVANHA','WAILMER','BARBOACH',
    'SPHEAL','CLAMPERL','RELICANTH','LUVDISC','CORPHISH','ELEKID','IGGLYBUFF','MAGBY']
for sp in sorted(check_missing):
    if sp in wild_new:
        print(f"  ADDED: {sp}")
    else:
        print(f"  STILL MISSING: {sp}")
