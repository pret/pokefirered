#ifndef GUARD_CONFIG_BATTLE_H
#define GUARD_CONFIG_BATTLE_H

// Calculation settings
#define B_CRIT_CHANCE               GEN_LATEST // Chances of a critical hit landing. See CalcCritChanceStage. Gen6+ chances guarantee that Farfetch'd and Sirfetch'd always get critical hits while holding a Leek and using high-crit ratio moves.
#define B_CRIT_MULTIPLIER           GEN_LATEST // In Gen6+, critical hits multiply damage by 1.5 instead of 2.
#define B_PARALYSIS_SPEED           GEN_LATEST // In Gen7+, Speed is decreased by 50% instead of 75%.
#define B_CONFUSION_SELF_DMG_CHANCE GEN_LATEST // In Gen7+, confusion has a 33.3% of self-damage, instead of 50%.
#define B_MULTI_HIT_CHANCE          GEN_LATEST // In Gen5+, multi-hit moves have different %. See SetRandomMultiHitCounter for values.
#define B_WHITEOUT_MONEY            GEN_LATEST // In Gen4+, the amount of money lost by losing a battle is determined by the amount of badges earned. Previously, it would cut the current money by half. (While this change was also in FRLG, for the sake of simplicity, setting this to GEN_3 will result in RSE behavior.)
#define B_LIGHT_BALL_ATTACK_BOOST   GEN_LATEST // In Gen4+, Light Ball doubles the power of physical moves in addition to special moves.

// Experience settings
#define B_EXP_CATCH                 GEN_LATEST // In Gen6+, Pokémon get experience from catching.
#define B_TRAINER_EXP_MULTIPLIER    GEN_LATEST // In Gen7+, trainer battles no longer give a 1.5 multiplier to EXP gain.
#define B_SPLIT_EXP                 GEN_LATEST // In Gen6+, all participating mon get full experience.
#define B_SCALED_EXP                GEN_LATEST // In Gen5 and Gen7+, experience is weighted by level difference.
#define B_UNEVOLVED_EXP_MULTIPLIER  GEN_LATEST // In Gen6+, if the Pokémon is at or past the level where it would be able to evolve, but it has not, it gets a ~1.2 multiplier to EXP gain. Only applies to Pokémon with EVO_LEVEL method.
#define B_LEVEL_UP_NOTIFICATION     GEN_LATEST // In Gen9+, if the Pokémon gets enough experience to level up multiple times, the message is only displayed once.

// Stat settings
#define B_BADGE_BOOST               GEN_LATEST // In Gen4+, Gym Badges no longer boost a Pokémon's stats.
#define B_FRIENDSHIP_BOOST          FALSE      // In LGPE only, all stats except HP are boosted up to 10% based on Friendship. Unlike B_BADGE_BOOST, these boosts are accounted when calculating base stats.
#define B_MAX_LEVEL_EV_GAINS        GEN_LATEST // In Gen5+, Lv100 Pokémon can obtain Effort Values normally.
#define B_RECALCULATE_STATS         GEN_LATEST // In Gen5+, the stats of the Pokémon who participate in battle are recalculated at the end of each battle.

// Damage settings
#define B_BURN_DAMAGE               GEN_LATEST // In Gen7+, burn damage is 1/16th of max HP instead of 1/8th. Also applies to Frostbite.
#define B_BURN_FACADE_DMG           GEN_LATEST // In Gen6+, burn's effect of lowering the Attack stat no longer applies to Facade.
#define B_BINDING_DAMAGE            GEN_LATEST // In Gen6+, binding damage is 1/8 of max HP instead of 1/16. (With Binding Band, 1/6 and 1/8 respectively.)
#define B_PSYWAVE_DMG               GEN_LATEST // Psywave's damage formula. See Cmd_psywavedamageeffect.
#define B_PAYBACK_SWITCH_BOOST      GEN_LATEST // In Gen5+, if the opponent switches out, Payback's damage will no longer be doubled.
#define B_HIDDEN_POWER_DMG          GEN_LATEST // In Gen6+, Hidden Power's base power was set to always be 60. Before, it was determined by the mon's IVs.
#define B_ROUGH_SKIN_DMG            GEN_LATEST // In Gen4+, Rough Skin contact damage is 1/8th of max HP instead of 1/16th. This will also affect Iron Barbs.
#define B_KNOCK_OFF_DMG             GEN_LATEST // In Gen6+, Knock Off deals 50% more damage when knocking off an item.
#define B_SPORT_DMG_REDUCTION       GEN_LATEST // In Gen5+, Water/Mud Sport reduce Fire/Electric Damage by 67% instead of 50%.
#define B_EXPLOSION_DEFENSE         GEN_LATEST // In Gen5+, Self-Destruct and Explosion don't halve the targets' defense.
#define B_PARENTAL_BOND_DMG         GEN_LATEST // In Gen7+, Parental Bond's second hit does 25% of the initial hits damage. Before, it did 50%.
#define B_MULTIPLE_TARGETS_DMG      GEN_LATEST // In Gen4+, damage dealt by moves that hit multiple targets at once is reduced to 75%. Before, it was 50%.

// Type settings
#define B_GHOSTS_ESCAPE             GEN_LATEST // In Gen6+, abilities like Shadow Tag or moves like Mean Look fail on Ghost-type Pokémon. They can also escape any Wild Battle.
#define B_PARALYZE_ELECTRIC         GEN_LATEST // In Gen6+, Electric-type Pokémon can't be paralyzed.
#define B_POWDER_GRASS              GEN_LATEST // In Gen6+, Grass-type Pokémon are immune to powder and spore moves.
#define B_UPDATED_TYPE_MATCHUPS     GEN_LATEST // Updates Type matchups. src/data/types_info.h for details.
#define B_PRANKSTER_DARK_TYPES      GEN_LATEST // In Gen7+, Prankster-elevated status moves do not affect Dark type Pokémon.
#define B_SHEER_COLD_IMMUNITY       GEN_LATEST // In Gen7+, Ice-types are immune to Sheer Cold
#define B_ROOST_PURE_FLYING         GEN_LATEST // In Gen5+, Roost makes pure Flying-types into Normal-type.
#define B_STATUS_TYPE_IMMUNITY      GEN_LATEST // In Gen1, Pokémon were immune to paralysis/freeze/burn side effects of attacking moves, if they shared a type with the move.

// Turn settings
#define B_BINDING_TURNS             GEN_LATEST // In Gen5+, binding moves last for 4-5 turns instead of 2-5 turns. (With Grip Claw, 7 and 5 turns respectively.)
#define B_UPROAR_TURNS              GEN_LATEST // In Gen5+, Uproar lasts for 3 turns instead of 2-5 turns.
#define B_UPROAR_IGNORE_SOUNDPROOF  GEN_LATEST // In Gen5+, Uproar status ignores Soundproof.
#define B_DISABLE_TURNS             GEN_LATEST // Disable's turns. See Cmd_disablelastusedattack.
#define B_TAILWIND_TURNS            GEN_LATEST // In Gen5+, Tailwind lasts 4 turns instead of 3.
#define B_SLEEP_TURNS               GEN_LATEST // In Gen5+, sleep lasts for 1-3 turns instead of 2-5 turns.
#define B_TAUNT_TURNS               GEN_LATEST // In Gen5+, Taunt lasts 3 turns if the user acts before the target, or 4 turns if the target acted before the user. In Gen3, taunt lasts 2 turns and in Gen 4, 3-5 turns.
#define B_SPORT_TURNS               GEN_LATEST // In Gen6+, Water/Mud Sport last 5 turns, even if the user switches out.
#define B_MEGA_EVO_TURN_ORDER       GEN_LATEST // In Gen7, a Pokémon's Speed after Mega Evolution is used to determine turn order, not its Speed before.
#define B_RECALC_TURN_AFTER_ACTIONS GEN_LATEST // In Gen8, switching/using a move affects the current turn's order of actions, better known as dynamic speed.
#define B_FAINT_SWITCH_IN           GEN_LATEST // In Gen4+, sending out a new Pokémon after the previous one fainted happens at the end of the turn. Before, it would happen after each action.

// Move data settings
#define B_UPDATED_MOVE_DATA         GEN_LATEST // Updates move data in gMovesInfo, including Power, Accuracy, PP, stat changes, targets and chances of secondary effects.
#define B_UPDATED_MOVE_TYPES        GEN_LATEST // Updates move types.
#define B_UPDATED_MOVE_FLAGS        GEN_LATEST // Updates move flags.
#define B_PHYSICAL_SPECIAL_SPLIT    GEN_LATEST // In Gen3, the move's type determines if it will do physical or special damage. The split icon in the summary will reflect this.
#define B_RECOIL_IF_MISS_DMG        GEN_LATEST // In Gen5+, Jump Kick and High Jump Kick will always do half of the user's max HP when missing.
#define B_KLUTZ_FLING_INTERACTION   GEN_LATEST // In Gen5+, Pokémon with the Klutz ability can't use Fling.
#define B_UPDATED_CONVERSION        GEN_LATEST // In Gen6+, Conversion changes the user's type to match their first move's. Before, it would choose a move at random.
#define B_UPDATED_CONVERSION_2      GEN_LATEST // In Gen5+, Conversion 2 changes the user's type to a type that resists the last move used by the selected target. Before, it would consider the last move being successfully hit by. Additionally, Struggle is considered Normal type before Gen 5.
#define B_PP_REDUCED_BY_SPITE       GEN_LATEST // In Gen4+, Spite reduces the foe's last move's PP by 4, instead of 2 to 5.
#define B_EXTRAPOLATED_MOVE_FLAGS   TRUE       // Adds move flags to moves that they don't officially have but would likely have if they were in the latest core series game.

// Ability data settings
#define B_UPDATED_ABILITY_DATA      GEN_LATEST // Affects flags

// Move accuracy settings
#define B_TOXIC_NEVER_MISS          GEN_LATEST // In Gen6+, if Toxic is used by a Poison-type Pokémon, it will never miss.
#define B_MINIMIZE_DMG_ACC          GEN_LATEST // In Gen6+, moves that causes double damage to minimized Pokémon will also skip accuracy checks.
#define B_BLIZZARD_HAIL             GEN_LATEST // In Gen4+, Blizzard bypasses accuracy checks if it's hailing.
#define B_SHEER_COLD_ACC            GEN_LATEST // In Gen7+, Sheer Cold's base chance of hitting is reduced to 20% if the user isn't Ice-typed.

// Move stat change settings
#define B_FELL_STINGER_STAT_RAISE   GEN_LATEST // In Gen7+, it raises Atk by 3 stages instead of 2 if it causes the target to faint.
#define B_KINGS_SHIELD_LOWER_ATK    GEN_LATEST // In Gen8+, it lowers Atk by 1 stage instead of 2 of opponents that hit it.
#define B_SPEED_BUFFING_RAPID_SPIN  GEN_LATEST // In Gen8, Rapid Spin raises the user's Speed by 1 stage.
#define B_CHARGE_SPDEF_RAISE        GEN_LATEST // In Gen5+, Charge raises the user's Special Defense by 1 stage.
#define B_MINIMIZE_EVASION          GEN_LATEST // In Gen5+, Minimize raises evasion by 2 stages instead of 1.
#define B_GROWTH_STAT_RAISE         GEN_LATEST // In Gen5+, Growth raises Attack in addition to Special Attack by 1 stage each. Under the effects of the sun, it raises them by 2 stages each instead.
#define B_FOCUS_ENERGY_CRIT_RATIO   GEN_LATEST // In Gen3+, Focus Energy increases critical hit ratio by 2 instead of 1.

// Other move settings
#define B_INCINERATE_GEMS           GEN_LATEST // In Gen6+, Incinerate can destroy Gems.
#define B_CAN_SPITE_FAIL            GEN_LATEST // In Gen4+, Spite can no longer fail if the foe's last move only has 1 remaining PP.
#define B_CRASH_IF_TARGET_IMMUNE    GEN_LATEST // In Gen4+, The user of Jump Kick or High Jump Kick will "keep going and crash" if it attacks a target that is immune to the move.
#define B_MEMENTO_FAIL              GEN_LATEST // In Gen4+, Memento fails if there is no target or if the target is protected or behind substitute. But not if Atk/Sp. Atk are at -6.
#define B_GLARE_GHOST               GEN_LATEST // In Gen4+, Glare can hit Ghost-type Pokémon normally.
#define B_SKILL_SWAP                GEN_LATEST // In Gen4+, Skill Swap triggers switch-in abilities after use.
#define B_BRICK_BREAK               GEN_LATEST // In Gen4+, you can destroy your own side's screens. In Gen 5+, screens are not removed if the target is immune.
#define B_WISH_HP_SOURCE            GEN_LATEST // In Gen5+, Wish heals half of the user's max HP instead of the target's.
#define B_RAMPAGE_CANCELLING        GEN_LATEST // In Gen5+, a failed Thrash, etc, will cancel except on its last turn.
#define B_HEAL_BLOCKING             GEN_LATEST // In Gen5+, Heal Block prevents healing by Black Sludge, Leftovers, Shell Bell. Affected Pokémon will not consume held HP-restoring Berries or Berry Juice.
                                               // Draining abilities will not heal but will prevent damage. In Gen6+, Heal Block prevents the use of most HP-draining moves.
#define B_ROOTED_GROUNDING          GEN_LATEST // In Gen4+, Ingrain causes the affected Pokémon to become grounded.
#define B_METRONOME_MOVES           GEN_LATEST // This config will determine up to which generation will Metronome pull moves from.
#define B_TELEPORT_BEHAVIOR         GEN_LATEST // In LGPE onwards (Gen8+ here), Teleport allows the user to swap out with another party member.
#define B_BEAT_UP                   GEN_LATEST // In Gen5+, Beat Up uses a different formula to calculate its damage, and deals Dark-type damage. Prior to Gen 5, each hit also announces the party member's name.
#define B_DARK_VOID_FAIL            GEN_LATEST // In Gen7+, only Darkrai can use Dark Void.
#define B_BURN_HIT_THAW             GEN_LATEST // In Gen6+, damaging moves with a chance of burn will thaw the target, regardless if they're fire-type moves or not.
#define B_HEALING_WISH_SWITCH       GEN_LATEST // In Gen5+, the mon receiving Healing Wish is sent out at the end of the turn.
                                               // Additionally, in gen8+ the Healing Wish's effect will be stored until the user switches into a statused or hurt mon.
#define B_DEFOG_EFFECT_CLEARING     GEN_LATEST // In Gen6+, Defog clears Spikes, Toxic Spikes, Stealth Rock and Sticky Web from both sides. In Gen8+, Defog also clears active Terrain.
#define B_STOCKPILE_RAISES_DEFS     GEN_LATEST // In Gen4+, Stockpile also raises Defense and Sp. Defense stats. Once Spit Up / Swallow is used, these stat changes are lost.
#define B_TRANSFORM_SHINY           GEN_LATEST // In Gen4+, Transform will copy the shiny state of the opponent instead of maintaining its own shiny state.
#define B_TRANSFORM_FORM_CHANGES    GEN_LATEST // In Gen5+, Transformed Pokemon cannot change forms.
#define B_WIDE_GUARD                GEN_LATEST // In Gen5 only, Wide Guard has a chance to fail if used consecutively.
#define B_QUICK_GUARD               GEN_LATEST // In Gen5 only, Quick Guard has a chance to fail if used consecutively.
#define B_IMPRISON                  GEN_LATEST // In Gen5+, Imprison doesn't fail if opposing pokemon don't have any moves the user knows.
#define B_ALLY_SWITCH_FAIL_CHANCE   GEN_LATEST // In Gen9, using Ally Switch consecutively decreases the chance of success for each consecutive use.
#define B_SKETCH_BANS               GEN_LATEST // In Gen9+, Sketch is unable to copy more moves than in previous generations.
#define B_KNOCK_OFF_REMOVAL         GEN_LATEST // In Gen5+, Knock Off removes the foe's item instead of rendering it unusable.
#define B_HEAL_BELL_SOUNDPROOF      GEN_LATEST // In Gen5, Heal Bell affects all mons with Soundproof.  In Gen6-8 it affects inactive mons, but not battlers. In Gen9 it always affects the user.
#define B_CHARGE                    GEN_LATEST // In Gen8-, Charge status is lost regardless of the typing of the next move.
#define B_POWDER_RAIN               GEN_LATEST // In Gen7+, Powder doesn't damage the user of a Fire type move in heavy rain.
#define B_AFTER_YOU_TURN_ORDER      GEN_LATEST // In Gen8+, After You doesn't fail if the turn order wouldn't change after use.
#define B_QUASH_TURN_ORDER          GEN_LATEST // In Gen8+, Quash-affected battlers move according to speed order. Before Gen8, Quash-affected battlers move in the order they were affected by Quash.
#define B_DESTINY_BOND_FAIL         GEN_LATEST // In Gen7+, Destiny Bond fails if used repeatedly.
#define B_PURSUIT_TARGET            GEN_LATEST // In Gen4+, Pursuit attacks a switching opponent even if they weren't targeting them. Before Gen4, Pursuit only attacks a switching opponent that it originally targeted.
#define B_SKIP_RECHARGE             GEN_LATEST // In Gen1, recharging moves such as Hyper Beam skip the recharge if the target gets KO'd

// Ability settings
#define B_GALE_WINGS                GEN_LATEST // In Gen7+ requires full HP to trigger.
#define B_STANCE_CHANGE_FAIL        GEN_LATEST // In Gen7+, Stance Change fails if the Pokémon is unable to use a move because of confusion, paralysis, etc. In Gen6, it doesn't.
#define B_SHADOW_TAG_ESCAPE         GEN_LATEST // In Gen4+, if both sides have a Pokémon with Shadow Tag, all battlers can escape. Before, neither side could escape this situation.
#define B_MOODY_ACC_EVASION         GEN_LATEST // In Gen8, Moody CANNOT raise Accuracy and Evasion anymore.
#define B_FLASH_FIRE_FROZEN         GEN_LATEST // In Gen5+, Flash Fire can trigger even when frozen, when it couldn't before.
#define B_SYNCHRONIZE_TOXIC         GEN_LATEST // In Gen5+, if a Pokémon with Synchronize is badly poisoned, the opponent will also become badly poisoned. Previously, the opponent would become regular poisoned.
#define B_UPDATED_INTIMIDATE        GEN_LATEST // In Gen8, Intimidate doesn't work on opponents with the Inner Focus, Scrappy, Own Tempo or Oblivious abilities. It also activates Rattled.
#define B_OBLIVIOUS_TAUNT           GEN_LATEST // In Gen6+, Pokémon with Oblivious can't be taunted.
#define B_STURDY                    GEN_LATEST // In Gen5+, Sturdy causes the Pokémon to have 1 HP remaining if another Pokémon's attack or confusion damage would have brought it from full health to 0 HP.
#define B_PLUS_MINUS_INTERACTION    GEN_LATEST // In Gen5+, Plus and Minus can be activated with themselves and the opposite ability. Before, only the opposing ability could activate it.
#define B_WEATHER_FORMS             GEN_LATEST // In Gen5+, Castform and Cherrim revert to their base form upon losing their respective ability. Cherrim needs Flower Gift to swap forms.
#define B_SYMBIOSIS_GEMS            GEN_LATEST // In Gen7+, Symbiosis passes an item after a gem-boosted attack. Previously, items are passed before the gem-boosted attack hits, making the item effect apply.
#define B_ABSORBING_ABILITY_STRING  GEN_LATEST // In Gen5+, the abilities that absorb moves of a certain type use a generic string for stat increases and decreases.
#define B_REDIRECT_ABILITY_IMMUNITY GEN_LATEST // In Gen5+, Pokémon with Lightning Rod/Storm Drain become immune to Electric/Water-type moves and increase their Sp. Attack by 1 stage on top of the redirecting effect.
#define B_REDIRECT_ABILITY_ALLIES   GEN_LATEST // In Gen4+, Lightning Rod/Storm Drain redirect ally's moves as well.
#define B_LEAF_GUARD_PREVENTS_REST  GEN_LATEST // In Gen5+, Leaf Guard prevents the use of Rest in harsh sunlight.
#define B_TRANSISTOR_BOOST          GEN_LATEST // In Gen9+, Transistor will only boost Electric-type moves by 1.3x as opposed to 1.5x.
#define B_ILLUMINATE_EFFECT         GEN_LATEST // In Gen9+, Illuminate prevents accuracy reductions and ignores the target's evasion.
#define B_WEAK_ARMOR_SPEED          GEN_LATEST // In Gen7+, Weak Armor raises Speed by 2 stages instead of 1 when hit by a physical move.
#define B_PROTEAN_LIBERO            GEN_LATEST // In Gen9+, Protean and Libero change the user's type only once per Battle.
#define B_INTREPID_SWORD            GEN_LATEST // In Gen9+, Intrepid Sword raises Attack by one stage only once per Battle.
#define B_DAUNTLESS_SHIELD          GEN_LATEST // In Gen9+, Dauntless Shield raises Defense by one stage only once per Battle.
#define B_DISGUISE_HP_LOSS          GEN_LATEST // In Gen8+, when a Disguised Mimikyu's Disguise is busted, upon changing to its Busted Form it loses HP equal to 1/8 of its maximum HP.
#define B_ABILITY_TRIGGER_CHANCE    GEN_LATEST // In Gen3, Shed Skin, Cute Charm, Flame Body, Static and Poison Point have a 1/3 chance to trigger. In Gen 4+ it's 30%.
                                               // In Gen3, Effect Spore has a 10% chance to sleep, poison or paralyze, with an equal chance.
                                               // In Gen4, it's 30%. In Gen5+ it has 11% to sleep, 9% chance to poison and 10% chance to paralyze.
#define B_PICKUP_WILD               GEN_LATEST // In Gen9+, Pickup allows its user to pickup its own used item at the end of the turn in wild battles.
#define B_MAGIC_GUARD               GEN_LATEST // In Gen4 only, Magic Guard ignores immobilization caused by paralysis
#define B_BATTLE_BOND               GEN_LATEST // In Gen9+, Battle Bond increases Atk, SpAtk and Speed by one stage, once per battle
#define B_ATE_MULTIPLIER            GEN_LATEST // In Gen7+, -ate abilities (Aerilate, Galvanize, Normalize, Pixilate, Refrigerate) multiply damage by 1.2. Otherwise, it's 1.3, except Normalize which has no multiplier.

// Item settings
#define B_HP_BERRIES                GEN_LATEST // In Gen4+, berries which restore HP activate immediately after HP drops to half. In Gen3, the effect occurs at the end of the turn.
#define B_BERRIES_INSTANT           GEN_LATEST // In Gen4+, most berries activate on battle start/switch-in if applicable. In Gen3, they only activate either at the move end or turn end.
#define B_CONFUSE_BERRIES_HEAL      GEN_LATEST // Before Gen7, Figy and similar berries restore 1/8th of HP and trigger at half HP. In Gen7 they restore half HP, triggering at 25% HP. In Gen8 they heal 1/3rd of HP.
#define B_X_ITEMS_BUFF              GEN_LATEST // In Gen7+, the X Items raise a stat by 2 stages instead of 1.
#define B_MENTAL_HERB               GEN_LATEST // In Gen5+, the Mental Herb cures Taunt, Encore, Torment, Heal Block, and Disable in addition to Infatuation from before.
#define B_TRAINERS_KNOCK_OFF_ITEMS  TRUE       // If TRUE, trainers can steal/swap your items (non-berries are restored after battle). In vanilla games trainers cannot steal items.
#define B_RETURN_STOLEN_NPC_ITEMS   GEN_LATEST // In Gen5+, Thief and Covet no longer steal items from NPCs.
#define B_STEAL_WILD_ITEMS          GEN_LATEST // In Gen9, Thief and Covet steal a wild pokemon's item and send it to the bag. Before Gen9, the stolen item would be held by the Thief/Covet user.
#define B_RESTORE_HELD_BATTLE_ITEMS GEN_LATEST // In Gen9, all non-berry items are restored after battle.
#define B_SOUL_DEW_BOOST            GEN_LATEST // In Gens3-6, Soul Dew boosts Latis' Sp. Atk and Sp. Def. In Gen7+ it boosts the power of their Psychic and Dragon type moves instead.
#define B_NET_BALL_MODIFIER         GEN_LATEST // In Gen7+, Net Ball's catch multiplier is x5 instead of x3.
#define B_DIVE_BALL_MODIFIER        GEN_LATEST // In Gen4+, Dive Ball's effectiveness increases by x3.5 when Surfing or Fishing.
#define B_NEST_BALL_MODIFIER        GEN_LATEST // Nest Ball's formula varies depending on the Gen. See Cmd_handleballthrow.
#define B_REPEAT_BALL_MODIFIER      GEN_LATEST // In Gen7+, Repeat Ball's catch multiplier is x3.5 instead of x3.
#define B_TIMER_BALL_MODIFIER       GEN_LATEST // In Gen5+, Timer Ball's effectiveness increases by x0.3 per turn instead of x0.1
#define B_DUSK_BALL_MODIFIER        GEN_LATEST // In Gen7+, Dusk Ball's catch multiplier is x3 instead of x3.5.
#define B_QUICK_BALL_MODIFIER       GEN_LATEST // In Gen5+, Quick Ball's catch multiplier is x5 instead of x4.
#define B_LURE_BALL_MODIFIER        GEN_LATEST // In Gen8+, Lure Ball's catch multiplier is x4. In Gen7, it's x5. In Gen6 and earlier, it's x3.
#define B_HEAVY_BALL_MODIFIER       GEN_LATEST // In Gen7+, Heavy Ball's ranges change. See Cmd_handleballthrow.
#define B_DREAM_BALL_MODIFIER       GEN_LATEST // In Gen8+, Dream Ball's catch multiplier is x4 when the target is asleep or has the ability Comatose.
#define B_SPORT_BALL_MODIFIER       GEN_LATEST // In Gen8+, Sport Ball's catch multiplier was reduced from x1.5 to x1.
#define B_SAFARI_BALL_MODIFIER      GEN_LATEST // In Gen8+, Safari Ball's catch multiplier was reduced from x1.5 to x1.
#define B_FRIEND_BALL_MODIFIER      GEN_LATEST // In Gen8+, Friend Ball's friendship boost was reduced from 200 to 150.
#define B_SERENE_GRACE_BOOST        GEN_LATEST // In Gen5+, Serene Grace boosts the added flinch chance of King's Rock and Razor Fang.
#define B_IRON_BALL                 GEN_LATEST // In Gen5+, Flying-type Pokemon holding Iron Ball take x1 damage from Ground-type moves regardless of their other types, except during Inverse Battles or if the Pokemon is grounded by any other effect.

// Flag settings
// To use the following features, change the 0 for a flag present in include/constants/flags.h, preferably an unused one.
// Eg: You may rename FLAG_UNUSED_0x264 to a descriptive name and use it below.

// Badge boost flags
#define B_FLAG_BADGE_BOOST_ATTACK   FLAG_BADGE01_GET // If this flag is set and B_BADGE_BOOST == GEN_3, it will multiply the player's Pokémon's Attack by x1.1
#define B_FLAG_BADGE_BOOST_DEFENSE  FLAG_BADGE05_GET // If this flag is set and B_BADGE_BOOST == GEN_3, it will multiply the player's Pokémon's Defense by x1.1
#define B_FLAG_BADGE_BOOST_SPEED    FLAG_BADGE03_GET // If this flag is set and B_BADGE_BOOST == GEN_3, it will multiply the player's Pokémon's Speed by x1.1
#define B_FLAG_BADGE_BOOST_SPATK    FLAG_BADGE07_GET // If this flag is set and B_BADGE_BOOST == GEN_3, it will multiply the player's Pokémon's Sp. Atk by x1.1
#define B_FLAG_BADGE_BOOST_SPDEF    FLAG_BADGE07_GET // If this flag is set and B_BADGE_BOOST == GEN_3, it will multiply the player's Pokémon's Sp. Def by x1.1
// Other battle flags
#define B_FLAG_INVERSE_BATTLE       0     // If this flag is set, the battle's type effectiveness are inversed. For example, fire is super effective against water.
#define B_FLAG_FORCE_DOUBLE_WILD    0     // If this flag is set, all land and surfing wild battles will be double battles.
#define B_SMART_WILD_AI_FLAG        0     // If this flag is set, wild Pokémon will become smart, with all AI flags enabled.
#define B_FLAG_NO_BAG_USE           0     // If this flag is set, the ability to use the bag in battle is disabled.
#define B_FLAG_NO_CATCHING          0     // If this flag is set, the ability to catch wild Pokémon is disabled.
#define B_FLAG_NO_RUNNING           0     // If this flag is set, the ability to escape from wild battles is disabled. Also makes Roar/Whirlwind and Teleport (under Gen8) fail.
#define B_FLAG_AI_VS_AI_BATTLE      0     // If this flag is set, the player's mons will be controlled by the ai next battles.
#define B_FLAG_DYNAMAX_BATTLE       0     // If this flag is set, the ability to Dynamax in battle is enabled for all trainers.
#define B_FLAG_TERA_ORB_CHARGED     0     // If this flag is set, the Tera Orb is charged. It is automatically set upon healing and cleared upon Terastallizing once configured.
#define B_FLAG_TERA_ORB_NO_COST     0     // If this flag is set, the Tera Orb does not use up its charge upon Terastallization. In S/V, this occurs after an event with Terapagos.
#define B_FLAG_SLEEP_CLAUSE         0     // If this flag is set, sleep clause is enabled; if the player / AI has already put a Pokémon on the opponent's side to sleep and it is still sleeping, another one can't be put to sleep. AI requires AI_FLAG_CHECK_BAD_MOVE to understand.
#define B_FLAG_NO_WHITEOUT          0     // If this flag is set, the player can not white out against Trainers. Please note that the party is not healed automatically!

// Var Settings
// To use the following features, change the 0 for a var present in include/constants/vars.h, preferably an unused one.
// Eg: You may rename VAR_UNUSED_0x404E to a descriptive name and use it below.
#define B_VAR_STARTING_STATUS       0     // If this var has a value, assigning a STATUS_FIELD_xx_TERRAIN to it before battle causes the battle to start with that terrain active.
                                          // This var should never remain non-zero long enough for the player to save.
#define B_VAR_STARTING_STATUS_TIMER 0     // If this var has a value greater or equal than 1 field terrains will last that number of turns, otherwise they will last until they're overwritten.
#define B_VAR_WILD_AI_FLAGS         0     // If not 0, you can use this var to add to default wild AI flags. IMPORTANT: NOT usable with flags above (1 << 15)
                                          // This var should never remain non-zero long enough for the player to save.
                                          // For better wild AI handling, edit GetWildAiFlags() in src/battle_ai_main.c

#define B_VAR_DIFFICULTY            0     // If not 0, you can use this var to control which difficulty version of a Trainer is loaded. This should be manually set by the developer using Script_SetDifficulty AFTER NewGameInitData has run.

// Sky Battles
#define B_FLAG_SKY_BATTLE                 0     // If this flag has a value, the player will be able to engage in scripted Sky Battles.
#define B_VAR_SKY_BATTLE                  0     // If this var has a value, the game will remember the positions of Pokémon used in Sky Battles.
#define B_SKY_BATTLE_STRICT_ELIGIBILITY   FALSE // If TRUE, Sky Battles will use the eligibility from Pokémon XY. If FALSE, all Flying-types or Pokémon with Levitate are allowed.

// Flag and Var settings
#define B_RESET_FLAGS_VARS_AFTER_WHITEOUT TRUE // If TRUE, Overworld_ResetBattleFlagsAndVars will reset battle-related Flags and Vars when the player whites out.

// Ingame partner flag
#define B_SHOW_PARTNER_TARGET             FALSE // Shows the battler partner will target.

// Move description menu
#define B_SHOW_MOVE_DESCRIPTION     TRUE       // Shows move information in battler

// Weather settings
// Search for 'rain', 'sunny day', and 'hail' for move-specific or species-specific weather interactions.
#define B_ICE_WEATHER_BOTH              0
#define B_ICE_WEATHER_HAIL              1
#define B_ICE_WEATHER_SNOW              2

#define B_ABILITY_WEATHER               GEN_LATEST // In Gen6+, ability-induced weather lasts 5 turns. Before, it lasted until the battle ended or until it was changed by a move or a different weather-affecting ability.
#define B_SANDSTORM_SPDEF_BOOST         GEN_LATEST // In Gen4+, Sandstorm weather multiplies the Sp. Defense of Rock-type Pokémon by x1.5.
#define B_OVERWORLD_FOG                 GEN_LATEST // In Gen8+, overworld Fog summons Misty Terrain in battle. In Gen4 only, overworld Fog summons the unique fog weather condition in battle.
#define B_OVERWORLD_SNOW                GEN_LATEST // In Gen9+, overworld Snow will summon snow instead of hail in battle.
#define B_SNOW_WARNING                  GEN_LATEST // In Gen9+, Snow Warning will summon snow instead of hail.
#define B_PREFERRED_ICE_WEATHER         B_ICE_WEATHER_BOTH // Toggles Hail move effects to Snow and vice versa.

// Terrain settings
#define B_TERRAIN_BG_CHANGE         TRUE       // If set to TRUE, terrain moves permanently change the default battle background until the effect fades.
#define B_THUNDERSTORM_TERRAIN      TRUE       // If TRUE, overworld Thunderstorm generates Rain and Electric Terrain as in Gen 8.
#define B_TERRAIN_TYPE_BOOST        GEN_LATEST // In Gen8, damage is boosted by 30% instead of 50%.
#define B_SECRET_POWER_EFFECT       GEN_LATEST // Secret Power's effects change depending on terrain and generation. See MOVE_EFFECT_SECRET_POWER's case in `SetMoveEffect`.
#define B_SECRET_POWER_ANIMATION    GEN_LATEST // Secret Power's animations change depending on terrain and generation.
#define B_NATURE_POWER_MOVES        GEN_LATEST // Nature Power calls different moves depending on terrain and generation. See sNaturePowerMoves.
#define B_CAMOUFLAGE_TYPES          GEN_LATEST // Camouflage changes the user to different types depending on terrain and generation. See sTerrainToType.
#define B_NEW_TERRAIN_BACKGROUNDS   FALSE      // If set to TRUE, uses new terrain backgrounds for Electric, Misty, Grassy and Psychic Terrain.

// Interface settings
#define B_ABILITY_POP_UP            TRUE  // In Gen5+, the Pokémon abilities are displayed in a pop-up, when they activate in battle.
#define B_FAST_INTRO_PKMN_TEXT      TRUE  // If set to TRUE, battle intro texts print at the same time as animation of a Pokémon, as opposing to waiting for the animation to end.
#define B_FAST_INTRO_NO_SLIDE       FALSE // If set to TRUE, the slide animation that happens at the beginning of the battle is skipped.
#define B_FAST_HP_DRAIN             TRUE  // If set to TRUE, HP bars will move faster.
#define B_FAST_EXP_GROW             TRUE  // If set to TRUE, EXP bars will move faster.
#define B_SHOW_TARGETS              TRUE  // If set to TRUE, all available targets, for moves hitting 2 or 3 Pokémon, will be shown before selecting a move.
#define B_SHOW_CATEGORY_ICON        TRUE  // If set to TRUE, it will show an icon in the summary and move relearner showing the move's category.
#define B_HIDE_HEALTHBOX_IN_ANIMS   TRUE  // If set to TRUE, hides healthboxes during move animations.
#define B_WAIT_TIME_MULTIPLIER      16    // This determines how long text pauses in battle last. Vanilla is 16. Lower values result in faster battles.
#define B_QUICK_MOVE_CURSOR_TO_RUN  FALSE // If set to TRUE, pushing B in the battle options against a wild encounter will move the cursor to the run option
#define B_RUN_TRAINER_BATTLE        TRUE  // If set to TRUE, players can run from Trainer battles. This is treated as a whiteout.
#define B_MOVE_DESCRIPTION_BUTTON   L_BUTTON // If set to a button other than B_LAST_USED_BALL_BUTTON, pressing this button will open the move description menu
#define B_SHOW_USELESS_Z_MOVE_INFO  FALSE // If set to TRUE, Z-moves without additional effects like newer gen status moves will say "no additional effect"
#define B_ANIMATE_MON_AFTER_KO      TRUE // If set to TRUE, if a Pokémon on the opposite site faints, the non-fainted Pokemon will display a victory animation.
#define B_SHOW_DYNAMAX_MESSAGE      FALSE // If set to TRUE, an additional battle message is shown after completing Dynamaxing/Gigantamaxing.

// Catching settings
#define B_SEMI_INVULNERABLE_CATCH       GEN_LATEST // In Gen4+, you cannot throw a ball against a Pokemon that is in a semi-invulnerable state (dig/fly/etc)
#define B_CATCHING_CHARM_BOOST          20         // % boost in Critical Capture odds if player has the Catching Charm.
#define B_CRITICAL_CAPTURE              TRUE       // If set to TRUE, Critical Capture will be enabled.
#define B_CRITICAL_CAPTURE_LOCAL_DEX    TRUE       // If set to FALSE, Critical Capture % is based off of the National Pokedex estimated by enabled generations.

#define B_LAST_USED_BALL            TRUE       // If TRUE, the "last used ball" feature from Gen 7 will be implemented
#define B_LAST_USED_BALL_BUTTON     R_BUTTON   // If last used ball is implemented, this button (or button combo) will trigger throwing the last used ball.
#define B_LAST_USED_BALL_CYCLE      TRUE       // If TRUE, then holding B_LAST_USED_BALL_BUTTON while pressing the D-Pad cycles through the balls
#define B_CATCH_SWAP_INTO_PARTY     GEN_LATEST // In Gen 7+, the option to swap the caught wild mon to the party will appear, allowing you to send a different mon to the box.
#define B_CATCH_SWAP_CHECK_HMS      TRUE       // If TRUE, the catch swap feature above will prevent returning mons to the box if they know HMs.

// Other settings
#define B_DOUBLE_WILD_CHANCE            0          // % chance of encountering two Pokémon in a Wild Encounter.
#define B_DOUBLE_WILD_REQUIRE_2_MONS    FALSE      // If set to TRUE, Wild Double Battles will default to Single Battles when the player only has 1 usable Pokémon, ignoring B_DOUBLE_WILD_CHANCE and B_FLAG_FORCE_DOUBLE_WILD.
#define B_MULTI_BATTLE_WHITEOUT         GEN_LATEST // In Gen4+, multi battles end when the Player and also their Partner don't have any more Pokémon to fight.
#define B_EVOLUTION_AFTER_WHITEOUT      GEN_LATEST // In Gen6+, Pokemon that qualify for evolution after battle will evolve even if the player loses.
#define B_WILD_NATURAL_ENEMIES          TRUE       // If set to TRUE, certain wild mon species will attack other species when partnered in double wild battles (eg. Zangoose vs Seviper)
#define B_AFFECTION_MECHANICS           TRUE       // In Gen6+, there's a stat called affection that can trigger different effects in battle. From LGPE onwards, those effects use friendship instead.
#define B_TRAINER_CLASS_POKE_BALLS      GEN_LATEST // In Gen7+, trainers will use certain types of Poké Balls depending on their trainer class.
#define B_TRAINER_MON_RANDOM_ABILITY    FALSE      // If this is set to TRUE a random legal ability will be generated for a trainer mon
#define B_OBEDIENCE_MECHANICS           GEN_LATEST // In PLA+ (here Gen8+), obedience restrictions also apply to non-outsider Pokémon, albeit based on their level met rather than actual level
#define B_USE_FROSTBITE                 FALSE      // In PLA, Frostbite replaces Freeze. Enabling this flag does the same here. Moves can still be cherry-picked to either Freeze or Frostbite. Freeze-Dry, Secret Power & Tri Attack depend on this config.
#define B_TOXIC_REVERSAL                GEN_LATEST // In Gen5+, bad poison will change to regular poison at the end of battles.
#define B_TRY_CATCH_TRAINER_BALL        GEN_LATEST // In Gen4+, trying to catch a Trainer's Pokémon does not consume the Poké Ball.
#define B_SLEEP_CLAUSE                  FALSE      // Enables Sleep Clause all the time in every case, overriding B_FLAG_SLEEP_CLAUSE. Use that for modularity.

#define NUM_BEEPS_GEN_LATEST            4                    // Loops 4 times
#define NUM_BEEPS_GEN_3                 -1                   // Loops infinitely
#define NUM_BEEPS_OFF                   0                    // Doesn't play at all
#define B_NUM_LOW_HEALTH_BEEPS          NUM_BEEPS_GEN_LATEST // This controls the number of times the "low health" beep will loop. Setting this value to NUM_BEEPS_OFF will disable the beep, while NUM_BEEPS_GEN_3 will loop infinitely. You can set this to any number you want, the defines listed are just for ease of use.

// Animation Settings
#define B_NEW_SWORD_PARTICLE            FALSE    // If set to TRUE, it updates Swords Dance's particle.
#define B_NEW_LEECH_SEED_PARTICLE       FALSE    // If set to TRUE, it updates Leech Seed's animation particle.
#define B_NEW_HORN_ATTACK_PARTICLE      FALSE    // If set to TRUE, it updates Horn Attack's horn particle.
#define B_NEW_ROCKS_PARTICLE            FALSE    // If set to TRUE, it updates rock particles.
#define B_NEW_LEAF_PARTICLE             FALSE    // If set to TRUE, it updates leaf particle.
#define B_NEW_EMBER_PARTICLES           FALSE    // If set to TRUE, it updates Ember's fire particle.
#define B_NEW_MEAN_LOOK_PARTICLE        FALSE    // If set to TRUE, it updates Mean Look's eye particle.
#define B_NEW_TEETH_PARTICLE            FALSE    // If set to TRUE, it updates Bite/Crunch teeth particle.
#define B_NEW_HANDS_FEET_PARTICLE       FALSE    // If set to TRUE, it updates chop/kick/punch particles.
#define B_NEW_SPIKES_PARTICLE           FALSE    // If set to TRUE, it updates Spikes particle.
#define B_NEW_FLY_BUBBLE_PARTICLE       FALSE    // If set to TRUE, it updates Fly's 'bubble' particle.
#define B_NEW_CURSE_NAIL_PARTICLE       FALSE    // If set to TRUE, it updates Curse's nail.
#define B_NEW_BATON_PASS_BALL_PARTICLE  FALSE    // If set to TRUE, it updates Baton Pass' Poké Ball sprite.
#define B_NEW_MORNING_SUN_STAR_PARTICLE FALSE    // If set to TRUE, it updates Morning Sun's star particles.
#define B_NEW_IMPACT_PALETTE            FALSE    // If set to TRUE, it updates the basic 'hit' palette.
#define B_NEW_SURF_PARTICLE_PALETTE     FALSE    // If set to TRUE, it updates Surf's wave palette.

// Poké Ball animation and sounds
#define B_ENEMY_THROW_BALLS          GEN_LATEST  // In GEN_6+, enemy Trainers throw Poké Balls into battle instead of them just appearing on the ground and opening.
#define B_ENEMY_THROW_BALLS_SOUND    GEN_LATEST  // In GEN_5+, enemy Trainer's Poké Balls make a sound when thrown to send out a Pokémon. This can only be used when B_ENEMY_THROW_BALLS is set to GEN_6 or later.
#define B_PLAYER_THROW_BALLS_SOUND   GEN_LATEST  // In GEN_5+, the player's Poké Balls make a sound when thrown to send out a Pokémon.

#define SHOW_TYPES_NEVER    0                    // Never shows types in battle
#define SHOW_TYPES_ALWAYS   1                    // Always show types in battle
#define SHOW_TYPES_CAUGHT   2                    // Only show types if you've caught a species of the mon.
#define SHOW_TYPES_SEEN     3                    // Only show types if you've seen a species of the mon.
#define B_SHOW_TYPES        SHOW_TYPES_NEVER     // When to show type indicators next to Pokémon health bars in battle, while choosing a move after selecting a target Pokémon.

#define SHOW_EFFECTIVENESS_NEVER    0           // Never show effectiveness when selecting moves.
#define SHOW_EFFECTIVENESS_ALWAYS   1           // Always show effectiveness when selecting moves.
#define SHOW_EFFECTIVENESS_CAUGHT   2           // Only show effectiveness if you've caught a species of the mon.
#define SHOW_EFFECTIVENESS_SEEN     3           // Only show effectiveness if you've seen a species of the mon.
#define B_SHOW_EFFECTIVENESS        SHOW_EFFECTIVENESS_SEEN // If not SHOW_EFFECTIVENESS_NEVER, the PP string is replaced by a type effectiveness indicator based off the moves and the opposing side.

// Pokémon battle sprite settings
#define B_ENEMY_MON_SHADOW_STYLE        GEN_LATEST // In Gen4+, all enemy Pokemon will have a shadow drawn beneath them.

//  Battle UI settings
#define B_MOVE_REARRANGEMENT_IN_BATTLE  GEN_LATEST  //  In Gen 4+ move slots cannot be rearranged in battle

#define B_POOL_SETTING_CONSISTENT_RNG       FALSE    // If set to true, the same trainer will always generate the same pool on the same save file
#define B_POOL_SETTING_USE_FIXED_SEED       FALSE    // If set to true, will use the fixed seed defined in B_POOL_SETTING_FIXED_SEED
#define B_POOL_SETTING_FIXED_SEED           0x1D4127 // "Random" number, unless a mistake was made, it's へだら in Emerald charmap which should spell he-da-ra
#define B_POOL_RULE_SPECIES_CLAUSE          FALSE    // Only pick a single pokemon of a unique NatDex number
#define B_POOL_RULE_EXCLUDE_FORMS           FALSE    // Exclude different forms from the Species Clause
#define B_POOL_RULE_ITEM_CLAUSE             FALSE    // Only allow each item to be picked once
#define B_POOL_RULES_USE_ITEM_EXCLUSIONS    FALSE    // Exclude items listed in poolItemClauseExclusions

#endif // GUARD_CONFIG_BATTLE_H
