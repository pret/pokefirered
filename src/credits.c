#include "global.h"
#include "malloc.h"
#include "bg.h"
#include "palette.h"
#include "gpu_regs.h"
#include "task.h"
#include "overworld.h"
#include "event_data.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "decompress.h"
#include "graphics.h"
#include "strings.h"
#include "menu.h"
#include "field_weather.h"
#include "trainer_pokemon_sprites.h"
#include "sound.h"
#include "constants/species.h"
#include "constants/maps.h"

#if defined(FIRERED)
#define TITLE_TEXT gString_PokemonFireRed_Staff
asm(".set TITLE_TEXT, gString_PokemonFireRed_Staff");
#elif defined(LEAFGREEN)
#define TITLE_TEXT gString_PokemonLeafGreen_Staff
asm(".set TITLE_TEXT, gString_PokemonLeafGreen_Staff");
#endif

enum CreditsSceneIdx
{
    CREDITSSCENE_INIT_WIN0 = 0,
    CREDITSSCENE_SETUP_DARKEN_EFFECT,
    CREDITSSCENE_OPEN_WIN0,
    CREDITSSCENE_LOAD_PLAYER_SPRITE_AT_INDIGO,
    CREDITSSCENE_PRINT_TITLE_STAFF,
    CREDITSSCENE_WAIT_TITLE_STAFF,
    CREDITSSCENE_EXEC_CMD,
    CREDITSSCENE_PRINT_ADDPRINTER1,
    CREDITSSCENE_PRINT_ADDPRINTER2,
    CREDITSSCENE_PRINT_DELAY,
    CREDITSSCENE_MAPNEXT_DESTROYWINDOW,
    CREDITSSCENE_MAPNEXT_LOADMAP,
    CREDITSSCENE_MAP_LOADMAP_CREATESPRITES,
    CREDITSSCENE_MON_DESTROY_ASSETS,
    CREDITSSCENE_MON_SHOW,
    CREDITSSCENE_THEEND_DESTROY_ASSETS,
    CREDITSSCENE_THEEND_SHOW,
    CREDITSSCENE_WAITBUTTON,
    CREDITSSCENE_TERMINATE,
};

enum CreditsScrCmd
{
    CREDITSSCRCMD_PRINT = 0,
    CREDITSSCRCMD_MAPNEXT,
    CREDITSSCRCMD_MAP,
    CREDITSSCRCMD_MON,
    CREDITSSCRCMD_THEENDGFX,
    CREDITSSCRCMD_WAITBUTTON
};

enum CreditsMon
{
    CREDITSMON_CHARIZARD = 0,
    CREDITSMON_VENUSAUR,
    CREDITSMON_BLASTOISE,
    CREDITSMON_PIKACHU
};

enum CreditsClosingText
{
    CREDITSCLOSING_ALLRIGHTSRESERVED = 0,
    CREDITSCLOSING_THEEND
};

enum CreditsString
{
    CREDITS_STRING_DIRECTOR = 0,
    CREDITS_STRING_ART_DIRECTOR_BATTLE_DIRECTOR,
    CREDITS_STRING_PROGRAM_LEADER_PLANNING_LEADER_GRAPHIC_DESIGN_LEADER,
    CREDITS_STRING_PROGRAMMERS,
    CREDITS_STRING_SYSTEM_PROGRAMMERS,
    CREDITS_STRING_GRAPHIC_DESIGNERS,
    CREDITS_STRING_GRAPHIC_DESIGNERS_2,
    CREDITS_STRING_MUSIC_COMPOSITION,
    CREDITS_STRING_SOUND_EFFECTS,
    CREDITS_STRING_GAME_DESIGNERS,
    CREDITS_STRING_GAME_DESIGNERS_2,
    CREDITS_STRING_GAME_SCENARIO,
    CREDITS_STRING_SCRIPT_DESIGNER_MAP_DESIGNER,
    CREDITS_STRING_PARAMETRIC_DESIGNERS,
    CREDITS_STRING_POKEDEX_TEXT,
    CREDITS_STRING_POKEMON_DESIGNERS,
    CREDITS_STRING_POKEMON_DESIGNERS_2,
    CREDITS_STRING_POKEMON_DESIGNERS_3,
    CREDITS_STRING_SUPPORTING_PROGRAMMERS,
    CREDITS_STRING_NCL_PRODUCT_TESTING,
    CREDITS_STRING_SPECIAL_THANKS,
    CREDITS_STRING_SPECIAL_THANKS_2,
    CREDITS_STRING_SPECIAL_THANKS_3,
    CREDITS_STRING_BRAILLE_CODE_CHECK,
    CREDITS_STRING_INFORMATION_SUPERVISORS,
    CREDITS_STRING_COORDINATORS,
    CREDITS_STRING_TASK_MANAGERS,
    CREDITS_STRING_PRODUCERS,
    CREDITS_STRING_EXECUTIVE_DIRECTOR,
    CREDITS_STRING_EXECUTIVE_PRODUCER,
    CREDITS_STRING_EXECUTIVE_PRODUCER_2,
    CREDITS_STRING_ENGLISH_VERSION_COORDINATORS,
    CREDITS_STRING_TRANSLATOR_TEXT_EDITOR,
    CREDITS_STRING_PROGRAMMERS_2,
    CREDITS_STRING_ENVIRONMENT_TOOL_PROGRAMMERS,
    CREDITS_STRING_NOA_PRODUCT_TESTING,
    CREDITS_STRING_BRAILLE_CODE_CHECK_2,
    CREDITS_STRING_BRAILLE_CODE_CHECK_3,
    CREDITS_STRING_SPECIAL_THANKS_4,
    CREDITS_STRING_SPECIAL_THANKS_5,
    CREDITS_STRING_BRAILLE_CODE_CHECK_4,
    CREDITS_STRING_GRAPHIC_DESIGNER,
    CREDITS_STRING_DUMMY
};

enum CreditsMap
{
    CREDITS_MAP_ROUTE23 = 0,
    CREDITS_MAP_VIRIDIAN_CITY,
    CREDITS_MAP_PEWTER_CITY,
    CREDITS_MAP_CERULEAN_CITY,
    CREDITS_MAP_ROUTE25,
    CREDITS_MAP_VERMILION_CITY,
    CREDITS_MAP_ROUTE10,
    CREDITS_MAP_CELADON_CITY,
    CREDITS_MAP_SAFFRON_CITY_DUPLICATE,
    CREDITS_MAP_ROUTE17,
    CREDITS_MAP_FUCHSIA_CITY,
    CREDITS_MAP_CINNABAR_ISLAND,
    CREDITS_MAP_ROUTE21_NORTH
};

struct CreditsResources
{
    u8 mainseqno;
    u8 subseqno;
    u8 taskId;
    u16 timer;
    u16 scrcmdidx;
    u8 canSpeedThrough;
    u8 whichMon;
    u8 windowId;
    bool8 windowIsActive;
    u16 creditsMonTimer;
    u16 unk_0E;
    u8 filler_10[12];
    u8 ovwldseqno;
    u8 unk_1D;
};

struct CreditsScrcmd
{
    u8 cmd;
    u8 param;
    u16 duration;
};

struct CreditsTextHeader
{
    const u8 * unk_0;
    const u8 * unk_4;
    bool8 unk_8;
};

struct CompressedGraphicsHeader
{
    const u8 * tiles;
    const u8 * map;
    const u16 * palette;
};

struct CreditsTaskData
{
    u8 spriteMoveCmd;
    u8 playerSpriteId;
    u16 playerTilesTag;
    u16 field_04;
    u8 groundSpriteId;
    u16 groundTilesTag;
    u16 field_0A;
};

static EWRAM_DATA struct CreditsResources * sCreditsMgr = NULL;

static void CB2_Credits(void);
static s32 RollCredits(void);
static bool32 DoCreditsMonScene(void);
static bool32 DoCopyrightOrTheEndGfxScene(void);
static void DestroyPlayerOrRivalSprite(void);
static void LoadPlayerOrRivalSprite(u8 a0);

static const struct BgTemplate sBgTemplates_MonSceneOrTheEnd[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = FALSE,
        .priority = 0,
        .baseTile = 0x0
    }, {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 23,
        .screenSize = 0,
        .paletteMode = FALSE,
        .priority = 1,
        .baseTile = 0x0
    }, {
        .bg = 2,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 1,
        .paletteMode = TRUE,
        .priority = 2,
        .baseTile = 0x0
    }
};

static const struct WindowTemplate sWindowTemplates_Charizard[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x09,
        .tilemapTop = 0x03,
        .width = 0x0c,
        .height = 0x0d,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates_Venusaur[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x09,
        .tilemapTop = 0x05,
        .width = 0x0c,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates_Blastoise[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x04,
        .width = 0x0a,
        .height = 0x0c,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates_Pikachu[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x09,
        .tilemapTop = 0x04,
        .width = 0x0c,
        .height = 0x0c,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const u16 sPalette_OneBlackThenAllWhite[] = INCBIN_U16("data/credits/unk_840C630.gbapal");
static const u32 sAffineCircleGfx[] = INCBIN_U32("data/credits/unk_840C650.8bpp.lz");
static const u32 sAffineCircleMap[] = INCBIN_U32("data/credits/unk_840CA54.bin.lz");
static const u32 sWindow1Map_Charizard[] = INCBIN_U32("data/credits/unk_840CB8C.bin.lz");
static const u32 sWindow2Map_Charizard[] = INCBIN_U32("data/credits/unk_840D228.bin.lz");
static const u32 sUnusedTilemap[] = INCBIN_U32("data/credits/unk_840DC0C.bin.lz");
static const u32 sWindow1Map_Venusaur[] = INCBIN_U32("data/credits/unk_840E158.bin.lz");
static const u32 sWindow2Map_Venusaur[] = INCBIN_U32("data/credits/unk_840E904.bin.lz");
static const u32 sWindow1Map_Blastoise[] = INCBIN_U32("data/credits/unk_840F240.bin.lz");
static const u32 sWindow2Map_Blastoise[] = INCBIN_U32("data/credits/unk_840F944.bin.lz");
static const u32 sWindow1Map_Pikachu[] = INCBIN_U32("data/credits/unk_8410198.bin.lz");
static const u32 sWindow2Map_Pikachu[] = INCBIN_U32("data/credits/unk_84105B4.bin.lz");

static const u32 filler_8410AFC = 0xF0;

static const u16 sTheEndGfxPal[] = INCBIN_U16("data/credits/unk_8410B20.gbapal");
static const u8 sTheEndGfxTiles[] = INCBIN_U8("data/credits/unk_8410B20.4bpp.lz");
static const u8 sTheEndGfxMap[] = INCBIN_U8("data/credits/unk_8410B20.bin.lz");

static const struct CompressedGraphicsHeader sCopyrightOrTheEndGfxHeaders[] = {
    {
        .tiles = gCreditsAllRightsReservedGfxTiles,
        .map = gCreditsAllRightsReservedGfxMap,
        .palette = gCreditsAllRightsReservedGfxPal
    }, {
        .tiles = sTheEndGfxTiles,
        .map = sTheEndGfxMap,
        .palette = sTheEndGfxPal
    }
};

#define CREDITS_PRINT(text, duration) { CREDITSSCRCMD_PRINT, CREDITS_STRING_##text, duration }
#define CREDITS_MAPNEXT(map, duration) { CREDITSSCRCMD_MAPNEXT, CREDITS_MAP_##map, duration }
#define CREDITS_MAP(map, duration) { CREDITSSCRCMD_MAP, CREDITS_MAP_##map, duration }
#define CREDITS_MON(mon) { CREDITSSCRCMD_MON, CREDITSMON_##mon }
#define CREDITS_THEENDGFX(idx, duration) { CREDITSSCRCMD_THEENDGFX, CREDITSCLOSING_##idx, duration }
#define CREDITS_WAITBUTTON(time) { CREDITSSCRCMD_WAITBUTTON, .duration = time }

static const struct CreditsScrcmd sCreditsScript[] = {
    CREDITS_MAPNEXT(ROUTE23, 16),
    CREDITS_PRINT(DIRECTOR, 300),
    CREDITS_PRINT(ART_DIRECTOR_BATTLE_DIRECTOR, 300),
    CREDITS_PRINT(PROGRAM_LEADER_PLANNING_LEADER_GRAPHIC_DESIGN_LEADER, 300),
    CREDITS_PRINT(DUMMY, 60),
    CREDITS_MAPNEXT(VIRIDIAN_CITY, 0),
    CREDITS_PRINT(PROGRAMMERS, 211),
    CREDITS_PRINT(SYSTEM_PROGRAMMERS, 211),
    CREDITS_PRINT(GRAPHIC_DESIGNERS, 211),
    CREDITS_MAPNEXT(PEWTER_CITY, 0),
    CREDITS_PRINT(GRAPHIC_DESIGNERS_2, 211),
    CREDITS_PRINT(MUSIC_COMPOSITION, 210),
    CREDITS_PRINT(SOUND_EFFECTS, 210),
    CREDITS_MON(CHARIZARD),
    CREDITS_MAP(CERULEAN_CITY, 16),
    CREDITS_PRINT(GAME_DESIGNERS, 211),
    CREDITS_PRINT(GAME_DESIGNERS_2, 210),
    CREDITS_PRINT(GAME_SCENARIO, 210),
    CREDITS_MAPNEXT(ROUTE25, 16),
    CREDITS_PRINT(SCRIPT_DESIGNER_MAP_DESIGNER, 211),
    CREDITS_PRINT(PARAMETRIC_DESIGNERS, 210),
    CREDITS_PRINT(POKEDEX_TEXT, 210),
    CREDITS_MAPNEXT(VERMILION_CITY, 16),
    CREDITS_PRINT(POKEMON_DESIGNERS, 211),
    CREDITS_PRINT(POKEMON_DESIGNERS_2, 210),
    CREDITS_PRINT(POKEMON_DESIGNERS_3, 210),
    CREDITS_MON(VENUSAUR),
    CREDITS_MAP(ROUTE10, 16),
    CREDITS_PRINT(SUPPORTING_PROGRAMMERS, 211),
    CREDITS_PRINT(NCL_PRODUCT_TESTING, 210),
    CREDITS_PRINT(SPECIAL_THANKS, 210),
    CREDITS_MAPNEXT(CELADON_CITY, 16),
    CREDITS_PRINT(SPECIAL_THANKS_2, 221),
    CREDITS_PRINT(SPECIAL_THANKS_3, 221),
    CREDITS_PRINT(BRAILLE_CODE_CHECK, 221),
    CREDITS_PRINT(INFORMATION_SUPERVISORS, 221),
    CREDITS_PRINT(DUMMY, 51),
    CREDITS_MAPNEXT(SAFFRON_CITY_DUPLICATE, 16),
    CREDITS_PRINT(COORDINATORS, 211),
    CREDITS_PRINT(TASK_MANAGERS, 210),
    CREDITS_PRINT(PRODUCERS, 210),
    CREDITS_MON(BLASTOISE),
    CREDITS_MAP(ROUTE17, 16),
    CREDITS_PRINT(EXECUTIVE_DIRECTOR, 331),
    CREDITS_PRINT(EXECUTIVE_PRODUCER, 331),
    CREDITS_PRINT(EXECUTIVE_PRODUCER_2, 331),
    CREDITS_MAPNEXT(FUCHSIA_CITY, 16),
    CREDITS_PRINT(ENGLISH_VERSION_COORDINATORS, 221),
    CREDITS_PRINT(TRANSLATOR_TEXT_EDITOR, 221),
    CREDITS_PRINT(PROGRAMMERS_2, 221),
    CREDITS_PRINT(ENVIRONMENT_TOOL_PROGRAMMERS, 221),
    CREDITS_PRINT(DUMMY, 52),
    CREDITS_MAPNEXT(CINNABAR_ISLAND, 16),
    CREDITS_PRINT(GRAPHIC_DESIGNER, 210),
    CREDITS_PRINT(NOA_PRODUCT_TESTING, 210),
    CREDITS_PRINT(BRAILLE_CODE_CHECK_2, 211),
    CREDITS_MON(PIKACHU),
    CREDITS_MAP(ROUTE21_NORTH, 16),
    CREDITS_PRINT(BRAILLE_CODE_CHECK_3, 221),
    CREDITS_PRINT(BRAILLE_CODE_CHECK_4, 221),
    CREDITS_PRINT(SPECIAL_THANKS_4, 221),
    CREDITS_PRINT(SPECIAL_THANKS_5, 221),
    CREDITS_PRINT(DUMMY, 52),
    CREDITS_THEENDGFX(ALLRIGHTSRESERVED, 224),
    CREDITS_THEENDGFX(THEEND, 240),
    CREDITS_WAITBUTTON(600)
};

static const ALIGNED(4) u8 sTextColor_Unused[3] = {0, 1, 2};
static const ALIGNED(4) u8 sTextColor_Header[3] = {0, 5, 2};
static const ALIGNED(4) u8 sTextColor_Regular[3] = {0, 1, 2};

static const struct WindowTemplate sCreditsWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 4,
    .width = 30,
    .height = 12,
    .paletteNum = 15,
    .baseBlock = 0x008
};

static const u16 sMalePlayerSpritePal[] = INCBIN_U16("data/credits/unk_8410E10.gbapal");
static const u32 sMalePlayerSpriteGfx[] = INCBIN_U32("data/credits/unk_8410E30.4bpp.lz");
static const u16 sFemalePlayerSpritePal[] = INCBIN_U16("data/credits/unk_8411BF8.gbapal");
static const u32 sFemalePlayerSpriteGfx[] = INCBIN_U32("data/credits/unk_8411C18.4bpp.lz");
static const u16 sRivalSpritePal[] = INCBIN_U16("data/credits/unk_84129A0.gbapal");
static const u32 sRivalSpriteGfx[] = INCBIN_U32("data/credits/unk_84129C0.4bpp.lz");
static const u16 sGroundSpritePal_Grass[] = INCBIN_U16("data/credits/unk_8413318.gbapal");
static const u32 sGroundSpriteGfx_Grass[] = INCBIN_U32("data/credits/unk_8413338.4bpp.lz");
static const u16 sGroundSpritePal_Dirt[] = INCBIN_U16("data/credits/unk_8413854.gbapal");
static const u32 sGroundSpriteGfx_Dirt[] = INCBIN_U32("data/credits/unk_8413874.4bpp.lz");
static const u16 sGroundSpritePal_City[] = INCBIN_U16("data/credits/unk_8413D98.gbapal");
static const u32 sGroundSpriteGfx_City[] = INCBIN_U32("data/credits/unk_8413DB8.4bpp.lz");

static const u16 sPlayerRivalSpriteParams[][3] = {
    { 0, 3, 1 },
    { 0, 2, 0 },
    { 0, 3, 0 },
    { 1, 1, 2 },
    { 0, 0, 3 }
};

static const struct OamData sOamData_PlayerOrRival = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .mosaic = FALSE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 15
};

const union AnimCmd sAnimCmds_PlayerOrRival[] = {
    ANIMCMD_FRAME(0x000, 8),
    ANIMCMD_FRAME(0x040, 8),
    ANIMCMD_FRAME(0x080, 8),
    ANIMCMD_FRAME(0x0C0, 8),
    ANIMCMD_FRAME(0x100, 8),
    ANIMCMD_FRAME(0x140, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sAnimCmdTable_PlayerOrRival[] = {
    sAnimCmds_PlayerOrRival
};

static const struct SpriteTemplate sPlayerOrRivalSpriteTemplate = {
    .oam = &sOamData_PlayerOrRival,
    .anims = sAnimCmdTable_PlayerOrRival,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_Ground = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .mosaic = FALSE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 14
};

const union AnimCmd sAnimCmds_GroundRunning[] = {
    ANIMCMD_FRAME(0x00, 8),
    ANIMCMD_FRAME(0x20, 8),
    ANIMCMD_FRAME(0x40, 8),
    ANIMCMD_FRAME(0x60, 8),
    ANIMCMD_FRAME(0x80, 8),
    ANIMCMD_FRAME(0xA0, 8),
    ANIMCMD_FRAME(0xC0, 8),
    ANIMCMD_FRAME(0xE0, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sAnimCmds_GroundStatic[] = {
    ANIMCMD_FRAME(0x00, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sAnimCmdTable_GroundRunning[] = {
    sAnimCmds_GroundRunning
};

const union AnimCmd *const sAnimCmdTable_GroundStatic[] = {
    sAnimCmds_GroundStatic
};

static const struct SpriteTemplate sGroundSpriteTemplate_Running = {
    .oam = &sOamData_Ground,
    .anims = sAnimCmdTable_GroundRunning,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sGroundSpriteTemplate_Static = {
    .oam = &sOamData_Ground,
    .anims = sAnimCmdTable_GroundStatic,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct CreditsOverworldCmd sOverworldCmd_Route23[] = {
    { 0x00fe, MAP_GROUP(ROUTE23), MAP_NUM(ROUTE23) },
    { 0x000b, 0x006b, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_ViridianCity[] = {
    { 0x00fe, MAP_GROUP(VIRIDIAN_CITY), MAP_NUM(VIRIDIAN_CITY) },
    { 0x001e, 0x0022, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_PewterCity[] = {
    { 0x00fe, MAP_GROUP(PEWTER_CITY), MAP_NUM(PEWTER_CITY) },
    { 0x0014, 0x001a, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_CeruleanCity[] = {
    { 0x00fe, MAP_GROUP(CERULEAN_CITY), MAP_NUM(CERULEAN_CITY) },
    { 0x0008, 0x0006, 0x0001 },
    { 0x0001, 0x0001, 0x0500 }, // Scroll right and down
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_Route25[] = {
    { 0x00fe, MAP_GROUP(ROUTE25), MAP_NUM(ROUTE25) },
    { 0x0019, 0x0006, 0x0001 },
    { 0x0001, 0x0000, 0x0500 }, // Scroll right
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_VermilionCity[] = {
    { 0x00fe, MAP_GROUP(VERMILION_CITY), MAP_NUM(VERMILION_CITY) },
    { 0x0009, 0x0007, 0x0001 },
    { 0x0001, 0x0001, 0x0500 }, // Scroll right and down
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_Route10[] = {
    { 0x00fe, MAP_GROUP(ROUTE10), MAP_NUM(ROUTE10) },
    { 0x000b, 0x0044, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_CeladonCity[] = {
    { 0x00fe, MAP_GROUP(CELADON_CITY), MAP_NUM(CELADON_CITY) },
    { 0x0030, 0x0010, 0x0001 },
    { 0xffff, 0x0000, 0x0500 }, // Scroll left
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_SaffronCity[] = {
    { 0x00fe, MAP_GROUP(SAFFRON_CITY_DUPLICATE), MAP_NUM(SAFFRON_CITY_DUPLICATE) },
    { 0x0027, 0x0005, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_Route17[] = {
    { 0x00fe, MAP_GROUP(ROUTE17), MAP_NUM(ROUTE17) },
    { 0x0007, 0x002b, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_FuchsiaCity[] = {
    { 0x00fe, MAP_GROUP(FUCHSIA_CITY), MAP_NUM(FUCHSIA_CITY) },
    { 0x001c, 0x0005, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_CinnabarIsland[] = {
    { 0x00fe, MAP_GROUP(CINNABAR_ISLAND), MAP_NUM(CINNABAR_ISLAND) },
    { 0x000d, 0x0011, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd }
};

static const struct CreditsOverworldCmd sOverworldCmd_Route21[] = {
    { 0x00fe, MAP_GROUP(ROUTE21_NORTH), MAP_NUM(ROUTE21_NORTH) },
    { 0x0008, 0x0014, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd },
};

static const struct CreditsOverworldCmd *const sOverworldMapScenes[] = {
    sOverworldCmd_Route23,
    sOverworldCmd_ViridianCity,
    sOverworldCmd_PewterCity,
    sOverworldCmd_CeruleanCity,
    sOverworldCmd_Route25,
    sOverworldCmd_VermilionCity,
    sOverworldCmd_Route10,
    sOverworldCmd_CeladonCity,
    sOverworldCmd_SaffronCity,
    sOverworldCmd_Route17,
    sOverworldCmd_FuchsiaCity,
    sOverworldCmd_CinnabarIsland,
    sOverworldCmd_Route21
};

static const struct CreditsTextHeader sCreditsTexts[] = {
    { gCreditsString_Director, gCreditsString_Junichi_Masuda, FALSE },
    { gCreditsString_Art_Director_Battle_Director, gCreditsString_Ken_Sugimori_Shigeki_Morimoto, FALSE },
    { gCreditsString_Program_Leader_Planning_Leader_Graphic_Design_Leader, gCreditsString_Tetsuya_Watanabe_Koji_Nishino_Takao_Unno, FALSE },
    { gCreditsString_Programmers, gCreditsString_Hiroyuki_Nakamura_Masao_Taya_Satoshi_Nohara_Miyuki_Iwasawa_Daisuke_Goto, FALSE },
    { gCreditsString_System_Programmers, gCreditsString_Tetsuya_Watanabe_Akito_Mori_Hisashi_Sogabe_Sousuke_Tamada, TRUE  },
    { gCreditsString_Graphic_Designers, gCreditsString_Takao_Unno_Asuka_Iwashita_Kanako_Eo_Hiroki_Fuchino, TRUE  },
    { gCreditsString_Graphic_Designers_2, gCreditsString_Ken_Sugimori_Hironobu_Yoshida, TRUE  },
    { gCreditsString_Music_Composition, gCreditsString_Go_Ichinose_Junichi_Masuda, TRUE  },
    { gCreditsString_Sound_Effects, gCreditsString_Go_Ichinose, FALSE },
    { gCreditsString_Game_Designers, gCreditsString_Junichi_Masuda_Koji_Nishino_Tetsuji_Ohta, FALSE },
    { gCreditsString_Game_Designers_2, gCreditsString_Hitomi_Sato_Shigeru_Ohmori_Tadashi_Takahashi, FALSE },
    { gCreditsString_Game_Scenario, gCreditsString_Hitomi_Sato_Satoshi_Tajiri, TRUE  },
    { gCreditsString_Script_Designer_Map_Designer, gCreditsString_Satoshi_Nohara_Shigeru_Ohmori, FALSE },
    { gCreditsString_Parametric_Designers, gCreditsString_Koji_Nishino_Tetsuji_Ohta_Shigeki_Morimoto, FALSE },
    { gCreditsString_POKeDEX_Text, gCreditsString_Kenji_Matsushima, FALSE },
    { gCreditsString_POKeMON_Designers, gCreditsString_Ken_Sugimori_Motofumi_Fujiwara_Shigeki_Morimoto_Hironobu_Yoshida, TRUE  },
    { gCreditsString_POKeMON_Designers_2, gCreditsString_Satoshi_Ohta_Asuka_Iwashita_Takao_Unno_Kanako_Eo_Aimi_Tomita, FALSE },
    { gCreditsString_POKeMON_Designers_3, gCreditsString_Atsuko_Nishida_Muneo_Saito_Rena_Yoshikawa_Jun_Okutani, TRUE  },
    { gCreditsString_Supporting_Programmers, gCreditsString_Teruyuki_Yoshioka_Takao_Nakano_Satoshi_Mitsuhara_Daisuke_Hoshino, FALSE },
    { gCreditsString_NCL_Product_Testing, gCreditsString_NCL_Super_Mario_Club, FALSE },
    { gCreditsString_Special_Thanks, gCreditsString_Hiro_Nakamura_Hiroyuki_Uesugi_Teruki_Murakawa_Kazuya_Suyama, FALSE },
    { gCreditsString_Special_Thanks_2, gCreditsString_Kenji_Tominaga_Kenjiro_Ito_Tomotaka_Komura_Michiko_Takizawa, FALSE },
    { gCreditsString_Special_Thanks_3, gCreditsString_Makiko_Takada_Mikiko_Ohashi_Shusaku_Egami_Takanao_Kondo_Rui_Kawaguchi, FALSE },
    { gCreditsString_Braille_Code_Check, gCreditsString_Japan_Braille_Library, FALSE },
    { gCreditsString_Information_Supervisors, gCreditsString_Hiroki_Enomoto_Kazuyuki_Terada_Yuri_Sakurai_Yumi_Funasaka_Naoko_Yanase, FALSE },
    { gCreditsString_Coordinators, gCreditsString_Azusa_Tajima_Akira_Kinashi_Kazuki_Yoshihara_Retsuji_Nomoto, FALSE },
    { gCreditsString_Task_Managers, gCreditsString_Hitoshi_Yamagami_Gakuji_Nomoto, TRUE  },
    { gCreditsString_Producers, gCreditsString_Hiroyuki_Jinnai_Takehiro_Izushi_Hiroaki_Tsuru, FALSE },
    { gCreditsString_Executive_Director, gCreditsString_Satoshi_Tajiri, FALSE },
    { gCreditsString_Executive_Producer, gCreditsString_Satoru_Iwata, FALSE },
    { gCreditsString_Executive_Producer_2, gCreditsString_Tsunekaz_Ishihara, FALSE },
    { gCreditsString_English_Version_Coordinators, gCreditsString_Hiro_Nakamura_Seth_McMahill, FALSE },
    { gCreditsString_Translator_Text_Editor, gCreditsString_Nob_Ogasawara_Teresa_Lillygren, FALSE },
    { gCreditsString_Programmers_2, gCreditsString_Teruki_Murakawa_Souichi_Yamamoto_Yuichiro_Ito_Akira_Kinashi, FALSE },
    { gCreditsString_Environment_Tool_Programmers, gCreditsString_Teruki_Murakawa_Souichi_Yamamoto_Kimiko_Nakamichi, TRUE  },
    { gCreditsString_NOA_Product_Testing, gCreditsString_Thomas_Hertzog_Kathy_Huguenard_Mika_Kurosawa, TRUE  },
    { gCreditsString_Braille_Code_Check_2, gCreditsString_National_Federation_of_the_Blind_Patricia_A_Maurer_Japan_Braille_Library_European_Blind_Union, TRUE  },
    { gCreditsString_Braille_Code_Check_3, gCreditsString_National_Information_Library_Service_Margaret_Campion, TRUE  },
    { gCreditsString_Special_Thanks_4, gCreditsString_Takehiro_Izushi_Motoyasu_Tojima_Hitoshi_Yamagami_Hiroyuki_Uesugi, FALSE },
    { gCreditsString_Special_Thanks_5, gCreditsString_Nicola_Pratt_Barlow_Shellie_Dow_Anthony_Howitt_Naoko_Saeki_Kyoko_Onishi, FALSE },
    { gCreditsString_Braille_Code_Check_4, gCreditsString_The_Royal_New_Zealand_Foundation_of_the_Blind_Greg_Moran, FALSE },
    { gCreditsString_Graphic_Designer, gCreditsString_Akira_Kinashi, FALSE },
    { gString_Dummy, gString_Dummy, FALSE }
};

void Special_Credits(void)
{
    sCreditsMgr = AllocZeroed(sizeof(*sCreditsMgr));
    ResetTasks();
    sCreditsMgr->taskId = 0xFF;
    sCreditsMgr->unk_1D = 0;
    ResetSpriteData();
    SetMainCallback2(CB2_Credits);
}

static void CB2_Credits(void)
{
    switch (RollCredits())
    {
    case 0:
        RunTasks();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
        break;
    case 1:
        if (sCreditsMgr->unk_1D & 1)
        {
            Overworld_CreditsMainCB();
        }
        else
        {
            RunTasks();
            AnimateSprites();
            BuildOamBuffer();
            UpdatePaletteFade();
        }
        sCreditsMgr->unk_1D++;
        break;
    case 2:
        FlagClear(0x4000);
        gDisableMapMusicChangeOnMapLoad = MUSIC_DISABLE_OFF;
        Free(sCreditsMgr);
        SoftReset(RESET_ALL);
        // noreturn
    }
}

static void SwitchWin1OffWin0On(void)
{
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
    SetGpuReg(REG_OFFSET_WININ, 0x1F3F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x000E);
}

static void InitBgDarkenEffect(void)
{
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 4));
    SetGpuReg(REG_OFFSET_BLDY, 10);
}

static void CreateCreditsWindow(void)
{
    sCreditsMgr->windowId = AddWindow(&sCreditsWindowTemplate);
    FillWindowPixelBuffer(sCreditsMgr->windowId, PIXEL_FILL(0));
    PutWindowTilemap(sCreditsMgr->windowId);
    CopyWindowToVram(sCreditsMgr->windowId, 3);
    sCreditsMgr->windowIsActive = TRUE;
}

static void DestroyCreditsWindow(void)
{
    if (sCreditsMgr->windowIsActive)
    {
        RemoveWindow(sCreditsMgr->windowId);
        CleanupOverworldWindowsAndTilemaps();
        sCreditsMgr->windowIsActive = FALSE;
    }
}

static bool32 DoOverworldMapScrollScene(UNUSED u8 unused)
{
    switch (sCreditsMgr->subseqno)
    {
    case 0:
        FlagSet(0x4000);
        gDisableMapMusicChangeOnMapLoad = MUSIC_DISABLE_KEEP;
        sCreditsMgr->ovwldseqno = 0;
        sCreditsMgr->subseqno++;
        // fallthrough
    case 1:
        if (!Overworld_DoScrollSceneForCredits(&sCreditsMgr->ovwldseqno, sOverworldMapScenes[sCreditsMgr->whichMon], 0))
            return FALSE;
        CreateCreditsWindow();
        SetGpuReg(REG_OFFSET_WIN0H, 0xF0);
        SetGpuReg(REG_OFFSET_WIN0V, 0x247C);
        SwitchWin1OffWin0On();
        InitBgDarkenEffect();
        Menu_LoadStdPalAt(0xF0);
        gPlttBufferUnfaded[0xFF] = RGB_BLACK;
        gPlttBufferFaded[0xFF] = RGB_BLACK;
        return TRUE;
    default:
        return FALSE;
    }
}

#ifdef NONMATCHING
static s32 RollCredits(void)
{
    u16 win0v[8];

    switch (sCreditsMgr->mainseqno)
    {
    case CREDITSSCENE_INIT_WIN0:
        SwitchWin1OffWin0On();
        SetGpuReg(REG_OFFSET_WIN0H, 0xF0);
        SetGpuReg(REG_OFFSET_WIN0V, 0x4F51);
        sCreditsMgr->mainseqno = CREDITSSCENE_SETUP_DARKEN_EFFECT;
        return 0;
    case CREDITSSCENE_SETUP_DARKEN_EFFECT:
        InitBgDarkenEffect();
        CreateCreditsWindow();
        Menu_LoadStdPalAt(0xF0);
        gPlttBufferUnfaded[0xFF] = RGB_BLACK;
        gPlttBufferFaded[0xFF] = RGB_BLACK;
        sCreditsMgr->mainseqno = CREDITSSCENE_OPEN_WIN0;
        return 0;
    case CREDITSSCENE_OPEN_WIN0:
        win0v[0] = GetGpuReg(REG_OFFSET_WIN0V) >> 8;
        win0v[1] = GetGpuReg(REG_OFFSET_WIN0V) & 0xFF;
        if (win0v[0] == 0x24)
        {
            sCreditsMgr->timer = 0;
            sCreditsMgr->mainseqno = CREDITSSCENE_LOAD_PLAYER_SPRITE_AT_INDIGO;
        }
        else
        {
            win0v[0]--;
            win0v[1]++;
            SetGpuReg(REG_OFFSET_WIN0V, win0v[1] + (win0v[0] << 8));
        }
        return 0;
    case CREDITSSCENE_LOAD_PLAYER_SPRITE_AT_INDIGO:
        if (sCreditsMgr->timer == 0)
        {
            LoadPlayerOrRivalSprite(0);
            sCreditsMgr->timer = 100;
            sCreditsMgr->mainseqno = CREDITSSCENE_PRINT_TITLE_STAFF;
        }
        else
        {
            sCreditsMgr->timer--;
        }
        return 0;
    case CREDITSSCENE_PRINT_TITLE_STAFF:
        if (sCreditsMgr->timer == 0)
        {
            sCreditsMgr->timer = 360;
            AddTextPrinterParameterized4(sCreditsMgr->windowId, 1, 0x08, 0x29, 1, 2, sTextColor_Header, 0, TITLE_TEXT);
            sCreditsMgr->mainseqno = CREDITSSCENE_WAIT_TITLE_STAFF;
        }
        else
        {
            sCreditsMgr->timer--;
        }
        return 0;
    case CREDITSSCENE_WAIT_TITLE_STAFF:
        if (sCreditsMgr->timer != 0)
        {
            sCreditsMgr->timer--;
        }
        else
        {
            DestroyCreditsWindow();
            sCreditsMgr->mainseqno = CREDITSSCENE_EXEC_CMD;
            sCreditsMgr->timer = 0;
            sCreditsMgr->scrcmdidx = 0;
        }
        return 0;
    case CREDITSSCENE_EXEC_CMD:
        if (sCreditsMgr->timer != 0)
        {
            sCreditsMgr->timer--;
            return sCreditsMgr->canSpeedThrough;
        }
        else
        {
            switch (sCreditsScript[sCreditsMgr->scrcmdidx].cmd)
            {
            case CREDITSSCRCMD_PRINT:
                BeginNormalPaletteFade(0x00008000, 0, 0, 16, RGB_BLACK);
                sCreditsMgr->mainseqno = CREDITSSCENE_PRINT_ADDPRINTER1;
                FillWindowPixelBuffer(sCreditsMgr->windowId, PIXEL_FILL(0));
                return sCreditsMgr->canSpeedThrough;
            case CREDITSSCRCMD_MAPNEXT:
                sCreditsMgr->mainseqno = CREDITSSCENE_MAPNEXT_DESTROYWINDOW;
                sCreditsMgr->whichMon = sCreditsScript[sCreditsMgr->scrcmdidx].param;
                FieldWeather_StartFadingOutCreditsMap(1, 0, 0x3FFFFFFF);
                break;
            case CREDITSSCRCMD_MAP:
                sCreditsMgr->mainseqno = CREDITSSCENE_MAP_LOADMAP_CREATESPRITES;
                sCreditsMgr->whichMon = sCreditsScript[sCreditsMgr->scrcmdidx].param;
                break;
            case CREDITSSCRCMD_MON:
                sCreditsMgr->mainseqno = CREDITSSCENE_MON_DESTROY_ASSETS;
                sCreditsMgr->whichMon = sCreditsScript[sCreditsMgr->scrcmdidx].param;
                fade_screen(1, 0);
                break;
            case CREDITSSCRCMD_THEENDGFX:
                sCreditsMgr->mainseqno = CREDITSSCENE_THEEND_DESTROY_ASSETS;
                sCreditsMgr->whichMon = sCreditsScript[sCreditsMgr->scrcmdidx].param;
                BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 16, RGB_BLACK);
                break;
            case CREDITSSCRCMD_WAITBUTTON:
                sCreditsMgr->mainseqno = CREDITSSCENE_WAITBUTTON;
                break;
            }
            sCreditsMgr->timer = sCreditsScript[sCreditsMgr->scrcmdidx].duration;
            sCreditsMgr->scrcmdidx++;
            return 0;
        }
    case CREDITSSCENE_PRINT_ADDPRINTER1:
        if (!gPaletteFade.active)
        {
            win0v[0] = sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].unk_8; // unused
            AddTextPrinterParameterized4(sCreditsMgr->windowId, 1, 2, 6, 0, 0, sTextColor_Header, -1, sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].unk_0);
            sCreditsMgr->mainseqno = CREDITSSCENE_PRINT_ADDPRINTER2;
        }
        return sCreditsMgr->canSpeedThrough;
    case CREDITSSCENE_PRINT_ADDPRINTER2:
        win0v[0] = sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].unk_8;
        AddTextPrinterParameterized4(sCreditsMgr->windowId, 2, 8, 6, 0, 0, sTextColor_Header, -1, sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].unk_4);
        sCreditsMgr->mainseqno = CREDITSSCENE_PRINT_DELAY;
        return sCreditsMgr->canSpeedThrough;
    case CREDITSSCENE_PRINT_DELAY:
        CopyWindowToVram(sCreditsMgr->windowId, 2);
        sCreditsMgr->timer = sCreditsScript[sCreditsMgr->scrcmdidx].duration;
        sCreditsMgr->scrcmdidx++;
        BeginNormalPaletteFade(0x00008000, 0, 16, 0, RGB_BLACK);
        sCreditsMgr->mainseqno = CREDITSSCENE_EXEC_CMD;
        return sCreditsMgr->canSpeedThrough;
    case CREDITSSCENE_MAPNEXT_DESTROYWINDOW:
        if (!gPaletteFade.active)
        {
            DestroyCreditsWindow();
            sCreditsMgr->subseqno = 0;
            sCreditsMgr->mainseqno = CREDITSSCENE_MAPNEXT_LOADMAP;
        }
        return 0;
    case CREDITSSCENE_MAPNEXT_LOADMAP:
        if (DoOverworldMapScrollScene(sCreditsMgr->whichMon))
        {
            sCreditsMgr->canSpeedThrough = 1;
            sCreditsMgr->mainseqno = CREDITSSCENE_EXEC_CMD;
        }
        return 0;
    case CREDITSSCENE_MAP_LOADMAP_CREATESPRITES:
        if (!gPaletteFade.active)
        {
            DestroyCreditsWindow();
            sCreditsMgr->subseqno = 0;
            while (!DoOverworldMapScrollScene(sCreditsMgr->whichMon))
            {}
            switch (sCreditsMgr->whichMon)
            {
            case 3:
            default:
                win0v[0] = 1;
                break;
            case 6:
                win0v[0] = 2;
                break;
            case 9:
                win0v[0] = 3;
                break;
            case 12:
                win0v[0] = 4;
                break;
            }
            LoadPlayerOrRivalSprite(win0v[0]);
            sCreditsMgr->canSpeedThrough = 1;
            sCreditsMgr->mainseqno = CREDITSSCENE_EXEC_CMD;
        }
        return 0;
    case CREDITSSCENE_MON_DESTROY_ASSETS:
        if (!gPaletteFade.active)
        {
            DestroyPlayerOrRivalSprite();
            DestroyCreditsWindow();
            sCreditsMgr->subseqno = 0;
            sCreditsMgr->canSpeedThrough = 0;
            sCreditsMgr->mainseqno = CREDITSSCENE_MON_SHOW;
        }
        return 0;
    case CREDITSSCENE_MON_SHOW:
        if (DoCreditsMonScene())
        {
            sCreditsMgr->mainseqno = CREDITSSCENE_EXEC_CMD;
        }
        return 0;
    case CREDITSSCENE_THEEND_DESTROY_ASSETS:
        if (!gPaletteFade.active)
        {
            DestroyCreditsWindow();
            sCreditsMgr->subseqno = 0;
            sCreditsMgr->canSpeedThrough = 0;
            sCreditsMgr->mainseqno = CREDITSSCENE_THEEND_SHOW;
        }
        return 0;
    case CREDITSSCENE_THEEND_SHOW:
        if (DoCopyrightOrTheEndGfxScene())
        {
            sCreditsMgr->mainseqno = CREDITSSCENE_EXEC_CMD;
        }
        return 0;
    case CREDITSSCENE_WAITBUTTON:
        if (JOY_NEW(A_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_WHITE);
            sCreditsMgr->mainseqno = CREDITSSCENE_TERMINATE;
        }
        else if (sCreditsMgr->timer == 0)
        {
            sCreditsMgr->mainseqno = CREDITSSCENE_TERMINATE;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_WHITE);
        }
        else
            sCreditsMgr->timer--;
        return 0;
    case CREDITSSCENE_TERMINATE:
        if (!gPaletteFade.active)
            DestroyCreditsWindow();
        break;
    }
    return 2;
}
#else
NAKED
static s32 RollCredits(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tsub sp, 0x24\n"
                "\tldr r1, _080F3BEC @ =sCreditsMgr\n"
                "\tldr r0, [r1]\n"
                "\tldrb r0, [r0]\n"
                "\tadds r7, r1, 0\n"
                "\tcmp r0, 0x12\n"
                "\tbls _080F3BE2\n"
                "\tb _080F4180_default_return2\n"
                "_080F3BE2:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080F3BF0 @ =_080F3BF4\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080F3BEC: .4byte sCreditsMgr\n"
                "_080F3BF0: .4byte _080F3BF4\n"
                "\t.align 2, 0\n"
                "_080F3BF4:\n"
                "\t.4byte _080F3C40_case00\n"
                "\t.4byte _080F3C64_case01\n"
                "\t.4byte _080F3C98_case02\n"
                "\t.4byte _080F3CEE_case03\n"
                "\t.4byte _080F3D0A_case04\n"
                "\t.4byte _080F3D48_case05\n"
                "\t.4byte _080F3D6A_case06\n"
                "\t.4byte _080F3EB4_case07\n"
                "\t.4byte _080F3F24_case08\n"
                "\t.4byte _080F3F84_case09\n"
                "\t.4byte _080F3FC4_case0A\n"
                "\t.4byte _080F3FF0_case0B\n"
                "\t.4byte _080F400A_case0C\n"
                "\t.4byte _080F4084_case0D\n"
                "\t.4byte _080F40B8_case0E\n"
                "\t.4byte _080F40D0_case0F\n"
                "\t.4byte _080F4100_case10\n"
                "\t.4byte _080F4118_case11\n"
                "\t.4byte _080F4170_case12\n"
                "_080F3C40_case00:\n"
                "\tbl SwitchWin1OffWin0On\n"
                "\tmovs r0, 0x40\n"
                "\tmovs r1, 0xF0\n"
                "\tbl SetGpuReg\n"
                "\tldr r1, _080F3C5C @ =0x00004f51\n"
                "\tmovs r0, 0x44\n"
                "\tbl SetGpuReg\n"
                "\tldr r0, _080F3C60 @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3C5C: .4byte 0x00004f51\n"
                "_080F3C60: .4byte sCreditsMgr\n"
                "_080F3C64_case01:\n"
                "\tbl InitBgDarkenEffect\n"
                "\tbl CreateCreditsWindow\n"
                "\tmovs r0, 0xF0\n"
                "\tbl Menu_LoadStdPalAt\n"
                "\tldr r0, _080F3C8C @ =gPlttBufferUnfaded\n"
                "\tmovs r2, 0xFF\n"
                "\tlsls r2, 1\n"
                "\tadds r0, r2\n"
                "\tmovs r1, 0\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080F3C90 @ =gPlttBufferFaded\n"
                "\tadds r0, r2\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080F3C94 @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3C8C: .4byte gPlttBufferUnfaded\n"
                "_080F3C90: .4byte gPlttBufferFaded\n"
                "_080F3C94: .4byte sCreditsMgr\n"
                "_080F3C98_case02:\n"
                "\tmovs r0, 0x44\n"
                "\tbl GetGpuReg\n"
                "\tadd r1, sp, 0x14\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 24\n"
                "\tstrh r0, [r1]\n"
                "\tmovs r0, 0x44\n"
                "\tbl GetGpuReg\n"
                "\tadd r2, sp, 0x14\n"
                "\tmovs r1, 0xFF\n"
                "\tands r1, r0\n"
                "\tstrh r1, [r2, 0x2]\n"
                "\tadds r0, r2, 0\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, 0x24\n"
                "\tbne _080F3CCC\n"
                "\tldr r0, _080F3CC8 @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tmovs r0, 0x3\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3CC8: .4byte sCreditsMgr\n"
                "_080F3CCC:\n"
                "\tadd r1, sp, 0x14\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r1]\n"
                "\tadds r2, r1, 0\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r1, [r0, 0x2]\n"
                "\tadds r1, 0x1\n"
                "\tstrh r1, [r2, 0x2]\n"
                "\tldrh r0, [r0]\n"
                "\tlsls r0, 8\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 16\n"
                "\tlsrs r1, 16\n"
                "\tmovs r0, 0x44\n"
                "\tbl SetGpuReg\n"
                "\tb _080F3D06_return0\n"
                "_080F3CEE_case03:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbne _080F3D52_decfield4_return0\n"
                "\tmovs r0, 0\n"
                "\tbl LoadPlayerOrRivalSprite\n"
                "\tldr r0, [r7]\n"
                "\tmovs r1, 0x64\n"
                "\tstrh r1, [r0, 0x4]\n"
                "\tmovs r1, 0x4\n"
                "\tstrb r1, [r0]\n"
                "_080F3D06_return0:\n"
                "\tmovs r0, 0\n"
                "\tb _080F4182_return\n"
                "_080F3D0A_case04:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tadds r2, r0, 0\n"
                "\tcmp r2, 0\n"
                "\tbne _080F3D52_decfield4_return0\n"
                "\tmovs r0, 0xB4\n"
                "\tlsls r0, 1\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrb r0, [r1, 0xA]\n"
                "\tmovs r1, 0x1\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0x2\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _080F3D40 @ =sTextColor_Header\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tldr r1, _080F3D44 @ =TITLE_TEXT\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0x8\n"
                "\tmovs r3, 0x29\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x5\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3D40: .4byte sTextColor_Header\n"
                "_080F3D44: .4byte TITLE_TEXT\n"
                "_080F3D48_case05:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tadds r4, r0, 0\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F3D58\n"
                "_080F3D52_decfield4_return0:\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tb _080F3D06_return0\n"
                "_080F3D58:\n"
                "\tbl DestroyCreditsWindow\n"
                "\tldr r0, [r7]\n"
                "\tmovs r1, 0x6\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r7]\n"
                "\tstrh r4, [r0, 0x4]\n"
                "\tstrh r4, [r0, 0x6]\n"
                "\tb _080F3D06_return0\n"
                "_080F3D6A_case06:\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F3D7A\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r2, 0x4]\n"
                "\tldrb r0, [r2, 0x8]\n"
                "\tb _080F4182_return\n"
                "_080F3D7A:\n"
                "\tldr r1, _080F3D94 @ =sCreditsScript\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x5\n"
                "\tbls _080F3D8A\n"
                "\tb _080F3E94\n"
                "_080F3D8A:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080F3D98 @ =_080F3D9C\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080F3D94: .4byte sCreditsScript\n"
                "_080F3D98: .4byte _080F3D9C\n"
                "\t.align 2, 0\n"
                "_080F3D9C:\n"
                "\t.4byte _080F3DB4\n"
                "\t.4byte _080F3DE0\n"
                "\t.4byte _080F3E10\n"
                "\t.4byte _080F3E30\n"
                "\t.4byte _080F3E58\n"
                "\t.4byte _080F3E8C\n"
                "_080F3DB4:\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 8\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r4, _080F3DDC @ =sCreditsMgr\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0x7\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tmovs r1, 0\n"
                "\tbl FillWindowPixelBuffer\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tb _080F4182_return\n"
                "\t.align 2, 0\n"
                "_080F3DDC: .4byte sCreditsMgr\n"
                "_080F3DE0:\n"
                "\tldr r2, _080F3E04 @ =sCreditsMgr\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xA\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E08 @ =sCreditsScript\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tldr r2, _080F3E0C @ =0x3fffffff\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tbl FieldWeather_StartFadingOutCreditsMap\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E04: .4byte sCreditsMgr\n"
                "_080F3E08: .4byte sCreditsScript\n"
                "_080F3E0C: .4byte 0x3fffffff\n"
                "_080F3E10:\n"
                "\tldr r2, _080F3E28 @ =sCreditsMgr\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xC\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E2C @ =sCreditsScript\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E28: .4byte sCreditsMgr\n"
                "_080F3E2C: .4byte sCreditsScript\n"
                "_080F3E30:\n"
                "\tldr r2, _080F3E50 @ =sCreditsMgr\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xD\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E54 @ =sCreditsScript\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tbl fade_screen\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E50: .4byte sCreditsMgr\n"
                "_080F3E54: .4byte sCreditsScript\n"
                "_080F3E58:\n"
                "\tldr r2, _080F3E84 @ =sCreditsMgr\n"
                "\tldr r1, [r2]\n"
                "\tmovs r3, 0\n"
                "\tmovs r0, 0xF\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E88 @ =sCreditsScript\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r3, [sp]\n"
                "\tmovs r1, 0x4\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E84: .4byte sCreditsMgr\n"
                "_080F3E88: .4byte sCreditsScript\n"
                "_080F3E8C:\n"
                "\tldr r0, _080F3EAC @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x11\n"
                "\tstrb r0, [r1]\n"
                "_080F3E94:\n"
                "\tldr r0, _080F3EAC @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tldr r2, _080F3EB0 @ =sCreditsScript\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldrh r0, [r0, 0x2]\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x6]\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F3EAC: .4byte sCreditsMgr\n"
                "_080F3EB0: .4byte sCreditsScript\n"
                "_080F3EB4_case07:\n"
                "\tldr r0, _080F3F14 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tcmp r6, 0\n"
                "\tbne _080F3FBA_returnfield8\n"
                "\tadd r3, sp, 0x14\n"
                "\tldr r5, _080F3F18 @ =sCreditsTexts\n"
                "\tldr r4, _080F3F1C @ =sCreditsScript\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r4\n"
                "\tldrb r1, [r0, 0x1]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r5\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tstrh r0, [r3]\n"
                "\tldrb r0, [r2, 0xA]\n"
                "\tstr r6, [sp]\n"
                "\tstr r6, [sp, 0x4]\n"
                "\tldr r1, _080F3F20 @ =sTextColor_Header\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x1\n"
                "\tnegs r1, r1\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tldrh r1, [r2, 0x6]\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r4\n"
                "\tldrb r2, [r1, 0x1]\n"
                "\tlsls r1, r2, 1\n"
                "\tadds r1, r2\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r5\n"
                "\tldr r1, [r1]\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0x2\n"
                "\tmovs r3, 0x6\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x8\n"
                "\tb _080F3FB8_setfield0_returnfield8\n"
                "\t.align 2, 0\n"
                "_080F3F14: .4byte gPaletteFade\n"
                "_080F3F18: .4byte sCreditsTexts\n"
                "_080F3F1C: .4byte sCreditsScript\n"
                "_080F3F20: .4byte sTextColor_Header\n"
                "_080F3F24_case08:\n"
                "\tadd r4, sp, 0x14\n"
                "\tldr r3, _080F3F78 @ =sCreditsTexts\n"
                "\tldr r5, _080F3F7C @ =sCreditsScript\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r5\n"
                "\tldrb r1, [r0, 0x1]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tmovs r1, 0\n"
                "\tstrh r0, [r4]\n"
                "\tldrb r0, [r2, 0xA]\n"
                "\tstr r1, [sp]\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _080F3F80 @ =sTextColor_Regular\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x1\n"
                "\tnegs r1, r1\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tldrh r1, [r2, 0x6]\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r5\n"
                "\tldrb r2, [r1, 0x1]\n"
                "\tlsls r1, r2, 1\n"
                "\tadds r1, r2\n"
                "\tlsls r1, 2\n"
                "\tadds r3, 0x4\n"
                "\tadds r1, r3\n"
                "\tldr r1, [r1]\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x2\n"
                "\tmovs r2, 0x8\n"
                "\tmovs r3, 0x6\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x9\n"
                "\tb _080F3FB8_setfield0_returnfield8\n"
                "\t.align 2, 0\n"
                "_080F3F78: .4byte sCreditsTexts\n"
                "_080F3F7C: .4byte sCreditsScript\n"
                "_080F3F80: .4byte sTextColor_Regular\n"
                "_080F3F84_case09:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tmovs r1, 0x2\n"
                "\tbl CopyWindowToVram\n"
                "\tldr r1, [r7]\n"
                "\tldr r2, _080F3FC0 @ =sCreditsScript\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldrh r0, [r0, 0x2]\n"
                "\tmovs r2, 0\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x6]\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 8\n"
                "\tstr r2, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x6\n"
                "_080F3FB8_setfield0_returnfield8:\n"
                "\tstrb r0, [r1]\n"
                "_080F3FBA_returnfield8:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tb _080F4182_return\n"
                "\t.align 2, 0\n"
                "_080F3FC0: .4byte sCreditsScript\n"
                "_080F3FC4_case0A:\n"
                "\tldr r0, _080F3FE8 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F3FD6\n"
                "\tb _080F3D06_return0\n"
                "_080F3FD6:\n"
                "\tbl DestroyCreditsWindow\n"
                "\tldr r1, _080F3FEC @ =sCreditsMgr\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0xB\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3FE8: .4byte gPaletteFade\n"
                "_080F3FEC: .4byte sCreditsMgr\n"
                "_080F3FF0_case0B:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tbl DoOverworldMapScrollScene\n"
                "\tcmp r0, 0\n"
                "\tbne _080F3FFE\n"
                "\tb _080F3D06_return0\n"
                "_080F3FFE:\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x1\n"
                "\tstrb r0, [r1, 0x8]\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "_080F400A_case0C:\n"
                "\tldr r0, _080F4050 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F401C\n"
                "\tb _080F3D06_return0\n"
                "_080F401C:\n"
                "\tbl DestroyCreditsWindow\n"
                "\tldr r1, _080F4054 @ =sCreditsMgr\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tadds r4, r1, 0\n"
                "_080F4028:\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tbl DoOverworldMapScrollScene\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F4028\n"
                "\tldr r0, _080F4054 @ =sCreditsMgr\n"
                "\tldr r0, [r0]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tcmp r0, 0x6\n"
                "\tbeq _080F4058\n"
                "\tcmp r0, 0x6\n"
                "\tble _080F404A\n"
                "\tcmp r0, 0x9\n"
                "\tbeq _080F405E\n"
                "\tcmp r0, 0xC\n"
                "\tbeq _080F4064\n"
                "_080F404A:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x1\n"
                "\tb _080F4068\n"
                "\t.align 2, 0\n"
                "_080F4050: .4byte gPaletteFade\n"
                "_080F4054: .4byte sCreditsMgr\n"
                "_080F4058:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x2\n"
                "\tb _080F4068\n"
                "_080F405E:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x3\n"
                "\tb _080F4068\n"
                "_080F4064:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x4\n"
                "_080F4068:\n"
                "\tstrh r0, [r1]\n"
                "\tadd r0, sp, 0x14\n"
                "\tldrb r0, [r0]\n"
                "\tbl LoadPlayerOrRivalSprite\n"
                "\tldr r2, _080F4080 @ =sCreditsMgr\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0x1\n"
                "\tstrb r0, [r1, 0x8]\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F4080: .4byte sCreditsMgr\n"
                "_080F4084_case0D:\n"
                "\tldr r0, _080F40B0 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F4096\n"
                "\tb _080F3D06_return0\n"
                "_080F4096:\n"
                "\tbl DestroyPlayerOrRivalSprite\n"
                "\tbl DestroyCreditsWindow\n"
                "\tldr r1, _080F40B4 @ =sCreditsMgr\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x8]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0xE\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40B0: .4byte gPaletteFade\n"
                "_080F40B4: .4byte sCreditsMgr\n"
                "_080F40B8_case0E:\n"
                "\tbl DoCreditsMonScene\n"
                "\tcmp r0, 0\n"
                "\tbne _080F40C2\n"
                "\tb _080F3D06_return0\n"
                "_080F40C2:\n"
                "\tldr r0, _080F40CC @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40CC: .4byte sCreditsMgr\n"
                "_080F40D0_case0F:\n"
                "\tldr r0, _080F40F8 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F40E2\n"
                "\tb _080F3D06_return0\n"
                "_080F40E2:\n"
                "\tbl DestroyCreditsWindow\n"
                "\tldr r1, _080F40FC @ =sCreditsMgr\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x8]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0x10\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40F8: .4byte gPaletteFade\n"
                "_080F40FC: .4byte sCreditsMgr\n"
                "_080F4100_case10:\n"
                "\tbl DoCopyrightOrTheEndGfxScene\n"
                "\tcmp r0, 0\n"
                "\tbne _080F410A\n"
                "\tb _080F3D06_return0\n"
                "_080F410A:\n"
                "\tldr r0, _080F4114 @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F4114: .4byte sCreditsMgr\n"
                "_080F4118_case11:\n"
                "\tldr r0, _080F4140 @ =gMain\n"
                "\tldrh r1, [r0, 0x2E]\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F414C\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tldr r1, _080F4144 @ =0x00007fff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r0, _080F4148 @ =sCreditsMgr\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x12\n"
                "_080F413C_setfield0_return0:\n"
                "\tstrb r0, [r1]\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F4140: .4byte gMain\n"
                "_080F4144: .4byte 0x00007fff\n"
                "_080F4148: .4byte sCreditsMgr\n"
                "_080F414C:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F4156\n"
                "\tb _080F3D52_decfield4_return0\n"
                "_080F4156:\n"
                "\tmovs r0, 0x12\n"
                "\tstrb r0, [r1]\n"
                "\tsubs r0, 0x13\n"
                "\tldr r1, _080F416C @ =0x00007fff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F416C: .4byte 0x00007fff\n"
                "_080F4170_case12:\n"
                "\tldr r0, _080F418C @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080F4180_default_return2\n"
                "\tbl DestroyCreditsWindow\n"
                "_080F4180_default_return2:\n"
                "\tmovs r0, 0x2\n"
                "_080F4182_return:\n"
                "\tadd sp, 0x24\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.align 2, 0\n"
                "_080F418C: .4byte gPaletteFade");
}
#endif //NONMATCHING

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void LoadCreditsMonPic(u8 whichMon)
{
    switch (whichMon)
    {
    case CREDITSMON_CHARIZARD:
        InitWindows(sWindowTemplates_Charizard);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        LoadMonPicInWindow(SPECIES_CHARIZARD, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sWindow1Map_Charizard, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sWindow2Map_Charizard, 0, 0);
        break;
    case CREDITSMON_VENUSAUR:
        InitWindows(sWindowTemplates_Venusaur);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        LoadMonPicInWindow(SPECIES_VENUSAUR, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sWindow1Map_Venusaur, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sWindow2Map_Venusaur, 0, 0);
        break;
    case CREDITSMON_BLASTOISE:
        InitWindows(sWindowTemplates_Blastoise);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        LoadMonPicInWindow(SPECIES_BLASTOISE, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sWindow1Map_Blastoise, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sWindow2Map_Blastoise, 0, 0);
        break;
    case CREDITSMON_PIKACHU:
        InitWindows(sWindowTemplates_Pikachu);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        LoadMonPicInWindow(SPECIES_PIKACHU, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sWindow1Map_Pikachu, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sWindow2Map_Pikachu, 0, 0);
        break;
    }
    CopyWindowToVram(0, 2);
    CopyWindowToVram(1, 2);
    CopyWindowToVram(2, 2);
}

static u16 GetCreditsMonSpecies(u8 whichMon)
{
    switch (whichMon)
    {
    case CREDITSMON_CHARIZARD:
        return SPECIES_CHARIZARD;
    case CREDITSMON_VENUSAUR:
        return SPECIES_VENUSAUR;
    case CREDITSMON_BLASTOISE:
        return SPECIES_BLASTOISE;
    case CREDITSMON_PIKACHU:
        return SPECIES_PIKACHU;
    default:
        return SPECIES_NONE;
    }
}

static bool32 DoCreditsMonScene(void)
{
    switch (sCreditsMgr->subseqno)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetHBlankCallback(NULL);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        ResetBgsAndClearDma3BusyFlags(1);
        InitBgsFromTemplates(1, sBgTemplates_MonSceneOrTheEnd, NELEMS(sBgTemplates_MonSceneOrTheEnd));
        SetBgTilemapBuffer(0, Alloc(BG_SCREEN_SIZE));
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        sCreditsMgr->creditsMonTimer = 0;
        sCreditsMgr->unk_0E = 0;
        SetBgAffine(2, 0x8000, 0x8000, 0x78, 0x50, sCreditsMgr->creditsMonTimer, sCreditsMgr->creditsMonTimer, 0);
        DecompressAndLoadBgGfxUsingHeap(1, gCreditsPokeballBgGfxTiles, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(2, sAffineCircleGfx, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(1, gCreditsPokeballBgGfxMap, 0x500, 0, 1);
        DecompressAndLoadBgGfxUsingHeap(2, sAffineCircleMap, 0x400, 0, 1);
        LoadPalette(gCreditsMonBackdropPals[sCreditsMgr->whichMon], 0, 0x20);
        LoadPalette(sPalette_OneBlackThenAllWhite, 0xF0, 0x20);
        LoadCreditsMonPic(sCreditsMgr->whichMon);
        SetVBlankCallback(VBlankCB);
        EnableInterrupts(INTR_FLAG_VBLANK);
        sCreditsMgr->subseqno++;
        break;
    case 1:
        FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, PIXEL_FILL(1));
        PutWindowTilemap(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        sCreditsMgr->subseqno++;
        break;
    case 2:
        ShowBg(2);
        ShowBg(0);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sCreditsMgr->creditsMonTimer = 40;
        sCreditsMgr->subseqno++;
        break;
    case 3:
        if (sCreditsMgr->creditsMonTimer != 0)
            sCreditsMgr->creditsMonTimer--;
        else
            sCreditsMgr->subseqno++;
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            sCreditsMgr->creditsMonTimer = 8;
            sCreditsMgr->unk_0E = 1;
            sCreditsMgr->subseqno++;
        }
        break;
    case 5:
        if (sCreditsMgr->creditsMonTimer != 0)
            sCreditsMgr->creditsMonTimer--;
        else
        {
            if (sCreditsMgr->unk_0E < 3)
            {
                PutWindowTilemap(sCreditsMgr->unk_0E);
                CopyBgTilemapBufferToVram(0);
                sCreditsMgr->creditsMonTimer = 4;
                sCreditsMgr->unk_0E++;
            }
            else
                sCreditsMgr->subseqno++;
        }
        break;
    case 6:
        if (sCreditsMgr->creditsMonTimer < 256)
        {
            sCreditsMgr->creditsMonTimer += 16;
            SetBgAffine(2, 0x8000, 0x8000, 0x78, 0x50, sCreditsMgr->creditsMonTimer, sCreditsMgr->creditsMonTimer, 0);
        }
        else
        {
            SetBgAffine(2, 0x8000, 0x8000, 0x78, 0x50, 0x100, 0x100, 0);
            sCreditsMgr->creditsMonTimer = 32;
            sCreditsMgr->subseqno++;
        }
        break;
    case 7:
        if (sCreditsMgr->creditsMonTimer != 0)
            sCreditsMgr->creditsMonTimer--;
        else
        {
            HideBg(2);
            ShowBg(1);
            PlayCry2(GetCreditsMonSpecies(sCreditsMgr->whichMon), 0, 125, 10);
            sCreditsMgr->creditsMonTimer = 128;
            sCreditsMgr->subseqno++;
        }
        break;
    case 8:
        if (sCreditsMgr->creditsMonTimer != 0)
            sCreditsMgr->creditsMonTimer--;
        else
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            sCreditsMgr->subseqno++;
        }
        break;
    case 9:
        if (!gPaletteFade.active)
        {
            FreeAllWindowBuffers();
            Free(GetBgTilemapBuffer(0));
            sCreditsMgr->subseqno = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static bool32 DoCopyrightOrTheEndGfxScene(void)
{
    switch (sCreditsMgr->subseqno)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetHBlankCallback(NULL);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        ResetBgsAndClearDma3BusyFlags(1);
        InitBgsFromTemplates(0, sBgTemplates_MonSceneOrTheEnd, 1);
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(0, sCopyrightOrTheEndGfxHeaders[sCreditsMgr->whichMon].tiles, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(0, sCopyrightOrTheEndGfxHeaders[sCreditsMgr->whichMon].map, 0x800, 0, 1);
        LoadPalette(sCopyrightOrTheEndGfxHeaders[sCreditsMgr->whichMon].palette, 0x00, 0x200);
        SetVBlankCallback(VBlankCB);
        EnableInterrupts(INTR_FLAG_VBLANK);
        sCreditsMgr->subseqno++;
        break;
    case 1:
        CopyBgTilemapBufferToVram(0);
        sCreditsMgr->subseqno++;
        break;
    case 2:
        ShowBg(0);
        if (sCreditsMgr->whichMon != 0)
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0, RGB_BLACK);
        else
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sCreditsMgr->subseqno++;
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            sCreditsMgr->subseqno = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void Task_MovePlayerAndGroundSprites(u8 taskId)
{
    struct CreditsTaskData * data = (void *)gTasks[taskId].data;
    switch (data->spriteMoveCmd)
    {
    case 0:
        break;
    case 1:
        if (gSprites[data->playerSpriteId].pos1.x != 0xD0)
        {
            gSprites[data->playerSpriteId].pos1.x--;
            gSprites[data->groundSpriteId].pos1.x--;
        }
        else
        {
            data->spriteMoveCmd = 0;
        }
        break;
    case 2:
        if (sCreditsMgr->unk_1D & 1)
        {
            if (gSprites[data->playerSpriteId].pos1.y != 0x50)
            {
                gSprites[data->playerSpriteId].pos1.y--;
                gSprites[data->groundSpriteId].pos1.y--;
            }
            else
            {
                data->spriteMoveCmd = 0;
            }
        }
        break;
    case 3:
        if (sCreditsMgr->mainseqno == 15)
        {
            gSprites[data->playerSpriteId].pos1.x--;
            gSprites[data->groundSpriteId].pos1.x--;
        }
        break;
    }
}

static void DestroyPlayerOrRivalSprite(void)
{
    if (sCreditsMgr->taskId != 0xFF)
    {
        struct CreditsTaskData * data = (void *)gTasks[sCreditsMgr->taskId].data;
        FreeSpriteTilesByTag(data->playerTilesTag);
        DestroySprite(&gSprites[data->playerSpriteId]);
        FreeSpriteTilesByTag(data->groundTilesTag);
        DestroySprite(&gSprites[data->groundSpriteId]);
        DestroyTask(sCreditsMgr->taskId);
        sCreditsMgr->taskId = 0xFF;
    }
}

static void LoadPlayerOrRivalSprite(u8 whichScene)
{
    u8 taskId;
    struct CreditsTaskData * data;
    s32 x, y;
    struct SpriteTemplate sprTemplate;
    struct CompressedSpriteSheet sprSheet;

    if (sCreditsMgr->taskId == 0xFF)
    {
        taskId = CreateTask(Task_MovePlayerAndGroundSprites, 0);
        data = (void *)gTasks[taskId].data;
        sCreditsMgr->taskId = taskId;
        switch (sPlayerRivalSpriteParams[whichScene][2])
        {
        default:
        case 0:
            x = 0xd0;
            y = 0x50;
            break;
        case 1:
            x = 0x110;
            y = 0x50;
            break;
        case 2:
            x = 0xd0;
            y = 0xa0;
            break;
        }
        data->spriteMoveCmd = sPlayerRivalSpriteParams[whichScene][2];
        data->playerTilesTag = 0x2000;
        data->field_04 = 0xFFFF;
        switch (sPlayerRivalSpriteParams[whichScene][0])
        {
        case 0:
            // Player
            if (gSaveBlock2Ptr->playerGender == MALE)
            {
                sprSheet.data = sMalePlayerSpriteGfx;
                sprSheet.size = 0x3000;
                sprSheet.tag = data->playerTilesTag;
                LoadCompressedSpriteSheet(&sprSheet);
                LoadPalette(sMalePlayerSpritePal, 0x1F0, 0x20);
            }
            else
            {
                sprSheet.data = sFemalePlayerSpriteGfx;
                sprSheet.size = 0x3000;
                sprSheet.tag = data->playerTilesTag;
                LoadCompressedSpriteSheet(&sprSheet);
                LoadPalette(sFemalePlayerSpritePal, 0x1F0, 0x20);
            }
            break;
        case 1:
            // Rival
            sprSheet.data = sRivalSpriteGfx;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->playerTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sRivalSpritePal, 0x1F0, 0x20);
            break;
        }
        sprTemplate = sPlayerOrRivalSpriteTemplate;
        sprTemplate.tileTag = data->playerTilesTag;
        data->playerSpriteId = CreateSprite(&sprTemplate, x, y, 0);
        gSprites[data->playerSpriteId].oam.paletteNum = 0xF;
        gSprites[data->playerSpriteId].subpriority = 0;

        data->groundTilesTag = 0x2001;
        data->field_0A = 0xFFFF;
        switch (sPlayerRivalSpriteParams[whichScene][1])
        {
        case 0:
            sprSheet.data = sGroundSpriteGfx_Grass;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGroundSpritePal_Grass, 0x1E0, 0x20);
            sprTemplate = sGroundSpriteTemplate_Running;
            break;
        case 1:
            sprSheet.data = sGroundSpriteGfx_Grass;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGroundSpritePal_Grass, 0x1E0, 0x20);
            sprTemplate = sGroundSpriteTemplate_Static;
            break;
        case 2:
            sprSheet.data = sGroundSpriteGfx_Dirt;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGroundSpritePal_Dirt, 0x1E0, 0x20);
            sprTemplate = sGroundSpriteTemplate_Running;
            break;
        case 3:
            sprSheet.data = sGroundSpriteGfx_City;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGroundSpritePal_City, 0x1E0, 0x20);
            sprTemplate = sGroundSpriteTemplate_Running;
            break;
        }
        sprTemplate.tileTag = data->groundTilesTag;
        data->groundSpriteId = CreateSprite(&sprTemplate, x, y + 0x26, 0);
        gSprites[data->groundSpriteId].oam.paletteNum = 0xE;
        gSprites[data->groundSpriteId].subpriority = 1;
    }
}
