#ifndef GUARD_EASYCHAT_H
#define GUARD_EASYCHAT_H

#include "global.h"
#include "constants/easy_chat.h"

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
u8 *CopyEasyChatWord(u8 *dest, u16 word);
u8 *ConvertEasyChatWordsToString(u8 *dest, const u16 *src, u16 length1, u16 length2);
void sub_80BDE28(void);
void InitEasyChatPhrases(void);
void EnableRareWord(u8);
bool8 sub_80BDE44(void);
void sub_80BDE70(void);
u8 sub_80BDF44(u8);
void sub_80BE16C(int, u16);
u16 sub_80BE1D4(void);
u16 sub_80BE19C(u16);
const u8 *GetEasyChatWordGroupName(u8);
u8 *CopyEasyChatWordPadded(u8 *, u16, u16);

#endif // GUARD_EASYCHAT_H
