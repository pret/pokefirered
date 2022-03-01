#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "decompress.h"
#include "digit_obj_util.h"
#include "dynamic_placeholder_text_util.h"
#include "event_data.h"
#include "item.h"
#include "link.h"
#include "link_rfu.h"
#include "menu.h"
#include "minigame_countdown.h"
#include "new_menu_helpers.h"
#include "pokemon_jump.h"
#include "random.h"
#include "save.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "trig.h"
#include "constants/items.h"
#include "constants/songs.h"

struct PokemonJump1_MonInfo
{
    u16 species;
    u32 otId;
    u32 personality;
};

struct PokemonJump1_82E4
{
    int unk0;
    int unk4;
    u8 filler8[0x4];
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u16 unk12;
    int unk14;
    int unk18;
    u8 unk1C[11];
};

struct PokemonJump2
{
    int unk0;
    u16 unk4;
    u8 unk6;
    u8 filler7[0xa - 0x7];
    u8 unkA;
    u8 unkB;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u16 filler10;
    u16 unk12;
    u16 unk14;
    u32 unk18;
    u16 unk1C[5];
    u8 txtBuff[2][0x40];
    u8 strBuff[0x100];
    u16 tilemapBuffer[0x4000]; // Bug: way larger than it should be
    struct Sprite *unk81A8[MAX_RFU_PLAYERS];
    struct Sprite *unk81BC[MAX_RFU_PLAYERS];
    struct Sprite *unk81D0[8];
    u8 filler81F0[0xC];
    u8 unk81FC[MAX_RFU_PLAYERS];
};

struct PokemonJump1Sub
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u16 unk4;
    u32 unk8;
};

struct MonInfoPacket
{
    u8 id; // packet id
    u16 species;
    u32 personality;
    u32 otId;
};

struct PokemonJump1
{
    MainCallback returnCallback;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    int unk10;
    u32 unk14;
    u32 unk18;
    int unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    int unk2C;
    u32 unk30;
    u16 unk34;
    u16 unk36;
    u8 filler38[0x2];
    u16 unk3A;
    u16 unk3C;
    u16 unk3E;
    u16 unk40;
    u16 unk42;
    u8 unk44;
    u8 unk45;
    u8 unk46;
    u8 isLeader;
    u8 unk48;
    u8 unk49;
    u16 unk4A;
    u8 unk4C;
    u8 unk4D;
    u16 unk4E;
    u8 unk50;
    u8 unk51;
    u8 filler52[0x2];
    int unk54;
    int unk58;
    int unk5C;
    int unk60;
    int unk64;
    int unk68;
    int unk6C;
    struct PokemonJump1Sub unk70;
    u8 unk7C[MAX_RFU_PLAYERS];
    u8 unk81[MAX_RFU_PLAYERS];
    u8 unk86[MAX_RFU_PLAYERS];
    u8 unk8B[MAX_RFU_PLAYERS];
    u16 unk90[MAX_RFU_PLAYERS];
    u16 unk9A[MAX_RFU_PLAYERS];
    struct PokemonJump2 unkA4;
    struct PokemonJump1_MonInfo unk82A8[MAX_RFU_PLAYERS];
    struct PokemonJump1_82E4 unk82E4[MAX_RFU_PLAYERS];
    struct PokemonJump1_82E4 *unk83AC;
};


static void sub_8147654(u8 taskId);
static void sub_81477C0(u8 taskId);
static void sub_814784C(u8 taskId);
static void sub_81479D4(u8 taskId);
static void sub_8147A34(u8 taskId);
static void sub_8147B60(struct PokemonJump1 *);
static void sub_8147B94(struct PokemonJump1 *);
static void sub_8147C20(void);
static void sub_8147C98(void);
static s16 GetPokemonJumpSpeciesIdx(u16 species);
static void sub_8147D2C(struct PokemonJump1_MonInfo *monInfo, struct Pokemon *mon);
static void sub_8147D6C(void);
static void sub_8147DA0(u8 taskId);
static void sub_814807C(u8 taskId);
static void sub_8148104(void);
static void sub_8148290(u8 taskId);
static void sub_81482F8(void);
static bool32 sub_8148344(void);
static bool32 sub_81483D0(void);
static bool32 sub_8148464(void);
static bool32 sub_81484D0(void);
static bool32 sub_814856C(void);
static bool32 sub_81485C8(void);
static bool32 sub_8148664(void);
static bool32 sub_81486C4(void);
static bool32 sub_8148724(void);
static bool32 sub_8148760(void);
static bool32 sub_81487B4(void);
static bool32 sub_8148800(void);
static bool32 sub_814881C(void);
static bool32 sub_81488DC(void);
static bool32 sub_81489C8(void);
static bool32 sub_8148A60(void);
static bool32 sub_8148398(void);
static bool32 sub_8148418(void);
static bool32 sub_81484B0(void);
static bool32 sub_8148B54(void);
static bool32 sub_8148C80(void);
static bool32 sub_8148D5C(void);
static bool32 sub_8148E2C(void);
static void sub_8148E80(u8 taskId);
static void sub_8148F5C(TaskFunc func, u8 taskPriority);
static void sub_8148F7C(void);
static void sub_8148F9C(void);
static void sub_8148FE0(void);
static int sub_8149044(void);
static void sub_8149078(void);
static int sub_8149194(void);
static void sub_81491B4(void);
static void sub_81491E4(void);
static void sub_8149210(void);
static bool32 sub_814922C(u16);
static void sub_8149260(void);
static void sub_81492D8(void);
static void sub_814933C(void);
static void sub_814935C(void);
static void sub_814936C(void);
static void sub_814937C(void);
static void sub_8149490(int);
static void sub_8149534(void);
static bool32 sub_8149630(void);
static bool32 sub_81496D4(void);
static bool32 sub_8149710(void);
static bool32 sub_8149748(void);
static void sub_8149780(int);
static int sub_81497A8(void);
static bool32 sub_8149804(void);
static int sub_8149834(u8 *);
static void sub_8149878(void);
static int sub_8149888(int);
static void sub_8149898(u16);
static bool32 sub_81498B4(void);
static u16 sub_81498D8(void);
static void sub_8149900(u16, u16 *, u16 *);
static u16 sub_8149910(void);
static u16 sub_8149930(void);
static u16 sub_8149978(u16 item, u16 quantity);
static void sub_8149D80(void (*func)(void));
static void sub_8149DA4(u8 taskId);
static void sub_8149DC8(void);
static void sub_8149F64(void);
static void sub_8149FD0(void);
static void sub_814A03C(void);
static void sub_814A0C8(void);
static void sub_814A174(void);
static void sub_814A218(void);
static void sub_814A264(void);
static void sub_814A308(void);
static void sub_814A3AC(void);
static u32 sub_814A754(u32 left, u32 top, u32 width, u32 height);
static void sub_814A7D0(u16 left, u16 top, u8 cursorPos);
static void sub_814A84C(void);
static void sub_814A8B8(void);
static void sub_814A9C8(void);
static void sub_814AADC(void);
static void sub_814AC30(bool32 arg0);
static void sub_814AC94(void);
static void sub_814ACCC(u8 arg0);
static void sub_814AD50(u8 taskId);
static void sub_8149D34(struct PokemonJump2 *);
static void sub_814AF74(struct Sprite *sprite);
static void sub_814B038(struct Sprite *sprite);
static void sub_814B100(struct Sprite *sprite);
static void sub_814B1CC(struct Sprite *sprite);
static void Task_ShowPokemonJumpRecords(u8 taskId);
static void TruncateToFirstWordOnly(u8 *str);
static void sub_814B5C4(u16 windowId);
void sub_814A95C(int id);
void sub_8149CEC(struct PokemonJump2 *);
void sub_8149D24(void);
void sub_8149D40(int);
bool32 sub_8149D68(void);
void sub_814A3E4(void);
bool32 sub_814A408(void);
void sub_814A468(u16 itemId, u16 quantity);
void sub_814A53C(u16 itemId);
void sub_814A5B4(u16 itemId);
bool32 sub_814A62C(void);
void sub_814A6CC(void);
void sub_814A940(u32 id, s16 y);
void sub_814AA48(u8 multiplayerId);
bool32 sub_814A6FC(void);
void sub_814AA24(int);
s8 sub_814A744(void);
int sub_814A98C(u8 flags);
void sub_814AA34(u16);
void sub_814AA60(u8 multiplayerId);
int sub_814AA78(int multiplayerId);
void sub_814AA8C(void);
void sub_814AAA0(void);
void sub_814AAB4(int);
int sub_814AAC8(void);
void sub_8149A6C(struct PokemonJump1_MonInfo *arg0);
bool32 sub_8149A90(int multiplayerId, struct PokemonJump1_MonInfo *arg0);
void sub_8149AF8(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1);
bool32 sub_8149B7C(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1);
void sub_8149BF4(struct PokemonJump1_82E4 *arg0, u8 arg1, u16 arg2);
bool32 sub_8149C24(struct PokemonJump1_82E4 *arg0, int multiplayerId, u8 *arg2, u16 *arg3);
bool32 sub_8149C90(struct PokemonJump1_82E4 *arg0, int multiplayerId);
bool32 sub_814B494(u32 jumpScore, u16 jumpsInRow, u16 excellentsInRow);
void sub_814B4E8(void);
void sub_814AD6C(struct PokemonJump2 *);
void sub_814B294(struct PokemonJump2 *);
void sub_814B43C(struct PokemonJump2 *);
bool32 sub_814B460(void);
void sub_814B348(struct PokemonJump2 *, int);
void sub_814AF0C(struct PokemonJump2 *, int);
void sub_814ADCC(struct PokemonJump2 *, struct PokemonJump1_MonInfo *,s16, s16, u8);
void sub_814B240(struct PokemonJump2 *,s16, s16, u8);
void sub_814AFE8(struct PokemonJump2 *, int multiplayerId);
void sub_814B080(struct PokemonJump2 *, int multiplayerId);
bool32 sub_814B010(struct PokemonJump2 *, int multiplayerId);
void sub_814B0A8(struct PokemonJump2 *);
void sub_814B134(struct PokemonJump2 *);
void sub_814B168(struct PokemonJump2 *, int multiplayerId);
bool32 sub_814B190(struct PokemonJump2 *);

EWRAM_DATA static struct PokemonJump1 *gUnknown_203F3D4 = NULL;
EWRAM_DATA static struct PokemonJump2 *gUnknown_203F3D8 = NULL;

static const u16 gUnknown_846AFE8[] = INCBIN_U16("graphics/misc/unk_846B008.gbapal");
static const u32 gUnknown_846B008[] = INCBIN_U32("graphics/misc/unk_846B008.4bpp.lz");

static const struct CompressedSpriteSheet gUnknown_846B42C[] = {
    {gUnknown_846B008, 0x0C00, 0x2000},
    {}
};

static const struct SpritePalette gUnknown_846B43C[] = {
    {gUnknown_846AFE8, 0x2000},
    {}
};

static const union AnimCmd gUnknown_846B44C[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B454[] = {
    ANIMCMD_FRAME(0x10, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B45C[] = {
    ANIMCMD_FRAME(0x20, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B464[] = {
    ANIMCMD_FRAME(0x40, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B46C[] = {
    ANIMCMD_FRAME(0x30, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B474[] = {
    ANIMCMD_FRAME(0x50, 0),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_846B47C[] = {
    gUnknown_846B44C,
    gUnknown_846B454,
    gUnknown_846B45C,
    gUnknown_846B464,
    gUnknown_846B46C,
    gUnknown_846B474
};

static const struct SpriteTemplate gUnknown_846B494[] = {
    {
        .tileTag = 0x2000,
        .paletteTag = 0x2000,
        .oam = &gOamData_AffineOff_ObjNormal_32x32,
        .anims = gUnknown_846B47C,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    },
};

static const TaskFunc gUnknown_846B4AC[][4] = {
    { sub_81477C0, sub_814784C, sub_81479D4, sub_8147A34 }
};

/*
    According to the clerk, the Pokémon allowed in
    Pokémon Jump are all <= 28 inches, and do not
    only swim, burrow, or fly.
*/
static const struct PokemonJumpMons
{
    u16 species;
    u16 unk2;
} sPkmnJumpSpecies[] =
{
    { .species = SPECIES_BULBASAUR,  .unk2 = 2, },
    { .species = SPECIES_CHARMANDER, .unk2 = 1, },
    { .species = SPECIES_SQUIRTLE,   .unk2 = 0, },
    { .species = SPECIES_CATERPIE,   .unk2 = 1, },
    { .species = SPECIES_METAPOD,    .unk2 = 1, },
    { .species = SPECIES_WEEDLE,     .unk2 = 1, },
    { .species = SPECIES_KAKUNA,     .unk2 = 1, },
    { .species = SPECIES_RATTATA,    .unk2 = 1, },
    { .species = SPECIES_RATICATE,   .unk2 = 1, },
    { .species = SPECIES_PIKACHU,    .unk2 = 0, },
    { .species = SPECIES_SANDSHREW,  .unk2 = 0, },
    { .species = SPECIES_NIDORAN_F,  .unk2 = 0, },
    { .species = SPECIES_NIDORAN_M,  .unk2 = 0, },
    { .species = SPECIES_CLEFAIRY,   .unk2 = 0, },
    { .species = SPECIES_VULPIX,     .unk2 = 0, },
    { .species = SPECIES_JIGGLYPUFF, .unk2 = 2, },
    { .species = SPECIES_ODDISH,     .unk2 = 2, },
    { .species = SPECIES_PARAS,      .unk2 = 1, },
    { .species = SPECIES_MEOWTH,     .unk2 = 0, },
    { .species = SPECIES_PSYDUCK,    .unk2 = 2, },
    { .species = SPECIES_MANKEY,     .unk2 = 1, },
    { .species = SPECIES_GROWLITHE,  .unk2 = 1, },
    { .species = SPECIES_POLIWAG,    .unk2 = 2, },
    { .species = SPECIES_BELLSPROUT, .unk2 = 2, },
    { .species = SPECIES_SHELLDER,   .unk2 = 1, },
    { .species = SPECIES_KRABBY,     .unk2 = 1, },
    { .species = SPECIES_EXEGGCUTE,  .unk2 = 2, },
    { .species = SPECIES_CUBONE,     .unk2 = 0, },
    { .species = SPECIES_DITTO,      .unk2 = 2, },
    { .species = SPECIES_EEVEE,      .unk2 = 0, },
    { .species = SPECIES_OMANYTE,    .unk2 = 1, },
    { .species = SPECIES_KABUTO,     .unk2 = 1, },
    { .species = SPECIES_CHIKORITA,  .unk2 = 2, },
    { .species = SPECIES_CYNDAQUIL,  .unk2 = 1, },
    { .species = SPECIES_TOTODILE,   .unk2 = 0, },
    { .species = SPECIES_SPINARAK,   .unk2 = 1, },
    { .species = SPECIES_PICHU,      .unk2 = 0, },
    { .species = SPECIES_CLEFFA,     .unk2 = 0, },
    { .species = SPECIES_IGGLYBUFF,  .unk2 = 2, },
    { .species = SPECIES_TOGEPI,     .unk2 = 2, },
    { .species = SPECIES_MAREEP,     .unk2 = 0, },
    { .species = SPECIES_BELLOSSOM,  .unk2 = 2, },
    { .species = SPECIES_MARILL,     .unk2 = 2, },
    { .species = SPECIES_SUNKERN,    .unk2 = 2, },
    { .species = SPECIES_WOOPER,     .unk2 = 2, },
    { .species = SPECIES_PINECO,     .unk2 = 2, },
    { .species = SPECIES_SNUBBULL,   .unk2 = 0, },
    { .species = SPECIES_SHUCKLE,    .unk2 = 2, },
    { .species = SPECIES_TEDDIURSA,  .unk2 = 0, },
    { .species = SPECIES_SLUGMA,     .unk2 = 2, },
    { .species = SPECIES_SWINUB,     .unk2 = 0, },
    { .species = SPECIES_HOUNDOUR,   .unk2 = 1, },
    { .species = SPECIES_PHANPY,     .unk2 = 0, },
    { .species = SPECIES_PORYGON2,   .unk2 = 0, },
    { .species = SPECIES_TYROGUE,    .unk2 = 1, },
    { .species = SPECIES_SMOOCHUM,   .unk2 = 2, },
    { .species = SPECIES_ELEKID,     .unk2 = 1, },
    { .species = SPECIES_MAGBY,      .unk2 = 1, },
    { .species = SPECIES_LARVITAR,   .unk2 = 1, },
    { .species = SPECIES_TREECKO,    .unk2 = 1, },
    { .species = SPECIES_TORCHIC,    .unk2 = 2, },
    { .species = SPECIES_MUDKIP,     .unk2 = 0, },
    { .species = SPECIES_MARSHTOMP,  .unk2 = 0, },
    { .species = SPECIES_POOCHYENA,  .unk2 = 1, },
    { .species = SPECIES_ZIGZAGOON,  .unk2 = 0, },
    { .species = SPECIES_LINOONE,    .unk2 = 0, },
    { .species = SPECIES_WURMPLE,    .unk2 = 1, },
    { .species = SPECIES_SILCOON,    .unk2 = 2, },
    { .species = SPECIES_CASCOON,    .unk2 = 2, },
    { .species = SPECIES_LOTAD,      .unk2 = 2, },
    { .species = SPECIES_SEEDOT,     .unk2 = 1, },
    { .species = SPECIES_RALTS,      .unk2 = 0, },
    { .species = SPECIES_KIRLIA,     .unk2 = 0, },
    { .species = SPECIES_SURSKIT,    .unk2 = 2, },
    { .species = SPECIES_SHROOMISH,  .unk2 = 2, },
    { .species = SPECIES_NINCADA,    .unk2 = 1, },
    { .species = SPECIES_WHISMUR,    .unk2 = 0, },
    { .species = SPECIES_AZURILL,    .unk2 = 2, },
    { .species = SPECIES_SKITTY,     .unk2 = 0, },
    { .species = SPECIES_SABLEYE,    .unk2 = 0, },
    { .species = SPECIES_MAWILE,     .unk2 = 0, },
    { .species = SPECIES_ARON,       .unk2 = 1, },
    { .species = SPECIES_MEDITITE,   .unk2 = 2, },
    { .species = SPECIES_ELECTRIKE,  .unk2 = 1, },
    { .species = SPECIES_PLUSLE,     .unk2 = 1, },
    { .species = SPECIES_MINUN,      .unk2 = 1, },
    { .species = SPECIES_VOLBEAT,    .unk2 = 0, },
    { .species = SPECIES_ILLUMISE,   .unk2 = 0, },
    { .species = SPECIES_ROSELIA,    .unk2 = 2, },
    { .species = SPECIES_GULPIN,     .unk2 = 2, },
    { .species = SPECIES_NUMEL,      .unk2 = 2, },
    { .species = SPECIES_TORKOAL,    .unk2 = 2, },
    { .species = SPECIES_SPOINK,     .unk2 = 0, },
    { .species = SPECIES_TRAPINCH,   .unk2 = 2, },
    { .species = SPECIES_CACNEA,     .unk2 = 2, },
    { .species = SPECIES_ANORITH,    .unk2 = 1, },
    { .species = SPECIES_WYNAUT,     .unk2 = 0, },
    { .species = SPECIES_SNORUNT,    .unk2 = 0, },
    { .species = SPECIES_CLAMPERL,   .unk2 = 1, },
    { .species = SPECIES_BAGON,      .unk2 = 1, },
};

static bool32 (* const gUnknown_846B64C[])(void) =
{
    sub_8148344,
    sub_81483D0,
    sub_8148464,
    sub_81484D0,
    sub_81485C8,
    sub_81486C4,
    sub_8148760,
    sub_81487B4,
    sub_814881C,
};


static bool32 (* const gUnknown_846B670[])(void) =
{
    sub_8148398,
    sub_8148418,
    sub_81484B0,
    sub_814856C,
    sub_8148664,
    sub_8148724,
    sub_8148760,
    sub_8148800,
    sub_814881C,
};

// Unused, but looks like it was intended to be a hook
UNUSED u8 sub_81475C0(u8 data1, u8 priority)
{
    u8 taskId;
    struct Task * task;

    taskId = CreateTask(sub_8147654, priority);
    task = &gTasks[taskId];
    task->data[0] = 1;
    task->data[1] = data1;
    gUnknown_846B4AC[data1][0](taskId);
    return taskId;
}

// Unused, but looks like it was intended to be a hook
UNUSED bool32 sub_814760C(void)
{
    u8 taskId;

    taskId = FindTaskIdByFunc(sub_8147654);
    if (taskId == 0xFF)
        return FALSE;
    gTasks[taskId].data[0] = 2;
    return TRUE;
}

// Unused, but looks like it was intended to be a hook
UNUSED bool32 sub_8147640(void)
{
    return FuncIsActiveTask(sub_8147654);
}

static void sub_8147654(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 2:
        gUnknown_846B4AC[data[1]][2](taskId);
        data[0] = 3;
        break;
    case 3:
        gUnknown_846B4AC[data[1]][3](taskId);
        break;
    case 4:
        gUnknown_846B4AC[data[1]][1](taskId);
        DestroyTask(taskId);
        break;
    }
}

static void sub_81476E0(u8 taskId, s16 *data)
{
    u8 i;
    struct Sprite *sprite;

    LoadCompressedSpriteSheet(&gUnknown_846B42C[data[3]]);
    LoadSpritePalette(&gUnknown_846B43C[data[4]]);
    for (i = 0; i < data[8]; i++)
        data[13 + i] = CreateSprite(&gUnknown_846B494[data[2]], data[9], data[10], data[7]);
    for (i = 0; i < data[8]; i++)
    {
        sprite = &gSprites[data[13 + i]];
        sprite->oam.priority = data[6];
        sprite->invisible = TRUE;
        sprite->data[1] = data[5];
        sprite->data[3] = taskId;
        sprite->data[4] = i;
        sprite->data[5] = data[13];
    }
}

static void sub_81477C0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[2] = 0;
    data[3] = 0;
    data[4] = 0;
    data[5] = 60;
    data[6] = 0;
    data[7] = 0;
    data[8] = 3;
    data[9] = 120;
    data[10] = 88;
    sub_81476E0(taskId, data);

    StartSpriteAnim(&gSprites[data[14]], 4);
    gSprites[data[14]].x2 = -32;

    StartSpriteAnim(&gSprites[data[15]], 5);
    gSprites[data[15]].x2 = 32;
}

static void sub_814784C(u8 taskId)
{
    u8 i = 0;
    s16 *data = gTasks[taskId].data;

    for (i = 0; i < data[8]; i++)
        DestroySprite(&gSprites[data[13 + i]]);
    FreeSpriteTilesByTag(gUnknown_846B42C[data[3]].tag);
    FreeSpritePaletteByTag(gUnknown_846B43C[data[4]].tag);
}

static void sub_81478BC(struct Sprite *sprite)
{
    s16 *data = gTasks[sprite->data[3]].data;

    if (data[11] % data[5] != 0)
        return;
    if (data[11] == data[10])
        return;

    data[10] = data[11];
    switch (sprite->data[2])
    {
    case 0:
        sprite->invisible = FALSE;
    case 1:
    case 2:
        PlaySE(SE_BALL_BOUNCE_1);
        StartSpriteAnim(sprite, sprite->data[2]);
        break;
    case 3:
        PlaySE(SE_PIN);
        StartSpriteAnim(sprite, sprite->data[2]);
        gSprites[data[14]].invisible = FALSE;
        gSprites[data[15]].invisible = FALSE;
        break;
    case 4:
        sprite->invisible = TRUE;
        gSprites[data[14]].invisible = TRUE;
        gSprites[data[15]].invisible = TRUE;
        data[0] = 4;
        return;
    }
    sprite->data[2]++;
}

static void sub_81479D4(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    PlaySE(SE_BALL_BOUNCE_1);
    gSprites[data[13]].callback = sub_81478BC;
    gSprites[data[13]].invisible = FALSE;
    gTasks[taskId].data[0] = 3;
}

static void sub_8147A34(u8 taskId)
{
    u16 packet[6];
    s16 *data = gTasks[taskId].data;

    if (gReceivedRemoteLinkPlayers)
    {
        if (gRecvCmds[0][1] == 0x7FFF)
            data[11] = gRecvCmds[0][2];
        if (GetMultiplayerId() == 0)
        {
            data[12]++;
            memset(packet, 0, sizeof(packet));
            packet[0] = 0x7FFF;
            packet[1] = data[12];
            Rfu_SendPacket(packet);
        }
    }
    else
    {
        data[11]++;
    }
}

void StartPokemonJump(u16 partyIndex, MainCallback callback)
{
    u8 taskId;

    if (gReceivedRemoteLinkPlayers)
    {
        gUnknown_203F3D4 = Alloc(sizeof(*gUnknown_203F3D4));
        if (gUnknown_203F3D4 != NULL)
        {
            ResetTasks();
            taskId = CreateTask(sub_8147DA0, 1);
            gUnknown_203F3D4->unk8 = 0;
            gUnknown_203F3D4->returnCallback = callback;
            gUnknown_203F3D4->unk4 = taskId;
            gUnknown_203F3D4->unk6 = GetMultiplayerId();
            sub_8147D2C(&gUnknown_203F3D4->unk82A8[gUnknown_203F3D4->unk6], &gPlayerParty[partyIndex]);
            sub_8147B60(gUnknown_203F3D4);
            SetWordTaskArg(taskId, 2, (uintptr_t)gUnknown_203F3D4);
            SetMainCallback2(sub_8147D6C);
            return;
        }
    }

    SetMainCallback2(callback);
}

static void sub_8147B48(void)
{
    sub_8149D24();
    Free(gUnknown_203F3D4);
}

static void sub_8147B60(struct PokemonJump1 *arg0)
{
    arg0->unk5 = GetLinkPlayerCount();
    arg0->unk70.unk0 = 5;
    arg0->unk70.unk2 = 0;
    sub_8147C20();
    sub_8147B94(arg0);
    if (arg0->unk5 == MAX_RFU_PLAYERS)
        sub_814B4E8();
}

static void sub_8147B94(struct PokemonJump1 *arg0)
{
    int i;

    arg0->unk14 = 6;
    arg0->unk18 = 6;
    arg0->unk4A = 0;
    arg0->unk1C = 0;
    arg0->unk5C = 0;
    arg0->isLeader = GetMultiplayerId() == 0;
    arg0->unk8 = 0;
    arg0->unkA = 0;
    arg0->unkC = 0;
    arg0->unkE = 0;
    arg0->unk58 = 0;
    arg0->unk3A = 0;
    arg0->unk44 = 0;
    arg0->unk54 = 0;
    arg0->unk46 = 0;
    arg0->unk49 = 0;
    arg0->unk48 = 1;
    arg0->unk70.unk8 = 0;
    arg0->unk70.unk1 = 0;
    arg0->unk70.unk4 = 0;
    arg0->unk60 = 1;
    arg0->unk4D = 0;
    arg0->unk68 = 0;
    arg0->unk64 = 0;
    arg0->unk2C = 0;
    arg0->unk30 = 0;
    sub_8147C98();
    sub_81491E4();

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        arg0->unk7C[i] = 0;
        arg0->unk9A[i] = 0;
    }
}

static void sub_8147C20(void)
{
    int i, index;

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        index = GetPokemonJumpSpeciesIdx(gUnknown_203F3D4->unk82A8[i].species);
        gUnknown_203F3D4->unk82E4[i].unkC = sPkmnJumpSpecies[index].unk2;
    }

    gUnknown_203F3D4->unk83AC = &gUnknown_203F3D4->unk82E4[gUnknown_203F3D4->unk6];
}

static void sub_8147C98(void)
{
    int i;

    for (i = 0; i < MAX_RFU_PLAYERS; i++)
    {
        gUnknown_203F3D4->unk82E4[i].unkE = 0;
        gUnknown_203F3D4->unk82E4[i].unk10 = 0;
        gUnknown_203F3D4->unk82E4[i].unk12 = 0;
        gUnknown_203F3D4->unk82E4[i].unk0 = 0;
        gUnknown_203F3D4->unk82E4[i].unk4 = 0x7FFFFFFF;
        gUnknown_203F3D4->unk82E4[i].unk14 = 0;
        gUnknown_203F3D4->unk8B[i] = 9;
    }
}

static s16 GetPokemonJumpSpeciesIdx(u16 species)
{
    u32 i;
    for (i = 0; i < NELEMS(sPkmnJumpSpecies); i++)
    {
        if (sPkmnJumpSpecies[i].species == species)
            return i;
    }

    return -1; // species isnt allowed
}

static void sub_8147D2C(struct PokemonJump1_MonInfo *monInfo, struct Pokemon *mon)
{
    monInfo->species = GetMonData(mon, MON_DATA_SPECIES);
    monInfo->otId = GetMonData(mon, MON_DATA_OT_ID);
    monInfo->personality = GetMonData(mon, MON_DATA_PERSONALITY);
}

static void sub_8147D58(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void sub_8147D6C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_8147D84(TaskFunc func)
{
    gUnknown_203F3D4->unk4 = CreateTask(func, 1);
    gUnknown_203F3D4->unk8 = 0;
}

static void sub_8147DA0(u8 taskId)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        SetVBlankCallback(NULL);
        ResetSpriteData();
        FreeAllSpritePalettes();
        sub_8148F5C(sub_8148E80, 5);
        FadeOutMapMusic(4);
        gUnknown_203F3D4->unk8++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_8148E80))
        {
            sub_8149CEC(&gUnknown_203F3D4->unkA4);
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 2:
        if (!sub_8149D68() && IsNotWaitingForBGMStop() == TRUE)
        {
            FadeOutAndPlayNewMapMusic(MUS_POKE_JUMP, 8);
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            SetVBlankCallback(sub_8147D58);
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 4:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            gUnknown_203F3D4->unk7 = 0;
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 5:
        gUnknown_203F3D4->unk7++;
        if (gUnknown_203F3D4->unk7 >= 20)
        {
            if (gUnknown_203F3D4->isLeader)
                sub_8147D84(sub_814807C);
            else
                sub_8147D84(sub_8148290);

            sub_8148F7C();
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_8147F10(int arg0)
{
    if (arg0 == 0)
    {
        gUnknown_203F3D4->unk30 = 0x1111;
        gUnknown_203F3D4->unk2C = 1;
    }
    else
    {
        gUnknown_203F3D4->unk30 = (1 << (arg0 - 1)) - 1;
        gUnknown_203F3D4->unk2C = 0;
    }
}

static void sub_8147F4C(u8 arg0)
{
    int i;

    gUnknown_203F3D4->unk70.unk0 = arg0;
    gUnknown_203F3D4->unk8 = 0;
    gUnknown_203F3D4->unkA = 0;
    gUnknown_203F3D4->unk48 = 1;
    gUnknown_203F3D4->unk49 = 0;
    for (i = 1; i < gUnknown_203F3D4->unk5; i++)
        gUnknown_203F3D4->unk82E4[i].unk18 = 0;
}

static void sub_8147FA0(void)
{
    int i;
    int count;
    u16 var0;
    u8 var1;
    u16 var2;

    for (i = 1, count = 0; i < gUnknown_203F3D4->unk5; i++)
    {
        var0 = gUnknown_203F3D4->unk82E4[i].unk10;
        if (sub_8149C24(&gUnknown_203F3D4->unk82E4[i], i, &var1, &var2))
        {
            gUnknown_203F3D4->unk90[i] = var2;
            gUnknown_203F3D4->unk8B[i] = var1;
            gUnknown_203F3D4->unk82E4[i].unk12 = var0;
        }

        if (gUnknown_203F3D4->unk82E4[i].unk18 && gUnknown_203F3D4->unk8B[i] == gUnknown_203F3D4->unk70.unk0)
            count++;
    }

    if (count == gUnknown_203F3D4->unk5 - 1)
        gUnknown_203F3D4->unk49 = 1;
}

static void sub_814807C(u8 taskId)
{
    sub_8147FA0();
    sub_8149534();
    if (!gUnknown_203F3D4->unk48 && gUnknown_203F3D4->unk49)
    {
        sub_8147F4C(gUnknown_203F3D4->unk4C);
        sub_8147F10(3);
    }

    if (gUnknown_203F3D4->unk48 == 1)
    {
        if (!gUnknown_846B64C[gUnknown_203F3D4->unk70.unk0]())
        {
            gUnknown_203F3D4->unk48 = 0;
            gUnknown_203F3D4->unk82E4[gUnknown_203F3D4->unk6].unk18 = 1;
        }
    }

    sub_81492D8();
    sub_8148104();
}

static void sub_8148104(void)
{
    if (!gUnknown_203F3D4->unk2C)
        sub_8149AF8(gUnknown_203F3D4->unk82E4, &gUnknown_203F3D4->unk70);

    if (gUnknown_203F3D4->unk30 != 0x1111)
    {
        gUnknown_203F3D4->unk2C++;
        gUnknown_203F3D4->unk2C &= gUnknown_203F3D4->unk30;
    }
}

static void sub_8148140(u8 arg0)
{
    gUnknown_203F3D4->unk70.unk0 = arg0;
    gUnknown_203F3D4->unk8 = 0;
    gUnknown_203F3D4->unkA = 0;
    gUnknown_203F3D4->unk48 = 1;
    gUnknown_203F3D4->unk82E4[gUnknown_203F3D4->unk6].unk18 = 0;
}

static void sub_8148174(void)
{
    int i;
    u16 var0;
    struct PokemonJump1Sub sp0;

    var0 = gUnknown_203F3D4->unk82E4[0].unk10;
    if (sub_8149B7C(gUnknown_203F3D4->unk82E4, &sp0))
    {
        if (gUnknown_203F3D4->unk82E4[gUnknown_203F3D4->unk6].unk18 == 1
         && sp0.unk0 != gUnknown_203F3D4->unk70.unk0)
        {
            sub_8148140(sp0.unk0);
        }

        if (gUnknown_203F3D4->unk70.unk8 != sp0.unk8)
        {
            gUnknown_203F3D4->unk70.unk8 = sp0.unk8;
            gUnknown_203F3D4->unk5C = 1;
            gUnknown_203F3D4->unk70.unk1 = sp0.unk1;
            if (gUnknown_203F3D4->unk70.unk1)
                gUnknown_203F3D4->unk4D = 1;
            else
                gUnknown_203F3D4->unk4D = 0;
        }

        gUnknown_203F3D4->unk70.unk2 = sp0.unk2;
        gUnknown_203F3D4->unk70.unk4 = sp0.unk4;
        gUnknown_203F3D4->unk82E4[0].unk12 = var0;
    }

    for (i = 1; i < gUnknown_203F3D4->unk5; i++)
    {
        if (i != gUnknown_203F3D4->unk6)
        {
            var0 = gUnknown_203F3D4->unk82E4[i].unk10;
            if (sub_8149C90(&gUnknown_203F3D4->unk82E4[i], i))
                gUnknown_203F3D4->unk82E4[i].unk12 = var0;
        }
    }
}

static void sub_8148290(u8 taskId)
{
    sub_8148174();
    if (gUnknown_203F3D4->unk48)
    {
        if (!gUnknown_846B670[gUnknown_203F3D4->unk70.unk0]())
        {
            gUnknown_203F3D4->unk48 = 0;
            gUnknown_203F3D4->unk82E4[gUnknown_203F3D4->unk6].unk18 = 1;
            sub_8147F10(3);
        }
    }

    sub_81492D8();
    sub_81482F8();
}

static void sub_81482F8(void)
{
    if (!gUnknown_203F3D4->unk2C)
        sub_8149BF4(&gUnknown_203F3D4->unk82E4[gUnknown_203F3D4->unk6], gUnknown_203F3D4->unk70.unk0, gUnknown_203F3D4->unk42);

    if (gUnknown_203F3D4->unk30 != 0x1111)
    {
        gUnknown_203F3D4->unk2C++;
        gUnknown_203F3D4->unk2C &= gUnknown_203F3D4->unk30;
    }
}

static bool32 sub_8148344(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_8147F10(3);
        gUnknown_203F3D4->unk8++;
        // fall through
    case 1:
        if (!sub_81488DC())
        {
            gUnknown_203F3D4->unk70.unk2 = gUnknown_203F3D4->unk4A;
            gUnknown_203F3D4->unk4C = 1;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool32 sub_8148398(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_8147F10(0);
        gUnknown_203F3D4->unk24 = gUnknown_203F3D4->unk70.unk2;
        gUnknown_203F3D4->unk8++;
        // fall through
    case 1:
        return sub_81488DC();
    }

    return TRUE;
}

static bool32 sub_81483D0(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_81491E4();
        sub_8147F10(5);
        gUnknown_203F3D4->unk8++;
        break;
    case 1:
        if (gUnknown_203F3D4->unk49)
        {
            gUnknown_203F3D4->unk4C = 2;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool32 sub_8148418(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_81491E4();
        sub_8147F10(0);
        gUnknown_203F3D4->unk4A = gUnknown_203F3D4->unk70.unk2;
        gUnknown_203F3D4->unk8++;
        // fall through
    case 1:
        if (sub_8149804())
            return FALSE;
        break;
    }

    return TRUE;
}

static bool32 sub_8148464(void)
{
    if (!sub_81489C8())
    {
        gUnknown_203F3D4->unk70.unk2 = gUnknown_203F3D4->unk4A;
        gUnknown_203F3D4->unk4C = 1;
    }
    else if (sub_8149630())
    {
        return TRUE;
    }
    else
    {
        sub_81491B4();
        gUnknown_203F3D4->unk4C = 3;
    }

    return FALSE;
}

static bool32 sub_81484B0(void)
{
    if (!sub_81489C8())
        ;
    else if (sub_8149630())
        return TRUE;
    else
        sub_81491B4();

    return FALSE;
}

static bool32 sub_81484D0(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_8149630();
        if (sub_81496D4())
            gUnknown_203F3D4->unk8++;
        break;
    case 1:
        if (!sub_8148A60())
        {
            if (sub_81498B4())
            {
                gUnknown_203F3D4->unk70.unk2 = sub_81498D8();
                gUnknown_203F3D4->unk4C = 7;
            }
            else if (gUnknown_203F3D4->unk70.unk4 >= 200)
            {
                gUnknown_203F3D4->unk70.unk2 = gUnknown_203F3D4->unkE;
                gUnknown_203F3D4->unk4C = 8;
            }
            else
            {
                gUnknown_203F3D4->unk70.unk2 = gUnknown_203F3D4->unkE;
                gUnknown_203F3D4->unk4C = 4;
            }

            gUnknown_203F3D4->unk8++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool32 sub_814856C(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        if (!sub_8149630())
            sub_81491B4();
        if (sub_81496D4())
            gUnknown_203F3D4->unk8++;
        break;
    case 1:
        if (!sub_8148A60())
        {
            gUnknown_203F3D4->unk8++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool32 sub_81485C8(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_8147F10(4);
        gUnknown_203F3D4->unk8++;
        // fall through
    case 1:
        if (!sub_8148C80())
        {
            sub_814B494(gUnknown_203F3D4->unk70.unk8, gUnknown_203F3D4->unk70.unk4, gUnknown_203F3D4->unk70.unk2);
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 2:
        if (gUnknown_203F3D4->unk49)
        {
            if (sub_8149748())
                gUnknown_203F3D4->unk4C = 5;
            else
                gUnknown_203F3D4->unk4C = 6;

            gUnknown_203F3D4->unk8++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool32 sub_8148664(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_8147F10(0);
        gUnknown_203F3D4->unk8++;
        // fall through
    case 1:
        if (!sub_8148C80())
        {
            sub_814B494(gUnknown_203F3D4->unk70.unk8, gUnknown_203F3D4->unk70.unk4, gUnknown_203F3D4->unk70.unk2);
            gUnknown_203F3D4->unk42 = gUnknown_203F3D4->unk45;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool32 sub_81486C4(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        if (!sub_8148E2C())
            gUnknown_203F3D4->unk8++;
        break;
    case 1:
        if (gUnknown_203F3D4->unk49)
        {
            sub_8147B94(gUnknown_203F3D4);
            gUnknown_203F3D4->unk24 = Random();
            gUnknown_203F3D4->unk70.unk2 = gUnknown_203F3D4->unk24;
            gUnknown_203F3D4->unk4C = 0;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool32 sub_8148724(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        if (!sub_8148E2C())
        {
            sub_8147B94(gUnknown_203F3D4);
            gUnknown_203F3D4->unk8++;
            return FALSE;
        }
        break;
    case 1:
        return FALSE;
    }

    return TRUE;
}

static bool32 sub_8148760(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        gUnknown_203F3D4->unk8 = 1;
        break;
    case 1:
        sub_8147F10(0);
        gUnknown_203F3D4->unk8++;
        break;
    case 2:
        if (!sub_8148D5C())
        {
            SetMainCallback2(gUnknown_203F3D4->returnCallback);
            sub_8147B48();
        }
        break;
    }

    return TRUE;
}

static bool32 sub_81487B4(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_8147F10(4);
        gUnknown_203F3D4->unk8++;
        break;
    case 1:
        if (!sub_8148B54())
        {
            gUnknown_203F3D4->unk70.unk2 = gUnknown_203F3D4->unkE;
            gUnknown_203F3D4->unk4C = 8;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool32 sub_8148800(void)
{
    sub_8147F10(0);
    if (!sub_8148B54())
        return FALSE;
    else
        return TRUE;
}

static bool32 sub_814881C(void)
{
    switch (gUnknown_203F3D4->unk8)
    {
    case 0:
        sub_814B494(gUnknown_203F3D4->unk70.unk8, gUnknown_203F3D4->unk70.unk4, gUnknown_203F3D4->unk70.unk2);
        sub_8149D40(5);
        gUnknown_203F3D4->unk8++;
        break;
    case 1:
        if (!sub_8149D68())
        {
            sub_8147F10(0);
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 2:
        if (sub_8149804())
        {
            CreateTask(Task_LinkSave, 6);
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 3:
        if (!FuncIsActiveTask(Task_LinkSave))
        {
            sub_814A6CC();
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 4:
        if (!sub_814A6FC())
        {
            gUnknown_203F3D4->unk4C = 4;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool32 sub_81488DC(void)
{
    switch (gUnknown_203F3D4->unkA)
    {
    case 0:
        sub_8149D40(2);
        sub_814AAA0();
        gUnknown_203F3D4->unkA++;
        break;
    case 1:
        if (!sub_8149D68())
        {
            sub_814AAB4(gUnknown_203F3D4->unk6);
            gUnknown_203F3D4->unk3C = 0;
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 2:
        if (++gUnknown_203F3D4->unk3C > 120)
        {
            sub_8149D40(3);
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 3:
        if (sub_8149D68() != 1 && sub_814AAC8() != 1)
            gUnknown_203F3D4->unkA++;
        break;
    case 4:
        sub_8149D40(9);
        gUnknown_203F3D4->unkA++;
        break;
    case 5:
        if (!sub_8149D68())
        {
            sub_814935C();
            sub_814A3E4();
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 6:
        if (!sub_814A408())
        {
            sub_814936C();
            sub_8148F9C();
            gUnknown_203F3D4->unkA++;
            return FALSE;
        }
        break;
    case 7:
        return FALSE;
    }

    return TRUE;
}

static bool32 sub_81489C8(void)
{
    sub_8148FE0();
    if (gUnknown_203F3D4->unk36)
    {
        gUnknown_203F3D4->unk36 = 0;
        return FALSE;
    }

    switch (gUnknown_203F3D4->unkA)
    {
    case 0:
        if (sub_814922C(0))
            gUnknown_203F3D4->unkA++;
        else
            break;
        // fall through
    case 1:
        if (gMain.newKeys & A_BUTTON)
        {
            sub_8149260();
            sub_8147F10(3);
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 2:
        if (sub_814922C(1) == TRUE)
            gUnknown_203F3D4->unkA++;
        break;
    case 3:
        if (sub_814922C(0) == TRUE)
            gUnknown_203F3D4->unkA = 0;
        break;
    }

    return TRUE;
}

static bool32 sub_8148A60(void)
{
    int i;

    switch (gUnknown_203F3D4->unkA)
    {
    case 0:
        for (i = 0; i < gUnknown_203F3D4->unk5; i++)
        {
            if (sub_814AA78(i) == 1)
                return TRUE;
        }

        gUnknown_203F3D4->unkA++;
        break;
    case 1:
        for (i = 0; i < gUnknown_203F3D4->unk5; i++)
        {
            if (gUnknown_203F3D4->unk82E4[i].unk10 == 2)
                sub_814AA60(i);
        }

        sub_8149D40(1);
        gUnknown_203F3D4->unk3C = 0;
        gUnknown_203F3D4->unkA++;
        break;
    case 2:
        if (++gUnknown_203F3D4->unk3C > 100)
        {
            sub_8149D40(3);
            gUnknown_203F3D4->unk3C = 0;
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 3:
        if (!sub_8149D68())
        {
            sub_814AA8C();
            gUnknown_203F3D4->unk70.unk1 = 0;
            sub_8149210();
            gUnknown_203F3D4->unkA++;
            return FALSE;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static bool32 sub_8148B54(void)
{
    switch (gUnknown_203F3D4->unkA)
    {
    case 0:
        sub_8149900(gUnknown_203F3D4->unk70.unk2, &gUnknown_203F3D4->unk3E, &gUnknown_203F3D4->unk40);
        sub_814A468(gUnknown_203F3D4->unk3E, gUnknown_203F3D4->unk40);
        gUnknown_203F3D4->unkA++;
        break;
    case 1:
    case 4:
        if (!sub_814A62C())
        {
            gUnknown_203F3D4->unk3C = 0;
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 2:
    case 5:
        gUnknown_203F3D4->unk3C++;
        if (gMain.newKeys & (A_BUTTON | B_BUTTON) || gUnknown_203F3D4->unk3C > 180)
        {
            sub_814A6CC();
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 3:
        if (!sub_814A6FC())
        {
            gUnknown_203F3D4->unk40 = sub_8149978(gUnknown_203F3D4->unk3E, gUnknown_203F3D4->unk40);
            if (gUnknown_203F3D4->unk40 && AddBagItem(gUnknown_203F3D4->unk3E, gUnknown_203F3D4->unk40))
            {
                if (!CheckBagHasSpace(gUnknown_203F3D4->unk3E, 1))
                {
                    sub_814A53C(gUnknown_203F3D4->unk3E);
                    gUnknown_203F3D4->unkA = 4;
                }
                else
                {
                    gUnknown_203F3D4->unkA = 6;
                    break;
                }
            }
            else
            {
                sub_814A5B4(gUnknown_203F3D4->unk3E);
                gUnknown_203F3D4->unkA = 4;
            }
        }
        break;
    case 6:
        if (!sub_814A6FC())
            return FALSE;
        break;
    }

    return TRUE;
}

static bool32 sub_8148C80(void)
{
    s8 input;

    switch (gUnknown_203F3D4->unkA)
    {
    case 0:
        sub_8149D40(4);
        gUnknown_203F3D4->unkA++;
        break;
    case 1:
        if (!sub_8149D68())
            gUnknown_203F3D4->unkA++;
        break;
    case 2:
        input = sub_814A744();
        switch (input)
        {
        case MENU_B_PRESSED:
        case 1:
            gUnknown_203F3D4->unk45 = 1;
            sub_8149D40(6);
            gUnknown_203F3D4->unkA++;
            break;
        case 0:
            gUnknown_203F3D4->unk45 = 2;
            sub_8149D40(6);
            gUnknown_203F3D4->unkA++;
            break;
        }
        break;
    case 3:
        if (!sub_8149D68())
            gUnknown_203F3D4->unkA++;
        break;
    case 4:
        sub_8149D40(8);
        gUnknown_203F3D4->unkA++;
        break;
    case 5:
        if (!sub_8149D68())
        {
            gUnknown_203F3D4->unkA++;
            return FALSE;
        }
        break;
    case 6:
        return FALSE;
    }

    return TRUE;
}

static bool32 sub_8148D5C(void)
{
    int var0;

    switch (gUnknown_203F3D4->unkA)
    {
    case 0:
        sub_814A6CC();
        gUnknown_203F3D4->unkA++;
        break;
    case 1:
        if (!sub_814A6FC())
        {
            sub_8149D40(7);
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 2:
        var0 = sub_8149D68();
        if (!var0)
        {
            gUnknown_203F3D4->unk3C = var0;
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 3:
        if (++gUnknown_203F3D4->unk3C > 120)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            SetCloseLinkCallback();
            gUnknown_203F3D4->unkA++;
        }
        break;
    case 5:
        if (!gReceivedRemoteLinkPlayers)
            return FALSE;
        break;
    }

    return TRUE;
}

static bool32 sub_8148E2C(void)
{
    switch (gUnknown_203F3D4->unkA)
    {
    case 0:
        sub_814A6CC();
        sub_814AA24(0);
        gUnknown_203F3D4->unkA++;
        break;
    case 1:
        if (!sub_814A6FC())
        {
            gUnknown_203F3D4->unkA++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static void sub_8148E80(u8 taskId)
{
    int i;
    s16 *taskData = gTasks[taskId].data;
    struct PokemonJump1 *ptr = (struct PokemonJump1 *)GetWordTaskArg(taskId, 14);

    switch (taskData[0])
    {
    case 0:
        for (i = 0; i < MAX_RFU_PLAYERS; i++)
            taskData[i + 2] = 0;

        taskData[0]++;
        // fall through
    case 1:
        sub_8149A6C(&ptr->unk82A8[ptr->unk6]);
        for (i = 0; i < MAX_RFU_PLAYERS; i++)
        {
            if (!taskData[i + 2] && sub_8149A90(i, &ptr->unk82A8[i]))
            {
                StringCopy(ptr->unk82E4[i].unk1C, gLinkPlayers[i].name);
                taskData[i + 2] = 1;
                taskData[1]++;
                if (taskData[1] == ptr->unk5)
                {
                    sub_8147C20();
                    DestroyTask(taskId);
                    break;
                }
            }
        }
        break;
    }
}

static void sub_8148F5C(TaskFunc func, u8 taskPriority)
{
    u8 taskId = CreateTask(func, taskPriority);
    SetWordTaskArg(taskId, 14, (uintptr_t)gUnknown_203F3D4);
}

static void sub_8148F7C(void)
{
    gUnknown_203F3D4->unk4A = 0;
    gUnknown_203F3D4->unk14 = 6;
    gUnknown_203F3D4->unk34 = 0;
    gUnknown_203F3D4->unk1C = 0;
    gUnknown_203F3D4->unk36 = 0;
    gUnknown_203F3D4->unk10 = 0;
}

static void sub_8148F9C(void)
{
    gUnknown_203F3D4->unk4A = 0;
    gUnknown_203F3D4->unk34 = 0x6FF;
    gUnknown_203F3D4->unk14 = 7;
    gUnknown_203F3D4->unk36 = 0;
    gUnknown_203F3D4->unk10 = 0;
    gUnknown_203F3D4->unk51 = 0;
    gUnknown_203F3D4->unk50 = 0;
    gUnknown_203F3D4->unk20 = 0;
    gUnknown_203F3D4->unk4E = 0;
    gUnknown_203F3D4->unk6C = 0;
    sub_8149078();
}

static void sub_8148FE0(void)
{
    if (gUnknown_203F3D4->unk46)
    {
        gUnknown_203F3D4->unk4A++;
        gUnknown_203F3D4->unk34 += sub_8149044();
        if (gUnknown_203F3D4->unk34 >= 0x9FF)
            gUnknown_203F3D4->unk34 -= 0x9FF;

        gUnknown_203F3D4->unk18 = gUnknown_203F3D4->unk14;
        gUnknown_203F3D4->unk14 = gUnknown_203F3D4->unk34 >> 8;
        if (gUnknown_203F3D4->unk14 > 6 && gUnknown_203F3D4->unk18 < 7)
        {
            gUnknown_203F3D4->unk36++;
            sub_8149078();
        }
    }
}

static int sub_8149044(void)
{
    int result;

    if (gUnknown_203F3D4->unk10)
        return 0;

    result = gUnknown_203F3D4->unk1C;
    if (gUnknown_203F3D4->unk34 <= 0x5FF)
    {
        gUnknown_203F3D4->unk20 += 80;
        result += gUnknown_203F3D4->unk20 >> 8;
    }

    return result;
}

static const u16 gUnknown_846B694[] = {0x1a, 0x1f, 0x24, 0x29, 0x2e, 0x33, 0x38, 0x3d};
static const u16 gUnknown_846B6A4[] = {0, 1, 1, 2};

static void sub_8149078(void)
{
    int var0;

    gUnknown_203F3D4->unk20 = 0;
    if (gUnknown_203F3D4->unk4E)
    {
        gUnknown_203F3D4->unk4E--;
        if (gUnknown_203F3D4->unk6C)
        {
            if (sub_8149194() % 4 != 0)
            {
                gUnknown_203F3D4->unk1C = gUnknown_203F3D4->unk28;
            }
            else
            {
                if (gUnknown_203F3D4->unk28 > 54)
                    gUnknown_203F3D4->unk1C = 30;
                else
                    gUnknown_203F3D4->unk1C = 82;
            }
        }
    }
    else
    {
        if (!(gUnknown_203F3D4->unk50 & 8))
        {
            gUnknown_203F3D4->unk28 = gUnknown_846B694[gUnknown_203F3D4->unk50] + (gUnknown_203F3D4->unk51 * 7);
            gUnknown_203F3D4->unk4E = gUnknown_846B6A4[sub_8149194() % NELEMS(gUnknown_846B6A4)] + 2;
            gUnknown_203F3D4->unk50++;
        }
        else
        {
            if (gUnknown_203F3D4->unk50 == 8)
            {
                if (gUnknown_203F3D4->unk51 < 3)
                    gUnknown_203F3D4->unk51++;
                else
                    gUnknown_203F3D4->unk6C = 1;
            }

            var0 = gUnknown_846B694[15 - gUnknown_203F3D4->unk50];
            gUnknown_203F3D4->unk28 = var0 + (gUnknown_203F3D4->unk51 * 7);
            if (++gUnknown_203F3D4->unk50 > 15)
            {
                if (sub_8149194() % 4 == 0)
                    gUnknown_203F3D4->unk28 -= 5;

                gUnknown_203F3D4->unk50 = 0;
            }
        }

        gUnknown_203F3D4->unk1C = gUnknown_203F3D4->unk28;
    }
}

static int sub_8149194(void)
{
    // The number 1103515245 comes from the example implementation of rand and srand
    gUnknown_203F3D4->unk24 = gUnknown_203F3D4->unk24 * 1103515245 + 24691;
    return gUnknown_203F3D4->unk24 >> 16;
}

static void sub_81491B4(void)
{
    gUnknown_203F3D4->unk10 = 1;
    gUnknown_203F3D4->unk14 = 6;
    gUnknown_203F3D4->unk34 = 0x5FF;
    sub_814936C();
}

static int sub_81491D8(void)
{
    return gUnknown_203F3D4->unk10;
}

static void sub_81491E4(void)
{
    int i;
    for (i = 0; i < MAX_RFU_PLAYERS; i++)
        gUnknown_203F3D4->unk82E4[i].unk14 = 0;
}

static void sub_8149210(void)
{
    gUnknown_203F3D4->unk83AC->unk10 = 0;
    gUnknown_203F3D4->unk83AC->unk12 = 0;
}

static bool32 sub_814922C(u16 arg0)
{
    if (gUnknown_203F3D4->unk82E4[gUnknown_203F3D4->unk6].unk10 == arg0)
        return TRUE;
    else
        return FALSE;
}

static void sub_8149260(void)
{
    gUnknown_203F3D4->unk83AC->unkE = gUnknown_203F3D4->unk4A;
    gUnknown_203F3D4->unk83AC->unk12 = gUnknown_203F3D4->unk83AC->unk10;
    gUnknown_203F3D4->unk83AC->unk10 = 1;
}

static void sub_8149288(void)
{
    gUnknown_203F3D4->unk83AC->unk12 = gUnknown_203F3D4->unk83AC->unk10;
    gUnknown_203F3D4->unk83AC->unk10 = 2;
    gUnknown_203F3D4->unk83AC->unkE = gUnknown_203F3D4->unk4A;
    gUnknown_203F3D4->unk83AC->unk14 = 2;
}

static void sub_81492B8(void)
{
    gUnknown_203F3D4->unk83AC->unk12 = gUnknown_203F3D4->unk83AC->unk10;
    gUnknown_203F3D4->unk83AC->unk10 = 0;
}

static const u16 gUnknown_846B6AC[] = {SE_RS_SHOP, SE_SHINY, SE_M_MORNING_SUN, SE_POKE_JUMP_SUCCESS};

static void sub_81492D8(void)
{
    if (gUnknown_203F3D4->unk5C)
    {
        sub_814AA24(gUnknown_203F3D4->unk70.unk8);
        gUnknown_203F3D4->unk5C = 0;
        if (gUnknown_203F3D4->unk4D)
        {
            int index = sub_814A98C(gUnknown_203F3D4->unk70.unk1);
            PlaySE(gUnknown_846B6AC[index - 2]);
            gUnknown_203F3D4->unk4D = 0;
        }
    }

    sub_814AA34(gUnknown_203F3D4->unk70.unk4);
    sub_814937C();
    sub_814933C();
}

static void sub_814933C(void)
{
    if (gUnknown_203F3D4->unk46)
        sub_814A95C(gUnknown_203F3D4->unk14);
}

static void sub_814935C(void)
{
    gUnknown_203F3D4->unk46 = 0;
}

static void sub_814936C(void)
{
    gUnknown_203F3D4->unk46 = 1;
}

static void sub_814937C(void)
{
    int i;
    int whichSound = 0;
    int numLinkPlayers = gUnknown_203F3D4->unk5;

    for (i = 0; i < numLinkPlayers; i++)
    {
        switch (gUnknown_203F3D4->unk82E4[i].unk10)
        {
        case 0:
            sub_814A940(i, 0);
            break;
        case 1:
            if (gUnknown_203F3D4->unk82E4[i].unk12 != 1 || gUnknown_203F3D4->unk82E4[i].unkE != gUnknown_203F3D4->unk9A[i])
            {
                if (i == gUnknown_203F3D4->unk6)
                    gUnknown_203F3D4->unk82E4[i].unk12 = 1;

                whichSound |= 0x1;
                gUnknown_203F3D4->unk82E4[i].unk4 = 0x7FFFFFFF;
                gUnknown_203F3D4->unk9A[i] = gUnknown_203F3D4->unk82E4[i].unkE;
            }

            sub_8149490(i);
            break;
        case 2:
            if (gUnknown_203F3D4->unk82E4[i].unk12 != 2)
            {
                if (i == gUnknown_203F3D4->unk6)
                    gUnknown_203F3D4->unk82E4[i].unk12 = 2;

                whichSound |= 0x2;
                sub_814AA48(i);
            }
            break;
        }
    }

    if (whichSound & 0x2)
        PlaySE(SE_POKE_JUMP_FAILURE);
    else if (whichSound & 0x1)
        PlaySE(SE_LEDGE);
}

static const s8 gUnknown_846B6B4[][48] =
{
    {-3, -6, -8, -10, -13, -15, -17, -19, -21, -23, -25, -27, -28, -29, -30, -30, -30, -28, -27,
    -26, -25, -23, -22, -20, -18, -17, -15, -13, -11, -8, -6, -4, -1},

    {-3, -6, -9, -11, -14, -16, -18, -20, -22, -24, -26, -28, -29, -30, -30, -28, -26, -24, -22,
    -20, -18, -16, -14, -11, -9, -6, -4, -1},

    {-3, -6, -9, -11, -13, -15, -17, -19, -21, -23, -25, -27, -28, -29, -30, -30, -30, -30, -29,
    -29, -28, -28, -27, -27, -26, -25, -24, -22, -20, -18, -16, -14,
    -12, -11, -9, -6, -4, -1},
};

static void sub_8149490(int multiplayerId)
{
    int var0;
    int var1;
    struct PokemonJump1_82E4 *player;

    if (gUnknown_203F3D4->unk68)
        return;

    player = &gUnknown_203F3D4->unk82E4[multiplayerId];
    if (player->unk4 != 0x7FFFFFFF)
    {
        player->unk4++;
        var0 = player->unk4;
    }
    else
    {
        var0 = gUnknown_203F3D4->unk4A - player->unkE;
        if (var0 >= 65000)
        {
            var0 -= 65000;
            var0 += gUnknown_203F3D4->unk4A;
        }

        player->unk4 = var0;
    }

    if (var0 < 4)
        return;

    var0 -= 4;
    if (var0 < 48)
        var1 = gUnknown_846B6B4[player->unkC][var0];
    else
        var1 = 0;

    sub_814A940(multiplayerId, var1);
    if (!var1 && multiplayerId == gUnknown_203F3D4->unk6)
        sub_81492B8();

    player->unk0 = var1;
}

static void sub_8149534(void)
{
    if (gUnknown_203F3D4->unk14 == 8 && gUnknown_203F3D4->unk18 == 7)
    {
        if (gUnknown_203F3D4->unk58 == 0)
        {
            sub_8149878();
            gUnknown_203F3D4->unk54 = 0;
            gUnknown_203F3D4->unk58 = 1;
            gUnknown_203F3D4->unk70.unk1 = 0;
        }
        else
        {
            if (gUnknown_203F3D4->unk54 == 5)
            {
                gUnknown_203F3D4->unkC++;
                sub_8149898(gUnknown_203F3D4->unkC);
            }
            else
            {
                gUnknown_203F3D4->unkC = 0;
            }

            if (gUnknown_203F3D4->unk54 > 1)
            {
                gUnknown_203F3D4->unk64 = 1;
                memcpy(gUnknown_203F3D4->unk86, gUnknown_203F3D4->unk81, sizeof(u8) * MAX_RFU_PLAYERS);
            }

            sub_8149878();
            gUnknown_203F3D4->unk54 = 0;
            gUnknown_203F3D4->unk58 = 1;
            gUnknown_203F3D4->unk70.unk1 = 0;
            if (gUnknown_203F3D4->unk70.unk4 < 9999)
                gUnknown_203F3D4->unk70.unk4++;

            sub_8149780(10);
            sub_8147F10(3);
        }
    }

    if (gUnknown_203F3D4->unk64 && (sub_8149710() == TRUE || !gUnknown_203F3D4->unk14))
    {
        int var0 = sub_8149834(gUnknown_203F3D4->unk86);
        sub_8149780(sub_8149888(var0));
        sub_8147F10(3);
        gUnknown_203F3D4->unk64 = 0;
    }

    if (gUnknown_203F3D4->unk58)
    {
        int var1 = sub_81497A8();
        if (var1 > gUnknown_203F3D4->unk54)
        {
            gUnknown_203F3D4->unk54 = var1;
            memcpy(gUnknown_203F3D4->unk81, gUnknown_203F3D4->unk7C, sizeof(u8) * MAX_RFU_PLAYERS);
        }
    }
}

static bool32 sub_8149630(void)
{
    int i;

    if (gUnknown_203F3D4->unk14 == 6 && !gUnknown_203F3D4->unk83AC->unk0)
    {
        if (gUnknown_203F3D4->unk83AC->unk12 == 1 && sub_81491D8() == 1)
        {
            gUnknown_203F3D4->unk83AC->unk14 = 1;
        }
        else
        {
            sub_8149288();
            sub_8147F10(3);
        }
    }

    if (gUnknown_203F3D4->unk14 == 7
     && gUnknown_203F3D4->unk18 == 6
     && gUnknown_203F3D4->unk83AC->unk10 != 2)
    {
        gUnknown_203F3D4->unk83AC->unk14 = 1;
        sub_8147F10(3);
    }

    for (i = 0; i < gUnknown_203F3D4->unk5; i++)
    {
        if (gUnknown_203F3D4->unk82E4[i].unk10 == 2)
            return FALSE;
    }

    return TRUE;
}

static bool32 sub_81496D4(void)
{
    int i;
    int numPlayers = gUnknown_203F3D4->unk5;
    int count = 0;
    for (i = 0; i < numPlayers; i++)
    {
        if (gUnknown_203F3D4->unk82E4[i].unk14)
            count++;
    }

    return count == numPlayers;
}

static bool32 sub_8149710(void)
{
    int i;
    for (i = 0; i < gUnknown_203F3D4->unk5; i++)
    {
        if (gUnknown_203F3D4->unk82E4[i].unk14 != 1)
            return FALSE;
    }

    return TRUE;
}

static bool32 sub_8149748(void)
{
    int i;

    if (gUnknown_203F3D4->unk45 == 1)
        return FALSE;

    for (i = 1; i < gUnknown_203F3D4->unk5; i++)
    {
        if (gUnknown_203F3D4->unk90[i] == 1)
            return FALSE;
    }

    return TRUE;
}

static void sub_8149780(int arg0)
{
    gUnknown_203F3D4->unk70.unk8 += arg0;
    gUnknown_203F3D4->unk5C = 1;
    if (gUnknown_203F3D4->unk70.unk8 >= 99990)
        gUnknown_203F3D4->unk70.unk8 = 99990;
}

static int sub_81497A8(void)
{
    int i;
    int count = 0;
    int numPlayers = gUnknown_203F3D4->unk5;

    for (i = 0; i < numPlayers; i++)
    {
        if (gUnknown_203F3D4->unk82E4[i].unk0 == -30)
        {
            gUnknown_203F3D4->unk7C[i] = 1;
            count++;
        }
        else
        {
            gUnknown_203F3D4->unk7C[i] = 0;
        }
    }

    return count;
}

static bool32 sub_8149804(void)
{
    return !Rfu.recvQueue.count && !Rfu.sendQueue.count;
}

static int sub_8149834(u8 *arg0)
{
    int i;
    int flags;
    int count;

    for (i = 0, flags = 0, count = 0; i < MAX_RFU_PLAYERS; i++)
    {
        if (arg0[i])
        {
            flags |= 1 << i;
            count++;
        }
    }

    gUnknown_203F3D4->unk70.unk1 = flags;
    if (flags)
        gUnknown_203F3D4->unk4D = 1;

    return count;
}

static void sub_8149878(void)
{
    gUnknown_203F3D4->unk44 = 0;
}

static const int gUnknown_846B74C[] = {0, 0, 50, 100, 200, 500};

static int sub_8149888(int arg0)
{
    return gUnknown_846B74C[arg0];
}

static void sub_8149898(u16 arg0)
{
    if (arg0 > gUnknown_203F3D4->unkE)
        gUnknown_203F3D4->unkE = arg0;
}

static const u16 gUnknown_846B764[] = {0x8a, 0x8d, 0x8e, 0x8f, 0x90, 0x91, 0x92, 0x93};
static const u32 gUnknown_846B76C[][2] =
{
    {0x1388, 1},
    {0x1f40, 2},
    {0x2ee0, 3},
    {0x3e80, 4},
    {0x4e20, 5},
};

static bool32 sub_81498B4(void)
{
    if (gUnknown_203F3D4->unk70.unk8 >= gUnknown_846B76C[0][0])
        return TRUE;
    else
        return FALSE;
}

static u16 sub_81498D8(void)
{
    u16 lo = sub_8149910();
    u16 hi = sub_8149930();
    return (hi << 12) | (lo & 0xFFF);
}

static void sub_8149900(u16 arg0, u16 *arg1, u16 *arg2)
{
    *arg2 = arg0 >> 12;
    *arg1 = arg0 & 0xFFF;
}

static u16 sub_8149910(void)
{
    u16 index = Random() % NELEMS(gUnknown_846B764);
    return gUnknown_846B764[index];
}

static u16 sub_8149930(void)
{
    u32 val, i;

    val = 0;
    for (i = 0; i < 5; i++)
    {
        if (gUnknown_203F3D4->unk70.unk8 < gUnknown_846B76C[i][0])
            break;
        else if (1) // required to match, see pret/pokeemerald#982
            val = gUnknown_846B76C[i][1];
        else
            break;
    }

    return val;
}

static u16 sub_8149978(u16 item, u16 quantity)
{
    while (quantity && !CheckBagHasSpace(item, quantity))
        quantity--;

    return quantity;
}

u16 sub_81499A4(void)
{
    return GetLinkPlayerCount();
}

u16 sub_81499B4(void)
{
    return gUnknown_203F3D4->unk6;
}

struct PokemonJump1_MonInfo *sub_81499C0(u8 multiplayerId)
{
    return &gUnknown_203F3D4->unk82A8[multiplayerId];
}

u8 *sub_81499E0(u8 multiplayerId)
{
    return gUnknown_203F3D4->unk82E4[multiplayerId].unk1C;
}

bool32 IsSpeciesAllowedInPokemonJump(u16 species)
{
    return GetPokemonJumpSpeciesIdx(species) > -1;
}

void IsPokemonJumpSpeciesInParty(void)
{
    int i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES))
        {
            u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
            if (IsSpeciesAllowedInPokemonJump(species))
            {
                gSpecialVar_Result = TRUE;
                return;
            }
        }
    }

    gSpecialVar_Result = FALSE;
}

void sub_8149A6C(struct PokemonJump1_MonInfo *arg0)
{
    struct MonInfoPacket packet;
    packet.id = 1;
    packet.species = arg0->species;
    packet.otId = arg0->otId;
    packet.personality = arg0->personality;
    Rfu_SendPacket(&packet);
}

bool32 sub_8149A90(int multiplayerId, struct PokemonJump1_MonInfo *arg0)
{
    struct MonInfoPacket packet;

    if ((gRecvCmds[multiplayerId][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[multiplayerId][1], sizeof(packet));
    if (packet.id == 1)
    {
        arg0->species = packet.species;
        arg0->otId = packet.otId;
        arg0->personality = packet.personality;
        return TRUE;
    }

    return FALSE;
}

struct UnkPacket2
{
    u8 id; // packet id
    u32 unk4;
    u32 unk8;
};

void sub_8149AE0(u32 arg0)
{
    struct UnkPacket2 packet;
    packet.id = 2;
    packet.unk4 = arg0;
    Rfu_SendPacket(&packet);
}

struct UnkPacket3
{
    u8 id; // packet id
    u8 unk1;
    u8 unk2;
    u8 unk3_0:5;
    u8 unk3_1:3;
    u16 unk4;
    u16 unk6;
    u32 unk8_0:15;
    u32 unk8_1:17;
};

void sub_8149AF8(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1)
{
    struct UnkPacket3 packet;
    packet.id = 3;
    packet.unk8_1 = arg1->unk8;
    packet.unk3_0 = arg1->unk1;
    packet.unk1 = arg1->unk0;
    packet.unk6 = arg1->unk2;
    packet.unk8_0 = arg1->unk4;
    packet.unk2 = arg0->unk10;
    packet.unk3_1 = arg0->unk14;
    packet.unk4 = arg0->unkE;
    Rfu_SendPacket(&packet);
}

bool32 sub_8149B7C(struct PokemonJump1_82E4 *arg0, struct PokemonJump1Sub *arg1)
{
    struct UnkPacket3 packet;

    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[0][1], sizeof(packet));
    if (packet.id != 3)
        return FALSE;

    arg1->unk8 = packet.unk8_1;
    arg1->unk1 = packet.unk3_0;
    arg1->unk0 = packet.unk1;
    arg1->unk2 = packet.unk6;
    arg1->unk4 = packet.unk8_0;
    arg0->unk10 = packet.unk2;
    arg0->unk14 = packet.unk3_1;
    arg0->unkE = packet.unk4;
    return TRUE;
}

struct UnkPacket4
{
    u8 id; // packet id
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u16 unk4;
    u8 unk6;
    u16 unk8;
};

void sub_8149BF4(struct PokemonJump1_82E4 *arg0, u8 arg1, u16 arg2)
{
    struct UnkPacket4 packet;
    packet.id = 4;
    packet.unk1 = arg0->unk10;
    packet.unk2 = arg0->unk14;
    packet.unk3 = arg0->unk18;
    packet.unk4 = arg0->unkE;
    packet.unk6 = arg1;
    packet.unk8 = arg2;
    Rfu_SendPacket(&packet);
}

bool32 sub_8149C24(struct PokemonJump1_82E4 *arg0, int multiplayerId, u8 *arg2, u16 *arg3)
{
    struct UnkPacket4 packet;

    if ((gRecvCmds[multiplayerId][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[multiplayerId][1], sizeof(packet));
    if (packet.id != 4)
        return FALSE;

    arg0->unk10 = packet.unk1;
    arg0->unk14 = packet.unk2;
    arg0->unk18 = packet.unk3;
    arg0->unkE = packet.unk4;
    *arg2 = packet.unk6;
    *arg3 = packet.unk8;
    return TRUE;
}

bool32 sub_8149C90(struct PokemonJump1_82E4 *arg0, int multiplayerId)
{
    struct UnkPacket4 packet;

    if ((gRecvCmds[multiplayerId][0] & 0xFF00) != 0x2F00)
        return FALSE;

    memcpy(&packet, &gRecvCmds[multiplayerId][1], sizeof(packet));
    if (packet.id != 4)
        return FALSE;

    arg0->unk10 = packet.unk1;
    arg0->unk14 = packet.unk2;
    arg0->unk18 = packet.unk3;
    arg0->unkE = packet.unk4;
    return TRUE;
}

void sub_8149CEC(struct PokemonJump2 *arg0)
{
    u8 taskId;

    gUnknown_203F3D8 = arg0;
    sub_8149D34(gUnknown_203F3D8);
    taskId = CreateTask(sub_8149DA4, 3);
    gUnknown_203F3D8->unk6 = taskId;
    SetWordTaskArg(gUnknown_203F3D8->unk6, 2, (uintptr_t)gUnknown_203F3D8);
    sub_8149D80(sub_8149DC8);
}

void sub_8149D24(void)
{
    FreeAllWindowBuffers();
    DigitObjUtil_Free();
}

static void sub_8149D34(struct PokemonJump2 *arg0)
{
    arg0->unk4 = 0;
    arg0->unk0 = 0;
    arg0->unk12 = 0xFF;
}

// Gfx
static const u16 sPkmnJumpPal3[] = INCBIN_U16("graphics/link_games/pkmnjump_pal3.gbapal");

static const u16 sPkmnJumpBgPal[] = INCBIN_U16("graphics/link_games/pkmnjump_bg.gbapal");
static const u32 sPkmnJumpBgGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_bg.4bpp.lz");
static const u32 sPkmnJumpBgTilemap[] = INCBIN_U32("graphics/link_games/pkmnjump_bg.bin.lz");

static const u16 sPkmnJumpVenusaurPal[] = INCBIN_U16("graphics/link_games/pkmnjump_venusaur.gbapal");
static const u32 sPkmnJumpVenusaurGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_venusaur.4bpp.lz");
static const u32 sPkmnJumpVenusaurTilemap[] = INCBIN_U32("graphics/link_games/pkmnjump_venusaur.bin.lz");

static const u16 sPkmnJumpResultsPal[] = INCBIN_U16("graphics/link_games/pkmnjump_results.gbapal");
static const u32 sPkmnJumpResultsGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_results.4bpp.lz");
static const u32 sPkmnJumpResultsTilemap[] = INCBIN_U32("graphics/link_games/pkmnjump_results.bin.lz");

static const struct BgTemplate gUnknown_846D8D4[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 27,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 12,
        .screenSize = 3,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0
    },
};

static const struct WindowTemplate gUnknown_846D8E4[] =
{
    {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 0,
        .width = 6,
        .height = 2,
        .paletteNum = 2,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 8,
        .tilemapTop = 0,
        .width = 6,
        .height = 2,
        .paletteNum = 2,
        .baseBlock = 0x1F,
    },
    DUMMY_WIN_TEMPLATE,
};

struct
{
    int id;
    void (*func)(void);
} static const gUnknown_846D8FC[] =
{
    {0x00, sub_8149DC8},
    {0x01, sub_8149F64},
    {0x02, sub_8149FD0},
    {0x03, sub_814A03C},
    {0x04, sub_814A0C8},
    {0x05, sub_814A174},
    {0x06, sub_814A218},
    {0x07, sub_814A264},
    {0x09, sub_814A3AC},
    {0x08, sub_814A308},
};

void sub_8149D40(int arg0)
{
    int i;

    for (i = 0; i < NELEMS(gUnknown_846D8FC); i++)
    {
        if (gUnknown_846D8FC[i].id == arg0)
            sub_8149D80(gUnknown_846D8FC[i].func);
    }
}

bool32 sub_8149D68(void)
{
    return (gUnknown_203F3D8->unk0 != 1);
}

static void sub_8149D80(void (*func)(void))
{
    SetWordTaskArg(gUnknown_203F3D8->unk6, 0, (uintptr_t)func);
    gUnknown_203F3D8->unk4 = 0;
    gUnknown_203F3D8->unk0 = 0;
}

static void sub_8149DA4(u8 taskId)
{
    if (!gUnknown_203F3D8->unk0)
    {
        void (*func)(void) = (void *)(GetWordTaskArg(taskId, 0));

        func();
    }
}

static void sub_8149DC8(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, gUnknown_846D8D4, NELEMS(gUnknown_846D8D4));
        InitWindows(gUnknown_846D8E4);
        ResetBgPositions();
        ResetTempTileDataBuffers();
        sub_814AD6C(gUnknown_203F3D8);
        sub_814A9C8();
        LoadPalette(sPkmnJumpBgPal, 0, 0x20);
        DecompressAndCopyTileDataToVram(3, sPkmnJumpBgGfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, sPkmnJumpBgTilemap, 0, 0, 1);
        LoadPalette(sPkmnJumpVenusaurPal, 0x30, 0x20);
        DecompressAndCopyTileDataToVram(2, sPkmnJumpVenusaurGfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(2, sPkmnJumpVenusaurTilemap, 0, 0, 1);
        LoadPalette(sPkmnJumpResultsPal, 0x10, 0x20);
        DecompressAndCopyTileDataToVram(1, sPkmnJumpResultsGfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, sPkmnJumpResultsTilemap, 0, 0, 1);
        LoadPalette(sPkmnJumpPal3, 0x20, 0x20);
        SetBgTilemapBuffer(0, gUnknown_203F3D8->tilemapBuffer);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 0x20, 0x20);
        sub_814A84C();
        sub_814AA24(0);
        DrawWindowBorderWithStdpal3(0, 1, 0xE0);
        LoadUserWindowBorderGfx(0, 0x00A, 0xD0);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            sub_814A8B8();
            sub_814B294(gUnknown_203F3D8);
            sub_814B348(gUnknown_203F3D8, 6);
            ShowBg(3);
            ShowBg(0);
            ShowBg(2);
            HideBg(1);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_8149F64(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814AADC();
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC30(FALSE);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC94();
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_8149FD0(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814AADC();
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC30(TRUE);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC94();
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A03C(void)
{
    int i, numPlayers;

    numPlayers = sub_81499A4();
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        for (i = 0; i < numPlayers; i++)
            ClearWindowTilemap(gUnknown_203F3D8->unk1C[i]);

        CopyBgTilemapBufferToVram(0);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            for (i = 0; i < numPlayers; i++)
                RemoveWindow(gUnknown_203F3D8->unk1C[i]);

            gUnknown_203F3D8->unk0 = 1;
        }
        break;
    }
}

static void sub_814A0C8(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(1, 8, 20, 2);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_WantToPlayAgain2, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            sub_814A7D0(23, 7, 0);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A174(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(2, 7, 26, 4);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_SavingDontTurnOffPower, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A218(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814A6CC();
        DestroyYesNoMenu();
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!sub_814A6FC() && !IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A264(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(2, 8, 22, 4);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_SomeoneDroppedOut2, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A308(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(7, 10, 16, 2);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_CommunicationStandby4, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A3AC(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814B43C(gUnknown_203F3D8);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!sub_814B460())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

void sub_814A3E4(void)
{
    gUnknown_203F3D8->unkA = 0;
    gUnknown_203F3D8->unkB = 0;
    gUnknown_203F3D8->unkC = 6;
    sub_814A95C(gUnknown_203F3D8->unkC);
}

bool32 sub_814A408(void)
{
    switch (gUnknown_203F3D8->unkA)
    {
    case 0:
        gUnknown_203F3D8->unkB++;
        if (gUnknown_203F3D8->unkB > 10)
        {
            gUnknown_203F3D8->unkB = 0;
            gUnknown_203F3D8->unkC++;
            if (gUnknown_203F3D8->unkC >= 10)
            {
                gUnknown_203F3D8->unkC = 0;
                gUnknown_203F3D8->unkA++;
            }
        }
        sub_814A95C(gUnknown_203F3D8->unkC);
        if (gUnknown_203F3D8->unkC != 7)
            break;
    case 1:
        return FALSE;
    }

    return TRUE;
}

static const u8 sPluralTxt[] = _("IES");

void sub_814A468(u16 itemId, u16 quantity)
{
    CopyItemName(itemId, gUnknown_203F3D8->txtBuff[0]);
    ConvertIntToDecimalStringN(gUnknown_203F3D8->txtBuff[1], quantity, STR_CONV_MODE_LEFT_ALIGN, 1);
    if (itemId >= FIRST_BERRY_INDEX && itemId < LAST_BERRY_INDEX)
    {
        if (quantity > 1)
        {
            int endi = StringLength(gUnknown_203F3D8->txtBuff[0]);
            if (endi != 0)
            {
                endi--;
                endi[gUnknown_203F3D8->txtBuff[0]] = EOS;
                StringAppend(gUnknown_203F3D8->txtBuff[0], sPluralTxt);
            }
        }
    }
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gUnknown_203F3D8->txtBuff[1]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gUnknown_203F3D8->strBuff, gText_AwesomeWonF701F700);
    gUnknown_203F3D8->unk12 = sub_814A754(4, 8, 22, 4);
    AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gUnknown_203F3D8->strBuff, 0, 2, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
    gUnknown_203F3D8->unk14 = MUS_LEVEL_UP;
    gUnknown_203F3D8->unkD = 0;
}

void sub_814A53C(u16 itemId)
{
    CopyItemName(itemId, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gUnknown_203F3D8->strBuff, gText_FilledStorageSpace2);
    gUnknown_203F3D8->unk12 = sub_814A754(4, 8, 22, 4);
    AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gUnknown_203F3D8->strBuff, 0, 2, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
    gUnknown_203F3D8->unk14 = 0;
    gUnknown_203F3D8->unkD = 0;
}

void sub_814A5B4(u16 itemId)
{
    CopyItemName(itemId, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gUnknown_203F3D8->strBuff, gText_CantHoldMore);
    gUnknown_203F3D8->unk12 = sub_814A754(4, 9, 22, 2);
    AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gUnknown_203F3D8->strBuff, 0, 2, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
    gUnknown_203F3D8->unk14 = 0;
    gUnknown_203F3D8->unkD = 0;
}

bool32 sub_814A62C(void)
{
    switch (gUnknown_203F3D8->unkD)
    {
    case 0:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unkD++;
        }
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            break;
        if (gUnknown_203F3D8->unk14 == 0)
        {
            gUnknown_203F3D8->unkD += 2;
            return FALSE;
        }
        PlayFanfare(gUnknown_203F3D8->unk14);
        gUnknown_203F3D8->unkD++;
    case 2:
        if (!IsFanfareTaskInactive())
            break;
        gUnknown_203F3D8->unkD++;
    case 3:
        return FALSE;
    }

    return TRUE;
}

void sub_814A6CC(void)
{
    if (gUnknown_203F3D8->unk12 != 0xFF)
    {
        rbox_fill_rectangle(gUnknown_203F3D8->unk12);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_MAP);
        gUnknown_203F3D8->unkD = 0;
    }
}

// Can't match this without the ugly GOTO, oh well.
bool32 sub_814A6FC(void)
{
    if (gUnknown_203F3D8->unk12 == 0xFF)
    {
        RET_FALSE:
        return FALSE;
    }

    if (gUnknown_203F3D8->unkD == 0)
    {
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            RemoveWindow(gUnknown_203F3D8->unk12);
            gUnknown_203F3D8->unk12 = 0xFF;
            gUnknown_203F3D8->unkD++;
            goto RET_FALSE;
        }
    }
    else if (gUnknown_203F3D8->unkD == 1)
        goto RET_FALSE;

    return TRUE;
}

s8 sub_814A744(void)
{
    return Menu_ProcessInputNoWrapClearOnChoose();
}

static u32 sub_814A754(u32 left, u32 top, u32 width, u32 height)
{
    u32 windowId;
    struct WindowTemplate window;

    window.bg = 0;
    window.tilemapLeft = left;
    window.tilemapTop = top;
    window.width = width;
    window.height = height;
    window.paletteNum = 0xF;
    window.baseBlock = 0x43;

    windowId = AddWindow(&window);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    return windowId;
}

static void sub_814A7D0(u16 left, u16 top, u8 cursorPos)
{
    struct WindowTemplate window;
    u8 a = cursorPos;

    window.bg = 0;
    window.tilemapLeft = left;
    window.tilemapTop = top;
    window.width = 6;
    window.height = 4;
    window.paletteNum = 2;
    window.baseBlock = 0x2B;

    CreateYesNoMenu(&window, 2, 0, 2, 0x00a, 0xD, a);
}

static void sub_814A84C(void)
{
    u8 color[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY};

    PutWindowTilemap(0);
    PutWindowTilemap(1);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    AddTextPrinterParameterized3(0, 0, 0, 2, color, 0, gText_SpacePoints2);
    AddTextPrinterParameterized3(1, 0, 0, 2, color, 0, gText_SpaceTimes3);
}

static const u8 gUnknown_846D953[] = {2, 2, 0, 0, 1, 1, 1, 0, 0, 2, 0, 0, 0};

static const struct CompressedSpriteSheet gUnknown_846D960 = {gUnknown_8479688, 0, 0x320};
static const struct SpritePalette gUnknown_846D968 = {gUnknown_8479668, 0x320};

static const u16 gUnknown_846D970[] = {0x06, 0x08, 0x10, 0x08};
static const u16 gUnknown_846D978[] = {0x06, 0x08, 0x0b, 0x06, 0x10, 0x08};
static const u16 gUnknown_846D984[] = {0x02, 0x06, 0x06, 0x08, 0x10, 0x08, 0x14, 0x06};
static const u16 gUnknown_846D994[] = {0x02, 0x06, 0x06, 0x08, 0x0b, 0x06, 0x10, 0x08, 0x14, 0x06};

static const u16 *const gUnknown_846D9A8[] =
{
    gUnknown_846D970,
    gUnknown_846D978,
    gUnknown_846D984,
    gUnknown_846D994,
};

static const s16 gUnknown_846D9B8[] = {0x0058, 0x0098};
static const s16 gUnknown_846D9BC[] = {0x0058, 0x0078, 0x0098};
static const s16 gUnknown_846D9C2[] = {0x0038, 0x0058, 0x0098, 0x00b8};
static const s16 gUnknown_846D9CA[] = {0x0038, 0x0058, 0x0078, 0x0098, 0x00b8};

static const s16 *const gUnknown_846D9D4[] =
{
    gUnknown_846D9B8,
    gUnknown_846D9BC,
    gUnknown_846D9C2,
    gUnknown_846D9CA,
};

static void sub_814A8B8(void)
{
    int i, y, playersCount = sub_81499A4();
    const s16 *xCoords = gUnknown_846D9D4[playersCount - 2];

    for (i = 0; i < playersCount; i++)
    {
        struct PokemonJump1_MonInfo *info = sub_81499C0(i);

        y = gMonFrontPicCoords[info->species].y_offset;
        sub_814ADCC(gUnknown_203F3D8, info, *xCoords, y + 112, i);
        sub_814B240(gUnknown_203F3D8, *xCoords, 112, i);
        xCoords++;
    }
}

void sub_814A940(u32 id, s16 y)
{
    gUnknown_203F3D8->unk81A8[id]->y2 = y;
}

void sub_814A95C(int id)
{
    sub_814B348(gUnknown_203F3D8, id);
    ChangeBgY(2, (gUnknown_846D953[id] * 5) << 0xD, 0);
}

int sub_814A98C(u8 flags)
{
    int i, count;

    for (i = 0, count = 0; i < 5; i++)
    {
        if (flags & 1)
        {
            sub_814AF0C(gUnknown_203F3D8, i);
            count++;
        }
        flags >>= 1;
    }

    sub_814ACCC(count - 2);
    return count;
}

static void sub_814A9C8(void)
{
    struct DigitObjUtilTemplate unkStruct;
    struct DigitObjUtilTemplate *ptr = &unkStruct; // This temp variable is needed to match, don't ask me why.

    ptr->shape = SPRITE_SHAPE(8x8);
    ptr->size = SPRITE_SIZE(8x8);
    ptr->strConvMode = 0;
    ptr->priority = 1;
    ptr->oamCount = 5;
    ptr->xDelta = 8;
    ptr->x = 108;
    ptr->y = 6;
    ptr->spriteSheet.compressed = &gUnknown_846D960;
    ptr->spritePal = &gUnknown_846D968;

    DigitObjUtil_Init(2);
    DigitObjUtil_CreatePrinter(0, 0, ptr);

    unkStruct.oamCount = 4;
    unkStruct.x = 30;
    unkStruct.y = 6;
    DigitObjUtil_CreatePrinter(1, 0, &unkStruct);
}

void sub_814AA24(int arg0)
{
    DigitObjUtil_PrintNumOn(0, arg0);
}

void sub_814AA34(u16 arg0)
{
    DigitObjUtil_PrintNumOn(1, arg0);
}

void sub_814AA48(u8 multiplayerId)
{
    sub_814AFE8(gUnknown_203F3D8, multiplayerId);
}

void sub_814AA60(u8 multiplayerId)
{
    sub_814B080(gUnknown_203F3D8, multiplayerId);
}

int sub_814AA78(int multiplayerId)
{
    return sub_814B010(gUnknown_203F3D8, multiplayerId);
}

void sub_814AA8C(void)
{
    sub_814B0A8(gUnknown_203F3D8);
}

void sub_814AAA0(void)
{
    sub_814B134(gUnknown_203F3D8);
}

void sub_814AAB4(int multiplayerId)
{
    sub_814B168(gUnknown_203F3D8, multiplayerId);
}

int sub_814AAC8(void)
{
    return sub_814B190(gUnknown_203F3D8);
}

static void sub_814AADC(void)
{
    struct WindowTemplate window;
    int i, playersCount = sub_81499A4();
    const u16 *winCoords = gUnknown_846D9A8[playersCount - 2];

    window.bg = 0;
    window.width = 8;
    window.height = 2;
    window.paletteNum = 2;
    window.baseBlock = 0x2B;

    for (i = 0; i < playersCount; i++)
    {
        window.tilemapLeft = winCoords[0];
        window.tilemapTop = winCoords[1];
        gUnknown_203F3D8->unk1C[i] = AddWindow(&window);
        ClearWindowTilemap(gUnknown_203F3D8->unk1C[i]);
        window.baseBlock += 0x10;
        winCoords += 2;
    }

    CopyBgTilemapBufferToVram(0);
}

static void sub_814AB98(int multiplayerId, u8 clr1, u8 clr2, u8 clr3)
{
    u32 x;
    u8 colors[3] = {clr1, clr2, clr3};

    FillWindowPixelBuffer(gUnknown_203F3D8->unk1C[multiplayerId], PIXEL_FILL(0));
    x = 64 - GetStringWidth(0, sub_81499E0(multiplayerId), -1);
    x /= 2;
    AddTextPrinterParameterized3(gUnknown_203F3D8->unk1C[multiplayerId], 0, x, 2, colors, -1, sub_81499E0(multiplayerId));
    CopyWindowToVram(gUnknown_203F3D8->unk1C[multiplayerId], COPYWIN_GFX);
}

static void sub_814AC30(bool32 arg0)
{
    int i, var, playersCount = sub_81499A4();

    if (!arg0)
    {
        for (i = 0; i < playersCount; i++)
            sub_814AB98(i, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
    }
    else
    {
        var = sub_81499B4();
        for (i = 0; i < playersCount; i++)
        {
            if (var != i)
                sub_814AB98(i, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
            else
                sub_814AB98(i, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_RED, TEXT_COLOR_LIGHT_RED);
        }
    }
}

static void sub_814AC94(void)
{
    int i, playersCount = sub_81499A4();

    for (i = 0; i < playersCount; i++)
        PutWindowTilemap(gUnknown_203F3D8->unk1C[i]);
    CopyBgTilemapBufferToVram(0);
}

static void sub_814ACCC(u8 arg0)
{
    gUnknown_203F3D8->unk18 = 0;
    ChangeBgX(1, (arg0 / 2) << 16, 0);
    ChangeBgY(1, (((arg0 % 2) << 8) - 40) << 8, 0);
    ShowBg(1);
    CreateTask(sub_814AD50, 4);
}

static bool32 sub_814AD18(void)
{
    if (gUnknown_203F3D8->unk18 >= 32)
    {
        return FALSE;
    }
    else
    {
        ChangeBgY(1, 128, 1);
        if (++gUnknown_203F3D8->unk18 >= 32)
            HideBg(1);
        return TRUE;
    }
}

static void sub_814AD50(u8 taskId)
{
    if (!sub_814AD18())
        DestroyTask(taskId);
}

static const u16 sPkmnJumpPal1[] = INCBIN_U16("graphics/link_games/pkmnjump_pal1.gbapal");
static const u16 sPkmnJumpPal2[] = INCBIN_U16("graphics/link_games/pkmnjump_pal2.gbapal");

static const u32 sPkmnJumpRopeGfx1[] = INCBIN_U32("graphics/link_games/pkmnjump_rope1.4bpp.lz");
static const u32 sPkmnJumpRopeGfx2[] = INCBIN_U32("graphics/link_games/pkmnjump_rope2.4bpp.lz");
static const u32 sPkmnJumpRopeGfx3[] = INCBIN_U32("graphics/link_games/pkmnjump_rope3.4bpp.lz");
static const u32 sPkmnJumpRopeGfx4[] = INCBIN_U32("graphics/link_games/pkmnjump_rope4.4bpp.lz");

static const u32 sPkmnJumpStarGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_star.4bpp.lz");

static const struct CompressedSpriteSheet gUnknown_846E0B0[] =
{
    {sPkmnJumpRopeGfx1, 0x600, 5},
    {sPkmnJumpRopeGfx2, 0x0c00, 6},
    {sPkmnJumpRopeGfx3, 0x0600, 7},
    {sPkmnJumpRopeGfx4, 0x0600, 8},
    {sPkmnJumpStarGfx, 0x0200, 10},
};

static const struct SpritePalette gUnknown_846E0D8[] =
{
    {sPkmnJumpPal1, 5},
    {sPkmnJumpPal2, 6},
};

// Forward declarations.
static const struct OamData sOamData_846E170;
static const struct SpriteTemplate gUnknown_846E220;
static const struct SpriteTemplate gUnknown_846E238;
static const struct SpriteTemplate gUnknown_846E250;
static const struct SpriteTemplate gUnknown_846E268;

static const struct SpriteTemplate gUnknown_846E0E8 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_846E170,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const s16 gUnknown_846E100[][10] =
{
    {0x60, 0x60, 0x60, 0x72, 0x78, 0x78, 0x78, 0x72, 0x60, 0x60},
    {0x46, 0x50, 0x60, 0x72, 0x78, 0x80, 0x78, 0x72, 0x60, 0x50},
    {0x32, 0x48, 0x60, 0x72, 0x80, 0x88, 0x80, 0x72, 0x60, 0x48},
    {0x2a, 0x48, 0x60, 0x72, 0x80, 0x88, 0x80, 0x72, 0x60, 0x48},
};

static const s16 gUnknown_846E150[] = {0x10, 0x28, 0x48, 0x68, 0x88, 0xa8, 0xc8, 0xe0};

static const struct SpriteTemplate *const gUnknown_846E160[] =
{
    &gUnknown_846E220,
    &gUnknown_846E238,
    &gUnknown_846E250,
    &gUnknown_846E268,
};

static const struct OamData sOamData_846E170 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData sOamData_846E178 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x32),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData sOamData_846E180 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData sOamData_846E188 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sSpriteAnim_846E190[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E198[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1A0[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1A8[] =
{
    ANIMCMD_FRAME(24, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1B0[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1B8[] =
{
    ANIMCMD_FRAME(40, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1C0[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1C8[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1D0[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1D8[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1E0[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E1E8[] =
{
    ANIMCMD_FRAME(80, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_846E1F0[] =
{
    sSpriteAnim_846E190,
    sSpriteAnim_846E198,
    sSpriteAnim_846E1A0,
    sSpriteAnim_846E1A8,
    sSpriteAnim_846E1B0,
    sSpriteAnim_846E1B8
};

static const union AnimCmd *const sSpriteAnimTable_846E208[] =
{
    sSpriteAnim_846E1C0,
    sSpriteAnim_846E1C8,
    sSpriteAnim_846E1D0,
    sSpriteAnim_846E1D8,
    sSpriteAnim_846E1E0,
    sSpriteAnim_846E1E8
};

static const struct SpriteTemplate gUnknown_846E220 =
{
    .tileTag = 5,
    .paletteTag = 5,
    .oam = &sOamData_846E178,
    .anims = sSpriteAnimTable_846E1F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate gUnknown_846E238 =
{
    .tileTag = 6,
    .paletteTag = 5,
    .oam = &sOamData_846E180,
    .anims = sSpriteAnimTable_846E208,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate gUnknown_846E250 =
{
    .tileTag = 7,
    .paletteTag = 5,
    .oam = &sOamData_846E188,
    .anims = sSpriteAnimTable_846E1F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate gUnknown_846E268 =
{
    .tileTag = 8,
    .paletteTag = 5,
    .oam = &sOamData_846E188,
    .anims = sSpriteAnimTable_846E1F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct OamData sOamData_846E280 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sSpriteAnim_846E288[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_846E290[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_846E2AC[] =
{
    sSpriteAnim_846E288,
    sSpriteAnim_846E290
};

static const struct SpriteTemplate gUnknown_846E2B4 =
{
    .tileTag = 10,
    .paletteTag = 5,
    .oam = &sOamData_846E280,
    .anims = sSpriteAnimTable_846E2AC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

void sub_814AD6C(struct PokemonJump2 *arg0)
{
    int i;

    for (i = 0; i < NELEMS(gUnknown_846E0B0); i++)
        LoadCompressedSpriteSheet(&gUnknown_846E0B0[i]);

    for (i = 0; i < NELEMS(gUnknown_846E0D8); i++)
        LoadSpritePalette(&gUnknown_846E0D8[i]);

    arg0->unkE = IndexOfSpritePaletteTag(5);
    arg0->unkF = IndexOfSpritePaletteTag(6);
}

static void sub_814ADB4(struct Sprite *sprite)
{
    int i;
    for (i = 0; i < 8; i++)
        sprite->data[i] = 0;
}

void sub_814ADCC(struct PokemonJump2 *arg0, struct PokemonJump1_MonInfo *jumpMon, s16 x, s16 y, u8 multiplayerId)
{
    struct SpriteTemplate spriteTemplate;
    struct SpriteSheet spriteSheet;
    struct CompressedSpritePalette spritePalette;
    u8 *buffer;
    u8 *unusedBuffer;
    u8 subpriority;
    u8 spriteId;

    spriteTemplate = gUnknown_846E0E8;
    buffer = Alloc(0x2000);
    unusedBuffer = Alloc(0x800);
    if (multiplayerId == sub_81499B4())
        subpriority = 3;
    else
        subpriority = multiplayerId + 4;

    if (buffer && unusedBuffer)
    {
        HandleLoadSpecialPokePic(
            &gMonFrontPicTable[jumpMon->species],
            buffer,
            jumpMon->species,
            jumpMon->personality);

        spriteSheet.data = buffer;
        spriteSheet.tag = multiplayerId;
        spriteSheet.size = 0x800;
        LoadSpriteSheet(&spriteSheet);

        spritePalette.data = GetMonSpritePalFromSpeciesAndPersonality(jumpMon->species, jumpMon->otId, jumpMon->personality);
        spritePalette.tag = multiplayerId;
        LoadCompressedSpritePalette(&spritePalette);

        Free(buffer);
        Free(unusedBuffer);

        spriteTemplate.tileTag += multiplayerId;
        spriteTemplate.paletteTag += multiplayerId;
        spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            arg0->unk81A8[multiplayerId] = &gSprites[spriteId];
            arg0->unk81FC[multiplayerId] = subpriority;
            return;
        }
    }

    arg0->unk81A8[multiplayerId] = NULL;
}

void sub_814AF0C(struct PokemonJump2 *arg0, int multiplayerId)
{
    sub_814ADB4(arg0->unk81BC[multiplayerId]);
    arg0->unk81BC[multiplayerId]->data[7] = arg0->unk81A8[multiplayerId] - gSprites;
    arg0->unk81BC[multiplayerId]->invisible = FALSE;
    arg0->unk81BC[multiplayerId]->y = 96;
    arg0->unk81BC[multiplayerId]->callback = sub_814AF74;
    StartSpriteAnim(arg0->unk81BC[multiplayerId], 1);
}

static void sub_814AF74(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (sprite->animEnded)
        {
            sprite->invisible = TRUE;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    case 1:
        sprite->y--;
        sprite->data[1]++;
        if (sprite->y <= 72)
        {
            sprite->y = 72;
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[1] >= 48)
        {
            sprite->invisible = TRUE;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

void sub_814AFE8(struct PokemonJump2 *arg0, int multiplayerId)
{
    arg0->unk81A8[multiplayerId]->callback = sub_814B038;
    arg0->unk81A8[multiplayerId]->y2 = 0;
    sub_814ADB4(arg0->unk81A8[multiplayerId]);
}

bool32 sub_814B010(struct PokemonJump2 *arg0, int multiplayerId)
{
    return arg0->unk81A8[multiplayerId]->callback == sub_814B038;
}

static void sub_814B038(struct Sprite *sprite)
{
    if (++sprite->data[1] > 1)
    {
        if (++sprite->data[2] & 1)
            sprite->y2 = 2;
        else
            sprite->y2 = -2;

        sprite->data[1] = 0;
    }

    if (sprite->data[2] > 12)
    {
        sprite->y2 = 0;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_814B080(struct PokemonJump2 *arg0, int multiplayerId)
{
    sub_814ADB4(arg0->unk81A8[multiplayerId]);
    arg0->unk81A8[multiplayerId]->callback = sub_814B100;
}

void sub_814B0A8(struct PokemonJump2 *arg0)
{
    int i;
    u16 numPlayers = sub_81499A4();
    for (i = 0; i < numPlayers; i++)
    {
        if (arg0->unk81A8[i]->callback == sub_814B100)
        {
            arg0->unk81A8[i]->invisible = FALSE;
            arg0->unk81A8[i]->callback = SpriteCallbackDummy;
            arg0->unk81A8[i]->subpriority = 10;
        }
    }
}

static void sub_814B100(struct Sprite *sprite)
{
    if (++sprite->data[0] > 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }
}

void sub_814B134(struct PokemonJump2 *arg0)
{
    int i;
    u16 numPlayers = sub_81499A4();
    for (i = 0; i < numPlayers; i++)
        arg0->unk81A8[i]->subpriority = arg0->unk81FC[i];
}

void sub_814B168(struct PokemonJump2 *arg0, int multiplayerId)
{
    sub_814ADB4(arg0->unk81A8[multiplayerId]);
    arg0->unk81A8[multiplayerId]->callback = sub_814B1CC;
}

bool32 sub_814B190(struct PokemonJump2 *arg0)
{
    int i;
    u16 numPlayers = sub_81499A4();
    for (i = 0; i < numPlayers; i++)
    {
        if (arg0->unk81A8[i]->callback == sub_814B1CC)
            return TRUE;
    }

    return FALSE;
}

static void sub_814B1CC(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        PlaySE(SE_BIKE_HOP);
        sprite->data[1] = 0;
        sprite->data[0]++;
        // fall through
    case 1:
        sprite->data[1] += 4;
        if (sprite->data[1] > 0x7F)
            sprite->data[1] = 0;

        sprite->y2 = -(gSineTable[sprite->data[1]] >> 3);
        if (sprite->data[1] == 0)
        {
            if (++sprite->data[2] < 2)
                sprite->data[0] = 0;
            else
                sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

void sub_814B240(struct PokemonJump2 *arg0, s16 x, s16 y, u8 multiplayerId)
{
    u8 spriteId = CreateSprite(&gUnknown_846E2B4, x, y, 1);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].invisible = TRUE;
        arg0->unk81BC[multiplayerId] = &gSprites[spriteId];
    }
}

void sub_814B294(struct PokemonJump2 *arg0)
{
    int i;
    int count;
    u8 spriteId;

    count = 0;
    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(gUnknown_846E160[i], gUnknown_846E150[count], gUnknown_846E100[i][0], 2);
        arg0->unk81D0[count] = &gSprites[spriteId];
        count++;
    }

    for (i = 3; i >= 0; i--)
    {
        spriteId = CreateSprite(gUnknown_846E160[i], gUnknown_846E150[count], gUnknown_846E100[i][0], 2);
        arg0->unk81D0[count] = &gSprites[spriteId];
        arg0->unk81D0[count]->hFlip = 1;
        count++;
    }
}

void sub_814B348(struct PokemonJump2 *arg0, int arg1)
{
    int i, count, palNum;
    int priority;

    if (arg1 > 5)
    {
        arg1 = 10 - arg1;
        priority = 3;
        palNum = arg0->unkF;
    }
    else
    {
        priority = 2;
        palNum = arg0->unkE;
    }

    count = 0;
    for (i = 0; i < 4; i++)
    {
        arg0->unk81D0[count]->y = gUnknown_846E100[i][arg1];
        arg0->unk81D0[count]->oam.priority = priority;
        arg0->unk81D0[count]->oam.paletteNum = palNum;
        StartSpriteAnim(arg0->unk81D0[count], arg1);
        count++;
    }

    for (i = 3; i >= 0; i--)
    {
        arg0->unk81D0[count]->y = gUnknown_846E100[i][arg1];
        arg0->unk81D0[count]->oam.priority = priority;
        arg0->unk81D0[count]->oam.paletteNum = palNum;
        StartSpriteAnim(arg0->unk81D0[count], arg1);
        count++;
    }
}

void sub_814B43C(struct PokemonJump2 *arg0)
{
    StartMinigameCountdown(9, 7, 120, 80, 0);
    sub_814B134(arg0);
}

bool32 sub_814B460(void)
{
    return IsMinigameCountdownRunning();
}

static struct PokemonJumpRecords *sub_814B46C(void)
{
    return &gSaveBlock2Ptr->pokeJump;
}

void ResetPokeJumpResults(void)
{
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    pokeJump->jumpsInRow = 0;
    pokeJump->bestJumpScore = 0;
    pokeJump->excellentsInRow = 0;
    pokeJump->gamesWithMaxPlayers = 0;
    pokeJump->unused2 = 0;
    pokeJump->unused1 = 0;
}

bool32 sub_814B494(u32 jumpScore, u16 jumpsInRow, u16 excellentsInRow)
{
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    bool32 ret = FALSE;

    if (pokeJump->bestJumpScore < jumpScore && jumpScore <= 99990)
        pokeJump->bestJumpScore = jumpScore, ret = TRUE;
    if (pokeJump->jumpsInRow < jumpsInRow && jumpsInRow <= 9999)
        pokeJump->jumpsInRow = jumpsInRow, ret = TRUE;
    if (pokeJump->excellentsInRow < excellentsInRow && excellentsInRow <= 9999)
        pokeJump->excellentsInRow = excellentsInRow, ret = TRUE;

    return ret;
}

void sub_814B4E8(void)
{
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    if (pokeJump->gamesWithMaxPlayers < 9999)
        pokeJump->gamesWithMaxPlayers++;
}

void ShowPokemonJumpRecords(void)
{
    u8 taskId = CreateTask(Task_ShowPokemonJumpRecords, 0);
    Task_ShowPokemonJumpRecords(taskId);
}

static const struct WindowTemplate gUnknown_846E2CC =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 9,
    .paletteNum = 15,
    .baseBlock = 0x1,
};

static const u8 *const gUnknown_846E2D4[] = {gText_JumpsInARow, gText_BestScore2, gText_ExcellentsInARow};

static void Task_ShowPokemonJumpRecords(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] = AddWindow(&gUnknown_846E2CC);
        sub_814B5C4(data[1]);
        CopyWindowToVram(data[1], COPYWIN_BOTH);
        data[0]++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            rbox_fill_rectangle(data[1]);
            CopyWindowToVram(data[1], COPYWIN_MAP);
            data[0]++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            RemoveWindow(data[1]);
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
        break;
    }
}

static void sub_814B5C4(u16 windowId)
{
    int i, x;
    int results[3];
    struct PokemonJumpRecords *pokeJump = sub_814B46C();
    u8 strbuf[8];
    results[0] = pokeJump->jumpsInRow;
    results[1] = pokeJump->bestJumpScore;
    results[2] = pokeJump->excellentsInRow;

    TextWindow_SetStdFrame0_WithPal(windowId, 0x21D, 0xD0);
    DrawTextBorderOuter(windowId, 0x21D, 0xD);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    AddTextPrinterParameterized5(windowId, 2, gText_PkmnJumpRecords, 0, 0, TEXT_SPEED_FF, NULL, 1, 0);
    for (i = 0; i < NELEMS(gUnknown_846E2D4); i++)
    {
        AddTextPrinterParameterized5(windowId, 2, gUnknown_846E2D4[i], 0, 20 + (i * 14), TEXT_SPEED_FF, NULL, 1, 0);
        ConvertIntToDecimalStringN(strbuf, results[i], STR_CONV_MODE_LEFT_ALIGN, 5);
        TruncateToFirstWordOnly(strbuf);
        x = 0xDE - GetStringWidth(2, strbuf, 0);
        AddTextPrinterParameterized5(windowId, 2, strbuf, x, 20 + (i * 14), TEXT_SPEED_FF, NULL, 0, 0);
    }
    PutWindowTilemap(windowId);
}

static void TruncateToFirstWordOnly(u8 *str)
{
    for (;*str != EOS; str++)
    {
        if (*str == CHAR_SPACE)
        {
            *str = EOS;
            break;
        }
    }
}
