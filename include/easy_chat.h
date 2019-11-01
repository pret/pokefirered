#ifndef GUARD_EASYCHAT_H
#define GUARD_EASYCHAT_H

#include "global.h"

struct EasyChatWordInfo
{
    const u8 *text;
    int alphabeticalOrder;
    int enabled;
};

typedef union
{
    const u16 *valueList;
    const struct EasyChatWordInfo *words;
} EasyChatGroupWordData;

struct EasyChatGroup
{
    EasyChatGroupWordData wordData;
    u16 numWords;
    u16 numEnabledWords;
};

struct EasyChatWordsByLetter
{
    const u16 *words;
    int numWords;
};

void InitEasyChatPhrases(void);
void easy_chat_input_maybe(void);
void CopyEasyChatWord(u8 *dest, u16 word);
bool32 sub_811F8D8(u16 word);
void InitializeEasyChatWordArray(u16 *words, u16 length);
void ConvertEasyChatWordsToString(u8 *dest, const u16 *src, u16 length1, u16 length2);
bool8 ECWord_CheckIfOutsideOfValidRange(u16 word);
void sub_80BDE28(void);
void InitEasyChatPhrases(void);
void EnableRareWord(u8);

#endif // GUARD_EASYCHAT_H
