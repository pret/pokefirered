#include "constants/species.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/easy_chat.h"

#define NULL 0

	.include "asm/macros.inc"

	.section .rodata

	.align 2
gUnknown_8471F00::
	.incbin "baserom.gba", 0x471F00, 0x50

gUnknown_8471F50:: @ 8471F50
	.incbin "baserom.gba", 0x471F50, 0x113

gUnknown_8472063:: @ 8472063
	.incbin "baserom.gba", 0x472063, 0x4B

gUnknown_84720AE:: @ 84720AE
	.incbin "baserom.gba", 0x4720AE, 0x4E

gUnknown_84720FC:: @ 84720FC
	.incbin "baserom.gba", 0x4720FC, 0x37

gUnknown_8472133:: @ 8472133
	.incbin "baserom.gba", 0x472133, 0x3409

gUnknown_847553C:: @ 847553C
	.incbin "baserom.gba", 0x47553C, 0xC

gUnknown_8475548:: @ 8475548
	.incbin "baserom.gba", 0x475548, 0x8

gUnknown_8475550:: @ 8475550
	.incbin "baserom.gba", 0x475550, 0x8

gUnknown_8475558:: @ 8475558
	.incbin "baserom.gba", 0x475558, 0x20

gUnknown_8475578:: @ 8475578
	.incbin "baserom.gba", 0x475578, 0x30

gUnknown_84755A8:: @ 84755A8
	.incbin "baserom.gba", 0x4755A8, 0x30

gUnknown_84755D8:: @ 84755D8
	.incbin "baserom.gba", 0x4755D8, 0x8

gUnknown_84755E0:: @ 84755E0
	.incbin "baserom.gba", 0x4755E0, 0x8

gUnknown_84755E8:: @ 84755E8
	.incbin "baserom.gba", 0x4755E8, 0x10

gUnknown_84755F8:: @ 84755F8
	.incbin "baserom.gba", 0x4755F8, 0x4

gUnknown_84755FC:: @ 84755FC
	.incbin "baserom.gba", 0x4755FC, 0x6

gUnknown_8475602:: @ 8475602
	.incbin "baserom.gba", 0x475602, 0x6

gUnknown_8475608:: @ 8475608
	.incbin "baserom.gba", 0x475608, 0x40

gUnknown_8475648:: @ 8475648
	.incbin "baserom.gba", 0x475648, 0x14

gUnknown_847565C:: @ 847565C
	.incbin "baserom.gba", 0x47565C, 0x18

gUnknown_8475674:: @ 8475674
	.incbin "baserom.gba", 0x475674, 0x10

gUnknown_8475684:: @ 8475684
	.incbin "baserom.gba", 0x475684, 0x8

gUnknown_847568C:: @ 847568C
	.incbin "baserom.gba", 0x47568C, 0x10

gUnknown_847569C:: @ 847569C
	.incbin "baserom.gba", 0x47569C, 0x8

gUnknown_84756A4:: @ 84756A4
	.incbin "baserom.gba", 0x4756A4, 0x204

gUnknown_84758A8:: @ 84758A8
	.incbin "baserom.gba", 0x4758A8, 0xC0

gUnknown_8475968:: @ 8475968
	.incbin "baserom.gba", 0x475968, 0x1D4

gUnknown_8475B3C:: @ 8475B3C
	.incbin "baserom.gba", 0x475B3C, 0x890

gUnknown_84763CC:: @ 84763CC
	.incbin "baserom.gba", 0x4763CC, 0xDCC

gUnknown_8477198:: @ 8477198
	.incbin "baserom.gba", 0x477198, 0x94

gUnknown_847722C:: @ 847722C
	.incbin "baserom.gba", 0x47722C, 0x148

gUnknown_8477374:: @ 8477374
	.incbin "baserom.gba", 0x477374, 0x121C

gUnknown_8478590:: @ 8478590
	.incbin "baserom.gba", 0x478590, 0x26C

gUnknown_84787FC:: @ 84787FC
	.incbin "baserom.gba", 0x4787FC, 0x250

gUnknown_8478A4C:: @ 8478A4C
	.incbin "baserom.gba", 0x478A4C, 0x24C

gUnknown_8478C98:: @ 8478C98
	.incbin "baserom.gba", 0x478C98, 0x48

gUnknown_8478CE0:: @ 8478CE0
	.incbin "baserom.gba", 0x478CE0, 0xB0

gUnknown_8478D90:: @ 8478D90
	.incbin "baserom.gba", 0x478D90, 0x8

gUnknown_8478D98:: @ 8478D98
	.incbin "baserom.gba", 0x478D98, 0x8

gUnknown_8478DA0:: @ 8478DA0
	.incbin "baserom.gba", 0x478DA0, 0x8

gUnknown_8478DA8:: @ 8478DA8
	.incbin "baserom.gba", 0x478DA8, 0x24

gUnknown_8478DCC:: @ 8478DCC
	.incbin "baserom.gba", 0x478DCC, 0x8

gUnknown_8478DD4:: @ 8478DD4
	.incbin "baserom.gba", 0x478DD4, 0x8

gUnknown_8478DDC:: @ 8478DDC
	.incbin "baserom.gba", 0x478DDC, 0x18

gUnknown_8478DF4:: @ 8478DF4
	.incbin "baserom.gba", 0x478DF4, 0x18

gUnknown_8478E0C:: @ 8478E0C
	.incbin "baserom.gba", 0x478E0C, 0x2

gUnknown_8478E0E:: @ 8478E0E
	.incbin "baserom.gba", 0x478E0E, 0xA

gUnknown_8478E18:: @ 8478E18
	.incbin "baserom.gba", 0x478E18, 0x8

gUnknown_8478E20:: @ 8478E20
	.incbin "baserom.gba", 0x478E20, 0x18

gUnknown_8478E38:: @ 8478E38
	.incbin "baserom.gba", 0x478E38, 0x3

gUnknown_8478E3B:: @ 8478E3B
	.incbin "baserom.gba", 0x478E3B, 0x45

gUnknown_8478E80:: @ 8478E80
	.incbin "baserom.gba", 0x478E80, 0x14

gUnknown_8478E94:: @ 8478E94
	.incbin "baserom.gba", 0x478E94, 0x14

gUnknown_8478EA8:: @ 8478EA8
	.incbin "baserom.gba", 0x478EA8, 0x8

gUnknown_8478EB0:: @ 8478EB0
	.incbin "baserom.gba", 0x478EB0, 0xA

gUnknown_8478EBA:: @ 8478EBA
	.incbin "baserom.gba", 0x478EBA, 0xA

gUnknown_8478EC4:: @ 8478EC4
	.incbin "baserom.gba", 0x478EC4, 0x50

gUnknown_8478F14:: @ 8478F14
	.incbin "baserom.gba", 0x478F14, 0x8

gUnknown_8478F1C:: @ 8478F1C
	.incbin "baserom.gba", 0x478F1C, 0x144

gUnknown_8479060:: @ 8479060
	.incbin "baserom.gba", 0x479060, 0x78

gUnknown_84790D8:: @ 84790D8
	.incbin "baserom.gba", 0x4790D8, 0xC0

gUnknown_8479198:: @ 8479198
	.incbin "baserom.gba", 0x479198, 0x10

gUnknown_84791A8:: @ 84791A8
	.incbin "baserom.gba", 0x4791A8, 0x10

gUnknown_84791B8:: @ 84791B8
	.incbin "baserom.gba", 0x4791B8, 0x14

gUnknown_84791CC:: @ 84791CC
	.incbin "baserom.gba", 0x4791CC, 0x1C

gUnknown_84791E8:: @ 84791E8
	.incbin "baserom.gba", 0x4791E8, 0xE8

gUnknown_84792D0:: @ 84792D0
	.incbin "baserom.gba", 0x4792D0, 0x10

gUnknown_84792E0:: @ 84792E0
	.incbin "baserom.gba", 0x4792E0, 0x10

gUnknown_84792F0:: @ 84792F0
	.incbin "baserom.gba", 0x4792F0, 0x50

gUnknown_8479340:: @ 8479340
	.incbin "baserom.gba", 0x479340, 0x28

gUnknown_8479368:: @ 8479368
	.incbin "baserom.gba", 0x479368, 0x18

gUnknown_8479380:: @ 8479380
	.incbin "baserom.gba", 0x479380, 0x10

gUnknown_8479390:: @ 8479390
	.incbin "baserom.gba", 0x479390, 0x1B8

gUnknown_8479548:: @ 8479548
	.incbin "baserom.gba", 0x479548, 0x18

gUnknown_8479560:: @ 8479560
	.incbin "baserom.gba", 0x479560, 0x18

gUnknown_8479578:: @ 8479578
	.incbin "baserom.gba", 0x479578, 0x18

gUnknown_8479590:: @ 8479590
	.incbin "baserom.gba", 0x479590, 0x28

gUnknown_84795B8:: @ 84795B8
	.incbin "baserom.gba", 0x4795B8, 0x10

gUnknown_84795C8:: @ 84795C8
	.incbin "baserom.gba", 0x4795C8, 0x90

gUnknown_8479658:: @ 8479658
	.incbin "baserom.gba", 0x479658, 0x600

gUnknown_8479C58:: @ 8479C58
	.incbin "baserom.gba", 0x479C58, 0x30

gUnknown_8479C88:: @ 8479C88
	.incbin "baserom.gba", 0x479C88, 0x38

gUnknown_8479CC0:: @ 8479CC0
	.incbin "baserom.gba", 0x479CC0, 0x18

	.align 2
gUnknown_8479CD8:: @ 8479CD8
	.asciz "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/cereader_tool.c"

	.align 2
gUnknown_8479D10:: @ 8479D10
	.asciz "ttdata->dummy == 0"

	.align 2
gUnknown_8479D24:: @ 8479D24
	.asciz "ttdata->id == 0"

	// trainer_tower

	.section .rodata.after_trainer_tower

	// unk_815F138

gUnknown_847A328::
	.incbin "data/graphics/unk_847a348.gbapal"

gUnknown_847A348::
	.incbin "data/graphics/unk_847a348.4bpp.lz"

gUnknown_847A79C:: @ 847A79C
	obj_tiles gUnknown_847A348, 0xE00, 0

gUnknown_847A7A4:: @ 847A7A4
	obj_pal gUnknown_847A328, 0

gOamData_847A7AC::
	.4byte 0x80000300, 0x00000000

gOamData_847A7B4::
	.4byte 0xc0004000, 0x00000000

gUnknown_847A7BC::
	obj_image_anim_frame  0, 1
	obj_image_anim_end

gUnknown_847A7C4::
	obj_image_anim_frame 16, 1
	obj_image_anim_end

gUnknown_847A7CC::
	obj_image_anim_frame 32, 1
	obj_image_anim_end

gUnknown_847A7D4::
	.4byte gUnknown_847A7BC
	.4byte gUnknown_847A7C4
	.4byte gUnknown_847A7CC

gUnknown_847A7E0::
	obj_image_anim_frame 48, 1
	obj_image_anim_end

gUnknown_847A7E8::
	obj_image_anim_frame 80, 1
	obj_image_anim_end

gUnknown_847A7F0::
	.4byte gUnknown_847A7E0
	.4byte gUnknown_847A7E8

gUnknown_847A7F8::
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

gUnknown_847A808::
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_frame  0x10, -0x10, 0, 8
	obj_rot_scal_anim_end

gUnknown_847A820::
	obj_rot_scal_anim_frame -0x12,  0x12, 0, 8
	obj_rot_scal_anim_end

gUnknown_847A830::
	obj_rot_scal_anim_frame   0x6,  -0x6, 0, 8
	obj_rot_scal_anim_frame  -0x4,   0x4, 0, 8
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

gUnknown_847A850::
	.4byte gUnknown_847A7F8
	.4byte gUnknown_847A808
	.4byte gUnknown_847A820
	.4byte gUnknown_847A830

gUnknown_847A860:: @ 847A860
	spr_template 0, 0, gOamData_847A7AC, gUnknown_847A7D4, NULL, gUnknown_847A850, SpriteCallbackDummy

gUnknown_847A878:: @ 847A878
	spr_template 0, 0, gOamData_847A7B4, gUnknown_847A7F0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	// berry_fix_program

gUnknown_847A890:: @ 847A890
	.4byte gUnknown_8EA467C, gUnknown_8EA52B8, gUnknown_8EA463C
	.4byte gUnknown_8EA5664, gUnknown_8EA60C8, gUnknown_8EA5604
	.4byte gUnknown_8EA6408, gUnknown_8EA7028, gUnknown_8EA63C8
	.4byte gUnknown_8EA7320, gUnknown_8EA8118, gUnknown_8EA72E0
	.4byte gUnknown_8EA8408, gUnknown_8EA8CC8, gUnknown_8EA83C8
	.4byte gUnknown_8EA8F40, gUnknown_8EA9588, gUnknown_8EA8F00

	.incbin "baserom.gba", 0x47A8D8, 0x2D4

	// trainer_tower (again?)

	@ 847ABAC
	.include "data/trainer_tower/trainers.inc"

	.align 2
gUnknown_84827AC:: @ 84827AC
	.byte 0x08, 0x01
	.align 2
	.4byte 0

gUnknown_84827B4:: @ 84827B4
	.4byte gUnknown_847F16C
	.4byte gUnknown_847D26C
	.4byte gUnknown_84808AC
	.4byte gUnknown_847ABAC
	.4byte gUnknown_847CAAC
	.4byte gUnknown_847E9AC
	.4byte gUnknown_847AF8C
	.4byte gUnknown_847CE8C
	.4byte gUnknown_847DA2C
	.4byte gUnknown_847BF0C
	.4byte gUnknown_847D64C
	.4byte gUnknown_847DE0C
	.4byte gUnknown_847B74C
	.4byte gUnknown_847BB2C
	.4byte gUnknown_848182C
	.4byte gUnknown_847F92C
	.4byte gUnknown_847C2EC
	.4byte gUnknown_847C6CC
	.4byte gUnknown_847E5CC
	.4byte gUnknown_84804CC
	.4byte gUnknown_84823CC
	.4byte gUnknown_8481FEC
	.4byte gUnknown_84800EC
	.4byte gUnknown_847E1EC
	.4byte gUnknown_847ED8C
	.4byte gUnknown_848106C
	.4byte gUnknown_8480C8C
	.4byte gUnknown_847F92C
	.4byte gUnknown_847F54C
	.4byte gUnknown_847E1EC
	.4byte gUnknown_847D64C
	.4byte gUnknown_847C6CC

	.include "data/text/move_descriptions.inc"

gUnknown_84886E8:: @ 84886E8
	.incbin "baserom.gba", 0x4886E8, 0x588
