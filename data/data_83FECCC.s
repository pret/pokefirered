#include "constants/region_map.h"
#include "constants/flags.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata

	.align 2
gUnknown_83FECCC:: @ 83FECCC
	.byte 0x0c, 0x00, 0x1c, 0x00, 0x2c, 0x00

gUnknown_83FECD2:: @ 83FECD2
	.incbin "baserom.gba", 0x3FECD2, 0x4

gUnknown_83FECD6:: @ 83FECD6
	.incbin "baserom.gba", 0x3FECD6, 0xA

gUnknown_83FECE0:: @ 83FECE0
	.incbin "baserom.gba", 0x3FECE0, 0x8

gUnknown_83FECE8:: @ 83FECE8
	.incbin "baserom.gba", 0x3FECE8, 0xC

gUnknown_83FECF4:: @ 83FECF4
	.incbin "baserom.gba", 0x3FECF4, 0x6

gUnknown_83FECFA:: @ 83FECFA
	.incbin "baserom.gba", 0x3FECFA, 0x6

	.section .rodata.83FEDE4

gUnknown_83FEDE4:: @ 83FEDE4
	.incbin "baserom.gba", 0x3FEDE4, 0x29C

gUnknown_83FF080:: @ 83FF080
	.incbin "baserom.gba", 0x3FF080, 0xB0

gUnknown_83FF130:: @ 83FF130
	.incbin "baserom.gba", 0x3FF130, 0x38

gUnknown_83FF168:: @ 83FF168
	.incbin "baserom.gba", 0x3FF168, 0x18

gUnknown_83FF180:: @ 83FF180
	.incbin "baserom.gba", 0x3FF180, 0x18

gUnknown_83FF198:: @ 83FF198
	.incbin "baserom.gba", 0x3FF198, 0x28

gUnknown_83FF1C0:: @ 83FF1C0
	.incbin "baserom.gba", 0x3FF1C0, 0x50

gUnknown_83FF210:: @ 83FF210
	.incbin "baserom.gba", 0x3FF210, 0x30

gUnknown_83FF240:: @ 83FF240
	.incbin "baserom.gba", 0x3FF240, 0x2C

gUnknown_83FF26C:: @ 83FF26C
	.incbin "baserom.gba", 0x3FF26C, 0x18

gUnknown_83FF284:: @ 83FF284
	.incbin "baserom.gba", 0x3FF284, 0x4

gUnknown_83FF288:: @ 83FF288
	.incbin "baserom.gba", 0x3FF288, 0x8

gUnknown_83FF290:: @ 83FF290
	.incbin "baserom.gba", 0x3FF290, 0x140

gUnknown_83FF3D0:: @ 83FF3D0
	.incbin "baserom.gba", 0x3FF3D0, 0x15C

gUnknown_83FF52C:: @ 83FF52C
	.incbin "baserom.gba", 0x3FF52C, 0x20

gUnknown_83FF54C:: @ 83FF54C
	.incbin "baserom.gba", 0x3FF54C, 0x18

gUnknown_83FF564:: @ 83FF564
	.incbin "baserom.gba", 0x3FF564, 0x68

gUnknown_83FF5CC:: @ 83FF5CC
	.incbin "baserom.gba", 0x3FF5CC, 0x60

gUnknown_83FF62C:: @ 83FF62C
	.incbin "baserom.gba", 0x3FF62C, 0x30

gUnknown_83FF65C:: @ 83FF65C
	.incbin "baserom.gba", 0x3FF65C, 0x14C

gUnknown_83FF7A8:: @ 83FF7A8
	.incbin "baserom.gba", 0x3FF7A8, 0x24C

gUnknown_83FF9F4:: @ 83FF9F4
	.incbin "baserom.gba", 0x3FF9F4, 0x8

gUnknown_83FF9FC:: @ 83FF9FC
	.incbin "baserom.gba", 0x3FF9FC, 0x28

gUnknown_83FFA24:: @ 83FFA24
	.incbin "baserom.gba", 0x3FFA24, 0x18

gUnknown_83FFA3C:: @ 83FFA3C
	.incbin "baserom.gba", 0x3FFA3C, 0x8

gUnknown_83FFA44:: @ 83FFA44
	.incbin "baserom.gba", 0x3FFA44, 0x48

gUnknown_83FFA8C:: @ 83FFA8C
	.incbin "baserom.gba", 0x3FFA8C, 0x8

gUnknown_83FFA94:: @ 83FFA94
	.incbin "baserom.gba", 0x3FFA94, 0x30

gUnknown_83FFAC4:: @ 83FFAC4
	.incbin "baserom.gba", 0x3FFAC4, 0x1

gUnknown_83FFAC5:: @ 83FFAC5
	.incbin "baserom.gba", 0x3FFAC5, 0x5

gUnknown_83FFACA:: @ 83FFACA
	.incbin "baserom.gba", 0x3FFACA, 0x7A

gUnknown_83FFB44:: @ 83FFB44
	.incbin "baserom.gba", 0x3FFB44, 0x12C0

gUnknown_8400E04:: @ 8400E04
	.incbin "baserom.gba", 0x400E04, 0x12C0

gUnknown_84020C4:: @ 84020C4
	.incbin "baserom.gba", 0x4020C4, 0x16

gUnknown_84020DA:: @ 84020DA
	.incbin "baserom.gba", 0x4020DA, 0xC

gUnknown_84020E6:: @ 84020E6
	.incbin "baserom.gba", 0x4020E6, 0x12

gUnknown_84020F8:: @ 84020F8
	.incbin "baserom.gba", 0x4020F8, 0xE4

gUnknown_84021DC:: @ 84021DC
	.incbin "baserom.gba", 0x4021DC, 0xC

gUnknown_84021E8:: @ 84021E8
	.incbin "baserom.gba", 0x4021E8, 0x18

gUnknown_8402200:: @ 8402200
	.incbin "baserom.gba", 0x402200, 0x3

gUnknown_8402203:: @ 8402203
	.incbin "baserom.gba", 0x402203, 0x5

gUnknown_8402208:: @ 8402208
	.incbin "baserom.gba", 0x402208, 0x18

gUnknown_8402220:: @ 8402220
	.incbin "baserom.gba", 0x402220, 0x8

gUnknown_8402228:: @ 8402228
	.incbin "baserom.gba", 0x402228, 0x20

gUnknown_8402248:: @ 8402248
	.incbin "baserom.gba", 0x402248, 0x8

gUnknown_8402250:: @ 8402250
	.incbin "baserom.gba", 0x402250, 0x8

gUnknown_8402258:: @ 8402258
	.incbin "baserom.gba", 0x402258, 0x8


	.section .rodata.battle_anim_special

gUnknown_840BF3C:: @ 840BF3C
	.incbin "baserom.gba", 0x40BF3C, 0xC

gUnknown_840BF48:: @ 840BF48
	.incbin "baserom.gba", 0x40BF48, 0x60

gUnknown_840BFA8:: @ 840BFA8
	.incbin "baserom.gba", 0x40BFA8, 0xC0

gUnknown_840C068:: @ 840C068
	.incbin "baserom.gba", 0x40C068, 0xC

gUnknown_840C074:: @ 840C074
	.incbin "baserom.gba", 0x40C074, 0x30

gUnknown_840C0A4:: @ 840C0A4
	.incbin "baserom.gba", 0x40C0A4, 0x60

gUnknown_840C104:: @ 840C104
	.incbin "baserom.gba", 0x40C104, 0xC0

gUnknown_840C1C4:: @ 840C1C4
	.incbin "baserom.gba", 0x40C1C4, 0x64

gUnknown_840C228:: @ 840C228
	.incbin "baserom.gba", 0x40C228, 0xC

gUnknown_840C234:: @ 840C234
	.incbin "baserom.gba", 0x40C234, 0x8

gUnknown_840C23C:: @ 840C23C
	.incbin "baserom.gba", 0x40C23C, 0x4

gUnknown_840C240:: @ 840C240
	.incbin "baserom.gba", 0x40C240, 0x8

gUnknown_840C248:: @ 840C248
	.incbin "baserom.gba", 0x40C248, 0x10

gUnknown_840C258:: @ 840C258
	.incbin "baserom.gba", 0x40C258, 0x10

gUnknown_840C268:: @ 840C268
	.incbin "baserom.gba", 0x40C268, 0x6

gUnknown_840C26E:: @ 840C26E
	.incbin "baserom.gba", 0x40C26E, 0x2A

gUnknown_840C298:: @ 840C298
	.incbin "baserom.gba", 0x40C298, 0xEC

gUnknown_840C384:: @ 840C384
	.incbin "baserom.gba", 0x40C384, 0x18

gUnknown_840C39C:: @ 840C39C
	.incbin "baserom.gba", 0x40C39C, 0x20

gUnknown_840C3BC:: @ 840C3BC
	.incbin "baserom.gba", 0x40C3BC, 0x1E8

gUnknown_840C5A4:: @ 840C5A4
	.incbin "baserom.gba", 0x40C5A4, 0xC

gUnknown_840C5B0:: @ 840C5B0
	.incbin "baserom.gba", 0x40C5B0, 0x20

gUnknown_840C5D0:: @ 840C5D0
	.incbin "baserom.gba", 0x40C5D0, 0x20

gUnknown_840C5F0:: @ 840C5F0
	.incbin "baserom.gba", 0x40C5F0, 0x20

gUnknown_840C610:: @ 840C610
	.incbin "baserom.gba", 0x40C610, 0x20

gUnknown_840C630:: @ 840C630
	.incbin "baserom.gba", 0x40C630, 0x20

gUnknown_840C650:: @ 840C650
	.incbin "baserom.gba", 0x40C650, 0x404

gUnknown_840CA54:: @ 840CA54
	.incbin "baserom.gba", 0x40CA54, 0x138

gUnknown_840CB8C:: @ 840CB8C
	.incbin "baserom.gba", 0x40CB8C, 0x69C

gUnknown_840D228:: @ 840D228
	.incbin "baserom.gba", 0x40D228, 0xF30

gUnknown_840E158:: @ 840E158
	.incbin "baserom.gba", 0x40E158, 0x7AC

gUnknown_840E904:: @ 840E904
	.incbin "baserom.gba", 0x40E904, 0x93C

gUnknown_840F240:: @ 840F240
	.incbin "baserom.gba", 0x40F240, 0x704

gUnknown_840F944:: @ 840F944
	.incbin "baserom.gba", 0x40F944, 0x854

gUnknown_8410198:: @ 8410198
	.incbin "baserom.gba", 0x410198, 0x41C

gUnknown_84105B4:: @ 84105B4
	.incbin "baserom.gba", 0x4105B4, 0x728

gUnknown_8410CDC:: @ 8410CDC
	.incbin "baserom.gba", 0x410CDC, 0x18

gUnknown_8410CF4:: @ 8410CF4
	.incbin "baserom.gba", 0x410CF4, 0x10C

gUnknown_8410E00:: @ 8410E00
	.incbin "baserom.gba", 0x410E00, 0x4

gUnknown_8410E04:: @ 8410E04
	.incbin "baserom.gba", 0x410E04, 0x4

gUnknown_8410E08:: @ 8410E08
	.incbin "baserom.gba", 0x410E08, 0x8

gUnknown_8410E10:: @ 8410E10
	.incbin "baserom.gba", 0x410E10, 0x20

gUnknown_8410E30:: @ 8410E30
	.incbin "baserom.gba", 0x410E30, 0xDC8

gUnknown_8411BF8:: @ 8411BF8
	.incbin "baserom.gba", 0x411BF8, 0x20

gUnknown_8411C18:: @ 8411C18
	.incbin "baserom.gba", 0x411C18, 0xD88

gUnknown_84129A0:: @ 84129A0
	.incbin "baserom.gba", 0x4129A0, 0x20

gUnknown_84129C0:: @ 84129C0
	.incbin "baserom.gba", 0x4129C0, 0x958

gUnknown_8413318:: @ 8413318
	.incbin "baserom.gba", 0x413318, 0x20

gUnknown_8413338:: @ 8413338
	.incbin "baserom.gba", 0x413338, 0x51C

gUnknown_8413854:: @ 8413854
	.incbin "baserom.gba", 0x413854, 0x20

gUnknown_8413874:: @ 8413874
	.incbin "baserom.gba", 0x413874, 0x524

gUnknown_8413D98:: @ 8413D98
	.incbin "baserom.gba", 0x413D98, 0x20

gUnknown_8413DB8:: @ 8413DB8
	.incbin "baserom.gba", 0x413DB8, 0x564

gUnknown_841431C:: @ 841431C
	.incbin "baserom.gba", 0x41431C, 0x48

gUnknown_8414364:: @ 8414364
	.incbin "baserom.gba", 0x414364, 0x54

gUnknown_84143B8:: @ 84143B8
	.incbin "baserom.gba", 0x4143B8, 0x18

gUnknown_84143D0:: @ 84143D0
	.incbin "baserom.gba", 0x4143D0, 0x1B8

gUnknown_8414588:: @ 8414588
	.incbin "baserom.gba", 0x414588, 0x34

gUnknown_84145BC:: @ 84145BC
	.incbin "baserom.gba", 0x4145BC, 0x204

	@ strings

	.section .rodata.841EE44
	.align 2
gUnknown_841EE44:: @ 841EE44
	.incbin "baserom.gba", 0x41EE44, 0x20

gUnknown_841EE64:: @ 841EE64
	.incbin "baserom.gba", 0x41EE64, 0x4

gUnknown_841EE68:: @ 841EE68
	.incbin "baserom.gba", 0x41EE68, 0x18

gUnknown_841EE80:: @ 841EE80
	.incbin "baserom.gba", 0x41EE80, 0x44

gUnknown_841EEC4:: @ 841EEC4
	.incbin "baserom.gba", 0x41EEC4, 0x10

gUnknown_841EED4:: @ 841EED4
	.incbin "baserom.gba", 0x41EED4, 0x24

gUnknown_841EEF8:: @ 841EEF8
	.incbin "baserom.gba", 0x41EEF8, 0x18

gUnknown_841EF10:: @ 841EF10
	.incbin "baserom.gba", 0x41EF10, 0x2B8

gUnknown_841F1C8:: @ 841F1C8
	.incbin "graphics/text_window/unk_841F1C8.4bpp"

gTMCaseMainWindowPalette:: @ 841F408
	.incbin "graphics/tm_case/unk_841F408.gbapal"

	.section .rodata.841F4B4
	.align 2
gUnknown_841F4B4:: @ 841F4B4
	.incbin "baserom.gba", 0x41f4b4, 0x20

	.section .rodata.843EBB4
gUnknown_843EBB4:: @ 843EBB4
	.incbin "baserom.gba", 0x43EBB4, 0x18

gUnknown_843EBCC:: @ 843EBCC
	.incbin "baserom.gba", 0x43EBCC, 0x8

gUnknown_843EBD4:: @ 843EBD4
	.incbin "baserom.gba", 0x43EBD4, 0x64

gUnknown_843EC38:: @ 843EC38
	.incbin "baserom.gba", 0x43EC38, 0x9

gUnknown_843EC41:: @ 843EC41
	.incbin "baserom.gba", 0x43EC41, 0x10

gUnknown_843EC51:: @ 843EC51
	.incbin "baserom.gba", 0x43EC51, 0x13

gUnknown_843EC64:: @ 843EC64
	.incbin "baserom.gba", 0x43EC64, 0x28

gUnknown_843EC8C:: @ 843EC8C
	.incbin "baserom.gba", 0x43EC8C, 0xFC

	.align 2
gUnknown_843ED88:: @ 843ED88
	.incbin "baserom.gba", 0x43ED88, 0xC

	.align 2
gUnknown_843ED94:: @ 843ED94
	.asciz "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu.c"

	.align 2
gUnknown_843EDC4:: @ 843EDC4
	.asciz "Rfu.RfuFunc == NULL"

	.align 2
gUnknown_843EDD8:: @ 843EDD8
	.asciz "size<=252"

	.align 2
gUnknown_843EDE4:: @ 843EDE4
	.asciz "PokemonSioInfo"

	.byte 0, 1, 7, 0x14, 0xFF

	.align 2
gUnknown_843EDF8:: @ 843EDF8
	.asciz "LINK LOSS DISCONNECT!"

	.align 2
gUnknown_843EE10:: @ 843EE10
	.asciz "LINK LOSS RECOVERY NOW"

	.align 2
gUnknown_843EE28:: @ 843EE28
	.incbin "baserom.gba", 0x43EE28, 0x1F

gUnknown_843EE47:: @ 843EE47
	.incbin "baserom.gba", 0x43EE47, 0x10

gUnknown_843EE57:: @ 843EE57
	.incbin "baserom.gba", 0x43EE57, 0xD

	.align 2
gUnknown_843EE64:: @ 843EE64
	.asciz "NOWSLOT"
	.align 2
	.asciz "           "
	.align 2
	.asciz "CLOCK DRIFT"
	.align 2
	.asciz "BUSY SEND  "
	.align 2
	.asciz "CMD REJECT "
	.align 2
	.asciz "CLOCK SLAVE"
	.align 2
	.asciz "CHILD "
	.align 2
	.asciz "PARENT"
	.align 2
	.asciz "SEARCH"

	.align 2
	.incbin "baserom.gba", 0x43EEC0, 0x144

gUnknown_843F004:: @ 843F004
	.incbin "baserom.gba", 0x43F004, 0x100

gUnknown_843F104:: @ 843F104
	.incbin "baserom.gba", 0x43F104, 0x100

gUnknown_843F204:: @ 843F204
	.incbin "baserom.gba", 0x43F204, 0x70

gUnknown_843F274:: @ 843F274
	.incbin "baserom.gba", 0x43F274, 0x8

gUnknown_843F27C:: @ 843F27C
	.incbin "baserom.gba", 0x43F27C, 0x8

gUnknown_843F284:: @ 843F284
	.incbin "baserom.gba", 0x43F284, 0x18

gUnknown_843F29C:: @ 843F29C
	.incbin "baserom.gba", 0x43F29C, 0x8

gUnknown_843F2A4:: @ 843F2A4
	.incbin "baserom.gba", 0x43F2A4, 0x8

gUnknown_843F2AC:: @ 843F2AC
	.incbin "baserom.gba", 0x43F2AC, 0xF0

gUnknown_843F39C:: @ 843F39C
	.incbin "baserom.gba", 0x43F39C, 0x3D0

gUnknown_843F76C:: @ 843F76C
	.incbin "baserom.gba", 0x43F76C, 0x20

gUnknown_843F78C:: @ 843F78C
	.incbin "baserom.gba", 0x43F78C, 0x20

gUnknown_843F7AC:: @ 843F7AC
	.incbin "baserom.gba", 0x43F7AC, 0xC8

gUnknown_843F874:: @ 843F874
	.incbin "baserom.gba", 0x43F874, 0x8

gUnknown_843F87C:: @ 843F87C
	.incbin "baserom.gba", 0x43F87C, 0xC

gUnknown_843F888:: @ 843F888
	.incbin "baserom.gba", 0x43F888, 0x18

gUnknown_843F8A0:: @ 843F8A0
	.incbin "baserom.gba", 0x43F8A0, 0x10

gUnknown_843F8B0:: @ 843F8B0
	.incbin "baserom.gba", 0x43F8B0, 0x20

gUnknown_843F8D0:: @ 843F8D0
	.incbin "baserom.gba", 0x43F8D0, 0x8

gUnknown_843F8D8:: @ 843F8D8
	.incbin "baserom.gba", 0x43F8D8, 0x3

gUnknown_843F8DB:: @ 843F8DB
	.incbin "baserom.gba", 0x43F8DB, 0x5

gUnknown_843F8E0:: @ 843F8E0
	.4byte gUnknown_847A8D8
	.4byte gUnknown_847A8FA
	.4byte gUnknown_847A913
	.4byte gUnknown_847A934

gUnknown_843F8F0:: @ 843F8F0
	.incbin "baserom.gba", 0x43F8F0, 0x20

gUnknown_843F910:: @ 843F910
	.incbin "baserom.gba", 0x43F910, 0x28

gUnknown_843F938:: @ 843F938
	.incbin "baserom.gba", 0x43F938, 0x20

gUnknown_843F958:: @ 843F958
	.incbin "baserom.gba", 0x43F958, 0x10

gUnknown_843F968:: @ 843F968
	.incbin "baserom.gba", 0x43F968, 0x50

gUnknown_843F9B8:: @ 843F9B8
	.incbin "baserom.gba", 0x43F9B8, 0x68

gUnknown_843FA20:: @ 843FA20
	.incbin "baserom.gba", 0x43FA20, 0x20

gUnknown_843FA40:: @ 843FA40
	.incbin "baserom.gba", 0x43FA40, 0x40

gUnknown_843FA80:: @ 843FA80
	.incbin "baserom.gba", 0x43FA80, 0x18

gUnknown_843FA98:: @ 843FA98
	.incbin "baserom.gba", 0x43FA98, 0x18

gUnknown_843FAB0:: @ 843FAB0
	.incbin "baserom.gba", 0x43FAB0, 0x674

gUnknown_8440124:: @ 8440124
	.incbin "baserom.gba", 0x440124, 0x150

gUnknown_8440274:: @ 8440274
	.incbin "baserom.gba", 0x440274, 0x138

gUnknown_84403AC:: @ 84403AC
	.incbin "baserom.gba", 0x4403AC, 0x11C

gUnknown_84404C8:: @ 84404C8
	.incbin "baserom.gba", 0x4404C8, 0x200

gUnknown_84406C8:: @ 84406C8
	.incbin "baserom.gba", 0x4406C8, 0x4

gUnknown_84406CC:: @ 84406CC
	.incbin "baserom.gba", 0x4406CC, 0x2

gUnknown_84406CE:: @ 84406CE
	.incbin "baserom.gba", 0x4406CE, 0x12

gUnknown_84406E0:: @ 84406E0
	.incbin "baserom.gba", 0x4406E0, 0x810

gUnknown_8440EF0:: @ 8440EF0
	.incbin "baserom.gba", 0x440EF0, 0x2570

gUnknown_8443460:: @ 8443460
	.incbin "baserom.gba", 0x443460, 0x1A0

gUnknown_8443600:: @ 8443600
	.incbin "baserom.gba", 0x443600, 0x20

gUnknown_8443620:: @ 8443620
	.incbin "baserom.gba", 0x443620, 0x6E0

gUnknown_8443D00:: @ 8443D00
	.incbin "baserom.gba", 0x443D00, 0x2C0

gUnknown_8443FC0:: @ 8443FC0
	.incbin "baserom.gba", 0x443FC0, 0x336

gUnknown_84442F6:: @ 84442F6
	.incbin "baserom.gba", 0x4442F6, 0x304

gUnknown_84445FA:: @ 84445FA
	.incbin "baserom.gba", 0x4445FA, 0x304

gUnknown_84448FE:: @ 84448FE
	.incbin "baserom.gba", 0x4448FE, 0x336

	.section .rodata.8451EBC

gUnknown_8451EBC:: @ 8451EBC
	.incbin "baserom.gba", 0x451EBC, 0x10

gUnknown_8451ECC:: @ 8451ECC
	.incbin "baserom.gba", 0x451ECC, 0x18

gUnknown_8451EE4:: @ 8451EE4
	.incbin "baserom.gba", 0x451EE4, 0x70

gUnknown_8451F54:: @ 8451F54
	.incbin "baserom.gba", 0x451F54, 0x8

gUnknown_8451F5C:: @ 8451F5C
	.incbin "baserom.gba", 0x451F5C, 0x8

gUnknown_8451F64:: @ 8451F64
	.incbin "baserom.gba", 0x451F64, 0xA0

gUnknown_8452004:: @ 8452004
	.incbin "baserom.gba", 0x452004, 0xB8

gUnknown_84520BC:: @ 84520BC
	.incbin "baserom.gba", 0x4520BC, 0x18

gUnknown_84520D4:: @ 84520D4
	.incbin "baserom.gba", 0x4520D4, 0x10

gUnknown_84520E4:: @ 84520E4
	.incbin "baserom.gba", 0x4520E4, 0x10

gUnknown_84520F4:: @ 84520F4
	.incbin "baserom.gba", 0x4520F4, 0x78

gUnknown_845216C:: @ 845216C
	.incbin "baserom.gba", 0x45216C, 0x8

gUnknown_8452174:: @ 8452174
	.incbin "baserom.gba", 0x452174, 0x18

gUnknown_845218C:: @ 845218C
	.incbin "baserom.gba", 0x45218C, 0x28

gUnknown_84521B4:: @ 84521B4
	.incbin "baserom.gba", 0x4521B4, 0x10

gUnknown_84521C4:: @ 84521C4
	.incbin "baserom.gba", 0x4521C4, 0x8

gUnknown_84521CC:: @ 84521CC
	.incbin "baserom.gba", 0x4521CC, 0x8

gUnknown_84521D4:: @ 84521D4
	.incbin "baserom.gba", 0x4521D4, 0x8

gUnknown_84521DC:: @ 84521DC
	.incbin "baserom.gba", 0x4521DC, 0x8

gUnknown_84521E4:: @ 84521E4
	.incbin "baserom.gba", 0x4521E4, 0x8

gUnknown_84521EC:: @ 84521EC
	.incbin "baserom.gba", 0x4521EC, 0x8

gUnknown_84521F4:: @ 84521F4
	.incbin "baserom.gba", 0x4521F4, 0x8

gUnknown_84521FC:: @ 84521FC
	.incbin "baserom.gba", 0x4521FC, 0x8

gUnknown_8452204:: @ 8452204
	.incbin "baserom.gba", 0x452204, 0x8

gUnknown_845220C:: @ 845220C
	.incbin "baserom.gba", 0x45220C, 0x8

gUnknown_8452214:: @ 8452214
	.incbin "baserom.gba", 0x452214, 0x40

gUnknown_8452254:: @ 8452254
	.incbin "baserom.gba", 0x452254, 0x38

gUnknown_845228C:: @ 845228C
	.incbin "baserom.gba", 0x45228C, 0xA8

gUnknown_8452334:: @ 8452334
	.incbin "baserom.gba", 0x452334, 0x10

gUnknown_8452344:: @ 8452344
	.incbin "baserom.gba", 0x452344, 0x24

gUnknown_8452368:: @ 8452368
	.incbin "baserom.gba", 0x452368, 0x20

gUnknown_8452388:: @ 8452388
	.incbin "baserom.gba", 0x452388, 0x12C

gUnknown_84524B4:: @ 84524B4
	.incbin "baserom.gba", 0x4524B4, 0x10

gUnknown_84524C4:: @ 84524C4
	.incbin "baserom.gba", 0x4524C4, 0x788

gUnknown_8452C4C:: @ 8452C4C
	.incbin "baserom.gba", 0x452C4C, 0x48

	.section .rodata.8452CF4

gUnknown_8452CF4:: @ 8452CF4
	.incbin "baserom.gba", 0x452CF4, 0x8

gUnknown_8452CFC:: @ 8452CFC
	.incbin "baserom.gba", 0x452CFC, 0xC

gUnknown_8452D08:: @ 8452D08
	.incbin "baserom.gba", 0x452D08, 0x1B0

gUnknown_8452EB8:: @ 8452EB8
	.incbin "baserom.gba", 0x452EB8, 0x60

gUnknown_8452F18:: @ 8452F18
	.incbin "baserom.gba", 0x452F18, 0xC

gUnknown_8452F24:: @ 8452F24
	.incbin "baserom.gba", 0x452F24, 0x4

gUnknown_8452F28:: @ 8452F28
	.incbin "baserom.gba", 0x452F28, 0x6

gUnknown_8452F2E:: @ 8452F2E
	.incbin "baserom.gba", 0x452F2E, 0x2

gUnknown_8452F30:: @ 8452F30
	.incbin "baserom.gba", 0x452F30, 0x2

gUnknown_8452F32:: @ 8452F32
	.incbin "baserom.gba", 0x452F32, 0x2

gUnknown_8452F34:: @ 8452F34
	.incbin "baserom.gba", 0x452F34, 0x1C

gUnknown_8452F50:: @ 8452F50
	.incbin "baserom.gba", 0x452F50, 0x8

gUnknown_8452F58:: @ 8452F58
	.incbin "baserom.gba", 0x452F58, 0x8

gUnknown_8452F60:: @ 8452F60
	.incbin "baserom.gba", 0x452F60, 0x6

gUnknown_8452F66:: @ 8452F66
	.incbin "baserom.gba", 0x452F66, 0x6

gUnknown_8452F6C:: @ 8452F6C
	.incbin "baserom.gba", 0x452F6C, 0x10

gUnknown_8452F7C:: @ 8452F7C
	.incbin "baserom.gba", 0x452F7C, 0xC0

	.section .rodata.8453F6C
// mailbox_pc.o
gUnknown_8453FE8:: @ 8453FE8
	.incbin "baserom.gba", 0x453FE8, 0x18

gUnknown_8454000:: @ 8454000
	.incbin "baserom.gba", 0x454000, 0x3

gUnknown_8454003:: @ 8454003
	.incbin "baserom.gba", 0x454003, 0x2615

	@ menu.o
	@ quest_log.o
	@ link_rfu_3.o
	.section .rodata.8456C74
gUnknown_8456C74:: @ 8456C74
	.incbin "baserom.gba", 0x456C74, 0x5C

gUnknown_8456CD0:: @ 8456CD0
	.incbin "baserom.gba", 0x456CD0, 0x8

gUnknown_8456CD8:: @ 8456CD8
	.incbin "baserom.gba", 0x456CD8, 0x24

gUnknown_8456CFC:: @ 8456CFC
	.incbin "baserom.gba", 0x456CFC, 0x8

gUnknown_8456D04:: @ 8456D04
	.incbin "baserom.gba", 0x456D04, 0x30

gUnknown_8456D34:: @ 8456D34
	.incbin "baserom.gba", 0x456D34, 0x18

gUnknown_8456D4C:: @ 8456D4C
	.incbin "baserom.gba", 0x456D4C, 0x8

gUnknown_8456D54:: @ 8456D54
	.incbin "baserom.gba", 0x456D54, 0x88

gUnknown_8456DDC:: @ 8456DDC
	.incbin "baserom.gba", 0x456DDC, 0x18

gUnknown_8456DF4:: @ 8456DF4
	.incbin "baserom.gba", 0x456DF4, 0x28

gUnknown_8456E1C:: @ 8456E1C
	.incbin "baserom.gba", 0x456E1C, 0x18

gUnknown_8456E34:: @ 8456E34
	.incbin "baserom.gba", 0x456E34, 0x20

gUnknown_8456E54:: @ 8456E54
	.incbin "baserom.gba", 0x456E54, 0x18

gUnknown_8456E6C:: @ 8456E6C
	.incbin "baserom.gba", 0x456E6C, 0x98

gUnknown_8456F04:: @ 8456F04
	.incbin "baserom.gba", 0x456F04, 0x18

gUnknown_8456F1C:: @ 8456F1C
	.incbin "baserom.gba", 0x456F1C, 0x8

gUnknown_8456F24:: @ 8456F24
	.incbin "baserom.gba", 0x456F24, 0x58

gUnknown_8456F7C:: @ 8456F7C
	.incbin "baserom.gba", 0x456F7C, 0xB8

gUnknown_8457034:: @ 8457034
	.incbin "baserom.gba", 0x457034, 0x60

gUnknown_8457094:: @ 8457094
	.incbin "baserom.gba", 0x457094, 0x34

gUnknown_84570C8:: @ 84570C8
	.incbin "baserom.gba", 0x4570C8, 0x10

gUnknown_84570D8:: @ 84570D8
	.incbin "baserom.gba", 0x4570D8, 0x14

gUnknown_84570EC:: @ 84570EC
	.incbin "baserom.gba", 0x4570EC, 0x20

gUnknown_845710C:: @ 845710C
	.incbin "baserom.gba", 0x45710C, 0xA

gUnknown_8457116:: @ 8457116
	.incbin "baserom.gba", 0x457116, 0x5

gUnknown_845711B:: @ 845711B
	.incbin "baserom.gba", 0x45711B, 0x5

gUnknown_8457120:: @ 8457120
	.incbin "baserom.gba", 0x457120, 0x18

	.align 2
gUnknown_8457138:: @ 8457138
	.asciz "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/rfu_union_tool.c"

	.align 2
gUnknown_8457174:: @ 8457174
	.asciz "0"

	.align 2
gUnknown_8457178:: @ 8457178
	.asciz "UnionObjWork != NULL"

gUnknown_845718D:: @ 845718D
	.incbin "baserom.gba", 0x45718D, 0x2

gUnknown_845718F:: @ 845718F
	.incbin "baserom.gba", 0x45718F, 0x5

gUnknown_8457194:: @ 8457194
	.incbin "baserom.gba", 0x457194, 0x4

gUnknown_8457198:: @ 8457198
	.incbin "baserom.gba", 0x457198, 0x10

gUnknown_84571A8:: @ 84571A8
	.incbin "baserom.gba", 0x4571A8, 0x8

gUnknown_84571B0:: @ 84571B0
	.incbin "baserom.gba", 0x4571B0, 0x4

gUnknown_84571B4:: @ 84571B4
	.incbin "baserom.gba", 0x4571B4, 0x4

gUnknown_84571B8:: @ 84571B8
	.incbin "baserom.gba", 0x4571B8, 0x28

gUnknown_84571E0:: @ 84571E0
	.incbin "baserom.gba", 0x4571E0, 0x54

gUnknown_8457234:: @ 8457234
	.incbin "baserom.gba", 0x457234, 0x30

gUnknown_8457264:: @ 8457264
	.incbin "baserom.gba", 0x457264, 0x1C8

gUnknown_845742C:: @ 845742C
	.incbin "baserom.gba", 0x45742C, 0x50

gUnknown_845747C:: @ 845747C
	.incbin "baserom.gba", 0x45747C, 0x24

gUnknown_84574A0:: @ 84574A0
	.incbin "baserom.gba", 0x4574A0, 0x24

gUnknown_84574C4:: @ 84574C4
	.incbin "baserom.gba", 0x4574C4, 0x28

gUnknown_84574EC:: @ 84574EC
	.incbin "baserom.gba", 0x4574EC, 0x28

gUnknown_8457514:: @ 8457514
	.incbin "baserom.gba", 0x457514, 0x1C

gUnknown_8457530:: @ 8457530
	.incbin "baserom.gba", 0x457530, 0x24

gUnknown_8457554:: @ 8457554
	.incbin "baserom.gba", 0x457554, 0xB4

gUnknown_8457608:: @ 8457608
	.incbin "baserom.gba", 0x457608, 0x8

gUnknown_8457610:: @ 8457610
	.incbin "baserom.gba", 0x457610, 0x6C

gUnknown_845767C:: @ 845767C
	.incbin "baserom.gba", 0x45767C, 0x30

gUnknown_84576AC:: @ 84576AC
	.incbin "baserom.gba", 0x4576AC, 0x18

gUnknown_84576C4:: @ 84576C4
	.incbin "baserom.gba", 0x4576C4, 0x3C

gUnknown_8457700:: @ 8457700
	.incbin "baserom.gba", 0x457700, 0x1C

gUnknown_845771C:: @ 845771C
	.incbin "baserom.gba", 0x45771C, 0x38

gUnknown_8457754:: @ 8457754
	.incbin "baserom.gba", 0x457754, 0x28

gUnknown_845777C:: @ 845777C
	.incbin "baserom.gba", 0x45777C, 0x40

gUnknown_84577BC:: @ 84577BC
	.incbin "baserom.gba", 0x4577BC, 0x3C

gUnknown_84577F8:: @ 84577F8
	.incbin "baserom.gba", 0x4577F8, 0x40

gUnknown_8457838:: @ 8457838
	.incbin "baserom.gba", 0x457838, 0x84

gUnknown_84578BC:: @ 84578BC
	.incbin "baserom.gba", 0x4578BC, 0x178

gUnknown_8457A34:: @ 8457A34
	.incbin "baserom.gba", 0x457A34, 0xD0

gUnknown_8457B04:: @ 8457B04
	.incbin "baserom.gba", 0x457B04, 0xC8

gUnknown_8457BCC:: @ 8457BCC
	.incbin "baserom.gba", 0x457BCC, 0x54

gUnknown_8457C20:: @ 8457C20
	.incbin "baserom.gba", 0x457C20, 0x28

gUnknown_8457C48:: @ 8457C48
	.incbin "baserom.gba", 0x457C48, 0x5C

gUnknown_8457CA4:: @ 8457CA4
	.incbin "baserom.gba", 0x457CA4, 0x54

gUnknown_8457CF8:: @ 8457CF8
	.incbin "baserom.gba", 0x457CF8, 0x4C

gUnknown_8457D44:: @ 8457D44
	.incbin "baserom.gba", 0x457D44, 0x74

gUnknown_8457DB8:: @ 8457DB8
	.incbin "baserom.gba", 0x457DB8, 0x54

gUnknown_8457E0C:: @ 8457E0C
	.incbin "baserom.gba", 0x457E0C, 0x1C

gUnknown_8457E28:: @ 8457E28
	.incbin "baserom.gba", 0x457E28, 0x1C

gUnknown_8457E44:: @ 8457E44
	.incbin "baserom.gba", 0x457E44, 0x1C

gUnknown_8457E60:: @ 8457E60
	.incbin "baserom.gba", 0x457E60, 0x120

gUnknown_8457F80:: @ 8457F80
	.incbin "baserom.gba", 0x457F80, 0x10

gUnknown_8457F90:: @ 8457F90
	.incbin "baserom.gba", 0x457F90, 0x164

gUnknown_84580F4:: @ 84580F4
	.incbin "baserom.gba", 0x4580F4, 0x13C

gUnknown_8458230:: @ 8458230
	.incbin "baserom.gba", 0x458230, 0xE4

gUnknown_8458314:: @ 8458314
	.incbin "baserom.gba", 0x458314, 0xA0

gUnknown_84583B4:: @ 84583B4
	.incbin "baserom.gba", 0x4583B4, 0x78

gUnknown_845842C:: @ 845842C
	.incbin "baserom.gba", 0x45842C, 0x8

gUnknown_8458434:: @ 8458434
	.incbin "baserom.gba", 0x458434, 0x48

gUnknown_845847C:: @ 845847C
	.incbin "baserom.gba", 0x45847C, 0x44

gUnknown_84584C0:: @ 84584C0
	.incbin "baserom.gba", 0x4584C0, 0x88

gUnknown_8458548:: @ 8458548
	.incbin "baserom.gba", 0x458548, 0xA0

gUnknown_84585E8:: @ 84585E8
	.incbin "baserom.gba", 0x4585E8, 0x170

gUnknown_8458758:: @ 8458758
	.incbin "baserom.gba", 0x458758, 0x164

gUnknown_84588BC:: @ 84588BC
	.incbin "baserom.gba", 0x4588BC, 0xF0

gUnknown_84589AC:: @ 84589AC
	.incbin "baserom.gba", 0x4589AC, 0xCC

gUnknown_8458A78:: @ 8458A78
	.incbin "baserom.gba", 0x458A78, 0x20

gUnknown_8458A98:: @ 8458A98
	.incbin "baserom.gba", 0x458A98, 0x20

gUnknown_8458AB8:: @ 8458AB8
	.incbin "baserom.gba", 0x458AB8, 0x8C

gUnknown_8458B44:: @ 8458B44
	.incbin "baserom.gba", 0x458B44, 0x190

gUnknown_8458CD4:: @ 8458CD4
	.incbin "baserom.gba", 0x458CD4, 0x48

gUnknown_8458D1C:: @ 8458D1C
	.incbin "baserom.gba", 0x458D1C, 0x38

gUnknown_8458D54:: @ 8458D54
	.incbin "baserom.gba", 0x458D54, 0x24

gUnknown_8458D78:: @ 8458D78
	.incbin "baserom.gba", 0x458D78, 0x24

gUnknown_8458D9C:: @ 8458D9C
	.incbin "baserom.gba", 0x458D9C, 0x20

gUnknown_8458DBC:: @ 8458DBC
	.incbin "baserom.gba", 0x458DBC, 0x2C

gUnknown_8458DE8:: @ 8458DE8
	.incbin "baserom.gba", 0x458DE8, 0x28

gUnknown_8458E10:: @ 8458E10
	.incbin "baserom.gba", 0x458E10, 0x60

gUnknown_8458E70:: @ 8458E70
	.incbin "baserom.gba", 0x458E70, 0x60

gUnknown_8458ED0:: @ 8458ED0
	.incbin "baserom.gba", 0x458ED0, 0x34

gUnknown_8458F04:: @ 8458F04
	.incbin "baserom.gba", 0x458F04, 0x98

gUnknown_8458F9C:: @ 8458F9C
	.incbin "baserom.gba", 0x458F9C, 0x20

gUnknown_8458FBC:: @ 8458FBC
	.incbin "baserom.gba", 0x458FBC, 0xC

gUnknown_8458FC8:: @ 8458FC8
	.incbin "baserom.gba", 0x458FC8, 0x1C

gUnknown_8458FE4:: @ 8458FE4
	.incbin "baserom.gba", 0x458FE4, 0x1D4

gUnknown_84591B8:: @ 84591B8
	.incbin "baserom.gba", 0x4591B8, 0x24

gUnknown_84591DC:: @ 84591DC
	.incbin "baserom.gba", 0x4591DC, 0x5C

gUnknown_8459238:: @ 8459238
	.incbin "baserom.gba", 0x459238, 0x18

gUnknown_8459250:: @ 8459250
	.incbin "baserom.gba", 0x459250, 0x3C

gUnknown_845928C:: @ 845928C
	.incbin "baserom.gba", 0x45928C, 0xB0

gUnknown_845933C:: @ 845933C
	.incbin "baserom.gba", 0x45933C, 0x3C

gUnknown_8459378:: @ 8459378
	.incbin "baserom.gba", 0x459378, 0x138

gUnknown_84594B0:: @ 84594B0
	.incbin "baserom.gba", 0x4594B0, 0x14

gUnknown_84594C4:: @ 84594C4
	.incbin "baserom.gba", 0x4594C4, 0x40

gUnknown_8459504:: @ 8459504
	.incbin "baserom.gba", 0x459504, 0x7C

gUnknown_8459580:: @ 8459580
	.incbin "baserom.gba", 0x459580, 0x8

gUnknown_8459588:: @ 8459588
	.incbin "baserom.gba", 0x459588, 0x64

gUnknown_84595EC::
	.incbin "baserom.gba", 0x4595EC, 0x48

gUnknown_8459634:: @ 8459634
	.incbin "baserom.gba", 0x459634, 0x8

gUnknown_845963C:: @ 845963C
	.incbin "baserom.gba", 0x45963C, 0x20

gUnknown_845965C:: @ 845965C
	.incbin "baserom.gba", 0x45965C, 0x20

gUnknown_845967C:: @ 845967C
	.incbin "baserom.gba", 0x45967C, 0xC0

gUnknown_845973C:: @ 845973C
	.incbin "baserom.gba", 0x45973C, 0x12C

gUnknown_8459868:: @ 8459868
	.incbin "baserom.gba", 0x459868, 0x20

gUnknown_8459888:: @ 8459888
	.incbin "baserom.gba", 0x459888, 0xF8

gUnknown_8459980:: @ 8459980
	.incbin "baserom.gba", 0x459980, 0x8

gUnknown_8459988:: @ 8459988
	.incbin "baserom.gba", 0x459988, 0x10

gUnknown_8459998:: @ 8459998
	.incbin "baserom.gba", 0x459998, 0x12

gUnknown_84599AA:: @ 84599AA
	.incbin "baserom.gba", 0x4599AA, 0x8

gUnknown_84599B2:: @ 84599B2
	.incbin "baserom.gba", 0x4599B2, 0x6

gUnknown_84599B8:: @ 84599B8
	.incbin "baserom.gba", 0x4599B8, 0x8

gUnknown_84599C0:: @ 84599C0
	.incbin "baserom.gba", 0x4599C0, 0x8

gUnknown_84599C8:: @ 84599C8
	.incbin "baserom.gba", 0x4599C8, 0x8

gUnknown_84599D0:: @ 84599D0
	.incbin "baserom.gba", 0x4599D0, 0x50

gUnknown_8459A20:: @ 8459A20
	.incbin "baserom.gba", 0x459A20, 0x10

gUnknown_8459A30:: @ 8459A30
	.incbin "baserom.gba", 0x459A30, 0x78

gUnknown_8459AA8:: @ 8459AA8
	.incbin "baserom.gba", 0x459AA8, 0x24

gUnknown_8459ACC:: @ 8459ACC
	.incbin "baserom.gba", 0x459ACC, 0x20

gUnknown_8459AEC:: @ 8459AEC
	.incbin "baserom.gba", 0x459AEC, 0x44

gUnknown_8459B30:: @ 8459B30
	.incbin "baserom.gba", 0x459B30, 0x18

gUnknown_8459B48:: @ 8459B48
	.incbin "baserom.gba", 0x459B48, 0x18

gUnknown_8459B60:: @ 8459B60
	.incbin "baserom.gba", 0x459B60, 0x1E

gUnknown_8459B7E:: @ 8459B7E
	.incbin "baserom.gba", 0x459B7E, 0x33A

gUnknown_8459EB8:: @ 8459EB8
	.incbin "baserom.gba", 0x459EB8, 0xC

gUnknown_8459EC4:: @ 8459EC4
	.incbin "baserom.gba", 0x459EC4, 0x20

gUnknown_8459EE4:: @ 8459EE4
	.incbin "baserom.gba", 0x459EE4, 0x20

gUnknown_8459F04:: @ 8459F04
	.incbin "baserom.gba", 0x459F04, 0xC0

gUnknown_8459FC4:: @ 8459FC4
	.incbin "baserom.gba", 0x459FC4, 0x1C

gUnknown_8459FE0:: @ 8459FE0
	.incbin "baserom.gba", 0x459FE0, 0x1C

gUnknown_8459FFC:: @ 8459FFC
	.incbin "baserom.gba", 0x459FFC, 0xF

gUnknown_845A00B:: @ 845A00B
	.incbin "baserom.gba", 0x45A00B, 0x5

gUnknown_845A010:: @ 845A010
	.incbin "baserom.gba", 0x45A010, 0x40

gUnknown_845A050:: @ 845A050
	.incbin "baserom.gba", 0x45A050, 0x40

gUnknown_845A090:: @ 845A090
	.incbin "baserom.gba", 0x45A090, 0x40

gUnknown_845A0D0:: @ 845A0D0
	.incbin "baserom.gba", 0x45A0D0, 0x38

gUnknown_845A108:: @ 845A108
	.incbin "baserom.gba", 0x45A108, 0x8

gUnknown_845A110:: @ 845A110
	.incbin "baserom.gba", 0x45A110, 0x8

gUnknown_845A118:: @ 845A118
	.incbin "baserom.gba", 0x45A118, 0x8

gUnknown_845A120:: @ 845A120
	.incbin "baserom.gba", 0x45A120, 0x8

gUnknown_845A128:: @ 845A128
	.incbin "baserom.gba", 0x45A128, 0x8

gUnknown_845A130:: @ 845A130
	.incbin "baserom.gba", 0x45A130, 0x8

gUnknown_845A138:: @ 845A138
	.incbin "baserom.gba", 0x45A138, 0x8

gUnknown_845A140:: @ 845A140
	.incbin "baserom.gba", 0x45A140, 0x8

gUnknown_845A148:: @ 845A148
	.incbin "baserom.gba", 0x45A148, 0x8

gUnknown_845A150:: @ 845A150
	.incbin "baserom.gba", 0x45A150, 0x8

gUnknown_845A158:: @ 845A158
	.incbin "baserom.gba", 0x45A158, 0x8

gUnknown_845A160:: @ 845A160
	.incbin "baserom.gba", 0x45A160, 0x8

gUnknown_845A168:: @ 845A168
	.incbin "baserom.gba", 0x45A168, 0x8

gUnknown_845A170:: @ 845A170
	.incbin "baserom.gba", 0x45A170, 0x8

gUnknown_845A178:: @ 845A178
	.incbin "baserom.gba", 0x45A178, 0x8

gUnknown_845A180:: @ 845A180
	.incbin "baserom.gba", 0x45A180, 0x46

gUnknown_845A1C6:: @ 845A1C6
	.incbin "baserom.gba", 0x45A1C6, 0x46

gUnknown_845A20C:: @ 845A20C
	.incbin "baserom.gba", 0x45A20C, 0x36

gUnknown_845A242:: @ 845A242
	.incbin "baserom.gba", 0x45A242, 0x36

gUnknown_845A278:: @ 845A278
	.incbin "baserom.gba", 0x45A278, 0x36

gUnknown_845A2AE:: @ 845A2AE
	.incbin "baserom.gba", 0x45A2AE, 0x2

gUnknown_845A2B0:: @ 845A2B0
	.incbin "baserom.gba", 0x45A2B0, 0x2

gUnknown_845A2B2:: @ 845A2B2
	.incbin "baserom.gba", 0x45A2B2, 0x3

gUnknown_845A2B5:: @ 845A2B5
	.incbin "baserom.gba", 0x45A2B5, 0x3

gUnknown_845A2B8:: @ 845A2B8
	.incbin "baserom.gba", 0x45A2B8, 0x2

gUnknown_845A2BA:: @ 845A2BA
	.incbin "baserom.gba", 0x45A2BA, 0x2

gUnknown_845A2BC:: @ 845A2BC
	.incbin "baserom.gba", 0x45A2BC, 0x2

gUnknown_845A2BE:: @ 845A2BE
	.incbin "baserom.gba", 0x45A2BE, 0x2

gUnknown_845A2C0:: @ 845A2C0
	.incbin "baserom.gba", 0x45A2C0, 0x2

gUnknown_845A2C2:: @ 845A2C2
	.incbin "baserom.gba", 0x45A2C2, 0x3

gUnknown_845A2C5:: @ 845A2C5
	.incbin "baserom.gba", 0x45A2C5, 0x3

gUnknown_845A2C8:: @ 845A2C8
	.incbin "baserom.gba", 0x45A2C8, 0x3

gUnknown_845A2CB:: @ 845A2CB
	.incbin "baserom.gba", 0x45A2CB, 0x3

gUnknown_845A2CE:: @ 845A2CE
	.incbin "baserom.gba", 0x45A2CE, 0x3

gUnknown_845A2D1:: @ 845A2D1
	.incbin "baserom.gba", 0x45A2D1, 0x3

gUnknown_845A2D4:: @ 845A2D4
	.incbin "baserom.gba", 0x45A2D4, 0x3

gUnknown_845A2D7:: @ 845A2D7
	.incbin "baserom.gba", 0x45A2D7, 0x3

gUnknown_845A2DA:: @ 845A2DA
	.incbin "baserom.gba", 0x45A2DA, 0x3

gUnknown_845A2DD:: @ 845A2DD
	.incbin "baserom.gba", 0x45A2DD, 0x3

gUnknown_845A2E0:: @ 845A2E0
	.incbin "baserom.gba", 0x45A2E0, 0x3

gUnknown_845A2E3:: @ 845A2E3
	.incbin "baserom.gba", 0x45A2E3, 0x5

gUnknown_845A2E8:: @ 845A2E8
	.incbin "baserom.gba", 0x45A2E8, 0x6C

gUnknown_845A354:: @ 845A354
	.incbin "baserom.gba", 0x45A354, 0x28

gUnknown_845A37C:: @ 845A37C
	.incbin "baserom.gba", 0x45A37C, 0xB0

gUnknown_845A42C:: @ 845A42C
	.incbin "baserom.gba", 0x45A42C, 0x8

gUnknown_845A434:: @ 845A434
	.incbin "baserom.gba", 0x45A434, 0x8

gUnknown_845A43C:: @ 845A43C
	.incbin "baserom.gba", 0x45A43C, 0x38

gUnknown_845A474:: @ 845A474
	.incbin "baserom.gba", 0x45A474, 0x8

gUnknown_845A47C:: @ 845A47C
	.incbin "baserom.gba", 0x45A47C, 0x8

gUnknown_845A484:: @ 845A484
	.incbin "baserom.gba", 0x45A484, 0x68

gUnknown_845A4EC:: @ 845A4EC
	.incbin "baserom.gba", 0x45A4EC, 0x8

gUnknown_845A4F4:: @ 845A4F4
	.incbin "baserom.gba", 0x45A4F4, 0x80

gUnknown_845A574:: @ 845A574
	.incbin "baserom.gba", 0x45A574, 0x8

gUnknown_845A57C:: @ 845A57C
	.incbin "baserom.gba", 0x45A57C, 0x8

gUnknown_845A584:: @ 845A584
	.incbin "baserom.gba", 0x45A584, 0x18

gUnknown_845A59C:: @ 845A59C
	.incbin "baserom.gba", 0x45A59C, 0x7C

gUnknown_845A618:: @ 845A618
	.incbin "baserom.gba", 0x45A618, 0x114

gUnknown_845A72C:: @ 845A72C
	.incbin "baserom.gba", 0x45A72C, 0x34

gUnknown_845A760:: @ 845A760
	.incbin "baserom.gba", 0x45A760, 0xE

gUnknown_845A76E:: @ 845A76E
	.incbin "baserom.gba", 0x45A76E, 0x1A

gUnknown_845A788:: @ 845A788
	.incbin "baserom.gba", 0x45A788, 0x60

gUnknown_845A7E8:: @ 845A7E8
	.incbin "baserom.gba", 0x45A7E8, 0x24

gUnknown_845A80C:: @ 845A80C
	.incbin "baserom.gba", 0x45A80C, 0x74

gUnknown_845A880:: @ 845A880
	.incbin "baserom.gba", 0x45A880, 0x28

gUnknown_845A8A8:: @ 845A8A8
	.incbin "baserom.gba", 0x45A8A8, 0x4

gUnknown_845A8AC:: @ 845A8AC
	.incbin "baserom.gba", 0x45A8AC, 0x100

gUnknown_845A9AC:: @ 845A9AC
	.incbin "baserom.gba", 0x45A9AC, 0x78

gUnknown_845AA24:: @ 845AA24
	.incbin "baserom.gba", 0x45AA24, 0x20

gUnknown_845AA44:: @ 845AA44
	.incbin "baserom.gba", 0x45AA44, 0x20

gUnknown_845AA64:: @ 845AA64
	.incbin "baserom.gba", 0x45AA64, 0x20

gUnknown_845AA84:: @ 845AA84
	.incbin "baserom.gba", 0x45AA84, 0x10

gUnknown_845AA94:: @ 845AA94
	.incbin "baserom.gba", 0x45AA94, 0x28

gUnknown_845AABC:: @ 845AABC
	.incbin "baserom.gba", 0x45AABC, 0xA8

gUnknown_845AB64:: @ 845AB64
	.incbin "baserom.gba", 0x45AB64, 0x84

gUnknown_845ABE8:: @ 845ABE8
	.incbin "baserom.gba", 0x45ABE8, 0x4

gUnknown_845ABEC:: @ 845ABEC
	.incbin "baserom.gba", 0x45ABEC, 0x2A

gUnknown_845AC16:: @ 845AC16
	.incbin "baserom.gba", 0x45AC16, 0x342

gUnknown_845AF58:: @ 845AF58
	.incbin "baserom.gba", 0x45AF58, 0x28

gUnknown_845AF80:: @ 845AF80
	.incbin "baserom.gba", 0x45AF80, 0x40

gUnknown_845AFC0:: @ 845AFC0
	.incbin "baserom.gba", 0x45AFC0, 0x20

gUnknown_845AFE0:: @ 845AFE0
	.incbin "baserom.gba", 0x45AFE0, 0x18

gUnknown_845AFF8:: @ 845AFF8
	.incbin "baserom.gba", 0x45AFF8, 0x58

gUnknown_845B050:: @ 845B050
	.incbin "baserom.gba", 0x45B050, 0x18

gUnknown_845B068:: @ 845B068
	.incbin "baserom.gba", 0x45B068, 0x18
