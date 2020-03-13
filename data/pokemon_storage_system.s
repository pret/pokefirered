#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83CEBF0:: @ 83CEBF0 spr_template
	spr_template 18, 56000, gUnknown_83CEC08, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83CEC08::
	.4byte 0x80000000, 0x00000000

gUnknown_83CEC10::
	obj_rot_scal_anim_frame -2, -2, 0, 120
	obj_rot_scal_anim_end

gUnknown_83CEC20::
	obj_rot_scal_anim_frame 16, 16, 0, 0
	obj_rot_scal_anim_frame 16, 16, 0, 15
	obj_rot_scal_anim_end

gUnknown_83CEC38:: @ 83CEC38 dataptr
	.4byte gUnknown_83CEC10
	.4byte gUnknown_83CEC20

gUnknown_83CEC40:: @ 83CEC40
	.incbin "graphics/interface/pss_unk_83CEC40.gbapal"

gUnknown_83CEC80:: @ 83CEC80
	.incbin "graphics/interface/pss_unk_83CEC80.4bpp.lz"

gUnknown_83CF050:: @ 83CF050
	.incbin "graphics/interface/pss_unk_83CF050.bin.lz"

gUnknown_83CF12C:: @ 83CF12C
	.incbin "graphics/interface/pss_unk_83CF12C.gbapal"

gUnknown_83CF16C:: @ 83CF16C
	.incbin "graphics/interface/pss_unk_83CF16C.4bpp.lz"

gUnknown_83CF374:: @ 83CF374
	.incbin "graphics/interface/pss_unk_83CF374.bin.lz"

gUnknown_83CF424:: @ 83CF424
	.incbin "graphics/interface/pss_unk_83CF424.gbapal"

gUnknown_83CF464:: @ 83CF464
	.incbin "graphics/interface/pss_unk_83CF464.4bpp.lz"

gUnknown_83CF750:: @ 83CF750
	.incbin "graphics/interface/pss_unk_83CF750.bin.lz"

gUnknown_83CF834:: @ 83CF834
	.incbin "graphics/interface/pss_unk_83CF834.gbapal"

gUnknown_83CF874:: @ 83CF874
	.incbin "graphics/interface/pss_unk_83CF874.4bpp.lz"

gUnknown_83CFA94:: @ 83CFA94
	.incbin "graphics/interface/pss_unk_83CFA94.bin.lz"

gUnknown_83CFB60:: @ 83CFB60
	.incbin "graphics/interface/pss_unk_83CFB60.gbapal"

gUnknown_83CFBA0:: @ 83CFBA0
	.incbin "graphics/interface/pss_unk_83CFBA0.4bpp.lz"

gUnknown_83CFEF0:: @ 83CFEF0
	.incbin "graphics/interface/pss_unk_83CFEF0.bin.lz"

gUnknown_83CFFC8:: @ 83CFFC8
	.incbin "graphics/interface/pss_unk_83CFFC8.gbapal"

gUnknown_83D0008:: @ 83D0008
	.incbin "graphics/interface/pss_unk_83D0008.4bpp.lz"
	.space 4

gUnknown_83D033C:: @ 83D033C
	.incbin "graphics/interface/pss_unk_83D033C.bin.lz"

gUnknown_83D0414:: @ 83D0414
	.incbin "graphics/interface/pss_unk_83D0414.gbapal"

gUnknown_83D0454:: @ 83D0454
	.incbin "graphics/interface/pss_unk_83D0454.4bpp.lz"

gUnknown_83D070C:: @ 83D070C
	.incbin "graphics/interface/pss_unk_83D070C.bin.lz"

gUnknown_83D07D8:: @ 83D07D8
	.incbin "graphics/interface/pss_unk_83D07D8.gbapal"

gUnknown_83D0818:: @ 83D0818
	.incbin "graphics/interface/pss_unk_83D0818.4bpp.lz"

gUnknown_83D0B5C:: @ 83D0B5C
	.incbin "graphics/interface/pss_unk_83D0B5C.bin.lz"

gUnknown_83D0C38:: @ 83D0C38
	.incbin "graphics/interface/pss_unk_83D0C38.gbapal"

gUnknown_83D0C78:: @ 83D0C78
	.incbin "graphics/interface/pss_unk_83D0C78.4bpp.lz"

gUnknown_83D0FFC:: @ 83D0FFC
	.incbin "graphics/interface/pss_unk_83D0FFC.bin.lz"

gUnknown_83D10E4:: @ 83D10E4
	.incbin "graphics/interface/pss_unk_83D10E4.gbapal"

gUnknown_83D1124:: @ 83D1124
	.incbin "graphics/interface/pss_unk_83D1124.4bpp.lz"

gUnknown_83D13D8:: @ 83D13D8
	.incbin "graphics/interface/pss_unk_83D13D8.bin.lz"

gUnknown_83D14B4:: @ 83D14B4
	.incbin "graphics/interface/pss_unk_83D14B4.gbapal"

gUnknown_83D14F4:: @ 83D14F4
	.incbin "graphics/interface/pss_unk_83D14F4.4bpp.lz"

gUnknown_83D1788:: @ 83D1788
	.incbin "graphics/interface/pss_unk_83D1788.bin.lz"

gUnknown_83D1874:: @ 83D1874
	.incbin "graphics/interface/pss_unk_83D1874.gbapal"

gUnknown_83D18B4:: @ 83D18B4
	.incbin "graphics/interface/pss_unk_83D18B4.4bpp.lz"

gUnknown_83D1B4C:: @ 83D1B4C
	.incbin "graphics/interface/pss_unk_83D1B4C.bin.lz"

gUnknown_83D1C2C:: @ 83D1C2C
	.incbin "graphics/interface/pss_unk_83D1C2C.gbapal"

	.space 32

gUnknown_83D1C8C:: @ 83D1C8C
	.incbin "graphics/interface/pss_unk_83D1C8C.4bpp.lz"

gUnknown_83D1EC4:: @ 83D1EC4
	.incbin "graphics/interface/pss_unk_83D1EC4.bin.lz"

gUnknown_83D1F94:: @ 83D1F94
	.incbin "graphics/interface/pss_unk_83D1F94.gbapal"

gUnknown_83D1FD4:: @ 83D1FD4
	.incbin "graphics/interface/pss_unk_83D1FD4.4bpp.lz"

gUnknown_83D22B8:: @ 83D22B8
	.incbin "graphics/interface/pss_unk_83D22B8.bin.lz"

gUnknown_83D239C:: @ 83D239C
	.incbin "graphics/interface/pss_unk_83D239C.gbapal"

gUnknown_83D23DC:: @ 83D23DC
	.incbin "graphics/interface/pss_unk_83D23DC.4bpp.lz"

gUnknown_83D256C:: @ 83D256C
	.incbin "graphics/interface/pss_unk_83D256C.bin.lz"

gUnknown_83D2614:: @ 83D2614
	.incbin "graphics/interface/pss_unk_83D2614.gbapal"

gUnknown_83D2654:: @ 83D2654
	.incbin "graphics/interface/pss_unk_83D2654.4bpp.lz"

gUnknown_83D277C:: @ 83D277C
	.incbin "graphics/interface/pss_unk_83D277C.bin.lz"

	.incbin "graphics/interface/pss_unk_83D2820.bin"

gUnknown_83D29D0:: @ 83D29D0
	.incbin "graphics/interface/pss_unk_83D29D0.gbapal"

gUnknown_83D2A10:: @ 83D2A10
	.4byte gUnknown_83CEC80, gUnknown_83CF050, gUnknown_83CEC40
	.4byte gUnknown_83CF16C, gUnknown_83CF374, gUnknown_83CF12C
	.4byte gUnknown_83CF464, gUnknown_83CF750, gUnknown_83CF424
	.4byte gUnknown_83CF874, gUnknown_83CFA94, gUnknown_83CF834
	.4byte gUnknown_83CFBA0, gUnknown_83CFEF0, gUnknown_83CFB60
	.4byte gUnknown_83D0008, gUnknown_83D033C, gUnknown_83CFFC8
	.4byte gUnknown_83D0454, gUnknown_83D070C, gUnknown_83D0414
	.4byte gUnknown_83D0818, gUnknown_83D0B5C, gUnknown_83D07D8
	.4byte gUnknown_83D0C78, gUnknown_83D0FFC, gUnknown_83D0C38
	.4byte gUnknown_83D1124, gUnknown_83D13D8, gUnknown_83D10E4
	.4byte gUnknown_83D14F4, gUnknown_83D1788, gUnknown_83D14B4
	.4byte gUnknown_83D18B4, gUnknown_83D1B4C, gUnknown_83D1874
	.4byte gUnknown_83D1C8C, gUnknown_83D1EC4, gUnknown_83D1C2C
	.4byte gUnknown_83D1FD4, gUnknown_83D22B8, gUnknown_83D1F94
	.4byte gUnknown_83D23DC, gUnknown_83D256C, gUnknown_83D239C
	.4byte gUnknown_83D2654, gUnknown_83D277C, gUnknown_83D2614

gUnknown_83D2AD0::
	.incbin "graphics/interface/pss_unk_83D2AD0.4bpp"
	.4byte 0x000023ba

gUnknown_83D2B54:: @ 83D2B54
	obj_tiles gUnknown_83D2AD0, 0x0080, 6

gUnknown_83D2B5C::
	.4byte 0x80004000, 0x00000800

gUnknown_83D2B64::
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_end

gUnknown_83D2B6C::
	obj_image_anim_frame 0x0008, 5
	obj_image_anim_end

gUnknown_83D2B74::
	.4byte gUnknown_83D2B64
	.4byte gUnknown_83D2B6C

gUnknown_83D2B7C:: @ 83D2B7C
	spr_template 3, 56009, gUnknown_83D2B5C, gUnknown_83D2B74, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83D2B94::
	.4byte 0x00008000, 0x00000800

gUnknown_83D2B9C::
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_end

gUnknown_83D2BA4::
	obj_image_anim_frame 0x0002, 5
	obj_image_anim_end

gUnknown_83D2BAC::
	.4byte gUnknown_83D2B9C
	.4byte gUnknown_83D2BA4

gUnknown_83D2BB4:: @ 83D2BB4
	spr_template 6, 56010, gUnknown_83D2B94, gUnknown_83D2BAC, NULL, gDummySpriteAffineAnimTable, sub_8092164

gUnknown_83D2BCC::
	.incbin "graphics/interface/pss_unk_83D2BCC.gbapal"

gUnknown_83D2BEC::
	.incbin "graphics/interface/pss_unk_83D2BEC.4bpp"

gUnknown_83D33EC::
	.incbin "graphics/interface/pss_unk_83D33EC.4bpp"

gUnknown_83D346C:: @ 83D346C
	.4byte sub_8092C18
	.4byte sub_8092CA4
	.4byte sub_8092D20

gUnknown_83D3478:: @ 83D3478
	.4byte sub_8093F98
	.byte 0
	.align 2
	.4byte sub_809448C
	.byte 1
	.align 2
	.4byte sub_80946AC
	.byte 2
	.align 2
	.4byte sub_80947A0
	.byte 3
	.align 2
	.4byte NULL
	.byte 0
	.align 2

gUnknown_83D34A0:: @ 83D34A0
	obj_tiles gUnknown_83D2BEC, 0x0800, 0
	obj_tiles gUnknown_83D33EC, 0x0080, 1
	null_obj_tiles

gUnknown_83D34B8:: @ 83D34B8
	obj_pal gUnknown_83D2BCC, 56007
	null_obj_pal

gUnknown_83D34C8::
	.4byte 0x80000000, 0x00000400

gUnknown_83D34D0::
	.4byte 0x40000000, 0x00000400

gUnknown_83D34D8::
	obj_image_anim_frame 0x0000, 30
	obj_image_anim_frame 0x0010, 30
	obj_image_anim_jump 0

gUnknown_83D34E4::
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_end

gUnknown_83D34EC::
	obj_image_anim_frame 0x0020, 5
	obj_image_anim_end

gUnknown_83D34F4::
	obj_image_anim_frame 0x0030, 5
	obj_image_anim_end

gUnknown_83D34FC::
	.4byte gUnknown_83D34D8
	.4byte gUnknown_83D34E4
	.4byte gUnknown_83D34EC
	.4byte gUnknown_83D34F4

gUnknown_83D350C:: @ 83D350C
	spr_template 0, 56010, gUnknown_83D34C8, gUnknown_83D34FC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83D3524:: @ 83D3524
	spr_template 1, 56010, gUnknown_83D34D0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8094AB8

gUnknown_83D353C:: @ 83D353C
	.4byte gUnknown_8418468
	.4byte gUnknown_841846F
	.4byte gUnknown_8418475
	.4byte gUnknown_8418484
	.4byte gUnknown_841847E
	.4byte gUnknown_8418489
	.4byte gUnknown_841848F
	.4byte gUnknown_8418497
	.4byte gUnknown_841849F
	.4byte gUnknown_84184A9
	.4byte gUnknown_84184AE
	.4byte gUnknown_84184A4
	.4byte gUnknown_84184B8
	.4byte gUnknown_84184BD
	.4byte gUnknown_84184BD
	.4byte gUnknown_84184C2
	.4byte gUnknown_84184C9
	.4byte gUnknown_84184CD
	.4byte gUnknown_84184D2
	.4byte gUnknown_84184DC
	.4byte gUnknown_84184E6
	.4byte gUnknown_84184F0
	.4byte gUnknown_84184F9
	.4byte gUnknown_8418500
	.4byte gUnknown_8418505
	.4byte gUnknown_841850C
	.4byte gUnknown_8418514
	.4byte gUnknown_8418519
	.4byte gUnknown_8418521
	.4byte gUnknown_8418526
	.4byte gUnknown_841852B
	.4byte gUnknown_8418531
	.4byte gUnknown_841853A
	.4byte gUnknown_8418540
	.4byte gUnknown_8418544
	.4byte gUnknown_841854A
	.4byte gUnknown_8418555
	.4byte gUnknown_841855B

gUnknown_83D35D4:: @ 83D35D4
	.byte 0, 10, 3, 20, 18, 9
	.2byte 0x000a

gUnknown_83D35DC:: @ 83D35DC
	.incbin "graphics/interface/pss_unk_83D35DC.4bpp"

gUnknown_83D365C::
	.4byte 0x80000100, 0x00000400

gUnknown_83D3664::
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D3674::
	obj_rot_scal_anim_frame 88, 88, 0, 0
	obj_rot_scal_anim_frame 5, 5, 0, 8
	obj_rot_scal_anim_end

gUnknown_83D368C::
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_frame -5, -5, 0, 8
	obj_rot_scal_anim_end

gUnknown_83D36A4::
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_frame 10, 10, 0, 12
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D36C4::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame -10, -10, 0, 12
	obj_rot_scal_anim_frame 128, 128, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D36E4::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_frame -5, -5, 0, 16
	obj_rot_scal_anim_end

gUnknown_83D36FC::
	obj_rot_scal_anim_frame 256, 256, 0, 0
	obj_rot_scal_anim_end

gUnknown_83D370C::
	.4byte gUnknown_83D3664
	.4byte gUnknown_83D3674
	.4byte gUnknown_83D368C
	.4byte gUnknown_83D36A4
	.4byte gUnknown_83D36C4
	.4byte gUnknown_83D36E4
	.4byte gUnknown_83D36FC

gUnknown_83D3728:: @ 83D3728
	spr_template 7, 56011, gUnknown_83D365C, gDummySpriteAnimTable, NULL, gUnknown_83D370C, SpriteCallbackDummy
