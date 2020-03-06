#include "global.h"
#include "gflib.h"
#include "easy_chat.h"
#include "event_data.h"
#include "menu.h"
#include "mevent.h"
#include "overworld.h"
#include "strings.h"
#include "task.h"
#include "constants/songs.h"
#include "constants/flags.h"

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
    /*0x07*/ u8 unk_07;
    /*0x08*/ u8 stateBackup;
    /*0x09*/ u8 unk_09;
    /*0x0A*/ s8 unk_0a;
    /*0x0B*/ s8 unk_0b;
    /*0x0C*/ u8 unk_0c;
    /*0x0D*/ u8 unk_0d;
    /*0x0E*/ u8 unk_0e;
    /*0x0F*/ u8 unk_0f;
    /*0x10*/ s8 unk_10;
    /*0x11*/ s8 unk_11;
    /*0x12*/ u8 unk_12;
    /*0x14*/ u16 *words;
    /*0x18*/ u16 ecWordBuffer[9];
};

EWRAM_DATA struct EasyChatScreen *sEasyChatScreen = NULL;

void sub_80FEC0C(void);
void sub_80FEC54(u8 taskId);
void sub_80FEC90(u8 taskId);
bool8 sub_80FED80(u8 taskId);
void sub_80FEE24(MainCallback cb);
void sub_80FEF2C(void);
void sub_80FEF4C(void);
bool8 EasyChat_AllocateResources(u8 type, u16 *words);
void EasyChat_FreeResources(void);
u16 sub_80FF028(void);
u16 sub_80FF098(void);
u16 sub_80FF20C(void);
u16 sub_80FF360(void);
u16 sub_80FF41C(void);
u16 sub_80FF4A8(void);
u16 sub_80FF4F0(void);
u16 sub_80FF544(void);
u16 sub_80FF590(void);
u16 sub_80FF5A8(void);
u16 sub_80FF5C0(void);
u8 sub_80FF5F0(void);
int sub_80FF5FC(void);
int sub_80FF678(void);
int sub_80FF688(void);
int sub_80FF6B4(void);
int sub_80FF6C8(void);
void sub_80FF6F0(void);
void sub_80FF728(void);
void sub_80FF768(u16 word);
bool8 sub_80FF78C(void);
u16 sub_80FF7CC(u32 action);
int sub_80FF80C(u32 action);
int sub_80FF8D8(u32 action);
int sub_80FF968(u32 action);
void sub_80FF9E8(void);
void sub_80FFA0C(void);
u16 sub_80FFA38(u32 action);
u16 sub_80FFB6C(void);
u16 sub_80FFB8C(void);
int sub_80FFBAC(void);
u16 sub_80FFBE4(void);
u8 sub_80FFC04(u8 unkB);
void sub_80FFC1C(void);
void sub_80FFC44(void);
bool8 sub_80FFC6C(void);
bool8 sub_80FFCC0(void);
bool8 GetEasyChatScreenFrameId(void);
bool8 IsPhraseDifferentThanPlayerInput(const u16 *wordsToCompare, u8 numWords);
u8 GetEasyChatScreenTemplateId(u8 type);
bool32 IsEcWordBufferUninitialized(void);
bool8 sub_80FFF80(void);
bool8 sub_80FFF98(void);
void sub_810011C(void);
void sub_8100134(u16 v0);
bool8 sub_810014C(void);
bool8 sub_8100BF4(void);

void DoEasyChatScreen(u8 type, u16 *words, MainCallback callback)
{
    u8 taskId;
    ResetTasks();
    taskId = CreateTask(sub_80FEC54, 0);
    gTasks[taskId].data[EZCHAT_TASK_TYPE] = type;
    SetWordTaskArg(taskId, EZCHAT_TASK_WORDS, (uintptr_t)words);
    SetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK, (uintptr_t)callback);
    SetMainCallback2(sub_80FEC0C);
}

void sub_80FEC0C(void)
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

void sub_80FEC38(u8 taskId, TaskFunc func)
{
    gTasks[taskId].func = func;
    gTasks[taskId].data[EZCHAT_TASK_STATE] = 0;
}

void sub_80FEC54(u8 taskId)
{
    if (!IsUpdateLinkStateCBActive())
    {
        while (sub_80FED80(taskId))
            ;
    }
    else
    {
        if (sub_80FED80(taskId) == TRUE)
            return;
    }
    sub_80FEC38(taskId, sub_80FEC90);
}

void sub_80FEC90(u8 taskId)
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
        data[EZCHAT_TASK_STATE]++;
        break;
    case 1:
        v0 = sub_80FF028();
        if (v0 == 23)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, RGB_BLACK);
            data[EZCHAT_TASK_STATE] = 3;
        }
        else if (v0 != 0)
        {
            PlaySE(SE_SELECT);
            sub_8100134(v0);
            data[EZCHAT_TASK_STATE]++;
        }
        break;
    case 2:
        if (!sub_810014C())
            data[EZCHAT_TASK_STATE] = 1;
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            if (data[EZCHAT_TASK_TYPE] == 14)
                sub_80FEF4C();
            if (data[EZCHAT_TASK_TYPE] == 0)
            {
                FlagSet(FLAG_SYS_SET_TRAINER_CARD_PROFILE);
                sub_80FEF2C();
            }
            sub_80FEE24((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    }
}

bool8 sub_80FED80(u8 taskId)
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
            sub_80FEE24((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 2:
        if (!EasyChat_AllocateResources(data[EZCHAT_TASK_TYPE], (u16 *)GetWordTaskArg(taskId, EZCHAT_TASK_WORDS)))
        {
            sub_80FEE24((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 3:
        if (!sub_80FFF80())
        {
            sub_80FEE24((MainCallback)GetWordTaskArg(taskId, EZCHAT_TASK_MAINCALLBACK));
        }
        break;
    case 4:
        if (sub_80FFF98())
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

void sub_80FEE24(MainCallback callback)
{
    DestroyEasyChatSelectionData();
    EasyChat_FreeResources();
    sub_810011C();
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
        words = GetMEventProfileECWordsMaybe();
        break;
    case EASY_CHAT_TYPE_MAIL:
        words = gSaveBlock1Ptr->mail[gSpecialVar_0x8005].words;
        break;
    default:
        return;
    }
    DoEasyChatScreen(gSpecialVar_0x8004, words, sub_80568C4);
}

static const u16 gUnknown_843F29C[] = {
    EC_WORD_MYSTERY,
    EC_WORD_EVENT,
    EC_WORD_IS,
    EC_WORD_EXCITING
};

void sub_80FEF2C(void)
{
    gSpecialVar_0x8004 = IsPhraseDifferentThanPlayerInput(gUnknown_843F29C, NELEMS(gUnknown_843F29C));
}

static const u16 gUnknown_843F2A4[] = {
    EC_WORD_LINK,
    EC_WORD_TOGETHER,
    EC_WORD_WITH,
    EC_WORD_ALL
};

void sub_80FEF4C(void)
{
    gSpecialVar_0x8004 = IsPhraseDifferentThanPlayerInput(gUnknown_843F2A4, NELEMS(gUnknown_843F2A4));
}

const struct EasyChatScreenTemplate sEasyChatScreenTemplates[] = {
    {
        .type = EASY_CHAT_TYPE_PROFILE,
        .numColumns = 2,
        .numRows = 2,
        .frameId = 0,
        .titleText =  gUnknown_8418A2B,
        .instructionsText1 = gUnknown_84186D1,
        .instructionsText2 = gUnknown_84186EF,
        .confirmText1 = gUnknown_841880E,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_BATTLE_START,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gUnknown_8418A33,
        .instructionsText1 = gUnknown_8418706,
        .instructionsText2 = gUnknown_8418725,
        .confirmText1 = gUnknown_841881B,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_BATTLE_WON,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gUnknown_8418A4A,
        .instructionsText1 = gUnknown_8418706,
        .instructionsText2 = gUnknown_8418725,
        .confirmText1 = gUnknown_841883E,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_BATTLE_LOST,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gUnknown_8418A61,
        .instructionsText1 = gUnknown_8418706,
        .instructionsText2 = gUnknown_8418725,
        .confirmText1 = gUnknown_841885F,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_MAIL,
        .numColumns = 2,
        .numRows = 5,
        .frameId = 2,
        .titleText =  NULL,
        .instructionsText1 = gUnknown_8418780,
        .instructionsText2 = gUnknown_841879E,
        .confirmText1 = gUnknown_841888C,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_MAIL_NO_CONFIRM,
        .numColumns = 2,
        .numRows = 2,
        .frameId = 0,
        .instructionsText1 = gUnknown_8418780,
        .instructionsText2 = gUnknown_841879E,
    }, {
        .type = EASY_CHAT_TYPE_BARD_SONG,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gUnknown_8418A77,
        .instructionsText1 = gUnknown_84187B2,
        .instructionsText2 = gUnknown_84187D1,
        .confirmText1 = gUnknown_84188AC,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_INTERVIEW,
        .numColumns = 2,
        .numRows = 3,
        .frameId = 1,
        .titleText =  gUnknown_8418AA1,
        .instructionsText1 = gUnknown_8418745,
        .instructionsText2 = gUnknown_8418763,
        .confirmText1 = gUnknown_8418881,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_TRENDY_PHRASE,
        .numColumns = 2,
        .numRows = 1,
        .frameId = 3,
        .titleText =  gUnknown_8418A87,
        .instructionsText1 = gUnknown_84188B9,
        .instructionsText2 = gUnknown_84188D6,
        .confirmText1 = gUnknown_84188F0,
        .confirmText2 = gUnknown_8418902
    }, {
        .type = EASY_CHAT_TYPE_QUESTIONNAIRE,
        .numColumns = 2,
        .numRows = 2,
        .frameId = 0,
        .titleText =  gUnknown_8418AB2,
        .instructionsText1 = gUnknown_84186D1,
        .instructionsText2 = gUnknown_84187EE,
        .confirmText1 = gUnknown_8418881,
        .confirmText2 = gUnknown_8418902
    }
};

bool8 EasyChat_AllocateResources(u8 type, u16 *words)
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
    sEasyChatScreen->unk_09 = 0;
    templateId = GetEasyChatScreenTemplateId(type);

    sEasyChatScreen->numColumns = sEasyChatScreenTemplates[templateId].numColumns;
    sEasyChatScreen->numRows = sEasyChatScreenTemplates[templateId].numRows;
    sEasyChatScreen->unk_07 = sEasyChatScreen->numColumns * sEasyChatScreen->numRows;
    sEasyChatScreen->templateId = templateId;
    if (sEasyChatScreen->unk_07 > 9)
        sEasyChatScreen->unk_07 = 9;

    CpuCopy16(words, sEasyChatScreen->ecWordBuffer, sEasyChatScreen->unk_07 * sizeof(u16));
    sEasyChatScreen->unk_0d = (GetNumDisplayableGroups() - 1) / 2 + 1;
    return TRUE;
}

void EasyChat_FreeResources(void)
{
    if (sEasyChatScreen != NULL)
        Free(sEasyChatScreen);
}

u16 sub_80FF028(void)
{
    switch (sEasyChatScreen->state)
    {
    case 0:
        return sub_80FF098();
    case 1:
        return sub_80FF20C();
    case 2:
        return sub_80FF360();
    case 3:
        return sub_80FF41C();
    case 4:
        return sub_80FF4A8();
    case 5:
        return sub_80FF544();
    case 6:
        return sub_80FF4F0();
    }
    return 0;
}

u16 sub_80FF098(void)
{
    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            sEasyChatScreen->state = 2;
            sEasyChatScreen->unk_0a = 0;
            sEasyChatScreen->unk_0b = 0;
            sEasyChatScreen->unk_0c = 0;
            return 9;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            return sub_80FF590();
        }
        else if (JOY_NEW(START_BUTTON))
        {
            return sub_80FF5C0();
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

u16 sub_80FF20C(void)
{
    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            switch (sEasyChatScreen->mainCursorColumn)
            {
            case 0:
                return sub_80FF5A8();
            case 1:
                return sub_80FF590();
            case 2:
                return sub_80FF5C0();
            }
        }

        if (JOY_NEW(B_BUTTON))
        {
            return sub_80FF590();
        }
        else if (JOY_NEW(START_BUTTON))
        {
            return sub_80FF5C0();
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

u16 sub_80FF360(void)
{
    if (JOY_NEW(B_BUTTON))
        return sub_80FF678();

    if (JOY_NEW(A_BUTTON))
    {
        if (sEasyChatScreen->unk_0a != -1)
            return sub_80FF5FC();

        switch (sEasyChatScreen->unk_0b)
        {
        case 0:
            return sub_80FF688();
        case 1:
            return sub_80FF6B4();
        case 2:
            return sub_80FF678();
        }
    }

    if (JOY_NEW(SELECT_BUTTON))
        return sub_80FF688();

    if (JOY_REPT(DPAD_UP))
        return sub_80FF7CC(2);

    if (JOY_REPT(DPAD_DOWN))
        return sub_80FF7CC(3);

    if (JOY_REPT(DPAD_LEFT))
        return sub_80FF7CC(1);

    if (JOY_REPT(DPAD_RIGHT))
        return sub_80FF7CC(0);

    return 0;
}

u16 sub_80FF41C(void)
{
    if (JOY_NEW(B_BUTTON))
    {
        sEasyChatScreen->state = 2;
        return 13;
    }

    if (JOY_NEW(A_BUTTON))
        return sub_80FF6C8();

    if (JOY_NEW(START_BUTTON))
        return sub_80FFA38(4);

    if (JOY_NEW(SELECT_BUTTON))
        return sub_80FFA38(5);

    if (JOY_REPT(DPAD_UP))
        return sub_80FFA38(2);

    if (JOY_REPT(DPAD_DOWN))
        return sub_80FFA38(3);

    if (JOY_REPT(DPAD_LEFT))
        return sub_80FFA38(1);

    if (JOY_REPT(DPAD_RIGHT))
        return sub_80FFA38(0);

    return 0;
}

u16 sub_80FF4A8(void)
{
    u8 var0;

    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = sub_80FF5F0();
        return 7;
    case 0: // Yes
        gSpecialVar_Result = 0;

        return 23;
    default:
        return 0;
    }
}

u16 sub_80FF4F0(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = sub_80FF5F0();
        return 7;
    case 0: // Yes
        gSpecialVar_Result = sub_80FF78C();
        sub_80FF6F0();
        return 23;
    default:
        return 0;
    }
}

u16 sub_80FF544(void)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case MENU_B_PRESSED: // B Button
    case 1: // No
        sEasyChatScreen->state = 1;
        return 7;
    case 0: // Yes
        sub_80FF728();
        sEasyChatScreen->state = 1;
        return 8;
    default:
        return 0;
    }
}

u16 sub_80FF590(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    sEasyChatScreen->state = 4;
    return 5;
}

u16 sub_80FF5A8(void)
{
    sEasyChatScreen->stateBackup = sEasyChatScreen->state;
    sEasyChatScreen->state = 5;
    return 4;
}

u16 sub_80FF5C0(void)
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

u8 sub_80FF5F0(void)
{
    return sEasyChatScreen->stateBackup;
}

int sub_80FF5FC(void)
{
    u16 var1;

    if (sEasyChatScreen->unk_09 == 0)
    {
        u8 groupId = GetSelectedGroupByIndex(sub_80FFB8C());
        GetUnlockedECWords(FALSE, groupId);
    }
    else
    {
        GetUnlockedECWords(TRUE, sub_80FFBAC());
    }

    var1 = GetNumDisplayedWords();
    if (var1 == 0)
        return 0;

    sEasyChatScreen->unk_0f = (var1 - 1) / 2;
    sEasyChatScreen->unk_0e = 0;
    sEasyChatScreen->unk_10 = 0;
    sEasyChatScreen->unk_11 = 0;
    sEasyChatScreen->state = 3;
    return 11;
}

int sub_80FF678(void)
{
    sEasyChatScreen->state = 0;
    return 10;
}

int sub_80FF688(void)
{
    sEasyChatScreen->unk_0a = 0;
    sEasyChatScreen->unk_0b = 0;
    sEasyChatScreen->unk_0c = 0;
    if (!sEasyChatScreen->unk_09)
        sEasyChatScreen->unk_09 = 1;
    else
        sEasyChatScreen->unk_09 = 0;

    return 22;
}

int sub_80FF6B4(void)
{
    sub_80FF768(0xFFFF);
    return 1;
}

int sub_80FF6C8(void)
{
    u16 easyChatWord = GetDisplayedWordByIndex(sub_80FFBE4());
    sub_80FF768(easyChatWord);
    sEasyChatScreen->state = 0;
    return 12;
}

void sub_80FF6F0(void)
{
    u16 i;
    for (i = 0; i < sEasyChatScreen->unk_07; i++)
        sEasyChatScreen->words[i] = sEasyChatScreen->ecWordBuffer[i];
}

void sub_80FF728(void)
{
    u16 i;
    for (i = 0; i < sEasyChatScreen->unk_07; i++)
        sEasyChatScreen->ecWordBuffer[i] = 0xFFFF;
}

void sub_80FF768(u16 easyChatWord)
{
    u16 index = sub_80FFB6C();
    sEasyChatScreen->ecWordBuffer[index] = easyChatWord;
}

bool8 sub_80FF78C(void)
{
    u16 i;
    for (i = 0; i < sEasyChatScreen->unk_07; i++)
    {
        if (sEasyChatScreen->ecWordBuffer[i] != sEasyChatScreen->words[i])
            return TRUE;
    }

    return FALSE;
}

u16 sub_80FF7CC(u32 action)
{
    if (sEasyChatScreen->unk_0a != -1)
    {
        if (sEasyChatScreen->unk_09 == 0)
            return sub_80FF80C(action);
        else
            return sub_80FF8D8(action);
    }
    else
    {
        return sub_80FF968(action);
    }
}

int sub_80FF80C(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->unk_0b != -sEasyChatScreen->unk_0c)
        {
            if (sEasyChatScreen->unk_0b)
            {
                sEasyChatScreen->unk_0b--;
                return 14;
            }
            else
            {
                sEasyChatScreen->unk_0c--;
                return 16;
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
                var0 = 14;
            }
            else
            {
                sEasyChatScreen->unk_0c++;
                var0 = 15;
            }

            sub_80FFC1C();
            return var0;
        }
        break;
    case 1:
        if (sEasyChatScreen->unk_0a)
            sEasyChatScreen->unk_0a--;
        else
            sub_80FF9E8();

        return 14;
    case 0:
        if (sEasyChatScreen->unk_0a < 1)
        {
            sEasyChatScreen->unk_0a++;
            if (sub_80FFC6C())
                sub_80FF9E8();
        }
        else
        {
            sub_80FF9E8();
        }
        return 14;
    }

    return 0;
}

int sub_80FF8D8(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->unk_0b > 0)
            sEasyChatScreen->unk_0b--;
        else
            sEasyChatScreen->unk_0b = 3;

        sub_80FFC1C();
        return 14;
    case 3:
        if (sEasyChatScreen->unk_0b < 3)
            sEasyChatScreen->unk_0b++;
        else
            sEasyChatScreen->unk_0b = 0;

        sub_80FFC1C();
        return 14;
    case 0:
        sEasyChatScreen->unk_0a++;
        if (sub_80FFC6C())
            sub_80FF9E8();

        return 14;
    case 1:
        sEasyChatScreen->unk_0a--;
        if (sEasyChatScreen->unk_0a < 0)
            sub_80FF9E8();

        return 14;
    }

    return 0;
}

int sub_80FF968(u32 arg0)
{
    switch (arg0)
    {
    case 2:
        if (sEasyChatScreen->unk_0b)
            sEasyChatScreen->unk_0b--;
        else
            sEasyChatScreen->unk_0b = 2;

        return 14;
    case 3:
        if (sEasyChatScreen->unk_0b < 2)
            sEasyChatScreen->unk_0b++;
        else
            sEasyChatScreen->unk_0b = 0;

        return 14;
    case 1:
        sEasyChatScreen->unk_0b++;
        sub_80FFA0C();
        return 14;
    case 0:
        sEasyChatScreen->unk_0a = 0;
        sEasyChatScreen->unk_0b++;
        return 14;
    }

    return 0;
}

void sub_80FF9E8(void)
{
    sEasyChatScreen->unk_0a = 0xFF;
    if (sEasyChatScreen->unk_0b)
        sEasyChatScreen->unk_0b--;
}

void sub_80FFA0C(void)
{
    if (sEasyChatScreen->unk_09 == 0)
    {
        sEasyChatScreen->unk_0a = 1;
        sub_80FFC1C();
    }
    else
    {
        sEasyChatScreen->unk_0a = sub_80FFC04(sEasyChatScreen->unk_0b);
    }
}

u16 sub_80FFA38(u32 arg0)
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
                result = 17;
            }
            else
            {
                sEasyChatScreen->unk_0e--;
                result = 18;
            }

            sub_80FFC44();
            return result;
        }
        break;
    case 3:
        if (sEasyChatScreen->unk_11 + sEasyChatScreen->unk_0e < sEasyChatScreen->unk_0f)
        {
            if (sEasyChatScreen->unk_11 < 3)
            {
                sEasyChatScreen->unk_11++;
                result = 17;
            }
            else
            {
                sEasyChatScreen->unk_0e++;
                result = 19;
            }

            sub_80FFC44();
            return result;
        }
        break;
    case 1:
        if (sEasyChatScreen->unk_10 > 0)
            sEasyChatScreen->unk_10--;
        else
            sEasyChatScreen->unk_10 = 1;

        sub_80FFC44();
        return 17;
    case 0:
        if (sEasyChatScreen->unk_10 < 1)
        {
            sEasyChatScreen->unk_10++;
            if (sub_80FFCC0())
                sEasyChatScreen->unk_10 = 0;
        }
        else
        {
            sEasyChatScreen->unk_10 = 0;
        }
        return 17;
    case 4:
        if (sEasyChatScreen->unk_0e)
        {
            if (sEasyChatScreen->unk_0e > 3)
                sEasyChatScreen->unk_0e -= 4;
            else
                sEasyChatScreen->unk_0e = 0;

            return 20;
        }
        break;
    case 5:
        if (sEasyChatScreen->unk_0e <= sEasyChatScreen->unk_0f - 4)
        {
            sEasyChatScreen->unk_0e += 4;
            if (sEasyChatScreen->unk_0e > sEasyChatScreen->unk_0f - 3)
                sEasyChatScreen->unk_0e = sEasyChatScreen->unk_0f + -3u;

            sub_80FFC44();
            return 21;
        }
        break;
    }

    return 0;
}

u16 sub_80FFB6C(void)
{
    return (sEasyChatScreen->mainCursorRow * sEasyChatScreen->numColumns) + sEasyChatScreen->mainCursorColumn;
}

u16 sub_80FFB8C(void)
{
    return 2 * (sEasyChatScreen->unk_0b + sEasyChatScreen->unk_0c) + sEasyChatScreen->unk_0a;
}

const u8 gUnknown_843F39C[][7] = {
    {0x01, 0x02, 0x03, 0x04, 0x05, 0x06},
    {0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c},
    {0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13},
    {0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a}
};

int sub_80FFBAC(void)
{
    int var0 = sEasyChatScreen->unk_0a < NELEMS(*gUnknown_843F39C) ? sEasyChatScreen->unk_0a : 0;
    int var1 = sEasyChatScreen->unk_0b < NELEMS(gUnknown_843F39C) ? sEasyChatScreen->unk_0b : 0;
    return gUnknown_843F39C[var1][var0];
}

u16 sub_80FFBE4(void)
{
    return 2 * (sEasyChatScreen->unk_11 + sEasyChatScreen->unk_0e)  + sEasyChatScreen->unk_10;
}

u8 sub_80FFC04(u8 arg0)
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

void sub_80FFC1C(void)
{
    while (sub_80FFC6C())
    {
        if (sEasyChatScreen->unk_0a)
            sEasyChatScreen->unk_0a--;
        else
            break;
    }
}

void sub_80FFC44(void)
{
    while (sub_80FFCC0())
    {
        if (sEasyChatScreen->unk_10)
            sEasyChatScreen->unk_10--;
        else
            break;
    }
}

bool8 sub_80FFC6C(void)
{
    if (sEasyChatScreen->unk_09 == 0)
        return sub_80FFB8C() >= GetNumDisplayableGroups() ? TRUE : FALSE;
    else
        return sEasyChatScreen->unk_0a > sub_80FFC04(sEasyChatScreen->unk_0b) ? TRUE : FALSE;
}

bool8 sub_80FFCC0(void)
{
    return sub_80FFBE4() >= GetNumDisplayedWords() ? TRUE : FALSE;
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

void sub_80FFDC8(const u8 **str1, const u8 **str2)
{
    switch (sEasyChatScreen->type)
    {
    case EASY_CHAT_TYPE_MAIL:
        *str1 = gUnknown_84189EE;
        *str2 = NULL;
        break;
    default:
        *str1 = gUnknown_84189E0;
        *str2 = NULL;
        break;
    }

}

void GetEasyChatConfirmDeletionText(const u8 **str1, const u8 **str2)
{
    *str1 = gUnknown_8418937;
    *str2 = gUnknown_8418956;
}

void sub_80FFE08(u8 *arg0, u8 *arg1)
{
    *arg0 = sEasyChatScreen->unk_0a;
    *arg1 = sEasyChatScreen->unk_0b;
}

u8 sub_80FFE1C(void)
{
    return sEasyChatScreen->unk_09;
}

u8 sub_80FFE28(void)
{
    return sEasyChatScreen->unk_0c;
}

void sub_80FFE34(u8 *arg0, u8 *arg1)
{
    *arg0 = sEasyChatScreen->unk_10;
    *arg1 = sEasyChatScreen->unk_11;
}

u8 sub_80FFE48(void)
{
    return sEasyChatScreen->unk_0e;
}

u8 sub_80FFE54(void)
{
    return sEasyChatScreen->unk_0f;
}

u8 unref_sub_80FFE60(void)
{
    return 0;
}

bool32 sub_80FFE64(void)
{
    switch (sEasyChatScreen->state)
    {
    case 2:
        if (sEasyChatScreen->unk_09 == 0 && sEasyChatScreen->unk_0c)
            return TRUE;
        break;
    case 3:
        if (sEasyChatScreen->unk_0e)
            return TRUE;
        break;
    }

    return FALSE;
}

bool32 sub_80FFE98(void)
{
    switch (sEasyChatScreen->state)
    {
    case 2:
        if (sEasyChatScreen->unk_09 == 0 && sEasyChatScreen->unk_0c + 4 <= sEasyChatScreen->unk_0d - 1)
            return TRUE;
        break;
    case 3:
        if (sEasyChatScreen->unk_0e + 4 <= sEasyChatScreen->unk_0f)
            return TRUE;
        break;
    }

    return FALSE;
}

bool8 IsPhraseDifferentThanPlayerInput(const u16 *phrase, u8 phraseLength)
{
    u8 i;

    for (i = 0; i < phraseLength; i++)
    {
        if (phrase[i] != sEasyChatScreen->ecWordBuffer[i])
            return TRUE;
    }

    return FALSE;
}

u8 GetEasyChatScreenTemplateId(u8 type)
{
    u32 i;

    for (i = 0; i < NELEMS(sEasyChatScreenTemplates); i++)
    {
        if (sEasyChatScreenTemplates[i].type == type)
            return i;
    }

    return 0;
}

bool32 IsEcWordBufferUninitialized(void)
{
    int i;

    for (i = 0; i < sEasyChatScreen->unk_07; i++)
    {
        if (sEasyChatScreen->ecWordBuffer[i] != 0xFFFF)
            return FALSE;
    }

    return TRUE;
}

bool8 sub_80FFF80(void)
{
    if (!sub_8100BF4())
        return FALSE;
    else
        return TRUE;
}
