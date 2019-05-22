	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 1
gUnknown_8465608:: @ 8465608
	.2byte 0x0002, 0x0002, 0x0000, 0x0000, 0x0002, 0x0004, 0x0003

gUnknown_8465616:: @ 8465616
	.2byte 0x0120, 0x011f, 0x011e, 0x011d, 0x011c, 0x011b, 0x011a, 0x0119, 0x0118, 0x0117, 0x0116, 0x0115, 0x0114, 0x0113, 0x0112, 0x0111
	.2byte 0x0110, 0x010f, 0x010e, 0x010d, 0x010c, 0x010b, 0x010a, 0x0109, 0x0108, 0x0107, 0x0106, 0x0105, 0x0104, 0x0103, 0x0102, 0x0101
	.2byte 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100
	.2byte 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100
	.2byte 0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010b, 0x010c, 0x010d, 0x010e, 0x010f, 0x0110
	.2byte 0x0111, 0x0112, 0x0113, 0x0114, 0x0115, 0x0116, 0x0117, 0x0118, 0x0119, 0x011a, 0x011b, 0x011c, 0x011d, 0x011e, 0x011f, 0x0120

gUnknown_84656D6:: @ 84656D6
	.byte 0x10, 0x10, 0x10, 0x10, 0x0f, 0x0e, 0x0d, 0x0d, 0x0c, 0x0b, 0x0a, 0x0a, 0x09, 0x08, 0x07, 0x07, 0x06, 0x05, 0x04, 0x04, 0x03, 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x03, 0x04, 0x05, 0x06, 0x06, 0x07, 0x08, 0x09, 0x09, 0x0a, 0x0b, 0x0c, 0x0c, 0x0d, 0x0e, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f

	.align 2
gUnknown_8465738::
	.4byte 0x80000100, 0x00000c00

gUnknown_8465740::
	obj_image_anim_frame 0x00, 4
	obj_image_anim_end

gUnknown_8465748::
	obj_image_anim_frame 0x10, 4
	obj_image_anim_end

gUnknown_8465750::
	obj_image_anim_frame 0x20, 4
	obj_image_anim_end

gUnknown_8465758::
	obj_image_anim_frame 0x30, 4
	obj_image_anim_end

gUnknown_8465760::
	obj_image_anim_frame 0x40, 4
	obj_image_anim_end

gUnknown_8465768::
	obj_image_anim_frame 0x50, 4
	obj_image_anim_end

gUnknown_8465770::
	obj_image_anim_frame 0x60, 4
	obj_image_anim_end

gUnknown_8465778::
	obj_image_anim_frame 0x20, 4
	obj_image_anim_end

gUnknown_8465780::
	obj_image_anim_frame 0x30, 4
	obj_image_anim_end

gUnknown_8465788::
	obj_image_anim_frame 0x40, 4
	obj_image_anim_end

gUnknown_8465790::
	obj_image_anim_frame 0x50, 4
	obj_image_anim_end

gUnknown_8465798::
	obj_image_anim_frame 0x60, 4
	obj_image_anim_end

gUnknown_84657A0::
	.4byte gUnknown_8465740
	.4byte gUnknown_8465748
	.4byte gUnknown_8465750
	.4byte gUnknown_8465758
	.4byte gUnknown_8465760
	.4byte gUnknown_8465768
	.4byte gUnknown_8465770
	.4byte gUnknown_8465778
	.4byte gUnknown_8465780
	.4byte gUnknown_8465788
	.4byte gUnknown_8465790
	.4byte gUnknown_8465798

gUnknown_84657D0::
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 1
	obj_rot_scal_anim_end

gUnknown_84657E0:: @ unused
	.4byte gUnknown_84657D0

gUnknown_84657E4:: @ 84657E4
	spr_template 0, 0, gUnknown_8465738, gUnknown_84657A0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_84657FC::
	.4byte 0x00008000, 0x00000400

gUnknown_8465804::
	obj_image_anim_frame 0x00, 4
	obj_image_anim_end

gUnknown_846580C::
	obj_image_anim_frame 0x02, 4
	obj_image_anim_end

gUnknown_8465814::
	obj_image_anim_frame 0x04, 4
	obj_image_anim_end

gUnknown_846581C::
	obj_image_anim_frame 0x06, 4
	obj_image_anim_end

gUnknown_8465824::
	obj_image_anim_frame 0x08, 4
	obj_image_anim_end

gUnknown_846582C::
	obj_image_anim_frame 0x0a, 4
	obj_image_anim_end

gUnknown_8465834::
	obj_image_anim_frame 0x0c, 4
	obj_image_anim_end

gUnknown_846583C::
	obj_image_anim_frame 0x0e, 4
	obj_image_anim_end

gUnknown_8465844::
	obj_image_anim_frame 0x10, 4
	obj_image_anim_end

gUnknown_846584C::
	obj_image_anim_frame 0x12, 4
	obj_image_anim_end

gUnknown_8465854::
	.4byte gUnknown_8465804
	.4byte gUnknown_846580C
	.4byte gUnknown_8465814
	.4byte gUnknown_846581C
	.4byte gUnknown_8465824
	.4byte gUnknown_846582C
	.4byte gUnknown_8465834
	.4byte gUnknown_846583C
	.4byte gUnknown_8465844
	.4byte gUnknown_846584C

gUnknown_846587C:: @ 846587C
	spr_template 2, 6, gUnknown_84657FC, gUnknown_8465854, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_8465894::
	.4byte 0x80000000, 0x00000400

gUnknown_846589C::
	obj_image_anim_frame 0, 4
	obj_image_anim_end

gUnknown_84658A4::
	obj_image_anim_frame  0, 24
	obj_image_anim_frame 16, 24
	obj_image_anim_jump 0

gUnknown_84658B0::
	obj_image_anim_frame 32, 28
	obj_image_anim_frame 48, 28
	obj_image_anim_jump 0

gUnknown_84658BC::
	obj_image_anim_frame 64, 12
	obj_image_anim_frame 80, 12
	obj_image_anim_jump 0

gUnknown_84658C8::
	.4byte gUnknown_846589C
	.4byte gUnknown_84658A4
	.4byte gUnknown_84658B0
	.4byte gUnknown_84658BC

gUnknown_84658D8:: @ 84658D8
	spr_template 1, 5, gUnknown_8465894, gUnknown_84658C8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_84658F0:: @ 84658F0
	.4byte sub_8141198
	.4byte sub_8141460
	.4byte sub_81414AC
	.4byte sub_81414EC
	.4byte sub_81414FC
	.4byte sub_8141518
	.4byte sub_8141558
	.4byte sub_8141568
	.4byte sub_8141578
	.4byte sub_8141584
	.4byte sub_81415C8
	.4byte sub_8141610
	.4byte sub_8141650
	.4byte sub_8141690
	.4byte sub_81416C8
	.4byte sub_8141764

gUnknown_8465930:: @ 8465930
	.incbin "graphics/slot_machine/unk_8465930.gbapal"

gUnknown_8465950:: @ 8465950
	.incbin "graphics/slot_machine/unk_8465950.gbapal"
	.incbin "graphics/slot_machine/unk_8465970.gbapal"
	.incbin "graphics/slot_machine/unk_8465990.gbapal"
	.incbin "graphics/slot_machine/unk_84659b0.gbapal"

gUnknown_84659D0:: @ 84659D0
	.incbin "graphics/slot_machine/unk_84659d0.4bpp.lz"

gUnknown_84661D4:: @ 84661D4
	.incbin "graphics/slot_machine/unk_84661d4.bin.lz"

gUnknown_84664BC:: @ 84664BC
	.incbin "graphics/slot_machine/unk_84664bc.gbapal"

gUnknown_84664DC:: @ 84664DC
	.incbin "graphics/slot_machine/unk_84664dc.gbapal"
	.incbin "graphics/slot_machine/unk_84664fc.gbapal"
	.incbin "graphics/slot_machine/unk_846651c.gbapal"

gUnknown_846653C:: @ 846653C
	.incbin "graphics/slot_machine/unk_846653c.4bpp.lz"

gUnknown_84665C0:: @ 84665C0
	.incbin "graphics/slot_machine/unk_84665c0.gbapal"
	.incbin "graphics/slot_machine/unk_84665e0.gbapal"
	.incbin "graphics/slot_machine/unk_8466600.gbapal"

gUnknown_8466620:: @ 8466620
	.incbin "graphics/slot_machine/unk_8466620.4bpp.lz"

gUnknown_8466998:: @ 8466998
	.incbin "graphics/slot_machine/unk_8466998.bin.lz"

	.align 2 @ bg templates
gUnknown_8466B10:: @ 8466B10
	.4byte 0x000001d0
	.4byte 0x000031ff
	.4byte 0x000021ea
	.4byte 0x000001c5

gUnknown_8466B20:: @ 8466B20
	window_template 0x00, 0x05, 0x0f, 0x14, 0x04, 0x0f, 0x004f
	window_template 0x00, 0x00, 0x00, 0x1e, 0x02, 0x0e, 0x0013
	window_template 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0000

gUnknown_8466B38::
	.2byte 0x00a4, 0x00a5, 0x00a6, 0x00c4, 0x00c5, 0x00c6, 0x00c7, 0x00e7, 0x012c, 0x014c, 0x0191, 0x01b1, 0x01f6, 0x0216, 0x0217, 0x0218
	.2byte 0x0219, 0x0237, 0x0238, 0x0239

gUnknown_8466B60::
	.2byte 0x00e4, 0x00e5, 0x00e6, 0x00f7, 0x00f8, 0x00f9, 0x0104, 0x0105, 0x0106, 0x0107, 0x010c, 0x0111, 0x0116, 0x0117, 0x0118, 0x0119
	.2byte 0x0124, 0x0125, 0x0126, 0x0137, 0x0138, 0x0139

gUnknown_8466B8C::
	.2byte 0x0144, 0x0145, 0x0146, 0x0157, 0x0158, 0x0159, 0x0164, 0x0165, 0x0166, 0x0167, 0x016c, 0x0171, 0x0176, 0x0177, 0x0178, 0x0179
	.2byte 0x0184, 0x0185, 0x0186, 0x0197, 0x0198, 0x0199

gUnknown_8466BB8::
	.2byte 0x01a4, 0x01a5, 0x01a6, 0x01b7, 0x01b8, 0x01b9, 0x01c4, 0x01c5, 0x01c6, 0x01c7, 0x01cc, 0x01d1, 0x01d6, 0x01d7, 0x01d8, 0x01d9
	.2byte 0x01e4, 0x01e5, 0x01e6, 0x01f7, 0x01f8, 0x01f9

gUnknown_8466BE4::
	.2byte 0x0204, 0x0205, 0x0206, 0x0224, 0x0225, 0x0226, 0x01e7, 0x0207, 0x018c, 0x01ac, 0x0131, 0x0151, 0x00d6, 0x00f6, 0x00b7, 0x00b8
	.2byte 0x00b9, 0x00d7, 0x00d8, 0x00d9

	.align 2
gUnknown_8466C0C:: @ 8466C0C
	.4byte gUnknown_8466B38, 0x14
	.4byte gUnknown_8466B60, 0x16
	.4byte gUnknown_8466B8C, 0x16
	.4byte gUnknown_8466BB8, 0x16
	.4byte gUnknown_8466BE4, 0x14

gUnknown_8466C34:: @ 8466C34
	.byte 0x02, 0x04

	.align 2
gUnknown_8466C38:: @ 8466C38
	window_template 0x00, 0x13, 0x09, 0x06, 0x04, 0x0f, 0x009f

gUnknown_8466C40:: @ 8466C40
	.2byte 0x0229, 0x022a, 0x0249, 0x024a, 0x022e, 0x022f, 0x024e, 0x024f, 0x0233, 0x0234, 0x0253, 0x0254
