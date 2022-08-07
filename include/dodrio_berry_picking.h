#ifndef GUARD_DODRIO_BERRY_PICKING_H
#define GUARD_DODRIO_BERRY_PICKING_H

// Berries fall in predefined columns.
// A total of 10 are available, though fewer will be used with < 5 players
// The 11th column is a repeat of the 1st column wrapped around, so only
// the values 0-9 are unique 'valid' columns
#define NUM_BERRY_COLUMNS 11

struct DodrioGame_Berries
{
    u8 ids[NUM_BERRY_COLUMNS];
    u8 fallDist[NUM_BERRY_COLUMNS];
};

struct DodrioGame_PlayerCommData
{
    u8 pickState;
    bool8 ALIGNED(4) ateBerry;
    bool8 ALIGNED(4) missedBerry;
};

struct DodrioGame_Player
{
    u8 name[16];
    bool32 receivedGameStatePacket; // Never read
    struct DodrioGame_Berries berries;
    struct DodrioGame_PlayerCommData comm;
    u32 unused;
}; // size = 0x3C

void StartDodrioBerryPicking(u16 species, MainCallback callback);
u32 sub_815A950(u32 unused, struct DodrioGame_Player *arg0, struct DodrioGame_PlayerCommData *arg1, struct DodrioGame_PlayerCommData *arg2, struct DodrioGame_PlayerCommData *arg3, struct DodrioGame_PlayerCommData *arg4, struct DodrioGame_PlayerCommData *arg5, u8 *arg6, u32 *arg7, u32 *arg8);
u32 sub_815AB04(u32 arg0, u8 *arg1);
bool32 sub_815AB60(u32 a0);
void sub_815A61C(struct DodrioGame_Player *arg0, struct DodrioGame_PlayerCommData *arg1, struct DodrioGame_PlayerCommData *arg2, struct DodrioGame_PlayerCommData *arg3, struct DodrioGame_PlayerCommData *arg4, struct DodrioGame_PlayerCommData *arg5, u8 arg6, u32 arg7, u32 arg8);
void sub_815A5BC(s32 a0);
void sub_815AAD8(u8 a0);
void sub_815AB3C(u32 a0);
u8 sub_815A5E8(s32 a0);
void ShowDodrioBerryPickingRecords(void);
void IsDodrioInParty(void);

#endif //GUARD_DODRIO_BERRY_PICKING_H
