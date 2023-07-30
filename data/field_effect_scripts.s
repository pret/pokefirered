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
	field_eff_callnative FldEff_ExclamationMarkIcon1
	field_eff_end 

gFldEffScript_UseCutOnGrass::
	field_eff_callnative FldEff_UseCutOnGrass
	field_eff_end 

gFldEffScript_UseCutOnTree::
	field_eff_callnative FldEff_UseCutOnTree
	field_eff_end 

gFldEffScript_Shadow::
	field_eff_callnative FldEff_Shadow
	field_eff_end 

gFldEffScript_TallGrass::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_TallGrass
	field_eff_end 

gFldEffScript_Ripple::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Ripple
	field_eff_end 

gFldEffScript_FieldMoveShowMon::
	field_eff_callnative FldEff_FieldMoveShowMon
	field_eff_end 

gFldEffScript_Ash::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Ash
	field_eff_end 

gFldEffScript_SurfBlob::
	field_eff_callnative FldEff_SurfBlob
	field_eff_end 

gFldEffScript_UseSurf::
	field_eff_callnative FldEff_UseSurf
	field_eff_end 

gFldEffScript_Dust::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Dust
	field_eff_end 

gFldEffScript_UseSecretPowerCave::
	field_eff_end 

gFldEffScript_JumpTallGrass::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_JumpTallGrass
	field_eff_end 

gFldEffScript_SandFootprints::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_SandFootprints
	field_eff_end 

gFldEffScript_JumpBigSplash::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_JumpBigSplash
	field_eff_end 

gFldEffScript_Splash::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Splash
	field_eff_end 

gFldEffScript_JumpSmallSplash::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_JumpSmallSplash
	field_eff_end 

gFldEffScript_LongGrass::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_LongGrass
	field_eff_end 

gFldEffScript_JumpLongGrass::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_JumpLongGrass
	field_eff_end 

gFldEffScript_UnusedGrass::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_UnusedGrass
	field_eff_end 

gFldEffScript_UnusedGrass2::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_UnusedGrass2
	field_eff_end 

gFldEffScript_UnusedSand::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_UnusedSand
	field_eff_end 

gFldEffScript_UnusedWaterSurfacing::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_UnusedWaterSurfacing
	field_eff_end 

gFldEffScript_BerryTreeGrowthSparkle::
	field_eff_callnative FldEff_BerryTreeGrowthSparkle
	field_eff_end 

gFldEffScript_DeepSandFootprints::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_DeepSandFootprints
	field_eff_end 

gFldEffScript_PokecenterHeal::
	field_eff_loadfadedpal gSpritePalette_PokeballGlow 
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_PokecenterHeal
	field_eff_end 

gFldEffScript_UseSecretPowerTree::
	field_eff_end 

gFldEffScript_UseSecretPowerShrub::
	field_eff_end 

gFldEffScript_TreeDisguise::
	field_eff_callnative ShowTreeDisguiseFieldEffect
	field_eff_end 

gFldEffScript_MountainDisguise::
	field_eff_callnative ShowMountainDisguiseFieldEffect
	field_eff_end 

gFldEffScript_NpcflyOut::
	field_eff_callnative FldEff_NpcFlyOut
	field_eff_end 

gFldEffScript_FlyOut::
	field_eff_callnative FldEff_FlyOut 
	field_eff_end 

gFldEffScript_FlyIn::
	field_eff_callnative FldEff_FlyIn
	field_eff_end 

gFldEffScript_QuestionMarkIcon::
	field_eff_callnative FldEff_QuestionMarkIcon
	field_eff_end 

gFldEffScript_FeetInFlowingWater::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_FeetInFlowingWater
	field_eff_end 

gFldEffScript_BikeTireTracks::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_BikeTireTracks
	field_eff_end 

gFldEffScript_SandDisguise::
	field_eff_callnative ShowSandDisguiseFieldEffect
	field_eff_end 

gFldEffScript_UseRockSmash::
	field_eff_callnative FldEff_UseRockSmash
	field_eff_end 

gFldEffScript_UseStrength::
	field_eff_callnative FldEff_UseStrength
	field_eff_end 

gFldEffScript_UseDig::
	field_eff_callnative FldEff_UseDig
	field_eff_end 

gFldEffScript_SandPile::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_SandPile
	field_eff_end 

gFldEffScript_ShortGrass::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_ShortGrass
	field_eff_end 

gFldEffScript_HotSpringsWater::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_HotSpringsWater
	field_eff_end 

gFldEffScript_UseWaterfall::
	field_eff_callnative FldEff_UseWaterfall
	field_eff_end 

gFldEffScript_UseDive::
	field_eff_callnative FldEff_UseDive
	field_eff_end 

gFldEffScript_Pokeball::
	field_eff_loadpal gSpritePalette_Pokeball
	field_eff_callnative FldEff_PokeballTrail
	field_eff_end 

gFldEffScript_XIcon::
	field_eff_callnative FldEff_XIcon
	field_eff_end 

gFldEffScript_Nop47::
	field_eff_end 

gFldEffScript_Nop48::
	field_eff_end 

gFldEffScript_PopOutOfAsh::
	field_eff_loadfadedpal_callnative gSpritePalette_Ash, FldEff_PopOutOfAsh
	field_eff_end 

gFldEffScript_LavaridgeGymWarp::
	field_eff_loadfadedpal_callnative gSpritePalette_Ash, FldEff_LavaridgeGymWarp
	field_eff_end 

gFldEffScript_SweetScent::
	field_eff_callnative FldEff_SweetScent
	field_eff_end 

gFldEffScript_SandPillar::
	field_eff_end 

gFldEffScript_Bubbles::
	field_eff_loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Bubbles
	field_eff_end 

gFldEffScript_Sparkle::
	field_eff_loadfadedpal_callnative gSpritePalette_SmallSparkle, FldEff_Sparkle
	field_eff_end 

gFldEffScript_SecretPowerCave::
	field_eff_end 

gFldEffScript_SecretPowerTree::
	field_eff_end 

gFldEffScript_SecretPowerShrub::
	field_eff_end 

gFldEffScript_CutGrass::
	field_eff_loadfadedpal_callnative gFldEffPalette_CutGrass, FldEff_CutGrass
	field_eff_end 

gFldEffScript_FieldMoveShowMonInit::
	field_eff_callnative FldEff_FieldMoveShowMonInit
	field_eff_end 

gFldEffScript_UseFlyAncientTomb::
	field_eff_end 

gFldEffScript_PcturnOn::
	field_eff_end 

gFldEffScript_HallOfFameRecord::
	field_eff_loadfadedpal gSpritePalette_PokeballGlow 
	field_eff_loadfadedpal_callnative gSpritePalette_HofMonitor, FldEff_HallOfFameRecord
	field_eff_end 

gFldEffScript_UseTeleport::
	field_eff_callnative FldEff_UseTeleport
	field_eff_end 

gFldEffScript_SmileyFaceIcon::
	field_eff_callnative FldEff_SmileyFaceIcon
	field_eff_end 

gFldEffScript_UseVsSeeker::
	field_eff_callnative FldEff_UseVsSeeker
	field_eff_end 

gFldEffScript_DoubleExclMarkIcon::
	field_eff_callnative FldEff_DoubleExclMarkIcon
	field_eff_end 

gFldEffScript_MoveDeoxysRock::
	field_eff_callnative FldEff_MoveDeoxysRock
	field_eff_end 

gFldEffScript_DestroyDeoxysRock::
	field_eff_callnative FldEff_DestroyDeoxysRock
	field_eff_end 

gFldEffScript_PhotoFlash::
	field_eff_callnative FldEff_PhotoFlash
	field_eff_end 
