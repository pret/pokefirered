# 1 "data/maps/TwoIsland/scripts.pory"

# 2 "data/maps/TwoIsland/scripts.pory"
TwoIsland_MapScripts::
# 3 "data/maps/TwoIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, TwoIsland_OnTransition
# 4 "data/maps/TwoIsland/scripts.pory"
	.byte 0
# 5 "data/maps/TwoIsland/scripts.pory"

# 6 "data/maps/TwoIsland/scripts.pory"
TwoIsland_OnTransition::
# 7 "data/maps/TwoIsland/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_TWO_ISLAND
# 8 "data/maps/TwoIsland/scripts.pory"
	setflag FLAG_VISITED_TWO_ISLAND
# 9 "data/maps/TwoIsland/scripts.pory"
	call TwoIsland_EventScript_SetShopState
# 10 "data/maps/TwoIsland/scripts.pory"
	end
# 11 "data/maps/TwoIsland/scripts.pory"

# 12 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopState::
# 13 "data/maps/TwoIsland/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, TwoIsland_EventScript_SetShopStateAfterHoennLink
# 14 "data/maps/TwoIsland/scripts.pory"
	goto_if_set FLAG_SYS_GAME_CLEAR, TwoIsland_EventScript_SetShopStateAfterChampion
# 15 "data/maps/TwoIsland/scripts.pory"
	goto_if_set FLAG_RESCUED_LOSTELLE, TwoIsland_EventScript_SetShopStateAfterLostelleRescue
# 16 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_SetShopStateDefault
# 17 "data/maps/TwoIsland/scripts.pory"
	end
# 18 "data/maps/TwoIsland/scripts.pory"

# 19 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopStateAfterHoennLink::
# 20 "data/maps/TwoIsland/scripts.pory"
	goto_if_unset FLAG_TWO_ISLAND_SHOP_INTRODUCED, TwoIsland_EventScript_SetShopInitial
# 21 "data/maps/TwoIsland/scripts.pory"
	goto_if_unset FLAG_TWO_ISLAND_SHOP_EXPANDED_1, TwoIsland_EventScript_SetShopExpanded1
# 22 "data/maps/TwoIsland/scripts.pory"
	goto_if_unset FLAG_TWO_ISLAND_SHOP_EXPANDED_2, TwoIsland_EventScript_SetShopExpanded2
# 23 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_SetShopExpanded3
# 24 "data/maps/TwoIsland/scripts.pory"
	end
# 25 "data/maps/TwoIsland/scripts.pory"

# 26 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopStateAfterChampion::
# 27 "data/maps/TwoIsland/scripts.pory"
	goto_if_unset FLAG_TWO_ISLAND_SHOP_INTRODUCED, TwoIsland_EventScript_SetShopInitial
# 28 "data/maps/TwoIsland/scripts.pory"
	goto_if_unset FLAG_RESCUED_LOSTELLE, TwoIsland_EventScript_SetShopInitial
# 29 "data/maps/TwoIsland/scripts.pory"
	goto_if_unset FLAG_TWO_ISLAND_SHOP_EXPANDED_1, TwoIsland_EventScript_SetShopExpanded1
# 30 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_SetShopExpanded2
# 31 "data/maps/TwoIsland/scripts.pory"
	end
# 32 "data/maps/TwoIsland/scripts.pory"

# 33 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopStateAfterLostelleRescue::
# 34 "data/maps/TwoIsland/scripts.pory"
	goto_if_unset FLAG_TWO_ISLAND_SHOP_INTRODUCED, TwoIsland_EventScript_SetShopInitial
# 35 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_SetShopExpanded1
# 36 "data/maps/TwoIsland/scripts.pory"
	end
# 37 "data/maps/TwoIsland/scripts.pory"

# 38 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopStateDefault::
# 39 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_SetShopInitial
# 40 "data/maps/TwoIsland/scripts.pory"
	end
# 41 "data/maps/TwoIsland/scripts.pory"

# 42 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopInitial::
# 43 "data/maps/TwoIsland/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND, 1
# 44 "data/maps/TwoIsland/scripts.pory"
	return
# 45 "data/maps/TwoIsland/scripts.pory"

# 46 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopExpanded1::
# 47 "data/maps/TwoIsland/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND, 2
# 48 "data/maps/TwoIsland/scripts.pory"
	clearflag FLAG_HIDE_TWO_ISLAND_WOMAN
# 49 "data/maps/TwoIsland/scripts.pory"
	return
# 50 "data/maps/TwoIsland/scripts.pory"

# 51 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopExpanded2::
# 52 "data/maps/TwoIsland/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND, 3
# 53 "data/maps/TwoIsland/scripts.pory"
	clearflag FLAG_HIDE_TWO_ISLAND_BEAUTY
# 54 "data/maps/TwoIsland/scripts.pory"
	return
# 55 "data/maps/TwoIsland/scripts.pory"

# 56 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SetShopExpanded3::
# 57 "data/maps/TwoIsland/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND, 4
# 58 "data/maps/TwoIsland/scripts.pory"
	clearflag FLAG_HIDE_TWO_ISLAND_SUPER_NERD
# 59 "data/maps/TwoIsland/scripts.pory"
	return
# 60 "data/maps/TwoIsland/scripts.pory"

# 61 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_Clerk::
# 62 "data/maps/TwoIsland/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 63 "data/maps/TwoIsland/scripts.pory"
	lock
# 64 "data/maps/TwoIsland/scripts.pory"
	faceplayer
# 65 "data/maps/TwoIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND, 4, TwoIsland_EventScript_ClerkShopExpanded3
# 66 "data/maps/TwoIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND, 3, TwoIsland_EventScript_ClerkShopExpanded2
# 67 "data/maps/TwoIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND, 2, TwoIsland_EventScript_ClerkShopExpanded1
# 68 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_ClerkShopInitial
# 69 "data/maps/TwoIsland/scripts.pory"
	end
# 70 "data/maps/TwoIsland/scripts.pory"

# 71 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ClerkShopExpanded3::
# 72 "data/maps/TwoIsland/scripts.pory"
	goto_if_set FLAG_TWO_ISLAND_SHOP_EXPANDED_3, TwoIsland_EventScript_ClerkShopSkipIntro
# 73 "data/maps/TwoIsland/scripts.pory"
	setflag FLAG_TWO_ISLAND_SHOP_EXPANDED_3
# 74 "data/maps/TwoIsland/scripts.pory"
	message TwoIsland_Text_BringingItemsFromDistantLands
# 75 "data/maps/TwoIsland/scripts.pory"
	waitmessage
# 76 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_ShopExpanded3
# 77 "data/maps/TwoIsland/scripts.pory"
	end
# 78 "data/maps/TwoIsland/scripts.pory"

# 79 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ClerkShopExpanded2::
# 80 "data/maps/TwoIsland/scripts.pory"
	goto_if_set FLAG_TWO_ISLAND_SHOP_EXPANDED_2, TwoIsland_EventScript_ClerkShopSkipIntro
# 81 "data/maps/TwoIsland/scripts.pory"
	setflag FLAG_TWO_ISLAND_SHOP_EXPANDED_2
# 82 "data/maps/TwoIsland/scripts.pory"
	message TwoIsland_Text_HopeYouGiveItYourBest
# 83 "data/maps/TwoIsland/scripts.pory"
	waitmessage
# 84 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_ShopExpanded2
# 85 "data/maps/TwoIsland/scripts.pory"
	end
# 86 "data/maps/TwoIsland/scripts.pory"

# 87 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ClerkShopExpanded1::
# 88 "data/maps/TwoIsland/scripts.pory"
	goto_if_set FLAG_TWO_ISLAND_SHOP_EXPANDED_1, TwoIsland_EventScript_ClerkShopSkipIntro
# 89 "data/maps/TwoIsland/scripts.pory"
	setflag FLAG_TWO_ISLAND_SHOP_EXPANDED_1
# 90 "data/maps/TwoIsland/scripts.pory"
	message TwoIsland_Text_AddedMerchandiseForLostelle
# 91 "data/maps/TwoIsland/scripts.pory"
	waitmessage
# 92 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_ShopExpanded1
# 93 "data/maps/TwoIsland/scripts.pory"
	end
# 94 "data/maps/TwoIsland/scripts.pory"

# 95 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ClerkShopInitial::
# 96 "data/maps/TwoIsland/scripts.pory"
	goto_if_set FLAG_TWO_ISLAND_SHOP_INTRODUCED, TwoIsland_EventScript_ClerkShopSkipIntro
# 97 "data/maps/TwoIsland/scripts.pory"
	setflag FLAG_TWO_ISLAND_SHOP_INTRODUCED
# 98 "data/maps/TwoIsland/scripts.pory"
	message TwoIsland_Text_WelcomeToShopMerchandiseLimited
# 99 "data/maps/TwoIsland/scripts.pory"
	waitmessage
# 100 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_ShopInitial
# 101 "data/maps/TwoIsland/scripts.pory"
	end
# 102 "data/maps/TwoIsland/scripts.pory"

# 103 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ClerkShopSkipIntro::
# 104 "data/maps/TwoIsland/scripts.pory"
	message Text_MayIHelpYou
# 105 "data/maps/TwoIsland/scripts.pory"
	waitmessage
# 106 "data/maps/TwoIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND, 4, TwoIsland_EventScript_ShopExpanded3
# 107 "data/maps/TwoIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND, 3, TwoIsland_EventScript_ShopExpanded2
# 108 "data/maps/TwoIsland/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_TWO_ISLAND, 2, TwoIsland_EventScript_ShopExpanded1
# 109 "data/maps/TwoIsland/scripts.pory"
	goto TwoIsland_EventScript_ShopInitial
# 110 "data/maps/TwoIsland/scripts.pory"
	end
# 111 "data/maps/TwoIsland/scripts.pory"

# 112 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ShopInitial::
# 113 "data/maps/TwoIsland/scripts.pory"
	pokemart TwoIsland_Items_ShopInitial
# 114 "data/maps/TwoIsland/scripts.pory"
	msgbox Text_PleaseComeAgain
# 115 "data/maps/TwoIsland/scripts.pory"
	release
# 116 "data/maps/TwoIsland/scripts.pory"
	end
# 117 "data/maps/TwoIsland/scripts.pory"

# 118 "data/maps/TwoIsland/scripts.pory"
	.align 2
# 119 "data/maps/TwoIsland/scripts.pory"
TwoIsland_Items_ShopInitial::
# 120 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 121 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_FRESH_WATER
# 122 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_NONE
# 123 "data/maps/TwoIsland/scripts.pory"
	release
# 124 "data/maps/TwoIsland/scripts.pory"
	end
# 125 "data/maps/TwoIsland/scripts.pory"

# 126 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ShopExpanded1::
# 127 "data/maps/TwoIsland/scripts.pory"
	pokemart TwoIsland_Items_ShopExpanded1
# 128 "data/maps/TwoIsland/scripts.pory"
	msgbox Text_PleaseComeAgain
# 129 "data/maps/TwoIsland/scripts.pory"
	release
# 130 "data/maps/TwoIsland/scripts.pory"
	end
# 131 "data/maps/TwoIsland/scripts.pory"

# 132 "data/maps/TwoIsland/scripts.pory"
	.align 2
# 133 "data/maps/TwoIsland/scripts.pory"
TwoIsland_Items_ShopExpanded1::
# 134 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 135 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 136 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_SODA_POP
# 137 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_FRESH_WATER
# 138 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_NONE
# 139 "data/maps/TwoIsland/scripts.pory"
	release
# 140 "data/maps/TwoIsland/scripts.pory"
	end
# 141 "data/maps/TwoIsland/scripts.pory"

# 142 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ShopExpanded2::
# 143 "data/maps/TwoIsland/scripts.pory"
	pokemart TwoIsland_Items_ShopExpanded2
# 144 "data/maps/TwoIsland/scripts.pory"
	msgbox Text_PleaseComeAgain
# 145 "data/maps/TwoIsland/scripts.pory"
	release
# 146 "data/maps/TwoIsland/scripts.pory"
	end
# 147 "data/maps/TwoIsland/scripts.pory"

# 148 "data/maps/TwoIsland/scripts.pory"
	.align 2
# 149 "data/maps/TwoIsland/scripts.pory"
TwoIsland_Items_ShopExpanded2::
# 150 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 151 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 152 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_LEMONADE
# 153 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_SODA_POP
# 154 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_FRESH_WATER
# 155 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_MOOMOO_MILK
# 156 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_NONE
# 157 "data/maps/TwoIsland/scripts.pory"
	release
# 158 "data/maps/TwoIsland/scripts.pory"
	end
# 159 "data/maps/TwoIsland/scripts.pory"

# 160 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_ShopExpanded3::
# 161 "data/maps/TwoIsland/scripts.pory"
	pokemart TwoIsland_Items_ShopExpanded3
# 162 "data/maps/TwoIsland/scripts.pory"
	msgbox Text_PleaseComeAgain
# 163 "data/maps/TwoIsland/scripts.pory"
	release
# 164 "data/maps/TwoIsland/scripts.pory"
	end
# 165 "data/maps/TwoIsland/scripts.pory"

# 166 "data/maps/TwoIsland/scripts.pory"
	.align 2
# 167 "data/maps/TwoIsland/scripts.pory"
TwoIsland_Items_ShopExpanded3::
# 168 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 169 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_REPEAT_BALL
# 170 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_TIMER_BALL
# 171 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_LEMONADE
# 172 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_SODA_POP
# 173 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_FRESH_WATER
# 174 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_MOOMOO_MILK
# 175 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_LAVA_COOKIE
# 176 "data/maps/TwoIsland/scripts.pory"
	.2byte ITEM_NONE
# 177 "data/maps/TwoIsland/scripts.pory"
	release
# 178 "data/maps/TwoIsland/scripts.pory"
	end
# 179 "data/maps/TwoIsland/scripts.pory"

# 180 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_Sailor::
# 181 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_FellowMovedFromCeladonCity, MSGBOX_NPC
# 182 "data/maps/TwoIsland/scripts.pory"
	end
# 183 "data/maps/TwoIsland/scripts.pory"

# 184 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_Woman::
# 185 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_ShopkeepersBrotherWorksGameCorner, MSGBOX_NPC
# 186 "data/maps/TwoIsland/scripts.pory"
	end
# 187 "data/maps/TwoIsland/scripts.pory"

# 188 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_Beauty::
# 189 "data/maps/TwoIsland/scripts.pory"
	lock
# 190 "data/maps/TwoIsland/scripts.pory"
	faceplayer
# 191 "data/maps/TwoIsland/scripts.pory"
	famechecker FAMECHECKER_BRUNO, 4
# 192 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_BrunoCameToIslandWhileBack
# 193 "data/maps/TwoIsland/scripts.pory"
	release
# 194 "data/maps/TwoIsland/scripts.pory"
	end
# 195 "data/maps/TwoIsland/scripts.pory"

# 196 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_SuperNerd::
# 197 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_BuyRareItemsHere, MSGBOX_NPC
# 198 "data/maps/TwoIsland/scripts.pory"
	end
# 199 "data/maps/TwoIsland/scripts.pory"

# 200 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_Boy::
# 201 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_OldWomanLivesOutOnCape, MSGBOX_NPC
# 202 "data/maps/TwoIsland/scripts.pory"
	end
# 203 "data/maps/TwoIsland/scripts.pory"

# 204 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_LittleBoy::
# 205 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_HaveYouTriedJumpingGame, MSGBOX_NPC
# 206 "data/maps/TwoIsland/scripts.pory"
	end
# 207 "data/maps/TwoIsland/scripts.pory"

# 208 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_IslandSign::
# 209 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_IslandSign, MSGBOX_SIGN
# 210 "data/maps/TwoIsland/scripts.pory"
	end
# 211 "data/maps/TwoIsland/scripts.pory"

# 212 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_JoyfulGameCornerSign::
# 213 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_JoyfulGameCornerSign, MSGBOX_SIGN
# 214 "data/maps/TwoIsland/scripts.pory"
	end
# 215 "data/maps/TwoIsland/scripts.pory"

# 216 "data/maps/TwoIsland/scripts.pory"
TwoIsland_EventScript_FastCurrentSign::
# 217 "data/maps/TwoIsland/scripts.pory"
	msgbox TwoIsland_Text_DangerFastCurrent, MSGBOX_SIGN
# 218 "data/maps/TwoIsland/scripts.pory"
	end
