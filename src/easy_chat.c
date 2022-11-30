#include "global.h"
#include "gflib.h"
#include "data.h"
#include "easy_chat.h"
#include "event_data.h"
#include "field_message_box.h"
#include "mystery_gift.h"
#include "menu.h"
#include "mail.h"
#include "pokedex.h"
#include "random.h"
#include "strings.h"
#include "constants/easy_chat.h"

struct Unk203A120
{
    u16 numGroups;
    u16 groups[EC_NUM_GROUPS];
    u16 alphabeticalGroups[27];
    u16 alphabeticalWordsByGroup[27][270];
    u8 filler3958[0x2C];
    u16 allWords[270];
    u16 totalWords;
}; /*size = 0x3BA4*/

static EWRAM_DATA struct Unk203A120 * sEasyChatSelectionData = NULL;

static bool8 EC_IsNationalPokedexEnabled(void);
static u16 GetRandomECPokemon(void);
static void PopulateECGroups(void);
static void PopulateAlphabeticalGroups(void);
static u16 GetUnlockedWordsInECGroup(u16);
static u16 GetUnlockedWordsInAlphabeticalGroup(u16);
static bool8 UnlockedECMonOrMove(u16, u8);
static bool32 EC_IsDeoxys(u16 species);
static bool8 IsWordUnlocked(u16 word);

#include "data/easy_chat/easy_chat_groups.h"
#include "data/easy_chat/easy_chat_words_by_letter.h"

static const u8 *const sEasyChatGroupNamePointers[] = {
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

static const u16 sDefaultProfileWords[] = {
    EC_WORD_I_AM,
    EC_WORD_A,
    EC_WORD_POKEMON,
    EC_WORD_FRIEND,
};

static const u16 sDefaultBattleStartWords[] = {
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_READY,
    EC_WORD_QUES,
    EC_WORD_HERE_I_COME,
    EC_WORD_EXCL,
};

static const u16 sDeoxysValue[] = {
    SPECIES_DEOXYS,
};

static bool8 IsECGroupUnlocked(u8 groupId)
{
    switch (groupId)
    {
    case EC_GROUP_TRENDY_SAYING:
        return FALSE;
    case EC_GROUP_EVENTS:
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        return FlagGet(FLAG_SYS_GAME_CLEAR);
    case EC_GROUP_POKEMON:
        return EC_IsNationalPokedexEnabled();
    default:
        return TRUE;
    }
}

static u16 EasyChat_GetNumWordsInGroup(u8 groupId)
{
    if (groupId == EC_GROUP_POKEMON)
        return GetNationalPokedexCount(FLAG_GET_SEEN);

    if (IsECGroupUnlocked(groupId))
        return sEasyChatGroups[groupId].numEnabledWords;

    return 0;
}

static bool8 IsECWordInvalid(u16 easyChatWord)
{
    u16 i;
    u8 groupId;
    u32 index;
    u16 numWords;
    const u16 *list;
    if (easyChatWord == EC_WORD_UNDEFINED)
        return FALSE;

    groupId = EC_GROUP(easyChatWord);
    index = EC_INDEX(easyChatWord);
    if (groupId >= EC_NUM_GROUPS)
        return TRUE;

    numWords = sEasyChatGroups[groupId].numWords;
    switch (groupId)
    {
    case EC_GROUP_POKEMON:
    case EC_GROUP_POKEMON_2:
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        list = sEasyChatGroups[groupId].wordData.valueList;
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

static const u8 *GetEasyChatWord(u8 groupId, u16 index)
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
        return sEasyChatGroups[groupId].wordData.words[index].text;
    }
}

u8 *CopyEasyChatWord(u8 *dest, u16 easyChatWord)
{
    u8 *resultStr;
    if (IsECWordInvalid(easyChatWord))
    {
        resultStr = StringCopy(dest, gText_ThreeQuestionMarks);
    }
    else if (easyChatWord != EC_WORD_UNDEFINED)
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
            if (*src != EC_WORD_UNDEFINED)
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

static u16 GetEasyChatWordStringLength(u16 easyChatWord)
{
    if (easyChatWord == EC_WORD_UNDEFINED)
        return 0;

    if (IsECWordInvalid(easyChatWord))
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

bool8 EC_DoesEasyChatStringFitOnLine(const u16 *easyChatWords, u8 columns, u8 rows, u16 maxLength)
{
    u8 i, j;

    for (i = 0; i < rows; i++)
    {
        u16 totalLength = columns - 1;
        for (j = 0; j < columns; j++)
            totalLength += GetEasyChatWordStringLength(*(easyChatWords++));

        if (totalLength > maxLength)
            return TRUE;
    }

    return FALSE;
}

static u16 GetRandomWordFromGroup(u16 groupId)
{
    u16 index = Random() % sEasyChatGroups[groupId].numWords;
    if (groupId == EC_GROUP_POKEMON_2
     || groupId == EC_GROUP_POKEMON
     || groupId == EC_GROUP_MOVE_1
     || groupId == EC_GROUP_MOVE_2)
    {
        index = sEasyChatGroups[groupId].wordData.valueList[index];
    }

    return EC_WORD(groupId, index);
}

static u16 GetRandomWordFromAnyGroup(u16 groupId)
{
    if (!IsECGroupUnlocked(groupId))
        return EC_WORD_UNDEFINED;

    if (groupId == EC_GROUP_POKEMON)
        return GetRandomECPokemon();

    return GetRandomWordFromGroup(groupId);
}

void ShowEasyChatMessage(void)
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
        if (EC_DoesEasyChatStringFitOnLine(gSaveBlock1Ptr->easyChatBattleStart, 3, 2, 18))
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

void BufferRandomHobbyOrLifestyleString(void)
{
    int groupId = Random() & 1 ? EC_GROUP_HOBBIES : EC_GROUP_LIFESTYLE;
    u16 easyChatWord = GetRandomWordFromAnyGroup(groupId);
    CopyEasyChatWord(gStringVar2, easyChatWord);
}

static bool8 IsTrendySayingUnlocked(u8 additionalPhraseId)
{
    int byteOffset = additionalPhraseId / 8;
    int shift = additionalPhraseId % 8;
    return (gSaveBlock1Ptr->additionalPhrases[byteOffset] >> shift) & 1;
}

void EnableRareWord(u8 additionalPhraseId)
{
    if (additionalPhraseId < 33)
    {
        int byteOffset = additionalPhraseId / 8;
        int shift = additionalPhraseId % 8;
        gSaveBlock1Ptr->additionalPhrases[byteOffset] |= 1 << shift;
    }
}

static u8 GetNumUnlockedTrendySayings(void)
{
    u8 i;
    u8 numAdditionalPhrasesUnlocked;

    for (i = 0, numAdditionalPhrasesUnlocked = 0; i < 33; i++)
    {
        if (IsTrendySayingUnlocked(i))
            numAdditionalPhrasesUnlocked++;
    }

    return numAdditionalPhrasesUnlocked;
}

static u16 UnlockRandomTrendySaying(void)
{
    u16 i;
    u16 additionalPhraseId;
    u8 numAdditionalPhrasesUnlocked = GetNumUnlockedTrendySayings();
    if (numAdditionalPhrasesUnlocked == 33)
        return EC_WORD_UNDEFINED;

    additionalPhraseId = Random() % (33 - numAdditionalPhrasesUnlocked);
    for (i = 0; i < 33; i++)
    {
        if (!IsTrendySayingUnlocked(i))
        {
            if (additionalPhraseId)
            {
                additionalPhraseId--;
            }
            else
            {
                EnableRareWord(i);
                return EC_WORD(EC_GROUP_TRENDY_SAYING, i);
            }
        }
    }

    return EC_WORD_UNDEFINED;
}

static u16 GetRandomUnlockedTrendySaying(void)
{
    u16 i;
    u16 additionalPhraseId = GetNumUnlockedTrendySayings();
    if (additionalPhraseId == 0)
        return EC_WORD_UNDEFINED;

    additionalPhraseId = Random() % additionalPhraseId;
    for (i = 0; i < 33; i++)
    {
        if (IsTrendySayingUnlocked(i))
        {
            if (additionalPhraseId)
                additionalPhraseId--;
            else
                return EC_WORD(EC_GROUP_TRENDY_SAYING, i);
        }
    }

    return EC_WORD_UNDEFINED;
}

static bool8 EC_IsNationalPokedexEnabled(void)
{
    return IsNationalPokedexEnabled();
}

static u16 GetRandomECPokemon(void)
{
    u16 i;
    u16 numWords;
    const u16 *species;
    u16 index = EasyChat_GetNumWordsInGroup(EC_GROUP_POKEMON_2);
    if (index == 0)
        return EC_WORD_UNDEFINED;

    index = Random() % index;
    species = sEasyChatGroups[EC_GROUP_POKEMON_2].wordData.valueList;
    numWords = sEasyChatGroups[EC_GROUP_POKEMON_2].numWords;
    for (i = 0; i < numWords; i++)
    {
        u16 dexNum = SpeciesToNationalPokedexNum(*species);
        if (GetSetPokedexFlag(dexNum, FLAG_GET_SEEN))
        {
            if (index)
                index--;
            else
                return EC_WORD(EC_GROUP_POKEMON_2, *species);
        }

        species++;
    }

    return EC_WORD_UNDEFINED;
}

void InitEasyChatPhrases(void)
{
    u16 i, j;

    for (i = 0; i < 4; i++)
        gSaveBlock1Ptr->easyChatProfile[i] = sDefaultProfileWords[i];

    for (i = 0; i < 6; i++)
        gSaveBlock1Ptr->easyChatBattleStart[i] = sDefaultBattleStartWords[i];

    for (i = 0; i < 6; i++)
    {
        gSaveBlock1Ptr->easyChatBattleWon[i] = EC_WORD_UNDEFINED;
        gSaveBlock1Ptr->easyChatBattleLost[i] = EC_WORD_UNDEFINED;
    }

    for (i = 0; i < MAIL_COUNT; i++)
    {
        for (j = 0; j < MAIL_WORDS_COUNT; j++)
            gSaveBlock1Ptr->mail[i].words[j] = EC_WORD_UNDEFINED;
    }

#ifndef UBFIX
    // BUG: This is supposed to clear 64 bits, but this loop is clearing 64 bytes.
    // However, this bug has no resulting effect on gameplay because only the
    // Mauville old man data is corrupted, which is initialized directly after
    // this function is called when starting a new game.
    for (i = 0; i < 64; i++)
        gSaveBlock1Ptr->additionalPhrases[i] = 0;
#else
    for (i = 0; i < NELEMS(gSaveBlock1Ptr->additionalPhrases); i++)
        gSaveBlock1Ptr->additionalPhrases[i] = 0;
#endif
}

void InitQuestionnaireWords(void)
{
    s32 i;
    u16 *ptr = GetQuestionnaireWordsPtr();
    for (i = 0; i < NUM_QUESTIONNAIRE_WORDS; i++)
        ptr[i] = EC_WORD_UNDEFINED;
}

bool8 InitEasyChatSelection(void)
{
    sEasyChatSelectionData = Alloc(sizeof(*sEasyChatSelectionData));
    if (sEasyChatSelectionData == NULL)
        return FALSE;

    PopulateECGroups();
    PopulateAlphabeticalGroups();
    return TRUE;
}

void DestroyEasyChatSelectionData(void)
{
    if (sEasyChatSelectionData != NULL)
        Free(sEasyChatSelectionData);
}

static void PopulateECGroups(void)
{
    int i;

    sEasyChatSelectionData->numGroups = 0;
    if (GetNationalPokedexCount(FLAG_GET_SEEN))
        sEasyChatSelectionData->groups[sEasyChatSelectionData->numGroups++] = EC_GROUP_POKEMON;

    for (i = EC_GROUP_TRAINER; i <= EC_GROUP_ADJECTIVES; i++)
        sEasyChatSelectionData->groups[sEasyChatSelectionData->numGroups++] = i;

    if (FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        sEasyChatSelectionData->groups[sEasyChatSelectionData->numGroups++] = EC_GROUP_EVENTS;
        sEasyChatSelectionData->groups[sEasyChatSelectionData->numGroups++] = EC_GROUP_MOVE_1;
        sEasyChatSelectionData->groups[sEasyChatSelectionData->numGroups++] = EC_GROUP_MOVE_2;
    }

    if (IsNationalPokedexEnabled())
        sEasyChatSelectionData->groups[sEasyChatSelectionData->numGroups++] = EC_GROUP_POKEMON_2;
}

u8 GetNumDisplayableGroups(void)
{
    return sEasyChatSelectionData->numGroups;
}

u8 GetSelectedGroupByIndex(u8 index)
{
    if (index >= sEasyChatSelectionData->numGroups)
        return EC_NUM_GROUPS;
    else
        return sEasyChatSelectionData->groups[index];
}

// Unused
static u8 *BufferEasyChatWordGroupName(u8 *dest, u8 groupId, u16 totalChars)
{
    u16 i;
    u8 *str = StringCopy(dest, sEasyChatGroupNamePointers[groupId]);
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
    return sEasyChatGroupNamePointers[groupId];
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

static void PopulateAlphabeticalGroups(void)
{
    static int i;
    static int j;
    static int k;
    static int index;
    static int numWords;
    static int numToProcess;
    static const u16 *words;

    for (i = 0; i < 27; i++)
    {
        numWords = sEasyChatWordsByLetterPointers[i].numWords;
        words = sEasyChatWordsByLetterPointers[i].words;
        sEasyChatSelectionData->alphabeticalGroups[i] = 0;
        index = 0;
        for (j = 0; j < numWords; )
        {
            if (*words == EC_WORD_UNDEFINED)
            {
                words++;
                numToProcess = *words++;
                j += 2;
            }
            else
            {
                numToProcess = 1;
            }

            for (k = 0; k < numToProcess; k++)
            {
                if (IsWordUnlocked(words[k]))
                {
                    sEasyChatSelectionData->alphabeticalWordsByGroup[i][index++] = words[k];
                    sEasyChatSelectionData->alphabeticalGroups[i]++;
                    break;
                }
            }

            words += numToProcess;
            j += numToProcess;
        }
    }
}

void GetUnlockedECWords(bool32 isAlphabetical, u16 groupId)
{
    if (!isAlphabetical)
        sEasyChatSelectionData->totalWords = GetUnlockedWordsInECGroup(groupId);
    else
        sEasyChatSelectionData->totalWords = GetUnlockedWordsInAlphabeticalGroup(groupId);
}

u16 GetDisplayedWordByIndex(u16 index)
{
    if (index >= sEasyChatSelectionData->totalWords)
        return EC_WORD_UNDEFINED;
    else
        return sEasyChatSelectionData->allWords[index];
}

u16 GetNumDisplayedWords(void)
{
    return sEasyChatSelectionData->totalWords;
}

static u16 GetUnlockedWordsInECGroup(u16 groupId)
{
    u16 i;
    u16 totalWords;
    const u16 *list;
    const struct EasyChatWordInfo * wordInfo;
    u16 numWords = sEasyChatGroups[groupId].numWords;

    if (groupId == EC_GROUP_POKEMON_2 || groupId == EC_GROUP_POKEMON
     || groupId == EC_GROUP_MOVE_1  || groupId == EC_GROUP_MOVE_2)
    {
        list = sEasyChatGroups[groupId].wordData.valueList;
        for (i = 0, totalWords = 0; i < numWords; i++)
        {
            if (UnlockedECMonOrMove(list[i], groupId))
                sEasyChatSelectionData->allWords[totalWords++] = EC_WORD(groupId, list[i]);
        }

        return totalWords;
    }
    else
    {
        wordInfo = sEasyChatGroups[groupId].wordData.words;
        for (i = 0, totalWords = 0; i < numWords; i++)
        {
            u16 alphabeticalOrder = wordInfo[i].alphabeticalOrder;
            if (UnlockedECMonOrMove(alphabeticalOrder, groupId))
                sEasyChatSelectionData->allWords[totalWords++] = EC_WORD(groupId, alphabeticalOrder);
        }

        return totalWords;
    }
}

static u16 GetUnlockedWordsInAlphabeticalGroup(u16 alphabeticalGroup)
{
    u16 i;
    u16 totalWords;

    for (i = 0, totalWords = 0; i < sEasyChatSelectionData->alphabeticalGroups[alphabeticalGroup]; i++)
        sEasyChatSelectionData->allWords[totalWords++] = sEasyChatSelectionData->alphabeticalWordsByGroup[alphabeticalGroup][i];

    return totalWords;
}

static bool8 IsGroupSelectable(u8 groupIdx)
{
    int i;
    for (i = 0; i < sEasyChatSelectionData->numGroups; i++)
    {
        if (sEasyChatSelectionData->groups[i] == groupIdx)
            return TRUE;
    }

    return FALSE;
}

static bool8 UnlockedECMonOrMove(u16 wordIndex, u8 groupId)
{
    switch (groupId)
    {
    case EC_GROUP_POKEMON:
        return GetSetPokedexFlag(SpeciesToNationalPokedexNum(wordIndex), FLAG_GET_SEEN);
    case EC_GROUP_POKEMON_2:
        if (EC_IsDeoxys(wordIndex))
            return GetSetPokedexFlag(SpeciesToNationalPokedexNum(wordIndex), FLAG_GET_SEEN);
        return TRUE;
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        return TRUE;
    default:
        return sEasyChatGroups[groupId].wordData.words[wordIndex].enabled;
    }
}

static bool32 EC_IsDeoxys(u16 species)
{
    u32 i;
    for (i = 0; i < NELEMS(sDeoxysValue); i++)
    {
        if (sDeoxysValue[i] == species)
            return TRUE;
    }

    return FALSE;
}

static bool8 IsWordUnlocked(u16 easyChatWord)
{
    u8 groupId = EC_GROUP(easyChatWord);
    u32 index = EC_INDEX(easyChatWord);
    if (!IsGroupSelectable(groupId))
        return FALSE;
    else
        return UnlockedECMonOrMove(index, groupId);
}
