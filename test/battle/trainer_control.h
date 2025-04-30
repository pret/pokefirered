//
// DO NOT MODIFY THIS FILE! It is auto-generated from test/battle/trainer_control.party
//
// If you want to modify this file set COMPETITIVE_PARTY_SYNTAX to FALSE
// in include/config/general.h and remove this notice.
// Use sed -i '/^#line/d' 'test/battle/trainer_control.h' to remove #line markers.
//

#line 1 "test/battle/trainer_control.party"

#line 1
    [DIFFICULTY_NORMAL][0] =
    {
#line 2
        .trainerName = _("Test1"),
#line 3
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 4
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 6
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 7
        .doubleBattle = FALSE,
        .partySize = 3,
        .party = (const struct TrainerMon[])
        {
            {
#line 9
            .nickname = COMPOUND_STRING("Bubbles"),
#line 9
            .species = SPECIES_WOBBUFFET,
#line 9
            .gender = TRAINER_MON_FEMALE,
#line 9
            .heldItem = ITEM_ASSAULT_VEST,
#line 14
            .ev = TRAINER_PARTY_EVS(252, 0, 0, 252, 4, 0),
#line 13
            .iv = TRAINER_PARTY_IVS(25, 26, 27, 28, 29, 30),
#line 12
            .ability = ABILITY_TELEPATHY,
#line 11
            .lvl = 67,
#line 17
            .ball = ITEM_MASTER_BALL,
#line 15
            .friendship = 42,
#line 10
            .nature = NATURE_HASTY,
#line 16
            .isShiny = TRUE,
#line 18
            .dynamaxLevel = 5,
            .shouldUseDynamax = TRUE,
            .moves = {
#line 19
                MOVE_AIR_SLASH,
                MOVE_BARRIER,
                MOVE_SOLAR_BEAM,
                MOVE_EXPLOSION,
            },
            },
            {
#line 24
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 27
            .iv = TRAINER_PARTY_IVS(0, 0, 0, 0, 0, 0),
#line 26
            .ability = ABILITY_SHADOW_TAG,
#line 25
            .lvl = 5,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 29
            .species = SPECIES_WYNAUT,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 31
            .iv = TRAINER_PARTY_IVS(0, 0, 0, 0, 0, 0),
#line 30
            .lvl = 5,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 33
#line 40
    [DIFFICULTY_NORMAL][1] =
    {
#line 34
        .trainerName = _("Test2"),
#line 35
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 36
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 38
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 39
        .doubleBattle = FALSE,
        .partySize = 1,
        .party = (const struct TrainerMon[])
        {
            {
#line 42
            .species = SPECIES_MEWTWO,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 44
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 43
            .lvl = 5,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 45
#line 52
    [DIFFICULTY_NORMAL][2] =
    {
#line 46
        .trainerName = _("Test2"),
#line 47
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 48
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 50
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 51
        .doubleBattle = FALSE,
        .partySize = 1,
        .party = (const struct TrainerMon[])
        {
            {
#line 54
            .species = SPECIES_MEWTWO,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 56
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 55
            .lvl = 50,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 57
#line 64
    [DIFFICULTY_EASY][2] =
    {
#line 58
        .trainerName = _("Test2"),
#line 59
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 60
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 62
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 63
        .doubleBattle = FALSE,
        .partySize = 1,
        .party = (const struct TrainerMon[])
        {
            {
#line 66
            .species = SPECIES_METAPOD,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 68
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 67
            .lvl = 1,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 69
#line 76
    [DIFFICULTY_HARD][2] =
    {
#line 70
        .trainerName = _("Test2"),
#line 71
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 72
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 74
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 75
        .doubleBattle = FALSE,
        .partySize = 1,
        .party = (const struct TrainerMon[])
        {
            {
#line 78
            .species = SPECIES_ARCEUS,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 80
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 79
            .lvl = 99,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 81
    [DIFFICULTY_NORMAL][3] =
    {
#line 82
        .trainerName = _("Test3"),
#line 83
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 84
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 86
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 87
        .doubleBattle = FALSE,
#line 88
        .partySize = 1,
        .poolSize = 4,
        .party = (const struct TrainerMon[])
        {
            {
#line 90
            .species = SPECIES_WYNAUT,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 91
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 91
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 92
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 93
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 93
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 94
            .species = SPECIES_EEVEE,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 95
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 95
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 96
            .species = SPECIES_MEW,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 97
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 97
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 98
    [DIFFICULTY_NORMAL][4] =
    {
#line 99
        .trainerName = _("Test4"),
#line 100
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 101
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 103
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 104
        .doubleBattle = FALSE,
#line 105
        .partySize = 3,
        .poolSize = 6,
        .party = (const struct TrainerMon[])
        {
            {
#line 107
            .species = SPECIES_WYNAUT,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 108
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 108
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 109
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 111
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 111
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 110
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 112
            .species = SPECIES_EEVEE,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 114
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 114
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 113
            .tags = MON_POOL_TAG_ACE,
            },
            {
#line 115
            .species = SPECIES_MEW,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 116
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 116
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 117
            .species = SPECIES_ODDISH,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 119
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 119
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 118
            .tags = MON_POOL_TAG_ACE,
            },
            {
#line 120
            .species = SPECIES_ARON,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 122
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 122
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 121
            .tags = MON_POOL_TAG_LEAD,
            },
        },
    },
#line 123
    [DIFFICULTY_NORMAL][5] =
    {
#line 124
        .trainerName = _("Test5"),
#line 125
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 126
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 128
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 129
        .doubleBattle = TRUE,
#line 131
        .poolRuleIndex = POOL_RULESET_WEATHER_DOUBLES,
#line 130
        .partySize = 3,
        .poolSize = 10,
        .party = (const struct TrainerMon[])
        {
            {
#line 133
            .species = SPECIES_WYNAUT,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 135
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 135
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 134
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 136
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 138
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 138
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 137
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 139
            .species = SPECIES_VULPIX,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 141
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 141
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 140
            .tags = MON_POOL_TAG_LEAD | MON_POOL_TAG_WEATHER_SETTER,
            },
            {
#line 142
            .species = SPECIES_BULBASAUR,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 144
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 144
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 143
            .tags = MON_POOL_TAG_LEAD | MON_POOL_TAG_WEATHER_ABUSER,
            },
            {
#line 145
            .species = SPECIES_TORKOAL,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 147
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 147
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 146
            .tags = MON_POOL_TAG_LEAD | MON_POOL_TAG_WEATHER_SETTER,
            },
            {
#line 148
            .species = SPECIES_CHERRIM,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 150
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 150
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 149
            .tags = MON_POOL_TAG_LEAD | MON_POOL_TAG_WEATHER_ABUSER,
            },
            {
#line 151
            .species = SPECIES_MEW,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 153
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 153
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 152
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 154
            .species = SPECIES_ARON,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 156
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 156
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 155
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 157
            .species = SPECIES_ODDISH,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 158
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 158
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 159
            .species = SPECIES_EEVEE,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 160
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 160
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 161
    [DIFFICULTY_NORMAL][6] =
    {
#line 162
        .trainerName = _("Test6"),
#line 163
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 164
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 166
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 167
        .doubleBattle = FALSE,
#line 169
        .poolRuleIndex = POOL_RULESET_BASIC,
#line 168
        .partySize = 2,
        .poolSize = 3,
        .party = (const struct TrainerMon[])
        {
            {
#line 171
            .species = SPECIES_WYNAUT,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 173
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 173
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 172
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 174
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 176
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 176
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 175
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 177
            .species = SPECIES_EEVEE,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 179
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 179
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 178
            .tags = MON_POOL_TAG_LEAD,
            },
        },
    },
#line 180
    [DIFFICULTY_NORMAL][7] =
    {
#line 181
        .trainerName = _("Test1"),
#line 182
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 183
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 185
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 186
        .doubleBattle = FALSE,
#line 188
        .poolRuleIndex = POOL_RULESET_BASIC,
#line 189
        .poolPruneIndex = POOL_PRUNE_TEST,
#line 187
        .partySize = 2,
        .poolSize = 3,
        .party = (const struct TrainerMon[])
        {
            {
#line 191
            .species = SPECIES_WYNAUT,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 192
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 192
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 193
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 195
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 195
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 194
            .tags = MON_POOL_TAG_LEAD,
            },
            {
#line 196
            .species = SPECIES_EEVEE,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 197
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 197
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
        },
    },
#line 198
    [DIFFICULTY_NORMAL][8] =
    {
#line 199
        .trainerName = _("Test1"),
#line 200
        .trainerClass = TRAINER_CLASS_PKMN_TRAINER_1,
#line 201
        .trainerPic = TRAINER_PIC_RED,
        .encounterMusic_gender =
#line 203
            TRAINER_ENCOUNTER_MUSIC_MALE,
#line 204
        .doubleBattle = FALSE,
#line 206
        .poolRuleIndex = POOL_RULESET_BASIC,
#line 207
        .poolPickIndex = POOL_PICK_LOWEST,
#line 205
        .partySize = 2,
        .poolSize = 3,
        .party = (const struct TrainerMon[])
        {
            {
#line 209
            .species = SPECIES_WYNAUT,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 211
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 211
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 210
            .tags = MON_POOL_TAG_ACE,
            },
            {
#line 212
            .species = SPECIES_WOBBUFFET,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 213
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 213
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
            },
            {
#line 214
            .species = SPECIES_EEVEE,
            .gender = TRAINER_MON_RANDOM_GENDER,
#line 216
            .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
#line 216
            .lvl = 100,
            .nature = NATURE_HARDY,
            .dynamaxLevel = MAX_DYNAMAX_LEVEL,
#line 215
            .tags = MON_POOL_TAG_LEAD,
            },
        },
    },
