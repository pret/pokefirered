#include "constants/region_map.h"
#include "constants/trainer_classes.h"

	.section .rodata

	.align 2
gUnknown_8231EC4:: @ 8231EC4
	.incbin "baserom.gba", 0x231EC4, 0x20

	.align 2
gWirelessLinkDisplay4bpp:: @ 8231EE4
	.incbin "graphics/interface/wireless_link_display.4bpp.lz"

	.align 2
gWirelessLinkDisplayBin:: @ 823238C
	.incbin "graphics/interface/wireless_link_display.bin.lz"

	.align 2
gUnknown_8232578:: @ 8232578
	.incbin "baserom.gba", 0x232578, 0x20

gUnknown_8232598:: @ 8232598
	.incbin "baserom.gba", 0x232598, 0x2000

gUnknown_8234598:: @ 8234598
	.incbin "baserom.gba", 0x234598, 0x28

gUnknown_82345C0:: @ 82345C0
	.incbin "baserom.gba", 0x2345C0, 0x10

gUnknown_82345D0:: @ 82345D0
	.incbin "baserom.gba", 0x2345D0, 0x18

gUnknown_82345E8:: @ 82345E8
	.incbin "baserom.gba", 0x2345E8, 0x8

gUnknown_82345F0:: @ 82345F0
	.incbin "baserom.gba", 0x2345F0, 0x20

gUnknown_8234610:: @ 8234610
	.incbin "baserom.gba", 0x234610, 0x8

gUnknown_8234618:: @ 8234618
	.incbin "baserom.gba", 0x234618, 0x8

gUnknown_8234620:: @ 8234620
	.incbin "baserom.gba", 0x234620, 0x18

gUnknown_8234638:: @ 8234638
	.incbin "baserom.gba", 0x234638, 0x10

gUnknown_8234648:: @ 8234648
	.incbin "baserom.gba", 0x234648, 0x20

gUnknown_8234668:: @ 8234668
	.incbin "baserom.gba", 0x234668, 0x20

gUnknown_8234688:: @ 8234688
	.incbin "baserom.gba", 0x234688, 0x3

gUnknown_823468B:: @ 823468B
	.incbin "baserom.gba", 0x23468B, 0x5

gUnknown_8234690:: @ 8234690
	.incbin "baserom.gba", 0x234690, 0x4

gUnknown_8234694:: @ 8234694
	.incbin "baserom.gba", 0x234694, 0x328

gUnknown_82349BC:: @ 82349BC
	.incbin "baserom.gba", 0x2349BC, 0x10

gUnknown_82349CC:: @ 82349CC
	.incbin "baserom.gba", 0x2349CC, 0x6E0

gUnknown_82350AC:: @ 82350AC
	.incbin "baserom.gba", 0x2350AC, 0xE8

gUnknown_8235194:: @ 8235194
	.incbin "baserom.gba", 0x235194, 0xCD8

gUnknown_8235E6C:: @ 8235E6C
	.incbin "baserom.gba", 0x235E6C, 0x6E0

gUnknown_823654C:: @ 823654C
	.incbin "baserom.gba", 0x23654C, 0xDC0

gMonPaletteTable:: @ 823730C
	.incbin "baserom.gba", 0x23730C, 0xE8

gUnknown_82373F4:: @ 82373F4
	.incbin "baserom.gba", 0x2373F4, 0xCD8

gMonShinyPaletteTable:: @ 82380CC
	.incbin "baserom.gba", 0x2380CC, 0x1010

gTrainerFrontAnimsPtrTable:: @ 82390DC
	.incbin "baserom.gba", 0x2390DC, 0x250

gUnknown_823932C:: @ 823932C
	.incbin "baserom.gba", 0x23932C, 0x250

gUnknown_823957C:: @ 823957C
	.incbin "baserom.gba", 0x23957C, 0x4A0

gUnknown_8239A1C:: @ 8239A1C
	.incbin "baserom.gba", 0x239A1C, 0x558

gTrainerBackAnimsPtrTable:: @ 8239F74
	.incbin "baserom.gba", 0x239F74, 0x18

gUnknown_8239F8C:: @ 8239F8C
	.incbin "baserom.gba", 0x239F8C, 0x18

gUnknown_8239FA4:: @ 8239FA4
	.incbin "baserom.gba", 0x239FA4, 0x30

gUnknown_8239FD4:: @ 8239FD4
	.incbin "baserom.gba", 0x239FD4, 0x30

gUnknown_823A004:: @ 823A004
	.incbin "baserom.gba", 0x23A004, 0x4554

gTrainerClassNames:: @ 823E558
	.include "data/text/trainer_class_names.inc"

	.align 2, 0
gTrainers:: @ 823EAD8
	.incbin "baserom.gba", 0x23EAC8, 0x7418

gSpeciesNames:: @ 8245EE0
	.incbin "baserom.gba", 0x245EE0, 0xD05

gUnknown_8246BE5:: @ 8246BE5
	.incbin "baserom.gba", 0x246BE5, 0x4AF

gMoveNames:: @ 8247094
	.incbin "baserom.gba", 0x247094, 0xF97

gUnknown_824802B:: @ 824802B
	.incbin "baserom.gba", 0x24802B, 0xD

gUnknown_8248038:: @ 8248038
	.incbin "baserom.gba", 0x248038, 0x186

gUnknown_82481BE:: @ 82481BE
	.incbin "baserom.gba", 0x2481BE, 0x12A

gUnknown_82482E8:: @ 82482E8
	.incbin "baserom.gba", 0x2482E8, 0x18

gUnknown_8248300:: @ 8248300
	.incbin "baserom.gba", 0x248300, 0x18

gUnknown_8248318:: @ 8248318
	.incbin "baserom.gba", 0x248318, 0x8

gUnknown_8248320:: @ 8248320
	.incbin "baserom.gba", 0x248320, 0x10

gUnknown_8248330:: @ 8248330
	.incbin "baserom.gba", 0x248330, 0x6B04

gUnknown_824EE34:: @ 824EE34
	.incbin "baserom.gba", 0x24EE34, 0x190

gUnknown_824EFC4:: @ 824EFC4
	.incbin "baserom.gba", 0x24EFC4, 0x20

gUnknown_824EFE4:: @ 824EFE4
	.incbin "baserom.gba", 0x24EFE4, 0xC

gUnknown_824EFF0:: @ 824EFF0
	.incbin "baserom.gba", 0x24EFF0, 0x18

gUnknown_824F008:: @ 824F008
	.incbin "baserom.gba", 0x24F008, 0x40

gUnknown_824F048:: @ 824F048
	.incbin "baserom.gba", 0x24F048, 0x8

gUnknown_824F050:: @ 824F050
	.incbin "baserom.gba", 0x24F050, 0x150

gUnknown_824F1A0:: @ 824F1A0
	.incbin "baserom.gba", 0x24F1A0, 0x80

gUnknown_824F220:: @ 824F220
	.incbin "baserom.gba", 0x24F220, 0x8E8

gUnknown_824FB08:: @ 824FB08
	.incbin "baserom.gba", 0x24FB08, 0x138

gUnknown_824FC40:: @ 824FC40
	.incbin "baserom.gba", 0x24FC40, 0x3F8

gUnknown_8250038:: @ 8250038
	.incbin "baserom.gba", 0x250038, 0x38

gUnknown_8250070:: @ 8250070
	.incbin "baserom.gba", 0x250070, 0x24

gUnknown_8250094:: @ 8250094
	.incbin "baserom.gba", 0x250094, 0x8

gUnknown_825009C:: @ 825009C
	.incbin "baserom.gba", 0x25009C, 0x8

gUnknown_82500A4:: @ 82500A4
	.incbin "baserom.gba", 0x2500A4, 0x8

gUnknown_82500AC:: @ 82500AC
	.incbin "baserom.gba", 0x2500AC, 0x8

gUnknown_82500B4:: @ 82500B4
	.incbin "baserom.gba", 0x2500B4, 0x8

gUnknown_82500BC:: @ 82500BC
	.incbin "baserom.gba", 0x2500BC, 0x8

gUnknown_82500C4:: @ 82500C4
	.incbin "baserom.gba", 0x2500C4, 0x8

gUnknown_82500CC:: @ 82500CC
	.incbin "baserom.gba", 0x2500CC, 0x38

gUnknown_8250104:: @ 8250104
	.incbin "baserom.gba", 0x250104, 0x18

gUnknown_825011C:: @ 825011C
	.incbin "baserom.gba", 0x25011C, 0x3E0

gUnknown_82504FC:: @ 82504FC
	.incbin "baserom.gba", 0x2504FC, 0x34

gUnknown_8250530:: @ 8250530
	.incbin "baserom.gba", 0x250530, 0xC

gUnknown_825053C:: @ 825053C
	.incbin "baserom.gba", 0x25053C, 0xF0

gUnknown_825062C:: @ 825062C
	.incbin "baserom.gba", 0x25062C, 0xA4

gUnknown_82506D0:: @ 82506D0
	.incbin "baserom.gba", 0x2506D0, 0x20

gUnknown_82506F0:: @ 82506F0
	.incbin "baserom.gba", 0x2506F0, 0xD8

gUnknown_82507C8:: @ 82507C8
	.incbin "baserom.gba", 0x2507C8, 0x18

gUnknown_82507E0:: @ 82507E0
	.incbin "baserom.gba", 0x2507E0, 0x8

gUnknown_82507E8:: @ 82507E8
	.incbin "baserom.gba", 0x2507E8, 0x28

gUnknown_8250810:: @ 8250810
	.incbin "baserom.gba", 0x250810, 0xC

gUnknown_825081C:: @ 825081C
	.incbin "baserom.gba", 0x25081C, 0x14

gUnknown_8250830:: @ 8250830
	.incbin "baserom.gba", 0x250830, 0x18

gUnknown_8250848:: @ 8250848
	.incbin "baserom.gba", 0x250848, 0x40

gUnknown_8250888:: @ 8250888
	.incbin "baserom.gba", 0x250888, 0xA

gUnknown_8250892:: @ 8250892
	.incbin "baserom.gba", 0x250892, 0xA

gUnknown_825089C:: @ 825089C
	.incbin "baserom.gba", 0x25089C, 0xE4

gUnknown_8250980:: @ 8250980
	.incbin "baserom.gba", 0x250980, 0xC

gUnknown_825098C:: @ 825098C
	.incbin "baserom.gba", 0x25098C, 0x8

gUnknown_8250994:: @ 8250994
	.incbin "baserom.gba", 0x250994, 0x60

gUnknown_82509F4:: @ 82509F4
	.incbin "baserom.gba", 0x2509F4, 0x18

gUnknown_8250A0C:: @ 8250A0C
	.incbin "baserom.gba", 0x250A0C, 0x10

gUnknown_8250A1C:: @ 8250A1C
	.incbin "baserom.gba", 0x250A1C, 0x18

gUnknown_8250A34:: @ 8250A34
	.incbin "baserom.gba", 0x250A34, 0xEC

gUnknown_8250B20:: @ 8250B20
	.incbin "baserom.gba", 0x250B20, 0xE4

gBattleMoves:: @ 8250C04
	.incbin "baserom.gba", 0x250C04, 0x10B4

gUnknown_8251CB8:: @ 8251CB8
	.incbin "baserom.gba", 0x251CB8, 0x336

gUnknown_8251FEE:: @ 8251FEE
	.incbin "baserom.gba", 0x251FEE, 0x336

gUnknown_8252324:: @ 8252324
	.incbin "baserom.gba", 0x252324, 0x338

gSpindaSpotGraphics:: @ 825265C
	.incbin "baserom.gba", 0x25265C, 0x260

gItemEffectTable:: @ 82528BC
	.incbin "baserom.gba", 0x2528BC, 0x28C

gNatureStatTable:: @ 8252B48
	.incbin "baserom.gba", 0x252B48, 0x80

gTMHMLearnsets:: @ 8252BC8
	.incbin "baserom.gba", 0x252BC8, 0xCE0

gFacilityClassToPicIndex:: @ 82538A8
	.incbin "baserom.gba", 0x2538A8, 0x96

gFacilityClassToTrainerClass:: @ 825393E
	.byte CLASS_AQUA_LEADER
	.byte CLASS_TEAM_AQUA
	.byte CLASS_TEAM_AQUA
	.byte CLASS_AROMA_LADY
	.byte CLASS_RUIN_MANIAC
	.byte CLASS_INTERVIEWER
	.byte CLASS_TUBER
	.byte CLASS_TUBER_2
	.byte CLASS_COOLTRAINER
	.byte CLASS_COOLTRAINER
	.byte CLASS_HEX_MANIAC
	.byte CLASS_LADY
	.byte CLASS_BEAUTY
	.byte CLASS_RICH_BOY
	.byte CLASS_POKEMANIAC
	.byte CLASS_SWIMMER_MALE
	.byte CLASS_BLACK_BELT
	.byte CLASS_GUITARIST
	.byte CLASS_KINDLER
	.byte CLASS_CAMPER
	.byte CLASS_BUG_MANIAC
	.byte CLASS_PSYCHIC
	.byte CLASS_PSYCHIC
	.byte CLASS_GENTLEMAN
	.byte CLASS_ELITE_FOUR
	.byte CLASS_ELITE_FOUR
	.byte CLASS_LEADER
	.byte CLASS_LEADER
	.byte CLASS_LEADER
	.byte CLASS_SCHOOL_KID
	.byte CLASS_SCHOOL_KID
	.byte CLASS_SR_AND_JR
	.byte CLASS_POKEFAN
	.byte CLASS_POKEFAN
	.byte CLASS_EXPERT
	.byte CLASS_EXPERT
	.byte CLASS_YOUNGSTER
	.byte CLASS_CHAMPION
	.byte CLASS_FISHERMAN
	.byte CLASS_TRIATHLETE
	.byte CLASS_TRIATHLETE
	.byte CLASS_TRIATHLETE
	.byte CLASS_TRIATHLETE
	.byte CLASS_TRIATHLETE
	.byte CLASS_TRIATHLETE
	.byte CLASS_DRAGON_TAMER
	.byte CLASS_BIRD_KEEPER
	.byte CLASS_NINJA_BOY
	.byte CLASS_BATTLE_GIRL
	.byte CLASS_PARASOL_LADY
	.byte CLASS_SWIMMER_FEMALE
	.byte CLASS_PICNICKER
	.byte CLASS_TWINS
	.byte CLASS_SAILOR
	.byte CLASS_BOARDER
	.byte CLASS_BOARDER
	.byte CLASS_COLLECTOR
	.byte CLASS_PKMN_TRAINER_3
	.byte CLASS_PKMN_TRAINER_3
	.byte CLASS_PKMN_TRAINER_3
	.byte CLASS_PKMN_TRAINER_3
	.byte CLASS_PKMN_TRAINER_3
	.byte CLASS_PKMN_TRAINER_3
	.byte CLASS_PKMN_TRAINER_3
	.byte CLASS_PKMN_BREEDER
	.byte CLASS_PKMN_BREEDER
	.byte CLASS_PKMN_RANGER
	.byte CLASS_PKMN_RANGER
	.byte CLASS_MAGMA_LEADER
	.byte CLASS_TEAM_MAGMA
	.byte CLASS_TEAM_MAGMA
	.byte CLASS_LASS
	.byte CLASS_BUG_CATCHER
	.byte CLASS_HIKER
	.byte CLASS_YOUNG_COUPLE
	.byte CLASS_OLD_COUPLE
	.byte CLASS_SIS_AND_BRO
	.byte CLASS_AQUA_ADMIN
	.byte CLASS_AQUA_ADMIN
	.byte CLASS_MAGMA_ADMIN
	.byte CLASS_MAGMA_ADMIN
	.byte CLASS_LEADER
	.byte CLASS_LEADER
	.byte CLASS_LEADER
	.byte CLASS_LEADER
	.byte CLASS_LEADER
	.byte CLASS_ELITE_FOUR
	.byte CLASS_ELITE_FOUR
	.byte CLASS_YOUNGSTER_2
	.byte CLASS_BUG_CATCHER_2
	.byte CLASS_LASS_2
	.byte CLASS_SAILOR_2
	.byte CLASS_CAMPER_2
	.byte CLASS_PICNICKER_2
	.byte CLASS_POKEMANIAC_2
	.byte CLASS_SUPER_NERD
	.byte CLASS_HIKER_2
	.byte CLASS_BIKER
	.byte CLASS_BURGLAR
	.byte CLASS_ENGINEER
	.byte CLASS_FISHERMAN_2
	.byte CLASS_SWIMMER_MALE_2
	.byte CLASS_CUE_BALL
	.byte CLASS_GAMER
	.byte CLASS_BEAUTY_2
	.byte CLASS_SWIMMER_FEMALE_2
	.byte CLASS_PSYCHIC_2
	.byte CLASS_ROCKER
	.byte CLASS_JUGGLER
	.byte CLASS_TAMER
	.byte CLASS_BIRD_KEEPER_2
	.byte CLASS_BLACK_BELT_2
	.byte CLASS_RIVAL
	.byte CLASS_SCIENTIST
	.byte CLASS_BOSS
	.byte CLASS_TEAM_ROCKET
	.byte CLASS_COOLTRAINER_2
	.byte CLASS_COOLTRAINER_2
	.byte CLASS_ELITE_FOUR_2
	.byte CLASS_ELITE_FOUR_2
	.byte CLASS_LEADER_2
	.byte CLASS_LEADER_2
	.byte CLASS_GENTLEMAN_2
	.byte CLASS_RIVAL_2
	.byte CLASS_CHAMPION_2
	.byte CLASS_CHANNELER
	.byte CLASS_TWINS_2
	.byte CLASS_COOL_COUPLE
	.byte CLASS_YOUNG_COUPLE_2
	.byte CLASS_CRUSH_KIN
	.byte CLASS_SIS_AND_BRO_2
	.byte CLASS_PKMN_PROF
	.byte CLASS_PLAYER
	.byte CLASS_PLAYER
	.byte CLASS_PLAYER
	.byte CLASS_PLAYER
	.byte CLASS_TEAM_ROCKET
	.byte CLASS_PSYCHIC_2
	.byte CLASS_CRUSH_GIRL
	.byte CLASS_TUBER_3
	.byte CLASS_PKMN_BREEDER_2
	.byte CLASS_PKMN_RANGER_2
	.byte CLASS_PKMN_RANGER_2
	.byte CLASS_AROMA_LADY_2
	.byte CLASS_RUIN_MANIAC_2
	.byte CLASS_LADY_2
	.byte CLASS_PAINTER
	.byte CLASS_ELITE_FOUR_2
	.byte CLASS_ELITE_FOUR_2
	.byte CLASS_CHAMPION_2

gUnknown_82539D4:: @ 82539D4
	.incbin "baserom.gba", 0x2539D4, 0x110

gExperienceTables:: @ 8253AE4
	.incbin "baserom.gba", 0x253AE4, 0xCA0

gBaseStats:: @ 8254784
	.incbin "baserom.gba", 0x254784, 0x11

gUnknown_8254795:: @ 8254795
	.incbin "baserom.gba", 0x254795, 0x4FBF

gEvolutionTable:: @ 8259754
	.incbin "baserom.gba", 0x259754, 0x4060

gLevelUpLearnsets:: @ 825D7B4
	.incbin "baserom.gba", 0x25D7B4, 0x670

gPokeblockFlavorCompatibilityTable:: @ 825DE24
	.incbin "baserom.gba", 0x25DE24, 0x7D

gUnknown_825DEA1:: @ 825DEA1
	.incbin "baserom.gba", 0x25DEA1, 0x4

gPPUpWriteMasks:: @ 825DEA5
	.incbin "baserom.gba", 0x25DEA5, 0x4

gUnknown_825DEA9:: @ 825DEA9
	.incbin "baserom.gba", 0x25DEA9, 0x4

gStatStageRatios:: @ 825DEAD
	.incbin "baserom.gba", 0x25DEAD, 0x1F

sHoldEffectToType:: @ 825DECC
	.incbin "baserom.gba", 0x25DECC, 0x24

gUnknown_825DEF0:: @ 825DEF0
	.incbin "baserom.gba", 0x25DEF0, 0x60

gUnknown_825DF50:: @ 825DF50
	.incbin "baserom.gba", 0x25DF50, 0x90

sSecretBaseFacilityClasses:: @ 825DFE0
	.incbin "baserom.gba", 0x25DFE0, 0xA

sGetMonDataEVConstants:: @ 825DFEA
	.incbin "baserom.gba", 0x25DFEA, 0x6

gUnknown_825DFF0:: @ 825DFF0
	.incbin "baserom.gba", 0x25DFF0, 0x6

sFriendshipEventDeltas:: @ 825DFF6
	.incbin "baserom.gba", 0x25DFF6, 0x1E

sHMMoves:: @ 825E014
	.incbin "baserom.gba", 0x25E014, 0x12

gUnknown_825E026:: @ 825E026
	.incbin "baserom.gba", 0x25E026, 0xC

gUnknown_825E032:: @ 825E032
	.incbin "baserom.gba", 0x25E032, 0x2A

gUnknown_825E05C:: @ 825E05C
	.incbin "baserom.gba", 0x25E05C, 0x18

gUnknown_825E074:: @ 825E074
	.incbin "baserom.gba", 0x25E074, 0x280

gUnknown_825E2F4:: @ 825E2F4
	.incbin "baserom.gba", 0x25E2F4, 0x168

gBitTable:: @ 825E45C
	.incbin "baserom.gba", 0x25E45C, 0x80

gUnknown_825E4DC:: @ 825E4DC
	.incbin "baserom.gba", 0x25E4DC, 0x18

gUnknown_825E4F4:: @ 825E4F4
	.incbin "baserom.gba", 0x25E4F4, 0x18

gUnknown_825E50C:: @ 825E50C
	.incbin "baserom.gba", 0x25E50C, 0xA00

gUnknown_825EF0C:: @ 825EF0C
	.incbin "baserom.gba", 0x25EF0C, 0x8E8

gUnknown_825F7F4:: @ 825F7F4
	.incbin "baserom.gba", 0x25F7F4, 0x20

gUnknown_825F814:: @ 825F814
	.incbin "baserom.gba", 0x25F814, 0x18

gUnknown_825F82C:: @ 825F82C
	.incbin "baserom.gba", 0x25F82C, 0x10

gUnknown_825F83C:: @ 825F83C
	.incbin "baserom.gba", 0x25F83C, 0x2

gUnknown_825F83E:: @ 825F83E
	.incbin "baserom.gba", 0x25F83E, 0x8DE

gUnknown_826011C:: @ 826011C
	.incbin "baserom.gba", 0x26011C, 0x8

gUnknown_8260124:: @ 8260124
	.incbin "baserom.gba", 0x260124, 0x8

gUnknown_826012C:: @ 826012C
	.incbin "baserom.gba", 0x26012C, 0x8

gUnknown_8260134:: @ 8260134
	.incbin "baserom.gba", 0x260134, 0x50

gUnknown_8260184:: @ 8260184
	.incbin "baserom.gba", 0x260184, 0x18

gUnknown_826019C:: @ 826019C
	.incbin "baserom.gba", 0x26019C, 0x8

gUnknown_82601A4:: @ 82601A4
	.incbin "baserom.gba", 0x2601A4, 0x10

gUnknown_82601B4:: @ 82601B4
	.incbin "baserom.gba", 0x2601B4, 0x8

gUnknown_82601BC:: @ 82601BC
	.incbin "baserom.gba", 0x2601BC, 0x4C

gUnknown_8260208:: @ 8260208
	.incbin "baserom.gba", 0x260208, 0x8

gUnknown_8260210:: @ 8260210
	.incbin "baserom.gba", 0x260210, 0x8

gUnknown_8260218:: @ 8260218
	.incbin "baserom.gba", 0x260218, 0x8

gUnknown_8260220:: @ 8260220
	.incbin "baserom.gba", 0x260220, 0x8

gUnknown_8260228:: @ 8260228
	.incbin "baserom.gba", 0x260228, 0x8

gUnknown_8260230:: @ 8260230
	.incbin "baserom.gba", 0x260230, 0x8

gUnknown_8260238:: @ 8260238
	.incbin "baserom.gba", 0x260238, 0x8

gUnknown_8260240:: @ 8260240
	.incbin "baserom.gba", 0x260240, 0x20

gUnknown_8260260:: @ 8260260
	.incbin "baserom.gba", 0x260260, 0x18

gUnknown_8260278:: @ 8260278
	.incbin "baserom.gba", 0x260278, 0x30

gUnknown_82602A8:: @ 82602A8
	.incbin "baserom.gba", 0x2602A8, 0x30

gUnknown_82602D8:: @ 82602D8
	.incbin "baserom.gba", 0x2602D8, 0x20

gUnknown_82602F8:: @ 82602F8
	.incbin "baserom.gba", 0x2602F8, 0xCC

gUnknown_82603C4:: @ 82603C4
	.incbin "baserom.gba", 0x2603C4, 0x38

gUnknown_82603FC:: @ 82603FC
	.incbin "baserom.gba", 0x2603FC, 0x8

gUnknown_8260404:: @ 8260404
	.incbin "baserom.gba", 0x260404, 0x68

gUnknown_826046C:: @ 826046C
	.incbin "baserom.gba", 0x26046C, 0x10

gUnknown_826047C:: @ 826047C
	.incbin "baserom.gba", 0x26047C, 0x10

gUnknown_826048C:: @ 826048C
	.incbin "baserom.gba", 0x26048C, 0x10

gUnknown_826049C:: @ 826049C
	.incbin "baserom.gba", 0x26049C, 0x20

gUnknown_82604BC:: @ 82604BC
	.incbin "baserom.gba", 0x2604BC, 0x30

gUnknown_82604EC:: @ 82604EC
	.incbin "baserom.gba", 0x2604EC, 0x30

gUnknown_826051C:: @ 826051C
	.incbin "baserom.gba", 0x26051C, 0x10

gUnknown_826052C:: @ 826052C
	.incbin "baserom.gba", 0x26052C, 0x14

gUnknown_8260540:: @ 8260540
	.incbin "baserom.gba", 0x260540, 0x2

gUnknown_8260542:: @ 8260542
	.incbin "baserom.gba", 0x260542, 0x14

gUnknown_8260556:: @ 8260556
	.incbin "baserom.gba", 0x260556, 0x4

gUnknown_826055A:: @ 826055A
	.incbin "baserom.gba", 0x26055A, 0xA

gUnknown_8260564:: @ 8260564
	.incbin "baserom.gba", 0x260564, 0x8

gUnknown_826056C:: @ 826056C
	.incbin "baserom.gba", 0x26056C, 0x60

gUnknown_82605CC:: @ 82605CC
	.incbin "baserom.gba", 0x2605CC, 0x128

gUnknown_82606F4:: @ 82606F4
	.incbin "baserom.gba", 0x2606F4, 0x140

gUnknown_8260834:: @ 8260834
	.incbin "baserom.gba", 0x260834, 0x1FE

gUnknown_8260A32:: @ 8260A32
	.incbin "baserom.gba", 0x260A32, 0x1FE

gUnknown_8260C30:: @ 8260C30
	.incbin "baserom.gba", 0x260C30, 0x800

gUnknown_8261430:: @ 8261430
	.incbin "baserom.gba", 0x261430, 0x828

gUnknown_8261C58:: @ 8261C58
	.incbin "baserom.gba", 0x261C58, 0x8

gUnknown_8261C60:: @ 8261C60
	.incbin "baserom.gba", 0x261C60, 0x50

gUnknown_8261CB0:: @ 8261CB0
	.incbin "baserom.gba", 0x261CB0, 0x18

gUnknown_8261CC8:: @ 8261CC8
	.incbin "baserom.gba", 0x261CC8, 0x38

gUnknown_8261D00:: @ 8261D00
	.incbin "baserom.gba", 0x261D00, 0x8

gUnknown_8261D08:: @ 8261D08
	.incbin "baserom.gba", 0x261D08, 0x138

gUnknown_8261E40:: @ 8261E40
	.incbin "baserom.gba", 0x261E40, 0x1A

gUnknown_8261E5A:: @ 8261E5A
	.incbin "baserom.gba", 0x261E5A, 0x18

gUnknown_8261E72:: @ 8261E72
	.incbin "baserom.gba", 0x261E72, 0x18

gUnknown_8261E8A:: @ 8261E8A
	.incbin "baserom.gba", 0x261E8A, 0x2C

gUnknown_8261EB6:: @ 8261EB6
	.incbin "baserom.gba", 0x261EB6, 0xB

gUnknown_8261EC1:: @ 8261EC1
	.incbin "baserom.gba", 0x261EC1, 0x2

gUnknown_8261EC3:: @ 8261EC3
	.incbin "baserom.gba", 0x261EC3, 0x2

gUnknown_8261EC5:: @ 8261EC5
	.incbin "baserom.gba", 0x261EC5, 0x2

gUnknown_8261EC7:: @ 8261EC7
	.incbin "baserom.gba", 0x261EC7, 0x5

gUnknown_8261ECC:: @ 8261ECC
	.incbin "baserom.gba", 0x261ECC, 0x18

gUnknown_8261EE4:: @ 8261EE4
	.incbin "baserom.gba", 0x261EE4, 0x10

gUnknown_8261EF4:: @ 8261EF4
	.incbin "baserom.gba", 0x261EF4, 0x24

gUnknown_8261F18:: @ 8261F18
	.incbin "baserom.gba", 0x261F18, 0x4

gUnknown_8261F1C:: @ 8261F1C
	.incbin "baserom.gba", 0x261F1C, 0x10

gUnknown_8261F2C:: @ 8261F2C
	.incbin "baserom.gba", 0x261F2C, 0x98

gUnknown_8261FC4:: @ 8261FC4
	.incbin "baserom.gba", 0x261FC4, 0x70

gUnknown_8262034:: @ 8262034
	.incbin "baserom.gba", 0x262034, 0x21

gUnknown_8262055:: @ 8262055
	.incbin "baserom.gba", 0x262055, 0x2027

gUnknown_826407C:: @ 826407C
	.incbin "baserom.gba", 0x26407C, 0x1FA0

gUnknown_826601C:: @ 826601C
	.incbin "baserom.gba", 0x26601C, 0x1000

gUnknown_826701C:: @ 826701C
	.incbin "baserom.gba", 0x26701C, 0x2840

gUnknown_826985C:: @ 826985C
	.incbin "baserom.gba", 0x26985C, 0x100

gUnknown_826995C:: @ 826995C
	.incbin "baserom.gba", 0x26995C, 0x100

gUnknown_8269A5C:: @ 8269A5C
	.incbin "baserom.gba", 0x269A5C, 0x1000

gUnknown_826AA5C:: @ 826AA5C
	.incbin "baserom.gba", 0x26AA5C, 0x1000

	.align 2
gUnknown_3379A0Bin:: @ 826BA5C
	.incbin "graphics/trade/unknown_3379A0.bin.lz"

gUnknown_826BB5C:: @ 826BB5C
	.incbin "baserom.gba", 0x26BB5C, 0x200

gUnknown_826BD5C:: @ 826BD5C
	.incbin "baserom.gba", 0x26BD5C, 0x200

gUnknown_826BF5C:: @ 826BF5C
	.incbin "baserom.gba", 0x26BF5C, 0x20

gWirelessSignal4bpp:: @ 826BF7C
	.incbin "graphics/trade/wireless_signal.4bpp.lz"

gUnknown_826C60C:: @ 826C60C
	.incbin "baserom.gba", 0x26C60C, 0x7C8

gUnknown_826CDD4:: @ 826CDD4
	.incbin "baserom.gba", 0x26CDD4, 0x8

gUnknown_826CDDC:: @ 826CDDC
	.incbin "baserom.gba", 0x26CDDC, 0x8

gUnknown_826CDE4:: @ 826CDE4
	.incbin "baserom.gba", 0x26CDE4, 0x48

gUnknown_826CE2C:: @ 826CE2C
	.incbin "baserom.gba", 0x26CE2C, 0x8

gUnknown_826CE34:: @ 826CE34
	.incbin "baserom.gba", 0x26CE34, 0x8

gUnknown_826CE3C:: @ 826CE3C
	.incbin "baserom.gba", 0x26CE3C, 0x8

gUnknown_826CE44:: @ 826CE44
	.incbin "baserom.gba", 0x26CE44, 0x38

gUnknown_826CE7C:: @ 826CE7C
	.incbin "baserom.gba", 0x26CE7C, 0x8

gUnknown_826CE84:: @ 826CE84
	.incbin "baserom.gba", 0x26CE84, 0x2C

gUnknown_826CEB0:: @ 826CEB0
	.incbin "baserom.gba", 0x26CEB0, 0x8

gUnknown_826CEB8:: @ 826CEB8
	.incbin "baserom.gba", 0x26CEB8, 0x70

gUnknown_826CF28:: @ 826CF28
	.incbin "baserom.gba", 0x26CF28, 0x8

gUnknown_826CF30:: @ 826CF30
	.incbin "baserom.gba", 0x26CF30, 0x18

gUnknown_826CF48:: @ 826CF48
	.incbin "baserom.gba", 0x26CF48, 0x18

gUnknown_826CF60:: @ 826CF60
	.incbin "baserom.gba", 0x26CF60, 0x28

gUnknown_826CF88:: @ 826CF88
	.incbin "baserom.gba", 0x26CF88, 0x4

gUnknown_826CF8C:: @ 826CF8C
	.incbin "baserom.gba", 0x26CF8C, 0x21C

gUnknown_826D1A8:: @ 826D1A8
	.incbin "baserom.gba", 0x26D1A8, 0x14

gUnknown_826D1BC:: @ 826D1BC
	.incbin "baserom.gba", 0x26D1BC, 0x10

gUnknown_826D1CC:: @ 826D1CC
	.incbin "baserom.gba", 0x26D1CC, 0x8

gUnknown_826D1D4:: @ 826D1D4
	.incbin "baserom.gba", 0x26D1D4, 0x10

gUnknown_826D1E4:: @ 826D1E4
	.incbin "baserom.gba", 0x26D1E4, 0x6C

gUnknown_826D250:: @ 826D250
	.incbin "baserom.gba", 0x26D250, 0x44

gUnknown_826D294:: @ 826D294
	.incbin "baserom.gba", 0x26D294, 0xA

gUnknown_826D29E:: @ 826D29E
	.incbin "baserom.gba", 0x26D29E, 0x12

gUnknown_826D2B0:: @ 826D2B0
	.incbin "baserom.gba", 0x26D2B0, 0x28

gDirectionToVectors:: @ 826D2D8
	.4byte  0,  0
	.4byte  0,  1
	.4byte  0, -1
	.4byte -1,  0
	.4byte  1,  0
	.4byte -1,  1
	.4byte  1,  1
	.4byte -1, -1
	.4byte  1, -1

gUnknown_826D320:: @ 826D320
	.incbin "baserom.gba", 0x26D320, 0x10

gUnknown_826D330:: @ 826D330
	.incbin "baserom.gba", 0x26D330, 0xC

gUnknown_826D33C:: @ 826D33C
	.incbin "baserom.gba", 0x26D33C, 0xC

gUnknown_826D348:: @ 826D348
	.incbin "baserom.gba", 0x26D348, 0x2C

gUnknown_826D374:: @ 826D374
	.incbin "baserom.gba", 0x26D374, 0x78258

gUnknown_82E55CC:: @ 82E55CC
	.incbin "baserom.gba", 0x2E55CC, 0x695C0

gUnknown_834EB8C:: @ 834EB8C
	.incbin "baserom.gba", 0x34EB8C, 0x5FC

    .include "data/maps/groups.inc"
