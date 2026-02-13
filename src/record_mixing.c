#include "global.h"
#include "new_game.h"
#include "record_mixing.h"
#include "string_util.h"
#include "constants/battle_frontier.h"

void GetPlayerHallRecords(struct PlayerHallRecords *dst)
{
    s32 i, j;

    for (i = 0; i < HALL_FACILITIES_COUNT; i++)
    {
        for (j = 0; j < FRONTIER_LVL_MODE_COUNT; j++)
        {
            CopyTrainerId(dst->onePlayer[i][j].id, gSaveBlock2Ptr->playerTrainerId);
            dst->onePlayer[i][j].language = GAME_LANGUAGE;
            StringCopy(dst->onePlayer[i][j].name, gSaveBlock2Ptr->playerName);
        }
    }

    for (j = 0; j < FRONTIER_LVL_MODE_COUNT; j++)
    {
        dst->twoPlayers[j].language = GAME_LANGUAGE;
        CopyTrainerId(dst->twoPlayers[j].id1, gSaveBlock2Ptr->playerTrainerId);
        CopyTrainerId(dst->twoPlayers[j].id2, gSaveBlock2Ptr->frontier.opponentTrainerIds[j]);
        StringCopy(dst->twoPlayers[j].name1, gSaveBlock2Ptr->playerName);
        StringCopy(dst->twoPlayers[j].name2, gSaveBlock2Ptr->frontier.opponentNames[j]);
    }

    for (i = 0; i < FRONTIER_LVL_MODE_COUNT; i++)
    {
        dst->onePlayer[RANKING_HALL_TOWER_SINGLES][i].winStreak = gSaveBlock2Ptr->frontier.towerRecordWinStreaks[FRONTIER_MODE_SINGLES][i];
        dst->onePlayer[RANKING_HALL_TOWER_DOUBLES][i].winStreak = gSaveBlock2Ptr->frontier.towerRecordWinStreaks[FRONTIER_MODE_DOUBLES][i];
        dst->onePlayer[RANKING_HALL_TOWER_MULTIS][i].winStreak = gSaveBlock2Ptr->frontier.towerRecordWinStreaks[FRONTIER_MODE_MULTIS][i];
        dst->onePlayer[RANKING_HALL_DOME][i].winStreak = gSaveBlock2Ptr->frontier.domeRecordWinStreaks[FRONTIER_MODE_SINGLES][i];
        dst->onePlayer[RANKING_HALL_PALACE][i].winStreak = gSaveBlock2Ptr->frontier.palaceRecordWinStreaks[FRONTIER_MODE_SINGLES][i];
        dst->onePlayer[RANKING_HALL_ARENA][i].winStreak = gSaveBlock2Ptr->frontier.arenaRecordStreaks[i];
        dst->onePlayer[RANKING_HALL_FACTORY][i].winStreak = gSaveBlock2Ptr->frontier.factoryRecordWinStreaks[FRONTIER_MODE_SINGLES][i];
        dst->onePlayer[RANKING_HALL_PIKE][i].winStreak = gSaveBlock2Ptr->frontier.pikeRecordStreaks[i];
        dst->onePlayer[RANKING_HALL_PYRAMID][i].winStreak = gSaveBlock2Ptr->frontier.pyramidRecordStreaks[i];

        dst->twoPlayers[i].winStreak = gSaveBlock2Ptr->frontier.towerRecordWinStreaks[FRONTIER_MODE_LINK_MULTIS][i];
    }
}