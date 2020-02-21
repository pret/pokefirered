#include "global.h"
#include "text.h"
#include "string_util.h"
#include "constants/object_events.h"

static EWRAM_DATA const u8 *sStringPointers[8] = {0};

static const u8 sTextColorTable[] =
{
 // [LOW_NYBBLE / 2]                               = 0xXY, // HIGH_NYBBLE
    [OBJECT_EVENT_GFX_RED_NORMAL / 2]              = 0x00, // OBJECT_EVENT_GFX_RED_BIKE
    [OBJECT_EVENT_GFX_RED_RUN / 2]                 = 0x00, // OBJECT_EVENT_GFX_RED_ITEM
    [OBJECT_EVENT_GFX_RED_FISH / 2]                = 0x00, // OBJECT_EVENT_GFX_RED_ITEM_COPY
    [OBJECT_EVENT_GFX_RED_VS_SEEKER / 2]           = 0x10, // OBJECT_EVENT_GFX_GREEN_NORMAL
    [OBJECT_EVENT_GFX_GREEN_BIKE / 2]              = 0x11, // OBJECT_EVENT_GFX_GREEN_RUN
    [OBJECT_EVENT_GFX_GREEN_ITEM / 2]              = 0x11, // OBJECT_EVENT_GFX_GREEN_FISH
    [OBJECT_EVENT_GFX_GREEN_ITEM_COPY / 2]         = 0x11, // OBJECT_EVENT_GFX_GREEN_VS_SEEKER
    [OBJECT_EVENT_GFX_RS_BRENDAN / 2]              = 0x10, // OBJECT_EVENT_GFX_RS_MAY
    [OBJECT_EVENT_GFX_LITTLE_BOY / 2]              = 0x10, // OBJECT_EVENT_GFX_LITTLE_GIRL
    [OBJECT_EVENT_GFX_YOUNGSTER / 2]               = 0x00, // OBJECT_EVENT_GFX_BOY
    [OBJECT_EVENT_GFX_BUG_CATCHER / 2]             = 0x00, // OBJECT_EVENT_GFX_SITTING_BOY
    [OBJECT_EVENT_GFX_LASS / 2]                    = 0x11, // OBJECT_EVENT_GFX_WOMAN_1
    [OBJECT_EVENT_GFX_BATTLE_GIRL / 2]             = 0x01, // OBJECT_EVENT_GFX_MAN
    [OBJECT_EVENT_GFX_ROCKER / 2]                  = 0x00, // OBJECT_EVENT_GFX_FAT_MAN
    [OBJECT_EVENT_GFX_WOMAN_2 / 2]                 = 0x11, // OBJECT_EVENT_GFX_BEAUTY
    [OBJECT_EVENT_GFX_BALDING_MAN / 2]             = 0x10, // OBJECT_EVENT_GFX_WOMAN_3
    [OBJECT_EVENT_GFX_OLD_MAN_1 / 2]               = 0x00, // OBJECT_EVENT_GFX_OLD_MAN_2
    [OBJECT_EVENT_GFX_OLD_MAN_LYING_DOWN / 2]      = 0x10, // OBJECT_EVENT_GFX_OLD_WOMAN
    [OBJECT_EVENT_GFX_TUBER_M_1 / 2]               = 0x10, // OBJECT_EVENT_GFX_TUBER_F
    [OBJECT_EVENT_GFX_TUBER_M_2 / 2]               = 0x00, // OBJECT_EVENT_GFX_CAMPER
    [OBJECT_EVENT_GFX_PICNICKER / 2]               = 0x01, // OBJECT_EVENT_GFX_COOLTRAINER_M
    [OBJECT_EVENT_GFX_COOLTRAINER_F / 2]           = 0x01, // OBJECT_EVENT_GFX_SWIMMER_M_WATER
    [OBJECT_EVENT_GFX_SWIMMER_F_WATER / 2]         = 0x01, // OBJECT_EVENT_GFX_SWIMMER_M_LAND
    [OBJECT_EVENT_GFX_SWIMMER_F_LAND / 2]          = 0x01, // OBJECT_EVENT_GFX_WORKER_M
    [OBJECT_EVENT_GFX_WORKER_F / 2]                = 0x01, // OBJECT_EVENT_GFX_ROCKET_M
    [OBJECT_EVENT_GFX_ROCKET_F / 2]                = 0x01, // OBJECT_EVENT_GFX_GBA_KID
    [OBJECT_EVENT_GFX_SUPER_NERD / 2]              = 0x00, // OBJECT_EVENT_GFX_BIKER
    [OBJECT_EVENT_GFX_BLACKBELT / 2]               = 0x00, // OBJECT_EVENT_GFX_SCIENTIST
    [OBJECT_EVENT_GFX_HIKER / 2]                   = 0x00, // OBJECT_EVENT_GFX_FISHER
    [OBJECT_EVENT_GFX_CHANNELER / 2]               = 0x01, // OBJECT_EVENT_GFX_CHEF
    [OBJECT_EVENT_GFX_POLICEMAN / 2]               = 0x00, // OBJECT_EVENT_GFX_GENTLEMAN
    [OBJECT_EVENT_GFX_SAILOR / 2]                  = 0x00, // OBJECT_EVENT_GFX_CAPTAIN
    [OBJECT_EVENT_GFX_NURSE / 2]                   = 0x11, // OBJECT_EVENT_GFX_CABLE_CLUB_RECEPTIONIST
    [OBJECT_EVENT_GFX_UNION_ROOM_RECEPTIONIST / 2] = 0x01, // OBJECT_EVENT_GFX_UNUSED_MALE_RECEPTIONIST
    [OBJECT_EVENT_GFX_CLERK / 2]                   = 0x00, // OBJECT_EVENT_GFX_MG_DELIVERYMAN
    [OBJECT_EVENT_GFX_TRAINER_TOWER_DUDE / 2]      = 0x00, // OBJECT_EVENT_GFX_PROF_OAK
    [OBJECT_EVENT_GFX_BLUE / 2]                    = 0x00, // OBJECT_EVENT_GFX_BILL
    [OBJECT_EVENT_GFX_LANCE / 2]                   = 0x10, // OBJECT_EVENT_GFX_AGATHA
    [OBJECT_EVENT_GFX_DAISY / 2]                   = 0x11, // OBJECT_EVENT_GFX_LORELEI
    [OBJECT_EVENT_GFX_MR_FUJI / 2]                 = 0x00, // OBJECT_EVENT_GFX_BRUNO
    [OBJECT_EVENT_GFX_BROCK / 2]                   = 0x10, // OBJECT_EVENT_GFX_MISTY
    [OBJECT_EVENT_GFX_LT_SURGE / 2]                = 0x10, // OBJECT_EVENT_GFX_ERIKA
    [OBJECT_EVENT_GFX_KOGA / 2]                    = 0x10, // OBJECT_EVENT_GFX_SABRINA
    [OBJECT_EVENT_GFX_BLAINE / 2]                  = 0x00, // OBJECT_EVENT_GFX_GIOVANNI
    [OBJECT_EVENT_GFX_MOM / 2]                     = 0x01, // OBJECT_EVENT_GFX_CELIO
    [OBJECT_EVENT_GFX_TEACHY_TV_HOST / 2]          = 0x00, // OBJECT_EVENT_GFX_GYM_GUY
    [OBJECT_EVENT_GFX_ITEM_BALL / 2]               = 0x33, // OBJECT_EVENT_GFX_TOWN_MAP
    [OBJECT_EVENT_GFX_POKEDEX / 2]                 = 0x33, // OBJECT_EVENT_GFX_CUT_TREE
    [OBJECT_EVENT_GFX_ROCK_SMASH_ROCK / 2]         = 0x33, // OBJECT_EVENT_GFX_STRENGTH_BOULDER
    [OBJECT_EVENT_GFX_FOSSIL / 2]                  = 0x33, // OBJECT_EVENT_GFX_RUBY
    [OBJECT_EVENT_GFX_SAPPHIRE / 2]                = 0x33, // OBJECT_EVENT_GFX_OLD_AMBER
    [OBJECT_EVENT_GFX_GYM_SIGN / 2]                = 0x33, // OBJECT_EVENT_GFX_SIGN
    [OBJECT_EVENT_GFX_TRAINER_TIPS / 2]            = 0x33, // OBJECT_EVENT_GFX_CLIPBOARD
    [OBJECT_EVENT_GFX_METEORITE / 2]               = 0x33, // OBJECT_EVENT_GFX_LAPRAS_DOLL
    [OBJECT_EVENT_GFX_SEAGALLOP / 2]               = 0x23, // OBJECT_EVENT_GFX_SNORLAX
    [OBJECT_EVENT_GFX_SPEAROW / 2]                 = 0x22, // OBJECT_EVENT_GFX_CUBONE
    [OBJECT_EVENT_GFX_POLIWRATH / 2]               = 0x22, // OBJECT_EVENT_GFX_CLEFAIRY
    [OBJECT_EVENT_GFX_PIDGEOT / 2]                 = 0x22, // OBJECT_EVENT_GFX_JIGGLYPUFF
    [OBJECT_EVENT_GFX_PIDGEY / 2]                  = 0x22, // OBJECT_EVENT_GFX_CHANSEY
    [OBJECT_EVENT_GFX_OMANYTE / 2]                 = 0x22, // OBJECT_EVENT_GFX_KANGASKHAN
    [OBJECT_EVENT_GFX_PIKACHU / 2]                 = 0x22, // OBJECT_EVENT_GFX_PSYDUCK
    [OBJECT_EVENT_GFX_NIDORAN_F / 2]               = 0x22, // OBJECT_EVENT_GFX_NIDORAN_M
    [OBJECT_EVENT_GFX_NIDORINO / 2]                = 0x22, // OBJECT_EVENT_GFX_MEOWTH
    [OBJECT_EVENT_GFX_SEEL / 2]                    = 0x22, // OBJECT_EVENT_GFX_VOLTORB
    [OBJECT_EVENT_GFX_SLOWPOKE / 2]                = 0x22, // OBJECT_EVENT_GFX_SLOWBRO
    [OBJECT_EVENT_GFX_MACHOP / 2]                  = 0x22, // OBJECT_EVENT_GFX_WIGGLYTUFF
    [OBJECT_EVENT_GFX_DODUO / 2]                   = 0x22, // OBJECT_EVENT_GFX_FEAROW
    [OBJECT_EVENT_GFX_MACHOKE / 2]                 = 0x22, // OBJECT_EVENT_GFX_LAPRAS
    [OBJECT_EVENT_GFX_ZAPDOS / 2]                  = 0x22, // OBJECT_EVENT_GFX_MOLTRES
    [OBJECT_EVENT_GFX_ARTICUNO / 2]                = 0x22, // OBJECT_EVENT_GFX_MEWTWO
    [OBJECT_EVENT_GFX_MEW / 2]                     = 0x22, // OBJECT_EVENT_GFX_ENTEI
    [OBJECT_EVENT_GFX_SUICUNE / 2]                 = 0x22, // OBJECT_EVENT_GFX_RAIKOU
    [OBJECT_EVENT_GFX_LUGIA / 2]                   = 0x22, // OBJECT_EVENT_GFX_HO_OH
    [OBJECT_EVENT_GFX_CELEBI / 2]                  = 0x22, // OBJECT_EVENT_GFX_KABUTO
    [OBJECT_EVENT_GFX_DEOXYS_D / 2]                = 0x22, // OBJECT_EVENT_GFX_DEOXYS_A
    [OBJECT_EVENT_GFX_DEOXYS_N / 2]                = 0x32, // OBJECT_EVENT_GFX_SS_ANNE
};

void DynamicPlaceholderTextUtil_Reset(void)
{
    const u8 **ptr = sStringPointers;
    u8 *fillval = NULL;
    const u8 **ptr2 = ptr + (NELEMS(sStringPointers) - 1);
    
    do
    {
        *ptr2-- = fillval;
    }
    while ((intptr_t)ptr2 >= (intptr_t)ptr);
}

void DynamicPlaceholderTextUtil_SetPlaceholderPtr(u8 idx, const u8 *ptr)
{
    if (idx < NELEMS(sStringPointers))
        sStringPointers[idx] = ptr;
}

u8 *DynamicPlaceholderTextUtil_ExpandPlaceholders(u8 *dest, const u8 *src)
{
    while (*src != EOS)
    {
        if (*src != CHAR_SPECIAL_F7)
        {
            *dest++ = *src++;
        }
        else
        {
            src++;
            if (sStringPointers[*src] != NULL)
                dest = StringCopy(dest, sStringPointers[*src]);
            src++;
        }
    }
    *dest = EOS;
    return dest;
}

const u8 *DynamicPlaceholderTextUtil_GetPlaceholderPtr(u8 idx)
{
    return sStringPointers[idx];
}

u8 GetColorFromTextColorTable(u16 graphicId)
{
    u32 test = graphicId >> 1;
    u32 shift = (graphicId & 1) << 2;

    if (test >= NELEMS(sTextColorTable))
        return 3;
    else
        return (sTextColorTable[graphicId >> 1] >> shift) & 0xF;
}
