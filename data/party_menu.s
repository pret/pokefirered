#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gMoveTutorMoves:: @ 8459B60
	.2byte MOVE_MEGA_PUNCH
	.2byte MOVE_SWORDS_DANCE
	.2byte MOVE_MEGA_KICK
	.2byte MOVE_BODY_SLAM
	.2byte MOVE_DOUBLE_EDGE
	.2byte MOVE_COUNTER
	.2byte MOVE_SEISMIC_TOSS
	.2byte MOVE_MIMIC
	.2byte MOVE_METRONOME
	.2byte MOVE_SOFT_BOILED
	.2byte MOVE_DREAM_EATER
	.2byte MOVE_THUNDER_WAVE
	.2byte MOVE_EXPLOSION
	.2byte MOVE_ROCK_SLIDE
	.2byte MOVE_SUBSTITUTE

gMoveTutorMoveCompatibilityTable:: @ 8459B7E
	.2byte 0x0000
	.2byte 0x409a
	.2byte 0x409a
	.2byte 0x409a
	.2byte 0x60ff
	.2byte 0x60ff
	.2byte 0x60ff
	.2byte 0x40fd
	.2byte 0x40fd
	.2byte 0x40fd
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x4490
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x4092
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x48b8
	.2byte 0x48b8
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x48fd
	.2byte 0x48fd
	.2byte 0x60fa
	.2byte 0x60fa
	.2byte 0x40b8
	.2byte 0x40b8
	.2byte 0x60fd
	.2byte 0x40b8
	.2byte 0x40b8
	.2byte 0x60fd
	.2byte 0x4ffd
	.2byte 0x4ffd
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4cfd
	.2byte 0x4cfd
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4092
	.2byte 0x4092
	.2byte 0x409a
	.2byte 0x40ba
	.2byte 0x40ba
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x4498
	.2byte 0x4498
	.2byte 0x40fd
	.2byte 0x40fd
	.2byte 0x61fd
	.2byte 0x61fd
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x41fd
	.2byte 0x41fd
	.2byte 0x4dfd
	.2byte 0x4dfd
	.2byte 0x4dfd
	.2byte 0x61fd
	.2byte 0x61fd
	.2byte 0x61fd
	.2byte 0x4092
	.2byte 0x4092
	.2byte 0x409a
	.2byte 0x4092
	.2byte 0x4092
	.2byte 0x71f9
	.2byte 0x71f9
	.2byte 0x71fd
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4c98
	.2byte 0x4cfd
	.2byte 0x4890
	.2byte 0x4890
	.2byte 0x409a
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x5088
	.2byte 0x5088
	.2byte 0x5090
	.2byte 0x5090
	.2byte 0x5480
	.2byte 0x5480
	.2byte 0x55fd
	.2byte 0x7098
	.2byte 0x4dfd
	.2byte 0x4dfd
	.2byte 0x409a
	.2byte 0x409a
	.2byte 0x5880
	.2byte 0x5880
	.2byte 0x5490
	.2byte 0x5490
	.2byte 0x60ff
	.2byte 0x60ff
	.2byte 0x61fd
	.2byte 0x61fd
	.2byte 0x64ff
	.2byte 0x5080
	.2byte 0x5080
	.2byte 0x60ba
	.2byte 0x60ff
	.2byte 0x4ffd
	.2byte 0x409a
	.2byte 0x60fd
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4890
	.2byte 0x4c90
	.2byte 0x4dfd
	.2byte 0x40b2
	.2byte 0x45fd
	.2byte 0x48fd
	.2byte 0x40fd
	.2byte 0x60da
	.2byte 0x4098
	.2byte 0x0000
	.2byte 0x4898
	.2byte 0x4498
	.2byte 0x0000
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4898
	.2byte 0x4098
	.2byte 0x4c90
	.2byte 0x6098
	.2byte 0x60d8
	.2byte 0x6098
	.2byte 0x60de
	.2byte 0x6090
	.2byte 0x61fd
	.2byte 0x4090
	.2byte 0x4890
	.2byte 0x4090
	.2byte 0x4898
	.2byte 0x4898
	.2byte 0x4898
	.2byte 0x4dfd
	.2byte 0x7fff
	.2byte 0x40ba
	.2byte 0x40ba
	.2byte 0x40ba
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x60fd
	.2byte 0x60ff
	.2byte 0x60ff
	.2byte 0x60ff
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4490
	.2byte 0x4490
	.2byte 0x4093
	.2byte 0x4093
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4090
	.2byte 0x4890
	.2byte 0x4890
	.2byte 0x48fd
	.2byte 0x4ffd
	.2byte 0x4cfd
	.2byte 0x4ffd
	.2byte 0x4ffd
	.2byte 0x4c90
	.2byte 0x4c90
	.2byte 0x4898
	.2byte 0x48fd
	.2byte 0x48fd
	.2byte 0x4092
	.2byte 0x40dd
	.2byte 0x40dd
	.2byte 0x70fd
	.2byte 0x41fd
	.2byte 0x4092
	.2byte 0x4092
	.2byte 0x4092
	.2byte 0x4dfd
	.2byte 0x4092
	.2byte 0x4092
	.2byte 0x4490
	.2byte 0x4098
	.2byte 0x40fd
	.2byte 0x4498
	.2byte 0x4498
	.2byte 0x4c90
	.2byte 0x4cfd
	.2byte 0x4c90
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x4c98
	.2byte 0x70b8
	.2byte 0x70b8
	.2byte 0x6cb8
	.2byte 0x64b2
	.2byte 0x7098
	.2byte 0x49fd
	.2byte 0x69fd
	.2byte 0x4892
	.2byte 0x40b2
	.2byte 0x6098
	.2byte 0x60fa
	.2byte 0x44b2
	.2byte 0x41ff
	.2byte 0x61ff
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x7098
	.2byte 0x4890
	.2byte 0x48d0
	.2byte 0x40fd
	.2byte 0x4098
	.2byte 0x60b0
	.2byte 0x44b8
	.2byte 0x44b8
	.2byte 0x4098
	.2byte 0x40b8
	.2byte 0x60b8
	.2byte 0x4c90
	.2byte 0x4c98
	.2byte 0x0000
	.2byte 0x60fc
	.2byte 0x60fc
	.2byte 0x45fd
	.2byte 0x48fd
	.2byte 0x40fd
	.2byte 0x69fd
	.2byte 0x4ffd
	.2byte 0x4898
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x68fd
	.2byte 0x4c98
	.2byte 0x4c90
	.2byte 0x4592
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x40ff
	.2byte 0x40ff
	.2byte 0x40ff
	.2byte 0x60ff
	.2byte 0x60ff
	.2byte 0x60ff
	.2byte 0x4098
	.2byte 0x60fd
	.2byte 0x60fd
	.2byte 0x40b8
	.2byte 0x40b8
	.2byte 0x4898
	.2byte 0x4898
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x4090
	.2byte 0x0000
	.2byte 0x4090
	.2byte 0x409a
	.2byte 0x409a
	.2byte 0x41ff
	.2byte 0x509a
	.2byte 0x509e
	.2byte 0x509e
	.2byte 0x4090
	.2byte 0x4092
	.2byte 0x4490
	.2byte 0x40b0
	.2byte 0x40b0
	.2byte 0x409a
	.2byte 0x40ff
	.2byte 0x65fd
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4c98
	.2byte 0x4c98
	.2byte 0x69fd
	.2byte 0x7490
	.2byte 0x7490
	.2byte 0x7898
	.2byte 0x7098
	.2byte 0x45fd
	.2byte 0x4090
	.2byte 0x6090
	.2byte 0x4090
	.2byte 0x40ba
	.2byte 0x40ba
	.2byte 0x4090
	.2byte 0x4098
	.2byte 0x4090
	.2byte 0x4090
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x61fd
	.2byte 0x61fd
	.2byte 0x4898
	.2byte 0x4898
	.2byte 0x6098
	.2byte 0x7098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x40fb
	.2byte 0x40ff
	.2byte 0x4098
	.2byte 0x5098
	.2byte 0x7498
	.2byte 0x7498
	.2byte 0x4098
	.2byte 0x4498
	.2byte 0x44fd
	.2byte 0x49fd
	.2byte 0x49fd
	.2byte 0x60ff
	.2byte 0x45fd
	.2byte 0x65fd
	.2byte 0x4498
	.2byte 0x4498
	.2byte 0x0000
	.2byte 0x4498
	.2byte 0x65fd
	.2byte 0x409a
	.2byte 0x60fd
	.2byte 0x60fd
	.2byte 0x60fd
	.2byte 0x54b8
	.2byte 0x54b8
	.2byte 0x409a
	.2byte 0x40fd
	.2byte 0x60fd
	.2byte 0x60fd
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x4098
	.2byte 0x6cba
	.2byte 0x4c98
	.2byte 0x4d98
	.2byte 0x4098
	.2byte 0x68ff
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x68fd
	.2byte 0x4898
	.2byte 0x49fd
	.2byte 0x49fd
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x609a
	.2byte 0x60da
	.2byte 0x4c98
	.2byte 0x4c98
	.2byte 0x4c98
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x6098
	.2byte 0x0000
	.2byte 0x7098
	.2byte 0x7098
	.2byte 0x78fd
	.2byte 0x78fd
	.2byte 0x78fd
	.2byte 0x6898
	.2byte 0x68ff
	.2byte 0x6898
	.2byte 0x4c98
	.2byte 0x4c98
	.2byte 0x4d98
	.2byte 0x6cfd
	.2byte 0x4490

	.align 2
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
	.4byte gUnknown_841718C @ Not what other player wants
	.4byte gUnknown_84171CC @ Not an egg
	.4byte gUnknown_84170BC @ Mon can't be traded
	.4byte gUnknown_84170BC @ Mon can't be traded
	.4byte gUnknown_84170FC @ Other trainer's mon can't be traded
	.4byte gUnknown_84170E0 @ Egg can't be traded
	.4byte gUnknown_8417130 @ Other trainer can't accept
	.4byte gUnknown_8417164 @ Can't trade with trainer now
	.4byte gUnknown_8417164 @ Can't trade with trainer now

gUnknown_845A80C:: @ 845A80C
	.incbin "baserom.gba", 0x45A80C, 0x74
