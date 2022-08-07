#include "global.h"
#include "dodrio_berry_picking.h"
#include "link.h"
#include "link_rfu.h"

enum {
    PACKET_READY_START = 1,
    PACKET_GAME_STATE,
    PACKET_PICK_STATE,
    PACKET_READY_END,
};

struct ReadyToStartPacket
{
    u8 id;
    bool8 ALIGNED(4) ready;
};

struct GameStatePacket
{
    u8 id;
    u8 fallDist_Col0:4;
    u8 fallDist_Col1:4;
    u16 fallDist_Col2:4;
    u16 fallDist_Col3:4;
    u16 fallDist_Col4:4;
    u16 fallDist_Col5:4;
    u16 fallDist_Col6:4;
    u16 fallDist_Col7:4;
    u16 fallDist_Col8:4;
    u16 fallDist_Col9:4;
    u16 berryId_Col0:2;
    u16 berryId_Col1:2;
    u16 berryId_Col2:2;
    u16 berryId_Col3:2;
    u16 berryId_Col4:2;
    u16 berryId_Col5:2;
    u16 berryId_Col6:2;
    u16 berryId_Col7:2;
    u8 berryId_Col8:2;
    u8 berryId_Col9:2;
    u8 pickState_Player1:2;
    u8 pickState_Player2:2;
    u8 pickState_Player3:2;
    u8 pickState_Player4:2;
    u8 pickState_Player5:2;
    bool8 ateBerry_Player1:1;
    bool8 ateBerry_Player2:1;
    bool8 ateBerry_Player3:1;
    bool8 ateBerry_Player4:1;
    bool8 ateBerry_Player5:1;
    u8 numGraySquares:5;
    bool8 allReadyToEnd:1;
    bool8 berriesFalling:1;
    bool8 missedBerry_Player1:1;
    bool8 missedBerry_Player2:1;
    bool8 missedBerry_Player3:1;
    bool8 missedBerry_Player4:1;
    bool8 missedBerry_Player5:1;
};

struct PickStatePacket
{
    u8 id;
    u8 ALIGNED(4) pickState;
};

struct ReadyToEndPacket
{
    u8 id;
    bool32 ready;
};

void SendPacket_ReadyToStart(bool32 ready)
{
    struct ReadyToStartPacket packet;
    packet.id = PACKET_READY_START;
    packet.ready = ready;
    Rfu_SendPacket(&packet);
}

bool8 RecvPacket_ReadyToStart(s32 playerId)
{
    struct ReadyToStartPacket *packet;

    if ((gRecvCmds[0][0] & RFUCMD_MASK) != RFUCMD_SEND_PACKET)
        return FALSE;

    packet = (void *)&gRecvCmds[playerId][1];
    if (packet->id == PACKET_READY_START)
        return packet->ready;

    return FALSE;
}

void SendPacket_GameState(struct DodrioGame_Player *player,
                          struct DodrioGame_PlayerCommData *player1,
                          struct DodrioGame_PlayerCommData *player2,
                          struct DodrioGame_PlayerCommData *player3,
                          struct DodrioGame_PlayerCommData *player4,
                          struct DodrioGame_PlayerCommData *player5,
                          u8 numGraySquares,
                          bool32 berriesFalling,
                          bool32 allReadyToEnd)
{
    struct GameStatePacket packet;
    struct DodrioGame_Berries *berries = &player->berries;

    packet.id = PACKET_GAME_STATE;
    packet.fallDist_Col0 = berries->fallDist[0];
    packet.fallDist_Col1 = berries->fallDist[1];
    packet.fallDist_Col2 = berries->fallDist[2];
    packet.fallDist_Col3 = berries->fallDist[3];
    packet.fallDist_Col4 = berries->fallDist[4];
    packet.fallDist_Col5 = berries->fallDist[5];
    packet.fallDist_Col6 = berries->fallDist[6];
    packet.fallDist_Col7 = berries->fallDist[7];
    packet.fallDist_Col8 = berries->fallDist[8];
    packet.fallDist_Col9 = berries->fallDist[9];

    packet.berryId_Col0 = berries->ids[0];
    packet.berryId_Col1 = berries->ids[1];
    packet.berryId_Col2 = berries->ids[2];
    packet.berryId_Col3 = berries->ids[3];
    packet.berryId_Col4 = berries->ids[4];
    packet.berryId_Col5 = berries->ids[5];
    packet.berryId_Col6 = berries->ids[6];
    packet.berryId_Col7 = berries->ids[7];
    packet.berryId_Col8 = berries->ids[8];
    packet.berryId_Col9 = berries->ids[9];

    packet.pickState_Player1 = player1->pickState;
    packet.pickState_Player2 = player2->pickState;
    packet.pickState_Player3 = player3->pickState;
    packet.pickState_Player4 = player4->pickState;
    packet.pickState_Player5 = player5->pickState;

    packet.ateBerry_Player1 = player1->ateBerry;
    packet.ateBerry_Player2 = player2->ateBerry;
    packet.ateBerry_Player3 = player3->ateBerry;
    packet.ateBerry_Player4 = player4->ateBerry;
    packet.ateBerry_Player5 = player5->ateBerry;

    packet.missedBerry_Player1 = player1->missedBerry;
    packet.missedBerry_Player2 = player2->missedBerry;
    packet.missedBerry_Player3 = player3->missedBerry;
    packet.missedBerry_Player4 = player4->missedBerry;
    packet.missedBerry_Player5 = player5->missedBerry;

    packet.numGraySquares = numGraySquares;
    packet.berriesFalling = berriesFalling;
    packet.allReadyToEnd = allReadyToEnd;
    Rfu_SendPacket(&packet);
}

bool32 RecvPacket_GameState(u32 playerId,
                            struct DodrioGame_Player *player,
                            struct DodrioGame_PlayerCommData *player1,
                            struct DodrioGame_PlayerCommData *player2,
                            struct DodrioGame_PlayerCommData *player3,
                            struct DodrioGame_PlayerCommData *player4,
                            struct DodrioGame_PlayerCommData *player5,
                            u8 *numGraySquares,
                            bool32 *berriesFalling,
                            bool32 *allReadyToEnd)
{
    struct GameStatePacket *packet;
    struct DodrioGame_Berries *berries = &player->berries;

    if ((gRecvCmds[0][0] & RFUCMD_MASK) != RFUCMD_SEND_PACKET)
        return FALSE;

    packet = (void *)&gRecvCmds[0][1];
    if (packet->id == PACKET_GAME_STATE)
    {
        berries->fallDist[0] = packet->fallDist_Col0;
        berries->fallDist[1] = packet->fallDist_Col1;
        berries->fallDist[2] = packet->fallDist_Col2;
        berries->fallDist[3] = packet->fallDist_Col3;
        berries->fallDist[4] = packet->fallDist_Col4;
        berries->fallDist[5] = packet->fallDist_Col5;
        berries->fallDist[6] = packet->fallDist_Col6;
        berries->fallDist[7] = packet->fallDist_Col7;
        berries->fallDist[8] = packet->fallDist_Col8;
        berries->fallDist[9] = packet->fallDist_Col9;
        berries->fallDist[10] = packet->fallDist_Col0;

        berries->ids[0] = packet->berryId_Col0;
        berries->ids[1] = packet->berryId_Col1;
        berries->ids[2] = packet->berryId_Col2;
        berries->ids[3] = packet->berryId_Col3;
        berries->ids[4] = packet->berryId_Col4;
        berries->ids[5] = packet->berryId_Col5;
        berries->ids[6] = packet->berryId_Col6;
        berries->ids[7] = packet->berryId_Col7;
        berries->ids[8] = packet->berryId_Col8;
        berries->ids[9] = packet->berryId_Col9;
        berries->ids[10] = packet->berryId_Col0;

        player1->pickState = packet->pickState_Player1;
        player1->ateBerry = packet->ateBerry_Player1;
        player1->missedBerry = packet->missedBerry_Player1;

        player2->pickState = packet->pickState_Player2;
        player2->ateBerry = packet->ateBerry_Player2;
        player2->missedBerry = packet->missedBerry_Player2;

        player3->pickState = packet->pickState_Player3;
        player3->ateBerry = packet->ateBerry_Player3;
        player3->missedBerry = packet->missedBerry_Player3;

        player4->pickState = packet->pickState_Player4;
        player4->ateBerry = packet->ateBerry_Player4;
        player4->missedBerry = packet->missedBerry_Player4;

        player5->pickState = packet->pickState_Player5;
        player5->ateBerry = packet->ateBerry_Player5;
        player5->missedBerry = packet->missedBerry_Player5;

        *numGraySquares = packet->numGraySquares;
        *berriesFalling = packet->berriesFalling;
        *allReadyToEnd = packet->allReadyToEnd;
        return TRUE;
    }

    return FALSE;
}

void SendPacket_PickState(u8 pickState)
{
    struct PickStatePacket packet;
    packet.id = PACKET_PICK_STATE;
    packet.pickState = pickState;
    Rfu_SendPacket(&packet);
}

bool32 RecvPacket_PickState(u32 playerId, u8 *pickState)
{
    struct PickStatePacket * packet;

    if ((gRecvCmds[0][0] & RFUCMD_MASK) != RFUCMD_SEND_PACKET)
        return FALSE;

    packet = (void *)&gRecvCmds[playerId][1];
    if (packet->id == PACKET_PICK_STATE)
    {
        *pickState = packet->pickState;
        return TRUE;
    }

    return FALSE;
}

void SendPacket_ReadyToEnd(bool32 ready)
{
    struct ReadyToEndPacket packet;
    packet.id = PACKET_READY_END;
    packet.ready = ready;
    Rfu_SendPacket(&packet);
}

bool32 RecvPacket_ReadyToEnd(u32 playerId)
{
    struct ReadyToEndPacket * packet;

    if ((gRecvCmds[0][0] & RFUCMD_MASK) != RFUCMD_SEND_PACKET)
        return FALSE;

    packet = (void *)&gRecvCmds[playerId][1];
    if (packet->id == PACKET_READY_END)
        return packet->ready;

    return FALSE;
}
