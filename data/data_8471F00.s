#include "constants/species.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/easy_chat.h"
#include "constants/facility_trainer_classes.h"

#define NULL 0

	.include "asm/macros.inc"

	.section .rodata

	.align 2
gUnknown_8471F00::
	.incbin "baserom.gba", 0x471F00, 0x50

gUnknown_8471F50:: @ 8471F50
	.incbin "baserom.gba", 0x471F50, 0x113

gUnknown_8472063:: @ 8472063
	.incbin "baserom.gba", 0x472063, 0x4B

gUnknown_84720AE:: @ 84720AE
	.incbin "baserom.gba", 0x4720AE, 0x4E

gUnknown_84720FC:: @ 84720FC
	.incbin "baserom.gba", 0x4720FC, 0x37

gUnknown_8472133:: @ 8472133
	.incbin "baserom.gba", 0x472133, 0x3409

gUnknown_847553C:: @ 847553C
	.incbin "baserom.gba", 0x47553C, 0xC

gUnknown_8475548:: @ 8475548
	.incbin "baserom.gba", 0x475548, 0x8

gUnknown_8475550:: @ 8475550
	.incbin "baserom.gba", 0x475550, 0x8

gUnknown_8475558:: @ 8475558
	.incbin "baserom.gba", 0x475558, 0x20

gUnknown_8475578:: @ 8475578
	.incbin "baserom.gba", 0x475578, 0x30

gUnknown_84755A8:: @ 84755A8
	.incbin "baserom.gba", 0x4755A8, 0x30

gUnknown_84755D8:: @ 84755D8
	.incbin "baserom.gba", 0x4755D8, 0x8

gUnknown_84755E0:: @ 84755E0
	.incbin "baserom.gba", 0x4755E0, 0x8

gUnknown_84755E8:: @ 84755E8
	.incbin "baserom.gba", 0x4755E8, 0x10

gUnknown_84755F8:: @ 84755F8
	.incbin "baserom.gba", 0x4755F8, 0x4

gUnknown_84755FC:: @ 84755FC
	.incbin "baserom.gba", 0x4755FC, 0x6

gUnknown_8475602:: @ 8475602
	.incbin "baserom.gba", 0x475602, 0x6

gUnknown_8475608:: @ 8475608
	.incbin "baserom.gba", 0x475608, 0x40

gUnknown_8475648:: @ 8475648
	.incbin "baserom.gba", 0x475648, 0x14

gUnknown_847565C:: @ 847565C
	.incbin "baserom.gba", 0x47565C, 0x18

gUnknown_8475674:: @ 8475674
	.incbin "baserom.gba", 0x475674, 0x10

gUnknown_8475684:: @ 8475684
	.incbin "baserom.gba", 0x475684, 0x8

gUnknown_847568C:: @ 847568C
	.incbin "baserom.gba", 0x47568C, 0x10

gUnknown_847569C:: @ 847569C
	.incbin "baserom.gba", 0x47569C, 0x8

gUnknown_84756A4:: @ 84756A4
	.incbin "baserom.gba", 0x4756A4, 0x204

gUnknown_84758A8:: @ 84758A8
	.incbin "baserom.gba", 0x4758A8, 0xC0

gUnknown_8475968:: @ 8475968
	.incbin "baserom.gba", 0x475968, 0x1D4

gUnknown_8475B3C:: @ 8475B3C
	.incbin "baserom.gba", 0x475B3C, 0x890

gUnknown_84763CC:: @ 84763CC
	.incbin "baserom.gba", 0x4763CC, 0xDCC

gUnknown_8477198:: @ 8477198
	.incbin "baserom.gba", 0x477198, 0x94

gUnknown_847722C:: @ 847722C
	.incbin "baserom.gba", 0x47722C, 0x148

gUnknown_8477374:: @ 8477374
	.incbin "baserom.gba", 0x477374, 0x121C

gUnknown_8478590:: @ 8478590
	.incbin "baserom.gba", 0x478590, 0x26C

gUnknown_84787FC:: @ 84787FC
	.incbin "baserom.gba", 0x4787FC, 0x250

gUnknown_8478A4C:: @ 8478A4C
	.incbin "baserom.gba", 0x478A4C, 0x24C

gUnknown_8478C98:: @ 8478C98
	.incbin "baserom.gba", 0x478C98, 0x48

gUnknown_8478CE0:: @ 8478CE0
	.incbin "baserom.gba", 0x478CE0, 0xB0

gUnknown_8478D90:: @ 8478D90
	.incbin "baserom.gba", 0x478D90, 0x8

gUnknown_8478D98:: @ 8478D98
	.incbin "baserom.gba", 0x478D98, 0x8

gUnknown_8478DA0:: @ 8478DA0
	.incbin "baserom.gba", 0x478DA0, 0x8

gUnknown_8478DA8:: @ 8478DA8
	.incbin "baserom.gba", 0x478DA8, 0x24

gUnknown_8478DCC:: @ 8478DCC
	.incbin "baserom.gba", 0x478DCC, 0x8

gUnknown_8478DD4:: @ 8478DD4
	.incbin "baserom.gba", 0x478DD4, 0x8

gUnknown_8478DDC:: @ 8478DDC
	.incbin "baserom.gba", 0x478DDC, 0x18

gUnknown_8478DF4:: @ 8478DF4
	.incbin "baserom.gba", 0x478DF4, 0x18

gUnknown_8478E0C:: @ 8478E0C
	.incbin "baserom.gba", 0x478E0C, 0x2

gUnknown_8478E0E:: @ 8478E0E
	.incbin "baserom.gba", 0x478E0E, 0xA

gUnknown_8478E18:: @ 8478E18
	.incbin "baserom.gba", 0x478E18, 0x8

gUnknown_8478E20:: @ 8478E20
	.incbin "baserom.gba", 0x478E20, 0x18

gUnknown_8478E38:: @ 8478E38
	.incbin "baserom.gba", 0x478E38, 0x3

gUnknown_8478E3B:: @ 8478E3B
	.incbin "baserom.gba", 0x478E3B, 0x45

gUnknown_8478E80:: @ 8478E80
	.incbin "baserom.gba", 0x478E80, 0x14

gUnknown_8478E94:: @ 8478E94
	.incbin "baserom.gba", 0x478E94, 0x14

gUnknown_8478EA8:: @ 8478EA8
	.incbin "baserom.gba", 0x478EA8, 0x8

gUnknown_8478EB0:: @ 8478EB0
	.incbin "baserom.gba", 0x478EB0, 0xA

gUnknown_8478EBA:: @ 8478EBA
	.incbin "baserom.gba", 0x478EBA, 0xA

gUnknown_8478EC4:: @ 8478EC4
	.incbin "baserom.gba", 0x478EC4, 0x50

gUnknown_8478F14:: @ 8478F14
	.incbin "baserom.gba", 0x478F14, 0x8

gUnknown_8478F1C:: @ 8478F1C
	.incbin "baserom.gba", 0x478F1C, 0x144

gUnknown_8479060:: @ 8479060
	.incbin "baserom.gba", 0x479060, 0x78

gUnknown_84790D8:: @ 84790D8
	.incbin "baserom.gba", 0x4790D8, 0xC0

gUnknown_8479198:: @ 8479198
	.incbin "baserom.gba", 0x479198, 0x10

gUnknown_84791A8:: @ 84791A8
	.incbin "baserom.gba", 0x4791A8, 0x10

gUnknown_84791B8:: @ 84791B8
	.incbin "baserom.gba", 0x4791B8, 0x14

gUnknown_84791CC:: @ 84791CC
	.incbin "baserom.gba", 0x4791CC, 0x1C

gUnknown_84791E8:: @ 84791E8
	.incbin "baserom.gba", 0x4791E8, 0xE8

gUnknown_84792D0:: @ 84792D0
	.incbin "baserom.gba", 0x4792D0, 0x10

	.section .rodata.8479668

	.align 2
gUnknown_8479668:: @ 8479668
	.incbin "graphics/misc/unk_8479688.gbapal"

gUnknown_8479688::
	.incbin "graphics/misc/unk_8479688.4bpp.lz"

gUnknown_8479748::
	.incbin "graphics/misc/unk_8479748.4bpp.lz"

	.section .rodata.after_trainer_tower

	// berry_fix_program

gUnknown_847A8D8::
	.string "{CLEAR 11}A{CLEAR 6}B{CLEAR 6}C{CLEAR 26}D{CLEAR 6}E{CLEAR 6}F{CLEAR 26}others$"

gUnknown_847A8FA::
	.string "{CLEAR 11}G{CLEAR 6}H{CLEAR 6}I{CLEAR 26}J{CLEAR 6}K{CLEAR 6}L$"

gUnknown_847A913::
	.string "{CLEAR 11}M{CLEAR 6}N{CLEAR 6}O{CLEAR 26}P{CLEAR 6}Q{CLEAR 6}R{CLEAR 6}S{CLEAR 26} $"

gUnknown_847A934::
	.string "{CLEAR 11}T{CLEAR 6}U{CLEAR 6}V{CLEAR 26}W{CLEAR 6}X{CLEAR 6}Y{CLEAR 6}Z{CLEAR 26} $"
	.string "{CLEAR 11}a{CLEAR 6}b{CLEAR 6}c{CLEAR 26}d{CLEAR 6}e{CLEAR 6}f{CLEAR 6} {CLEAR 26}.$"
	.string "{CLEAR 11}g{CLEAR 6}h{CLEAR 7}i{CLEAR 27}j{CLEAR 6}k{CLEAR 6}l{CLEAR 7} {CLEAR 26},$"
	.string "{CLEAR 11}m{CLEAR 6}n{CLEAR 7}o{CLEAR 26}p{CLEAR 6}q{CLEAR 7}r{CLEAR 6}s{CLEAR 27} $"
	.string "{CLEAR 12}t{CLEAR 6}u{CLEAR 6}v{CLEAR 26}w{CLEAR 6}x{CLEAR 6}y{CLEAR 6}z{CLEAR 26} $"
	.string "{CLEAR 11}A{CLEAR 6}B{CLEAR 6}C{CLEAR 26}D{CLEAR 6}E{CLEAR 6}F{CLEAR 6} {CLEAR 26}.$"
	.string "{CLEAR 11}G{CLEAR 6}H{CLEAR 6}I{CLEAR 26}J{CLEAR 6}K{CLEAR 6}L{CLEAR 6} {CLEAR 26},$"
	.string "{CLEAR 11}M{CLEAR 6}N{CLEAR 6}O{CLEAR 26}P{CLEAR 6}Q{CLEAR 6}R{CLEAR 6}S{CLEAR 26} $"
	.string "{CLEAR 11}T{CLEAR 6}U{CLEAR 6}V{CLEAR 26}W{CLEAR 6}X{CLEAR 6}Y{CLEAR 6}Z{CLEAR 26} $"
	.string "{CLEAR 11}0{CLEAR 16}1{CLEAR 16}2{CLEAR 16}3{CLEAR 16}4{CLEAR 16} $"
	.string "{CLEAR 11}5{CLEAR 16}6{CLEAR 16}7{CLEAR 16}8{CLEAR 16}9{CLEAR 16} $"
	.string "{CLEAR 11}!{CLEAR 16}?{CLEAR 16}♂{CLEAR 16}♀{CLEAR 16}/{CLEAR 16}-$"
	.string "{CLEAR 11}…{CLEAR 16}“{CLEAR 16}”{CLEAR 18}‘{CLEAR 18}'{CLEAR 18} $"
	.string "ABCDE$"
	.string "FGHIJ$"
	.string "KLMNO$"
	.string "PQRST$"
	.string "UVWXY$"
	.string "Z    $"
	.string "01234$"
	.string "56789$"
	.string ".,!? $"
	.string "-/&… $"
	.string "abcde$"
	.string "fghij$"
	.string "klmno$"
	.string "pqrst$"
	.string "uvwxy$"
	.string "z    $"
	.string "01234$"
	.string "56789$"
	.string ".,!? $"
	.string "-/&… $"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "{EXTRA 245}{EXTRA 246}{EXTRA 247}{EXTRA 248}{EXTRA 254}$"
	.string "{EXTRA 249}{EXTRA 250}{EXTRA 252}{EXTRA 251}{EXTRA 253}$"
	.string "{EXTRA 236}{EXTRA 237}{EXTRA 238}{EXTRA 235}{EXTRA 234}$"
	.string "♂♀{EXTRA 212}{EXTRA 213}{EXTRA 211}$"
	.string "{EXTRA 216}{EXTRA 217}{EXTRA 242}{EXTRA 243}{EXTRA 244}$"
	.string "{EXTRA 218}{EXTRA 241}{EXTRA 224}{EXTRA 226}{EXTRA 227}$"
	.string "{EXTRA 240}{EXTRA 239}{EXTRA 225}{EXTRA 214}{EXTRA 215}$"
	.string "{EXTRA 228}{EXTRA 229}{EXTRA 230}{EXTRA 231}{EXTRA 232}$"
	.string "{EXTRA 233}{EXTRA 220}{EXTRA 221}{EXTRA 222}{EXTRA 209}$"
	.string "{EXTRA 210}{EXTRA 208}ょ: $"

	// trainer_tower (again?)

	@ 847ABAC
.align 2
	.include "data/trainer_tower/trainers.inc"

	.align 2
gUnknown_84827AC:: @ 84827AC
	.byte 0x08, 0x01
	.align 2
	.4byte 0

gUnknown_84827B4:: @ 84827B4
	.4byte gUnknown_847F16C
	.4byte gUnknown_847D26C
	.4byte gUnknown_84808AC
	.4byte gUnknown_847ABAC
	.4byte gUnknown_847CAAC
	.4byte gUnknown_847E9AC
	.4byte gUnknown_847AF8C
	.4byte gUnknown_847CE8C
	.4byte gUnknown_847DA2C
	.4byte gUnknown_847BF0C
	.4byte gUnknown_847D64C
	.4byte gUnknown_847DE0C
	.4byte gUnknown_847B74C
	.4byte gUnknown_847BB2C
	.4byte gUnknown_848182C
	.4byte gUnknown_847F92C
	.4byte gUnknown_847C2EC
	.4byte gUnknown_847C6CC
	.4byte gUnknown_847E5CC
	.4byte gUnknown_84804CC
	.4byte gUnknown_84823CC
	.4byte gUnknown_8481FEC
	.4byte gUnknown_84800EC
	.4byte gUnknown_847E1EC
	.4byte gUnknown_847ED8C
	.4byte gUnknown_848106C
	.4byte gUnknown_8480C8C
	.4byte gUnknown_847F92C
	.4byte gUnknown_847F54C
	.4byte gUnknown_847E1EC
	.4byte gUnknown_847D64C
	.4byte gUnknown_847C6CC

	.include "data/text/move_descriptions.inc"

gUnknown_84886E8:: @ 84886E8
	.incbin "baserom.gba", 0x4886E8, 0x588
