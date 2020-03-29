#ifndef GUARD_FLDEFF_H
#define GUARD_FLDEFF_H

#define FLDEFF_CALL_FUNC_IN_DATA() ((void (*)(void))(((u16)gTasks[taskId].data[8] << 16) | (u16)gTasks[taskId].data[9]))();

#define FLDEFF_SET_FUNC_TO_DATA(func)                     \
gTasks[taskId].data[8] = (u32)func >> 16;                 \
gTasks[taskId].data[9] = (u32)func;

extern struct MapPosition gPlayerFacingPosition;

bool8 CheckObjectGraphicsInFrontOfPlayer(u8 graphicsId);
u8 CreateFieldEffectShowMon(void);

// flash
u8 MapTransitionIsExit(u8 lightLevel, u8 mapType);
u8 MapTransitionIsEnter(u8 mapType1, u8 mapType2);
bool8 SetUpFieldMove_Flash(void);
void CB2_DoChangeMap(void);

// cut
bool8 SetUpFieldMove_Cut(void);

// dig
bool8 SetUpFieldMove_Dig(void);
bool8 FldEff_UseDig(void);

// rocksmash
bool8 SetUpFieldMove_RockSmash(void);
bool8 FldEff_UseRockSmash(void);

// berrytree
void nullsub_56(void);

// poison
void FldEffPoison_Start(void);
bool32 FldEffPoison_IsActive(void);

// strength
bool8 SetUpFieldMove_Strength(void);
bool8 FldEff_UseStrength(void);

// teleport
bool8 SetUpFieldMove_Teleport(void);
bool8 FldEff_UseTeleport(void);

// softboiled
bool8 SetUpFieldMove_SoftBoiled(void);
void ChooseMonForSoftboiled(u8 taskId);
void Task_TryUseSoftboiledOnPartyMon(u8 taskId);

// sweetscent
bool8 SetUpFieldMove_SweetScent(void);
bool8 FldEff_SweetScent(void);

#endif // GUARD_FLDEFF_H
