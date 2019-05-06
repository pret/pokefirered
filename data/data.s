#include "constants/region_map.h"
#include "constants/trainer_classes.h"
#include "constants/songs.h"
#include "constants/region_map.h"
	.set NULL, 0

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

gMonFrontPicTable:: @ 82350AC
	.incbin "baserom.gba", 0x2350AC, 0xE8

gUnknown_8235194:: @ 8235194
	.incbin "baserom.gba", 0x235194, 0xCD8

gUnknown_8235E6C:: @ 8235E6C
	.incbin "baserom.gba", 0x235E6C, 0x6E0

gMonBackPicTable:: @ 823654C
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

gTrainerFrontPicTable:: @ 823957C
	.incbin "baserom.gba", 0x23957C, 0x4A0

gTrainerFrontPicPaletteTable:: @ 8239A1C
	.incbin "baserom.gba", 0x239A1C, 0x558

gTrainerBackAnimsPtrTable:: @ 8239F74
	.incbin "baserom.gba", 0x239F74, 0x18

gUnknown_8239F8C:: @ 8239F8C
	.incbin "baserom.gba", 0x239F8C, 0x18

gTrainerBackPicTable:: @ 8239FA4
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
	.include "data/text/species_names.inc"

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

	.section .rodata.825EF0C

	.align 2
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

gText_MaleSymbol4:: @ 8261EC1
	.incbin "baserom.gba", 0x261EC1, 0x2

gText_FemaleSymbol4:: @ 8261EC3
	.incbin "baserom.gba", 0x261EC3, 0x2

gText_GenderlessSymbol:: @ 8261EC5
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

gUnknown_08331F60:: @ 826601C
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
	.4byte sub_8058684
	.4byte sub_80586A4
	.4byte sub_80586A8

gUnknown_826D348:: @ 826D348
	.4byte sub_80586C8
	.4byte sub_80586CC
	.4byte sub_80586CC
	.4byte sub_80586CC
	.4byte sub_80586CC
	.4byte sub_80586C8
	.4byte sub_80586C8
	.4byte sub_8058734
	.4byte sub_8058734
	.4byte sub_8058734
	.4byte sub_8058734

gUnknown_826D374:: @ 826D374
	.4byte sub_805874C
	.4byte sub_8058754

gUnknown_826D37C:: @ 826D37C
	.incbin "baserom.gba", 0x26D37C, 0x67E84

gMapData_PalletTown_PlayersHouse_1F:: @ 82D5200
	.incbin "baserom.gba", 0x2D5200, 0xFC

gMapData_PalletTown_PlayersHouse_2F:: @ 82D52FC
	.incbin "baserom.gba", 0x2D52FC, 0x128

gMapData_PalletTown_GarysHouse:: @ 82D5424
	.incbin "baserom.gba", 0x2D5424, 0x244

gMapData_PalletTown_ProfessorOaksLab:: @ 82D5668
	.incbin "baserom.gba", 0x2D5668, 0xEC

gMapData_CeruleanCity_House3:: @ 82D5754
gMapData_CeruleanCity_House4:: @ 82D5754
gMapData_VermilionCity_House1:: @ 82D5754
gMapData_VermilionCity_House2:: @ 82D5754
gMapData_VermilionCity_House3:: @ 82D5754
gMapData_FuchsiaCity_House1:: @ 82D5754
gMapData_FuchsiaCity_House3:: @ 82D5754
gMapData_Route16_House:: @ 82D5754
	.incbin "baserom.gba", 0x2D5754, 0xEC

gMapData_PewterCity_House1:: @ 82D5840
gMapData_PewterCity_House2:: @ 82D5840
gMapData_Route2_House:: @ 82D5840
gMapData_UnknownMap_18_01:: @ 82D5840
gMapData_UnusedHouse_27_00:: @ 82D5840
gMapData_UnusedHouse_29_00:: @ 82D5840
	.incbin "baserom.gba", 0x2D5840, 0x150

gMapData_ViridianCity_PokemonCenter_1F:: @ 82D5990
gMapData_PewterCity_PokemonCenter_1F:: @ 82D5990
gMapData_CeruleanCity_PokemonCenter_1F:: @ 82D5990
gMapData_LavenderTown_PokemonCenter_1F:: @ 82D5990
gMapData_VermilionCity_PokemonCenter_1F:: @ 82D5990
gMapData_CeladonCity_PokemonCenter_1F:: @ 82D5990
gMapData_FuchsiaCity_PokemonCenter_1F:: @ 82D5990
gMapData_CinnabarIsland_PokemonCenter_1F:: @ 82D5990
gMapData_SaffronCity_PokemonCenter_1F:: @ 82D5990
gMapData_Route4_PokemonCenter_1F:: @ 82D5990
gMapData_Route10_PokemonCenter_1F:: @ 82D5990
gMapData_SevenIsland_PokemonCenter_1F:: @ 82D5990
gMapData_TwoIsland_PokemonCenter_1F:: @ 82D5990
gMapData_ThreeIsland_PokemonCenter_1F:: @ 82D5990
gMapData_FourIsland_PokemonCenter_1F:: @ 82D5990
gMapData_FiveIsland_PokemonCenter_1F:: @ 82D5990
gMapData_SixIsland_PokemonCenter_1F:: @ 82D5990
	.incbin "baserom.gba", 0x2D5990, 0x150

gMapData_ViridianCity_PokemonCenter_2F:: @ 82D5AE0
gMapData_PewterCity_PokemonCenter_2F:: @ 82D5AE0
gMapData_CeruleanCity_PokemonCenter_2F:: @ 82D5AE0
gMapData_LavenderTown_PokemonCenter_2F:: @ 82D5AE0
gMapData_VermilionCity_PokemonCenter_2F:: @ 82D5AE0
gMapData_CeladonCity_PokemonCenter_2F:: @ 82D5AE0
gMapData_FuchsiaCity_PokemonCenter_2F:: @ 82D5AE0
gMapData_CinnabarIsland_PokemonCenter_2F:: @ 82D5AE0
gMapData_IndigoPlateau_PokemonCenter_2F:: @ 82D5AE0
gMapData_SaffronCity_PokemonCenter_2F:: @ 82D5AE0
gMapData_Route4_PokemonCenter_2F:: @ 82D5AE0
gMapData_Route10_PokemonCenter_2F:: @ 82D5AE0
gMapData_SevenIsland_PokemonCenter_2F:: @ 82D5AE0
gMapData_TwoIsland_PokemonCenter_2F:: @ 82D5AE0
gMapData_ThreeIsland_PokemonCenter_2F:: @ 82D5AE0
gMapData_FourIsland_PokemonCenter_2F:: @ 82D5AE0
gMapData_FiveIsland_PokemonCenter_2F:: @ 82D5AE0
gMapData_SixIsland_PokemonCenter_2F:: @ 82D5AE0
	.incbin "baserom.gba", 0x2D5AE0, 0xEC

gMapData_ViridianCity_Mart:: @ 82D5BCC
gMapData_PewterCity_Mart:: @ 82D5BCC
gMapData_CeruleanCity_Mart:: @ 82D5BCC
gMapData_LavenderTown_Mart:: @ 82D5BCC
gMapData_VermilionCity_Mart:: @ 82D5BCC
gMapData_FuchsiaCity_Mart:: @ 82D5BCC
gMapData_CinnabarIsland_Mart:: @ 82D5BCC
gMapData_SaffronCity_Mart:: @ 82D5BCC
gMapData_SevenIsland_Mart:: @ 82D5BCC
gMapData_ThreeIsland_Mart:: @ 82D5BCC
gMapData_FourIsland_Mart:: @ 82D5BCC
gMapData_SixIsland_Mart:: @ 82D5BCC
	.incbin "baserom.gba", 0x2D5BCC, 0xEC

gMapData_OneIsland_House1:: @ 82D5CB8
gMapData_OneIsland_House2:: @ 82D5CB8
gMapData_TwoIsland_House:: @ 82D5CB8
gMapData_ThreeIsland_House2:: @ 82D5CB8
gMapData_ThreeIsland_House3:: @ 82D5CB8
gMapData_ThreeIsland_House4:: @ 82D5CB8
gMapData_ThreeIsland_House5:: @ 82D5CB8
gMapData_FourIsland_House1:: @ 82D5CB8
gMapData_FourIsland_House2:: @ 82D5CB8
gMapData_FiveIsland_House1:: @ 82D5CB8
gMapData_FiveIsland_House2:: @ 82D5CB8
gMapData_SixIsland_House:: @ 82D5CB8
gMapData_TwoIsland_CapeBrink_House:: @ 82D5CB8
gMapData_SixIsland_WaterPath_House2:: @ 82D5CB8
gMapData_SevenIsland_SevaultCanyon_House:: @ 82D5CB8
	.incbin "baserom.gba", 0x2D5CB8, 0x2CC

gMapData_CeruleanCity_Gym:: @ 82D5F84
	.incbin "baserom.gba", 0x2D5F84, 0xEC

gMapData_Route12_FishingHouse:: @ 82D6070
gMapData_UnusedHouse_31_05:: @ 82D6070
gMapData_SixIsland_WaterPath_House1:: @ 82D6070
	.incbin "baserom.gba", 0x2D6070, 0x300

gMapData_CeladonCity_Gym:: @ 82D6370
	.incbin "baserom.gba", 0x2D6370, 0x20C

gMapData_FiveIsland_ResortGorgeous_House:: @ 82D657C
	.incbin "baserom.gba", 0x2D657C, 0x488

gMapData_FuchsiaCity_Gym:: @ 82D6A04
	.incbin "baserom.gba", 0x2D6A04, 0xEC

gMapData_LavenderTown_House1:: @ 82D6AF0
gMapData_LavenderTown_House2:: @ 82D6AF0
gMapData_CeladonCity_House1:: @ 82D6AF0
gMapData_SaffronCity_House2:: @ 82D6AF0
gMapData_SaffronCity_House3:: @ 82D6AF0
	.incbin "baserom.gba", 0x2D6AF0, 0x338

gMapData_VermilionCity_Gym:: @ 82D6E28
	.incbin "baserom.gba", 0x2D6E28, 0x100

gMapData_CeruleanCity_BikeShop:: @ 82D6F28
	.incbin "baserom.gba", 0x2D6F28, 0x240

gMapData_CeladonCity_GameCorner:: @ 82D7168
	.incbin "baserom.gba", 0x2D7168, 0x1C4

gMapData_PewterCity_Gym:: @ 82D732C
	.incbin "baserom.gba", 0x2D732C, 0xEC

gMapData_FourIsland_LoreleisHouse:: @ 82D7418
	.incbin "baserom.gba", 0x2D7418, 0xEC

gMapData_ThreeIsland_House1:: @ 82D7504
	.incbin "baserom.gba", 0x2D7504, 0x740

gMapData_SaffronCity_Gym:: @ 82D7C44
	.incbin "baserom.gba", 0x2D7C44, 0x684

gMapData_CinnabarIsland_Gym:: @ 82D82C8
	.incbin "baserom.gba", 0x2D82C8, 0x3E4

gMapData_ViridianCity_Gym:: @ 82D86AC
	.incbin "baserom.gba", 0x2D86AC, 0x33C

gMapData_UnknownMap_00_00:: @ 82D89E8
	.incbin "baserom.gba", 0x2D89E8, 0xFC

gMapData_UnknownMap_00_01:: @ 82D8AE4
	.incbin "baserom.gba", 0x2D8AE4, 0x1B4

gMapData_UnknownMap_00_02:: @ 82D8C98
	.incbin "baserom.gba", 0x2D8C98, 0x120

gMapData_UnknownMap_00_03:: @ 82D8DB8
	.incbin "baserom.gba", 0x2D8DB8, 0xC8

gMapData_FuchsiaCity_SafariZone_Entrance:: @ 82D8E80
	.incbin "baserom.gba", 0x2D8E80, 0x4640

gMapData_PalletTown:: @ 82DD4C0
	.incbin "baserom.gba", 0x2DD4C0, 0xF24

gMapData_ViridianCity:: @ 82DE3E4
	.incbin "baserom.gba", 0x2DE3E4, 0xF24

gMapData_PewterCity:: @ 82DF308
	.incbin "baserom.gba", 0x2DF308, 0xF24

gMapData_CeruleanCity:: @ 82E022C
	.incbin "baserom.gba", 0x2E022C, 0x3E4

gMapData_LavenderTown:: @ 82E0610
	.incbin "baserom.gba", 0x2E0610, 0xF24

gMapData_VermilionCity:: @ 82E1534
	.incbin "baserom.gba", 0x2E1534, 0x12E4

gMapData_CeladonCity:: @ 82E2818
	.incbin "baserom.gba", 0x2E2818, 0xF24

gMapData_FuchsiaCity:: @ 82E373C
	.incbin "baserom.gba", 0x2E373C, 0x3E4

gMapData_CinnabarIsland:: @ 82E3B20
	.incbin "baserom.gba", 0x2E3B20, 0x3E4

gMapData_IndigoPlateau_Exterior:: @ 82E3F04
	.incbin "baserom.gba", 0x2E3F04, 0xF24

gMapData_SaffronCity:: @ 82E4E28
	.incbin "baserom.gba", 0x2E4E28, 0x7A4

gMapData_Route1:: @ 82E55CC
gUnknown_82E55CC:: @ 82E55CC
	.incbin "baserom.gba", 0x2E55CC, 0xF24

gMapData_Route2:: @ 82E64F0
	.incbin "baserom.gba", 0x2E64F0, 0xD44

gMapData_Route3:: @ 82E7234
	.incbin "baserom.gba", 0x2E7234, 0x1104

gMapData_Route4:: @ 82E8338
	.incbin "baserom.gba", 0x2E8338, 0xF24

gMapData_Route5:: @ 82E925C
	.incbin "baserom.gba", 0x2E925C, 0x7A4

gMapData_Route6:: @ 82E9A00
	.incbin "baserom.gba", 0x2E9A00, 0x3E4

gMapData_Route7:: @ 82E9DE4
	.incbin "baserom.gba", 0x2E9DE4, 0xB64

gMapData_Route8:: @ 82EA948
	.incbin "baserom.gba", 0x2EA948, 0xB64

gMapData_Route9:: @ 82EB4AC
	.incbin "baserom.gba", 0x2EB4AC, 0xF24

gMapData_Route10:: @ 82EC3D0
	.incbin "baserom.gba", 0x2EC3D0, 0xB64

gMapData_Route11:: @ 82ECF34
	.incbin "baserom.gba", 0x2ECF34, 0x16A4

gMapData_Route12:: @ 82EE5D8
	.incbin "baserom.gba", 0x2EE5D8, 0xB64

gMapData_Route13:: @ 82EF13C
	.incbin "baserom.gba", 0x2EF13C, 0xB64

gMapData_Route14:: @ 82EFCA0
	.incbin "baserom.gba", 0x2EFCA0, 0xB64

gMapData_Route15:: @ 82F0804
	.incbin "baserom.gba", 0x2F0804, 0x7A4

gMapData_Route16:: @ 82F0FA8
	.incbin "baserom.gba", 0x2F0FA8, 0x1E24

gMapData_Route17:: @ 82F2DCC
	.incbin "baserom.gba", 0x2F2DCC, 0x984

gMapData_Route18:: @ 82F3750
	.incbin "baserom.gba", 0x2F3750, 0xB64

gMapData_Route19:: @ 82F42B4
	.incbin "baserom.gba", 0x2F42B4, 0x12E4

gMapData_Route20:: @ 82F5598
	.incbin "baserom.gba", 0x2F5598, 0x984

gMapData_Route21_North:: @ 82F5F1C
	.incbin "baserom.gba", 0x2F5F1C, 0x924

gMapData_Route22:: @ 82F6840
	.incbin "baserom.gba", 0x2F6840, 0x1E24

gMapData_Route23:: @ 82F8664
	.incbin "baserom.gba", 0x2F8664, 0x7A4

gMapData_Route24:: @ 82F8E08
	.incbin "baserom.gba", 0x2F8E08, 0xB64

gMapData_Route25:: @ 82F996C
	.incbin "baserom.gba", 0x2F996C, 0xF24

gMapData_MtMoon_1F:: @ 82FA890
	.incbin "baserom.gba", 0x2FA890, 0xF74

gMapData_MtMoon_B1F:: @ 82FB804
	.incbin "baserom.gba", 0x2FB804, 0xF24

gMapData_MtMoon_B2F:: @ 82FC728
	.incbin "baserom.gba", 0x2FC728, 0x1D44

gMapData_ViridianForest:: @ 82FE46C
	.incbin "baserom.gba", 0x2FE46C, 0x11A4

gMapData_SSAnne_Exterior:: @ 82FF610
	.incbin "baserom.gba", 0x2FF610, 0x53C

gMapData_SSAnne_1F_Corridor:: @ 82FFB4C
	.incbin "baserom.gba", 0x2FFB4C, 0x464

gMapData_SSAnne_2F_Corridor:: @ 82FFFB0
	.incbin "baserom.gba", 0x2FFFB0, 0x158

gMapData_SSAnne_3F_Corridor:: @ 8300108
	.incbin "baserom.gba", 0x300108, 0x168

gMapData_SSAnne_B1F_Corridor:: @ 8300270
	.incbin "baserom.gba", 0x300270, 0x3B4

gMapData_SSAnne_Deck:: @ 8300624
	.incbin "baserom.gba", 0x300624, 0x3544

gMapData_DiglettsCave_B1F:: @ 8303B68
	.incbin "baserom.gba", 0x303B68, 0x864

gMapData_VictoryRoad_1F:: @ 83043CC
	.incbin "baserom.gba", 0x3043CC, 0x8E8

gMapData_VictoryRoad_2F:: @ 8304CB4
	.incbin "baserom.gba", 0x304CB4, 0x7E0

gMapData_VictoryRoad_3F:: @ 8305494
	.incbin "baserom.gba", 0x305494, 0x794

gMapData_RocketHideout_B1F:: @ 8305C28
	.incbin "baserom.gba", 0x305C28, 0x5A4

gMapData_RocketHideout_B2F:: @ 83061CC
	.incbin "baserom.gba", 0x3061CC, 0x4C8

gMapData_RocketHideout_B3F:: @ 8306694
	.incbin "baserom.gba", 0x306694, 0x504

gMapData_RocketHideout_B4F:: @ 8306B98
	.incbin "baserom.gba", 0x306B98, 0x654

gMapData_SilphCo_1F:: @ 83071EC
	.incbin "baserom.gba", 0x3071EC, 0x654

gMapData_SilphCo_2F:: @ 8307840
	.incbin "baserom.gba", 0x307840, 0x654

gMapData_SilphCo_3F:: @ 8307E94
	.incbin "baserom.gba", 0x307E94, 0x654

gMapData_SilphCo_4F:: @ 83084E8
	.incbin "baserom.gba", 0x3084E8, 0x654

gMapData_SilphCo_5F:: @ 8308B3C
	.incbin "baserom.gba", 0x308B3C, 0x4C0

gMapData_SilphCo_6F:: @ 8308FFC
	.incbin "baserom.gba", 0x308FFC, 0x4C0

gMapData_SilphCo_7F:: @ 83094BC
	.incbin "baserom.gba", 0x3094BC, 0x4C0

gMapData_SilphCo_8F:: @ 830997C
	.incbin "baserom.gba", 0x30997C, 0x4C0

gMapData_SilphCo_9F:: @ 8309E3C
	.incbin "baserom.gba", 0x309E3C, 0x2AC

gMapData_SilphCo_10F:: @ 830A0E8
	.incbin "baserom.gba", 0x30A0E8, 0x2CC

gMapData_SilphCo_11F:: @ 830A3B4
	.incbin "baserom.gba", 0x30A3B4, 0xA88

gMapData_PokemonMansion_1F:: @ 830AE3C
	.incbin "baserom.gba", 0x30AE3C, 0xB6C

gMapData_PokemonMansion_2F:: @ 830B9A8
	.incbin "baserom.gba", 0x30B9A8, 0xA88

gMapData_PokemonMansion_3F:: @ 830C430
	.incbin "baserom.gba", 0x30C430, 0xA88

gMapData_PokemonMansion_B1F:: @ 830CEB8
	.incbin "baserom.gba", 0x30CEB8, 0xE80

gMapData_SafariZone_Center:: @ 830DD38
	.incbin "baserom.gba", 0x30DD38, 0xEEC

gMapData_SafariZone_East:: @ 830EC24
	.incbin "baserom.gba", 0x30EC24, 0x11F8

gMapData_SafariZone_North:: @ 830FE1C
	.incbin "baserom.gba", 0x30FE1C, 0xDA8

gMapData_SafariZone_West:: @ 8310BC4
	.incbin "baserom.gba", 0x310BC4, 0x754

gMapData_CeruleanCave_1F:: @ 8311318
	.incbin "baserom.gba", 0x311318, 0x754

gMapData_CeruleanCave_2F:: @ 8311A6C
	.incbin "baserom.gba", 0x311A6C, 0x754

gMapData_CeruleanCave_B1F:: @ 83121C0
	.incbin "baserom.gba", 0x3121C0, 0xF24

gMapData_RockTunnel_1F:: @ 83130E4
	.incbin "baserom.gba", 0x3130E4, 0xF24

gMapData_RockTunnel_B1F:: @ 8314008
	.incbin "baserom.gba", 0x314008, 0x744

gMapData_SeafoamIslands_1F:: @ 831474C
	.incbin "baserom.gba", 0x31474C, 0x6F8

gMapData_SeafoamIslands_B1F:: @ 8314E44
	.incbin "baserom.gba", 0x314E44, 0x744

gMapData_SeafoamIslands_B2F:: @ 8315588
	.incbin "baserom.gba", 0x315588, 0x744

gMapData_SeafoamIslands_B3F:: @ 8315CCC
	.incbin "baserom.gba", 0x315CCC, 0x744

gMapData_SeafoamIslands_B4F:: @ 8316410
	.incbin "baserom.gba", 0x316410, 0x3E4

gMapData_PokemonTower_1F:: @ 83167F4
	.incbin "baserom.gba", 0x3167F4, 0x3E4

gMapData_PokemonTower_2F:: @ 8316BD8
	.incbin "baserom.gba", 0x316BD8, 0x3E4

gMapData_PokemonTower_3F:: @ 8316FBC
	.incbin "baserom.gba", 0x316FBC, 0x3E4

gMapData_PokemonTower_4F:: @ 83173A0
	.incbin "baserom.gba", 0x3173A0, 0x3E4

gMapData_PokemonTower_5F:: @ 8317784
	.incbin "baserom.gba", 0x317784, 0x3E4

gMapData_PokemonTower_6F:: @ 8317B68
	.incbin "baserom.gba", 0x317B68, 0x3E4

gMapData_PokemonTower_7F:: @ 8317F4C
	.incbin "baserom.gba", 0x317F4C, 0xF74

gMapData_PowerPlant:: @ 8318EC0
	.incbin "baserom.gba", 0x318EC0, 0x170

gMapData_Route25_SeaCottage:: @ 8319030
	.incbin "baserom.gba", 0x319030, 0x1E4

gMapData_SSAnne_Kitchen:: @ 8319214
	.incbin "baserom.gba", 0x319214, 0xD8

gMapData_SSAnne_CaptainsOffice:: @ 83192EC
	.incbin "baserom.gba", 0x3192EC, 0x128

gMapData_UndergroundPath_NorthEntrance:: @ 8319414
gMapData_UndergroundPath_SouthEntrance:: @ 8319414
gMapData_UndergroundPath_WestEntrance:: @ 8319414
gMapData_UndergroundPath_EastEntrance:: @ 8319414
	.incbin "baserom.gba", 0x319414, 0x484

gMapData_UndergroundPath_EastWestTunnel:: @ 8319898
	.incbin "baserom.gba", 0x319898, 0x414

gMapData_UndergroundPath_NorthSouthTunnel:: @ 8319CAC
	.incbin "baserom.gba", 0x319CAC, 0x144

gMapData_Route12_NorthEntrance_1F:: @ 8319DF0
	.incbin "baserom.gba", 0x319DF0, 0x84

gMapData_SSAnne_1F_Room1:: @ 8319E74
gMapData_SSAnne_1F_Room2:: @ 8319E74
gMapData_SSAnne_1F_Room3:: @ 8319E74
gMapData_SSAnne_1F_Room4:: @ 8319E74
gMapData_SSAnne_1F_Room5:: @ 8319E74
gMapData_SSAnne_1F_Room7:: @ 8319E74
gMapData_SSAnne_1F_Room6:: @ 8319E74
	.incbin "baserom.gba", 0x319E74, 0x90

gMapData_SSAnne_2F_Room1:: @ 8319F04
gMapData_SSAnne_2F_Room2:: @ 8319F04
gMapData_SSAnne_2F_Room3:: @ 8319F04
gMapData_SSAnne_2F_Room4:: @ 8319F04
gMapData_SSAnne_2F_Room5:: @ 8319F04
gMapData_SSAnne_2F_Room6:: @ 8319F04
gMapData_SSAnne_B1F_Room1:: @ 8319F04
gMapData_SSAnne_B1F_Room2:: @ 8319F04
gMapData_SSAnne_B1F_Room3:: @ 8319F04
gMapData_SSAnne_B1F_Room4:: @ 8319F04
gMapData_SSAnne_B1F_Room5:: @ 8319F04
	.incbin "baserom.gba", 0x319F04, 0x6C

gMapData_CeladonCity_DepartmentStore_Elevator:: @ 8319F70
	.incbin "baserom.gba", 0x319F70, 0x28C

gMapData_PewterCity_Museum_1F:: @ 831A1FC
	.incbin "baserom.gba", 0x31A1FC, 0x1A0

gMapData_PewterCity_Museum_2F:: @ 831A39C
	.incbin "baserom.gba", 0x31A39C, 0xD8

gMapData_CeruleanCity_House2:: @ 831A474
	.incbin "baserom.gba", 0x31A474, 0xEC

gMapData_CeruleanCity_House1:: @ 831A560
	.incbin "baserom.gba", 0x31A560, 0x27C

gMapData_CeladonCity_Condominiums_1F:: @ 831A7DC
	.incbin "baserom.gba", 0x31A7DC, 0x27C

gMapData_CeladonCity_Condominiums_2F:: @ 831AA58
	.incbin "baserom.gba", 0x31AA58, 0x27C

gMapData_CeladonCity_Condominiums_3F:: @ 831ACD4
	.incbin "baserom.gba", 0x31ACD4, 0x2A8

gMapData_CeladonCity_Condominiums_Roof:: @ 831AF7C
	.incbin "baserom.gba", 0x31AF7C, 0xD8

gMapData_CeladonCity_Condominiums_RoofRoom:: @ 831B054
	.incbin "baserom.gba", 0x31B054, 0xD8

gMapData_CeladonCity_GameCorner_PrizeRoom:: @ 831B12C
	.incbin "baserom.gba", 0x31B12C, 0x170

gMapData_CeladonCity_Restaurant:: @ 831B29C
	.incbin "baserom.gba", 0x31B29C, 0x19C

gMapData_CeladonCity_Hotel:: @ 831B438
	.incbin "baserom.gba", 0x31B438, 0x1C4

gMapData_CeladonCity_DepartmentStore_1F:: @ 831B5FC
	.incbin "baserom.gba", 0x31B5FC, 0x1AC

gMapData_CeladonCity_DepartmentStore_2F:: @ 831B7A8
	.incbin "baserom.gba", 0x31B7A8, 0x1AC

gMapData_CeladonCity_DepartmentStore_3F:: @ 831B954
	.incbin "baserom.gba", 0x31B954, 0x1AC

gMapData_CeladonCity_DepartmentStore_4F:: @ 831BB00
	.incbin "baserom.gba", 0x31BB00, 0x1AC

gMapData_CeladonCity_DepartmentStore_5F:: @ 831BCAC
	.incbin "baserom.gba", 0x31BCAC, 0x238

gMapData_CeladonCity_DepartmentStore_Roof:: @ 831BEE4
	.incbin "baserom.gba", 0x31BEE4, 0x144

gMapData_SafariZone_Building1:: @ 831C028
gMapData_SafariZone_Building2:: @ 831C028
gMapData_SafariZone_Building3:: @ 831C028
gMapData_SafariZone_Building4:: @ 831C028
	.incbin "baserom.gba", 0x31C028, 0x144

gMapData_SafariZone_SecretHouse:: @ 831C16C
	.incbin "baserom.gba", 0x31C16C, 0x1DC

gMapData_FuchsiaCity_ZooBuilding:: @ 831C348
	.incbin "baserom.gba", 0x31C348, 0x144

gMapData_FuchsiaCity_Building1:: @ 831C48C
	.incbin "baserom.gba", 0x31C48C, 0xEC

gMapData_FuchsiaCity_House2:: @ 831C578
	.incbin "baserom.gba", 0x31C578, 0x28C

gMapData_CinnabarIsland_PokemonLab_Entrance:: @ 831C804
	.incbin "baserom.gba", 0x31C804, 0x170

gMapData_CinnabarIsland_PokemonLab_Lounge:: @ 831C974
	.incbin "baserom.gba", 0x31C974, 0x170

gMapData_CinnabarIsland_PokemonLab_ResearchRoom:: @ 831CAE4
	.incbin "baserom.gba", 0x31CAE4, 0x170

gMapData_CinnabarIsland_PokemonLab_ExperimentRoom:: @ 831CC54
	.incbin "baserom.gba", 0x31CC54, 0x1C80

gMapData_SaffronCity_Duplicate:: @ 831E8D4
	.incbin "baserom.gba", 0x31E8D4, 0xEC

gMapData_Route5_SouthEntrance:: @ 831E9C0
gMapData_Route6_NorthEntrance:: @ 831E9C0
	.incbin "baserom.gba", 0x31E9C0, 0x110

gMapData_Route7_EastEntrance:: @ 831EAD0
gMapData_Route8_WestEntrance:: @ 831EAD0
	.incbin "baserom.gba", 0x31EAD0, 0xC4

gMapData_DiglettsCave_NorthEntrance:: @ 831EB94
	.incbin "baserom.gba", 0x31EB94, 0xC4

gMapData_DiglettsCave_SouthEntrance:: @ 831EC58
	.incbin "baserom.gba", 0x31EC58, 0x3A8

gMapData_IndigoPlateau_PokemonCenter_1F:: @ 831F000
	.incbin "baserom.gba", 0x31F000, 0x178

gMapData_PokemonLeague_LoreleisRoom:: @ 831F178
	.incbin "baserom.gba", 0x31F178, 0x178

gMapData_PokemonLeague_BrunosRoom:: @ 831F2F0
	.incbin "baserom.gba", 0x31F2F0, 0x178

gMapData_PokemonLeague_AgathasRoom:: @ 831F468
	.incbin "baserom.gba", 0x31F468, 0x564

gMapData_PokemonLeague_LancesRoom:: @ 831F9CC
	.incbin "baserom.gba", 0x31F9CC, 0x22C

gMapData_PokemonLeague_ChampionsRoom:: @ 831FBF8
	.incbin "baserom.gba", 0x31FBF8, 0x144

gMapData_PokemonLeague_HallOfFame:: @ 831FD3C
	.incbin "baserom.gba", 0x31FD3C, 0x984

gMapData_Route21_South:: @ 83206C0
	.incbin "baserom.gba", 0x3206C0, 0x144

gMapData_Route11_EastEntrance_2F:: @ 8320804
gMapData_Route12_NorthEntrance_2F:: @ 8320804
gMapData_Route15_WestEntrance_2F:: @ 8320804
gMapData_Route16_NorthEntrance_2F:: @ 8320804
gMapData_Route18_EastEntrance_2F:: @ 8320804
	.incbin "baserom.gba", 0x320804, 0x18C

gMapData_Route2_ViridianForest_SouthEntrance:: @ 8320990
gMapData_Route2_EastBuilding:: @ 8320990
gMapData_Route2_ViridianForest_NorthEntrance:: @ 8320990
	.incbin "baserom.gba", 0x320990, 0x18C

gMapData_Route22_NorthEntrance:: @ 8320B1C
	.incbin "baserom.gba", 0x320B1C, 0x1F8

gMapData_Route16_NorthEntrance_1F:: @ 8320D14
	.incbin "baserom.gba", 0x320D14, 0x15C

gMapData_Route11_EastEntrance_1F:: @ 8320E70
gMapData_Route15_WestEntrance_1F:: @ 8320E70
gMapData_Route18_EastEntrance_1F:: @ 8320E70
	.incbin "baserom.gba", 0x320E70, 0x6C

gMapData_RocketHideout_Elevator:: @ 8320EDC
	.incbin "baserom.gba", 0x320EDC, 0x128

gMapData_SaffronCity_House1_1F:: @ 8321004
	.incbin "baserom.gba", 0x321004, 0xFC

gMapData_SaffronCity_House1_2F:: @ 8321100
	.incbin "baserom.gba", 0x321100, 0x1C4

gMapData_SaffronCity_Dojo:: @ 83212C4
	.incbin "baserom.gba", 0x3212C4, 0x6C

gMapData_SilphCo_Elevator:: @ 8321330
	.incbin "baserom.gba", 0x321330, 0x3E4

gMapData_OneIsland:: @ 8321714
	.incbin "baserom.gba", 0x321714, 0x7A4

gMapData_TwoIsland:: @ 8321EB8
	.incbin "baserom.gba", 0x321EB8, 0x7A4

gMapData_ThreeIsland:: @ 832265C
	.incbin "baserom.gba", 0x32265C, 0xF24

gMapData_FourIsland:: @ 8323580
	.incbin "baserom.gba", 0x323580, 0x3E4

gMapData_FiveIsland:: @ 8323964
	.incbin "baserom.gba", 0x323964, 0x3E4

gMapData_SevenIsland:: @ 8323D48
	.incbin "baserom.gba", 0x323D48, 0x5C4

gMapData_SixIsland:: @ 832430C
	.incbin "baserom.gba", 0x32430C, 0x1A64

gMapData_OneIsland_KindleRoad:: @ 8325D70
	.incbin "baserom.gba", 0x325D70, 0x7A4

gMapData_OneIsland_TreasureBeach:: @ 8326514
	.incbin "baserom.gba", 0x326514, 0x7A4

gMapData_TwoIsland_CapeBrink:: @ 8326CB8
	.incbin "baserom.gba", 0x326CB8, 0xF24

gMapData_ThreeIsland_BondBridge:: @ 8327BDC
	.incbin "baserom.gba", 0x327BDC, 0x7A4

gMapData_ThreeIsland_Port:: @ 8328380
	.incbin "baserom.gba", 0x328380, 0x28

gMapData_UnknownMap_03_50:: @ 83283A8
	.incbin "baserom.gba", 0x3283A8, 0x28

gMapData_UnknownMap_03_51:: @ 83283D0
	.incbin "baserom.gba", 0x3283D0, 0xD44

gMapData_UnknownMap_03_52:: @ 8329114
	.incbin "baserom.gba", 0x329114, 0xB64

gMapData_UnknownMap_03_53:: @ 8329C78
	.incbin "baserom.gba", 0x329C78, 0xB64

gMapData_FiveIsland_ResortGorgeous:: @ 832A7DC
	.incbin "baserom.gba", 0x32A7DC, 0xB64

gMapData_FiveIsland_WaterLabyrinth:: @ 832B340
	.incbin "baserom.gba", 0x32B340, 0x7A4

gMapData_FiveIsland_Meadow:: @ 832BAE4
	.incbin "baserom.gba", 0x32BAE4, 0xB64

gMapData_FiveIsland_MemorialPillar:: @ 832C648
	.incbin "baserom.gba", 0x32C648, 0xF24

gMapData_SixIsland_OutcastIsland:: @ 832D56C
	.incbin "baserom.gba", 0x32D56C, 0xB64

gMapData_SixIsland_GreenPath:: @ 832E0D0
	.incbin "baserom.gba", 0x32E0D0, 0x12E4

gMapData_SixIsland_WaterPath:: @ 832F3B4
	.incbin "baserom.gba", 0x32F3B4, 0xF24

gMapData_SixIsland_RuinValley:: @ 83302D8
	.incbin "baserom.gba", 0x3302D8, 0x25A4

gMapData_SevenIsland_TrainerTower:: @ 833287C
	.incbin "baserom.gba", 0x33287C, 0x7A4

gMapData_SevenIsland_SevaultCanyon_Entrance:: @ 8333020
	.incbin "baserom.gba", 0x333020, 0xF24

gMapData_SevenIsland_SevaultCanyon:: @ 8333F44
	.incbin "baserom.gba", 0x333F44, 0x16A4

gMapData_SevenIsland_TanobyRuins:: @ 83355E8
	.incbin "baserom.gba", 0x3355E8, 0x32DC

gMapData_UnknownMap_00_04:: @ 83388C4
	.incbin "baserom.gba", 0x3388C4, 0x19C

gMapData_SaffronCity_PokemonTrainerFanClub:: @ 8338A60
	.incbin "baserom.gba", 0x338A60, 0x1E8

gMapData_SevenIsland_House_Room2:: @ 8338C48
	.incbin "baserom.gba", 0x338C48, 0xD8

gMapData_ViridianCity_House2:: @ 8338D20
	.incbin "baserom.gba", 0x338D20, 0x570

gMapData_MtEmber_RubyPath_B4F:: @ 8339290
	.incbin "baserom.gba", 0x339290, 0x1518

gMapData_ThreeIsland_BerryForest:: @ 833A7A8
	.incbin "baserom.gba", 0x33A7A8, 0x1C8

gMapData_OneIsland_PokemonCenter_1F:: @ 833A970
	.incbin "baserom.gba", 0x33A970, 0x114

gMapData_TwoIsland_JoyfulGameCorner:: @ 833AA84
	.incbin "baserom.gba", 0x33AA84, 0x144

gMapData_VermilionCity_PokemonFanClub:: @ 833ABC8
	.incbin "baserom.gba", 0x33ABC8, 0xFC

gMapData_LavenderTown_VolunteerPokemonHouse:: @ 833ACC4
	.incbin "baserom.gba", 0x33ACC4, 0xFC

gMapData_Route5_PokemonDayCare:: @ 833ADC0
	.incbin "baserom.gba", 0x33ADC0, 0xEC

gMapData_ViridianCity_House1:: @ 833AEAC
	.incbin "baserom.gba", 0x33AEAC, 0xFC

gMapData_FourIsland_PokemonDayCare:: @ 833AFA8
	.incbin "baserom.gba", 0x33AFA8, 0x26B8

gMapData_MtEmber_Exterior:: @ 833D660
	.incbin "baserom.gba", 0x33D660, 0x368

gMapData_MtEmber_Summit:: @ 833D9C8
	.incbin "baserom.gba", 0x33D9C8, 0x240

gMapData_MtEmber_SummitPath_1F:: @ 833DC08
	.incbin "baserom.gba", 0x33DC08, 0x1164

gMapData_MtEmber_SummitPath_2F:: @ 833ED6C
	.incbin "baserom.gba", 0x33ED6C, 0x170

gMapData_MtEmber_SummitPath_3F:: @ 833EEDC
	.incbin "baserom.gba", 0x33EEDC, 0x428

gMapData_SSAnne_Kitchen3:: @ 833F304
	.incbin "baserom.gba", 0x33F304, 0x220

gMapData_MtEmber_RubyPath_B1F:: @ 833F524
	.incbin "baserom.gba", 0x33F524, 0x184

gMapData_MtEmber_RubyPath_B2F:: @ 833F6A8
	.incbin "baserom.gba", 0x33F6A8, 0x5B8

gMapData_MtEmber_RubyPath_B3F:: @ 833FC60
	.incbin "baserom.gba", 0x33FC60, 0x78

gMapData_MtEmber_RubyPath_B1F_Stairs:: @ 833FCD8
	.incbin "baserom.gba", 0x33FCD8, 0x84

gMapData_MtEmber_RubyPath_B2F_Stairs:: @ 833FD5C
	.incbin "baserom.gba", 0x33FD5C, 0x204

gMapData_MtEmber_RubyPath_B5F:: @ 833FF60
	.incbin "baserom.gba", 0x33FF60, 0x644

gMapData_SSAnne_CaptainsOffice4:: @ 83405A4
	.incbin "baserom.gba", 0x3405A4, 0x894

gMapData_FourIsland_IcefallCave_Entrance:: @ 8340E38
	.incbin "baserom.gba", 0x340E38, 0x344

gMapData_FourIsland_IcefallCave_1F:: @ 834117C
	.incbin "baserom.gba", 0x34117C, 0x3E4

gMapData_SSAnne_CaptainsOffice2:: @ 8341560
	.incbin "baserom.gba", 0x341560, 0x538

gMapData_SSAnne_CaptainsOffice3:: @ 8341A98
	.incbin "baserom.gba", 0x341A98, 0x2AC

gMapData_SevenIsland_TrainerTower_Lobby:: @ 8341D44
	.incbin "baserom.gba", 0x341D44, 0x288

gMapData_SevenIsland_TrainerTower_1F:: @ 8341FCC
	.incbin "baserom.gba", 0x341FCC, 0x288

gMapData_SevenIsland_TrainerTower_2F:: @ 8342254
	.incbin "baserom.gba", 0x342254, 0x288

gMapData_SevenIsland_TrainerTower_3F:: @ 83424DC
	.incbin "baserom.gba", 0x3424DC, 0x288

gMapData_SevenIsland_TrainerTower_4F:: @ 8342764
	.incbin "baserom.gba", 0x342764, 0x288

gMapData_SevenIsland_TrainerTower_5F:: @ 83429EC
	.incbin "baserom.gba", 0x3429EC, 0x288

gMapData_SevenIsland_TrainerTower_6F:: @ 8342C74
	.incbin "baserom.gba", 0x342C74, 0x288

gMapData_SevenIsland_TrainerTower_7F:: @ 8342EFC
	.incbin "baserom.gba", 0x342EFC, 0x288

gMapData_SevenIsland_TrainerTower_8F:: @ 8343184
	.incbin "baserom.gba", 0x343184, 0x264

gMapData_SevenIsland_TrainerTower_Roof:: @ 83433E8
	.incbin "baserom.gba", 0x3433E8, 0x6C

gMapData_SevenIsland_TrainerTower_Elevator:: @ 8343454
	.incbin "baserom.gba", 0x343454, 0xEC

gMapData_CeruleanCity_House5:: @ 8343540
	.incbin "baserom.gba", 0x343540, 0x184

gMapData_SSAnne_CaptainsOffice5:: @ 83436C4
	.incbin "baserom.gba", 0x3436C4, 0x144

gMapData_SixIsland_DottedHole_B1F:: @ 8343808
	.incbin "baserom.gba", 0x343808, 0x144

gMapData_SixIsland_DottedHole_B2F:: @ 834394C
	.incbin "baserom.gba", 0x34394C, 0x144

gMapData_SixIsland_DottedHole_B3F:: @ 8343A90
	.incbin "baserom.gba", 0x343A90, 0x144

gMapData_SSAnne_CaptainsOffice9:: @ 8343BD4
	.incbin "baserom.gba", 0x343BD4, 0x204

gMapData_SixIsland_DottedHole_SapphireRoom:: @ 8343DD8
	.incbin "baserom.gba", 0x343DD8, 0x1E0

gMapData_BirthIsland_Harbor:: @ 8343FB8
gMapData_NavelRock_Harbor:: @ 8343FB8
gMapData_SevenIsland_Harbor:: @ 8343FB8
gMapData_OneIsland_Harbor:: @ 8343FB8
gMapData_TwoIsland_Harbor:: @ 8343FB8
gMapData_FourIsland_Harbor:: @ 8343FB8
gMapData_FiveIsland_Harbor:: @ 8343FB8
gMapData_SixIsland_Harbor:: @ 8343FB8
gMapData_ThreeIsland_Harbor:: @ 8343FB8
	.incbin "baserom.gba", 0x343FB8, 0x150

gMapData_OneIsland_PokemonCenter_2F:: @ 8344108
	.incbin "baserom.gba", 0x344108, 0xF28

gMapData_SSAnne_1F_Room11:: @ 8345030
	.incbin "baserom.gba", 0x345030, 0x1C8

gMapData_ThreeIsland_DunsparceTunnel:: @ 83451F8
	.incbin "baserom.gba", 0x3451F8, 0x2E0

gMapData_FiveIsland_LostCave_Entrance:: @ 83454D8
	.incbin "baserom.gba", 0x3454D8, 0x118

gMapData_FiveIsland_LostCave_Room1:: @ 83455F0
	.incbin "baserom.gba", 0x3455F0, 0x118

gMapData_FiveIsland_LostCave_Room2:: @ 8345708
	.incbin "baserom.gba", 0x345708, 0x118

gMapData_FiveIsland_LostCave_Room3:: @ 8345820
	.incbin "baserom.gba", 0x345820, 0x118

gMapData_FiveIsland_LostCave_Room4:: @ 8345938
	.incbin "baserom.gba", 0x345938, 0x118

gMapData_FiveIsland_LostCave_Room5:: @ 8345A50
	.incbin "baserom.gba", 0x345A50, 0x118

gMapData_FiveIsland_LostCave_Room6:: @ 8345B68
	.incbin "baserom.gba", 0x345B68, 0x118

gMapData_FiveIsland_LostCave_Room7:: @ 8345C80
	.incbin "baserom.gba", 0x345C80, 0x118

gMapData_FiveIsland_LostCave_Room8:: @ 8345D98
	.incbin "baserom.gba", 0x345D98, 0x118

gMapData_FiveIsland_LostCave_Room9:: @ 8345EB0
	.incbin "baserom.gba", 0x345EB0, 0x118

gMapData_FiveIsland_LostCave_Room10:: @ 8345FC8
	.incbin "baserom.gba", 0x345FC8, 0x118

gMapData_FiveIsland_LostCave_Room11:: @ 83460E0
	.incbin "baserom.gba", 0x3460E0, 0x118

gMapData_FiveIsland_LostCave_Room12:: @ 83461F8
	.incbin "baserom.gba", 0x3461F8, 0x118

gMapData_FiveIsland_LostCave_Room13:: @ 8346310
	.incbin "baserom.gba", 0x346310, 0x118

gMapData_FiveIsland_LostCave_Room14:: @ 8346428
	.incbin "baserom.gba", 0x346428, 0x334

gMapData_SevenIsland_TanobyRuins_MoneanChamber:: @ 834675C
	.incbin "baserom.gba", 0x34675C, 0x334

gMapData_SevenIsland_TanobyRuins_LiptooChamber:: @ 8346A90
	.incbin "baserom.gba", 0x346A90, 0x334

gMapData_SevenIsland_TanobyRuins_WeepthChamber:: @ 8346DC4
	.incbin "baserom.gba", 0x346DC4, 0x334

gMapData_SevenIsland_TanobyRuins_DilfordChamber:: @ 83470F8
	.incbin "baserom.gba", 0x3470F8, 0x334

gMapData_SevenIsland_TanobyRuins_ScufibChamber:: @ 834742C
	.incbin "baserom.gba", 0x34742C, 0x624

gMapData_SSAnne_1F_Room12:: @ 8347A50
	.incbin "baserom.gba", 0x347A50, 0x204

gMapData_SevenIsland_SeavaultCanyon_TanobyKey:: @ 8347C54
	.incbin "baserom.gba", 0x347C54, 0x72C

gMapData_BirthIsland_Exterior:: @ 8348380
	.incbin "baserom.gba", 0x348380, 0x3BC

gMapData_NavelRock_Exterior:: @ 834873C
	.incbin "baserom.gba", 0x34873C, 0x398

gMapData_NavelRock_1F:: @ 8348AD4
	.incbin "baserom.gba", 0x348AD4, 0x3DC

gMapData_NavelRock_Summit:: @ 8348EB0
	.incbin "baserom.gba", 0x348EB0, 0x3EC

gMapData_NavelRock_Base:: @ 834929C
	.incbin "baserom.gba", 0x34929C, 0x88

gMapData_NavelRock_SummitPath_2F:: @ 8349324
	.incbin "baserom.gba", 0x349324, 0x88

gMapData_NavelRock_SummitPath_3F:: @ 83493AC
	.incbin "baserom.gba", 0x3493AC, 0x88

gMapData_NavelRock_SummitPath_4F:: @ 8349434
	.incbin "baserom.gba", 0x349434, 0x88

gMapData_NavelRock_SummitPath_5F:: @ 83494BC
	.incbin "baserom.gba", 0x3494BC, 0x88

gMapData_NavelRock_BasePath_B1F:: @ 8349544
	.incbin "baserom.gba", 0x349544, 0x88

gMapData_NavelRock_BasePath_B2F:: @ 83495CC
	.incbin "baserom.gba", 0x3495CC, 0x88

gMapData_NavelRock_BasePath_B3F:: @ 8349654
	.incbin "baserom.gba", 0x349654, 0x88

gMapData_NavelRock_BasePath_B4F:: @ 83496DC
	.incbin "baserom.gba", 0x3496DC, 0x88

gMapData_NavelRock_BasePath_B5F:: @ 8349764
	.incbin "baserom.gba", 0x349764, 0x88

gMapData_NavelRock_BasePath_B6F:: @ 83497EC
	.incbin "baserom.gba", 0x3497EC, 0x88

gMapData_NavelRock_BasePath_B7F:: @ 8349874
	.incbin "baserom.gba", 0x349874, 0x88

gMapData_NavelRock_BasePath_B8F:: @ 83498FC
	.incbin "baserom.gba", 0x3498FC, 0x88

gMapData_NavelRock_BasePath_B9F:: @ 8349984
	.incbin "baserom.gba", 0x349984, 0x88

gMapData_NavelRock_BasePath_B10F:: @ 8349A0C
	.incbin "baserom.gba", 0x349A0C, 0x88

gMapData_NavelRock_BasePath_B11F:: @ 8349A94
	.incbin "baserom.gba", 0x349A94, 0x334

gMapData_SevenIsland_TanobyRuins_RixyChamber:: @ 8349DC8
	.incbin "baserom.gba", 0x349DC8, 0x334

gMapData_SevenIsland_TanobyRuins_ViapoisChamber:: @ 834A0FC
	.incbin "baserom.gba", 0x34A0FC, 0x114

gMapData_NavelRock_B1F:: @ 834A210
	.incbin "baserom.gba", 0x34A210, 0x1794

gMapData_NavelRock_Fork:: @ 834B9A4
	.incbin "baserom.gba", 0x34B9A4, 0x296C

gMapData_SevenIsland_House_Room1:: @ 834E310
	.incbin "baserom.gba", 0x34E310, 0x860

gMapData_OneIsland_KindleRoad_EmberSpa:: @ 834EB70
	.incbin "baserom.gba", 0x34EB70, 0x1C

gUnknown_834EB8C:: @ 834EB8C
	.incbin "baserom.gba", 0x34EB8C, 0x5FC

    .include "data/maps/groups.inc"
