	.section script_data, "aw", %progbits

    .include "data/script_cmd_table.inc"

    .align 2
gSpecialVars:: @ 815FD0C
	.4byte gSpecialVar_0x8000
	.4byte gSpecialVar_0x8001
	.4byte gSpecialVar_0x8002
	.4byte gSpecialVar_0x8003
	.4byte gSpecialVar_0x8004
	.4byte gSpecialVar_0x8005
	.4byte gSpecialVar_0x8006
	.4byte gSpecialVar_0x8007
	.4byte gSpecialVar_0x8008
	.4byte gSpecialVar_0x8009
	.4byte gSpecialVar_0x800A
	.4byte gSpecialVar_0x800B
	.4byte gSpecialVar_Facing
	.4byte gSpecialVar_Result
	.4byte gSpecialVar_ItemId
	.4byte gSpecialVar_LastTalked
	.4byte gSpecialVar_MonBoxId
	.4byte gSpecialVar_MonBoxPos
	.4byte gUnknown_20370DA
	.4byte gUnknown_20370DC
	.4byte gUnknown_20370DE

    .include "data/specials.inc"

    .align 2
gStdScripts:: @ 8160450
	.4byte gStdScript_81A667B
	.4byte gStdScript_81A67B3
	.4byte gStdScript_81A4E3F
	.4byte gStdScript_81A4E4A
	.4byte gStdScript_81A4E54
	.4byte gStdScript_81A4E5C
	.4byte gStdScript_81A501F
	.4byte gStdScript_81A676C
	.4byte gStdScript_81A8E58
	.4byte gStdScript_81A4E66
gStdScriptsEnd::

gMapScripts_UnknownMap_00_00:: @ 8160478
	.incbin "baserom.gba", 0x160478, 0x1

gMapScripts_UnknownMap_00_01:: @ 8160479
	.incbin "baserom.gba", 0x160479, 0x1

gMapScripts_UnknownMap_00_02:: @ 816047A
	.incbin "baserom.gba", 0x16047A, 0x1

gMapScripts_UnknownMap_00_03:: @ 816047B
	.incbin "baserom.gba", 0x16047B, 0x1

gMapScripts_UnknownMap_00_04:: @ 816047C
	.incbin "baserom.gba", 0x16047C, 0xA3

gMapScripts_ViridianForest:: @ 816051F
	.incbin "baserom.gba", 0x16051F, 0xC5

gMapScripts_MtMoon_1F:: @ 81605E4
	.incbin "baserom.gba", 0x1605E4, 0xB4

gMapScripts_MtMoon_B1F:: @ 8160698
	.incbin "baserom.gba", 0x160698, 0x1

gMapScripts_MtMoon_B2F:: @ 8160699
	.incbin "baserom.gba", 0x160699, 0x1A7

gMapScripts_SSAnne_Exterior:: @ 8160840
	.incbin "baserom.gba", 0x160840, 0x8B

gMapScripts_SSAnne_1F_Corridor:: @ 81608CB
	.incbin "baserom.gba", 0x1608CB, 0x13

gMapScripts_SSAnne_2F_Corridor:: @ 81608DE
	.incbin "baserom.gba", 0x1608DE, 0x17F

gMapScripts_SSAnne_3F_Corridor:: @ 8160A5D
	.incbin "baserom.gba", 0x160A5D, 0xA

gMapScripts_SSAnne_B1F_Corridor:: @ 8160A67
	.incbin "baserom.gba", 0x160A67, 0x1

gMapScripts_SSAnne_Deck:: @ 8160A68
	.incbin "baserom.gba", 0x160A68, 0x4A

gMapScripts_SSAnne_Kitchen:: @ 8160AB2
	.incbin "baserom.gba", 0x160AB2, 0x87

gMapScripts_SSAnne_CaptainsOffice:: @ 8160B39
	.incbin "baserom.gba", 0x160B39, 0xA2

gMapScripts_SSAnne_1F_Room1:: @ 8160BDB
	.incbin "baserom.gba", 0x160BDB, 0xA

gMapScripts_SSAnne_1F_Room2:: @ 8160BE5
	.incbin "baserom.gba", 0x160BE5, 0x38

gMapScripts_SSAnne_1F_Room3:: @ 8160C1D
	.incbin "baserom.gba", 0x160C1D, 0x26

gMapScripts_SSAnne_1F_Room4:: @ 8160C43
	.incbin "baserom.gba", 0x160C43, 0x23

gMapScripts_SSAnne_1F_Room5:: @ 8160C66
	.incbin "baserom.gba", 0x160C66, 0x18

gMapScripts_SSAnne_1F_Room7:: @ 8160C7E
	.incbin "baserom.gba", 0x160C7E, 0x18

gMapScripts_SSAnne_2F_Room1:: @ 8160C96
	.incbin "baserom.gba", 0x160C96, 0x1A

gMapScripts_SSAnne_2F_Room2:: @ 8160CB0
	.incbin "baserom.gba", 0x160CB0, 0x2F

gMapScripts_SSAnne_2F_Room3:: @ 8160CDF
	.incbin "baserom.gba", 0x160CDF, 0x13

gMapScripts_SSAnne_2F_Room4:: @ 8160CF2
	.incbin "baserom.gba", 0x160CF2, 0x2F

gMapScripts_SSAnne_2F_Room5:: @ 8160D21
	.incbin "baserom.gba", 0x160D21, 0x13

gMapScripts_SSAnne_2F_Room6:: @ 8160D34
	.incbin "baserom.gba", 0x160D34, 0x13

gMapScripts_SSAnne_B1F_Room1:: @ 8160D47
	.incbin "baserom.gba", 0x160D47, 0x2F

gMapScripts_SSAnne_B1F_Room2:: @ 8160D76
	.incbin "baserom.gba", 0x160D76, 0x18

gMapScripts_SSAnne_B1F_Room3:: @ 8160D8E
	.incbin "baserom.gba", 0x160D8E, 0x18

gMapScripts_SSAnne_B1F_Room4:: @ 8160DA6
	.incbin "baserom.gba", 0x160DA6, 0x2F

gMapScripts_SSAnne_B1F_Room5:: @ 8160DD5
	.incbin "baserom.gba", 0x160DD5, 0x1D

gMapScripts_SSAnne_1F_Room6:: @ 8160DF2
	.incbin "baserom.gba", 0x160DF2, 0x46

gMapScripts_UndergroundPath_NorthEntrance:: @ 8160E38
	.incbin "baserom.gba", 0x160E38, 0x7D

gMapScripts_UndergroundPath_NorthSouthTunnel:: @ 8160EB5
	.incbin "baserom.gba", 0x160EB5, 0xA

gMapScripts_UndergroundPath_SouthEntrance:: @ 8160EBF
	.incbin "baserom.gba", 0x160EBF, 0xA

gMapScripts_UndergroundPath_WestEntrance:: @ 8160EC9
	.incbin "baserom.gba", 0x160EC9, 0xA

gMapScripts_UndergroundPath_EastWestTunnel:: @ 8160ED3
	.incbin "baserom.gba", 0x160ED3, 0xA

gMapScripts_UndergroundPath_EastEntrance:: @ 8160EDD
	.incbin "baserom.gba", 0x160EDD, 0xA

gMapScripts_DiglettsCave_NorthEntrance:: @ 8160EE7
	.incbin "baserom.gba", 0x160EE7, 0xA

gMapScripts_DiglettsCave_B1F:: @ 8160EF1
	.incbin "baserom.gba", 0x160EF1, 0xA

gMapScripts_DiglettsCave_SouthEntrance:: @ 8160EFB
	.incbin "baserom.gba", 0x160EFB, 0xA

gMapScripts_VictoryRoad_1F:: @ 8160F05
	.incbin "baserom.gba", 0x160F05, 0x8D

gMapScripts_VictoryRoad_2F:: @ 8160F92
	.incbin "baserom.gba", 0x160F92, 0x118

gMapScripts_VictoryRoad_3F:: @ 81610AA
	.incbin "baserom.gba", 0x1610AA, 0xEB

gMapScripts_RocketHideout_B1F:: @ 8161195
	.incbin "baserom.gba", 0x161195, 0x10C

gMapScripts_RocketHideout_B2F:: @ 81612A1
	.incbin "baserom.gba", 0x1612A1, 0x18

gMapScripts_RocketHideout_B3F:: @ 81612B9
	.incbin "baserom.gba", 0x1612B9, 0x2F

gMapScripts_RocketHideout_B4F:: @ 81612E8
	.incbin "baserom.gba", 0x1612E8, 0x1F0

gMapScripts_RocketHideout_Elevator:: @ 81614D8
	.incbin "baserom.gba", 0x1614D8, 0x14D

gMapScripts_SilphCo_1F:: @ 8161625
	.incbin "baserom.gba", 0x161625, 0x1C

gMapScripts_SilphCo_2F:: @ 8161641
	.incbin "baserom.gba", 0x161641, 0x84

gMapScripts_SilphCo_3F:: @ 81616C5
	.incbin "baserom.gba", 0x1616C5, 0x71

gMapScripts_SilphCo_4F:: @ 8161736
	.incbin "baserom.gba", 0x161736, 0x88

gMapScripts_SilphCo_5F:: @ 81617BE
	.incbin "baserom.gba", 0x1617BE, 0xC3

gMapScripts_SilphCo_6F:: @ 8161881
	.incbin "baserom.gba", 0x161881, 0x103

gMapScripts_SilphCo_7F:: @ 8161984
	.incbin "baserom.gba", 0x161984, 0x2DB

gMapScripts_SilphCo_8F:: @ 8161C5F
	.incbin "baserom.gba", 0x161C5F, 0x7F

gMapScripts_SilphCo_9F:: @ 8161CDE
	.incbin "baserom.gba", 0x161CDE, 0xA8

gMapScripts_SilphCo_10F:: @ 8161D86
	.incbin "baserom.gba", 0x161D86, 0x68

gMapScripts_SilphCo_11F:: @ 8161DEE
	.incbin "baserom.gba", 0x161DEE, 0x180

gMapScripts_SilphCo_Elevator:: @ 8161F6E
	.incbin "baserom.gba", 0x161F6E, 0x28B

gMapScripts_PokemonMansion_1F:: @ 81621F9
	.incbin "baserom.gba", 0x1621F9, 0x5B

gMapScripts_PokemonMansion_2F:: @ 8162254
	.incbin "baserom.gba", 0x162254, 0x4D

gMapScripts_PokemonMansion_3F:: @ 81622A1
	.incbin "baserom.gba", 0x1622A1, 0x5B

gMapScripts_PokemonMansion_B1F:: @ 81622FC
	.incbin "baserom.gba", 0x1622FC, 0x5B

gMapScripts_SafariZone_Center:: @ 8162357
	.incbin "baserom.gba", 0x162357, 0x25

gMapScripts_SafariZone_East:: @ 816237C
	.incbin "baserom.gba", 0x16237C, 0x1C

gMapScripts_SafariZone_North:: @ 8162398
	.incbin "baserom.gba", 0x162398, 0x2E

gMapScripts_SafariZone_West:: @ 81623C6
	.incbin "baserom.gba", 0x1623C6, 0x25

gMapScripts_SafariZone_Building1:: @ 81623EB
	.incbin "baserom.gba", 0x1623EB, 0x13

gMapScripts_SafariZone_Building2:: @ 81623FE
	.incbin "baserom.gba", 0x1623FE, 0x1C

gMapScripts_SafariZone_Building3:: @ 816241A
	.incbin "baserom.gba", 0x16241A, 0x1C

gMapScripts_SafariZone_Building4:: @ 8162436
	.incbin "baserom.gba", 0x162436, 0x1C

gMapScripts_SafariZone_SecretHouse:: @ 8162452
	.incbin "baserom.gba", 0x162452, 0x61

gMapScripts_CeruleanCave_1F:: @ 81624B3
	.incbin "baserom.gba", 0x1624B3, 0xA

gMapScripts_CeruleanCave_2F:: @ 81624BD
	.incbin "baserom.gba", 0x1624BD, 0x1

gMapScripts_CeruleanCave_B1F:: @ 81624BE
	.incbin "baserom.gba", 0x1624BE, 0xAE

gMapScripts_PokemonLeague_LoreleisRoom:: @ 816256C
	.incbin "baserom.gba", 0x16256C, 0x119

gMapScripts_PokemonLeague_BrunosRoom:: @ 8162685
	.incbin "baserom.gba", 0x162685, 0x18B

gMapScripts_PokemonLeague_AgathasRoom:: @ 8162810
	.incbin "baserom.gba", 0x162810, 0x11D

gMapScripts_PokemonLeague_LancesRoom:: @ 816292D
	.incbin "baserom.gba", 0x16292D, 0x1B5

gMapScripts_PokemonLeague_ChampionsRoom:: @ 8162AE2
	.incbin "baserom.gba", 0x162AE2, 0x26A

gMapScripts_PokemonLeague_HallOfFame:: @ 8162D4C
	.incbin "baserom.gba", 0x162D4C, 0x8A

gMapScripts_RockTunnel_1F:: @ 8162DD6
	.incbin "baserom.gba", 0x162DD6, 0xB4

gMapScripts_RockTunnel_B1F:: @ 8162E8A
	.incbin "baserom.gba", 0x162E8A, 0xB9

gMapScripts_SeafoamIslands_1F:: @ 8162F43
	.incbin "baserom.gba", 0x162F43, 0xA

gMapScripts_SeafoamIslands_B1F:: @ 8162F4D
	.incbin "baserom.gba", 0x162F4D, 0x1

gMapScripts_SeafoamIslands_B2F:: @ 8162F4E
	.incbin "baserom.gba", 0x162F4E, 0x1

gMapScripts_SeafoamIslands_B3F:: @ 8162F4F
	.incbin "baserom.gba", 0x162F4F, 0xDF

gMapScripts_SeafoamIslands_B4F:: @ 816302E
	.incbin "baserom.gba", 0x16302E, 0x207

gMapScripts_PokemonTower_1F:: @ 8163235
	.incbin "baserom.gba", 0x163235, 0x50

gMapScripts_PokemonTower_2F:: @ 8163285
	.incbin "baserom.gba", 0x163285, 0x121

gMapScripts_PokemonTower_3F:: @ 81633A6
	.incbin "baserom.gba", 0x1633A6, 0x46

gMapScripts_PokemonTower_4F:: @ 81633EC
	.incbin "baserom.gba", 0x1633EC, 0x46

gMapScripts_PokemonTower_5F:: @ 8163432
	.incbin "baserom.gba", 0x163432, 0x85

gMapScripts_PokemonTower_6F:: @ 81634B7
	.incbin "baserom.gba", 0x1634B7, 0xA2

gMapScripts_PokemonTower_7F:: @ 8163559
	.incbin "baserom.gba", 0x163559, 0x20B

gMapScripts_PowerPlant:: @ 8163764
	.incbin "baserom.gba", 0x163764, 0x187

gMapScripts_MtEmber_RubyPath_B4F:: @ 81638EB
	.incbin "baserom.gba", 0x1638EB, 0x5B

gMapScripts_MtEmber_Exterior:: @ 8163946
	.incbin "baserom.gba", 0x163946, 0x1B3

gMapScripts_MtEmber_SummitPath_1F:: @ 8163AF9
	.incbin "baserom.gba", 0x163AF9, 0x1

gMapScripts_MtEmber_SummitPath_2F:: @ 8163AFA
	.incbin "baserom.gba", 0x163AFA, 0x1

gMapScripts_MtEmber_SummitPath_3F:: @ 8163AFB
	.incbin "baserom.gba", 0x163AFB, 0x1

gMapScripts_MtEmber_Summit:: @ 8163AFC
	.incbin "baserom.gba", 0x163AFC, 0xAE

gMapScripts_MtEmber_RubyPath_B5F:: @ 8163BAA
	.incbin "baserom.gba", 0x163BAA, 0x9B

gMapScripts_SSAnne_Kitchen3:: @ 8163C45
	.incbin "baserom.gba", 0x163C45, 0x1

gMapScripts_MtEmber_RubyPath_B1F:: @ 8163C46
	.incbin "baserom.gba", 0x163C46, 0x1

gMapScripts_MtEmber_RubyPath_B2F:: @ 8163C47
	.incbin "baserom.gba", 0x163C47, 0x1

gMapScripts_MtEmber_RubyPath_B3F:: @ 8163C48
	.incbin "baserom.gba", 0x163C48, 0x27

gMapScripts_MtEmber_RubyPath_B1F_Stairs:: @ 8163C6F
	.incbin "baserom.gba", 0x163C6F, 0x1

gMapScripts_MtEmber_RubyPath_B2F_Stairs:: @ 8163C70
	.incbin "baserom.gba", 0x163C70, 0x1

gMapScripts_ThreeIsland_BerryForest:: @ 8163C71
	.incbin "baserom.gba", 0x163C71, 0xC9

gMapScripts_FourIsland_IcefallCave_Entrance:: @ 8163D3A
	.incbin "baserom.gba", 0x163D3A, 0xA

gMapScripts_FourIsland_IcefallCave_1F:: @ 8163D44
	.incbin "baserom.gba", 0x163D44, 0x3D

gMapScripts_SSAnne_CaptainsOffice2:: @ 8163D81
	.incbin "baserom.gba", 0x163D81, 0x1

gMapScripts_SSAnne_CaptainsOffice3:: @ 8163D82
	.incbin "baserom.gba", 0x163D82, 0x1AC

gMapScripts_SSAnne_CaptainsOffice4:: @ 8163F2E
	.incbin "baserom.gba", 0x163F2E, 0x254

gMapScripts_SSAnne_CaptainsOffice5:: @ 8164182
	.incbin "baserom.gba", 0x164182, 0x2E

gMapScripts_SixIsland_DottedHole_B1F:: @ 81641B0
	.incbin "baserom.gba", 0x1641B0, 0x1

gMapScripts_SixIsland_DottedHole_B2F:: @ 81641B1
	.incbin "baserom.gba", 0x1641B1, 0x1

gMapScripts_SixIsland_DottedHole_B3F:: @ 81641B2
	.incbin "baserom.gba", 0x1641B2, 0x1

gMapScripts_SSAnne_CaptainsOffice9:: @ 81641B3
	.incbin "baserom.gba", 0x1641B3, 0x1

gMapScripts_SixIsland_DottedHole_SapphireRoom:: @ 81641B4
	.incbin "baserom.gba", 0x1641B4, 0x3A5

gMapScripts_SSAnne_1F_Room11:: @ 8164559
	.incbin "baserom.gba", 0x164559, 0x14B

gMapScripts_SSAnne_1F_Room12:: @ 81646A4
	.incbin "baserom.gba", 0x1646A4, 0xA

gMapScripts_NavelRock_Exterior:: @ 81646AE
	.incbin "baserom.gba", 0x1646AE, 0xA

gMapScripts_SevenIsland_TrainerTower_1F:: @ 81646B8
	.incbin "baserom.gba", 0x1646B8, 0x2E

gMapScripts_SevenIsland_TrainerTower_2F:: @ 81646E6
	.incbin "baserom.gba", 0x1646E6, 0x2E

gMapScripts_SevenIsland_TrainerTower_3F:: @ 8164714
	.incbin "baserom.gba", 0x164714, 0x2E

gMapScripts_SevenIsland_TrainerTower_4F:: @ 8164742
	.incbin "baserom.gba", 0x164742, 0x2E

gMapScripts_SevenIsland_TrainerTower_5F:: @ 8164770
	.incbin "baserom.gba", 0x164770, 0x2E

gMapScripts_SevenIsland_TrainerTower_6F:: @ 816479E
	.incbin "baserom.gba", 0x16479E, 0x2E

gMapScripts_SevenIsland_TrainerTower_7F:: @ 81647CC
	.incbin "baserom.gba", 0x1647CC, 0x2E

gMapScripts_SevenIsland_TrainerTower_8F:: @ 81647FA
	.incbin "baserom.gba", 0x1647FA, 0x2E

gMapScripts_SevenIsland_TrainerTower_Roof:: @ 8164828
	.incbin "baserom.gba", 0x164828, 0x11

gMapScripts_SevenIsland_TrainerTower_Lobby:: @ 8164839
	.incbin "baserom.gba", 0x164839, 0x2BF

gMapScripts_SevenIsland_TrainerTower_Elevator:: @ 8164AF8
	.incbin "baserom.gba", 0x164AF8, 0xF4

gMapScripts_FiveIsland_LostCave_Entrance:: @ 8164BEC
	.incbin "baserom.gba", 0x164BEC, 0xA

gMapScripts_FiveIsland_LostCave_Room1:: @ 8164BF6
	.incbin "baserom.gba", 0x164BF6, 0x18

gMapScripts_FiveIsland_LostCave_Room2:: @ 8164C0E
	.incbin "baserom.gba", 0x164C0E, 0x1

gMapScripts_FiveIsland_LostCave_Room3:: @ 8164C0F
	.incbin "baserom.gba", 0x164C0F, 0x1

gMapScripts_FiveIsland_LostCave_Room4:: @ 8164C10
	.incbin "baserom.gba", 0x164C10, 0x18

gMapScripts_FiveIsland_LostCave_Room5:: @ 8164C28
	.incbin "baserom.gba", 0x164C28, 0x1

gMapScripts_FiveIsland_LostCave_Room6:: @ 8164C29
	.incbin "baserom.gba", 0x164C29, 0x1

gMapScripts_FiveIsland_LostCave_Room7:: @ 8164C2A
	.incbin "baserom.gba", 0x164C2A, 0x1

gMapScripts_FiveIsland_LostCave_Room8:: @ 8164C2B
	.incbin "baserom.gba", 0x164C2B, 0x1

gMapScripts_FiveIsland_LostCave_Room9:: @ 8164C2C
	.incbin "baserom.gba", 0x164C2C, 0x1

gMapScripts_FiveIsland_LostCave_Room10:: @ 8164C2D
	.incbin "baserom.gba", 0x164C2D, 0x9E

gMapScripts_FiveIsland_LostCave_Room11:: @ 8164CCB
	.incbin "baserom.gba", 0x164CCB, 0x1

gMapScripts_FiveIsland_LostCave_Room12:: @ 8164CCC
	.incbin "baserom.gba", 0x164CCC, 0x1

gMapScripts_FiveIsland_LostCave_Room13:: @ 8164CCD
	.incbin "baserom.gba", 0x164CCD, 0x1

gMapScripts_FiveIsland_LostCave_Room14:: @ 8164CCE
	.incbin "baserom.gba", 0x164CCE, 0x1

gMapScripts_SevenIsland_TanobyRuins_MoneanChamber:: @ 8164CCF
	.incbin "baserom.gba", 0x164CCF, 0xF

gMapScripts_SevenIsland_TanobyRuins_LiptooChamber:: @ 8164CDE
	.incbin "baserom.gba", 0x164CDE, 0xC

gMapScripts_SevenIsland_TanobyRuins_WeepthChamber:: @ 8164CEA
	.incbin "baserom.gba", 0x164CEA, 0xC

gMapScripts_SevenIsland_TanobyRuins_DilfordChamber:: @ 8164CF6
	.incbin "baserom.gba", 0x164CF6, 0xC

gMapScripts_SevenIsland_TanobyRuins_ScufibChamber:: @ 8164D02
	.incbin "baserom.gba", 0x164D02, 0xC

gMapScripts_SevenIsland_TanobyRuins_RixyChamber:: @ 8164D0E
	.incbin "baserom.gba", 0x164D0E, 0xC

gMapScripts_SevenIsland_TanobyRuins_ViapoisChamber:: @ 8164D1A
	.incbin "baserom.gba", 0x164D1A, 0xC

gMapScripts_ThreeIsland_DunsparceTunnel:: @ 8164D26
	.incbin "baserom.gba", 0x164D26, 0xA6

gMapScripts_SevenIsland_SeavaultCanyon_TanobyKey:: @ 8164DCC
	.incbin "baserom.gba", 0x164DCC, 0x1D2

gMapScripts_NavelRock_1F:: @ 8164F9E
	.incbin "baserom.gba", 0x164F9E, 0x1

gMapScripts_NavelRock_Summit:: @ 8164F9F
	.incbin "baserom.gba", 0x164F9F, 0x148

gMapScripts_NavelRock_Base:: @ 81650E7
	.incbin "baserom.gba", 0x1650E7, 0x10B

gMapScripts_NavelRock_SummitPath_2F:: @ 81651F2
	.incbin "baserom.gba", 0x1651F2, 0x1

gMapScripts_NavelRock_SummitPath_3F:: @ 81651F3
	.incbin "baserom.gba", 0x1651F3, 0x1

gMapScripts_NavelRock_SummitPath_4F:: @ 81651F4
	.incbin "baserom.gba", 0x1651F4, 0x1

gMapScripts_NavelRock_SummitPath_5F:: @ 81651F5
	.incbin "baserom.gba", 0x1651F5, 0x1

gMapScripts_NavelRock_BasePath_B1F:: @ 81651F6
	.incbin "baserom.gba", 0x1651F6, 0x1

gMapScripts_NavelRock_BasePath_B2F:: @ 81651F7
	.incbin "baserom.gba", 0x1651F7, 0x1

gMapScripts_NavelRock_BasePath_B3F:: @ 81651F8
	.incbin "baserom.gba", 0x1651F8, 0x1

gMapScripts_NavelRock_BasePath_B4F:: @ 81651F9
	.incbin "baserom.gba", 0x1651F9, 0x1

gMapScripts_NavelRock_BasePath_B5F:: @ 81651FA
	.incbin "baserom.gba", 0x1651FA, 0x1

gMapScripts_NavelRock_BasePath_B6F:: @ 81651FB
	.incbin "baserom.gba", 0x1651FB, 0x1

gMapScripts_NavelRock_BasePath_B7F:: @ 81651FC
	.incbin "baserom.gba", 0x1651FC, 0x1

gMapScripts_NavelRock_BasePath_B8F:: @ 81651FD
	.incbin "baserom.gba", 0x1651FD, 0x1

gMapScripts_NavelRock_BasePath_B9F:: @ 81651FE
	.incbin "baserom.gba", 0x1651FE, 0x1

gMapScripts_NavelRock_BasePath_B10F:: @ 81651FF
	.incbin "baserom.gba", 0x1651FF, 0x1

gMapScripts_NavelRock_BasePath_B11F:: @ 8165200
	.incbin "baserom.gba", 0x165200, 0x1

gMapScripts_NavelRock_B1F:: @ 8165201
	.incbin "baserom.gba", 0x165201, 0x1

gMapScripts_NavelRock_Fork:: @ 8165202
	.incbin "baserom.gba", 0x165202, 0x1

gMapScripts_BirthIsland_Exterior:: @ 8165203
	.incbin "baserom.gba", 0x165203, 0x158

gMapScripts_OneIsland_KindleRoad_EmberSpa:: @ 816535B
	.incbin "baserom.gba", 0x16535B, 0x8B

gMapScripts_BirthIsland_Harbor:: @ 81653E6
	.incbin "baserom.gba", 0x1653E6, 0x3A

gMapScripts_NavelRock_Harbor:: @ 8165420
	.incbin "baserom.gba", 0x165420, 0x3A

gMapScripts_PalletTown:: @ 816545A
	.incbin "baserom.gba", 0x16545A, 0x479

gMapScripts_ViridianCity:: @ 81658D3
	.incbin "baserom.gba", 0x1658D3, 0x2BB

gMapScripts_PewterCity:: @ 8165B8E
	.incbin "baserom.gba", 0x165B8E, 0x8E3

gMapScripts_CeruleanCity:: @ 8166471
	.incbin "baserom.gba", 0x166471, 0x3FA

gMapScripts_LavenderTown:: @ 816686B
	.incbin "baserom.gba", 0x16686B, 0x71

gMapScripts_VermilionCity:: @ 81668DC
	.incbin "baserom.gba", 0x1668DC, 0x3B3

gMapScripts_CeladonCity:: @ 8166C8F
	.incbin "baserom.gba", 0x166C8F, 0xE6

gMapScripts_FuchsiaCity:: @ 8166D75
	.incbin "baserom.gba", 0x166D75, 0x161

gMapScripts_CinnabarIsland:: @ 8166ED6
	.incbin "baserom.gba", 0x166ED6, 0x365

gMapScripts_IndigoPlateau_Exterior:: @ 816723B
	.incbin "baserom.gba", 0x16723B, 0x124

gMapScripts_SaffronCity_Duplicate:: @ 816735F
	.incbin "baserom.gba", 0x16735F, 0x124

gMapScripts_SaffronCity:: @ 8167483
	.incbin "baserom.gba", 0x167483, 0x1

gMapScripts_OneIsland:: @ 8167484
	.incbin "baserom.gba", 0x167484, 0xE0

gMapScripts_TwoIsland:: @ 8167564
	.incbin "baserom.gba", 0x167564, 0x249

gMapScripts_ThreeIsland:: @ 81677AD
	.incbin "baserom.gba", 0x1677AD, 0x501

gMapScripts_FourIsland:: @ 8167CAE
	.incbin "baserom.gba", 0x167CAE, 0x1E0

gMapScripts_FiveIsland:: @ 8167E8E
	.incbin "baserom.gba", 0x167E8E, 0x25

gMapScripts_SevenIsland:: @ 8167EB3
	.incbin "baserom.gba", 0x167EB3, 0x25

gMapScripts_SixIsland:: @ 8167ED8
	.incbin "baserom.gba", 0x167ED8, 0x25

gMapScripts_Route1:: @ 8167EFD
	.incbin "baserom.gba", 0x167EFD, 0x67

gMapScripts_Route2:: @ 8167F64
	.incbin "baserom.gba", 0x167F64, 0x13

gMapScripts_Route3:: @ 8167F77
	.incbin "baserom.gba", 0x167F77, 0x13

gMapScripts_Route4:: @ 8167F8A
	.incbin "baserom.gba", 0x167F8A, 0x1D

gMapScripts_Route5:: @ 8167FA7
	.incbin "baserom.gba", 0x167FA7, 0xA

gMapScripts_Route6:: @ 8167FB1
	.incbin "baserom.gba", 0x167FB1, 0xA

gMapScripts_Route7:: @ 8167FBB
	.incbin "baserom.gba", 0x167FBB, 0xA

gMapScripts_Route8:: @ 8167FC5
	.incbin "baserom.gba", 0x167FC5, 0xA

gMapScripts_Route9:: @ 8167FCF
	.incbin "baserom.gba", 0x167FCF, 0xA

gMapScripts_Route10:: @ 8167FD9
	.incbin "baserom.gba", 0x167FD9, 0x1D

gMapScripts_Route11:: @ 8167FF6
	.incbin "baserom.gba", 0x167FF6, 0xA

gMapScripts_Route12:: @ 8168000
	.incbin "baserom.gba", 0x168000, 0xB5

gMapScripts_Route13:: @ 81680B5
	.incbin "baserom.gba", 0x1680B5, 0x1C

gMapScripts_Route14:: @ 81680D1
	.incbin "baserom.gba", 0x1680D1, 0xA

gMapScripts_Route15:: @ 81680DB
	.incbin "baserom.gba", 0x1680DB, 0xA

gMapScripts_Route16:: @ 81680E5
	.incbin "baserom.gba", 0x1680E5, 0xDA

gMapScripts_Route17:: @ 81681BF
	.incbin "baserom.gba", 0x1681BF, 0x37

gMapScripts_Route18:: @ 81681F6
	.incbin "baserom.gba", 0x1681F6, 0x3B

gMapScripts_Route19:: @ 8168231
	.incbin "baserom.gba", 0x168231, 0xA

gMapScripts_Route20:: @ 816823B
	.incbin "baserom.gba", 0x16823B, 0x4E

gMapScripts_Route21_North:: @ 8168289
	.incbin "baserom.gba", 0x168289, 0x1

gMapScripts_Route21_South:: @ 816828A
	.incbin "baserom.gba", 0x16828A, 0x1

gMapScripts_Route22:: @ 816828B
	.incbin "baserom.gba", 0x16828B, 0x260

gMapScripts_Route23:: @ 81684EB
	.incbin "baserom.gba", 0x1684EB, 0x134

gMapScripts_Route24:: @ 816861F
	.incbin "baserom.gba", 0x16861F, 0x126

gMapScripts_Route25:: @ 8168745
	.incbin "baserom.gba", 0x168745, 0x13

gMapScripts_OneIsland_KindleRoad:: @ 8168758
	.incbin "baserom.gba", 0x168758, 0x13

gMapScripts_OneIsland_TreasureBeach:: @ 816876B
	.incbin "baserom.gba", 0x16876B, 0xA

gMapScripts_TwoIsland_CapeBrink:: @ 8168775
	.incbin "baserom.gba", 0x168775, 0x1

gMapScripts_ThreeIsland_BondBridge:: @ 8168776
	.incbin "baserom.gba", 0x168776, 0x13

gMapScripts_ThreeIsland_Port:: @ 8168789
	.incbin "baserom.gba", 0x168789, 0x57

gMapScripts_UnknownMap_03_50:: @ 81687E0
	.incbin "baserom.gba", 0x1687E0, 0x1

gMapScripts_UnknownMap_03_51:: @ 81687E1
	.incbin "baserom.gba", 0x1687E1, 0x1

gMapScripts_UnknownMap_03_52:: @ 81687E2
	.incbin "baserom.gba", 0x1687E2, 0x1

gMapScripts_UnknownMap_03_53:: @ 81687E3
	.incbin "baserom.gba", 0x1687E3, 0x1

gMapScripts_FiveIsland_ResortGorgeous:: @ 81687E4
	.incbin "baserom.gba", 0x1687E4, 0x69

gMapScripts_FiveIsland_WaterLabyrinth:: @ 816884D
	.incbin "baserom.gba", 0x16884D, 0xE5

gMapScripts_FiveIsland_Meadow:: @ 8168932
	.incbin "baserom.gba", 0x168932, 0xA0

gMapScripts_FiveIsland_MemorialPillar:: @ 81689D2
	.incbin "baserom.gba", 0x1689D2, 0x143

gMapScripts_SixIsland_OutcastIsland:: @ 8168B15
	.incbin "baserom.gba", 0x168B15, 0x18

gMapScripts_SixIsland_GreenPath:: @ 8168B2D
	.incbin "baserom.gba", 0x168B2D, 0x13

gMapScripts_SixIsland_WaterPath:: @ 8168B40
	.incbin "baserom.gba", 0x168B40, 0x13

gMapScripts_SixIsland_RuinValley:: @ 8168B53
	.incbin "baserom.gba", 0x168B53, 0x82

gMapScripts_SevenIsland_TrainerTower:: @ 8168BD5
	.incbin "baserom.gba", 0x168BD5, 0x1E

gMapScripts_SevenIsland_SevaultCanyon_Entrance:: @ 8168BF3
	.incbin "baserom.gba", 0x168BF3, 0xA

gMapScripts_SevenIsland_SevaultCanyon:: @ 8168BFD
	.incbin "baserom.gba", 0x168BFD, 0xA

gMapScripts_SevenIsland_TanobyRuins:: @ 8168C07
	.incbin "baserom.gba", 0x168C07, 0x1

gMapScripts_PalletTown_PlayersHouse_1F:: @ 8168C08
	.incbin "baserom.gba", 0x168C08, 0x9B

gMapScripts_PalletTown_PlayersHouse_2F:: @ 8168CA3
	.incbin "baserom.gba", 0x168CA3, 0x41

gUnknown_8168CE4:: @ 8168CE4
	.incbin "baserom.gba", 0x168CE4, 0x33

gUnknown_8168D17:: @ 8168D17
	.incbin "baserom.gba", 0x168D17, 0x10

gMapScripts_PalletTown_GarysHouse:: @ 8168D27
	.incbin "baserom.gba", 0x168D27, 0x257

gMapScripts_PalletTown_ProfessorOaksLab:: @ 8168F7E
	.incbin "baserom.gba", 0x168F7E, 0xF1C

gMapScripts_ViridianCity_House1:: @ 8169E9A
	.incbin "baserom.gba", 0x169E9A, 0x2F

gMapScripts_ViridianCity_Gym:: @ 8169EC9
	.incbin "baserom.gba", 0x169EC9, 0x1B3

gMapScripts_ViridianCity_House2:: @ 816A07C
	.incbin "baserom.gba", 0x16A07C, 0x157

gMapScripts_ViridianCity_Mart:: @ 816A1D3
	.incbin "baserom.gba", 0x16A1D3, 0xED

gMapScripts_ViridianCity_PokemonCenter_1F:: @ 816A2C0
	.incbin "baserom.gba", 0x16A2C0, 0x33

gMapScripts_ViridianCity_PokemonCenter_2F:: @ 816A2F3
	.incbin "baserom.gba", 0x16A2F3, 0x27

gMapScripts_PewterCity_Museum_1F:: @ 816A31A
	.incbin "baserom.gba", 0x16A31A, 0x238

gMapScripts_PewterCity_Museum_2F:: @ 816A552
	.incbin "baserom.gba", 0x16A552, 0x40

gMapScripts_PewterCity_Gym:: @ 816A592
	.incbin "baserom.gba", 0x16A592, 0x13B

gMapScripts_PewterCity_Mart:: @ 816A6CD
	.incbin "baserom.gba", 0x16A6CD, 0x4F

gMapScripts_PewterCity_House1:: @ 816A71C
	.incbin "baserom.gba", 0x16A71C, 0x44

gMapScripts_PewterCity_PokemonCenter_1F:: @ 816A760
	.incbin "baserom.gba", 0x16A760, 0x55

gMapScripts_PewterCity_PokemonCenter_2F:: @ 816A7B5
	.incbin "baserom.gba", 0x16A7B5, 0x27

gMapScripts_PewterCity_House2:: @ 816A7DC
	.incbin "baserom.gba", 0x16A7DC, 0x13

gMapScripts_CeruleanCity_House1:: @ 816A7EF
	.incbin "baserom.gba", 0x16A7EF, 0x186

gMapScripts_CeruleanCity_House2:: @ 816A975
	.incbin "baserom.gba", 0x16A975, 0x32

gMapScripts_CeruleanCity_House3:: @ 816A9A7
	.incbin "baserom.gba", 0x16A9A7, 0x86

gMapScripts_CeruleanCity_PokemonCenter_1F:: @ 816AA2D
	.incbin "baserom.gba", 0x16AA2D, 0x4C

gMapScripts_CeruleanCity_PokemonCenter_2F:: @ 816AA79
	.incbin "baserom.gba", 0x16AA79, 0x27

gMapScripts_CeruleanCity_Gym:: @ 816AAA0
	.incbin "baserom.gba", 0x16AAA0, 0x11C

gMapScripts_CeruleanCity_BikeShop:: @ 816ABBC
	.incbin "baserom.gba", 0x16ABBC, 0xE1

gMapScripts_CeruleanCity_Mart:: @ 816AC9D
	.incbin "baserom.gba", 0x16AC9D, 0x51

gMapScripts_CeruleanCity_House4:: @ 816ACEE
	.incbin "baserom.gba", 0x16ACEE, 0x161

gMapScripts_CeruleanCity_House5:: @ 816AE4F
	.incbin "baserom.gba", 0x16AE4F, 0x2A0

gMapScripts_LavenderTown_PokemonCenter_1F:: @ 816B0EF
	.incbin "baserom.gba", 0x16B0EF, 0x33

gMapScripts_LavenderTown_PokemonCenter_2F:: @ 816B122
	.incbin "baserom.gba", 0x16B122, 0x27

gMapScripts_LavenderTown_VolunteerPokemonHouse:: @ 816B149
	.incbin "baserom.gba", 0x16B149, 0xE9

gMapScripts_LavenderTown_House1:: @ 816B232
	.incbin "baserom.gba", 0x16B232, 0x33

gMapScripts_LavenderTown_House2:: @ 816B265
	.incbin "baserom.gba", 0x16B265, 0xEA

gMapScripts_LavenderTown_Mart:: @ 816B34F
	.incbin "baserom.gba", 0x16B34F, 0x57

gMapScripts_VermilionCity_House1:: @ 816B3A6
	.incbin "baserom.gba", 0x16B3A6, 0x7E

gMapScripts_VermilionCity_PokemonCenter_1F:: @ 816B424
	.incbin "baserom.gba", 0x16B424, 0x33

gMapScripts_VermilionCity_PokemonCenter_2F:: @ 816B457
	.incbin "baserom.gba", 0x16B457, 0x27

gMapScripts_VermilionCity_PokemonFanClub:: @ 816B47E
	.incbin "baserom.gba", 0x16B47E, 0x158

gMapScripts_VermilionCity_House2:: @ 816B5D6
	.incbin "baserom.gba", 0x16B5D6, 0x7D

gMapScripts_VermilionCity_Mart:: @ 816B653
	.incbin "baserom.gba", 0x16B653, 0x4B

gMapScripts_VermilionCity_Gym:: @ 816B69E
	.incbin "baserom.gba", 0x16B69E, 0x40B

gMapScripts_VermilionCity_House3:: @ 816BAA9
	.incbin "baserom.gba", 0x16BAA9, 0x2F

gMapScripts_CeladonCity_DepartmentStore_1F:: @ 816BAD8
	.incbin "baserom.gba", 0x16BAD8, 0x1C

gMapScripts_CeladonCity_DepartmentStore_2F:: @ 816BAF4
	.incbin "baserom.gba", 0x16BAF4, 0x90

gMapScripts_CeladonCity_DepartmentStore_3F:: @ 816BB84
	.incbin "baserom.gba", 0x16BB84, 0x6A

gMapScripts_CeladonCity_DepartmentStore_4F:: @ 816BBEE
	.incbin "baserom.gba", 0x16BBEE, 0x52

gMapScripts_CeladonCity_DepartmentStore_5F:: @ 816BC40
	.incbin "baserom.gba", 0x16BC40, 0x8C

gMapScripts_CeladonCity_DepartmentStore_Roof:: @ 816BCCC
	.incbin "baserom.gba", 0x16BCCC, 0x486

gMapScripts_CeladonCity_DepartmentStore_Elevator:: @ 816C152
	.incbin "baserom.gba", 0x16C152, 0x1CE

gMapScripts_CeladonCity_Condominiums_1F:: @ 816C320
	.incbin "baserom.gba", 0x16C320, 0xB0

gMapScripts_CeladonCity_Condominiums_2F:: @ 816C3D0
	.incbin "baserom.gba", 0x16C3D0, 0xA

gMapScripts_CeladonCity_Condominiums_3F:: @ 816C3DA
	.incbin "baserom.gba", 0x16C3DA, 0x7F

gMapScripts_CeladonCity_Condominiums_Roof:: @ 816C459
	.incbin "baserom.gba", 0x16C459, 0xA

gMapScripts_CeladonCity_Condominiums_RoofRoom:: @ 816C463
	.incbin "baserom.gba", 0x16C463, 0x189

gMapScripts_CeladonCity_PokemonCenter_1F:: @ 816C5EC
	.incbin "baserom.gba", 0x16C5EC, 0x33

gMapScripts_CeladonCity_PokemonCenter_2F:: @ 816C61F
	.incbin "baserom.gba", 0x16C61F, 0x27

gMapScripts_CeladonCity_GameCorner:: @ 816C646
	.incbin "baserom.gba", 0x16C646, 0x52F

gMapScripts_CeladonCity_GameCorner_PrizeRoom:: @ 816CB75
	.incbin "baserom.gba", 0x16CB75, 0x4EB

gMapScripts_CeladonCity_Gym:: @ 816D060
	.incbin "baserom.gba", 0x16D060, 0x18A

gMapScripts_CeladonCity_Restaurant:: @ 816D1EA
	.incbin "baserom.gba", 0x16D1EA, 0x7D

gMapScripts_CeladonCity_House1:: @ 816D267
	.incbin "baserom.gba", 0x16D267, 0x1C

gMapScripts_CeladonCity_Hotel:: @ 816D283
	.incbin "baserom.gba", 0x16D283, 0x25

gMapScripts_FuchsiaCity_SafariZone_Entrance:: @ 816D2A8
	.incbin "baserom.gba", 0x16D2A8, 0x238

gMapScripts_FuchsiaCity_Mart:: @ 816D4E0
	.incbin "baserom.gba", 0x16D4E0, 0x48

gMapScripts_FuchsiaCity_ZooBuilding:: @ 816D528
	.incbin "baserom.gba", 0x16D528, 0x25

gMapScripts_FuchsiaCity_Gym:: @ 816D54D
	.incbin "baserom.gba", 0x16D54D, 0x178

gMapScripts_FuchsiaCity_House1:: @ 816D6C5
	.incbin "baserom.gba", 0x16D6C5, 0x2C

gMapScripts_FuchsiaCity_PokemonCenter_1F:: @ 816D6F1
	.incbin "baserom.gba", 0x16D6F1, 0x33

gMapScripts_FuchsiaCity_PokemonCenter_2F:: @ 816D724
	.incbin "baserom.gba", 0x16D724, 0x27

gMapScripts_FuchsiaCity_Building1:: @ 816D74B
	.incbin "baserom.gba", 0x16D74B, 0xCB

gMapScripts_FuchsiaCity_House2:: @ 816D816
	.incbin "baserom.gba", 0x16D816, 0x7E

gMapScripts_FuchsiaCity_House3:: @ 816D894
	.incbin "baserom.gba", 0x16D894, 0xB7

gMapScripts_CinnabarIsland_Gym:: @ 816D94B
	.incbin "baserom.gba", 0x16D94B, 0x928

gMapScripts_CinnabarIsland_PokemonLab_Entrance:: @ 816E273
	.incbin "baserom.gba", 0x16E273, 0x45

gMapScripts_CinnabarIsland_PokemonLab_Lounge:: @ 816E2B8
	.incbin "baserom.gba", 0x16E2B8, 0x126

gMapScripts_CinnabarIsland_PokemonLab_ResearchRoom:: @ 816E3DE
	.incbin "baserom.gba", 0x16E3DE, 0x22

gMapScripts_CinnabarIsland_PokemonLab_ExperimentRoom:: @ 816E400
	.incbin "baserom.gba", 0x16E400, 0x4D7

gMapScripts_CinnabarIsland_PokemonCenter_1F:: @ 816E8D7
	.incbin "baserom.gba", 0x16E8D7, 0x111

gMapScripts_CinnabarIsland_PokemonCenter_2F:: @ 816E9E8
	.incbin "baserom.gba", 0x16E9E8, 0x27

gMapScripts_CinnabarIsland_Mart:: @ 816EA0F
	.incbin "baserom.gba", 0x16EA0F, 0x4B

gMapScripts_IndigoPlateau_PokemonCenter_1F:: @ 816EA5A
	.incbin "baserom.gba", 0x16EA5A, 0xB5

gMapScripts_IndigoPlateau_PokemonCenter_2F:: @ 816EB0F
	.incbin "baserom.gba", 0x16EB0F, 0x27

gMapScripts_SaffronCity_House1_1F:: @ 816EB36
	.incbin "baserom.gba", 0x16EB36, 0x26

gMapScripts_SaffronCity_House1_2F:: @ 816EB5C
	.incbin "baserom.gba", 0x16EB5C, 0x7F

gMapScripts_SaffronCity_Dojo:: @ 816EBDB
	.incbin "baserom.gba", 0x16EBDB, 0x1FC

gMapScripts_SaffronCity_Gym:: @ 816EDD7
	.incbin "baserom.gba", 0x16EDD7, 0x19C

gMapScripts_SaffronCity_House2:: @ 816EF73
	.incbin "baserom.gba", 0x16EF73, 0x2F

gMapScripts_SaffronCity_Mart:: @ 816EFA2
	.incbin "baserom.gba", 0x16EFA2, 0x4A

gMapScripts_SaffronCity_PokemonCenter_1F:: @ 816EFEC
	.incbin "baserom.gba", 0x16EFEC, 0x4B

gMapScripts_SaffronCity_PokemonCenter_2F:: @ 816F037
	.incbin "baserom.gba", 0x16F037, 0x27

gMapScripts_SaffronCity_House3:: @ 816F05E
	.incbin "baserom.gba", 0x16F05E, 0x61

gMapScripts_SaffronCity_PokemonTrainerFanClub:: @ 816F0BF
	.incbin "baserom.gba", 0x16F0BF, 0x526

gMapScripts_Route2_ViridianForest_SouthEntrance:: @ 816F5E5
	.incbin "baserom.gba", 0x16F5E5, 0x13

gMapScripts_Route2_House:: @ 816F5F8
	.incbin "baserom.gba", 0x16F5F8, 0x86

gMapScripts_Route2_EastBuilding:: @ 816F67E
	.incbin "baserom.gba", 0x16F67E, 0x9F

gMapScripts_Route2_ViridianForest_NorthEntrance:: @ 816F71D
	.incbin "baserom.gba", 0x16F71D, 0x1C

gMapScripts_Route4_PokemonCenter_1F:: @ 816F739
	.incbin "baserom.gba", 0x16F739, 0x19F

gMapScripts_Route4_PokemonCenter_2F:: @ 816F8D8
	.incbin "baserom.gba", 0x16F8D8, 0x27

gMapScripts_Route5_PokemonDayCare:: @ 816F8FF
	.incbin "baserom.gba", 0x16F8FF, 0x1

gMapScripts_Route5_SouthEntrance:: @ 816F900
	.incbin "baserom.gba", 0x16F900, 0xC6

gMapScripts_Route6_NorthEntrance:: @ 816F9C6
	.incbin "baserom.gba", 0x16F9C6, 0xC6

gMapScripts_UnknownMap_18_01:: @ 816FA8C
	.incbin "baserom.gba", 0x16FA8C, 0x1

gMapScripts_Route7_EastEntrance:: @ 816FA8D
	.incbin "baserom.gba", 0x16FA8D, 0xC6

gMapScripts_Route8_WestEntrance:: @ 816FB53
	.incbin "baserom.gba", 0x16FB53, 0xDC

gMapScripts_Route10_PokemonCenter_1F:: @ 816FC2F
	.incbin "baserom.gba", 0x16FC2F, 0xCB

gMapScripts_Route10_PokemonCenter_2F:: @ 816FCFA
	.incbin "baserom.gba", 0x16FCFA, 0x27

gMapScripts_Route11_EastEntrance_1F:: @ 816FD21
	.incbin "baserom.gba", 0x16FD21, 0x13

gMapScripts_Route11_EastEntrance_2F:: @ 816FD34
	.incbin "baserom.gba", 0x16FD34, 0x139

gMapScripts_Route12_NorthEntrance_1F:: @ 816FE6D
	.incbin "baserom.gba", 0x16FE6D, 0xA

gMapScripts_Route12_NorthEntrance_2F:: @ 816FE77
	.incbin "baserom.gba", 0x16FE77, 0x94

gMapScripts_Route12_FishingHouse:: @ 816FF0B
	.incbin "baserom.gba", 0x16FF0B, 0x17D

gMapScripts_Route15_WestEntrance_1F:: @ 8170088
	.incbin "baserom.gba", 0x170088, 0xA

gMapScripts_Route15_WestEntrance_2F:: @ 8170092
	.incbin "baserom.gba", 0x170092, 0xBC

gMapScripts_Route16_House:: @ 817014E
	.incbin "baserom.gba", 0x17014E, 0x74

gMapScripts_Route16_NorthEntrance_1F:: @ 81701C2
	.incbin "baserom.gba", 0x1701C2, 0xFC

gMapScripts_Route16_NorthEntrance_2F:: @ 81702BE
	.incbin "baserom.gba", 0x1702BE, 0xBA

gMapScripts_Route18_EastEntrance_1F:: @ 8170378
	.incbin "baserom.gba", 0x170378, 0xF3

gMapScripts_Route18_EastEntrance_2F:: @ 817046B
	.incbin "baserom.gba", 0x17046B, 0x8F

gMapScripts_UnusedHouse_27_00:: @ 81704FA
	.incbin "baserom.gba", 0x1704FA, 0x1

gMapScripts_Route22_NorthEntrance:: @ 81704FB
	.incbin "baserom.gba", 0x1704FB, 0x27

gMapScripts_UnusedHouse_29_00:: @ 8170522
	.incbin "baserom.gba", 0x170522, 0x1

gMapScripts_Route25_SeaCottage:: @ 8170523
	.incbin "baserom.gba", 0x170523, 0x367

gMapScripts_SevenIsland_House_Room1:: @ 817088A
	.incbin "baserom.gba", 0x17088A, 0x1F4

gMapScripts_SevenIsland_House_Room2:: @ 8170A7E
	.incbin "baserom.gba", 0x170A7E, 0xB2

gMapScripts_SevenIsland_Mart:: @ 8170B30
	.incbin "baserom.gba", 0x170B30, 0x59

gMapScripts_SevenIsland_PokemonCenter_1F:: @ 8170B89
	.incbin "baserom.gba", 0x170B89, 0x33

gMapScripts_SevenIsland_PokemonCenter_2F:: @ 8170BBC
	.incbin "baserom.gba", 0x170BBC, 0x27

gMapScripts_UnusedHouse_31_05:: @ 8170BE3
	.incbin "baserom.gba", 0x170BE3, 0x1

gMapScripts_SevenIsland_Harbor:: @ 8170BE4
	.incbin "baserom.gba", 0x170BE4, 0x14

gMapScripts_OneIsland_PokemonCenter_1F:: @ 8170BF8
	.incbin "baserom.gba", 0x170BF8, 0x73C

gMapScripts_OneIsland_PokemonCenter_2F:: @ 8171334
	.incbin "baserom.gba", 0x171334, 0x27

gMapScripts_OneIsland_House1:: @ 817135B
	.incbin "baserom.gba", 0x17135B, 0x13

gMapScripts_OneIsland_House2:: @ 817136E
	.incbin "baserom.gba", 0x17136E, 0xA

gMapScripts_OneIsland_Harbor:: @ 8171378
	.incbin "baserom.gba", 0x171378, 0x58

gMapScripts_TwoIsland_JoyfulGameCorner:: @ 81713D0
	.incbin "baserom.gba", 0x1713D0, 0x248

gMapScripts_TwoIsland_House:: @ 8171618
	.incbin "baserom.gba", 0x171618, 0x19C

gMapScripts_TwoIsland_PokemonCenter_1F:: @ 81717B4
	.incbin "baserom.gba", 0x1717B4, 0x2A

gMapScripts_TwoIsland_PokemonCenter_2F:: @ 81717DE
	.incbin "baserom.gba", 0x1717DE, 0x27

gMapScripts_TwoIsland_Harbor:: @ 8171805
	.incbin "baserom.gba", 0x171805, 0x14

gMapScripts_ThreeIsland_House1:: @ 8171819
	.incbin "baserom.gba", 0x171819, 0x19

gMapScripts_ThreeIsland_PokemonCenter_1F:: @ 8171832
	.incbin "baserom.gba", 0x171832, 0x33

gMapScripts_ThreeIsland_PokemonCenter_2F:: @ 8171865
	.incbin "baserom.gba", 0x171865, 0x27

gMapScripts_ThreeIsland_Mart:: @ 817188C
	.incbin "baserom.gba", 0x17188C, 0x53

gMapScripts_ThreeIsland_House2:: @ 81718DF
	.incbin "baserom.gba", 0x1718DF, 0x23

gMapScripts_ThreeIsland_House3:: @ 8171902
	.incbin "baserom.gba", 0x171902, 0xA

gMapScripts_ThreeIsland_House4:: @ 817190C
	.incbin "baserom.gba", 0x17190C, 0x13

gMapScripts_ThreeIsland_House5:: @ 817191F
	.incbin "baserom.gba", 0x17191F, 0x20

gMapScripts_FourIsland_PokemonDayCare:: @ 817193F
	.incbin "baserom.gba", 0x17193F, 0x2AB

gMapScripts_FourIsland_PokemonCenter_1F:: @ 8171BEA
	.incbin "baserom.gba", 0x171BEA, 0x33

gMapScripts_FourIsland_PokemonCenter_2F:: @ 8171C1D
	.incbin "baserom.gba", 0x171C1D, 0x27

gMapScripts_FourIsland_House1:: @ 8171C44
	.incbin "baserom.gba", 0x171C44, 0xA

gMapScripts_FourIsland_LoreleisHouse:: @ 8171C4E
	.incbin "baserom.gba", 0x171C4E, 0x4A

gMapScripts_FourIsland_Harbor:: @ 8171C98
	.incbin "baserom.gba", 0x171C98, 0x14

gMapScripts_FourIsland_House2:: @ 8171CAC
	.incbin "baserom.gba", 0x171CAC, 0x1

gMapScripts_FourIsland_Mart:: @ 8171CAD
	.incbin "baserom.gba", 0x171CAD, 0x44

gMapScripts_FiveIsland_PokemonCenter_1F:: @ 8171CF1
	.incbin "baserom.gba", 0x171CF1, 0x2A

gMapScripts_FiveIsland_PokemonCenter_2F:: @ 8171D1B
	.incbin "baserom.gba", 0x171D1B, 0x27

gMapScripts_FiveIsland_Harbor:: @ 8171D42
	.incbin "baserom.gba", 0x171D42, 0x14

gMapScripts_FiveIsland_House1:: @ 8171D56
	.incbin "baserom.gba", 0x171D56, 0xA

gMapScripts_FiveIsland_House2:: @ 8171D60
	.incbin "baserom.gba", 0x171D60, 0xA

gMapScripts_SixIsland_PokemonCenter_1F:: @ 8171D6A
	.incbin "baserom.gba", 0x171D6A, 0xB6

gMapScripts_SixIsland_PokemonCenter_2F:: @ 8171E20
	.incbin "baserom.gba", 0x171E20, 0x27

gMapScripts_SixIsland_Harbor:: @ 8171E47
	.incbin "baserom.gba", 0x171E47, 0x14

gMapScripts_SixIsland_House:: @ 8171E5B
	.incbin "baserom.gba", 0x171E5B, 0xA

gMapScripts_SixIsland_Mart:: @ 8171E65
	.incbin "baserom.gba", 0x171E65, 0x44

gMapScripts_ThreeIsland_Harbor:: @ 8171EA9
	.incbin "baserom.gba", 0x171EA9, 0x14

gMapScripts_FiveIsland_ResortGorgeous_House:: @ 8171EBD
	.incbin "baserom.gba", 0x171EBD, 0x1AE

gMapScripts_TwoIsland_CapeBrink_House:: @ 817206B
	.incbin "baserom.gba", 0x17206B, 0x1

gMapScripts_SixIsland_WaterPath_House1:: @ 817206C
	.incbin "baserom.gba", 0x17206C, 0x10C

gMapScripts_SixIsland_WaterPath_House2:: @ 8172178
	.incbin "baserom.gba", 0x172178, 0xA

gMapScripts_SevenIsland_SevaultCanyon_House:: @ 8172182
	.incbin "baserom.gba", 0x172182, 0x32CBD

gStdScript_81A4E3F::
    .incbin "baserom.gba", 0x1A4E3F, 0xB

gStdScript_81A4E4A::
    .incbin "baserom.gba", 0x1A4E4A, 0xA

gStdScript_81A4E54::
    .incbin "baserom.gba", 0x1A4E54, 0x8

gStdScript_81A4E5C::
    .incbin "baserom.gba", 0x1A4E5C, 0xA

gStdScript_81A4E66::
    .incbin "baserom.gba", 0x1A4E66, 0x4E

gUnknown_81A4EB4:: @ 81A4EB4
	.incbin "baserom.gba", 0x1A4EB4, 0xD

gUnknown_81A4EC1:: @ 81A4EC1
	.incbin "baserom.gba", 0x1A4EC1, 0x28

gUnknown_81A4EE9:: @ 81A4EE9
	.incbin "baserom.gba", 0x1A4EE9, 0x38

gUnknown_81A4F21:: @ 81A4F21
	.incbin "baserom.gba", 0x1A4F21, 0x1D

gUnknown_81A4F3E:: @ 81A4F3E
	.incbin "baserom.gba", 0x1A4F3E, 0x35

gUnknown_81A4F73:: @ 81A4F73
	.incbin "baserom.gba", 0x1A4F73, 0xAC

gStdScript_81A501F::
    .incbin "baserom.gba", 0x1A501F, 0x6B

gUnknown_81A508A:: @ 81A508A
	.incbin "baserom.gba", 0x1A508A, 0x3EC

gUnknown_81A5476:: @ 81A5476
	.incbin "baserom.gba", 0x1A5476, 0x100B

gUnknown_81A6481:: @ 81A6481
	.incbin "baserom.gba", 0x1A6481, 0xCA

gUnknown_81A654B:: @ 81A654B
	.incbin "baserom.gba", 0x1A654B, 0x130

gStdScript_81A667B::
    .incbin "baserom.gba", 0x1A667B, 0xF1

gStdScript_81A676C::
    .incbin "baserom.gba", 0x1A676C, 0x47

gStdScript_81A67B3::
    .incbin "baserom.gba", 0x1A67B3, 0x90

gUnknown_81A6843:: @ 81A6843
	.incbin "baserom.gba", 0x1A6843, 0x112

gUnknown_81A6955:: @ 81A6955
	.incbin "baserom.gba", 0x1A6955, 0x173

gUnknown_81A6AC8:: @ 81A6AC8
	.incbin "baserom.gba", 0x1A6AC8, 0x45

gUnknown_81A6B0D:: @ 81A6B0D
	.incbin "baserom.gba", 0x1A6B0D, 0x125

gUnknown_81A6C32:: @ 81A6C32
	.incbin "baserom.gba", 0x1A6C32, 0xE5

gUnknown_81A6D17:: @ 81A6D17
	.incbin "baserom.gba", 0x1A6D17, 0x56

gUnknown_81A6D6D:: @ 81A6D6D
	.incbin "baserom.gba", 0x1A6D6D, 0x72

gUnknown_81A6DDF:: @ 81A6DDF
	.incbin "baserom.gba", 0x1A6DDF, 0x57

gUnknown_81A6E36:: @ 81A6E36
	.incbin "baserom.gba", 0x1A6E36, 0x6E

gUnknown_81A6EA4:: @ 81A6EA4
	.incbin "baserom.gba", 0x1A6EA4, 0x67

gUnknown_81A6F0B:: @ 81A6F0B
	.incbin "baserom.gba", 0x1A6F0B, 0x66

gUnknown_81A6F71:: @ 81A6F71
	.incbin "baserom.gba", 0x1A6F71, 0x3A

gUnknown_81A6FAB:: @ 81A6FAB
	.incbin "baserom.gba", 0x1A6FAB, 0x46

gUnknown_81A6FF1:: @ 81A6FF1
	.incbin "baserom.gba", 0x1A6FF1, 0x40

gUnknown_81A7031:: @ 81A7031
	.incbin "baserom.gba", 0x1A7031, 0x32

gUnknown_81A7063:: @ 81A7063
	.incbin "baserom.gba", 0x1A7063, 0x42

gUnknown_81A70A5:: @ 81A70A5
	.incbin "baserom.gba", 0x1A70A5, 0x33

gUnknown_81A70D8:: @ 81A70D8
	.incbin "baserom.gba", 0x1A70D8, 0x30

gUnknown_81A7108:: @ 81A7108
	.incbin "baserom.gba", 0x1A7108, 0x2F

gUnknown_81A7137:: @ 81A7137
	.incbin "baserom.gba", 0x1A7137, 0x3E

gUnknown_81A7175:: @ 81A7175
	.incbin "baserom.gba", 0x1A7175, 0x491

gUnknown_81A7606:: @ 81A7606
	.incbin "baserom.gba", 0x1A7606, 0x9

gUnknown_81A760F:: @ 81A760F
	.incbin "baserom.gba", 0x1A760F, 0x9

gUnknown_81A7618:: @ 81A7618
	.incbin "baserom.gba", 0x1A7618, 0x9

gUnknown_81A7621:: @ 81A7621
	.incbin "baserom.gba", 0x1A7621, 0x9

gUnknown_81A762A:: @ 81A762A
	.incbin "baserom.gba", 0x1A762A, 0x9

gUnknown_81A7633:: @ 81A7633
	.incbin "baserom.gba", 0x1A7633, 0x9

gUnknown_81A763C:: @ 81A763C
	.incbin "baserom.gba", 0x1A763C, 0x9

gUnknown_81A7645:: @ 81A7645
	.incbin "baserom.gba", 0x1A7645, 0x9

gUnknown_81A764E:: @ 81A764E
	.incbin "baserom.gba", 0x1A764E, 0x9

gUnknown_81A7657:: @ 81A7657
	.incbin "baserom.gba", 0x1A7657, 0x9

gUnknown_81A7660:: @ 81A7660
	.incbin "baserom.gba", 0x1A7660, 0x9

gUnknown_81A7669:: @ 81A7669
	.incbin "baserom.gba", 0x1A7669, 0x9

gUnknown_81A7672:: @ 81A7672
	.incbin "baserom.gba", 0x1A7672, 0x9

gUnknown_81A767B:: @ 81A767B
	.incbin "baserom.gba", 0x1A767B, 0x9

gUnknown_81A7684:: @ 81A7684
	.incbin "baserom.gba", 0x1A7684, 0x9

gUnknown_81A768D:: @ 81A768D
	.incbin "baserom.gba", 0x1A768D, 0x9

gUnknown_81A7696:: @ 81A7696
	.incbin "baserom.gba", 0x1A7696, 0x9

gUnknown_81A769F:: @ 81A769F
	.incbin "baserom.gba", 0x1A769F, 0x9

gUnknown_81A76A8:: @ 81A76A8
	.incbin "baserom.gba", 0x1A76A8, 0x9

gUnknown_81A76B1:: @ 81A76B1
	.incbin "baserom.gba", 0x1A76B1, 0x9

gUnknown_81A76BA:: @ 81A76BA
	.incbin "baserom.gba", 0x1A76BA, 0x9

gUnknown_81A76C3:: @ 81A76C3
	.incbin "baserom.gba", 0x1A76C3, 0x9

gUnknown_81A76CC:: @ 81A76CC
	.incbin "baserom.gba", 0x1A76CC, 0x9

gUnknown_81A76D5:: @ 81A76D5
	.incbin "baserom.gba", 0x1A76D5, 0x9

gUnknown_81A76DE:: @ 81A76DE
	.incbin "baserom.gba", 0x1A76DE, 0x9

gUnknown_81A76E7:: @ 81A76E7
	.incbin "baserom.gba", 0x1A76E7, 0x9

gUnknown_81A76F0:: @ 81A76F0
	.incbin "baserom.gba", 0x1A76F0, 0x9

gUnknown_81A76F9:: @ 81A76F9
	.incbin "baserom.gba", 0x1A76F9, 0x9

gUnknown_81A7702:: @ 81A7702
	.incbin "baserom.gba", 0x1A7702, 0x9E

gUnknown_81A77A0:: @ 81A77A0
	.incbin "baserom.gba", 0x1A77A0, 0x33B

gUnknown_81A7ADB:: @ 81A7ADB
	.incbin "baserom.gba", 0x1A7ADB, 0x5

gUnknown_81A7AE0:: @ 81A7AE0
	.incbin "baserom.gba", 0x1A7AE0, 0x120D

gUnknown_81A8CED:: @ 81A8CED
	.incbin "baserom.gba", 0x1A8CED, 0x5C

gUnknown_81A8D49:: @ 81A8D49
	.incbin "baserom.gba", 0x1A8D49, 0x4E

gUnknown_81A8D97:: @ 81A8D97
	.incbin "baserom.gba", 0x1A8D97, 0x41

gUnknown_81A8DD8:: @ 81A8DD8
	.incbin "baserom.gba", 0x1A8DD8, 0x25

gUnknown_81A8DFD:: @ 81A8DFD
	.incbin "baserom.gba", 0x1A8DFD, 0x5B

gStdScript_81A8E58::
    .incbin "baserom.gba", 0x1A8E58, 0x42AE

	.include "data/text/fame_checker.inc"

gUnknown_81B2E6F:: @ 81B2E6F
	.incbin "baserom.gba", 0x1B2E6F, 0x15A

gUnknown_81B2FC9:: @ 81B2FC9
	.incbin "baserom.gba", 0x1B2FC9, 0x88DE

gUnknown_81BB8A7:: @ 81BB8A7
	.incbin "baserom.gba", 0x1BB8A7, 0x1C

gUnknown_81BB8C3:: @ 81BB8C3
	.incbin "baserom.gba", 0x1BB8C3, 0xC

gUnknown_81BB8CF:: @ 81BB8CF
	.incbin "baserom.gba", 0x1BB8CF, 0xC

gUnknown_81BB8DB:: @ 81BB8DB
	.incbin "baserom.gba", 0x1BB8DB, 0x1D

gUnknown_81BB8F8:: @ 81BB8F8
	.incbin "baserom.gba", 0x1BB8F8, 0x1D

gUnknown_81BB915:: @ 81BB915
	.incbin "baserom.gba", 0x1BB915, 0x1D

gUnknown_81BB932:: @ 81BB932
	.incbin "baserom.gba", 0x1BB932, 0x1E

gUnknown_81BB950:: @ 81BB950
	.incbin "baserom.gba", 0x1BB950, 0xC

gUnknown_81BB95C:: @ 81BB95C
	.incbin "baserom.gba", 0x1BB95C, 0x24

gUnknown_81BB980:: @ 81BB980
	.incbin "baserom.gba", 0x1BB980, 0x1

gUnknown_81BB981:: @ 81BB981
	.incbin "baserom.gba", 0x1BB981, 0x11

gUnknown_81BB992:: @ 81BB992
	.incbin "baserom.gba", 0x1BB992, 0x11

gUnknown_81BB9A3:: @ 81BB9A3
	.incbin "baserom.gba", 0x1BB9A3, 0x31

gUnknown_81BB9D4:: @ 81BB9D4
	.incbin "baserom.gba", 0x1BB9D4, 0x1C

gUnknown_81BB9F0:: @ 81BB9F0
	.incbin "baserom.gba", 0x1BB9F0, 0xC

gUnknown_81BB9FC:: @ 81BB9FC
	.incbin "baserom.gba", 0x1BB9FC, 0x5DC

gUnknown_81BBFD8:: @ 81BBFD8
	.incbin "baserom.gba", 0x1BBFD8, 0x4D4

gUnknown_81BC4AC:: @ 81BC4AC
	.incbin "baserom.gba", 0x1BC4AC, 0x22

gUnknown_81BC4CE:: @ 81BC4CE
	.incbin "baserom.gba", 0x1BC4CE, 0x3F

gUnknown_81BC50D:: @ 81BC50D
	.incbin "baserom.gba", 0x1BC50D, 0x3F

gUnknown_81BC54C:: @ 81BC54C
	.incbin "baserom.gba", 0x1BC54C, 0x1A1F

gUnknown_81BDF6B:: @ 81BDF6B
	.incbin "baserom.gba", 0x1BDF6B, 0xF9

gUnknown_81BE064:: @ 81BE064
	.incbin "baserom.gba", 0x1BE064, 0x10A

gUnknown_81BE16E:: @ 81BE16E
	.incbin "baserom.gba", 0x1BE16E, 0x149

gUnknown_81BE2B7:: @ 81BE2B7
	.incbin "baserom.gba", 0x1BE2B7, 0x48

gUnknown_81BE2FF:: @ 81BE2FF
	.incbin "baserom.gba", 0x1BE2FF, 0x265

gUnknown_81BE564:: @ 81BE564
	.incbin "baserom.gba", 0x1BE564, 0xFE2

gUnknown_81BF546:: @ 81BF546
	.incbin "baserom.gba", 0x1BF546, 0x619

gUnknown_81BFB5F:: @ 81BFB5F
	.incbin "baserom.gba", 0x1BFB5F, 0x6

gUnknown_81BFB65:: @ 81BFB65
	.incbin "baserom.gba", 0x1BFB65, 0x22

gUnknown_81BFB87:: @ 81BFB87
	.incbin "baserom.gba", 0x1BFB87, 0x23

gUnknown_81BFBAA:: @ 81BFBAA
	.incbin "baserom.gba", 0x1BFBAA, 0x1B

gUnknown_81BFBC5:: @ 81BFBC5
	.incbin "baserom.gba", 0x1BFBC5, 0x12

gUnknown_81BFBD7:: @ 81BFBD7
	.incbin "baserom.gba", 0x1BFBD7, 0x178A

gUnknown_81C1361:: @ 81C1361
	.incbin "baserom.gba", 0x1C1361, 0x1B

gUnknown_81C137C:: @ 81C137C
	.incbin "baserom.gba", 0x1C137C, 0x5A

gUnknown_81C13D6:: @ 81C13D6
	.incbin "baserom.gba", 0x1C13D6, 0x53

gUnknown_81C1429:: @ 81C1429
	.incbin "baserom.gba", 0x1C1429, 0x4073

gUnknown_81C549C:: @ 81C549C
	.incbin "baserom.gba", 0x1C549C, 0xBF

gUnknown_81C555B:: @ 81C555B
	.incbin "baserom.gba", 0x1C555B, 0x6E

gUnknown_81C55C9:: @ 81C55C9
	.incbin "baserom.gba", 0x1C55C9, 0x21

gUnknown_81C55EA:: @ 81C55EA
	.incbin "baserom.gba", 0x1C55EA, 0x3B

gUnknown_81C5625:: @ 81C5625
	.incbin "baserom.gba", 0x1C5625, 0x22

gUnknown_81C5647:: @ 81C5647
	.incbin "baserom.gba", 0x1C5647, 0x23

gUnknown_81C566A:: @ 81C566A
	.incbin "baserom.gba", 0x1C566A, 0xE5

gOtherText_NewName:: @ 81C574F
	.string "NEW NAME$"

gNameChoice_Green:: @ 81C5758
	.string "GREEN$"

gNameChoice_Red:: @ 81C575E
	.string "RED$"

gNameChoice_Leaf:: @ 81C5762
	.string "LEAF$"

gNameChoice_Fire:: @ 81C5767
	.string "FIRE$"

gNameChoice_Gary:: @ 81C576C
	.string "GARY$"

gNameChoice_Kaz:: @ 81C5771
	.string "KAZ$"

gNameChoice_Toru:: @ 81C5775
	.string "TORU$"

gNameChoice_Ash:: @ 81C577A
	.string "ASH$"

gNameChoice_Kene:: @ 81C577E
	.string "KENE$"

gNameChoice_Geki:: @ 81C5783
	.string "GEKI$"

gNameChoice_Jak:: @ 81C5788
	.string "JAK$"

gNameChoice_Janne:: @ 81C578C
	.string "JANNE$"

gNameChoice_Jonn:: @ 81C5792
	.string "JONN$"

gNameChoice_Kamon:: @ 81C5797
	.string "KAMON$"

gNameChoice_Karl:: @ 81C579D
	.string "KARL$"

gNameChoice_Taylor:: @ 81C57A2
	.string "TAYLOR$"

gNameChoice_Oscar:: @ 81C57A9
	.string "OSCAR$"

gNameChoice_Hiro:: @ 81C57AF
	.string "HIRO$"

gNameChoice_Max:: @ 81C57B4
	.string "MAX$"

gNameChoice_Jon:: @ 81C57B8
	.string "JON$"

gNameChoice_Ralph:: @ 81C57BC
	.string "RALPH$"

gNameChoice_Kay:: @ 81C57C2
	.string "KAY$"

gNameChoice_Tosh:: @ 81C57C6
	.string "TOSH$"

gNameChoice_Roak:: @ 81C57CB
	.string "ROAK$"

gNameChoice_Omi:: @ 81C57D0
	.string "OMI$"

gNameChoice_Jodi:: @ 81C57D4
	.string "JODI$"

gNameChoice_Amanda:: @ 81C57D9
	.string "AMANDA$"

gNameChoice_Hillary:: @ 81C57E0
	.string "HILLARY$"

gNameChoice_Makey:: @ 81C57E8
	.string "MAKEY$"

gNameChoice_Michi:: @ 81C57EE
	.string "MICHI$"

gNameChoice_Paula:: @ 81C57F4
	.string "PAULA$"

gNameChoice_June:: @ 81C57FA
	.string "JUNE$"

gNameChoice_Cassie:: @ 81C57FF
	.string "CASSIE$"

gNameChoice_Rey:: @ 81C5806
	.string "REY$"

gNameChoice_Seda:: @ 81C580A
	.string "SEDA$"

gNameChoice_Kiko:: @ 81C580F
	.string "KIKO$"

gNameChoice_Mina:: @ 81C5814
	.string "MINA$"

gNameChoice_Norie:: @ 81C5819
	.string "NORIE$"

gNameChoice_Sai:: @ 81C581F
	.string "SAI$"

gNameChoice_Momo:: @ 81C5823
	.string "MOMO$"

gNameChoice_Suzi:: @ 81C5828
	.string "SUZI$"

gNewGame_HelpDocs1:: @ 81C582D
	.string "The various buttons will be explained in\n"
	.string "the order of their importance.$"

gNewGame_HelpDocs2:: @ 81C5875
	.string "Moves the main character.\n"
	.string "Also used to choose various data\n"
	.string "headings.$"

gNewGame_HelpDocs3:: @ 81C58BA
	.string "Used to confirm a choice, check\n"
	.string "things, chat, and scroll text.$"

gNewGame_HelpDocs4:: @ 81C58F9
	.string "Used to exit, cancel a choice,\n"
	.string "and cancel a mode.$"

gNewGame_HelpDocs5:: @ 81C592B
	.string "Press this button to open the\n"
	.string "MENU.$"

gNewGame_HelpDocs6:: @ 81C594F
	.string "Used to shift items and to use\n"
	.string "a registered item.$"

gNewGame_HelpDocs7:: @ 81C5981
	.string "If you need help playing the\n"
	.string "game, or on how to do things,\n"
	.string "press the L or R Button.$"

gOakText_AskPlayerGender:: @ 81C59D5
	.string "Now tell me. Are you a boy?\n"
	.string "Or are you a girl?$"

gNewGameAdventureIntro1::
	.string "In the world which you are about to\n"
	.string "enter, you will embark on a grand\n"
	.string "adventure with you as the hero.\n"
	.string "\n"
	.string "Speak to people and check things\n"
	.string "wherever you go, be it towns, roads,\n"
	.string "or caves. Gather information and\n"
	.string "hints from every source.$"

gNewGameAdventureIntro2::
	.string "New paths will open to you by helping\n"
	.string "people in need, overcoming challenges,\n"
	.string "and solving mysteries.\n"
	.string "\n"
	.string "At times, you will be challenged by\n"
	.string "others and attacked by wild creatures.\n"
	.string "Be brave and keep pushing on.$"

gNewGameAdventureIntro3::
	.string "Through your adventure, we hope\n"
	.string "that you will interact with all sorts\n"
	.string "of people and achieve personal growth.\n"
	.string "That is our biggest objective.\n"
	.string "\n"
	.string "Press the A Button, and let your\n"
	.string "adventure begin!$"

gOakText_WelcomeToTheWorld:: @ 81C5C78
	.string "Hello, there!\n"
	.string "Glad to meet you!\pWelcome to the world of POKéMON!\pMy name is OAK.\pPeople affectionately refer to me\n"
	.string "as the POKéMON PROFESSOR.\p$"

gOakText_WorldInhabited1:: @ 81C5D06
	.string "This world…$"

gOakText_WorldInhabited2:: @ 81C5D12
	.string "…is inhabited far and wide by\n"
	.string "creatures called POKéMON.\p$"

gOakText_PetsBattlingStudy:: @ 81C5D4B
	.string "For some people, POKéMON are pets.\n"
	.string "Others use them for battling.\pAs for myself…\pI study POKéMON as a profession.\p$"

gOakText_TellMeALittleAboutYourself:: @ 81C5DBD
	.string "But first, tell me a little about\n"
	.string "yourself.\p$"

gOakText_AskPlayerName:: @ 81C5DEA
	.string "Let’s begin with your name.\n"
	.string "What is it?\p$"

gOakText_FinalizePlayerName:: @ 81C5E13
	.string "Right…\n"
	.string "So your name is {PLAYER}.$"

gOakText_IntroduceRival:: @ 81C5E2E
	.string "This is my grandson.\pHe’s been your rival since you both\n"
	.string "were babies.\p…Erm, what was his name now?$"

gOakText_AskRivalName:: @ 81C5E91
	.string "Your rival’s name, what was it now?$"

gOakText_ConfirmRivalName:: @ 81C5EB5
	.string "…Er, was it {RIVAL}?$"

gOakText_RememberRivalName:: @ 81C5EC5
	.string "That’s right! I remember now!\n"
	.string "His name is {RIVAL}!\p$"

gOakText_LegendAboutToUnfold:: @ 81C5EF4
	.string "{PLAYER}!\pYour very own POKéMON legend is\n"
	.string "about to unfold!\pA world of dreams and adventures\n"
	.string "with POKéMON awaits! Let’s go!$"

@ pokedude data
	.incbin "baserom.gba", 0x1C5F69, 0x983
