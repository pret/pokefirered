	.include "asm/macros/m4a.inc"
	.include "asm/macros/music_voice.inc"
	.section .rodata

voicegroup_pokemon_cry:: @ 8489C8C
	.incbin "baserom.gba", 0x489C8C, 0x2C88

gCryTable:: @ 848C914
	.incbin "baserom.gba", 0x48C914, 0x1230

gCryTable2:: @ 848DB44
	.incbin "baserom.gba", 0x48DB44, 0x1230

gUnknown_848ED74:: @ 848ED74
	.incbin "baserom.gba", 0x48ED74, 0x14528

	.include "sound/music_player_table.inc"
	.include "sound/song_table.inc"

gDirectSoundWaveData_0:: @ 0x84A3DA8
	.incbin "baserom.gba", 0x4A3DA8, 0x211898

gSong_86B5640:: @ 0x86B5640
	.incbin "baserom.gba", 0x6B5640, 0x20

gSong_86B5660:: @ 0x86B5660
	.incbin "baserom.gba", 0x6B5660, 0x2C

gSong_86B568C:: @ 0x86B568C
	.incbin "baserom.gba", 0x6B568C, 0x24

gSong_86B56B0:: @ 0x86B56B0
	.incbin "baserom.gba", 0x6B56B0, 0x44

gSong_86B56F4:: @ 0x86B56F4
	.incbin "baserom.gba", 0x6B56F4, 0x2C

gSong_86B5720:: @ 0x86B5720
	.incbin "baserom.gba", 0x6B5720, 0x1C

gSong_86B573C:: @ 0x86B573C
	.incbin "baserom.gba", 0x6B573C, 0x1C

gSong_86B5758:: @ 0x86B5758
	.incbin "baserom.gba", 0x6B5758, 0x1C

gSong_86B5774:: @ 0x86B5774
	.incbin "baserom.gba", 0x6B5774, 0x34

gSong_86B57A8:: @ 0x86B57A8
	.incbin "baserom.gba", 0x6B57A8, 0x24

gSong_86B57CC:: @ 0x86B57CC
	.incbin "baserom.gba", 0x6B57CC, 0x1C

gSong_86B57E8:: @ 0x86B57E8
	.incbin "baserom.gba", 0x6B57E8, 0x2C

gSong_86B5814:: @ 0x86B5814
	.incbin "baserom.gba", 0x6B5814, 0x4C

gSong_86B5860:: @ 0x86B5860
	.incbin "baserom.gba", 0x6B5860, 0x7C

gSong_86B58DC:: @ 0x86B58DC
	.incbin "baserom.gba", 0x6B58DC, 0x54

gSong_86B5930:: @ 0x86B5930
	.incbin "baserom.gba", 0x6B5930, 0x54

gSong_86B5984:: @ 0x86B5984
	.incbin "baserom.gba", 0x6B5984, 0x50

gSong_86B59D4:: @ 0x86B59D4
	.incbin "baserom.gba", 0x6B59D4, 0x1C

gSong_86B59F0:: @ 0x86B59F0
	.incbin "baserom.gba", 0x6B59F0, 0x54

gSong_86B5A44:: @ 0x86B5A44
	.incbin "baserom.gba", 0x6B5A44, 0x48

gSong_86B5A8C:: @ 0x86B5A8C
	.incbin "baserom.gba", 0x6B5A8C, 0x2C

gSong_86B5AB8:: @ 0x86B5AB8
	.incbin "baserom.gba", 0x6B5AB8, 0x24

gSong_86B5ADC:: @ 0x86B5ADC
	.incbin "baserom.gba", 0x6B5ADC, 0x24

gSong_86B5B00:: @ 0x86B5B00
	.incbin "baserom.gba", 0x6B5B00, 0x84

gSong_86B5B84:: @ 0x86B5B84
	.incbin "baserom.gba", 0x6B5B84, 0x2C

gSong_86B5BB0:: @ 0x86B5BB0
	.incbin "baserom.gba", 0x6B5BB0, 0x30

gSong_86B5BE0:: @ 0x86B5BE0
	.incbin "baserom.gba", 0x6B5BE0, 0x180

gSong_86B5D60:: @ 0x86B5D60
	.incbin "baserom.gba", 0x6B5D60, 0x24

gSong_86B5D84:: @ 0x86B5D84
	.incbin "baserom.gba", 0x6B5D84, 0x24

gSong_86B5DA8:: @ 0x86B5DA8
	.incbin "baserom.gba", 0x6B5DA8, 0x24

gSong_86B5DCC:: @ 0x86B5DCC
	.incbin "baserom.gba", 0x6B5DCC, 0x30

gSong_86B5DFC:: @ 0x86B5DFC
	.incbin "baserom.gba", 0x6B5DFC, 0x24

gSong_86B5E20:: @ 0x86B5E20
	.incbin "baserom.gba", 0x6B5E20, 0x4C

gSong_86B5E6C:: @ 0x86B5E6C
	.incbin "baserom.gba", 0x6B5E6C, 0x38

gSong_86B5EA4:: @ 0x86B5EA4
	.incbin "baserom.gba", 0x6B5EA4, 0x54

gSong_86B5EF8:: @ 0x86B5EF8
	.incbin "baserom.gba", 0x6B5EF8, 0x3C

gSong_86B5F34:: @ 0x86B5F34
	.incbin "baserom.gba", 0x6B5F34, 0x58

gSong_86B5F8C:: @ 0x86B5F8C
	.incbin "baserom.gba", 0x6B5F8C, 0x44

gSong_86B5FD0:: @ 0x86B5FD0
	.incbin "baserom.gba", 0x6B5FD0, 0x3C

gSong_86B600C:: @ 0x86B600C
	.incbin "baserom.gba", 0x6B600C, 0x40

gSong_86B604C:: @ 0x86B604C
	.incbin "baserom.gba", 0x6B604C, 0x2C

gSong_86B6078:: @ 0x86B6078
	.incbin "baserom.gba", 0x6B6078, 0x3C

gSong_86B60B4:: @ 0x86B60B4
	.incbin "baserom.gba", 0x6B60B4, 0xAC

gSong_86B6160:: @ 0x86B6160
	.incbin "baserom.gba", 0x6B6160, 0x78

gSong_86B61D8:: @ 0x86B61D8
	.incbin "baserom.gba", 0x6B61D8, 0x2C

gSong_86B6204:: @ 0x86B6204
	.incbin "baserom.gba", 0x6B6204, 0x34

gSong_86B6238:: @ 0x86B6238
	.incbin "baserom.gba", 0x6B6238, 0x2C

gSong_86B6264:: @ 0x86B6264
	.incbin "baserom.gba", 0x6B6264, 0x44

gSong_86B62A8:: @ 0x86B62A8
	.incbin "baserom.gba", 0x6B62A8, 0x2C

gSong_86B62D4:: @ 0x86B62D4
	.incbin "baserom.gba", 0x6B62D4, 0x2C

gSong_86B6300:: @ 0x86B6300
	.incbin "baserom.gba", 0x6B6300, 0x2C

gSong_86B632C:: @ 0x86B632C
	.incbin "baserom.gba", 0x6B632C, 0x2C

gSong_86B6358:: @ 0x86B6358
	.incbin "baserom.gba", 0x6B6358, 0x54

gSong_86B63AC:: @ 0x86B63AC
	.incbin "baserom.gba", 0x6B63AC, 0x44

gSong_86B63F0:: @ 0x86B63F0
	.incbin "baserom.gba", 0x6B63F0, 0x34

gSong_86B6424:: @ 0x86B6424
	.incbin "baserom.gba", 0x6B6424, 0x38

gSong_86B645C:: @ 0x86B645C
	.incbin "baserom.gba", 0x6B645C, 0x38

gSong_86B6494:: @ 0x86B6494
	.incbin "baserom.gba", 0x6B6494, 0x38

gSong_86B64CC:: @ 0x86B64CC
	.incbin "baserom.gba", 0x6B64CC, 0x38

gSong_86B6504:: @ 0x86B6504
	.incbin "baserom.gba", 0x6B6504, 0x38

gSong_86B653C:: @ 0x86B653C
	.incbin "baserom.gba", 0x6B653C, 0x38

gSong_86B6574:: @ 0x86B6574
	.incbin "baserom.gba", 0x6B6574, 0x38

gSong_86B65AC:: @ 0x86B65AC
	.incbin "baserom.gba", 0x6B65AC, 0x34

gSong_86B65E0:: @ 0x86B65E0
	.incbin "baserom.gba", 0x6B65E0, 0x24

gSong_86B6604:: @ 0x86B6604
	.incbin "baserom.gba", 0x6B6604, 0x4C

gSong_86B6650:: @ 0x86B6650
	.incbin "baserom.gba", 0x6B6650, 0x60

gSong_86B66B0:: @ 0x86B66B0
	.incbin "baserom.gba", 0x6B66B0, 0x34

gSong_86B66E4:: @ 0x86B66E4
	.incbin "baserom.gba", 0x6B66E4, 0x30

gSong_86B6714:: @ 0x86B6714
	.incbin "baserom.gba", 0x6B6714, 0x38

gSong_86B674C:: @ 0x86B674C
	.incbin "baserom.gba", 0x6B674C, 0x44

gSong_86B6790:: @ 0x86B6790
	.incbin "baserom.gba", 0x6B6790, 0x30

gSong_86B67C0:: @ 0x86B67C0
	.incbin "baserom.gba", 0x6B67C0, 0x28

gSong_86B67E8:: @ 0x86B67E8
	.incbin "baserom.gba", 0x6B67E8, 0x68

gSong_86B6850:: @ 0x86B6850
	.incbin "baserom.gba", 0x6B6850, 0x3C

gSong_86B688C:: @ 0x86B688C
	.incbin "baserom.gba", 0x6B688C, 0x40

gSong_86B68CC:: @ 0x86B68CC
	.incbin "baserom.gba", 0x6B68CC, 0x3C

gSong_86B6908:: @ 0x86B6908
	.incbin "baserom.gba", 0x6B6908, 0x40

gSong_86B6948:: @ 0x86B6948
	.incbin "baserom.gba", 0x6B6948, 0x3C

gSong_86B6984:: @ 0x86B6984
	.incbin "baserom.gba", 0x6B6984, 0x40

gSong_86B69C4:: @ 0x86B69C4
	.incbin "baserom.gba", 0x6B69C4, 0x68

gSong_86B6A2C:: @ 0x86B6A2C
	.incbin "baserom.gba", 0x6B6A2C, 0x50

gSong_86B6A7C:: @ 0x86B6A7C
	.incbin "baserom.gba", 0x6B6A7C, 0x3C

gSong_86B6AB8:: @ 0x86B6AB8
	.incbin "baserom.gba", 0x6B6AB8, 0x30

gSong_86B6AE8:: @ 0x86B6AE8
	.incbin "baserom.gba", 0x6B6AE8, 0x4C

gSong_86B6B34:: @ 0x86B6B34
	.incbin "baserom.gba", 0x6B6B34, 0x24

gSong_86B6B58:: @ 0x86B6B58
	.incbin "baserom.gba", 0x6B6B58, 0x54

gSong_86B6BAC:: @ 0x86B6BAC
	.incbin "baserom.gba", 0x6B6BAC, 0x94

gSong_86B6C40:: @ 0x86B6C40
	.incbin "baserom.gba", 0x6B6C40, 0x3C

gSong_86B6C7C:: @ 0x86B6C7C
	.incbin "baserom.gba", 0x6B6C7C, 0x24

gSong_86B6CA0:: @ 0x86B6CA0
	.incbin "baserom.gba", 0x6B6CA0, 0x64

gSong_86B6D04:: @ 0x86B6D04
	.incbin "baserom.gba", 0x6B6D04, 0x68

gSong_86B6D6C:: @ 0x86B6D6C
	.incbin "baserom.gba", 0x6B6D6C, 0x28

gSong_86B6D94:: @ 0x86B6D94
	.incbin "baserom.gba", 0x6B6D94, 0x34

gSong_86B6DC8:: @ 0x86B6DC8
	.incbin "baserom.gba", 0x6B6DC8, 0x2C

gSong_86B6DF4:: @ 0x86B6DF4
	.incbin "baserom.gba", 0x6B6DF4, 0x7C

gSong_86B6E70:: @ 0x86B6E70
	.incbin "baserom.gba", 0x6B6E70, 0xC0

gSong_86B6F30:: @ 0x86B6F30
	.incbin "baserom.gba", 0x6B6F30, 0xE8

gSong_86B7018:: @ 0x86B7018
	.incbin "baserom.gba", 0x6B7018, 0x118

gSong_86B7130:: @ 0x86B7130
	.incbin "baserom.gba", 0x6B7130, 0x24

gSong_86B7154:: @ 0x86B7154
	.incbin "baserom.gba", 0x6B7154, 0x114

gSong_86B7268:: @ 0x86B7268
	.incbin "baserom.gba", 0x6B7268, 0x2C

gSong_86B7294:: @ 0x86B7294
	.incbin "baserom.gba", 0x6B7294, 0x34

gSong_86B72C8:: @ 0x86B72C8
	.incbin "baserom.gba", 0x6B72C8, 0x64

gSong_86B732C:: @ 0x86B732C
	.incbin "baserom.gba", 0x6B732C, 0x68

gSong_86B7394:: @ 0x86B7394
	.incbin "baserom.gba", 0x6B7394, 0x1FC

gSong_86B7590:: @ 0x86B7590
	.incbin "baserom.gba", 0x6B7590, 0x8C

gSong_86B761C:: @ 0x86B761C
	.incbin "baserom.gba", 0x6B761C, 0x50

gSong_86B766C:: @ 0x86B766C
	.incbin "baserom.gba", 0x6B766C, 0x2C

gSong_86B7698:: @ 0x86B7698
	.incbin "baserom.gba", 0x6B7698, 0x20

gSong_86B76B8:: @ 0x86B76B8
	.incbin "baserom.gba", 0x6B76B8, 0x3C

gSong_86B76F4:: @ 0x86B76F4
	.incbin "baserom.gba", 0x6B76F4, 0x94

gSong_86B7788:: @ 0x86B7788
	.incbin "baserom.gba", 0x6B7788, 0x6C

gSong_86B77F4:: @ 0x86B77F4
	.incbin "baserom.gba", 0x6B77F4, 0x48

gSong_86B783C:: @ 0x86B783C
	.incbin "baserom.gba", 0x6B783C, 0xC4

gSong_86B7900:: @ 0x86B7900
	.incbin "baserom.gba", 0x6B7900, 0x54

gSong_86B7954:: @ 0x86B7954
	.incbin "baserom.gba", 0x6B7954, 0x80

gSong_86B79D4:: @ 0x86B79D4
	.incbin "baserom.gba", 0x6B79D4, 0x38

gSong_86B7A0C:: @ 0x86B7A0C
	.incbin "baserom.gba", 0x6B7A0C, 0x34

gSong_86B7A40:: @ 0x86B7A40
	.incbin "baserom.gba", 0x6B7A40, 0x40

gSong_86B7A80:: @ 0x86B7A80
	.incbin "baserom.gba", 0x6B7A80, 0x78

gSong_86B7AF8:: @ 0x86B7AF8
	.incbin "baserom.gba", 0x6B7AF8, 0x80

gSong_86B7B78:: @ 0x86B7B78
	.incbin "baserom.gba", 0x6B7B78, 0x58

gSong_86B7BD0:: @ 0x86B7BD0
	.incbin "baserom.gba", 0x6B7BD0, 0xA4

gSong_86B7C74:: @ 0x86B7C74
	.incbin "baserom.gba", 0x6B7C74, 0x4C

gSong_86B7CC0:: @ 0x86B7CC0
	.incbin "baserom.gba", 0x6B7CC0, 0x7C

gSong_86B7D3C:: @ 0x86B7D3C
	.incbin "baserom.gba", 0x6B7D3C, 0x4C

gSong_86B7D88:: @ 0x86B7D88
	.incbin "baserom.gba", 0x6B7D88, 0x34

gSong_86B7DBC:: @ 0x86B7DBC
	.incbin "baserom.gba", 0x6B7DBC, 0x4C

gSong_86B7E08:: @ 0x86B7E08
	.incbin "baserom.gba", 0x6B7E08, 0x60

gSong_86B7E68:: @ 0x86B7E68
	.incbin "baserom.gba", 0x6B7E68, 0x4C

gSong_86B7EB4:: @ 0x86B7EB4
	.incbin "baserom.gba", 0x6B7EB4, 0x84

gSong_86B7F38:: @ 0x86B7F38
	.incbin "baserom.gba", 0x6B7F38, 0x54

gSong_86B7F8C:: @ 0x86B7F8C
	.incbin "baserom.gba", 0x6B7F8C, 0xCC

gSong_86B8058:: @ 0x86B8058
	.incbin "baserom.gba", 0x6B8058, 0xA0

gSong_86B80F8:: @ 0x86B80F8
	.incbin "baserom.gba", 0x6B80F8, 0x3C

gSong_86B8134:: @ 0x86B8134
	.incbin "baserom.gba", 0x6B8134, 0x4C

gSong_86B8180:: @ 0x86B8180
	.incbin "baserom.gba", 0x6B8180, 0x84

gSong_86B8204:: @ 0x86B8204
	.incbin "baserom.gba", 0x6B8204, 0x70

gSong_86B8274:: @ 0x86B8274
	.incbin "baserom.gba", 0x6B8274, 0xD4

gSong_86B8348:: @ 0x86B8348
	.incbin "baserom.gba", 0x6B8348, 0xA4

gSong_86B83EC:: @ 0x86B83EC
	.incbin "baserom.gba", 0x6B83EC, 0x70

gSong_86B845C:: @ 0x86B845C
	.incbin "baserom.gba", 0x6B845C, 0x74

gSong_86B84D0:: @ 0x86B84D0
	.incbin "baserom.gba", 0x6B84D0, 0xE0

gSong_86B85B0:: @ 0x86B85B0
	.incbin "baserom.gba", 0x6B85B0, 0x3C

gSong_86B85EC:: @ 0x86B85EC
	.incbin "baserom.gba", 0x6B85EC, 0x68

gSong_86B8654:: @ 0x86B8654
	.incbin "baserom.gba", 0x6B8654, 0x7C

gSong_86B86D0:: @ 0x86B86D0
	.incbin "baserom.gba", 0x6B86D0, 0x4C

gSong_86B871C:: @ 0x86B871C
	.incbin "baserom.gba", 0x6B871C, 0x48

gSong_86B8764:: @ 0x86B8764
	.incbin "baserom.gba", 0x6B8764, 0x68

gSong_86B87CC:: @ 0x86B87CC
	.incbin "baserom.gba", 0x6B87CC, 0x9C

gSong_86B8868:: @ 0x86B8868
	.incbin "baserom.gba", 0x6B8868, 0x164

gSong_86B89CC:: @ 0x86B89CC
	.incbin "baserom.gba", 0x6B89CC, 0x68

gSong_86B8A34:: @ 0x86B8A34
	.incbin "baserom.gba", 0x6B8A34, 0x44

gSong_86B8A78:: @ 0x86B8A78
	.incbin "baserom.gba", 0x6B8A78, 0x7C

gSong_86B8AF4:: @ 0x86B8AF4
	.incbin "baserom.gba", 0x6B8AF4, 0x6C

gSong_86B8B60:: @ 0x86B8B60
	.incbin "baserom.gba", 0x6B8B60, 0x80

gSong_86B8BE0:: @ 0x86B8BE0
	.incbin "baserom.gba", 0x6B8BE0, 0x80

gSong_86B8C60:: @ 0x86B8C60
	.incbin "baserom.gba", 0x6B8C60, 0x9C

gSong_86B8CFC:: @ 0x86B8CFC
	.incbin "baserom.gba", 0x6B8CFC, 0x4C

gSong_86B8D48:: @ 0x86B8D48
	.incbin "baserom.gba", 0x6B8D48, 0x40

gSong_86B8D88:: @ 0x86B8D88
	.incbin "baserom.gba", 0x6B8D88, 0x78

gSong_86B8E00:: @ 0x86B8E00
	.incbin "baserom.gba", 0x6B8E00, 0x3C

gSong_86B8E3C:: @ 0x86B8E3C
	.incbin "baserom.gba", 0x6B8E3C, 0x58

gSong_86B8E94:: @ 0x86B8E94
	.incbin "baserom.gba", 0x6B8E94, 0xC8

gSong_86B8F5C:: @ 0x86B8F5C
	.incbin "baserom.gba", 0x6B8F5C, 0xF4

gSong_86B9050:: @ 0x86B9050
	.incbin "baserom.gba", 0x6B9050, 0x110

gSong_86B9160:: @ 0x86B9160
	.incbin "baserom.gba", 0x6B9160, 0x88

gSong_86B91E8:: @ 0x86B91E8
	.incbin "baserom.gba", 0x6B91E8, 0x48

gSong_86B9230:: @ 0x86B9230
	.incbin "baserom.gba", 0x6B9230, 0x60

gSong_86B9290:: @ 0x86B9290
	.incbin "baserom.gba", 0x6B9290, 0x4C

gSong_86B92DC:: @ 0x86B92DC
	.incbin "baserom.gba", 0x6B92DC, 0x88

gSong_86B9364:: @ 0x86B9364
	.incbin "baserom.gba", 0x6B9364, 0xBC

gSong_86B9420:: @ 0x86B9420
	.incbin "baserom.gba", 0x6B9420, 0x58

gSong_86B9478:: @ 0x86B9478
	.incbin "baserom.gba", 0x6B9478, 0x7C

gSong_86B94F4:: @ 0x86B94F4
	.incbin "baserom.gba", 0x6B94F4, 0xC8

gSong_86B95BC:: @ 0x86B95BC
	.incbin "baserom.gba", 0x6B95BC, 0xBC

gSong_86B9678:: @ 0x86B9678
	.incbin "baserom.gba", 0x6B9678, 0xEC

gSong_86B9764:: @ 0x86B9764
	.incbin "baserom.gba", 0x6B9764, 0x40

gSong_86B97A4:: @ 0x86B97A4
	.incbin "baserom.gba", 0x6B97A4, 0x5C

gSong_86B9800:: @ 0x86B9800
	.incbin "baserom.gba", 0x6B9800, 0x38

gSong_86B9838:: @ 0x86B9838
	.incbin "baserom.gba", 0x6B9838, 0xB4

gSong_86B98EC:: @ 0x86B98EC
	.incbin "baserom.gba", 0x6B98EC, 0xA0

gSong_86B998C:: @ 0x86B998C
	.incbin "baserom.gba", 0x6B998C, 0x68

gSong_86B99F4:: @ 0x86B99F4
	.incbin "baserom.gba", 0x6B99F4, 0x124

gSong_86B9B18:: @ 0x86B9B18
	.incbin "baserom.gba", 0x6B9B18, 0x7C

gSong_86B9B94:: @ 0x86B9B94
	.incbin "baserom.gba", 0x6B9B94, 0x5C

gSong_86B9BF0:: @ 0x86B9BF0
	.incbin "baserom.gba", 0x6B9BF0, 0x38

gSong_86B9C28:: @ 0x86B9C28
	.incbin "baserom.gba", 0x6B9C28, 0x50

gSong_86B9C78:: @ 0x86B9C78
	.incbin "baserom.gba", 0x6B9C78, 0x8C

gSong_86B9D04:: @ 0x86B9D04
	.incbin "baserom.gba", 0x6B9D04, 0x64

gSong_86B9D68:: @ 0x86B9D68
	.incbin "baserom.gba", 0x6B9D68, 0x78

gSong_86B9DE0:: @ 0x86B9DE0
	.incbin "baserom.gba", 0x6B9DE0, 0x68

gSong_86B9E48:: @ 0x86B9E48
	.incbin "baserom.gba", 0x6B9E48, 0x154

gSong_86B9F9C:: @ 0x86B9F9C
	.incbin "baserom.gba", 0x6B9F9C, 0xD4

gSong_86BA070:: @ 0x86BA070
	.incbin "baserom.gba", 0x6BA070, 0x110

gSong_86BA180:: @ 0x86BA180
	.incbin "baserom.gba", 0x6BA180, 0xE4

gSong_86BA264:: @ 0x86BA264
	.incbin "baserom.gba", 0x6BA264, 0xE0

gSong_86BA344:: @ 0x86BA344
	.incbin "baserom.gba", 0x6BA344, 0x4C

gSong_86BA390:: @ 0x86BA390
	.incbin "baserom.gba", 0x6BA390, 0x8C

gSong_86BA41C:: @ 0x86BA41C
	.incbin "baserom.gba", 0x6BA41C, 0x190

gSong_86BA5AC:: @ 0x86BA5AC
	.incbin "baserom.gba", 0x6BA5AC, 0x1A0

gSong_86BA74C:: @ 0x86BA74C
	.incbin "baserom.gba", 0x6BA74C, 0x70

gSong_86BA7BC:: @ 0x86BA7BC
	.incbin "baserom.gba", 0x6BA7BC, 0x50

gSong_86BA80C:: @ 0x86BA80C
	.incbin "baserom.gba", 0x6BA80C, 0x124

gSong_86BA930:: @ 0x86BA930
	.incbin "baserom.gba", 0x6BA930, 0x80

gSong_86BA9B0:: @ 0x86BA9B0
	.incbin "baserom.gba", 0x6BA9B0, 0xF0

gSong_86BAAA0:: @ 0x86BAAA0
	.incbin "baserom.gba", 0x6BAAA0, 0x64

gSong_86BAB04:: @ 0x86BAB04
	.incbin "baserom.gba", 0x6BAB04, 0x5C

gSong_86BAB60:: @ 0x86BAB60
	.incbin "baserom.gba", 0x6BAB60, 0xB4

gSong_86BAC14:: @ 0x86BAC14
	.incbin "baserom.gba", 0x6BAC14, 0x1FC

gSong_86BAE10:: @ 0x86BAE10
	.incbin "baserom.gba", 0x6BAE10, 0x120

gSong_86BAF30:: @ 0x86BAF30
	.incbin "baserom.gba", 0x6BAF30, 0x170

gSong_86BB0A0:: @ 0x86BB0A0
	.incbin "baserom.gba", 0x6BB0A0, 0x70

gSong_86BB110:: @ 0x86BB110
	.incbin "baserom.gba", 0x6BB110, 0x98

gSong_86BB1A8:: @ 0x86BB1A8
	.incbin "baserom.gba", 0x6BB1A8, 0x38

gSong_86BB1E0:: @ 0x86BB1E0
	.incbin "baserom.gba", 0x6BB1E0, 0xD8

gSong_86BB2B8:: @ 0x86BB2B8
	.incbin "baserom.gba", 0x6BB2B8, 0xD8

gSong_86BB390:: @ 0x86BB390
	.incbin "baserom.gba", 0x6BB390, 0xAC

gSong_86BB43C:: @ 0x86BB43C
	.incbin "baserom.gba", 0x6BB43C, 0x98

gSong_86BB4D4:: @ 0x86BB4D4
	.incbin "baserom.gba", 0x6BB4D4, 0x98

gSong_86BB56C:: @ 0x86BB56C
	.incbin "baserom.gba", 0x6BB56C, 0xA8

gSong_86BB614:: @ 0x86BB614
	.incbin "baserom.gba", 0x6BB614, 0x4C

gSong_86BB660:: @ 0x86BB660
	.incbin "baserom.gba", 0x6BB660, 0xFC

gSong_86BB75C:: @ 0x86BB75C
	.incbin "baserom.gba", 0x6BB75C, 0x94

gSong_86BB7F0:: @ 0x86BB7F0
	.incbin "baserom.gba", 0x6BB7F0, 0x64

gSong_86BB854:: @ 0x86BB854
	.incbin "baserom.gba", 0x6BB854, 0x9C

gSong_86BB8F0:: @ 0x86BB8F0
	.incbin "baserom.gba", 0x6BB8F0, 0x208

gSong_86BBAF8:: @ 0x86BBAF8
	.incbin "baserom.gba", 0x6BBAF8, 0xFC

gSong_86BBBF4:: @ 0x86BBBF4
	.incbin "baserom.gba", 0x6BBBF4, 0xF0

gSong_86BBCE4:: @ 0x86BBCE4
	.incbin "baserom.gba", 0x6BBCE4, 0x84

gSong_86BBD68:: @ 0x86BBD68
	.incbin "baserom.gba", 0x6BBD68, 0x74

gSong_86BBDDC:: @ 0x86BBDDC
	.incbin "baserom.gba", 0x6BBDDC, 0x180

gSong_86BBF5C:: @ 0x86BBF5C
	.incbin "baserom.gba", 0x6BBF5C, 0x104

gSong_86BC060:: @ 0x86BC060
	.incbin "baserom.gba", 0x6BC060, 0x60

gSong_86BC0C0:: @ 0x86BC0C0
	.incbin "baserom.gba", 0x6BC0C0, 0x70

gSong_86BC130:: @ 0x86BC130
	.incbin "baserom.gba", 0x6BC130, 0x11C

gSong_86BC24C:: @ 0x86BC24C
	.incbin "baserom.gba", 0x6BC24C, 0xA4

gSong_86BC2F0:: @ 0x86BC2F0
	.incbin "baserom.gba", 0x6BC2F0, 0x170

gSong_86BC460:: @ 0x86BC460
	.incbin "baserom.gba", 0x6BC460, 0x134

gSong_86BC594:: @ 0x86BC594
	.incbin "baserom.gba", 0x6BC594, 0x84

gSong_86BC618:: @ 0x86BC618
	.incbin "baserom.gba", 0x6BC618, 0x58

gSong_86BC670:: @ 0x86BC670
	.incbin "baserom.gba", 0x6BC670, 0x30

gSong_86BC6A0:: @ 0x86BC6A0
	.incbin "baserom.gba", 0x6BC6A0, 0x38

gSong_86BC6D8:: @ 0x86BC6D8
	.incbin "baserom.gba", 0x6BC6D8, 0x8C

gSong_86BC764:: @ 0x86BC764
	.incbin "baserom.gba", 0x6BC764, 0x38

gSong_86BC79C:: @ 0x86BC79C
	.incbin "baserom.gba", 0x6BC79C, 0x44

gSong_86BC7E0:: @ 0x86BC7E0
	.incbin "baserom.gba", 0x6BC7E0, 0x40

gSong_86BC820:: @ 0x86BC820
	.incbin "baserom.gba", 0x6BC820, 0x28

gSong_86BC848:: @ 0x86BC848
	.incbin "baserom.gba", 0x6BC848, 0xB8

gSong_86BC900:: @ 0x86BC900
	.incbin "baserom.gba", 0x6BC900, 0x74

gSong_86BC974:: @ 0x86BC974
	.incbin "baserom.gba", 0x6BC974, 0x6C

gSong_86BC9E0:: @ 0x86BC9E0
	.incbin "baserom.gba", 0x6BC9E0, 0x48

gSong_86BCA28:: @ 0x86BCA28
	.incbin "baserom.gba", 0x6BCA28, 0xE0

gSong_86BCB08:: @ 0x86BCB08
	.incbin "baserom.gba", 0x6BCB08, 0xC0

gSong_86BCBC8:: @ 0x86BCBC8
	.incbin "baserom.gba", 0x6BCBC8, 0x34

gSong_86BCBFC:: @ 0x86BCBFC
	.incbin "baserom.gba", 0x6BCBFC, 0xBC

gSong_86BCCB8:: @ 0x86BCCB8
	.incbin "baserom.gba", 0x6BCCB8, 0xE0

gSong_86BCD98:: @ 0x86BCD98
	.incbin "baserom.gba", 0x6BCD98, 0x14C

gSong_86BCEE4:: @ 0x86BCEE4
	.incbin "baserom.gba", 0x6BCEE4, 0x19C

gSong_86BD080:: @ 0x86BD080
	.incbin "baserom.gba", 0x6BD080, 0x2D8

gSong_86BD358:: @ 0x86BD358
	.incbin "baserom.gba", 0x6BD358, 0x18C

gSong_86BD4E4:: @ 0x86BD4E4
	.incbin "baserom.gba", 0x6BD4E4, 0xD8

gSong_86BD5BC:: @ 0x86BD5BC
	.incbin "baserom.gba", 0x6BD5BC, 0x6C

gSong_86BD628:: @ 0x86BD628
	.incbin "baserom.gba", 0x6BD628, 0x570

gSong_86BDB98:: @ 0x86BDB98
	.incbin "baserom.gba", 0x6BDB98, 0xE2C

gSong_86BE9C4:: @ 0x86BE9C4
	.incbin "baserom.gba", 0x6BE9C4, 0x10A4

gSong_86BFA68:: @ 0x86BFA68
	.incbin "baserom.gba", 0x6BFA68, 0x358

gSong_86BFDC0:: @ 0x86BFDC0
	.incbin "baserom.gba", 0x6BFDC0, 0x220

gSong_86BFFE0:: @ 0x86BFFE0
	.incbin "baserom.gba", 0x6BFFE0, 0x140

gSong_86C0120:: @ 0x86C0120
	.incbin "baserom.gba", 0x6C0120, 0xE4

gSong_86C0204:: @ 0x86C0204
	.incbin "baserom.gba", 0x6C0204, 0xF8

gSong_86C02FC:: @ 0x86C02FC
	.incbin "baserom.gba", 0x6C02FC, 0x4E8

gSong_86C07E4:: @ 0x86C07E4
	.incbin "baserom.gba", 0x6C07E4, 0xF3C

gSong_86C1720:: @ 0x86C1720
	.incbin "baserom.gba", 0x6C1720, 0x1C24

gSong_86C3344:: @ 0x86C3344
	.incbin "baserom.gba", 0x6C3344, 0xA0C

gSong_86C3D50:: @ 0x86C3D50
	.incbin "baserom.gba", 0x6C3D50, 0x298

gSong_86C3FE8:: @ 0x86C3FE8
	.incbin "baserom.gba", 0x6C3FE8, 0xB00

gSong_86C4AE8:: @ 0x86C4AE8
	.incbin "baserom.gba", 0x6C4AE8, 0x1074

gSong_86C5B5C:: @ 0x86C5B5C
	.incbin "baserom.gba", 0x6C5B5C, 0xED4

gSong_86C6A30:: @ 0x86C6A30
	.incbin "baserom.gba", 0x6C6A30, 0xD2C

gSong_86C775C:: @ 0x86C775C
	.incbin "baserom.gba", 0x6C775C, 0x54

gSong_86C77B0:: @ 0x86C77B0
	.incbin "baserom.gba", 0x6C77B0, 0xC14

gSong_86C83C4:: @ 0x86C83C4
	.incbin "baserom.gba", 0x6C83C4, 0x3C0

gSong_86C8784:: @ 0x86C8784
	.incbin "baserom.gba", 0x6C8784, 0x3B8

gSong_86C8B3C:: @ 0x86C8B3C
	.incbin "baserom.gba", 0x6C8B3C, 0x4A8

gSong_86C8FE4:: @ 0x86C8FE4
	.incbin "baserom.gba", 0x6C8FE4, 0xABC

gSong_86C9AA0:: @ 0x86C9AA0
	.incbin "baserom.gba", 0x6C9AA0, 0x1218

gSong_86CACB8:: @ 0x86CACB8
	.incbin "baserom.gba", 0x6CACB8, 0x1450

gSong_86CC108:: @ 0x86CC108
	.incbin "baserom.gba", 0x6CC108, 0x123C

gSong_86CD344:: @ 0x86CD344
	.incbin "baserom.gba", 0x6CD344, 0x4010

gSong_86D1354:: @ 0x86D1354
	.incbin "baserom.gba", 0x6D1354, 0xA88

gSong_86D1DDC:: @ 0x86D1DDC
	.incbin "baserom.gba", 0x6D1DDC, 0x870

gSong_86D264C:: @ 0x86D264C
	.incbin "baserom.gba", 0x6D264C, 0xF3C

gSong_86D3588:: @ 0x86D3588
	.incbin "baserom.gba", 0x6D3588, 0xD74

gSong_86D42FC:: @ 0x86D42FC
	.incbin "baserom.gba", 0x6D42FC, 0xD40

gSong_86D503C:: @ 0x86D503C
	.incbin "baserom.gba", 0x6D503C, 0x1AE4

gSong_86D6B20:: @ 0x86D6B20
	.incbin "baserom.gba", 0x6D6B20, 0x2B74

gSong_86D9694:: @ 0x86D9694
	.incbin "baserom.gba", 0x6D9694, 0x117C

gSong_86DA810:: @ 0x86DA810
	.incbin "baserom.gba", 0x6DA810, 0x27D0

gSong_86DCFE0:: @ 0x86DCFE0
	.incbin "baserom.gba", 0x6DCFE0, 0x864

gSong_86DD844:: @ 0x86DD844
	.incbin "baserom.gba", 0x6DD844, 0x79C

gSong_86DDFE0:: @ 0x86DDFE0
	.incbin "baserom.gba", 0x6DDFE0, 0x98C

gSong_86DE96C:: @ 0x86DE96C
	.incbin "baserom.gba", 0x6DE96C, 0xA60

gSong_86DF3CC:: @ 0x86DF3CC
	.incbin "baserom.gba", 0x6DF3CC, 0x12A4

gSong_86E0670:: @ 0x86E0670
	.incbin "baserom.gba", 0x6E0670, 0x978

gSong_86E0FE8:: @ 0x86E0FE8
	.incbin "baserom.gba", 0x6E0FE8, 0x8CC

gSong_86E18B4:: @ 0x86E18B4
	.incbin "baserom.gba", 0x6E18B4, 0x16F4

gSong_86E2FA8:: @ 0x86E2FA8
	.incbin "baserom.gba", 0x6E2FA8, 0xA3C

gSong_86E39E4:: @ 0x86E39E4
	.incbin "baserom.gba", 0x6E39E4, 0xB80

gSong_86E4564:: @ 0x86E4564
	.incbin "baserom.gba", 0x6E4564, 0x1180

gSong_86E56E4:: @ 0x86E56E4
	.incbin "baserom.gba", 0x6E56E4, 0x538

gSong_86E5C1C:: @ 0x86E5C1C
	.incbin "baserom.gba", 0x6E5C1C, 0xEF0

gSong_86E6B0C:: @ 0x86E6B0C
	.incbin "baserom.gba", 0x6E6B0C, 0xE14

gSong_86E7920:: @ 0x86E7920
	.incbin "baserom.gba", 0x6E7920, 0xEF0

gSong_86E8810:: @ 0x86E8810
	.incbin "baserom.gba", 0x6E8810, 0x83C

gSong_86E904C:: @ 0x86E904C
	.incbin "baserom.gba", 0x6E904C, 0x7D4

gSong_86E9820:: @ 0x86E9820
	.incbin "baserom.gba", 0x6E9820, 0x200

gSong_86E9A20:: @ 0x86E9A20
	.incbin "baserom.gba", 0x6E9A20, 0x200

gSong_86E9C20:: @ 0x86E9C20
	.incbin "baserom.gba", 0x6E9C20, 0x370

gSong_86E9F90:: @ 0x86E9F90
	.incbin "baserom.gba", 0x6E9F90, 0x170

gSong_86EA100:: @ 0x86EA100
	.incbin "baserom.gba", 0x6EA100, 0x904

gSong_86EAA04:: @ 0x86EAA04
	.incbin "baserom.gba", 0x6EAA04, 0x438

gSong_86EAE3C:: @ 0x86EAE3C
	.incbin "baserom.gba", 0x6EAE3C, 0x8C

gSong_86EAEC8:: @ 0x86EAEC8
	.incbin "baserom.gba", 0x6EAEC8, 0x1D0

gSong_86EB098:: @ 0x86EB098
	.incbin "baserom.gba", 0x6EB098, 0xBC

gSong_86EB154:: @ 0x86EB154
	.incbin "baserom.gba", 0x6EB154, 0xF74

gSong_86EC0C8:: @ 0x86EC0C8
	.incbin "baserom.gba", 0x6EC0C8, 0xF7C

gSong_86ED044:: @ 0x86ED044
	.incbin "baserom.gba", 0x6ED044, 0xA5C

gSong_86EDAA0:: @ 0x86EDAA0
	.incbin "baserom.gba", 0x6EDAA0, 0x480

gSong_86EDF20:: @ 0x86EDF20
	.incbin "baserom.gba", 0x6EDF20, 0xF2C

gSong_86EEE4C:: @ 0x86EEE4C
	.incbin "baserom.gba", 0x6EEE4C, 0x1404

gSong_86F0250:: @ 0x86F0250
	.incbin "baserom.gba", 0x6F0250, 0x4F0

gSong_86F0740:: @ 0x86F0740
	.incbin "baserom.gba", 0x6F0740, 0xEC0

gSong_86F1600:: @ 0x86F1600
	.incbin "baserom.gba", 0x6F1600, 0x121C

gSong_86F281C:: @ 0x86F281C
	.incbin "baserom.gba", 0x6F281C, 0xEF4

gSong_86F3710:: @ 0x86F3710
	.incbin "baserom.gba", 0x6F3710, 0x1028

gSong_86F4738:: @ 0x86F4738
	.incbin "baserom.gba", 0x6F4738, 0xF30

gSong_86F5668:: @ 0x86F5668
	.incbin "baserom.gba", 0x6F5668, 0x1C4

gSong_86F582C:: @ 0x86F582C
	.incbin "baserom.gba", 0x6F582C, 0x2188

gSong_86F79B4:: @ 0x86F79B4
	.incbin "baserom.gba", 0x6F79B4, 0x1178

gSong_86F8B2C:: @ 0x86F8B2C
	.incbin "baserom.gba", 0x6F8B2C, 0x12B8

gSong_86F9DE4:: @ 0x86F9DE4
	.incbin "baserom.gba", 0x6F9DE4, 0x444

gSong_86FA228:: @ 0x86FA228
	.incbin "baserom.gba", 0x6FA228, 0x948

gSong_86FAB70:: @ 0x86FAB70
	.incbin "baserom.gba", 0x6FAB70, 0xA00

gSong_86FB570:: @ 0x86FB570
	.incbin "baserom.gba", 0x6FB570, 0x840

gSong_86FBDB0:: @ 0x86FBDB0
	.incbin "baserom.gba", 0x6FBDB0, 0xDC

gSong_86FBE8C:: @ 0x86FBE8C
	.incbin "baserom.gba", 0x6FBE8C, 0x18
