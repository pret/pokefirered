#include "constants/region_map_sections.h"
#include "constants/flags.h"
#include "constants/moves.h"
#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_83BFBE4:: @ 83BFBE4
	.incbin "graphics/field_effects/unk_83BFBE4.bin.lz"

gUnknown_83C0408::
	.incbin "graphics/field_effects/unk_83C0408.bin.lz"

gUnknown_83C0C00::
	.incbin "graphics/field_effects/unk_83C0C00.bin.lz"

gUnknown_83C139C::
	.incbin "graphics/field_effects/unk_83C139C.bin.lz"

gUnknown_83C1BB8::
	.incbin "graphics/field_effects/unk_83C1BB8.bin.lz"

gUnknown_83C2380::
	.incbin "graphics/field_effects/unk_83C2380.bin.lz"

gUnknown_83C2BA4::
	.4byte gUnknown_83BFBE4
	.4byte gUnknown_83C0408
	.4byte gUnknown_83C0C00
	.4byte gUnknown_83C139C
	.4byte gUnknown_83C1BB8
	.4byte gUnknown_83C2380

gUnknown_83C2BBC:: @ 83C2BBC
	.4byte gUnknown_2037F34

gUnknown_83C2BC0:: @ 83C2BC0
	.4byte sub_8079EC0
	.4byte nullsub_45
	.4byte sub_8079EC0
	.4byte sub_8079EE4
	.4byte Clouds_InitVars
	.4byte Clouds_Main
	.4byte Clouds_InitAll
	.4byte Clouds_Finish
	.4byte Weather2_InitVars
	.4byte nullsub_48
	.4byte Weather2_InitAll
	.4byte sub_807B434
	.4byte LightRain_InitVars
	.4byte LightRain_Main
	.4byte LightRain_InitAll
	.4byte LightRain_Finish
	.4byte Snow_InitVars
	.4byte snowflakes_progress2
	.4byte Snow_InitAll
	.4byte Snow_Finish
	.4byte sub_807C2E4
	.4byte Rain_Main
	.4byte sub_807C358
	.4byte Rain_Finish
	.4byte Fog1_InitVars
	.4byte Fog1_Main
	.4byte Fog1_InitAll
	.4byte Fog1_Finish
	.4byte Ash_InitVars
	.4byte Ash_Main
	.4byte Ash_InitAll
	.4byte Ash_Finish
	.4byte Sandstorm_InitVars
	.4byte Sandstorm_Main
	.4byte Sandstorm_InitAll
	.4byte Sandstorm_Finish
	.4byte Fog2_InitVars
	.4byte Fog2_Main
	.4byte Fog2_InitAll
	.4byte Fog2_Finish
	.4byte Fog1_InitVars
	.4byte Fog1_Main
	.4byte Fog1_InitAll
	.4byte Fog1_Finish
	.4byte Weather11_InitVars
	.4byte nullsub_49
	.4byte Weather11_InitAll
	.4byte sub_807D8D0
	.4byte Drought_InitVars
	.4byte Drought_Main
	.4byte Drought_InitAll
	.4byte sub_807B6BC
	.4byte sub_807C388
	.4byte Rain_Main
	.4byte sub_807C3F4
	.4byte Rain_Finish
	.4byte Bubbles_InitVars
	.4byte Bubbles_Main
	.4byte Bubbles_InitAll
	.4byte Bubbles_Finish

gUnknown_83C2CB0:: @ 83C2CB0
	.4byte sub_8079FFC
	.4byte sub_807A084
	.4byte nullsub_46
	.4byte nullsub_46

gUnknown_83C2CC0:: @ 83C2CC0
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x01, 0x02, 0x02, 0x02, 0x02, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, 0x01, 0x01, 0x01, 0x01

gUnknown_83C2CE0:: @ 83C2CE0
	.incbin "graphics/field_effects/unk_83C2CE0.gbapal"

gUnknown_83C2D00:: @ 83C2D00
	.incbin "graphics/field_effects/unk_83C2D00.gbapal"

gUnknown_83C2D20:: @ 83C2D20
	.incbin "graphics/field_effects/unk_83C2D20.gbapal"

gUnknown_83C2D40::
	.incbin "graphics/field_effects/unk_83C2D40.4bpp"

gWeatherFog1Tiles:: @ 83C3540
	.incbin "graphics/field_effects/unk_83C3540.4bpp"

gUnknown_83C3D40::
	.incbin "graphics/field_effects/unk_83C3D40.4bpp"

gUnknown_83C4540::
	.incbin "graphics/field_effects/unk_83C4540.4bpp"

gUnknown_83C4580::
	.incbin "graphics/field_effects/unk_83C4580.4bpp"

gUnknown_83C45C0::
	.incbin "graphics/field_effects/unk_83C45C0.4bpp"

gUnknown_83C55C0::
	.incbin "graphics/field_effects/unk_83C55C0.4bpp"

gUnknown_83C5BC0::
	.incbin "graphics/field_effects/unk_83C5BC0.4bpp"

gUnknown_83C65C0:: @ 83C65C0
	.byte 0x02, 0x03, 0x05, 0x03

gUnknown_83C65C4:: @ 83C65C4
	.byte 0x02, 0x02, 0x03, 0x02

gUnknown_83C65C8:: @ 83C65C8
	.2byte 0x0000, 0x0042, 0x0005, 0x0049, 0x000a, 0x004e

gUnknown_83C65D4:: @ 83C65D4
	obj_tiles gUnknown_83C3D40, 0x0800, 4608

gUnknown_83C65DC::
	.4byte 0xc0000400, 0x00000c00

gUnknown_83C65E4::
	obj_image_anim_frame 0x0000, 16
	obj_image_anim_end

gUnknown_83C65EC::
	.4byte gUnknown_83C65E4

gUnknown_83C65F0:: @ 83C65F0
	spr_template 4608, 4608, gUnknown_83C65DC, gUnknown_83C65EC, NULL, gDummySpriteAffineAnimTable, sub_807B558

gUnknown_83C6608:: @ 83C6608
	.2byte 0x0000, 0x0000
	.2byte 0x0000, 0x00a0
	.2byte 0x0000, 0x0040
	.2byte 0x0090, 0x00e0
	.2byte 0x0090, 0x0080
	.2byte 0x0020, 0x0020
	.2byte 0x0020, 0x00c0
	.2byte 0x0020, 0x0060
	.2byte 0x0048, 0x0080
	.2byte 0x0048, 0x0020
	.2byte 0x0048, 0x00c0
	.2byte 0x00d8, 0x0060
	.2byte 0x00d8, 0x0000
	.2byte 0x0068, 0x00a0
	.2byte 0x0068, 0x0040
	.2byte 0x0068, 0x00e0
	.2byte 0x0090, 0x0000
	.2byte 0x0090, 0x00a0
	.2byte 0x0090, 0x0040
	.2byte 0x0020, 0x00e0
	.2byte 0x0020, 0x0080
	.2byte 0x0048, 0x0020
	.2byte 0x0048, 0x00c0
	.2byte 0x0030, 0x0060

gUnknown_83C6668::
	.4byte 0x80008000, 0x00002400

gUnknown_83C6670::
	obj_image_anim_frame 0x0000, 16
	obj_image_anim_jump 0

gUnknown_83C6678::
	obj_image_anim_frame 0x0008, 3
	obj_image_anim_frame 0x0020, 2
	obj_image_anim_frame 0x0028, 2
	obj_image_anim_end

gUnknown_83C6688::
	obj_image_anim_frame 0x0008, 3
	obj_image_anim_frame 0x0010, 3
	obj_image_anim_frame 0x0018, 4
	obj_image_anim_end

gUnknown_83C6698::
	.4byte gUnknown_83C6670
	.4byte gUnknown_83C6678
	.4byte gUnknown_83C6688

gUnknown_83C66A4:: @ 83C66A4
	spr_template 4614, 4608, gUnknown_83C6668, gUnknown_83C6698, NULL, gDummySpriteAffineAnimTable, sub_807BA24

gUnknown_83C66BC:: @ 83C66BC
	.2byte 0xff98, 0x00d0
	.2byte 0xff60, 0x0140

gUnknown_83C66C4:: @ 83C66C4
	.2byte 0x0012, 0x0007
	.2byte 0x000c, 0x000a

gUnknown_83C66CC:: @ 83C66CC
	obj_tiles gUnknown_83C55C0, 0x0600, 4614

gUnknown_83C66D4::
	.4byte 0x00000000, 0x00000400

gUnknown_83C66DC::
	obj_frame_tiles gUnknown_83C4540 + 0x00, 0x0020
	obj_frame_tiles gUnknown_83C4540 + 0x20, 0x0020

gUnknown_83C66EC::
	obj_image_anim_frame 0x0000, 16
	obj_image_anim_end

gUnknown_83C66F4::
	obj_image_anim_frame 0x0001, 16
	obj_image_anim_end

gUnknown_83C66FC::
	.4byte gUnknown_83C66EC
	.4byte gUnknown_83C66F4

gUnknown_83C6704:: @ 83C6704
	spr_template 65535, 4608, gUnknown_83C66D4, gUnknown_83C66FC, gUnknown_83C66DC, gDummySpriteAffineAnimTable, sub_807C1AC

gUnknown_83C671C::
	.2byte 0x0000, 0x0006, 0x0006, 0x000c, 0x0012, 0x002a, 0x012c, 0x012c

gUnknown_83C672C::
	.4byte 0xc0000400, 0x00000800

gUnknown_83C6734::
	obj_image_anim_frame 0x0000, 16
	obj_image_anim_end

gUnknown_83C673C::
	obj_image_anim_frame 0x0020, 16
	obj_image_anim_end

gUnknown_83C6744::
	obj_image_anim_frame 0x0040, 16
	obj_image_anim_end

gUnknown_83C674C::
	obj_image_anim_frame 0x0060, 16
	obj_image_anim_end

gUnknown_83C6754::
	obj_image_anim_frame 0x0080, 16
	obj_image_anim_end

gUnknown_83C675C::
	obj_image_anim_frame 0x00a0, 16
	obj_image_anim_end

gUnknown_83C6764::
	.4byte gUnknown_83C6734
	.4byte gUnknown_83C673C
	.4byte gUnknown_83C6744
	.4byte gUnknown_83C674C
	.4byte gUnknown_83C6754
	.4byte gUnknown_83C675C

gUnknown_83C677C::
	obj_rot_scal_anim_frame 512, 512, 0, 0
	obj_rot_scal_anim_end

gUnknown_83C678C::
	.4byte gUnknown_83C677C

gUnknown_83C6790:: @ 83C6790
	spr_template 4609, 4608, gUnknown_83C672C, gUnknown_83C6764, NULL, gUnknown_83C678C, Fog1SpriteCallback

gUnknown_83C67A8:: @ 83C67A8
	obj_tiles gWeatherFog1Tiles, 0x0800, 4609

gUnknown_83C67B0:: @ 83C67B0
	obj_tiles gUnknown_83C45C0, 0x1000, 4610

gUknown_83C67B8::
	.4byte 0xc0000400, 0x0000f400

gUnknown_83C67C0::
	obj_image_anim_frame 0x0000, 60
	obj_image_anim_frame 0x0040, 60
	obj_image_anim_jump 0

gUnknown_83C67CC::
	.4byte gUnknown_83C67C0

gUnknown_83C67D0:: @ 83C67D0
	spr_template 4610, 4608, gUknown_83C67B8, gUnknown_83C67CC, NULL, gDummySpriteAffineAnimTable, sub_807CF08

gUnknown_83C67E8:: @ 83C67E8
	obj_tiles gUnknown_83C2D40, 0x0800, 4611

gUnknown_83C67F0::
	.4byte 0xc0000400, 0x00000800

gUnknown_83C67F8::
	obj_image_anim_frame 0x0000, 16
	obj_image_anim_end

gUnknown_83C6800::
	.4byte gUnknown_83C67F8

gUnknown_83C6804:: @ 83C6804
	spr_template 4611, 4608, gUnknown_83C67F0, gUnknown_83C6800, NULL, gDummySpriteAffineAnimTable, Fog2SpriteCallback

gUnknown_83C681C::
	.4byte 0xc0000400, 0x00000400

gUnknown_83C6824::
	obj_image_anim_frame 0x0000, 3
	obj_image_anim_end

gUnknown_83C682C::
	obj_image_anim_frame 0x0040, 3
	obj_image_anim_end

gUnknown_83C6834::
	.4byte gUnknown_83C6824
	.4byte gUnknown_83C682C

gUnknown_83C683C:: @ 83C683C
	spr_template 4612, 4608, gUnknown_83C681C, gUnknown_83C6834, NULL, gDummySpriteAffineAnimTable, SandstormSpriteCallback1

gUnknown_83C6854:: @ 83C6854
	obj_tiles gUnknown_83C5BC0, 0x0a00, 4612

gUnknown_83C685C:: @ 83C685C
	.2byte 0x0000, 0x0078, 0x0050, 0x00a0, 0x0028, 0x0000

gUnknown_83C6868:: @ 83C6868
	.byte 0x28, 0x5a, 0x3c, 0x5a, 0x02, 0x3c, 0x28, 0x1e

gUnknown_83C6870:: @ 83C6870
	obj_tiles gUnknown_83C4580, 0x0040, 4613

gUnknown_83C6878:: @ 83C6878
	.2byte 0x0078, 0x00a0
	.2byte 0x0178, 0x00a0
	.2byte 0x0028, 0x008c
	.2byte 0x0128, 0x008c
	.2byte 0x00b4, 0x0082
	.2byte 0x01b4, 0x0082
	.2byte 0x003c, 0x00a0
	.2byte 0x01b4, 0x00a0
	.2byte 0x00dc, 0x00b4
	.2byte 0x01dc, 0x00b4
	.2byte 0x000a, 0x005a
	.2byte 0x010a, 0x005a
	.2byte 0x0100, 0x00a0

gUnknown_83C68AC::
	obj_image_anim_frame 0x0000, 16
	obj_image_anim_frame 0x0001, 16
	obj_image_anim_end

gUnknown_83C68B8::
	.4byte gUnknown_83C68AC

gUnknown_83C68BC:: @ 83C68BC
	spr_template 4613, 4608, gOamData_AffineOff_ObjNormal_8x8, gUnknown_83C68B8, NULL, gDummySpriteAffineAnimTable, unc_0807DAB4
