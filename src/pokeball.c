#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "decompress.h"
#include "graphics.h"
#include "main.h"
#include "m4a.h"
#include "pokeball.h"
#include "pokemon.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "util.h"
#include "link.h"
#include "battle_gfx_sfx_util.h"
#include "constants/songs.h"
#include "constants/species.h"

#define tFrames          data[0]
#define tPan             data[1]
#define tThrowId         data[2]
#define tBattler         data[3]
#define tOpponentBattler data[4]

#define sBattler         data[6]

// Function Declarations
static void Task_DoPokeballSendOutAnim(u8 taskId);
static void SpriteCB_TestBallThrow(struct Sprite *sprite);
static void sub_804AC88(struct Sprite *sprite);
static void sub_804AC94(struct Sprite *sprite);
static void sub_804AD00(struct Sprite *sprite);
static void sub_804AD98(struct Sprite *sprite);
static void sub_804ADEC(struct Sprite *sprite);
static void sub_804AEE4(struct Sprite *sprite);
static void sub_804AF24(struct Sprite *sprite);
static void Task_PlayCryWhenReleasedFromBall(u8 taskId);
static void SpriteCB_ReleaseMonFromBall(struct Sprite *sprite);
static void sub_804B484(struct Sprite *sprite);
static void HandleBallAnimEnd(struct Sprite *sprite);
static void sub_804B5C8(struct Sprite *sprite);
static void SpriteCB_PlayerMonSendOut_1(struct Sprite *sprite);
static void SpriteCB_PlayerMonSendOut_2(struct Sprite *sprite);
static void SpriteCB_ReleaseMon2FromBall(struct Sprite *sprite);
static void SpriteCB_OpponentMonSendOut(struct Sprite *sprite);
static u8 LaunchBallStarsTaskForPokeball(u8 x, u8 y, u8 kindOfStars, u8 d);
static u8 LaunchBallFadeMonTaskForPokeball(bool8 unFadeLater, u8 battlerId, u32 arg2);
static void sub_804B9E8(struct Sprite *sprite);
static void sub_804BAA4(struct Sprite *sprite);
static void sub_804BC50(struct Sprite *sprite);
static void sub_804BCF8(struct Sprite *sprite);
static void sub_804BD6C(struct Sprite *sprite);
static void DestroySpriteAndFreeResources2(struct Sprite *sprite);
static void sub_804BE24(struct Sprite *sprite);
static void sub_804BE48(struct Sprite *sprite);
static void SpriteCB_HitAnimHealthoxEffect(struct Sprite *sprite);
static u16 GetBattlerPokeballItemId(u8 battlerId);

// Data
extern const struct SpriteTemplate gUnknown_82606F4[];

extern const struct CompressedSpriteSheet gBallSpriteSheets[POKEBALL_COUNT];
extern const struct CompressedSpritePalette gBallSpritePalettes[POKEBALL_COUNT];
extern const struct SpriteTemplate gBallSpriteTemplates[POKEBALL_COUNT];

// Functions
u8 DoPokeballSendOutAnimation(s16 pan, u8 kindOfThrow)
{
    u8 taskId;
	
    gDoingBattleAnim = TRUE;
    gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive = 1;
    taskId = CreateTask(Task_DoPokeballSendOutAnim, 5);
    gTasks[taskId].tPan = pan;
    gTasks[taskId].tThrowId = kindOfThrow;
    gTasks[taskId].tBattler = gActiveBattler;
    return 0;
}

#ifdef NONMATCHING
static void Task_DoPokeballSendOutAnim(u8 taskId)
{
    u16 throwCaseId;
    u8 battlerId;
    u16 itemId, ballId;
    u8 ballSpriteId;
    bool8 notSendOut = FALSE;
	u8 gender;

    if (gTasks[taskId].tFrames == 0)
    {
        gTasks[taskId].tFrames++;
        return;
    }

    throwCaseId = gTasks[taskId].tThrowId;
    battlerId = gTasks[taskId].tBattler;

    if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
        itemId = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerId]], MON_DATA_POKEBALL);
    else
        itemId = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_POKEBALL);

    ballId = ItemIdToBallId(itemId);
    LoadBallGfx(ballId);
	if (gBattleTypeFlags & BATTLE_TYPE_LINK)
		gender = gLinkPlayers[GetBattlerMultiplayerId(battlerId)].gender;
	else
		gender = gSaveBlock2Ptr->playerGender;
	
    ballSpriteId = CreateSprite(&gUnknown_82606F4[ballId], 32, 80, 29);
    gSprites[ballSpriteId].data[0] = 0x80;
    gSprites[ballSpriteId].data[1] = 0;
    gSprites[ballSpriteId].data[7] = throwCaseId;

    switch (throwCaseId)
    {
    case POKEBALL_PLAYER_SENDOUT:
		if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
		{
			gSprites[ballSpriteId].pos1.x = 32;
			gSprites[ballSpriteId].pos1.y = 64;
		}
		else
		{
			gender == gender;
			gSprites[ballSpriteId].pos1.x = 48;
			gSprites[ballSpriteId].pos1.y = 70;
		}
		
		gBattlerTarget = battlerId;
        gSprites[ballSpriteId].callback = SpriteCB_PlayerMonSendOut_1;
        break;
    case POKEBALL_OPPONENT_SENDOUT:
        gSprites[ballSpriteId].pos1.x = GetBattlerSpriteCoord(battlerId, BATTLER_COORD_X);
        gSprites[ballSpriteId].pos1.y = GetBattlerSpriteCoord(battlerId, BATTLER_COORD_Y) + 24;
        gBattlerTarget = battlerId;
        gSprites[ballSpriteId].data[0] = 0;
        gSprites[ballSpriteId].callback = SpriteCB_OpponentMonSendOut;
        break;
    default:
        gBattlerTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        notSendOut = TRUE;
        break;
    }

    gSprites[ballSpriteId].sBattler = gBattlerTarget;
    if (!notSendOut)
    {
        DestroyTask(taskId);
        return;
    }

    // this will perform an unused ball throw animation
    gSprites[ballSpriteId].data[0] = 0x22;
    gSprites[ballSpriteId].data[2] = GetBattlerSpriteCoord(gBattlerTarget, BATTLER_COORD_X);
    gSprites[ballSpriteId].data[4] = GetBattlerSpriteCoord(gBattlerTarget, BATTLER_COORD_Y) - 16;
    gSprites[ballSpriteId].data[5] = -40;
    InitAnimArcTranslation(&gSprites[ballSpriteId]);
    gSprites[ballSpriteId].oam.affineParam = taskId;
    gTasks[taskId].tOpponentBattler = gBattlerTarget;
    gTasks[taskId].func = TaskDummy;
    PlaySE(SE_NAGERU);
}
#else
NAKED
static void Task_DoPokeballSendOutAnim(u8 taskId)
{
	asm_unified("\tpush {r4-r7,lr}\n"
	"\tmov r7, r10\n"
	"\tmov r6, r9\n"
	"\tmov r5, r8\n"
	"\tpush {r5-r7}\n"
	"\tsub sp, 0x8\n"
	"\tlsls r0, 24\n"
	"\tlsrs r0, 24\n"
	"\tstr r0, [sp]\n"
	"\tmovs r0, 0\n"
	"\tstr r0, [sp, 0x4]\n"
	"\tldr r1, _0804A9D4 @ =gTasks\n"
	"\tldr r2, [sp]\n"
	"\tlsls r0, r2, 2\n"
	"\tadds r0, r2\n"
	"\tlsls r0, 3\n"
	"\tadds r1, r0, r1\n"
	"\tldrh r2, [r1, 0x8]\n"
	"\tmovs r3, 0x8\n"
	"\tldrsh r0, [r1, r3]\n"
	"\tcmp r0, 0\n"
	"\tbne _0804A9D8\n"
	"\tadds r0, r2, 0x1\n"
	"\tstrh r0, [r1, 0x8]\n"
	"\tb _0804ABB8\n"
	"\t.align 2, 0\n"
	"_0804A9D4: .4byte gTasks\n"
	"_0804A9D8:\n"
	"\tldrh r0, [r1, 0xC]\n"
	"\tmov r9, r0\n"
	"\tldrb r6, [r1, 0xE]\n"
	"\tadds r0, r6, 0\n"
	"\tbl GetBattlerSide\n"
	"\tlsls r0, 24\n"
	"\tcmp r0, 0\n"
	"\tbeq _0804AA04\n"
	"\tldr r1, _0804A9FC @ =gBattlerPartyIndexes\n"
	"\tlsls r0, r6, 1\n"
	"\tadds r0, r1\n"
	"\tldrh r1, [r0]\n"
	"\tmovs r0, 0x64\n"
	"\tmuls r0, r1\n"
	"\tldr r1, _0804AA00 @ =gEnemyParty\n"
	"\tb _0804AA12\n"
	"\t.align 2, 0\n"
	"_0804A9FC: .4byte gBattlerPartyIndexes\n"
	"_0804AA00: .4byte gEnemyParty\n"
	"_0804AA04:\n"
	"\tldr r1, _0804AA50 @ =gBattlerPartyIndexes\n"
	"\tlsls r0, r6, 1\n"
	"\tadds r0, r1\n"
	"\tldrh r1, [r0]\n"
	"\tmovs r0, 0x64\n"
	"\tmuls r0, r1\n"
	"\tldr r1, _0804AA54 @ =gPlayerParty\n"
	"_0804AA12:\n"
	"\tadds r0, r1\n"
	"\tmovs r1, 0x26\n"
	"\tbl GetMonData\n"
	"\tlsls r0, 16\n"
	"\tlsrs r0, 16\n"
	"\tbl ItemIdToBallId\n"
	"\tlsls r0, 24\n"
	"\tlsrs r5, r0, 24\n"
	"\tadds r0, r5, 0\n"
	"\tbl LoadBallGfx\n"
	"\tldr r0, _0804AA58 @ =gBattleTypeFlags\n"
	"\tldr r0, [r0]\n"
	"\tmovs r1, 0x2\n"
	"\tands r0, r1\n"
	"\tcmp r0, 0\n"
	"\tbeq _0804AA60\n"
	"\tldr r4, _0804AA5C @ =gLinkPlayers\n"
	"\tadds r0, r6, 0\n"
	"\tbl GetBattlerMultiplayerId\n"
	"\tlsls r1, r0, 3\n"
	"\tsubs r1, r0\n"
	"\tlsls r1, 2\n"
	"\tadds r1, r4\n"
	"\tldrb r1, [r1, 0x13]\n"
	"\tmov r10, r1\n"
	"\tb _0804AA68\n"
	"\t.align 2, 0\n"
	"_0804AA50: .4byte gBattlerPartyIndexes\n"
	"_0804AA54: .4byte gPlayerParty\n"
	"_0804AA58: .4byte gBattleTypeFlags\n"
	"_0804AA5C: .4byte gLinkPlayers\n"
	"_0804AA60:\n"
	"\tldr r0, _0804AAB8 @ =gSaveBlock2Ptr\n"
	"\tldr r0, [r0]\n"
	"\tldrb r0, [r0, 0x8]\n"
	"\tmov r10, r0\n"
	"_0804AA68:\n"
	"\tlsls r0, r5, 1\n"
	"\tadds r0, r5\n"
	"\tlsls r0, 3\n"
	"\tldr r1, _0804AABC @ =gUnknown_82606F4\n"
	"\tadds r0, r1\n"
	"\tmovs r1, 0x20\n"
	"\tmovs r2, 0x50\n"
	"\tmovs r3, 0x1D\n"
	"\tbl CreateSprite\n"
	"\tlsls r0, 24\n"
	"\tlsrs r7, r0, 24\n"
	"\tlsls r5, r7, 4\n"
	"\tadds r0, r5, r7\n"
	"\tlsls r0, 2\n"
	"\tmov r8, r0\n"
	"\tldr r4, _0804AAC0 @ =gSprites\n"
	"\tadd r4, r8\n"
	"\tmovs r0, 0x80\n"
	"\tstrh r0, [r4, 0x2E]\n"
	"\tmovs r1, 0\n"
	"\tstrh r1, [r4, 0x30]\n"
	"\tmov r2, r9\n"
	"\tstrh r2, [r4, 0x3C]\n"
	"\tmov r3, r9\n"
	"\tcmp r3, 0xFE\n"
	"\tbeq _0804AAF8\n"
	"\tcmp r3, 0xFF\n"
	"\tbne _0804AB38\n"
	"\tldr r0, _0804AAC4 @ =gBattleTypeFlags\n"
	"\tldr r0, [r0]\n"
	"\tmovs r1, 0x80\n"
	"\tlsls r1, 9\n"
	"\tands r0, r1\n"
	"\tcmp r0, 0\n"
	"\tbeq _0804AAC8\n"
	"\tmovs r5, 0x20\n"
	"\tmovs r4, 0x40\n"
	"\tb _0804AACE\n"
	"\t.align 2, 0\n"
	"_0804AAB8: .4byte gSaveBlock2Ptr\n"
	"_0804AABC: .4byte gUnknown_82606F4\n"
	"_0804AAC0: .4byte gSprites\n"
	"_0804AAC4: .4byte gBattleTypeFlags\n"
	"_0804AAC8:\n"
	"\tmov r0, r10\n"
	"\tmovs r5, 0x30\n"
	"\tmovs r4, 0x46\n"
	"_0804AACE:\n"
	"\tldr r0, _0804AAEC @ =gBattlerTarget\n"
	"\tstrb r6, [r0]\n"
	"\tldr r2, _0804AAF0 @ =gSprites\n"
	"\tlsls r3, r7, 4\n"
	"\tadds r1, r3, r7\n"
	"\tlsls r1, 2\n"
	"\tadds r0, r1, r2\n"
	"\tstrh r5, [r0, 0x20]\n"
	"\tstrh r4, [r0, 0x22]\n"
	"\tadds r2, 0x1C\n"
	"\tadds r1, r2\n"
	"\tldr r0, _0804AAF4 @ =SpriteCB_PlayerMonSendOut_1\n"
	"\tstr r0, [r1]\n"
	"\tb _0804AB48\n"
	"\t.align 2, 0\n"
	"_0804AAEC: .4byte gBattlerTarget\n"
	"_0804AAF0: .4byte gSprites\n"
	"_0804AAF4: .4byte SpriteCB_PlayerMonSendOut_1\n"
	"_0804AAF8:\n"
	"\tadds r0, r6, 0\n"
	"\tmovs r1, 0\n"
	"\tbl GetBattlerSpriteCoord\n"
	"\tlsls r0, 24\n"
	"\tlsrs r0, 24\n"
	"\tstrh r0, [r4, 0x20]\n"
	"\tadds r0, r6, 0\n"
	"\tmovs r1, 0x1\n"
	"\tbl GetBattlerSpriteCoord\n"
	"\tlsls r0, 24\n"
	"\tlsrs r0, 24\n"
	"\tadds r0, 0x18\n"
	"\tstrh r0, [r4, 0x22]\n"
	"\tldr r0, _0804AB2C @ =gBattlerTarget\n"
	"\tstrb r6, [r0]\n"
	"\tmovs r1, 0\n"
	"\tstrh r1, [r4, 0x2E]\n"
	"\tldr r0, _0804AB30 @ =gSprites\n"
	"\tadds r0, 0x1C\n"
	"\tadd r0, r8\n"
	"\tldr r1, _0804AB34 @ =SpriteCB_OpponentMonSendOut\n"
	"\tstr r1, [r0]\n"
	"\tb _0804AB46\n"
	"\t.align 2, 0\n"
	"_0804AB2C: .4byte gBattlerTarget\n"
	"_0804AB30: .4byte gSprites\n"
	"_0804AB34: .4byte SpriteCB_OpponentMonSendOut\n"
	"_0804AB38:\n"
	"\tmovs r0, 0x1\n"
	"\tbl GetBattlerAtPosition\n"
	"\tldr r1, _0804AB64 @ =gBattlerTarget\n"
	"\tstrb r0, [r1]\n"
	"\tmovs r2, 0x1\n"
	"\tstr r2, [sp, 0x4]\n"
	"_0804AB46:\n"
	"\tadds r3, r5, 0\n"
	"_0804AB48:\n"
	"\tldr r0, _0804AB68 @ =gSprites\n"
	"\tadds r1, r3, r7\n"
	"\tlsls r1, 2\n"
	"\tadds r4, r1, r0\n"
	"\tldr r5, _0804AB64 @ =gBattlerTarget\n"
	"\tldrb r0, [r5]\n"
	"\tstrh r0, [r4, 0x3A]\n"
	"\tldr r3, [sp, 0x4]\n"
	"\tcmp r3, 0\n"
	"\tbne _0804AB6C\n"
	"\tldr r0, [sp]\n"
	"\tbl DestroyTask\n"
	"\tb _0804ABB8\n"
	"\t.align 2, 0\n"
	"_0804AB64: .4byte gBattlerTarget\n"
	"_0804AB68: .4byte gSprites\n"
	"_0804AB6C:\n"
	"\tmovs r0, 0x22\n"
	"\tstrh r0, [r4, 0x2E]\n"
	"\tldrb r0, [r5]\n"
	"\tmovs r1, 0\n"
	"\tbl GetBattlerSpriteCoord\n"
	"\tlsls r0, 24\n"
	"\tlsrs r0, 24\n"
	"\tstrh r0, [r4, 0x32]\n"
	"\tldrb r0, [r5]\n"
	"\tmovs r1, 0x1\n"
	"\tbl GetBattlerSpriteCoord\n"
	"\tlsls r0, 24\n"
	"\tlsrs r0, 24\n"
	"\tsubs r0, 0x10\n"
	"\tstrh r0, [r4, 0x36]\n"
	"\tldr r0, _0804ABC8 @ =0x0000ffd8\n"
	"\tstrh r0, [r4, 0x38]\n"
	"\tadds r0, r4, 0\n"
	"\tbl InitAnimArcTranslation\n"
	"\tmov r0, sp\n"
	"\tldrh r0, [r0]\n"
	"\tstrh r0, [r4, 0x6]\n"
	"\tldr r1, _0804ABCC @ =gTasks\n"
	"\tldr r2, [sp]\n"
	"\tlsls r0, r2, 2\n"
	"\tadds r0, r2\n"
	"\tlsls r0, 3\n"
	"\tadds r0, r1\n"
	"\tldrb r1, [r5]\n"
	"\tstrh r1, [r0, 0x10]\n"
	"\tldr r1, _0804ABD0 @ =TaskDummy\n"
	"\tstr r1, [r0]\n"
	"\tmovs r0, 0x36\n"
	"\tbl PlaySE\n"
	"_0804ABB8:\n"
	"\tadd sp, 0x8\n"
	"\tpop {r3-r5}\n"
	"\tmov r8, r3\n"
	"\tmov r9, r4\n"
	"\tmov r10, r5\n"
	"\tpop {r4-r7}\n"
	"\tpop {r0}\n"
	"\tbx r0\n"
	"\t.align 2, 0\n"
	"_0804ABC8: .4byte 0x0000ffd8\n"
	"_0804ABCC: .4byte gTasks\n"
	"_0804ABD0: .4byte TaskDummy\n");
}
#endif

static void SpriteCB_TestBallThrow(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
    {
        u16 ballId;
        u8 taskId = sprite->oam.affineParam;
        u8 opponentBattler = gTasks[taskId].tOpponentBattler;
        u8 noOfShakes = gTasks[taskId].tThrowId;

        StartSpriteAnim(sprite, 1);
        sprite->affineAnimPaused = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[5] = 0;
        ballId = ItemIdToBallId(GetBattlerPokeballItemId(opponentBattler));
        LaunchBallStarsTask(sprite->pos1.x, sprite->pos1.y - 5, 1, 0x1C, ballId);
        sprite->data[0] = LaunchBallFadeMonTask(FALSE, opponentBattler, 14, ballId);
        sprite->sBattler = opponentBattler;
        sprite->data[7] = noOfShakes;
        DestroyTask(taskId);
        sprite->callback = sub_804AC88;
    }
}

#undef tFrames
#undef tPan
#undef tThrowId
#undef tBattler
#undef tOpponentBattler

static void sub_804AC88(struct Sprite *sprite)
{
    sprite->callback = sub_804AC94;
}

static void sub_804AC94(struct Sprite *sprite)
{
    if (++sprite->data[5] == 10)
    {
        sprite->data[5] = 0;
        sprite->callback = sub_804AD00;
        StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[sprite->sBattler]], 2);
        AnimateSprite(&gSprites[gBattlerSpriteIds[sprite->sBattler]]);
        gSprites[gBattlerSpriteIds[sprite->sBattler]].data[1] = 0;
    }
}

static void sub_804AD00(struct Sprite *sprite)
{
    sprite->data[5]++;
    if (sprite->data[5] == 11)
        PlaySE(SE_SUIKOMU);
    if (gSprites[gBattlerSpriteIds[sprite->sBattler]].affineAnimEnded)
    {
        StartSpriteAnim(sprite, 2);
        gSprites[gBattlerSpriteIds[sprite->sBattler]].invisible = TRUE;
        sprite->data[5] = 0;
        sprite->callback = sub_804AD98;
    }
    else
    {
        gSprites[gBattlerSpriteIds[sprite->sBattler]].data[1] += 0x60;
        gSprites[gBattlerSpriteIds[sprite->sBattler]].pos2.y = -gSprites[gBattlerSpriteIds[sprite->sBattler]].data[1] >> 8;
    }
}

static void sub_804AD98(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sprite->data[5]++;
        if (sprite->data[5] == 1)
        {
            sprite->data[3] = 0;
            sprite->data[4] = 32;
            sprite->data[5] = 0;
            sprite->pos1.y += Cos(0, 32);
            sprite->pos2.y = -Cos(0, sprite->data[4]);
            sprite->callback = sub_804ADEC;
        }
    }
}

static void sub_804ADEC(struct Sprite *sprite)
{
    bool8 r5 = FALSE;

    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] += 4 + (sprite->data[3] >> 8);
        if (sprite->data[5] >= 64)
        {
            sprite->data[4] -= 10;
            sprite->data[3] += 0x101;
            if (sprite->data[3] >> 8 == 4)
                r5 = TRUE;
            switch (sprite->data[3] >> 8)
            {
            case 1:
                PlaySE(SE_KON);
                break;
            case 2:
                PlaySE(SE_KON2);
                break;
            case 3:
                PlaySE(SE_KON3);
                break;
            default:
                PlaySE(SE_KON4);
                break;
            }
        }
        break;
    case 1:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] -= 4 + (sprite->data[3] >> 8);
        if (sprite->data[5] <= 0)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= 0xFF00;
        }
        break;
    }
    if (r5)
    {
        sprite->data[3] = 0;
        sprite->pos1.y += Cos(64, 32);
        sprite->pos2.y = 0;
        if (sprite->data[7] == 0)
        {
            sprite->callback = SpriteCB_ReleaseMonFromBall;
        }
        else
        {
            sprite->callback = sub_804AEE4;
            sprite->data[4] = 1;
            sprite->data[5] = 0;
        }
    }
}

static void sub_804AEE4(struct Sprite *sprite)
{
    sprite->data[3]++;
    if (sprite->data[3] == 31)
    {
        sprite->data[3] = 0;
        sprite->affineAnimPaused = TRUE;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_804AF24;
        PlaySE(SE_BOWA);
    }
}

static void sub_804AF24(struct Sprite *sprite)
{
    switch (sprite->data[3] & 0xFF)
    {
    case 0:
    case 2:
        sprite->pos2.x += sprite->data[4];
        sprite->data[5] += sprite->data[4];
        sprite->affineAnimPaused = FALSE;
        if (sprite->data[5] > 3 || sprite->data[5] < -3)
        {
            sprite->data[3]++;
            sprite->data[5] = 0;
        }
        break;
    case 1:
        sprite->data[5]++;
        if (sprite->data[5] == 1)
        {
            sprite->data[5] = 0;
            sprite->data[4] = -sprite->data[4];
            sprite->data[3]++;
            sprite->affineAnimPaused = FALSE;
            if (sprite->data[4] < 0)
                ChangeSpriteAffineAnim(sprite, 2);
            else
                ChangeSpriteAffineAnim(sprite, 1);
        }
        else
        {
            sprite->affineAnimPaused = TRUE;
        }
        break;
    case 3:
        sprite->data[3] += 0x100;
        if (sprite->data[3] >> 8 == sprite->data[7])
        {
            sprite->callback = SpriteCB_ReleaseMonFromBall;
        }
        else
        {
            if (sprite->data[7] == 4 && sprite->data[3] >> 8 == 3)
            {
                sprite->callback = sub_804B484;
                sprite->affineAnimPaused = TRUE;
            }
            else
            {
                sprite->data[3]++;
                sprite->affineAnimPaused = TRUE;
            }
        }
        break;
    case 4:
    default:
        sprite->data[5]++;
        if (sprite->data[5] == 31)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= 0xFF00;
            StartSpriteAffineAnim(sprite, 3);
            if (sprite->data[4] < 0)
                StartSpriteAffineAnim(sprite, 2);
            else
                StartSpriteAffineAnim(sprite, 1);
            PlaySE(SE_BOWA);
        }
        break;
    }
}

#define tCryTaskSpecies         data[0]
#define tCryTaskPan             data[1]
#define tCryTaskWantedCry       data[2]
#define tCryTaskBattler         data[3]
#define tCryTaskMonSpriteId     data[4]
#define tCryTaskMonPtr1         data[5]
#define tCryTaskMonPtr2         data[6]
#define tCryTaskFrames          data[10]
#define tCryTaskState           data[15]

static void Task_PlayCryWhenReleasedFromBall(u8 taskId)
{
    u8 wantedCry = gTasks[taskId].tCryTaskWantedCry;
    s8 pan = gTasks[taskId].tCryTaskPan;
    u16 species = gTasks[taskId].tCryTaskSpecies;
    u8 battlerId = gTasks[taskId].tCryTaskBattler;
    u8 monSpriteId = gTasks[taskId].tCryTaskMonSpriteId;
    struct Pokemon *mon = (void*)(u32)((gTasks[taskId].tCryTaskMonPtr1 << 0x10) | (u16)(gTasks[taskId].tCryTaskMonPtr2));

    switch (gTasks[taskId].tCryTaskState)
    {
    case 0:
    default:
        if (gSprites[monSpriteId].affineAnimEnded)
            gTasks[taskId].tCryTaskState = wantedCry + 1;
        break;
    case 1:
        if (ShouldPlayNormalPokeCry(mon) == TRUE)
            PlayCry3(species, pan, 0);
        else
            PlayCry3(species, pan, 11);
        gBattleSpritesDataPtr->healthBoxesData[battlerId].field_1_x40 = 0;
        DestroyTask(taskId);
        break;
    case 2:
        StopCryAndClearCrySongs();
        gTasks[taskId].tCryTaskFrames = 3;
        gTasks[taskId].tCryTaskState = 20;
        break;
    case 20:
        if (gTasks[taskId].tCryTaskFrames == 0)
        {
            if (ShouldPlayNormalPokeCry(mon) == TRUE)
                PlayCry4(species, pan, 1);
            else
                PlayCry4(species, pan, 12);

            gBattleSpritesDataPtr->healthBoxesData[battlerId].field_1_x40 = 0;
            DestroyTask(taskId);
        }
        else
        {
            gTasks[taskId].tCryTaskFrames--;
        }
        break;
    case 3:
        gTasks[taskId].tCryTaskFrames = 6;
        gTasks[taskId].tCryTaskState = 30;
        break;
    case 30:
        if (gTasks[taskId].tCryTaskFrames != 0)
        {
            gTasks[taskId].tCryTaskFrames--;
            break;
        }
        gTasks[taskId].tCryTaskState++;
        // fall through
    case 31:
        if (!IsCryPlayingOrClearCrySongs())
        {
            StopCryAndClearCrySongs();
            gTasks[taskId].tCryTaskFrames = 3;
            gTasks[taskId].tCryTaskState++;
        }
        break;
    case 32:
        if (gTasks[taskId].tCryTaskFrames != 0)
        {
            gTasks[taskId].tCryTaskFrames--;
            break;
        }
        if (ShouldPlayNormalPokeCry(mon) == TRUE)
            PlayCry4(species, pan, 0);
        else
            PlayCry4(species, pan, 11);

        gBattleSpritesDataPtr->healthBoxesData[battlerId].field_1_x40 = 0;
        DestroyTask(taskId);
        break;
    }
}

static void SpriteCB_ReleaseMonFromBall(struct Sprite *sprite)
{
    u8 battlerId = sprite->sBattler;
    u32 ballId;

    StartSpriteAnim(sprite, 1);
    ballId = ItemIdToBallId(GetBattlerPokeballItemId(battlerId));
    LaunchBallStarsTask(sprite->pos1.x, sprite->pos1.y - 5, 1, 0x1C, ballId);
    sprite->data[0] = LaunchBallFadeMonTask(1, sprite->sBattler, 14, ballId);
    sprite->callback = HandleBallAnimEnd;

    if (gMain.inBattle)
    {
        struct Pokemon *mon;
        u16 species;
        s8 pan;
        u16 wantedCryCase;
        u8 taskId;

        if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
        {
            mon = &gEnemyParty[gBattlerPartyIndexes[battlerId]];
            pan = 25;
        }
        else
        {
            mon = &gPlayerParty[gBattlerPartyIndexes[battlerId]];
            pan = -25;
        }

        species = GetMonData(mon, MON_DATA_SPECIES);
        if ((battlerId == GetBattlerAtPosition(B_POSITION_PLAYER_LEFT) || battlerId == GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT))
         && IsDoubleBattle() && gBattleSpritesDataPtr->animationData->field_9_x1)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (IsBGMPlaying())
                    m4aMPlayStop(&gMPlayInfo_BGM);
            }
            else
            {
                m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 128);
            }
        }

        if (!IsDoubleBattle() || !gBattleSpritesDataPtr->animationData->field_9_x1)
            wantedCryCase = 0;
        else if (battlerId == GetBattlerAtPosition(B_POSITION_PLAYER_LEFT) || battlerId == GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT))
            wantedCryCase = 1;
        else
            wantedCryCase = 2;

        gBattleSpritesDataPtr->healthBoxesData[battlerId].field_1_x40 = 1;

        taskId = CreateTask(Task_PlayCryWhenReleasedFromBall, 3);
        gTasks[taskId].tCryTaskSpecies = species;
        gTasks[taskId].tCryTaskPan = pan;
        gTasks[taskId].tCryTaskWantedCry = wantedCryCase;
        gTasks[taskId].tCryTaskBattler = battlerId;
        gTasks[taskId].tCryTaskMonSpriteId = gBattlerSpriteIds[sprite->sBattler];
        gTasks[taskId].tCryTaskMonPtr1 = (u32)(mon) >> 0x10;
        gTasks[taskId].tCryTaskMonPtr2 = (u32)(mon);
        gTasks[taskId].tCryTaskState = 0;
    }

    StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[sprite->sBattler]], 1);

/*
    if (GetBattlerSide(sprite->sBattler) == B_SIDE_OPPONENT)
        gSprites[gBattlerSpriteIds[sprite->sBattler]].callback = sub_8039B58;
    else
        gSprites[gBattlerSpriteIds[sprite->sBattler]].callback = sub_8039E44;
*/

    AnimateSprite(&gSprites[gBattlerSpriteIds[sprite->sBattler]]);
    gSprites[gBattlerSpriteIds[sprite->sBattler]].data[1] = 0x1000;
}

#undef tCryTaskSpecies
#undef tCryTaskPan
#undef tCryTaskWantedCry
#undef tCryTaskBattler
#undef tCryTaskMonSpriteId
#undef tCryTaskMonPtr1
#undef tCryTaskMonPtr2
#undef tCryTaskFrames
#undef tCryTaskState

static void sub_804B484(struct Sprite *sprite)
{
    sprite->animPaused = TRUE;
    sprite->callback = sub_804B5C8;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

static void HandleBallAnimEnd(struct Sprite *sprite)
{
    bool8 affineAnimEnded = FALSE;
    u8 battlerId = sprite->sBattler;

    gSprites[gBattlerSpriteIds[battlerId]].invisible = FALSE;
    if (sprite->animEnded)
        sprite->invisible = TRUE;
    if (gSprites[gBattlerSpriteIds[battlerId]].affineAnimEnded)
    {
        StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[battlerId]], 0);
        affineAnimEnded = TRUE;
    }
    else
    {
        gSprites[gBattlerSpriteIds[battlerId]].data[1] -= 288;
        gSprites[gBattlerSpriteIds[battlerId]].pos2.y = gSprites[gBattlerSpriteIds[battlerId]].data[1] >> 8;
    }
    if (sprite->animEnded && affineAnimEnded)
    {
        s32 i, doneBattlers;

        gSprites[gBattlerSpriteIds[battlerId]].pos2.y = 0;
        gDoingBattleAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battlerId].ballAnimActive = 0;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);

        for (doneBattlers = 0, i = 0; i < MAX_BATTLERS_COUNT; i++)
        {
            if (gBattleSpritesDataPtr->healthBoxesData[i].ballAnimActive == 0)
                doneBattlers++;
        }
        if (doneBattlers == MAX_BATTLERS_COUNT)
        {
            for (i = 0; i < POKEBALL_COUNT; i++)
                FreeBallGfx(i);
        }
    }
}

static void sub_804B5C8(struct Sprite *sprite)
{
    u8 battlerId = sprite->sBattler;

    sprite->data[4]++;
    if (sprite->data[4] == 40)
    {
        return;
    }
    else if (sprite->data[4] == 95)
    {
        gDoingBattleAnim = FALSE;
        m4aMPlayAllStop();
        PlaySE(MUS_FANFA5);
    }
    else if (sprite->data[4] == 315)
    {
        FreeOamMatrix(gSprites[gBattlerSpriteIds[sprite->sBattler]].oam.matrixNum);
        DestroySprite(&gSprites[gBattlerSpriteIds[sprite->sBattler]]);
        DestroySpriteAndFreeResources(sprite);
        if (gMain.inBattle)
            gBattleSpritesDataPtr->healthBoxesData[battlerId].ballAnimActive = 0;
    }
}

static void SpriteCB_PlayerMonSendOut_1(struct Sprite *sprite)
{
    sprite->data[0] = 25;
    sprite->data[2] = GetBattlerSpriteCoord(sprite->sBattler, 2);
    sprite->data[4] = GetBattlerSpriteCoord(sprite->sBattler, 3) + 24;
    sprite->data[5] = -30;
    sprite->oam.affineParam = sprite->sBattler;
    InitAnimArcTranslation(sprite);
    sprite->callback = SpriteCB_PlayerMonSendOut_2;
}

#define HIBYTE(x) (((x) >> 8) & 0xFF)

static void SpriteCB_PlayerMonSendOut_2(struct Sprite *sprite)
{
    u32 r6;
    u32 r7;

    if (HIBYTE(sprite->data[7]) >= 35 && HIBYTE(sprite->data[7]) < 80)
    {
        s16 r4;

        if ((sprite->oam.affineParam & 0xFF00) == 0)
        {
            r6 = sprite->data[1] & 1;
            r7 = sprite->data[2] & 1;
            sprite->data[1] = ((sprite->data[1] / 3) & ~1) | r6;
            sprite->data[2] = ((sprite->data[2] / 3) & ~1) | r7;
            StartSpriteAffineAnim(sprite, 4);
        }
        r4 = sprite->data[0];
        AnimTranslateLinear(sprite);
        sprite->data[7] += sprite->sBattler / 3;
        sprite->pos2.y += Sin(HIBYTE(sprite->data[7]), sprite->data[5]);
        sprite->oam.affineParam += 0x100;
        if ((sprite->oam.affineParam >> 8) % 3 != 0)
            sprite->data[0] = r4;
        else
            sprite->data[0] = r4 - 1;
        if (HIBYTE(sprite->data[7]) >= 80)
        {
            r6 = sprite->data[1] & 1;
            r7 = sprite->data[2] & 1;
            sprite->data[1] = ((sprite->data[1] * 3) & ~1) | r6;
            sprite->data[2] = ((sprite->data[2] * 3) & ~1) | r7;
        }
    }
    else
    {
        if (TranslateAnimHorizontalArc(sprite))
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.y = 0;
            sprite->pos2.x = 0;
            sprite->sBattler = sprite->oam.affineParam & 0xFF;
            sprite->data[0] = 0;

            if (IsDoubleBattle() && gBattleSpritesDataPtr->animationData->field_9_x1
             && sprite->sBattler == GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT))
                sprite->callback = SpriteCB_ReleaseMon2FromBall;
            else
                sprite->callback = SpriteCB_ReleaseMonFromBall;

            StartSpriteAffineAnim(sprite, 0);
        }
    }
}

static void SpriteCB_ReleaseMon2FromBall(struct Sprite *sprite)
{
    if (sprite->data[0]++ > 24)
    {
        sprite->data[0] = 0;
        sprite->callback = SpriteCB_ReleaseMonFromBall;
    }
}

static void SpriteCB_OpponentMonSendOut(struct Sprite *sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] > 15)
    {
        sprite->data[0] = 0;
        if (IsDoubleBattle() && gBattleSpritesDataPtr->animationData->field_9_x1
         && sprite->sBattler == GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT))
            sprite->callback = SpriteCB_ReleaseMon2FromBall;
        else
            sprite->callback = SpriteCB_ReleaseMonFromBall;
    }
}

#undef sBattler

static u8 LaunchBallStarsTaskForPokeball(u8 x, u8 y, u8 kindOfStars, u8 d)
{
    return LaunchBallStarsTask(x, y, kindOfStars, d, BALL_POKE);
}

static u8 LaunchBallFadeMonTaskForPokeball(bool8 unFadeLater, u8 battlerId, u32 arg2)
{
    return LaunchBallFadeMonTask(unFadeLater, battlerId, arg2, BALL_POKE);
}

void CreatePokeballSpriteToReleaseMon(u8 monSpriteId, u8 battlerId, u8 x, u8 y, u8 oamPriority, u8 subpriortiy, u8 g, u32 h)
{
    u8 spriteId;

    LoadCompressedSpriteSheetUsingHeap(&gBallSpriteSheets[0]);
    LoadCompressedSpritePaletteUsingHeap(&gBallSpritePalettes[0]);
    spriteId = CreateSprite(&gBallSpriteTemplates[0], x, y, subpriortiy);

    gSprites[spriteId].data[0] = monSpriteId;
    gSprites[spriteId].data[5] = gSprites[monSpriteId].pos1.x;
    gSprites[spriteId].data[6] = gSprites[monSpriteId].pos1.y;

    gSprites[monSpriteId].pos1.x = x;
    gSprites[monSpriteId].pos1.y = y;
    //gSprites[monSpriteId].data[7] = species;

    gSprites[spriteId].data[1] = g;
    gSprites[spriteId].data[2] = battlerId;
    gSprites[spriteId].data[3] = h;
    gSprites[spriteId].data[4] = h >> 0x10;
    gSprites[spriteId].oam.priority = oamPriority;
    gSprites[spriteId].callback = sub_804B9E8;

    gSprites[monSpriteId].invisible = TRUE;
}

static void sub_804B9E8(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        u8 r5;
        u8 r7 = sprite->data[0];
        u8 battlerId = sprite->data[2];
        u32 r4 = (u16)sprite->data[3] | ((u16)sprite->data[4] << 16);

        if (sprite->subpriority != 0)
            r5 = sprite->subpriority - 1;
        else
            r5 = 0;

        StartSpriteAnim(sprite, 1);
        LaunchBallStarsTaskForPokeball(sprite->pos1.x, sprite->pos1.y - 5, sprite->oam.priority, r5);
        sprite->data[1] = LaunchBallFadeMonTaskForPokeball(1, battlerId, r4);
        sprite->callback = sub_804BAA4;
        gSprites[r7].invisible = FALSE;
        StartSpriteAffineAnim(&gSprites[r7], 1);
        AnimateSprite(&gSprites[r7]);
        gSprites[r7].data[1] = 0x1000;
        sprite->data[7] = 0;
    }
    else
    {
        sprite->data[1]--;
    }
}

static void sub_804BAA4(struct Sprite *sprite)
{
    bool8 r12 = FALSE;
    bool8 r6 = FALSE;
    u8 monSpriteId = sprite->data[0];
    u16 var1;
    u16 var2;

    if (sprite->animEnded)
        sprite->invisible = TRUE;
    if (gSprites[monSpriteId].affineAnimEnded)
    {
        StartSpriteAffineAnim(&gSprites[monSpriteId], 0);
        r12 = TRUE;
    }
    var1 = (sprite->data[5] - sprite->pos1.x) * sprite->data[7] / 128 + sprite->pos1.x;
    var2 = (sprite->data[6] - sprite->pos1.y) * sprite->data[7] / 128 + sprite->pos1.y;
    gSprites[monSpriteId].pos1.x = var1;
    gSprites[monSpriteId].pos1.y = var2;
    if (sprite->data[7] < 128)
    {
        s16 sine = -(gSineTable[(u8)sprite->data[7]] / 8);

        sprite->data[7] += 4;
        gSprites[monSpriteId].pos2.x = sine;
        gSprites[monSpriteId].pos2.y = sine;
    }
    else
    {
        gSprites[monSpriteId].pos1.x = sprite->data[5];
        gSprites[monSpriteId].pos1.y = sprite->data[6];
        gSprites[monSpriteId].pos2.x = 0;
        gSprites[monSpriteId].pos2.y = 0;
        r6 = TRUE;
    }
    if (sprite->animEnded && r12 && r6)
    {
        /*
		if (gSprites[monSpriteId].data[7] == SPECIES_EGG)
            DoMonFrontSpriteAnimation(&gSprites[monSpriteId], gSprites[monSpriteId].data[7], TRUE, 0);
        else
            DoMonFrontSpriteAnimation(&gSprites[monSpriteId], gSprites[monSpriteId].data[7], FALSE, 0);
		*/
        DestroySpriteAndFreeResources(sprite);
    }
}

u8 CreateTradePokeballSprite(u8 a, u8 b, u8 x, u8 y, u8 oamPriority, u8 subPriority, u8 g, u32 h)
{
    u8 spriteId;

    LoadCompressedSpriteSheetUsingHeap(&gBallSpriteSheets[0]);
    LoadCompressedSpritePaletteUsingHeap(&gBallSpritePalettes[0]);
    spriteId = CreateSprite(&gBallSpriteTemplates[0], x, y, subPriority);
    gSprites[spriteId].data[0] = a;
    gSprites[spriteId].data[1] = g;
    gSprites[spriteId].data[2] = b;
    gSprites[spriteId].data[3] = h;
    gSprites[spriteId].data[4] = h >> 16;
    gSprites[spriteId].oam.priority = oamPriority;
    gSprites[spriteId].callback = sub_804BC50;
    return spriteId;
}

static void sub_804BC50(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        u8 r6;
        u8 r7 = sprite->data[0];
        u8 r8 = sprite->data[2];
        u32 r5 = (u16)sprite->data[3] | ((u16)sprite->data[4] << 16);

        if (sprite->subpriority != 0)
            r6 = sprite->subpriority - 1;
        else
            r6 = 0;

        StartSpriteAnim(sprite, 1);
        LaunchBallStarsTaskForPokeball(sprite->pos1.x, sprite->pos1.y - 5, sprite->oam.priority, r6);
        sprite->data[1] = LaunchBallFadeMonTaskForPokeball(1, r8, r5);
        sprite->callback = sub_804BCF8;
        StartSpriteAffineAnim(&gSprites[r7], 2);
        AnimateSprite(&gSprites[r7]);
        gSprites[r7].data[1] = 0;
    }
    else
    {
        sprite->data[1]--;
    }
}

static void sub_804BCF8(struct Sprite *sprite)
{
    u8 r1;

    sprite->data[5]++;
    if (sprite->data[5] == 11)
        PlaySE(SE_SUIKOMU);
    r1 = sprite->data[0];
    if (gSprites[r1].affineAnimEnded)
    {
        StartSpriteAnim(sprite, 2);
        gSprites[r1].invisible = TRUE;
        sprite->data[5] = 0;
        sprite->callback = sub_804BD6C;
    }
    else
    {
        gSprites[r1].data[1] += 96;
        gSprites[r1].pos2.y = -gSprites[r1].data[1] >> 8;
    }
}

static void sub_804BD6C(struct Sprite *sprite)
{
    if (sprite->animEnded)
        sprite->callback = SpriteCallbackDummy;
}

static void DestroySpriteAndFreeResources2(struct Sprite *sprite)
{
    DestroySpriteAndFreeResources(sprite);
}

void sub_804BD94(u8 battlerId)
{
    struct Sprite *healthboxSprite = &gSprites[gHealthboxSpriteIds[battlerId]];

    healthboxSprite->data[0] = 5;
    healthboxSprite->data[1] = 0;
    healthboxSprite->pos2.x = 0x73;
    healthboxSprite->pos2.y = 0;
    healthboxSprite->callback = sub_804BE48;
    if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
    {
        healthboxSprite->data[0] = -healthboxSprite->data[0];
        healthboxSprite->data[1] = -healthboxSprite->data[1];
        healthboxSprite->pos2.x = -healthboxSprite->pos2.x;
        healthboxSprite->pos2.y = -healthboxSprite->pos2.y;
    }
    gSprites[healthboxSprite->data[5]].callback(&gSprites[healthboxSprite->data[5]]);
    if (GetBattlerPosition(battlerId) == B_POSITION_PLAYER_RIGHT)
        healthboxSprite->callback = sub_804BE24;
}

static void sub_804BE24(struct Sprite *sprite)
{
    sprite->data[1]++;
    if (sprite->data[1] == 20)
    {
        sprite->data[1] = 0;
        sprite->callback = sub_804BE48;
    }
}

static void sub_804BE48(struct Sprite *sprite)
{
    sprite->pos2.x -= sprite->data[0];
    sprite->pos2.y -= sprite->data[1];
    if (sprite->pos2.x == 0 && sprite->pos2.y == 0)
        sprite->callback = SpriteCallbackDummy;
}

void DoHitAnimHealthboxEffect(u8 battlerId)
{
    u8 spriteId;

    spriteId = CreateInvisibleSpriteWithCallback(SpriteCB_HitAnimHealthoxEffect);
    gSprites[spriteId].data[0] = 1;
    gSprites[spriteId].data[1] = gHealthboxSpriteIds[battlerId];
    gSprites[spriteId].callback = SpriteCB_HitAnimHealthoxEffect;
}

static void SpriteCB_HitAnimHealthoxEffect(struct Sprite *sprite)
{
    u8 r1 = sprite->data[1];

    gSprites[r1].pos2.y = sprite->data[0];
    sprite->data[0] = -sprite->data[0];
    sprite->data[2]++;
    if (sprite->data[2] == 21)
    {
        gSprites[r1].pos2.x = 0;
        gSprites[r1].pos2.y = 0;
        DestroySprite(sprite);
    }
}

void LoadBallGfx(u8 ballId)
{
    u16 var;

    if (GetSpriteTileStartByTag(gBallSpriteSheets[ballId].tag) == 0xFFFF)
    {
        LoadCompressedSpriteSheetUsingHeap(&gBallSpriteSheets[ballId]);
        LoadCompressedSpritePaletteUsingHeap(&gBallSpritePalettes[ballId]);
    }
    switch (ballId)
    {
    case BALL_DIVE:
    case BALL_LUXURY:
    case BALL_PREMIER:
        break;
    default:
        var = GetSpriteTileStartByTag(gBallSpriteSheets[ballId].tag);
        LZDecompressVram(gOpenPokeballGfx, (void *)(VRAM + 0x10100 + var * 32));
        break;
    }
}

void FreeBallGfx(u8 ballId)
{
    FreeSpriteTilesByTag(gBallSpriteSheets[ballId].tag);
    FreeSpritePaletteByTag(gBallSpritePalettes[ballId].tag);
}

static u16 GetBattlerPokeballItemId(u8 battlerId)
{
    if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
        return GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_POKEBALL);
    else
        return GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerId]], MON_DATA_POKEBALL);
}

