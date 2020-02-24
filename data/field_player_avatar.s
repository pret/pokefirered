#include "constants/event_objects.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2
gUnknown_835B764:: @ 835B764
	.4byte MetatileBehavior_IsUnknownMovement48, ForcedMovement_Slip
	.4byte MetatileBehavior_IsIce_2, ForcedMovement_Slip
	.4byte MetatileBehavior_IsWalkSouth, sub_805B750
	.4byte MetatileBehavior_IsWalkNorth, sub_805B768
	.4byte MetatileBehavior_IsWalkWest, sub_805B780
	.4byte MetatileBehavior_IsWalkEast, sub_805B798
	.4byte MetatileBehavior_IsSouthwardCurrent, sub_805B82C
	.4byte MetatileBehavior_IsNorthwardCurrent, sub_805B844
	.4byte MetatileBehavior_IsWestwardCurrent, sub_805B85C
	.4byte MetatileBehavior_IsEastwardCurrent, sub_805B874
	.4byte MetatileBehavior_UnusedIsSpinRight, sub_805B7B0
	.4byte MetatileBehavior_UnusedIsSpinLeft, sub_805B7CC
	.4byte MetatileBehavior_UnusedIsSpinUp, sub_805B7E8
	.4byte MetatileBehavior_UnusedIsSpinDown, sub_805B804
	.4byte MetatileBehavior_IsSlideSouth, ForcedMovement_SlideSouth
	.4byte MetatileBehavior_IsSlideNorth, ForcedMovement_SlideNorth
	.4byte MetatileBehavior_IsSlideWest, ForcedMovement_SlideWest
	.4byte MetatileBehavior_IsSlideEast, ForcedMovement_SlideEast
	.4byte MetatileBehavior_IsWaterfall, sub_805B82C
	.4byte MetatileBehavior_UnusedReturnFalse_7, sub_805B924
	.4byte MetatileBehavior_UnusedReturnFalse_8, sub_805B930
	.4byte NULL, ForcedMovement_None

gUnknown_835B814:: @ 835B814
	.4byte PlayerNotOnBikeNotMoving
	.4byte sub_805B9C4
	.4byte sub_805B9D4

gUnknown_835B820:: @ 835B820
	.byte 0x04, 0x04, 0x05, 0x06, 0x07

	.align 2
gUnknown_835B828:: @ 835B828
	.4byte MetatileBehavior_ReturnFalse_14 // Related to Acro Bike
	.4byte MetatileBehavior_ReturnFalse_15 // Related to Acro Bike
	.4byte MetatileBehavior_ReturnFalse_16 // Related to Acro Bike
	.4byte MetatileBehavior_ReturnFalse_17 // Related to Acro Bike
	.4byte MetatileBehavior_ReturnFalse_18 // Related to Acro Bike

gUnknown_835B83C:: @ 835B83C
	.byte 0x09, 0x0a, 0x0b, 0x0c, 0x0d

	.align 2
gUnknown_835B844:: @ 835B844
	.4byte sub_805BE60
	.4byte sub_805BE74
	.4byte sub_805BE74
	.4byte sub_805BE90
	.4byte nullsub_23
	.4byte PlayerAvatarTransition_ReturnToField
	.4byte nullsub_22
	.4byte nullsub_22

gUnknown_835B864:: @ 835B864
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

gUnknown_835B874:: @ 835B874
	.byte OBJ_EVENT_GFX_RED_NORMAL,    OBJ_EVENT_GFX_GREEN_NORMAL
	.byte OBJ_EVENT_GFX_RED_BIKE,      OBJ_EVENT_GFX_GREEN_BIKE
	.byte OBJ_EVENT_GFX_RED_SURF,      OBJ_EVENT_GFX_GREEN_SURF
	.byte OBJ_EVENT_GFX_RED_ITEM,      OBJ_EVENT_GFX_GREEN_ITEM
	.byte OBJ_EVENT_GFX_RED_FISH,      OBJ_EVENT_GFX_GREEN_FISH
	.byte OBJ_EVENT_GFX_RED_ITEM_COPY, OBJ_EVENT_GFX_GREEN_ITEM_COPY

gUnknown_835B880:: @ 835B880
	.byte OBJ_EVENT_GFX_RS_BRENDAN
	.byte OBJ_EVENT_GFX_RS_MAY

gUnknown_835B882:: @ 835B882
	@ Male
	.byte OBJ_EVENT_GFX_RED_NORMAL, 0x01
	.byte OBJ_EVENT_GFX_RED_BIKE, 0x02
	.byte OBJ_EVENT_GFX_RED_SURF, 0x08
	@ Female
	.byte OBJ_EVENT_GFX_GREEN_NORMAL, 0x01
	.byte OBJ_EVENT_GFX_GREEN_BIKE, 0x02
	.byte OBJ_EVENT_GFX_GREEN_SURF, 0x08

gUnknown_835B88E:: @ 835B88E
	.byte OBJ_EVENT_GFX_RED_VS_SEEKER
	.byte OBJ_EVENT_GFX_GREEN_VS_SEEKER

gUnknown_835B890:: @ 835B890
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

gUnknown_835B8A0:: @ 835B8A0
	.4byte sub_805CD64
	.4byte sub_805CD84
	.4byte sub_805CE20

gUnknown_835B8AC:: @ 835B8AC
	.4byte PlayerAvatar_DoSecretBaseMatJump

gUnknown_835B8B0:: @ 835B8B0
	.4byte sub_805CFC4
	.4byte sub_805CFEC
	.4byte sub_805D064
	.4byte sub_805D0A4

gUnknown_835B8C0:: @ 835B8C0
	.byte 0x03, 0x04, 0x02, 0x01

gUnknown_835B8C4:: @ 835B8C4
	.byte 0x18, 0x18, 0x19, 0x1a, 0x1b

	.align 2
gUnknown_835B8CC:: @ 835B8CC
	.4byte sub_805D33C
	.4byte fish1
	.4byte fish2
	.4byte sub_805D430
	.4byte sub_805D47C
	.4byte sub_805D508
	.4byte sub_805D574
	.4byte sub_805D580
	.4byte sub_805D5EC
	.4byte sub_805D66C
	.4byte sub_805D6C8
	.4byte sub_805D7C0
	.4byte sub_805D838
	.4byte sub_805D8AC
	.4byte sub_805D8D8
	.4byte sub_805D980

gUnknown_835B90C:: @ 835B90C
	.2byte 0x0001, 0x0001, 0x0001

gUnknown_835B912:: @ 835B912
	.2byte 0x0001, 0x0003, 0x0006

gUnknown_835B918:: @ 835B918
	.string "·$"

gUnknown_835B91A:: @ 835B91A
	.2byte 0x0024, 0x0021, 0x001e

gUnknown_835B920:: @ 835B920
	.2byte 0x0000, 0x0000, 0x0028, 0x000a, 0x0046, 0x001e

gUnknown_835B92C:: @ 835B92C
	.byte 0x01, 0x03, 0x04, 0x02, 0x01
