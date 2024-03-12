static const struct InGameTrade sInGameTrades[] = {
    [INGAME_TRADE_MR_MIME] = 
    {
        .nickname = _("Mimien"),
        .species = SPECIES_MR_MIME,
        .ivs = {20, 15, 17, 24, 23, 22},
        .abilityNum = 0,
        .otId = 1985,
        .conditions = {5, 5, 5, 30, 5},
        .personality = 0x00009cae,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Reyley"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_ABRA
    }, 
    [INGAME_TRADE_JYNX] = 
    {
        .nickname = _("Zynx"),
        .species = SPECIES_JYNX,
        .ivs = {18, 17, 18, 22, 25, 21},
        .abilityNum = 0,
        .otId = 36728,
        .conditions = {5, 30, 5, 5, 5},
        .personality = 0x498a2e1d,
        .heldItem = ITEM_FAB_MAIL,
        .mailNum = 0,
        .otName = _("Dontae"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_POLIWHIRL
    }, 
    [INGAME_TRADE_NIDORAN] = 
    {
#if defined(FIRERED)
        .nickname = _("Ms. Nido"),
        .species = SPECIES_NIDORAN_F,
        .ivs = {22, 18, 25, 19, 15, 22},
        .abilityNum = 0,
        .otId = 63184,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x4c970b89,
        .heldItem = ITEM_TINY_MUSHROOM,
        .mailNum = 255,
        .otName = _("Saige"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORAN_M
#elif defined(LEAFGREEN)
        .nickname = _("Mr. Nido"),
        .species = SPECIES_NIDORAN_M,
        .ivs = {19, 25, 18, 22, 22, 15},
        .abilityNum = 0,
        .otId = 63184,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x4c970b9e,
        .heldItem = ITEM_TINY_MUSHROOM,
        .mailNum = 255,
        .otName = _("Saige"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORAN_F
#endif
    }, 
    [INGAME_TRADE_FARFETCHD] = 
    {
        .nickname = _("Ch'Ding"),
        .species = SPECIES_FARFETCHD,
        .ivs = {20, 25, 21, 24, 15, 20},
        .abilityNum = 0,
        .otId = 8810,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x151943d7,
        .heldItem = ITEM_STICK,
        .mailNum = 255,
        .otName = _("Elyssa"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_SPEAROW
    }, 
    [INGAME_TRADE_NIDORINOA] = 
    {
#if defined(FIRERED)
        .nickname = _("Nina"),
        .species = SPECIES_NIDORINA,
        .ivs = {22, 25, 18, 19, 22, 15},
        .abilityNum = 0,
        .otId = 13637,
        .conditions = {5, 5, 30, 5, 5},
        .personality = 0x00eeca15,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Turner"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORINO
#elif defined(LEAFGREEN)
        .nickname = _("Nino"),
        .species = SPECIES_NIDORINO,
        .ivs = {19, 18, 25, 22, 15, 22},
        .abilityNum = 0,
        .otId = 13637,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x00eeca19,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Turner"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORINA
#endif
    }, 
    [INGAME_TRADE_LICKITUNG] = 
    {
        .nickname = _("Marc"),
        .species = SPECIES_LICKITUNG,
        .ivs = {24, 19, 21, 15, 23, 21},
        .abilityNum = 0,
        .otId = 1239,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x451308ab,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Haden"),
        .otGender = MALE,
        .sheen = 10,
#if defined(FIRERED)
        .requestedSpecies = SPECIES_GOLDUCK
#elif defined(LEAFGREEN)
        .requestedSpecies = SPECIES_SLOWBRO
#endif
    }, 
    [INGAME_TRADE_ELECTRODE] = 
    {
        .nickname = _("Esphere"),
        .species = SPECIES_ELECTRODE,
        .ivs = {19, 16, 18, 25, 25, 19},
        .abilityNum = 1,
        .otId = 50298,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x06341016,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Clifton"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_RAICHU
    }, 
    [INGAME_TRADE_TANGELA] = 
    {
        .nickname = _("Tangeny"),
        .species = SPECIES_TANGELA,
        .ivs = {22, 17, 25, 16, 23, 20},
        .abilityNum = 0,
        .otId = 60042,
        .conditions = {5, 5, 30, 5, 5},
        .personality = 0x5c77ecfa,
        .heldItem = ITEM_STARDUST,
        .mailNum = 255,
        .otName = _("Norma"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_VENONAT
    },
    [INGAME_TRADE_SEEL] = 
    {
        .nickname = _("Seelor"),
        .species = SPECIES_SEEL,
        .ivs = {24, 15, 22, 16, 23, 22},
        .abilityNum = 0,
        .otId = 9853,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x482cac89,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Garett"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_PONYTA
    },
    [INGAME_TRADE_BULBASAUR] =
    {
        .nickname = _("Cabbage"),
        .species = SPECIES_BULBASAUR,
        .ivs = {23, 23, 23, 23, 23, 23},
        .abilityNum = 0,
        .otId = 13911,
        .conditions = {10, 10, 10, 10, 10},
        .personality = 0x1B9CBD1E,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Mimi"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_SQUIRTLE
    },
    [INGAME_TRADE_CHARMANDER] =
    {
        .nickname = _("Blaze"),
        .species = SPECIES_CHARMANDER,
        .ivs = {23, 23, 23, 23, 23, 23},
        .abilityNum = 0,
        .otId = 54667,
        .conditions = {10, 10, 10, 10, 10},
        .personality = 0xC2A7C31A,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Lilly"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_BULBASAUR
    },
    [INGAME_TRADE_SQUIRTLE] =
    {
        .nickname = _("Torto"),
        .species = SPECIES_SQUIRTLE,
        .ivs = {23, 23, 23, 23, 23, 23},
        .abilityNum = 0,
        .otId = 9023,
        .conditions = {10, 10, 10, 10, 10},
        .personality = 0xF33F17DA,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("Jake"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_CHARMANDER
    }
};

static const u16 sInGameTradeMailMessages[][10] = {
    {
        EC_WORD_THAT_S,
        EC_WORD_A,
        EC_WORD_HEALTHY,
        EC_POKEMON(JYNX),
        EC_WORD_EXCL,
        EC_WORD_BE,
        EC_WORD_KIND,
        EC_WORD_TO,
        EC_WORD_IT
    }
};
