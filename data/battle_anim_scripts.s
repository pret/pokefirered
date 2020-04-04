#include "constants/battle.h"
#include "constants/battle_anim.h"
#include "constants/songs.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "asm/macros/battle_anim_script.inc"

#define FALSE 0
#define TRUE 1

#define RGB(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
#define RGB_BLACK 0x0000
#define RGB_WHITE 0x7FFF
#define RGB_WHITEALPHA 0xFFFF

// BLDCNT
// Bits 0-5 select layers for the 1st target
#define BLDCNT_TGT1_BG0      (1 << 0)
#define BLDCNT_TGT1_BG1      (1 << 1)
#define BLDCNT_TGT1_BG2      (1 << 2)
#define BLDCNT_TGT1_BG3      (1 << 3)
#define BLDCNT_TGT1_OBJ      (1 << 4)
#define BLDCNT_TGT1_BD       (1 << 5)
// Bits 6-7 select the special effect
#define BLDCNT_EFFECT_NONE      (0 << 6)   // no special effect
#define BLDCNT_EFFECT_BLEND     (1 << 6)   // 1st+2nd targets mixed (controlled by BLDALPHA)
#define BLDCNT_EFFECT_LIGHTEN   (2 << 6)   // 1st target becomes whiter (controlled by BLDY)
#define BLDCNT_EFFECT_DARKEN    (3 << 6)   // 1st target becomes blacker (controlled by BLDY)
// Bits 8-13 select layers for the 2nd target
#define BLDCNT_TGT2_BG0      (1 << 8)
#define BLDCNT_TGT2_BG1      (1 << 9)
#define BLDCNT_TGT2_BG2      (1 << 10)
#define BLDCNT_TGT2_BG3      (1 << 11)
#define BLDCNT_TGT2_OBJ      (1 << 12)
#define BLDCNT_TGT2_BD       (1 << 13)
#define BLDCNT_TGT2_ALL      (BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD)

	.section script_data, "aw", %progbits

	.align 2
gMovesWithQuietBGM:: @ 81C68EC
	.2byte MOVE_SING
	.2byte MOVE_PERISH_SONG
	.2byte MOVE_GRASS_WHISTLE
	.2byte 0xFFFF

	.align 2
gBattleAnims_Moves::
	.4byte Move_NONE
	.4byte Move_POUND
	.4byte Move_KARATE_CHOP
	.4byte Move_DOUBLE_SLAP
	.4byte Move_COMET_PUNCH
	.4byte Move_MEGA_PUNCH
	.4byte Move_PAY_DAY
	.4byte Move_FIRE_PUNCH
	.4byte Move_ICE_PUNCH
	.4byte Move_THUNDER_PUNCH
	.4byte Move_SCRATCH
	.4byte Move_VICE_GRIP
	.4byte Move_GUILLOTINE
	.4byte Move_RAZOR_WIND
	.4byte Move_SWORDS_DANCE
	.4byte Move_CUT
	.4byte Move_GUST
	.4byte Move_WING_ATTACK
	.4byte Move_WHIRLWIND
	.4byte Move_FLY
	.4byte Move_BIND
	.4byte Move_SLAM
	.4byte Move_VINE_WHIP
	.4byte Move_STOMP
	.4byte Move_DOUBLE_KICK
	.4byte Move_MEGA_KICK
	.4byte Move_JUMP_KICK
	.4byte Move_ROLLING_KICK
	.4byte Move_SAND_ATTACK
	.4byte Move_HEADBUTT
	.4byte Move_HORN_ATTACK
	.4byte Move_FURY_ATTACK
	.4byte Move_HORN_DRILL
	.4byte Move_TACKLE
	.4byte Move_BODY_SLAM
	.4byte Move_WRAP
	.4byte Move_TAKE_DOWN
	.4byte Move_THRASH
	.4byte Move_DOUBLE_EDGE
	.4byte Move_TAIL_WHIP
	.4byte Move_POISON_STING
	.4byte Move_TWINEEDLE
	.4byte Move_PIN_MISSILE
	.4byte Move_LEER
	.4byte Move_BITE
	.4byte Move_GROWL
	.4byte Move_ROAR
	.4byte Move_SING
	.4byte Move_SUPERSONIC
	.4byte Move_SONIC_BOOM
	.4byte Move_DISABLE
	.4byte Move_ACID
	.4byte Move_EMBER
	.4byte Move_FLAMETHROWER
	.4byte Move_MIST
	.4byte Move_WATER_GUN
	.4byte Move_HYDRO_PUMP
	.4byte Move_SURF
	.4byte Move_ICE_BEAM
	.4byte Move_BLIZZARD
	.4byte Move_PSYBEAM
	.4byte Move_BUBBLE_BEAM
	.4byte Move_AURORA_BEAM
	.4byte Move_HYPER_BEAM
	.4byte Move_PECK
	.4byte Move_DRILL_PECK
	.4byte Move_SUBMISSION
	.4byte Move_LOW_KICK
	.4byte Move_COUNTER
	.4byte Move_SEISMIC_TOSS
	.4byte Move_STRENGTH
	.4byte Move_ABSORB
	.4byte Move_MEGA_DRAIN
	.4byte Move_LEECH_SEED
	.4byte Move_GROWTH
	.4byte Move_RAZOR_LEAF
	.4byte Move_SOLAR_BEAM
	.4byte Move_POISON_POWDER
	.4byte Move_STUN_SPORE
	.4byte Move_SLEEP_POWDER
	.4byte Move_PETAL_DANCE
	.4byte Move_STRING_SHOT
	.4byte Move_DRAGON_RAGE
	.4byte Move_FIRE_SPIN
	.4byte Move_THUNDER_SHOCK
	.4byte Move_THUNDERBOLT
	.4byte Move_THUNDER_WAVE
	.4byte Move_THUNDER
	.4byte Move_ROCK_THROW
	.4byte Move_EARTHQUAKE
	.4byte Move_FISSURE
	.4byte Move_DIG
	.4byte Move_TOXIC
	.4byte Move_CONFUSION
	.4byte Move_PSYCHIC
	.4byte Move_HYPNOSIS
	.4byte Move_MEDITATE
	.4byte Move_AGILITY
	.4byte Move_QUICK_ATTACK
	.4byte Move_RAGE
	.4byte Move_TELEPORT
	.4byte Move_NIGHT_SHADE
	.4byte Move_MIMIC
	.4byte Move_SCREECH
	.4byte Move_DOUBLE_TEAM
	.4byte Move_RECOVER
	.4byte Move_HARDEN
	.4byte Move_MINIMIZE
	.4byte Move_SMOKESCREEN
	.4byte Move_CONFUSE_RAY
	.4byte Move_WITHDRAW
	.4byte Move_DEFENSE_CURL
	.4byte Move_BARRIER
	.4byte Move_LIGHT_SCREEN
	.4byte Move_HAZE
	.4byte Move_REFLECT
	.4byte Move_FOCUS_ENERGY
	.4byte Move_BIDE
	.4byte Move_METRONOME
	.4byte Move_MIRROR_MOVE
	.4byte Move_SELF_DESTRUCT
	.4byte Move_EGG_BOMB
	.4byte Move_LICK
	.4byte Move_SMOG
	.4byte Move_SLUDGE
	.4byte Move_BONE_CLUB
	.4byte Move_FIRE_BLAST
	.4byte Move_WATERFALL
	.4byte Move_CLAMP
	.4byte Move_SWIFT
	.4byte Move_SKULL_BASH
	.4byte Move_SPIKE_CANNON
	.4byte Move_CONSTRICT
	.4byte Move_AMNESIA
	.4byte Move_KINESIS
	.4byte Move_SOFT_BOILED
	.4byte Move_HI_JUMP_KICK
	.4byte Move_GLARE
	.4byte Move_DREAM_EATER
	.4byte Move_POISON_GAS
	.4byte Move_BARRAGE
	.4byte Move_LEECH_LIFE
	.4byte Move_LOVELY_KISS
	.4byte Move_SKY_ATTACK
	.4byte Move_TRANSFORM
	.4byte Move_BUBBLE
	.4byte Move_DIZZY_PUNCH
	.4byte Move_SPORE
	.4byte Move_FLASH
	.4byte Move_PSYWAVE
	.4byte Move_SPLASH
	.4byte Move_ACID_ARMOR
	.4byte Move_CRABHAMMER
	.4byte Move_EXPLOSION
	.4byte Move_FURY_SWIPES
	.4byte Move_BONEMERANG
	.4byte Move_REST
	.4byte Move_ROCK_SLIDE
	.4byte Move_HYPER_FANG
	.4byte Move_SHARPEN
	.4byte Move_CONVERSION
	.4byte Move_TRI_ATTACK
	.4byte Move_SUPER_FANG
	.4byte Move_SLASH
	.4byte Move_SUBSTITUTE
	.4byte Move_STRUGGLE
	.4byte Move_SKETCH
	.4byte Move_TRIPLE_KICK
	.4byte Move_THIEF
	.4byte Move_SPIDER_WEB
	.4byte Move_MIND_READER
	.4byte Move_NIGHTMARE
	.4byte Move_FLAME_WHEEL
	.4byte Move_SNORE
	.4byte Move_CURSE
	.4byte Move_FLAIL
	.4byte Move_CONVERSION_2
	.4byte Move_AEROBLAST
	.4byte Move_COTTON_SPORE
	.4byte Move_REVERSAL
	.4byte Move_SPITE
	.4byte Move_POWDER_SNOW
	.4byte Move_PROTECT
	.4byte Move_MACH_PUNCH
	.4byte Move_SCARY_FACE
	.4byte Move_FAINT_ATTACK
	.4byte Move_SWEET_KISS
	.4byte Move_BELLY_DRUM
	.4byte Move_SLUDGE_BOMB
	.4byte Move_MUD_SLAP
	.4byte Move_OCTAZOOKA
	.4byte Move_SPIKES
	.4byte Move_ZAP_CANNON
	.4byte Move_FORESIGHT
	.4byte Move_DESTINY_BOND
	.4byte Move_PERISH_SONG
	.4byte Move_ICY_WIND
	.4byte Move_DETECT
	.4byte Move_BONE_RUSH
	.4byte Move_LOCK_ON
	.4byte Move_OUTRAGE
	.4byte Move_SANDSTORM
	.4byte Move_GIGA_DRAIN
	.4byte Move_ENDURE
	.4byte Move_CHARM
	.4byte Move_ROLLOUT
	.4byte Move_FALSE_SWIPE
	.4byte Move_SWAGGER
	.4byte Move_MILK_DRINK
	.4byte Move_SPARK
	.4byte Move_FURY_CUTTER
	.4byte Move_STEEL_WING
	.4byte Move_MEAN_LOOK
	.4byte Move_ATTRACT
	.4byte Move_SLEEP_TALK
	.4byte Move_HEAL_BELL
	.4byte Move_RETURN
	.4byte Move_PRESENT
	.4byte Move_FRUSTRATION
	.4byte Move_SAFEGUARD
	.4byte Move_PAIN_SPLIT
	.4byte Move_SACRED_FIRE
	.4byte Move_MAGNITUDE
	.4byte Move_DYNAMIC_PUNCH
	.4byte Move_MEGAHORN
	.4byte Move_DRAGON_BREATH
	.4byte Move_BATON_PASS
	.4byte Move_ENCORE
	.4byte Move_PURSUIT
	.4byte Move_RAPID_SPIN
	.4byte Move_SWEET_SCENT
	.4byte Move_IRON_TAIL
	.4byte Move_METAL_CLAW
	.4byte Move_VITAL_THROW
	.4byte Move_MORNING_SUN
	.4byte Move_SYNTHESIS
	.4byte Move_MOONLIGHT
	.4byte Move_HIDDEN_POWER
	.4byte Move_CROSS_CHOP
	.4byte Move_TWISTER
	.4byte Move_RAIN_DANCE
	.4byte Move_SUNNY_DAY
	.4byte Move_CRUNCH
	.4byte Move_MIRROR_COAT
	.4byte Move_PSYCH_UP
	.4byte Move_EXTREME_SPEED
	.4byte Move_ANCIENT_POWER
	.4byte Move_SHADOW_BALL
	.4byte Move_FUTURE_SIGHT
	.4byte Move_ROCK_SMASH
	.4byte Move_WHIRLPOOL
	.4byte Move_BEAT_UP
	.4byte Move_FAKE_OUT
	.4byte Move_UPROAR
	.4byte Move_STOCKPILE
	.4byte Move_SPIT_UP
	.4byte Move_SWALLOW
	.4byte Move_HEAT_WAVE
	.4byte Move_HAIL
	.4byte Move_TORMENT
	.4byte Move_FLATTER
	.4byte Move_WILL_O_WISP
	.4byte Move_MEMENTO
	.4byte Move_FACADE
	.4byte Move_FOCUS_PUNCH
	.4byte Move_SMELLING_SALT
	.4byte Move_FOLLOW_ME
	.4byte Move_ANCIENT_POWER
	.4byte Move_CHARGE
	.4byte Move_TAUNT
	.4byte Move_HELPING_HAND
	.4byte Move_TRICK
	.4byte Move_ROLE_PLAY
	.4byte Move_WISH
	.4byte Move_ASSIST
	.4byte Move_INGRAIN
	.4byte Move_SUPERPOWER
	.4byte Move_MAGIC_COAT
	.4byte Move_RECYCLE
	.4byte Move_REVENGE
	.4byte Move_BRICK_BREAK
	.4byte Move_YAWN
	.4byte Move_KNOCK_OFF
	.4byte Move_ENDEAVOR
	.4byte Move_ERUPTION
	.4byte Move_SKILL_SWAP
	.4byte Move_IMPRISON
	.4byte Move_REFRESH
	.4byte Move_GRUDGE
	.4byte Move_SNATCH
	.4byte Move_SECRET_POWER
	.4byte Move_DIVE
	.4byte Move_ARM_THRUST
	.4byte Move_CAMOUFLAGE
	.4byte Move_TAIL_GLOW
	.4byte Move_LUSTER_PURGE
	.4byte Move_MIST_BALL
	.4byte Move_FEATHER_DANCE
	.4byte Move_TEETER_DANCE
	.4byte Move_BLAZE_KICK
	.4byte Move_MUD_SPORT
	.4byte Move_ICE_BALL
	.4byte Move_NEEDLE_ARM
	.4byte Move_SLACK_OFF
	.4byte Move_HYPER_VOICE
	.4byte Move_POISON_FANG
	.4byte Move_CRUSH_CLAW
	.4byte Move_BLAST_BURN
	.4byte Move_HYDRO_CANNON
	.4byte Move_METEOR_MASH
	.4byte Move_ASTONISH
	.4byte Move_WEATHER_BALL
	.4byte Move_AROMATHERAPY
	.4byte Move_FAKE_TEARS
	.4byte Move_AIR_CUTTER
	.4byte Move_OVERHEAT
	.4byte Move_ODOR_SLEUTH
	.4byte Move_ROCK_TOMB
	.4byte Move_SILVER_WIND
	.4byte Move_METAL_SOUND
	.4byte Move_GRASS_WHISTLE
	.4byte Move_TICKLE
	.4byte Move_COSMIC_POWER
	.4byte Move_WATER_SPOUT
	.4byte Move_SIGNAL_BEAM
	.4byte Move_SHADOW_PUNCH
	.4byte Move_EXTRASENSORY
	.4byte Move_SKY_UPPERCUT
	.4byte Move_SAND_TOMB
	.4byte Move_SHEER_COLD
	.4byte Move_MUDDY_WATER
	.4byte Move_BULLET_SEED
	.4byte Move_AERIAL_ACE
	.4byte Move_ICICLE_SPEAR
	.4byte Move_IRON_DEFENSE
	.4byte Move_BLOCK
	.4byte Move_HOWL
	.4byte Move_DRAGON_CLAW
	.4byte Move_FRENZY_PLANT
	.4byte Move_BULK_UP
	.4byte Move_BOUNCE
	.4byte Move_MUD_SHOT
	.4byte Move_POISON_TAIL
	.4byte Move_COVET
	.4byte Move_VOLT_TACKLE
	.4byte Move_MAGICAL_LEAF
	.4byte Move_WATER_SPORT
	.4byte Move_CALM_MIND
	.4byte Move_LEAF_BLADE
	.4byte Move_DRAGON_DANCE
	.4byte Move_ROCK_BLAST
	.4byte Move_SHOCK_WAVE
	.4byte Move_WATER_PULSE
	.4byte Move_DOOM_DESIRE
	.4byte Move_PSYCHO_BOOST
	.4byte Move_COUNT

gBattleAnims_StatusConditions::
	.4byte Status_Poison
	.4byte Status_Confusion
	.4byte Status_Burn
	.4byte Status_Infatuation
	.4byte Status_Sleep
	.4byte Status_Paralysis
	.4byte Status_Freeze
	.4byte Status_Curse
	.4byte Status_Nightmare

gBattleAnims_General::
	.4byte General_CastformChange
	.4byte General_StatsChange
	.4byte General_SubstituteFade
	.4byte General_SubstituteAppear
	.4byte General_PokeblockThrow
	.4byte General_ItemKnockoff
	.4byte General_TurnTrap
	.4byte General_ItemEffect
	.4byte General_SmokeballEscape
	.4byte General_HangedOn
	.4byte General_Rain
	.4byte General_Sun
	.4byte General_Sandstorm
	.4byte General_Hail
	.4byte General_LeechSeedDrain
	.4byte General_MonHit
	.4byte General_ItemSteal
	.4byte General_SnatchMove
	.4byte General_FutureSightHit
	.4byte General_DoomDesireHit
	.4byte General_FocusPunchSetUp
	.4byte General_IngrainHeal
	.4byte General_WishHeal
	.4byte gUnknown_81D628A
	.4byte gUnknown_81D6301
	.4byte gUnknown_81D637B
	.4byte gUnknown_81D6394
	.4byte gUnknown_81D63DC

gBattleAnims_Special::
	.4byte Special_LevelUp
	.4byte Special_SwitchOutPlayerMon
	.4byte Special_SwitchOutOpponentMon
	.4byte Special_BallThrow
	.4byte Special_SafariBallThrow
	.4byte Special_SubstituteToMon
	.4byte Special_MonToSubstitute

Move_NONE:: @ 81C6F34
Move_POUND:: @ 81C6F34
Move_MIRROR_MOVE:: @ 81C6F34
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_DOUBLE_SLAP:: @ 81C6F65
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	choosetwoturnanim gUnknown_81C6F90, gUnknown_81C6FA4

gUnknown_81C6F76:: @ 81C6F76
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W003, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

gUnknown_81C6F90:: @ 81C6F90
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, 1, 2
	goto gUnknown_81C6F76

gUnknown_81C6FA4:: @ 81C6FA4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, 1, 2
	goto gUnknown_81C6F76

Move_POISON_POWDER:: @ 81C6FB8
	loadspritegfx ANIM_TAG_POISON_POWDER
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loopsewithpan SE_W077, 63, 10, 6
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -30, -22, 117, 80, 5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 10, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 96, 5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 69, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 15, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 96, 7, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 89, 5, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 20, -22, 117, 112, -8, 2
	createsprite gPoisonPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_STUN_SPORE:: @ 81C70E9
	loadspritegfx ANIM_TAG_STUN_SPORE
	loopsewithpan SE_W077, 63, 10, 6
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -30, -22, 117, 80, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 96, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 69, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 15, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 96, 7, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 89, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 20, -22, 117, 112, -8, 2
	createsprite gStunSporeParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_SLEEP_POWDER:: @ 81C7217
	loadspritegfx ANIM_TAG_SLEEP_POWDER
	loopsewithpan SE_W077, 63, 10, 6
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -30, -22, 117, 80, 5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 10, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 96, 5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 69, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -15, -22, 117, 112, 5, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 15, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 96, 7, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, -10, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 0, -22, 117, 89, 5, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 20, -22, 117, 112, -8, 2
	createsprite gSleepPowderParticleSpriteTemplate, ANIM_TARGET, 2, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_SWIFT:: @ 81C7345
	loadspritegfx ANIM_TAG_YELLOW_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 5, 22, -18, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, -10, 22, 15, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 18, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 18, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 12, 1
	delay 5
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_STRENGTH:: @ 81C73FE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_ShakeAndSinkMon, 5, 0, 2, 0, 96, 30
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 4
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 1, 18, 6, 2, 4
	delay 4
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 12, 1, 1
	delay 4
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, -12, 1, 1
	delay 4
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 3, 4, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_TACKLE:: @ 81C7492
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_BODY_SLAM:: @ 81C74D0
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	waitforvisualfinish
	delay 11
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 26, 0, 0, 5
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, 1, 0
	loopsewithpan SE_W025B, 63, 10, 2
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -28, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 12, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_SUPERSONIC:: @ 81C755D
	loadspritegfx ANIM_TAG_GOLD_RING
	monbg 2
	monbgprio_2A 0
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon2, 2, 0, 2, 0, 8, 1
	call gUnknown_81C759B
	call gUnknown_81C759B
	call gUnknown_81C759B
	call gUnknown_81C759B
	call gUnknown_81C759B
	call gUnknown_81C759B
	waitforvisualfinish
	clearmonbg 2
	blendoff
	end

gUnknown_81C759B:: @ 81C759B
	playsewithpan SE_W048, 192
	createsprite gSupersonicWaveSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_SCREECH:: @ 81C75B5
	loadspritegfx ANIM_TAG_PURPLE_RING
	createvisualtask AnimTask_ShakeMon2, 2, 0, 3, 0, 2, 1
	call gUnknown_81C75E8
	call gUnknown_81C75E8
	delay 16
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 2048, 2, 1
	waitforvisualfinish
	end

gUnknown_81C75E8:: @ 81C75E8
	playsewithpan SE_W103, 192
	createsprite gScreechWaveSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_FLAME_WHEEL:: @ 81C7602
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg 3
	monbgprio_2A 1
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 56, 0
	playsewithpan SE_W172, 192
	delay 2
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 56, 4
	playsewithpan SE_W172, 192
	delay 2
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 56, 8
	playsewithpan SE_W172, 192
	delay 2
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 56, 12
	playsewithpan SE_W172, 192
	delay 2
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 56, 16
	playsewithpan SE_W172, 192
	delay 2
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 56, 20
	playsewithpan SE_W172, 192
	delay 2
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 56, 24
	playsewithpan SE_W172, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 8, 1
	createvisualtask AnimTask_BlendMonInAndOut, 3, 1, 31, 12, 1, 1
	playsewithpan SE_W172B, 63
	call gUnknown_81D0950
	delay 7
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 9
	waitforvisualfinish
	clearmonbg 3
	end
	createsprite gUnknown_83E5DFC, ANIM_ATTACKER, 3, 0, 0, 50
	delay 4
	return

Move_PIN_MISSILE:: @ 81C76FC
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W026, 192
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 9
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 14
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_ICICLE_SPEAR:: @ 81C77C1
	loadspritegfx ANIM_TAG_ICICLE_SPEAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W196, 192
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 9
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 14
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_TAKE_DOWN:: @ 81C7886
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_WindUpLunge, 5, 0, -24, 8, 23, 10, 40, 10
	delay 35
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 10, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, 1, 0
	playsewithpan SE_W025B, 63
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -16, 0, 0, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 12, 1
	waitforvisualfinish
	delay 2
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_DOUBLE_EDGE:: @ 81C791A
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_W129, 192
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 4, 2, RGB_WHITE, 10, 0, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_W207, 192
	waitplaysewithpan SE_W207, 192, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 2, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 16, 16, RGB_WHITE
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, 1, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -32, 0, 0, 3
	waitforvisualfinish
	createvisualtask sub_8099980, 2, 8, -256, 0, 0
	createvisualtask sub_8099980, 2, 8, -256, 1, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 4, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 12, 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 16, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask sub_8099980, 2, 8, -256, 0, 1
	createvisualtask sub_8099980, 2, 8, -256, 1, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	end

Move_POISON_STING:: @ 81C7A2D
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W013B, 192
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 20, 0, -8, 0, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 5, 1
	playsewithpan SE_W030, 63
	waitforvisualfinish
	call gUnknown_81D575B
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_TWINEEDLE:: @ 81C7A82
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_W013B, 192, 6, 2
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 10, -4, 0, -4, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 20, 12, 10, 12, 20
	delay 20
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 5, 1
	createsprite gUnknown_83E7C20, ANIM_ATTACKER, 3, 0, -4, 1, 3
	loopsewithpan SE_W030, 63, 5, 2
	delay 1
	createsprite gUnknown_83E7C20, ANIM_ATTACKER, 3, 10, 12, 1, 3
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_FIRE_BLAST:: @ 81C7AF5
	loadspritegfx ANIM_TAG_SMALL_EMBER
	createsoundtask sub_80DCE10, 137, 138
	call gUnknown_81C7B89
	call gUnknown_81C7B89
	call gUnknown_81C7B89
	delay 24
	createvisualtask AnimTask_BlendSelected, 10, 1, 3, 0, 8, RGB_BLACK
	waitforvisualfinish
	delay 19
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 20, 1
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	delay 3
	call gUnknown_81C7BCD
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 2, 8, 0, RGB_BLACK
	waitforvisualfinish
	end

gUnknown_81C7B89:: @ 81C7B89
	createsprite gUnknown_83E5D94, ANIM_TARGET, 2, 0, 0, 0
	createsprite gUnknown_83E5D94, ANIM_TARGET, 2, 0, 0, 51
	createsprite gUnknown_83E5D94, ANIM_TARGET, 2, 0, 0, 102
	createsprite gUnknown_83E5D94, ANIM_TARGET, 2, 0, 0, 153
	createsprite gUnknown_83E5D94, ANIM_TARGET, 2, 0, 0, 204
	delay 5
	return

gUnknown_81C7BCD:: @ 81C7BCD
	createsprite gUnknown_83E5DE4, ANIM_TARGET, 2, 0, 0, 10, 0, -2
	createsprite gUnknown_83E5DE4, ANIM_TARGET, 2, 0, 0, 13, -2, 0
	createsprite gUnknown_83E5DE4, ANIM_TARGET, 2, 0, 0, 13, 2, 0
	createsprite gUnknown_83E5DE4, ANIM_TARGET, 2, 0, 0, 15, -2, 2
	createsprite gUnknown_83E5DE4, ANIM_TARGET, 2, 0, 0, 15, 2, 2
	return

Move_LEECH_SEED:: @ 81C7C23
	loadspritegfx ANIM_TAG_SEED
	playsewithpan SE_W077, 192
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, 0, 24, 35, -32
	delay 8
	playsewithpan SE_W077, 192
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, -16, 24, 35, -40
	delay 8
	playsewithpan SE_W077, 192
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, 16, 24, 35, -37
	delay 12
	loopsewithpan SE_W039, 63, 10, 8
	waitforvisualfinish
	end

Move_EMBER:: @ 81C7C79
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loopsewithpan SE_W052, 192, 5, 2
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, -16, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, 16, 24, 20, 1
	delay 16
	playsewithpan SE_W172, 63
	call gUnknown_81C7CD5
	call gUnknown_81C7CD5
	call gUnknown_81C7CD5
	end

gUnknown_81C7CD5:: @ 81C7CD5
	createsprite gEmberFlareSpriteTemplate, ANIM_TARGET, 2, -24, 24, 24, 24, 20, 1, 1
	delay 4
	return

Move_MEGA_PUNCH:: @ 81C7CED
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 1
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 0, 16, 0
	setalpha 12, 8
	playsewithpan SE_W025, 63
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 50
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 7, RGB_WHITE
	delay 50
	call gUnknown_81C7D89
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 22, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 8, 0, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end

gUnknown_81C7D89:: @ 81C7D89
	delay 2
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, gUnknown_81C7DC0
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, gUnknown_81C7DB2
	jumpargeq 7, 1, gUnknown_81C7DB9

gUnknown_81C7DB1:: @ 81C7DB1
	return

gUnknown_81C7DB2:: @ 81C7DB2
	changebg 4
	goto gUnknown_81C7DB1

gUnknown_81C7DB9:: @ 81C7DB9
	changebg 5
	goto gUnknown_81C7DB1

gUnknown_81C7DC0:: @ 81C7DC0
	changebg 6
	goto gUnknown_81C7DB1

Move_MEGA_KICK:: @ 81C7DC7
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 1
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 0, 16, 0
	setalpha 12, 8
	playsewithpan SE_W025, 63
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 50
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 7, RGB_WHITE
	delay 50
	playsewithpan SE_W025B, 63
	call gUnknown_81C7D89
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 22, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 8, 0, 0
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end

Move_COMET_PUNCH:: @ 81C7E63
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 1
	setalpha 12, 8
	choosetwoturnanim gUnknown_81C7E91, gUnknown_81C7EB6

gUnknown_81C7E77:: @ 81C7E77
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

gUnknown_81C7E91:: @ 81C7E91
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, -8, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, -8, 0, 8, 1, 0
	goto gUnknown_81C7E77

gUnknown_81C7EB6:: @ 81C7EB6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, -8, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 8, 0, 8, 1, 0
	goto gUnknown_81C7E77

Move_SONIC_BOOM:: @ 81C7EDB
	loadspritegfx ANIM_TAG_AIR_WAVE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	call gUnknown_81C7F12
	call gUnknown_81C7F12
	call gUnknown_81C7F12
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 10, 1
	call gUnknown_81C7F2A
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81C7F12:: @ 81C7F12
	playsewithpan SE_W013B, 192
	createsprite gSonicBoomSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 15
	delay 4
	return

gUnknown_81C7F2A:: @ 81C7F2A
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 2
	delay 4
	return

Move_THUNDER_SHOCK:: @ 81C7F3C
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask sub_80AE220, 5, 0, -44, 0
	playsewithpan SE_W085, 63
	delay 9
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	call gUnknown_81D58D4
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_THUNDERBOLT:: @ 81C7FAA
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SHOCK_3
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask sub_80AE220, 5, 24, -52, 0
	playsewithpan SE_W085, 63
	delay 7
	createvisualtask sub_80AE220, 5, -24, -52, 0
	playsewithpan SE_W085, 63
	delay 7
	createvisualtask sub_80AE220, 5, 0, -60, 1
	playsewithpan SE_W085, 63
	delay 9
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createsprite gUnknown_83E6058, ANIM_TARGET, 3, 44, 0, 0, 3
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 32, 44, 0, 40, 0, -32765
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 32, 44, 64, 40, 1, -32765
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 32, 44, 128, 40, 0, -32765
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 32, 44, 192, 40, 2, -32765
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 16, 44, 32, 40, 0, -32765
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 16, 44, 96, 40, 1, -32765
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 16, 44, 160, 40, 0, -32765
	createsprite gUnknown_83E6070, ANIM_TARGET, 4, 0, 0, 16, 44, 224, 40, 2, -32765
	playsewithpan SE_W063, 63
	delay 0
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 6, 6, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 2, 2, RGB_BLACK
	delay 6
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 6, 6, RGB_BLACK
	waitforvisualfinish
	delay 20
	waitplaysewithpan SE_W085B, 63, 19
	call gUnknown_81D58D4
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_THUNDER_WAVE:: @ 81C8160
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SPARK_2
	loadspritegfx ANIM_TAG_SPARK_H
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask sub_80AE220, 5, 0, -48, 0
	playsewithpan SE_W086, 63
	delay 20
	loopsewithpan SE_W085B, 63, 10, 4
	createsprite gUnknown_83E60B8, ANIM_TARGET, 2, -16, -16
	delay 4
	createsprite gUnknown_83E60B8, ANIM_TARGET, 2, -16, 0
	delay 4
	createsprite gUnknown_83E60B8, ANIM_TARGET, 2, -16, 16
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_BEAT_UP:: @ 81C81CF
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 1
	setalpha 12, 8
	choosetwoturnanim gUnknown_81C81E8, gUnknown_81C8259

gUnknown_81C81E3:: @ 81C81E3
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

gUnknown_81C81E8:: @ 81C81E8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -20, -20, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, -20, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 8, 0, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 8, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	goto gUnknown_81C81E3

gUnknown_81C8259:: @ 81C8259
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 12, -20, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 12, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -12, 0, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, -12, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	goto gUnknown_81C81E3

Move_STOMP:: @ 81C82CA
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W104, 63
	createsprite gUnknown_83E67D8, ANIM_ATTACKER, 3, 0, -32, 15
	delay 19
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, -8, 1, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 4, 9, 1
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_TAIL_WHIP:: @ 81C8311
	loopsewithpan SE_W039, 192, 24, 3
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 12, 4, 2, 3
	waitforvisualfinish
	end

Move_CUT:: @ 81C832A
	loadspritegfx ANIM_TAG_CUT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W015, 63
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

Move_HIDDEN_POWER:: @ 81C835C
	loadspritegfx ANIM_TAG_RED_ORB
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, 0, 0
	waitforvisualfinish
	delay 30
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 20479, 12, 5, 1
	delay 4
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, 0, 0
	playsewithpan SE_W179, 192
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 0
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 42
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 84
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 126
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 168
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 210
	delay 52
	setarg 7, 65535
	playsewithpan SE_W115, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, 0, 0
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 0
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 32
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 64
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 96
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 128
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 160
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 192
	createsprite gHiddenPowerOrbScatterSpriteTemplate, ANIM_TARGET, 2, 224
	end

Move_REVERSAL:: @ 81C8445
	loadspritegfx ANIM_TAG_BLUE_ORB
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_W197, 192
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 3, RGB_WHITE, 8, 0, 0
	waitforvisualfinish
	delay 30
	createvisualtask AnimTask_CurseBlendEffect, 2, 31, 3, 2, 0, 10, RGB_WHITE
	delay 10
	playsewithpan SE_W179, 192
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 0
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 42
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 84
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 126
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 168
	createsprite gReversalOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 210
	waitforvisualfinish
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 8
	playsewithpan SE_W233B, 63
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, RGB_WHITE, 8, 0, 0
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 10, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createvisualtask sub_8099BD4, 5, 0, 1, 8, 1, 0
	end

Move_PURSUIT:: @ 81C8520
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	fadetobg 1
	waitbgfadein
	delay 0
	setalpha 12, 8
	choosetwoturnanim gUnknown_81C853F, gUnknown_81C8568

gUnknown_81C8536:: @ 81C8536
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 0
	restorebg
	waitbgfadein
	end

gUnknown_81C853F:: @ 81C853F
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask sub_8099BD4, 5, 0, 1, 6, 1, 0
	goto gUnknown_81C8536

gUnknown_81C8568:: @ 81C8568
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createvisualtask sub_8099BD4, 5, 0, 1, 6, 1, 0
	goto gUnknown_81C8536

Move_SPIKE_CANNON:: @ 81C8591
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_WindUpLunge, 5, 0, -4, 0, 4, 6, 8, 4
	waitforvisualfinish
	loopsewithpan SE_W013B, 192, 5, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 10, -8, -8, -8, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 0, 0, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 8, 8, 20
	waitforvisualfinish
	createsprite gUnknown_83E7C20, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createsprite gUnknown_83E7C20, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createsprite gUnknown_83E7C20, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 7, 1
	loopsewithpan SE_W030, 63, 5, 3
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SWORDS_DANCE:: @ 81C8644
	loadspritegfx ANIM_TAG_SWORD
	monbg 0
	setalpha 12, 8
	playsewithpan SE_W014, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 16, 6, 1, 4
	createsprite gSwordsDanceBladeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	delay 22
	createvisualtask sub_80B9F6C, 2, 10005, 2, 2, 32754, 16, 0, 0
	waitforvisualfinish
	clearmonbg 0
	blendoff
	delay 1
	end

Move_PSYCH_UP:: @ 81C868A
	loadspritegfx ANIM_TAG_SPIRAL
	monbg 2
	createvisualtask sub_80B9CE4, 2, 1, 2, 6, 1, 11, 0
	setalpha 12, 8
	loopsewithpan SE_W060B, 192, 5, 10
	createsprite gUnknown_83E6DF8, ANIM_ATTACKER, 2, 0, 0, 0, 0
	createvisualtask AnimTask_SwayMon, 5, 0, 5, 2560, 8, 0
	delay 127
	delay 4
	playsewithpan SE_W060, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, 0, 1
	createvisualtask AnimTask_BlendSelected, 9, 2, 2, 10, 0, RGB(31, 31, 0)
	delay 30
	clearmonbg 2
	blendoff
	waitforvisualfinish
	end

Move_DIZZY_PUNCH:: @ 81C86FC
	loadspritegfx ANIM_TAG_DUCK
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	call gUnknown_81C8817
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 5, 16, 8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 16, 0, 1, 1
	playsewithpan SE_W004, 63
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, 16, 8, 160, -32
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, 16, 8, -256, -40
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, 16, 8, 128, -16
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, 16, 8, 416, -38
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, 16, 8, -128, -22
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, 16, 8, -384, -31
	delay 10
	call gUnknown_81C8817
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 5, -16, -8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -16, -16, 1, 1
	playsewithpan SE_W233B, 63
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, -16, -8, 160, -32
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, -16, -8, -256, -40
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, -16, -8, 128, -16
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, -16, -8, 416, -38
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, -16, -8, -128, -22
	createsprite gUnknown_83E67F0, ANIM_TARGET, 3, -16, -8, -384, -31
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

gUnknown_81C8817:: @ 81C8817
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 7, 1
	return

Move_FIRE_SPIN:: @ 81C8836
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_W221B, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 47, 1
	call gUnknown_81C885F
	call gUnknown_81C885F
	call gUnknown_81C885F
	waitforvisualfinish
	end

gUnknown_81C885F:: @ 81C885F
	createsprite gUnknown_83E7438, ANIM_TARGET, 2, 0, 28, 528, 30, 13, 50, 1
	delay 2
	createsprite gUnknown_83E7438, ANIM_TARGET, 2, 0, 32, 480, 20, 16, -46, 1
	delay 2
	createsprite gUnknown_83E7438, ANIM_TARGET, 2, 0, 33, 576, 20, 8, 42, 1
	delay 2
	createsprite gUnknown_83E7438, ANIM_TARGET, 2, 0, 31, 400, 25, 11, -42, 1
	delay 2
	createsprite gUnknown_83E7438, ANIM_TARGET, 2, 0, 28, 512, 25, 16, 46, 1
	delay 2
	createsprite gUnknown_83E7438, ANIM_TARGET, 2, 0, 33, 464, 30, 15, -50, 1
	delay 2
	return

Move_FURY_CUTTER:: @ 81C88EA
	loadspritegfx ANIM_TAG_CUT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W013, 63
	createvisualtask AnimTask_IsFuryCutterHitRight, 2, 
	jumpargeq 7, 0, gUnknown_81C8947
	goto gUnknown_81C8959

gUnknown_81C890A:: @ 81C890A
	createvisualtask AnimTask_GetFuryCutterHitCount, 2, 
	jumpargeq 7, 1, gUnknown_81C892E
	jumpargeq 7, 2, gUnknown_81C896B
	jumpargeq 7, 3, gUnknown_81C8985
	goto gUnknown_81C899F

gUnknown_81C892E:: @ 81C892E
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

gUnknown_81C8947:: @ 81C8947
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	goto gUnknown_81C890A

gUnknown_81C8959:: @ 81C8959
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 1
	goto gUnknown_81C890A

gUnknown_81C896B:: @ 81C896B
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 10505, 4, 0, 0
	goto gUnknown_81C892E

gUnknown_81C8985:: @ 81C8985
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 3, 10505, 4, 0, 0
	goto gUnknown_81C892E

gUnknown_81C899F:: @ 81C899F
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 3, 10505, 4, 0, 0
	goto gUnknown_81C892E

Move_SELF_DESTRUCT:: @ 81C89B9
	loadspritegfx ANIM_TAG_EXPLOSION
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 9, RGB(31, 0, 0)
	createvisualtask AnimTask_ShakeMon2, 5, 4, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 6, 0, 38, 1
	call gUnknown_81C8A3F
	call gUnknown_81C8A3F
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 9, 0, RGB(31, 0, 0)
	end

gUnknown_81C8A3F:: @ 81C8A3F
	playsewithpan SE_W120, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 0, 1
	delay 6
	return

Move_SLAM:: @ 81C8AA9
	loadspritegfx ANIM_TAG_SLAM_HIT
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W004, 192
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 3, 0, 4
	delay 1
	createsprite gSlamHitSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	delay 3
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -12, 10, 0, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 0, 3, 6, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_VINE_WHIP:: @ 81C8B31
	loadspritegfx ANIM_TAG_WHIP_HIT
	playsewithpan SE_W026, 192
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 6
	playsewithpan SE_W010, 63
	createsprite gVineWhipSpriteTemplate, ANIM_TARGET, 2, 0, 0
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 6, 1
	end

Move_DRILL_PECK:: @ 81C8B68
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	delay 2
	loopsewithpan SE_W030, 63, 4, 8
	createvisualtask sub_80B2868, 5, 
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 18, 1
	waitforvisualfinish
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	waitforvisualfinish
	end

Move_WATERFALL:: @ 81C8BC1
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg 3
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 23, 1
	delay 5
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 10, 10, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, -15, 0, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 20, 10, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 0, -10, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, -10, 15, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 25, 20, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, -20, 20, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 12, 0, 25, 0
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 5
	delay 6
	call gUnknown_81C8CA2
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81C8CA2:: @ 81C8CA2
	playsewithpan SE_W127, 63
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 17, 1
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, 20, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 20
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 20
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, 15, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 15
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 15
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, 10, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 10
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 10
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, 5, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 5
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 5
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 0
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, 0
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, -5, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -5
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -5
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, -10, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -10
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -10
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, -15, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -15
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -15
	delay 2
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 3, 0, -20, 1, 1
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -20
	createsprite gUnknown_83E5AC8, ANIM_ATTACKER, 4, 0, -20
	return

Move_EXPLOSION:: @ 81C8E15
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 8, 9, 8474, 8, 0, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call gUnknown_81C8EB2
	call gUnknown_81C8EB2
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendSelected, 10, 1, 3, 16, 0, RGB_WHITE
	end

gUnknown_81C8EB2:: @ 81C8EB2
	playsewithpan SE_W153, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 0, 1
	delay 6
	return

Move_DEFENSE_CURL:: @ 81C8F1C
	loadspritegfx ANIM_TAG_ECLIPSING_ORB
	loopsewithpan SE_W161, 192, 18, 3
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 0, 0
	createvisualtask AnimTask_DefenseCurlDeformMon, 5, 
	waitforvisualfinish
	createsprite gEclipsingOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 6, 0, 1
	waitforvisualfinish
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 0, 1
	waitforvisualfinish
	end

Move_PROTECT:: @ 81C8F55
	loadspritegfx ANIM_TAG_PROTECT
	monbg 2
	monbgprio_28 0
	waitplaysewithpan SE_W115, 192, 16
	createsprite gProtectWallSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 90
	waitforvisualfinish
	clearmonbg 2
	end

Move_DETECT:: @ 81C8F72
	loadspritegfx ANIM_TAG_SPARKLE_4
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 9, 0
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 9, RGB_WHITE
	delay 18
	playsewithpan SE_W197, 192
	createsprite gSpriteTemplate_83BF480, ANIM_ATTACKER, 13, 20, -20
	waitforvisualfinish
	delay 10
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 9, 0, 0
	createvisualtask AnimTask_BlendSelected, 10, 2, 2, 9, 0, RGB_WHITE
	waitforvisualfinish
	end

Move_FRUSTRATION:: @ 81C8FD0
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ANGER
	monbg 3
	setalpha 12, 8
	createvisualtask AnimTask_GetFrustrationPowerLevel, 1, 
	jumpargeq 7, 0, gUnknown_81C9004
	jumpargeq 7, 1, gUnknown_81C910A
	jumpargeq 7, 2, gUnknown_81C91D7
	goto gUnknown_81C9253

gUnknown_81C8FFF:: @ 81C8FFF
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81C9004:: @ 81C9004
	playsewithpan SE_W082, 192
	createvisualtask AnimTask_ShakeMon2, 5, 0, 1, 0, 15, 1
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 0, 9, RGB(31, 0, 0)
	waitforvisualfinish
	delay 20
	playsewithpan SE_W207B, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	playsewithpan SE_W207B, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_SwayMon, 5, 0, 16, 6144, 8, 0
	delay 5
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 30, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 24, 8, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -24, -16, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 4, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, 19, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, -18, 1, 0
	playsewithpan SE_W004, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 9, 0, RGB(31, 0, 0)
	goto gUnknown_81C8FFF

gUnknown_81C910A:: @ 81C910A
	playsewithpan SE_W082, 192
	createvisualtask AnimTask_ShakeMon2, 5, 0, 1, 0, 15, 1
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 0, 9, RGB(31, 0, 0)
	waitforvisualfinish
	delay 20
	playsewithpan SE_W207B, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createvisualtask AnimTask_StrongFrustrationGrowAndShrink, 5, 
	delay 7
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 8, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	delay 14
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 12, -6, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	delay 14
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -12, -6, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 9, 0, RGB(31, 0, 0)
	goto gUnknown_81C8FFF

gUnknown_81C91D7:: @ 81C91D7
	playsewithpan SE_W207B, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 4, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -4, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	goto gUnknown_81C8FFF

gUnknown_81C9253:: @ 81C9253
	createsprite gWeakFrustrationAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 20, -28
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 10, 2
	delay 12
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 6, 1
	goto gUnknown_81C8FFF

Move_SAFEGUARD:: @ 81C9297
	loadspritegfx ANIM_TAG_GUARD_RING
	monbg 2
	setalpha 8, 8
	playsewithpan SE_W208, 192
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 4
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 4
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2, 
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 10, 0, 2, 0, 10, RGB_WHITE
	waitforvisualfinish
	clearmonbg 2
	blendoff
	end

Move_PAIN_SPLIT:: @ 81C92D9
	loadspritegfx ANIM_TAG_PAIN_SPLIT
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, -8, -42, 0
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, -8, -42, 1
	delay 10
	playsewithpan SE_W207B, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 0, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 1, 0
	waitforvisualfinish
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, -24, -42, 0
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, -24, -42, 1
	delay 10
	playsewithpan SE_W207B, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 0, 1
	createvisualtask AnimTask_PainSplitMovement, 2, 1, 1
	waitforvisualfinish
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, 8, -42, 0
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, 8, -42, 1
	delay 10
	playsewithpan SE_W207B, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 0, 2
	createvisualtask AnimTask_PainSplitMovement, 2, 1, 2
	end

Move_VICE_GRIP:: @ 81C9381
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W011, 63
	createsprite gViceGripSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gViceGripSpriteTemplate, ANIM_ATTACKER, 2, 1
	delay 9
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 5, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_GUILLOTINE:: @ 81C93C9
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	fadetobgfromset 12, 13, 14
	waitbgfadein
	playsewithpan SE_W011, 63
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 16, RGB_BLACK
	delay 9
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 23, 1
	delay 46
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 8, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 8, 0, 0
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadein
	end

Move_PAY_DAY:: @ 81C9455
	loadspritegfx ANIM_TAG_COIN
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W013B, 192
	createsprite gCoinThrowSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 1152
	waitforvisualfinish
	playsewithpan SE_W006, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 1, 2
	createsprite gFallingCoinSpriteTemplate, ANIM_ATTACKER, 2, 
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_OUTRAGE:: @ 81C94A8
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loopsewithpan SE_W082, 192, 8, 3
	createvisualtask AnimTask_CurseBlendEffect, 2, 7, 2, 5, 3, 8, 430
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 12, 6, 5, 4
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 1280, 0, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 0, -1280, 3
	delay 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 40, 1
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, -1280, -768, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 1280, 0, 3
	call gUnknown_81C95AF
	call gUnknown_81C95AF
	waitforvisualfinish
	end

gUnknown_81C95AF:: @ 81C95AF
	delay 3
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 0, -1280, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gUnknown_83E772C, ANIM_TARGET, 2, 0, 0, 30, -1280, -768, 3
	return

Move_SPARK:: @ 81C9643
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SPARK_2
	delay 0
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 5, 5, 23551
	playsewithpan SE_W085B, 192
	createsprite gUnknown_83E5FC4, ANIM_ATTACKER, 0, 32, 24, 190, 12, 0, 1, 0
	delay 0
	createsprite gUnknown_83E5FC4, ANIM_ATTACKER, 0, 80, 24, 22, 12, 0, 1, 0
	createsprite gUnknown_83E5FC4, ANIM_ATTACKER, 0, 156, 24, 121, 13, 0, 1, 1
	delay 0
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 0, 0, 23551
	delay 10
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 5, 5, 23551
	playsewithpan SE_W085B, 192
	createsprite gUnknown_83E5FC4, ANIM_ATTACKER, 0, 100, 24, 60, 10, 0, 1, 0
	createsprite gUnknown_83E5FC4, ANIM_ATTACKER, 0, 170, 24, 42, 11, 0, 1, 1
	delay 0
	createsprite gUnknown_83E5FC4, ANIM_ATTACKER, 0, 238, 24, 165, 10, 0, 1, 1
	delay 0
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 0, 0, 23551
	delay 20
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 7, 7, 23551
	playsewithpan SE_W085B, 192
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 32, 12, 0, 20, 0, 0
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 32, 12, 64, 20, 1, 0
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 32, 12, 128, 20, 0, 0
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 32, 12, 192, 20, 2, 0
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 16, 12, 32, 20, 0, 0
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 16, 12, 96, 20, 1, 0
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 16, 12, 160, 20, 0, 0
	createsprite gUnknown_83E6070, ANIM_ATTACKER, 4, 0, 0, 16, 12, 224, 20, 2, 0
	delay 4
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 0, 0, 23551
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 4
	playsewithpan SE_W063, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, -31, 2, 0, 6, 23551
	call gUnknown_81D58D4
	waitforvisualfinish
	end

Move_ATTRACT:: @ 81C985A
	loadspritegfx ANIM_TAG_RED_HEART
	loopsewithpan SE_W204, 192, 12, 3
	createvisualtask AnimTask_SwayMon, 5, 0, 12, 4096, 4, 0
	delay 15
	createsprite gRedHeartProjectileSpriteTemplate, ANIM_TARGET, 3, 20, -8
	waitforvisualfinish
	playsewithpan SE_W213, 63
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 160, -32
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -256, -40
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 128, -16
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -128, -22
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -384, -31
	waitforvisualfinish
	waitplaysewithpan SE_W213B, 0, 15
	createvisualtask AnimTask_HeartsBackground, 5, 
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 16, 256, 0
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 224, 240, 15
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 126, 272, 30
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 80, 224, 45
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 170, 272, 60
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 40, 256, 75
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 112, 256, 90
	createsprite gRedHeartRisingSpriteTemplate, ANIM_ATTACKER, 40, 200, 272, 90
	delay 75
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 4, 4, 0, 10, 28479
	end

Move_GROWTH:: @ 81C9953
	call gUnknown_81C9960
	waitforvisualfinish
	call gUnknown_81C9960
	waitforvisualfinish
	end

gUnknown_81C9960:: @ 81C9960
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, RGB_WHITE
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -3, -3, 16, 0, 0
	return

Move_WHIRLWIND:: @ 81C9989
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gUnknown_83E6C84, ANIM_ATTACKER, 2, 0, -8, 1, 60, 0
	createsprite gUnknown_83E6C84, ANIM_ATTACKER, 2, 0, 0, 1, 60, 1
	createsprite gUnknown_83E6C84, ANIM_ATTACKER, 2, 0, 8, 1, 60, 2
	createsprite gUnknown_83E6C84, ANIM_ATTACKER, 2, 0, 16, 1, 60, 3
	createsprite gUnknown_83E6C84, ANIM_ATTACKER, 2, 0, 24, 1, 60, 4
	createsprite gUnknown_83E6C84, ANIM_ATTACKER, 2, 0, 32, 1, 60, 0
	delay 5
	loopsewithpan SE_W104, 63, 10, 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 15, 1
	delay 29
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 1, 12, 6, 1, 5
	delay 7
	playsewithpan SE_W081, 63
	createvisualtask sub_80995FC, 5, 1, 8
	waitforvisualfinish
	end

Move_CONFUSE_RAY:: @ 81C9A31
	loadspritegfx ANIM_TAG_YELLOW_BALL
	monbg 3
	fadetobg 2
	waitbgfadein
	createvisualtask sub_80DD444, 2, -64, 63, 2, 0
	createvisualtask sub_80B9E58, 2, 10013, 0, 6, 0, 14, 351
	createsprite gUnknown_83E75C4, ANIM_TARGET, 2, 28, 0, 288
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_W081B, 63
	createsprite gUnknown_83E75DC, ANIM_TARGET, 2, 0, -16
	waitforvisualfinish
	delay 0
	blendoff
	clearmonbg 3
	restorebg
	waitbgfadein
	end

Move_LOCK_ON:: @ 81C9A84
	loadspritegfx ANIM_TAG_LOCK_ON
	createsprite gLockOnTargetSpriteTemplate, ANIM_ATTACKER, 40, 
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 1
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 2
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 3
	createsprite gLockOnMoveTargetSpriteTemplate, ANIM_ATTACKER, 40, 4
	delay 120
	setarg 7, 65535
	waitforvisualfinish
	end

Move_MEAN_LOOK:: @ 81C9ABA
	loadspritegfx ANIM_TAG_EYE
	monbg 3
	playsewithpan SE_W060, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 16, 0
	loopsewithpan SE_W109, 63, 15, 4
	waitplaysewithpan SE_W043, 63, 85
	createsprite gMeanLookEyeSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 120
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 16, 0, 0
	delay 30
	clearmonbg 3
	waitforvisualfinish
	end

Move_ROCK_THROW:: @ 81C9AFF
	loadspritegfx ANIM_TAG_ROCKS
	createsprite gUnknown_83E7B88, ANIM_TARGET, 2, 6, 1, 15, 1
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 0, 1, 0, 0
	playsewithpan SE_W088, 63
	delay 6
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 19, 1, 10, 0
	playsewithpan SE_W088, 63
	delay 6
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -23, 2, -10, 0
	playsewithpan SE_W088, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 5, 20, 1
	delay 6
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -15, 1, -10, 0
	playsewithpan SE_W088, 63
	delay 6
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 23, 2, 10, 0
	playsewithpan SE_W088, 63
	waitforvisualfinish
	end

Move_ROCK_SLIDE:: @ 81C9B8B
	loadspritegfx ANIM_TAG_ROCKS
	monbg 3
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, 7, 1, 11, 1
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -5, 1, -5, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 5, 0, 6, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 19, 1, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -23, 2, -10, 1
	playsewithpan SE_W088, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 5, 50, 1
	createvisualtask AnimTask_ShakeMon, 2, 3, 0, 5, 50, 1
	delay 2
	call gUnknown_81C9C23
	call gUnknown_81C9C23
	waitforvisualfinish
	clearmonbg 3
	end

gUnknown_81C9C23:: @ 81C9C23
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 28, 1, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -10, 1, -5, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 10, 0, 6, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 24, 1, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -32, 2, -10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gUnknown_83E73B4, ANIM_TARGET, 2, 30, 2, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	return

Move_THIEF:: @ 81C9CCC
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	delay 1
	fadetobg 1
	waitbgfadein
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 6
	playsewithpan SE_W233, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 8, 1
	waitforvisualfinish
	delay 20
	clearmonbg 1
	blendoff
	restorebg
	waitbgfadein
	end

Move_BUBBLE_BEAM:: @ 81C9D13
	loadspritegfx ANIM_TAG_BUBBLE
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	delay 1
	call gUnknown_81C9D4D
	createvisualtask AnimTask_SwayMon, 5, 0, 3, 3072, 8, 1
	call gUnknown_81C9D4D
	call gUnknown_81C9D4D
	waitforvisualfinish
	call gUnknown_81D57CC
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

gUnknown_81C9D4D:: @ 81C9D4D
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 35, 70, 0, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 20, 40, -10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 10, -60, 0, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 15, -15, 10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 30, 10, -10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 25, -30, 10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	return

Move_ICY_WIND:: @ 81C9DF0
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_ICE_SPIKES
	monbg 3
	createvisualtask AnimTask_BlendSelected, 10, 11, 4, 0, 4, RGB_BLACK
	fadetobg 15
	waitbgfadeout
	playsewithpan SE_W196, 0
	waitbgfadein
	waitforvisualfinish
	panse_1B SE_W016, 192, 63, 2, 0
	call gUnknown_81C9E48
	delay 5
	call gUnknown_81C9E48
	playsewithpan SE_W016B, 63
	delay 55
	call gUnknown_81D55E2
	waitforvisualfinish
	clearmonbg 3
	restorebg
	waitbgfadeout
	createvisualtask AnimTask_BlendSelected, 10, 11, 4, 4, 0, RGB_BLACK
	waitbgfadein
	end

gUnknown_81C9E48:: @ 81C9E48
	createsprite gUnknown_83E6410, ANIM_TARGET, 40, 0, 0, 0, 0, 72, 1
	delay 5
	createsprite gUnknown_83E6410, ANIM_TARGET, 40, 0, 10, 0, 10, 72, 1
	delay 5
	createsprite gUnknown_83E6410, ANIM_TARGET, 40, 0, -10, 0, -10, 72, 1
	delay 5
	createsprite gUnknown_83E6410, ANIM_TARGET, 40, 0, 15, 0, 15, 72, 1
	delay 5
	createsprite gUnknown_83E6410, ANIM_TARGET, 40, 0, -5, 0, -5, 72, 1
	return

Move_SMOKESCREEN:: @ 81C9EB0
	loadspritegfx ANIM_TAG_BLACK_SMOKE
	loadspritegfx ANIM_TAG_BLACK_BALL
	playsewithpan SE_W104, 192
	createsprite gBlackBallSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 35, -25
	waitforvisualfinish
	createvisualtask AnimTask_SmokescreenImpact, 2, 
	delay 2
	playsewithpan SE_W028, 63
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -12, 104, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -12, 72, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -6, 56, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, -6, 88, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 0, 56, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 0, 88, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 6, 72, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 6, 104, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 12, 72, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 12, 56, 1, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 18, 80, 0, 75
	createsprite gBlackSmokeSpriteTemplate, ANIM_TARGET, 4, 0, 18, 72, 1, 75
	waitforvisualfinish
	end

Move_CONVERSION:: @ 81C9FA9
	loadspritegfx ANIM_TAG_CONVERSION
	monbg 2
	monbgprio_28 0
	setalpha 16, 0
	delay 0
	playsewithpan SE_W129, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, -24
	delay 3
	playsewithpan SE_W129, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, -8
	delay 3
	playsewithpan SE_W129, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, 8
	delay 3
	playsewithpan SE_W129, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, 24
	delay 20
	playsewithpan SE_W112, 192
	createvisualtask sub_80B9F6C, 2, 10018, 1, 1, 14335, 12, 0, 0
	delay 6
	createvisualtask AnimTask_ConversionAlphaBlend, 5, 
	waitforvisualfinish
	delay 1
	clearmonbg 2
	blendoff
	end

Move_CONVERSION_2:: @ 81CA0BE
	loadspritegfx ANIM_TAG_CONVERSION
	monbg 3
	monbgprio_2A 1
	setalpha 0, 16
	delay 0
	playsewithpan SE_W112, 63
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, -24, 60
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, -24, 65
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, -24, 70
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, -24, 75
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, -8, 80
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, -8, 85
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, -8, 90
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, -8, 95
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, 8, 100
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, 8, 105
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, 8, 110
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, 8, 115
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -24, 24, 120
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, -8, 24, 125
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 8, 24, 130
	createsprite gConversion2SpriteTemplate, ANIM_ATTACKER, 2, 24, 24, 135
	createvisualtask AnimTask_Conversion2AlphaBlend, 5, 
	delay 60
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_ROLLING_KICK:: @ 81CA1DA
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 1, 4
	playsewithpan SE_W104, 192
	delay 6
	playsewithpan SE_W104, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	createsprite gUnknown_83E6758, ANIM_ATTACKER, 2, -24, 0, 48, 10, 160, 0
	delay 5
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 8
	clearmonbg 1
	blendoff
	end

Move_HEADBUTT:: @ 81CA25D
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	end

Move_HORN_ATTACK:: @ 81CA2BA
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 0, 0, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_W030, 63
	waitforvisualfinish
	end

Move_FURY_ATTACK:: @ 81CA327
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	createvisualtask sub_8099980, 2, 4, 256, 0, 2
	choosetwoturnanim gUnknown_81CA358, gUnknown_81CA37E

gUnknown_81CA345:: @ 81CA345
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	waitforvisualfinish
	end

gUnknown_81CA358:: @ 81CA358
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 8, 8, 10
	waitforvisualfinish
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_W030, 63
	goto gUnknown_81CA345

gUnknown_81CA37E:: @ 81CA37E
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, -8, -8, 10
	waitforvisualfinish
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_W030, 63
	goto gUnknown_81CA345

Move_HORN_DRILL:: @ 81CA3A4
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	jumpifcontest gUnknown_81CA50A
	fadetobg 7
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -2304, 768, 1, -1

gUnknown_81CA3C1:: @ 81CA3C1
	waitbgfadein
	setalpha 12, 8
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 0, 0, 12
	waitforvisualfinish
	playse SE_BAN
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 40, 1
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 0, 0, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 0, 2, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, -4, 3, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, -8, -5, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 4, -12, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 16, 0, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 5, 18, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, -17, 12, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, -21, -15, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 8, -27, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 32, 0, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

gUnknown_81CA50A:: @ 81CA50A
	fadetobg 8
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, 2304, 768, 0, -1
	goto gUnknown_81CA3C1

Move_THRASH:: @ 81CA521
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	createvisualtask AnimTask_ThrashMoveMonHorizontal, 2, 
	createvisualtask AnimTask_ThrashMoveMonVertical, 2, 
	createsprite gUnknown_83E6728, ANIM_TARGET, 3, 1, 10, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 7, 1
	playsewithpan SE_W004, 63
	delay 28
	createsprite gUnknown_83E6728, ANIM_TARGET, 3, 1, 10, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 7, 1
	playsewithpan SE_W233B, 63
	delay 28
	createsprite gUnknown_83E6728, ANIM_TARGET, 3, 1, 10, 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 8, 0, 16, 1
	playsewithpan SE_W025B, 63
	end

Move_SING:: @ 81CA5A0
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	monbg 3
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2, 
	waitforvisualfinish
	panse_1B SE_W047, 192, 63, 2, 0
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 7, 0, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 3, 12
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 3, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 2, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 3, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 0, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 2, 12
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 3, 12
	delay 4
	waitforvisualfinish
	clearmonbg 3
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2, 
	waitforvisualfinish
	end

Move_LOW_KICK:: @ 81CA674
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	createsprite gUnknown_83E6758, ANIM_TARGET, 2, -24, 28, 40, 8, 160, 0
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -8, 8, 1, 2
	createvisualtask sub_8099980, 2, 6, 384, 1, 2
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 4
	end

Move_EARTHQUAKE:: @ 81CA6D1
	createvisualtask sub_80B94B4, 5, 5, 10, 50
	createvisualtask sub_80B94B4, 5, 4, 10, 50
	playsewithpan SE_W089, 0
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	end

Move_FISSURE:: @ 81CA71E
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask sub_80B94B4, 3, 5, 10, 50
	createvisualtask sub_80B94B4, 3, 1, 10, 50
	playsewithpan SE_W089, 63
	delay 8
	call gUnknown_81CA79F
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 15
	call gUnknown_81CA7F0
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 15
	call gUnknown_81CA79F
	delay 50
	fadetobg 21
	waitbgfadeout
	createvisualtask sub_80B9800, 5, 1, 5, -1
	waitbgfadein
	delay 40
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

gUnknown_81CA79F:: @ 81CA79F
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 0, 12, -48, -16, 24
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 0, 16, -16, -10, 24
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 1, 14, -52, -18, 24
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 1, 12, -32, -16, 24
	playsewithpan SE_W091, 63
	return

gUnknown_81CA7F0:: @ 81CA7F0
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 0, 12, -24, -16, 24
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 0, 16, -38, -10, 24
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 1, 14, -20, -18, 24
	createsprite gUnknown_83E7AAC, ANIM_TARGET, 2, 1, 1, 12, -36, -16, 24
	playsewithpan SE_W091, 63
	return

Move_DIG:: @ 81CA841
	choosetwoturnanim gUnknown_81CA84B, gUnknown_81CA8A6

gUnknown_81CA84A:: @ 81CA84A
	end

gUnknown_81CA84B:: @ 81CA84B
	loadspritegfx ANIM_TAG_MUD_SAND
	loadspritegfx ANIM_TAG_DIRT_MOUND
	createsprite gUnknown_83E7AC4, ANIM_ATTACKER, 1, 0, 0, 180
	createsprite gUnknown_83E7AC4, ANIM_ATTACKER, 1, 0, 1, 180
	monbg_22 0
	delay 1
	createvisualtask sub_80B8E94, 2, 0
	delay 6
	call gUnknown_81CA90A
	call gUnknown_81CA90A
	call gUnknown_81CA90A
	call gUnknown_81CA90A
	call gUnknown_81CA90A
	waitforvisualfinish
	clearmonbg_23 0
	delay 1
	createvisualtask sub_80B8E94, 2, 1
	goto gUnknown_81CA84A

gUnknown_81CA8A6:: @ 81CA8A6
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_DIRT_MOUND
	createvisualtask sub_80B90EC, 2, 0
	waitforvisualfinish
	monbg 0
	createsprite gUnknown_83E7AC4, ANIM_ATTACKER, 1, 0, 0, 48
	createsprite gUnknown_83E7AC4, ANIM_ATTACKER, 1, 0, 1, 48
	delay 1
	createvisualtask sub_80B90EC, 2, 1
	delay 16
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	playsewithpan SE_W025B, 192
	clearmonbg 0
	goto gUnknown_81CA84A

gUnknown_81CA90A:: @ 81CA90A
	createsprite gUnknown_83E7AAC, ANIM_ATTACKER, 2, 0, 0, 12, 4, -16, 18
	createsprite gUnknown_83E7AAC, ANIM_ATTACKER, 2, 0, 0, 16, 4, -10, 18
	createsprite gUnknown_83E7AAC, ANIM_ATTACKER, 2, 0, 1, 14, 4, -18, 18
	createsprite gUnknown_83E7AAC, ANIM_ATTACKER, 2, 0, 1, 12, 4, -16, 18
	playsewithpan SE_W091, 192
	delay 32
	return

Move_MEDITATE:: @ 81CA95D
	call gUnknown_81D59BB
	createvisualtask sub_80B3418, 2, 
	playsewithpan SE_W029, 192
	delay 16
	playsewithpan SE_W036, 192
	waitforvisualfinish
	call gUnknown_81D59C7
	end

Move_AGILITY:: @ 81CA97A
	monbg 2
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 24, 6, 4, 4
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 7, 10
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	waitforvisualfinish
	clearmonbg 2
	blendoff
	delay 1
	end

Move_QUICK_ATTACK:: @ 81CA9C4
	loadspritegfx ANIM_TAG_IMPACT
	monbg 2
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 24, 6, 1, 5
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 7, 3
	playsewithpan SE_W026, 192
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg 2
	blendoff
	waitforvisualfinish
	end

Move_RAGE:: @ 81CAA1C
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ANGER
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 3, 0, 31, 10, 0, 2
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, -28
	playsewithpan SE_W207B, 192
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	playsewithpan SE_W207B, 192
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask sub_8099BD4, 2, 1, 1, 10, 1, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg 1
	end

Move_TELEPORT:: @ 81CAA92
	call gUnknown_81D59BB
	createvisualtask sub_80B3480, 2, 
	playsewithpan SE_W100, 192
	delay 15
	call gUnknown_81D59C7
	waitforvisualfinish
	end

Move_DOUBLE_TEAM:: @ 81CAAAB
	monbg 2
	setalpha 12, 8
	createvisualtask AnimTask_DoubleTeam, 2, 
	playsewithpan SE_W104, 192
	delay 32
	playsewithpan SE_W104, 192
	delay 24
	playsewithpan SE_W104, 192
	delay 16
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	waitforvisualfinish
	clearmonbg 2
	blendoff
	delay 1
	end

Move_MINIMIZE:: @ 81CAAF2
	setalpha 10, 8
	createvisualtask AnimTask_Minimize, 2, 
	loopsewithpan SE_W107, 192, 34, 3
	waitforvisualfinish
	blendoff
	end

Move_METRONOME:: @ 81CAB05
	loadspritegfx ANIM_TAG_FINGER
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 100
	playsewithpan SE_W118, 192
	delay 6
	createsprite gMetronomeFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 24
	loopsewithpan SE_W039, 192, 22, 3
	waitforvisualfinish
	end

Move_SKULL_BASH:: @ 81CAB2F
	choosetwoturnanim gUnknown_81CAB39, gUnknown_81CAB86

gUnknown_81CAB38:: @ 81CAB38
	end

gUnknown_81CAB39:: @ 81CAB39
	call gUnknown_81CAB49
	call gUnknown_81CAB49
	waitforvisualfinish
	goto gUnknown_81CAB38

gUnknown_81CAB49:: @ 81CAB49
	createsprite gUnknown_83D4EB4, ANIM_ATTACKER, 2, 0, -24, 0, 0, 10, 0
	playsewithpan SE_W036, 192
	waitforvisualfinish
	createvisualtask sub_8099980, 2, 16, 96, 0, 2
	waitforvisualfinish
	createsprite gUnknown_83D4EB4, ANIM_ATTACKER, 2, 0, 24, 0, 0, 10, 1
	waitforvisualfinish
	return

gUnknown_81CAB86:: @ 81CAB86
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SkullBashPosition, 2, 0
	playsewithpan SE_W036, 192
	waitforvisualfinish
	playse SE_BAN
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 40, 1
	createsprite gUnknown_83E7C98, ANIM_TARGET, 4, 0, 0, 1, 0
	loopsewithpan SE_W025B, 63, 8, 3
	waitforvisualfinish
	createvisualtask AnimTask_SkullBashPosition, 2, 1
	goto gUnknown_81CAB38

Move_AMNESIA:: @ 81CABF5
	loadspritegfx ANIM_TAG_AMNESIA
	call gUnknown_81D59BB
	delay 8
	createsprite gUnknown_83E6FF4, ANIM_ATTACKER, 20, 
	playsewithpan SE_W118, 192
	delay 54
	loopsewithpan SE_W118, 192, 16, 3
	waitforvisualfinish
	call gUnknown_81D59C7
	end

Move_KINESIS:: @ 81CAC19
	loadspritegfx ANIM_TAG_ALERT
	loadspritegfx ANIM_TAG_BENT_SPOON
	playsewithpan SE_W060, 192
	call gUnknown_81D59BB
	createsprite gUnknown_83E6F8C, ANIM_ATTACKER, 20, 
	createsprite gKinesisZapEnergySpriteTemplate, ANIM_ATTACKER, 19, 32, -8, 0
	createsprite gKinesisZapEnergySpriteTemplate, ANIM_ATTACKER, 19, 32, 16, 1
	loopsewithpan SE_W109, 192, 21, 2
	delay 60
	playsewithpan SE_W146, 192
	delay 30
	loopsewithpan SE_W146, 192, 20, 2
	delay 70
	playsewithpan SE_W207B, 192
	waitforvisualfinish
	call gUnknown_81D59C7
	end

Move_GLARE:: @ 81CAC6A
	loadspritegfx ANIM_TAG_SMALL_RED_EYE
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createvisualtask AnimTask_GlareEyeDots, 5, 0
	playsewithpan SE_W060B, 192
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 5, 1, 0, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	createvisualtask AnimTask_ScaryFace, 5, 
	playsewithpan SE_W043, 192
	delay 2
	createvisualtask sub_80ADAD8, 3, 20, 1, 0
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 5, 1, 0, 16, 0, RGB_BLACK
	end

Move_BARRAGE:: @ 81CACD3
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3, 
	playsewithpan SE_W207, 192
	delay 24
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, 1, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, 3, 0, 4, 20, 1
	loopsewithpan SE_W070, 63, 8, 2
	end

Move_SKY_ATTACK:: @ 81CAD1B
	choosetwoturnanim gUnknown_81CAD25, gUnknown_81CAE2E

gUnknown_81CAD24:: @ 81CAD24
	end

gUnknown_81CAD25:: @ 81CAD25
	monbg 3
	setalpha 12, 11
	createvisualtask AnimTask_GetTargetIsAttackerPartner, 5, 7
	jumpargeq 7, 0, gUnknown_81CAD40
	goto gUnknown_81CADB7

gUnknown_81CAD40:: @ 81CAD40
	createvisualtask AnimTask_BlendSelected, 10, 27, 1, 0, 12, RGB_BLACK
	waitforvisualfinish
	delay 12
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 8, 0, RGB_BLACK
	createvisualtask sub_80B94B4, 5, 0, 2, 16
	loopsewithpan SE_W287, 192, 4, 8
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 15, RGB_WHITE
	delay 20
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 15, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 25, 1, 8, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg 3
	blendoff
	goto gUnknown_81CAD24

gUnknown_81CADB7:: @ 81CADB7
	createvisualtask AnimTask_BlendExcept, 10, 1, 1, 0, 12, 0
	waitforvisualfinish
	delay 12
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 8, 0, RGB_BLACK
	createvisualtask sub_80B94B4, 5, 0, 2, 16
	playsewithpan SE_W287, 192
	delay 8
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 15, RGB_WHITE
	delay 20
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 15, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_BlendExcept, 10, 4, 1, 8, 0, 0
	waitforvisualfinish
	clearmonbg 3
	blendoff
	goto gUnknown_81CAD24

gUnknown_81CAE2E:: @ 81CAE2E
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_BIRD
	call gUnknown_81D59CF
	monbg 0
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 0, 16, RGB_WHITE
	delay 4
	createvisualtask sub_80B78E0, 5, 0
	waitforvisualfinish
	createvisualtask sub_80DD410, 5, 231, -64
	createsprite gUnknown_83E6DB4, ANIM_TARGET, 2, 
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, 1, 10, 0, 18, 1
	createvisualtask sub_80DD3DC, 5, 134, 63
	delay 20
	createvisualtask sub_80B79DC, 5, 1
	delay 2
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 15, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg 0
	call gUnknown_81D59FF
	goto gUnknown_81CAD24

Move_FLASH:: @ 81CAEB3
	playsewithpan SE_W043, 192
	createvisualtask sub_80BB660, 2, 
	waitforvisualfinish
	end

Move_SPLASH:: @ 81CAEC0
	createvisualtask AnimTask_Splash, 2, 0, 3
	delay 8
	loopsewithpan SE_W039, 192, 38, 3
	waitforvisualfinish
	end

Move_ACID_ARMOR:: @ 81CAED5
	monbg 0
	setalpha 15, 0
	createvisualtask AnimTask_AcidArmor, 2, 0
	playsewithpan SE_W151, 192
	waitforvisualfinish
	blendoff
	clearmonbg 0
	delay 1
	end

Move_SHARPEN:: @ 81CAEEE
	loadspritegfx ANIM_TAG_SPHERE_TO_CUBE
	createsprite gSharpenSphereSpriteTemplate, ANIM_ATTACKER, 2, 
	waitforvisualfinish
	end

Move_SUPER_FANG:: @ 81CAEFA
	loadspritegfx ANIM_TAG_FANG_ATTACK
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 1, 0, 20, 1
	playsewithpan SE_W082, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 3, 0, 48, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, 0, 1247, 12, 4, 1
	waitforvisualfinish
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 4
	createsprite gSuperFangSpriteTemplate, ANIM_TARGET, 2, 
	playsewithpan SE_W044, 63
	delay 8
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 2143, 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 7, 12, 1
	waitforvisualfinish
	blendoff
	end

Move_SLASH:: @ 81CAF7B
	loadspritegfx ANIM_TAG_SLASH
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_W013, 63
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 18, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	end

Move_STRUGGLE:: @ 81CAFB5
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MOVEMENT_WAVES
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 3, 0, 12, 4
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	createsprite gMovementWavesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 2
	loopsewithpan SE_W029, 192, 12, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SKETCH:: @ 81CB01B
	loadspritegfx ANIM_TAG_PENCIL
	monbg 1
	createvisualtask sub_80A8874, 2, 
	createsprite gPencilSpriteTemplate, ANIM_TARGET, 2, 
	waitforvisualfinish
	clearmonbg 1
	createvisualtask AnimTask_Splash, 2, 0, 2
	loopsewithpan SE_W039, 192, 38, 2
	end

Move_NIGHTMARE:: @ 81CB043
	fadetobg 2
	waitbgfadein
	jumpifcontest gUnknown_81CB06F
	monbg 3
	createvisualtask sub_80B58AC, 2, 
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 40, 1
	playsewithpan SE_W171, 63
	waitforvisualfinish
	clearmonbg 3
	restorebg
	waitbgfadein
	end

gUnknown_81CB06F:: @ 81CB06F
	createvisualtask AnimTask_BlendMonInAndOut, 2, 0, RGB_WHITE, 10, 2, 1
	createvisualtask AnimTask_ShakeMon, 2, 0, 3, 0, 32, 1
	playsewithpan SE_W171, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_FLAIL:: @ 81CB099
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_FlailMovement, 2, 0
	loopsewithpan SE_W029, 192, 8, 2
	waitforvisualfinish
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 3
	createvisualtask sub_8099BD4, 2, 0, 1, 30, 1, 0
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SPITE:: @ 81CB0D6
	fadetobg 2
	playsewithpan SE_W060, 192
	waitbgfadein
	monbg 3
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 6, 0, 8, RGB_WHITE
	createvisualtask sub_80B5AAC, 2, 
	loopsewithpan SE_W060, 63, 20, 3
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg 1
	end

Move_MACH_PUNCH:: @ 81CB105
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 2
	createvisualtask AnimTask_GetAttackerSide, 2, 
	jumpargeq 7, 1, gUnknown_81CB186
	fadetobg 9

gUnknown_81CB11E:: @ 81CB11E
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -2304, 0, 1, -1
	waitbgfadein
	delay 0
	setalpha 9, 8
	createvisualtask sub_8077030, 2, 28968, 10
	playsewithpan SE_W026, 192
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_W004, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 2
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

gUnknown_81CB186:: @ 81CB186
	fadetobg 10
	goto gUnknown_81CB11E

Move_FORESIGHT:: @ 81CB18D
	loadspritegfx ANIM_TAG_MAGNIFYING_GLASS
	monbg 3
	monbgprio_28 1
	setalpha 16, 0
	createsprite gForesightMagnifyingGlassSpriteTemplate, ANIM_TARGET, 2, 1
	delay 17
	loopsewithpan SE_W166, 63, 16, 4
	delay 48
	delay 24
	playsewithpan SE_W166, 63
	delay 10
	createvisualtask AnimTask_BlendMonInAndOut, 5, 1, RGB_WHITE, 12, 2, 1
	playsewithpan SE_W197, 63
	waitforvisualfinish
	blendoff
	clearmonbg 3
	end

Move_DESTINY_BOND:: @ 81CB1CC
	loadspritegfx ANIM_TAG_WHITE_SHADOW
	fadetobg 2
	playsewithpan SE_W060, 192
	waitbgfadein
	createvisualtask sub_80B6020, 5, 0, 48
	playsewithpan SE_W109, 192
	delay 48
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 24, 1
	createvisualtask AnimTask_BlendExcept, 2, 6, 1, 0, 12, 30653
	delay 24
	createvisualtask AnimTask_BlendExcept, 2, 6, 1, 12, 0, 30653
	playsewithpan SE_W171, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	blendoff
	clearmonbg 5
	end

Move_ENDURE:: @ 81CB227
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_W082, 192
	call gUnknown_81CB267
	delay 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	call gUnknown_81CB267
	delay 8
	call gUnknown_81CB267
	waitforvisualfinish
	end

gUnknown_81CB267:: @ 81CB267
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 26, 2
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, 14, 28, 1
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 10, 2
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 26, 3
	delay 4
	createsprite gEndureEnergySpriteTemplate, ANIM_ATTACKER, 2, 0, -12, 0, 1
	return

Move_CHARM:: @ 81CB2BB
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	createvisualtask AnimTask_RockMonBackAndForth, 5, 0, 2, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_W204, 192
	waitforvisualfinish
	end

Move_ROLLOUT:: @ 81CB2FE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MUD_SAND
	loadspritegfx ANIM_TAG_ROCKS
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask sub_80B4BD0, 2, 
	waitforvisualfinish
	createvisualtask sub_8099BD4, 2, 0, 1, 30, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 1, 2
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_FALSE_SWIPE:: @ 81CB33F
	loadspritegfx ANIM_TAG_SLASH_2
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gFalseSwipeSliceSpriteTemplate, ANIM_TARGET, 2, 
	playsewithpan SE_W233, 63
	delay 16
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 0
	playsewithpan SE_W104, 63
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 16
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 32
	playsewithpan SE_W104, 63
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 48
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 64
	playsewithpan SE_W104, 63
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 80
	delay 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, 1, 3
	playsewithpan SE_W004, 63
	end

Move_SWAGGER:: @ 81CB3C6
	loadspritegfx ANIM_TAG_BREATH
	loadspritegfx ANIM_TAG_ANGER
	createvisualtask AnimTask_GrowAndShrink, 2, 
	playsewithpan SE_W207, 192
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2, 
	loopsewithpan SE_W207, 192, 4, 2
	waitforvisualfinish
	delay 24
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_W207B, 63
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_W207B, 63
	waitforvisualfinish
	end

Move_MILK_DRINK:: @ 81CB40E
	loadspritegfx ANIM_TAG_MILK_BOTTLE
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg 1
	createsprite gMilkBottleSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 40
	playsewithpan SE_W152, 192
	delay 12
	playsewithpan SE_W152, 192
	delay 20
	playsewithpan SE_W152, 192
	waitforvisualfinish
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	playsewithpan SE_W208, 192
	waitforvisualfinish
	clearmonbg 1
	call gUnknown_81D5712
	waitforvisualfinish
	end

Move_MAGNITUDE:: @ 81CB450
	createvisualtask AnimTask_IsPowerOver99, 2, 
	waitforvisualfinish
	jumpargeq 15, 0, gUnknown_81CB469
	jumpargeq 15, 1, gUnknown_81CB48E

gUnknown_81CB468:: @ 81CB468
	end

gUnknown_81CB469:: @ 81CB469
	createvisualtask sub_80B94B4, 5, 5, 0, 50
	createvisualtask sub_80B94B4, 5, 4, 0, 50
	loopsewithpan SE_W070, 63, 8, 10
	goto gUnknown_81CB468

gUnknown_81CB48E:: @ 81CB48E
	createvisualtask sub_80B94B4, 5, 5, 0, 50
	createvisualtask sub_80B94B4, 5, 4, 0, 50
	loopsewithpan SE_W070, 63, 8, 10
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	goto gUnknown_81CB468

Move_RAPID_SPIN:: @ 81CB4E1
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_RAPID_SPIN
	monbg 0
	createsprite gRapidSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 32, -32, 40, -2
	createvisualtask AnimTask_RapinSpinMonElevation, 2, 0, 2, 0
	loopsewithpan SE_W013B, 192, 8, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask sub_8099BD4, 2, 0, 1, 10, 1, 0
	playsewithpan SE_W003, 63
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_RapinSpinMonElevation, 2, 0, 2, 1
	loopsewithpan SE_W013B, 192, 8, 4
	waitforvisualfinish
	clearmonbg 0
	end

Move_MOONLIGHT:: @ 81CB54E
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 16, 0
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 120, 56
	createvisualtask sub_8076048, 3, 0, 16, 16, 0, 1
	playsewithpan SE_W236, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -12, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, -24, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 21, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 0, 0
	delay 30
	createsprite gMoonlightSparkleSpriteTemplate, ANIM_ATTACKER, 40, 10, 0
	delay 20
	createvisualtask AnimTask_FadeScreenBlue, 2, 
	waitforvisualfinish
	call gUnknown_81D56C9
	waitforvisualfinish
	end

Move_EXTREME_SPEED:: @ 81CB5DE
	loadspritegfx ANIM_TAG_SPEED_DUST
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_GetAttackerSide, 2, 
	jumpargeq 7, 1, gUnknown_81CB695
	fadetobg 9

gUnknown_81CB5F5:: @ 81CB5F5
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -2304, 0, 1, -1
	waitbgfadein
	createvisualtask AnimTask_StretchAttacker, 2, 
	loopsewithpan SE_W013B, 192, 8, 3
	waitforvisualfinish
	delay 1
	createvisualtask sub_80BC12C, 2, 
	monbg 1
	setalpha 12, 8
	delay 18
	createvisualtask AnimTask_ExtremeSpeedImpact, 2, 
	delay 2
	playsewithpan SE_W004, 63
	createsprite gUnknown_83E7C68, ANIM_TARGET, 2, 1, 0, -12, 3
	delay 10
	playsewithpan SE_W004, 63
	createsprite gUnknown_83E7C68, ANIM_TARGET, 2, 1, 0, 12, 3
	delay 10
	playsewithpan SE_W233B, 63
	createsprite gUnknown_83E7C68, ANIM_TARGET, 2, 1, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_SpeedDust, 2, 
	delay 10
	createvisualtask AnimTask_ExtremeSpeedMonReappear, 2, 
	loopsewithpan SE_W104, 192, 8, 4
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	clearmonbg 1
	blendoff
	delay 1
	setarg 7, 4096
	delay 1
	end

gUnknown_81CB695:: @ 81CB695
	fadetobg 10
	goto gUnknown_81CB5F5

Move_UPROAR:: @ 81CB69C
	loadspritegfx ANIM_TAG_JAGGED_MUSIC_NOTE
	loadspritegfx ANIM_TAG_THIN_RING
	monbg 3
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_W253, 192
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 29, -12, 0
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -12, -29, 1
	delay 16
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_W253, 192
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 12, -29, 1
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -29, -12, 0
	delay 16
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_W253, 192
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, -24, 1
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, -24, 0
	waitforvisualfinish
	clearmonbg 3
	end

Move_HEAT_WAVE:: @ 81CB766
	loadspritegfx ANIM_TAG_FLYING_DIRT
	createvisualtask AnimTask_BlendParticle, 5, 10261, 0, 6, 6, 31
	createvisualtask AnimTask_LoadSandstormBackground, 5, 1
	createvisualtask AnimTask_BlendBackground, 6, 6, 31
	panse_1B SE_W257, 192, 63, 2, 0
	delay 4
	createvisualtask sub_80AD800, 5, 
	delay 12
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 10, 2304, 96, 1
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 90, 2048, 96, 1
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 50, 2560, 96, 1
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 20, 2304, 96, 1
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 70, 1984, 96, 1
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 0, 2816, 96, 1
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 60, 2560, 96, 1
	end

Move_HAIL:: @ 81CB816
	loadspritegfx ANIM_TAG_HAIL
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createvisualtask AnimTask_BlendSelected, 10, 1, 3, 0, 6, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_Hail1, 5, 
	loopsewithpan SE_W258, 0, 8, 10
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 3, 6, 0, RGB_BLACK
	end

Move_TORMENT:: @ 81CB84E
	loadspritegfx ANIM_TAG_ANGER
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	createvisualtask AnimTask_TormentAttacker, 2, 
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 2, 1, 31, 10, 1, 1
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_W207B, 63
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_W207B, 63
	end

Move_MEMENTO:: @ 81CB892
	setalpha 0, 16
	delay 1
	createvisualtask sub_80B85B8, 2, 
	delay 1
	createvisualtask sub_80B7DA4, 5, 
	playsewithpan SE_W060, 192
	delay 48
	playsewithpan SE_W060B, 192
	waitforvisualfinish
	createvisualtask sub_80B8664, 2, 
	delay 12
	setalpha 0, 16
	delay 1
	monbg_22 1
	createvisualtask sub_80B8070, 5, 
	playsewithpan SE_W060, 63
	waitforvisualfinish
	clearmonbg_23 1
	delay 1
	blendoff
	delay 1
	end

Move_FACADE:: @ 81CB8D6
	loadspritegfx ANIM_TAG_SWEAT_DROP
	createvisualtask AnimTask_SquishAndSweatDroplets, 2, 0, 3
	createvisualtask AnimTask_FacadeColorBlend, 2, 0, 72
	loopsewithpan SE_W207, 192, 24, 3
	end

Move_SMELLING_SALT:: @ 81CB8F6
	loadspritegfx ANIM_TAG_TAG_HAND
	loadspritegfx ANIM_TAG_SMELLINGSALT_EFFECT
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, 1, 0, 2
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, 1, 1, 2
	delay 32
	createvisualtask AnimTask_SmellingSaltsSquish, 3, 1, 2
	loopsewithpan SE_W003, 63, 12, 2
	waitforvisualfinish
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 6, 2
	createsprite gSmellingSaltExclamationSpriteTemplate, ANIM_TARGET, 2, 1, 8, 3
	loopsewithpan SE_W207B, 63, 16, 3
	end

Move_FOLLOW_ME:: @ 81CB951
	loadspritegfx ANIM_TAG_FINGER
	createsprite gFollowMeFingerSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_W039, 192
	delay 18
	playsewithpan SE_W213, 192
	delay 71
	loopsewithpan SE_W039, 192, 22, 3
	end

Move_CHARGE:: @ 81CB970
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg 0
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 0
	waitforvisualfinish
	createvisualtask sub_80AE540, 2, 0, 60, 2, 12
	playsewithpan SE_W268, 192
	delay 30
	playsewithpan SE_W268, 192
	delay 30
	playsewithpan SE_W268, 192
	createsprite gUnknown_83E61D4, ANIM_ATTACKER, 2, 0
	delay 25
	playsewithpan SE_W268, 192
	delay 20
	playsewithpan SE_W268, 192
	delay 15
	playsewithpan SE_W268, 192
	delay 10
	delay 6
	loopsewithpan SE_W268, 192, 6, 5
	waitforvisualfinish
	createsprite gUnknown_83E6204, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gUnknown_83E6204, ANIM_ATTACKER, 2, 0, -16, -16
	playsewithpan SE_W085B, 192
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 4, 0, 0
	clearmonbg 0
	blendoff
	end

Move_TAUNT:: @ 81CBA0B
	loadspritegfx ANIM_TAG_FINGER_2
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_ANGER
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 45
	playsewithpan SE_W118, 192
	delay 6
	createsprite gTauntFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 4
	loopsewithpan SE_W039, 192, 16, 2
	waitforvisualfinish
	delay 8
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_W207B, 63
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_W207B, 63
	end

Move_HELPING_HAND:: @ 81CBA5F
	loadspritegfx ANIM_TAG_TAG_HAND
	createvisualtask AnimTask_HelpingHandAttackerMovement, 5, 
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 0
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 1
	delay 19
	playsewithpan SE_W227, 0
	createvisualtask AnimTask_ShakeMon2, 2, 2, 2, 0, 5, 1
	delay 14
	playsewithpan SE_W227, 0
	createvisualtask AnimTask_ShakeMon2, 2, 2, 2, 0, 5, 1
	delay 20
	playsewithpan SE_W227, 0
	createvisualtask AnimTask_ShakeMon2, 2, 2, 3, 0, 10, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, 2, 1023, 12, 1, 1
	end

Move_ASSIST:: @ 81CBAD2
	loadspritegfx ANIM_TAG_PAW_PRINT
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 112, -16, 140, 128, 36
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 208, 128, -16, 48, 36
	playsewithpan SE_W010, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 112, 256, -16, 36
	playsewithpan SE_W010, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 108, 128, 84, -16, 36
	playsewithpan SE_W010, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 56, 256, 56, 36
	playsewithpan SE_W010, 0
	end

Move_SUPERPOWER:: @ 81CBB43
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_METEOR
	loadspritegfx ANIM_TAG_FLAT_ROCK
	monbg 2
	monbgprio_28 0
	setalpha 12, 8
	createsprite gUnknown_83E6864, ANIM_TARGET, 2, 0
	playsewithpan SE_W025, 192
	delay 20
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, 4, 1, 180, 1
	createvisualtask sub_80DD410, 5, 227, 0
	delay 40
	createsprite gUnknown_83E687C, ANIM_ATTACKER, 41, 200, 96, 1, 120
	delay 8
	createsprite gUnknown_83E687C, ANIM_ATTACKER, 41, 20, 248, 4, 112
	delay 8
	createsprite gUnknown_83E687C, ANIM_ATTACKER, 41, 130, 160, 2, 104
	delay 8
	createsprite gUnknown_83E687C, ANIM_ATTACKER, 41, 160, 192, 0, 96
	delay 8
	createsprite gUnknown_83E687C, ANIM_ATTACKER, 41, 60, 288, 3, 88
	delay 74
	createsprite gUnknown_83E6894, ANIM_TARGET, 3, 0
	playsewithpan SE_W207, 192
	delay 16
	createvisualtask AnimTask_ShakeMon2, 2, 1, 8, 0, 16, 1
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg 2
	blendoff
	delay 1
	end

Move_RECYCLE:: @ 81CBBFE
	loadspritegfx ANIM_TAG_RECYCLE
	monbg 0
	setalpha 0, 16
	delay 1
	createsprite gRecycleSpriteTemplate, ANIM_ATTACKER, 2, 
	loopsewithpan SE_W036, 192, 24, 3
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, RGB_WHITE, 12, 2, 1
	playsewithpan SE_W036, 192
	waitforvisualfinish
	blendoff
	clearmonbg 0
	delay 1
	end

Move_BRICK_BREAK:: @ 81CBC32
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_TORN_METAL
	choosetwoturnanim gUnknown_81CBC47, gUnknown_81CBD16

gUnknown_81CBC47:: @ 81CBC47
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 4
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -18, -18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, -18, -18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, 18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 18, 18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, 0, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 6, 0
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 10, 1, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 6, 0, 0
	waitforvisualfinish
	clearmonbg 1
	end

gUnknown_81CBD16:: @ 81CBD16
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 4
	createsprite gUnknown_83E6808, ANIM_ATTACKER, 3, 1, 0, 0, 90, 10
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -18, -18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, -18, -18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, 18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 18, 18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, 0, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 6, 0
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 10, 1, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createsprite gUnknown_83E6820, ANIM_ATTACKER, 2, 1, 0, -8, -12
	createsprite gUnknown_83E6820, ANIM_ATTACKER, 2, 1, 1, 8, -12
	createsprite gUnknown_83E6820, ANIM_ATTACKER, 2, 1, 2, -8, 12
	createsprite gUnknown_83E6820, ANIM_ATTACKER, 2, 1, 3, 8, 12
	playsewithpan SE_W280, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 6, 0, 0
	waitforvisualfinish
	clearmonbg 1
	end

Move_YAWN:: @ 81CBE37
	loadspritegfx ANIM_TAG_PINK_CLOUD
	createvisualtask AnimTask_DeepInhale, 2, 0
	playsewithpan SE_W281, 192
	waitforvisualfinish
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 2
	playsewithpan SE_W255, 192
	delay 4
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 1
	delay 4
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 0
	waitforvisualfinish
	createvisualtask AnimTask_DeepInhale, 2, 1
	playsewithpan SE_W281, 63
	end

Move_ENDEAVOR:: @ 81CBE7A
	loadspritegfx ANIM_TAG_SWEAT_DROP
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SquishAndSweatDroplets, 2, 0, 2
	loopsewithpan SE_W039, 192, 24, 2
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 703, 12, 1, 2
	delay 6
	createvisualtask sub_8099BD4, 5, 0, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 12, -12, 1, 2
	playsewithpan SE_W003, 63
	delay 24
	createvisualtask sub_8099BD4, 5, 0, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -12, 12, 1, 2
	playsewithpan SE_W004, 63
	end

Move_ERUPTION:: @ 81CBEEF
	loadspritegfx ANIM_TAG_WARM_ROCK
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 2, 0, 4, 31
	waitforvisualfinish
	createvisualtask sub_80ACEA4, 2, 
	waitplaysewithpan SE_W153, 192, 60
	waitforvisualfinish
	createvisualtask sub_80ACEA4, 2, 
	waitplaysewithpan SE_W153, 192, 60
	waitforvisualfinish
	delay 30
	createsprite gUnknown_83E5E60, ANIM_ATTACKER, 40, 200, -32, 0, 100, 0
	createsprite gUnknown_83E5E60, ANIM_ATTACKER, 40, 30, -32, 16, 90, 1
	createsprite gUnknown_83E5E60, ANIM_ATTACKER, 40, 150, -32, 32, 60, 2
	createsprite gUnknown_83E5E60, ANIM_ATTACKER, 40, 90, -32, 48, 80, 3
	createsprite gUnknown_83E5E60, ANIM_ATTACKER, 40, 110, -32, 64, 50, 0
	createsprite gUnknown_83E5E60, ANIM_ATTACKER, 40, 60, -32, 80, 70, 1
	delay 22
	createvisualtask sub_80B94B4, 5, 5, 8, 60
	createvisualtask sub_80B94B4, 5, 4, 8, 60
	loopsewithpan SE_W088, 63, 16, 12
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 40, 31, 4, 4, 0, 31
	end

Move_SKILL_SWAP:: @ 81CBFBC
	loadspritegfx ANIM_TAG_BLUEGREEN_ORB
	call gUnknown_81D59BB
	createvisualtask sub_80B3834, 3, 1
	createvisualtask AnimTask_BlendMonInAndOut, 5, 1, RGB_WHITE, 12, 3, 1
	loopsewithpan SE_W179, 192, 24, 3
	delay 16
	createvisualtask sub_80B3834, 3, 0
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, RGB_WHITE, 12, 3, 1
	waitforvisualfinish
	call gUnknown_81D59C7
	end

Move_IMPRISON:: @ 81CC007
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	loadspritegfx ANIM_TAG_X_SIGN
	call gUnknown_81D59BB
	monbg 3
	createvisualtask sub_80B3584, 5, 
	delay 8
	loopsewithpan SE_W030, 192, 8, 5
	waitforvisualfinish
	delay 4
	createsprite gUnknown_83E705C, ANIM_ATTACKER, 5, 0, 40
	createvisualtask sub_80B94B4, 5, 4, 1, 10
	playsewithpan SE_W063, 192
	clearmonbg 3
	call gUnknown_81D59C7
	end

Move_GRUDGE:: @ 81CC04A
	loadspritegfx ANIM_TAG_PURPLE_FLAME
	monbg 0
	monbgprio_29
	fadetobg 2
	playsewithpan SE_W060, 192
	waitbgfadein
	createvisualtask sub_80B68C8, 3, 
	loopsewithpan SE_W052, 192, 16, 4
	delay 10
	delay 80
	playsewithpan SE_W171, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg 0
	end

Move_CAMOUFLAGE:: @ 81CC072
	monbg 2
	monbgprio_28 0
	setalpha 16, 0
	createvisualtask AnimTask_SetCamouflageBlend, 5, 2, 3, 0, 14
	delay 16
	createvisualtask sub_80B78E0, 2, 4
	playsewithpan SE_W185, 192
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_SetCamouflageBlend, 5, 2, 0, 0, 0
	waitforvisualfinish
	createvisualtask sub_80B79DC, 2, 1
	waitforvisualfinish
	blendoff
	clearmonbg 2
	end

Move_TAIL_GLOW:: @ 81CC0B8
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg 0
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 0
	waitforvisualfinish
	createsprite gUnknown_83E7378, ANIM_ATTACKER, 66, 0
	delay 18
	loopsewithpan SE_W234, 192, 16, 6
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 4, 0, 0
	clearmonbg 0
	blendoff
	delay 1
	end

Move_LUSTER_PURGE:: @ 81CC0FB
	loadspritegfx ANIM_TAG_WHITE_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_IMPACT
	fadetobg 3
	waitbgfadeout
	createvisualtask AnimTask_FadeScreenToWhite, 5, 
	waitbgfadein
	monbg 0
	setalpha 12, 8
	playsewithpan SE_W076, 192
	createsprite gUnknown_83E7148, ANIM_ATTACKER, 41, 0, 0, 0, 0
	delay 20
	createvisualtask AnimTask_BlendExcept, 5, 5, 2, 0, 16, -1
	createvisualtask AnimTask_BlendParticle, 5, 10267, 2, 0, 16, -1
	waitforvisualfinish
	createvisualtask AnimTask_BlendParticle, 5, 10135, 0, 12, 12, 23552
	waitforvisualfinish
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 2
	createvisualtask sub_80DD3DC, 5, 208, 63
	delay 3
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 2
	createvisualtask sub_80DD3DC, 5, 208, 63
	delay 3
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 2
	createvisualtask sub_80DD3DC, 5, 208, 63
	delay 3
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 2
	createvisualtask sub_80DD3DC, 5, 208, 63
	delay 3
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 2
	createvisualtask sub_80DD3DC, 5, 208, 63
	delay 3
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 2
	createvisualtask sub_80DD3DC, 5, 208, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendExcept, 5, 5, 2, 16, 0, -1
	createvisualtask sub_80B94B4, 5, 1, 5, 14
	waitforvisualfinish
	clearmonbg 0
	blendoff
	call gUnknown_81D59C7
	end

Move_MIST_BALL:: @ 81CC212
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_WHITE_FEATHER
	delay 0
	playsewithpan SE_W081, 192
	createsprite gUnknown_83E64E8, ANIM_TARGET, 0, 0, 0, 0, 0, 30, 0
	waitforvisualfinish
	playsewithpan SE_W028, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 10, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 1, 1, 32279, 16, RGB_WHITE, 16
	delay 0
	playsewithpan SE_W114, 0
	createvisualtask AnimTask_LoadMistTiles, 5, 
	createvisualtask AnimTask_BlendSelected, 10, 4, 3, 0, 16, RGB_WHITE
	delay 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 70, 0
	delay 70
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 16, 0, RGB_WHITE
	end

Move_FEATHER_DANCE:: @ 81CC2A1
	loadspritegfx ANIM_TAG_WHITE_FEATHER
	monbg 3
	monbgprio_29
	playsewithpan SE_W080, 63
	delay 0
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 64, 2, 104, 11304, 32, 1
	delay 6
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 32, 2, 104, 11304, 32, 1
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 0, 2, 104, 11304, 32, 1
	delay 6
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 224, 2, 104, 11304, 32, 1
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 128, 2, 104, 11304, 32, 1
	delay 6
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 192, 2, 104, 11304, 32, 1
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 160, 2, 104, 11304, 32, 1
	delay 6
	createsprite gUnknown_83E6C00, ANIM_TARGET, 0, 0, -16, 96, 2, 104, 11304, 32, 1
	waitforvisualfinish
	clearmonbg 3
	end

Move_TEETER_DANCE:: @ 81CC371
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_TeeterDanceMovement, 5, 
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, -8, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 2, 8, -2
	playsewithpan SE_W298, 192
	end

Move_MUD_SPORT:: @ 81CC3DC
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask AnimTask_Splash, 2, 0, 6
	delay 24
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 0, -4, -16
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 0, 4, -12
	playsewithpan SE_W091, 192
	delay 32
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 0, -3, -12
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 0, 5, -14
	playsewithpan SE_W091, 192
	delay 32
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 0, -5, -18
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 0, 3, -14
	playsewithpan SE_W091, 192
	delay 16
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_W145B, 0, 15
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_W145B, 0, 25
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_W145B, 0, 14
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_W145B, 0, 10
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_W145B, 0, 22
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_W145B, 0, 22
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_W145B, 0, 15
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_W145B, 0, 22
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_W145B, 0, 15
	delay 2
	createsprite gUnknown_83E7A94, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_W145B, 0, 10
	end

Move_NEEDLE_ARM:: @ 81CC513
	loadspritegfx ANIM_TAG_GREEN_SPIKE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loopsewithpan SE_W030, 63, 2, 16
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, -32, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 22, -22, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 30, 0, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 20, 20, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, 28, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -19, 19, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -27, 0, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, -18, -18, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, -25, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 17, -17, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 23, 0, 16
	delay 2
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 16, 16, 16
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 18, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_W233B, 63
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0, -24, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 17, -17, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 24, 0, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 17, 17, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0, 24, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -17, 17, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -24, 0, 10
	createsprite gNeedleArmSpikeSpriteTemplate, ANIM_TARGET, 2, 1, 1, -17, -17, 10
	end

Move_SLACK_OFF:: @ 81CC6C3
	loadspritegfx ANIM_TAG_BLUE_STAR
	createvisualtask AnimTask_SlackOffSquish, 2, 0
	playsewithpan SE_W281, 192
	waitforvisualfinish
	call gUnknown_81D56C9
	waitforvisualfinish
	end

Move_CRUSH_CLAW:: @ 81CC6DB
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	loadspritegfx ANIM_TAG_CLAW_SLASH
	loadspritegfx ANIM_TAG_TORN_METAL
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 18, 1
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, -10, -10, 0
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, -10, 10, 0
	playsewithpan SE_W013, 63
	delay 12
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, 10, -10, 1
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, 10, 10, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	waitforvisualfinish
	blendoff
	clearmonbg 1
	end

Move_AROMATHERAPY:: @ 81CC74B
	playsewithpan SE_W080, 0
	loadspritegfx ANIM_TAG_FLOWER
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 0, 0, 7, 13293
	delay 1
	monbg 0
	delay 1
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 24, 16, 0, 2, 2, 0, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 66, 64, 24, 0, 3, 1, 1, 0
	createsprite gAromatherapyBigFlowerSpriteTemplate, ANIM_ATTACKER, 0, 16, 24, 0, 2, 1, 0, 0
	delay 20
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 66, 48, 12, 0, 4, 3, 1, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 100, 16, 0, 3, 2, 0, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 74, 24, 180, 3, 2, 0, 0
	delay 10
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 66, 80, 30, 0, 4, 1, 1, 0
	createsprite gAromatherapySmallFlowerSpriteTemplate, ANIM_ATTACKER, 0, 128, 12, 0, 3, 3, 0, 0
	createsprite gAromatherapyBigFlowerSpriteTemplate, ANIM_ATTACKER, 0, 90, 16, 0, 2, 1, 0, 0
	waitforvisualfinish
	clearmonbg 0
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 0, 7, 0, 13293
	delay 1
	playsewithpan SE_W287, 192
	createvisualtask sub_80E2084, 2, 1
	waitforvisualfinish
	playsewithpan SE_W234, 192
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 43, 3, 10, 0, 13293
	createsprite gBlendThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 16, 0, 0, 0, 1
	waitforvisualfinish
	end

Move_FAKE_TEARS:: @ 81CC8AD
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createvisualtask AnimTask_BlendParticle, 5, 10155, 0, 4, 4, 32108
	waitforvisualfinish
	createvisualtask AnimTask_RockMonBackAndForth, 5, 0, 2, 1
	loopsewithpan SE_W039, 192, 12, 4
	delay 8
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 0
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 2
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 0
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 2
	createsprite gUnknown_83E7998, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end

Move_AIR_CUTTER:: @ 81CC93D
	loadspritegfx ANIM_TAG_AIR_WAVE
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	delay 0
	monbg 3
	setalpha 12, 8
	delay 0
	createvisualtask AnimTask_AirCutterProjectile, 2, 32, -24, 1536, 2, 128
	waitforvisualfinish
	playsewithpan SE_W015, 63
	createsprite gAirCutterSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0, 2
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 8, 1
	waitforvisualfinish
	blendoff
	clearmonbg 3
	delay 0
	end

Move_ODOR_SLEUTH:: @ 81CC99F
	monbg 1
	createvisualtask AnimTask_OdorSleuthMovement, 5, 
	delay 24
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 4
	playsewithpan SE_W207, 192
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 4
	playsewithpan SE_W207, 192
	waitforvisualfinish
	clearmonbg 1
	delay 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, -1, 16, -1, 0
	playsewithpan SE_W043, 192
	end

Move_GRASS_WHISTLE:: @ 81CC9E9
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 13298
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2, 
	waitforvisualfinish
	panse_1B SE_W320, 192, 63, 2, 0
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 7, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 5
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 3, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 6, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 2, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 1, 1, 0
	delay 4
	createsprite gWavyMusicNotesSpriteTemplate, ANIM_TARGET, 2, 5, 1, 0
	delay 4
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2, 
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 4, 0, 13298
	waitforvisualfinish
	end

Move_TICKLE:: @ 81CCADC
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 0, 16, 0
	waitforvisualfinish
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	playsewithpan SE_W197, 192
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 16, 0, 0
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SwayMon, 3, 0, 6, 1280, 3, 0
	delay 12
	createvisualtask AnimTask_RockMonBackAndForth, 3, 1, 6, 2
	loopsewithpan SE_W039, 63, 8, 8
	waitforvisualfinish
	end

Move_WATER_SPOUT:: @ 81CCB48
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg 3
	setalpha 12, 8
	createvisualtask sub_80ABB28, 5, 
	playsewithpan SE_W029, 192
	delay 44
	playsewithpan SE_W291, 192
	waitforvisualfinish
	delay 16
	createvisualtask sub_80AC00C, 5, 
	playsewithpan SE_W057, 63
	clearmonbg 3
	blendoff
	end

Move_SHADOW_PUNCH:: @ 81CCB76
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	fadetobg 2
	waitbgfadein
	monbg 2
	setalpha 9, 8
	createvisualtask sub_8077030, 2, 0, 13
	playsewithpan SE_W026, 192
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_W004, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 2
	blendoff
	restorebg
	waitbgfadein
	end

Move_EXTRASENSORY:: @ 81CCBD1
	call gUnknown_81D59BB
	monbg 3
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 891, 12, 1, 1
	createvisualtask sub_80B3A58, 5, 0
	playsewithpan SE_W020, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 891, 12, 1, 1
	createvisualtask sub_80B3A58, 5, 1
	playsewithpan SE_W020, 63
	waitforvisualfinish
	createvisualtask sub_80B3C78, 5, 0
	createvisualtask sub_80B3A58, 5, 2
	playsewithpan SE_W043, 192
	waitforvisualfinish
	blendoff
	clearmonbg 3
	call gUnknown_81D59C7
	end

Move_AERIAL_ACE:: @ 81CCC39
	loadspritegfx ANIM_TAG_CUT
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 24, 6, 1, 5
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 7, 3
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	playsewithpan SE_W013B, 192
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 10, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 10, 0, 0
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_IRON_DEFENSE:: @ 81CCCA3
	loopsewithpan SE_REAPOKE, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 8, 2, -1, 14, -1, 0
	waitforvisualfinish
	end

Move_BLOCK:: @ 81CCCCD
	loadspritegfx ANIM_TAG_X_SIGN
	createsprite gBlockXSpriteTemplate, ANIM_TARGET, 66, 
	playsewithpan SE_W207, 63
	end

Move_HOWL:: @ 81CCCDC
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask AnimTask_DeepInhale, 2, 0
	delay 12
	call gUnknown_81CDB06
	createvisualtask sub_80DD06C, 2, 0, 3
	waitforvisualfinish
	delay 30
	end

Move_BULK_UP:: @ 81CCCFE
	loadspritegfx ANIM_TAG_BREATH
	createvisualtask AnimTask_GrowAndShrink, 2, 
	playsewithpan SE_W207, 192
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2, 
	loopsewithpan SE_W207, 192, 4, 2
	waitforvisualfinish
	end

Move_COVET:: @ 81CCD1C
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_RockMonBackAndForth, 5, 0, 2, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_W204, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	loopsewithpan SE_W146, 63, 4, 3
	end

Move_VOLT_TACKLE:: @ 81CCD79
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg 0
	setalpha 12, 8
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 0, 8, RGB_BLACK
	waitforvisualfinish
	createsprite gUnknown_83E621C, ANIM_ATTACKER, 1, 
	playsewithpan SE_W268, 192
	waitforvisualfinish
	clearmonbg 0
	blendoff
	delay 8
	createvisualtask sub_80AEA10, 5, 0
	playsewithpan SE_W085, 192
	waitforvisualfinish
	createvisualtask sub_80AEA10, 5, 1
	playsewithpan SE_W085, 63
	waitforvisualfinish
	createvisualtask sub_80AEA10, 5, 2
	playsewithpan SE_W085, 192
	waitforvisualfinish
	createvisualtask sub_80AEA10, 5, 3
	playsewithpan SE_W085, 63
	waitforvisualfinish
	createvisualtask sub_80AEA10, 5, 4
	playsewithpan SE_W085, 192
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, 1, 10, 0, 18, 1
	playsewithpan SE_W120, 63
	createsprite gUnknown_83E6204, ANIM_ATTACKER, 2, 1, 16, 16
	delay 2
	createsprite gUnknown_83E6204, ANIM_ATTACKER, 2, 1, -16, -16
	delay 8
	createvisualtask sub_80AE8A0, 5, 
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 0, 3, 0, 9, 1
	playsewithpan SE_W085B, 192
	createsprite gUnknown_83E6204, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gUnknown_83E6204, ANIM_ATTACKER, 2, 0, -16, -16
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 8, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_WATER_SPORT:: @ 81CCE71
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	createvisualtask sub_80AC328, 5, 
	delay 8
	playsewithpan SE_W057, 192
	delay 44
	playsewithpan SE_W057, 192
	delay 44
	playsewithpan SE_W057, 192
	delay 44
	panse_1B SE_W057, 192, 63, 2, 0
	end

Move_CALM_MIND:: @ 81CCE97
	loadspritegfx ANIM_TAG_THIN_RING
	monbg 2
	createvisualtask AnimTask_BlendExcept, 5, 0, 0, 0, 16, 0
	waitforvisualfinish
	createvisualtask sub_80BB9B0, 5, 1
	waitforvisualfinish
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_W048, 192
	delay 14
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_W048, 192
	delay 14
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_W048, 192
	waitforvisualfinish
	createvisualtask sub_80BB9B0, 5, 0
	visible 0
	waitforvisualfinish
	createvisualtask AnimTask_BlendExcept, 5, 0, 0, 16, 0, 0
	waitforvisualfinish
	clearmonbg 2
	end

Move_LEAF_BLADE:: @ 81CCF17
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_CROSS_IMPACT
	createvisualtask AnimTask_LeafBlade, 5, 
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_W015, 63
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_W015, 63
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_W015, 63
	waitforvisualfinish
	monbg 1
	setalpha 12, 8
	delay 12
	createvisualtask AnimTask_ShakeMon2, 2, 1, 8, 0, 18, 1
	createsprite gUnknown_83E7C80, ANIM_TARGET, 2, 0, 0, 1, 36
	playsewithpan SE_W043, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_DRAGON_DANCE:: @ 81CCF9A
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	monbg 0
	monbgprio_28 0
	delay 1
	createvisualtask sub_80B75E0, 5, 
	playsewithpan SE_W100, 192
	delay 8
	createvisualtask sub_8076288, 5, 10249, 19456, 14, 0, 3
	createsprite gUnknown_83E7848, ANIM_ATTACKER, 2, 0
	createsprite gUnknown_83E7848, ANIM_ATTACKER, 2, 43
	createsprite gUnknown_83E7848, ANIM_ATTACKER, 2, 85
	createsprite gUnknown_83E7848, ANIM_ATTACKER, 2, 128
	createsprite gUnknown_83E7848, ANIM_ATTACKER, 2, 170
	createsprite gUnknown_83E7848, ANIM_ATTACKER, 2, 213
	delay 30
	playsewithpan SE_W100, 192
	delay 30
	playsewithpan SE_W100, 192
	waitforvisualfinish
	clearmonbg 0
	delay 1
	end

Move_SHOCK_WAVE:: @ 81CD009
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_LIGHTNING
	monbg 0
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 0
	waitforvisualfinish
	createvisualtask sub_80AE540, 2, 0, 20, 0, 2
	playsewithpan SE_W268, 192
	delay 12
	createsprite gUnknown_83E6290, ANIM_ATTACKER, 2, 
	delay 30
	createvisualtask sub_80AECE0, 5, 
	delay 12
	waitforvisualfinish
	createvisualtask sub_80AEFA0, 5, 
	playsewithpan SE_W161B, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 6, 18, 1
	createvisualtask AnimTask_BlendSelected, 5, 1, 3, 16, 0, RGB_WHITE
	createvisualtask AnimTask_BlendSelected, 5, 4, 0, 16, 16, RGB_BLACK
	delay 4
	createvisualtask AnimTask_BlendSelected, 5, 4, 0, 0, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg 0
	blendoff
	end

Move_HARDEN:: @ 81CD0AB
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	end

Move_BELLY_DRUM:: @ 81CD0C0
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_PURPLE_HAND_OUTLINE
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2, 
	waitforvisualfinish
	call gUnknown_81CD18D
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, 0
	playsewithpan SE_W187, 192
	delay 15
	call gUnknown_81CD172
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 1, 0
	playsewithpan SE_W187, 192
	delay 15
	call gUnknown_81CD18D
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 3, 3, 128
	playsewithpan SE_W187, 192
	delay 7
	call gUnknown_81CD172
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 128
	playsewithpan SE_W187, 192
	delay 7
	call gUnknown_81CD18D
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 1, 0
	playsewithpan SE_W187, 192
	delay 7
	call gUnknown_81CD172
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 3, 0
	playsewithpan SE_W187, 192
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2, 
	waitforvisualfinish
	end

gUnknown_81CD172:: @ 81CD172
	createsprite gBellyDrumHandSpriteTemplate, ANIM_ATTACKER, 3, 0
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 8, 2, 1
	return

gUnknown_81CD18D:: @ 81CD18D
	createsprite gBellyDrumHandSpriteTemplate, ANIM_ATTACKER, 3, 1
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 8, 2, 1
	return

Move_MIND_READER:: @ 81CD1A8
	loadspritegfx ANIM_TAG_TEAL_ALERT
	loadspritegfx ANIM_TAG_OPENING_EYE
	loadspritegfx ANIM_TAG_ROUND_WHITE_HALO
	monbg 4
	playsewithpan SE_W109, 63
	createsprite gOpeningEyeSpriteTemplate, ANIM_ATTACKER, 5, 0, 0, 1, 0
	createsprite gWhiteHaloSpriteTemplate, ANIM_ATTACKER, 5, 
	delay 40
	playsewithpan SE_W043, 63
	createvisualtask AnimTask_CurseBlendEffect, 2, 1, 1, 2, 0, 10, 0
	call gUnknown_81CD1EF
	waitforvisualfinish
	clearmonbg 4
	end

gUnknown_81CD1EF:: @ 81CD1EF
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 70, 0, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 40, 40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 10, -60, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -50, -40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -40, 40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 50, -50, 6
	delay 2
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 50, -30, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 60, 10, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 0, 60, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 0, -40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -60, 20, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -60, -30, 6
	delay 2
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -50, 50, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -60, 20, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, -40, -40, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 20, -60, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 50, -50, 6
	createsprite gTealAlertSpriteTemplate, ANIM_ATTACKER, 4, 35, 40, 6
	delay 2
	return

Move_ICE_PUNCH:: @ 81CD2E0
	monbg 3
	setalpha 12, 8
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 7, 0
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 9, RGB(12, 26, 31)
	delay 20
	playsewithpan SE_W081, 63
	createsprite gUnknown_83E6360, ANIM_ATTACKER, 2, 0
	createsprite gUnknown_83E6360, ANIM_ATTACKER, 2, 64
	createsprite gUnknown_83E6360, ANIM_ATTACKER, 2, 128
	createsprite gUnknown_83E6360, ANIM_ATTACKER, 2, 192
	delay 5
	createsprite gUnknown_83E6348, ANIM_ATTACKER, 2, 32
	createsprite gUnknown_83E6348, ANIM_ATTACKER, 2, 96
	createsprite gUnknown_83E6348, ANIM_ATTACKER, 2, 160
	createsprite gUnknown_83E6348, ANIM_ATTACKER, 2, 224
	delay 17
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 4, 0, -10, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -10, 1, 1
	playsewithpan SE_W004, 63
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 3, 1
	waitforvisualfinish
	delay 15
	call gUnknown_81D540A
	delay 5
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 9, 0, RGB(12, 26, 31)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7, 0, 0
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_REST:: @ 81CD3CB
	playsewithpan SE_W173, 192
	loadspritegfx ANIM_TAG_LETTER_Z
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	waitforvisualfinish
	end

Move_CONFUSION:: @ 81CD40B
	monbg 3
	call gUnknown_81D59BB
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 10, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, RGB_WHITE
	waitforvisualfinish
	playsewithpan SE_W048, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, 1, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	delay 1
	call gUnknown_81D59C7
	end

Move_PSYCHIC:: @ 81CD46C
	monbg 3
	call gUnknown_81D59BB
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 10, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, 767
	waitforvisualfinish
	loopsewithpan SE_W048, 63, 10, 3
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, 1, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	delay 1
	call gUnknown_81D59C7
	end

Move_FUTURE_SIGHT:: @ 81CD4CF
	goto gUnknown_81CD4DD

gUnknown_81CD4D4:: @ 81CD4D4
	waitforvisualfinish
	delay 1
	call gUnknown_81D59C7
	end

gUnknown_81CD4DD:: @ 81CD4DD
	monbg 2
	playsewithpan SE_W060, 192
	call gUnknown_81D59BB
	setalpha 8, 8
	playsewithpan SE_W048, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, RGB_WHITE
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, 0, 1
	waitforvisualfinish
	clearmonbg 2
	blendoff
	goto gUnknown_81CD4D4
	monbg 3
	playsewithpan SE_W060, 192
	call gUnknown_81D59BB
	setalpha 8, 8
	playsewithpan SE_W048, 63
	waitplaysewithpan SE_W048, 63, 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	goto gUnknown_81CD4D4

Move_THUNDER:: @ 81CD570
	loadspritegfx ANIM_TAG_LIGHTNING
	fadetobg 11
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -256, 0, 1, -1
	waitbgfadein
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 16, 0
	delay 16
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	playsewithpan SE_W086, 63
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 16, -36
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 16, -20
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 16, 12
	delay 20
	createsprite gUnknown_83E5F38, ANIM_TARGET, 6, -16, -32
	playsewithpan SE_W086, 63
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 6, -16, -16
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 6, -16, 16
	playsewithpan SE_W086, 63
	delay 5
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 24, -32
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 24, -16
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 24, 16
	delay 30
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 5
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 0, -32
	playsewithpan SE_W161B, 63
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 0, -16
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 0, 16
	delay 10
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	createvisualtask sub_80ADAD8, 2, 30, 3, 1, 0
	delay 2
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_TARGET, 2, 1, 2, 16, 0, 0
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

Move_THUNDER_PUNCH:: @ 81CD6CA
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_LIGHTNING
	monbg 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 16, 0
	waitforvisualfinish
	playsewithpan SE_W004, 63
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	delay 1
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 0, -48
	delay 1
	createsprite gUnknown_83E5F38, ANIM_ATTACKER, 2, 0, -16
	delay 1
	createsprite gUnknown_83E5F38, ANIM_ATTACKER, 2, 0, 16
	delay 1
	playsewithpan SE_W161B, 63
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 15, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 16, 0, 0
	delay 20
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SACRED_FIRE:: @ 81CD793
	loadspritegfx ANIM_TAG_FIRE
	loadspritegfx ANIM_TAG_FIRE_PLUME
	loopsewithpan SE_W221, 192, 7, 5
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -32, 0, 50, 5, -2, 0
	delay 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, -20, -10, 50, 5, -1, -1
	delay 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 0, -16, 50, 5, 0, -1
	delay 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 20, -10, 50, 5, 1, -1
	delay 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, 32, 0, 50, 5, 2, 0
	delay 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, 20, 10, 50, 5, 1, 1
	delay 1
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, 0, 16, 50, 5, 0, 1
	delay 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -20, 10, 50, 5, -1, 1
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	playsewithpan SE_W221B, 63
	createsprite gUnknown_83E5C70, ANIM_TARGET, 2, -16, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_W221B, 63
	createsprite gUnknown_83E5C70, ANIM_TARGET, 2, 0, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_W221B, 63
	createsprite gUnknown_83E5C70, ANIM_TARGET, 2, 16, 0, 80, 16, 0, 1
	delay 1
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 1
	playsewithpan SE_W172B, 63
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 0
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 3, 1
	waitforvisualfinish
	end

Move_SCRATCH:: @ 81CD97A
	loadspritegfx ANIM_TAG_SCRATCH
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W010, 63
	createsprite gScratchSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

Move_DRAGON_BREATH:: @ 81CD9AC
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg 3
	monbgprio_28 1
	loopsewithpan SE_W172, 192, 7, 7
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createvisualtask AnimTask_BlendSelected, 10, 4, 1, 0, 9, RGB(31, 0, 0)
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 21, 1
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gUnknown_83E77A4, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 1, 9, 0, RGB(31, 0, 0)
	waitforvisualfinish
	clearmonbg 3
	end

Move_ROAR:: @ 81CDAC0
	loadspritegfx ANIM_TAG_NOISE_LINE
	monbg 0
	monbgprio_28 0
	setalpha 8, 8
	createvisualtask sub_80DD148, 2, 0, 2
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, 0, 1
	call gUnknown_81CDB06
	delay 20
	createvisualtask sub_80995FC, 5, 1, 2
	waitforvisualfinish
	clearmonbg 0
	blendoff
	waitforvisualfinish
	createvisualtask sub_80DD2F4, 5, 
	waitforvisualfinish
	end

gUnknown_81CDB06:: @ 81CDB06
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, -8, 0
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 2
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 8, 1
	delay 15
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, -8, 0
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 2
	createsprite gRoarNoiseLineSpriteTemplate, ANIM_ATTACKER, 2, 24, 8, 1
	return

Move_GROWL:: @ 81CDB57
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask sub_80DD148, 2, 0, 255
	call gUnknown_81CDB06
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask sub_80DD2F4, 5, 
	waitforvisualfinish
	end

Move_SNORE:: @ 81CDB98
	loadspritegfx ANIM_TAG_SNORE_Z
	monbg 2
	setalpha 8, 8
	call gUnknown_81CDBB1
	delay 30
	call gUnknown_81CDBB1
	waitforvisualfinish
	clearmonbg 2
	blendoff
	end

gUnknown_81CDBB1:: @ 81CDBB1
	playsewithpan SE_W173, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 7, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 7, 1
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, 6, 1, 14, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -42, -38, 24, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, -42, 24, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 42, -38, 24, 0, 0
	return

Move_LIGHT_SCREEN:: @ 81CDC28
	loadspritegfx ANIM_TAG_SPARKLE_3
	loadspritegfx ANIM_TAG_GREEN_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_W115, 192, 15
	createsprite gUnknown_83E6E10, ANIM_ATTACKER, 1, 40, 0, 10166
	delay 10
	call gUnknown_81CDC4F
	waitforvisualfinish
	delay 1
	blendoff
	end

gUnknown_81CDC4F:: @ 81CDC4F
	createsprite gUnknown_83E6ED4, ANIM_ATTACKER, 2, 23, 0, 0, 1
	delay 6
	createsprite gUnknown_83E6ED4, ANIM_ATTACKER, 2, 31, -8, 0, 1
	delay 5
	createsprite gUnknown_83E6ED4, ANIM_ATTACKER, 2, 30, 20, 0, 1
	delay 7
	createsprite gUnknown_83E6ED4, ANIM_ATTACKER, 2, 10, -15, 0, 1
	delay 6
	createsprite gUnknown_83E6ED4, ANIM_ATTACKER, 2, 20, 10, 0, 1
	delay 6
	createsprite gUnknown_83E6ED4, ANIM_ATTACKER, 2, 10, 18, 0, 1
	return

Move_MIRROR_COAT:: @ 81CDCB4
	loadspritegfx ANIM_TAG_SPARKLE_3
	loadspritegfx ANIM_TAG_RED_LIGHT_WALL
	setalpha 0, 16
	createsprite gUnknown_83E6E40, ANIM_ATTACKER, 1, 40, 0, 10168
	delay 10
	playsewithpan SE_W115, 192
	call gUnknown_81CDC4F
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_REFLECT:: @ 81CDCDA
	loadspritegfx ANIM_TAG_SPARKLE_4
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_W115, 192, 15
	createsprite gUnknown_83E6E28, ANIM_ATTACKER, 1, 40, 0, 10167
	delay 20
	createsprite gUnknown_83E6EA4, ANIM_ATTACKER, 2, 30, 0, 0, 1
	delay 7
	createsprite gUnknown_83E6EA4, ANIM_ATTACKER, 2, 19, -12, 0, 1
	delay 7
	createsprite gUnknown_83E6EA4, ANIM_ATTACKER, 2, 10, 20, 0, 1
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_BARRIER:: @ 81CDD2D
	loadspritegfx ANIM_TAG_GRAY_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_W112, 192, 15
	createsprite gUnknown_83E6E58, ANIM_ATTACKER, 3, 40, 0, 10169
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_BUBBLE:: @ 81CDD4A
	loadspritegfx ANIM_TAG_BUBBLE
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg 1
	setalpha 12, 8
	delay 1
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 15, -15, 10, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 35, 37, 40, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 10, -37, 30, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 30, 10, 15, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 20, 33, 20, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gUnknown_83E58E0, ANIM_ATTACKER, 2, 18, 0, 25, -30, 10, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	waitforvisualfinish
	call gUnknown_81D583D
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SMOG:: @ 81CDE20
	loadspritegfx ANIM_TAG_PURPLE_GAS_CLOUD
	monbg 3
	monbgprio_29
	setalpha 12, 8
	loopsewithpan SE_W054, 63, 17, 10
	call gUnknown_81CDE85
	call gUnknown_81CDE85
	call gUnknown_81CDE85
	call gUnknown_81CDE85
	call gUnknown_81CDE85
	call gUnknown_81CDE85
	call gUnknown_81CDE85
	delay 120
	loopsewithpan SE_W092, 63, 18, 2
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 2, 2, 0, 12, 26650
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 15, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81CDE85:: @ 81CDE85
	createsprite gUnknown_83E64BC, ANIM_ATTACKER, 2, 0, -24, 48, 240, 1, 0
	delay 7
	return

Move_FAINT_ATTACK:: @ 81CDE9B
	loadspritegfx ANIM_TAG_IMPACT
	monbg 0
	fadetobg 1
	waitbgfadein
	delay 0
	playsewithpan SE_W185, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 1, 3
	createvisualtask sub_80B78E0, 2, 1
	waitforvisualfinish
	clearmonbg 0
	invisible 0
	delay 1
	createvisualtask sub_80BC12C, 2, 
	monbg 1
	setalpha 12, 8
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 9, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 1
	setarg 7, 4096
	delay 32
	createvisualtask sub_80B7A80, 2, 
	monbg 0
	createvisualtask sub_80B79DC, 2, 1
	waitforvisualfinish
	clearmonbg 0
	delay 1
	restorebg
	waitbgfadein
	end

Move_SAND_ATTACK:: @ 81CDF22
	loadspritegfx ANIM_TAG_MUD_SAND
	monbg 2
	monbgprio_28 0
	setalpha 12, 8
	playsewithpan SE_W028, 192
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	call gUnknown_81CDF72
	call gUnknown_81CDF72
	call gUnknown_81CDF72
	call gUnknown_81CDF72
	call gUnknown_81CDF72
	call gUnknown_81CDF72
	waitforvisualfinish
	clearmonbg 2
	blendoff
	end

gUnknown_81CDF72:: @ 81CDF72
	createsprite gUnknown_83E7A58, ANIM_TARGET, 2, 15, 15, 20, 0, 0
	createsprite gUnknown_83E7A58, ANIM_TARGET, 2, 15, 15, 20, 10, 10
	createsprite gUnknown_83E7A58, ANIM_TARGET, 2, 15, 15, 20, -10, -10
	createsprite gUnknown_83E7A58, ANIM_TARGET, 2, 15, 15, 20, 20, 5
	createsprite gUnknown_83E7A58, ANIM_TARGET, 2, 15, 15, 20, -20, -5
	delay 2
	return

Move_MUD_SLAP:: @ 81CDFCA
	loadspritegfx ANIM_TAG_MUD_SAND
	playsewithpan SE_W028, 192
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	call gUnknown_81CE010
	call gUnknown_81CE010
	call gUnknown_81CE010
	call gUnknown_81CE010
	call gUnknown_81CE010
	call gUnknown_81CE010
	waitforvisualfinish
	end

gUnknown_81CE010:: @ 81CE010
	createsprite gUnknown_83E7A7C, ANIM_TARGET, 2, 15, 15, 20, 0, 0
	createsprite gUnknown_83E7A7C, ANIM_TARGET, 2, 15, 15, 20, 10, 5
	createsprite gUnknown_83E7A7C, ANIM_TARGET, 2, 15, 15, 20, -10, -5
	createsprite gUnknown_83E7A7C, ANIM_TARGET, 2, 15, 15, 20, 20, 10
	createsprite gUnknown_83E7A7C, ANIM_TARGET, 2, 15, 15, 20, -20, -10
	delay 2
	return

Move_DRAGON_RAGE:: @ 81CE068
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_FIRE_PLUME
	playsewithpan SE_W082, 192
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 40, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_TARGET, 2, 0, 15, 0, 0, 4
	waitforvisualfinish
	createsprite gUnknown_83E7830, ANIM_TARGET, 2, 30, 15, 0, 10, 10
	waitforvisualfinish
	loopsewithpan SE_W172B, 63, 11, 3
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 3, 25, 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 66, 1, 5, 0
	delay 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 66, 1, -10, -15
	delay 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 2, 1, 0, 25
	delay 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 66, 1, 15, 5
	delay 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 66, 1, -25, 0
	delay 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 2, 1, 30, 30
	delay 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 2, 1, -27, 25
	delay 1
	createsprite gUnknown_83E77D8, ANIM_TARGET, 66, 1, 0, 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_TARGET, 66, 0, 0, 4
	waitforvisualfinish
	end

Move_RAIN_DANCE:: @ 81CE145
	loadspritegfx ANIM_TAG_RAIN_DROPS
	playsewithpan SE_W240, 192
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask sub_80AABC0, 2, 0, 3, 120
	createvisualtask sub_80AABC0, 2, 0, 3, 120
	delay 120
	delay 30
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 2, 4, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_BITE:: @ 81CE190
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W044, 63
	createsprite gUnknown_83E7930, ANIM_ATTACKER, 2, 0, -32, 0, 0, 819, 10
	createsprite gUnknown_83E7930, ANIM_ATTACKER, 2, 0, 32, 4, 0, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 4, 7, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 1
	end

Move_CRUNCH:: @ 81CE1EE
	loadspritegfx ANIM_TAG_SHARP_TEETH
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	fadetobg 1
	waitbgfadein
	setalpha 12, 8
	playsewithpan SE_W044, 63
	createsprite gUnknown_83E7930, ANIM_ATTACKER, 2, -32, -32, 1, 819, 819, 10
	createsprite gUnknown_83E7930, ANIM_ATTACKER, 2, 32, 32, 5, -819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 7, 5, 2
	waitforvisualfinish
	playsewithpan SE_W044, 63
	createsprite gUnknown_83E7930, ANIM_ATTACKER, 2, 32, -32, 7, -819, 819, 10
	createsprite gUnknown_83E7930, ANIM_ATTACKER, 2, -32, 32, 3, 819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 8, 4, 2
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 1
	restorebg
	waitbgfadein
	end

Move_CLAMP:: @ 81CE29E
	loadspritegfx ANIM_TAG_CLAMP
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W011, 63
	createsprite gUnknown_83E7948, ANIM_ATTACKER, 2, -32, 0, 2, 819, 0, 10
	createsprite gUnknown_83E7948, ANIM_ATTACKER, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

Move_ICE_BEAM:: @ 81CE2FB
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 7, 0
	waitforvisualfinish
	createsoundtask mas_80DCF38, 176, -64, 63, 4, 4, 0, 10
	createsprite gUnknown_83E63A4, ANIM_ATTACKER, 2, 20, 12, 0, 12, 20
	createsprite gUnknown_83E63A4, ANIM_ATTACKER, 2, 20, -12, 0, -12, 20
	delay 1
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 4, -31, 0, 7, 32384
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 25, 1
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	call gUnknown_81CE3FC
	createsprite gUnknown_83E638C, ANIM_ATTACKER, 2, 20, 0, 0, 0, 11
	delay 1
	createsprite gUnknown_83E638C, ANIM_ATTACKER, 2, 20, 0, 0, 0, 11
	waitforvisualfinish
	delay 20
	call gUnknown_81D540A
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 4, 5, 7, 0, 32384
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7, 0, 0
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

gUnknown_81CE3FC:: @ 81CE3FC
	createsprite gUnknown_83E63A4, ANIM_ATTACKER, 2, 20, 12, 0, 12, 20
	createsprite gUnknown_83E63A4, ANIM_ATTACKER, 2, 20, -12, 0, -12, 20
	createsprite gUnknown_83E638C, ANIM_ATTACKER, 2, 20, 0, 0, 0, 11
	delay 1
	return

Move_WITHDRAW:: @ 81CE432
	playsewithpan SE_W029, 192
	createvisualtask AnimTask_Withdraw, 5, 
	waitforvisualfinish
	end

Move_AURORA_BEAM:: @ 81CE43F
	loadspritegfx ANIM_TAG_RAINBOW_RINGS
	fadetobg 20
	waitbgfadein
	playsewithpan SE_W062, 192
	setarg 7, 0
	createvisualtask sub_80AAF60, 10, 130
	call gUnknown_81CE4C6
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 17, 1
	call gUnknown_81CE4C6
	call gUnknown_81CE4C6
	call gUnknown_81CE4C6
	setarg 7, 65535
	createsoundtask mas_80DCF38, 176, -64, 63, 3, 6, 0, 10
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 40, 1
	call gUnknown_81CE4C6
	call gUnknown_81CE4C6
	call gUnknown_81CE4C6
	call gUnknown_81CE4C6
	call gUnknown_81CE4C6
	call gUnknown_81CE4C6
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

gUnknown_81CE4C6:: @ 81CE4C6
	createsprite gUnknown_83E592C, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gUnknown_83E592C, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gUnknown_83E592C, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gUnknown_83E592C, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	return

Move_SOLAR_BEAM:: @ 81CE513
	loadspritegfx ANIM_TAG_ORBS
	choosetwoturnanim BattleAnimScript_SolarBeam_Turn1, BattleAnimScript_SolarBeam_Turn2

BattleAnimScript_SolarBeam_End:: @ 81CE51F
	waitforvisualfinish
	end

BattleAnimScript_SolarBeam_Turn1:: @ 81CE521
	monbg 2
	setalpha 12, 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 1, 4, 0, 11, 12287
	playsewithpan SE_W025, 192
	call gUnknown_81CE54B
	waitforvisualfinish
	clearmonbg 2
	blendoff
	goto BattleAnimScript_SolarBeam_End

gUnknown_81CE54B:: @ 81CE54B
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, 40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, -40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, -40, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, -20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, 20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, -20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, 20, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -20, 30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 20, -30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -20, -30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 20, 30, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, 0, 16
	delay 2
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, 0, 16
	delay 2
	return

BattleAnimScript_SolarBeam_Turn2:: @ 81CE61E
	call gUnknown_81D5A07
	panse_1B SE_W076, 192, 63, 2, 0
	createvisualtask AnimTask_CreateSmallSolarbeamOrbs, 5, 
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 0
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 1
	delay 4
	createvisualtask AnimTask_BlendSelected, 10, 4, 1, 0, 10, RGB(25, 31, 0)
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 2
	delay 4
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 65, 1
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 3
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 4
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 5
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 6
	delay 4
	call gUnknown_81CE6F0
	call gUnknown_81CE6F0
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 1, 10, 0, RGB(25, 31, 0)
	call gUnknown_81D5A41
	goto BattleAnimScript_SolarBeam_End

gUnknown_81CE6F0:: @ 81CE6F0
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 0
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 1
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 2
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 3
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 4
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 5
	delay 4
	createsprite gSolarbeamBigOrbSpriteTemplate, ANIM_TARGET, 3, 15, 0, 20, 6
	delay 4
	return

Move_BLIZZARD:: @ 81CE768
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg 3
	createvisualtask AnimTask_GetAttackerSide, 2, 
	jumpargeq 7, 1, gUnknown_81CE8ED
	fadetobg 9

gUnknown_81CE77E:: @ 81CE77E
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -2304, 0, 1, -1
	waitbgfadein
	waitforvisualfinish
	panse_1B SE_W059, 192, 63, 2, 0
	call gUnknown_81CE7B8
	call gUnknown_81CE7B8
	playsewithpan SE_W059B, 63
	waitforvisualfinish
	call gUnknown_81D548E
	waitforvisualfinish
	clearmonbg 3
	delay 20
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

gUnknown_81CE7B8:: @ 81CE7B8
	createsprite gUnknown_83E6410, ANIM_ATTACKER, 40, 0, -10, 0, -10, 72, 1
	createsprite gUnknown_83E6428, ANIM_ATTACKER, 40, 0, 0, 0, 0, 80, 0, 0, 1
	delay 3
	createsprite gUnknown_83E6410, ANIM_ATTACKER, 40, 0, -15, 0, -15, 72, 1
	createsprite gUnknown_83E6428, ANIM_ATTACKER, 40, 0, -10, 0, -10, 80, 0, 0, 1
	delay 3
	createsprite gUnknown_83E6410, ANIM_ATTACKER, 40, 0, -5, 0, -5, 72, 1
	createsprite gUnknown_83E6428, ANIM_ATTACKER, 40, 0, 10, 0, 10, 80, 0, 0, 1
	delay 3
	createsprite gUnknown_83E6410, ANIM_ATTACKER, 40, 0, -10, 0, -10, 72, 1
	createsprite gUnknown_83E6428, ANIM_ATTACKER, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gUnknown_83E6410, ANIM_ATTACKER, 40, 0, -20, 0, -20, 72, 1
	createsprite gUnknown_83E6428, ANIM_ATTACKER, 40, 0, 15, 0, 15, 80, 0, 0, 1
	delay 3
	createsprite gUnknown_83E6410, ANIM_ATTACKER, 40, 0, -15, 0, -15, 72, 1
	createsprite gUnknown_83E6428, ANIM_ATTACKER, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gUnknown_83E6410, ANIM_ATTACKER, 40, 0, -25, 0, -25, 72, 1
	createsprite gUnknown_83E6428, ANIM_ATTACKER, 40, 0, 20, 0, 20, 80, 0, 0, 1
	delay 3
	return

gUnknown_81CE8ED:: @ 81CE8ED
	fadetobg 10
	goto gUnknown_81CE77E

Move_POWDER_SNOW:: @ 81CE8F4
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 1, 0, 3, 0
	waitforvisualfinish
	panse_1B SE_W016, 192, 63, 2, 0
	call gUnknown_81CE93E
	call gUnknown_81CE93E
	playsewithpan SE_W016B, 63
	waitforvisualfinish
	waitsound
	call gUnknown_81D548E
	waitforvisualfinish
	clearmonbg 3
	delay 20
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 1, 3, 0, 0
	end

gUnknown_81CE93E:: @ 81CE93E
	createsprite gUnknown_83E6440, ANIM_ATTACKER, 40, 0, 0, 0, 0, 56, 4, 4, 1
	delay 3
	createsprite gUnknown_83E6440, ANIM_ATTACKER, 40, 0, -10, 0, -10, 56, 4, 4, 1
	delay 3
	createsprite gUnknown_83E6440, ANIM_ATTACKER, 40, 0, 10, 0, 10, 56, -4, 3, 1
	delay 3
	createsprite gUnknown_83E6440, ANIM_ATTACKER, 40, 0, -20, 0, -20, 56, -4, 5, 1
	delay 3
	createsprite gUnknown_83E6440, ANIM_ATTACKER, 40, 0, 15, 0, 15, 56, 4, 4, 1
	delay 3
	createsprite gUnknown_83E6440, ANIM_ATTACKER, 40, 0, -20, 0, -20, 56, 4, 4, 1
	delay 3
	createsprite gUnknown_83E6440, ANIM_ATTACKER, 40, 0, 20, 0, 20, 56, 4, 4, 1
	delay 3
	return

Move_HYDRO_PUMP:: @ 81CE9EE
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 40, 1
	delay 6
	panse_1B SE_W056, 192, 63, 2, 0
	createvisualtask sub_80AB100, 5, 100
	call gUnknown_81CEA8D
	call gUnknown_81CEA8D
	call gUnknown_81CEA8D
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 37, 1
	call gUnknown_81CEACE
	call gUnknown_81CEA8D
	call gUnknown_81CEA8D
	call gUnknown_81CEACE
	call gUnknown_81CEA8D
	call gUnknown_81CEA8D
	call gUnknown_81CEACE
	call gUnknown_81CEA8D
	call gUnknown_81CEA8D
	call gUnknown_81CEACE
	call gUnknown_81CEA8D
	call gUnknown_81CEA8D
	call gUnknown_81CEACE
	delay 1
	delay 1
	call gUnknown_81CEACE
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81CEA8D:: @ 81CEA8D
	createsprite gUnknown_83E595C, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gUnknown_83E595C, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	createsprite gUnknown_83E595C, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gUnknown_83E595C, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	return

gUnknown_81CEACE:: @ 81CEACE
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 4, 0, 15, 1, 1
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 4, 0, -15, 1, 1
	return

Move_SIGNAL_BEAM:: @ 81CEAED
	loadspritegfx ANIM_TAG_GLOWY_RED_ORB
	loadspritegfx ANIM_TAG_GLOWY_GREEN_ORB
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 25, 1
	delay 6
	panse_1B SE_W062, 192, 63, 1, 0
	createvisualtask sub_80AB100, 5, 100
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 25, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 4, 8, 5, 31, 8, 961, 8
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	call gUnknown_81CEBB4
	waitforvisualfinish
	end

gUnknown_81CEBB4:: @ 81CEBB4
	createsprite gUnknown_83E598C, ANIM_TARGET, 3, 10, 10, 0, 16
	createsprite gUnknown_83E59A4, ANIM_TARGET, 3, 10, 10, 0, -16
	delay 1
	return

Move_ABSORB:: @ 81CEBD5
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 4, 13293
	waitforvisualfinish
	playsewithpan SE_W071, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call gUnknown_81CEC44
	waitforvisualfinish
	delay 15
	call gUnknown_81D56C9
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 4, 0, 13293
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81CEC44:: @ 81CEC44
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W152, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_MEGA_DRAIN:: @ 81CECED
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 8, 13293
	waitforvisualfinish
	playsewithpan SE_W071, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call gUnknown_81CED5C
	waitforvisualfinish
	delay 15
	call gUnknown_81D56C9
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 8, 0, 13293
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81CED5C:: @ 81CED5C
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_GIGA_DRAIN:: @ 81CEE7D
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 12, 13293
	waitforvisualfinish
	playsewithpan SE_W071, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call gUnknown_81CEEEC
	waitforvisualfinish
	delay 15
	call gUnknown_81D56C9
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 12, 0, 13293
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81CEEEC:: @ 81CEEEC
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -40, 35
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 28, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 36, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W202, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_LEECH_LIFE:: @ 81CF085
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_ORBS
	delay 1
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	delay 1
	createsprite gUnknown_83E7278, ANIM_ATTACKER, 2, -20, 15, 12
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	playsewithpan SE_W071, 63
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 7, 0
	waitforvisualfinish
	call gUnknown_81CEC44
	waitforvisualfinish
	delay 15
	call gUnknown_81D56C9
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 7, 0, 0
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_SYNTHESIS:: @ 81CF107
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_SPARKLE_2
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 16, 19451
	playsewithpan SE_W025, 192
	call gUnknown_81D569E
	waitforvisualfinish
	call gUnknown_81D56C9
	waitforvisualfinish
	end

Move_TOXIC:: @ 81CF131
	loadspritegfx ANIM_TAG_TOXIC_BUBBLE
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	call gUnknown_81CF14B
	call gUnknown_81CF14B
	waitforvisualfinish
	delay 15
	call gUnknown_81D575B
	waitforvisualfinish
	end

gUnknown_81CF14B:: @ 81CF14B
	createsprite gUnknown_83E69AC, ANIM_TARGET, 2, -24, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	createsprite gUnknown_83E69AC, ANIM_TARGET, 2, 8, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	createsprite gUnknown_83E69AC, ANIM_TARGET, 2, -8, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	createsprite gUnknown_83E69AC, ANIM_TARGET, 2, 24, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	return

Move_SLUDGE:: @ 81CF1A0
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	playsewithpan SE_W145C, 192
	createsprite gUnknown_83E6A20, ANIM_TARGET, 2, 20, 0, 40, 0
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 1, 2, 0, 12, 31774
	call gUnknown_81D575B
	waitforvisualfinish
	end

Move_SLUDGE_BOMB:: @ 81CF1E2
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	call gUnknown_81CF2F2
	createvisualtask AnimTask_ShakeMon2, 5, 1, 3, 0, 15, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 1, 2, 0, 12, 31774
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, 42, 27, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, -27, 44, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, 39, -28, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, -42, -42, 20
	playsewithpan SE_W091, 63
	delay 5
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, 0, 40, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, -8, -44, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, -46, -28, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, 46, 9, 20
	playsewithpan SE_W091, 63
	delay 5
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, 42, 0, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, -43, -12, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, 16, -46, 20
	createsprite gUnknown_83E6A50, ANIM_TARGET, 2, -16, 44, 20
	playsewithpan SE_W091, 63
	delay 0
	waitsound
	waitforvisualfinish
	call gUnknown_81D575B
	waitforvisualfinish
	end

gUnknown_81CF2F2:: @ 81CF2F2
	playsewithpan SE_W145C, 192
	createsprite gUnknown_83E6A20, ANIM_TARGET, 2, 20, 0, 40, 0
	delay 3
	return

Move_ACID:: @ 81CF308
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg 3
	createsprite gUnknown_83E6A38, ANIM_TARGET, 2, 20, 0, 40, 1, 0, 0
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gUnknown_83E6A38, ANIM_TARGET, 2, 20, 0, 40, 1, 24, 0
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gUnknown_83E6A38, ANIM_TARGET, 2, 20, 0, 40, 1, -24, 0
	playsewithpan SE_W145C, 192
	delay 15
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 5, 3, 2, 0, 10, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 20, 2, 2, 0, 12, 31774
	createsprite gUnknown_83E6A84, ANIM_TARGET, 2, 0, -22, 0, 15, 55
	playsewithpan SE_W145, 63
	delay 10
	createsprite gUnknown_83E6A84, ANIM_TARGET, 2, -26, -24, 0, 15, 55
	playsewithpan SE_W145, 63
	delay 10
	createsprite gUnknown_83E6A84, ANIM_TARGET, 2, 15, -27, 0, 15, 50
	playsewithpan SE_W145, 63
	delay 10
	createsprite gUnknown_83E6A84, ANIM_TARGET, 2, -15, -17, 0, 10, 45
	playsewithpan SE_W145, 63
	delay 10
	createsprite gUnknown_83E6A84, ANIM_TARGET, 2, 27, -22, 0, 15, 50
	playsewithpan SE_W145, 63
	waitforvisualfinish
	clearmonbg 3
	end

Move_BONEMERANG:: @ 81CF402
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W155, 192
	createsprite gUnknown_83E7A28, ANIM_ATTACKER, 2, 
	delay 20
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 5, 1
	delay 17
	playsewithpan SE_W233, 192
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, -4
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_BONE_CLUB:: @ 81CF456
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W155, 63
	createsprite gUnknown_83E7A40, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 7, 5, 1, 0, 10, 0, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_BONE_RUSH:: @ 81CF4B8
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W155, 63
	createsprite gUnknown_83E7A40, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 3, 5, 1
	playsewithpan SE_W030, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_SPIKES:: @ 81CF503
	loadspritegfx ANIM_TAG_SPIKES
	monbg 3
	playsewithpan SE_W026, 192
	waitplaysewithpan SE_W030, 63, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 24, 30
	delay 10
	playsewithpan SE_W026, 192
	waitplaysewithpan SE_W030, 63, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, -24, 24, 30
	delay 10
	waitplaysewithpan SE_W030, 63, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, 24, 24, 30
	waitforvisualfinish
	clearmonbg 3
	end

Move_MEGAHORN:: @ 81CF55A
	loadspritegfx ANIM_TAG_HORN_HIT_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	playsewithpan SE_W082, 192
	jumpifcontest gUnknown_81CF631
	fadetobg 7
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -2304, 768, 1, -1

gUnknown_81CF57D:: @ 81CF57D
	waitbgfadein
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 2, 0, 15, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 3
	createsprite gUnknown_83E7224, ANIM_ATTACKER, 3, -42, 25, 0, 0, 6
	delay 4
	playsewithpan SE_W011, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -16, 4, 1, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, -4, 1, 12, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 7, 5, 1, RGB_WHITE, 10, 0, 0
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7
	waitforvisualfinish
	waitforvisualfinish
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

gUnknown_81CF631:: @ 81CF631
	fadetobg 8
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, 2304, 768, 0, -1
	goto gUnknown_81CF57D

Move_GUST:: @ 81CF648
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W016, 63
	createsprite gUnknown_83E6AE8, ANIM_ATTACKER, 2, 0, -16
	createvisualtask sub_80B194C, 5, 1, 70
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 7, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	playsewithpan SE_W016B, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_WING_ATTACK:: @ 81CF699
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_W017, 192, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, 12, 4, 1, 4
	createvisualtask sub_80B194C, 5, 1, 70
	createsprite gUnknown_83E6B1C, ANIM_ATTACKER, 2, -25, 0, 0, 0, 20
	createsprite gUnknown_83E6B1C, ANIM_ATTACKER, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 16, 0, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 1, 1
	loopsewithpan SE_W003, 63, 5, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_PECK:: @ 81CF736
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_W030, 63
	createvisualtask sub_8099A78, 2, 3, -768, 1, 2
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, -12, 0, 1, 3
	waitforvisualfinish
	end

Move_AEROBLAST:: @ 81CF75D
	loadspritegfx ANIM_TAG_AIR_WAVE_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	call gUnknown_81D59CF
	monbgprio_28 1
	setalpha 12, 8
	call gUnknown_81CF7B9
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 50, 1
	call gUnknown_81CF7B9
	call gUnknown_81CF7B9
	call gUnknown_81CF7B9
	call gUnknown_81CF7B9
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	delay 0
	call gUnknown_81D59FF
	end

gUnknown_81CF7B9:: @ 81CF7B9
	playsewithpan SE_W026, 192
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 0, 0
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 0, 0
	delay 3
	playsewithpan SE_W026, 192
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 1, 0
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 1, 0
	delay 3
	playsewithpan SE_W026, 192
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 2, 0
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 2, 0
	delay 3
	playsewithpan SE_W026, 192
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 3, 0
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 3, 0
	delay 3
	return

Move_WATER_GUN:: @ 81CF87A
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createsprite gUnknown_83E5A80, ANIM_ATTACKER, 2, 20, 0, 0, 0, 40, -25
	playsewithpan SE_W145, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 8, 1
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 4, 0, 0, 1, 2
	createsprite gUnknown_83E5A98, ANIM_ATTACKER, 2, 0, -15, 0, 15, 55
	playsewithpan SE_W152, 63
	delay 10
	createsprite gUnknown_83E5A98, ANIM_ATTACKER, 2, 15, -20, 0, 15, 50
	playsewithpan SE_W152, 63
	delay 10
	createsprite gUnknown_83E5A98, ANIM_ATTACKER, 2, -15, -10, 0, 10, 45
	playsewithpan SE_W152, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_CRABHAMMER:: @ 81CF907
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg 3
	setalpha 12, 8
	createsprite gUnknown_83E7C38, ANIM_ATTACKER, 4, 0, 0, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 32429, 10, 0, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 4
	waitforvisualfinish
	loopsewithpan SE_W152, 63, 20, 3
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 4, 8, 1
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 10, 10, 20, 1
	delay 4
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 20, -20, 20, 1
	delay 4
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, -15, 15, 20, 1
	delay 4
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 0, 0, 20, 1
	delay 4
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, -10, -20, 20, 1
	delay 4
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 16, -8, 20, 1
	delay 4
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, 5, 8, 20, 1
	delay 4
	createsprite gUnknown_83E5AB0, ANIM_ATTACKER, 2, -16, 0, 20, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_SURF:: @ 81CFA01
	createvisualtask sub_80AB38C, 2, 0
	delay 24
	panse_1B SE_W057, 192, 63, 2, 0
	waitforvisualfinish
	end

Move_FLAMETHROWER:: @ 81CFA15
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 46, 1
	delay 6
	createvisualtask sub_80AB100, 5, 100
	panse_1B SE_W053, 192, 63, 2, 0
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 43, 1
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	call gUnknown_81CFA8F
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81CFA8F:: @ 81CFA8F
	createsprite gUnknown_83E59D0, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	createsprite gUnknown_83E59D0, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	return

Move_SANDSTORM:: @ 81CFAB2
	loadspritegfx ANIM_TAG_FLYING_DIRT
	playsewithpan SE_W201, 0
	createvisualtask AnimTask_LoadSandstormBackground, 5, 0
	delay 16
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 10, 2304, 96, 0
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 90, 2048, 96, 0
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 50, 2560, 96, 0
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 20, 2304, 96, 0
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 70, 1984, 96, 0
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 0, 2816, 96, 0
	delay 10
	createsprite gUnknown_83E7450, ANIM_ATTACKER, 40, 60, 2560, 96, 0
	end

Move_WHIRLPOOL:: @ 81CFB3A
	loadspritegfx ANIM_TAG_WATER_ORB
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 23968
	playsewithpan SE_W250, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 50, 1
	call gUnknown_81CFB92
	call gUnknown_81CFB92
	call gUnknown_81CFB92
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 23968
	waitforvisualfinish
	clearmonbg 3
	end

gUnknown_81CFB92:: @ 81CFB92
	createsprite gUnknown_83E7420, ANIM_TARGET, 2, 0, 28, 384, 50, 8, 50, 1
	delay 2
	createsprite gUnknown_83E7420, ANIM_TARGET, 2, 0, 32, 240, 40, 11, -46, 1
	delay 2
	createsprite gUnknown_83E7420, ANIM_TARGET, 2, 0, 33, 416, 40, 4, 42, 1
	delay 2
	createsprite gUnknown_83E7420, ANIM_TARGET, 2, 0, 31, 288, 45, 6, -42, 1
	delay 2
	createsprite gUnknown_83E7420, ANIM_TARGET, 2, 0, 28, 448, 45, 11, 46, 1
	delay 2
	createsprite gUnknown_83E7420, ANIM_TARGET, 2, 0, 33, 464, 50, 10, -50, 1
	delay 2
	return

Move_FLY:: @ 81CFC1D
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	choosetwoturnanim BattleAnimScript_Fly_Turn1, BattleAnimScript_Fly_Turn2

BattleAnimScript_Fly_End:: @ 81CFC2C
	waitforvisualfinish
	end

BattleAnimScript_Fly_Turn1:: @ 81CFC2E
	playsewithpan SE_W019, 192
	createsprite gUnknown_83E6BB8, ANIM_ATTACKER, 2, 0, 0, 13, 336
	goto BattleAnimScript_Fly_End

BattleAnimScript_Fly_Turn2:: @ 81CFC46
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W104, 192
	createsprite gUnknown_83E6BD0, ANIM_ATTACKER, 2, 20
	delay 20
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	goto BattleAnimScript_Fly_End

Move_BOUNCE:: @ 81CFC87
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	choosetwoturnanim BattleAnimScript_Bounce_Turn1, BattleAnimScript_Bounce_Turn2

BattleAnimScript_Bounce_End:: @ 81CFC96
	end

BattleAnimScript_Bounce_Turn1:: @ 81CFC97
	playsewithpan SE_W100, 192
	createsprite gUnknown_83E6CD0, ANIM_ATTACKER, 2, 0, 0
	goto BattleAnimScript_Bounce_End

BattleAnimScript_Bounce_Turn2:: @ 81CFCAB
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W207, 63
	createsprite gUnknown_83E6CFC, ANIM_TARGET, 3, 
	delay 7
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 11, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	goto BattleAnimScript_Bounce_End

Move_KARATE_CHOP:: @ 81CFCEA
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W104, 63
	createsprite gUnknown_83E66E0, ANIM_ATTACKER, 2, -16, 0, 0, 0, 10, 1, 3, 0
	waitforvisualfinish
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_CROSS_CHOP:: @ 81CFD3C
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_CROSS_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W025, 63
	createsprite gUnknown_83E6740, ANIM_ATTACKER, 2, 0, 0, 0
	createsprite gUnknown_83E6740, ANIM_ATTACKER, 2, 0, 0, 1
	delay 40
	playsewithpan SE_W013, 63
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, RGB_WHITE, 10, 0, 10
	createsprite gUnknown_83E7C80, ANIM_ATTACKER, 3, 0, 0, 1, 20
	createvisualtask AnimTask_ShakeMon, 5, 1, 7, 0, 9, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_JUMP_KICK:: @ 81CFDA5
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 3
	createsprite gUnknown_83E66F8, ANIM_ATTACKER, 2, -16, 8, 0, 0, 10, 1, 1, 1
	playsewithpan SE_W026, 63
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 7, 1
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_HI_JUMP_KICK:: @ 81CFE02
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 0, 0, 8
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 3
	delay 2
	createsprite gUnknown_83E66F8, ANIM_ATTACKER, 2, -16, 8, 0, 0, 10, 1, 1, 1
	playsewithpan SE_W026, 63
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -28, 0, 0, 3
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 3, 0, 11, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_DOUBLE_KICK:: @ 81CFE98
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	createsprite gUnknown_83E6728, ANIM_ATTACKER, 3, 1, 20, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_TRIPLE_KICK:: @ 81CFECB
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W233B, 63
	jumpifmoveturn 0, gUnknown_81CFEF0
	jumpifmoveturn 1, gUnknown_81CFF26
	goto gUnknown_81CFF5C

gUnknown_81CFEEB:: @ 81CFEEB
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81CFEF0:: @ 81CFEF0
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, -16, -8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -16, -16, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	goto gUnknown_81CFEEB

gUnknown_81CFF26:: @ 81CFF26
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 8, 8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	goto gUnknown_81CFEEB

gUnknown_81CFF5C:: @ 81CFF5C
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -8, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	goto gUnknown_81CFEEB

Move_DYNAMIC_PUNCH:: @ 81CFF92
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_EXPLOSION_6
	delay 1
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W233B, 63
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 7, 1
	delay 1
	waitsound
	playsewithpan SE_W120, 63
	createvisualtask AnimTask_ShakeMon2, 5, 1, 5, 0, 28, 1
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_COUNTER:: @ 81D005A
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 3
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 1, 4
	playsewithpan SE_W233, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -15, 18, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 25, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, -15, 18, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, -4, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 0, -4, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 15, 9, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 15, 9, 8, 1, 0
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_VITAL_THROW:: @ 81D0129
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W233, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 12, 4, 1, 2
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	delay 11
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 10
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_ROCK_SMASH:: @ 81D01A4
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 3
	setalpha 12, 8
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 8, 1, 0
	playsewithpan SE_W233B, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 5, 1
	waitforvisualfinish
	playsewithpan SE_W088, 63
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gUnknown_83E73CC, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_SUBMISSION:: @ 81D029C
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W104, 192
	waitplaysewithpan SE_W004, 63, 10
	waitplaysewithpan SE_W104, 192, 20
	waitplaysewithpan SE_W004, 63, 30
	waitplaysewithpan SE_W104, 192, 40
	waitplaysewithpan SE_W004, 63, 50
	waitplaysewithpan SE_W104, 192, 60
	waitplaysewithpan SE_W004, 63, 70
	waitplaysewithpan SE_W104, 192, 80
	waitplaysewithpan SE_W004, 63, 90
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, -18, 6, 6, 4
	createvisualtask AnimTask_TranslateMonElliptical, 2, 1, 18, 6, 6, 4
	call gUnknown_81D030B
	call gUnknown_81D030B
	call gUnknown_81D030B
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81D030B:: @ 81D030B
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -12, 1, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -12, 8, 1, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 12, 0, 1, 1
	delay 8
	return

Move_SUNNY_DAY:: @ 81D033F
	loadspritegfx ANIM_TAG_SUNLIGHT
	monbg 2
	setalpha 13, 3
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 1, 0, 6, RGB_WHITE
	waitforvisualfinish
	panse_26 SE_W080, 192, 63, 1, 0
	call gUnknown_81D038B
	call gUnknown_81D038B
	call gUnknown_81D038B
	call gUnknown_81D038B
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 1, 6, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg 2
	blendoff
	end

gUnknown_81D038B:: @ 81D038B
	createsprite gUnknown_83E5D18, ANIM_ATTACKER, 40, 
	delay 6
	return

Move_COTTON_SPORE:: @ 81D0395
	loadspritegfx ANIM_TAG_SPORE
	monbg 3
	monbgprio_28 1
	loopsewithpan SE_W077, 63, 18, 10
	call gUnknown_81D03B5
	call gUnknown_81D03B5
	call gUnknown_81D03B5
	waitforvisualfinish
	clearmonbg 3
	end

gUnknown_81D03B5:: @ 81D03B5
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, 85, 80, 0
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 170, 80, 0
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 80, 0
	delay 12
	return

Move_SPORE:: @ 81D03EF
	loadspritegfx ANIM_TAG_SPORE
	monbg 3
	setalpha 12, 8
	createvisualtask AnimTask_SporeDoubleBattle, 2, 
	loopsewithpan SE_W077, 63, 16, 11
	call gUnknown_81D041A
	call gUnknown_81D041A
	call gUnknown_81D041A
	waitforvisualfinish
	delay 1
	clearmonbg 3
	blendoff
	end

gUnknown_81D041A:: @ 81D041A
	createsprite gSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -20, 85, 80, 1
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -10, 170, 80, 1
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_TARGET, 2, 0, -15, 0, 80, 1
	delay 12
	return

Move_PETAL_DANCE:: @ 81D0454
	loadspritegfx ANIM_TAG_FLOWER
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W080, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 12, 6, 6, 3
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 16, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -16, -24, 8, 100
	delay 15
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 32, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -32, -24, 8, 100
	delay 15
	createsprite gPetalDanceBigFlowerSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 8, 140
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 24, -24, 8, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -24, -24, 8, 100
	delay 30
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 16, -24, 0, 100
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -16, -24, 0, 100
	delay 30
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, 20, -16, 14, 80
	createsprite gPetalDanceSmallFlowerSpriteTemplate, ANIM_ATTACKER, 2, -20, -14, 16, 80
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 5
	delay 3
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 8
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_RAZOR_LEAF:: @ 81D058C
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	delay 1
	loopsewithpan SE_W077, 192, 10, 5
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 60
	playsewithpan SE_W013B, 192
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 20
	playsewithpan SE_W013, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_ANCIENT_POWER:: @ 81D0693
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, 4, 1, 10, 1
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, 20, 32, -48, 50, 2
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, 0, 32, -38, 25, 5
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, 32, 32, -28, 40, 3
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, -20, 32, -48, 50, 2
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, 20, 32, -28, 60, 1
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, 0, 32, -28, 30, 4
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 30, 1
	playsewithpan SE_W082, 192
	delay 10
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, 15, 32, -48, 25, 5
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, -10, 32, -42, 30, 4
	delay 10
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, 0, 32, -42, 25, 5
	createsprite gUnknown_83E74C0, ANIM_ATTACKER, 2, -25, 32, -48, 30, 4
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 0, 0, 4
	delay 3
	playsewithpan SE_W120, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_OCTAZOOKA:: @ 81D07BB
	loadspritegfx ANIM_TAG_GRAY_SMOKE
	loadspritegfx ANIM_TAG_BLACK_BALL
	playsewithpan SE_W025B, 192
	createsprite gOctazookaBallSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 20, 0
	waitforvisualfinish
	playsewithpan SE_W120, 63
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, 8, 8, 1, 0
	delay 2
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, -8, -8, 1, 0
	delay 2
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, 8, -8, 1, 0
	delay 2
	createsprite gOctazookaSmokeSpriteTemplate, ANIM_TARGET, 2, -8, 8, 1, 0
	waitforvisualfinish
	end

Move_MIST:: @ 81D0821
	loadspritegfx ANIM_TAG_MIST_CLOUD
	monbg 2
	setalpha 12, 8
	loopsewithpan SE_W054, 192, 20, 15
	call gUnknown_81D086C
	call gUnknown_81D086C
	call gUnknown_81D086C
	call gUnknown_81D086C
	call gUnknown_81D086C
	call gUnknown_81D086C
	call gUnknown_81D086C
	delay 32
	createvisualtask AnimTask_CurseBlendEffect, 2, 10, 8, 2, 0, 14, RGB_WHITE
	waitforvisualfinish
	clearmonbg 2
	blendoff
	end

gUnknown_81D086C:: @ 81D086C
	createsprite gUnknown_83E64A4, ANIM_ATTACKER, 2, 0, -24, 48, 240, 0, 1
	delay 7
	return

Move_HAZE:: @ 81D0882
	waitforvisualfinish
	playsewithpan SE_W114, 0
	createvisualtask AnimTask_Haze1, 5, 
	delay 30
	createvisualtask AnimTask_BlendSelected, 10, 0 | (0xF << 7), 2, 0, 16, RGB_BLACK
	delay 90
	createvisualtask AnimTask_BlendSelected, 10, 0 | (0xF << 7), 1, 16, 0, RGB_BLACK
	end

Move_FIRE_PUNCH:: @ 81D08B5
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 9, RGB(31, 0, 0)
	createsprite gUnknown_83E5BE0, ANIM_TARGET, 1, 0
	createsprite gUnknown_83E5BE0, ANIM_TARGET, 1, 64
	createsprite gUnknown_83E5BE0, ANIM_TARGET, 1, 128
	createsprite gUnknown_83E5BE0, ANIM_TARGET, 1, 196
	playsewithpan SE_W172, 63
	waitforvisualfinish
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 15, 1
	call gUnknown_81D0950
	delay 4
	playsewithpan SE_W007, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 9, 0, RGB(31, 0, 0)
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81D0950:: @ 81D0950
	createsprite gUnknown_83E5BF8, ANIM_TARGET, 1, 0, 10, 192, 176, 40
	createsprite gUnknown_83E5BF8, ANIM_TARGET, 1, 0, 10, -192, 240, 40
	createsprite gUnknown_83E5BF8, ANIM_TARGET, 1, 0, 10, 192, -160, 40
	createsprite gUnknown_83E5BF8, ANIM_TARGET, 1, 0, 10, -192, -112, 40
	createsprite gUnknown_83E5BF8, ANIM_TARGET, 1, 0, 10, 160, 48, 40
	createsprite gUnknown_83E5BF8, ANIM_TARGET, 1, 0, 10, -224, -32, 40
	createsprite gUnknown_83E5BF8, ANIM_TARGET, 1, 0, 10, 112, -128, 40
	return

Move_LEER:: @ 81D09C8
	loadspritegfx ANIM_TAG_LEER
	monbg 0
	monbgprio_28 0
	setalpha 8, 8
	playsewithpan SE_W043, 192
	createsprite gLeerSpriteTemplate, ANIM_ATTACKER, 2, 24, -12
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, 0, 1
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 1, 0, 9, 1
	waitforvisualfinish
	clearmonbg 0
	blendoff
	delay 1
	waitforvisualfinish
	end

Move_DREAM_EATER:: @ 81D0A1F
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg 3
	monbgprio_2A 1
	playsewithpan SE_W060, 192
	call gUnknown_81D59BB
	setalpha 8, 8
	playsewithpan SE_W107, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, 1, 1
	waitforvisualfinish
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 2, 25, 1
	call gUnknown_81D0A89
	waitforvisualfinish
	delay 15
	call gUnknown_81D56C9
	waitforvisualfinish
	clearmonbg 3
	blendoff
	delay 1
	call gUnknown_81D59C7
	end

gUnknown_81D0A89:: @ 81D0A89
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -40, 35
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 28, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 36, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W207, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_POISON_GAS:: @ 81D0C22
	loadspritegfx ANIM_TAG_PURPLE_GAS_CLOUD
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	delay 0
	monbg 3
	monbgprio_29
	setalpha 12, 8
	delay 0
	playsewithpan SE_W054, 192
	createsprite gUnknown_83E6514, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gUnknown_83E6514, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gUnknown_83E6514, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gUnknown_83E6514, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gUnknown_83E6514, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gUnknown_83E6514, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 40
	loopsewithpan SE_W054, 63, 28, 6
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 6, 2, 0, 12, 26650
	waitforvisualfinish
	blendoff
	clearmonbg 3
	delay 0
	end

Move_BIND:: @ 81D0D00
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 3328, 4, 0
	goto gUnknown_81D0D16

gUnknown_81D0D16:: @ 81D0D16
	playsewithpan SE_W020, 63
	call gUnknown_81D0D26
	call gUnknown_81D0D26
	waitforvisualfinish
	end

gUnknown_81D0D26:: @ 81D0D26
	createvisualtask AnimTask_ScaleMonAndRestore, 5, 10, -5, 5, 1, 0
	delay 16
	return

Move_WRAP:: @ 81D0D3A
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 6, 4, 2, 4
	goto gUnknown_81D0D16

Move_PSYBEAM:: @ 81D0D50
	loadspritegfx ANIM_TAG_GOLD_RING
	playsewithpan SE_W060, 192
	call gUnknown_81D59BB
	createsoundtask mas_80DCF38, 193, -64, 63, 3, 4, 0, 15
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 2048, 4, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 2, 2, 0, 12, 32351
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	call gUnknown_81D0DD4
	waitforvisualfinish
	delay 1
	call gUnknown_81D59C7
	end

gUnknown_81D0DD4:: @ 81D0DD4
	createsprite gUnknown_83E6EEC, ANIM_TARGET, 2, 16, 0, 0, 0, 13, 0
	delay 4
	return

Move_HYPNOSIS:: @ 81D0DEA
	loadspritegfx ANIM_TAG_GOLD_RING
	call gUnknown_81D59BB
	call gUnknown_81D0E1D
	call gUnknown_81D0E1D
	call gUnknown_81D0E1D
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 2, 2, 0, 12, 32351
	waitforvisualfinish
	delay 1
	call gUnknown_81D59C7
	end

gUnknown_81D0E1D:: @ 81D0E1D
	playsewithpan SE_W048, 192
	createsprite gUnknown_83E6EEC, ANIM_TARGET, 2, 0, 8, 0, 8, 27, 0
	createsprite gUnknown_83E6EEC, ANIM_TARGET, 2, 16, -8, 0, -8, 27, 0
	delay 6
	return

Move_PSYWAVE:: @ 81D0E4A
	loadspritegfx ANIM_TAG_BLUE_RING
	playsewithpan SE_W060, 192
	call gUnknown_81D59BB
	createvisualtask sub_80AB100, 5, 100
	createsoundtask mas_80DCF38, 196, -64, 63, 2, 9, 0, 10
	call gUnknown_81D0EAD
	call gUnknown_81D0EAD
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 1, 4, 0, 12, 32351
	call gUnknown_81D0EAD
	call gUnknown_81D0EAD
	call gUnknown_81D0EAD
	call gUnknown_81D0EAD
	waitforvisualfinish
	delay 1
	call gUnknown_81D59C7
	end

gUnknown_81D0EAD:: @ 81D0EAD
	createsprite gUnknown_83E59E8, ANIM_TARGET, 3, 10, 10, 0, 16
	delay 4
	createsprite gUnknown_83E59E8, ANIM_TARGET, 3, 10, 10, 0, 16
	delay 4
	return

Move_ZAP_CANNON:: @ 81D0ED0
	loadspritegfx ANIM_TAG_BLACK_BALL_2
	loadspritegfx ANIM_TAG_SPARK_2
	playsewithpan SE_W086, 192
	createsprite gUnknown_83E5FDC, ANIM_TARGET, 3, 10, 0, 0, 0, 30, 0
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 16, 30, 0, 40, 0
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 16, 30, 64, 40, 1
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 16, 30, 128, 40, 0
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 16, 30, 192, 40, 2
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 8, 30, 32, 40, 0
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 8, 30, 96, 40, 1
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 8, 30, 160, 40, 0
	createsprite gUnknown_83E6008, ANIM_TARGET, 4, 10, 0, 8, 30, 224, 40, 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	delay 15
	waitplaysewithpan SE_W085B, 63, 19
	call gUnknown_81D58D4
	waitforvisualfinish
	end

Move_STEEL_WING:: @ 81D0FB5
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_W017, 192, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, 12, 4, 1, 4
	createvisualtask sub_80B194C, 5, 1, 70
	createsprite gUnknown_83E6B1C, ANIM_ATTACKER, 2, -25, 0, 0, 0, 20
	createsprite gUnknown_83E6B1C, ANIM_ATTACKER, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 16, 0, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 1, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_IRON_TAIL:: @ 81D1064
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 0, 0
	waitforvisualfinish
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 0, 1
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

Move_POISON_TAIL:: @ 81D10C2
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 1, 23768
	waitforvisualfinish
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 0, 1
	clearmonbg 1
	blendoff
	call gUnknown_81D575B
	waitforvisualfinish
	end

Move_METAL_CLAW:: @ 81D1128
	loadspritegfx ANIM_TAG_CLAW_SLASH
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 2
	playsewithpan SE_W013, 63
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, -10, -10, 0
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, -10, 10, 0
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	delay 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 2
	playsewithpan SE_W013, 63
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, 10, -10, 1
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, 10, 10, 1
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	waitforvisualfinish
	end

Move_NIGHT_SHADE:: @ 81D11BB
	monbg 0
	monbgprio_28 0
	playsewithpan SE_W060, 192
	fadetobg 2
	waitbgfadein
	delay 10
	playsewithpan SE_W043, 192
	createvisualtask sub_80B54E8, 5, 85
	delay 70
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 12, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 0, 2, 0, 13, 0
	waitforvisualfinish
	clearmonbg 0
	delay 1
	restorebg
	waitbgfadein
	end

Move_EGG_BOMB:: @ 81D1203
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_LARGE_FRESH_EGG
	playsewithpan SE_W039, 192
	createsprite gEggThrowSpriteTemplate, ANIM_TARGET, 2, 10, 0, 0, 0, 25, -32
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 16, 1
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 6, 5, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -16, -15, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 16, -5, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -12, 18, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 0, 5, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	waitforvisualfinish
	end

Move_SHADOW_BALL:: @ 81D129D
	loadspritegfx ANIM_TAG_SHADOW_BALL
	fadetobg 2
	waitbgfadein
	delay 15
	createsoundtask mas_80DCF38, 161, -64, 63, 5, 5, 0, 5
	createsprite gShadowBallSpriteTemplate, ANIM_TARGET, 2, 16, 16, 8
	waitforvisualfinish
	playsewithpan SE_W028, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 8, 1
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_LICK:: @ 81D12E0
	loadspritegfx ANIM_TAG_LICK
	delay 15
	playsewithpan SE_W122, 63
	createsprite gUnknown_83E763C, ANIM_TARGET, 2, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 16, 1
	waitforvisualfinish
	end

Move_FOCUS_ENERGY:: @ 81D1307
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_W082, 192
	call gUnknown_81CB267
	delay 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, RGB_WHITE
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	call gUnknown_81CB267
	delay 8
	call gUnknown_81CB267
	waitforvisualfinish
	end

Move_BIDE:: @ 81D1347
	choosetwoturnanim BattleAnimScript_Bide_Setup, BattleAnimScript_Bide_Release
	end

BattleAnimScript_Bide_Setup:: @ 81D1351
	loopsewithpan SE_W036, 192, 9, 2
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	waitforvisualfinish
	end

BattleAnimScript_Bide_Release:: @ 81D137D
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	loopsewithpan SE_W036, 192, 9, 2
	createvisualtask AnimTask_BlendSelected, 10, 2, 2, 0, 11, RGB(31, 0, 0)
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 12, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 16, 1
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 18, -8, 1, 1
	delay 5
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, -18, 8, 1, 1
	delay 5
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, -8, -5, 1, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 2, 11, 0, RGB(31, 0, 0)
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_STRING_SHOT:: @ 81D1446
	loadspritegfx ANIM_TAG_STRING
	loadspritegfx ANIM_TAG_WEB_THREAD
	monbg 3
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 0, 9, 0
	waitforvisualfinish
	loopsewithpan SE_W081, 192, 9, 6
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	call gUnknown_81D1504
	waitforvisualfinish
	playsewithpan SE_W081B, 63
	createsprite gUnknown_83E72A8, ANIM_TARGET, 2, 0, 10
	delay 4
	createsprite gUnknown_83E72A8, ANIM_TARGET, 2, 0, -2
	delay 4
	createsprite gUnknown_83E72A8, ANIM_TARGET, 2, 0, 22
	waitforvisualfinish
	clearmonbg 3
	delay 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 9, 0, 0
	end

gUnknown_81D1504:: @ 81D1504
	createsprite gWebThreadSpriteTemplate, ANIM_TARGET, 2, 20, 0, 512, 20, 1
	delay 1
	return

Move_SPIDER_WEB:: @ 81D1518
	loadspritegfx ANIM_TAG_SPIDER_WEB
	loadspritegfx ANIM_TAG_WEB_THREAD
	monbg 3
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 0, 9, 0
	waitforvisualfinish
	monbgprio_28 1
	loopsewithpan SE_W081, 192, 9, 6
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	call gUnknown_81D15A5
	waitforvisualfinish
	playsewithpan SE_W081B, 63
	createsprite gSpiderWebSpriteTemplate, ANIM_ATTACKER, 2, 
	waitforvisualfinish
	clearmonbg 3
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 9, 0, 0
	end

gUnknown_81D15A5:: @ 81D15A5
	createsprite gWebThreadSpriteTemplate, ANIM_TARGET, 2, 20, 0, 512, 20, 0
	delay 1
	return

Move_RAZOR_WIND:: @ 81D15B9
	choosetwoturnanim BattleAnimScript_RazorWInd_Turn1, BattleAnimScript_RazorWInd_Turn2

gUnknown_81D15C2:: @ 81D15C2
	waitforvisualfinish
	end

BattleAnimScript_RazorWInd_Turn1:: @ 81D15C4
	loadspritegfx ANIM_TAG_GUST
	playsewithpan SE_W016, 192
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 0, 7, 40
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 85, 7, 40
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 170, 7, 40
	waitforvisualfinish
	playsewithpan SE_W016B, 192
	goto gUnknown_81D15C2

BattleAnimScript_RazorWInd_Turn2:: @ 81D1614
	loadspritegfx ANIM_TAG_AIR_WAVE_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W013B, 192
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 14, 8, 0, 0, 22, 2, 1
	delay 2
	playsewithpan SE_W013B, 192
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 14, -8, 16, 14, 22, 1, 1
	delay 2
	playsewithpan SE_W013B, 192
	createsprite gUnknown_83E6B4C, ANIM_ATTACKER, 2, 14, 12, -16, -14, 22, 0, 1
	delay 17
	playsewithpan SE_W013, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 10, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	goto gUnknown_81D15C2

Move_DISABLE:: @ 81D169F
	loadspritegfx ANIM_TAG_SPARKLE_4
	monbg 1
	monbgprio_28 1
	setalpha 8, 8
	playsewithpan SE_W197, 192
	createsprite gSpriteTemplate_83BF480, ANIM_ATTACKER, 13, 24, -16
	waitforvisualfinish
	createvisualtask AnimTask_GrowAndGreyscale, 5, 
	loopsewithpan SE_W020, 63, 15, 4
	waitforvisualfinish
	delay 1
	clearmonbg 1
	blendoff
	end

Move_RECOVER:: @ 81D16CD
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg 2
	setalpha 12, 8
	loopsewithpan SE_W025, 192, 13, 3
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 6, 0, 11, 12287
	call gUnknown_81D170D
	call gUnknown_81D170D
	call gUnknown_81D170D
	waitforvisualfinish
	clearmonbg 2
	blendoff
	delay 1
	call gUnknown_81D56C9
	waitforvisualfinish
	end

gUnknown_81D170D:: @ 81D170D
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 40, -10, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -35, -10, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 15, -40, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -10, -32, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 25, -20, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -40, -20, 13
	delay 3
	createsprite gPowerAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 5, -40, 13
	delay 3
	return

Move_MIMIC:: @ 81D1777
	loadspritegfx ANIM_TAG_ORBS
	monbg_22 3
	setalpha 11, 5
	panse_1B SE_W107, 63, 192, 253, 0
	createvisualtask sub_80A2F0C, 5, 128, 24
	delay 15
	createsprite gMimicOrbSpriteTemplate, ANIM_TARGET, 2, -12, 24
	delay 10
	setarg 7, 65535
	waitforvisualfinish
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 11, RGB_WHITE
	waitforvisualfinish
	clearmonbg_23 3
	blendoff
	end

Move_CONSTRICT:: @ 81D17C1
	loadspritegfx ANIM_TAG_TENDRILS
	loopsewithpan SE_W010, 63, 6, 4
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, -8, 1, 2
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	delay 20
	playsewithpan SE_W020, 63
	setarg 7, 65535
	waitforvisualfinish
	end

Move_CURSE:: @ 81D1829
	choosetwoturnanim BattleAnimScript_Curse_Ghost, BattleAnimScript_Curse_Other

BattleAnimScript_Curse_Ghost:: @ 81D1832
	loadspritegfx ANIM_TAG_NAIL
	loadspritegfx ANIM_TAG_GHOSTLY_SPIRIT
	monbg 2
	createvisualtask sub_80B63B4, 5, 
	waitforvisualfinish
	delay 20
	createsprite gUnknown_83E7680, ANIM_ATTACKER, 2, 
	delay 60
	call gUnknown_81D1899
	delay 41
	call gUnknown_81D1899
	delay 41
	call gUnknown_81D1899
	waitforvisualfinish
	clearmonbg 2
	delay 1
	monbg 3
	playsewithpan SE_W171, 63
	createsprite gUnknown_83E7698, ANIM_TARGET, 2, 
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 14, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 16, 0, 0
	waitforvisualfinish
	clearmonbg 3
	end

gUnknown_81D1899:: @ 81D1899
	createvisualtask AnimTask_ShakeMon2, 2, 0, 4, 0, 10, 0
	playsewithpan SE_W020, 192
	return

BattleAnimScript_Curse_Other:: @ 81D18AF
	createvisualtask AnimTask_SwayMon, 5, 0, 10, 1536, 3, 0
	waitforvisualfinish
	delay 10
	call gUnknown_81D18CA
	waitforvisualfinish
	end

gUnknown_81D18CA:: @ 81D18CA
	playsewithpan SE_W082, 192
	createvisualtask AnimTask_SetUpCurseBackground, 5, 
	createvisualtask AnimTask_CurseBlendEffect, 5, 2, 4, 2, 0, 10, 31
	return

Move_SOFT_BOILED:: @ 81D18E9
	loadspritegfx ANIM_TAG_BREAKING_EGG
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg 2
	playsewithpan SE_W039, 192
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 2, 6, 1
	createsprite gSoftBoiledEggSpriteTemplate, ANIM_ATTACKER, 4, 0, 16, 0
	createsprite gSoftBoiledEggSpriteTemplate, ANIM_ATTACKER, 4, 0, 16, 1
	delay 120
	delay 7
	playsewithpan SE_W030, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 10, 0, 31500
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 31, 16, 0, 1
	delay 8
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 31, 16, 0, 1
	delay 60
	setarg 7, 65535
	waitforvisualfinish
	clearmonbg 2
	call gUnknown_81D5712
	end

Move_HEAL_BELL:: @ 81D196B
	loadspritegfx ANIM_TAG_BELL
	loadspritegfx ANIM_TAG_MUSIC_NOTES_2
	loadspritegfx ANIM_TAG_THIN_RING
	createvisualtask AnimTask_BlendSelected, 10, 10, 0, 0, 10, RGB_WHITE
	waitforvisualfinish
	createvisualtask sub_80A96B4, 5, 
	createsprite gBellSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 0, 1
	delay 12
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 48, -18, 35, 0, 0
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -48, 20, 30, 1, 1
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -38, -29, 30, 2, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 36, 18, 30, 3, 3
	call gUnknown_81D1B2F
	delay 33
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 19, 26, 35, 4, 4
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -34, -12, 30, 5, 5
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 41, -20, 34, 6, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -15, 26, 32, 7, 0
	call gUnknown_81D1B2F
	delay 33
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -48, 18, 31, 0, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 48, -20, 30, 2, 5
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 38, 29, 33, 4, 3
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -36, -18, 30, 6, 1
	call gUnknown_81D1B2F
	waitforvisualfinish
	createvisualtask sub_80A9760, 5, 
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_BELL
	unloadspritegfx ANIM_TAG_MUSIC_NOTES_2
	unloadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	playsewithpan SE_W234, 192
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_SPARKLE_2
	loadspritegfx ANIM_TAG_THIN_RING
	playsewithpan SE_REAPOKE, 192
	createvisualtask AnimTask_BlendExcept, 10, 4, 3, 10, 0, 31500
	createvisualtask AnimTask_BlendSelected, 10, 10, 3, 10, 0, RGB_WHITE
	createsprite gBlendThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 16, 0, 0, 0, 1
	end

gUnknown_81D1B2F:: @ 81D1B2F
	createvisualtask AnimTask_BlendExcept, 10, 4, 3, 8, 0, 31500
	createvisualtask AnimTask_BlendSelected, 10, 10, 3, 2, 10, RGB_WHITE
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 0, 1
	playsewithpan SE_W215, 192
	return

Move_FAKE_OUT:: @ 81D1B65
	playsewithpan SE_W260, 0
	createvisualtask AnimTask_FakeOut, 5, 
	waitforvisualfinish
	playsewithpan SE_W166, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask sub_80A9A20, 3, 
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 16, 0, RGB_WHITE
	end

Move_SCARY_FACE:: @ 81D1BA0
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 27, 3, 0, 16, 0
	playsewithpan SE_W060, 192
	waitforvisualfinish
	delay 10
	playsewithpan SE_W043, 192
	createvisualtask AnimTask_ScaryFace, 5, 
	delay 13
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	waitforvisualfinish
	createvisualtask sub_80ADAD8, 3, 20, 1, 0
	playsewithpan SE_W081B, 63
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 27, 3, 16, 0, 0
	waitforvisualfinish
	end

Move_SWEET_KISS:: @ 81D1C03
	loadspritegfx ANIM_TAG_RED_HEART
	loadspritegfx ANIM_TAG_ANGEL
	createsprite gAngelSpriteTemplate, ANIM_TARGET, 2, 16, -48
	playsewithpan SE_W215, 63
	delay 23
	playsewithpan SE_W215, 63
	delay 23
	playsewithpan SE_W215, 63
	waitforvisualfinish
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 160, -30
	playsewithpan SE_W213, 63
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -128, -22
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -384, -31
	end

Move_LOVELY_KISS:: @ 81D1C6C
	loadspritegfx ANIM_TAG_PINK_HEART
	loadspritegfx ANIM_TAG_DEVIL
	createsprite gDevilSpriteTemplate, ANIM_TARGET, 2, 0, -24
	playsewithpan SE_W060B, 63
	waitforvisualfinish
	playsewithpan SE_W213, 63
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -128, -22
	end

Move_FURY_SWIPES:: @ 81D1CB3
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_W010, 63
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 5, 1
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_W010, 63
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 7, 1
	end

Move_INGRAIN:: @ 81D1D17
	loadspritegfx ANIM_TAG_ROOTS
	loadspritegfx ANIM_TAG_ORBS
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, 16, 26, -1, 2, 150
	playsewithpan SE_W010, 192
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, -32, 20, 1, 1, 140
	playsewithpan SE_W010, 192
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, 32, 22, 1, 0, 130
	playsewithpan SE_W010, 192
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, -16, 25, -1, 3, 120
	playsewithpan SE_W010, 192
	delay 40
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, 32, 26, -1, 3, 30
	delay 5
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, -48, 20, 1, 2, 30
	playsewithpan SE_W145C, 192
	delay 5
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, 48, 26, -2, 3, 18
	playsewithpan SE_W145C, 192
	delay 10
	waitforvisualfinish
	end

Move_PRESENT:: @ 81D1DC8
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_IsHealingMove, 2, 
	createsprite gPresentSpriteTemplate, ANIM_TARGET, 2, 0, -5, 10, 2, -1
	playsewithpan SE_W039, 192
	delay 14
	playsewithpan SE_W145B, 192
	delay 14
	playsewithpan SE_W145B, 0
	delay 20
	playsewithpan SE_W145B, 63
	waitforvisualfinish
	jumpargeq 7, 0, gUnknown_81D1E0B
	jumpargeq 7, 1, gUnknown_81D1E76
	end

gUnknown_81D1E0B:: @ 81D1E0B
	loadspritegfx ANIM_TAG_EXPLOSION
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 16, 16, 1, 1
	end

gUnknown_81D1E76:: @ 81D1E76
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	playsewithpan SE_W234, 63
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -16, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 16, 32, -3, -1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 32, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -32, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 0, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -8, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -8, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, 24, 32, -3, 1
	delay 3
	createsprite gPresentHealParticleSpriteTemplate, ANIM_TARGET, 4, -24, 32, -3, 1
	waitforvisualfinish
	waitsound
	call gUnknown_81D5712
	end

Move_BATON_PASS:: @ 81D1F1F
	loadspritegfx ANIM_TAG_POKEBALL
	playsewithpan SE_W226, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 31, 1, 2, 0, 11, 31455
	createsprite gBatonPassPokeballSpriteTemplate, ANIM_ATTACKER, 2, 
	end

Move_PERISH_SONG:: @ 81D1F41
	loadspritegfx ANIM_TAG_MUSIC_NOTES_2
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 0
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 1, 1, 16
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 2, 1, 32
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 3, 2, 48
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 4, 2, 64
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 5, 0, 80
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 6, 0, 96
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 7, 1, 112
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 8, 2, 128
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 9, 0, 144
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 10, 2, 160
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 11, 0, 176
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 12, 1, 192
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 13, 3, 208
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 14, 3, 224
	createsprite gPerishSongMusicNoteSpriteTemplate, ANIM_ATTACKER, 4, 15, 0, 240
	createsprite gPerishSongMusicNote2SpriteTemplate, ANIM_ATTACKER, 4, 15, 0, 0
	delay 20
	panse_1B SE_W195, 192, 63, 2, 0
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 16, 0
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 4, 0
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 5, 0
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 6, 0
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 7, 0
	delay 100
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 16, 0, 0
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 4, 1
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 5, 1
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 6, 1
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 7, 1
	waitforvisualfinish
	end

Move_SLEEP_TALK:: @ 81D20AA
	loadspritegfx ANIM_TAG_LETTER_Z
	createvisualtask AnimTask_SwayMon, 5, 0, 4, 4096, 2, 0
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	playsewithpan SE_W173, 192
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	playsewithpan SE_W173, 192
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	playsewithpan SE_W173, 192
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	waitforvisualfinish
	end

Move_HYPER_FANG:: @ 81D2165
	loadspritegfx ANIM_TAG_FANG_ATTACK
	playsewithpan SE_W044, 63
	delay 1
	delay 2
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, gUnknown_81D21C5
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, gUnknown_81D21B7
	goto gUnknown_81D21BE

gUnknown_81D2193:: @ 81D2193
	waitbgfadeout
	createsprite gFangSpriteTemplate, ANIM_TARGET, 2, 
	waitbgfadein
	createvisualtask AnimTask_ShakeMon, 3, 1, 0, 10, 10, 1
	playsewithpan SE_W043, 63
	delay 20
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

gUnknown_81D21B7:: @ 81D21B7
	fadetobg 4
	goto gUnknown_81D2193

gUnknown_81D21BE:: @ 81D21BE
	fadetobg 5
	goto gUnknown_81D2193

gUnknown_81D21C5:: @ 81D21C5
	fadetobg 6
	goto gUnknown_81D2193

Move_TRI_ATTACK:: @ 81D21CC
	loadspritegfx ANIM_TAG_TRI_FORCE_TRIANGLE
	createsprite gTriAttackTriangleSpriteTemplate, ANIM_TARGET, 2, 16, 0
	playsewithpan SE_W161, 192
	delay 20
	playsewithpan SE_W161, 192
	delay 20
	createsoundtask mas_80DCF38, 213, -64, 63, 5, 6, 0, 7
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 16, 0
	delay 16
	loadspritegfx ANIM_TAG_FIRE
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 0
	playsewithpan SE_W172B, 63
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gUnknown_83E5C88, ANIM_TARGET, 2, 0, 0, 30, 30, 3, 1
	delay 2
	createvisualtask sub_80ADAD8, 2, 20, 3, 1, 1
	waitforvisualfinish
	loadspritegfx ANIM_TAG_LIGHTNING
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	playsewithpan SE_W161B, 63
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 0, -48
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 0, -16
	delay 1
	createsprite gUnknown_83E5F38, ANIM_TARGET, 2, 0, 16
	delay 20
	createvisualtask sub_80ADAD8, 2, 20, 3, 1, 0
	delay 2
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	waitforvisualfinish
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	call gUnknown_81D540A
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 16, 0, 0
	waitforvisualfinish
	end

Move_WILL_O_WISP:: @ 81D2340
	loadspritegfx ANIM_TAG_WISP_FIRE
	loadspritegfx ANIM_TAG_WISP_ORB
	monbg 3
	monbgprio_2A 1
	playsewithpan SE_W052, 192
	waitplaysewithpan SE_W052, 192, 10
	createvisualtask sub_80DD444, 2, -64, -64, 1, 0
	createsprite gUnknown_83E5EB4, ANIM_ATTACKER, 2, 0, 0, 0
	delay 3
	createsprite gUnknown_83E5EB4, ANIM_ATTACKER, 3, 0, 0, 1
	delay 3
	createsprite gUnknown_83E5EB4, ANIM_ATTACKER, 4, 0, 0, 2
	delay 3
	createsprite gUnknown_83E5EB4, ANIM_ATTACKER, 4, 0, 0, 3
	delay 40
	createvisualtask sub_80DD444, 2, -64, 63, 2, 0
	waitforvisualfinish
	monbgprio_29
	playsewithpan SE_W172B, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 13, 1
	createsprite gUnknown_83E5EE4, ANIM_ATTACKER, 2, 0
	createsprite gUnknown_83E5EE4, ANIM_ATTACKER, 2, 42
	createsprite gUnknown_83E5EE4, ANIM_ATTACKER, 2, 84
	createsprite gUnknown_83E5EE4, ANIM_ATTACKER, 2, 126
	createsprite gUnknown_83E5EE4, ANIM_ATTACKER, 2, 168
	createsprite gUnknown_83E5EE4, ANIM_ATTACKER, 2, 210
	waitforvisualfinish
	clearmonbg 3
	end

Move_ENCORE:: @ 81D23FE
	loadspritegfx ANIM_TAG_SPOTLIGHT
	loadspritegfx ANIM_TAG_TAG_HAND
	createvisualtask AnimTask_CreateSpotlight, 2, 
	createvisualtask AnimTask_HardwarePaletteFade, 2, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN, 3, 0, 10, FALSE
	waitforvisualfinish
	createsprite gSpotlightSpriteTemplate, ANIM_TARGET, 2, 0, -8
	createsprite gClappingHandSpriteTemplate, ANIM_ATTACKER, 2, -2, 0, 0, 0, 9
	createsprite gClappingHandSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 1, 0, 9
	createsprite gClappingHand2SpriteTemplate, ANIM_ATTACKER, 3, -2, 0, 0, 0, 9
	createsprite gClappingHand2SpriteTemplate, ANIM_ATTACKER, 3, 2, 0, 1, 0, 9
	delay 16
	createvisualtask sub_80DD410, 5, 216, 63
	createvisualtask AnimTask_SwayMon, 5, 1, 8, 1536, 5, 1
	waitforvisualfinish
	createvisualtask AnimTask_HardwarePaletteFade, 2, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN, 3, 10, 0, TRUE
	waitforvisualfinish
	createvisualtask AnimTask_RemoveSpotlight, 2, 
	end

Move_TRICK:: @ 81D24A5
	loadspritegfx ANIM_TAG_ITEM_BAG
	loadspritegfx ANIM_TAG_SPEED_DUST
	createsprite gTrickBagSpriteTemplate, ANIM_ATTACKER, 2, -40, 80
	createsprite gTrickBagSpriteTemplate, ANIM_ATTACKER, 2, -40, 208
	delay 16
	playsewithpan SE_W166, 0
	createvisualtask sub_80A9A20, 3, 
	createvisualtask sub_80A9AB0, 3, 
	delay 30
	playsewithpan SE_W104, 0
	delay 24
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W213, 0
	createvisualtask AnimTask_ShakeMon, 3, 0, 5, 0, 7, 2
	createvisualtask AnimTask_ShakeMon, 3, 1, 5, 0, 7, 2
	waitforvisualfinish
	end

Move_WISH:: @ 81D2523
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 10, 0
	waitforvisualfinish
	panse_27 SE_W115, 63, 192, 253, 0
	createsprite gWishStarSpriteTemplate, ANIM_ATTACKER, 40, 
	waitforvisualfinish
	delay 60
	loopsewithpan SE_W215, 192, 16, 3
	call gUnknown_81D569E
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 10, 0, 0
	waitforvisualfinish
	end

Move_STOCKPILE:: @ 81D256B
	loadspritegfx ANIM_TAG_GRAY_ORB
	playsewithpan SE_W025, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 8, 1, 0, 12, RGB_WHITE
	createvisualtask AnimTask_StockpileDeformMon, 5, 
	call gUnknown_81D25A9
	call gUnknown_81D25A9
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 12, 0, RGB_WHITE
	end

gUnknown_81D25A9:: @ 81D25A9
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 55, 55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -55, -55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, -55, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 55, -34, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, 55, 34, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -55, -34, 13
	delay 1
	createsprite gStockpileAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 2, -55, 34, 13
	delay 1
	return

Move_SPIT_UP:: @ 81D2622
	loadspritegfx ANIM_TAG_RED_ORB_2
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_SpitUpDeformMon, 5, 
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 8, 2
	delay 45
	playsewithpan SE_W255, 192
	delay 3
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 32, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 64, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 96, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 128, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 160, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 192, 12
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 224, 12
	delay 5
	jumpifmoveturn 2, gUnknown_81D26EF
	jumpifmoveturn 3, gUnknown_81D2718

gUnknown_81D26B2:: @ 81D26B2
	delay 5
	createvisualtask sub_8099BD4, 2, 0, 1, 8, 1, 0
	playsewithpan SE_W003, 63
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, -12, 10, 1, 1
	delay 5
	playsewithpan SE_W003, 63
	createsprite gUnknown_83E7C98, ANIM_TARGET, 3, 12, -10, 1, 1
	waitforvisualfinish
	end

gUnknown_81D26EF:: @ 81D26EF
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 16
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 80
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 144
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 208
	goto gUnknown_81D26B2

gUnknown_81D2718:: @ 81D2718
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 16
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 48
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 80
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 112
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 144
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 176
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 208
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 240
	goto gUnknown_81D26B2

Move_SWALLOW:: @ 81D2765
	loadspritegfx ANIM_TAG_BLUE_ORB
	loadspritegfx ANIM_TAG_BLUE_STAR
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_SwallowDeformMon, 5, 
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 8, 2
	delay 38
	playsewithpan SE_W255, 192
	createvisualtask AnimTask_ShakeMon2, 2, 0, 2, 0, 12, 1
	call gUnknown_81D27B6
	jumpifmoveturn 2, gUnknown_81D27F8
	jumpifmoveturn 3, gUnknown_81D2802

gUnknown_81D27AF:: @ 81D27AF
	waitforvisualfinish
	call gUnknown_81D56C9
	end

gUnknown_81D27B6:: @ 81D27B6
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, -24, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, 16, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, -16, -8
	delay 1
	createsprite gSwallowBlueOrbSpriteTemplate, ANIM_ATTACKER, 2, 24, -8
	delay 1
	return

gUnknown_81D27F8:: @ 81D27F8
	call gUnknown_81D27B6
	goto gUnknown_81D27AF

gUnknown_81D2802:: @ 81D2802
	call gUnknown_81D27B6
	call gUnknown_81D27B6
	goto gUnknown_81D27AF

Move_TRANSFORM:: @ 81D2811
	monbg 0
	playsewithpan SE_W100, 192
	waitplaysewithpan SE_W107, 192, 48
	createvisualtask AnimTask_TransformMon, 2, 0
	waitforvisualfinish
	clearmonbg 0
	end

Move_MORNING_SUN:: @ 81D2829
	loadspritegfx ANIM_TAG_GREEN_STAR
	loadspritegfx ANIM_TAG_BLUE_STAR
	createvisualtask AnimTask_MorningSunLightBeam, 5, 
	delay 8
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 8, 0, 12, RGB_WHITE
	delay 14
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	call gUnknown_81D28AF
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 3, 12, 0, RGB_WHITE
	waitforvisualfinish
	waitsound
	call gUnknown_81D56C9
	end

gUnknown_81D28AF:: @ 81D28AF
	createsprite gGreenStarSpriteTemplate, ANIM_ATTACKER, 2, 30, 640
	delay 5
	return

Move_SWEET_SCENT:: @ 81D28BD
	loadspritegfx ANIM_TAG_PINK_PETAL
	playsewithpan SE_W230, 192
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 100, 0, 100
	delay 25
	setpan 0
	call gUnknown_81D2901
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 55, 0
	setpan 63
	createvisualtask AnimTask_CurseBlendEffect, 2, 20, 1, 5, 5, 13, 22207
	call gUnknown_81D2901
	waitforvisualfinish
	end

gUnknown_81D2901:: @ 81D2901
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 70, 1, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 60, 0, 64
	delay 5
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 80, 1, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 58, 0, 120
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 100, 0, 120
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 90, 0, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 48, 0, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 95, 1, 80
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 100, 0, 120
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 75, 1, 64
	delay 2
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 85, 0, 120
	delay 2
	return

Move_HYPER_BEAM:: @ 81D29A7
	loadspritegfx ANIM_TAG_ORBS
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 0, 16, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_W063, 192
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 4, 1
	waitforvisualfinish
	delay 30
	createsoundtask mas_80DCF38, 240, -64, 63, 1, 15, 0, 5
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 4, 50, 1
	createvisualtask sub_80B9F6C, 2, 10147, 1, 12, 31, 16, 0, 0
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 50, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 11, RGB(25, 25, 25)
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	call gUnknown_81D2AD8
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 11, 0, RGB(25, 25, 25)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 16, 0, 0
	end

gUnknown_81D2AD8:: @ 81D2AD8
	createsprite gHyperBeamOrbSpriteTemplate, ANIM_TARGET, 2, 
	createsprite gHyperBeamOrbSpriteTemplate, ANIM_TARGET, 2, 
	delay 1
	return

Move_FLATTER:: @ 81D2AE9
	loadspritegfx ANIM_TAG_SPOTLIGHT
	loadspritegfx ANIM_TAG_CONFETTI
	createvisualtask sub_80DD410, 5, 216, 63
	createvisualtask AnimTask_CreateSpotlight, 2, 
	createvisualtask AnimTask_HardwarePaletteFade, 2, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN, 3, 0, 10, FALSE
	waitforvisualfinish
	createsprite gFlatterSpotlightSpriteTemplate, ANIM_TARGET, 2, 0, -8, 80
	delay 0
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, 1
	delay 10
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, 1
	delay 0
	createvisualtask sub_80DD3DC, 5, 222, -64
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	call gUnknown_81D2BD2
	delay 5
	createvisualtask sub_80DD3DC, 5, 222, 63
	waitforvisualfinish
	createvisualtask AnimTask_HardwarePaletteFade, 2, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN, 3, 10, 0, TRUE
	waitforvisualfinish
	createvisualtask AnimTask_RemoveSpotlight, 2, 
	end

gUnknown_81D2BD2:: @ 81D2BD2
	createsprite gFlatterConfettiSpriteTemplate, ANIM_ATTACKER, 40, 0
	createsprite gFlatterConfettiSpriteTemplate, ANIM_ATTACKER, 40, 1
	return

Move_ROLE_PLAY:: @ 81D2BE5
	monbg 2
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 16, RGB_WHITE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 10, 0
	waitforvisualfinish
	playsewithpan SE_W161, 192
	waitplaysewithpan SE_W197, 192, 30
	createvisualtask AnimTask_RolePlaySilhouette, 2, 
	waitforvisualfinish
	clearmonbg 2
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 16, 0, RGB_WHITE
	delay 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 10, 0, 0
	end

Move_REFRESH:: @ 81D2C42
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	playsewithpan SE_W287, 192
	createvisualtask sub_80E2084, 2, 0
	waitforvisualfinish
	playsewithpan SE_W234, 192
	call gUnknown_81D569E
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 10, 0, 31500
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0
	end

Move_BLAZE_KICK:: @ 81D2C85
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W172, 63
	createsprite gUnknown_83E678C, ANIM_TARGET, 3, 0, 0, 1, 30
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 7, RGB_WHITE
	delay 30
	playsewithpan SE_W007, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 14, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 8, 0, 0
	call gUnknown_81D0950
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_HYPER_VOICE:: @ 81D2D0D
	loadspritegfx ANIM_TAG_THIN_RING
	call gUnknown_81D2D1F
	waitforvisualfinish
	delay 8
	call gUnknown_81D2D1F
	waitforvisualfinish
	end

gUnknown_81D2D1F:: @ 81D2D1F
	createvisualtask sub_80DD334, 5, 
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 8, 0, 1023
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 5, 0, 0
	createsprite gHyperVoiceRingSpriteTemplate, ANIM_ATTACKER, 0, 45, 0, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 6, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 1, 0, 6, 1
	createvisualtask sub_80BA47C, 2, 1, 0, 6, 1
	createvisualtask sub_80DD2F4, 5, 
	return

Move_SAND_TOMB:: @ 81D2D96
	loadspritegfx ANIM_TAG_MUD_SAND
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 563
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 43, 1
	playsewithpan SE_W328, 63
	call gUnknown_81D2DE3
	call gUnknown_81D2DE3
	call gUnknown_81D2DE3
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 563
	waitforvisualfinish
	end

gUnknown_81D2DE3:: @ 81D2DE3
	createsprite gUnknown_83E73E4, ANIM_TARGET, 2, 0, 32, 528, 30, 10, 50, 1
	delay 2
	createsprite gUnknown_83E73E4, ANIM_TARGET, 2, 0, 36, 480, 20, 13, -46, 1
	delay 2
	createsprite gUnknown_83E73E4, ANIM_TARGET, 2, 0, 37, 576, 20, 5, 42, 1
	delay 2
	createsprite gUnknown_83E73E4, ANIM_TARGET, 2, 0, 35, 400, 25, 8, -42, 1
	delay 2
	createsprite gUnknown_83E73E4, ANIM_TARGET, 2, 0, 32, 512, 25, 13, 46, 1
	delay 2
	createsprite gUnknown_83E73E4, ANIM_TARGET, 2, 0, 37, 464, 30, 12, -50, 1
	delay 2
	return

Move_SHEER_COLD:: @ 81D2E6E
	fadetobg 15
	waitbgfadeout
	playsewithpan SE_W196, 0
	waitbgfadein
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask sub_80783FC, 2, 
	waitplaysewithpan SE_W258, 63, 17
	waitforvisualfinish
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadein
	end

Move_ARM_THRUST:: @ 81D2E93
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask sub_8099980, 5, 8, 5, 0, 0
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 3
	delay 4
	playsewithpan SE_W207, 63
	createsprite gUnknown_83E68AC, ANIM_TARGET, 2, 10, -8, 14, 3
	waitforvisualfinish
	createvisualtask sub_8099980, 5, 8, 5, 0, 1
	playsewithpan SE_W003, 63
	choosetwoturnanim gUnknown_81D2F00, gUnknown_81D2F14

gUnknown_81D2EEC:: @ 81D2EEC
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	blendoff
	end

gUnknown_81D2F00:: @ 81D2F00
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 8, 0, 1, 2
	goto gUnknown_81D2EEC

gUnknown_81D2F14:: @ 81D2F14
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -8, 0, 1, 2
	goto gUnknown_81D2EEC

Move_MUDDY_WATER:: @ 81D2F28
	panse_1B SE_W250, 192, 63, 2, 0
	createvisualtask sub_80AB38C, 2, 1
	waitforvisualfinish
	end

Move_BULLET_SEED:: @ 81D2F3A
	loadspritegfx ANIM_TAG_SEED
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 30, 1
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	delay 5
	createsprite gBulletSeedSpriteTemplate, ANIM_TARGET, 2, 20, 0
	waitforvisualfinish
	end

Move_DRAGON_CLAW:: @ 81D2FD0
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_CLAW_SLASH
	playsewithpan SE_W221B, 192
	createvisualtask AnimTask_BlendSelected, 10, 2, 4, 0, 8, RGB(31, 19, 0)
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 15, 1
	call gUnknown_81D31AD
	call gUnknown_81D31AD
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createvisualtask sub_80DD3DC, 5, 129, 63
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, -10, -10, 0
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, -10, 10, 0
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createvisualtask sub_80DD3DC, 5, 129, 63
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, 10, -10, 1
	createsprite gUnknown_83E79E8, ANIM_TARGET, 2, 10, 10, 1
	createsprite gUnknown_83E7B88, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, 0
	createvisualtask AnimTask_BlendSelected, 10, 2, 4, 8, 0, RGB(31, 19, 0)
	waitforvisualfinish
	end

gUnknown_81D31AD:: @ 81D31AD
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createsprite gUnknown_83E7438, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, 0
	delay 2
	return
	end

Move_MUD_SHOT:: @ 81D3239
	loadspritegfx ANIM_TAG_BROWN_ORB
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 46, 1
	delay 6
	createvisualtask sub_80AB100, 5, 100
	panse_1B SE_W250, 192, 63, 1, 0
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 43, 1
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	call gUnknown_81D32B3
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81D32B3:: @ 81D32B3
	createsprite gUnknown_83E5974, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	createsprite gUnknown_83E5974, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	return

Move_METEOR_MASH:: @ 81D32D6
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	panse_1B SE_W112, 192, 63, 3, 0
	fadetobg 16
	waitbgfadein
	waitforvisualfinish
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -48, -64, 72, 32, 30
	delay 10
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -112, -64, 8, 32, 30
	delay 40
	createsprite gUnknown_83E678C, ANIM_TARGET, 3, 0, 0, 0, 30
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -80, -64, 40, 32, 30
	delay 20
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 5, 0, 20, 1
	waitforvisualfinish
	delay 10
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

Move_REVENGE:: @ 81D335D
	loadspritegfx ANIM_TAG_PURPLE_SCRATCH
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createsprite gUnknown_83E6900, ANIM_ATTACKER, 2, 10, -10
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 4, 2, 8, 31
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_PURPLE_SCRATCH
	loadspritegfx ANIM_TAG_PURPLE_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 4
	playsewithpan SE_W207, 63
	createsprite gUnknown_83E6948, ANIM_TARGET, 2, 10, -10
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_PURPLE_SWIPE
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 10, 1
	createsprite gUnknown_83E7CB0, ANIM_TARGET, 3, -10, -8, 1, 1, 8
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gUnknown_83E7CB0, ANIM_TARGET, 3, 10, 8, 1, 1, 8
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_POISON_FANG:: @ 81D33F4
	loadspritegfx ANIM_TAG_FANG_ATTACK
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	playsewithpan SE_W044, 63
	createsprite gFangSpriteTemplate, ANIM_TARGET, 2, 
	delay 10
	createvisualtask AnimTask_ShakeMon, 3, 1, 3, 0, 10, 1
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 0, 4, 0, 12, 26650
	call gUnknown_81D575B
	waitforvisualfinish
	end

Move_SUBSTITUTE:: @ 81D3433
	playsewithpan SE_W213, 192
	createvisualtask AnimTask_MonToSubstitute, 2, 
	end

Move_FRENZY_PLANT:: @ 81D343F
	loadspritegfx ANIM_TAG_ROOTS
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 2, 0, 5, 0
	waitforvisualfinish
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 10, 8, 2, 0, 0, 100
	playsewithpan SE_W010, 192
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -2, 0, 1, 95
	playsewithpan SE_W010, 213
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 30, 8, -4, 0, 0, 90
	playsewithpan SE_W010, 234
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 40, -8, 4, 0, 1, 85
	playsewithpan SE_W010, 0
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 50, 8, 0, 0, 0, 85
	playsewithpan SE_W010, 21
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 60, -8, -2, 0, 1, 85
	playsewithpan SE_W010, 42
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 75, 8, 0, 0, 0, 85
	playsewithpan SE_W010, 63
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 85, 16, 6, 0, 3, 80
	playsewithpan SE_W010, 63
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 85, -16, -6, 0, 2, 75
	playsewithpan SE_W010, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -10, 1, 3
	playsewithpan SE_W003, 63
	createvisualtask AnimTask_ShakeMon, 3, 1, 8, 0, 20, 1
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 8, 1, 3
	playsewithpan SE_W003, 63
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, -3, 1, 2
	playsewithpan SE_W003, 63
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -3, 1, 1, 2
	playsewithpan SE_W003, 63
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, 1, 1, 1
	playsewithpan SE_W003, 63
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 10, 1, 1
	playsewithpan SE_W003, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 2, 5, 0, 0
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_METAL_SOUND:: @ 81D35E3
	loadspritegfx ANIM_TAG_METAL_SOUND_WAVES
	monbg 3
	monbgprio_2A 1
	createvisualtask AnimTask_ShakeMon2, 2, 0, 2, 0, 8, 1
	call gUnknown_81D3616
	call gUnknown_81D3616
	call gUnknown_81D3616
	call gUnknown_81D3616
	waitforvisualfinish
	clearmonbg 3
	delay 0
	waitforvisualfinish
	end

gUnknown_81D3616:: @ 81D3616
	panse_1B SE_W103, 192, 63, 2, 0
	createsprite gMetalSoundSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_FOCUS_PUNCH:: @ 81D3633
	goto gUnknown_81D363A

gUnknown_81D3638:: @ 81D3638
	waitforvisualfinish
	end

gUnknown_81D363A:: @ 81D363A
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	delay 1
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, gUnknown_81D36F3
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, gUnknown_81D36E5
	jumpargeq 7, 1, gUnknown_81D36EC

gUnknown_81D3668:: @ 81D3668
	waitbgfadein
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W207, 63
	createsprite gUnknown_83E697C, ANIM_TARGET, 2, 
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 8, 0, 24, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 2, 1, 0
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, -6, 1, 0
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 8, 1, 0
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg 3
	blendoff
	goto gUnknown_81D3638

gUnknown_81D36E5:: @ 81D36E5
	fadetobg 4
	goto gUnknown_81D3668

gUnknown_81D36EC:: @ 81D36EC
	fadetobg 5
	goto gUnknown_81D3668

gUnknown_81D36F3:: @ 81D36F3
	fadetobg 6
	goto gUnknown_81D3668

Move_RETURN:: @ 81D36FA
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	createvisualtask AnimTask_GetReturnPowerLevel, 2, 
	delay 2
	jumpargeq 7, 0, gUnknown_81D3730
	jumpargeq 7, 1, gUnknown_81D3782
	jumpargeq 7, 2, gUnknown_81D37E2
	jumpargeq 7, 3, gUnknown_81D38FD

gUnknown_81D372B:: @ 81D372B
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81D3730:: @ 81D3730
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask sub_80DD3DC, 5, 132, 63
	goto gUnknown_81D372B

gUnknown_81D3782:: @ 81D3782
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	waitforvisualfinish
	delay 11
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask sub_80DD3DC, 5, 134, 63
	goto gUnknown_81D372B

gUnknown_81D37E2:: @ 81D37E2
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -5, 3, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	goto gUnknown_81D372B

gUnknown_81D38FD:: @ 81D38FD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 0, 6, 0
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 12, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 4
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 2
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 0
	createvisualtask sub_80DD410, 5, 160, -64
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 2, 0
	createvisualtask sub_80DD410, 5, 160, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	waitforvisualfinish
	call gUnknown_81D3B35
	call gUnknown_81D3B35
	call gUnknown_81D3B35
	call gUnknown_81D3B35
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 0
	createvisualtask sub_80DD3DC, 5, 134, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 8, 0, 24, 1
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 1, 0
	createvisualtask sub_80DD3DC, 5, 134, 63
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, 1, 0
	createvisualtask sub_80DD3DC, 5, 134, 63
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -5, 3, 1, 0
	createvisualtask sub_80DD3DC, 5, 134, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6, 0, 0
	goto gUnknown_81D372B

gUnknown_81D3B35:: @ 81D3B35
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 3, 0
	createvisualtask sub_80DD410, 5, 160, -64
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask sub_80DD3DC, 5, 116, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	waitforvisualfinish
	return

Move_COSMIC_POWER:: @ 81D3B89
	loadspritegfx ANIM_TAG_SPARKLE_2
	createvisualtask sub_80DD410, 5, 236, 0
	playsewithpan SE_W322, 0
	createvisualtask sub_80BB7DC, 2, 0, 0, 15, 0
	waitforvisualfinish
	fadetobg 16
	waitbgfadeout
	createvisualtask sub_80BB82C, 2, 0, 128, 0, -1
	waitbgfadein
	delay 70
	createvisualtask sub_80DD3DC, 5, 221, -64
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, 12, -5, 0, 0, 32, 60
	delay 40
	createvisualtask sub_80BB7DC, 2, 0, 15, 0, 0
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	waitforvisualfinish
	end

Move_BLAST_BURN:: @ 81D3C0E
	loadspritegfx ANIM_TAG_FIRE_PLUME
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W221, 192
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -32, 0, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -20, -10, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 0, -16, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 20, -10, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 32, 0, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 20, 10, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, 0, 16, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -20, 10, 24, 0, 0, 0
	delay 25
	playsewithpan SE_W172B, 192
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -64, 0, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 6, -40, -20, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 70, 0, -32, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 70, 40, -20, 24, 0, 0, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 64, 0, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 40, 20, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, 0, 32, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -40, 20, 24, 0, 0, 0
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 25
	playsewithpan SE_W172B, 192
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -96, 0, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 6, -60, -30, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 70, 0, -48, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 70, 60, -30, 24, 0, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, 3, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 12, 0, 20, 1
	createvisualtask sub_80BA47C, 2, 2, 0, 10, 1
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 96, 0, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 66, 60, 30, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, 0, 48, 24, 0, 0, 0
	createsprite gUnknown_83E5CA0, ANIM_ATTACKER, 2, -60, 30, 24, 0, 0, 0
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_ROCK_TOMB:: @ 81D3E50
	loadspritegfx ANIM_TAG_X_SIGN
	loadspritegfx ANIM_TAG_ROCKS
	createvisualtask sub_80BA47C, 2, 2, 0, 10, 1
	waitforvisualfinish
	createsprite gUnknown_83E7508, ANIM_TARGET, 2, 20, 12, 64, 114, 0
	delay 8
	createvisualtask sub_80BA47C, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 8
	createsprite gUnknown_83E7508, ANIM_TARGET, 2, -20, 12, 64, 98, 0
	delay 8
	createvisualtask sub_80BA47C, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 8
	createsprite gUnknown_83E7508, ANIM_TARGET, 66, 3, 6, 64, 82, 0
	delay 8
	createvisualtask sub_80BA47C, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 8
	createsprite gUnknown_83E7508, ANIM_TARGET, 2, -3, 13, 64, 66, 0
	delay 8
	createvisualtask sub_80BA47C, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 24
	playsewithpan SE_W063, 63
	createsprite gUnknown_83E705C, ANIM_TARGET, 5, 1, 50
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 20, 1
	createvisualtask sub_80BA47C, 2, 2, 0, 10, 1
	waitforvisualfinish
	end

Move_SILVER_WIND:: @ 81D3F37
	loadspritegfx ANIM_TAG_SPARKLE_6
	panse_1B SE_W016, 192, 63, 2, 0
	playsewithpan SE_W234, 0
	delay 0
	monbg 3
	monbgprio_29
	delay 0
	createvisualtask AnimTask_BlendExcept, 10, 1, 0, 0, 4, 0
	createvisualtask AnimTask_GetTargetSide, 2, 
	jumpargeq 7, 1, gUnknown_81D4138
	fadetobg 22
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, 1536, 0, 0, -1

gUnknown_81D3F7E:: @ 81D3F7E
	delay 0
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 4, 4, RGB_BLACK
	waitbgfadein
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -32, 16, 0, 6, 2, 3, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -8, 18, 64, 3, 2, 2, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_ATTACKER, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_ATTACKER, 120, -40, 14, 128, 4, 1, 2, 1
	delay 0
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -32, 16, 0, 6, 2, 3, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -8, 18, 64, 3, 2, 2, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_ATTACKER, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_ATTACKER, 120, -40, 14, 128, 4, 1, 2, 1
	delay 0
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -32, 16, 0, 6, 2, 3, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -8, 18, 64, 3, 2, 2, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_ATTACKER, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_ATTACKER, 120, -40, 14, 128, 4, 1, 2, 1
	delay 6
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -4, 16, 0, 6, 1, 2, 1
	createsprite gSilverWindBigSparkSpriteTemplate, ANIM_TARGET, 66, -16, 12, 192, 5, 2, 3, 1
	delay 0
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -4, 16, 0, 6, 1, 2, 1
	createsprite gSilverWindMediumSparkSpriteTemplate, ANIM_TARGET, 66, -16, 12, 192, 5, 2, 3, 1
	delay 0
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -4, 16, 0, 6, 1, 2, 1
	createsprite gSilverWindSmallSparkSpriteTemplate, ANIM_TARGET, 66, -16, 12, 192, 5, 2, 3, 1
	waitforvisualfinish
	playsewithpan SE_W016B, 63
	clearmonbg 3
	delay 0
	restorebg
	waitbgfadeout
	createvisualtask AnimTask_BlendExcept, 10, 1, 0, 4, 0, 0
	setarg 7, 65535
	waitbgfadein
	end

gUnknown_81D4138:: @ 81D4138
	fadetobg 23
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -1536, 0, 0, -1
	goto gUnknown_81D3F7E

Move_SNATCH:: @ 81D414F
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_WindUpLunge, 5, 0, -12, 4, 10, 10, 12, 6
	end

Move_DIVE:: @ 81D4169
	loadspritegfx ANIM_TAG_SPLASH
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	choosetwoturnanim gUnknown_81D4178, gUnknown_81D41CD

gUnknown_81D4178:: @ 81D4178
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	playsewithpan SE_W029, 192
	createsprite gUnknown_83E6D40, ANIM_ATTACKER, 2, 0, 0, 13, 336
	waitforvisualfinish
	playsewithpan SE_W291, 192
	createsprite gUnknown_83E6D7C, ANIM_ATTACKER, 3, 0
	call gUnknown_81D41B6
	call gUnknown_81D41B6
	call gUnknown_81D41B6
	call gUnknown_81D41B6
	call gUnknown_81D41B6
	end

gUnknown_81D41B6:: @ 81D41B6
	createsprite gUnknown_83E6D94, ANIM_ATTACKER, 5, 0, 0
	createsprite gUnknown_83E6D94, ANIM_ATTACKER, 5, 1, 0
	return

gUnknown_81D41CD:: @ 81D41CD
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W153, 63
	createsprite gUnknown_83E6D7C, ANIM_TARGET, 3, 1
	call gUnknown_81D420C
	call gUnknown_81D420C
	call gUnknown_81D420C
	call gUnknown_81D420C
	call gUnknown_81D420C
	delay 12
	call gUnknown_81C8CA2
	waitforvisualfinish
	visible 0
	clearmonbg 3
	blendoff
	end

gUnknown_81D420C:: @ 81D420C
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 0, 1
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 1, 1
	return

Move_ROCK_BLAST:: @ 81D4223
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 3
	playsewithpan SE_W207, 192
	createsprite gUnknown_83E7548, ANIM_TARGET, 2, 16, 0, 0, 0, 25, 257
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_W088, 63
	createsprite gUnknown_83E73CC, ANIM_TARGET, 2, 0, 0, 20, 24, 14, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 5, 1
	createsprite gUnknown_83E73CC, ANIM_TARGET, 2, 5, 0, -20, 24, 14, 1
	createsprite gUnknown_83E73CC, ANIM_TARGET, 2, 0, 5, 20, -24, 14, 2
	createsprite gUnknown_83E73CC, ANIM_TARGET, 2, -5, 0, -20, -24, 14, 2
	waitforvisualfinish
	end

Move_OVERHEAT:: @ 81D42C0
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 18
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 5, 28
	waitforvisualfinish
	createvisualtask sub_80BBE10, 5, 
	waitforvisualfinish
	createvisualtask sub_80BBE6C, 5, 0, 1
	delay 1
	createvisualtask sub_80BBFA4, 5, 0
	delay 1
	playsewithpan SE_W082, 192
	createvisualtask sub_80BBE6C, 5, 1, 0
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 1, 0, 13, 28
	createvisualtask AnimTask_ShakeMon, 5, 0, 2, 0, 15, 1
	waitforvisualfinish
	playsewithpan SE_W172B, 192
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 0, 30, 25, -20
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 32, 30, 25, -20
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 64, 30, 25, -20
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 96, 30, 25, -20
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 128, 30, 25, -20
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 160, 30, 25, -20
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 192, 30, 25, -20
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 224, 30, 25, -20
	delay 5
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 0, 30, 25, 0
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 32, 30, 25, 0
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 64, 30, 25, 0
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 96, 30, 25, 0
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 128, 30, 25, 0
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 160, 30, 25, 0
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 192, 30, 25, 0
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 224, 30, 25, 0
	delay 5
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 0, 30, 25, 10
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 32, 30, 25, 10
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 64, 30, 25, 10
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 96, 30, 25, 10
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 2, 1, 128, 30, 25, 10
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 160, 30, 25, 10
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 192, 30, 25, 10
	createsprite gUnknown_83E7860, ANIM_ATTACKER, 66, 1, 224, 30, 25, 10
	delay 5
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -5, 3, 1, 0
	playsewithpan SE_W007, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 10, 0, 25, 1
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 8, -5, 1, 0
	playsewithpan SE_W007, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 10, 10, 1, 0
	playsewithpan SE_W007, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 0
	playsewithpan SE_W007, 63
	createvisualtask sub_80BBFA4, 5, 1
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 0, 13, 19026
	createvisualtask AnimTask_ShakeMon, 5, 0, 3, 0, 15, 1
	waitforvisualfinish
	createvisualtask sub_80BBF08, 5, 0, 1
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 5, 0, 28
	waitforvisualfinish
	clearmonbg 3
	blendoff
	waitforvisualfinish
	delay 15
	createvisualtask sub_80BBF08, 5, 1, 0
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 13, 0, 19026
	waitforvisualfinish
	createvisualtask sub_80BBE3C, 5, 
	waitforvisualfinish
	end

Move_HYDRO_CANNON:: @ 81D45B2
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg 3
	setalpha 12, 8
	playsewithpan SE_W057, 192
	createsprite gUnknown_83E5A38, ANIM_TARGET, 2, 
	delay 10
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	delay 30
	panse_1B SE_W056, 192, 63, 2, 0
	call gUnknown_81D467C
	createvisualtask AnimTask_ShakeMon, 5, 1, 10, 0, 40, 1
	createsprite gUnknown_83E7C38, ANIM_TARGET, 2, 0, 0, 1, 0
	call gUnknown_81D467C
	createsprite gUnknown_83E7C38, ANIM_TARGET, 2, 0, 0, 1, 0
	call gUnknown_81D467C
	createsprite gUnknown_83E7C38, ANIM_TARGET, 2, 0, 0, 1, 0
	call gUnknown_81D467C
	createsprite gUnknown_83E7C38, ANIM_TARGET, 2, 0, 0, 1, 0
	call gUnknown_81D467C
	createsprite gUnknown_83E7C38, ANIM_TARGET, 2, 0, 0, 1, 0
	call gUnknown_81D467C
	createsprite gUnknown_83E7C38, ANIM_TARGET, 2, 0, 0, 1, 0
	waitforvisualfinish
	createvisualtask sub_80BA0E8, 2, 257, 257, 257
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

gUnknown_81D467C:: @ 81D467C
	createsprite gUnknown_83E5A50, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gUnknown_83E5A50, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gUnknown_83E5A50, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gUnknown_83E5A50, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gUnknown_83E5A50, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	return

Move_ASTONISH:: @ 81D46E4
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	playsewithpan SE_W227, 192
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 25
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 0, 1
	playsewithpan SE_W166, 63
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask sub_80A9A20, 3, 
	waitforvisualfinish
	end

Move_SEISMIC_TOSS:: @ 81D472C
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	setarg 7, 0
	monbg 3
	setalpha 12, 8
	waitforvisualfinish
	createvisualtask AnimTask_GetSeismicTossDamageLevel, 3, 
	delay 1
	fadetobg 17
	waitbgfadeout
	createvisualtask sub_80B5188, 3, 
	playsewithpan SE_W327, 0
	waitbgfadein
	waitforvisualfinish
	createvisualtask sub_80B51EC, 3, 
	jumpargeq 7, 0, gUnknown_81D477F
	jumpargeq 7, 1, gUnknown_81D4790
	jumpargeq 7, 2, gUnknown_81D47A8

gUnknown_81D4774:: @ 81D4774
	restorebg
	waitbgfadeout
	setarg 7, 4095
	waitbgfadein
	clearmonbg 3
	blendoff
	end

gUnknown_81D477F:: @ 81D477F
	call gUnknown_81D47C7
	delay 16
	call gUnknown_81D4828
	goto gUnknown_81D4774

gUnknown_81D4790:: @ 81D4790
	call gUnknown_81D47C7
	delay 14
	call gUnknown_81D4828
	delay 14
	call gUnknown_81D47C7
	goto gUnknown_81D4774

gUnknown_81D47A8:: @ 81D47A8
	call gUnknown_81D4828
	delay 10
	call gUnknown_81D47C7
	delay 10
	call gUnknown_81D4828
	delay 10
	call gUnknown_81D47C7
	goto gUnknown_81D4774

gUnknown_81D47C7:: @ 81D47C7
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -10, -8, 1, 1
	playsewithpan SE_W070, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 5, 1
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, -12, 27, 2, 3
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, 8, 28, 3, 4
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, -4, 30, 2, 3
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, 12, 25, 4, 4
	return

gUnknown_81D4828:: @ 81D4828
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 10, -8, 1, 1
	playsewithpan SE_W088, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 5, 1
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, -12, 32, 3, 4
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, 8, 31, 2, 2
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, -4, 28, 2, 3
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, 12, 30, 4, 3
	return

Move_MAGIC_COAT:: @ 81D4889
	loadspritegfx ANIM_TAG_ORANGE_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_W112, 192, 15
	createsprite gUnknown_83E6E70, ANIM_ATTACKER, 3, 40, 0, 10170
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_WATER_PULSE:: @ 81D48A6
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	monbg 1
	monbgprio_28 1
	playsewithpan SE_W145C, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 0, 7, 29472
	delay 10
	createsprite gUnknown_83E5B70, ANIM_ATTACKER, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gUnknown_83E5B70, ANIM_ATTACKER, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gUnknown_83E5B70, ANIM_ATTACKER, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gUnknown_83E5B70, ANIM_ATTACKER, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gUnknown_83E5B70, ANIM_ATTACKER, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_W145C, 63
	waitforvisualfinish
	playsewithpan SE_W202, 192
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_W202, 192
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_W202, 192
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 13
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 8, 18, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 7, 0, 29472
	waitforvisualfinish
	clearmonbg 3
	end

Move_PSYCHO_BOOST:: @ 81D499B
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg 2
	fadetobg 3
	waitbgfadeout
	createvisualtask AnimTask_FadeScreenToWhite, 5, 
	waitbgfadein
	delay 6
	createvisualtask AnimTask_CurseBlendEffect, 2, 1, 2, 8, 0, 10, 0
	delay 0
	monbgprio_28 0
	setalpha 8, 8
	delay 10
	createvisualtask AnimTask_ShakeMon, 2, 0, 3, 0, 240, 0
	loopsewithpan SE_W060B, 192, 14, 10
	createsprite gUnknown_83E71D0, ANIM_ATTACKER, 2, 
	delay 110
	loopsewithpan SE_W060B, 192, 7, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, -8, 1, 24, 1
	playsewithpan SE_W043, 63
	waitforvisualfinish
	clearmonbg 2
	blendoff
	call gUnknown_81D59C7
	end

Move_KNOCK_OFF:: @ 81D4A0F
	loadspritegfx ANIM_TAG_SLAM_HIT_2
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 4
	playsewithpan SE_W233, 63
	createsprite gKnockOffStrikeSpriteTemplate, ANIM_TARGET, 2, -16, -16
	delay 8
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 5, 1, RGB_WHITE, 10, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 2
	playsewithpan SE_W004, 63
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -12, 10, 0, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 0, 3, 6, 1
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	delay 10
	waitforvisualfinish
	end

Move_DOOM_DESIRE:: @ 81D4A9F
	createvisualtask sub_80B8B38, 2, 
	delay 1
	monbg 2
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 1, 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 4, 0
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_W060, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, 0, 1
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 1, 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 4, 0, 0
	waitforvisualfinish
	clearmonbg 2
	blendoff
	end
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5, 
	delay 5
	playsewithpan SE_W109, 192
	delay 10
	playsewithpan SE_W109, 0
	delay 10
	playsewithpan SE_W109, 63
	delay 23
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 20, 1
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end

Move_SKY_UPPERCUT:: @ 81D4BC1
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	monbgprio_28 1
	fadetobg 17
	waitbgfadeout
	playsewithpan SE_W327, 192
	createvisualtask sub_80B1530, 5, 55
	waitbgfadein
	setalpha 12, 8
	delay 38
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 0, 0, 5
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 6, 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -28, 28, 1, 1
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -15, 8, 1, 1
	playsewithpan SE_W233B, 63
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -5, -12, 1, 1
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -32, 1, 1
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 5, -52, 1, 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -26, 16, 1, 4
	delay 4
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 0, 3, 6, 1
	delay 30
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	delay 4
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

Move_SECRET_POWER:: @ 81D4CBA
	createvisualtask AnimTask_GetBattleTerrain, 5, 
	jumpargeq 0, 0, Move_NEEDLE_ARM
	jumpargeq 0, 1, Move_MAGICAL_LEAF
	jumpargeq 0, 2, Move_MUD_SHOT
	jumpargeq 0, 3, Move_WATERFALL
	jumpargeq 0, 4, Move_SURF
	jumpargeq 0, 5, Move_BUBBLE_BEAM
	jumpargeq 0, 6, Move_ROCK_THROW
	jumpargeq 0, 7, Move_BITE
	jumpargeq 0, 8, Move_STRENGTH
	goto Move_SLAM

Move_TWISTER:: @ 81D4D0E
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	monbg 3
	monbgprio_28 1
	playsewithpan SE_W239, 63
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 120, 70, 5, 70, 30
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 55, 6, 60, 25
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 60, 7, 60, 30
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 55, 10, 60, 30
	delay 3
	createsprite gUnknown_83E7578, ANIM_TARGET, 2, 100, 50, 4, 50, 26
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 105, 25, 8, 60, 20
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 40, 10, 48, 30
	delay 3
	createsprite gUnknown_83E7578, ANIM_TARGET, 2, 120, 30, 6, 45, 25
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 35, 10, 60, 30
	delay 3
	createsprite gUnknown_83E7578, ANIM_TARGET, 2, 105, 20, 8, 40, 0
	delay 3
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 20, 255, 15, 32, 0
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 110, 10, 8, 32, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -32, -16, 1, 3
	playsewithpan SE_W004, 63
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 3, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 3, 3, 0, 12, 1
	delay 4
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 3
	playsewithpan SE_W004, 63
	delay 4
	createsprite gUnknown_83E7C50, ANIM_TARGET, 3, 1, 3
	playsewithpan SE_W004, 63
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 32, 20, 1, 3
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_MAGICAL_LEAF:: @ 81D4E6D
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg 3
	setalpha 12, 8
	delay 1
	loopsewithpan SE_W077, 192, 10, 5
	createvisualtask sub_80A41C4, 5, 
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -2, 10
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -1, 15
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -4, -4, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 3, -3, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -1, -6, 8
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 12
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -4, 13
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 4, -5, 7
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, 2, -6, 11
	delay 2
	createsprite gRazorLeafParticleSpriteTemplate, ANIM_ATTACKER, 2, -3, -5, 8
	delay 60
	playsewithpan SE_W013B, 192
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 32, 20, 0
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 32, -20, 0
	delay 30
	playsewithpan SE_W013, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, -4, 1, 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 10, 4, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	delay 20
	setarg 7, 65535
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

Move_ICE_BALL:: @ 81D4F8E
	loadspritegfx ANIM_TAG_ICE_CHUNK
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 4, gUnknown_81D5005

gUnknown_81D4FA5:: @ 81D4FA5
	playsewithpan SE_W196, 192
	createsprite gUnknown_83E665C, ANIM_TARGET, 2, 15, 0, -12, -16, 30, -40
	delay 28
	playsewithpan SE_W280, 63
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 0, gUnknown_81D5016
	jumpargeq 0, 1, gUnknown_81D5045
	jumpargeq 0, 2, gUnknown_81D507E
	jumpargeq 0, 3, gUnknown_81D50C1
	jumpargeq 0, 4, gUnknown_81D5109

gUnknown_81D4FF3:: @ 81D4FF3
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 4, gUnknown_81D500C

gUnknown_81D5004:: @ 81D5004
	end

gUnknown_81D5005:: @ 81D5005
	fadetobg 15
	goto gUnknown_81D4FA5

gUnknown_81D500C:: @ 81D500C
	waitbgfadein
	delay 45
	restorebg
	waitbgfadein
	goto gUnknown_81D5004

gUnknown_81D5016:: @ 81D5016
	createvisualtask sub_8099BD4, 2, 0, 1, 8, 1, 0
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	goto gUnknown_81D4FF3

gUnknown_81D5045:: @ 81D5045
	createvisualtask sub_8099BD4, 2, 0, 1, 10, 1, 0
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	goto gUnknown_81D4FF3

gUnknown_81D507E:: @ 81D507E
	createvisualtask sub_8099BD4, 2, 0, 1, 14, 1, 0
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	goto gUnknown_81D4FF3

gUnknown_81D50C1:: @ 81D50C1
	createvisualtask sub_8099BD4, 2, 0, 1, 18, 1, 0
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	goto gUnknown_81D4FF3

gUnknown_81D5109:: @ 81D5109
	createvisualtask sub_8099BD4, 2, 0, 1, 30, 1, 0
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	call gUnknown_81D5151
	goto gUnknown_81D4FF3

gUnknown_81D5151:: @ 81D5151
	createsprite gUnknown_83E6674, ANIM_TARGET, 4, -12, -16
	return

Move_WEATHER_BALL:: @ 81D515D
	loadspritegfx ANIM_TAG_WEATHER_BALL
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 0
	delay 8
	playsewithpan SE_W207, 192
	createsprite gSpriteTemplate_83BF434, ANIM_ATTACKER, 2, 
	waitforvisualfinish
	delay 15
	playsewithpan SE_W197, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 5, 1, RGB_WHITE, 10, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_GetWeather, 2, 
	delay 1
	jumpargeq 7, 0, gUnknown_81D51C8
	jumpargeq 7, 1, gUnknown_81D5205
	jumpargeq 7, 2, gUnknown_81D5269
	jumpargeq 7, 3, gUnknown_81D52CD
	jumpargeq 7, 4, gUnknown_81D536D

gUnknown_81D51C8:: @ 81D51C8
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gSpriteTemplate_83BF44C, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	waitforvisualfinish
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 8, 1
	waitforvisualfinish
	end

gUnknown_81D5205:: @ 81D5205
	loadspritegfx ANIM_TAG_SMALL_EMBER
	createsprite gUnknown_83E5E14, ANIM_TARGET, 2, -30, -100, 25, 1, 40, 10
	playsewithpan SE_W172, 63
	delay 10
	createsprite gUnknown_83E5E14, ANIM_TARGET, 2, -30, -100, 25, 1, -40, 20
	playsewithpan SE_W172, 63
	delay 10
	createsprite gUnknown_83E5E14, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_W172, 63
	waitforvisualfinish
	playsewithpan SE_W172B, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 8, 1
	waitforvisualfinish
	end

gUnknown_81D5269:: @ 81D5269
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	createsprite gUnknown_83E5BA0, ANIM_TARGET, 2, -30, -100, 25, 1, 50, 10
	playsewithpan SE_W152, 63
	delay 8
	createsprite gUnknown_83E5BA0, ANIM_TARGET, 2, -30, -100, 25, 1, -20, 20
	playsewithpan SE_W152, 63
	delay 13
	createsprite gUnknown_83E5BA0, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_W152, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 8, 1
	playsewithpan SE_W202, 63
	waitforvisualfinish
	end

gUnknown_81D52CD:: @ 81D52CD
	loadspritegfx ANIM_TAG_ROCKS
	createsprite gUnknown_83E7590, ANIM_TARGET, 2, -30, -100, 25, 1, 30, 0
	playsewithpan SE_W088, 63
	delay 5
	createsprite gUnknown_83E7590, ANIM_TARGET, 2, -30, -100, 25, 1, -40, 20
	playsewithpan SE_W088, 63
	delay 14
	createsprite gUnknown_83E7590, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_W088, 63
	waitforvisualfinish
	playsewithpan SE_W070, 63
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, -12, 27, 2, 3
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, 8, 28, 3, 4
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, -4, 30, 2, 3
	createsprite gUnknown_83E7560, ANIM_TARGET, 2, 12, 25, 4, 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	waitforvisualfinish
	end

gUnknown_81D536D:: @ 81D536D
	loadspritegfx ANIM_TAG_HAIL
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createsprite gUnknown_83E65BC, ANIM_TARGET, 2, -30, -100, 25, 25, -40, 20
	playsewithpan SE_W258, 63
	delay 10
	createsprite gUnknown_83E65BC, ANIM_TARGET, 2, -30, -100, 25, 25, 40, 0
	playsewithpan SE_W258, 63
	delay 10
	createsprite gUnknown_83E65BC, ANIM_TARGET, 2, -30, -100, 25, 25, 0, 0
	playsewithpan SE_W258, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_W196, 63
	call gUnknown_81D540A
	waitforvisualfinish
	end

Move_COUNT:: @ 81D53D9
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

gUnknown_81D540A:: @ 81D540A
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, -10, -10, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 10, 20, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, -5, 10, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 17, -12, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, -15, 15, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 0, 0, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, 20, 2, 0
	playsewithpan SE_W196, 63
	return

gUnknown_81D548E:: @ 81D548E
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, -10, -10, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 10, 20, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, -29, 0, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 29, -20, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, -5, 10, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 17, -12, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, -20, 0, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, -15, 15, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 26, -5, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63F8, ANIM_TARGET, 2, 0, 0, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gUnknown_83E63E0, ANIM_TARGET, 2, 20, 2, 1
	playsewithpan SE_W196, 63
	return
	loopsewithpan SE_W196, 63, 6, 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 0, 24, 0
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 8, 24, 0
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -8, 24, 0
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 16, 24, 0
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -16, 24, 0
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 24, 24, 0
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -24, 24, 0
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 32, 24, 0
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -32, 24, 0
	return

gUnknown_81D55E2:: @ 81D55E2
	loopsewithpan SE_W196, 63, 6, 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 0, 24, 1
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 8, 24, 1
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -8, 24, 1
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 16, 24, 1
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -16, 24, 1
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 24, 24, 1
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -24, 24, 1
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 32, 24, 1
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -32, 24, 1
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 40, 24, 1
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -40, 24, 1
	delay 4
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, 48, 24, 1
	createsprite gUnknown_83E647C, ANIM_TARGET, 2, -48, 24, 1
	return

gUnknown_81D569E:: @ 81D569E
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, 12, -5, 0, 0, 32, 60
	delay 8
	return

gUnknown_81D56C9:: @ 81D56C9
	playsewithpan SE_W071B, 192
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, -15, 10, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, -15, -15, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, 10, -5, 0, 0
	delay 7
	return

gUnknown_81D5712:: @ 81D5712
	playsewithpan SE_W071B, 63
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 0, -5, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, 10, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, -15, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 10, -5, 1, 0
	delay 7
	return

gUnknown_81D575B:: @ 81D575B
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 10, 10, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, -20, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, -20, 15, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, -20, -20, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 16, -8, 0
	playsewithpan SE_W092, 63
	return

gUnknown_81D57CC:: @ 81D57CC
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, -20, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 0
	playsewithpan SE_W145C, 63
	return

gUnknown_81D583D:: @ 81D583D
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -28, -10, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 27, 8, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, -20, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 1
	playsewithpan SE_W145C, 63
	return

gUnknown_81D58D4:: @ 81D58D4
	playsewithpan SE_W085B, 63
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 5, 0, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -5, 10, 5, 1
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 15, 20, 5, 2
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -15, -10, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 25, 0, 5, 1
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -8, 8, 5, 2
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, 2, -8, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, ANIM_TARGET, 2, -20, 15, 5, 1
	return

gUnknown_81D595F:: @ 81D595F
	loopsewithpan SE_W146, 63, 13, 6
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 0, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 51, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 102, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 153, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 204, 3, 90
	return

gUnknown_81D59BB:: @ 81D59BB
	fadetobg 3
	waitbgfadeout
	createvisualtask AnimTask_SetPsychicBackground, 5, 
	waitbgfadein
	return

gUnknown_81D59C7:: @ 81D59C7
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	return

gUnknown_81D59CF:: @ 81D59CF
	jumpifcontest gUnknown_81D59E8
	fadetobg 18
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, -2304, 768, 1, -1

gUnknown_81D59E6:: @ 81D59E6
	waitbgfadein
	return

gUnknown_81D59E8:: @ 81D59E8
	fadetobg 19
	waitbgfadeout
	createvisualtask sub_80BB82C, 5, 2304, 768, 0, -1
	goto gUnknown_81D59E6

gUnknown_81D59FF:: @ 81D59FF
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	return

gUnknown_81D5A07:: @ 81D5A07
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, gUnknown_81D5A2C
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, gUnknown_81D5A3A
	goto gUnknown_81D5A33

gUnknown_81D5A2A:: @ 81D5A2A
	waitbgfadein
	return

gUnknown_81D5A2C:: @ 81D5A2C
	fadetobg 26
	goto gUnknown_81D5A2A

gUnknown_81D5A33:: @ 81D5A33
	fadetobg 25
	goto gUnknown_81D5A2A

gUnknown_81D5A3A:: @ 81D5A3A
	fadetobg 24
	goto gUnknown_81D5A2A

gUnknown_81D5A41:: @ 81D5A41
	restorebg
	waitbgfadein
	return

Status_Poison:: @ 81D5A44
	loopsewithpan SE_W092, 63, 13, 6
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 18, 2
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 12, 31774
	end

Status_Confusion:: @ 81D5A6F
	loadspritegfx ANIM_TAG_DUCK
	call gUnknown_81D595F
	end

Status_Burn:: @ 81D5A78
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_W172, 63
	call gUnknown_81D5A90
	call gUnknown_81D5A90
	call gUnknown_81D5A90
	waitforvisualfinish
	end

gUnknown_81D5A90:: @ 81D5A90
	createsprite gUnknown_83E5D7C, ANIM_TARGET, 2, -24, 24, 24, 24, 20, 1, 1
	delay 4
	return

Status_Infatuation:: @ 81D5AA8
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	playsewithpan SE_W204, 192
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	delay 15
	playsewithpan SE_W204, 192
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	delay 15
	playsewithpan SE_W204, 192
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	end

Status_Sleep:: @ 81D5ADD
	loadspritegfx ANIM_TAG_LETTER_Z
	playsewithpan SE_W173, 192
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 30
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	end

Status_Paralysis:: @ 81D5B09
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 10, 1
	call gUnknown_81D58D4
	end

Status_Freeze:: @ 81D5B23
	playsewithpan SE_W196, 0
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg 3
	monbgprio_28 1
	waitplaysewithpan SE_W258, 63, 17
	createvisualtask sub_80783FC, 2, 
	waitforvisualfinish
	clearmonbg 3
	end

Status_Curse:: @ 81D5B3E
	loadspritegfx ANIM_TAG_GHOSTLY_SPIRIT
	monbg 3
	playsewithpan SE_W171, 63
	createsprite gUnknown_83E7698, ANIM_TARGET, 2, 
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg 3
	end

Status_Nightmare:: @ 81D5B63
	loadspritegfx ANIM_TAG_DEVIL
	monbg 3
	playsewithpan SE_W171, 63
	createsprite gUnknown_83E76B0, ANIM_TARGET, 2, 
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg 3
	end

General_CastformChange:: @ 81D5B88
	createvisualtask AnimTask_IsMonInvisible, 2, 
	jumpargeq 7, 1, gUnknown_81D5BB4
	goto gUnknown_81D5B9C

gUnknown_81D5B9C:: @ 81D5B9C
	monbg 0
	playsewithpan SE_W100, 192
	waitplaysewithpan SE_W107, 192, 48
	createvisualtask AnimTask_TransformMon, 2, 1
	waitforvisualfinish
	clearmonbg 0
	end

gUnknown_81D5BB4:: @ 81D5BB4
	createvisualtask AnimTask_CastformGfxChange, 2, 1
	end

General_StatsChange:: @ 81D5BBE
	createvisualtask AnimTask_StatsChange, 5, 
	waitforvisualfinish
	end

General_SubstituteFade:: @ 81D5BC7
	monbg 0
	createvisualtask sub_80F15C8, 5, 
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 1
	clearmonbg 0
	delay 2
	blendoff
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 0, 0, RGB_WHITE
	createvisualtask sub_80F1420, 2, 1
	end

General_SubstituteAppear:: @ 81D5C04
	createvisualtask AnimTask_MonToSubstitute, 2, 
	end

General_PokeblockThrow:: @ 81D5C0C
	createvisualtask sub_80F1C8C, 2, 0
	createvisualtask AnimTask_LoadPokeblockGfx, 2, 
	delay 0
	waitplaysewithpan SE_W026, 192, 22
	createsprite gPokeblockSpriteTemplate, ANIM_TARGET, 3, -18, 12, 0, 32
	delay 50
	loopsewithpan SE_W039, 63, 19, 2
	createvisualtask AnimTask_SwayMon, 5, 1, 8, 1536, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_FreePokeblockGfx, 2, 
	end

General_ItemKnockoff:: @ 81D5C54
	loadspritegfx ANIM_TAG_ITEM_BAG
	createsprite gKnockOffItemSpriteTemplate, ANIM_TARGET, 2, 
	end

General_TurnTrap:: @ 81D5C5F
	createvisualtask AnimTask_GetTrappedMoveAnimId, 5, 
	jumpargeq 0, 1, gUnknown_81D5CD3
	jumpargeq 0, 2, gUnknown_81D5CF8
	jumpargeq 0, 3, gUnknown_81D5D4C
	jumpargeq 0, 4, gUnknown_81D5DA9
	goto gUnknown_81D5C8B

gUnknown_81D5C8B:: @ 81D5C8B
	loadspritegfx ANIM_TAG_TENDRILS
	loopsewithpan SE_W010, 63, 6, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 1
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 1
	delay 3
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	delay 20
	setarg 7, 65535
	playsewithpan SE_W020, 63
	waitforvisualfinish
	end

gUnknown_81D5CD3:: @ 81D5CD3
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_W221B, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	call gUnknown_81C885F
	call gUnknown_81C885F
	waitforvisualfinish
	stopsound
	end

gUnknown_81D5CF8:: @ 81D5CF8
	loadspritegfx ANIM_TAG_WATER_ORB
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 23968
	playsewithpan SE_W250, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	call gUnknown_81CFB92
	call gUnknown_81CFB92
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 23968
	waitforvisualfinish
	stopsound
	clearmonbg 3
	end

gUnknown_81D5D4C:: @ 81D5D4C
	loadspritegfx ANIM_TAG_CLAMP
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W011, 63
	createsprite gUnknown_83E7948, ANIM_ATTACKER, 2, -32, 0, 2, 819, 0, 10
	createsprite gUnknown_83E7948, ANIM_ATTACKER, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

gUnknown_81D5DA9:: @ 81D5DA9
	loadspritegfx ANIM_TAG_MUD_SAND
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 563
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	playsewithpan SE_W328, 63
	call gUnknown_81D2DE3
	call gUnknown_81D2DE3
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 563
	waitforvisualfinish
	stopsound
	end

General_ItemEffect:: @ 81D5DF2
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	delay 0
	playsewithpan SE_W036, 192
	createvisualtask sub_8099A78, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_W036, 192
	createvisualtask sub_8099A78, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_W036, 192
	createvisualtask sub_8099A78, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_W234, 192
	call gUnknown_81D569E
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 3, 7, 0, 26609
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0
	waitforvisualfinish
	end

General_SmokeballEscape:: @ 81D5E66
	loadspritegfx ANIM_TAG_PINK_CLOUD
	monbg 0
	setalpha 12, 4
	delay 0
	playsewithpan SE_BOWA2, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_TARGET, 0, 0, 32, 28, 30
	delay 4
	playsewithpan SE_BOWA2, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 127, 2, 12, 20, 30
	delay 12
	playsewithpan SE_BOWA2, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 126, 2, -28, 4, 30
	delay 12
	playsewithpan SE_BOWA2, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 124, 2, 14, -20, 30
	delay 4
	playsewithpan SE_BOWA2, 63
	createvisualtask sub_80B78E0, 2, 2
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 123, 3, 4, 4, 30
	delay 14
	playsewithpan SE_BOWA2, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 122, 3, -14, 18, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 121, 3, 14, -14, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 120, 3, -12, -10, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 119, 3, 14, 14, 46
	delay 0
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 118, 3, 0, 0, 46
	waitforvisualfinish
	clearmonbg 0
	invisible 0
	delay 0
	blendoff
	end

General_HangedOn:: @ 81D5F42
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 2, 7, 0, 9, 31
	playsewithpan SE_W082, 192
	createvisualtask sub_80E1C48, 5, 30, 128, 0, 1, 2, 0, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 2, 4, 9, 0, 31
	waitforvisualfinish
	delay 6
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 0, 0, 0, 15
	end

General_Rain:: @ 81D5F8F
	loadspritegfx ANIM_TAG_RAIN_DROPS
	playsewithpan SE_W240, 192
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask sub_80AABC0, 2, 0, 3, 60
	createvisualtask sub_80AABC0, 2, 0, 3, 60
	delay 50
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 2, 4, 0, RGB_BLACK
	waitforvisualfinish
	end

General_Sun:: @ 81D5FD8
	goto Move_SUNNY_DAY

General_Sandstorm:: @ 81D5FDD
	goto Move_SANDSTORM

General_Hail:: @ 81D5FE2
	goto Move_HAIL

General_LeechSeedDrain:: @ 81D5FE7
	createvisualtask AnimTask_GetBattlersFromArg, 5, 
	delay 0
	goto Move_ABSORB

General_MonHit:: @ 81D5FF5
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

General_ItemSteal:: @ 81D6026
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask sub_80BC0FC, 2, 
	createvisualtask AnimTask_TargetToEffectBattler, 2, 
	delay 1
	createsprite gItemStealSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 10, 2, -1
	end

General_SnatchMove:: @ 81D604B
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask sub_80BC060, 2, 
	call gUnknown_81D6476
	delay 1
	createvisualtask AnimTask_SwayMon, 2, 0, 5, 5120, 4, 1
	waitforvisualfinish
	createvisualtask AnimTask_IsTargetSameSide, 2, 
	jumpargeq 7, 0, gUnknown_81D6089
	goto gUnknown_81D6099

gUnknown_81D6082:: @ 81D6082
	waitforvisualfinish
	call gUnknown_81D6496
	end

gUnknown_81D6089:: @ 81D6089
	playsewithpan SE_W104, 192
	createvisualtask AnimTask_SnatchOpposingMonMove, 2, 
	goto gUnknown_81D6082

gUnknown_81D6099:: @ 81D6099
	playsewithpan SE_W104, 192
	createvisualtask AnimTask_SnatchPartnerMove, 2, 
	goto gUnknown_81D6082

General_FutureSightHit:: @ 81D60A9
	createvisualtask sub_80BC0DC, 2, 
	monbg 3
	playsewithpan SE_W060, 192
	call gUnknown_81D59BB
	setalpha 8, 8
	playsewithpan SE_W048, 63
	waitplaysewithpan SE_W048, 63, 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg 3
	blendoff
	waitforvisualfinish
	delay 1
	call gUnknown_81D59C7
	end

General_DoomDesireHit:: @ 81D6108
	createvisualtask sub_80BC0DC, 2, 
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5, 
	delay 9
	playsewithpan SE_W109, 192
	delay 9
	playsewithpan SE_W109, 0
	delay 9
	playsewithpan SE_W109, 63
	delay 25
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 20, 1
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end

General_FocusPunchSetUp:: @ 81D61CD
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_W082, 192
	call gUnknown_81CB267
	delay 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	call gUnknown_81CB267
	delay 8
	call gUnknown_81CB267
	waitforvisualfinish
	end

General_IngrainHeal:: @ 81D620D
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg 3
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 4, 13293
	waitforvisualfinish
	delay 3
	call gUnknown_81CEC44
	waitforvisualfinish
	delay 15
	call gUnknown_81D56C9
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 4, 0, 13293
	waitforvisualfinish
	clearmonbg 3
	blendoff
	end

General_WishHeal:: @ 81D6250
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 10, 0
	waitforvisualfinish
	playsewithpan SE_W025, 192
	call gUnknown_81D569E
	waitforvisualfinish
	call gUnknown_81D56C9
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 10, 0, 0
	end

gUnknown_81D628A:: @ 81D628A
	createvisualtask sub_80F1C8C, 2, 1
	waitforvisualfinish
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 10, 26336
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 10, 1
	delay 20
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 0, 1
	playsewithpan SE_W166, 63
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask sub_80A9A20, 3, 
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 10, 0, 26336
	waitforvisualfinish
	end

gUnknown_81D6301:: @ 81D6301
	createvisualtask sub_80F1C8C, 2, 1
	waitforvisualfinish
	fadetobg 2
	waitbgfadeout
	monbg_22 0
	createvisualtask sub_80B6BBC, 2, 
	waitbgfadein
	loopsewithpan SE_W060, 63, 20, 3
	waitforvisualfinish
	clearmonbg_23 0
	delay 1
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, -1, 0, 6, 27349
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 0, 1
	createsprite gUnknown_83E6D94, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask sub_80A9A20, 3, 
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, -1, 6, 0, 27349
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

gUnknown_81D637B:: @ 81D637B
	monbg 0
	playsewithpan SE_W100, 192
	waitplaysewithpan SE_W107, 192, 48
	createvisualtask AnimTask_TransformMon, 2, 255
	waitsound
	waitforvisualfinish
	clearmonbg 0
	end

gUnknown_81D6394:: @ 81D6394
	createvisualtask sub_80F1C8C, 2, 0
	waitforvisualfinish
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	delay 0
	waitplaysewithpan SE_W026, 192, 22
	createsprite gUnknown_840C210, ANIM_TARGET, 3, -17, 14, 8, 0
	delay 50
	monbg 3
	setalpha 12, 8
	delay 0
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, -20, 1, 2
	waitforvisualfinish
	clearmonbg 3
	blendoff
	waitforvisualfinish
	end

gUnknown_81D63DC:: @ 81D63DC
	createvisualtask sub_80F1CE4, 2, 
	waitforvisualfinish
	jumpargeq 7, 0, gUnknown_81D63FD
	jumpargeq 7, 1, gUnknown_81D6425
	jumpargeq 7, 2, gUnknown_81D644E
	end

gUnknown_81D63FD:: @ 81D63FD
	playsewithpan SE_W036, 63
	createvisualtask sub_8099A78, 2, 16, 96, 0, 2
	waitforvisualfinish
	playsewithpan SE_W036, 63
	createvisualtask sub_8099A78, 2, 16, -96, 0, 2
	end

gUnknown_81D6425:: @ 81D6425
	loadspritegfx ANIM_TAG_ANGER
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -20
	playsewithpan SE_W207B, 63
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -20
	playsewithpan SE_W207B, 63
	end

gUnknown_81D644E:: @ 81D644E
	playsewithpan SE_W036, 63
	createvisualtask sub_8099A78, 2, 8, 136, 0, 2
	waitforvisualfinish
	playsewithpan SE_W036, 63
	createvisualtask sub_8099A78, 2, 8, 136, 0, 2
	end

gUnknown_81D6476:: @ 81D6476
	createvisualtask AnimTask_IsAttackerBehindSubstitute, 2, 
	jumpargeq 7, 1, gUnknown_81D6487

gUnknown_81D6485:: @ 81D6485
	waitforvisualfinish
	return

gUnknown_81D6487:: @ 81D6487
	createvisualtask sub_80F1420, 2, 1
	waitforvisualfinish
	goto gUnknown_81D6485

gUnknown_81D6496:: @ 81D6496
	createvisualtask AnimTask_IsAttackerBehindSubstitute, 2, 
	jumpargeq 7, 1, gUnknown_81D64A7

gUnknown_81D64A5:: @ 81D64A5
	waitforvisualfinish
	return

gUnknown_81D64A7:: @ 81D64A7
	createvisualtask sub_80F1420, 2, 0
	waitforvisualfinish
	goto gUnknown_81D64A5

Special_LevelUp:: @ 81D64B6
	playsewithpan SE_EXPMAX, 0
	createvisualtask sub_80EF0B4, 2, 
	delay 0
	createvisualtask sub_80EF1A0, 5, 0, 0
	waitforvisualfinish
	createvisualtask sub_80EF180, 2, 
	end

Special_SwitchOutPlayerMon:: @ 81D64D7
	createvisualtask sub_80EF344, 2, 
	delay 10
	createvisualtask sub_80EF298, 2, 
	end

Special_SwitchOutOpponentMon:: @ 81D64E8
	createvisualtask sub_80EF344, 2, 
	delay 10
	createvisualtask sub_80EF298, 2, 
	end

Special_BallThrow:: @ 81D64F9
	createvisualtask sub_80EF490, 2, 
	delay 0
	playsewithpan SE_NAGERU, 0
	createvisualtask sub_80EF5AC, 2, 
	createvisualtask AnimTask_IsBallBlockedByTrainerOrDodged, 2, 
	jumpargeq 7, 65535, gUnknown_81D652D
	jumpargeq 7, 65534, gUnknown_81D6555

gUnknown_81D6524:: @ 81D6524
	waitforvisualfinish
	createvisualtask sub_80EF4B8, 2, 
	end

gUnknown_81D652D:: @ 81D652D
	loadspritegfx ANIM_TAG_IMPACT
	delay 25
	monbg 3
	setalpha 12, 8
	delay 0
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, -20, 1, 2
	waitforvisualfinish
	clearmonbg 3
	blendoff
	goto gUnknown_81D6524

gUnknown_81D6555:: @ 81D6555
	delay 16
	createvisualtask AnimTask_WindUpLunge, 2, 1, 48, 6, 16, 48, -48, 16
	playsewithpan SE_W036, 63
	waitplaysewithpan SE_W036, 63, 48
	waitforvisualfinish
	goto gUnknown_81D6524

Special_SafariBallThrow:: @ 81D657B
	createvisualtask sub_80EF490, 2, 
	delay 0
	createvisualtask sub_80EF6D4, 2, 
	waitforvisualfinish
	createvisualtask sub_80EF4B8, 2, 
	end

Special_SubstituteToMon:: @ 81D6594
	createvisualtask sub_80F1420, 2, 1
	end

Special_MonToSubstitute:: @ 81D659E
	createvisualtask sub_80F1420, 2, 0
	end
