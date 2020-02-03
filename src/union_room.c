#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "berry_crush.h"
#include "cable_club.h"
#include "data.h"
#include "decompress.h"
#include "dodrio_berry_picking.h"
#include "dynamic_placeholder_text_util.h"
#include "easy_chat.h"
#include "event_data.h"
#include "event_object_lock.h"
#include "field_control_avatar.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "link.h"
#include "link_rfu.h"
#include "list_menu.h"
#include "load_save.h"
#include "menu.h"
#include "mevent.h"
#include "mystery_gift_menu.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "party_menu.h"
#include "pokemon_jump.h"
#include "quest_log.h"
#include "random.h"
#include "save_location.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "start_menu.h"
#include "strings.h"
#include "task.h"
#include "trade.h"
#include "trade_scene.h"
#include "trainer_card.h"
#include "union_room.h"
#include "union_room_battle.h"
#include "union_room_chat.h"
#include "rfu_union_tool.h"
#include "union_room_message.h"
#include "constants/songs.h"
#include "constants/maps.h"
#include "constants/cable_club.h"
#include "constants/field_weather.h"
#include "constants/species.h"
#include "constants/union_room.h"

static EWRAM_DATA u8 sUnionRoomPlayerName[12] = {};
static EWRAM_DATA u8 sPlayerCurrActivity = 0;
static EWRAM_DATA u8 sPlayerActivityGroupSize = 0;
static EWRAM_DATA union UnkUnion_Main sUnionRoomMain = {};
static EWRAM_DATA u32 sUnref_203B060 = 0;
EWRAM_DATA struct GFtgtGnameSub gUnknown_203B064 = {};
EWRAM_DATA u16 gUnionRoomOfferedSpecies = SPECIES_NONE;
EWRAM_DATA u8 gUnionRoomRequestedMonType = TYPE_NORMAL;
static EWRAM_DATA struct UnionRoomTrade sUnionRoomTrade = {};

static struct UnkStruct_Leader * sLeader;
static struct UnkStruct_Group * sGroup;
static struct UnkStruct_URoom * sURoom;

static void sub_8115A68(u8 taskId);
static void sub_81161E4(struct UnkStruct_Leader * leader);
static bool8 sub_8116444(struct UnkStruct_Leader * leader, u32 state1, u32 state2);
static void sub_81164C8(u8 windowId, s32 itemId, u8 y);
static u8 sub_8116524(struct UnkStruct_Main0 * a0);
static u8 UnionRoomLeaderField0CompactionAndCount(struct UnkStruct_Main0 * a0);
static void Task_TryJoinLinkGroup(u8 taskId);
static u32 sub_8116D10(struct UnkStruct_Group * group, s32 id);
static void sub_8116D60(struct UnkStruct_Group * group, s32 id);
static void sub_8116E1C(u8 taskId);
static void ListMenuItemPrintFunc_UnionRoomGroups(u8 windowId, s32 itemId, u8 y);
static u8 sub_8116FE4(void);
static void sub_8117990(void);
static void sub_81179A4(void);
static void sub_8117A0C(u8 taskId);
static void sub_8117F20(u8 taskId);
static void sub_81182DC(u8 taskId);
static void Task_ResumeUnionRoom(u8 taskId);
static u16 ReadAsU16(const u8 *data);
static void ReceiveUnionRoomActivityPacket(struct UnkStruct_URoom * uRoom);
static bool32 sub_8119944(struct UnkStruct_URoom * uRoom);
static void Task_InitUnionRoom(u8 taskId);
static u8 sub_8119B94(void);
static u8 sub_8119E84(struct UnkStruct_Main4 * arg0, struct UnkStruct_Main4 * arg1, u32 arg2);
static bool32 sub_8119FB0(struct GFtgtGname * arg0, s16 arg1);
static u8 sub_811A054(struct UnkStruct_Main4 * arg0, u32 arg1);
static u8 sub_811A084(struct UnkStruct_Main4 * arg0, u32 arg1);
static bool32 UR_PrintFieldMessage(const u8 * str);
static bool32 UR_RunTextPrinters_CheckPrinter0Active(void);
static bool8 PrintOnTextbox(u8 *textState, const u8 *str);
static s8 sub_811A14C(u8 *state_p, bool32 no_draw);
static s32 ListMenuHandler_AllItemsAvailable(u8 *state_p, u8 *win_id_p, u8 *list_menu_id_p, const struct WindowTemplate * winTemplate, const struct ListMenuTemplate * menuTemplate);
static s32 TradeBoardMenuHandler(u8 *state_p, u8 *win_id_p, u8 *list_menu_id_p, u8 *trade_board_win_id_p, const struct WindowTemplate * winTemplate, const struct ListMenuTemplate * menuTemplate, struct UnkStruct_Main0 * traders);
static void sub_811A3F8(void);
static void sub_811A41C(void);
static void UR_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx);
static void BlankUnkStruct_x20Array(struct UnkStruct_x20 * arg0, u8 count);
static void BlankUnkStruct_x1CArray(struct UnkStruct_x1C * arg0, u8 count);
static bool8 AreUnkSharedObjectsDifferent(struct UnkStruct_Shared * arg0, const struct UnkStruct_Shared * arg1);
static bool32 AreUnionRoomPlayerGnamesDifferent(struct UnkStruct_Shared * arg0, struct UnkStruct_Shared * arg1);
static u32 sub_811A748(struct UnkStruct_x20 * arg0, struct UnkStruct_x1C * arg1);
static u8 Appendx1Ctox20(struct UnkStruct_x20 * x20arr, struct UnkStruct_x1C * x1C, u8 count);
static void sub_811A81C(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id);
static void sub_811A910(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id);
static bool32 PlayerIsTalkingToUnionRoomAide(void);
static u32 GetResponseIdx_InviteToURoomActivity(s32 activity);
static u32 sub_811AA24(struct UnkStruct_x20 * unkX20);
static s32 sub_811AA5C(struct UnkStruct_Main0 * arg0, u8 arg1, u8 arg2, u32 playerGender);
static void nullsub_92(u8 windowId, s32 itemId, u8 y);
static void TradeBoardListMenuItemPrintFunc(u8 windowId, s32 itemId, u8 y);
static s32 GetIndexOfNthTradeBoardOffer(struct UnkStruct_x20 * arg, s32 arg1);
static s32 GetUnionRoomPlayerGender(s32 a0, struct UnkStruct_Main0 * a1);
static s32 IsRequestedTypeAndSpeciesInPlayerParty(u32 type, u32 species);
static void GetURoomActivityRejectMsg(u8 *dst, s32 arg1, u32 playerGender);
static void GetURoomActivityStartMsg(u8 *dst, u8 arg1);
static s32 GetChatLeaderActionRequestMessage(u8 *dst, u32 gender, u16 *arg2, struct UnkStruct_URoom * arg3);
static bool32 PollPartnerYesNoResponse(struct UnkStruct_URoom * arg0);
static bool32 HasAtLeastTwoMonsOfLevel30OrLower(void);
static void ResetUnionRoomTrade(struct UnionRoomTrade * trade);
static bool32 RegisterTradeMonAndGetIsEgg(u32 monId, struct UnionRoomTrade * trade);
static void RegisterTradeMon(u32 monId, struct UnionRoomTrade * trade);
static u32 GetPartyPositionOfRegisteredMon(struct UnionRoomTrade * trade, u8 mpId);
static void sub_811B258(bool32 a0);
static void sub_811B298(void);
static u8 sub_811B2A8(s32 a0);
static u8 sub_811B2D8(struct UnkStruct_URoom * arg0);
static void ViewURoomPartnerTrainerCard(u8 *dest, struct UnkStruct_URoom * uRoom, bool8 gender);

#define _8456CD8(a, b) ((a) | ((b) << 8))

static const u8 *const sUnionRoomActivityStringPtrs[] = {
    gUnionRoomActivity_Blank,
    gUnionRoomActivity_SingleBattle,
    gUnionRoomActivity_DoubleBattle,
    gUnionRoomActivity_MultiBattle,
    gUnionRoomActivity_PokemonTrades,
    gUnionRoomActivity_Chat,
    gUnionRoomActivity_WonderCards,
    gunionRoomActivity_WonderNews,
    gUnionRoomActivity_Cards,
    gUnionRoomActivity_PokemonJump,
    gUnionRoomActivity_BerryCrush,
    gUnionRoomActivity_BerryPicking,
    gUnionRoomActivity_Search,
    gUnionRoomActivity_SpinTradeJP,
    gUnionRoomActivity_ItemTradeJP,
    gUnionRoomActivity_Blank,
    gUnionRoomActivity_Blank,
    gUnionRoomActivity_Blank,
    gUnionRoomActivity_Blank,
    gUnionRoomActivity_Blank,
    gUnionRoomActivity_Blank,
    gUnionRoomActivity_WonderCards,
    gunionRoomActivity_WonderNews
};

static const struct WindowTemplate gUnknown_8456CD0 = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 30,
    .height = 2,
    .paletteNum = 0xF,
    .baseBlock = 0x008
};

static const u32 sLinkGroupToActivityAndCapacity[] = {
    [LINK_GROUP_SINGLE_BATTLE] = _8456CD8(UROOM_ACTIVITY_BATTLE,    2),
    [LINK_GROUP_DOUBLE_BATTLE] = _8456CD8(UROOM_ACTIVITY_DBLBATTLE, 2),
    [LINK_GROUP_MULTI_BATTLE]  = _8456CD8(UROOM_ACTIVITY_MLTBATTLE, 4),
    [LINK_GROUP_TRADE]         = _8456CD8(UROOM_ACTIVITY_TRADE,     2),
    [LINK_GROUP_POKEMON_JUMP]  = _8456CD8(UROOM_ACTIVITY_PJUMP,     5 | 0x20),
    [LINK_GROUP_BERRY_CRUSH]   = _8456CD8(UROOM_ACTIVITY_BCRUSH,    5 | 0x20),
    [LINK_GROUP_BERRY_PICKING] = _8456CD8(UROOM_ACTIVITY_BPICK,     5 | 0x30),
    [LINK_GROUP_WONDER_CARD]   = _8456CD8(UROOM_ACTIVITY_SPINTRADE, 5 | 0x30),
    [LINK_GROUP_WONDER_NEWS]   = _8456CD8(UROOM_ACTIVITY_ITEMTRADE, 5 | 0x30)
};

static const struct WindowTemplate gUnknown_8456CFC = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 13,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate gUnknown_8456D04 = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0C6
};

const struct ListMenuItem gUnknown_8456D0C[] = {
    {gUnionRoomActivity_Blank, 0},
    {gUnionRoomActivity_Blank, 1},
    {gUnionRoomActivity_Blank, 2},
    {gUnionRoomActivity_Blank, 3},
    {gUnionRoomActivity_Blank, 4}
};

static const struct ListMenuTemplate gUnknown_8456D34 = {
    .items = gUnknown_8456D0C,
    .moveCursorFunc = NULL,
    .itemPrintFunc = sub_81164C8,
    .totalItems = 5,
    .maxShowed = 5,
    .windowId = 0,
    .header_X = 0,
    .item_X = 1,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 0,
    .itemVerticalPadding = 2,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 1
};

static const struct WindowTemplate gUnknown_8456D4C = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate gUnknown_8456D54 = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0EE
};

static const struct ListMenuItem sListMenuItems_UnionRoomGroups[] = {
    {gUnionRoomActivity_Blank,  0},
    {gUnionRoomActivity_Blank,  1},
    {gUnionRoomActivity_Blank,  2},
    {gUnionRoomActivity_Blank,  3},
    {gUnionRoomActivity_Blank,  4},
    {gUnionRoomActivity_Blank,  5},
    {gUnionRoomActivity_Blank,  6},
    {gUnionRoomActivity_Blank,  7},
    {gUnionRoomActivity_Blank,  8},
    {gUnionRoomActivity_Blank,  9},
    {gUnionRoomActivity_Blank, 10},
    {gUnionRoomActivity_Blank, 11},
    {gUnionRoomActivity_Blank, 12},
    {gUnionRoomActivity_Blank, 13},
    {gUnionRoomActivity_Blank, 14},
    {gUnionRoomActivity_Blank, 15}
};

static const struct ListMenuTemplate sListMenuTemplate_UnionRoomGroups = {
    .items = sListMenuItems_UnionRoomGroups,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = ListMenuItemPrintFunc_UnionRoomGroups,
    .totalItems = 16,
    .maxShowed = 5,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 0,
    .itemVerticalPadding = 2,
    .scrollMultiple = LIST_MULTIPLE_SCROLL_DPAD,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_InviteToActivity = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 6,
    .width = 8,
    .height = 7,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem sListMenuItems_InviteToActivity[] = {
    {gUnknown_8459354,  _8456CD8( UROOM_ACTIVITY_CARD, 2)},
    {gUnknown_8459344,  _8456CD8(UROOM_ACTIVITY_BATTLE | 0x40, 2)},
    {gUnknown_845934C,  _8456CD8(UROOM_ACTIVITY_CHAT | 0x40, 2)},
    {gUnknown_8459360,  _8456CD8(UROOM_ACTIVITY_NONE | 0x40, 0)}
};

static const struct ListMenuTemplate sListMenuTemplate_InviteToActivity = {
    .items = sListMenuItems_InviteToActivity,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = 4,
    .maxShowed = 4,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_TradeBoardRegisterInfoExit = {
    .bg = 0,
    .tilemapLeft = 18,
    .tilemapTop = 8,
    .width = 11,
    .height = 5,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem gUnknown_8456E3C[] = {
    {gText_Register,   1},
    {gUnknown_8459370, 2},
    {gUnknown_8459360, 3}
};

static const struct ListMenuTemplate sListMenuTemplate_TradeBoardRegisterInfoExit = {
    .items = gUnknown_8456E3C,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = 3,
    .maxShowed = 3,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate sWindowTemplate_TypeNames = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 2,
    .width = 9,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static const struct ListMenuItem sListMenuItems_TypeNames[] = {
    {gTypeNames[TYPE_NORMAL],     TYPE_NORMAL},
    {gTypeNames[TYPE_FIRE],         TYPE_FIRE},
    {gTypeNames[TYPE_WATER],       TYPE_WATER},
    {gTypeNames[TYPE_ELECTRIC], TYPE_ELECTRIC},
    {gTypeNames[TYPE_GRASS],       TYPE_GRASS},
    {gTypeNames[TYPE_ICE],           TYPE_ICE},
    {gTypeNames[TYPE_GROUND],     TYPE_GROUND},
    {gTypeNames[TYPE_ROCK],         TYPE_ROCK},
    {gTypeNames[TYPE_FLYING],     TYPE_FLYING},
    {gTypeNames[TYPE_PSYCHIC],   TYPE_PSYCHIC},
    {gTypeNames[TYPE_FIGHTING], TYPE_FIGHTING},
    {gTypeNames[TYPE_POISON],     TYPE_POISON},
    {gTypeNames[TYPE_BUG],           TYPE_BUG},
    {gTypeNames[TYPE_GHOST],       TYPE_GHOST},
    {gTypeNames[TYPE_DRAGON],     TYPE_DRAGON},
    {gTypeNames[TYPE_STEEL],       TYPE_STEEL},
    {gTypeNames[TYPE_DARK],         TYPE_DARK},
    {gUnknown_8459360,           NUMBER_OF_MON_TYPES}
};

static const struct ListMenuTemplate sListMenuTemplate_TypeNames = {
    .items = sListMenuItems_TypeNames,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = NULL,
    .totalItems = NUMBER_OF_MON_TYPES,
    .maxShowed = 6,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 2,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate sTradeBoardWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 2,
    .paletteNum = 13,
    .baseBlock = 0x001
};

static const struct WindowTemplate gUnknown_8456F24 = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 5,
    .width = 28,
    .height = 10,
    .paletteNum = 13,
    .baseBlock = 0x039
};

static const struct ListMenuItem sTradeBoardListMenuItems[] = {
    {gUnionRoomActivity_Blank, -3},
    {gUnionRoomActivity_Blank, 0},
    {gUnionRoomActivity_Blank, 1},
    {gUnionRoomActivity_Blank, 2},
    {gUnionRoomActivity_Blank, 3},
    {gUnionRoomActivity_Blank, 4},
    {gUnionRoomActivity_Blank, 5},
    {gUnionRoomActivity_Blank, 6},
    {gUnionRoomActivity_Blank, 7},
    {gUnknown_8459368, 8}
};

static const struct ListMenuTemplate sTradeBoardListMenuTemplate = {
    .items = sTradeBoardListMenuItems,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = TradeBoardListMenuItemPrintFunc,
    .totalItems = 10,
    .maxShowed = 5,
    .windowId = 0,
    .header_X = 0,
    .item_X = 12,
    .cursor_X = 0,
    .upText_Y = 2,
    .cursorPal = 14,
    .fillValue = 15,
    .cursorShadowPal = 13,
    .lettersSpacing = 1,
    .itemVerticalPadding = 1,
    .scrollMultiple = LIST_NO_MULTIPLE_SCROLL,
    .fontId = 2,
    .cursorKind = 0
};

static const struct WindowTemplate gUnknown_8456F94 = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 5,
    .width = 28,
    .height = 10,
    .paletteNum = 13,
    .baseBlock = 0x039
};

static const struct ListMenuItem gUnknown_8456F9C[] = {
    {gUnionRoomActivity_Blank,  0},
    {gUnionRoomActivity_Blank,  1},
    {gUnionRoomActivity_Blank,  2},
    {gUnionRoomActivity_Blank,  3},
    {gUnionRoomActivity_Blank,  4},
    {gUnionRoomActivity_Blank,  5},
    {gUnionRoomActivity_Blank,  6},
    {gUnionRoomActivity_Blank,  7},
    {gUnionRoomActivity_Blank,  8},
    {gUnionRoomActivity_Blank,  9},
    {gUnionRoomActivity_Blank, 10},
    {gUnionRoomActivity_Blank, 11},
    {gUnionRoomActivity_Blank, 12},
    {gUnionRoomActivity_Blank, 13},
    {gUnionRoomActivity_Blank, 14},
    {gUnionRoomActivity_Blank, 15}
};

static const struct ListMenuTemplate gUnknown_845701C = {
    .items = gUnknown_8456F9C,
    .moveCursorFunc = ListMenuDefaultCursorMoveFunc,
    .itemPrintFunc = nullsub_92,
    .totalItems = 16,
    .maxShowed = 4,
    .windowId = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 1,
    .upText_Y = 0,
    .cursorPal = 2,
    .fillValue = 1,
    .cursorShadowPal = 3,
    .lettersSpacing = 1,
    .itemVerticalPadding = 0,
    .scrollMultiple = LIST_MULTIPLE_SCROLL_DPAD,
    .fontId = 2,
    .cursorKind = 0
};

static const struct UnkStruct_Shared sUnkStruct_Shared_Dummy = {};

// starts at gUnknown_082F0474 in pokeemerald, union link groups

ALIGNED(4) static const u8 gUnknown_845704C[] = {
    UROOM_ACTIVITY_BATTLE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457050[] = {
    UROOM_ACTIVITY_DBLBATTLE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457054[] = {
    UROOM_ACTIVITY_MLTBATTLE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457058[] = {
    UROOM_ACTIVITY_TRADE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845705C[] = {
    UROOM_ACTIVITY_PJUMP,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457060[] = {
    UROOM_ACTIVITY_BCRUSH,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457064[] = {
    UROOM_ACTIVITY_BPICK,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457068[] = {
    UROOM_ACTIVITY_WCARD2,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845706C[] = {
    UROOM_ACTIVITY_WNEWS2,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457070[] = {
    UROOM_ACTIVITY_NONE | 0x40,
    UROOM_ACTIVITY_BATTLE | 0x40,
    UROOM_ACTIVITY_TRADE | 0x40,
    UROOM_ACTIVITY_CHAT | 0x40,
    UROOM_ACTIVITY_CARD | 0x40,
    UROOM_ACTIVITY_ACCEPT | 0x40,
    UROOM_ACTIVITY_DECLINE | 0x40,
    0x13 | 0x40,
    0x14 | 0x40,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845707C[] = {
    UROOM_ACTIVITY_SEARCH,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457080[] = {
    UROOM_ACTIVITY_BATTLE,
    UROOM_ACTIVITY_DBLBATTLE,
    UROOM_ACTIVITY_MLTBATTLE,
    UROOM_ACTIVITY_TRADE,
    UROOM_ACTIVITY_PJUMP,
    UROOM_ACTIVITY_BCRUSH,
    UROOM_ACTIVITY_BPICK,
    UROOM_ACTIVITY_WCARD2,
    UROOM_ACTIVITY_WNEWS2,
    UROOM_ACTIVITY_SPINTRADE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845708C[] = {
    UROOM_ACTIVITY_BATTLE,
    UROOM_ACTIVITY_DBLBATTLE,
    UROOM_ACTIVITY_MLTBATTLE,
    UROOM_ACTIVITY_TRADE,
    UROOM_ACTIVITY_BCRUSH,
    0xFF
};

static const u8 *const sAcceptedActivityIds[] = {
    gUnknown_845704C,
    gUnknown_8457050,
    gUnknown_8457054,
    gUnknown_8457058,
    gUnknown_845705C,
    gUnknown_8457060,
    gUnknown_8457064,
    gUnknown_8457068,
    gUnknown_845706C,
    gUnknown_8457070,
    gUnknown_845707C,
    gUnknown_8457080,
    gUnknown_845708C
};

static const u8 sLinkGroupToURoomActivity[] = {
    [LINK_GROUP_SINGLE_BATTLE] = UROOM_ACTIVITY_BATTLE,
    [LINK_GROUP_DOUBLE_BATTLE] = UROOM_ACTIVITY_DBLBATTLE,
    [LINK_GROUP_MULTI_BATTLE]  = UROOM_ACTIVITY_MLTBATTLE,
    [LINK_GROUP_TRADE]         = UROOM_ACTIVITY_TRADE,
    [LINK_GROUP_POKEMON_JUMP]  = UROOM_ACTIVITY_PJUMP,
    [LINK_GROUP_BERRY_CRUSH]   = UROOM_ACTIVITY_BCRUSH,
    [LINK_GROUP_BERRY_PICKING] = UROOM_ACTIVITY_BPICK,
    [LINK_GROUP_WONDER_CARD]   = UROOM_ACTIVITY_WCARD2,
    [LINK_GROUP_WONDER_NEWS]   = UROOM_ACTIVITY_WNEWS2
};

static const u8 sUnref_84570D1[] = _("{DYNAMIC 00}·{DYNAMIC 01}");

#undef _8456CD8

// These are functions in Emerald but inlined in FireRed

#define IntlConvPartnerUname7(dest, arg1) ({                              \
    StringCopy7(dest, (arg1).unk.playerName);                             \
    ConvertInternationalString(dest, (arg1).unk.gname.unk_00.unk_00_0); \
})

#define IntlConvPartnerUname(dest, arg1) ({                               \
    StringCopy(dest, (arg1).unk.playerName);                              \
    ConvertInternationalString(dest, (arg1).unk.gname.unk_00.unk_00_0); \
})

#define CopyTrainerCardData(dest, src, _version) ({ \
    (dest) = *((struct TrainerCard * )(src));       \
    (dest).version = _version;                      \
})

#define GetStringRightAlignXOffset(_fontId, _string, _maxWidth) ({ \
    u16 strWidth = GetStringWidth(_fontId, _string, 0);            \
    _maxWidth - strWidth;                                          \
})

// arg1 is a 2-nybble code
// Bits 0-3: Capacity
// Bits 4-7: Min required (if 0, must have exactly Capacity players
static void PrintNumPLayersWaitingForMsg(u8 windowId, u8 capacityCode, u8 count)
{
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    switch (capacityCode << 8)
    {
    case 0x200:
        UR_AddTextPrinterParameterized(windowId, 2, gUnknown_845742C[0][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    case 0x400:
        UR_AddTextPrinterParameterized(windowId, 2, gUnknown_845742C[1][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    case 0x2500:
        UR_AddTextPrinterParameterized(windowId, 2, gUnknown_845742C[2][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    case 0x3500:
        UR_AddTextPrinterParameterized(windowId, 2, gUnknown_845742C[3][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    }

    CopyWindowToVram(windowId, 2);
}

static void sub_8115924(u8 windowId)
{
    u8 text[12];
    u8 text2[12];

    UR_AddTextPrinterParameterized(windowId, 2, gSaveBlock2Ptr->playerName, 0, 2, UR_COLOR_DKE_WHT_LTE);
    StringCopy(text2, gUnknown_84571B4);
    ConvertIntToDecimalStringN(text, ReadAsU16(gSaveBlock2Ptr->playerTrainerId), STR_CONV_MODE_LEADING_ZEROS, 5);
    StringAppend(text2, text);
    UR_AddTextPrinterParameterized(windowId, 0, text2, 0, 0x10, UR_COLOR_DKE_WHT_LTE);
}

static void StringExpandPlaceholders_AwaitingCommFromAnother(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case UROOM_ACTIVITY_BATTLE:
    case UROOM_ACTIVITY_DBLBATTLE:
    case UROOM_ACTIVITY_MLTBATTLE:
    case UROOM_ACTIVITY_TRADE:
    case UROOM_ACTIVITY_PJUMP:
    case UROOM_ACTIVITY_BCRUSH:
    case UROOM_ACTIVITY_BPICK:
    case UROOM_ACTIVITY_WCARD2:
    case UROOM_ACTIVITY_WNEWS2:
        // UB: argument *dst isn't used, instead it always prints to gStringVar4
        StringExpandPlaceholders(gStringVar4, gUnknown_8457234);
        break;
    }
}

void TryBecomeLinkLeader(void)
{
    u8 taskId;
    struct UnkStruct_Leader * dataPtr;

    taskId = CreateTask(sub_8115A68, 0);
    sUnionRoomMain.leader = dataPtr = (void*)(gTasks[taskId].data);
    sLeader = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    gSpecialVar_Result = 0;
}

static void sub_8115A68(u8 taskId)
{
    u32 id, val;
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;

    switch (data->state)
    {
    case 0:
        sPlayerCurrActivity = sLinkGroupToActivityAndCapacity[gSpecialVar_0x8004];
        sPlayerActivityGroupSize = sLinkGroupToActivityAndCapacity[gSpecialVar_0x8004] >> 8;
        SetHostRFUtgtGname(sPlayerCurrActivity, 0, 0);
        sub_800B1F4();
        OpenLink();
        sub_80FBB8C(sPlayerActivityGroupSize & 0xF);
        data->state = 3;
        break;
    case 3:
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(5 * sizeof(struct UnkStruct_x20));
        data->field_8 = AllocZeroed(5 * sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 5);
        LinkRfu3_SetGnameUnameFromStaticBuffers(&data->field_0->arr[0].unk.gname, data->field_0->arr[0].unk.playerName);
        data->field_0->arr[0].field_18 = 0;
        data->field_0->arr[0].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
        data->field_0->arr[0].field_1A_1 = 0;
        data->field_0->arr[0].field_1B = 0;
        data->field_17 = sub_811A054(data->field_4, 0xFF);
        data->field_10 = AddWindow(&gUnknown_8456CD0);
        data->listWindowId = AddWindow(&gUnknown_8456CFC);
        data->field_11 = AddWindow(&gUnknown_8456D04);

        FillWindowPixelBuffer(data->field_10, PIXEL_FILL(2));
        UR_AddTextPrinterParameterized(data->field_10, 0, gUnknown_845747C, 8, 2, UR_COLOR_WHT_DKE_LTE);
        PutWindowTilemap(data->field_10);
        CopyWindowToVram(data->field_10, 2);

        DrawStdWindowFrame(data->listWindowId, FALSE);
        gMultiuseListMenuTemplate = gUnknown_8456D34;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        DrawStdWindowFrame(data->field_11, FALSE);
        PutWindowTilemap(data->field_11);
        CopyWindowToVram(data->field_11, 2);

        CopyBgTilemapBufferToVram(0);
        data->playerCount = 1;
        data->state = 4;
        break;
    case 4:
        StringCopy(gStringVar1, sUnionRoomActivityStringPtrs[sPlayerCurrActivity]);
        if ((sPlayerActivityGroupSize >> 4) != 0)
        {
            if (data->playerCount > (sPlayerActivityGroupSize >> 4) - 1 && (sPlayerActivityGroupSize & 0xF) != 0)
                StringExpandPlaceholders(gStringVar4, gUnknown_8457264);
            else
                StringExpandPlaceholders(gStringVar4, gUnknown_8457234);
        }
        else
        {
            StringExpandPlaceholders_AwaitingCommFromAnother(gStringVar4, sPlayerCurrActivity);
        }

        PrintNumPLayersWaitingForMsg(data->field_11, sPlayerActivityGroupSize, data->playerCount);
        data->state = 5;
        break;
    case 5:
        if (PrintOnTextbox(&data->textState, gStringVar4))
            data->state = 6;
        break;
    case 6:
        sub_8116444(data, 7, 10);
        if (JOY_NEW(B_BUTTON))
        {
            if (data->playerCount == 1)
                data->state = 23;
            else if ((sPlayerActivityGroupSize & 0xF0) != 0)
                data->state = 30;
            else
                data->state = 19;
        }
        if ((sPlayerActivityGroupSize >> 4) != 0
            && data->playerCount > (sPlayerActivityGroupSize >> 4) - 1
            && (sPlayerActivityGroupSize & 0xF) != 0
            && sub_80FC1CC()
            && JOY_NEW(START_BUTTON))
        {
            data->state = 15;
            sub_80F8F5C();
        }
        if (data->state == 6 && sub_80FA5D4())
        {
            data->state = 9;
        }
        break;
    case 9:
        if (!sub_80FA5D4())
        {
            data->state = 6;
            data->playerCount = UnionRoomLeaderField0CompactionAndCount(data->field_0);
        }
        break;
    case 10:
        id = ((sPlayerCurrActivity & 0xF) == 2) ? 1 : 0;
        if (PrintOnTextbox(&data->textState, gUnknown_845767C[id]))
        {
            data->playerCount = UnionRoomLeaderField0CompactionAndCount(data->field_0);
            RedrawListMenu(data->listTaskId);
            data->state = 4;
        }
        break;
    case 29:
        id = ((sPlayerActivityGroupSize & 0xF) == 2) ? 0 : 1;
        if (PrintOnTextbox(&data->textState, gUnknown_845767C[id]))
        {
            data->state = 21;
        }
        break;
    case 7:
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            data->state = 11;
        }
        break;
    case 11:
        switch (sub_811A14C(&data->textState, sub_80FA634(ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].unk.playerName)))
        {
        case 0:
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
            data->field_19 = 5;
            sub_80FA670(5, ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].unk.playerName);
            data->state = 12;
            break;
        case 1:
        case -1:
            data->field_19 = 6;
            sub_80FA670(6, ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].unk.playerName);
            data->state = 12;
            break;
        case -3:
            data->state = 9;
            break;
        }
        break;
    case 12:
        val = sub_80FA6FC(ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].unk.playerName);
        if (val == 1)
        {
            if (data->field_19 == 5)
            {
                data->field_0->arr[data->playerCount].field_1B = 0;
                RedrawListMenu(data->listTaskId);
                data->playerCount++;
                if (data->playerCount == (sPlayerActivityGroupSize & 0xF))
                {
                    if ((sPlayerActivityGroupSize & 0xF0) != 0 || data->playerCount == 4)
                    {
                        data->state = 15;
                    }
                    else
                    {
                        IntlConvPartnerUname7(gStringVar1, data->field_0->arr[data->playerCount - 1]);
                        StringExpandPlaceholders(gStringVar4, gUnknown_8457554);
                        data->state = 13;
                    }

                    sub_80F8F5C();
                    PrintNumPLayersWaitingForMsg(data->field_11, sPlayerActivityGroupSize, data->playerCount);
                }
                else
                {
                    data->state = 4;
                }
            }
            else
            {
                sub_80FBD4C(data->field_0->arr[data->playerCount].unk.playerName, ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId));
                data->field_0->arr[data->playerCount].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
                UnionRoomLeaderField0CompactionAndCount(data->field_0);
                RedrawListMenu(data->listTaskId);
                data->state = 4;
            }

            data->field_19 = 0;
        }
        else if (val == 2)
        {
            RfuSetErrorStatus(0, 0);
            data->state = 4;
        }
        break;
    case 13:
        if (PrintOnTextbox(&data->textState, gStringVar4))
            data->state = 14;
        break;
    case 14:
        if (++data->field_E > 120)
            data->state = 17;
        break;
    case 15:
        if (PrintOnTextbox(&data->textState, gUnknown_8457514))
            data->state = 16;
        break;
    case 16:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            data->state = 17;
            break;
        case 1:
        case -1:
            if ((sPlayerActivityGroupSize & 0xF0) != 0)
                data->state = 30;
            else
                data->state = 19;
            break;
        }
        break;
    case 19:
        if (PrintOnTextbox(&data->textState, gUnknown_8457530))
            data->state = 20;
        break;
    case 20:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            data->state = 23;
            break;
        case 1:
        case -1:
            if ((sPlayerActivityGroupSize & 0xF0) != 0)
                data->state = 15;
            else if (data->playerCount == (sPlayerActivityGroupSize & 0xF))
                data->state = 15;
            else
                data->state = 4;
            break;
        }
        break;
    case 17:
        if (!sub_8116444(data, 7, 23))
            data->state = 18;
        break;
    case 18:
        if (sub_80F8F40())
        {
            if (sub_80F8F7C(FALSE))
            {
                data->state = 26;
            }
        }
        else
        {
            data->state = 29;
            data->textState = 0;
        }
        break;
    case 30:
        if (PrintOnTextbox(&data->textState, gUnknown_8457610))
            data->state = 23;
        break;
    case 21:
    case 23:
        DestroyWirelessStatusIndicatorSprite();
        sub_80F8DC0();
        sub_81161E4(data);
        data->state++;
        break;
    case 24:
        EnableBothScriptContexts();
        DestroyTask(taskId);
        gSpecialVar_Result = 5;
        break;
    case 22:
        EnableBothScriptContexts();
        DestroyTask(taskId);
        gSpecialVar_Result = 8;
        break;
    case 26:
        if (RfuIsErrorStatus1or2())
        {
            data->state = 29;
        }
        else
        {
            if (gReceivedRemoteLinkPlayers != 0)
            {
                sub_80FAFE0(1);
                sub_8117990();
                sub_81161E4(data);
                DestroyTask(taskId);
            }
        }
        break;
    }
}

static void sub_81161E4(struct UnkStruct_Leader * data)
{
    ClearWindowTilemap(data->field_11);
    ClearStdWindowAndFrame(data->field_11, FALSE);
    DestroyListMenuTask(data->listTaskId, 0, 0);
    ClearWindowTilemap(data->field_10);
    ClearStdWindowAndFrame(data->listWindowId, FALSE);
    CopyBgTilemapBufferToVram(0);
    RemoveWindow(data->field_11);
    RemoveWindow(data->listWindowId);
    RemoveWindow(data->field_10);
    DestroyTask(data->field_17);

    Free(data->field_8);
    Free(data->field_0);
    Free(data->field_4);
}

static void sub_8116244(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 1:
    case 2:
    case 4:
        StringExpandPlaceholders(dst, gUnknown_84574A0);
        break;
    case 21:
    case 22:
        StringExpandPlaceholders(dst, gUnknown_84574C4);
        break;
    case 3:
    case 9:
    case 10:
    case 11:
        StringExpandPlaceholders(dst, gUnknown_84574EC);
        break;
    }
}

static void sub_81162E0(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 65:
    case 68:
        StringExpandPlaceholders(dst, gUnknown_8457E28);
        break;
    case 69:
    case 72:
        StringExpandPlaceholders(dst, gUnknown_8457E44);
        break;
    }
}

static void sub_811631C(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 1:
    case 2:
    case 4:
    case 21:
    case 22:
        StringExpandPlaceholders(dst, gUnknown_8459238);
        break;
    case 3:
    case 9:
    case 10:
    case 11:
        StringExpandPlaceholders(dst, gUnknown_8459250);
        break;
    }
}

static void sub_81163B0(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 1:
    case 2:
    case 4:
    case 21:
    case 22:
        StringExpandPlaceholders(dst, gUnknown_84576AC);
        break;
    case 3:
    case 9:
    case 10:
    case 11:
        StringExpandPlaceholders(dst, gUnknown_84576C4);
        break;
    }
}

static bool8 sub_8116444(struct UnkStruct_Leader * data, u32 state1, u32 state2)
{
    switch (sub_8116524(data->field_0))
    {
    case 1:
        PlaySE(SE_PC_LOGIN);
        RedrawListMenu(data->listTaskId);
        IntlConvPartnerUname7(gStringVar2, data->field_0->arr[data->playerCount]);
        sub_8116244(gStringVar4, sPlayerCurrActivity);
        data->state = state1;
        break;
    case 2:
        RfuSetErrorStatus(0, 0);
        RedrawListMenu(data->listTaskId);
        data->state = state2;
        return TRUE;
    }

    return FALSE;
}

static void sub_81164C8(u8 windowId, s32 itemId, u8 y)
{
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;
    u8 var = 0;

    switch (data->field_0->arr[itemId].groupScheduledAnim)
    {
    case 1:
        if (data->field_0->arr[itemId].field_1B != 0)
            var = 2;
        break;
    case 2:
        var = 1;
        break;
    }

    sub_811A910(windowId, 0, y, &data->field_0->arr[itemId], var, itemId);
}

static u8 sub_8116524(struct UnkStruct_Main0 * arg0)
{
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;
    u8 ret = 0;
    u8 i;
    s32 id;

    for (i = 1; i < 5; i++)
    {
        u16 var = data->field_0->arr[i].groupScheduledAnim;
        if (var == UNION_ROOM_SPAWN_IN)
        {
            id = sub_811A748(&data->field_0->arr[i], data->field_4->arr);
            if (id != 0xFF)
            {
                data->field_0->arr[i].unk = data->field_4->arr[id].unk0;
                data->field_0->arr[i].field_18 = 1;
            }
            else
            {
                data->field_0->arr[i].groupScheduledAnim = UNION_ROOM_SPAWN_OUT;
                ret = 2;
            }
        }
    }

    for (id = 0; id < 4; id++)
        Appendx1Ctox20(data->field_0->arr, &data->field_4->arr[id], 5);

    if (ret != 2)
    {
        for (id = 0; id < 5; id++)
        {
            if (data->field_0->arr[id].field_1B != 0)
                ret = 1;
        }
    }

    return ret;
}

static u8 UnionRoomLeaderField0CompactionAndCount(struct UnkStruct_Main0 * arg0)
{
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;
    u8 copiedCount;
    s32 i;
    u8 ret;

    for (i = 0; i < 5; i++)
        data->field_8->arr[i] = data->field_0->arr[i];

    copiedCount = 0;
    for (i = 0; i < 5; i++)
    {
        if (data->field_8->arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
        {
            data->field_0->arr[copiedCount] = data->field_8->arr[i];
            copiedCount++;
        }
    }

    ret = copiedCount;
    for (; copiedCount < 5; copiedCount++)
    {
        data->field_0->arr[copiedCount].unk = sUnkStruct_Shared_Dummy;
        data->field_0->arr[copiedCount].field_18 = 0;
        data->field_0->arr[copiedCount].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
        data->field_0->arr[copiedCount].field_1A_1 = 0;
        data->field_0->arr[copiedCount].field_1B = 0;
    }

    for (i = 0; i < 5; i++)
    {
        if (data->field_0->arr[i].groupScheduledAnim != UNION_ROOM_SPAWN_IN)
            continue;
        if (data->field_0->arr[i].field_1B != 0x40)
            continue;

        ret = i;
        break;
    }

    return ret;
}

void TryJoinLinkGroup(void)
{
    u8 taskId;
    struct UnkStruct_Group * dataPtr;

    taskId = CreateTask(Task_TryJoinLinkGroup, 0);
    sUnionRoomMain.group = dataPtr = (void*)(gTasks[taskId].data);
    sGroup = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    gSpecialVar_Result = 0;
}

static void Task_TryJoinLinkGroup(u8 taskId)
{
    s32 id;
    struct UnkStruct_Group * data = sUnionRoomMain.group;

    switch (data->state)
    {
    case 0:
        SetHostRFUtgtGname(sLinkGroupToURoomActivity[gSpecialVar_0x8004], 0, 0);
        sPlayerCurrActivity = sLinkGroupToURoomActivity[gSpecialVar_0x8004];
        sub_800B1F4();
        OpenLink();
        sub_80FBBD8();
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 1;
        break;
    case 1:
        if (PrintOnTextbox(&data->textState, gUnknown_84591B8[gSpecialVar_0x8004]))
            data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->field_11 = sub_811A054(data->field_4, gSpecialVar_0x8004);
        data->field_C = AddWindow(&gUnknown_8456CD0);
        data->listWindowId = AddWindow(&gUnknown_8456D4C);
        data->field_D = AddWindow(&gUnknown_8456D54);

        FillWindowPixelBuffer(data->field_C, PIXEL_FILL(2));
        UR_AddTextPrinterParameterized(data->field_C, 0, gUnknown_8458FC8, 8, 2, UR_COLOR_WHT_DKE_LTE);
        PutWindowTilemap(data->field_C);
        CopyWindowToVram(data->field_C, 2);

        DrawStdWindowFrame(data->listWindowId, FALSE);
        gMultiuseListMenuTemplate = sListMenuTemplate_UnionRoomGroups;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        DrawStdWindowFrame(data->field_D, FALSE);
        PutWindowTilemap(data->field_D);
        sub_8115924(data->field_D);
        CopyWindowToVram(data->field_D, 2);

        CopyBgTilemapBufferToVram(0);
        data->field_F = 0;
        data->state = 3;
        break;
    case 3:
        id = sub_8116FE4();
        switch (id)
        {
        case 1:
            PlaySE(SE_PC_LOGIN);
            RedrawListMenu(data->listTaskId);
            break;
        case 0:
            id = ListMenu_ProcessInput(data->listTaskId);
            if (JOY_NEW(A_BUTTON) && id != -1)
            {
                // this unused variable along with the assignment is needed to match
                u32 unusedVar;
                unusedVar  = data->field_0->arr[id].unk.gname.activity;

                if (data->field_0->arr[id].groupScheduledAnim == UNION_ROOM_SPAWN_IN && !data->field_0->arr[id].unk.gname.unk_0a_7)
                {
                    u32 var = sub_8116D10(data, id);
                    if (var == 0)
                    {
                        sub_8116D60(data, id);
                        data->state = 5;
                        PlaySE(SE_PN_ON);
                    }
                    else
                    {
                        StringCopy(gStringVar4, gUnknown_8457608[var - 1]);
                        data->state = 18;
                        PlaySE(SE_PN_ON);
                    }
                }
                else
                {
                    PlaySE(SE_WALL_HIT);
                }
            }
            else if (JOY_NEW(B_BUTTON))
            {
                data->state = 10;
            }
            break;
        default:
            RedrawListMenu(data->listTaskId);
            break;
        }
        break;
    case 5:
        sub_811631C(gStringVar4, sPlayerCurrActivity);
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            IntlConvPartnerUname7(gStringVar1, data->field_0->arr[data->field_F]);
            data->state = 6;
        }
        break;
    case 6:
        if (gReceivedRemoteLinkPlayers != 0)
        {
            sPlayerCurrActivity = data->field_0->arr[data->field_F].unk.gname.activity;
            RfuSetErrorStatus(0, 0);
            switch (sPlayerCurrActivity)
            {
            case UROOM_ACTIVITY_BATTLE:
            case UROOM_ACTIVITY_DBLBATTLE:
            case UROOM_ACTIVITY_MLTBATTLE:
            case UROOM_ACTIVITY_TRADE:
            case UROOM_ACTIVITY_CHAT:
            case UROOM_ACTIVITY_PJUMP:
            case UROOM_ACTIVITY_BCRUSH:
            case UROOM_ACTIVITY_BPICK:
            case UROOM_ACTIVITY_SPINTRADE:
            case UROOM_ACTIVITY_ITEMTRADE:
            case UROOM_ACTIVITY_WCARD2:
            case UROOM_ACTIVITY_WNEWS2:
                data->state = 20;
                break;
            }
        }

        switch (RfuGetErrorStatus())
        {
        case 1:
            data->state = 12;
            break;
        case 2:
        case 6:
        case 9:
            data->state = 14;
            break;
        case 5:
            sub_81163B0(gStringVar4, sPlayerCurrActivity);
            if (PrintOnTextbox(&data->textState, gStringVar4))
            {
                RfuSetErrorStatus(7, 0);
                StringCopy(gStringVar1, sUnionRoomActivityStringPtrs[sPlayerCurrActivity]);
                StringExpandPlaceholders(gStringVar4, gUnknown_8457700);
            }
            break;
        case 7:
            if (data->field_15 > 0xF0)
            {
                if (PrintOnTextbox(&data->textState, gStringVar4))
                {
                    RfuSetErrorStatus(12, 0);
                    data->field_15 = 0;
                }
            }
            else
            {
                data->field_15++;
            }
            break;
        }

        if (!RfuGetErrorStatus() && JOY_NEW(B_BUTTON))
            data->state = 7;
        break;
    case 7:
        if (PrintOnTextbox(&data->textState, gUnknown_845771C))
            data->state = 8;
        break;
    case 8:
        switch (sub_811A14C(&data->textState, RfuGetErrorStatus()))
        {
        case 0:
            sub_80FA6BC();
            data->state = 9;
            RedrawListMenu(data->listTaskId);
            break;
        case 1:
        case -1:
            data->state = 5;
            RedrawListMenu(data->listTaskId);
            break;
        case -3:
            data->state = 6;
            RedrawListMenu(data->listTaskId);
            break;
        }
        break;
    case 9:
        if (RfuGetErrorStatus())
            data->state = 6;
        break;
    case 10:
    case 12:
    case 14:
    case 18:
    case 20:
        ClearWindowTilemap(data->field_D);
        ClearStdWindowAndFrame(data->field_D, FALSE);
        DestroyListMenuTask(data->listTaskId, 0, 0);
        ClearWindowTilemap(data->field_C);
        ClearStdWindowAndFrame(data->listWindowId, FALSE);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->field_D);
        RemoveWindow(data->listWindowId);
        RemoveWindow(data->field_C);
        DestroyTask(data->field_11);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 13:
        DestroyWirelessStatusIndicatorSprite();
        if (PrintOnTextbox(&data->textState, gUnknown_8457754[RfuGetErrorStatus()]))
        {
            gSpecialVar_Result = 6;
            data->state = 23;
        }
        break;
    case 11:
        DestroyWirelessStatusIndicatorSprite();
        gSpecialVar_Result = 5;
        data->state = 23;
        break;
    case 15:
        DestroyWirelessStatusIndicatorSprite();
        if (PrintOnTextbox(&data->textState, gUnknown_8457754[RfuGetErrorStatus()]))
        {
            gSpecialVar_Result = 8;
            data->state = 23;
        }
        break;
    case 19:
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            gSpecialVar_Result = 8;
            data->state = 23;
        }
        break;
    case 23:
        DestroyTask(taskId);
        sub_811A41C();
        sub_80F8DC0();
        break;
    case 21:
        sub_8117990();
        DestroyTask(taskId);
        break;
    }
}

static u32 sub_8116D10(struct UnkStruct_Group * arg0, s32 id)
{
    struct UnkStruct_x20 * structPtr = &arg0->field_0->arr[id];

    if (sPlayerCurrActivity == UROOM_ACTIVITY_TRADE && structPtr->unk.gname.unk_00.unk_01_2 != VERSION_FIRE_RED && structPtr->unk.gname.unk_00.unk_01_2 != VERSION_LEAF_GREEN)
    {
        if (!(gSaveBlock2Ptr->specialSaveWarpFlags & CHAMPION_SAVEWARP))
            return 1;
        else if (structPtr->unk.gname.unk_00.isChampion)
            return 0;
    }
    else
    {
        return 0;
    }

    return 2;
}

static void sub_8116D60(struct UnkStruct_Group * data, s32 id)
{
    data->field_F = id;
    LoadWirelessStatusIndicatorSpriteGfx();
    CreateWirelessStatusIndicatorSprite(0, 0);
    RedrawListMenu(data->listTaskId);
    IntlConvPartnerUname7(gStringVar1, data->field_0->arr[data->field_F]);
    sub_80FB008(sLinkGroupToURoomActivity[gSpecialVar_0x8004], 0, 1);
    sub_80FBF54(data->field_0->arr[data->field_F].unk.playerName, ReadAsU16(data->field_0->arr[data->field_F].unk.gname.unk_00.playerTrainerId));
}

u8 sub_8116DE0(void)
{
    u8 taskId;
    struct UnkStruct_Group * dataPtr;

    taskId = CreateTask(sub_8116E1C, 0);
    sUnionRoomMain.group = dataPtr = (void*)(gTasks[taskId].data);

    dataPtr->state = 0;
    dataPtr->textState = 0;

    sGroup = dataPtr;

    return taskId;
}

static void sub_8116E1C(u8 taskId)
{
    struct UnkStruct_Group * data = sUnionRoomMain.group;

    switch (data->state)
    {
    case 0:
        SetHostRFUtgtGname(0, 0, 0);
        sub_800B1F4();
        OpenLink();
        sub_80FBBD8();
        sub_80FB128(TRUE);
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->field_11 = sub_811A054(data->field_4, 0xFF);
        data->field_F = 0;
        data->state = 3;
        break;
    case 3:
        if (sub_8116FE4() == 1)
            PlaySE(SE_PC_LOGIN);
        if (gTasks[taskId].data[15] == 0xFF)
            data->state = 10;
        break;
    case 10:
        DestroyTask(data->field_11);
        Free(data->field_0);
        Free(data->field_4);
        sub_80F8DC0();
        data->state++;
        break;
    case 11:
        sub_80F8DC0();
        DestroyTask(taskId);
        break;
    }
}

static bool32 IsPartnerActivityAcceptable(u32 activity, u32 group)
{
    if (group == 0xFF)
        return TRUE;

    if (group <= NELEMS(sAcceptedActivityIds)) // UB: <= may access data outside the array
    {
        const u8 *bytes = sAcceptedActivityIds[group];

        while ((*(bytes) != 0xFF))
        {
            if ((*bytes) == activity)
                return TRUE;
            bytes++;
        }
    }

    return FALSE;
}

static u8 sub_8116F5C(struct UnkStruct_Group * data, u32 id)
{
    if (data->field_0->arr[id].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
    {
        if (data->field_0->arr[id].unk.gname.unk_0a_7)
            return UR_COLOR_WHT_WHT_LTE;
        else if (data->field_0->arr[id].field_1A_1 != 0)
            return UR_COLOR_RED_WHT_LTR;
        else if (data->field_0->arr[id].field_1B != 0)
            return UR_COLOR_GRN_WHT_LTG;
    }

    return UR_COLOR_DKE_WHT_LTE;
}

static void ListMenuItemPrintFunc_UnionRoomGroups(u8 windowId, s32 itemId, u8 y)
{
    struct UnkStruct_Group * data = sUnionRoomMain.group;
    u8 color_idx = sub_8116F5C(data, itemId);

    sub_811A81C(windowId, 8, y, &data->field_0->arr[itemId], color_idx, itemId);
}

static u8 sub_8116FE4(void)
{
    struct UnkStruct_Group * data = sUnionRoomMain.group;
    u8 ret = 0;
    u8 i;
    s32 id;

    for (i = 0; i < 16; i++)
    {
        if (data->field_0->arr[i].groupScheduledAnim != UNION_ROOM_SPAWN_NONE)
        {
            id = sub_811A748(&data->field_0->arr[i], data->field_4->arr);
            if (id != 0xFF)
            {
                if (data->field_0->arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
                {
                    if (AreUnionRoomPlayerGnamesDifferent(&data->field_0->arr[i].unk, &data->field_4->arr[id].unk0))
                    {
                        data->field_0->arr[i].unk = data->field_4->arr[id].unk0;
                        data->field_0->arr[i].field_1B = 0x40;
                        ret = 1;
                    }
                    else
                    {
                        if (data->field_0->arr[i].field_1B != 0)
                        {
                            data->field_0->arr[i].field_1B--;
                            if (data->field_0->arr[i].field_1B == 0)
                                ret = 2;
                        }
                    }
                }
                else
                {
                    data->field_0->arr[i].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
                    data->field_0->arr[i].field_1B = 0x40;
                    ret = 1;
                }

                data->field_0->arr[i].field_18 = 0;
            }
            else
            {
                if (data->field_0->arr[i].groupScheduledAnim != UNION_ROOM_SPAWN_OUT)
                {
                    data->field_0->arr[i].field_18++;
                    if (data->field_0->arr[i].field_18 >= 300)
                    {
                        data->field_0->arr[i].groupScheduledAnim = UNION_ROOM_SPAWN_OUT;
                        ret = 2;
                    }
                }
            }
        }
    }

    for (id = 0; id < 4; id++)
    {
        if (Appendx1Ctox20(data->field_0->arr, &data->field_4->arr[id], 16) != 0xFF)
            ret = 1;
    }

    return ret;
}

static void sub_8117100(u8 taskId)
{
    CB2_ReturnFromLinkTrade();
    DestroyTask(taskId);
}

u8 sub_8117118(void)
{
    u8 taskId = CreateTask(sub_8117100, 0);

    return taskId;
}

static void sub_8117130(u8 taskId)
{
    u32 monId = GetPartyPositionOfRegisteredMon(&sUnionRoomTrade, GetMultiplayerId());

    switch (gTasks[taskId].data[0])
    {
    case 0:
        gTasks[taskId].data[0]++;
        SendBlock(0, &gPlayerParty[monId], sizeof(struct Pokemon));
        break;
    case 1:
        if (GetBlockReceivedStatus() == 3)
        {
            gEnemyParty[0] = *(struct Pokemon*)(gBlockRecvBuffer[GetMultiplayerId() ^ 1]);
            IncrementGameStat(GAME_STAT_NUM_UNION_ROOM_BATTLES);
            ResetBlockReceivedFlags();
            gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        memcpy(gBlockSendBuffer, gSaveBlock1Ptr->mail, sizeof(struct MailStruct) * PARTY_SIZE + 4);
        if (SendBlock(0, gBlockSendBuffer, sizeof(struct MailStruct) * PARTY_SIZE + 4))
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (GetBlockReceivedStatus() == 3)
        {
            memcpy(gLinkPartnerMail, gBlockRecvBuffer[GetMultiplayerId() ^ 1], sizeof(struct MailStruct) * PARTY_SIZE);
            ResetBlockReceivedFlags();
            gSelectedTradeMonPositions[TRADE_PLAYER] = monId;
            gSelectedTradeMonPositions[TRADE_PARTNER] = PARTY_SIZE;
            gMain.savedCallback = CB2_ReturnToField;
            SetMainCallback2(CB2_InitTradeAnim_LinkTrade);
            ResetUnionRoomTrade(&sUnionRoomTrade);
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_8117280(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (GetMultiplayerId() == 0)
            sub_800A474(2);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (GetBlockReceivedStatus() == sub_800A8D4())
        {
            s32 i;
            u16 *recvBuff;

            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                recvBuff = gBlockRecvBuffer[i];
                CopyTrainerCardData(gTrainerCards[i], recvBuff, gLinkPlayers[i].version);
            }

            if (GetLinkPlayerCount() == 2)
            {
                recvBuff = gBlockRecvBuffer[GetMultiplayerId() ^ 1];
                sub_81446D0(recvBuff[48]);
            }
            else
            {
                sub_81446C4();
            }

            ResetBlockReceivedFlags();
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_8117354(void)
{
    switch (gMain.state)
    {
    case 0:
        CreateTask(sub_8117280, 5);
        gMain.state++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_8117280))
            ShowTrainerCardInLink(GetMultiplayerId() ^ 1, CB2_ReturnToField);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

void sub_81173C0(u16 battleFlags)
{
    HealPlayerParty();
    SavePlayerParty();
    LoadPlayerBag();
    gLinkPlayers[0].linkType = LINKTYPE_BATTLE;
    gLinkPlayers[GetMultiplayerId()].id = GetMultiplayerId();
    gLinkPlayers[GetMultiplayerId() ^ 1].id = GetMultiplayerId() ^ 1;
    gMain.savedCallback = sub_8081668;
    gBattleTypeFlags = battleFlags;
    PlayBattleBGM();
}

static void sub_8117440(u16 linkService, u16 x, u16 y)
{
    VarSet(VAR_CABLE_CLUB_STATE, linkService);
    SetWarpDestination(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, -1, x, y);
    SetDynamicWarpWithCoords(0, gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, -1, x, y);
    WarpIntoMap();
}

static void sub_81174B4(s8 mapGroup, s8 mapNum, s32 x, s32 y, u16 linkService)
{
    gSpecialVar_0x8004 = linkService;
    VarSet(VAR_CABLE_CLUB_STATE, linkService);
    gFieldLinkPlayerCount = GetLinkPlayerCount();
    gLocalLinkPlayerId = GetMultiplayerId();
    SetCableClubWarp();
    SetWarpDestination(mapGroup, mapNum, -1, x, y);
    WarpIntoMap();
}

static void sub_8117534(void)
{
    switch (gMain.state)
    {
    case 0:
        CreateTask(sub_8117280, 5);
        gMain.state++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_8117280))
            SetMainCallback2(sub_8056788);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

static void sub_8117594(void *arg0, bool32 arg1)
{
    TrainerCard_GenerateCardForLinkPlayer((struct TrainerCard * )arg0);
    if (arg1)
        *((u16 *)(arg0 + sizeof(struct TrainerCard))) = GetWonderCardFlagId();
    else
        *((u16 *)(arg0 + sizeof(struct TrainerCard))) = 0;
}

static void sub_81175BC(u8 taskId)
{
    sub_81446C4();
    switch (sPlayerCurrActivity)
    {
    case 1 ... 4:
    case 9 ... 11:
    case 13:
    case 14:
        RecordMixTrainerNames();
        break;
    }

    switch (sPlayerCurrActivity)
    {
    case 65:
    case 81:
        CleanupOverworldWindowsAndTilemaps();
        gMain.savedCallback = CB2_UnionRoomBattle;
        InitChooseHalfPartyForBattle(2);
        break;
    case 1:
        CleanupOverworldWindowsAndTilemaps();
        sub_8117594(gBlockSendBuffer, TRUE);
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        sub_81174B4(MAP_GROUP(BATTLE_COLOSSEUM_2P), MAP_NUM(BATTLE_COLOSSEUM_2P), 6, 8, USING_SINGLE_BATTLE);
        SetMainCallback2(sub_8117534);
        break;
    case 2:
        CleanupOverworldWindowsAndTilemaps();
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        sub_8117594(gBlockSendBuffer, TRUE);
        sub_81174B4(MAP_GROUP(BATTLE_COLOSSEUM_2P), MAP_NUM(BATTLE_COLOSSEUM_2P), 6, 8, USING_DOUBLE_BATTLE);
        SetMainCallback2(sub_8117534);
        break;
    case 3:
        CleanupOverworldWindowsAndTilemaps();
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        sub_8117594(gBlockSendBuffer, TRUE);
        sub_81174B4(MAP_GROUP(BATTLE_COLOSSEUM_4P), MAP_NUM(BATTLE_COLOSSEUM_4P), 5, 8, USING_MULTI_BATTLE);
        SetMainCallback2(sub_8117534);
        break;
    case 4:
        sub_8117594(gBlockSendBuffer, TRUE);
        CleanupOverworldWindowsAndTilemaps();
        sub_81174B4(MAP_GROUP(TRADE_CENTER), MAP_NUM(TRADE_CENTER), 5, 8, USING_TRADE_CENTER);
        SetMainCallback2(sub_8117534);
        break;
    case 68:
        CreateTask(sub_8117130, 0);
        break;
    case 5:
    case 69:
        if (GetMultiplayerId() == 0)
        {
            sub_80F8CFC();
        }
        else
        {
            sub_80F8D14();
            SetHostRFUtgtGname(0x45, 0, 1);
        }
        EnterUnionRoomChat();
        break;
    case 8:
    case 72:
        sub_8117594(gBlockSendBuffer, FALSE);
        SetMainCallback2(sub_8117354);
        break;
    case 9:
        sub_8117440(USING_MINIGAME, 5, 1);
        sub_8147AA8(GetCursorSelectionMonId(), CB2_LoadMap);
        break;
    case 10:
        sub_8117440(USING_BERRY_CRUSH, 9, 1);
        sub_814B754(CB2_LoadMap);
        break;
    case 11:
        sub_8117440(USING_MINIGAME, 5, 1);
        sub_81507FC(GetCursorSelectionMonId(), CB2_LoadMap);
        break;
    }

    DestroyTask(taskId);
    gSpecialVar_Result = 1;
    ScriptContext2_Disable();
}

static void sub_8117900(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 *sendBuff = (u16*)(gBlockSendBuffer);

    switch (data[0])
    {
    case 0:
        gSpecialVar_Result = 1;
        EnableBothScriptContexts();
        data[0]++;
        break;
    case 1:
        if (!ScriptContext1_IsScriptSetUp())
        {
            FadeScreen(FADE_TO_BLACK, 0);
            data[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            sub_800AB9C();
            data[0]++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            DestroyTask(taskId);
            sub_81179A4();
        }
        break;
    }
}

static void sub_8117990(void)
{
    CreateTask(sub_8117900, 0);
}

static void sub_81179A4(void)
{
    u8 taskId = CreateTask(sub_81175BC, 0);
    gTasks[taskId].data[0] = 0;
}

void MEvent_CreateTask_Leader(u32 arg0)
{
    u8 taskId;
    struct UnkStruct_Leader * dataPtr;

    taskId = CreateTask(sub_8117A0C, 0);
    sUnionRoomMain.leader = dataPtr = (void*)(gTasks[taskId].data);

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->field_18 = arg0;
    gSpecialVar_Result = 0;
}

static void sub_8117A0C(u8 taskId)
{
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;
    struct WindowTemplate winTemplate;
    s32 val;

    switch (data->state)
    {
    case 0:
        sPlayerCurrActivity = data->field_18;
        sPlayerActivityGroupSize = 2;
        SetHostRFUtgtGname(data->field_18, 0, 0);
        sub_80FAF74(FALSE, FALSE);
        sub_800B1F4();
        OpenLink();
        sub_80FBB8C(2);
        data->state = 1;
        break;
    case 1:
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(5 * sizeof(struct UnkStruct_x20));
        data->field_8 = AllocZeroed(5 * sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 5);
        LinkRfu3_SetGnameUnameFromStaticBuffers(&data->field_0->arr[0].unk.gname, data->field_0->arr[0].unk.playerName);
        data->field_0->arr[0].field_18 = 0;
        data->field_0->arr[0].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
        data->field_0->arr[0].field_1A_1 = 0;
        data->field_0->arr[0].field_1B = 0;
        data->field_17 = sub_811A054(data->field_4, 0xFF);

        winTemplate = gUnknown_8456CFC;
        winTemplate.baseBlock = GetMysteryGiftBaseBlock();
        data->listWindowId = AddWindow(&winTemplate);
        MG_DrawTextBorder(data->listWindowId);
        gMultiuseListMenuTemplate = gUnknown_8456D34;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        CopyBgTilemapBufferToVram(0);
        data->playerCount = 1;
        data->state = 2;
        break;
    case 2:
        StringCopy(gStringVar1, sUnionRoomActivityStringPtrs[sPlayerCurrActivity]);
        StringExpandPlaceholders_AwaitingCommFromAnother(gStringVar4, sPlayerCurrActivity);
        data->state = 3;
        break;
    case 3:
        AddTextPrinterToWindow1(gStringVar4);
        data->state = 4;
        break;
    case 4:
        sub_8116444(data, 5, 6);
        if (JOY_NEW(B_BUTTON))
        {
            data->state = 13;
            DestroyWirelessStatusIndicatorSprite();
        }
        break;
    case 6:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_84577F8))
        {
            data->playerCount = UnionRoomLeaderField0CompactionAndCount(data->field_0);
            RedrawListMenu(data->listTaskId);
            data->state = 2;
        }
        break;
    case 5:
        data->state = 7;
        break;
    case 7:
        switch (mevent_message_print_and_prompt_yes_no(&data->textState, (u16 *)&data->field_14, FALSE, gStringVar4))
        {
        case 0:
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
            data->field_0->arr[data->playerCount].field_1B = 0;
            RedrawListMenu(data->listTaskId);
            data->field_19 = 5;
            sub_80FA670(5, ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].unk.playerName);
            data->state = 8;
            break;
        case 1:
        case -1:
            data->field_19 = 6;
            sub_80FA670(6, ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].unk.playerName);
            data->state = 8;
            break;
        }
        break;
    case 8:
        val = sub_80FA6FC(ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].unk.playerName);
        if (val == 1)
        {
            if (data->field_19 == 5)
            {
                data->field_0->arr[data->playerCount].field_1B = 0;
                RedrawListMenu(data->listTaskId);
                data->playerCount++;
                IntlConvPartnerUname7(gStringVar1, data->field_0->arr[data->playerCount - 1]);
                StringExpandPlaceholders(gStringVar4, gUnknown_8457554);
                data->state = 9;
                sub_80F8F5C();
            }
            else
            {
                sub_80FBD4C(data->field_0->arr[data->playerCount].unk.playerName, ReadAsU16(data->field_0->arr[data->playerCount].unk.gname.unk_00.playerTrainerId));
                data->field_0->arr[data->playerCount].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
                UnionRoomLeaderField0CompactionAndCount(data->field_0);
                RedrawListMenu(data->listTaskId);
                data->state = 2;
            }

            data->field_19 = 0;
        }
        else if (val == 2)
        {
            RfuSetErrorStatus(0, 0);
            data->state = 2;
        }
        break;
    case 9:
        AddTextPrinterToWindow1(gStringVar4);
        data->state = 10;
        break;
    case 10:
        if (++data->field_E > 120)
            data->state = 11;
        break;
    case 11:
        if (!sub_8116444(data, 5, 6))
            data->state = 12;
        break;
    case 12:
        if (sub_80F8F40())
        {
            sub_80F8F7C(FALSE);
            data->state = 15;
        }
        else
        {
            data->state = 6;
        }
        break;
    case 13:
        DestroyWirelessStatusIndicatorSprite();
        sub_80F8DC0();
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->field_17);
        Free(data->field_8);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 14:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_84571B8))
        {
            DestroyTask(taskId);
            gSpecialVar_Result = 5;
        }
        break;
    case 15:
        if (RfuGetErrorStatus() == 1 || RfuGetErrorStatus() == 2)
        {
            data->state = 13;
        }
        else if (gReceivedRemoteLinkPlayers != 0)
        {
            sub_80FAFE0(1);
            data->state++;
        }
        break;
    case 16:
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->field_17);
        Free(data->field_8);
        Free(data->field_0);
        Free(data->field_4);
        sub_800AB9C();
        data->state++;
        break;
    case 17:
        if (IsLinkTaskFinished())
            DestroyTask(taskId);
        break;
    }
}

void MEvent_CreateTask_CardOrNewsWithFriend(u32 arg0)
{
    u8 taskId;
    struct UnkStruct_Group * dataPtr;

    taskId = CreateTask(sub_8117F20, 0);
    sUnionRoomMain.group = dataPtr = (void*)(gTasks[taskId].data);
    sGroup = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->field_12 = arg0 - 21;
    gSpecialVar_Result = 0;
}

static void sub_8117F20(u8 taskId)
{
    s32 id;
    struct WindowTemplate winTemplate1, winTemplate2;
    struct UnkStruct_Group * data = sUnionRoomMain.group;

    switch (data->state)
    {
    case 0:
        SetHostRFUtgtGname(data->field_12 + 0x15, 0, 0);
        sub_800B1F4();
        OpenLink();
        sub_80FBBD8();
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 1;
        break;
    case 1:
        AddTextPrinterToWindow1(gUnknown_8458FE4);
        data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->field_11 = sub_811A054(data->field_4, data->field_12 + 7);

        winTemplate1 = gUnknown_8456D4C;
        winTemplate1.baseBlock = GetMysteryGiftBaseBlock();
        data->listWindowId = AddWindow(&winTemplate1);

        data->field_D = AddWindow(&gUnknown_8456D54);

        MG_DrawTextBorder(data->listWindowId);
        gMultiuseListMenuTemplate = sListMenuTemplate_UnionRoomGroups;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        MG_DrawTextBorder(data->field_D);
        FillWindowPixelBuffer(data->field_D, PIXEL_FILL(1));
        PutWindowTilemap(data->field_D);
        sub_8115924(data->field_D);
        CopyWindowToVram(data->field_D, 2);

        CopyBgTilemapBufferToVram(0);
        data->field_F = 0;
        data->state = 3;
        break;
    case 3:
        id = sub_8116FE4();
        switch (id)
        {
        case 1:
            PlaySE(SE_PC_LOGIN);
        default:
            RedrawListMenu(data->listTaskId);
            break;
        case 0:
            id = ListMenu_ProcessInput(data->listTaskId);
            if (JOY_NEW(A_BUTTON) && id != -1)
            {
                // this unused variable along with the assignment is needed to match
                u32 unusedVar;
                unusedVar  = data->field_0->arr[id].unk.gname.activity;

                if (data->field_0->arr[id].groupScheduledAnim == UNION_ROOM_SPAWN_IN && !data->field_0->arr[id].unk.gname.unk_0a_7)
                {
                    data->field_F = id;
                    LoadWirelessStatusIndicatorSpriteGfx();
                    CreateWirelessStatusIndicatorSprite(0, 0);
                    RedrawListMenu(data->listTaskId);
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[data->field_F]);
                    sub_80FBF54(data->field_0->arr[data->field_F].unk.playerName, ReadAsU16(data->field_0->arr[data->field_F].unk.gname.unk_00.playerTrainerId));
                    PlaySE(SE_PN_ON);
                    data->state = 4;
                }
                else
                {
                    PlaySE(SE_WALL_HIT);
                }
            }
            else if (JOY_NEW(B_BUTTON))
            {
                data->state = 6;
            }
            break;
        }
        break;
    case 4:
        AddTextPrinterToWindow1(gUnknown_8459238);
        IntlConvPartnerUname(gStringVar1, data->field_0->arr[data->field_F]);
        data->state = 5;
        break;
    case 5:
        if (gReceivedRemoteLinkPlayers != 0)
        {
            sPlayerCurrActivity = data->field_0->arr[data->field_F].unk.gname.activity;
            data->state = 10;
        }

        switch (RfuGetErrorStatus())
        {
        case 1:
        case 2:
        case 6:
            data->state = 8;
            break;
        case 5:
            AddTextPrinterToWindow1(gUnknown_84576AC);
            RfuSetErrorStatus(0, 0);
            break;
        }
        break;
    case 6:
    case 8:
    case 10:
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->field_D);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->field_11);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 9:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_8457838[RfuGetErrorStatus()]))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            sub_80F8DC0();
            gSpecialVar_Result = 5;
        }
        break;
    case 7:
        DestroyWirelessStatusIndicatorSprite();
        AddTextPrinterToWindow1(gUnknown_84571B8);
        DestroyTask(taskId);
        sub_80F8DC0();
        gSpecialVar_Result = 5;
        break;
    case 11:
        data->state++;
        sub_800AB9C();
        break;
    case 12:
        if (IsLinkTaskFinished())
            DestroyTask(taskId);
        break;
    }
}

void MEvent_CreateTask_CardOrNewsOverWireless(u32 arg0)
{
    u8 taskId;
    struct UnkStruct_Group * dataPtr;

    taskId = CreateTask(sub_81182DC, 0);
    sUnionRoomMain.group = dataPtr = (void*)(gTasks[taskId].data);
    sGroup = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->field_12 = arg0 - 21;
    gSpecialVar_Result = 0;
}

static void sub_81182DC(u8 taskId)
{
    s32 id;
    struct WindowTemplate winTemplate;
    struct UnkStruct_Group * data = sUnionRoomMain.group;

    switch (data->state)
    {
    case 0:
        SetHostRFUtgtGname(0, 0, 0);
        sub_800B1F4();
        OpenLink();
        sub_80FBBD8();
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 1;
        break;
    case 1:
        AddTextPrinterToWindow1(gUnknown_84591DC);
        data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->field_11 = sub_811A084(data->field_4, data->field_12 + 7);

        if (data->field_13 != 0)
        {
            winTemplate = gUnknown_8456D4C;
            winTemplate.baseBlock = GetMysteryGiftBaseBlock();
            data->listWindowId = AddWindow(&winTemplate);

            MG_DrawTextBorder(data->listWindowId);
            gMultiuseListMenuTemplate = sListMenuTemplate_UnionRoomGroups;
            gMultiuseListMenuTemplate.windowId = data->listWindowId;
            data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

            CopyBgTilemapBufferToVram(0);
        }

        data->field_F = 0;
        data->state = 3;
        break;
    case 3:
        id = sub_8116FE4();
        switch (id)
        {
        case 1:
            PlaySE(SE_PC_LOGIN);
        default:
            if (data->field_13 != 0)
                RedrawListMenu(data->listTaskId);
            break;
        case 0:
            if (data->field_13 != 0)
                id = ListMenu_ProcessInput(data->listTaskId);
            if (data->field_14 > 120)
            {
                if (data->field_0->arr[0].groupScheduledAnim == UNION_ROOM_SPAWN_IN && !data->field_0->arr[0].unk.gname.unk_0a_7)
                {
                    if (sub_8119FB0(&data->field_0->arr[0].unk.gname, data->field_12 + 7))
                    {
                        data->field_F = 0;
                        data->field_14 = 0;
                        LoadWirelessStatusIndicatorSpriteGfx();
                        CreateWirelessStatusIndicatorSprite(0, 0);
                        sub_80FBF54(data->field_0->arr[0].unk.playerName, ReadAsU16(data->field_0->arr[0].unk.gname.unk_00.playerTrainerId));
                        PlaySE(SE_PN_ON);
                        data->state = 4;
                    }
                    else
                    {
                        PlaySE(SE_BOO);
                        data->state = 10;
                    }
                }
            }
            else if (JOY_NEW(B_BUTTON))
            {
                data->state = 6;
                data->field_14 = 0;
            }
            data->field_14++;
            break;
        }
        break;
    case 4:
        AddTextPrinterToWindow1(gUnknown_845928C);
        IntlConvPartnerUname(gStringVar1, data->field_0->arr[data->field_F]);
        data->state = 5;
        break;
    case 5:
        if (gReceivedRemoteLinkPlayers != 0)
        {
            sPlayerCurrActivity = data->field_0->arr[data->field_F].unk.gname.activity;
            data->state = 12;
        }

        switch (RfuGetErrorStatus())
        {
        case 1:
        case 2:
        case 6:
            data->state = 8;
            break;
        case 5:
            AddTextPrinterToWindow1(gUnknown_845777C);
            RfuSetErrorStatus(0, 0);
            break;
        }
        break;
    case 6:
    case 8:
    case 10:
    case 12:
        if (data->field_13 != 0)
        {
            DestroyListMenuTask(data->listTaskId, 0, 0);
            CopyBgTilemapBufferToVram(0);
            RemoveWindow(data->listWindowId);
        }
        DestroyTask(data->field_11);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 9:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_84577BC))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            sub_80F8DC0();
            gSpecialVar_Result = 5;
        }
        break;
    case 7:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_84571E0))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            sub_80F8DC0();
            gSpecialVar_Result = 5;
        }
        break;
    case 11:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_845933C[data->field_12]))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            sub_80F8DC0();
            gSpecialVar_Result = 5;
        }
        break;
    case 13:
        data->state++;
        sub_800AB9C();
        break;
    case 14:
        if (IsLinkTaskFinished())
            DestroyTask(taskId);
        break;
    }
}

void UnionRoomSpecial(void)
{
    struct UnkStruct_URoom * dataPtr;

    ClearAndInitHostRFUtgtGname();
    CreateTask(Task_ResumeUnionRoom, 10);

    // dumb line needed to match
    sUnionRoomMain.uRoom = sUnionRoomMain.uRoom;

    dataPtr = AllocZeroed(sizeof(*sUnionRoomMain.uRoom));
    sUnionRoomMain.uRoom = dataPtr;
    sURoom = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->field_10 = 0;
    dataPtr->field_12 = 0;

    gSpecialVar_Result = 0;
    sub_8107D38(0xD0, 1);
}

static u16 ReadAsU16(const u8 *ptr)
{
    return (ptr[1] << 8) | (ptr[0]);
}

static void sub_8118664(u32 nextState, const u8 *src)
{
    struct UnkStruct_URoom * data = sUnionRoomMain.uRoom;

    data->state = 8;
    data->stateAfterPrint = nextState;
    if (src != gStringVar4)
        StringExpandPlaceholders(gStringVar4, src);
}

static void sub_811868C(const u8 *src)
{
    struct UnkStruct_URoom * data = sUnionRoomMain.uRoom;

    data->state = 26;
    if (src != gStringVar4)
        StringExpandPlaceholders(gStringVar4, src);
}

static void sub_81186B0(struct UnkStruct_URoom * data)
{
    memcpy(&gDecompressionBuffer[0x3F00], data->field_0, 8 * sizeof(struct UnkStruct_x20));
}

static void sub_81186C8(struct UnkStruct_URoom * data)
{
    memcpy(data->field_0, &gDecompressionBuffer[0x3F00], 8 * sizeof(struct UnkStruct_x20));
}

static void Task_ResumeUnionRoom(u8 taskId)
{
    u32 id = 0;
    s32 var5 = 0;
    s32 playerGender = MALE;
    struct UnkStruct_URoom * data = sUnionRoomMain.uRoom;
    s16 *taskData = gTasks[taskId].data;

    switch (data->state)
    {
    case 0:
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_C = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(8 * sizeof(struct UnkStruct_x20));
        data->field_8 = AllocZeroed(sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x20Array(data->field_0->arr, 8);
        sPlayerCurrActivity = 0x40;
        data->field_20 = sub_8119E84(data->field_C, data->field_4, 9);
        ZeroUnionObjWork(data->unionObjs);
        MakeGroupAssemblyAreasPassable();
        data->state = 1;
        break;
    case 1:
        CreateGroupMemberObjectsInvisible(data->spriteIds, taskData[0]);
        if (++taskData[0] == 8)
            data->state = 2;
        break;
    case 2:
        SetHostRFUtgtGname(0x40, 0, 0);
        sub_80FAFA0(sUnionRoomTrade.type, sUnionRoomTrade.playerSpecies, sUnionRoomTrade.playerLevel);
        sub_800B1F4();
        OpenLink();
        sub_80FBC00();
        BlankUnkStruct_x20Array(&data->field_8->arr[0], 1);
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x1CArray(data->field_C->arr, 4);
        gSpecialVar_Result = 0;
        data->state = 3;
        break;
    case 3:
        if ((GetPartyMenuType() == PARTY_MENU_TYPE_UNION_ROOM_REGISTER
             || GetPartyMenuType() == PARTY_MENU_TYPE_UNION_ROOM_TRADE)
            && sUnionRoomTrade.field_0 != 0)
        {
            id = GetCursorSelectionMonId();
            switch (sUnionRoomTrade.field_0)
            {
            case 1:
                sub_80FB008(0x14 | 0x40, 0, 1);
                if (id >= PARTY_SIZE)
                {
                    ResetUnionRoomTrade(&sUnionRoomTrade);
                    sub_80FAFA0(0, 0, 0);
                    sub_811868C(gUnknown_8458D54);
                }
                else if (!RegisterTradeMonAndGetIsEgg(GetCursorSelectionMonId(), &sUnionRoomTrade))
                {
                    sub_8118664(0x34, gUnknown_8458CD4);
                }
                else
                {
                    data->state = 55;
                }
                break;
            case 2:
                sub_81186C8(data);
                taskData[1] = sUnionRoomTrade.field_8;
                if (id >= PARTY_SIZE)
                {
                    sub_811868C(gUnknown_8458D9C);
                }
                else
                {
                    sub_80FB008(0x14 | 0x40, 0, 1);
                    sPlayerCurrActivity = UROOM_ACTIVITY_TRADE | 0x40;
                    RegisterTradeMon(GetCursorSelectionMonId(), &sUnionRoomTrade);
                    data->state = 51;
                }
                break;
            }
            sUnionRoomTrade.field_0 = 0;
        }
        else
        {
            data->state = 4;
        }
        break;
    case 4:
        if (gSpecialVar_Result != 0)
        {
            if (gSpecialVar_Result == 9)
            {
                sub_80FB008(0x14 | 0x40, 0, 1);
                PlaySE(SE_PC_LOGIN);
                StringCopy(gStringVar1, gSaveBlock2Ptr->playerName);
                data->state = 42;
                gSpecialVar_Result = 0;
            }
            else if (gSpecialVar_Result == 11)
            {
                sub_80FB008(0x14 | 0x40, 0, 1);
                data->state = 23;
                gSpecialVar_Result = 0;
            }
            else
            {
                taskData[0] = 0;
                taskData[1] = gSpecialVar_Result - 1;
                data->state = 24;
                gSpecialVar_Result = 0;
            }
        }
        else if (ScriptContext2_IsEnabled() != TRUE)
        {
            if (JOY_NEW(A_BUTTON))
            {
                if (RfuUnionTool_GetGroupAndMemberInFrontOfPlayer(data->field_0, &taskData[0], &taskData[1], data->spriteIds))
                {
                    PlaySE(SE_SELECT);
                    sub_811B298();
                    data->state = 24;
                    break;
                }
                else if (PlayerIsTalkingToUnionRoomAide())
                {
                    sub_80FB008(0x14 | 0x40, 0, 1);
                    PlaySE(SE_PC_LOGIN);
                    sub_811B298();
                    StringCopy(gStringVar1, gSaveBlock2Ptr->playerName);
                    data->state = 45;
                    break;
                }
            }

            switch (sub_8119B94())
            {
            case 1:
                PlaySE(SE_TOY_C);
            case 2:
                ScheduleUnionRoomPlayerRefresh(data);
                break;
            case 4:
                data->state = 11;
                sub_811B298();
                sub_80FAFA0(0, 0, 0);
                sub_80FB008(0x13 | 0x40, sub_811B2D8(data), 0);
                break;
            }
            HandleUnionRoomPlayerRefresh(data);
        }
        break;
    case 23:
        if (!FuncIsActiveTask(Task_StartMenuHandleInput))
        {
            sub_80FB008(0x40, 0, 0);
            data->state = 4;
        }
        break;
    case 24:
        UR_RunTextPrinters_CheckPrinter0Active();
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        sub_80FB008(0x14 | 0x40, 0, 1);
        switch (sub_811AA5C(data->field_0, taskData[0], taskData[1], playerGender))
        {
        case 0:
            data->state = 26;
            break;
        case 1:
            sub_80FC114(data->field_0->arr[taskData[1]].unk.playerName, &data->field_0->arr[taskData[1]].unk.gname, sPlayerCurrActivity);
            data->field_12 = id; // Should be just 0, but won't match any other way.
            data->state = 25;
            break;
        case 2:
            sub_8118664(0x13, gStringVar4);
            break;
        }
        break;
    case 25:
        UR_RunTextPrinters_CheckPrinter0Active();
        switch (RfuGetErrorStatus())
        {
        case 4:
            sub_811B258(TRUE);
            data->state = 4;
            break;
        case 1:
        case 2:
            if (sub_80FBB0C() == TRUE)
                sub_811868C(gUnknown_8457F90);
            else
                sub_8118664(30, gUnknown_8457F90);

            sPlayerCurrActivity = 0x40;
            break;
        }

        if (gReceivedRemoteLinkPlayers != 0)
        {
            sub_8117594(gBlockSendBuffer, TRUE);
            CreateTask(sub_8117280, 5);
            data->state = 38;
        }
        break;
    case 38:
        if (!FuncIsActiveTask(sub_8117280))
        {
            if (sPlayerCurrActivity == (UROOM_ACTIVITY_TRADE | 0x40))
                sub_8118664(31, gUnknown_84578BC);
            else
                data->state = 5;
        }
        break;
    case 30:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            sub_811B258(FALSE);
            UpdateUnionGroupMemberFacing(taskData[0], taskData[1], data->field_0);
            data->state = 2;
        }
        break;
    case 5:
        id = sub_811AA24(&data->field_0->arr[taskData[1]]);
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        sub_8118664(6, gUnknown_8457B04[id][playerGender]);
        break;
    case 6:
        var5 = ListMenuHandler_AllItemsAvailable(&data->textState, &data->topListMenuWindowId, &data->topListMenuListMenuId, &sWindowTemplate_InviteToActivity, &sListMenuTemplate_InviteToActivity);
        if (var5 != -1)
        {
            if (gReceivedRemoteLinkPlayers == 0)
            {
                data->state = 28;
            }
            else
            {
                data->partnerYesNoResponse = 0;
                playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
                if (var5 == -2 || var5 == 0x40)
                {
                    data->playerSendBuffer[0] = 0x40;
                    sub_80F9E2C(data->playerSendBuffer);
                    StringCopy(gStringVar4, gUnknown_845842C[gLinkPlayers[0].gender]);
                    data->state = 32;
                }
                else
                {
                    sPlayerCurrActivity = var5;
                    sPlayerActivityGroupSize = (u32)(var5) >> 8;
                    if (sPlayerCurrActivity == (UROOM_ACTIVITY_BATTLE | 0x40) && !HasAtLeastTwoMonsOfLevel30OrLower())
                    {
                        sub_8118664(5, gUnknown_845847C);
                    }
                    else
                    {
                        data->playerSendBuffer[0] = sPlayerCurrActivity | 0x40;
                        sub_80F9E2C(data->playerSendBuffer);
                        data->state = 27;
                    }
                }
            }
        }
        break;
    case 28:
        StringCopy(gStringVar4, gUnknown_8458434);
        data->state = 36;
        break;
    case 27:
        PollPartnerYesNoResponse(data);
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        id = GetResponseIdx_InviteToURoomActivity(data->playerSendBuffer[0] & 0x3F);
        if (PrintOnTextbox(&data->textState, gResponseToURoomActivityInviteStringPtrs[playerGender][id]))
        {
            taskData[3] = 0;
            data->state = 29;
        }
        break;
    case 32:
        sub_800AAC0();
        data->state = 36;
        break;
    case 31:
        data->playerSendBuffer[0] = UROOM_ACTIVITY_TRADE | 0x40;
        data->playerSendBuffer[1] = sUnionRoomTrade.species;
        data->playerSendBuffer[2] = sUnionRoomTrade.level;
        sub_80F9E2C(data->playerSendBuffer);
        data->state = 29;
        break;
    case 29:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            StringCopy(gStringVar4, gUnknown_8458434);
            data->state = 28;
        }
        else
        {
            PollPartnerYesNoResponse(data);
            if (data->partnerYesNoResponse == (UROOM_ACTIVITY_ACCEPT | 0x40))
            {
                if (sPlayerCurrActivity == UROOM_ACTIVITY_CARD)
                {
                    ViewURoomPartnerTrainerCard(gStringVar4, data, FALSE);
                    data->state = 40;
                }
                else
                {
                    data->state = 13;
                }
            }
            else if (data->partnerYesNoResponse == (UROOM_ACTIVITY_DECLINE | 0x40))
            {
                data->state = 32;
                GetURoomActivityRejectMsg(gStringVar4, sPlayerCurrActivity | 0x40, gLinkPlayers[0].gender);
                sPlayerCurrActivity = 0;
            }
        }
        break;

    case 7:
        id = sub_811AA24(&data->field_0->arr[taskData[1]]);
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        sub_8118664(6, gUnknown_8457B04[id][playerGender]);
        break;
    case 40:
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            data->state = 41;
            sub_800AB9C();
            data->partnerYesNoResponse = 0;
            data->recvActivityRequest[0] = 0;
        }
        break;
    case 41:
        if (IsLinkTaskFinished())
        {
            if (GetMultiplayerId() == 0)
            {
                StringCopy(gStringVar1, gLinkPlayers[GetMultiplayerId() ^ 1].name);
                id = PlayerHasMetTrainerBefore(gLinkPlayers[1].trainerId, gLinkPlayers[1].name);
                StringExpandPlaceholders(gStringVar4, gUnknown_8457C20[id]);
                data->state = 33;
            }
            else
            {
                data->state = 7;
            }
        }
        break;
    case 19:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            CopyBgTilemapBufferToVram(0);
            sPlayerCurrActivity = UROOM_ACTIVITY_CHAT | 0x40;
            sub_80FB008(UROOM_ACTIVITY_CHAT | 0x40, 0, 1);
            sub_80FC114(data->field_0->arr[taskData[1]].unk.playerName, &data->field_0->arr[taskData[1]].unk.gname, sPlayerCurrActivity);
            data->field_12 = taskData[1];
            data->state = 20;
            taskData[3] = 0;
            break;
        case 1:
        case -1:
            playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
            sub_811868C(gUnknown_8458548[playerGender]);
            break;
        }
        break;
    case 20:
        if (++taskData[2] > 60)
        {
            data->state = 21;
            taskData[2] = 0;
        }
        break;
    case 21:
        switch (RfuGetErrorStatus())
        {
        case 4:
            sub_811B258(TRUE);
            data->state = 4;
            break;
        case 1:
        case 2:
            playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
            sub_80FB008(0x14 | 0x40, 0, 1);
            if (sub_80FBB0C() == TRUE)
                sub_811868C(gUnknown_84585E8[playerGender]);
            else
                sub_8118664(30, gUnknown_84585E8[playerGender]);
            break;
        case 3:
            data->state = 22;
            break;
        }
        taskData[3]++;
        break;
    case 22:
        if (RfuIsErrorStatus1or2())
        {
            playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
            sub_80FB008(0x14 | 0x40, 0, 1);
            if (sub_80FBB0C() == TRUE)
                sub_811868C(gUnknown_84585E8[playerGender]);
            else
                sub_8118664(30, gUnknown_84585E8[playerGender]);
        }
        if (gReceivedRemoteLinkPlayers != 0)
            data->state = 16;
        break;
    case 11:
        PlaySE(SE_PINPON);
        sub_80F8FA0();
        data->state = 12;
        data->recvActivityRequest[0] = 0;
        break;
    case 12:
        if (RfuIsErrorStatus1or2())
        {
            sub_811B258(FALSE);
            data->state = 2;
        }
        else if (gReceivedRemoteLinkPlayers != 0)
        {
            sub_8117594(gBlockSendBuffer, TRUE);
            CreateTask(sub_8117280, 5);
            data->state = 39;
        }
        break;
    case 39:
        ReceiveUnionRoomActivityPacket(data);
        if (!FuncIsActiveTask(sub_8117280))
        {
            data->state = 33;
            StringCopy(gStringVar1, gLinkPlayers[1].name);
            id = PlayerHasMetTrainerBefore(gLinkPlayers[1].trainerId, gLinkPlayers[1].name);
            StringExpandPlaceholders(gStringVar4, gUnknown_8457BCC[id]);
        }
        break;
    case 33:
        ReceiveUnionRoomActivityPacket(data);
        if (PrintOnTextbox(&data->textState, gStringVar4))
            data->state = 34;
        break;
    case 34:
        ReceiveUnionRoomActivityPacket(data);
        if (sub_8119944(data) && JOY_NEW(B_BUTTON))
        {
            sub_80FBD6C(1);
            StringCopy(gStringVar4, gUnknown_8457E60);
            data->state = 36;
        }
        break;
    case 35:
        sub_8118664(9, gStringVar4);
        break;
    case 9:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            data->playerSendBuffer[0] = UROOM_ACTIVITY_ACCEPT | 0x40;
            if (sPlayerCurrActivity == (UROOM_ACTIVITY_CHAT | 0x40))
                sub_80FB008(sPlayerCurrActivity | 0x40, sub_811B2A8(1), 0);
            else
                sub_80FB008(sPlayerCurrActivity | 0x40, sub_811B2A8(1), 1);

            data->field_8->arr[0].field_1B = 0;
            taskData[3] = 0;
            if (sPlayerCurrActivity == (UROOM_ACTIVITY_BATTLE | 0x40))
            {
                if (!HasAtLeastTwoMonsOfLevel30OrLower())
                {
                    data->playerSendBuffer[0] = UROOM_ACTIVITY_DECLINE | 0x40;
                    sub_80F9E2C(data->playerSendBuffer);
                    data->state = 10;
                    StringCopy(gStringVar4, gUnknown_84584C0);
                }
                else
                {
                    sub_80F9E2C(data->playerSendBuffer);
                    data->state = 13;
                }
            }
            else if (sPlayerCurrActivity == (UROOM_ACTIVITY_CARD | 0x40))
            {
                sub_80F9E2C(data->playerSendBuffer);
                ViewURoomPartnerTrainerCard(gStringVar4, data, 1);
                data->state = 40;
            }
            else
            {
                sub_80F9E2C(data->playerSendBuffer);
                data->state = 13;
            }
            break;
        case 1:
        case -1:
            data->playerSendBuffer[0] = UROOM_ACTIVITY_DECLINE | 0x40;
            sub_80F9E2C(data->playerSendBuffer);
            data->state = 10;
            sub_81162E0(gStringVar4, sPlayerCurrActivity);
            break;
        }
        break;
    case 10:
        sub_800AAC0();
        data->state = 36;
        break;
    case 36:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            sPlayerCurrActivity = 0x40;
            sub_8118664(37, gStringVar4);
            memset(data->playerSendBuffer, 0, sizeof(data->playerSendBuffer));
            data->recvActivityRequest[0] = 0;
            data->partnerYesNoResponse = 0;
        }
        break;
    case 37:
        data->state = 2;
        sub_811B258(FALSE);
        break;
    case 13:
        GetURoomActivityStartMsg(gStringVar4, sPlayerCurrActivity | 0x40);
        sub_8118664(14, gStringVar4);
        break;
    case 14:
        sub_800AB9C();
        data->state = 15;
        break;
    case 15:
        if (IsLinkTaskFinished())
            data->state = 16;
        break;
    case 16:
        Free(data->field_8);
        Free(data->field_0);
        Free(data->field_C);
        Free(data->field_4);
        DestroyTask(data->field_20);
        DestroyGroupMemberObjects(data->spriteIds);
        data->state = 17;
        break;
    case 17:
        BeginNormalPaletteFade(-1, 0, 0, 0x10, RGB_BLACK);
        data->state = 18;
        break;
    case 18:
        if (!UpdatePaletteFade())
        {
            DeleteUnionObjWorkAndStopTask();
            DestroyTask(taskId);
            Free(sUnionRoomMain.uRoom);
            sub_81179A4();
        }
        break;
    case 42:
        if (GetHostRFUtgtGname()->species == SPECIES_NONE)
        {
            data->state = 43;
        }
        else
        {
            if (GetHostRFUtgtGname()->species == SPECIES_EGG)
            {
                StringCopy(gStringVar4, gUnknown_8458DE8);
            }
            else
            {
                StringCopy(gStringVar1, gSpeciesNames[GetHostRFUtgtGname()->species]);
                ConvertIntToDecimalStringN(gStringVar2, GetHostRFUtgtGname()->level, STR_CONV_MODE_LEFT_ALIGN, 3);
                StringExpandPlaceholders(gStringVar4, gUnknown_8458DBC);
            }
            sub_8118664(44, gStringVar4);
        }
        break;
    case 43:
        if (PrintOnTextbox(&data->textState, gUnknown_8458AB8))
            data->state = 47;
        break;
    case 47:
        var5 = ListMenuHandler_AllItemsAvailable(&data->textState, &data->tradeBoardSelectWindowId, &data->tradeBoardDetailsWindowId, &sWindowTemplate_TradeBoardRegisterInfoExit, &sListMenuTemplate_TradeBoardRegisterInfoExit);
        if (var5 != -1)
        {
            if (var5 == -2 || var5 == 3)
            {
                data->state = 4;
                sub_811B258(TRUE);
            }
            else
            {
                switch (var5)
                {
                case 1: // REGISTER
                    sub_8118664(53, gUnknown_8458D1C);
                    break;
                case 2: // INFO
                    sub_8118664(47, gUnknown_8458B44);
                    break;
                }
            }
            DestroyHelpMessageWindow_();
        }
        break;
    case 53:
        BeginNormalPaletteFade(-1, 0, 0, 0x10, RGB_BLACK);
        data->state = 54;
        break;
    case 54:
        if (!gPaletteFade.active)
        {
            sUnionRoomTrade.field_0 = 1;
            gFieldCallback = sub_807DCE4;
            ChooseMonForTradingBoard(PARTY_MENU_TYPE_UNION_ROOM_REGISTER, CB2_ReturnToField);
        }
        break;
    case 52:
        var5 = ListMenuHandler_AllItemsAvailable(&data->textState, &data->tradeBoardSelectWindowId, &data->tradeBoardDetailsWindowId, &sWindowTemplate_TypeNames, &sListMenuTemplate_TypeNames);
        if (var5 != -1)
        {
            switch (var5)
            {
            case -2:
            case 18:
                ResetUnionRoomTrade(&sUnionRoomTrade);
                sub_80FAFA0(0, 0, 0);
                sub_811868C(gUnknown_8458D54);
                break;
            default:
                sUnionRoomTrade.type = var5;
                data->state = 55;
                break;
            }
        }
        break;
    case 55:
        sub_80FAFA0(sUnionRoomTrade.type, sUnionRoomTrade.playerSpecies, sUnionRoomTrade.playerLevel);
        sub_811868C(gUnknown_8458D78);
        break;
    case 44:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            data->state = 56;
            break;
        case 1:
        case -1:
            sub_811B258(TRUE);
            data->state = 4;
            break;
        }
        break;
    case 56:
        if (PrintOnTextbox(&data->textState, gUnknown_8458E10))
        {
            sub_80FAFA0(0, 0, 0);
            ResetUnionRoomTrade(&sUnionRoomTrade);
            sub_811B258(TRUE);
            data->state = 4;
        }
        break;
    case 45:
        if (PrintOnTextbox(&data->textState, gUnknown_8458A98))
            data->state = 46;
        break;
    case 46:
        sub_811A3F8();
        data->state = 48;
        break;
    case 48:
        var5 = TradeBoardMenuHandler(&data->textState, &data->tradeBoardSelectWindowId, &data->tradeBoardListMenuId, &data->tradeBoardDetailsWindowId, &gUnknown_8456F24, &sTradeBoardListMenuTemplate, data->field_0);
        if (var5 != -1)
        {
            switch (var5)
            {
            case -2:
            case 8:
                sub_811B258(TRUE);
                DestroyHelpMessageWindow_();
                data->state = 4;
                break;
            default:
                switch (IsRequestedTypeAndSpeciesInPlayerParty(data->field_0->arr[var5].unk.gname.type, data->field_0->arr[var5].unk.gname.species))
                {
                case UR_TRADE_MATCH:
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[var5]);
                    sub_8118664(49, gUnknown_8458E70);
                    taskData[1] = var5;
                    break;
                case UR_TRADE_NOTYPE:
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[var5]);
                    StringCopy(gStringVar2, gTypeNames[data->field_0->arr[var5].unk.gname.type]);
                    sub_8118664(46, gUnknown_8458ED0);
                    break;
                case UR_TRADE_NOEGG:
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[var5]);
                    StringCopy(gStringVar2, gTypeNames[data->field_0->arr[var5].unk.gname.type]);
                    sub_8118664(46, gUnknown_8458F04);
                    break;
                }
                break;
            }
        }
        break;
    case 49:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            data->state = 50;
            break;
        case -1:
        case 1:
            sub_811B258(TRUE);
            data->state = 4;
            break;
        }
        break;
    case 50:
        if (PrintOnTextbox(&data->textState, gUnknown_8458D1C))
        {
            sUnionRoomTrade.field_0 = 2;
            memcpy(&gUnknown_203B064, &data->field_0->arr[taskData[1]].unk.gname.unk_00, sizeof(gUnknown_203B064));
            gUnionRoomRequestedMonType = data->field_0->arr[taskData[1]].unk.gname.type;
            gUnionRoomOfferedSpecies = data->field_0->arr[taskData[1]].unk.gname.species;
            gFieldCallback = sub_807DCE4;
            ChooseMonForTradingBoard(PARTY_MENU_TYPE_UNION_ROOM_TRADE, CB2_ReturnToField);
            sub_81186B0(data);
            sUnionRoomTrade.field_8 = taskData[1];
        }
        break;
    case 51:
        sPlayerCurrActivity = UROOM_ACTIVITY_TRADE | 0x40;
        sub_80FC114(data->field_0->arr[taskData[1]].unk.playerName, &data->field_0->arr[taskData[1]].unk.gname, UROOM_ACTIVITY_TRADE | 0x40);
        IntlConvPartnerUname(gStringVar1, data->field_0->arr[taskData[1]]);
        UR_PrintFieldMessage(gUnknown_8457A34[2]);
        data->state = 25;
        break;
    case 26:
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            sub_811B258(TRUE);
            UpdateUnionGroupMemberFacing(taskData[0], taskData[1], data->field_0);
            data->state = 4;
        }
        break;
    case 8:
        if (PrintOnTextbox(&data->textState, gStringVar4))
            data->state = data->stateAfterPrint;
        break;
    }
}

void var_800D_set_xB(void)
{
    if (InUnionRoom() == TRUE)
        gSpecialVar_Result = 11;
}

static void ReceiveUnionRoomActivityPacket(struct UnkStruct_URoom * arg0)
{
    if (gRecvCmds[1][1] != 0 && (gRecvCmds[1][0] & 0xFF00) == 0x2F00)
    {
        arg0->recvActivityRequest[0] = gRecvCmds[1][1];
        if (gRecvCmds[1][1] == (UROOM_ACTIVITY_TRADE | 0x40))
        {
            arg0->recvActivityRequest[1] = gRecvCmds[1][2];
            arg0->recvActivityRequest[2] = gRecvCmds[1][3];
        }
    }
}

static bool32 sub_8119944(struct UnkStruct_URoom * arg0)
{
    if (arg0->recvActivityRequest[0] != 0)
    {
        s32 var = GetChatLeaderActionRequestMessage(gStringVar4, gLinkPlayers[1].gender, &arg0->recvActivityRequest[0], arg0);
        if (var == 0)
        {
            return TRUE;
        }
        else if (var == 1)
        {
            arg0->state = 35;
            sPlayerCurrActivity = arg0->recvActivityRequest[0];
            return FALSE;
        }
        else if (var == 2)
        {
            arg0->state = 36;
            sub_800AAC0();
            return FALSE;
        }
    }

    return TRUE;
}

void InitUnionRoom(void)
{
    struct UnkStruct_URoom * ptr;

    sUnionRoomPlayerName[0] = EOS;
    if (gQuestLogState == 2 || gQuestLogState == 3)
        return;
    CreateTask(Task_InitUnionRoom, 0);
    sUnionRoomMain.uRoom = sUnionRoomMain.uRoom; // Needed to match.
    sUnionRoomMain.uRoom = ptr = AllocZeroed(sizeof(struct UnkStruct_URoom));
    sURoom = sUnionRoomMain.uRoom;
    ptr->state = 0;
    ptr->textState = 0;
    ptr->field_10 = 0;
    ptr->field_12 = 0;
    sUnionRoomPlayerName[0] = EOS;
}

static void Task_InitUnionRoom(u8 taskId)
{
    s32 i;
    u8 text[32];
    struct UnkStruct_URoom * structPtr = sUnionRoomMain.uRoom;

    switch (structPtr->state)
    {
    case 0:
        structPtr->state = 1;
        break;
    case 1:
        SetHostRFUtgtGname(0xC, 0, 0);
        sub_800B1F4();
        OpenLink();
        sub_80FBC00();
        sub_80FB128(1);
        structPtr->state = 2;
        break;
    case 2:
        structPtr->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        BlankUnkStruct_x1CArray(structPtr->field_4->arr, 4);
        structPtr->field_C = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        BlankUnkStruct_x1CArray(structPtr->field_C->arr, 4);
        structPtr->field_0 = AllocZeroed(8 * sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x20Array(structPtr->field_0->arr, 8);
        structPtr->field_8 = AllocZeroed(sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x20Array(&structPtr->field_8->arr[0], 1);
        structPtr->field_20 = sub_8119E84(structPtr->field_C, structPtr->field_4, 10);
        structPtr->state = 3;
        break;
    case 3:
        switch (sub_8119B94())
        {
        case 1:
        case 2:
            if (sUnionRoomPlayerName[0] == EOS)
            {
                for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++)
                {
                    if (structPtr->field_0->arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
                    {
                        IntlConvPartnerUname(text, structPtr->field_0->arr[i]);
                        if (PlayerHasMetTrainerBefore(ReadAsU16(structPtr->field_0->arr[i].unk.gname.unk_00.playerTrainerId), text))
                        {
                            StringCopy(sUnionRoomPlayerName, text);
                            break;
                        }
                    }
                }
            }
            break;
        case 3:
            break;
        }
        break;
    case 4:
        Free(structPtr->field_8);
        Free(structPtr->field_0);
        Free(structPtr->field_C);
        Free(structPtr->field_4);
        DestroyTask(structPtr->field_20);
        Free(sUnionRoomMain.uRoom);
        sub_80F8DC0();
        DestroyTask(taskId);
        break;
    }
}

bool16 BufferUnionRoomPlayerName(void)
{
    if (sUnionRoomPlayerName[0] != EOS)
    {
        StringCopy(gStringVar1, sUnionRoomPlayerName);
        sUnionRoomPlayerName[0] = EOS;
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static u8 sub_8119B94(void)
{
    s32 i;
    u8 j;
    struct UnkStruct_URoom * structPtr = sUnionRoomMain.uRoom;
    s32 r7 = 0;

    for (i = 0; i < 4; i++)
    {
        if (AreUnkSharedObjectsDifferent(&structPtr->field_C->arr[i].unk0, &sUnkStruct_Shared_Dummy) == TRUE)
        {
            structPtr->field_8->arr[0].unk = structPtr->field_C->arr[i].unk0;
            structPtr->field_8->arr[0].field_18 = 0;
            structPtr->field_8->arr[0].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
            structPtr->field_8->arr[0].field_1B = 1;
            return 4;
        }
    }
    for (j = 0; j < 8; j++)
    {
        if (structPtr->field_0->arr[j].groupScheduledAnim != UNION_ROOM_SPAWN_NONE)
        {
            i = sub_811A748(&structPtr->field_0->arr[j], &structPtr->field_4->arr[0]);
            if (i != 0xFF)
            {
                if (structPtr->field_0->arr[j].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
                {
                    if (AreUnionRoomPlayerGnamesDifferent(&structPtr->field_0->arr[j].unk, &structPtr->field_4->arr[i].unk0))
                    {
                        structPtr->field_0->arr[j].unk = structPtr->field_4->arr[i].unk0;
                        structPtr->field_0->arr[j].field_1B = 0x40;
                        r7 = 1;
                    }
                    else if (structPtr->field_0->arr[j].field_1B != 0)
                    {
                        structPtr->field_0->arr[j].field_1B--;
                        if (structPtr->field_0->arr[j].field_1B == 0)
                            r7 = 2;
                    }
                }
                else
                {
                    structPtr->field_0->arr[j].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
                    structPtr->field_0->arr[j].field_1B = 0;
                    r7 = 2;
                }
                structPtr->field_0->arr[j].field_18 = 0;
            }
            else if (structPtr->field_0->arr[j].groupScheduledAnim != UNION_ROOM_SPAWN_OUT)
            {
                structPtr->field_0->arr[j].field_18++;
                if (structPtr->field_0->arr[j].field_18 >= 600)
                {
                    structPtr->field_0->arr[j].groupScheduledAnim = UNION_ROOM_SPAWN_OUT;
                    r7 = 2;
                }
            }
            else if (structPtr->field_0->arr[j].groupScheduledAnim == UNION_ROOM_SPAWN_OUT)
            {
                structPtr->field_0->arr[j].field_18++;
                if (structPtr->field_0->arr[j].field_18 >= 900)
                {
                    BlankUnkStruct_x20Array(&structPtr->field_0->arr[j], 1);
                }
            }
        }
    }
    for (i = 0; i < 4; i++)
    {
        if (Appendx1Ctox20(&structPtr->field_0->arr[0], &structPtr->field_4->arr[i], 8) != 0xFF)
            r7 = 1;
    }

    return r7;
}

static void sub_8119D34(u8 taskId)
{
    s32 i, j;
    struct UnkStruct_Shared sp0;
    struct UnkStruct_Main4 ** ptr = (void*) gTasks[taskId].data;
    bool8 parent_child;

    for (i = 0; i < 4; i++)
    {
        parent_child = sub_80FCC3C(&sp0.gname, sp0.playerName, i);
        if (!IsPartnerActivityAcceptable(sp0.gname.activity, gTasks[taskId].data[4]))
        {
            sp0 = sUnkStruct_Shared_Dummy;
        }
        if (sp0.gname.unk_00.unk_00_0 == 1)
        {
            sp0 = sUnkStruct_Shared_Dummy;
        }
        if (!parent_child)
        {
            for (j = 0; j < i; j++)
            {
                if (!AreUnkSharedObjectsDifferent(&ptr[1]->arr[j].unk0, &sp0))
                {
                    sp0 = sUnkStruct_Shared_Dummy;
                }
            }
            ptr[1]->arr[i].unk0 = sp0;
            ptr[1]->arr[i].unk18 = AreUnkSharedObjectsDifferent(&ptr[1]->arr[i].unk0, &sUnkStruct_Shared_Dummy);
        }
        else
        {
            ptr[0]->arr[i].unk0 = sp0;
            ptr[0]->arr[i].unk18 = AreUnkSharedObjectsDifferent(&ptr[0]->arr[i].unk0, &sUnkStruct_Shared_Dummy);
        }
    }
}

static u8 sub_8119E84(struct UnkStruct_Main4 * a0, struct UnkStruct_Main4 * a1, u32 a2)
{
    u8 taskId = CreateTask(sub_8119D34, 0);
    struct UnkStruct_Main4 ** data = (void *)gTasks[taskId].data;
    data[0] = a0;
    data[1] = a1;
    gTasks[taskId].data[4] = a2;
    return taskId;
}

static void sub_8119EB8(u8 taskId)
{
    s32 i, j;
    struct UnkStruct_Main4 ** ptr = (void*) gTasks[taskId].data;

    for (i = 0; i < 4; i++)
    {
        sub_80FCC3C(&ptr[0]->arr[i].unk0.gname, ptr[0]->arr[i].unk0.playerName, i);
        if (!IsPartnerActivityAcceptable(ptr[0]->arr[i].unk0.gname.activity, gTasks[taskId].data[2]))
        {
            ptr[0]->arr[i].unk0 = sUnkStruct_Shared_Dummy;
        }
        for (j = 0; j < i; j++)
        {
            if (!AreUnkSharedObjectsDifferent(&ptr[0]->arr[j].unk0, &ptr[0]->arr[i].unk0))
            {
                ptr[0]->arr[i].unk0 = sUnkStruct_Shared_Dummy;
            }
        }
        ptr[0]->arr[i].unk18 = AreUnkSharedObjectsDifferent(&ptr[0]->arr[i].unk0, &sUnkStruct_Shared_Dummy);
    }
}

static bool32 sub_8119FB0(struct GFtgtGname * arg0, s16 arg1)
{
    if (arg1 == 7)
    {
        if (!arg0->unk_00.unk_00_5)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    else if (arg1 == 8)
    {
        if (!arg0->unk_00.unk_00_4)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    else
    {
        return FALSE;
    }
}

static void sub_8119FD8(u8 taskId)
{
    s32 i;
    struct UnkStruct_Main4 ** ptr = (void*) gTasks[taskId].data;

    for (i = 0; i < 4; i++)
    {
        if (sub_80FCCF4(&ptr[0]->arr[i].unk0.gname, ptr[0]->arr[i].unk0.playerName, i))
        {
            sub_8119FB0(&ptr[0]->arr[i].unk0.gname, gTasks[taskId].data[2]);
        }
        ptr[0]->arr[i].unk18 = AreUnkSharedObjectsDifferent(&ptr[0]->arr[i].unk0, &sUnkStruct_Shared_Dummy);
    }
}

static u8 sub_811A054(struct UnkStruct_Main4 * a0, u32 a1)
{
    u8 taskId = CreateTask(sub_8119EB8, 0);
    struct UnkStruct_Main4 ** ptr = (void*) gTasks[taskId].data;
    ptr[0] = a0;
    gTasks[taskId].data[2] = a1;
    return taskId;
}

static u8 sub_811A084(struct UnkStruct_Main4 * a0, u32 a1)
{
    u8 taskId = CreateTask(sub_8119FD8, 0);
    struct UnkStruct_Main4 ** ptr = (void*) gTasks[taskId].data;
    ptr[0] = a0;
    gTasks[taskId].data[2] = a1;
    return taskId;
}

static bool32 UR_PrintFieldMessage(const u8 *src)
{
    LoadStdWindowFrameGfx();
    DrawDialogueFrame(0, 1);
    StringExpandPlaceholders(gStringVar4, src);
    AddTextPrinterWithCustomSpeedForMessage(FALSE, 1);
    return FALSE;
}

static bool32 UR_RunTextPrinters_CheckPrinter0Active(void)
{
    if (!RunTextPrinters_CheckPrinter0Active())
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static bool8 PrintOnTextbox(u8 *textState, const u8 *str)
{
    switch (*textState)
    {
    case 0:
        LoadStdWindowFrameGfx();
        DrawDialogueFrame(0, 1);
        StringExpandPlaceholders(gStringVar4, str);
        AddTextPrinterForMessage(TRUE);
        (*textState)++;
        break;
    case 1:
        if (!RunTextPrinters_CheckPrinter0Active())
        {
            *textState = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static s8 sub_811A14C(u8 *state_p, bool32 no_draw)
{
    s8 r1;

    switch (*state_p)
    {
    case 0:
        if (no_draw)
        {
            return -3;
        }
        DisplayYesNoMenuDefaultYes();
        (*state_p)++;
        break;
    case 1:
        if (no_draw)
        {
            DestroyYesNoMenu();
            *state_p = 0;
            return -3;
        }
        r1 = Menu_ProcessInputNoWrapClearOnChoose();
        if (r1 == -1 || r1 == 0 || r1 == 1)
        {
            *state_p = 0;
            return r1;
        }
        break;
    }
    return -2;
}

static u8 CreateTradeBoardWindow(const struct WindowTemplate * template)
{
    u8 windowId = AddWindow(template);
    DrawStdWindowFrame(windowId, FALSE);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(15));
    UR_AddTextPrinterParameterized(windowId, 0, gUnknown_8459378, 8, 1, UR_COLOR_DN5_DN6_LTB);
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 2);
    return windowId;
}

static void DeleteTradeBoardWindow(u8 windowId)
{
    ClearStdWindowAndFrame(windowId, TRUE);
    RemoveWindow(windowId);
}

static s32 ListMenuHandler_AllItemsAvailable(u8 *state_p, u8 *win_id_p, u8 *list_menu_id_p, const struct WindowTemplate * winTemplate, const struct ListMenuTemplate * menuTemplate)
{
    s32 input;

    switch (*state_p)
    {
    case 0:
        *win_id_p = AddWindow(winTemplate);
        DrawStdWindowFrame(*win_id_p, FALSE);
        gMultiuseListMenuTemplate = *menuTemplate;
        gMultiuseListMenuTemplate.windowId = *win_id_p;
        *list_menu_id_p = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);
        CopyWindowToVram(*win_id_p, TRUE);
        (*state_p)++;
        break;
    case 1:
        input = ListMenu_ProcessInput(*list_menu_id_p);
        if (JOY_NEW(A_BUTTON))
        {
            DestroyListMenuTask(*list_menu_id_p, NULL, NULL);
            ClearStdWindowAndFrame(*win_id_p, TRUE);
            RemoveWindow(*win_id_p);
            *state_p = 0;
            return input;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            DestroyListMenuTask(*list_menu_id_p, NULL, NULL);
            ClearStdWindowAndFrame(*win_id_p, TRUE);
            RemoveWindow(*win_id_p);
            *state_p = 0;
            return -2;
        }
        break;
    }

    return -1;
}

static s32 TradeBoardMenuHandler(u8 *state_p, u8 *win_id_p, u8 *list_menu_id_p, u8 *trade_board_win_id_p, const struct WindowTemplate * winTemplate, const struct ListMenuTemplate * menuTemplate, struct UnkStruct_Main0 * traders)
{
    s32 input;
    s32 r4;

    switch (*state_p)
    {
    case 0:
        *trade_board_win_id_p = CreateTradeBoardWindow(&sTradeBoardWindowTemplate);
        *win_id_p = AddWindow(winTemplate);
        DrawStdWindowFrame(*win_id_p, FALSE);
        gMultiuseListMenuTemplate = *menuTemplate;
        gMultiuseListMenuTemplate.windowId = *win_id_p;
        *list_menu_id_p = ListMenuInit(&gMultiuseListMenuTemplate, 0, 1);
        CopyWindowToVram(*win_id_p, TRUE);
        (*state_p)++;
        break;
    case 1:
        input = ListMenu_ProcessInput(*list_menu_id_p);
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            if (input == 8 || JOY_NEW(B_BUTTON))
            {
                DestroyListMenuTask(*list_menu_id_p, NULL, NULL);
                ClearStdWindowAndFrame(*win_id_p, TRUE);
                RemoveWindow(*win_id_p);
                DeleteTradeBoardWindow(*trade_board_win_id_p);
                *state_p = 0;
                return -2;
            }
            else
            {
                r4 = GetIndexOfNthTradeBoardOffer(traders->arr, input);
                if (r4 >= 0)
                {
                    DestroyListMenuTask(*list_menu_id_p, NULL, NULL);
                    ClearStdWindowAndFrame(*win_id_p, TRUE);
                    RemoveWindow(*win_id_p);
                    DeleteTradeBoardWindow(*trade_board_win_id_p);
                    *state_p = 0;
                    return r4;
                }
                else
                {
                    PlaySE(SE_WALL_HIT);
                }
            }
        }
        break;
    }

    return -1;
}

static void sub_811A3F8(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0);
    CopyBgTilemapBufferToVram(0);
}

static void sub_811A41C(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0);
    CopyBgTilemapBufferToVram(0);
    EnableBothScriptContexts();
}

static void UR_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx)
{
    struct TextPrinterTemplate printerTemplate;

    printerTemplate.currentChar = str;
    printerTemplate.windowId = windowId;
    printerTemplate.fontId = fontId;
    printerTemplate.x = x;
    printerTemplate.y = y;
    printerTemplate.currentX = x;
    printerTemplate.currentY = y;
    printerTemplate.unk = 0;

    gTextFlags.useAlternateDownArrow = FALSE;
    switch (colorIdx)
    {
    case UR_COLOR_DKE_WHT_LTE:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_COLOR_DARK_GREY;
        printerTemplate.bgColor = TEXT_COLOR_WHITE;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_GREY;
        break;
    case UR_COLOR_RED_WHT_LTR:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_COLOR_RED;
        printerTemplate.bgColor = TEXT_COLOR_WHITE;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_RED;
        break;
    case UR_COLOR_GRN_WHT_LTG:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_COLOR_GREEN;
        printerTemplate.bgColor = TEXT_COLOR_WHITE;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_GREEN;
        break;
    case UR_COLOR_WHT_WHT_LTE:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_COLOR_WHITE;
        printerTemplate.bgColor = TEXT_COLOR_WHITE;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_GREY;
        break;
    case UR_COLOR_WHT_DKE_LTE:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_COLOR_WHITE;
        printerTemplate.bgColor = TEXT_COLOR_DARK_GREY;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_GREY;
        break;
    case UR_COLOR_GRN_DN6_LTB:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_COLOR_LIGHT_GREEN;
        printerTemplate.bgColor = TEXT_DYNAMIC_COLOR_6;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_BLUE;
        break;
    case UR_COLOR_DN5_DN6_LTB:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_DYNAMIC_COLOR_5;
        printerTemplate.bgColor = TEXT_DYNAMIC_COLOR_6;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_BLUE;
        break;
    }

    AddTextPrinter(&printerTemplate, 0xFF, NULL);
}

static void BlankUnkStruct_x20Array(struct UnkStruct_x20 * arg0, u8 count)
{
    s32 i;

    for (i = 0; i < count; i++)
    {
        arg0[i].unk = sUnkStruct_Shared_Dummy;
        arg0[i].field_18 = 0xFF;
        arg0[i].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
        arg0[i].field_1A_1 = 0;
        arg0[i].field_1B = 0;
    }
}

static void BlankUnkStruct_x1CArray(struct UnkStruct_x1C * arg0, u8 count)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        arg0[i].unk0 = sUnkStruct_Shared_Dummy;
        arg0[i].unk18 = FALSE;
    }
}

static bool8 AreUnkSharedObjectsDifferent(struct UnkStruct_Shared * arg0, const struct UnkStruct_Shared * arg1)
{
    s32 i;

    for (i = 0; i < 2; i++)
    {
        if (arg0->gname.unk_00.playerTrainerId[i] != arg1->gname.unk_00.playerTrainerId[i])
        {
            return TRUE;
        }
    }

    for (i = 0; i < 8; i++)
    {
        if (arg0->playerName[i] != arg1->playerName[i])
        {
            return TRUE;
        }
    }

    return FALSE;
}

static bool32 AreUnionRoomPlayerGnamesDifferent(struct UnkStruct_Shared * arg0, struct UnkStruct_Shared * arg1)
{
    s32 i;

    if (arg0->gname.activity != arg1->gname.activity)
    {
        return TRUE;
    }

    if (arg0->gname.unk_0a_7 != arg1->gname.unk_0a_7)
    {
        return TRUE;
    }

    for (i = 0; i < 4; i++)
    {
        if (arg0->gname.child_sprite_gender[i] != arg1->gname.child_sprite_gender[i])
        {
            return TRUE;
        }
    }

    if (arg0->gname.species != arg1->gname.species)
    {
        return TRUE;
    }

    if (arg0->gname.type != arg1->gname.type)
    {
        return TRUE;
    }

    return FALSE;
}

static u32 sub_811A748(struct UnkStruct_x20 * arg0, struct UnkStruct_x1C * arg1)
{
    u8 result = 0xFF;
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (arg1[i].unk18 && !AreUnkSharedObjectsDifferent(&arg0->unk, &arg1[i].unk0))
        {
            result = i;
            arg1[i].unk18 = FALSE;
        }
    }

    return result;
}

static u8 Appendx1Ctox20(struct UnkStruct_x20 * x20arr, struct UnkStruct_x1C * x1C, u8 count)
{
    s32 i;

    if (x1C->unk18)
    {
        for (i = 0; i < count; i++)
        {
            if (x20arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_NONE)
            {
                x20arr[i].unk = x1C->unk0;
                x20arr[i].field_18 = 0;
                x20arr[i].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
                x20arr[i].field_1B = 0x40;
                x1C->unk18 = FALSE;
                return i;
            }
        }
    }

    return 0xFF;
}

static void sub_811A81C(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id)
{
    u8 activity;
    u8 id_str[6];
    u8 uname[30];

    ConvertIntToDecimalStringN(gStringVar4, id + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringAppend(gStringVar4, gUnknown_84571B0);
    UR_AddTextPrinterParameterized(windowId, 0, gStringVar4, x, y, UR_COLOR_DKE_WHT_LTE);
    x += 18;
    activity = group->unk.gname.activity;
    if (group->groupScheduledAnim == UNION_ROOM_SPAWN_IN && !(activity & 0x40))
    {
        IntlConvPartnerUname(uname, *group);
        UR_AddTextPrinterParameterized(windowId, 2, uname, x, y, colorIdx);
        ConvertIntToDecimalStringN(id_str, group->unk.gname.unk_00.playerTrainerId[0] | (group->unk.gname.unk_00.playerTrainerId[1] << 8), STR_CONV_MODE_LEADING_ZEROS, 5);
        StringCopy(gStringVar4, gUnknown_84571B4);
        StringAppend(gStringVar4, id_str);
        x += 77;
        UR_AddTextPrinterParameterized(windowId, 0, gStringVar4, x, y, colorIdx);
    }
}

static void sub_811A910(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id)
{
    u8 id_str[6];
    u8 uname[30];

    if (group->groupScheduledAnim == UNION_ROOM_SPAWN_IN)
    {
        IntlConvPartnerUname(uname, *group);
        UR_AddTextPrinterParameterized(windowId, 2, uname, x, y, colorIdx);
        ConvertIntToDecimalStringN(id_str, group->unk.gname.unk_00.playerTrainerId[0] | (group->unk.gname.unk_00.playerTrainerId[1] << 8), STR_CONV_MODE_LEADING_ZEROS, 5);
        StringCopy(gStringVar4, gUnknown_84571B4);
        StringAppend(gStringVar4, id_str);
        x += 71;
        UR_AddTextPrinterParameterized(windowId, 0, gStringVar4, x, y, colorIdx);
    }
}

static bool32 PlayerIsTalkingToUnionRoomAide(void)
{
    s16 x, y;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    if (x != 9)
    {
        return FALSE;
    }
    if (y != 8)
    {
        return FALSE;
    }
    if (gPlayerAvatar.tileTransitionState == 2 || gPlayerAvatar.tileTransitionState == 0)
    {
        return TRUE;
    }

    return FALSE;
}

static u32 GetResponseIdx_InviteToURoomActivity(s32 activity)
{
    switch (activity)
    {
    case UROOM_ACTIVITY_CHAT:
        return 1;
    case UROOM_ACTIVITY_TRADE:
        return 2;
    case UROOM_ACTIVITY_CARD:
        return 3;
    case UROOM_ACTIVITY_MLTBATTLE:
    default:
        return 0;
    }
}

static u32 sub_811AA24(struct UnkStruct_x20 * arg0)
{
    u8 sp0[30];
    IntlConvPartnerUname(sp0, *arg0);
    return PlayerHasMetTrainerBefore(ReadAsU16(arg0->unk.gname.unk_00.playerTrainerId), sp0);
}

static s32 sub_811AA5C(struct UnkStruct_Main0 * arg0, u8 arg1, u8 arg2, u32 playerGender)
{
    bool32 r2;

    struct UnkStruct_x20 * r5 = &arg0->arr[arg2];

    if (!r5->unk.gname.unk_0a_7 && arg1 == 0)
    {
        IntlConvPartnerUname(gStringVar1, *r5);
        r2 = PlayerHasMetTrainerBefore(ReadAsU16(r5->unk.gname.unk_00.playerTrainerId), gStringVar1);
        if (r5->unk.gname.activity == (UROOM_ACTIVITY_CHAT | 0x40))
        {
            StringExpandPlaceholders(gStringVar4, gUnknown_8457F80[r2][playerGender]);
            return 2;
        }
        else
        {
            UR_PrintFieldMessage(gUnknown_8457A34[r2]);
            return 1;
        }
    }
    else
    {
        IntlConvPartnerUname(gStringVar1, *r5);
        if (arg1 != 0)
        {
            playerGender = (r5->unk.gname.unk_00.playerTrainerId[arg1 + 1] >> 3) & 1;
        }
        switch (r5->unk.gname.activity & 0x3F)
        {
        case UROOM_ACTIVITY_BATTLE:
            // Battling
            StringExpandPlaceholders(gStringVar4, gUnknown_8458758[playerGender][Random() % 4]);
            break;
        case UROOM_ACTIVITY_TRADE:
            // Trading
            StringExpandPlaceholders(gStringVar4, gUnknown_8458A78[playerGender][Random() % 2]);
            break;
        case UROOM_ACTIVITY_CHAT:
            // Chatting
            StringExpandPlaceholders(gStringVar4, gUnknown_84588BC[playerGender][Random() % 4]);
            break;
        case UROOM_ACTIVITY_CARD:
            // Sharing cards
            StringExpandPlaceholders(gStringVar4, gUnknown_84589AC[playerGender][Random() % 2]);
            break;
        default:
            // Unknown
            StringExpandPlaceholders(gStringVar4, gUnknown_8457F90);
            break;
        }
        return 0;
    }
}

static void nullsub_92(u8 windowId, s32 itemId, u8 y)
{

}

static void TradeBoardPrintItemInfo(u8 windowId, u8 y, struct GFtgtGname * gname, const u8 * uname, u8 colorIdx)
{
    u8 level_t[4];
    u16 species = gname->species;
    u8 type = gname->type;
    u8 level = gname->level;

    UR_AddTextPrinterParameterized(windowId, 2, uname, 8, y, colorIdx);
    if (species == SPECIES_EGG)
    {
        UR_AddTextPrinterParameterized(windowId, 2, gUnknown_8458FBC, 0x44, y, colorIdx);
    }
    else
    {
        BlitMoveInfoIcon(windowId, type + 1, 0x44, y);
        UR_AddTextPrinterParameterized(windowId, 2, gSpeciesNames[species], 0x76, y, colorIdx);
        ConvertIntToDecimalStringN(level_t, level, STR_CONV_MODE_LEFT_ALIGN, 3);
        UR_AddTextPrinterParameterized(windowId, 2, level_t, GetStringRightAlignXOffset(2, level_t, 218), y, colorIdx);
    }
}

static void TradeBoardListMenuItemPrintFunc(u8 windowId, s32 itemId, u8 y)
{
    struct UnkStruct_Leader * leader = sUnionRoomMain.leader;
    struct GFtgtGname * rfu;
    s32 i, j;
    u8 uname[8];

    if (itemId == -3 && y == sTradeBoardListMenuTemplate.upText_Y)
    {
        rfu = GetHostRFUtgtGname();
        if (rfu->species != SPECIES_NONE)
        {
            TradeBoardPrintItemInfo(windowId, y, rfu, gSaveBlock2Ptr->playerName, 5);
        }
    }
    else
    {
        j = 0;
        for (i = 0; i < 8; i++)
        {
            if (leader->field_0->arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN && leader->field_0->arr[i].unk.gname.species != SPECIES_NONE)
            {
                j++;
            }
            if (j == itemId + 1)
            {
                IntlConvPartnerUname(uname, leader->field_0->arr[i]);
                TradeBoardPrintItemInfo(windowId, y, &leader->field_0->arr[i].unk.gname, uname, 6);
                break;
            }
        }
    }
}

static s32 GetIndexOfNthTradeBoardOffer(struct UnkStruct_x20 * arg, s32 arg1)
{
    s32 i;
    s32 j = 0;

    for (i = 0; i < 8; i++)
    {
        if (arg[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN && arg[i].unk.gname.species != SPECIES_NONE)
        {
            j++;
        }
        if (j == arg1 + 1)
        {
            return i;
        }
    }

    return -1;
}

static s32 GetUnionRoomPlayerGender(s32 arg1, struct UnkStruct_Main0 * arg0)
{
    return arg0->arr[arg1].unk.gname.playerGender;
}

static s32 IsRequestedTypeAndSpeciesInPlayerParty(u32 type, u32 species)
{
    s32 i;

    if (species == SPECIES_EGG)
    {
        for (i = 0; i < gPlayerPartyCount; i++)
        {
            species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
            if (species == SPECIES_EGG)
            {
                return UR_TRADE_MATCH;
            }
        }
        return UR_TRADE_NOEGG;
    }
    else
    {
        for (i = 0; i < gPlayerPartyCount; i++)
        {
            species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
            if (gBaseStats[species].type1 == type || gBaseStats[species].type2 == type)
            {
                return UR_TRADE_MATCH;
            }
        }
        return UR_TRADE_NOTYPE;
    }
}

static void GetURoomActivityRejectMsg(u8 *dst, s32 activity, u32 playerGender)
{
    switch (activity)
    {
    case UROOM_ACTIVITY_BATTLE | 0x40:
        StringExpandPlaceholders(dst, gUnknown_8458314[playerGender]);
        break;
    case UROOM_ACTIVITY_CHAT | 0x40:
        StringExpandPlaceholders(dst, gUnknown_84585E8[playerGender]);
        break;
    case UROOM_ACTIVITY_TRADE | 0x40:
        StringExpandPlaceholders(dst, gUnknown_8458F9C);
        break;
    case UROOM_ACTIVITY_CARD | 0x40:
        StringExpandPlaceholders(dst, gUnknown_84583B4[playerGender]);
        break;
    }
}

static void GetURoomActivityStartMsg(u8 *dst, u8 activity)
{
    u8 mpId = GetMultiplayerId();
    u8 gender = gLinkPlayers[mpId ^ 1].gender;

    switch (activity)
    {
    case UROOM_ACTIVITY_BATTLE | 0x40:
        StringCopy(dst, gUnknown_8458230[mpId][gender][0]);
        break;
    case UROOM_ACTIVITY_TRADE | 0x40:
        StringCopy(dst, gUnknown_8458230[mpId][gender][2]);
        break;
    case UROOM_ACTIVITY_CHAT | 0x40:
        StringCopy(dst, gUnknown_8458230[mpId][gender][1]);
        break;
    }
}

static s32 GetChatLeaderActionRequestMessage(u8 *dst, u32 gender, u16 *activity_p, struct UnkStruct_URoom * arg3)
{
    s32 result = 0;
    u16 species = SPECIES_NONE;
    s32 i;

    switch (activity_p[0])
    {
    case UROOM_ACTIVITY_BATTLE | 0x40:
        StringExpandPlaceholders(dst, gUnknown_8457CA4);
        result = 1;
        break;
    case UROOM_ACTIVITY_CHAT | 0x40:
        StringExpandPlaceholders(dst, gUnknown_8457CF8);
        result = 1;
        break;
    case UROOM_ACTIVITY_TRADE | 0x40:
        ConvertIntToDecimalStringN(arg3->activityRequestStrbufs[0], sUnionRoomTrade.playerLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
        StringCopy(arg3->activityRequestStrbufs[1], gSpeciesNames[sUnionRoomTrade.playerSpecies]);
        for (i = 0; i < RFU_CHILD_MAX; i++)
        {
            if (gRfuLinkStatus->partner[i].serialNo == 0x0002)
            {
                ConvertIntToDecimalStringN(arg3->activityRequestStrbufs[2], activity_p[2], STR_CONV_MODE_LEFT_ALIGN, 3);
                StringCopy(arg3->activityRequestStrbufs[3], gSpeciesNames[activity_p[1]]);
                species = activity_p[1];
                break;
            }
        }
        if (species == SPECIES_EGG)
        {
            StringCopy(dst, gUnknown_8457DB8);
        }
        else
        {
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                DynamicPlaceholderTextUtil_SetPlaceholderPtr(i, arg3->activityRequestStrbufs[i]);
            }
            DynamicPlaceholderTextUtil_ExpandPlaceholders(dst, gUnknown_8457D44);
        }
        result = 1;
        break;
    case UROOM_ACTIVITY_CARD | 0x40:
        StringExpandPlaceholders(dst, gUnknown_8457C48);
        result = 1;
        break;
    case 0x40:
        // Chat dropped
        StringExpandPlaceholders(dst, gUnknown_8457E0C);
        result = 2;
        break;
    }

    return result;
}

static bool32 PollPartnerYesNoResponse(struct UnkStruct_URoom * arg0)
{
    if (gRecvCmds[0][1] != 0)
    {
        if (gRecvCmds[0][1] == (UROOM_ACTIVITY_ACCEPT | 0x40))
        {
            arg0->partnerYesNoResponse = UROOM_ACTIVITY_ACCEPT | 0x40;
            return TRUE;
        }
        else if (gRecvCmds[0][1] == (UROOM_ACTIVITY_DECLINE | 0x40))
        {
            arg0->partnerYesNoResponse = UROOM_ACTIVITY_DECLINE | 0x40;
            return TRUE;
        }
    }
    return FALSE;
}

bool32 InUnionRoom(void)
{
    return    gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(UNION_ROOM)
           && gSaveBlock1Ptr->location.mapNum == MAP_NUM(UNION_ROOM)
           ? TRUE : FALSE;
}

static bool32 HasAtLeastTwoMonsOfLevel30OrLower(void)
{
    s32 i;
    s32 count = 0;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_LEVEL) <= 30
            && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) != SPECIES_EGG)
        {
            count++;
        }
    }

    if (count > 1)
        return TRUE;
    else
        return FALSE;
}

static void ResetUnionRoomTrade(struct UnionRoomTrade * arg0)
{
    arg0->field_0 = 0;
    arg0->type = 0;
    arg0->playerPersonality = 0;
    arg0->playerSpecies = 0;
    arg0->playerLevel = 0;
    arg0->species = 0;
    arg0->level = 0;
    arg0->personality = 0;
}

void Script_ResetUnionRoomTrade(void)
{
    ResetUnionRoomTrade(&sUnionRoomTrade);
}

static bool32 RegisterTradeMonAndGetIsEgg(u32 monId, struct UnionRoomTrade * trade)
{
    trade->playerSpecies = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES2);
    trade->playerLevel = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
    trade->playerPersonality = GetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY);
    if (trade->playerSpecies == SPECIES_EGG)
        return TRUE;
    else
        return FALSE;
}

static void RegisterTradeMon(u32 monId, struct UnionRoomTrade * trade)
{
    trade->species = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES2);
    trade->level = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
    trade->personality = GetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY);
}

static u32 GetPartyPositionOfRegisteredMon(struct UnionRoomTrade * trade, u8 multiplayerId)
{
    u16 response = 0;
    u16 species;
    u32 personality;
    u32 cur_personality;
    u16 cur_species;
    s32 i;

    // player
    if (multiplayerId == 0)
    {
        species = trade->playerSpecies;
        personality = trade->playerPersonality;
    }
        // partner
    else
    {
        species = trade->species;
        personality = trade->personality;
    }

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        cur_personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
        if (cur_personality != personality)
        {
            continue;
        }
        cur_species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        if (cur_species != species)
        {
            continue;
        }
        response = i;
        break;
    }

    return response;
}

static void sub_811B258(bool32 arg0)
{
    sub_811A3F8();
    ScriptContext2_Disable();
    sub_80696F0();
    sPlayerCurrActivity = 0;
    if (arg0)
    {
        sub_80FAFA0(sUnionRoomTrade.type, sUnionRoomTrade.playerSpecies, sUnionRoomTrade.playerLevel);
        sub_80FB008(0x40, 0, 0);
    }
}

static void sub_811B298(void)
{
    ScriptContext2_Enable();
    ScriptFreezeObjectEvents();
}

static u8 sub_811B2A8(s32 linkPlayer)
{
    u8 retval = 0x80;
    retval |= gLinkPlayers[linkPlayer].gender << 3;
    retval |= gLinkPlayers[linkPlayer].trainerId & 7;
    return retval;
}

static u8 sub_811B2D8(struct UnkStruct_URoom * arg0)
{
    u8 retVal = 0x80;
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (arg0->field_C->arr[i].unk18)
        {
            retVal |= arg0->field_C->arr[i].unk0.gname.playerGender << 3;
            retVal |= arg0->field_C->arr[i].unk0.gname.unk_00.playerTrainerId[0] & 7;
            break;
        }
    }

    return retVal;
}

static void ViewURoomPartnerTrainerCard(u8 *unused, struct UnkStruct_URoom * arg1, bool8 arg2)
{
    struct TrainerCard * trainerCard = &gTrainerCards[GetMultiplayerId() ^ 1];
    s32 i;
    s32 n;

    DynamicPlaceholderTextUtil_Reset();

    StringCopy(arg1->trainerCardStrbufs[0], gTrainerClassNames[sub_80447F0()]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, arg1->trainerCardStrbufs[0]);

    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, trainerCard->playerName);

    StringCopy(arg1->field_174, gUnknown_84594B0[trainerCard->stars]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, arg1->field_174);

    ConvertIntToDecimalStringN(arg1->trainerCardStrbufs[2], trainerCard->caughtMonsCount, STR_CONV_MODE_LEFT_ALIGN, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, arg1->trainerCardStrbufs[2]);

    ConvertIntToDecimalStringN(arg1->trainerCardStrbufs[3], trainerCard->playTimeHours, STR_CONV_MODE_LEFT_ALIGN, 3);
    ConvertIntToDecimalStringN(arg1->trainerCardStrbufs[4], trainerCard->playTimeMinutes, STR_CONV_MODE_LEADING_ZEROS, 2);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, arg1->trainerCardStrbufs[3]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(5, arg1->trainerCardStrbufs[4]);

    DynamicPlaceholderTextUtil_ExpandPlaceholders(arg1->field_1A4, gUnknown_84594C4);
    StringCopy(gStringVar4, arg1->field_1A4);

    n = trainerCard->linkBattleWins;
    if (n > 9999)
    {
        n = 9999;
    }
    ConvertIntToDecimalStringN(arg1->trainerCardStrbufs[0], n, STR_CONV_MODE_LEFT_ALIGN, 4);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, arg1->trainerCardStrbufs[0]);

    n = trainerCard->linkBattleLosses;
    if (n > 9999)
    {
        n = 9999;
    }
    ConvertIntToDecimalStringN(arg1->trainerCardStrbufs[1], n, STR_CONV_MODE_LEFT_ALIGN, 4);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, arg1->trainerCardStrbufs[1]);

    ConvertIntToDecimalStringN(arg1->trainerCardStrbufs[2], trainerCard->pokemonTrades, STR_CONV_MODE_LEFT_ALIGN, 5);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, arg1->trainerCardStrbufs[2]);

    for (i = 0; i < 4; i++)
    {
        CopyEasyChatWord(arg1->trainerCardStrbufs[i + 3], trainerCard->var_28[i]);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(i + 4, arg1->trainerCardStrbufs[i + 3]);
    }

    DynamicPlaceholderTextUtil_ExpandPlaceholders(arg1->field_1A4, gUnknown_8459504);
    StringAppend(gStringVar4, arg1->field_1A4);

    if (arg2 == TRUE)
    {
        DynamicPlaceholderTextUtil_ExpandPlaceholders(arg1->field_1A4, gUnknown_8459588);
        StringAppend(gStringVar4, arg1->field_1A4);
    }
    else if (arg2 == FALSE)
    {
        DynamicPlaceholderTextUtil_ExpandPlaceholders(arg1->field_1A4, gUnknown_8459580[trainerCard->gender]);
        StringAppend(gStringVar4, arg1->field_1A4);
    }
}
