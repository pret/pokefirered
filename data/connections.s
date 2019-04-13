#include "constants/maps.h"
    .include "asm/macros.inc"

    .section .rodata

gUnknown_8352754:: @ 8352754
	connection up, 0, MAP_ROUTE1
	connection down, 0, MAP_ROUTE21_NORTH

gMapConnections_PalletTown:: @ 835276C
	.4byte 2
	.4byte gUnknown_8352754

gUnknown_8352774:: @ 8352774
	connection up, 12, MAP_ROUTE2
	connection down, 12, MAP_ROUTE1
	connection left, 10, MAP_ROUTE22

gMapConnections_ViridianCity:: @ 8352798
	.4byte 3
	.4byte gUnknown_8352774

gUnknown_83527A0:: @ 83527A0
	connection down, 12, MAP_ROUTE2
	connection right, 10, MAP_ROUTE3

gMapConnections_PewterCity:: @ 83527B8
	.4byte 2
	.4byte gUnknown_83527A0

gUnknown_83527C0:: @ 83527C0
	connection up, 12, MAP_ROUTE24
	connection down, 0, MAP_ROUTE5
	connection left, 10, MAP_ROUTE4
	connection right, 10, MAP_ROUTE9

gMapConnections_CeruleanCity:: @ 83527F0
	.4byte 4
	.4byte gUnknown_83527C0

gUnknown_83527F8:: @ 83527F8
	connection up, 0, MAP_ROUTE10
	connection down, 0, MAP_ROUTE12
	connection left, 0, MAP_ROUTE8

gMapConnections_LavenderTown:: @ 835281C
	.4byte 3
	.4byte gUnknown_83527F8

gUnknown_8352824:: @ 8352824
	connection up, 12, MAP_ROUTE6
	connection right, 10, MAP_ROUTE11

gMapConnections_VermilionCity:: @ 835283C
	.4byte 2
	.4byte gUnknown_8352824

gUnknown_8352844:: @ 8352844
	connection left, 10, MAP_ROUTE16
	connection right, 10, MAP_ROUTE7

gMapConnections_CeladonCity:: @ 835285C
	.4byte 2
	.4byte gUnknown_8352844

gUnknown_8352864:: @ 8352864
	connection down, 12, MAP_ROUTE19
	connection left, 10, MAP_ROUTE18
	connection right, 10, MAP_ROUTE15

gMapConnections_FuchsiaCity:: @ 8352888
	.4byte 3
	.4byte gUnknown_8352864

gUnknown_8352890:: @ 8352890
	connection up, 0, MAP_ROUTE21_SOUTH
	connection right, 0, MAP_ROUTE20

gMapConnections_CinnabarIsland:: @ 83528A8
	.4byte 2
	.4byte gUnknown_8352890

gUnknown_83528B0:: @ 83528B0
	connection down, 0, MAP_ROUTE23

gMapConnections_IndigoPlateau_Exterior:: @ 83528BC
	.4byte 1
	.4byte gUnknown_83528B0

gUnknown_83528C4:: @ 83528C4
	connection up, 0, MAP_ROUTE5
	connection down, 12, MAP_ROUTE6
	connection left, 10, MAP_ROUTE7
	connection right, 10, MAP_ROUTE8

gUnknown_83528F4:: @ 83528F4
	.4byte 4
	.4byte gUnknown_83528C4

gUnknown_83528FC:: @ 83528FC
	connection up, 0, MAP_ROUTE5
	connection down, 12, MAP_ROUTE6
	connection left, 10, MAP_ROUTE7
	connection right, 10, MAP_ROUTE8

gMapConnections_SaffronCity:: @ 835292C
	.4byte 4
	.4byte gUnknown_83528FC

gUnknown_8352934:: @ 8352934
	connection down, 0, MAP_ONEISLAND_TREASUREBEACH
	connection right, -120, MAP_ONEISLAND_KINDLEROAD

gMapConnections_OneIsland:: @ 835294C
	.4byte 2
	.4byte gUnknown_8352934

gUnknown_8352954:: @ 8352954
	connection up, 24, MAP_TWOISLAND_CAPEBRINK

gMapConnections_TwoIsland:: @ 8352960
	.4byte 1
	.4byte gUnknown_8352954

gUnknown_8352968:: @ 8352968
	connection down, 0, MAP_THREEISLAND_PORT
	connection left, 0, MAP_THREEISLAND_BONDBRIDGE

gMapConnections_ThreeIsland:: @ 8352980
	.4byte 2
	.4byte gUnknown_8352968

gUnknown_8352988:: @ 8352988
	connection up, -48, MAP_FIVEISLAND_WATERLABYRINTH
	connection right, 0, MAP_FIVEISLAND_MEADOW

gMapConnections_FiveIsland:: @ 83529A0
	.4byte 2
	.4byte gUnknown_8352988

gUnknown_83529A8:: @ 83529A8
	connection up, -48, MAP_SEVENISLAND_TRAINERTOWER
	connection down, 0, MAP_SEVENISLAND_SEVAULTCANYON_ENTRANCE

gMapConnections_SevenIsland:: @ 83529C0
	.4byte 2
	.4byte gUnknown_83529A8

gUnknown_83529C8:: @ 83529C8
	connection right, -40, MAP_SIXISLAND_WATERPATH

gMapConnections_SixIsland:: @ 83529D4
	.4byte 1
	.4byte gUnknown_83529C8

gUnknown_83529DC:: @ 83529DC
	connection up, -12, MAP_VIRIDIANCITY
	connection down, 0, MAP_PALLETTOWN

gMapConnections_Route1:: @ 83529F4
	.4byte 2
	.4byte gUnknown_83529DC

gUnknown_83529FC:: @ 83529FC
	connection up, -12, MAP_PEWTERCITY
	connection down, -12, MAP_VIRIDIANCITY

gMapConnections_Route2:: @ 8352A14
	.4byte 2
	.4byte gUnknown_83529FC

gUnknown_8352A1C:: @ 8352A1C
	connection up, 60, MAP_ROUTE4
	connection left, -10, MAP_PEWTERCITY

gMapConnections_Route3:: @ 8352A34
	.4byte 2
	.4byte gUnknown_8352A1C

gUnknown_8352A3C:: @ 8352A3C
	connection down, -60, MAP_ROUTE3
	connection right, -10, MAP_CERULEANCITY

gMapConnections_Route4:: @ 8352A54
	.4byte 2
	.4byte gUnknown_8352A3C

gUnknown_8352A5C:: @ 8352A5C
	connection up, 0, MAP_CERULEANCITY
	connection down, 0, MAP_SAFFRONCITY

gMapConnections_Route5:: @ 8352A74
	.4byte 2
	.4byte gUnknown_8352A5C

gUnknown_8352A7C:: @ 8352A7C
	connection up, 0, MAP_SAFFRONCITY
	connection down, -12, MAP_VERMILIONCITY

gMapConnections_Route6:: @ 8352A94
	.4byte 2
	.4byte gUnknown_8352A7C

gUnknown_8352A9C:: @ 8352A9C
	connection left, -10, MAP_CELADONCITY
	connection right, -10, MAP_SAFFRONCITY

gMapConnections_Route7:: @ 8352AB4
	.4byte 2
	.4byte gUnknown_8352A9C

gUnknown_8352ABC:: @ 8352ABC
	connection left, -10, MAP_SAFFRONCITY
	connection right, 0, MAP_LAVENDERTOWN

gMapConnections_Route8:: @ 8352AD4
	.4byte 2
	.4byte gUnknown_8352ABC

gUnknown_8352ADC:: @ 8352ADC
	connection left, -10, MAP_CERULEANCITY
	connection right, 0, MAP_ROUTE10

gMapConnections_Route9:: @ 8352AF4
	.4byte 2
	.4byte gUnknown_8352ADC

gUnknown_8352AFC:: @ 8352AFC
	connection down, 0, MAP_LAVENDERTOWN
	connection left, 0, MAP_ROUTE9

gMapConnections_Route10:: @ 8352B14
	.4byte 2
	.4byte gUnknown_8352AFC

gUnknown_8352B1C:: @ 8352B1C
	connection left, -10, MAP_VERMILIONCITY
	connection right, -60, MAP_ROUTE12

gMapConnections_Route11:: @ 8352B34
	.4byte 2
	.4byte gUnknown_8352B1C

gUnknown_8352B3C:: @ 8352B3C
	connection up, 0, MAP_LAVENDERTOWN
	connection down, -48, MAP_ROUTE13
	connection left, 60, MAP_ROUTE11

gMapConnections_Route12:: @ 8352B60
	.4byte 3
	.4byte gUnknown_8352B3C

gUnknown_8352B68:: @ 8352B68
	connection up, 48, MAP_ROUTE12
	connection left, 0, MAP_ROUTE14

gMapConnections_Route13:: @ 8352B80
	.4byte 2
	.4byte gUnknown_8352B68

gUnknown_8352B88:: @ 8352B88
	connection left, 40, MAP_ROUTE15
	connection right, 0, MAP_ROUTE13

gMapConnections_Route14:: @ 8352BA0
	.4byte 2
	.4byte gUnknown_8352B88

gUnknown_8352BA8:: @ 8352BA8
	connection left, -10, MAP_FUCHSIACITY
	connection right, -40, MAP_ROUTE14

gMapConnections_Route15:: @ 8352BC0
	.4byte 2
	.4byte gUnknown_8352BA8

gUnknown_8352BC8:: @ 8352BC8
	connection down, 0, MAP_ROUTE17
	connection right, -10, MAP_CELADONCITY

gMapConnections_Route16:: @ 8352BE0
	.4byte 2
	.4byte gUnknown_8352BC8

gUnknown_8352BE8:: @ 8352BE8
	connection up, 0, MAP_ROUTE16
	connection down, 0, MAP_ROUTE18

gMapConnections_Route17:: @ 8352C00
	.4byte 2
	.4byte gUnknown_8352BE8

gUnknown_8352C08:: @ 8352C08
	connection up, 0, MAP_ROUTE17
	connection right, -10, MAP_FUCHSIACITY

gMapConnections_Route18:: @ 8352C20
	.4byte 2
	.4byte gUnknown_8352C08

gUnknown_8352C28:: @ 8352C28
	connection up, -12, MAP_FUCHSIACITY
	connection left, 40, MAP_ROUTE20

gMapConnections_Route19:: @ 8352C40
	.4byte 2
	.4byte gUnknown_8352C28

gUnknown_8352C48:: @ 8352C48
	connection left, 0, MAP_CINNABARISLAND
	connection right, -40, MAP_ROUTE19

gMapConnections_Route20:: @ 8352C60
	.4byte 2
	.4byte gUnknown_8352C48

gUnknown_8352C68:: @ 8352C68
	connection up, 0, MAP_PALLETTOWN
	connection down, 0, MAP_ROUTE21_SOUTH

gMapConnections_Route21_North:: @ 8352C80
	.4byte 2
	.4byte gUnknown_8352C68

gUnknown_8352C88:: @ 8352C88
	connection up, 0, MAP_ROUTE21_NORTH
	connection down, 0, MAP_CINNABARISLAND

gMapConnections_Route21_South:: @ 8352CA0
	.4byte 2
	.4byte gUnknown_8352C88

gUnknown_8352CA8:: @ 8352CA8
	connection up, 0, MAP_ROUTE23
	connection right, -10, MAP_VIRIDIANCITY

gMapConnections_Route22:: @ 8352CC0
	.4byte 2
	.4byte gUnknown_8352CA8

gUnknown_8352CC8:: @ 8352CC8
	connection up, 0, MAP_INDIGOPLATEAU_EXTERIOR
	connection down, 0, MAP_ROUTE22

gMapConnections_Route23:: @ 8352CE0
	.4byte 2
	.4byte gUnknown_8352CC8

gUnknown_8352CE8:: @ 8352CE8
	connection down, -12, MAP_CERULEANCITY
	connection right, 0, MAP_ROUTE25

gMapConnections_Route24:: @ 8352D00
	.4byte 2
	.4byte gUnknown_8352CE8

gUnknown_8352D08:: @ 8352D08
	connection left, 0, MAP_ROUTE24

gMapConnections_Route25:: @ 8352D14
	.4byte 1
	.4byte gUnknown_8352D08

gUnknown_8352D1C:: @ 8352D1C
	connection left, 120, MAP_ONEISLAND

gMapConnections_OneIsland_KindleRoad:: @ 8352D28
	.4byte 1
	.4byte gUnknown_8352D1C

gUnknown_8352D30:: @ 8352D30
	connection up, 0, MAP_ONEISLAND

gMapConnections_OneIsland_TreasureBeach:: @ 8352D3C
	.4byte 1
	.4byte gUnknown_8352D30

gUnknown_8352D44:: @ 8352D44
	connection down, -24, MAP_TWOISLAND

gMapConnections_TwoIsland_CapeBrink:: @ 8352D50
	.4byte 1
	.4byte gUnknown_8352D44

gUnknown_8352D58:: @ 8352D58
	connection right, 0, MAP_THREEISLAND

gMapConnections_ThreeIsland_BondBridge:: @ 8352D64
	.4byte 1
	.4byte gUnknown_8352D58

gUnknown_8352D6C:: @ 8352D6C
	connection up, 0, MAP_THREEISLAND

gMapConnections_ThreeIsland_Port:: @ 8352D78
	.4byte 1
	.4byte gUnknown_8352D6C

gUnknown_8352D80:: @ 8352D80
	connection up, 0, MAP_THREEISLAND

gMapConnections_UnknownMap_03_50:: @ 8352D8C
	.4byte 1
	.4byte gUnknown_8352D80

gUnknown_8352D94:: @ 8352D94
	connection up, 0, MAP_THREEISLAND

gMapConnections_UnknownMap_03_51:: @ 8352DA0
	.4byte 1
	.4byte gUnknown_8352D94

gUnknown_8352DA8:: @ 8352DA8
	connection down, -48, MAP_FIVEISLAND_WATERLABYRINTH

gMapConnections_FiveIsland_ResortGorgeous:: @ 8352DB4
	.4byte 1
	.4byte gUnknown_8352DA8

gUnknown_8352DBC:: @ 8352DBC
	connection up, 48, MAP_FIVEISLAND_RESORTGORGEOUS
	connection down, 48, MAP_FIVEISLAND

gMapConnections_FiveIsland_WaterLabyrinth:: @ 8352DD4
	.4byte 2
	.4byte gUnknown_8352DBC

gUnknown_8352DDC:: @ 8352DDC
	connection left, 0, MAP_FIVEISLAND
	connection right, 20, MAP_FIVEISLAND_MEMORIALPILLAR

gMapConnections_FiveIsland_Meadow:: @ 8352DF4
	.4byte 2
	.4byte gUnknown_8352DDC

gUnknown_8352DFC:: @ 8352DFC
	connection left, -20, MAP_FIVEISLAND_MEADOW

gMapConnections_FiveIsland_MemorialPillar:: @ 8352E08
	.4byte 1
	.4byte gUnknown_8352DFC

gUnknown_8352E10:: @ 8352E10
	connection down, 0, MAP_SIXISLAND_GREENPATH

gMapConnections_SixIsland_OutcastIsland:: @ 8352E1C
	.4byte 1
	.4byte gUnknown_8352E10

gUnknown_8352E24:: @ 8352E24
	connection up, 0, MAP_SIXISLAND_OUTCASTISLAND
	connection right, 0, MAP_SIXISLAND_WATERPATH

gMapConnections_SixIsland_GreenPath:: @ 8352E3C
	.4byte 2
	.4byte gUnknown_8352E24

gUnknown_8352E44:: @ 8352E44
	connection left, 0, MAP_SIXISLAND_GREENPATH
	connection left, 40, MAP_SIXISLAND
	connection left, 80, MAP_SIXISLAND_RUINVALLEY

gMapConnections_SixIsland_WaterPath:: @ 8352E68
	.4byte 3
	.4byte gUnknown_8352E44

gUnknown_8352E70:: @ 8352E70
	connection right, -80, MAP_SIXISLAND_WATERPATH

gMapConnections_SixIsland_RuinValley:: @ 8352E7C
	.4byte 1
	.4byte gUnknown_8352E70

gUnknown_8352E84:: @ 8352E84
	connection down, 48, MAP_SEVENISLAND

gMapConnections_SevenIsland_TrainerTower:: @ 8352E90
	.4byte 1
	.4byte gUnknown_8352E84

gUnknown_8352E98:: @ 8352E98
	connection up, 0, MAP_SEVENISLAND
	connection right, 20, MAP_SEVENISLAND_SEVAULTCANYON

gMapConnections_SevenIsland_SevaultCanyon_Entrance:: @ 8352EB0
	.4byte 2
	.4byte gUnknown_8352E98

gUnknown_8352EB8:: @ 8352EB8
	connection down, -48, MAP_SEVENISLAND_TANOBYRUINS
	connection left, -20, MAP_SEVENISLAND_SEVAULTCANYON_ENTRANCE

gMapConnections_SevenIsland_SevaultCanyon:: @ 8352ED0
	.4byte 2
	.4byte gUnknown_8352EB8

gUnknown_8352ED8:: @ 8352ED8
	connection up, 48, MAP_SEVENISLAND_SEVAULTCANYON

gMapConnections_SevenIsland_TanobyRuins:: @ 8352EE4
	.4byte 1
	.4byte gUnknown_8352ED8
