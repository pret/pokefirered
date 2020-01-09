#include "constants/global.h"
#include "constants/flags.h"
#include "constants/event_objects.h"
#include "constants/decorations.h"
#include "constants/items.h"
#include "constants/layouts.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/trainer_classes.h"
#include "constants/vars.h"
#include "constants/battle.h"
#include "constants/spawn_points.h"
#include "constants/field_effects.h"
#include "constants/trainers.h"
#include "constants/object_events.h"
#include "constants/fame_checker.h"
#include "constants/seagallop.h"
#include "constants/game_stat.h"
#include "constants/menu.h"
#include "constants/battle_setup.h"
#include "constants/map_scripts.h"
	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
	.set FALSE, 0
	.set TRUE,  1

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
	.4byte gSpecialVar_TextColor
	.4byte gSpecialVar_PrevTextColor
	.4byte gUnknown_20370DE

	.include "data/specials.inc"

	.align 2
gStdScripts:: @ 8160450
	.4byte gStdScript_0
	.4byte gStdScript_1
	.4byte Std_MsgboxNPC
	.4byte Std_MsgboxSign
	.4byte Std_MsgboxDefault
	.4byte Std_MsgboxYesNo
	.4byte gStdScript_Message_WaitButton_AndRelease
	.4byte Std_ObtainDecoration
	.4byte gStdScript_8
	.4byte gStdScript_ItemMessageAndFanfare
gStdScriptsEnd::

	.include "data/maps/UnknownMap_00_00/scripts.inc"
	.include "data/maps/UnknownMap_00_01/scripts.inc"
	.include "data/maps/UnknownMap_00_02/scripts.inc"
	.include "data/maps/UnknownMap_00_03/scripts.inc"
	.include "data/maps/UnknownMap_00_04/scripts.inc"
	.include "data/maps/ViridianForest/scripts.inc"
	.include "data/maps/MtMoon_1F/scripts.inc"
	.include "data/maps/MtMoon_B1F/scripts.inc"
	.include "data/maps/MtMoon_B2F/scripts.inc"
	.include "data/maps/SSAnne_Exterior/scripts.inc"
	.include "data/maps/SSAnne_1F_Corridor/scripts.inc"
	.include "data/maps/SSAnne_2F_Corridor/scripts.inc"
	.include "data/maps/SSAnne_3F_Corridor/scripts.inc"
	.include "data/maps/SSAnne_B1F_Corridor/scripts.inc"
	.include "data/maps/SSAnne_Deck/scripts.inc"
	.include "data/maps/SSAnne_Kitchen/scripts.inc"
	.include "data/maps/SSAnne_CaptainsOffice/scripts.inc"
	.include "data/maps/SSAnne_1F_Room1/scripts.inc"
	.include "data/maps/SSAnne_1F_Room2/scripts.inc"
	.include "data/maps/SSAnne_1F_Room3/scripts.inc"
	.include "data/maps/SSAnne_1F_Room4/scripts.inc"
	.include "data/maps/SSAnne_1F_Room5/scripts.inc"
	.include "data/maps/SSAnne_1F_Room7/scripts.inc"
	.include "data/maps/SSAnne_2F_Room1/scripts.inc"
	.include "data/maps/SSAnne_2F_Room2/scripts.inc"
	.include "data/maps/SSAnne_2F_Room3/scripts.inc"
	.include "data/maps/SSAnne_2F_Room4/scripts.inc"
	.include "data/maps/SSAnne_2F_Room5/scripts.inc"
	.include "data/maps/SSAnne_2F_Room6/scripts.inc"
	.include "data/maps/SSAnne_B1F_Room1/scripts.inc"
	.include "data/maps/SSAnne_B1F_Room2/scripts.inc"
	.include "data/maps/SSAnne_B1F_Room3/scripts.inc"
	.include "data/maps/SSAnne_B1F_Room4/scripts.inc"
	.include "data/maps/SSAnne_B1F_Room5/scripts.inc"
	.include "data/maps/SSAnne_1F_Room6/scripts.inc"
	.include "data/maps/UndergroundPath_NorthEntrance/scripts.inc"
	.include "data/maps/UndergroundPath_NorthSouthTunnel/scripts.inc"
	.include "data/maps/UndergroundPath_SouthEntrance/scripts.inc"
	.include "data/maps/UndergroundPath_WestEntrance/scripts.inc"
	.include "data/maps/UndergroundPath_EastWestTunnel/scripts.inc"
	.include "data/maps/UndergroundPath_EastEntrance/scripts.inc"
	.include "data/maps/DiglettsCave_NorthEntrance/scripts.inc"
	.include "data/maps/DiglettsCave_B1F/scripts.inc"
	.include "data/maps/DiglettsCave_SouthEntrance/scripts.inc"
	.include "data/maps/VictoryRoad_1F/scripts.inc"
	.include "data/maps/VictoryRoad_2F/scripts.inc"
	.include "data/maps/VictoryRoad_3F/scripts.inc"
	.include "data/maps/RocketHideout_B1F/scripts.inc"
	.include "data/maps/RocketHideout_B2F/scripts.inc"
	.include "data/maps/RocketHideout_B3F/scripts.inc"
	.include "data/maps/RocketHideout_B4F/scripts.inc"
	.include "data/maps/RocketHideout_Elevator/scripts.inc"
	.include "data/maps/SilphCo_1F/scripts.inc"
	.include "data/maps/SilphCo_2F/scripts.inc"
	.include "data/maps/SilphCo_3F/scripts.inc"
	.include "data/maps/SilphCo_4F/scripts.inc"
	.include "data/maps/SilphCo_5F/scripts.inc"
	.include "data/maps/SilphCo_6F/scripts.inc"
	.include "data/maps/SilphCo_7F/scripts.inc"
	.include "data/maps/SilphCo_8F/scripts.inc"
	.include "data/maps/SilphCo_9F/scripts.inc"
	.include "data/maps/SilphCo_10F/scripts.inc"
	.include "data/maps/SilphCo_11F/scripts.inc"
	.include "data/maps/SilphCo_Elevator/scripts.inc"
	.include "data/maps/PokemonMansion_1F/scripts.inc"
	.include "data/maps/PokemonMansion_2F/scripts.inc"
	.include "data/maps/PokemonMansion_3F/scripts.inc"
	.include "data/maps/PokemonMansion_B1F/scripts.inc"
	.include "data/maps/SafariZone_Center/scripts.inc"
	.include "data/maps/SafariZone_East/scripts.inc"
	.include "data/maps/SafariZone_North/scripts.inc"
	.include "data/maps/SafariZone_West/scripts.inc"
	.include "data/maps/SafariZone_Building1/scripts.inc"
	.include "data/maps/SafariZone_Building2/scripts.inc"
	.include "data/maps/SafariZone_Building3/scripts.inc"
	.include "data/maps/SafariZone_Building4/scripts.inc"
	.include "data/maps/SafariZone_SecretHouse/scripts.inc"
	.include "data/maps/CeruleanCave_1F/scripts.inc"
	.include "data/maps/CeruleanCave_2F/scripts.inc"
	.include "data/maps/CeruleanCave_B1F/scripts.inc"
	.include "data/maps/PokemonLeague_LoreleisRoom/scripts.inc"
	.include "data/maps/PokemonLeague_BrunosRoom/scripts.inc"
	.include "data/maps/PokemonLeague_AgathasRoom/scripts.inc"
	.include "data/maps/PokemonLeague_LancesRoom/scripts.inc"
	.include "data/maps/PokemonLeague_ChampionsRoom/scripts.inc"
	.include "data/maps/PokemonLeague_HallOfFame/scripts.inc"
	.include "data/maps/RockTunnel_1F/scripts.inc"
	.include "data/maps/RockTunnel_B1F/scripts.inc"
	.include "data/maps/SeafoamIslands_1F/scripts.inc"
	.include "data/maps/SeafoamIslands_B1F/scripts.inc"
	.include "data/maps/SeafoamIslands_B2F/scripts.inc"
	.include "data/maps/SeafoamIslands_B3F/scripts.inc"
	.include "data/maps/SeafoamIslands_B4F/scripts.inc"
	.include "data/maps/PokemonTower_1F/scripts.inc"
	.include "data/maps/PokemonTower_2F/scripts.inc"
	.include "data/maps/PokemonTower_3F/scripts.inc"
	.include "data/maps/PokemonTower_4F/scripts.inc"
	.include "data/maps/PokemonTower_5F/scripts.inc"
	.include "data/maps/PokemonTower_6F/scripts.inc"
	.include "data/maps/PokemonTower_7F/scripts.inc"
	.include "data/maps/PowerPlant/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_B4F/scripts.inc"
	.include "data/maps/MtEmber_Exterior/scripts.inc"
	.include "data/maps/MtEmber_SummitPath_1F/scripts.inc"
	.include "data/maps/MtEmber_SummitPath_2F/scripts.inc"
	.include "data/maps/MtEmber_SummitPath_3F/scripts.inc"
	.include "data/maps/MtEmber_Summit/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_B5F/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_1F/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_B1F/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_B2F/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_B3F/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_B1F_Stairs/scripts.inc"
	.include "data/maps/MtEmber_RubyPath_B2F_Stairs/scripts.inc"
	.include "data/maps/ThreeIsland_BerryForest/scripts.inc"
	.include "data/maps/FourIsland_IcefallCave_Entrance/scripts.inc"
	.include "data/maps/FourIsland_IcefallCave_1F/scripts.inc"
	.include "data/maps/FourIsland_IcefallCave_B1F/scripts.inc"
	.include "data/maps/FourIsland_IcefallCave_Back/scripts.inc"
	.include "data/maps/FiveIsland_RocketWarehouse/scripts.inc"
	.include "data/maps/SixIsland_DottedHole_1F/scripts.inc"
	.include "data/maps/SixIsland_DottedHole_B1F/scripts.inc"
	.include "data/maps/SixIsland_DottedHole_B2F/scripts.inc"
	.include "data/maps/SixIsland_DottedHole_B3F/scripts.inc"
	.include "data/maps/SixIsland_DottedHole_B4F/scripts.inc"
	.include "data/maps/SixIsland_DottedHole_SapphireRoom/scripts.inc"
	.include "data/maps/SixIsland_PatternBush/scripts.inc"
	.include "data/maps/SixIsland_AlteringCave/scripts.inc"
	.include "data/maps/NavelRock_Exterior/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_1F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_2F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_3F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_4F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_5F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_6F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_7F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_8F/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_Roof/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_Lobby/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower_Elevator/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Entrance/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room1/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room2/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room3/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room4/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room5/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room6/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room7/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room8/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room9/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room10/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room11/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room12/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room13/scripts.inc"
	.include "data/maps/FiveIsland_LostCave_Room14/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins_MoneanChamber/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins_LiptooChamber/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins_WeepthChamber/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins_DilfordChamber/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins_ScufibChamber/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins_RixyChamber/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins_ViapoisChamber/scripts.inc"
	.include "data/maps/ThreeIsland_DunsparceTunnel/scripts.inc"
	.include "data/maps/SevenIsland_SevaultCanyon_TanobyKey/scripts.inc"
	.include "data/maps/NavelRock_1F/scripts.inc"
	.include "data/maps/NavelRock_Summit/scripts.inc"
	.include "data/maps/NavelRock_Base/scripts.inc"
	.include "data/maps/NavelRock_SummitPath_2F/scripts.inc"
	.include "data/maps/NavelRock_SummitPath_3F/scripts.inc"
	.include "data/maps/NavelRock_SummitPath_4F/scripts.inc"
	.include "data/maps/NavelRock_SummitPath_5F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B1F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B2F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B3F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B4F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B5F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B6F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B7F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B8F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B9F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B10F/scripts.inc"
	.include "data/maps/NavelRock_BasePath_B11F/scripts.inc"
	.include "data/maps/NavelRock_B1F/scripts.inc"
	.include "data/maps/NavelRock_Fork/scripts.inc"
	.include "data/maps/BirthIsland_Exterior/scripts.inc"
	.include "data/maps/OneIsland_KindleRoad_EmberSpa/scripts.inc"
	.include "data/maps/BirthIsland_Harbor/scripts.inc"
	.include "data/maps/NavelRock_Harbor/scripts.inc"
	.include "data/maps/PalletTown/scripts.inc"
	.include "data/maps/ViridianCity/scripts.inc"
	.include "data/maps/PewterCity/scripts.inc"
	.include "data/maps/CeruleanCity/scripts.inc"
	.include "data/maps/LavenderTown/scripts.inc"
	.include "data/maps/VermilionCity/scripts.inc"
	.include "data/maps/CeladonCity/scripts.inc"
	.include "data/maps/FuchsiaCity/scripts.inc"
	.include "data/maps/CinnabarIsland/scripts.inc"
	.include "data/maps/IndigoPlateau_Exterior/scripts.inc"
	.include "data/maps/SaffronCity/scripts.inc"
	.include "data/maps/SaffronCity_Classic/scripts.inc"
	.include "data/maps/OneIsland/scripts.inc"
	.include "data/maps/TwoIsland/scripts.inc"
	.include "data/maps/ThreeIsland/scripts.inc"
	.include "data/maps/FourIsland/scripts.inc"
	.include "data/maps/FiveIsland/scripts.inc"
	.include "data/maps/SevenIsland/scripts.inc"
	.include "data/maps/SixIsland/scripts.inc"
	.include "data/maps/Route1/scripts.inc"
	.include "data/maps/Route2/scripts.inc"
	.include "data/maps/Route3/scripts.inc"
	.include "data/maps/Route4/scripts.inc"
	.include "data/maps/Route5/scripts.inc"
	.include "data/maps/Route6/scripts.inc"
	.include "data/maps/Route7/scripts.inc"
	.include "data/maps/Route8/scripts.inc"
	.include "data/maps/Route9/scripts.inc"
	.include "data/maps/Route10/scripts.inc"
	.include "data/maps/Route11/scripts.inc"
	.include "data/maps/Route12/scripts.inc"
	.include "data/maps/Route13/scripts.inc"
	.include "data/maps/Route14/scripts.inc"
	.include "data/maps/Route15/scripts.inc"
	.include "data/maps/Route16/scripts.inc"
	.include "data/maps/Route17/scripts.inc"
	.include "data/maps/Route18/scripts.inc"
	.include "data/maps/Route19/scripts.inc"
	.include "data/maps/Route20/scripts.inc"
	.include "data/maps/Route21_North/scripts.inc"
	.include "data/maps/Route21_South/scripts.inc"
	.include "data/maps/Route22/scripts.inc"
	.include "data/maps/Route23/scripts.inc"
	.include "data/maps/Route24/scripts.inc"
	.include "data/maps/Route25/scripts.inc"
	.include "data/maps/OneIsland_KindleRoad/scripts.inc"
	.include "data/maps/OneIsland_TreasureBeach/scripts.inc"
	.include "data/maps/TwoIsland_CapeBrink/scripts.inc"
	.include "data/maps/ThreeIsland_BondBridge/scripts.inc"
	.include "data/maps/ThreeIsland_Port/scripts.inc"
	.include "data/maps/UnknownMap_03_50/scripts.inc"
	.include "data/maps/UnknownMap_03_51/scripts.inc"
	.include "data/maps/UnknownMap_03_52/scripts.inc"
	.include "data/maps/UnknownMap_03_53/scripts.inc"
	.include "data/maps/FiveIsland_ResortGorgeous/scripts.inc"
	.include "data/maps/FiveIsland_WaterLabyrinth/scripts.inc"
	.include "data/maps/FiveIsland_Meadow/scripts.inc"
	.include "data/maps/FiveIsland_MemorialPillar/scripts.inc"
	.include "data/maps/SixIsland_OutcastIsland/scripts.inc"
	.include "data/maps/SixIsland_GreenPath/scripts.inc"
	.include "data/maps/SixIsland_WaterPath/scripts.inc"
	.include "data/maps/SixIsland_RuinValley/scripts.inc"
	.include "data/maps/SevenIsland_TrainerTower/scripts.inc"
	.include "data/maps/SevenIsland_SevaultCanyon_Entrance/scripts.inc"
	.include "data/maps/SevenIsland_SevaultCanyon/scripts.inc"
	.include "data/maps/SevenIsland_TanobyRuins/scripts.inc"
	.include "data/maps/PalletTown_PlayersHouse_1F/scripts.inc"
	.include "data/maps/PalletTown_PlayersHouse_2F/scripts.inc"
	.include "data/maps/PalletTown_GarysHouse/scripts.inc"
	.include "data/maps/PalletTown_ProfessorOaksLab/scripts.inc"
	.include "data/maps/ViridianCity_House1/scripts.inc"
	.include "data/maps/ViridianCity_Gym/scripts.inc"
	.include "data/maps/ViridianCity_House2/scripts.inc"
	.include "data/maps/ViridianCity_Mart/scripts.inc"
	.include "data/maps/ViridianCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/ViridianCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/PewterCity_Museum_1F/scripts.inc"
	.include "data/maps/PewterCity_Museum_2F/scripts.inc"
	.include "data/maps/PewterCity_Gym/scripts.inc"
	.include "data/maps/PewterCity_Mart/scripts.inc"
	.include "data/maps/PewterCity_House1/scripts.inc"
	.include "data/maps/PewterCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/PewterCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/PewterCity_House2/scripts.inc"
	.include "data/maps/CeruleanCity_House1/scripts.inc"
	.include "data/maps/CeruleanCity_House2/scripts.inc"
	.include "data/maps/CeruleanCity_House3/scripts.inc"
	.include "data/maps/CeruleanCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/CeruleanCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/CeruleanCity_Gym/scripts.inc"
	.include "data/maps/CeruleanCity_BikeShop/scripts.inc"
	.include "data/maps/CeruleanCity_Mart/scripts.inc"
	.include "data/maps/CeruleanCity_House4/scripts.inc"
	.include "data/maps/CeruleanCity_House5/scripts.inc"
	.include "data/maps/LavenderTown_PokemonCenter_1F/scripts.inc"
	.include "data/maps/LavenderTown_PokemonCenter_2F/scripts.inc"
	.include "data/maps/LavenderTown_VolunteerPokemonHouse/scripts.inc"
	.include "data/maps/LavenderTown_House1/scripts.inc"
	.include "data/maps/LavenderTown_House2/scripts.inc"
	.include "data/maps/LavenderTown_Mart/scripts.inc"
	.include "data/maps/VermilionCity_House1/scripts.inc"
	.include "data/maps/VermilionCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/VermilionCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/VermilionCity_PokemonFanClub/scripts.inc"
	.include "data/maps/VermilionCity_House2/scripts.inc"
	.include "data/maps/VermilionCity_Mart/scripts.inc"
	.include "data/maps/VermilionCity_Gym/scripts.inc"
	.include "data/maps/VermilionCity_House3/scripts.inc"
	.include "data/maps/CeladonCity_DepartmentStore_1F/scripts.inc"
	.include "data/maps/CeladonCity_DepartmentStore_2F/scripts.inc"
	.include "data/maps/CeladonCity_DepartmentStore_3F/scripts.inc"
	.include "data/maps/CeladonCity_DepartmentStore_4F/scripts.inc"
	.include "data/maps/CeladonCity_DepartmentStore_5F/scripts.inc"
	.include "data/maps/CeladonCity_DepartmentStore_Roof/scripts.inc"
	.include "data/maps/CeladonCity_DepartmentStore_Elevator/scripts.inc"
	.include "data/maps/CeladonCity_Condominiums_1F/scripts.inc"
	.include "data/maps/CeladonCity_Condominiums_2F/scripts.inc"
	.include "data/maps/CeladonCity_Condominiums_3F/scripts.inc"
	.include "data/maps/CeladonCity_Condominiums_Roof/scripts.inc"
	.include "data/maps/CeladonCity_Condominiums_RoofRoom/scripts.inc"
	.include "data/maps/CeladonCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/CeladonCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/CeladonCity_GameCorner/scripts.inc"
	.include "data/maps/CeladonCity_GameCorner_PrizeRoom/scripts.inc"
	.include "data/maps/CeladonCity_Gym/scripts.inc"
	.include "data/maps/CeladonCity_Restaurant/scripts.inc"
	.include "data/maps/CeladonCity_House1/scripts.inc"
	.include "data/maps/CeladonCity_Hotel/scripts.inc"
	.include "data/maps/FuchsiaCity_SafariZone_Entrance/scripts.inc"
	.include "data/maps/FuchsiaCity_Mart/scripts.inc"
	.include "data/maps/FuchsiaCity_ZooBuilding/scripts.inc"
	.include "data/maps/FuchsiaCity_Gym/scripts.inc"
	.include "data/maps/FuchsiaCity_House1/scripts.inc"
	.include "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/FuchsiaCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/FuchsiaCity_Building1/scripts.inc"
	.include "data/maps/FuchsiaCity_House2/scripts.inc"
	.include "data/maps/FuchsiaCity_House3/scripts.inc"
	.include "data/maps/CinnabarIsland_Gym/scripts.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_Entrance/scripts.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_Lounge/scripts.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_ResearchRoom/scripts.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/scripts.inc"
	.include "data/maps/CinnabarIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/CinnabarIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/CinnabarIsland_Mart/scripts.inc"
	.include "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.inc"
	.include "data/maps/IndigoPlateau_PokemonCenter_2F/scripts.inc"
	.include "data/maps/SaffronCity_House1_1F/scripts.inc"
	.include "data/maps/SaffronCity_House1_2F/scripts.inc"
	.include "data/maps/SaffronCity_Dojo/scripts.inc"
	.include "data/maps/SaffronCity_Gym/scripts.inc"
	.include "data/maps/SaffronCity_House2/scripts.inc"
	.include "data/maps/SaffronCity_Mart/scripts.inc"
	.include "data/maps/SaffronCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/SaffronCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/SaffronCity_House3/scripts.inc"
	.include "data/maps/SaffronCity_PokemonTrainerFanClub/scripts.inc"
	.include "data/maps/Route2_ViridianForest_SouthEntrance/scripts.inc"
	.include "data/maps/Route2_House/scripts.inc"
	.include "data/maps/Route2_EastBuilding/scripts.inc"
	.include "data/maps/Route2_ViridianForest_NorthEntrance/scripts.inc"
	.include "data/maps/Route4_PokemonCenter_1F/scripts.inc"
	.include "data/maps/Route4_PokemonCenter_2F/scripts.inc"
	.include "data/maps/Route5_PokemonDayCare/scripts.inc"
	.include "data/maps/Route5_SouthEntrance/scripts.inc"
	.include "data/maps/Route6_NorthEntrance/scripts.inc"
	.include "data/maps/UnknownMap_18_01/scripts.inc"
	.include "data/maps/Route7_EastEntrance/scripts.inc"
	.include "data/maps/Route8_WestEntrance/scripts.inc"
	.include "data/maps/Route10_PokemonCenter_1F/scripts.inc"
	.include "data/maps/Route10_PokemonCenter_2F/scripts.inc"
	.include "data/maps/Route11_EastEntrance_1F/scripts.inc"
	.include "data/maps/Route11_EastEntrance_2F/scripts.inc"
	.include "data/maps/Route12_NorthEntrance_1F/scripts.inc"
	.include "data/maps/Route12_NorthEntrance_2F/scripts.inc"
	.include "data/maps/Route12_FishingHouse/scripts.inc"
	.include "data/maps/Route15_WestEntrance_1F/scripts.inc"
	.include "data/maps/Route15_WestEntrance_2F/scripts.inc"
	.include "data/maps/Route16_House/scripts.inc"
	.include "data/maps/Route16_NorthEntrance_1F/scripts.inc"
	.include "data/maps/Route16_NorthEntrance_2F/scripts.inc"
	.include "data/maps/Route18_EastEntrance_1F/scripts.inc"
	.include "data/maps/Route18_EastEntrance_2F/scripts.inc"
	.include "data/maps/UnusedHouse_27_00/scripts.inc"
	.include "data/maps/Route22_NorthEntrance/scripts.inc"
	.include "data/maps/UnusedHouse_29_00/scripts.inc"
	.include "data/maps/Route25_SeaCottage/scripts.inc"
	.include "data/maps/SevenIsland_House_Room1/scripts.inc"
	.include "data/maps/SevenIsland_House_Room2/scripts.inc"
	.include "data/maps/SevenIsland_Mart/scripts.inc"
	.include "data/maps/SevenIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/SevenIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/UnusedHouse_31_05/scripts.inc"
	.include "data/maps/SevenIsland_Harbor/scripts.inc"
	.include "data/maps/OneIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/OneIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/OneIsland_House1/scripts.inc"
	.include "data/maps/OneIsland_House2/scripts.inc"
	.include "data/maps/OneIsland_Harbor/scripts.inc"
	.include "data/maps/TwoIsland_JoyfulGameCorner/scripts.inc"
	.include "data/maps/TwoIsland_House/scripts.inc"
	.include "data/maps/TwoIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/TwoIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/TwoIsland_Harbor/scripts.inc"
	.include "data/maps/ThreeIsland_House1/scripts.inc"
	.include "data/maps/ThreeIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/ThreeIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/ThreeIsland_Mart/scripts.inc"
	.include "data/maps/ThreeIsland_House2/scripts.inc"
	.include "data/maps/ThreeIsland_House3/scripts.inc"
	.include "data/maps/ThreeIsland_House4/scripts.inc"
	.include "data/maps/ThreeIsland_House5/scripts.inc"
	.include "data/maps/FourIsland_PokemonDayCare/scripts.inc"
	.include "data/maps/FourIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/FourIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/FourIsland_House1/scripts.inc"
	.include "data/maps/FourIsland_LoreleisHouse/scripts.inc"
	.include "data/maps/FourIsland_Harbor/scripts.inc"
	.include "data/maps/FourIsland_House2/scripts.inc"
	.include "data/maps/FourIsland_Mart/scripts.inc"
	.include "data/maps/FiveIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/FiveIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/FiveIsland_Harbor/scripts.inc"
	.include "data/maps/FiveIsland_House1/scripts.inc"
	.include "data/maps/FiveIsland_House2/scripts.inc"
	.include "data/maps/SixIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/SixIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/SixIsland_Harbor/scripts.inc"
	.include "data/maps/SixIsland_House/scripts.inc"
	.include "data/maps/SixIsland_Mart/scripts.inc"
	.include "data/maps/ThreeIsland_Harbor/scripts.inc"
	.include "data/maps/FiveIsland_ResortGorgeous_House/scripts.inc"
	.include "data/maps/TwoIsland_CapeBrink_House/scripts.inc"
	.include "data/maps/SixIsland_WaterPath_House1/scripts.inc"
	.include "data/maps/SixIsland_WaterPath_House2/scripts.inc"
	.include "data/maps/SevenIsland_SevaultCanyon_House/scripts.inc"

	.include "data/maps/ViridianForest/text.inc"
	.include "data/maps/MtMoon_1F/text.inc"
	.include "data/maps/MtMoon_B2F/text.inc"
	.include "data/maps/SSAnne_1F_Corridor/text.inc"
	.include "data/maps/SSAnne_2F_Corridor/text.inc"
	.include "data/maps/SSAnne_3F_Corridor/text.inc"
	.include "data/maps/SSAnne_Deck/text.inc"
	.include "data/maps/SSAnne_Kitchen/text.inc"
	.include "data/maps/SSAnne_CaptainsOffice/text.inc"
	.include "data/maps/SSAnne_1F_Room1/text.inc"
	.include "data/maps/SSAnne_1F_Room2/text.inc"
	.include "data/maps/SSAnne_1F_Room3/text.inc"
	.include "data/maps/SSAnne_1F_Room4/text.inc"
	.include "data/maps/SSAnne_1F_Room5/text.inc"
	.include "data/maps/SSAnne_1F_Room7/text.inc"
	.include "data/maps/SSAnne_2F_Room1/text.inc"
	.include "data/maps/SSAnne_2F_Room2/text.inc"
	.include "data/maps/SSAnne_2F_Room3/text.inc"
	.include "data/maps/SSAnne_2F_Room4/text.inc"
	.include "data/maps/SSAnne_2F_Room5/text.inc"
	.include "data/maps/SSAnne_2F_Room6/text.inc"
	.include "data/maps/SSAnne_B1F_Room1/text.inc"
	.include "data/maps/SSAnne_B1F_Room2/text.inc"
	.include "data/maps/SSAnne_B1F_Room3/text.inc"
	.include "data/maps/SSAnne_B1F_Room4/text.inc"
	.include "data/maps/SSAnne_B1F_Room5/text.inc"
	.include "data/maps/SSAnne_1F_Room6/text.inc"
	.include "data/maps/UndergroundPath_SouthEntrance/text.inc"
	.include "data/maps/UndergroundPath_WestEntrance/text.inc"
	.include "data/maps/UndergroundPath_EastEntrance/text.inc"
	.include "data/maps/DiglettsCave_NorthEntrance/text.inc"
	.include "data/maps/DiglettsCave_SouthEntrance/text.inc"
	.include "data/maps/VictoryRoad_1F/text.inc"
	.include "data/maps/VictoryRoad_2F/text.inc"
	.include "data/maps/VictoryRoad_3F/text.inc"
	.include "data/maps/RocketHideout_B1F/text.inc"
	.include "data/maps/RocketHideout_B2F/text.inc"
	.include "data/maps/RocketHideout_B3F/text.inc"
	.include "data/maps/RocketHideout_B4F/text.inc"
	.include "data/maps/RocketHideout_Elevator/text.inc"
	.include "data/maps/SilphCo_1F/text.inc"
	.include "data/maps/SilphCo_2F/text.inc"
	.include "data/maps/SilphCo_3F/text.inc"
	.include "data/maps/SilphCo_4F/text.inc"
	.include "data/maps/SilphCo_5F/text.inc"
	.include "data/maps/SilphCo_6F/text.inc"
	.include "data/maps/SilphCo_7F/text.inc"
	.include "data/maps/SilphCo_8F/text.inc"
	.include "data/maps/SilphCo_9F/text.inc"
	.include "data/maps/SilphCo_10F/text.inc"
	.include "data/maps/SilphCo_11F/text.inc"
	.include "data/maps/PokemonMansion_1F/text.inc"
	.include "data/maps/PokemonMansion_2F/text.inc"
	.include "data/maps/PokemonMansion_3F/text.inc"
	.include "data/maps/PokemonMansion_B1F/text.inc"
	.include "data/maps/SafariZone_Center/text.inc"
	.include "data/maps/SafariZone_East/text.inc"
	.include "data/maps/SafariZone_North/text.inc"
	.include "data/maps/SafariZone_West/text.inc"
	.include "data/maps/SafariZone_Building1/text.inc"
	.include "data/maps/SafariZone_Building2/text.inc"
	.include "data/maps/SafariZone_Building3/text.inc"
	.include "data/maps/SafariZone_Building4/text.inc"
	.include "data/maps/SafariZone_SecretHouse/text.inc"
	.include "data/maps/CeruleanCave_B1F/text.inc"
	.include "data/maps/PokemonLeague_LoreleisRoom/text.inc"
	.include "data/maps/PokemonLeague_BrunosRoom/text.inc"
	.include "data/maps/PokemonLeague_AgathasRoom/text.inc"
	.include "data/maps/PokemonLeague_LancesRoom/text.inc"
	.include "data/maps/PokemonLeague_ChampionsRoom/text.inc"
	.include "data/maps/PokemonLeague_HallOfFame/text.inc"
	.include "data/maps/RockTunnel_1F/text.inc"
	.include "data/maps/RockTunnel_B1F/text.inc"
	.include "data/maps/SeafoamIslands_B4F/text.inc"
	.include "data/maps/PokemonTower_1F/text.inc"
	.include "data/maps/PokemonTower_2F/text.inc"
	.include "data/maps/PokemonTower_3F/text.inc"
	.include "data/maps/PokemonTower_4F/text.inc"
	.include "data/maps/PokemonTower_5F/text.inc"
	.include "data/maps/PokemonTower_6F/text.inc"
	.include "data/maps/PokemonTower_7F/text.inc"
	.include "data/maps/MtEmber_Exterior/text.inc"
	.include "data/maps/MtEmber_RubyPath_B3F/text.inc"
	.include "data/maps/ThreeIsland_BerryForest/text.inc"
	.include "data/maps/FourIsland_IcefallCave_Back/text.inc"
	.include "data/maps/FiveIsland_RocketWarehouse/text.inc"
	.include "data/maps/SixIsland_DottedHole_SapphireRoom/text.inc"
	.include "data/maps/SixIsland_PatternBush/text.inc"
	.include "data/maps/SevenIsland_TrainerTower_Lobby/text.inc"
	.include "data/maps/FiveIsland_LostCave_Room1/text.inc"
	.include "data/maps/FiveIsland_LostCave_Room4/text.inc"
	.include "data/maps/FiveIsland_LostCave_Room10/text.inc"
	.include "data/maps/ThreeIsland_DunsparceTunnel/text.inc"
	.include "data/maps/SevenIsland_SevaultCanyon_TanobyKey/text.inc"
	.include "data/maps/OneIsland_KindleRoad_EmberSpa/text.inc"
	.include "data/maps/PalletTown/text.inc"
	.include "data/maps/ViridianCity/text.inc"
	.include "data/maps/PewterCity/text.inc"
	.include "data/maps/CeruleanCity/text.inc"
	.include "data/maps/LavenderTown/text.inc"
	.include "data/maps/VermilionCity/text.inc"
	.include "data/maps/CeladonCity/text.inc"
	.include "data/maps/FuchsiaCity/text.inc"
	.include "data/maps/CinnabarIsland/text.inc"
	.include "data/maps/SaffronCity/text.inc"
	.include "data/maps/OneIsland/text.inc"
	.include "data/maps/TwoIsland/text.inc"
	.include "data/maps/ThreeIsland/text.inc"
	.include "data/maps/FourIsland/text.inc"
	.include "data/maps/FiveIsland/text.inc"
	.include "data/maps/SevenIsland/text.inc"
	.include "data/maps/SixIsland/text.inc"
	.include "data/maps/Route1/text.inc"
	.include "data/maps/Route2/text.inc"
	.include "data/maps/Route3/text.inc"
	.include "data/maps/Route4/text.inc"
	.include "data/maps/Route5/text.inc"
	.include "data/maps/Route6/text.inc"
	.include "data/maps/Route7/text.inc"
	.include "data/maps/Route8/text.inc"
	.include "data/maps/Route9/text.inc"
	.include "data/maps/Route10/text.inc"
	.include "data/maps/Route11/text.inc"
	.include "data/maps/Route12/text.inc"
	.include "data/maps/Route13/text.inc"
	.include "data/maps/Route14/text.inc"
	.include "data/maps/Route15/text.inc"
	.include "data/maps/Route16/text.inc"
	.include "data/maps/Route17/text.inc"
	.include "data/maps/Route18/text.inc"
	.include "data/maps/Route19/text.inc"
	.include "data/maps/Route20/text.inc"
	.include "data/maps/Route22/text.inc"
	.include "data/maps/Route23/text.inc"
	.include "data/maps/Route24/text.inc"
	.include "data/maps/Route25/text.inc"
	.include "data/maps/OneIsland_KindleRoad/text.inc"
	.include "data/maps/OneIsland_TreasureBeach/text.inc"
	.include "data/maps/ThreeIsland_BondBridge/text.inc"
	.include "data/maps/ThreeIsland_Port/text.inc"
	.include "data/maps/FiveIsland_ResortGorgeous/text.inc"
	.include "data/maps/FiveIsland_WaterLabyrinth/text.inc"
	.include "data/maps/FiveIsland_Meadow/text.inc"
	.include "data/maps/FiveIsland_MemorialPillar/text.inc"
	.include "data/maps/SixIsland_OutcastIsland/text.inc"
	.include "data/maps/SixIsland_GreenPath/text.inc"
	.include "data/maps/SixIsland_WaterPath/text.inc"
	.include "data/maps/SixIsland_RuinValley/text.inc"
	.include "data/maps/SevenIsland_TrainerTower/text.inc"
	.include "data/maps/SevenIsland_SevaultCanyon_Entrance/text.inc"
	.include "data/maps/SevenIsland_SevaultCanyon/text.inc"
	.include "data/maps/PalletTown_PlayersHouse_1F/text.inc"
	.include "data/maps/PalletTown_PlayersHouse_2F/text.inc"
	.include "data/maps/PalletTown_GarysHouse/text.inc"
	.include "data/maps/PalletTown_ProfessorOaksLab/text.inc"
	.include "data/maps/ViridianCity_House1/text.inc"
	.include "data/maps/ViridianCity_Gym/text.inc"
	.include "data/maps/ViridianCity_House2/text.inc"
	.include "data/maps/ViridianCity_Mart/text.inc"
	.include "data/maps/ViridianCity_PokemonCenter_1F/text.inc"
	.include "data/maps/PewterCity_Museum_1F/text.inc"
	.include "data/maps/PewterCity_Museum_2F/text.inc"
	.include "data/maps/PewterCity_Gym/text.inc"
	.include "data/maps/PewterCity_Mart/text.inc"
	.include "data/maps/PewterCity_House1/text.inc"
	.include "data/maps/PewterCity_PokemonCenter_1F/text.inc"
	.include "data/maps/PewterCity_House2/text.inc"
	.include "data/maps/CeruleanCity_House1/text.inc"
	.include "data/maps/CeruleanCity_House2/text.inc"
	.include "data/maps/CeruleanCity_House3/text.inc"
	.include "data/maps/CeruleanCity_PokemonCenter_1F/text.inc"
	.include "data/maps/CeruleanCity_Gym/text.inc"
	.include "data/maps/CeruleanCity_BikeShop/text.inc"
	.include "data/maps/CeruleanCity_Mart/text.inc"
	.include "data/maps/CeruleanCity_House4/text.inc"
	.include "data/maps/CeruleanCity_House5/text.inc"
	.include "data/maps/LavenderTown_PokemonCenter_1F/text.inc"
	.include "data/maps/LavenderTown_VolunteerPokemonHouse/text.inc"
	.include "data/maps/LavenderTown_House1/text.inc"
	.include "data/maps/LavenderTown_House2/text.inc"
	.include "data/maps/LavenderTown_Mart/text.inc"
	.include "data/maps/VermilionCity_House1/text.inc"
	.include "data/maps/VermilionCity_PokemonCenter_1F/text.inc"
	.include "data/maps/VermilionCity_PokemonFanClub/text.inc"
	.include "data/maps/VermilionCity_Mart/text.inc"
	.include "data/maps/VermilionCity_Gym/text.inc"
	.include "data/maps/VermilionCity_House3/text.inc"
	.include "data/maps/CeladonCity_DepartmentStore_1F/text.inc"
	.include "data/maps/CeladonCity_DepartmentStore_2F/text.inc"
	.include "data/maps/CeladonCity_DepartmentStore_3F/text.inc"
	.include "data/maps/CeladonCity_DepartmentStore_4F/text.inc"
	.include "data/maps/CeladonCity_DepartmentStore_5F/text.inc"
	.include "data/maps/CeladonCity_DepartmentStore_Roof/text.inc"
	.include "data/maps/CeladonCity_Condominiums_1F/text.inc"
	.include "data/maps/CeladonCity_Condominiums_2F/text.inc"
	.include "data/maps/CeladonCity_Condominiums_3F/text.inc"
	.include "data/maps/CeladonCity_Condominiums_Roof/text.inc"
	.include "data/maps/CeladonCity_Condominiums_RoofRoom/text.inc"
	.include "data/maps/CeladonCity_PokemonCenter_1F/text.inc"
	.include "data/maps/CeladonCity_GameCorner/text.inc"
	.include "data/maps/CeladonCity_GameCorner_PrizeRoom/text.inc"
	.include "data/maps/CeladonCity_Gym/text.inc"
	.include "data/maps/CeladonCity_Restaurant/text.inc"
	.include "data/maps/CeladonCity_House1/text.inc"
	.include "data/maps/CeladonCity_Hotel/text.inc"
	.include "data/maps/FuchsiaCity_SafariZone_Entrance/text.inc"
	.include "data/maps/FuchsiaCity_Mart/text.inc"
	.include "data/maps/FuchsiaCity_ZooBuilding/text.inc"
	.include "data/maps/FuchsiaCity_Gym/text.inc"
	.include "data/maps/FuchsiaCity_House1/text.inc"
	.include "data/maps/FuchsiaCity_PokemonCenter_1F/text.inc"
	.include "data/maps/FuchsiaCity_Building1/text.inc"
	.include "data/maps/FuchsiaCity_House2/text.inc"
	.include "data/maps/FuchsiaCity_House3/text.inc"
	.include "data/maps/CinnabarIsland_Gym/text.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_Entrance/text.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_Lounge/text.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_ResearchRoom/text.inc"
	.include "data/maps/CinnabarIsland_PokemonLab_ExperimentRoom/text.inc"
	.include "data/maps/CinnabarIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/CinnabarIsland_Mart/text.inc"
	.include "data/maps/IndigoPlateau_PokemonCenter_1F/text.inc"
	.include "data/maps/SaffronCity_House1_1F/text.inc"
	.include "data/maps/SaffronCity_House1_2F/text.inc"
	.include "data/maps/SaffronCity_Dojo/text.inc"
	.include "data/maps/SaffronCity_Gym/text.inc"
	.include "data/maps/SaffronCity_House2/text.inc"
	.include "data/maps/SaffronCity_Mart/text.inc"
	.include "data/maps/SaffronCity_PokemonCenter_1F/text.inc"
	.include "data/maps/SaffronCity_House3/text.inc"
	.include "data/maps/SaffronCity_PokemonTrainerFanClub/text.inc"
	.include "data/maps/Route2_ViridianForest_SouthEntrance/text.inc"
	.include "data/maps/Route2_House/text.inc"
	.include "data/maps/Route2_EastBuilding/text.inc"
	.include "data/maps/Route2_ViridianForest_NorthEntrance/text.inc"
	.include "data/maps/Route4_PokemonCenter_1F/text.inc"
	.include "data/maps/Route5_SouthEntrance/text.inc"
	.include "data/maps/Route6_NorthEntrance/text.inc"
	.include "data/maps/Route7_EastEntrance/text.inc"
	.include "data/maps/Route8_WestEntrance/text.inc"
	.include "data/maps/Route10_PokemonCenter_1F/text.inc"
	.include "data/maps/Route11_EastEntrance_1F/text.inc"
	.include "data/maps/Route11_EastEntrance_2F/text.inc"
	.include "data/maps/Route12_NorthEntrance_1F/text.inc"
	.include "data/maps/Route12_NorthEntrance_2F/text.inc"
	.include "data/maps/Route12_FishingHouse/text.inc"
	.include "data/maps/Route15_WestEntrance_1F/text.inc"
	.include "data/maps/Route15_WestEntrance_2F/text.inc"
	.include "data/maps/Route16_House/text.inc"
	.include "data/maps/Route16_NorthEntrance_1F/text.inc"
	.include "data/maps/Route16_NorthEntrance_2F/text.inc"
	.include "data/maps/Route18_EastEntrance_1F/text.inc"
	.include "data/maps/Route18_EastEntrance_2F/text.inc"
	.include "data/maps/Route25_SeaCottage/text.inc"
	.include "data/maps/SevenIsland_House_Room1/text.inc"
	.include "data/maps/SevenIsland_Mart/text.inc"
	.include "data/maps/SevenIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/OneIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/OneIsland_House1/text.inc"
	.include "data/maps/OneIsland_House2/text.inc"
	.include "data/maps/TwoIsland_JoyfulGameCorner/text.inc"
	.include "data/maps/TwoIsland_House/text.inc"
	.include "data/maps/TwoIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/ThreeIsland_House1/text.inc"
	.include "data/maps/ThreeIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/ThreeIsland_Mart/text.inc"
	.include "data/maps/ThreeIsland_House2/text.inc"
	.include "data/maps/ThreeIsland_House3/text.inc"
	.include "data/maps/ThreeIsland_House4/text.inc"
	.include "data/maps/ThreeIsland_House5/text.inc"
	.include "data/maps/FourIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/FourIsland_House1/text.inc"
	.include "data/maps/FourIsland_LoreleisHouse/text.inc"
	.include "data/maps/FourIsland_Mart/text.inc"
	.include "data/maps/FiveIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/FiveIsland_House1/text.inc"
	.include "data/maps/FiveIsland_House2/text.inc"
	.include "data/maps/SixIsland_PokemonCenter_1F/text.inc"
	.include "data/maps/SixIsland_House/text.inc"
	.include "data/maps/SixIsland_Mart/text.inc"
	.include "data/maps/FiveIsland_ResortGorgeous_House/text.inc"
	.include "data/maps/SixIsland_WaterPath_House1/text.inc"
	.include "data/maps/SixIsland_WaterPath_House2/text.inc"
	.include "data/maps/SevenIsland_SevaultCanyon_House/text.inc"

Std_MsgboxNPC:: @ 81A4E3F
	lock
	faceplayer
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return

Std_MsgboxSign:: @ 81A4E4A
	lockall
	message 0x0
	waitmessage
	waitbuttonpress
	releaseall
	return

Std_MsgboxDefault:: @ 81A4E54
	message 0x0
	waitmessage
	waitbuttonpress
	return

Std_MsgboxYesNo:: @ 81A4E5C
	message 0x0
	waitmessage
	yesnobox 20, 8
	return

gStdScript_ItemMessageAndFanfare:: @ 81A4E66
	textcolor 3
	compare VAR_0x8002, MUS_FANFA1
	call_if eq, EventScript_1A4EA2
	compare VAR_0x8002, MUS_FAN5
	call_if eq, EventScript_1A4EA6
	message 0x0
	waitmessage
	waitfanfare
	compare VAR_0x8002, MUS_FANFA1
	call_if eq, EventScript_1A4EAA
	giveitem VAR_0x8000, VAR_0x8001, 8
	call EventScript_1A6675
	return

EventScript_1A4EA2:: @ 81A4EA2
	playfanfare MUS_FANFA1
	return

EventScript_1A4EA6:: @ 81A4EA6
	playfanfare MUS_FAN5
	return

EventScript_1A4EAA:: @ 81A4EAA
	delay 50
	return

EventScript_UnusedReturn:: @ 81A4EAE
	return

EventScript_1A4EAF:: @ 81A4EAF
	special Field_AskSaveTheGame
	waitstate
	return

	.include "data/scripts/trainer_battle.inc"

@ Unused
Text_WouldYouLikeToMixRecords:: @ 81A5028
	.string "Would you like to mix records with\n"
	.string "other TRAINERS?$"

@ Unused
Text_WeHopeToSeeYouAgain2:: @ 81A505B
	.string "We hope to see you again!$"

Text_BootedUpPC:: @ 81A5075
	.string "{PLAYER} booted up the PC.$"

gUnknown_81A508A:: @ 81A508A
	.string "Which PC should be accessed?$"

Text_1A50A7:: @ 81A50A7
	.string "Accessed Someone's PC.$"

Text_1A50BE:: @ 81A50BE
	.string "POKéMON Storage System opened.$"

Text_1A50DD:: @ 81A50DD
	.string "Accessed {PLAYER}'s PC.$"

Text_1A50EF:: @ 81A50EF
	.string "Accessed BILL's PC.$"

Text_1A5103:: @ 81A5103
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "TRADE CENTER.$"

Text_1A5133:: @ 81A5133
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "COLOSSEUM.$"

Text_1A5160:: @ 81A5160
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "TIME CAPSULE.$"

gUnknown_81A5190:: @ 81A5190
	.string "Please come again!$"

Text_1A51A3:: @ 81A51A3
	.string "Welcome!\p"
	.string "We're having a discount sale today!$"

Text_1A51D0:: @ 81A51D0
	.string "{PLAYER}{KUN}, welcome!\p"
	.string "What can I do for you?$"

Text_ObtainedTheX:: @ 81A51F6
	.string "Obtained the {STR_VAR_2}!$"

Text_BagIsFull:: @ 81A5207
	.string "The BAG is full…$"

gUnknown_81A5218:: @ 81A5218
	.string "{PLAYER} put the {STR_VAR_2}\n"
	.string "in the {STR_VAR_3}.$"

Text_1A5231:: @ 81A5231
	.string "{PLAYER} found one {STR_VAR_2}!$"

gUnknown_81A5242:: @ 81A5242
	.string "Too bad!\n"
	.string "The BAG is full…$"

Text_1A525C:: @ 81A525C
	.string "{PLAYER} found\n"
	.string "{STR_VAR_1} {STR_VAR_2}!$"

Text_1A526C:: @ 81A526C
	.string "{PLAYER} put the COINS away in\n"
	.string "the COIN CASE.$"

Text_1A5294:: @ 81A5294
	.string "Too bad!\n"
	.string "The COIN CASE is full…$"

Text_1A52B4:: @ 81A52B4
	.string "Too bad!\n"
	.string "There's nothing to put them in…$"

Text_1A52DD:: @ 81A52DD
	.string "{PLAYER} found\n"
	.string "{STR_VAR_1} {STR_VAR_2}(s)!$"

Text_1A52F0:: @ 81A52F0
	.string "Obtained the {STR_VAR_2}!$"

Text_1A5301:: @ 81A5301
	.string "Too bad! There's no room left for\n"
	.string "another {STR_VAR_2}…$"

gUnknown_81A532F:: @ 81A532F
	.string "The {STR_VAR_2} was transferred\n"
	.string "to the PC.$"

Text_1A5351:: @ 81A5351
	.string "じゅんびちゅうです！$"

Text_1A535C:: @ 81A535C
	.string "Which floor do you want?$"

Text_1A5375:: @ 81A5375
	.string "An item in the BAG can be\n"
	.string "registered to SELECT for easy use.$"

Text_1A53B2:: @ 81A53B2
	.string "パソコンに\n"
	.string "ポケモン　トレーナー　こうざの\l"
	.string "メールが　きている！\p"
	.string "‥‥　‥‥　‥‥\p"
	.string "ポケモンが　おぼえられる　わざは　4つ！\p"
	.string "どんな　わざを　おぼえさせるかで\n"
	.string "トレーナーの　じつりょくが　とわれます！\p"
	.string "‥‥　‥‥　‥‥$"

gUnknown_81A5420:: @ 81A5420
	.string "{PLAYER} booted up the PC.$"

Text_1A5435:: @ 81A5435
	.string "つうしんは　キャンセルされました$"

Text_1A5446:: @ 81A5446
	.string "Want to give a nickname to the\n"
	.string "{STR_VAR_2} you received?$"

gText_PkmnFainted3:: @ 81A5476
	.string "{STR_VAR_1} fainted…\p"
	.string "$"

Text_WelcomeWantToHealPkmn:: @ 81A5483
	.string "Welcome to our POKéMON CENTER!\p"
	.string "Would you like me to heal your\n"
	.string "POKéMON back to perfect health?$"

Text_TakeYourPkmnForFewSeconds:: @ 81A54E1
	.string "Okay, I'll take your POKéMON for a\n"
	.string "few seconds.$"

Text_WeHopeToSeeYouAgain:: @ 81A5511
	.string "We hope to see you again!$"

Text_RestoredPkmnToFullHealth:: @ 81A552B
	.string "Thank you for waiting.\n"
	.string "We've restored your POKéMON to\l"
	.string "full health.$"

	.include "data/text/surf.inc"

@ Unused, from R/S
Text_DoorOpenedFarAway:: @ 81A55EA
	.string "どこか　とおくの　とびらが\n"
	.string "ひらいたような　おとだ‥‥$"

@ Unused, from R/S
Text_BigHoleInTheWall:: @ 81A5606
	.string "かべに\n"
	.string "おおきな　あなが　あいている！$"

Text_1A561A:: @ 81A561A
	.string "I'm terribly sorry.\n"
	.string "The POKéMON WIRELESS CLUB is\l"
	.string "undergoing adjustments now.$"

Text_1A5667:: @ 81A5667
	.string "It appears to be undergoing\n"
	.string "adjustments…$"

Text_1A5690:: @ 81A5690
	.string "{PLAYER} handed over the\n"
	.string "{STR_VAR_1}.$"

gUnknown_81A56A7:: @ 81A56A7
	.string "Do you want to give a nickname to\n"
	.string "this {STR_VAR_1}?$"

Text_1A56D2:: @ 81A56D2
	.string "おッ！　ダウジングマシンが\n"
	.string "はんのう　してるぞ！\p"
	.string "ましたに　どうぐが　うまってる！\n"
	.string "‥‥‥$"

Text_1A5700:: @ 81A5700
	.string "{PLAYER} dug up one {STR_VAR_2}\n"
	.string "from deep in the ground.$"

Text_1A572A:: @ 81A572A
	.string "Only truly skilled TRAINERS are\n"
	.string "allowed through.\p"
	.string "You don't have the {STR_VAR_1}\n"
	.string "yet!$"

Text_1A5776:: @ 81A5776
	.string "Rules are rules.\n"
	.string "I can't let you pass.$"

Text_1A579D:: @ 81A579D
	.string "Oh! That is the {STR_VAR_1}!\n"
	.string "Go right ahead.$"

Text_1A57C1:: @ 81A57C1
	.string "You can pass here only if you have\n"
	.string "the {STR_VAR_1}.\p"
	.string "You don't have the {STR_VAR_1}\n"
	.string "yet.\p"
	.string "You have to have it to get to\n"
	.string "the POKéMON LEAGUE.$"

Text_1A5839:: @ 81A5839
	.string "You can pass here only if you have\n"
	.string "the {STR_VAR_1}.\p"
	.string "Oh! That is the {STR_VAR_1}!{PAUSE_MUSIC}{PLAY_BGM}{MUS_FANFA1}{PAUSE 0x60}{RESUME_MUSIC}\p"
	.string "Okay, then.\n"
	.string "Please, go right ahead.$"

Text_1A58A7:: @ 81A58A7
	.string "Let's see…\n"
	.string "Uh-oh! You have caught only\l"
	.string "{STR_VAR_3} kinds of POKéMON!\p"
	.string "You need {STR_VAR_1} kinds\n"
	.string "if you want the {STR_VAR_2}.$"

Text_1A5909:: @ 81A5909
	.string "…Oh. I see.\p"
	.string "When you get {STR_VAR_1} kinds of POKéMON,\n"
	.string "come back for the {STR_VAR_2}.$"

Text_1A594D:: @ 81A594D
	.string "Oh! I see you don't have any\n"
	.string "room for the {STR_VAR_2}.$"

	.include "data/text/ingame_trade.inc"

Text_CardKeyOpenedDoor:: @ 81A5B88
	.string "Bingo!\n"
	.string "The CARD KEY opened the door!$"

Text_ItNeedsCardKey:: @ 81A5BAD
	.string "No!\n"
	.string "It needs a CARD KEY!$"

Text_1A5BC6:: @ 81A5BC6
	.string "Accessed PROF. OAK's PC…\p"
	.string "Accessed the POKéDEX Rating\n"
	.string "System…$"

Text_1A5C03:: @ 81A5C03
	.string "Would you like to have your\n"
	.string "POKéDEX rated?$"

Text_1A5C2E:: @ 81A5C2E
	.string "Closed link to PROF. OAK's PC.$"

Text_1A5C4D:: @ 81A5C4D
	.string "Someone's voice rang out,\n"
	.string "“Don't run away!”$"

Text_1A5C79:: @ 81A5C79
	.string "えっとー\n"
	.string "{STR_VAR_2}が　みてみたいなー\p"
	.string "それも　{STR_VAR_1}{STR_VAR_3}\n"
	.string "{STR_VAR_2}が　みてみたいなー$"

Text_1A5C9F:: @ 81A5C9F
	.string "わぁー　すごい！\n"
	.string "{STR_VAR_1}{STR_VAR_3}{STR_VAR_2}だー！\p"
	.string "ありがとー\n"
	.string "また　よろしくねー！$"

Text_1A5CC3:: @ 81A5CC3
	.string "それっ　ちがうよー！$"

Text_1A5CCE:: @ 81A5CCE
	.string "そっか‥$"

Text_1A5CD3:: @ 81A5CD3
	.string "ドアは　しまっている‥$"

Text_TheDoorIsOpen:: @ 81A5CDF
	.string "The door is open…$"

Text_1A5CF1:: @ 81A5CF1
	.string "{STR_VAR_2} was transferred to\n"
	.string "Someone's PC.\p"
	.string "It was placed in \n"
	.string "BOX “{STR_VAR_1}.”$"

Text_1A5D31:: @ 81A5D31
	.string "{STR_VAR_2} was transferred to\n"
	.string "BILL'S PC.\p"
	.string "It was placed in \n"
	.string "BOX “{STR_VAR_1}.”$"

Text_1A5D6E:: @ 81A5D6E
	.string "BOX “{STR_VAR_3}” on\n"
	.string "Someone's PC was full.\p"
	.string "{STR_VAR_2} was transferred to\n"
	.string "BOX “{STR_VAR_1}.”$"

Text_1A5DB1:: @ 81A5DB1
	.string "BOX “{STR_VAR_3}” on\n"
	.string "BILL'S PC was full.\p"
	.string "{STR_VAR_2} was transferred to\n"
	.string "BOX “{STR_VAR_1}.”$"

Text_1A5DF1:: @ 81A5DF1
	.string "{PLAYER} obtained\n"
	.string "the {STR_VAR_1}!$"

Text_1A5E05:: @ 81A5E05
	.string "ポケモンを　もちきれないので\n"
	.string "パソコンの　ボックス“{STR_VAR_1}”　に\l"
	.string "{STR_VAR_2}を　てんそうした！$"

gUnknown_81A5E31:: @ 81A5E31
	.string "There's no more room for POKéMON!\p"
	.string "The POKéMON BOXES are full and\n"
	.string "can't accept any more!$"

Text_1A5E89:: @ 81A5E89
	.string "First, you should restore your\n"
	.string "POKéMON to full health.$"

Text_1A5EC0:: @ 81A5EC0
	.string "Your POKéMON have been healed\n"
	.string "to perfect health.\p"
	.string "If your POKéMON's energy, HP,\n"
	.string "is down, please come see us.\p"
	.string "If you're planning to go far in the\n"
	.string "field, you should buy some POTIONS\l"
	.string "at the POKéMON MART.\p"
	.string "We hope you excel!$"

Text_1A5F9B:: @ 81A5F9B
	.string "Your POKéMON have been healed\n"
	.string "to perfect health.\p"
	.string "We hope you excel!$"

Text_1A5FDF:: @ 81A5FDF
	.string "MOM: {PLAYER}!\n"
	.string "Welcome home.\p"
	.string "It sounds like you had quite\n"
	.string "an experience.\p"
	.string "Maybe you should take a quick\n"
	.string "rest.$"

Text_1A6046:: @ 81A6046
	.string "MOM: Oh, good! You and your\n"
	.string "POKéMON are looking great.\p"
	.string "I just heard from PROF. OAK.\p"
	.string "He said that POKéMON's energy is\n"
	.string "measured in HP.\p"
	.string "If your POKéMON lose their HP,\n"
	.string "you can restore them at any\l"
	.string "POKéMON CENTER.\p"
	.string "If you're going to travel far away,\n"
	.string "the smart TRAINER stocks up on\l"
	.string "POTIONS at the POKéMON MART.\p"
	.string "Make me proud, honey!\p"
	.string "Take care!$"

Text_1A6197:: @ 81A6197
	.string "{PLAYER} is out of usable\n"
	.string "POKéMON!\p"
	.string "{PLAYER} panicked and lost ¥{STR_VAR_1}…\p"
	.string "… … … …\p"
	.string "{PLAYER} whited out!$"

Text_1A61E5:: @ 81A61E5
	.string "{PLAYER} is out of usable\n"
	.string "POKéMON!\p"
	.string "{PLAYER} whited out!$"

Text_1A6211:: @ 81A6211
	.string "Hi, there!\n"
	.string "May I help you?$"

Text_1A622C:: @ 81A622C
	.string "There is a questionnaire.\n"
	.string "Would you like to fill it out?$"

Text_1A6265:: @ 81A6265
	.string "Thank you for taking the time to\n"
	.string "fill out our questionnaire.\p"
	.string "Your feedback will be used for\n"
	.string "future reference.$"

Text_1A62D3:: @ 81A62D3
	.string "Oh, hello!\n"
	.string "You know those words?\p"
	.string "That means you must know about\n"
	.string "the MYSTERY GIFT.\p"
	.string "From now on, you should be\n"
	.string "receiving MYSTERY GIFTS!$"

Text_1A6359:: @ 81A6359
	.string "Once you save your game, you can\n"
	.string "access the MYSTERY GIFT.$"

Text_1A6393:: @ 81A6393
	.string "Thank you for accessing the\n"
	.string "MYSTERY GIFT System.$"

Text_1A63C4:: @ 81A63C4
	.string "The {STR_VAR_1} flew away!$"

Text_1A63D6:: @ 81A63D6
	.string "ベッドが　ある‥‥\n"
	.string "やすんでいこう$"

Text_1A63E8:: @ 81A63E8
	.string "{PLAYER} found a {STR_VAR_2}!\n"
	.string "It contains {STR_VAR_1}.$"

Text_1A6407:: @ 81A6407
	.string "おつかれさん！\n"
	.string "どこに　いきたいんだ？$"

Text_1A641B:: @ 81A641B
	.string "All right!\n"
	.string "All aboard SEAGALLOP HI-SPEED {STR_VAR_1}!$"

Text_1A6448:: @ 81A6448
	.string "Gyaoo!$"

Text_1A644F:: @ 81A644F
	.string "This move can be learned only\n"
	.string "once. Is that okay?$"

EventScript_ResetAllMapFlags:: @ 81A6481
	setflag FLAG_HIDE_OAK_IN_HIS_LAB
	setflag FLAG_HIDE_OAK_IN_PALLET_TOWN
	setflag FLAG_HIDE_BILL_HUMAN_SEA_COTTAGE
	setflag FLAG_HIDE_PEWTER_CITY_RUNNING_SHOES_GUY
	setflag FLAG_HIDE_POKEHOUSE_FUJI
	setflag FLAG_HIDE_LIFT_KEY
	setflag FLAG_HIDE_SILPH_SCOPE
	setflag FLAG_HIDE_CERULEAN_RIVAL
	setflag FLAG_HIDE_SS_ANNE_RIVAL
	setflag FLAG_HIDE_VERMILION_CITY_OAKS_AIDE
	setflag FLAG_HIDE_SAFFRON_CIVILIANS
	setflag FLAG_HIDE_ROUTE_22_RIVAL
	setflag FLAG_HIDE_OAK_IN_CHAMP_ROOM
	setflag FLAG_HIDE_CREDITS_RIVAL
	setflag FLAG_HIDE_CREDITS_OAK
	setflag FLAG_HIDE_CINNABAR_BILL
	setflag FLAG_HIDE_CINNABAR_SEAGALLOP
	setflag FLAG_HIDE_CINNABAR_POKECENTER_BILL
	setflag FLAG_HIDE_LORELEI_IN_HER_HOUSE
	setflag FLAG_HIDE_SAFFRON_FAN_CLUB_BLACKBELT
	setflag FLAG_HIDE_SAFFRON_FAN_CLUB_ROCKER
	setflag FLAG_HIDE_SAFFRON_FAN_CLUB_WOMAN
	setflag FLAG_HIDE_SAFFRON_FAN_CLUB_BEAUTY
	setflag FLAG_HIDE_TWO_ISLAND_GAME_CORNER_LOSTELLE
	setflag FLAG_HIDE_TWO_ISLAND_GAME_CORNER_BIKER
	setflag FLAG_HIDE_TWO_ISLAND_WOMAN
	setflag FLAG_HIDE_TWO_ISLAND_BEAUTY
	setflag FLAG_HIDE_TWO_ISLAND_SUPER_NERD
	setflag FLAG_HIDE_LOSTELLE_IN_HER_HOME
	setflag FLAG_HIDE_THREE_ISLAND_LONE_BIKER
	setflag FLAG_HIDE_FOUR_ISLAND_RIVAL
	setflag FLAG_HIDE_DOTTED_HOLE_SCIENTIST
	setflag FLAG_HIDE_RESORT_GORGEOUS_SELPHY
	setflag FLAG_HIDE_RESORT_GORGEOUS_INSIDE_SELPHY
	setflag FLAG_HIDE_SELPHYS_BUTLER
	setflag FLAG_HIDE_DEOXYS
	setflag FLAG_HIDE_LORELEI_HOUSE_MEOWTH_DOLL
	setflag FLAG_HIDE_LORELEI_HOUSE_CHANSEY_DOLL
	setflag FLAG_HIDE_LORELEIS_HOUSE_NIDORAN_F_DOLL
	setflag FLAG_HIDE_LORELEI_HOUSE_JIGGLYPUFF_DOLL
	setflag FLAG_HIDE_LORELEIS_HOUSE_NIDORAN_M_DOLL
	setflag FLAG_HIDE_LORELEIS_HOUSE_FEAROW_DOLL
	setflag FLAG_HIDE_LORELEIS_HOUSE_PIDGEOT_DOLL
	setflag FLAG_HIDE_LORELEIS_HOUSE_LAPRAS_DOLL
	setflag FLAG_HIDE_POSTGAME_GOSSIPERS
	setflag FLAG_HIDE_FAME_CHECKER_ERIKA_JOURNALS
	setflag FLAG_HIDE_FAME_CHECKER_KOGA_JOURNAL
	setflag FLAG_HIDE_FAME_CHECKER_LT_SURGE_JOURNAL
	setflag FLAG_HIDE_SAFFRON_CITY_POKECENTER_SABRINA_JOURNALS
	setvar VAR_MASSAGE_COOLDOWN_STEP_COUNTER, 500
	end

EventScript_1A651A:: @ 81A651A
	clearflag FLAG_HIDE_POSTGAME_GOSSIPERS
	call EventScript_1A6551
	special sub_81130A8
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	compare VAR_RESULT, 0
	call_if eq, EventScript_1A653B
	call EventScript_1A6541
	return

EventScript_1A653B:: @ 81A653B
	setvar VAR_MAP_SCENE_PALLET_TOWN_OAK, 2
	return

EventScript_1A6541:: @ 81A6541
	clearflag FLAG_LUGIA_FLEW_AWAY
	clearflag FLAG_HO_OH_FLEW_AWAY
	clearflag FLAG_DEOXYS_FLEW_AWAY
	return

gUnknown_81A654B:: @ 81A654B
	call EventScript_1A6551
	end

EventScript_1A6551:: @ 81A6551
	clearflag FLAG_DEFEATED_LORELEI
	clearflag FLAG_DEFEATED_BRUNO
	clearflag FLAG_DEFEATED_AGATHA
	clearflag FLAG_DEFEATED_LANCE
	clearflag FLAG_DEFEATED_CHAMP
	cleartrainerflag TRAINER_CHAMPION_FIRST_SQUIRTLE
	cleartrainerflag TRAINER_CHAMPION_FIRST_BULBASAUR
	cleartrainerflag TRAINER_CHAMPION_FIRST_CHARMANDER
	cleartrainerflag TRAINER_CHAMPION_REMATCH_SQUIRTLE
	cleartrainerflag TRAINER_CHAMPION_REMATCH_BULBASAUR
	cleartrainerflag TRAINER_CHAMPION_REMATCH_CHARMANDER
	setvar VAR_MAP_SCENE_POKEMON_LEAGUE, 0
	return

	.include "data/scripts/pkmn_center_nurse.inc"

EventScript_1A666F:: @ 81A666F
	copyvar VAR_MON_BOX_POS, VAR_MON_BOX_ID
	return

EventScript_1A6675:: @ 81A6675
	copyvar VAR_MON_BOX_ID, VAR_MON_BOX_POS
	return

gStdScript_0:: @ 81A667B
	copyvar VAR_MON_BOX_POS, VAR_MON_BOX_ID
	textcolor 3
	additem VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_1A6697
	copyvar VAR_MON_BOX_ID, VAR_MON_BOX_POS
	return

EventScript_1A6697:: @ 81A6697
	bufferitemnameplural 1, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_1A66BC
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A6749
	compare VAR_0x8007, 0
	call_if eq, EventScript_1A675E
	return

EventScript_1A66BC:: @ 81A66BC
	switch VAR_RESULT
	case POCKET_ITEMS, EventScript_1A66F9
	case POCKET_KEY_ITEMS, EventScript_1A6709
	case POCKET_POKE_BALLS, EventScript_1A6719
	case POCKET_TM_CASE, EventScript_1A6729
	case POCKET_BERRY_POUCH, EventScript_1A6739
	end

EventScript_1A66F9:: @ 81A66F9
	getstdstring 2, 24
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A6764
	return

EventScript_1A6709:: @ 81A6709
	getstdstring 2, 25
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A6764
	return

EventScript_1A6719:: @ 81A6719
	getstdstring 2, 26
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A6764
	return

EventScript_1A6729:: @ 81A6729
	getstdstring 2, 27
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A6768
	return

EventScript_1A6739:: @ 81A6739
	getstdstring 2, 28
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A6764
	return

EventScript_1A6749:: @ 81A6749
	message Text_ObtainedTheX
	waitfanfare
	waitmessage
	msgbox gUnknown_81A5218
	setvar VAR_RESULT, 1
	return

EventScript_1A675E:: @ 81A675E
	setvar VAR_RESULT, 0
	return

EventScript_1A6764:: @ 81A6764
	playfanfare MUS_FANFA1
	return

EventScript_1A6768:: @ 81A6768
	playfanfare MUS_FANFA1
	return

Std_ObtainDecoration:: @ 81A676C
	adddecor VAR_0x8000
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_1A677A
	return

EventScript_1A677A:: @ 81A677A
	getdecorname 1, VAR_0x8000
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A6795
	compare VAR_0x8007, 0
	call_if eq, EventScript_1A67AD
	return

EventScript_1A6795:: @ 81A6795
	playfanfare MUS_FANFA4
	message Text_1A52F0
	waitfanfare
	waitmessage
	msgbox gUnknown_81A532F
	setvar VAR_RESULT, 1
	return

EventScript_1A67AD:: @ 81A67AD
	setvar VAR_RESULT, 0
	return

gStdScript_1:: @ 81A67B3
	lock
	faceplayer
	waitse
	copyvar VAR_0x8004, VAR_0x8000
	copyvar VAR_0x8005, VAR_0x8001
	checkitemspace VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	getitemname 1, VAR_0x8000
	checkitemtype VAR_0x8000
	call EventScript_1A66BC
	compare VAR_0x8007, 1
	call_if eq, EventScript_1A67EE
	compare VAR_0x8007, 0
	call_if eq, EventScript_1A682D
	release
	return

EventScript_1A67EE:: @ 81A67EE
	removeobject VAR_LAST_TALKED
	additem VAR_0x8004, VAR_0x8005
	specialvar VAR_RESULT, Special_ItemIsTM_GetMoveName
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, 1
	call_if eq, EventScript_1A6821
	compare VAR_0x8008, 0
	call_if eq, EventScript_1A6827
	waitfanfare
	waitmessage
	msgbox gUnknown_81A5218
	return

EventScript_1A6821:: @ 81A6821
	message Text_1A63E8
	return

EventScript_1A6827:: @ 81A6827
	message Text_1A5231
	return

EventScript_1A682D:: @ 81A682D
	msgbox Text_ObtainedTheX
	msgbox gUnknown_81A5242
	setvar VAR_RESULT, 0
	return

EventScript_PickUpHiddenItem:: @ 81A6843
	lockall
	textcolor 3
	waitse
	compare VAR_0x8005, 0
	goto_if eq, EventScript_PickUpHiddenCoins
	call EventScript_GiveItem
	compare VAR_0x8007, 1
	goto_if eq, EventScript_ItemInPocketMessage
	compare VAR_0x8007, 0
	goto_if eq, EventScript_BagIsFullMessage
	end

EventScript_GiveItem::
	additem VAR_0x8005, VAR_0x8006
	copyvar VAR_0x8007, VAR_RESULT
	getitemname 1, VAR_0x8005
	checkitemtype VAR_0x8005
	call EventScript_1A66BC
	return

EventScript_ItemInPocketMessage::
	compare VAR_0x8006, 1
	call_if eq, EventScript_FoundSingleItemMessage
	compare VAR_0x8006, 1
	call_if ne, EventScript_FoundMultipleItemsMessage
	waitfanfare
	waitmessage
	msgbox gUnknown_81A5218
	special Special_SetHiddenItemFlag
	releaseall
	end

EventScript_FoundSingleItemMessage::
	message Text_1A5231
	return

EventScript_FoundCoinsMessage::
	getnumberstring 0, VAR_0x8006
	message Text_1A525C
	return

EventScript_FoundMultipleItemsMessage::
	getnumberstring 0, VAR_0x8006
	message Text_1A52DD
	return

EventScript_BagIsFullMessage::
	msgbox Text_1A5231
	msgbox gUnknown_81A5242
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_PickUpHiddenCoins::
	checkflag FLAG_GOT_COIN_CASE
	goto_if FALSE, EventScript_HiddenCoinsButNoCoinCase
	checkcoins VAR_RESULT
	specialvar VAR_RESULT, Special_CheckAddCoins
	compare VAR_RESULT, 0
	goto_if eq, EventScript_HiddenCoinsButTheCoinCaseIsFull
	givecoins VAR_0x8006
	getstdstring 1, 0x17
	call EventScript_1A6764
	call EventScript_FoundCoinsMessage
	waitfanfare
	waitmessage
	msgbox Text_1A526C
	special Special_SetHiddenItemFlag
	releaseall
	end

EventScript_HiddenCoinsButTheCoinCaseIsFull::
	getnumberstring 0, VAR_0x8006
	getstdstring 1, 0x17
	msgbox Text_1A525C
	msgbox Text_1A5294
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_HiddenCoinsButNoCoinCase::
	getnumberstring 0, VAR_0x8006
	getstdstring 1, 0x17
	msgbox Text_1A525C
	msgbox Text_1A52B4
	setvar VAR_RESULT, 0
	releaseall
	end

gUnknown_81A6955:: @ 81A6955
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	lockall
	checkflag FLAG_SYS_PC_STORAGE_DISABLED
	goto_if TRUE, EventScript_1A698E
	setvar VAR_0x8004, 27
	special Special_SetSomeVariable
	setvar VAR_0x8004, 0
	special Special_AnimatePcTurnOn
	playse SE_PC_ON
	msgbox Text_BootedUpPC
	goto EventScript_1A6998
	end

EventScript_1A698E:: @ 81A698E
	msgbox Text_1A1390
	releaseall
	end

EventScript_1A6998:: @ 81A6998
	message gUnknown_81A508A
	waitmessage
	special ScrSpecial_CreatePCMenu
	waitstate
	goto EventScript_1A69A8
	end

EventScript_1A69A8:: @ 81A69A8
	switch VAR_RESULT
	case 0, EventScript_1A6A05
	case 1, EventScript_1A69F0
	case 2, EventScript_1A6A7A
	case 3, EventScript_1A6A56
	case 4, EventScript_1A6A46
	case SCR_MENU_CANCEL, EventScript_1A6A46
	end

EventScript_1A69F0:: @ 81A69F0
	playse SE_PC_LOGIN
	msgbox Text_1A50DD
	special PlayerPC
	waitstate
	goto EventScript_1A6998
	end

EventScript_1A6A05:: @ 81A6A05
	playse SE_PC_LOGIN
	checkflag FLAG_SYS_NOT_SOMEONES_PC
	call_if FALSE, EventScript_1A6A34
	checkflag FLAG_SYS_NOT_SOMEONES_PC
	call_if TRUE, EventScript_1A6A3D
	msgbox Text_1A50BE
	special ShowPokemonStorageSystem
	waitstate
	setvar VAR_0x8004, 27
	special Special_SetSomeVariable
	goto EventScript_1A6998
	end

EventScript_1A6A34:: @ 81A6A34
	msgbox Text_1A50A7
	return

EventScript_1A6A3D:: @ 81A6A3D
	msgbox Text_1A50EF
	return

EventScript_1A6A46:: @ 81A6A46
	setvar VAR_0x8004, 0
	playse SE_PC_OFF
	special Special_AnimatePcTurnOff
	special sub_812B35C
	releaseall
	end

EventScript_1A6A56:: @ 81A6A56
	checkflag FLAG_SYS_GAME_CLEAR
	goto_if FALSE, EventScript_1A6A46
	playse SE_PC_LOGIN
	setvar VAR_0x8004, 31
	special HelpSystem_BackupSomeVariable
	special Special_SetSomeVariable
	special HallOfFamePCBeginFade
	waitstate
	special HelpSystem_RestoreSomeVariable
	goto EventScript_1A69A8
	end

EventScript_1A6A7A:: @ 81A6A7A
	checkflag FLAG_SYS_POKEDEX_GET
	goto_if FALSE, EventScript_1A6A46
	playse SE_PC_LOGIN
	msgbox Text_1A5BC6
	msgbox Text_1A5C03, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A6AB2
	setflag FLAG_OAKS_RATING_IS_VIA_PC
	call EventScript_1A73E0
	clearflag FLAG_OAKS_RATING_IS_VIA_PC
	goto EventScript_1A6AB2
	end

EventScript_1A6AB2:: @ 81A6AB2
	msgbox Text_1A5C2E
	goto EventScript_1A6998
	end

EventScript_1A6AC0:: @ 81A6AC0
	fadescreen 1
	special sub_80FEE44
	fadescreen 0
	return

	.include "data/scripts/surf.inc"
	.include "data/scripts/set_gym_trainers.inc"

EventScript_1A6BF9:: @ 81A6BF9
	textcolor 3
	msgbox gUnknown_81A5242
	release
	end

EventScript_1A6C05:: @ 81A6C05
	msgbox gUnknown_81A5242
	return

EventScript_1A6C0E:: @ 81A6C0E
	msgbox Text_1A5301
	release
	end

EventScript_1A6C18:: @ 81A6C18
	msgbox Text_1A5301
	return

EventScript_1A6C21:: @ 81A6C21
	playfanfare MUS_ME_BACHI
	waitfanfare
	return

EventScript_FadeOut_Heal_FadeIn:: @ 81A6C26
	fadescreen 1
	playfanfare MUS_ME_ASA
	waitfanfare
	special sp000_heal_pokemon
	fadescreen 0
	return

gUnknown_81A6C32:: @ 81A6C32
	lockall
	msgbox Text_1C0DF1
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	fadescreen 1
	special Special_TownMap
	waitstate
	releaseall
	end

gUnknown_81A6C51:: @ 81A6C51
	.string "OAK: Good to see you!\n"
	.string "How is your POKéDEX coming along?\p"
	.string "Here, let me take a look.$"

Text_1A6CA3:: @ 81A6CA3
	.string "The amount of progress you've made\n"
	.string "on your POKéDEX is:\p"
	.string "{STR_VAR_1} POKéMON seen and\n"
	.string "{STR_VAR_2} POKéMON owned.\p"
	.string "{SIZE}ÁPROF. OAK's rating:$"

gUnknown_81A6D17:: @ 81A6D17
	.string "You still have lots to do.\p"
	.string "Go into every patch of grass you\n"
	.string "see and look for POKéMON!$"

gUnknown_81A6D6D:: @ 81A6D6D
	.string "It looks as if you're getting on\n"
	.string "the right track!\p"
	.string "I've given one of my AIDES a FLASH\n"
	.string "HM. Make sure you go get it!$"

gUnknown_81A6DDF:: @ 81A6DDF
	.string "Your POKéDEX could use a bit more\n"
	.string "volume still!\p"
	.string "Try to catch other species of\n"
	.string "POKéMON!$"

gUnknown_81A6E36:: @ 81A6E36
	.string "Good, it's apparent that you're\n"
	.string "trying hard!\p"
	.string "I've given one of my AIDES an\n"
	.string "ITEMFINDER. Be sure to collect it!$"

gUnknown_81A6EA4:: @ 81A6EA4
	.string "Your POKéDEX is coming along quite\n"
	.string "well!\p"
	.string "I've given one of my AIDES an\n"
	.string "AMULET COIN. Be sure to get it!$"

gUnknown_81A6F0B:: @ 81A6F0B
	.string "Ah, you've finally topped 50\n"
	.string "species!\p"
	.string "I've given one of my AIDES an EXP.\n"
	.string "SHARE. Be sure to go get it!$"

gUnknown_81A6F71:: @ 81A6F71
	.string "Hoho! This is turning into quite the\n"
	.string "respectable POKéDEX!$"

gUnknown_81A6FAB:: @ 81A6FAB
	.string "Very good!\p"
	.string "I think you'll collect even more\n"
	.string "POKéMON by going fishing!$"

gUnknown_81A6FF1:: @ 81A6FF1
	.string "Wonderful! Let me guess… You\n"
	.string "like to collect things, don't you?$"

gUnknown_81A7031:: @ 81A7031
	.string "I'm impressed!\n"
	.string "It must have been difficult to do!$"

gUnknown_81A7063:: @ 81A7063
	.string "You've finally hit 100 species!\n"
	.string "I can't believe how good you are!$"

gUnknown_81A70A5:: @ 81A70A5
	.string "You even have the evolved forms\n"
	.string "of POKéMON! Super!$"

gUnknown_81A70D8:: @ 81A70D8
	.string "Excellent! Trade with friends to\n"
	.string "get some more!$"

gUnknown_81A7108:: @ 81A7108
	.string "Outstanding!\n"
	.string "You've become a real pro at this!$"

gUnknown_81A7137:: @ 81A7137
	.string "I have nothing left to say!\n"
	.string "You're the POKéMON PROFESSOR now!$"

gUnknown_81A7175:: @ 81A7175
	.string "Your POKéDEX is entirely complete!\n"
	.string "Congratulations!!$"

Text_1A71AA:: @ 81A71AA
	.string "And your NATIONAL POKéDEX is:\p"
	.string "{STR_VAR_1} POKéMON seen and\n"
	.string "{STR_VAR_2} POKéMON owned.$"

Text_1A71EE:: @ 81A71EE
	.string "I'll be looking forward to seeing\n"
	.string "you fill the NATIONAL POKéDEX!$"

Text_1A722F:: @ 81A722F
	.string "Finally…\p"
	.string "You've finally completed the\n"
	.string "POKéDEX!\p"
	.string "It's magnificent!\n"
	.string "Truly, this is a fantastic feat!$"

Text_1A7291:: @ 81A7291
	.string "Wroooooooaaaaaarrrr!$"

Text_1A72A6:: @ 81A72A6
	.string "はあ はあ‥$"

gUnknown_81A72AD:: @ 81A72AD
	.string "Thank you, {PLAYER}!\n"
	.string "Sincerely, thank you!\l"
	.string "You've made my dream a reality!$"

Text_1A72F2:: @ 81A72F2
	.string "OAK: Ah, welcome!\p"
	.string "Tell me, how is your POKéDEX\n"
	.string "coming along?\p"
	.string "Wahaha!\p"
	.string "Actually, I know how it is, but I\n"
	.string "love seeing it anyway!\p"
	.string "Let's see…$"

EventScript_1A737B:: @ 81A737B
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	checkflag FLAG_OAK_SAW_DEX_COMPLETION
	call_if TRUE, EventScript_1A73A4
	checkflag FLAG_OAK_SAW_DEX_COMPLETION
	call_if FALSE, EventScript_1A73AD
	call EventScript_1A73E0
	return

EventScript_1A73A4:: @ 81A73A4
	msgbox Text_1A72F2
	return

EventScript_1A73AD:: @ 81A73AD
	msgbox gUnknown_81A6C51
	return

EventScript_1A73B6:: @ 81A73B6
	copyvar VAR_0x8004, VAR_0x8009
	special Special_GetProfOaksRatingMessage
	waitmessage
	compare VAR_RESULT, 0
	call_if eq, EventScript_1A73D8
	compare VAR_RESULT, 1
	call_if eq, EventScript_1A73DC
	waitfanfare
	waitbuttonpress
	return

EventScript_1A73D8:: @ 81A73D8
	playfanfare MUS_FAN2
	return

EventScript_1A73DC:: @ 81A73DC
	playfanfare MUS_FANFA5
	return

EventScript_1A73E0:: @ 81A73E0
	setvar VAR_0x8004, 31
	special HelpSystem_BackupSomeVariable
	special Special_SetSomeVariable
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, Special_GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	copyvar VAR_0x800A, VAR_RESULT
	getnumberstring 0, VAR_0x8008
	getnumberstring 1, VAR_0x8009
	msgbox Text_1A6CA3
	checkflag FLAG_OAKS_RATING_IS_VIA_PC
	call_if FALSE, EventScript_1A746D
	call EventScript_1A73B6
	compare VAR_0x800A, 0
	goto_if eq, EventScript_1A748F
	setvar VAR_0x8004, 1
	specialvar VAR_RESULT, Special_GetPokedexCount
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	getnumberstring 0, VAR_0x8008
	getnumberstring 1, VAR_0x8009
	msgbox Text_1A71AA
	specialvar VAR_RESULT, HasAllMons
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A7470
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A747E
	end

EventScript_1A746D:: @ 81A746D
	textcolor 0
	return

EventScript_1A7470:: @ 81A7470
	msgbox Text_1A71EE
	goto EventScript_1A748F
	end

EventScript_1A747E:: @ 81A747E
	setflag FLAG_OAK_SAW_DEX_COMPLETION
	msgbox Text_1A722F
	goto EventScript_1A748F
	end

EventScript_1A748F:: @ 81A748F
	special HelpSystem_RestoreSomeVariable
	return

EventScript_1A7493:: @ 81A7493
	lockall
	setvar VAR_0x4001, 1
	goto EventScript_1A74B7
	end

EventScript_1A749F:: @ 81A749F
	lockall
	setvar VAR_0x4002, 1
	goto EventScript_1A74B7
	end

EventScript_1A74AB:: @ 81A74AB
	lockall
	setvar VAR_0x4003, 1
	goto EventScript_1A74B7
	end

EventScript_1A74B7:: @ 81A74B7
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 1
	setvar VAR_0x8006, 8
	setvar VAR_0x8007, 5
	special Special_ShakeScreen
	waitstate
	releaseall
	end

EventScript_1A74D1:: @ 81A74D1
	setvar VAR_0x4001, 1
	setvar VAR_0x4002, 1
	setvar VAR_0x4003, 1
	setvar VAR_0x4004, 1
	setvar VAR_0x4005, 1
	return

EventScript_1A74EB:: @ 81A74EB
	fadescreen 1
	special ChangePokemonNickname
	waitstate
	return

EventScript_1A74F2:: @ 81A74F2
	getitemname 0, VAR_0x8004
	playfanfare MUS_ME_WAZA
	message Text_1A5690
	waitmessage
	waitfanfare
	removeitem VAR_0x8004, 1
	return

EventScript_1A7506:: @ 81A7506
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75FE
	waitmovement 0
	playse SE_DOOR
	call EventScript_1A7538
	special DrawWholeMapView
	setflag FLAG_TEMP_4
	return

EventScript_1A751F:: @ 81A751F
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75F3
	waitmovement 0
	setflag FLAG_TEMP_2
	playse SE_KI_GASYAN
	call EventScript_1A759C
	special DrawWholeMapView
	return

EventScript_1A7538:: @ 81A7538
	setmetatile 6, 1, 654, 1
	setmetatile 6, 2, 662, 0
	return

EventScript_1A754B:: @ 81A754B
	lockall
	textcolor 0
	msgbox Text_1A5C4D
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75D3
	waitmovement 0
	releaseall
	end

EventScript_1A7563:: @ 81A7563
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75FE
	waitmovement 0
	playse SE_DOOR
	setmetatile 6, 4, 654, 1
	setmetatile 6, 5, 662, 0
	special DrawWholeMapView
	setflag FLAG_TEMP_4
	return

EventScript_1A7589:: @ 81A7589
	setmetatile 6, 4, 654, 1
	setmetatile 6, 5, 662, 0
	return

EventScript_1A759C:: @ 81A759C
	setmetatile 5, 11, 669, 1
	setmetatile 6, 11, 670, 1
	setmetatile 7, 11, 671, 1
	setmetatile 5, 12, 677, 1
	setmetatile 6, 12, 678, 1
	setmetatile 7, 12, 679, 1
	return

Movement_1A75D3:: @ 81A75D3
	step_11
	step_end

EventScript_1A75D5:: @ 81A75D5
	special Special_PokemonLeagueLightingEffect
	return

Movement_1A75D9:: @ 81A75D9
	step_63
	step_end

Movement_1A75DB:: @ 81A75DB
	step_62
	step_end

Movement_1A75DD:: @ 81A75DD
	step_1c
	step_1c
	step_1c
	step_end

Movement_1A75E1:: @ 81A75E1
	step_4a
	step_end

Movement_1A75E3:: @ 81A75E3
	step_4b
	step_end

Movement_1A75E5:: @ 81A75E5
	step_5a
	step_end

Movement_1A75E7:: @ 81A75E7
	step_2f
	step_end

Movement_1A75E9:: @ 81A75E9
	step_2e
	step_end

Movement_1A75EB:: @ 81A75EB
	step_30
	step_end

Movement_1A75ED:: @ 81A75ED
	step_2d
	step_end

Movement_1A75EF:: @ 81A75EF
	step_03
	step_end

Movement_1A75F1:: @ 81A75F1
	step_00
	step_end

Movement_1A75F3:: @ 81A75F3
	step_11
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1A75F9:: @ 81A75F9
	step_11
	step_11
	step_11
	step_11
	step_end

Movement_1A75FE:: @ 81A75FE
	step_1c
	step_1c
	step_end

Movement_1A7601:: @ 81A7601
	step_11
	step_end

Movement_1A7603:: @ 81A7603
	step_11
	step_11
	step_end

gUnknown_81A7606:: @ 81A7606
	msgbox gUnknown_81C0DB0, 3
	end

gUnknown_81A760F:: @ 81A760F
	msgbox gUnknown_81C0DFD, 3
	end

gUnknown_81A7618:: @ 81A7618
	msgbox gUnknown_81C0F99, 3
	end

gUnknown_81A7621:: @ 81A7621
	msgbox gUnknown_81C12A7, 3
	end

gUnknown_81A762A:: @ 81A762A
	msgbox gUnknown_81C10C1, 3
	end

gUnknown_81A7633:: @ 81A7633
	msgbox gUnknown_81C1273, 3
	end

gUnknown_81A763C:: @ 81A763C
	msgbox gUnknown_81C0FD8, 3
	end

gUnknown_81A7645:: @ 81A7645
	msgbox gUnknown_81C12D6, 3
	end

gUnknown_81A764E:: @ 81A764E
	msgbox gUnknown_81C1300, 3
	end

gUnknown_81A7657:: @ 81A7657
	msgbox gUnknown_81C0E19, 3
	end

gUnknown_81A7660:: @ 81A7660
	msgbox gUnknown_81C0E40, 3
	end

gUnknown_81A7669:: @ 81A7669
	msgbox gUnknown_81C0E73, 3
	end

gUnknown_81A7672:: @ 81A7672
	msgbox gUnknown_81C0EAC, 3
	end

gUnknown_81A767B:: @ 81A767B
	msgbox gUnknown_81C101B, 3
	end

gUnknown_81A7684:: @ 81A7684
	msgbox gUnknown_81C1060, 3
	end

gUnknown_81A768D:: @ 81A768D
	msgbox gUnknown_81C109C, 3
	end

gUnknown_81A7696:: @ 81A7696
	msgbox gUnknown_81C10FC, 3
	end

gUnknown_81A769F:: @ 81A769F
	msgbox gUnknown_81C1134, 3
	end

gUnknown_81A76A8:: @ 81A76A8
	msgbox gUnknown_81C116E, 3
	end

gUnknown_81A76B1:: @ 81A76B1
	msgbox gUnknown_81C1194, 3
	end

gUnknown_81A76BA:: @ 81A76BA
	msgbox gUnknown_81C11BA, 3
	end

gUnknown_81A76C3:: @ 81A76C3
	msgbox gUnknown_81C11DC, 3
	end

gUnknown_81A76CC:: @ 81A76CC
	msgbox gUnknown_81C1217, 3
	end

gUnknown_81A76D5:: @ 81A76D5
	msgbox gUnknown_81C124B, 3
	end

gUnknown_81A76DE:: @ 81A76DE
	msgbox gUnknown_81C0ECB, 3
	end

gUnknown_81A76E7:: @ 81A76E7
	msgbox gUnknown_81C0EF7, 3
	end

gUnknown_81A76F0:: @ 81A76F0
	msgbox gUnknown_81C0F19, 3
	end

gUnknown_81A76F9:: @ 81A76F9
	msgbox gUnknown_81C0F59, 3
	end

gUnknown_81A7702:: @ 81A7702
	lockall
	textcolor 3
	msgbox Text_1A622C, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A778A
	setvar VAR_0x8004, 14
	call EventScript_1A6AC0
	lock
	faceplayer
	specialvar VAR_0x8008, Special_GetMartClerkObjectId
	textcolor 0
	compare VAR_0x8004, 0
	goto_if eq, EventScript_1A774D
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A778A
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A778C
	end

EventScript_1A774D:: @ 81A774D
	applymovement VAR_0x8008, Movement_1A75F1
	waitmovement 0
	playse SE_PIN
	applymovement VAR_0x8008, Movement_1A75DB
	waitmovement 0
	applymovement VAR_0x8008, Movement_1A75DD
	waitmovement 0
	msgbox Text_1A62D3
	setflag FLAG_SYS_MYSTERY_GIFT_ENABLED
	textcolor 3
	special sub_80699BC
	signmsg
	msgbox Text_1A6359
	normalmsg
	releaseall
	end

EventScript_1A778A:: @ 81A778A
	releaseall
	end

EventScript_1A778C:: @ 81A778C
	applymovement VAR_0x8008, Movement_1A75F1
	waitmovement 0
	msgbox Text_1A6265
	releaseall
	end

gUnknown_81A77A0:: @ 81A77A0
	msgbox Text_1A5375, 3
	end

EventScript_1A77A9:: @ 81A77A9
	return

EventScript_1A77AA:: @ 81A77AA
	setvar VAR_RESULT, 1
	return

EventScript_1A77B0:: @ 81A77B0
	setvar VAR_RESULT, 0
	return

Route16_NorthEntrance_1F_EventScript_1A77B6:: @ 81A77B6
Route18_EastEntrance_1F_EventScript_1A77B6:: @ 81A77B6
	lockall
	clearflag FLAG_SYS_ON_CYCLING_ROAD
	setvar VAR_MAP_SCENE_ROUTE16, 0
	releaseall
	end

Route16_NorthEntrance_1F_EventScript_1A77C1:: @ 81A77C1
Route18_EastEntrance_1F_EventScript_1A77C1:: @ 81A77C1
	lockall
	setvar VAR_MAP_SCENE_ROUTE16, 1
	releaseall
	end

EventScript_1A77C9:: @ 81A77C9
	msgbox Text_1A572A
	playse SE_BOO
	msgbox Text_1A5776
	release
	end

EventScript_1A77DE:: @ 81A77DE
	message Text_1A57C1
	waitmessage
	playse SE_BOO
	waitbuttonpress
	closemessage
	waitse
	release
	end

EventScript_1A77EC:: @ 81A77EC
	message Text_1A579D
	waitmessage
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	release
	end

EventScript_1A77F9:: @ 81A77F9
	msgbox Text_1A5839
	release
	end

EventScript_1A7803:: @ 81A7803
	compare VAR_MAP_SCENE_ROUTE23, VAR_0x4001
	goto_if ge, EventScript_1A77EC
	switch VAR_0x4001
	case 1, EventScript_1A78D5
	case 2, EventScript_1A78E4
	case 3, EventScript_1A78F3
	case 4, EventScript_1A7902
	case 5, EventScript_1A7911
	case 6, EventScript_1A7920
	case 7, EventScript_1A792F
	case 8, EventScript_1A793E
	end

EventScript_1A786C:: @ 81A786C
	compare VAR_MAP_SCENE_ROUTE23, VAR_0x4001
	goto_if ge, EventScript_1A77F9
	switch VAR_0x4001
	case 1, EventScript_1A78D5
	case 2, EventScript_1A78E4
	case 3, EventScript_1A78F3
	case 4, EventScript_1A7902
	case 5, EventScript_1A7911
	case 6, EventScript_1A7920
	case 7, EventScript_1A792F
	case 8, EventScript_1A793E
	end

EventScript_1A78D5:: @ 81A78D5
	checkflag FLAG_BADGE01_GET
	goto_if TRUE, EventScript_1A794D
	goto EventScript_1A77C9
	end

EventScript_1A78E4:: @ 81A78E4
	checkflag FLAG_BADGE02_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A78F3:: @ 81A78F3
	checkflag FLAG_BADGE03_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A7902:: @ 81A7902
	checkflag FLAG_BADGE04_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A7911:: @ 81A7911
	checkflag FLAG_BADGE05_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A7920:: @ 81A7920
	checkflag FLAG_BADGE06_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A792F:: @ 81A792F
	checkflag FLAG_BADGE07_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A793E:: @ 81A793E
	checkflag FLAG_BADGE08_GET
	goto_if TRUE, EventScript_1A795F
	goto EventScript_1A77DE
	end

EventScript_1A794D:: @ 81A794D
	message Text_1A579D
	waitmessage
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_0x4001
	release
	end

EventScript_1A795F:: @ 81A795F
	msgbox Text_1A5839
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_0x4001
	release
	end

EventScript_1A796E:: @ 81A796E
	textcolor 0
	applymovement VAR_0x8009, Movement_1A75E7
	waitmovement 0
	switch VAR_0x4001
	case 1, EventScript_1A79D8
	case 2, EventScript_1A79E7
	case 3, EventScript_1A79F6
	case 4, EventScript_1A7A05
	case 5, EventScript_1A7A14
	case 6, EventScript_1A7A23
	case 7, EventScript_1A7A32
	case 8, EventScript_1A7A41
	end

EventScript_1A79D8:: @ 81A79D8
	checkflag FLAG_BADGE01_GET
	goto_if TRUE, EventScript_1A7A96
	goto EventScript_1A7A50
	end

EventScript_1A79E7:: @ 81A79E7
	checkflag FLAG_BADGE02_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A79F6:: @ 81A79F6
	checkflag FLAG_BADGE03_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A05:: @ 81A7A05
	checkflag FLAG_BADGE04_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A14:: @ 81A7A14
	checkflag FLAG_BADGE05_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A23:: @ 81A7A23
	checkflag FLAG_BADGE06_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A32:: @ 81A7A32
	checkflag FLAG_BADGE07_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A41:: @ 81A7A41
	checkflag FLAG_BADGE08_GET
	goto_if TRUE, EventScript_1A7AA8
	goto EventScript_1A7A77
	end

EventScript_1A7A50:: @ 81A7A50
	msgbox Text_1A572A
	playse SE_BOO
	msgbox Text_1A5776
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A7AB7
	applymovement VAR_0x8009, Movement_1A75ED
	waitmovement 0
	releaseall
	end

EventScript_1A7A77:: @ 81A7A77
	message Text_1A57C1
	waitmessage
	playse SE_BOO
	waitbuttonpress
	closemessage
	waitse
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A7AB7
	applymovement VAR_0x8009, Movement_1A75ED
	waitmovement 0
	releaseall
	end

EventScript_1A7A96:: @ 81A7A96
	message Text_1A579D
	waitmessage
	playfanfare MUS_FANFA1
	waitfanfare
	waitbuttonpress
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_0x4001
	releaseall
	end

EventScript_1A7AA8:: @ 81A7AA8
	msgbox Text_1A5839
	copyvar VAR_MAP_SCENE_ROUTE23, VAR_0x4001
	releaseall
	end

Movement_1A7AB7:: @ 81A7AB7
	step_10
	step_end

EventScript_1A7AB9:: @ 81A7AB9
	special Special_GetElevatorFloor
	return

EventScript_1A7ABD:: @ 81A7ABD
	msgbox Text_1A58A7
	release
	end

EventScript_1A7AC7:: @ 81A7AC7
	msgbox Text_1A594D
	release
	end

EventScript_1A7AD1:: @ 81A7AD1
	msgbox Text_1A5909
	release
	end

gUnknown_81A7ADB:: @ 81A7ADB
	special sub_80CADC4
	release
	end

EventScript_1A7AE0:: @ 81A7AE0
	release
	end

EventScript_1A7AE2:: @ 81A7AE2
	msgbox Text_177460, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A7B70
	msgbox Text_17747B
	checkflag FLAG_POKEMON_MANSION_SWITCH_STATE
	goto_if TRUE, EventScript_1A7B3B
	setflag FLAG_POKEMON_MANSION_SWITCH_STATE
	switch VAR_0x8004
	case 0, EventScript_1A7B7A
	case 1, EventScript_1A7D3E
	case 2, EventScript_1A7E72
	case 3, EventScript_1A7F4C
	end

EventScript_1A7B3B:: @ 81A7B3B
	clearflag FLAG_POKEMON_MANSION_SWITCH_STATE
	switch VAR_0x8004
	case 0, EventScript_1A7C5C
	case 1, EventScript_1A7DD8
	case 2, EventScript_1A7EDF
	case 3, EventScript_1A8025
	end

EventScript_1A7B70:: @ 81A7B70
	msgbox Text_177489
	releaseall
	end

EventScript_1A7B7A:: @ 81A7B7A
	setmetatile 22, 10, 645, 0
	setmetatile 23, 10, 644, 0
	setmetatile 24, 10, 644, 0
	setmetatile 22, 11, 645, 0
	setmetatile 23, 11, 644, 0
	setmetatile 24, 11, 644, 0
	setmetatile 27, 25, 645, 0
	setmetatile 28, 25, 644, 0
	setmetatile 29, 25, 644, 0
	setmetatile 27, 26, 645, 0
	setmetatile 28, 26, 644, 0
	setmetatile 29, 26, 644, 0
	setmetatile 32, 25, 645, 0
	setmetatile 33, 25, 644, 0
	setmetatile 34, 25, 644, 0
	setmetatile 32, 26, 645, 0
	setmetatile 33, 26, 644, 0
	setmetatile 34, 26, 644, 0
	setmetatile 31, 18, 760, 1
	setmetatile 32, 18, 761, 1
	setmetatile 33, 18, 762, 1
	setmetatile 31, 19, 768, 1
	setmetatile 32, 19, 769, 1
	setmetatile 33, 19, 770, 1
	setmetatile 5, 4, 845, 0
	return

EventScript_1A7C5C:: @ 81A7C5C
	setmetatile 22, 10, 760, 1
	setmetatile 23, 10, 761, 1
	setmetatile 24, 10, 762, 1
	setmetatile 22, 11, 768, 1
	setmetatile 23, 11, 769, 1
	setmetatile 24, 11, 770, 1
	setmetatile 27, 25, 760, 1
	setmetatile 28, 25, 761, 1
	setmetatile 29, 25, 762, 1
	setmetatile 27, 26, 768, 1
	setmetatile 28, 26, 769, 1
	setmetatile 29, 26, 770, 1
	setmetatile 32, 25, 760, 1
	setmetatile 33, 25, 761, 1
	setmetatile 34, 25, 762, 1
	setmetatile 32, 26, 768, 1
	setmetatile 33, 26, 769, 1
	setmetatile 34, 26, 770, 1
	setmetatile 31, 18, 645, 0
	setmetatile 32, 18, 644, 0
	setmetatile 33, 18, 644, 0
	setmetatile 31, 19, 645, 0
	setmetatile 32, 19, 644, 0
	setmetatile 33, 19, 644, 0
	setmetatile 5, 4, 788, 0
	return

EventScript_1A7D3E:: @ 81A7D3E
	setmetatile 24, 14, 645, 0
	setmetatile 25, 14, 644, 0
	setmetatile 26, 14, 644, 0
	setmetatile 24, 15, 645, 0
	setmetatile 25, 15, 644, 0
	setmetatile 26, 15, 644, 0
	setmetatile 10, 28, 677, 1
	setmetatile 10, 29, 685, 1
	setmetatile 10, 30, 645, 0
	setmetatile 10, 31, 644, 0
	setmetatile 10, 32, 693, 0
	setmetatile 12, 4, 848, 1
	setmetatile 12, 5, 856, 1
	setmetatile 12, 6, 864, 1
	setmetatile 12, 7, 872, 1
	setmetatile 12, 8, 880, 1
	setmetatile 2, 15, 845, 0
	return

EventScript_1A7DD8:: @ 81A7DD8
	setmetatile 24, 14, 760, 1
	setmetatile 25, 14, 761, 1
	setmetatile 26, 14, 762, 1
	setmetatile 24, 15, 768, 1
	setmetatile 25, 15, 769, 1
	setmetatile 26, 15, 770, 1
	setmetatile 10, 28, 848, 1
	setmetatile 10, 29, 856, 1
	setmetatile 10, 30, 864, 1
	setmetatile 10, 31, 872, 1
	setmetatile 10, 32, 880, 1
	setmetatile 12, 4, 677, 1
	setmetatile 12, 5, 685, 1
	setmetatile 12, 6, 645, 0
	setmetatile 12, 7, 644, 0
	setmetatile 12, 8, 693, 0
	setmetatile 2, 15, 788, 0
	return

EventScript_1A7E72:: @ 81A7E72
	setmetatile 17, 11, 645, 0
	setmetatile 18, 11, 644, 0
	setmetatile 19, 11, 644, 0
	setmetatile 17, 12, 645, 0
	setmetatile 18, 12, 644, 0
	setmetatile 19, 12, 644, 0
	setmetatile 21, 4, 848, 1
	setmetatile 21, 5, 856, 1
	setmetatile 21, 6, 864, 1
	setmetatile 21, 7, 872, 1
	setmetatile 21, 8, 880, 1
	setmetatile 12, 4, 845, 0
	return

EventScript_1A7EDF:: @ 81A7EDF
	setmetatile 17, 11, 760, 1
	setmetatile 18, 11, 761, 1
	setmetatile 19, 11, 762, 1
	setmetatile 17, 12, 768, 1
	setmetatile 18, 12, 769, 1
	setmetatile 19, 12, 770, 1
	setmetatile 21, 4, 677, 1
	setmetatile 21, 5, 685, 1
	setmetatile 21, 6, 645, 0
	setmetatile 21, 7, 644, 0
	setmetatile 21, 8, 693, 0
	setmetatile 12, 4, 788, 0
	return

EventScript_1A7F4C:: @ 81A7F4C
	setmetatile 33, 20, 760, 1
	setmetatile 34, 20, 761, 1
	setmetatile 35, 20, 762, 1
	setmetatile 33, 21, 852, 1
	setmetatile 34, 21, 853, 1
	setmetatile 35, 21, 854, 1
	setmetatile 16, 26, 848, 1
	setmetatile 16, 27, 856, 1
	setmetatile 16, 28, 866, 1
	setmetatile 16, 29, 874, 1
	setmetatile 16, 30, 882, 1
	setmetatile 12, 8, 677, 1
	setmetatile 12, 9, 685, 1
	setmetatile 12, 10, 647, 0
	setmetatile 12, 11, 646, 0
	setmetatile 12, 12, 688, 0
	setmetatile 20, 22, 647, 0
	setmetatile 21, 22, 646, 0
	setmetatile 22, 22, 646, 0
	setmetatile 20, 23, 647, 0
	setmetatile 21, 23, 646, 0
	setmetatile 22, 23, 646, 0
	setmetatile 24, 28, 847, 0
	setmetatile 27, 4, 847, 0
	return

EventScript_1A8025:: @ 81A8025
	setmetatile 33, 20, 647, 0
	setmetatile 34, 20, 646, 0
	setmetatile 35, 20, 646, 0
	setmetatile 33, 21, 647, 0
	setmetatile 34, 21, 646, 0
	setmetatile 35, 21, 646, 0
	setmetatile 16, 26, 677, 1
	setmetatile 16, 27, 685, 1
	setmetatile 16, 28, 647, 0
	setmetatile 16, 29, 646, 0
	setmetatile 16, 30, 688, 0
	setmetatile 12, 8, 848, 1
	setmetatile 12, 9, 856, 1
	setmetatile 12, 10, 866, 1
	setmetatile 12, 11, 874, 1
	setmetatile 12, 12, 882, 1
	setmetatile 20, 22, 760, 1
	setmetatile 21, 22, 761, 1
	setmetatile 22, 22, 762, 1
	setmetatile 20, 23, 852, 1
	setmetatile 21, 23, 853, 1
	setmetatile 22, 23, 854, 1
	setmetatile 24, 28, 790, 0
	setmetatile 27, 4, 790, 0
	return

EventScript_1A80FE:: @ 81A80FE
	lockall
	applymovement VAR_0x8004, Movement_1A75E7
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Movement_1A75E9
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Movement_1A75EB
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Movement_1A75ED
	waitmovement 0
	delay 20
	releaseall
	end

EventScript_NeedCardKey:: @ 81A8135
	msgbox Text_ItNeedsCardKey
	releaseall
	end

EventScript_DoorUnlocked:: @ 81A813F
	msgbox Text_TheDoorIsOpen
	releaseall
	end

EventScript_Close2FDoor1:: @ 81A8149
	setmetatile 5, 8, 944, 1
	setmetatile 6, 8, 945, 1
	setmetatile 5, 9, 952, 1
	setmetatile 6, 9, 953, 1
	setmetatile 6, 10, 821, 0
	return

EventScript_Close2FDoor2:: @ 81A8177
	setmetatile 5, 15, 944, 1
	setmetatile 6, 15, 945, 1
	setmetatile 5, 16, 952, 1
	setmetatile 6, 16, 953, 1
	setmetatile 6, 17, 821, 0
	return

EventScript_Close3FDoor1:: @ 81A81A5
	setmetatile 9, 11, 960, 1
	setmetatile 10, 11, 961, 1
	setmetatile 9, 12, 962, 1
	setmetatile 10, 12, 963, 1
	setmetatile 9, 13, 964, 1
	setmetatile 10, 13, 965, 1
	return

EventScript_Close3FDoor2:: @ 81A81DC
	setmetatile 20, 11, 960, 1
	setmetatile 21, 11, 961, 1
	setmetatile 20, 12, 962, 1
	setmetatile 21, 12, 963, 1
	setmetatile 20, 13, 964, 1
	setmetatile 21, 13, 965, 1
	return

EventScript_Close4FDoor1:: @ 81A8213
	setmetatile 3, 16, 944, 1
	setmetatile 4, 16, 945, 1
	setmetatile 3, 17, 952, 1
	setmetatile 4, 17, 953, 1
	setmetatile 4, 18, 821, 0
	return

EventScript_Close4FDoor2:: @ 81A8241
	setmetatile 14, 11, 944, 1
	setmetatile 15, 11, 945, 1
	setmetatile 14, 12, 952, 1
	setmetatile 15, 12, 953, 1
	setmetatile 15, 13, 821, 0
	return

EventScript_Close5FDoor1:: @ 81A826F
	setmetatile 7, 8, 960, 1
	setmetatile 8, 8, 961, 1
	setmetatile 7, 9, 962, 1
	setmetatile 8, 9, 963, 1
	setmetatile 7, 10, 964, 1
	setmetatile 8, 10, 965, 1
	return

EventScript_Close5FDoor2:: @ 81A82A6
	setmetatile 7, 17, 960, 1
	setmetatile 8, 17, 961, 1
	setmetatile 7, 18, 962, 1
	setmetatile 8, 18, 963, 1
	setmetatile 7, 19, 964, 1
	setmetatile 8, 19, 965, 1
	return

EventScript_Close5FDoor3:: @ 81A82DD
	setmetatile 18, 12, 960, 1
	setmetatile 19, 12, 961, 1
	setmetatile 18, 13, 962, 1
	setmetatile 19, 13, 963, 1
	setmetatile 18, 14, 964, 1
	setmetatile 19, 14, 965, 1
	return

EventScript_Close6FDoor:: @ 81A8314
	setmetatile 5, 14, 960, 1
	setmetatile 6, 14, 961, 1
	setmetatile 5, 15, 962, 1
	setmetatile 6, 15, 963, 1
	setmetatile 5, 16, 964, 1
	setmetatile 6, 16, 965, 1
	return

EventScript_Close7FDoor1:: @ 81A834B
	setmetatile 11, 8, 944, 1
	setmetatile 12, 8, 945, 1
	setmetatile 11, 9, 952, 1
	setmetatile 12, 9, 953, 1
	setmetatile 12, 10, 821, 0
	return

EventScript_Close7FDoor2:: @ 81A8379
	setmetatile 24, 7, 944, 1
	setmetatile 25, 7, 945, 1
	setmetatile 24, 8, 952, 1
	setmetatile 25, 8, 953, 1
	setmetatile 25, 9, 821, 0
	return

EventScript_Close7FDoor3:: @ 81A83A7
	setmetatile 25, 13, 944, 1
	setmetatile 26, 13, 945, 1
	setmetatile 25, 14, 952, 1
	setmetatile 26, 14, 953, 1
	setmetatile 26, 15, 821, 0
	return

EventScript_Close8FDoor:: @ 81A83D5
	setmetatile 5, 9, 960, 1
	setmetatile 6, 9, 961, 1
	setmetatile 5, 10, 962, 1
	setmetatile 6, 10, 963, 1
	setmetatile 5, 11, 964, 1
	setmetatile 6, 11, 965, 1
	return

EventScript_Close9FDoor1:: @ 81A840C
	setmetatile 2, 9, 960, 1
	setmetatile 3, 9, 961, 1
	setmetatile 2, 10, 962, 1
	setmetatile 3, 10, 963, 1
	setmetatile 2, 11, 964, 1
	setmetatile 3, 11, 965, 1
	return

EventScript_Close9FDoor2:: @ 81A8443
	setmetatile 12, 15, 960, 1
	setmetatile 13, 15, 961, 1
	setmetatile 12, 16, 962, 1
	setmetatile 13, 16, 963, 1
	setmetatile 12, 17, 964, 1
	setmetatile 13, 17, 965, 1
	return

EventScript_Close9FDoor3:: @ 81A847A
	setmetatile 21, 6, 944, 1
	setmetatile 22, 6, 945, 1
	setmetatile 21, 7, 952, 1
	setmetatile 22, 7, 953, 1
	setmetatile 22, 8, 821, 0
	return

EventScript_Close9FDoor4:: @ 81A84A8
	setmetatile 21, 12, 944, 1
	setmetatile 22, 12, 945, 1
	setmetatile 21, 13, 952, 1
	setmetatile 22, 13, 953, 1
	setmetatile 22, 14, 821, 0
	return

EventScript_Close10FDoor:: @ 81A84D6
	setmetatile 12, 11, 944, 1
	setmetatile 13, 11, 945, 1
	setmetatile 12, 12, 952, 1
	setmetatile 13, 12, 953, 1
	setmetatile 13, 13, 821, 0
	return

EventScript_Close11FDoor:: @ 81A8504
	setmetatile 5, 16, 944, 1
	setmetatile 6, 16, 945, 1
	setmetatile 5, 17, 952, 1
	setmetatile 6, 17, 953, 1
	setmetatile 6, 18, 821, 0
	return

EventScript_Open2FDoor1:: @ 81A8532
	setmetatile 5, 8, 821, 0
	setmetatile 6, 8, 820, 0
	setmetatile 5, 9, 821, 0
	setmetatile 6, 9, 820, 0
	setmetatile 6, 10, 820, 0
	return

EventScript_Open2FDoor2:: @ 81A8560
	setmetatile 5, 15, 821, 0
	setmetatile 6, 15, 820, 0
	setmetatile 5, 16, 821, 0
	setmetatile 6, 16, 820, 0
	setmetatile 6, 17, 820, 0
	return

EventScript_Open3FDoor1:: @ 81A858E
	setmetatile 9, 11, 839, 1
	setmetatile 10, 11, 838, 1
	setmetatile 9, 12, 821, 0
	setmetatile 10, 12, 821, 0
	setmetatile 9, 13, 825, 0
	setmetatile 10, 13, 826, 0
	return

EventScript_Open3FDoor2:: @ 81A85C5
	setmetatile 20, 11, 839, 1
	setmetatile 21, 11, 838, 1
	setmetatile 20, 12, 821, 0
	setmetatile 21, 12, 821, 0
	setmetatile 20, 13, 825, 0
	setmetatile 21, 13, 826, 0
	return

EventScript_Open4FDoor1:: @ 81A85FC
	setmetatile 3, 16, 821, 0
	setmetatile 4, 16, 820, 0
	setmetatile 3, 17, 821, 0
	setmetatile 4, 17, 820, 0
	setmetatile 4, 18, 820, 0
	return

EventScript_Open4FDoor2:: @ 81A862A
	setmetatile 14, 11, 821, 0
	setmetatile 15, 11, 820, 0
	setmetatile 14, 12, 821, 0
	setmetatile 15, 12, 820, 0
	setmetatile 15, 13, 820, 0
	return

EventScript_Open5FDoor1:: @ 81A8658
	setmetatile 7, 8, 839, 1
	setmetatile 8, 8, 838, 1
	setmetatile 7, 9, 821, 0
	setmetatile 8, 9, 821, 0
	setmetatile 7, 10, 825, 0
	setmetatile 8, 10, 826, 0
	return

EventScript_Open5FDoor2:: @ 81A868F
	setmetatile 7, 17, 839, 1
	setmetatile 8, 17, 838, 1
	setmetatile 7, 18, 821, 0
	setmetatile 8, 18, 821, 0
	setmetatile 7, 19, 825, 0
	setmetatile 8, 19, 826, 0
	return

EventScript_Open5FDoor3:: @ 81A86C6
	setmetatile 18, 12, 839, 1
	setmetatile 19, 12, 838, 1
	setmetatile 18, 13, 821, 0
	setmetatile 19, 13, 821, 0
	setmetatile 18, 14, 825, 0
	setmetatile 19, 14, 826, 0
	return

EventScript_Open6FDoor:: @ 81A86FD
	setmetatile 5, 14, 839, 1
	setmetatile 6, 14, 838, 1
	setmetatile 5, 15, 821, 0
	setmetatile 6, 15, 821, 0
	setmetatile 5, 16, 825, 0
	setmetatile 6, 16, 826, 0
	return

EventScript_Open7FDoor1:: @ 81A8734
	setmetatile 11, 8, 821, 0
	setmetatile 12, 8, 820, 0
	setmetatile 11, 9, 821, 0
	setmetatile 12, 9, 820, 0
	setmetatile 12, 10, 820, 0
	return

EventScript_Open7FDoor2:: @ 81A8762
	setmetatile 24, 7, 821, 0
	setmetatile 25, 7, 820, 0
	setmetatile 24, 8, 821, 0
	setmetatile 25, 8, 820, 0
	setmetatile 25, 9, 820, 0
	return

EventScript_Open7FDoor3:: @ 81A8790
	setmetatile 25, 13, 821, 0
	setmetatile 26, 13, 820, 0
	setmetatile 25, 14, 821, 0
	setmetatile 26, 14, 820, 0
	setmetatile 26, 15, 820, 0
	return

EventScript_Open8FDoor:: @ 81A87BE
	setmetatile 5, 9, 839, 1
	setmetatile 6, 9, 838, 1
	setmetatile 5, 10, 821, 0
	setmetatile 6, 10, 821, 0
	setmetatile 5, 11, 825, 0
	setmetatile 6, 11, 826, 0
	return

EventScript_Open9FDoor1:: @ 81A87F5
	setmetatile 2, 9, 839, 1
	setmetatile 3, 9, 838, 1
	setmetatile 2, 10, 821, 0
	setmetatile 3, 10, 821, 0
	setmetatile 2, 11, 825, 0
	setmetatile 3, 11, 826, 0
	return

EventScript_Open9FDoor2:: @ 81A882C
	setmetatile 12, 15, 839, 1
	setmetatile 13, 15, 838, 1
	setmetatile 12, 16, 821, 0
	setmetatile 13, 16, 821, 0
	setmetatile 12, 17, 825, 0
	setmetatile 13, 17, 826, 0
	return

EventScript_Open9FDoor3:: @ 81A8863
	setmetatile 21, 6, 821, 0
	setmetatile 22, 6, 820, 0
	setmetatile 21, 7, 821, 0
	setmetatile 22, 7, 820, 0
	setmetatile 22, 8, 820, 0
	return

EventScript_Open9FDoor4:: @ 81A8891
	setmetatile 21, 12, 821, 0
	setmetatile 22, 12, 820, 0
	setmetatile 21, 13, 821, 0
	setmetatile 22, 13, 820, 0
	setmetatile 22, 14, 820, 0
	return

EventScript_Open10FDoor:: @ 81A88BF
	setmetatile 12, 11, 821, 0
	setmetatile 13, 11, 820, 0
	setmetatile 12, 12, 821, 0
	setmetatile 13, 12, 820, 0
	setmetatile 13, 13, 820, 0
	return

EventScript_Open11FDoor:: @ 81A88ED
	setmetatile 5, 16, 821, 0
	setmetatile 6, 16, 820, 0
	setmetatile 5, 17, 821, 0
	setmetatile 6, 17, 820, 0
	setmetatile 6, 18, 820, 0
	return

SilphCo_2F_EventScript_Door1:: @ 81A891B
	lockall
	setvar VAR_0x4001, 1
	setvar VAR_0x8004, 634
	checkflag FLAG_SILPH_2F_DOOR_1
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_2F_EventScript_Door2:: @ 81A8935
	lockall
	setvar VAR_0x4001, 2
	setvar VAR_0x8004, 635
	checkflag FLAG_SILPH_2F_DOOR_2
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_3F_EventScript_Door1:: @ 81A894F
	lockall
	setvar VAR_0x4001, 3
	setvar VAR_0x8004, 636
	checkflag FLAG_SILPH_3F_DOOR_1
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_3F_EventScript_Door2:: @ 81A8969
	lockall
	setvar VAR_0x4001, 4
	setvar VAR_0x8004, 637
	checkflag FLAG_SILPH_3F_DOOR_2
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_4F_EventScript_Door1:: @ 81A8983
	lockall
	setvar VAR_0x4001, 5
	setvar VAR_0x8004, 638
	checkflag FLAG_SILPH_4F_DOOR_1
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_4F_EventScript_Door2:: @ 81A899D
	lockall
	setvar VAR_0x4001, 6
	setvar VAR_0x8004, 639
	checkflag FLAG_SILPH_4F_DOOR_2
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_5F_EventScript_Door1:: @ 81A89B7
	lockall
	setvar VAR_0x4001, 7
	setvar VAR_0x8004, 640
	checkflag FLAG_SILPH_5F_DOOR_1
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_5F_EventScript_Door2:: @ 81A89D1
	lockall
	setvar VAR_0x4001, 8
	setvar VAR_0x8004, 641
	checkflag FLAG_SILPH_5F_DOOR_2
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_5F_EventScript_Door3:: @ 81A89EB
	lockall
	setvar VAR_0x4001, 9
	setvar VAR_0x8004, 642
	checkflag FLAG_SILPH_5F_DOOR_3
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_6F_EventScript_Door:: @ 81A8A05
	lockall
	setvar VAR_0x4001, 10
	setvar VAR_0x8004, 643
	checkflag FLAG_SILPH_6F_DOOR
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_7F_EventScript_Door1:: @ 81A8A1F
	lockall
	setvar VAR_0x4001, 11
	setvar VAR_0x8004, 644
	checkflag FLAG_SILPH_7F_DOOR_1
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_7F_EventScript_Door2:: @ 81A8A39
	lockall
	setvar VAR_0x4001, 12
	setvar VAR_0x8004, 645
	checkflag FLAG_SILPH_7F_DOOR_2
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_7F_EventScript_Door3:: @ 81A8A53
	lockall
	setvar VAR_0x4001, 13
	setvar VAR_0x8004, 646
	checkflag FLAG_SILPH_7F_DOOR_3
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_8F_EventScript_Door:: @ 81A8A6D
	lockall
	setvar VAR_0x4001, 14
	setvar VAR_0x8004, 647
	checkflag FLAG_SILPH_8F_DOOR
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_9F_EventScript_Door1:: @ 81A8A87
	lockall
	setvar VAR_0x4001, 15
	setvar VAR_0x8004, 648
	checkflag FLAG_SILPH_9F_DOOR_1
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_9F_EventScript_Door2:: @ 81A8AA1
	lockall
	setvar VAR_0x4001, 16
	setvar VAR_0x8004, 649
	checkflag FLAG_SILPH_9F_DOOR_2
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_9F_EventScript_Door3:: @ 81A8ABB
	lockall
	setvar VAR_0x4001, 17
	setvar VAR_0x8004, 650
	checkflag FLAG_SILPH_9F_DOOR_3
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_9F_EventScript_Door4:: @ 81A8AD5
	lockall
	setvar VAR_0x4001, 18
	setvar VAR_0x8004, 651
	checkflag FLAG_SILPH_9F_DOOR_4
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_10F_EventScript_Door:: @ 81A8AEF
	lockall
	setvar VAR_0x4001, 19
	setvar VAR_0x8004, 652
	checkflag FLAG_SILPH_10F_DOOR
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

SilphCo_11F_EventScript_Door:: @ 81A8B09
	lockall
	setvar VAR_0x4001, 20
	setvar VAR_0x8004, 653
	checkflag FLAG_SILPH_11F_DOOR
	goto_if TRUE, EventScript_DoorUnlocked
	goto EventScript_TryUnlockDoor
	end

EventScript_TryUnlockDoor:: @ 81A8B23
	checkflag FLAG_HIDE_SILPH_CO_5F_CARD_KEY
	goto_if TRUE, EventScript_OpenDoor
	goto EventScript_NeedCardKey
	end

EventScript_OpenDoor:: @ 81A8B32
	playfanfare MUS_FANFA1
	msgbox Text_CardKeyOpenedDoor
	waitfanfare
	compare VAR_0x4001, 1
	call_if eq, EventScript_Open2FDoor1
	compare VAR_0x4001, 2
	call_if eq, EventScript_Open2FDoor2
	compare VAR_0x4001, 3
	call_if eq, EventScript_Open3FDoor1
	compare VAR_0x4001, 4
	call_if eq, EventScript_Open3FDoor2
	compare VAR_0x4001, 5
	call_if eq, EventScript_Open4FDoor1
	compare VAR_0x4001, 6
	call_if eq, EventScript_Open4FDoor2
	compare VAR_0x4001, 7
	call_if eq, EventScript_Open5FDoor1
	compare VAR_0x4001, 8
	call_if eq, EventScript_Open5FDoor2
	compare VAR_0x4001, 9
	call_if eq, EventScript_Open5FDoor3
	compare VAR_0x4001, 10
	call_if eq, EventScript_Open6FDoor
	compare VAR_0x4001, 11
	call_if eq, EventScript_Open7FDoor1
	compare VAR_0x4001, 12
	call_if eq, EventScript_Open7FDoor2
	compare VAR_0x4001, 13
	call_if eq, EventScript_Open7FDoor3
	compare VAR_0x4001, 14
	call_if eq, EventScript_Open8FDoor
	compare VAR_0x4001, 15
	call_if eq, EventScript_Open9FDoor1
	compare VAR_0x4001, 16
	call_if eq, EventScript_Open9FDoor2
	compare VAR_0x4001, 17
	call_if eq, EventScript_Open9FDoor3
	compare VAR_0x4001, 18
	call_if eq, EventScript_Open9FDoor4
	compare VAR_0x4001, 19
	call_if eq, EventScript_Open10FDoor
	compare VAR_0x4001, 20
	call_if eq, EventScript_Open11FDoor
	waitse
	playse SE_KI_GASYAN
	special DrawWholeMapView
	waitse
	special Special_SetHiddenItemFlag
	releaseall
	end

EventScript_1A8C27:: @ 81A8C27
	countpokemon
	subvar VAR_RESULT, 1
	copyvar VAR_0x8004, VAR_RESULT
	return

EventScript_1A8C33:: @ 81A8C33
	fadescreen 1
	special ChangeBoxPokemonNickname
	waitstate
	lock
	faceplayer
	return

EventScript_1A8C3C:: @ 81A8C3C
	bufferboxname 0, VAR_0x4037
	getspeciesname 1, VAR_0x4001
	checkflag FLAG_SYS_NOT_SOMEONES_PC
	call_if FALSE, EventScript_1A8C57
	checkflag FLAG_SYS_NOT_SOMEONES_PC
	call_if TRUE, EventScript_1A8C82
	return

EventScript_1A8C57:: @ 81A8C57
	specialvar VAR_RESULT, sub_80CC7B4
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A8C70
	msgbox Text_1A5CF1
	return

EventScript_1A8C70:: @ 81A8C70
	specialvar VAR_RESULT, get_unknown_box_id
	bufferboxname 2, VAR_RESULT
	msgbox Text_1A5D6E
	return

EventScript_1A8C82:: @ 81A8C82
	specialvar VAR_RESULT, sub_80CC7B4
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A8C9B
	msgbox Text_1A5D31
	return

EventScript_1A8C9B:: @ 81A8C9B
	specialvar VAR_RESULT, get_unknown_box_id
	bufferboxname 2, VAR_RESULT
	msgbox Text_1A5DB1
	return

EventScript_1A8CAD:: @ 81A8CAD
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	return

EventScript_1A8CBD:: @ 81A8CBD
	special Special_ChooseMonFromParty
	waitstate
	lock
	faceplayer
	copyvar VAR_0x800A, VAR_0x8004
	return

EventScript_1A8CC9:: @ 81A8CC9
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	return

EventScript_1A8CD9:: @ 81A8CD9
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	lock
	faceplayer
	return

gUnknown_81A8CED:: @ 81A8CED
	special sub_810C3A4
	waitstate
	special sub_810C444
	releaseall
	end

CeruleanCity_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
CinnabarIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
FiveIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
FuchsiaCity_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
OneIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
PewterCity_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
SevenIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
VermilionCity_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
FourIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
SixIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
ThreeIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
TwoIsland_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
Route10_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
Route10_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
Route4_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
SaffronCity_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
IndigoPlateau_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
CeladonCity_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
LavenderTown_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
ViridianCity_PokemonCenter_2F_EventScript_1A8CF6:: @ 81A8CF6
	call EventScript_1BBA04
	end

CeruleanCity_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
CinnabarIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
FiveIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
FuchsiaCity_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
OneIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
PewterCity_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
SevenIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
VermilionCity_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
FourIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
SixIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
ThreeIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
TwoIsland_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
Route10_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
Route10_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
Route4_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
SaffronCity_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
IndigoPlateau_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
CeladonCity_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
LavenderTown_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
ViridianCity_PokemonCenter_2F_EventScript_1A8CFC:: @ 81A8CFC
	call EventScript_1BBB6A
	end

CeruleanCity_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
CinnabarIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
FiveIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
FuchsiaCity_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
OneIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
PewterCity_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
SevenIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
VermilionCity_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
FourIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
SixIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
ThreeIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
TwoIsland_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
Route10_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
Route10_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
Route4_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
SaffronCity_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
IndigoPlateau_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
CeladonCity_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
LavenderTown_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
ViridianCity_PokemonCenter_2F_EventScript_1A8D02:: @ 81A8D02
	call EventScript_1BBB9C
	end

VermilionCity_PokemonCenter_1F_EventScript_1A8D08:: @ 81A8D08
	lock
	faceplayer
	checkflag FLAG_GOT_VS_SEEKER
	goto_if TRUE, EventScript_1A8D3F
	msgbox Text_194234
	setflag FLAG_GOT_VS_SEEKER
	giveitem ITEM_VS_SEEKER
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A6BF9
	msgbox Text_19430F
	release
	end

EventScript_1A8D3F:: @ 81A8D3F
	msgbox Text_194381
	release
	end

EventScript_ItemfinderDigUpUnderfootItem:: @ 81A8D49
	lockall
	textcolor 3
	waitse
	call EventScript_GiveItem
	compare VAR_0x8007, 1
	goto_if eq, EventScript_DigUpItemPutInPocket
	compare VAR_0x8007, 0
	goto_if eq, EventScript_DigUpItemBagIsFull
	end

EventScript_DigUpItemPutInPocket::
	message Text_1A5700
	waitfanfare
	waitmessage
	delay 60
	msgbox gUnknown_81A5218
	special Special_SetHiddenItemFlag
	releaseall
	end

EventScript_DigUpItemBagIsFull::
	msgbox Text_1A5700
	msgbox gUnknown_81A5242
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_AfterWhiteOutHeal:: @ 81A8D97
	lockall
	textcolor 1
	msgbox Text_1A5E89
	call EventScript_PkmnCenterNurse_TakeAndHealPkmn
	checkflag FLAG_DEFEATED_BROCK
	call_if FALSE, EventScript_1A8DC6
	checkflag FLAG_DEFEATED_BROCK
	call_if TRUE, EventScript_1A8DCF
	applymovement VAR_LAST_TALKED, Movement_1A666C
	waitmovement 0
	fadedefaultbgm
	releaseall
	end

EventScript_1A8DC6:: @ 81A8DC6
	msgbox Text_1A5EC0
	return

EventScript_1A8DCF:: @ 81A8DCF
	msgbox Text_1A5F9B
	return

EventScript_MomHeal:: @ 81A8DD8
	lockall
	textcolor 1
	applymovement 1, Movement_1A75ED
	waitmovement 0
	msgbox Text_1A5FDF
	call EventScript_FadeOut_Heal_FadeIn
	msgbox Text_1A6046
	fadedefaultbgm
	releaseall
	end

EventScript_PoisonWhiteOut:: @ 81A8DFD
	lockall
	textcolor 3
	special ExecuteWhiteOut
	waitstate
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A8E11
	releaseall
	end

EventScript_1A8E11:: @ 81A8E11
	checkmoney 1, 0
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1A8E2E
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A8E3C
	end

EventScript_1A8E2E:: @ 81A8E2E
	msgbox Text_1A61E5
	goto EventScript_1A8E4D
	end

EventScript_1A8E3C:: @ 81A8E3C
	special Special_OverworldWhiteOutGetMoneyLoss
	msgbox Text_1A6197
	goto EventScript_1A8E4D
	end

EventScript_1A8E4D:: @ 81A8E4D
	special sub_807F0B0
	waitstate
	fadescreen 1
	special sp0C8_whiteout_maybe
	waitstate
	end

gStdScript_8:: @ 81A8E58
	bufferitemnameplural 1, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_1A8E6F
	msgbox gUnknown_81A5218
	return

EventScript_1A8E6F:: @ 81A8E6F
	switch VAR_RESULT
	case 1, EventScript_1A8EAC
	case 2, EventScript_1A8EB1
	case 3, EventScript_1A8EB6
	case 4, EventScript_1A8EBB
	case 5, EventScript_1A8EC0
	end

EventScript_1A8EAC:: @ 81A8EAC
	getstdstring 2, 24
	return

EventScript_1A8EB1:: @ 81A8EB1
	getstdstring 2, 25
	return

EventScript_1A8EB6:: @ 81A8EB6
	getstdstring 2, 26
	return

EventScript_1A8EBB:: @ 81A8EBB
	getstdstring 2, 27
	return

EventScript_1A8EC0:: @ 81A8EC0
	getstdstring 2, 28
	return

EventScript_1A8EC5:: @ 81A8EC5
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if ge, EventScript_1A911E
	compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
	goto_if ge, EventScript_1A8F12
	multichoice 19, 6, MULTICHOICE_ISLAND_23, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A8FF9
	case 1, EventScript_1A9004
	case 2, EventScript_1A90F6
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A8F12:: @ 81A8F12
	multichoice 19, 5, MULTICHOICE_SEAGALLOP_V23, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A8FE3
	case 1, EventScript_1A8FF9
	case 2, EventScript_1A9004
	case 3, EventScript_1A90F6
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A8F54:: @ 81A8F54
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if ge, EventScript_1A911E
	compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
	goto_if ge, EventScript_1A8FA1
	multichoice 19, 6, MULTICHOICE_ISLAND_13, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A8FEE
	case 1, EventScript_1A9004
	case 2, EventScript_1A90F6
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A8FA1:: @ 81A8FA1
	multichoice 19, 5, MULTICHOICE_SEAGALLOP_V13, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A8FE3
	case 1, EventScript_1A8FEE
	case 2, EventScript_1A9004
	case 3, EventScript_1A90F6
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A8FE3:: @ 81A8FE3
	setvar VAR_0x8006, SEAGALLOP_VERMILION_CITY
	goto EventScript_1A909E
	end

EventScript_1A8FEE:: @ 81A8FEE
	setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A8FF9:: @ 81A8FF9
	setvar VAR_0x8006, SEAGALLOP_TWO_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A9004:: @ 81A9004
	setvar VAR_0x8006, SEAGALLOP_THREE_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A900F:: @ 81A900F
	compare VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 5
	goto_if ge, EventScript_1A911E
	compare VAR_MAP_SCENE_CINNABAR_ISLAND, 4
	goto_if ge, EventScript_1A905C
	multichoice 19, 6, MULTICHOICE_ISLAND_12, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A8FEE
	case 1, EventScript_1A8FF9
	case 2, EventScript_1A90F6
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A905C:: @ 81A905C
	multichoice 19, 5, MULTICHOICE_SEAGALLOP_V12, FALSE
	switch VAR_RESULT
	case 0, EventScript_1A8FE3
	case 1, EventScript_1A8FEE
	case 2, EventScript_1A8FF9
	case 3, EventScript_1A90F6
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A909E:: @ 81A909E
	specialvar VAR_RESULT, sub_8147500
	getnumberstring 0, VAR_RESULT
	compare VAR_0x8004, SEAGALLOP_VERMILION_CITY
	goto_if eq, EventScript_1A90BE
	compare VAR_0x8004, SEAGALLOP_VERMILION_CITY
	goto_if ne, EventScript_1A90CC
	end

EventScript_1A90BE:: @ 81A90BE
	msgbox Text_17FB67
	goto EventScript_1A90DA
	end

EventScript_1A90CC:: @ 81A90CC
	msgbox Text_1A641B
	goto EventScript_1A90DA
	end

EventScript_1A90DA:: @ 81A90DA
	closemessage
	delay 20
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	fadescreen 1
	special ScrSpecial_SeagallopFerry
	waitstate
	end

EventScript_1A90F6:: @ 81A90F6
	specialvar VAR_RESULT, sub_8147594
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9108
	release
	end

EventScript_1A9108:: @ 81A9108
	closemessage
	applymovement 6, Movement_1A75E5
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A911C
	waitmovement 0
	releaseall
	end

Movement_1A911C:: @ 81A911C
	step_11
	step_end

EventScript_1A911E:: @ 81A911E
	setvar VAR_0x8005, 0
	special Special_DrawSeagallopDestinationMenu
	waitstate
	specialvar VAR_0x8006, Special_GetSelectedSeagallopDestination
	switch VAR_0x8006
	case SEAGALLOP_VERMILION_CITY, EventScript_1A91D5
	case SEAGALLOP_ONE_ISLAND,     EventScript_1A91E0
	case SEAGALLOP_TWO_ISLAND,     EventScript_1A91EB
	case SEAGALLOP_THREE_ISLAND,   EventScript_1A91F6
	case SEAGALLOP_FOUR_ISLAND,    EventScript_1A9201
	case SEAGALLOP_MORE,           EventScript_1A917F
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A917F:: @ 81A917F
	setvar VAR_0x8005, 1
	special Special_DrawSeagallopDestinationMenu
	waitstate
	specialvar VAR_0x8006, Special_GetSelectedSeagallopDestination
	switch VAR_0x8006
	case SEAGALLOP_FOUR_ISLAND,  EventScript_1A9201
	case SEAGALLOP_FIVE_ISLAND,  EventScript_1A920C
	case SEAGALLOP_SIX_ISLAND,   EventScript_1A9217
	case SEAGALLOP_SEVEN_ISLAND, EventScript_1A9222
	case SEAGALLOP_MORE,           EventScript_1A911E
	case SCR_MENU_CANCEL, EventScript_1A90F6
	end

EventScript_1A91D5:: @ 81A91D5
	setvar VAR_0x8006, SEAGALLOP_VERMILION_CITY
	goto EventScript_1A909E
	end

EventScript_1A91E0:: @ 81A91E0
	setvar VAR_0x8006, SEAGALLOP_ONE_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A91EB:: @ 81A91EB
	setvar VAR_0x8006, SEAGALLOP_TWO_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A91F6:: @ 81A91F6
	setvar VAR_0x8006, SEAGALLOP_THREE_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A9201:: @ 81A9201
	setvar VAR_0x8006, SEAGALLOP_FOUR_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A920C:: @ 81A920C
	setvar VAR_0x8006, SEAGALLOP_FIVE_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A9217:: @ 81A9217
	setvar VAR_0x8006, SEAGALLOP_SIX_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A9222:: @ 81A9222
	setvar VAR_0x8006, SEAGALLOP_SEVEN_ISLAND
	goto EventScript_1A909E
	end

EventScript_1A922D:: @ 81A922D
	fadescreen 1
	removeobject VAR_LAST_TALKED
	fadescreen 0
	release
	end

EventScript_1A9236:: @ 81A9236
	fadescreen 1
	removeobject VAR_LAST_TALKED
	fadescreen 0
	getspeciesname 0, VAR_0x8004
	msgbox Text_1A63C4
	release
	end

EventScript_1A924B:: @ 81A924B
	message Text_1853E8
	waitmessage
	playfanfare MUS_POKEFUE
	waitfanfare
	msgbox Text_185354
	return

EventScript_1A925E:: @ 81A925E
	checkflag FLAG_SYS_UNLOCKED_TANOBY_RUINS
	goto_if TRUE, EventScript_1A77A9
	setweather 11
	doweather
	return

EventScript_BrailleCursorWaitButton:: @ 81A926C
	special Special_BrailleCursorToggle
	waitbuttonpress
	playse SE_SELECT
	setvar VAR_0x8006, 1
	special Special_BrailleCursorToggle
	return

EventScript_1A927C:: @ 81A927C
	textcolor 3
	msgbox gUnknown_81A5E31
	release
	end

gUnknown_81A9288:: @ 81A9288
	.braille "UP$"

gUnknown_81A928B:: @ 81A928B
	.braille "DOWN$"

gUnknown_81A9290:: @ 81A9290
	.braille "RIGHT$"

gUnknown_81A9296:: @ 81A9296
	.braille "LEFT$"

gUnknown_81A929B:: @ 81A929B
	.braille "CUT$"

gUnknown_81A929F:: @ 81A929F
	.braille "ABC$"

gUnknown_81A92A3:: @ 81A92A3
	.braille "GHI$"

gUnknown_81A92A7:: @ 81A92A7
	.braille "MNO$"

gUnknown_81A92AB:: @ 81A92AB
	.braille "TUV$"

gUnknown_81A92AF:: @ 81A92AF
	.braille "DEF$"

gUnknown_81A92B3:: @ 81A92B3
	.braille "JKL$"

gUnknown_81A92B7:: @ 81A92B7
	.braille "PQRS$"

gUnknown_81A92BC:: @ 81A92BC
	.braille "WXYZ$"

gUnknown_81A92C1:: @ 81A92C1
	.braille ".$"

gUnknown_81A92C3:: @ 81A92C3
	.braille ",$"

gUnknown_81A92C5:: @ 81A92C5
	.braille "EVERYTHING$"

gUnknown_81A92D0:: @ 81A92D0
	.braille "HAS MEANING$"

gUnknown_81A92DC:: @ 81A92DC
	.braille "EXISTENCE$"

gUnknown_81A92E6:: @ 81A92E6
	.braille "HAS MEANING$"

gUnknown_81A92F2:: @ 81A92F2
	.braille "BEING ALIVE$"

gUnknown_81A92FE:: @ 81A92FE
	.braille "HAS MEANING$"

gUnknown_81A930A:: @ 81A930A
	.braille "HAVE DREAMS$"

gUnknown_81A9316:: @ 81A9316
	.braille "USE POWER.$"

gUnknown_81A9321:: @ 81A9321
	.braille "LET THE TWO$"

gUnknown_81A932D:: @ 81A932D
	.braille "GLITTERING$"

gUnknown_81A9338:: @ 81A9338
	.braille "STONES$"

gUnknown_81A933F:: @ 81A933F
	.braille "ONE IN RED$"

gUnknown_81A934A:: @ 81A934A
	.braille "ONE IN BLUE$"

gUnknown_81A9356:: @ 81A9356
	.braille "CONNECT THE$"

gUnknown_81A9362:: @ 81A9362
	.braille "PAST.$"

gUnknown_81A9368:: @ 81A9368
	.braille "TWO FRIENDS$"

gUnknown_81A9374:: @ 81A9374
	.braille "SHARING$"

gUnknown_81A937C:: @ 81A937C
	.braille "POWER OPEN$"

gUnknown_81A9387:: @ 81A9387
	.braille "A WINDOW TO$"

gUnknown_81A9393:: @ 81A9393
	.braille "A NEW WORLD$"

gUnknown_81A939F:: @ 81A939F
	.braille "THAT GLOWS.$"

gUnknown_81A93AB:: @ 81A93AB
	.braille "THE NEXT$"

gUnknown_81A93B4:: @ 81A93B4
	.braille "WORLD WAITS$"

gUnknown_81A93C0:: @ 81A93C0
	.braille "FOR YOU.$"

	.include "data/scripts/trainers.inc"

@ Test message!
@ Welcome to the world of Pokémon!
Text_1ACD45:: @ 81ACD45
	.string "テストよう　メッセージです！\n"
	.string "ポケモンの　せかいへ　ようこそ！$"

	.include "data/scripts/fame_checker.inc"
	.include "data/text/fame_checker.inc"

CeladonCity_GameCorner_EventScript_1B2867:: @ 81B2867
	lockall
	showmoneybox 0, 0, 0
	msgbox gUnknown_81B1D7D, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1B2926
	checkmoney 50, 0
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1B292B
	playse SE_SHOP
	takemoney 50, 0
	updatemoneybox 0, 0, 0
	waitse
	message gUnknown_81B1E24
	waitmessage
	multichoice 21, 0, MULTICHOICE_TRAINER_CARD_ICON_TINT, TRUE
	switch VAR_RESULT
	case 0, EventScript_1B28DB
	case 1, EventScript_1B28E6
	case 2, EventScript_1B28F1
	case 3, EventScript_1B28FC
	end

EventScript_1B28DB:: @ 81B28DB
	setvar VAR_0x8004, 0
	goto EventScript_1B2907

EventScript_1B28E5:: @ 81B28E5
	end

EventScript_1B28E6:: @ 81B28E6
	setvar VAR_0x8004, 1
	goto EventScript_1B2907

EventScript_1B28F0:: @ 81B28F0
	end

EventScript_1B28F1:: @ 81B28F1
	setvar VAR_0x8004, 2
	goto EventScript_1B2907

EventScript_1B28FB:: @ 81B28FB
	end

EventScript_1B28FC:: @ 81B28FC
	setvar VAR_0x8004, 3
	goto EventScript_1B2907

EventScript_1B2906:: @ 81B2906
	end

EventScript_1B2907:: @ 81B2907
	message gUnknown_81B1E42
	waitmessage
	playse MUS_ME_PHOTO
	dofieldeffect FLDEFF_UNK_45
	delay 60
	special Special_UpdateTrainerCardPhotoIcons
	msgbox gUnknown_81B1E7D
	hidemoneybox 0, 0
	releaseall
	end

EventScript_1B2926:: @ 81B2926
	hidemoneybox 0, 0
	releaseall
	end

EventScript_1B292B:: @ 81B292B
	msgbox gUnknown_81B1E07
	hidemoneybox 0, 0
	releaseall
	end

FourIsland_House2_EventScript_1B2938:: @ 81B2938
	lock
	specialvar VAR_0x8008, Special_StickerLadyGetBragFlags
	checkflag FLAG_MET_STICKER_LADY
	goto_if FALSE, EventScript_1B2951
	checkflag FLAG_MET_STICKER_LADY
	goto_if TRUE, EventScript_1B2994
	end

EventScript_1B2951:: @ 81B2951
	setflag FLAG_MET_STICKER_LADY
	msgbox gUnknown_81B1EB3
	applymovement 1, Movement_1A75E1
	waitmovement 0
	playse SE_PIN
	applymovement 1, Movement_1A75DB
	waitmovement 0
	applymovement 1, Movement_1A75DD
	waitmovement 0
	compare VAR_0x8008, 0
	goto_if eq, EventScript_1B2B8E
	message gUnknown_81B1EF8
	waitmessage
	goto EventScript_1B29D0

EventScript_1B2993:: @ 81B2993
	end

EventScript_1B2994:: @ 81B2994
	applymovement 1, Movement_1A75E1
	waitmovement 0
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	compare VAR_0x8008, 0
	goto_if eq, EventScript_1B29C6
	message gUnknown_81B2025
	waitmessage
	goto EventScript_1B29D0

EventScript_1B29C5:: @ 81B29C5
	end

EventScript_1B29C6:: @ 81B29C6
	msgbox gUnknown_81B1FEF
	release
	end

EventScript_1B29D0:: @ 81B29D0
	switch VAR_0x8008
	case 1, EventScript_1B2A23
	case 2, EventScript_1B2A4F
	case 4, EventScript_1B2A7B
	case 3, EventScript_1B2AA7
	case 5, EventScript_1B2ADE
	case 6, EventScript_1B2B15
	case 7, EventScript_1B2B4C
	end

EventScript_1B2A23:: @ 81B2A23
	multichoice 15, 8, MULTICHOICE_HOF_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2A4F:: @ 81B2A4F
	multichoice 16, 8, MULTICHOICE_EGGS_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2C62
	case 1, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2A7B:: @ 81B2A7B
	multichoice 15, 8, MULTICHOICE_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2D2C
	case 1, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2AA7:: @ 81B2AA7
	multichoice 15, 6, MULTICHOICE_HOF_EGGS_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2C62
	case 2, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2ADE:: @ 81B2ADE
	multichoice 15, 6, MULTICHOICE_HOF_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2D2C
	case 2, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2B15:: @ 81B2B15
	multichoice 15, 6, MULTICHOICE_EGGS_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2C62
	case 1, EventScript_1B2D2C
	case 2, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2B4C:: @ 81B2B4C
	multichoice 15, 5, MULTICHOICE_HOF_EGGS_VICTORIES_QUIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1B2B98
	case 1, EventScript_1B2C62
	case 2, EventScript_1B2D2C
	case 3, EventScript_1B2DF6
	case SCR_MENU_CANCEL, EventScript_1B2DF6
	end

EventScript_1B2B8E:: @ 81B2B8E
	msgbox gUnknown_81B1EF8
	release
	end

EventScript_1B2B98:: @ 81B2B98
	compare VAR_0x8004, 39
	goto_if le, EventScript_1B2BC5
	compare VAR_0x8004, 99
	goto_if le, EventScript_1B2BE3
	compare VAR_0x8004, 199
	goto_if le, EventScript_1B2C01
	compare VAR_0x8004, 200
	goto_if ge, EventScript_1B2C1F
	end

EventScript_1B2BC5:: @ 81B2BC5
	compare VAR_HOF_BRAG_STATE, 1
	goto_if eq, EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 1
	msgbox gUnknown_81B206E
	goto EventScript_1B2C51

EventScript_1B2BE2:: @ 81B2BE2
	end

EventScript_1B2BE3:: @ 81B2BE3
	compare VAR_HOF_BRAG_STATE, 2
	goto_if eq, EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 2
	msgbox gUnknown_81B20CF
	goto EventScript_1B2C51

EventScript_1B2C00:: @ 81B2C00
	end

EventScript_1B2C01:: @ 81B2C01
	compare VAR_HOF_BRAG_STATE, 3
	goto_if eq, EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 3
	msgbox gUnknown_81B2133
	goto EventScript_1B2C51

EventScript_1B2C1E:: @ 81B2C1E
	end

EventScript_1B2C1F:: @ 81B2C1F
	compare VAR_HOF_BRAG_STATE, 4
	goto_if eq, EventScript_1B2C47
	setvar VAR_HOF_BRAG_STATE, 4
	msgbox gUnknown_81B21C4
	goto EventScript_1B2C51

EventScript_1B2C3C:: @ 81B2C3C
	end

EventScript_1B2C3D:: @ 81B2C3D
	msgbox gUnknown_81B227C
	release
	end

EventScript_1B2C47:: @ 81B2C47
	msgbox gUnknown_81B22B0
	release
	end

EventScript_1B2C51:: @ 81B2C51
	textcolor 3
	playfanfare MUS_FANFA1
	message gUnknown_81B2242
	waitmessage
	waitfanfare
	delay 90
	release
	end

EventScript_1B2C62:: @ 81B2C62
	compare VAR_0x8005, 99
	goto_if le, EventScript_1B2C8F
	compare VAR_0x8005, 199
	goto_if le, EventScript_1B2CAD
	compare VAR_0x8005, 299
	goto_if le, EventScript_1B2CCB
	compare VAR_0x8005, 300
	goto_if ge, EventScript_1B2CE9
	end

EventScript_1B2C8F:: @ 81B2C8F
	compare VAR_EGG_BRAG_STATE, 1
	goto_if eq, EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 1
	msgbox gUnknown_81B2308
	goto EventScript_1B2D1B

EventScript_1B2CAC:: @ 81B2CAC
	end

EventScript_1B2CAD:: @ 81B2CAD
	compare VAR_EGG_BRAG_STATE, 2
	goto_if eq, EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 2
	msgbox gUnknown_81B2372
	goto EventScript_1B2D1B

EventScript_1B2CCA:: @ 81B2CCA
	end

EventScript_1B2CCB:: @ 81B2CCB
	compare VAR_EGG_BRAG_STATE, 3
	goto_if eq, EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 3
	msgbox gUnknown_81B23E0
	goto EventScript_1B2D1B

EventScript_1B2CE8:: @ 81B2CE8
	end

EventScript_1B2CE9:: @ 81B2CE9
	compare VAR_EGG_BRAG_STATE, 4
	goto_if eq, EventScript_1B2D11
	setvar VAR_EGG_BRAG_STATE, 4
	msgbox gUnknown_81B2448
	goto EventScript_1B2D1B

EventScript_1B2D06:: @ 81B2D06
	end

EventScript_1B2D07:: @ 81B2D07
	msgbox gUnknown_81B251B
	release
	end

EventScript_1B2D11:: @ 81B2D11
	msgbox gUnknown_81B254F
	release
	end

EventScript_1B2D1B:: @ 81B2D1B
	textcolor 3
	playfanfare MUS_FANFA1
	message gUnknown_81B24EA
	waitmessage
	waitfanfare
	delay 90
	release
	end

EventScript_1B2D2C:: @ 81B2D2C
	compare VAR_0x8006, 19
	goto_if le, EventScript_1B2D59
	compare VAR_0x8006, 49
	goto_if le, EventScript_1B2D77
	compare VAR_0x8006, 99
	goto_if le, EventScript_1B2D95
	compare VAR_0x8006, 100
	goto_if ge, EventScript_1B2DB3
	end

EventScript_1B2D59:: @ 81B2D59
	compare VAR_LINK_WIN_BRAG_STATE, 1
	goto_if eq, EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 1
	msgbox gUnknown_81B25A7
	goto EventScript_1B2DE5

EventScript_1B2D76:: @ 81B2D76
	end

EventScript_1B2D77:: @ 81B2D77
	compare VAR_LINK_WIN_BRAG_STATE, 2
	goto_if eq, EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 2
	msgbox gUnknown_81B2609
	goto EventScript_1B2DE5

EventScript_1B2D94:: @ 81B2D94
	end

EventScript_1B2D95:: @ 81B2D95
	compare VAR_LINK_WIN_BRAG_STATE, 3
	goto_if eq, EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 3
	msgbox gUnknown_81B267B
	goto EventScript_1B2DE5

EventScript_1B2DB2:: @ 81B2DB2
	end

EventScript_1B2DB3:: @ 81B2DB3
	compare VAR_LINK_WIN_BRAG_STATE, 4
	goto_if eq, EventScript_1B2DDB
	setvar VAR_LINK_WIN_BRAG_STATE, 4
	msgbox gUnknown_81B26F6
	goto EventScript_1B2DE5

EventScript_1B2DD0:: @ 81B2DD0
	end

EventScript_1B2DD1:: @ 81B2DD1
	msgbox gUnknown_81B27DB
	release
	end

EventScript_1B2DDB:: @ 81B2DDB
	msgbox gUnknown_81B280F
	release
	end

EventScript_1B2DE5:: @ 81B2DE5
	textcolor 3
	playfanfare MUS_FANFA1
	message gUnknown_81B27A6
	waitmessage
	waitfanfare
	delay 90
	release
	end

EventScript_1B2DF6:: @ 81B2DF6
	release
	end

	.include "data/text/help_system.inc"

CeladonCity_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
CeruleanCity_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
CinnabarIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
FiveIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
FourIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
FuchsiaCity_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
IndigoPlateau_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
LavenderTown_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
OneIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
PewterCity_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
Route10_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
Route4_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
SaffronCity_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
SevenIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
SixIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
ThreeIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
TwoIsland_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
VermilionCity_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
ViridianCity_PokemonCenter_2F_MapScript4_1BB1B4:: @ 81BB1B4
	call EventScript_1BB1BA
	end

EventScript_1BB1BA:: @ 81BB1BA
	specialvar VAR_RESULT, ValidateReceivedWonderCard
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB1CE
	clearflag FLAG_HIDE_MG_DELIVERYMEN
	return

EventScript_1BB1CE:: @ 81BB1CE
	setflag FLAG_HIDE_MG_DELIVERYMEN
	return

CeruleanCity_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
CinnabarIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
FiveIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
FuchsiaCity_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
OneIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
PewterCity_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
SevenIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
VermilionCity_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
FourIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
SixIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
ThreeIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
TwoIsland_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
Route10_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
Route10_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
Route4_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
SaffronCity_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
IndigoPlateau_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
CeladonCity_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
LavenderTown_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
ViridianCity_PokemonCenter_2F_EventScript_1BB1D2:: @ 81BB1D2
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	execram

EventScript_1BB1E4:: @ 81BB1E4
	msgbox Text_1A6393, 2
	end

CeladonCity_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
CeruleanCity_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
CinnabarIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
FiveIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
FourIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
FuchsiaCity_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
IndigoPlateau_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
LavenderTown_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
OneIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
PewterCity_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
Route10_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
Route4_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
SaffronCity_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
SevenIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
SixIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
ThreeIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
TwoIsland_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
VermilionCity_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
ViridianCity_PokemonCenter_2F_MapScript2_1BB1ED:: @ 81BB1ED
	map_script_2 VAR_0x406F, 1, EventScript_1BB227
	map_script_2 VAR_0x406F, 2, EventScript_1BB227
	map_script_2 VAR_0x406F, 5, EventScript_1BB227
	map_script_2 VAR_0x406F, 3, EventScript_1BB227
	map_script_2 VAR_0x406F, 6, EventScript_1BB227
	map_script_2 VAR_0x406F, 7, EventScript_1BB227
	map_script_2 VAR_0x406F, 8, EventScript_1BB227
	.2byte 0

EventScript_1BB227:: @ 81BB227
	compare VAR_0x8007, 0
	goto_if eq, EventScript_1BB236
	turnobject VAR_0x8007, 3
EventScript_1BB236:
	end

CeladonCity_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
CeruleanCity_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
CinnabarIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
FiveIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
FourIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
FuchsiaCity_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
IndigoPlateau_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
LavenderTown_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
OneIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
PewterCity_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
Route10_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
Route4_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
SaffronCity_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
SevenIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
SixIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
ThreeIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
TwoIsland_JoyfulGameCorner_MapScript4_1BB237:: @ 81BB237
TwoIsland_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
VermilionCity_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
ViridianCity_PokemonCenter_2F_MapScript3_1BB237:: @ 81BB237
	compare VAR_0x406F, 1
	goto_if eq, EventScript_1BB285
	compare VAR_0x406F, 2
	goto_if eq, EventScript_1BB285
	compare VAR_0x406F, 5
	goto_if eq, EventScript_1BB285
	compare VAR_0x406F, 3
	goto_if eq, EventScript_1BB28B
	compare VAR_0x406F, 6
	goto_if eq, EventScript_1BB291
	compare VAR_0x406F, 7
	goto_if eq, EventScript_1BB297
	compare VAR_0x406F, 8
	goto_if eq, EventScript_1BB29D
	end

EventScript_1BB285:: @ 81BB285
	call EventScript_1BC034
	end

EventScript_1BB28B:: @ 81BB28B
	call EventScript_1BC034
	end

EventScript_1BB291:: @ 81BB291
	call EventScript_1BC020
	end

EventScript_1BB297:: @ 81BB297
	call EventScript_1BC034
	end

EventScript_1BB29D:: @ 81BB29D
	call EventScript_1BC048
	end

CeladonCity_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
CeruleanCity_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
CinnabarIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
FiveIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
FourIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
FuchsiaCity_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
IndigoPlateau_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
LavenderTown_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
OneIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
PewterCity_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
Route10_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
Route4_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
SaffronCity_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
SevenIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
SixIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
ThreeIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
TwoIsland_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
VermilionCity_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
ViridianCity_PokemonCenter_2F_MapScript1_1BB2A3:: @ 81BB2A3
	map_script_2 VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 1, EventScript_1BB415
	map_script_2 VAR_0x406F, 1, EventScript_1BB2E5
	map_script_2 VAR_0x406F, 2, EventScript_1BB2E5
	map_script_2 VAR_0x406F, 5, EventScript_1BB2E5
	map_script_2 VAR_0x406F, 3, EventScript_1BB34F
	map_script_2 VAR_0x406F, 6, EventScript_1BB39C
	map_script_2 VAR_0x406F, 7, EventScript_1BB2E5
	map_script_2 VAR_0x406F, 8, EventScript_1BB2FD
	.2byte 0

EventScript_1BB2E5:: @ 81BB2E5
	lockall
	call EventScript_1BB315
	call EventScript_1BC03E
	special DrawWholeMapView
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB2FD:: @ 81BB2FD
	lockall
	call EventScript_1BB315
	call EventScript_1BC052
	special DrawWholeMapView
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB315:: @ 81BB315
	special CloseLink
	special HelpSystem_Enable
	special sub_811390C
	setvar VAR_0x406F, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if eq, EventScript_1BB40A
	applymovement VAR_0x8007, Movement_1BB88F
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB891
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88B
	waitmovement 0
	return

EventScript_1BB34F:: @ 81BB34F
	lockall
	call EventScript_1BB367
	call EventScript_1BC03E
	special DrawWholeMapView
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB367:: @ 81BB367
	special CloseLink
	special HelpSystem_Enable
	special sub_811390C
	setvar VAR_0x406F, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if eq, EventScript_1BB40A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB8A0
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88F
	waitmovement 0
	call EventScript_1BB3E6
	return

EventScript_1BB39C:: @ 81BB39C
	lockall
	call EventScript_1BB3B4
	call EventScript_1BC02A
	special DrawWholeMapView
	playse SE_TK_KASYA
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB3B4:: @ 81BB3B4
	special HelpSystem_Enable
	special sub_811390C
	setvar VAR_0x406F, 0
	textcolor 1
	compare VAR_0x8007, 0
	goto_if eq, EventScript_1BB40A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB8A0
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88F
	waitmovement 0
	call EventScript_1BB3E6
	return

EventScript_1BB3E6:: @ 81BB3E6
	message Text_1BC918
	waitmessage
	playse SE_PIN
	message Text_1BC943
	waitmessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB891
	waitmovement 0
	applymovement VAR_0x8007, Movement_1BB88B
	waitmovement 0
	return

EventScript_1BB40A:: @ 81BB40A
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB891
	waitmovement 0
	return

EventScript_1BB415:: @ 81BB415
	lockall
	textcolor 1
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75E9
	waitmovement 0
	msgbox gUnknown_81BD898
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB447
	waitmovement 0
	delay 30
	msgbox gUnknown_81BD966
	setvar VAR_MAP_SCENE_POKEMON_CENTER_TEALA, 2
	releaseall
	end

Movement_1BB447:: @ 81BB447
	step_11
	step_11
	step_end

EventScript_1BB44A:: @ 81BB44A
	message gUnknown_81BC311
	waitmessage
	delay 15
	goto EventScript_1BB467
	end

EventScript_1BB459:: @ 81BB459
	msgbox gUnknown_81BC35E
	goto EventScript_1BB467
	end

EventScript_1BB467:: @ 81BB467
	setvar VAR_0x8004, 0
	multichoice 0, 0, MULTICHOICE_TRADE_CENTER_COLOSSEUM, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BB6AB
	case 1, EventScript_1BB4A3
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BB4A3:: @ 81BB4A3
	copyvar VAR_0x8007, VAR_LAST_TALKED
	goto EventScript_1BB4AE

EventScript_1BB4AD:: @ 81BB4AD
	end

EventScript_1BB4AE:: @ 81BB4AE
	message Text_1BD338
	waitmessage
	multichoice 0, 0, MULTICHOICE_SINGLE_DOUBLE_MULTI_INFO_EXIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BB50F
	case 1, EventScript_1BB51A
	case 2, EventScript_1BB541
	case 3, EventScript_1BB501
	case 4, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BB501:: @ 81BB501
	msgbox gUnknown_81BD390
	goto EventScript_1BB4AE

EventScript_1BB50E:: @ 81BB50E
	end

EventScript_1BB50F:: @ 81BB50F
	setvar VAR_0x8004, 1
	goto EventScript_1BB54C

EventScript_1BB519:: @ 81BB519
	end

EventScript_1BB51A:: @ 81BB51A
	special CheckForAlivePartyMons
	compare VAR_RESULT, 0
	goto_if ne, EventScript_1BB533
	setvar VAR_0x8004, 2
	goto EventScript_1BB54C

EventScript_1BB532:: @ 81BB532
	end

EventScript_1BB533:: @ 81BB533
	msgbox gUnknown_81BC409
	goto EventScript_1BB4AE

EventScript_1BB540:: @ 81BB540
	end

EventScript_1BB541:: @ 81BB541
	setvar VAR_0x8004, 5
	goto EventScript_1BB54C

EventScript_1BB54B:: @ 81BB54B
	end

EventScript_1BB54C:: @ 81BB54C
	call EventScript_1A4EAF
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	message gUnknown_81BC4AC
	waitmessage
	special HelpSystem_Disable
	textcolor 3
	special sub_8081064
	waitstate
	call EventScript_1A6675
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BB5B3
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1BB80F
	compare VAR_RESULT, 3
	goto_if eq, EventScript_1BB81F
	compare VAR_RESULT, 4
	goto_if eq, EventScript_1BB63C
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BB82F
	compare VAR_RESULT, 6
	goto_if eq, EventScript_1BB7FF
	end

EventScript_1BB5B3:: @ 81BB5B3
	special sp000_heal_pokemon
	special SavePlayerParty
	special LoadPlayerBag
	copyvar VAR_0x406F, VAR_0x8004
	messageautoscroll Text_1BC590
	waitmessage
	call EventScript_1BC034
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject 255, MAP_UNKNOWN_MAP_00_00
	closedoor 9, 1
	waitdooranim
	release
	compare VAR_0x8004, 5
	goto_if eq, EventScript_1BB62C
	special SetCableClubWarp
	warp MAP_UNKNOWN_MAP_00_00, 255, 6, 8
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB621:: @ 81BB621
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB894
	waitmovement 0
	return

EventScript_1BB62C:: @ 81BB62C
	special SetCableClubWarp
	warp MAP_UNKNOWN_MAP_00_03, 255, 5, 8
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB63C:: @ 81BB63C
	switch VAR_0x8004
	case 1, EventScript_1BB68A
	case 2, EventScript_1BB679
	case 5, EventScript_1BB668
	goto EventScript_1BB857

EventScript_1BB667:: @ 81BB667
	end

EventScript_1BB668:: @ 81BB668
	special CloseLink
	msgbox gUnknown_81BC736
	goto EventScript_1BB69B

EventScript_1BB678:: @ 81BB678
	end

EventScript_1BB679:: @ 81BB679
	special CloseLink
	msgbox gUnknown_81BC700
	goto EventScript_1BB69B

EventScript_1BB689:: @ 81BB689
	end

EventScript_1BB68A:: @ 81BB68A
	special CloseLink
	msgbox gUnknown_81BC6CA
	goto EventScript_1BB69B

EventScript_1BB69A:: @ 81BB69A
	end

EventScript_1BB69B:: @ 81BB69B
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC76B
	release
	end

EventScript_1BB6AB:: @ 81BB6AB
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call EventScript_1BB79C
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	call EventScript_1A4EAF
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	message gUnknown_81BC4AC
	waitmessage
	special HelpSystem_Disable
	textcolor 3
	special sub_80810CC
	waitstate
	call EventScript_1A6675
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BB73D
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1BB80F
	compare VAR_RESULT, 3
	goto_if eq, EventScript_1BB81F
	compare VAR_RESULT, 4
	goto_if eq, EventScript_1BB857
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BB82F
	compare VAR_RESULT, 6
	goto_if eq, EventScript_1BB7FF
	compare VAR_RESULT, 7
	goto_if eq, EventScript_1BB7DF
	compare VAR_RESULT, 9
	goto_if eq, EventScript_1BB7EF
	end

EventScript_1BB73D:: @ 81BB73D
	setvar VAR_0x8004, 3
	copyvar VAR_0x406F, VAR_0x8004
	messageautoscroll Text_1BC590
	waitmessage
	call EventScript_1BC034
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject 255, MAP_UNKNOWN_MAP_00_00
	closedoor 9, 1
	waitdooranim
	release
	special SetCableClubWarp
	setwarp MAP_UNKNOWN_MAP_00_01, 255, 5, 8
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB79C:: @ 81BB79C
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	compare VAR_RESULT, 2
	goto_if lt, EventScript_1BB7C2
	specialvar VAR_RESULT, GetNameOfEnigmaBerryInPlayerParty
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BB7D0
	setvar VAR_RESULT, 1
	return

EventScript_1BB7C2:: @ 81BB7C2
	msgbox gUnknown_81BC442
	setvar VAR_RESULT, 0
	return

EventScript_1BB7D0:: @ 81BB7D0
	msgbox gUnknown_81BC47C
	setvar VAR_RESULT, 0
	return

EventScript_1BB7DE:: @ 81BB7DE
	end

EventScript_1BB7DF:: @ 81BB7DF
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC95C
	release
	end

EventScript_1BB7EF:: @ 81BB7EF
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC9C0
	release
	end

EventScript_1BB7FF:: @ 81BB7FF
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC615
	release
	end

EventScript_1BB80F:: @ 81BB80F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC5C0
	release
	end

EventScript_1BB81F:: @ 81BB81F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC64E
	release
	end

EventScript_1BB82F:: @ 81BB82F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC68A
	release
	end

EventScript_1BB83F:: @ 81BB83F
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BCFD1
	release
	end

EventScript_1BB84F:: @ 81BB84F
	special SetCableClubWarp
	special DoCableClubWarp
	waitstate
	end

EventScript_1BB857:: @ 81BB857
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC6A1
	release
	end

EventScript_1BB867:: @ 81BB867
	special CloseLink
	special HelpSystem_Enable
	msgbox gUnknown_81BC9E0
	release
	end

EventScript_1BB877:: @ 81BB877
	msgbox Text_1A561A
	release
	end

EventScript_1BB881:: @ 81BB881
	msgbox Text_1A5667
	releaseall
	end

Movement_1BB88B:: @ 81BB88B
	step_00
	step_end

Movement_1BB88D:: @ 81BB88D
	step_03
	step_end

Movement_1BB88F:: @ 81BB88F
	step_02
	step_end

Movement_1BB891:: @ 81BB891
	step_10
	step_10
	step_end

Movement_1BB894:: @ 81BB894
	step_13
	step_11
	step_11
	step_end

Movement_1BB898:: @ 81BB898
	step_12
	step_11
	step_11
	step_end

Movement_1BB89C:: @ 81BB89C
	step_11
	step_end

Movement_1BB89E:: @ 81BB89E
	step_02
	step_end

Movement_1BB8A0:: @ 81BB8A0
	step_03
	step_end

Movement_1BB8A2:: @ 81BB8A2
	step_12
	step_11
	step_11
	step_11
	step_end

gUnknown_81BB8A7:: @ 81BB8A7
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	lockall
	fadescreen 1
	setvar VAR_0x8004, 0
	special Special_BattleRecords
	waitstate
	releaseall
	end

gUnknown_81BB8C3:: @ 81BB8C3
UnknownMap_00_00_EventScript_1BB8C3:: @ 81BB8C3
	setvar VAR_0x8005, 0
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB8CF:: @ 81BB8CF
UnknownMap_00_00_EventScript_1BB8CF:: @ 81BB8CF
	setvar VAR_0x8005, 1
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB8DB:: @ 81BB8DB
UnknownMap_00_03_EventScript_1BB8DB:: @ 81BB8DB
	fadescreen 1
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB94F
	setvar VAR_0x8005, 0
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB8F8:: @ 81BB8F8
UnknownMap_00_03_EventScript_1BB8F8:: @ 81BB8F8
	fadescreen 1
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB94F
	setvar VAR_0x8005, 1
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB915:: @ 81BB915
UnknownMap_00_03_EventScript_1BB915:: @ 81BB915
	fadescreen 1
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB94F
	setvar VAR_0x8005, 2
	textcolor 3
	special sub_80819C8
	waitstate
	end

gUnknown_81BB932:: @ 81BB932
UnknownMap_00_03_EventScript_1BB932:: @ 81BB932
	fadescreen 1
	special sub_80A0334
	waitstate
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB94F
	setvar VAR_0x8005, 3
	textcolor 3
	special sub_80819C8
	waitstate
	end

EventScript_1BB94F:: @ 81BB94F
	end

gUnknown_81BB950:: @ 81BB950
UnknownMap_00_01_EventScript_1BB950:: @ 81BB950
	setvar VAR_0x8005, 0
	textcolor 3
	special sub_8081978
	waitstate
	end

gUnknown_81BB95C:: @ 81BB95C
UnknownMap_00_01_EventScript_1BB95C:: @ 81BB95C
	setvar VAR_0x8005, 1
	textcolor 3
	special sub_8081978
	waitstate
	end

EventScript_1BB968:: @ 81BB968
	setvar VAR_0x8005, 2
	textcolor 3
	special sub_8081978
	waitstate
	end

EventScript_1BB974:: @ 81BB974
	setvar VAR_0x8005, 3
	textcolor 3
	special sub_8081978
	waitstate
	end

gUnknown_81BB980:: @ 81BB980
UnknownMap_00_02_EventScript_1BB980:: @ 81BB980
	end

gUnknown_81BB981:: @ 81BB981
	textcolor 3
	msgbox gUnknown_81BC84B
	fadescreen 1
	special sp02A_crash_sound
	waitstate
	end

gUnknown_81BB992:: @ 81BB992
	textcolor 3
	msgbox gUnknown_81BC874
	fadescreen 1
	special sp02A_crash_sound
	waitstate
	end

gUnknown_81BB9A3:: @ 81BB9A3
	textcolor 3
	msgbox gUnknown_81BC827
	closemessage
	end

UnknownMap_00_00_EventScript_1BB9AF:: @ 81BB9AF
	textcolor 3
	special sub_8069740
	msgbox gUnknown_81BC8AD
	special sub_8069768
	closemessage
	end

UnknownMap_00_01_EventScript_1BB9C1:: @ 81BB9C1
	textcolor 3
	special sub_8069740
	msgbox gUnknown_81BC8DA
	special sub_8069768
	closemessage
	end

UnknownMap_00_02_EventScript_1BB9D3:: @ 81BB9D3
	end

gUnknown_81BB9D4:: @ 81BB9D4
	textcolor 3
	msgbox gUnknown_81BC7A1, 5
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BB9F0
	erasebox 0, 0, 29, 19
	releaseall
	end

EventScript_1BB9F0:: @ 81BB9F0
	textcolor 3
	messageautoscroll Text_1BC7E2
	waitmessage
	special sub_8081770
	end

gUnknown_81BB9FC:: @ 81BB9FC
	special sub_8081744
	special sub_807E704
	waitstate
	end

EventScript_1BBA04:: @ 81BBA04
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	checkflag FLAG_SYS_POKEDEX_GET
	goto_if FALSE, EventScript_1BB877
	specialvar VAR_RESULT, Special_BadEggInParty
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BB867
	copyvar VAR_0x8007, VAR_LAST_TALKED
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BBB60
	message Text_1BD65B
	waitmessage
	goto EventScript_1BBA51

EventScript_1BBA50:: @ 81BBA50
	end

EventScript_1BBA51:: @ 81BBA51
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBA94
	case 1, EventScript_1BB82F
	case 2, EventScript_1BBA88
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBA88:: @ 81BBA88
	message Text_1BD706
	waitmessage
	goto EventScript_1BBA51

EventScript_1BBA93:: @ 81BBA93
	end

EventScript_1BBA94:: @ 81BBA94
	call EventScript_1BBB1E
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	call EventScript_1A4EAF
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	msgbox gUnknown_81BD86A
	closemessage
	special sp000_heal_pokemon
	setvar VAR_0x8004, 6
	copyvar VAR_0x406F, VAR_0x8004
	special HelpSystem_Disable
	call EventScript_1BC020
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 5, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject 255, MAP_UNKNOWN_MAP_00_00
	closedoor 5, 1
	waitdooranim
	special sub_811B15C
	special SetCableClubWarp
	warpteleport2 MAP_UNKNOWN_MAP_00_04, 255, 7, 11
	waitstate
	special UnionRoomSpecial
	waitstate
	end

EventScript_1BBB1E:: @ 81BBB1E
	specialvar VAR_RESULT, CountPartyNonEggMons
	compare VAR_RESULT, 2
	goto_if lt, EventScript_1BBB44
	specialvar VAR_RESULT, GetNameOfEnigmaBerryInPlayerParty
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BBB52
	setvar VAR_RESULT, 1
	return

EventScript_1BBB44:: @ 81BBB44
	msgbox gUnknown_81BCBC3
	goto EventScript_1A77B0

EventScript_1BBB51:: @ 81BBB51
	end

EventScript_1BBB52:: @ 81BBB52
	msgbox gUnknown_81BCC00
	goto EventScript_1A77B0

EventScript_1BBB5F:: @ 81BBB5F
	end

EventScript_1BBB60:: @ 81BBB60
	msgbox gUnknown_81BCC3A
	release
	return

EventScript_1BBB6A:: @ 81BBB6A
	lock
	faceplayer
	checkflag FLAG_SYS_POKEDEX_GET
	goto_if FALSE, EventScript_1BB877
	msgbox gUnknown_81BDB85, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BBB92
	msgbox gUnknown_81BDBF8
	release
	return

EventScript_1BBB92:: @ 81BBB92
	msgbox gUnknown_81BDEDF
	release
	return

EventScript_1BBB9C:: @ 81BBB9C
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	checkflag FLAG_SYS_POKEDEX_GET
	goto_if FALSE, EventScript_1BB877
	specialvar VAR_RESULT, Special_BadEggInParty
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BB867
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB44A
	message Text_1BD28D
	waitmessage
	delay 15
	goto EventScript_1BBBE7

EventScript_1BBBE6:: @ 81BBBE6
	end

EventScript_1BBBE7:: @ 81BBBE7
	checkflag FLAG_GOT_POWDER_JAR
	goto_if FALSE, EventScript_1BBC32
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_CRUSH, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBC69
	case 1, EventScript_1BBC97
	case 2, EventScript_1BBD35
	case 3, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBC32:: @ 81BBC32
	multichoice 0, 0, MULTICHOICE_TRADE_COLOSSEUM_2, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBC69
	case 1, EventScript_1BBC97
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBC69:: @ 81BBC69
	msgbox gUnknown_81BD317, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	call EventScript_1BB79C
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	setvar VAR_0x8004, 3
	goto EventScript_1BBD6F

EventScript_1BBC96:: @ 81BBC96
	end

EventScript_1BBC97:: @ 81BBC97
	message Text_1BD338
	waitmessage
	multichoice 0, 0, MULTICHOICE_SINGLE_DOUBLE_MULTI_INFO_EXIT, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBCEA
	case 1, EventScript_1BBCF5
	case 2, EventScript_1BBD1C
	case 3, EventScript_1BBD27
	case 4, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBCEA:: @ 81BBCEA
	setvar VAR_0x8004, 0
	goto EventScript_1BBD6F

EventScript_1BBCF4:: @ 81BBCF4
	end

EventScript_1BBCF5:: @ 81BBCF5
	special CheckForAlivePartyMons
	compare VAR_RESULT, 0
	goto_if ne, EventScript_1BBD0E
	setvar VAR_0x8004, 1
	goto EventScript_1BBD6F

EventScript_1BBD0D:: @ 81BBD0D
	end

EventScript_1BBD0E:: @ 81BBD0E
	msgbox gUnknown_81BC409
	goto EventScript_1BBC97

EventScript_1BBD1B:: @ 81BBD1B
	end

EventScript_1BBD1C:: @ 81BBD1C
	setvar VAR_0x8004, 2
	goto EventScript_1BBD6F

EventScript_1BBD26:: @ 81BBD26
	end

EventScript_1BBD27:: @ 81BBD27
	msgbox gUnknown_81BD390
	goto EventScript_1BBC97

EventScript_1BBD34:: @ 81BBD34
	end

EventScript_1BBD35:: @ 81BBD35
	msgbox gUnknown_81BD362, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	special CheckHasAtLeastOneBerry
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BBD61
	setvar VAR_0x8004, 5
	goto EventScript_1BBD6F

EventScript_1BBD60:: @ 81BBD60
	end

EventScript_1BBD61:: @ 81BBD61
	msgbox gUnknown_81BCB81
	goto EventScript_1BBBE7

EventScript_1BBD6E:: @ 81BBD6E
	end

EventScript_1BBD6F:: @ 81BBD6F
	call EventScript_1A4EAF
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB82F
	switch VAR_0x8004
	case 3, EventScript_1BBDBC
	case 0, EventScript_1BBDBC
	case 1, EventScript_1BBDBC
	case 2, EventScript_1BBE50
	case 5, EventScript_1BBEE4
	end

EventScript_1BBDBC:: @ 81BBDBC
	textcolor 3
	message Text_1BD51B
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBE28
	case 1, EventScript_1BBE00
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBE00:: @ 81BBE00
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BBDBC
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BBE00
	release
	return

EventScript_1BBE28:: @ 81BBE28
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BBDBC
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BBE28
	release
	return

EventScript_1BBE50:: @ 81BBE50
	textcolor 3
	message Text_1BD582
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBEBC
	case 1, EventScript_1BBE94
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBE94:: @ 81BBE94
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BBE50
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BBE94
	release
	return

EventScript_1BBEBC:: @ 81BBEBC
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BBE50
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BBEBC
	release
	return

EventScript_1BBEE4:: @ 81BBEE4
	textcolor 3
	message Text_1BD5F1
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BBF50
	case 1, EventScript_1BBF28
	case 2, EventScript_1BB82F
	case SCR_MENU_CANCEL, EventScript_1BB82F
	end

EventScript_1BBF28:: @ 81BBF28
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BBEE4
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BBF28
	release
	return

EventScript_1BBF50:: @ 81BBF50
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BBF88
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BBEE4
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BBF50
	release
	return

EventScript_1BBF78:: @ 81BBF78
	special HelpSystem_Disable
	special sub_8115A24
	waitstate
	return

EventScript_1BBF80:: @ 81BBF80
	special HelpSystem_Disable
	special BerryBlenderLinkJoinGroup
	waitstate
	return

EventScript_1BBF88:: @ 81BBF88
	messageautoscroll Text_1BC59E
	waitmessage
	delay 60
	closemessage
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call EventScript_1BC034
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB898
	waitmovement 0
	opendoor 9, 1
	waitdooranim
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB89C
	waitmovement 0
	hideobject 255, MAP_UNKNOWN_MAP_00_00
	closedoor 9, 1
	waitdooranim
	release
	waitstate
	end

gUnknown_81BBFD8:: @ 81BBFD8
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	lockall
	checkflag FLAG_SYS_POKEDEX_GET
	goto_if FALSE, EventScript_1BB881
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BC016
	special HelpSystem_Disable
	fadescreen 1
	special sub_814F1D4
	waitstate
	msgbox gUnknown_81BCA43
	special HelpSystem_Enable
	releaseall
	end

EventScript_1BC016:: @ 81BC016
	msgbox gUnknown_81BCA13
	releaseall
	end

EventScript_1BC020:: @ 81BC020
	setmetatile 5, 3, 709, 0
	return

EventScript_1BC02A:: @ 81BC02A
	setmetatile 5, 3, 761, 1
	return

EventScript_1BC034:: @ 81BC034
	setmetatile 9, 3, 709, 0
	return

EventScript_1BC03E:: @ 81BC03E
	setmetatile 9, 3, 761, 1
	return

EventScript_1BC048:: @ 81BC048
	setmetatile 5, 3, 737, 0
	return

EventScript_1BC052:: @ 81BC052
	setmetatile 5, 3, 759, 1
	return

CeladonCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
CeruleanCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
CinnabarIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
FiveIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
FourIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
FuchsiaCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
IndigoPlateau_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
LavenderTown_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
OneIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
PewterCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
Route10_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
Route4_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
SaffronCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
SevenIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
SixIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
ThreeIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
TwoIsland_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
VermilionCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
ViridianCity_PokemonCenter_1F_MapScript2_1BC05C:: @ 81BC05C
	special sub_811999C
	end

EventScript_1BC060:: @ 81BC060
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	message Text_1BCCFF
	waitmessage
	multichoice 0, 0, MULTICHOICE_POKEJUMP_DODRIO, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BC0B0
	case 1, EventScript_1BC0BA
	case 2, EventScript_1BC0C4
	case SCR_MENU_CANCEL, EventScript_1BC0C4
	end

EventScript_1BC0B0:: @ 81BC0B0
	msgbox gUnknown_81BCD4D
	release
	end

EventScript_1BC0BA:: @ 81BC0BA
	msgbox gUnknown_81BCE73
	release
	end

EventScript_1BC0C4:: @ 81BC0C4
	msgbox gUnknown_81BCF2E
	release
	end

EventScript_1BC0CE:: @ 81BC0CE
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	special sub_8112364
	lock
	faceplayer
	message Text_1BCF69
	waitmessage
	specialvar VAR_RESULT, IsWirelessAdapterConnected
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BC29C
	delay 60
	special HelpSystem_Disable
	message Text_1BD02D
	waitmessage
	multichoice 0, 0, MULTICHOICE_POKEJUMP_DODRIO, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BC13A
	case 1, EventScript_1BC184
	case 2, EventScript_1BB83F
	case SCR_MENU_CANCEL, EventScript_1BB83F
	end

EventScript_1BC13A:: @ 81BC13A
	setvar VAR_0x8005, 0
	special sub_8149A18
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BC2A6
	msgbox gUnknown_81BD059
	setvar VAR_0x8005, 0
	special ChooseMonForWirelessMinigame
	waitstate
	compare VAR_0x8004, 6
	goto_if ge, EventScript_1BB83F
	call EventScript_1A4EAF
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB83F
	setvar VAR_0x8004, 4
	goto EventScript_1BC1CE

EventScript_1BC183:: @ 81BC183
	end

EventScript_1BC184:: @ 81BC184
	setvar VAR_0x8005, 1
	special sub_81537C0
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BC2A6
	msgbox gUnknown_81BD059
	setvar VAR_0x8005, 1
	special ChooseMonForWirelessMinigame
	waitstate
	compare VAR_0x8004, 6
	goto_if ge, EventScript_1BB83F
	call EventScript_1A4EAF
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB83F
	setvar VAR_0x8004, 6
	goto EventScript_1BC1CE

EventScript_1BC1CD:: @ 81BC1CD
	end

EventScript_1BC1CE:: @ 81BC1CE
	textcolor 3
	message Text_1BD5F1
	waitmessage
	call EventScript_1A6675
	multichoice 13, 6, MULTICHOICE_JOIN_OR_LEAD, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BC23A
	case 1, EventScript_1BC212
	case 2, EventScript_1BB83F
	case SCR_MENU_CANCEL, EventScript_1BB83F
	end

EventScript_1BC212:: @ 81BC212
	call EventScript_1BBF78
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BC262
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BC1CE
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BC212
	release
	return

EventScript_1BC23A:: @ 81BC23A
	call EventScript_1BBF80
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BC262
	compare VAR_RESULT, 5
	goto_if eq, EventScript_1BC1CE
	compare VAR_RESULT, 8
	goto_if eq, EventScript_1BC23A
	release
	return

EventScript_1BC262:: @ 81BC262
	messageautoscroll Text_1BD080
	waitmessage
	delay 120
	closemessage
	copyvar VAR_0x8007, VAR_LAST_TALKED
	call EventScript_1BC048
	special DrawWholeMapView
	playse SE_TK_KASYA
	delay 60
	applymovement VAR_LAST_TALKED, Movement_1BB88F
	waitmovement 0
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1BB8A2
	waitmovement 0
	hideobject 255, MAP_UNKNOWN_MAP_00_00
	release
	waitstate
	end

EventScript_1BC29C:: @ 81BC29C
	msgbox gUnknown_81BCFE8
	release
	end

EventScript_1BC2A6:: @ 81BC2A6
	msgbox gUnknown_81BD0CF, 5
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BB83F
	compare VAR_0x8005, 0
	call_if eq, EventScript_1BC2D5
	compare VAR_0x8005, 1
	call_if eq, EventScript_1BC2DE
	goto EventScript_1BB83F

EventScript_1BC2D4:: @ 81BC2D4
	end

EventScript_1BC2D5:: @ 81BC2D5
	msgbox gUnknown_81BD14B
	return

EventScript_1BC2DE:: @ 81BC2DE
	msgbox gUnknown_81BD213
	return

TwoIsland_JoyfulGameCorner_EventScript_1BC2E7:: @ 81BC2E7
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	lockall
	special sub_814B504
	waitstate
	releaseall
	end

TwoIsland_JoyfulGameCorner_EventScript_1BC2FC:: @ 81BC2FC
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	lockall
	special sub_8153810
	waitstate
	releaseall
	end

gUnknown_81BC311:: @ 81BC311
	.string "Welcome to the POKéMON CABLE\n"
	.string "CLUB.\p"
	.string "Which of our services do you wish\n"
	.string "to use?$"

gUnknown_81BC35E:: @ 81BC35E
	.string "Which of our services do you wish\n"
	.string "to use?$"

Text_1BC388:: @ 81BC388
	.string "Trade POKéMON with another player\n"
	.string "using a GBA Game Link cable.$"

Text_1BC3C7:: @ 81BC3C7
	.string "You may battle another TRAINER\n"
	.string "using a GBA Game Link cable.$"

Text_1BC403:: @ 81BC403
	.string "おわります$"

gUnknown_81BC409:: @ 81BC409
	.string "For a DOUBLE BATTLE, you must\n"
	.string "have at least two POKéMON.$"

gUnknown_81BC442:: @ 81BC442
	.string "For trading, you must have at\n"
	.string "least two POKéMON with you.$"

gUnknown_81BC47C:: @ 81BC47C
	.string "A POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY can't be traded.$"

gUnknown_81BC4AC:: @ 81BC4AC
	.string "Please wait.\n"
	.string "… … B Button: Cancel$"

gUnknown_81BC4CE:: @ 81BC4CE
	.string "When all players are ready…\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

gUnknown_81BC50D:: @ 81BC50D
	.string "Start link with {STR_VAR_1} players.\n"
	.string "A Button: Confirm\l"
	.string "B Button: Cancel$"

gUnknown_81BC54C:: @ 81BC54C
	.string "Awaiting linkup…\n"
	.string "… … B Button: Cancel$"

Text_1BC572:: @ 81BC572
	.string "はじめる　まえに　レポートを\n"
	.string "かきますが　よろしいですか？$"

Text_1BC590:: @ 81BC590
	.string "Please enter.$"

Text_1BC59E:: @ 81BC59E
	.string "I'll direct you to your room now.$"

gUnknown_81BC5C0:: @ 81BC5C0
	.string "Someone is not ready to link.\p"
	.string "Please come back after everyone\n"
	.string "has made preparations.$"

gUnknown_81BC615:: @ 81BC615
	.string "Sorry, we have a link error…\n"
	.string "Please reset and try again.$"

gUnknown_81BC64E:: @ 81BC64E
	.string "The link partners appear to have\n"
	.string "made different selections.$"

gUnknown_81BC68A:: @ 81BC68A
	.string "Please do visit again.$"

gUnknown_81BC6A1:: @ 81BC6A1
	.string "The number of participants is\n"
	.string "incorrect.$"

gUnknown_81BC6CA:: @ 81BC6CA
	.string "The SINGLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

gUnknown_81BC700:: @ 81BC700
	.string "The DOUBLE BATTLE Mode can't be\n"
	.string "played by {STR_VAR_1} players.$"

gUnknown_81BC736:: @ 81BC736
	.string "There must be four players to play\n"
	.string "this Battle Mode.$"

gUnknown_81BC76B:: @ 81BC76B
	.string "Please confirm the number of\n"
	.string "players and start again.$"

gUnknown_81BC7A1:: @ 81BC7A1
	.string "The link will be terminated if you\n"
	.string "leave the room. Is that okay?$"

Text_1BC7E2:: @ 81BC7E2
	.string "Terminating link…\n"
	.string "You will be escorted out of\l"
	.string "the room. Please wait.$"

gUnknown_81BC827:: @ 81BC827
	.string "This TRAINER is too busy to\n"
	.string "notice…$"

gUnknown_81BC84B:: @ 81BC84B
	.string "Score! Got to look at {STR_VAR_1}'s\n"
	.string "TRAINER CARD!$"

gUnknown_81BC874:: @ 81BC874
	.string "Score! Got to look at {STR_VAR_1}'s\n"
	.string "TRAINER CARD!\p"
	.string "It's a {STR_VAR_2} card!$"

gUnknown_81BC8AD:: @ 81BC8AD
	.string "Please take your seat and start\n"
	.string "your battle.$"

gUnknown_81BC8DA:: @ 81BC8DA
	.string "Please take your seat and start\n"
	.string "your trade.$"

Text_1BC906:: @ 81BC906
	.string "ごりよう　ありがとう　ございました$"

Text_1BC918:: @ 81BC918
	.string "The TRAINER CARD data will\n"
	.string "be overwritten.$"

Text_1BC943:: @ 81BC943
	.string "I hope to see you again!$"

gUnknown_81BC95C:: @ 81BC95C
	.string "I'm awfully sorry.\p"
	.string "We're not set up to conduct trades\n"
	.string "with TRAINERS far away in another\l"
	.string "region yet…$"

gUnknown_81BC9C0:: @ 81BC9C0
	.string "The other TRAINER is not ready.$"

gUnknown_81BC9E0:: @ 81BC9E0
	.string "You have at least one POKéMON\n"
	.string "that can't be taken.$"

gUnknown_81BCA13:: @ 81BCA13
	.string "The Wireless Adapter is not\n"
	.string "connected properly.$"

gUnknown_81BCA43:: @ 81BCA43
	.string "Participants are asked to step up\n"
	.string "to the reception counter.$"

Text_1BCA7F:: @ 81BCA7F
	.string "こんにちは！$"

Text_1BCA86:: @ 81BCA86
	.string "しょうしょう　おまちください$"

Text_1BCA95:: @ 81BCA95
	.string "You may trade your POKéMON here\n"
	.string "with another TRAINER.$"

Text_1BCACB:: @ 81BCACB
	.string "You may battle with your friends\n"
	.string "here.$"

Text_1BCAF2:: @ 81BCAF2
	.string "Two to five TRAINERS can make\n"
	.string "BERRY POWDER together.$"

Text_1BCB27:: @ 81BCB27
	.string "ワイヤレス　クラブでの\n"
	.string "あそびかたを　せつめいします$"

Text_1BCB42:: @ 81BCB42
	.string "Cancels the selected MENU item.$"

Text_1BCB62:: @ 81BCB62
	.string "どちらの　しょうぶに　しますか？$"

Text_1BCB73:: @ 81BCB73
	.string "ひとつ　まえに　もどります$"

gUnknown_81BCB81:: @ 81BCB81
	.string "To use the BERRY CRUSH service,\n"
	.string "you must have at least one BERRY.$"

gUnknown_81BCBC3:: @ 81BCBC3
	.string "To enter the UNION ROOM, you must\n"
	.string "have at least two POKéMON.$"

gUnknown_81BCC00:: @ 81BCC00
	.string "No POKéMON holding the {STR_VAR_1}\n"
	.string "BERRY may enter the UNION ROOM.$"

gUnknown_81BCC3A:: @ 81BCC3A
	.string "This is the POKéMON WIRELESS CLUB\n"
	.string "UNION ROOM.\p"
	.string "Unfortunately, your Wireless\n"
	.string "Adapter is not connected properly.\p"
	.string "Please do come again.$"

Text_1BCCBE:: @ 81BCCBE
	.string "あ‥‥\n"
	.string "おきゃくさま！$"

Text_PlayerIsPlayingRightNowGoForIt:: @ 81BCCCA
	.string "It appears as if {STR_VAR_1} is playing\n"
	.string "right now.\l"
	.string "Go for it!$"

Text_1BCCFF:: @ 81BCCFF
	.string "I can explain game rules to you,\n"
	.string "if you'd like.\p"
	.string "Which game should I describe?$"

gUnknown_81BCD4D:: @ 81BCD4D
	.string "“POKéMON JUMP”\p"
	.string "Make your POKéMON skip the\n"
	.string "VINE WHIP rope with the A Button.\p"
	.string "Only mini POKéMON around 28 inches\n"
	.string "or less may participate.\p"
	.string "POKéMON that only swim, burrow, or\n"
	.string "fly are not good at jumping.\p"
	.string "As a result, those POKéMON may not\n"
	.string "participate.\p"
	.string "Good things happen if everyone\n"
	.string "jumps in time.$"

gUnknown_81BCE73:: @ 81BCE73
	.string "“DODRIO BERRY-PICKING”\p"
	.string "Command DODRIO's three heads to\n"
	.string "catch falling BERRIES.\p"
	.string "Press right, up, or left on the\n"
	.string "{PLUS} Control Pad to move the heads.\p"
	.string "To play this game, you must have\n"
	.string "a DODRIO.$"

gUnknown_81BCF2E:: @ 81BCF2E
	.string "If you want to play a game,\n"
	.string "please tell the man beside me.$"

Text_1BCF69:: @ 81BCF69
	.string "Hi, welcome!\n"
	.string "You can play games over the\l"
	.string "Wireless Communication System.\p"
	.string "Can you wait just a little bit?$"

gUnknown_81BCFD1:: @ 81BCFD1
	.string "All right, come again!$"

gUnknown_81BCFE8:: @ 81BCFE8
	.string "The Wireless Adapter isn't\n"
	.string "connected.\p"
	.string "Come back when it's hooked up!$"

Text_1BD02D:: @ 81BD02D
	.string "All right, which game did you want\n"
	.string "to play?$"

gUnknown_81BD059:: @ 81BD059
	.string "Which POKéMON would you like to\n"
	.string "enter?$"

Text_1BD080:: @ 81BD080
	.string "Okay, you're all good to go.\n"
	.string "Don't let the others beat you!$"

Text_1BD0BC:: @ 81BD0BC
	.string "きょうは　けえるのか？\n"
	.string "またこいよ！$"

gUnknown_81BD0CF:: @ 81BD0CF
	.string "It doesn't look like you have any\n"
	.string "POKéMON that you can enter…\p"
	.string "Would you like me to explain what\n"
	.string "kinds of POKéMON can enter?$"

gUnknown_81BD14B:: @ 81BD14B
	.string "“POKéMON JUMP” is open to POKéMON\n"
	.string "around 28 inches or less.\p"
	.string "What you can't enter are those\n"
	.string "POKéMON that can't jump.\p"
	.string "You know, like POKéMON that only\n"
	.string "swim, burrow, or fly.\p"
	.string "That's all you need to know.$"

gUnknown_81BD213:: @ 81BD213
	.string "“DODRIO BERRY-PICKING”…\n"
	.string "Well, the name says it all.\p"
	.string "You have to have a DODRIO to play\n"
	.string "this game.$"

Text_1BD274:: @ 81BD274
	.string "もういちど　はじめから\n"
	.string "やりなおして　みて　くれ$"

Text_1BD28D:: @ 81BD28D
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB DIRECT CORNER.\p"
	.string "You may interact directly with\n"
	.string "your friends here.\p"
	.string "Which room would you like to\n"
	.string "enter?$"

gUnknown_81BD317:: @ 81BD317
	.string "Would you like to trade POKéMON?$"

Text_1BD338:: @ 81BD338
	.string "Which Battle Mode would you like\n"
	.string "to play?$"

gUnknown_81BD362:: @ 81BD362
	.string "Would you like to use the\n"
	.string "BERRY CRUSH System?$"

gUnknown_81BD390:: @ 81BD390
	.string "There are three Battle Modes.\p"
	.string "SINGLE BATTLE is for two TRAINERS\n"
	.string "with one or more POKéMON each.\p"
	.string "Each TRAINER can have one POKéMON\n"
	.string "in battle at a time.\p"
	.string "DOUBLE BATTLE is for two TRAINERS\n"
	.string "with two or more POKéMON each.\p"
	.string "Each TRAINER will send out two\n"
	.string "POKéMON in battle at a time.\p"
	.string "MULTI BATTLE is for four TRAINERS\n"
	.string "with one or more POKéMON each.\p"
	.string "Each TRAINER can have one POKéMON\n"
	.string "in battle at a time.$"

Text_1BD51B:: @ 81BD51B
	.string "Please decide which of you two\n"
	.string "will become the LEADER.\p"
	.string "The other player must then choose\n"
	.string "“JOIN GROUP.”$"

Text_1BD582:: @ 81BD582
	.string "Please decide which of you four\n"
	.string "will become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

Text_1BD5F1:: @ 81BD5F1
	.string "Please decide which of you will\n"
	.string "become the GROUP LEADER.\p"
	.string "The other players must then choose\n"
	.string "“JOIN GROUP.”$"

Text_1BD65B:: @ 81BD65B
	.string "Welcome to the POKéMON WIRELESS\n"
	.string "CLUB UNION ROOM.\p"
	.string "You may interact directly with\n"
	.string "other TRAINERS here, some of\l"
	.string "whom you may not even know.\p"
	.string "Would you like to enter the ROOM?$"

Text_1BD706:: @ 81BD706
	.string "The TRAINERS in the UNION ROOM\n"
	.string "will be those players around you\l"
	.string "who have also entered the ROOM.\p"
	.string "You may do all sorts of things\n"
	.string "here, such as exchanging greetings.\p"
	.string "You may enter two POKéMON up to\n"
	.string "Lv. 30 for a one-on-one battle.\p"
	.string "You may take part in a chat with\n"
	.string "two to five people.\p"
	.string "Or, you may register a POKéMON for\n"
	.string "trade.\p"
	.string "Would you like to enter the ROOM?$"

gUnknown_81BD86A:: @ 81BD86A
	.string "I hope you enjoy your time in\n"
	.string "the UNION ROOM.$"

gUnknown_81BD898:: @ 81BD898
	.string "Hello!\n"
	.string "My name is TEALA.\p"
	.string "This must be your first time\n"
	.string "up here.\p"
	.string "I'll show you how the Wireless\n"
	.string "Communication System works.\p"
	.string "First, I need to show you this\n"
	.string "floor of our POKéMON CENTER.\p"
	.string "Right this way, please.$"

gUnknown_81BD966:: @ 81BD966
	.string "On the top floor, there are two\n"
	.string "rooms.\p"
	.string "First, the room on the left.\n"
	.string "It's the UNION ROOM.\p"
	.string "You may link up with TRAINERS\n"
	.string "around you who have also entered\l"
	.string "the UNION ROOM.\p"
	.string "With them, you may do things like\n"
	.string "chat, battle, and trade.\p"
	.string "Second, the room on the right is\n"
	.string "the DIRECT CORNER.\p"
	.string "You may trade or battle POKéMON\n"
	.string "with your friends in this room.\p"
	.string "If the Wireless Adapter isn't\n"
	.string "connected, you may still link up\l"
	.string "using a GBA Game Link cable.\p"
	.string "If that is the case, you must go\n"
	.string "to the DIRECT CORNER.\p"
	.string "I hope you enjoy the Wireless \n"
	.string "Communication System.$"

gUnknown_81BDB85:: @ 81BDB85
	.string "Hello, {PLAYER}!\p"
	.string "It's me, TEALA, the POKéMON\n"
	.string "CENTER 2F attendant.\p"
	.string "Is there something you needed to\n"
	.string "ask me about linking?$"

gUnknown_81BDBF8:: @ 81BDBF8
	.string "Let me explain how the POKéMON\n"
	.string "WIRELESS CLUB works.\p"
	.string "On this, the top floor, there are\n"
	.string "two rooms.\p"
	.string "First, the room on the left.\n"
	.string "It's the UNION ROOM.\p"
	.string "You may link up with TRAINERS\n"
	.string "around you who have also entered\l"
	.string "the UNION ROOM.\p"
	.string "With them, you may do things like\n"
	.string "chat, battle, and trade.\p"
	.string "Second, the room on the right is\n"
	.string "the DIRECT CORNER.\p"
	.string "You may trade or battle POKéMON\n"
	.string "with your friends in this room.\p"
	.string "Sometimes, you may not be able to\n"
	.string "find your friends in the UNION ROOM\l"
	.string "or the DIRECT CORNER.\p"
	.string "In that case, please move closer\n"
	.string "to your friends.\p"
	.string "If the Wireless Adapter isn't\n"
	.string "connected, you may still link up\l"
	.string "using a GBA Game Link cable.\p"
	.string "If that is the case, you must go\n"
	.string "to the DIRECT CORNER.\p"
	.string "I hope you enjoy the Wireless \n"
	.string "Communication System.$"

gUnknown_81BDEDF:: @ 81BDEDF
	.string "I hope you enjoy the Wireless\n"
	.string "Communication System.$"

	.include "data/scripts/field_moves.inc"
	.include "data/scripts/item_ball_scripts.inc"
	.include "data/scripts/mystery_event_club.inc"
	.include "data/scripts/day_care.inc"
	.include "data/scripts/flash.inc"
	.include "data/scripts/repel.inc"

@@ Block below consists of at least safari_zone.inc and flavor_text.inc. JP text making it hard to define boundaries

EventScript_SafariWarpOut:: @ 81BFB87
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 3
	special ExitSafariMode
	setwarp MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 255, 4, 1
	end

EventScript_1BFB98:: @ 81BFB98
	setvar VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 1
	special ExitSafariMode
	warp MAP_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 255, 4, 1
	waitstate
	end

EventScript_SafariRetire:: @ 81BFBAA
	lockall
	msgbox Text_1BFBE9, 5
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BFBC0
	releaseall
	end

EventScript_1BFBC0:: @ 81BFBC0
	goto EventScript_1BFB98

EventScript_SafariTimesUp:: @ 81BFBC5
	lockall
	playse SE_PINPON
	msgbox gUnknown_81BFC1B
	goto EventScript_1BFB98
	end

EventScript_SafariOutOfBalls:: @ 81BFBD7
	lockall
	playse SE_PINPON
	msgbox gUnknown_81BFC53
	goto EventScript_1BFB98
	end

Text_1BFBE9:: @ 81BFBE9
	.string "Would you like to exit the SAFARI\n"
	.string "ZONE right now?$"

gUnknown_81BFC1B:: @ 81BFC1B
	.string "PA: Ding-dong!\p"
	.string "Time's up!\p"
	.string "PA: Your SAFARI GAME is over!$"

gUnknown_81BFC53:: @ 81BFC53
	.string "PA: Ding-dong!\p"
	.string "You are out of SAFARI BALLS!\p"
	.string "PA: Your SAFARI GAME is over!$"

Text_1BFC9D:: @ 81BFC9D
	.string "サファリゾーンへ　ようこそ！\p"
	.string "ここでは　ホウエンでは　なかなか\n"
	.string "みることの　できない　ポケモンを\p"
	.string "しぜんの　すがたの　まま\n"
	.string "めに　することが　できます\p"
	.string "また　ポケモントレーナーの\n"
	.string "ようぼうに　おこたえ　して\p"
	.string "ポケモンを\n"
	.string "つかまえる　ことも　できます！\p"
	.string "サファリゾーンを　たのしんで　いってね！$"

Text_1BFD30:: @ 81BFD30
	.string "サファリゾーンへ　ようこそ！\n"
	.string "サファリゾーンは　はじめて　ですか？$"

Text_1BFD52:: @ 81BFD52
	.string "サファリゾーンを　たのしんで　いってね！$"

Text_1BFD67:: @ 81BFD67
	.string "サファリゾーンでは\n"
	.string "30この　サファリボールを　つかって\l"
	.string "ポケモンを　つかまえる　ことが　できます\p"
	.string "サファリボールを　つかいきるか\n"
	.string "500ぽ　あるくと\p"
	.string "ゲームは　しゅうりょう　です\p"
	.string "サファリゾーンを　たのしんで　いってね！$"

Text_1BFDD7:: @ 81BFDD7
	.string "サファリゾーンへ　ようこそ！\p"
	.string "500えんで　ポケモン　つかまえほうだい！\n"
	.string "サファリゲームに　さんか　しますか？$"

Text_1BFE0F:: @ 81BFE0F
	.string "そうですか\n"
	.string "こんど　ぜひ　さんか　してください！$"

Text_1BFE28:: @ 81BFE28
	.string "おかねが　たりませんよ！$"

Text_1BFE35:: @ 81BFE35
	.string "それでは　500えん　いただきます$"

Text_1BFE47:: @ 81BFE47
	.string "では　サファリボールを　どうぞ！$"

Text_1BFE58:: @ 81BFE58
	.string "{PLAYER}は　サファリボールを\n"
	.string "30こ　うけとった！$"

Text_1BFE70:: @ 81BFE70
	.string "じかんに　なりましたら\n"
	.string "こちらから　おしらせ　しますので\p"
	.string "ぞんぶんに　おたのしみ　ください！\n"
	.string "では　いってらっしゃい！$"

gUnknown_81BFEAC:: @ 81BFEAC
	.string "Excuse me!\n"
	.string "Your PC BOX is full.$"

Text_1BFECC:: @ 81BFECC
	.string "あ！　おきゃくさん\n"
	.string "ポロックケースを　おもちで　ないですね？\p"
	.string "サファリゾーンは　ポロックを　つかうと\n"
	.string "より　おたのしみ　いただけますので\p"
	.string "ぜひ　ポロックケースを\n"
	.string "おもちに　なって　おこし　ください！$"

Text_1BFF30:: @ 81BFF30
	.string "まだ　じかんが　のこっていますが\n"
	.string "サファリゾーンを　やめますか？$"

Text_1BFF51:: @ 81BFF51
	.string "では　ひきつづき　おたのしみ　ください！$"

Text_1BFF66:: @ 81BFF66
	.string "わかりました\p"
	.string "それでは　のこりの　サファリボールを\n"
	.string "おあずかり　します\p"
	.string "おつかれさまでした\n"
	.string "また　ごりよう　ください$"

Text_1BFFA1:: @ 81BFFA1
	.string "それでは　いってらっしゃい！\l"
	.string "なにか　ありましたら\n"
	.string "わたしに　こえを　かけて　くださいね$"

Text_1BFFCE:: @ 81BFFCE
	.string "しってた？\p"
	.string "あの　しかくい　はこに　ポロックを　おくと\n"
	.string "ポケモンが　あつまって　くるんだよ！$"

Text_1BFFFD:: @ 81BFFFD
	.string "この　さきに　いきたい　けど\n"
	.string "じてんしゃ　もって　くるの　わすれた‥‥\p"
	.string "おくに　めずらしい　ポケモンが\n"
	.string "いそうな　きが　するのに！$"

Text_1C003F:: @ 81C003F
	.string "ポケモンに　ポロックを　なげても\n"
	.string "しらんぷり　される　ときが　あるのよ\p"
	.string "ポケモンにも　すききらいが　あるのかしら？$"

Text_1C0079:: @ 81C0079
	.string "ぜぇ‥‥　ぜぇ‥‥\n"
	.string "やっと　ここまで　きたけど‥‥\p"
	.string "つかれちゃって　ポケモン　つかまえる\n"
	.string "げんきも　のこって　ないよ‥‥$"

Text_1C00B6:: @ 81C00B6
	.string "ホウエンに　いない　みずポケモンを\n"
	.string "さがしに　きたんだけど‥‥\p"
	.string "みずうみは　どこにあるのか\n"
	.string "きみ　しってるかい？$"

Text_1C00EF:: @ 81C00EF
	.string "ここで　めずらしい　ポケモンを\n"
	.string "たくさん　つかまえて\l"
	.string "ともだちと　こうかん　するんだ！$"

Text_1C011B:: @ 81C011B
	.string "ポロックおきばに　おいた　ポロックが\n"
	.string "いつのまにか　なくなっていた‥‥\p"
	.string "しらない　うちに\n"
	.string "ポケモンが　たべちゃったのかな？$"

Text_1C0159:: @ 81C0159
	.string "サファリゾーンの　おとくな　じょうほう！\p"
	.string "であった　ポケモンに\n"
	.string "ポロックを　なげると　にげにくく　なります！$"

Text_1C0190:: @ 81C0190
	.string "あるき　つかれたら　ちょっと　ひといき！\n"
	.string "‘みんなの　きゅうけいじょ'$"

Text_1C01B4:: @ 81C01B4
	.string "おれ　ポロック　もってないけど\n"
	.string "ポケモン　たくさん　つかまえたよ\p"
	.string "ちかづいて　ボールを　なげる　だけで\n"
	.string "けっこう　つかまえられる　もんだよ！$"

Text_1C01FB:: @ 81C01FB
	.string "ポロックを　つかうと　いつもより\n"
	.string "ちょっぴり　にげにくく　なるみたい\p"
	.string "だから　にげにくい　ポケモンに　つかっても\n"
	.string "あんまり　いみが　ないかもね$"

Text_1C0243:: @ 81C0243
	.string "ポロックおきばに　ポロック　おいて\n"
	.string "ポケモンを　つかまえると\p"
	.string "おなじ　ような　せいかくの　ポケモンが\n"
	.string "あつまる　きが　するなあ$"

Text_1C0283:: @ 81C0283
	.string "わしは　おおきな　{STR_VAR_1}に\n"
	.string "とても　きょうみが　ある！\p"
	.string "ん？　きみ　{STR_VAR_1}　もってるの？\n"
	.string "ちょ　ちょ　ちょっと···\l"
	.string "おじさんに　みせて　おくれ！$"

Text_1C02CB:: @ 81C02CB
	.string "おお！　こいつは　でかい！\n"
	.string "とても　すばらしい　{STR_VAR_1}だ！\p"
	.string "みせて　くれて　ありがとう\n"
	.string "おれいに　これを　もって　いきなさい$"

Text_1C0309:: @ 81C0309
	.string "{PLAYER}は\n"
	.string "{STR_VAR_2}を　もらった！$"

Text_1C0317:: @ 81C0317
	.string "ありゃ？\n"
	.string "きみ　もちもの　いっぱいだね$"

Text_1C032B:: @ 81C032B
	.string "ううむ　わしは　これより　おおきい\n"
	.string "{STR_VAR_1}を　みたこと　あるな···$"

Text_1C034D:: @ 81C034D
	.string "おお　こいつは　なかなか···って\n"
	.string "これ　{STR_VAR_1}じゃ　ないよ！$"

Text_1C036C:: @ 81C036C
	.string "おおきい　{STR_VAR_1}　もってないの？\l"
	.string "それは　ざんねん···\n"
	.string "こんど　おおきい　{STR_VAR_1}　みせてね$"

Text_1C0399:: @ 81C0399
	.string "しじょう　さいだいの　{STR_VAR_1}！\n"
	.string "{STR_VAR_2}の　{STR_VAR_3}cmのやつ！$"

Text_1C03B5:: @ 81C03B5
	.string "パパ“{PLAYER}！　よく　きたな！\n"
	.string "{PLAYER}あての　てがみが　とどけられたぞ$"

Text_1C03D7:: @ 81C03D7
	.string "パパ“わたしも　みたことのない\n"
	.string "ふねの　チケット　だな‥‥\l"
	.string "ミナモに　いってみると　いいだろう$"

Text_1C0407:: @ 81C0407
	.string "カイナいき　れんらくせん‥‥\p"
	.string "あら？\n"
	.string "その　チケットは‥‥！$"

Text_1C0426:: @ 81C0426
	.string "ヘンテコな　チケットを\n"
	.string "もってきたのは　おまえさんか？\p"
	.string "おまえが　いこうと　しているのは\n"
	.string "みなみの　はての　ちっぽけな　しま‥‥\p"
	.string "そこでは　なにが　おこるのか\n"
	.string "だれも　わからねえ‥‥\l"
	.string "ううむ　ふなのりの　ちが　さわぐぜ！\p"
	.string "さあ　のりな！$"

Text_1C049D:: @ 81C049D
	.string "なにもねえ　ちんけな　しま　だな‥‥\n"
	.string "ミナモへ　かえるか？$"

Text_1C04BB:: @ 81C04BB
	.string "ùÏ! ÉÇñÑ ÒñÉ!$"

Text_1C04C9:: @ 81C04C9
	.string "そうかい\n"
	.string "まあ　すきにするが　いいさ$"

Text_1C04DC:: @ 81C04DC
	.string "すべての　ゆめは　もうひとつの　げんじつ\n"
	.string "それを　わすれるべからず‥‥$"

Text_1C0500:: @ 81C0500
	.string "きおく　かすみし　ものは\n"
	.string "こころに　きざみつける　ことを　のぞむ‥‥$"

Text_1C0523:: @ 81C0523
	.string "パパ“やあ　{PLAYER}！\p"
	.string "めずらしい　きのみを　てに　いれたから\n"
	.string "プレゼント　するよ！$"

Text_1C054C:: @ 81C054C
	.string "ふかふかの　つちに　はえている　きのみは\n"
	.string "じゆうに　とっても　よいのじゃが‥\p"
	.string "1つだけ　きのみを　おなじ　ばしょに　うめる\n"
	.string "それが　れいぎと　いうものじゃ\p"
	.string "ほれ　これを　わけてやろう$"

Text_1C05A8:: @ 81C05A8
	.string "あんた　みたところ　トレーナーじゃろ？\p"
	.string "トレーナーは　よく　きのみを　ポケモンに\n"
	.string "もたせとるわい\p"
	.string "ふやすも　つかうも　あんた　しだいじゃ$"

Text_1C05ED:: @ 81C05ED
	.string "いつも　みずを　あげてたら\n"
	.string "たくさん　はなが　さいたんだ\p"
	.string "そしたら　きのみも　たくさん　できた！\p"
	.string "はい！\n"
	.string "これ　あげる$"

Text_1C0629:: @ 81C0629
	.string "がんばって　あかいポロック　つくるんだ！\n"
	.string "{STR_VAR_1}も　がんばってね！$"

Text_1C064A:: @ 81C064A
	.string "きょうは　なにいろの　きのみを\n"
	.string "さがそっかなー$"

Text_1C0662:: @ 81C0662
	.string "ポケモンコンテストの　ゆうしょうを　めざして\n"
	.string "きのみを　あつめているんだ\p"
	.string "よかったら　きみにも　わけて　あげるよ！$"

Text_1C069C:: @ 81C069C
	.string "きみも　がんばれ！$"

Text_1C06A6:: @ 81C06A6
	.string "きょうは　どの　きのみを　うめるか‥\n"
	.string "そして　なにいろの　ポロックを　つくるか‥\p"
	.string "なやむのも　また　たのしいよ$"

Text_1C06DE:: @ 81C06DE
	.string "ケースを　ふると　でてくる　ポロック‥\p"
	.string "そして　それを　キャッチして\n"
	.string "たべてくれる　ポケモン‥\p"
	.string "これって　あい　だよね？$"

Text_1C071B:: @ 81C071B
	.string "うん　うん！\n"
	.string "やっぱ　わかるひとには　わかるよね\p"
	.string "これ　あげる$"

Text_1C073B:: @ 81C073B
	.string "そっか‥‥\n"
	.string "でも　ちがうと　かんじることも　たいせつだね\p"
	.string "これ　あげる$"

Text_1C075F:: @ 81C075F
	.string "その　きのみは　めずらしいもの　らしいから\n"
	.string "たいせつに　そだててね！$"

Text_1C0782:: @ 81C0782
	.string "また　きのみめいじんに　もらって　こようっと$"

Text_1C0799:: @ 81C0799
	.string "やっぱり\p"
	.string "わたしに　スーツが　にあうように\n"
	.string "うみには　しおかぜが　にあうな\l"
	.string "そして　きみには　きのみが　にあいそうだ‥‥\p"
	.string "なんでだろうね？$"

Text_1C07DF:: @ 81C07DF
	.string "やっぱり　それは‥‥‥‥\p"
	.string "きみが　トレーナーだからだ！$"

Text_1C07FB:: @ 81C07FB
	.string "やっぱり\p"
	.string "わたしに　シンプルさが　にあうように\n"
	.string "ポケモンには　ポロックが　にあうな$"

Text_1C0825:: @ 81C0825
	.string "わしは　きのみめいじんと　よばれておる\p"
	.string "わしは　せかいじゅうを　うつくしい　はなで\n"
	.string "うめつくそうと　きのみを　そだてて\l"
	.string "そして　くばり　まくって　おるのじゃ\p"
	.string "きみにも　きのみを　わけて　あげよう！$"

Text_1C0888:: @ 81C0888
	.string "ほれ　えんりょ　せずに　もう　ひとつ！$"

Text_1C089C:: @ 81C089C
	.string "カナズミの　ちかくにある　サン·トウカという\n"
	.string "フラワーショップも　よろしくの\p"
	.string "せかいに　はなを　さかせましょう！$"

Text_1C08D5:: @ 81C08D5
	.string "きょうは　もう　おしまいじゃ\n"
	.string "また　おいで\p"
	.string "せかいに　はなを　さかせましょう！$"

Text_1C08FD:: @ 81C08FD
	.string "じいさんの　きのみの　そだてかたは\n"
	.string "そりゃあ　せかいいちじゃ\p"
	.string "わしも　はなが　たかいわい\p"
	.string "ところで　あんた\n"
	.string "いい　ことばを　きいたことが　ないかい？$"

Text_1C0948:: @ 81C0948
	.string "おお！　とても　よい　ことばじゃ！\n"
	.string "かんどう　したわい\p"
	.string "ほれ　これを　もっていきなされ$"

Text_1C0974:: @ 81C0974
	.string "おお！　なかなか　よい　ことばじゃ\n"
	.string "あんたも　たいしたもんじゃ\p"
	.string "ほれ　これを　もっていきなされ$"

Text_1C09A4:: @ 81C09A4
	.string "まごたち　4にんも　じいさんを　しのぐ\n"
	.string "おおものに　なるじゃろうて\p"
	.string "じんせい　たのしいことが　つきんのう！$"

Text_1C09DA:: @ 81C09DA
	.string "ほう‥‥$"

Text_1C09DF:: @ 81C09DF
	.string "こんにちは！\p"
	.string "はなを　せかいに　ひろめる\n"
	.string "フラワーショップ　サン·トウカです！$"

Text_1C0A07:: @ 81C0A07
	.string "{PLAYER}{KUN}　きのみの　こと　しりたい？$"

Text_1C0A1A:: @ 81C0A1A
	.string "あなたの　なまえは‥‥\p"
	.string "{PLAYER}{KUN}ね！\n"
	.string "とっても　いい　なまえだね！\l"
	.string "{PLAYER}{KUN}　きのみのこと　しりたい？$"

Text_1C0A4E:: @ 81C0A4E
	.string "きのみはね　くろい　ふかふかの　つちの\n"
	.string "ところで　たまに　とれるの\l"
	.string "でね‥‥\p"
	.string "とったら　その1つを　また　うめるの！\p"
	.string "そうすると　その　きのみ　から\n"
	.string "めがでて　みきが　できて　はながさいて\l"
	.string "また　きのみ　が　できるの\p"
	.string "そうやって　はなを　ふやして\n"
	.string "せかいじゅうを　はなに　するのが\l"
	.string "わたしの　ゆめ　なんだ！\p"
	.string "だから　{PLAYER}{KUN}も　きのみを　うめて\n"
	.string "せかいに　はなを　ふやしてね！$"

Text_1C0B0B:: @ 81C0B0B
	.string "おはなって　とっても　しあわせな　きぶんに\n"
	.string "してくれるよね$"

Text_1C0B29:: @ 81C0B29
	.string "こんにちは！\p"
	.string "おはなは　せわを　すれば　するほど\n"
	.string "たくさん　きれいに　さいて　くれるの\p"
	.string "あなたも　せわを　したく　なった　でしょ？\n"
	.string "これ　あげるわ$"

Text_1C0B73:: @ 81C0B73
	.string "きのみが　そだつ　たびに\n"
	.string "じょうろで　みずを　あげてね！\p"
	.string "あとね\p"
	.string "きのみは　ずっと　ずっと　ほうっておくと\n"
	.string "じめんに　おちてしまうの\l"
	.string "でもね　そこから　また　めがでて　くるの！\p"
	.string "すごいよね！\n"
	.string "いきものの　ちからを　かんじるよね$"

Text_1C0BE5:: @ 81C0BE5
	.string "おねーちゃんたちを　みならって\n"
	.string "がんばって　おはなを　そだててるの\p"
	.string "はい！　これあげる！$"

Text_1C0C12:: @ 81C0C12
	.string "きのみは　うめて　おおきく　したり\n"
	.string "ポケモンに　もたせたり　できるの\p"
	.string "でも　さいきん　きのみを　いくつか　まぜると\n"
	.string "ポケモンの　おかしになる　きかいが\l"
	.string "ある　らしいんだ\p"
	.string "あたしも　おかし　ほしー$"

Text_1C0C74:: @ 81C0C74
	.string "{STR_VAR_1}　なまえ　なんていうの？\p"
	.string "‥‥‥　‥‥‥　‥‥‥\n"
	.string "へー　いいねー\p"
	.string "わたしは　キリ　っていう　なまえなの\p"
	.string "パパと　ママが　すくすくと　そだって\n"
	.string "こころの　あたたかい　おんなのこに　なって\l"
	.string "ほしいっていう　ねがいを　こめたんだって！\p"
	.string "{STR_VAR_1}にも　これ　あげる$"

Text_1C0CF5:: @ 81C0CF5
	.string "あと　{STR_VAR_1}には　キリの　だいすきな\n"
	.string "この　きのみも　あげちゃう！$"

Text_1C0D16:: @ 81C0D16
	.string "{STR_VAR_1}の　なまえには\n"
	.string "どんな　ねがいが　こめられてるの？$"

Text_1C0D32:: @ 81C0D32
	.string "はる　なつ　あき　ふゆ\n"
	.string "はるに　うまれると　はるが　すきで\l"
	.string "なつに　うまれると　なつが　すきなのかな？$"

Text_1C0D66:: @ 81C0D66
	.string "じゃあ　キリは　あきに　うまれたから\n"
	.string "あきが　だいすき！\p"
	.string "{STR_VAR_1}は　いつが　すき？$"

Text_1C0D8F:: @ 81C0D8F
	.string "そっか‥\n"
	.string "かんけいないのか‥\p"
	.string "しりたいことって　たくさんあるなー$"

gUnknown_81C0DB0:: @ 81C0DB0
	.string "It's crammed full of POKéMON\n"
	.string "books.$"

Text_1C0DD4:: @ 81C0DD4
	.string "ほんだなに　ならんでいるのは\n"
	.string "ポケモンの　ほん　ばかりだ$"

Text_1C0DF1:: @ 81C0DF1
	.string "A TOWN MAP.$"

gUnknown_81C0DFD:: @ 81C0DFD
	.string "Wow!\n"
	.string "Tons of POKéMON stuff!$"

gUnknown_81C0E19:: @ 81C0E19
	.string "Dishes and plates are neatly\n"
	.string "lined up.$"

gUnknown_81C0E40:: @ 81C0E40
	.string "It smells delicious!\n"
	.string "Somebody's been cooking here.$"

gUnknown_81C0E73:: @ 81C0E73
	.string "It's a nicely made dresser.\n"
	.string "It will hold a lot of stuff.$"

gUnknown_81C0EAC:: @ 81C0EAC
	.string "There's a pile of snacks here.$"

gUnknown_81C0ECB:: @ 81C0ECB
	.string "All your item needs fulfilled!\n"
	.string "POKéMON MART$"

gUnknown_81C0EF7:: @ 81C0EF7
	.string "Heal Your POKéMON!\n"
	.string "POKéMON CENTER$"

gUnknown_81C0F19:: @ 81C0F19
	.string "INDIGO PLATEAU\p"
	.string "The ultimate goal of TRAINERS!\n"
	.string "POKéMON LEAGUE HQ$"

gUnknown_81C0F59:: @ 81C0F59
	.string "INDIGO PLATEAU\p"
	.string "The highest POKéMON authority!\n"
	.string "POKéMON LEAGUE HQ$"

gUnknown_81C0F99:: @ 81C0F99
	.string "It should be packed with all kinds\n"
	.string "of delicious things to eat.$"

gUnknown_81C0FD8:: @ 81C0FD8
	.string "It's a blueprint of some sort.\n"
	.string "It's filled with diagrams and text.$"

gUnknown_81C101B:: @ 81C101B
	.string "It's a pretty picture of a POKéMON.\n"
	.string "It looks like it's feeling good.$"

gUnknown_81C1060:: @ 81C1060
	.string "What could this machine be?\n"
	.string "Better not mess around with it!$"

gUnknown_81C109C:: @ 81C109C
	.string "It's a telephone.\n"
	.string "Better not use it.$"

gUnknown_81C10C1:: @ 81C10C1
	.string "It's all complicated words and\n"
	.string "numbers that make no sense…$"

gUnknown_81C10FC:: @ 81C10FC
	.string "It's an advertising poster about\n"
	.string "all kinds of products.$"

gUnknown_81C1134:: @ 81C1134
	.string "Oh, that smells tasty!\n"
	.string "It might get the stomach growling!$"

gUnknown_81C116E:: @ 81C116E
	.string "Inside this…\n"
	.string "……\p"
	.string "There's nothing here!$"

gUnknown_81C1194:: @ 81C1194
	.string "It's a cup with a POKéMON mark\n"
	.string "on it.$"

gUnknown_81C11BA:: @ 81C11BA
	.string "The window is very well polished.$"

gUnknown_81C11DC:: @ 81C11DC
	.string "Outside the window…\p"
	.string "The sky looks fantastically\n"
	.string "beautiful.$"

gUnknown_81C1217:: @ 81C1217
	.string "Lights in different colors are\n"
	.string "flashing on and off.$"

gUnknown_81C124B:: @ 81C124B
	.string "All sorts of tools are lined up\n"
	.string "neatly.$"

gUnknown_81C1273:: @ 81C1273
	.string "It's a machine of some sort.\n"
	.string "It sure is impressive.$"

gUnknown_81C12A7:: @ 81C12A7
	.string "It's the latest video game!\n"
	.string "It sure looks fun!$"

gUnknown_81C12D6:: @ 81C12D6
	.string "There are obvious signs of burglary\n"
	.string "here…$"

gUnknown_81C1300:: @ 81C1300
	.string "There's a POKéMON on TV!\n"
	.string "It looks like it's having fun.$"

	.include "data/scripts/hole.inc"

gUnknown_81C137C:: @ 81C137C
	.string "The battery isn't charged enough.\p"
	.string "No. of steps required to fully\n"
	.string "charge the battery: {STR_VAR_1}{PAUSE_UNTIL_PRESS}$"

gUnknown_81C13D6:: @ 81C13D6
	.string "There are no TRAINERS within range\n"
	.string "who can battle…\p"
	.string "The VS SEEKER was turned off.{PAUSE_UNTIL_PRESS}$"

gUnknown_81C1429:: @ 81C1429
	.string "The other TRAINERS don't appear\n"
	.string "to be ready for battle.\p"
	.string "Let's wait till later.{PAUSE_UNTIL_PRESS}$"

Text_1C147A:: @ 81C147A
	.string "Hey!\n"
	.string "I saw you in VIRIDIAN FOREST!$"

Text_1C149D:: @ 81C149D
	.string "Hi! I like shorts!\n"
	.string "They're comfy and easy to wear!\p"
	.string "You should be wearing shorts, too!$"

Text_1C14F3:: @ 81C14F3
	.string "Excuse me!\n"
	.string "You keep looking at me, don't you?$"

Text_1C1521:: @ 81C1521
	.string "You're a TRAINER, aren't you?\n"
	.string "Let's get with it right away!$"

Text_1C155D:: @ 81C155D
	.string "That look you give me…\n"
	.string "It intrigues me so!$"

Text_1C1588:: @ 81C1588
	.string "Hey! What's wrong with you?\n"
	.string "You're still not wearing shorts!$"

Text_1C15C5:: @ 81C15C5
	.string "I'll battle you with the POKéMON\n"
	.string "I started raising.$"

Text_1C15F9:: @ 81C15F9
	.string "Eek!\n"
	.string "Did you push me?$"

Text_1C160F:: @ 81C160F
	.string "I always catch mushroom POKéMON\n"
	.string "on MT. MOON.$"

Text_1C163C:: @ 81C163C
	.string "Oh! You're that nosy kid who\n"
	.string "eavesdropped on us!$"

Text_1C166D:: @ 81C166D
	.string "Excuse me! Didn't I tell you that\n"
	.string "this is a private conversation?\p"
	.string "You shouldn't be listening in,\n"
	.string "you uncouth person!$"

Text_1C16E2:: @ 81C16E2
	.string "I'm trying to find something good\n"
	.string "that's not a BUG POKéMON, but…$"

Text_1C1723:: @ 81C1723
	.string "Huh?\n"
	.string "You want to go with me again?$"

Text_1C1746:: @ 81C1746
	.string "Me?\n"
	.string "Well, okay. I'll play this once.$"

Text_1C176B:: @ 81C176B
	.string "Hey, long time!\n"
	.string "Have you gotten better?$"

Text_1C1793:: @ 81C1793
	.string "You are good at POKéMON, but how\n"
	.string "is your chemistry grade?$"

Text_1C17CD:: @ 81C17CD
	.string "All right!\n"
	.string "Let's play another game!$"

Text_1C17F1:: @ 81C17F1
	.string "You need strategy to win at\n"
	.string "battling.\p"
	.string "Are you following my advice?$"

Text_1C1834:: @ 81C1834
	.string "I've collected many NIDORAN.\n"
	.string "I don't want them to evolve, but…$"

Text_1C1873:: @ 81C1873
	.string "School is fun, but I still think\n"
	.string "POKéMON are fun, too.$"

Text_1C18AA:: @ 81C18AA
	.string "MEOWTH and PERSIAN are so cute,\n"
	.string "meow, meow, meow!$"

Text_1C18DC:: @ 81C18DC
	.string "We may look silly standing here\n"
	.string "like this, but I can still battle.$"

Text_1C191F:: @ 81C191F
	.string "I'm a rambling, gaming dude!\n"
	.string "I'm on a winning streak!$"

Text_1C1955:: @ 81C1955
	.string "What's a cute, round, and fluffy\n"
	.string "POKéMON?\p"
	.string "You already know, don't you?$"

Text_1C199C:: @ 81C199C
	.string "My bike's still acting up, man.$"

Text_1C19BC:: @ 81C19BC
	.string "Okay, kid!\n"
	.string "Don't expect mercy this time!$"

Text_1C19E5:: @ 81C19E5
	.string "ELI: Our twin power became even\n"
	.string "better!$"

Text_1C1A0D:: @ 81C1A0D
	.string "ANNE: Our twin power powered up!$"

Text_1C1A2E:: @ 81C1A2E
	.string "We're to battle again?\n"
	.string "This time, you're mine!$"

Text_1C1A5D:: @ 81C1A5D
	.string "I haven't forgotten you were with\n"
	.string "those good-looking POKéMON.$"

Text_1C1A9B:: @ 81C1A9B
	.string "I'm taking ROCK TUNNEL to go to\n"
	.string "LAVENDER…\p"
	.string "But I keep getting stopped by\n"
	.string "everyone along the way…$"

Text_1C1AFB:: @ 81C1AFB
	.string "Don't you dare patronize me today!\n"
	.string "We're playing for keeps!$"

Text_1C1B37:: @ 81C1B37
	.string "Bwahaha!\n"
	.string "Great! I was bored again, eh!$"

Text_1C1B5E:: @ 81C1B5E
	.string "Hahaha!\n"
	.string "A little toughie, as always!$"

Text_1C1B83:: @ 81C1B83
	.string "I got up early every day to train\n"
	.string "my POKéMON from cocoons!$"

Text_1C1BBE:: @ 81C1BBE
	.string "Hahahaha!\n"
	.string "I'll win this time!$"

Text_1C1BDC:: @ 81C1BDC
	.string "Go win, my super BUG POKéMON!$"

Text_1C1BFA:: @ 81C1BFA
	.string "Wow, you came here again?\n"
	.string "Maybe you're a POKéMANIAC, too?\l"
	.string "Want to see my collection?$"

Text_1C1C4F:: @ 81C1C4F
	.string "Ha-hahah-ah-ha!\n"
	.string "I can't stop sneezing!$"

Text_1C1C76:: @ 81C1C76
	.string "Hi, kid!\n"
	.string "Did I show you my POKéMON?$"

Text_1C1C9A:: @ 81C1C9A
	.string "I went out to a POKéMON GYM again.\p"
	.string "…But I lost as usual.$"

Text_1C1CD3:: @ 81C1CD3
	.string "Ah!\n"
	.string "This mountain air is delicious!\l"
	.string "It's so good, I can't leave!$"

Text_1C1D14:: @ 81C1D14
	.string "My head is starting to spin.\n"
	.string "I've been hiking for too long…$"

Text_1C1D50:: @ 81C1D50
	.string "Win, lose, or draw!\n"
	.string "Now for our rematch!$"

Text_1C1D79:: @ 81C1D79
	.string "Competing is the ultimate thrill.\n"
	.string "I still can't get enough!$"

Text_1C1DB5:: @ 81C1DB5
	.string "You know, right?\n"
	.string "Let's go, but don't cheat!$"

Text_1C1DE1:: @ 81C1DE1
	.string "Hi, there!\p"
	.string "But be careful!\n"
	.string "I'm still laying down some cables!$"

Text_1C1E1F:: @ 81C1E1F
	.string "I became a TRAINER a while ago.\n"
	.string "But, I think I can win.$"

Text_1C1E57:: @ 81C1E57
	.string "Fwahaha!\n"
	.string "I have never lost!\p"
	.string "…And if I did, I've forgotten all\n"
	.string "about it!$"

Text_1C1E9F:: @ 81C1E9F
	.string "I have never won before…\p"
	.string "Perhaps I am destined to remain\n"
	.string "that way…$"

Text_1C1EE2:: @ 81C1EE2
	.string "I'm the best in my class.\n"
	.string "I train every morning and night!$"

Text_1C1F1D:: @ 81C1F1D
	.string "Keep your eyes out for live wires!$"

Text_1C1F40:: @ 81C1F40
	.string "I raised my POKéMON carefully.\n"
	.string "They should be ready by now.\l"
	.string "This time, they should win, too.$"

Text_1C1F9D:: @ 81C1F9D
	.string "Yeah!\n"
	.string "I got a bite, here!\l"
	.string "Th-this might be the real thing!$"

Text_1C1FD8:: @ 81C1FD8
	.string "You're finally here.\n"
	.string "Fishing is a waiting game.$"

Text_1C2008:: @ 81C2008
	.string "Still can't find a MOON STONE…\n"
	.string "Have you found one?$"

Text_1C203B:: @ 81C203B
	.string "Electricity has always been my\n"
	.string "specialty.\p"
	.string "I don't know a thing about POKéMON\n"
	.string "of the sea, though.$"

Text_1C209C:: @ 81C209C
	.string "The FISHING FOOL vs. POKéMON KID!\n"
	.string "Another round, fight!$"

Text_1C20D4:: @ 81C20D4
	.string "I love fishing, don't get me wrong.\n"
	.string "But, I wish I had more work…\l"
	.string "…It's hard to give up fishing!$"

Text_1C2134:: @ 81C2134
	.string "What's catching?\p"
	.string "You'll never know unless you beat\n"
	.string "me!$"

Text_1C216B:: @ 81C216B
	.string "JES: I'll win here today and\n"
	.string "propose to my GIA.$"

Text_1C219B:: @ 81C219B
	.string "GIA: Hey, JES…\n"
	.string "I've been waiting a long time now.\p"
	.string "If we win today, I'll marry you!$"

Text_1C21EE:: @ 81C21EE
	.string "My bird POKéMON remember you!$"

Text_1C220C:: @ 81C220C
	.string "I want to be the best TRAINER \n"
	.string "while I'm a kid!$"

Text_1C223C:: @ 81C223C
	.string "Wow!\n"
	.string "You got more cool BADGES!$"

Text_1C225B:: @ 81C225B
	.string "My cutely grown POKéMON wish to\n"
	.string "become reacquainted with you.$"

Text_1C2299:: @ 81C2299
	.string "I cleaned out my savings and\n"
	.string "bought more CARBOS.$"

Text_1C22CA:: @ 81C22CA
	.string "I'm not going to lose this time.\n"
	.string "The wind's blowing my way!$"

Text_1C2306:: @ 81C2306
	.string "Oh, you're back?\p"
	.string "Sure, I'll play again with you,\n"
	.string "sweetie.$"

Text_1C2340:: @ 81C2340
	.string "Can't you forget that you battled\n"
	.string "with me?$"

Text_1C236B:: @ 81C236B
	.string "What're you starin' at?$"

Text_1C2383:: @ 81C2383
	.string "I always go with bird POKéMON.\n"
	.string "I've dedicated myself to them.$"

Text_1C23C1:: @ 81C23C1
	.string "I used TMs to teach good moves\n"
	.string "to my POKéMON.$"

Text_1C23EF:: @ 81C23EF
	.string "My bird POKéMON should be ready\n"
	.string "for battle this time.$"

Text_1C2425:: @ 81C2425
	.string "Are you using TMs on POKéMON?\n"
	.string "Just holding them is useless.$"

Text_1C2461:: @ 81C2461
	.string "Have you taught your bird POKéMON\n"
	.string "how to FLY?\p"
	.string "You'll be able to soar with it into\n"
	.string "the sky! Give it a try.$"

Text_1C24CB:: @ 81C24CB
	.string "The legend of the winged mirages…\n"
	.string "You've heard it, right?$"

Text_1C2505:: @ 81C2505
	.string "I'm really not into it, but okay.\n"
	.string "Let's go!$"

Text_1C2531:: @ 81C2531
	.string "Hey!\n"
	.string "I remember you!\p"
	.string "C'mon, c'mon.\n"
	.string "Let's go, let's go, let's go!$"

Text_1C2572:: @ 81C2572
	.string "You're here again, huh?\n"
	.string "Shut up and battle.$"

Text_1C259E:: @ 81C259E
	.string "We've been riding here because of\n"
	.string "the wide-open spaces.$"

Text_1C25D6:: @ 81C25D6
	.string "POKéMON battle, right?\n"
	.string "Cool! Rumble!$"

Text_1C25FB:: @ 81C25FB
	.string "KIRI: JAN, I hope we win today.$"

Text_1C261B:: @ 81C261B
	.string "JAN: KIRI, here we go!\n"
	.string "Let's win for sure this time!$"

Text_1C2650:: @ 81C2650
	.string "I'm going to keep battling with the\n"
	.string "POKéMON I got in trades.$"

Text_1C268D:: @ 81C268D
	.string "You look gentle, so I think I can\n"
	.string "beat you.\p"
	.string "I'll give it one more go!$"

Text_1C26D3:: @ 81C26D3
	.string "When I whistle, bird POKéMON\n"
	.string "gather around.\p"
	.string "They're amazingly cute!$"

Text_1C2717:: @ 81C2717
	.string "Hmm? My birds are shivering!\n"
	.string "Wait, aren't you that TRAINER…$"

Text_1C2753:: @ 81C2753
	.string "Oh, you're a little cutie!\n"
	.string "So like a darling POKéMON!\l"
	.string "I remember you now!$"

Text_1C279D:: @ 81C279D
	.string "I raise POKéMON for protection\n"
	.string "because I live alone.\p"
	.string "That hasn't changed.$"

Text_1C27E7:: @ 81C27E7
	.string "Hey, kid! C'mon!\n"
	.string "I got these off some loser!$"

Text_1C2814:: @ 81C2814
	.string "Fork over all your cash when you\n"
	.string "lose to me, kid!$"

Text_1C2846:: @ 81C2846
	.string "What's cool and happening?\n"
	.string "Trading POKéMON, of course.$"

Text_1C287D:: @ 81C287D
	.string "Want to play with my POKéMON\n"
	.string "again?$"

Text_1C28A1:: @ 81C28A1
	.string "MYA: Hi, we keep meeting,\n"
	.string "don't we?\p"
	.string "Help me train my little brother\n"
	.string "again?$"

Text_1C28EC:: @ 81C28EC
	.string "RON: My sister's gotten more\n"
	.string "powerful…$"

Text_1C2913:: @ 81C2913
	.string "What do you want?$"

Text_1C2925:: @ 81C2925
	.string "Nice BIKE!\n"
	.string "Hand it over quick!$"

Text_1C2944:: @ 81C2944
	.string "Come out and play, little mouse.\n"
	.string "I'll treat you right!$"

Text_1C297B:: @ 81C297B
	.string "Hey, wait a second!\n"
	.string "Don't call me and then run away!$"

Text_1C29B0:: @ 81C29B0
	.string "I'm feeling hungry and mean!\n"
	.string "I really need a punching bag!$"

Text_1C29EB:: @ 81C29EB
	.string "Hey, there!\n"
	.string "We'll have ourselves a good time!$"

Text_1C2A19:: @ 81C2A19
	.string "JED: Are you here to see our\n"
	.string "love, which knows no bounds?$"

Text_1C2A53:: @ 81C2A53
	.string "LEA: Sometimes, the intensity of\n"
	.string "our love scares me.$"

Text_1C2A88:: @ 81C2A88
	.string "I told you, there's no getting rich\n"
	.string "quick in battling kids.$"

Text_1C2AC4:: @ 81C2AC4
	.string "I'm mighty proud of my bod, kiddo.\n"
	.string "Come on!$"

Text_1C2AF0:: @ 81C2AF0
	.string "You out for a stroll?$"

Text_1C2B06:: @ 81C2B06
	.string "We're BIKERS!\n"
	.string "We rule the roads, man!$"

Text_1C2B2C:: @ 81C2B2C
	.string "VOLTORB's going to seriously\n"
	.string "electrify you today!$"

Text_1C2B5E:: @ 81C2B5E
	.string "I leveled up my POKéMON, but it\n"
	.string "absolutely won't evolve. Why?$"

Text_1C2B9C:: @ 81C2B9C
	.string "Gaah! I really need to exercise\n"
	.string "and seriously trim some flab!$"

Text_1C2BDA:: @ 81C2BDA
	.string "Be a rebel!$"

Text_1C2BE6:: @ 81C2BE6
	.string "Yep, that's a nice BIKE!\n"
	.string "How's it handle?$"

Text_1C2C10:: @ 81C2C10
	.string "Get lost, kid!\n"
	.string "I'm bushed!$"

Text_1C2C2B:: @ 81C2C2B
	.string "I've been checking every grassy\n"
	.string "area for new POKéMON.\p"
	.string "But it's not always easy…$"

Text_1C2C7B:: @ 81C2C7B
	.string "Koorukukukoo!\n"
	.string "Is my birdcall getting better?$"

Text_1C2CA8:: @ 81C2CA8
	.string "I warned you before, this is my\n"
	.string "turf!\p"
	.string "I don't want you coming around.$"

Text_1C2CEE:: @ 81C2CEE
	.string "I'm almost warmed up to go\n"
	.string "out for a swim.$"

Text_1C2D19:: @ 81C2D19
	.string "Wait! Slow down!\n"
	.string "What if you have a heart attack?$"

Text_1C2D4B:: @ 81C2D4B
	.string "I love swimming!\n"
	.string "I guess you're the surfing type.$"

Text_1C2D7D:: @ 81C2D7D
	.string "What's beyond the horizon?\n"
	.string "Have you seen?$"

Text_1C2DA7:: @ 81C2DA7
	.string "I tried diving for POKéMON again,\n"
	.string "but it was a no-go like before.$"

Text_1C2DE9:: @ 81C2DE9
	.string "I look at the sea to forget all\n"
	.string "the bad things that happened.\p"
	.string "…Like losing to you the last time!$"

Text_1C2E4A:: @ 81C2E4A
	.string "You always get to ride your\n"
	.string "POKéMON…\p"
	.string "It looks so relaxing.\n"
	.string "Can I have it if I win?$"

Text_1C2E9D:: @ 81C2E9D
	.string "Swimming's great!\n"
	.string "Sunburns aren't!$"

Text_1C2EC0:: @ 81C2EC0
	.string "These waters are treacherous!\n"
	.string "You shouldn't come back here!$"

Text_1C2EFC:: @ 81C2EFC
	.string "I swam here with my friends…\n"
	.string "I'm tired…\l"
	.string "Must we really battle again?$"

Text_1C2F41:: @ 81C2F41
	.string "LIA: You know my brother just\n"
	.string "became a TRAINER, right?\p"
	.string "I want to make him better, so I\n"
	.string "need your help again.$"

Text_1C2FAE:: @ 81C2FAE
	.string "LUC: My big sis taught me all\n"
	.string "about POKéMON.\p"
	.string "I wonder if I'm better?$"

Text_1C2FF3:: @ 81C2FF3
	.string "The water is shallow here.\n"
	.string "There are many people swimming.$"

Text_1C302E:: @ 81C302E
	.string "Are you jealous that I'm\n"
	.string "vacationing on SEAFOAM?$"

Text_1C305F:: @ 81C305F
	.string "I love floating with the fishes\n"
	.string "here among the waves.$"

Text_1C3095:: @ 81C3095
	.string "Were you on vacation, too?$"

Text_1C30B0:: @ 81C30B0
	.string "Check out my physique!\p"
	.string "It's even more buff than ever\n"
	.string "before!$"

Text_1C30ED:: @ 81C30ED
	.string "Why are you riding a POKéMON?\n"
	.string "Haven't you learned to swim yet?$"

Text_1C312C:: @ 81C312C
	.string "I rode my bird POKéMON here.$"

Text_1C3149:: @ 81C3149
	.string "My boyfriend gave me big pearls.\n"
	.string "And, they've grown bigger!$"

Text_1C3185:: @ 81C3185
	.string "I swam here from CINNABAR ISLAND.\n"
	.string "It wasn't easy, like I said.$"

Text_1C31C4:: @ 81C31C4
	.string "CINNABAR, in the west, has a LAB\n"
	.string "for POKéMON.\p"
	.string "My daddy works there.$"

Text_1C3208:: @ 81C3208
	.string "You want to know if the fish are\n"
	.string "biting?$"

Text_1C3231:: @ 81C3231
	.string "I got a big haul again!\n"
	.string "Wanna go for it once more?$"

Text_1C3264:: @ 81C3264
	.string "The sea cleanses my body and soul!$"

Text_1C3287:: @ 81C3287
	.string "きょうも　およぎに\n"
	.string "きちまったぜ$"

Text_1C3298:: @ 81C3298
	.string "I caught my POKéMON at sea.\n"
	.string "And that's where I train them.$"

Text_1C32D3:: @ 81C32D3
	.string "Right now, I'm in another triathlon\n"
	.string "meet!$"

Text_1C32FD:: @ 81C32FD
	.string "Ahh!\n"
	.string "Feel the sun and the wind!$"

Text_1C331D:: @ 81C331D
	.string "Hey, cut it out already.\n"
	.string "You always scare away the fish!$"

Text_1C3356:: @ 81C3356
	.string "Keep me company till I get a hit.$"

Text_1C3378:: @ 81C3378
	.string "LIL: Huh? A battle again?\n"
	.string "IAN, can't you do it alone?$"

Text_1C33AE:: @ 81C33AE
	.string "IAN: My sis is still a slob.\n"
	.string "Help me get her into shape!$"

Text_1C33E7:: @ 81C33E7
	.string "I won't lose while I'm here!$"

Text_1C3404:: @ 81C3404
	.string "Dad took me to a great party on\n"
	.string "the S.S. ANNE at VERMILION CITY.$"

Text_1C3445:: @ 81C3445
	.string "I'm a cool guy.\n"
	.string "I've got a girlfriend!\p"
	.string "I'll show her how cool I am for\n"
	.string "sure this time!$"

Text_1C349C:: @ 81C349C
	.string "Hi!\n"
	.string "My boyfriend is cool!\l"
	.string "My conditioning's good today!$"

Text_1C34D4:: @ 81C34D4
	.string "I had this feeling…\n"
	.string "I knew I had to battle you again!$"

Text_1C350A:: @ 81C350A
	.string "My friend has many cute POKéMON.\n"
	.string "I'm so jealous!$"

Text_1C353B:: @ 81C353B
	.string "I just trained up on MT. MOON,\n"
	.string "but I've still got gas in the tank!$"

Text_1C357E:: @ 81C357E
	.string "A POKéMANIAC lives on the cape.\n"
	.string "Have you seen his collection?$"

Text_1C35BC:: @ 81C35BC
	.string "You're going to see BILL again?\n"
	.string "First, we battle!$"

Text_1C35EE:: @ 81C35EE
	.string "I saw your feat from the grass!$"

Text_1C360E:: @ 81C360E
	.string "Okay!\n"
	.string "I'll stomp you!$"

Text_1C3624:: @ 81C3624
	.string "You always look so busy…\n"
	.string "Aren't you getting tired?$"

Text_1C3657:: @ 81C3657
	.string "You really must love coming to\n"
	.string "NUGGET BRIDGE.$"

Text_1C3685:: @ 81C3685
	.string "The time we battled…\p"
	.string "Even though I was the second in\n"
	.string "line, I was the best, wasn't I?$"

Text_1C36DA:: @ 81C36DA
	.string "People call this the NUGGET\n"
	.string "BRIDGE!\p"
	.string "You've already beaten us, so you're\n"
	.string "not allowed to take the challenge…\p"
	.string "…But, you're welcome to battle with\n"
	.string "us again.$"

Text_1C3773:: @ 81C3773
	.string "Lying back, rocked by the waves…\n"
	.string "I don't notice time slipping by…$"

Text_1C37B5:: @ 81C37B5
	.string "The weather's gorgeous!\n"
	.string "I'll try not to spoil it.$"

Text_1C37E7:: @ 81C37E7
	.string "My sunburn is starting to hurt…$"

Text_1C3807:: @ 81C3807
	.string "The fire bird's mountain casts\n"
	.string "a huge shadow…$"

Text_1C3835:: @ 81C3835
	.string "I have this strong feeling that\n"
	.string "I can win this time!$"

Text_1C386A:: @ 81C386A
	.string "Wait! Wait a second!\n"
	.string "I'm sure I've hooked a big one!$"

Text_1C389F:: @ 81C389F
	.string "You'll help me out with my\n"
	.string "training again?$"

Text_1C38CA:: @ 81C38CA
	.string "We haven't missed a single day of\n"
	.string "training yet!$"

Text_1C38FA:: @ 81C38FA
	.string "Every morning, before breakfast,\n"
	.string "I swim around this island…\l"
	.string "Three times!$"

Text_1C3943:: @ 81C3943
	.string "Dress appropriately for battle!\n"
	.string "Lose that frivolous outfit, I said!$"

Text_1C3987:: @ 81C3987
	.string "You know, everything tastes great\n"
	.string "when you're out in the wild.$"

Text_1C39C6:: @ 81C39C6
	.string "I ate too much again, so will you\n"
	.string "battle us for some exercise?$"

Text_1C3A05:: @ 81C3A05
	.string "KIA: My big brother and I make\n"
	.string "an awesome combination!\p"
	.string "We won't lose this time!$"

Text_1C3A55:: @ 81C3A55
	.string "MIK: Together with KIA, we're\n"
	.string "afraid of nothing!\p"
	.string "We'll prove it to you this time!$"

Text_1C3AA7:: @ 81C3AA7
	.string "Are we to battle again?$"

Text_1C3ABF:: @ 81C3ABF
	.string "From where have you come, and\n"
	.string "where are you bound?$"

Text_1C3AF2:: @ 81C3AF2
	.string "I want to swim without my float\n"
	.string "ring soon.$"

Text_1C3B1D:: @ 81C3B1D
	.string "Yay, yay!\n"
	.string "POKéMON!$"

Text_1C3B30:: @ 81C3B30
	.string "Oh, no, didn't I tell you already?\n"
	.string "Please, stay away from me!$"

Text_1C3B6E:: @ 81C3B6E
	.string "JOY: We've gotten stronger!\n"
	.string "Lots and lots!$"

Text_1C3B99:: @ 81C3B99
	.string "MEG: You can't beat us today!$"

Text_1C3BB7:: @ 81C3BB7
	.string "Oh, hello!\p"
	.string "Are you raising your POKéMON in a\n"
	.string "good environment?$"

Text_1C3BF6:: @ 81C3BF6
	.string "With these hands, I will create\n"
	.string "my victory today.$"

Text_1C3C28:: @ 81C3C28
	.string "Must I repeat myself?\n"
	.string "I'm trying to paint.\l"
	.string "Please keep out of my sight!$"

Text_1C3C70:: @ 81C3C70
	.string "I haven't made any progress…\n"
	.string "I still can't get the right angle…$"

Text_1C3CB0:: @ 81C3CB0
	.string "Oh, you will give me another\n"
	.string "opportunity to match wits with you?$"

Text_1C3CF1:: @ 81C3CF1
	.string "They're almost finished making the\n"
	.string "pool for my POKéMON.\p"
	.string "You must drop in for a visit.$"

Text_1C3D47:: @ 81C3D47
	.string "I'm a good runner.\n"
	.string "I've gotten even faster!$"

Text_1C3D73:: @ 81C3D73
	.string "I say, friend!\n"
	.string "Let us enjoy our time together!$"

Text_1C3DA2:: @ 81C3DA2
	.string "I'm the eldest of the BIRD\n"
	.string "BROTHERS. Remember me?\p"
	.string "That's right, I'm the one who loves\n"
	.string "birds for their beaks!$"

Text_1C3E0F:: @ 81C3E0F
	.string "I'm the middle kid of the BIRD\n"
	.string "BROTHERS.\p"
	.string "I'm the one that loves wings.\n"
	.string "Let's battle again!$"

Text_1C3E6A:: @ 81C3E6A
	.string "I'm the youngest of the BIRD\n"
	.string "BROTHERS.\p"
	.string "I love birds for their down.\n"
	.string "I didn't think I'd see you again!$"

Text_1C3ED0:: @ 81C3ED0
	.string "I'm still having no luck at all.\n"
	.string "A battle'd be a change of pace!$"

Text_1C3F11:: @ 81C3F11
	.string "Gasp… Gasp…\p"
	.string "I swam here from SIX ISLAND's port\n"
	.string "in one go again.$"

Text_1C3F51:: @ 81C3F51
	.string "You always come along while I'm\n"
	.string "swimming.$"

Text_1C3F7B:: @ 81C3F7B
	.string "AVA: Let's have another\n"
	.string "two-on-two marine battle today!$"

Text_1C3FB3:: @ 81C3FB3
	.string "GEB: My big sister and I are way\n"
	.string "tougher than before!$"

Text_1C3FE9:: @ 81C3FE9
	.string "…Huh?\p"
	.string "I envision my house, but TELEPORT\n"
	.string "always brings me here!$"

Text_1C4028:: @ 81C4028
	.string "Oh, hello.\n"
	.string "A pleasant breeze is blowing again.$"

Text_1C4057:: @ 81C4057
	.string "Hehehe, I'm practicing in secret\n"
	.string "again.$"

Text_1C407F:: @ 81C407F
	.string "What, you're sick of seeing\n"
	.string "SWIMMERS like me?\p"
	.string "Aww, don't be hatin'!\n"
	.string "Battle with me again.$"

Text_1C40D9:: @ 81C40D9
	.string "Sigh…\n"
	.string "My boyfriend's busy again…$"

Text_1C40FA:: @ 81C40FA
	.string "Come on, tell me, where are the\n"
	.string "mountains around these parts?$"

Text_1C4138:: @ 81C4138
	.string "MIU: Hello, POKéMON!\n"
	.string "It's time to play again!$"

Text_1C4166:: @ 81C4166
	.string "MIA: Hello, POKéMON!\n"
	.string "It's time to battle again!$"

Text_1C4196:: @ 81C4196
	.string "There appear to be many secrets\n"
	.string "still unsolved in this world.$"

Text_1C41D4:: @ 81C41D4
	.string "Hi, didn't we meet before?\n"
	.string "What compelled you to come back?$"

Text_1C4210:: @ 81C4210
	.string "It's been said that there are\n"
	.string "mysterious stones on this island.\p"
	.string "Have you discovered anything since\n"
	.string "we last met?$"

Text_1C4280:: @ 81C4280
	.string "A rematch with you, so high up!$"

Text_1C42A0:: @ 81C42A0
	.string "I'm pretty familiar with the land\n"
	.string "around these parts.$"

Text_1C42D6:: @ 81C42D6
	.string "I sensed your approach.$"

Text_1C42EE:: @ 81C42EE
	.string "Somewhere on this island, peculiar\n"
	.string "POKéMON are sleeping.$"

Text_1C4327:: @ 81C4327
	.string "Kyahaha!\p"
	.string "Coming back won't change a thing.\n"
	.string "I'll flick you away effortlessly!$"

Text_1C4374:: @ 81C4374
	.string "Howdy! You're a member of my\n"
	.string "fan club, isn't that right?$"

Text_1C43AD:: @ 81C43AD
	.string "This island is too spread out…\n"
	.string "Patrolling the place is a drag…$"

Text_1C43EC:: @ 81C43EC
	.string "I don't forgive people who abuse\n"
	.string "POKéMON!$"

Text_1C4416:: @ 81C4416
	.string "EVE: I'll team up with JON and\n"
	.string "battle together again.$"

Text_1C444C:: @ 81C444C
	.string "JON: When I'm with EVE, it feels\n"
	.string "like we could never lose, not ever.$"

Text_1C4491:: @ 81C4491
	.string "Let's have another battle.\n"
	.string "My conditioning's in top form!$"

Text_1C44CB:: @ 81C44CB
	.string "It doesn't matter if you happen to\n"
	.string "have the strongest POKéMON…\p"
	.string "It doesn't mean a thing if you don't\n"
	.string "know how to use them properly!$"

Text_1C454E:: @ 81C454E
	.string "I work to protect the environment.\n"
	.string "In turn, nature protects me!$"

Text_1C458E:: @ 81C458E
	.string "Every time we meet, you have those\n"
	.string "snazzy shoes on.$"

Text_1C45C2:: @ 81C45C2
	.string "You must have gotten tougher.\n"
	.string "Let me battle you, please!$"

Text_1C45FB:: @ 81C45FB
	.string "I was given the best possible\n"
	.string "education to become this strong.\p"
	.string "I won't lose this time.\n"
	.string "Absolutely not!$"

Text_1C4662:: @ 81C4662
	.string "LEX: My darling NYA, together\n"
	.string "we will win for certain!$"

Text_1C4699:: @ 81C4699
	.string "NYA: I won't drag down my mentor\n"
	.string "LEX! We're going to win!$"

Text_1C46D3:: @ 81C46D3
	.string "Have you discovered anything about\n"
	.string "this stone chamber?$"

Text_1C470A:: @ 81C470A
	.string "A mystic POKéMON is said to sleep\n"
	.string "inside here.$"

Text_1C4739:: @ 81C4739
	.string "My teacher is showing me how to\n"
	.string "paint some more.$"

Text_1C476A:: @ 81C476A
	.string "Today, in addition to our lesson,\n"
	.string "we came to see the chamber again.$"

	.include "data/scripts/move_tutors.inc"

SevenIsland_TrainerTower_1F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_2F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_3F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_4F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_5F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_6F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_7F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_8F_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_Elevator_MapScript1_1C4F54:: @ 81C4F54
SevenIsland_TrainerTower_Roof_MapScript1_1C4F54:: @ 81C4F54
	setvar VAR_0x4002, 0
	setvar VAR_0x8004, 10
	special sub_815D9E8
	end

SevenIsland_TrainerTower_1F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_2F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_3F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_4F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_5F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_6F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_7F_MapScript2_1C4F62:: @ 81C4F62
SevenIsland_TrainerTower_8F_MapScript2_1C4F62:: @ 81C4F62
	setvar VAR_0x8004, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C4FA7
	case 1, EventScript_1C4FC5
	case 2, EventScript_1C5019
	setflag FLAG_TEMP_2
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_4
	setflag FLAG_TEMP_5
	setvar VAR_0x400E, 1
	setvar VAR_0x400F, 1
	end

EventScript_1C4FA7:: @ 81C4FA7
	setflag FLAG_TEMP_2
	setflag FLAG_TEMP_4
	setflag FLAG_TEMP_5
	setvar VAR_0x400F, 1
	setobjectxyperm 3, 15, 13
	setobjectmovementtype 3, 9
	goto EventScript_1C5042

EventScript_1C4FC5:: @ 81C4FC5
	setflag FLAG_TEMP_3
	setflag FLAG_TEMP_4
	setvar VAR_0x400E, 1
	setvar VAR_0x8004, 5
	special sub_815D9E8
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1C4FFE
	setobjectxyperm 2, 10, 12
	setobjectmovementtype 2, 9
	setobjectxyperm 5, 10, 13
	setobjectmovementtype 5, 9
	goto EventScript_1C5042

EventScript_1C4FFE:: @ 81C4FFE
	setobjectxyperm 2, 10, 12
	setobjectmovementtype 2, 8
	setobjectxyperm 5, 11, 12
	setobjectmovementtype 5, 8
	goto EventScript_1C5042

EventScript_1C5019:: @ 81C5019
	setflag FLAG_TEMP_5
	setvar VAR_0x400F, 1
	setobjectxyperm 2, 10, 10
	setobjectmovementtype 2, 8
	setobjectxyperm 3, 14, 13
	setobjectmovementtype 3, 9
	setobjectxyperm 4, 10, 16
	setobjectmovementtype 4, 7
EventScript_1C5042:
	setflag FLAG_TEMP_6
	end

SevenIsland_TrainerTower_1F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_2F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_3F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_4F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_5F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_6F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_7F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_8F_MapScript3_1C5046:: @ 81C5046
SevenIsland_TrainerTower_Elevator_MapScript2_1C5046:: @ 81C5046
SevenIsland_TrainerTower_Roof_MapScript2_1C5046:: @ 81C5046
	map_script_2 VAR_0x4002, 0, EventScript_1C5050
	.2byte 0

EventScript_1C5050:: @ 81C5050
	setvar VAR_0x4002, 1
	setvar VAR_0x8004, 5
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1C5072
	setvar VAR_0x400E, 1
	setvar VAR_0x400F, 1
EventScript_1C5072:
	setvar VAR_0x8004, 18
	special sub_815D9E8
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1C5086
	end

EventScript_1C5086:: @ 81C5086
	warp MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY, 255, 9, 7
	waitstate
EventScript_1C508F::
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C50C2
	case 1, EventScript_1C510D
	case 2, EventScript_1C515C
EventScript_1C50C2:
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 3, Movement_1A75DB
	waitmovement 0
	applymovement 3, Movement_1A75DD
	waitmovement 0
	setvar VAR_0x400E, 1
	applymovement 3, Movement_1C5541
	waitmovement 0
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	setvar VAR_0x8006, 0
	special sub_815D9E8
	msgbox gStringVar4
	closemessage
	goto EventScript_1C5219

EventScript_1C510D:: @ 81C510D
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	copyvar VAR_0x8006, VAR_0x4003
	special sub_815D9E8
	msgbox gStringVar4
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	addvar VAR_0x4003, 1
	compare VAR_0x4003, 1
	goto_if eq, EventScript_1C5146
	setvar VAR_0x4003, 0
EventScript_1C5146:
	copyvar VAR_0x8006, VAR_0x4003
	special sub_815D9E8
	msgbox gStringVar4
	closemessage
	goto EventScript_1C5219

EventScript_1C515C:: @ 81C515C
	switch VAR_0x4001
	case 0, EventScript_1C5182
	case 1, EventScript_1C51AD
	case 2, EventScript_1C51D8
EventScript_1C5182:
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 4, Movement_1A75DB
	waitmovement 0
	applymovement 4, Movement_1A75DD
	waitmovement 0
	applymovement 4, Movement_1C5546
	waitmovement 0
	goto EventScript_1C51FE

EventScript_1C51AD:: @ 81C51AD
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 2, Movement_1A75DB
	waitmovement 0
	applymovement 2, Movement_1A75DD
	waitmovement 0
	applymovement 2, Movement_1C5549
	waitmovement 0
	goto EventScript_1C51FE

EventScript_1C51D8:: @ 81C51D8
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 3, Movement_1A75DB
	waitmovement 0
	applymovement 3, Movement_1A75DD
	waitmovement 0
	applymovement 3, Movement_1C5542
	waitmovement 0
EventScript_1C51FE:
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 2
	copyvar VAR_0x8006, VAR_0x4001
	special sub_815D9E8
	msgbox gStringVar4
	closemessage
EventScript_1C5219:
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 0
	special sub_815D9E8
	waitstate
	switch VAR_RESULT
	case 1, EventScript_1C524D
	case 2, EventScript_1C52E0
	case 3, EventScript_1C52E0
EventScript_1C524D:
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C52D7
	case 1, EventScript_1C52BA
	case 2, EventScript_1C5280
EventScript_1C5280:
	switch VAR_0x4001
	case 0, EventScript_1C52A6
	case 1, EventScript_1C52B0
	case 2, EventScript_1C52D0
EventScript_1C52A6:
	addvar VAR_0x4001, 1
	goto EventScript_1C515C

EventScript_1C52B0:: @ 81C52B0
	addvar VAR_0x4001, 1
	goto EventScript_1C515C

EventScript_1C52BA:: @ 81C52BA
	applymovement 5, Movement_1C554C
	waitmovement 0
	applymovement 2, Movement_1C5550
	goto EventScript_1C52D7

EventScript_1C52D0:: @ 81C52D0
	applymovement 3, Movement_1C554D
EventScript_1C52D7:
	setvar VAR_0x8004, 4
	special sub_815D9E8
	end

EventScript_1C52E0:: @ 81C52E0
	special sp000_heal_pokemon
	setvar VAR_0x8004, 11
	special sub_815D9E8
	warp MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY, 255, 9, 7
	waitstate

EventScript_1C52F4:: @ 81C52F4
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C5327
	case 1, EventScript_1C5327
	case 2, EventScript_1C5331
EventScript_1C5327:
	setvar VAR_0x8006, 0
	goto EventScript_1C5391

EventScript_1C5331:: @ 81C5331
	setvar VAR_0x8006, 1
	goto EventScript_1C5391

EventScript_1C533B:: @ 81C533B
	setvar VAR_0x8004, 3
	setvar VAR_0x8005, 0
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C536E
	case 1, EventScript_1C536E
	case 2, EventScript_1C5378
EventScript_1C536E:
	setvar VAR_0x8006, 0
	goto EventScript_1C5391

EventScript_1C5378:: @ 81C5378
	setvar VAR_0x8006, 2
	goto EventScript_1C5391

EventScript_1C5382:: @ 81C5382
	setvar VAR_0x8006, 0
	goto EventScript_1C5391

EventScript_1C538C:: @ 81C538C
	setvar VAR_0x8006, 1
EventScript_1C5391:
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 5
	special sub_815D9E8
	lock
	faceplayer
	msgbox gStringVar4
	release
	return

EventScript_1C53AA:: @ 81C53AA
	lock
	faceplayer
	setvar VAR_0x8004, 7
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C53DA
	case 1, EventScript_1C53E2
	case 2, EventScript_1C5492
EventScript_1C53DA:
	msgbox Text_17CA5A
EventScript_1C53E2:
	setvar VAR_0x8004, 8
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C5410
	case 1, EventScript_1C543A
	case 2, EventScript_1C544F
EventScript_1C5410:
	msgbox Text_17CB09
	textcolor 3
	playfanfare MUS_FANFA1
	message Text_ObtainedTheX
	waitfanfare
	waitmessage
	getstdstring 2, 24
	msgbox gUnknown_81A5218
	call EventScript_1A6675
	goto EventScript_1C544F

EventScript_1C543A:: @ 81C543A
	msgbox Text_17CB09
	msgbox Text_BagIsFull
	goto EventScript_1C544F

EventScript_1C544F:: @ 81C544F
	setvar VAR_0x8004, 9
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_1C547D
	case 1, EventScript_1C548A
	case 2, EventScript_1C5492
EventScript_1C547D:
	msgbox Text_17CB1A
	goto EventScript_1C5492

EventScript_1C548A:: @ 81C548A
	msgbox Text_17CBC0
EventScript_1C5492:
	msgbox Text_17CBF5
	release
	return

EventScript_1C549C:: @ 81C549C
	lockall
	setvar VAR_0x8004, 13
	special sub_815D9E8
	msgbox Text_17CC56
	releaseall
	end

SevenIsland_TrainerTower_2F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_4F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_6F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_8F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_5F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_7F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_3F_EventScript_1C54AF:: @ 81C54AF
SevenIsland_TrainerTower_1F_EventScript_1C54AF:: @ 81C54AF
	goto EventScript_1C508F

SevenIsland_TrainerTower_2F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_4F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_6F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_8F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_5F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_7F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_3F_EventScript_1C54B4:: @ 81C54B4
SevenIsland_TrainerTower_1F_EventScript_1C54B4:: @ 81C54B4
	setvar VAR_0x4003, 0
	setvar VAR_0x8004, 16
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if ne, EventScript_1C5528
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 2, Movement_1A75DB
	waitmovement 0
	applymovement 2, Movement_1A75DD
	goto EventScript_1C551B

SevenIsland_TrainerTower_2F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_4F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_6F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_8F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_5F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_7F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_3F_EventScript_1C54EA:: @ 81C54EA
SevenIsland_TrainerTower_1F_EventScript_1C54EA:: @ 81C54EA
	setvar VAR_0x4003, 1
	setvar VAR_0x8004, 16
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if ne, EventScript_1C5528
	setvar VAR_0x8004, 19
	special sub_815D9E8
	applymovement 5, Movement_1A75DB
	waitmovement 0
	applymovement 5, Movement_1A75DD
EventScript_1C551B:
	waitmovement 0
	setvar VAR_0x400F, 1
	goto EventScript_1C508F

EventScript_1C5528:: @ 81C5528
	lockall
	playse SE_PINPON
	msgbox Text_17CC73
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1C5544
	waitmovement 0
	releaseall
	end

Movement_1C5541:
	step_12
Movement_1C5542:: @ 81C5542
	step_12
	step_12
Movement_1C5544:
	step_12
	step_end

Movement_1C5546:: @ 81C5546
	step_11
	step_11
	step_end

Movement_1C5549:: @ 81C5549
	step_10
	step_10
	step_end

Movement_1C554C:: @ 81C554C
	step_13
Movement_1C554D:
	step_11
	step_00
	step_end

Movement_1C5550:: @ 81C5550
	step_00
	step_end

EventScript_1C5550:: @ 81C5552
	msgbox Text_1C556D, 2
	end

EventScript_1C555B:: @ 81C555B
	msgbox Text_1C558D, 3
	end

EventScript_1C5564:: @ 81C5564
	msgbox Text_1C55A4, 3
	end

Text_1C556D:: @ 81C556D
	.string "テストよう　メッセージです！\n"
	.string "ポケモンの　せかいへ　ようこそ！$"

Text_1C558D:: @ 81C558D
	.string "テストよう　メッセージです！\n"
	.string "かんばん　です$"

Text_1C55A4:: @ 81C55A4
	.string "テストよう　メッセージです！\n"
	.string "ざひょう　チェックの　イベントです$"

	.align 2
Text_1C55C8:: @ 81C55C8
	.string "$"

gText_WouldYouLikeToSaveTheGame:: @ 81C55C9
	.string "Would you like to save the game?$"

gText_AlreadySaveFile_WouldLikeToOverwrite:: @ 81C55EA
	.string "There is already a saved file.\n"
	.string "Is it okay to overwrite it?$"

gText_SavingDontTurnOffThePower:: @ 81C5625
	.string "SAVING…\n"
	.string "DON'T TURN OFF THE POWER.$"

gText_PlayerSavedTheGame:: @ 81C5647
	.string "{PLAYER} saved the game.$"

gUnknown_81C565A::
	.string "セーブに　しっぱい　しました‥$"

gText_DifferentGameFile:: @ 81C566A
	.string "WARNING!\p"
	.string "There is a different game file that\n"
	.string "is already saved.\p"
	.string "If you save now, the other file's\n"
	.string "adventure, including items and\l"
	.string "POKéMON, will be entirely lost.\p"
	.string "Are you sure you want to save now\n"
	.string "and overwrite the other save file?$"

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
	.string "Let's begin with your name.\n"
	.string "What is it?\p$"

gOakText_FinalizePlayerName:: @ 81C5E13
	.string "Right…\n"
	.string "So your name is {PLAYER}.$"

gOakText_IntroduceRival:: @ 81C5E2E
	.string "This is my grandson.\pHe's been your rival since you both\n"
	.string "were babies.\p…Erm, what was his name now?$"

gOakText_AskRivalName:: @ 81C5E91
	.string "Your rival's name, what was it now?$"

gOakText_ConfirmRivalName:: @ 81C5EB5
	.string "…Er, was it {RIVAL}?$"

gOakText_RememberRivalName:: @ 81C5EC5
	.string "That's right! I remember now!\n"
	.string "His name is {RIVAL}!\p$"

gOakText_LegendAboutToUnfold:: @ 81C5EF4
	.string "{PLAYER}!\pYour very own POKéMON legend is\n"
	.string "about to unfold!\pA world of dreams and adventures\n"
	.string "with POKéMON awaits! Let's go!$"

@ pokedude data
gUnknown_81C5F69::
	.string "POKé DUDE: The speedier of the\n"
	.string "battlers gets to attack first.$"

gUnknown_81C5FA7::
	.string "It looks like my RATTATA was\n"
	.string "faster than the PIDGEY.$"

gUnknown_81C5FDC::
	.string "The battlers take turns attacking\n"
	.string "and reducing each other's HP.$"

gUnknown_81C601C::
	.string "My RATTATA reduced the foe's HP\n"
	.string "to zero, so it wins!\p"

	.string "The POKéMON that took part in the\n"
	.string "battle get EXP. Points.\p"

	.string "When a POKéMON collects enough\n"
	.string "EXP. Points, it levels up.\p"

	.string "Leveling up makes your POKéMON\n"
	.string "stronger than before.$"

gUnknown_81C60FA::
	.string "POKé DUDE: Uh-oh…\n"
	.string "My RATTATA has been poisoned…\p"

	.string "If a POKéMON is poisoned, it loses\n"
	.string "HP steadily.$"

gUnknown_81C615A::
	.string "If a POKéMON develops a status\n"
	.string "problem, heal it right away.$"

gUnknown_81C6196::
	.string "Using an item on a POKéMON uses\n"
	.string "up one turn, though.\p"

	.string "Now, it's the opponent's turn!$"

gUnknown_81C61EA::
	.string "Yay!\n"
	.string "We managed to win!$"

gUnknown_81C6202::
	.string "POKé DUDE: The move BUBBLE is\n"
	.string "a WATER-type attack.\p"

	.string "The targeted ODDISH is a\n"
	.string "GRASS/POISON-type POKéMON.\p"

	.string "The WATER-type attack is absorbed\n"
	.string "by the GRASS-type POKéMON…\p"

	.string "As a result, the move becomes not\n"
	.string "very effective, and inflicts only\l"
	.string "half the usual damage.$"

gUnknown_81C6301::
	.string "Uh-oh, this is not good!\p"

	.string "The ABSORB attack you just saw\n"
	.string "is a GRASS-type move.\p"

	.string "POLIWAG is a WATER-type POKéMON.\p"

	.string "So, ABSORB becomes super\n"
	.string "effective, doubling the damage.$"

gUnknown_81C63A9::
	.string "It's not going to be easy to win\n"
	.string "with this matchup…\p"

	.string "Let's try shifting POKéMON!$"

gUnknown_81C63F9::
	.string "Shifting POKéMON in and out uses\n"
	.string "up one turn.\p"

	.string "Now, it's the opponent's turn.$"

gUnknown_81C6446::
	.string "BUTTERFREE is a BUG/FLYING-type\n"
	.string "POKéMON.\p"

	.string "Against this POKéMON, a GRASS-\n"
	.string "type attack…\p"

	.string "…inflicts only half the usual\n"
	.string "damage on a BUG-type POKéMON…\p"

	.string "…And, it also causes only half the\n"
	.string "damage on a FLYING-type POKéMON.\p"

	.string "Therefore, BUTTERFREE, being a\n"
	.string "BUG/FLYING POKéMON, only takes\l"
	.string "one quarter of the usual damage.$"

gUnknown_81C657A::
	.string "ODDISH is a GRASS/POISON-type\n"
	.string "POKéMON.\p"

	.string "A FLYING- or PSYCHIC-type attack\n"
	.string "is super effective against it.\p"

	.string "One of those types of attacks will\n"
	.string "inflict double the usual damage.\p"

	.string "Okay, here we go!$"

gUnknown_81C6637::
	.string "Yeah!\n"
	.string "We won!$"

gUnknown_81C6645::
	.string "POKé DUDE: When you're trying to\n"
	.string "catch a POKéMON, don't throw any\l"
	.string "POKé BALLS right away.\p"

	.string "First, you need to weaken it by\n"
	.string "reducing its HP.$"

gUnknown_81C66CF::
	.string "Okay, that should be good enough.\p"

	.string "But, if it's possible, it would be\n"
	.string "best if the target has a status\l"
	.string "problem.\p"

	.string "For instance, it would be easier\n"
	.string "to catch if it were asleep or\l"
	.string "paralyzed.$"

gUnknown_81C6787::
	.string "This will make the POKéMON a lot\n"
	.string "easier to catch!\p"

	.string "Oh, yes. If you paralyze a\n"
	.string "POKéMON, you can't make it fall\l"
	.string "asleep on top of paralysis.\p"

	.string "In other words, you can't double\n"
	.string "up status problems, okay?$"

gUnknown_81C684B::
	.string "Okay!\n"
	.string "Let me throw my POKé BALL!$"

gUnknown_81C686C::
	.string "Before you throw a POKé BALL,\n"
	.string "consider the condition and the\l"
	.string "type of POKéMON, and pick the kind\l"
	.string "of BALL that would work best.$"
