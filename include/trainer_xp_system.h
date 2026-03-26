#ifndef GUARD_TRAINER_XP_SYSTEM_H
#define GUARD_TRAINER_XP_SYSTEM_H

// Award XP for a trainer type.
void AwardTrainerTypeExp(u8 typeId, u16 exp);

// Award XP to both type slots of a species. Pure-type species get double credit.
void AwardTrainerTypeExpToSpeciesTypes(u16 species, u16 expPerType);

// Award fractional XP in quarter-point units (1 = 0.25 XP, 2 = 0.5 XP).
void AwardTrainerTypeExpQuarters(u8 typeId, u8 quarterExp);

// Award encounter XP based on shiny status.
// First-seen XP is handled by HandleSetPokedexFlag in pokemon.c.
void AwardTrainerTypeEncounterExp(u16 species, u32 otId, u32 personality);

// Get the cumulative XP threshold to reach 'level' for the given type.
u16 GetTrainerTypeLevelThreshold(u8 typeId, u8 level);

// Calculate catch rate bonus from trainer type levels.
u8 GetCatchRateBonus(u16 wildPokemonSpecies);

// Safari Zone catch rate bonus: 1-to-1 trainer type level to % catch rate.
u16 GetSafariCatchRateBonus(u16 wildPokemonSpecies);

// Initialize trainer type levels (call on new game).
void InitializeTrainerTypeLevels(void);

// Recalculate all trainer type levels from stored XP.
void UpdateTrainerTypeLevels(void);

// Friendship obedience modifier: ceil((friendship - 70) / 10).
// Inverted when isFrustrationMove is TRUE.  Range: roughly -12 to +13.
s8 GetFriendshipObedienceModifier(u8 friendship, bool8 isFrustrationMove);

// Extra friendship growth for one type: floor(type_level / 10).
u8 GetFriendshipGrowthBonus(u8 typeId);

// Effective learn-level bonus for the player's Pokemon: floor(avg(type levels) / 10).
// Uses only the Pokemon's own species types.
u8 GetTrainerTypeLearnLevelBonus(u8 type1, u8 type2);

// Averaged trainer level across three slots: type1, type2-or-type1, and moveType.
// Pure-typed species count their single type twice, so they keep a 2/3 share of
// the stat bonus calculation while the move type occupies the remaining 1/3.
// Used for both offensive and defensive stat bonuses.
u8 GetTrainerTypeBonusLevel(u8 type1, u8 type2, u8 moveType);

// Side-aware trainer type lookup.
// Player side reads persistent save data; opponent side derives a profile from
// the current trainer's party composition, moves, and boss metadata.
u8 GetTrainerTypeBonusLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType);

// Offensive/defensive variants with party-synergy amplification.
// Offense amplification uses the move type.
// Defense amplification uses the defender's own type pair (OR matching).
u8 GetTrainerTypeOffenseBonusLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType);
u8 GetTrainerTypeDefenseBonusLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType);

// Obedience trainer level from average(mon typing level, move type level).
// If moveType is invalid or TYPE_MYSTERY, falls back to mon typing average only.
u8 GetTrainerTypeObedienceLevelByBattlerSide(u8 battlerSide, u8 type1, u8 type2, u8 moveType);

// Compute the same obedience level for a specific NPC trainer profile.
u8 GetTrainerTypeObedienceLevelByTrainer(u16 trainerId, u8 type1, u8 type2, u8 moveType);

// Resolve the actual battle moves for a trainer mon.
// Custom-move trainers keep their authored moves, while default-move trainers
// can gain slightly earlier level-up moves from trainer type levels.
void GetTrainerMonBattleMoves(u16 trainerId, u8 monIndex, u16 species, u8 level, u16 *moves);

// Matchup-composite trainer level: averages a trainer's knowledge of
// the three types involved in a type effectiveness interaction
// (moveType, defenderType1, defenderType2).  Used by the SE/NVE
// effectiveness modifier in Cmd_typecalc.
u8 GetMatchupCompositeByBattlerSide(u8 battlerSide, u8 moveType, u8 defType1, u8 defType2);

// Per-battle trainer type summary support.
void TrainerTypeBattleSummary_Reset(void);
bool8 TrainerTypeBattleSummary_HasPending(void);
bool8 TrainerTypeBattleSummary_GetNext(u8 *typeId, u16 *expGained, u8 *levelsGained);

// Grant starter-based trainer type level boost (called from event script special).
void GrantStarterTypeBoost(void);

#endif // GUARD_TRAINER_XP_SYSTEM_H
