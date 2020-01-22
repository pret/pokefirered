#include "constants/global.h"
#include "constants/flags.h"
#include "constants/event_objects.h"
#include "constants/event_object_movement.h"
#include "constants/decorations.h"
#include "constants/items.h"
#include "constants/layouts.h"
#include "constants/maps.h"
#include "constants/metatile_labels.h"
#include "constants/pokemon.h"
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
#include "constants/cable_club.h"
#include "constants/field_weather.h"
#include "constants/union_room.h"
#include "constants/trade.h"
#include "constants/quest_log.h"
#include "constants/daycare.h"
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
	.4byte Std_ObtainItem
	.4byte Std_FindItem
	.4byte Std_MsgboxNPC
	.4byte Std_MsgboxSign
	.4byte Std_MsgboxDefault
	.4byte Std_MsgboxYesNo
	.4byte Std_MsgboxAutoclose
	.4byte Std_ObtainDecoration
	.4byte Std_PutItemAway
	.4byte Std_ReceivedItem
gStdScriptsEnd::

	.include "data/maps/BattleColosseum_2P/scripts.inc"
	.include "data/maps/TradeCenter/scripts.inc"
	.include "data/maps/RecordCenter/scripts.inc"
	.include "data/maps/BattleColosseum_4P/scripts.inc"
	.include "data/maps/UnionRoom/scripts.inc"
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
	.include "data/maps/SafariZone_Center_RestHouse/scripts.inc"
	.include "data/maps/SafariZone_East_RestHouse/scripts.inc"
	.include "data/maps/SafariZone_North_RestHouse/scripts.inc"
	.include "data/maps/SafariZone_West_RestHouse/scripts.inc"
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
	.include "data/maps/FuchsiaCity_SafariZone_Office/scripts.inc"
	.include "data/maps/FuchsiaCity_Gym/scripts.inc"
	.include "data/maps/FuchsiaCity_House1/scripts.inc"
	.include "data/maps/FuchsiaCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/FuchsiaCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/FuchsiaCity_WardensHouse/scripts.inc"
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
	.include "data/maps/SafariZone_Center_RestHouse/text.inc"
	.include "data/maps/SafariZone_East_RestHouse/text.inc"
	.include "data/maps/SafariZone_North_RestHouse/text.inc"
	.include "data/maps/SafariZone_West_RestHouse/text.inc"
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
	.include "data/maps/FuchsiaCity_SafariZone_Office/text.inc"
	.include "data/maps/FuchsiaCity_Gym/text.inc"
	.include "data/maps/FuchsiaCity_House1/text.inc"
	.include "data/maps/FuchsiaCity_PokemonCenter_1F/text.inc"
	.include "data/maps/FuchsiaCity_WardensHouse/text.inc"
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
	.include "data/maps/Route5_PokemonDayCare/text.inc"
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

	.include "data/scripts/std_msgbox.inc"
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

Text_AccessWhichPC:: @ 81A508A
	.string "Which PC should be accessed?$"

Text_AccessedSomeonesPC:: @ 81A50A7
	.string "Accessed Someone's PC.$"

Text_OpenedPkmnStorage:: @ 81A50BE
	.string "POKéMON Storage System opened.$"

Text_AccessedPlayersPC:: @ 81A50DD
	.string "Accessed {PLAYER}'s PC.$"

Text_AccessedBillsPC:: @ 81A50EF
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

Text_PleaseComeAgain:: @ 81A5190
	.string "Please come again!$"

@ Unused
Text_HavingDiscountSaleToday:: @ 81A51A3
	.string "Welcome!\p"
	.string "We're having a discount sale today!$"

@ Unused
Text_PlayerWhatCanIDoForYou:: @ 81A51D0
	.string "{PLAYER}{KUN}, welcome!\p"
	.string "What can I do for you?$"

	.include "data/text/obtain_item.inc"

Text_1A5351:: @ 81A5351
	.string "じゅんびちゅうです！$"

Text_WantWhichFloor:: @ 81A535C
	.string "Which floor do you want?$"

Text_BagItemCanBeRegistered:: @ 81A5375
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

Text_PlayerBootedUpPC:: @ 81A5420
	.string "{PLAYER} booted up the PC.$"

Text_1A5435:: @ 81A5435
	.string "つうしんは　キャンセルされました$"

@ Unused
Text_GiveNicknameToReceivedMon:: @ 81A5446
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

Text_WirelessClubUndergoingAdjustments:: @ 81A561A
	.string "I'm terribly sorry.\n"
	.string "The POKéMON WIRELESS CLUB is\l"
	.string "undergoing adjustments now.$"

Text_AppearsToBeUndergoingAdjustments:: @ 81A5667
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

Text_DugUpItemFromGround:: @ 81A5700
	.string "{PLAYER} dug up one {STR_VAR_2}\n"
	.string "from deep in the ground.$"

	.include "data/text/route23.inc"

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

Text_AccessedProfOaksPC:: @ 81A5BC6
	.string "Accessed PROF. OAK's PC…\p"
	.string "Accessed the POKéDEX Rating\n"
	.string "System…$"

Text_HavePokedexRated:: @ 81A5C03
	.string "Would you like to have your\n"
	.string "POKéDEX rated?$"

Text_ClosedLinkToProfOaksPC:: @ 81A5C2E
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

	.include "data/text/poke_mart.inc"

Text_MonFlewAway:: @ 81A63C4
	.string "The {STR_VAR_1} flew away!$"

Text_1A63D6:: @ 81A63D6
	.string "ベッドが　ある‥‥\n"
	.string "やすんでいこう$"

Text_FoundTMHMContainsMove:: @ 81A63E8
	.string "{PLAYER} found a {STR_VAR_2}!\n"
	.string "It contains {STR_VAR_1}.$"

Text_1A6407:: @ 81A6407
	.string "おつかれさん！\n"
	.string "どこに　いきたいんだ？$"

Text_1A641B:: @ 81A641B
	.string "All right!\n"
	.string "All aboard SEAGALLOP HI-SPEED {STR_VAR_1}!$"

@ Call for legendary bird trio
Text_Gyaoo:: @ 81A6448
	.string "Gyaoo!$"

Text_MoveCanOnlyBeLearnedOnce:: @ 81A644F
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
	call EventScript_ResetEliteFour
	special Special_UpdateTrainerFanClubGameClear
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	compare VAR_RESULT, FALSE
	call_if_eq EventScript_1A653B
	call EventScript_ResetLegendaries
	return

EventScript_1A653B:: @ 81A653B
	setvar VAR_MAP_SCENE_PALLET_TOWN_OAK, 2
	return

EventScript_ResetLegendaries:: @ 81A6541
	clearflag FLAG_LUGIA_FLEW_AWAY
	clearflag FLAG_HO_OH_FLEW_AWAY
	clearflag FLAG_DEOXYS_FLEW_AWAY
	return

gUnknown_81A654B:: @ 81A654B
	call EventScript_ResetEliteFour
	end

EventScript_ResetEliteFour:: @ 81A6551
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
	.include "data/scripts/obtain_item.inc"
	.include "data/scripts/pc.inc"

@ DoEasyChatScreen?
EventScript_1A6AC0:: @ 81A6AC0
	fadescreen FADE_TO_BLACK
	special sub_80FEE44
	fadescreen FADE_FROM_BLACK
	return

	.include "data/scripts/surf.inc"
	.include "data/scripts/set_gym_trainers.inc"
	.include "data/scripts/bag_full.inc"

@ Unused
EventScript_GymBadgeFanfare:: @ 81A6C21
	playfanfare MUS_ME_BACHI
	waitfanfare
	return

EventScript_OutOfCenterPartyHeal:: @ 81A6C26
	fadescreen FADE_TO_BLACK
	playfanfare MUS_ME_ASA
	waitfanfare
	special HealPlayerParty
	fadescreen FADE_FROM_BLACK
	return

EventScript_WallTownMap:: @ 81A6C32
	lockall
	msgbox Text_ATownMap
	goto_if_questlog EventScript_ReleaseEnd
	fadescreen FADE_TO_BLACK
	special Special_TownMap
	waitstate
	releaseall
	end

	.include "data/text/pokedex_rating.inc"
	.include "data/scripts/pokedex_rating.inc"

EventScript_1A7493:: @ 81A7493
	lockall
	setvar VAR_TEMP_1, 1
	goto EventScript_1A74B7
	end

EventScript_1A749F:: @ 81A749F
	lockall
	setvar VAR_TEMP_2, 1
	goto EventScript_1A74B7
	end

EventScript_1A74AB:: @ 81A74AB
	lockall
	setvar VAR_TEMP_3, 1
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
	setvar VAR_TEMP_1, 1
	setvar VAR_TEMP_2, 1
	setvar VAR_TEMP_3, 1
	setvar VAR_TEMP_4, 1
	setvar VAR_TEMP_5, 1
	return

EventScript_ChangePokemonNickname:: @ 81A74EB
	fadescreen FADE_TO_BLACK
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
	applymovement OBJ_EVENT_ID_PLAYER, Movement_Delay32
	waitmovement 0
	playse SE_DOOR
	call EventScript_1A7538
	special DrawWholeMapView
	setflag FLAG_TEMP_4
	return

EventScript_1A751F:: @ 81A751F
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkUp5
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
	applymovement OBJ_EVENT_ID_PLAYER, Movement_Delay32
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
	walk_up
	step_end

EventScript_1A75D5:: @ 81A75D5
	special Special_PokemonLeagueLightingEffect
	return

	.include "data/scripts/movement.inc"	
	.include "data/scripts/flavor_text.inc"

gUnknown_81A7702:: @ 81A7702
	lockall
	textcolor 3
	msgbox Text_FillOutQuestionnaire, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A778A
	setvar VAR_0x8004, 14
	call EventScript_1A6AC0
	lock
	faceplayer
	specialvar VAR_0x8008, Special_GetMartClerkObjectId
	textcolor 0
	compare VAR_0x8004, 0
	goto_if_eq EventScript_1A774D
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A778A
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1A778C
	end

EventScript_1A774D:: @ 81A774D
	applymovement VAR_0x8008, Movement_FaceDown
	waitmovement 0
	playse SE_PIN
	applymovement VAR_0x8008, Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_0x8008, Movement_Delay48
	waitmovement 0
	msgbox Text_YouKnowThoseWords
	setflag FLAG_SYS_MYSTERY_GIFT_ENABLED
	textcolor 3
	special sub_80699BC
	signmsg
	msgbox Text_YouCanAccessMysteryGift
	normalmsg
	releaseall
	end

EventScript_1A778A:: @ 81A778A
	releaseall
	end

EventScript_1A778C:: @ 81A778C
	applymovement VAR_0x8008, Movement_FaceDown
	waitmovement 0
	msgbox Text_QuestionnaireThankYou
	releaseall
	end

EventScript_BagItemCanBeRegistered:: @ 81A77A0
	msgbox Text_BagItemCanBeRegistered, MSGBOX_SIGN
	end

EventScript_Return:: @ 81A77A9
	return

EventScript_SetResultTrue:: @ 81A77AA
	setvar VAR_RESULT, TRUE
	return

EventScript_SetResultFalse:: @ 81A77B0
	setvar VAR_RESULT, FALSE
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

	.include "data/scripts/route23.inc"

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

EventScript_ReleaseEnd:: @ 81A7AE0
	release
	end

	.include "data/scripts/pokemon_mansion.inc"

EventScript_1A80FE:: @ 81A80FE
	lockall
	applymovement VAR_0x8004, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 20
	releaseall
	end

	.include "data/scripts/silphco_doors.inc"

EventScript_1A8C27:: @ 81A8C27
	getpartysize
	subvar VAR_RESULT, 1
	copyvar VAR_0x8004, VAR_RESULT
	return

EventScript_1A8C33:: @ 81A8C33
	fadescreen FADE_TO_BLACK
	special ChangeBoxPokemonNickname
	waitstate
	lock
	faceplayer
	return

EventScript_1A8C3C:: @ 81A8C3C
	bufferboxname 0, VAR_PC_BOX_TO_SEND_MON
	getspeciesname 1, VAR_TEMP_1
	call_if_unset FLAG_SYS_NOT_SOMEONES_PC, EventScript_1A8C57
	call_if_set FLAG_SYS_NOT_SOMEONES_PC, EventScript_1A8C82
	return

EventScript_1A8C57:: @ 81A8C57
	specialvar VAR_RESULT, ShouldShowBoxWasFullMessage
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1A8C70
	msgbox Text_1A5CF1
	return

EventScript_1A8C70:: @ 81A8C70
	specialvar VAR_RESULT, GetPCBoxToSendMon
	bufferboxname 2, VAR_RESULT
	msgbox Text_1A5D6E
	return

EventScript_1A8C82:: @ 81A8C82
	specialvar VAR_RESULT, ShouldShowBoxWasFullMessage
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1A8C9B
	msgbox Text_1A5D31
	return

EventScript_1A8C9B:: @ 81A8C9B
	specialvar VAR_RESULT, GetPCBoxToSendMon
	bufferboxname 2, VAR_RESULT
	msgbox Text_1A5DB1
	return

EventScript_GetInGameTradeSpeciesInfo:: @ 81A8CAD
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	return

EventScript_ChooseMonForInGameTrade:: @ 81A8CBD
	special Special_ChooseMonFromParty
	waitstate
	lock
	faceplayer
	copyvar VAR_0x800A, VAR_0x8004
	return

EventScript_GetInGameTradeSpecies:: @ 81A8CC9
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	return

EventScript_DoInGameTrade:: @ 81A8CD9
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

Common_EventScript_UnionRoomAttendant:: @ 81A8CF6
	call CableClub_EventScript_UnionRoomAttendant
	end

Common_EventScript_WirelessClubAttendant:: @ 81A8CFC
	call CableClub_EventScript_WirelessClubAttendant
	end

Common_EventScript_DirectCornerAttendant:: @ 81A8D02
	call CableClub_EventScript_DirectCornerAttendant
	end

VermilionCity_PokemonCenter_1F_EventScript_1A8D08:: @ 81A8D08
	lock
	faceplayer
	goto_if_set FLAG_GOT_VS_SEEKER, EventScript_1A8D3F
	msgbox Text_194234
	setflag FLAG_GOT_VS_SEEKER
	giveitem ITEM_VS_SEEKER
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_BagIsFull
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
	call EventScript_TryPickUpHiddenItem
	compare VAR_0x8007, TRUE
	goto_if_eq EventScript_DigUpItemPutInPocket
	compare VAR_0x8007, FALSE
	goto_if_eq EventScript_DigUpItemBagIsFull
	end

EventScript_DigUpItemPutInPocket::
	message Text_DugUpItemFromGround
	waitfanfare
	waitmessage
	delay 60
	msgbox Text_PutItemAway
	special Special_SetHiddenItemFlag
	releaseall
	end

EventScript_DigUpItemBagIsFull::
	msgbox Text_DugUpItemFromGround
	msgbox Text_TooBadBagFull
	setvar VAR_RESULT, 0
	releaseall
	end

EventScript_AfterWhiteOutHeal:: @ 81A8D97
	lockall
	textcolor 1
	msgbox Text_1A5E89
	call EventScript_PkmnCenterNurse_TakeAndHealPkmn
	call_if_unset FLAG_DEFEATED_BROCK, EventScript_1A8DC6
	call_if_set FLAG_DEFEATED_BROCK, EventScript_1A8DCF
	applymovement VAR_LAST_TALKED, Movement_Bow
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
	applymovement 1, Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox Text_1A5FDF
	call EventScript_OutOfCenterPartyHeal
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
	goto_if_eq EventScript_1A8E11
	releaseall
	end

EventScript_1A8E11:: @ 81A8E11
	checkmoney 1, 0
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1A8E2E
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1A8E3C
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
	fadescreen FADE_TO_BLACK
	special sp0C8_whiteout_maybe
	waitstate
	end

Std_PutItemAway:: @ 81A8E58
	bufferitemnameplural 1, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_1A8E6F
	msgbox Text_PutItemAway
	return

EventScript_1A8E6F:: @ 81A8E6F
	switch VAR_RESULT
	case POCKET_ITEMS, EventScript_1A8EAC
	case POCKET_KEY_ITEMS, EventScript_1A8EB1
	case POCKET_POKE_BALLS, EventScript_1A8EB6
	case POCKET_TM_CASE, EventScript_1A8EBB
	case POCKET_BERRY_POUCH, EventScript_1A8EC0
	end

EventScript_1A8EAC:: @ 81A8EAC
	getstdstring 2, STDSTRING_ITEMS_POCKET
	return

EventScript_1A8EB1:: @ 81A8EB1
	getstdstring 2, STDSTRING_KEY_ITEMS_POCKET
	return

EventScript_1A8EB6:: @ 81A8EB6
	getstdstring 2, STDSTRING_POKEBALLS_POCKET
	return

EventScript_1A8EBB:: @ 81A8EBB
	getstdstring 2, STDSTRING_TM_CASE
	return

EventScript_1A8EC0:: @ 81A8EC0
	getstdstring 2, STDSTRING_BERRY_POUCH
	return

	.include "data/scripts/seagallop.inc"
	.include "data/scripts/static_pokemon.inc"

EventScript_1A925E:: @ 81A925E
	goto_if_set FLAG_SYS_UNLOCKED_TANOBY_RUINS, EventScript_Return
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

	.include "data/text/braille.inc"
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
	msgbox gUnknown_81B1D7D, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1B2926
	checkmoney 50, 0
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_1B292B
	playse SE_SHOP
	removemoney 50, 0
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
	goto_if_unset FLAG_MET_STICKER_LADY, EventScript_1B2951
	goto_if_set FLAG_MET_STICKER_LADY, EventScript_1B2994
	end

EventScript_1B2951:: @ 81B2951
	setflag FLAG_MET_STICKER_LADY
	msgbox gUnknown_81B1EB3
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	playse SE_PIN
	applymovement 1, Movement_ExclamationMark
	waitmovement 0
	applymovement 1, Movement_Delay48
	waitmovement 0
	compare VAR_0x8008, 0
	goto_if_eq EventScript_1B2B8E
	message gUnknown_81B1EF8
	waitmessage
	goto EventScript_1B29D0

EventScript_1B2993:: @ 81B2993
	end

EventScript_1B2994:: @ 81B2994
	applymovement 1, Movement_FacePlayer
	waitmovement 0
	goto_if_questlog EventScript_ReleaseEnd
	special sub_8112364
	compare VAR_0x8008, 0
	goto_if_eq EventScript_1B29C6
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
	goto_if_le EventScript_1B2BC5
	compare VAR_0x8004, 99
	goto_if_le EventScript_1B2BE3
	compare VAR_0x8004, 199
	goto_if_le EventScript_1B2C01
	compare VAR_0x8004, 200
	goto_if_ge EventScript_1B2C1F
	end

EventScript_1B2BC5:: @ 81B2BC5
	compare VAR_HOF_BRAG_STATE, 1
	goto_if_eq EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 1
	msgbox gUnknown_81B206E
	goto EventScript_1B2C51

EventScript_1B2BE2:: @ 81B2BE2
	end

EventScript_1B2BE3:: @ 81B2BE3
	compare VAR_HOF_BRAG_STATE, 2
	goto_if_eq EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 2
	msgbox gUnknown_81B20CF
	goto EventScript_1B2C51

EventScript_1B2C00:: @ 81B2C00
	end

EventScript_1B2C01:: @ 81B2C01
	compare VAR_HOF_BRAG_STATE, 3
	goto_if_eq EventScript_1B2C3D
	setvar VAR_HOF_BRAG_STATE, 3
	msgbox gUnknown_81B2133
	goto EventScript_1B2C51

EventScript_1B2C1E:: @ 81B2C1E
	end

EventScript_1B2C1F:: @ 81B2C1F
	compare VAR_HOF_BRAG_STATE, 4
	goto_if_eq EventScript_1B2C47
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
	goto_if_le EventScript_1B2C8F
	compare VAR_0x8005, 199
	goto_if_le EventScript_1B2CAD
	compare VAR_0x8005, 299
	goto_if_le EventScript_1B2CCB
	compare VAR_0x8005, 300
	goto_if_ge EventScript_1B2CE9
	end

EventScript_1B2C8F:: @ 81B2C8F
	compare VAR_EGG_BRAG_STATE, 1
	goto_if_eq EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 1
	msgbox gUnknown_81B2308
	goto EventScript_1B2D1B

EventScript_1B2CAC:: @ 81B2CAC
	end

EventScript_1B2CAD:: @ 81B2CAD
	compare VAR_EGG_BRAG_STATE, 2
	goto_if_eq EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 2
	msgbox gUnknown_81B2372
	goto EventScript_1B2D1B

EventScript_1B2CCA:: @ 81B2CCA
	end

EventScript_1B2CCB:: @ 81B2CCB
	compare VAR_EGG_BRAG_STATE, 3
	goto_if_eq EventScript_1B2D07
	setvar VAR_EGG_BRAG_STATE, 3
	msgbox gUnknown_81B23E0
	goto EventScript_1B2D1B

EventScript_1B2CE8:: @ 81B2CE8
	end

EventScript_1B2CE9:: @ 81B2CE9
	compare VAR_EGG_BRAG_STATE, 4
	goto_if_eq EventScript_1B2D11
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
	goto_if_le EventScript_1B2D59
	compare VAR_0x8006, 49
	goto_if_le EventScript_1B2D77
	compare VAR_0x8006, 99
	goto_if_le EventScript_1B2D95
	compare VAR_0x8006, 100
	goto_if_ge EventScript_1B2DB3
	end

EventScript_1B2D59:: @ 81B2D59
	compare VAR_LINK_WIN_BRAG_STATE, 1
	goto_if_eq EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 1
	msgbox gUnknown_81B25A7
	goto EventScript_1B2DE5

EventScript_1B2D76:: @ 81B2D76
	end

EventScript_1B2D77:: @ 81B2D77
	compare VAR_LINK_WIN_BRAG_STATE, 2
	goto_if_eq EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 2
	msgbox gUnknown_81B2609
	goto EventScript_1B2DE5

EventScript_1B2D94:: @ 81B2D94
	end

EventScript_1B2D95:: @ 81B2D95
	compare VAR_LINK_WIN_BRAG_STATE, 3
	goto_if_eq EventScript_1B2DD1
	setvar VAR_LINK_WIN_BRAG_STATE, 3
	msgbox gUnknown_81B267B
	goto EventScript_1B2DE5

EventScript_1B2DB2:: @ 81B2DB2
	end

EventScript_1B2DB3:: @ 81B2DB3
	compare VAR_LINK_WIN_BRAG_STATE, 4
	goto_if_eq EventScript_1B2DDB
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
	.include "data/scripts/cable_club.inc"
	.include "data/scripts/field_moves.inc"
	.include "data/scripts/item_ball_scripts.inc"
	.include "data/scripts/mystery_event_club.inc"
	.include "data/scripts/day_care.inc"
	.include "data/text/day_care.inc"
	.include "data/scripts/flash.inc"
	.include "data/scripts/repel.inc"
	.include "data/scripts/safari_zone.inc"
	.include "data/text/safari_zone.inc"
	.include "data/text/competitive_brothers.inc"
	.include "data/text/eon_ticket.inc"
	.include "data/text/berries.inc"
	.include "data/text/flavor_text.inc"
	.include "data/scripts/hole.inc"
	.include "data/text/trainers.inc"
	.include "data/scripts/move_tutors.inc"
	.include "data/scripts/trainer_tower.inc"
	.include "data/scripts/test.inc"
	.include "data/text/save.inc"
	.include "data/text/new_game_intro.inc"
	.include "data/text/poke_dude.inc"
