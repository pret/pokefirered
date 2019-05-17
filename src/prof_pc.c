#include "global.h"
#include "event_data.h"
#include "pokedex.h"
#include "field_message_box.h"
#include "constants/species.h"

extern const u8 gUnknown_81A6D17[];
extern const u8 gUnknown_81A6D6D[];
extern const u8 gUnknown_81A6DDF[];
extern const u8 gUnknown_81A6E36[];
extern const u8 gUnknown_81A6EA4[];
extern const u8 gUnknown_81A6F0B[];
extern const u8 gUnknown_81A6F71[];
extern const u8 gUnknown_81A6FAB[];
extern const u8 gUnknown_81A6FF1[];
extern const u8 gUnknown_81A7031[];
extern const u8 gUnknown_81A7063[];
extern const u8 gUnknown_81A70A5[];
extern const u8 gUnknown_81A70D8[];
extern const u8 gUnknown_81A7108[];
extern const u8 gUnknown_81A7137[];
extern const u8 gUnknown_81A7175[];

u16 Special_GetPokedexCount(void)
{
    if (gSpecialVar_0x8004 == 0)
    {
        gSpecialVar_0x8005 = sub_8088EDC(0);
        gSpecialVar_0x8006 = sub_8088EDC(1);
    }
    else
    {
        gSpecialVar_0x8005 = pokedex_count(0);
        gSpecialVar_0x8006 = pokedex_count(1);
    }
    return sub_806E25C();
}

const u8 * sub_80CA424(u16 count)
{
    gSpecialVar_Result = FALSE;

    if (count < 10)
        return gUnknown_81A6D17;

    if (count < 20)
        return gUnknown_81A6D6D;

    if (count < 30)
        return gUnknown_81A6DDF;

    if (count < 40)
        return gUnknown_81A6E36;

    if (count < 50)
        return gUnknown_81A6EA4;

    if (count < 60)
        return gUnknown_81A6F0B;

    if (count < 70)
        return gUnknown_81A6F71;

    if (count < 80)
        return gUnknown_81A6FAB;

    if (count < 90)
        return gUnknown_81A6FF1;

    if (count < 100)
        return gUnknown_81A7031;

    if (count < 110)
        return gUnknown_81A7063;

    if (count < 120)
        return gUnknown_81A70A5;

    if (count < 130)
        return gUnknown_81A70D8;

    if (count < 140)
        return gUnknown_81A7108;

    if (count < 150)
        return gUnknown_81A7137;

    if (count == 150)
    {
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(SPECIES_MEW), 1))
            return gUnknown_81A7137;
        gSpecialVar_Result = TRUE;
        return gUnknown_81A7175;
    }

    if (count == 151)
    {
        gSpecialVar_Result = TRUE;
        return gUnknown_81A7175;
    }

    return gUnknown_81A6D17;
}

void sub_80CA524(void)
{
    ShowFieldMessage(sub_80CA424(gSpecialVar_0x8004));
}
