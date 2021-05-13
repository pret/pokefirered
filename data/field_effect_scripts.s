	.include "asm/macros/field_effect_script.inc"
	.section script_data, "aw", %progbits
	.align 2
gFieldEffectScriptPointers:: @ 81D96AC
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
	.4byte gFldEffScript_UseFly
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
	.4byte gFldEffScript_Unk44
	.4byte gFldEffScript_Unk45

gFldEffScript_ExclamationMarkIcon:: @ 81D97C4
	callnative FldEff_ExclamationMarkIcon1
	end 

gFldEffScript_UseCutOnGrass:: @ 81D97CA
	callnative FldEff_UseCutOnGrass
	end 

gFldEffScript_UseCutOnTree:: @ 81D97D0
	callnative FldEff_UseCutOnTree
	end 

gFldEffScript_Shadow:: @ 81D97D6
	callnative FldEff_Shadow
	end 

gFldEffScript_TallGrass:: @ 81D97DC
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_TallGrass
	end 

gFldEffScript_Ripple:: @ 81D97E6
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Ripple
	end 

gFldEffScript_FieldMoveShowMon:: @ 81D97F0
	callnative FldEff_FieldMoveShowMon
	end 

gFldEffScript_Ash:: @ 81D97F6
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Ash
	end 

gFldEffScript_SurfBlob:: @ 81D9800
	callnative FldEff_SurfBlob
	end 

gFldEffScript_UseSurf:: @ 81D9806
	callnative FldEff_UseSurf
	end 

gFldEffScript_Dust:: @ 81D980C
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Dust
	end 

gFldEffScript_UseSecretPowerCave:: @ 81D9816
	end 

gFldEffScript_JumpTallGrass:: @ 81D9817
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_JumpTallGrass
	end 

gFldEffScript_SandFootprints:: @ 81D9821
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_SandFootprints
	end 

gFldEffScript_JumpBigSplash:: @ 81D982B
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_JumpBigSplash
	end 

gFldEffScript_Splash:: @ 81D9835
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Splash
	end 

gFldEffScript_JumpSmallSplash:: @ 81D983F
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_JumpSmallSplash
	end 

gFldEffScript_LongGrass:: @ 81D9849
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_LongGrass
	end 

gFldEffScript_JumpLongGrass:: @ 81D9853
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_JumpLongGrass
	end 

gFldEffScript_Unknown19:: @ 81D985D
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Unknown19
	end 

gFldEffScript_Unknown20:: @ 81D9867
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_Unknown20
	end 

gFldEffScript_Unknown21:: @ 81D9871
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Unknown21
	end 

gFldEffScript_Unknown22:: @ 81D987B
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Unknown22
	end 

gFldEffScript_BerryTreeGrowthSparkle:: @ 81D9885
	callnative FldEff_BerryTreeGrowthSparkle
	end 

gFldEffScript_DeepSandFootprints:: @ 81D988B
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_DeepSandFootprints
	end 

gFldEffScript_PokecenterHeal:: @ 81D9895
	loadfadedpal gUnknown_83CBE9C
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_PokecenterHeal
	end 

gFldEffScript_UseSecretPowerTree:: @ 81D98A4
	end 

gFldEffScript_UseSecretPowerShrub:: @ 81D98A5
	end 

gFldEffScript_TreeDisguise:: @ 81D98A6
	callnative ShowTreeDisguiseFieldEffect
	end 

gFldEffScript_MountainDisguise:: @ 81D98AC
	callnative ShowMountainDisguiseFieldEffect
	end 

gFldEffScript_NpcflyOut:: @ 81D98B2
	callnative FldEff_NpcFlyOut
	end 

gFldEffScript_UseFly:: @ 81D98B8
	callnative FldEff_UseFly
	end 

gFldEffScript_FlyIn:: @ 81D98BE
	callnative FldEff_FlyIn
	end 

gFldEffScript_QuestionMarkIcon:: @ 81D98C4
	callnative FldEff_QuestionMarkIcon
	end 

gFldEffScript_FeetInFlowingWater:: @ 81D98CA
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_FeetInFlowingWater
	end 

gFldEffScript_BikeTireTracks:: @ 81D98D4
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_BikeTireTracks
	end 

gFldEffScript_SandDisguise:: @ 81D98DE
	callnative ShowSandDisguiseFieldEffect
	end 

gFldEffScript_UseRockSmash:: @ 81D98E4
	callnative FldEff_UseRockSmash
	end 

gFldEffScript_UseStrength:: @ 81D98EA
	callnative FldEff_UseStrength
	end 

gFldEffScript_UseDig:: @ 81D98F0
	callnative FldEff_UseDig
	end 

gFldEffScript_SandPile:: @ 81D98F6
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_SandPile
	end 

gFldEffScript_ShortGrass:: @ 81D9900
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_ShortGrass
	end 

gFldEffScript_HotSpringsWater:: @ 81D990A
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect1, FldEff_HotSpringsWater
	end 

gFldEffScript_UseWaterfall:: @ 81D9914
	callnative FldEff_UseWaterfall
	end 

gFldEffScript_UseDive:: @ 81D991A
	callnative FldEff_UseDive
	end 

gFldEffScript_Pokeball:: @ 81D9920
	loadpal sSpritePalette_SlidingPokeball
	callnative FldEff_Pokeball
	end 

gFldEffScript_HeartIcon:: @ 81D992B
	callnative FldEff_XIcon
	end 

gFldEffScript_Nop47:: @ 81D9931
	end 

gFldEffScript_Nop48:: @ 81D9932
	end 

gFldEffScript_PopOutOfAsh:: @ 81D9933
	loadfadedpal_callnative gSpritePalette_Ash, FldEff_PopOutOfAsh
	end 

gFldEffScript_LavaridgeGymWarp:: @ 81D993D
	loadfadedpal_callnative gSpritePalette_Ash, FldEff_LavaridgeGymWarp
	end 

gFldEffScript_SweetScent:: @ 81D9947
	callnative FldEff_SweetScent
	end 

gFldEffScript_SandPillar:: @ 81D994D
	end 

gFldEffScript_Bubbles:: @ 81D994E
	loadfadedpal_callnative gSpritePalette_GeneralFieldEffect0, FldEff_Bubbles
	end 

gFldEffScript_Sparkle:: @ 81D9958
	loadfadedpal_callnative gSpritePalette_SmallSparkle, FldEff_Sparkle
	end 

gFldEffScript_SecretPowerCave:: @ 81D9962
	end 

gFldEffScript_SecretPowerTree:: @ 81D9963
	end 

gFldEffScript_SecretPowerShrub:: @ 81D9964
	end 

gFldEffScript_CutGrass:: @ 81D9965
	loadfadedpal_callnative gFldEffPalette_CutGrass, FldEff_CutGrass
	end 

gFldEffScript_FieldMoveShowMonInit:: @ 81D996F
	callnative FldEff_FieldMoveShowMonInit
	end 

gFldEffScript_UseFlyAncientTomb:: @ 81D9975
	end 

gFldEffScript_PcturnOn:: @ 81D9976
	end 

gFldEffScript_HallOfFameRecord:: @ 81D9977
	loadfadedpal gUnknown_83CBE9C
	loadfadedpal_callnative gUnknown_83CBEA4, FldEff_HallOfFameRecord
	end 

gFldEffScript_UseTeleport:: @ 81D9986
	callnative FldEff_UseTeleport
	end 

gFldEffScript_SmileyFaceIcon:: @ 81D998C
	callnative FldEff_SmileyFaceIcon
	end 

gFldEffScript_UseVsSeeker:: @ 81D9992
	callnative FldEff_UseVsSeeker
	end 

gFldEffScript_DoubleExclMarkIcon:: @ 81D9998
	callnative FldEff_DoubleExclMarkIcon
	end 

gFldEffScript_MoveDeoxysRock:: @ 81D999E
	callnative FldEff_MoveDeoxysRock
	end 

gFldEffScript_Unk44:: @ 81D99A4
	callnative FldEff_Unk44
	end 

gFldEffScript_Unk45:: @ 81D99AA
	callnative FldEff_Unk45
	end 
