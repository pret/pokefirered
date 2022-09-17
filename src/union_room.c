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
#include "constants/trainer_card.h"
#include "constants/union_room.h"

static EWRAM_DATA u8 sUnionRoomPlayerName[12] = {};
static EWRAM_DATA u8 sPlayerCurrActivity = 0;
static EWRAM_DATA u8 sPlayerActivityGroupSize = 0;
static EWRAM_DATA union UnkUnion_Main sUnionRoomMain = {};
static EWRAM_DATA u32 sUnref_203B060 = 0;
EWRAM_DATA struct GFtgtGnameSub gPartnerTgtGnameSub = {};
EWRAM_DATA u16 gUnionRoomOfferedSpecies = SPECIES_NONE;
EWRAM_DATA u8 gUnionRoomRequestedMonType = TYPE_NORMAL;
static EWRAM_DATA struct UnionRoomTrade sUnionRoomTrade = {};

static struct UnkStruct_Leader * sLeader;
static struct UnkStruct_Group * sGroup;
static struct UnkStruct_URoom * sURoom;

static void Task_TryBecomeLinkLeader(u8 taskId);
static void Leader_DestroyResources(struct UnkStruct_Leader * leader);
static bool8 Leader_SetStateIfMemberListChanged(struct UnkStruct_Leader * leader, u32 state1, u32 state2);
static void ItemPrintFunc_PossibleGroupMembers(u8 windowId, u32 itemId, u8 y);
static u8 LeaderUpdateGroupMembership(struct UnkStruct_Main0 * main0);
static u8 UnionRoomLeaderField0CompactionAndCount(struct UnkStruct_Main0 * main0);
static void Task_TryJoinLinkGroup(u8 taskId);
static u32 IsTryingToTradeWithHoennTooSoon(struct UnkStruct_Group * group, s32 id);
static void AskToJoinRfuGroup(struct UnkStruct_Group * group, s32 id);
static void Task_ListenToWireless(u8 taskId);
static void ListMenuItemPrintFunc_UnionRoomGroups(u8 windowId, u32 itemId, u8 y);
static u8 GetNewLeaderCandidate(void);
static void CreateTask_RunScriptAndFadeToActivity(void);
static void CreateTask_StartActivity(void);
static void Task_MEvent_Leader(u8 taskId);
static void Task_CardOrNewsWithFriend(u8 taskId);
static void Task_CardOrNewsOverWireless(u8 taskId);
static void Task_RunUnionRoom(u8 taskId);
static u16 ReadAsU16(const u8 *data);
static void ReceiveUnionRoomActivityPacket(struct UnkStruct_URoom * uRoom);
static bool32 UnionRoom_HandleContactFromOtherPlayer(struct UnkStruct_URoom * uRoom);
static void Task_InitUnionRoom(u8 taskId);
static u8 HandlePlayerListUpdate(void);
static u8 CreateTask_SearchForChildOrParent(struct UnkStruct_Main4 * main4, struct UnkStruct_Main4 * arg1, u32 arg2);
static bool32 GetGnameWonderFlagByLinkGroup(struct GFtgtGname * gname, s16 linkGroup);
static u8 CreateTask_ListenForPartnersWithCompatibleSerialNos(struct UnkStruct_Main4 * main4, u32 linkGroup);
static u8 CreateTask_ListenForPartnersWithSerial7F7D(struct UnkStruct_Main4 * main4, u32 linkGroup);
static bool32 UR_PrintFieldMessage(const u8 * str);
static bool32 UR_RunTextPrinters_CheckPrinter0Active(void);
static bool8 PrintOnTextbox(u8 *textState, const u8 *str);
static s8 UnionRoomHandleYesNo(u8 *state_p, bool32 no_draw);
static s32 ListMenuHandler_AllItemsAvailable(u8 *state_p, u8 *win_id_p, u8 *list_menu_id_p, const struct WindowTemplate * winTemplate, const struct ListMenuTemplate * menuTemplate);
static s32 TradeBoardMenuHandler(u8 *state_p, u8 *win_id_p, u8 *list_menu_id_p, u8 *trade_board_win_id_p, const struct WindowTemplate * winTemplate, const struct ListMenuTemplate * menuTemplate, struct UnkStruct_Main0 * traders);
static void UR_BlankBg0(void);
static void JoinGroup_BlankBg0AndEnableScriptContexts(void);
static void UR_AddTextPrinterParameterized(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx);
static void BlankUnkStruct_x20Array(struct UnkStruct_x20 * x20, u8 count);
static void BlankUnkStruct_x1CArray(struct UnkStruct_x1C * x1C, u8 count);
static bool8 AreGnameUnameDifferent(struct UnionGnameUnamePair * arg0, const struct UnionGnameUnamePair * arg1);
static bool32 AreUnionRoomPlayerGnamesDifferent(struct UnionGnameUnamePair * arg0, struct UnionGnameUnamePair * arg1);
static u32 Findx20Inx1CArray(struct UnkStruct_x20 * x20, struct UnkStruct_x1C * x1Carr);
static u8 Appendx1Ctox20(struct UnkStruct_x20 * x20arr, struct UnkStruct_x1C * x1C, u8 count);
static void PrintUnionRoomGroupOnWindow(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id);
static void PrintGroupMemberCandidateOnWindowWithColor(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id);
static bool32 PlayerIsTalkingToUnionRoomAide(void);
static u32 GetResponseIdx_InviteToURoomActivity(s32 activity);
static u32 ConvPartnerUnameAndGetWhetherMetAlready(struct UnkStruct_x20 * unkX20);
static s32 UnionRoomGetPlayerInteractionResponse(struct UnkStruct_Main0 * main0, u8 overrideGender, u8 playerIdx, u32 playerGender);
static void nullsub_92(u8 windowId, u32 itemId, u8 y);
static void TradeBoardListMenuItemPrintFunc(u8 windowId, u32 itemId, u8 y);
static s32 GetIndexOfNthTradeBoardOffer(struct UnkStruct_x20 * x20, s32 n);
static s32 GetUnionRoomPlayerGender(s32 playerIdx, struct UnkStruct_Main0 * main0);
static s32 IsRequestedTypeAndSpeciesInPlayerParty(u32 type, u32 species);
static void GetURoomActivityRejectMsg(u8 *dst, s32 activity, u32 playerGender);
static void GetURoomActivityStartMsg(u8 *dst, u8 activity);
static s32 GetChatLeaderActionRequestMessage(u8 *dst, u32 gender, u16 *activity_p, struct UnkStruct_URoom * uroom);
static bool32 PollPartnerYesNoResponse(struct UnkStruct_URoom * uroom);
static bool32 HasAtLeastTwoMonsOfLevel30OrLower(void);
static void ResetUnionRoomTrade(struct UnionRoomTrade * trade);
static bool32 RegisterTradeMonAndGetIsEgg(u32 monId, struct UnionRoomTrade * trade);
static void RegisterTradeMon(u32 monId, struct UnionRoomTrade * trade);
static u32 GetPartyPositionOfRegisteredMon(struct UnionRoomTrade * trade, u8 mpId);
static void HandleCancelTrade(bool32 unlockObjs);
static void UR_EnableScriptContext2AndFreezeObjectEvents(void);
static u8 GetSinglePartnerSpriteGenderParam(s32 linkPlayer);
static u8 GetActivePartnerSpriteGenderParam(struct UnkStruct_URoom * uroom);
static void ViewURoomPartnerTrainerCard(u8 *dest, struct UnkStruct_URoom * uRoom, bool8 parent_child);

#define _8456CD8(a, b) ((a) | ((b) << 8))

static const u8 *const sUnionRoomActivityStringPtrs[] = {
    gText_UR_EmptyString,
    gText_UR_SingleBattle,
    gText_UR_DoubleBattle,
    gText_UR_MultiBattle,
    gText_UR_PokemonTrades,
    gText_UR_Chat,
    gText_UR_WonderCards,
    gText_UR_WonderNews,
    gText_UR_Cards,
    gText_UR_PokemonJump,
    gText_UR_BerryCrush,
    gText_UR_BerryPicking,
    gText_UR_Search,
    gText_UR_SpinTrade,
    gText_UR_ItemTrade,
    gText_UR_EmptyString,
    gText_UR_EmptyString,
    gText_UR_EmptyString,
    gText_UR_EmptyString,
    gText_UR_EmptyString,
    gText_UR_EmptyString,
    gText_UR_WonderCards,
    gText_UR_WonderNews
};

static const struct WindowTemplate sWindowTemplate_BButtonCancel = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 30,
    .height = 2,
    .paletteNum = 0xF,
    .baseBlock = 0x008
};

static const u32 sLinkGroupToActivityAndCapacity[] = {
    [LINK_GROUP_SINGLE_BATTLE] = _8456CD8(ACTIVITY_BATTLE,    2),
    [LINK_GROUP_DOUBLE_BATTLE] = _8456CD8(ACTIVITY_DBLBATTLE, 2),
    [LINK_GROUP_MULTI_BATTLE]  = _8456CD8(ACTIVITY_MLTBATTLE, 4),
    [LINK_GROUP_TRADE]         = _8456CD8(ACTIVITY_TRADE,     2),
    [LINK_GROUP_POKEMON_JUMP]  = _8456CD8(ACTIVITY_PJUMP,     5 | 0x20),
    [LINK_GROUP_BERRY_CRUSH]   = _8456CD8(ACTIVITY_BCRUSH,    5 | 0x20),
    [LINK_GROUP_BERRY_PICKING] = _8456CD8(ACTIVITY_BPICK,     5 | 0x30),
    [LINK_GROUP_WONDER_CARD]   = _8456CD8(ACTIVITY_SPINTRADE, 5 | 0x30),
    [LINK_GROUP_WONDER_NEWS]   = _8456CD8(ACTIVITY_ITEMTRADE, 5 | 0x30)
};

static const struct WindowTemplate sWindowTemplate_List_PossibleGroupMembers = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 13,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate sWindowTemplate_NumPlayerMode = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0C6
};

const struct ListMenuItem sListMenuItems_PossibleGroupMembers[] = {
    {gText_UR_EmptyString, 0},
    {gText_UR_EmptyString, 1},
    {gText_UR_EmptyString, 2},
    {gText_UR_EmptyString, 3},
    {gText_UR_EmptyString, 4}
};

static const struct ListMenuTemplate sListMenuTemplate_PossibleGroupMembers = {
    .items = sListMenuItems_PossibleGroupMembers,
    .moveCursorFunc = NULL,
    .itemPrintFunc = ItemPrintFunc_PossibleGroupMembers,
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
    .fontId = FONT_2,
    .cursorKind = 1
};

static const struct WindowTemplate sWindowTemplate_MysteryGiftList = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x044
};

static const struct WindowTemplate sWindowTemplate_MysteryGiftPlayerNameAndId = {
    .bg = 0,
    .tilemapLeft = 20,
    .tilemapTop = 3,
    .width = 7,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x0EE
};

static const struct ListMenuItem sListMenuItems_UnionRoomGroups[] = {
    {gText_UR_EmptyString,  0},
    {gText_UR_EmptyString,  1},
    {gText_UR_EmptyString,  2},
    {gText_UR_EmptyString,  3},
    {gText_UR_EmptyString,  4},
    {gText_UR_EmptyString,  5},
    {gText_UR_EmptyString,  6},
    {gText_UR_EmptyString,  7},
    {gText_UR_EmptyString,  8},
    {gText_UR_EmptyString,  9},
    {gText_UR_EmptyString, 10},
    {gText_UR_EmptyString, 11},
    {gText_UR_EmptyString, 12},
    {gText_UR_EmptyString, 13},
    {gText_UR_EmptyString, 14},
    {gText_UR_EmptyString, 15}
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
    .fontId = FONT_2,
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
    {gText_UR_Greetings,  _8456CD8( ACTIVITY_CARD, 2)},
    {gText_UR_Battle,  _8456CD8(ACTIVITY_BATTLE | IN_UNION_ROOM, 2)},
    {gText_UR_Chat2,  _8456CD8(ACTIVITY_CHAT | IN_UNION_ROOM, 2)},
    {gText_UR_Exit,  _8456CD8(ACTIVITY_NONE | IN_UNION_ROOM, 0)}
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
    .fontId = FONT_2,
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
    {gText_UR_Info, 2},
    {gText_UR_Exit, 3}
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
    .fontId = FONT_2,
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
    {gText_UR_Exit,       NUMBER_OF_MON_TYPES}
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
    .fontId = FONT_2,
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
    {gText_UR_EmptyString, -3},
    {gText_UR_EmptyString, 0},
    {gText_UR_EmptyString, 1},
    {gText_UR_EmptyString, 2},
    {gText_UR_EmptyString, 3},
    {gText_UR_EmptyString, 4},
    {gText_UR_EmptyString, 5},
    {gText_UR_EmptyString, 6},
    {gText_UR_EmptyString, 7},
    {gText_UR_Exit2, 8}
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
    .fontId = FONT_2,
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
    {gText_UR_EmptyString,  0},
    {gText_UR_EmptyString,  1},
    {gText_UR_EmptyString,  2},
    {gText_UR_EmptyString,  3},
    {gText_UR_EmptyString,  4},
    {gText_UR_EmptyString,  5},
    {gText_UR_EmptyString,  6},
    {gText_UR_EmptyString,  7},
    {gText_UR_EmptyString,  8},
    {gText_UR_EmptyString,  9},
    {gText_UR_EmptyString, 10},
    {gText_UR_EmptyString, 11},
    {gText_UR_EmptyString, 12},
    {gText_UR_EmptyString, 13},
    {gText_UR_EmptyString, 14},
    {gText_UR_EmptyString, 15}
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
    .fontId = FONT_2,
    .cursorKind = 0
};

static const struct UnionGnameUnamePair sUnionGnameUnamePair_Dummy = {};

// starts at gUnknown_082F0474 in pokeemerald, union link groups

ALIGNED(4) static const u8 gUnknown_845704C[] = {
    ACTIVITY_BATTLE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457050[] = {
    ACTIVITY_DBLBATTLE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457054[] = {
    ACTIVITY_MLTBATTLE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457058[] = {
    ACTIVITY_TRADE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845705C[] = {
    ACTIVITY_PJUMP,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457060[] = {
    ACTIVITY_BCRUSH,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457064[] = {
    ACTIVITY_BPICK,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457068[] = {
    ACTIVITY_WCARD2,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845706C[] = {
    ACTIVITY_WNEWS2,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457070[] = {
    ACTIVITY_NONE | IN_UNION_ROOM,
    ACTIVITY_BATTLE | IN_UNION_ROOM,
    ACTIVITY_TRADE | IN_UNION_ROOM,
    ACTIVITY_CHAT | IN_UNION_ROOM,
    ACTIVITY_CARD | IN_UNION_ROOM,
    ACTIVITY_ACCEPT | IN_UNION_ROOM,
    ACTIVITY_DECLINE | IN_UNION_ROOM,
    ACTIVITY_NPCTALK | IN_UNION_ROOM,
    ACTIVITY_PLYRTALK | IN_UNION_ROOM,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845707C[] = {
    ACTIVITY_SEARCH,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_8457080[] = {
    ACTIVITY_BATTLE,
    ACTIVITY_DBLBATTLE,
    ACTIVITY_MLTBATTLE,
    ACTIVITY_TRADE,
    ACTIVITY_PJUMP,
    ACTIVITY_BCRUSH,
    ACTIVITY_BPICK,
    ACTIVITY_WCARD2,
    ACTIVITY_WNEWS2,
    ACTIVITY_SPINTRADE,
    0xFF
};

ALIGNED(4) static const u8 gUnknown_845708C[] = {
    ACTIVITY_BATTLE,
    ACTIVITY_DBLBATTLE,
    ACTIVITY_MLTBATTLE,
    ACTIVITY_TRADE,
    ACTIVITY_BCRUSH,
    0xFF
};

static const u8 *const sAcceptedActivityIds[] = {
    [LINK_GROUP_SINGLE_BATTLE] = gUnknown_845704C,
    [LINK_GROUP_DOUBLE_BATTLE] = gUnknown_8457050,
    [LINK_GROUP_MULTI_BATTLE]  = gUnknown_8457054,
    [LINK_GROUP_TRADE]         = gUnknown_8457058,
    [LINK_GROUP_POKEMON_JUMP]  = gUnknown_845705C,
    [LINK_GROUP_BERRY_CRUSH]   = gUnknown_8457060,
    [LINK_GROUP_BERRY_PICKING] = gUnknown_8457064,
    [LINK_GROUP_WONDER_CARD]   = gUnknown_8457068,
    [LINK_GROUP_WONDER_NEWS]   = gUnknown_845706C,
    [9]                        = gUnknown_8457070,
    [10]                       = gUnknown_845707C,
    [11]                       = gUnknown_8457080,
    [12]                       = gUnknown_845708C
};

static const u8 sLinkGroupToURoomActivity[] = {
    [LINK_GROUP_SINGLE_BATTLE] = ACTIVITY_BATTLE,
    [LINK_GROUP_DOUBLE_BATTLE] = ACTIVITY_DBLBATTLE,
    [LINK_GROUP_MULTI_BATTLE]  = ACTIVITY_MLTBATTLE,
    [LINK_GROUP_TRADE]         = ACTIVITY_TRADE,
    [LINK_GROUP_POKEMON_JUMP]  = ACTIVITY_PJUMP,
    [LINK_GROUP_BERRY_CRUSH]   = ACTIVITY_BCRUSH,
    [LINK_GROUP_BERRY_PICKING] = ACTIVITY_BPICK,
    [LINK_GROUP_WONDER_CARD]   = ACTIVITY_WCARD2,
    [LINK_GROUP_WONDER_NEWS]   = ACTIVITY_WNEWS2
};

static const u8 sUnref_84570D1[] = _("{DYNAMIC 00}·{DYNAMIC 01}");

#undef _8456CD8

// These are functions in Emerald but inlined in FireRed

#define IntlConvPartnerUname7(dest, arg1) ({                            \
    StringCopy_PlayerName(dest, (arg1).gname_uname.uname);                      \
    ConvertInternationalString(dest, (arg1).gname_uname.gname.unk_00.language); \
})

#define IntlConvPartnerUname(dest, arg1) ({                             \
    StringCopy(dest, (arg1).gname_uname.uname);                            \
    ConvertInternationalString(dest, (arg1).gname_uname.gname.unk_00.language); \
})

#define CopyTrainerCardData(dest, src, _version) ({ \
    (dest) = *((struct TrainerCard * )(src));       \
    (dest).version = _version;                      \
})

#define GetStringRightAlignXOffset(_fontId, _string, _maxWidth) ({ \
    u16 strWidth = GetStringWidth(_fontId, _string, 0);            \
    _maxWidth - strWidth;                                          \
})

// capacityCode is a 2-nybble code
// Bits 0-3: Capacity
// Bits 4-7: Min required (if 0, must have exactly Capacity players
static void PrintNumPlayersWaitingForMsg(u8 windowId, u8 capacityCode, u8 count)
{
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    switch (capacityCode << 8)
    {
    case 0x200:
        UR_AddTextPrinterParameterized(windowId, 2, gTexts_UR_PlayersNeededOrMode[0][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    case 0x400:
        UR_AddTextPrinterParameterized(windowId, 2, gTexts_UR_PlayersNeededOrMode[1][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    case 0x2500:
        UR_AddTextPrinterParameterized(windowId, 2, gTexts_UR_PlayersNeededOrMode[2][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    case 0x3500:
        UR_AddTextPrinterParameterized(windowId, 2, gTexts_UR_PlayersNeededOrMode[3][count - 1], 0, 2, UR_COLOR_DKE_WHT_LTE);
        break;
    }

    CopyWindowToVram(windowId, COPYWIN_GFX);
}

static void PrintPlayerNameAndIdOnWindow(u8 windowId)
{
    u8 text[12];
    u8 text2[12];

    UR_AddTextPrinterParameterized(windowId, 2, gSaveBlock2Ptr->playerName, 0, 2, UR_COLOR_DKE_WHT_LTE);
    StringCopy(text2, gText_UR_ID);
    ConvertIntToDecimalStringN(text, ReadAsU16(gSaveBlock2Ptr->playerTrainerId), STR_CONV_MODE_LEADING_ZEROS, 5);
    StringAppend(text2, text);
    UR_AddTextPrinterParameterized(windowId, 0, text2, 0, 0x10, UR_COLOR_DKE_WHT_LTE);
}

static void StringExpandPlaceholders_AwaitingCommFromAnother(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case ACTIVITY_BATTLE:
    case ACTIVITY_DBLBATTLE:
    case ACTIVITY_MLTBATTLE:
    case ACTIVITY_TRADE:
    case ACTIVITY_PJUMP:
    case ACTIVITY_BCRUSH:
    case ACTIVITY_BPICK:
    case ACTIVITY_WCARD2:
    case ACTIVITY_WNEWS2:
        // UB: argument *dst isn't used, instead it always prints to gStringVar4
        StringExpandPlaceholders(gStringVar4, gText_UR_AwaitingCommunication);
        break;
    }
}

void TryBecomeLinkLeader(void)
{
    u8 taskId;
    struct UnkStruct_Leader * dataPtr;

    taskId = CreateTask(Task_TryBecomeLinkLeader, 0);
    sUnionRoomMain.leader = dataPtr = (void *)(gTasks[taskId].data);
    sLeader = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    gSpecialVar_Result = 0;
}

static void Task_TryBecomeLinkLeader(u8 taskId)
{
    u32 id, val;
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;

    switch (data->state)
    {
    case 0:
        sPlayerCurrActivity = sLinkGroupToActivityAndCapacity[gSpecialVar_0x8004];
        sPlayerActivityGroupSize = sLinkGroupToActivityAndCapacity[gSpecialVar_0x8004] >> 8;
        SetHostRFUtgtGname(sPlayerCurrActivity, 0, 0);
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_LinkLeader(sPlayerActivityGroupSize & 0xF);
        data->state = 3;
        break;
    case 3:
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(UROOM_MAX_PARTY_SIZE * sizeof(struct UnkStruct_x20));
        data->field_8 = AllocZeroed(UROOM_MAX_PARTY_SIZE * sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, UROOM_MAX_PARTY_SIZE);
        LinkRfu3_SetGnameUnameFromStaticBuffers(&data->field_0->arr[0].gname_uname.gname, data->field_0->arr[0].gname_uname.uname);
        data->field_0->arr[0].field_18 = 0;
        data->field_0->arr[0].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
        data->field_0->arr[0].field_1A_1 = 0;
        data->field_0->arr[0].field_1B = 0;
        data->listenTaskId = CreateTask_ListenForPartnersWithCompatibleSerialNos(data->field_4, 0xFF);
        data->bButtonCancelWindowId = AddWindow(&sWindowTemplate_BButtonCancel);
        data->listWindowId = AddWindow(&sWindowTemplate_List_PossibleGroupMembers);
        data->nPlayerModeWindowId = AddWindow(&sWindowTemplate_NumPlayerMode);

        FillWindowPixelBuffer(data->bButtonCancelWindowId, PIXEL_FILL(2));
        UR_AddTextPrinterParameterized(data->bButtonCancelWindowId, 0, gText_UR_BButtonCancel, 8, 2, UR_COLOR_WHT_DKE_LTE);
        PutWindowTilemap(data->bButtonCancelWindowId);
        CopyWindowToVram(data->bButtonCancelWindowId, COPYWIN_GFX);

        DrawStdWindowFrame(data->listWindowId, FALSE);
        gMultiuseListMenuTemplate = sListMenuTemplate_PossibleGroupMembers;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        DrawStdWindowFrame(data->nPlayerModeWindowId, FALSE);
        PutWindowTilemap(data->nPlayerModeWindowId);
        CopyWindowToVram(data->nPlayerModeWindowId, COPYWIN_GFX);

        CopyBgTilemapBufferToVram(0);
        data->playerCount = 1;
        data->state = 4;
        break;
    case 4:
        StringCopy(gStringVar1, sUnionRoomActivityStringPtrs[sPlayerCurrActivity]);
        if ((sPlayerActivityGroupSize >> 4) != 0)
        {
            if (data->playerCount > (sPlayerActivityGroupSize >> 4) - 1 && (sPlayerActivityGroupSize & 0xF) != 0)
                StringExpandPlaceholders(gStringVar4, gText_UR_AwaitingLinkPressStart);
            else
                StringExpandPlaceholders(gStringVar4, gText_UR_AwaitingCommunication);
        }
        else
        {
            StringExpandPlaceholders_AwaitingCommFromAnother(gStringVar4, sPlayerCurrActivity);
        }

        PrintNumPlayersWaitingForMsg(data->nPlayerModeWindowId, sPlayerActivityGroupSize, data->playerCount);
        data->state = 5;
        break;
    case 5:
        if (PrintOnTextbox(&data->textState, gStringVar4))
            data->state = 6;
        break;
    case 6:
        Leader_SetStateIfMemberListChanged(data, 7, 10);
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
            LinkRfu_StopManagerAndFinalizeSlots();
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
        if (PrintOnTextbox(&data->textState, gTexts_UR_PlayerUnavailable[id]))
        {
            data->playerCount = UnionRoomLeaderField0CompactionAndCount(data->field_0);
            RedrawListMenu(data->listTaskId);
            data->state = 4;
        }
        break;
    case 29:
        // Other player cancelled.
        id = ((sPlayerActivityGroupSize & 0xF) == 2) ? 0 : 1;
        if (PrintOnTextbox(&data->textState, gTexts_UR_PlayerUnavailable[id]))
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
        switch (UnionRoomHandleYesNo(&data->textState, CheckTrainerHasLeftByIdAndName(
            ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId),
            data->field_0->arr[data->playerCount].gname_uname.uname)))
        {
        case 0:
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
            data->field_19 = 5;
            SendByteToPartnerByIdAndName(5, ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].gname_uname.uname);
            data->state = 12;
            break;
        case 1:
        case -1:
            data->field_19 = 6;
            SendByteToPartnerByIdAndName(6, ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].gname_uname.uname);
            data->state = 12;
            break;
        case -3:
            data->state = 9;
            break;
        }
        break;
    case 12:
        val = WaitSendByteToPartnerByIdAndName(ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].gname_uname.uname);
        if (val == 1)
        {
            // Xfer complete
            if (data->field_19 == 5)
            {
                // Sent "OK"
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
                        StringExpandPlaceholders(gStringVar4, gText_UR_AnOKWasSentToPlayer);
                        data->state = 13;
                    }

                    LinkRfu_StopManagerAndFinalizeSlots();
                    PrintNumPlayersWaitingForMsg(data->nPlayerModeWindowId, sPlayerActivityGroupSize, data->playerCount);
                }
                else
                {
                    data->state = 4;
                }
            }
            else
            {
                // Sent "no"
                RequestDisconnectSlotByTrainerNameAndId(data->field_0->arr[data->playerCount].gname_uname.uname, ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId));
                data->field_0->arr[data->playerCount].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
                UnionRoomLeaderField0CompactionAndCount(data->field_0);
                RedrawListMenu(data->listTaskId);
                data->state = 4;
            }

            data->field_19 = 0;
        }
        else if (val == 2)
        {
            // Disconnect
            RfuSetStatus(RFU_STATUS_OK, 0);
            data->state = 4;
        }
        break;
    case 13:
        if (PrintOnTextbox(&data->textState, gStringVar4))
            data->state = 14;
        break;
    case 14:
        if (++data->delayTimerAfterOk > 120)
            data->state = 17;
        break;
    case 15:
        if (PrintOnTextbox(&data->textState, gText_UR_AreTheseMembersOK))
            data->state = 16;
        break;
    case 16:
        switch (UnionRoomHandleYesNo(&data->textState, FALSE))
        {
        case 0:
            // Yes
            data->state = 17;
            break;
        case 1:
        case -1:
            // No
            if ((sPlayerActivityGroupSize & 0xF0) != 0)
                data->state = 30;
            else
                data->state = 19;
            break;
        }
        break;
    case 19:
        if (PrintOnTextbox(&data->textState, gText_UR_CancelModeWithTheseMembers))
            data->state = 20;
        break;
    case 20:
        switch (UnionRoomHandleYesNo(&data->textState, FALSE))
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
        // Go to start
        // Final membership check
        if (!Leader_SetStateIfMemberListChanged(data, 7, 23))
            data->state = 18;
        break;
    case 18:
        if (LmanAcceptSlotFlagIsNotZero())
        {
            if (WaitRfuState(FALSE))
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
        if (PrintOnTextbox(&data->textState, gText_UR_ModeWithTheseMembersWillBeCanceled))
            data->state = 23;
        break;
    case 21:
    case 23:
        // An error occurred. Please start over from the beginning.
        DestroyWirelessStatusIndicatorSprite();
        LinkRfu_Shutdown();
        Leader_DestroyResources(data);
        data->state++;
        break;
    case 24:
        ScriptContext_Enable();
        DestroyTask(taskId);
        gSpecialVar_Result = 5;
        break;
    case 22:
        ScriptContext_Enable();
        DestroyTask(taskId);
        gSpecialVar_Result = 8;
        break;
    case 26:
        if (RfuHasErrored())
        {
            data->state = 29;
        }
        else
        {
            if (gReceivedRemoteLinkPlayers)
            {
                UpdateGameData_GroupLockedIn(TRUE);
                CreateTask_RunScriptAndFadeToActivity();
                Leader_DestroyResources(data);
                DestroyTask(taskId);
            }
        }
        break;
    }
}

static void Leader_DestroyResources(struct UnkStruct_Leader * data)
{
    ClearWindowTilemap(data->nPlayerModeWindowId);
    ClearStdWindowAndFrame(data->nPlayerModeWindowId, FALSE);
    DestroyListMenuTask(data->listTaskId, 0, 0);
    ClearWindowTilemap(data->bButtonCancelWindowId);
    ClearStdWindowAndFrame(data->listWindowId, FALSE);
    CopyBgTilemapBufferToVram(0);
    RemoveWindow(data->nPlayerModeWindowId);
    RemoveWindow(data->listWindowId);
    RemoveWindow(data->bButtonCancelWindowId);
    DestroyTask(data->listenTaskId);

    Free(data->field_8);
    Free(data->field_0);
    Free(data->field_4);
}

static void Leader_GetAcceptNewMemberPrompt(u8 *dst, u8 activity)
{
    switch (activity)
    {
    case ACTIVITY_BATTLE:
    case ACTIVITY_DBLBATTLE:
    case ACTIVITY_TRADE:
        StringExpandPlaceholders(dst, gText_UR_PlayerContactedYouForXAccept);
        break;
    case ACTIVITY_WCARD2:
    case ACTIVITY_WNEWS2:
        StringExpandPlaceholders(dst, gText_UR_PlayerContactedYouShareX);
        break;
    case ACTIVITY_MLTBATTLE:
    case ACTIVITY_PJUMP:
    case ACTIVITY_BCRUSH:
    case ACTIVITY_BPICK:
        StringExpandPlaceholders(dst, gText_UR_PlayerContactedYouAddToMembers);
        break;
    }
}

static void GetYouDeclinedTheOfferMessage(u8 *dst, u8 activity)
{
    switch (activity)
    {
    case ACTIVITY_BATTLE | IN_UNION_ROOM:
    case ACTIVITY_TRADE | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gText_UR_OfferDeclined1);
        break;
    case ACTIVITY_CHAT | IN_UNION_ROOM:
    case ACTIVITY_CARD | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gText_UR_OfferDeclined2);
        break;
    }
}

static void GetYouAskedToJoinGroupPleaseWaitMessage(u8 *dst, u8 activity)
{
    switch (activity)
    {
    case ACTIVITY_BATTLE:
    case ACTIVITY_DBLBATTLE:
    case ACTIVITY_TRADE:
    case ACTIVITY_WCARD2:
    case ACTIVITY_WNEWS2:
        StringExpandPlaceholders(dst, gText_UR_AwaitingPlayersResponse);
        break;
    case ACTIVITY_MLTBATTLE:
    case ACTIVITY_PJUMP:
    case ACTIVITY_BCRUSH:
    case ACTIVITY_BPICK:
        StringExpandPlaceholders(dst, gText_UR_PlayerHasBeenAskedToRegisterYouPleaseWait);
        break;
    }
}

static void GetGroupLeaderSentAnOKMessage(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case ACTIVITY_BATTLE:
    case ACTIVITY_DBLBATTLE:
    case ACTIVITY_TRADE:
    case ACTIVITY_WCARD2:
    case ACTIVITY_WNEWS2:
        StringExpandPlaceholders(dst, gText_UR_PlayerSentBackOK);
        break;
    case ACTIVITY_MLTBATTLE:
    case ACTIVITY_PJUMP:
    case ACTIVITY_BCRUSH:
    case ACTIVITY_BPICK:
        StringExpandPlaceholders(dst, gText_UR_PlayerOKdRegistration);
        break;
    }
}

static bool8 Leader_SetStateIfMemberListChanged(struct UnkStruct_Leader * data, u32 state1, u32 state2)
{
    switch (LeaderUpdateGroupMembership(data->field_0))
    {
    case UNION_ROOM_SPAWN_IN:
        PlaySE(SE_PC_LOGIN);
        RedrawListMenu(data->listTaskId);
        IntlConvPartnerUname7(gStringVar2, data->field_0->arr[data->playerCount]);
        Leader_GetAcceptNewMemberPrompt(gStringVar4, sPlayerCurrActivity);
        data->state = state1;
        break;
    case UNION_ROOM_SPAWN_OUT:
        RfuSetStatus(RFU_STATUS_OK, 0);
        RedrawListMenu(data->listTaskId);
        data->state = state2;
        return TRUE;
    }

    return FALSE;
}

static void ItemPrintFunc_PossibleGroupMembers(u8 windowId, u32 itemId, u8 y)
{
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;
    u8 var = 0;

    switch (data->field_0->arr[itemId].groupScheduledAnim)
    {
    case UNION_ROOM_SPAWN_IN:
        if (data->field_0->arr[itemId].field_1B != 0)
            var = UR_COLOR_GRN_WHT_LTG;
        break;
    case UNION_ROOM_SPAWN_OUT:
        var = UR_COLOR_RED_WHT_LTR;
        break;
    }

    PrintGroupMemberCandidateOnWindowWithColor(windowId, 0, y, &data->field_0->arr[itemId], var, itemId);
}

static u8 LeaderUpdateGroupMembership(struct UnkStruct_Main0 * arg0)
{
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;
    u8 ret = UNION_ROOM_SPAWN_NONE;
    u8 i;
    s32 id;

    for (i = 1; i < UROOM_MAX_PARTY_SIZE; i++)
    {
        u16 var = data->field_0->arr[i].groupScheduledAnim;
        if (var == UNION_ROOM_SPAWN_IN)
        {
            id = Findx20Inx1CArray(&data->field_0->arr[i], data->field_4->arr);
            if (id != 0xFF)
            {
                data->field_0->arr[i].gname_uname = data->field_4->arr[id].gname_uname;
                data->field_0->arr[i].field_18 = 1;
            }
            else
            {
                data->field_0->arr[i].groupScheduledAnim = UNION_ROOM_SPAWN_OUT;
                ret = UNION_ROOM_SPAWN_OUT;
            }
        }
    }

    for (id = 0; id < RFU_CHILD_MAX; id++)
        Appendx1Ctox20(data->field_0->arr, &data->field_4->arr[id], UROOM_MAX_PARTY_SIZE);

    if (ret != UNION_ROOM_SPAWN_OUT)
    {
        for (id = 0; id < UROOM_MAX_PARTY_SIZE; id++)
        {
            if (data->field_0->arr[id].field_1B != 0)
                ret = UNION_ROOM_SPAWN_IN;
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

    for (i = 0; i < UROOM_MAX_PARTY_SIZE; i++)
        data->field_8->arr[i] = data->field_0->arr[i];

    copiedCount = 0;
    for (i = 0; i < UROOM_MAX_PARTY_SIZE; i++)
    {
        if (data->field_8->arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
        {
            data->field_0->arr[copiedCount] = data->field_8->arr[i];
            copiedCount++;
        }
    }

    ret = copiedCount;
    for (; copiedCount < UROOM_MAX_PARTY_SIZE; copiedCount++)
    {
        data->field_0->arr[copiedCount].gname_uname = sUnionGnameUnamePair_Dummy;
        data->field_0->arr[copiedCount].field_18 = 0;
        data->field_0->arr[copiedCount].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
        data->field_0->arr[copiedCount].field_1A_1 = FALSE;
        data->field_0->arr[copiedCount].field_1B = 0;
    }

    for (i = 0; i < UROOM_MAX_PARTY_SIZE; i++)
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
    sUnionRoomMain.group = dataPtr = (void *)(gTasks[taskId].data);
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
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_JoinGroup();
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 1;
        break;
    case 1:
        if (PrintOnTextbox(&data->textState, gTexts_UR_ChooseTrainer[gSpecialVar_0x8004]))
            data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->listenTaskId = CreateTask_ListenForPartnersWithCompatibleSerialNos(data->field_4, gSpecialVar_0x8004);
        data->bButtonCancelWindowId = AddWindow(&sWindowTemplate_BButtonCancel);
        data->listWindowId = AddWindow(&sWindowTemplate_MysteryGiftList);
        data->playerNameAndIdWindowId = AddWindow(&sWindowTemplate_MysteryGiftPlayerNameAndId);

        FillWindowPixelBuffer(data->bButtonCancelWindowId, PIXEL_FILL(2));
        UR_AddTextPrinterParameterized(data->bButtonCancelWindowId, 0, gText_UR_ChooseJoinCancel, 8, 2, UR_COLOR_WHT_DKE_LTE);
        PutWindowTilemap(data->bButtonCancelWindowId);
        CopyWindowToVram(data->bButtonCancelWindowId, COPYWIN_GFX);

        DrawStdWindowFrame(data->listWindowId, FALSE);
        gMultiuseListMenuTemplate = sListMenuTemplate_UnionRoomGroups;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        DrawStdWindowFrame(data->playerNameAndIdWindowId, FALSE);
        PutWindowTilemap(data->playerNameAndIdWindowId);
        PrintPlayerNameAndIdOnWindow(data->playerNameAndIdWindowId);
        CopyWindowToVram(data->playerNameAndIdWindowId, COPYWIN_GFX);

        CopyBgTilemapBufferToVram(0);
        data->leaderId = 0;
        data->state = 3;
        break;
    case 3:
        id = GetNewLeaderCandidate();
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
                unusedVar  = data->field_0->arr[id].gname_uname.gname.activity;

                if (data->field_0->arr[id].groupScheduledAnim == UNION_ROOM_SPAWN_IN && !data->field_0->arr[id].gname_uname.gname.started)
                {
                    u32 var = IsTryingToTradeWithHoennTooSoon(data, id);
                    if (var == 0)
                    {
                        AskToJoinRfuGroup(data, id);
                        data->state = 5;
                        PlaySE(SE_POKENAV_ON);
                    }
                    else
                    {
                        // Postgame flags not both set
                        StringCopy(gStringVar4, gTexts_UR_CantTransmitToTrainer[var - 1]);
                        data->state = 18;
                        PlaySE(SE_POKENAV_ON);
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
        GetYouAskedToJoinGroupPleaseWaitMessage(gStringVar4, sPlayerCurrActivity);
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            IntlConvPartnerUname7(gStringVar1, data->field_0->arr[data->leaderId]);
            data->state = 6;
        }
        break;
    case 6:
        if (gReceivedRemoteLinkPlayers)
        {
            sPlayerCurrActivity = data->field_0->arr[data->leaderId].gname_uname.gname.activity;
            RfuSetStatus(RFU_STATUS_OK, 0);
            switch (sPlayerCurrActivity)
            {
            case ACTIVITY_BATTLE:
            case ACTIVITY_DBLBATTLE:
            case ACTIVITY_MLTBATTLE:
            case ACTIVITY_TRADE:
            case ACTIVITY_CHAT:
            case ACTIVITY_PJUMP:
            case ACTIVITY_BCRUSH:
            case ACTIVITY_BPICK:
            case ACTIVITY_SPINTRADE:
            case ACTIVITY_ITEMTRADE:
            case ACTIVITY_WCARD2:
            case ACTIVITY_WNEWS2:
                data->state = 20;
                break;
            }
        }

        switch (RfuGetStatus())
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
            GetGroupLeaderSentAnOKMessage(gStringVar4, sPlayerCurrActivity);
            if (PrintOnTextbox(&data->textState, gStringVar4))
            {
                RfuSetStatus(RFU_STATUS_WAIT_ACK_JOIN_GROUP, 0);
                StringCopy(gStringVar1, sUnionRoomActivityStringPtrs[sPlayerCurrActivity]);
                StringExpandPlaceholders(gStringVar4, gText_UR_AwaitingOtherMembers);
            }
            break;
        case 7:
            // Wait 4 seconds
            if (data->delayBeforePrint > 240)
            {
                if (PrintOnTextbox(&data->textState, gStringVar4))
                {
                    RfuSetStatus(RFU_STATUS_ACK_JOIN_GROUP, 0);
                    data->delayBeforePrint = 0;
                }
            }
            else
            {
                data->delayBeforePrint++;
            }
            break;
        }

        if (!RfuGetStatus() && JOY_NEW(B_BUTTON))
            data->state = 7;
        break;
    case 7:
        if (PrintOnTextbox(&data->textState, gText_UR_QuitBeingMember))
            data->state = 8;
        break;
    case 8:
        switch (UnionRoomHandleYesNo(&data->textState, RfuGetStatus()))
        {
        case 0:
            SendLeaveGroupNotice();
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
        if (RfuGetStatus())
            data->state = 6;
        break;
    case 10:
    case 12:
    case 14:
    case 18:
    case 20:
        ClearWindowTilemap(data->playerNameAndIdWindowId);
        ClearStdWindowAndFrame(data->playerNameAndIdWindowId, FALSE);
        DestroyListMenuTask(data->listTaskId, 0, 0);
        ClearWindowTilemap(data->bButtonCancelWindowId);
        ClearStdWindowAndFrame(data->listWindowId, FALSE);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->playerNameAndIdWindowId);
        RemoveWindow(data->listWindowId);
        RemoveWindow(data->bButtonCancelWindowId);
        DestroyTask(data->listenTaskId);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 13:
        DestroyWirelessStatusIndicatorSprite();
        if (PrintOnTextbox(&data->textState, gTexts_UR_PlayerDisconnected[RfuGetStatus()]))
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
        if (PrintOnTextbox(&data->textState, gTexts_UR_PlayerDisconnected[RfuGetStatus()]))
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
        JoinGroup_BlankBg0AndEnableScriptContexts();
        LinkRfu_Shutdown();
        break;
    case 21:
        CreateTask_RunScriptAndFadeToActivity();
        DestroyTask(taskId);
        break;
    }
}

static u32 IsTryingToTradeWithHoennTooSoon(struct UnkStruct_Group * arg0, s32 id)
{
    struct UnkStruct_x20 * structPtr = &arg0->field_0->arr[id];

    if (sPlayerCurrActivity == ACTIVITY_TRADE && structPtr->gname_uname.gname.unk_00.version != VERSION_FIRE_RED && structPtr->gname_uname.gname.unk_00.version != VERSION_LEAF_GREEN)
    {
        if (!(gSaveBlock2Ptr->specialSaveWarpFlags & CHAMPION_SAVEWARP))
            return 1;
        else if (structPtr->gname_uname.gname.unk_00.isChampion)
            return 0;
    }
    else
    {
        return 0;
    }

    return 2;
}

static void AskToJoinRfuGroup(struct UnkStruct_Group * data, s32 id)
{
    data->leaderId = id;
    LoadWirelessStatusIndicatorSpriteGfx();
    CreateWirelessStatusIndicatorSprite(0, 0);
    RedrawListMenu(data->listTaskId);
    IntlConvPartnerUname7(gStringVar1, data->field_0->arr[data->leaderId]);
    UpdateGameDataWithActivitySpriteGendersFlag(sLinkGroupToURoomActivity[gSpecialVar_0x8004], 0, TRUE);
    CreateTask_RfuReconnectWithParent(data->field_0->arr[data->leaderId].gname_uname.uname, ReadAsU16(data->field_0->arr[data->leaderId].gname_uname.gname.unk_00.playerTrainerId));
}

u8 CreateTask_ListenToWireless(void)
{
    u8 taskId;
    struct UnkStruct_Group * dataPtr;

    taskId = CreateTask(Task_ListenToWireless, 0);
    sUnionRoomMain.group = dataPtr = (void *)(gTasks[taskId].data);

    dataPtr->state = 0;
    dataPtr->textState = 0;

    sGroup = dataPtr;

    return taskId;
}

static void Task_ListenToWireless(u8 taskId)
{
    struct UnkStruct_Group * data = sUnionRoomMain.group;

    switch (data->state)
    {
    case 0:
        SetHostRFUtgtGname(0, 0, 0);
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_JoinGroup();
        sub_80FB128(TRUE);
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->listenTaskId = CreateTask_ListenForPartnersWithCompatibleSerialNos(data->field_4, 0xFF);
        data->leaderId = 0;
        data->state = 3;
        break;
    case 3:
        if (GetNewLeaderCandidate() == 1)
            PlaySE(SE_PC_LOGIN);
        if (gTasks[taskId].data[15] == 0xFF)
            data->state = 10;
        break;
    case 10:
        DestroyTask(data->listenTaskId);
        Free(data->field_0);
        Free(data->field_4);
        LinkRfu_Shutdown();
        data->state++;
        break;
    case 11:
        LinkRfu_Shutdown();
        DestroyTask(taskId);
        break;
    }
}

static bool32 IsPartnerActivityAcceptable(u32 activity, u32 group)
{
    if (group == 0xFF)
        return TRUE;

    #ifndef UBFIX
    if (group <= NELEMS(sAcceptedActivityIds)) // UB: <= may access data outside the array
    #else
    if (group < NELEMS(sAcceptedActivityIds))
    #endif
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

static u8 URoomGroupListGetTextColor(struct UnkStruct_Group * data, u32 id)
{
    if (data->field_0->arr[id].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
    {
        if (data->field_0->arr[id].gname_uname.gname.started)
            return UR_COLOR_WHT_WHT_LTE;
        else if (data->field_0->arr[id].field_1A_1)
            return UR_COLOR_RED_WHT_LTR;
        else if (data->field_0->arr[id].field_1B != 0)
            return UR_COLOR_GRN_WHT_LTG;
    }

    return UR_COLOR_DKE_WHT_LTE;
}

static void ListMenuItemPrintFunc_UnionRoomGroups(u8 windowId, u32 itemId, u8 y)
{
    struct UnkStruct_Group * data = sUnionRoomMain.group;
    u8 color_idx = URoomGroupListGetTextColor(data, itemId);

    PrintUnionRoomGroupOnWindow(windowId, 8, y, &data->field_0->arr[itemId], color_idx, itemId);
}

static u8 GetNewLeaderCandidate(void)
{
    struct UnkStruct_Group * data = sUnionRoomMain.group;
    u8 ret = 0;
    u8 i;
    s32 id;

    for (i = 0; i < 16; i++)
    {
        if (data->field_0->arr[i].groupScheduledAnim != UNION_ROOM_SPAWN_NONE)
        {
            id = Findx20Inx1CArray(&data->field_0->arr[i], data->field_4->arr);
            if (id != 0xFF)
            {
                if (data->field_0->arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
                {
                    if (AreUnionRoomPlayerGnamesDifferent(&data->field_0->arr[i].gname_uname, &data->field_4->arr[id].gname_uname))
                    {
                        data->field_0->arr[i].gname_uname = data->field_4->arr[id].gname_uname;
                        data->field_0->arr[i].field_1B = 64;
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
                    data->field_0->arr[i].field_1B = 64;
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

    for (id = 0; id < RFU_CHILD_MAX; id++)
    {
        if (Appendx1Ctox20(data->field_0->arr, &data->field_4->arr[id], 16) != 0xFF)
            ret = 1;
    }

    return ret;
}

static void Task_CallCB2ReturnFromLinkTrade(u8 taskId)
{
    CB2_ReturnFromLinkTrade();
    DestroyTask(taskId);
}

u8 UnionRoom_CreateTask_CallCB2ReturnFromLinkTrade(void)
{
    u8 taskId = CreateTask(Task_CallCB2ReturnFromLinkTrade, 0);

    return taskId;
}

static void Task_StartUnionRoomTrade(u8 taskId)
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
            gEnemyParty[0] = *(struct Pokemon *)(gBlockRecvBuffer[GetMultiplayerId() ^ 1]);
            IncrementGameStat(GAME_STAT_NUM_UNION_ROOM_BATTLES);
            ResetBlockReceivedFlags();
            gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        memcpy(gBlockSendBuffer, gSaveBlock1Ptr->mail, sizeof(struct Mail) * PARTY_SIZE + 4);
        if (SendBlock(0, gBlockSendBuffer, sizeof(struct Mail) * PARTY_SIZE + 4))
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (GetBlockReceivedStatus() == 3)
        {
            memcpy(gLinkPartnerMail, gBlockRecvBuffer[GetMultiplayerId() ^ 1], sizeof(struct Mail) * PARTY_SIZE);
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

static void Task_ExchangeCards(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (GetMultiplayerId() == 0)
            SendBlockRequest(BLOCK_REQ_SIZE_100);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (GetBlockReceivedStatus() == GetLinkPlayerCountAsBitFlags())
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
                MEventHandleReceivedWonderCard(recvBuff[sizeof(struct TrainerCard) / 2]);
            }
            else
            {
                ResetReceivedWonderCardFlag();
            }

            ResetBlockReceivedFlags();
            DestroyTask(taskId);
        }
        break;
    }
}

static void CB2_ShowCard(void)
{
    switch (gMain.state)
    {
    case 0:
        CreateTask(Task_ExchangeCards, 5);
        gMain.state++;
        break;
    case 1:
        if (!FuncIsActiveTask(Task_ExchangeCards))
            ShowTrainerCardInLink(GetMultiplayerId() ^ 1, CB2_ReturnToField);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

void StartUnionRoomBattle(u16 battleFlags)
{
    HealPlayerParty();
    SavePlayerParty();
    LoadPlayerBag();
    gLinkPlayers[0].linkType = LINKTYPE_BATTLE;
    gLinkPlayers[GetMultiplayerId()].id = GetMultiplayerId();
    gLinkPlayers[GetMultiplayerId() ^ 1].id = GetMultiplayerId() ^ 1;
    gMain.savedCallback = CB2_ReturnFromCableClubBattle;
    gBattleTypeFlags = battleFlags;
    PlayBattleBGM();
}

static void SetCableClubStateAndWarpCurrentMap(u16 linkService, u16 x, u16 y)
{
    VarSet(VAR_CABLE_CLUB_STATE, linkService);
    SetWarpDestination(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, -1, x, y);
    SetDynamicWarpWithCoords(0, gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, -1, x, y);
    WarpIntoMap();
}

static void SetCableClubStateAndWarpToNewMap(s8 mapGroup, s8 mapNum, s32 x, s32 y, u16 linkService)
{
    gSpecialVar_0x8004 = linkService;
    VarSet(VAR_CABLE_CLUB_STATE, linkService);
    gFieldLinkPlayerCount = GetLinkPlayerCount();
    gLocalLinkPlayerId = GetMultiplayerId();
    SetCableClubWarp();
    SetWarpDestination(mapGroup, mapNum, -1, x, y);
    WarpIntoMap();
}

static void CB2_TransitionToCableClub(void)
{
    switch (gMain.state)
    {
    case 0:
        CreateTask(Task_ExchangeCards, 5);
        gMain.state++;
        break;
    case 1:
        if (!FuncIsActiveTask(Task_ExchangeCards))
            SetMainCallback2(CB2_ReturnToFieldCableClub);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

static void CreateTrainerCardInBuffer(void *dest, bool32 setWonderCard)
{
    TrainerCard_GenerateCardForLinkPlayer((struct TrainerCard * )dest);
    if (setWonderCard)
        *((u16 *)(dest + sizeof(struct TrainerCard))) = GetWonderCardFlagId();
    else
        *((u16 *)(dest + sizeof(struct TrainerCard))) = 0;
}

static void Task_StartActivity(u8 taskId)
{
    ResetReceivedWonderCardFlag();
    switch (sPlayerCurrActivity)
    {
    case ACTIVITY_BATTLE:
    case ACTIVITY_DBLBATTLE:
    case ACTIVITY_MLTBATTLE:
    case ACTIVITY_TRADE:
    case ACTIVITY_PJUMP:
    case ACTIVITY_BCRUSH:
    case ACTIVITY_BPICK:
    case ACTIVITY_SPINTRADE:
    case ACTIVITY_ITEMTRADE:
        RecordMixTrainerNames();
        break;
    }

    switch (sPlayerCurrActivity)
    {
    case ACTIVITY_BATTLE | IN_UNION_ROOM:
    case ACTIVITY_ACCEPT | IN_UNION_ROOM:
        CleanupOverworldWindowsAndTilemaps();
        gMain.savedCallback = CB2_UnionRoomBattle;
        InitChooseMonsForBattle(CHOOSE_MONS_FOR_UNION_ROOM_BATTLE);
        break;
    case ACTIVITY_BATTLE:
        CleanupOverworldWindowsAndTilemaps();
        CreateTrainerCardInBuffer(gBlockSendBuffer, TRUE);
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        SetCableClubStateAndWarpToNewMap(MAP_GROUP(BATTLE_COLOSSEUM_2P), MAP_NUM(BATTLE_COLOSSEUM_2P), 6, 8, USING_SINGLE_BATTLE);
        SetMainCallback2(CB2_TransitionToCableClub);
        break;
    case ACTIVITY_DBLBATTLE:
        CleanupOverworldWindowsAndTilemaps();
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        CreateTrainerCardInBuffer(gBlockSendBuffer, TRUE);
        SetCableClubStateAndWarpToNewMap(MAP_GROUP(BATTLE_COLOSSEUM_2P), MAP_NUM(BATTLE_COLOSSEUM_2P), 6, 8, USING_DOUBLE_BATTLE);
        SetMainCallback2(CB2_TransitionToCableClub);
        break;
    case ACTIVITY_MLTBATTLE:
        CleanupOverworldWindowsAndTilemaps();
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        CreateTrainerCardInBuffer(gBlockSendBuffer, TRUE);
        SetCableClubStateAndWarpToNewMap(MAP_GROUP(BATTLE_COLOSSEUM_4P), MAP_NUM(BATTLE_COLOSSEUM_4P), 5, 8, USING_MULTI_BATTLE);
        SetMainCallback2(CB2_TransitionToCableClub);
        break;
    case ACTIVITY_TRADE:
        CreateTrainerCardInBuffer(gBlockSendBuffer, TRUE);
        CleanupOverworldWindowsAndTilemaps();
        SetCableClubStateAndWarpToNewMap(MAP_GROUP(TRADE_CENTER), MAP_NUM(TRADE_CENTER), 5, 8, USING_TRADE_CENTER);
        SetMainCallback2(CB2_TransitionToCableClub);
        break;
    case ACTIVITY_TRADE | IN_UNION_ROOM:
        CreateTask(Task_StartUnionRoomTrade, 0);
        break;
    case ACTIVITY_CHAT:
    case ACTIVITY_CHAT | IN_UNION_ROOM:
        if (GetMultiplayerId() == 0)
        {
            LinkRfu_CreateConnectionAsParent();
        }
        else
        {
            LinkRfu_StopManagerBeforeEnteringChat();
            SetHostRFUtgtGname(ACTIVITY_CHAT | IN_UNION_ROOM, 0, 1);
        }
        EnterUnionRoomChat();
        break;
    case ACTIVITY_CARD:
    case ACTIVITY_CARD | IN_UNION_ROOM:
        CreateTrainerCardInBuffer(gBlockSendBuffer, FALSE);
        SetMainCallback2(CB2_ShowCard);
        break;
    case ACTIVITY_PJUMP:
        SetCableClubStateAndWarpCurrentMap(USING_MINIGAME, 5, 1);
        StartPokemonJump(GetCursorSelectionMonId(), CB2_LoadMap);
        break;
    case ACTIVITY_BCRUSH:
        SetCableClubStateAndWarpCurrentMap(USING_BERRY_CRUSH, 9, 1);
        StartBerryCrush(CB2_LoadMap);
        break;
    case ACTIVITY_BPICK:
        SetCableClubStateAndWarpCurrentMap(USING_MINIGAME, 5, 1);
        StartDodrioBerryPicking(GetCursorSelectionMonId(), CB2_LoadMap);
        break;
    }

    DestroyTask(taskId);
    gSpecialVar_Result = 1;
    UnlockPlayerFieldControls();
}

static void Task_RunScriptAndFadeToActivity(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 *sendBuff = (u16 *)(gBlockSendBuffer);

    switch (data[0])
    {
    case 0:
        gSpecialVar_Result = 1;
        ScriptContext_Enable();
        data[0]++;
        break;
    case 1:
        if (!ScriptContext_IsEnabled())
        {
            FadeScreen(FADE_TO_BLACK, 0);
            data[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            SetLinkStandbyCallback();
            data[0]++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            DestroyTask(taskId);
            CreateTask_StartActivity();
        }
        break;
    }
}

static void CreateTask_RunScriptAndFadeToActivity(void)
{
    CreateTask(Task_RunScriptAndFadeToActivity, 0);
}

static void CreateTask_StartActivity(void)
{
    u8 taskId = CreateTask(Task_StartActivity, 0);
    gTasks[taskId].data[0] = 0;
}

void MEvent_CreateTask_Leader(u32 activity)
{
    u8 taskId;
    struct UnkStruct_Leader * dataPtr;

    taskId = CreateTask(Task_MEvent_Leader, 0);
    sUnionRoomMain.leader = dataPtr = (void *)(gTasks[taskId].data);

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->activity = activity;
    gSpecialVar_Result = 0;
}

static void Task_MEvent_Leader(u8 taskId)
{
    struct UnkStruct_Leader * data = sUnionRoomMain.leader;
    struct WindowTemplate winTemplate;
    s32 val;

    switch (data->state)
    {
    case 0:
        sPlayerCurrActivity = data->activity;
        sPlayerActivityGroupSize = 2;
        SetHostRFUtgtGname(data->activity, 0, 0);
        SetGnameBufferWonderFlags(FALSE, FALSE);
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_LinkLeader(2);
        data->state = 1;
        break;
    case 1:
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(UROOM_MAX_PARTY_SIZE * sizeof(struct UnkStruct_x20));
        data->field_8 = AllocZeroed(UROOM_MAX_PARTY_SIZE * sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, UROOM_MAX_PARTY_SIZE);
        LinkRfu3_SetGnameUnameFromStaticBuffers(&data->field_0->arr[0].gname_uname.gname, data->field_0->arr[0].gname_uname.uname);
        data->field_0->arr[0].field_18 = 0;
        data->field_0->arr[0].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
        data->field_0->arr[0].field_1A_1 = FALSE;
        data->field_0->arr[0].field_1B = 0;
        data->listenTaskId = CreateTask_ListenForPartnersWithCompatibleSerialNos(data->field_4, 0xFF);

        winTemplate = sWindowTemplate_List_PossibleGroupMembers;
        winTemplate.baseBlock = GetMysteryGiftBaseBlock();
        data->listWindowId = AddWindow(&winTemplate);
        MG_DrawTextBorder(data->listWindowId);
        gMultiuseListMenuTemplate = sListMenuTemplate_PossibleGroupMembers;
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
        Leader_SetStateIfMemberListChanged(data, 5, 6);
        if (JOY_NEW(B_BUTTON))
        {
            data->state = 13;
            DestroyWirelessStatusIndicatorSprite();
        }
        break;
    case 6:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gText_UR_LinkWithFriendDropped))
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
        switch (mevent_message_print_and_prompt_yes_no(&data->textState, (u16 *)&data->messageWindowId, FALSE, gStringVar4))
        {
        case 0:
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
            data->field_0->arr[data->playerCount].field_1B = 0;
            RedrawListMenu(data->listTaskId);
            data->field_19 = 5;
            SendByteToPartnerByIdAndName(5, ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].gname_uname.uname);
            data->state = 8;
            break;
        case 1:
        case -1:
            data->field_19 = 6;
            SendByteToPartnerByIdAndName(6, ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].gname_uname.uname);
            data->state = 8;
            break;
        }
        break;
    case 8:
        val = WaitSendByteToPartnerByIdAndName(ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId), data->field_0->arr[data->playerCount].gname_uname.uname);
        if (val == 1)
        {
            if (data->field_19 == 5)
            {
                data->field_0->arr[data->playerCount].field_1B = 0;
                RedrawListMenu(data->listTaskId);
                data->playerCount++;
                IntlConvPartnerUname7(gStringVar1, data->field_0->arr[data->playerCount - 1]);
                StringExpandPlaceholders(gStringVar4, gText_UR_AnOKWasSentToPlayer);
                data->state = 9;
                LinkRfu_StopManagerAndFinalizeSlots();
            }
            else
            {
                RequestDisconnectSlotByTrainerNameAndId(data->field_0->arr[data->playerCount].gname_uname.uname, ReadAsU16(data->field_0->arr[data->playerCount].gname_uname.gname.unk_00.playerTrainerId));
                data->field_0->arr[data->playerCount].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
                UnionRoomLeaderField0CompactionAndCount(data->field_0);
                RedrawListMenu(data->listTaskId);
                data->state = 2;
            }

            data->field_19 = 0;
        }
        else if (val == 2)
        {
            RfuSetStatus(RFU_STATUS_OK, 0);
            data->state = 2;
        }
        break;
    case 9:
        AddTextPrinterToWindow1(gStringVar4);
        data->state = 10;
        break;
    case 10:
        if (++data->delayTimerAfterOk > 120)
            data->state = 11;
        break;
    case 11:
        if (!Leader_SetStateIfMemberListChanged(data, 5, 6))
            data->state = 12;
        break;
    case 12:
        if (LmanAcceptSlotFlagIsNotZero())
        {
            WaitRfuState(FALSE);
            data->state = 15;
        }
        else
        {
            data->state = 6;
        }
        break;
    case 13:
        DestroyWirelessStatusIndicatorSprite();
        LinkRfu_Shutdown();
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->listenTaskId);
        Free(data->field_8);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 14:
        // Please start over from the beginning.
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gText_UR_PleaseStartOver))
        {
            DestroyTask(taskId);
            gSpecialVar_Result = 5;
        }
        break;
    case 15:
        if (RfuGetStatus() == 1 || RfuGetStatus() == 2)
        {
            data->state = 13;
        }
        else if (gReceivedRemoteLinkPlayers)
        {
            UpdateGameData_GroupLockedIn(TRUE);
            data->state++;
        }
        break;
    case 16:
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->listenTaskId);
        Free(data->field_8);
        Free(data->field_0);
        Free(data->field_4);
        SetLinkStandbyCallback();
        data->state++;
        break;
    case 17:
        if (IsLinkTaskFinished())
            DestroyTask(taskId);
        break;
    }
}

void MEvent_CreateTask_CardOrNewsWithFriend(u32 activity)
{
    u8 taskId;
    struct UnkStruct_Group * dataPtr;

    taskId = CreateTask(Task_CardOrNewsWithFriend, 0);
    sUnionRoomMain.group = dataPtr = (void *)(gTasks[taskId].data);
    sGroup = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->cardOrNews = activity - ACTIVITY_WCARD2; // 0: Card; 1: News
    gSpecialVar_Result = 0;
}

static void Task_CardOrNewsWithFriend(u8 taskId)
{
    s32 id;
    struct WindowTemplate winTemplate1, winTemplate2;
    struct UnkStruct_Group * data = sUnionRoomMain.group;

    switch (data->state)
    {
    case 0:
        SetHostRFUtgtGname(data->cardOrNews + ACTIVITY_WCARD2, 0, 0);
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_JoinGroup();
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 1;
        break;
    case 1:
        AddTextPrinterToWindow1(gText_UR_ChooseTrainer);
        data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->listenTaskId = CreateTask_ListenForPartnersWithCompatibleSerialNos(data->field_4, data->cardOrNews + LINK_GROUP_WONDER_CARD);

        winTemplate1 = sWindowTemplate_MysteryGiftList;
        winTemplate1.baseBlock = GetMysteryGiftBaseBlock();
        data->listWindowId = AddWindow(&winTemplate1);

        data->playerNameAndIdWindowId = AddWindow(&sWindowTemplate_MysteryGiftPlayerNameAndId);

        MG_DrawTextBorder(data->listWindowId);
        gMultiuseListMenuTemplate = sListMenuTemplate_UnionRoomGroups;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        MG_DrawTextBorder(data->playerNameAndIdWindowId);
        FillWindowPixelBuffer(data->playerNameAndIdWindowId, PIXEL_FILL(1));
        PutWindowTilemap(data->playerNameAndIdWindowId);
        PrintPlayerNameAndIdOnWindow(data->playerNameAndIdWindowId);
        CopyWindowToVram(data->playerNameAndIdWindowId, COPYWIN_GFX);

        CopyBgTilemapBufferToVram(0);
        data->leaderId = 0;
        data->state = 3;
        break;
    case 3:
        id = GetNewLeaderCandidate();
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
                unusedVar  = data->field_0->arr[id].gname_uname.gname.activity;

                if (data->field_0->arr[id].groupScheduledAnim == UNION_ROOM_SPAWN_IN && !data->field_0->arr[id].gname_uname.gname.started)
                {
                    data->leaderId = id;
                    LoadWirelessStatusIndicatorSpriteGfx();
                    CreateWirelessStatusIndicatorSprite(0, 0);
                    RedrawListMenu(data->listTaskId);
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[data->leaderId]);
                    CreateTask_RfuReconnectWithParent(data->field_0->arr[data->leaderId].gname_uname.uname, ReadAsU16(data->field_0->arr[data->leaderId].gname_uname.gname.unk_00.playerTrainerId));
                    PlaySE(SE_POKENAV_ON);
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
        AddTextPrinterToWindow1(gText_UR_AwaitingPlayersResponse);
        IntlConvPartnerUname(gStringVar1, data->field_0->arr[data->leaderId]);
        data->state = 5;
        break;
    case 5:
        if (gReceivedRemoteLinkPlayers)
        {
            sPlayerCurrActivity = data->field_0->arr[data->leaderId].gname_uname.gname.activity;
            data->state = 10;
        }

        switch (RfuGetStatus())
        {
        case 1:
        case 2:
        case 6:
            data->state = 8;
            break;
        case 5:
            AddTextPrinterToWindow1(gText_UR_PlayerSentBackOK);
            RfuSetStatus(RFU_STATUS_OK, 0);
            break;
        }
        break;
    case 6:
    case 8:
    case 10:
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->playerNameAndIdWindowId);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->listenTaskId);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 9:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gTexts_UR_LinkDropped[RfuGetStatus()]))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            LinkRfu_Shutdown();
            gSpecialVar_Result = 5;
        }
        break;
    case 7:
        DestroyWirelessStatusIndicatorSprite();
        AddTextPrinterToWindow1(gText_UR_PleaseStartOver);
        DestroyTask(taskId);
        LinkRfu_Shutdown();
        gSpecialVar_Result = 5;
        break;
    case 11:
        data->state++;
        SetLinkStandbyCallback();
        break;
    case 12:
        if (IsLinkTaskFinished())
            DestroyTask(taskId);
        break;
    }
}

void MEvent_CreateTask_CardOrNewsOverWireless(u32 activity)
{
    u8 taskId;
    struct UnkStruct_Group * dataPtr;

    taskId = CreateTask(Task_CardOrNewsOverWireless, 0);
    sUnionRoomMain.group = dataPtr = (void *)(gTasks[taskId].data);
    sGroup = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->cardOrNews = activity - ACTIVITY_WCARD2; // 0: Card; 1: News
    gSpecialVar_Result = 0;
}

static void Task_CardOrNewsOverWireless(u8 taskId)
{
    s32 id;
    struct WindowTemplate winTemplate;
    struct UnkStruct_Group * data = sUnionRoomMain.group;

    switch (data->state)
    {
    case 0:
        SetHostRFUtgtGname(0, 0, 0);
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_JoinGroup();
        data->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(16 * sizeof(struct UnkStruct_x20));
        data->state = 1;
        break;
    case 1:
        AddTextPrinterToWindow1(gText_UR_SearchingForWirelessSystemWait);
        data->state = 2;
        break;
    case 2:
        BlankUnkStruct_x1CArray(data->field_4->arr, 4);
        BlankUnkStruct_x20Array(data->field_0->arr, 16);
        data->listenTaskId = CreateTask_ListenForPartnersWithSerial7F7D(data->field_4, data->cardOrNews + LINK_GROUP_WONDER_CARD);

        if (data->field_13 != 0)
        {
            winTemplate = sWindowTemplate_MysteryGiftList;
            winTemplate.baseBlock = GetMysteryGiftBaseBlock();
            data->listWindowId = AddWindow(&winTemplate);

            MG_DrawTextBorder(data->listWindowId);
            gMultiuseListMenuTemplate = sListMenuTemplate_UnionRoomGroups;
            gMultiuseListMenuTemplate.windowId = data->listWindowId;
            data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

            CopyBgTilemapBufferToVram(0);
        }

        data->leaderId = 0;
        data->state = 3;
        break;
    case 3:
        id = GetNewLeaderCandidate();
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
            if (data->refreshTimer > 120)
            {
                if (data->field_0->arr[0].groupScheduledAnim == UNION_ROOM_SPAWN_IN && !data->field_0->arr[0].gname_uname.gname.started)
                {
                    if (GetGnameWonderFlagByLinkGroup(&data->field_0->arr[0].gname_uname.gname, data->cardOrNews + LINK_GROUP_WONDER_CARD))
                    {
                        data->leaderId = 0;
                        data->refreshTimer = 0;
                        LoadWirelessStatusIndicatorSpriteGfx();
                        CreateWirelessStatusIndicatorSprite(0, 0);
                        CreateTask_RfuReconnectWithParent(data->field_0->arr[0].gname_uname.uname, ReadAsU16(data->field_0->arr[0].gname_uname.gname.unk_00.playerTrainerId));
                        PlaySE(SE_POKENAV_ON);
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
                data->refreshTimer = 0;
            }
            data->refreshTimer++;
            break;
        }
        break;
    case 4:
        AddTextPrinterToWindow1(gText_UR_AwaitingResponseFromWirelessSystem);
        IntlConvPartnerUname(gStringVar1, data->field_0->arr[data->leaderId]);
        data->state = 5;
        break;
    case 5:
        if (gReceivedRemoteLinkPlayers)
        {
            sPlayerCurrActivity = data->field_0->arr[data->leaderId].gname_uname.gname.activity;
            data->state = 12;
        }

        switch (RfuGetStatus())
        {
        case 1:
        case 2:
        case 6:
            data->state = 8;
            break;
        case 5:
            AddTextPrinterToWindow1(gText_UR_WirelessLinkEstablished);
            RfuSetStatus(RFU_STATUS_OK, 0);
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
        DestroyTask(data->listenTaskId);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 9:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gText_UR_WirelessLinkDropped))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            LinkRfu_Shutdown();
            gSpecialVar_Result = 5;
        }
        break;
    case 7:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gText_UR_WirelessSearchCanceled))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            LinkRfu_Shutdown();
            gSpecialVar_Result = 5;
        }
        break;
    case 11:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gTexts_UR_NoWonderShared[data->cardOrNews]))
        {
            DestroyWirelessStatusIndicatorSprite();
            DestroyTask(taskId);
            LinkRfu_Shutdown();
            gSpecialVar_Result = 5;
        }
        break;
    case 13:
        data->state++;
        SetLinkStandbyCallback();
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
    CreateTask(Task_RunUnionRoom, 10);

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
    ListMenuLoadStdPalAt(0xD0, 1);
}

static u16 ReadAsU16(const u8 *ptr)
{
    return (ptr[1] << 8) | (ptr[0]);
}

static void UnionRoom_ScheduleFieldMessageWithFollowupState(u32 nextState, const u8 *src)
{
    struct UnkStruct_URoom * data = sUnionRoomMain.uRoom;

    data->state = 8;
    data->stateAfterPrint = nextState;
    if (src != gStringVar4)
        StringExpandPlaceholders(gStringVar4, src);
}

static void UnionRoom_ScheduleFieldMessageAndExit(const u8 *src)
{
    struct UnkStruct_URoom * data = sUnionRoomMain.uRoom;

    data->state = 26;
    if (src != gStringVar4)
        StringExpandPlaceholders(gStringVar4, src);
}

static void BackUpURoomField0ToDecompressionBuffer(struct UnkStruct_URoom * data)
{
    memcpy(&gDecompressionBuffer[0x3F00], data->field_0, UROOM_MAX_GROUP_COUNT * sizeof(struct UnkStruct_x20));
}

static void RestoreURoomField0FromDecompressionBuffer(struct UnkStruct_URoom * data)
{
    memcpy(data->field_0, &gDecompressionBuffer[0x3F00], UROOM_MAX_GROUP_COUNT * sizeof(struct UnkStruct_x20));
}

static void Task_RunUnionRoom(u8 taskId)
{
    u32 id = 0;
    s32 var5 = 0;
    s32 playerGender = MALE;
    struct UnkStruct_URoom * data = sUnionRoomMain.uRoom;
    s16 *taskData = gTasks[taskId].data;

    switch (data->state)
    {
    case 0:
        data->field_4 = AllocZeroed(RFU_CHILD_MAX * sizeof(struct UnkStruct_x1C));
        data->field_C = AllocZeroed(RFU_CHILD_MAX * sizeof(struct UnkStruct_x1C));
        data->field_0 = AllocZeroed(UROOM_MAX_GROUP_COUNT * sizeof(struct UnkStruct_x20));
        data->field_8 = AllocZeroed(sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x20Array(data->field_0->arr, UROOM_MAX_GROUP_COUNT);
        sPlayerCurrActivity = IN_UNION_ROOM;
        data->field_20 = CreateTask_SearchForChildOrParent(data->field_C, data->field_4, LINK_GROUP_UNION_ROOM_RESUME);
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
        SetHostRFUtgtGname(IN_UNION_ROOM, 0, 0);
        RfuUpdatePlayerGnameStateAndSend(sUnionRoomTrade.type, sUnionRoomTrade.playerSpecies, sUnionRoomTrade.playerLevel);
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_EnterUnionRoom();
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
                UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
                if (id >= PARTY_SIZE)
                {
                    ResetUnionRoomTrade(&sUnionRoomTrade);
                    RfuUpdatePlayerGnameStateAndSend(0, 0, 0);
                    UnionRoom_ScheduleFieldMessageAndExit(gText_UR_RegistrationCanceled);
                }
                else if (!RegisterTradeMonAndGetIsEgg(GetCursorSelectionMonId(), &sUnionRoomTrade))
                {
                    UnionRoom_ScheduleFieldMessageWithFollowupState(52, gText_UR_ChooseRequestedMonType);
                }
                else
                {
                    data->state = 55;
                }
                break;
            case 2:
                RestoreURoomField0FromDecompressionBuffer(data);
                taskData[1] = sUnionRoomTrade.field_8;
                if (id >= PARTY_SIZE)
                {
                    UnionRoom_ScheduleFieldMessageAndExit(gText_UR_TradeCanceled);
                }
                else
                {
                    UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
                    sPlayerCurrActivity = ACTIVITY_TRADE | IN_UNION_ROOM;
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
                UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
                PlaySE(SE_PC_LOGIN);
                StringCopy(gStringVar1, gSaveBlock2Ptr->playerName);
                data->state = 42;
                gSpecialVar_Result = 0;
            }
            else if (gSpecialVar_Result == 11)
            {
                UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
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
        else if (ArePlayerFieldControlsLocked() != TRUE)
        {
            if (JOY_NEW(A_BUTTON))
            {
                if (RfuUnionTool_GetGroupAndMemberInFrontOfPlayer(data->field_0, &taskData[0], &taskData[1], data->spriteIds))
                {
                    PlaySE(SE_SELECT);
                    UR_EnableScriptContext2AndFreezeObjectEvents();
                    data->state = 24;
                    break;
                }
                else if (PlayerIsTalkingToUnionRoomAide())
                {
                    UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
                    PlaySE(SE_PC_LOGIN);
                    UR_EnableScriptContext2AndFreezeObjectEvents();
                    StringCopy(gStringVar1, gSaveBlock2Ptr->playerName);
                    data->state = 45;
                    break;
                }
            }

            switch (HandlePlayerListUpdate())
            {
            case 1:
                PlaySE(SE_NOTE_C);
            case 2:
                ScheduleUnionRoomPlayerRefresh(data);
                break;
            case 4:
                data->state = 11;
                UR_EnableScriptContext2AndFreezeObjectEvents();
                RfuUpdatePlayerGnameStateAndSend(0, 0, 0);
                UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_NPCTALK | IN_UNION_ROOM, GetActivePartnerSpriteGenderParam(data), FALSE);
                break;
            }
            HandleUnionRoomPlayerRefresh(data);
        }
        break;
    case 23:
        if (!FuncIsActiveTask(Task_StartMenuHandleInput))
        {
            UpdateGameDataWithActivitySpriteGendersFlag(IN_UNION_ROOM, 0, FALSE);
            data->state = 4;
        }
        break;
    case 24:
        UR_RunTextPrinters_CheckPrinter0Active();
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
        switch (UnionRoomGetPlayerInteractionResponse(data->field_0, taskData[0], taskData[1], playerGender))
        {
        case 0:
            data->state = 26;
            break;
        case 1:
            sub_80FC114(data->field_0->arr[taskData[1]].gname_uname.uname, &data->field_0->arr[taskData[1]].gname_uname.gname, sPlayerCurrActivity);
            data->field_12 = id; // Should be just 0, but won't match any other way.
            data->state = 25;
            break;
        case 2:
            UnionRoom_ScheduleFieldMessageWithFollowupState(19, gStringVar4);
            break;
        }
        break;
    case 25:
        UR_RunTextPrinters_CheckPrinter0Active();
        switch (RfuGetStatus())
        {
        case 4:
            HandleCancelTrade(TRUE);
            data->state = 4;
            break;
        case 1:
        case 2:
            if (IsUnionRoomListenTaskActive() == TRUE)
                UnionRoom_ScheduleFieldMessageAndExit(gText_UR_TrainerAppearsBusy);
            else
                UnionRoom_ScheduleFieldMessageWithFollowupState(30, gText_UR_TrainerAppearsBusy);

            sPlayerCurrActivity = IN_UNION_ROOM;
            break;
        }

        if (gReceivedRemoteLinkPlayers)
        {
            CreateTrainerCardInBuffer(gBlockSendBuffer, TRUE);
            CreateTask(Task_ExchangeCards, 5);
            data->state = 38;
        }
        break;
    case 38:
        if (!FuncIsActiveTask(Task_ExchangeCards))
        {
            if (sPlayerCurrActivity == (ACTIVITY_TRADE | IN_UNION_ROOM))
                UnionRoom_ScheduleFieldMessageWithFollowupState(31, gText_UR_AwaitingPlayersResponseAboutTrade);
            else
                data->state = 5;
        }
        break;
    case 30:
        if (!gReceivedRemoteLinkPlayers)
        {
            HandleCancelTrade(FALSE);
            UpdateUnionGroupMemberFacing(taskData[0], taskData[1], data->field_0);
            data->state = 2;
        }
        break;
    case 5:
        id = ConvPartnerUnameAndGetWhetherMetAlready(&data->field_0->arr[taskData[1]]);
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        UnionRoom_ScheduleFieldMessageWithFollowupState(6, gTexts_UR_HiDoSomething[id][playerGender]);
        break;
    case 6:
        var5 = ListMenuHandler_AllItemsAvailable(&data->textState, &data->topListMenuWindowId, &data->topListMenuListMenuId, &sWindowTemplate_InviteToActivity, &sListMenuTemplate_InviteToActivity);
        if (var5 != -1)
        {
            if (!gReceivedRemoteLinkPlayers)
            {
                data->state = 28;
            }
            else
            {
                data->partnerYesNoResponse = 0;
                playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
                if (var5 == -2 || var5 == IN_UNION_ROOM)
                {
                    data->playerSendBuffer[0] = IN_UNION_ROOM;
                    Rfu_SendPacket(data->playerSendBuffer);
                    StringCopy(gStringVar4, gTexts_UR_IfYouWantToDoSomething[gLinkPlayers[0].gender]);
                    data->state = 32;
                }
                else
                {
                    sPlayerCurrActivity = var5;
                    sPlayerActivityGroupSize = (u32)(var5) >> 8;
                    if (sPlayerCurrActivity == (ACTIVITY_BATTLE | IN_UNION_ROOM) && !HasAtLeastTwoMonsOfLevel30OrLower())
                    {
                        UnionRoom_ScheduleFieldMessageWithFollowupState(5, gText_UR_NeedTwoMonsOfLevel30OrLower1);
                    }
                    else
                    {
                        data->playerSendBuffer[0] = sPlayerCurrActivity | IN_UNION_ROOM;
                        Rfu_SendPacket(data->playerSendBuffer);
                        data->state = 27;
                    }
                }
            }
        }
        break;
    case 28:
        StringCopy(gStringVar4, gText_UR_TrainerBattleBusy);
        data->state = 36;
        break;
    case 27:
        PollPartnerYesNoResponse(data);
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        id = GetResponseIdx_InviteToURoomActivity(data->playerSendBuffer[0] & 0x3F);
        if (PrintOnTextbox(&data->textState, gTexts_UR_WaitOrShowCard[playerGender][id]))
        {
            taskData[3] = 0;
            data->state = 29;
        }
        break;
    case 32:
        SetCloseLinkCallback();
        data->state = 36;
        break;
    case 31:
        data->playerSendBuffer[0] = ACTIVITY_TRADE | IN_UNION_ROOM;
        data->playerSendBuffer[1] = sUnionRoomTrade.species;
        data->playerSendBuffer[2] = sUnionRoomTrade.level;
        Rfu_SendPacket(data->playerSendBuffer);
        data->state = 29;
        break;
    case 29:
        if (!gReceivedRemoteLinkPlayers)
        {
            StringCopy(gStringVar4, gText_UR_TrainerBattleBusy);
            data->state = 28;
        }
        else
        {
            PollPartnerYesNoResponse(data);
            if (data->partnerYesNoResponse == (ACTIVITY_ACCEPT | IN_UNION_ROOM))
            {
                if (sPlayerCurrActivity == ACTIVITY_CARD)
                {
                    ViewURoomPartnerTrainerCard(gStringVar4, data, MODE_CHILD);
                    data->state = 40;
                }
                else
                {
                    data->state = 13;
                }
            }
            else if (data->partnerYesNoResponse == (ACTIVITY_DECLINE | IN_UNION_ROOM))
            {
                data->state = 32;
                GetURoomActivityRejectMsg(gStringVar4, sPlayerCurrActivity | IN_UNION_ROOM, gLinkPlayers[0].gender);
                sPlayerCurrActivity = 0;
            }
        }
        break;

    case 7:
        id = ConvPartnerUnameAndGetWhetherMetAlready(&data->field_0->arr[taskData[1]]);
        playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
        UnionRoom_ScheduleFieldMessageWithFollowupState(6, gTexts_UR_HiDoSomething[id][playerGender]);
        break;
    case 40:
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            data->state = 41;
            SetLinkStandbyCallback();
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
                StringExpandPlaceholders(gStringVar4, gTexts_UR_AwaitingResponse[id]);
                data->state = 33;
            }
            else
            {
                data->state = 7;
            }
        }
        break;
    case 19:
        switch (UnionRoomHandleYesNo(&data->textState, FALSE))
        {
        case 0:
            CopyBgTilemapBufferToVram(0);
            sPlayerCurrActivity = ACTIVITY_CHAT | IN_UNION_ROOM;
            UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_CHAT | IN_UNION_ROOM, 0, TRUE);
            sub_80FC114(data->field_0->arr[taskData[1]].gname_uname.uname, &data->field_0->arr[taskData[1]].gname_uname.gname, sPlayerCurrActivity);
            data->field_12 = taskData[1];
            data->state = 20;
            taskData[3] = 0;
            break;
        case 1:
        case -1:
            playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
            UnionRoom_ScheduleFieldMessageAndExit(gTexts_UR_DeclineChat[playerGender]);
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
        switch (RfuGetStatus())
        {
        case 4:
            HandleCancelTrade(TRUE);
            data->state = 4;
            break;
        case 1:
        case 2:
            playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
            UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
            if (IsUnionRoomListenTaskActive() == TRUE)
                UnionRoom_ScheduleFieldMessageAndExit(gTexts_UR_ChatDeclined[playerGender]);
            else
                UnionRoom_ScheduleFieldMessageWithFollowupState(30, gTexts_UR_ChatDeclined[playerGender]);
            break;
        case 3:
            data->state = 22;
            break;
        }
        taskData[3]++;
        break;
    case 22:
        if (RfuHasErrored())
        {
            playerGender = GetUnionRoomPlayerGender(taskData[1], data->field_0);
            UpdateGameDataWithActivitySpriteGendersFlag(ACTIVITY_PLYRTALK | IN_UNION_ROOM, 0, TRUE);
            if (IsUnionRoomListenTaskActive() == TRUE)
                UnionRoom_ScheduleFieldMessageAndExit(gTexts_UR_ChatDeclined[playerGender]);
            else
                UnionRoom_ScheduleFieldMessageWithFollowupState(30, gTexts_UR_ChatDeclined[playerGender]);
        }
        if (gReceivedRemoteLinkPlayers)
            data->state = 16;
        break;
    case 11:
        PlaySE(SE_DING_DONG);
        sub_80F8FA0();
        data->state = 12;
        data->recvActivityRequest[0] = 0;
        break;
    case 12:
        if (RfuHasErrored())
        {
            HandleCancelTrade(FALSE);
            data->state = 2;
        }
        else if (gReceivedRemoteLinkPlayers)
        {
            CreateTrainerCardInBuffer(gBlockSendBuffer, TRUE);
            CreateTask(Task_ExchangeCards, 5);
            data->state = 39;
        }
        break;
    case 39:
        ReceiveUnionRoomActivityPacket(data);
        if (!FuncIsActiveTask(Task_ExchangeCards))
        {
            data->state = 33;
            StringCopy(gStringVar1, gLinkPlayers[1].name);
            id = PlayerHasMetTrainerBefore(gLinkPlayers[1].trainerId, gLinkPlayers[1].name);
            StringExpandPlaceholders(gStringVar4, gTexts_UR_PlayerContactedYou[id]);
        }
        break;
    case 33:
        ReceiveUnionRoomActivityPacket(data);
        if (PrintOnTextbox(&data->textState, gStringVar4))
            data->state = 34;
        break;
    case 34:
        ReceiveUnionRoomActivityPacket(data);
        if (UnionRoom_HandleContactFromOtherPlayer(data) && JOY_NEW(B_BUTTON))
        {
            sub_80FBD6C(1);
            StringCopy(gStringVar4, gText_UR_ChatEnded);
            data->state = 36;
        }
        break;
    case 35:
        // You said yes
        UnionRoom_ScheduleFieldMessageWithFollowupState(9, gStringVar4);
        break;
    case 9:
        switch (UnionRoomHandleYesNo(&data->textState, FALSE))
        {
        case 0:
            data->playerSendBuffer[0] = ACTIVITY_ACCEPT | IN_UNION_ROOM;
            if (sPlayerCurrActivity == (ACTIVITY_CHAT | IN_UNION_ROOM))
                UpdateGameDataWithActivitySpriteGendersFlag(sPlayerCurrActivity | IN_UNION_ROOM, GetSinglePartnerSpriteGenderParam(1), FALSE);
            else
                UpdateGameDataWithActivitySpriteGendersFlag(sPlayerCurrActivity | IN_UNION_ROOM, GetSinglePartnerSpriteGenderParam(1), TRUE);

            data->field_8->arr[0].field_1B = 0;
            taskData[3] = 0;
            if (sPlayerCurrActivity == (ACTIVITY_BATTLE | IN_UNION_ROOM))
            {
                if (!HasAtLeastTwoMonsOfLevel30OrLower())
                {
                    data->playerSendBuffer[0] = ACTIVITY_DECLINE | IN_UNION_ROOM;
                    Rfu_SendPacket(data->playerSendBuffer);
                    data->state = 10;
                    StringCopy(gStringVar4, gText_UR_NeedTwoMonsOfLevel30OrLower2);
                }
                else
                {
                    Rfu_SendPacket(data->playerSendBuffer);
                    data->state = 13;
                }
            }
            else if (sPlayerCurrActivity == (ACTIVITY_CARD | IN_UNION_ROOM))
            {
                Rfu_SendPacket(data->playerSendBuffer);
                ViewURoomPartnerTrainerCard(gStringVar4, data, MODE_PARENT);
                data->state = 40;
            }
            else
            {
                Rfu_SendPacket(data->playerSendBuffer);
                data->state = 13;
            }
            break;
        case 1:
        case -1:
            data->playerSendBuffer[0] = ACTIVITY_DECLINE | IN_UNION_ROOM;
            Rfu_SendPacket(data->playerSendBuffer);
            data->state = 10;
            GetYouDeclinedTheOfferMessage(gStringVar4, sPlayerCurrActivity);
            break;
        }
        break;
    case 10:
        SetCloseLinkCallback();
        data->state = 36;
        break;
    case 36:
        // You said no
        if (!gReceivedRemoteLinkPlayers)
        {
            sPlayerCurrActivity = IN_UNION_ROOM;
            UnionRoom_ScheduleFieldMessageWithFollowupState(37, gStringVar4);
            memset(data->playerSendBuffer, 0, sizeof(data->playerSendBuffer));
            data->recvActivityRequest[0] = 0;
            data->partnerYesNoResponse = 0;
        }
        break;
    case 37:
        data->state = 2;
        HandleCancelTrade(FALSE);
        break;
    case 13:
        GetURoomActivityStartMsg(gStringVar4, sPlayerCurrActivity | IN_UNION_ROOM);
        UnionRoom_ScheduleFieldMessageWithFollowupState(14, gStringVar4);
        break;
    case 14:
        SetLinkStandbyCallback();
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
            CreateTask_StartActivity();
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
                StringCopy(gStringVar4, gText_UR_CancelRegistrationOfEgg);
            }
            else
            {
                StringCopy(gStringVar1, gSpeciesNames[GetHostRFUtgtGname()->species]);
                ConvertIntToDecimalStringN(gStringVar2, GetHostRFUtgtGname()->level, STR_CONV_MODE_LEFT_ALIGN, 3);
                StringExpandPlaceholders(gStringVar4, gText_UR_CancelRegistrationOfMon);
            }
            UnionRoom_ScheduleFieldMessageWithFollowupState(44, gStringVar4);
        }
        break;
    case 43:
        if (PrintOnTextbox(&data->textState, gText_UR_RegisterMonAtTradingBoard))
            data->state = 47;
        break;
    case 47:
        var5 = ListMenuHandler_AllItemsAvailable(&data->textState, &data->tradeBoardSelectWindowId, &data->tradeBoardDetailsWindowId, &sWindowTemplate_TradeBoardRegisterInfoExit, &sListMenuTemplate_TradeBoardRegisterInfoExit);
        if (var5 != -1)
        {
            if (var5 == -2 || var5 == 3)
            {
                data->state = 4;
                HandleCancelTrade(TRUE);
            }
            else
            {
                switch (var5)
                {
                case 1: // REGISTER
                    UnionRoom_ScheduleFieldMessageWithFollowupState(53, gText_UR_WhichMonWillYouOffer);
                    break;
                case 2: // INFO
                    UnionRoom_ScheduleFieldMessageWithFollowupState(47, gText_UR_TradingBoardInfo);
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
            gFieldCallback = FieldCB_ContinueScriptUnionRoom;
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
                RfuUpdatePlayerGnameStateAndSend(0, 0, 0);
                UnionRoom_ScheduleFieldMessageAndExit(gText_UR_RegistrationCanceled);
                break;
            default:
                sUnionRoomTrade.type = var5;
                data->state = 55;
                break;
            }
        }
        break;
    case 55:
        RfuUpdatePlayerGnameStateAndSend(sUnionRoomTrade.type, sUnionRoomTrade.playerSpecies, sUnionRoomTrade.playerLevel);
        UnionRoom_ScheduleFieldMessageAndExit(gText_UR_RegistraionCompleted);
        break;
    case 44:
        switch (UnionRoomHandleYesNo(&data->textState, FALSE))
        {
        case 0:
            data->state = 56;
            break;
        case 1:
        case -1:
            HandleCancelTrade(TRUE);
            data->state = 4;
            break;
        }
        break;
    case 56:
        if (PrintOnTextbox(&data->textState, gText_UR_RegistrationCanceled2))
        {
            RfuUpdatePlayerGnameStateAndSend(0, 0, 0);
            ResetUnionRoomTrade(&sUnionRoomTrade);
            HandleCancelTrade(TRUE);
            data->state = 4;
        }
        break;
    case 45:
        if (PrintOnTextbox(&data->textState, gText_UR_XCheckedTradingBoard))
            data->state = 46;
        break;
    case 46:
        UR_BlankBg0();
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
                HandleCancelTrade(TRUE);
                DestroyHelpMessageWindow_();
                data->state = 4;
                break;
            default:
                switch (IsRequestedTypeAndSpeciesInPlayerParty(data->field_0->arr[var5].gname_uname.gname.type, data->field_0->arr[var5].gname_uname.gname.species))
                {
                case UR_TRADE_MATCH:
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[var5]);
                    UnionRoom_ScheduleFieldMessageWithFollowupState(49, gText_UR_AskTrainerToMakeTrade);
                    taskData[1] = var5;
                    break;
                case UR_TRADE_NOTYPE:
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[var5]);
                    StringCopy(gStringVar2, gTypeNames[data->field_0->arr[var5].gname_uname.gname.type]);
                    UnionRoom_ScheduleFieldMessageWithFollowupState(46, gText_UR_DontHaveTypeTrainerWants);
                    break;
                case UR_TRADE_NOEGG:
                    IntlConvPartnerUname(gStringVar1, data->field_0->arr[var5]);
                    StringCopy(gStringVar2, gTypeNames[data->field_0->arr[var5].gname_uname.gname.type]);
                    UnionRoom_ScheduleFieldMessageWithFollowupState(46, gText_UR_DontHaveEggTrainerWants);
                    break;
                }
                break;
            }
        }
        break;
    case 49:
        switch (UnionRoomHandleYesNo(&data->textState, FALSE))
        {
        case 0:
            data->state = 50;
            break;
        case -1:
        case 1:
            HandleCancelTrade(TRUE);
            data->state = 4;
            break;
        }
        break;
    case 50:
        if (PrintOnTextbox(&data->textState, gText_UR_WhichMonWillYouOffer))
        {
            sUnionRoomTrade.field_0 = 2;
            memcpy(&gPartnerTgtGnameSub, &data->field_0->arr[taskData[1]].gname_uname.gname.unk_00, sizeof(gPartnerTgtGnameSub));
            gUnionRoomRequestedMonType = data->field_0->arr[taskData[1]].gname_uname.gname.type;
            gUnionRoomOfferedSpecies = data->field_0->arr[taskData[1]].gname_uname.gname.species;
            gFieldCallback = FieldCB_ContinueScriptUnionRoom;
            ChooseMonForTradingBoard(PARTY_MENU_TYPE_UNION_ROOM_TRADE, CB2_ReturnToField);
            BackUpURoomField0ToDecompressionBuffer(data);
            sUnionRoomTrade.field_8 = taskData[1];
        }
        break;
    case 51:
        sPlayerCurrActivity = ACTIVITY_TRADE | IN_UNION_ROOM;
        sub_80FC114(data->field_0->arr[taskData[1]].gname_uname.uname, &data->field_0->arr[taskData[1]].gname_uname.gname, ACTIVITY_TRADE | IN_UNION_ROOM);
        IntlConvPartnerUname(gStringVar1, data->field_0->arr[taskData[1]]);
        UR_PrintFieldMessage(gTexts_UR_CommunicatingWait[2]);
        data->state = 25;
        break;
    case 26:
        if (PrintOnTextbox(&data->textState, gStringVar4))
        {
            HandleCancelTrade(TRUE);
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

static void ReceiveUnionRoomActivityPacket(struct UnkStruct_URoom * uroom)
{
    if (gRecvCmds[1][1] != 0 && (gRecvCmds[1][0] & 0xFF00) == RFUCMD_SEND_PACKET)
    {
        uroom->recvActivityRequest[0] = gRecvCmds[1][1];
        if (gRecvCmds[1][1] == (ACTIVITY_TRADE | IN_UNION_ROOM))
        {
            uroom->recvActivityRequest[1] = gRecvCmds[1][2];
            uroom->recvActivityRequest[2] = gRecvCmds[1][3];
        }
    }
}

static bool32 UnionRoom_HandleContactFromOtherPlayer(struct UnkStruct_URoom * uroom)
{
    if (uroom->recvActivityRequest[0] != 0)
    {
        s32 var = GetChatLeaderActionRequestMessage(gStringVar4, gLinkPlayers[1].gender, &uroom->recvActivityRequest[0], uroom);
        if (var == 0)
        {
            return TRUE;
        }
        else if (var == 1)
        {
            uroom->state = 35;
            sPlayerCurrActivity = uroom->recvActivityRequest[0];
            return FALSE;
        }
        else if (var == 2)
        {
            uroom->state = 36;
            SetCloseLinkCallback();
            return FALSE;
        }
    }

    return TRUE;
}

void InitUnionRoom(void)
{
    struct UnkStruct_URoom * ptr;

    sUnionRoomPlayerName[0] = EOS;
    if (QL_IS_PLAYBACK_STATE)
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
        SetHostRFUtgtGname(ACTIVITY_SEARCH, 0, 0);
        SetWirelessCommType1();
        OpenLink();
        InitializeRfuLinkManager_EnterUnionRoom();
        sub_80FB128(TRUE);
        structPtr->state = 2;
        break;
    case 2:
        structPtr->field_4 = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        BlankUnkStruct_x1CArray(structPtr->field_4->arr, 4);
        structPtr->field_C = AllocZeroed(4 * sizeof(struct UnkStruct_x1C));
        BlankUnkStruct_x1CArray(structPtr->field_C->arr, 4);
        structPtr->field_0 = AllocZeroed(UROOM_MAX_GROUP_COUNT * sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x20Array(structPtr->field_0->arr, UROOM_MAX_GROUP_COUNT);
        structPtr->field_8 = AllocZeroed(sizeof(struct UnkStruct_x20));
        BlankUnkStruct_x20Array(&structPtr->field_8->arr[0], 1);
        structPtr->field_20 = CreateTask_SearchForChildOrParent(structPtr->field_C, structPtr->field_4, LINK_GROUP_UNION_ROOM_INIT);
        structPtr->state = 3;
        break;
    case 3:
        switch (HandlePlayerListUpdate())
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
                        if (PlayerHasMetTrainerBefore(ReadAsU16(structPtr->field_0->arr[i].gname_uname.gname.unk_00.playerTrainerId), text))
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
        LinkRfu_Shutdown();
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

static u8 HandlePlayerListUpdate(void)
{
    s32 i;
    u8 j;
    struct UnkStruct_URoom * structPtr = sUnionRoomMain.uRoom;
    s32 r7 = 0;

    // If someone new joined, register them in field_8
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (AreGnameUnameDifferent(&structPtr->field_C->arr[i].gname_uname, &sUnionGnameUnamePair_Dummy) == TRUE)
        {
            structPtr->field_8->arr[0].gname_uname = structPtr->field_C->arr[i].gname_uname;
            structPtr->field_8->arr[0].field_18 = 0;
            structPtr->field_8->arr[0].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
            structPtr->field_8->arr[0].field_1B = 1;
            return 4;
        }
    }

    // Handle changes to existing player statuses
    for (j = 0; j < UROOM_MAX_GROUP_COUNT; j++)
    {
        if (structPtr->field_0->arr[j].groupScheduledAnim != UNION_ROOM_SPAWN_NONE)
        {
            i = Findx20Inx1CArray(&structPtr->field_0->arr[j], &structPtr->field_4->arr[0]);
            if (i != 0xFF)
            {
                if (structPtr->field_0->arr[j].groupScheduledAnim == UNION_ROOM_SPAWN_IN)
                {
                    // New join in queue
                    if (AreUnionRoomPlayerGnamesDifferent(&structPtr->field_0->arr[j].gname_uname, &structPtr->field_4->arr[i].gname_uname))
                    {
                        // Just joined, copy their names
                        structPtr->field_0->arr[j].gname_uname = structPtr->field_4->arr[i].gname_uname;
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
                    // New join, queue them
                    structPtr->field_0->arr[j].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
                    structPtr->field_0->arr[j].field_1B = 0;
                    r7 = 2;
                }
                structPtr->field_0->arr[j].field_18 = 0;
            }
            else if (structPtr->field_0->arr[j].groupScheduledAnim != UNION_ROOM_SPAWN_OUT)
            {
                // Person may have disconnected. Give them 10 seconds.
                structPtr->field_0->arr[j].field_18++;
                if (structPtr->field_0->arr[j].field_18 >= 600)
                {
                    structPtr->field_0->arr[j].groupScheduledAnim = UNION_ROOM_SPAWN_OUT;
                    r7 = 2;
                }
            }
            else if (structPtr->field_0->arr[j].groupScheduledAnim == UNION_ROOM_SPAWN_OUT)
            {
                // Person dropped. Wait 15 seconds, then remove them.
                structPtr->field_0->arr[j].field_18++;
                if (structPtr->field_0->arr[j].field_18 >= 900)
                {
                    BlankUnkStruct_x20Array(&structPtr->field_0->arr[j], 1);
                }
            }
        }
    }

    // Update the players list
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (Appendx1Ctox20(&structPtr->field_0->arr[0], &structPtr->field_4->arr[i], UROOM_MAX_GROUP_COUNT) != 0xFF)
            r7 = 1;
    }

    return r7;
}

static void Task_SearchForChildOrParent(u8 taskId)
{
    s32 i, j;
    struct UnionGnameUnamePair gname_uname;
    struct UnkStruct_Main4 ** ptr = (void *) gTasks[taskId].data;
    bool8 parent_child;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        parent_child = LinkRfu_GetNameIfCompatible(&gname_uname.gname, gname_uname.uname, i);
        if (!IsPartnerActivityAcceptable(gname_uname.gname.activity, gTasks[taskId].data[4]))
        {
            gname_uname = sUnionGnameUnamePair_Dummy;
        }
        if (gname_uname.gname.unk_00.language == LANGUAGE_JAPANESE)
        {
            gname_uname = sUnionGnameUnamePair_Dummy;
        }
        if (parent_child == MODE_CHILD)
        {
            for (j = 0; j < i; j++)
            {
                if (!AreGnameUnameDifferent(&ptr[1]->arr[j].gname_uname, &gname_uname))
                {
                    gname_uname = sUnionGnameUnamePair_Dummy;
                }
            }
            ptr[1]->arr[i].gname_uname = gname_uname;
            ptr[1]->arr[i].active = AreGnameUnameDifferent(&ptr[1]->arr[i].gname_uname, &sUnionGnameUnamePair_Dummy);
        }
        else
        {
            ptr[0]->arr[i].gname_uname = gname_uname;
            ptr[0]->arr[i].active = AreGnameUnameDifferent(&ptr[0]->arr[i].gname_uname, &sUnionGnameUnamePair_Dummy);
        }
    }
}

static u8 CreateTask_SearchForChildOrParent(struct UnkStruct_Main4 * main4_parent, struct UnkStruct_Main4 * main4_child, u32 linkGroup)
{
    u8 taskId = CreateTask(Task_SearchForChildOrParent, 0);
    struct UnkStruct_Main4 ** data = (void *)gTasks[taskId].data;
    data[0] = main4_parent;
    data[1] = main4_child;
    gTasks[taskId].data[4] = linkGroup;
    return taskId;
}

static void Task_ListenForPartnersWithCompatibleSerialNos(u8 taskId)
{
    s32 i, j;
    struct UnkStruct_Main4 ** ptr = (void *) gTasks[taskId].data;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        LinkRfu_GetNameIfCompatible(&ptr[0]->arr[i].gname_uname.gname, ptr[0]->arr[i].gname_uname.uname, i);
        if (!IsPartnerActivityAcceptable(ptr[0]->arr[i].gname_uname.gname.activity, gTasks[taskId].data[2]))
        {
            ptr[0]->arr[i].gname_uname = sUnionGnameUnamePair_Dummy;
        }
        for (j = 0; j < i; j++)
        {
            if (!AreGnameUnameDifferent(&ptr[0]->arr[j].gname_uname, &ptr[0]->arr[i].gname_uname))
            {
                ptr[0]->arr[i].gname_uname = sUnionGnameUnamePair_Dummy;
            }
        }
        ptr[0]->arr[i].active = AreGnameUnameDifferent(&ptr[0]->arr[i].gname_uname, &sUnionGnameUnamePair_Dummy);
    }
}

static bool32 GetGnameWonderFlagByLinkGroup(struct GFtgtGname * gname, s16 linkGroup)
{
    if (linkGroup == LINK_GROUP_WONDER_CARD)
    {
        if (!gname->unk_00.hasCard)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    else if (linkGroup == LINK_GROUP_WONDER_NEWS)
    {
        if (!gname->unk_00.hasNews)
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

static void Task_ListenForPartnersWithSerial7F7D(u8 taskId)
{
    s32 i;
    struct UnkStruct_Main4 ** ptr = (void *) gTasks[taskId].data;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (LinkRfu_GetNameIfSerial7F7D(&ptr[0]->arr[i].gname_uname.gname, ptr[0]->arr[i].gname_uname.uname, i))
        {
            GetGnameWonderFlagByLinkGroup(&ptr[0]->arr[i].gname_uname.gname, gTasks[taskId].data[2]);
        }
        ptr[0]->arr[i].active = AreGnameUnameDifferent(&ptr[0]->arr[i].gname_uname, &sUnionGnameUnamePair_Dummy);
    }
}

static u8 CreateTask_ListenForPartnersWithCompatibleSerialNos(struct UnkStruct_Main4 * main4, u32 linkGroup)
{
    u8 taskId = CreateTask(Task_ListenForPartnersWithCompatibleSerialNos, 0);
    struct UnkStruct_Main4 ** ptr = (void *) gTasks[taskId].data;
    ptr[0] = main4;
    gTasks[taskId].data[2] = linkGroup;
    return taskId;
}

static u8 CreateTask_ListenForPartnersWithSerial7F7D(struct UnkStruct_Main4 * main4, u32 linkGroup)
{
    u8 taskId = CreateTask(Task_ListenForPartnersWithSerial7F7D, 0);
    struct UnkStruct_Main4 ** ptr = (void *) gTasks[taskId].data;
    ptr[0] = main4;
    gTasks[taskId].data[2] = linkGroup;
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

static s8 UnionRoomHandleYesNo(u8 *state_p, bool32 no_draw)
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
    UR_AddTextPrinterParameterized(windowId, 0, gText_UR_NameWantedOfferLv, 8, 1, UR_COLOR_DN5_DN6_LTB);
    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, COPYWIN_GFX);
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
            if (input == UROOM_MAX_GROUP_COUNT || JOY_NEW(B_BUTTON))
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

static void UR_BlankBg0(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0);
    CopyBgTilemapBufferToVram(0);
}

static void JoinGroup_BlankBg0AndEnableScriptContexts(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0);
    CopyBgTilemapBufferToVram(0);
    ScriptContext_Enable();
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
        printerTemplate.fgColor = TEXT_COLOR_DARK_GRAY;
        printerTemplate.bgColor = TEXT_COLOR_WHITE;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_GRAY;
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
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_GRAY;
        break;
    case UR_COLOR_WHT_DKE_LTE:
        printerTemplate.letterSpacing = 0;
        printerTemplate.lineSpacing = 0;
        printerTemplate.fgColor = TEXT_COLOR_WHITE;
        printerTemplate.bgColor = TEXT_COLOR_DARK_GRAY;
        printerTemplate.shadowColor = TEXT_COLOR_LIGHT_GRAY;
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

static void BlankUnkStruct_x20Array(struct UnkStruct_x20 * x20arr, u8 count)
{
    s32 i;

    for (i = 0; i < count; i++)
    {
        x20arr[i].gname_uname = sUnionGnameUnamePair_Dummy;
        x20arr[i].field_18 = 0xFF;
        x20arr[i].groupScheduledAnim = UNION_ROOM_SPAWN_NONE;
        x20arr[i].field_1A_1 = FALSE;
        x20arr[i].field_1B = 0;
    }
}

static void BlankUnkStruct_x1CArray(struct UnkStruct_x1C * x1Carr, u8 count)
{
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        x1Carr[i].gname_uname = sUnionGnameUnamePair_Dummy;
        x1Carr[i].active = FALSE;
    }
}

static bool8 AreGnameUnameDifferent(struct UnionGnameUnamePair * left, const struct UnionGnameUnamePair * right)
{
    s32 i;

    for (i = 0; i < 2; i++)
    {
        if (left->gname.unk_00.playerTrainerId[i] != right->gname.unk_00.playerTrainerId[i])
        {
            return TRUE;
        }
    }

    for (i = 0; i < RFU_USER_NAME_LENGTH; i++)
    {
        if (left->uname[i] != right->uname[i])
        {
            return TRUE;
        }
    }

    return FALSE;
}

static bool32 AreUnionRoomPlayerGnamesDifferent(struct UnionGnameUnamePair * left, struct UnionGnameUnamePair * right)
{
    s32 i;

    if (left->gname.activity != right->gname.activity)
    {
        return TRUE;
    }

    if (left->gname.started != right->gname.started)
    {
        return TRUE;
    }

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (left->gname.child_sprite_gender[i] != right->gname.child_sprite_gender[i])
        {
            return TRUE;
        }
    }

    if (left->gname.species != right->gname.species)
    {
        return TRUE;
    }

    if (left->gname.type != right->gname.type)
    {
        return TRUE;
    }

    return FALSE;
}

static u32 Findx20Inx1CArray(struct UnkStruct_x20 * x20, struct UnkStruct_x1C * x1Carr)
{
    u8 result = 0xFF;
    s32 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (x1Carr[i].active && !AreGnameUnameDifferent(&x20->gname_uname, &x1Carr[i].gname_uname))
        {
            result = i;
            x1Carr[i].active = FALSE;
        }
    }

    return result;
}

static u8 Appendx1Ctox20(struct UnkStruct_x20 * x20arr, struct UnkStruct_x1C * x1C, u8 count)
{
    s32 i;

    if (x1C->active)
    {
        for (i = 0; i < count; i++)
        {
            if (x20arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_NONE)
            {
                x20arr[i].gname_uname = x1C->gname_uname;
                x20arr[i].field_18 = 0;
                x20arr[i].groupScheduledAnim = UNION_ROOM_SPAWN_IN;
                x20arr[i].field_1B = 0x40;
                x1C->active = FALSE;
                return i;
            }
        }
    }

    return 0xFF;
}

static void PrintUnionRoomGroupOnWindow(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id)
{
    u8 activity;
    u8 id_str[6];
    u8 uname[30];

    ConvertIntToDecimalStringN(gStringVar4, id + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringAppend(gStringVar4, gText_UR_Colon);
    UR_AddTextPrinterParameterized(windowId, 0, gStringVar4, x, y, UR_COLOR_DKE_WHT_LTE);
    x += 18;
    activity = group->gname_uname.gname.activity;
    if (group->groupScheduledAnim == UNION_ROOM_SPAWN_IN && !(activity & IN_UNION_ROOM))
    {
        IntlConvPartnerUname(uname, *group);
        UR_AddTextPrinterParameterized(windowId, 2, uname, x, y, colorIdx);
        ConvertIntToDecimalStringN(id_str, group->gname_uname.gname.unk_00.playerTrainerId[0] | (group->gname_uname.gname.unk_00.playerTrainerId[1] << 8), STR_CONV_MODE_LEADING_ZEROS, 5);
        StringCopy(gStringVar4, gText_UR_ID);
        StringAppend(gStringVar4, id_str);
        x += 77;
        UR_AddTextPrinterParameterized(windowId, 0, gStringVar4, x, y, colorIdx);
    }
}

static void PrintGroupMemberCandidateOnWindowWithColor(u8 windowId, u8 x, u8 y, struct UnkStruct_x20 * group, u8 colorIdx, u8 id)
{
    u8 id_str[6];
    u8 uname[30];

    if (group->groupScheduledAnim == UNION_ROOM_SPAWN_IN)
    {
        IntlConvPartnerUname(uname, *group);
        UR_AddTextPrinterParameterized(windowId, 2, uname, x, y, colorIdx);
        ConvertIntToDecimalStringN(id_str, group->gname_uname.gname.unk_00.playerTrainerId[0] | (group->gname_uname.gname.unk_00.playerTrainerId[1] << 8), STR_CONV_MODE_LEADING_ZEROS, 5);
        StringCopy(gStringVar4, gText_UR_ID);
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
    case ACTIVITY_CHAT:
        return 1;
    case ACTIVITY_TRADE:
        return 2;
    case ACTIVITY_CARD:
        return 3;
    case ACTIVITY_MLTBATTLE:
    default:
        return 0;
    }
}

static u32 ConvPartnerUnameAndGetWhetherMetAlready(struct UnkStruct_x20 * x20)
{
    u8 sp0[30];
    IntlConvPartnerUname(sp0, *x20);
    return PlayerHasMetTrainerBefore(ReadAsU16(x20->gname_uname.gname.unk_00.playerTrainerId), sp0);
}

static s32 UnionRoomGetPlayerInteractionResponse(struct UnkStruct_Main0 * main0, u8 overrideGender, u8 playerIdx, u32 playerGender)
{
    bool32 metBefore;

    struct UnkStruct_x20 * x20 = &main0->arr[playerIdx];

    if (!x20->gname_uname.gname.started && overrideGender == 0)
    {
        IntlConvPartnerUname(gStringVar1, *x20);
        metBefore = PlayerHasMetTrainerBefore(ReadAsU16(x20->gname_uname.gname.unk_00.playerTrainerId), gStringVar1);
        if (x20->gname_uname.gname.activity == (ACTIVITY_CHAT | IN_UNION_ROOM))
        {
            StringExpandPlaceholders(gStringVar4, gTexts_UR_JoinChat[metBefore][playerGender]);
            return 2;
        }
        else
        {
            UR_PrintFieldMessage(gTexts_UR_CommunicatingWait[metBefore]);
            return 1;
        }
    }
    else
    {
        IntlConvPartnerUname(gStringVar1, *x20);
        if (overrideGender != 0)
        {
            playerGender = (x20->gname_uname.gname.unk_00.playerTrainerId[overrideGender + 1] >> 3) & 1;
        }
        switch (x20->gname_uname.gname.activity & 0x3F)
        {
        case ACTIVITY_BATTLE:
            StringExpandPlaceholders(gStringVar4, gTexts_UR_BattleReaction[playerGender][Random() % 4]);
            break;
        case ACTIVITY_TRADE:
            StringExpandPlaceholders(gStringVar4, gTexts_UR_TradeReaction[playerGender][Random() % 2]);
            break;
        case ACTIVITY_CHAT:
            StringExpandPlaceholders(gStringVar4, gTexts_UR_ChatReaction[playerGender][Random() % 4]);
            break;
        case ACTIVITY_CARD:
            StringExpandPlaceholders(gStringVar4, gTexts_UR_TrainerCardReaction[playerGender][Random() % 2]);
            break;
        default:
            StringExpandPlaceholders(gStringVar4, gText_UR_TrainerAppearsBusy);
            break;
        }
        return 0;
    }
}

static void nullsub_92(u8 windowId, u32 itemId, u8 y)
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
        UR_AddTextPrinterParameterized(windowId, 2, gText_UR_EggTrade, 0x44, y, colorIdx);
    }
    else
    {
        BlitMoveInfoIcon(windowId, type + 1, 0x44, y);
        UR_AddTextPrinterParameterized(windowId, 2, gSpeciesNames[species], 0x76, y, colorIdx);
        ConvertIntToDecimalStringN(level_t, level, STR_CONV_MODE_LEFT_ALIGN, 3);
        UR_AddTextPrinterParameterized(windowId, 2, level_t, GetStringRightAlignXOffset(2, level_t, 218), y, colorIdx);
    }
}

static void TradeBoardListMenuItemPrintFunc(u8 windowId, u32 itemId, u8 y)
{
    struct UnkStruct_Leader * leader = sUnionRoomMain.leader;
    struct GFtgtGname * rfu;
    s32 i, j;
    u8 uname[RFU_USER_NAME_LENGTH];

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
        for (i = 0; i < UROOM_MAX_GROUP_COUNT; i++)
        {
            if (leader->field_0->arr[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN && leader->field_0->arr[i].gname_uname.gname.species != SPECIES_NONE)
            {
                j++;
            }
            if (j == itemId + 1)
            {
                IntlConvPartnerUname(uname, leader->field_0->arr[i]);
                TradeBoardPrintItemInfo(windowId, y, &leader->field_0->arr[i].gname_uname.gname, uname, 6);
                break;
            }
        }
    }
}

static s32 GetIndexOfNthTradeBoardOffer(struct UnkStruct_x20 * x20, s32 n)
{
    s32 i;
    s32 j = 0;

    for (i = 0; i < UROOM_MAX_GROUP_COUNT; i++)
    {
        if (x20[i].groupScheduledAnim == UNION_ROOM_SPAWN_IN && x20[i].gname_uname.gname.species != SPECIES_NONE)
        {
            j++;
        }
        if (j == n + 1)
        {
            return i;
        }
    }

    return -1;
}

static s32 GetUnionRoomPlayerGender(s32 playerIdx, struct UnkStruct_Main0 * main0)
{
    return main0->arr[playerIdx].gname_uname.gname.playerGender;
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
    case ACTIVITY_BATTLE | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gTexts_UR_BattleDeclined[playerGender]);
        break;
    case ACTIVITY_CHAT | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gTexts_UR_ChatDeclined[playerGender]);
        break;
    case ACTIVITY_TRADE | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gText_UR_TradeOfferRejected);
        break;
    case ACTIVITY_CARD | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gTexts_UR_ShowTrainerCardDeclined[playerGender]);
        break;
    }
}

static void GetURoomActivityStartMsg(u8 *dst, u8 activity)
{
    u8 mpId = GetMultiplayerId();
    u8 gender = gLinkPlayers[mpId ^ 1].gender;

    switch (activity)
    {
    case ACTIVITY_BATTLE | IN_UNION_ROOM:
        StringCopy(dst, gTexts_UR_StartActivity[mpId][gender][0]);
        break;
    case ACTIVITY_TRADE | IN_UNION_ROOM:
        StringCopy(dst, gTexts_UR_StartActivity[mpId][gender][2]);
        break;
    case ACTIVITY_CHAT | IN_UNION_ROOM:
        StringCopy(dst, gTexts_UR_StartActivity[mpId][gender][1]);
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
    case ACTIVITY_BATTLE | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gText_UR_BattleChallenge);
        result = 1;
        break;
    case ACTIVITY_CHAT | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gText_UR_ChatInvitation);
        result = 1;
        break;
    case ACTIVITY_TRADE | IN_UNION_ROOM:
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
            StringCopy(dst, gText_UR_OfferToTradeEgg);
        }
        else
        {
            for (i = 0; i < RFU_CHILD_MAX; i++)
            {
                DynamicPlaceholderTextUtil_SetPlaceholderPtr(i, arg3->activityRequestStrbufs[i]);
            }
            DynamicPlaceholderTextUtil_ExpandPlaceholders(dst, gText_UR_OfferToTradeMon);
        }
        result = 1;
        break;
    case ACTIVITY_CARD | IN_UNION_ROOM:
        StringExpandPlaceholders(dst, gText_UR_ShowTrainerCard);
        result = 1;
        break;
    case IN_UNION_ROOM:
        // Chat dropped
        StringExpandPlaceholders(dst, gText_UR_ChatDropped);
        result = 2;
        break;
    }

    return result;
}

static bool32 PollPartnerYesNoResponse(struct UnkStruct_URoom * uroom)
{
    if (gRecvCmds[0][1] != 0)
    {
        if (gRecvCmds[0][1] == (ACTIVITY_ACCEPT | IN_UNION_ROOM))
        {
            uroom->partnerYesNoResponse = ACTIVITY_ACCEPT | IN_UNION_ROOM;
            return TRUE;
        }
        else if (gRecvCmds[0][1] == (ACTIVITY_DECLINE | IN_UNION_ROOM))
        {
            uroom->partnerYesNoResponse = ACTIVITY_DECLINE | IN_UNION_ROOM;
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

static void ResetUnionRoomTrade(struct UnionRoomTrade * uroomTrade)
{
    uroomTrade->field_0 = 0;
    uroomTrade->type = 0;
    uroomTrade->playerPersonality = 0;
    uroomTrade->playerSpecies = 0;
    uroomTrade->playerLevel = 0;
    uroomTrade->species = 0;
    uroomTrade->level = 0;
    uroomTrade->personality = 0;
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

static void HandleCancelTrade(bool32 unlockObjs)
{
    UR_BlankBg0();
    UnlockPlayerFieldControls();
    UnionRoom_UnlockPlayerAndChatPartner();
    sPlayerCurrActivity = 0;
    if (unlockObjs)
    {
        RfuUpdatePlayerGnameStateAndSend(sUnionRoomTrade.type, sUnionRoomTrade.playerSpecies, sUnionRoomTrade.playerLevel);
        UpdateGameDataWithActivitySpriteGendersFlag(IN_UNION_ROOM, 0, FALSE);
    }
}

static void UR_EnableScriptContext2AndFreezeObjectEvents(void)
{
    LockPlayerFieldControls();
    FreezeObjects_WaitForPlayer();
}

static u8 GetSinglePartnerSpriteGenderParam(s32 linkPlayer)
{
    u8 retval = 0x80;
    retval |= gLinkPlayers[linkPlayer].gender << 3;
    retval |= gLinkPlayers[linkPlayer].trainerId & 7;
    return retval;
}

static u8 GetActivePartnerSpriteGenderParam(struct UnkStruct_URoom * uroom)
{
    u8 retVal = 0x80;
    u8 i;

    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (uroom->field_C->arr[i].active)
        {
            retVal |= uroom->field_C->arr[i].gname_uname.gname.playerGender << 3;
            retVal |= uroom->field_C->arr[i].gname_uname.gname.unk_00.playerTrainerId[0] & 7;
            break;
        }
    }

    return retVal;
}

static void ViewURoomPartnerTrainerCard(u8 *unused, struct UnkStruct_URoom * uroom, bool8 parent_child)
{
    struct TrainerCard * trainerCard = &gTrainerCards[GetMultiplayerId() ^ 1];
    s32 i;
    s32 n;

    DynamicPlaceholderTextUtil_Reset();

    StringCopy(uroom->trainerCardStrbufs[0], gTrainerClassNames[GetUnionRoomTrainerClass()]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, uroom->trainerCardStrbufs[0]);

    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, trainerCard->rse.playerName);

    StringCopy(uroom->field_174, gTexts_UR_CardColor[trainerCard->rse.stars]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, uroom->field_174);

    ConvertIntToDecimalStringN(uroom->trainerCardStrbufs[2], trainerCard->rse.caughtMonsCount, STR_CONV_MODE_LEFT_ALIGN, 3);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, uroom->trainerCardStrbufs[2]);

    ConvertIntToDecimalStringN(uroom->trainerCardStrbufs[3], trainerCard->rse.playTimeHours, STR_CONV_MODE_LEFT_ALIGN, 3);
    ConvertIntToDecimalStringN(uroom->trainerCardStrbufs[4], trainerCard->rse.playTimeMinutes, STR_CONV_MODE_LEADING_ZEROS, 2);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(4, uroom->trainerCardStrbufs[3]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(5, uroom->trainerCardStrbufs[4]);

    DynamicPlaceholderTextUtil_ExpandPlaceholders(uroom->field_1A4, gText_UR_TrainerCardInfoPage1);
    StringCopy(gStringVar4, uroom->field_1A4);

    n = trainerCard->rse.linkBattleWins;
    if (n > 9999)
    {
        n = 9999;
    }
    ConvertIntToDecimalStringN(uroom->trainerCardStrbufs[0], n, STR_CONV_MODE_LEFT_ALIGN, 4);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, uroom->trainerCardStrbufs[0]);

    n = trainerCard->rse.linkBattleLosses;
    if (n > 9999)
    {
        n = 9999;
    }
    ConvertIntToDecimalStringN(uroom->trainerCardStrbufs[1], n, STR_CONV_MODE_LEFT_ALIGN, 4);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(2, uroom->trainerCardStrbufs[1]);

    ConvertIntToDecimalStringN(uroom->trainerCardStrbufs[2], trainerCard->rse.pokemonTrades, STR_CONV_MODE_LEFT_ALIGN, 5);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(3, uroom->trainerCardStrbufs[2]);

    for (i = 0; i < TRAINER_CARD_PROFILE_LENGTH; i++)
    {
        CopyEasyChatWord(uroom->trainerCardStrbufs[i + 3], trainerCard->rse.easyChatProfile[i]);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(i + 4, uroom->trainerCardStrbufs[i + 3]);
    }

    DynamicPlaceholderTextUtil_ExpandPlaceholders(uroom->field_1A4, gText_UR_TrainerCardInfoPage2);
    StringAppend(gStringVar4, uroom->field_1A4);

    if (parent_child == MODE_PARENT)
    {
        DynamicPlaceholderTextUtil_ExpandPlaceholders(uroom->field_1A4, gText_UR_FinishedCheckingPlayersTrainerCard);
        StringAppend(gStringVar4, uroom->field_1A4);
    }
    else if (parent_child == MODE_CHILD)
    {
        DynamicPlaceholderTextUtil_ExpandPlaceholders(uroom->field_1A4, gTexts_UR_GladToMeetYou[trainerCard->rse.gender]);
        StringAppend(gStringVar4, uroom->field_1A4);
    }
}
