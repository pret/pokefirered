	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
	// oak_speech
gUnknown_8460D94:: @ 8460D94
	.incbin "baserom.gba", 0x460D94, 0xA0

gUnknown_8460E34:: @ 8460E34
	.incbin "baserom.gba", 0x460E34, 0xA0

gUnknown_8460ED4:: @ 8460ED4
	.incbin "baserom.gba", 0x460ED4, 0x40

gUnknown_8460F14:: @ 8460F14
	.incbin "baserom.gba", 0x460F14, 0x6E8

gUnknown_84615FC:: @ 84615FC
	.incbin "baserom.gba", 0x4615FC, 0x40

gUnknown_846163C:: @ 846163C
	.incbin "baserom.gba", 0x46163C, 0x698

gUnknown_8461CD4:: @ 8461CD4
	.incbin "baserom.gba", 0x461CD4, 0x40

gUnknown_8461D14:: @ 8461D14
	.incbin "baserom.gba", 0x461D14, 0x698

gUnknown_84623AC:: @ 84623AC
	.incbin "baserom.gba", 0x4623AC, 0x40

gUnknown_84623EC:: @ 84623EC
	.incbin "baserom.gba", 0x4623EC, 0xA6C

gUnknown_8462E58:: @ 8462E58
	.incbin "baserom.gba", 0x462E58, 0xC

gUnknown_8462E64:: @ 8462E64
	window_template 0x00, 0x00, 0x07, 0x1e, 0x04, 0x0f, 0x0001

gUnknown_8462E6C:: @ 8462E6C
	window_template 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0000

gUnknown_8462E74:: @ 8462E74
	window_template 0x00, 0x06, 0x03, 0x18, 0x06, 0x0f, 0x0001

gUnknown_8462E7C:: @ 8462E7C
	window_template 0x00, 0x06, 0x0a, 0x18, 0x04, 0x0f, 0x0092

gUnknown_8462E84:: @ 8462E84
	window_template 0x00, 0x06, 0x0f, 0x18, 0x04, 0x0f, 0x00f3

gUnknown_8462E8C:: @ 8462E8C
	window_template 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0000

gUnknown_8462E94:: @ 8462E94
	window_template 0x00, 0x06, 0x03, 0x18, 0x04, 0x0f, 0x0001

gUnknown_8462E9C:: @ 8462E9C
	window_template 0x00, 0x06, 0x08, 0x18, 0x04, 0x0f, 0x0062

gUnknown_8462EA4:: @ 8462EA4
	window_template 0x00, 0x06, 0x0d, 0x18, 0x06, 0x0f, 0x00c3

gUnknown_8462EAC:: @ 8462EAC
	window_template 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0000

gUnknown_8462EB4:: @ 8462EB4
	.4byte gUnknown_8462E64
	.4byte gUnknown_8462E74
	.4byte gUnknown_8462E94

gUnknown_8462EC0:: @ 8462EC0
	window_template 0x00, 0x01, 0x04, 0x1c, 0x0f, 0x0f, 0x0001

gUnknown_8462EC8:: @ 8462EC8
	window_template 0x00, 0x12, 0x09, 0x09, 0x04, 0x0f, 0x0174

gUnknown_8462ED0:: @ 8462ED0
	window_template 0x00, 0x02, 0x02, 0x06, 0x04, 0x0f, 0x0180

gUnknown_8462ED8:: @ 8462ED8
	.incbin "baserom.gba", 0x462ED8, 0x10

	.align 2
gUnknown_8462EE8:: @ 8462EE8
	.byte 0x00, 0x01, 0x02

	.align 2
gUnknown_8462EEC:: @ 8462EEC
	.byte 0x00, 0x02, 0x03

	.align 2
gUnknown_8462EF0:: @ 8462EF0
	.4byte gUnknown_81C5A04
	.4byte gUnknown_81C5AEB
	.4byte gUnknown_81C5BB9

gUnknown_8462EFC:: @ 8462EFC
	.incbin "baserom.gba", 0x462EFC, 0x18

gUnknown_8462F14:: @ 8462F14
	.incbin "baserom.gba", 0x462F14, 0x8

gUnknown_8462F1C:: @ 8462F1C
	.incbin "baserom.gba", 0x462F1C, 0x8

gUnknown_8462F24:: @ 8462F24
	.incbin "baserom.gba", 0x462F24, 0x2C

gUnknown_8462F50:: @ 8462F50
	.incbin "baserom.gba", 0x462F50, 0xDC

gUnknown_846302C:: @ 846302C
	.incbin "baserom.gba", 0x46302C, 0x48

gUnknown_8463074:: @ 8463074
	.incbin "baserom.gba", 0x463074, 0x18

gUnknown_846308C:: @ 846308C
	.incbin "baserom.gba", 0x46308C, 0x4C

gUnknown_84630D8:: @ 84630D8
	.incbin "baserom.gba", 0x4630D8, 0x4C

gUnknown_8463124:: @ 8463124
	.incbin "baserom.gba", 0x463124, 0x10

gUnknown_8463134:: @ 8463134
	.incbin "baserom.gba", 0x463134, 0xC

gUnknown_8463140:: @ 8463140
	.incbin "baserom.gba", 0x463140, 0x10

gUnknown_8463150:: @ 8463150
	.incbin "baserom.gba", 0x463150, 0x18

gUnknown_8463168:: @ 8463168
	.incbin "baserom.gba", 0x463168, 0x3

gUnknown_846316B:: @ 846316B
	.incbin "baserom.gba", 0x46316B, 0x5

gUnknown_8463170:: @ 8463170
	.incbin "baserom.gba", 0x463170, 0x8

gUnknown_8463178:: @ 8463178
	.incbin "baserom.gba", 0x463178, 0x4

gUnknown_846317C:: @ 846317C
	.incbin "baserom.gba", 0x46317C, 0x4

gUnknown_8463180:: @ 8463180
	.incbin "baserom.gba", 0x463180, 0x4

gUnknown_8463184:: @ 8463184
	.incbin "baserom.gba", 0x463184, 0xC

gUnknown_8463190:: @ 8463190
	.incbin "baserom.gba", 0x463190, 0x50

gUnknown_84631E0:: @ 84631E0
	.incbin "baserom.gba", 0x4631E0, 0x8

gUnknown_84631E8:: @ 84631E8
	.incbin "baserom.gba", 0x4631E8, 0x30

gUnknown_8463218:: @ 8463218
	.incbin "baserom.gba", 0x463218, 0x8

gUnknown_8463220:: @ 8463220
	.incbin "baserom.gba", 0x463220, 0x18

gUnknown_8463238:: @ 8463238
	.incbin "baserom.gba", 0x463238, 0x24

gUnknown_846325C:: @ 846325C
	.incbin "baserom.gba", 0x46325C, 0x48

gUnknown_84632A4:: @ 84632A4
	.incbin "baserom.gba", 0x4632A4, 0x18

gUnknown_84632BC:: @ 84632BC
	.incbin "baserom.gba", 0x4632BC, 0x4

gUnknown_84632C0:: @ 84632C0
	.incbin "baserom.gba", 0x4632C0, 0x4

gUnknown_84632C4:: @ 84632C4
	.incbin "baserom.gba", 0x4632C4, 0x4

gUnknown_84632C8:: @ 84632C8
	.incbin "baserom.gba", 0x4632C8, 0x4

gUnknown_84632CC:: @ 84632CC
	.incbin "baserom.gba", 0x4632CC, 0x4

gUnknown_84632D0:: @ 84632D0
	.incbin "baserom.gba", 0x4632D0, 0x4

gUnknown_84632D4:: @ 84632D4
	.incbin "baserom.gba", 0x4632D4, 0x4

gUnknown_84632D8:: @ 84632D8
	.incbin "baserom.gba", 0x4632D8, 0x18

gUnknown_84632F0:: @ 84632F0
	.incbin "baserom.gba", 0x4632F0, 0x18

gUnknown_8463308:: @ 8463308
	.incbin "baserom.gba", 0x463308, 0x20

gUnknown_8463328:: @ 8463328
	.incbin "baserom.gba", 0x463328, 0x70

gUnknown_8463398:: @ 8463398
	.incbin "baserom.gba", 0x463398, 0x40

gUnknown_84633D8:: @ 84633D8
	.incbin "baserom.gba", 0x4633D8, 0x44

gUnknown_846341C:: @ 846341C
	.incbin "baserom.gba", 0x46341C, 0x20

gUnknown_846343C:: @ 846343C
	.incbin "baserom.gba", 0x46343C, 0x128

gUnknown_8463564:: @ 8463564
	.incbin "baserom.gba", 0x463564, 0x1C

gUnknown_8463580:: @ 8463580
	.incbin "baserom.gba", 0x463580, 0x140

gUnknown_84636C0:: @ 84636C0
	.incbin "baserom.gba", 0x4636C0, 0x20

gUnknown_84636E0:: @ 84636E0
	.incbin "baserom.gba", 0x4636E0, 0x20

gUnknown_8463700:: @ 8463700
	.incbin "baserom.gba", 0x463700, 0x20

gUnknown_8463720:: @ 8463720
	.incbin "baserom.gba", 0x463720, 0x20

gUnknown_8463740:: @ 8463740
	.incbin "baserom.gba", 0x463740, 0x12C

gUnknown_846386C:: @ 846386C
	.incbin "baserom.gba", 0x46386C, 0x120

gUnknown_846398C:: @ 846398C
	.incbin "baserom.gba", 0x46398C, 0x18

gUnknown_84639A4:: @ 84639A4
	.incbin "baserom.gba", 0x4639A4, 0x8

gUnknown_84639AC:: @ 84639AC
	.incbin "baserom.gba", 0x4639AC, 0x48

gUnknown_84639F4:: @ 84639F4
	.incbin "baserom.gba", 0x4639F4, 0x20

gUnknown_8463A14:: @ 8463A14
	.incbin "baserom.gba", 0x463A14, 0x68

gUnknown_8463A7C:: @ 8463A7C
	.incbin "baserom.gba", 0x463A7C, 0x70

gUnknown_8463AEC:: @ 8463AEC
	.incbin "baserom.gba", 0x463AEC, 0x10

gUnknown_8463AFC:: @ 8463AFC
	.incbin "baserom.gba", 0x463AFC, 0x4

gUnknown_8463B00:: @ 8463B00
	.incbin "baserom.gba", 0x463B00, 0x20

gUnknown_8463B20:: @ 8463B20
	.incbin "baserom.gba", 0x463B20, 0x10

gUnknown_8463B30:: @ 8463B30
	.incbin "baserom.gba", 0x463B30, 0x10

gUnknown_8463B40:: @ 8463B40
	.incbin "baserom.gba", 0x463B40, 0x4

gUnknown_8463B44:: @ 8463B44
	.incbin "baserom.gba", 0x463B44, 0x20

gUnknown_8463B64:: @ 8463B64
	.incbin "baserom.gba", 0x463B64, 0x24

gUnknown_8463B88:: @ 8463B88
	.incbin "baserom.gba", 0x463B88, 0xF8

gUnknown_8463C80:: @ 8463C80
	.incbin "baserom.gba", 0x463C80, 0x1E0

gUnknown_8463E60:: @ 8463E60
	.incbin "baserom.gba", 0x463E60, 0x64

gUnknown_8463EC4:: @ 8463EC4
	.incbin "baserom.gba", 0x463EC4, 0x10

gUnknown_8463ED4:: @ 8463ED4
	.incbin "baserom.gba", 0x463ED4, 0x1C

gUnknown_8463EF0:: @ 8463EF0
	.incbin "baserom.gba", 0x463EF0, 0xC

gUnknown_8463EFC:: @ 8463EFC
	.incbin "baserom.gba", 0x463EFC, 0x10

gUnknown_8463F0C:: @ 8463F0C
	.incbin "baserom.gba", 0x463F0C, 0x18

gUnknown_8463F24:: @ 8463F24
	.incbin "baserom.gba", 0x463F24, 0x18

gUnknown_8463F3C:: @ 8463F3C
	.incbin "baserom.gba", 0x463F3C, 0x20

gUnknown_8463F5C:: @ 8463F5C
	.incbin "baserom.gba", 0x463F5C, 0x20

gUnknown_8463F7C:: @ 8463F7C
	.incbin "baserom.gba", 0x463F7C, 0x20

gUnknown_8463F9C:: @ 8463F9C
	.incbin "baserom.gba", 0x463F9C, 0x8

gUnknown_8463FA4:: @ 8463FA4
	.incbin "baserom.gba", 0x463FA4, 0x3

gUnknown_8463FA7:: @ 8463FA7
	.incbin "baserom.gba", 0x463FA7, 0x11

gUnknown_8463FB8:: @ 8463FB8
	.incbin "baserom.gba", 0x463FB8, 0x6

gUnknown_8463FBE:: @ 8463FBE
	.incbin "baserom.gba", 0x463FBE, 0x3

gUnknown_8463FC1:: @ 8463FC1
	.incbin "baserom.gba", 0x463FC1, 0x5

gUnknown_8463FC6:: @ 8463FC6
	.incbin "baserom.gba", 0x463FC6, 0x7

gUnknown_8463FCD:: @ 8463FCD
	.incbin "baserom.gba", 0x463FCD, 0x7

gUnknown_8463FD4:: @ 8463FD4
	.incbin "baserom.gba", 0x463FD4, 0xB

gUnknown_8463FDF:: @ 8463FDF
	.incbin "baserom.gba", 0x463FDF, 0xB

gUnknown_8463FEA:: @ 8463FEA
	.incbin "baserom.gba", 0x463FEA, 0x12

gUnknown_8463FFC:: @ 8463FFC
	.incbin "baserom.gba", 0x463FFC, 0xC

gUnknown_8464008:: @ 8464008
	.incbin "baserom.gba", 0x464008, 0x120

gUnknown_8464128:: @ 8464128
	.incbin "baserom.gba", 0x464128, 0x20

gUnknown_8464148:: @ 8464148
	.incbin "baserom.gba", 0x464148, 0x174

gUnknown_84642BC:: @ 84642BC
	.incbin "baserom.gba", 0x4642BC, 0x4

gUnknown_84642C0:: @ 84642C0
	.incbin "baserom.gba", 0x4642C0, 0x34

gUnknown_84642F4:: @ 84642F4
	.incbin "baserom.gba", 0x4642F4, 0xC

gUnknown_8464300:: @ 8464300
	.incbin "baserom.gba", 0x464300, 0x4C

gUnknown_846434C:: @ 846434C
	.incbin "baserom.gba", 0x46434C, 0xC

gUnknown_8464358:: @ 8464358
	.incbin "baserom.gba", 0x464358, 0x14

gUnknown_846436C:: @ 846436C
	.incbin "baserom.gba", 0x46436C, 0x8

gUnknown_8464374:: @ 8464374
	.incbin "baserom.gba", 0x464374, 0x8

gUnknown_846437C:: @ 846437C
	.incbin "baserom.gba", 0x46437C, 0x28

gUnknown_84643A4:: @ 84643A4
	.incbin "baserom.gba", 0x4643A4, 0x4

gUnknown_84643A8:: @ 84643A8
	.incbin "baserom.gba", 0x4643A8, 0x4

gUnknown_84643AC:: @ 84643AC
	.incbin "baserom.gba", 0x4643AC, 0x4

gUnknown_84643B0:: @ 84643B0
	.incbin "baserom.gba", 0x4643B0, 0x4

gUnknown_84643B4:: @ 84643B4
	.incbin "baserom.gba", 0x4643B4, 0x4

gUnknown_84643B8:: @ 84643B8
	.incbin "baserom.gba", 0x4643B8, 0x20

gUnknown_84643D8:: @ 84643D8
	.incbin "baserom.gba", 0x4643D8, 0x18

gUnknown_84643F0:: @ 84643F0
	.incbin "baserom.gba", 0x4643F0, 0x8

gUnknown_84643F8:: @ 84643F8
	.incbin "baserom.gba", 0x4643F8, 0x8

gUnknown_8464400:: @ 8464400
	.incbin "baserom.gba", 0x464400, 0x48

gUnknown_8464448:: @ 8464448
	.incbin "baserom.gba", 0x464448, 0x60

gUnknown_84644A8:: @ 84644A8
	.incbin "baserom.gba", 0x4644A8, 0x8

gUnknown_84644B0:: @ 84644B0
	.incbin "baserom.gba", 0x4644B0, 0x8

gUnknown_84644B8:: @ 84644B8
	.incbin "baserom.gba", 0x4644B8, 0x32C

gUnknown_84647E4:: @ 84647E4
	.incbin "baserom.gba", 0x4647E4, 0x18

gUnknown_84647FC:: @ 84647FC
	.incbin "baserom.gba", 0x4647FC, 0x8

gUnknown_8464804:: @ 8464804
	.incbin "baserom.gba", 0x464804, 0x38

gUnknown_846483C:: @ 846483C
	.incbin "baserom.gba", 0x46483C, 0x40

gUnknown_846487C:: @ 846487C
	.incbin "baserom.gba", 0x46487C, 0x8

gUnknown_8464884:: @ 8464884
	.incbin "baserom.gba", 0x464884, 0xC

gUnknown_8464890:: @ 8464890
	.incbin "baserom.gba", 0x464890, 0x1E

gUnknown_84648AE:: @ 84648AE
	.incbin "baserom.gba", 0x4648AE, 0xF

gUnknown_84648BD:: @ 84648BD
	.incbin "baserom.gba", 0x4648BD, 0x15

gUnknown_84648D2:: @ 84648D2
	.incbin "baserom.gba", 0x4648D2, 0x54

gUnknown_8464926:: @ 8464926
	.incbin "baserom.gba", 0x464926, 0x40

gUnknown_8464966:: @ 8464966
	.incbin "baserom.gba", 0x464966, 0xC4A

gUnknown_84655B0:: @ 84655B0
	.incbin "baserom.gba", 0x4655B0, 0x18

gUnknown_84655C8:: @ 84655C8
	.incbin "baserom.gba", 0x4655C8, 0x40

gUnknown_8465608:: @ 8465608
	.incbin "baserom.gba", 0x465608, 0xE

gUnknown_8465616:: @ 8465616
	.incbin "baserom.gba", 0x465616, 0xC0

gUnknown_84656D6:: @ 84656D6
	.incbin "baserom.gba", 0x4656D6, 0x10E

gUnknown_84657E4:: @ 84657E4
	.incbin "baserom.gba", 0x4657E4, 0x98

gUnknown_846587C:: @ 846587C
	.incbin "baserom.gba", 0x46587C, 0x5C

gUnknown_84658D8:: @ 84658D8
	.incbin "baserom.gba", 0x4658D8, 0x18

gUnknown_84658F0:: @ 84658F0
	.incbin "baserom.gba", 0x4658F0, 0x40

gUnknown_8465930:: @ 8465930
	.incbin "baserom.gba", 0x465930, 0x20

gUnknown_8465950:: @ 8465950
	.incbin "baserom.gba", 0x465950, 0x80

gUnknown_84659D0:: @ 84659D0
	.incbin "baserom.gba", 0x4659D0, 0x804

gUnknown_84661D4:: @ 84661D4
	.incbin "baserom.gba", 0x4661D4, 0x2E8

gUnknown_84664BC:: @ 84664BC
	.incbin "baserom.gba", 0x4664BC, 0x20

gUnknown_84664DC:: @ 84664DC
	.incbin "baserom.gba", 0x4664DC, 0x60

gUnknown_846653C:: @ 846653C
	.incbin "baserom.gba", 0x46653C, 0x84

gUnknown_84665C0:: @ 84665C0
	.incbin "baserom.gba", 0x4665C0, 0x60

gUnknown_8466620:: @ 8466620
	.incbin "baserom.gba", 0x466620, 0x378

gUnknown_8466998:: @ 8466998
	.incbin "baserom.gba", 0x466998, 0x178

gUnknown_8466B10:: @ 8466B10
	.incbin "baserom.gba", 0x466B10, 0x10

gUnknown_8466B20:: @ 8466B20
	.incbin "baserom.gba", 0x466B20, 0xEC

gUnknown_8466C0C:: @ 8466C0C
	.incbin "baserom.gba", 0x466C0C, 0x28

gUnknown_8466C34:: @ 8466C34
	.incbin "baserom.gba", 0x466C34, 0x4

gUnknown_8466C38:: @ 8466C38
	.incbin "baserom.gba", 0x466C38, 0x8

gUnknown_8466C40:: @ 8466C40
	.incbin "baserom.gba", 0x466C40, 0x18

gUnknown_8466C58:: @ 8466C58
	.incbin "baserom.gba", 0x466C58, 0xB8

gUnknown_8466D10:: @ 8466D10
	.incbin "baserom.gba", 0x466D10, 0x20

gUnknown_8466D30:: @ 8466D30
	.incbin "baserom.gba", 0x466D30, 0x30

gUnknown_8466D60:: @ 8466D60
	.incbin "baserom.gba", 0x466D60, 0x10

gUnknown_8466D70:: @ 8466D70
	.incbin "baserom.gba", 0x466D70, 0x20

gUnknown_8466D90:: @ 8466D90
	.incbin "baserom.gba", 0x466D90, 0x8

gUnknown_8466D98:: @ 8466D98
	.incbin "baserom.gba", 0x466D98, 0x8

gUnknown_8466DA0:: @ 8466DA0
	.incbin "baserom.gba", 0x466DA0, 0x8

gUnknown_8466DA8:: @ 8466DA8
	.incbin "baserom.gba", 0x466DA8, 0x8

gUnknown_8466DB0:: @ 8466DB0
	.incbin "baserom.gba", 0x466DB0, 0x8

gUnknown_8466DB8:: @ 8466DB8
	.incbin "baserom.gba", 0x466DB8, 0x8

gUnknown_8466DC0:: @ 8466DC0
	.incbin "baserom.gba", 0x466DC0, 0x8

gUnknown_8466DC8:: @ 8466DC8
	.incbin "baserom.gba", 0x466DC8, 0x8

gUnknown_8466DD0:: @ 8466DD0
	.incbin "baserom.gba", 0x466DD0, 0x18

gUnknown_8466DE8:: @ 8466DE8
	.incbin "baserom.gba", 0x466DE8, 0x18

gUnknown_8466E00:: @ 8466E00
	.incbin "baserom.gba", 0x466E00, 0x78

gUnknown_8466E78:: @ 8466E78
	.incbin "baserom.gba", 0x466E78, 0x18

gUnknown_8466E90:: @ 8466E90
	.incbin "baserom.gba", 0x466E90, 0x18

gUnknown_8466EA8:: @ 8466EA8
	.incbin "baserom.gba", 0x466EA8, 0x18

gUnknown_8466EC0:: @ 8466EC0
	.incbin "baserom.gba", 0x466EC0, 0x28

gUnknown_8466EE8:: @ 8466EE8
	.incbin "baserom.gba", 0x466EE8, 0x8

gUnknown_8466EF0:: @ 8466EF0
	.incbin "baserom.gba", 0x466EF0, 0x10
