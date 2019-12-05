#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83E1800:: @ 83E1800
	.incbin "graphics/interface/naming_screen_83E1800.4bpp"

gUnknown_83E18C0:: @ 83E18C0
	.incbin "graphics/interface/naming_screen_83E18C0.4bpp"

gUnknown_83E1980:: @ 83E1980
	.incbin "graphics/interface/naming_screen_83E1980.4bpp"

gUnknown_83E2280:: @ 83E2280
	.4byte Text_1A5CF1
	.4byte Text_1A5D31
	.4byte Text_1A5D6E
	.4byte Text_1A5DB1

gUnknown_83E2290:: @ 83E2290
	.4byte 0x000001e0
	@ {
	@   .bg = 0,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 30,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000011d9
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 29,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 1,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000021ca
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 28,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 2,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000031ff
	@ {
	@   .bg = 3,
	@   .charBaseIndex = 3,
	@   .mapBaseIndex = 31,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 3,
	@   .baseTile = 0x0000
	@ }

gUnknown_83E22A0:: @ 83E22A0
	.byte 1, 3, 10, 19, 8, 10
	.2byte 0x0030
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 3,
	@   .tilemapTop = 10,
	@   .width = 19,
	@   .height = 8,
	@   .paletteNum = 10,
	@   .baseBlock = 0x0030
	@ }
	.byte 2, 3, 10, 19, 8, 10
	.2byte 0x00c8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 3,
	@   .tilemapTop = 10,
	@   .width = 19,
	@   .height = 8,
	@   .paletteNum = 10,
	@   .baseBlock = 0x00c8
	@ }
	.byte 3, 8, 6, 14, 2, 10
	.2byte 0x0030
	@ {
	@   .bg = 3,
	@   .tilemapLeft = 8,
	@   .tilemapTop = 6,
	@   .width = 14,
	@   .height = 2,
	@   .paletteNum = 10,
	@   .baseBlock = 0x0030
	@ }
	.byte 3, 9, 4, 16, 2, 10
	.2byte 0x004c
	@ {
	@   .bg = 3,
	@   .tilemapLeft = 9,
	@   .tilemapTop = 4,
	@   .width = 16,
	@   .height = 2,
	@   .paletteNum = 10,
	@   .baseBlock = 0x004c
	@ }
	.byte 0, 0, 0, 30, 2, 11
	.2byte 0x006c
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 30,
	@   .height = 2,
	@   .paletteNum = 11,
	@   .baseBlock = 0x006c
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

gUnknown_83E22D0:: @ 83E22D0
	.string "abcdef .", 8
	.string "ghijkl ,", 8
	.string "mnopqrs",  8
	.string "tuvwxyz",  8
	.string "ABCDEF .", 8
	.string "GHIJKL ,", 8
	.string "MNOPQRS",  8
	.string "TUVWXYZ",  8
	.string "01234",    8
	.string "56789",    8
	.string "!?♂♀/-",   8
	.string "…“”‘'",    8

gUnknown_83E2330:: @ 83E2330
	.byte 0x08, 0x08, 0x06

gUnknown_83E2333:: @ 83E2333
	.byte 0x00, 0x0c, 0x18, 0x38, 0x44, 0x50, 0x5c, 0x7b, 0x00, 0x0c, 0x18, 0x38, 0x44, 0x50, 0x5c, 0x7b, 0x00, 0x16, 0x2c, 0x42, 0x58, 0x6e, 0x00, 0x00

gUnknown_83E234B:: @ 83E234B
	.byte 0x00, 0x02, 0x01

gUnknown_83E234E:: @ 83E234E
	.byte 0x01, 0x00, 0x02

gUnknown_83E2351:: @ 83E2351
	.byte 0x02, 0x01, 0x00

gUnknown_83E2354:: @ 83E2354
	.4byte sub_809E384
	.4byte sub_809E3AC
	.4byte sub_809E440
	.4byte sub_809E4D4

gUnknown_83E2364:: @ 83E2364
	.2byte 0x0000, 0xfffc, 0xfffe, 0xffff

gUnknown_83E236C:: @ 83E236C
	.2byte 0x0002, 0x0003, 0x0002, 0x0001

gUnknown_83E2374:: @ 83E2374
	.byte 0x01, 0x02, 0x03, 0x00

gUnknown_83E2378:: @ 83E2378
	.4byte sub_809EC7C
	.4byte sub_809ECD0
	.4byte sub_809ECD4
	.4byte sub_809ED48

gUnknown_83E2388:: @ 83E2388
	.2byte 0x0001, 0x0003, 0x0002

gUnknown_83E238E:: @ 83E238E
	.2byte 0x0004, 0x0006, 0x0005

gUnknown_83E2394:: @ 83E2394
	.4byte nullsub_54
	.4byte sub_809EF54
	.4byte sub_809EFB0
	.4byte sub_809EFF0
	.4byte sub_809F04C

gUnknown_83E23A8:: @ 83E23A8
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 24, 10
	obj_image_anim_frame 0, 10
	obj_image_anim_frame 32, 10
	obj_image_anim_jump 0

gUnknown_83E23BC:: @ 83E23BC
	.4byte gUnknown_83E23A8

gUnknown_83E23C0:: @ 83E23C0
	obj_tiles gUnknown_83E1980, 0x0900, 255

gUnknown_83E23C8:: @ 83E23C8
	obj_pal gUnknown_8E98004, 255

gUnknown_83E23D0:: @ 83E23D0
	.4byte sub_809F11C
	.4byte KeyboardKeyHandler_Page
	.4byte KeyboardKeyHandler_Backspace
	.4byte KeyboardKeyHandler_OK

gUnknown_83E23E0:: @ 83E23E0
	.4byte InputState_Disabled
	.4byte InputState_Enabled

gUnknown_83E23E8:: @ 83E23E8
	.2byte 0x0000, 0x0000, 0x0000, 0xffff, 0x0001

gUnknown_83E23F2:: @ 83E23F2
	.2byte 0x0000, 0xffff, 0x0001, 0x0000, 0x0000

gUnknown_83E23FC:: @ 83E23FC
	.2byte 0x0000, 0x0001, 0x0001, 0x0002

gUnknown_83E2404:: @ 83E2404
	.2byte 0x0000, 0x0000, 0x0003, 0x0000

gUnknown_83E240C:: @ 83E240C
	.4byte sub_809F49C
	.4byte sub_809F49C
	.4byte sub_809F4F0
	.4byte sub_809F4F0
	.4byte sub_809F49C

gUnknown_83E2420:: @ 83E2420
	.4byte nullsub_55
	.4byte sub_809F5C4

gUnknown_83E2428:: @ 83E2428
	.byte 0x00, 0x09, 0x08, 0x00
	.byte 0x05, 0x04, 0x00, 0x00

gUnknown_83E2430:: @ 83E2430
	.byte 0x0d, 0x01, 0x02, 0x00

gUnknown_83E2434:: @ 83E2434
	.byte 0x0e, 0x01, 0x02, 0x00

gUnknown_83E2438:: @ 83E2438
	.byte 0x0f, 0x01, 0x02, 0x00

gUnknown_83E243C:: @ 83E243C
	.byte 0xee, 0xdd, 0xff, 0x00

gUnknown_83E2440:: @ 83E2440
	.4byte gUnknown_83E2434
	.4byte gUnknown_83E2430
	.4byte gUnknown_83E2438

gUnknown_83E244C:: @ 83E244C
	.4byte gUnknown_8E98398
	.4byte gUnknown_8E98458
	.4byte gUnknown_8E98518

gUnknown_83E2458:: @ 83E2458
	.byte 0x0f, 0x01, 0x02

	.align 2
gUnknown_83E245C:: @ 83E245C
	.byte 0x00, 0x07, 0x01, 0x00, 0x01
	.align 2
	.4byte gUnknown_8418E47

gUnknown_83E2468:: @ 83E2468
	.byte 0x00, 0x08, 0x02, 0x00, 0x01
	.align 2
	.4byte gUnknown_8418E52

gUnknown_83E2474:: @ 83E2474
	.byte 0x00, 0x0a, 0x03, 0x01, 0x01
	.align 2
	.4byte gUnknown_8418E5C

gUnknown_83E2480:: @ 83E2480
	.byte 0x00, 0x07, 0x04, 0x00, 0x01
	.align 2
	.4byte gUnknown_8418E69

gUnknown_83E248C:: @ 83E248C
	.4byte gUnknown_83E245C
	.4byte gUnknown_83E2468
	.4byte gUnknown_83E2474
	.4byte gUnknown_83E2474
	.4byte gUnknown_83E2480

gUnknown_83E24A0:: @ 83E24A0
	.4byte 0x00000000, 0x00000000

gUnknown_83E24A8:: @ 3E24A8
	.4byte 0x40000000, 0x00000000

gUnknown_83E24B0:: @ 3E24B0
	.4byte 0x80004000, 0x00000000

gUnknown_83E24B8:: @ 83E24B8
	subsprite 236, 240, 1, 0x0000, 32x8
	subsprite 12, 240, 1, 0x0004, 8x8
	subsprite 236, 248, 1, 0x0005, 32x8
	subsprite 12, 248, 1, 0x0009, 8x8
	subsprite 236, 0, 1, 0x000a, 32x8
	subsprite 12, 0, 1, 0x000e, 8x8
	subsprite 236, 8, 1, 0x000f, 32x8
	subsprite 12, 8, 1, 0x0013, 8x8

gUnknown_83E24D8:: @ 83E24D8
	subsprite 244, 252, 1, 0x0000, 16x8
	subsprite 4, 252, 1, 0x0002, 8x8

gUnknown_83E24E0:: @ 83E24E0
	subsprite 236, 244, 1, 0x0000, 32x8
	subsprite 12, 244, 1, 0x0004, 8x8
	subsprite 236, 252, 1, 0x0005, 32x8
	subsprite 12, 252, 1, 0x0009, 8x8
	subsprite 236, 4, 1, 0x000a, 32x8
	subsprite 12, 4, 1, 0x000e, 8x8

gUnknown_83E24F8::
	subsprite 248, 244, 3, 0x0000, 16x8
	subsprite 248, 252, 3, 0x0002, 16x8
	subsprite 248, 4, 3, 0x0004, 16x8

gUnknown_83E2504:: @ 83E2504
	.byte 0x08
	.align 2
	.4byte gUnknown_83E24B8

gUnknown_83E250C:: @ 83E250C
	.byte 0x02
	.align 2
	.4byte gUnknown_83E24D8
	.byte 0x02
	.align 2
	.4byte gUnknown_83E24D8
	.byte 0x02
	.align 2
	.4byte gUnknown_83E24D8

gUnknown_83E2524:: @ 83E2524
	.byte 0x06
	.align 2
	.4byte gUnknown_83E24E0

gUnknown_83E252C:: @ 83E252C
	.byte 0x03
	.align 2
	.4byte gUnknown_83E24F8

gUnknown_83E2534:: @ 83E2534
	obj_frame_tiles gUnknown_83E1800, 0x00c0
	obj_frame_tiles gUnknown_83E18C0, 0x00c0

gUnknown_83E2544:: @ 83E2544
	obj_image_anim_frame 0, 1
	obj_image_anim_jump 0

gUnknown_83E254C:: @ 83E254C
	obj_image_anim_frame 4, 8
	obj_image_anim_frame 8, 8
	obj_image_anim_end

gUnknown_83E2558:: @ 83E2558
	obj_image_anim_frame 0, 2
	obj_image_anim_frame 1, 2
	obj_image_anim_jump 0

gUnknown_83E2564:: @ 83E2564
	.4byte gUnknown_83E2544

gUnknown_83E2568:: @ 83E2568
	.4byte gUnknown_83E2544
	.4byte gUnknown_83E254C

gUnknown_83E2570:: @ 83E2570
	.4byte gUnknown_83E2558

gUnknown_83E2574:: @ 83E2574
	spr_template 2, 4, gUnknown_83E24A0, gUnknown_83E2564, NULL, gDummySpriteAffineAnimTable, sub_809EC54

gUnknown_83E258C:: @ 83E258C
	spr_template 3, 1, gUnknown_83E24B0, gUnknown_83E2564, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E25A4:: @ 83E25A4
	spr_template 4, 4, gUnknown_83E24A0, gUnknown_83E2564, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E25BC:: @ 83E25BC
	spr_template 0, 6, gUnknown_83E24A0, gUnknown_83E2564, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E25D4:: @ 83E25D4
	spr_template 1, 7, gUnknown_83E24A0, gUnknown_83E2564, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E25EC:: @ 83E25EC
	spr_template 7, 5, gUnknown_83E24A8, gUnknown_83E2568, NULL, gDummySpriteAffineAnimTable, sub_809E700

gUnknown_83E2604:: @ 83E2604
	spr_template 10, 3, gUnknown_83E24A0, gUnknown_83E2564, NULL, gDummySpriteAffineAnimTable, sub_809E7F0

gUnknown_83E261C:: @ 83E261C
	spr_template 11, 3, gUnknown_83E24A0, gUnknown_83E2564, NULL, gDummySpriteAffineAnimTable, sub_809E83C

gUnknown_83E2634:: @ 83E2634
	spr_template 65535, 0, gUnknown_83E24A0, gUnknown_83E2570, gUnknown_83E2534, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83E264C:: @ 83E264C
	.4byte gUnknown_847A955
	.4byte gUnknown_847A976
	.4byte gUnknown_847A997
	.4byte gUnknown_847A9B8
	.4byte gUnknown_847A9D9
	.4byte gUnknown_847A9FA
	.4byte gUnknown_847AA1B
	.4byte gUnknown_847AA3C
	.4byte gUnknown_847AA5D
	.4byte gUnknown_847AA76
	.4byte gUnknown_847AA8F
	.4byte gUnknown_847AAA8

gUnknown_83E267C:: @ 83E267C
	obj_tiles gUnknown_8E98858, 0x01e0, 0
	obj_tiles gUnknown_8E98A38, 0x01e0, 1
	obj_tiles gUnknown_8E985D8, 0x0280, 2
	obj_tiles gUnknown_8E98FD8, 0x0100, 3
	obj_tiles gUnknown_8E98C18, 0x0060, 4
	obj_tiles gUnknown_8E98CB8, 0x0060, 5
	obj_tiles gUnknown_8E98D58, 0x0060, 6
	obj_tiles gUnknown_8E98DF8, 0x0080, 7
	obj_tiles gUnknown_8E98E98, 0x0080, 8
	obj_tiles gUnknown_8E98F38, 0x0080, 9
	obj_tiles gUnknown_8E990D8, 0x0020, 10
	obj_tiles gUnknown_8E990F8, 0x0020, 11
	null_obj_tiles

gUnknown_83E26E4:: @ 83E26E4
	obj_pal gUnknown_8E98024, 0
	obj_pal gUnknown_8E98044, 1
	obj_pal gUnknown_8E98064, 2
	obj_pal gUnknown_8E98084, 3
	obj_pal gUnknown_8E980A4, 4
	obj_pal gUnknown_8E980C4, 5
	obj_pal gUnknown_8E980A4, 6
	obj_pal gUnknown_8E980A4, 7
	null_obj_pal
