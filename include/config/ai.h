#ifndef GUARD_CONFIG_AI_H
#define GUARD_CONFIG_AI_H

// For the details on what specific factors the switching functions are considering, go read the corresponding function inside ShouldSwitch in src/battle_ai_switch_items.c
// These configuration options control how likely the AI is to switch if it determines that a switch meets all of its criteria
// Think of them almost like success rates; if the AI has determined that it needs to switch out to hit Wonder Guard, how often do you want it to actually take that course of action? Etc.

// AI switch chances; if you want more complex behaviour, modify GetSwitchChance
#define SHOULD_SWITCH_WONDER_GUARD_PERCENTAGE                   100
#define SHOULD_SWITCH_TRUANT_PERCENTAGE                         100
#define SHOULD_SWITCH_ALL_MOVES_BAD_PERCENTAGE                  100
#define STAY_IN_STATS_RAISED                                    2  // Number of stat stages that must be raised across any stats before the AI won't switch mon out in certain cases

// AI smart switching chances; if you want more complex behaviour, modify GetSwitchChance
#define SHOULD_SWITCH_ABSORBS_MOVE_PERCENTAGE                       100
#define SHOULD_SWITCH_TRAPPER_PERCENTAGE                            100
#define SHOULD_SWITCH_FREE_TURN_PERCENTAGE                          100
#define STAY_IN_ABSORBING_PERCENTAGE                                66  // Chance to stay in if outgoing mon has super effective move against player, will prevent switching out for an absorber with this likelihood
#define SHOULD_SWITCH_HASBADODDS_PERCENTAGE                         50
#define SHOULD_SWITCH_ENCORE_STATUS_PERCENTAGE                      100
#define SHOULD_SWITCH_ENCORE_DAMAGE_PERCENTAGE                      50
#define SHOULD_SWITCH_CHOICE_LOCKED_PERCENTAGE                      100 // Only if locked into status move
#define SHOULD_SWITCH_ATTACKING_STAT_MINUS_TWO_PERCENTAGE           50
#define SHOULD_SWITCH_ATTACKING_STAT_MINUS_THREE_PLUS_PERCENTAGE    100
#define SHOULD_SWITCH_ALL_SCORES_BAD_PERCENTAGE                     100

// AI smart switching chances for bad statuses
#define SHOULD_SWITCH_PERISH_SONG_PERCENTAGE                    100
#define SHOULD_SWITCH_YAWN_PERCENTAGE                           100
#define SHOULD_SWITCH_BADLY_POISONED_PERCENTAGE                 50
#define SHOULD_SWITCH_BADLY_POISONED_STATS_RAISED_PERCENTAGE    20
#define SHOULD_SWITCH_CURSED_PERCENTAGE                         50
#define SHOULD_SWITCH_CURSED_STATS_RAISED_PERCENTAGE            20
#define SHOULD_SWITCH_NIGHTMARE_PERCENTAGE                      33
#define SHOULD_SWITCH_NIGHTMARE_STATS_RAISED_PERCENTAGE         15
#define SHOULD_SWITCH_SEEDED_PERCENTAGE                         25
#define SHOULD_SWITCH_SEEDED_STATS_RAISED_PERCENTAGE            10
#define SHOULD_SWITCH_INFATUATION_PERCENTAGE                    100

// AI smart switching chances for beneficial abilities
#define SHOULD_SWITCH_NATURAL_CURE_STRONG_PERCENTAGE                66
#define SHOULD_SWITCH_NATURAL_CURE_STRONG_STATS_RAISED_PERCENTAGE   10
#define SHOULD_SWITCH_NATURAL_CURE_WEAK_PERCENTAGE                  25
#define SHOULD_SWITCH_NATURAL_CURE_WEAK_STATS_RAISED_PERCENTAGE     10
#define SHOULD_SWITCH_REGENERATOR_PERCENTAGE                        50
#define SHOULD_SWITCH_REGENERATOR_STATS_RAISED_PERCENTAGE           20

// AI switchin considerations
#define ALL_MOVES_BAD_STATUS_MOVES_BAD                          FALSE // If the AI has no moves that affect the target, ShouldSwitchIfAllMovesBad can prompt a switch. Enabling this config will ignore status moves that can affect the target when making this decision.
#define AI_BAD_SCORE_THRESHOLD                                  90 // Move scores beneath this threshold are considered "bad" when deciding switching
#define AI_GOOD_SCORE_THRESHOLD                                 100 // Move scores above this threshold are considered "good" when deciding switching

// AI held item-based move scoring
#define LOW_ACCURACY_THRESHOLD                                  75 // Moves with accuracy equal OR below this value are considered low accuracy 

// AI move scoring
#define STATUS_MOVE_FOCUS_PUNCH_CHANCE                          50 // Chance the AI will use a status move if the player's best move is Focus Punch

// AI damage calc considerations
#define RISKY_AI_CRIT_STAGE_THRESHOLD                           2   // Stat stages at which Risky will assume it gets a crit
#define RISKY_AI_CRIT_THRESHOLD_GEN_1                           128 // "Stat stage" at which Risky will assume it gets a crit with gen 1 mechanics (this translates to an X / 255 % crit threshold)

// AI prediction chances
#define PREDICT_SWITCH_CHANCE                                   50
#define PREDICT_MOVE_CHANCE                                     100

// AI PP Stall detection chance per roll
#define PP_STALL_DISREGARD_MOVE_PERCENTAGE                      50
// Score reduction if any roll for PP stall detection passes
#define PP_STALL_SCORE_REDUCTION                                20

// AI's acceptable number of hits to KO the partner via friendly fire in a double battle.
#define FRIENDLY_FIRE_RISKY_THRESHOLD           2
#define FRIENDLY_FIRE_NORMAL_THRESHOLD          3
#define FRIENDLY_FIRE_CONSERVATIVE_THRESHOLD    4

#endif // GUARD_CONFIG_AI_H
