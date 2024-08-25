#ifndef GUARD_LOAD_SAVE_H
#define GUARD_LOAD_SAVE_H

#include "pokemon_storage_system.h"
#include "save.h"

#define SAVEBLOCK_MOVE_RANGE    128

struct SaveBlock2ASLR {
    struct SaveBlock2 block;
    u8 aslr[SAVEBLOCK_MOVE_RANGE];
};

struct SaveBlock1ASLR {
    struct SaveBlock1 block;
    u8 aslr[SAVEBLOCK_MOVE_RANGE];
};

struct PokemonStorageASLR {
    struct PokemonStorage block;
    u8 aslr[SAVEBLOCK_MOVE_RANGE];
};

extern struct SaveBlock1ASLR gSaveblock1;
extern struct SaveBlock2ASLR gSaveblock2;
extern struct SaveBlock3 gSaveblock3;
extern struct PokemonStorageASLR gPokemonStorage;

extern bool32 gFlashMemoryPresent;
extern struct SaveBlock1 *gSaveBlock1Ptr;
extern struct SaveBlock2 *gSaveBlock2Ptr;
extern struct PokemonStorage *gPokemonStoragePtr;

void ClearSav3(void);
void ClearSav2(void);
void ClearSav1(void);
void CheckForFlashMemory(void);
void MoveSaveBlocks_ResetHeap(void);
bool32 GetSecretBase2Field_9(void);
void ClearSecretBase2Field_9(void);
void SetSecretBase2Field_9(void);
void SetSecretBase2Field_9_AndHideBG(void);
void ClearSecretBase2Field_9_2(void);
void SavePlayerParty(void);
void LoadPlayerParty(void);
void SaveSerializedGame(void);
void LoadSerializedGame(void);
void LoadPlayerBag(void);
void SavePlayerBag(void);
void SetSaveBlocksPointers(void);
void MoveSaveBlocks_ResetHeap(void);
void ClearContinueGameWarpStatus2(void);
void SetContinueGameWarpStatusToDynamicWarp(void);
void SetContinueGameWarpStatus(void);
bool32 UseContinueGameWarp(void);
void ClearContinueGameWarpStatus();

#endif // GUARD_LOAD_SAVE_H
