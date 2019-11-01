#include "easy_chat.h"

#include "easy_chat_group_pokemon.h"
#include "easy_chat_group_trainer.h"
#include "easy_chat_group_status.h"
#include "easy_chat_group_battle.h"
#include "easy_chat_group_greetings.h"
#include "easy_chat_group_people.h"
#include "easy_chat_group_voices.h"
#include "easy_chat_group_speech.h"
#include "easy_chat_group_endings.h"
#include "easy_chat_group_feelings.h"
#include "easy_chat_group_conditions.h"
#include "easy_chat_group_actions.h"
#include "easy_chat_group_lifestyle.h"
#include "easy_chat_group_hobbies.h"
#include "easy_chat_group_time.h"
#include "easy_chat_group_misc.h"
#include "easy_chat_group_adjectives.h"
#include "easy_chat_group_events.h"
#include "easy_chat_group_move_1.h"
#include "easy_chat_group_move_2.h"
#include "easy_chat_group_trendy_saying.h"
#include "easy_chat_group_pokemon2.h"

static const struct EasyChatGroup sEasyChatGroups[] = {
    {
        .wordData = {.valueList = sEasyChatGroup_Pokemon},
        .numWords = 202,
        .numEnabledWords = 202
    },
    {
        .wordData = {.words = sEasyChatGroup_Trainer},
        .numWords = 26,
        .numEnabledWords = 25
    },
    {
        .wordData = {.words = sEasyChatGroup_Status},
        .numWords = 109,
        .numEnabledWords = 109
    },
    {
        .wordData = {.words = sEasyChatGroup_Battle},
        .numWords = 63,
        .numEnabledWords = 63
    },
    {
        .wordData = {.words = sEasyChatGroup_Greetings},
        .numWords = 42,
        .numEnabledWords = 42
    },
    {
        .wordData = {.words = sEasyChatGroup_People},
        .numWords = 75,
        .numEnabledWords = 75
    },
    {
        .wordData = {.words = sEasyChatGroup_Voices},
        .numWords = 63,
        .numEnabledWords = 63
    },
    {
        .wordData = {.words = sEasyChatGroup_Speech},
        .numWords = 60,
        .numEnabledWords = 60
    },
    {
        .wordData = {.words = sEasyChatGroup_Endings},
        .numWords = 69,
        .numEnabledWords = 69
    },
    {
        .wordData = {.words = sEasyChatGroup_Feelings},
        .numWords = 69,
        .numEnabledWords = 69
    },
    {
        .wordData = {.words = sEasyChatGroup_Conditions},
        .numWords = 69,
        .numEnabledWords = 69
    },
    {
        .wordData = {.words = sEasyChatGroup_Actions},
        .numWords = 78,
        .numEnabledWords = 78
    },
    {
        .wordData = {.words = sEasyChatGroup_Lifestyle},
        .numWords = 45,
        .numEnabledWords = 45
    },
    {
        .wordData = {.words = sEasyChatGroup_Hobbies},
        .numWords = 54,
        .numEnabledWords = 54
    },
    {
        .wordData = {.words = sEasyChatGroup_Time},
        .numWords = 45,
        .numEnabledWords = 45
    },
    {
        .wordData = {.words = sEasyChatGroup_Misc},
        .numWords = 42,
        .numEnabledWords = 42
    },
    {
        .wordData = {.words = sEasyChatGroup_Adjectives},
        .numWords = 36,
        .numEnabledWords = 36
    },
    {
        .wordData = {.words = sEasyChatGroup_Events},
        .numWords = 28,
        .numEnabledWords = 19
    },
    {
        .wordData = {.valueList = sEasyChatGroup_Move1},
        .numWords = 154,
        .numEnabledWords = 154
    },
    {
        .wordData = {.valueList = sEasyChatGroup_Move2},
        .numWords = 200,
        .numEnabledWords = 200
    },
    {
        .wordData = {.words = sEasyChatGroup_TrendySaying},
        .numWords = 33,
        .numEnabledWords = 0
    },
    {
        .wordData = {.valueList = sEasyChatGroup_Pokemon2},
        .numWords = 251,
        .numEnabledWords = 251
    },
};
