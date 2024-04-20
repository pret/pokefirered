static const u8 sItemEffect_Potion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 20, // Amount of HP to recover
};

static const u8 sItemEffect_Antidote[6] = {
    [3] = ITEM3_POISON,
};

static const u8 sItemEffect_BurnHeal[6] = {
    [3] = ITEM3_BURN,
};

static const u8 sItemEffect_IceHeal[6] = {
    [3] = ITEM3_FREEZE,
};

static const u8 sItemEffect_Awakening[6] = {
    [3] = ITEM3_SLEEP,
};

static const u8 sItemEffect_ParalyzeHeal[6] = {
    [3] = ITEM3_PARALYSIS,
};

static const u8 sItemEffect_FullRestore[7] = {
    [3] = ITEM3_STATUS_ALL,
    [4] = ITEM4_HEAL_HP,
    [6] = ITEM6_HEAL_HP_FULL,
};

static const u8 sItemEffect_MaxPotion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = ITEM6_HEAL_HP_FULL,
};

static const u8 sItemEffect_HyperPotion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 200, // Amount of HP to recover
};

static const u8 sItemEffect_SuperPotion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 50, // Amount of HP to recover
};

static const u8 sItemEffect_FullHeal[6] = {
    [3] = ITEM3_STATUS_ALL,
};

static const u8 sItemEffect_Revive[7] = {
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [6] = ITEM6_HEAL_HP_HALF,
};

static const u8 sItemEffect_MaxRevive[7] = {
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [6] = ITEM6_HEAL_HP_FULL,
};

static const u8 sItemEffect_FreshWater[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 50, // Amount of HP to recover
};

static const u8 sItemEffect_SodaPop[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 60, // Amount of HP to recover
};

static const u8 sItemEffect_Lemonade[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 80, // Amount of HP to recover
};

static const u8 sItemEffect_MoomooMilk[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 100, // Amount of HP to recover
};

static const u8 sItemEffect_EnergyPowder[10] = {
    [4] = ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 50,  // Amount of HP to recover
    [7] = -5,  // Friendship change, low
    [8] = -5,  // Friendship change, mid
    [9] = -10, // Friendship change, high
};

static const u8 sItemEffect_EnergyRoot[10] = {
    [4] = ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 200, // Amount of HP to recover
    [7] = -10, // Friendship change, low
    [8] = -10, // Friendship change, mid
    [9] = -15, // Friendship change, high
};

static const u8 sItemEffect_HealPowder[9] = {
    [3] = ITEM3_STATUS_ALL,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = -5,  // Friendship change, low
    [7] = -5,  // Friendship change, mid
    [8] = -10, // Friendship change, high
};

static const u8 sItemEffect_RevivalHerb[10] = {
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_HEAL_HP_FULL,
    [7] = -15, // Friendship change, low
    [8] = -15, // Friendship change, mid
    [9] = -20, // Friendship change, high
};

static const u8 sItemEffect_Ether[7] = {
    [4] = ITEM4_HEAL_PP_ONE | ITEM4_HEAL_PP,
    [6] = 10, // Amount of PP to recover
};

static const u8 sItemEffect_MaxEther[7] = {
    [4] = ITEM4_HEAL_PP_ONE | ITEM4_HEAL_PP,
    [6] = ITEM6_HEAL_PP_FULL,
};

static const u8 sItemEffect_Elixir[7] = {
    [4] = ITEM4_HEAL_PP,
    [6] = 10, // Amount of PP to recover
};

static const u8 sItemEffect_MaxElixir[7] = {
    [4] = ITEM4_HEAL_PP,
    [6] = ITEM6_HEAL_PP_FULL,
};

static const u8 sItemEffect_LavaCookie[6] = {
    [3] = ITEM3_STATUS_ALL,
};

static const u8 sItemEffect_BlueFlute[6] = {
    [3] = ITEM3_SLEEP,
};

static const u8 sItemEffect_YellowFlute[6] = {
    [3] = ITEM3_CONFUSION,
};

static const u8 sItemEffect_RedFlute[6] = {
    [0] = ITEM0_INFATUATION,
};

static const u8 sItemEffect_BerryJuice[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 20, // Amount of HP to recover
};

static const u8 sItemEffect_SacredAsh[7] = {
    [0] = ITEM0_SACRED_ASH,
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [6] = ITEM6_HEAL_HP_FULL,
};

#define VITAMIN_FRIENDSHIP_CHANGE(i)             \
    [(i) + 0] = 5, /* Friendship change, low */  \
    [(i) + 1] = 3, /* Friendship change, mid */  \
    [(i) + 2] = 2  /* Friendship change, high */

static const u8 sItemEffect_HPUp[10] = {
    [4] = ITEM4_EV_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_ADD_EV,
    VITAMIN_FRIENDSHIP_CHANGE(7),
};

static const u8 sItemEffect_Protein[10] = {
    [4] = ITEM4_EV_ATK,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_ADD_EV,
    VITAMIN_FRIENDSHIP_CHANGE(7),
};

static const u8 sItemEffect_Iron[10] = {
    [5] = ITEM5_EV_DEF | ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_ADD_EV,
    VITAMIN_FRIENDSHIP_CHANGE(7),
};

static const u8 sItemEffect_Carbos[10] = {
    [5] = ITEM5_EV_SPEED | ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_ADD_EV,
    VITAMIN_FRIENDSHIP_CHANGE(7),
};

static const u8 sItemEffect_Calcium[10] = {
    [5] = ITEM5_EV_SPATK | ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_ADD_EV,
    VITAMIN_FRIENDSHIP_CHANGE(7),
};

static const u8 sItemEffect_RareCandy[10] = {
    [3] = ITEM3_LEVEL_UP,
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_HEAL_HP_LVL_UP,
    VITAMIN_FRIENDSHIP_CHANGE(7),
};

static const u8 sItemEffect_PPUp[9] = {
    [4] = ITEM4_PP_UP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    VITAMIN_FRIENDSHIP_CHANGE(6),
};

static const u8 sItemEffect_Zinc[10] = {
    [5] = ITEM5_EV_SPDEF | ITEM5_FRIENDSHIP_ALL,
    [6] = ITEM6_ADD_EV,
    VITAMIN_FRIENDSHIP_CHANGE(7),
};

static const u8 sItemEffect_PPMax[9] = {
    [5] = ITEM5_PP_MAX | ITEM5_FRIENDSHIP_ALL,
    VITAMIN_FRIENDSHIP_CHANGE(6),
};

#define STAT_BOOST_FRIENDSHIP_CHANGE      \
    [6] = 1, /* Friendship change, low */ \
    [7] = 1  /* Friendship change, mid */

static const u8 sItemEffect_GuardSpec[8] = {
    [3] = ITEM3_GUARD_SPEC,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    STAT_BOOST_FRIENDSHIP_CHANGE
};

static const u8 sItemEffect_DireHit[8] = {
    [0] = 2 << 4, // ITEM0_DIRE_HIT
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    STAT_BOOST_FRIENDSHIP_CHANGE
};

static const u8 sItemEffect_XAttack[8] = {
    [1] = ITEM1_X_ATTACK,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    STAT_BOOST_FRIENDSHIP_CHANGE
};

static const u8 sItemEffect_XDefend[8] = {
    [1] = 1 << 4, /// ITEM1_X_DEFENSE
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    STAT_BOOST_FRIENDSHIP_CHANGE,
};

static const u8 sItemEffect_XSpeed[8] = {
    [1] = 1, // ITEM1_X_SPEED
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    STAT_BOOST_FRIENDSHIP_CHANGE,
};

static const u8 sItemEffect_XAccuracy[8] = {
    [2] = 1 << 4, // ITEM2_X_ACCURACY
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    STAT_BOOST_FRIENDSHIP_CHANGE,
};

static const u8 sItemEffect_XSpecial[8] = {
    [2] = 1, // ITEM2_X_SPATK
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    STAT_BOOST_FRIENDSHIP_CHANGE,
};

static const u8 sItemEffect_SunStone[6] = {
    [4] = ITEM4_EVO_STONE,
};

static const u8 sItemEffect_MoonStone[6] = {
    [4] = ITEM4_EVO_STONE,
};

static const u8 sItemEffect_FireStone[6] = {
    [4] = ITEM4_EVO_STONE,
};

static const u8 sItemEffect_ThunderStone[6] = {
    [4] = ITEM4_EVO_STONE,
};

static const u8 sItemEffect_WaterStone[6] = {
    [4] = ITEM4_EVO_STONE,
};

static const u8 sItemEffect_LeafStone[6] = {
    [4] = ITEM4_EVO_STONE,
};

static const u8 sItemEffect_CheriBerry[6] = {
    [3] = ITEM3_PARALYSIS,
};

static const u8 sItemEffect_ChestoBerry[6] = {
    [3] = ITEM3_SLEEP,
};

static const u8 sItemEffect_PechaBerry[6] = {
    [3] = ITEM3_POISON,
};

static const u8 sItemEffect_RawstBerry[6] = {
    [3] = ITEM3_BURN,
};

static const u8 sItemEffect_AspearBerry[6] = {
    [3] = ITEM3_FREEZE,
};

static const u8 sItemEffect_LeppaBerry[7] = {
    [4] = ITEM4_HEAL_PP_ONE | ITEM4_HEAL_PP,
    [6] = 10, // Amount of PP to recover
};

static const u8 sItemEffect_OranBerry[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 10, // Amount of HP to recover
};

static const u8 sItemEffect_PersimBerry[6] = {
    [3] = ITEM3_CONFUSION,
};

static const u8 sItemEffect_LumBerry[6] = {
    [3] = ITEM3_STATUS_ALL,
};

static const u8 sItemEffect_SitrusBerry[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 30, // Amount of HP to recover
};

const u8 *const gItemEffectTable[ITEMS_COUNT] =
{
    [ITEM_POTION]        = sItemEffect_Potion,
    [ITEM_ANTIDOTE]      = sItemEffect_Antidote,
    [ITEM_BURN_HEAL]     = sItemEffect_BurnHeal,
    [ITEM_ICE_HEAL]      = sItemEffect_IceHeal,
    [ITEM_AWAKENING]     = sItemEffect_Awakening,
    [ITEM_PARALYZE_HEAL] = sItemEffect_ParalyzeHeal,
    [ITEM_FULL_RESTORE]  = sItemEffect_FullRestore,
    [ITEM_MAX_POTION]    = sItemEffect_MaxPotion,
    [ITEM_HYPER_POTION]  = sItemEffect_HyperPotion,
    [ITEM_SUPER_POTION]  = sItemEffect_SuperPotion,
    [ITEM_FULL_HEAL]     = sItemEffect_FullHeal,
    [ITEM_REVIVE]        = sItemEffect_Revive,
    [ITEM_MAX_REVIVE]    = sItemEffect_MaxRevive,
    [ITEM_FRESH_WATER]   = sItemEffect_FreshWater,
    [ITEM_SODA_POP]      = sItemEffect_SodaPop,
    [ITEM_LEMONADE]      = sItemEffect_Lemonade,
    [ITEM_MOOMOO_MILK]   = sItemEffect_MoomooMilk,
    [ITEM_ENERGY_POWDER] = sItemEffect_EnergyPowder,
    [ITEM_ENERGY_ROOT]   = sItemEffect_EnergyRoot,
    [ITEM_HEAL_POWDER]   = sItemEffect_HealPowder,
    [ITEM_REVIVAL_HERB]  = sItemEffect_RevivalHerb,
    [ITEM_ETHER]         = sItemEffect_Ether,
    [ITEM_MAX_ETHER]     = sItemEffect_MaxEther,
    [ITEM_ELIXIR]        = sItemEffect_Elixir,
    [ITEM_MAX_ELIXIR]    = sItemEffect_MaxElixir,
    [ITEM_LAVA_COOKIE]   = sItemEffect_LavaCookie,
    [ITEM_BLUE_FLUTE]    = sItemEffect_BlueFlute,
    [ITEM_YELLOW_FLUTE]  = sItemEffect_YellowFlute,
    [ITEM_RED_FLUTE]     = sItemEffect_RedFlute,
    [ITEM_BERRY_JUICE]   = sItemEffect_BerryJuice,
    [ITEM_SACRED_ASH]    = sItemEffect_SacredAsh,
    [ITEM_HP_UP]         = sItemEffect_HPUp,
    [ITEM_PROTEIN]       = sItemEffect_Protein,
    [ITEM_IRON]          = sItemEffect_Iron,
    [ITEM_CARBOS]        = sItemEffect_Carbos,
    [ITEM_CALCIUM]       = sItemEffect_Calcium,
    [ITEM_RARE_CANDY]    = sItemEffect_RareCandy,
    [ITEM_PP_UP]         = sItemEffect_PPUp,
    [ITEM_ZINC]          = sItemEffect_Zinc,
    [ITEM_PP_MAX]        = sItemEffect_PPMax,
    [ITEM_GUARD_SPEC]    = sItemEffect_GuardSpec,
    [ITEM_DIRE_HIT]      = sItemEffect_DireHit,
    [ITEM_X_ATTACK]      = sItemEffect_XAttack,
    [ITEM_X_DEFEND]      = sItemEffect_XDefend,
    [ITEM_X_SPEED]       = sItemEffect_XSpeed,
    [ITEM_X_ACCURACY]    = sItemEffect_XAccuracy,
    [ITEM_X_SPECIAL]     = sItemEffect_XSpecial,
    [ITEM_SUN_STONE]     = sItemEffect_SunStone,
    [ITEM_MOON_STONE]    = sItemEffect_MoonStone,
    [ITEM_FIRE_STONE]    = sItemEffect_FireStone,
    [ITEM_THUNDER_STONE] = sItemEffect_ThunderStone,
    [ITEM_WATER_STONE]   = sItemEffect_WaterStone,
    [ITEM_LEAF_STONE]    = sItemEffect_LeafStone,
    [ITEM_CHERI_BERRY]   = sItemEffect_CheriBerry,
    [ITEM_CHESTO_BERRY]  = sItemEffect_ChestoBerry,
    [ITEM_PECHA_BERRY]   = sItemEffect_PechaBerry,
    [ITEM_RAWST_BERRY]   = sItemEffect_RawstBerry,
    [ITEM_ASPEAR_BERRY]  = sItemEffect_AspearBerry,
    [ITEM_LEPPA_BERRY]   = sItemEffect_LeppaBerry,
    [ITEM_ORAN_BERRY]    = sItemEffect_OranBerry,
    [ITEM_PERSIM_BERRY]  = sItemEffect_PersimBerry,
    [ITEM_LUM_BERRY]     = sItemEffect_LumBerry,
    [ITEM_SITRUS_BERRY]  = sItemEffect_SitrusBerry,
    [LAST_BERRY_INDEX]   = NULL,
};
