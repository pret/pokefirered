#include "constants/maps.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

gUnknown_83EE008:: @ 83EE008 gbapal
	.incbin "graphics/misc/mon_markings.gbapal"

gUnknown_83EE028:: @ 83EE028 4bpp
	.incbin "graphics/misc/mon_markings.4bpp"

gUnknown_83EE828:: @ 83EE828
	.4byte 0x02135009, 0x000000ff

gUnknown_83EE830:: @ 83EE830 oamdata
	.4byte 0xc0000000, 0x00000000

gUnknown_83EE838:: @ 83EE838 oamdata
	.4byte 0x00000000, 0x00000000

gAnimCmd_83EE840::
	obj_image_anim_frame 0x0, 5
	obj_image_anim_end

gAnimCmd_83EE848::
	obj_image_anim_frame 0x1, 5
	obj_image_anim_end

gAnimCmd_83EE850::
	obj_image_anim_frame 0x2, 5
	obj_image_anim_end

gAnimCmd_83EE858::
	obj_image_anim_frame 0x3, 5
	obj_image_anim_end

gAnimCmd_83EE860::
	obj_image_anim_frame 0x4, 5
	obj_image_anim_end

gAnimCmd_83EE868::
	obj_image_anim_frame 0x5, 5
	obj_image_anim_end

gAnimCmd_83EE870::
	obj_image_anim_frame 0x6, 5
	obj_image_anim_end

gAnimCmd_83EE878::
	obj_image_anim_frame 0x7, 5
	obj_image_anim_end

gAnimCmd_83EE880::
	obj_image_anim_frame 0x8, 5
	obj_image_anim_end

gAnimCmd_83EE888::
	obj_image_anim_frame 0x9, 5
	obj_image_anim_end

gUnknown_83EE890:: @ 83EE890 animcmd
	.4byte gAnimCmd_83EE840
	.4byte gAnimCmd_83EE848
	.4byte gAnimCmd_83EE850
	.4byte gAnimCmd_83EE858
	.4byte gAnimCmd_83EE860
	.4byte gAnimCmd_83EE868
	.4byte gAnimCmd_83EE870
	.4byte gAnimCmd_83EE878
	.4byte gAnimCmd_83EE880
	.4byte gAnimCmd_83EE888

gAnimCmd_83EE8B8::
	obj_image_anim_frame 0x0, 5
	obj_image_anim_end

gAnimCmd_83EE8C0::
	obj_image_anim_frame 0x40, 5
	obj_image_anim_end

gUnknown_83EE8C8:: @ 83EE8C8 animcmd
	.4byte gAnimCmd_83EE8B8
	.4byte gAnimCmd_83EE8C0

gUnknown_83EE8D0:: @ 83EE8D0 oamdata
	.4byte 0x40004000, 0x00000000

gAnimCmd_83EE8D8::
	obj_image_anim_frame 0x0, 5
	obj_image_anim_end

gAnimCmd_83EE8E0::
	obj_image_anim_frame 0x4, 5
	obj_image_anim_end

gAnimCmd_83EE8E8::
	obj_image_anim_frame 0x8, 5
	obj_image_anim_end

gAnimCmd_83EE8F0::
	obj_image_anim_frame 0xc, 5
	obj_image_anim_end

gAnimCmd_83EE8F8::
	obj_image_anim_frame 0x10, 5
	obj_image_anim_end

gAnimCmd_83EE900::
	obj_image_anim_frame 0x14, 5
	obj_image_anim_end

gAnimCmd_83EE908::
	obj_image_anim_frame 0x18, 5
	obj_image_anim_end

gAnimCmd_83EE910::
	obj_image_anim_frame 0x1c, 5
	obj_image_anim_end

gAnimCmd_83EE918::
	obj_image_anim_frame 0x20, 5
	obj_image_anim_end

gAnimCmd_83EE920::
	obj_image_anim_frame 0x24, 5
	obj_image_anim_end

gAnimCmd_83EE928::
	obj_image_anim_frame 0x28, 5
	obj_image_anim_end

gAnimCmd_83EE930::
	obj_image_anim_frame 0x2c, 5
	obj_image_anim_end

gAnimCmd_83EE938::
	obj_image_anim_frame 0x30, 5
	obj_image_anim_end

gAnimCmd_83EE940::
	obj_image_anim_frame 0x34, 5
	obj_image_anim_end

gAnimCmd_83EE948::
	obj_image_anim_frame 0x38, 5
	obj_image_anim_end

gAnimCmd_83EE950::
	obj_image_anim_frame 0x3c, 5
	obj_image_anim_end

gUnknown_83EE958:: @ 83EE958 animcmd
	.4byte gAnimCmd_83EE8D8
	.4byte gAnimCmd_83EE8E0
	.4byte gAnimCmd_83EE8E8
	.4byte gAnimCmd_83EE8F0
	.4byte gAnimCmd_83EE8F8
	.4byte gAnimCmd_83EE900
	.4byte gAnimCmd_83EE908
	.4byte gAnimCmd_83EE910
	.4byte gAnimCmd_83EE918
	.4byte gAnimCmd_83EE920
	.4byte gAnimCmd_83EE928
	.4byte gAnimCmd_83EE930
	.4byte gAnimCmd_83EE938
	.4byte gAnimCmd_83EE940
	.4byte gAnimCmd_83EE948
	.4byte gAnimCmd_83EE950
