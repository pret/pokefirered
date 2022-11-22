#ifndef GUARD_MYSTERY_GIFT_H
#define GUARD_MYSTERY_GIFT_H

#include "global.h"
#include "main.h"
#include "constants/mystery_gift.h"

#define CARD_STAT_BATTLES_WON   0
#define CARD_STAT_BATTLES_LOST  1
#define CARD_STAT_NUM_TRADES    2
#define CARD_STAT_NUM_STAMPS    3
#define CARD_STAT_MAX_STAMPS    4

enum {
    NEWS_INPUT_A,
    NEWS_INPUT_B,
    NEWS_INPUT_SCROLL_UP,
    NEWS_INPUT_SCROLL_DOWN,
    NEWS_INPUT_NONE = 0xFF
};

struct MysteryGiftLinkGameData
{
    u32 unk_00;
    u16 unk_04;
    u32 unk_08;
    u16 unk_0C;
    u32 unk_10;
    u16 flagId;
    u16 questionnaireWords[NUM_QUESTIONNAIRE_WORDS];
    struct WonderCardMetadata cardMetadata;
    u8 maxStamps;
    u8 playerName[PLAYER_NAME_LENGTH];
    u8 playerTrainerId[TRAINER_ID_LENGTH];
    u16 easyChatProfile[EASY_CHAT_BATTLE_WORDS_COUNT];
    u8 gameCode[GAME_CODE_LENGTH];
    u8 version;
};

struct WonderGraphics
{
    u8 titleTextPal:4;
    u8 bodyTextPal:4;
    u8 footerTextPal:4;
    u8 stampShadowPal:4;
    const u8 * tiles;
    const u8 * map;
    const u16 * pal;
};

extern const u16 gCard1Pal[];
extern const u16 gCard2Pal[];
extern const u16 gCard3Pal[];
extern const u16 gCard4Pal[];
extern const u16 gCard5Pal[];

struct WonderNews * GetSavedWonderNews(void);
struct WonderCard * GetSavedWonderCard(void);
struct WonderCardMetadata * GetSavedWonderCardMetadata(void);
struct WonderNewsMetadata * GetSavedWonderNewsMetadata(void);
bool32 SaveWonderNews(const struct WonderNews * news);
bool32 ValidateSavedWonderNews(void);
bool32 ValidateSavedWonderCard(void);
bool32 IsWonderNewsSameAsSaved(const u8 * news);
bool32 SaveWonderCard(const struct WonderCard * card);
void DisableWonderCardSending(struct WonderCard * card);
bool32 MysteryGift_TrySaveStamp(const u16 * stamp);
void MysteryGift_LoadLinkGameData(struct MysteryGiftLinkGameData * data);
bool32 MysteryGift_ValidateLinkGameData(const struct MysteryGiftLinkGameData * data);
u32 MysteryGift_CompareCardFlags(const u16 * flagId, const struct MysteryGiftLinkGameData * data, const void *unused);
u32 MysteryGift_CheckStamps(const u16 * stamp, const struct MysteryGiftLinkGameData * data, const void *unused);
bool32 MysteryGift_DoesQuestionnaireMatch(const struct MysteryGiftLinkGameData * data, const u16 * words);
u16 MysteryGift_GetCardStatFromLinkData(const struct MysteryGiftLinkGameData * data, u32 stat);
bool32 WonderCard_Init(struct WonderCard * card, struct WonderCardMetadata * metadata);
bool32 WonderNews_Init(const struct WonderNews * news);
s32 WonderCard_Enter(void);
s32 WonderNews_Enter(void);
void ClearSavedWonderCardAndRelated(void);
void ClearSavedWonderNewsAndRelated(void);
void WonderCard_Destroy(void);
void WonderNews_Destroy(void);
s32 WonderCard_Exit(bool32 flag);
s32 WonderNews_Exit(bool32 flag);
bool32 IsSavedWonderCardGiftNotReceived(void);
void WonderNews_AddScrollIndicatorArrowPair(void);
void WonderNews_RemoveScrollIndicatorArrowPair(void);
bool32 IsSendingSavedWonderNewsAllowed(void);
bool32 IsSendingSavedWonderCardAllowed(void);
u32 WonderNews_GetInput(u16 input);
void ClearMysteryGift(void);
u16 MysteryGift_GetCardStat(u32 stat);
void MysteryGift_TryIncrementStat(u32 stat, u32 trainerId);
u16 *GetQuestionnaireWordsPtr(void);
void MysteryGift_DisableStats(void);
bool32 MysteryGift_TryEnableStatsByFlagId(u16 flagId);
u16 GetWonderCardFlagId(void);

#endif // GUARD_MYSTERY_GIFT_H
