#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83CA770:: @ 3CA770 4bpp
	.incbin "graphics/field_effects/unk_83CA770.4bpp"

gUnknown_83CAF70:: @ 83CAF70 gbapal
	.incbin "graphics/field_effects/unk_83CAF70.gbapal"

gUnknown_83CAF90:: @ 83CAF90 4bpp
	.incbin "graphics/field_effects/unk_83CAF90.4bpp"

gUnknown_83CAFB0:: @ 83CAFB0 gbapal
	.incbin "graphics/field_effects/unk_83CAFB0.gbapal"

gUnknown_83CAFD0:: @ 83CAFD0 4bpp
	.incbin "graphics/field_effects/unk_83CAFD0.4bpp"

gUnknown_83CB3D0:: @ 83CB3D0 gbapal
	.incbin "graphics/field_effects/unk_83CB3D0.gbapal"

gUnknown_83CB3F0:: @ 83CB3F0 4bpp
	.incbin "graphics/field_effects/unk_83CB3F0.4bpp"

gUnknown_83CB5F0:: @ 83CB5F0 4bpp
	.incbin "graphics/field_effects/unk_83CB5F0.4bpp"

gUnknown_83CB7F0:: @ 83CB7F0 gbapal gUnknown_83CB5F0
	.incbin "graphics/field_effects/unk_83CB7F0.gbapal"

gUnknown_83CB810:: @ 83CB810 4bpp
	.incbin "graphics/field_effects/unk_83CB810.bin"

gUnknown_83CBA90:: @ 83CBA90 4bpp
	.incbin "graphics/field_effects/unk_83CBA90.4bpp"

gUnknown_83CBB10:: @ 83CBB10 gbapal gUnknown_83CBA90
	.incbin "graphics/field_effects/unk_83CBB10.gbapal"

gUnknown_83CBB30:: @ 83CBB30 4bpp
	.incbin "graphics/field_effects/unk_83CBB30.bin"

gUnknown_83CBDB0::
	.incbin "graphics/field_effects/unk_83CBDB0.4bpp"

	.align 2
sFldEffScrcmdTable:: @ 83CBE30 dataptr
	.4byte FieldEffectCmd_loadtiles
	.4byte FieldEffectCmd_loadfadedpal
	.4byte FieldEffectCmd_loadpal
	.4byte FieldEffectCmd_callnative
	.4byte FieldEffectCmd_end
	.4byte FieldEffectCmd_loadgfx_callnative
	.4byte FieldEffectCmd_loadtiles_callnative
	.4byte FieldEffectCmd_loadfadedpal_callnative

gNewGameBirchOamAttributes:: @ 83CBE50 oamdata
	.4byte 0xc0000000, 0x00000000

gOamData_83CBE58:: @ 83CBE58 oamdata
	.4byte 0x00000000, 0x00000000

gOamData_83CBE60:: @ 83CBE60 oamdata
	.4byte 0x40000000, 0x00000000

gUnknown_83CBE68:: @ 83CBE68 sprite_frames
	obj_frame_tiles gUnknown_83CA770, 0x0800

gNewGameBirchObjectPaletteInfo:: @ 83CBE70 sprite_palette
	obj_pal gUnknown_83CAF70, 4102

gUnknown_83CBE78:: @ 83CBE78
	obj_image_anim_frame 0x0000, 1
	obj_image_anim_end

	.align 2
gUnknown_83CBE80:: @ 83CBE80 dataptr
	.4byte gUnknown_83CBE78

gNewGameBirchObjectTemplate:: @ 83CBE84 spr_template
	spr_template 65535, 4102, gNewGameBirchOamAttributes, gUnknown_83CBE80, gUnknown_83CBE68, gDummySpriteAffineAnimTable, SpriteCallbackDummy

gUnknown_83CBE9C:: @ 83CBE9C sprite_palette
	obj_pal gUnknown_83CAFB0, 4103

gUnknown_83CBEA4:: @ 83CBEA4 sprite_palette
	obj_pal gUnknown_83CB3D0, 4112

gOamData_83CBEAC:: @ 83CBEAC oam_data
	.4byte 0x80004000, 0x00000000

gUnknown_83CBEB4:: @ 83CBEB4 sprite_frames
	obj_frame_tiles gUnknown_83CAF90, 0x0020

gUnknown_83CBEBC:: @ 83CBEBC sprite_frames
	obj_frame_tiles gUnknown_83CAFD0 + 0x000, 0x0100
	obj_frame_tiles gUnknown_83CAFD0 + 0x100, 0x0100
	obj_frame_tiles gUnknown_83CAFD0 + 0x200, 0x0100
	obj_frame_tiles gUnknown_83CAFD0 + 0x300, 0x0100

gUnknown_83CBEDC:: @ 83CBEDC sprite_frames
	obj_frame_tiles gUnknown_83CB3F0 + 0x000, 0x0080
	obj_frame_tiles gUnknown_83CB3F0 + 0x080, 0x0080
	obj_frame_tiles gUnknown_83CB3F0 + 0x100, 0x0080
	obj_frame_tiles gUnknown_83CB3F0 + 0x180, 0x0080

gUnknown_83CBEFC:: @ 83CBEFC unknown
	.byte 0xf4, 0xf8, 0x01, 0x80
	.byte 0x04, 0xf8, 0x20, 0x80
	.byte 0xf4, 0x00, 0x31, 0x80
	.byte 0x04, 0x00, 0x50, 0x80
	.byte 0x04, 0x00, 0x00, 0x00

gUnknown_83CBF10:: @ 83CBF10 dataptr
	.4byte gUnknown_83CBEFC

gUnknown_83CBF14:: @ 83CBF14 unknown
	.byte 0xe0, 0xf8, 0x05, 0x80
	.byte 0x00, 0xf8, 0x45, 0x80
	.byte 0xe0, 0x00, 0x85, 0x80
	.byte 0x00, 0x00, 0xc5, 0x80
	.byte 0x04, 0x00, 0x00, 0x00

gUnknown_83CBF28:: @ 83CBE28 dataptr
	.4byte gUnknown_83CBF14

gUnknown_83CBF2C:: @ 83CBF2C animcmd
	obj_image_anim_frame 0x0000, 1
	obj_image_anim_jump 0

gUnknown_83CBF34:: @ 83CBF34 animcmd
	obj_image_anim_frame 0x0001, 5
	obj_image_anim_frame 0x0002, 5
	obj_image_anim_frame 0x0003, 7
	obj_image_anim_frame 0x0002, 5
	obj_image_anim_frame 0x0001, 5
	obj_image_anim_frame 0x0000, 5
	obj_image_anim_loop 3
	obj_image_anim_end

	.align 2
gUnknown_83CBF54:: @ 83CBF54 dataptr
	.4byte gUnknown_83CBF2C
	.4byte gUnknown_83CBF34

gUnknown_83CBF5C:: @ 83CBF5C animcmd
	obj_image_anim_frame 0x0003, 8
	obj_image_anim_frame 0x0002, 8
	obj_image_anim_frame 0x0001, 8
	obj_image_anim_frame 0x0000, 8
	obj_image_anim_frame 0x0001, 8
	obj_image_anim_frame 0x0002, 8
	obj_image_anim_loop 2
	obj_image_anim_frame 0x0001, 8
	obj_image_anim_frame 0x0000, 8
	obj_image_anim_end

	.align 2
gUnknown_83CBF84:: @ 83CBF84 dataptr
	.4byte gUnknown_83CBF5C

gUnknown_83CBF88:: @ 83CBF88 spr_template
	spr_template 65535, 4103, gOamData_83CBE58, gUnknown_83CBF54, gUnknown_83CBEB4, gDummySpriteAffineAnimTable, SpriteCB_PokeballGlow

gUnknown_83CBFA0:: @ 83CBFA0 spr_template
	spr_template 65535, 4103, gOamData_83CBEAC, gUnknown_83CBF54, gUnknown_83CBEBC, gDummySpriteAffineAnimTable, SpriteCB_PokecenterMonitor

gUnknown_83CBFB8:: @ 83CBFB8 spr_template
	spr_template 65535, 4112, gOamData_83CBE60, gUnknown_83CBF84, gUnknown_83CBEDC, gDummySpriteAffineAnimTable, SpriteCB_HallOfFameMonitor

	.align 2
sPokecenterHealTaskCBTable:: @ 83CBFD0 dataptr
	.4byte PokecenterHealEffect_0
	.4byte PokecenterHealEffect_1
	.4byte PokecenterHealEffect_2
	.4byte PokecenterHealEffect_3

	.align 2
sHallOfFameRecordTaskCBTable:: @ 83CBFE0 dataptr
	.4byte HallOfFameRecordEffect_0
	.4byte HallOfFameRecordEffect_1
	.4byte HallOfFameRecordEffect_2
	.4byte HallOfFameRecordEffect_3

	.align 2
sPokeballGlowSpriteCBTable:: @ 83CBFF0 dataptr
	.4byte PokeballGlowEffect_0
	.4byte PokeballGlowEffect_1
	.4byte PokeballGlowEffect_2
	.4byte PokeballGlowEffect_3
	.4byte PokeballGlowEffect_4
	.4byte PokeballGlowEffect_5
	.4byte PokeballGlowEffect_6
	.4byte PokeballGlowEffect_7

gUnknown_83CC010:: @ 83CC010 data16
	.2byte 0, 0
	.2byte 6, 0
	.2byte 0, 4
	.2byte 6, 4
	.2byte 0, 8
	.2byte 6, 8

gUnknown_83CC028:: @ 83CC028 data8
	.byte 0x10, 0x0c, 0x08, 0x00

gUnknown_83CC02C:: @ 83CC02C data8
	.byte 0x10, 0x0c, 0x08, 0x00

gUnknown_83CC030:: @ 83CC030 data8
	.byte 0x00, 0x00, 0x00, 0x00

	.align 2
sFallWarpEffectCBPtrs:: @ 83CC034 dataptr
	.4byte FallWarpEffect_1
	.4byte FallWarpEffect_2
	.4byte FallWarpEffect_3
	.4byte FallWarpEffect_4
	.4byte FallWarpEffect_5
	.4byte FallWarpEffect_6
	.4byte FallWarpEffect_7

	.align 2
sEscalatorWarpFieldEffectFuncs:: @ 83CC050 dataptr
	.4byte EscalatorWarpEffect_1
	.4byte EscalatorWarpEffect_2
	.4byte EscalatorWarpEffect_3
	.4byte EscalatorWarpEffect_4
	.4byte EscalatorWarpEffect_5
	.4byte EscalatorWarpEffect_6

	.align 2
gUnknown_83CC068:: @ 83CC068 dataptr
	.4byte sub_8084A5C
	.4byte sub_8084AD8
	.4byte sub_8084B18
	.4byte sub_8084B78
	.4byte sub_8084BB8
	.4byte sub_8084C18
	.4byte sub_8084C3C

	.align 2
sUseWaterfallFieldEffectFuncs:: @ 83CC084 dataptr
	.4byte waterfall_0_setup
	.4byte waterfall_1_do_anim_probably
	.4byte waterfall_2_wait_anim_finish_probably
	.4byte waterfall_3_move_player_probably
	.4byte waterfall_4_wait_player_move_probably

	.align 2
sDiveFieldEffectFuncPtrs:: @ 83CC098 dataptr
	.4byte dive_1_lock
	.4byte dive_2_unknown
	.4byte dive_3_unknown

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
