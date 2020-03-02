#ifndef GUARD_TRAINER_CARD_H
#define GUARD_TRAINER_CARD_H

#include "constants/trainer_card.h"

struct TrainerCardRSE
{
    /*0x00*/ u8 gender;
    /*0x01*/ u8 stars;
    /*0x02*/ bool8 hasPokedex;
    /*0x03*/ bool8 caughtAllHoenn;
    /*0x04*/ bool8 hasAllPaintings;
    /*0x06*/ u16 hofDebutHours;
    /*0x08*/ u16 hofDebutMinutes;
    /*0x0A*/ u16 hofDebutSeconds;
    /*0x0C*/ u16 caughtMonsCount;
    /*0x0E*/ u16 trainerId;
    /*0x10*/ u16 playTimeHours;
    /*0x12*/ u16 playTimeMinutes;
    /*0x14*/ u16 linkBattleWins;
    /*0x16*/ u16 linkBattleLosses;
    /*0x18*/ u16 battleTowerWins;
    /*0x1A*/ u16 battleTowerStraightWins;
    /*0x1C*/ u16 contestsWithFriends;
    /*0x1E*/ u16 pokeblocksWithFriends;
    /*0x20*/ u16 pokemonTrades;
    /*0x24*/ u32 money;
    /*0x28*/ u16 easyChatProfile[TRAINER_CARD_PROFILE_LENGTH];
    /*0x30*/ u8 playerName[PLAYER_NAME_LENGTH + 1];
};

struct TrainerCard
{
    /*0x00*/ struct TrainerCardRSE rse;
    /*0x38*/ u8 version;
    /*0x3A*/ bool16 hasAllFrontierSymbols;
    /*0x3C*/ u32 berryCrushPoints;
    /*0x40*/ u32 unionRoomNum;
    /*0x44*/ u32 berriesPicked;
    /*0x48*/ u32 jumpsInRow;
    /*0x4C*/ bool8 shouldDrawStickers;
    /*0x4D*/ bool8 hasAllMons;
    /*0x4E*/ u8 monIconTint;
    /*0x4F*/ u8 facilityClass;
    /*0x50*/ u8 stickers[TRAINER_CARD_STICKER_TYPES];
    /*0x54*/ u16 monSpecies[PARTY_SIZE];
};

extern struct TrainerCard gTrainerCards[4];

void ShowPlayerTrainerCard(void (*callback)(void));
void ShowTrainerCardInLink(u8 whoseCard, MainCallback callback);
u8 GetTrainerCardStars(u8 cardId);
void TrainerCard_GenerateCardForLinkPlayer(struct TrainerCard *trainerCard);

#endif //GUARD_TRAINER_CARD_H
