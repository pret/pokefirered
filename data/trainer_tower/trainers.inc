	.macro ivs hp, atk, def, speed, spatk, spdef, altability
	.4byte \hp | (\atk << 5) | (\def << 10) | (\speed << 15) | (\spatk << 20) | (\spdef << 25) | (\altability << 31)
	.endm

	.macro trainerid id, secret
	.4byte \id | (\secret << 16)
	.endm

	.macro dummy_tower_mon
	.align 2
	.2byte SPECIES_NONE, ITEM_NONE
	.2byte MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 0, 0, 0, 0, 0, 0, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "$$$$$$$$$$$", 11
	.byte 0 @ friendship
	.endm

	.macro dummy_tower_team
	.string "$", 11
	.byte FACILITY_CLASS_AQUA_LEADER, 0x01
	.align 1
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	dummy_tower_mon
	dummy_tower_mon
	dummy_tower_mon
	dummy_tower_mon
	dummy_tower_mon
	dummy_tower_mon
	.endm

	.align 2
gUnknown_847ABAC::
	.byte 0x01, 0x08, 0x00, 0x07
	.string "COLE$", 11
	.byte FACILITY_CLASS_YOUNGSTER_2, 0x01
	.align 1
	.2byte EC_WORD_AHAHA, EC_WORD_YOU_RE, EC_WORD_NOT, EC_WORD_GOING, EC_WORD_ANYWHERE, EC_WORD_EXCL
	.2byte EC_WORD_ALL_RIGHT, EC_WORD_EXCL, EC_WORD_BYE_BYE, EC_WORD_EXCL, 0xFFFF, 0xFFFF
	.2byte EC_WORD_HIYAH, EC_WORD_EXCL_EXCL, EC_WORD_DONE, EC_WORD_IN, EC_WORD_TOTALLY, EC_WORD_EXCL_EXCL
	.2byte EC_WORD_TCH, EC_WORD_TCH, EC_WORD_YOU_RE, EC_WORD_TOO_STRONG, 0xFFFF, 0xFFFF

	.align 2
	.2byte SPECIES_RATICATE, ITEM_SITRUS_BERRY
	.2byte MOVE_SHOCK_WAVE, MOVE_HYPER_FANG, MOVE_SCARY_FACE, MOVE_ENDEAVOR
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "RATICATE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGMAR, ITEM_SITRUS_BERRY
	.2byte MOVE_FIRE_PUNCH, MOVE_SUNNY_DAY, MOVE_SMOG, MOVE_STRENGTH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 0, 210, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000056 @ personality
	.string "MAGMAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGCARGO, ITEM_SITRUS_BERRY
	.2byte MOVE_FLAMETHROWER, MOVE_AMNESIA, MOVE_BODY_SLAM, MOVE_HARDEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 200, 0, 0, 200, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "MAGCARGO$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PRIMEAPE, ITEM_SITRUS_BERRY
	.2byte MOVE_OVERHEAT, MOVE_SEISMIC_TOSS, MOVE_SWAGGER, MOVE_KARATE_CHOP
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 0, 210, 200, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000087 @ personality
	.string "PRIMEAPE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLBAT, ITEM_SITRUS_BERRY
	.2byte MOVE_GIGA_DRAIN, MOVE_CONFUSE_RAY, MOVE_SLUDGE_BOMB, MOVE_MEAN_LOOK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 200, 0, 110, 200, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000081 @ personality
	.string "GOLBAT$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SLOWBRO, ITEM_SITRUS_BERRY
	.2byte MOVE_SUNNY_DAY, MOVE_YAWN, MOVE_FLAMETHROWER, MOVE_CONFUSION
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 100, 0, 210, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "SLOWBRO$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0xab, 0x6a, 0x01

	.align 2
gUnknown_847AF8C::
	.byte 0x02, 0x08, 0x00, 0x0d
	.string "JAC$", 11
	.byte FACILITY_CLASS_BURGLAR, 0x01
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_A, EC_MOVE2(THIEF), EC_WORD_EXCL, EC_WORD_GIVE_ME, EC_WORD_SOMETHING
	.2byte EC_WORD_YOU_VE, EC_WORD_GOT, EC_WORD_NOTHING, EC_WORD_THAT, EC_WORD_I, EC_WORD_WANT
	.2byte EC_WORD_EEK, EC_WORD_EXCL_EXCL, EC_WORD_I_AM, EC_WORD_SORRY, EC_WORD_I, EC_WORD_SURRENDER
	.2byte EC_WORD_I, EC_WORD_WILL, EC_WORD_STOP, EC_WORD_BEING, EC_WORD_A, EC_MOVE2(THIEF)

	.align 2
	.2byte SPECIES_MEOWTH, ITEM_LIECHI_BERRY
	.2byte MOVE_SWAGGER, MOVE_SUBSTITUTE, MOVE_FAKE_OUT, MOVE_SLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 110, 0, 200, 0, 0 @ EVs
	.align 2
	trainerid 138, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "MEOWTH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FLAREON, ITEM_PETAYA_BERRY
	.2byte MOVE_FLAMETHROWER, MOVE_BITE, MOVE_SAND_ATTACK, MOVE_FIRE_SPIN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 200, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "FLAREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PORYGON, ITEM_PETAYA_BERRY
	.2byte MOVE_TRI_ATTACK, MOVE_RECYCLE, MOVE_PSYBEAM, MOVE_CONVERSION_2
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 210, 0, 200, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "PORYGON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CHANSEY, ITEM_LUCKY_PUNCH
	.2byte MOVE_FLAMETHROWER, MOVE_LIGHT_SCREEN, MOVE_BODY_SLAM, MOVE_MINIMIZE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000010 @ personality
	.string "CHANSEY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FARFETCHD, ITEM_STICK
	.2byte MOVE_KNOCK_OFF, MOVE_SWORDS_DANCE, MOVE_FLY, MOVE_SAND_ATTACK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 100, 100, 100, 0, 110 @ EVs
	.align 2
	trainerid 133, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000085 @ personality
	.string "FARFETCH'D$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MR_MIME, ITEM_SCOPE_LENS
	.2byte MOVE_SUBSTITUTE, MOVE_SHOCK_WAVE, MOVE_LIGHT_SCREEN, MOVE_BRICK_BREAK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 130, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000082 @ personality
	.string "MR. MIME$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x56, 0x64, 0x01

	.align 2
gUnknown_847B36C::
	.byte 0x03, 0x08, 0x00, 0x02
	.string "MILY$", 11
	.byte FACILITY_CLASS_PSYCHIC_4, 0x01
	.align 1
	.2byte EC_WORD_LOOK, EC_WORD_AT, EC_WORD_MY, EC_WORD_POKEMON, EC_MOVE2(SUPERPOWER), EC_WORD_EXCL
	.2byte EC_WORD_ISN_T, EC_WORD_IT, EC_WORD_INCREDIBLE, EC_WORD_QUES, EC_WORD_POKEMON, EC_WORD_POWER
	.2byte EC_WORD_THIS, EC_WORD_IS, EC_WORD_AN, EC_WORD_AWFUL, EC_MOVE(NIGHTMARE), EC_WORD_ELLIPSIS_EXCL
	.2byte EC_WORD_THIS, EC_WORD_IS, EC_WORD_A, EC_WORD_DREAM, EC_WORD_NOTHING, EC_WORD_MORE

	.align 2
	.2byte SPECIES_CHANSEY, ITEM_ORAN_BERRY
	.2byte MOVE_LIGHT_SCREEN, MOVE_EGG_BOMB, MOVE_MINIMIZE, MOVE_SECRET_POWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000008 @ personality
	.string "CHANSEY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLEFABLE, ITEM_ORAN_BERRY
	.2byte MOVE_METRONOME, MOVE_REFLECT, MOVE_SING, MOVE_POUND
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "CLEFABLE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGETIC, ITEM_ORAN_BERRY
	.2byte MOVE_METRONOME, MOVE_REFLECT, MOVE_SWEET_KISS, MOVE_PECK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "TOGETIC$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGETIC, ITEM_ORAN_BERRY
	.2byte MOVE_METRONOME, MOVE_HIDDEN_POWER, MOVE_ATTRACT, MOVE_LIGHT_SCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000020 @ personality
	.string "TOGETIC$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CHANSEY, ITEM_ORAN_BERRY
	.2byte MOVE_FLAMETHROWER, MOVE_SOFT_BOILED, MOVE_LIGHT_SCREEN, MOVE_SECRET_POWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "CHANSEY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLEFABLE, ITEM_ORAN_BERRY
	.2byte MOVE_REFLECT, MOVE_FLAMETHROWER, MOVE_SING, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 200, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x000000C0 @ personality
	.string "CLEFABLE$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0xec, 0x64, 0x01

	.align 2
gUnknown_847B74C::
	.byte 0x04, 0x08, 0x01, 0x09
	.string "JOS & ANNE$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x07
	.align 1
	.2byte EC_WORD_I, EC_WORD_CAN_T, EC_WORD_LOSE, EC_WORD_TO, EC_WORD_YOU, EC_WORD_HERE
	.2byte EC_WORD_VERY, EC_WORD_WELL, EC_WORD_DONE, EC_WORD_EXCL, EC_WORD_GOOD, EC_WORD_BATTLE
	.2byte EC_WORD_UNBELIEVABLE, EC_WORD_ELLIPSIS, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_I_AM, EC_WORD_DISAPPOINTED, EC_WORD_BUT, EC_WORD_YOU, EC_WORD_WIN, EC_WORD_ELLIPSIS

	.align 2
	.2byte SPECIES_RAPIDASH, ITEM_WHITE_HERB
	.2byte MOVE_BOUNCE, MOVE_OVERHEAT, MOVE_HYPNOSIS, MOVE_RETURN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 100, 0, 110, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000010 @ personality
	.string "RAPIDASH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NINETALES, ITEM_CHARCOAL
	.2byte MOVE_CONFUSE_RAY, MOVE_WILL_O_WISP, MOVE_HEAT_WAVE, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 0, 200, 200, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000015 @ personality
	.string "NINETALES$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MISDREAVUS, ITEM_LEFTOVERS
	.2byte MOVE_GRUDGE, MOVE_PSYCHIC, MOVE_SHADOW_BALL, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 0, 0, 210, 100, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "MISDREAVUS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ALAKAZAM, ITEM_LEFTOVERS
	.2byte MOVE_LIGHT_SCREEN, MOVE_RECOVER, MOVE_PSYCHIC, MOVE_THUNDER_PUNCH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "ALAKAZAM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_BLISSEY, ITEM_LEFTOVERS
	.2byte MOVE_LIGHT_SCREEN, MOVE_ATTRACT, MOVE_RETURN, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "BLISSEY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CROBAT, ITEM_LEFTOVERS
	.2byte MOVE_TOXIC, MOVE_FLY, MOVE_CONFUSE_RAY, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 100, 210, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000017 @ personality
	.string "CROBAT$", 11
	.byte 255 @ friendship

	.string "JOS & ANNE$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x07
	.align 1
	.2byte EC_WORD_HERE_GOES, EC_WORD_EXCL_EXCL, EC_WORD_GET, EC_WORD_READY, EC_WORD_TO, EC_WORD_LOSE
	.2byte EC_WORD_PERFECT, EC_WORD_EXCL, EC_WORD_WE, EC_WORD_GET, EC_WORD_THE, EC_WORD_WIN
	.2byte EC_WORD_LOST, EC_WORD_QUES_EXCL, EC_WORD_YOU, EC_WORD_MUST_BE, EC_WORD_JOKING, EC_WORD_EXCL
	.2byte EC_WORD_HOW, EC_WORD_COULD, EC_WORD_I, EC_WORD_LOSE, EC_WORD_THIS, EC_WORD_QUES

	.align 2
	.2byte SPECIES_HOUNDOOM, ITEM_CHARCOAL
	.2byte MOVE_TAUNT, MOVE_FLAMETHROWER, MOVE_WILL_O_WISP, MOVE_CRUNCH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000082 @ personality
	.string "HOUNDOOM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_AERODACTYL, ITEM_LEFTOVERS
	.2byte MOVE_ROAR, MOVE_FIRE_BLAST, MOVE_HYPER_BEAM, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000033 @ personality
	.string "AERODACTYL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ARCANINE, ITEM_CHARCOAL
	.2byte MOVE_HEAT_WAVE, MOVE_EXTREME_SPEED, MOVE_ROAR, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 0, 200, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000056 @ personality
	.string "ARCANINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_WEEZING, ITEM_LEFTOVERS
	.2byte MOVE_EXPLOSION, MOVE_SMOKESCREEN, MOVE_SLUDGE_BOMB, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 100, 100, 0, 100, 110 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000008E @ personality
	.string "WEEZING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CHARIZARD, ITEM_WHITE_HERB
	.2byte MOVE_OVERHEAT, MOVE_OUTRAGE, MOVE_DRAGON_RAGE, MOVE_SMOKESCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 110, 0, 100, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000033 @ personality
	.string "CHARIZARD$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GENGAR, ITEM_LEFTOVERS
	.2byte MOVE_HYPNOSIS, MOVE_DREAM_EATER, MOVE_SHADOW_BALL, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 55, 0, 100, 255, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000087 @ personality
	.string "GENGAR$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0x08, 0x79, 0x01

	.align 2
gUnknown_847BB2C::
	.byte 0x05, 0x08, 0x01, 0x04
	.string "EMY & ALEK$", 11
	.byte FACILITY_CLASS_YOUNG_COUPLE_2, 0x01
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_SO, EC_WORD_LOST, EC_WORD_IN, EC_WORD_LOVEY_DOVEY, EC_WORD_HAPPINESS
	.2byte EC_WORD_OH, EC_WORD_OH, EC_WORD_HE, EC_WORD_IS, EC_WORD_REALLY, EC_WORD_AWESOME
	.2byte EC_WORD_AIYEEH, EC_WORD_EXCL_EXCL, EC_WORD_YOU_RE, EC_WORD_NOT, EC_WORD_SERIOUS, EC_WORD_QUES
	.2byte EC_WORD_WHO, EC_WORD_ARE, EC_WORD_YOU, EC_WORD_QUES, 0xFFFF, 0xFFFF

	.align 2
	.2byte SPECIES_TAUROS, ITEM_LUM_BERRY
	.2byte MOVE_FLAMETHROWER, MOVE_REST, MOVE_SHOCK_WAVE, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "TAUROS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_KANGASKHAN, ITEM_LUM_BERRY
	.2byte MOVE_FLAMETHROWER, MOVE_DIZZY_PUNCH, MOVE_REST, MOVE_FAKE_OUT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "KANGASKHAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FEAROW, ITEM_LUM_BERRY
	.2byte MOVE_DRILL_PECK, MOVE_TRI_ATTACK, MOVE_DOUBLE_EDGE, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 210, 100, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000094 @ personality
	.string "FEAROW$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGETIC, ITEM_LUM_BERRY
	.2byte MOVE_FLAMETHROWER, MOVE_LIGHT_SCREEN, MOVE_REST, MOVE_ANCIENT_POWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000024 @ personality
	.string "TOGETIC$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PIDGEOT, ITEM_LUM_BERRY
	.2byte MOVE_STEEL_WING, MOVE_FLY, MOVE_MIRROR_MOVE, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 110, 100, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "PIDGEOT$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_URSARING, ITEM_LUM_BERRY
	.2byte MOVE_REST, MOVE_SNORE, MOVE_DIG, MOVE_SLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "URSARING$", 11
	.byte 255 @ friendship

	.string "EMY & ALEK$", 11
	.byte FACILITY_CLASS_YOUNG_COUPLE_2, 0x01
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_GIDDY, EC_WORD_WITH, EC_WORD_LOVEY_DOVEY, EC_WORD_JOY, EC_WORD_EXCL_EXCL
	.2byte EC_WORD_SIGH, EC_WORD_ELLIPSIS, EC_WORD_MY, EC_WORD_GIRL, EC_WORD_IS, EC_WORD_CUTE
	.2byte EC_WORD_WAAAH, EC_WORD_EXCL_EXCL, EC_WORD_YOU, EC_WORD_CAN_T, EC_WORD_BE, EC_WORD_SERIOUS
	.2byte EC_WORD_WAIT, EC_WORD_ELLIPSIS, EC_WORD_WHO, EC_WORD_ARE, EC_WORD_YOU, EC_WORD_QUES

	.align 2
	.2byte SPECIES_LICKITUNG, ITEM_SHELL_BELL
	.2byte MOVE_FLAMETHROWER, MOVE_EARTHQUAKE, MOVE_REST, MOVE_SLEEP_TALK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 255, 0, 55, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "LICKITUNG$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NOCTOWL, ITEM_SHELL_BELL
	.2byte MOVE_HYPNOSIS, MOVE_DREAM_EATER, MOVE_REFLECT, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "NOCTOWL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FURRET, ITEM_SHELL_BELL
	.2byte MOVE_FLAMETHROWER, MOVE_AMNESIA, MOVE_SHOCK_WAVE, MOVE_SLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000E @ personality
	.string "FURRET$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RATICATE, ITEM_SHELL_BELL
	.2byte MOVE_SUPER_FANG, MOVE_QUICK_ATTACK, MOVE_SWAGGER, MOVE_ENDEAVOR
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "RATICATE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_WIGGLYTUFF, ITEM_SHELL_BELL
	.2byte MOVE_SUNNY_DAY, MOVE_FLAMETHROWER, MOVE_ATTRACT, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "WIGGLYTUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PORYGON2, ITEM_SHELL_BELL
	.2byte MOVE_THUNDERBOLT, MOVE_CONVERSION_2, MOVE_TRI_ATTACK, MOVE_RECOVER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "PORYGON2$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0x3b, 0x5d, 0x01

	.align 2
gUnknown_847BF0C::
	.byte 0x06, 0x08, 0x01, 0x00
	.string "JO & HALEY$", 11
	.byte FACILITY_CLASS_CRUSH_KIN, 0x05
	.align 1
	.2byte EC_WORD_WE_RE, EC_WORD_USING, EC_WORD_THAT, EC_WORD_STRATEGY, EC_WORD_OKAY, EC_WORD_QUES
	.2byte EC_WORD_YAY, EC_WORD_WE, EC_WORD_WON, EC_WORD_EXCL, EC_WORD_SORRY, EC_WORD_EXCL
	.2byte EC_WORD_AWW, EC_WORD_EXCL, EC_WORD_THAT_WAS, EC_WORD_REALLY, EC_WORD_TERRIBLE, EC_WORD_EXCL
	.2byte EC_WORD_ALL, EC_WORD_I, EC_WORD_DO, EC_WORD_IS, EC_WORD_LOSE, EC_WORD_ELLIPSIS

	.align 2
	.2byte SPECIES_SNEASEL, ITEM_SALAC_BERRY
	.2byte MOVE_SHADOW_BALL, MOVE_SUNNY_DAY, MOVE_TAUNT, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 0, 50, 210, 0, 50 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "SNEASEL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ALAKAZAM, ITEM_SALAC_BERRY
	.2byte MOVE_FIRE_PUNCH, MOVE_RECOVER, MOVE_PSYCHIC, MOVE_SUNNY_DAY
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "ALAKAZAM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HITMONTOP, ITEM_SALAC_BERRY
	.2byte MOVE_MEGA_KICK, MOVE_ENDEAVOR, MOVE_DIG, MOVE_SUNNY_DAY
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 210, 0, 200, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000008 @ personality
	.string "HITMONTOP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GIRAFARIG, ITEM_SALAC_BERRY
	.2byte MOVE_LIGHT_SCREEN, MOVE_SUNNY_DAY, MOVE_SHADOW_BALL, MOVE_PSYBEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "GIRAFARIG$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_XATU, ITEM_SALAC_BERRY
	.2byte MOVE_SUNNY_DAY, MOVE_DRILL_PECK, MOVE_CONFUSE_RAY, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 100, 100, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "XATU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MR_MIME, ITEM_SALAC_BERRY
	.2byte MOVE_REFLECT, MOVE_SUNNY_DAY, MOVE_PSYCHIC, MOVE_SHOCK_WAVE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 200, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "MR. MIME$", 11
	.byte 255 @ friendship

	.string "JO & HALEY$", 11
	.byte FACILITY_CLASS_CRUSH_KIN, 0x05
	.align 1
	.2byte EC_WORD_YOU, EC_WORD_YOU, EC_WORD_YOU, EC_WORD_BETTER, EC_WORD_NOT, EC_WORD_WIN
	.2byte EC_WORD_YOU_RE, EC_WORD_NOT, EC_WORD_JOKING, EC_WORD_QUES, EC_WORD_WE, EC_WORD_WON
	.2byte EC_WORD_WIMPY, EC_WORD_ELLIPSIS, EC_WORD_WE, EC_WORD_WERE, EC_WORD_WEAK, EC_WORD_ELLIPSIS
	.2byte EC_WORD_HAHAHA, EC_WORD_ELLIPSIS, EC_WORD_WE_RE, EC_WORD_TOTALLY, EC_WORD_USELESS, EC_WORD_ELLIPSIS

	.align 2
	.2byte SPECIES_HYPNO, ITEM_FOCUS_BAND
	.2byte MOVE_FIRE_PUNCH, MOVE_HYPNOSIS, MOVE_PSYCHIC, MOVE_NIGHTMARE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000087 @ personality
	.string "HYPNO$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HITMONCHAN, ITEM_FOCUS_BAND
	.2byte MOVE_FIRE_PUNCH, MOVE_THUNDER_PUNCH, MOVE_ICE_PUNCH, MOVE_DETECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "HITMONCHAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MACHAMP, ITEM_FOCUS_BAND
	.2byte MOVE_FLAMETHROWER, MOVE_BRICK_BREAK, MOVE_SCARY_FACE, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000043 @ personality
	.string "MACHAMP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HOUNDOOM, ITEM_FOCUS_BAND
	.2byte MOVE_ROAR, MOVE_FLAMETHROWER, MOVE_BITE, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000087 @ personality
	.string "HOUNDOOM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PRIMEAPE, ITEM_FOCUS_BAND
	.2byte MOVE_OVERHEAT, MOVE_SWAGGER, MOVE_SEISMIC_TOSS, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 100, 100, 110, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000008C @ personality
	.string "PRIMEAPE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HERACROSS, ITEM_FOCUS_BAND
	.2byte MOVE_MEGAHORN, MOVE_EARTHQUAKE, MOVE_COUNTER, MOVE_LEER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000085 @ personality
	.string "HERACROSS$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0xb1, 0x60, 0x01

	.align 2
gUnknown_847C2EC::
	.byte 0x07, 0x08, 0x02, 0x0c
	.string "JORDY$", 11
	.byte FACILITY_CLASS_BIKER, 0x03
	.align 1
	.2byte EC_WORD_DON_T, EC_WORD_MAKE, EC_WORD_ME, EC_WORD_GIGGLE, EC_WORD_YOU, EC_WORD_PUSHOVER
	.2byte EC_WORD_WHAT, EC_WORD_A_LITTLE, EC_WORD_PUSHOVER, EC_WORD_YOU, EC_WORD_ARE, EC_WORD_EXCL
	.2byte EC_WORD_YOU, EC_WORD_WERE, EC_WORD_READY, EC_WORD_TO, EC_WORD_ROCK, EC_WORD_EXCL
	.2byte EC_WORD_DARN, EC_WORD_EXCL, EC_WORD_I, EC_WORD_DON_T, EC_WORD_GET, EC_WORD_IT

	.align 2
	.2byte SPECIES_MAGBY, ITEM_LAX_INCENSE
	.2byte MOVE_SMOKESCREEN, MOVE_CONFUSE_RAY, MOVE_FLAMETHROWER, MOVE_SCREECH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 30, 30, 0, 210, 30 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000043 @ personality
	.string "MAGBY$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_CLEFFA, ITEM_LAX_INCENSE
	.2byte MOVE_ATTRACT, MOVE_CHARM, MOVE_SECRET_POWER, MOVE_FLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 210, 30, 0, 30, 30 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x000000CA @ personality
	.string "CLEFFA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_IGGLYBUFF, ITEM_LAX_INCENSE
	.2byte MOVE_SING, MOVE_HIDDEN_POWER, MOVE_CHARM, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 45, 210, 0, 45 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x000000D2 @ personality
	.string "IGGLYBUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SMOOCHUM, ITEM_LAX_INCENSE
	.2byte MOVE_FAKE_TEARS, MOVE_PSYCHIC, MOVE_MEAN_LOOK, MOVE_SING
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 45, 0, 210, 45 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "SMOOCHUM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGEPI, ITEM_LAX_INCENSE
	.2byte MOVE_SWEET_KISS, MOVE_YAWN, MOVE_ANCIENT_POWER, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 210, 45, 0, 0, 45 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000034 @ personality
	.string "TOGEPI$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_PICHU, ITEM_LAX_INCENSE
	.2byte MOVE_THUNDER_WAVE, MOVE_SHOCK_WAVE, MOVE_SWEET_KISS, MOVE_FLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 45, 0, 210, 45 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000008E @ personality
	.string "PICHU$", 11
	.byte 0 @ friendship

	.string "ERNEST$", 11
	.byte FACILITY_CLASS_BIKER, 0x01
	.align 1
	.2byte EC_WORD_IT_S, EC_WORD_SLEEP, EC_WORD_TIME, EC_WORD_FOR, EC_WORD_CHILDREN, EC_WORD_EXCL
	.2byte EC_WORD_NOT, EC_WORD_GUTSY, EC_WORD_ENOUGH, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_WHY, EC_WORD_DID, EC_WORD_YOU, EC_WORD_CRUSH, EC_WORD_ME, EC_WORD_QUES
	.2byte EC_WORD_I_AM, EC_WORD_BEAT, EC_WORD_I, EC_WORD_NEED, EC_WORD_A, EC_WORD_NAP

	.align 2
	.2byte SPECIES_CLEFFA, ITEM_QUICK_CLAW
	.2byte MOVE_SWEET_KISS, MOVE_FRUSTRATION, MOVE_SING, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 210, 45, 0, 0, 45 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x000000CA @ personality
	.string "CLEFFA$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_MAGBY, ITEM_QUICK_CLAW
	.2byte MOVE_FRUSTRATION, MOVE_CONFUSE_RAY, MOVE_FLAMETHROWER, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 90, 210, 0, 0, 210, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000004D @ personality
	.string "MAGBY$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_TOGEPI, ITEM_QUICK_CLAW
	.2byte MOVE_FRUSTRATION, MOVE_DOUBLE_TEAM, MOVE_TOXIC, MOVE_SWEET_KISS
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 210, 45, 0, 0, 45 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000034 @ personality
	.string "TOGEPI$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_SMOOCHUM, ITEM_QUICK_CLAW
	.2byte MOVE_MEAN_LOOK, MOVE_PERISH_SONG, MOVE_TOXIC, MOVE_FLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 90, 0, 210, 0, 0, 210 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "SMOOCHUM$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_IGGLYBUFF, ITEM_QUICK_CLAW
	.2byte MOVE_DOUBLE_TEAM, MOVE_SWEET_KISS, MOVE_SEISMIC_TOSS, MOVE_FLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 45, 210, 0, 45 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "IGGLYBUFF$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_PICHU, ITEM_QUICK_CLAW
	.2byte MOVE_TAIL_WHIP, MOVE_FRUSTRATION, MOVE_ATTRACT, MOVE_THUNDER_WAVE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 90, 210, 0, 210, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "PICHU$", 11
	.byte 0 @ friendship

	.string "GABRIEL$", 11
	.byte FACILITY_CLASS_CUE_BALL, 0x01
	.align 1
	.2byte EC_WORD_YAHOO, EC_WORD_EXCL, EC_WORD_HERE_I_COME, EC_WORD_TO, EC_WORD_SWARM, EC_WORD_YOU
	.2byte EC_WORD_I_AM, EC_WORD_INVINCIBLE, EC_WORD_YOU, EC_WORD_GOT, EC_WORD_THAT, EC_WORD_QUES
	.2byte EC_WORD_WHAT, EC_WORD_WAS, EC_WORD_THAT, EC_WORD_QUES, 0xFFFF, 0xFFFF
	.2byte EC_WORD_I_AM, EC_WORD_GOING, EC_WORD_TO, EC_WORD_WIN, EC_WORD_NEXT, EC_WORD_TIME

	.align 2
	.2byte SPECIES_PICHU, ITEM_BRIGHT_POWDER
	.2byte MOVE_THUNDER_WAVE, MOVE_FRUSTRATION, MOVE_THUNDERBOLT, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 90, 210, 0, 0, 210, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000081 @ personality
	.string "PICHU$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_TOGEPI, ITEM_BRIGHT_POWDER
	.2byte MOVE_ATTRACT, MOVE_FRUSTRATION, MOVE_TOXIC, MOVE_SUBSTITUTE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 210, 0, 0, 0, 90 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000033 @ personality
	.string "TOGEPI$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_CLEFFA, ITEM_BRIGHT_POWDER
	.2byte MOVE_ENCORE, MOVE_TOXIC, MOVE_DOUBLE_TEAM, MOVE_FLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 150, 0, 0, 150 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x000000CF @ personality
	.string "CLEFFA$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_IGGLYBUFF, ITEM_BRIGHT_POWDER
	.2byte MOVE_ATTRACT, MOVE_SUBSTITUTE, MOVE_SING, MOVE_PERISH_SONG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 210, 0, 0, 90 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x000000CF @ personality
	.string "IGGLYBUFF$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_SMOOCHUM, ITEM_BRIGHT_POWDER
	.2byte MOVE_SWEET_KISS, MOVE_PERISH_SONG, MOVE_TOXIC, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "SMOOCHUM$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_MAGBY, ITEM_BRIGHT_POWDER
	.2byte MOVE_LEER, MOVE_FRUSTRATION, MOVE_SUBSTITUTE, MOVE_FLAMETHROWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 90, 210, 0, 0, 210, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000004D @ personality
	.string "MAGBY$", 11
	.byte 0 @ friendship

	.byte 0x4a, 0x7a, 0x01

	.align 2
gUnknown_847C6CC::
	.byte 0x08, 0x08, 0x02, 0x0e
	.string "MIKE$", 11
	.byte FACILITY_CLASS_HIKER_2, 0x05
	.align 1
	.2byte EC_WORD_MY, EC_WORD_POKEMON, EC_WORD_ARE, EC_WORD_FULL, EC_WORD_OF, EC_WORD_POWER
	.2byte EC_WORD_WHAT_S_UP_QUES, EC_WORD_WHERE, EC_WORD_IS, EC_WORD_YOUR, EC_WORD_POWER, EC_WORD_QUES
	.2byte EC_WORD_YOU, EC_WORD_GOT, EC_WORD_ME, EC_WORD_WITH, EC_WORD_YOUR, EC_MOVE2(FAKE_OUT)
	.2byte EC_WORD_OH_YEAH, EC_WORD_EXCL, EC_WORD_THAT_S, EC_WORD_PRETTY, EC_WORD_EXCELLENT, EC_WORD_EXCL

	.align 2
	.2byte SPECIES_PINSIR, ITEM_SCOPE_LENS
	.2byte MOVE_GUILLOTINE, MOVE_BRICK_BREAK, MOVE_DIG, MOVE_REVENGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 210, 0, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "PINSIR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CHARIZARD, ITEM_SCOPE_LENS
	.2byte MOVE_DRAGON_CLAW, MOVE_METAL_CLAW, MOVE_AERIAL_ACE, MOVE_OUTRAGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 200, 0, 110, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000035 @ personality
	.string "CHARIZARD$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RHYDON, ITEM_SCOPE_LENS
	.2byte MOVE_MEGAHORN, MOVE_HORN_DRILL, MOVE_CRUSH_CLAW, MOVE_BRICK_BREAK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 210, 200, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000009 @ personality
	.string "RHYDON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ARCANINE, ITEM_SCOPE_LENS
	.2byte MOVE_EXTREME_SPEED, MOVE_IRON_TAIL, MOVE_AERIAL_ACE, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 200, 0, 200, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000003F @ personality
	.string "ARCANINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLEM, ITEM_SCOPE_LENS
	.2byte MOVE_DOUBLE_EDGE, MOVE_ROLLOUT, MOVE_BRICK_BREAK, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 210, 200, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "GOLEM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HOUNDOOM, ITEM_SCOPE_LENS
	.2byte MOVE_CRUNCH, MOVE_REVERSAL, MOVE_DOUBLE_EDGE, MOVE_COUNTER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 110, 200, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 1 @ IVs, ability
	.4byte 0x00000008 @ personality
	.string "HOUNDOOM$", 11
	.byte 255 @ friendship

	.string "REBECCA$", 11
	.byte FACILITY_CLASS_CRUSH_GIRL, 0x05
	.align 1
	.2byte EC_WORD_I, EC_WORD_WILL, EC_WORD_WIN, EC_WORD_EXCL_EXCL, 0xFFFF, 0xFFFF
	.2byte EC_WORD_IT_S, EC_WORD_TOO, EC_WORD_BAD, EC_WORD_BUT, EC_WORD_I_AM, EC_WORD_OVERWHELMING
	.2byte EC_WORD_ARRGH, EC_WORD_EXCL_EXCL, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_YOU, EC_WORD_ANGER, EC_WORD_ME, EC_WORD_BUT, EC_WORD_YOU_RE, EC_WORD_TOUGH

	.align 2
	.2byte SPECIES_SANDSLASH, ITEM_SILK_SCARF
	.2byte MOVE_CRUSH_CLAW, MOVE_DIG, MOVE_DOUBLE_EDGE, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "SANDSLASH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DRAGONAIR, ITEM_SILK_SCARF
	.2byte MOVE_OUTRAGE, MOVE_IRON_TAIL, MOVE_DOUBLE_EDGE, MOVE_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "DRAGONAIR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RAPIDASH, ITEM_SILK_SCARF
	.2byte MOVE_BOUNCE, MOVE_IRON_TAIL, MOVE_THRASH, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 1 @ IVs, ability
	.4byte 0x00000094 @ personality
	.string "RAPIDASH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FLAREON, ITEM_SILK_SCARF
	.2byte MOVE_IRON_TAIL, MOVE_FLAIL, MOVE_BITE, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000021 @ personality
	.string "FLAREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDOQUEEN, ITEM_SILK_SCARF
	.2byte MOVE_SUPERPOWER, MOVE_AERIAL_ACE, MOVE_BRICK_BREAK, MOVE_COUNTER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000017 @ personality
	.string "NIDOQUEEN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PERSIAN, ITEM_SILK_SCARF
	.2byte MOVE_RETURN, MOVE_AERIAL_ACE, MOVE_IRON_TAIL, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 200, 0, 200, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "PERSIAN$", 11
	.byte 255 @ friendship

	.string "NICOLAS$", 11
	.byte FACILITY_CLASS_BLACK_BELT_2, 0x05
	.align 1
	.2byte EC_WORD_THIS, EC_WORD_IS, EC_WORD_WHERE, EC_WORD_YOU, EC_WORD_STOP, EC_WORD_EXCL
	.2byte EC_WORD_YOU_RE, EC_WORD_TOO_WEAK, EC_WORD_TO, EC_WORD_EVER, EC_WORD_BEAT, EC_WORD_ME
	.2byte EC_WORD_WHY, EC_WORD_COULDN_T, EC_WORD_I, EC_WORD_BEAT, EC_WORD_YOU, EC_WORD_QUES
	.2byte EC_WORD_I, EC_WORD_HAVE, EC_WORD_TO, EC_WORD_TRAIN, EC_WORD_SOME, EC_WORD_MORE

	.align 2
	.2byte SPECIES_HITMONLEE, ITEM_KINGS_ROCK
	.2byte MOVE_MEGA_KICK, MOVE_REVERSAL, MOVE_FOCUS_PUNCH, MOVE_BRICK_BREAK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000008 @ personality
	.string "HITMONLEE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SCYTHER, ITEM_KINGS_ROCK
	.2byte MOVE_SLASH, MOVE_REVERSAL, MOVE_STEEL_WING, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000017 @ personality
	.string "SCYTHER$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGMAR, ITEM_KINGS_ROCK
	.2byte MOVE_FIRE_PUNCH, MOVE_THUNDER_PUNCH, MOVE_BRICK_BREAK, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000053 @ personality
	.string "MAGMAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MACHAMP, ITEM_KINGS_ROCK
	.2byte MOVE_DYNAMIC_PUNCH, MOVE_DIG, MOVE_CROSS_CHOP, MOVE_REVENGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000003F @ personality
	.string "MACHAMP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PRIMEAPE, ITEM_KINGS_ROCK
	.2byte MOVE_THRASH, MOVE_CROSS_CHOP, MOVE_IRON_TAIL, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 200, 110, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000008 @ personality
	.string "PRIMEAPE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_POLIWRATH, ITEM_KINGS_ROCK
	.2byte MOVE_BODY_SLAM, MOVE_DIG, MOVE_MEGA_KICK, MOVE_COUNTER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "POLIWRATH$", 11
	.byte 255 @ friendship

	.byte 0x05, 0x6f, 0x01

	.align 2
gUnknown_847CAAC::
	.byte 0x09, 0x08, 0x00, 0x00
	.string "JOEY$", 11
	.byte FACILITY_CLASS_CAMPER_2, 0x01
	.align 1
	.2byte EC_WORD_MY, EC_WORD_POKEMON, EC_WORD_ARE, EC_WORD_SCARY, EC_WORD_STRONG, EC_WORD_EXCL
	.2byte EC_WORD_WERE, EC_WORD_MY, EC_WORD_POKEMON, EC_WORD_TOO, EC_WORD_MUCH, EC_WORD_QUES
	.2byte EC_WORD_YOUR, EC_WORD_POKEMON, EC_WORD_ARE, EC_WORD_WAY, EC_WORD_TOO_STRONG, EC_WORD_EXCL
	.2byte EC_WORD_THE, EC_WORD_WAY, EC_WORD_POKEMON, EC_WORD_MATCH_UP, EC_WORD_IS, EC_WORD_IMPORTANT

	.align 2
	.2byte SPECIES_MURKROW, ITEM_BLACK_GLASSES
	.2byte MOVE_FAINT_ATTACK, MOVE_AERIAL_ACE, MOVE_SHADOW_BALL, MOVE_CONFUSE_RAY
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "MURKROW$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TAUROS, ITEM_SILK_SCARF
	.2byte MOVE_EARTHQUAKE, MOVE_BODY_SLAM, MOVE_ROCK_TOMB, MOVE_PURSUIT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "TAUROS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SLOWBRO, ITEM_MYSTIC_WATER
	.2byte MOVE_AMNESIA, MOVE_PSYCHIC, MOVE_SURF, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "SLOWBRO$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ARBOK, ITEM_POISON_BARB
	.2byte MOVE_IRON_TAIL, MOVE_SLUDGE_BOMB, MOVE_ROCK_SLIDE, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "ARBOK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDOKING, ITEM_SOFT_SAND
	.2byte MOVE_EARTHQUAKE, MOVE_MEGAHORN, MOVE_SLUDGE_BOMB, MOVE_ROCK_SLIDE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "NIDOKING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RAPIDASH, ITEM_CHARCOAL
	.2byte MOVE_FLAMETHROWER, MOVE_BOUNCE, MOVE_QUICK_ATTACK, MOVE_DOUBLE_KICK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "RAPIDASH$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x17, 0x64, 0x01

	.align 2
gUnknown_847CE8C::
	.byte 0x0a, 0x08, 0x00, 0x0c
	.string "LILY$", 11
	.byte FACILITY_CLASS_PKMN_BREEDER_3, 0x01
	.align 1
	.2byte EC_WORD_I, EC_WORD_WANT, EC_WORD_SOMETHING, EC_WORD_IN, EC_MOVE(RETURN), EC_WORD_EXCL
	.2byte EC_WORD_I, EC_WORD_BELIEVE, EC_WORD_IN, EC_WORD_MY, EC_WORD_POKEMON, EC_WORD_EXCL
	.2byte EC_WORD_I, EC_WORD_NEED, EC_WORD_SOMETHING, EC_WORD_IN, EC_MOVE(RETURN), EC_WORD_ELLIPSIS
	.2byte EC_WORD_MY, EC_WORD_POKEMON, EC_WORD_HAVE, EC_WORD_MY, EC_WORD_TRUST, EC_WORD_FOREVER

	.align 2
	.2byte SPECIES_CLEFAIRY, ITEM_SITRUS_BERRY
	.2byte MOVE_CHARM, MOVE_METRONOME, MOVE_RETURN, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "CLEFAIRY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGEPI, ITEM_SITRUS_BERRY
	.2byte MOVE_CHARM, MOVE_METRONOME, MOVE_RETURN, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "TOGEPI$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MEOWTH, ITEM_SILK_SCARF
	.2byte MOVE_CHARM, MOVE_ASSIST, MOVE_RETURN, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "MEOWTH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_JIGGLYPUFF, ITEM_SILK_SCARF
	.2byte MOVE_CHARM, MOVE_ROLLOUT, MOVE_RETURN, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "JIGGLYPUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SNORLAX, ITEM_LEFTOVERS
	.2byte MOVE_CHARM, MOVE_ROLLOUT, MOVE_RETURN, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000025 @ personality
	.string "SNORLAX$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SNUBBULL, ITEM_LEFTOVERS
	.2byte MOVE_CHARM, MOVE_LICK, MOVE_RETURN, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "SNUBBULL$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0xb7, 0x6c, 0x01

	.align 2
gUnknown_847D26C::
	.byte 0x0b, 0x08, 0x00, 0x0e
	.string "BRANDON$", 11
	.byte FACILITY_CLASS_BUG_CATCHER_2, 0x01
	.align 1
	.2byte EC_WORD_POISON, EC_WORD_IS, EC_WORD_JUST, EC_WORD_SO, EC_WORD_AWFUL, EC_WORD_ISN_T_IT_QUES
	.2byte EC_WORD_SEE, EC_WORD_QUES, EC_WORD_ISN_T, EC_WORD_POISON, EC_WORD_TERRIBLE, EC_WORD_QUES
	.2byte EC_WORD_HUH_QUES, EC_WORD_OUR, EC_WORD_POISON, EC_WORD_DIDN_T, EC_WORD_WORK, EC_WORD_QUES
	.2byte EC_WORD_POISON, EC_WORD_IS, EC_WORD_A, EC_WORD_TERRIBLE, EC_MOVE(TORMENT), EC_WORD_ISN_T_IT_QUES

	.align 2
	.2byte SPECIES_BUTTERFREE, ITEM_BRIGHT_POWDER
	.2byte MOVE_SILVER_WIND, MOVE_SLEEP_POWDER, MOVE_PSYCHIC, MOVE_SUPERSONIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "BUTTERFREE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_BEEDRILL, ITEM_BRIGHT_POWDER
	.2byte MOVE_SLUDGE_BOMB, MOVE_TWINEEDLE, MOVE_DOUBLE_TEAM, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "BEEDRILL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PARASECT, ITEM_BRIGHT_POWDER
	.2byte MOVE_GIGA_DRAIN, MOVE_LIGHT_SCREEN, MOVE_STUN_SPORE, MOVE_SLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "PARASECT$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_YANMA, ITEM_BRIGHT_POWDER
	.2byte MOVE_HYPNOSIS, MOVE_SONIC_BOOM, MOVE_QUICK_ATTACK, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 1 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "YANMA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SHUCKLE, ITEM_SITRUS_BERRY
	.2byte MOVE_TOXIC, MOVE_ROCK_TOMB, MOVE_PROTECT, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "SHUCKLE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FORRETRESS, ITEM_SITRUS_BERRY
	.2byte MOVE_TOXIC, MOVE_GIGA_DRAIN, MOVE_PROTECT, MOVE_SANDSTORM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "FORRETRESS$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x1f, 0x6e, 0x01

	.align 2
gUnknown_847D64C::
	.byte 0x0c, 0x08, 0x01, 0x02
	.string "RIC & RENE$", 11
	.byte FACILITY_CLASS_CRUSH_KIN, 0x05
	.align 1
	.2byte EC_WORD_MY, EC_WORD_BIG, EC_WORD_BROTHER, EC_WORD_IS, EC_WORD_REALLY, EC_WORD_AWESOME
	.2byte EC_WORD_MY, EC_WORD_BIG, EC_WORD_BROTHER, EC_WORD_IS, EC_WORD_TOO, EC_WORD_AWESOME
	.2byte EC_WORD_MY, EC_WORD_BIG, EC_WORD_BROTHER, EC_WORD_ISN_T, EC_WORD_AWESOME, EC_WORD_QUES
	.2byte EC_WORD_BIG, EC_WORD_BROTHER, EC_WORD_FIGHT, EC_WORD_EXCL, 0xFFFF, 0xFFFF

	.align 2
	.2byte SPECIES_HITMONLEE, ITEM_SCOPE_LENS
	.2byte MOVE_ROCK_TOMB, MOVE_HI_JUMP_KICK, MOVE_BULK_UP, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "HITMONLEE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RHYDON, ITEM_SHELL_BELL
	.2byte MOVE_MEGAHORN, MOVE_ROCK_BLAST, MOVE_BRICK_BREAK, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000007F @ personality
	.string "RHYDON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLEM, ITEM_SCOPE_LENS
	.2byte MOVE_BRICK_BREAK, MOVE_ROCK_BLAST, MOVE_DIG, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "GOLEM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGMAR, ITEM_SHELL_BELL
	.2byte MOVE_FIRE_PUNCH, MOVE_BRICK_BREAK, MOVE_CONFUSE_RAY, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000004F @ personality
	.string "MAGMAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HERACROSS, ITEM_FOCUS_BAND
	.2byte MOVE_MEGAHORN, MOVE_BRICK_BREAK, MOVE_ROCK_TOMB, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000007F @ personality
	.string "HERACROSS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_POLIWRATH, ITEM_SCOPE_LENS
	.2byte MOVE_FOCUS_PUNCH, MOVE_SURF, MOVE_BULK_UP, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000097 @ personality
	.string "POLIWRATH$", 11
	.byte 255 @ friendship

	.string "RIC & RENE$", 11
	.byte FACILITY_CLASS_CRUSH_KIN, 0x05
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_REALLY, EC_WORD_AWESOME, EC_WORD_EXCL, 0xFFFF, 0xFFFF
	.2byte EC_WORD_I_AM, EC_WORD_TOO, EC_WORD_AWESOME, EC_WORD_EXCL, 0xFFFF, 0xFFFF
	.2byte EC_WORD_HUH_QUES, 0xFFFF, EC_WORD_I_AM, EC_WORD_NOT_VERY, EC_WORD_AWESOME, EC_WORD_QUES
	.2byte EC_WORD_I, EC_WORD_WILL, EC_WORD_DO, EC_WORD_MY, EC_WORD_BEST, EC_WORD_EXCL

	.align 2
	.2byte SPECIES_MACHAMP, ITEM_SCOPE_LENS
	.2byte MOVE_CROSS_CHOP, MOVE_SEISMIC_TOSS, MOVE_ROCK_TOMB, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000004E @ personality
	.string "MACHAMP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PINSIR, ITEM_FOCUS_BAND
	.2byte MOVE_ROCK_TOMB, MOVE_SEISMIC_TOSS, MOVE_SUBMISSION, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "PINSIR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAROWAK, ITEM_SHELL_BELL
	.2byte MOVE_BRICK_BREAK, MOVE_BONEMERANG, MOVE_AERIAL_ACE, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "MAROWAK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HITMONCHAN, ITEM_SCOPE_LENS
	.2byte MOVE_MACH_PUNCH, MOVE_THUNDER_PUNCH, MOVE_DOUBLE_TEAM, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "HITMONCHAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ELECTABUZZ, ITEM_SHELL_BELL
	.2byte MOVE_THUNDER_PUNCH, MOVE_BRICK_BREAK, MOVE_THUNDER_WAVE, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000004F @ personality
	.string "ELECTABUZZ$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_POLIWRATH, ITEM_SCOPE_LENS
	.2byte MOVE_FOCUS_PUNCH, MOVE_SURF, MOVE_BULK_UP, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000097 @ personality
	.string "POLIWRATH$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0xb4, 0x66, 0x01

	.align 2
gUnknown_847DA2C::
	.byte 0x0d, 0x08, 0x01, 0x0d
	.string "JEN & KIRA$", 11
	.byte FACILITY_CLASS_TWINS_2, 0x05
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_GOING, EC_WORD_TO, EC_WORD_TRY, EC_WORD_HARD, EC_WORD_EXCL
	.2byte EC_WORD_EHEHE, EC_WORD_YAY, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_WAAAH, EC_WORD_EXCL, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_I, EC_WORD_WILL, EC_WORD_TRY, EC_WORD_TO, EC_WORD_GET, EC_WORD_BETTER

	.align 2
	.2byte SPECIES_JOLTEON, ITEM_QUICK_CLAW
	.2byte MOVE_QUICK_ATTACK, MOVE_THUNDERBOLT, MOVE_DOUBLE_KICK, MOVE_PIN_MISSILE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000029 @ personality
	.string "JOLTEON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ESPEON, ITEM_QUICK_CLAW
	.2byte MOVE_QUICK_ATTACK, MOVE_PSYCHIC, MOVE_SHADOW_BALL, MOVE_BITE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000029 @ personality
	.string "ESPEON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FLAREON, ITEM_QUICK_CLAW
	.2byte MOVE_QUICK_ATTACK, MOVE_FLAMETHROWER, MOVE_SHADOW_BALL, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000033 @ personality
	.string "FLAREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VAPOREON, ITEM_QUICK_CLAW
	.2byte MOVE_QUICK_ATTACK, MOVE_WATERFALL, MOVE_ICE_BEAM, MOVE_BITE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000010 @ personality
	.string "VAPOREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_EEVEE, ITEM_QUICK_CLAW
	.2byte MOVE_QUICK_ATTACK, MOVE_DOUBLE_EDGE, MOVE_BITE, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000010 @ personality
	.string "EEVEE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_UMBREON, ITEM_QUICK_CLAW
	.2byte MOVE_QUICK_ATTACK, MOVE_FAINT_ATTACK, MOVE_SHADOW_BALL, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000010 @ personality
	.string "UMBREON$", 11
	.byte 255 @ friendship

	.string "JEN & KIRA$", 11
	.byte FACILITY_CLASS_TWINS_2, 0x03
	.align 1
	.2byte EC_WORD_LET_S, EC_WORD_TRY, EC_WORD_HARD, EC_WORD_EXCL, 0xFFFF, 0xFFFF
	.2byte EC_WORD_GIGGLE, EC_WORD_ELLIPSIS, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_WAAAH, EC_WORD_EXCL, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_WE, EC_WORD_HAVE, EC_WORD_TO, EC_WORD_WORK, EC_WORD_BETTER, 0xFFFF

	.align 2
	.2byte SPECIES_JOLTEON, ITEM_BRIGHT_POWDER
	.2byte MOVE_GROWL, MOVE_TAIL_WHIP, MOVE_HELPING_HAND, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 10, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "JOLTEON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ESPEON, ITEM_BRIGHT_POWDER
	.2byte MOVE_LIGHT_SCREEN, MOVE_REFLECT, MOVE_HELPING_HAND, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 10, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "ESPEON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FLAREON, ITEM_BRIGHT_POWDER
	.2byte MOVE_GROWL, MOVE_TAIL_WHIP, MOVE_HELPING_HAND, MOVE_FLAMETHROWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 13, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "FLAREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VAPOREON, ITEM_BRIGHT_POWDER
	.2byte MOVE_GROWL, MOVE_TAIL_WHIP, MOVE_HELPING_HAND, MOVE_SURF
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 35, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000023 @ personality
	.string "VAPOREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_EEVEE, ITEM_BRIGHT_POWDER
	.2byte MOVE_GROWL, MOVE_TAIL_WHIP, MOVE_HELPING_HAND, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 35, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000023 @ personality
	.string "EEVEE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_UMBREON, ITEM_BRIGHT_POWDER
	.2byte MOVE_GROWL, MOVE_TAIL_WHIP, MOVE_HELPING_HAND, MOVE_FAINT_ATTACK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 35, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000023 @ personality
	.string "UMBREON$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0xc2, 0x7f, 0x01

	.align 2
gUnknown_847DE0C::
	.byte 0x0e, 0x08, 0x01, 0x08
	.string "ISAC & MAG$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x01
	.align 1
	.2byte EC_WORD_OUR, EC_MOVE(EARTHQUAKE), EC_WORD_WILL, EC_WORD_MAKE, EC_WORD_YOU, EC_WORD_SHAKY
	.2byte EC_WORD_FEELING, EC_WORD_SHAKY, EC_WORD_HUH_QUES, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_I_AM, EC_WORD_ALL, EC_WORD_SHAKY, EC_WORD_ELLIPSIS, 0xFFFF, 0xFFFF
	.2byte EC_WORD_MY, EC_WORD_GIRL, EC_WORD_ISN_T, EC_WORD_SHAKY, EC_WORD_SHE_IS, EC_WORD_LOVEY_DOVEY

	.align 2
	.2byte SPECIES_NIDOKING, ITEM_SOFT_SAND
	.2byte MOVE_EARTHQUAKE, MOVE_MEGAHORN, MOVE_SHADOW_BALL, MOVE_FIRE_BLAST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "NIDOKING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GLIGAR, ITEM_SOFT_SAND
	.2byte MOVE_EARTHQUAKE, MOVE_QUICK_ATTACK, MOVE_AERIAL_ACE, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "GLIGAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_QUAGSIRE, ITEM_SOFT_SAND
	.2byte MOVE_EARTHQUAKE, MOVE_SLUDGE_BOMB, MOVE_BLIZZARD, MOVE_BRICK_BREAK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "QUAGSIRE$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_PILOSWINE, ITEM_SOFT_SAND
	.2byte MOVE_EARTHQUAKE, MOVE_BLIZZARD, MOVE_ANCIENT_POWER, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "PILOSWINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLEM, ITEM_SOFT_SAND
	.2byte MOVE_EARTHQUAKE, MOVE_ROCK_BLAST, MOVE_BRICK_BREAK, MOVE_EXPLOSION
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "GOLEM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_STEELIX, ITEM_SOFT_SAND
	.2byte MOVE_EARTHQUAKE, MOVE_IRON_TAIL, MOVE_DRAGON_BREATH, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "STEELIX$", 11
	.byte 255 @ friendship

	.string "ISAC & MAG$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x01
	.align 1
	.2byte EC_WORD_MY, EC_WORD_POKEMON, EC_WORD_DOESN_T, EC_WORD_GET, EC_WORD_ALL, EC_WORD_SHAKY
	.2byte EC_WORD_SEE, EC_WORD_QUES, EC_WORD_I, EC_WORD_DIDN_T, EC_WORD_LIE, EC_WORD_EXCL
	.2byte EC_WORD_HUH_QUES, EC_WORD_YOU, EC_WORD_LEFT, EC_WORD_ME, EC_WORD_FEELING, EC_WORD_SHAKY
	.2byte EC_WORD_I_AM, EC_WORD_LOVEY_DOVEY, EC_WORD_FOR, EC_WORD_HIM, EC_WORD_NOT, EC_WORD_SHAKY

	.align 2
	.2byte SPECIES_SKARMORY, ITEM_KINGS_ROCK
	.2byte MOVE_SANDSTORM, MOVE_STEEL_WING, MOVE_AIR_CUTTER, MOVE_SPIKES
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "SKARMORY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MANTINE, ITEM_LUM_BERRY
	.2byte MOVE_ICE_BEAM, MOVE_SURF, MOVE_CONFUSE_RAY, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "MANTINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_JUMPLUFF, ITEM_LUM_BERRY
	.2byte MOVE_TAIL_WHIP, MOVE_SUNNY_DAY, MOVE_SOLAR_BEAM, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "JUMPLUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GENGAR, ITEM_KINGS_ROCK
	.2byte MOVE_SHADOW_BALL, MOVE_SLUDGE_BOMB, MOVE_THUNDERBOLT, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "GENGAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CROBAT, ITEM_KINGS_ROCK
	.2byte MOVE_GIGA_DRAIN, MOVE_POISON_FANG, MOVE_FLY, MOVE_STEEL_WING
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "CROBAT$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_XATU, ITEM_LUM_BERRY
	.2byte MOVE_PSYCHIC, MOVE_CONFUSE_RAY, MOVE_AERIAL_ACE, MOVE_LIGHT_SCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "XATU$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0xb0, 0x6b, 0x01

	.align 2
gUnknown_847E1EC::
	.byte 0x0f, 0x08, 0x02, 0x06
	.string "CHELSEA$", 11
	.byte FACILITY_CLASS_PKMN_RANGER_4, 0x07
	.align 1
	.2byte EC_WORD_THE, EC_WORD_GREEN, EC_WORD_WORLD, EC_WORD_IS, EC_WORD_IMPORTANT, EC_WORD_ISN_T_IT_QUES
	.2byte EC_WORD_YOU, EC_WORD_TAKE, EC_WORD_THE, EC_WORD_LOSS, 0xFFFF, 0xFFFF
	.2byte EC_WORD_BE, EC_WORD_KIND, EC_WORD_TO, EC_WORD_THE, EC_WORD_GREEN, EC_WORD_WORLD
	.2byte EC_WORD_DON_T, EC_WORD_EVER, EC_WORD_POISON, EC_WORD_THE, EC_WORD_GREEN, EC_WORD_WORLD

	.align 2
	.2byte SPECIES_VILEPLUME, ITEM_PETAYA_BERRY
	.2byte MOVE_INGRAIN, MOVE_GIGA_DRAIN, MOVE_SLUDGE_BOMB, MOVE_STUN_SPORE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "VILEPLUME$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_STARMIE, ITEM_PETAYA_BERRY
	.2byte MOVE_PSYCHIC, MOVE_ICE_BEAM, MOVE_WATERFALL, MOVE_RECOVER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000010 @ personality
	.string "STARMIE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_URSARING, ITEM_LIECHI_BERRY
	.2byte MOVE_FAINT_ATTACK, MOVE_BODY_SLAM, MOVE_BRICK_BREAK, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000001 @ personality
	.string "URSARING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NOCTOWL, ITEM_LIECHI_BERRY
	.2byte MOVE_HYPNOSIS, MOVE_DREAM_EATER, MOVE_FAINT_ATTACK, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000001 @ personality
	.string "NOCTOWL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NINETALES, ITEM_PETAYA_BERRY
	.2byte MOVE_GRUDGE, MOVE_OVERHEAT, MOVE_FAINT_ATTACK, MOVE_WILL_O_WISP
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000010 @ personality
	.string "NINETALES$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_LEDIAN, ITEM_LIECHI_BERRY
	.2byte MOVE_SILVER_WIND, MOVE_SWIFT, MOVE_AERIAL_ACE, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000001 @ personality
	.string "LEDIAN$", 11
	.byte 255 @ friendship

	.string "TRENTON$", 11
	.byte FACILITY_CLASS_PKMN_RANGER_3, 0x07
	.align 1
	.2byte EC_WORD_I, EC_MOVE2(PROTECT), EC_WORD_THE, EC_WORD_GREAT, EC_WORD_GREEN, EC_WORD_WORLD
	.2byte EC_WORD_TAKE_THAT, EC_WORD_EXCL, EC_WORD_THE, EC_WORD_LOSS, EC_WORD_IS, EC_WORD_YOURS
	.2byte EC_MOVE2(PROTECT), EC_WORD_THE, EC_WORD_GREEN, EC_WORD_WORLD, 0xFFFF, 0xFFFF
	.2byte EC_MOVE2(PROTECT), EC_WORD_AND, EC_WORD_RESUSCITATE, EC_WORD_THE, EC_WORD_GREEN, EC_WORD_WORLD

	.align 2
	.2byte SPECIES_GYARADOS, ITEM_SITRUS_BERRY
	.2byte MOVE_EARTHQUAKE, MOVE_WATERFALL, MOVE_BLIZZARD, MOVE_HYPER_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000088 @ personality
	.string "GYARADOS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VICTREEBEL, ITEM_SITRUS_BERRY
	.2byte MOVE_GIGA_DRAIN, MOVE_SLUDGE_BOMB, MOVE_REFLECT, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000008E @ personality
	.string "VICTREEBEL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DONPHAN, ITEM_SITRUS_BERRY
	.2byte MOVE_EARTHQUAKE, MOVE_ANCIENT_POWER, MOVE_IRON_TAIL, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000097 @ personality
	.string "DONPHAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FEAROW, ITEM_SITRUS_BERRY
	.2byte MOVE_FAINT_ATTACK, MOVE_DRILL_PECK, MOVE_STEEL_WING, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000097 @ personality
	.string "FEAROW$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ARCANINE, ITEM_SITRUS_BERRY
	.2byte MOVE_EXTREME_SPEED, MOVE_FIRE_BLAST, MOVE_CRUNCH, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000004F @ personality
	.string "ARCANINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ARIADOS, ITEM_SITRUS_BERRY
	.2byte MOVE_PSYCHIC, MOVE_SLUDGE_BOMB, MOVE_SIGNAL_BEAM, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000097 @ personality
	.string "ARIADOS$", 11
	.byte 255 @ friendship

	.string "ALBERT$", 11
	.byte FACILITY_CLASS_COOLTRAINER_3, 0x07
	.align 1
	.2byte EC_WORD_LET_S, EC_WORD_HAVE, EC_WORD_AN, EC_WORD_EXCITING, EC_WORD_TIME, EC_WORD_HERE
	.2byte EC_WORD_YOU_RE, EC_WORD_TOO_WEAK, EC_WORD_TO, EC_WORD_MAKE, EC_WORD_THINGS, EC_WORD_EXCITING
	.2byte EC_WORD_YOU_RE, EC_WORD_STRONG, EC_WORD_THAT_WAS, EC_WORD_WILD, EC_WORD_AND, EC_WORD_EXCITING
	.2byte EC_WORD_I_AM, EC_WORD_TIRED, EC_WORD_AFTER, EC_WORD_THAT, EC_WORD_EXCITING, EC_WORD_MATCH

	.align 2
	.2byte SPECIES_KINGDRA, ITEM_SALAC_BERRY
	.2byte MOVE_TWISTER, MOVE_OCTAZOOKA, MOVE_AURORA_BEAM, MOVE_RETURN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000015 @ personality
	.string "KINGDRA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLEM, ITEM_SALAC_BERRY
	.2byte MOVE_EARTHQUAKE, MOVE_ROCK_SLIDE, MOVE_BRICK_BREAK, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x0000007F @ personality
	.string "GOLEM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DRAGONITE, ITEM_SALAC_BERRY
	.2byte MOVE_THUNDER, MOVE_FIRE_BLAST, MOVE_BLIZZARD, MOVE_DRAGON_CLAW
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000001 @ personality
	.string "DRAGONITE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TYRANITAR, ITEM_SALAC_BERRY
	.2byte MOVE_EARTHQUAKE, MOVE_CRUNCH, MOVE_THUNDER, MOVE_FIRE_BLAST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000097 @ personality
	.string "TYRANITAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_AMPHAROS, ITEM_SALAC_BERRY
	.2byte MOVE_REFLECT, MOVE_THUNDER, MOVE_BRICK_BREAK, MOVE_RETURN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000013 @ personality
	.string "AMPHAROS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VENUSAUR, ITEM_SALAC_BERRY
	.2byte MOVE_GIGA_DRAIN, MOVE_LEECH_SEED, MOVE_TOXIC, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000002A @ personality
	.string "VENUSAUR$", 11
	.byte 255 @ friendship

	.byte 0x4c, 0x84, 0x01

	.align 2
gUnknown_847E5CC::
	.byte 0x10, 0x08, 0x02, 0x04
	.string "CAMRYN$", 11
	.byte FACILITY_CLASS_PICNICKER_2, 0x01
	.align 1
	.2byte EC_WORD_LET_S, EC_WORD_BATTLE, EC_WORD_I, EC_WORD_WON_T, EC_WORD_LOSE, EC_WORD_EXCL
	.2byte EC_WORD_I, EC_WORD_SAID, EC_WORD_THAT, EC_WORD_I, EC_WORD_WOULD, EC_WORD_WIN
	.2byte EC_WORD_OH_QUES, EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS, EC_WORD_DID, EC_WORD_I, EC_WORD_LOSE, EC_WORD_QUES
	.2byte EC_WORD_YOU_RE, EC_WORD_TOO_STRONG, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	.align 2
	.2byte SPECIES_MURKROW, ITEM_BLACK_GLASSES
	.2byte MOVE_AERIAL_ACE, MOVE_SHADOW_BALL, MOVE_FAINT_ATTACK, MOVE_CONFUSE_RAY
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "MURKROW$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RAPIDASH, ITEM_CHARCOAL
	.2byte MOVE_BOUNCE, MOVE_FLAMETHROWER, MOVE_QUICK_ATTACK, MOVE_DOUBLE_KICK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "RAPIDASH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MILTANK, ITEM_SILK_SCARF
	.2byte MOVE_MILK_DRINK, MOVE_BRICK_BREAK, MOVE_BODY_SLAM, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "MILTANK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLDUCK, ITEM_MYSTIC_WATER
	.2byte MOVE_HYDRO_PUMP, MOVE_ICE_BEAM, MOVE_CALM_MIND, MOVE_LIGHT_SCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "GOLDUCK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SANDSLASH, ITEM_SOFT_SAND
	.2byte MOVE_SANDSTORM, MOVE_AERIAL_ACE, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "SANDSLASH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDOQUEEN, ITEM_HARD_STONE
	.2byte MOVE_EARTHQUAKE, MOVE_SUPERPOWER, MOVE_SLUDGE_BOMB, MOVE_ROCK_SLIDE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "NIDOQUEEN$", 11
	.byte 255 @ friendship

	.string "NATALIA$", 11
	.byte FACILITY_CLASS_AROMA_LADY_2, 0x01
	.align 1
	.2byte EC_WORD_THIS, EC_MOVE(SWEET_SCENT), EC_WORD_YOU, EC_WORD_LIKE, EC_WORD_IT, EC_WORD_QUES
	.2byte EC_WORD_WASN_T, EC_WORD_THAT, EC_WORD_NICE, EC_WORD_QUES, 0xFFFF, 0xFFFF
	.2byte EC_WORD_THAT, EC_WORD_WASN_T, EC_WORD_GOOD, EC_WORD_QUES, 0xFFFF, 0xFFFF
	.2byte EC_WORD_I, EC_MOVE2(REFRESH), EC_WORD_THINGS, EC_WORD_WITH, EC_WORD_REFRESHING, EC_MOVE(AROMATHERAPY)

	.align 2
	.2byte SPECIES_BELLOSSOM, ITEM_PERSIM_BERRY
	.2byte MOVE_SWEET_SCENT, MOVE_ATTRACT, MOVE_PETAL_DANCE, MOVE_FLAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "BELLOSSOM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VICTREEBEL, ITEM_MIRACLE_SEED
	.2byte MOVE_SWEET_SCENT, MOVE_ATTRACT, MOVE_GIGA_DRAIN, MOVE_SLUDGE_BOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "VICTREEBEL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PARASECT, ITEM_MIRACLE_SEED
	.2byte MOVE_SWEET_SCENT, MOVE_ATTRACT, MOVE_GIGA_DRAIN, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "PARASECT$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VILEPLUME, ITEM_PERSIM_BERRY
	.2byte MOVE_SWEET_SCENT, MOVE_ATTRACT, MOVE_PETAL_DANCE, MOVE_SLUDGE_BOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "VILEPLUME$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VENUSAUR, ITEM_PERSIM_BERRY
	.2byte MOVE_SWEET_SCENT, MOVE_ATTRACT, MOVE_PETAL_DANCE, MOVE_SLUDGE_BOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "VENUSAUR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MEGANIUM, ITEM_MIRACLE_SEED
	.2byte MOVE_SWEET_SCENT, MOVE_ATTRACT, MOVE_GIGA_DRAIN, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000025 @ personality
	.string "MEGANIUM$", 11
	.byte 255 @ friendship

	.string "KATHLEEN$", 11
	.byte FACILITY_CLASS_COOLTRAINER_4, 0x07
	.align 1
	.2byte EC_WORD_TOO, EC_WORD_BAD, EC_WORD_IT_S, EC_WORD_OVER, EC_WORD_FOR, EC_WORD_YOU
	.2byte EC_WORD_SORRY, EC_WORD_ELLIPSIS, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_THIS, EC_WORD_IS, EC_WORD_HARD, EC_WORD_TO, EC_WORD_BELIEVE, EC_WORD_ELLIPSIS
	.2byte EC_WORD_YOU, EC_WORD_HAVE, EC_WORD_PURE_POWER, EC_WORD_THAT, EC_WORD_IS, EC_WORD_NATURAL

	.align 2
	.2byte SPECIES_MAROWAK, ITEM_LUM_BERRY
	.2byte MOVE_EARTHQUAKE, MOVE_BRICK_BREAK, MOVE_BONEMERANG, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "MAROWAK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_LAPRAS, ITEM_LUM_BERRY
	.2byte MOVE_SURF, MOVE_BLIZZARD, MOVE_PSYCHIC, MOVE_THUNDER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "LAPRAS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ARCANINE, ITEM_LUM_BERRY
	.2byte MOVE_EXTREME_SPEED, MOVE_FLAMETHROWER, MOVE_CRUNCH, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000057 @ personality
	.string "ARCANINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RAICHU, ITEM_LUM_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_QUICK_ATTACK, MOVE_DOUBLE_TEAM, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000089 @ personality
	.string "RAICHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGETIC, ITEM_LUM_BERRY
	.2byte MOVE_ANCIENT_POWER, MOVE_SWEET_KISS, MOVE_PSYCHIC, MOVE_MAGICAL_LEAF
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "TOGETIC$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SNORLAX, ITEM_LUM_BERRY
	.2byte MOVE_BODY_SLAM, MOVE_REST, MOVE_SNORE, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 84, 84, 84, 84, 84, 84 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000C @ personality
	.string "SNORLAX$", 11
	.byte 255 @ friendship

	.byte 0x8c, 0x73, 0x01

	.align 2
gUnknown_847E9AC::
	.byte 0x11, 0x08, 0x00, 0x03
	.string "BRADEN$", 11
	.byte FACILITY_CLASS_SWIMMER_MALE_2, 0x01
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_PRETTY, EC_WORD_HAPPY, EC_WORD_WITH, EC_WORD_MY, EC_WORD_TOUGHNESS
	.2byte EC_WORD_WROOOAAR_EXCL, 0xFFFF, EC_WORD_SERIOUSLY, EC_WORD_I, EC_WORD_WON, EC_WORD_QUES
	.2byte EC_WORD_YOU, EC_WORD_SHOCKED, EC_WORD_ME, EC_WORD_OUT, EC_WORD_OF, EC_WORD_HAPPINESS
	.2byte EC_WORD_NICE, EC_WORD_WORK, EC_WORD_YOU, EC_WORD_EXCL, EC_WORD_YOU_RE, EC_WORD_FABULOUS

	.align 2
	.2byte SPECIES_VAPOREON, ITEM_CHERI_BERRY
	.2byte MOVE_SURF, MOVE_ICE_BEAM, MOVE_SHADOW_BALL, MOVE_WISH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 110, 0, 200, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "VAPOREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SLOWBRO, ITEM_QUICK_CLAW
	.2byte MOVE_SURF, MOVE_CONFUSION, MOVE_AMNESIA, MOVE_DISABLE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000091 @ personality
	.string "SLOWBRO$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_POLITOED, ITEM_CHESTO_BERRY
	.2byte MOVE_SURF, MOVE_EARTHQUAKE, MOVE_HYPNOSIS, MOVE_SWAGGER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 100, 110, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "POLITOED$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TENTACRUEL, ITEM_POISON_BARB
	.2byte MOVE_SURF, MOVE_SLUDGE_BOMB, MOVE_ICE_BEAM, MOVE_MIRROR_COAT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 110, 0, 200, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "TENTACRUEL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RATICATE, ITEM_SITRUS_BERRY
	.2byte MOVE_SUPER_FANG, MOVE_HYPER_FANG, MOVE_THUNDER_WAVE, MOVE_QUICK_ATTACK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 200, 100, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "RATICATE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DUNSPARCE, ITEM_PERSIM_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_EARTHQUAKE, MOVE_ROCK_SLIDE, MOVE_YAWN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 255, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000007F @ personality
	.string "DUNSPARCE$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x30, 0x65, 0x01

	.align 2
gUnknown_847ED8C::
	.byte 0x12, 0x08, 0x00, 0x0a
	.string "ALLYSON$", 11
	.byte FACILITY_CLASS_COOLTRAINER_4, 0x07
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_NOT, EC_WORD_ABOUT, EC_WORD_TO, EC_WORD_LOSE, EC_WORD_TODAY
	.2byte EC_WORD_YES, EC_WORD_EXCL_EXCL, EC_WORD_I, EC_WORD_ADORE, EC_WORD_MYSELF, EC_WORD_TODAY
	.2byte EC_WORD_I_WAS, EC_WORD_CONFUSED, EC_WORD_ABOUT, EC_WORD_THINGS, EC_WORD_I, EC_WORD_THINK
	.2byte EC_WORD_YOU_RE, EC_WORD_TOO, EC_WORD_STRONG, EC_WORD_TODAY, EC_WORD_THAT_S, EC_WORD_ALL

	.align 2
	.2byte SPECIES_STARMIE, ITEM_LUM_BERRY
	.2byte MOVE_SURF, MOVE_PSYCHIC, MOVE_THUNDER_WAVE, MOVE_RECOVER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "STARMIE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_BLASTOISE, ITEM_SALAC_BERRY
	.2byte MOVE_HYDRO_PUMP, MOVE_ICE_BEAM, MOVE_EARTHQUAKE, MOVE_MIRROR_COAT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000032 @ personality
	.string "BLASTOISE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_KINGDRA, ITEM_CHESTO_BERRY
	.2byte MOVE_SURF, MOVE_ICE_BEAM, MOVE_DRAGON_BREATH, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 0, 255, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000008C @ personality
	.string "KINGDRA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_QUAGSIRE, ITEM_CHESTO_BERRY
	.2byte MOVE_SURF, MOVE_EARTHQUAKE, MOVE_ICE_BEAM, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 100, 0, 155, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "QUAGSIRE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_LAPRAS, ITEM_LEFTOVERS
	.2byte MOVE_SURF, MOVE_ICE_BEAM, MOVE_PSYCHIC, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 0, 255, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "LAPRAS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DRAGONITE, ITEM_SHELL_BELL
	.2byte MOVE_SURF, MOVE_ICE_BEAM, MOVE_EARTHQUAKE, MOVE_LIGHT_SCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 0, 0, 155, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "DRAGONITE$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x32, 0x6e, 0x01

	.align 2
gUnknown_847F16C::
	.byte 0x13, 0x08, 0x00, 0x0e
	.string "ALBERTO$", 11
	.byte FACILITY_CLASS_SAILOR_2, 0x05
	.align 1
	.2byte EC_WORD_LET_S, EC_WORD_GET, EC_WORD_WITH, EC_WORD_IT, EC_WORD_RIGHT, EC_WORD_AWAY
	.2byte EC_WORD_YO, EC_WORD_EXCL_EXCL, EC_WORD_YOU, EC_WORD_GIVE_UP, EC_WORD_NOW, EC_WORD_EH_QUES
	.2byte EC_WORD_IT_S, EC_WORD_ALL, EC_WORD_OVER, EC_WORD_ELLIPSIS, EC_WORD_I, EC_WORD_SURRENDER
	.2byte EC_WORD_OKAY, EC_WORD_I, EC_WORD_CONCEDE, EC_WORD_ELLIPSIS, EC_WORD_I, EC_WORD_LOST

	.align 2
	.2byte SPECIES_FERALIGATR, ITEM_FOCUS_BAND
	.2byte MOVE_SURF, MOVE_EARTHQUAKE, MOVE_CRUNCH, MOVE_DRAGON_CLAW
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 100, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000032 @ personality
	.string "FERALIGATR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_POLIWRATH, ITEM_KINGS_ROCK
	.2byte MOVE_SURF, MOVE_EARTHQUAKE, MOVE_MEGA_KICK, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 255, 0, 0, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 1 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "POLIWRATH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_KANGASKHAN, ITEM_QUICK_CLAW
	.2byte MOVE_CRUSH_CLAW, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 130, 0, 0, 125 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "KANGASKHAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MILTANK, ITEM_LEFTOVERS
	.2byte MOVE_EARTHQUAKE, MOVE_SHADOW_BALL, MOVE_ROCK_TOMB, MOVE_MILK_DRINK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 155, 255, 0, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "MILTANK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLDUCK, ITEM_SCOPE_LENS
	.2byte MOVE_CROSS_CHOP, MOVE_SURF, MOVE_ICE_BEAM, MOVE_DISABLE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 100, 0, 100, 210 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 1 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "GOLDUCK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GRANBULL, ITEM_LIECHI_BERRY
	.2byte MOVE_CRUNCH, MOVE_EARTHQUAKE, MOVE_SHADOW_BALL, MOVE_SLUDGE_BOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 130, 0, 0, 125 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x000000CA @ personality
	.string "GRANBULL$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x90, 0x68, 0x01

	.align 2
gUnknown_847F54C::
	.byte 0x14, 0x08, 0x01, 0x0c
	.string "KAT & KIPP$", 11
	.byte FACILITY_CLASS_SIS_AND_BRO_2, 0x04
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_GOING, EC_WORD_TO, EC_WORD_TRY, EC_WORD_MY, EC_WORD_BEST
	.2byte EC_WORD_WAY, EC_WORD_TO, EC_WORD_GO, EC_WORD_MY, EC_WORD_AWESOME, EC_WORD_BROTHER
	.2byte EC_WORD_SIGH, EC_WORD_ELLIPSIS, EC_WORD_THAT_S, EC_WORD_HOW, EC_WORD_IT, EC_WORD_GOES
	.2byte EC_WORD_OKAY, EC_WORD_MY, EC_WORD_AWESOME, EC_WORD_BROTHER, EC_WORD_FIGHT, EC_WORD_FIGHT

	.align 2
	.2byte SPECIES_SNEASEL, ITEM_RAWST_BERRY
	.2byte MOVE_DIG, MOVE_TORMENT, MOVE_REFLECT, MOVE_TAUNT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 255, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "SNEASEL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_OMASTAR, ITEM_QUICK_CLAW
	.2byte MOVE_DIVE, MOVE_LEER, MOVE_TICKLE, MOVE_SUPERSONIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000002D @ personality
	.string "OMASTAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DEWGONG, ITEM_PERSIM_BERRY
	.2byte MOVE_DIVE, MOVE_ENCORE, MOVE_GROWL, MOVE_SAFEGUARD
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 0, 100, 0, 0, 210 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "DEWGONG$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_QUAGSIRE, ITEM_QUICK_CLAW
	.2byte MOVE_DIVE, MOVE_YAWN, MOVE_AMNESIA, MOVE_SAFEGUARD
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 0, 110, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000091 @ personality
	.string "QUAGSIRE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CORSOLA, ITEM_QUICK_CLAW
	.2byte MOVE_DIG, MOVE_MIRROR_COAT, MOVE_RECOVER, MOVE_CONFUSE_RAY
	.byte 0, 0x00 @ level, ppBonuses
	.byte 155, 0, 100, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000017 @ personality
	.string "CORSOLA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SANDSLASH, ITEM_SITRUS_BERRY
	.2byte MOVE_DIG, MOVE_COUNTER, MOVE_DEFENSE_CURL, MOVE_SAND_ATTACK
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000094 @ personality
	.string "SANDSLASH$", 11
	.byte 255 @ friendship

	.string "KAT & KIPP$", 11
	.byte FACILITY_CLASS_SIS_AND_BRO_2, 0x04
	.align 1
	.2byte EC_WORD_FUFUFU, EC_WORD_ELLIPSIS, EC_WORD_WE, EC_WORD_NEVER, EC_WORD_LOSE, EC_WORD_EXCL
	.2byte EC_WORD_FUFUFU, EC_WORD_ELLIPSIS, EC_WORD_WE_RE, EC_WORD_TOO_STRONG, EC_WORD_TO, EC_WORD_LOSE
	.2byte EC_WORD_WHAT, EC_WORD_HUH_QUES, EC_WORD_ARE, EC_WORD_YOU, EC_WORD_JOKING, EC_WORD_QUES
	.2byte EC_WORD_WAAAH, EC_WORD_WAAAH, EC_WORD_OH, EC_WORD_BIG, EC_WORD_SISTER, EC_WORD_EXCL

	.align 2
	.2byte SPECIES_FURRET, ITEM_KINGS_ROCK
	.2byte MOVE_DIG, MOVE_AMNESIA, MOVE_DEFENSE_CURL, MOVE_FOLLOW_ME
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 100, 0, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "FURRET$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_AZUMARILL, ITEM_WHITE_HERB
	.2byte MOVE_DIVE, MOVE_LIGHT_SCREEN, MOVE_TAIL_WHIP, MOVE_DEFENSE_CURL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 155, 0, 100, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "AZUMARILL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_KINGLER, ITEM_QUICK_CLAW
	.2byte MOVE_DIVE, MOVE_HARDEN, MOVE_LEER, MOVE_AMNESIA
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000091 @ personality
	.string "KINGLER$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLOYSTER, ITEM_QUICK_CLAW
	.2byte MOVE_DIVE, MOVE_WITHDRAW, MOVE_PROTECT, MOVE_SUPERSONIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "CLOYSTER$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_QUAGSIRE, ITEM_QUICK_CLAW
	.2byte MOVE_DIG, MOVE_YAWN, MOVE_AMNESIA, MOVE_SAFEGUARD
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 0, 110, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000094 @ personality
	.string "QUAGSIRE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_KABUTOPS, ITEM_PECHA_BERRY
	.2byte MOVE_DIG, MOVE_SAND_ATTACK, MOVE_ENDURE, MOVE_CONFUSE_RAY
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000030 @ personality
	.string "KABUTOPS$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0x7c, 0x5d, 0x01

	.align 2
gUnknown_847F92C::
	.byte 0x15, 0x08, 0x01, 0x08
	.string "GEB&MEGAN$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x07
	.align 1
	.2byte EC_WORD_YOU_RE, EC_WORD_OUR, EC_WORD_OPPONENT, EC_WORD_QUES, EC_WORD_PUSHOVER, EC_WORD_HAHAHA
	.2byte EC_WORD_HAHAHA, EC_WORD_SORRY, EC_WORD_MY, EC_WORD_FRIEND, EC_WORD_TOUGH, EC_WORD_LOSS
	.2byte EC_WORD_YOU_RE, EC_WORD_SERIOUS, EC_WORD_AREN_T, EC_WORD_YOU, EC_WORD_FRIEND, EC_WORD_QUES
	.2byte EC_WORD_WON_T, EC_WORD_YOU, EC_WORD_GET, EC_WORD_LOST, EC_WORD_PLEASE, EC_WORD_QUES

	.align 2
	.2byte SPECIES_POLITOED, ITEM_KINGS_ROCK
	.2byte MOVE_SURF, MOVE_HYPNOSIS, MOVE_PERISH_SONG, MOVE_SWAGGER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 0, 255, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000008C @ personality
	.string "POLITOED$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GYARADOS, ITEM_SALAC_BERRY
	.2byte MOVE_HYPER_BEAM, MOVE_DRAGON_DANCE, MOVE_THUNDER_WAVE, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 155, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "GYARADOS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_LAPRAS, ITEM_SHELL_BELL
	.2byte MOVE_SURF, MOVE_PSYCHIC, MOVE_THUNDERBOLT, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 0, 255, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "LAPRAS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDOQUEEN, ITEM_FOCUS_BAND
	.2byte MOVE_SURF, MOVE_EARTHQUAKE, MOVE_SUPERPOWER, MOVE_ROCK_SLIDE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "NIDOQUEEN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_JYNX, ITEM_BRIGHT_POWDER
	.2byte MOVE_WATER_PULSE, MOVE_REFLECT, MOVE_LIGHT_SCREEN, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 155, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "JYNX$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GIRAFARIG, ITEM_LUM_BERRY
	.2byte MOVE_LIGHT_SCREEN, MOVE_CRUNCH, MOVE_PSYCHIC, MOVE_REFLECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 210, 0, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000008C @ personality
	.string "GIRAFARIG$", 11
	.byte 255 @ friendship

	.string "GEB&MEGAN$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x07
	.align 1
	.2byte EC_WORD_YOU_RE, EC_WORD_OUR, EC_WORD_FOE, EC_WORD_QUES, EC_WORD_GIGGLE, EC_WORD_ELLIPSIS
	.2byte EC_WORD_GIGGLE, EC_WORD_ELLIPSIS, EC_WORD_I_AM, EC_WORD_SO, EC_WORD_SORRY, 0xFFFF
	.2byte EC_WORD_MY, EC_WORD_WORD, EC_WORD_THIS, EC_WORD_IS, EC_WORD_JUST, EC_WORD_INCREDIBLE
	.2byte EC_WORD_WE, EC_WORD_NEED, EC_WORD_TO, EC_WORD_TRAIN, EC_WORD_SOME, EC_WORD_MORE

	.align 2
	.2byte SPECIES_MAROWAK, ITEM_SALAC_BERRY
	.2byte MOVE_EARTHQUAKE, MOVE_ROCK_SLIDE, MOVE_AERIAL_ACE, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000094 @ personality
	.string "MAROWAK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_URSARING, ITEM_SCOPE_LENS
	.2byte MOVE_DOUBLE_EDGE, MOVE_EARTHQUAKE, MOVE_ROCK_SLIDE, MOVE_AERIAL_ACE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 155, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "URSARING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SLOWKING, ITEM_LEFTOVERS
	.2byte MOVE_SURF, MOVE_PSYCHIC, MOVE_ICE_BEAM, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 110, 0, 0, 200, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "SLOWKING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ALAKAZAM, ITEM_BRIGHT_POWDER
	.2byte MOVE_PSYCHIC, MOVE_PROTECT, MOVE_LIGHT_SCREEN, MOVE_REFLECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000041 @ personality
	.string "ALAKAZAM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDOKING, ITEM_FOCUS_BAND
	.2byte MOVE_SURF, MOVE_MEGAHORN, MOVE_THUNDERBOLT, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "NIDOKING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RHYDON, ITEM_QUICK_CLAW
	.2byte MOVE_EARTHQUAKE, MOVE_PROTECT, MOVE_MEGAHORN, MOVE_ROCK_SLIDE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000093 @ personality
	.string "RHYDON$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0xf4, 0x60, 0x01

	.align 2
gUnknown_847FD0C::
	.byte 0x16, 0x08, 0x01, 0x05
	.string "LISA&LEAH$", 11
	.byte FACILITY_CLASS_TWINS_2, 0x01
	.align 1
	.2byte EC_WORD_ABSOLUTELY, EC_WORD_WE_RE, EC_WORD_GOING, EC_WORD_TO, EC_WORD_WIN, EC_WORD_EXCL
	.2byte EC_WORD_YEAH_YEAH, EC_WORD_EXCL_EXCL, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte EC_WORD_AWW, EC_WORD_EXCL, EC_WORD_WAAAH, EC_WORD_EXCL_EXCL, 0xFFFF, 0xFFFF
	.2byte EC_WORD_EXCUSE_ME, EC_WORD_BUT, EC_WORD_YOU_RE, EC_WORD_ALL, EC_WORD_TOO_STRONG, 0xFFFF

	.align 2
	.2byte SPECIES_POLIWAG, ITEM_CHERI_BERRY
	.2byte MOVE_SURF, MOVE_PROTECT, MOVE_TOXIC, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 255, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000087 @ personality
	.string "POLIWAG$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SQUIRTLE, ITEM_MYSTIC_WATER
	.2byte MOVE_WATER_PULSE, MOVE_PROTECT, MOVE_TOXIC, MOVE_MIRROR_COAT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000002D @ personality
	.string "SQUIRTLE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CHINCHOU, ITEM_MAGNET
	.2byte MOVE_SURF, MOVE_THUNDER_WAVE, MOVE_CONFUSE_RAY, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 255, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "CHINCHOU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDORAN_F, ITEM_POISON_BARB
	.2byte MOVE_WATER_PULSE, MOVE_SLUDGE_BOMB, MOVE_CRUNCH, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "NIDORAN♀$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLEFAIRY, ITEM_WHITE_HERB
	.2byte MOVE_WATER_PULSE, MOVE_DOUBLE_TEAM, MOVE_SING, MOVE_MINIMIZE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 100, 100, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "CLEFAIRY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HORSEA, ITEM_SITRUS_BERRY
	.2byte MOVE_SURF, MOVE_SMOKESCREEN, MOVE_ATTRACT, MOVE_DRAGON_RAGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 100, 100, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000002D @ personality
	.string "HORSEA$", 11
	.byte 255 @ friendship

	.string "LISA&LEAH$", 11
	.byte FACILITY_CLASS_TWINS_2, 0x01
	.align 1
	.2byte EC_WORD_CAN, EC_WORD_WE, EC_WORD_WIN, EC_WORD_QUES, EC_WORD_IT_S, EC_WORD_EXCITING
	.2byte EC_WORD_YEAH_YEAH, EC_WORD_EXCL_EXCL, EC_WORD_YOU, EC_WORD_MAKE, EC_WORD_ME, EC_WORD_HAPPY
	.2byte EC_WORD_AWW, EC_WORD_EXCL, EC_WORD_WAAAH, EC_WORD_EXCL_EXCL, 0xFFFF, 0xFFFF
	.2byte EC_WORD_YOU, EC_WORD_SHOULD, EC_WORD_NOT, EC_MOVE2(BEAT_UP), EC_WORD_ON, EC_WORD_CHILDREN

	.align 2
	.2byte SPECIES_WOOPER, ITEM_LEFTOVERS
	.2byte MOVE_SURF, MOVE_EARTHQUAKE, MOVE_YAWN, MOVE_FLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000093 @ personality
	.string "WOOPER$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PSYDUCK, ITEM_SCOPE_LENS
	.2byte MOVE_SURF, MOVE_CROSS_CHOP, MOVE_HYPNOSIS, MOVE_DISABLE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 1 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "PSYDUCK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SNUBBULL, ITEM_PECHA_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_THUNDER_WAVE, MOVE_CRUNCH, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "SNUBBULL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_JIGGLYPUFF, ITEM_SITRUS_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_THUNDER_WAVE, MOVE_SING, MOVE_DISABLE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "JIGGLYPUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDORAN_M, ITEM_FOCUS_BAND
	.2byte MOVE_WATER_PULSE, MOVE_SLUDGE_BOMB, MOVE_HORN_DRILL, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "NIDORAN♂$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOTODILE, ITEM_BRIGHT_POWDER
	.2byte MOVE_SURF, MOVE_PROTECT, MOVE_TOXIC, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 100, 100, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000002D @ personality
	.string "TOTODILE$", 11
	.byte 255 @ friendship

	.string "$", 11
	.byte FACILITY_CLASS_AQUA_LEADER, 0x01
	.align 1
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.2byte 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	.align 2
	.2byte SPECIES_NONE, ITEM_NONE
	.2byte MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "$$$$$$$$$$$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_NONE, ITEM_NONE
	.2byte MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "$$$$$$$$$$$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_NONE, ITEM_NONE
	.2byte MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "$$$$$$$$$$$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_NONE, ITEM_NONE
	.2byte MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "$$$$$$$$$$$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_NONE, ITEM_NONE
	.2byte MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "$$$$$$$$$$$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_NONE, ITEM_NONE
	.2byte MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "$$$$$$$$$$$", 11
	.byte 0 @ friendship

	.byte 0xd4, 0x97, 0x01

	.align 2
gUnknown_84800EC::
	.byte 0x17, 0x08, 0x02, 0x01
	.string "PRISCILLA$", 11
	.byte FACILITY_CLASS_TUBER_3, 0x01
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_A_LITTLE, EC_WORD_POKEMON, EC_WORD_GIRL, EC_WORD_HERE_I_COME, EC_WORD_EXCL
	.2byte EC_WORD_WAAAH, EC_WORD_EXCL, EC_WORD_DID, EC_WORD_I, EC_WORD_WIN, EC_WORD_QUES
	.2byte EC_WORD_OH_DEAR, EC_WORD_ELLIPSIS, EC_WORD_I, EC_WORD_COULDN_T, EC_WORD_WIN, EC_WORD_ELLIPSIS
	.2byte EC_WORD_YOU_RE, EC_WORD_A, EC_WORD_NICE, EC_WORD_TRAINER, EC_WORD_THANK_YOU, EC_WORD_EXCL

	.align 2
	.2byte SPECIES_GOLDEEN, ITEM_SITRUS_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_MEGAHORN, MOVE_SUPERSONIC, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "GOLDEEN$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_SEAKING, ITEM_SCOPE_LENS
	.2byte MOVE_SURF, MOVE_MEGAHORN, MOVE_HORN_DRILL, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "SEAKING$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_LANTURN, ITEM_SHELL_BELL
	.2byte MOVE_SURF, MOVE_THUNDERBOLT, MOVE_THUNDER_WAVE, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 100, 100, 210 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000008C @ personality
	.string "LANTURN$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_LANTURN, ITEM_LEFTOVERS
	.2byte MOVE_HYDRO_PUMP, MOVE_THUNDER, MOVE_ICE_BEAM, MOVE_RAIN_DANCE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 100, 100, 210 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "LANTURN$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_GOLDEEN, ITEM_APICOT_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_DOUBLE_EDGE, MOVE_TOXIC, MOVE_PSYBEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "GOLDEEN$", 11
	.byte 0 @ friendship

	.align 2
	.2byte SPECIES_SEAKING, ITEM_PETAYA_BERRY
	.2byte MOVE_SURF, MOVE_HYPER_BEAM, MOVE_ICE_BEAM, MOVE_PSYBEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "SEAKING$", 11
	.byte 0 @ friendship

	.string "CHARLOTTE$", 11
	.byte FACILITY_CLASS_LADY_2, 0x01
	.align 1
	.2byte EC_WORD_HELLO, EC_WORD_THERE, EC_WORD_I_AM, EC_WORD_A, EC_WORD_POKEMON, EC_WORD_LADY
	.2byte EC_WORD_OH, EC_WORD_MY, EC_WORD_MY, EC_WORD_ELLIPSIS, EC_WORD_I_AM, EC_WORD_SORRY
	.2byte EC_WORD_YOU_RE, EC_WORD_BETTER, EC_WORD_THAN, EC_WORD_A, EC_WORD_POKEMON, EC_WORD_LADY
	.2byte EC_WORD_HOHOHO, EC_WORD_THANK_YOU, EC_WORD_FOR, EC_WORD_AN, EC_WORD_AMUSING, EC_WORD_BATTLE

	.align 2
	.2byte SPECIES_OCTILLERY, ITEM_SITRUS_BERRY
	.2byte MOVE_OCTAZOOKA, MOVE_ICE_BEAM, MOVE_PSYCHIC, MOVE_FLAMETHROWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 55, 0, 100, 0, 100, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "OCTILLERY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_QWILFISH, ITEM_PERSIM_BERRY
	.2byte MOVE_SURF, MOVE_TOXIC, MOVE_REVENGE, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 0, 0, 0, 100, 210 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "QWILFISH$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_REMORAID, ITEM_PECHA_BERRY
	.2byte MOVE_SURF, MOVE_PSYCHIC, MOVE_ICE_BEAM, MOVE_THUNDER_WAVE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "REMORAID$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_REMORAID, ITEM_WHITE_HERB
	.2byte MOVE_WATER_PULSE, MOVE_BLIZZARD, MOVE_FIRE_BLAST, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "REMORAID$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_OCTILLERY, ITEM_FOCUS_BAND
	.2byte MOVE_OCTAZOOKA, MOVE_SLUDGE_BOMB, MOVE_THUNDER_WAVE, MOVE_HYPER_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 155, 100, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000093 @ personality
	.string "OCTILLERY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_QWILFISH, ITEM_QUICK_CLAW
	.2byte MOVE_HYDRO_PUMP, MOVE_SLUDGE_BOMB, MOVE_SHADOW_BALL, MOVE_DESTINY_BOND
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 100, 0, 0, 100, 210 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "QWILFISH$", 11
	.byte 255 @ friendship

	.string "SHANIA$", 11
	.byte FACILITY_CLASS_SWIMMER_FEMALE_2, 0x01
	.align 1
	.2byte EC_WORD_A, EC_WORD_POKEMON, EC_WORD_HEROINE, EC_WORD_THAT_S, EC_WORD_WHAT, EC_WORD_I_AM
	.2byte EC_WORD_AHAHA, EC_WORD_NO, EC_WORD_WAY, EC_WORD_YOU_RE, EC_WORD_TOO_WEAK, EC_WORD_SERIOUSLY
	.2byte EC_WORD_WHY, EC_WORD_QUES_EXCL, EC_WORD_YOU, EC_WORD_SHOULD, EC_WORD_NOT, EC_WORD_LIE
	.2byte EC_WORD_NICE, EC_WORD_BATTLE, EC_WORD_THANKS, EC_WORD_FOR, EC_WORD_ENTERTAINING, EC_WORD_ME

	.align 2
	.2byte SPECIES_MANTINE, ITEM_BRIGHT_POWDER
	.2byte MOVE_DOUBLE_EDGE, MOVE_EARTHQUAKE, MOVE_AERIAL_ACE, MOVE_ROCK_SLIDE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "MANTINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGIKARP, ITEM_CHOICE_BAND
	.2byte MOVE_SPLASH, MOVE_TACKLE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "MAGIKARP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MANTINE, ITEM_MENTAL_HERB
	.2byte MOVE_SURF, MOVE_ICE_BEAM, MOVE_CONFUSE_RAY, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "MANTINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GYARADOS, ITEM_SHELL_BELL
	.2byte MOVE_HYPER_BEAM, MOVE_THUNDER_WAVE, MOVE_EARTHQUAKE, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "GYARADOS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGIKARP, ITEM_CHOICE_BAND
	.2byte MOVE_FLAIL, MOVE_TACKLE, MOVE_NONE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000094 @ personality
	.string "MAGIKARP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GYARADOS, ITEM_KINGS_ROCK
	.2byte MOVE_DOUBLE_EDGE, MOVE_THUNDER_WAVE, MOVE_EARTHQUAKE, MOVE_DRAGON_DANCE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "GYARADOS$", 11
	.byte 255 @ friendship

	.byte 0x1d, 0x52, 0x01

	.align 2
gUnknown_84804CC::
	.byte 0x18, 0x08, 0x02, 0x0d
	.string "BRENNAN$", 11
	.byte FACILITY_CLASS_SAILOR_2, 0x01
	.align 1
	.2byte EC_WORD_TAKE, EC_WORD_THINGS, EC_WORD_EASY, EC_WORD_ELLIPSIS, EC_WORD_THAT_S, EC_WORD_IMPORTANT
	.2byte EC_WORD_YOU, EC_WORD_LOSE, EC_WORD_IF, EC_WORD_YOU, EC_WORD_GIVE_UP, EC_WORD_EXCL
	.2byte EC_WORD_OOPS, EC_WORD_YOU, EC_WORD_GOT, EC_WORD_AN, EC_WORD_EASY, EC_WORD_WIN
	.2byte EC_WORD_I, EC_WORD_DON_T, EC_MOVE(GRUDGE), EC_WORD_YOU, EC_WORD_BUT, EC_WORD_ELLIPSIS

	.align 2
	.2byte SPECIES_LAPRAS, ITEM_CHESTO_BERRY
	.2byte MOVE_HYDRO_PUMP, MOVE_PSYCHIC, MOVE_ATTRACT, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 0, 100, 255 @ EVs
	.align 2
	trainerid 15, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "LAPRAS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_KINGDRA, ITEM_CHESTO_BERRY
	.2byte MOVE_HYDRO_PUMP, MOVE_BLIZZARD, MOVE_DRAGON_BREATH, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000008C @ personality
	.string "KINGDRA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MACHAMP, ITEM_SCOPE_LENS
	.2byte MOVE_CROSS_CHOP, MOVE_EARTHQUAKE, MOVE_ROCK_SLIDE, MOVE_HYPER_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 130, 0, 0, 125 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000004E @ personality
	.string "MACHAMP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CHANSEY, ITEM_ORAN_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_SOFT_BOILED, MOVE_MINIMIZE, MOVE_THUNDER_WAVE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "CHANSEY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TAUROS, ITEM_LUM_BERRY
	.2byte MOVE_DOUBLE_EDGE, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB, MOVE_SWAGGER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 100, 100, 100, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "TAUROS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SNORLAX, ITEM_ORAN_BERRY
	.2byte MOVE_DOUBLE_EDGE, MOVE_EARTHQUAKE, MOVE_DOUBLE_TEAM, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000021 @ personality
	.string "SNORLAX$", 11
	.byte 255 @ friendship

	.string "KADEN$", 11
	.byte FACILITY_CLASS_FISHERMAN_2, 0x01
	.align 1
	.2byte EC_WORD_MY, EC_WORD_FISHING, EC_WORD_FASHION, EC_WORD_APPEAL, EC_WORD_IS, EC_WORD_FANTASTIC
	.2byte EC_WORD_MY, EC_WORD_FANTASTIC, EC_WORD_FASHION, EC_WORD_APPEAL, EC_WORD_WINS, EC_WORD_OUT
	.2byte EC_WORD_UH_OH, EC_WORD_ELLIPSIS, EC_WORD_I, EC_WORD_SEE, EC_WORD_I, EC_WORD_LOST
	.2byte EC_WORD_FASHION, EC_WORD_APPEAL, EC_WORD_WON_T, EC_WORD_GET, EC_WORD_ME, EC_WORD_WINS

	.align 2
	.2byte SPECIES_CHINCHOU, ITEM_MAGNET
	.2byte MOVE_THUNDERBOLT, MOVE_THUNDER_WAVE, MOVE_CONFUSE_RAY, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 100, 0, 100, 100, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "CHINCHOU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DRATINI, ITEM_SITRUS_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_THUNDER_WAVE, MOVE_DRAGON_BREATH, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 100, 100, 100, 100 @ EVs
	.align 2
	trainerid 0, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "DRATINI$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SLOWPOKE, ITEM_PECHA_BERRY
	.2byte MOVE_WATER_PULSE, MOVE_YAWN, MOVE_DISABLE, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "SLOWPOKE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGIKARP, ITEM_BRIGHT_POWDER
	.2byte MOVE_SPLASH, MOVE_FLAIL, MOVE_TACKLE, MOVE_NONE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 0, 255 @ EVs
	.align 2
	trainerid 23, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000017 @ personality
	.string "MAGIKARP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_SEAKING, ITEM_CHERI_BERRY
	.2byte MOVE_HORN_DRILL, MOVE_MEGAHORN, MOVE_SUPERSONIC, MOVE_AGILITY
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 23, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000017 @ personality
	.string "SEAKING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TENTACRUEL, ITEM_FOCUS_BAND
	.2byte MOVE_MIRROR_COAT, MOVE_SUPERSONIC, MOVE_PROTECT, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000096 @ personality
	.string "TENTACRUEL$", 11
	.byte 255 @ friendship

	.string "EMANUEL$", 11
	.byte FACILITY_CLASS_GENTLEMAN_2, 0x01
	.align 1
	.2byte EC_WORD_HMM, EC_WORD_QUES, EC_WORD_ARE, EC_WORD_YOU, EC_WORD_SKILLED, EC_WORD_QUES
	.2byte EC_WORD_I, EC_WORD_SEE, EC_WORD_I, EC_WORD_WASN_T, EC_WORD_RIGHT, EC_WORD_ELLIPSIS
	.2byte EC_WORD_YOU, EC_WORD_TRULY, EC_WORD_ARE, EC_WORD_A, EC_WORD_MASTER, EC_WORD_TRAINER
	.2byte EC_WORD_I_AM, EC_WORD_SORRY, EC_WORD_THAT, EC_WORD_I_WAS, EC_WORD_YOUR, EC_WORD_OPPONENT

	.align 2
	.2byte SPECIES_VAPOREON, ITEM_SHELL_BELL
	.2byte MOVE_SURF, MOVE_ICE_BEAM, MOVE_ATTRACT, MOVE_BITE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "VAPOREON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ESPEON, ITEM_CHESTO_BERRY
	.2byte MOVE_PSYCHIC, MOVE_BITE, MOVE_REFLECT, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 110, 0, 200, 0, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "ESPEON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_BLISSEY, ITEM_LEFTOVERS
	.2byte MOVE_WATER_PULSE, MOVE_MINIMIZE, MOVE_THUNDER_WAVE, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 255, 0, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "BLISSEY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_STARMIE, ITEM_LUM_BERRY
	.2byte MOVE_SURF, MOVE_ICE_BEAM, MOVE_RECOVER, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 100, 0, 0, 155 @ EVs
	.align 2
	trainerid 20, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "STARMIE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PERSIAN, ITEM_KINGS_ROCK
	.2byte MOVE_SLASH, MOVE_SWAGGER, MOVE_PSYCH_UP, MOVE_FAKE_OUT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 130, 0, 0, 125 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "PERSIAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_AZUMARILL, ITEM_QUICK_CLAW
	.2byte MOVE_SURF, MOVE_ENCORE, MOVE_ATTRACT, MOVE_DIG
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 0, 255, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000000 @ personality
	.string "AZUMARILL$", 11
	.byte 255 @ friendship

	.byte 0x4b, 0x55, 0x01

	.align 2
gUnknown_84808AC::
	.byte 0x19, 0x08, 0x00, 0x0c
	.string "JARRETT$", 11
	.byte FACILITY_CLASS_JUGGLER, 0x02
	.align 1
	.2byte EC_WORD_LET_S, EC_WORD_HAVE, EC_WORD_AN, EC_MOVE2(EXPLOSION), EC_WORD_PARTY, EC_WORD_EXCL
	.2byte EC_WORD_CONGRATS, EC_WORD_FOR, EC_WORD_YOUR, EC_WORD_LOSS, EC_WORD_PARTY, EC_WORD_KID
	.2byte EC_WORD_NICE, EC_MOVE(SELF_DESTRUCT), EC_WORD_THERE, EC_WORD_EXCL, EC_WORD_YOU_RE, EC_WORD_PERFECT
	.2byte EC_WORD_WANT, EC_WORD_TO, EC_WORD_PARTY, EC_WORD_SOME, EC_WORD_MORE, EC_WORD_QUES

	.align 2
	.2byte SPECIES_ELECTRODE, ITEM_FOCUS_BAND
	.2byte MOVE_EXPLOSION, MOVE_LIGHT_SCREEN, MOVE_SCREECH, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 10, 150, 100, 150, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "ELECTRODE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_VOLTORB, ITEM_BRIGHT_POWDER
	.2byte MOVE_EXPLOSION, MOVE_FLASH, MOVE_DOUBLE_TEAM, MOVE_THUNDER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 255, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000000D @ personality
	.string "VOLTORB$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_WEEZING, ITEM_SALAC_BERRY
	.2byte MOVE_EXPLOSION, MOVE_SLUDGE_BOMB, MOVE_DESTINY_BOND, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 200, 155, 0, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "WEEZING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLEM, ITEM_SHELL_BELL
	.2byte MOVE_EXPLOSION, MOVE_DOUBLE_EDGE, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 100, 0, 0, 150 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000007F @ personality
	.string "GOLEM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_EXEGGCUTE, ITEM_QUICK_CLAW
	.2byte MOVE_EXPLOSION, MOVE_STUN_SPORE, MOVE_HYPNOSIS, MOVE_GIGA_DRAIN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "EXEGGCUTE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FORRETRESS, ITEM_LEFTOVERS
	.2byte MOVE_EXPLOSION, MOVE_GIGA_DRAIN, MOVE_DIG, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 155, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000084 @ personality
	.string "FORRETRESS$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x6a, 0x5b, 0x01

	.align 2
gUnknown_8480C8C::
	.byte 0x1a, 0x08, 0x00, 0x0d
	.string "OWEN$", 11
	.byte FACILITY_CLASS_SUPER_NERD, 0x02
	.align 1
	.2byte EC_WORD_HERE_IT_IS, EC_MOVE2(THUNDER_WAVE), EC_WORD_DON_T, EC_MOVE2(WRAP), EC_WORD_ME, EC_WORD_EXCL
	.2byte EC_WORD_ACCEPT, EC_WORD_MY, EC_MOVE2(PRESENT), EC_WORD_OF, EC_MOVE2(THUNDER_WAVE), EC_WORD_EXCL
	.2byte EC_MOVE2(WRAP), EC_MOVE(BIND), EC_WORD_ELECTRIC, EC_MOVE2(WHIRLWIND), EC_WORD_SPIRALING, EC_WORD_AROUND
	.2byte EC_MOVE2(WHIRLWIND), EC_WORD_SPIRALING, 0xFFFF, 0xFFFF, EC_WORD_SPIRALING, EC_MOVE2(WHIRLWIND)

	.align 2
	.2byte SPECIES_MAGNETON, ITEM_LEFTOVERS
	.2byte MOVE_PROTECT, MOVE_ZAP_CANNON, MOVE_TOXIC, MOVE_SUPERSONIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 125, 255, 0, 130 @ EVs
	.align 2
	trainerid 10, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "MAGNETON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PIKACHU, ITEM_LIGHT_BALL
	.2byte MOVE_THUNDER_WAVE, MOVE_THUNDERBOLT, MOVE_PROTECT, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 150, 0, 255, 105 @ EVs
	.align 2
	trainerid 15, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "PIKACHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_JOLTEON, ITEM_BRIGHT_POWDER
	.2byte MOVE_THUNDER_WAVE, MOVE_THUNDERBOLT, MOVE_DOUBLE_TEAM, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 100, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000037 @ personality
	.string "JOLTEON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_BLISSEY, ITEM_LUM_BERRY
	.2byte MOVE_THUNDER_WAVE, MOVE_BLIZZARD, MOVE_WATER_PULSE, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "BLISSEY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PORYGON2, ITEM_SALAC_BERRY
	.2byte MOVE_THUNDER_WAVE, MOVE_ZAP_CANNON, MOVE_PSYCHIC, MOVE_RECOVER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 125, 0, 255, 130 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "PORYGON2$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PORYGON, ITEM_LAX_INCENSE
	.2byte MOVE_THUNDER_WAVE, MOVE_ZAP_CANNON, MOVE_DOUBLE_TEAM, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 5, 0 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "PORYGON$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0xec, 0x60, 0x01

	.align 2
gUnknown_848106C::
	.byte 0x1b, 0x08, 0x00, 0x01
	.string "LORENZO$", 11
	.byte FACILITY_CLASS_PSYCHIC_3, 0x01
	.align 1
	.2byte EC_WORD_THIS, EC_WORD_POWER, EC_WORD_IS, EC_WORD_NOW, EC_WORD_COMPLETE, EC_WORD_EXCL
	.2byte EC_WORD_NO, EC_WORD_KEEN_EYE, EC_WORD_CAN, EC_WORD_STOP, EC_WORD_MY, EC_WORD_POWER
	.2byte EC_WORD_HERE_IT_IS, EC_WORD_EXCL, EC_MOVE(KINESIS), EC_WORD_EXCL, EC_WORD_ELLIPSIS, EC_WORD_WHAT
	.2byte EC_WORD_I, EC_WORD_WILL, EC_WORD_MAKE, EC_WORD_THE, EC_MOVE(KINESIS), EC_WORD_HALL_OF_FAME

	.align 2
	.2byte SPECIES_MR_MIME, ITEM_QUICK_CLAW
	.2byte MOVE_THUNDERBOLT, MOVE_THUNDER_WAVE, MOVE_LIGHT_SCREEN, MOVE_REFLECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 100, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "MR. MIME$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HYPNO, ITEM_SALAC_BERRY
	.2byte MOVE_THUNDER_PUNCH, MOVE_FIRE_PUNCH, MOVE_ICE_PUNCH, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 0, 200, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000008C @ personality
	.string "HYPNO$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ALAKAZAM, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDER_PUNCH, MOVE_FIRE_PUNCH, MOVE_ICE_PUNCH, MOVE_PSYCHIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 150, 155, 50 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "ALAKAZAM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GENGAR, ITEM_LEFTOVERS
	.2byte MOVE_THUNDERBOLT, MOVE_SHADOW_BALL, MOVE_HYPNOSIS, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 200, 0, 100, 55, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000088 @ personality
	.string "GENGAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GIRAFARIG, ITEM_LUM_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_CRUNCH, MOVE_BODY_SLAM, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 100, 155, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 1 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "GIRAFARIG$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_STARMIE, ITEM_APICOT_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_SURF, MOVE_RECOVER, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 55, 250, 150, 55 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "STARMIE$", 11
	.byte 255 @ friendship

	dummy_tower_team
	dummy_tower_team
	.byte 0x4b, 0x62, 0x01

	.align 2
gUnknown_848144C::
	.byte 0x1c, 0x08, 0x01, 0x0b
	.string "NIA & CARL$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x04
	.align 1
	.2byte EC_WORD_HERE_GOES, EC_WORD_MY, EC_WORD_DIGITAL, EC_WORD_ROMANTIC, EC_WORD_HERO, EC_WORD_STRATEGY
	.2byte EC_WORD_THAT_S, EC_WORD_THE, EC_WORD_DIGITAL, EC_WORD_HYPER, EC_WORD_MODE, EC_WORD_POWER
	.2byte EC_WORD_MY, EC_WORD_PERFECT, EC_WORD_STRATEGY, EC_WORD_WAS, EC_MOVE2(BEAT_UP), EC_WORD_QUES
	.2byte EC_WORD_MY, EC_WORD_INVINCIBLE, EC_WORD_STRATEGY, EC_WORD_WAS, EC_WORD_DESTROYED, EC_WORD_ELLIPSIS

	.align 2
	.2byte SPECIES_MUK, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_SHADOW_BALL, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 155, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "MUK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GENGAR, ITEM_PETAYA_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_CONFUSE_RAY, MOVE_PSYCHIC, MOVE_EXPLOSION
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 155, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000015 @ personality
	.string "GENGAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ALAKAZAM, ITEM_GANLON_BERRY
	.2byte MOVE_THUNDER_PUNCH, MOVE_PSYCHIC, MOVE_RECOVER, MOVE_REFLECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "ALAKAZAM$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_JOLTEON, ITEM_BRIGHT_POWDER
	.2byte MOVE_THUNDERBOLT, MOVE_FLAIL, MOVE_THUNDER_WAVE, MOVE_DOUBLE_TEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 50, 100, 160, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "JOLTEON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ELECTRODE, ITEM_LIECHI_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_EXPLOSION, MOVE_MIRROR_COAT, MOVE_LIGHT_SCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 55, 0, 100, 100, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "ELECTRODE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RAICHU, ITEM_SALAC_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_COUNTER, MOVE_REVERSAL, MOVE_LIGHT_SCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 55, 255, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "RAICHU$", 11
	.byte 255 @ friendship

	.string "NIA & CARL$", 11
	.byte FACILITY_CLASS_COOL_COUPLE, 0x04
	.align 1
	.2byte EC_WORD_MASTER, EC_WORD_COMPLETE, EC_WORD_FASHION, EC_WORD_SYSTEM, EC_WORD_START, EC_WORD_EXCL
	.2byte EC_WORD_THAT_S_IT_EXCL, EC_WORD_THE, EC_WORD_POWER, EC_WORD_OF, EC_WORD_OUR, EC_WORD_SYSTEM
	.2byte EC_WORD_OKAY, EC_WORD_EXCL, EC_MOVE(THUNDERBOLT), EC_WORD_RUN_AWAY, EC_WORD_SYSTEM, EC_WORD_START
	.2byte EC_WORD_GO, EC_WORD_ON, EC_WORD_PLEASE, EC_WORD_EXCL, EC_WORD_TCH, EC_WORD_ELLIPSIS

	.align 2
	.2byte SPECIES_KANGASKHAN, ITEM_SALAC_BERRY
	.2byte MOVE_SHADOW_BALL, MOVE_REVERSAL, MOVE_ENDURE, MOVE_FAKE_OUT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 105, 0, 0, 150 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "KANGASKHAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TAUROS, ITEM_LUM_BERRY
	.2byte MOVE_DOUBLE_EDGE, MOVE_ROCK_TOMB, MOVE_SURF, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 100, 0, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "TAUROS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MILTANK, ITEM_SALAC_BERRY
	.2byte MOVE_BODY_SLAM, MOVE_SHADOW_BALL, MOVE_MILK_DRINK, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 155, 50, 250, 0, 55 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "MILTANK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RHYDON, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_MEGAHORN, MOVE_HORN_DRILL, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "RHYDON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DRAGONITE, ITEM_SCOPE_LENS
	.2byte MOVE_BLIZZARD, MOVE_SURF, MOVE_OUTRAGE, MOVE_FLAMETHROWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 0, 255, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 0 @ IVs, ability
	.4byte 0x00000091 @ personality
	.string "DRAGONITE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_LAPRAS, ITEM_SHELL_BELL
	.2byte MOVE_THUNDERBOLT, MOVE_BLIZZARD, MOVE_SURF, MOVE_HORN_DRILL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 0, 255, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 31, 31, 31, 31, 31, 31, 1 @ IVs, ability
	.4byte 0x00000091 @ personality
	.string "LAPRAS$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0x60, 0x63, 0x01

	.align 2
gUnknown_848182C::
	.byte 0x1d, 0x08, 0x01, 0x03
	.string "AXE & REN$", 11
	.byte FACILITY_CLASS_SIS_AND_BRO_2, 0x02
	.align 1
	.2byte EC_WORD_IT_S, EC_WORD_GOING, EC_WORD_TO, EC_WORD_GET, EC_WORD_AWFULLY, EC_WORD_COLD
	.2byte EC_WORD_THAT_S, EC_WORD_THAT, EC_WORD_MAN, EC_WORD_I_AM, EC_WORD_COLD, EC_WORD_EXCL
	.2byte EC_WORD_I, EC_WORD_CAN_T_WIN, EC_WORD_IN, EC_WORD_THIS, EC_MOVE(SHEER_COLD), EC_WORD_ELLIPSIS
	.2byte EC_WORD_THIS, EC_MOVE(SHEER_COLD), EC_WORD_HAS, EC_WORD_ME, EC_WORD_FEELING, EC_WORD_SHAKY

	.align 2
	.2byte SPECIES_LANTURN, ITEM_BRIGHT_POWDER
	.2byte MOVE_RAIN_DANCE, MOVE_SURF, MOVE_THUNDER, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 255, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "LANTURN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MANTINE, ITEM_PETAYA_BERRY
	.2byte MOVE_RAIN_DANCE, MOVE_SURF, MOVE_CONFUSE_RAY, MOVE_ICE_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 155, 100, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "MANTINE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DEWGONG, ITEM_LEFTOVERS
	.2byte MOVE_RAIN_DANCE, MOVE_SURF, MOVE_SHEER_COLD, MOVE_BLIZZARD
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 100, 0, 255, 55 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "DEWGONG$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLOYSTER, ITEM_KINGS_ROCK
	.2byte MOVE_RAIN_DANCE, MOVE_SURF, MOVE_ICE_BEAM, MOVE_HYPER_BEAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "CLOYSTER$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TENTACRUEL, ITEM_QUICK_CLAW
	.2byte MOVE_RAIN_DANCE, MOVE_SURF, MOVE_GIGA_DRAIN, MOVE_SLUDGE_BOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 100, 100, 255, 55 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "TENTACRUEL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GYARADOS, ITEM_LIECHI_BERRY
	.2byte MOVE_RAIN_DANCE, MOVE_SURF, MOVE_DRAGON_DANCE, MOVE_RETURN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "GYARADOS$", 11
	.byte 255 @ friendship

	.string "AXE & REN$", 11
	.byte FACILITY_CLASS_SIS_AND_BRO_2, 0x02
	.align 1
	.2byte EC_WORD_OUR, EC_WORD_SWIFT_SWIM, EC_WORD_LEFT, EC_WORD_ME, EC_WORD_FEELING, EC_WORD_COLD
	.2byte EC_WORD_I, EC_WORD_WON, EC_WORD_BUT, EC_WORD_I_AM, EC_WORD_NOT, EC_WORD_HOT
	.2byte EC_WORD_I_AM, EC_WORD_HUNGRY, EC_WORD_FOR, EC_WORD_ANY, EC_WORD_HOT, EC_WORD_EATS
	.2byte EC_WORD_SISTER, EC_WORD_I, EC_WORD_NEED, EC_WORD_SOMETHING, EC_WORD_HOT, EC_WORD_PLEASE

	.align 2
	.2byte SPECIES_ELECTABUZZ, ITEM_SCOPE_LENS
	.2byte MOVE_THUNDER, MOVE_PSYCHIC, MOVE_CROSS_CHOP, MOVE_LIGHT_SCREEN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 155, 155, 100, 100, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000040 @ personality
	.string "ELECTABUZZ$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGNETON, ITEM_PETAYA_BERRY
	.2byte MOVE_THUNDER, MOVE_SONIC_BOOM, MOVE_METAL_SOUND, MOVE_REFLECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 255, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "MAGNETON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PORYGON, ITEM_LEFTOVERS
	.2byte MOVE_THUNDER, MOVE_PSYCHIC, MOVE_BLIZZARD, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 255, 0, 0, 0, 255, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "PORYGON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_DRAGONAIR, ITEM_SHELL_BELL
	.2byte MOVE_THUNDER, MOVE_SURF, MOVE_BLIZZARD, MOVE_OUTRAGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 50, 155, 255, 50 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "DRAGONAIR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PERSIAN, ITEM_SHELL_BELL
	.2byte MOVE_THUNDER, MOVE_FAKE_OUT, MOVE_WATER_PULSE, MOVE_RETURN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 155, 0, 200, 155, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000B @ personality
	.string "PERSIAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_STARMIE, ITEM_GANLON_BERRY
	.2byte MOVE_THUNDER, MOVE_SURF, MOVE_RECOVER, MOVE_REFLECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 95, 255, 100, 60 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "STARMIE$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0x72, 0x52, 0x01

	.align 2
gUnknown_8481C0C::
	.byte 0x1e, 0x08, 0x01, 0x05
	.string "KATI & GEB$", 11
	.byte FACILITY_CLASS_YOUNG_COUPLE_2, 0x02
	.align 1
	.2byte EC_WORD_WELCOME, EC_WORD_TO, EC_WORD_OUR, EC_WORD_LOVEY_DOVEY, EC_MOVE2(THUNDER_WAVE), EC_MOVE(SANDSTORM)
	.2byte EC_WORD_LALALA, EC_WORD_LALALA, EC_WORD_OUR, EC_WORD_LOVEY_DOVEY, EC_WORD_LALALA, EC_WORD_LIFE
	.2byte EC_WORD_I, EC_WORD_NEED, EC_WORD_TO, EC_WORD_LOSE, EC_WORD_MY, EC_MOVE2(FRUSTRATION)
	.2byte EC_WORD_YOU_RE, EC_WORD_JUST, EC_WORD_A_LITTLE, EC_WORD_KID, EC_WORD_AHAHA, EC_WORD_EXCL

	.align 2
	.2byte SPECIES_FLAAFFY, ITEM_LEFTOVERS
	.2byte MOVE_ATTRACT, MOVE_PROTECT, MOVE_THUNDERBOLT, MOVE_REFLECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000084 @ personality
	.string "FLAAFFY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_QUAGSIRE, ITEM_QUICK_CLAW
	.2byte MOVE_ATTRACT, MOVE_SURF, MOVE_AMNESIA, MOVE_BLIZZARD
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 100, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000093 @ personality
	.string "QUAGSIRE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PIKACHU, ITEM_SALAC_BERRY
	.2byte MOVE_ATTRACT, MOVE_REVERSAL, MOVE_THUNDERBOLT, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 155, 100, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "PIKACHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ELECTABUZZ, ITEM_LIECHI_BERRY
	.2byte MOVE_ATTRACT, MOVE_COUNTER, MOVE_ICE_PUNCH, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 150, 255, 0, 105 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000046 @ personality
	.string "ELECTABUZZ$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGETIC, ITEM_KINGS_ROCK
	.2byte MOVE_ATTRACT, MOVE_BLIZZARD, MOVE_ANCIENT_POWER, MOVE_WATER_PULSE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000002D @ personality
	.string "TOGETIC$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GOLDUCK, ITEM_SCOPE_LENS
	.2byte MOVE_ATTRACT, MOVE_SURF, MOVE_DIG, MOVE_CROSS_CHOP
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 155, 50, 255, 0, 50 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "GOLDUCK$", 11
	.byte 255 @ friendship

	.string "KATI & GEB$", 11
	.byte FACILITY_CLASS_YOUNG_COUPLE_2, 0x02
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_PLUS, EC_WORD_YOU_RE, EC_WORD_MINUS, EC_WORD_LOVEY_DOVEY, EC_WORD_MAGNET_PULL
	.2byte EC_WORD_DON_T, EC_WORD_STOP, EC_WORD_OUR, EC_WORD_LOVEY_DOVEY, EC_WORD_LOCOMOTIVE, EC_WORD_EXCL
	.2byte EC_WORD_HIS, EC_WORD_CRY, EC_WORD_HAS, EC_WORD_CUTE_CHARM, EC_WORD_TOO, EC_WORD_EXCL
	.2byte EC_WORD_YOU, EC_WORD_HAVE, EC_WORD_TIME, EC_WORD_TO, EC_WORD_TALK, EC_WORD_QUES

	.align 2
	.2byte SPECIES_PICHU, ITEM_FOCUS_BAND
	.2byte MOVE_ATTRACT, MOVE_PROTECT, MOVE_SWEET_KISS, MOVE_REVERSAL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 255, 0, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000003 @ personality
	.string "PICHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ELEKID, ITEM_BRIGHT_POWDER
	.2byte MOVE_ATTRACT, MOVE_PROTECT, MOVE_DOUBLE_TEAM, MOVE_FOCUS_PUNCH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 130, 0, 0, 125 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "ELEKID$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_TOGEPI, ITEM_FOCUS_BAND
	.2byte MOVE_ATTRACT, MOVE_PROTECT, MOVE_YAWN, MOVE_WATER_PULSE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "TOGEPI$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PSYDUCK, ITEM_BRIGHT_POWDER
	.2byte MOVE_ATTRACT, MOVE_PROTECT, MOVE_DIG, MOVE_DIVE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "PSYDUCK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAREEP, ITEM_BRIGHT_POWDER
	.2byte MOVE_ATTRACT, MOVE_PROTECT, MOVE_LIGHT_SCREEN, MOVE_THUNDERBOLT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "MAREEP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_WOOPER, ITEM_FOCUS_BAND
	.2byte MOVE_ATTRACT, MOVE_PROTECT, MOVE_SURF, MOVE_YAWN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 10, 10, 10, 10, 10, 10, 1 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "WOOPER$", 11
	.byte 255 @ friendship

	dummy_tower_team
	.byte 0x66, 0x59, 0x01

	.align 2
gUnknown_8481FEC::
	.byte 0x1f, 0x08, 0x02, 0x07
	.string "BEN$", 11
	.byte FACILITY_CLASS_ROCKER, 0x01
	.align 1
	.2byte EC_WORD_LALALA, EC_WORD_LET_S, EC_MOVE(SING), EC_WORD_ABOUT, EC_WORD_ELECTRIC, EC_WORD_POWER
	.2byte EC_WORD_STATIC, EC_WORD_IS, EC_WORD_ELECTRIC, EC_WORD_YES, EC_WORD_IT, EC_WORD_IS
	.2byte EC_WORD_ELECTRIC, EC_WORD_ABOUT, EC_WORD_MY, EC_WORD_DIGITAL, EC_WORD_TELEVISION, EC_WORD_I_AM
	.2byte EC_WORD_ELECTRIC, EC_WORD_EXCL, EC_WORD_IT_S, EC_WORD_A, EC_WORD_NATURAL, EC_WORD_POWER

	.align 2
	.2byte SPECIES_ELECTRODE, ITEM_LIECHI_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_MIRROR_COAT, MOVE_EXPLOSION, MOVE_THUNDER_WAVE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 55, 255, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "ELECTRODE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_ELECTABUZZ, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_FIRE_PUNCH, MOVE_PSYCHIC, MOVE_ICE_PUNCH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 155, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000F @ personality
	.string "ELECTABUZZ$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_LANTURN, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_DOUBLE_EDGE, MOVE_ICE_BEAM, MOVE_HYDRO_PUMP
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 125, 0, 255, 130 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000008E @ personality
	.string "LANTURN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAGNETON, ITEM_LIECHI_BERRY
	.2byte MOVE_ZAP_CANNON, MOVE_HYPER_BEAM, MOVE_LOCK_ON, MOVE_SUPERSONIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 200, 255, 0, 55 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000014 @ personality
	.string "MAGNETON$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RAICHU, ITEM_SALAC_BERRY
	.2byte MOVE_DOUBLE_EDGE, MOVE_MEGA_KICK, MOVE_REVERSAL, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 80, 100, 0, 75 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000008A @ personality
	.string "RAICHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_AMPHAROS, ITEM_SHELL_BELL
	.2byte MOVE_THUNDERBOLT, MOVE_MEGA_KICK, MOVE_COUNTER, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 200, 150, 0, 10, 150 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "AMPHAROS$", 11
	.byte 255 @ friendship

	.string "CAMDEN$", 11
	.byte FACILITY_CLASS_ENGINEER, 0x01
	.align 1
	.2byte EC_WORD_LALALA, EC_WORD_LET_S, EC_MOVE(SING), EC_WORD_ABOUT, EC_WORD_ELECTRIC, EC_WORD_POWER
	.2byte EC_WORD_A, EC_MOVE(THUNDERBOLT), EC_WORD_IS, EC_WORD_ELECTRIC, EC_WORD_TOO, EC_WORD_EXCL
	.2byte EC_WORD_ELECTRIC, EC_WORD_EXCL, EC_WORD_IT_S, EC_WORD_ABOUT, EC_WORD_WIRELESS, EC_WORD_LINK
	.2byte EC_WORD_ELECTRIC, EC_WORD_EXCL, EC_WORD_IT_S, EC_WORD_A, EC_WORD_TREASURE, EC_WORD_EXCL

	.align 2
	.2byte SPECIES_GRANBULL, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_CRUNCH, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 55, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "GRANBULL$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PERSIAN, ITEM_SCOPE_LENS
	.2byte MOVE_THUNDERBOLT, MOVE_WATER_PULSE, MOVE_HYPNOSIS, MOVE_SLASH
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 55, 255, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "PERSIAN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_LICKITUNG, ITEM_LEFTOVERS
	.2byte MOVE_PROTECT, MOVE_SURF, MOVE_EARTHQUAKE, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 200, 255, 0, 0, 55, 0 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "LICKITUNG$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RATICATE, ITEM_SALAC_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_HYPER_FANG, MOVE_SUPER_FANG, MOVE_REVERSAL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 100, 50, 0, 105 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000094 @ personality
	.string "RATICATE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PRIMEAPE, ITEM_SCOPE_LENS
	.2byte MOVE_THUNDERBOLT, MOVE_CROSS_CHOP, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 130, 0, 0, 125 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "PRIMEAPE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_KANGASKHAN, ITEM_LUM_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_SURF, MOVE_CRUSH_CLAW, MOVE_REST
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 100, 155, 0, 100, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "KANGASKHAN$", 11
	.byte 255 @ friendship

	.string "ZACKERY$", 11
	.byte FACILITY_CLASS_SCIENTIST, 0x01
	.align 1
	.2byte EC_WORD_LALALA, EC_WORD_LET_S, EC_MOVE(SING), EC_WORD_ABOUT, EC_WORD_ELECTRIC, EC_WORD_POWER
	.2byte EC_MOVE2(THUNDER_SHOCK), EC_WORD_IS, EC_WORD_ELECTRIC, EC_WORD_YOU, EC_WORD_KNOW, EC_WORD_QUES
	.2byte EC_WORD_ELECTRIC, EC_WORD_EXCL, EC_MOVE2(FLASH), EC_MOVE2(FLASH), EC_MOVE2(FLASH), EC_WORD_EXCL_EXCL
	.2byte EC_WORD_ALL, EC_WORD_TOGETHER, EC_WORD_NOW, EC_WORD_EXCL, EC_MOVE(SPARK), EC_MOVE(SPARK)

	.align 2
	.2byte SPECIES_WEEZING, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_FLAMETHROWER, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 0, 0, 155, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "WEEZING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MUK, ITEM_LEFTOVERS
	.2byte MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB, MOVE_GIGA_DRAIN, MOVE_CURSE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 150, 0, 255, 105 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 1 @ IVs, ability
	.4byte 0x00000084 @ personality
	.string "MUK$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_GENGAR, ITEM_PETAYA_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_HYPNOSIS, MOVE_DREAM_EATER, MOVE_WILL_O_WISP
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 250, 155, 105 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "GENGAR$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MISDREAVUS, ITEM_SALAC_BERRY
	.2byte MOVE_PSYCHIC, MOVE_GRUDGE, MOVE_CONFUSE_RAY, MOVE_DESTINY_BOND
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 0, 150, 105, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x0000000A @ personality
	.string "MISDREAVUS$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CROBAT, ITEM_BRIGHT_POWDER
	.2byte MOVE_SLUDGE_BOMB, MOVE_CONFUSE_RAY, MOVE_GIGA_DRAIN, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 200, 110, 0, 200 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000087 @ personality
	.string "CROBAT$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_HAUNTER, ITEM_SALAC_BERRY
	.2byte MOVE_DESTINY_BOND, MOVE_HYPNOSIS, MOVE_CONFUSE_RAY, MOVE_TOXIC
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 100, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 20, 20, 20, 20, 20, 20, 0 @ IVs, ability
	.4byte 0x00000091 @ personality
	.string "HAUNTER$", 11
	.byte 255 @ friendship

	.byte 0x49, 0x4f, 0x01

	.align 2
gUnknown_84823CC::
	.byte 0x20, 0x08, 0x02, 0x0e
	.string "MAURA$", 11
	.byte FACILITY_CLASS_BEAUTY_2, 0x02
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_THE, EC_WORD_GROUP, EC_WORD_LEADER, EC_WORD_EXCL, 0xFFFF
	.2byte EC_WORD_WHAT, EC_WORD_AM, EC_WORD_I, EC_WORD_LEADER, EC_WORD_OF, EC_WORD_QUES
	.2byte EC_WORD_I_AM, EC_WORD_NO, EC_WORD_LEADER, EC_WORD_IT_S, EC_WORD_A_LITTLE, EC_WORD_LIE
	.2byte EC_WORD_HEY, EC_WORD_EXCL, EC_WORD_THE, EC_WORD_GROUND, EC_WORD_IS, EC_WORD_SLIMY

	.align 2
	.2byte SPECIES_PICHU, ITEM_FOCUS_BAND
	.2byte MOVE_THUNDER_SHOCK, MOVE_THUNDER_WAVE, MOVE_SWEET_KISS, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000005 @ personality
	.string "PICHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_MAREEP, ITEM_BRIGHT_POWDER
	.2byte MOVE_THUNDER_SHOCK, MOVE_CHARGE, MOVE_PROTECT, MOVE_RETURN
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "MAREEP$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_IGGLYBUFF, ITEM_QUICK_CLAW
	.2byte MOVE_SING, MOVE_SWEET_KISS, MOVE_PRESENT, MOVE_PROTECT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "IGGLYBUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLEFFA, ITEM_LAX_INCENSE
	.2byte MOVE_SING, MOVE_SWEET_KISS, MOVE_ENCORE, MOVE_METRONOME
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "CLEFFA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDORAN_F, ITEM_SITRUS_BERRY
	.2byte MOVE_CRUNCH, MOVE_DIG, MOVE_FLATTER, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "NIDORAN♀$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDORAN_M, ITEM_SITRUS_BERRY
	.2byte MOVE_HORN_DRILL, MOVE_SLUDGE_BOMB, MOVE_FLATTER, MOVE_ATTRACT
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 255, 0, 0, 255 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "NIDORAN♂$", 11
	.byte 255 @ friendship

	.string "MIKAELA$", 11
	.byte FACILITY_CLASS_LASS_2, 0x01
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_REALLY, EC_WORD_THE, EC_WORD_NO_1, EC_WORD_TRAINER, EC_WORD_HERE
	.2byte EC_WORD_NEVER, EC_WORD_SAID, EC_WORD_WHAT, EC_WORD_I_AM, EC_WORD_NO_1, EC_WORD_AT
	.2byte EC_WORD_NEXT, EC_WORD_TIME, EC_WORD_I, EC_WORD_WILL, EC_WORD_BE, EC_WORD_OVERWHELMING
	.2byte EC_WORD_YOU, EC_MOVE2(SPIT_UP), EC_WORD_ME, EC_WORD_AS_IF, EC_WORD_I_AM, EC_WORD_NOTHING

	.align 2
	.2byte SPECIES_NIDORINO, ITEM_CHOICE_BAND
	.2byte MOVE_SHOCK_WAVE, MOVE_HORN_DRILL, MOVE_ICE_BEAM, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 0, 255, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "NIDORINO$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDORINA, ITEM_CHOICE_BAND
	.2byte MOVE_SHOCK_WAVE, MOVE_CRUNCH, MOVE_BODY_SLAM, MOVE_COUNTER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 155, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "NIDORINA$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_PIKACHU, ITEM_LIGHT_BALL
	.2byte MOVE_SHOCK_WAVE, MOVE_THUNDER_WAVE, MOVE_COUNTER, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 200, 0, 255, 55 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000011 @ personality
	.string "PIKACHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_FLAAFFY, ITEM_BRIGHT_POWDER
	.2byte MOVE_SHOCK_WAVE, MOVE_DOUBLE_TEAM, MOVE_SEISMIC_TOSS, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 100, 0, 0, 150 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "FLAAFFY$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_JIGGLYPUFF, ITEM_CHOICE_BAND
	.2byte MOVE_SHOCK_WAVE, MOVE_SHADOW_BALL, MOVE_FOCUS_PUNCH, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 150, 0, 0, 105 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000016 @ personality
	.string "JIGGLYPUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLEFAIRY, ITEM_CHOICE_BAND
	.2byte MOVE_SHOCK_WAVE, MOVE_METEOR_MASH, MOVE_MOONLIGHT, MOVE_BODY_SLAM
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 100, 0, 0, 155 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "CLEFAIRY$", 11
	.byte 255 @ friendship

	.string "FLINT$", 11
	.byte FACILITY_CLASS_ENGINEER, 0x04
	.align 1
	.2byte EC_WORD_I_AM, EC_WORD_THE, EC_MOVE2(MILK_DRINK), EC_WORD_WORLD, EC_WORD_LEADER, EC_WORD_EXCL
	.2byte EC_WORD_I_VE, EC_WORD_WON, EC_WORD_THIS, EC_MOVE2(MILK_DRINK), EC_WORD_MATCH, EC_WORD_EXCL
	.2byte EC_WORD_I, EC_WORD_CAN_T, EC_WORD_DRINK, EC_WORD_ANY, EC_WORD_MORE, EC_WORD_DRINKS
	.2byte EC_WORD_WHOAH, EC_WORD_EXCL, EC_WORD_I_AM, EC_WORD_DROOLING, EC_WORD_ALL, EC_WORD_OVER

	.align 2
	.2byte SPECIES_WIGGLYTUFF, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_PSYCHIC, MOVE_WATER_PULSE, MOVE_FLAMETHROWER
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 0, 155, 0, 255, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x000000CF @ personality
	.string "WIGGLYTUFF$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_CLEFABLE, ITEM_SALAC_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_SOFT_BOILED, MOVE_METEOR_MASH, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 100, 0, 0, 150 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x000000CF @ personality
	.string "CLEFABLE$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDOQUEEN, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_CRUNCH, MOVE_SUPERPOWER, MOVE_SURF
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 200, 110, 0, 100, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000007 @ personality
	.string "NIDOQUEEN$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_NIDOKING, ITEM_CHOICE_BAND
	.2byte MOVE_THUNDERBOLT, MOVE_HYPER_BEAM, MOVE_MEGAHORN, MOVE_SHADOW_BALL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 150, 0, 0, 100 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000002 @ personality
	.string "NIDOKING$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_RAICHU, ITEM_SALAC_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_REVERSAL, MOVE_IRON_TAIL, MOVE_DOUBLE_EDGE
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 155, 150, 100, 0, 105 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "RAICHU$", 11
	.byte 255 @ friendship

	.align 2
	.2byte SPECIES_AMPHAROS, ITEM_LUM_BERRY
	.2byte MOVE_THUNDERBOLT, MOVE_REST, MOVE_BODY_SLAM, MOVE_IRON_TAIL
	.byte 0, 0x00 @ level, ppBonuses
	.byte 0, 255, 150, 0, 0, 105 @ EVs
	.align 2
	trainerid 0, 4096 @ OT ID
	ivs 15, 15, 15, 15, 15, 15, 0 @ IVs, ability
	.4byte 0x00000080 @ personality
	.string "AMPHAROS$", 11
	.byte 255 @ friendship

	.byte 0x80, 0x6b, 0x01

	.align 2
gUnknown_84827AC:: @ 84827AC
	.byte 0x08, 0x01
	.2byte 0
	.4byte 0

gUnknown_84827B4:: @ 84827B4
	.4byte gUnknown_847F16C
	.4byte gUnknown_847D26C
	.4byte gUnknown_84808AC
	.4byte gUnknown_847ABAC
	.4byte gUnknown_847CAAC
	.4byte gUnknown_847E9AC
	.4byte gUnknown_847AF8C
	.4byte gUnknown_847CE8C
	.4byte gUnknown_847DA2C
	.4byte gUnknown_847BF0C
	.4byte gUnknown_847D64C
	.4byte gUnknown_847DE0C
	.4byte gUnknown_847B74C
	.4byte gUnknown_847BB2C
	.4byte gUnknown_848182C
	.4byte gUnknown_847F92C
	.4byte gUnknown_847C2EC
	.4byte gUnknown_847C6CC
	.4byte gUnknown_847E5CC
	.4byte gUnknown_84804CC
	.4byte gUnknown_84823CC
	.4byte gUnknown_8481FEC
	.4byte gUnknown_84800EC
	.4byte gUnknown_847E1EC
	.4byte gUnknown_847ED8C
	.4byte gUnknown_848106C
	.4byte gUnknown_8480C8C
	.4byte gUnknown_847F92C
	.4byte gUnknown_847F54C
	.4byte gUnknown_847E1EC
	.4byte gUnknown_847D64C
	.4byte gUnknown_847C6CC
