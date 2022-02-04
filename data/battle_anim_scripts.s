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
	.4byte General_BaitThrow
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
	.4byte General_MonScared
	.4byte General_GhostGetOut
	.4byte General_SilphScoped
	.4byte General_SafariRockThrow
	.4byte General_SafariReaction
	.4byte General_LoadAbilityPopUp
	.4byte General_RemoveAbilityPopUp

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
	playsewithpan SE_M_DOUBLE_SLAP, 63
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
	choosetwoturnanim DoubleSlapLeft, DoubleSlapRight
DoubleSlapContinue:: @ 81C6F76
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_DOUBLE_SLAP, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

DoubleSlapLeft:: @ 81C6F90
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, 1, 2
	goto DoubleSlapContinue

DoubleSlapRight:: @ 81C6FA4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, 0, 1, 2
	goto DoubleSlapContinue

Move_POISON_POWDER:: @ 81C6FB8
	loadspritegfx ANIM_TAG_POISON_POWDER
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loopsewithpan SE_M_POISON_POWDER, 63, 10, 6
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
	loopsewithpan SE_M_POISON_POWDER, 63, 10, 6
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
	loopsewithpan SE_M_POISON_POWDER, 63, 10, 6
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
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWIFT, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	delay 5
	playsewithpan SE_M_SWIFT, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 5, 22, -18, 1
	delay 5
	playsewithpan SE_M_SWIFT, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, -10, 22, 15, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 18, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 18, 1
	delay 5
	playsewithpan SE_M_SWIFT, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 5
	playsewithpan SE_M_SWIFT, 192
	createsprite gSwiftStarSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 12, 1
	delay 5
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_STRENGTH:: @ 81C73FE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_ShakeAndSinkMon, 5, 0, 2, 0, 96, 30
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 4
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 1, 18, 6, 2, 4
	delay 4
	playsewithpan SE_M_MEGA_KICK2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 16, 12, 1, 1
	delay 4
	playsewithpan SE_M_MEGA_KICK2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, -12, 1, 1
	delay 4
	playsewithpan SE_M_MEGA_KICK2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 3, 4, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
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
	playsewithpan SE_M_COMET_PUNCH, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_BODY_SLAM:: @ 81C74D0
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, 192
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	waitforvisualfinish
	delay 11
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 26, 0, 0, 5
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, 1, 0
	loopsewithpan SE_M_MEGA_KICK2, 63, 10, 2
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
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SUPERSONIC:: @ 81C755D
	loadspritegfx ANIM_TAG_GOLD_RING
	monbg ANIM_ATK_PARTNER
	monbgprio_2A 0
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon2, 2, 0, 2, 0, 8, 1
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	call SupersonicRing
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SupersonicRing:: @ 81C759B
	playsewithpan SE_M_SUPERSONIC, 192
	createsprite gSupersonicWaveSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_SCREECH:: @ 81C75B5
	loadspritegfx ANIM_TAG_PURPLE_RING
	createvisualtask AnimTask_ShakeMon2, 2, 0, 3, 0, 2, 1
	call ScreechRing
	call ScreechRing
	delay 16
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 2048, 2, 1
	waitforvisualfinish
	end

ScreechRing:: @ 81C75E8
	playsewithpan SE_M_SCREECH, 192
	createsprite gScreechWaveSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_FLAME_WHEEL:: @ 81C7602
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 0
	playsewithpan SE_M_FLAME_WHEEL, 192
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 4
	playsewithpan SE_M_FLAME_WHEEL, 192
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 8
	playsewithpan SE_M_FLAME_WHEEL, 192
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 12
	playsewithpan SE_M_FLAME_WHEEL, 192
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 16
	playsewithpan SE_M_FLAME_WHEEL, 192
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 20
	playsewithpan SE_M_FLAME_WHEEL, 192
	delay 2
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 56, 24
	playsewithpan SE_M_FLAME_WHEEL, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 8, 1
	createvisualtask AnimTask_BlendMonInAndOut, 3, 1, 31, 12, 1, 1
	playsewithpan SE_M_FLAME_WHEEL2, 63
	call FireSpreadEffect
	delay 7
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 9
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end
	createsprite gFireSpiralOutwardSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 50
	delay 4
	return

Move_PIN_MISSILE:: @ 81C76FC
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_M_JUMP_KICK, 192
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_M_HORN_ATTACK, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 9
	createsprite gPinMissileSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_M_HORN_ATTACK, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 14
	playsewithpan SE_M_HORN_ATTACK, 63
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
	playsewithpan SE_M_ICY_WIND, 192
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_M_HORN_ATTACK, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 9
	createsprite gIcicleSpearSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_M_HORN_ATTACK, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	delay 14
	playsewithpan SE_M_HORN_ATTACK, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_TAKE_DOWN:: @ 81C7886
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_WindUpLunge, 5, 0, -24, 8, 23, 10, 40, 10
	delay 35
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 10, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, -10, 0, 1, 0
	playsewithpan SE_M_MEGA_KICK2, 63
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
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_DOUBLE_EDGE:: @ 81C791A
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_SWIFT, 192
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 4, 2, RGB_WHITE, 10, 0, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_SWAGGER, 192
	waitplaysewithpan SE_M_SWAGGER, 192, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 2, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 16, 16, RGB_WHITE
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, 1, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -32, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, 0, 0
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, 1, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 4, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 12, 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 16, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, 0, 1
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 8, -256, 1, 1
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
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 20, 0, -8, 0, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 5, 1
	playsewithpan SE_M_HORN_ATTACK, 63
	waitforvisualfinish
	call PoisonBubblesEffect
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
	loopsewithpan SE_M_RAZOR_WIND2, 192, 6, 2
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 10, -4, 0, -4, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_TARGET, 2, 20, 12, 10, 12, 20
	delay 20
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 5, 1
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -4, 1, 3
	loopsewithpan SE_M_HORN_ATTACK, 63, 5, 2
	delay 1
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 10, 12, 1, 3
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_FIRE_BLAST:: @ 81C7AF5
	loadspritegfx ANIM_TAG_SMALL_EMBER
	createsoundtask sub_80DCE10, SE_M_FLAME_WHEEL, SE_M_FLAME_WHEEL2
	call FireBlastRing
	call FireBlastRing
	call FireBlastRing
	delay 24
	createvisualtask AnimTask_BlendSelected, 10, 1, 3, 0, 8, RGB_BLACK
	waitforvisualfinish
	delay 19
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 20, 1
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	delay 3
	call FireBlastCross
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 2, 8, 0, RGB_BLACK
	waitforvisualfinish
	end

FireBlastRing:: @ 81C7B89
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 51
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 102
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 153
	createsprite gFireBlastRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 204
	delay 5
	return

FireBlastCross:: @ 81C7BCD
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 10, 0, -2
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 13, -2, 0
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 13, 2, 0
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 15, -2, 2
	createsprite gFireBlastCrossSpriteTemplate, ANIM_TARGET, 2, 0, 0, 15, 2, 2
	return

Move_LEECH_SEED:: @ 81C7C23
	loadspritegfx ANIM_TAG_SEED
	playsewithpan SE_M_POISON_POWDER, 192
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, 0, 24, 35, -32
	delay 8
	playsewithpan SE_M_POISON_POWDER, 192
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, -16, 24, 35, -40
	delay 8
	playsewithpan SE_M_POISON_POWDER, 192
	createsprite gLeechSeedSpriteTemplate, ANIM_TARGET, 2, 15, 0, 16, 24, 35, -37
	delay 12
	loopsewithpan SE_M_TAIL_WHIP, 63, 10, 8
	waitforvisualfinish
	end

Move_EMBER:: @ 81C7C79
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loopsewithpan SE_M_EMBER, 192, 5, 2
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, -16, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, ANIM_TARGET, 2, 20, 0, 16, 24, 20, 1
	delay 16
	playsewithpan SE_M_FLAME_WHEEL, 63
	call EmberFireHit
	call EmberFireHit
	call EmberFireHit
	end

EmberFireHit:: @ 81C7CD5
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
	playsewithpan SE_M_MEGA_KICK, 63
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 50
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 7, RGB_WHITE
	delay 50
	call SetImpactBackground
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 22, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 8, 0, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end

SetImpactBackground:: @ 81C7D89
	delay 2
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, SetImpactContestsBG
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, SetImpactOpponentBG
	jumpargeq 7, 1, SetImpactPlayerBG
SetImpactBackgroundRet:: @ 81C7DB1
	return

SetImpactOpponentBG:: @ 81C7DB2
	changebg 4
	goto SetImpactBackgroundRet

SetImpactPlayerBG:: @ 81C7DB9
	changebg 5
	goto SetImpactBackgroundRet

SetImpactContestsBG:: @ 81C7DC0
	changebg 6
	goto SetImpactBackgroundRet

Move_MEGA_KICK:: @ 81C7DC7
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 1
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 0, 16, 0
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, 63
	createsprite gMegaPunchKickSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 50
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 7, RGB_WHITE
	delay 50
	playsewithpan SE_M_MEGA_KICK2, 63
	call SetImpactBackground
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
	choosetwoturnanim CometPunchLeft, CometPunchRight

CometPunchContinue:: @ 81C7E77
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_COMET_PUNCH, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

CometPunchLeft:: @ 81C7E91
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, -8, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, -8, 0, 8, 1, 0
	goto CometPunchContinue

CometPunchRight:: @ 81C7EB6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 8, -8, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 8, 0, 8, 1, 0
	goto CometPunchContinue

Move_SONIC_BOOM:: @ 81C7EDB
	loadspritegfx ANIM_TAG_AIR_WAVE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	call SonicBoomProjectile
	call SonicBoomProjectile
	call SonicBoomProjectile
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 10, 1
	call SonicBoomHit
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SonicBoomProjectile:: @ 81C7F12
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gSonicBoomSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 15
	delay 4
	return

SonicBoomHit:: @ 81C7F2A
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 2
	delay 4
	return

Move_THUNDER_SHOCK:: @ 81C7F3C
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 0, 6, RGB_BLACK
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ElectricBolt, 5, 0, -44, 0
	playsewithpan SE_M_THUNDERBOLT, 63
	delay 9
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	call ElectricityEffect
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
	createvisualtask AnimTask_ElectricBolt, 5, 24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, 63
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, -24, -52, 0
	playsewithpan SE_M_THUNDERBOLT, 63
	delay 7
	createvisualtask AnimTask_ElectricBolt, 5, 0, -60, 1
	playsewithpan SE_M_THUNDERBOLT, 63
	delay 9
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 0, 13, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 13, 0, RGB_BLACK
	waitforvisualfinish
	delay 20
	createsprite gThunderboltOrbSpriteTemplate, ANIM_TARGET, 3, 44, 0, 0, 3
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 0, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 64, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 128, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 32, 44, 192, 40, 2, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 32, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 96, 40, 1, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 160, 40, 0, -32765
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_TARGET, 4, 0, 0, 16, 44, 224, 40, 2, -32765
	playsewithpan SE_M_HYPER_BEAM, 63
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
	waitplaysewithpan SE_M_THUNDERBOLT2, 63, 19
	call ElectricityEffect
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
	createvisualtask AnimTask_ElectricBolt, 5, 0, -48, 0
	playsewithpan SE_M_THUNDER_WAVE, 63
	delay 20
	loopsewithpan SE_M_THUNDERBOLT2, 63, 10, 4
	createsprite gThunderWaveSpriteTemplate, ANIM_TARGET, 2, -16, -16
	delay 4
	createsprite gThunderWaveSpriteTemplate, ANIM_TARGET, 2, -16, 0
	delay 4
	createsprite gThunderWaveSpriteTemplate, ANIM_TARGET, 2, -16, 16
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 6, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_BEAT_UP:: @ 81C81CF
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg 1
	setalpha 12, 8
	choosetwoturnanim BeatUpLeft, BeatUpRight
BeatUpContinue:: @ 81C81E3
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

BeatUpLeft:: @ 81C81E8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -20, -20, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, -20, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 8, 0, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 8, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	goto BeatUpContinue

BeatUpRight:: @ 81C8259
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 12, -20, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 12, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -12, 0, 1, 2
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, -12, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	goto BeatUpContinue

Move_STOMP:: @ 81C82CA
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, 63
	createsprite gStompFootSpriteTemplate, ANIM_ATTACKER, 3, 0, -32, 15
	delay 19
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, -8, 1, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 4, 9, 1
	playsewithpan SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_TAIL_WHIP:: @ 81C8311
	loopsewithpan SE_M_TAIL_WHIP, 192, 24, 3
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 12, 4, 2, 3
	waitforvisualfinish
	end

Move_CUT:: @ 81C832A
	loadspritegfx ANIM_TAG_CUT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_CUT, 63
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
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, 0, 0
	waitforvisualfinish
	delay 30
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 20479, 12, 5, 1
	delay 4
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, 0, 0
	playsewithpan SE_M_REVERSAL, 192
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 0
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 42
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 84
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 126
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 168
	createsprite gHiddenPowerOrbSpriteTemplate, ANIM_ATTACKER, 2, 26, 210
	delay 52
	setarg 7, 65535
	playsewithpan SE_M_REFLECT, 192
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
	playsewithpan SE_M_DETECT, 192
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 3, RGB_WHITE, 8, 0, 0
	waitforvisualfinish
	delay 30
	createvisualtask AnimTask_CurseBlendEffect, 2, 31, 3, 2, 0, 10, RGB_WHITE
	delay 10
	playsewithpan SE_M_REVERSAL, 192
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
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, RGB_WHITE, 8, 0, 0
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 10, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, 0, 1, 8, 1, 0
	end

Move_PURSUIT:: @ 81C8520
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_TARGET
	fadetobg BG_DARK
	waitbgfadein
	delay 0
	setalpha 12, 8
	choosetwoturnanim PursuitNormal, PursuitOnSwitchout
PursuitContinue:: @ 81C8536
	waitforvisualfinish
	clearmonbg ANIM_TARGET
	blendoff
	delay 0
	restorebg
	waitbgfadein
	end

PursuitNormal:: @ 81C853F
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, 0, 1, 6, 1, 0
	goto PursuitContinue

PursuitOnSwitchout:: @ 81C8568
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, 0, 1, 6, 1, 0
	goto PursuitContinue

Move_SPIKE_CANNON:: @ 81C8591
	loadspritegfx ANIM_TAG_NEEDLE
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_WindUpLunge, 5, 0, -4, 0, 4, 6, 8, 4
	waitforvisualfinish
	loopsewithpan SE_M_RAZOR_WIND2, 192, 5, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 10, -8, -8, -8, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 0, 0, 20
	createsprite gLinearStingerSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 8, 8, 20
	waitforvisualfinish
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -8, -8, 1, 2
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createsprite gHandleInvertHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 7, 1
	loopsewithpan SE_M_HORN_ATTACK, 63, 5, 3
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SWORDS_DANCE:: @ 81C8644
	loadspritegfx ANIM_TAG_SWORD
	monbg ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_SWORDS_DANCE, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 16, 6, 1, 4
	createsprite gSwordsDanceBladeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	delay 22
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, 10005, 2, 2, 32754, 16, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 1
	end

Move_PSYCH_UP:: @ 81C868A
	loadspritegfx ANIM_TAG_SPIRAL
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendColorCycleExclude, 2, 1, 2, 6, 1, 11, 0
	setalpha 12, 8
	loopsewithpan SE_M_PSYBEAM2, 192, 5, 10
	createsprite gPsychUpSpiralSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, 0
	createvisualtask AnimTask_SwayMon, 5, 0, 5, 2560, 8, 0
	delay 127
	delay 4
	playsewithpan SE_M_PSYBEAM, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, 0, 1
	createvisualtask AnimTask_BlendSelected, 9, 2, 2, 10, 0, RGB(31, 31, 0)
	delay 30
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	waitforvisualfinish
	end

Move_DIZZY_PUNCH:: @ 81C86FC
	loadspritegfx ANIM_TAG_DUCK
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	call DizzyPunchLunge
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 5, 16, 8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 16, 0, 1, 1
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, 160, -32
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, -256, -40
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, 128, -16
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, 416, -38
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, -128, -22
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, 16, 8, -384, -31
	delay 10
	call DizzyPunchLunge
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 5, -16, -8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -16, -16, 1, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, 160, -32
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, -256, -40
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, 128, -16
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, 416, -38
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, -128, -22
	createsprite gDizzyPunchDuckSpriteTemplate, ANIM_TARGET, 3, -16, -8, -384, -31
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

DizzyPunchLunge:: @ 81C8817
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 7, 1
	return

Move_FIRE_SPIN:: @ 81C8836
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_M_SACRED_FIRE2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 47, 1
	call FireSpinEffect
	call FireSpinEffect
	call FireSpinEffect
	waitforvisualfinish
	end

FireSpinEffect:: @ 81C885F
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 28, 528, 30, 13, 50, 1
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 32, 480, 20, 16, -46, 1
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 33, 576, 20, 8, 42, 1
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 31, 400, 25, 11, -42, 1
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 28, 512, 25, 16, 46, 1
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_TARGET, 2, 0, 33, 464, 30, 15, -50, 1
	delay 2
	return

Move_FURY_CUTTER:: @ 81C88EA
	loadspritegfx ANIM_TAG_CUT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND, 63
	createvisualtask AnimTask_IsFuryCutterHitRight, 2, 
	jumpargeq 7, 0, FuryCutterLeft
	goto FuryCutterRight

FuryCutterContinue:: @ 81C890A
	createvisualtask AnimTask_GetFuryCutterHitCount, 2, 
	jumpargeq 7, 1, FuryCutterContinue2
	jumpargeq 7, 2, FuryCutterMedium
	jumpargeq 7, 3, FuryCutterStrong
	goto FuryCutterStrongest

FuryCutterContinue2:: @ 81C892E
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

FuryCutterLeft:: @ 81C8947
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	goto FuryCutterContinue

FuryCutterRight:: @ 81C8959
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 1
	goto FuryCutterContinue

FuryCutterMedium:: @ 81C896B
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 10505, 4, 0, 0
	goto FuryCutterContinue2

FuryCutterStrong:: @ 81C8985
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 3, 10505, 4, 0, 0
	goto FuryCutterContinue2

FuryCutterStrongest:: @ 81C899F
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 3, 10505, 4, 0, 0
	goto FuryCutterContinue2

Move_SELF_DESTRUCT:: @ 81C89B9
	loadspritegfx ANIM_TAG_EXPLOSION
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 9, RGB(31, 0, 0)
	createvisualtask AnimTask_ShakeMon2, 5, 4, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 6, 0, 38, 1
	call SelfDestructExplode
	call SelfDestructExplode
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 9, 0, RGB(31, 0, 0)
	end

SelfDestructExplode:: @ 81C8A3F
	playsewithpan SE_M_SELF_DESTRUCT, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 0, 1
	delay 6
	return

Move_SLAM:: @ 81C8AA9
	loadspritegfx ANIM_TAG_SLAM_HIT
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_COMET_PUNCH, 192
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 3, 0, 4
	delay 1
	createsprite gSlamHitSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	delay 3
	playsewithpan SE_M_MEGA_KICK2, 63
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
	playsewithpan SE_M_JUMP_KICK, 192
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 6
	playsewithpan SE_M_SCRATCH, 63
	createsprite gVineWhipSpriteTemplate, ANIM_TARGET, 2, 0, 0
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 6, 1
	end

Move_DRILL_PECK:: @ 81C8B68
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	delay 2
	loopsewithpan SE_M_HORN_ATTACK, 63, 4, 8
	createvisualtask AnimTask_DrillPeckHitSplats, 5
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
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 23, 1
	delay 5
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 25, 0
	delay 4
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 25, 0
	delay 4
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, 25, 0
	delay 4
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 25, 0
	delay 4
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, 15, 25, 0
	delay 4
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 25, 20, 25, 0
	delay 4
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -20, 20, 25, 0
	delay 4
	playsewithpan SE_M_CRABHAMMER, 192
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 12, 0, 25, 0
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 5
	delay 6
	call RisingWaterHitEffect
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

RisingWaterHitEffect:: @ 81C8CA2
	playsewithpan SE_M_WATERFALL, 63
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 17, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 20, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 20
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 20
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 15, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 15
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 15
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 10, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 10
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 10
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 5
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 5
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, 0
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -5, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -5
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -5
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -10, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -10
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -10
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -15
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -15
	delay 2
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -20, 1, 1
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -20
	createsprite gSmallDriftingBubblesSpriteTemplate, ANIM_ATTACKER, 4, 0, -20
	return

Move_EXPLOSION:: @ 81C8E15
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 8, 9, 8474, 8, 0, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call Explosion1
	call Explosion1
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 1, 16, 16, RGB_WHITE
	delay 50
	createvisualtask AnimTask_BlendSelected, 10, 1, 3, 16, 0, RGB_WHITE
	end

Explosion1:: @ 81C8EB2
	playsewithpan SE_M_EXPLOSION, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_M_EXPLOSION, 192
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 0, 1
	delay 6
	return

Move_DEFENSE_CURL:: @ 81C8F1C
	loadspritegfx ANIM_TAG_ECLIPSING_ORB
	loopsewithpan SE_M_TRI_ATTACK, 192, 18, 3
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
	monbg ANIM_ATK_PARTNER
	monbgprio_28 0
	waitplaysewithpan SE_M_REFLECT, 192, 16
	createsprite gProtectWallSpriteTemplate, ANIM_ATTACKER, 2, 24, 0, 90
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	end

Move_DETECT:: @ 81C8F72
	loadspritegfx ANIM_TAG_SPARKLE_4
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 9, 0
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 9, RGB_WHITE
	delay 18
	playsewithpan SE_M_DETECT, 192
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
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_GetFrustrationPowerLevel, 1, 
	jumpargeq 7, 0, Frustration_Strongest
	jumpargeq 7, 1, Frustration_Strong
	jumpargeq 7, 2, Frustration_Medium
	goto Frustration_Weak
Frustration_Continue:: @ 81C8FFF
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Frustration_Strongest:: @ 81C9004
	playsewithpan SE_M_DRAGON_RAGE, 192
	createvisualtask AnimTask_ShakeMon2, 5, 0, 1, 0, 15, 1
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 0, 9, RGB(31, 0, 0)
	waitforvisualfinish
	delay 20
	playsewithpan SE_M_SWAGGER2, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	playsewithpan SE_M_SWAGGER2, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_SwayMon, 5, 0, 16, 6144, 8, 0
	delay 5
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 30, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 24, 8, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -24, -16, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 8, 4, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -16, 19, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, -18, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 9, 0, RGB(31, 0, 0)
	goto Frustration_Continue

Frustration_Strong:: @ 81C910A
	playsewithpan SE_M_DRAGON_RAGE, 192
	createvisualtask AnimTask_ShakeMon2, 5, 0, 1, 0, 15, 1
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 0, 9, RGB(31, 0, 0)
	waitforvisualfinish
	delay 20
	playsewithpan SE_M_SWAGGER2, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createvisualtask AnimTask_StrongFrustrationGrowAndShrink, 5, 
	delay 7
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 8, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	delay 14
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 12, -6, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	delay 14
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -12, -6, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 3, 9, 0, RGB(31, 0, 0)
	goto Frustration_Continue

Frustration_Medium:: @ 81C91D7
	playsewithpan SE_M_SWAGGER2, 192
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 4, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -4, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	goto Frustration_Continue

Frustration_Weak:: @ 81C9253
	createsprite gWeakFrustrationAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 20, -28
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 10, 2
	delay 12
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 6, 1
	goto Frustration_Continue

Move_SAFEGUARD:: @ 81C9297
	loadspritegfx ANIM_TAG_GUARD_RING
	monbg ANIM_ATK_PARTNER
	setalpha 8, 8
	playsewithpan SE_M_MILK_DRINK, 192
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 4
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 4
	createsprite gGuardRingSpriteTemplate, ANIM_ATTACKER, 2, 
	waitforvisualfinish
	playsewithpan SE_SHINY, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 10, 0, 2, 0, 10, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

Move_PAIN_SPLIT:: @ 81C92D9
	loadspritegfx ANIM_TAG_PAIN_SPLIT
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, -8, -42, 0
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, -8, -42, 1
	delay 10
	playsewithpan SE_M_SWAGGER2, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 0, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 1, 0
	waitforvisualfinish
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, -24, -42, 0
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, -24, -42, 1
	delay 10
	playsewithpan SE_M_SWAGGER2, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 0, 1
	createvisualtask AnimTask_PainSplitMovement, 2, 1, 1
	waitforvisualfinish
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_ATTACKER, 2, 8, -42, 0
	createsprite gPainSplitProjectileSpriteTemplate, ANIM_TARGET, 2, 8, -42, 1
	delay 10
	playsewithpan SE_M_SWAGGER2, 0
	createvisualtask AnimTask_PainSplitMovement, 2, 0, 2
	createvisualtask AnimTask_PainSplitMovement, 2, 1, 2
	end

Move_VICE_GRIP:: @ 81C9381
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VICEGRIP, 63
	createsprite gViceGripSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gViceGripSpriteTemplate, ANIM_ATTACKER, 2, 1
	delay 9
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_GUILLOTINE:: @ 81C93C9
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	fadetobgfromset 12, 13, 14
	waitbgfadein
	playsewithpan SE_M_VICEGRIP, 63
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gGuillotineSpriteTemplate, ANIM_ATTACKER, 2, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 16, RGB_BLACK
	delay 9
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 23, 1
	delay 46
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 8, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 8, 0, 0
	playsewithpan SE_M_RAZOR_WIND, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
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
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gCoinThrowSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 1152
	waitforvisualfinish
	playsewithpan SE_M_PAY_DAY, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 1, 2
	createsprite gFallingCoinSpriteTemplate, ANIM_ATTACKER, 2, 
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_OUTRAGE:: @ 81C94A8
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loopsewithpan SE_M_DRAGON_RAGE, 192, 8, 3
	createvisualtask AnimTask_CurseBlendEffect, 2, 7, 2, 5, 3, 8, 430
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 12, 6, 5, 4
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 0, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, -1280, 3
	delay 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 40, 1
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, -768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 0, 3
	call OutrageFlames
	call OutrageFlames
	waitforvisualfinish
	end

OutrageFlames:: @ 81C95AF
	delay 3
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 0, -1280, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gOutrageFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, -1280, -768, 3
	return

Move_SPARK:: @ 81C9643
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_SPARK_2
	delay 0
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 5, 5, 23551
	playsewithpan SE_M_THUNDERBOLT2, 192
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 32, 24, 190, 12, 0, 1, 0
	delay 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 80, 24, 22, 12, 0, 1, 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 156, 24, 121, 13, 0, 1, 1
	delay 0
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 0, 0, 23551
	delay 10
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 5, 5, 23551
	playsewithpan SE_M_THUNDERBOLT2, 192
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 100, 24, 60, 10, 0, 1, 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 170, 24, 42, 11, 0, 1, 1
	delay 0
	createsprite gSparkElectricitySpriteTemplate, ANIM_ATTACKER, 0, 238, 24, 165, 10, 0, 1, 1
	delay 0
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 0, 0, 23551
	delay 20
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 7, 7, 23551
	playsewithpan SE_M_THUNDERBOLT2, 192
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 0, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 64, 20, 1, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 128, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 32, 12, 192, 20, 2, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 32, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 96, 20, 1, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 160, 20, 0, 0
	createsprite gSparkElectricityFlashingSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 16, 12, 224, 20, 2, 0
	delay 4
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 3, -31, 1, 0, 0, 23551
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 4
	playsewithpan SE_M_HYPER_BEAM, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, -31, 2, 0, 6, 23551
	call ElectricityEffect
	waitforvisualfinish
	end

Move_ATTRACT:: @ 81C985A
	loadspritegfx ANIM_TAG_RED_HEART
	loopsewithpan SE_M_CHARM, 192, 12, 3
	createvisualtask AnimTask_SwayMon, 5, 0, 12, 4096, 4, 0
	delay 15
	createsprite gRedHeartProjectileSpriteTemplate, ANIM_TARGET, 3, 20, -8
	waitforvisualfinish
	playsewithpan SE_M_ATTRACT, 63
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 160, -32
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -256, -40
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 128, -16
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -128, -22
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, -384, -31
	waitforvisualfinish
	waitplaysewithpan SE_M_ATTRACT2, 0, 15
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
	call GrowthEffect
	waitforvisualfinish
	call GrowthEffect
	waitforvisualfinish
	end

GrowthEffect:: @ 81C9960
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, RGB_WHITE
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -3, -3, 16, 0, 0
	return

Move_WHIRLWIND:: @ 81C9989
	loadspritegfx ANIM_TAG_WHIRLWIND_LINES
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, -8, 1, 60, 0
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 60, 1
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 8, 1, 60, 2
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 1, 60, 3
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 1, 60, 4
	createsprite gWhirlwindLineSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 1, 60, 0
	delay 5
	loopsewithpan SE_M_DOUBLE_TEAM, 63, 10, 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 15, 1
	delay 29
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 1, 12, 6, 1, 5
	delay 7
	playsewithpan SE_M_STRING_SHOT, 63
	createvisualtask AnimTask_SlideOffScreen, 5, 1, 8
	waitforvisualfinish
	end

Move_CONFUSE_RAY:: @ 81C9A31
	loadspritegfx ANIM_TAG_YELLOW_BALL
	monbg ANIM_DEF_PARTNER
	fadetobg 2
	waitbgfadein
	createvisualtask SoundTask_AdjustPanningVar, 2, -64, 63, 2, 0
	createvisualtask AnimTask_BlendColorCycleByTag, 2, ANIM_TAG_YELLOW_BALL, 0, 6, 0, 14, 351
	createsprite gConfuseRayBallBounceSpriteTemplate, ANIM_TARGET, 2, 28, 0, 288
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_M_STRING_SHOT2, 63
	createsprite gConfuseRayBallSpiralSpriteTemplate, ANIM_TARGET, 2, 0, -16
	waitforvisualfinish
	delay 0
	blendoff
	clearmonbg ANIM_DEF_PARTNER
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
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_PSYBEAM, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 16, 0
	loopsewithpan SE_M_CONFUSE_RAY, 63, 15, 4
	waitplaysewithpan SE_M_LEER, 63, 85
	createsprite gMeanLookEyeSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 120
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 16, 0, 0
	delay 30
	clearmonbg ANIM_DEF_PARTNER
	waitforvisualfinish
	end

Move_ROCK_THROW:: @ 81C9AFF
	loadspritegfx ANIM_TAG_ROCKS
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_TARGET, 2, 6, 1, 15, 1
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 0, 1, 0, 0
	playsewithpan SE_M_ROCK_THROW, 63
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 19, 1, 10, 0
	playsewithpan SE_M_ROCK_THROW, 63
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -23, 2, -10, 0
	playsewithpan SE_M_ROCK_THROW, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 5, 20, 1
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -15, 1, -10, 0
	playsewithpan SE_M_ROCK_THROW, 63
	delay 6
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 23, 2, 10, 0
	playsewithpan SE_M_ROCK_THROW, 63
	waitforvisualfinish
	end

Move_ROCK_SLIDE:: @ 81C9B8B
	loadspritegfx ANIM_TAG_ROCKS
	monbg ANIM_DEF_PARTNER
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 7, 1, 11, 1
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -5, 1, -5, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 5, 0, 6, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 19, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -23, 2, -10, 1
	playsewithpan SE_M_ROCK_THROW, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 5, 50, 1
	createvisualtask AnimTask_ShakeMon, 2, 3, 0, 5, 50, 1
	delay 2
	call RockSlideRocks
	call RockSlideRocks
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

RockSlideRocks:: @ 81C9C23
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 28, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -10, 1, -5, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 10, 0, 6, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 24, 1, 10, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -32, 2, -10, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, -20, 0, -10, 1
	playsewithpan SE_M_ROCK_THROW, 63
	delay 2
	createsprite gFallingRockSpriteTemplate, ANIM_TARGET, 2, 30, 2, 10, 1
	playsewithpan SE_M_ROCK_THROW, 63
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
	playsewithpan SE_M_VITAL_THROW, 63
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
	call BulbblebeamCreateBubbles
	createvisualtask AnimTask_SwayMon, 5, 0, 3, 3072, 8, 1
	call BulbblebeamCreateBubbles
	call BulbblebeamCreateBubbles
	waitforvisualfinish
	call WaterBubblesEffectShort
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

BulbblebeamCreateBubbles:: @ 81C9D4D
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 35, 70, 0, 256, 50
	playsewithpan SE_M_BUBBLE, 192
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 20, 40, -10, 256, 50
	playsewithpan SE_M_BUBBLE, 192
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 10, -60, 0, 256, 50
	playsewithpan SE_M_BUBBLE, 192
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 15, -15, 10, 256, 50
	playsewithpan SE_M_BUBBLE, 192
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 30, 10, -10, 256, 50
	playsewithpan SE_M_BUBBLE, 192
	delay 3
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 25, -30, 10, 256, 50
	playsewithpan SE_M_BUBBLE, 192
	delay 3
	return

Move_ICY_WIND:: @ 81C9DF0
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_ICE_SPIKES
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_BlendSelected, 10, 11, 4, 0, 4, RGB_BLACK
	fadetobg 15
	waitbgfadeout
	playsewithpan SE_M_ICY_WIND, 0
	waitbgfadein
	waitforvisualfinish
	panse_1B SE_M_GUST, 192, 63, 2, 0
	call IcyWindSwirlingSnowballs
	delay 5
	call IcyWindSwirlingSnowballs
	playsewithpan SE_M_GUST2, 63
	delay 55
	call IceSpikesEffectLong
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	restorebg
	waitbgfadeout
	createvisualtask AnimTask_BlendSelected, 10, 11, 4, 4, 0, RGB_BLACK
	waitbgfadein
	end

IcyWindSwirlingSnowballs:: @ 81C9E48
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, 0, 0, 0, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, 10, 0, 10, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, -10, 0, -10, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, 15, 0, 15, 72, 1
	delay 5
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_TARGET, 40, 0, -5, 0, -5, 72, 1
	return

Move_SMOKESCREEN:: @ 81C9EB0
	loadspritegfx ANIM_TAG_BLACK_SMOKE
	loadspritegfx ANIM_TAG_BLACK_BALL
	playsewithpan SE_M_DOUBLE_TEAM, 192
	createsprite gBlackBallSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 35, -25
	waitforvisualfinish
	createvisualtask AnimTask_SmokescreenImpact, 2, 
	delay 2
	playsewithpan SE_M_SAND_ATTACK, 63
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
	monbg ANIM_ATK_PARTNER
	monbgprio_28 0
	setalpha 16, 0
	delay 0
	playsewithpan SE_M_SWIFT, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, -24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, -24
	delay 3
	playsewithpan SE_M_SWIFT, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, -8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, -8
	delay 3
	playsewithpan SE_M_SWIFT, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, 8
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, 8
	delay 3
	playsewithpan SE_M_SWIFT, 192
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -24, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, -8, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 8, 24
	delay 3
	createsprite gConversionSpriteTemplate, ANIM_ATTACKER, 2, 24, 24
	delay 20
	playsewithpan SE_M_BARRIER, 192
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, 10018, 1, 1, 14335, 12, 0, 0
	delay 6
	createvisualtask AnimTask_ConversionAlphaBlend, 5, 
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

Move_CONVERSION_2:: @ 81CA0BE
	loadspritegfx ANIM_TAG_CONVERSION
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	setalpha 0, 16
	delay 0
	playsewithpan SE_M_BARRIER, 63
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
	playsewithpan SE_M_SWIFT, 63
	delay 10
	playsewithpan SE_M_SWIFT, 63
	delay 10
	playsewithpan SE_M_SWIFT, 63
	delay 10
	playsewithpan SE_M_SWIFT, 63
	delay 10
	playsewithpan SE_M_SWIFT, 63
	delay 10
	playsewithpan SE_M_SWIFT, 63
	delay 10
	playsewithpan SE_M_SWIFT, 63
	delay 10
	playsewithpan SE_M_SWIFT, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ROLLING_KICK:: @ 81CA1DA
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 1, 4
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 6
	playsewithpan SE_M_DOUBLE_TEAM, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	createsprite gSlidingKickSpriteTemplate, ANIM_ATTACKER, 2, -24, 0, 48, 10, 160, 0
	delay 5
	playsewithpan SE_M_VITAL_THROW2, 63
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
	playsewithpan SE_M_HEADBUTT, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	end

Move_HORN_ATTACK:: @ 81CA2BA
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 0, 0, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_M_HORN_ATTACK, 63
	waitforvisualfinish
	end

Move_FURY_ATTACK:: @ 81CA327
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 4, 256, 0, 2
	choosetwoturnanim FuryAttackRight, FuryAttackLeft
FuryAttackContinue:: @ 81CA345
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	waitforvisualfinish
	end

FuryAttackRight:: @ 81CA358
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 8, 8, 10
	waitforvisualfinish
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_M_HORN_ATTACK, 63
	goto FuryAttackContinue

FuryAttackLeft:: @ 81CA37E
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, -8, -8, 10
	waitforvisualfinish
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_M_HORN_ATTACK, 63
	goto FuryAttackContinue

Move_HORN_DRILL:: @ 81CA3A4
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HORN_HIT
	jumpifcontest HornDrillInContest
	fadetobg 7
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 768, 1, -1
HornDrillContinue:: @ 81CA3C1
	waitbgfadein
	setalpha 12, 8
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_HEADBUTT, 192
	waitforvisualfinish
	delay 2
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 1
	createsprite gHornHitSpriteTemplate, ANIM_TARGET, 4, 0, 0, 12
	waitforvisualfinish
	playse SE_BANG
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 40, 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 3
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 2, 1, 3
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -4, 3, 1, 3
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -8, -5, 1, 3
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 4, -12, 1, 3
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 16, 0, 1, 3
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 5, 18, 1, 3
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -17, 12, 1, 2
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -21, -15, 1, 2
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 8, -27, 1, 2
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 32, 0, 1, 2
	playsewithpan SE_M_HORN_ATTACK, 63
	delay 4
	createsprite gBowMonSpriteTemplate, ANIM_ATTACKER, 2, 2
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

HornDrillInContest:: @ 81CA50A
	fadetobg 8
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 2304, 768, 0, -1
	goto HornDrillContinue

Move_THRASH:: @ 81CA521
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	createvisualtask AnimTask_ThrashMoveMonHorizontal, 2, 
	createvisualtask AnimTask_ThrashMoveMonVertical, 2, 
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 7, 1
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 28
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 4, 0, 7, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 28
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_TARGET, 3, 1, 10, 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, 63
	end

Move_SING:: @ 81CA5A0
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2, 
	waitforvisualfinish
	panse_1B SE_M_SING, 192, 63, 2, 0
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
	clearmonbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2, 
	waitforvisualfinish
	end

Move_LOW_KICK:: @ 81CA674
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	createsprite gSlidingKickSpriteTemplate, ANIM_TARGET, 2, -24, 28, 40, 8, 160, 0
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -8, 8, 1, 2
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 6, 384, 1, 2
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 4
	end

Move_EARTHQUAKE:: @ 81CA6D1
	createvisualtask AnimTask_HorizontalShake, 5, 5, 10, 50
	createvisualtask AnimTask_HorizontalShake, 5, 4, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 0
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	end

Move_FISSURE:: @ 81CA71E
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask AnimTask_HorizontalShake, 3, 5, 10, 50
	createvisualtask AnimTask_HorizontalShake, 3, 1, 10, 50
	playsewithpan SE_M_EARTHQUAKE, 63
	delay 8
	call FissureDirtPlumeFar
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 15
	call FissureDirtPlumeClose
	delay 15
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 15
	call FissureDirtPlumeFar
	delay 50
	fadetobg BG_FISSURE
	waitbgfadeout
	createvisualtask AnimTask_PositionFissureBgOnBattler, 5, 1, 5, -1
	waitbgfadein
	delay 40
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

FissureDirtPlumeFar:: @ 81CA79F
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 12, -48, -16, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 16, -16, -10, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 14, -52, -18, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 12, -32, -16, 24
	playsewithpan SE_M_DIG, 63
	return

FissureDirtPlumeClose:: @ 81CA7F0
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 12, -24, -16, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 16, -38, -10, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 14, -20, -18, 24
	createsprite gDirtPlumeSpriteTemplate, ANIM_TARGET, 2, 1, 1, 12, -36, -16, 24
	playsewithpan SE_M_DIG, 63
	return

Move_DIG:: @ 81CA841
	choosetwoturnanim DigSetUp, DigUnleash
DigEnd:: @ 81CA84A
	end

DigSetUp:: @ 81CA84B
	loadspritegfx ANIM_TAG_MUD_SAND
	loadspritegfx ANIM_TAG_DIRT_MOUND
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 180
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 1, 180
	monbg_22 0
	delay 1
	createvisualtask AnimTask_DigDownMovement, 2, 0
	delay 6
	call DigThrowDirt
	call DigThrowDirt
	call DigThrowDirt
	call DigThrowDirt
	call DigThrowDirt
	waitforvisualfinish
	clearmonbg_23 0
	delay 1
	createvisualtask AnimTask_DigDownMovement, 2, 1
	goto DigEnd

DigUnleash:: @ 81CA8A6
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_DIRT_MOUND
	createvisualtask AnimTask_DigUpMovement, 2, 0
	waitforvisualfinish
	monbg ANIM_ATTACKER
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 48
	createsprite gDirtMoundSpriteTemplate, ANIM_ATTACKER, 1, 0, 1, 48
	delay 1
	createvisualtask AnimTask_DigUpMovement, 2, 1
	delay 16
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	playsewithpan SE_M_MEGA_KICK2, 192
	clearmonbg ANIM_ATTACKER
	goto DigEnd

DigThrowDirt:: @ 81CA90A
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 12, 4, -16, 18
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 16, 4, -10, 18
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 14, 4, -18, 18
	createsprite gDirtPlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 12, 4, -16, 18
	playsewithpan SE_M_DIG, 192
	delay 32
	return

Move_MEDITATE:: @ 81CA95D
	call SetPsychicBackground
	createvisualtask AnimTask_MeditateStretchAttacker, 2
	playsewithpan SE_M_HEADBUTT, 192
	delay 16
	playsewithpan SE_M_TAKE_DOWN, 192
	waitforvisualfinish
	call UnsetPsychicBg
	end

Move_AGILITY:: @ 81CA97A
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 24, 6, 4, 4
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 7, 10
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 12
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 12
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

Move_QUICK_ATTACK:: @ 81CA9C4
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 24, 6, 1, 5
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 7, 3
	playsewithpan SE_M_JUMP_KICK, 192
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, 1, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
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
	playsewithpan SE_M_SWAGGER2, 192
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, -28
	playsewithpan SE_M_SWAGGER2, 192
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 1, 1, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	clearmonbg 1
	end

Move_TELEPORT:: @ 81CAA92
	call SetPsychicBackground
	createvisualtask AnimTask_Teleport, 2 
	playsewithpan SE_M_TELEPORT, 192
	delay 15
	call UnsetPsychicBg
	waitforvisualfinish
	end

Move_DOUBLE_TEAM:: @ 81CAAAB
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_DoubleTeam, 2, 
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 32
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 24
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, 192
	delay 8
	playsewithpan SE_M_DOUBLE_TEAM, 192
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

Move_MINIMIZE:: @ 81CAAF2
	setalpha 10, 8
	createvisualtask AnimTask_Minimize, 2, 
	loopsewithpan SE_M_MINIMIZE, 192, 34, 3
	waitforvisualfinish
	blendoff
	end

Move_METRONOME:: @ 81CAB05
	loadspritegfx ANIM_TAG_FINGER
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 100
	playsewithpan SE_M_METRONOME, 192
	delay 6
	createsprite gMetronomeFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 24
	loopsewithpan SE_M_TAIL_WHIP, 192, 22, 3
	waitforvisualfinish
	end

Move_SKULL_BASH:: @ 81CAB2F
	choosetwoturnanim SkullBashSetUp, SkullBashAttack
SkullBashEnd:: @ 81CAB38
	end

SkullBashSetUp:: @ 81CAB39
	call SkullBashSetUpHeadDown
	call SkullBashSetUpHeadDown
	waitforvisualfinish
	goto SkullBashEnd

SkullBashSetUpHeadDown:: @ 81CAB49
	createsprite gSlideMonToOffsetAndBackSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 0, 0, 10, 0
	playsewithpan SE_M_TAKE_DOWN, 192
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 2, 16, 96, 0, 2
	waitforvisualfinish
	createsprite gSlideMonToOffsetAndBackSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 10, 1
	waitforvisualfinish
	return

SkullBashAttack:: @ 81CAB86
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SkullBashPosition, 2, 0
	playsewithpan SE_M_TAKE_DOWN, 192
	waitforvisualfinish
	playse SE_BANG
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 40, 1
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, 1, 0
	loopsewithpan SE_M_MEGA_KICK2, 63, 8, 3
	waitforvisualfinish
	createvisualtask AnimTask_SkullBashPosition, 2, 1
	goto SkullBashEnd

Move_AMNESIA:: @ 81CABF5
	loadspritegfx ANIM_TAG_AMNESIA
	call SetPsychicBackground
	delay 8
	createsprite gQuestionMarkSpriteTemplate, ANIM_ATTACKER, 20 
	playsewithpan SE_M_METRONOME, 192
	delay 54
	loopsewithpan SE_M_METRONOME, 192, 16, 3
	waitforvisualfinish
	call UnsetPsychicBg
	end

Move_KINESIS:: @ 81CAC19
	loadspritegfx ANIM_TAG_ALERT
	loadspritegfx ANIM_TAG_BENT_SPOON
	playsewithpan SE_M_PSYBEAM, 192
	call SetPsychicBackground
	createsprite gBentSpoonSpriteTemplate, ANIM_ATTACKER, 20
	createsprite gKinesisZapEnergySpriteTemplate, ANIM_ATTACKER, 19, 32, -8, 0
	createsprite gKinesisZapEnergySpriteTemplate, ANIM_ATTACKER, 19, 32, 16, 1
	loopsewithpan SE_M_CONFUSE_RAY, 192, 21, 2
	delay 60
	playsewithpan SE_M_DIZZY_PUNCH, 192
	delay 30
	loopsewithpan SE_M_DIZZY_PUNCH, 192, 20, 2
	delay 70
	playsewithpan SE_M_SWAGGER2, 192
	waitforvisualfinish
	call UnsetPsychicBg
	end

Move_GLARE:: @ 81CAC6A
	loadspritegfx ANIM_TAG_SMALL_RED_EYE
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createvisualtask AnimTask_GlareEyeDots, 5, 0
	playsewithpan SE_M_PSYBEAM2, 192
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 5, 1, 0, 0, 16, RGB_BLACK
	waitforvisualfinish
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	createvisualtask AnimTask_ScaryFace, 5, 
	playsewithpan SE_M_LEER, 192
	delay 2
	createvisualtask AnimTask_ShakeTargetInPattern, 3, 20, 1, 0
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 5, 1, 0, 16, 0, RGB_BLACK
	end

Move_BARRAGE:: @ 81CACD3
	loadspritegfx ANIM_TAG_RED_BALL
	createvisualtask AnimTask_BarrageBall, 3, 
	playsewithpan SE_M_SWAGGER, 192
	delay 24
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, 1, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, 3, 0, 4, 20, 1
	loopsewithpan SE_M_STRENGTH, 63, 8, 2
	end

Move_SKY_ATTACK:: @ 81CAD1B
	choosetwoturnanim SkyAttackSetUp, SkyAttackUnleash
SkyAttackEnd:: @ 81CAD24
	end

SkyAttackSetUp:: @ 81CAD25
	monbg ANIM_DEF_PARTNER
	setalpha 12, 11
	createvisualtask AnimTask_GetTargetIsAttackerPartner, 5, 7
	jumpargeq 7, 0, SkyAttackSetUpAgainstOpponent
	goto SkyAttackSetUpAgainstPartner

SkyAttackSetUpAgainstOpponent:: @ 81CAD40
	createvisualtask AnimTask_BlendSelected, 10, 27, 1, 0, 12, RGB_BLACK
	waitforvisualfinish
	delay 12
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 8, 0, RGB_BLACK
	createvisualtask AnimTask_HorizontalShake, 5, 0, 2, 16
	loopsewithpan SE_M_STAT_INCREASE, 192, 4, 8
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 15, RGB_WHITE
	delay 20
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 15, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 25, 1, 8, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto SkyAttackEnd

SkyAttackSetUpAgainstPartner:: @ 81CADB7
	createvisualtask AnimTask_BlendExcept, 10, 1, 1, 0, 12, 0
	waitforvisualfinish
	delay 12
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 8, 0, RGB_BLACK
	createvisualtask AnimTask_HorizontalShake, 5, 0, 2, 16
	playsewithpan SE_M_STAT_INCREASE, 192
	delay 8
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 0, 15, RGB_WHITE
	delay 20
	createvisualtask AnimTask_BlendSelected, 10, 2, 1, 15, 0, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_BlendExcept, 10, 4, 1, 8, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto SkyAttackEnd

SkyAttackUnleash:: @ 81CAE2E
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_BIRD
	call SetSkyBg
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 0, 16, RGB_WHITE
	delay 4
	createvisualtask AnimTask_AttackerFadeToInvisible, 5, 0
	waitforvisualfinish
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_SKY_UPPERCUT, -64
	createsprite gSkyAttackBirdSpriteTemplate, ANIM_TARGET, 2
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, 1, 10, 0, 18, 1
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, 63
	delay 20
	createvisualtask AnimTask_AttackerFadeFromInvisible, 5, 1
	delay 2
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 15, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	call UnsetSkyBg
	goto SkyAttackEnd

Move_FLASH:: @ 81CAEB3
	playsewithpan SE_M_LEER, 192
	createvisualtask AnimTask_Flash, 2
	waitforvisualfinish
	end

Move_SPLASH:: @ 81CAEC0
	createvisualtask AnimTask_Splash, 2, 0, 3
	delay 8
	loopsewithpan SE_M_TAIL_WHIP, 192, 38, 3
	waitforvisualfinish
	end

Move_ACID_ARMOR:: @ 81CAED5
	monbg ANIM_ATTACKER
	setalpha 15, 0
	createvisualtask AnimTask_AcidArmor, 2, 0
	playsewithpan SE_M_ACID_ARMOR, 192
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATTACKER
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
	playsewithpan SE_M_DRAGON_RAGE, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 3, 0, 48, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, 0, 1247, 12, 4, 1
	waitforvisualfinish
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 4
	createsprite gSuperFangSpriteTemplate, ANIM_TARGET, 2, 
	playsewithpan SE_M_BITE, 63
	delay 8
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 2143, 14, RGB_WHITE, 14
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 7, 12, 1
	waitforvisualfinish
	blendoff
	end

Move_SLASH:: @ 81CAF7B
	loadspritegfx ANIM_TAG_SLASH
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, -8, 0
	playsewithpan SE_M_RAZOR_WIND, 63
	delay 4
	createsprite gSlashSliceSpriteTemplate, ANIM_TARGET, 2, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 18, 1
	playsewithpan SE_M_RAZOR_WIND, 63
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
	loopsewithpan SE_M_HEADBUTT, 192, 12, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SKETCH:: @ 81CB01B
	loadspritegfx ANIM_TAG_PENCIL
	monbg 1
	createvisualtask AnimTask_SketchDrawMon, 2
	createsprite gPencilSpriteTemplate, ANIM_TARGET, 2, 
	waitforvisualfinish
	clearmonbg 1
	createvisualtask AnimTask_Splash, 2, 0, 2
	loopsewithpan SE_M_TAIL_WHIP, 192, 38, 2
	end

Move_NIGHTMARE:: @ 81CB043
	fadetobg 2
	waitbgfadein
	jumpifcontest NightmareInContest
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_NightmareClone, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 40, 1
	playsewithpan SE_M_NIGHTMARE, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	restorebg
	waitbgfadein
	end

NightmareInContest:: @ 81CB06F
	createvisualtask AnimTask_BlendMonInAndOut, 2, 0, RGB_WHITE, 10, 2, 1
	createvisualtask AnimTask_ShakeMon, 2, 0, 3, 0, 32, 1
	playsewithpan SE_M_NIGHTMARE, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_FLAIL:: @ 81CB099
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_FlailMovement, 2, 0
	loopsewithpan SE_M_HEADBUTT, 192, 8, 2
	waitforvisualfinish
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 3
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 30, 1, 0
	playsewithpan SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SPITE:: @ 81CB0D6
	fadetobg 2
	playsewithpan SE_M_PSYBEAM, 192
	waitbgfadein
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 6, 0, 8, RGB_WHITE
	createvisualtask AnimTask_SpiteTargetShadow, 2
	loopsewithpan SE_M_PSYBEAM, 63, 20, 3
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg 1
	end

Move_MACH_PUNCH:: @ 81CB105
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_GetAttackerSide, 2, 
	jumpargeq 7, 1, MachPunchOnPlayer
	fadetobg BG_HIGHSPEED_OPPONENT

MachPunchContinue:: @ 81CB11E
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 0, 1, -1
	waitbgfadein
	delay 0
	setalpha 9, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, 28968, 10
	playsewithpan SE_M_JUMP_KICK, 192
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

MachPunchOnPlayer:: @ 81CB186
	fadetobg BG_HIGHSPEED_PLAYER
	goto MachPunchContinue

Move_FORESIGHT:: @ 81CB18D
	loadspritegfx ANIM_TAG_MAGNIFYING_GLASS
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 16, 0
	createsprite gForesightMagnifyingGlassSpriteTemplate, ANIM_TARGET, 2, 1
	delay 17
	loopsewithpan SE_M_SKETCH, 63, 16, 4
	delay 48
	delay 24
	playsewithpan SE_M_SKETCH, 63
	delay 10
	createvisualtask AnimTask_BlendMonInAndOut, 5, 1, RGB_WHITE, 12, 2, 1
	playsewithpan SE_M_DETECT, 63
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	end

Move_DESTINY_BOND:: @ 81CB1CC
	loadspritegfx ANIM_TAG_WHITE_SHADOW
	fadetobg 2
	playsewithpan SE_M_PSYBEAM, 192
	waitbgfadein
	createvisualtask AnimTask_DestinyBondWhiteShadow, 5, 0, 48
	playsewithpan SE_M_CONFUSE_RAY, 192
	delay 48
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 24, 1
	createvisualtask AnimTask_BlendExcept, 2, 6, 1, 0, 12, 30653
	delay 24
	createvisualtask AnimTask_BlendExcept, 2, 6, 1, 12, 0, 30653
	playsewithpan SE_M_NIGHTMARE, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	blendoff
	clearmonbg 5
	end

Move_ENDURE:: @ 81CB227
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_M_DRAGON_RAGE, 192
	call EndureEffect
	delay 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	call EndureEffect
	delay 8
	call EndureEffect
	waitforvisualfinish
	end

EndureEffect:: @ 81CB267
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
	playsewithpan SE_M_CHARM, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, 192
	waitforvisualfinish
	end

Move_ROLLOUT:: @ 81CB2FE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_MUD_SAND
	loadspritegfx ANIM_TAG_ROCKS
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_Rollout, 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 30, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 1, 2
	playsewithpan SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_FALSE_SWIPE:: @ 81CB33F
	loadspritegfx ANIM_TAG_SLASH_2
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gFalseSwipeSliceSpriteTemplate, ANIM_TARGET, 2, 
	playsewithpan SE_M_VITAL_THROW, 63
	delay 16
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 0
	playsewithpan SE_M_DOUBLE_TEAM, 63
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 16
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 32
	playsewithpan SE_M_DOUBLE_TEAM, 63
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 48
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 64
	playsewithpan SE_M_DOUBLE_TEAM, 63
	delay 2
	createsprite gFalseSwipePositionedSliceSpriteTemplate, ANIM_TARGET, 2, 80
	delay 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 0, 0, 1, 3
	playsewithpan SE_M_COMET_PUNCH, 63
	end

Move_SWAGGER:: @ 81CB3C6
	loadspritegfx ANIM_TAG_BREATH
	loadspritegfx ANIM_TAG_ANGER
	createvisualtask AnimTask_GrowAndShrink, 2, 
	playsewithpan SE_M_SWAGGER, 192
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2, 
	loopsewithpan SE_M_SWAGGER, 192, 4, 2
	waitforvisualfinish
	delay 24
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_M_SWAGGER2, 63
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, 63
	waitforvisualfinish
	end

Move_MILK_DRINK:: @ 81CB40E
	loadspritegfx ANIM_TAG_MILK_BOTTLE
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg 1
	createsprite gMilkBottleSpriteTemplate, ANIM_ATTACKER, 2, 
	delay 40
	playsewithpan SE_M_CRABHAMMER, 192
	delay 12
	playsewithpan SE_M_CRABHAMMER, 192
	delay 20
	playsewithpan SE_M_CRABHAMMER, 192
	waitforvisualfinish
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	playsewithpan SE_M_MILK_DRINK, 192
	waitforvisualfinish
	clearmonbg 1
	call HealingEffect2
	waitforvisualfinish
	end

Move_MAGNITUDE:: @ 81CB450
	createvisualtask AnimTask_IsPowerOver99, 2, 
	waitforvisualfinish
	jumpargeq 15, 0, MagnitudeRegular
	jumpargeq 15, 1, MagnitudeIntense
MagnitudeEnd:: @ 81CB468
	end

MagnitudeRegular:: @ 81CB469
	createvisualtask AnimTask_HorizontalShake, 5, 5, 0, 50
	createvisualtask AnimTask_HorizontalShake, 5, 4, 0, 50
	loopsewithpan SE_M_STRENGTH, 63, 8, 10
	goto MagnitudeEnd

MagnitudeIntense:: @ 81CB48E
	createvisualtask AnimTask_HorizontalShake, 5, 5, 0, 50
	createvisualtask AnimTask_HorizontalShake, 5, 4, 0, 50
	loopsewithpan SE_M_STRENGTH, 63, 8, 10
	delay 10
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	delay 16
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, 0, 14, RGB_WHITE, 14
	goto MagnitudeEnd

Move_RAPID_SPIN:: @ 81CB4E1
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_RAPID_SPIN
	monbg ANIM_ATTACKER
	createsprite gRapidSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 32, -32, 40, -2
	createvisualtask AnimTask_RapinSpinMonElevation, 2, 0, 2, 0
	loopsewithpan SE_M_RAZOR_WIND2, 192, 8, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 10, 1, 0
	playsewithpan SE_M_DOUBLE_SLAP, 63
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_RapinSpinMonElevation, 2, 0, 2, 1
	loopsewithpan SE_M_RAZOR_WIND2, 192, 8, 4
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

Move_MOONLIGHT:: @ 81CB54E
	loadspritegfx ANIM_TAG_MOON
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 16, 0
	waitforvisualfinish
	createsprite gMoonSpriteTemplate, ANIM_ATTACKER, 2, 120, 56
	createvisualtask AnimTask_AlphaFadeIn, 3, 0, 16, 16, 0, 1
	playsewithpan SE_M_MOONLIGHT, 0
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
	call HealingEffect
	waitforvisualfinish
	end

Move_EXTREME_SPEED:: @ 81CB5DE
	loadspritegfx ANIM_TAG_SPEED_DUST
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_GetAttackerSide, 2, 
	jumpargeq 7, 1, ExtremeSpeedOnPlayer
	fadetobg BG_HIGHSPEED_OPPONENT

ExtremeSpeedContinue:: @ 81CB5F5
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 0, 1, -1
	waitbgfadein
	createvisualtask AnimTask_StretchAttacker, 2
	loopsewithpan SE_M_RAZOR_WIND2, 192, 8, 3
	waitforvisualfinish
	delay 1
	createvisualtask AnimTask_SetAttackerInvisibleWaitForSignal, 2
	monbg ANIM_TARGET
	setalpha 12, 8
	delay 18
	createvisualtask AnimTask_ExtremeSpeedImpact, 2, 
	delay 2
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, 1, 0, -12, 3
	delay 10
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, 1, 0, 12, 3
	delay 10
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gMonEdgeHitSplatSpriteTemplate, ANIM_TARGET, 2, 1, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_SpeedDust, 2, 
	delay 10
	createvisualtask AnimTask_ExtremeSpeedMonReappear, 2, 
	loopsewithpan SE_M_DOUBLE_TEAM, 192, 8, 4
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

ExtremeSpeedOnPlayer:: @ 81CB695
	fadetobg BG_HIGHSPEED_PLAYER
	goto ExtremeSpeedContinue

Move_UPROAR:: @ 81CB69C
	loadspritegfx ANIM_TAG_JAGGED_MUSIC_NOTE
	loadspritegfx ANIM_TAG_THIN_RING
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_M_UPROAR, 192
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 29, -12, 0
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -12, -29, 1
	delay 16
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_M_UPROAR, 192
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 12, -29, 1
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -29, -12, 0
	delay 16
	createvisualtask AnimTask_UproarDistortion, 2, 0
	createsprite gUproarRingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_M_UPROAR, 192
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, -24, 1
	createsprite gJaggedMusicNoteSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, -24, 0
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_HEAT_WAVE:: @ 81CB766
	loadspritegfx ANIM_TAG_FLYING_DIRT
	createvisualtask AnimTask_BlendParticle, 5, 10261, 0, 6, 6, 31
	createvisualtask AnimTask_LoadSandstormBackground, 5, 1
	createvisualtask AnimTask_BlendBackground, 6, 6, 31
	panse_1B SE_M_HEAT_WAVE, 192, 63, 2, 0
	delay 4
	createvisualtask AnimTask_MoveHeatWaveTargets, 5
	delay 12
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 10, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 90, 2048, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 50, 2560, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 20, 2304, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 70, 1984, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 0, 2816, 96, 1
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 60, 2560, 96, 1
	end

Move_HAIL:: @ 81CB816
	loadspritegfx ANIM_TAG_HAIL
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createvisualtask AnimTask_BlendSelected, 10, 1, 3, 0, 6, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_Hail1, 5, 
	loopsewithpan SE_M_HAIL, 0, 8, 10
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
	playsewithpan SE_M_SWAGGER2, 63
	delay 20
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, 63
	end

Move_MEMENTO:: @ 81CB892
	setalpha 0, 16
	delay 1
	createvisualtask AnimTask_InitMementoShadow, 2
	delay 1
	createvisualtask AnimTask_MoveAttackerMementoShadow, 5
	playsewithpan SE_M_PSYBEAM, 192
	delay 48
	playsewithpan SE_M_PSYBEAM2, 192
	waitforvisualfinish
	createvisualtask sub_80B8664, 2, 
	delay 12
	setalpha 0, 16
	delay 1
	monbg_22 1
	createvisualtask AnimTask_MoveTargetMementoShadow, 5
	playsewithpan SE_M_PSYBEAM, 63
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
	loopsewithpan SE_M_SWAGGER, 192, 24, 3
	end

Move_SMELLING_SALT:: @ 81CB8F6
	loadspritegfx ANIM_TAG_TAG_HAND
	loadspritegfx ANIM_TAG_SMELLINGSALT_EFFECT
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, 1, 0, 2
	createsprite gSmellingSaltsHandSpriteTemplate, ANIM_TARGET, 2, 1, 1, 2
	delay 32
	createvisualtask AnimTask_SmellingSaltsSquish, 3, 1, 2
	loopsewithpan SE_M_DOUBLE_SLAP, 63, 12, 2
	waitforvisualfinish
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 6, 2
	createsprite gSmellingSaltExclamationSpriteTemplate, ANIM_TARGET, 2, 1, 8, 3
	loopsewithpan SE_M_SWAGGER2, 63, 16, 3
	end

Move_FOLLOW_ME:: @ 81CB951
	loadspritegfx ANIM_TAG_FINGER
	createsprite gFollowMeFingerSpriteTemplate, ANIM_ATTACKER, 2, 0
	playsewithpan SE_M_TAIL_WHIP, 192
	delay 18
	playsewithpan SE_M_ATTRACT, 192
	delay 71
	loopsewithpan SE_M_TAIL_WHIP, 192, 22, 3
	end

Move_CHARGE:: @ 81CB970
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 0
	waitforvisualfinish
	createvisualtask AnimTask_ElectricChargingParticles, 2, 0, 60, 2, 12
	playsewithpan SE_M_CHARGE, 192
	delay 30
	playsewithpan SE_M_CHARGE, 192
	delay 30
	playsewithpan SE_M_CHARGE, 192
	createsprite gGrowingChargeOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	delay 25
	playsewithpan SE_M_CHARGE, 192
	delay 20
	playsewithpan SE_M_CHARGE, 192
	delay 15
	playsewithpan SE_M_CHARGE, 192
	delay 10
	delay 6
	loopsewithpan SE_M_CHARGE, 192, 6, 5
	waitforvisualfinish
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	playsewithpan SE_M_THUNDERBOLT2, 192
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 4, 0, 0
	clearmonbg ANIM_ATTACKER
	blendoff
	end

Move_TAUNT:: @ 81CBA0B
	loadspritegfx ANIM_TAG_FINGER_2
	loadspritegfx ANIM_TAG_THOUGHT_BUBBLE
	loadspritegfx ANIM_TAG_ANGER
	createsprite gThoughtBubbleSpriteTemplate, ANIM_ATTACKER, 11, 0, 45
	playsewithpan SE_M_METRONOME, 192
	delay 6
	createsprite gTauntFingerSpriteTemplate, ANIM_ATTACKER, 12, 0
	delay 4
	loopsewithpan SE_M_TAIL_WHIP, 192, 16, 2
	waitforvisualfinish
	delay 8
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -28
	playsewithpan SE_M_SWAGGER2, 63
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -28
	playsewithpan SE_M_SWAGGER2, 63
	end

Move_HELPING_HAND:: @ 81CBA5F
	loadspritegfx ANIM_TAG_TAG_HAND
	createvisualtask AnimTask_HelpingHandAttackerMovement, 5, 
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 0
	createsprite gHelpingHandClapSpriteTemplate, ANIM_ATTACKER, 40, 1
	delay 19
	playsewithpan SE_M_ENCORE, 0
	createvisualtask AnimTask_ShakeMon2, 2, 2, 2, 0, 5, 1
	delay 14
	playsewithpan SE_M_ENCORE, 0
	createvisualtask AnimTask_ShakeMon2, 2, 2, 2, 0, 5, 1
	delay 20
	playsewithpan SE_M_ENCORE, 0
	createvisualtask AnimTask_ShakeMon2, 2, 2, 3, 0, 10, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, 2, 1023, 12, 1, 1
	end

Move_ASSIST:: @ 81CBAD2
	loadspritegfx ANIM_TAG_PAW_PRINT
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 112, -16, 140, 128, 36
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 208, 128, -16, 48, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 112, 256, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, 108, 128, 84, -16, 36
	playsewithpan SE_M_SCRATCH, 0
	delay 2
	createsprite gAssistPawprintSpriteTemplate, ANIM_ATTACKER, 50, -16, 56, 256, 56, 36
	playsewithpan SE_M_SCRATCH, 0
	end

Move_SUPERPOWER:: @ 81CBB43
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_METEOR
	loadspritegfx ANIM_TAG_FLAT_ROCK
	monbg ANIM_ATK_PARTNER
	monbgprio_28 0
	setalpha 12, 8
	createsprite gSuperpowerOrbSpriteTemplate, ANIM_TARGET, 2, 0
	playsewithpan SE_M_MEGA_KICK, 192
	delay 20
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 180, 1
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_EARTHQUAKE, 0
	delay 40
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 200, 96, 1, 120
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 20, 248, 4, 112
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 130, 160, 2, 104
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 160, 192, 0, 96
	delay 8
	createsprite gSuperpowerRockSpriteTemplate, ANIM_ATTACKER, 41, 60, 288, 3, 88
	delay 74
	createsprite gSuperpowerFireballSpriteTemplate, ANIM_TARGET, 3, 0        
	playsewithpan SE_M_SWAGGER, 192
	delay 16
	createvisualtask AnimTask_ShakeMon2, 2, 1, 8, 0, 16, 1
	playsewithpan SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	end

Move_RECYCLE:: @ 81CBBFE
	loadspritegfx ANIM_TAG_RECYCLE
	monbg ANIM_ATTACKER
	setalpha 0, 16
	delay 1
	createsprite gRecycleSpriteTemplate, ANIM_ATTACKER, 2, 
	loopsewithpan SE_M_TAKE_DOWN, 192, 24, 3
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, RGB_WHITE, 12, 2, 1
	playsewithpan SE_M_TAKE_DOWN, 192
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATTACKER
	delay 1
	end

Move_BRICK_BREAK:: @ 81CBC32
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_TORN_METAL
	choosetwoturnanim BrickBreakNormal, BrickBreakShatteredWall

BrickBreakNormal:: @ 81CBC47
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 4
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -18, -18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, -18, -18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, 63
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, 18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 18, 18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, 63
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, 0, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 6, 0
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 6, 0, 0
	waitforvisualfinish
	clearmonbg 1
	end

BrickBreakShatteredWall:: @ 81CBD16
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 4
	createsprite gBrickBreakWallSpriteTemplate, ANIM_ATTACKER, 3, 1, 0, 0, 90, 10
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -18, -18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, -18, -18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, 63
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 18, 18, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 18, 18, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW, 63
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, 0, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 6, 0
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 10, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, -8, -12
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 8, -12
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, -8, 12
	createsprite gBrickBreakWallShardSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 8, 12
	playsewithpan SE_M_BRICK_BREAK, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 6, 0, 0
	waitforvisualfinish
	clearmonbg 1
	end

Move_YAWN:: @ 81CBE37
	loadspritegfx ANIM_TAG_PINK_CLOUD
	createvisualtask AnimTask_DeepInhale, 2, 0
	playsewithpan SE_M_YAWN, 192
	waitforvisualfinish
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 2
	playsewithpan SE_M_SPIT_UP, 192
	delay 4
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 1
	delay 4
	createsprite gYawnCloudSpriteTemplate, ANIM_TARGET, 5, 0
	waitforvisualfinish
	createvisualtask AnimTask_DeepInhale, 2, 1
	playsewithpan SE_M_YAWN, 63
	end

Move_ENDEAVOR:: @ 81CBE7A
	loadspritegfx ANIM_TAG_SWEAT_DROP
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_SquishAndSweatDroplets, 2, 0, 2
	loopsewithpan SE_M_TAIL_WHIP, 192, 24, 2
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 703, 12, 1, 2
	delay 6
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, 0, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 12, -12, 1, 2
	playsewithpan SE_M_DOUBLE_SLAP, 63
	delay 24
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 5, 0, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -12, 12, 1, 2
	playsewithpan SE_M_COMET_PUNCH, 63
	end

Move_ERUPTION:: @ 81CBEEF
	loadspritegfx ANIM_TAG_WARM_ROCK
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 2, 0, 4, 31
	waitforvisualfinish
	createvisualtask AnimTask_EruptionLaunchRocks, 2
	waitplaysewithpan SE_M_EXPLOSION, 192, 60
	waitforvisualfinish
	createvisualtask AnimTask_EruptionLaunchRocks, 2
	waitplaysewithpan SE_M_EXPLOSION, 192, 60
	waitforvisualfinish
	delay 30
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 200, -32, 0, 100, 0
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 30, -32, 16, 90, 1
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 150, -32, 32, 60, 2
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 90, -32, 48, 80, 3
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 110, -32, 64, 50, 0
	createsprite gEruptionFallingRockSpriteTemplate, ANIM_ATTACKER, 40, 60, -32, 80, 70, 1
	delay 22
	createvisualtask AnimTask_HorizontalShake, 5, 5, 8, 60
	createvisualtask AnimTask_HorizontalShake, 5, 4, 8, 60
	loopsewithpan SE_M_ROCK_THROW, 63, 16, 12
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 40, 31, 4, 4, 0, 31
	end

Move_SKILL_SWAP:: @ 81CBFBC
	loadspritegfx ANIM_TAG_BLUEGREEN_ORB
	call SetPsychicBackground
	createvisualtask AnimTask_SkillSwap, 3, 1
	createvisualtask AnimTask_BlendMonInAndOut, 5, 1, RGB_WHITE, 12, 3, 1
	loopsewithpan SE_M_REVERSAL, 192, 24, 3
	delay 16
	createvisualtask AnimTask_SkillSwap, 3, 0
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, RGB_WHITE, 12, 3, 1
	waitforvisualfinish
	call UnsetPsychicBg
	end

Move_IMPRISON:: @ 81CC007
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	loadspritegfx ANIM_TAG_X_SIGN
	call SetPsychicBackground
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_ImprisonOrbs, 5
	delay 8
	loopsewithpan SE_M_HORN_ATTACK, 192, 8, 5
	waitforvisualfinish
	delay 4
	createsprite gRedXSpriteTemplate, ANIM_ATTACKER, 5, 0, 40
	createvisualtask AnimTask_HorizontalShake, 5, 4, 1, 10
	playsewithpan SE_M_HYPER_BEAM, 192
	clearmonbg ANIM_DEF_PARTNER
	call UnsetPsychicBg
	end

Move_GRUDGE:: @ 81CC04A
	loadspritegfx ANIM_TAG_PURPLE_FLAME
	monbg ANIM_ATTACKER
	monbgprio_29
	fadetobg 2
	playsewithpan SE_M_PSYBEAM, 192
	waitbgfadein
	createvisualtask AnimTask_GrudgeFlames, 3
	loopsewithpan SE_M_EMBER, 192, 16, 4
	delay 10
	delay 80
	playsewithpan SE_M_NIGHTMARE, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_ATTACKER
	end

Move_CAMOUFLAGE:: @ 81CC072
	monbg ANIM_ATK_PARTNER
	monbgprio_28 0
	setalpha 16, 0
	createvisualtask AnimTask_SetCamouflageBlend, 5, 2, 3, 0, 14
	delay 16
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 4
	playsewithpan SE_M_FAINT_ATTACK, 192
	waitforvisualfinish
	delay 8
	createvisualtask AnimTask_SetCamouflageBlend, 5, 2, 0, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_AttackerFadeFromInvisible, 2, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_ATK_PARTNER
	end

Move_TAIL_GLOW:: @ 81CC0B8
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 0
	waitforvisualfinish
	createsprite gTailGlowOrbSpriteTemplate, ANIM_ATTACKER, 66, 0
	delay 18
	loopsewithpan SE_M_MORNING_SUN, 192, 16, 6
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 4, 0, 0
	clearmonbg ANIM_ATTACKER
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
	monbg ANIM_ATTACKER
	setalpha 12, 8
	playsewithpan SE_M_SOLAR_BEAM, 192
	createsprite gLusterPurgeCircleSpriteTemplate, ANIM_ATTACKER, 41, 0, 0, 0, 0
	delay 20
	createvisualtask AnimTask_BlendExcept, 5, 5, 2, 0, 16, -1
	createvisualtask AnimTask_BlendParticle, 5, 10267, 2, 0, 16, -1
	waitforvisualfinish
	createvisualtask AnimTask_BlendParticle, 5, 10135, 0, 12, 12, 23552
	waitforvisualfinish
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, 63
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, 63
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, 63
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, 63
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, 63
	delay 3
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_HYPER_BEAM, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendExcept, 5, 5, 2, 16, 0, -1
	createvisualtask AnimTask_HorizontalShake, 5, 1, 5, 14
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	call UnsetPsychicBg
	end

Move_MIST_BALL:: @ 81CC212
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_WHITE_FEATHER
	delay 0
	playsewithpan SE_M_STRING_SHOT, 192
	createsprite gMistBallSpriteTemplate, ANIM_TARGET, 0, 0, 0, 0, 0, 30, 0
	waitforvisualfinish
	playsewithpan SE_M_SAND_ATTACK, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 10, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 1, 1, 32279, 16, RGB_WHITE, 16
	delay 0
	playsewithpan SE_M_HAZE, 0
	createvisualtask AnimTask_LoadMistTiles, 5, 
	createvisualtask AnimTask_BlendSelected, 10, 4, 3, 0, 16, RGB_WHITE
	delay 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 70, 0
	delay 70
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 16, 0, RGB_WHITE
	end

Move_FEATHER_DANCE:: @ 81CC2A1
	loadspritegfx ANIM_TAG_WHITE_FEATHER
	monbg ANIM_DEF_PARTNER
	monbgprio_29
	playsewithpan SE_M_PETAL_DANCE, 63
	delay 0
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 64, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 32, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 0, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 224, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 128, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 192, 2, 104, 11304, 32, 1
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 160, 2, 104, 11304, 32, 1
	delay 6
	createsprite gFallingFeatherSpriteTemplate, ANIM_TARGET, 0, 0, -16, 96, 2, 104, 11304, 32, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_TEETER_DANCE:: @ 81CC371
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_TeeterDanceMovement, 5, 
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, -2
	playsewithpan SE_M_TEETER_DANCE, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -2
	playsewithpan SE_M_TEETER_DANCE, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -2
	playsewithpan SE_M_TEETER_DANCE, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, -8, -2
	playsewithpan SE_M_TEETER_DANCE, 192
	delay 24
	createsprite gFastFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 2, 8, -2
	playsewithpan SE_M_TEETER_DANCE, 192
	end

Move_MUD_SPORT:: @ 81CC3DC
	loadspritegfx ANIM_TAG_MUD_SAND
	createvisualtask AnimTask_Splash, 2, 0, 6
	delay 24
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -4, -16
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 4, -12
	playsewithpan SE_M_DIG, 192
	delay 32
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -3, -12
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 5, -14
	playsewithpan SE_M_DIG, 192
	delay 32
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, -5, -18
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 0, 3, -14
	playsewithpan SE_M_DIG, 192
	delay 16
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 220, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 60, 100
	waitplaysewithpan SE_M_BUBBLE2, 0, 25
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 140, 55
	waitplaysewithpan SE_M_BUBBLE2, 0, 14
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 180, 50
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 20, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 90, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 160, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 30, 90
	waitplaysewithpan SE_M_BUBBLE2, 0, 22
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 120, 60
	waitplaysewithpan SE_M_BUBBLE2, 0, 15
	delay 2
	createsprite gMudsportMudSpriteTemplate, ANIM_TARGET, 2, 1, 200, 40
	waitplaysewithpan SE_M_BUBBLE2, 0, 10
	end

Move_NEEDLE_ARM:: @ 81CC513
	loadspritegfx ANIM_TAG_GREEN_SPIKE
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loopsewithpan SE_M_HORN_ATTACK, 63, 2, 16
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
	playsewithpan SE_M_VITAL_THROW2, 63
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
	playsewithpan SE_M_YAWN, 192
	waitforvisualfinish
	call HealingEffect
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
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	playsewithpan SE_M_RAZOR_WIND, 63
	delay 12
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	playsewithpan SE_M_RAZOR_WIND, 63
	waitforvisualfinish
	waitforvisualfinish
	blendoff
	clearmonbg 1
	end

Move_AROMATHERAPY:: @ 81CC74B
	playsewithpan SE_M_PETAL_DANCE, 0
	loadspritegfx ANIM_TAG_FLOWER
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 0, 0, 7, 13293
	delay 1
	monbg ANIM_ATTACKER
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
	clearmonbg ANIM_ATTACKER
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 0, 7, 0, 13293
	delay 1
	playsewithpan SE_M_STAT_INCREASE, 192
	createvisualtask AnimTask_StatusClearedEffect, 2, 1
	waitforvisualfinish
	playsewithpan SE_M_MORNING_SUN, 192
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	playsewithpan SE_SHINY, 192
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
	loopsewithpan SE_M_TAIL_WHIP, 192, 12, 4
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 1
	delay 8
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 2
	createsprite gTearDropSpriteTemplate, ANIM_ATTACKER, 2, 0, 3
	waitforvisualfinish
	end

Move_AIR_CUTTER:: @ 81CC93D
	loadspritegfx ANIM_TAG_AIR_WAVE
	loadspritegfx ANIM_TAG_CUT
	loadspritegfx ANIM_TAG_IMPACT
	delay 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 0
	createvisualtask AnimTask_AirCutterProjectile, 2, 32, -24, 1536, 2, 128
	waitforvisualfinish
	playsewithpan SE_M_CUT, 63
	createsprite gAirCutterSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0, 2
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 8, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	end

Move_ODOR_SLEUTH:: @ 81CC99F
	monbg 1
	createvisualtask AnimTask_OdorSleuthMovement, 5, 
	delay 24
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 4
	playsewithpan SE_M_SWAGGER, 192
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 3, 4
	playsewithpan SE_M_SWAGGER, 192
	waitforvisualfinish
	clearmonbg 1
	delay 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 1, -1, 16, -1, 0
	playsewithpan SE_M_LEER, 192
	end

Move_GRASS_WHISTLE:: @ 81CC9E9
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 13298
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2, 
	waitforvisualfinish
	panse_1B SE_M_GRASSWHISTLE, 192, 63, 2, 0
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
	playsewithpan SE_M_DETECT, 192
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 16, 0, 0
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SwayMon, 3, 0, 6, 1280, 3, 0
	delay 12
	createvisualtask AnimTask_RockMonBackAndForth, 3, 1, 6, 2
	loopsewithpan SE_M_TAIL_WHIP, 63, 8, 8
	waitforvisualfinish
	end

Move_WATER_SPOUT:: @ 81CCB48
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_WaterSpoutLaunch, 5, 
	playsewithpan SE_M_HEADBUTT, 192
	delay 44
	playsewithpan SE_M_DIVE, 192
	waitforvisualfinish
	delay 16
	createvisualtask AnimTask_WaterSpoutRain, 5, 
	playsewithpan SE_M_SURF, 63
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SHADOW_PUNCH:: @ 81CCB76
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	fadetobg 2
	waitbgfadein
	monbg ANIM_ATK_PARTNER
	setalpha 9, 8
	createvisualtask AnimTask_AttackerPunchWithTrace, 2, 0, 13
	playsewithpan SE_M_JUMP_KICK, 192
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	playsewithpan SE_M_COMET_PUNCH, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_EXTRASENSORY:: @ 81CCBD1
	call SetPsychicBackground
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 891, 12, 1, 1
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 0
	playsewithpan SE_M_BIND, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, 0, 891, 12, 1, 1
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 1
	playsewithpan SE_M_BIND, 63
	waitforvisualfinish
	createvisualtask AnimTask_TransparentCloneGrowAndShrink, 5, ANIM_ATTACKER
	createvisualtask AnimTask_ExtrasensoryDistortion, 5, 2
	playsewithpan SE_M_LEER, 192
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	call UnsetPsychicBg
	end

Move_AERIAL_ACE:: @ 81CCC39
	loadspritegfx ANIM_TAG_CUT
	monbg 1
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 24, 6, 1, 5
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 7, 3
	createsprite gCuttingSliceSpriteTemplate, ANIM_ATTACKER, 2, 40, -32, 0
	playsewithpan SE_M_RAZOR_WIND2, 192
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 10, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 10, 0, 0
	playsewithpan SE_M_RAZOR_WIND, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_IRON_DEFENSE:: @ 81CCCA3
	loopsewithpan SE_SHINY, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 8, 2, -1, 14, -1, 0
	waitforvisualfinish
	end

Move_BLOCK:: @ 81CCCCD
	loadspritegfx ANIM_TAG_X_SIGN
	createsprite gBlockXSpriteTemplate, ANIM_TARGET, 66, 
	playsewithpan SE_M_SWAGGER, 63
	end

Move_HOWL:: @ 81CCCDC
	loadspritegfx ANIM_TAG_NOISE_LINE
	createvisualtask AnimTask_DeepInhale, 2, 0
	delay 12
	call RoarEffect
	createvisualtask SoundTask_PlayCryHighPitch, 2, 0, 3
	waitforvisualfinish
	delay 30
	end

Move_BULK_UP:: @ 81CCCFE
	loadspritegfx ANIM_TAG_BREATH
	createvisualtask AnimTask_GrowAndShrink, 2, 
	playsewithpan SE_M_SWAGGER, 192
	waitforvisualfinish
	createsprite gBreathPuffSpriteTemplate, ANIM_ATTACKER, 2, 
	loopsewithpan SE_M_SWAGGER, 192, 4, 2
	waitforvisualfinish
	end

Move_COVET:: @ 81CCD1C
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_RockMonBackAndForth, 5, 0, 2, 0
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	playsewithpan SE_M_CHARM, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	playsewithpan SE_M_CHARM, 192
	delay 15
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	playsewithpan SE_M_CHARM, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	loopsewithpan SE_M_DIZZY_PUNCH, 63, 4, 3
	end

Move_VOLT_TACKLE:: @ 81CCD79
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_ELECTRICITY
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 0, 8, RGB_BLACK
	waitforvisualfinish
	createsprite gVoltTackleOrbSlideSpriteTemplate, ANIM_ATTACKER, 1
	playsewithpan SE_M_CHARGE, 192
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 8
	createvisualtask AnimTask_VoltTackleBolt, 5, 0
	playsewithpan SE_M_THUNDERBOLT, 192
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 1
	playsewithpan SE_M_THUNDERBOLT, 63
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 2
	playsewithpan SE_M_THUNDERBOLT, 192
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 3
	playsewithpan SE_M_THUNDERBOLT, 63
	waitforvisualfinish
	createvisualtask AnimTask_VoltTackleBolt, 5, 4
	playsewithpan SE_M_THUNDERBOLT, 192
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, 1, 10, 0, 18, 1
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 1, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 1, -16, -16
	delay 8
	createvisualtask AnimTask_VoltTackleAttackerReappear, 5
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 0, 3, 0, 9, 1
	playsewithpan SE_M_THUNDERBOLT2, 192
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 16
	delay 2
	createsprite gElectricPuffSpriteTemplate, ANIM_ATTACKER, 2, 0, -16, -16
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1, 0, 8, 0, RGB_BLACK
	waitforvisualfinish
	end

Move_WATER_SPORT:: @ 81CCE71
	loadspritegfx ANIM_TAG_GLOWY_BLUE_ORB
	createvisualtask AnimTask_WaterSport, 5, 
	delay 8
	playsewithpan SE_M_SURF, 192
	delay 44
	playsewithpan SE_M_SURF, 192
	delay 44
	playsewithpan SE_M_SURF, 192
	delay 44
	panse_1B SE_M_SURF, 192, 63, 2, 0
	end

Move_CALM_MIND:: @ 81CCE97
	loadspritegfx ANIM_TAG_THIN_RING
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendExcept, 5, 0, 0, 0, 16, 0
	waitforvisualfinish
	createvisualtask AnimTask_SetAllNonAttackersInvisiblity, 5, 1
	waitforvisualfinish
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_M_SUPERSONIC, 192
	delay 14
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_M_SUPERSONIC, 192
	delay 14
	createsprite gThinRingShrinkingSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0
	playsewithpan SE_M_SUPERSONIC, 192
	waitforvisualfinish
	createvisualtask AnimTask_SetAllNonAttackersInvisiblity, 5, 0
	visible 0
	waitforvisualfinish
	createvisualtask AnimTask_BlendExcept, 5, 0, 0, 16, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	end

Move_LEAF_BLADE:: @ 81CCF17
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_CROSS_IMPACT
	createvisualtask AnimTask_LeafBlade, 5, 
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_M_CUT, 63
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_M_CUT, 63
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_M_CUT, 63
	waitforvisualfinish
	monbg 1
	setalpha 12, 8
	delay 12
	createvisualtask AnimTask_ShakeMon2, 2, 1, 8, 0, 18, 1
	createsprite gCrossImpactSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 36
	playsewithpan SE_M_LEER, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_DRAGON_DANCE:: @ 81CCF9A
	loadspritegfx ANIM_TAG_HOLLOW_ORB
	monbg ANIM_ATTACKER
	monbgprio_28 0
	delay 1
	createvisualtask AnimTask_DragonDanceWaver, 5
	playsewithpan SE_M_TELEPORT, 192
	delay 8
	createvisualtask AnimTask_BlendPalInAndOutByTag, 5, 10249, 19456, 14, 0, 3
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 43
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 85
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 128
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 170
	createsprite gDragonDanceOrbSpriteTemplate, ANIM_ATTACKER, 2, 213
	delay 30
	playsewithpan SE_M_TELEPORT, 192
	delay 30
	playsewithpan SE_M_TELEPORT, 192
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	end

Move_SHOCK_WAVE:: @ 81CD009
	loadspritegfx ANIM_TAG_ELECTRIC_ORBS
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	loadspritegfx ANIM_TAG_SPARK
	loadspritegfx ANIM_TAG_LIGHTNING
	monbg ANIM_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 4, 0
	waitforvisualfinish
	createvisualtask AnimTask_ElectricChargingParticles, 2, 0, 20, 0, 2
	playsewithpan SE_M_CHARGE, 192
	delay 12
	createsprite gGrowingShockWaveOrbSpriteTemplate, ANIM_ATTACKER, 2
	delay 30
	createvisualtask AnimTask_ShockWaveProgressingBolt, 5,
	delay 12
	waitforvisualfinish
	createvisualtask AnimTask_ShockWaveLightning, 5,
	playsewithpan SE_M_TRI_ATTACK2, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 6, 18, 1
	createvisualtask AnimTask_BlendSelected, 5, 1, 3, 16, 0, RGB_WHITE
	createvisualtask AnimTask_BlendSelected, 5, 4, 0, 16, 16, RGB_BLACK
	delay 4
	createvisualtask AnimTask_BlendSelected, 5, 4, 0, 0, 0, RGB_BLACK
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	end

Move_HARDEN:: @ 81CD0AB
	loopsewithpan SE_M_HARDEN, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	end

Move_BELLY_DRUM:: @ 81CD0C0
	loadspritegfx ANIM_TAG_MUSIC_NOTES
	loadspritegfx ANIM_TAG_PURPLE_HAND_OUTLINE
	createvisualtask AnimTask_MusicNotesRainbowBlend, 2, 
	waitforvisualfinish
	call BellyDrumRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, 0
	playsewithpan SE_M_BELLY_DRUM, 192
	delay 15
	call BellyDrumLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 1, 0
	playsewithpan SE_M_BELLY_DRUM, 192
	delay 15
	call BellyDrumRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 3, 3, 128
	playsewithpan SE_M_BELLY_DRUM, 192
	delay 7
	call BellyDrumLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 128
	playsewithpan SE_M_BELLY_DRUM, 192
	delay 7
	call BellyDrumRight
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 0, 1, 1, 0
	playsewithpan SE_M_BELLY_DRUM, 192
	delay 7
	call BellyDrumLeft
	createsprite gSlowFlyingMusicNotesSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 3, 0
	playsewithpan SE_M_BELLY_DRUM, 192
	waitforvisualfinish
	createvisualtask AnimTask_MusicNotesClearRainbowBlend, 2, 
	waitforvisualfinish
	end

BellyDrumLeft:: @ 81CD172
	createsprite gBellyDrumHandSpriteTemplate, ANIM_ATTACKER, 3, 0
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 8, 2, 1
	return

BellyDrumRight:: @ 81CD18D
	createsprite gBellyDrumHandSpriteTemplate, ANIM_ATTACKER, 3, 1
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 8, 2, 1
	return

Move_MIND_READER:: @ 81CD1A8
	loadspritegfx ANIM_TAG_TEAL_ALERT
	loadspritegfx ANIM_TAG_OPENING_EYE
	loadspritegfx ANIM_TAG_ROUND_WHITE_HALO
	monbg 4
	playsewithpan SE_M_CONFUSE_RAY, 63
	createsprite gOpeningEyeSpriteTemplate, ANIM_ATTACKER, 5, 0, 0, 1, 0
	createsprite gWhiteHaloSpriteTemplate, ANIM_ATTACKER, 5, 
	delay 40
	playsewithpan SE_M_LEER, 63
	createvisualtask AnimTask_CurseBlendEffect, 2, 1, 1, 2, 0, 10, 0
	call MindReaderEyeSpikeEffect
	waitforvisualfinish
	clearmonbg 4
	end

MindReaderEyeSpikeEffect:: @ 81CD1EF
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
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 7, 0
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 9, RGB(12, 26, 31)
	delay 20
	playsewithpan SE_M_STRING_SHOT, 63
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 0
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 64
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 128
	createsprite gIceCrystalSpiralInwardSmall, ANIM_ATTACKER, 2, 192
	delay 5
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 32
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 96
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 160
	createsprite gIceCrystalSpiralInwardLarge, ANIM_ATTACKER, 2, 224
	delay 17
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 4, 0, -10, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -10, 1, 1
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 3, 1
	waitforvisualfinish
	delay 15
	call IceCrystalEffectShort
	delay 5
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 9, 0, RGB(12, 26, 31)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_REST:: @ 81CD3CB
	playsewithpan SE_M_SNORE, 192
	loadspritegfx ANIM_TAG_LETTER_Z
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	waitforvisualfinish
	end

Move_CONFUSION:: @ 81CD40B
	monbg ANIM_DEF_PARTNER
	call SetPsychicBackground
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 10, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, RGB_WHITE
	waitforvisualfinish
	playsewithpan SE_M_SUPERSONIC, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, 1, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBg
	end

Move_PSYCHIC:: @ 81CD46C
	monbg ANIM_DEF_PARTNER
	call SetPsychicBackground
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 10, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, 767
	waitforvisualfinish
	loopsewithpan SE_M_SUPERSONIC, 63, 10, 3
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, 1, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBg
	end

Move_FUTURE_SIGHT:: @ 81CD4CF
	goto FutureSight
FutureSightContinue:: @ 81CD4D4
	waitforvisualfinish
	delay 1
	call UnsetPsychicBg
	end

FutureSight:: @ 81CD4DD
	monbg ANIM_ATK_PARTNER
	playsewithpan SE_M_PSYBEAM, 192
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_SUPERSONIC, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 8, RGB_WHITE
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, 0, 1
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	goto FutureSightContinue
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_PSYBEAM, 192
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_SUPERSONIC, 63
	waitplaysewithpan SE_M_SUPERSONIC, 63, 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto FutureSightContinue

Move_THUNDER:: @ 81CD570
	loadspritegfx ANIM_TAG_LIGHTNING
	fadetobg 11
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -256, 0, 1, -1
	waitbgfadein
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 16, 0
	delay 16
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	playsewithpan SE_M_THUNDER_WAVE, 63
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 16, -36
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 16, -20
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 16, 12
	delay 20
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 6, -16, -32
	playsewithpan SE_M_THUNDER_WAVE, 63
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 6, -16, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 6, -16, 16
	playsewithpan SE_M_THUNDER_WAVE, 63
	delay 5
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 24, -32
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 24, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 24, 16
	delay 30
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 5
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -32
	playsewithpan SE_M_TRI_ATTACK2, 63
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, 16
	delay 10
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createvisualtask AnimTask_ShakeTargetInPattern, 2, 30, 3, 1, 0
	delay 2
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
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
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	delay 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -48
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_ATTACKER, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_ATTACKER, 2, 0, 16
	delay 1
	playsewithpan SE_M_TRI_ATTACK2, 63
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
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
	loopsewithpan SE_M_SACRED_FIRE, 192, 7, 5
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 50, 5, -2, 0
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, -20, -10, 50, 5, -1, -1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 0, -16, 50, 5, 0, -1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 20, -10, 50, 5, 1, -1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 50, 5, 2, 0
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, 50, 5, 1, 1
	delay 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 50, 5, 0, 1
	delay 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -20, 10, 50, 5, -1, 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	playsewithpan SE_M_SACRED_FIRE2, 63
	createsprite gLargeFlameSpriteTemplate, ANIM_TARGET, 2, -16, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_M_SACRED_FIRE2, 63
	createsprite gLargeFlameSpriteTemplate, ANIM_TARGET, 2, 0, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_M_SACRED_FIRE2, 63
	createsprite gLargeFlameSpriteTemplate, ANIM_TARGET, 2, 16, 0, 80, 16, 0, 1
	delay 1
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 1
	playsewithpan SE_M_FLAME_WHEEL2, 63
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 0
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 3, 1
	waitforvisualfinish
	end

Move_SCRATCH:: @ 81CD97A
	loadspritegfx ANIM_TAG_SCRATCH
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_SCRATCH, 63
	createsprite gScratchSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

Move_DRAGON_BREATH:: @ 81CD9AC
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	loopsewithpan SE_M_FLAME_WHEEL, 192, 7, 7
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createvisualtask AnimTask_BlendSelected, 10, 4, 1, 0, 9, RGB(31, 0, 0)
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 21, 1
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	delay 2
	createsprite gDragonBreathFireSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0, 0, 20
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 1, 9, 0, RGB(31, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_ROAR:: @ 81CDAC0
	loadspritegfx ANIM_TAG_NOISE_LINE
	monbg ANIM_ATTACKER
	monbgprio_28 0
	setalpha 8, 8
	createvisualtask SoundTask_PlayDoubleCry, 2, 0, 2
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, 0, 1
	call RoarEffect
	delay 20
	createvisualtask AnimTask_SlideOffScreen, 5, 1, 2
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5, 
	waitforvisualfinish
	end

RoarEffect:: @ 81CDB06
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
	createvisualtask SoundTask_PlayDoubleCry, 2, 0, 255
	call RoarEffect
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 1, 0, 9, 1
	waitforvisualfinish
	createvisualtask SoundTask_WaitForCry, 5, 
	waitforvisualfinish
	end

Move_SNORE:: @ 81CDB98
	loadspritegfx ANIM_TAG_SNORE_Z
	monbg ANIM_ATK_PARTNER
	setalpha 8, 8
	call SnoreEffect
	delay 30
	call SnoreEffect
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SnoreEffect:: @ 81CDBB1
	playsewithpan SE_M_SNORE, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 7, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 7, 1
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 14, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -42, -38, 24, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0, -42, 24, 0, 0
	createsprite gSnoreZSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 42, -38, 24, 0, 0
	return

Move_LIGHT_SCREEN:: @ 81CDC28
	loadspritegfx ANIM_TAG_SPARKLE_3
	loadspritegfx ANIM_TAG_GREEN_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_REFLECT, 192, 15
	createsprite gLightScreenWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, 10166
	delay 10
	call SpecialScreenSparkle
	waitforvisualfinish
	delay 1
	blendoff
	end

SpecialScreenSparkle:: @ 81CDC4F
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 23, 0, 0, 1
	delay 6
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 31, -8, 0, 1
	delay 5
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 30, 20, 0, 1
	delay 7
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 10, -15, 0, 1
	delay 6
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 20, 10, 0, 1
	delay 6
	createsprite gSpecialScreenSparkleSpriteTemplate, ANIM_ATTACKER, 2, 10, 18, 0, 1
	return

Move_MIRROR_COAT:: @ 81CDCB4
	loadspritegfx ANIM_TAG_SPARKLE_3
	loadspritegfx ANIM_TAG_RED_LIGHT_WALL
	setalpha 0, 16
	createsprite gMirrorCoatWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, 10168
	delay 10
	playsewithpan SE_M_REFLECT, 192
	call SpecialScreenSparkle
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_REFLECT:: @ 81CDCDA
	loadspritegfx ANIM_TAG_SPARKLE_4
	loadspritegfx ANIM_TAG_BLUE_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_REFLECT, 192, 15
	createsprite gReflectWallSpriteTemplate, ANIM_ATTACKER, 1, 40, 0, 10167
	delay 20
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 30, 0, 0, 1
	delay 7
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 19, -12, 0, 1
	delay 7
	createsprite gReflectSparkleSpriteTemplate, ANIM_ATTACKER, 2, 10, 20, 0, 1
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_BARRIER:: @ 81CDD2D
	loadspritegfx ANIM_TAG_GRAY_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_BARRIER, 192, 15
	createsprite gBarrierWallSpriteTemplate, ANIM_ATTACKER, 3, 40, 0, 10169
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
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 15, -15, 10, 128, 100
	playsewithpan SE_M_BUBBLE, 192
	waitplaysewithpan SE_M_BUBBLE2, 63, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 35, 37, 40, 128, 100
	playsewithpan SE_M_BUBBLE, 192
	waitplaysewithpan SE_M_BUBBLE2, 63, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 10, -37, 30, 128, 100
	playsewithpan SE_M_BUBBLE, 192
	waitplaysewithpan SE_M_BUBBLE2, 63, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 30, 10, 15, 128, 100
	playsewithpan SE_M_BUBBLE, 192
	waitplaysewithpan SE_M_BUBBLE2, 63, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 20, 33, 20, 128, 100
	playsewithpan SE_M_BUBBLE, 192
	waitplaysewithpan SE_M_BUBBLE2, 63, 100
	delay 6
	createsprite gWaterBubbleProjectileSpriteTemplate, ANIM_ATTACKER, 2, 18, 0, 25, -30, 10, 128, 100
	playsewithpan SE_M_BUBBLE, 192
	waitplaysewithpan SE_M_BUBBLE2, 63, 100
	waitforvisualfinish
	call WaterBubblesEffectLong
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_SMOG:: @ 81CDE20
	loadspritegfx ANIM_TAG_PURPLE_GAS_CLOUD
	monbg ANIM_DEF_PARTNER
	monbgprio_29
	setalpha 12, 8
	loopsewithpan SE_M_MIST, 63, 17, 10
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	call SmogCloud
	delay 120
	loopsewithpan SE_M_TOXIC, 63, 18, 2
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 2, 2, 0, 12, 26650
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 15, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SmogCloud:: @ 81CDE85
	createsprite gSmogCloudSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 48, 240, 1, 0
	delay 7
	return

Move_FAINT_ATTACK:: @ 81CDE9B
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_ATTACKER
	fadetobg 1
	waitbgfadein
	delay 0
	playsewithpan SE_M_FAINT_ATTACK, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 1, 3
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	invisible 0
	delay 1
	createvisualtask AnimTask_SetAttackerInvisibleWaitForSignal, 2, 
	monbg 1
	setalpha 12, 8
	delay 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 9, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	delay 1
	setarg 7, 4096
	delay 32
	createvisualtask AnimTask_InitAttackerFadeFromInvisible, 2
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_AttackerFadeFromInvisible, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	restorebg
	waitbgfadein
	end

Move_SAND_ATTACK:: @ 81CDF22
	loadspritegfx ANIM_TAG_MUD_SAND
	monbg ANIM_ATK_PARTNER
	monbgprio_28 0
	setalpha 12, 8
	playsewithpan SE_M_SAND_ATTACK, 192
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	call SandAttackDirt
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SandAttackDirt:: @ 81CDF72
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 0, 0
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 10, 10
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -10, -10
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 20, 5
	createsprite gSandAttackDirtSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -20, -5
	delay 2
	return

Move_MUD_SLAP:: @ 81CDFCA
	loadspritegfx ANIM_TAG_MUD_SAND
	playsewithpan SE_M_SAND_ATTACK, 192
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 2
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	call MudSlapMud
	waitforvisualfinish
	end

MudSlapMud:: @ 81CE010
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 0, 0
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 10, 5
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -10, -5
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, 20, 10
	createsprite gMudSlapMudSpriteTemplate, ANIM_TARGET, 2, 15, 15, 20, -20, -10
	delay 2
	return

Move_DRAGON_RAGE:: @ 81CE068
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_FIRE_PLUME
	playsewithpan SE_M_DRAGON_RAGE, 192
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 40, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_TARGET, 2, 0, 15, 0, 0, 4
	waitforvisualfinish
	createsprite gDragonRageFireSpitSpriteTemplate, ANIM_TARGET, 2, 30, 15, 0, 10, 10
	waitforvisualfinish
	loopsewithpan SE_M_FLAME_WHEEL2, 63, 11, 3
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 3, 25, 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, 5, 0
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, -10, -15
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 2, 1, 0, 25
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, 15, 5
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, -25, 0
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 2, 1, 30, 30
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 2, 1, -27, 25
	delay 1
	createsprite gDragonRageFirePlumeSpriteTemplate, ANIM_TARGET, 66, 1, 0, 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_TARGET, 66, 0, 0, 4
	waitforvisualfinish
	end

Move_RAIN_DANCE:: @ 81CE145
	loadspritegfx ANIM_TAG_RAIN_DROPS
	playsewithpan SE_M_RAIN_DANCE, 192
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 120
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 120
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
	playsewithpan SE_M_BITE, 63
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, -32, 0, 0, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 4, 0, -819, 10
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
	playsewithpan SE_M_BITE, 63
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, -32, 1, 819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, 5, -819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -8, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 7, 5, 2
	waitforvisualfinish
	playsewithpan SE_M_BITE, 63
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, 32, -32, 7, -819, 819, 10
	createsprite gSharpTeethSpriteTemplate, ANIM_ATTACKER, 2, -32, 32, 3, 819, -819, 10
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
	playsewithpan SE_M_VICEGRIP, 63
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 2, 819, 0, 10
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 6, -819, 0, 10
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
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_BUBBLE_BEAM2, -64, 63, 4, 4, 0, 10
	createsprite gIceBeamOuterCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, 12, 0, 12, 20
	createsprite gIceBeamOuterCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, -12, 0, -12, 20
	delay 1
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 4, -31, 0, 7, 32384
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 25, 1
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	call IceBeamCreateCrystals
	createsprite gIceBeamInnerCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 11
	delay 1
	createsprite gIceBeamInnerCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 11
	waitforvisualfinish
	delay 20
	call IceCrystalEffectShort
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 4, 5, 7, 0, 32384
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 7, 0, 0
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

IceBeamCreateCrystals:: @ 81CE3FC
	createsprite gIceBeamOuterCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, 12, 0, 12, 20
	createsprite gIceBeamOuterCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, -12, 0, -12, 20
	createsprite gIceBeamInnerCrystalSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 11
	delay 1
	return

Move_WITHDRAW:: @ 81CE432
	playsewithpan SE_M_HEADBUTT, 192
	createvisualtask AnimTask_Withdraw, 5, 
	waitforvisualfinish
	end

Move_AURORA_BEAM:: @ 81CE43F
	loadspritegfx ANIM_TAG_RAINBOW_RINGS
	fadetobg 20
	waitbgfadein
	playsewithpan SE_M_BUBBLE_BEAM, 192
	setarg 7, 0
	createvisualtask AnimTask_RotateAuroraRingColors, 10, 130
	call AuroraBeamCreateRings
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 17, 1
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	setarg 7, 65535
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_BUBBLE_BEAM2, -64, 63, 3, 6, 0, 10
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 40, 1
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	call AuroraBeamCreateRings
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

AuroraBeamCreateRings:: @ 81CE4C6
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	createsprite gAuroraBeamRingSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 17
	delay 1
	return

Move_SOLAR_BEAM:: @ 81CE513
	loadspritegfx ANIM_TAG_ORBS
	choosetwoturnanim SolarBeamSetUp, SolarBeamUnleash
SolarBeamEnd:: @ 81CE51F
	waitforvisualfinish
	end

SolarBeamSetUp:: @ 81CE521
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 1, 4, 0, 11, 12287
	playsewithpan SE_M_MEGA_KICK, 192
	call SolarBeamAbsorbEffect
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	goto SolarBeamEnd

SolarBeamAbsorbEffect:: @ 81CE54B
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

SolarBeamUnleash:: @ 81CE61E
	call SetSolarbeamBg
	panse_1B SE_M_SOLAR_BEAM, 192, 63, 2, 0
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
	call SolarBeamUnleash1
	call SolarBeamUnleash1
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 1, 10, 0, RGB(25, 31, 0)
	call UnsetSolarbeamBg
	goto SolarBeamEnd

SolarBeamUnleash1:: @ 81CE6F0
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
	monbg ANIM_DEF_PARTNER
	createvisualtask AnimTask_GetAttackerSide, 2, 
	jumpargeq 7, 1, BlizzardOnPlayer
	fadetobg BG_HIGHSPEED_OPPONENT

BlizzardContinue:: @ 81CE77E
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 0, 1, -1
	waitbgfadein
	waitforvisualfinish
	panse_1B SE_M_BLIZZARD, 192, 63, 2, 0
	call BlizzardIceCrystals
	call BlizzardIceCrystals
	playsewithpan SE_M_BLIZZARD2, 63
	waitforvisualfinish
	call IceCrystalEffectLong
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 20
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

BlizzardIceCrystals:: @ 81CE7B8
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -15, 0, -15, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -5, 0, -5, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 10, 0, 10, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 15, 0, 15, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -15, 0, -15, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gSwirlingSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -25, 0, -25, 72, 1
	createsprite gBlizzardIceCrystalSpriteTemplate, ANIM_ATTACKER, 40, 0, 20, 0, 20, 80, 0, 0, 1
	delay 3
	return

BlizzardOnPlayer:: @ 81CE8ED
	fadetobg BG_HIGHSPEED_PLAYER
	goto BlizzardContinue

Move_POWDER_SNOW:: @ 81CE8F4
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	monbg ANIM_DEF_PARTNER
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 1, 0, 3, 0
	waitforvisualfinish
	panse_1B SE_M_GUST, 192, 63, 2, 0
	call PowderSnowSnowballs
	call PowderSnowSnowballs
	playsewithpan SE_M_GUST2, 63
	waitforvisualfinish
	waitsound
	call IceCrystalEffectLong
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 20
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 1, 3, 0, 0
	end

PowderSnowSnowballs:: @ 81CE93E
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 0, 0, 0, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -10, 0, -10, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 10, 0, 10, 56, -4, 3, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 56, -4, 5, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 15, 0, 15, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, -20, 0, -20, 56, 4, 4, 1
	delay 3
	createsprite gPowderSnowSnowballSpriteTemplate, ANIM_ATTACKER, 40, 0, 20, 0, 20, 56, 4, 4, 1
	delay 3
	return

Move_HYDRO_PUMP:: @ 81CE9EE
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 40, 1
	delay 6
	panse_1B SE_M_HYDRO_PUMP, 192, 63, 2, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpBeams
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 37, 1
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	call HydroPumpBeams
	call HydroPumpBeams
	call HydroPumpHitSplats
	delay 1
	delay 1
	call HydroPumpHitSplats
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

HydroPumpBeams:: @ 81CEA8D
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	createsprite gHydroPumpOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, -16
	delay 1
	return

HydroPumpHitSplats:: @ 81CEACE
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 15, 1, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, -15, 1, 1
	return

Move_SIGNAL_BEAM:: @ 81CEAED
	loadspritegfx ANIM_TAG_GLOWY_RED_ORB
	loadspritegfx ANIM_TAG_GLOWY_GREEN_ORB
	loadspritegfx ANIM_TAG_DUCK
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 25, 1
	delay 6
	panse_1B SE_M_BUBBLE_BEAM, 192, 63, 1, 0
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 25, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 4, 8, 5, 31, 8, 961, 8
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	call SignalBeamOrbs
	waitforvisualfinish
	end

SignalBeamOrbs:: @ 81CEBB4
	createsprite gSignalBeamRedOrbSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, 16
	createsprite gSignalBeamGreenOrbSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, -16
	delay 1
	return

Move_ABSORB:: @ 81CEBD5
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 4, 13293
	waitforvisualfinish
	playsewithpan SE_M_ABSORB, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call AbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 4, 0, 13293
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

AbsorbEffect:: @ 81CEC44
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_CRABHAMMER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_MEGA_DRAIN:: @ 81CECED
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 8, 13293
	waitforvisualfinish
	playsewithpan SE_M_ABSORB, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call MegaDrainAbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 8, 0, 13293
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

MegaDrainAbsorbEffect:: @ 81CED5C
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_BUBBLE3, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_GIGA_DRAIN:: @ 81CEE7D
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 12, 13293
	waitforvisualfinish
	playsewithpan SE_M_ABSORB, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call GigaDrainAbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 12, 0, 13293
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

GigaDrainAbsorbEffect:: @ 81CEEEC
	playsewithpan SE_M_GIGA_DRAIN, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -40, 35
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 28, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 36, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_GIGA_DRAIN, 63
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
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	setalpha 12, 8
	delay 1
	createsprite gLeechLifeNeedleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 12
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	playsewithpan SE_M_ABSORB, 63
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 7, 0
	waitforvisualfinish
	call AbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 7, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SYNTHESIS:: @ 81CF107
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_SPARKLE_2
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 16, 19451
	playsewithpan SE_M_MEGA_KICK, 192
	call GrantingStarsEffect
	waitforvisualfinish
	call HealingEffect
	waitforvisualfinish
	end

Move_TOXIC:: @ 81CF131
	loadspritegfx ANIM_TAG_TOXIC_BUBBLE
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	call ToxicBubbles
	call ToxicBubbles
	waitforvisualfinish
	delay 15
	call PoisonBubblesEffect
	waitforvisualfinish
	end

ToxicBubbles:: @ 81CF14B
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, -24, 16, 1, 1
	playsewithpan SE_M_TOXIC, 63
	delay 15
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, 8, 16, 1, 1
	playsewithpan SE_M_TOXIC, 63
	delay 15
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, -8, 16, 1, 1
	playsewithpan SE_M_TOXIC, 63
	delay 15
	createsprite gToxicBubbleSpriteTemplate, ANIM_TARGET, 2, 24, 16, 1, 1
	playsewithpan SE_M_TOXIC, 63
	delay 15
	return

Move_SLUDGE:: @ 81CF1A0
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	playsewithpan SE_M_BUBBLE3, 192
	createsprite gSludgeProjectileSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 0
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 1, 2, 0, 12, 31774
	call PoisonBubblesEffect
	waitforvisualfinish
	end

Move_SLUDGE_BOMB:: @ 81CF1E2
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	call SludgeBombProjectile
	createvisualtask AnimTask_ShakeMon2, 5, 1, 3, 0, 15, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 1, 2, 0, 12, 31774
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 42, 27, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -27, 44, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 39, -28, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -42, -42, 20
	playsewithpan SE_M_DIG, 63
	delay 5
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 0, 40, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -8, -44, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -46, -28, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 46, 9, 20
	playsewithpan SE_M_DIG, 63
	delay 5
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 42, 0, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -43, -12, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, 16, -46, 20
	createsprite gSludgeBombHitParticleSpriteTemplate, ANIM_TARGET, 2, -16, 44, 20
	playsewithpan SE_M_DIG, 63
	delay 0
	waitsound
	waitforvisualfinish
	call PoisonBubblesEffect
	waitforvisualfinish
	end

SludgeBombProjectile:: @ 81CF2F2
	playsewithpan SE_M_BUBBLE3, 192
	createsprite gSludgeProjectileSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 0
	delay 3
	return

Move_ACID:: @ 81CF308
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	monbg ANIM_DEF_PARTNER
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 0, 0
	playsewithpan SE_M_BUBBLE3, 192
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, 24, 0
	playsewithpan SE_M_BUBBLE3, 192
	delay 5
	createsprite gAcidPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, 0, 40, 1, -24, 0
	playsewithpan SE_M_BUBBLE3, 192
	delay 15
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 5, 3, 2, 0, 10, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 20, 2, 2, 0, 12, 31774
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 0, -22, 0, 15, 55
	playsewithpan SE_M_BUBBLE, 63
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -26, -24, 0, 15, 55
	playsewithpan SE_M_BUBBLE, 63
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 15, -27, 0, 15, 50
	playsewithpan SE_M_BUBBLE, 63
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, -15, -17, 0, 10, 45
	playsewithpan SE_M_BUBBLE, 63
	delay 10
	createsprite gAcidPoisonDropletSpriteTemplate, ANIM_TARGET, 2, 27, -22, 0, 15, 50
	playsewithpan SE_M_BUBBLE, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_BONEMERANG:: @ 81CF402
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, 192
	createsprite gBonemerangSpriteTemplate, ANIM_ATTACKER, 2
	delay 20
	playsewithpan SE_M_HORN_ATTACK, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 5, 1
	delay 17
	playsewithpan SE_M_VITAL_THROW, 192
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, -4
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_BONE_CLUB:: @ 81CF456
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, 63
	createsprite gSpinningBoneSpriteTemplate, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 7, 5, 1, 0, 10, 0, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_BONE_RUSH:: @ 81CF4B8
	loadspritegfx ANIM_TAG_BONE
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_BONEMERANG, 63
	createsprite gSpinningBoneSpriteTemplate, ANIM_ATTACKER, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 3, 5, 1
	playsewithpan SE_M_HORN_ATTACK, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SPIKES:: @ 81CF503
	loadspritegfx ANIM_TAG_SPIKES
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_JUMP_KICK, 192
	waitplaysewithpan SE_M_HORN_ATTACK, 63, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 24, 30
	delay 10
	playsewithpan SE_M_JUMP_KICK, 192
	waitplaysewithpan SE_M_HORN_ATTACK, 63, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, -24, 24, 30
	delay 10
	waitplaysewithpan SE_M_HORN_ATTACK, 63, 28
	createsprite gSpikesSpriteTemplate, ANIM_TARGET, 2, 20, 0, 24, 24, 30
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_MEGAHORN:: @ 81CF55A
	loadspritegfx ANIM_TAG_HORN_HIT_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_DRAGON_RAGE, 192
	jumpifcontest MegahornInContest
	fadetobg 7
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 768, 1, -1
MegahornContinue:: @ 81CF57D
	waitbgfadein
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 2, 0, 15, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 6
	delay 3
	createsprite gMegahornHornSpriteTemplate, ANIM_ATTACKER, 3, -42, 25, 0, 0, 6
	delay 4
	playsewithpan SE_M_VICEGRIP, 63
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
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	end

MegahornInContest:: @ 81CF631
	fadetobg 8
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 2304, 768, 0, -1
	goto MegahornContinue

Move_GUST:: @ 81CF648
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_M_GUST, 63
	createsprite gEllipticalGustSpriteTemplate, ANIM_ATTACKER, 2, 0, -16
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 70
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 7, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	playsewithpan SE_M_GUST2, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_WING_ATTACK:: @ 81CF699
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_M_WING_ATTACK, 192, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, 12, 4, 1, 4
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 70
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, -25, 0, 0, 0, 20
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 16, 0, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 1, 1
	loopsewithpan SE_M_DOUBLE_SLAP, 63, 5, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_PECK:: @ 81CF736
	loadspritegfx ANIM_TAG_IMPACT
	playsewithpan SE_M_HORN_ATTACK, 63
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 3, -768, 1, 2
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -12, 0, 1, 3
	waitforvisualfinish
	end

Move_AEROBLAST:: @ 81CF75D
	loadspritegfx ANIM_TAG_AIR_WAVE_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	call SetSkyBg
	monbgprio_28 1
	setalpha 12, 8
	call AeroblastBeam
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 50, 1
	call AeroblastBeam
	call AeroblastBeam
	call AeroblastBeam
	call AeroblastBeam
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	playsewithpan SE_M_RAZOR_WIND, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 0
	call UnsetSkyBg
	end

AeroblastBeam:: @ 81CF7B9
	playsewithpan SE_M_JUMP_KICK, 192
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 0, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 0, 0
	delay 3
	playsewithpan SE_M_JUMP_KICK, 192
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 1, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 1, 0
	delay 3
	playsewithpan SE_M_JUMP_KICK, 192
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 2, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 2, 0
	delay 3
	playsewithpan SE_M_JUMP_KICK, 192
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -12, 0, -12, 15, 3, 0
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 26, 8, 12, 8, 15, 3, 0
	delay 3
	return

Move_WATER_GUN:: @ 81CF87A
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createsprite gWaterGunProjectileSpriteTemplate, ANIM_ATTACKER, 2, 20, 0, 0, 0, 40, -25
	playsewithpan SE_M_BUBBLE, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 8, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 1, 2
	createsprite gWaterGunDropletSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 15, 55
	playsewithpan SE_M_CRABHAMMER, 63
	delay 10
	createsprite gWaterGunDropletSpriteTemplate, ANIM_ATTACKER, 2, 15, -20, 0, 15, 50
	playsewithpan SE_M_CRABHAMMER, 63
	delay 10
	createsprite gWaterGunDropletSpriteTemplate, ANIM_ATTACKER, 2, -15, -10, 0, 10, 45
	playsewithpan SE_M_CRABHAMMER, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_CRABHAMMER:: @ 81CF907
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gWaterHitSplatSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 1
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 32429, 10, 0, 0
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 4
	waitforvisualfinish
	loopsewithpan SE_M_CRABHAMMER, 63, 20, 3
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 4, 8, 1
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 20, 1
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 20, 1
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -15, 15, 20, 1
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 1
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -10, -20, 20, 1
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 20, 1
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, 5, 8, 20, 1
	delay 4
	createsprite gSmallBubblePairSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 20, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SURF:: @ 81CFA01
	createvisualtask AnimTask_CreateSurfWave, 2, 0
	delay 24
	panse_1B SE_M_SURF, 192, 63, 2, 0
	waitforvisualfinish
	end

Move_FLAMETHROWER:: @ 81CFA15
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 46, 1
	delay 6
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	panse_1B SE_M_FLAMETHROWER, 192, 63, 2, 0
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 43, 1
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	call FlamethrowerCreateFlames
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

FlamethrowerCreateFlames:: @ 81CFA8F
	createsprite gFlamethrowerFlameSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	createsprite gFlamethrowerFlameSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	return

Move_SANDSTORM:: @ 81CFAB2
	loadspritegfx ANIM_TAG_FLYING_DIRT
	playsewithpan SE_M_SANDSTORM, 0
	createvisualtask AnimTask_LoadSandstormBackground, 5, 0
	delay 16
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 10, 2304, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 90, 2048, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 50, 2560, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 20, 2304, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 70, 1984, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 0, 2816, 96, 0
	delay 10
	createsprite gFlyingSandCrescentSpriteTemplate, ANIM_ATTACKER, 40, 60, 2560, 96, 0
	end

Move_WHIRLPOOL:: @ 81CFB3A
	loadspritegfx ANIM_TAG_WATER_ORB
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 23968
	playsewithpan SE_M_WHIRLPOOL, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 50, 1
	call WhirlpoolEffect
	call WhirlpoolEffect
	call WhirlpoolEffect
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 23968
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

WhirlpoolEffect:: @ 81CFB92
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 28, 384, 50, 8, 50, 1
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 32, 240, 40, 11, -46, 1
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 33, 416, 40, 4, 42, 1
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 31, 288, 45, 6, -42, 1
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 28, 448, 45, 11, 46, 1
	delay 2
	createsprite gWhirlpoolSpriteTemplate, ANIM_TARGET, 2, 0, 33, 464, 50, 10, -50, 1
	delay 2
	return

Move_FLY:: @ 81CFC1D
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	choosetwoturnanim FlySetUp, FlyUnleash
FlyEnd:: @ 81CFC2C
	waitforvisualfinish
	end

FlySetUp:: @ 81CFC2E
	playsewithpan SE_M_FLY, 192
	createsprite gFlyBallUpSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 13, 336
	goto FlyEnd

FlyUnleash:: @ 81CFC46
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, 192
	createsprite gFlyBallAttackSpriteTemplate, ANIM_ATTACKER, 2, 20
	delay 20
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	playsewithpan SE_M_RAZOR_WIND, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto FlyEnd

Move_BOUNCE:: @ 81CFC87
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	loadspritegfx ANIM_TAG_IMPACT
	choosetwoturnanim BounceSetUp, BounceUnleash
BounceEnd:: @ 81CFC96
	end

BounceSetUp:: @ 81CFC97
	playsewithpan SE_M_TELEPORT, 192
	createsprite gBounceBallShrinkSpriteTemplate, ANIM_ATTACKER, 2, 0, 0
	goto BounceEnd

BounceUnleash:: @ 81CFCAB
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, 63
	createsprite gBounceBallLandSpriteTemplate, ANIM_TARGET, 3
	delay 7
	playsewithpan SE_M_MEGA_KICK2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 11, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto BounceEnd

Move_KARATE_CHOP:: @ 81CFCEA
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, 63
	createsprite gKarateChopSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 0, 0, 10, 1, 3, 0
	waitforvisualfinish
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_CROSS_CHOP:: @ 81CFD3C
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_CROSS_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_MEGA_KICK, 63
	createsprite gCrossChopHandSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0
	createsprite gCrossChopHandSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1
	delay 40
	playsewithpan SE_M_RAZOR_WIND, 63
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, RGB_WHITE, 10, 0, 10
	createsprite gCrossImpactSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 20
	createvisualtask AnimTask_ShakeMon, 5, 1, 7, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_JUMP_KICK:: @ 81CFDA5
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 3
	createsprite gJumpKickSpriteTemplate, ANIM_ATTACKER, 2, -16, 8, 0, 0, 10, 1, 1, 1
	playsewithpan SE_M_JUMP_KICK, 63
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 7, 1
	playsewithpan SE_M_COMET_PUNCH, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_HI_JUMP_KICK:: @ 81CFE02
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 0, 0, 8
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 3
	delay 2
	createsprite gJumpKickSpriteTemplate, ANIM_ATTACKER, 2, -16, 8, 0, 0, 10, 1, 1, 1
	playsewithpan SE_M_JUMP_KICK, 63
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -28, 0, 0, 3
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 3, 0, 11, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_DOUBLE_KICK:: @ 81CFE98
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gFistFootRandomPosSpriteTemplate, ANIM_ATTACKER, 3, 1, 20, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_TRIPLE_KICK:: @ 81CFECB
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VITAL_THROW2, 63
	jumpifmoveturn 0, TripleKickLeft
	jumpifmoveturn 1, TripleKickRight
	goto TripleKickCenter
TripleKickContinue:: @ 81CFEEB
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

TripleKickLeft:: @ 81CFEF0
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, -16, -8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -16, -16, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	goto TripleKickContinue

TripleKickRight:: @ 81CFF26
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 8, 8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	goto TripleKickContinue

TripleKickCenter:: @ 81CFF5C
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 4, 0, 0, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -8, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	goto TripleKickContinue

Move_DYNAMIC_PUNCH:: @ 81CFF92
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_EXPLOSION_6
	delay 1
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 7, 1
	delay 1
	waitsound
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createvisualtask AnimTask_ShakeMon2, 5, 1, 5, 0, 28, 1
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_COUNTER:: @ 81D005A
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 18, 6, 1, 4
	playsewithpan SE_M_VITAL_THROW, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -15, 18, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 25, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, -15, 18, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, -4, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 0, -4, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 15, 9, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 3, 15, 9, 8, 1, 0
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 5
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_VITAL_THROW:: @ 81D0129
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_VITAL_THROW, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 12, 4, 1, 2
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 20, 0, 0, 4
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	delay 11
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 10
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ROCK_SMASH:: @ 81D01A4
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 8, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 5, 1
	waitforvisualfinish
	playsewithpan SE_M_ROCK_THROW, 63
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 20, 24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, -5, 0, -20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 30, -18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, 18, 8, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_SUBMISSION:: @ 81D029C
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_TEAM, 192
	waitplaysewithpan SE_M_COMET_PUNCH, 63, 10
	waitplaysewithpan SE_M_DOUBLE_TEAM, 192, 20
	waitplaysewithpan SE_M_COMET_PUNCH, 63, 30
	waitplaysewithpan SE_M_DOUBLE_TEAM, 192, 40
	waitplaysewithpan SE_M_COMET_PUNCH, 63, 50
	waitplaysewithpan SE_M_DOUBLE_TEAM, 192, 60
	waitplaysewithpan SE_M_COMET_PUNCH, 63, 70
	waitplaysewithpan SE_M_DOUBLE_TEAM, 192, 80
	waitplaysewithpan SE_M_COMET_PUNCH, 63, 90
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, -18, 6, 6, 4
	createvisualtask AnimTask_TranslateMonElliptical, 2, 1, 18, 6, 6, 4
	call SubmissionHit
	call SubmissionHit
	call SubmissionHit
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SubmissionHit:: @ 81D030B
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, -12, 1, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, -12, 8, 1, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 12, 0, 1, 1
	delay 8
	return

Move_SUNNY_DAY:: @ 81D033F
	loadspritegfx ANIM_TAG_SUNLIGHT
	monbg ANIM_ATK_PARTNER
	setalpha 13, 3
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 1, 0, 6, RGB_WHITE
	waitforvisualfinish
	panse_26 SE_M_PETAL_DANCE, 192, 63, 1, 0
	call SunnyDayLightRay
	call SunnyDayLightRay
	call SunnyDayLightRay
	call SunnyDayLightRay
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 1, 6, 0, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

SunnyDayLightRay:: @ 81D038B
	createsprite gSunlightRaySpriteTemplate, ANIM_ATTACKER, 40
	delay 6
	return

Move_COTTON_SPORE:: @ 81D0395
	loadspritegfx ANIM_TAG_SPORE
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	loopsewithpan SE_M_POISON_POWDER, 63, 18, 10
	call CreateCottonSpores
	call CreateCottonSpores
	call CreateCottonSpores
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

CreateCottonSpores:: @ 81D03B5
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -20, 85, 80, 0
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -10, 170, 80, 0
	delay 12
	createsprite gSporeParticleSpriteTemplate, ANIM_ATTACKER, 2, 0, -15, 0, 80, 0
	delay 12
	return

Move_SPORE:: @ 81D03EF
	loadspritegfx ANIM_TAG_SPORE
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_SporeDoubleBattle, 2, 
	loopsewithpan SE_M_POISON_POWDER, 63, 16, 11
	call CreateSpore
	call CreateSpore
	call CreateSpore
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

CreateSpore:: @ 81D041A
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
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_PETAL_DANCE, 192
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
	playsewithpan SE_M_MEGA_KICK2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 8
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_RAZOR_LEAF:: @ 81D058C
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_M_POISON_POWDER, 192, 10, 5
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
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, 20, 1
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 22, -20, 1
	delay 20
	playsewithpan SE_M_RAZOR_WIND, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ANCIENT_POWER:: @ 81D0693
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 10, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -38, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 32, 32, -28, 40, 3
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -20, 32, -48, 50, 2
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 20, 32, -28, 60, 1
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -28, 30, 4
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 30, 1
	playsewithpan SE_M_DRAGON_RAGE, 192
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 15, 32, -48, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -10, 32, -42, 30, 4
	delay 10
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, -42, 25, 5
	createsprite gAncientPowerRockSpriteTemplate, ANIM_ATTACKER, 2, -25, 32, -48, 30, 4
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 0, 0, 4
	delay 3
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_OCTAZOOKA:: @ 81D07BB
	loadspritegfx ANIM_TAG_GRAY_SMOKE
	loadspritegfx ANIM_TAG_BLACK_BALL
	playsewithpan SE_M_MEGA_KICK2, 192
	createsprite gOctazookaBallSpriteTemplate, ANIM_TARGET, 2, 20, 0, 0, 0, 20, 0
	waitforvisualfinish
	playsewithpan SE_M_SELF_DESTRUCT, 63
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
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	loopsewithpan SE_M_MIST, 192, 20, 15
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	call MistCloud
	delay 32
	createvisualtask AnimTask_CurseBlendEffect, 2, 10, 8, 2, 0, 14, RGB_WHITE
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end

MistCloud:: @ 81D086C
	createsprite gMistCloudSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 48, 240, 0, 1
	delay 7
	return

Move_HAZE:: @ 81D0882
	waitforvisualfinish
	playsewithpan SE_M_HAZE, 0
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
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 9, RGB(31, 0, 0)
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 0
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 64
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 128
	createsprite gFireSpiralInwardSpriteTemplate, ANIM_TARGET, 1, 196
	playsewithpan SE_M_FLAME_WHEEL, 63
	waitforvisualfinish
	createsprite gFistFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 15, 1
	call FireSpreadEffect
	delay 4
	playsewithpan SE_M_FIRE_PUNCH, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 4, 0, 9, 0, RGB(31, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

FireSpreadEffect:: @ 81D0950
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 192, 176, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, -192, 240, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 192, -160, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, -192, -112, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 160, 48, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, -224, -32, 40
	createsprite gFireSpreadSpriteTemplate, ANIM_TARGET, 1, 0, 10, 112, -128, 40
	return

Move_LEER:: @ 81D09C8
	loadspritegfx ANIM_TAG_LEER
	monbg ANIM_ATTACKER
	monbgprio_28 0
	setalpha 8, 8
	playsewithpan SE_M_LEER, 192
	createsprite gLeerSpriteTemplate, ANIM_ATTACKER, 2, 24, -12
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, 0, 1
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 1, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	blendoff
	delay 1
	waitforvisualfinish
	end

Move_DREAM_EATER:: @ 81D0A1F
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	playsewithpan SE_M_PSYBEAM, 192
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_MINIMIZE, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, 1, 1
	waitforvisualfinish
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 2, 25, 1
	call DreamEaterAbsorb
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	delay 1
	call UnsetPsychicBg
	end

DreamEaterAbsorb:: @ 81D0A89
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -40, 35
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 28, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, -15, -16, 36
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 16, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -5, 15, 36, 33
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, -5, -8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 5, 8, 26
	createsprite gAbsorptionOrbSpriteTemplate, ANIM_ATTACKER, 3, 5, -18, -20, 35
	delay 4
	return

Move_POISON_GAS:: @ 81D0C22
	loadspritegfx ANIM_TAG_PURPLE_GAS_CLOUD
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	delay 0
	monbg ANIM_DEF_PARTNER
	monbgprio_29
	setalpha 12, 8
	delay 0
	playsewithpan SE_M_MIST, 192
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, 192
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, 192
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, 192
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, 192
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_M_MIST, 192
	createsprite gPoisonGasCloudSpriteTemplate, ANIM_TARGET, 0, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 40
	loopsewithpan SE_M_MIST, 63, 28, 6
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 6, 2, 0, 12, 26650
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	end

Move_BIND:: @ 81D0D00
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 3328, 4, 0
	goto BindWrap

BindWrap:: @ 81D0D16
	playsewithpan SE_M_BIND, 63
	call BindWrapSqueezeTarget
	call BindWrapSqueezeTarget
	waitforvisualfinish
	end

BindWrapSqueezeTarget:: @ 81D0D26
	createvisualtask AnimTask_ScaleMonAndRestore, 5, 10, -5, 5, 1, 0
	delay 16
	return

Move_WRAP:: @ 81D0D3A
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, 0, 6, 4, 2, 4
	goto BindWrap

Move_PSYBEAM:: @ 81D0D50
	loadspritegfx ANIM_TAG_GOLD_RING
	playsewithpan SE_M_PSYBEAM, 192
	call SetPsychicBackground
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_PSYBEAM2, -64, 63, 3, 4, 0, 15
	call PsybeamRings
	call PsybeamRings
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 2048, 4, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 2, 2, 0, 12, 32351
	call PsybeamRings
	call PsybeamRings
	call PsybeamRings
	call PsybeamRings
	call PsybeamRings
	call PsybeamRings
	call PsybeamRings
	call PsybeamRings
	call PsybeamRings
	waitforvisualfinish
	delay 1
	call UnsetPsychicBg
	end

PsybeamRings:: @ 81D0DD4
	createsprite gGoldRingSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 13, 0
	delay 4
	return

Move_HYPNOSIS:: @ 81D0DEA
	loadspritegfx ANIM_TAG_GOLD_RING
	call SetPsychicBackground
	call HypnosisRings
	call HypnosisRings
	call HypnosisRings
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 2, 2, 0, 12, 32351
	waitforvisualfinish
	delay 1
	call UnsetPsychicBg
	end

HypnosisRings:: @ 81D0E1D
	playsewithpan SE_M_SUPERSONIC, 192
	createsprite gGoldRingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 0, 8, 27, 0
	createsprite gGoldRingSpriteTemplate, ANIM_TARGET, 2, 16, -8, 0, -8, 27, 0
	delay 6
	return

Move_PSYWAVE:: @ 81D0E4A
	loadspritegfx ANIM_TAG_BLUE_RING
	playsewithpan SE_M_PSYBEAM, 192
	call SetPsychicBackground
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_TELEPORT, -64, 63, 2, 9, 0, 10
	call PsywaveRings
	call PsywaveRings
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 1, 4, 0, 12, 32351
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	call PsywaveRings
	waitforvisualfinish
	delay 1
	call UnsetPsychicBg
	end

PsywaveRings:: @ 81D0EAD
	createsprite gPsywaveRingSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, 16
	delay 4
	createsprite gPsywaveRingSpriteTemplate, ANIM_TARGET, 3, 10, 10, 0, 16
	delay 4
	return

Move_ZAP_CANNON:: @ 81D0ED0
	loadspritegfx ANIM_TAG_BLACK_BALL_2
	loadspritegfx ANIM_TAG_SPARK_2
	playsewithpan SE_M_THUNDER_WAVE, 192
	createsprite gZapCannonBallSpriteTemplate, ANIM_TARGET, 3, 10, 0, 0, 0, 30, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 0, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 64, 40, 1
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 128, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 16, 30, 192, 40, 2
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 32, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 96, 40, 1
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 160, 40, 0
	createsprite gZapCannonSparkSpriteTemplate, ANIM_TARGET, 4, 10, 0, 8, 30, 224, 40, 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	delay 15
	waitplaysewithpan SE_M_THUNDERBOLT2, 63, 19
	call ElectricityEffect
	waitforvisualfinish
	end

Move_STEEL_WING:: @ 81D0FB5
	loadspritegfx ANIM_TAG_GUST
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_HARDEN, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_M_WING_ATTACK, 192, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, 0, 12, 4, 1, 4
	createvisualtask AnimTask_AnimateGustTornadoPalette, 5, 1, 70
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, -25, 0, 0, 0, 20
	createsprite gGustToTargetSpriteTemplate, ANIM_ATTACKER, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 16, 0, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -16, 0, 1, 1
	playsewithpan SE_M_RAZOR_WIND, 63
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_IRON_TAIL:: @ 81D1064
	loadspritegfx ANIM_TAG_IMPACT
	loopsewithpan SE_M_HARDEN, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 0, 0
	waitforvisualfinish
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 0, 1
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

Move_POISON_TAIL:: @ 81D10C2
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	loopsewithpan SE_M_HARDEN, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 1, 1, 23768
	waitforvisualfinish
	monbg 1
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 0, 1
	clearmonbg 1
	blendoff
	call PoisonBubblesEffect
	waitforvisualfinish
	end

Move_METAL_CLAW:: @ 81D1128
	loadspritegfx ANIM_TAG_CLAW_SLASH
	loopsewithpan SE_M_HARDEN, 192, 28, 2
	createvisualtask AnimTask_MetallicShine, 5, 0, 0, 0
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 2
	playsewithpan SE_M_RAZOR_WIND, 63
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	delay 8
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 2
	playsewithpan SE_M_RAZOR_WIND, 63
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	waitforvisualfinish
	end

Move_NIGHT_SHADE:: @ 81D11BB
	monbg ANIM_ATTACKER
	monbgprio_28 0
	playsewithpan SE_M_PSYBEAM, 192
	fadetobg 2
	waitbgfadein
	delay 10
	playsewithpan SE_M_LEER, 192
	createvisualtask AnimTask_NightShadeClone, 5, 85
	delay 70
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 12, 1
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 0, 2, 0, 13, 0
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	delay 1
	restorebg
	waitbgfadein
	end

Move_EGG_BOMB:: @ 81D1203
	loadspritegfx ANIM_TAG_EXPLOSION
	loadspritegfx ANIM_TAG_LARGE_FRESH_EGG
	playsewithpan SE_M_TAIL_WHIP, 192
	createsprite gEggThrowSpriteTemplate, ANIM_TARGET, 2, 10, 0, 0, 0, 25, -32
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 16, 1
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 6, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -16, -15, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 16, -5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, -12, 18, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, 63
	delay 3
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 4, 0, 5, 1, 0
	playsewithpan SE_M_SELF_DESTRUCT, 63
	delay 3
	waitforvisualfinish
	end

Move_SHADOW_BALL:: @ 81D129D
	loadspritegfx ANIM_TAG_SHADOW_BALL
	fadetobg 2
	waitbgfadein
	delay 15
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_MIST, -64, 63, 5, 5, 0, 5
	createsprite gShadowBallSpriteTemplate, ANIM_TARGET, 2, 16, 16, 8
	waitforvisualfinish
	playsewithpan SE_M_SAND_ATTACK, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 8, 1
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_LICK:: @ 81D12E0
	loadspritegfx ANIM_TAG_LICK
	delay 15
	playsewithpan SE_M_LICK, 63
	createsprite gLickSpriteTemplate, ANIM_TARGET, 2, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 16, 1
	waitforvisualfinish
	end

Move_FOCUS_ENERGY:: @ 81D1307
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_M_DRAGON_RAGE, 192
	call EndureEffect
	delay 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, RGB_WHITE
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	call EndureEffect
	delay 8
	call EndureEffect
	waitforvisualfinish
	end

Move_BIDE:: @ 81D1347
	choosetwoturnanim BattleAnimScript_Bide_Setup, BattleAnimScript_Bide_Release
	end

BattleAnimScript_Bide_Setup:: @ 81D1351
	loopsewithpan SE_M_TAKE_DOWN, 192, 9, 2
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	waitforvisualfinish
	end

BattleAnimScript_Bide_Release:: @ 81D137D
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	loopsewithpan SE_M_TAKE_DOWN, 192, 9, 2
	createvisualtask AnimTask_BlendSelected, 10, 2, 2, 0, 11, RGB(31, 0, 0)
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 24, 0, 0, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, 0, 2, 0, 12, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 16, 1
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, 18, -8, 1, 1
	delay 5
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, -18, 8, 1, 1
	delay 5
	playsewithpan SE_M_COMET_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 1, -8, -5, 1, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 7
	waitforvisualfinish
	createvisualtask AnimTask_BlendSelected, 10, 2, 2, 11, 0, RGB(31, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_STRING_SHOT:: @ 81D1446
	loadspritegfx ANIM_TAG_STRING
	loadspritegfx ANIM_TAG_WEB_THREAD
	monbg ANIM_DEF_PARTNER
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 0, 9, 0
	waitforvisualfinish
	loopsewithpan SE_M_STRING_SHOT, 192, 9, 6
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	call StringShotThread
	waitforvisualfinish
	playsewithpan SE_M_STRING_SHOT2, 63
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, 10
	delay 4
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, -2
	delay 4
	createsprite gStringWrapSpriteTemplate, ANIM_TARGET, 2, 0, 22
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 9, 0, 0
	end

StringShotThread:: @ 81D1504
	createsprite gWebThreadSpriteTemplate, ANIM_TARGET, 2, 20, 0, 512, 20, 1
	delay 1
	return

Move_SPIDER_WEB:: @ 81D1518
	loadspritegfx ANIM_TAG_SPIDER_WEB
	loadspritegfx ANIM_TAG_WEB_THREAD
	monbg ANIM_DEF_PARTNER
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 0, 9, 0
	waitforvisualfinish
	monbgprio_28 1
	loopsewithpan SE_M_STRING_SHOT, 192, 9, 6
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	call SpiderWebThread
	waitforvisualfinish
	playsewithpan SE_M_STRING_SHOT2, 63
	createsprite gSpiderWebSpriteTemplate, ANIM_ATTACKER, 2, 
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 5, 1, 2, 9, 0, 0
	end

SpiderWebThread:: @ 81D15A5
	createsprite gWebThreadSpriteTemplate, ANIM_TARGET, 2, 20, 0, 512, 20, 0
	delay 1
	return

Move_RAZOR_WIND:: @ 81D15B9
	choosetwoturnanim RazorWindSetUp, RazorWindUnleash

RazorWindEnd:: @ 81D15C2
	waitforvisualfinish
	end

RazorWindSetUp:: @ 81D15C4
	loadspritegfx ANIM_TAG_GUST
	playsewithpan SE_M_GUST, 192
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 0, 7, 40
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 85, 7, 40
	createsprite gRazorWindTornadoSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 16, 16, 170, 7, 40
	waitforvisualfinish
	playsewithpan SE_M_GUST2, 192
	goto RazorWindEnd

RazorWindUnleash:: @ 81D1614
	loadspritegfx ANIM_TAG_AIR_WAVE_2
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, 8, 0, 0, 22, 2, 1
	delay 2
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, -8, 16, 14, 22, 1, 1
	delay 2
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gAirWaveCrescentSpriteTemplate, ANIM_ATTACKER, 2, 14, 12, -16, -14, 22, 0, 1
	delay 17
	playsewithpan SE_M_RAZOR_WIND, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 2, 0, 10, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	goto RazorWindEnd

Move_DISABLE:: @ 81D169F
	loadspritegfx ANIM_TAG_SPARKLE_4
	monbg 1
	monbgprio_28 1
	setalpha 8, 8
	playsewithpan SE_M_DETECT, 192
	createsprite gSpriteTemplate_83BF480, ANIM_ATTACKER, 13, 24, -16
	waitforvisualfinish
	createvisualtask AnimTask_GrowAndGreyscale, 5, 
	loopsewithpan SE_M_BIND, 63, 15, 4
	waitforvisualfinish
	delay 1
	clearmonbg 1
	blendoff
	end

Move_RECOVER:: @ 81D16CD
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_ATK_PARTNER
	setalpha 12, 8
	loopsewithpan SE_M_MEGA_KICK, 192, 13, 3
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 6, 0, 11, 12287
	call RecoverAbsorbEffect
	call RecoverAbsorbEffect
	call RecoverAbsorbEffect
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	delay 1
	call HealingEffect
	waitforvisualfinish
	end

RecoverAbsorbEffect:: @ 81D170D
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
	panse_1B SE_M_MINIMIZE, 63, 192, 253, 0
	createvisualtask AnimTask_ShrinkTargetCopy, 5, 128, 24
	delay 15
	createsprite gMimicOrbSpriteTemplate, ANIM_TARGET, 2, -12, 24
	delay 10
	setarg 7, 65535
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 2, 0, 11, RGB_WHITE
	waitforvisualfinish
	clearmonbg_23 3
	blendoff
	end

Move_CONSTRICT:: @ 81D17C1
	loadspritegfx ANIM_TAG_TENDRILS
	loopsewithpan SE_M_SCRATCH, 63, 6, 4
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 2
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 3, 0, -8, 1, 2
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 6, 1
	delay 20
	playsewithpan SE_M_BIND, 63
	setarg 7, 65535
	waitforvisualfinish
	end

Move_CURSE:: @ 81D1829
	choosetwoturnanim CurseGhost, CurseStats

CurseGhost:: @ 81D1832
	loadspritegfx ANIM_TAG_NAIL
	loadspritegfx ANIM_TAG_GHOSTLY_SPIRIT
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_CurseStretchingBlackBg, 5
	waitforvisualfinish
	delay 20
	createsprite gCurseNailSpriteTemplate, ANIM_ATTACKER, 2
	delay 60
	call CurseGhostShakeFromNail
	delay 41
	call CurseGhostShakeFromNail
	delay 41
	call CurseGhostShakeFromNail
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	delay 1
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_NIGHTMARE, 63
	createsprite gCurseGhostSpriteTemplate, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 14, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 16, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

CurseGhostShakeFromNail:: @ 81D1899
	createvisualtask AnimTask_ShakeMon2, 2, 0, 4, 0, 10, 0
	playsewithpan SE_M_BIND, 192
	return

CurseStats:: @ 81D18AF
	createvisualtask AnimTask_SwayMon, 5, 0, 10, 1536, 3, 0
	waitforvisualfinish
	delay 10
	call CurseStats1
	waitforvisualfinish
	end

CurseStats1:: @ 81D18CA
	playsewithpan SE_M_DRAGON_RAGE, 192
	createvisualtask AnimTask_SetUpCurseBackground, 5, 
	createvisualtask AnimTask_CurseBlendEffect, 5, 2, 4, 2, 0, 10, 31
	return

Move_SOFT_BOILED:: @ 81D18E9
	loadspritegfx ANIM_TAG_BREAKING_EGG
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_ATK_PARTNER
	playsewithpan SE_M_TAIL_WHIP, 192
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 2, 6, 1
	createsprite gSoftBoiledEggSpriteTemplate, ANIM_ATTACKER, 4, 0, 16, 0
	createsprite gSoftBoiledEggSpriteTemplate, ANIM_ATTACKER, 4, 0, 16, 1
	delay 120
	delay 7
	playsewithpan SE_M_HORN_ATTACK, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 10, 0, 31500
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 31, 16, 0, 1
	delay 8
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 31, 16, 0, 1
	delay 60
	setarg 7, 65535
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	call HealingEffect2
	end

Move_HEAL_BELL:: @ 81D196B
	loadspritegfx ANIM_TAG_BELL
	loadspritegfx ANIM_TAG_MUSIC_NOTES_2
	loadspritegfx ANIM_TAG_THIN_RING
	createvisualtask AnimTask_BlendSelected, 10, 10, 0, 0, 10, RGB_WHITE
	waitforvisualfinish
	createvisualtask AnimTask_LoadMusicNotesPals, 5
	createsprite gBellSpriteTemplate, ANIM_ATTACKER, 2, 0, -24, 0, 1
	delay 12
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 48, -18, 35, 0, 0
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -48, 20, 30, 1, 1
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -38, -29, 30, 2, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 36, 18, 30, 3, 3
	call HealBellRing
	delay 33
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 19, 26, 35, 4, 4
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -34, -12, 30, 5, 5
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 41, -20, 34, 6, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -15, 26, 32, 7, 0
	call HealBellRing
	delay 33
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -48, 18, 31, 0, 2
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 48, -20, 30, 2, 5
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 38, 29, 33, 4, 3
	createsprite gHealBellMusicNoteSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, -36, -18, 30, 6, 1
	call HealBellRing
	waitforvisualfinish
	createvisualtask AnimTask_FreeMusicNotesPals, 5
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_BELL
	unloadspritegfx ANIM_TAG_MUSIC_NOTES_2
	unloadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	playsewithpan SE_M_MORNING_SUN, 192
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gSparklingStarsSpriteTemplate, ANIM_ATTACKER, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_SPARKLE_2
	loadspritegfx ANIM_TAG_THIN_RING
	playsewithpan SE_SHINY, 192
	createvisualtask AnimTask_BlendExcept, 10, 4, 3, 10, 0, 31500
	createvisualtask AnimTask_BlendSelected, 10, 10, 3, 10, 0, RGB_WHITE
	createsprite gBlendThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 16, 0, 0, 0, 1
	end

HealBellRing:: @ 81D1B2F
	createvisualtask AnimTask_BlendExcept, 10, 4, 3, 8, 0, 31500
	createvisualtask AnimTask_BlendSelected, 10, 10, 3, 2, 10, RGB_WHITE
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 40, 0, -24, 0, 1
	playsewithpan SE_M_HEAL_BELL, 192
	return

Move_FAKE_OUT:: @ 81D1B65
	playsewithpan SE_M_FLATTER, 0
	createvisualtask AnimTask_FakeOut, 5, 
	waitforvisualfinish
	playsewithpan SE_M_SKETCH, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 16, 0, RGB_WHITE
	end

Move_SCARY_FACE:: @ 81D1BA0
	loadspritegfx ANIM_TAG_EYE_SPARKLE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 27, 3, 0, 16, 0
	playsewithpan SE_M_PSYBEAM, 192
	waitforvisualfinish
	delay 10
	playsewithpan SE_M_LEER, 192
	createvisualtask AnimTask_ScaryFace, 5, 
	delay 13
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, -16, -8
	createsprite gEyeSparkleSpriteTemplate, ANIM_ATTACKER, 0, 16, -8
	waitforvisualfinish
	createvisualtask AnimTask_ShakeTargetInPattern, 3, 20, 1, 0
	playsewithpan SE_M_STRING_SHOT2, 63
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 27, 3, 16, 0, 0
	waitforvisualfinish
	end

Move_SWEET_KISS:: @ 81D1C03
	loadspritegfx ANIM_TAG_RED_HEART
	loadspritegfx ANIM_TAG_ANGEL
	createsprite gAngelSpriteTemplate, ANIM_TARGET, 2, 16, -48
	playsewithpan SE_M_HEAL_BELL, 63
	delay 23
	playsewithpan SE_M_HEAL_BELL, 63
	delay 23
	playsewithpan SE_M_HEAL_BELL, 63
	waitforvisualfinish
	createsprite gRedHeartBurstSpriteTemplate, ANIM_TARGET, 3, 160, -30
	playsewithpan SE_M_ATTRACT, 63
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
	playsewithpan SE_M_PSYBEAM2, 63
	waitforvisualfinish
	playsewithpan SE_M_ATTRACT, 63
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -256, -42
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 128, -14
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, 416, -38
	createsprite gPinkHeartSpriteTemplate, ANIM_TARGET, 3, -128, -22
	end

Move_FURY_SWIPES:: @ 81D1CB3
	loadspritegfx ANIM_TAG_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, 63
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 5, 1
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, ANIM_TARGET, 2, 5, 5
	delay 4
	playsewithpan SE_M_SCRATCH, 63
	createsprite gFurySwipesSpriteTemplate, ANIM_TARGET, 2, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 7, 1
	end

Move_INGRAIN:: @ 81D1D17
	loadspritegfx ANIM_TAG_ROOTS
	loadspritegfx ANIM_TAG_ORBS
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, 16, 26, -1, 2, 150
	playsewithpan SE_M_SCRATCH, 192
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, -32, 20, 1, 1, 140
	playsewithpan SE_M_SCRATCH, 192
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, 32, 22, 1, 0, 130
	playsewithpan SE_M_SCRATCH, 192
	delay 10
	createsprite gIngrainRootSpriteTemplate, ANIM_ATTACKER, 2, -16, 25, -1, 3, 120
	playsewithpan SE_M_SCRATCH, 192
	delay 40
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, 32, 26, -1, 3, 30
	delay 5
	playsewithpan SE_M_BUBBLE3, 192
	delay 5
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, -48, 20, 1, 2, 30
	playsewithpan SE_M_BUBBLE3, 192
	delay 5
	playsewithpan SE_M_BUBBLE3, 192
	delay 5
	createsprite gIngrainOrbSpriteTemplate, ANIM_ATTACKER, 3, 48, 26, -2, 3, 18
	playsewithpan SE_M_BUBBLE3, 192
	delay 10
	waitforvisualfinish
	end

Move_PRESENT:: @ 81D1DC8
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_IsHealingMove, 2, 
	createsprite gPresentSpriteTemplate, ANIM_TARGET, 2, 0, -5, 10, 2, -1
	playsewithpan SE_M_TAIL_WHIP, 192
	delay 14
	playsewithpan SE_M_BUBBLE2, 192
	delay 14
	playsewithpan SE_M_BUBBLE2, 0
	delay 20
	playsewithpan SE_M_BUBBLE2, 63
	waitforvisualfinish
	jumpargeq 7, 0, PresentDamage
	jumpargeq 7, 1, PresentHeal
	end

PresentDamage:: @ 81D1E0B
	loadspritegfx ANIM_TAG_EXPLOSION
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_TARGET, 3, 16, 16, 1, 1
	end

PresentHeal:: @ 81D1E76
	loadspritegfx ANIM_TAG_GREEN_SPARKLE
	loadspritegfx ANIM_TAG_BLUE_STAR
	playsewithpan SE_M_MORNING_SUN, 63
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
	call HealingEffect2
	end

Move_BATON_PASS:: @ 81D1F1F
	loadspritegfx ANIM_TAG_POKEBALL
	playsewithpan SE_M_BATON_PASS, 192
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
	panse_1B SE_M_PERISH_SONG, 192, 63, 2, 0
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
	playsewithpan SE_M_SNORE, 192
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -1
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	playsewithpan SE_M_SNORE, 192
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -5
	delay 20
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	playsewithpan SE_M_SNORE, 192
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	delay 6
	createsprite gLetterZSpriteTemplate, ANIM_TARGET, 2, 0, 20, 5, -3
	waitforvisualfinish
	end

Move_HYPER_FANG:: @ 81D2165
	loadspritegfx ANIM_TAG_FANG_ATTACK
	playsewithpan SE_M_BITE, 63
	delay 1
	delay 2
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, HyperFangInContest
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, HyperFangOnOpponent
	goto HyperFangOnPlayer
HyperFangContinue:: @ 81D2193
	waitbgfadeout
	createsprite gFangSpriteTemplate, ANIM_TARGET, 2, 
	waitbgfadein
	createvisualtask AnimTask_ShakeMon, 3, 1, 0, 10, 10, 1
	playsewithpan SE_M_LEER, 63
	delay 20
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

HyperFangOnOpponent:: @ 81D21B7
	fadetobg 4
	goto HyperFangContinue

HyperFangOnPlayer:: @ 81D21BE
	fadetobg 5
	goto HyperFangContinue

HyperFangInContest:: @ 81D21C5
	fadetobg 6
	goto HyperFangContinue

Move_TRI_ATTACK:: @ 81D21CC
	loadspritegfx ANIM_TAG_TRI_FORCE_TRIANGLE
	createsprite gTriAttackTriangleSpriteTemplate, ANIM_TARGET, 2, 16, 0
	playsewithpan SE_M_TRI_ATTACK, 192
	delay 20
	playsewithpan SE_M_TRI_ATTACK, 192
	delay 20
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_TRI_ATTACK, -64, 63, 5, 6, 0, 7
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 16, 0
	delay 16
	loadspritegfx ANIM_TAG_FIRE
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 0
	playsewithpan SE_M_FLAME_WHEEL2, 63
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gLargeFlameScatterSpriteTemplate, ANIM_TARGET, 2, 0, 0, 30, 30, 3, 1
	delay 2
	createvisualtask AnimTask_ShakeTargetInPattern, 2, 20, 3, 1, 1
	waitforvisualfinish
	loadspritegfx ANIM_TAG_LIGHTNING
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	playsewithpan SE_M_TRI_ATTACK2, 63
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -48
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, -16
	delay 1
	createsprite gLightningSpriteTemplate, ANIM_TARGET, 2, 0, 16
	delay 20
	createvisualtask AnimTask_ShakeTargetInPattern, 2, 20, 3, 1, 0
	delay 2
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	waitforvisualfinish
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	call IceCrystalEffectShort
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 16, 0, 0
	waitforvisualfinish
	end

Move_WILL_O_WISP:: @ 81D2340
	loadspritegfx ANIM_TAG_WISP_FIRE
	loadspritegfx ANIM_TAG_WISP_ORB
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	playsewithpan SE_M_EMBER, 192
	waitplaysewithpan SE_M_EMBER, 192, 10
	createvisualtask SoundTask_AdjustPanningVar, 2, -64, -64, 1, 0
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0
	delay 3
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1
	delay 3
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 2
	delay 3
	createsprite gWillOWispOrbSpriteTemplate, ANIM_ATTACKER, 4, 0, 0, 3
	delay 40
	createvisualtask SoundTask_AdjustPanningVar, 2, -64, 63, 2, 0
	waitforvisualfinish
	monbgprio_29
	playsewithpan SE_M_FLAME_WHEEL2, 63
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 13, 1
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 0
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 42
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 84
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 126
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 168
	createsprite gWillOWispFireSpriteTemplate, ANIM_ATTACKER, 2, 210
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
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
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_ENCORE2, 63
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
	playsewithpan SE_M_SKETCH, 0
	createvisualtask AnimTask_StretchTargetUp, 3, 
	createvisualtask AnimTask_StretchAttackerUp, 3
	delay 30
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 24
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_DOUBLE_TEAM, 0
	delay 16
	playsewithpan SE_M_ATTRACT, 0
	createvisualtask AnimTask_ShakeMon, 3, 0, 5, 0, 7, 2
	createvisualtask AnimTask_ShakeMon, 3, 1, 5, 0, 7, 2
	waitforvisualfinish
	end

Move_WISH:: @ 81D2523
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 10, 0
	waitforvisualfinish
	panse_27 SE_M_REFLECT, 63, 192, 253, 0
	createsprite gWishStarSpriteTemplate, ANIM_ATTACKER, 40, 
	waitforvisualfinish
	delay 60
	loopsewithpan SE_M_HEAL_BELL, 192, 16, 3
	call GrantingStarsEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 10, 0, 0
	waitforvisualfinish
	end

Move_STOCKPILE:: @ 81D256B
	loadspritegfx ANIM_TAG_GRAY_ORB
	playsewithpan SE_M_MEGA_KICK, 192
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 8, 1, 0, 12, RGB_WHITE
	createvisualtask AnimTask_StockpileDeformMon, 5, 
	call StockpileAbsorb
	call StockpileAbsorb
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 12, 0, RGB_WHITE
	end

StockpileAbsorb:: @ 81D25A9
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
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_SpitUpDeformMon, 5, 
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 8, 2
	delay 45
	playsewithpan SE_M_SPIT_UP, 192
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
	jumpifmoveturn 2, SpitUpStrong
	jumpifmoveturn 3, SpitUpStrongest
SpitUpContinue:: @ 81D26B2
	delay 5
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 8, 1, 0
	playsewithpan SE_M_DOUBLE_SLAP, 63
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, -12, 10, 1, 1
	delay 5
	playsewithpan SE_M_DOUBLE_SLAP, 63
	createsprite gFlashingHitSplatSpriteTemplate, ANIM_TARGET, 3, 12, -10, 1, 1
	waitforvisualfinish
	end

SpitUpStrong:: @ 81D26EF
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 16
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 80
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 144
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 208
	goto SpitUpContinue

SpitUpStrongest:: @ 81D2718
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 16
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 48
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 80
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 112
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 144
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 176
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 208
	createsprite gSpitUpOrbSpriteTemplate, ANIM_ATTACKER, 2, 240
	goto SpitUpContinue

Move_SWALLOW:: @ 81D2765
	loadspritegfx ANIM_TAG_BLUE_ORB
	loadspritegfx ANIM_TAG_BLUE_STAR
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_SwallowDeformMon, 5, 
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 8, 2
	delay 38
	playsewithpan SE_M_SPIT_UP, 192
	createvisualtask AnimTask_ShakeMon2, 2, 0, 2, 0, 12, 1
	call SwallowEffect
	jumpifmoveturn 2, SwallowGood
	jumpifmoveturn 3, SwallowBest
SwallowContinue:: @ 81D27AF
	waitforvisualfinish
	call HealingEffect
	end

SwallowEffect:: @ 81D27B6
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

SwallowGood:: @ 81D27F8
	call SwallowEffect
	goto SwallowContinue

SwallowBest:: @ 81D2802
	call SwallowEffect
	call SwallowEffect
	goto SwallowContinue

Move_TRANSFORM:: @ 81D2811
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, 192
	waitplaysewithpan SE_M_MINIMIZE, 192, 48
	createvisualtask AnimTask_TransformMon, 2, 0
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

Move_MORNING_SUN:: @ 81D2829
	loadspritegfx ANIM_TAG_GREEN_STAR
	loadspritegfx ANIM_TAG_BLUE_STAR
	createvisualtask AnimTask_MorningSunLightBeam, 5, 
	delay 8
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 8, 0, 12, RGB_WHITE
	delay 14
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	call MorningSunStar
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 3, 12, 0, RGB_WHITE
	waitforvisualfinish
	waitsound
	call HealingEffect
	end

MorningSunStar:: @ 81D28AF
	createsprite gGreenStarSpriteTemplate, ANIM_ATTACKER, 2, 30, 640
	delay 5
	return

Move_SWEET_SCENT:: @ 81D28BD
	loadspritegfx ANIM_TAG_PINK_PETAL
	playsewithpan SE_M_SWEET_SCENT, 192
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 100, 0, 100
	delay 25
	setpan 0
	call SweetScentEffect
	createsprite gSweetScentPetalSpriteTemplate, ANIM_ATTACKER, 2, 55, 0
	setpan 63
	createvisualtask AnimTask_CurseBlendEffect, 2, 20, 1, 5, 5, 13, 22207
	call SweetScentEffect
	waitforvisualfinish
	end

SweetScentEffect:: @ 81D2901
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
	playsewithpan SE_M_HYPER_BEAM, 192
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 4, 1
	waitforvisualfinish
	delay 30
	createsoundtask SoundTask_LoopSEAdjustPanning, SE_M_HYPER_BEAM2, -64, 63, 1, 15, 0, 5
	createvisualtask AnimTask_ShakeMon, 2, 0, 0, 4, 50, 1
	createvisualtask AnimTask_FlashAnimTagWithColor, 2, 10147, 1, 12, 31, 16, 0, 0
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 50, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 11, RGB(25, 25, 25)
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	call HyperBeamOrbs
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 11, 0, RGB(25, 25, 25)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 4, 16, 0, 0
	end

HyperBeamOrbs:: @ 81D2AD8
	createsprite gHyperBeamOrbSpriteTemplate, ANIM_TARGET, 2, 
	createsprite gHyperBeamOrbSpriteTemplate, ANIM_TARGET, 2, 
	delay 1
	return

Move_FLATTER:: @ 81D2AE9
	loadspritegfx ANIM_TAG_SPOTLIGHT
	loadspritegfx ANIM_TAG_CONFETTI
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_ENCORE2, 63
	createvisualtask AnimTask_CreateSpotlight, 2, 
	createvisualtask AnimTask_HardwarePaletteFade, 2, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN, 3, 0, 10, FALSE
	waitforvisualfinish
	createsprite gFlatterSpotlightSpriteTemplate, ANIM_TARGET, 2, 0, -8, 80
	delay 0
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, 1
	delay 10
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 5, 2, 1
	delay 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_FLATTER, -64
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	call CreateFlatterConfetti
	delay 5
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_FLATTER, 63
	waitforvisualfinish
	createvisualtask AnimTask_HardwarePaletteFade, 2, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN, 3, 10, 0, TRUE
	waitforvisualfinish
	createvisualtask AnimTask_RemoveSpotlight, 2, 
	end

CreateFlatterConfetti:: @ 81D2BD2
	createsprite gFlatterConfettiSpriteTemplate, ANIM_ATTACKER, 40, 0
	createsprite gFlatterConfettiSpriteTemplate, ANIM_ATTACKER, 40, 1
	return

Move_ROLE_PLAY:: @ 81D2BE5
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 16, RGB_WHITE
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 0, 10, 0
	waitforvisualfinish
	playsewithpan SE_M_TRI_ATTACK, 192
	waitplaysewithpan SE_M_DETECT, 192, 30
	createvisualtask AnimTask_RolePlaySilhouette, 2, 
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 16, 0, RGB_WHITE
	delay 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 2, 10, 0, 0
	end

Move_REFRESH:: @ 81D2C42
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	playsewithpan SE_M_STAT_INCREASE, 192
	createvisualtask AnimTask_StatusClearedEffect, 2, 0
	waitforvisualfinish
	playsewithpan SE_M_MORNING_SUN, 192
	call GrantingStarsEffect
	waitforvisualfinish
	playsewithpan SE_SHINY, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 10, 0, 31500
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0
	end

Move_BLAZE_KICK:: @ 81D2C85
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_SMALL_EMBER
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_FLAME_WHEEL, 63
	createsprite gSpinningHandOrFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 30
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 7, RGB_WHITE
	delay 30
	playsewithpan SE_M_FIRE_PUNCH, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 14, 1
	createvisualtask AnimTask_BlendSelected, 10, 4, 2, 0, 0, RGB_WHITE
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 1, 0, 8, 0, 0
	call FireSpreadEffect
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_HYPER_VOICE:: @ 81D2D0D
	loadspritegfx ANIM_TAG_THIN_RING
	call HyperVoiceEffect
	waitforvisualfinish
	delay 8
	call HyperVoiceEffect
	waitforvisualfinish
	end

HyperVoiceEffect:: @ 81D2D1F
	createvisualtask sub_80DD334, 5
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 3, 8, 0, 1023
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 5, 0, 0
	createsprite gHyperVoiceRingSpriteTemplate, ANIM_ATTACKER, 0, 45, 0, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 1, 0, 6, 1
	createvisualtask AnimTask_ShakeMon2, 2, 3, 1, 0, 6, 1
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 1, 0, 6, 1
	createvisualtask SoundTask_WaitForCry, 5, 
	return

Move_SAND_TOMB:: @ 81D2D96
	loadspritegfx ANIM_TAG_MUD_SAND
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 563
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 43, 1
	playsewithpan SE_M_SAND_TOMB, 63
	call SandTombSwirlingDirt
	call SandTombSwirlingDirt
	call SandTombSwirlingDirt
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 563
	waitforvisualfinish
	end

SandTombSwirlingDirt:: @ 81D2DE3
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 32, 528, 30, 10, 50, 1
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 36, 480, 20, 13, -46, 1
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 37, 576, 20, 5, 42, 1
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 35, 400, 25, 8, -42, 1
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 32, 512, 25, 13, 46, 1
	delay 2
	createsprite gSwirlingDirtSpriteTemplate, ANIM_TARGET, 2, 0, 37, 464, 30, 12, -50, 1
	delay 2
	return

Move_SHEER_COLD:: @ 81D2E6E
	fadetobg 15
	waitbgfadeout
	playsewithpan SE_M_ICY_WIND, 0
	waitbgfadein
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_FrozenIceCube, 2
	waitplaysewithpan SE_M_HAIL, 63, 17
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_ARM_THRUST:: @ 81D2E93
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	loadspritegfx ANIM_TAG_IMPACT
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_RotateMonSpriteToSide, 5, 8, 5, 0, 0
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 3
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gArmThrustHandSpriteTemplate, ANIM_TARGET, 2, 10, -8, 14, 3
	waitforvisualfinish
	createvisualtask AnimTask_RotateMonSpriteToSide, 5, 8, 5, 0, 1
	playsewithpan SE_M_DOUBLE_SLAP, 63
	choosetwoturnanim ArmThrustRight, ArmThrustLeft
ArmThrustContinue:: @ 81D2EEC
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	blendoff
	end

ArmThrustRight:: @ 81D2F00
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, 8, 0, 1, 2
	goto ArmThrustContinue

ArmThrustLeft:: @ 81D2F14
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -8, 0, 1, 2
	goto ArmThrustContinue

Move_MUDDY_WATER:: @ 81D2F28
	panse_1B SE_M_WHIRLPOOL, 192, 63, 2, 0
	createvisualtask AnimTask_CreateSurfWave, 2, 1
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
	playsewithpan SE_M_SACRED_FIRE2, 192
	createvisualtask AnimTask_BlendSelected, 10, 2, 4, 0, 8, RGB(31, 19, 0)
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 15, 1
	call DragonClawFireSpiral
	call DragonClawFireSpiral
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_RAZOR_WIND, 63
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, -10, 10, 0
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_RAZOR_WIND, 63
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, -10, 1
	createsprite gClawSlashSpriteTemplate, ANIM_TARGET, 2, 10, 10, 1
	createsprite gShakeMonOrTerrainSpriteTemplate, ANIM_ATTACKER, 2, -4, 1, 10, 3, 1
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, 0
	createvisualtask AnimTask_BlendSelected, 10, 2, 4, 8, 0, RGB(31, 19, 0)
	waitforvisualfinish
	end

DragonClawFireSpiral:: @ 81D31AD
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createsprite gFireSpinSpriteTemplate, ANIM_ATTACKER, 2, 0, 33, 464, 30, 15, -50, 0
	delay 2
	return
	end

Move_MUD_SHOT:: @ 81D3239
	loadspritegfx ANIM_TAG_BROWN_ORB
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 46, 1
	delay 6
	createvisualtask AnimTask_StartSinAnimTimer, 5, 100
	panse_1B SE_M_WHIRLPOOL, 192, 63, 1, 0
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 43, 1
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	call MudShotOrbs
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

MudShotOrbs:: @ 81D32B3
	createsprite gMudShotOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	createsprite gMudShotOrbSpriteTemplate, ANIM_ATTACKER, 3, 10, 10, 0, 16
	delay 2
	return

Move_METEOR_MASH:: @ 81D32D6
	loadspritegfx ANIM_TAG_GOLD_STARS
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	panse_1B SE_M_BARRIER, 192, 63, 3, 0
	fadetobg 16
	waitbgfadein
	waitforvisualfinish
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -48, -64, 72, 32, 30
	delay 10
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -112, -64, 8, 32, 30
	delay 40
	createsprite gSpinningHandOrFootSpriteTemplate, ANIM_TARGET, 3, 0, 0, 0, 30
	createsprite gMeteorMashStarSpriteTemplate, ANIM_TARGET, 3, -80, -64, 40, 32, 30
	delay 20
	playsewithpan SE_M_VITAL_THROW2, 63
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
	playsewithpan SE_M_TAKE_DOWN, 192
	createsprite gRevengeSmallScratchSpriteTemplate, ANIM_ATTACKER, 2, 10, -10
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 0, 4, 2, 8, 31
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_PURPLE_SCRATCH
	loadspritegfx ANIM_TAG_PURPLE_SWIPE
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 6, 4
	delay 4
	playsewithpan SE_M_SWAGGER, 63
	createsprite gRevengeBigScratchSpriteTemplate, ANIM_TARGET, 2, 10, -10
	waitforvisualfinish
	unloadspritegfx ANIM_TAG_PURPLE_SWIPE
	loadspritegfx ANIM_TAG_IMPACT
	createvisualtask AnimTask_ShakeMon2, 2, 1, 3, 0, 10, 1
	createsprite gPersistHitSplatSpriteTemplate, ANIM_TARGET, 3, -10, -8, 1, 1, 8
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 8
	createsprite gPersistHitSplatSpriteTemplate, ANIM_TARGET, 3, 10, 8, 1, 1, 8
	playsewithpan SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_POISON_FANG:: @ 81D33F4
	loadspritegfx ANIM_TAG_FANG_ATTACK
	loadspritegfx ANIM_TAG_POISON_BUBBLE
	playsewithpan SE_M_BITE, 63
	createsprite gFangSpriteTemplate, ANIM_TARGET, 2, 
	delay 10
	createvisualtask AnimTask_ShakeMon, 3, 1, 3, 0, 10, 1
	waitforvisualfinish
	createvisualtask AnimTask_CurseBlendEffect, 2, 4, 0, 4, 0, 12, 26650
	call PoisonBubblesEffect
	waitforvisualfinish
	end

Move_SUBSTITUTE:: @ 81D3433
	playsewithpan SE_M_ATTRACT, 192
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
	playsewithpan SE_M_SCRATCH, 192
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 20, -8, -2, 0, 1, 95
	playsewithpan SE_M_SCRATCH, 213
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 30, 8, -4, 0, 0, 90
	playsewithpan SE_M_SCRATCH, 234
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 40, -8, 4, 0, 1, 85
	playsewithpan SE_M_SCRATCH, 0
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 50, 8, 0, 0, 0, 85
	playsewithpan SE_M_SCRATCH, 21
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 60, -8, -2, 0, 1, 85
	playsewithpan SE_M_SCRATCH, 42
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 75, 8, 0, 0, 0, 85
	playsewithpan SE_M_SCRATCH, 63
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 85, 16, 6, 0, 3, 80
	playsewithpan SE_M_SCRATCH, 63
	delay 5
	createsprite gFrenzyPlantRootSpriteTemplate, ANIM_ATTACKER, 2, 85, -16, -6, 0, 2, 75
	playsewithpan SE_M_SCRATCH, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -10, 1, 3
	playsewithpan SE_M_DOUBLE_SLAP, 63
	createvisualtask AnimTask_ShakeMon, 3, 1, 8, 0, 20, 1
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 8, 1, 3
	playsewithpan SE_M_DOUBLE_SLAP, 63
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, -3, 1, 2
	playsewithpan SE_M_DOUBLE_SLAP, 63
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -3, 1, 1, 2
	playsewithpan SE_M_DOUBLE_SLAP, 63
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, 1, 1, 1
	playsewithpan SE_M_DOUBLE_SLAP, 63
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 10, 1, 1
	playsewithpan SE_M_DOUBLE_SLAP, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 1, 2, 5, 0, 0
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

Move_METAL_SOUND:: @ 81D35E3
	loadspritegfx ANIM_TAG_METAL_SOUND_WAVES
	monbg ANIM_DEF_PARTNER
	monbgprio_2A 1
	createvisualtask AnimTask_ShakeMon2, 2, 0, 2, 0, 8, 1
	call MetalSoundRings
	call MetalSoundRings
	call MetalSoundRings
	call MetalSoundRings
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	waitforvisualfinish
	end

MetalSoundRings:: @ 81D3616
	panse_1B SE_M_SCREECH, 192, 63, 2, 0
	createsprite gMetalSoundSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_FOCUS_PUNCH:: @ 81D3633
	goto FocusPunch
FocusPunchEnd:: @ 81D3638
	waitforvisualfinish
	end

FocusPunch:: @ 81D363A
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_HANDS_AND_FEET
	delay 1
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, FocusPunchInContest
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, FocusPunchOnOpponent
	jumpargeq 7, 1, FocusPunchOnPlayer
FocusPunchContinue:: @ 81D3668
	waitbgfadein
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SWAGGER, 63
	createsprite gFocusPunchFistSpriteTemplate, ANIM_TARGET, 2
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 8, 0, 24, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 2, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, -6, 1, 0
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 8, 1, 0
	playsewithpan SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto FocusPunchEnd

FocusPunchOnOpponent:: @ 81D36E5
	fadetobg 4
	goto FocusPunchContinue

FocusPunchOnPlayer:: @ 81D36EC
	fadetobg 5
	goto FocusPunchContinue

FocusPunchInContest:: @ 81D36F3
	fadetobg 6
	goto FocusPunchContinue

Move_RETURN:: @ 81D36FA
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_GetReturnPowerLevel, 2, 
	delay 2
	jumpargeq 7, 0, ReturnWeak
	jumpargeq 7, 1, ReturnMedium
	jumpargeq 7, 2, ReturnStrong
	jumpargeq 7, 3, ReturnStrongest
ReturnContinue:: @ 81D372B
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

ReturnWeak:: @ 81D3730
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_COMET_PUNCH, 63
	goto ReturnContinue

ReturnMedium:: @ 81D3782
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	waitforvisualfinish
	delay 11
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 5, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, 63
	goto ReturnContinue

ReturnStrong:: @ 81D37E2
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 6, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -5, 3, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	goto ReturnContinue

ReturnStrongest:: @ 81D38FD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 0, 6, 0
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 16, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 12, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 4
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 2
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 1, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 2, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	waitforvisualfinish
	call ReturnStrongestHit
	call ReturnStrongestHit
	call ReturnStrongestHit
	call ReturnStrongestHit
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -10, -8, 1, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 8, 0, 24, 1
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 1, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, 63
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 3, -5, 1, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, 63
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, -5, 3, 1, 0
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MEGA_KICK2, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6, 0, 0
	goto ReturnContinue

ReturnStrongestHit:: @ 81D3B35
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 4, 3, 0
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_TAIL_WHIP, -64
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_VITAL_THROW2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask AnimTask_CloneBattlerSpriteWithBlend, 2, 0, 4, 5, 1
	waitforvisualfinish
	return

Move_COSMIC_POWER:: @ 81D3B89
	loadspritegfx ANIM_TAG_SPARKLE_2
	createvisualtask SoundTask_PlaySE2WithPanning, 5, SE_M_COSMIC_POWER, 0
	playsewithpan SE_M_COSMIC_POWER, 0
	createvisualtask AnimTask_BlendNonAttackerPalettes, 2, 0, 0, 15, 0
	waitforvisualfinish
	fadetobg 16
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 2, 0, 128, 0, -1
	waitbgfadein
	delay 70
	createvisualtask SoundTask_PlaySE1WithPanning, 5, SE_M_MORNING_SUN, -64
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, 12, -5, 0, 0, 32, 60
	delay 40
	createvisualtask AnimTask_BlendNonAttackerPalettes, 2, 0, 15, 0, 0
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
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SACRED_FIRE, 192
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -20, -10, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 0, -16, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 20, -10, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 32, 0, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 20, 10, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 16, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -20, 10, 24, 0, 0, 0
	delay 25
	playsewithpan SE_M_FLAME_WHEEL2, 192
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -64, 0, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 6, -40, -20, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 70, 0, -32, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 70, 40, -20, 24, 0, 0, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 64, 0, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 40, 20, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 32, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -40, 20, 24, 0, 0, 0
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 25
	playsewithpan SE_M_FLAME_WHEEL2, 192
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -96, 0, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 6, -60, -30, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 70, 0, -48, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 70, 60, -30, 24, 0, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, 3, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 12, 0, 20, 1
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 96, 0, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 66, 60, 30, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, 0, 48, 24, 0, 0, 0
	createsprite gFirePlumeSpriteTemplate, ANIM_ATTACKER, 2, -60, 30, 24, 0, 0, 0
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ROCK_TOMB:: @ 81D3E50
	loadspritegfx ANIM_TAG_X_SIGN
	loadspritegfx ANIM_TAG_ROCKS
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, 20, 12, 64, 114, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, 63
	delay 8
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, -20, 12, 64, 98, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, 63
	delay 8
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 66, 3, 6, 64, 82, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, 63
	delay 8
	createsprite gRockTombRockSpriteTemplate, ANIM_TARGET, 2, -3, 13, 64, 66, 0
	delay 8
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 0, 2, 3, 1
	playsewithpan SE_M_STRENGTH, 63
	delay 24
	playsewithpan SE_M_HYPER_BEAM, 63
	createsprite gRedXSpriteTemplate, ANIM_TARGET, 5, 1, 50
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 20, 1
	createvisualtask AnimTask_ShakeBattleTerrain, 2, 2, 0, 10, 1
	waitforvisualfinish
	end

Move_SILVER_WIND:: @ 81D3F37
	loadspritegfx ANIM_TAG_SPARKLE_6
	panse_1B SE_M_GUST, 192, 63, 2, 0
	playsewithpan SE_M_MORNING_SUN, 0
	delay 0
	monbg ANIM_DEF_PARTNER
	monbgprio_29
	delay 0
	createvisualtask AnimTask_BlendExcept, 10, 1, 0, 0, 4, 0
	createvisualtask AnimTask_GetTargetSide, 2, 
	jumpargeq 7, 1, SilverWindOnPlayer
	fadetobg BG_BUG_OPPONENT
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 1536, 0, 0, -1
SilverWindContinue:: @ 81D3F7E
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
	playsewithpan SE_M_GUST2, 63
	clearmonbg ANIM_DEF_PARTNER
	delay 0
	restorebg
	waitbgfadeout
	createvisualtask AnimTask_BlendExcept, 10, 1, 0, 4, 0, 0
	setarg 7, 65535
	waitbgfadein
	end

SilverWindOnPlayer:: @ 81D4138
	fadetobg BG_BUG_PLAYER
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -1536, 0, 0, -1
	goto SilverWindContinue

Move_SNATCH:: @ 81D414F
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_WindUpLunge, 5, 0, -12, 4, 10, 10, 12, 6
	end

Move_DIVE:: @ 81D4169
	loadspritegfx ANIM_TAG_SPLASH
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	choosetwoturnanim DiveSetUp, DiveAttack

DiveSetUp:: @ 81D4178
	loadspritegfx ANIM_TAG_ROUND_SHADOW
	playsewithpan SE_M_HEADBUTT, 192
	createsprite gDiveBallSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 13, 336
	waitforvisualfinish
	playsewithpan SE_M_DIVE, 192
	createsprite gDiveWaterSplashSpriteTemplate, ANIM_ATTACKER, 3, 0
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	call DiveSetUpWaterDroplets
	end

DiveSetUpWaterDroplets:: @ 81D41B6
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_ATTACKER, 5, 0, 0
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_ATTACKER, 5, 1, 0
	return

DiveAttack:: @ 81D41CD
	loadspritegfx ANIM_TAG_WATER_IMPACT
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_EXPLOSION, 63
	createsprite gDiveWaterSplashSpriteTemplate, ANIM_TARGET, 3, 1
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	call DiveAttackWaterDroplets
	delay 12
	call RisingWaterHitEffect
	waitforvisualfinish
	visible 0
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

DiveAttackWaterDroplets:: @ 81D420C
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	return

Move_ROCK_BLAST:: @ 81D4223
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 3
	playsewithpan SE_M_SWAGGER, 192
	createsprite gRockBlastRockSpriteTemplate, ANIM_TARGET, 2, 16, 0, 0, 0, 25, 257
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 1
	playsewithpan SE_M_ROCK_THROW, 63
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, 0, 0, 20, 24, 14, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 5, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, 5, 0, -20, 24, 14, 1
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, 0, 5, 20, -24, 14, 2
	createsprite gRockFragmentSpriteTemplate, ANIM_TARGET, 2, -5, 0, -20, -24, 14, 2
	waitforvisualfinish
	end

Move_OVERHEAT:: @ 81D42C0
	loadspritegfx ANIM_TAG_SMALL_EMBER
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 18
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 5, 28
	waitforvisualfinish
	createvisualtask AnimTask_AllocBackupPalBuffer, 5
	waitforvisualfinish
	createvisualtask AnimTask_CopyPalUnfadedToBackup, 5, 0, 1
	delay 1
	createvisualtask AnimTask_CopyPalFadedToUnfaded, 5, 0
	delay 1
	playsewithpan SE_M_DRAGON_RAGE, 192
	createvisualtask AnimTask_CopyPalUnfadedToBackup, 5, 1, 0
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 1, 0, 13, 28
	createvisualtask AnimTask_ShakeMon, 5, 0, 2, 0, 15, 1
	waitforvisualfinish
	playsewithpan SE_M_FLAME_WHEEL2, 192
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 30, 25, -20
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 32, 30, 25, -20
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 64, 30, 25, -20
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 96, 30, 25, -20
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 128, 30, 25, -20
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 160, 30, 25, -20
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 192, 30, 25, -20
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 224, 30, 25, -20
	delay 5
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 30, 25, 0
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 32, 30, 25, 0
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 64, 30, 25, 0
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 96, 30, 25, 0
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 128, 30, 25, 0
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 160, 30, 25, 0
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 192, 30, 25, 0
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 224, 30, 25, 0
	delay 5
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 30, 25, 10
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 32, 30, 25, 10
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 64, 30, 25, 10
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 96, 30, 25, 10
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 2, 1, 128, 30, 25, 10
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 160, 30, 25, 10
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 192, 30, 25, 10
	createsprite gOverheatFlameSpriteTemplate, ANIM_ATTACKER, 66, 1, 224, 30, 25, 10
	delay 5
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -5, 3, 1, 0
	playsewithpan SE_M_FIRE_PUNCH, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 10, 0, 25, 1
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 8, -5, 1, 0
	playsewithpan SE_M_FIRE_PUNCH, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 10, 10, 1, 0
	playsewithpan SE_M_FIRE_PUNCH, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 0
	playsewithpan SE_M_FIRE_PUNCH, 63
	createvisualtask AnimTask_CopyPalFadedToUnfaded, 5, 1
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, -1, 0, 13, 19026
	createvisualtask AnimTask_ShakeMon, 5, 0, 3, 0, 15, 1
	waitforvisualfinish
	createvisualtask AnimTask_CopyPalUnfadedFromBackup, 5, 0, 1
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 5, 0, 28
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	waitforvisualfinish
	delay 15
	createvisualtask AnimTask_CopyPalUnfadedFromBackup, 5, 1, 0
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 0, 13, 0, 19026
	waitforvisualfinish
	createvisualtask AnimTask_FreeBackupPalBuffer, 5
	waitforvisualfinish
	end

Move_HYDRO_CANNON:: @ 81D45B2
	loadspritegfx ANIM_TAG_WATER_ORB
	loadspritegfx ANIM_TAG_WATER_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_M_SURF, 192
	createsprite gHydroCannonChargeSpriteTemplate, ANIM_TARGET, 2, 
	delay 10
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	delay 30
	panse_1B SE_M_HYDRO_PUMP, 192, 63, 2, 0
	call HydroCannonBeam
	createvisualtask AnimTask_ShakeMon, 5, 1, 10, 0, 40, 1
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	call HydroCannonBeam
	createsprite gWaterHitSplatSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1, 0
	waitforvisualfinish
	createvisualtask AnimTask_InvertScreenColor, 2, 257, 257, 257
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

HydroCannonBeam:: @ 81D467C
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gHydroCannonBeamSpriteTemplate, ANIM_TARGET, 2, 10, -10, 0, 0, 15, 257
	return

Move_ASTONISH:: @ 81D46E4
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	playsewithpan SE_M_ENCORE, 192
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 25
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	playsewithpan SE_M_SKETCH, 63
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3, 
	waitforvisualfinish
	end

Move_SEISMIC_TOSS:: @ 81D472C
	loadspritegfx ANIM_TAG_IMPACT
	loadspritegfx ANIM_TAG_ROCKS
	setarg 7, 0
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	waitforvisualfinish
	createvisualtask AnimTask_GetSeismicTossDamageLevel, 3, 
	delay 1
	fadetobg 17
	waitbgfadeout
	createvisualtask AnimTask_MoveSeismicTossBg, 3
	playsewithpan SE_M_SKY_UPPERCUT, 0
	waitbgfadein
	waitforvisualfinish
	createvisualtask AnimTask_SeismicTossBgAccelerateDownAtEnd, 3
	jumpargeq 7, 0, SeismicTossWeak
	jumpargeq 7, 1, SeismicTossMedium
	jumpargeq 7, 2, SeismicTossStrong
SeismicTossContinue:: @ 81D4774
	restorebg
	waitbgfadeout
	setarg 7, 4095
	waitbgfadein
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

SeismicTossWeak:: @ 81D477F
	call SeismicTossRockScatter1
	delay 16
	call SeismicTossRockScatter2
	goto SeismicTossContinue

SeismicTossMedium:: @ 81D4790
	call SeismicTossRockScatter1
	delay 14
	call SeismicTossRockScatter2
	delay 14
	call SeismicTossRockScatter1
	goto SeismicTossContinue

SeismicTossStrong:: @ 81D47A8
	call SeismicTossRockScatter2
	delay 10
	call SeismicTossRockScatter1
	delay 10
	call SeismicTossRockScatter2
	delay 10
	call SeismicTossRockScatter1
	goto SeismicTossContinue

SeismicTossRockScatter1:: @ 81D47C7
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -10, -8, 1, 1
	playsewithpan SE_M_STRENGTH, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 5, 1
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -12, 27, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 8, 28, 3, 4
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -4, 30, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 12, 25, 4, 4
	return

SeismicTossRockScatter2:: @ 81D4828
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 10, -8, 1, 1
	playsewithpan SE_M_ROCK_THROW, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 5, 1
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -12, 32, 3, 4
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 8, 31, 2, 2
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -4, 28, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 12, 30, 4, 3
	return

Move_MAGIC_COAT:: @ 81D4889
	loadspritegfx ANIM_TAG_ORANGE_LIGHT_WALL
	setalpha 0, 16
	waitplaysewithpan SE_M_BARRIER, 192, 15
	createsprite gMagicCoatWallSpriteTemplate, ANIM_ATTACKER, 3, 40, 0, 10170
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_WATER_PULSE:: @ 81D48A6
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	loadspritegfx ANIM_TAG_BLUE_RING_2
	monbg 1
	monbgprio_28 1
	playsewithpan SE_M_BUBBLE3, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 0, 7, 29472
	delay 10
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gWaterPulseBubbleSpriteTemplate, ANIM_ATTACKER, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_M_BUBBLE3, 63
	waitforvisualfinish
	playsewithpan SE_M_GIGA_DRAIN, 192
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, 192
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 5
	playsewithpan SE_M_GIGA_DRAIN, 192
	createsprite gWaterPulseRingSpriteTemplate, ANIM_TARGET, 2, 0, 0, 40, 15
	delay 13
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 8, 18, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 7, 0, 29472
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Move_PSYCHO_BOOST:: @ 81D499B
	loadspritegfx ANIM_TAG_CIRCLE_OF_LIGHT
	monbg ANIM_ATK_PARTNER
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
	loopsewithpan SE_M_PSYBEAM2, 192, 14, 10
	createsprite gPsychoBoostOrbSpriteTemplate, ANIM_ATTACKER, 2
	delay 110
	loopsewithpan SE_M_PSYBEAM2, 192, 7, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, -8, 1, 24, 1
	playsewithpan SE_M_LEER, 63
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	call UnsetPsychicBg
	end

Move_KNOCK_OFF:: @ 81D4A0F
	loadspritegfx ANIM_TAG_SLAM_HIT_2
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gHorizontalLungeSpriteTemplate, ANIM_ATTACKER, 2, 4, 6
	delay 4
	playsewithpan SE_M_VITAL_THROW, 63
	createsprite gKnockOffStrikeSpriteTemplate, ANIM_TARGET, 2, -16, -16
	delay 8
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 5, 1, RGB_WHITE, 10, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, 0, 1, 2
	playsewithpan SE_M_COMET_PUNCH, 63
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
	createvisualtask GetIsDoomDesireHitTurn, 2
	delay 1
	monbg ANIM_ATK_PARTNER
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 1, 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 4, 0
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_M_PSYBEAM, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, 0, 1
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SetGreyscaleOrOriginalPal, 5, 1, 1
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 4, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_ATK_PARTNER
	blendoff
	end
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5, 
	delay 5
	playsewithpan SE_M_CONFUSE_RAY, 192
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, 0
	delay 10
	playsewithpan SE_M_CONFUSE_RAY, 63
	delay 23
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 20, 1
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end

Move_SKY_UPPERCUT:: @ 81D4BC1
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	fadetobg 17
	waitbgfadeout
	playsewithpan SE_M_SKY_UPPERCUT, 192
	createvisualtask AnimTask_MoveSkyUppercutBg, 5, 55
	waitbgfadein
	setalpha 12, 8
	delay 38
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 0, 28, 0, 0, 5
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 6, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -28, 28, 1, 1
	delay 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -15, 8, 1, 1
	playsewithpan SE_M_VITAL_THROW2, 63
	delay 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -5, -12, 1, 1
	delay 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 0, -32, 1, 1
	delay 1
	playsewithpan SE_M_VITAL_THROW2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 5, -52, 1, 1
	createsprite gSlideMonToOffsetSpriteTemplate, ANIM_ATTACKER, 2, 1, -26, 16, 1, 4
	delay 4
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 0, 3, 6, 1
	delay 30
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 6
	delay 4
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 2, 1, 0, 6
	clearmonbg ANIM_DEF_PARTNER
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
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	playsewithpan SE_M_TWISTER, 63
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 120, 70, 5, 70, 30
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 55, 6, 60, 25
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 60, 7, 60, 30
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 55, 10, 60, 30
	delay 3
	createsprite gTwisterRockSpriteTemplate, ANIM_TARGET, 2, 100, 50, 4, 50, 26
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 105, 25, 8, 60, 20
	delay 1
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 40, 10, 48, 30
	delay 3
	createsprite gTwisterRockSpriteTemplate, ANIM_TARGET, 2, 120, 30, 6, 45, 25
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 115, 35, 10, 60, 30
	delay 3
	createsprite gTwisterRockSpriteTemplate, ANIM_TARGET, 2, 105, 20, 8, 40, 0
	delay 3
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 20, 255, 15, 32, 0
	createsprite gTwisterLeafParticleSpriteTemplate, ANIM_TARGET, 2, 110, 10, 8, 32, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, -32, -16, 1, 3
	playsewithpan SE_M_COMET_PUNCH, 63
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 3, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, 3, 3, 0, 12, 1
	delay 4
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 3
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 4
	createsprite gRandomPosHitSplatSpriteTemplate, ANIM_TARGET, 3, 1, 3
	playsewithpan SE_M_COMET_PUNCH, 63
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 3, 32, 20, 1, 3
	playsewithpan SE_M_COMET_PUNCH, 63
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_MAGICAL_LEAF:: @ 81D4E6D
	loadspritegfx ANIM_TAG_LEAF
	loadspritegfx ANIM_TAG_RAZOR_LEAF
	loadspritegfx ANIM_TAG_IMPACT
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_M_POISON_POWDER, 192, 10, 5
	createvisualtask AnimTask_CycleMagicalLeafPal, 5
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
	playsewithpan SE_M_RAZOR_WIND2, 192
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 32, 20, 0
	createsprite gRazorLeafCutterSpriteTemplate, ANIM_TARGET, 3, 20, -10, 20, 0, 32, -20, 0
	delay 30
	playsewithpan SE_M_RAZOR_WIND, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, -4, 1, 2
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, 10, 4, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	delay 20
	setarg 7, 65535
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

Move_ICE_BALL:: @ 81D4F8E
	loadspritegfx ANIM_TAG_ICE_CHUNK
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 4, IceBallSetIceBg
IceBallContinue:: @ 81D4FA5
	playsewithpan SE_M_ICY_WIND, 192
	createsprite gIceBallChunkSpriteTemplate, ANIM_TARGET, 2, 15, 0, -12, -16, 30, -40
	delay 28
	playsewithpan SE_M_BRICK_BREAK, 63
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 0, IceBallWeakest
	jumpargeq 0, 1, IceBallWeak
	jumpargeq 0, 2, IceBallMediun
	jumpargeq 0, 3, IceBallStrong
	jumpargeq 0, 4, IceBallStrongest
IceBallContinue2:: @ 81D4FF3
	createvisualtask AnimTask_GetRolloutCounter, 5, 0
	jumpargeq 0, 4, IceBallUnsetIceBg
IceBallEnd:: @ 81D5004
	end

IceBallSetIceBg:: @ 81D5005
	fadetobg 15
	goto IceBallContinue

IceBallUnsetIceBg:: @ 81D500C
	waitbgfadein
	delay 45
	restorebg
	waitbgfadein
	goto IceBallEnd

IceBallWeakest:: @ 81D5016
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 8, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallWeak:: @ 81D5045
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 10, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallMediun:: @ 81D507E
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 14, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallStrong:: @ 81D50C1
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 18, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallStrongest:: @ 81D5109
	createvisualtask AnimTask_ShakeTargetBasedOnMovePowerOrDmg, 2, 0, 1, 30, 1, 0
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	call IceBallImpactShard
	goto IceBallContinue2

IceBallImpactShard:: @ 81D5151
	createsprite gIceBallImpactShardSpriteTemplate, ANIM_TARGET, 4, -12, -16
	return

Move_WEATHER_BALL:: @ 81D515D
	loadspritegfx ANIM_TAG_WEATHER_BALL
	createsprite gVerticalDipSpriteTemplate, ANIM_ATTACKER, 2, 8, 1, 0
	delay 8
	playsewithpan SE_M_SWAGGER, 192
	createsprite gWeatherBallUpSpriteTemplate, ANIM_ATTACKER, 2
	waitforvisualfinish
	delay 15
	playsewithpan SE_M_DETECT, 0
	createsprite gComplexPaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 31, 5, 1, RGB_WHITE, 10, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_GetWeather, 2, 
	delay 1
	jumpargeq 7, 0, WeatherBallNormal
	jumpargeq 7, 1, WeatherBallFire
	jumpargeq 7, 2, WeatherBallWater
	jumpargeq 7, 3, WeatherBallSandstorm
	jumpargeq 7, 4, WeatherBallIce

WeatherBallNormal:: @ 81D51C8
	loadspritegfx ANIM_TAG_IMPACT
	createsprite gWeatherBallNormalDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK2, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 4, -10, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 8, 1
	waitforvisualfinish
	end

WeatherBallFire:: @ 81D5205
	loadspritegfx ANIM_TAG_SMALL_EMBER
	createsprite gWeatherBallFireDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 40, 10
	playsewithpan SE_M_FLAME_WHEEL, 63
	delay 10
	createsprite gWeatherBallFireDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, -40, 20
	playsewithpan SE_M_FLAME_WHEEL, 63
	delay 10
	createsprite gWeatherBallFireDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_M_FLAME_WHEEL, 63
	waitforvisualfinish
	playsewithpan SE_M_FLAME_WHEEL2, 63
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 8, 1
	waitforvisualfinish
	end

WeatherBallWater:: @ 81D5269
	loadspritegfx ANIM_TAG_SMALL_BUBBLES
	createsprite gWeatherBallWaterDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 50, 10
	playsewithpan SE_M_CRABHAMMER, 63
	delay 8
	createsprite gWeatherBallWaterDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, -20, 20
	playsewithpan SE_M_CRABHAMMER, 63
	delay 13
	createsprite gWeatherBallWaterDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_M_CRABHAMMER, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 0, 3, 8, 1
	playsewithpan SE_M_GIGA_DRAIN, 63
	waitforvisualfinish
	end

WeatherBallSandstorm:: @ 81D52CD
	loadspritegfx ANIM_TAG_ROCKS
	createsprite gWeatherBallRockDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 30, 0
	playsewithpan SE_M_ROCK_THROW, 63
	delay 5
	createsprite gWeatherBallRockDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, -40, 20
	playsewithpan SE_M_ROCK_THROW, 63
	delay 14
	createsprite gWeatherBallRockDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 1, 0, 0
	playsewithpan SE_M_ROCK_THROW, 63
	waitforvisualfinish
	playsewithpan SE_M_STRENGTH, 63
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -12, 27, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 8, 28, 3, 4
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, -4, 30, 2, 3
	createsprite gRockScatterSpriteTemplate, ANIM_TARGET, 2, 12, 25, 4, 4
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	waitforvisualfinish
	end

WeatherBallIce:: @ 81D536D
	loadspritegfx ANIM_TAG_HAIL
	loadspritegfx ANIM_TAG_ICE_CRYSTALS
	createsprite gWeatherBallIceDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 25, -40, 20
	playsewithpan SE_M_HAIL, 63
	delay 10
	createsprite gWeatherBallIceDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 25, 40, 0
	playsewithpan SE_M_HAIL, 63
	delay 10
	createsprite gWeatherBallIceDownSpriteTemplate, ANIM_TARGET, 2, -30, -100, 25, 25, 0, 0
	playsewithpan SE_M_HAIL, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	playsewithpan SE_M_ICY_WIND, 63
	call IceCrystalEffectShort
	waitforvisualfinish
	end

Move_COUNT:: @ 81D53D9
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_DOUBLE_SLAP, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

IceCrystalEffectShort:: @ 81D540A
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -10, -10, 0
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 10, 20, 0
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -5, 10, 0
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 17, -12, 0
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, -15, 15, 0
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, 20, 2, 0
	playsewithpan SE_M_ICY_WIND, 63
	return

IceCrystalEffectLong:: @ 81D548E
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -10, -10, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 10, 20, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -29, 0, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 29, -20, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -5, 10, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 17, -12, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, -20, 0, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, -15, 15, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 26, -5, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitSmallSpriteTemplate, ANIM_TARGET, 2, 0, 0, 1
	playsewithpan SE_M_ICY_WIND, 63
	delay 4
	createsprite gIceCrystalHitLargeSpriteTemplate, ANIM_TARGET, 2, 20, 2, 1
	playsewithpan SE_M_ICY_WIND, 63
	return
    
IceSpikesEffectShort: @ Unused
	loopsewithpan SE_M_ICY_WIND, 63, 6, 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 0, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 8, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -8, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 16, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -16, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 24, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -24, 24, 0
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 32, 24, 0
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -32, 24, 0
	return

IceSpikesEffectLong:: @ 81D55E2
	loopsewithpan SE_M_ICY_WIND, 63, 6, 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 0, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 8, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -8, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 16, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -16, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 24, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -24, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 32, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -32, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 40, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -40, 24, 1
	delay 4
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, 48, 24, 1
	createsprite gIceGroundSpikeSpriteTemplate, ANIM_TARGET, 2, -48, 24, 1
	return

GrantingStarsEffect:: @ 81D569E
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gGrantingStarsSpriteTemplate, ANIM_ATTACKER, 2, 12, -5, 0, 0, 32, 60
	delay 8
	return

HealingEffect:: @ 81D56C9
	playsewithpan SE_M_ABSORB_2, 192
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, -15, 10, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, -15, -15, 0, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_ATTACKER, 2, 10, -5, 0, 0
	delay 7
	return

HealingEffect2:: @ 81D5712
	playsewithpan SE_M_ABSORB_2, 63
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 0, -5, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, 10, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, -15, -15, 1, 0
	delay 7
	createsprite gHealingBlueStarSpriteTemplate, ANIM_TARGET, 2, 10, -5, 1, 0
	delay 7
	return

PoisonBubblesEffect:: @ 81D575B
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 10, 10, 0
	playsewithpan SE_M_TOXIC, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 20, -20, 0
	playsewithpan SE_M_TOXIC, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, -20, 15, 0
	playsewithpan SE_M_TOXIC, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 0, 0, 0
	playsewithpan SE_M_TOXIC, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, -20, -20, 0
	playsewithpan SE_M_TOXIC, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, ANIM_TARGET, 2, 16, -8, 0
	playsewithpan SE_M_TOXIC, 63
	return

WaterBubblesEffectShort:: @ 81D57CC
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 0
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 0
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 0
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 0
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, -20, 0
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 0
	playsewithpan SE_M_BUBBLE3, 63
	return

WaterBubblesEffectLong:: @ 81D583D
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 10, 10, 1
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -28, -10, 1
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 20, -20, 1
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, 15, 1
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 27, 8, 1
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, -20, -20, 1
	playsewithpan SE_M_BUBBLE3, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, ANIM_ATTACKER, 2, 16, -8, 1
	playsewithpan SE_M_BUBBLE3, 63
	return

ElectricityEffect:: @ 81D58D4
	playsewithpan SE_M_THUNDERBOLT2, 63
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

ConfusionEffect:: @ 81D595F
	loopsewithpan SE_M_DIZZY_PUNCH, 63, 13, 6
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 0, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 51, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 102, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 153, 3, 90
	createsprite gConfusionDuckSpriteTemplate, ANIM_TARGET, 2, 0, -15, 204, 3, 90
	return

SetPsychicBackground:: @ 81D59BB
	fadetobg 3
	waitbgfadeout
	createvisualtask AnimTask_SetPsychicBackground, 5, 
	waitbgfadein
	return

UnsetPsychicBg:: @ 81D59C7
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	return

SetSkyBg:: @ 81D59CF
	jumpifcontest SetSkyBgContest
	fadetobg 18
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, -2304, 768, 1, -1
SetSkyBgContinue:: @ 81D59E6
	waitbgfadein
	return

SetSkyBgContest:: @ 81D59E8
	fadetobg 19
	waitbgfadeout
	createvisualtask AnimTask_StartSlidingBg, 5, 2304, 768, 0, -1
	goto SetSkyBgContinue

UnsetSkyBg:: @ 81D59FF
	restorebg
	waitbgfadeout
	setarg 7, 65535
	waitbgfadein
	return

SetSolarbeamBg:: @ 81D5A07
	createvisualtask AnimTask_IsContest, 2, 
	jumpargeq 7, 1, SetSolarbeamBgContest
	createvisualtask AnimTask_IsTargetPlayerSide, 2, 
	jumpargeq 7, 0, SetSolarbeamBgOpponent
	goto SetSolarbeamBgPlayer
SetSolarbeamBgContinue:: @ 81D5A2A
	waitbgfadein
	return

SetSolarbeamBgContest:: @ 81D5A2C
	fadetobg BG_SOLARBEAM_CONTESTS
	goto SetSolarbeamBgContinue

SetSolarbeamBgPlayer:: @ 81D5A33
	fadetobg BG_SOLARBEAM_PLAYER
	goto SetSolarbeamBgContinue

SetSolarbeamBgOpponent:: @ 81D5A3A
	fadetobg BG_SOLARBEAM_OPPONENT
	goto SetSolarbeamBgContinue

UnsetSolarbeamBg:: @ 81D5A41
	restorebg
	waitbgfadein
	return

Status_Poison:: @ 81D5A44
	loopsewithpan SE_M_TOXIC, 63, 13, 6
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 18, 2
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 12, 31774
	end

Status_Confusion:: @ 81D5A6F
	loadspritegfx ANIM_TAG_DUCK
	call ConfusionEffect
	end

Status_Burn:: @ 81D5A78
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_M_FLAME_WHEEL, 63
	call BurnFlame
	call BurnFlame
	call BurnFlame
	waitforvisualfinish
	end

BurnFlame:: @ 81D5A90
	createsprite gBurnFlameSpriteTemplate, ANIM_TARGET, 2, -24, 24, 24, 24, 20, 1, 1
	delay 4
	return

Status_Infatuation:: @ 81D5AA8
	loadspritegfx ANIM_TAG_MAGENTA_HEART
	playsewithpan SE_M_CHARM, 192
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 0, 20
	delay 15
	playsewithpan SE_M_CHARM, 192
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, -20, 20
	delay 15
	playsewithpan SE_M_CHARM, 192
	createsprite gMagentaHeartSpriteTemplate, ANIM_ATTACKER, 3, 20, 20
	end

Status_Sleep:: @ 81D5ADD
	loadspritegfx ANIM_TAG_LETTER_Z
	playsewithpan SE_M_SNORE, 192
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	delay 30
	createsprite gSleepLetterZSpriteTemplate, ANIM_ATTACKER, 2, 4, -10, 16, 0, 0
	end

Status_Paralysis:: @ 81D5B09
	loadspritegfx ANIM_TAG_SPARK_2
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 10, 1
	call ElectricityEffect
	end

Status_Freeze:: @ 81D5B23
	playsewithpan SE_M_ICY_WIND, 0
	loadspritegfx ANIM_TAG_ICE_CUBE
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	waitplaysewithpan SE_M_HAIL, 63, 17
	createvisualtask AnimTask_FrozenIceCube, 2, 
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Status_Curse:: @ 81D5B3E
	loadspritegfx ANIM_TAG_GHOSTLY_SPIRIT
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_NIGHTMARE, 63
	createsprite gCurseGhostSpriteTemplate, ANIM_TARGET, 2, 
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

Status_Nightmare:: @ 81D5B63
	loadspritegfx ANIM_TAG_DEVIL
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_NIGHTMARE, 63
	createsprite gNightmareDevilSpriteTemplate, ANIM_TARGET, 2
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	end

General_CastformChange:: @ 81D5B88
	createvisualtask AnimTask_IsMonInvisible, 2, 
	jumpargeq 7, 1, CastformChangeSkipAnim
	goto CastformChangeContinue

CastformChangeContinue:: @ 81D5B9C
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, 192
	waitplaysewithpan SE_M_MINIMIZE, 192, 48
	createvisualtask AnimTask_TransformMon, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

CastformChangeSkipAnim:: @ 81D5BB4
	createvisualtask AnimTask_CastformGfxChange, 2, 1
	end

General_StatsChange:: @ 81D5BBE
	createvisualtask AnimTask_StatsChange, 5, 
	waitforvisualfinish
	end

General_SubstituteFade:: @ 81D5BC7
	monbg ANIM_ATTACKER
	createvisualtask AnimTask_SubstituteFadeToInvisible, 5
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_ATTACKER
	delay 2
	blendoff
	createvisualtask AnimTask_BlendSelected, 10, 2, 0, 0, 0, RGB_WHITE
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, 1
	end

General_SubstituteAppear:: @ 81D5C04
	createvisualtask AnimTask_MonToSubstitute, 2, 
	end

General_BaitThrow:: @ 81D5C0C
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 0
	createvisualtask AnimTask_LoadBaitGfx, 2, 
	delay 0
	waitplaysewithpan SE_M_JUMP_KICK, 192, 22
	createsprite gSafariBaitSpriteTemplate, ANIM_TARGET, 3, -18, 12, 0, 32
	delay 50
	loopsewithpan SE_M_TAIL_WHIP, 63, 19, 2
	createvisualtask AnimTask_SwayMon, 5, 1, 8, 1536, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_FreeBaitGfx, 2, 
	end

General_ItemKnockoff:: @ 81D5C54
	loadspritegfx ANIM_TAG_ITEM_BAG
	createsprite gKnockOffItemSpriteTemplate, ANIM_TARGET, 2, 
	end

General_TurnTrap:: @ 81D5C5F
	createvisualtask AnimTask_GetTrappedMoveAnimId, 5, 
	jumpargeq 0, 1, Status_FireSpin
	jumpargeq 0, 2, Status_Whirlpool
	jumpargeq 0, 3, Status_Clamp
	jumpargeq 0, 4, Status_SandTomb
	goto Status_BindWrap

Status_BindWrap:: @ 81D5C8B
	loadspritegfx ANIM_TAG_TENDRILS
	loopsewithpan SE_M_SCRATCH, 63, 6, 2
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 4, 0, 16, 0, 1
	delay 7
	createsprite gConstrictBindingSpriteTemplate, ANIM_TARGET, 2, 0, 8, 1, 1
	delay 3
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 8, 1
	delay 20
	setarg 7, 65535
	playsewithpan SE_M_BIND, 63
	waitforvisualfinish
	end

Status_FireSpin:: @ 81D5CD3
	loadspritegfx ANIM_TAG_SMALL_EMBER
	playsewithpan SE_M_SACRED_FIRE2, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	call FireSpinEffect
	call FireSpinEffect
	waitforvisualfinish
	stopsound
	end

Status_Whirlpool:: @ 81D5CF8
	loadspritegfx ANIM_TAG_WATER_ORB
	monbg ANIM_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 23968
	playsewithpan SE_M_WHIRLPOOL, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	call WhirlpoolEffect
	call WhirlpoolEffect
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 23968
	waitforvisualfinish
	stopsound
	clearmonbg ANIM_DEF_PARTNER
	end

Status_Clamp:: @ 81D5D4C
	loadspritegfx ANIM_TAG_CLAMP
	loadspritegfx ANIM_TAG_IMPACT
	monbg 1
	setalpha 12, 8
	playsewithpan SE_M_VICEGRIP, 63
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, -32, 0, 2, 819, 0, 10
	createsprite gClampJawSpriteTemplate, ANIM_ATTACKER, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	waitforvisualfinish
	end

Status_SandTomb:: @ 81D5DA9
	loadspritegfx ANIM_TAG_MUD_SAND
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 7, 563
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	playsewithpan SE_M_SAND_TOMB, 63
	call SandTombSwirlingDirt
	call SandTombSwirlingDirt
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 7, 0, 563
	waitforvisualfinish
	stopsound
	end

General_ItemEffect:: @ 81D5DF2
	loadspritegfx ANIM_TAG_THIN_RING
	loadspritegfx ANIM_TAG_SPARKLE_2
	delay 0
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, 192
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_M_MORNING_SUN, 192
	call GrantingStarsEffect
	waitforvisualfinish
	playsewithpan SE_SHINY, 192
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 2, 3, 7, 0, 26609
	createsprite gThinRingExpandingSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 0, 0
	waitforvisualfinish
	end

General_SmokeballEscape:: @ 81D5E66
	loadspritegfx ANIM_TAG_PINK_CLOUD
	monbg ANIM_ATTACKER
	setalpha 12, 4
	delay 0
	playsewithpan SE_BALL_OPEN, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_TARGET, 0, 0, 32, 28, 30
	delay 4
	playsewithpan SE_BALL_OPEN, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 127, 2, 12, 20, 30
	delay 12
	playsewithpan SE_BALL_OPEN, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 126, 2, -28, 4, 30
	delay 12
	playsewithpan SE_BALL_OPEN, 63
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 124, 2, 14, -20, 30
	delay 4
	playsewithpan SE_BALL_OPEN, 63
	createvisualtask AnimTask_AttackerFadeToInvisible, 2, 2
	createsprite gSmokeBallEscapeCloudSpriteTemplate, ANIM_ATTACKER, 123, 3, 4, 4, 30
	delay 14
	playsewithpan SE_BALL_OPEN, 63
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
	clearmonbg ANIM_ATTACKER
	invisible 0
	delay 0
	blendoff
	end

General_HangedOn:: @ 81D5F42
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 2, 7, 0, 9, 31
	playsewithpan SE_M_DRAGON_RAGE, 192
	createvisualtask AnimTask_SlideMonForFocusBand, 5, 30, 128, 0, 1, 2, 0, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 2, 4, 9, 0, 31
	waitforvisualfinish
	delay 6
	createsprite gSlideMonToOriginalPosSpriteTemplate, ANIM_ATTACKER, 0, 0, 0, 15
	end

General_Rain:: @ 81D5F8F
	loadspritegfx ANIM_TAG_RAIN_DROPS
	playsewithpan SE_M_RAIN_DANCE, 192
	createvisualtask AnimTask_BlendSelected, 10, 1 | (0xF << 7), 2, 0, 4, RGB_BLACK
	waitforvisualfinish
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 60
	createvisualtask AnimTask_CreateRaindrops, 2, 0, 3, 60
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
	playsewithpan SE_M_DOUBLE_SLAP, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_ATTACKER, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, 1, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg 1
	blendoff
	end

General_ItemSteal:: @ 81D6026
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_SetAnimAttackerAndTargetForEffectAtk, 2
	createvisualtask AnimTask_TargetToEffectBattler, 2, 
	delay 1
	createsprite gItemStealSpriteTemplate, ANIM_ATTACKER, 2, 0, -5, 10, 2, -1
	end

General_SnatchMove:: @ 81D604B
	loadspritegfx ANIM_TAG_ITEM_BAG
	createvisualtask AnimTask_SetAnimAttackerAndTargetForEffectTgt, 2
	call SnatchMoveTrySwapFromSubstitute
	delay 1
	createvisualtask AnimTask_SwayMon, 2, 0, 5, 5120, 4, 1
	waitforvisualfinish
	createvisualtask AnimTask_IsTargetSameSide, 2, 
	jumpargeq 7, 0, SnatchOpposingMonMove
	goto SnatchPartnerMonMove

SnatchMoveContinue:: @ 81D6082
	waitforvisualfinish
	call SnatchMoveTrySwapToSubstitute
	end

SnatchOpposingMonMove:: @ 81D6089
	playsewithpan SE_M_DOUBLE_TEAM, 192
	createvisualtask AnimTask_SnatchOpposingMonMove, 2, 
	goto SnatchMoveContinue

SnatchPartnerMonMove:: @ 81D6099
	playsewithpan SE_M_DOUBLE_TEAM, 192
	createvisualtask AnimTask_SnatchPartnerMove, 2, 
	goto SnatchMoveContinue

General_FutureSightHit:: @ 81D60A9
	createvisualtask AnimTask_SetAnimTargetToBattlerTarget, 2
	monbg ANIM_DEF_PARTNER
	playsewithpan SE_M_PSYBEAM, 192
	call SetPsychicBackground
	setalpha 8, 8
	playsewithpan SE_M_SUPERSONIC, 63
	waitplaysewithpan SE_M_SUPERSONIC, 63, 8
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, 1, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	waitforvisualfinish
	delay 1
	call UnsetPsychicBg
	end

General_DoomDesireHit:: @ 81D6108
	createvisualtask AnimTask_SetAnimTargetToBattlerTarget, 2, 
	loadspritegfx ANIM_TAG_EXPLOSION
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 16, RGB_WHITE
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_DoomDesireLightBeam, 5, 
	delay 9
	playsewithpan SE_M_CONFUSE_RAY, 192
	delay 9
	playsewithpan SE_M_CONFUSE_RAY, 0
	delay 9
	playsewithpan SE_M_CONFUSE_RAY, 63
	delay 25
	createvisualtask AnimTask_ShakeMonInPlace, 2, 1, 10, 0, 20, 1
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_M_SELF_DESTRUCT, 63
	createsprite gExplosionSpriteTemplate, ANIM_ATTACKER, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 16, 0, RGB_WHITE
	waitforvisualfinish
	end

General_FocusPunchSetUp:: @ 81D61CD
	loadspritegfx ANIM_TAG_FOCUS_ENERGY
	playsewithpan SE_M_DRAGON_RAGE, 192
	call EndureEffect
	delay 8
	createvisualtask AnimTask_CurseBlendEffect, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, 0, 1, 0, 32, 1
	call EndureEffect
	delay 8
	call EndureEffect
	waitforvisualfinish
	end

General_IngrainHeal:: @ 81D620D
	loadspritegfx ANIM_TAG_ORBS
	loadspritegfx ANIM_TAG_BLUE_STAR
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 0, 4, 13293
	waitforvisualfinish
	delay 3
	call AbsorbEffect
	waitforvisualfinish
	delay 15
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 1, 4, 0, 13293
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	end

General_WishHeal:: @ 81D6250
	loadspritegfx ANIM_TAG_BLUE_STAR
	loadspritegfx ANIM_TAG_SPARKLE_2
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 0, 10, 0
	waitforvisualfinish
	playsewithpan SE_M_MEGA_KICK, 192
	call GrantingStarsEffect
	waitforvisualfinish
	call HealingEffect
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 2, 1, 3, 10, 0, 0
	end

General_MonScared:: @ 81D628A
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 1
	waitforvisualfinish
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 0, 10, 26336
	createvisualtask AnimTask_ShakeMon2, 2, 1, 2, 0, 10, 1
	delay 20
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	playsewithpan SE_M_SKETCH, 63
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3, 
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, 2, 10, 0, 26336
	waitforvisualfinish
	end

General_GhostGetOut:: @ 81D6301
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 1
	waitforvisualfinish
	fadetobg 2
	waitbgfadeout
	monbg_22 0
	createvisualtask sub_80B6BBC, 2, 
	waitbgfadein
	loopsewithpan SE_M_PSYBEAM, 63, 20, 3
	waitforvisualfinish
	clearmonbg_23 0
	delay 1
	loadspritegfx ANIM_TAG_SWEAT_BEAD
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, -1, 0, 6, 27349
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 0, 1
	createsprite gSprayWaterDropletSpriteTemplate, ANIM_TARGET, 5, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, 1, 4, 0, 5, 1
	createvisualtask AnimTask_StretchTargetUp, 3, 
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, ANIM_ATTACKER, 0, 4, -1, 6, 0, 27349
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

General_SilphScoped:: @ 81D637B
	monbg ANIM_ATTACKER
	playsewithpan SE_M_TELEPORT, 192
	waitplaysewithpan SE_M_MINIMIZE, 192, 48
	createvisualtask AnimTask_TransformMon, 2, 255
	waitsound
	waitforvisualfinish
	clearmonbg ANIM_ATTACKER
	end

General_SafariRockThrow:: @ 81D6394
	createvisualtask AnimTask_SafariOrGhost_DecideAnimSides, 2, 0
	waitforvisualfinish
	loadspritegfx ANIM_TAG_ROCKS
	loadspritegfx ANIM_TAG_IMPACT
	delay 0
	waitplaysewithpan SE_M_JUMP_KICK, 192, 22
	createsprite gSafariRockTemplate, ANIM_TARGET, 3, -17, 14, 8, 0
	delay 50
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 0
	playsewithpan SE_M_DOUBLE_SLAP, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, -20, 1, 2
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	waitforvisualfinish
	end

General_SafariReaction:: @ 81D63DC
	createvisualtask AnimTask_SafariGetReaction, 2, 
	waitforvisualfinish
	jumpargeq 7, 0, SafariReaction_WatchingCarefully
	jumpargeq 7, 1, SafariReaction_Angry
	jumpargeq 7, 2, SafariReaction_Eating
	end

SafariReaction_WatchingCarefully:: @ 81D63FD
	playsewithpan SE_M_TAKE_DOWN, 63
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, 96, 0, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, 63
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 16, -96, 0, 2
	end

SafariReaction_Angry:: @ 81D6425
	loadspritegfx ANIM_TAG_ANGER
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, 20, -20
	playsewithpan SE_M_SWAGGER2, 63
	waitforvisualfinish
	delay 12
	createsprite gAngerMarkSpriteTemplate, ANIM_TARGET, 2, 1, -20, -20
	playsewithpan SE_M_SWAGGER2, 63
	end

SafariReaction_Eating:: @ 81D644E
	playsewithpan SE_M_TAKE_DOWN, 63
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 8, 136, 0, 2
	waitforvisualfinish
	playsewithpan SE_M_TAKE_DOWN, 63
	createvisualtask AnimTask_RotateMonToSideAndRestore, 2, 8, 136, 0, 2
	end

General_LoadAbilityPopUp::
        monbg ANIM_ATK_PARTNER
        createvisualtask AnimTask_CreateAbilityPopUp, 5,
	waitforvisualfinish
	delay 32
	clearmonbg ANIM_ATK_PARTNER
	end
	
General_RemoveAbilityPopUp::
        createvisualtask AnimTask_DestroyAbilityPopUp, 5,
	delay 32
	end

SnatchMoveTrySwapFromSubstitute:: @ 81D6476
	createvisualtask AnimTask_IsAttackerBehindSubstitute, 2, 
	jumpargeq 7, 1, SnatchMoveSwapSubstituteForMon

SnatchMoveTrySwapFromSubstituteEnd:: @ 81D6485
	waitforvisualfinish
	return

SnatchMoveSwapSubstituteForMon:: @ 81D6487
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, 1
	waitforvisualfinish
	goto SnatchMoveTrySwapFromSubstituteEnd

SnatchMoveTrySwapToSubstitute:: @ 81D6496
	createvisualtask AnimTask_IsAttackerBehindSubstitute, 2, 
	jumpargeq 7, 1, SnatchMoveSwapMonForSubstitute

SnatchMoveTrySwapToSubstituteEnd:: @ 81D64A5
	waitforvisualfinish
	return

SnatchMoveSwapMonForSubstitute:: @ 81D64A7
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, 0
	waitforvisualfinish
	goto SnatchMoveTrySwapToSubstituteEnd

Special_LevelUp:: @ 81D64B6
	playsewithpan SE_EXP_MAX, 0
	createvisualtask AnimTask_LoadHealthboxPalsForLevelUp, 2
	delay 0
	createvisualtask AnimTask_FlashHealthboxOnLevelUp, 5, 0, 0
	waitforvisualfinish
	createvisualtask AnimTask_FreeHealthboxPalsForLevelUp, 2
	end

Special_SwitchOutPlayerMon:: @ 81D64D7
	createvisualtask AnimTask_SwitchOutBallEffect, 2
	delay 10
	createvisualtask AnimTask_SwitchOutShrinkMon, 2
	end

Special_SwitchOutOpponentMon:: @ 81D64E8
	createvisualtask AnimTask_SwitchOutBallEffect, 2, 
	delay 10
	createvisualtask AnimTask_SwitchOutShrinkMon, 2, 
	end

Special_BallThrow:: @ 81D64F9
	createvisualtask AnimTask_LoadBallGfx, 2
	delay 0
	playsewithpan SE_BALL_THROW, 0
	createvisualtask AnimTask_ThrowBall, 2
	createvisualtask AnimTask_IsBallBlockedByTrainerOrDodged, 2, 
	jumpargeq 7, -1, BallThrowTrainerBlock       
	jumpargeq 7, -2, BallThrowGhostDodged
BallThrowEnd:: @ 81D6524
	waitforvisualfinish
	createvisualtask AnimTask_FreeBallGfx, 2
	end

BallThrowTrainerBlock:: @ 81D652D
	loadspritegfx ANIM_TAG_IMPACT
	delay 25
	monbg ANIM_DEF_PARTNER
	setalpha 12, 8
	delay 0
	playsewithpan SE_M_DOUBLE_SLAP, 63
	createsprite gBasicHitSplatSpriteTemplate, ANIM_TARGET, 2, -4, -20, 1, 2
	waitforvisualfinish
	clearmonbg ANIM_DEF_PARTNER
	blendoff
	goto BallThrowEnd

BallThrowGhostDodged:: @ 81D6555
	delay 16
	createvisualtask AnimTask_WindUpLunge, 2, 1, 48, 6, 16, 48, -48, 16
	playsewithpan SE_M_TAKE_DOWN, 63
	waitplaysewithpan SE_M_TAKE_DOWN, 63, 48
	waitforvisualfinish
	goto BallThrowEnd

Special_SafariBallThrow:: @ 81D657B
	createvisualtask AnimTask_LoadBallGfx, 2, 
	delay 0
	createvisualtask AnimTask_ThrowBallSpecial, 2
	waitforvisualfinish
	createvisualtask AnimTask_FreeBallGfx, 2, 
	end

Special_SubstituteToMon:: @ 81D6594
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, 1
	end

Special_MonToSubstitute:: @ 81D659E
	createvisualtask AnimTask_SwapMonSpriteToFromSubstitute, 2, 0
	end
