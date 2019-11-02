#include "constants/maps.h"
#include "constants/species.h"
#include "constants/region_map.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2

	.include "data/text/map_section_names.inc"

gUnknown_83EF23C:: @ 83EF23C gbapal
	.incbin "graphics/region_map/unk_83EF23C.gbapal"

gUnknown_83EF25C:: @ 83EF25C gbapal
	.incbin "graphics/region_map/unk_83EF25C.gbapal"

gUnknown_83EF27C:: @ 83EF27C gbapal
	.incbin "graphics/region_map/unk_83EF27C.gbapal"

gUnknown_83EF29C:: @ 83EF29C gbapal
	.incbin "graphics/region_map/unk_83EF29C.gbapal"

gUnknown_83EF2BC:: @ 83EF2BC gbapal
	.incbin "graphics/region_map/unk_83EF2BC.gbapal"

gUnknown_83EF2DC:: @ 83EF2DC gbapal
	.incbin "graphics/region_map/unk_83EF2DC.gbapal"

	.2byte 0x7c00, 0x7d80, 0x7fff, 0x7fff

gUnknown_83EF384:: @ 83EF384 gbapal
	.incbin "graphics/region_map/unk_83EF384.gbapal"

gUnknown_83EF3A4:: @ 83EF3A4 gbapal
	.incbin "graphics/region_map/unk_83EF3A4.gbapal"

gUnknown_83EF3C4:: @ 83EF3C4 pal=gUnknown_83EF384
	.incbin "graphics/region_map/unk_83EF3C4.4bpp.lz"

gUnknown_83EF450:: @ 83EF450 pal=gUnknown_83EF384
	.incbin "graphics/region_map/unk_83EF450.4bpp.lz"

gUnknown_83EF4E0:: @ 83EF4E0 pal=gUnknown_83EF25C
	.incbin "graphics/region_map/unk_83EF4E0.4bpp.lz"

gUnknown_83EF524:: @ 83EF524 pal=gUnknown_83EF27C
	.incbin "graphics/region_map/unk_83EF524.4bpp.lz"

gUnknown_83EF59C:: @ 83EF59C pal=gUnknown_83EF29C
	.incbin "graphics/region_map/unk_83EF59C.4bpp.lz"

gUnknown_83EF61C:: @ 83EF61C
	.incbin "graphics/region_map/unk_83EF61C.4bpp.lz"

gUnknown_83F0330:: @ 83F0330
	.incbin "graphics/region_map/unk_83F0330.4bpp.lz"

gUnknown_83F0580:: @ 83F0580
	.incbin "graphics/region_map/unk_83F0580.bin.lz"

gUnknown_83F089C:: @ 83F089C
	.incbin "graphics/region_map/unk_83F089C.bin.lz"

gUnknown_83F0AFC:: @ 83F0AFC
	.incbin "graphics/region_map/unk_83F0AFC.bin.lz"

gUnknown_83F0C0C:: @ 83F0C0C
	.incbin "graphics/region_map/unk_83F0C0C.bin.lz"

gUnknown_83F0CF0:: @ 83F0CF0
	.incbin "graphics/region_map/unk_83F0CF0.bin.lz"

gUnknown_83F0E0C:: @ 83F0E0C
	.incbin "graphics/region_map/unk_83F0E0C.bin.lz"

gUnknown_83F0F1C:: @ 83F0F1C
	.incbin "graphics/region_map/unk_83F0F1C.bin.lz"

gUnknown_83F1084:: @ 83F1084
	.incbin "graphics/region_map/unk_83F1084.bin.lz"

gUnknown_83F1190:: @ 83F1190
	.incbin "graphics/region_map/unk_83F1190.bin.lz"

gUnknown_83F12CC:: @ 83F12CC pal=gUnknown_83EF3A4
	.incbin "graphics/region_map/unk_83F12CC.4bpp.lz"

gUnknown_83F13EC:: @ 83F13EC pal=gUnknown_83EF3A4
	.incbin "graphics/region_map/unk_83F13EC.4bpp.lz"

gUnknown_83F1550:: @ 83F1550 pal=gUnknown_83EF3A4
	.incbin "graphics/region_map/unk_83F1550.4bpp.lz"

gUnknown_83F1640:: @ 83F1640 pal=gUnknown_83EF3A4
	.incbin "graphics/region_map/unk_83F1640.4bpp.lz"

gUnknown_83F1738:: @ 83F1738 pal=gUnknown_83EF3A4
	.incbin "graphics/region_map/unk_83F1738.4bpp.lz"

gUnknown_83F1804:: @ 83F1804 pal=gUnknown_83EF3A4
	.incbin "graphics/region_map/unk_83F1804.4bpp.lz"

gUnknown_83F18D8:: @ 83F18D8 pal=gUnknown_83EF2BC
	.incbin "graphics/region_map/unk_83F18D8.4bpp.lz"

gUnknown_83F1908:: @ 83F1908 pal=gUnknown_83EF2BC
	.incbin "graphics/region_map/unk_83F1908.4bpp.lz"

gUnknown_83F1978:: @ 83F1978
	.incbin "graphics/region_map/unk_83F1978.4bpp.lz"

gUnknown_83F19A0:: @ 83F19A0
	.incbin "graphics/region_map/unk_83F19A0.bin.lz"

gUnknown_83F1A50:: @ 83F1A50
	.4byte 0x000021e0
	@ {
	@   .bg = 0,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 30,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 2,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000030f5
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 1,
	@   .mapBaseIndex = 15,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 3,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x0000117a
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 23,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 1,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x000001ff
	@ {
	@   .bg = 3,
	@   .charBaseIndex = 3,
	@   .mapBaseIndex = 31,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }

gUnknown_83F1A60:: @ 83F1A60
	.byte 3, 3, 2, 15, 2, 12
	.2byte 0x0001
	@ {
	@   .bg = 3,
	@   .tilemapLeft = 3,
	@   .tilemapTop = 2,
	@   .width = 15,
	@   .height = 2,
	@   .paletteNum = 12,
	@   .baseBlock = 0x0001
	@ }
	.byte 3, 3, 4, 15, 2, 12
	.2byte 0x001f
	@ {
	@   .bg = 3,
	@   .tilemapLeft = 3,
	@   .tilemapTop = 4,
	@   .width = 15,
	@   .height = 2,
	@   .paletteNum = 12,
	@   .baseBlock = 0x001f
	@ }
	.byte 3, 3, 6, 25, 11, 12
	.2byte 0x003d
	@ {
	@   .bg = 3,
	@   .tilemapLeft = 3,
	@   .tilemapTop = 6,
	@   .width = 25,
	@   .height = 11,
	@   .paletteNum = 12,
	@   .baseBlock = 0x003d
	@ }
	.byte 3, 18, 0, 5, 2, 12
	.2byte 0x0150
	@ {
	@   .bg = 3,
	@   .tilemapLeft = 18,
	@   .tilemapTop = 0,
	@   .width = 5,
	@   .height = 2,
	@   .paletteNum = 12,
	@   .baseBlock = 0x0150
	@ }
	.byte 3, 24, 0, 5, 2, 12
	.2byte 0x015a
	@ {
	@   .bg = 3,
	@   .tilemapLeft = 24,
	@   .tilemapTop = 0,
	@   .width = 5,
	@   .height = 2,
	@   .paletteNum = 12,
	@   .baseBlock = 0x015a
	@ }
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000
	@ {
	@   .bg = 255,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 0,
	@   .height = 0,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_83F1A90:: @ 83F1A90
	.byte 0, 1, 2

	.align 2
gUnknown_83F1A94:: @ 83F1A94
	.byte 0, 7, 2

	.align 2
gUnknown_83F1A98:: @ 83F1A98
	.byte 0, 10, 2

	.align 2
gUnknown_83F1A9C:: @ 83F1A9C
	.4byte gUnknown_83F1A94
	.4byte gUnknown_83F1A98

gUnknown_83F1AA4:: @ 83F1AA4
	.byte 0x8f, 0x90, 0x91, 0x96, 0x97, 0x98, 0x99, 0x9a, 0xaf, 0xb0, 0xb9, 0xc3, 0xc5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.byte 0x92, 0x93, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f, 0xa0, 0xa1, 0xa2, 0xae, 0xb1, 0xb2, 0xb5, 0xc5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.byte 0x94, 0x95, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xb3, 0xb4, 0xb6, 0xb7, 0xb8, 0xba, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf, 0xc0, 0xc1, 0xc2, 0xc5, 0x00, 0x00

	.align 2
gUnknown_83F1B00:: @ 83F1B00
	.byte 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01

gUnknown_83F1B0C:: @ 83F1B0C
	.2byte 0x0018, 0x0010, 0x0090, 0x0020

gUnknown_83F1B14:: @ 83F1B14
	.2byte 0x0018, 0x0020, 0x0090, 0x0030

gUnknown_83F1B1C:: @ 83F1B1C
	.2byte 0x0000, 0x0000, 0x0000, 0x0000

gUnknown_83F1B24:: @ 83F1B24
	.4byte 0x80000000, 0x00000000

gAnimCmd_83F1B2C::
	obj_image_anim_frame 0x00, 20
	obj_image_anim_frame 0x10, 20
	obj_image_anim_jump 0

gUnknown_83F1B38:: @ 83F1B38
	.4byte gAnimCmd_83F1B2C

gUnknown_83F1B3C:: @ 83F1B3C
	.2byte MAPSEC_VIRIDIAN_FOREST
	.align 2
	.4byte gMapSecName_ViridianForest
	.4byte gUnknown_8418ECB
	.2byte MAPSEC_MT_MOON
	.align 2
	.4byte gMapSecName_MtMoon
	.4byte gUnknown_8418F3A
	.2byte MAPSEC_DIGLETTS_CAVE
	.align 2
	.4byte gMapSecName_DiglettsCave
	.4byte gUnknown_8418FB8
	.2byte MAPSEC_KANTO_VICTORY_ROAD
	.align 2
	.4byte gMapSecName_VictoryRoad
	.4byte gUnknown_841901C
	.2byte MAPSEC_POKEMON_MANSION
	.align 2
	.4byte gMapSecName_PokemonMansion
	.4byte gUnknown_841908E
	.2byte MAPSEC_KANTO_SAFARI_ZONE
	.align 2
	.4byte gMapSecName_SafariZone
	.4byte gUnknown_8419103
	.2byte MAPSEC_ROCK_TUNNEL
	.align 2
	.4byte gMapSecName_RockTunnel
	.4byte gUnknown_841917D
	.2byte MAPSEC_SEAFOAM_ISLANDS
	.align 2
	.4byte gMapSecName_SeafoamIslands
	.4byte gUnknown_8419201
	.2byte MAPSEC_POKEMON_TOWER
	.align 2
	.4byte gMapSecName_PokemonTower
	.4byte gUnknown_841926D
	.2byte MAPSEC_CERULEAN_CAVE
	.align 2
	.4byte gMapSecName_CeruleanCave
	.4byte gUnknown_84192E2
	.2byte MAPSEC_POWER_PLANT
	.align 2
	.4byte gMapSecName_PowerPlant
	.4byte gUnknown_841935B
	.2byte MAPSEC_MT_EMBER
	.align 2
	.4byte gMapSecName_MtEmber
	.4byte gUnknown_84193D5
	.2byte MAPSEC_BERRY_FOREST
	.align 2
	.4byte gMapSecName_BerryForest
	.4byte gUnknown_8419444
	.2byte MAPSEC_ICEFALL_CAVE
	.align 2
	.4byte gMapSecName_IcefallCave
	.4byte gUnknown_84194C9
	.2byte MAPSEC_LOST_CAVE
	.align 2
	.4byte gMapSecName_LostCave
	.4byte gUnknown_841953F
	.2byte MAPSEC_TANOBY_CHAMBERS
	.align 2
	.4byte gMapSecName_TanobyChambers
	.4byte gUnknown_84195AC
	.2byte MAPSEC_ALTERING_CAVE
	.align 2
	.4byte gMapSecName_AlteringCave
	.4byte gUnknown_8419629
	.2byte MAPSEC_PATTERN_BUSH
	.align 2
	.4byte gMapSecName_PatternBush
	.4byte gUnknown_841969D
	.2byte MAPSEC_DOTTED_HOLE
	.align 2
	.4byte gMapSecName_DottedHole
	.4byte gUnknown_841971A

gUnknown_83F1C20:: @ 83F1C20
	.4byte 0xc0008000, 0x00000000

gAnimCmd_83f1c28::
	obj_image_anim_frame 0, 0
	obj_image_anim_jump 0

gUnknown_83F1C30:: @ 83F1C30
	.4byte gAnimCmd_83f1c28

gUnknown_83F1C34:: @ 83F1C34
	.2byte 0x0018, 0x0010, 0x00d8, 0x00a0

gUnknown_83F1C3C:: @ 83F1C3C
	.4byte 0x40000000, 0x00000800

gAnimCmd_83F1C44::
	obj_image_anim_frame 0, 20
	obj_image_anim_frame 4, 20
	obj_image_anim_jump 0

gUnknown_83F1C50:: @ 83F1C50
	.4byte gAnimCmd_83F1C44

gUnknown_83F1C54:: @ 83F1C54
	.4byte 0x40000000, 0x00000800

gAnimCmd_83F1C5C::
	obj_image_anim_frame 0, 5
	obj_image_anim_end

gUnknown_83F1C64:: @ 83F1C64
	.4byte gAnimCmd_83F1C5C

gUnknown_83F1C68:: @ 83F1C68
	.4byte 0x40000000, 0x00000800

gUnknown_83F1C70:: @ 83F1C70
	.4byte 0x00000000, 0x00000800

gAnimCmd_83F1C78::
	obj_image_anim_frame 0, 30
	obj_image_anim_frame 4, 60
	obj_image_anim_jump 0

gAnimCmd_83F1C84::
	obj_image_anim_frame 1, 20
	obj_image_anim_jump 0

gAnimCmd_83F1C8C::
	obj_image_anim_frame 0, 20
	obj_image_anim_jump 0

gUnknown_83F1C94:: @ 83F1C94
	.4byte gAnimCmd_83F1C78

gUnknown_83F1C98:: @ 83F1C98
	.4byte gAnimCmd_83F1C84
	.4byte gAnimCmd_83F1C8C

gUnknown_83F1CA0:: @ 83F1CA0
	.2byte 0x2000, 0x4000

gUnknown_83F1CA4:: @ 83F1CA4
	.2byte 0x4044, 0x4246

gUnknown_83F1CA8:: @ 83F1CA8
	.byte 15, 1, 2

	.align 2
gUnknown_83F1CAC:: @ 83F1CAC
	.4byte gMapSecName_PalletTown
	.4byte gMapSecName_ViridianCity
	.4byte gMapSecName_PewterCity
	.4byte gMapSecName_CeruleanCity
	.4byte gMapSecName_LavenderTown
	.4byte gMapSecName_VermilionCity
	.4byte gMapSecName_CeladonCity
	.4byte gMapSecName_FuchsiaCity
	.4byte gMapSecName_CinnabarIsland
	.4byte gMapSecName_IndigoPlateau
	.4byte gMapSecName_SaffronCity
	.4byte gMapSecName_Route4
	.4byte gMapSecName_Route10
	.4byte gMapSecName_Route1
	.4byte gMapSecName_Route2
	.4byte gMapSecName_Route3
	.4byte gMapSecName_Route4_2
	.4byte gMapSecName_Route5
	.4byte gMapSecName_Route6
	.4byte gMapSecName_Route7
	.4byte gMapSecName_Route8
	.4byte gMapSecName_Route9
	.4byte gMapSecName_Route10_2
	.4byte gMapSecName_Route11
	.4byte gMapSecName_Route12
	.4byte gMapSecName_Route13
	.4byte gMapSecName_Route14
	.4byte gMapSecName_Route15
	.4byte gMapSecName_Route16
	.4byte gMapSecName_Route17
	.4byte gMapSecName_Route18
	.4byte gMapSecName_Route19
	.4byte gMapSecName_Route20
	.4byte gMapSecName_Route21
	.4byte gMapSecName_Route22
	.4byte gMapSecName_Route23
	.4byte gMapSecName_Route24
	.4byte gMapSecName_Route25
	.4byte gMapSecName_ViridianForest
	.4byte gMapSecName_MtMoon
	.4byte gMapSecName_SSAnne
	.4byte gMapSecName_UndergroundPath
	.4byte gMapSecName_UndergroundPath_2
	.4byte gMapSecName_DiglettsCave
	.4byte gMapSecName_VictoryRoad
	.4byte gMapSecName_RocketHideout
	.4byte gMapSecName_SilphCo
	.4byte gMapSecName_PokemonMansion
	.4byte gMapSecName_SafariZone
	.4byte gMapSecName_PokemonLeague
	.4byte gMapSecName_RockTunnel
	.4byte gMapSecName_SeafoamIslands
	.4byte gMapSecName_PokemonTower
	.4byte gMapSecName_CeruleanCave
	.4byte gMapSecName_PowerPlant
	.4byte gMapSecName_OneIsland
	.4byte gMapSecName_TwoIsland
	.4byte gMapSecName_ThreeIsland
	.4byte gMapSecName_FourIsland
	.4byte gMapSecName_FiveIsland
	.4byte gMapSecName_SevenIsland
	.4byte gMapSecName_SixIsland
	.4byte gMapSecName_KindleRoad
	.4byte gMapSecName_TreasureBeach
	.4byte gMapSecName_CapeBrink
	.4byte gMapSecName_BondBridge
	.4byte gMapSecName_ThreeIslePort
	.4byte gMapSecName_SeviiIsle6
	.4byte gMapSecName_SeviiIsle7
	.4byte gMapSecName_SeviiIsle8
	.4byte gMapSecName_SeviiIsle9
	.4byte gMapSecName_ResortGorgeous
	.4byte gMapSecName_WaterLabyrinth
	.4byte gMapSecName_FiveIsleMeadow
	.4byte gMapSecName_MemorialPillar
	.4byte gMapSecName_OutcastIsland
	.4byte gMapSecName_GreenPath
	.4byte gMapSecName_WaterPath
	.4byte gMapSecName_RuinValley
	.4byte gMapSecName_TrainerTower
	.4byte gMapSecName_CanyonEntrance
	.4byte gMapSecName_SevaultCanyon
	.4byte gMapSecName_TanobyRuins
	.4byte gMapSecName_SeviiIsle22
	.4byte gMapSecName_SeviiIsle23
	.4byte gMapSecName_SeviiIsle24
	.4byte gMapSecName_NavelRock
	.4byte gMapSecName_MtEmber
	.4byte gMapSecName_BerryForest
	.4byte gMapSecName_IcefallCave
	.4byte gMapSecName_RocketWarehouse
	.4byte gMapSecName_TrainerTower_2
	.4byte gMapSecName_DottedHole
	.4byte gMapSecName_LostCave
	.4byte gMapSecName_PatternBush
	.4byte gMapSecName_AlteringCave
	.4byte gMapSecName_TanobyChambers
	.4byte gMapSecName_ThreeIslePath
	.4byte gMapSecName_TanobyKey
	.4byte gMapSecName_BirthIsland
	.4byte gMapSecName_MoneanChamber
	.4byte gMapSecName_LiptooChamber
	.4byte gMapSecName_WeepthChamber
	.4byte gMapSecName_DilfordChamber
	.4byte gMapSecName_ScufibChamber
	.4byte gMapSecName_RixyChamber
	.4byte gMapSecName_ViapoisChamber
	.4byte gMapSecName_EmberSpa
	.4byte gMapSecName_CeladonDept

gUnknown_83F1E60:: @ 83F1E60
	.incbin "baserom.gba", 0x3F1E60, 0x318

gUnknown_83F2178:: @ 83F2178
	.incbin "baserom.gba", 0x3F2178, 0x318

gUnknown_83F2490:: @ 83F2490
	.incbin "baserom.gba", 0x3F2490, 0x294

gUnknown_83F2724:: @ 83F2724
	.incbin "baserom.gba", 0x3F2724, 0x294

gUnknown_83F29B8:: @ 83F29B8
	.incbin "baserom.gba", 0x3F29B8, 0x294

gUnknown_83F2C4C:: @ 83F2C4C
	.incbin "baserom.gba", 0x3F2C4C, 0x294

gUnknown_83F2EE0:: @ 83F2EE0
	.incbin "baserom.gba", 0x3F2EE0, 0x144

gUnknown_83F3024:: @ 83F3024
	.incbin "baserom.gba", 0x3F3024, 0x2580
