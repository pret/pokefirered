#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

	.align 2
sLavaridgeGymB1FWarpEffectFuncs:: @ 83CC0A4 dataptr
	.4byte LavaridgeGymB1FWarpEffect_1
	.4byte LavaridgeGymB1FWarpEffect_2
	.4byte LavaridgeGymB1FWarpEffect_3
	.4byte LavaridgeGymB1FWarpEffect_4
	.4byte LavaridgeGymB1FWarpEffect_5
	.4byte LavaridgeGymB1FWarpEffect_6

	.align 2
sLavaridgeGymB1FWarpExitEffectFuncs:: @ 83CC0BC dataptr
	.4byte LavaridgeGymB1FWarpExitEffect_1
	.4byte LavaridgeGymB1FWarpExitEffect_2
	.4byte LavaridgeGymB1FWarpExitEffect_3
	.4byte LavaridgeGymB1FWarpExitEffect_4

	.align 2
sLavaridgeGym1FWarpEffectFuncs:: @ 83CC0CC dataptr
	.4byte LavaridgeGym1FWarpEffect_1
	.4byte LavaridgeGym1FWarpEffect_2
	.4byte LavaridgeGym1FWarpEffect_3
	.4byte LavaridgeGym1FWarpEffect_4
	.4byte LavaridgeGym1FWarpEffect_5

	.align 2
gEscapeRopeFieldEffectFuncs:: @ 83CC0E0 dataptr
	.4byte EscapeRopeFieldEffect_Step0
	.4byte EscapeRopeFieldEffect_Step1

gUnknown_83CC0E8:: @ 83CC0E8 data8
	.byte 0x01, 0x03, 0x04, 0x02, 0x01

	.align 2
sEscapeRopeExitEffectFuncs:: @ 83CC0F0 dataptr
	.4byte EscapeRopeExitFieldEffect_Step0
	.4byte EscapeRopeExitFieldEffect_Step1

	.align 2
sTeleportEffectFuncs:: @ 83CC0F8 dataptr
	.4byte TeleportFieldEffectTask1
	.4byte TeleportFieldEffectTask2
	.4byte TeleportFieldEffectTask3
	.4byte TeleportFieldEffectTask4

gUnknown_83CC108:: @ 83CC108 data8
	.byte 0x01, 0x03, 0x04, 0x02, 0x01

	.align 2
sTeleportInEffectFuncs:: @ 83CC110 dataptr
	.4byte TeleportInFieldEffectTask1
	.4byte TeleportInFieldEffectTask2
	.4byte TeleportInFieldEffectTask3

	.align 2
sShowMonOutdoorsEffectFuncs:: @ 83CC11C dataptr
	.4byte ShowMonEffect_Outdoors_1
	.4byte ShowMonEffect_Outdoors_2
	.4byte ShowMonEffect_Outdoors_3
	.4byte ShowMonEffect_Outdoors_4
	.4byte ShowMonEffect_Outdoors_5
	.4byte ShowMonEffect_Outdoors_6
	.4byte ShowMonEffect_Outdoors_7

	.align 2
sShowMonIndoorsEffectFuncs:: @ 83CC138 dataptr
	.4byte ShowMonEffect_Indoors_1
	.4byte ShowMonEffect_Indoors_2
	.4byte ShowMonEffect_Indoors_3
	.4byte ShowMonEffect_Indoors_4
	.4byte ShowMonEffect_Indoors_5
	.4byte ShowMonEffect_Indoors_6
	.4byte ShowMonEffect_Indoors_7

	.align 2
gUnknown_83CC154:: @ 83CC154 dataptr
	.4byte sub_80869C0
	.4byte sub_8086A20
	.4byte sub_8086A6C
	.4byte sub_8086AB4
	.4byte sub_8086B30

	.align 2
gUnknown_83CC168:: @ 83CC168 dataptr
	.4byte sub_8086C00
	.4byte sub_8086C24
	.4byte sub_8086C70
	.4byte sub_8086CF4

gUnknown_83CC178:: @ 83CC178 dataptr (incomplete)
	.4byte sub_8086E70
	.4byte sub_8086EC8
	.4byte sub_8086F0C
	.4byte sub_8086F64
	.4byte sub_8086FA8
	.4byte sub_8086FFC
	.4byte sub_808706C
	.4byte sub_8087118
	.4byte sub_8087138

gUnknown_83CC19C:: @ 83CC19C affineanimcmd
	obj_rot_scal_anim_frame 8, 8, 226, 0
	obj_rot_scal_anim_frame 28, 28, 0, 30
	obj_rot_scal_anim_end

gUnknown_83CC1B4:: @ 83CC1B4 affineanimcmd
	obj_rot_scal_anim_frame 256, 256, 64, 0
	obj_rot_scal_anim_frame -10, -10, 0, 22
	obj_rot_scal_anim_end

	.align 2
gUnknown_83CC1CC:: @ 83CC1CC dataptr
	.4byte gUnknown_83CC19C
	.4byte gUnknown_83CC1B4

	.align 2
gUnknown_83CC1D4:: @ 83CC1D4 dataptr
	.4byte sub_80874C8
	.4byte sub_80875C8
	.4byte sub_8087644
	.4byte sub_8087698
	.4byte sub_8087710
	.4byte sub_8087748
	.4byte fishE

gUnknown_83CC1F0:: @ 83CC1F0 data16
	.2byte 0xfffe, 0xfffc, 0xfffb, 0xfffa, 0xfff9, 0xfff8, 0xfff8, 0xfff8, 0xfff9, 0xfff9, 0xfffa, 0xfffb, 0xfffd, 0xfffe, 0x0000, 0x0002
	.2byte 0x0004, 0x0008

gUnknown_83CC214:: @ 83CC214 affineanimcmd
	obj_rot_scal_anim_frame 24, 24, 0, 1
	obj_rot_scal_anim_jump 0

gUnknown_83CC224:: @ 83CC224 affineanimcmd
	obj_rot_scal_anim_frame 512, 512, 0, 1
	obj_rot_scal_anim_frame -16, -16, 0, 1
	obj_rot_scal_anim_jump 1

	.align 2
gUnknown_83CC23C:: @ 83CC23C dataptr
	.4byte gUnknown_83CC214
	.4byte gUnknown_83CC224

gUnknown_83CC244:: @ 83CC244 dataptr
	.4byte sub_8087C00
	.4byte sub_8087C2C
	.4byte sub_8087CB4

gUnknown_83CC250:: @ 83CC250 sprite_frames
	obj_frame_tiles gUnknown_83CBDB0 + 0x00, 0x0020
	obj_frame_tiles gUnknown_83CBDB0 + 0x20, 0x0020
	obj_frame_tiles gUnknown_83CBDB0 + 0x40, 0x0020
	obj_frame_tiles gUnknown_83CBDB0 + 0x60, 0x0020

gUnknown_83CC270:: @ 83CC270 animcmd
	obj_image_anim_frame 0x0000, 0
	obj_image_anim_end

gUnknown_83CC278:: @ 83CC278 animcmd
	obj_image_anim_frame 0x0001, 0
	obj_image_anim_end

gUnknown_83CC280:: @ 83CC280 animcmd
	obj_image_anim_frame 0x0002, 0
	obj_image_anim_end

gUnknown_83CC288:: @ 83CC288 animcmd
	obj_image_anim_frame 0x0003, 0
	obj_image_anim_end

gUnknown_83CC290:: @ 83CC290 dataptr
	.4byte gUnknown_83CC270
	.4byte gUnknown_83CC278
	.4byte gUnknown_83CC280
	.4byte gUnknown_83CC288

gUnknown_83CC2A0:: @ 83CC2A0 spr_template
	spr_template 65535, 4371, gOamData_83CBE58, gUnknown_83CC290, gUnknown_83CC250, gDummySpriteAffineAnimTable, sub_8087D90
