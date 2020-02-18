#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "item.h"
#include "link_rfu.h"
#include "menu.h"
#include "random.h"
#include "save.h"
#include "task.h"
#include "pokemon_jump.h"
#include "constants/songs.h"
#include "constants/species.h"

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

EWRAM_DATA static struct PokemonJump1 *gUnknown_203F3D4 = NULL;

static const struct PokemonJumpMons gPkmnJumpSpecies[] =
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

void StartPokemonJump(u16 partyIndex, MainCallback callback)
{
    u8 taskId;

    if (gReceivedRemoteLinkPlayers)
    {
        gUnknown_203F3D4 = Alloc(sizeof(*gUnknown_203F3D4));
        if (gUnknown_203F3D4)
        {
            ResetTasks();
            taskId = CreateTask(sub_8147DA0, 1);
            gUnknown_203F3D4->unk8 = 0;
            gUnknown_203F3D4->returnCallback = callback;
            gUnknown_203F3D4->unk4 = taskId;
            gUnknown_203F3D4->unk6 = GetMultiplayerId();
            sub_8147D2C(&gUnknown_203F3D4->unk82A8[gUnknown_203F3D4->unk6], &gPlayerParty[partyIndex]);
            sub_8147B60(gUnknown_203F3D4);
            SetWordTaskArg(taskId, 2, (u32)gUnknown_203F3D4);
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
        gUnknown_203F3D4->unk82E4[i].unkC = gPkmnJumpSpecies[index].unk2;
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
    for (i = 0; i < ARRAY_COUNT(gPkmnJumpSpecies); i++)
    {
        if (gPkmnJumpSpecies[i].species == species)
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
            FadeOutAndPlayNewMapMusic(MUS_JUMP, 8);
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
            CreateTask(sub_80DA634, 6);
            gUnknown_203F3D4->unk8++;
        }
        break;
    case 3:
        if (!FuncIsActiveTask(sub_80DA634))
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
            Link_TryStartSend5FFF();
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
    SetWordTaskArg(taskId, 14, (u32)gUnknown_203F3D4);
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
            gUnknown_203F3D4->unk4E = gUnknown_846B6A4[sub_8149194() % ARRAY_COUNT(gUnknown_846B6A4)] + 2;
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

static const u16 gUnknown_846B6AC[] = {SE_REGI, SE_REAPOKE, SE_W234, SE_EXCELLENT};

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
        PlaySE(SE_NAWAMISS);
    else if (whichSound & 0x1)
        PlaySE(SE_DANSA);
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
    return !Rfu.unk_124.count && !Rfu.unk_9e8.count;
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
    u16 index = Random() % ARRAY_COUNT(gUnknown_846B764);
    return gUnknown_846B764[index];
}

#ifdef NONMATCHING
// Impossible to match.
static u16 sub_8149930(void)
{
    u32 val, i;

    val = 0;
    for (i = 0; i < 5; val = gUnknown_846B76C[i][1], i++)
    {
        if (gUnknown_203F3D4->unk70.unk8 < gUnknown_846B76C[i][0])
            break;
    }

    return val;
}
#else
NAKED
static u16 sub_8149930(void)
{
    asm_unified("\n\
    push {r4-r6,lr}\n\
    movs r5, 0\n\
    movs r4, 0\n\
    ldr r3, =gUnknown_203F3D4\n\
    ldr r0, [r3]\n\
    ldr r2, =gUnknown_846B76C\n\
    ldr r1, [r0, 0x78]\n\
    ldr r0, [r2]\n\
    cmp r1, r0\n\
    bcc _0802C874\n\
    ldr r5, [r2, 0x4]\n\
    adds r6, r3, 0\n\
    adds r3, r2, 0x4\n\
_0802C852:\n\
    adds r3, 0x8\n\
    adds r2, 0x8\n\
    adds r4, 0x1\n\
    cmp r4, 0x4\n\
    bhi _0802C874\n\
    ldr r0, [r6]\n\
    ldr r1, [r0, 0x78]\n\
    ldr r0, [r2]\n\
    cmp r1, r0\n\
    bcc _0802C874\n\
    ldr r5, [r3]\n\
    b _0802C852\n\
    .pool\n\
_0802C874:\n\
    lsls r0, r5, 16\n\
    lsrs r0, 16\n\
    pop {r4-r6}\n\
    pop {r1}\n\
    bx r1");
}
#endif

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
