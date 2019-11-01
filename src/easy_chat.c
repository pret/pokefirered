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
#include "mail.h"
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

struct Unk203A120
{
    u16 unk0;
    u16 unk2[EC_NUM_GROUPS];
    u16 unk2E[27];
    u16 unk64[27][270];
    u8 filler3958[0x2C];
    u16 unk3984[0x10E];
    u16 unk3BA0;
}; /*size = 0x3BA4*/

static EWRAM_DATA struct Unk203A120 * gUnknown_20399BC = NULL;

static bool8 sub_80BDCA8(void);
static u16 GetRandomECPokemon(void);
static void sub_80BDE88(void);
static void sub_80BDFF8(void);
static u16 sub_80BE1E8(u16);
static u16 sub_80BE2F8(u16);
static bool8 sub_80BE3A4(u16, u8);
static int sub_80BE418(u16 species);
static u8 sub_80BE440(u16 word);

#include "data/easy_chat/easy_chat_groups.h"
#include "data/easy_chat/easy_chat_words_by_letter.h"

static const u8 *const gEasyChatGroupNamePointers[] = {
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

static const u16 gUnknown_83EE004[] = {
    SPECIES_DEOXYS,
};

static bool8 sub_80BD718(u8 groupId)
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
        return sub_80BDCA8();
    default:
        return TRUE;
    }
}

static u16 EasyChat_GetNumWordsInGroup(u8 groupId)
{
    if (groupId == EC_GROUP_POKEMON)
        return GetNationalPokedexCount(FLAG_GET_SEEN);

    if (sub_80BD718(groupId))
        return gEasyChatGroups[groupId].numEnabledWords;

    return 0;
}

static bool8 sub_80BD78C(u16 easyChatWord)
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
        return gEasyChatGroups[groupId].wordData.words[index].text;
    }
}

u8 *CopyEasyChatWord(u8 *dest, u16 easyChatWord)
{
    u8 *resultStr;
    if (sub_80BD78C(easyChatWord))
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

static u16 GetEasyChatWordStringLength(u16 easyChatWord)
{
    if (easyChatWord == 0xFFFF)
        return 0;

    if (sub_80BD78C(easyChatWord))
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

bool8 sub_80BD974(const u16 *easyChatWords, u8 arg1, u8 arg2, u16 arg3)
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

static u16 sub_80BD9E8(u16 groupId)
{
    u16 index = Random() % gEasyChatGroups[groupId].numWords;
    if (groupId == EC_GROUP_POKEMON_2
     || groupId == EC_GROUP_POKEMON
     || groupId == EC_GROUP_MOVE_1
     || groupId == EC_GROUP_MOVE_2)
    {
        index = gEasyChatGroups[groupId].wordData.valueList[index];
    }

    return EC_WORD(groupId, index);
}

static u16 sub_80BDA40(u16 groupId)
{
    if (!sub_80BD718(groupId))
        return 0xFFFF;

    if (groupId == EC_GROUP_POKEMON)
        return GetRandomECPokemon();

    return sub_80BD9E8(groupId);
}

void sub_80BDA7C(void)
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
        if (sub_80BD974(gSaveBlock1Ptr->easyChatBattleStart, 3, 2, 18))
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
    u16 easyChatWord = sub_80BDA40(groupId);
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
        return 0xFFFF;

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

    return 0xFFFF;
}

static u16 GetRandomUnlockedTrendySaying(void)
{
    u16 i;
    u16 additionalPhraseId = GetNumUnlockedTrendySayings();
    if (additionalPhraseId == 0)
        return 0xFFFF;

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

    return 0xFFFF;
}

static bool8 sub_80BDCA8(void)
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
        return 0xFFFF;

    index = Random() % index;
    species = gEasyChatGroups[EC_GROUP_POKEMON_2].wordData.valueList;
    numWords = gEasyChatGroups[EC_GROUP_POKEMON_2].numWords;
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
    {
        gSaveBlock1Ptr->easyChatBattleWon[i] = 0xFFFF;
        gSaveBlock1Ptr->easyChatBattleLost[i] = 0xFFFF;
    }

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

void sub_80BDE28(void)
{
    s32 i;
    u16 *ptr = sub_8143DA8();
    for (i = 0; i < 4; i++)
        ptr[i] = 0xFFFF;
}

bool8 sub_80BDE44(void)
{
    gUnknown_20399BC = Alloc(sizeof(*gUnknown_20399BC));
    if (!gUnknown_20399BC)
        return FALSE;

    sub_80BDE88();
    sub_80BDFF8();
    return TRUE;
}

void sub_80BDE70(void)
{
    if (gUnknown_20399BC != NULL)
        Free(gUnknown_20399BC);
}

static void sub_80BDE88(void)
{
    int i;

    gUnknown_20399BC->unk0 = 0;
    if (GetNationalPokedexCount(FLAG_GET_SEEN))
        gUnknown_20399BC->unk2[gUnknown_20399BC->unk0++] = EC_GROUP_POKEMON;

    for (i = EC_GROUP_TRAINER; i <= EC_GROUP_ADJECTIVES; i++)
        gUnknown_20399BC->unk2[gUnknown_20399BC->unk0++] = i;

    if (FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        gUnknown_20399BC->unk2[gUnknown_20399BC->unk0++] = EC_GROUP_EVENTS;
        gUnknown_20399BC->unk2[gUnknown_20399BC->unk0++] = EC_GROUP_MOVE_1;
        gUnknown_20399BC->unk2[gUnknown_20399BC->unk0++] = EC_GROUP_MOVE_2;
    }

    if (IsNationalPokedexEnabled())
        gUnknown_20399BC->unk2[gUnknown_20399BC->unk0++] = EC_GROUP_POKEMON_2;
}

u8 sub_80BDF38(void)
{
    return gUnknown_20399BC->unk0;
}

u8 sub_80BDF44(u8 index)
{
    if (index >= gUnknown_20399BC->unk0)
        return EC_NUM_GROUPS;
    else
        return gUnknown_20399BC->unk2[index];
}

static u8 *unref_sub_80BDF6C(u8 *dest, u8 groupId, u16 totalChars)
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

static void sub_80BDFF8(void)
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
        numWords = gEasyChatWordsByLetterPointers[i].numWords;
        words = gEasyChatWordsByLetterPointers[i].words;
        gUnknown_20399BC->unk2E[i] = 0;
        index = 0;
        for (j = 0; j < numWords; )
        {
            if (*words == 0xFFFF)
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
                if (sub_80BE440(words[k]))
                {
                    gUnknown_20399BC->unk64[i][index++] = words[k];
                    gUnknown_20399BC->unk2E[i]++;
                    break;
                }
            }

            words += numToProcess;
            j += numToProcess;
        }
    }
}

void sub_80BE16C(int arg0, u16 groupId)
{
    if (!arg0)
        gUnknown_20399BC->unk3BA0 = sub_80BE1E8(groupId);
    else
        gUnknown_20399BC->unk3BA0 = sub_80BE2F8(groupId);
}

u16 sub_80BE19C(u16 arg0)
{
    if (arg0 >= gUnknown_20399BC->unk3BA0)
        return 0xFFFF;
    else
        return gUnknown_20399BC->unk3984[arg0];
}

u16 sub_80BE1D4(void)
{
    return gUnknown_20399BC->unk3BA0;
}

static u16 sub_80BE1E8(u16 groupId)
{
    u16 i;
    u16 totalWords;
    const u16 *list;
    const struct EasyChatWordInfo * wordInfo;
    u16 numWords = gEasyChatGroups[groupId].numWords;

    if (groupId == EC_GROUP_POKEMON_2 || groupId == EC_GROUP_POKEMON
     || groupId == EC_GROUP_MOVE_1  || groupId == EC_GROUP_MOVE_2)
    {
        list = gEasyChatGroups[groupId].wordData.valueList;
        for (i = 0, totalWords = 0; i < numWords; i++)
        {
            if (sub_80BE3A4(list[i], groupId))
                gUnknown_20399BC->unk3984[totalWords++] = EC_WORD(groupId, list[i]);
        }

        return totalWords;
    }
    else
    {
        wordInfo = gEasyChatGroups[groupId].wordData.words;
        for (i = 0, totalWords = 0; i < numWords; i++)
        {
            u16 alphabeticalOrder = wordInfo[i].alphabeticalOrder;
            if (sub_80BE3A4(alphabeticalOrder, groupId))
                gUnknown_20399BC->unk3984[totalWords++] = EC_WORD(groupId, alphabeticalOrder);
        }

        return totalWords;
    }
}

static u16 sub_80BE2F8(u16 alphabeticalGroup)
{
    u16 i;
    u16 totalWords;

    for (i = 0, totalWords = 0; i < gUnknown_20399BC->unk2E[alphabeticalGroup]; i++)
        gUnknown_20399BC->unk3984[totalWords++] = gUnknown_20399BC->unk64[alphabeticalGroup][i];

    return totalWords;
}

static bool8 sub_80BE36C(u8 arg0)
{
    int i;
    for (i = 0; i < gUnknown_20399BC->unk0; i++)
    {
        if (gUnknown_20399BC->unk2[i] == arg0)
            return TRUE;
    }

    return FALSE;
}

static bool8 sub_80BE3A4(u16 wordIndex, u8 groupId)
{
    switch (groupId)
    {
    case EC_GROUP_POKEMON:
        return GetSetPokedexFlag(SpeciesToNationalPokedexNum(wordIndex), FLAG_GET_SEEN);
    case EC_GROUP_POKEMON_2:
        if (sub_80BE418(wordIndex))
            return GetSetPokedexFlag(SpeciesToNationalPokedexNum(wordIndex), FLAG_GET_SEEN);
        return TRUE;
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        return TRUE;
    default:
        return gEasyChatGroups[groupId].wordData.words[wordIndex].enabled;
    }
}

static int sub_80BE418(u16 species)
{
    u32 i;
    for (i = 0; i < ARRAY_COUNT(gUnknown_83EE004); i++)
    {
        if (gUnknown_83EE004[i] == species)
            return TRUE;
    }

    return FALSE;
}

static u8 sub_80BE440(u16 easyChatWord)
{
    u8 groupId = EC_GROUP(easyChatWord);
    u32 index = EC_INDEX(easyChatWord);
    if (!sub_80BE36C(groupId))
        return FALSE;
    else
        return sub_80BE3A4(index, groupId);
}

