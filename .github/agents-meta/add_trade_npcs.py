#!/usr/bin/env python3
"""Add trade NPC objects and scripts to Pokemon Centers."""
import json
import os

# Trade NPC definitions: (map_name, trade_const, flag_name, nickname, npc_gfx, x, y)
trades = [
    # Gen 2 starters
    ("PewterCity_PokemonCenter_1F", "INGAME_TRADE_CHIKORITA", "FLAG_DID_CHIKORITA_TRADE", "CHICORY", "OBJ_EVENT_GFX_WOMAN_2", 3, 5),
    ("VermilionCity_PokemonCenter_1F", "INGAME_TRADE_CYNDAQUIL", "FLAG_DID_CYNDAQUIL_TRADE", "CYNDER", "OBJ_EVENT_GFX_BLACKBELT", 10, 3),
    ("CeruleanCity_PokemonCenter_1F", "INGAME_TRADE_TOTODILE", "FLAG_DID_TOTODILE_TRADE", "SNAPPY", "OBJ_EVENT_GFX_LASS", 13, 6),
    # Gen 3 starters
    ("CeladonCity_PokemonCenter_1F", "INGAME_TRADE_TREECKO", "FLAG_DID_TREECKO_TRADE", "GECKO", "OBJ_EVENT_GFX_YOUNGSTER", 3, 6),
    ("LavenderTown_PokemonCenter_1F", "INGAME_TRADE_TORCHIC", "FLAG_DID_TORCHIC_TRADE", "BLAZE", "OBJ_EVENT_GFX_ROCKER", 12, 4),
    ("FuchsiaCity_PokemonCenter_1F", "INGAME_TRADE_MUDKIP", "FLAG_DID_MUDKIP_TRADE", "KIPPY", "OBJ_EVENT_GFX_WOMAN_1", 3, 5),
    # Special Pokemon
    ("SaffronCity_PokemonCenter_1F", "INGAME_TRADE_CASTFORM", "FLAG_DID_CASTFORM_TRADE", "CLOUDY", "OBJ_EVENT_GFX_SCIENTIST", 12, 3),
    ("CinnabarIsland_PokemonCenter_1F", "INGAME_TRADE_KECLEON", "FLAG_DID_KECLEON_TRADE", "SHIFTY", "OBJ_EVENT_GFX_COOLTRAINER_M", 4, 6),
    # Legendaries
    ("OneIsland_PokemonCenter_1F", "INGAME_TRADE_RAIKOU", "FLAG_DID_RAIKOU_TRADE", "RAIKOU", "OBJ_EVENT_GFX_GENTLEMAN", 12, 4),
    ("ThreeIsland_PokemonCenter_1F", "INGAME_TRADE_ENTEI", "FLAG_DID_ENTEI_TRADE", "ENTEI", "OBJ_EVENT_GFX_GENTLEMAN", 5, 6),
    ("FourIsland_PokemonCenter_1F", "INGAME_TRADE_SUICUNE", "FLAG_DID_SUICUNE_TRADE", "SUICUNE", "OBJ_EVENT_GFX_GENTLEMAN", 12, 4),
    ("IndigoPlateau_PokemonCenter_1F", "INGAME_TRADE_HO_OH", "FLAG_DID_HO_OH_TRADE", "HO-OH", "OBJ_EVENT_GFX_GENTLEMAN", 18, 10),
]

for map_name, trade_const, flag_name, nickname, gfx, x, y in trades:
    # 1. Add object to map.json
    map_json_path = f"data/maps/{map_name}/map.json"
    with open(map_json_path) as f:
        map_data = json.load(f)
    
    script_label = f"{map_name}_EventScript_Trader"
    
    new_obj = {
        "type": "object",
        "graphics_id": gfx,
        "x": x,
        "y": y,
        "elevation": 3,
        "movement_type": "MOVEMENT_TYPE_FACE_DOWN",
        "movement_range_x": 1,
        "movement_range_y": 1,
        "trainer_type": "TRAINER_TYPE_NONE",
        "trainer_sight_or_berry_tree_id": "0",
        "script": script_label,
        "flag": "0"
    }
    
    map_data["object_events"].append(new_obj)
    
    with open(map_json_path, 'w') as f:
        json.dump(map_data, f, indent=4)
        f.write('\n')
    
    # 2. Add trade script to scripts.inc
    script_path = f"data/maps/{map_name}/scripts.inc"
    
    trade_script = f"""
{script_label}::
\tlock
\tfaceplayer
\tsetvar VAR_0x8008, {trade_const}
\tcall EventScript_GetInGameTradeSpeciesInfo
\tgoto_if_set {flag_name}, {map_name}_EventScript_AlreadyTraded
\tmsgbox Trade_Text_LookingForMonWannaTradeForMon, MSGBOX_YESNO
\tgoto_if_eq VAR_RESULT, NO, {map_name}_EventScript_DeclineTrade
\tcall EventScript_ChooseMonForInGameTrade
\tgoto_if_ge VAR_0x8004, PARTY_SIZE, {map_name}_EventScript_DeclineTrade
\tcall EventScript_GetInGameTradeSpecies
\tgoto_if_ne VAR_RESULT, VAR_0x8009, {map_name}_EventScript_NotRequestedMon
\tcall EventScript_DoInGameTrade
\tmsgbox Trade_Text_HeyThanks
\tsetflag {flag_name}
\trelease
\tend

{map_name}_EventScript_DeclineTrade::
\tmsgbox Trade_Text_AwwOhWell
\trelease
\tend

{map_name}_EventScript_NotRequestedMon::
\tbufferspeciesname STR_VAR_1, VAR_0x8009
\tmsgbox Trade_Text_WhatThatsNoMon
\trelease
\tend

{map_name}_EventScript_AlreadyTraded::
\tmsgbox Trade_Text_IsntMyOldMonGreat
\trelease
\tend
"""
    
    with open(script_path, 'a') as f:
        f.write(trade_script)
    
    print(f"Added {nickname} trader to {map_name} at ({x},{y})")

print("\nDone! Added 12 trade NPCs to Pokemon Centers.")
