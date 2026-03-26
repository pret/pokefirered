#!/usr/bin/env python3
"""Export NPC trainer type-level reference sorted by in-game location.

For each NPC trainer this script:
  1. Resolves their location from data/scripts/trainers.inc
  2. Re-implements ComputeTrainerTypeLevelsBase() from src/trainer_xp_system.c
     — including boss/rival bonuses and the LCG variance — to compute the
     18 NPC type-bonus levels that the game would assign to that trainer.
  3. Emits a Markdown file (docs/trainer_type_level_reference.md) grouping
      trainers by game-progression order of their location, with each entry
      showing:
       - Trainer name + class (ID)
       - Pokémon party (species + level)
       - All 18 type-level values (non-trivial ones highlighted)
  4. Emits a C table (src/data/trainer_type_npc_levels.c) with hard-coded,
      precomputed trainer type levels for runtime lookup.

Usage:
    python3 tools/export_npc_type_levels.py --repo /path/to/repo
"""

from __future__ import annotations

import argparse
import re
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path

# ---------------------------------------------------------------------------
# Type constants (mirror include/constants/pokemon.h)
# ---------------------------------------------------------------------------
TYPES = {
    "TYPE_NORMAL":   0,
    "TYPE_FIGHTING":  1,
    "TYPE_FLYING":   2,
    "TYPE_POISON":   3,
    "TYPE_GROUND":   4,
    "TYPE_ROCK":     5,
    "TYPE_BUG":      6,
    "TYPE_GHOST":    7,
    "TYPE_STEEL":    8,
    "TYPE_MYSTERY":  9,
    "TYPE_FIRE":    10,
    "TYPE_WATER":   11,
    "TYPE_GRASS":   12,
    "TYPE_ELECTRIC":13,
    "TYPE_PSYCHIC": 14,
    "TYPE_ICE":     15,
    "TYPE_DRAGON":  16,
    "TYPE_DARK":    17,
}
TYPE_NAMES = {v: k.replace("TYPE_", "").capitalize() for k, v in TYPES.items()}
NUM_TYPES = 18
TYPE_MYSTERY = 9
TYPE_NONE = 255
NPC_TYPE_RAW_TO_EXP_MULTIPLIER = 25

# ---------------------------------------------------------------------------
# Tier tables (mirror src/trainer_xp_system.c)
# ---------------------------------------------------------------------------
TIER_FAST, TIER_MED, TIER_MS, TIER_SLOW = 0, 1, 2, 3

TYPE_TIER = [
    TIER_MED,   # 0 Normal
    TIER_MED,   # 1 Fighting
    TIER_MED,   # 2 Flying
    TIER_MED,   # 3 Poison
    TIER_MED,   # 4 Ground
    TIER_MED,   # 5 Rock
    TIER_FAST,  # 6 Bug
    TIER_MED,   # 7 Ghost
    TIER_MED,   # 8 Steel
    TIER_MED,   # 9 Mystery
    TIER_MS,    #10 Fire
    TIER_MS,    #11 Water
    TIER_MS,    #12 Grass
    TIER_MS,    #13 Electric
    TIER_SLOW,  #14 Psychic
    TIER_MS,    #15 Ice
    TIER_SLOW,  #16 Dragon
    TIER_MED,   #17 Dark
]

THRESHOLD_FAST = [
    0,3,7,13,20,28,37,47,57,69,80,93,106,119,133,147,162,178,194,210,
    227,244,262,280,298,317,336,356,376,396,417,438,459,481,503,526,548,
    571,595,618,642,666,691,716,741,766,792,818,844,871,897,924,952,979,
    1007,1035,1064,1092,1121,1150,1180,1209,1239,1269,1299,1330,1361,
    1392,1423,1455,1486,1518,1551,1583,1616,1648,1682,1715,1748,1782,
    1816,1850,1885,1919,1954,1989,2024,2060,2095,2131,2167,2203,2240,
    2276,2313,2350,2387,2425,2462,2500,2500
]
THRESHOLD_MED = [
    0,5,14,26,41,57,75,94,115,137,161,185,211,238,266,295,325,356,388,
    420,454,488,524,560,597,634,673,712,752,793,834,876,919,962,1006,
    1051,1096,1142,1189,1236,1284,1333,1382,1431,1481,1532,1584,1636,
    1688,1741,1795,1849,1903,1959,2014,2070,2127,2184,2242,2300,2359,
    2418,2478,2538,2599,2660,2722,2784,2846,2909,2973,3037,3101,3166,
    3231,3297,3363,3430,3497,3564,3632,3700,3769,3838,3908,3978,4048,
    4119,4190,4262,4334,4406,4479,4552,4626,4700,4774,4849,4924,5000,5000
]
THRESHOLD_MS = [
    0,8,23,42,65,91,119,150,184,219,257,296,338,381,425,472,520,569,620,
    673,726,782,838,896,955,1015,1077,1139,1203,1268,1335,1402,1470,1540,
    1610,1682,1754,1828,1902,1978,2055,2132,2211,2290,2370,2452,2534,2617,
    2701,2786,2871,2958,3045,3134,3223,3313,3403,3495,3587,3681,3775,3869,
    3965,4061,4158,4256,4355,4454,4554,4655,4756,4859,4962,5065,5170,5275,
    5381,5487,5595,5703,5811,5921,6031,6141,6253,6365,6477,6590,6704,6819,
    6934,7050,7167,7284,7402,7520,7639,7759,7879,8000,8000
]
THRESHOLD_SLOW = [
    0,12,34,63,97,136,179,226,276,329,385,444,506,571,638,708,780,854,
    930,1009,1090,1172,1257,1344,1432,1523,1615,1709,1805,1903,2002,2103,
    2205,2309,2415,2522,2631,2742,2854,2967,3082,3198,3316,3435,3556,3677,
    3800,3924,4050,4176,4304,4433,4563,4694,4826,4959,5094,5229,5365,5503,
    5641,5781,5921,6063,6206,6349,6494,6640,6787,6934,7083,7233,7383,7535,
    7688,7841,7996,8151,8308,8465,8624,8783,8943,9105,9267,9430,9594,9759,
    9925,10092,10260,10429,10599,10769,10941,11113,11286,11460,11635,11810,12000
]
TIER_TABLES = [THRESHOLD_FAST, THRESHOLD_MED, THRESHOLD_MS, THRESHOLD_SLOW]


def calculate_type_level_from_exp(type_id: int, exp: int) -> int:
    tier = TYPE_TIER[type_id]
    table = TIER_TABLES[tier]
    level = 1
    while level < 100 and exp >= table[level] * 3:
        level += 1
    return level

# ---------------------------------------------------------------------------
# Trainer class constants
# ---------------------------------------------------------------------------
TRAINER_CLASS_RIVAL_EARLY = 81
TRAINER_CLASS_LEADER      = 84
TRAINER_CLASS_ELITE_FOUR  = 87
TRAINER_CLASS_RIVAL_LATE  = 89
TRAINER_CLASS_CHAMPION    = 90

# Rival trainer IDs (hardcoded from opponents.h, each triple = squirtle/bulba/charmander)
RIVAL_SQUIRTLE = [326, 329, 332, 426, 429, 432, 435, 438]
RIVAL_BULBASAUR = [327, 330, 333, 427, 430, 433, 436, 439]
RIVAL_CHARMANDER = [328, 331, 334, 428, 431, 434, 437, 440]

# IDs of the champion-first encounters that also get rival treatment
CHAMPION_FIRST_IDS = {438, 439, 440}

# Build a single flat set of all rival IDs for quick membership test
ALL_RIVAL_IDS: set[int] = set(RIVAL_SQUIRTLE + RIVAL_BULBASAUR + RIVAL_CHARMANDER)

# Map from any rival ID to its chain
_RIVAL_CHAINS = {
    rid: chain
    for chain in (RIVAL_SQUIRTLE, RIVAL_BULBASAUR, RIVAL_CHARMANDER)
    for rid in chain
}

# ---------------------------------------------------------------------------
# In-game location progression order (used for sorting)
# ---------------------------------------------------------------------------
LOCATION_ORDER = [
    "PalletTown", "Route1", "ViridianCity", "Route2", "ViridianForest",
    "PewterCity", "Route3", "MtMoon", "Route4", "CeruleanCity",
    "Route24", "Route25", "Route5", "Route6", "VermilionCity",
    "SSAnne", "DiglettsCave", "Route11", "Route12", "Route13",
    "Route14", "Route15", "Route16", "Route17", "Route18", "Route19",
    "Route20", "Route21", "CeladonCity", "Route7", "Route8", "Route9",
    "Route10", "LavenderTown", "PokemonTower", "SaffronCity", "SilphCo",
    "FuchsiaCity", "SafariZone", "Route22", "Route23", "VictoryRoad",
    "CinnabarIsland", "PokemonMansion", "RocketHideout", "IndigoPlateau",
    "PokemonLeague", "OneIsland", "TwoIsland", "ThreeIsland",
    "FourIsland", "FiveIsland", "SixIsland", "SevenIsland",
    "MtEmber", "NavelRock", "BirthIsland",
]

def location_sort_key(loc: str) -> int:
    for i, prefix in enumerate(LOCATION_ORDER):
        if loc.startswith(prefix):
            return i
    return len(LOCATION_ORDER)


# ---------------------------------------------------------------------------
# Data structures
# ---------------------------------------------------------------------------
@dataclass
class Mon:
    species_id: int
    species_name: str
    level: int
    type1: int
    type2: int
    moves: list[tuple[int, int]]   # list of (move_id, move_type, power)


@dataclass
class Trainer:
    trainer_id: int
    trainer_name: str
    trainer_class: int
    trainer_class_name: str
    party: list[Mon] = field(default_factory=list)
    location: str = "Unknown"
    type_levels: list[int] = field(default_factory=lambda: [1]*NUM_TYPES)


# ---------------------------------------------------------------------------
# Parsing helpers
# ---------------------------------------------------------------------------
def _strip_comments(text: str) -> str:
    """Remove C-style /* */ and // comments."""
    text = re.sub(r'/\*.*?\*/', ' ', text, flags=re.DOTALL)
    text = re.sub(r'//[^\n]*', '', text)
    return text


def parse_defines(text: str) -> dict[str, int]:
    """Return {name: int_value} for all #define NAME VALUE lines."""
    out: dict[str, int] = {}
    for m in re.finditer(r'^#define\s+(\w+)\s+(\d+)\s*$', text, re.MULTILINE):
        out[m.group(1)] = int(m.group(2))
    return out


def parse_species_info(text: str, species_consts: dict[str, int]) -> dict[int, tuple[int, int]]:
    """Parse gSpeciesInfo[] → {species_id: (type1, type2)}."""
    TYPE_RE = re.compile(r'\.types\s*=\s*\{([^}]+)\}')
    clean = _strip_comments(text)
    species_type: dict[int, tuple[int, int]] = {}

    # Find each [SPECIES_X] = { ... } block
    for m in re.finditer(r'\[(\w+)\]\s*=\s*\{', clean):
        sname = m.group(1)
        sid = species_consts.get(sname)
        if sid is None:
            continue
        # Extract the block content
        block_start = m.end() - 1
        depth = 0
        pos = block_start
        while pos < len(clean):
            if clean[pos] == '{':
                depth += 1
            elif clean[pos] == '}':
                depth -= 1
                if depth == 0:
                    break
            pos += 1
        block = clean[block_start:pos+1]
        tm = TYPE_RE.search(block)
        if tm:
            tparts = [t.strip() for t in tm.group(1).split(',')]
            t1 = TYPES.get(tparts[0] if len(tparts) > 0 else 'TYPE_NORMAL', 0)
            t2 = TYPES.get(tparts[1] if len(tparts) > 1 else tparts[0], t1)
            species_type[sid] = (t1, t2)
    return species_type


def parse_move_info(text: str, move_consts: dict[str, int]) -> dict[int, tuple[int, int]]:
    """Parse gBattleMoves[] → {move_id: (type, power)}."""
    clean = _strip_comments(text)
    move_info: dict[int, tuple[int, int]] = {}
    for m in re.finditer(r'\[(\w+)\]\s*=\s*\{', clean):
        mname = m.group(1)
        mid = move_consts.get(mname)
        if mid is None:
            continue
        block_start = m.end() - 1
        depth = 0
        pos = block_start
        while pos < len(clean):
            if clean[pos] == '{':
                depth += 1
            elif clean[pos] == '}':
                depth -= 1
                if depth == 0:
                    break
            pos += 1
        block = clean[block_start:pos+1]
        mtype_m = re.search(r'\.type\s*=\s*(\w+)', block)
        power_m = re.search(r'\.power\s*=\s*(\d+)', block)
        mtype = TYPES.get(mtype_m.group(1), 0) if mtype_m else 0
        power = int(power_m.group(1)) if power_m else 0
        move_info[mid] = (mtype, power)
    return move_info


def parse_learnsets(learnsets_text: str, pointers_text: str,
                    move_consts: dict[str, int], species_consts: dict[str, int]
                    ) -> dict[int, list[tuple[int, int]]]:
    """Return {species_id: [(level, move_id), ...]} sorted by level."""
    # Parse all named learnsets
    ENTRY_RE = re.compile(r'LEVEL_UP_MOVE\s*\(\s*(\d+)\s*,\s*(\w+)\s*\)')
    raw: dict[str, list[tuple[int, int]]] = {}
    for m in re.finditer(r'static const u16 (s\w+LevelUpLearnset)\[\]\s*=\s*\{([^}]+)\}',
                          learnsets_text, re.DOTALL):
        lname = m.group(1)
        entries: list[tuple[int, int]] = []
        for em in ENTRY_RE.finditer(m.group(2)):
            lvl = int(em.group(1))
            mvname = em.group(2)
            mvid = move_consts.get(mvname, 0)
            entries.append((lvl, mvid))
        raw[lname] = entries

    # Map species → learnset name via pointer table
    species_ls: dict[int, list[tuple[int, int]]] = {}
    for m in re.finditer(r'\[(\w+)\]\s*=\s*(s\w+LevelUpLearnset)', pointers_text):
        sname = m.group(1)
        lsname = m.group(2)
        sid = species_consts.get(sname)
        if sid is None:
            continue
        ls = raw.get(lsname)
        if ls is not None:
            species_ls[sid] = ls
    return species_ls


def get_default_moves(species_id: int, level: int,
                      learnsets: dict[int, list[tuple[int, int]]]) -> list[int]:
    """Return up to 4 moves a Pokémon of this species knows at this level (last 4 <= level)."""
    ls = learnsets.get(species_id, [])
    known: list[int] = []
    for lvl, mvid in ls:
        if lvl <= level:
            known.append(mvid)
    # keep last 4
    return known[-4:]


def parse_trainer_locations(trainers_inc: str) -> dict[str, str]:
    """Parse data/scripts/trainers.inc → {TRAINER_*_CONSTANT: location_prefix}."""
    loc_map: dict[str, str] = {}
    cur_label: str | None = None
    for line in trainers_inc.splitlines():
        line = line.strip()
        # Event script label defines the location prefix
        label_m = re.match(r'^([A-Za-z0-9_]+)_EventScript_\w+::$', line)
        if label_m:
            cur_label = label_m.group(1)
            continue
        # trainerbattle_single or trainerbattle_double
        tb_m = re.match(r'trainerbattle(?:_single|_double|_rematch)?\s+(TRAINER_\w+)', line)
        if tb_m and cur_label:
            tid = tb_m.group(1)
            # Only record location from trainerbattle_single (first encounter)
            if tid not in loc_map:
                loc_map[tid] = cur_label
    return loc_map


def parse_trainer_classes(trainers_h: str) -> dict[str, int]:
    """Parse #define TRAINER_CLASS_* N from trainers.h."""
    return {m.group(1): int(m.group(2))
            for m in re.finditer(r'#define\s+(TRAINER_CLASS_\w+)\s+(\d+)', trainers_h)}


def parse_trainer_class_name(class_id: int, class_defs: dict[str, int]) -> str:
    for k, v in class_defs.items():
        if v == class_id:
            return k.replace("TRAINER_CLASS_", "").replace("_", " ").title()
    return f"Class_{class_id}"


# ---------------------------------------------------------------------------
# Trainers.h / trainer_parties.h parsing (reused from export_trainer_readability)
# ---------------------------------------------------------------------------
def _extract_block(content: str, start: int) -> tuple[str, int]:
    """Return (block_without_outer_braces, end_pos)."""
    depth = 0
    pos = start
    n = len(content)
    block_start = -1
    while pos < n:
        if content[pos] == '{':
            depth += 1
            if depth == 1:
                block_start = pos + 1
        elif content[pos] == '}':
            depth -= 1
            if depth == 0:
                return content[block_start:pos], pos
        pos += 1
    return "", n


def parse_party_entries(block: str) -> list[tuple[str, int]]:
    """Return [(species_name, level), ...] from a party struct body."""
    entries: list[tuple[str, int]] = []
    lvl_re = re.compile(r'\.lvl\s*=\s*(\d+)')
    lvl_matches = list(lvl_re.finditer(block))
    for idx, lm in enumerate(lvl_matches):
        start = lm.end()
        end = lvl_matches[idx + 1].start() if idx + 1 < len(lvl_matches) else len(block)
        window = block[start:end]
        sm = re.search(r'\.species\s*=\s*(SPECIES_[A-Z0-9_]+)', window)
        if sm:
            entries.append((sm.group(1), int(lm.group(1))))
    return entries


def parse_party_custom_moves(block: str) -> list[tuple[str, int, list[str]]]:
    """Return [(species_name, level, [move_names]), ...] for custom-move parties."""
    entries: list[tuple[str, int, list[str]]] = []
    lvl_re = re.compile(r'\.lvl\s*=\s*(\d+)')
    lvl_matches = list(lvl_re.finditer(block))
    for idx, lm in enumerate(lvl_matches):
        start = lm.end()
        end = lvl_matches[idx + 1].start() if idx + 1 < len(lvl_matches) else len(block)
        window = block[start:end]
        sm = re.search(r'\.species\s*=\s*(SPECIES_[A-Z0-9_]+)', window)
        moves: list[str] = []
        mm = re.search(r'\.moves\s*=\s*\{([^}]+)\}', window)
        if mm:
            moves = [m.strip() for m in mm.group(1).split(',') if m.strip()]
        if sm:
            entries.append((sm.group(1), int(lm.group(1)), moves))
    return entries


def iter_named_initializer_blocks(content: str):
    """Yield ([IDENT] designator, block_body) for top-level designator-style entries."""
    i = 0
    n = len(content)
    while i < n:
        ob = content.find('[', i)
        if ob == -1:
            break
        cb = content.find(']', ob)
        if cb == -1:
            break
        name = content[ob+1:cb].strip()
        # Find '=' after ']'
        eq = content.find('=', cb)
        if eq == -1:
            break
        # Skip whitespace to '{'
        brace = content.find('{', eq)
        if brace == -1:
            break
        block, end = _extract_block(content, brace)
        yield name, block
        i = end + 1


def parse_parties(parties_h: str, species_consts: dict[str, int],
                  move_consts: dict[str, int]) -> dict[str, list]:
    """
    Parse trainer_parties.h.
    Returns {symbol: [(species_name, level, [move_names_or_empty]), ...]}
    Also recognises DUMMY_TRAINER_MON macro lines.
    """
    clean = _strip_comments(parties_h)
    parties: dict[str, list] = {}

    # Match: static const struct PARTYTYPE sParty_XXX[] = { ... };
    for m in re.finditer(
        r'static const (?:struct\s+)?(TrainerMon\w+)\s+(sParty_\w+)\s*\[\]\s*=\s*\{',
        clean
    ):
        party_type = m.group(1)
        sym = m.group(2)
        block, _ = _extract_block(clean, m.end() - 1)
        if "CustomMoves" in party_type or "Item" in party_type:
            entries = parse_party_custom_moves(block)
            parties[sym] = [(s, l, mv) for s, l, mv in entries]
        else:
            entries = parse_party_entries(block)
            parties[sym] = [(s, l, []) for s, l in entries]

    return parties


def parse_gtrainers(trainers_h: str) -> list[dict]:
    """Parse gTrainers[] — return list of raw trainer dicts keyed by position."""
    clean = _strip_comments(trainers_h)
    # Find gTrainers[] = {
    marker = "gTrainers[]"
    pos = clean.find(marker)
    if pos == -1:
        raise RuntimeError("Could not find gTrainers[] in trainers.h")
    brace = clean.find('{', pos)
    body, _ = _extract_block(clean, brace)

    out: list[dict] = []
    for idx, (designator, block) in enumerate(iter_named_initializer_blocks(body)):
        enc = re.search(r'\.trainerClass\s*=\s*(\w+)', block)
        enn = re.search(r'\.trainerName\s*=\s*_\("([^"]+)"\)', block)
        # Party can be stored via convenience macros (pre-preprocessor form):
        #   .party = NO_ITEM_DEFAULT_MOVES(sParty_Foo)
        #   .party = NO_ITEM_CUSTOM_MOVES(sParty_Foo)
        #   .party = ITEM_DEFAULT_MOVES(sParty_Foo)
        #   .party = ITEM_CUSTOM_MOVES(sParty_Foo)
        party_macro_re = re.compile(
            r'\.party\s*=\s*'
            r'(NO_ITEM_DEFAULT_MOVES|NO_ITEM_CUSTOM_MOVES|ITEM_DEFAULT_MOVES|ITEM_CUSTOM_MOVES)'
            r'\s*\(\s*(sParty_\w+)\s*\)'
        )
        eps = party_macro_re.search(block)
        macro_to_flags = {
            'NO_ITEM_DEFAULT_MOVES': '0',
            'NO_ITEM_CUSTOM_MOVES': 'F_TRAINER_PARTY_CUSTOM_MOVESET',
            'ITEM_DEFAULT_MOVES': 'F_TRAINER_PARTY_HELD_ITEM',
            'ITEM_CUSTOM_MOVES': 'F_TRAINER_PARTY_CUSTOM_MOVESET|F_TRAINER_PARTY_HELD_ITEM',
        }

        out.append({
            'designator': designator,
            'trainerClass': enc.group(1) if enc else '',
            'trainerName': enn.group(1) if enn else '???',
            'partySymbol': eps.group(2) if eps else '',
            'partyFlags': macro_to_flags.get(eps.group(1), '0') if eps else '0',
        })
    return out


# ---------------------------------------------------------------------------
# NPC type level computation (mirrors src/trainer_xp_system.c)
# ---------------------------------------------------------------------------
def _variance_seed(trainer_id: int, trainer_class: int, type_id: int) -> int:
    seed = trainer_id & 0xFFFFFFFF
    seed = (seed * 1103515245 + 12345 + trainer_class) & 0xFFFFFFFF
    seed ^= (type_id * 2654435761) & 0xFFFFFFFF
    seed ^= (seed >> 16)
    return seed & 0xFFFFFFFF


def compute_type_levels_base(
    trainer_id: int,
    trainer_class: int,
    party: list[Mon],
) -> list[int]:
    """Re-implementation of ComputeTrainerTypeLevelsBase()."""
    n = len(party)
    if n == 0:
        return [1] * NUM_TYPES

    raw = [0] * NUM_TYPES
    species_type_counts = [0] * NUM_TYPES
    move_type_counts = [0] * NUM_TYPES
    total_level = 0

    for mon in party:
        level = mon.level
        total_level += level
        t1, t2 = mon.type1, mon.type2

        if 0 <= t1 < NUM_TYPES and t1 != TYPE_MYSTERY:
            raw[t1] += level * 2 + 2
            species_type_counts[t1] += 1
        if 0 <= t2 < NUM_TYPES and t2 != TYPE_MYSTERY and t2 != t1:
            raw[t2] += level + 1
            species_type_counts[t2] += 1

        for move_id, move_type, power in mon.moves:
            if move_id == 0:
                continue
            if not (0 <= move_type < NUM_TYPES) or move_type == TYPE_MYSTERY:
                continue
            if power == 0:
                mw = level // 8
            elif power >= 80:
                mw = level // 4
            else:
                mw = level // 5
            if mw < 1:
                mw = 1
            if move_type == t1 or move_type == t2:
                mw += 1
            raw[move_type] += mw
            move_type_counts[move_type] += 1

    avg_level = max(1, total_level // n)

    # Dominant/minor species counts
    dominant_count = max(species_type_counts) if species_type_counts else 0
    sorted_counts = sorted(set(species_type_counts), reverse=True)
    minor_count = sorted_counts[1] if len(sorted_counts) > 1 else 0

    for i in range(NUM_TYPES):
        concentration = (species_type_counts[i] * 100) // n if n > 0 else 0

        if species_type_counts[i] >= 2:
            raw[i] += (species_type_counts[i] * avg_level) // 2

        if concentration >= 75:
            raw[i] += avg_level + 4
        elif concentration >= 50:
            raw[i] += avg_level // 2 + 2
        elif concentration >= 25:
            raw[i] += avg_level // 4

        if move_type_counts[i] >= n:
            raw[i] += avg_level // 4

        if species_type_counts[i] != 0 or move_type_counts[i] != 0:
            variance = (_variance_seed(trainer_id, trainer_class, i) % 5) - 2
            raw[i] += variance

    is_rival = trainer_class in (TRAINER_CLASS_RIVAL_EARLY, TRAINER_CLASS_RIVAL_LATE)
    is_champion_first = trainer_id in CHAMPION_FIRST_IDS

    if is_rival or is_champion_first:
        for i in range(NUM_TYPES):
            if species_type_counts[i] != 0:
                raw[i] += avg_level // 3 + 2
            elif move_type_counts[i] >= 2:
                raw[i] += avg_level // 4 + 1
    elif trainer_class == TRAINER_CLASS_LEADER and dominant_count:
        major = avg_level // 2 + 4
        minor = avg_level // 4 + 1
        for i in range(NUM_TYPES):
            if species_type_counts[i] == dominant_count:
                raw[i] += major
            elif minor_count and species_type_counts[i] == minor_count:
                raw[i] += minor
    elif trainer_class == TRAINER_CLASS_ELITE_FOUR and dominant_count:
        major = avg_level // 2 + 6
        minor = avg_level // 3 + 2
        for i in range(NUM_TYPES):
            if species_type_counts[i] == dominant_count:
                raw[i] += major
            elif minor_count and species_type_counts[i] == minor_count:
                raw[i] += minor
    elif trainer_class == TRAINER_CLASS_CHAMPION and dominant_count:
        major = avg_level // 2 + 8
        minor = avg_level // 3 + 3
        for i in range(NUM_TYPES):
            if species_type_counts[i] == dominant_count:
                raw[i] += major
            elif minor_count and species_type_counts[i] == minor_count:
                raw[i] += minor

    levels = []
    for i in range(NUM_TYPES):
        exp_est = max(0, raw[i]) * NPC_TYPE_RAW_TO_EXP_MULTIPLIER
        exp_est = min(exp_est, 65535)
        levels.append(calculate_type_level_from_exp(i, exp_est))

    # Cap: no type level may exceed the trainer's avg pokemon level + 10
    cap = min(avg_level + 10, 100)
    levels = [min(lv, cap) for lv in levels]
    return levels


def compute_type_levels(trainer_id: int, trainer: 'Trainer',
                        all_trainers: dict[int, 'Trainer']) -> list[int]:
    """Mirror ComputeTrainerTypeLevels() — handles rival progression accumulation."""
    if trainer_id not in ALL_RIVAL_IDS:
        return compute_type_levels_base(trainer_id, trainer.trainer_class, trainer.party)

    chain = _RIVAL_CHAINS[trainer_id]
    levels = [1] * NUM_TYPES
    for cid in chain:
        ct = all_trainers.get(cid)
        if ct is None:
            continue
        temp = compute_type_levels_base(cid, ct.trainer_class, ct.party)
        for j in range(NUM_TYPES):
            if temp[j] > levels[j]:
                levels[j] = temp[j]
        if cid == trainer_id:
            break
    return levels


# ---------------------------------------------------------------------------
# Location formatting
# ---------------------------------------------------------------------------
def _camel_to_spaces(s: str) -> str:
    """'CeruleanCity_Gym' → 'Cerulean City Gym'"""
    s = s.replace('_', ' ')
    return re.sub(r'([a-z])([A-Z])', r'\1 \2', s)


def format_location(loc: str) -> str:
    # Remove trailing digits (e.g. Route3_EventScript → Route3)
    loc = re.sub(r'_EventScript.*', '', loc)
    return _camel_to_spaces(loc)


# ---------------------------------------------------------------------------
# Markdown generation
# ---------------------------------------------------------------------------
def write_reference(trainers: list[Trainer], out_path: Path) -> None:
    # Group by location
    by_location: dict[str, list[Trainer]] = defaultdict(list)
    for t in trainers:
        by_location[t.location].append(t)

    # Sort locations by game progression
    sorted_locs = sorted(by_location.keys(), key=location_sort_key)

    type_names = [TYPE_NAMES[i] for i in range(NUM_TYPES)]

    lines: list[str] = [
        "# NPC Trainer Type Level Reference",
        "",
        "Generated by `tools/export_npc_type_levels.py`.",
        "",
        "Each trainer entry shows:",
        "- **Party**: their Pokémon and levels (for identification during play-testing)",
        "- **Type Levels**: the 18 NPC type-bonus levels that the game computes for that",
        "  trainer using `ComputeTrainerTypeLevels()`.  Only types with level > 1 are shown.",
        "",
        "Type-level tier reference (how fast each type levels up):",
        "| Tier | Types | Max XP |",
        "|------|-------|--------|",
        "| Fast | Bug | 7500 |",
        "| Medium | Normal, Fighting, Flying, Poison, Ground, Rock, Ghost, Steel, Dark | 15000 |",
        "| Med-Slow | Fire, Water, Grass, Electric, Ice | 24000 |",
        "| Slow | Psychic, Dragon | 36000 |",
        "",
        "---",
        "",
    ]

    for loc_raw in sorted_locs:
        loc_display = format_location(loc_raw)
        lines.append(f"## {loc_display}")
        lines.append("")

        for t in sorted(by_location[loc_raw], key=lambda x: x.trainer_id):
            party_str = ", ".join(
                f"{m.species_name} Lv{m.level}" for m in t.party
            )
            tl = t.type_levels
            active_types = [(i, tl[i]) for i in range(NUM_TYPES)
                            if i != TYPE_MYSTERY and tl[i] > 1]
            type_parts = [f"{TYPE_NAMES[i]}: {lv}" for i, lv in active_types]
            type_str = " | ".join(type_parts) if type_parts else "all 1"

            lines.append(
                f"### {t.trainer_name} — {t.trainer_class_name}"
                f"  *(ID {t.trainer_id})*"
            )
            lines.append(f"- **Party**: {party_str}")
            lines.append(f"- **Type Levels**: {type_str}")
            lines.append("")

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {sum(len(v) for v in by_location.values())} trainer entries to {out_path}")


def write_runtime_table(trainers: list[Trainer], out_path: Path) -> None:
    """Write generated C source consumed by trainer_xp_system.c runtime lookup."""
    entries = sorted(trainers, key=lambda t: t.trainer_id)
    lines: list[str] = [
        "// Auto-generated by tools/export_npc_type_levels.py",
        "// Do not edit manually.",
        "",
        "#include \"global.h\"",
        "#include \"trainer_type_npc_levels.h\"",
        "",
        "const struct NpcTrainerTypeLevelEntry gNpcTrainerTypeLevelEntries[] = {",
    ]

    for t in entries:
        level_list = ", ".join(str(v) for v in t.type_levels)
        lines.append(f"    {{{t.trainer_id}, {{{level_list}}}}},")

    lines.extend([
        "};",
        "",
        "const u16 gNpcTrainerTypeLevelEntryCount = ARRAY_COUNT(gNpcTrainerTypeLevelEntries);",
        "",
    ])

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote runtime table with {len(entries)} trainers to {out_path}")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", default=".", help="Path to repo root")
    args = ap.parse_args()
    repo = Path(args.repo)

    # ---- Load source files ----
    opponents_h   = (repo / "include/constants/opponents.h").read_text()
    trainers_h_c  = (repo / "include/constants/trainers.h").read_text()
    pokemon_h     = (repo / "include/constants/pokemon.h").read_text()
    moves_h       = (repo / "include/constants/moves.h").read_text()
    species_info  = (repo / "src/data/pokemon/species_info.h").read_text()
    battle_moves  = (repo / "src/data/battle_moves.h").read_text()
    learnsets     = (repo / "src/data/pokemon/level_up_learnsets.h").read_text()
    ls_pointers   = (repo / "src/data/pokemon/level_up_learnset_pointers.h").read_text()
    trainers_data = (repo / "src/data/trainers.h").read_text()
    parties_data  = (repo / "src/data/trainer_parties.h").read_text()
    trainers_inc  = (repo / "data/scripts/trainers.inc").read_text()

    print("Parsing constants…")
    species_consts = parse_defines(opponents_h)  # includes SPECIES_* if present
    species_consts.update(parse_defines(
        (repo / "include/constants/species.h").read_text()
        if (repo / "include/constants/species.h").exists()
        else ""
    ))
    # Also pick up from pokemon.h (has NUM_SPECIES etc.)
    species_consts.update({
        k: v for k, v in parse_defines(pokemon_h).items()
        if k.startswith("SPECIES_") or k.startswith("NUM_")
    })

    move_consts = parse_defines(moves_h)
    trainer_id_consts = parse_defines(opponents_h)
    trainer_class_defs = parse_trainer_classes(trainers_h_c)

    print("Parsing species types…")
    species_types = parse_species_info(species_info, species_consts)

    print("Parsing move info…")
    move_info = parse_move_info(battle_moves, move_consts)

    print("Parsing learnsets…")
    learnset_db = parse_learnsets(learnsets, ls_pointers, move_consts, species_consts)

    print("Parsing trainer locations…")
    trainer_locations = parse_trainer_locations(trainers_inc)

    print("Parsing parties…")
    parties = parse_parties(parties_data, species_consts, move_consts)

    print("Parsing gTrainers[]…")
    raw_trainers = parse_gtrainers(trainers_data)

    # ---- Build Trainer objects ----
    MIN_REAL = 89
    all_trainers: dict[int, Trainer] = {}

    for idx, raw in enumerate(raw_trainers):
        trainer_id_name = raw['designator']
        tid = trainer_id_consts.get(trainer_id_name, -1)
        if tid < MIN_REAL:
            continue

        tc_name = raw['trainerClass']
        tc_id = trainer_class_defs.get(tc_name, 0)

        trainer = Trainer(
            trainer_id=tid,
            trainer_name=raw['trainerName'],
            trainer_class=tc_id,
            trainer_class_name=parse_trainer_class_name(tc_id, trainer_class_defs),
        )

        # Resolve location
        loc = trainer_locations.get(trainer_id_name, "Unknown")
        trainer.location = loc

        # Build party
        party_sym = raw['partySymbol']
        party_entries = parties.get(party_sym, [])
        for entry in party_entries:
            sname, level = entry[0], entry[1]
            custom_moves_names = entry[2] if len(entry) > 2 else []
            sid = species_consts.get(sname, 0)
            t1, t2 = species_types.get(sid, (0, 0))

            if custom_moves_names:
                moves: list[tuple[int, int, int]] = []
                for mn in custom_moves_names:
                    mid = move_consts.get(mn, 0)
                    mt, pw = move_info.get(mid, (0, 0))
                    moves.append((mid, mt, pw))
            else:
                default_m = get_default_moves(sid, level, learnset_db)
                moves = []
                for mid in default_m:
                    mt, pw = move_info.get(mid, (0, 0))
                    moves.append((mid, mt, pw))

            trainer.party.append(Mon(
                species_id=sid,
                species_name=sname.replace("SPECIES_", ""),
                level=level,
                type1=t1,
                type2=t2,
                moves=moves,
            ))

        all_trainers[tid] = trainer

    print(f"Loaded {len(all_trainers)} trainers.")

    # ---- Compute type levels ----
    print("Computing NPC type levels…")
    for tid, trainer in all_trainers.items():
        trainer.type_levels = compute_type_levels(tid, trainer, all_trainers)

    # ---- Write output ----
    out_path = repo / "docs/trainer_type_level_reference.md"
    trainers_list = list(all_trainers.values())
    write_reference(trainers_list, out_path)

    runtime_table_path = repo / "src/data/trainer_type_npc_levels.c"
    write_runtime_table(trainers_list, runtime_table_path)


if __name__ == "__main__":
    main()
