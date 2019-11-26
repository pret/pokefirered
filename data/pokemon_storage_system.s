#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83CDA20:: @ 83CDA20
	.4byte gUnknown_841856C, gUnknown_84185AD
	.4byte gUnknown_841857D, gUnknown_84185E2
	.4byte gUnknown_841858D, gUnknown_8418611
	.4byte gUnknown_841859A, gUnknown_8418642
	.4byte gUnknown_84185A5, gUnknown_8418681

gUnknown_83CDA48:: @ 83CDA48
	.byte 0, 1, 1, 17, 10, 15
	.2byte 0x0001

gUnknown_83CDA50::
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_end

gUnknown_83CDA58::
	obj_image_anim_frame 0x0004, 5
	obj_image_anim_end

gUnknown_83CDA60::
	obj_image_anim_frame 0x0006, 5
	obj_image_anim_end

gUnknown_83CDA68::
	obj_image_anim_frame 0x000a, 5
	obj_image_anim_end

gUnknown_83CDA70:: @ 83CDA70
	.4byte gUnknown_83CDA50
	.4byte gUnknown_83CDA58
	.4byte gUnknown_83CDA60
	.4byte gUnknown_83CDA68

gUnknown_83CDA80::
	obj_rot_scal_anim_frame 224, 224, 0, 0
	obj_rot_scal_anim_end

gUnknown_83CDA90::
	.4byte gUnknown_83CDA80

gUnknown_83CDA94:: @ 83CDA94
	.string "/30$"

gUnknown_83CDA98:: @ 83CDA98 gbapal
	.incbin "graphics/interface/pss_unk_3CDA98.gbapal"

gUnknown_83CDAB8:: @ 83CDAB8 4bpp
	.incbin "graphics/interface/pss_unk_3CDAB8.4bpp"

gUnknown_83CE2B8:: @ 83CE2B8 4bpp
	.incbin "graphics/interface/pss_unk_3CE2B8.4bpp"

gUnknown_83CE438:: @ 83CE438 4bpp.lz
	.incbin "graphics/interface/pss_unk_83CE438.4bpp.lz"

gUnknown_83CE4D0:: @ 83CE4D0 bin.lz
	.incbin "graphics/interface/pss_unk_83CE4D0.bin.lz"
	.incbin "graphics/interface/pss_unk_83CE5DC.gbapal"

gUnknown_83CE5FC:: @ 83CE5FC bin.lz
	.incbin "graphics/interface/pss_unk_83CE5FC.bin.lz"

gUnknown_83CE6F8:: @ 83CE6F8  @ raw8
	.byte 0x01, 0x01, 0x02, 0x01, 0x03, 0x01, 0x04, 0x01, 0x05, 0x01, 0x06, 0x01, 0x07, 0x01, 0x08, 0x01, 0x11, 0x01, 0x12, 0x01, 0x13, 0x01, 0x14, 0x01, 0x15, 0x01, 0x16, 0x01, 0x17, 0x01, 0x18, 0x01
	.byte 0x01, 0x21, 0x02, 0x21, 0x03, 0x21, 0x04, 0x21, 0x05, 0x21, 0x06, 0x21, 0x07, 0x21, 0x08, 0x21, 0x11, 0x21, 0x12, 0x21, 0x13, 0x21, 0x14, 0x21, 0x15, 0x21, 0x16, 0x21, 0x17, 0x21, 0x18, 0x21

gUnknown_83CE738:: @ 83CE738 gbapal
	.incbin "graphics/interface/pss_unk_83CE738.gbapal"

gUnknown_83CE758:: @ 83CE758 gbapal
	.incbin "graphics/interface/pss_unk_83CE758.gbapal"

gUnknown_83CE778:: @ 83CE778  @ raw16
	.2byte 0x014c, 0x014d, 0x014e, 0x014f, 0x0170, 0x0171, 0x0172, 0x0173, 0x0174, 0x015c, 0x015d, 0x015e, 0x015f, 0x0180, 0x0181, 0x0182
	.2byte 0x0183, 0x0184, 0x0175, 0x0176, 0x0177, 0x0178, 0x0179, 0x017a, 0x017b, 0x017c, 0x017d, 0x0185, 0x0186, 0x0187, 0x0188, 0x0189
	.2byte 0x018a, 0x018b, 0x018c, 0x018d

gUnknown_83CE7C0:: @ 83CE7C0  @ raw8
	.byte 0x40, 0x11, 0x41, 0x11, 0x41, 0x11, 0x42, 0x11, 0x50, 0x11, 0x51, 0x11, 0x51, 0x11, 0x52, 0x11, 0x60, 0x11, 0x61, 0x11, 0x61, 0x11, 0x62, 0x11

gUnknown_83CE7D8:: @ 83CE7D8  @ raw8
	.byte 0x43, 0x11, 0x44, 0x11, 0x44, 0x11, 0x45, 0x11, 0x53, 0x11, 0x54, 0x11, 0x54, 0x11, 0x55, 0x11, 0x63, 0x11, 0x64, 0x11, 0x64, 0x11, 0x65, 0x11

gUnknown_83CE7F0:: @ 83CE7F0 gbapal
	.incbin "graphics/interface/pss_unk_83CE810.gbapal"

gUnknown_83CE810:: @ 83CE810 4bpp
	.incbin "graphics/interface/pss_unk_83CE810.4bpp"
	.incbin "graphics/interface/pss_unk_83CE9D0.gbapal"

gUnknown_83CEA10:: @ 83CEA10 gbapal
	.incbin "graphics/interface/pss_unk_83CEA10.gbapal"

gUnknown_83CEA30:: @ 83CEA30 gbapal
	.incbin "graphics/interface/pss_unk_83CEA30.gbapal"

gUnknown_83CEA50:: @ 83CEA50 bg_template
	.4byte 0x000001d0
	@ {
	@ 	.bg = 0,
	@ 	.charBaseIndex = 0,
	@ 	.mapBaseIndex = 29,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 0,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x004011e5
	@ {
	@ 	.bg = 1,
	@ 	.charBaseIndex = 1,
	@ 	.mapBaseIndex = 30,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 1,
	@ 	.baseTile = 0x0100
	@ }
	.4byte 0x000023ba
	@ {
	@ 	.bg = 2,
	@ 	.charBaseIndex = 2,
	@ 	.mapBaseIndex = 27,
	@ 	.screenSize = 1,
	@ 	.paletteMode = 0,
	@ 	.priority = 2,
	@ 	.baseTile = 0x0000
	@ }
	.4byte 0x000031ff
	@ {
	@ 	.bg = 3,
	@ 	.charBaseIndex = 3,
	@ 	.mapBaseIndex = 31,
	@ 	.screenSize = 0,
	@ 	.paletteMode = 0,
	@ 	.priority = 3,
	@ 	.baseTile = 0x0000
	@ }

gUnknown_83CEA60:: @ 83CEA60 sprite_palette
	obj_pal gUnknown_83CE7F0, 56010

gUnknown_83CEA68:: @ 83CEA68 sprite_sheet
	obj_tiles gUnknown_83CE810, 0x01c0, 5

gUnknown_83CEA70:: @ 83CEA70 spr_template
	spr_template 2, 56006, gUnknown_83CEB88, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83CEA88:: @ 83CEA88 struct {const u8 *; u8;}
	.4byte gUnknown_8418208
	.byte 0
	.align 2
	.4byte gUnknown_841821B
	.byte 0
	.align 2
	.4byte gUnknown_8418233
	.byte 0
	.align 2
	.4byte gUnknown_8418248
	.byte 0
	.align 2
	.4byte gUnknown_841825C
	.byte 1
	.align 2
	.4byte gUnknown_841826C
	.byte 0
	.align 2
	.4byte gUnknown_841827F
	.byte 0
	.align 2
	.4byte gUnknown_8418295
	.byte 1
	.align 2
	.4byte gUnknown_84182A7
	.byte 0
	.align 2
	.4byte gUnknown_84182B8
	.byte 0
	.align 2
	.4byte gUnknown_84182CE
	.byte 4
	.align 2
	.4byte gUnknown_84182DF
	.byte 6
	.align 2
	.4byte gUnknown_84182EC
	.byte 0
	.align 2
	.4byte gUnknown_84182FF
	.byte 0
	.align 2
	.4byte gUnknown_8418319
	.byte 0
	.align 2
	.4byte gUnknown_841832C
	.byte 0
	.align 2
	.4byte gUnknown_8418346
	.byte 0
	.align 2
	.4byte gUnknown_841835F
	.byte 0
	.align 2
	.4byte gUnknown_8418379
	.byte 0
	.align 2
	.4byte gUnknown_8418392
	.byte 1
	.align 2
	.4byte gUnknown_84183A0
	.byte 0
	.align 2
	.4byte gUnknown_84183BA
	.byte 0
	.align 2
	.4byte gUnknown_84183C5
	.byte 0
	.align 2
	.4byte gUnknown_841825C
	.byte 7
	.align 2
	.4byte gUnknown_84183DD
	.byte 0
	.align 2
	.4byte gUnknown_84183F0
	.byte 7
	.align 2
	.4byte gUnknown_8418408
	.byte 0
	.align 2
	.4byte gUnknown_8418419
	.byte 0
	.align 2
	.4byte gUnknown_8418433
	.byte 7
	.align 2
	.4byte gUnknown_8418443
	.byte 7
	.align 2
	.4byte gUnknown_8418452
	.byte 0
	.align 2

gUnknown_83CEB80:: @ 83CEB80 window_template
	.byte 0, 24, 11, 5, 4, 15
	.2byte 0x005c

gUnknown_83CEB88::
	.4byte 0xc0000000, 0x00000000

gUnknown_83CEB90::
	.4byte 0x00004000, 0x00000000

gUnknown_83CEB98::
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_end

gUnknown_83CEBA0::
	obj_image_anim_frame 0x0002, 8
	obj_image_anim_frame 0x0004, 8
	obj_image_anim_frame 0x0006, 8
	obj_image_anim_jump 0

gUnknown_83CEBB0::
	obj_image_anim_frame 0x0008, 5
	obj_image_anim_end

gUnknown_83CEBB8::
	obj_image_anim_frame 0x000a, 8
	obj_image_anim_frame 0x0004, 8
	obj_image_anim_frame 0x000c, 8
	obj_image_anim_jump 0

gUnknown_83CEBC8::
	.4byte gUnknown_83CEB98
	.4byte gUnknown_83CEBA0
	.4byte gUnknown_83CEBB0
	.4byte gUnknown_83CEBB8

gUnknown_83CEBD8:: @ 83CEBD8 spr_template
	spr_template 5, 56010, gUnknown_83CEB90, gUnknown_83CEBC8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

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
