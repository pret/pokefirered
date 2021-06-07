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

void InitTMCase(u8 type, void (* callback)(void), u8 selectToCancel);
void ResetTMCaseCursorPos(void);
void Pokedude_InitTMCase(void);

#endif //GUARD_TM_CASE_H
