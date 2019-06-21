#define IS_POKEMON_C

#include "global.h"
#include "pokemon.h"
#include "random.h"
#include "main.h"
#include "text.h"
#include "string_util.h"
#include "battle.h"
#include "item.h"
#include "event_data.h"
#include "util.h"
#include "pokemon_storage_system.h"
#include "data2.h"
#include "battle_gfx_sfx_util.h"
#include "battle_controllers.h"
#include "evolution_scene.h"
#include "battle_message.h"
#include "link.h"
#include "m4a.h"
#include "sound.h"
#include "constants/items.h"
#include "constants/species.h"
#include "constants/pokemon.h"
#include "constants/abilities.h"
#include "constants/flags.h"
#include "constants/moves.h"
#include "constants/hold_effects.h"
#include "constants/battle_move_effects.h"

// Extracts the upper 16 bits of a 32-bit number
#define HIHALF(n) (((n) & 0xFFFF0000) >> 16)

// Extracts the lower 16 bits of a 32-bit number
#define LOHALF(n) ((n) & 0xFFFF)

// TODO: what is this
struct UnkStruct20244F4
{
    u8 unk0:4;
    u8 unk0_2:4;
    u8 filler1[0xF];
    struct SpriteTemplate *unk10;
};

// External symbols
extern struct UnkStruct20244F4 *gUnknown_20244F4;
extern struct SpriteTemplate gUnknown_825DEF0[];
extern struct SpriteTemplate gUnknown_825DF50[];
extern const union AnimCmd *const *const gTrainerBackAnimsPtrTable[];
extern struct SpriteTemplate gUnknown_825DEF0[];
extern const union AnimCmd *const *const gTrainerFrontAnimsPtrTable[];
extern const union AnimCmd *const gUnknown_82349BC[];
extern const u8 gUnknown_825DEA1[];
extern const u8 gPPUpWriteMasks[];
extern u8 *gUnknown_83FD5D0[];
extern const u8 gUnknown_825DFF0[];
extern const u8 gText_EggNickname[];
extern const u8 gText_BadEgg[];
extern const u8 BattleText_Rose[];
extern const u8 BattleText_UnknownString3[];
extern const u8 BattleText_GetPumped[];
extern const u8 BattleText_MistShroud[];
extern const u8 gText_PkmnsXPreventsSwitching[];
extern const u8 sHoldEffectToType[][2];
extern u8 sLearningMoveTableID;
extern const u8 sSecretBaseFacilityClasses[2][5];
extern u16 gUnknown_8251CB8[];
extern u16 gUnknown_8251FEE[];
extern u16 gUnknown_8252324[];
extern u16 gUnknown_82539D4[];
extern struct SpindaSpot gSpindaSpotGraphics[];
extern s8 gNatureStatTable[][5];
extern const s8 sFriendshipEventDeltas[][3];
extern u32 gTMHMLearnsets[][2];
extern u8 gBattleMonForms[4];
extern const struct CompressedSpritePalette gMonPaletteTable[];
extern const struct CompressedSpritePalette gMonShinyPaletteTable[];
extern const u16 sHMMoves[];
extern s8 gPokeblockFlavorCompatibilityTable[];

// External functions
extern u8 GetCurrentRegionMapSectionId(void); // overworld
extern const struct BattleMove gBattleMoves[];
extern u8 sBattler_AI; // battle_ai
extern void set_unknown_box_id(u8); // field_specials
extern u8 pokemon_order_func(u8);
extern u16 get_unknown_box_id(void); // field_specials
extern u8 StorageGetCurrentBox(void); // pokemon_storage_system
extern void sub_80174B8(u8 battlerId);

union PokemonSubstruct *GetSubstruct(struct BoxPokemon *boxMon, u32 personality, u8 substructType);
s32 GetDeoxysStat(struct Pokemon *mon, s32 statId);

// code
void ZeroBoxMonData(struct BoxPokemon *boxMon)
{
    u8 *raw = (u8 *)boxMon;
    u32 i;
    for (i = 0; i < sizeof(struct BoxPokemon); i++)
        raw[i] = 0;
}

void ZeroMonData(struct Pokemon *mon)
{
    u32 arg;
    ZeroBoxMonData(&mon->box);
    arg = 0;
    SetMonData(mon, MON_DATA_STATUS, &arg);
    SetMonData(mon, MON_DATA_LEVEL, &arg);
    SetMonData(mon, MON_DATA_HP, &arg);
    SetMonData(mon, MON_DATA_MAX_HP, &arg);
    SetMonData(mon, MON_DATA_ATK, &arg);
    SetMonData(mon, MON_DATA_DEF, &arg);
    SetMonData(mon, MON_DATA_SPEED, &arg);
    SetMonData(mon, MON_DATA_SPATK, &arg);
    SetMonData(mon, MON_DATA_SPDEF, &arg);
    arg = 255;
    SetMonData(mon, MON_DATA_MAIL, &arg);
}

void ZeroPlayerPartyMons(void)
{
    s32 i;
    for (i = 0; i < PARTY_SIZE; i++)
        ZeroMonData(&gPlayerParty[i]);
}

void ZeroEnemyPartyMons(void)
{
    s32 i;
    for (i = 0; i < PARTY_SIZE; i++)
        ZeroMonData(&gEnemyParty[i]);
}

void CreateMon(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u32 arg;
    ZeroMonData(mon);
    CreateBoxMon(&mon->box, species, level, fixedIV, hasFixedPersonality, fixedPersonality, otIdType, fixedOtId);
    SetMonData(mon, MON_DATA_LEVEL, &level);
    arg = 255;
    SetMonData(mon, MON_DATA_MAIL, &arg);
    CalculateMonStats(mon);
}

void CreateBoxMon(struct BoxPokemon *boxMon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    u8 speciesName[POKEMON_NAME_LENGTH + 1];
    u32 personality;
    u32 value;
    u16 checksum;

    ZeroBoxMonData(boxMon);

    if (hasFixedPersonality)
        personality = fixedPersonality;
    else
        personality = Random32();

    SetBoxMonData(boxMon, MON_DATA_PERSONALITY, &personality);

    //Determine original trainer ID
    if (otIdType == OT_ID_RANDOM_NO_SHINY) //Pokemon cannot be shiny
    {
        u32 shinyValue;
        do
        {
            value = Random32();
            shinyValue = HIHALF(value) ^ LOHALF(value) ^ HIHALF(personality) ^ LOHALF(personality);
        } while (shinyValue < 8);
    }
    else if (otIdType == OT_ID_PRESET) //Pokemon has a preset OT ID
    {
        value = fixedOtId;
    }
    else //Player is the OT
    {
        value = gSaveBlock2Ptr->playerTrainerId[0]
              | (gSaveBlock2Ptr->playerTrainerId[1] << 8)
              | (gSaveBlock2Ptr->playerTrainerId[2] << 16)
              | (gSaveBlock2Ptr->playerTrainerId[3] << 24);
    }

    SetBoxMonData(boxMon, MON_DATA_OT_ID, &value);

    checksum = CalculateBoxMonChecksum(boxMon);
    SetBoxMonData(boxMon, MON_DATA_CHECKSUM, &checksum);
    EncryptBoxMon(boxMon);
    GetSpeciesName(speciesName, species);
    SetBoxMonData(boxMon, MON_DATA_NICKNAME, speciesName);
    SetBoxMonData(boxMon, MON_DATA_LANGUAGE, &gGameLanguage);
    SetBoxMonData(boxMon, MON_DATA_OT_NAME, gSaveBlock2Ptr->playerName);
    SetBoxMonData(boxMon, MON_DATA_SPECIES, &species);
    SetBoxMonData(boxMon, MON_DATA_EXP, &gExperienceTables[gBaseStats[species].growthRate][level]);
    SetBoxMonData(boxMon, MON_DATA_FRIENDSHIP, &gBaseStats[species].friendship);
    value = GetCurrentRegionMapSectionId();
    SetBoxMonData(boxMon, MON_DATA_MET_LOCATION, &value);
    SetBoxMonData(boxMon, MON_DATA_MET_LEVEL, &level);
    SetBoxMonData(boxMon, MON_DATA_MET_GAME, &gGameVersion);
    value = ITEM_POKE_BALL;
    SetBoxMonData(boxMon, MON_DATA_POKEBALL, &value);
    SetBoxMonData(boxMon, MON_DATA_OT_GENDER, &gSaveBlock2Ptr->playerGender);

    if (fixedIV < 32)
    {
        SetBoxMonData(boxMon, MON_DATA_HP_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_ATK_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_DEF_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPEED_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPATK_IV, &fixedIV);
        SetBoxMonData(boxMon, MON_DATA_SPDEF_IV, &fixedIV);
    }
    else
    {
        u32 iv;
        value = Random();

        iv = value & 0x1F;
        SetBoxMonData(boxMon, MON_DATA_HP_IV, &iv);
        iv = (value & 0x3E0) >> 5;
        SetBoxMonData(boxMon, MON_DATA_ATK_IV, &iv);
        iv = (value & 0x7C00) >> 10;
        SetBoxMonData(boxMon, MON_DATA_DEF_IV, &iv);

        value = Random();

        iv = value & 0x1F;
        SetBoxMonData(boxMon, MON_DATA_SPEED_IV, &iv);
        iv = (value & 0x3E0) >> 5;
        SetBoxMonData(boxMon, MON_DATA_SPATK_IV, &iv);
        iv = (value & 0x7C00) >> 10;
        SetBoxMonData(boxMon, MON_DATA_SPDEF_IV, &iv);
    }

    if (gBaseStats[species].ability2)
    {
        value = personality & 1;
        SetBoxMonData(boxMon, MON_DATA_ALT_ABILITY, &value);
    }

    GiveBoxMonInitialMoveset(boxMon);
}

void CreateMonWithNature(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 nature)
{
    u32 personality;

    do
    {
        personality = Random32();
    }
    while (nature != GetNatureFromPersonality(personality));

    CreateMon(mon, species, level, fixedIV, 1, personality, OT_ID_PLAYER_ID, 0);
}

void CreateMonWithGenderNatureLetter(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 gender, u8 nature, u8 unownLetter)
{
    u32 personality;

    if ((u8)(unownLetter - 1) < 28)
    {
        u16 actualLetter;

        do
        {
            personality = Random32();
            actualLetter = ((((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 28);
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != GetGenderFromSpeciesAndPersonality(species, personality)
            || actualLetter != unownLetter - 1);
    }
    else
    {
        do
        {
            personality = Random32();
        }
        while (nature != GetNatureFromPersonality(personality)
            || gender != GetGenderFromSpeciesAndPersonality(species, personality));
    }

    CreateMon(mon, species, level, fixedIV, 1, personality, OT_ID_PLAYER_ID, 0);
}

// Used to create the Old Man's Weedle?
void CreateMaleMon(struct Pokemon *mon, u16 species, u8 level)
{
    u32 personality;
    u32 otId;

    do
    {
        otId = Random32();
        personality = Random32();
    }
    while (GetGenderFromSpeciesAndPersonality(species, personality) != MON_MALE);
    CreateMon(mon, species, level, 32, 1, personality, OT_ID_PRESET, otId);
}

void CreateMonWithIVsPersonality(struct Pokemon *mon, u16 species, u8 level, u32 ivs, u32 personality)
{
    CreateMon(mon, species, level, 0, 1, personality, OT_ID_PLAYER_ID, 0);
    SetMonData(mon, MON_DATA_IVS, &ivs);
    CalculateMonStats(mon);
}

void CreateMonWithIVsOTID(struct Pokemon *mon, u16 species, u8 level, u8 *ivs, u32 otId)
{
    CreateMon(mon, species, level, 0, 0, 0, OT_ID_PRESET, otId);
    SetMonData(mon, MON_DATA_HP_IV, &ivs[0]);
    SetMonData(mon, MON_DATA_ATK_IV, &ivs[1]);
    SetMonData(mon, MON_DATA_DEF_IV, &ivs[2]);
    SetMonData(mon, MON_DATA_SPEED_IV, &ivs[3]);
    SetMonData(mon, MON_DATA_SPATK_IV, &ivs[4]);
    SetMonData(mon, MON_DATA_SPDEF_IV, &ivs[5]);
    CalculateMonStats(mon);
}

void CreateMonWithEVSpread(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 evSpread)
{
    s32 i;
    s32 statCount = 0;
    u16 evAmount;
    u8 evsBits;

    CreateMon(mon, species, level, fixedIV, 0, 0, 0, 0);

    evsBits = evSpread;

    for (i = 0; i < NUM_STATS; i++)
    {
        if (evsBits & 1)
            statCount++;
        evsBits >>= 1;
    }

    evAmount = MAX_TOTAL_EVS / statCount;

    evsBits = 1;

    for (i = 0; i < NUM_STATS; i++)
    {
        if (evSpread & evsBits)
            SetMonData(mon, MON_DATA_HP_EV + i, &evAmount);
        evsBits <<= 1;
    }

    CalculateMonStats(mon);
}

void sub_803E0A4(struct Pokemon *mon, struct BattleTowerPokemon *src)
{
    s32 i;
    u8 value;

    CreateMon(mon, src->species, src->level, 0, 1, src->personality, 1, src->otId);

    for (i = 0; i < 4; i++)
        SetMonMoveSlot(mon, src->moves[i], i);

    SetMonData(mon, MON_DATA_PP_BONUSES, &src->ppBonuses);
    SetMonData(mon, MON_DATA_HELD_ITEM, &src->heldItem);

    // Why is this commented out in FR/LG?
    /*
    StringCopy(nickname, src->nickname);

    if (nickname[0] == 0xFC && nickname[1] == 0x15)
        language = LANGUAGE_JAPANESE;
    else
        language = GAME_LANGUAGE;

    SetMonData(mon, MON_DATA_LANGUAGE, &language);
    Text_StripExtCtrlCodes(nickname);
    */

    SetMonData(mon, MON_DATA_NICKNAME, &src->nickname);
    SetMonData(mon, MON_DATA_FRIENDSHIP, &src->friendship);
    SetMonData(mon, MON_DATA_HP_EV, &src->hpEV);
    SetMonData(mon, MON_DATA_ATK_EV, &src->attackEV);
    SetMonData(mon, MON_DATA_DEF_EV, &src->defenseEV);
    SetMonData(mon, MON_DATA_SPEED_EV, &src->speedEV);
    SetMonData(mon, MON_DATA_SPATK_EV, &src->spAttackEV);
    SetMonData(mon, MON_DATA_SPDEF_EV, &src->spDefenseEV);
    value = src->altAbility;
    SetMonData(mon, MON_DATA_ALT_ABILITY, &value);
    value = src->hpIV;
    SetMonData(mon, MON_DATA_HP_IV, &value);
    value = src->attackIV;
    SetMonData(mon, MON_DATA_ATK_IV, &value);
    value = src->defenseIV;
    SetMonData(mon, MON_DATA_DEF_IV, &value);
    value = src->speedIV;
    SetMonData(mon, MON_DATA_SPEED_IV, &value);
    value = src->spAttackIV;
    SetMonData(mon, MON_DATA_SPATK_IV, &value);
    value = src->spDefenseIV;
    SetMonData(mon, MON_DATA_SPDEF_IV, &value);
    CalculateMonStats(mon);
}

void CreateObedientMon(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId)
{
    bool32 obedient = TRUE;

    CreateMon(mon, species, level, fixedIV, hasFixedPersonality, fixedPersonality, otIdType, fixedOtId);
    SetMonData(mon, MON_DATA_OBEDIENCE, &obedient);
}

void sub_803E23C(struct Pokemon *mon, struct BattleTowerPokemon *dest)
{
    s32 i;
    u16 heldItem;

    dest->species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);

    if (heldItem == ITEM_ENIGMA_BERRY)
        heldItem = 0;

    dest->heldItem = heldItem;

    for (i = 0; i < 4; i++)
        dest->moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);

    dest->level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    dest->ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    dest->otId = GetMonData(mon, MON_DATA_OT_ID, NULL);
    dest->hpEV = GetMonData(mon, MON_DATA_HP_EV, NULL);
    dest->attackEV = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    dest->defenseEV = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    dest->speedEV = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    dest->spAttackEV = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    dest->spDefenseEV = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    dest->friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    dest->hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    dest->attackIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    dest->defenseIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    dest->speedIV  = GetMonData(mon, MON_DATA_SPEED_IV, NULL);
    dest->spAttackIV  = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    dest->spDefenseIV  = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    dest->altAbility = GetMonData(mon, MON_DATA_ALT_ABILITY, NULL);
    dest->personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    GetMonData(mon, MON_DATA_NICKNAME, dest->nickname);
}

u16 CalculateBoxMonChecksum(struct BoxPokemon *boxMon)
{
    u16 checksum = 0;
    union PokemonSubstruct *substruct0 = GetSubstruct(boxMon, boxMon->personality, 0);
    union PokemonSubstruct *substruct1 = GetSubstruct(boxMon, boxMon->personality, 1);
    union PokemonSubstruct *substruct2 = GetSubstruct(boxMon, boxMon->personality, 2);
    union PokemonSubstruct *substruct3 = GetSubstruct(boxMon, boxMon->personality, 3);
    s32 i;

    for (i = 0; i < 6; i++)
        checksum += substruct0->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct1->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct2->raw[i];

    for (i = 0; i < 6; i++)
        checksum += substruct3->raw[i];

    return checksum;
}

#define CALC_STAT(base, iv, ev, statIndex, field)               \
{                                                               \
    u8 baseStat = gBaseStats[species].base;                     \
    s32 n = (((2 * baseStat + iv + ev / 4) * level) / 100) + 5; \
    u8 nature = GetNature(mon);                                 \
    n = nature_stat_mod(nature, n, statIndex);                  \
    SetMonData(mon, field, &n);                                 \
}

void CalculateMonStats(struct Pokemon *mon)
{
    s32 oldMaxHP = GetMonData(mon, MON_DATA_MAX_HP, NULL);
    s32 currentHP = GetMonData(mon, MON_DATA_HP, NULL);
    s32 hpIV = GetMonData(mon, MON_DATA_HP_IV, NULL);
    s32 hpEV = GetMonData(mon, MON_DATA_HP_EV, NULL);
    s32 attackIV = GetMonData(mon, MON_DATA_ATK_IV, NULL);
    s32 attackEV = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    s32 defenseIV = GetMonData(mon, MON_DATA_DEF_IV, NULL);
    s32 defenseEV = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    s32 speedIV = GetMonData(mon, MON_DATA_SPEED_IV, NULL);
    s32 speedEV = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    s32 spAttackIV = GetMonData(mon, MON_DATA_SPATK_IV, NULL);
    s32 spAttackEV = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    s32 spDefenseIV = GetMonData(mon, MON_DATA_SPDEF_IV, NULL);
    s32 spDefenseEV = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    s32 level = GetLevelFromMonExp(mon);
    s32 newMaxHP;

    SetMonData(mon, MON_DATA_LEVEL, &level);

    if (species == SPECIES_SHEDINJA)
    {
        newMaxHP = 1;
    }
    else
    {
        s32 n = 2 * gBaseStats[species].baseHP + hpIV;
        newMaxHP = (((n + hpEV / 4) * level) / 100) + level + 10;
    }

    gBattleScripting.field_23 = newMaxHP - oldMaxHP;
    if (gBattleScripting.field_23 == 0)
        gBattleScripting.field_23 = 1;

    SetMonData(mon, MON_DATA_MAX_HP, &newMaxHP);

    CALC_STAT(baseAttack, attackIV, attackEV, STAT_ATK, MON_DATA_ATK)
    CALC_STAT(baseDefense, defenseIV, defenseEV, STAT_DEF, MON_DATA_DEF)
    CALC_STAT(baseSpeed, speedIV, speedEV, STAT_SPEED, MON_DATA_SPEED)
    CALC_STAT(baseSpAttack, spAttackIV, spAttackEV, STAT_SPATK, MON_DATA_SPATK)
    CALC_STAT(baseSpDefense, spDefenseIV, spDefenseEV, STAT_SPDEF, MON_DATA_SPDEF)

    if (species == SPECIES_SHEDINJA)
    {
        if (currentHP != 0 || oldMaxHP == 0)
            currentHP = 1;
        else
            return;
    }
    else
    {
        if (currentHP == 0 && oldMaxHP == 0)
            currentHP = newMaxHP;
        else if (currentHP != 0)
            currentHP += newMaxHP - oldMaxHP;
        else
            return;
    }

    SetMonData(mon, MON_DATA_HP, &currentHP);
}

void BoxMonToMon(struct BoxPokemon *src, struct Pokemon *dest)
{
    u32 value = 0;
    dest->box = *src;
    SetMonData(dest, MON_DATA_STATUS, &value);
    SetMonData(dest, MON_DATA_HP, &value);
    SetMonData(dest, MON_DATA_MAX_HP, &value);
    value = 255;
    SetMonData(dest, MON_DATA_MAIL, &value);
    CalculateMonStats(dest);
}

u8 GetLevelFromMonExp(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u32 exp = GetMonData(mon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= MAX_MON_LEVEL && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u8 GetLevelFromBoxMonExp(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    u32 exp = GetBoxMonData(boxMon, MON_DATA_EXP, NULL);
    s32 level = 1;

    while (level <= MAX_MON_LEVEL && gExperienceTables[gBaseStats[species].growthRate][level] <= exp)
        level++;

    return level - 1;
}

u16 GiveMoveToMon(struct Pokemon *mon, u16 move)
{
    return GiveMoveToBoxMon(&mon->box, move);
}

u16 GiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        u16 existingMove = GetBoxMonData(boxMon, MON_DATA_MOVE1 + i, NULL);
        if (!existingMove)
        {
            SetBoxMonData(boxMon, MON_DATA_MOVE1 + i, &move);
            SetBoxMonData(boxMon, MON_DATA_PP1 + i, &gBattleMoves[move].pp);
            return move;
        }
        if (existingMove == move)
            return -2;
    }
    return -1;
}

u16 GiveMoveToBattleMon(struct BattlePokemon *mon, u16 move)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (!mon->moves[i])
        {
            mon->moves[i] = move;
            mon->pp[i] = gBattleMoves[move].pp;
            return move;
        }
    }

    return -1;
}

void SetMonMoveSlot(struct Pokemon *mon, u16 move, u8 slot)
{
    SetMonData(mon, MON_DATA_MOVE1 + slot, &move);
    SetMonData(mon, MON_DATA_PP1 + slot, &gBattleMoves[move].pp);
}

void SetBattleMonMoveSlot(struct BattlePokemon *mon, u16 move, u8 slot)
{
    mon->moves[slot] = move;
    mon->pp[slot] = gBattleMoves[move].pp;
}

void GiveMonInitialMoveset(struct Pokemon *mon)
{
    GiveBoxMonInitialMoveset(&mon->box);
}

// TODO: make level_up_learnsets.h in src/data and move this to there.
#define LEVEL_UP_END 0xffff

void GiveBoxMonInitialMoveset(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    s32 level = GetLevelFromBoxMonExp(boxMon);
    s32 i;

    for (i = 0; gLevelUpLearnsets[species][i] != LEVEL_UP_END; i++)
    {
        u16 moveLevel;
        u16 move;

        moveLevel = (gLevelUpLearnsets[species][i] & 0xFE00);

        if (moveLevel > (level << 9))
            break;

        move = (gLevelUpLearnsets[species][i] & 0x1FF);

        if (GiveMoveToBoxMon(boxMon, move) == 0xFFFF)
            DeleteFirstMoveAndGiveMoveToBoxMon(boxMon, move);
    }
}

u16 MonTryLearningNewMove(struct Pokemon *mon, bool8 firstMove)
{
    u32 retVal = 0;
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 level = GetMonData(mon, MON_DATA_LEVEL, NULL);

    // since you can learn more than one move per level
    // the game needs to know whether you decided to
    // learn it or keep the old set to avoid asking
    // you to learn the same move over and over again
    if (firstMove)
    {
        sLearningMoveTableID = 0;

        while ((gLevelUpLearnsets[species][sLearningMoveTableID] & 0xFE00) != (level << 9))
        {
            sLearningMoveTableID++;
            if (gLevelUpLearnsets[species][sLearningMoveTableID] == LEVEL_UP_END)
                return 0;
        }
    }

    if ((gLevelUpLearnsets[species][sLearningMoveTableID] & 0xFE00) == (level << 9))
    {
        gMoveToLearn = (gLevelUpLearnsets[species][sLearningMoveTableID] & 0x1FF);
        sLearningMoveTableID++;
        retVal = GiveMoveToMon(mon, gMoveToLearn);
    }

    return retVal;
}

void DeleteFirstMoveAndGiveMoveToMon(struct Pokemon *mon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetMonData(mon, MON_DATA_MOVE2 + i, NULL);
        pp[i] = GetMonData(mon, MON_DATA_PP2 + i, NULL);
    }

    ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses >>= 2;
    moves[3] = move;
    pp[3] = gBattleMoves[move].pp;

    for (i = 0; i < 4; i++)
    {
        SetMonData(mon, MON_DATA_MOVE1 + i, &moves[i]);
        SetMonData(mon, MON_DATA_PP1 + i, &pp[i]);
    }

    SetMonData(mon, MON_DATA_PP_BONUSES, &ppBonuses);
}

void DeleteFirstMoveAndGiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move)
{
    s32 i;
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;

    for (i = 0; i < 3; i++)
    {
        moves[i] = GetBoxMonData(boxMon, MON_DATA_MOVE2 + i, NULL);
        pp[i] = GetBoxMonData(boxMon, MON_DATA_PP2 + i, NULL);
    }

    ppBonuses = GetBoxMonData(boxMon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses >>= 2;
    moves[3] = move;
    pp[3] = gBattleMoves[move].pp;

    for (i = 0; i < 4; i++)
    {
        SetBoxMonData(boxMon, MON_DATA_MOVE1 + i, &moves[i]);
        SetBoxMonData(boxMon, MON_DATA_PP1 + i, &pp[i]);
    }

    SetBoxMonData(boxMon, MON_DATA_PP_BONUSES, &ppBonuses);
}

#define APPLY_STAT_MOD(var, mon, stat, statIndex)                                   \
{                                                                                   \
    (var) = (stat) * (gStatStageRatios)[(mon)->statStages[(statIndex)]][0];         \
    (var) /= (gStatStageRatios)[(mon)->statStages[(statIndex)]][1];                 \
}

s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 sideStatus, u16 powerOverride, u8 typeOverride, u8 battlerIdAtk, u8 battlerIdDef)
{
    u32 i;
    s32 damage = 0;
    s32 damageHelper;
    u8 type;
    u16 attack, defense;
    u16 spAttack, spDefense;
    u8 defenderHoldEffect;
    u8 defenderHoldEffectParam;
    u8 attackerHoldEffect;
    u8 attackerHoldEffectParam;

    if (!powerOverride)
        gBattleMovePower = gBattleMoves[move].power;
    else
        gBattleMovePower = powerOverride;

    if (!typeOverride)
        type = gBattleMoves[move].type;
    else
        type = typeOverride & 0x3F;

    attack = attacker->attack;
    defense = defender->defense;
    spAttack = attacker->spAttack;
    spDefense = defender->spDefense;

    if (attacker->item == ITEM_ENIGMA_BERRY)
    {
        attackerHoldEffect = gEnigmaBerries[battlerIdAtk].holdEffect;
        attackerHoldEffectParam = gEnigmaBerries[battlerIdAtk].holdEffectParam;
    }
    else
    {
        attackerHoldEffect = ItemId_GetHoldEffect(attacker->item);
        attackerHoldEffectParam = ItemId_GetHoldEffectParam(attacker->item);
    }

    if (defender->item == ITEM_ENIGMA_BERRY)
    {
        defenderHoldEffect = gEnigmaBerries[battlerIdDef].holdEffect;
        defenderHoldEffectParam = gEnigmaBerries[battlerIdDef].holdEffectParam;
    }
    else
    {
        defenderHoldEffect = ItemId_GetHoldEffect(defender->item);
        defenderHoldEffectParam = ItemId_GetHoldEffectParam(defender->item);
    }

    if (attacker->ability == ABILITY_HUGE_POWER || attacker->ability == ABILITY_PURE_POWER)
        attack *= 2;

    // In FRLG, the Battle Tower and opponent checks are stubbed here.
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | /*BATTLE_TYPE_BATTLE_TOWER |*/ BATTLE_TYPE_EREADER_TRAINER)))
    {
        if (FlagGet(FLAG_UNK820)
            && !GetBattlerSide(battlerIdAtk))
            attack = (110 * attack) / 100;
    }
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | /*BATTLE_TYPE_BATTLE_TOWER |*/ BATTLE_TYPE_EREADER_TRAINER)))
    {
        if (FlagGet(FLAG_UNK824)
            && !GetBattlerSide(battlerIdDef))
            defense = (110 * defense) / 100;
    }
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | /*BATTLE_TYPE_BATTLE_TOWER |*/ BATTLE_TYPE_EREADER_TRAINER)))
    {
        if (FlagGet(FLAG_UNK826)
            && !GetBattlerSide(battlerIdAtk))
            spAttack = (110 * spAttack) / 100;
    }
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | /*BATTLE_TYPE_BATTLE_TOWER |*/ BATTLE_TYPE_EREADER_TRAINER)))
    {
        if (FlagGet(FLAG_UNK826)
            && !GetBattlerSide(battlerIdDef))
            spDefense = (110 * spDefense) / 100;
    }

    // TODO: Use ARRAY_COUNT(sHoldEffectToType)
    for (i = 0; i < 17; i++)
    {
        if (attackerHoldEffect == sHoldEffectToType[i][0]
            && type == sHoldEffectToType[i][1])
        {
            if (IS_TYPE_PHYSICAL(type))
                attack = (attack * (attackerHoldEffectParam + 100)) / 100;
            else
                spAttack = (spAttack * (attackerHoldEffectParam + 100)) / 100;
            break;
        }
    }

    if (attackerHoldEffect == HOLD_EFFECT_CHOICE_BAND)
        attack = (150 * attack) / 100;
    if (attackerHoldEffect == HOLD_EFFECT_SOUL_DEW && !(gBattleTypeFlags & (BATTLE_TYPE_BATTLE_TOWER)) && (attacker->species == SPECIES_LATIAS || attacker->species == SPECIES_LATIOS))
        spAttack = (150 * spAttack) / 100;
    if (defenderHoldEffect == HOLD_EFFECT_SOUL_DEW && !(gBattleTypeFlags & (BATTLE_TYPE_BATTLE_TOWER)) && (defender->species == SPECIES_LATIAS || defender->species == SPECIES_LATIOS))
        spDefense = (150 * spDefense) / 100;
    if (attackerHoldEffect == HOLD_EFFECT_DEEP_SEA_TOOTH && attacker->species == SPECIES_CLAMPERL)
        spAttack *= 2;
    if (defenderHoldEffect == HOLD_EFFECT_DEEP_SEA_SCALE && defender->species == SPECIES_CLAMPERL)
        spDefense *= 2;
    if (attackerHoldEffect == HOLD_EFFECT_LIGHT_BALL && attacker->species == SPECIES_PIKACHU)
        spAttack *= 2;
    if (defenderHoldEffect == HOLD_EFFECT_METAL_POWDER && defender->species == SPECIES_DITTO)
        defense *= 2;
    if (attackerHoldEffect == HOLD_EFFECT_THICK_CLUB && (attacker->species == SPECIES_CUBONE || attacker->species == SPECIES_MAROWAK))
        attack *= 2;
    if (defender->ability == ABILITY_THICK_FAT && (type == TYPE_FIRE || type == TYPE_ICE))
        spAttack /= 2;
    if (attacker->ability == ABILITY_HUSTLE)
        attack = (150 * attack) / 100;
    if (attacker->ability == ABILITY_PLUS && ABILITY_ON_FIELD2(ABILITY_MINUS))
        spAttack = (150 * spAttack) / 100;
    if (attacker->ability == ABILITY_MINUS && ABILITY_ON_FIELD2(ABILITY_PLUS))
        spAttack = (150 * spAttack) / 100;
    if (attacker->ability == ABILITY_GUTS && attacker->status1)
        attack = (150 * attack) / 100;
    if (defender->ability == ABILITY_MARVEL_SCALE && defender->status1)
        defense = (150 * defense) / 100;
    if (type == TYPE_ELECTRIC && AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, 0, 0xFD, 0))
        gBattleMovePower /= 2;
    if (type == TYPE_FIRE && AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, 0, 0xFE, 0))
        gBattleMovePower /= 2;
    if (type == TYPE_GRASS && attacker->ability == ABILITY_OVERGROW && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (type == TYPE_FIRE && attacker->ability == ABILITY_BLAZE && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (type == TYPE_WATER && attacker->ability == ABILITY_TORRENT && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (type == TYPE_BUG && attacker->ability == ABILITY_SWARM && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (gBattleMoves[gCurrentMove].effect == EFFECT_EXPLOSION)
        defense /= 2;

    if (IS_TYPE_PHYSICAL(type))
    {
        if (gCritMultiplier == 2)
        {
            if (attacker->statStages[STAT_ATK] > 6)
                APPLY_STAT_MOD(damage, attacker, attack, STAT_ATK)
            else
                damage = attack;
        }
        else
            APPLY_STAT_MOD(damage, attacker, attack, STAT_ATK)

        damage = damage * gBattleMovePower;
        damage *= (2 * attacker->level / 5 + 2);

        if (gCritMultiplier == 2)
        {
            if (defender->statStages[STAT_DEF] < 6)
                APPLY_STAT_MOD(damageHelper, defender, defense, STAT_DEF)
            else
                damageHelper = defense;
        }
        else
            APPLY_STAT_MOD(damageHelper, defender, defense, STAT_DEF)

        damage = damage / damageHelper;
        damage /= 50;

        if ((attacker->status1 & STATUS1_BURN) && attacker->ability != ABILITY_GUTS)
            damage /= 2;

        if ((sideStatus & SIDE_STATUS_REFLECT) && gCritMultiplier == 1)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && CountAliveMons(2) == 2)
                damage = 2 * (damage / 3);
            else
                damage /= 2;
        }

        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && gBattleMoves[move].target == 8 && CountAliveMons(2) == 2)
            damage /= 2;

        // moves always do at least 1 damage.
        if (damage == 0)
            damage = 1;
    }

    if (type == TYPE_MYSTERY)
        damage = 0; // is ??? type. does 0 damage.

    if (IS_TYPE_SPECIAL(type))
    {
        if (gCritMultiplier == 2)
        {
            if (attacker->statStages[STAT_SPATK] > 6)
                APPLY_STAT_MOD(damage, attacker, spAttack, STAT_SPATK)
            else
                damage = spAttack;
        }
        else
            APPLY_STAT_MOD(damage, attacker, spAttack, STAT_SPATK)

        damage = damage * gBattleMovePower;
        damage *= (2 * attacker->level / 5 + 2);

        if (gCritMultiplier == 2)
        {
            if (defender->statStages[STAT_SPDEF] < 6)
                APPLY_STAT_MOD(damageHelper, defender, spDefense, STAT_SPDEF)
            else
                damageHelper = spDefense;
        }
        else
            APPLY_STAT_MOD(damageHelper, defender, spDefense, STAT_SPDEF)

        damage = (damage / damageHelper);
        damage /= 50;

        if ((sideStatus & SIDE_STATUS_LIGHTSCREEN) && gCritMultiplier == 1)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && CountAliveMons(2) == 2)
                damage = 2 * (damage / 3);
            else
                damage /= 2;
        }

        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && gBattleMoves[move].target == 8 && CountAliveMons(2) == 2)
            damage /= 2;

        // are effects of weather negated with cloud nine or air lock
        if (WEATHER_HAS_EFFECT2)
        {
            if (gBattleWeather & WEATHER_RAIN_TEMPORARY)
            {
                switch (type)
                {
                case TYPE_FIRE:
                    damage /= 2;
                    break;
                case TYPE_WATER:
                    damage = (15 * damage) / 10;
                    break;
                }
            }

            // any weather except sun weakens solar beam
            if ((gBattleWeather & (WEATHER_RAIN_ANY | WEATHER_SANDSTORM_ANY | WEATHER_HAIL)) && gCurrentMove == MOVE_SOLAR_BEAM)
                damage /= 2;

            // sunny
            if (gBattleWeather & WEATHER_SUNNY_ANY)
            {
                switch (type)
                {
                case TYPE_FIRE:
                    damage = (15 * damage) / 10;
                    break;
                case TYPE_WATER:
                    damage /= 2;
                    break;
                }
            }
        }

        // flash fire triggered
        if ((gBattleResources->flags->flags[battlerIdAtk] & UNKNOWN_FLAG_FLASH_FIRE) && type == TYPE_FIRE)
            damage = (15 * damage) / 10;
    }

    return damage + 2;
}

u8 CountAliveMons(u8 a1)
{
    s32 i;
    u8 retVal = 0;

    switch (a1)
    {
    case 0:
        for (i = 0; i < 4; i++)
        {
            if (i != gActiveBattler && !(gAbsentBattlerFlags & gBitTable[i]))
                retVal++;
        }
        break;
    case 1:
        for (i = 0; i < 4; i++)
        {
            if (GetBattlerSide(i) == GetBattlerSide(sBattler_AI) && !(gAbsentBattlerFlags & gBitTable[i]))
                retVal++;
        }
        break;
    case 2:
        for (i = 0; i < 4; i++)
        {
            if (GetBattlerSide(i) == GetBattlerSide(gBattlerTarget) && !(gAbsentBattlerFlags & gBitTable[i]))
                retVal++;
        }
        break;
    }

    return retVal;
}

u8 GetDefaultMoveTarget(u8 a1)
{
    u8 status = GetBattlerPosition(a1) & 1;

    status ^= 1;
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        return GetBattlerAtPosition(status);
    if (CountAliveMons(0) > 1)
    {
        u8 val;

        if ((Random() & 1) == 0)
            val = status ^ 2;
        else
            val = status;
        return GetBattlerAtPosition(val);
    }
    else
    {
        if ((gAbsentBattlerFlags & gBitTable[status]))
            return GetBattlerAtPosition(status ^ 2);
        else
            return GetBattlerAtPosition(status);
    }
}

u8 GetMonGender(struct Pokemon *mon)
{
    return GetBoxMonGender(&mon->box);
}

u8 GetBoxMonGender(struct BoxPokemon *boxMon)
{
    u16 species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    u32 personality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY, NULL);

    switch (gBaseStats[species].genderRatio)
    {
    case MON_MALE:
    case MON_FEMALE:
    case MON_GENDERLESS:
        return gBaseStats[species].genderRatio;
    }

    if (gBaseStats[species].genderRatio > (personality & 0xFF))
        return MON_FEMALE;
    else
        return MON_MALE;
}

u8 GetGenderFromSpeciesAndPersonality(u16 species, u32 personality)
{
    switch (gBaseStats[species].genderRatio)
    {
    case MON_MALE:
    case MON_FEMALE:
    case MON_GENDERLESS:
        return gBaseStats[species].genderRatio;
    }

    if (gBaseStats[species].genderRatio > (personality & 0xFF))
        return MON_FEMALE;
    else
        return MON_MALE;
}

void SetMultiuseSpriteTemplateToPokemon(u16 trainerSpriteId, u8 battlerPosition)
{
    if(gMonSpritesGfxPtr != NULL)
    {
        if(battlerPosition >= 4)
            battlerPosition = 0;

        gMultiuseSpriteTemplate = gMonSpritesGfxPtr->templates[battlerPosition];
    }
    else
    {
        if(gUnknown_20244F4)
        {
            if(battlerPosition >= (s8)gUnknown_20244F4->unk0_2) // why a cast?!? changing the unk0_2 type to s8 causes extra shifts, but a cast is the correct fix. why, compiler?
                battlerPosition = 0;

            gMultiuseSpriteTemplate = gUnknown_20244F4->unk10[battlerPosition];
        }
        else
        {
            if(battlerPosition >= 4)
                battlerPosition = 0;

            gMultiuseSpriteTemplate = gUnknown_825DEF0[battlerPosition];
        }
    }
    gMultiuseSpriteTemplate.paletteTag = trainerSpriteId;
    gMultiuseSpriteTemplate.anims = gUnknown_82349BC;
}

void SetMultiuseSpriteTemplateToTrainerBack(u16 trainerSpriteId, u8 battlerPosition)
{
    gMultiuseSpriteTemplate.paletteTag = trainerSpriteId;
    if(battlerPosition == B_POSITION_PLAYER_LEFT || battlerPosition == B_POSITION_PLAYER_RIGHT)
    {
        gMultiuseSpriteTemplate = gUnknown_825DF50[trainerSpriteId];
        gMultiuseSpriteTemplate.anims = gTrainerBackAnimsPtrTable[trainerSpriteId];
    }
    else
    {
        if (gMonSpritesGfxPtr != NULL)
            gMultiuseSpriteTemplate = gMonSpritesGfxPtr->templates[battlerPosition];
        else
            gMultiuseSpriteTemplate = gUnknown_825DEF0[battlerPosition];
        gMultiuseSpriteTemplate.anims = gTrainerFrontAnimsPtrTable[trainerSpriteId];
    }
}

void EncryptBoxMon(struct BoxPokemon *boxMon)
{
    u32 i;
    for (i = 0; i < 12; i++)
    {
        boxMon->secure.raw[i] ^= boxMon->personality;
        boxMon->secure.raw[i] ^= boxMon->otId;
    }
}

void DecryptBoxMon(struct BoxPokemon *boxMon)
{
    u32 i;
    for (i = 0; i < 12; i++)
    {
        boxMon->secure.raw[i] ^= boxMon->otId;
        boxMon->secure.raw[i] ^= boxMon->personality;
    }
}

#define SUBSTRUCT_CASE(n, v1, v2, v3, v4)                               \
case n:                                                                 \
    {                                                                   \
    union PokemonSubstruct *substructs0 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs1 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs2 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs3 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs4 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs5 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs6 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs7 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs8 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs9 = boxMon->secure.substructs;    \
    union PokemonSubstruct *substructs10 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs11 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs12 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs13 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs14 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs15 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs16 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs17 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs18 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs19 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs20 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs21 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs22 = boxMon->secure.substructs;   \
    union PokemonSubstruct *substructs23 = boxMon->secure.substructs;   \
                                                                        \
        switch (substructType)                                          \
        {                                                               \
        case 0:                                                         \
            substruct = &substructs ## n [v1];                          \
            break;                                                      \
        case 1:                                                         \
            substruct = &substructs ## n [v2];                          \
            break;                                                      \
        case 2:                                                         \
            substruct = &substructs ## n [v3];                          \
            break;                                                      \
        case 3:                                                         \
            substruct = &substructs ## n [v4];                          \
            break;                                                      \
        }                                                               \
        break;                                                          \
    }                                                                   \

union PokemonSubstruct *GetSubstruct(struct BoxPokemon *boxMon, u32 personality, u8 substructType)
{
    union PokemonSubstruct *substruct = NULL;

    switch (personality % 24)
    {
        SUBSTRUCT_CASE( 0,0,1,2,3)
        SUBSTRUCT_CASE( 1,0,1,3,2)
        SUBSTRUCT_CASE( 2,0,2,1,3)
        SUBSTRUCT_CASE( 3,0,3,1,2)
        SUBSTRUCT_CASE( 4,0,2,3,1)
        SUBSTRUCT_CASE( 5,0,3,2,1)
        SUBSTRUCT_CASE( 6,1,0,2,3)
        SUBSTRUCT_CASE( 7,1,0,3,2)
        SUBSTRUCT_CASE( 8,2,0,1,3)
        SUBSTRUCT_CASE( 9,3,0,1,2)
        SUBSTRUCT_CASE(10,2,0,3,1)
        SUBSTRUCT_CASE(11,3,0,2,1)
        SUBSTRUCT_CASE(12,1,2,0,3)
        SUBSTRUCT_CASE(13,1,3,0,2)
        SUBSTRUCT_CASE(14,2,1,0,3)
        SUBSTRUCT_CASE(15,3,1,0,2)
        SUBSTRUCT_CASE(16,2,3,0,1)
        SUBSTRUCT_CASE(17,3,2,0,1)
        SUBSTRUCT_CASE(18,1,2,3,0)
        SUBSTRUCT_CASE(19,1,3,2,0)
        SUBSTRUCT_CASE(20,2,1,3,0)
        SUBSTRUCT_CASE(21,3,1,2,0)
        SUBSTRUCT_CASE(22,2,3,1,0)
        SUBSTRUCT_CASE(23,3,2,1,0)
    }

    return substruct;
}

u32 GetMonData(struct Pokemon *mon, s32 field, u8* data)
{
    u32 ret;

    switch (field)
    {
    case MON_DATA_STATUS:
        ret = mon->status;
        break;
    case MON_DATA_LEVEL:
        ret = mon->level;
        break;
    case MON_DATA_HP:
        ret = mon->hp;
        break;
    case MON_DATA_MAX_HP:
        ret = mon->maxHP;
        break;
    case MON_DATA_ATK:
        ret = (u16)GetDeoxysStat(mon, STAT_ATK);
        if (!ret)
            ret = mon->attack;
        break;
    case MON_DATA_DEF:
        ret = (u16)GetDeoxysStat(mon, STAT_DEF);
        if (!ret)
            ret = mon->defense;
        break;
    case MON_DATA_SPEED:
        ret = (u16)GetDeoxysStat(mon, STAT_SPEED);
        if (!ret)
            ret = mon->speed;
        break;
    case MON_DATA_SPATK:
        ret = (u16)GetDeoxysStat(mon, STAT_SPATK);
        if (!ret)
            ret = mon->spAttack;
        break;
    case MON_DATA_SPDEF:
        ret = (u16)GetDeoxysStat(mon, STAT_SPDEF);
        if (!ret)
            ret = mon->spDefense;
        break;
    case MON_DATA_ATK2:
        ret = mon->attack;
        break;
    case MON_DATA_DEF2:
        ret = mon->defense;
        break;
    case MON_DATA_SPEED2:
        ret = mon->speed;
        break;
    case MON_DATA_SPATK2:
        ret = mon->spAttack;
        break;
    case MON_DATA_SPDEF2:
        ret = mon->spDefense;
        break;
    case MON_DATA_MAIL:
        ret = mon->mail;
        break;
    default:
        ret = GetBoxMonData(&mon->box, field, data);
        break;
    }
    return ret;
}

u32 GetBoxMonData(struct BoxPokemon *boxMon, s32 field, u8 *data)
{
    s32 i;
    u32 retVal = 0;
    struct PokemonSubstruct0 *substruct0 = NULL;
    struct PokemonSubstruct1 *substruct1 = NULL;
    struct PokemonSubstruct2 *substruct2 = NULL;
    struct PokemonSubstruct3 *substruct3 = NULL;

    if (field > MON_DATA_10)
    {
        substruct0 = &(GetSubstruct(boxMon, boxMon->personality, 0)->type0);
        substruct1 = &(GetSubstruct(boxMon, boxMon->personality, 1)->type1);
        substruct2 = &(GetSubstruct(boxMon, boxMon->personality, 2)->type2);
        substruct3 = &(GetSubstruct(boxMon, boxMon->personality, 3)->type3);

        DecryptBoxMon(boxMon);

        if (CalculateBoxMonChecksum(boxMon) != boxMon->checksum)
        {
            boxMon->isBadEgg = 1;
            boxMon->isEgg = 1;
            substruct3->isEgg = 1;
        }
    }

    switch (field)
    {
    case MON_DATA_PERSONALITY:
        retVal = boxMon->personality;
        break;
    case MON_DATA_OT_ID:
        retVal = boxMon->otId;
        break;
    case MON_DATA_NICKNAME:
    {
        if (boxMon->isBadEgg)
        {
            for (retVal = 0;
                retVal < POKEMON_NAME_LENGTH && gText_BadEgg[retVal] != EOS;
                data[retVal] = gText_BadEgg[retVal], retVal++) {}

            data[retVal] = EOS;
        }
        else if (boxMon->isEgg)
        {
            StringCopy(data, gText_EggNickname);
            retVal = StringLength(data);
        }
        else if (boxMon->language == LANGUAGE_JAPANESE)
        {
            data[0] = EXT_CTRL_CODE_BEGIN;
            data[1] = EXT_CTRL_CODE_JPN;

            // FRLG changed i < 7 to i < 6
            for (retVal = 2, i = 0;
                i < 6 && boxMon->nickname[i] != EOS;
                data[retVal] = boxMon->nickname[i], retVal++, i++) {}

            data[retVal++] = EXT_CTRL_CODE_BEGIN;
            data[retVal++] = EXT_CTRL_CODE_ENG;
            data[retVal] = EOS;
        }
        else
        {
            for (retVal = 0;
                retVal < POKEMON_NAME_LENGTH;
                data[retVal] = boxMon->nickname[retVal], retVal++){}

            data[retVal] = EOS;
        }
        break;
    }
    case MON_DATA_LANGUAGE:
        retVal = boxMon->language;
        break;
    case MON_DATA_SANITY_IS_BAD_EGG:
        retVal = boxMon->isBadEgg;
        break;
    case MON_DATA_SANITY_HAS_SPECIES:
        retVal = boxMon->hasSpecies;
        break;
    case MON_DATA_SANITY_IS_EGG:
        retVal = boxMon->isEgg;
        break;
    case MON_DATA_OT_NAME:
    {
        retVal = 0;

        // FRLG changed this to 7 which used to be PLAYER_NAME_LENGTH
        while (retVal < 7)
        {
            data[retVal] = boxMon->otName[retVal];
            retVal++;
        }

        data[retVal] = EOS;
        break;
    }
    case MON_DATA_MARKINGS:
        retVal = boxMon->markings;
        break;
    case MON_DATA_CHECKSUM:
        retVal = boxMon->checksum;
        break;
    case MON_DATA_10:
        retVal = boxMon->unknown;
        break;
    case MON_DATA_SPECIES:
        retVal = boxMon->isBadEgg ? SPECIES_EGG : substruct0->species;
        break;
    case MON_DATA_HELD_ITEM:
        retVal = substruct0->heldItem;
        break;
    case MON_DATA_EXP:
        retVal = substruct0->experience;
        break;
    case MON_DATA_PP_BONUSES:
        retVal = substruct0->ppBonuses;
        break;
    case MON_DATA_FRIENDSHIP:
        retVal = substruct0->friendship;
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        retVal = substruct1->moves[field - MON_DATA_MOVE1];
        break;
    case MON_DATA_PP1:
    case MON_DATA_PP2:
    case MON_DATA_PP3:
    case MON_DATA_PP4:
        retVal = substruct1->pp[field - MON_DATA_PP1];
        break;
    case MON_DATA_HP_EV:
        retVal = substruct2->hpEV;
        break;
    case MON_DATA_ATK_EV:
        retVal = substruct2->attackEV;
        break;
    case MON_DATA_DEF_EV:
        retVal = substruct2->defenseEV;
        break;
    case MON_DATA_SPEED_EV:
        retVal = substruct2->speedEV;
        break;
    case MON_DATA_SPATK_EV:
        retVal = substruct2->spAttackEV;
        break;
    case MON_DATA_SPDEF_EV:
        retVal = substruct2->spDefenseEV;
        break;
    case MON_DATA_COOL:
        retVal = substruct2->cool;
        break;
    case MON_DATA_BEAUTY:
        retVal = substruct2->beauty;
        break;
    case MON_DATA_CUTE:
        retVal = substruct2->cute;
        break;
    case MON_DATA_SMART:
        retVal = substruct2->smart;
        break;
    case MON_DATA_TOUGH:
        retVal = substruct2->tough;
        break;
    case MON_DATA_SHEEN:
        retVal = substruct2->sheen;
        break;
    case MON_DATA_POKERUS:
        retVal = substruct3->pokerus;
        break;
    case MON_DATA_MET_LOCATION:
        retVal = substruct3->metLocation;
        break;
    case MON_DATA_MET_LEVEL:
        retVal = substruct3->metLevel;
        break;
    case MON_DATA_MET_GAME:
        retVal = substruct3->metGame;
        break;
    case MON_DATA_POKEBALL:
        retVal = substruct3->pokeball;
        break;
    case MON_DATA_OT_GENDER:
        retVal = substruct3->otGender;
        break;
    case MON_DATA_HP_IV:
        retVal = substruct3->hpIV;
        break;
    case MON_DATA_ATK_IV:
        retVal = substruct3->attackIV;
        break;
    case MON_DATA_DEF_IV:
        retVal = substruct3->defenseIV;
        break;
    case MON_DATA_SPEED_IV:
        retVal = substruct3->speedIV;
        break;
    case MON_DATA_SPATK_IV:
        retVal = substruct3->spAttackIV;
        break;
    case MON_DATA_SPDEF_IV:
        retVal = substruct3->spDefenseIV;
        break;
    case MON_DATA_IS_EGG:
        retVal = substruct3->isEgg;
        break;
    case MON_DATA_ALT_ABILITY:
        retVal = substruct3->altAbility;
        break;
    case MON_DATA_COOL_RIBBON:
        retVal = substruct3->coolRibbon;
        break;
    case MON_DATA_BEAUTY_RIBBON:
        retVal = substruct3->beautyRibbon;
        break;
    case MON_DATA_CUTE_RIBBON:
        retVal = substruct3->cuteRibbon;
        break;
    case MON_DATA_SMART_RIBBON:
        retVal = substruct3->smartRibbon;
        break;
    case MON_DATA_TOUGH_RIBBON:
        retVal = substruct3->toughRibbon;
        break;
    case MON_DATA_CHAMPION_RIBBON:
        retVal = substruct3->championRibbon;
        break;
    case MON_DATA_WINNING_RIBBON:
        retVal = substruct3->winningRibbon;
        break;
    case MON_DATA_VICTORY_RIBBON:
        retVal = substruct3->victoryRibbon;
        break;
    case MON_DATA_ARTIST_RIBBON:
        retVal = substruct3->artistRibbon;
        break;
    case MON_DATA_EFFORT_RIBBON:
        retVal = substruct3->effortRibbon;
        break;
    case MON_DATA_GIFT_RIBBON_1:
        retVal = substruct3->giftRibbon1;
        break;
    case MON_DATA_GIFT_RIBBON_2:
        retVal = substruct3->giftRibbon2;
        break;
    case MON_DATA_GIFT_RIBBON_3:
        retVal = substruct3->giftRibbon3;
        break;
    case MON_DATA_GIFT_RIBBON_4:
        retVal = substruct3->giftRibbon4;
        break;
    case MON_DATA_GIFT_RIBBON_5:
        retVal = substruct3->giftRibbon5;
        break;
    case MON_DATA_GIFT_RIBBON_6:
        retVal = substruct3->giftRibbon6;
        break;
    case MON_DATA_GIFT_RIBBON_7:
        retVal = substruct3->giftRibbon7;
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        retVal = substruct3->fatefulEncounter;
        break;
    case MON_DATA_OBEDIENCE:
        retVal = substruct3->obedient;
        break;
    case MON_DATA_SPECIES2:
        retVal = substruct0->species;
        if (substruct0->species && (substruct3->isEgg || boxMon->isBadEgg))
            retVal = SPECIES_EGG;
        break;
    case MON_DATA_IVS:
        retVal = substruct3->hpIV | (substruct3->attackIV << 5) | (substruct3->defenseIV << 10) | (substruct3->speedIV << 15) | (substruct3->spAttackIV << 20) | (substruct3->spDefenseIV << 25);
        break;
    case MON_DATA_KNOWN_MOVES:
        if (substruct0->species && !substruct3->isEgg)
        {
            u16 *moves = (u16 *)data;
            s32 i = 0;

            while (moves[i] != 355)
            {
                u16 move = moves[i];
                if (substruct1->moves[0] == move
                    || substruct1->moves[1] == move
                    || substruct1->moves[2] == move
                    || substruct1->moves[3] == move)
                    retVal |= gBitTable[i];
                i++;
            }
        }
        break;
    case MON_DATA_RIBBON_COUNT:
        retVal = 0;
        if (substruct0->species && !substruct3->isEgg)
        {
            retVal += substruct3->coolRibbon;
            retVal += substruct3->beautyRibbon;
            retVal += substruct3->cuteRibbon;
            retVal += substruct3->smartRibbon;
            retVal += substruct3->toughRibbon;
            retVal += substruct3->championRibbon;
            retVal += substruct3->winningRibbon;
            retVal += substruct3->victoryRibbon;
            retVal += substruct3->artistRibbon;
            retVal += substruct3->effortRibbon;
            retVal += substruct3->giftRibbon1;
            retVal += substruct3->giftRibbon2;
            retVal += substruct3->giftRibbon3;
            retVal += substruct3->giftRibbon4;
            retVal += substruct3->giftRibbon5;
            retVal += substruct3->giftRibbon6;
            retVal += substruct3->giftRibbon7;
        }
        break;
    case MON_DATA_RIBBONS:
        retVal = 0;
        if (substruct0->species && !substruct3->isEgg)
        {
            retVal = substruct3->championRibbon
                | (substruct3->coolRibbon << 1)
                | (substruct3->beautyRibbon << 4)
                | (substruct3->cuteRibbon << 7)
                | (substruct3->smartRibbon << 10)
                | (substruct3->toughRibbon << 13)
                | (substruct3->winningRibbon << 16)
                | (substruct3->victoryRibbon << 17)
                | (substruct3->artistRibbon << 18)
                | (substruct3->effortRibbon << 19)
                | (substruct3->giftRibbon1 << 20)
                | (substruct3->giftRibbon2 << 21)
                | (substruct3->giftRibbon3 << 22)
                | (substruct3->giftRibbon4 << 23)
                | (substruct3->giftRibbon5 << 24)
                | (substruct3->giftRibbon6 << 25)
                | (substruct3->giftRibbon7 << 26);
        }
        break;
    default:
        break;
    }

    if (field > MON_DATA_10)
        EncryptBoxMon(boxMon);

    return retVal;
}

#define SET8(lhs) (lhs) = *data
#define SET16(lhs) (lhs) = data[0] + (data[1] << 8)
#define SET32(lhs) (lhs) = data[0] + (data[1] << 8) + (data[2] << 16) + (data[3] << 24)

void SetMonData(struct Pokemon *mon, s32 field, const void *dataArg)
{
    const u8 *data = dataArg;

    switch (field)
    {
    case MON_DATA_STATUS:
        SET32(mon->status);
        break;
    case MON_DATA_LEVEL:
        SET8(mon->level);
        break;
    case MON_DATA_HP:
        SET16(mon->hp);
        break;
    case MON_DATA_MAX_HP:
        SET16(mon->maxHP);
        break;
    case MON_DATA_ATK:
    case MON_DATA_ATK2:
        SET16(mon->attack);
        break;
    case MON_DATA_DEF:
    case MON_DATA_DEF2:
        SET16(mon->defense);
        break;
    case MON_DATA_SPEED:
    case MON_DATA_SPEED2:
        SET16(mon->speed);
        break;
    case MON_DATA_SPATK:
    case MON_DATA_SPATK2:
        SET16(mon->spAttack);
        break;
    case MON_DATA_SPDEF:
    case MON_DATA_SPDEF2:
        SET16(mon->spDefense);
        break;
    case MON_DATA_MAIL:
        SET8(mon->mail);
        break;
    case MON_DATA_SPECIES2:
        break;
    // why did FRLG go out of its way to specify all of these for default?
    case MON_DATA_IVS:
    case MON_DATA_CHAMPION_RIBBON:
    case MON_DATA_WINNING_RIBBON:
    case MON_DATA_VICTORY_RIBBON:
    case MON_DATA_ARTIST_RIBBON:
    case MON_DATA_EFFORT_RIBBON:
    case MON_DATA_GIFT_RIBBON_1:
    case MON_DATA_GIFT_RIBBON_2:
    case MON_DATA_GIFT_RIBBON_3:
    case MON_DATA_GIFT_RIBBON_4:
    case MON_DATA_GIFT_RIBBON_5:
    case MON_DATA_GIFT_RIBBON_6:
    case MON_DATA_GIFT_RIBBON_7:
    case MON_DATA_FATEFUL_ENCOUNTER:
    case MON_DATA_OBEDIENCE:
    case MON_DATA_KNOWN_MOVES:
    case MON_DATA_RIBBON_COUNT:
    case MON_DATA_RIBBONS:
    default:
        SetBoxMonData(&mon->box, field, data);
        break;
    }
}

void SetBoxMonData(struct BoxPokemon *boxMon, s32 field, const void *dataArg)
{
    const u8 *data = dataArg;

    struct PokemonSubstruct0 *substruct0 = NULL;
    struct PokemonSubstruct1 *substruct1 = NULL;
    struct PokemonSubstruct2 *substruct2 = NULL;
    struct PokemonSubstruct3 *substruct3 = NULL;

    if (field > MON_DATA_10)
    {
        substruct0 = &(GetSubstruct(boxMon, boxMon->personality, 0)->type0);
        substruct1 = &(GetSubstruct(boxMon, boxMon->personality, 1)->type1);
        substruct2 = &(GetSubstruct(boxMon, boxMon->personality, 2)->type2);
        substruct3 = &(GetSubstruct(boxMon, boxMon->personality, 3)->type3);

        DecryptBoxMon(boxMon);

        if (CalculateBoxMonChecksum(boxMon) != boxMon->checksum)
        {
            boxMon->isBadEgg = 1;
            boxMon->isEgg = 1;
            substruct3->isEgg = 1;
            EncryptBoxMon(boxMon);
            return;
        }
    }

    switch (field)
    {
    case MON_DATA_PERSONALITY:
        SET32(boxMon->personality);
        break;
    case MON_DATA_OT_ID:
        SET32(boxMon->otId);
        break;
    case MON_DATA_NICKNAME:
    {
        s32 i;
        for (i = 0; i < POKEMON_NAME_LENGTH; i++)
            boxMon->nickname[i] = data[i];
        break;
    }
    case MON_DATA_LANGUAGE:
        SET8(boxMon->language);
        break;
    case MON_DATA_SANITY_IS_BAD_EGG:
        SET8(boxMon->isBadEgg);
        break;
    case MON_DATA_SANITY_HAS_SPECIES:
        SET8(boxMon->hasSpecies);
        break;
    case MON_DATA_SANITY_IS_EGG:
        SET8(boxMon->isEgg);
        break;
    case MON_DATA_OT_NAME:
    {
        s32 i;
        for (i = 0; i < 7; i++)
            boxMon->otName[i] = data[i];
        break;
    }
    case MON_DATA_MARKINGS:
        SET8(boxMon->markings);
        break;
    case MON_DATA_CHECKSUM:
        SET16(boxMon->checksum);
        break;
    case MON_DATA_10:
        SET16(boxMon->unknown);
        break;
    case MON_DATA_SPECIES:
    {
        SET16(substruct0->species);
        if (substruct0->species)
            boxMon->hasSpecies = 1;
        else
            boxMon->hasSpecies = 0;
        break;
    }
    case MON_DATA_HELD_ITEM:
        SET16(substruct0->heldItem);
        break;
    case MON_DATA_EXP:
        SET32(substruct0->experience);
        break;
    case MON_DATA_PP_BONUSES:
        SET8(substruct0->ppBonuses);
        break;
    case MON_DATA_FRIENDSHIP:
        SET8(substruct0->friendship);
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        SET16(substruct1->moves[field - MON_DATA_MOVE1]);
        break;
    case MON_DATA_PP1:
    case MON_DATA_PP2:
    case MON_DATA_PP3:
    case MON_DATA_PP4:
        SET8(substruct1->pp[field - MON_DATA_PP1]);
        break;
    case MON_DATA_HP_EV:
        SET8(substruct2->hpEV);
        break;
    case MON_DATA_ATK_EV:
        SET8(substruct2->attackEV);
        break;
    case MON_DATA_DEF_EV:
        SET8(substruct2->defenseEV);
        break;
    case MON_DATA_SPEED_EV:
        SET8(substruct2->speedEV);
        break;
    case MON_DATA_SPATK_EV:
        SET8(substruct2->spAttackEV);
        break;
    case MON_DATA_SPDEF_EV:
        SET8(substruct2->spDefenseEV);
        break;
    case MON_DATA_COOL:
        SET8(substruct2->cool);
        break;
    case MON_DATA_BEAUTY:
        SET8(substruct2->beauty);
        break;
    case MON_DATA_CUTE:
        SET8(substruct2->cute);
        break;
    case MON_DATA_SMART:
        SET8(substruct2->smart);
        break;
    case MON_DATA_TOUGH:
        SET8(substruct2->tough);
        break;
    case MON_DATA_SHEEN:
        SET8(substruct2->sheen);
        break;
    case MON_DATA_POKERUS:
        SET8(substruct3->pokerus);
        break;
    case MON_DATA_MET_LOCATION:
        SET8(substruct3->metLocation);
        break;
    case MON_DATA_MET_LEVEL:
    {
        u8 metLevel = *data;
        substruct3->metLevel = metLevel;
        break;
    }
    case MON_DATA_MET_GAME:
        SET8(substruct3->metGame);
        break;
    case MON_DATA_POKEBALL:
    {
        u8 pokeball = *data;
        substruct3->pokeball = pokeball;
        break;
    }
    case MON_DATA_OT_GENDER:
        SET8(substruct3->otGender);
        break;
    case MON_DATA_HP_IV:
        SET8(substruct3->hpIV);
        break;
    case MON_DATA_ATK_IV:
        SET8(substruct3->attackIV);
        break;
    case MON_DATA_DEF_IV:
        SET8(substruct3->defenseIV);
        break;
    case MON_DATA_SPEED_IV:
        SET8(substruct3->speedIV);
        break;
    case MON_DATA_SPATK_IV:
        SET8(substruct3->spAttackIV);
        break;
    case MON_DATA_SPDEF_IV:
        SET8(substruct3->spDefenseIV);
        break;
    case MON_DATA_IS_EGG:
        SET8(substruct3->isEgg);
        if (substruct3->isEgg)
            boxMon->isEgg = 1;
        else
            boxMon->isEgg = 0;
        break;
    case MON_DATA_ALT_ABILITY:
        SET8(substruct3->altAbility);
        break;
    case MON_DATA_COOL_RIBBON:
        SET8(substruct3->coolRibbon);
        break;
    case MON_DATA_BEAUTY_RIBBON:
        SET8(substruct3->beautyRibbon);
        break;
    case MON_DATA_CUTE_RIBBON:
        SET8(substruct3->cuteRibbon);
        break;
    case MON_DATA_SMART_RIBBON:
        SET8(substruct3->smartRibbon);
        break;
    case MON_DATA_TOUGH_RIBBON:
        SET8(substruct3->toughRibbon);
        break;
    case MON_DATA_CHAMPION_RIBBON:
        SET8(substruct3->championRibbon);
        break;
    case MON_DATA_WINNING_RIBBON:
        SET8(substruct3->winningRibbon);
        break;
    case MON_DATA_VICTORY_RIBBON:
        SET8(substruct3->victoryRibbon);
        break;
    case MON_DATA_ARTIST_RIBBON:
        SET8(substruct3->artistRibbon);
        break;
    case MON_DATA_EFFORT_RIBBON:
        SET8(substruct3->effortRibbon);
        break;
    case MON_DATA_GIFT_RIBBON_1:
        SET8(substruct3->giftRibbon1);
        break;
    case MON_DATA_GIFT_RIBBON_2:
        SET8(substruct3->giftRibbon2);
        break;
    case MON_DATA_GIFT_RIBBON_3:
        SET8(substruct3->giftRibbon3);
        break;
    case MON_DATA_GIFT_RIBBON_4:
        SET8(substruct3->giftRibbon4);
        break;
    case MON_DATA_GIFT_RIBBON_5:
        SET8(substruct3->giftRibbon5);
        break;
    case MON_DATA_GIFT_RIBBON_6:
        SET8(substruct3->giftRibbon6);
        break;
    case MON_DATA_GIFT_RIBBON_7:
        SET8(substruct3->giftRibbon7);
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        SET8(substruct3->fatefulEncounter);
        break;
    case MON_DATA_OBEDIENCE:
        SET8(substruct3->obedient);
        break;
    case MON_DATA_IVS:
    {
#ifdef BUGFIX_SETMONIVS
        u32 ivs = data[0] | (data[1] << 8) | (data[2] << 16) | (data[3] << 24);
#else
        u32 ivs = *data; // Bug: Only the HP IV and the lower 3 bits of the Attack IV are read. The rest become 0.
#endif
        substruct3->hpIV = ivs & 0x1F;
        substruct3->attackIV = (ivs >> 5) & 0x1F;
        substruct3->defenseIV = (ivs >> 10) & 0x1F;
        substruct3->speedIV = (ivs >> 15) & 0x1F;
        substruct3->spAttackIV = (ivs >> 20) & 0x1F;
        substruct3->spDefenseIV = (ivs >> 25) & 0x1F;
        break;
    }
    default:
        break;
    }

    if (field > MON_DATA_10)
    {
        boxMon->checksum = CalculateBoxMonChecksum(boxMon);
        EncryptBoxMon(boxMon);
    }
}

void CopyMon(void *dest, void *src, size_t size)
{
    memcpy(dest, src, size);
}

u8 GiveMonToPlayer(struct Pokemon *mon)
{
    s32 i;

    SetMonData(mon, MON_DATA_OT_NAME, gSaveBlock2Ptr->playerName);
    SetMonData(mon, MON_DATA_OT_GENDER, &gSaveBlock2Ptr->playerGender);
    SetMonData(mon, MON_DATA_OT_ID, gSaveBlock2Ptr->playerTrainerId);

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            break;
    }

    if (i >= PARTY_SIZE)
        return SendMonToPC(mon);

    CopyMon(&gPlayerParty[i], mon, sizeof(*mon));
    gPlayerPartyCount = i + 1;
    return MON_GIVEN_TO_PARTY;
}

u8 SendMonToPC(struct Pokemon* mon)
{
    s32 boxNo, boxPos;

    set_unknown_box_id(VarGet(VAR_0x4037));

    boxNo = StorageGetCurrentBox();

    do
    {
        for (boxPos = 0; boxPos < 30; boxPos++)
        {
            struct BoxPokemon* checkingMon = GetBoxedMonPtr(boxNo, boxPos);
            if (GetBoxMonData(checkingMon, MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            {
                MonRestorePP(mon);
                CopyMon(checkingMon, &mon->box, sizeof(mon->box));
                gSpecialVar_MonBoxId = boxNo;
                gSpecialVar_MonBoxPos = boxPos;
                if (get_unknown_box_id() != boxNo)
                    FlagClear(FLAG_UNK843);
                VarSet(VAR_0x4037, boxNo);
                return MON_GIVEN_TO_PC;
            }
        }

        boxNo++;
        if (boxNo == 14)
            boxNo = 0;
    } while (boxNo != StorageGetCurrentBox());

    return MON_CANT_GIVE;
}

u8 CalculatePlayerPartyCount(void)
{
    gPlayerPartyCount = 0;

    while (gPlayerPartyCount < 6
        && GetMonData(&gPlayerParty[gPlayerPartyCount], MON_DATA_SPECIES, NULL) != SPECIES_NONE)
    {
        gPlayerPartyCount++;
    }

    return gPlayerPartyCount;
}


u8 CalculateEnemyPartyCount(void)
{
    gEnemyPartyCount = 0;

    while (gEnemyPartyCount < 6
        && GetMonData(&gEnemyParty[gEnemyPartyCount], MON_DATA_SPECIES, NULL) != SPECIES_NONE)
    {
        gEnemyPartyCount++;
    }

    return gEnemyPartyCount;
}

u8 GetMonsStateToDoubles(void)
{
    s32 aliveCount = 0;
    s32 i;
    CalculatePlayerPartyCount();

    if (gPlayerPartyCount == 1)
        return gPlayerPartyCount; // PLAYER_HAS_ONE_MON

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        // FRLG changed the order of these checks, but there's no point to doing that
        // because of the requirement of all 3 of these checks.
        if (GetMonData(&gPlayerParty[i], MON_DATA_HP, NULL) != 0
         && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != SPECIES_NONE
         && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != SPECIES_EGG)
            aliveCount++;
    }

    return (aliveCount > 1) ? PLAYER_HAS_TWO_USABLE_MONS : PLAYER_HAS_ONE_USABLE_MON;
}

u8 GetAbilityBySpecies(u16 species, bool8 altAbility)
{
    if (altAbility)
        gLastUsedAbility = gBaseStats[species].ability2;
    else
        gLastUsedAbility = gBaseStats[species].ability1;

    return gLastUsedAbility;
}

u8 GetMonAbility(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 altAbility = GetMonData(mon, MON_DATA_ALT_ABILITY, NULL);
    return GetAbilityBySpecies(species, altAbility);
}

void CreateSecretBaseEnemyParty(struct SecretBaseRecord *secretBaseRecord)
{
    s32 i, j;

    ZeroEnemyPartyMons();
    *gBattleResources->secretBase = *secretBaseRecord;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gBattleResources->secretBase->party.species[i])
        {
            CreateMon(&gEnemyParty[i],
                gBattleResources->secretBase->party.species[i],
                gBattleResources->secretBase->party.levels[i],
                15,
                1,
                gBattleResources->secretBase->party.personality[i],
                2,
                0);

            SetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM, &gBattleResources->secretBase->party.heldItems[i]);

            for (j = 0; j < 6; j++)
                SetMonData(&gEnemyParty[i], MON_DATA_HP_EV + j, &gBattleResources->secretBase->party.EVs[i]);

            for (j = 0; j < 4; j++)
            {
                SetMonData(&gEnemyParty[i], MON_DATA_MOVE1 + j, &gBattleResources->secretBase->party.moves[i * 4 + j]);
                SetMonData(&gEnemyParty[i], MON_DATA_PP1 + j, &gBattleMoves[gBattleResources->secretBase->party.moves[i * 4 + j]].pp);
            }
        }
    }
    gBattleTypeFlags = 8;
    gTrainerBattleOpponent_A = 0x400;
}

u8 GetSecretBaseTrainerPicIndex(void)
{
    u8 facilityClass = sSecretBaseFacilityClasses[gBattleResources->secretBase->gender][gBattleResources->secretBase->trainerId[0] % 5];
    return gFacilityClassToPicIndex[facilityClass];
}

u8 GetSecretBaseTrainerNameIndex(void)
{
    u8 facilityClass = sSecretBaseFacilityClasses[gBattleResources->secretBase->gender][gBattleResources->secretBase->trainerId[0] % 5];
    return gFacilityClassToTrainerClass[facilityClass];
}

bool8 IsPlayerPartyAndPokemonStorageFull(void)
{
    s32 i;

    for (i = 0; i < PARTY_SIZE; i++)
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            return FALSE;

    return IsPokemonStorageFull();
}

bool8 IsPokemonStorageFull(void)
{
    s32 i, j;

    for (i = 0; i < 14; i++)
        for (j = 0; j < 30; j++)
            if (GetBoxMonDataFromAnyBox(i, j, MON_DATA_SPECIES) == SPECIES_NONE)
                return FALSE;

    return TRUE;
}

void GetSpeciesName(u8 *name, u16 species)
{
    s32 i;

    // Hmm? FRLG has < while Ruby/Emerald has <=
    for (i = 0; i < POKEMON_NAME_LENGTH; i++)
    {
        if (species > NUM_SPECIES)
            name[i] = gSpeciesNames[0][i];
        else
            name[i] = gSpeciesNames[species][i];

        if (name[i] == EOS)
            break;
    }

    name[i] = EOS;
}

u8 CalculatePPWithBonus(u16 move, u8 ppBonuses, u8 moveIndex)
{
    u8 basePP = gBattleMoves[move].pp;
    return basePP + ((basePP * 20 * ((gUnknown_825DEA1[moveIndex] & ppBonuses) >> (2 * moveIndex))) / 100);
}

void RemoveMonPPBonus(struct Pokemon *mon, u8 moveIndex)
{
    u8 ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES, NULL);
    ppBonuses &= gPPUpWriteMasks[moveIndex];
    SetMonData(mon, MON_DATA_PP_BONUSES, &ppBonuses);
}

void RemoveBattleMonPPBonus(struct BattlePokemon *mon, u8 moveIndex)
{
    mon->ppBonuses &= gPPUpWriteMasks[moveIndex];
}

void CopyPlayerPartyMonToBattleData(u8 battlerId, u8 partyIndex)
{
    u16* hpSwitchout;
    s32 i;
    u8 nickname[POKEMON_NAME_LENGTH * 2]; // Why is the nickname array here longer in FR/LG?

    gBattleMons[battlerId].species = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPECIES, NULL);
    gBattleMons[battlerId].item = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HELD_ITEM, NULL);

    for (i = 0; i < 4; i++)
    {
        gBattleMons[battlerId].moves[i] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE1 + i, NULL);
        gBattleMons[battlerId].pp[i] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PP1 + i, NULL);
    }

    gBattleMons[battlerId].ppBonuses = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PP_BONUSES, NULL);
    gBattleMons[battlerId].friendship = GetMonData(&gPlayerParty[partyIndex], MON_DATA_FRIENDSHIP, NULL);
    gBattleMons[battlerId].experience = GetMonData(&gPlayerParty[partyIndex], MON_DATA_EXP, NULL);
    gBattleMons[battlerId].hpIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HP_IV, NULL);
    gBattleMons[battlerId].attackIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_ATK_IV, NULL);
    gBattleMons[battlerId].defenseIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_DEF_IV, NULL);
    gBattleMons[battlerId].speedIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPEED_IV, NULL);
    gBattleMons[battlerId].spAttackIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPATK_IV, NULL);
    gBattleMons[battlerId].spDefenseIV = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPDEF_IV, NULL);
    gBattleMons[battlerId].personality = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PERSONALITY, NULL);
    gBattleMons[battlerId].status1 = GetMonData(&gPlayerParty[partyIndex], MON_DATA_STATUS, NULL);
    gBattleMons[battlerId].level = GetMonData(&gPlayerParty[partyIndex], MON_DATA_LEVEL, NULL);
    gBattleMons[battlerId].hp = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HP, NULL);
    gBattleMons[battlerId].maxHP = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MAX_HP, NULL);
    gBattleMons[battlerId].attack = GetMonData(&gPlayerParty[partyIndex], MON_DATA_ATK, NULL);
    gBattleMons[battlerId].defense = GetMonData(&gPlayerParty[partyIndex], MON_DATA_DEF, NULL);
    gBattleMons[battlerId].speed = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPEED, NULL);
    gBattleMons[battlerId].spAttack = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPATK, NULL);
    gBattleMons[battlerId].spDefense = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPDEF, NULL);
    gBattleMons[battlerId].isEgg = GetMonData(&gPlayerParty[partyIndex], MON_DATA_IS_EGG, NULL);
    gBattleMons[battlerId].altAbility = GetMonData(&gPlayerParty[partyIndex], MON_DATA_ALT_ABILITY, NULL);
    gBattleMons[battlerId].otId = GetMonData(&gPlayerParty[partyIndex], MON_DATA_OT_ID, NULL);
    gBattleMons[battlerId].type1 = gBaseStats[gBattleMons[battlerId].species].type1;
    gBattleMons[battlerId].type2 = gBaseStats[gBattleMons[battlerId].species].type2;
    gBattleMons[battlerId].ability = GetAbilityBySpecies(gBattleMons[battlerId].species, gBattleMons[battlerId].altAbility);
    GetMonData(&gPlayerParty[partyIndex], MON_DATA_NICKNAME, nickname);
    StringCopy10(gBattleMons[battlerId].nickname, nickname);
    GetMonData(&gPlayerParty[partyIndex], MON_DATA_OT_NAME, gBattleMons[battlerId].otName);

    hpSwitchout = &gBattleStruct->hpOnSwitchout[GetBattlerSide(battlerId)];
    *hpSwitchout = gBattleMons[battlerId].hp;

    for (i = 0; i < 8; i++)
        gBattleMons[battlerId].statStages[i] = 6;

    gBattleMons[battlerId].status2 = 0;
    sub_80174B8(battlerId);
    ClearTemporarySpeciesSpriteData(battlerId, FALSE);
}

bool8 ExecuteTableBasedItemEffect(struct Pokemon *mon, u16 item, u8 partyIndex, u8 moveIndex)
{
    return PokemonUseItemEffects(mon, item, partyIndex, moveIndex, 0);
}

extern const u8 gUnknown_825DEA1[];
extern const u8 gUnknown_825DEA9[];
extern const u8 sGetMonDataEVConstants[];

bool8 PokemonUseItemEffects(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex, u8 e)
{
    u32 data;
    s32 friendship;
    s32 cmdIndex;
    bool8 retVal = TRUE;
    const u8 *itemEffect;
    u8 sp24 = 6;
    u32 sp28;
    s8 sp2C = 0;
    u8 holdEffect;
    u8 sp34 = 4;
    u16 heldItem;
    u8 r10;
    u32 r4;

    heldItem = GetMonData(pkmn, MON_DATA_HELD_ITEM, NULL);
    if (heldItem == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
            holdEffect = gEnigmaBerries[gBattlerInMenuId].holdEffect;
        else
            holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
    }
    else
    {
        holdEffect = ItemId_GetHoldEffect(heldItem);
    }

    gPotentialItemEffectBattler = gBattlerInMenuId;
    if (gMain.inBattle)
    {
        gActiveBattler = gBattlerInMenuId;
        cmdIndex = (GetBattlerSide(gActiveBattler) != 0);
        while (cmdIndex < gBattlersCount)
        {
            if (gBattlerPartyIndexes[cmdIndex] == partyIndex)
            {
                sp34 = cmdIndex;
                break;
            }
            cmdIndex += 2;
        }
    }
    else
    {
        gActiveBattler = 0;
        sp34 = 4;
    }

    if (!IS_POKEMON_ITEM(item))
        return TRUE;
    if (gItemEffectTable[item - 13] == NULL && item != ITEM_ENIGMA_BERRY)
        return TRUE;

    if (item == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
            itemEffect = gEnigmaBerries[gActiveBattler].itemEffect;
        else
            itemEffect = gSaveBlock1Ptr->enigmaBerry.itemEffect;
    }
    else
    {
        itemEffect = gItemEffectTable[item - 13];
    }

    for (cmdIndex = 0; cmdIndex < 6; cmdIndex++)
    {
        switch (cmdIndex)
        {
        // status healing effects
        case 0:
            if ((itemEffect[cmdIndex] & 0x80)
             && gMain.inBattle && sp34 != 4 && (gBattleMons[sp34].status2 & STATUS2_INFATUATION))
            {
                gBattleMons[sp34].status2 &= ~STATUS2_INFATUATION;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x30)
             && !(gBattleMons[gActiveBattler].status2 & STATUS2_FOCUS_ENERGY))
            {
                gBattleMons[gActiveBattler].status2 |= STATUS2_FOCUS_ENERGY;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0xF)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] += itemEffect[cmdIndex] & 0xF;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] = 12;
                retVal = FALSE;
            }
            break;
        // in-battle stat boosting effects?
        case 1:
            if ((itemEffect[cmdIndex] & 0xF0)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] += (itemEffect[cmdIndex] & 0xF0) >> 4;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] = 12;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0xF)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] += itemEffect[cmdIndex] & 0xF;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] = 12;
                retVal = FALSE;
            }
            break;
        // more stat boosting effects?
        case 2:
            if ((itemEffect[cmdIndex] & 0xF0)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] += (itemEffect[cmdIndex] & 0xF0) >> 4;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] = 12;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0xF)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] += itemEffect[cmdIndex] & 0xF;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] = 12;
                retVal = FALSE;
            }
            break;
        case 3:
            if ((itemEffect[cmdIndex] & 0x80)
             && gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer == 0)
            {
                gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer = 5;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x40)  // raise level
             && GetMonData(pkmn, MON_DATA_LEVEL, NULL) != 100)
            {
                data = gExperienceTables[gBaseStats[GetMonData(pkmn, MON_DATA_SPECIES, NULL)].growthRate][GetMonData(pkmn, MON_DATA_LEVEL, NULL) + 1];
                SetMonData(pkmn, MON_DATA_EXP, &data);
                CalculateMonStats(pkmn);
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x20)
             && HealStatusConditions(pkmn, partyIndex, 7, sp34) == 0)
            {
                if (sp34 != 4)
                    gBattleMons[sp34].status2 &= ~STATUS2_NIGHTMARE;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x10) && HealStatusConditions(pkmn, partyIndex, 0xF88, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 8) && HealStatusConditions(pkmn, partyIndex, 16, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 4) && HealStatusConditions(pkmn, partyIndex, 32, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 2) && HealStatusConditions(pkmn, partyIndex, 64, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 1)  // heal confusion
             && gMain.inBattle && sp34 != 4 && (gBattleMons[sp34].status2 & STATUS2_CONFUSION))
            {
                gBattleMons[sp34].status2 &= ~STATUS2_CONFUSION;
                retVal = FALSE;
            }
            break;
        // EV, HP, and PP raising effects
        case 4:
            r10 = itemEffect[cmdIndex];
            if (r10 & 0x20)
            {
                r10 &= ~0x20;
                data = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gUnknown_825DEA1[moveIndex]) >> (moveIndex * 2);
                sp28 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                if (data < 3 && sp28 > 4)
                {
                    data = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) + gUnknown_825DEA9[moveIndex];
                    SetMonData(pkmn, MON_DATA_PP_BONUSES, &data);

                    data = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), data, moveIndex) - sp28;
                    data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + data;
                    SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                    retVal = FALSE;
                }
            }
            sp28 = 0;
            while (r10 != 0)
            {
                if (r10 & 1)
                {
                    u16 evCount;
                    s32 r5;
     
                    switch (sp28)
                    {
                    case 0:
                    case 1:
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= 510)
                            return TRUE;
                        data = GetMonData(pkmn, sGetMonDataEVConstants[sp28], NULL);
                        if (data < 100)
                        {
                            if (data + itemEffect[sp24] > 100)
                                r4 = 100 - (data + itemEffect[sp24]) + itemEffect[sp24];
                            else
                                r4 = itemEffect[sp24];
                            if (evCount + r4 > 510)
                                r4 += 510 - (evCount + r4);
                            data += r4;
                            SetMonData(pkmn, sGetMonDataEVConstants[sp28], &data);
                            CalculateMonStats(pkmn);
                            sp24++;
                            retVal = FALSE;
                        }
                        break;
                    case 2:
                        // revive?
                        if (r10 & 0x10)
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) != 0)
                            {
                                sp24++;
                                break;
                            }
                            if (gMain.inBattle)
                            {
                                if (sp34 != 4)
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[sp34];
                                    CopyPlayerPartyMonToBattleData(sp34, pokemon_order_func(gBattlerPartyIndexes[sp34]));
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                                else
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[gActiveBattler ^ 2];
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                            }
                        }
                        else
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) == 0)
                            {
                                sp24++;
                                break;
                            }
                        }
                        data = itemEffect[sp24++];
                        switch (data)
                        {
                        case 0xFF:
                            data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) - GetMonData(pkmn, MON_DATA_HP, NULL);
                            break;
                        case 0xFE:
                            data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) / 2;
                            if (data == 0)
                                data = 1;
                            break;
                        case 0xFD:
                            data = gBattleScripting.field_23;
                            break;
                        }
                        if (GetMonData(pkmn, MON_DATA_MAX_HP, NULL) != GetMonData(pkmn, MON_DATA_HP, NULL))
                        {
                            if (e == 0)
                            {
                                data = GetMonData(pkmn, MON_DATA_HP, NULL) + data;
                                if (data > GetMonData(pkmn, MON_DATA_MAX_HP, NULL))
                                    data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL);
                                SetMonData(pkmn, MON_DATA_HP, &data);
                                if (gMain.inBattle && sp34 != 4)
                                {
                                    gBattleMons[sp34].hp = data;
                                    if (!(r10 & 0x10) && GetBattlerSide(gActiveBattler) == 0)
                                    {
                                        if (gBattleResults.unk3 < 255)
                                            gBattleResults.unk3++;
                                        // I have to re-use this variable to match.
                                        r5 = gActiveBattler;
                                        gActiveBattler = sp34;
                                        BtlController_EmitGetMonData(0, 0, 0);
                                        MarkBufferBankForExecution(gActiveBattler);
                                        gActiveBattler = r5;
                                    }
                                }
                            }
                            else
                            {
                                gBattleMoveDamage = -data;
                            }
                            retVal = FALSE;
                        }
                        r10 &= 0xEF;
                        break;
                    case 3:
                        if (!(r10 & 2))
                        {
                            for (r5 = 0; r5 < 4; r5++)
                            {
                                u16 r4;

                                data = GetMonData(pkmn, MON_DATA_PP1 + r5, NULL);
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                if (data != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                {
                                    data += itemEffect[sp24];
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                    if (data > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                    {
                                        r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                        data = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5);
                                    }
                                    SetMonData(pkmn, MON_DATA_PP1 + r5, &data);
                                    if (gMain.inBattle
                                     && sp34 != 4 && !(gBattleMons[sp34].status2 & 0x200000)
                                     && !(gDisableStructs[sp34].unk18_b & gBitTable[r5]))
                                        gBattleMons[sp34].pp[r5] = data;
                                    retVal = FALSE;
                                }
                            }
                            sp24++;
                        }
                        else
                        {
                            u16 r4;

                            data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL);
                            r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                            if (data != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                            {
                                data += itemEffect[sp24++];
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                if (data > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                                {
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                    data = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                                }
                                SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                                if (gMain.inBattle
                                 && sp34 != 4 && !(gBattleMons[sp34].status2 & 0x200000)
                                 && !(gDisableStructs[sp34].unk18_b & gBitTable[moveIndex]))
                                    gBattleMons[sp34].pp[moveIndex] = data;
                                retVal = FALSE;
                            }
                        }
                        break;
                    case 7:
                        {
                            u16 targetSpecies = GetEvolutionTargetSpecies(pkmn, 2, item);

                            if (targetSpecies != SPECIES_NONE)
                            {
                                BeginEvolutionScene(pkmn, targetSpecies, 0, partyIndex);
                                return FALSE;
                            }
                        }
                        break;
                    }
                }
                sp28++;
                r10 >>= 1;
            }
            break;
        case 5:
            r10 = itemEffect[cmdIndex];
            sp28 = 0;
            while (r10 != 0)
            {
                if (r10 & 1)
                {
                    u16 evCount;

                    switch (sp28)
                    {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= 510)
                            return TRUE;
                        data = GetMonData(pkmn, sGetMonDataEVConstants[sp28 + 2], NULL);
                        if (data < 100)
                        {
                            if (data + itemEffect[sp24] > 100)
                                r4 = 100 - (data + itemEffect[sp24]) + itemEffect[sp24];
                            else
                                r4 = itemEffect[sp24];
                            if (evCount + r4 > 510)
                                r4 += 510 - (evCount + r4);
                            data += r4;
                            SetMonData(pkmn, sGetMonDataEVConstants[sp28 + 2], &data);
                            CalculateMonStats(pkmn);
                            retVal = FALSE;
                            sp24++;
                        }
                        break;
                    case 4:
                        data = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gUnknown_825DEA1[moveIndex]) >> (moveIndex * 2);
                        if (data < 3)
                        {
                            r4 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                            data = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL);
                            data &= gPPUpWriteMasks[moveIndex];
                            data += gUnknown_825DEA9[moveIndex] * 3;

                            SetMonData(pkmn, MON_DATA_PP_BONUSES, &data);
                            data = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), data, moveIndex) - r4;
                            data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + data;
                            SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                            retVal = FALSE;
                        }
                        break;
                    case 5:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 100 && retVal == 0 && sp2C == 0)
                        {
                            sp2C = itemEffect[sp24];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * sp2C / 100;
                            else
                                friendship += sp2C;
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == GetCurrentRegionMapSectionId())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                        }
                        sp24++;
                        break;
                    case 6:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 100 && GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 200
                         && retVal == 0 && sp2C == 0)
                        {
                            sp2C = itemEffect[sp24];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * sp2C / 100;
                            else
                                friendship += sp2C;
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == GetCurrentRegionMapSectionId())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                        }
                        sp24++;
                        break;
                    case 7:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 200 && retVal == 0 && sp2C == 0)
                        {
                            sp2C = itemEffect[sp24];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * sp2C / 100;
                            else
                                friendship += sp2C;
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == GetCurrentRegionMapSectionId())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                        }
                        sp24++;
                        break;
                    }
                }
                sp28++;
                r10 >>= 1;
            }
            break;
        }
    }
    return retVal;
}

bool8 HealStatusConditions(struct Pokemon *mon, u32 unused, u32 healMask, u8 battleId)
{
    u32 status = GetMonData(mon, MON_DATA_STATUS, 0);

    if (status & healMask)
    {
        status &= ~healMask;
        SetMonData(mon, MON_DATA_STATUS, &status);
        if (gMain.inBattle && battleId != 4)
            gBattleMons[battleId].status1 &= ~healMask;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

extern bool8 sub_8042BE8(struct Pokemon *mon, u32 unused, u32 healMask, u8 battleId);

#ifdef NONMATCHING
/*
 * This is nonmatching due to the compiler's insistence on avoiding the u8 cast
 * when loading gMain.inBattle. If it weren't for this absent cast, differing
 * the function would be a lot easier.
 */
bool8 PokemonUseItemEffects2(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex, u8 e)
{ // BEGIN
    u32 data;
    s32 cmdIndex;
    bool8 retVal = TRUE;
    const u8 *itemEffect;
    u8 sp24 = 6;
    u32 sp28;
    s8 sp2C = 0;
    u8 sp34 = 4;
    u16 heldItem;
    u8 r10;
    s32 r4;

    heldItem = GetMonData(pkmn, MON_DATA_HELD_ITEM, NULL);
    if (heldItem == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
            /*holdEffect = */gEnigmaBerries[gBattlerInMenuId].holdEffect;
        else
            /*holdEffect = */gSaveBlock1Ptr->enigmaBerry.holdEffect;
    }
    else
    {
        /*holdEffect = */ItemId_GetHoldEffect(heldItem);
    }

    gPotentialItemEffectBattler = gBattlerInMenuId;

    // grr. the original asm also u8 masks after loading the bitmask, despite
    // the fact that is a useless operation. what's going on here? Something
    // dumb I bet like dead code.
    if (gMain.inBattle)
    {
        gActiveBattler = gBattlerInMenuId;
        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            cmdIndex = 0;
        else
            cmdIndex = 1;
        while (cmdIndex < gBattlersCount)
        {
            if (gBattlerPartyIndexes[cmdIndex] == partyIndex)
            {
                sp34 = cmdIndex;
                break;
            }
            cmdIndex += 2;
        }
    }
    else
    {
        gActiveBattler = 0;
        sp34 = 4;
    }

    // _08042504
    if (!IS_POKEMON_ITEM(item))
        return TRUE;
    if (gItemEffectTable[item - 13] == NULL && item != ITEM_ENIGMA_BERRY)
        return TRUE;

    if (item == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
            itemEffect = gEnigmaBerries[gActiveBattler].itemEffect;
        else
            itemEffect = gSaveBlock1Ptr->enigmaBerry.itemEffect;
    }
    else
    {
        itemEffect = gItemEffectTable[item - 13];
    }

    for (cmdIndex = 0; cmdIndex < 6; cmdIndex++)
    {
        switch (cmdIndex)
        {
        // status healing effects
        case 0:
            if ((itemEffect[cmdIndex] & 0x80)
             && gMain.inBattle && sp34 != 4 && (gBattleMons[sp34].status2 & STATUS2_INFATUATION))
            {
                //gBattleMons[sp34].status2 &= ~STATUS2_INFATUATION;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x30)
             && !(gBattleMons[gActiveBattler].status2 & STATUS2_FOCUS_ENERGY))
            {
                //gBattleMons[gActiveBattler].status2 |= STATUS2_FOCUS_ENERGY;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0xF)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] < 12)
            {
                //gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] += itemEffect[cmdIndex] & 0xF;
                //if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] > 12)
                //    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] = 12;
                retVal = FALSE;
            }
            break;
        // in-battle stat boosting effects?
        case 1:
            if ((itemEffect[cmdIndex] & 0xF0)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] < 12)
            {
                //gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] += (itemEffect[cmdIndex] & 0xF0) >> 4;
                //if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] > 12)
                //    gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] = 12;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0xF)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] < 12)
            {
                //gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] += itemEffect[cmdIndex] & 0xF;
                //if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] > 12)
                //    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] = 12;
                retVal = FALSE;
            }
            break;
        // more stat boosting effects?
        case 2:
            if ((itemEffect[cmdIndex] & 0xF0)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] < 12)
            {
                //gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] += (itemEffect[cmdIndex] & 0xF0) >> 4;
                //if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] > 12)
                //    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] = 12;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0xF)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] < 12)
            {
                //gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] += itemEffect[cmdIndex] & 0xF;
                //if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] > 12)
                //    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] = 12;
                retVal = FALSE;
            }
            break;
        case 3:
            if ((itemEffect[cmdIndex] & 0x80)
             && gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer == 0)
            {
                //gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer = 5;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x40)  // raise level
             && GetMonData(pkmn, MON_DATA_LEVEL, NULL) != 100)
            {
                //data = gExperienceTables[gBaseStats[GetMonData(pkmn, MON_DATA_SPECIES, NULL)].growthRate][GetMonData(pkmn, MON_DATA_LEVEL, NULL) + 1];
                //SetMonData(pkmn, MON_DATA_EXP, &data);
                //CalculateMonStats(pkmn);
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x20)
             && sub_8042BE8(pkmn, partyIndex, 7, sp34) == 0)
            {
                //if (sp34 != 4)
                //    gBattleMons[sp34].status2 &= ~STATUS2_NIGHTMARE;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & 0x10) && sub_8042BE8(pkmn, partyIndex, 0xF88, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 8) && sub_8042BE8(pkmn, partyIndex, 16, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 4) && sub_8042BE8(pkmn, partyIndex, 32, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 2) && sub_8042BE8(pkmn, partyIndex, 64, sp34) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & 1)  // heal confusion
             && gMain.inBattle && sp34 != 4 && (gBattleMons[sp34].status2 & STATUS2_CONFUSION))
            {
                //gBattleMons[sp34].status2 &= ~STATUS2_CONFUSION;
                retVal = FALSE;
            }
            break;
        // EV, HP, and PP raising effects
        case 4:
            r10 = itemEffect[cmdIndex];
            if (r10 & 0x20)
            {
                r10 &= ~0x20;
                data = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gUnknown_825DEA1[moveIndex]) >> (moveIndex * 2);
                sp28 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                if (data < 3 && sp28 > 4)
                {
                    //data = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) + gUnknown_825DEA9[moveIndex];
                    //SetMonData(pkmn, MON_DATA_PP_BONUSES, &data);
                    //
                    //data = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), data, moveIndex) - sp28;
                    //data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + data;
                    //SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                    retVal = FALSE;
                }
            }
            sp28 = 0;
            while (r10 != 0) // _080428C0
            {
                if (r10 & 1)
                {
                    u16 evCount;
                    u16 targetSpecies;
                    s32 r5;
     
                    switch (sp28)
                    {
                    case 0:
                    case 1:
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= 510)
                            return TRUE;
                        data = GetMonData(pkmn, sGetMonDataEVConstants[sp28], NULL);
                        if (data < 100)
                        {
                            //if (data + itemEffect[sp24] > 100)
                            //    r4 = 100 - (data + itemEffect[sp24]) + itemEffect[sp24];
                            //else
                            //    r4 = itemEffect[sp24];
                            //if (evCount + r4 > 510)
                            //    r4 += 510 - (evCount + r4);
                            //data += r4;
                            //SetMonData(pkmn, sGetMonDataEVConstants[sp28], &data);
                            //CalculateMonStats(pkmn);
                            sp24++;
                            retVal = FALSE;
                        }
                        break;
                    case 2:
                        // revive?
                        if (r10 & 0x10)
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) != 0)
                            {
                                sp24++;
                                break;
                            }
                            /*
                            if (gMain.inBattle)
                            {
                                if (sp34 != 4)
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[sp34];
                                    CopyPlayerPartyMonToBattleData(sp34, pokemon_order_func(gBattlerPartyIndexes[sp34]));
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                                else
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[gActiveBattler ^ 2];
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                            }
                            */
                        }
                        else
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) == 0)
                            {
                                sp24++;
                                break;
                            }
                        }
                        /*
                        data = itemEffect[sp24++];
                        switch (data)
                        {
                        case 0xFF:
                            data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) - GetMonData(pkmn, MON_DATA_HP, NULL);
                            break;
                        case 0xFE:
                            data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) / 2;
                            if (data == 0)
                                data = 1;
                            break;
                        case 0xFD:
                            data = gBattleScripting.field_23;
                            break;
                        }
                        */
                        if (GetMonData(pkmn, MON_DATA_MAX_HP, NULL) != GetMonData(pkmn, MON_DATA_HP, NULL))
                        {
                            /*
                            if (e == 0)
                            {
                                data = GetMonData(pkmn, MON_DATA_HP, NULL) + data;
                                if (data > GetMonData(pkmn, MON_DATA_MAX_HP, NULL))
                                    data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL);
                                SetMonData(pkmn, MON_DATA_HP, &data);
                                if (gMain.inBattle && sp34 != 4)
                                {
                                    gBattleMons[sp34].hp = data;
                                    if (!(r10 & 0x10) && GetBattlerSide(gActiveBattler) == 0)
                                    {
                                        if (gBattleResults.unk3 < 255)
                                            gBattleResults.unk3++;
                                        // I have to re-use this variable to match.
                                        r5 = gActiveBattler;
                                        gActiveBattler = sp34;
                                        BtlController_EmitGetMonData(0, 0, 0);
                                        MarkBufferBankForExecution(gActiveBattler);
                                        gActiveBattler = r5;
                                    }
                                }
                            }
                            else
                            {
                                gBattleMoveDamage = -data;
                            }
                            */
                            retVal = FALSE;
                        }
                        sp24++;
                        r10 &= 0xEF;
                        break;
                    case 3:
                        if (!(r10 & 2))
                        {
                            for (r5 = 0; r5 < 4; r5++)
                            {
                                data = GetMonData(pkmn, MON_DATA_PP1 + r5, NULL);
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                if (data != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                {
                                    /*
                                    data += itemEffect[sp24];
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                    if (data > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                    {
                                        r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                        data = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5);
                                    }
                                    SetMonData(pkmn, MON_DATA_PP1 + r5, &data);
                                    if (gMain.inBattle
                                     && sp34 != 4 && !(gBattleMons[sp34].status2 & 0x200000)
                                     && !(gDisableStructs[sp34].unk18_b & gBitTable[r5]))
                                        gBattleMons[sp34].pp[r5] = data;
                                    */
                                    retVal = FALSE;
                                }
                            }
                        }
                        else // _080429FA
                        {
                            data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL);
                            r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                            if (data != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                            {
                                /*
                                data += itemEffect[sp24++];
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                if (data > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                                {
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                    data = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                                }
                                SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                                if (gMain.inBattle
                                 && sp34 != 4 && !(gBattleMons[sp34].status2 & 0x200000)
                                 && !(gDisableStructs[sp34].unk18_b & gBitTable[moveIndex]))
                                    gBattleMons[sp34].pp[moveIndex] = data;
                                */
                                sp24++;
                                retVal = FALSE;
                            }
                        }
                        break;
                    case 7:
                        {
                            targetSpecies = GetEvolutionTargetSpecies(pkmn, 2, item);

                            if (targetSpecies != SPECIES_NONE)
                            {
                                //BeginEvolutionScene(pkmn, targetSpecies, 0, partyIndex);
                                return FALSE;
                            }
                        }
                        break;
                    }
                }
                sp28++;
                r10 >>= 1;
            }
            break;
        case 5:
            r10 = itemEffect[cmdIndex];
            sp28 = 0;
            while (r10 != 0)
            {
                if (r10 & 1)
                {
                    u16 evCount;

                    switch (sp28)
                    {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= 510)
                            return TRUE;
                        data = GetMonData(pkmn, sGetMonDataEVConstants[sp28 + 2], NULL);
                        if (data < 100)
                        {
                            /*
                            if (data + itemEffect[sp24] > 100)
                                r4 = 100 - (data + itemEffect[sp24]) + itemEffect[sp24];
                            else
                                r4 = itemEffect[sp24];
                            if (evCount + r4 > 510)
                                r4 += 510 - (evCount + r4);
                            data += r4;
                            SetMonData(pkmn, sGetMonDataEVConstants[sp28 + 2], &data);
                            CalculateMonStats(pkmn);
                            */
                            retVal = FALSE;
                            sp24++;
                        }
                        break;
                    case 4:
                        data = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gUnknown_825DEA1[moveIndex]) >> (moveIndex * 2);
                        r4 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                        if (data < 3)
                        {
                            if(r4 <= 4)
                                break;
                            /*
                            
                            data = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL);
                            data &= gPPUpWriteMasks[moveIndex];
                            data += gUnknown_825DEA9[moveIndex] * 3;

                            SetMonData(pkmn, MON_DATA_PP_BONUSES, &data);
                            data = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), data, moveIndex) - r4;
                            data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + data;
                            SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                            */
                            retVal = FALSE;
                        }
                        break;
                    case 5:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 100 && retVal == 0 && sp2C == 0)
                        {
                            sp2C = itemEffect[sp24];
                            /*
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * sp2C / 100;
                            else
                                friendship += sp2C;
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == GetCurrentRegionMapSectionId())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                            */
                        }
                        sp24++;
                        break;
                    case 6:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 100 && GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 200
                         && retVal == 0 && sp2C == 0)
                        {
                            sp2C = itemEffect[sp24];
                            /*
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * sp2C / 100;
                            else
                                friendship += sp2C;
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == GetCurrentRegionMapSectionId())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                            */
                        }
                        sp24++;
                        break;
                    case 7:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 200 && retVal == 0 && sp2C == 0)
                        {
                            sp2C = itemEffect[sp24];
                            /*
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * sp2C / 100;
                            else
                                friendship += sp2C;
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == GetCurrentRegionMapSectionId())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                            */
                        }
                        sp24++;
                        break;
                    }
                }
                sp28++;
                r10 >>= 1;
            }
            break;
        }
    }
    return retVal;
}
#else
__attribute__((naked))
bool8 PokemonUseItemEffects2(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex, u8 e)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x20\n\
    mov r8, r0\n\
    lsls r1, 16\n\
    lsrs r1, 16\n\
    str r1, [sp]\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    str r2, [sp, 0x4]\n\
    lsls r3, 24\n\
    lsrs r3, 24\n\
    str r3, [sp, 0x8]\n\
    movs r0, 0x1\n\
    str r0, [sp, 0x10]\n\
    movs r1, 0x6\n\
    mov r10, r1\n\
    movs r2, 0\n\
    str r2, [sp, 0x18]\n\
    movs r0, 0x4\n\
    str r0, [sp, 0x1C]\n\
    mov r0, r8\n\
    movs r1, 0xC\n\
    bl GetMonData\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0xAF\n\
    beq _08042458\n\
    bl ItemId_GetHoldEffect\n\
_08042458:\n\
    ldr r1, _080424B0 @ =gPotentialItemEffectBattler\n\
    ldr r0, _080424B4 @ =gBattlerInMenuId\n\
    ldrb r2, [r0]\n\
    strb r2, [r1]\n\
    ldr r0, _080424B8 @ =gMain\n\
    ldr r1, _080424BC @ =0x00000439\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0\n\
    beq _080424F8\n\
    ldr r0, _080424C0 @ =gActiveBattler\n\
    strb r2, [r0]\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    negs r1, r0\n\
    orrs r1, r0\n\
    lsrs r1, 31\n\
    str r1, [sp, 0xC]\n\
    ldr r0, _080424C4 @ =gBattlersCount\n\
    ldr r4, [sp]\n\
    subs r4, 0xD\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bge _08042504\n\
    ldr r2, _080424C8 @ =gBattlerPartyIndexes\n\
    lsls r0, r1, 1\n\
    adds r0, r2\n\
    ldrh r3, [r0]\n\
    ldr r1, [sp, 0x4]\n\
    lsls r0, r1, 16\n\
    lsrs r1, r0, 16\n\
    adds r5, r0, 0\n\
    cmp r3, r1\n\
    bne _080424CC\n\
    ldr r2, [sp, 0xC]\n\
    str r2, [sp, 0x1C]\n\
    b _08042504\n\
    .align 2, 0\n\
_080424B0: .4byte gPotentialItemEffectBattler\n\
_080424B4: .4byte gBattlerInMenuId\n\
_080424B8: .4byte gMain\n\
_080424BC: .4byte 0x00000439\n\
_080424C0: .4byte gActiveBattler\n\
_080424C4: .4byte gBattlersCount\n\
_080424C8: .4byte gBattlerPartyIndexes\n\
_080424CC:\n\
    ldr r0, [sp, 0xC]\n\
    adds r0, 0x2\n\
    str r0, [sp, 0xC]\n\
    ldr r0, _080424F4 @ =gBattlersCount\n\
    ldr r1, [sp, 0xC]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bge _08042504\n\
    lsls r0, r1, 1\n\
    adds r0, r2\n\
    ldrh r1, [r0]\n\
    lsrs r0, r5, 16\n\
    cmp r1, r0\n\
    bne _080424CC\n\
    ldr r2, [sp, 0xC]\n\
    lsls r0, r2, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x1C]\n\
    b _08042504\n\
    .align 2, 0\n\
_080424F4: .4byte gBattlersCount\n\
_080424F8:\n\
    ldr r0, _08042520 @ =gActiveBattler\n\
    strb r1, [r0]\n\
    movs r0, 0x4\n\
    str r0, [sp, 0x1C]\n\
    ldr r4, [sp]\n\
    subs r4, 0xD\n\
_08042504:\n\
    lsls r0, r4, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0xA5\n\
    bhi _08042578\n\
    ldr r1, _08042524 @ =gItemEffectTable\n\
    lsls r0, r4, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    bne _08042528\n\
    ldr r1, [sp]\n\
    cmp r1, 0xAF\n\
    beq _0804252E\n\
    b _08042578\n\
    .align 2, 0\n\
_08042520: .4byte gActiveBattler\n\
_08042524: .4byte gItemEffectTable\n\
_08042528:\n\
    ldr r2, [sp]\n\
    cmp r2, 0xAF\n\
    bne _0804257C\n\
_0804252E:\n\
    ldr r0, _08042550 @ =gMain\n\
    ldr r1, _08042554 @ =0x00000439\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08042560\n\
    ldr r0, _08042558 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 3\n\
    subs r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _0804255C @ =gEnigmaBerries+0x8\n\
    adds r0, r1\n\
    b _0804257C\n\
    .align 2, 0\n\
_08042550: .4byte gMain\n\
_08042554: .4byte 0x00000439\n\
_08042558: .4byte gActiveBattler\n\
_0804255C: .4byte gEnigmaBerries+0x8\n\
_08042560:\n\
    ldr r0, _0804256C @ =gSaveBlock1Ptr\n\
    ldr r0, [r0]\n\
    ldr r2, _08042570 @ =0x00003108\n\
    adds r2, r0, r2\n\
    str r2, [sp, 0x14]\n\
    b _0804257E\n\
    .align 2, 0\n\
_0804256C: .4byte gSaveBlock1Ptr\n\
_08042570: .4byte 0x00003108\n\
_08042574:\n\
    movs r0, 0\n\
    b _08042BD8\n\
_08042578:\n\
    movs r0, 0x1\n\
    b _08042BD8\n\
_0804257C:\n\
    str r0, [sp, 0x14]\n\
_0804257E:\n\
    movs r0, 0\n\
    str r0, [sp, 0xC]\n\
_08042582:\n\
    ldr r1, [sp, 0xC]\n\
    cmp r1, 0x5\n\
    bls _0804258A\n\
    b _08042BCA\n\
_0804258A:\n\
    lsls r0, r1, 2\n\
    ldr r1, _08042594 @ =_08042598\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08042594: .4byte _08042598\n\
    .align 2, 0\n\
_08042598:\n\
    .4byte _080425B0\n\
    .4byte _0804264C\n\
    .4byte _080426A8\n\
    .4byte _08042708\n\
    .4byte _08042850\n\
    .4byte _08042A6A\n\
_080425B0:\n\
    ldr r0, [sp, 0x14]\n\
    ldr r1, [sp, 0xC]\n\
    adds r2, r0, r1\n\
    ldrb r1, [r2]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    adds r5, r2, 0\n\
    cmp r0, 0\n\
    beq _080425F4\n\
    ldr r0, _0804263C @ =gMain\n\
    ldr r2, _08042640 @ =0x00000439\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080425F4\n\
    ldr r0, [sp, 0x1C]\n\
    cmp r0, 0x4\n\
    beq _080425F4\n\
    ldr r1, _08042644 @ =gBattleMons\n\
    movs r0, 0x58\n\
    ldr r2, [sp, 0x1C]\n\
    muls r0, r2\n\
    adds r1, 0x50\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    movs r1, 0xF0\n\
    lsls r1, 12\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080425F4\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
_080425F4:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x30\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0804261C\n\
    ldr r1, _08042644 @ =gBattleMons\n\
    ldr r0, _08042648 @ =gActiveBattler\n\
    ldrb r2, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r2\n\
    adds r1, 0x50\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 13\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0804261C\n\
    movs r1, 0\n\
    str r1, [sp, 0x10]\n\
_0804261C:\n\
    ldrb r1, [r5]\n\
    movs r0, 0xF\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08042628\n\
    b _08042BCA\n\
_08042628:\n\
    ldr r2, _08042644 @ =gBattleMons\n\
    ldr r0, _08042648 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r2\n\
    ldrb r0, [r0, 0x19]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    b _080426F2\n\
    .align 2, 0\n\
_0804263C: .4byte gMain\n\
_08042640: .4byte 0x00000439\n\
_08042644: .4byte gBattleMons\n\
_08042648: .4byte gActiveBattler\n\
_0804264C:\n\
    ldr r0, [sp, 0x14]\n\
    ldr r1, [sp, 0xC]\n\
    adds r2, r0, r1\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF0\n\
    ands r0, r1\n\
    adds r5, r2, 0\n\
    cmp r0, 0\n\
    beq _08042678\n\
    ldr r2, _080426A0 @ =gBattleMons\n\
    ldr r0, _080426A4 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r2\n\
    ldrb r0, [r0, 0x1A]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0xB\n\
    bgt _08042678\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
_08042678:\n\
    ldrb r1, [r5]\n\
    movs r0, 0xF\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08042684\n\
    b _08042BCA\n\
_08042684:\n\
    ldr r2, _080426A0 @ =gBattleMons\n\
    ldr r0, _080426A4 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r2\n\
    ldrb r0, [r0, 0x1B]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0xB\n\
    ble _0804269C\n\
    b _08042BCA\n\
_0804269C:\n\
    b _08042832\n\
    .align 2, 0\n\
_080426A0: .4byte gBattleMons\n\
_080426A4: .4byte gActiveBattler\n\
_080426A8:\n\
    ldr r1, [sp, 0x14]\n\
    ldr r0, [sp, 0xC]\n\
    adds r2, r1, r0\n\
    ldrb r1, [r2]\n\
    movs r0, 0xF0\n\
    ands r0, r1\n\
    adds r5, r2, 0\n\
    cmp r0, 0\n\
    beq _080426D4\n\
    ldr r2, _08042700 @ =gBattleMons\n\
    ldr r0, _08042704 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r2\n\
    ldrb r0, [r0, 0x1E]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0xB\n\
    bgt _080426D4\n\
    movs r1, 0\n\
    str r1, [sp, 0x10]\n\
_080426D4:\n\
    ldrb r1, [r5]\n\
    movs r0, 0xF\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080426E0\n\
    b _08042BCA\n\
_080426E0:\n\
    ldr r2, _08042700 @ =gBattleMons\n\
    ldr r0, _08042704 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r2\n\
    ldrb r0, [r0, 0x1C]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
_080426F2:\n\
    cmp r0, 0xB\n\
    ble _080426F8\n\
    b _08042BCA\n\
_080426F8:\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
    b _08042BCA\n\
    .align 2, 0\n\
_08042700: .4byte gBattleMons\n\
_08042704: .4byte gActiveBattler\n\
_08042708:\n\
    ldr r0, [sp, 0x14]\n\
    ldr r1, [sp, 0xC]\n\
    adds r2, r0, r1\n\
    ldrb r1, [r2]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    adds r5, r2, 0\n\
    cmp r0, 0\n\
    beq _0804273A\n\
    ldr r4, _08042838 @ =gSideTimers\n\
    ldr r0, _0804283C @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r4\n\
    ldrb r0, [r1, 0x4]\n\
    cmp r0, 0\n\
    bne _0804273A\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
_0804273A:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08042756\n\
    mov r0, r8\n\
    movs r1, 0x38\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r0, 0x64\n\
    beq _08042756\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
_08042756:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x20\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08042776\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x4]\n\
    movs r2, 0x7\n\
    ldr r3, [sp, 0x1C]\n\
    bl sub_8042BE8\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08042776\n\
    movs r1, 0\n\
    str r1, [sp, 0x10]\n\
_08042776:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08042796\n\
    ldr r2, _08042840 @ =0x00000f88\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x4]\n\
    ldr r3, [sp, 0x1C]\n\
    bl sub_8042BE8\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08042796\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
_08042796:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080427B6\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x4]\n\
    movs r2, 0x10\n\
    ldr r3, [sp, 0x1C]\n\
    bl sub_8042BE8\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080427B6\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
_080427B6:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080427D6\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x4]\n\
    movs r2, 0x20\n\
    ldr r3, [sp, 0x1C]\n\
    bl sub_8042BE8\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080427D6\n\
    movs r1, 0\n\
    str r1, [sp, 0x10]\n\
_080427D6:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080427F6\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x4]\n\
    movs r2, 0x40\n\
    ldr r3, [sp, 0x1C]\n\
    bl sub_8042BE8\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080427F6\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
_080427F6:\n\
    ldrb r1, [r5]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08042802\n\
    b _08042BCA\n\
_08042802:\n\
    ldr r0, _08042844 @ =gMain\n\
    ldr r1, _08042848 @ =0x00000439\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08042814\n\
    b _08042BCA\n\
_08042814:\n\
    ldr r2, [sp, 0x1C]\n\
    cmp r2, 0x4\n\
    bne _0804281C\n\
    b _08042BCA\n\
_0804281C:\n\
    ldr r1, _0804284C @ =gBattleMons\n\
    movs r0, 0x58\n\
    muls r0, r2\n\
    adds r1, 0x50\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    movs r1, 0x7\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08042832\n\
    b _08042BCA\n\
_08042832:\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
    b _08042BCA\n\
    .align 2, 0\n\
_08042838: .4byte gSideTimers\n\
_0804283C: .4byte gActiveBattler\n\
_08042840: .4byte 0x00000f88\n\
_08042844: .4byte gMain\n\
_08042848: .4byte 0x00000439\n\
_0804284C: .4byte gBattleMons\n\
_08042850:\n\
    ldr r1, [sp, 0x14]\n\
    ldr r2, [sp, 0xC]\n\
    adds r0, r1, r2\n\
    ldrb r7, [r0]\n\
    movs r0, 0x20\n\
    ands r0, r7\n\
    cmp r0, 0\n\
    beq _080428B6\n\
    movs r0, 0xDF\n\
    ands r7, r0\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r5, r0, 0\n\
    ldr r0, _080428DC @ =gUnknown_825DEA1\n\
    ldr r1, [sp, 0x8]\n\
    adds r0, r1, r0\n\
    ldrb r0, [r0]\n\
    ands r5, r0\n\
    lsls r0, r1, 1\n\
    lsrs r5, r0\n\
    adds r1, 0xD\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r4, r0, 0\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r1, r0, 0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r0, r4, 0\n\
    ldr r2, [sp, 0x8]\n\
    bl CalculatePPWithBonus\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r5, 0x2\n\
    bhi _080428B6\n\
    cmp r0, 0x4\n\
    bls _080428B6\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
_080428B6:\n\
    movs r0, 0\n\
    mov r9, r0\n\
    cmp r7, 0\n\
    bne _080428C0\n\
    b _08042BCA\n\
_080428C0:\n\
    movs r0, 0x1\n\
    ands r0, r7\n\
    cmp r0, 0\n\
    bne _080428CA\n\
    b _08042A5C\n\
_080428CA:\n\
    mov r1, r9\n\
    cmp r1, 0x7\n\
    bls _080428D2\n\
    b _08042A5C\n\
_080428D2:\n\
    lsls r0, r1, 2\n\
    ldr r1, _080428E0 @ =_080428E4\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080428DC: .4byte gUnknown_825DEA1\n\
_080428E0: .4byte _080428E4\n\
    .align 2, 0\n\
_080428E4:\n\
    .4byte _08042904\n\
    .4byte _08042904\n\
    .4byte _08042934\n\
    .4byte _08042996\n\
    .4byte _08042A5C\n\
    .4byte _08042A5C\n\
    .4byte _08042A5C\n\
    .4byte _08042A4A\n\
_08042904:\n\
    mov r0, r8\n\
    bl GetMonEVCount\n\
    lsls r0, 16\n\
    ldr r1, _0804292C @ =0x01fd0000\n\
    cmp r0, r1\n\
    bls _08042914\n\
    b _08042578\n\
_08042914:\n\
    ldr r0, _08042930 @ =sGetMonDataEVConstants\n\
    add r0, r9\n\
    ldrb r1, [r0]\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r5, r0, 0\n\
    cmp r5, 0x63\n\
    bls _0804292A\n\
    b _08042A5C\n\
_0804292A:\n\
    b _08042A3A\n\
    .align 2, 0\n\
_0804292C: .4byte 0x01fd0000\n\
_08042930: .4byte sGetMonDataEVConstants\n\
_08042934:\n\
    movs r0, 0x10\n\
    ands r0, r7\n\
    cmp r0, 0\n\
    beq _08042952\n\
    mov r0, r8\n\
    movs r1, 0x39\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r0, 0\n\
    beq _08042968\n\
    mov r0, r10\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    b _080429F4\n\
_08042952:\n\
    mov r0, r8\n\
    movs r1, 0x39\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r0, 0\n\
    bne _08042968\n\
    mov r0, r10\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    b _080429F4\n\
_08042968:\n\
    mov r0, r8\n\
    movs r1, 0x3A\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r4, r0, 0\n\
    mov r0, r8\n\
    movs r1, 0x39\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r4, r0\n\
    beq _08042986\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
_08042986:\n\
    mov r0, r10\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    movs r0, 0xEF\n\
    ands r7, r0\n\
    b _08042A5C\n\
_08042996:\n\
    movs r0, 0x2\n\
    ands r0, r7\n\
    cmp r0, 0\n\
    bne _080429FA\n\
    movs r6, 0\n\
    movs r1, 0x1\n\
    add r10, r1\n\
_080429A4:\n\
    adds r1, r6, 0\n\
    adds r1, 0x11\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r5, r0, 0\n\
    adds r1, r6, 0\n\
    adds r1, 0xD\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r4, r0, 0\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r1, r0, 0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    lsls r2, r6, 24\n\
    lsrs r2, 24\n\
    adds r0, r4, 0\n\
    bl CalculatePPWithBonus\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r5, r0\n\
    beq _080429EA\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
_080429EA:\n\
    adds r6, 0x1\n\
    cmp r6, 0x3\n\
    ble _080429A4\n\
    mov r1, r10\n\
    lsls r0, r1, 24\n\
_080429F4:\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    b _08042A5C\n\
_080429FA:\n\
    ldr r1, [sp, 0x8]\n\
    adds r1, 0x11\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r5, r0, 0\n\
    ldr r1, [sp, 0x8]\n\
    adds r1, 0xD\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r4, r0, 0\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r1, r0, 0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r0, r4, 0\n\
    ldr r2, [sp, 0x8]\n\
    bl CalculatePPWithBonus\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r5, r0\n\
    beq _08042A5C\n\
_08042A3A:\n\
    mov r0, r10\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
    b _08042A5C\n\
_08042A4A:\n\
    mov r0, r8\n\
    movs r1, 0x2\n\
    ldr r2, [sp]\n\
    bl GetEvolutionTargetSpecies\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    beq _08042A5C\n\
    b _08042574\n\
_08042A5C:\n\
    movs r0, 0x1\n\
    add r9, r0\n\
    lsrs r7, 1\n\
    cmp r7, 0\n\
    beq _08042A68\n\
    b _080428C0\n\
_08042A68:\n\
    b _08042BCA\n\
_08042A6A:\n\
    ldr r1, [sp, 0x14]\n\
    ldr r2, [sp, 0xC]\n\
    adds r0, r1, r2\n\
    ldrb r7, [r0]\n\
    movs r0, 0\n\
    mov r9, r0\n\
    cmp r7, 0\n\
    bne _08042A7C\n\
    b _08042BCA\n\
_08042A7C:\n\
    movs r0, 0x1\n\
    ands r0, r7\n\
    cmp r0, 0\n\
    bne _08042A86\n\
    b _08042BBE\n\
_08042A86:\n\
    mov r1, r9\n\
    cmp r1, 0x7\n\
    bls _08042A8E\n\
    b _08042BBE\n\
_08042A8E:\n\
    lsls r0, r1, 2\n\
    ldr r1, _08042A98 @ =_08042A9C\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_08042A98: .4byte _08042A9C\n\
    .align 2, 0\n\
_08042A9C:\n\
    .4byte _08042ABC\n\
    .4byte _08042ABC\n\
    .4byte _08042ABC\n\
    .4byte _08042ABC\n\
    .4byte _08042AF4\n\
    .4byte _08042B4C\n\
    .4byte _08042B68\n\
    .4byte _08042B92\n\
_08042ABC:\n\
    mov r0, r8\n\
    bl GetMonEVCount\n\
    lsls r0, 16\n\
    ldr r1, _08042AEC @ =0x01fd0000\n\
    cmp r0, r1\n\
    bls _08042ACC\n\
    b _08042578\n\
_08042ACC:\n\
    ldr r0, _08042AF0 @ =sGetMonDataEVConstants\n\
    mov r1, r9\n\
    adds r1, 0x2\n\
    adds r1, r0\n\
    ldrb r1, [r1]\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r5, r0, 0\n\
    cmp r5, 0x63\n\
    bhi _08042BBE\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
    b _08042BB4\n\
    .align 2, 0\n\
_08042AEC: .4byte 0x01fd0000\n\
_08042AF0: .4byte sGetMonDataEVConstants\n\
_08042AF4:\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r5, r0, 0\n\
    ldr r0, _08042B48 @ =gUnknown_825DEA1\n\
    ldr r1, [sp, 0x8]\n\
    adds r0, r1, r0\n\
    ldrb r0, [r0]\n\
    ands r5, r0\n\
    lsls r0, r1, 1\n\
    lsrs r5, r0\n\
    adds r1, 0xD\n\
    mov r0, r8\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r4, r0, 0\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    movs r2, 0\n\
    bl GetMonData\n\
    adds r1, r0, 0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r0, r4, 0\n\
    ldr r2, [sp, 0x8]\n\
    bl CalculatePPWithBonus\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    cmp r5, 0x2\n\
    bhi _08042BBE\n\
    cmp r6, 0x4\n\
    ble _08042BBE\n\
    movs r2, 0\n\
    str r2, [sp, 0x10]\n\
    b _08042BBE\n\
    .align 2, 0\n\
_08042B48: .4byte gUnknown_825DEA1\n\
_08042B4C:\n\
    mov r0, r8\n\
    movs r1, 0x20\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r0, 0x63\n\
    bhi _08042BB4\n\
    ldr r0, [sp, 0x10]\n\
    cmp r0, 0\n\
    bne _08042BB4\n\
    ldr r1, [sp, 0x18]\n\
    cmp r1, 0\n\
    bne _08042BB4\n\
    b _08042BAC\n\
_08042B68:\n\
    mov r0, r8\n\
    movs r1, 0x20\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r0, 0x63\n\
    bls _08042BB4\n\
    mov r0, r8\n\
    movs r1, 0x20\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r0, 0xC7\n\
    bhi _08042BB4\n\
    ldr r2, [sp, 0x10]\n\
    cmp r2, 0\n\
    bne _08042BB4\n\
    ldr r0, [sp, 0x18]\n\
    cmp r0, 0\n\
    bne _08042BB4\n\
    b _08042BAC\n\
_08042B92:\n\
    mov r0, r8\n\
    movs r1, 0x20\n\
    movs r2, 0\n\
    bl GetMonData\n\
    cmp r0, 0xC7\n\
    bls _08042BB4\n\
    ldr r1, [sp, 0x10]\n\
    cmp r1, 0\n\
    bne _08042BB4\n\
    ldr r2, [sp, 0x18]\n\
    cmp r2, 0\n\
    bne _08042BB4\n\
_08042BAC:\n\
    ldr r0, [sp, 0x14]\n\
    add r0, r10\n\
    ldrb r0, [r0]\n\
    str r0, [sp, 0x18]\n\
_08042BB4:\n\
    mov r0, r10\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
_08042BBE:\n\
    movs r0, 0x1\n\
    add r9, r0\n\
    lsrs r7, 1\n\
    cmp r7, 0\n\
    beq _08042BCA\n\
    b _08042A7C\n\
_08042BCA:\n\
    ldr r1, [sp, 0xC]\n\
    adds r1, 0x1\n\
    str r1, [sp, 0xC]\n\
    cmp r1, 0x5\n\
    bgt _08042BD6\n\
    b _08042582\n\
_08042BD6:\n\
    ldr r0, [sp, 0x10]\n\
_08042BD8:\n\
    add sp, 0x20\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif

bool8 sub_8042BE8(struct Pokemon *mon, u32 unused, u32 healMask, u8 battleId)
{
    if((GetMonData(mon, MON_DATA_STATUS, NULL) & healMask) != 0)
        return TRUE;
    else
        return FALSE;
}

u8 GetItemEffectParamOffset(u16 itemId, u8 effectByte, u8 effectBit)
{
    const u8 *temp;
    const u8 *itemEffect;
    u8 offset;
    int i;
    u8 j;
    u8 val;

    offset = 6;

    temp = gItemEffectTable[itemId - 13];

    if (!temp && itemId != ITEM_ENIGMA_BERRY)
        return 0;

    if (itemId == ITEM_ENIGMA_BERRY)
    {
        temp = gEnigmaBerries[gActiveBattler].itemEffect;
    }

    itemEffect = temp;

    for (i = 0; i < 6; i++)
    {
        switch (i)
        {
        case 0:
        case 1:
        case 2:
        case 3:
            if (i == effectByte)
                return 0;
            break;
        case 4:
            val = itemEffect[4];
            if (val & 0x20)
                val &= 0xDF;
            j = 0;
            while (val)
            {
                if (val & 1)
                {
                    switch (j)
                    {
                    case 2:
                        if (val & 0x10)
                            val &= 0xEF;
                    case 0:
                        if (i == effectByte && (val & effectBit))
                            return offset;
                        offset++;
                        break;
                    case 1:
                        if (i == effectByte && (val & effectBit))
                            return offset;
                        offset++;
                        break;
                    case 3:
                        if (i == effectByte && (val & effectBit))
                            return offset;
                        offset++;
                        break;
                    case 7:
                        if (i == effectByte)
                            return 0;
                        break;
                    }
                }
                j++;
                val >>= 1;
                if (i == effectByte)
                    effectBit >>= 1;
            }
            break;
        case 5:
            val = itemEffect[5];
            j = 0;
            while (val)
            {
                if (val & 1)
                {
                    switch (j)
                    {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                        if (i == effectByte && (val & effectBit))
                            return offset;
                        offset++;
                        break;
                    case 7:
                        if (i == effectByte)
                            return 0;
                        break;
                    }
                }
                j++;
                val >>= 1;
                if (i == effectByte)
                    effectBit >>= 1;
            }
            break;
        }
    }

    return offset;
}

void sub_8042D50(int stat)
{
    gBattlerTarget = gBattlerInMenuId;
    StringCopy(gBattleTextBuff1, gUnknown_83FD5D0[gUnknown_825DFF0[stat]]);
    StringCopy(gBattleTextBuff2, BattleText_Rose);
    BattleStringExpandPlaceholdersToDisplayedString(BattleText_UnknownString3);
}

const u8 *sub_8042DA4(u16 itemId)
{
    int i;
    const u8 *itemEffect;

    if (itemId == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
        {
            itemEffect = gEnigmaBerries[gBattlerInMenuId].itemEffect;
        }
        else
        {
            itemEffect = gSaveBlock1Ptr->enigmaBerry.itemEffect;
        }
    }
    else
    {
        itemEffect = gItemEffectTable[itemId - 13];
    }

    gPotentialItemEffectBattler = gBattlerInMenuId;

    for (i = 0; i < 3; i++)
    {
        if (itemEffect[i] & 0xF)
            sub_8042D50(i * 2);
        if (itemEffect[i] & 0xF0)
        {
            if (i)
            {
                sub_8042D50(i * 2 + 1);
            }
            else
            {
                sBattler_AI = gBattlerInMenuId;
                BattleStringExpandPlaceholdersToDisplayedString(BattleText_GetPumped);
            }
        }
    }

    if (itemEffect[3] & 0x80)
    {
        sBattler_AI = gBattlerInMenuId;
        BattleStringExpandPlaceholdersToDisplayedString(BattleText_MistShroud);
    }

    return gDisplayedStringBattle;
}

u8 GetNature(struct Pokemon *mon)
{
    return GetMonData(mon, MON_DATA_PERSONALITY, 0) % 25;
}

u8 GetNatureFromPersonality(u32 personality)
{
    return personality % 25;
}

extern bool32 sub_806E25C(void);

u16 GetEvolutionTargetSpecies(struct Pokemon *mon, u8 type, u16 evolutionItem)
{
    int i;
    u16 targetSpecies = 0;
    u16 species = GetMonData(mon, MON_DATA_SPECIES, 0);
    u16 heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
    u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, 0);
    u8 level;
    u16 friendship;
    u8 beauty = GetMonData(mon, MON_DATA_BEAUTY, 0);
    u16 upperPersonality = personality >> 16;
    u8 holdEffect;

    if (heldItem == ITEM_ENIGMA_BERRY)
        holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(heldItem);

    if (holdEffect == HOLD_EFFECT_PREVENT_EVOLVE && type != 3)
        return 0;

    switch (type)
    {
    case 0:
        level = GetMonData(mon, MON_DATA_LEVEL, 0);
        friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, 0);

        for (i = 0; i < 5; i++)
        {
            switch (gEvolutionTable[species][i].method)
            {
            case EVO_FRIENDSHIP:
                if (friendship >= 220)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            // FR/LG removed the time of day evolutions due to having no RTC.
            case EVO_FRIENDSHIP_DAY:
                /*
                RtcCalcLocalTime();
                if (gLocalTime.hours >= 12 && gLocalTime.hours < 24 && friendship >= 220)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                */
                break;
            case EVO_FRIENDSHIP_NIGHT:
                /*
                RtcCalcLocalTime();
                if (gLocalTime.hours >= 0 && gLocalTime.hours < 12 && friendship >= 220)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                */
                break;
            case EVO_LEVEL:
                if (gEvolutionTable[species][i].param <= level)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_LEVEL_ATK_GT_DEF:
                if (gEvolutionTable[species][i].param <= level)
                    if (GetMonData(mon, MON_DATA_ATK, 0) > GetMonData(mon, MON_DATA_DEF, 0))
                        targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_LEVEL_ATK_EQ_DEF:
                if (gEvolutionTable[species][i].param <= level)
                    if (GetMonData(mon, MON_DATA_ATK, 0) == GetMonData(mon, MON_DATA_DEF, 0))
                        targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_LEVEL_ATK_LT_DEF:
                if (gEvolutionTable[species][i].param <= level)
                    if (GetMonData(mon, MON_DATA_ATK, 0) < GetMonData(mon, MON_DATA_DEF, 0))
                        targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_LEVEL_SILCOON:
                if (gEvolutionTable[species][i].param <= level && (upperPersonality % 10) <= 4)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_LEVEL_CASCOON:
                if (gEvolutionTable[species][i].param <= level && (upperPersonality % 10) > 4)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_LEVEL_NINJASK:
                if (gEvolutionTable[species][i].param <= level)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_BEAUTY:
                if (gEvolutionTable[species][i].param <= beauty)
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            }
        }
        break;
    case 1:
        for (i = 0; i < 5; i++)
        {
            switch (gEvolutionTable[species][i].method)
            {
            case EVO_TRADE:
                targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            case EVO_TRADE_ITEM:
                if (gEvolutionTable[species][i].param == heldItem)
                {
                    targetSpecies = gEvolutionTable[species][i].targetSpecies;
                    if (sub_806E25C() || targetSpecies <= 151)
                    {
                        heldItem = 0;
                        SetMonData(mon, MON_DATA_HELD_ITEM, &heldItem);
                        targetSpecies = gEvolutionTable[species][i].targetSpecies;
                    }
                }
                break;
            }
        }
        break;
    case 2:
    case 3:
        for (i = 0; i < 5; i++)
        {
            if (gEvolutionTable[species][i].method == EVO_ITEM
             && gEvolutionTable[species][i].param == evolutionItem)
            {
                targetSpecies = gEvolutionTable[species][i].targetSpecies;
                break;
            }
        }
        break;
    }

    return targetSpecies;
}

// HoennPokedexNumToSpecies, but is it really Hoenn or Kanto its checking
// TODO: Figure this out
u16 sub_80431B4(u16 var)
{
    u16 species;

    if(!var)
        return 0;

    species = 0;

    while(species < POKEMON_SLOTS_NUMBER - 1 && gUnknown_8251CB8[species] != var)
        species++;

    if(species == POKEMON_SLOTS_NUMBER - 1)
        return 0;

    return species + 1;
}

u16 NationalPokedexNumToSpecies(u16 nationalNum)
{
    u16 species;

    if (!nationalNum)
        return 0;

    species = 0;

    while (species < POKEMON_SLOTS_NUMBER - 1 && gUnknown_8251FEE[species] != nationalNum)
        species++;

    if (species == POKEMON_SLOTS_NUMBER - 1)
        return 0;

    return species + 1;
}

// NationalToKantoOrder?
u16 sub_804324C(u16 nationalNum)
{
    u16 hoennNum;

    if (!nationalNum)
        return 0;

    hoennNum = 0;

    while (hoennNum < POKEMON_SLOTS_NUMBER - 1 && gUnknown_8252324[hoennNum] != nationalNum)
        hoennNum++;

    if (hoennNum == POKEMON_SLOTS_NUMBER - 1)
        return 0;

    return hoennNum + 1;
}

u16 SpeciesToNationalPokedexNum(u16 species)
{
    if (!species)
        return 0;

    return gUnknown_8251FEE[species - 1];
}

// these 2 functions are probably kanto and not hoenn
// TODO: figure this out
u16 SpeciesToHoennPokedexNum(u16 species)
{
    if (!species)
        return 0;

    return gUnknown_8251CB8[species - 1];
}

u16 HoennToNationalOrder(u16 hoennNum)
{
    if (!hoennNum)
        return 0;

    return gUnknown_8252324[hoennNum - 1];
}

u16 SpeciesToCryId(u16 species)
{
    if (species < SPECIES_OLD_UNOWN_B - 1)
        return species;

    if (species <= SPECIES_OLD_UNOWN_Z - 1)
        return SPECIES_UNOWN - 1;

    return gUnknown_82539D4[species - ((SPECIES_OLD_UNOWN_Z + 1) - 1)];
}

void sub_8043338(u16 species, u32 personality, u8 *dest)
{
    if (species == SPECIES_SPINDA
        && dest != gMonSpritesGfxPtr->sprites[0]
        && dest != gMonSpritesGfxPtr->sprites[2])
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            int j;
            u8 x = gSpindaSpotGraphics[i].x + ((personality & 0x0F) - 8);
            u8 y = gSpindaSpotGraphics[i].y + (((personality & 0xF0) >> 4) - 8);

            for (j = 0; j < 16; j++)
            {
                int k;
                s32 row = gSpindaSpotGraphics[i].image[j];

                for (k = x; k < x + 16; k++)
                {
                    u8 *val = dest + ((k / 8) * 32) + ((k % 8) / 2) + ((y >> 3) << 8) + ((y & 7) << 2);

                    if (row & 1)
                    {
                        if (k & 1)
                        {
                            if ((u8)((*val & 0xF0) - 0x10) <= 0x20)
                                *val += 0x40;
                        }
                        else
                        {
                            if ((u8)((*val & 0xF) - 0x01) <= 0x02)
                                *val += 0x04;
                        }
                    }

                    row >>= 1;
                }

                y++;
            }

            personality >>= 8;
        }
    }
}

void DrawSpindaSpots(u16 species, u32 personality, u8 *dest, u8 a4)
{
    if (species == SPECIES_SPINDA && a4)
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            int j;
            u8 x = gSpindaSpotGraphics[i].x + ((personality & 0x0F) - 8);
            u8 y = gSpindaSpotGraphics[i].y + (((personality & 0xF0) >> 4) - 8);

            for (j = 0; j < 16; j++)
            {
                int k;
                s32 row = gSpindaSpotGraphics[i].image[j];

                for (k = x; k < x + 16; k++)
                {
                    u8 *val = dest + ((k / 8) * 32) + ((k % 8) / 2) + ((y >> 3) << 8) + ((y & 7) << 2);

                    if (row & 1)
                    {
                        if (k & 1)
                        {
                            if ((u8)((*val & 0xF0) - 0x10) <= 0x20)
                                *val += 0x40;
                        }
                        else
                        {
                            if ((u8)((*val & 0xF) - 0x01) <= 0x02)
                                *val += 0x04;
                        }
                    }

                    row >>= 1;
                }

                y++;
            }

            personality >>= 8;
        }
    }
}

void EvolutionRenameMon(struct Pokemon *mon, u16 oldSpecies, u16 newSpecies)
{
    u8 language;
    GetMonData(mon, MON_DATA_NICKNAME, gStringVar1);
    language = GetMonData(mon, MON_DATA_LANGUAGE, &language);
    if (language == GAME_LANGUAGE && !StringCompare(gSpeciesNames[oldSpecies], gStringVar1))
        SetMonData(mon, MON_DATA_NICKNAME, gSpeciesNames[newSpecies]);
}

bool8 sub_80435E0(void)
{
    bool8 retVal = FALSE;
    switch (gLinkPlayers[GetMultiplayerId()].id)
    {
    case 0:
    case 3:
        retVal = FALSE;
        break;
    case 1:
    case 2:
        retVal = TRUE;
        break;
    }
    return retVal;
}

bool8 sub_8043620(u8 id)
{
    bool8 retVal = FALSE;
    switch (gLinkPlayers[id].id)
    {
    case 0:
    case 3:
        retVal = FALSE;
        break;
    case 1:
    case 2:
        retVal = TRUE;
        break;
    }
    return retVal;
}

s32 GetBankMultiplayerId(u16 a1)
{
    s32 id;
    for (id = 0; id < MAX_LINK_PLAYERS; id++)
        if (gLinkPlayers[id].id == a1)
            break;
    return id;
}

u8 sub_804367C(u16 trainer)
{
    return gTrainers[trainer].encounterMusic_gender & 0x7F;
}

u16 nature_stat_mod(u8 nature, u16 n, u8 statIndex)
{
    if (statIndex < 1 || statIndex > 5)
    {
        // should just be "return n", but it wouldn't match without this
        u16 retVal = n;
        retVal++;
        retVal--;
        return retVal;
    }

    switch (gNatureStatTable[nature][statIndex - 1])
    {
    case 1:
        return (u16)(n * 110) / 100;
    case -1:
        return (u16)(n * 90) / 100;
    }

    return n;
}

// TODO: Move these to constants/trainers.h
#define TRAINER_CLASS_ELITE_FOUR     0x54
#define TRAINER_CLASS_LEADER         0x57
#define TRAINER_CLASS_CHAMPION       0x5A

// TODO: Move these too
#define FRIENDSHIP_EVENT_LEAGUE_BATTLE 0x3
#define FRIENDSHIP_EVENT_WALKING       0x5

void AdjustFriendship(struct Pokemon *mon, u8 event)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES2, 0);
    u16 heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
    u8 holdEffect;

    if (heldItem == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
            holdEffect = gEnigmaBerries[0].holdEffect;
        else
            holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
    }
    else
    {
        holdEffect = ItemId_GetHoldEffect(heldItem);
    }

    if (species && species != SPECIES_EGG)
    {
        u8 friendshipLevel = 0;
        s16 friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, 0);
        if (friendship > 99)
            friendshipLevel++;
        if (friendship > 199)
            friendshipLevel++;

        if ((event != FRIENDSHIP_EVENT_WALKING || !(Random() & 1))
         && (event != FRIENDSHIP_EVENT_LEAGUE_BATTLE
          || ((gBattleTypeFlags & BATTLE_TYPE_TRAINER)
           && (gTrainers[gTrainerBattleOpponent_A].trainerClass == TRAINER_CLASS_ELITE_FOUR
            || gTrainers[gTrainerBattleOpponent_A].trainerClass == TRAINER_CLASS_LEADER
            || gTrainers[gTrainerBattleOpponent_A].trainerClass == TRAINER_CLASS_CHAMPION))))
        {
            s8 delta = sFriendshipEventDeltas[event][friendshipLevel];
            if (delta > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                delta = (150 * delta) / 100;

            friendship += delta;
            if (delta > 0)
            {
                if (GetMonData(mon, MON_DATA_POKEBALL, 0) == ITEM_LUXURY_BALL)
                    friendship++;
                if (GetMonData(mon, MON_DATA_MET_LOCATION, 0) == GetCurrentRegionMapSectionId())
                    friendship++;
            }

            if (friendship < 0)
                friendship = 0;
            if (friendship > 255)
                friendship = 255;

            SetMonData(mon, MON_DATA_FRIENDSHIP, &friendship);
        }
    }
}

void MonGainEVs(struct Pokemon *mon, u16 defeatedSpecies)
{
    u8 evs[NUM_STATS];
    u16 evIncrease = 0;
    u16 totalEVs = 0;
    u16 heldItem;
    u8 holdEffect;
    int i;

    for (i = 0; i < NUM_STATS; i++)
    {
        evs[i] = GetMonData(mon, MON_DATA_HP_EV + i, 0);
        totalEVs += evs[i];
    }

    for (i = 0; i < NUM_STATS; i++)
    {
        u8 hasHadPokerus;
        int multiplier;

        if (totalEVs >= MAX_TOTAL_EVS)
            break;

        hasHadPokerus = CheckPartyHasHadPokerus(mon, 0);

        if (hasHadPokerus)
            multiplier = 2;
        else
            multiplier = 1;

        switch (i)
        {
        case 0:
            evIncrease = gBaseStats[defeatedSpecies].evYield_HP * multiplier;
            break;
        case 1:
            evIncrease = gBaseStats[defeatedSpecies].evYield_Attack * multiplier;
            break;
        case 2:
            evIncrease = gBaseStats[defeatedSpecies].evYield_Defense * multiplier;
            break;
        case 3:
            evIncrease = gBaseStats[defeatedSpecies].evYield_Speed * multiplier;
            break;
        case 4:
            evIncrease = gBaseStats[defeatedSpecies].evYield_SpAttack * multiplier;
            break;
        case 5:
            evIncrease = gBaseStats[defeatedSpecies].evYield_SpDefense * multiplier;
            break;
        }

        heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, 0);

        if (heldItem == ITEM_ENIGMA_BERRY)
        {
            if (gMain.inBattle)
                holdEffect = gEnigmaBerries[0].holdEffect;
            else
                holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
        }
        else
        {
            holdEffect = ItemId_GetHoldEffect(heldItem);
        }

        if (holdEffect == HOLD_EFFECT_MACHO_BRACE)
            evIncrease *= 2;

        if (totalEVs + (s16)evIncrease > MAX_TOTAL_EVS)
            evIncrease = ((s16)evIncrease + MAX_TOTAL_EVS) - (totalEVs + evIncrease);

        if (evs[i] + (s16)evIncrease > 255)
        {
            int val1 = (s16)evIncrease + 255;
            int val2 = evs[i] + evIncrease;
            evIncrease = val1 - val2;
        }

        evs[i] += evIncrease;
        totalEVs += evIncrease;
        SetMonData(mon, MON_DATA_HP_EV + i, &evs[i]);
    }
}

u16 GetMonEVCount(struct Pokemon *mon)
{
    int i;
    u16 count = 0;

    for (i = 0; i < NUM_STATS; i++)
        count += GetMonData(mon, MON_DATA_HP_EV + i, 0);

    return count;
}

void sub_8043A68(void)
{
    u8 foo[4]; // huh?
}

u8 CheckPartyPokerus(struct Pokemon *party, u8 selection)
{
    u8 retVal;

    int partyIndex = 0;
    unsigned curBit = 1;
    retVal = 0;

    if (selection)
    {
        do
        {
            if ((selection & 1) && (GetMonData(&party[partyIndex], MON_DATA_POKERUS, 0) & 0xF))
                retVal |= curBit;
            partyIndex++;
            curBit <<= 1;
            selection >>= 1;
        }
        while (selection);
    }
    else if (GetMonData(&party[0], MON_DATA_POKERUS, 0) & 0xF)
    {
        retVal = 1;
    }

    return retVal;
}

u8 CheckPartyHasHadPokerus(struct Pokemon *party, u8 selection)
{
    u8 retVal;

    int partyIndex = 0;
    unsigned curBit = 1;
    retVal = 0;

    if (selection)
    {
        do
        {
            if ((selection & 1) && GetMonData(&party[partyIndex], MON_DATA_POKERUS, 0))
                retVal |= curBit;
            partyIndex++;
            curBit <<= 1;
            selection >>= 1;
        }
        while (selection);
    }
    else if (GetMonData(&party[0], MON_DATA_POKERUS, 0))
    {
        retVal = 1;
    }

    return retVal;
}

void sub_8043B38(void)
{
    u8 foo[4]; // huh?
}

void sub_8043B40(void)
{
    u8 foo[4]; // huh?
}

void sub_8043B48(struct Pokemon *mon, int species, u8 unused, u32 data)
{
    if (data > gExperienceTables[gBaseStats[species].growthRate][100])
    {
        data = gExperienceTables[gBaseStats[species].growthRate][100];
        SetMonData(mon, MON_DATA_EXP, &data);
    }
}

bool8 TryIncrementMonLevel(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    u8 newLevel = level + 1;
    u32 exp = GetMonData(mon, MON_DATA_EXP, NULL);

    if(level < 100)
    {
        if(exp > gExperienceTables[gBaseStats[species].growthRate][newLevel])
        {
            SetMonData(mon, MON_DATA_LEVEL, &newLevel);
            sub_8043B48(mon, species, newLevel, exp);
            return TRUE;
        }
        else
            return FALSE;
    }
    else
    {
        sub_8043B48(mon, species, level, exp);
        return FALSE;
    }
}

u32 CanMonLearnTMHM(struct Pokemon *mon, u8 tm)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES2, 0);
    if (species == SPECIES_EGG)
    {
        return 0;
    }
    else if (tm < 32)
    {
        u32 mask = 1 << tm;
        return gTMHMLearnsets[species][0] & mask;
    }
    else
    {
        u32 mask = 1 << (tm - 32);
        return gTMHMLearnsets[species][1] & mask;
    }
}

u8 GetMoveRelearnerMoves(struct Pokemon *mon, u16 *moves)
{
    u16 learnedMoves[4];
    u8 numMoves = 0;
    u16 species = GetMonData(mon, MON_DATA_SPECIES, 0);
    u8 level = GetMonData(mon, MON_DATA_LEVEL, 0);
    int i, j, k;

    for (i = 0; i < 4; i++)
        learnedMoves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, 0);

    for (i = 0; i < 20; i++)
    {
        u16 moveLevel;

        if (gLevelUpLearnsets[species][i] == 0xFFFF)
            break;

        moveLevel = gLevelUpLearnsets[species][i] & 0xFE00;

        if (moveLevel <= (level << 9))
        {
            for (j = 0; j < 4 && learnedMoves[j] != (gLevelUpLearnsets[species][i] & 0x1FF); j++)
                ;

            if (j == 4)
            {
                for (k = 0; k < numMoves && moves[k] != (gLevelUpLearnsets[species][i] & 0x1FF); k++)
                    ;

                if (k == numMoves)
                    moves[numMoves++] = gLevelUpLearnsets[species][i] & 0x1FF;
            }
        }
    }

    return numMoves;
}

u8 GetLevelUpMovesBySpecies(u16 species, u16 *moves)
{
    u8 numMoves = 0;
    int i;

    for (i = 0; i < 20 && gLevelUpLearnsets[species][i] != 0xFFFF; i++)
         moves[numMoves++] = gLevelUpLearnsets[species][i] & 0x1FF;

     return numMoves;
}

u8 GetNumberOfRelearnableMoves(struct Pokemon *mon)
{
    u16 learnedMoves[4];
    u16 moves[20];
    u8 numMoves = 0;
    u16 species = GetMonData(mon, MON_DATA_SPECIES2, 0);
    u8 level = GetMonData(mon, MON_DATA_LEVEL, 0);
    int i, j, k;

    if (species == SPECIES_EGG)
        return 0;

    for (i = 0; i < 4; i++)
        learnedMoves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, 0);

    for (i = 0; i < 20; i++)
    {
        u16 moveLevel;

        if (gLevelUpLearnsets[species][i] == 0xFFFF)
            break;

        moveLevel = gLevelUpLearnsets[species][i] & 0xFE00;

        if (moveLevel <= (level << 9))
        {
            for (j = 0; j < 4 && learnedMoves[j] != (gLevelUpLearnsets[species][i] & 0x1FF); j++)
                ;

            if (j == 4)
            {
                for (k = 0; k < numMoves && moves[k] != (gLevelUpLearnsets[species][i] & 0x1FF); k++)
                    ;

                if (k == numMoves)
                    moves[numMoves++] = gLevelUpLearnsets[species][i] & 0x1FF;
            }
        }
    }

    return numMoves;
}

// SpeciesToPokedexNum?
u16 sub_8043F90(u16 species)
{
    species = SpeciesToNationalPokedexNum(species);

    if (!sub_806E25C() && species > 151)
        return 0xFFFF;
    return species;
}

void ClearBattleMonForms(void)
{
    int i;
    for(i = 0; i < 4; i++)
        gBattleMonForms[i] = 0;
}

u16 GetMUS_ForBattle(void)
{
    if(gBattleTypeFlags & 0x1000)
        return 0x12A;
    if(gBattleTypeFlags & 0x4000)
        return 0x10A;
    if(gBattleTypeFlags & 0x2)
        return 0x10A;
    if(gBattleTypeFlags & 0x8)
    {
        switch (gTrainers[gTrainerBattleOpponent_A].trainerClass)
        {
            case 0x5A:
                return 0x12B;
            case 0x54:
            case 0x57:
                return 0x128;
            case 0x53:
            case 0x55:
            case 0x56:
            case 0x58:
            case 0x59:
            default:
                return 0x129;
        }
    }
    return 0x12A;
}

void PlayBattleBGM(void)
{
    ResetMapMusic();
    m4aMPlayAllStop();
    PlayBGM(GetMUS_ForBattle());
}

void PlayMapChosenOrBattleBGM(u16 songId)
{
    ResetMapMusic();
    m4aMPlayAllStop();
    if (songId)
        PlayNewMapMusic(songId);
    else
        PlayNewMapMusic(GetMUS_ForBattle());
}

const u8 *GetMonFrontSpritePal(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES2, 0);
    u32 otId = GetMonData(mon, MON_DATA_OT_ID, 0);
    u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, 0);
    return GetFrontSpritePalFromSpeciesAndPersonality(species, otId, personality);
}

const u8 *GetFrontSpritePalFromSpeciesAndPersonality(u16 species, u32 otId, u32 personality)
{
    u32 shinyValue;

    if (species > SPECIES_EGG)
        return gMonPaletteTable[0].data;

    shinyValue = HIHALF(otId) ^ LOHALF(otId) ^ HIHALF(personality) ^ LOHALF(personality);
    if (shinyValue < 8)
        return gMonShinyPaletteTable[species].data;
    else
        return gMonPaletteTable[species].data;
}

const struct CompressedSpritePalette *GetMonSpritePalStruct(struct Pokemon *mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES2, 0);
    u32 otId = GetMonData(mon, MON_DATA_OT_ID, 0);
    u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, 0);
    return GetMonSpritePalStructFromOtIdPersonality(species, otId, personality);
}

const struct CompressedSpritePalette *GetMonSpritePalStructFromOtIdPersonality(u16 species, u32 otId , u32 personality)
{
    u32 shinyValue;

    shinyValue = HIHALF(otId) ^ LOHALF(otId) ^ HIHALF(personality) ^ LOHALF(personality);
    if (shinyValue < 8)
        return &gMonShinyPaletteTable[species];
    else
        return &gMonPaletteTable[species];
}

bool32 IsHMMove2(u16 move)
{
    int i = 0;
    while (sHMMoves[i] != 0xFFFF)
    {
        if (sHMMoves[i++] == move)
            return TRUE;
    }
    return FALSE;
}

bool8 IsPokeSpriteNotFlipped(u16 species)
{
    return gBaseStats[species].noFlip;
}

s8 GetMonFlavorRelation(struct Pokemon *mon, u8 flavor)
{
    u8 nature = GetNature(mon);
    return gPokeblockFlavorCompatibilityTable[nature * 5 + flavor];
}

s8 GetFlavorRelationByPersonality(u32 personality, u8 flavor)
{
    u8 nature = GetNatureFromPersonality(personality);
    return gPokeblockFlavorCompatibilityTable[nature * 5 + flavor];
}

bool8 IsTradedMon(struct Pokemon *mon)
{
    u8 otName[7 + 1]; // change PLAYER_NAME_LENGTH to 7
    u32 otId;
    GetMonData(mon, MON_DATA_OT_NAME, otName);
    otId = GetMonData(mon, MON_DATA_OT_ID, 0);
    return IsOtherTrainer(otId, otName);
}

bool8 IsOtherTrainer(u32 otId, u8 *otName)
{
    if (otId ==
        (gSaveBlock2Ptr->playerTrainerId[0]
         | (gSaveBlock2Ptr->playerTrainerId[1] << 8)
         | (gSaveBlock2Ptr->playerTrainerId[2] << 16)
         | (gSaveBlock2Ptr->playerTrainerId[3] << 24)))
    {
        int i;

        for (i = 0; otName[i] != EOS; i++)
            if (otName[i] != gSaveBlock2Ptr->playerName[i])
                return TRUE;
        return FALSE;
    }

    return TRUE;
}

void MonRestorePP(struct Pokemon *mon)
{
    BoxMonRestorePP(&mon->box);
}

void BoxMonRestorePP(struct BoxPokemon *boxMon)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        if (GetBoxMonData(boxMon, MON_DATA_MOVE1 + i, 0))
        {
            u16 move = GetBoxMonData(boxMon, MON_DATA_MOVE1 + i, 0);
            u16 bonus = GetBoxMonData(boxMon, MON_DATA_PP_BONUSES, 0);
            u8 pp = CalculatePPWithBonus(move, bonus, i);
            SetBoxMonData(boxMon, MON_DATA_PP1 + i, &pp);
        }
    }
}

// SetMonPreventsSwitchingString
void sub_8044348(void)
{
#ifdef NONMATCHING
    gLastUsedAbility = gBattleStruct -> abilityPreventingSwitchout; // fixed from the original
#else
    gLastUsedAbility = ((u8 *) gBattleStruct)[0xac]; // huh? why is this wrong?
#endif

    gBattleTextBuff1[0] = B_BUFF_PLACEHOLDER_BEGIN;
    gBattleTextBuff1[1] = B_BUFF_MON_NICK_WITH_PREFIX;
    gBattleTextBuff1[2] = gBattleStruct->battlerPreventingSwitchout;
    gBattleTextBuff1[4] = B_BUFF_EOS;

    if (GetBattlerSide(gBattleStruct->battlerPreventingSwitchout) == B_SIDE_PLAYER)
        gBattleTextBuff1[3] = pokemon_order_func(gBattlerPartyIndexes[gBattleStruct->battlerPreventingSwitchout]);
    else
        gBattleTextBuff1[3] = gBattlerPartyIndexes[gBattleStruct->battlerPreventingSwitchout];

    PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff2, gBattlerInMenuId, pokemon_order_func(gBattlerPartyIndexes[gBattlerInMenuId]))

    BattleStringExpandPlaceholders(gText_PkmnsXPreventsSwitching, gStringVar4);
}

void SetWildMonHeldItem(void)
{
    // TODO: Replace 0x00010000 with the right flag that isnt BATTLE_TYPE_DOME
    if (!(gBattleTypeFlags & (0x00010000 | BATTLE_TYPE_LEGENDARY | BATTLE_TYPE_TRAINER)))
    {
        u16 rnd = Random() % 100;
        u16 species = GetMonData(&gEnemyParty[0], MON_DATA_SPECIES, 0);
        if (gBaseStats[species].item1 == gBaseStats[species].item2)
        {
            SetMonData(&gEnemyParty[0], MON_DATA_HELD_ITEM, &gBaseStats[species].item1);
            return;
        }

        if (rnd > 44)
        {
            if (rnd <= 94)
                SetMonData(&gEnemyParty[0], MON_DATA_HELD_ITEM, &gBaseStats[species].item1);
            else
                SetMonData(&gEnemyParty[0], MON_DATA_HELD_ITEM, &gBaseStats[species].item2);
        }
    }
}

bool8 IsMonShiny(struct Pokemon *mon)
{
    u32 otId = GetMonData(mon, MON_DATA_OT_ID, 0);
    u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, 0);
    return IsShinyOtIdPersonality(otId, personality);
}

bool8 IsShinyOtIdPersonality(u32 otId, u32 personality)
{
    bool8 retVal = FALSE;
    u32 shinyValue = HIHALF(otId) ^ LOHALF(otId) ^ HIHALF(personality) ^ LOHALF(personality);
    if (shinyValue < 8)
        retVal = TRUE;
    return retVal;
}

u8 *sub_80444C4(void)
{
    u8 id = GetMultiplayerId();
    return gLinkPlayers[GetBankMultiplayerId(gLinkPlayers[id].id ^ 2)].name;
}
