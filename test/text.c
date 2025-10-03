#include "global.h"
#include "test/test.h"
#include "battle.h"
#include "battle_main.h"
#include "battle_message.h"
#include "battle_setup.h"
#include "item.h"
#include "malloc.h"
#include "main_menu.h"
#include "string_util.h"
#include "text.h"
#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/battle_string_ids.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "test/overworld_script.h"

TEST("Move names fit on Pokemon Summary Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 72;
    u32 move = MOVE_NONE;
    for (i = 1; i < MOVES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", GetMoveName(i)) { move = i; }
    }
    //DebugPrintf("Move %d: %S", GetStringWidth(fontId, GetMoveName(move), 0), GetMoveName(move));
    EXPECT_LE(GetStringWidth(fontId, GetMoveName(move), 0), widthPx);
}

TEST("Move names fit on Battle Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 64;
    u32 move = MOVE_NONE;
    for (i = 1; i < MOVES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", GetMoveName(i)) { move = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, GetMoveName(move), 0), widthPx);
}

TEST("Move names fit on Contest Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 59;
    u32 move = MOVE_NONE;
    for (i = 1; i < MOVES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", GetMoveName(i)) { move = i; }
    }
    // All moves explicitly listed here are too big to fit.
    switch (move)
    {
    case MOVE_STOMPING_TANTRUM:
    case MOVE_NATURES_MADNESS:
    case MOVE_DOUBLE_IRON_BASH:
        EXPECT_GT(GetStringWidth(fontId, GetMoveName(move), 0), widthPx);
        break;
    default:
        EXPECT_LE(GetStringWidth(fontId, GetMoveName(move), 0), widthPx);
        break;
    }
}

TEST("Move names fit on TMs & HMs Bag Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 move = MOVE_NONE;
    for (i = 1; i < MOVES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", GetMoveName(i)) { move = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, GetMoveName(move), 0), widthPx);
}

TEST("Move names fit on Move Relearner Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 move = MOVE_NONE;
    for (i = 1; i < MOVES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", GetMoveName(i)) { move = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, GetMoveName(move), 0), widthPx);
}

TEST("Move descriptions fit on Pokemon Summary Screen")
{
    u32 i;
    const u32 fontId = FONT_NORMAL, widthPx = 1000;
    u32 move = MOVE_NONE;
    for (i = 1; i < MOVES_COUNT_ALL; i++)
    {
        PARAMETRIZE_LABEL("%S", GetMoveDescription(i)) { move = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, GetMoveDescription(move), 0), widthPx);
}

TEST("Item names fit on Bag Screen (list)")
{
    u32 i;
    const u32 fontId = FONT_NARROWER;
    const u32 tmHmBerryWidthPx = 1000, restWidthPx = 1000;
    u32 item = ITEM_NONE;
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].name) { item = i; }
    }
    //DebugPrintf("Item %d: %S", GetStringWidth(fontId, gItemsInfo[item].name, 0), gItemsInfo[item].name);
    if (gItemsInfo[item].pocket == POCKET_TM_HM || gItemsInfo[item].pocket == POCKET_BERRIES)
        EXPECT_LE(GetStringWidth(fontId, gItemsInfo[item].name, 0), tmHmBerryWidthPx);
    else
        EXPECT_LE(GetStringWidth(fontId, gItemsInfo[item].name, 0), restWidthPx);
}

TEST("Item plural names fit on Bag Screen (left box)")
{
    u32 i;
    // -6 for the question mark in FONT_NORMAL.
    const u32 fontId = FONT_NARROWER, widthPx = 1000 - 6;
    u32 item = ITEM_NONE;
    u8 pluralName[ITEM_NAME_PLURAL_LENGTH + 1];
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].name) { item = i; }
    }
    CopyItemNameHandlePlural(item, pluralName, 2);
    EXPECT_LE(GetStringWidth(fontId, pluralName, 0), widthPx);
}

TEST("Item names fit on PC Storage (list)")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 item = ITEM_NONE;
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].name) { item = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gItemsInfo[item].name, 0), widthPx);
}

TEST("Item plural names fit on PC storage (left box)")
{
    u32 i;
    // -6 for the question mark in FONT_NORMAL.
    const u32 fontId = FONT_NARROWER, widthPx = 1000 - 6;
    u32 item = ITEM_NONE;
    u8 pluralName[ITEM_NAME_PLURAL_LENGTH + 1];
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].name) { item = i; }
    }
    CopyItemNameHandlePlural(item, pluralName, 2);
    EXPECT_LE(GetStringWidth(fontId, pluralName, 0), widthPx);
}

TEST("Item names fit on Pokemon Storage System")
{
    u32 i;
    const u32 fontId = FONT_SMALL_NARROWER, widthPx = 66;
    u32 item = ITEM_NONE;
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        if (gItemsInfo[i].importance) continue;
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].name) { item = i; }
    }
    // All items explicitly listed here are too big to fit.
    switch (item)
    {
    case ITEM_ELECTRIC_TERA_SHARD:
    case ITEM_FIGHTING_TERA_SHARD:
    case ITEM_PSYCHIC_TERA_SHARD:
    case ITEM_UNREMARKABLE_TEACUP:
    case ITEM_MASTERPIECE_TEACUP:
    case ITEM_TWICE_SPICED_RADISH:
        EXPECT_GT(GetStringWidth(fontId, gItemsInfo[item].name, 0), widthPx);
        break;
    default:
        EXPECT_LE(GetStringWidth(fontId, gItemsInfo[item].name, 0), widthPx);
        break;
    }
}

TEST("Item names fit on Pokemon Summary Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 72;
    u32 item = ITEM_NONE;
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        if (gItemsInfo[i].importance) continue;
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].name) { item = i; }
    }
    // All items explicitly listed here are too big to fit.
    switch (item)
    {
    case ITEM_UNREMARKABLE_TEACUP:
        EXPECT_GT(GetStringWidth(fontId, gItemsInfo[item].name, 0), widthPx);
        break;
    default:
        EXPECT_LE(GetStringWidth(fontId, gItemsInfo[item].name, 0), widthPx);
        break;
    }
}

TEST("Item names fit on Shop Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 item = ITEM_NONE;
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].name) { item = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gItemsInfo[item].name, 0), widthPx);
}

TEST("Item descriptions fit on Bag and Shop Screen")
{
    u32 i;
    const u32 fontId = FONT_NORMAL, widthPx = 1000;
    u32 item = ITEM_NONE;
    for (i = 1; i < ITEMS_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gItemsInfo[i].description) { item = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gItemsInfo[item].description, 0), widthPx);
}

TEST("Species names fit on Battle Screen HP box")
{
    u32 i, genderWidthPx;
    const u32 fontId = FONT_SMALL_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    genderWidthPx = GetStringWidth(fontId, COMPOUND_STRING("♂"), 0);
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    if (gSpeciesInfo[i].genderRatio != MON_GENDERLESS)
        EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0) - genderWidthPx, widthPx);
    else
        EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Party Screen")
{
    u32 i;
    const u32 fontId = FONT_SMALL_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Pokemon Summary Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Pokedex Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Pokedex Screen - Cries")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Pokemon Storage System")
{
    u32 i;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(FONT_NARROWER, gSpeciesInfo[species].speciesName, 0), 66);
    // EXPECT_LE(GetStringWidth(FONT_SHORT_NARROWER, gSpeciesInfo[species].speciesName, 0), 60);
}

TEST("Species names fit on Contest Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Contest Screen - Rankings")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

// TEST("Species names fit on Battle Dome Screen")
// {
//     u32 i;
//     const u32 fontId = FONT_SHORT_NARROWER, widthPx = 60;
//     u32 species = SPECIES_NONE;
//     for (i = 1; i < NUM_SPECIES; i++)
//     {
//         if (IsSpeciesEnabled(i))
//         {
//             PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
//         }
//     }
//     EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
// }

TEST("Species names fit on Hall of Fame")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Naming Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on PokeNav Condition Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on PokeNav Condition Search Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on PokeNav Ribbon Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on PokeNav Ribbon List Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species names fit on Battle Screen HP box for vanilla mons with the default font")
{
    u32 i, genderWidthPx;
    const u32 fontId = FONT_SMALL, widthPx = 1000;
    u32 species = SPECIES_NONE;
    genderWidthPx = GetStringWidth(fontId, COMPOUND_STRING("♂"), 0);
    for (i = 1; i < SPECIES_TURTWIG; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].speciesName) { species = i; }
        }
    }
    if (gSpeciesInfo[i].genderRatio != MON_GENDERLESS)
        EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0) - genderWidthPx, widthPx);
    else
        EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].speciesName, 0), widthPx);
}

TEST("Species dex entries fit on Pokedex Screen")
{
    u32 i;
    const u32 fontId = FONT_NORMAL, widthPx = 1000;
    u32 species = SPECIES_NONE;
    for (i = 1; i < NUM_SPECIES; i++)
    {
        if (IsSpeciesEnabled(i))
        {
            PARAMETRIZE_LABEL("%S", gSpeciesInfo[i].description) { species = i; }
        }
    }
    EXPECT_LE(GetStringWidth(fontId, gSpeciesInfo[species].description, 0), widthPx);
}

TEST("Ability names fit on Pokemon Summary Screen")
{
    u32 i;
    const u32 fontId = FONT_NORMAL, widthPx = 1000;
    enum Ability ability = ABILITY_NONE;
    for (i = 1; i < ABILITIES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gAbilitiesInfo[i].name) { ability = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gAbilitiesInfo[ability].name, 0), widthPx);
}

TEST("Ability names fit on Ability Pop-Up")
{
    u32 i;
    const u32 fontId = FONT_SMALL_NARROWER, widthPx = 1000;
    enum Ability ability = ABILITY_NONE;
    for (i = 1; i < ABILITIES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gAbilitiesInfo[i].name) { ability = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gAbilitiesInfo[ability].name, 0), widthPx);
}

TEST("Ability descriptions fit on Pokemon Summary Screen")
{
    u32 i;
    const u32 fontId = FONT_NORMAL, widthPx = 1000;
    enum Ability ability = ABILITY_NONE;
    for (i = 1; i < ABILITIES_COUNT; i++)
    {
        PARAMETRIZE_LABEL("%S", gAbilitiesInfo[i].description) { ability = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gAbilitiesInfo[ability].description, 0), widthPx);
}

TEST("Type names fit on Battle Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 type = TYPE_NORMAL;
    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        PARAMETRIZE_LABEL("%S", gTypesInfo[i].name) { type = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gTypesInfo[type].name, 0), widthPx);
}

TEST("Type names fit on Pokedex Search Screen")
{
    u32 i;
    const u32 fontId = FONT_NARROWER, widthPx = 1000;
    u32 type = TYPE_NORMAL;
    for (i = 0; i < NUMBER_OF_MON_TYPES; i++)
    {
        PARAMETRIZE_LABEL("%S", gTypesInfo[i].name) { type = i; }
    }
    EXPECT_LE(GetStringWidth(fontId, gTypesInfo[type].name, 0), widthPx);
}

extern u16 sBattlerAbilities[MAX_BATTLERS_COUNT];
//*
#define BATTLE_STRING_BUFFER_SIZE 1000
TEST("Battle strings fit on the battle message window")
{
    u32 i, j, strWidth;
    u32 start = STRINGID_TABLE_START + 1;
    u32 end = STRINGID_COUNT - 1;
    const u32 fontId = FONT_NORMAL;
    enum StringID battleStringId = 0;
    u8 *battleString = Alloc(BATTLE_STRING_BUFFER_SIZE);

    s32 sixDigitNines = 999999;                                 // 36 pixels.
    u8 nickname[POKEMON_NAME_LENGTH + 1] = _("MMMMMMMMMMMM");   // 72 pixels.
    u32 longMoveID = MOVE_NATURES_MADNESS;                      // 89 pixels.
    enum Ability longAbilityID = ABILITY_SUPERSWEET_SYRUP;    // 91 pixels.
    u32 longStatName = STAT_EVASION;                            // 40 pixels.
    u32 longTypeName = TYPE_ELECTRIC;                           // 43 pixels.
    u32 longSpeciesName = SPECIES_SANDY_SHOCKS;                 // 47 pixels.
    u32 longItemName = ITEM_UNREMARKABLE_TEACUP;                // 73 pixels.
    u8 boxName[9] = _("MMMMMMMM");                              // 54 pixels.
    u8 name[PLAYER_NAME_LENGTH] = _("JOHNNY");

    // Set longest default player name, JOHNNY
    // NewGameBirchSpeech_SetDefaultPlayerName(10);  // JOHNNY
    for (i = 0; i < PLAYER_NAME_LENGTH; i++)
        gSaveBlock2Ptr->playerName[i] = name[i];
    gSaveBlock2Ptr->playerName[PLAYER_NAME_LENGTH] = EOS;

    RUN_OVERWORLD_SCRIPT(
        givemon SPECIES_WOBBUFFET, 100;
        createmon 1, 0, SPECIES_WOBBUFFET, 100;
    );
    SetMonData(&gPlayerParty[0], MON_DATA_NICKNAME, nickname);
    SetMonData(&gEnemyParty[0], MON_DATA_NICKNAME, nickname);

    for (i = start; i <= end; i++)
    {
        PARAMETRIZE_LABEL("%S", gBattleStringsTable[i]) { battleStringId = i; }
    }

    // Clear buffers
    PREPARE_STRING_BUFFER(gBattleTextBuff1, STRINGID_EMPTYSTRING3);
    PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_EMPTYSTRING3);
    PREPARE_STRING_BUFFER(gBattleTextBuff3, STRINGID_EMPTYSTRING3);
    *gStringVar1 = EOS;
    *gStringVar2 = EOS;
    *gStringVar3 = EOS;

    // Set positions
    gBattlerPositions[0] = B_POSITION_PLAYER_LEFT;
    gBattlerPositions[1] = B_POSITION_OPPONENT_LEFT;
    gBattlerPositions[2] = B_POSITION_PLAYER_RIGHT;
    gBattlerPositions[3] = B_POSITION_OPPONENT_RIGHT;

    // Set abilities
    gLastUsedAbility = longAbilityID;
    for (j = 0; j < MAX_BATTLERS_COUNT; j++)
        sBattlerAbilities[j] = longAbilityID;

    // Set Trainers
    TRAINER_BATTLE_PARAM.opponentA = TRAINER_YOUNGSTER_BEN;
    TRAINER_BATTLE_PARAM.opponentB = TRAINER_YOUNGSTER_BEN;

    // Set battler to 1, so "The opposing " is prefixed when refering to battlers.
    gBattleTypeFlags |= BATTLE_TYPE_TRAINER;
    gBattlerAttacker = gBattlerTarget = gBattleScripting.battler = gEffectBattler = 1;

    // Set moves
    gCurrentMove = longMoveID;
    gBattleMsgDataPtr = AllocZeroed(sizeof(struct BattleMsgData));
    gBattleMsgDataPtr->currentMove = longMoveID;

    // Set Items
    gLastUsedItem = longItemName;

    // Buffer specific strings for each Battle String.
    // In cases where a buffer is used with multiple contexts, the widest string is used.
    // Eg. STRINGID_CANACTFASTERTHANKSTO is used for both with abilities and items,
    // so ability is chosen because it's longer.
    switch (battleStringId)
    {
    // Testing Trainer messages is out of the current scope for this test.
    case STRINGID_TRAINER1LOSETEXT:
    case STRINGID_TRAINER2LOSETEXT:
    case STRINGID_TRAINER1WINTEXT:
    case STRINGID_TRAINER2WINTEXT:
        break;
    // Buffer Nickname with prefix to B_BUFF1, " a boosted" to B_BUFF2, "999999" to B_BUFF3
    case STRINGID_PKMNGAINEDEXP:
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, 0, 0);
        PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_ABOOSTED); // 'gained a boosted'
        PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff3, 6, sixDigitNines);
        break;
    // Buffer Nickname with prefix to B_BUFF1, "100" to B_BUFF2
    case STRINGID_PKMNGREWTOLV:
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, 0, 0);
        PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 3, 100);
        break;
    // Buffer Nickname with prefix to B_BUFF1, move name to B_BUFF2
    case STRINGID_PKMNLEARNEDMOVE:
    case STRINGID_TRYTOLEARNMOVE1:
    case STRINGID_TRYTOLEARNMOVE2:
    case STRINGID_TRYTOLEARNMOVE3:
    case STRINGID_PKMNFORGOTMOVE:
    case STRINGID_STOPLEARNINGMOVE:
    case STRINGID_DIDNOTLEARNMOVE:
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, 0, 0);
        PREPARE_MOVE_BUFFER(gBattleTextBuff2, longMoveID);
        break;
    // Buffer Move name to B_BUFF1
    case STRINGID_PKMNLEARNEDMOVE2:
    case STRINGID_PKMNHURTBY:
    case STRINGID_PKMNFREEDFROM:
    case STRINGID_PKMNMOVEWASDISABLED:
    case STRINGID_PKMNSKETCHEDMOVE:
    case STRINGID_PKMNGOTFREE:
    case STRINGID_PKMNLOSTPPGRUDGE:
    case STRINGID_PKMNSITEMRESTOREDPP:
    case STRINGID_PKMNSXWOREOFF:
    case STRINGID_BUFFERENDS:
    case STRINGID_FOREWARNACTIVATES:
    case STRINGID_CURSEDBODYDISABLED:
    case STRINGID_CURRENTMOVECANTSELECT:
    case STRINGID_TARGETISHURTBYSALTCURE:
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, longMoveID);
        break;
    // Buffer "999999" to B_BUFF1
    case STRINGID_PLAYERGOTMONEY:
    case STRINGID_PLAYERWHITEOUT2_TRAINER:
    case STRINGID_PLAYERPICKEDUPMONEY:
    case STRINGID_PLAYERWHITEOUT2_WILD:
        PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 6, sixDigitNines);
        break;
    // Buffer "99" to B_BUFF1
    case STRINGID_HITXTIMES:
    case STRINGID_MAGNITUDESTRENGTH:
        PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 2, 99);
        break;
    // Buffer "9" to B_BUFF1
    case STRINGID_PKMNSTOCKPILED:
    case STRINGID_PKMNPERISHCOUNTFELL:
        PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 1, 9);
        break;
    // Buffer Ability name to B_BUFF1
    case STRINGID_PKMNMADESLEEP:
    case STRINGID_PKMNPOISONEDBY:
    case STRINGID_PKMNBURNEDBY:
    case STRINGID_PKMNFROZENBY:
    case STRINGID_PKMNWASPARALYZEDBY:
    case STRINGID_CANACTFASTERTHANKSTO:
        PREPARE_ABILITY_BUFFER(gBattleTextBuff1, longAbilityID);
        break;
    // Buffer Stat name to B_BUFF1
    case STRINGID_STATSWONTINCREASE:
    case STRINGID_STATSWONTDECREASE:
    case STRINGID_PKMNSXPREVENTSYLOSS:
    case STRINGID_TARGETABILITYSTATRAISE:
    case STRINGID_TARGETSSTATWASMAXEDOUT:
    case STRINGID_ATTACKERABILITYSTATRAISE:
    case STRINGID_TARGETABILITYSTATLOWER:
    case STRINGID_SCRIPTINGABILITYSTATRAISE:
    case STRINGID_STATWASHEIGHTENED:
        StringCopy(gBattleTextBuff1, gStatNamesTable[longStatName]);
        break;
    // Buffer Type name to B_BUFF1
    case STRINGID_PKMNCHANGEDTYPE:
    case STRINGID_PKMNCHANGEDTYPEWITH:
    case STRINGID_TARGETCHANGEDTYPE:
    case STRINGID_PROTEANTYPECHANGE:
    case STRINGID_THIRDTYPEADDED:
    case STRINGID_ATTACKERLOSTITSTYPE:
    case STRINGID_PKMNTERASTALLIZEDINTO:
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, longTypeName);
        break;
    // Buffer Species name to B_BUFF1
    case STRINGID_PKMNTRANSFORMEDINTO:
    case STRINGID_WILDPKMNFLED:
    case STRINGID_MEGAEVOEVOLVED:
    case STRINGID_PKMNREVIVEDREADYTOFIGHT:
    case STRINGID_ITEMRESTOREDSPECIESHEALTH: // Should probably use nickname instead?
    case STRINGID_ITEMCUREDSPECIESSTATUS: // Should probably use nickname instead?
    case STRINGID_ITEMRESTOREDSPECIESPP: // Should probably use nickname instead?
        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, longSpeciesName)
        break;
    // Buffer nickname with prefix to B_BUFF1
    case STRINGID_PKMNATTACK:
    case STRINGID_PKMNWISHCAMETRUE:
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, 1, 0);
        break;
    // Buffer nickname with prefix in lower case to B_BUFF1
    case STRINGID_USEDINSTRUCTEDMOVE:
        PREPARE_MON_NICK_WITH_PREFIX_LOWER_BUFFER(gBattleTextBuff1, 1, 0);
        break;
    // Buffer nickname to B_BUFF2
    case STRINGID_ENEMYABOUTTOSWITCHPKMN:
        PREPARE_MON_NICK_BUFFER(gBattleTextBuff2, 1, 0);
        break;
    // Buffer Item name to B_BUFF1
    case STRINGID_PKMNHURTSWITH:
    case STRINGID_PKMNCURIOUSABOUTX:
    case STRINGID_PKMNENTHRALLEDBYX:
    case STRINGID_PKMNIGNOREDX:
    case STRINGID_PKMNOBTAINEDX:
    case STRINGID_ABOUTTOUSEPOLTERGEIST:
        PREPARE_ITEM_BUFFER(gBattleTextBuff1, longItemName);
        break;
    // Buffer Item name to B_BUFF2
    case STRINGID_PKMNOBTAINEDX2:
        PREPARE_ITEM_BUFFER(gBattleTextBuff2, longItemName);
        break;
    // Buffer Item name to B_BUFF1 and B_BUFF2
    case STRINGID_PKMNOBTAINEDXYOBTAINEDZ:
        PREPARE_ITEM_BUFFER(gBattleTextBuff1, longItemName);
        PREPARE_ITEM_BUFFER(gBattleTextBuff2, longItemName);
        break;
    // Buffer nickname with prefix to B_BUFF1, Ability name to B_BUFF2
    case STRINGID_PKMNTRACED:
        PREPARE_MON_NICK_WITH_PREFIX_LOWER_BUFFER(gBattleTextBuff1, 1, 0);
        PREPARE_ABILITY_BUFFER(gBattleTextBuff2, longAbilityID);
        break;
    // Buffer Stat name to B_BUFF1, "drastically rose" to B_BUFF2
    case STRINGID_ATTACKERSSTATROSE:
    case STRINGID_DEFENDERSSTATROSE:
    case STRINGID_USINGITEMSTATOFPKMNROSE:
        StringCopy(gBattleTextBuff1, gStatNamesTable[longStatName]);
        StringCopy(gBattleTextBuff2, gText_drastically);
        StringAppend(gBattleTextBuff2, gText_StatRose);
        break;
    // Buffer Stat name to B_BUFF1, "severely fell" to B_BUFF2
    case STRINGID_ATTACKERSSTATFELL:
    case STRINGID_DEFENDERSSTATFELL:
        StringCopy(gBattleTextBuff1, gStatNamesTable[longStatName]);
        StringCopy(gBattleTextBuff2, gText_severely);
        StringAppend(gBattleTextBuff2, gText_StatFell);
        break;
    // Buffer Status name to B_BUFF2
    case STRINGID_PKMNSITEMCUREDPROBLEM:
    case STRINGID_PKMNSXCUREDYPROBLEM:
    case STRINGID_PKMNSXCUREDITSYPROBLEM:
        StringCopy(gBattleTextBuff1, gText_Confusion);
        break;
    // Buffer Box name to STR_VAR_1 and STR_VAR_3, Nickname to STR_VAR_2
    case STRINGID_PKMNTRANSFERREDSOMEONESPC:
    case STRINGID_PKMNTRANSFERREDLANETTESPC:
    case STRINGID_PKMNBOXSOMEONESPCFULL:
    case STRINGID_PKMNBOXLANETTESPCFULL:
        StringCopy(gStringVar1, boxName);
        StringCopy(gStringVar2, nickname);
        StringCopy(gStringVar3, boxName);
        break;
    default:
        break;
    }
    EXPECT(gBattleStringsTable[battleStringId] != NULL);
    BattleStringExpandPlaceholders(gBattleStringsTable[battleStringId], battleString, BATTLE_STRING_BUFFER_SIZE);
    DebugPrintf("Battle String ID %d: %S", battleStringId, battleString);
    for (j = 1;; j++)
    {
        strWidth = GetStringLineWidth(fontId, battleString, 0, j, BATTLE_STRING_BUFFER_SIZE);
        if (strWidth == 0)
            break;
        EXPECT_LE(strWidth - 1, BATTLE_MSG_MAX_WIDTH); // -1 because there's a pixel-wide space that doesn't visually look like it's out of frame when using FONT_NORMAL.
    }
    Free(gBattleMsgDataPtr);
    Free(battleString);
}
//*/
