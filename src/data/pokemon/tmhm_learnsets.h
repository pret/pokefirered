//
// DO NOT MODIFY THIS FILE! It is auto-generated from data/pokemon/pokemon_list.json and Inja template data/pokemon/templates/tmhm_learnsets.h.inja
//

#define TMHM_LEARNSET(moves) {(u32)(moves), ((u64)(moves) >> 32)}
#define TMHM(tmhm) ((u64)1 << (ITEM_##tmhm - ITEM_TM01_FOCUS_PUNCH))

// This table determines which TMs and HMs a species is capable of learning.
// Each entry is a 64-bit bit array spread across two 32-bit values, with
// each bit corresponding to a machine.
static const u32 sTMHMLearnsets[][2] =
{
    [SPECIES_NONE]        = TMHM_LEARNSET(0),
    [SPECIES_BULBASAUR] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_IVYSAUR] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_VENUSAUR] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CHARMANDER] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CHARMELEON] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CHARIZARD] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SQUIRTLE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_WARTORTLE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_BLASTOISE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_CATERPIE] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_METAPOD] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_BUTTERFREE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_WEEDLE] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_KAKUNA] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_BEEDRILL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PIDGEY] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_PIDGEOTTO] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_PIDGEOT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_RATTATA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_RATICATE] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SPEAROW] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_FEAROW] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_EKANS] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    )
    
    ,
    [SPECIES_ARBOK] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    )
    
    ,
    [SPECIES_PIKACHU] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_RAICHU] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SANDSHREW] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SANDSLASH] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NIDORAN_F] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NIDORINA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NIDOQUEEN] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NIDORAN_M] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NIDORINO] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NIDOKING] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CLEFAIRY] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_CLEFABLE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_VULPIX] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    )
    
    ,
    [SPECIES_NINETALES] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    )
    
    ,
    [SPECIES_JIGGLYPUFF] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_WIGGLYTUFF] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_ZUBAT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    )
    
    ,
    [SPECIES_GOLBAT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    )
    
    ,
    [SPECIES_ODDISH] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_GLOOM] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_VILEPLUME] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_PARAS] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PARASECT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_VENONAT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_VENOMOTH] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_DIGLETT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_DUGTRIO] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MEOWTH] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_PERSIAN] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_PSYDUCK] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_GOLDUCK] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_MANKEY] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PRIMEAPE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_GROWLITHE] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ARCANINE] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_POLIWAG] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_POLIWHIRL] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_POLIWRATH] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_ABRA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_KADABRA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_ALAKAZAM] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MACHOP] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MACHOKE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MACHAMP] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_BELLSPROUT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_WEEPINBELL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_VICTREEBEL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_TENTACOOL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_TENTACRUEL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_GEODUDE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_GRAVELER] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_GOLEM] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PONYTA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    )
    
    ,
    [SPECIES_RAPIDASH] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    )
    
    ,
    [SPECIES_SLOWPOKE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SLOWBRO] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_MAGNEMITE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MAGNETON] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_FARFETCHD] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_DODUO] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_DODRIO] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_SEEL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_DEWGONG] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_GRIMER] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    )
    
    ,
    [SPECIES_MUK] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SHELLDER] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_CLOYSTER] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_GASTLY] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    )
    
    ,
    [SPECIES_HAUNTER] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    )
    
    ,
    [SPECIES_GENGAR] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ONIX] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_DROWZEE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_HYPNO] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_KRABBY] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_KINGLER] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_VOLTORB] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_ELECTRODE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_EXEGGCUTE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_EXEGGUTOR] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_CUBONE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MAROWAK] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HITMONLEE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HITMONCHAN] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_LICKITUNG] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_KOFFING] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_WEEZING] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_RHYHORN] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_RHYDON] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CHANSEY] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TANGELA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_KANGASKHAN] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HORSEA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SEADRA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_GOLDEEN] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SEAKING] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_STARYU] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_STARMIE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_MR_MIME] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SCYTHER] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_JYNX] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_ELECTABUZZ] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MAGMAR] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PINSIR] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TAUROS] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MAGIKARP] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_GYARADOS] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_LAPRAS] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_DITTO] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_EEVEE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    )
    
    ,
    [SPECIES_VAPOREON] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_JOLTEON] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_FLAREON] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    )
    
    ,
    [SPECIES_PORYGON] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_OMANYTE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_OMASTAR] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_KABUTO] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    )
    
    ,
    [SPECIES_KABUTOPS] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_AERODACTYL] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SNORLAX] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    )
    
    ,
    [SPECIES_ARTICUNO] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ZAPDOS] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MOLTRES] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_DRATINI] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    )
    
    ,
    [SPECIES_DRAGONAIR] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    )
    
    ,
    [SPECIES_DRAGONITE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_MEWTWO] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MEW] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_CHIKORITA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_BAYLEEF] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MEGANIUM] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CYNDAQUIL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    )
    
    ,
    [SPECIES_QUILAVA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TYPHLOSION] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TOTODILE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_CROCONAW] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_FERALIGATR] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SENTRET] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    )
    
    ,
    [SPECIES_FURRET] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HOOTHOOT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_NOCTOWL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_LEDYBA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_LEDIAN] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SPINARAK] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_ARIADOS] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_CROBAT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_CHINCHOU] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_LANTURN] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_PICHU] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_CLEFFA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_IGGLYBUFF] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_TOGEPI] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TOGETIC] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NATU] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_XATU] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MAREEP] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_FLAAFFY] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_AMPHAROS] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_BELLOSSOM] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MARILL] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_AZUMARILL] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SUDOWOODO] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_POLITOED] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_HOPPIP] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SKIPLOOM] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_JUMPLUFF] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_AIPOM] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SUNKERN] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SUNFLORA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_YANMA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_WOOPER] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_QUAGSIRE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_ESPEON] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_UMBREON] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MURKROW] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_SLOWKING] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_MISDREAVUS] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_UNOWN] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_WOBBUFFET] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_GIRAFARIG] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PINECO] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_FORRETRESS] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_DUNSPARCE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_GLIGAR] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_STEELIX] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SNUBBULL] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_GRANBULL] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_QWILFISH] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SCIZOR] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SHUCKLE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HERACROSS] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SNEASEL] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TEDDIURSA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_URSARING] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SLUGMA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MAGCARGO] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SWINUB] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PILOSWINE] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CORSOLA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_REMORAID] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_OCTILLERY] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_DELIBIRD] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_MANTINE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SKARMORY] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HOUNDOUR] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HOUNDOOM] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_KINGDRA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_PHANPY] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_DONPHAN] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PORYGON2] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_STANTLER] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SMEARGLE] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_TYROGUE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HITMONTOP] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SMOOCHUM] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_ELEKID] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MAGBY] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MILTANK] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_BLISSEY] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_RAIKOU] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ENTEI] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SUICUNE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_LARVITAR] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_PUPITAR] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TYRANITAR] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_LUGIA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_HO_OH] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CELEBI] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_OLD_UNOWN_B] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_C] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_D] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_E] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_F] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_G] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_H] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_I] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_J] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_K] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_L] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_M] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_N] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_O] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_P] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_Q] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_R] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_S] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_T] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_U] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_V] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_W] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_X] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_Y] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_OLD_UNOWN_Z] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_TREECKO] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_GROVYLE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SCEPTILE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TORCHIC] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_COMBUSKEN] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_BLAZIKEN] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MUDKIP] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_MARSHTOMP] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SWAMPERT] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_POOCHYENA] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MIGHTYENA] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ZIGZAGOON] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_LINOONE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_WURMPLE] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_SILCOON] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_BEAUTIFLY] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_CASCOON] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_DUSTOX] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_LOTAD] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_LOMBRE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_LUDICOLO] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SEEDOT] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NUZLEAF] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SHIFTRY] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NINCADA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_NINJASK] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SHEDINJA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_TAILLOW] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_SWELLOW] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_SHROOMISH] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_BRELOOM] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SPINDA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_WINGULL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_PELIPPER] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM03_SURF)
    
    )
    
    ,
    [SPECIES_SURSKIT] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MASQUERAIN] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_WAILMER] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_WAILORD] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SKITTY] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_DELCATTY] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_KECLEON] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_BALTOY] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_CLAYDOL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_NOSEPASS] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TORKOAL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SABLEYE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_BARBOACH] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_WHISCASH] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_LUVDISC] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_CORPHISH] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    )
    
    ,
    [SPECIES_CRAWDAUNT] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_FEEBAS] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_MILOTIC] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_CARVANHA] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SHARPEDO] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_TRAPINCH] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_VIBRAVA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_FLYGON] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MAKUHITA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_HARIYAMA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ELECTRIKE] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MANECTRIC] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_NUMEL] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CAMERUPT] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SPHEAL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_SEALEO] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_WALREIN] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_CACNEA] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_CACTURNE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SNORUNT] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_GLALIE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_LUNATONE] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SOLROCK] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_AZURILL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    )
    
    ,
    [SPECIES_SPOINK] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_GRUMPIG] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_PLUSLE] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MINUN] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_MAWILE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MEDITITE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_MEDICHAM] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SWABLU] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    )
    
    ,
    [SPECIES_ALTARIA] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_WYNAUT] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_DUSKULL] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_DUSCLOPS] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ROSELIA] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SLAKOTH] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_VIGOROTH] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SLAKING] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_GULPIN] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SWALOT] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_TROPIUS] =
    
    
        TMHM_LEARNSET(TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_WHISMUR] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    )
    
    ,
    [SPECIES_LOUDRED] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_EXPLOUD] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CLAMPERL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_HUNTAIL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_GOREBYSS] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_ABSOL] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SHUPPET] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_BANETTE] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_SEVIPER] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ZANGOOSE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_RELICANTH] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_ARON] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_LAIRON] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_AGGRON] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CASTFORM] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_VOLBEAT] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_ILLUMISE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_LILEEP] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    )
    
    ,
    [SPECIES_CRADILY] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM09_BULLET_SEED)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM19_GIGA_DRAIN)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ANORITH] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_ARMALDO] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_RALTS] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_KIRLIA] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_GARDEVOIR] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM46_THIEF)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_BAGON] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SHELGON] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_SALAMENCE] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_BELDUM] =
    
        TMHM_LEARNSET(0)
    
    ,
    [SPECIES_METANG] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_METAGROSS] =
    
    
        TMHM_LEARNSET(TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM36_SLUDGE_BOMB)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_REGIROCK] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_REGICE] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_REGISTEEL] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_KYOGRE] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM07_HAIL)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_GROUDON] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM28_DIG)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_RAYQUAZA] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM08_BULK_UP)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM14_BLIZZARD)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM23_IRON_TAIL)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM35_FLAMETHROWER)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM38_FIRE_BLAST)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM50_OVERHEAT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_LATIAS] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_LATIOS] =
    
    
        TMHM_LEARNSET(TMHM(TM02_DRAGON_CLAW)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM05_ROAR)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM26_EARTHQUAKE)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM47_STEEL_WING)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM02_FLY)
    
    
    
                    | TMHM(HM03_SURF)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM07_WATERFALL)
    
    
    
                    | TMHM(HM08_DIVE)
    
    )
    
    ,
    [SPECIES_JIRACHI] =
    
    
        TMHM_LEARNSET(TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM37_SANDSTORM)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    ,
    [SPECIES_DEOXYS] =
    
    
        TMHM_LEARNSET(TMHM(TM01_FOCUS_PUNCH)
    
    
    
                    | TMHM(TM03_WATER_PULSE)
    
    
    
                    | TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM13_ICE_BEAM)
    
    
    
                    | TMHM(TM15_HYPER_BEAM)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM22_SOLARBEAM)
    
    
    
                    | TMHM(TM24_THUNDERBOLT)
    
    
    
                    | TMHM(TM25_THUNDER)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM31_BRICK_BREAK)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM39_ROCK_TOMB)
    
    
    
                    | TMHM(TM40_AERIAL_ACE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM01_CUT)
    
    
    
                    | TMHM(HM04_STRENGTH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    
    
                    | TMHM(HM06_ROCK_SMASH)
    
    )
    
    ,
    [SPECIES_CHIMECHO] =
    
    
        TMHM_LEARNSET(TMHM(TM04_CALM_MIND)
    
    
    
                    | TMHM(TM06_TOXIC)
    
    
    
                    | TMHM(TM10_HIDDEN_POWER)
    
    
    
                    | TMHM(TM11_SUNNY_DAY)
    
    
    
                    | TMHM(TM12_TAUNT)
    
    
    
                    | TMHM(TM16_LIGHT_SCREEN)
    
    
    
                    | TMHM(TM17_PROTECT)
    
    
    
                    | TMHM(TM18_RAIN_DANCE)
    
    
    
                    | TMHM(TM20_SAFEGUARD)
    
    
    
                    | TMHM(TM21_FRUSTRATION)
    
    
    
                    | TMHM(TM27_RETURN)
    
    
    
                    | TMHM(TM29_PSYCHIC)
    
    
    
                    | TMHM(TM30_SHADOW_BALL)
    
    
    
                    | TMHM(TM32_DOUBLE_TEAM)
    
    
    
                    | TMHM(TM33_REFLECT)
    
    
    
                    | TMHM(TM34_SHOCK_WAVE)
    
    
    
                    | TMHM(TM41_TORMENT)
    
    
    
                    | TMHM(TM42_FACADE)
    
    
    
                    | TMHM(TM43_SECRET_POWER)
    
    
    
                    | TMHM(TM44_REST)
    
    
    
                    | TMHM(TM45_ATTRACT)
    
    
    
                    | TMHM(TM48_SKILL_SWAP)
    
    
    
                    | TMHM(TM49_SNATCH)
    
    
    
                    | TMHM(HM05_FLASH)
    
    )
    
    
};