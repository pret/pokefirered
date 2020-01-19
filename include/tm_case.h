#ifndef GUARD_TM_CASE_H
#define GUARD_TM_CASE_H

enum TmCaseType
{
    TMCASE_FROMFIELD,
    TMCASE_FROMPARTYGIVE,
    TMCASE_FROMMARTSELL,
    TMCASE_FROMPOKEMONSTORAGEPC,
    TMCASE_FROMBATTLE,
    TMCASE_NA
};

void InitTMCase(u8 a0, void (* a1)(void), u8 a2);
void ResetTMCaseCursorPos(void);
void Pokedude_InitTMCase(void);

#endif //GUARD_TM_CASE_H
