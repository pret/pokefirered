//
// DO NOT MODIFY THIS FILE! It is auto-generated from src/data/debug_trainers.party
//
// If you want to modify this file see expansion PR #7154
//

#line 1 "src/data/debug_trainers.party"

#line 14
    [DIFFICULTY_NORMAL][DEBUG_TRAINER_PLAYER] =
    {
#line 15
        .trainerName = _("Player"),
#line 16
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 17
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 19
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 0
        .trainerBackPic = TRAINER_PIC_RED,
        .partySize = 1,
        .party = (const struct TrainerMon[])
        {
            {
#line 21
            .nickname = COMPOUND_STRING("Buffie"),
#line 21
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 25
            .ev = TRAINER_PARTY_EVS(0, 252, 252, 0, 6, 0),
#line 24
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 23
            .lvl = 100,
#line 22
            .nature = NATURE_BRAVE,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            .moves = {
#line 26
                MOVE_EARTHQUAKE,
                MOVE_FLAMETHROWER,
                MOVE_CELEBRATE,
                MOVE_CELEBRATE,
            },
            },
        },
    },
#line 31
    [DIFFICULTY_NORMAL][DEBUG_TRAINER_AI] =
    {
#line 32
        .trainerName = _("Debugger"),
#line 34
        .trainerClass = TRAINER_CLASS_CHAMPION,
#line 36
        .trainerPic = TRAINER_PIC_CHAMPION_STEVEN,
        .encounterMusic_gender =
#line 38
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 35
        .battleType = TRAINER_BATTLE_TYPE_SINGLES,
#line 33
        .aiFlags = AI_FLAG_BASIC_TRAINER,
#line 0
        .trainerBackPic = TRAINER_PIC_CHAMPION_STEVEN,
        .partySize = 3,
        .party = (const struct TrainerMon[])
        {
            {
#line 40
            .species = SPECIES_METANG,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 44
            .ev = TRAINER_PARTY_EVS(0, 252, 252, 0, 6, 0),
#line 43
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 42
            .lvl = 42,
#line 41
            .nature = NATURE_BRAVE,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            .moves = {
#line 45
                MOVE_LIGHT_SCREEN,
                MOVE_PSYCHIC,
                MOVE_REFLECT,
                MOVE_METAL_CLAW,
            },
            },
            {
#line 50
            .species = SPECIES_SKARMORY,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 54
            .ev = TRAINER_PARTY_EVS(252, 0, 0, 0, 6, 252),
#line 53
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 52
            .lvl = 43,
#line 51
            .nature = NATURE_IMPISH,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            .moves = {
#line 55
                MOVE_TOXIC,
                MOVE_AERIAL_ACE,
                MOVE_PROTECT,
                MOVE_STEEL_WING,
            },
            },
            {
#line 60
            .species = SPECIES_AGGRON,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 64
            .ev = TRAINER_PARTY_EVS(0, 252, 0, 0, 252, 6),
#line 63
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 62
            .lvl = 44,
#line 61
            .nature = NATURE_ADAMANT,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            .moves = {
#line 65
                MOVE_THUNDER,
                MOVE_PROTECT,
                MOVE_SOLAR_BEAM,
                MOVE_DRAGON_CLAW,
            },
            },
        },
    },
