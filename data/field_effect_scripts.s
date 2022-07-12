	.include "asm/macros/field_effect_script.inc"
	.section script_data, "aw", %progbits
	.align 2
gFieldEffectScriptPointers::
	.4byte gFldEffScript_ExclamationMarkIcon
	.4byte gFldEffScript_UseCutOnGrass
	.4byte gFldEffScript_UseCutOnTree
	.4byte gFldEffScript_Shadow
	.4byte gFldEffScript_TallGrass
	.4byte gFldEffScript_Ripple
	.4byte gFldEffScript_FieldMoveShowMon
	.4byte gFldEffScript_Ash
	.4byte gFldEffScript_SurfBlob
	.4byte gFldEffScript_UseSurf
	.4byte gFldEffScript_Dust
	.4byte gFldEffScript_UseSecretPowerCave
	.4byte gFldEffScript_JumpTallGrass
	.4byte gFldEffScript_SandFootprints
	.4byte gFldEffScript_JumpBigSplash
	.4byte gFldEffScript_Splash
	.4byte gFldEffScript_JumpSmallSplash
	.4byte gFldEffScript_LongGrass
	.4byte gFldEffScript_JumpLongGrass
	.4byte gFldEffScript_Unknown19
	.4byte gFldEffScript_Unknown20
	.4byte gFldEffScript_Unknown21
	.4byte gFldEffScript_Unknown22
	.4byte gFldEffScript_BerryTreeGrowthSparkle
	.4byte gFldEffScript_DeepSandFootprints
	.4byte gFldEffScript_PokecenterHeal
	.4byte gFldEffScript_UseSecretPowerTree
	.4byte gFldEffScript_UseSecretPowerShrub
	.4byte gFldEffScript_TreeDisguise
	.4byte gFldEffScript_MountainDisguise
	.4byte gFldEffScript_NpcflyOut
	.4byte gFldEffScript_FlyOut
	.4byte gFldEffScript_FlyIn
	.4byte gFldEffScript_QuestionMarkIcon
	.4byte gFldEffScript_FeetInFlowingWater
	.4byte gFldEffScript_BikeTireTracks
	.4byte gFldEffScript_SandDisguise
	.4byte gFldEffScript_UseRockSmash
	.4byte gFldEffScript_UseDig
	.4byte gFldEffScript_SandPile
	.4byte gFldEffScript_UseStrength
	.4byte gFldEffScript_ShortGrass
	.4byte gFldEffScript_HotSpringsWater
	.4byte gFldEffScript_UseWaterfall
	.4byte gFldEffScript_UseDive
	.4byte gFldEffScript_Pokeball
	.4byte gFldEffScript_HeartIcon
	.4byte gFldEffScript_Nop47
	.4byte gFldEffScript_Nop48
	.4byte gFldEffScript_PopOutOfAsh
	.4byte gFldEffScript_LavaridgeGymWarp
	.4byte gFldEffScript_SweetScent
	.4byte gFldEffScript_SandPillar
	.4byte gFldEffScript_Bubbles
	.4byte gFldEffScript_Sparkle
	.4byte gFldEffScript_SecretPowerCave
	.4byte gFldEffScript_SecretPowerTree
	.4byte gFldEffScript_SecretPowerShrub
	.4byte gFldEffScript_CutGrass
	.4byte gFldEffScript_FieldMoveShowMonInit
	.4byte gFldEffScript_UseFlyAncientTomb
	.4byte gFldEffScript_PcturnOn
	.4byte gFldEffScript_HallOfFameRecord
	.4byte gFldEffScript_UseTeleport
	.4byte gFldEffScript_SmileyFaceIcon
	.4byte gFldEffScript_UseVsSeeker
	.4byte gFldEffScript_DoubleExclMarkIcon
	.4byte gFldEffScript_MoveDeoxysRock
	.4byte gFldEffScript_DestroyDeoxysRock
	.4byte gFldEffScript_PhotoFlash

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

gFldEffScript_Unknown19::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Unknown19
	end 

gFldEffScript_Unknown20::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Unknown20
	end 

gFldEffScript_Unknown21::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Unknown21
	end 

gFldEffScript_Unknown22::
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Unknown22
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
	loadpal sSpritePalette_SlidingPokeball
	callnative FldEff_Pokeball
	end 

gFldEffScript_HeartIcon::
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
