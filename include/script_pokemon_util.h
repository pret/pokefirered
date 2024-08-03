#ifndef GUARD_SCRIPT_POKEMON_UTIL_H
#define GUARD_SCRIPT_POKEMON_UTIL_H

u32 ScriptGiveMon(u16 species, u8 level, u16 item);
bool8 ScriptGiveEgg(u16 species);
void ScriptSetMonMoveSlot(u8 partyIdx, u16 move, u8 slot);
void HealPlayerParty(void);
void ReducePlayerPartyToSelectedMons(void);
void CreateScriptedWildMon(u16 species, u8 level, u16 item);
void CreateScriptedDoubleWildMon(u16 species1, u8 level1, u16 item1, u16 species2, u8 level2, u16 item2);

#endif //GUARD_SCRIPT_POKEMON_UTIL_H
