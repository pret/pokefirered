#ifndef GUARD_FLDEFF_H
#define GUARD_FLDEFF_H

#define FLDEFF_CALL_FUNC_IN_DATA() ((void (*)(void))(((u16)gTasks[taskId].data[8] << 16) | (u16)gTasks[taskId].data[9]))();

#define FLDEFF_SET_FUNC_TO_DATA(func)                     \
gTasks[taskId].data[8] = (u32)func >> 16;                 \
gTasks[taskId].data[9] = (u32)func;

extern struct MapPosition gPlayerFacingPosition;

bool8 CheckObjectGraphicsInFrontOfPlayer(u16 graphicsId);
u8 CreateFieldEffectShowMon(void);

// field move setups
bool32 FieldMove_SetUpCut(void);
bool32 FieldMove_SetUpFly(void);
bool32 FieldMove_SetUpSurf(void);
bool32 FieldMove_SetUpStrength(void);
bool32 FieldMove_SetUpFlash(void);
bool32 FieldMove_SetUpRockSmash(void);
bool32 FieldMove_SetUpWaterfall(void);
bool32 FieldMove_SetUpDig(void);
bool32 FieldMove_SetUpTeleport(void);
bool32 FieldMove_SetUpSoftBoiled(void);
bool32 FieldMove_SetUpSweetScent(void);

// flash
u8 MapTransitionIsExit(u8 lightLevel, u8 mapType);
u8 MapTransitionIsEnter(u8 mapType1, u8 mapType2);
void CB2_DoChangeMap(void);

// berrytree
void nullsub_56(void);

// poison
void FldEffPoison_Start(void);
bool32 FldEffPoison_IsActive(void);

// softboiled
void ChooseMonForSoftboiled(u8 taskId);
void Task_TryUseSoftboiledOnPartyMon(u8 taskId);

// sweetscent
void StartSweetScentFieldEffect(void);

#endif // GUARD_FLDEFF_H
