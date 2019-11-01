#include "global.h"
#include "malloc.h"
#include "bg.h"
#include "data.h"
#include "decompress.h"
#include "dynamic_placeholder_text_util.h"
#include "easy_chat.h"
#include "event_data.h"
#include "field_message_box.h"
#include "field_weather.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "main.h"
#include "mevent.h"
#include "menu.h"
#include "overworld.h"
#include "palette.h"
#include "pokedex.h"
#include "random.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "window.h"
#include "constants/easy_chat.h"
#include "constants/map_objects.h"
#include "constants/flags.h"
#include "constants/songs.h"
#include "constants/species.h"

#define EZCHAT_TASK_STATE        0
#define EZCHAT_TASK_TYPE         1
#define EZCHAT_TASK_WORDS        2
#define EZCHAT_TASK_MAINCALLBACK 4
#define EZCHAT_TASK_UNK06        6
#define EZCHAT_TASK_SIZE         7

EWRAM_DATA struct EasyChatScreen *sEasyChatScreen = NULL;
EWRAM_DATA struct Unk203A11C *sUnknown_0203A11C = NULL;
EWRAM_DATA struct Unk203A120 *sUnknown_0203A120 = NULL;

void sub_811A2C0(u8);
void MainCallback_EasyChatScreen(void);
bool8 sub_811A428(u8);
void sub_811A2FC(u8);
void sub_811A4D0(MainCallback);
bool32 sub_811A88C(u16);
void sub_811A8A4(u16);
bool8 EasyChat_AllocateResources(u8, u16 *, u8);
void EasyChat_FreeResources(void);
u16 sub_811AAAC(void);
u16 sub_811AB68(void);
u16 sub_811ACDC(void);
u16 sub_811AE44(void);
u16 sub_811AF00(void);
u16 sub_811AF8C(void);
u16 sub_811AFEC(void);
u16 sub_811B040(void);
u16 sub_811B08C(void);
u16 sub_811B0BC(void);
u16 sub_811B0E8(void);
u16 sub_811B0F8(void);
u16 sub_811B150(void);
u16 sub_811B1B4(void);
u8 GetEasyChatScreenFrameId(void);
u8 GetEachChatScreenTemplateId(u8);
void sub_811BDF0(u8 *);
void sub_811BF78(void);
bool8 sub_811BF8C(void);
bool8 sub_811BFA4(void);
void sub_811C13C(void);
void sub_811C158(u16);
bool8 sub_811C170(void);
bool8 sub_811F28C(void);
void sub_811F2B8(void);
u8 sub_811F3AC(void);
int FooterHasFourOptions(void);
int sub_811B184(void);
int sub_811B264(void);
int sub_811B32C(void);
int sub_811B2B0(void);
int sub_811B33C(void);
int sub_811B368(void);
u16 sub_811B528(int);
u16 sub_811B794(u32);
int sub_811B394(void);
u8 sub_811B2A4(void);
void sub_811B3E4(void);
void sub_811BE9C(void);
int sub_811B4EC(void);
void sub_811B418(void);
void sub_811B454(void);
int sub_811BD64(void);
int sub_811BDB0(void);
int sub_811BD2C(void);
int sub_811BCF4(void);
u16 sub_811B8E8(void);
u8 sub_811F3B8(u8);
void sub_811F548(int, u16);
int sub_811B908(void);
u16 sub_811F5B0(void);
void sub_811B488(u16);
u16 sub_811B940(void);
u16 sub_811F578(u16);
int sub_811BF88(int);
u16 sub_811B8C8(void);
int sub_811B568(u32);
int sub_811B634(u32);
int sub_811B6C4(u32);
void sub_811B978(void);
void sub_811B744(void);
u8 sub_811B9C8(void);
void sub_811B768(void);
u8 sub_811B960(u8);
void sub_811B9A0(void);
u8 sub_811BA1C(void);
int sub_811BF20(void);
u16 sub_811BF40(void);
bool8 sub_811CE94(void);
void sub_811CF64(void);
void sub_811CF04(void);
void sub_811D60C(void);
void sub_811D424(u16 *);
void sub_811D230(void);
void sub_811E948(void);
void sub_811CFCC(void);
void sub_811D0BC(void);
void sub_811D2C8(void);
void sub_811D684(void);
void sub_811DE90(void);
void sub_811DEC4(void);
void sub_811DF28(struct Sprite *);
void sub_811DE5C(u8, u8, u8, u8);
void sub_811E5D4(void);
void sub_811E720(void);
void sub_811E828(void);
bool8 sub_811C2D4(void);
bool8 sub_811C30C(void);
bool8 sub_811C3E4(void);
bool8 sub_811C48C(void);
bool8 sub_811C404(void);
bool8 sub_811C448(void);
bool8 sub_811C4D0(void);
bool8 sub_811C518(void);
bool8 sub_811C554(void);
bool8 sub_811C620(void);
bool8 sub_811C830(void);
bool8 sub_811C8F0(void);
bool8 sub_811C99C(void);
bool8 sub_811CA5C(void);
bool8 sub_811C780(void);
bool8 sub_811C78C(void);
bool8 sub_811C7D4(void);
bool8 sub_811CB18(void);
bool8 sub_811CB98(void);
bool8 sub_811CB24(void);
bool8 sub_811CC90(void);
bool8 sub_811CC08(void);
bool8 sub_811C6C0(void);
bool8 sub_811CD14(void);
bool8 sub_811CD54(void);
bool8 sub_811CD94(void);
bool8 sub_811CDD4(void);
bool8 sub_811CE14(void);
bool8 sub_811CE54(void);
void sub_811DF60(u8, u8);
int GetFooterOptionXOffset(int);
void sub_811DF90(void);
void sub_811D104(u8);
void sub_811D214(u8);
void sub_811DFB0(void);
void sub_811D6D4(void);
void sub_811D9CC(int);
void sub_811E3AC(void);
bool8 sub_811E418(void);
void sub_811DFC8(void);
void sub_811E6E0(int);
bool8 sub_811DAA4(void);
void sub_811E64C(void);
void sub_811E050(void);
void sub_811E4AC(void);
void sub_811E6B0(void);
void sub_811E55C(void);
bool8 sub_811E4D0(void);
bool8 sub_811E5B8(void);
void sub_811E578(void);
void sub_811E088(void);
void sub_811DDAC(s16, u8);
bool8 sub_811DE10(void);
void sub_811D9B4(void);
void sub_811D698(u32);
void sub_811E288(void);
void sub_811E794(void);
void sub_811E380(void);
void sub_811E7F8(void);
void sub_811E30C(void);
void sub_811D7A4(void);
void sub_811D7C8(void);
int sub_811DE48(void);
void sub_811D7EC(void);
void sub_811D830(void);
void sub_811D058(u8, u8, const u8 *, u8, u8, u8, u8, u8, u8);
void sub_811DD84(void);
void sub_811D6F4(void);
void PrintEasyChatKeyboardText(void);
void sub_811D794(void);
const u8 *GetEasyChatWordGroupName(u8);
void sub_811D864(u8, u8);
void sub_811D950(u8, u8);
void sub_811DADC(u8);
void sub_811DC28(int, int, int, int);
void sub_811E0EC(s8, s8);
void sub_811E1A4(s8, s8);
void sub_811E2DC(struct Sprite *);
void sub_811E34C(u8, u8);
bool8 sub_811F0F8(void);
u16 sub_811F108(void);
void sub_811F2D4(void);
void sub_811F46C(void);
u8 *CopyEasyChatWordPadded(u8 *, u16, u16);
u8 sub_811F860(u16);
u16 sub_811F5C4(u16);
u16 sub_811F6B8(u16);
bool8 sub_811F764(u16, u8);
int sub_811F838(u16);
void DoQuizAnswerEasyChatScreen(void);
void DoQuizQuestionEasyChatScreen(void);
void DoQuizSetAnswerEasyChatScreen(void);
void DoQuizSetQuestionEasyChatScreen(void);

#include "data/easy_chat/easy_chat_groups.h"
#include "data/easy_chat/easy_chat_words_by_letter.h"

const u8 *const gEasyChatGroupNamePointers[] = {
    [EC_GROUP_POKEMON] = gEasyChatGroupName_Pokemon,
    [EC_GROUP_TRAINER] = gEasyChatGroupName_Trainer,
    [EC_GROUP_STATUS] = gEasyChatGroupName_Status,
    [EC_GROUP_BATTLE] = gEasyChatGroupName_Battle,
    [EC_GROUP_GREETINGS] = gEasyChatGroupName_Greetings,
    [EC_GROUP_PEOPLE] = gEasyChatGroupName_People,
    [EC_GROUP_VOICES] = gEasyChatGroupName_Voices,
    [EC_GROUP_SPEECH] = gEasyChatGroupName_Speech,
    [EC_GROUP_ENDINGS] = gEasyChatGroupName_Endings,
    [EC_GROUP_FEELINGS] = gEasyChatGroupName_Feelings,
    [EC_GROUP_CONDITIONS] = gEasyChatGroupName_Conditions,
    [EC_GROUP_ACTIONS] = gEasyChatGroupName_Actions,
    [EC_GROUP_LIFESTYLE] = gEasyChatGroupName_Lifestyle,
    [EC_GROUP_HOBBIES] = gEasyChatGroupName_Hobbies,
    [EC_GROUP_TIME] = gEasyChatGroupName_Time,
    [EC_GROUP_MISC] = gEasyChatGroupName_Misc,
    [EC_GROUP_ADJECTIVES] = gEasyChatGroupName_Adjectives,
    [EC_GROUP_EVENTS] = gEasyChatGroupName_Events,
    [EC_GROUP_MOVE_1] = gEasyChatGroupName_Move1,
    [EC_GROUP_MOVE_2] = gEasyChatGroupName_Move2,
    [EC_GROUP_TRENDY_SAYING] = gEasyChatGroupName_TrendySaying,
    [EC_GROUP_POKEMON_2] = gEasyChatGroupName_Pokemon2,
};

const u16 sDefaultProfileWords[] = {
    EC_WORD_I_AM,
    EC_WORD_A,
    EC_WORD_POKEMON,
    EC_WORD_FRIEND,
};

const u16 sDefaultBattleStartWords[] = {
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_READY,
    EC_WORD_QUES,
    EC_WORD_HERE_I_COME,
    EC_WORD_EXCL,
};

const u16 gUnknown_83EE004[] = {
    SPECIES_DEOXYS,
};
/*

void DoEasyChatScreen(u8 type, u16 *words, MainCallback callback, u8 displayedPersonType)
{
    u8 taskId;

    ResetTasks();
    taskId = CreateTask(sub_811A2C0, 0);
    gTasks[taskId].data[EZCHAT_TASK_TYPE] = type;
    gTasks[taskId].data[EZCHAT_TASK_SIZE] = displayedPersonType;
    SetWordTaskArg(taskId, EZCHAT_TASK_WORDS, (u32)words);
    SetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK, (u32)callback);
    SetMainCallback2(MainCallback_EasyChatScreen);
}

void MainCallback_EasyChatScreen(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void VBlankCallback_EasyChatScreen(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

void sub_811A2A4(u8 taskId, TaskFunc taskFunc)
{
    gTasks[taskId].func = taskFunc;
    gTasks[taskId].data[EZCHAT_TASK_STATE] = 0;
}

void sub_811A2C0(u8 taskId)
{
    if (!IsUpdateLinkStateCBActive())
    {
        while (sub_811A428(taskId));
    }
    else
    {
        if (sub_811A428(taskId) == TRUE)
        {
            return;
        }
    }
    sub_811A2A4(taskId, sub_811A2FC);
}

void sub_811A2FC(u8 taskId)
{
    u16 v0;
    s16 *data;

    data = gTasks[taskId].data;
    switch (data[EZCHAT_TASK_STATE])
    {
    case 0:
        SetVBlankCallback(VBlankCallback_EasyChatScreen);
        BlendPalettes(0xFFFFFFFF, 16, 0);
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
        data[EZCHAT_TASK_STATE] = 5;
        break;
    case 1:
        v0 = sub_811AAAC();
        if (sub_811A88C(v0))
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
            data[EZCHAT_TASK_STATE] = 3;
            data[EZCHAT_TASK_UNK06] = v0;
        }
        else if (v0 == 0x18)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
            data[EZCHAT_TASK_STATE] = 4;
        }
        else if (v0 != 0)
        {
            PlaySE(SE_SELECT);
            sub_811C158(v0);
            data[EZCHAT_TASK_STATE] ++;
        }
        break;
    case 2:
        if (!sub_811C170())
            data[EZCHAT_TASK_STATE] = 1;
        break;
    case 3:
        if (!gPaletteFade.active)
            sub_811A8A4(data[EZCHAT_TASK_UNK06]);
        break;
    case 4:
        if (!gPaletteFade.active)
            sub_811A4D0((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        break;
    case 5:
        if (!gPaletteFade.active)
            data[EZCHAT_TASK_STATE] = 1;
        break;
    }
}

bool8 sub_811A428(u8 taskId)
{
    s16 *data;

    data = gTasks[taskId].data;
    switch (data[EZCHAT_TASK_STATE])
    {
    case 0:
        SetVBlankCallback(NULL);
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        break;
    case 1:
        if (!sub_811F28C())
        {
            sub_811A4D0((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 2:
        if (!EasyChat_AllocateResources(data[EZCHAT_TASK_TYPE], (u16 *)GetWordTaskArg(taskId, EZCHAT_TASK_WORDS), data[EZCHAT_TASK_SIZE]))
        {
            sub_811A4D0((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 3:
        if (!sub_811BF8C())
        {
            sub_811A4D0((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 4:
        if (sub_811BFA4())
        {
            return TRUE;
        }
        break;
    default:
        return FALSE;
    }
    data[EZCHAT_TASK_STATE] ++;
    return TRUE;
}

void sub_811A4D0(MainCallback callback)
{
    sub_811C13C();
    EasyChat_FreeResources();
    sub_811F2B8();
    FreeAllWindowBuffers();
    SetMainCallback2(callback);
}

void ShowEasyChatScreen(void)
{
    int i;
    u16 *words;
    struct MauvilleManBard *bard;
    u8 displayedPersonType = EASY_CHAT_PERSON_DISPLAY_NONE;
    switch (gSpecialVar_0x8004)
    {
    case EASY_CHAT_TYPE_PROFILE:
        words = gSaveBlock1Ptr->easyChatProfile;
        break;
    case EASY_CHAT_TYPE_BATTLE_START:
        words = gSaveBlock1Ptr->easyChatBattleStart;
        break;
    case EASY_CHAT_TYPE_BATTLE_WON:
        words = gSaveBlock1Ptr->easyChatBattleWon;
        break;
    case EASY_CHAT_TYPE_BATTLE_LOST:
        words = gSaveBlock1Ptr->easyChatBattleLost;
        break;
    case EASY_CHAT_TYPE_MAIL:
        words = gSaveBlock1Ptr->mail[gSpecialVar_0x8005].words;
        break;
    case EASY_CHAT_TYPE_BARD_SONG:
        bard = &gSaveBlock1Ptr->oldMan.bard;
        for (i = 0; i < 6; i ++)
            bard->temporaryLyrics[i] = bard->songLyrics[i];

        words = bard->temporaryLyrics;
        break;
    case EASY_CHAT_TYPE_INTERVIEW:
        words = gSaveBlock1Ptr->tvShows[gSpecialVar_0x8005].bravoTrainer.words;
        displayedPersonType = gSpecialVar_0x8006;
        break;
    case EASY_CHAT_TYPE_FAN_CLUB:
        words = &gSaveBlock1Ptr->tvShows[gSpecialVar_0x8005].fanclubOpinions.words[gSpecialVar_0x8006];
        displayedPersonType = EASY_CHAT_PERSON_REPORTER_FEMALE;
        break;
    case EASY_CHAT_TYPE_UNK_8:
        words = gSaveBlock1Ptr->tvShows[gSpecialVar_0x8005].unkShow04.words;
        displayedPersonType = EASY_CHAT_PERSON_REPORTER_MALE;
        break;
    case EASY_CHAT_TYPE_TRENDY_PHRASE:
        words = (u16 *)gStringVar3;
        words[0] = gSaveBlock1Ptr->easyChatPairs[0].words[0];
        words[1] = gSaveBlock1Ptr->easyChatPairs[0].words[1];
        break;
    case EASY_CHAT_TYPE_GABBY_AND_TY:
        words = gSaveBlock1Ptr->gabbyAndTyData.quote;
        *words = -1;
        displayedPersonType = EASY_CHAT_PERSON_REPORTER_FEMALE;
        break;
    case EASY_CHAT_TYPE_CONTEST_INTERVIEW:
        words = &gSaveBlock1Ptr->tvShows[gSpecialVar_0x8005].bravoTrainer.words[gSpecialVar_0x8006];
        displayedPersonType = EASY_CHAT_PERSON_REPORTER_MALE;
        break;
    case EASY_CHAT_TYPE_BATTLE_TOWER_INTERVIEW:
        words = gSaveBlock1Ptr->tvShows[gSpecialVar_0x8005].fanclubOpinions.words18;
        displayedPersonType = EASY_CHAT_PERSON_REPORTER_FEMALE;
        break;
    case EASY_CHAT_TYPE_GOOD_SAYING:
        words = (u16 *)gStringVar3;
        InitializeEasyChatWordArray(words, 2);
        break;
    case EASY_CHAT_TYPE_FAN_QUESTION:
        words = gSaveBlock1Ptr->tvShows[gSpecialVar_0x8005].fanClubSpecial.words;
        words[0] = -1;
        displayedPersonType = EASY_CHAT_PERSON_BOY;
        break;
    case EASY_CHAT_TYPE_QUIZ_ANSWER:
        words = &gSaveBlock1Ptr->lilycoveLady.quiz.playerAnswer;
        break;
    case EASY_CHAT_TYPE_QUIZ_QUESTION:
        return;
    case EASY_CHAT_TYPE_QUIZ_SET_QUESTION:
        words = gSaveBlock1Ptr->lilycoveLady.quiz.question;
        break;
    case EASY_CHAT_TYPE_QUIZ_SET_ANSWER:
        words = &gSaveBlock1Ptr->lilycoveLady.quiz.correctAnswer;
        break;
    case EASY_CHAT_TYPE_APPRENTICE:
        words = gSaveBlock2Ptr->apprentices[0].easyChatWords;
        break;
    case EASY_CHAT_TYPE_QUESTIONNAIRE:
        words = sub_801B058();
        break;
    default:
        return;
    }

    CleanupOverworldWindowsAndTilemaps();
    DoEasyChatScreen(gSpecialVar_0x8004, words, CB2_ReturnToFieldContinueScript, displayedPersonType);
}

void CB2_QuizLadyQuestion(void)
{
    LilycoveLady *lilycoveLady;

    UpdatePaletteFade();
    switch (gMain.state)
    {
    case 0:
        FadeScreen(1, 0);
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            lilycoveLady = &gSaveBlock1Ptr->lilycoveLady;
            lilycoveLady->quiz.playerAnswer = -1;
            CleanupOverworldWindowsAndTilemaps();
            DoQuizQuestionEasyChatScreen();
        }
        return;
    }
    gMain.state ++;
}

void QuizLadyShowQuizQuestion(void)
{
    SetMainCallback2(CB2_QuizLadyQuestion);
}

int sub_811A868(u16 word)
{
    int i;

    for (i = 0; i < ARRAY_COUNT(sUnknown_08597530); i ++)
    {
        if (word == sUnknown_08597530[i].word)
            return i;
    }
    return -1;
}

bool32 sub_811A88C(u16 word)
{
    return sub_811A868(word) == -1 ? FALSE : TRUE;
}

void sub_811A8A4(u16 word)
{
    int i;

    i = sub_811A868(word);
    ResetTasks();
    sub_811A4D0(sUnknown_08597530[i].callback);
}

void DoQuizAnswerEasyChatScreen(void)
{
    DoEasyChatScreen(
        EASY_CHAT_TYPE_QUIZ_ANSWER,
        &gSaveBlock1Ptr->lilycoveLady.quiz.playerAnswer,
        CB2_ReturnToFieldContinueScript,
        EASY_CHAT_PERSON_DISPLAY_NONE);
}

void DoQuizQuestionEasyChatScreen(void)
{
    DoEasyChatScreen(EASY_CHAT_TYPE_QUIZ_QUESTION,
        gSaveBlock1Ptr->lilycoveLady.quiz.question,
        CB2_ReturnToFieldContinueScript,
        EASY_CHAT_PERSON_DISPLAY_NONE);
}

void DoQuizSetAnswerEasyChatScreen(void)
{
    DoEasyChatScreen(EASY_CHAT_TYPE_QUIZ_SET_ANSWER,
        &gSaveBlock1Ptr->lilycoveLady.quiz.correctAnswer,
        CB2_ReturnToFieldContinueScript,
        EASY_CHAT_PERSON_DISPLAY_NONE);
}

void DoQuizSetQuestionEasyChatScreen(void)
{
    DoEasyChatScreen(EASY_CHAT_TYPE_QUIZ_SET_QUESTION,
        gSaveBlock1Ptr->lilycoveLady.quiz.question,
        CB2_ReturnToFieldContinueScript,
        EASY_CHAT_PERSON_DISPLAY_NONE);
}

bool8 EasyChat_AllocateResources(u8 type, u16 *words, u8 displayedPersonType)
{
    u8 templateId;
    int i;

    sEasyChatScreen = malloc(sizeof(*sEasyChatScreen));
    if (sEasyChatScreen == NULL)
        return FALSE;

    sEasyChatScreen->type = type;
    sEasyChatScreen->words = words;
    sEasyChatScreen->mainCursorColumn = 0;
    sEasyChatScreen->mainCursorRow = 0;
    sEasyChatScreen->unk_09 = 0;
    sEasyChatScreen->displayedPersonType = displayedPersonType;
    sEasyChatScreen->unk_13 = 0;
    templateId = GetEachChatScreenTemplateId(type);
    if (type == EASY_CHAT_TYPE_QUIZ_QUESTION)
    {
        sub_811BDF0(sEasyChatScreen->unk_14);
        sEasyChatScreen->titleText = sEasyChatScreen->unk_14;
        sEasyChatScreen->state = 7;
    }
    else
    {
        sEasyChatScreen->state = 0;
        sEasyChatScreen->titleText = sEasyChatScreenTemplates[templateId].titleText;
    }

    sEasyChatScreen->numColumns = sEasyChatScreenTemplates[templateId].numColumns;
    sEasyChatScreen->numRows = sEasyChatScreenTemplates[templateId].numRows;
    sEasyChatScreen->unk_07 = sEasyChatScreen->numColumns * sEasyChatScreen->numRows;
    sEasyChatScreen->templateId = templateId;
    if (sEasyChatScreen->unk_07 > 9)
        sEasyChatScreen->unk_07 = 9;

    if (words != NULL)
    {
        CpuCopy16(words, sEasyChatScreen->ecWordBuffer, sEasyChatScreen->unk_07 * sizeof(u16));
    }
    else
    {
        for (i = 0; i < sEasyChatScreen->unk_07; i ++)
            sEasyChatScreen->ecWordBuffer[i] = -1;

        sEasyChatScreen->words = sEasyChatScreen->ecWordBuffer;
    }

    sEasyChatScreen->unk_0d = (sub_811F3AC() - 1) / 2 + 1;
    return TRUE;
}

void EasyChat_FreeResources(void)
{
    if (sEasyChatScreen != NULL)
        FREE_AND_SET_NULL(sEasyChatScreen);
}

u16 sub_811AAAC(void)
{
    switch (sEasyChatScreen->state)
    {
    case 0:
        return sub_811AB68();
    case 1:
        return sub_811ACDC();
    case 2:
        return sub_811AE44();
    case 3:
        return sub_811AF00();
    case 4:
        return sub_811AF8C();
    case 5:
        return sub_811B040();
    case 6:
        return sub_811AFEC();
    case 7:
        return sub_811B08C();
    case 8:
        return sub_811B0BC();
    case 9:
        return sub_811B0E8();
    case 10:
        return sub_811B0F8();
    }
    return 0;
}

bool32 sub_811AB44(void)
{
    switch (GetEasyChatScreenFrameId())
    {
    case 2:
    case 7:
    case 8:
        return TRUE;
    }
    return FALSE;
}

u16 sub_811AB68(void)
{
    do
    {
        if (gMain.newKeys & A_BUTTON)
        {
            sub_811BF78();
            sEasyChatScreen->state = 2;
            sEasyChatScreen->unk_0a = 0;
            sEasyChatScreen->unk_0b = 0;
            sEasyChatScreen->unk_0c = 0;
            return 9;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            return sub_811B150();
        }
        else if (gMain.newKeys & START_BUTTON)
        {
            return sub_811B1B4();
        }
        else if (gMain.newKeys & DPAD_UP)
        {
            sEasyChatScreen->mainCursorRow--;
            break;
        }
        else if (gMain.newKeys & DPAD_LEFT)
        {
            sEasyChatScreen->mainCursorColumn--;
            break;
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            sEasyChatScreen->mainCursorRow++;
            break;
        }
        else if (gMain.newKeys & DPAD_RIGHT)
        {
            sEasyChatScreen->mainCursorColumn++;
            break;
        }

        return 0;
    } while (0);

    if (sEasyChatScreen->mainCursorRow < 0)
        sEasyChatScreen->mainCursorRow = sEasyChatScreenTemplates[sEasyChatScreen->templateId].numRows;

    if (sEasyChatScreen->mainCursorRow > sEasyChatScreenTemplates[sEasyChatScreen->templateId].numRows)
        sEasyChatScreen->mainCursorRow = 0;

    if (sEasyChatScreen->mainCursorRow == sEasyChatScreenTemplates[sEasyChatScreen->templateId].numRows)
    {
        if (sEasyChatScreen->mainCursorColumn > 2)
            sEasyChatScreen->mainCursorColumn = 2;

        sEasyChatScreen->state = 1;
        return 3;
    }

    if (sEasyChatScreen->mainCursorColumn < 0)
        sEasyChatScreen->mainCursorColumn = sEasyChatScreenTemplates[sEasyChatScreen->templateId].numColumns - 1;

    if (sEasyChatScreen->mainCursorColumn >= sEasyChatScreenTemplates[sEasyChatScreen->templateId].numColumns)
        sEasyChatScreen->mainCursorColumn = 0;

    if (sub_811AB44() && sEasyChatScreen->mainCursorColumn == 1 && sEasyChatScreen->mainCursorRow == 4)
        sEasyChatScreen->mainCursorColumn = 0;

    return 2;
}

u16 sub_811ACDC(void)
{
    do
    {
        if (gMain.newKeys & A_BUTTON)
        {
            switch (sEasyChatScreen->mainCursorColumn)
            {
            case 0:
                return sub_811B184();
            case 1:
                return sub_811B150();
            case 2:
                return sub_811B1B4();
            case 3:
                return sub_811B264();
            }
        }

        if (gMain.newKeys & B_BUTTON)
        {
            return sub_811B150();
        }
        else if (gMain.newKeys & START_BUTTON)
        {
            return sub_811B1B4();
        }
        else if (gMain.newKeys & DPAD_UP)
        {
            sEasyChatScreen->mainCursorRow--;
            break;
        }
        else if (gMain.newKeys & DPAD_LEFT)
        {
            sEasyChatScreen->mainCursorColumn--;
            break;
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            sEasyChatScreen->mainCursorRow = 0;
            break;
        }
        else if (gMain.newKeys & DPAD_RIGHT)
        {
            sEasyChatScreen->mainCursorColumn++;
            break;
        }

        return 0;
    } while (0);

    if (sEasyChatScreen->mainCursorRow == sEasyChatScreenTemplates[sEasyChatScreen->templateId].numRows)
    {
        int numFooterColumns = FooterHasFourOptions() ? 4 : 3;
        if (sEasyChatScreen->mainCursorColumn < 0)
            sEasyChatScreen->mainCursorColumn = numFooterColumns - 1;

        if (sEasyChatScreen->mainCursorColumn >= numFooterColumns)
            sEasyChatScreen->mainCursorColumn = 0;

        return 3;
    }

    if (sEasyChatScreen->mainCursorColumn >= sEasyChatScreenTemplates[sEasyChatScreen->templateId].numColumns)
        sEasyChatScreen->mainCursorColumn = sEasyChatScreenTemplates[sEasyChatScreen->templateId].numColumns - 1;

    if (sub_811AB44() && sEasyChatScreen->mainCursorColumn == 1 && sEasyChatScreen->mainCursorRow == 4)
        sEasyChatScreen->mainCursorColumn = 0;

    sEasyChatScreen->state = 0;
    return 2;
}

u16 sub_811AE44(void)
{
    if (gMain.newKeys & B_BUTTON)
        return sub_811B32C();

    if (gMain.newKeys & A_BUTTON)
    {
        if (sEasyChatScreen->unk_0a != -1)
            return sub_811B2B0();

        switch (sEasyChatScreen->unk_0b)
        {
        case 0:
            return sub_811B33C();
        case 1:
            return sub_811B368();
        case 2:
            return sub_811B32C();
        }
    }

    if (gMain.newKeys & SELECT_BUTTON)
        return sub_811B33C();

    if (gMain.newAndRepeatedKeys & DPAD_UP)
        return sub_811B528(2);

    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        return sub_811B528(3);

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        return sub_811B528(1);

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        return sub_811B528(0);

    return 0;
}

u16 sub_811AF00(void)
{
    if (gMain.newKeys & B_BUTTON)
    {
        sEasyChatScreen->state = 2;
        return 14;
    }

    if (gMain.newKeys & A_BUTTON)
        return sub_811B394();

    if (gMain.newKeys & START_BUTTON)
        return sub_811B794(4);

    if (gMain.newKeys & SELECT_BUTTON)
        return sub_811B794(5);

    if (gMain.newAndRepeatedKeys & DPAD_UP)
        return sub_811B794(2);

    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        return sub_811B794(3);

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        return sub_811B794(1);

    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        return sub_811B794(0);

    return 0;
}

u16 sub_811AF8C(void)
{
    u8 var0;

    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = sub_811B2A4();
        return 7;
    case 0: // Yes
        gSpecialVar_Result = 0;
        var0 = sEasyChatScreen->type - EASY_CHAT_TYPE_QUIZ_SET_QUESTION;
        if (var0 < 2)
            sub_811B3E4();

        return 24;
    default:
        return 0;
    }
}

u16 sub_811AFEC(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = sub_811B2A4();
        return 7;
    case 0: // Yes
        sub_811BE9C();
        gSpecialVar_Result = sub_811B4EC();
        sub_811B3E4();
        return 24;
    default:
        return 0;
    }
}

u16 sub_811B040(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = 1;
        return 7;
    case 0: // Yes
        sub_811B418();
        sEasyChatScreen->state = 1;
        return 8;
    default:
        return 0;
    }
}

u16 sub_811B08C(void)
{
    if (gMain.newKeys & A_BUTTON)
        return 26;

    if (gMain.newKeys & B_BUTTON)
        return sub_811B150();

    return 0;
}

u16 sub_811B0BC(void)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        sEasyChatScreen->state = sub_811B2A4();
        return 7;
    }

    return 0;
}

u16 sub_811B0E8(void)
{
    sEasyChatScreen->state = 10;
    return 6;
}

u16 sub_811B0F8(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sub_811B454();
        sEasyChatScreen->stateBackup = 0;
        sEasyChatScreen->state = 8;
        return 31;
    case 0: // Yes
        gSpecialVar_Result = sub_811B4EC();
        sub_811B3E4();
        return 24;
    default:
        return 0;
    }
}

u16 sub_811B150(void)
{
    if (sEasyChatScreen->type == EASY_CHAT_TYPE_APPRENTICE
     || sEasyChatScreen->type == EASY_CHAT_TYPE_CONTEST_INTERVIEW)
    {
        sEasyChatScreen->stateBackup = sEasyChatScreen->state;
        sEasyChatScreen->state = 8;
        return 34;
    }
    else
    {
        sEasyChatScreen->stateBackup = sEasyChatScreen->state;
        sEasyChatScreen->state = 4;
        return 5;
    }
}

int sub_811B184(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    if (sEasyChatScreen->type != EASY_CHAT_TYPE_BARD_SONG)
    {
        sEasyChatScreen->state = 5;
        return 4;
    }
    else
    {
        sEasyChatScreen->stateBackup = sEasyChatScreen->state;
        sEasyChatScreen->state = 8;
        return 32;
    }
}

u16 sub_811B1B4(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    if (sEasyChatScreen->type == EASY_CHAT_TYPE_QUIZ_SET_QUESTION)
    {
        if (sub_811BD64())
        {
            sEasyChatScreen->state = 8;
            return 29;
        }

        if (sub_811BDB0())
        {
            sEasyChatScreen->state = 8;
            return 30;
        }

        sEasyChatScreen->state = 6;
        return 6;
    }
    else if (sEasyChatScreen->type == EASY_CHAT_TYPE_QUIZ_SET_ANSWER)
    {
        if (sub_811BDB0())
        {
            sEasyChatScreen->state = 8;
            return 30;
        }

        if (sub_811BD64())
        {
            sEasyChatScreen->state = 8;
            return 29;
        }

        sEasyChatScreen->state = 6;
        return 6;
    }
    else if (sEasyChatScreen->type == EASY_CHAT_TYPE_TRENDY_PHRASE
          || sEasyChatScreen->type == EASY_CHAT_TYPE_GOOD_SAYING)
    {
        if (!sub_811BD2C())
        {
            sEasyChatScreen->state = 8;
            return 33;
        }

        sEasyChatScreen->state = 6;
        return 6;
    }
    else if (sEasyChatScreen->type == EASY_CHAT_TYPE_APPRENTICE
          || sEasyChatScreen->type == EASY_CHAT_TYPE_CONTEST_INTERVIEW)
    {
        if (sub_811BCF4())
        {
            sEasyChatScreen->state = 8;
            return 34;
        }

        sEasyChatScreen->state = 6;
        return 6;
    }
    else if (sEasyChatScreen->type == EASY_CHAT_TYPE_QUESTIONNAIRE)
    {
        sEasyChatScreen->state = 6;
        return 6;
    }
    else
    {
        if (sub_811BCF4() == 1 || !sub_811B4EC())
        {
            sEasyChatScreen->state = 4;
            return 5;
        }

        sEasyChatScreen->state = 6;
        return 6;
    }
}

int sub_811B264(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    switch (sEasyChatScreen->type)
    {
    case EASY_CHAT_TYPE_QUIZ_ANSWER:
        return 25;
    case EASY_CHAT_TYPE_QUIZ_SET_QUESTION:
        sub_811B3E4();
        return 28;
    case EASY_CHAT_TYPE_QUIZ_SET_ANSWER:
        sub_811B3E4();
        return 27;
    default:
        return 0;
    }
}

u8 sub_811B2A4(void)
{
    return sEasyChatScreen->stateBackup;
}

int sub_811B2B0(void)
{
    u16 var1;

    if (sEasyChatScreen->unk_09 == 0)
    {
        u8 groupId = sub_811F3B8(sub_811B8E8());
        sub_811F548(0, groupId);
    }
    else
    {
        sub_811F548(1, sub_811B908());
    }

    var1 = sub_811F5B0();
    if (var1 == 0)
        return 0;

    sEasyChatScreen->unk_0f = (var1 - 1) / 2;
    sEasyChatScreen->unk_0e = 0;
    sEasyChatScreen->unk_10 = 0;
    sEasyChatScreen->unk_11 = 0;
    sEasyChatScreen->state = 3;
    return 11;
}

int sub_811B32C(void)
{
    sEasyChatScreen->state = 0;
    return 10;
}

int sub_811B33C(void)
{
    sEasyChatScreen->unk_0a = 0;
    sEasyChatScreen->unk_0b = 0;
    sEasyChatScreen->unk_0c = 0;
    if (!sEasyChatScreen->unk_09)
        sEasyChatScreen->unk_09 = 1;
    else
        sEasyChatScreen->unk_09 = 0;

    return 23;
}

int sub_811B368(void)
{
    if (sEasyChatScreen->type == EASY_CHAT_TYPE_BARD_SONG)
    {
        PlaySE(SE_HAZURE);
        return 0;
    }
    else
    {
        sub_811B488(0xFFFF);
        return 1;
    }
}

int sub_811B394(void)
{
    u16 easyChatWord = sub_811F578(sub_811B940());
    if (sub_811BF88(easyChatWord))
    {
        PlaySE(SE_HAZURE);
        return 0;
    }
    else
    {
        sub_811B488(easyChatWord);
        if (sEasyChatScreen->type != EASY_CHAT_TYPE_BARD_SONG)
        {
            sEasyChatScreen->state = 0;
            return 12;
        }
        else
        {
            sEasyChatScreen->state = 9;
            return 13;
        }
    }
}

void sub_811B3E4(void)
{
    int i;
    for (i = 0; i < sEasyChatScreen->unk_07; i++)
        sEasyChatScreen->words[i] = sEasyChatScreen->ecWordBuffer[i];
}

void sub_811B418(void)
{
    int i;
    for (i = 0; i < sEasyChatScreen->unk_07; i++)
        sEasyChatScreen->ecWordBuffer[i] = 0xFFFF;
}

void sub_811B454(void)
{
    int i;
    for (i = 0; i < sEasyChatScreen->unk_07; i++)
        sEasyChatScreen->ecWordBuffer[i] = sEasyChatScreen->words[i];
}

void sub_811B488(u16 easyChatWord)
{
    u16 index = sub_811B8C8();
    sEasyChatScreen->ecWordBuffer[index] = easyChatWord;
}

u8 sub_811B4AC(void)
{
    u16 i;
    for (i = 0; i < sEasyChatScreen->unk_07; i++)
    {
        if (sEasyChatScreen->ecWordBuffer[i] != sEasyChatScreen->words[i])
            return 1;
    }

    return 0;
}

int sub_811B4EC(void)
{
    u8 var0 = sEasyChatScreen->type - EASY_CHAT_TYPE_QUIZ_SET_QUESTION;
    if (var0 < 2)
    {
        if (sub_811BD64())
            return 0;

        if (sub_811BDB0())
            return 0;

        return 1;
    }
    else
    {
        return sub_811B4AC();
    }
}

u16 sub_811B528(int arg0)
{
    if (sEasyChatScreen->unk_0a != -1)
    {
        if (sEasyChatScreen->unk_09 == 0)
            return sub_811B568(arg0);
        else
            return sub_811B634(arg0);
    }
    else
    {
        return sub_811B6C4(arg0);
    }
}

int sub_811B568(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->unk_0b != -sEasyChatScreen->unk_0c)
        {
            if (sEasyChatScreen->unk_0b)
            {
                sEasyChatScreen->unk_0b--;
                return 15;
            }
            else
            {
                sEasyChatScreen->unk_0c--;
                return 17;
            }
        }
        break;
    case 3:
        if (sEasyChatScreen->unk_0b + sEasyChatScreen->unk_0c < sEasyChatScreen->unk_0d - 1)
        {
            int var0;
            if (sEasyChatScreen->unk_0b < 3)
            {
                sEasyChatScreen->unk_0b++;
                var0 = 15;
            }
            else
            {
                sEasyChatScreen->unk_0c++;
                var0 = 16;
            }

            sub_811B978();
            return var0;
        }
        break;
    case 1:
        if (sEasyChatScreen->unk_0a)
            sEasyChatScreen->unk_0a--;
        else
            sub_811B744();

        return 15;
    case 0:
        if (sEasyChatScreen->unk_0a < 1)
        {
            sEasyChatScreen->unk_0a++;
            if (sub_811B9C8())
                sub_811B744();
        }
        else
        {
            sub_811B744();
        }
        return 15;
    }

    return 0;
}

int sub_811B634(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->unk_0b > 0)
            sEasyChatScreen->unk_0b--;
        else
            sEasyChatScreen->unk_0b = 3;

        sub_811B978();
        return 15;
    case 3:
        if (sEasyChatScreen->unk_0b < 3)
            sEasyChatScreen->unk_0b++;
        else
            sEasyChatScreen->unk_0b = 0;

        sub_811B978();
        return 15;
    case 0:
        sEasyChatScreen->unk_0a++;
        if (sub_811B9C8())
            sub_811B744();

        return 15;
    case 1:
        sEasyChatScreen->unk_0a--;
        if (sEasyChatScreen->unk_0a < 0)
            sub_811B744();

        return 15;
    }

    return 0;
}

int sub_811B6C4(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->unk_0b)
            sEasyChatScreen->unk_0b--;
        else
            sEasyChatScreen->unk_0b = 2;

        return 15;
    case 3:
        if (sEasyChatScreen->unk_0b < 2)
            sEasyChatScreen->unk_0b++;
        else
            sEasyChatScreen->unk_0b = 0;

        return 15;
    case 1:
        sEasyChatScreen->unk_0b++;
        sub_811B768();
        return 15;
    case 0:
        sEasyChatScreen->unk_0a = 0;
        sEasyChatScreen->unk_0b++;
        return 15;
    }

    return 0;
}

void sub_811B744(void)
{
    sEasyChatScreen->unk_0a = 0xFF;
    if (sEasyChatScreen->unk_0b)
        sEasyChatScreen->unk_0b--;
}

void sub_811B768(void)
{
    if (sEasyChatScreen->unk_09 == 0)
    {
        sEasyChatScreen->unk_0a = 1;
        sub_811B978();
    }
    else
    {
        sEasyChatScreen->unk_0a = sub_811B960(sEasyChatScreen->unk_0b);
    }
}

u16 sub_811B794(u32 arg0)
{
    u16 result;
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->unk_11 + sEasyChatScreen->unk_0e > 0)
        {
            if (sEasyChatScreen->unk_11 > 0)
            {
                sEasyChatScreen->unk_11--;
                result = 18;
            }
            else
            {
                sEasyChatScreen->unk_0e--;
                result = 19;
            }

            sub_811B9A0();
            return result;
        }
        break;
    case 3:
        if (sEasyChatScreen->unk_11 + sEasyChatScreen->unk_0e < sEasyChatScreen->unk_0f)
        {
            if (sEasyChatScreen->unk_11 < 3)
            {
                sEasyChatScreen->unk_11++;
                result = 18;
            }
            else
            {
                sEasyChatScreen->unk_0e++;
                result = 20;
            }

            sub_811B9A0();
            return result;
        }
        break;
    case 1:
        if (sEasyChatScreen->unk_10 > 0)
            sEasyChatScreen->unk_10--;
        else
            sEasyChatScreen->unk_10 = 1;

        sub_811B9A0();
        return 18;
    case 0:
        if (sEasyChatScreen->unk_10 < 1)
        {
            sEasyChatScreen->unk_10++;
            if (sub_811BA1C())
                sEasyChatScreen->unk_10 = 0;
        }
        else
        {
            sEasyChatScreen->unk_10 = 0;
        }
        return 18;
    case 4:
        if (sEasyChatScreen->unk_0e)
        {
            if (sEasyChatScreen->unk_0e > 3)
                sEasyChatScreen->unk_0e -= 4;
            else
                sEasyChatScreen->unk_0e = 0;

            return 21;
        }
        break;
    case 5:
        if (sEasyChatScreen->unk_0e <= sEasyChatScreen->unk_0f - 4)
        {
            sEasyChatScreen->unk_0e += 4;
            if (sEasyChatScreen->unk_0e > sEasyChatScreen->unk_0f - 3)
                sEasyChatScreen->unk_0e = sEasyChatScreen->unk_0f + 0xFD;

            sub_811B9A0();
            return 22;
        }
        break;
    }

    return 0;
}

u16 sub_811B8C8(void)
{
    return (sEasyChatScreen->mainCursorRow * sEasyChatScreen->numColumns) + sEasyChatScreen->mainCursorColumn;
}

u16 sub_811B8E8(void)
{
    return 2 * (sEasyChatScreen->unk_0b + sEasyChatScreen->unk_0c) + sEasyChatScreen->unk_0a;
}

int sub_811B908(void)
{
    int var0 = (u8)sEasyChatScreen->unk_0a < 7 ? sEasyChatScreen->unk_0a : 0;
    int var1 = (u8)sEasyChatScreen->unk_0b < 4 ? sEasyChatScreen->unk_0b : 0;
    return sUnknown_08597748[var1][var0];
}

u16 sub_811B940(void)
{
    return 2 * (sEasyChatScreen->unk_11 + sEasyChatScreen->unk_0e)  + sEasyChatScreen->unk_10;
}

u8 sub_811B960(u8 arg0)
{
    switch (arg0)
    {
    case 0:
    default:
        return 6;
    case 1:
        return 5;
    }
}

void sub_811B978(void)
{
    while (sub_811B9C8())
    {
        if (sEasyChatScreen->unk_0a)
            sEasyChatScreen->unk_0a--;
        else
            break;
    }
}

void sub_811B9A0(void)
{
    while (sub_811BA1C())
    {
        if (sEasyChatScreen->unk_10)
            sEasyChatScreen->unk_10--;
        else
            break;
    }
}

u8 sub_811B9C8(void)
{
    if (sEasyChatScreen->unk_09 == 0)
        return sub_811B8E8() >= sub_811F3AC() ? 1 : 0;
    else
        return sEasyChatScreen->unk_0a > sub_811B960(sEasyChatScreen->unk_0b) ? 1 : 0;
}

u8 sub_811BA1C(void)
{
    return sub_811B940() >= sub_811F5B0() ? 1 : 0;
}

int FooterHasFourOptions(void)
{
    return sEasyChatScreenTemplates[sEasyChatScreen->templateId].fourFooterOptions;
}

u8 GetEasyChatScreenType(void)
{
    return sEasyChatScreen->type;
}

u8 GetEasyChatScreenFrameId(void)
{
    return sEasyChatScreenTemplates[sEasyChatScreen->templateId].frameId;
}

const u8 *GetTitleText(void)
{
    return sEasyChatScreen->titleText;
}

u16 *GetEasyChatWordBuffer(void)
{
    return sEasyChatScreen->ecWordBuffer;
}

u8 GetNumRows(void)
{
    return sEasyChatScreen->numRows;
}

u8 GetNumColumns(void)
{
    return sEasyChatScreen->numColumns;
}

u8 GetMainCursorColumn(void)
{
    return sEasyChatScreen->mainCursorColumn;
}

u8 GetMainCursorRow(void)
{
    return sEasyChatScreen->mainCursorRow;
}

void GetEasyChatInstructionsText(const u8 **str1, const u8 **str2)
{
    *str1 = sEasyChatScreenTemplates[sEasyChatScreen->templateId].instructionsText1;
    *str2 = sEasyChatScreenTemplates[sEasyChatScreen->templateId].instructionsText2;
}

void GetEasyChatConfirmText(const u8 **str1, const u8 **str2)
{
    *str1 = sEasyChatScreenTemplates[sEasyChatScreen->templateId].confirmText1;
    *str2 = sEasyChatScreenTemplates[sEasyChatScreen->templateId].confirmText2;
}

void sub_811BB40(const u8 **str1, const u8 **str2)
{
    switch (sEasyChatScreen->type)
    {
    case EASY_CHAT_TYPE_MAIL:
        *str1 = gText_StopGivingPkmnMail;
        *str2 = NULL;
        break;
    case EASY_CHAT_TYPE_QUIZ_ANSWER:
    case EASY_CHAT_TYPE_QUIZ_QUESTION:
        *str1 = gText_LikeToQuitQuiz;
        *str2 = gText_ChallengeQuestionMark;
        break;
    default:
        *str1 = gText_QuitEditing;
        *str2 = NULL;
        break;
    }

}

void GetEasyChatConfirmDeletionText(const u8 **str1, const u8 **str2)
{
    *str1 = gText_AllTextBeingEditedWill;
    *str2 = gText_BeDeletedThatOkay;
}

void sub_811BB9C(u8 *arg0, u8 *arg1)
{
    *arg0 = sEasyChatScreen->unk_0a;
    *arg1 = sEasyChatScreen->unk_0b;
}

u8 sub_811BBB0(void)
{
    return sEasyChatScreen->unk_09;
}

u8 sub_811BBBC(void)
{
    return sEasyChatScreen->unk_0c;
}

void sub_811BBC8(u8 *arg0, u8 *arg1)
{
    *arg0 = sEasyChatScreen->unk_10;
    *arg1 = sEasyChatScreen->unk_11;
}

u8 sub_811BBDC(void)
{
    return sEasyChatScreen->unk_0e;
}

u8 sub_811BBE8(void)
{
    return sEasyChatScreen->unk_0f;
}

u8 unref_sub_811BBF4(void)
{
    return 0;
}

int sub_811BBF8(void)
{
    switch (sEasyChatScreen->state)
    {
    case 2:
        if (sEasyChatScreen->unk_09 == 0 && sEasyChatScreen->unk_0c)
            return 1;
        break;
    case 3:
        if (sEasyChatScreen->unk_0e)
            return 1;
        break;
    }

    return 0;
}

int sub_811BC2C(void)
{
    switch (sEasyChatScreen->state)
    {
    case 2:
        if (sEasyChatScreen->unk_09 == 0 && sEasyChatScreen->unk_0c + 4 <= sEasyChatScreen->unk_0d - 1)
            return 1;
        break;
    case 3:
        if (sEasyChatScreen->unk_0e + 4 <= sEasyChatScreen->unk_0f)
            return 1;
        break;
    }

    return 0;
}

int FooterHasFourOptions_(void)
{
    return FooterHasFourOptions();
}

u8 sub_811BC7C(const u16 *arg0, u8 arg1)
{
    u8 i;

    for (i = 0; i < arg1; i++)
    {
        if (arg0[i] != sEasyChatScreen->ecWordBuffer[i])
            return 1;
    }

    return 0;
}

u8 GetDisplayedPersonType(void)
{
    return sEasyChatScreen->displayedPersonType;
}

u8 GetEachChatScreenTemplateId(u8 type)
{
    u32 i;

    for (i = 0; i < ARRAY_COUNT(sEasyChatScreenTemplates); i++)
    {
        if (sEasyChatScreenTemplates[i].type == type)
            return i;
    }

    return 0;
}

int sub_811BCF4(void)
{
    int i;

    for (i = 0; i < sEasyChatScreen->unk_07; i++)
    {
        if (sEasyChatScreen->ecWordBuffer[i] != 0xFFFF)
            return 0;
    }

    return 1;
}

int sub_811BD2C(void)
{
    int i;

    for (i = 0; i < sEasyChatScreen->unk_07; i++)
    {
        if (sEasyChatScreen->ecWordBuffer[i] == 0xFFFF)
            return 0;
    }

    return 1;
}

int sub_811BD64(void)
{
    int i;
    struct SaveBlock1 *saveBlock1;

    if (sEasyChatScreen->type == EASY_CHAT_TYPE_QUIZ_SET_QUESTION)
        return sub_811BCF4();

    saveBlock1 = gSaveBlock1Ptr;
    for (i = 0; i < QUIZ_QUESTION_LEN; i++)
    {
        if (saveBlock1->lilycoveLady.quiz.question[i] != 0xFFFF)
            return 0;
    }

    return 1;
}

int sub_811BDB0(void)
{
    struct LilycoveLadyQuiz *quiz;
    if (sEasyChatScreen->type == EASY_CHAT_TYPE_QUIZ_SET_ANSWER)
        return sub_811BCF4();

    quiz = &gSaveBlock1Ptr->lilycoveLady.quiz;
    return quiz->correctAnswer == 0xFFFF ? 1 : 0;
}

void sub_811BDF0(u8 *arg0)
{
    u8 name[32];
    struct SaveBlock1 *saveBlock1 = gSaveBlock1Ptr;
    DynamicPlaceholderTextUtil_Reset();
    if (StringLength(saveBlock1->lilycoveLady.quiz.playerName) != 0)
    {
        TVShowConvertInternationalString(name, saveBlock1->lilycoveLady.quiz.playerName, saveBlock1->lilycoveLady.quiz.language);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, name);
    }
    else
    {
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gText_Lady);
    }

    DynamicPlaceholderTextUtil_ExpandPlaceholders(arg0, gText_F700sQuiz);
}

void sub_811BE54(void)
{
    int i;
    u16 *ecWord;
    u8 *str;

    ecWord = sEasyChatScreen->ecWordBuffer;
    str = gStringVar2;
    i = 0;
    while (i < sEasyChatScreen->unk_07)
    {
        str = CopyEasyChatWordPadded(str, *ecWord, 0);
        *str = 0;
        str++;
        ecWord++;
        i++;
    }

    str--;
    str[0] = 0xFF;
}

void sub_811BE9C(void)
{
    switch (sEasyChatScreen->type)
    {
    case EASY_CHAT_TYPE_PROFILE:
        FlagSet(FLAG_SYS_CHAT_USED);
        break;
    case EASY_CHAT_TYPE_QUESTIONNAIRE:
        if (sub_811BF20())
            gSpecialVar_0x8004 = 2;
        else
            gSpecialVar_0x8004 = 0;
        break;
    case EASY_CHAT_TYPE_TRENDY_PHRASE:
        sub_811BE54();
        gSpecialVar_0x8004 = sub_81226D8(sEasyChatScreen->ecWordBuffer);
        break;
    case EASY_CHAT_TYPE_GOOD_SAYING:
        gSpecialVar_0x8004 = sub_811BF40();
        break;
    }
}

int sub_811BF20(void)
{
    return sub_811BC7C(sMysteryGiftPhrase, ARRAY_COUNT(sMysteryGiftPhrase)) == 0;
}

u16 sub_811BF40(void)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        if (!sub_811BC7C(sBerryMasterWifePhrases[i], ARRAY_COUNT(*sBerryMasterWifePhrases)))
            return i + 1;
    }

    return 0;
}

void sub_811BF78(void)
{
    sEasyChatScreen->unk_13 = 0;
}

int sub_811BF88(int easyChatWord)
{
    return 0;
}

bool8 sub_811BF8C(void)
{
    if (!sub_811CE94())
        return 0;
    else
        return 1;
}

bool8 sub_811BFA4(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sEasyChatBgTemplates, ARRAY_COUNT(sEasyChatBgTemplates));
        SetBgTilemapBuffer(3, sUnknown_0203A11C->unkB00);
        SetBgTilemapBuffer(1, sUnknown_0203A11C->unk300);
        InitWindows(sEasyChatWindowTemplates);
        DeactivateAllTextPrinters();
        sub_811CF64();
        sub_811CF04();
        CpuFastFill(0, (void *)VRAM + 0x1000000, 0x400);
        break;
    case 1:
        DecompressAndLoadBgGfxUsingHeap(3, gEasyChatWindow_Gfx, 0, 0, 0);
        CopyToBgTilemapBuffer(3, gEasyChatWindow_Tilemap, 0, 0);
        sub_811D60C();
        sub_811D424(sUnknown_0203A11C->unk300);
        sub_811D230();
        sub_811E948();
        CopyBgTilemapBufferToVram(3);
        break;
    case 2:
        DecompressAndLoadBgGfxUsingHeap(1, sUnknown_08597B54, 0, 0, 0);
        CopyBgTilemapBufferToVram(1);
        break;
    case 3:
        sub_811CFCC();
        sub_811D0BC();
        sub_811D2C8();
        sub_811D684();
        break;
    case 4:
        sub_811DE90();
        if (GetEasyChatScreenType() != EASY_CHAT_TYPE_QUIZ_QUESTION)
            sub_811DEC4();
        break;
    case 5:
        if (IsDma3ManagerBusyWithBgCopy())
        {
            return TRUE;
        }
        else
        {
            sub_811DE5C(0, 0, 0, 0);
            SetGpuReg(REG_OFFSET_WININ, WIN_RANGE(0, 63));
            SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0, 59));
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
            ShowBg(0);
            sub_811E5D4();
            sub_811E720();
            sub_811E828();
        }
        break;
    default:
        return FALSE;
    }

    sUnknown_0203A11C->unk0++;
    return TRUE;
}

void sub_811C13C(void)
{
    if (sUnknown_0203A11C)
        FREE_AND_SET_NULL(sUnknown_0203A11C);
}

void sub_811C158(u16 arg0)
{
    sUnknown_0203A11C->unk4 = arg0;
    sUnknown_0203A11C->unk0 = 0;
    sub_811C170();
}

bool8 sub_811C170(void)
{
    switch (sUnknown_0203A11C->unk4)
    {
    case 0:  return FALSE;
    case 1:  return sub_811C2D4();
    case 2:  return sub_811C30C();
    case 3:  return sub_811C3E4();
    case 4:  return sub_811C48C();
    case 5:  return sub_811C404();
    case 6:  return sub_811C448();
    case 7:  return sub_811C4D0();
    case 8:  return sub_811C518();
    case 9:  return sub_811C554();
    case 10: return sub_811C620();
    case 11: return sub_811C830();
    case 12: return sub_811C8F0();
    case 13: return sub_811C99C();
    case 14: return sub_811CA5C();
    case 15: return sub_811C780();
    case 16: return sub_811C78C();
    case 17: return sub_811C7D4();
    case 18: return sub_811CB18();
    case 19: return sub_811CB98();
    case 20: return sub_811CB24();
    case 21: return sub_811CC90();
    case 22: return sub_811CC08();
    case 23: return sub_811C6C0();
    case 24: return FALSE;
    case 25: return FALSE;
    case 26: return FALSE;
    case 27: return FALSE;
    case 28: return FALSE;
    case 29: return sub_811CD14();
    case 30: return sub_811CD54();
    case 31: return sub_811CD94();
    case 32: return sub_811CDD4();
    case 33: return sub_811CE14();
    case 34: return sub_811CE54();
    default: return FALSE;
    }
}

bool8 sub_811C2D4(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811D2C8();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811C30C(void)
{
    u8 i;
    u16 *ecWordBuffer;
    u16 *ecWord;
    u8 frameId;
    u8 cursorColumn, cursorRow, numColumns;
    s16 var1;
    int stringWidth;
    int trueStringWidth;
    u8 var2;
    u8 str[64];

    ecWordBuffer = GetEasyChatWordBuffer();
    frameId = GetEasyChatScreenFrameId();
    cursorColumn = GetMainCursorColumn();
    cursorRow = GetMainCursorRow();
    numColumns = GetNumColumns();
    ecWord = &ecWordBuffer[cursorRow * numColumns];
    var1 = 8 * sPhraseFrameDimensions[frameId].left + 13;
    for (i = 0; i < cursorColumn; i++)
    {
        if (*ecWord == 0xFFFF)
        {
            stringWidth = 72;
        }
        else
        {
            CopyEasyChatWord(str, *ecWord);
            stringWidth = GetStringWidth(1, str, 0);
        }

        trueStringWidth = stringWidth + 17;
        var1 += trueStringWidth;
        ecWord++;
    }

    var2 = 8 * (sPhraseFrameDimensions[frameId].top + cursorRow * 2);
    sub_811DF60(var1, var2 + 8);
    return FALSE;
}

bool8 sub_811C3E4(void)
{
    u8 xOffset = GetFooterOptionXOffset(GetMainCursorColumn());
    sub_811DF60(xOffset, 96);
    return FALSE;
}

bool8 sub_811C404(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(2);
        sub_811D214(1);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811C448(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(3);
        sub_811D214(0);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811C48C(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(1);
        sub_811D214(1);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811C4D0(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DFB0();
        sub_811D104(0);
        sub_811D2C8();
        ShowBg(0);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811C518(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DFB0();
        sub_811D104(0);
        sub_811D2C8();
        sUnknown_0203A11C->unk0++;
        // Fall through
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811C554(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        HideBg(0);
        sub_811DE5C(0, 0, 0, 0);
        sub_811D6D4();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811D9CC(0);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy() && !sub_811DAA4())
            sUnknown_0203A11C->unk0++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811E3AC();
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 4:
        if (!sub_811E418())
        {
            sub_811DFC8();
            sub_811E6E0(0);
            sub_811E64C();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811C620(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811E050();
        sub_811E4AC();
        sub_811E6B0();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (sub_811E4D0() == TRUE)
            break;

        sub_811D9CC(1);
        sUnknown_0203A11C->unk0++;
        // Fall through
    case 2:
        if (!sub_811DAA4())
            sUnknown_0203A11C->unk0++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811DFB0();
            ShowBg(0);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811C6C0(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811E050();
        sub_811E6B0();
        sub_811E55C();
        sub_811D9CC(5);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!sub_811DAA4() && !sub_811E5B8())
        {
            sub_811D6D4();
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811D9CC(6);
            sub_811E578();
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 3:
        if (!sub_811DAA4() && !sub_811E5B8())
        {
            sub_811E64C();
            sub_811DFC8();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811C780(void)
{
    sub_811E088();
    return FALSE;
}

bool8 sub_811C78C(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DDAC(1, 4);
        sUnknown_0203A11C->unk0++;
        // Fall through
    case 1:
        if (!sub_811DE10())
        {
            sub_811E088();
            sub_811E64C();
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 sub_811C7D4(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DDAC(-1, 4);
        sUnknown_0203A11C->unk0++;
        // Fall through
    case 1:
        if (!sub_811DE10())
        {
            sub_811E64C();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811C830(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811E050();
        sub_811E4AC();
        sub_811E6B0();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!sub_811E4D0())
        {
            sub_811D9B4();
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811D9CC(2);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 3:
        if (!sub_811DAA4())
        {
            sub_811D698(2);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811E288();
            sub_811E6E0(1);
            sub_811E64C();
            sub_811E794();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811C8F0(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811D2C8();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        sub_811E380();
        sub_811E6B0();
        sub_811E7F8();
        sub_811D9B4();
        sUnknown_0203A11C->unk0++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811D9CC(3);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 3:
        if (!sub_811DAA4())
        {
            ShowBg(0);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811DFB0();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811C99C(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811D2C8();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        sub_811E380();
        sub_811E6B0();
        sub_811E7F8();
        sub_811D9B4();
        sUnknown_0203A11C->unk0++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811D9CC(3);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 3:
        if (!sub_811DAA4())
        {
            sub_811D104(3);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ShowBg(0);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811DFB0();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 6:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811CA5C(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811E380();
        sub_811E6B0();
        sub_811E7F8();
        sub_811D9B4();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811D9CC(4);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!sub_811DAA4())
        {
            sub_811D6D4();
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811E3AC();
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 4:
        if (!sub_811E418())
        {
            sub_811DFC8();
            sub_811E6E0(0);
            sub_811E64C();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 sub_811CB18(void)
{
    sub_811E30C();
    return FALSE;
}

bool8 sub_811CB24(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811D7A4();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811DDAC(1, 4);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!sub_811DE10())
        {
            sub_811E30C();
            sub_811E64C();
            sub_811E794();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811CB98(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811D7C8();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_811DDAC(-1, 4);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!sub_811DE10())
        {
            sub_811E64C();
            sub_811E794();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811CC08(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811D7EC();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 var0 = sub_811BBDC() - sub_811DE48();
            sub_811DDAC(var0, 8);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!sub_811DE10())
        {
            sub_811E30C();
            sub_811E64C();
            sub_811E794();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811CC90(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811D830();
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 var0 = sub_811BBDC() - sub_811DE48();
            sub_811DDAC(var0, 8);
            sUnknown_0203A11C->unk0++;
        }
        break;
    case 2:
        if (!sub_811DE10())
        {
            sub_811E64C();
            sub_811E794();
            sUnknown_0203A11C->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_811CD14(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(4);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811CD54(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(5);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811CD94(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(6);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811CDD4(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(7);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811CE14(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(8);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811CE54(void)
{
    switch (sUnknown_0203A11C->unk0)
    {
    case 0:
        sub_811DF90();
        sub_811D104(9);
        sUnknown_0203A11C->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_811CE94(void)
{
    sUnknown_0203A11C = Alloc(sizeof(*sUnknown_0203A11C));
    if (!sUnknown_0203A11C)
        return FALSE;

    sUnknown_0203A11C->unk0 = 0;
    sUnknown_0203A11C->unk2D8 = NULL;
    sUnknown_0203A11C->unk2DC = NULL;
    sUnknown_0203A11C->unk2E0 = NULL;
    sUnknown_0203A11C->unk2E4 = NULL;
    sUnknown_0203A11C->unk2E8 = NULL;
    sUnknown_0203A11C->unk2EC = NULL;
    sUnknown_0203A11C->unk2F0 = NULL;
    sUnknown_0203A11C->unk2F4 = NULL;
    sUnknown_0203A11C->unk2F8 = NULL;
    sUnknown_0203A11C->unk2FC = NULL;
    sUnknown_0203A11C->unkA = FooterHasFourOptions_();
    return TRUE;
}

void sub_811CF04(void)
{
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
}

void sub_811CF64(void)
{
    ResetPaletteFade();
    LoadPalette(gEasyChatMode_Pal, 0, 32);
    LoadPalette(sUnknown_08597B14, 1 * 16, 32);
    LoadPalette(sUnknown_08597B34, 4 * 16, 32);
    LoadPalette(sUnknown_08597C1C, 10 * 16, 8);
    LoadPalette(sUnknown_08597C24, 11 * 16, 12);
    LoadPalette(sUnknown_08597C24, 15 * 16, 12);
    LoadPalette(sUnknown_08597C24, 3 * 16, 12);
}

void sub_811CFCC(void)
{
    int xOffset;
    const u8 *titleText = GetTitleText();
    if (!titleText)
        return;

    xOffset = GetStringCenterAlignXOffset(1, titleText, 144);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    sub_811D058(0, 1, titleText, xOffset, 1, 0xFF, 0, 2, 3);
    PutWindowTilemap(0);
    CopyWindowToVram(0, 3);
}

void sub_811D028(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16))
{
    AddTextPrinterParameterized(windowId, fontId, str, x, y, speed, callback);
}

void sub_811D058(u8 windowId, u8 fontId, const u8 *str, u8 left, u8 top, u8 speed, u8 red, u8 green, u8 blue)
{
    u8 color[3];
    color[0] = red;
    color[1] = green;
    color[2] = blue;
    AddTextPrinterParameterized3(windowId, fontId, left, top, color, speed, str);
}

void sub_811D0BC(void)
{
    FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 17);
    LoadUserWindowBorderGfx(1, 1, 0xE0);
    DrawTextBorderOuter(1, 1, 14);
    sub_811D104(0);
    PutWindowTilemap(1);
    CopyBgTilemapBufferToVram(0);
}

void sub_811D104(u8 arg0)
{
    const u8 *text2 = NULL;
    const u8 *text1 = NULL;
    switch (arg0)
    {
    case 0:
        GetEasyChatInstructionsText(&text1, &text2);
        break;
    case 2:
        sub_811BB40(&text1, &text2);
        break;
    case 3:
        GetEasyChatConfirmText(&text1, &text2);
        break;
    case 1:
        GetEasyChatConfirmDeletionText(&text1, &text2);
        break;
    case 4:
        text1 = gText_CreateAQuiz;
        break;
    case 5:
        text1 = gText_SelectTheAnswer;
        break;
    case 6:
        text1 = gText_OnlyOnePhrase;
        text2 = gText_OriginalSongWillBeUsed;
        break;
    case 7:
        text1 = gText_LyricsCantBeDeleted;
        break;
    case 8:
        text1 = gText_CombineTwoWordsOrPhrases3;
        break;
    case 9:
        text1 = gText_YouCannotQuitHere;
        text2 = gText_SectionMustBeCompleted;
        break;
    }

    FillWindowPixelBuffer(1, PIXEL_FILL(1));
    if (text1)
        sub_811D028(1, 1, text1, 0, 1, 0xFF, 0);

    if (text2)
        sub_811D028(1, 1, text2, 0, 17, 0xFF, 0);

    CopyWindowToVram(1, 3);
}

void sub_811D214(u8 initialCursorPos)
{
    CreateYesNoMenu(&sEasyChatYesNoWindowTemplate, 1, 14, initialCursorPos);
}

void sub_811D230(void)
{
    u8 frameId;
    struct WindowTemplate template;

    frameId = GetEasyChatScreenFrameId();
    template.bg = 3;
    template.tilemapLeft = sPhraseFrameDimensions[frameId].left;
    template.tilemapTop = sPhraseFrameDimensions[frameId].top;
    template.width = sPhraseFrameDimensions[frameId].width;
    template.height = sPhraseFrameDimensions[frameId].height;
    template.paletteNum = 11;
    template.baseBlock = 0x6C;
    sUnknown_0203A11C->windowId = AddWindow(&template);
    PutWindowTilemap(sUnknown_0203A11C->windowId);
}

void sub_811D2C8(void)
{
    u8 spC[4];
    u16 *ecWord;
    u8 numColumns, numRows;
    u8 *str;
    int frameId;
    int var1;
    int i, j, k;

    ecWord = GetEasyChatWordBuffer();
    numColumns = GetNumColumns();
    numRows = GetNumRows();
    frameId = GetEasyChatScreenFrameId();
    var1 = 0;
    if (frameId == 7)
        var1 = 1;

    FillWindowPixelBuffer(sUnknown_0203A11C->windowId, PIXEL_FILL(1));
    for (i = 0; i < numRows; i++)
    {
        memcpy(spC, sText_Clear17, sizeof(sText_Clear17));
        if (var1)
            spC[2] = 6;

        str = sUnknown_0203A11C->unkB;
        sUnknown_0203A11C->unkB[0] = EOS;
        str = StringAppend(str, spC);
        for (j = 0; j < numColumns; j++)
        {
            if (*ecWord != 0xFFFF)
            {
                str = CopyEasyChatWord(str, *ecWord);
                ecWord++;
            }
            else
            {
                ecWord++;
                if (!var1)
                {
                    str = WriteColorChangeControlCode(str, 0, 4);
                    for (k = 0; k < 12; k++)
                    {
                        *str = CHAR_HYPHEN;
                        str++;
                    }

                    str = WriteColorChangeControlCode(str, 0, 2);
                }
            }

            if (var1)
                spC[2] = 3;

            str = StringAppend(str, spC);
            if (frameId == 2 || frameId == 7 || frameId == 8)
            {
                if (j == 0 && i == 4)
                    break;
            }
        }

        *str = EOS;
        sub_811D028(sUnknown_0203A11C->windowId, 1, sUnknown_0203A11C->unkB, 0, i * 16 + 1, 0xFF, 0);
    }

    CopyWindowToVram(sUnknown_0203A11C->windowId, 3);
}

void sub_811D424(u16 *tilemap)
{
    u8 frameId;
    int right, bottom;
    int x, y;

    frameId = GetEasyChatScreenFrameId();
    CpuFastFill(0, tilemap, BG_SCREEN_SIZE);
    if (frameId == 2 || frameId == 8)
    {
        right = sPhraseFrameDimensions[frameId].left + sPhraseFrameDimensions[frameId].width;
        bottom = sPhraseFrameDimensions[frameId].top + sPhraseFrameDimensions[frameId].height;
        for (y = sPhraseFrameDimensions[frameId].top; y < bottom; y++)
        {
            x = sPhraseFrameDimensions[frameId].left - 1;
            tilemap[y * 32 + x] = 0x1005;
            x++;
            for (; x < right; x++)
                tilemap[y * 32 + x] = 0x1000;

            tilemap[y* 32 + x] = 0x1007;
        }
    }
    else
    {
        y = sPhraseFrameDimensions[frameId].top - 1;
        x = sPhraseFrameDimensions[frameId].left - 1;
        right = sPhraseFrameDimensions[frameId].left + sPhraseFrameDimensions[frameId].width;
        bottom = sPhraseFrameDimensions[frameId].top + sPhraseFrameDimensions[frameId].height;
        tilemap[y * 32 + x] = 0x1001;
        x++;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x1002;

        tilemap[y * 32 + x] = 0x1003;
        y++;
        for (; y < bottom; y++)
        {
            x = sPhraseFrameDimensions[frameId].left - 1;
            tilemap[y * 32 + x] = 0x1005;
            x++;
            for (; x < right; x++)
                tilemap[y * 32 + x] = 0x1000;

            tilemap[y* 32 + x] = 0x1007;
        }

        x = sPhraseFrameDimensions[frameId].left - 1;
        tilemap[y * 32 + x] = 0x1009;
        x++;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x100A;

        tilemap[y * 32 + x] = 0x100B;
    }
}

void sub_811D60C(void)
{
    u8 frameId;
    u16 *tilemap;

    tilemap = GetBgTilemapBuffer(3);
    frameId = GetEasyChatScreenFrameId();
    switch (sPhraseFrameDimensions[frameId].footerId)
    {
    case 2:
        tilemap += 0x2A0;
        CopyToBgTilemapBufferRect(3, tilemap, 0, 11, 32, 2);
        break;
    case 1:
        tilemap += 0x300;
        CopyToBgTilemapBufferRect(3, tilemap, 0, 11, 32, 2);
        break;
    case 3:
        CopyToBgTilemapBufferRect(3, tilemap, 0, 10, 32, 4);
        break;
    }
}

void sub_811D684(void)
{
    PutWindowTilemap(2);
    CopyBgTilemapBufferToVram(2);
}

void sub_811D698(u32 arg0)
{
    sub_811DD84();
    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    switch (arg0)
    {
    case 0:
        sub_811D6F4();
        break;
    case 1:
        PrintEasyChatKeyboardText();
        break;
    case 2:
        sub_811D794();
        break;
    }

    CopyWindowToVram(2, 2);
}

void sub_811D6D4(void)
{
    if (!sub_811BBB0())
        sub_811D698(0);
    else
        sub_811D698(1);
}

void sub_811D6F4(void)
{
    int i;
    int x, y;

    i = 0;
    y = 97;
    while (1)
    {
        for (x = 0; x < 2; x++)
        {
            u8 groupId = sub_811F3B8(i++);
            if (groupId == EC_NUM_GROUPS)
            {
                sub_811DDAC(sub_811BBBC(), 0);
                return;
            }

            sub_811D028(2, 1, GetEasyChatWordGroupName(groupId), x * 84 + 10, y, 0xFF, NULL);
        }

        y += 16;
    }
}

void PrintEasyChatKeyboardText(void)
{
    u32 i;

    for (i = 0; i < ARRAY_COUNT(sEasyChatKeyboardText); i++)
        sub_811D028(2, 1, sEasyChatKeyboardText[i], 10, 97 + i * 16, 0xFF, NULL);
}

void sub_811D794(void)
{
    sub_811D864(0, 4);
}

void sub_811D7A4(void)
{
    u8 var0 = sub_811BBDC() + 3;
    sub_811D950(var0, 1);
    sub_811D864(var0, 1);
}

void sub_811D7C8(void)
{
    u8 var0 = sub_811BBDC();
    sub_811D950(var0, 1);
    sub_811D864(var0, 1);
}

void sub_811D7EC(void)
{
    u8 var0 = sub_811BBDC();
    u8 var1 = var0 + 4;
    u8 var2 = sub_811BBE8() + 1;
    if (var1 > var2)
        var1 = var2;

    if (var0 < var1)
    {
        u8 var3 = var1 - var0;
        sub_811D950(var0, var3);
        sub_811D864(var0, var3);
    }
}

void sub_811D830(void)
{
    u8 var0 = sub_811BBDC();
    u8 var1 = sub_811DE48();
    if (var0 < var1)
    {
        u8 var2 = var1 - var0;
        sub_811D950(var0, var2);
        sub_811D864(var0, var2);
    }
}

void sub_811D864(u8 arg0, u8 arg1)
{
    int i, j;
    u16 easyChatWord;
    u8 *str;
    int y;
    int var0;

    var0 = arg0 * 2;
    y = (arg0 * 16 + 96) & 0xFF;
    y++;
    for (i = 0; i < arg1; i++)
    {
        for (j = 0; j < 2; j++)
        {
            easyChatWord = sub_811F578(var0++);
            if (easyChatWord != 0xFFFF)
            {
                CopyEasyChatWordPadded(sUnknown_0203A11C->unkCC, easyChatWord, 0);
                if (!sub_811BF88(easyChatWord))
                    sub_811D028(2, 1, sUnknown_0203A11C->unkCC, (j * 13 + 3) * 8, y, 0xFF, NULL);
                else
                    sub_811D058(2, 1, sUnknown_0203A11C->unkCC, (j * 13 + 3) * 8, y, 0xFF, 1, 5, 3);
            }
        }

        y += 16;
    }

    CopyWindowToVram(2, 2);
}

void sub_811D950(u8 arg0, u8 arg1)
{
    int y;
    int var0;
    int var1;
    int var2;

    y = (arg0 * 16 + 96) & 0xFF;
    var2 = arg1 * 16;
    var0 = y + var2;
    if (var0 > 255)
    {
        var1 = var0 - 256;
        var2 = 256 - y;
    }
    else
    {
        var1 = 0;
    }

    FillWindowPixelRect(2, PIXEL_FILL(1), 0, y, 224, var2);
    if (var1)
        FillWindowPixelRect(2, PIXEL_FILL(1), 0, 0, 224, var1);
}

void sub_811D9B4(void)
{
    FillWindowPixelBuffer(2, PIXEL_FILL(1));
    CopyWindowToVram(2, 2);
}

void sub_811D9CC(int arg0)
{
    switch (arg0)
    {
    case 0:
        sUnknown_0203A11C->unk6 = 0;
        sUnknown_0203A11C->unk7 = 10;
        break;
    case 1:
        sUnknown_0203A11C->unk6 = 9;
        sUnknown_0203A11C->unk7 = 0;
        break;
    case 2:
        sUnknown_0203A11C->unk6 = 11;
        sUnknown_0203A11C->unk7 = 17;
        break;
    case 3:
        sUnknown_0203A11C->unk6 = 17;
        sUnknown_0203A11C->unk7 = 0;
        break;
    case 4:
        sUnknown_0203A11C->unk6 = 17;
        sUnknown_0203A11C->unk7 = 10;
        break;
    case 5:
        sUnknown_0203A11C->unk6 = 18;
        sUnknown_0203A11C->unk7 = 22;
        break;
    case 6:
        sUnknown_0203A11C->unk6 = 22;
        sUnknown_0203A11C->unk7 = 18;
        break;
    }

    sUnknown_0203A11C->unk8 = sUnknown_0203A11C->unk6 < sUnknown_0203A11C->unk7 ? 1 : -1;
}

bool8 sub_811DAA4(void)
{
    u8 var0, var1;
    if (sUnknown_0203A11C->unk6 == sUnknown_0203A11C->unk7)
        return FALSE;

    sUnknown_0203A11C->unk6 += sUnknown_0203A11C->unk8;
    sub_811DADC(sUnknown_0203A11C->unk6);
    var0 = sUnknown_0203A11C->unk6;
    var1 = sUnknown_0203A11C->unk7;
    return (var0 ^ var1) > 0;
}

void sub_811DADC(u8 arg0)
{
    FillBgTilemapBufferRect_Palette0(1, 0, 0, 10, 30, 10);
    switch (arg0)
    {
    case 0:
        break;
    case 1:
        sub_811DC28(11, 14, 3, 2);
        break;
    case 2:
        sub_811DC28(9, 14, 7, 2);
        break;
    case 3:
        sub_811DC28(7, 14, 11, 2);
        break;
    case 4:
        sub_811DC28(5, 14, 15, 2);
        break;
    case 5:
        sub_811DC28(3, 14, 19, 2);
        break;
    case 6:
        sub_811DC28(1, 14, 23, 2);
        break;
    case 11:
        sub_811DC28(1, 10, 24, 10);
        break;
    case 12:
        sub_811DC28(1, 10, 25, 10);
        break;
    case 13:
        sub_811DC28(1, 10, 26, 10);
        break;
    case 14:
        sub_811DC28(1, 10, 27, 10);
        break;
    case 15:
        sub_811DC28(1, 10, 28, 10);
        break;
    case 16:
        sub_811DC28(1, 10, 29, 10);
        break;
    case 17:
        sub_811DC28(0, 10, 30, 10);
        break;
    case 10:
    case 18:
        sub_811DC28(1, 10, 23, 10);
        break;
    case 9:
    case 19:
        sub_811DC28(1, 11, 23, 8);
        break;
    case 8:
    case 20:
        sub_811DC28(1, 12, 23, 6);
        break;
    case 7:
    case 21:
        sub_811DC28(1, 13, 23, 4);
        break;
    case 22:
        sub_811DC28(1, 14, 23, 2);
        break;
    }

    CopyBgTilemapBufferToVram(1);
}

void sub_811DC28(int left, int top, int width, int height)
{
    u16 *tilemap;
    int right;
    int bottom;
    int x, y;

    tilemap = sUnknown_0203A11C->unk300;
    right = left + width - 1;
    bottom = top + height - 1;
    x = left;
    y = top;
    tilemap[y * 32 + x] = 0x4001;
    x++;
    for (; x < right; x++)
        tilemap[y * 32 + x] = 0x4002;

    tilemap[y * 32 + x] = 0x4003;
    y++;
    for (; y < bottom; y++)
    {
        tilemap[y * 32 + left] = 0x4005;
        x = left + 1;
        for (; x < right; x++)
            tilemap[y * 32 + x] = 0x4000;

        tilemap[y * 32 + x] = 0x4007;
    }

    tilemap[y * 32 + left] = 0x4009;
    x = left + 1;
    for (; x < right; x++)
        tilemap[y * 32 + x] = 0x400A;

    tilemap[y * 32 + x] = 0x400B;
    sub_811DE5C((left + 1) * 8, (top + 1) * 8, (width - 2) * 8, (height - 2) * 8);
}

void sub_811DD84(void)
{
    ChangeBgY(2, 0x800, 0);
    sUnknown_0203A11C->unk2CE = 0;
}

void sub_811DDAC(s16 arg0, u8 arg1)
{
    int bgY;
    s16 var0;

    bgY = GetBgY(2);
    sUnknown_0203A11C->unk2CE += arg0;
    var0 = arg0 * 16;
    bgY += var0 << 8;
    if (arg1)
    {
        sUnknown_0203A11C->unk2D0 = bgY;
        sUnknown_0203A11C->unk2D4 = arg1 * 256;
        if (var0 < 0)
            sUnknown_0203A11C->unk2D4 = -sUnknown_0203A11C->unk2D4;
    }
    else
    {
        ChangeBgY(2, bgY, 0);
    }
}

bool8 sub_811DE10(void)
{
    int bgY;

    bgY = GetBgY(2);
    if (bgY == sUnknown_0203A11C->unk2D0)
    {
        return FALSE;
    }
    else
    {
        ChangeBgY(2, sUnknown_0203A11C->unk2D4, 1);
        return TRUE;
    }
}

int sub_811DE48(void)
{
    return sUnknown_0203A11C->unk2CE;
}

void sub_811DE5C(u8 left, u8 top, u8 width, u8 height)
{
    u16 horizontalDimensions = WIN_RANGE(left, left + width);
    u16 verticalDimensions = WIN_RANGE(top, top + height);
    SetGpuReg(REG_OFFSET_WIN0H, horizontalDimensions);
    SetGpuReg(REG_OFFSET_WIN0V, verticalDimensions);
}

void sub_811DE90(void)
{
    u32 i;

    LoadSpriteSheets(sEasyChatSpriteSheets);
    LoadSpritePalettes(sEasyChatSpritePalettes);
    for (i = 0; i < ARRAY_COUNT(sUnknown_08597CE8); i++)
        LoadCompressedSpriteSheet(&sUnknown_08597CE8[i]);
}

void sub_811DEC4(void)
{
    u8 frameId = GetEasyChatScreenFrameId();
    int x = sPhraseFrameDimensions[frameId].left * 8 + 13;
    int y = sPhraseFrameDimensions[frameId].top * 8 + 8;
    u8 spriteId = CreateSprite(&sUnknown_08597D18, x, y, 2);
    sUnknown_0203A11C->unk2D8 = &gSprites[spriteId];
    gSprites[spriteId].data[1] = 1;
}

void sub_811DF28(struct Sprite *sprite)
{
    if (sprite->data[1])
    {
        if (++sprite->data[0] > 2)
        {
            sprite->data[0] = 0;
            if (++sprite->pos2.x > 0)
                sprite->pos2.x = -6;
        }
    }
}

void sub_811DF60(u8 x, u8 y)
{
    sUnknown_0203A11C->unk2D8->pos1.x = x;
    sUnknown_0203A11C->unk2D8->pos1.y = y;
    sUnknown_0203A11C->unk2D8->pos2.x = 0;
    sUnknown_0203A11C->unk2D8->data[0] = 0;
}

void sub_811DF90(void)
{
    sUnknown_0203A11C->unk2D8->data[0] = 0;
    sUnknown_0203A11C->unk2D8->data[1] = 0;
    sUnknown_0203A11C->unk2D8->pos2.x = 0;
}

void sub_811DFB0(void)
{
    sUnknown_0203A11C->unk2D8->data[1] = 1;
}

void sub_811DFC8(void)
{
    u8 spriteId = CreateSprite(&sUnknown_08597D68, 0, 0, 3);
    sUnknown_0203A11C->unk2DC = &gSprites[spriteId];
    sUnknown_0203A11C->unk2DC->pos2.x = 32;

    spriteId = CreateSprite(&sUnknown_08597D68, 0, 0, 3);
    sUnknown_0203A11C->unk2E0 = &gSprites[spriteId];
    sUnknown_0203A11C->unk2E0->pos2.x = -32;

    sUnknown_0203A11C->unk2DC->hFlip = 1;
    sub_811E088();
}

void sub_811E050(void)
{
    DestroySprite(sUnknown_0203A11C->unk2DC);
    sUnknown_0203A11C->unk2DC = NULL;
    DestroySprite(sUnknown_0203A11C->unk2E0);
    sUnknown_0203A11C->unk2E0 = NULL;
}

void sub_811E088(void)
{
    u8 var0;
    u8 var1;

    if (sUnknown_0203A11C->unk2DC && sUnknown_0203A11C->unk2E0)
    {
        sub_811BB9C(&var0, &var1);
        if (!sub_811BBB0())
            sub_811E0EC(var0, var1);
        else
            sub_811E1A4(var0, var1);
    }
}

void sub_811E0EC(s8 arg0, s8 arg1)
{
    if (arg0 != -1)
    {
        StartSpriteAnim(sUnknown_0203A11C->unk2DC, 0);
        sUnknown_0203A11C->unk2DC->pos1.x = arg0 * 84 + 58;
        sUnknown_0203A11C->unk2DC->pos1.y = arg1 * 16 + 96;

        StartSpriteAnim(sUnknown_0203A11C->unk2E0, 0);
        sUnknown_0203A11C->unk2E0->pos1.x = arg0 * 84 + 58;
        sUnknown_0203A11C->unk2E0->pos1.y = arg1 * 16 + 96;
    }
    else
    {
        StartSpriteAnim(sUnknown_0203A11C->unk2DC, 1);
        sUnknown_0203A11C->unk2DC->pos1.x = 216;
        sUnknown_0203A11C->unk2DC->pos1.y = arg1 * 16 + 112;

        StartSpriteAnim(sUnknown_0203A11C->unk2E0, 1);
        sUnknown_0203A11C->unk2E0->pos1.x = 216;
        sUnknown_0203A11C->unk2E0->pos1.y = arg1 * 16 + 112;
    }
}

void sub_811E1A4(s8 arg0, s8 arg1)
{
    int anim;
    int x, y;

    if (arg0 != -1)
    {
        y = arg1 * 16 + 96;
        x = 32;
        if (arg0 == 6 && arg1 == 0)
        {
            x = 158;
            anim = 2;
        }
        else
        {
            x += sUnknown_08597D08[arg0 < ARRAY_COUNT(sUnknown_08597D08) ? arg0 : 0];
            anim = 3;
        }

        StartSpriteAnim(sUnknown_0203A11C->unk2DC, anim);
        sUnknown_0203A11C->unk2DC->pos1.x = x;
        sUnknown_0203A11C->unk2DC->pos1.y = y;

        StartSpriteAnim(sUnknown_0203A11C->unk2E0, anim);
        sUnknown_0203A11C->unk2E0->pos1.x = x;
        sUnknown_0203A11C->unk2E0->pos1.y = y;
    }
    else
    {
        StartSpriteAnim(sUnknown_0203A11C->unk2DC, 1);
        sUnknown_0203A11C->unk2DC->pos1.x = 216;
        sUnknown_0203A11C->unk2DC->pos1.y = arg1 * 16 + 112;

        StartSpriteAnim(sUnknown_0203A11C->unk2E0, 1);
        sUnknown_0203A11C->unk2E0->pos1.x = 216;
        sUnknown_0203A11C->unk2E0->pos1.y = arg1 * 16 + 112;
    }
}

void sub_811E288(void)
{
    u8 spriteId = CreateSprite(&sUnknown_08597D18, 0, 0, 4);
    sUnknown_0203A11C->unk2E4 = &gSprites[spriteId];
    sUnknown_0203A11C->unk2E4->callback = sub_811E2DC;
    sUnknown_0203A11C->unk2E4->oam.priority = 2;
    sub_811E30C();
}

void sub_811E2DC(struct Sprite *sprite)
{
    if (++sprite->data[0] > 2)
    {
        sprite->data[0] = 0;
        if (++sprite->pos2.x > 0)
            sprite->pos2.x = -6;
    }
}

void sub_811E30C(void)
{
    s8 var0, var1, x, y;

    sub_811BBC8(&var0, &var1);
    x = var0 * 13;
    x = x * 8 + 28;
    y = var1 * 16 + 96;
    sub_811E34C(x, y);
}

void sub_811E34C(u8 x, u8 y)
{
    if (sUnknown_0203A11C->unk2E4)
    {
        sUnknown_0203A11C->unk2E4->pos1.x = x;
        sUnknown_0203A11C->unk2E4->pos1.y = y;
        sUnknown_0203A11C->unk2E4->pos2.x = 0;
        sUnknown_0203A11C->unk2E4->data[0] = 0;
    }
}

void sub_811E380(void)
{
    if (sUnknown_0203A11C->unk2E4)
    {
        DestroySprite(sUnknown_0203A11C->unk2E4);
        sUnknown_0203A11C->unk2E4 = NULL;
    }
}

void sub_811E3AC(void)
{
    u8 spriteId = CreateSprite(&sUnknown_08597DF0, 208, 128, 6);
    sUnknown_0203A11C->unk2E8 = &gSprites[spriteId];
    sUnknown_0203A11C->unk2E8->pos2.x = -64;

    spriteId = CreateSprite(&sUnknown_08597DD0, 208, 80, 5);
    sUnknown_0203A11C->unk2EC = &gSprites[spriteId];
    sUnknown_0203A11C->unk9 = 0;
}

bool8 sub_811E418(void)
{
    switch (sUnknown_0203A11C->unk9)
    {
    default:
        return FALSE;
    case 0:
        sUnknown_0203A11C->unk2E8->pos2.x += 8;
        if (sUnknown_0203A11C->unk2E8->pos2.x >= 0)
        {
            sUnknown_0203A11C->unk2E8->pos2.x = 0;
            if (!sub_811BBB0())
                StartSpriteAnim(sUnknown_0203A11C->unk2EC, 1);
            else
                StartSpriteAnim(sUnknown_0203A11C->unk2EC, 2);

            sUnknown_0203A11C->unk9++;
        }
        break;
    case 1:
        if (sUnknown_0203A11C->unk2EC->animEnded)
        {
            sUnknown_0203A11C->unk9 = 2;
            return FALSE;
        }
    }

    return TRUE;
}

void sub_811E4AC(void)
{
    sUnknown_0203A11C->unk9 = 0;
    StartSpriteAnim(sUnknown_0203A11C->unk2EC, 3);
}

bool8 sub_811E4D0(void)
{
    switch (sUnknown_0203A11C->unk9)
    {
    default:
        return FALSE;
    case 0:
        if (sUnknown_0203A11C->unk2EC->animEnded)
            sUnknown_0203A11C->unk9 = 1;
        break;
    case 1:
        sUnknown_0203A11C->unk2E8->pos2.x -= 8;
        if (sUnknown_0203A11C->unk2E8->pos2.x <= -64)
        {
            DestroySprite(sUnknown_0203A11C->unk2EC);
            DestroySprite(sUnknown_0203A11C->unk2E8);
            sUnknown_0203A11C->unk2EC = NULL;
            sUnknown_0203A11C->unk2E8 = NULL;
            sUnknown_0203A11C->unk9++;
            return FALSE;
        }
    }

    return TRUE;
}

void sub_811E55C(void)
{
    StartSpriteAnim(sUnknown_0203A11C->unk2EC, 4);
}

void sub_811E578(void)
{
    if (!sub_811BBB0())
        StartSpriteAnim(sUnknown_0203A11C->unk2EC, 1);
    else
        StartSpriteAnim(sUnknown_0203A11C->unk2EC, 2);
}

bool8 sub_811E5B8(void)
{
    return !sUnknown_0203A11C->unk2EC->animEnded;
}

void sub_811E5D4(void)
{
    u8 spriteId = CreateSprite(&sUnknown_08597E48, 96, 80, 0);
    if (spriteId != MAX_SPRITES)
        sUnknown_0203A11C->unk2F0 = &gSprites[spriteId];

    spriteId = CreateSprite(&sUnknown_08597E48, 96, 156, 0);
    if (spriteId != MAX_SPRITES)
    {
        sUnknown_0203A11C->unk2F4 = &gSprites[spriteId];
        sUnknown_0203A11C->unk2F4->vFlip = 1;
    }

    sub_811E6B0();
}

void sub_811E64C(void)
{
    sUnknown_0203A11C->unk2F0->invisible = !sub_811BBF8();
    sUnknown_0203A11C->unk2F4->invisible = !sub_811BC2C();
}

void sub_811E6B0(void)
{
    sUnknown_0203A11C->unk2F0->invisible = 1;
    sUnknown_0203A11C->unk2F4->invisible = 1;
}

void sub_811E6E0(int arg0)
{
    if (!arg0)
    {
        sUnknown_0203A11C->unk2F0->pos1.x = 96;
        sUnknown_0203A11C->unk2F4->pos1.x = 96;
    }
    else
    {
        sUnknown_0203A11C->unk2F0->pos1.x = 120;
        sUnknown_0203A11C->unk2F4->pos1.x = 120;
    }
}

void sub_811E720(void)
{
    u8 spriteId = CreateSprite(&sUnknown_08597E30, 220, 84, 1);
    if (spriteId != MAX_SPRITES)
        sUnknown_0203A11C->unk2F8 = &gSprites[spriteId];

    spriteId = CreateSprite(&sUnknown_08597E30, 220, 156, 1);
    if (spriteId != MAX_SPRITES)
    {
        sUnknown_0203A11C->unk2FC = &gSprites[spriteId];
        StartSpriteAnim(sUnknown_0203A11C->unk2FC, 1);
    }

    sub_811E7F8();
}

void sub_811E794(void)
{
    sUnknown_0203A11C->unk2F8->invisible = !sub_811BBF8();
    sUnknown_0203A11C->unk2FC->invisible = !sub_811BC2C();
}

void sub_811E7F8(void)
{
    sUnknown_0203A11C->unk2F8->invisible = 1;
    sUnknown_0203A11C->unk2FC->invisible = 1;
}

void sub_811E828(void)
{
    int graphicsId;
    u8 spriteId;

    switch (GetDisplayedPersonType())
    {
    case EASY_CHAT_PERSON_REPORTER_MALE:
        graphicsId = EVENT_OBJ_GFX_REPORTER_M;
        break;
    case EASY_CHAT_PERSON_REPORTER_FEMALE:
        graphicsId = EVENT_OBJ_GFX_REPORTER_F;
        break;
    case EASY_CHAT_PERSON_BOY:
        graphicsId = EVENT_OBJ_GFX_BOY_1;
        break;
    default:
        return;
    }

    if (GetEasyChatScreenFrameId() != 4)
        return;

    spriteId = AddPseudoEventObject(graphicsId, SpriteCallbackDummy, 76, 40, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = 0;
        StartSpriteAnim(&gSprites[spriteId], 2);
    }

    spriteId = AddPseudoEventObject(
        gSaveBlock2Ptr->playerGender == MALE ? EVENT_OBJ_GFX_RIVAL_BRENDAN_NORMAL : EVENT_OBJ_GFX_RIVAL_MAY_NORMAL,
        SpriteCallbackDummy,
        52,
        40,
        0);

    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = 0;
        StartSpriteAnim(&gSprites[spriteId], 3);
    }
}

int GetFooterIndex(void)
{
    u8 frameId = GetEasyChatScreenFrameId();
    switch (sPhraseFrameDimensions[frameId].footerId)
    {
    case 1:
        return 1;
    case 2:
        return 2;
    case 0:
        return 0;
    default:
        return 3;
    }
}

int GetFooterOptionXOffset(int option)
{
    int footerIndex = GetFooterIndex();
    if (footerIndex < 3)
        return sFooterOptionXOffsets[footerIndex][option] + 4;
    else
        return 0;
}

void sub_811E948(void)
{
    int i;
    u16 windowId;
    struct WindowTemplate template;
    int footerId = GetFooterIndex();
    if (footerId == 3)
        return;

    template.bg = 3;
    template.tilemapLeft = 1;
    template.tilemapTop = 11;
    template.width = 28;
    template.height = 2;
    template.paletteNum = 11;
    template.baseBlock = 0x34;
    windowId = AddWindow(&template);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    for (i = 0; i < 4; i++)
    {
        const u8 *str = sFooterTextOptions[footerId][i];
        if (str)
        {
            int x = sFooterOptionXOffsets[footerId][i];
            sub_811D028(windowId, 1, str, x, 1, 0, NULL);
        }
    }

    PutWindowTilemap(windowId);
}

bool8 sub_811EA28(u8 groupId)
{
    switch (groupId)
    {
    case EC_GROUP_TRENDY_SAYING:
        return FlagGet(FLAG_SYS_HIPSTER_MEET);
    case EC_GROUP_EVENTS:
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        return FlagGet(FLAG_SYS_GAME_CLEAR);
    case EC_GROUP_POKEMON_2:
        return sub_811F0F8();
    default:
        return TRUE;
    }
}

u16 EasyChat_GetNumWordsInGroup(u8 groupId)
{
    if (groupId == EC_GROUP_POKEMON)
        return GetNationalPokedexCount(FLAG_GET_SEEN);

    if (sub_811EA28(groupId))
        return gEasyChatGroups[groupId].numEnabledWords;

    return 0;
}

bool8 sub_811EAA4(u16 easyChatWord)
{
    u16 i;
    u8 groupId;
    u32 index;
    u16 numWords;
    const u16 *list;
    if (easyChatWord == 0xFFFF)
        return FALSE;

    groupId = EC_GROUP(easyChatWord);
    index = EC_INDEX(easyChatWord);
    if (groupId >= EC_NUM_GROUPS)
        return TRUE;

    numWords = gEasyChatGroups[groupId].numWords;
    switch (groupId)
    {
    case EC_GROUP_POKEMON:
    case EC_GROUP_POKEMON_2:
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        list = gEasyChatGroups[groupId].wordData.valueList;
        for (i = 0; i < numWords; i++)
        {
            if (index == list[i])
                return FALSE;
        }
        return TRUE;
    default:
        if (index >= numWords)
            return TRUE;
        else
            return FALSE;
    }
}

bool8 ECWord_CheckIfOutsideOfValidRange(u16 easyChatWord)
{
    int numWordsInGroup;
    u8 groupId = EC_GROUP(easyChatWord);
    u32 index = EC_INDEX(easyChatWord);
    if (groupId >= EC_NUM_GROUPS)
        return TRUE;

    switch (groupId)
    {
    case EC_GROUP_POKEMON:
    case EC_GROUP_POKEMON_2:
        numWordsInGroup = gNumSpeciesNames;
        break;
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        numWordsInGroup = gUnknown_085FA1D4;
        break;
    default:
        numWordsInGroup = gEasyChatGroups[groupId].numWords;
        break;
    }

    if (numWordsInGroup <= index)
        return TRUE;
    else
        return FALSE;
}

const u8 *GetEasyChatWord(u8 groupId, u16 index)
{
    switch (groupId)
    {
    case EC_GROUP_POKEMON:
    case EC_GROUP_POKEMON_2:
        return gSpeciesNames[index];
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        return gMoveNames[index];
    default:
        return gEasyChatGroups[groupId].wordData.words[index].text;
    }
}

u8 *CopyEasyChatWord(u8 *dest, u16 easyChatWord)
{
    u8 *resultStr;
    if (sub_811EAA4(easyChatWord))
    {
        resultStr = StringCopy(dest, gText_ThreeQuestionMarks);
    }
    else if (easyChatWord != 0xFFFF)
    {
        u16 index = EC_INDEX(easyChatWord);
        u8 groupId = EC_GROUP(easyChatWord);
        resultStr = StringCopy(dest, GetEasyChatWord(groupId, index));
    }
    else
    {
        *dest = EOS;
        resultStr = dest;
    }

    return resultStr;
}

u8 *ConvertEasyChatWordsToString(u8 *dest, const u16 *src, u16 columns, u16 rows)
{
    u16 i, j;
    u16 numColumns = columns - 1;

    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < numColumns; j++)
        {
            dest = CopyEasyChatWord(dest, *src);
            if (*src != 0xFFFF)
            {
                *dest = CHAR_SPACE;
                dest++;
            }

            src++;
        }

        dest = CopyEasyChatWord(dest, *(src++));
        *dest = CHAR_NEWLINE;
        dest++;
    }

    dest--;
    *dest = EOS;
    return dest;
}

u8 *unref_sub_811EC98(u8 *dest, const u16 *src, u16 columns, u16 rows)
{
    u16 i, j, k;
    u16 numColumns;
    int var0, var1;

    numColumns = columns;
    var1 = 0;
    columns--;
    for (i = 0; i < rows; i++)
    {
        const u16 *var2 = src;
        var0 = 0;
        for (j = 0; j < numColumns; j++)
        {
            if (var2[j] != 0xFFFF)
                var0 = 1;
        }

        if (!var0)
        {
            src += numColumns;
            continue;
        }

        for (k = 0; k < columns; k++)
        {
            dest = CopyEasyChatWord(dest, *src);
            if (*src != 0xFFFF)
            {
                *dest = CHAR_SPACE;
                dest++;
            }

            src++;
        }

        dest = CopyEasyChatWord(dest, *(src++));
        if (var1 == 0)
            *dest = CHAR_NEWLINE;
        else
            *dest = CHAR_PROMPT_SCROLL;

        dest++;
        var1++;
    }

    dest--;
    *dest = EOS;
    return dest;
}

u16 GetEasyChatWordStringLength(u16 easyChatWord)
{
    if (easyChatWord == 0xFFFF)
        return 0;

    if (sub_811EAA4(easyChatWord))
    {
        return StringLength(gText_ThreeQuestionMarks);
    }
    else
    {
        u16 index = EC_INDEX(easyChatWord);
        u8 groupId = EC_GROUP(easyChatWord);
        return StringLength(GetEasyChatWord(groupId, index));
    }
}

bool8 sub_811EDC4(const u16 *easyChatWords, u8 arg1, u8 arg2, u16 arg3)
{
    u8 i, j;

    for (i = 0; i < arg2; i++)
    {
        u16 totalLength = arg1 - 1;
        for (j = 0; j < arg1; j++)
            totalLength += GetEasyChatWordStringLength(*(easyChatWords++));

        if (totalLength > arg3)
            return TRUE;
    }

    return FALSE;
}

u16 sub_811EE38(u16 groupId)
{
    u16 index = Random() % gEasyChatGroups[groupId].numWords;
    if (groupId == EC_GROUP_POKEMON
     || groupId == EC_GROUP_POKEMON_2
     || groupId == EC_GROUP_MOVE_1
     || groupId == EC_GROUP_MOVE_2)
    {
        index = gEasyChatGroups[groupId].wordData.valueList[index];
    }

    return EC_WORD(groupId, index);
}

u16 sub_811EE90(u16 groupId)
{
    if (!sub_811EA28(groupId))
        return 0xFFFF;

    if (groupId == EC_GROUP_POKEMON)
        return sub_811F108();

    return sub_811EE38(groupId);
}

void sub_811EECC(void)
{
    u16 *easyChatWords;
    int columns, rows;
    switch (gSpecialVar_0x8004)
    {
    case 0:
        easyChatWords = gSaveBlock1Ptr->easyChatProfile;
        columns = 2;
        rows = 2;
        break;
    case 1:
        easyChatWords = gSaveBlock1Ptr->easyChatBattleStart;
        if (sub_811EDC4(gSaveBlock1Ptr->easyChatBattleStart, 3, 2, 18))
        {
            columns = 2;
            rows = 3;
        }
        else
        {
            columns = 3;
            rows = 2;
        }
        break;
    case 2:
        easyChatWords = gSaveBlock1Ptr->easyChatBattleWon;
        columns = 3;
        rows = 2;
        break;
    case 3:
        easyChatWords = gSaveBlock1Ptr->easyChatBattleLost;
        columns = 3;
        rows = 2;
        break;
    default:
        return;
    }

    ConvertEasyChatWordsToString(gStringVar4, easyChatWords, columns, rows);
    ShowFieldAutoScrollMessage(gStringVar4);
}

void sub_811EF6C(void)
{
    int groupId = Random() & 1 ? EC_GROUP_HOBBIES : EC_GROUP_LIFESTYLE;
    u16 easyChatWord = sub_811EE90(groupId);
    CopyEasyChatWord(gStringVar2, easyChatWord);
}

bool8 sub_811EF98(u8 additionalPhraseId)
{
    int byteOffset = additionalPhraseId / 8;
    int shift = additionalPhraseId % 8;
    return (gSaveBlock1Ptr->additionalPhrases[byteOffset] >> shift) & 1;
}

void sub_811EFC0(u8 additionalPhraseId)
{
    if (additionalPhraseId < 33)
    {
        int byteOffset = additionalPhraseId / 8;
        int shift = additionalPhraseId % 8;
        gSaveBlock1Ptr->additionalPhrases[byteOffset] |= 1 << shift;
    }
}

u8 sub_811EFF0(void)
{
    u8 i;
    u8 numAdditionalPhrasesUnlocked;

    for (i = 0, numAdditionalPhrasesUnlocked = 0; i < 33; i++)
    {
        if (sub_811EF98(i))
            numAdditionalPhrasesUnlocked++;
    }

    return numAdditionalPhrasesUnlocked;
}

u16 sub_811F01C(void)
{
    u16 i;
    u16 additionalPhraseId;
    u8 numAdditionalPhrasesUnlocked = sub_811EFF0();
    if (numAdditionalPhrasesUnlocked == 33)
        return 0xFFFF;

    additionalPhraseId = Random() % (33 - numAdditionalPhrasesUnlocked);
    for (i = 0; i < 33; i++)
    {
        if (!sub_811EF98(i))
        {
            if (additionalPhraseId)
            {
                additionalPhraseId--;
            }
            else
            {
                sub_811EFC0(i);
                return EC_WORD(EC_GROUP_TRENDY_SAYING, i);
            }
        }
    }

    return 0xFFFF;
}

u16 sub_811F090(void)
{
    u16 i;
    u16 additionalPhraseId = sub_811EFF0();
    if (additionalPhraseId == 0)
        return 0xFFFF;

    additionalPhraseId = Random() % additionalPhraseId;
    for (i = 0; i < 33; i++)
    {
        if (sub_811EF98(i))
        {
            if (additionalPhraseId)
                additionalPhraseId--;
            else
                return EC_WORD(EC_GROUP_TRENDY_SAYING, i);
        }
    }

    return 0xFFFF;
}

bool8 sub_811F0F8(void)
{
    return IsNationalPokedexEnabled();
}

u16 sub_811F108(void)
{
    u16 i;
    u16 numWords;
    const u16 *species;
    u16 index = EasyChat_GetNumWordsInGroup(EC_GROUP_POKEMON);
    if (index == 0)
        return 0xFFFF;

    index = Random() % index;
    species = gEasyChatGroups[EC_GROUP_POKEMON].wordData.valueList;
    numWords = gEasyChatGroups[EC_GROUP_POKEMON].numWords;
    for (i = 0; i < numWords; i++)
    {
        u16 dexNum = SpeciesToNationalPokedexNum(*species);
        if (GetSetPokedexFlag(dexNum, FLAG_GET_SEEN))
        {
            if (index)
                index--;
            else
                return EC_WORD(EC_GROUP_POKEMON, *species);
        }

        species++;
    }

    return 0xFFFF;
}

void InitEasyChatPhrases(void)
{
    u16 i, j;

    for (i = 0; i < 4; i++)
        gSaveBlock1Ptr->easyChatProfile[i] = sDefaultProfileWords[i];
    
    for (i = 0; i < 6; i++)
        gSaveBlock1Ptr->easyChatBattleStart[i] = sDefaultBattleStartWords[i];
    
    for (i = 0; i < 6; i++)
        gSaveBlock1Ptr->easyChatBattleWon[i] = sUnknown_0859E640[i];
    
    for (i = 0; i < 6; i++)
        gSaveBlock1Ptr->easyChatBattleLost[i] = sUnknown_0859E64C[i];
    
    for (i = 0; i < MAIL_COUNT; i++)
    {
        for (j = 0; j < MAIL_WORDS_COUNT; j++)
            gSaveBlock1Ptr->mail[i].words[j] = 0xFFFF;
    }

    // BUG: This is supposed to clear 64 bits, but this loop is clearing 64 bytes.
    // However, this bug has no resulting effect on gameplay because only the
    // Mauville old man data is corrupted, which is initialized directly after
    // this function is called when starting a new game.
    for (i = 0; i < 64; i++)
        gSaveBlock1Ptr->additionalPhrases[i] = 0;
}

bool8 sub_811F28C(void)
{
    sUnknown_0203A120 = Alloc(sizeof(*sUnknown_0203A120));
    if (!sUnknown_0203A120)
        return FALSE;

    sub_811F2D4();
    sub_811F46C();
    return TRUE;
}

void sub_811F2B8(void)
{
    if (sUnknown_0203A120)
        FREE_AND_SET_NULL(sUnknown_0203A120);
}

void sub_811F2D4(void)
{
    int i;

    sUnknown_0203A120->unk0 = 0;
    if (GetNationalPokedexCount(FLAG_GET_SEEN))
        sUnknown_0203A120->unk2[sUnknown_0203A120->unk0++] = EC_GROUP_POKEMON;
    
    for (i = EC_GROUP_TRAINER; i <= EC_GROUP_ADJECTIVES; i++)
        sUnknown_0203A120->unk2[sUnknown_0203A120->unk0++] = i;
    
    if (FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        sUnknown_0203A120->unk2[sUnknown_0203A120->unk0++] = EC_GROUP_EVENTS;
        sUnknown_0203A120->unk2[sUnknown_0203A120->unk0++] = EC_GROUP_MOVE_1;
        sUnknown_0203A120->unk2[sUnknown_0203A120->unk0++] = EC_GROUP_MOVE_2;
    }

    if (FlagGet(FLAG_SYS_HIPSTER_MEET))
        sUnknown_0203A120->unk2[sUnknown_0203A120->unk0++] = EC_GROUP_TRENDY_SAYING;

    if (IsNationalPokedexEnabled())
        sUnknown_0203A120->unk2[sUnknown_0203A120->unk0++] = EC_GROUP_POKEMON_2;
}

u8 sub_811F3AC(void)
{
    return sUnknown_0203A120->unk0;
}

u8 sub_811F3B8(u8 index)
{
    if (index >= sUnknown_0203A120->unk0)
        return EC_NUM_GROUPS;
    else
        return sUnknown_0203A120->unk2[index];
}

u8 *unref_sub_811F3E0(u8 *dest, u8 groupId, u16 totalChars)
{
    u16 i;
    u8 *str = StringCopy(dest, gEasyChatGroupNamePointers[groupId]);
    for (i = str - dest; i < totalChars; i++)
    {
        *str = CHAR_SPACE;
        str++;
    }
    
    *str = EOS;
    return str;
}

const u8 *GetEasyChatWordGroupName(u8 groupId)
{
    return gEasyChatGroupNamePointers[groupId];
}

u8 *CopyEasyChatWordPadded(u8 *dest, u16 easyChatWord, u16 totalChars)
{
    u16 i;
    u8 *str = CopyEasyChatWord(dest, easyChatWord);
    for (i = str - dest; i < totalChars; i++)
    {
        *str = CHAR_SPACE;
        str++;
    }
    
    *str = EOS;
    return str;
}

void sub_811F46C(void)
{
    int i, j, k;
    int numWords;
    const u16 *words;
    u16 numToProcess;
    int index;

    for (i = 0; i < 27; i++)
    {
        numWords = gEasyChatWordsByLetterPointers[i].numWords;
        words = gEasyChatWordsByLetterPointers[i].words;
        sUnknown_0203A120->unk2E[i] = 0;
        index = 0;
        for (j = 0; j < numWords; j++)
        {
            if (*words == 0xFFFF)
            {
                words++;
                numToProcess = *words;
                words++;
                j += 1 + numToProcess;
            }
            else
            {
                numToProcess = 1;
            }

            for (k = 0; k < numToProcess; k++)
            {
                if (sub_811F860(words[k]))
                {
                    sUnknown_0203A120->unk64[i][index++] = words[k];
                    sUnknown_0203A120->unk2E[i]++;
                    break;
                }
            }

            words += numToProcess;
        }
    }
}

void sub_811F548(int arg0, u16 groupId)
{
    if (!arg0)
        sUnknown_0203A120->unk3BA0 = sub_811F5C4(groupId);
    else
        sUnknown_0203A120->unk3BA0 = sub_811F6B8(groupId);
}

u16 sub_811F578(u16 arg0)
{
    if (arg0 >= sUnknown_0203A120->unk3BA0)
        return 0xFFFF;
    else
        return sUnknown_0203A120->unk3984[arg0];
}

u16 sub_811F5B0(void)
{
    return sUnknown_0203A120->unk3BA0;
}

u16 sub_811F5C4(u16 groupId)
{
    u32 i;
    int totalWords;
    const u16 *list;
    const struct EasyChatWordInfo *wordInfo;
    u16 numWords = gEasyChatGroups[groupId].numWords;

    if (groupId == EC_GROUP_POKEMON || groupId == EC_GROUP_POKEMON_2
     || groupId == EC_GROUP_MOVE_1  || groupId == EC_GROUP_MOVE_2)
    {
        list = gEasyChatGroups[groupId].wordData.valueList;
        for (i = 0, totalWords = 0; i < numWords; i++)
        {
            if (sub_811F764(list[i], groupId))
                sUnknown_0203A120->unk3984[totalWords++] = EC_WORD(groupId, list[i]);
        }

        return totalWords;
    }
    else
    {
        wordInfo = gEasyChatGroups[groupId].wordData.words;
        for (i = 0, totalWords = 0; i < numWords; i++)
        {
            u16 alphabeticalOrder = wordInfo[i].alphabeticalOrder;
            if (sub_811F764(alphabeticalOrder, groupId))
                sUnknown_0203A120->unk3984[totalWords++] = EC_WORD(groupId, alphabeticalOrder);
        }

        return totalWords;
    }
}

u16 sub_811F6B8(u16 alphabeticalGroup)
{
    u16 i;
    u16 totalWords;

    for (i = 0, totalWords = 0; i < sUnknown_0203A120->unk2E[alphabeticalGroup]; i++)
        sUnknown_0203A120->unk3984[totalWords++] = sUnknown_0203A120->unk64[alphabeticalGroup][i];

    return totalWords;
}

bool8 sub_811F72C(u8 arg0)
{
    int i;
    for (i = 0; i < sUnknown_0203A120->unk0; i++)
    {
        if (sUnknown_0203A120->unk2[i] == arg0)
            return TRUE;
    }

    return FALSE;
}

bool8 sub_811F764(u16 wordIndex, u8 groupId)
{
    switch (groupId)
    {
    case EC_GROUP_POKEMON:
        return GetSetPokedexFlag(SpeciesToNationalPokedexNum(wordIndex), FLAG_GET_SEEN);
    case EC_GROUP_POKEMON_2:
        if (sub_811F838(wordIndex))
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(wordIndex), FLAG_GET_SEEN);
        return TRUE;
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        return TRUE;
    case EC_GROUP_TRENDY_SAYING:
        return sub_811EF98(wordIndex);
    default:
        return gEasyChatGroups[groupId].wordData.words[wordIndex].enabled;
    }
}

int sub_811F838(u16 species)
{
    u32 i;
    for (i = 0; i < ARRAY_COUNT(sUnknown_0859E658); i++)
    {
        if (sUnknown_0859E658[i] == species)
            return TRUE;
    }

    return FALSE;
}

u8 sub_811F860(u16 easyChatWord)
{
    u8 groupId = EC_GROUP(easyChatWord);
    u32 index = EC_INDEX(easyChatWord);
    if (!sub_811F72C(groupId))
        return FALSE;
    else
        return sub_811F764(index, groupId);
}

void InitializeEasyChatWordArray(u16 *words, u16 length)
{
    u16 i;
    for (i = length - 1; i != 0xFFFF; i--)
        *(words++) = 0xFFFF;
}

void sub_811F8BC(void)
{
    int i;
    u16 *words = sub_801B058();
    for (i = 0; i < 4; i++)
        words[i] = 0xFFFF;
}

bool32 sub_811F8D8(int easyChatWord)
{
    int groupId = EC_GROUP(easyChatWord);
    int mask = 0x7F;
    int index = EC_INDEX(easyChatWord);
    if (!sub_811EA28(groupId & mask))
        return FALSE;
    else
        return sub_811F764(index, groupId & mask);
}
*/
