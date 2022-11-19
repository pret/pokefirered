#include "global.h"
#include "gflib.h"
#include "easy_chat.h"
#include "event_data.h"
#include "menu.h"
#include "mystery_gift.h"
#include "overworld.h"
#include "strings.h"
#include "task.h"
#include "constants/songs.h"

#define EZCHAT_TASK_STATE        0
#define EZCHAT_TASK_TYPE         1
#define EZCHAT_TASK_WORDS        2
#define EZCHAT_TASK_MAINCALLBACK 4
#define EZCHAT_TASK_UNK06        6
#define EZCHAT_TASK_SIZE         7

struct EasyChatScreenTemplate
{
    u8 type;
    u8 numColumns;
    u8 numRows;
    u8 frameId;
    const u8 *titleText;
    const u8 *instructionsText1;
    const u8 *instructionsText2;
    const u8 *confirmText1;
    const u8 *confirmText2;
};

struct EasyChatScreen
{
    /*0x00*/ u8 type;
    /*0x01*/ u8 templateId;
    /*0x02*/ u8 numColumns;
    /*0x03*/ u8 numRows;
    /*0x04*/ u8 state;
    /*0x05*/ s8 mainCursorColumn;
    /*0x06*/ s8 mainCursorRow;
    /*0x07*/ u8 numWords;
    /*0x08*/ u8 stateBackup;
    /*0x09*/ bool8 isAlphaMode;
    /*0x0A*/ s8 selectGroupCursorX;
    /*0x0B*/ s8 selectGroupCursorY;
    /*0x0C*/ u8 selectGroupRowsAbove;
    /*0x0D*/ u8 selectGroupNumRows;
    /*0x0E*/ u8 selectWordRowsAbove;
    /*0x0F*/ u8 selectWordNumRows;
    /*0x10*/ s8 selectWordCursorX;
    /*0x11*/ s8 selectWordCursorY;
    /*0x14*/ u16 *words;
    /*0x18*/ u16 ecWordBuffer[9];
};

static EWRAM_DATA struct EasyChatScreen * sEasyChatScreen = NULL;

static void CB2_EasyChatScreen(void);
static void Task_InitEasyChat(u8 taskId);
static void Task_RunEasyChat(u8 taskId);
static bool8 Task_InitEasyChatInternal(u8 taskId);
static void DismantleEasyChat(MainCallback cb);
static void CompareProfileResponseWithPassphrase(void);
static void CompareQuestionnaireResponseWithPassphrase(void);
static bool8 EasyChat_AllocateResources(u8 type, u16 *words);
static void EasyChat_FreeResources(void);
static u16 EasyChatScreen_HandleJoypad(void);
static u16 HandleJoypad_SelectField(void);
static u16 HandleJoypad_SelectFooter(void);
static u16 HandleJoypad_SelectGroup(void);
static u16 HandleJoypad_SelectWord(void);
static u16 Cancel_HandleYesNoMenu(void);
static u16 Confirm_HandleYesNoMenu(void);
static u16 DelAll_HandleYesNoMenu(void);
static u16 Cancel_CreateYesNoMenu(void);
static u16 DelAll_CreateYesNoMenu(void);
static u16 Confirm_CreateYesNoMenu(void);
static u8 GetStateBackup(void);
static int OpenSelectedGroup(void);
static int BackOutFromGroupToFieldSelect(void);
static int ToggleGroupAlphaMode(void);
static int DeleteSelectedWord(void);
static int PlaceSelectedWord(void);
static void CommitECWords(void);
static void DeleteAllECFields(void);
static void SetEasyChatWordToField(u16 word);
static bool8 HasECMessageChanged(void);
static u16 SelectGroupCursorAction(u32 action);
static int UpdateSelectGroupCursorPos_OutsideBlueBox_GroupMode(u32 action);
static int UpdateSelectGroupCursorPos_OutsideBlueBox_AlphaMode(u32 action);
static int UpdateSelectGroupCursorPos_InsideBlueBox(u32 action);
static void GroupCursorMoveToBlueBox(void);
static void GroupCursorWrapAroundLeft(void);
static u16 SelectWordCursorAction(u32 action);
static u16 GetSelectedFieldIndex(void);
static u16 GetSelectedGroupIndex(void);
static int GetSelectedLetter(void);
static u16 GetSelectWordCursorPos(void);
static u8 GetMaxGroupCursorXinAlphaMode(u8 unkB);
static void MoveGroupCursorXToMaxCol(void);
static void MoveWordCursorXToMaxCol(void);
static bool8 GroupSelectCursorXPosTooFarRight(void);
static bool8 WordSelectCursorXPosTooFarRight(void);
static bool8 IsPhraseDifferentThanPlayerInput(const u16 *wordsToCompare, u8 numWords);
static u8 GetEasyChatScreenTemplateId(u8 type);
static bool32 IsEcWordBufferUninitialized(void);

void DoEasyChatScreen(u8 type, u16 *words, MainCallback callback)
{
    u8 taskId;
    ResetTasks();
    taskId = CreateTask(Task_InitEasyChat, 0);
    gTasks[taskId].data[EZCHAT_TASK_TYPE] = type;
    SetWordTaskArg(taskId, EZCHAT_TASK_WORDS, (uintptr_t)words);
    SetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK, (uintptr_t)callback);
    SetMainCallback2(CB2_EasyChatScreen);
}

static void CB2_EasyChatScreen(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCallback_EasyChatScreen(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void SetEasyChatTaskFunc(u8 taskId, TaskFunc func)
{
    gTasks[taskId].func = func;
    gTasks[taskId].data[EZCHAT_TASK_STATE] = 0;
}

static void Task_InitEasyChat(u8 taskId)
{
    if (!IsUpdateLinkStateCBActive())
    {
        while (Task_InitEasyChatInternal(taskId))
            ;
    }
    else
    {
        if (Task_InitEasyChatInternal(taskId) == TRUE)
            return;
    }
    SetEasyChatTaskFunc(taskId, Task_RunEasyChat);
}

static void Task_RunEasyChat(u8 taskId)
{
    u16 action;
    s16 *data;

    data = gTasks[taskId].data;
    switch (data[EZCHAT_TASK_STATE])
    {
    case 0:
        SetVBlankCallback(VBlankCallback_EasyChatScreen);
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, -1, 16, 0, RGB_BLACK);
        data[EZCHAT_TASK_STATE]++;
        break;
    case 1:
        action = EasyChatScreen_HandleJoypad();
        if (action == 23)
        {
            BeginNormalPaletteFade(PALETTES_ALL, -1, 0, 16, RGB_BLACK);
            data[EZCHAT_TASK_STATE] = 3;
        }
        else if (action != 0)
        {
            PlaySE(SE_SELECT);
            EasyChatInterfaceCommand_Setup(action);
            data[EZCHAT_TASK_STATE]++;
        }
        break;
    case 2:
        if (!EasyChatInterfaceCommand_Run())
            data[EZCHAT_TASK_STATE] = 1;
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            if (data[EZCHAT_TASK_TYPE] == EASY_CHAT_TYPE_QUESTIONNAIRE)
                CompareQuestionnaireResponseWithPassphrase();
            if (data[EZCHAT_TASK_TYPE] == EASY_CHAT_TYPE_PROFILE)
            {
                FlagSet(FLAG_SYS_SET_TRAINER_CARD_PROFILE);
                CompareProfileResponseWithPassphrase();
            }
            DismantleEasyChat((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    }
}

static bool8 Task_InitEasyChatInternal(u8 taskId)
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
        if (!InitEasyChatSelection())
        {
            DismantleEasyChat((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 2:
        if (!EasyChat_AllocateResources(data[EZCHAT_TASK_TYPE], (u16 *)GetWordTaskArg(taskId, EZCHAT_TASK_WORDS)))
        {
            DismantleEasyChat((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 3:
        if (!InitEasyChatGraphicsWork())
        {
            DismantleEasyChat((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 4:
        if (LoadEasyChatGraphics())
        {
            return TRUE;
        }
        break;
    default:
        return FALSE;
    }
    data[EZCHAT_TASK_STATE]++;
    return TRUE;
}

static void DismantleEasyChat(MainCallback callback)
{
    DestroyEasyChatSelectionData();
    EasyChat_FreeResources();
    DestroyEasyChatGraphicsResources();
    FreeAllWindowBuffers();
    SetMainCallback2(callback);
}

void ShowEasyChatScreen(void)
{
    u16 *words;
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
    case EASY_CHAT_TYPE_QUESTIONNAIRE:
        words = GetQuestionnaireWordsPtr();
        break;
    case EASY_CHAT_TYPE_MAIL:
        words = gSaveBlock1Ptr->mail[gSpecialVar_0x8005].words;
        break;
    default:
        return;
    }
    DoEasyChatScreen(gSpecialVar_0x8004, words, CB2_ReturnToFieldContinueScript);
}

static const u16 sECPhrase_MysteryEventIsExciting[] = {
    EC_WORD_MYSTERY,
    EC_WORD_EVENT,
    EC_WORD_IS,
    EC_WORD_EXCITING
};

static void CompareProfileResponseWithPassphrase(void)
{
    gSpecialVar_0x8004 = IsPhraseDifferentThanPlayerInput(sECPhrase_MysteryEventIsExciting, NELEMS(sECPhrase_MysteryEventIsExciting));
}

static const u16 sECPhrase_LinkTogetherWithAll[] = {
    EC_WORD_LINK,
    EC_WORD_TOGETHER,
    EC_WORD_WITH,
    EC_WORD_ALL
};

static void CompareQuestionnaireResponseWithPassphrase(void)
{
    gSpecialVar_0x8004 = IsPhraseDifferentThanPlayerInput(sECPhrase_LinkTogetherWithAll, NELEMS(sECPhrase_LinkTogetherWithAll));
}

static const struct EasyChatScreenTemplate sEasyChatScreenTemplates[] = {
    {
        .type = EASY_CHAT_TYPE_PROFILE,
        .numColumns = 2,
        .numRows = 2,
        .frameId = 0,
        .titleText =  gText_Profile,
        .instructionsText1 = gText_CombineFourWordsOrPhrases,
        .instructionsText2 = gText_AndMakeYourProfile,
        .confirmText1 = gText_YourProfile,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_BATTLE_START,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gText_AtTheBattlesStart,
        .instructionsText1 = gText_MakeMessageSixPhrases,
        .instructionsText2 = gText_MaxTwoTwelveLetterPhrases,
        .confirmText1 = gText_YourFeelingAtTheBattlesStart,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_BATTLE_WON,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gText_UponWinningABattle,
        .instructionsText1 = gText_MakeMessageSixPhrases,
        .instructionsText2 = gText_MaxTwoTwelveLetterPhrases,
        .confirmText1 = gText_WhatYouSayIfYouWin,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_BATTLE_LOST,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gText_UponLosingABattle,
        .instructionsText1 = gText_MakeMessageSixPhrases,
        .instructionsText2 = gText_MaxTwoTwelveLetterPhrases,
        .confirmText1 = gText_WhatYouSayIfYouLose,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_MAIL,
        .numColumns = 2,
        .numRows = 5,
        .frameId = 2,
        .titleText =  NULL,
        .instructionsText1 = gText_CombineNineWordsOrPhrases,
        .instructionsText2 = gText_AndMakeAMessage,
        .confirmText1 = gText_TheMailMessage,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_MAIL_NO_CONFIRM,
        .numColumns = 2,
        .numRows = 2,
        .frameId = 0,
        .instructionsText1 = gText_CombineNineWordsOrPhrases,
        .instructionsText2 = gText_AndMakeAMessage,
    }, {
        .type = EASY_CHAT_TYPE_BARD_SONG,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gText_TheBardsSong,
        .instructionsText1 = gText_ChangeJustOneWordOrPhrase,
        .instructionsText2 = gText_AndImproveTheBardsSong,
        .confirmText1 = gText_TheNewSong,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_INTERVIEW,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gText_Interview,
        .instructionsText1 = gText_FindWordsThatDescribeYour,
        .instructionsText2 = gText_FeelingsRightNow,
        .confirmText1 = gText_TheAnswer,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_TRENDY_PHRASE,
        .numColumns = 2,
        .numRows = 1,
        .frameId = 3,
        .titleText =  gText_WhatsHipAndHappening,
        .instructionsText1 = gText_CombineTwoWordsOrPhrases,
        .instructionsText2 = gText_AndMakeATrendySaying,
        .confirmText1 = gText_TheTrendySaying,
        .confirmText2 = gText_IsAsShownOkay
    }, {
        .type = EASY_CHAT_TYPE_QUESTIONNAIRE,
        .numColumns = 2,
        .numRows = 2,
        .frameId = 0,
        .titleText =  gText_Questionnaire,
        .instructionsText1 = gText_CombineFourWordsOrPhrases,
        .instructionsText2 = gText_AndFillOutTheQuestionnaire,
        .confirmText1 = gText_TheAnswer,
        .confirmText2 = gText_IsAsShownOkay
    }
};

static bool8 EasyChat_AllocateResources(u8 type, u16 *words)
{
    u8 templateId;
    int i;

    sEasyChatScreen = malloc(sizeof(*sEasyChatScreen));
    if (sEasyChatScreen == NULL)
        return FALSE;

    sEasyChatScreen->type = type;
    sEasyChatScreen->words = words;
    sEasyChatScreen->state = 0;
    sEasyChatScreen->mainCursorColumn = 0;
    sEasyChatScreen->mainCursorRow = 0;
    sEasyChatScreen->isAlphaMode = FALSE;
    templateId = GetEasyChatScreenTemplateId(type);

    sEasyChatScreen->numColumns = sEasyChatScreenTemplates[templateId].numColumns;
    sEasyChatScreen->numRows = sEasyChatScreenTemplates[templateId].numRows;
    sEasyChatScreen->numWords = sEasyChatScreen->numColumns * sEasyChatScreen->numRows;
    sEasyChatScreen->templateId = templateId;
    if (sEasyChatScreen->numWords > 9)
        sEasyChatScreen->numWords = 9;

    CpuCopy16(words, sEasyChatScreen->ecWordBuffer, sEasyChatScreen->numWords * sizeof(u16));
    sEasyChatScreen->selectGroupNumRows = (GetNumDisplayableGroups() - 1) / 2 + 1;
    return TRUE;
}

static void EasyChat_FreeResources(void)
{
    if (sEasyChatScreen != NULL)
        Free(sEasyChatScreen);
}

static u16 EasyChatScreen_HandleJoypad(void)
{
    switch (sEasyChatScreen->state)
    {
    case 0:
        return HandleJoypad_SelectField();
    case 1:
        return HandleJoypad_SelectFooter();
    case 2:
        return HandleJoypad_SelectGroup();
    case 3:
        return HandleJoypad_SelectWord();
    case 4:
        return Cancel_HandleYesNoMenu();
    case 5:
        return DelAll_HandleYesNoMenu();
    case 6:
        return Confirm_HandleYesNoMenu();
    }
    return 0;
}

static u16 HandleJoypad_SelectField(void)
{
    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            sEasyChatScreen->state = 2;
            sEasyChatScreen->selectGroupCursorX = 0;
            sEasyChatScreen->selectGroupCursorY = 0;
            sEasyChatScreen->selectGroupRowsAbove = 0;
            return 9;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            return Cancel_CreateYesNoMenu();
        }
        else if (JOY_NEW(START_BUTTON))
        {
            return Confirm_CreateYesNoMenu();
        }
        else if (JOY_NEW(DPAD_UP))
        {
            sEasyChatScreen->mainCursorRow--;
            break;
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            sEasyChatScreen->mainCursorColumn--;
            break;
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            sEasyChatScreen->mainCursorRow++;
            break;
        }
        else if (JOY_NEW(DPAD_RIGHT))
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

    if (GetEasyChatScreenFrameId() == 2 && sEasyChatScreen->mainCursorColumn == 1 && sEasyChatScreen->mainCursorRow == 4)
        sEasyChatScreen->mainCursorColumn = 0;

    return 2;
}

static u16 HandleJoypad_SelectFooter(void)
{
    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            switch (sEasyChatScreen->mainCursorColumn)
            {
            case 0:
                return DelAll_CreateYesNoMenu();
            case 1:
                return Cancel_CreateYesNoMenu();
            case 2:
                return Confirm_CreateYesNoMenu();
            }
        }

        if (JOY_NEW(B_BUTTON))
        {
            return Cancel_CreateYesNoMenu();
        }
        else if (JOY_NEW(START_BUTTON))
        {
            return Confirm_CreateYesNoMenu();
        }
        else if (JOY_NEW(DPAD_UP))
        {
            sEasyChatScreen->mainCursorRow--;
            break;
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            sEasyChatScreen->mainCursorColumn--;
            break;
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            sEasyChatScreen->mainCursorRow = 0;
            break;
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            sEasyChatScreen->mainCursorColumn++;
            break;
        }

        return 0;
    } while (0);

    if (sEasyChatScreen->mainCursorRow == sEasyChatScreenTemplates[sEasyChatScreen->templateId].numRows)
    {
        if (sEasyChatScreen->mainCursorColumn < 0)
            sEasyChatScreen->mainCursorColumn = 2;

        if (sEasyChatScreen->mainCursorColumn >= 3)
            sEasyChatScreen->mainCursorColumn = 0;

        return 3;
    }

    if (sEasyChatScreen->mainCursorColumn >= sEasyChatScreenTemplates[sEasyChatScreen->templateId].numColumns)
        sEasyChatScreen->mainCursorColumn = sEasyChatScreenTemplates[sEasyChatScreen->templateId].numColumns - 1;

    if (GetEasyChatScreenFrameId() == 2 && sEasyChatScreen->mainCursorColumn == 1 && sEasyChatScreen->mainCursorRow == 4)
        sEasyChatScreen->mainCursorColumn = 0;

    sEasyChatScreen->state = 0;
    return 2;
}

static u16 HandleJoypad_SelectGroup(void)
{
    if (JOY_NEW(B_BUTTON))
        return BackOutFromGroupToFieldSelect();

    if (JOY_NEW(A_BUTTON))
    {
        if (sEasyChatScreen->selectGroupCursorX != -1)
            return OpenSelectedGroup();

        switch (sEasyChatScreen->selectGroupCursorY)
        {
        case 0:
            return ToggleGroupAlphaMode();
        case 1:
            return DeleteSelectedWord();
        case 2:
            return BackOutFromGroupToFieldSelect();
        }
    }

    if (JOY_NEW(SELECT_BUTTON))
        return ToggleGroupAlphaMode();

    if (JOY_REPT(DPAD_UP))
        return SelectGroupCursorAction(2);

    if (JOY_REPT(DPAD_DOWN))
        return SelectGroupCursorAction(3);

    if (JOY_REPT(DPAD_LEFT))
        return SelectGroupCursorAction(1);

    if (JOY_REPT(DPAD_RIGHT))
        return SelectGroupCursorAction(0);

    return 0;
}

static u16 HandleJoypad_SelectWord(void)
{
    if (JOY_NEW(B_BUTTON))
    {
        sEasyChatScreen->state = 2;
        return 13;
    }

    if (JOY_NEW(A_BUTTON))
        return PlaceSelectedWord();

    if (JOY_NEW(START_BUTTON))
        return SelectWordCursorAction(4);

    if (JOY_NEW(SELECT_BUTTON))
        return SelectWordCursorAction(5);

    if (JOY_REPT(DPAD_UP))
        return SelectWordCursorAction(2);

    if (JOY_REPT(DPAD_DOWN))
        return SelectWordCursorAction(3);

    if (JOY_REPT(DPAD_LEFT))
        return SelectWordCursorAction(1);

    if (JOY_REPT(DPAD_RIGHT))
        return SelectWordCursorAction(0);

    return 0;
}

static u16 Cancel_HandleYesNoMenu(void)
{
    u8 var0;

    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = GetStateBackup();
        return 7;
    case 0: // Yes
        gSpecialVar_Result = 0;

        return 23;
    default:
        return 0;
    }
}

static u16 Confirm_HandleYesNoMenu(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = GetStateBackup();
        return 7;
    case 0: // Yes
        gSpecialVar_Result = HasECMessageChanged();
        CommitECWords();
        return 23;
    default:
        return 0;
    }
}

static u16 DelAll_HandleYesNoMenu(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = 1;
        return 7;
    case 0: // Yes
        DeleteAllECFields();
        sEasyChatScreen->state = 1;
        return 8;
    default:
        return 0;
    }
}

static u16 Cancel_CreateYesNoMenu(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    sEasyChatScreen->state = 4;
    return 5;
}

static u16 DelAll_CreateYesNoMenu(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    sEasyChatScreen->state = 5;
    return 4;
}

static u16 Confirm_CreateYesNoMenu(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    if (IsEcWordBufferUninitialized())
    {
        sEasyChatScreen->state = 4;
        return 5;
    }
    else
    {
        sEasyChatScreen->state = 6;
        return 6;
    }
}

static u8 GetStateBackup(void)
{
    return sEasyChatScreen->stateBackup;
}

static int OpenSelectedGroup(void)
{
    u16 numDisplayedWords;

    if (!sEasyChatScreen->isAlphaMode)
    {
        u8 groupId = GetSelectedGroupByIndex(GetSelectedGroupIndex());
        GetUnlockedECWords(FALSE, groupId);
    }
    else
    {
        GetUnlockedECWords(TRUE, GetSelectedLetter());
    }

    numDisplayedWords = GetNumDisplayedWords();
    if (numDisplayedWords == 0)
        return 0;

    sEasyChatScreen->selectWordNumRows = (numDisplayedWords - 1) / 2;
    sEasyChatScreen->selectWordRowsAbove = 0;
    sEasyChatScreen->selectWordCursorX = 0;
    sEasyChatScreen->selectWordCursorY = 0;
    sEasyChatScreen->state = 3;
    return 11;
}

static int BackOutFromGroupToFieldSelect(void)
{
    sEasyChatScreen->state = 0;
    return 10;
}

static int ToggleGroupAlphaMode(void)
{
    sEasyChatScreen->selectGroupCursorX = 0;
    sEasyChatScreen->selectGroupCursorY = 0;
    sEasyChatScreen->selectGroupRowsAbove = 0;
    if (!sEasyChatScreen->isAlphaMode)
        sEasyChatScreen->isAlphaMode = TRUE;
    else
        sEasyChatScreen->isAlphaMode = FALSE;

    return 22;
}

static int DeleteSelectedWord(void)
{
    SetEasyChatWordToField(0xFFFF);
    return 1;
}

static int PlaceSelectedWord(void)
{
    u16 easyChatWord = GetDisplayedWordByIndex(GetSelectWordCursorPos());
    SetEasyChatWordToField(easyChatWord);
    sEasyChatScreen->state = 0;
    return 12;
}

static void CommitECWords(void)
{
    u16 i;
    for (i = 0; i < sEasyChatScreen->numWords; i++)
        sEasyChatScreen->words[i] = sEasyChatScreen->ecWordBuffer[i];
}

static void DeleteAllECFields(void)
{
    u16 i;
    for (i = 0; i < sEasyChatScreen->numWords; i++)
        sEasyChatScreen->ecWordBuffer[i] = 0xFFFF;
}

static void SetEasyChatWordToField(u16 easyChatWord)
{
    u16 index = GetSelectedFieldIndex();
    sEasyChatScreen->ecWordBuffer[index] = easyChatWord;
}

static bool8 HasECMessageChanged(void)
{
    u16 i;
    for (i = 0; i < sEasyChatScreen->numWords; i++)
    {
        if (sEasyChatScreen->ecWordBuffer[i] != sEasyChatScreen->words[i])
            return TRUE;
    }

    return FALSE;
}

static u16 SelectGroupCursorAction(u32 action)
{
    if (sEasyChatScreen->selectGroupCursorX != -1)
    {
        if (!sEasyChatScreen->isAlphaMode)
            return UpdateSelectGroupCursorPos_OutsideBlueBox_GroupMode(action);
        else
            return UpdateSelectGroupCursorPos_OutsideBlueBox_AlphaMode(action);
    }
    else
    {
        return UpdateSelectGroupCursorPos_InsideBlueBox(action);
    }
}

static int UpdateSelectGroupCursorPos_OutsideBlueBox_GroupMode(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->selectGroupCursorY != -sEasyChatScreen->selectGroupRowsAbove)
        {
            if (sEasyChatScreen->selectGroupCursorY)
            {
                sEasyChatScreen->selectGroupCursorY--;
                return 14;
            }
            else
            {
                sEasyChatScreen->selectGroupRowsAbove--;
                return 16;
            }
        }
        break;
    case 3:
        if (sEasyChatScreen->selectGroupCursorY + sEasyChatScreen->selectGroupRowsAbove < sEasyChatScreen->selectGroupNumRows - 1)
        {
            int var0;
            if (sEasyChatScreen->selectGroupCursorY < 3)
            {
                sEasyChatScreen->selectGroupCursorY++;
                var0 = 14;
            }
            else
            {
                sEasyChatScreen->selectGroupRowsAbove++;
                var0 = 15;
            }

            MoveGroupCursorXToMaxCol();
            return var0;
        }
        break;
    case 1:
        if (sEasyChatScreen->selectGroupCursorX)
            sEasyChatScreen->selectGroupCursorX--;
        else
            GroupCursorMoveToBlueBox();

        return 14;
    case 0:
        if (sEasyChatScreen->selectGroupCursorX < 1)
        {
            sEasyChatScreen->selectGroupCursorX++;
            if (GroupSelectCursorXPosTooFarRight())
                GroupCursorMoveToBlueBox();
        }
        else
        {
            GroupCursorMoveToBlueBox();
        }
        return 14;
    }

    return 0;
}

static int UpdateSelectGroupCursorPos_OutsideBlueBox_AlphaMode(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->selectGroupCursorY > 0)
            sEasyChatScreen->selectGroupCursorY--;
        else
            sEasyChatScreen->selectGroupCursorY = 3;

        MoveGroupCursorXToMaxCol();
        return 14;
    case 3:
        if (sEasyChatScreen->selectGroupCursorY < 3)
            sEasyChatScreen->selectGroupCursorY++;
        else
            sEasyChatScreen->selectGroupCursorY = 0;

        MoveGroupCursorXToMaxCol();
        return 14;
    case 0:
        sEasyChatScreen->selectGroupCursorX++;
        if (GroupSelectCursorXPosTooFarRight())
            GroupCursorMoveToBlueBox();

        return 14;
    case 1:
        sEasyChatScreen->selectGroupCursorX--;
        if (sEasyChatScreen->selectGroupCursorX < 0)
            GroupCursorMoveToBlueBox();

        return 14;
    }

    return 0;
}

static int UpdateSelectGroupCursorPos_InsideBlueBox(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->selectGroupCursorY)
            sEasyChatScreen->selectGroupCursorY--;
        else
            sEasyChatScreen->selectGroupCursorY = 2;

        return 14;
    case 3:
        if (sEasyChatScreen->selectGroupCursorY < 2)
            sEasyChatScreen->selectGroupCursorY++;
        else
            sEasyChatScreen->selectGroupCursorY = 0;

        return 14;
    case 1:
        sEasyChatScreen->selectGroupCursorY++;
        GroupCursorWrapAroundLeft();
        return 14;
    case 0:
        sEasyChatScreen->selectGroupCursorX = 0;
        sEasyChatScreen->selectGroupCursorY++;
        return 14;
    }

    return 0;
}

static void GroupCursorMoveToBlueBox(void)
{
    sEasyChatScreen->selectGroupCursorX = 0xFF;
    if (sEasyChatScreen->selectGroupCursorY)
        sEasyChatScreen->selectGroupCursorY--;
}

static void GroupCursorWrapAroundLeft(void)
{
    if (!sEasyChatScreen->isAlphaMode)
    {
        sEasyChatScreen->selectGroupCursorX = 1;
        MoveGroupCursorXToMaxCol();
    }
    else
    {
        sEasyChatScreen->selectGroupCursorX = GetMaxGroupCursorXinAlphaMode(sEasyChatScreen->selectGroupCursorY);
    }
}

static u16 SelectWordCursorAction(u32 arg0)
{
    u16 result;
    switch (arg0)
    {
    case 2: // up
        if (sEasyChatScreen->selectWordCursorY + sEasyChatScreen->selectWordRowsAbove > 0)
        {
            if (sEasyChatScreen->selectWordCursorY > 0)
            {
                sEasyChatScreen->selectWordCursorY--;
                result = 17;
            }
            else
            {
                sEasyChatScreen->selectWordRowsAbove--;
                result = 18;
            }

            MoveWordCursorXToMaxCol();
            return result;
        }
        break;
    case 3: // down
        if (sEasyChatScreen->selectWordCursorY + sEasyChatScreen->selectWordRowsAbove < sEasyChatScreen->selectWordNumRows)
        {
            if (sEasyChatScreen->selectWordCursorY < 3)
            {
                sEasyChatScreen->selectWordCursorY++;
                result = 17;
            }
            else
            {
                sEasyChatScreen->selectWordRowsAbove++;
                result = 19;
            }

            MoveWordCursorXToMaxCol();
            return result;
        }
        break;
    case 1: // left
        if (sEasyChatScreen->selectWordCursorX > 0)
            sEasyChatScreen->selectWordCursorX--;
        else
            sEasyChatScreen->selectWordCursorX = 1;

        MoveWordCursorXToMaxCol();
        return 17;
    case 0: // right
        if (sEasyChatScreen->selectWordCursorX < 1)
        {
            sEasyChatScreen->selectWordCursorX++;
            if (WordSelectCursorXPosTooFarRight())
                sEasyChatScreen->selectWordCursorX = 0;
        }
        else
        {
            sEasyChatScreen->selectWordCursorX = 0;
        }
        return 17;
    case 4: // pg up
        if (sEasyChatScreen->selectWordRowsAbove)
        {
            if (sEasyChatScreen->selectWordRowsAbove > 3)
                sEasyChatScreen->selectWordRowsAbove -= 4;
            else
                sEasyChatScreen->selectWordRowsAbove = 0;

            return 20;
        }
        break;
    case 5: // pg dn
        if (sEasyChatScreen->selectWordRowsAbove <= sEasyChatScreen->selectWordNumRows - 4)
        {
            sEasyChatScreen->selectWordRowsAbove += 4;
            if (sEasyChatScreen->selectWordRowsAbove > sEasyChatScreen->selectWordNumRows - 3)
                sEasyChatScreen->selectWordRowsAbove = sEasyChatScreen->selectWordNumRows + -3u;

            MoveWordCursorXToMaxCol();
            return 21;
        }
        break;
    }

    return 0;
}

static u16 GetSelectedFieldIndex(void)
{
    return (sEasyChatScreen->mainCursorRow * sEasyChatScreen->numColumns) + sEasyChatScreen->mainCursorColumn;
}

static u16 GetSelectedGroupIndex(void)
{
    return 2 * (sEasyChatScreen->selectGroupCursorY + sEasyChatScreen->selectGroupRowsAbove) + sEasyChatScreen->selectGroupCursorX;
}

static const u8 sAlphabetLayout[][7] = {
    { 1,  2,  3,  4,  5,  6},
    { 7,  8,  9, 10, 11, 12},
    {13, 14, 15, 16, 17, 18, 19},
    {20, 21, 22, 23, 24, 25, 26}
};

static int GetSelectedLetter(void)
{
    int col = sEasyChatScreen->selectGroupCursorX < NELEMS(*sAlphabetLayout) ? sEasyChatScreen->selectGroupCursorX : 0;
    int row = sEasyChatScreen->selectGroupCursorY < NELEMS(sAlphabetLayout) ? sEasyChatScreen->selectGroupCursorY : 0;
    return sAlphabetLayout[row][col];
}

static u16 GetSelectWordCursorPos(void)
{
    return 2 * (sEasyChatScreen->selectWordCursorY + sEasyChatScreen->selectWordRowsAbove)  + sEasyChatScreen->selectWordCursorX;
}

static u8 GetMaxGroupCursorXinAlphaMode(u8 arg0)
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

static void MoveGroupCursorXToMaxCol(void)
{
    while (GroupSelectCursorXPosTooFarRight())
    {
        if (sEasyChatScreen->selectGroupCursorX)
            sEasyChatScreen->selectGroupCursorX--;
        else
            break;
    }
}

static void MoveWordCursorXToMaxCol(void)
{
    while (WordSelectCursorXPosTooFarRight())
    {
        if (sEasyChatScreen->selectWordCursorX)
            sEasyChatScreen->selectWordCursorX--;
        else
            break;
    }
}

static bool8 GroupSelectCursorXPosTooFarRight(void)
{
    if (!sEasyChatScreen->isAlphaMode)
        return GetSelectedGroupIndex() >= GetNumDisplayableGroups() ? TRUE : FALSE;
    else
        return sEasyChatScreen->selectGroupCursorX > GetMaxGroupCursorXinAlphaMode(sEasyChatScreen->selectGroupCursorY) ? TRUE : FALSE;
}

static bool8 WordSelectCursorXPosTooFarRight(void)
{
    return GetSelectWordCursorPos() >= GetNumDisplayedWords() ? TRUE : FALSE;
}

u8 GetEasyChatScreenFrameId(void)
{
    return sEasyChatScreenTemplates[sEasyChatScreen->templateId].frameId;
}

const u8 *GetTitleText(void)
{
    return sEasyChatScreenTemplates[sEasyChatScreen->templateId].titleText;
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

void GetEasyChatConfirmCancelText(const u8 **str1, const u8 **str2)
{
    switch (sEasyChatScreen->type)
    {
    case EASY_CHAT_TYPE_MAIL:
        *str1 = gText_StopGivingPkmnMail;
        *str2 = NULL;
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

void GetECSelectGroupCursorCoords(u8 *Xp, u8 *Yp)
{
    *Xp = sEasyChatScreen->selectGroupCursorX;
    *Yp = sEasyChatScreen->selectGroupCursorY;
}

bool8 IsEasyChatAlphaMode(void)
{
    return sEasyChatScreen->isAlphaMode;
}

u8 GetECSelectGroupRowsAbove(void)
{
    return sEasyChatScreen->selectGroupRowsAbove;
}

void GetECSelectWordCursorCoords(s8 *Xp, s8 *Yp)
{
    *Xp = sEasyChatScreen->selectWordCursorX;
    *Yp = sEasyChatScreen->selectWordCursorY;
}

u8 GetECSelectWordRowsAbove(void)
{
    return sEasyChatScreen->selectWordRowsAbove;
}

u8 GetECSelectWordNumRows(void)
{
    return sEasyChatScreen->selectWordNumRows;
}

static u8 UnusedDummy(void)
{
    return 0;
}

bool32 ShouldDrawECUpArrow(void)
{
    switch (sEasyChatScreen->state)
    {
    case 2:
        if (!sEasyChatScreen->isAlphaMode && sEasyChatScreen->selectGroupRowsAbove != 0)
            return TRUE;
        break;
    case 3:
        if (sEasyChatScreen->selectWordRowsAbove != 0)
            return TRUE;
        break;
    }

    return FALSE;
}

bool32 ShouldDrawECDownArrow(void)
{
    switch (sEasyChatScreen->state)
    {
    case 2:
        if (!sEasyChatScreen->isAlphaMode && sEasyChatScreen->selectGroupRowsAbove + 4 <= sEasyChatScreen->selectGroupNumRows - 1)
            return TRUE;
        break;
    case 3:
        if (sEasyChatScreen->selectWordRowsAbove + 4 <= sEasyChatScreen->selectWordNumRows)
            return TRUE;
        break;
    }

    return FALSE;
}

static bool8 IsPhraseDifferentThanPlayerInput(const u16 *phrase, u8 phraseLength)
{
    u8 i;

    for (i = 0; i < phraseLength; i++)
    {
        if (phrase[i] != sEasyChatScreen->ecWordBuffer[i])
            return TRUE;
    }

    return FALSE;
}

static u8 GetEasyChatScreenTemplateId(u8 type)
{
    u32 i;

    for (i = 0; i < NELEMS(sEasyChatScreenTemplates); i++)
    {
        if (sEasyChatScreenTemplates[i].type == type)
            return i;
    }

    return 0;
}

static bool32 IsEcWordBufferUninitialized(void)
{
    int i;

    for (i = 0; i < sEasyChatScreen->numWords; i++)
    {
        if (sEasyChatScreen->ecWordBuffer[i] != 0xFFFF)
            return FALSE;
    }

    return TRUE;
}
