#!/usr/bin/env python3
"""
Add one Gen 2/3 Pokémon to every NPC trainer that has ≤4 Pokémon.

The addition is chosen to match the trainer's existing type profile
(based on their party composition) and level range.

Usage:
    python3 tools/add_gen23_pokemon.py          # dry-run: prints proposals
    python3 tools/add_gen23_pokemon.py --apply   # writes changes to trainer_parties.h
"""

import re, sys, os, random, hashlib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# ---------------------------------------------------------------------------
# Type constants (must match include/constants/pokemon.h)
# ---------------------------------------------------------------------------
TYPE_NORMAL   = 0
TYPE_FIGHTING = 1
TYPE_FLYING   = 2
TYPE_POISON   = 3
TYPE_GROUND   = 4
TYPE_ROCK     = 5
TYPE_BUG      = 6
TYPE_GHOST    = 7
TYPE_STEEL    = 8
TYPE_MYSTERY  = 9
TYPE_FIRE     = 10
TYPE_WATER    = 11
TYPE_GRASS    = 12
TYPE_ELECTRIC = 13
TYPE_PSYCHIC  = 14
TYPE_ICE      = 15
TYPE_DRAGON   = 16
TYPE_DARK     = 17
NUM_TYPES     = 18

TYPE_NAMES = {
    0: "Normal", 1: "Fighting", 2: "Flying", 3: "Poison",
    4: "Ground", 5: "Rock", 6: "Bug", 7: "Ghost", 8: "Steel",
    9: "Mystery", 10: "Fire", 11: "Water", 12: "Grass",
    13: "Electric", 14: "Psychic", 15: "Ice", 16: "Dragon", 17: "Dark",
}

TYPE_STR_MAP = {
    "TYPE_NORMAL": 0, "TYPE_FIGHTING": 1, "TYPE_FLYING": 2, "TYPE_POISON": 3,
    "TYPE_GROUND": 4, "TYPE_ROCK": 5, "TYPE_BUG": 6, "TYPE_GHOST": 7,
    "TYPE_STEEL": 8, "TYPE_MYSTERY": 9, "TYPE_FIRE": 10, "TYPE_WATER": 11,
    "TYPE_GRASS": 12, "TYPE_ELECTRIC": 13, "TYPE_PSYCHIC": 14, "TYPE_ICE": 15,
    "TYPE_DRAGON": 16, "TYPE_DARK": 17,
}

# ---------------------------------------------------------------------------
# Parse species constants
# ---------------------------------------------------------------------------
def parse_species_constants():
    text = (ROOT / "include/constants/species.h").read_text()
    species = {}
    for m in re.finditer(r"#define\s+(SPECIES_\w+)\s+(\d+)", text):
        name, sid = m.group(1), int(m.group(2))
        if sid > 0 and "OLD_UNOWN" not in name and name != "SPECIES_EGG":
            species[name] = sid
    return species

# ---------------------------------------------------------------------------
# Parse species info (types + base stat total)
# ---------------------------------------------------------------------------
def parse_species_info(species_ids):
    text = (ROOT / "src/data/pokemon/species_info.h").read_text()
    
    info = {}  # species_name -> (type1, type2, bst)
    
    # Find each [SPECIES_X] = { ... } entry using brace counting
    for m in re.finditer(r"\[(SPECIES_\w+)\]\s*=\s*\n?\s*\{", text):
        name = m.group(1)
        if name not in species_ids:
            continue
        
        # Find matching closing brace
        start = m.end() - 1  # position of opening {
        depth = 0
        end = start
        for i in range(start, min(start + 2000, len(text))):
            if text[i] == '{':
                depth += 1
            elif text[i] == '}':
                depth -= 1
            if depth == 0:
                end = i + 1
                break
        
        body = text[start:end]
        
        # Extract types
        tm = re.search(r"\.types\s*=\s*\{([^}]+)\}", body)
        if not tm:
            continue
        type_strs = [t.strip() for t in tm.group(1).split(",")]
        t1 = TYPE_STR_MAP.get(type_strs[0], -1)
        t2 = TYPE_STR_MAP.get(type_strs[1], -1) if len(type_strs) > 1 else t1
        
        # Extract base stats
        bst = 0
        for stat in ["baseHP", "baseAttack", "baseDefense", "baseSpeed",
                      "baseSpAttack", "baseSpDefense"]:
            sm = re.search(rf"\.{stat}\s*=\s*(\d+)", body)
            if sm:
                bst += int(sm.group(1))
        
        info[name] = (t1, t2, bst)
    
    return info

# ---------------------------------------------------------------------------
# Parse level-up learnsets
# ---------------------------------------------------------------------------
def parse_learnsets():
    """Parse level_up_learnsets.h to get moves each species learns by level."""
    text = (ROOT / "src/data/pokemon/level_up_learnsets.h").read_text()
    
    learnsets = {}  # species_name -> [(level, move_name), ...]
    
    for m in re.finditer(
        r"static const u16 s(\w+)LevelUpLearnset\[\]\s*=\s*\{(.*?)\};",
        text, re.DOTALL
    ):
        name_part = m.group(1)  # e.g. "Bulbasaur", "Lileep"
        body = m.group(2)
        
        moves = []
        for mm in re.finditer(r"LEVEL_UP_MOVE\((\d+),\s*(MOVE_\w+)\)", body):
            lvl = int(mm.group(1))
            move = mm.group(2)
            moves.append((lvl, move))
        
        learnsets[name_part.lower()] = moves
    
    return learnsets


def get_moves_at_level(species_name, level, learnsets):
    """Get the top 4 moves a species would know at a given level."""
    # Convert SPECIES_LILEEP -> lileep
    name_key = species_name.replace("SPECIES_", "").lower()
    
    if name_key not in learnsets:
        return ["MOVE_NONE"] * 4
    
    # Get all moves learned at or below this level
    available = []
    for lvl, move in learnsets[name_key]:
        if lvl <= level:
            # Remove duplicates, keep latest learned version
            if move not in available:
                available.append(move)
            else:
                # Move it to the end (most recent)
                available.remove(move)
                available.append(move)
    
    # Take the last 4 (most recently learned)
    moves = available[-4:] if len(available) >= 4 else available
    
    # Pad with MOVE_NONE
    while len(moves) < 4:
        moves.append("MOVE_NONE")
    
    return moves


# ---------------------------------------------------------------------------
# Parse evolution data to know min-level for each species
# ---------------------------------------------------------------------------
def parse_evolution_data():
    """Parse evolution_table.h to know what evolves into what at what level."""
    evo_file = ROOT / "src/data/pokemon/evolution_table.h"
    if not evo_file.exists():
        return {}, {}
    text = evo_file.read_text()
    
    # evolves_from[species] = (from_species, level)
    evolves_from = {}
    # evolves_to[species] = [(to_species, level), ...]
    evolves_to = {}
    
    current_species = None
    for line in text.split("\n"):
        sm = re.match(r"\s*\[(SPECIES_\w+)\]", line)
        if sm:
            current_species = sm.group(1)
            continue
        if current_species:
            em = re.search(
                r"EVO_LEVEL(?:_\w+)?\s*,\s*(\d+)\s*,\s*\d+\s*,\s*(SPECIES_\w+)",
                line
            )
            if em:
                level = int(em.group(1))
                target = em.group(2)
                evolves_from[target] = (current_species, level)
                evolves_to.setdefault(current_species, []).append((target, level))
    
    return evolves_from, evolves_to

# ---------------------------------------------------------------------------
# Curated Gen 2/3 candidate pools by type
# (species, min_level, max_level, is_closer)
# ---------------------------------------------------------------------------
def build_candidate_pools(species_info):
    """Build candidate pools from parsed species data."""
    pools = {}  # type_id -> list of (species_name, min_lvl, max_lvl, is_closer)
    
    # Manually curated candidates: ensures quality picks
    # Format: (species, min_lvl, max_lvl, closer?)
    # Excluded: legendaries, starters, pseudo-legendaries at low levels
    
    CANDIDATES = [
        # Normal
        ("SPECIES_SENTRET",    3, 15, False),
        ("SPECIES_FURRET",     16, 40, False),
        ("SPECIES_AIPOM",      10, 35, False),
        ("SPECIES_DUNSPARCE",  15, 40, False),
        ("SPECIES_TEDDIURSA",  10, 29, False),
        ("SPECIES_URSARING",   30, 70, True),
        ("SPECIES_STANTLER",   20, 50, False),
        ("SPECIES_MILTANK",    25, 60, True),
        ("SPECIES_ZANGOOSE",   25, 55, False),
        ("SPECIES_SLAKOTH",    5, 17, False),
        ("SPECIES_VIGOROTH",   18, 35, False),
        ("SPECIES_ZIGZAGOON",  3, 19, False),
        ("SPECIES_LINOONE",    20, 50, False),
        ("SPECIES_TAILLOW",    5, 21, False),
        ("SPECIES_SWELLOW",    22, 60, False),
        ("SPECIES_WHISMUR",    5, 19, False),
        ("SPECIES_LOUDRED",    20, 39, False),
        ("SPECIES_EXPLOUD",    40, 70, True),
        ("SPECIES_KECLEON",    25, 55, False),
        ("SPECIES_SPINDA",     15, 40, False),
        ("SPECIES_CASTFORM",   25, 55, False),
        
        # Fighting
        ("SPECIES_HERACROSS",  20, 65, True),   # Bug/Fighting
        ("SPECIES_HITMONTOP",  20, 55, False),
        ("SPECIES_MAKUHITA",   8, 23, False),
        ("SPECIES_HARIYAMA",   24, 60, True),
        ("SPECIES_MEDITITE",   10, 36, False),   # Fighting/Psychic
        ("SPECIES_MEDICHAM",   37, 65, True),    # Fighting/Psychic
        ("SPECIES_BRELOOM",    23, 60, True),    # Grass/Fighting
        ("SPECIES_SHROOMISH",  5, 22, False),    # Grass
        
        # Flying
        ("SPECIES_HOOTHOOT",   3, 19, False),    # Normal/Flying
        ("SPECIES_NOCTOWL",    20, 55, False),   # Normal/Flying
        ("SPECIES_MURKROW",    15, 50, False),   # Dark/Flying
        ("SPECIES_GLIGAR",     15, 50, False),   # Ground/Flying
        ("SPECIES_DELIBIRD",   15, 45, False),   # Ice/Flying
        ("SPECIES_SKARMORY",   20, 60, True),    # Steel/Flying
        ("SPECIES_WINGULL",    5, 24, False),    # Water/Flying
        ("SPECIES_PELIPPER",   25, 60, False),   # Water/Flying
        ("SPECIES_SWABLU",     10, 34, False),   # Normal/Flying
        ("SPECIES_ALTARIA",    35, 65, True),    # Dragon/Flying
        ("SPECIES_TROPIUS",    25, 55, False),   # Grass/Flying
        
        # Poison
        ("SPECIES_CROBAT",     22, 65, True),    # Poison/Flying  
        ("SPECIES_ARIADOS",    22, 50, False),   # Bug/Poison
        ("SPECIES_QWILFISH",   15, 50, False),   # Water/Poison
        ("SPECIES_SEVIPER",    20, 55, False),
        ("SPECIES_GULPIN",     5, 25, False),
        ("SPECIES_SWALOT",     26, 55, False),
        ("SPECIES_ROSELIA",    12, 50, False),   # Grass/Poison
        ("SPECIES_DUSTOX",     10, 40, False),   # Bug/Poison
        
        # Ground
        ("SPECIES_PHANPY",     5, 24, False),
        ("SPECIES_DONPHAN",    25, 60, True),
        ("SPECIES_SWINUB",     5, 32, False),    # Ice/Ground
        ("SPECIES_PILOSWINE",  33, 60, True),    # Ice/Ground
        ("SPECIES_GLIGAR",     15, 50, False),   # Ground/Flying
        ("SPECIES_TRAPINCH",   10, 34, False),
        ("SPECIES_VIBRAVA",    35, 44, False),   # Ground/Dragon
        ("SPECIES_FLYGON",     45, 70, True),    # Ground/Dragon
        ("SPECIES_BALTOY",     10, 35, False),   # Ground/Psychic
        ("SPECIES_CLAYDOL",    36, 65, True),    # Ground/Psychic
        ("SPECIES_NUMEL",      10, 32, False),   # Fire/Ground
        ("SPECIES_CAMERUPT",   33, 60, True),    # Fire/Ground
        ("SPECIES_BARBOACH",   10, 29, False),   # Water/Ground
        ("SPECIES_WHISCASH",   30, 60, True),    # Water/Ground
        
        # Rock
        ("SPECIES_SHUCKLE",    15, 50, False),   # Bug/Rock
        ("SPECIES_CORSOLA",    15, 45, False),   # Water/Rock
        ("SPECIES_LARVITAR",   10, 29, False),   # Rock/Ground
        ("SPECIES_PUPITAR",    30, 54, False),   # Rock/Ground
        ("SPECIES_NOSEPASS",   12, 45, False),
        ("SPECIES_ARON",       8, 31, False),    # Steel/Rock
        ("SPECIES_LAIRON",     32, 41, False),   # Steel/Rock
        ("SPECIES_AGGRON",     42, 70, True),    # Steel/Rock
        ("SPECIES_LUNATONE",   20, 55, False),   # Rock/Psychic
        ("SPECIES_SOLROCK",    20, 55, False),   # Rock/Psychic
        ("SPECIES_ANORITH",    10, 39, False),   # Rock/Bug
        ("SPECIES_ARMALDO",    40, 65, True),    # Rock/Bug
        ("SPECIES_LILEEP",     10, 39, False),   # Rock/Grass
        ("SPECIES_CRADILY",    40, 65, True),    # Rock/Grass
        ("SPECIES_RELICANTH",  25, 55, False),   # Water/Rock
        
        # Bug
        ("SPECIES_LEDYBA",     3, 17, False),    # Bug/Flying
        ("SPECIES_LEDIAN",     18, 40, False),   # Bug/Flying
        ("SPECIES_SPINARAK",   3, 21, False),    # Bug/Poison
        ("SPECIES_ARIADOS",    22, 50, False),   # Bug/Poison
        ("SPECIES_YANMA",      12, 45, False),   # Bug/Flying
        ("SPECIES_PINECO",     8, 30, False),    # Bug
        ("SPECIES_FORRETRESS", 31, 60, True),    # Bug/Steel
        ("SPECIES_SHUCKLE",    15, 50, False),   # Bug/Rock
        ("SPECIES_HERACROSS",  20, 65, True),    # Bug/Fighting
        ("SPECIES_WURMPLE",    3, 6, False),
        ("SPECIES_BEAUTIFLY",  10, 35, False),   # Bug/Flying
        ("SPECIES_DUSTOX",     10, 40, False),   # Bug/Poison
        ("SPECIES_SURSKIT",    3, 21, False),    # Bug/Water
        ("SPECIES_MASQUERAIN", 22, 50, False),   # Bug/Flying
        ("SPECIES_NINCADA",    5, 19, False),    # Bug/Ground
        ("SPECIES_NINJASK",    20, 55, False),   # Bug/Flying
        ("SPECIES_VOLBEAT",    12, 40, False),
        ("SPECIES_ILLUMISE",   12, 40, False),
        
        # Ghost
        ("SPECIES_MISDREAVUS", 15, 55, False),
        ("SPECIES_SABLEYE",    15, 50, False),   # Dark/Ghost
        ("SPECIES_DUSKULL",    10, 36, False),
        ("SPECIES_DUSCLOPS",   37, 65, True),
        ("SPECIES_SHUPPET",    10, 36, False),
        ("SPECIES_BANETTE",    37, 65, True),
        ("SPECIES_SHEDINJA",   20, 50, False),   # Bug/Ghost
        
        # Steel
        ("SPECIES_STEELIX",    25, 65, True),    # Steel/Ground
        ("SPECIES_SCIZOR",     25, 65, True),    # Bug/Steel
        ("SPECIES_SKARMORY",   20, 60, True),    # Steel/Flying
        ("SPECIES_FORRETRESS", 31, 60, True),    # Bug/Steel
        ("SPECIES_ARON",       8, 31, False),    # Steel/Rock
        ("SPECIES_LAIRON",     32, 41, False),   # Steel/Rock
        ("SPECIES_AGGRON",     42, 70, True),    # Steel/Rock
        ("SPECIES_MAWILE",     12, 50, False),   # Steel
        ("SPECIES_BELDUM",     10, 19, False),   # Steel/Psychic
        ("SPECIES_METANG",     20, 44, False),   # Steel/Psychic
        
        # Fire
        ("SPECIES_SLUGMA",     8, 37, False),
        ("SPECIES_MAGCARGO",   38, 60, True),    # Fire/Rock
        ("SPECIES_HOUNDOUR",   10, 23, False),   # Dark/Fire
        ("SPECIES_HOUNDOOM",   24, 60, True),    # Dark/Fire
        ("SPECIES_NUMEL",      10, 32, False),   # Fire/Ground
        ("SPECIES_CAMERUPT",   33, 60, True),    # Fire/Ground
        ("SPECIES_TORKOAL",    15, 55, True),
        
        # Water
        ("SPECIES_CHINCHOU",   8, 26, False),    # Water/Electric
        ("SPECIES_LANTURN",    27, 55, False),   # Water/Electric
        ("SPECIES_MARILL",     5, 17, False),    # Water
        ("SPECIES_AZUMARILL",  18, 55, True),    # Water
        ("SPECIES_WOOPER",     5, 19, False),    # Water/Ground
        ("SPECIES_QUAGSIRE",   20, 55, False),   # Water/Ground
        ("SPECIES_QWILFISH",   15, 50, False),   # Water/Poison
        ("SPECIES_CORSOLA",    15, 45, False),   # Water/Rock
        ("SPECIES_REMORAID",   8, 24, False),
        ("SPECIES_OCTILLERY",  25, 55, True),
        ("SPECIES_MANTINE",    20, 55, False),   # Water/Flying
        ("SPECIES_WINGULL",    5, 24, False),    # Water/Flying
        ("SPECIES_PELIPPER",   25, 60, False),   # Water/Flying
        ("SPECIES_LOTAD",      3, 13, False),    # Water/Grass
        ("SPECIES_LOMBRE",     14, 30, False),   # Water/Grass
        ("SPECIES_WAILMER",    15, 39, False),
        ("SPECIES_WAILORD",    40, 65, True),
        ("SPECIES_CARVANHA",   10, 29, False),   # Water/Dark
        ("SPECIES_SHARPEDO",   30, 60, True),    # Water/Dark
        ("SPECIES_CORPHISH",   10, 29, False),   # Water
        ("SPECIES_CRAWDAUNT",  30, 60, True),    # Water/Dark
        ("SPECIES_BARBOACH",   10, 29, False),   # Water/Ground
        ("SPECIES_WHISCASH",   30, 60, True),    # Water/Ground
        ("SPECIES_SPHEAL",     10, 31, False),   # Ice/Water
        ("SPECIES_SEALEO",     32, 43, False),   # Ice/Water
        ("SPECIES_WALREIN",    44, 70, True),    # Ice/Water
        ("SPECIES_LUVDISC",    10, 35, False),
        ("SPECIES_RELICANTH",  25, 55, False),   # Water/Rock
        
        # Grass
        ("SPECIES_SUNKERN",    3, 14, False),
        ("SPECIES_SUNFLORA",   15, 45, False),
        ("SPECIES_HOPPIP",     3, 17, False),    # Grass/Flying
        ("SPECIES_SKIPLOOM",   18, 26, False),   # Grass/Flying
        ("SPECIES_JUMPLUFF",   27, 55, False),   # Grass/Flying
        ("SPECIES_SHROOMISH",  5, 22, False),    # Grass
        ("SPECIES_BRELOOM",    23, 60, True),    # Grass/Fighting
        ("SPECIES_ROSELIA",    12, 50, False),   # Grass/Poison
        ("SPECIES_CACNEA",     10, 31, False),   # Grass
        ("SPECIES_CACTURNE",   32, 55, True),    # Grass/Dark
        ("SPECIES_SEEDOT",     3, 13, False),    # Grass
        ("SPECIES_NUZLEAF",    14, 30, False),   # Grass/Dark
        ("SPECIES_SHIFTRY",    31, 60, True),    # Grass/Dark
        ("SPECIES_TROPIUS",    25, 55, False),   # Grass/Flying
        ("SPECIES_LILEEP",     10, 39, False),   # Rock/Grass
        ("SPECIES_CRADILY",    40, 65, True),    # Rock/Grass
        ("SPECIES_LOTAD",      3, 13, False),    # Water/Grass
        ("SPECIES_LOMBRE",     14, 30, False),   # Water/Grass
        
        # Electric
        ("SPECIES_CHINCHOU",   8, 26, False),    # Water/Electric
        ("SPECIES_LANTURN",    27, 55, False),   # Water/Electric
        ("SPECIES_MAREEP",     5, 14, False),
        ("SPECIES_FLAAFFY",    15, 29, False),
        ("SPECIES_AMPHAROS",   30, 65, True),
        ("SPECIES_ELECTRIKE",  5, 25, False),
        ("SPECIES_MANECTRIC",  26, 60, True),
        ("SPECIES_PLUSLE",     10, 40, False),
        ("SPECIES_MINUN",      10, 40, False),
        
        # Psychic
        ("SPECIES_ESPEON",     25, 60, True),
        ("SPECIES_NATU",       5, 24, False),    # Psychic/Flying
        ("SPECIES_XATU",       25, 60, True),    # Psychic/Flying
        ("SPECIES_GIRAFARIG",  15, 50, False),   # Normal/Psychic
        ("SPECIES_WOBBUFFET",  15, 55, False),
        ("SPECIES_RALTS",      5, 19, False),
        ("SPECIES_KIRLIA",     20, 29, False),
        ("SPECIES_GARDEVOIR",  30, 65, True),
        ("SPECIES_MEDITITE",   10, 36, False),   # Fighting/Psychic
        ("SPECIES_MEDICHAM",   37, 65, True),    # Fighting/Psychic
        ("SPECIES_SPOINK",     10, 31, False),
        ("SPECIES_GRUMPIG",    32, 60, True),
        ("SPECIES_LUNATONE",   20, 55, False),   # Rock/Psychic
        ("SPECIES_SOLROCK",    20, 55, False),   # Rock/Psychic
        ("SPECIES_BALTOY",     10, 35, False),   # Ground/Psychic
        ("SPECIES_CLAYDOL",    36, 65, True),    # Ground/Psychic
        ("SPECIES_CHIMECHO",   25, 55, False),
        
        # Ice
        ("SPECIES_SNEASEL",    15, 55, False),   # Dark/Ice
        ("SPECIES_SWINUB",     5, 32, False),    # Ice/Ground
        ("SPECIES_PILOSWINE",  33, 60, True),    # Ice/Ground
        ("SPECIES_DELIBIRD",   15, 45, False),   # Ice/Flying
        ("SPECIES_SNORUNT",    10, 41, False),
        ("SPECIES_GLALIE",     42, 65, True),
        ("SPECIES_SPHEAL",     10, 31, False),   # Ice/Water
        ("SPECIES_SEALEO",     32, 43, False),   # Ice/Water
        ("SPECIES_WALREIN",    44, 70, True),    # Ice/Water
        
        # Dragon
        ("SPECIES_KINGDRA",    30, 70, True),    # Water/Dragon
        ("SPECIES_BAGON",      10, 29, False),
        ("SPECIES_SHELGON",    30, 49, False),
        ("SPECIES_SWABLU",     10, 34, False),   # Normal/Flying -> Altaria Dragon/Flying
        ("SPECIES_ALTARIA",    35, 65, True),    # Dragon/Flying
        ("SPECIES_VIBRAVA",    35, 44, False),   # Ground/Dragon
        ("SPECIES_FLYGON",     45, 70, True),    # Ground/Dragon
        
        # Dark
        ("SPECIES_UMBREON",    25, 60, True),
        ("SPECIES_MURKROW",    15, 50, False),   # Dark/Flying
        ("SPECIES_SNEASEL",    15, 55, False),   # Dark/Ice
        ("SPECIES_HOUNDOUR",   10, 23, False),   # Dark/Fire
        ("SPECIES_HOUNDOOM",   24, 60, True),    # Dark/Fire
        ("SPECIES_ABSOL",      20, 60, False),
        ("SPECIES_SABLEYE",    15, 50, False),   # Dark/Ghost
        ("SPECIES_MIGHTYENA",  18, 55, False),
        ("SPECIES_POOCHYENA",  3, 17, False),
        ("SPECIES_CARVANHA",   10, 29, False),   # Water/Dark
        ("SPECIES_SHARPEDO",   30, 60, True),    # Water/Dark
        ("SPECIES_CACTURNE",   32, 55, True),    # Grass/Dark
        ("SPECIES_NUZLEAF",    14, 30, False),   # Grass/Dark
        ("SPECIES_SHIFTRY",    31, 60, True),    # Grass/Dark
        ("SPECIES_CRAWDAUNT",  30, 60, True),    # Water/Dark
    ]
    
    # Build pools by type (each candidate gets added to pools for both its types)
    for spec_name, min_lvl, max_lvl, is_closer in CANDIDATES:
        if spec_name not in species_info:
            continue
        t1, t2, bst = species_info[spec_name]
        for t in set([t1, t2]):
            if t == TYPE_MYSTERY or t < 0:
                continue
            pools.setdefault(t, []).append((spec_name, min_lvl, max_lvl, is_closer, bst))
    
    return pools

# ---------------------------------------------------------------------------
# Parse trainer parties
# ---------------------------------------------------------------------------
def parse_trainer_parties():
    text = (ROOT / "src/data/trainer_parties.h").read_text()
    
    parties = {}  # name -> {struct_type, mons: [{species, lvl, iv, heldItem?, moves?}]}
    
    for m in re.finditer(
        r"static const struct (\w+)\s+(sParty_\w+)\[\]\s*=\s*\{(.*?)\};",
        text, re.DOTALL
    ):
        struct_type = m.group(1)
        name = m.group(2)
        body = m.group(3)
        
        mons = []
        # Parse mons using brace-counting to handle nested braces (e.g. .moves)
        i = 0
        while i < len(body):
            if body[i] == '{':
                depth = 1
                start = i + 1
                i += 1
                while i < len(body) and depth > 0:
                    if body[i] == '{':
                        depth += 1
                    elif body[i] == '}':
                        depth -= 1
                    i += 1
                mon_body = body[start:i-1]
                species_m = re.search(r"\.species\s*=\s*(SPECIES_\w+)", mon_body)
                lvl_m = re.search(r"\.lvl\s*=\s*(\d+)", mon_body)
                iv_m = re.search(r"\.iv\s*=\s*(\d+)", mon_body)
                item_m = re.search(r"\.heldItem\s*=\s*(\w+)", mon_body)
                moves_m = re.search(r"\.moves\s*=\s*\{([^}]+)\}", mon_body)
                
                if species_m and lvl_m:
                    mon = {
                        "species": species_m.group(1),
                        "lvl": int(lvl_m.group(1)),
                        "iv": int(iv_m.group(1)) if iv_m else 0,
                    }
                    if item_m:
                        mon["heldItem"] = item_m.group(1)
                    if moves_m:
                        moves = [mv.strip() for mv in moves_m.group(1).split(",")]
                        mon["moves"] = moves
                    mons.append(mon)
            else:
                i += 1
        
        parties[name] = {"struct_type": struct_type, "mons": mons}
    
    return parties

# ---------------------------------------------------------------------------
# Parse gTrainers[] to get trainer class for each party
# ---------------------------------------------------------------------------
def parse_trainers():
    text = (ROOT / "src/data/trainers.h").read_text()
    
    trainers = {}  # trainer_id_name -> {class, party_name, name}
    
    for m in re.finditer(
        r"\[(TRAINER_\w+)\]\s*=\s*\{(.*?)\},?\s*\n",
        text, re.DOTALL
    ):
        tid = m.group(1)
        body = m.group(2)
        
        class_m = re.search(r"\.trainerClass\s*=\s*(\w+)", body)
        name_m = re.search(r'\.trainerName\s*=\s*_\("([^"]+)"\)', body)
        party_m = re.search(r"(sParty_\w+)", body)
        
        trainers[tid] = {
            "class": class_m.group(1) if class_m else "",
            "party": party_m.group(1) if party_m else "",
            "name": name_m.group(1) if name_m else "",
        }
    
    return trainers

# ---------------------------------------------------------------------------
# Trainer classes to SKIP (tutorial, special, etc.)
# ---------------------------------------------------------------------------
SKIP_CLASSES = {
    "TRAINER_CLASS_PKMN_PROF",  # Oak tutorial
    "TRAINER_CLASS_OLD_MAN",    # Tutorial old man
    "TRAINER_CLASS_YOUNG_COUPLE",  # double battle pair
}

# Boss classes where we should be more careful
BOSS_CLASSES = {
    "TRAINER_CLASS_LEADER",
    "TRAINER_CLASS_ELITE_FOUR", 
    "TRAINER_CLASS_CHAMPION",
}

# ---------------------------------------------------------------------------
# Select best Gen2/3 addition for a trainer
# ---------------------------------------------------------------------------
def select_addition(party_mons, species_info, candidate_pools, existing_species, party_name=""):
    """Pick the best Gen2/3 pokemon to add to this trainer's party."""
    if not party_mons:
        return None
    
    # Deterministic seed from party name for variety
    seed = int(hashlib.md5(party_name.encode()).hexdigest(), 16) % (2**32)
    rng = random.Random(seed)
    
    # Compute type profile from existing party
    type_scores = {}
    for mon in party_mons:
        spec = mon["species"]
        if spec not in species_info:
            continue
        t1, t2, _ = species_info[spec]
        lvl = mon["lvl"]
        type_scores[t1] = type_scores.get(t1, 0) + lvl * 2
        if t2 != t1:
            type_scores[t2] = type_scores.get(t2, 0) + lvl
    
    if not type_scores:
        return None
    
    # Sort types by score (dominant first)
    sorted_types = sorted(type_scores.keys(), key=lambda t: type_scores[t], reverse=True)
    top_types = sorted_types[:3]  # consider top 3 types
    
    # Average level of existing party
    avg_lvl = sum(m["lvl"] for m in party_mons) // len(party_mons)
    max_lvl = max(m["lvl"] for m in party_mons)
    
    # Target level: about the average, biased slightly down from max
    target_lvl = avg_lvl
    
    # Check if team has a strong closer (highest BST mon)
    team_bsts = []
    for mon in party_mons:
        if mon["species"] in species_info:
            team_bsts.append(species_info[mon["species"]][2])
    max_team_bst = max(team_bsts) if team_bsts else 300
    needs_closer = max_team_bst < 430 and avg_lvl >= 20
    
    # Collect candidates from the trainer's top types
    candidates = []
    for t in top_types:
        for cand in candidate_pools.get(t, []):
            spec_name, min_lvl, max_lvl_c, is_closer, bst = cand
            if spec_name in existing_species:
                continue
            if not (min_lvl <= target_lvl <= max_lvl_c):
                continue
            
            # Score: heavily prefer matching dominant type
            score = 0
            t1c, t2c, _ = species_info[spec_name]
            
            # Primary type match is worth much more than secondary
            type_weights = {}
            for i, tt in enumerate(top_types):
                type_weights[tt] = [50, 15, 5][i]
            
            for tc in set([t1c, t2c]):
                if tc in type_weights:
                    score += type_weights[tc]
            
            # Small bonus for matching 2+ trainer types
            matching_types = sum(1 for tt in top_types if t1c == tt or t2c == tt)
            if matching_types >= 2:
                score += 5
            
            # Closer bonus if needed
            if needs_closer and is_closer:
                score += 20
            
            # Penalize if too strong relative to team
            if bst > max_team_bst + 100:
                score -= 10
            
            # Prefer pokemon that add type diversity (secondary type not on team)
            for tc in [t1c, t2c]:
                if tc not in type_scores and tc != TYPE_MYSTERY:
                    score += 3
            
            candidates.append((spec_name, target_lvl, score, is_closer))
    
    if not candidates:
        # Try broader search with relaxed level constraints
        for t in range(NUM_TYPES):
            for cand in candidate_pools.get(t, []):
                spec_name, min_lvl, max_lvl_c, is_closer, bst = cand
                if spec_name in existing_species:
                    continue
                if not (min_lvl <= target_lvl + 3 <= max_lvl_c + 5):
                    continue
                t1c, t2c, _ = species_info[spec_name]
                matching = sum(1 for tt in top_types if t1c == tt or t2c == tt)
                if matching > 0:
                    candidates.append((spec_name, target_lvl, matching * 5, is_closer))
        
        if not candidates:
            return None
    
    # Sort by score descending
    candidates.sort(key=lambda c: c[2], reverse=True)
    
    # Pick from top candidates with some variety
    top_score = candidates[0][2]
    # Consider candidates within 80% of top score
    threshold = top_score * 0.7
    top_pool = [c for c in candidates if c[2] >= threshold]
    
    best = rng.choice(top_pool)
    
    return {
        "species": best[0],
        "lvl": best[1],
    }

# ---------------------------------------------------------------------------
# Generate the modified party entry
# ---------------------------------------------------------------------------
def generate_new_mon_entry(struct_type, addition, iv_template, learnsets=None):
    """Generate C code for the new mon entry."""
    species = addition["species"]
    lvl = addition["lvl"]
    iv = iv_template
    
    if struct_type == "TrainerMonNoItemDefaultMoves":
        return f"""    {{
        .iv = {iv},
        .lvl = {lvl},
        .species = {species},
    }}"""
    elif struct_type == "TrainerMonItemDefaultMoves":
        return f"""    {{
        .iv = {iv},
        .lvl = {lvl},
        .species = {species},
        .heldItem = ITEM_NONE,
    }}"""
    elif struct_type == "TrainerMonNoItemCustomMoves":
        moves = get_moves_at_level(species, lvl, learnsets) if learnsets else ["MOVE_NONE"] * 4
        return f"""    {{
        .iv = {iv},
        .lvl = {lvl},
        .species = {species},
        .moves = {{{", ".join(moves)}}},
    }}"""
    elif struct_type == "TrainerMonItemCustomMoves":
        moves = get_moves_at_level(species, lvl, learnsets) if learnsets else ["MOVE_NONE"] * 4
        return f"""    {{
        .iv = {iv},
        .lvl = {lvl},
        .species = {species},
        .heldItem = ITEM_NONE,
        .moves = {{{", ".join(moves)}}},
    }}"""
    return ""

# ---------------------------------------------------------------------------
# Apply additions to trainer_parties.h
# ---------------------------------------------------------------------------
def apply_additions(additions):
    """Modify trainer_parties.h to add new pokemon to parties."""
    filepath = ROOT / "src/data/trainer_parties.h"
    text = filepath.read_text()
    
    # Process each addition by finding the party array and inserting before closing };
    for party_name, addition_info in additions.items():
        struct_type = addition_info["struct_type"]
        new_mon = addition_info["new_mon_code"]
        
        # Find the party array's closing };
        pattern = (
            r"(static const struct " + re.escape(struct_type) + r"\s+" +
            re.escape(party_name) + r"\[\]\s*=\s*\{.*?)"
            r"(\n\};)"
        )
        match = re.search(pattern, text, re.DOTALL)
        if match:
            # The last entry typically ends with },\n so we just add the new mon
            # The existing trailing comma after the last entry handles separation
            text = text[:match.end(1)] + "\n" + new_mon + "," + match.group(2) + text[match.end():]
    
    filepath.write_text(text)
    return len(additions)

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    dry_run = "--apply" not in sys.argv
    
    print("Parsing species data...")
    species_ids = parse_species_constants()
    species_info = parse_species_info(species_ids)
    print(f"  {len(species_info)} species with type data")
    
    print("Building candidate pools...")
    pools = build_candidate_pools(species_info)
    total_cands = sum(len(v) for v in pools.values())
    print(f"  {total_cands} candidates across {len(pools)} type pools")
    
    print("Parsing learnsets...")
    learnsets = parse_learnsets()
    print(f"  {len(learnsets)} learnsets")
    
    print("Parsing trainer parties...")
    parties = parse_trainer_parties()
    print(f"  {len(parties)} party arrays")
    
    print("Parsing gTrainers[]...")
    trainers = parse_trainers()
    print(f"  {len(trainers)} trainer entries")
    
    # Find which party arrays are used by which trainers
    party_to_trainers = {}
    for tid, tinfo in trainers.items():
        pname = tinfo["party"]
        if pname:
            party_to_trainers.setdefault(pname, []).append(tid)
    
    # Process each party
    additions = {}
    skipped = {"empty": 0, "large": 0, "skip_class": 0, "no_candidate": 0, "no_info": 0}
    
    for party_name, pdata in sorted(parties.items()):
        mons = pdata["mons"]
        struct_type = pdata["struct_type"]
        
        # Skip empty parties
        if len(mons) == 0:
            skipped["empty"] += 1
            continue
        
        # Skip parties that already have 5+
        if len(mons) >= 5:
            skipped["large"] += 1
            continue
        
        # Check trainer class
        trainer_ids = party_to_trainers.get(party_name, [])
        trainer_classes = set()
        trainer_names = []
        for tid in trainer_ids:
            if tid in trainers:
                trainer_classes.add(trainers[tid]["class"])
                trainer_names.append(trainers[tid]["name"])
        
        if trainer_classes & SKIP_CLASSES:
            skipped["skip_class"] += 1
            continue
        
        # Get existing species
        existing_species = set(m["species"] for m in mons)
        
        # Determine typical IV from existing party
        iv_template = mons[0]["iv"] if mons else 0
        
        # Select addition
        addition = select_addition(mons, species_info, pools, existing_species, party_name)
        if not addition:
            skipped["no_candidate"] += 1
            continue
        
        new_mon_code = generate_new_mon_entry(struct_type, addition, iv_template, learnsets, learnsets, learnsets, learnsets)
        
        additions[party_name] = {
            "struct_type": struct_type,
            "new_mon_code": new_mon_code,
            "addition": addition,
            "current_size": len(mons),
            "trainer_names": trainer_names,
        }
    
    # Print summary
    print(f"\n{'=' * 60}")
    print(f"ADDITIONS SUMMARY")
    print(f"{'=' * 60}")
    print(f"Trainers with additions: {len(additions)}")
    print(f"Skipped - empty party: {skipped['empty']}")
    print(f"Skipped - already 5+: {skipped['large']}")
    print(f"Skipped - special class: {skipped['skip_class']}")
    print(f"Skipped - no candidate: {skipped['no_candidate']}")
    
    # Print all additions grouped by size
    for size in [1, 2, 3, 4]:
        group = [(k, v) for k, v in additions.items() if v["current_size"] == size]
        if group:
            print(f"\n--- Trainers with {size} -> {size+1} pokemon ({len(group)}) ---")
            for party_name, info in group[:10]:  # show first 10
                names = ", ".join(info["trainer_names"][:3]) or party_name
                add = info["addition"]
                print(f"  {names}: +{add['species']} Lv{add['lvl']}")
            if len(group) > 10:
                print(f"  ... and {len(group) - 10} more")
    
    if dry_run:
        print(f"\nDRY RUN - no changes written. Use --apply to write changes.")
    else:
        print(f"\nApplying {len(additions)} additions to src/data/trainer_parties.h...")
        count = apply_additions(additions)
        print(f"Done. Modified {count} party arrays.")

if __name__ == "__main__":
    main()
