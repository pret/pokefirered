static const u8 sItemEffect_Potion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 20,
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
    [6] = -1,
};

static const u8 sItemEffect_MaxPotion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = -1,
};

static const u8 sItemEffect_HyperPotion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 200,
};

static const u8 sItemEffect_SuperPotion[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 50,
};

static const u8 sItemEffect_FullHeal[6] = {
    [3] = ITEM3_STATUS_ALL,
};

static const u8 sItemEffect_Revive[7] = {
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [6] = -2,
};

static const u8 sItemEffect_MaxRevive[7] = {
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [6] = -1,
};

static const u8 sItemEffect_FreshWater[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 50,
};

static const u8 sItemEffect_SodaPop[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 60,
};

static const u8 sItemEffect_Lemonade[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 80,
};

static const u8 sItemEffect_MoomooMilk[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 100,
};

static const u8 sItemEffect_EnergyPowder[10] = {
    [4] = ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 50,
    [7] = -5,
    [8] = -5,
    [9] = -10,
};

static const u8 sItemEffect_EnergyRoot[10] = {
    [4] = ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 200,
    [7] = -10,
    [8] = -10,
    [9] = -15,
};

static const u8 sItemEffect_HealPowder[9] = {
    [3] = ITEM3_STATUS_ALL,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = -5,
    [7] = -5,
    [8] = -10,
};

static const u8 sItemEffect_RevivalHerb[10] = {
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = -1,
    [7] = -15,
    [8] = -15,
    [9] = -20,
};

static const u8 sItemEffect_Ether[7] = {
    [4] = ITEM4_HEAL_PP_ONE | ITEM4_HEAL_PP_ALL,
    [6] = 10,
};

static const u8 sItemEffect_MaxEther[7] = {
    [4] = ITEM4_HEAL_PP_ONE | ITEM4_HEAL_PP_ALL,
    [6] = 0x7F,
};

static const u8 sItemEffect_Elixir[7] = {
    [4] = ITEM4_HEAL_PP_ALL,
    [6] = 10,
};

static const u8 sItemEffect_MaxElixir[7] = {
    [4] = ITEM4_HEAL_PP_ALL,
    [6] = 0x7F,
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
    [6] = 20,
};

static const u8 sItemEffect_SacredAsh[7] = {
    [0] = ITEM0_SACRED_ASH,
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [6] = -1,
};

static const u8 sItemEffect_HPUp[10] = {
    [4] = ITEM4_EV_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 10,
    [7] = 5,
    [8] = 3,
    [9] = 2,
};

static const u8 sItemEffect_Protein[10] = {
    [4] = ITEM4_EV_ATK,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 10,
    [7] = 5,
    [8] = 3,
    [9] = 2,
};

static const u8 sItemEffect_Iron[10] = {
    [5] = ITEM5_EV_DEF | ITEM5_FRIENDSHIP_ALL,
    [6] = 10,
    [7] = 5,
    [8] = 3,
    [9] = 2,
};

static const u8 sItemEffect_Carbos[10] = {
    [5] = ITEM5_EV_SPEED | ITEM5_FRIENDSHIP_ALL,
    [6] = 10,
    [7] = 5,
    [8] = 3,
    [9] = 2,
};

static const u8 sItemEffect_Calcium[10] = {
    [5] = ITEM5_EV_SPATK | ITEM5_FRIENDSHIP_ALL,
    [6] = 10,
    [7] = 5,
    [8] = 3,
    [9] = 2,
};

static const u8 sItemEffect_RareCandy[10] = {
    [3] = ITEM3_LEVEL_UP,
    [4] = ITEM4_REVIVE | ITEM4_HEAL_HP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 0xFD,
    [7] = 5,
    [8] = 3,
    [9] = 2,
};

static const u8 sItemEffect_PPUp[9] = {
    [4] = ITEM4_PP_UP,
    [5] = ITEM5_FRIENDSHIP_ALL,
    [6] = 5,
    [7] = 3,
    [8] = 2,
};

static const u8 sItemEffect_Zinc[10] = {
    [5] = ITEM5_EV_SPDEF | ITEM5_FRIENDSHIP_ALL,
    [6] = 10,
    [7] = 5,
    [8] = 3,
    [9] = 2,
};

static const u8 sItemEffect_PPMax[9] = {
    [5] = ITEM5_PP_MAX | ITEM5_FRIENDSHIP_ALL,
    [6] = 5,
    [7] = 3,
    [8] = 2,
};

static const u8 sItemEffect_GuardSpec[8] = {
    [3] = ITEM3_MIST,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    [6] = 1,
    [7] = 1,
};

static const u8 sItemEffect_DireHit[8] = {
    [0] = 2 << 4,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    [6] = 1,
    [7] = 1,
};

static const u8 sItemEffect_XAttack[8] = {
    [0] = 1,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    [6] = 1,
    [7] = 1,
};

static const u8 sItemEffect_XDefend[8] = {
    [1] = 1 << 4,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    [6] = 1,
    [7] = 1,
};

static const u8 sItemEffect_XSpeed[8] = {
    [1] = 1,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    [6] = 1,
    [7] = 1,
};

static const u8 sItemEffect_XAccuracy[8] = {
    [2] = 1 << 4,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    [6] = 1,
    [7] = 1,
};

static const u8 sItemEffect_XSpecial[8] = {
    [2] = 1,
    [5] = ITEM5_FRIENDSHIP_LOW | ITEM5_FRIENDSHIP_MID,
    [6] = 1,
    [7] = 1,
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
    [4] = ITEM4_HEAL_PP_ONE | ITEM4_HEAL_PP_ALL,
    [6] = 10,
};

static const u8 sItemEffect_OranBerry[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 10,
};

static const u8 sItemEffect_PersimBerry[6] = {
    [3] = ITEM3_CONFUSION,
};

static const u8 sItemEffect_LumBerry[6] = {
    [3] = ITEM3_STATUS_ALL,
};

static const u8 sItemEffect_SitrusBerry[7] = {
    [4] = ITEM4_HEAL_HP,
    [6] = 30,
};

const u8 *const gItemEffectTable[] =
{
    [ITEM_POTION - ITEM_POTION] = sItemEffect_Potion,
    [ITEM_ANTIDOTE - ITEM_POTION] = sItemEffect_Antidote,
    [ITEM_BURN_HEAL - ITEM_POTION] = sItemEffect_BurnHeal,
    [ITEM_ICE_HEAL - ITEM_POTION] = sItemEffect_IceHeal,
    [ITEM_AWAKENING - ITEM_POTION] = sItemEffect_Awakening,
    [ITEM_PARALYZE_HEAL - ITEM_POTION] = sItemEffect_ParalyzeHeal,
    [ITEM_FULL_RESTORE - ITEM_POTION] = sItemEffect_FullRestore,
    [ITEM_MAX_POTION - ITEM_POTION] = sItemEffect_MaxPotion,
    [ITEM_HYPER_POTION - ITEM_POTION] = sItemEffect_HyperPotion,
    [ITEM_SUPER_POTION - ITEM_POTION] = sItemEffect_SuperPotion,
    [ITEM_FULL_HEAL - ITEM_POTION] = sItemEffect_FullHeal,
    [ITEM_REVIVE - ITEM_POTION] = sItemEffect_Revive,
    [ITEM_MAX_REVIVE - ITEM_POTION] = sItemEffect_MaxRevive,
    [ITEM_FRESH_WATER - ITEM_POTION] = sItemEffect_FreshWater,
    [ITEM_SODA_POP - ITEM_POTION] = sItemEffect_SodaPop,
    [ITEM_LEMONADE - ITEM_POTION] = sItemEffect_Lemonade,
    [ITEM_MOOMOO_MILK - ITEM_POTION] = sItemEffect_MoomooMilk,
    [ITEM_ENERGY_POWDER - ITEM_POTION] = sItemEffect_EnergyPowder,
    [ITEM_ENERGY_ROOT - ITEM_POTION] = sItemEffect_EnergyRoot,
    [ITEM_HEAL_POWDER - ITEM_POTION] = sItemEffect_HealPowder,
    [ITEM_REVIVAL_HERB - ITEM_POTION] = sItemEffect_RevivalHerb,
    [ITEM_ETHER - ITEM_POTION] = sItemEffect_Ether,
    [ITEM_MAX_ETHER - ITEM_POTION] = sItemEffect_MaxEther,
    [ITEM_ELIXIR - ITEM_POTION] = sItemEffect_Elixir,
    [ITEM_MAX_ELIXIR - ITEM_POTION] = sItemEffect_MaxElixir,
    [ITEM_LAVA_COOKIE - ITEM_POTION] = sItemEffect_LavaCookie,
    [ITEM_BLUE_FLUTE - ITEM_POTION] = sItemEffect_BlueFlute,
    [ITEM_YELLOW_FLUTE - ITEM_POTION] = sItemEffect_YellowFlute,
    [ITEM_RED_FLUTE - ITEM_POTION] = sItemEffect_RedFlute,
    [ITEM_BERRY_JUICE - ITEM_POTION] = sItemEffect_BerryJuice,
    [ITEM_SACRED_ASH - ITEM_POTION] = sItemEffect_SacredAsh,
    [ITEM_HP_UP - ITEM_POTION] = sItemEffect_HPUp,
    [ITEM_PROTEIN - ITEM_POTION] = sItemEffect_Protein,
    [ITEM_IRON - ITEM_POTION] = sItemEffect_Iron,
    [ITEM_CARBOS - ITEM_POTION] = sItemEffect_Carbos,
    [ITEM_CALCIUM - ITEM_POTION] = sItemEffect_Calcium,
    [ITEM_RARE_CANDY - ITEM_POTION] = sItemEffect_RareCandy,
    [ITEM_PP_UP - ITEM_POTION] = sItemEffect_PPUp,
    [ITEM_ZINC - ITEM_POTION] = sItemEffect_Zinc,
    [ITEM_PP_MAX - ITEM_POTION] = sItemEffect_PPMax,
    [ITEM_GUARD_SPEC - ITEM_POTION] = sItemEffect_GuardSpec,
    [ITEM_DIRE_HIT - ITEM_POTION] = sItemEffect_DireHit,
    [ITEM_X_ATTACK - ITEM_POTION] = sItemEffect_XAttack,
    [ITEM_X_DEFEND - ITEM_POTION] = sItemEffect_XDefend,
    [ITEM_X_SPEED - ITEM_POTION] = sItemEffect_XSpeed,
    [ITEM_X_ACCURACY - ITEM_POTION] = sItemEffect_XAccuracy,
    [ITEM_X_SPECIAL - ITEM_POTION] = sItemEffect_XSpecial,
    [ITEM_SUN_STONE - ITEM_POTION] = sItemEffect_SunStone,
    [ITEM_MOON_STONE - ITEM_POTION] = sItemEffect_MoonStone,
    [ITEM_FIRE_STONE - ITEM_POTION] = sItemEffect_FireStone,
    [ITEM_THUNDER_STONE - ITEM_POTION] = sItemEffect_ThunderStone,
    [ITEM_WATER_STONE - ITEM_POTION] = sItemEffect_WaterStone,
    [ITEM_LEAF_STONE - ITEM_POTION] = sItemEffect_LeafStone,
    [ITEM_CHERI_BERRY - ITEM_POTION] = sItemEffect_CheriBerry,
    [ITEM_CHESTO_BERRY - ITEM_POTION] = sItemEffect_ChestoBerry,
    [ITEM_PECHA_BERRY - ITEM_POTION] = sItemEffect_PechaBerry,
    [ITEM_RAWST_BERRY - ITEM_POTION] = sItemEffect_RawstBerry,
    [ITEM_ASPEAR_BERRY - ITEM_POTION] = sItemEffect_AspearBerry,
    [ITEM_LEPPA_BERRY - ITEM_POTION] = sItemEffect_LeppaBerry,
    [ITEM_ORAN_BERRY - ITEM_POTION] = sItemEffect_OranBerry,
    [ITEM_PERSIM_BERRY - ITEM_POTION] = sItemEffect_PersimBerry,
    [ITEM_LUM_BERRY - ITEM_POTION] = sItemEffect_LumBerry,
    [ITEM_SITRUS_BERRY - ITEM_POTION] = sItemEffect_SitrusBerry,
    [LAST_BERRY_INDEX - ITEM_POTION] = NULL,
};
