	.include "asm/macros/field_effect_script.inc"
	.section script_data, "aw", %progbits
	.align 2
gFieldEffectScriptPointers::
	.4byte gFldEffScript_ExclamationMarkIcon     @ FLDEFF_EXCLAMATION_MARK_ICON
	.4byte gFldEffScript_UseCutOnGrass           @ FLDEFF_USE_CUT_ON_GRASS
	.4byte gFldEffScript_UseCutOnTree            @ FLDEFF_USE_CUT_ON_TREE
	.4byte gFldEffScript_Shadow                  @ FLDEFF_SHADOW
	.4byte gFldEffScript_TallGrass               @ FLDEFF_TALL_GRASS
	.4byte gFldEffScript_Ripple                  @ FLDEFF_RIPPLE
	.4byte gFldEffScript_FieldMoveShowMon        @ FLDEFF_FIELD_MOVE_SHOW_MON
	.4byte gFldEffScript_Ash                     @ FLDEFF_ASH
	.4byte gFldEffScript_SurfBlob                @ FLDEFF_SURF_BLOB
	.4byte gFldEffScript_UseSurf                 @ FLDEFF_USE_SURF
	.4byte gFldEffScript_Dust                    @ FLDEFF_DUST
	.4byte gFldEffScript_UseSecretPowerCave      @ FLDEFF_USE_SECRET_POWER_CAVE
	.4byte gFldEffScript_JumpTallGrass           @ FLDEFF_JUMP_TALL_GRASS
	.4byte gFldEffScript_SandFootprints          @ FLDEFF_SAND_FOOTPRINTS
	.4byte gFldEffScript_JumpBigSplash           @ FLDEFF_JUMP_BIG_SPLASH
	.4byte gFldEffScript_Splash                  @ FLDEFF_SPLASH
	.4byte gFldEffScript_JumpSmallSplash         @ FLDEFF_JUMP_SMALL_SPLASH
	.4byte gFldEffScript_LongGrass               @ FLDEFF_LONG_GRASS
	.4byte gFldEffScript_JumpLongGrass           @ FLDEFF_JUMP_LONG_GRASS
	.4byte gFldEffScript_UnusedGrass             @ FLDEFF_UNUSED_GRASS
	.4byte gFldEffScript_UnusedGrass2            @ FLDEFF_UNUSED_GRASS_2
	.4byte gFldEffScript_UnusedSand              @ FLDEFF_UNUSED_SAND
	.4byte gFldEffScript_UnusedWaterSurfacing    @ FLDEFF_UNUSED_WATER_SURFACING
	.4byte gFldEffScript_BerryTreeGrowthSparkle  @ FLDEFF_BERRY_TREE_GROWTH_SPARKLE
	.4byte gFldEffScript_DeepSandFootprints      @ FLDEFF_DEEP_SAND_FOOTPRINTS
	.4byte gFldEffScript_PokecenterHeal          @ FLDEFF_POKECENTER_HEAL
	.4byte gFldEffScript_UseSecretPowerTree      @ FLDEFF_USE_SECRET_POWER_TREE
	.4byte gFldEffScript_UseSecretPowerShrub     @ FLDEFF_USE_SECRET_POWER_SHRUB
	.4byte gFldEffScript_TreeDisguise            @ FLDEFF_TREE_DISGUISE
	.4byte gFldEffScript_MountainDisguise        @ FLDEFF_MOUNTAIN_DISGUISE
	.4byte gFldEffScript_NpcflyOut               @ FLDEFF_NPCFLY_OUT
	.4byte gFldEffScript_FlyOut                  @ FLDEFF_FLY_OUT
	.4byte gFldEffScript_FlyIn                   @ FLDEFF_FLY_IN
	.4byte gFldEffScript_QuestionMarkIcon        @ FLDEFF_QUESTION_MARK_ICON
	.4byte gFldEffScript_FeetInFlowingWater      @ FLDEFF_FEET_IN_FLOWING_WATER
	.4byte gFldEffScript_BikeTireTracks          @ FLDEFF_BIKE_TIRE_TRACKS
	.4byte gFldEffScript_SandDisguise            @ FLDEFF_SAND_DISGUISE
	.4byte gFldEffScript_UseRockSmash            @ FLDEFF_USE_ROCK_SMASH
	.4byte gFldEffScript_UseDig                  @ FLDEFF_USE_DIG
	.4byte gFldEffScript_SandPile                @ FLDEFF_SAND_PILE
	.4byte gFldEffScript_UseStrength             @ FLDEFF_USE_STRENGTH
	.4byte gFldEffScript_ShortGrass              @ FLDEFF_SHORT_GRASS
	.4byte gFldEffScript_HotSpringsWater         @ FLDEFF_HOT_SPRINGS_WATER
	.4byte gFldEffScript_UseWaterfall            @ FLDEFF_USE_WATERFALL
	.4byte gFldEffScript_UseDive                 @ FLDEFF_USE_DIVE
	.4byte gFldEffScript_Pokeball                @ FLDEFF_POKEBALL
	.4byte gFldEffScript_XIcon                   @ FLDEFF_X_ICON
	.4byte gFldEffScript_Nop47                   @ FLDEFF_NOP_47
	.4byte gFldEffScript_Nop48                   @ FLDEFF_NOP_48
	.4byte gFldEffScript_PopOutOfAsh             @ FLDEFF_POP_OUT_OF_ASH
	.4byte gFldEffScript_LavaridgeGymWarp        @ FLDEFF_LAVARIDGE_GYM_WARP
	.4byte gFldEffScript_SweetScent              @ FLDEFF_SWEET_SCENT
	.4byte gFldEffScript_SandPillar              @ FLDEFF_SAND_PILLAR
	.4byte gFldEffScript_Bubbles                 @ FLDEFF_BUBBLES
	.4byte gFldEffScript_Sparkle                 @ FLDEFF_SPARKLE
	.4byte gFldEffScript_SecretPowerCave         @ FLDEFF_SECRET_POWER_CAVE
	.4byte gFldEffScript_SecretPowerTree         @ FLDEFF_SECRET_POWER_TREE
	.4byte gFldEffScript_SecretPowerShrub        @ FLDEFF_SECRET_POWER_SHRUB
	.4byte gFldEffScript_CutGrass                @ FLDEFF_CUT_GRASS
	.4byte gFldEffScript_FieldMoveShowMonInit    @ FLDEFF_FIELD_MOVE_SHOW_MON_INIT
	.4byte gFldEffScript_UseFlyAncientTomb       @ FLDEFF_USE_FLY_ANCIENT_TOMB
	.4byte gFldEffScript_PcturnOn                @ FLDEFF_PCTURN_ON
	.4byte gFldEffScript_HallOfFameRecord        @ FLDEFF_HALL_OF_FAME_RECORD
	.4byte gFldEffScript_UseTeleport             @ FLDEFF_USE_TELEPORT
	.4byte gFldEffScript_SmileyFaceIcon          @ FLDEFF_SMILEY_FACE_ICON
	.4byte gFldEffScript_UseVsSeeker             @ FLDEFF_USE_VS_SEEKER
	.4byte gFldEffScript_DoubleExclMarkIcon      @ FLDEFF_DOUBLE_EXCL_MARK_ICON
	.4byte gFldEffScript_MoveDeoxysRock          @ FLDEFF_MOVE_DEOXYS_ROCK
	.4byte gFldEffScript_DestroyDeoxysRock       @ FLDEFF_DESTROY_DEOXYS_ROCK
	.4byte gFldEffScript_PhotoFlash              @ FLDEFF_PHOTO_FLASH

gFldEffScript_ExclamationMarkIcon::
	callnative FldEff_ExclamationMarkIcon1
	end 

gFldEffScript_UseCutOnGrass::
	callnative FldEff_UseCutOnGrass
	end 

gFldEffScript_UseCutOnTree::
	callnative FldEff_UseCutOnTree
	end 

gFldEffScript_Shadow::
	callnative FldEff_Shadow
	end 

gFldEffScript_TallGrass::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_TallGrass
	end 

gFldEffScript_Ripple::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Ripple
	end 

gFldEffScript_FieldMoveShowMon::
	callnative FldEff_FieldMoveShowMon
	end 

gFldEffScript_Ash::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Ash
	end 

gFldEffScript_SurfBlob::
	callnative FldEff_SurfBlob
	end 

gFldEffScript_UseSurf::
	callnative FldEff_UseSurf
	end 

gFldEffScript_Dust::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Dust
	end 

gFldEffScript_UseSecretPowerCave::
	end 

gFldEffScript_JumpTallGrass::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_JumpTallGrass
	end 

gFldEffScript_SandFootprints::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_SandFootprints
	end 

gFldEffScript_JumpBigSplash::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_JumpBigSplash
	end 

gFldEffScript_Splash::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Splash
	end 

gFldEffScript_JumpSmallSplash::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_JumpSmallSplash
	end 

gFldEffScript_LongGrass::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_LongGrass
	end 

gFldEffScript_JumpLongGrass::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_JumpLongGrass
	end 

gFldEffScript_UnusedGrass::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_UnusedGrass
	end 

gFldEffScript_UnusedGrass2::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_UnusedGrass2
	end 

gFldEffScript_UnusedSand::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_UnusedSand
	end 

gFldEffScript_UnusedWaterSurfacing::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_UnusedWaterSurfacing
	end 

gFldEffScript_BerryTreeGrowthSparkle::
	callnative FldEff_BerryTreeGrowthSparkle
	end 

gFldEffScript_DeepSandFootprints::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_DeepSandFootprints
	end 

gFldEffScript_PokecenterHeal::
	loadfadedpal gSpritePalette_PokeballGlow 
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_PokecenterHeal
	end 

gFldEffScript_UseSecretPowerTree::
	end 

gFldEffScript_UseSecretPowerShrub::
	end 

gFldEffScript_TreeDisguise::
	callnative ShowTreeDisguiseFieldEffect
	end 

gFldEffScript_MountainDisguise::
	callnative ShowMountainDisguiseFieldEffect
	end 

gFldEffScript_NpcflyOut::
	callnative FldEff_NpcFlyOut
	end 

gFldEffScript_FlyOut::
	callnative FldEff_FlyOut 
	end 

gFldEffScript_FlyIn::
	callnative FldEff_FlyIn
	end 

gFldEffScript_QuestionMarkIcon::
	callnative FldEff_QuestionMarkIcon
	end 

gFldEffScript_FeetInFlowingWater::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_FeetInFlowingWater
	end 

gFldEffScript_BikeTireTracks::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_BikeTireTracks
	end 

gFldEffScript_SandDisguise::
	callnative ShowSandDisguiseFieldEffect
	end 

gFldEffScript_UseRockSmash::
	callnative FldEff_UseRockSmash
	end 

gFldEffScript_UseStrength::
	callnative FldEff_UseStrength
	end 

gFldEffScript_UseDig::
	callnative FldEff_UseDig
	end 

gFldEffScript_SandPile::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_SandPile
	end 

gFldEffScript_ShortGrass::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_ShortGrass
	end 

gFldEffScript_HotSpringsWater::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_HotSpringsWater
	end 

gFldEffScript_UseWaterfall::
	callnative FldEff_UseWaterfall
	end 

gFldEffScript_UseDive::
	callnative FldEff_UseDive
	end 

gFldEffScript_Pokeball::
	loadpal gSpritePalette_Pokeball
	callnative FldEff_PokeballTrail
	end 

gFldEffScript_XIcon::
	callnative FldEff_XIcon
	end 

gFldEffScript_Nop47::
	end 

gFldEffScript_Nop48::
	end 

gFldEffScript_PopOutOfAsh::
	loadfadedpal_callnative gSpritePalette_Ash, FldEff_PopOutOfAsh
	end 

gFldEffScript_LavaridgeGymWarp::
	loadfadedpal_callnative gSpritePalette_Ash, FldEff_LavaridgeGymWarp
	end 

gFldEffScript_SweetScent::
	callnative FldEff_SweetScent
	end 

gFldEffScript_SandPillar::
	end 

gFldEffScript_Bubbles::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Bubbles
	end 

gFldEffScript_Sparkle::
	loadfadedpal_callnative gSpritePalette_SmallSparkle, FldEff_Sparkle
	end 

gFldEffScript_SecretPowerCave::
	end 

gFldEffScript_SecretPowerTree::
	end 

gFldEffScript_SecretPowerShrub::
	end 

gFldEffScript_CutGrass::
	loadfadedpal_callnative gFldEffPalette_CutGrass, FldEff_CutGrass
	end 

gFldEffScript_FieldMoveShowMonInit::
	callnative FldEff_FieldMoveShowMonInit
	end 

gFldEffScript_UseFlyAncientTomb::
	end 

gFldEffScript_PcturnOn::
	end 

gFldEffScript_HallOfFameRecord::
	loadfadedpal gSpritePalette_PokeballGlow 
	loadfadedpal_callnative gSpritePalette_HofMonitor, FldEff_HallOfFameRecord
	end 

gFldEffScript_UseTeleport::
	callnative FldEff_UseTeleport
	end 

gFldEffScript_SmileyFaceIcon::
	callnative FldEff_SmileyFaceIcon
	end 

gFldEffScript_UseVsSeeker::
	callnative FldEff_UseVsSeeker
	end 

gFldEffScript_DoubleExclMarkIcon::
	callnative FldEff_DoubleExclMarkIcon
	end 

gFldEffScript_MoveDeoxysRock::
	callnative FldEff_MoveDeoxysRock
	end 

gFldEffScript_DestroyDeoxysRock::
	callnative FldEff_DestroyDeoxysRock
	end 

gFldEffScript_PhotoFlash::
	callnative FldEff_PhotoFlash
	end 
