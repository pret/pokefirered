	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2, 0

gUnknown_824829C:: @ 824829C
	.byte 1, 2, 0

	.align 2
gOamData_82482A0::
	.4byte 0xc0000300, 0x00000000

gOamData_82482A8::
	.4byte 0xc0000300, 0x00000040

gUnknown_82482B0::
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_end

gUnknown_82482C0::
	obj_rot_scal_anim_frame 0x80, 0x80, 0, 0
	obj_rot_scal_anim_frame 0x18, 0x18, 0, 0x80
	obj_rot_scal_anim_frame 0x18, 0x18, 0, 0x80
	obj_rot_scal_anim_end

gAffineAnimTable_82482E0::
	.4byte gUnknown_82482B0
	.4byte gUnknown_82482C0

gUnknown_82482E8:: @ 82482E8
	spr_template 10000, 10000, gOamData_82482A0, gDummySpriteAnimTable, NULL, gAffineAnimTable_82482E0, nullsub_9

gUnknown_8248300:: @ 8248300
	spr_template 10000, 10000, gOamData_82482A8, gDummySpriteAnimTable, NULL, gAffineAnimTable_82482E0, nullsub_9

gUnknown_8248318:: @ 8248318
	obj_tiles gFile_graphics_battle_transitions_vs_sheet, 0x1000, 10000

gBattleBgTemplates:: @ 8248320
	.4byte 0x00000580
	@ {
	@   .bg = 0,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 24,
	@   .screenSize = 2,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000005c5
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 1,
	@   .mapBaseIndex = 28,
	@   .screenSize = 2,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000013e6
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 1,
	@   .mapBaseIndex = 30,
	@   .screenSize = 1,
	@   .paletteMode = 0,
	@   .priority = 1,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000033ab
	@ {
	@   .bg = 3,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 26,
	@   .screenSize = 1,
	@   .paletteMode = 0,
	@   .priority = 3,
	@   .baseTile = 0x0000
	@ }

gUnknown_8248330:: @ 8248330
	.byte 0, 1, 15, 28, 4, 0
	.2byte 0x0090
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 1,
	@   .tilemapTop = 15,
	@   .width = 28,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0090
	@ }
	.byte 0, 1, 35, 14, 4, 0
	.2byte 0x01c0
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 1,
	@   .tilemapTop = 35,
	@   .width = 14,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01c0
	@ }
	.byte 0, 17, 35, 12, 4, 5
	.2byte 0x0190
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 17,
	@   .tilemapTop = 35,
	@   .width = 12,
	@   .height = 4,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0190
	@ }
	.byte 0, 2, 55, 8, 2, 5
	.2byte 0x0300
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 55,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0300
	@ }
	.byte 0, 11, 55, 8, 2, 5
	.2byte 0x0310
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 11,
	@   .tilemapTop = 55,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0310
	@ }
	.byte 0, 2, 57, 8, 2, 5
	.2byte 0x0320
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 57,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0320
	@ }
	.byte 0, 11, 57, 8, 2, 5
	.2byte 0x0330
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 11,
	@   .tilemapTop = 57,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0330
	@ }
	.byte 0, 21, 55, 3, 2, 5
	.2byte 0x0290
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 55,
	@   .width = 3,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0290
	@ }
	.byte 0, 21, 57, 8, 2, 5
	.2byte 0x0296
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 57,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0296
	@ }
	.byte 0, 24, 55, 5, 2, 5
	.2byte 0x02a6
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 24,
	@   .tilemapTop = 55,
	@   .width = 5,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x02a6
	@ }
	.byte 0, 25, 57, 0, 0, 5
	.2byte 0x02b0
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 25,
	@   .tilemapTop = 57,
	@   .width = 0,
	@   .height = 0,
	@   .paletteNum = 5,
	@   .baseBlock = 0x02b0
	@ }
	.byte 0, 21, 55, 8, 4, 5
	.2byte 0x02b0
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 55,
	@   .width = 8,
	@   .height = 4,
	@   .paletteNum = 5,
	@   .baseBlock = 0x02b0
	@ }
	.byte 1, 19, 8, 10, 11, 5
	.2byte 0x0100
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 19,
	@   .tilemapTop = 8,
	@   .width = 10,
	@   .height = 11,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0100
	@ }
	.byte 2, 18, 0, 12, 3, 6
	.2byte 0x016e
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 18,
	@   .tilemapTop = 0,
	@   .width = 12,
	@   .height = 3,
	@   .paletteNum = 6,
	@   .baseBlock = 0x016e
	@ }
	.byte 0, 25, 9, 4, 4, 5
	.2byte 0x0100
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 25,
	@   .tilemapTop = 9,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0100
	@ }
	.byte 1, 2, 3, 7, 2, 5
	.2byte 0x0020
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 3,
	@   .width = 7,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0020
	@ }
	.byte 2, 2, 3, 7, 2, 5
	.2byte 0x0040
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 3,
	@   .width = 7,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0040
	@ }
	.byte 1, 2, 2, 7, 2, 5
	.2byte 0x0020
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 2,
	@   .width = 7,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0020
	@ }
	.byte 2, 2, 2, 7, 2, 5
	.2byte 0x0040
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 2,
	@   .width = 7,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0040
	@ }
	.byte 1, 2, 6, 7, 2, 5
	.2byte 0x0060
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 6,
	@   .width = 7,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0060
	@ }
	.byte 2, 2, 6, 7, 2, 5
	.2byte 0x0080
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 6,
	@   .width = 7,
	@   .height = 2,
	@   .paletteNum = 5,
	@   .baseBlock = 0x0080
	@ }
	.byte 0, 11, 2, 8, 2, 0
	.2byte 0x00a0
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 11,
	@   .tilemapTop = 2,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x00a0
	@ }
	.byte 0, 4, 2, 8, 2, 0
	.2byte 0x00a0
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 4,
	@   .tilemapTop = 2,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x00a0
	@ }
	.byte 0, 19, 2, 8, 2, 0
	.2byte 0x00b0
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 19,
	@   .tilemapTop = 2,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x00b0
	@ }
	.byte 0, 2, 15, 26, 4, 7
	.2byte 0x0090
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 15,
	@   .width = 26,
	@   .height = 4,
	@   .paletteNum = 7,
	@   .baseBlock = 0x0090
	@ }
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000
	@ {
	@   .bg = 255,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 0,
	@   .height = 0,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_8248400:: @ 8248400
	.incbin "graphics/battle/unk_8248400.gbapal.lz"

gUnknown_824844C:: @ 824844C
	.incbin "graphics/battle/unk_824844C.4bpp.lz"

gUnknown_82489A8:: @ 82489A8
	.incbin "graphics/battle/unk_82489A8.bin.lz"

gUnknown_8248C68:: @ 8248C68
	.incbin "graphics/battle/unk_8248C68.4bpp.lz"

gUnknown_8248F58:: @ 8248F58
	.incbin "graphics/battle/unk_8248F58.bin.lz"

gUnknown_8249074:: @ 8249074
	.incbin "graphics/battle/unk_8249074.gbapal.lz"

gUnknown_82490C4:: @ 82490C4
	.incbin "graphics/battle/unk_82490C4.4bpp.lz"

gUnknown_8249620:: @ 8249620
	.incbin "graphics/battle/unk_8249620.bin.lz"

gUnknown_82498DC:: @ 82498DC
	.incbin "graphics/battle/unk_82498DC.4bpp.lz"

gUnknown_8249E10:: @ 8249E10
	.incbin "graphics/battle/unk_8249E10.bin.lz"

gUnknown_8249F98:: @ 8249F98
	.incbin "graphics/battle/unk_8249F98.gbapal.lz"

gUnknown_8249FE4:: @ 8249FE4
	.incbin "graphics/battle/unk_8249FE4.4bpp.lz"

gUnknown_824A37C:: @ 824A37C
	.incbin "graphics/battle/unk_824A37C.bin.lz"

gUnknown_824A618:: @ 824A618
	.incbin "graphics/battle/unk_824A618.4bpp.lz"

gUnknown_824A844:: @ 824A844
	.incbin "graphics/battle/unk_824A844.bin.lz"

gUnknown_824A940:: @ 824A940
	.incbin "graphics/battle/unk_824A940.gbapal.lz"

gUnknown_824A990:: @ 824A990
	.incbin "graphics/battle/unk_824A990.4bpp.lz"

gUnknown_824ACD0:: @ 824ACD0
	.incbin "graphics/battle/unk_824ACD0.bin.lz"

gUnknown_824AF70:: @ 824AF70
	.incbin "graphics/battle/unk_824AF70.4bpp.lz"

gUnknown_824B0DC:: @ 824B0DC
	.incbin "graphics/battle/unk_824B0DC.bin.lz"

gUnknown_824B19C:: @ 824B19C
	.incbin "graphics/battle/unk_824B19C.gbapal.lz"

gUnknown_824B1EC:: @ 824B1EC
	.incbin "graphics/battle/unk_824B1EC.4bpp.lz"

gUnknown_824B608:: @ 824B608
	.incbin "graphics/battle/unk_824B608.bin.lz"

gUnknown_824B8A8:: @ 824B8A8
	.incbin "graphics/battle/unk_824B8A8.4bpp.lz"

gUnknown_824BBE0:: @ 824BBE0
	.incbin "graphics/battle/unk_824BBE0.bin.lz"

gUnknown_824BCE0:: @ 824BCE0
	.incbin "graphics/battle/unk_824BCE0.gbapal.lz"

gUnknown_824BD38:: @ 824BD38
	.incbin "graphics/battle/unk_824BD38.4bpp.lz"

gUnknown_824C07C:: @ 824C07C
	.incbin "graphics/battle/unk_824C07C.bin.lz"

gUnknown_824C314:: @ 824C314
	.incbin "graphics/battle/unk_824C314.4bpp.lz"

gUnknown_824C520:: @ 824C520
	.incbin "graphics/battle/unk_824C520.bin.lz"

gUnknown_824C5D8:: @ 824C5D8
	.incbin "graphics/battle/unk_824C5D8.gbapal.lz"

gUnknown_824C624:: @ 824C624
	.incbin "graphics/battle/unk_824C624.4bpp.lz"

gUnknown_824C958:: @ 824C958
	.incbin "graphics/battle/unk_824C958.bin.lz"

gUnknown_824CBF8:: @ 824CBF8
	.incbin "graphics/battle/unk_824CBF8.4bpp.lz"

gUnknown_824CEC8:: @ 824CEC8
	.incbin "graphics/battle/unk_824CEC8.bin.lz"

gUnknown_824CF98:: @ 824CF98
	.incbin "graphics/battle/unk_824CF98.gbapal.lz"

gUnknown_824CFEC:: @ 824CFEC
	.incbin "graphics/battle/unk_824CFEC.4bpp.lz"

gUnknown_824D418:: @ 824D418
	.incbin "graphics/battle/unk_824D418.bin.lz"

gUnknown_824D6B8:: @ 824D6B8
	.incbin "graphics/battle/unk_824D6B8.4bpp.lz"

gUnknown_824DC98:: @ 824DC98
	.incbin "graphics/battle/unk_824DC98.bin.lz"

gUnknown_824DDF0:: @ 824DDF0
	.incbin "graphics/battle/unk_824DDF0.gbapal.lz"

gUnknown_824DE34:: @ 824DE34
	.incbin "graphics/battle/unk_824DE34.4bpp.lz"

gUnknown_824E16C:: @ 824E16C
	.incbin "graphics/battle/unk_824E16C.bin.lz"

gUnknown_824E410:: @ 824E410
	.incbin "graphics/battle/unk_824E410.4bpp.lz"

gUnknown_824E490:: @ 824E490
	.incbin "graphics/battle/unk_824E490.bin.lz"

gUnknown_824E528:: @ 824E528
	.incbin "graphics/battle/unk_824E528.gbapal.lz"

gUnknown_824E56C:: @ 824E56C
	.incbin "graphics/battle/unk_824E56C.gbapal.lz"

gUnknown_824E5B8:: @ 824E5B8
	.incbin "graphics/battle/unk_824E5B8.gbapal.lz"

gUnknown_824E604:: @ 824E604
	.incbin "graphics/battle/unk_824E604.gbapal.lz"

gUnknown_824E650:: @ 824E650
	.incbin "graphics/battle/unk_824E650.gbapal.lz"

gUnknown_824E6A4:: @ 824E6A4
	.incbin "graphics/battle/unk_824E6A4.gbapal.lz"

gUnknown_824E6F0:: @ 824E6F0
	.incbin "graphics/battle/unk_824E6F0.gbapal.lz"

gUnknown_824E740:: @ 824E740
	.incbin "graphics/battle/unk_824E740.gbapal.lz"

gUnknown_824E78C:: @ 824E78C
	.incbin "graphics/battle/unk_824E78C.gbapal.lz"

gUnknown_824E7DC:: @ 824E7DC
	.incbin "graphics/battle/unk_824E7DC.gbapal.lz"

gUnknown_824E81C:: @ 824E81C
	.incbin "graphics/battle/unk_824E81C.gbapal.lz"

gUnknown_824E858:: @ 824E858
	.incbin "graphics/battle/unk_824E858.4bpp.lz"

gUnknown_824EB90:: @ 824EB90
	.incbin "graphics/battle/unk_824EB90.bin.lz"

gUnknown_824EE34:: @ 824EE34
	.4byte gUnknown_824844C, gUnknown_82489A8, gUnknown_8248C68, gUnknown_8248F58, gUnknown_8248400
	.4byte gUnknown_82490C4, gUnknown_8249620, gUnknown_82498DC, gUnknown_8249E10, gUnknown_8249074
	.4byte gUnknown_8249FE4, gUnknown_824A37C, gUnknown_824A618, gUnknown_824A844, gUnknown_8249F98
	.4byte gUnknown_824A990, gUnknown_824ACD0, gUnknown_824AF70, gUnknown_824B0DC, gUnknown_824A940
	.4byte gUnknown_824B1EC, gUnknown_824B608, gUnknown_824B8A8, gUnknown_824BBE0, gUnknown_824B19C
	.4byte gUnknown_824BD38, gUnknown_824C07C, gUnknown_824C314, gUnknown_824C520, gUnknown_824BCE0
	.4byte gUnknown_824C624, gUnknown_824C958, gUnknown_824CBF8, gUnknown_824CEC8, gUnknown_824C5D8
	.4byte gUnknown_824CFEC, gUnknown_824D418, gUnknown_824D6B8, gUnknown_824DC98, gUnknown_824CF98
	.4byte gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824DDF0
	.4byte gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E81C
	.4byte gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E528
	.4byte gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E56C
	.4byte gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E5B8
	.4byte gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E604
	.4byte gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E650
	.4byte gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E6A4
	.4byte gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E6F0
	.4byte gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E740
	.4byte gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E78C
	.4byte gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E7DC

@ struct {u8; u8;}
gUnknown_824EFC4:: @ 824EFC4
	.byte 0x01, 0x0b
	.align 2
	.byte 0x02, 0x0e
	.align 2
	.byte 0x03, 0x0d
	.align 2
	.byte 0x04, 0x0f
	.align 2
	.byte 0x05, 0x10
	.align 2
	.byte 0x06, 0x11
	.align 2
	.byte 0x07, 0x12
	.align 2
	.byte 0x08, 0x0a
	.align 2
