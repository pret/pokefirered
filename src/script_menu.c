#include "global.h"
#include "palette.h"
#include "text.h"
#include "menu.h"
#include "task.h"
#include "sound.h"
#include "script_menu.h"
#include "quest_log.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "event_data.h"
#include "script.h"
#include "strings.h"
#include "string_util.h"
#include "field_effect.h"
#include "event_scripts.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/seagallop.h"
#include "constants/menu.h"

struct MultichoiceListStruct
{
    const struct MenuAction *list;
    u8 count;
};

EWRAM_DATA u8 sDelay = 0;

static void DrawVerticalMultichoiceMenu(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 initPos);
static u8 sub_809CBB4(u8 count);
static void sub_809CC18(u8 ignoreBpress, u8 count, u8 windowId, u8 mcId);
static void Task_MultichoiceMenu_HandleInput(u8 taskId);
static void MultiChoicePrintHelpDescription(u8 mcId);
static void task_yes_no_maybe(u8 taskId);
static void sub_809CFDC(u8 taskId);
static void CreatePCMenuWindow(void);
static bool8 PicboxWait(void);
static void DestroyScriptMenuWindow(u8 windowId);
static u8 CreateWindowFromRect(u8 left, u8 top, u8 width, u8 height);


static const struct MenuAction sScriptMultiChoiceMenu_0[] = {
    { gText_Yes },
    { gText_No }
};

static const struct MenuAction sScriptMultiChoiceMenu_2[] = {
    { gText_Normal },
    { gText_Black },
    { gText_Pink },
    { gText_Sepia }
};

static const struct MenuAction sScriptMultiChoiceMenu_3[] = {
    { gText_HallOfFame },
    { gText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_4[] = {
    { gText_Eggs },
    { gText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_5[] = {
    { gText_Victories },
    { gText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_6[] = {
    { gText_HallOfFame },
    { gText_Eggs },
    { gText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_7[] = {
    { gText_HallOfFame },
    { gText_Victories },
    { gText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_8[] = {
    { gText_Eggs },
    { gText_Victories },
    { gText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_9[] = {
    { gText_HallOfFame },
    { gText_Eggs },
    { gText_Victories },
    { gText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_15[] = {
    { gText_Slp },
    { gText_Psn },
    { gText_Par },
    { gText_Brn },
    { gText_Frz },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_16[] = {
    { gText_Yes },
    { gText_No },
    { gText_Info }
};

static const struct MenuAction sScriptMultiChoiceMenu_17[] = {
    { gText_SingleBattle },
    { gText_DoubleBattle },
    { gText_MultiBattle },
    { gText_Info },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_18[] = {
    { gText_Yes },
    { gText_No },
    { gText_Info }
};

static const struct MenuAction sScriptMultiChoiceMenu_19[] = {
    { gText_MakeAChallenge },
    { gText_Info_2 },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_20[] = {
    { gText_Rooftop },
    { gText_B1F },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_21[] = {
    { gText_HelixFossil },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_22[] = {
    { gText_DomeFossil },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_23[] = {
    { gText_OldAmber },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_24[] = {
    { gText_HelixFossil },
    { gText_OldAmber },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_25[] = {
    { gText_DomeFossil },
    { gText_OldAmber },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_26[] = {
    { gText_FreshWater200 },
    { gText_SodaPop300 },
    { gText_Lemonade350 },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_30[] = {
    { gText_Tm134000Coins },
    { gText_Tm233500Coins },
    { gText_Tm244000Coins },
    { gText_Tm304500Coins },
    { gText_Tm354000Coins },
    { gText_NoThanks_2 }
};

static const struct MenuAction sScriptMultiChoiceMenu_41[] = {
    { gText_SmokeBall800Coins },
    { gText_MiracleSeed1000Coins },
    { gText_Charcoal1000Coins },
    { gText_MysticWater1000Coins },
    { gText_YellowFlute1600Coins },
    { gText_NoThanks_2 }
};

static const struct MenuAction sScriptMultiChoiceMenu_27[] = {
    { gText_50Coins1000 },
    { gText_500Coins10000 },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_28[] = {
    { gText_Excellent },
    { gText_NotSoBad }
};

static const struct MenuAction sScriptMultiChoiceMenu_29[] = {
    { gText_Right },
    { gText_Left }
};

static const struct MenuAction sScriptMultiChoiceMenu_31[] = {
    { gText_5F },
    { gText_4F },
    { gText_3F },
    { gText_2F },
    { gText_1F },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_32[] = {
    { gText_FreshWater },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_33[] = {
    { gText_SodaPop },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_34[] = {
    { gText_FreshWater },
    { gText_SodaPop },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_35[] = {
    { gText_Lemonade },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_36[] = {
    { gText_FreshWater },
    { gText_Lemonade },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_37[] = {
    { gText_SodaPop },
    { gText_Lemonade },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_38[] = {
    { gText_FreshWater },
    { gText_SodaPop },
    { gText_Lemonade },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_0[] = {
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_1[] = {
    { gText_RedShard },
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_2[] = {
    { gText_YellowShard },
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_3[] = {
    { gText_RedShard },
    { gText_YellowShard },
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_4[] = {
    { gText_BlueShard },
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_5[] = {
    { gText_RedShard },
    { gText_BlueShard },
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_6[] = {
    { gText_YellowShard },
    { gText_BlueShard },
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_Unref_Shards_7[] = {
    { gText_RedShard },
    { gText_YellowShard },
    { gText_BlueShard },
    { gText_GreenShard },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_1[] = {
    { gText_Eevee },
    { gText_Flareon },
    { gText_Jolteon },
    { gText_Vaporeon },
    { gText_QuitLooking }
};

static const struct MenuAction sScriptMultiChoiceMenu_13[] = {
    { gText_Bicycle1000000 },
    { gText_NoThanks }
};

static const struct MenuAction sScriptMultiChoiceMenu_14[] = {
    { gText_Abra180Coins },
    { gText_Clefairy500Coins },
    { gText_Dratini2800Coins },
    { gText_Scyther5500Coins },
    { gText_Porygon9999Coins },
    { gText_NoThanks_2 }
};

static const struct MenuAction sScriptMultiChoiceMenu_39[] = {
    { gText_TradeCenter },
    { gText_Colosseum },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_40[] = {
    { gText_GameLinkCable },
    { gText_Wireless },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_42[] = {
    { gText_B1F },
    { gText_B2F },
    { gText_B4F },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_43[] = {
    { gText_LinkedGamePlay },
    { gText_DirectCorner },
    { gText_UnionRoom },
    { gOtherText_Quit }
};

static const struct MenuAction sScriptMultiChoiceMenu_44[] = {
    { gText_TwoIsland },
    { gText_ThreeIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_45[] = {
    { gText_OneIsland },
    { gText_ThreeIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_46[] = {
    { gText_OneIsland },
    { gText_TwoIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_47[] = {
    { gText_TradeCenter },
    { gText_Colosseum_2 },
    { gText_BerryCrush },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_48[] = {
    { gText_Dummy_8417E66 },
    { gText_Dummy_8417E67 },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_50[] = {
    { gText_TradeCenter },
    { gText_Colosseum_2 },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_49[] = {
    { gText_PokemonJump },
    { gText_DodrioBerryPicking },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_51[] = {
    { gText_2Tinymushrooms },
    { gText_1BigMushroom }
};

static const struct MenuAction sScriptMultiChoiceMenu_52[] = {
    { gText_TradeCenter },
    { gText_Colosseum_2 },
    { gText_Dummy_8417E71 },
    { gText_BerryCrush },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_53[] = {
    { gText_TradeCenter },
    { gText_Colosseum_2 },
    { gText_Dummy_8417E71 },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_54[] = {
    { gText_SeviiIslands },
    { gText_NavelRock },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_55[] = {
    { gText_SeviiIslands },
    { gText_BirthIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_56[] = {
    { gText_SeviiIslands },
    { gText_NavelRock },
    { gText_BirthIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_57[] = {
    { gText_OneIsland },
    { gText_TwoIsland },
    { gText_ThreeIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_58[] = {
    { gText_Vermilion },
    { gText_TwoIsland },
    { gText_ThreeIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_59[] = {
    { gText_Vermilion },
    { gText_OneIsland },
    { gText_ThreeIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_60[] = {
    { gText_Vermilion },
    { gText_OneIsland },
    { gText_TwoIsland },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_61[] = {
    { gText_Vermilion },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_62[] = {
    { gText_Dummy_8417F68 },
    { gText_Dummy_8417F67 },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_63[] = {
    { gText_JoinGroup },
    { gText_BecomeLeader },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_64[] = {
    { gOtherText_Single },
    { gOtherText_Double },
    { gOtherText_Knockout },
    { gOtherText_Mixed },
    { gOtherText_Exit }
};

static const struct MenuAction sScriptMultiChoiceMenu_10[] = {
    { gOtherText_Exit }
};

const struct MultichoiceListStruct gScriptMultiChoiceMenus[] = {
    { sScriptMultiChoiceMenu_0,  NELEMS(sScriptMultiChoiceMenu_0)  },
    { sScriptMultiChoiceMenu_1,  NELEMS(sScriptMultiChoiceMenu_1)  },
    { sScriptMultiChoiceMenu_2,  NELEMS(sScriptMultiChoiceMenu_2)  },
    { sScriptMultiChoiceMenu_3,  NELEMS(sScriptMultiChoiceMenu_3)  },
    { sScriptMultiChoiceMenu_4,  NELEMS(sScriptMultiChoiceMenu_4)  },
    { sScriptMultiChoiceMenu_5,  NELEMS(sScriptMultiChoiceMenu_5)  },
    { sScriptMultiChoiceMenu_6,  NELEMS(sScriptMultiChoiceMenu_6)  },
    { sScriptMultiChoiceMenu_7,  NELEMS(sScriptMultiChoiceMenu_7)  },
    { sScriptMultiChoiceMenu_8,  NELEMS(sScriptMultiChoiceMenu_8)  },
    { sScriptMultiChoiceMenu_9,  NELEMS(sScriptMultiChoiceMenu_9)  },
    { sScriptMultiChoiceMenu_10, NELEMS(sScriptMultiChoiceMenu_10) },
    { sScriptMultiChoiceMenu_10, NELEMS(sScriptMultiChoiceMenu_10) },
    { sScriptMultiChoiceMenu_10, NELEMS(sScriptMultiChoiceMenu_10) },
    { sScriptMultiChoiceMenu_13, NELEMS(sScriptMultiChoiceMenu_13) },
    { sScriptMultiChoiceMenu_14, NELEMS(sScriptMultiChoiceMenu_14) },
    { sScriptMultiChoiceMenu_15, NELEMS(sScriptMultiChoiceMenu_15) },
    { sScriptMultiChoiceMenu_16, NELEMS(sScriptMultiChoiceMenu_16) },
    { sScriptMultiChoiceMenu_17, NELEMS(sScriptMultiChoiceMenu_17) },
    { sScriptMultiChoiceMenu_18, NELEMS(sScriptMultiChoiceMenu_18) },
    { sScriptMultiChoiceMenu_19, NELEMS(sScriptMultiChoiceMenu_19) },
    { sScriptMultiChoiceMenu_20, NELEMS(sScriptMultiChoiceMenu_20) },
    { sScriptMultiChoiceMenu_21, NELEMS(sScriptMultiChoiceMenu_21) },
    { sScriptMultiChoiceMenu_22, NELEMS(sScriptMultiChoiceMenu_22) },
    { sScriptMultiChoiceMenu_23, NELEMS(sScriptMultiChoiceMenu_23) },
    { sScriptMultiChoiceMenu_24, NELEMS(sScriptMultiChoiceMenu_24) },
    { sScriptMultiChoiceMenu_25, NELEMS(sScriptMultiChoiceMenu_25) },
    { sScriptMultiChoiceMenu_26, NELEMS(sScriptMultiChoiceMenu_26) },
    { sScriptMultiChoiceMenu_27, NELEMS(sScriptMultiChoiceMenu_27) },
    { sScriptMultiChoiceMenu_28, NELEMS(sScriptMultiChoiceMenu_28) },
    { sScriptMultiChoiceMenu_29, NELEMS(sScriptMultiChoiceMenu_29) },
    { sScriptMultiChoiceMenu_30, NELEMS(sScriptMultiChoiceMenu_30) },
    { sScriptMultiChoiceMenu_31, NELEMS(sScriptMultiChoiceMenu_31) },
    { sScriptMultiChoiceMenu_32, NELEMS(sScriptMultiChoiceMenu_32) },
    { sScriptMultiChoiceMenu_33, NELEMS(sScriptMultiChoiceMenu_33) },
    { sScriptMultiChoiceMenu_34, NELEMS(sScriptMultiChoiceMenu_34) },
    { sScriptMultiChoiceMenu_35, NELEMS(sScriptMultiChoiceMenu_35) },
    { sScriptMultiChoiceMenu_36, NELEMS(sScriptMultiChoiceMenu_36) },
    { sScriptMultiChoiceMenu_37, NELEMS(sScriptMultiChoiceMenu_37) },
    { sScriptMultiChoiceMenu_38, NELEMS(sScriptMultiChoiceMenu_38) },
    { sScriptMultiChoiceMenu_39, NELEMS(sScriptMultiChoiceMenu_39) },
    { sScriptMultiChoiceMenu_40, NELEMS(sScriptMultiChoiceMenu_40) },
    { sScriptMultiChoiceMenu_41, NELEMS(sScriptMultiChoiceMenu_41) },
    { sScriptMultiChoiceMenu_42, NELEMS(sScriptMultiChoiceMenu_42) },
    { sScriptMultiChoiceMenu_43, NELEMS(sScriptMultiChoiceMenu_43) },
    { sScriptMultiChoiceMenu_44, NELEMS(sScriptMultiChoiceMenu_44) },
    { sScriptMultiChoiceMenu_45, NELEMS(sScriptMultiChoiceMenu_45) },
    { sScriptMultiChoiceMenu_46, NELEMS(sScriptMultiChoiceMenu_46) },
    { sScriptMultiChoiceMenu_47, NELEMS(sScriptMultiChoiceMenu_47) },
    { sScriptMultiChoiceMenu_48, NELEMS(sScriptMultiChoiceMenu_48) },
    { sScriptMultiChoiceMenu_49, NELEMS(sScriptMultiChoiceMenu_49) },
    { sScriptMultiChoiceMenu_50, NELEMS(sScriptMultiChoiceMenu_50) },
    { sScriptMultiChoiceMenu_51, NELEMS(sScriptMultiChoiceMenu_51) },
    { sScriptMultiChoiceMenu_52, NELEMS(sScriptMultiChoiceMenu_52) },
    { sScriptMultiChoiceMenu_53, NELEMS(sScriptMultiChoiceMenu_53) },
    { sScriptMultiChoiceMenu_54, NELEMS(sScriptMultiChoiceMenu_54) },
    { sScriptMultiChoiceMenu_55, NELEMS(sScriptMultiChoiceMenu_55) },
    { sScriptMultiChoiceMenu_56, NELEMS(sScriptMultiChoiceMenu_56) },
    { sScriptMultiChoiceMenu_57, NELEMS(sScriptMultiChoiceMenu_57) },
    { sScriptMultiChoiceMenu_58, NELEMS(sScriptMultiChoiceMenu_58) },
    { sScriptMultiChoiceMenu_59, NELEMS(sScriptMultiChoiceMenu_59) },
    { sScriptMultiChoiceMenu_60, NELEMS(sScriptMultiChoiceMenu_60) },
    { sScriptMultiChoiceMenu_61, NELEMS(sScriptMultiChoiceMenu_61) },
    { sScriptMultiChoiceMenu_62, NELEMS(sScriptMultiChoiceMenu_62) },
    { sScriptMultiChoiceMenu_63, NELEMS(sScriptMultiChoiceMenu_63) },
    { sScriptMultiChoiceMenu_64, NELEMS(sScriptMultiChoiceMenu_64) }
};

const u8 *const gStdStringPtrs[] = {
    gText_Cool,
    gText_Beauty,
    gText_Cute,
    gText_Smart,
    gText_Tough,
    gText_Cool_2,
    gText_Beauty_2,
    gText_Cute_2,
    gText_Smart_2,
    gText_Tough_2,
    gText_Items,
    gText_KeyItems,
    gText_PokeBalls,
    gText_TmsgUnknown_8417B2CHms,
    gText_Berries,
    gText_Boulderbadge,
    gText_Cascadebadge,
    gText_Thunderbadge,
    gText_Rainbowbadge,
    gText_Soulbadge,
    gText_Marshbadge,
    gText_Volcanobadge,
    gText_Earthbadge,
    gText_Coins_2,
    gText_ItemsPocket,
    gText_KeyItemsPocket,
    gText_PokeBallsPocket,
    gText_TmCase,
    gText_BerryPouch_2
};

static const u8 *const sDescriptionPtrs_CableClub_TradeBattleCancel[] = {
    Text_1BC388,
    Text_1BC3C7,
    Text_1BCB42
};

static const u8 *const sDescriptionPtrs_WirelessCenter_TradeBattleCrushCancel[] = {
    Text_1BCA95,
    Text_1BCACB,
    Text_1BCAF2,
    Text_1BCB42
};

static const u8 *const sDescriptionPtrs_WirelessCenter_TradeBattleCancel[] = {
    Text_1BCA95,
    Text_1BCACB,
    Text_1BCB42
};

static const union AnimCmd sMuseumFossilAnim0[] = {
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END
};

static const union AnimCmd *const sMuseumFossilAnimCmdTable[] = {
    sMuseumFossilAnim0
};

static const struct OamData sMuseumFossilOamData = {
    .shape = SPRITE_SHAPE(64x64),
    .size = SPRITE_SIZE(64x64)
};

static const struct SpriteTemplate sMuseumFossilSprTemplate = {
    .tileTag = 7000,
    .paletteTag = 0xFFFF,
    .oam = &sMuseumFossilOamData,
    .anims = sMuseumFossilAnimCmdTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const u16 sMuseumAerodactylSprTiles[] = INCBIN_U16("data/script_menu/aerodactyl_fossil.4bpp");
static const u16 sMuseumAerodactylSprPalette[] = INCBIN_U16("data/script_menu/aerodactyl_fossil.gbapal");
static const u16 sMuseumKabutopsSprTiles[] = INCBIN_U16("data/script_menu/kabutops_fossil.4bpp");
static const u16 sMuseumKabutopsSprPalette[] = INCBIN_U16("data/script_menu/kabutops_fossil.gbapal");

static const struct SpriteSheet sMuseumKabutopsSprSheets[] = {
    {sMuseumKabutopsSprTiles, 0x800, 7000},
    {}
};

static const struct SpriteSheet sMuseumAerodactylSprSheets[] = {
    {sMuseumAerodactylSprTiles, 0x800, 7000},
    {}
};


static const u8 *const sSeaGallopDestStrings[] = {
    gText_Vermilion,
    gText_OneIsland,
    gText_TwoIsland,
    gText_ThreeIsland,
    gText_FourIsland,
    gText_FiveIsland,
    gText_SixIsland,
    gText_SevenIsland
};

static u16 GetStringTilesWide(const u8 *str)
{
    return (GetStringWidth(1, str, 0) + 7) / 8;
}

static u8 GetMenuWidthFromList(const struct MenuAction * items, u8 count)
{
    u16 i;
    u8 width = GetStringTilesWide(items[0].text);
    u8 tmp;

    for (i = 1; i < count; i++)
    {
        tmp = GetStringTilesWide(items[i].text);
        if (width < tmp)
            width = tmp;
    }
    return width;
}

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 mcId, u8 ignoreBpress)
{
    if (FuncIsActiveTask(Task_MultichoiceMenu_HandleInput) == TRUE)
        return FALSE;
    gSpecialVar_Result = SCR_MENU_UNSET;
    DrawVerticalMultichoiceMenu(left, top, mcId, ignoreBpress, 0);
    return TRUE;
}

bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 cursorPos)
{
    if (FuncIsActiveTask(Task_MultichoiceMenu_HandleInput) == TRUE)
        return FALSE;
    gSpecialVar_Result = SCR_MENU_UNSET;
    DrawVerticalMultichoiceMenu(left, top, mcId, ignoreBpress, cursorPos);
    return TRUE;
}

static void DrawVerticalMultichoiceMenu(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 initPos)
{
    s32 i;
    s32 strWidth;
    s32 tmp;
    u8 width;
    u8 height;
    u8 count;
    u8 windowId;
    const struct MenuAction * list;

    if ((ignoreBpress & 2) || QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites) != TRUE)
    {
        ignoreBpress &= 1;
        count = gScriptMultiChoiceMenus[mcId].count;
        list = gScriptMultiChoiceMenus[mcId].list;
        strWidth = 0;
        for (i = 0; i < count; i++)
        {
            tmp = GetStringWidth(2, list[i].text, 0);
            if (tmp > strWidth)
                strWidth = tmp;
        }
        width = (strWidth + 9) / 8 + 1;
        if (left + width > 28)
            left = 28 - width;
        height = sub_809CBB4(count);
        windowId = CreateWindowFromRect(left, top, width, height);
        SetStdWindowBorderStyle(windowId, FALSE);
        if (mcId == 30 || mcId == 13 || mcId == 41)
            MultichoiceList_PrintItems(windowId, 2, 8, 2, 14, count, list, 0, 2);
        else
            MultichoiceList_PrintItems(windowId, 2, 8, 2, 14, count, list, 0, 2);
        Menu_InitCursor(windowId, 2, 0, 2, 14, count, initPos);
        sub_809CC18(ignoreBpress, count, windowId, mcId);
        ScheduleBgCopyTilemapToVram(0);
    }
}

static u8 sub_809CBB4(u8 count)
{
    switch (count)
    {
    case 0:
        return 1;
    case 1:
        return 2;
    case 2:
        return 4;
    case 3:
        return 6;
    case 4:
        return 7;
    case 5:
        return 9;
    case 6:
        return 11;
    case 7:
        return 13;
    case 8:
        return 14;
    default:
        return 1;
    }
}

static void sub_809CC18(u8 ignoreBpress, u8 count, u8 windowId, u8 mcId)
{
    u8 taskId;
    if (mcId == 39 || mcId == 47 || mcId == 50)
        sDelay = 12;
    else
        sDelay = 0;
    taskId = CreateTask(Task_MultichoiceMenu_HandleInput, 80);
    gTasks[taskId].data[4] = ignoreBpress;
    if (count > 3)
        gTasks[taskId].data[5] = TRUE;
    else
        gTasks[taskId].data[5] = FALSE;
    gTasks[taskId].data[6] = windowId;
    gTasks[taskId].data[7] = mcId;
    MultiChoicePrintHelpDescription(mcId);
}

static void Task_MultichoiceMenu_HandleInput(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s8 input;
    if (!gPaletteFade.active)
    {
        if (sDelay != 0)
            sDelay--;
        else
        {
            if (data[5] == FALSE)
                input = Menu_ProcessInputNoWrapAround();
            else
                input = Menu_ProcessInput();
            if (JOY_NEW(DPAD_UP | DPAD_DOWN))
                MultiChoicePrintHelpDescription(data[7]);
            switch (input)
            {
            case -2:
                return;
            case -1:
                if (data[4])
                    return;
                PlaySE(SE_SELECT);
                gSpecialVar_Result = SCR_MENU_CANCEL;
                break;
            default:
                gSpecialVar_Result = input;
                break;
            }
            DestroyScriptMenuWindow(data[6]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
    }
}

static void MultiChoicePrintHelpDescription(u8 mcId)
{
    switch (mcId)
    {
    case 39:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, sDescriptionPtrs_CableClub_TradeBattleCancel[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    case 47:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, sDescriptionPtrs_WirelessCenter_TradeBattleCrushCancel[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    case 50:
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, 2, sDescriptionPtrs_WirelessCenter_TradeBattleCancel[Menu_GetCursorPos()], 0, NULL, 2, 1, 3);
        break;
    }
}

bool8 ScriptMenu_YesNo(u8 unused, u8 stuff)
{
    if (FuncIsActiveTask(task_yes_no_maybe) == TRUE)
        return FALSE;
    gSpecialVar_Result = SCR_MENU_UNSET;
    if (!QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites))
    {
        DisplayYesNoMenuDefaultYes();
        CreateTask(task_yes_no_maybe, 80);
    }
    return TRUE;
}

bool8 sub_809CE38(void)
{
    if (gSpecialVar_Result == SCR_MENU_UNSET)
        return FALSE;
    else
        return TRUE;
}

static void task_yes_no_maybe(u8 taskId)
{
    s8 input;
    if (gTasks[taskId].data[2] < 5)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        input = Menu_ProcessInputNoWrapClearOnChoose();
        switch (input)
        {
        case -2:
            return;
        case -1:
        case 1:
            PlaySE(SE_SELECT);
            gSpecialVar_Result = FALSE;
            break;
        case 0:
            gSpecialVar_Result = TRUE;
            break;
        }
        DestroyTask(taskId);
        EnableBothScriptContexts();
    }
}

bool8 ScriptMenu_MultichoiceGrid(u8 left, u8 top, u8 multichoiceId, u8 a4, u8 columnCount)
{
    const struct MenuAction * list;
    u8 count;
    u8 width;
    u8 rowCount;
    u8 taskId;
    if (FuncIsActiveTask(sub_809CFDC) == TRUE)
        return FALSE;
    gSpecialVar_Result = SCR_MENU_UNSET;
    if (QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites) != TRUE)
    {
        list = gScriptMultiChoiceMenus[multichoiceId].list;
        count = gScriptMultiChoiceMenus[multichoiceId].count;
        width = GetMenuWidthFromList(list, count) + 1;
        rowCount = count / columnCount;
        taskId = CreateTask(sub_809CFDC, 80);
        gTasks[taskId].data[4] = a4;
        gTasks[taskId].data[6] = CreateWindowFromRect(left, top, width * columnCount, rowCount * 2);
        SetStdWindowBorderStyle(gTasks[taskId].data[6], FALSE);
        MultichoiceGrid_PrintItems(gTasks[taskId].data[6], 1, width * 8, 16, columnCount, rowCount, list);
        MultichoiceGrid_InitCursor(gTasks[taskId].data[6], 1, 0, 1, width * 8, columnCount, rowCount, 0);
        ScheduleBgCopyTilemapToVram(0);
    }
    return TRUE;
}

static void sub_809CFDC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s8 input = Menu_ProcessInputGridLayout();
    switch (input)
    {
    case -2:
        return;
    case -1:
        if (data[4])
            return;
        PlaySE(SE_SELECT);
        gSpecialVar_Result = SCR_MENU_CANCEL;
        break;
    default:
        gSpecialVar_Result = input;
        break;
    }
    DestroyScriptMenuWindow(data[6]);
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

bool8 ScrSpecial_CreatePCMenu(void)
{
    if (FuncIsActiveTask(Task_MultichoiceMenu_HandleInput) == TRUE)
        return FALSE;
    gSpecialVar_Result = SCR_MENU_UNSET;
    CreatePCMenuWindow();
    return TRUE;
}

static void CreatePCMenuWindow(void)
{
    u8 cursorWidth = GetMenuCursorDimensionByFont(2, 0);
    u8 height = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
    u8 windowWidth;
    u8 nitems;
    u8 windowId;
    switch (GetStringTilesWide(gText_SPc))
    {
    default:
        if (FlagGet(FLAG_SYS_POKEDEX_GET))
            windowWidth = 14;
        else
            windowWidth = 13;
        break;
    case 9:
    case 10:
        windowWidth = 14;
        break;
    }
    if (FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        nitems = 5;
        windowId = CreateWindowFromRect(0, 0, windowWidth, 10);
        SetStdWindowBorderStyle(windowId, FALSE);
        AddTextPrinterParameterized(windowId, 2, gText_ProfOakSPc, cursorWidth, 34, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gText_HallOfFame_2, cursorWidth, 50, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gText_LogOff, cursorWidth, 66, 0xFF, NULL);
    }
    else
    {
        if (FlagGet(FLAG_SYS_POKEDEX_GET))
            nitems = 4;
        else
            nitems = 3;
        windowId = CreateWindowFromRect(0, 0, windowWidth, nitems * 2);
        SetStdWindowBorderStyle(windowId, FALSE);
        if (FlagGet(FLAG_SYS_POKEDEX_GET))
            AddTextPrinterParameterized(windowId, 2, gText_ProfOakSPc, cursorWidth, 34, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gText_LogOff, cursorWidth, 2 + 16 * (nitems - 1), 0xFF, NULL);
    }
    if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC))
        AddTextPrinterParameterized(windowId, 2, gText_BillSPc, cursorWidth, 2 , 0xFF, NULL);
    else
        AddTextPrinterParameterized(windowId, 2, gText_SomeoneSPc, cursorWidth, 2 , 0xFF, NULL);
    StringExpandPlaceholders(gStringVar4, gText_SPc);
    Menu_PrintFormatIntlPlayerName(windowId, gStringVar4, cursorWidth, 18);
    Menu_InitCursor(windowId, 2, 0, 2, 16, nitems, 0);
    sub_809CC18(FALSE, nitems, windowId, 0xFF);
    ScheduleBgCopyTilemapToVram(0);
}

void ScriptMenu_DisplayPCStartupPrompt(void)
{
    sub_80F7768(0, TRUE);
    AddTextPrinterParameterized2(0, 2, gUnknown_81A508A, 0, NULL, 2, 1, 3);
}

static void Task_ScriptShowMonPic(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[0]++;
        break;
    case 1:
        break;
    case 2:
        sub_8083A5C(&gSprites[task->data[2]], task->data[2]);
        task->data[0]++;
        break;
    case 3:
        DestroyScriptMenuWindow(task->data[5]);
        DestroyTask(taskId);
        break;
    }
}

bool8 ScriptMenu_ShowPokemonPic(u16 species, u8 x, u8 y)
{
    u8 spriteId;
    u8 taskId;
    if (QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites) == TRUE)
        return TRUE;
    if (FindTaskIdByFunc(Task_ScriptShowMonPic) != 0xFF)
        return FALSE;
    spriteId = sub_8083970(species, 8 * x + 40, 8 * y + 40, FALSE);
    taskId = CreateTask(Task_ScriptShowMonPic, 80);
    gTasks[taskId].data[5] = CreateWindowFromRect(x, y, 8, 8);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = species;
    gTasks[taskId].data[2] = spriteId;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].oam.priority = 0;
    SetStdWindowBorderStyle(gTasks[taskId].data[5], TRUE);
    ScheduleBgCopyTilemapToVram(0);
    return TRUE;
}

bool8 (*ScriptMenu_GetPicboxWaitFunc(void))(void)
{
    u8 taskId = FindTaskIdByFunc(Task_ScriptShowMonPic);
    if (taskId == 0xFF)
        return NULL;
    gTasks[taskId].data[0]++;
    return PicboxWait;
}

static bool8 PicboxWait(void)
{
    if (FindTaskIdByFunc(Task_ScriptShowMonPic) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

void sub_809D424(void)
{
    u8 taskId = FindTaskIdByFunc(Task_ScriptShowMonPic);
    struct Task * task;
    if (taskId != 0xFF)
    {
        task = &gTasks[taskId];
        switch (task->data[0])
        {
        case 0:
        case 1:
        case 2:
            sub_8083A5C(&gSprites[task->data[2]], task->data[2]);
            DestroyScriptMenuWindow(task->data[5]);
            DestroyTask(taskId);
            break;
        case 3:
            DestroyScriptMenuWindow(task->data[5]);
            DestroyTask(taskId);
            break;
        }
    }
}

void Task_WaitMuseumFossilPic(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[0]++;
        break;
    case 1:
        break;
    case 2:
        DestroySprite(&gSprites[task->data[2]]);
        FreeSpriteTilesByTag(7000);
        task->data[0]++;
        break;
    case 3:
        DestroyScriptMenuWindow(task->data[5]);
        DestroyTask(taskId);
        break;
    }
}

bool8 Special_OpenMuseumFossilPic(void)
{
    u8 spriteId;
    u8 taskId;
    if (QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites) == TRUE)
        return TRUE;
    if (FindTaskIdByFunc(Task_WaitMuseumFossilPic) != 0xFF)
        return FALSE;
    if (gSpecialVar_0x8004 == SPECIES_KABUTOPS)
    {
        LoadSpriteSheets(sMuseumKabutopsSprSheets);
        LoadPalette(sMuseumKabutopsSprPalette, 0x1D0, 0x20);
    }
    else if (gSpecialVar_0x8004 == SPECIES_AERODACTYL)
    {
        LoadSpriteSheets(sMuseumAerodactylSprSheets);
        LoadPalette(sMuseumAerodactylSprPalette, 0x1D0, 0x20);
    }
    else
    {
        return FALSE;
    }
    spriteId = CreateSprite(&sMuseumFossilSprTemplate, gSpecialVar_0x8005 * 8 + 40, gSpecialVar_0x8006 * 8 + 40, 0);
    gSprites[spriteId].oam.paletteNum = 13;
    taskId = CreateTask(Task_WaitMuseumFossilPic, 80);
    gTasks[taskId].data[5] = CreateWindowFromRect(gSpecialVar_0x8005, gSpecialVar_0x8006, 8, 8);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[2] = spriteId;
    SetStdWindowBorderStyle(gTasks[taskId].data[5], TRUE);
    ScheduleBgCopyTilemapToVram(0);
    return TRUE;
}

bool8 Special_CloseMuseumFossilPic(void)
{
    u8 taskId = FindTaskIdByFunc(Task_WaitMuseumFossilPic);
    if (taskId == 0xFF)
        return FALSE;
    gTasks[taskId].data[0]++;
    return TRUE;
}

static u8 CreateWindowFromRect(u8 left, u8 top, u8 width, u8 height)
{
    struct WindowTemplate template = SetWindowTemplateFields(0, left + 1, top + 1, width, height, 15, 0x038);
    u8 windowId = AddWindow(&template);
    PutWindowTilemap(windowId);
    return windowId;
}

static void DestroyScriptMenuWindow(u8 windowId)
{
    ClearWindowTilemap(windowId);
    ClearStdWindowAndFrameToTransparent(windowId, TRUE);
    RemoveWindow(windowId);
}

void QLPlaybackCB_DestroyScriptMenuMonPicSprites(void)
{
    u8 taskId;
    s16 *data;
    ScriptContext1_SetupScript(EventScript_1A7AE0);
    taskId = FindTaskIdByFunc(Task_ScriptShowMonPic);
    if (taskId != 0xFF)
    {
        data = gTasks[taskId].data;
        if (data[0] < 2)
            sub_8083A5C(&gSprites[data[2]], data[2]);
    }
    taskId = FindTaskIdByFunc(Task_WaitMuseumFossilPic);
    if (taskId != 0xFF)
    {
        data = gTasks[taskId].data;
        if (data[0] < 2)
        {
            DestroySprite(&gSprites[data[2]]);
            FreeSpriteTilesByTag(7000);
        }
    }
}

void Special_DrawSeaGallopDestinationMenu(void)
{
    // 8004 = Starting location
    // 8005 = Page (0: Verm, One, Two, Three, Four, Other, Exit; 1: Four, Five, Six, Seven, Other, Exit)
    u8 r4;
    u8 top;
    u8 nitems;
    u8 cursorWidth;
    u8 fontHeight;
    u8 windowId;
    u8 i;
    gSpecialVar_Result = SCR_MENU_UNSET;
    if (QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites) != TRUE)
    {
        if (gSpecialVar_0x8005 == 1)
        {
            if (gSpecialVar_0x8004 < SEAGALLOP_FIVE_ISLAND)
                r4 = SEAGALLOP_FIVE_ISLAND;
            else
                r4 = SEAGALLOP_FOUR_ISLAND;
            nitems = 5;
            top = 2;
        }
        else
        {
            r4 = SEAGALLOP_VERMILION_CITY;
            nitems = 6;
            top = 0;
        }
        cursorWidth = GetMenuCursorDimensionByFont(2, 0);
        fontHeight = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
        windowId = CreateWindowFromRect(17, top, 11, nitems * 2);
        SetStdWindowBorderStyle(windowId, FALSE);
        for (i = 0; i < nitems - 2; i++)
        {
            if (r4 != gSpecialVar_0x8004)
                AddTextPrinterParameterized(windowId, 2, sSeaGallopDestStrings[r4], cursorWidth, i * 16 + 2, 0xFF, NULL);
            else
                i--;
            r4++;
            if (r4 == SEAGALLOP_CINNABAR_ISLAND)
                r4 = SEAGALLOP_VERMILION_CITY;
        }
        AddTextPrinterParameterized(windowId, 2, gText_Other, cursorWidth, i * 16 + 2, 0xFF, NULL);
        i++;
        AddTextPrinterParameterized(windowId, 2, gOtherText_Exit, cursorWidth, i * 16 + 2, 0xFF, NULL);
        Menu_InitCursor(windowId, 2, 0, 2, 16, nitems, 0);
        sub_809CC18(FALSE, nitems, windowId, 0xFF);
        ScheduleBgCopyTilemapToVram(0);
    }
}

u16 Special_GetSelectedSeaGallopDestination(void)
{
    // 8004 = Starting location
    // 8005 = Page (0: Verm, One, Two, Three, Four, Other, Exit; 1: Four, Five, Six, Seven, Other, Exit)
    if (gSpecialVar_Result == SCR_MENU_CANCEL)
        return SCR_MENU_CANCEL;
    if (gSpecialVar_0x8005 == 1)
    {
        if (gSpecialVar_Result == 3)
        {
            return SEAGALLOP_MORE;
        }
        else if (gSpecialVar_Result == 4)
        {
            return SCR_MENU_CANCEL;
        }
        else if (gSpecialVar_Result == 0)
        {
            if (gSpecialVar_0x8004 > SEAGALLOP_FOUR_ISLAND)
                return SEAGALLOP_FOUR_ISLAND;
            else
                return SEAGALLOP_FIVE_ISLAND;
        }
        else if (gSpecialVar_Result == 1)
        {
            if (gSpecialVar_0x8004 > SEAGALLOP_FIVE_ISLAND)
                return SEAGALLOP_FIVE_ISLAND;
            else
                return SEAGALLOP_SIX_ISLAND;
        }
        else if (gSpecialVar_Result == 2)
        {
            if (gSpecialVar_0x8004 > SEAGALLOP_SIX_ISLAND)
                return SEAGALLOP_SIX_ISLAND;
            else
                return SEAGALLOP_SEVEN_ISLAND;
        }
    }
    else
    {
        if (gSpecialVar_Result == 4)
            return SEAGALLOP_MORE;
        else if (gSpecialVar_Result == 5)
            return SCR_MENU_CANCEL;
        else if (gSpecialVar_Result >= gSpecialVar_0x8004)
            return gSpecialVar_Result + 1;
        else
            return gSpecialVar_Result;
    }
    return SEAGALLOP_VERMILION_CITY;
}
