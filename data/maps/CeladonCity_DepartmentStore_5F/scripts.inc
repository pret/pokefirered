CeladonCity_DepartmentStore_5F_MapScripts::
	.byte 0

CeladonCity_DepartmentStore_5F_EventScript_Gentleman::
	msgbox CeladonCity_DepartmentStore_5F_Text_ExplainStatEnhancers, MSGBOX_NPC
	end

CeladonCity_DepartmentStore_5F_EventScript_Sailor::
	msgbox CeladonCity_DepartmentStore_5F_Text_HereForStatEnhancers, MSGBOX_NPC
	end

CeladonCity_DepartmentStore_5F_EventScript_FloorSign::
	msgbox CeladonCity_DepartmentStore_5F_Text_Drugstore, MSGBOX_SIGN
	end

CeladonCity_DepartmentStore_5F_EventScript_ClerkXItems::
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart CeladonCity_DepartmentStore_5F_XItems
	
	release
	end

	.align 2
CeladonCity_DepartmentStore_5F_XItems::
	.2byte ITEM_ZOOM_LENS
	.2byte ITEM_AGUAV_BERRY
	.2byte ITEM_BERRY_JUICE
	.2byte ITEM_BLACK_BELT
	.2byte ITEM_BLACK_GLASSES
	.2byte ITEM_CHARCOAL
	.2byte ITEM_DRAGON_FANG
	.2byte ITEM_FIGY_BERRY
	.2byte ITEM_FOCUS_BAND
	.2byte ITEM_FULL_INCENSE
	.2byte ITEM_GRIP_CLAW
	.2byte ITEM_HARD_STONE
	.2byte ITEM_IAPAPA_BERRY
	.2byte ITEM_MAGNET
	.2byte ITEM_MAGO_BERRY
	.2byte ITEM_METAL_COAT
	.2byte ITEM_MIRACLE_SEED
	.2byte ITEM_MUSCLE_BAND
	.2byte ITEM_MYSTIC_WATER
	.2byte ITEM_NEVER_MELT_ICE
	.2byte ITEM_ODD_INCENSE
	.2byte ITEM_POISON_BARB
	.2byte ITEM_ROCK_INCENSE
	.2byte ITEM_ROSE_INCENSE
	.2byte ITEM_SEA_INCENSE
	.2byte ITEM_SHARP_BEAK
	.2byte ITEM_SILK_SCARF
	.2byte ITEM_SILVER_POWDER
	.2byte ITEM_SOFT_SAND
	.2byte ITEM_SPELL_TAG
	.2byte ITEM_STICKY_BARB
	.2byte ITEM_TWISTED_SPOON
	.2byte ITEM_WAVE_INCENSE
	.2byte ITEM_WIKI_BERRY
	.2byte ITEM_WISE_GLASSES
	.2byte ITEM_APICOT_BERRY
	.2byte ITEM_ASPEAR_BERRY
	.2byte ITEM_CHERI_BERRY
	.2byte ITEM_DEEP_SEA_SCALE
	.2byte ITEM_DEEP_SEA_TOOTH
	.2byte ITEM_DESTINY_KNOT
	.2byte ITEM_ENIGMA_BERRY
	.2byte ITEM_GANLON_BERRY
	.2byte ITEM_LANSAT_BERRY
	.2byte ITEM_LEPPA_BERRY
	.2byte ITEM_LIGHT_BALL
	.2byte ITEM_LUCKY_PUNCH
	.2byte ITEM_MENTAL_HERB
	.2byte ITEM_METAL_POWDER
	.2byte ITEM_METRONOME
	.2byte ITEM_MICLE_BERRY
	.2byte ITEM_ORAN_BERRY
	.2byte ITEM_PECHA_BERRY
	.2byte ITEM_PERSIM_BERRY
	.2byte ITEM_QUICK_POWDER
	.2byte ITEM_RARE_BONE
	.2byte ITEM_RAWST_BERRY
	.2byte ITEM_RAZOR_CLAW
	.2byte ITEM_RAZOR_FANG
	.2byte ITEM_SCOPE_LENS
	.2byte ITEM_STARF_BERRY
	.2byte ITEM_STICK
	.2byte ITEM_THICK_CLUB
	.2byte ITEM_NONE
	release
	end

CeladonCity_DepartmentStore_5F_EventScript_ClerkVitamins::
	goto_if_questlog EventScript_ReleaseEnd
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart CeladonCity_DepartmentStore_5F_Vitamins
	
	release
	end

	.align 2
CeladonCity_DepartmentStore_5F_Vitamins::
	.2byte ITEM_CHOICE_BAND
	.2byte ITEM_CHOICE_SCARF
	.2byte ITEM_CHOICE_SPECS
	.2byte ITEM_LEFTOVERS
	.2byte ITEM_LIFE_ORB
	.2byte ITEM_BLACK_SLUDGE
	.2byte ITEM_CUSTAP_BERRY
	.2byte ITEM_EXPERT_BELT
	.2byte ITEM_FLAME_ORB
	.2byte ITEM_FOCUS_SASH
	.2byte ITEM_LUM_BERRY
	.2byte ITEM_SALAC_BERRY
	.2byte ITEM_TOXIC_ORB
	.2byte ITEM_SHELL_BELL
	.2byte ITEM_DAMP_ROCK
	.2byte ITEM_HEAT_ROCK
	.2byte ITEM_ICY_ROCK
	.2byte ITEM_SMOOTH_ROCK
	.2byte ITEM_BABIRI_BERRY
	.2byte ITEM_BIG_ROOT
	.2byte ITEM_CHARTI_BERRY
	.2byte ITEM_CHESTO_BERRY
	.2byte ITEM_CHILAN_BERRY
	.2byte ITEM_CHOPLE_BERRY
	.2byte ITEM_COBA_BERRY
	.2byte ITEM_COLBUR_BERRY
	.2byte ITEM_HABAN_BERRY
	.2byte ITEM_IRON_BALL
	.2byte ITEM_JABOCA_BERRY
	.2byte ITEM_KASIB_BERRY
	.2byte ITEM_KEBIA_BERRY
	.2byte ITEM_KINGS_ROCK
	.2byte ITEM_LAGGING_TAIL
	.2byte ITEM_LIECHI_BERRY
	.2byte ITEM_LIGHT_CLAY
	.2byte ITEM_OCCA_BERRY
	.2byte ITEM_PASSHO_BERRY
	.2byte ITEM_PAYAPA_BERRY
	.2byte ITEM_PETAYA_BERRY
	.2byte ITEM_POWER_HERB
	.2byte ITEM_QUICK_CLAW
	.2byte ITEM_RINDO_BERRY
	.2byte ITEM_ROWAP_BERRY
	.2byte ITEM_SHED_SHELL
	.2byte ITEM_SHUCA_BERRY
	.2byte ITEM_SITRUS_BERRY
	.2byte ITEM_TANGA_BERRY
	.2byte ITEM_WACAN_BERRY
	.2byte ITEM_WHITE_HERB
	.2byte ITEM_WIDE_LENS
	.2byte ITEM_YACHE_BERRY
	.2byte ITEM_NONE
	release
	end
