#include "global.h"
#include "gflib.h"
#include "credits.h"
#include "task.h"
#include "overworld.h"
#include "event_data.h"
#include "new_menu_helpers.h"
#include "decompress.h"
#include "graphics.h"
#include "strings.h"
#include "trainer_pokemon_sprites.h"
#include "menu.h"
#include "field_weather.h"
#include "quest_log.h"
#include "constants/maps.h"
#include "constants/field_weather.h"
#include "constants/sound.h"

#if defined(FIRERED)
#define TITLE_TEXT gString_PokemonFireRed_Staff
#elif defined(LEAFGREEN)
#define TITLE_TEXT gString_PokemonLeafGreen_Staff
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
    CREDITS_MAP_SAFFRON_CITY,
    CREDITS_MAP_ROUTE17,
    CREDITS_MAP_FUCHSIA_CITY,
    CREDITS_MAP_CINNABAR_ISLAND,
    CREDITS_MAP_ROUTE21_NORTH
};

enum {
    GFXTAG_CHARACTER = 0x2000, // Player/Rival
    GFXTAG_GROUND,
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
    const u8 * title;
    const u8 * names;
    bool8 unused;
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
    u8 characterSpriteId; // Player or rival
    u16 characterTilesTag;
    u16 characterPalTag;
    u8 groundSpriteId;
    u16 groundTilesTag;
    u16 groundPalTag;
};

static EWRAM_DATA struct CreditsResources * sCreditsMgr = NULL;
EWRAM_DATA bool8 gHasHallOfFameRecords = FALSE;

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
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 6,
        .width = 8,
        .height = 8,
        .paletteNum = 10,
        .baseBlock = 0x0008
    }, {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 5,
        .width = 10,
        .height = 10,
        .paletteNum = 10,
        .baseBlock = 0x0048
    }, {
        .bg = 0,
        .tilemapLeft = 9,
        .tilemapTop = 3,
        .width = 12,
        .height = 13,
        .paletteNum = 10,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates_Venusaur[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 6,
        .width = 8,
        .height = 8,
        .paletteNum = 10,
        .baseBlock = 0x0008
    }, {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 5,
        .width = 10,
        .height = 10,
        .paletteNum = 10,
        .baseBlock = 0x0048
    }, {
        .bg = 0,
        .tilemapLeft = 9,
        .tilemapTop = 5,
        .width = 12,
        .height = 10,
        .paletteNum = 10,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates_Blastoise[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 6,
        .width = 8,
        .height = 8,
        .paletteNum = 10,
        .baseBlock = 0x0008
    }, {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 5,
        .width = 10,
        .height = 10,
        .paletteNum = 10,
        .baseBlock = 0x0048
    }, {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 4,
        .width = 10,
        .height = 12,
        .paletteNum = 10,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const struct WindowTemplate sWindowTemplates_Pikachu[] = {
    {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 6,
        .width = 8,
        .height = 8,
        .paletteNum = 10,
        .baseBlock = 0x0008
    }, {
        .bg = 0,
        .tilemapLeft = 10,
        .tilemapTop = 5,
        .width = 10,
        .height = 10,
        .paletteNum = 10,
        .baseBlock = 0x0048
    }, {
        .bg = 0,
        .tilemapLeft = 9,
        .tilemapTop = 4,
        .width = 12,
        .height = 12,
        .paletteNum = 10,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

static const u16 sCreditsMonCircle_Pal[] = INCBIN_U16("graphics/credits/white_circle.gbapal");
static const u32 sCreditsMonCircle_Tiles[] = INCBIN_U32("graphics/credits/white_circle.8bpp.lz");
static const u32 sCreditsMonCircle_Tilemap[] = INCBIN_U32("graphics/credits/white_circle.bin.lz");

static const u32 sCharizard1_Tiles[] = INCBIN_U32("graphics/credits/charizard_1.4bpp.lz");
static const u32 sCharizard2_Tiles[] = INCBIN_U32("graphics/credits/charizard_2.4bpp.lz");

static const u32 sVenusaurUnused_Tiles[] = INCBIN_U32("graphics/credits/venusaur_unused.4bpp.lz");
static const u32 sVenusaur1_Tiles[] = INCBIN_U32("graphics/credits/venusaur_1.4bpp.lz");
static const u32 sVenusaur2_Tiles[] = INCBIN_U32("graphics/credits/venusaur_2.4bpp.lz");

static const u32 sBlastoise1_Tiles[] = INCBIN_U32("graphics/credits/blastoise_1.4bpp.lz");
static const u32 sBlastoise2_Tiles[] = INCBIN_U32("graphics/credits/blastoise_2.4bpp.lz");

static const u32 sPikachu1_Tiles[] = INCBIN_U32("graphics/credits/pikachu_1.4bpp.lz");
static const u32 sPikachu2_Tiles[] = INCBIN_U32("graphics/credits/pikachu_2.4bpp.lz");

static const u32 sUnused = 0xF0;

static const u16 sTheEnd_Pal[] = INCBIN_U16("graphics/credits/the_end.gbapal");
static const u8 sTheEnd_Tiles[] = INCBIN_U8("graphics/credits/the_end.4bpp.lz");
static const u8 sTheEnd_Tilemap[] = INCBIN_U8("graphics/credits/the_end.bin.lz");

static const struct CompressedGraphicsHeader sCopyrightOrTheEndGfxHeaders[] = {
    {
        .tiles = gCreditsCopyright_Tiles,
        .map = gCreditsCopyright_Tilemap,
        .palette = gCreditsCopyright_Pal
    }, {
        .tiles = sTheEnd_Tiles,
        .map = sTheEnd_Tilemap,
        .palette = sTheEnd_Pal
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
    CREDITS_MAPNEXT(SAFFRON_CITY, 16),
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

static const u16 sPlayerMale_Pal[]     = INCBIN_U16("graphics/credits/player_male.gbapal");
static const u32 sPlayerMale_Tiles[]   = INCBIN_U32("graphics/credits/player_male.4bpp.lz");
static const u16 sPlayerFemale_Pal[]   = INCBIN_U16("graphics/credits/player_female.gbapal");
static const u32 sPlayerFemale_Tiles[] = INCBIN_U32("graphics/credits/player_female.4bpp.lz");
static const u16 sRival_Pal[]          = INCBIN_U16("graphics/credits/rival.gbapal");
static const u32 sRival_Tiles[]        = INCBIN_U32("graphics/credits/rival.4bpp.lz");
static const u16 sGround_Grass_Pal[]   = INCBIN_U16("graphics/credits/ground_grass.gbapal");
static const u32 sGround_Grass_Tiles[] = INCBIN_U32("graphics/credits/ground_grass.4bpp.lz");
static const u16 sGround_Dirt_Pal[]    = INCBIN_U16("graphics/credits/ground_dirt.gbapal");
static const u32 sGround_Dirt_Tiles[]  = INCBIN_U32("graphics/credits/ground_dirt.4bpp.lz");
static const u16 sGround_City_Pal[]    = INCBIN_U16("graphics/credits/ground_city.gbapal");
static const u32 sGround_City_Tiles[]  = INCBIN_U32("graphics/credits/ground_city.4bpp.lz");

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
    CREDITSOVWLDLOADMAP(ROUTE23, 11, 107, 1),
    CREDITSOVWLDSCROLL(0, 1, 0x0500), // Scroll down
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_ViridianCity[] = {
    CREDITSOVWLDLOADMAP(VIRIDIAN_CITY, 30, 34, 1),
    CREDITSOVWLDSCROLL(0, -1, 0x0500), // Scroll up
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_PewterCity[] = {
    CREDITSOVWLDLOADMAP(PEWTER_CITY, 20, 26, 1),
    CREDITSOVWLDSCROLL(0, -1, 0x0500), // Scroll up
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_CeruleanCity[] = {
    CREDITSOVWLDLOADMAP(CERULEAN_CITY, 8, 6, 1),
    CREDITSOVWLDSCROLL(1, 1, 0x0500), // Scroll right and down
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_Route25[] = {
    CREDITSOVWLDLOADMAP(ROUTE25, 25, 6, 1),
    CREDITSOVWLDSCROLL(1, 0, 0x0500), // Scroll right
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_VermilionCity[] = {
    CREDITSOVWLDLOADMAP(VERMILION_CITY, 9, 7, 1),
    CREDITSOVWLDSCROLL(1, 1, 0x0500), // Scroll right and down
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_Route10[] = {
    CREDITSOVWLDLOADMAP(ROUTE10, 11, 68, 1),
    CREDITSOVWLDSCROLL(0, 1, 0x0500), // Scroll down
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_CeladonCity[] = {
    CREDITSOVWLDLOADMAP(CELADON_CITY, 48, 16, 1),
    CREDITSOVWLDSCROLL(-1, 0, 0x0500), // Scroll left
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_SaffronCity[] = {
    CREDITSOVWLDLOADMAP(SAFFRON_CITY, 39, 5, 1),
    CREDITSOVWLDSCROLL(0, 1, 0x0500), // Scroll down
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_Route17[] = {
    CREDITSOVWLDLOADMAP(ROUTE17, 7, 43, 1),
    CREDITSOVWLDSCROLL(0, 1, 0x0500), // Scroll down
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_FuchsiaCity[] = {
    CREDITSOVWLDLOADMAP(FUCHSIA_CITY, 28, 5, 1),
    CREDITSOVWLDSCROLL(0, 1, 0x0500), // Scroll down
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_CinnabarIsland[] = {
    CREDITSOVWLDLOADMAP(CINNABAR_ISLAND, 13, 17, 1),
    CREDITSOVWLDSCROLL(0, -1, 0x0500), // Scroll up
    CREDITSOVWLDEND
};

static const struct CreditsOverworldCmd sOverworldCmd_Route21[] = {
    CREDITSOVWLDLOADMAP(ROUTE21_NORTH, 8, 20, 1),
    CREDITSOVWLDSCROLL(0, -1, 0x0500), // Scroll up
    CREDITSOVWLDEND,
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

void DoCredits(void)
{
    sCreditsMgr = AllocZeroed(sizeof(*sCreditsMgr));
    ResetTasks();
    sCreditsMgr->taskId = TASK_NONE;
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
        FlagClear(FLAG_DONT_SHOW_MAP_NAME_POPUP);
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
    CopyWindowToVram(sCreditsMgr->windowId, COPYWIN_FULL);
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

static bool32 DoOverworldMapScrollScene(u8 whichMon)
{
    switch (sCreditsMgr->subseqno)
    {
    case 0:
        FlagSet(FLAG_DONT_SHOW_MAP_NAME_POPUP);
        gDisableMapMusicChangeOnMapLoad = MUSIC_DISABLE_KEEP;
        sCreditsMgr->ovwldseqno = 0;
        sCreditsMgr->subseqno++;
        // fallthrough
    case 1:
        if (!Overworld_DoScrollSceneForCredits(&sCreditsMgr->ovwldseqno, sOverworldMapScenes[sCreditsMgr->whichMon], QL_TINT_NONE))
            return FALSE;
        CreateCreditsWindow();
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, DISPLAY_WIDTH));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(36, DISPLAY_HEIGHT - 36));
        SwitchWin1OffWin0On();
        InitBgDarkenEffect();
        Menu_LoadStdPalAt(BG_PLTT_ID(15));
        gPlttBufferUnfaded[BG_PLTT_ID(15) + 15] = RGB_BLACK;
        gPlttBufferFaded[BG_PLTT_ID(15) + 15] = RGB_BLACK;
        return TRUE;
    default:
        return FALSE;
    }
}

static s32 RollCredits(void)
{
    u16 win0v[8];

    switch (sCreditsMgr->mainseqno)
    {
    case CREDITSSCENE_INIT_WIN0:
        SwitchWin1OffWin0On();
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, DISPLAY_WIDTH));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(DISPLAY_HEIGHT / 2 - 1, DISPLAY_HEIGHT / 2 + 1));
        sCreditsMgr->mainseqno = CREDITSSCENE_SETUP_DARKEN_EFFECT;
        return 0;
    case CREDITSSCENE_SETUP_DARKEN_EFFECT:
        InitBgDarkenEffect();
        CreateCreditsWindow();
        Menu_LoadStdPalAt(BG_PLTT_ID(15));
        gPlttBufferUnfaded[BG_PLTT_ID(15) + 15] = RGB_BLACK;
        gPlttBufferFaded[BG_PLTT_ID(15) + 15] = RGB_BLACK;
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
            SetGpuReg(REG_OFFSET_WIN0V, (win0v[0] << 8) + win0v[1]);
        }
        return 0;
    case CREDITSSCENE_LOAD_PLAYER_SPRITE_AT_INDIGO:
        if (sCreditsMgr->timer)
        {
            sCreditsMgr->timer--;
            return 0;
        }
        LoadPlayerOrRivalSprite(0);
        sCreditsMgr->timer = 100;
        sCreditsMgr->mainseqno = CREDITSSCENE_PRINT_TITLE_STAFF;
        return 0;
    case CREDITSSCENE_PRINT_TITLE_STAFF:
        if (sCreditsMgr->timer)
        {
            sCreditsMgr->timer--;
            return 0;
            
        }
        sCreditsMgr->timer = 360;
        AddTextPrinterParameterized4(sCreditsMgr->windowId, FONT_NORMAL_COPY_1, 0x08, 0x29, 1, 2, sTextColor_Header, 0, TITLE_TEXT);
        sCreditsMgr->mainseqno = CREDITSSCENE_WAIT_TITLE_STAFF;
        return 0;
    case CREDITSSCENE_WAIT_TITLE_STAFF:
        if (sCreditsMgr->timer)
        {
            sCreditsMgr->timer--;
            return 0;
        }
        DestroyCreditsWindow();
        sCreditsMgr->mainseqno = CREDITSSCENE_EXEC_CMD;
        sCreditsMgr->timer = 0;
        sCreditsMgr->scrcmdidx = 0;
        return 0;
    case CREDITSSCENE_EXEC_CMD:
        if (sCreditsMgr->timer != 0)
        {
            sCreditsMgr->timer--;
            return sCreditsMgr->canSpeedThrough;
        }
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
            FadeSelectedPals(1, 0, 0x3FFFFFFF);
            break;
        case CREDITSSCRCMD_MAP:
            sCreditsMgr->mainseqno = CREDITSSCENE_MAP_LOADMAP_CREATESPRITES;
            sCreditsMgr->whichMon = sCreditsScript[sCreditsMgr->scrcmdidx].param;
            break;
        case CREDITSSCRCMD_MON:
            sCreditsMgr->mainseqno = CREDITSSCENE_MON_DESTROY_ASSETS;
            sCreditsMgr->whichMon = sCreditsScript[sCreditsMgr->scrcmdidx].param;
            FadeScreen(FADE_TO_BLACK, 0);
            break;
        case CREDITSSCRCMD_THEENDGFX:
            sCreditsMgr->mainseqno = CREDITSSCENE_THEEND_DESTROY_ASSETS;
            sCreditsMgr->whichMon = sCreditsScript[sCreditsMgr->scrcmdidx].param;
            BeginNormalPaletteFade(PALETTES_ALL, 4, 0, 16, RGB_BLACK);
            break;
        case CREDITSSCRCMD_WAITBUTTON:
            sCreditsMgr->mainseqno = CREDITSSCENE_WAITBUTTON;
            break;
        }
        sCreditsMgr->timer = sCreditsScript[sCreditsMgr->scrcmdidx].duration;
        sCreditsMgr->scrcmdidx++;
        return 0;
    case CREDITSSCENE_PRINT_ADDPRINTER1:
        if (gPaletteFade.active)
            return sCreditsMgr->canSpeedThrough;
        win0v[0] = sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].unused;
        AddTextPrinterParameterized4(sCreditsMgr->windowId, FONT_NORMAL_COPY_1, 2, 6, 0, 0, sTextColor_Header, -1, sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].title);
        sCreditsMgr->mainseqno = CREDITSSCENE_PRINT_ADDPRINTER2;
        return sCreditsMgr->canSpeedThrough;
    case CREDITSSCENE_PRINT_ADDPRINTER2:
        win0v[0] = sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].unused;
        AddTextPrinterParameterized4(sCreditsMgr->windowId, FONT_NORMAL, 8, 6, 0, 0, sTextColor_Regular, -1, sCreditsTexts[sCreditsScript[sCreditsMgr->scrcmdidx].param].names);
        sCreditsMgr->mainseqno = CREDITSSCENE_PRINT_DELAY;
        return sCreditsMgr->canSpeedThrough;
    case CREDITSSCENE_PRINT_DELAY:
        CopyWindowToVram(sCreditsMgr->windowId, COPYWIN_GFX);
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
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_WHITE);
            sCreditsMgr->mainseqno = CREDITSSCENE_TERMINATE;
            return 0;
        }
        if (sCreditsMgr->timer)
        {
            sCreditsMgr->timer--;
        }
        else
        {
            sCreditsMgr->mainseqno = CREDITSSCENE_TERMINATE;
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_WHITE);
        }
        return 0;
    case CREDITSSCENE_TERMINATE:
        if (!gPaletteFade.active)
            DestroyCreditsWindow();
        break;
    }
    return 2;
}

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
        LoadMonPicInWindow(SPECIES_CHARIZARD, SHINY_ODDS, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sCharizard1_Tiles, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sCharizard2_Tiles, 0, 0);
        break;
    case CREDITSMON_VENUSAUR:
        InitWindows(sWindowTemplates_Venusaur);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        LoadMonPicInWindow(SPECIES_VENUSAUR, SHINY_ODDS, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sVenusaur1_Tiles, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sVenusaur2_Tiles, 0, 0);
        break;
    case CREDITSMON_BLASTOISE:
        InitWindows(sWindowTemplates_Blastoise);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        LoadMonPicInWindow(SPECIES_BLASTOISE, SHINY_ODDS, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sBlastoise1_Tiles, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sBlastoise2_Tiles, 0, 0);
        break;
    case CREDITSMON_PIKACHU:
        InitWindows(sWindowTemplates_Pikachu);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        LoadMonPicInWindow(SPECIES_PIKACHU, SHINY_ODDS, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)sPikachu1_Tiles, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)sPikachu2_Tiles, 0, 0);
        break;
    }
    CopyWindowToVram(0, COPYWIN_GFX);
    CopyWindowToVram(1, COPYWIN_GFX);
    CopyWindowToVram(2, COPYWIN_GFX);
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
        ChangeBgX(0, 0, BG_COORD_SET);
        ChangeBgY(0, 0, BG_COORD_SET);
        ChangeBgX(1, 0, BG_COORD_SET);
        ChangeBgY(1, 0, BG_COORD_SET);
        sCreditsMgr->creditsMonTimer = 0;
        sCreditsMgr->unk_0E = 0;
        SetBgAffine(2, 0x8000, 0x8000, 0x78, 0x50, sCreditsMgr->creditsMonTimer, sCreditsMgr->creditsMonTimer, 0);
        DecompressAndLoadBgGfxUsingHeap(1, gCreditsMonPokeball_Tiles, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(2, sCreditsMonCircle_Tiles, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(1, gCreditsMonPokeball_Tilemap, 0x500, 0, 1);
        DecompressAndLoadBgGfxUsingHeap(2, sCreditsMonCircle_Tilemap, 0x400, 0, 1);
        LoadPalette(gCreditsMonPokeball_Pals[sCreditsMgr->whichMon], BG_PLTT_ID(0), PLTT_SIZE_4BPP);
        LoadPalette(sCreditsMonCircle_Pal, BG_PLTT_ID(15), sizeof(sCreditsMonCircle_Pal));
        LoadCreditsMonPic(sCreditsMgr->whichMon);
        SetVBlankCallback(VBlankCB);
        EnableInterrupts(INTR_FLAG_VBLANK);
        sCreditsMgr->subseqno++;
        break;
    case 1:
        FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 17);
        PutWindowTilemap(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        sCreditsMgr->subseqno++;
        break;
    case 2:
        ShowBg(2);
        ShowBg(0);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
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
            PlayCry_NormalNoDucking(GetCreditsMonSpecies(sCreditsMgr->whichMon), 0, CRY_VOLUME_RS, CRY_PRIORITY_NORMAL);
            sCreditsMgr->creditsMonTimer = 128;
            sCreditsMgr->subseqno++;
        }
        break;
    case 8:
        if (sCreditsMgr->creditsMonTimer != 0)
            sCreditsMgr->creditsMonTimer--;
        else
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
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
        ChangeBgX(0, 0, BG_COORD_SET);
        ChangeBgY(0, 0, BG_COORD_SET);
        DecompressAndLoadBgGfxUsingHeap(0, sCopyrightOrTheEndGfxHeaders[sCreditsMgr->whichMon].tiles, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(0, sCopyrightOrTheEndGfxHeaders[sCreditsMgr->whichMon].map, 0x800, 0, 1);
        LoadPalette(sCopyrightOrTheEndGfxHeaders[sCreditsMgr->whichMon].palette, BG_PLTT_ID(0), 16 * PLTT_SIZE_4BPP);
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
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0, RGB_BLACK);
        else
            BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
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
        if (gSprites[data->characterSpriteId].x != 0xD0)
        {
            gSprites[data->characterSpriteId].x--;
            gSprites[data->groundSpriteId].x--;
        }
        else
        {
            data->spriteMoveCmd = 0;
        }
        break;
    case 2:
        if (sCreditsMgr->unk_1D & 1)
        {
            if (gSprites[data->characterSpriteId].y != 0x50)
            {
                gSprites[data->characterSpriteId].y--;
                gSprites[data->groundSpriteId].y--;
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
            gSprites[data->characterSpriteId].x--;
            gSprites[data->groundSpriteId].x--;
        }
        break;
    }
}

static void DestroyPlayerOrRivalSprite(void)
{
    if (sCreditsMgr->taskId != TASK_NONE)
    {
        struct CreditsTaskData * data = (void *)gTasks[sCreditsMgr->taskId].data;
        FreeSpriteTilesByTag(data->characterTilesTag);
        DestroySprite(&gSprites[data->characterSpriteId]);
        FreeSpriteTilesByTag(data->groundTilesTag);
        DestroySprite(&gSprites[data->groundSpriteId]);
        DestroyTask(sCreditsMgr->taskId);
        sCreditsMgr->taskId = TASK_NONE;
    }
}

static void LoadPlayerOrRivalSprite(u8 whichScene)
{
    u8 taskId;
    struct CreditsTaskData * data;
    s32 x, y;
    struct SpriteTemplate sprTemplate;
    struct CompressedSpriteSheet sprSheet;

    if (sCreditsMgr->taskId == TASK_NONE)
    {
        taskId = CreateTask(Task_MovePlayerAndGroundSprites, 0);
        data = (void *)gTasks[taskId].data;
        sCreditsMgr->taskId = taskId;
        switch (sPlayerRivalSpriteParams[whichScene][2])
        {
        default:
        case 0:
            x = DISPLAY_WIDTH - 32;
            y = DISPLAY_HEIGHT / 2;
            break;
        case 1:
            x = DISPLAY_WIDTH + 32;
            y = DISPLAY_HEIGHT / 2;
            break;
        case 2:
            x = DISPLAY_WIDTH - 32;
            y = DISPLAY_HEIGHT;
            break;
        }
        data->spriteMoveCmd = sPlayerRivalSpriteParams[whichScene][2];
        data->characterTilesTag = GFXTAG_CHARACTER;
        data->characterPalTag = TAG_NONE;
        switch (sPlayerRivalSpriteParams[whichScene][0])
        {
        case 0:
            // Player
            if (gSaveBlock2Ptr->playerGender == MALE)
            {
                sprSheet.data = sPlayerMale_Tiles;
                sprSheet.size = 0x3000;
                sprSheet.tag = data->characterTilesTag;
                LoadCompressedSpriteSheet(&sprSheet);
                LoadPalette(sPlayerMale_Pal, OBJ_PLTT_ID(15), sizeof(sPlayerMale_Pal));
            }
            else
            {
                sprSheet.data = sPlayerFemale_Tiles;
                sprSheet.size = 0x3000;
                sprSheet.tag = data->characterTilesTag;
                LoadCompressedSpriteSheet(&sprSheet);
                LoadPalette(sPlayerFemale_Pal, OBJ_PLTT_ID(15), sizeof(sPlayerFemale_Pal));
            }
            break;
        case 1:
            // Rival
            sprSheet.data = sRival_Tiles;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->characterTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sRival_Pal, OBJ_PLTT_ID(15), sizeof(sRival_Pal));
            break;
        }
        sprTemplate = sPlayerOrRivalSpriteTemplate;
        sprTemplate.tileTag = data->characterTilesTag;
        data->characterSpriteId = CreateSprite(&sprTemplate, x, y, 0);
        gSprites[data->characterSpriteId].oam.paletteNum = 15;
        gSprites[data->characterSpriteId].subpriority = 0;

        data->groundTilesTag = GFXTAG_GROUND;
        data->groundPalTag = TAG_NONE;
        switch (sPlayerRivalSpriteParams[whichScene][1])
        {
        case 0:
            sprSheet.data = sGround_Grass_Tiles;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGround_Grass_Pal, OBJ_PLTT_ID(14), sizeof(sGround_Grass_Pal));
            sprTemplate = sGroundSpriteTemplate_Running;
            break;
        case 1:
            sprSheet.data = sGround_Grass_Tiles;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGround_Grass_Pal, OBJ_PLTT_ID(14), sizeof(sGround_Grass_Pal));
            sprTemplate = sGroundSpriteTemplate_Static;
            break;
        case 2:
            sprSheet.data = sGround_Dirt_Tiles;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGround_Dirt_Pal, OBJ_PLTT_ID(14), sizeof(sGround_Dirt_Pal));
            sprTemplate = sGroundSpriteTemplate_Running;
            break;
        case 3:
            sprSheet.data = sGround_City_Tiles;
            sprSheet.size = 0x3000;
            sprSheet.tag = data->groundTilesTag;
            LoadCompressedSpriteSheet(&sprSheet);
            LoadPalette(sGround_City_Pal, OBJ_PLTT_ID(14), sizeof(sGround_City_Pal));
            sprTemplate = sGroundSpriteTemplate_Running;
            break;
        }
        sprTemplate.tileTag = data->groundTilesTag;
        data->groundSpriteId = CreateSprite(&sprTemplate, x, y + 38, 0);
        gSprites[data->groundSpriteId].oam.paletteNum = 14;
        gSprites[data->groundSpriteId].subpriority = 1;
    }
}
