#include "constants/species.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/easy_chat.h"
#include "constants/facility_trainer_classes.h"

#define MALE 0
#define FEMALE 1
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

gUnknown_847A955::
	.string "{CLEAR 11}a{CLEAR 6}b{CLEAR 6}c{CLEAR 26}d{CLEAR 6}e{CLEAR 6}f{CLEAR 6} {CLEAR 26}.$"

gUnknown_847A976::
	.string "{CLEAR 11}g{CLEAR 6}h{CLEAR 7}i{CLEAR 27}j{CLEAR 6}k{CLEAR 6}l{CLEAR 7} {CLEAR 26},$"

gUnknown_847A997::
	.string "{CLEAR 11}m{CLEAR 6}n{CLEAR 7}o{CLEAR 26}p{CLEAR 6}q{CLEAR 7}r{CLEAR 6}s{CLEAR 27} $"

gUnknown_847A9B8::
	.string "{CLEAR 12}t{CLEAR 6}u{CLEAR 6}v{CLEAR 26}w{CLEAR 6}x{CLEAR 6}y{CLEAR 6}z{CLEAR 26} $"

gUnknown_847A9D9::
	.string "{CLEAR 11}A{CLEAR 6}B{CLEAR 6}C{CLEAR 26}D{CLEAR 6}E{CLEAR 6}F{CLEAR 6} {CLEAR 26}.$"

gUnknown_847A9FA::
	.string "{CLEAR 11}G{CLEAR 6}H{CLEAR 6}I{CLEAR 26}J{CLEAR 6}K{CLEAR 6}L{CLEAR 6} {CLEAR 26},$"

gUnknown_847AA1B::
	.string "{CLEAR 11}M{CLEAR 6}N{CLEAR 6}O{CLEAR 26}P{CLEAR 6}Q{CLEAR 6}R{CLEAR 6}S{CLEAR 26} $"

gUnknown_847AA3C::
	.string "{CLEAR 11}T{CLEAR 6}U{CLEAR 6}V{CLEAR 26}W{CLEAR 6}X{CLEAR 6}Y{CLEAR 6}Z{CLEAR 26} $"

gUnknown_847AA5D::
	.string "{CLEAR 11}0{CLEAR 16}1{CLEAR 16}2{CLEAR 16}3{CLEAR 16}4{CLEAR 16} $"

gUnknown_847AA76::
	.string "{CLEAR 11}5{CLEAR 16}6{CLEAR 16}7{CLEAR 16}8{CLEAR 16}9{CLEAR 16} $"

gUnknown_847AA8F::
	.string "{CLEAR 11}!{CLEAR 16}?{CLEAR 16}♂{CLEAR 16}♀{CLEAR 16}/{CLEAR 16}-$"

gUnknown_847AAA8::
	.string "{CLEAR 11}…{CLEAR 16}“{CLEAR 16}”{CLEAR 18}‘{CLEAR 18}'{CLEAR 18} $"

gUnknown_847AAC1::
	.string "ABCDE$"

gUnknown_847AAC7::
	.string "FGHIJ$"

gUnknown_847AACD::
	.string "KLMNO$"

gUnknown_847AAD3::
	.string "PQRST$"

gUnknown_847AAD9::
	.string "UVWXY$"

gUnknown_847AADF::
	.string "Z    $"

gUnknown_847AAE5::
	.string "01234$"

gUnknown_847AAEB::
	.string "56789$"

gUnknown_847AAF1::
	.string ".,!? $"

gUnknown_847AAF7::
	.string "-/&… $"

gUnknown_847AAFD::
	.string "abcde$"

gUnknown_847AB03::
	.string "fghij$"

gUnknown_847AB09::
	.string "klmno$"

gUnknown_847AB0F::
	.string "pqrst$"

gUnknown_847AB15::
	.string "uvwxy$"

gUnknown_847AB1B::
	.string "z    $"

gUnknown_847AB21::
	.string "01234$"

gUnknown_847AB27::
	.string "56789$"

gUnknown_847AB2D::
	.string ".,!? $"

gUnknown_847AB33::
	.string "-/&… $"

	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"
	.string "$"

gUnknown_847AB41::
	.string "{EXTRA 245}{EXTRA 246}{EXTRA 247}{EXTRA 248}{EXTRA 254}$"

gUnknown_847AB4C::
	.string "{EXTRA 249}{EXTRA 250}{EXTRA 252}{EXTRA 251}{EXTRA 253}$"

gUnknown_847AB57::
	.string "{EXTRA 236}{EXTRA 237}{EXTRA 238}{EXTRA 235}{EXTRA 234}$"

gUnknown_847AB62::
	.string "♂♀{EXTRA 212}{EXTRA 213}{EXTRA 211}$"

gUnknown_847AB6B::
	.string "{EXTRA 216}{EXTRA 217}{EXTRA 242}{EXTRA 243}{EXTRA 244}$"

gUnknown_847AB76::
	.string "{EXTRA 218}{EXTRA 241}{EXTRA 224}{EXTRA 226}{EXTRA 227}$"

gUnknown_847AB81::
	.string "{EXTRA 240}{EXTRA 239}{EXTRA 225}{EXTRA 214}{EXTRA 215}$"

gUnknown_847AB8C::
	.string "{EXTRA 228}{EXTRA 229}{EXTRA 230}{EXTRA 231}{EXTRA 232}$"

gUnknown_847AB97::
	.string "{EXTRA 233}{EXTRA 220}{EXTRA 221}{EXTRA 222}{EXTRA 209}$"

gUnknown_847ABA2::
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

	.align 2, 0
gMoveDescriptionPointers:: @ 84886E8
	.4byte gMoveDescription_Pound
	.4byte gMoveDescription_KarateChop
	.4byte gMoveDescription_DoubleSlap
	.4byte gMoveDescription_CometPunch
	.4byte gMoveDescription_MegaPunch
	.4byte gMoveDescription_PayDay
	.4byte gMoveDescription_FirePunch
	.4byte gMoveDescription_IcePunch
	.4byte gMoveDescription_ThunderPunch
	.4byte gMoveDescription_Scratch
	.4byte gMoveDescription_ViceGrip
	.4byte gMoveDescription_Guillotine
	.4byte gMoveDescription_RazorWind
	.4byte gMoveDescription_SwordsDance
	.4byte gMoveDescription_Cut
	.4byte gMoveDescription_Gust
	.4byte gMoveDescription_WingAttack
	.4byte gMoveDescription_Whirlwind
	.4byte gMoveDescription_Fly
	.4byte gMoveDescription_Bind
	.4byte gMoveDescription_Slam
	.4byte gMoveDescription_VineWhip
	.4byte gMoveDescription_Stomp
	.4byte gMoveDescription_DoubleKick
	.4byte gMoveDescription_MegaKick
	.4byte gMoveDescription_JumpKick
	.4byte gMoveDescription_RollingKick
	.4byte gMoveDescription_SandAttack
	.4byte gMoveDescription_Headbutt
	.4byte gMoveDescription_HornAttack
	.4byte gMoveDescription_FuryAttack
	.4byte gMoveDescription_HornDrill
	.4byte gMoveDescription_Tackle
	.4byte gMoveDescription_BodySlam
	.4byte gMoveDescription_Wrap
	.4byte gMoveDescription_TakeDown
	.4byte gMoveDescription_Thrash
	.4byte gMoveDescription_DoubleEdge
	.4byte gMoveDescription_TailWhip
	.4byte gMoveDescription_PoisonSting
	.4byte gMoveDescription_Twineedle
	.4byte gMoveDescription_PinMissile
	.4byte gMoveDescription_Leer
	.4byte gMoveDescription_Bite
	.4byte gMoveDescription_Growl
	.4byte gMoveDescription_Roar
	.4byte gMoveDescription_Sing
	.4byte gMoveDescription_Supersonic
	.4byte gMoveDescription_SonicBoom
	.4byte gMoveDescription_Disable
	.4byte gMoveDescription_Acid
	.4byte gMoveDescription_Ember
	.4byte gMoveDescription_Flamethrower
	.4byte gMoveDescription_Mist
	.4byte gMoveDescription_WaterGun
	.4byte gMoveDescription_HydroPump
	.4byte gMoveDescription_Surf
	.4byte gMoveDescription_IceBeam
	.4byte gMoveDescription_Blizzard
	.4byte gMoveDescription_Psybeam
	.4byte gMoveDescription_BubbleBeam
	.4byte gMoveDescription_AuroraBeam
	.4byte gMoveDescription_HyperBeam
	.4byte gMoveDescription_Peck
	.4byte gMoveDescription_DrillPeck
	.4byte gMoveDescription_Submission
	.4byte gMoveDescription_LowKick
	.4byte gMoveDescription_Counter
	.4byte gMoveDescription_SeismicToss
	.4byte gMoveDescription_Strength
	.4byte gMoveDescription_Absorb
	.4byte gMoveDescription_MegaDrain
	.4byte gMoveDescription_LeechSeed
	.4byte gMoveDescription_Growth
	.4byte gMoveDescription_RazorLeaf
	.4byte gMoveDescription_SolarBeam
	.4byte gMoveDescription_PoisonPowder
	.4byte gMoveDescription_StunSpore
	.4byte gMoveDescription_SleepPowder
	.4byte gMoveDescription_PetalDance
	.4byte gMoveDescription_StringShot
	.4byte gMoveDescription_DragonRage
	.4byte gMoveDescription_FireSpin
	.4byte gMoveDescription_ThunderShock
	.4byte gMoveDescription_Thunderbolt
	.4byte gMoveDescription_ThunderWave
	.4byte gMoveDescription_Thunder
	.4byte gMoveDescription_RockThrow
	.4byte gMoveDescription_Earthquake
	.4byte gMoveDescription_Fissure
	.4byte gMoveDescription_Dig
	.4byte gMoveDescription_Toxic
	.4byte gMoveDescription_Confusion
	.4byte gMoveDescription_Psychic
	.4byte gMoveDescription_Hypnosis
	.4byte gMoveDescription_Meditate
	.4byte gMoveDescription_Agility
	.4byte gMoveDescription_QuickAttack
	.4byte gMoveDescription_Rage
	.4byte gMoveDescription_Teleport
	.4byte gMoveDescription_NightShade
	.4byte gMoveDescription_Mimic
	.4byte gMoveDescription_Screech
	.4byte gMoveDescription_DoubleTeam
	.4byte gMoveDescription_Recover
	.4byte gMoveDescription_Harden
	.4byte gMoveDescription_Minimize
	.4byte gMoveDescription_Smokescreen
	.4byte gMoveDescription_ConfuseRay
	.4byte gMoveDescription_Withdraw
	.4byte gMoveDescription_DefenseCurl
	.4byte gMoveDescription_Barrier
	.4byte gMoveDescription_LightScreen
	.4byte gMoveDescription_Haze
	.4byte gMoveDescription_Reflect
	.4byte gMoveDescription_FocusEnergy
	.4byte gMoveDescription_Bide
	.4byte gMoveDescription_Metronome
	.4byte gMoveDescription_MirrorMove
	.4byte gMoveDescription_SelfDestruct
	.4byte gMoveDescription_EggBomb
	.4byte gMoveDescription_Lick
	.4byte gMoveDescription_Smog
	.4byte gMoveDescription_Sludge
	.4byte gMoveDescription_BoneClub
	.4byte gMoveDescription_FireBlast
	.4byte gMoveDescription_Waterfall
	.4byte gMoveDescription_Clamp
	.4byte gMoveDescription_Swift
	.4byte gMoveDescription_SkullBash
	.4byte gMoveDescription_SpikeCannon
	.4byte gMoveDescription_Constrict
	.4byte gMoveDescription_Amnesia
	.4byte gMoveDescription_Kinesis
	.4byte gMoveDescription_SoftBoiled
	.4byte gMoveDescription_HiJumpKick
	.4byte gMoveDescription_Glare
	.4byte gMoveDescription_DreamEater
	.4byte gMoveDescription_PoisonGas
	.4byte gMoveDescription_Barrage
	.4byte gMoveDescription_LeechLife
	.4byte gMoveDescription_LovelyKiss
	.4byte gMoveDescription_SkyAttack
	.4byte gMoveDescription_Transform
	.4byte gMoveDescription_Bubble
	.4byte gMoveDescription_DizzyPunch
	.4byte gMoveDescription_Spore
	.4byte gMoveDescription_Flash
	.4byte gMoveDescription_Psywave
	.4byte gMoveDescription_Splash
	.4byte gMoveDescription_AcidArmor
	.4byte gMoveDescription_Crabhammer
	.4byte gMoveDescription_Explosion
	.4byte gMoveDescription_FurySwipes
	.4byte gMoveDescription_Bonemerang
	.4byte gMoveDescription_Rest
	.4byte gMoveDescription_RockSlide
	.4byte gMoveDescription_HyperFang
	.4byte gMoveDescription_Sharpen
	.4byte gMoveDescription_Conversion
	.4byte gMoveDescription_TriAttack
	.4byte gMoveDescription_SuperFang
	.4byte gMoveDescription_Slash
	.4byte gMoveDescription_Substitute
	.4byte gMoveDescription_Struggle
	.4byte gMoveDescription_Sketch
	.4byte gMoveDescription_TripleKick
	.4byte gMoveDescription_Thief
	.4byte gMoveDescription_SpiderWeb
	.4byte gMoveDescription_MindReader
	.4byte gMoveDescription_Nightmare
	.4byte gMoveDescription_FlameWheel
	.4byte gMoveDescription_Snore
	.4byte gMoveDescription_Curse
	.4byte gMoveDescription_Flail
	.4byte gMoveDescription_Conversion2
	.4byte gMoveDescription_Aeroblast
	.4byte gMoveDescription_CottonSpore
	.4byte gMoveDescription_Reversal
	.4byte gMoveDescription_Spite
	.4byte gMoveDescription_PowderSnow
	.4byte gMoveDescription_Protect
	.4byte gMoveDescription_MachPunch
	.4byte gMoveDescription_ScaryFace
	.4byte gMoveDescription_FaintAttack
	.4byte gMoveDescription_SweetKiss
	.4byte gMoveDescription_BellyDrum
	.4byte gMoveDescription_SludgeBomb
	.4byte gMoveDescription_MudSlap
	.4byte gMoveDescription_Octazooka
	.4byte gMoveDescription_Spikes
	.4byte gMoveDescription_ZapCannon
	.4byte gMoveDescription_Foresight
	.4byte gMoveDescription_DestinyBond
	.4byte gMoveDescription_PerishSong
	.4byte gMoveDescription_IcyWind
	.4byte gMoveDescription_Detect
	.4byte gMoveDescription_BoneRush
	.4byte gMoveDescription_LockOn
	.4byte gMoveDescription_Outrage
	.4byte gMoveDescription_Sandstorm
	.4byte gMoveDescription_GigaDrain
	.4byte gMoveDescription_Endure
	.4byte gMoveDescription_Charm
	.4byte gMoveDescription_Rollout
	.4byte gMoveDescription_FalseSwipe
	.4byte gMoveDescription_Swagger
	.4byte gMoveDescription_MilkDrink
	.4byte gMoveDescription_Spark
	.4byte gMoveDescription_FuryCutter
	.4byte gMoveDescription_SteelWing
	.4byte gMoveDescription_MeanLook
	.4byte gMoveDescription_Attract
	.4byte gMoveDescription_SleepTalk
	.4byte gMoveDescription_HealBell
	.4byte gMoveDescription_Return
	.4byte gMoveDescription_Present
	.4byte gMoveDescription_Frustration
	.4byte gMoveDescription_Safeguard
	.4byte gMoveDescription_PainSplit
	.4byte gMoveDescription_SacredFire
	.4byte gMoveDescription_Magnitude
	.4byte gMoveDescription_DynamicPunch
	.4byte gMoveDescription_Megahorn
	.4byte gMoveDescription_DragonBreath
	.4byte gMoveDescription_BatonPass
	.4byte gMoveDescription_Encore
	.4byte gMoveDescription_Pursuit
	.4byte gMoveDescription_RapidSpin
	.4byte gMoveDescription_SweetScent
	.4byte gMoveDescription_IronTail
	.4byte gMoveDescription_MetalClaw
	.4byte gMoveDescription_VitalThrow
	.4byte gMoveDescription_MorningSun
	.4byte gMoveDescription_Synthesis
	.4byte gMoveDescription_Moonlight
	.4byte gMoveDescription_HiddenPower
	.4byte gMoveDescription_CrossChop
	.4byte gMoveDescription_Twister
	.4byte gMoveDescription_RainDance
	.4byte gMoveDescription_SunnyDay
	.4byte gMoveDescription_Crunch
	.4byte gMoveDescription_MirrorCoat
	.4byte gMoveDescription_PsychUp
	.4byte gMoveDescription_ExtremeSpeed
	.4byte gMoveDescription_AncientPower
	.4byte gMoveDescription_ShadowBall
	.4byte gMoveDescription_FutureSight
	.4byte gMoveDescription_RockSmash
	.4byte gMoveDescription_Whirlpool
	.4byte gMoveDescription_BeatUp
	.4byte gMoveDescription_FakeOut
	.4byte gMoveDescription_Uproar
	.4byte gMoveDescription_Stockpile
	.4byte gMoveDescription_SpitUp
	.4byte gMoveDescription_Swallow
	.4byte gMoveDescription_HeatWave
	.4byte gMoveDescription_Hail
	.4byte gMoveDescription_Torment
	.4byte gMoveDescription_Flatter
	.4byte gMoveDescription_WillOWisp
	.4byte gMoveDescription_Memento
	.4byte gMoveDescription_Facade
	.4byte gMoveDescription_FocusPunch
	.4byte gMoveDescription_SmellingSalt
	.4byte gMoveDescription_FollowMe
	.4byte gMoveDescription_NaturePower
	.4byte gMoveDescription_Charge
	.4byte gMoveDescription_Taunt
	.4byte gMoveDescription_HelpingHand
	.4byte gMoveDescription_Trick
	.4byte gMoveDescription_RolePlay
	.4byte gMoveDescription_Wish
	.4byte gMoveDescription_Assist
	.4byte gMoveDescription_Ingrain
	.4byte gMoveDescription_Superpower
	.4byte gMoveDescription_MagicCoat
	.4byte gMoveDescription_Recycle
	.4byte gMoveDescription_Revenge
	.4byte gMoveDescription_BrickBreak
	.4byte gMoveDescription_Yawn
	.4byte gMoveDescription_KnockOff
	.4byte gMoveDescription_Endeavor
	.4byte gMoveDescription_Eruption
	.4byte gMoveDescription_SkillSwap
	.4byte gMoveDescription_Imprison
	.4byte gMoveDescription_Refresh
	.4byte gMoveDescription_Grudge
	.4byte gMoveDescription_Snatch
	.4byte gMoveDescription_SecretPower
	.4byte gMoveDescription_Dive
	.4byte gMoveDescription_ArmThrust
	.4byte gMoveDescription_Camouflage
	.4byte gMoveDescription_TailGlow
	.4byte gMoveDescription_LusterPurge
	.4byte gMoveDescription_MistBall
	.4byte gMoveDescription_FeatherDance
	.4byte gMoveDescription_TeeterDance
	.4byte gMoveDescription_BlazeKick
	.4byte gMoveDescription_MudSport
	.4byte gMoveDescription_IceBall
	.4byte gMoveDescription_NeedleArm
	.4byte gMoveDescription_SlackOff
	.4byte gMoveDescription_HyperVoice
	.4byte gMoveDescription_PoisonFang
	.4byte gMoveDescription_CrushClaw
	.4byte gMoveDescription_BlastBurn
	.4byte gMoveDescription_HydroCannon
	.4byte gMoveDescription_MeteorMash
	.4byte gMoveDescription_Astonish
	.4byte gMoveDescription_WeatherBall
	.4byte gMoveDescription_Aromatherapy
	.4byte gMoveDescription_FakeTears
	.4byte gMoveDescription_AirCutter
	.4byte gMoveDescription_Overheat
	.4byte gMoveDescription_OdorSleuth
	.4byte gMoveDescription_RockTomb
	.4byte gMoveDescription_SilverWind
	.4byte gMoveDescription_MetalSound
	.4byte gMoveDescription_GrassWhistle
	.4byte gMoveDescription_Tickle
	.4byte gMoveDescription_CosmicPower
	.4byte gMoveDescription_WaterSpout
	.4byte gMoveDescription_SignalBeam
	.4byte gMoveDescription_ShadowPunch
	.4byte gMoveDescription_Extrasensory
	.4byte gMoveDescription_SkyUppercut
	.4byte gMoveDescription_SandTomb
	.4byte gMoveDescription_SheerCold
	.4byte gMoveDescription_MuddyWater
	.4byte gMoveDescription_BulletSeed
	.4byte gMoveDescription_AerialAce
	.4byte gMoveDescription_IcicleSpear
	.4byte gMoveDescription_IronDefense
	.4byte gMoveDescription_Block
	.4byte gMoveDescription_Howl
	.4byte gMoveDescription_DragonClaw
	.4byte gMoveDescription_FrenzyPlant
	.4byte gMoveDescription_BulkUp
	.4byte gMoveDescription_Bounce
	.4byte gMoveDescription_MudShot
	.4byte gMoveDescription_PoisonTail
	.4byte gMoveDescription_Covet
	.4byte gMoveDescription_VoltTackle
	.4byte gMoveDescription_MagicalLeaf
	.4byte gMoveDescription_WaterSport
	.4byte gMoveDescription_CalmMind
	.4byte gMoveDescription_LeafBlade
	.4byte gMoveDescription_DragonDance
	.4byte gMoveDescription_RockBlast
	.4byte gMoveDescription_ShockWave
	.4byte gMoveDescription_WaterPulse
	.4byte gMoveDescription_DoomDesire
	.4byte gMoveDescription_PsychoBoost
