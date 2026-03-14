# gen3_national_equalized_bst_v2.py
# Python 3.10+
#
# Dependencies:
#   pip install requests
#
# Run:
#   python gen3_national_equalized_bst_v2.py > gen3_national_equalized_bst.csv
#
# What it does (Gen 3 National Dex: #001-#386):
# - Uses PokéAPI to iterate species IDs 1..386 (true National Dex order for Gen 3)
# - Fetches Gen 3 base stats (from /pokemon/{id})
# - Computes evolutionary stage using evolution chains pruned to Gen <= 3
#   IMPORTANT PATCH: if an out-of-gen pre-evo is the chain root (e.g., Happiny Gen 4),
#   we *promote* in-gen descendants so Chansey->Blissey is still staged correctly.
# - Applies BST targets:
#     Stage 1 (basic): 360
#     Stage 2 (middle of 3-stage lines): 450
#     Finals + single-stage: 540
#     Pseudo-legendary finals (soft legendary): 570
#     Legendaries: 600 (Mewtwo: 680)
#     Mythicals: 600
# - Scales stats proportionally to hit the target BST exactly and outputs CSV.
#
# Primeape patch:
# - Later-gen evolutions (e.g., Annihilape) are removed by the Gen<=3 prune, so Primeape
#   becomes final again and gets 540.
#
# Chansey patch:
# - Happiny (Gen 4) is removed; Chansey becomes a root in the pruned forest, but still
#   connects to Blissey (Gen 2), so Chansey is stage 1 of max_stage 2 and targets 360.

import csv
import math
import sys
import time
from typing import Dict, List, Tuple, Optional

import requests

POKEAPI = "https://pokeapi.co/api/v2"

GEN_CUTOFF = 3
GEN_MAP = {
    "generation-i": 1,
    "generation-ii": 2,
    "generation-iii": 3,
    "generation-iv": 4,
    "generation-v": 5,
    "generation-vi": 6,
    "generation-vii": 7,
    "generation-viii": 8,
    "generation-ix": 9,
}

# Set to a small value (e.g., 0.05) if you hit rate limits/timeouts
REQUEST_DELAY_SEC = 0.0

# ----------------------------
# HTTP / JSON with light retry
# ----------------------------
SESSION = requests.Session()
SESSION.headers.update({"User-Agent": "gen3-natdex-equalizer/1.0"})

def get_json(url: str, *, tries: int = 5, timeout: int = 30):
    last = None
    for attempt in range(tries):
        try:
            if REQUEST_DELAY_SEC:
                time.sleep(REQUEST_DELAY_SEC)
            r = SESSION.get(url, timeout=timeout)
            r.raise_for_status()
            return r.json()
        except Exception as ex:
            last = ex
            # simple backoff
            time.sleep(0.5 * (attempt + 1))
    raise RuntimeError(f"Failed GET {url}: {last}")

# ----------------------------
# Caches
# ----------------------------
_species_cache: Dict[str, dict] = {}
_species_by_id_cache: Dict[int, dict] = {}
_evo_chain_cache: Dict[str, dict] = {}
_stageinfo_cache_by_chain_url: Dict[str, Dict[str, Tuple[int, int]]] = {}

def get_species_by_name(name: str) -> dict:
    name = name.lower()
    if name not in _species_cache:
        _species_cache[name] = get_json(f"{POKEAPI}/pokemon-species/{name}/")
    return _species_cache[name]

def get_species_by_id(natdex_no: int) -> dict:
    if natdex_no not in _species_by_id_cache:
        _species_by_id_cache[natdex_no] = get_json(f"{POKEAPI}/pokemon-species/{natdex_no}/")
    return _species_by_id_cache[natdex_no]

def introduced_gen_number(species_name: str) -> int:
    sp = get_species_by_name(species_name)
    return GEN_MAP.get(sp["generation"]["name"], 999)

# ----------------------------
# Evolution chain pruning (Gen<=3) with "promote descendants" patch
# ----------------------------
def prune_chain_to_gen_promote(node: dict, gen_cutoff: int = GEN_CUTOFF) -> List[dict]:
    """
    Returns a LIST of pruned nodes (a 'forest'), because pruning can remove the original root.
    Patch behavior:
      - If node is out-of-gen (>cutoff), we discard it but recursively keep and PROMOTE
        any in-gen descendants (so Happiny is removed but Chansey remains as a root).
      - If node is in-gen, we keep it; for each child:
          - if child is removed, we attach (promote) that child's in-gen descendants directly.
    """
    name = node["species"]["name"]
    children = node.get("evolves_to", []) or []

    # prune children first (each returns a list of nodes)
    pruned_children: List[dict] = []
    for ch in children:
        pruned_children.extend(prune_chain_to_gen_promote(ch, gen_cutoff))

    if introduced_gen_number(name) > gen_cutoff:
        # discard this node, promote its pruned children as new roots
        return pruned_children

    # keep this node; attach pruned children
    kept = {
        "species": node["species"],
        "evolution_details": node.get("evolution_details", []),
        "evolves_to": pruned_children,
    }
    return [kept]

def compute_stage_info_from_forest(roots: List[dict]) -> Dict[str, Tuple[int, int]]:
    """
    Computes (stage, max_stage) for each species in the pruned forest.
    - stage = minimum index along any root->leaf path (1-based)
    - max_stage = maximum path length within that component
    Handles branching evolutions correctly (Eevee etc).
    Returns: map species_name -> (stage, max_stage)
    """
    out: Dict[str, Tuple[int, int]] = {}

    def gather_paths(root: dict) -> List[List[str]]:
        paths: List[List[str]] = []

        def dfs(node: dict, path: List[str]):
            nm = node["species"]["name"]
            path2 = path + [nm]
            kids = node.get("evolves_to", []) or []
            if not kids:
                paths.append(path2)
                return
            for k in kids:
                dfs(k, path2)

        dfs(root, [])
        return paths

    # Each root corresponds to a component after pruning/promoting.
    for r in roots:
        paths = gather_paths(r)
        if not paths:
            continue
        max_len = max(len(p) for p in paths)

        # stage = min index across paths; max_stage = component max_len
        stage_min: Dict[str, int] = {}
        for p in paths:
            for idx, nm in enumerate(p, start=1):
                stage_min[nm] = min(stage_min.get(nm, idx), idx)

        for nm, st in stage_min.items():
            # If a species somehow appears in multiple components (shouldn't), keep the "longer"
            # max_stage, and the smallest stage.
            if nm in out:
                old_st, old_mx = out[nm]
                out[nm] = (min(old_st, st), max(old_mx, max_len))
            else:
                out[nm] = (st, max_len)

    return out

def get_stageinfo_for_species(species: dict) -> Tuple[int, int]:
    """
    Fetch/prune the chain once per evolution_chain URL and return stage/max_stage for this species.
    """
    chain_url = species["evolution_chain"]["url"]
    if chain_url not in _stageinfo_cache_by_chain_url:
        if chain_url not in _evo_chain_cache:
            _evo_chain_cache[chain_url] = get_json(chain_url)
        chain = _evo_chain_cache[chain_url]["chain"]

        pruned_roots = prune_chain_to_gen_promote(chain, GEN_CUTOFF)
        stageinfo = compute_stage_info_from_forest(pruned_roots)
        _stageinfo_cache_by_chain_url[chain_url] = stageinfo

    name = species["name"]
    stageinfo = _stageinfo_cache_by_chain_url[chain_url]
    # Default for oddities: treat as single-stage
    return stageinfo.get(name, (1, 1))

# ----------------------------
# Stat scaling + targeting
# ----------------------------
def scale_stats_to_target(orig_stats: List[int], target: int) -> List[int]:
    """
    Proportionally scale [HP,Atk,Def,SpA,SpD,Spe] to sum exactly to target.
    Largest remainder rounding after flooring.
    """
    orig_total = sum(orig_stats)
    if orig_total <= 0:
        raise ValueError("Invalid original BST")

    factor = target / orig_total
    scaled = [s * factor for s in orig_stats]
    floors = [math.floor(x) for x in scaled]
    fracs = [x - f for x, f in zip(scaled, floors)]

    out = floors[:]
    diff = target - sum(out)

    if diff > 0:
        order = sorted(range(6), key=lambda i: fracs[i], reverse=True)
        for i in range(diff):
            out[order[i % 6]] += 1
    elif diff < 0:
        order = sorted(range(6), key=lambda i: fracs[i])
        i = 0
        while diff < 0:
            idx = order[i % 6]
            if out[idx] > 1:
                out[idx] -= 1
                diff += 1
            i += 1
            if i > 10000:
                raise RuntimeError("Rounding reconciliation failed")

    return out

def is_pseudo_legendary_final(is_legendary: bool, is_mythical: bool, stage: int, max_stage: int, orig_bst: int) -> bool:
    """
    Canonical pseudo-legendaries have BST=600 and are final forms of 3-stage lines.
    Works for Gen 3 pseudos: Dragonite, Tyranitar, Salamence, Metagross.
    """
    if is_legendary or is_mythical:
        return False
    if max_stage < 3 or stage != max_stage:
        return False
    return orig_bst == 600

def target_bst(species_name: str, is_legendary: bool, is_mythical: bool, is_pseudo_final: bool,
               stage: int, max_stage: int) -> int:
    n = species_name.lower()

    # Special tiers
    if is_mythical:
        return 600
    if is_legendary:
        return 680 if n == "mewtwo" else 600

    # Soft-legend pseudos
    if is_pseudo_final:
        return 570

    # Normal tiers
    if max_stage == 1:
        return 540
    if stage == 1:
        return 360
    if stage == 2 and max_stage >= 3:
        return 450
    return 540

# ----------------------------
# Main: Gen 3 National Dex 1..386
# ----------------------------
def main():
    w = csv.writer(sys.stdout, lineterminator="\n")
    w.writerow([
        "dex_no","name",
        "stage","max_stage",
        "is_legendary","is_mythical","is_pseudo",
        "orig_hp","orig_atk","orig_def","orig_spa","orig_spd","orig_spe","orig_bst",
        "target_bst",
        "new_hp","new_atk","new_def","new_spa","new_spd","new_spe","new_bst",
    ])

    for dex_no in range(1, 387):
        # Species (gives legend/mythical + evo chain)
        species = get_species_by_id(dex_no)
        name = species["name"]

        is_legendary = bool(species["is_legendary"])
        is_mythical = bool(species["is_mythical"])

        stage, max_stage = get_stageinfo_for_species(species)

        # Base stats: use /pokemon/{id} to keep aligned with NatDex ID 1..386
        mon = get_json(f"{POKEAPI}/pokemon/{dex_no}/")
        stat_by = {s["stat"]["name"]: s["base_stat"] for s in mon["stats"]}
        orig = [
            stat_by["hp"],
            stat_by["attack"],
            stat_by["defense"],
            stat_by["special-attack"],
            stat_by["special-defense"],
            stat_by["speed"],
        ]
        orig_bst = sum(orig)

        is_pseudo = is_pseudo_legendary_final(is_legendary, is_mythical, stage, max_stage, orig_bst)
        tgt = target_bst(name, is_legendary, is_mythical, is_pseudo, stage, max_stage)
        new_stats = scale_stats_to_target(orig, tgt)

        w.writerow([
            dex_no, name,
            stage, max_stage,
            int(is_legendary), int(is_mythical), int(is_pseudo),
            *orig, orig_bst,
            tgt,
            *new_stats, sum(new_stats)
        ])

if __name__ == "__main__":
    main()