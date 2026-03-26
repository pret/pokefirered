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
#include "constants/sound.h"
#include "constants/species.h"
#include "constants/vars.h"
#include "constants/battle.h"
#include "constants/heal_locations.h"
#include "constants/field_effects.h"
#include "constants/trainers.h"
#include "constants/trainer_tower.h"
#include "constants/fame_checker.h"
#include "constants/seagallop.h"
#include "constants/game_stat.h"
#include "constants/coins.h"
#include "constants/menu.h"
#include "constants/battle_setup.h"
#include "constants/map_scripts.h"
#include "constants/cable_club.h"
#include "constants/field_tasks.h"
#include "constants/field_weather.h"
#include "constants/weather.h"
#include "constants/union_room.h"
#include "constants/trade.h"
#include "constants/quest_log.h"
#include "constants/daycare.h"
#include "constants/easy_chat.h"
#include "constants/trainer_card.h"
#include "constants/help_system.h"
#include "constants/trainer_fan_club.h"
#include "constants/mystery_gift.h"
	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
	.set FALSE, 0
	.set TRUE,  1

	.section script_data, "aw", %progbits

	.include "data/script_cmd_table.inc"

	.align 2
gSpecialVars::
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
	.4byte gSpecialVar_0x8014

	.include "data/specials.inc"

	.align 2
gStdScripts::
	.4byte Std_ObtainItem           @ STD_OBTAIN_ITEM
	.4byte Std_FindItem             @ STD_FIND_ITEM
	.4byte Std_MsgboxNPC            @ MSGBOX_NPC
	.4byte Std_MsgboxSign           @ MSGBOX_SIGN
	.4byte Std_MsgboxDefault        @ MSGBOX_DEFAULT
	.4byte Std_MsgboxYesNo          @ MSGBOX_YESNO
	.4byte Std_MsgboxAutoclose      @ MSGBOX_AUTOCLOSE
	.4byte Std_ObtainDecoration     @ STD_OBTAIN_DECORATION
	.4byte Std_PutItemAway          @ STD_PUT_ITEM_AWAY
	.4byte Std_ReceivedItem         @ STD_RECEIVED_ITEM
gStdScriptsEnd::

	.include "data/maps/BattleColosseum_2P/scripts.inc"
	.include "data/maps/TradeCenter/scripts.inc"
	.include "data/maps/RecordCorner/scripts.inc"
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
	.include "data/maps/TrainerTower_1F/scripts.inc"
	.include "data/maps/TrainerTower_2F/scripts.inc"
	.include "data/maps/TrainerTower_3F/scripts.inc"
	.include "data/maps/TrainerTower_4F/scripts.inc"
	.include "data/maps/TrainerTower_5F/scripts.inc"
	.include "data/maps/TrainerTower_6F/scripts.inc"
	.include "data/maps/TrainerTower_7F/scripts.inc"
	.include "data/maps/TrainerTower_8F/scripts.inc"
	.include "data/maps/TrainerTower_Roof/scripts.inc"
	.include "data/maps/TrainerTower_Lobby/scripts.inc"
	.include "data/maps/TrainerTower_Elevator/scripts.inc"
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
	.include "data/maps/SaffronCity_Connection/scripts.inc"
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
	.include "data/maps/Prototype_SeviiIsle_6/scripts.inc"
	.include "data/maps/Prototype_SeviiIsle_7/scripts.inc"
	.include "data/maps/Prototype_SeviiIsle_8/scripts.inc"
	.include "data/maps/Prototype_SeviiIsle_9/scripts.inc"
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
	.include "data/maps/PalletTown_RivalsHouse/scripts.inc"
	.include "data/maps/PalletTown_ProfessorOaksLab/scripts.inc"
	.include "data/maps/ViridianCity_House/scripts.inc"
	.include "data/maps/ViridianCity_Gym/scripts.inc"
	.include "data/maps/ViridianCity_School/scripts.inc"
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
	.include "data/maps/SaffronCity_CopycatsHouse_1F/scripts.inc"
	.include "data/maps/SaffronCity_CopycatsHouse_2F/scripts.inc"
	.include "data/maps/SaffronCity_Dojo/scripts.inc"
	.include "data/maps/SaffronCity_Gym/scripts.inc"
	.include "data/maps/SaffronCity_House/scripts.inc"
	.include "data/maps/SaffronCity_Mart/scripts.inc"
	.include "data/maps/SaffronCity_PokemonCenter_1F/scripts.inc"
	.include "data/maps/SaffronCity_PokemonCenter_2F/scripts.inc"
	.include "data/maps/SaffronCity_MrPsychicsHouse/scripts.inc"
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
	.include "data/maps/Route6_UnusedHouse/scripts.inc"
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
	.include "data/maps/Route19_UnusedHouse/scripts.inc"
	.include "data/maps/Route22_NorthEntrance/scripts.inc"
	.include "data/maps/Route23_UnusedHouse/scripts.inc"
	.include "data/maps/Route25_SeaCottage/scripts.inc"
	.include "data/maps/SevenIsland_House_Room1/scripts.inc"
	.include "data/maps/SevenIsland_House_Room2/scripts.inc"
	.include "data/maps/SevenIsland_Mart/scripts.inc"
	.include "data/maps/SevenIsland_PokemonCenter_1F/scripts.inc"
	.include "data/maps/SevenIsland_PokemonCenter_2F/scripts.inc"
	.include "data/maps/SevenIsland_UnusedHouse/scripts.inc"
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
	.include "data/maps/TrainerTower_Lobby/text.inc"
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
	.include "data/maps/Route21_North/text.inc"
	.include "data/maps/Route21_South/text.inc"
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
	.include "data/maps/SevenIsland_TanobyRuins/text.inc"
	.include "data/maps/PalletTown_PlayersHouse_1F/text.inc"
	.include "data/maps/PalletTown_PlayersHouse_2F/text.inc"
	.include "data/maps/PalletTown_RivalsHouse/text.inc"
	.include "data/maps/PalletTown_ProfessorOaksLab/text.inc"
	.include "data/maps/ViridianCity_House/text.inc"
	.include "data/maps/ViridianCity_Gym/text.inc"
	.include "data/maps/ViridianCity_School/text.inc"
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
	.include "data/maps/VermilionCity_House2/text.inc"
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
	.include "data/maps/SaffronCity_CopycatsHouse_1F/text.inc"
	.include "data/maps/SaffronCity_CopycatsHouse_2F/text.inc"
	.include "data/maps/SaffronCity_Dojo/text.inc"
	.include "data/maps/SaffronCity_Gym/text.inc"
	.include "data/maps/SaffronCity_House/text.inc"
	.include "data/maps/SaffronCity_Mart/text.inc"
	.include "data/maps/SaffronCity_PokemonCenter_1F/text.inc"
	.include "data/maps/SaffronCity_MrPsychicsHouse/text.inc"
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
	.include "data/maps/TwoIsland_CapeBrink_House/text.inc"
	.include "data/maps/SixIsland_WaterPath_House1/text.inc"
	.include "data/maps/SixIsland_WaterPath_House2/text.inc"
	.include "data/maps/SevenIsland_SevaultCanyon_House/text.inc"

	.include "data/scripts/std_msgbox.inc"
	.include "data/scripts/trainer_battle.inc"

@ Unused
Text_WouldYouLikeToMixRecords::
	.string "Would you like to mix records with\n"
	.string "other TRAINERS?$"

@ Unused
Text_WeHopeToSeeYouAgain2::
	.string "We hope to see you again!$"

	.include "data/text/pc.inc"

@ Unused
Text_WelcomeTradeCenter::
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "TRADE CENTER.$"

@ Unused
Text_WelcomeColosseum::
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "COLOSSEUM.$"

@ Unused
Text_WelcomeTimeCapsule::
	.string "Welcome to the POKéMON CABLE CLUB\n"
	.string "TIME CAPSULE.$"

Text_PleaseComeAgain::
	.string "Please come again!$"

@ Unused
Text_HavingDiscountSaleToday::
	.string "Welcome!\p"
	.string "We're having a discount sale today!$"

@ Unused
Text_PlayerWhatCanIDoForYou::
	.string "{PLAYER}{KUN}, welcome!\p"
	.string "What can I do for you?$"

	.include "data/text/obtain_item.inc"

Text_MakingPreparations::
	.string "じゅんびちゅうです！$"

Text_WantWhichFloor::
	.string "Which floor do you want?$"

Text_BagItemCanBeRegistered::
	.string "An item in the BAG can be\n"
	.string "registered to SELECT for easy use.$"

@ Unused (email from R/S Rivals computer)
Text_TrainerSchoolEmail::
	.string "パソコンに\n"
	.string "ポケモン　トレーナー　こうざの\l"
	.string "メールが　きている！\p"
	.string "‥‥　‥‥　‥‥\p"
	.string "ポケモンが　おぼえられる　わざは　4つ！\p"
	.string "どんな　わざを　おぼえさせるかで\n"
	.string "トレーナーの　じつりょくが　とわれます！\p"
	.string "‥‥　‥‥　‥‥$"

Text_PlayerBootedUpPC::
	.string "{PLAYER} booted up the PC.$"

@ Unused
Text_LinkWasCanceled::
	.string "つうしんは　キャンセルされました$"

@ Unused
Text_GiveNicknameToReceivedMon::
	.string "Want to give a nickname to the\n"
	.string "{STR_VAR_2} you received?$"

gText_PkmnFainted3::
	.string "{STR_VAR_1} fainted…\p"
	.string "$"

Text_WelcomeWantToHealPkmn::
	.string "Welcome to our POKéMON CENTER!\p"
	.string "Would you like me to heal your\n"
	.string "POKéMON back to perfect health?$"

Text_TakeYourPkmnForFewSeconds::
	.string "Okay, I'll take your POKéMON for a\n"
	.string "few seconds.$"

Text_WeHopeToSeeYouAgain::
	.string "We hope to see you again!$"

Text_RestoredPkmnToFullHealth::
	.string "Thank you for waiting.\n"
	.string "We've restored your POKéMON to\l"
	.string "full health.$"

	.include "data/text/surf.inc"

@ Unused, from R/S
Text_DoorOpenedFarAway::
	.string "どこか　とおくの　とびらが\n"
	.string "ひらいたような　おとだ‥‥$"

@ Unused, from R/S
Text_BigHoleInTheWall::
	.string "かべに\n"
	.string "おおきな　あなが　あいている！$"

Text_WirelessClubUndergoingAdjustments::
	.string "I'm terribly sorry.\n"
	.string "The POKéMON WIRELESS CLUB is\l"
	.string "undergoing adjustments now.$"

Text_AppearsToBeUndergoingAdjustments::
	.string "It appears to be undergoing\n"
	.string "adjustments…$"

Text_HandedOverItem::
	.string "{PLAYER} handed over the\n"
	.string "{STR_VAR_1}.$"

Text_GiveNicknameToThisMon::
	.string "Do you want to give a nickname to\n"
	.string "this {STR_VAR_1}?$"

	.include "data/text/itemfinder.inc"
	.include "data/text/route23.inc"
	.include "data/text/aide.inc"
	.include "data/text/ingame_trade.inc"

Text_CardKeyOpenedDoor::
	.string "Bingo!\n"
	.string "The CARD KEY opened the door!$"

Text_ItNeedsCardKey::
	.string "No!\n"
	.string "It needs a CARD KEY!$"

Text_AccessedProfOaksPC::
	.string "Accessed PROF. OAK's PC…\p"
	.string "Accessed the POKéDEX Rating\n"
	.string "System…$"

Text_HavePokedexRated::
	.string "Would you like to have your\n"
	.string "POKéDEX rated?$"

Text_ClosedLinkToProfOaksPC::
	.string "Closed link to PROF. OAK's PC.$"

Text_VoiceRangOutDontRunAway::
	.string "Someone's voice rang out,\n"
	.string "“Don't run away!”$"

@ Uncear what the below unused JP texts were for
Text_IdLikeToSeeRequest::
	.string "えっとー\n"
	.string "{STR_VAR_2}が　みてみたいなー\p"
	.string "それも　{STR_VAR_1}{STR_VAR_3}\n"
	.string "{STR_VAR_2}が　みてみたいなー$"

Text_ThankYouForShowingMe::
	.string "わぁー　すごい！\n"
	.string "{STR_VAR_1}{STR_VAR_3}{STR_VAR_2}だー！\p"
	.string "ありがとー\n"
	.string "また　よろしくねー！$"

Text_ThatsNotRight::
	.string "それっ　ちがうよー！$"

Text_ISee::
	.string "そっか‥$"

Text_TheDoorIsClosed::
	.string "ドアは　しまっている‥$"

Text_TheDoorIsOpen::
	.string "The door is open…$"

	.include "data/text/pc_transfer.inc"
	.include "data/text/white_out.inc"
	.include "data/text/poke_mart.inc"

Text_MonFlewAway::
	.string "The {STR_VAR_1} flew away!$"

Text_TheresBedLetsRest::
	.string "ベッドが　ある‥‥\n"
	.string "やすんでいこう$"

Text_FoundTMHMContainsMove::
	.string "{PLAYER} found a {STR_VAR_2}!\n"
	.string "It contains {STR_VAR_1}.$"

	.include "data/text/seagallop.inc"

@ Call for legendary bird trio
Text_Gyaoo::
	.string "Gyaoo!$"

Text_MoveCanOnlyBeLearnedOnce::
	.string "This move can be learned only\n"
	.string "once. Is that okay?$"

EventScript_ResetAllMapFlags::
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

	.include "data/scripts/hall_of_fame.inc"
	.include "data/scripts/pkmn_center_nurse.inc"
	.include "data/scripts/obtain_item.inc"
	.include "data/scripts/pc.inc"

Common_ShowEasyChatScreen::
	fadescreen FADE_TO_BLACK
	special ShowEasyChatScreen
	fadescreen FADE_FROM_BLACK
	return

	.include "data/scripts/surf.inc"
	.include "data/scripts/set_gym_trainers.inc"
	.include "data/scripts/bag_full.inc"

@ Unused
EventScript_GymBadgeFanfare::
	playfanfare MUS_OBTAIN_BADGE
	waitfanfare
	return

EventScript_OutOfCenterPartyHeal::
	fadescreen FADE_TO_BLACK
	playfanfare MUS_HEAL
	waitfanfare
	special HealPlayerParty
	fadescreen FADE_FROM_BLACK
	return

EventScript_WallTownMap::
	lockall
	msgbox Text_ATownMap
	goto_if_questlog EventScript_ReleaseEnd
	fadescreen FADE_TO_BLACK
	special ShowTownMap
	waitstate
	releaseall
	end

	.include "data/text/pokedex_rating.inc"
	.include "data/scripts/pokedex_rating.inc"
	.include "data/scripts/cave_of_origin.inc"

EventScript_ChangePokemonNickname::
	fadescreen FADE_TO_BLACK
	special ChangePokemonNickname
	waitstate
	return

@ Unused
EventScript_HandOverItem::
	bufferitemname STR_VAR_1, VAR_0x8004
	playfanfare MUS_OBTAIN_TMHM
	message Text_HandedOverItem
	waitmessage
	waitfanfare
	removeitem VAR_0x8004
	return

	.include "data/scripts/pokemon_league.inc"
	.include "data/scripts/movement.inc"	
	.include "data/scripts/flavor_text.inc"
	.include "data/scripts/questionnaire.inc"

EventScript_BagItemCanBeRegistered::
	msgbox Text_BagItemCanBeRegistered, MSGBOX_SIGN
	end

EventScript_Return::
	return

EventScript_SetResultTrue::
	setvar VAR_RESULT, TRUE
	return

EventScript_SetResultFalse::
	setvar VAR_RESULT, FALSE
	return

EventScript_SetExitingCyclingRoad::
	lockall
	clearflag FLAG_SYS_ON_CYCLING_ROAD
	setvar VAR_MAP_SCENE_ROUTE16, 0
	releaseall
	end

EventScript_SetEnteringCyclingRoad::
	lockall
	setvar VAR_MAP_SCENE_ROUTE16, 1
	releaseall
	end

	.include "data/scripts/route23.inc"

EventScript_GetElevatorFloor::
	special GetElevatorFloor
	return

	.include "data/scripts/aide.inc"

EventScript_CancelMessageBox::
	special DoPicboxCancel
	release
	end

EventScript_ReleaseEnd::
	release
	end

	.include "data/scripts/pokemon_mansion.inc"

@ Unused
EventScript_DelayedLookAround::
	lockall
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFasterLeft
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	delay 20
	applymovement VAR_0x8004, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	delay 20
	releaseall
	end

	.include "data/scripts/silphco_doors.inc"
	.include "data/scripts/pc_transfer.inc"

EventScript_GetInGameTradeSpeciesInfo::
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	return

EventScript_ChooseMonForInGameTrade::
	special ChoosePartyMon
	waitstate
	lock
	faceplayer
	copyvar VAR_0x800A, VAR_0x8004
	return

EventScript_GetInGameTradeSpecies::
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	return

EventScript_DoInGameTrade::
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	lock
	faceplayer
	return

EventScript_VsSeekerChargingDone::
	special VsSeekerFreezeObjectsAfterChargeComplete
	waitstate
	special VsSeekerResetObjectMovementAfterChargeComplete
	releaseall
	end

Common_EventScript_UnionRoomAttendant::
	call CableClub_EventScript_UnionRoomAttendant
	end

Common_EventScript_WirelessClubAttendant::
	call CableClub_EventScript_WirelessClubAttendant
	end

Common_EventScript_DirectCornerAttendant::
	call CableClub_EventScript_DirectCornerAttendant
	end

VermilionCity_PokemonCenter_1F_EventScript_VSSeekerWoman::
	lock
	faceplayer
	goto_if_set FLAG_GOT_VS_SEEKER, VermilionCity_PokemonCenter_1F_EventScript_ExplainVSSeeker
	msgbox VermilionCity_PokemonCenter_1F_Text_UrgeToBattleSomeoneAgain
	setflag FLAG_GOT_VS_SEEKER
	giveitem ITEM_VS_SEEKER
	goto_if_eq VAR_RESULT, FALSE, EventScript_BagIsFull
	msgbox VermilionCity_PokemonCenter_1F_Text_UseDeviceForRematches
	release
	end

VermilionCity_PokemonCenter_1F_EventScript_ExplainVSSeeker::
	msgbox VermilionCity_PokemonCenter_1F_Text_ExplainVSSeeker
	release
	end

	.include "data/scripts/itemfinder.inc"
	.include "data/scripts/white_out.inc"

Std_PutItemAway::
	bufferitemnameplural STR_VAR_2, VAR_0x8000, VAR_0x8001
	checkitemtype VAR_0x8000
	call EventScript_BufferPutAwayPocketName
	msgbox Text_PutItemAway
	return

EventScript_BufferPutAwayPocketName::
	switch VAR_RESULT
	case POCKET_ITEMS,       EventScript_BufferPutAwayPocketItems
	case POCKET_KEY_ITEMS,   EventScript_BufferPutAwayPocketKeyItems
	case POCKET_POKE_BALLS,  EventScript_BufferPutAwayPocketPokeBalls
	case POCKET_TM_CASE,     EventScript_BufferPutAwayPocketTMCase
	case POCKET_BERRY_POUCH, EventScript_BufferPutAwayPocketBerryPouch
	end

EventScript_BufferPutAwayPocketItems::
	bufferstdstring STR_VAR_3, STDSTRING_ITEMS_POCKET
	return

EventScript_BufferPutAwayPocketKeyItems::
	bufferstdstring STR_VAR_3, STDSTRING_KEY_ITEMS_POCKET
	return

EventScript_BufferPutAwayPocketPokeBalls::
	bufferstdstring STR_VAR_3, STDSTRING_POKEBALLS_POCKET
	return

EventScript_BufferPutAwayPocketTMCase::
	bufferstdstring STR_VAR_3, STDSTRING_TM_CASE
	return

EventScript_BufferPutAwayPocketBerryPouch::
	bufferstdstring STR_VAR_3, STDSTRING_BERRY_POUCH
	return

	.include "data/scripts/seagallop.inc"
	.include "data/scripts/static_pokemon.inc"

EventScript_TryDarkenRuins::
	goto_if_set FLAG_SYS_UNLOCKED_TANOBY_RUINS, EventScript_Return
	setweather WEATHER_SHADE
	doweather
	return

EventScript_BrailleCursorWaitButton::
	special BrailleCursorToggle
	waitbuttonpress
	playse SE_SELECT
	setvar VAR_0x8006, 1
	special BrailleCursorToggle
	return

EventScript_NoMoreRoomForPokemon::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox Text_NoMoreRoomForPokemon
	release
	end

	.include "data/text/braille.inc"
	.include "data/scripts/trainers.inc"

@ Test message!
@ Welcome to the world of Pokémon!
Text_TestMsg::
	.string "テストよう　メッセージです！\n"
	.string "ポケモンの　せかいへ　ようこそ！$"

	.include "data/scripts/fame_checker.inc"
	.include "data/text/fame_checker.inc"
	.include "data/text/sign_lady.inc"
	.include "data/text/trainer_card.inc"
	.include "data/scripts/trainer_card.inc"
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
	.include "data/text/pokedude.inc"
