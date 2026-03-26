static const struct InGameTrade sInGameTrades[] = {
    [INGAME_TRADE_MR_MIME] = 
    {
        .nickname = _("MIMIEN"),
        .species = SPECIES_MR_MIME,
        .ivs = {20, 15, 17, 24, 23, 22},
        .abilityNum = 0,
        .otId = 1985,
        .conditions = {5, 5, 5, 30, 5},
        .personality = 0x00009cae,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("REYLEY"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_ABRA
    }, 
    [INGAME_TRADE_JYNX] = 
    {
        .nickname = _("ZYNX"),
        .species = SPECIES_JYNX,
        .ivs = {18, 17, 18, 22, 25, 21},
        .abilityNum = 0,
        .otId = 36728,
        .conditions = {5, 30, 5, 5, 5},
        .personality = 0x498a2e1d,
        .heldItem = ITEM_FAB_MAIL,
        .mailNum = 0,
        .otName = _("DONTAE"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_POLIWHIRL
    }, 
    [INGAME_TRADE_NIDORAN] = 
    {
#if defined(FIRERED) || defined(FULLSPEC)
        .nickname = _("MS. NIDO"),
        .species = SPECIES_NIDORAN_F,
        .ivs = {22, 18, 25, 19, 15, 22},
        .abilityNum = 0,
        .otId = 63184,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x4c970b89,
        .heldItem = ITEM_TINY_MUSHROOM,
        .mailNum = 255,
        .otName = _("SAIGE"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORAN_M
#elif defined(LEAFGREEN)
        .nickname = _("MR. NIDO"),
        .species = SPECIES_NIDORAN_M,
        .ivs = {19, 25, 18, 22, 22, 15},
        .abilityNum = 0,
        .otId = 63184,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x4c970b9e,
        .heldItem = ITEM_TINY_MUSHROOM,
        .mailNum = 255,
        .otName = _("SAIGE"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORAN_F
#endif
    }, 
    [INGAME_TRADE_FARFETCHD] = 
    {
        .nickname = _("CH'DING"),
        .species = SPECIES_FARFETCHD,
        .ivs = {20, 25, 21, 24, 15, 20},
        .abilityNum = 0,
        .otId = 8810,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x151943d7,
        .heldItem = ITEM_STICK,
        .mailNum = 255,
        .otName = _("ELYSSA"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_SPEAROW
    }, 
    [INGAME_TRADE_NIDORINOA] = 
    {
#if defined(FIRERED) || defined(FULLSPEC)
        .nickname = _("NINA"),
        .species = SPECIES_NIDORINA,
        .ivs = {22, 25, 18, 19, 22, 15},
        .abilityNum = 0,
        .otId = 13637,
        .conditions = {5, 5, 30, 5, 5},
        .personality = 0x00eeca15,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("TURNER"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORINO
#elif defined(LEAFGREEN)
        .nickname = _("NINO"),
        .species = SPECIES_NIDORINO,
        .ivs = {19, 18, 25, 22, 15, 22},
        .abilityNum = 0,
        .otId = 13637,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x00eeca19,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("TURNER"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_NIDORINA
#endif
    }, 
    [INGAME_TRADE_LICKITUNG] = 
    {
        .nickname = _("MARC"),
        .species = SPECIES_LICKITUNG,
        .ivs = {24, 19, 21, 15, 23, 21},
        .abilityNum = 0,
        .otId = 1239,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x451308ab,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("HADEN"),
        .otGender = MALE,
        .sheen = 10,
#if defined(FIRERED) || defined(FULLSPEC)
        .requestedSpecies = SPECIES_GOLDUCK
#elif defined(LEAFGREEN)
        .requestedSpecies = SPECIES_SLOWBRO
#endif
    }, 
    [INGAME_TRADE_ELECTRODE] = 
    {
        .nickname = _("ESPHERE"),
        .species = SPECIES_ELECTRODE,
        .ivs = {19, 16, 18, 25, 25, 19},
        .abilityNum = 1,
        .otId = 50298,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x06341016,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("CLIFTON"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_RAICHU
    }, 
    [INGAME_TRADE_TANGELA] = 
    {
        .nickname = _("TANGENY"),
        .species = SPECIES_TANGELA,
        .ivs = {22, 17, 25, 16, 23, 20},
        .abilityNum = 0,
        .otId = 60042,
        .conditions = {5, 5, 30, 5, 5},
        .personality = 0x5c77ecfa,
        .heldItem = ITEM_STARDUST,
        .mailNum = 255,
        .otName = _("NORMA"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_VENONAT
    },
    [INGAME_TRADE_SEEL] = 
    {
        .nickname = _("SEELOR"),
        .species = SPECIES_SEEL,
        .ivs = {24, 15, 22, 16, 23, 22},
        .abilityNum = 0,
        .otId = 9853,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x482cac89,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("GARETT"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_PONYTA
    },
    [INGAME_TRADE_CHIKORITA] =
    {
        .nickname = _("CHICORY"),
        .species = SPECIES_CHIKORITA,
        .ivs = {25, 15, 20, 20, 25, 20},
        .abilityNum = 0,
        .otId = 41025,
        .conditions = {5, 5, 5, 30, 5},
        .personality = 0x00007a3f,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("RANGER"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_PARAS
    },
    [INGAME_TRADE_CYNDAQUIL] =
    {
        .nickname = _("CYNDER"),
        .species = SPECIES_CYNDAQUIL,
        .ivs = {20, 25, 15, 25, 20, 20},
        .abilityNum = 0,
        .otId = 52718,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x0000a1d8,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("BLAINE"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_VULPIX
    },
    [INGAME_TRADE_TOTODILE] =
    {
        .nickname = _("SNAPPY"),
        .species = SPECIES_TOTODILE,
        .ivs = {20, 20, 25, 20, 15, 25},
        .abilityNum = 0,
        .otId = 33491,
        .conditions = {5, 30, 5, 5, 5},
        .personality = 0x0000c4b2,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("MARINA"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_POLIWAG
    },
    [INGAME_TRADE_TREECKO] =
    {
        .nickname = _("GECKO"),
        .species = SPECIES_TREECKO,
        .ivs = {20, 15, 20, 25, 25, 20},
        .abilityNum = 0,
        .otId = 27843,
        .conditions = {5, 5, 30, 5, 5},
        .personality = 0x0000e5f1,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("BRANDON"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_ODDISH
    },
    [INGAME_TRADE_TORCHIC] =
    {
        .nickname = _("BLAZE"),
        .species = SPECIES_TORCHIC,
        .ivs = {15, 25, 20, 25, 20, 20},
        .abilityNum = 0,
        .otId = 44382,
        .conditions = {5, 5, 5, 5, 30},
        .personality = 0x00003c7a,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("FLINT"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_GROWLITHE
    },
    [INGAME_TRADE_MUDKIP] =
    {
        .nickname = _("KIPPY"),
        .species = SPECIES_MUDKIP,
        .ivs = {25, 20, 25, 15, 20, 20},
        .abilityNum = 0,
        .otId = 19654,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x00005db9,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("BROOK"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_PSYDUCK
    },
    [INGAME_TRADE_CASTFORM] =
    {
        .nickname = _("CLOUDY"),
        .species = SPECIES_CASTFORM,
        .ivs = {20, 20, 20, 25, 25, 15},
        .abilityNum = 0,
        .otId = 71205,
        .conditions = {5, 30, 5, 5, 5},
        .personality = 0x00008ef3,
        .heldItem = ITEM_MYSTIC_WATER,
        .mailNum = 255,
        .otName = _("RAIN"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_CLEFAIRY
    },
    [INGAME_TRADE_KECLEON] =
    {
        .nickname = _("SHIFTY"),
        .species = SPECIES_KECLEON,
        .ivs = {20, 25, 20, 20, 15, 25},
        .abilityNum = 0,
        .otId = 63019,
        .conditions = {5, 5, 5, 30, 5},
        .personality = 0x0000b742,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("CAMO"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_DITTO
    },
    [INGAME_TRADE_RAIKOU] =
    {
        .nickname = _("RAIKOU"),
        .species = SPECIES_RAIKOU,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 10000,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000d4a1,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("EUSINE"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_ZAPDOS
    },
    [INGAME_TRADE_ENTEI] =
    {
        .nickname = _("ENTEI"),
        .species = SPECIES_ENTEI,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 10000,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000f5c3,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("EUSINE"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MOLTRES
    },
    [INGAME_TRADE_SUICUNE] =
    {
        .nickname = _("SUICUNE"),
        .species = SPECIES_SUICUNE,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 10000,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x000016e5,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("EUSINE"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_ARTICUNO
    },
    [INGAME_TRADE_HO_OH] =
    {
        .nickname = _("HO-OH"),
        .species = SPECIES_HO_OH,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 10000,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x00003807,
        .heldItem = ITEM_SACRED_ASH,
        .mailNum = 255,
        .otName = _("SAGE"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_DUSKULL] =
    {
        .nickname = _("DUSK"),
        .species = SPECIES_DUSKULL,
        .ivs = {20, 15, 22, 25, 23, 18},
        .abilityNum = 0,
        .otId = 48319,
        .conditions = {5, 5, 30, 5, 5},
        .personality = 0x0000d1a3,
        .heldItem = ITEM_SPELL_TAG,
        .mailNum = 255,
        .otName = _("SHADE"),
        .otGender = FEMALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_RATTATA
    },
    [INGAME_TRADE_MURKROW] =
    {
        .nickname = _("MURK"),
        .species = SPECIES_MURKROW,
        .ivs = {18, 25, 20, 22, 15, 23},
        .abilityNum = 0,
        .otId = 57214,
        .conditions = {30, 5, 5, 5, 5},
        .personality = 0x0000e2b4,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("RAVEN"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_SPEAROW
    },
    [INGAME_TRADE_BAGON] =
    {
        .nickname = _("DRACO"),
        .species = SPECIES_BAGON,
        .ivs = {22, 25, 20, 20, 18, 20},
        .abilityNum = 0,
        .otId = 33781,
        .conditions = {5, 30, 5, 5, 5},
        .personality = 0x0000f3c5,
        .heldItem = ITEM_DRAGON_FANG,
        .mailNum = 255,
        .otName = _("DRAKE"),
        .otGender = MALE,
        .sheen = 10,
        .requestedSpecies = SPECIES_GEODUDE
    },
    [INGAME_TRADE_MEW] =
    {
        .nickname = _("MEW"),
        .species = SPECIES_MEW,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15001,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000a1b2,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("FUJI"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_CELEBI] =
    {
        .nickname = _("CELEBI"),
        .species = SPECIES_CELEBI,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15002,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000b2c3,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("ILEX"),
        .otGender = FEMALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_REGIROCK] =
    {
        .nickname = _("REGIROCK"),
        .species = SPECIES_REGIROCK,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15003,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000c3d4,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("TERRA"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_REGICE] =
    {
        .nickname = _("REGICE"),
        .species = SPECIES_REGICE,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15004,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000d4e5,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("GLACIA"),
        .otGender = FEMALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_REGISTEEL] =
    {
        .nickname = _("REGISTEEL"),
        .species = SPECIES_REGISTEEL,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15005,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000e5f6,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("FERRO"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_KYOGRE] =
    {
        .nickname = _("KYOGRE"),
        .species = SPECIES_KYOGRE,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15006,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000f607,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("MARINE"),
        .otGender = FEMALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_GROUDON] =
    {
        .nickname = _("GROUDON"),
        .species = SPECIES_GROUDON,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15007,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x00000718,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("MAGMA"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_RAYQUAZA] =
    {
        .nickname = _("RAYQUAZA"),
        .species = SPECIES_RAYQUAZA,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15008,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x00001829,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("OZONE"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_LATIAS] =
    {
        .nickname = _("LATIAS"),
        .species = SPECIES_LATIAS,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15009,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x0000293a,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("SOUTH"),
        .otGender = FEMALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_LATIOS] =
    {
        .nickname = _("LATIOS"),
        .species = SPECIES_LATIOS,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15010,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x00003a4b,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("NORTH"),
        .otGender = MALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
    },
    [INGAME_TRADE_JIRACHI] =
    {
        .nickname = _("JIRACHI"),
        .species = SPECIES_JIRACHI,
        .ivs = {25, 25, 25, 25, 25, 25},
        .abilityNum = 0,
        .otId = 15011,
        .conditions = {30, 30, 30, 30, 30},
        .personality = 0x00004b5c,
        .heldItem = ITEM_NONE,
        .mailNum = 255,
        .otName = _("WISH"),
        .otGender = FEMALE,
        .sheen = 30,
        .requestedSpecies = SPECIES_MEWTWO
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
