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
#define SHOULD_SWITCH_ABSORBS_HIDDEN_POWER_PERCENTAGE               50
#define SHOULD_SWITCH_TRAPPER_PERCENTAGE                            100
#define SHOULD_SWITCH_FREE_TURN_PERCENTAGE                          50
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
#define BOOST_INTO_HAZE_CHANCE                                  0 // Chance the AI will use a stat boosting move if the player has used Haze
#define SHOULD_RECOVER_CHANCE                                   50 // Chance the AI will give recovery moves score increase if less than ENABLE_RECOVERY_THRESHOLD and in no immediate danger
#define ENABLE_RECOVERY_THRESHOLD                               60 // HP percentage beneath which SHOULD_RECOVER_CHANCE is active
#define SUCKER_PUNCH_CHANCE                                     50 // Chance for the AI to not use Sucker Punch if the player has a status move
#define SUCKER_PUNCH_PREDICTION_CHANCE                          50 // Additional chance for the AI to not use Sucker Punch if actively predicting a status move if SUCKER_PUNCH_CHANCE fails
#define PRIORITIZE_LAST_CHANCE_CHANCE                           50 // Chance the AI will prioritize Last Chance (priority move in the face of being outsped and KO'd) over Slow KO

// AI damage calc considerations
#define RISKY_AI_CRIT_STAGE_THRESHOLD                           2   // Stat stages at which Risky will assume it gets a crit
#define RISKY_AI_CRIT_THRESHOLD_GEN_1                           128 // "Stat stage" at which Risky will assume it gets a crit with gen 1 mechanics (this translates to an X / 255 % crit threshold)

// AI prediction chances
#define PREDICT_SWITCH_CHANCE                                   50
#define PREDICT_MOVE_CHANCE                                     100

// AI Terastalization chances
#define AI_CONSERVE_TERA_CHANCE_PER_MON                         10 // Chance for AI with smart tera flag to decide not to tera before considering defensive benefit is this*(X-1), where X is the number of alive pokemon that could tera
#define AI_TERA_PREDICT_CHANCE                                  40 // Chance for AI with smart tera flag to tera in the situation where tera would save it from a KO, but could be punished by a KO from a different move.

// AI_FLAG_PP_STALL_PREVENTION settings
#define PP_STALL_DISREGARD_MOVE_PERCENTAGE                      50 // Detection chance per roll
#define PP_STALL_SCORE_REDUCTION                                20 // Score reduction if any roll for PP stall detection passes

// AI_FLAG_ASSUME_STAB settings
#define ASSUME_STAB_SEES_ABILITY                                FALSE // Flag also gives omniscience for player's ability. Can use AI_FLAG_WEIGH_ABILITY_PREDICTION instead for smarter prediction without omniscience.

// AI_FLAG_ASSUME_STATUS_MOVES settings
#define ASSUME_STATUS_MOVES_HAS_TUNING                  TRUE // Flag has varying rates for different kinds of status move.
                                                             // Setting to false also means it will not alert on Fake Out or Super Fang.
#define ASSUME_STATUS_HIGH_ODDS                         90 // Chance for AI to see extremely likely moves for a pokemon to have, like Spore
#define ASSUME_STATUS_MEDIUM_ODDS                       70 // Chance for AI to see moderately likely moves for a pokemon to have, like Protect
#define ASSUME_STATUS_LOW_ODDS                          40 // Chance for AI to see niche moves a pokemon may have but probably won't, like Entrainment
#define ASSUME_ALL_STATUS_ODDS                          25 // Chance for the AI to see any kind of status move.

// AI_FLAG_SMART_SWITCHING settings
#define SMART_SWITCHING_OMNISCIENT                              FALSE // AI will use omniscience for switching calcs, regardless of omniscience setting otherwise

// Configurations specifically for AI_FLAG_DOUBLE_BATTLE.
#define FRIENDLY_FIRE_RISKY_THRESHOLD             2 // AI_FLAG_RISKY acceptable number of hits to KO the partner via friendly fire
#define FRIENDLY_FIRE_NORMAL_THRESHOLD            3 // typical acceptable number of hits to KO the partner via friendly fire
#define FRIENDLY_FIRE_CONSERVATIVE_THRESHOLD      4 // AI_FLAG_CONSERVATIVE acceptable number of hits to KO the partner via friendly fire
// Counterplay on the assumption of opponents Protecting.
#define DOUBLE_TRICK_ROOM_ON_LAST_TURN_CHANCE    35 // both pokemon use Trick Room on turn Trick Room expires in the hopes both opponents used Protect to stall, getting a free refresh on the timer
#define TAILWIND_IN_TRICK_ROOM_CHANCE            35 // use Tailwind on turn Trick Room expires in the hopes both opponents used Protect to stall

#define AI_FLAG_ATTACKS_PARTNER_FOCUSES_PARTNER  FALSE  // if TRUE, AI_FLAG_ATTACKS_PARTNER prefers attacking the partner over the ally.
                                                        // This is treated as true regardless during wild battles with AI.

// AI's desired stat changes for Guard Split and Power Split, treated as %
#define GUARD_SPLIT_ALLY_PERCENTAGE     200
#define GUARD_SPLIT_ENEMY_PERCENTAGE    50
#define POWER_SPLIT_ALLY_PERCENTAGE     150
#define POWER_SPLIT_ENEMY_PERCENTAGE    50

// HP thresholds to use a status z-move.
#define Z_EFFECT_FOLLOW_ME_THRESHOLD    30
#define Z_EFFECT_RESTORE_HP_LOWER_THRESHOLD   ENABLE_RECOVERY_THRESHOLD // threshold used for moves you could conceivably use more than once
#define Z_EFFECT_RESTORE_HP_HIGHER_THRESHOLD  90                        // these moves are one-time use or drop your HP

#endif // GUARD_CONFIG_AI_H
