#include "battle_dynamax.h"
#include "battle_anim_scripts.h"
#include "constants/battle.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_script_commands.h"
#include "constants/battle_string_ids.h"
#include "constants/hold_effects.h"
#include "constants/moves.h"
#include "constants/contest.h"

// The Gen. 4+ contest data comes from urpg's contest movedex.

#if B_BINDING_TURNS >= GEN_5
#define BINDING_TURNS "4 or 5"
#else
#define BINDING_TURNS "2 to 5"
#endif

// Shared Move Description entries

const u8 gNotDoneYetDescription[] = _(
    "This move can't be\nused. Its "
    "effect\nis in development.");

static const u8 sNullDescription[] = _("");

static const u8 sMegaDrainDescription[] = _(
    "An attack that\nabsorbs "
    "half the\ndamage inflicted.");

#if B_SKIP_RECHARGE != GEN_1
static const u8 sHyperBeamDescription[] = _(
    "\nPowerful, but\nleaves the "
    "user\nimmobile the next\nturn.");
#else
static const u8 sHyperBeamDescription[] = _(
    "Leaves the user\nimmobile "
    "if target\nis not KO'd.");
#endif

static const u8 sRevengeDescription[] = _(
    "An attack that\nmoves last "
    "and\ngains power if\nhit.");

static const u8 sPluckDescription[] = _(
    "Eats the foe's\nheld Berry "
    "gaining\nits effect.");

static const u8 sHealingWishDescription[] = _(
    "The user faints to\nheal up "
    "the\nrecipient.");

static const u8 sWringOutDescription[] = _(
    "The higher the\nfoe's HP "
    "the more\ndamage caused.");

static const u8 sUTurnDescription[] = _(
    "Does damage then\nswitches "
    "out the\nuser.");

static const u8 sStormThrowDescription[] = _(
    "This attack always\nresults "
    "in a\ncritical hit.");

static const u8 sCircleThrowDescription[] = _(
    "Knocks foe away to\nswitch "
    "it out or\nend wild battle.");

static const u8 sChipAwayDescription[] = _(
    "Strikes through\nthe foe's "
    "stat\nchanges.");

static const u8 sHeavySlamDescription[] = _(
    "Does more damage\nif the "
    "user\noutweighs the foe.");

static const u8 sPsyshockDescription[] = _(
    "Attacks with a\npsychic wave "
    "that\ndoes physical\ndamage.");

static const u8 sLavaPlumeDescription[] = _(
    "Scarlet flames\ntorch "
    "everything\naround the user.");

static const u8 sShadowForceDescription[] = _(
    "Vanishes on the\nfirst turn "
    "then\nstrikes the next\nturn.");

static const u8 sFalseSwipeDescription[] = _(
    "An attack that\nleaves the "
    "foe\nwith at least 1\nHP.");

static const u8 sDrainingKissDescription[] = _(
    "An attack that\nabsorbs over "
    "half\nthe damage\ninflicted.");

static const u8 sCloseCombatDescription[] = _(
    "A strong attack\nbut lowers "
    "the\ndefensive stats.");

static const u8 sHyperspaceHoleDescription[] = _(
    "Uses a warp hole\nto attack. "
    "Can't\nbe evaded.");

static const u8 sSuckerPunchDescription[] = _(
    "Strikes first if\nthe foe "
    "is\npreparing an\nattack.");

static const u8 sFeintDescription[] = _(
    "An attack that\nhits foes "
    "using\nmoves like\nProtect.");

static const u8 sProtectDescription[] = _(
    "Evades attack, but\nmay fail "
    "if used\nin succession.");

static const u8 sGMaxOneBlowDescription[] = _(
    "G-max Urshifu\nattack. "
    "Ignores\nMax Guard.");

const struct MoveInfo gMovesInfo[MOVES_COUNT_ALL] =
{
    [MOVE_NONE] =
    {
        .name = COMPOUND_STRING("-"),
        .description = COMPOUND_STRING(""),
        .effect = EFFECT_HIT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 0,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .mirrorMoveBanned = TRUE,
        .sketchBanned = TRUE,
        .assistBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_None,
    },

    [MOVE_POUND] =
    {
        .name = COMPOUND_STRING("Pound"),
        .description = COMPOUND_STRING(
            "Pounds the foe\nwith "
            "forelegs or\ntail."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS == GEN_4,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_POUND,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Pound,
    },

    [MOVE_KARATE_CHOP] =
    {
        .name = COMPOUND_STRING("Karate Chop"),
        .description = COMPOUND_STRING(
            "A chopping attack\nwith a "
            "high\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = B_UPDATED_MOVE_TYPES >= GEN_2 ? TYPE_FIGHTING : TYPE_NORMAL,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_KarateChop,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DOUBLE_SLAP] =
    {
        .name = COMPOUND_STRING("Double Slap"),
        .description = COMPOUND_STRING(
            "Repeatedly slaps\nthe foe "
            "2 to 5\ntimes."),
        .effect = EFFECT_HIT,
        .power = 15,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_POUND},
        .battleAnimScript = gBattleAnimMove_DoubleSlap,
        .validApprenticeMove = TRUE,
    },

    [MOVE_COMET_PUNCH] =
    {
        .name = COMPOUND_STRING("Comet Punch"),
        .description = COMPOUND_STRING(
            "Repeatedly punches\nthe foe "
            "2 to 5\ntimes."),
        .effect = EFFECT_HIT,
        .power = 18,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CometPunch,
    },

    [MOVE_MEGA_PUNCH] =
    {
        .name = COMPOUND_STRING("Mega Punch"),
        .description = COMPOUND_STRING(
            "A strong punch\nthrown with "
            "\nincredible power."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_MegaPunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PAY_DAY] =
    {
        .name = COMPOUND_STRING("Pay Day"),
        .description = COMPOUND_STRING(
            "Throws coins at\nthe foe. "
            "Money is\nrecovered after."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PAYDAY,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST : CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PayDay,
    },

    [MOVE_FIRE_PUNCH] =
    {
        .name = COMPOUND_STRING("Fire Punch"),
        .description = COMPOUND_STRING(
            "A fiery punch that\nmay burn "
            "the foe."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_FIRE_PUNCH,
        .contestComboMoves = {COMBO_STARTER_ICE_PUNCH, COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_THUNDER_PUNCH},
        .battleAnimScript = gBattleAnimMove_FirePunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ICE_PUNCH] =
    {
        .name = COMPOUND_STRING("Ice Punch"),
        .description = COMPOUND_STRING(
            "An icy punch that\nmay "
        #if B_USE_FROSTBITE == TRUE
            "leave the foe\nwith frostbite."),
        #else
            "freeze the\nfoe."),
        #endif
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_ICE_PUNCH,
        .contestComboMoves = {COMBO_STARTER_FIRE_PUNCH, COMBO_STARTER_THUNDER_PUNCH},
        .battleAnimScript = gBattleAnimMove_IcePunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_THUNDER_PUNCH] =
    {
        .name = COMPOUND_STRING("Thunder Punch"),
        .description = COMPOUND_STRING(
            "An electrified\npunch that "
            "may\nparalyze the foe."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_THUNDER_PUNCH,
        .contestComboMoves = {COMBO_STARTER_CHARGE, COMBO_STARTER_FIRE_PUNCH, COMBO_STARTER_ICE_PUNCH},
        .battleAnimScript = gBattleAnimMove_ThunderPunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SCRATCH] =
    {
        .name = COMPOUND_STRING("Scratch"),
        .description = COMPOUND_STRING(
            "Scratches the foe\nwith "
            "sharp claws."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SCRATCH,
        .contestComboMoves = {COMBO_STARTER_LEER},
        .battleAnimScript = gBattleAnimMove_Scratch,
    },

    [MOVE_VISE_GRIP] =
    {
        .name = COMPOUND_STRING("Vise Grip"),
        .description = COMPOUND_STRING(
            "Grips the foe with\nlarge and "
            "powerful\npincers."),
        .effect = EFFECT_HIT,
        .power = 55,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_VICE_GRIP,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ViseGrip,
    },

    [MOVE_GUILLOTINE] =
    {
        .name = COMPOUND_STRING("Guillotine"),
        .description = COMPOUND_STRING(
            "A powerful pincer\nattack "
            "that KOs if\nit hits."),
        .effect = EFFECT_OHKO,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 30,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_VICE_GRIP},
        .battleAnimScript = gBattleAnimMove_Guillotine,
        .validApprenticeMove = TRUE,
    },

    [MOVE_RAZOR_WIND] =
    {
        .name = COMPOUND_STRING("Razor Wind"),
        #if B_UPDATED_MOVE_DATA == GEN_3
            .description = COMPOUND_STRING(
                "A 2-turn\nmove that strikes "
                "\nthe foe on the 2nd\nturn."),
        #else
            .description = COMPOUND_STRING(
                "A 2-turn move with\na high "
                "\ncritical-hit ratio."),
        #endif
        .effect = EFFECT_TWO_TURNS_ATTACK,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_3 ? 100 : 75,
        #if B_UPDATED_MOVE_DATA >= GEN_4
            .criticalHitStage = 1,
        #elif B_UPDATED_MOVE_DATA == GEN_3
            .criticalHitStage = 0,
        #else
            .criticalHitStage = 2,
        #endif
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .windMove = B_EXTRAPOLATED_MOVE_FLAGS,
        .argument.twoTurnAttack = { .stringId =  STRINGID_PKMNWHIPPEDWHIRLWIND },
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RazorWind,
    },

    [MOVE_SWORDS_DANCE] =
    {
        .name = COMPOUND_STRING("Swords Dance"),
        .description = COMPOUND_STRING(
            "A fighting dance\nthat "
            "sharply\nraises Attack."),
        .effect = EFFECT_ATTACK_UP_2,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 20 : 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .danceMove = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_SWORDS_DANCE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SwordsDance,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CUT] =
    {
        .name = COMPOUND_STRING("Cut"),
        .description = COMPOUND_STRING(
            "Cuts the foe with\nsharp "
            "scythes,\nclaws, etc."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_NORMAL,
        .accuracy = 95,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SWORDS_DANCE},
        .battleAnimScript = gBattleAnimMove_Cut,
    },

    [MOVE_GUST] =
    {
        .name = COMPOUND_STRING("Gust"),
        .description = COMPOUND_STRING(
            "Strikes the foe\nwith a gust "
            "of\nwind whipped up by\nwings."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = B_UPDATED_MOVE_TYPES >= GEN_2 ? TYPE_FLYING : TYPE_NORMAL,
        .accuracy = 100,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_4) || (B_UPDATED_MOVE_FLAGS < GEN_3),
        .damagesAirborneDoubleDamage = B_UPDATED_MOVE_FLAGS >= GEN_2,
        .windMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Gust,
    },

    [MOVE_WING_ATTACK] =
    {
        .name = COMPOUND_STRING("Wing Attack"),
        .description = COMPOUND_STRING(
            "Strikes the foe\nwith wings "
            "spread\nwide."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_2 ? 60 : 35,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WingAttack,
    },

    [MOVE_WHIRLWIND] =
    {
        .name = COMPOUND_STRING("Whirlwind"),
        .description = COMPOUND_STRING(
            "Blows away the\nfoe, switches "
            "it\nout or ends wild\nbattle."),
        .effect = EFFECT_ROAR,
        .power = 0,
        .type = TYPE_NORMAL,
        #if B_UPDATED_MOVE_DATA >= GEN_6
            .accuracy = 0,
            .priority = -6,
        #elif B_UPDATED_MOVE_DATA >= GEN_3
            .accuracy = 100,
            .priority = -6,
        #elif B_UPDATED_MOVE_DATA == GEN_2
            .accuracy = 100,
            .priority = -1,
        #else
            .accuracy = 85,
            .priority = 0,
        #endif
        .pp = 20,
        .target = TARGET_SELECTED,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .windMove = TRUE,
        .ignoresProtect = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .ignoresSubstitute = TRUE,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .copycatBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_NEXT_APPEAL_LATER : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STEALTH_ROCK, COMBO_STARTER_SPIKES, COMBO_STARTER_TOXIC_SPIKES},
        .battleAnimScript = gBattleAnimMove_Whirlwind,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FLY] =
    {
        .name = COMPOUND_STRING("Fly"),
        .description = COMPOUND_STRING(
            "Flies up on the\nfirst turn, "
            "then\nstrikes the next\nturn."),
        .effect = EFFECT_SEMI_INVULNERABLE,
        .power = B_UPDATED_MOVE_DATA >= GEN_4 ? 90 : 70,
        .type = TYPE_FLYING,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .gravityBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .argument.twoTurnAttack = { .stringId =  STRINGID_PKMNFLEWHIGH, .status = STATE_ON_AIR },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Fly,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BIND] =
    {
        .name = COMPOUND_STRING("Bind"),
        .description = COMPOUND_STRING(
            "Binds and squeezes\nthe foe "
            "for "BINDING_TURNS"\nturns."),
        .effect = EFFECT_HIT,
        .power = 15,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 85 : 75,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_BIND,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_VICE_GRIP},
        .battleAnimScript = gBattleAnimMove_Bind,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SLAM] =
    {
        .name = COMPOUND_STRING("Slam"),
        .description = COMPOUND_STRING(
            "Slams the foe with\na long "
            "tail, vine,\netc."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = 75,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_POUND},
        .battleAnimScript = gBattleAnimMove_Slam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_VINE_WHIP] =
    {
        .name = COMPOUND_STRING("Vine Whip"),
        .description = COMPOUND_STRING(
            "Strikes the foe\nwith "
            "slender,\nwhiplike vines."),
        #if B_UPDATED_MOVE_DATA >= GEN_6
            .pp = 25,
        #elif B_UPDATED_MOVE_DATA >= GEN_4
            .pp = 15,
        #else
            .pp = 10,
        #endif
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 45 : 35,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_VineWhip,
    },

    [MOVE_STOMP] =
    {
        .name = COMPOUND_STRING("Stomp"),
        .description = COMPOUND_STRING(
            "Stomps the enemy\nwith a big "
            "foot.\nMay cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS >= GEN_2,
        .skyBattleBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_LEER},
        .battleAnimScript = gBattleAnimMove_Stomp,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DOUBLE_KICK] =
    {
        .name = COMPOUND_STRING("Double Kick"),
        .description = COMPOUND_STRING(
            "A double-kicking\nattack "
            "that\nstrikes the foe\ntwice."),
        .effect = EFFECT_HIT,
        .power = 30,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .strikeCount = 2,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DoubleKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MEGA_KICK] =
    {
        .name = COMPOUND_STRING("Mega Kick"),
        .description = COMPOUND_STRING(
            "An extremely\npowerful kick "
            "with\nintense force."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_NORMAL,
        .accuracy = 75,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_MegaKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_JUMP_KICK] =
    {
        .name = COMPOUND_STRING("Jump Kick"),
        .description = COMPOUND_STRING(
            "A strong jumping\nkick. May "
            "miss and\nhurt the kicker."),
        #if B_UPDATED_MOVE_DATA >= GEN_5
            .power = 100,
        #elif B_UPDATED_MOVE_DATA == GEN_4
            .power = 85,
        #else
            .power = 70,
        #endif
        .effect = EFFECT_RECOIL_IF_MISS,
        .type = TYPE_FIGHTING,
        .accuracy = 95,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 10 : 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .gravityBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_JumpKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROLLING_KICK] =
    {
        .name = COMPOUND_STRING("Rolling Kick"),
        .description = COMPOUND_STRING(
            "A fast kick\ndelivered from "
            "a\nrapid spin. May\nflinch."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_FIGHTING,
        .accuracy = 85,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RollingKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SAND_ATTACK] =
    {
        .name = COMPOUND_STRING("Sand Attack"),
        .description = COMPOUND_STRING(
            "Reduces the foe's\naccuracy "
            "by\nhurling sand in\nits face."),
        .effect = EFFECT_ACCURACY_DOWN,
        .power = 0,
        .type = B_UPDATED_MOVE_TYPES >= GEN_2 ? TYPE_GROUND : TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_SAND_ATTACK,
        .contestComboMoves = {COMBO_STARTER_MUD_SLAP, COMBO_STARTER_SANDSTORM},
        .battleAnimScript = gBattleAnimMove_SandAttack,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HEADBUTT] =
    {
        .name = COMPOUND_STRING("Headbutt"),
        .description = COMPOUND_STRING(
            "A ramming attack\nthat may "
            "cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_Headbutt,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HORN_ATTACK] =
    {
        .name = COMPOUND_STRING("Horn Attack"),
        .description = COMPOUND_STRING(
            "Jabs the foe with\nsharp "
            "horns."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_HORN_ATTACK,
        .contestComboMoves = {COMBO_STARTER_LEER},
        .battleAnimScript = gBattleAnimMove_HornAttack,
    },

    [MOVE_FURY_ATTACK] =
    {
        .name = COMPOUND_STRING("Fury Attack"),
        .description = COMPOUND_STRING(
            "Jabs the foe 2 to\n5 times "
            "with sharp\nhorns, etc."),
        .effect = EFFECT_HIT,
        .power = 15,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HORN_ATTACK, COMBO_STARTER_PECK},
        .battleAnimScript = gBattleAnimMove_FuryAttack,
    },

    [MOVE_HORN_DRILL] =
    {
        .name = COMPOUND_STRING("Horn Drill"),
        .description = COMPOUND_STRING(
            "A one-hit KO\nattack that "
            "uses a\nhorn like a drill."),
        .effect = EFFECT_OHKO,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 30,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HORN_ATTACK},
        .battleAnimScript = gBattleAnimMove_HornDrill,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TACKLE] =
    {
        .name = COMPOUND_STRING("Tackle"),
        .description = COMPOUND_STRING(
            "Charges the foe\nwith a full- "
            "body\ntackle."),
        #if B_UPDATED_MOVE_DATA >= GEN_7
            .power = 40,
        #elif B_UPDATED_MOVE_DATA >= GEN_5
            .power = 50,
        #else
            .power = 35,
        #endif
        .effect = EFFECT_HIT,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 100 : 95,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_DEFENSE_CURL, COMBO_STARTER_HARDEN, COMBO_STARTER_LEER},
        .battleAnimScript = gBattleAnimMove_Tackle,
    },

    [MOVE_BODY_SLAM] =
    {
        .name = COMPOUND_STRING("Body Slam"),
        .description = COMPOUND_STRING(
            "A full-body slam\nthat may "
            "cause\nparalysis."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .skyBattleBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BodySlam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WRAP] =
    {
        .name = COMPOUND_STRING("Wrap"),
        .description = COMPOUND_STRING(
            "Wraps and squeezes\nthe foe "
            BINDING_TURNS"\ntimes with vines,\netc."),
        .effect = EFFECT_HIT,
        .power = 15,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 90 : 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_WRAP,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Wrap,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TAKE_DOWN] =
    {
        .name = COMPOUND_STRING("Take Down"),
        .description = COMPOUND_STRING(
            "A reckless charge\nattack "
            "that also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = 90,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 25 },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_HARDEN},
        .battleAnimScript = gBattleAnimMove_TakeDown,
        .validApprenticeMove = TRUE,
    },

    [MOVE_THRASH] =
    {
        .name = COMPOUND_STRING("Thrash"),
        .description = COMPOUND_STRING(
            "A rampage of 2 to\n3 turns "
            "that\nconfuses the user."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 120 : 90,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 10 : 20,
        .target = TARGET_RANDOM,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .instructBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_THRASH,
            .self = TRUE,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAGE},
        .battleAnimScript = gBattleAnimMove_Thrash,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DOUBLE_EDGE] =
    {
        .name = COMPOUND_STRING("Double-Edge"),
        .description = COMPOUND_STRING(
            "A life-risking\ntackle that "
            "also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = B_UPDATED_MOVE_DATA >= GEN_2 ? 120 : 100,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = B_UPDATED_MOVE_DATA >= GEN_3 ? 33 : 25 },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_HARDEN},
        .battleAnimScript = gBattleAnimMove_DoubleEdge,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TAIL_WHIP] =
    {
        .name = COMPOUND_STRING("Tail Whip"),
        .description = COMPOUND_STRING(
            "Wags the tail to\nlower the "
            "foe's\nDefense."),
        .effect = EFFECT_DEFENSE_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARM},
        .battleAnimScript = gBattleAnimMove_TailWhip,
    },

    [MOVE_POISON_STING] =
    {
        .name = COMPOUND_STRING("Poison Sting"),
        .description = COMPOUND_STRING(
            "A toxic attack\nwith barbs, "
            "etc.,\nthat may poison."),
        .effect = EFFECT_HIT,
        .power = 15,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 30 : 20,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PoisonSting,
    },

    [MOVE_TWINEEDLE] =
    {
        .name = COMPOUND_STRING("Twineedle"),
        .description = COMPOUND_STRING(
            "Foreleg stingers\njab foe "
            "twice. May\npoison."),
        .effect = EFFECT_HIT,
        .power = 25,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .strikeCount = 2,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 20,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_SAME_TYPE : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Twineedle,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PIN_MISSILE] =
    {
        .name = COMPOUND_STRING("Pin Missile"),
        .description = COMPOUND_STRING(
            "Sharp pins are\nfired to "
            "strike 2\nto 5 times."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 25 : 14,
        .type = TYPE_BUG,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 95 : 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PinMissile,
    },

    [MOVE_LEER] =
    {
        .name = COMPOUND_STRING("Leer"),
        .description = COMPOUND_STRING(
            "Frightens the foes\nwith a "
            "leer to\nlower Defense."),
        .effect = EFFECT_DEFENSE_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_LEER,
        .contestComboMoves = {COMBO_STARTER_RAGE, COMBO_STARTER_SCARY_FACE},
        .battleAnimScript = gBattleAnimMove_Leer,
    },

    [MOVE_BITE] =
    {
        .name = COMPOUND_STRING("Bite"),
        .description = COMPOUND_STRING(
            "Bites with vicious\nfangs. "
            "May cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = B_UPDATED_MOVE_TYPES >= GEN_2 ? TYPE_DARK : TYPE_NORMAL,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 30 : 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_LEER, COMBO_STARTER_SCARY_FACE},
        .battleAnimScript = gBattleAnimMove_Bite,
        .validApprenticeMove = TRUE,
    },

    [MOVE_GROWL] =
    {
        .name = COMPOUND_STRING("Growl"),
        .description = COMPOUND_STRING(
            "Growls cutely to\nreduce the "
            "foe's\nAttack."),
        .effect = EFFECT_ATTACK_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 40,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARM},
        .battleAnimScript = gBattleAnimMove_Growl,
    },

    [MOVE_ROAR] =
    {
        .name = COMPOUND_STRING("Roar"),
        .description = COMPOUND_STRING(
            "Switches the foe\nout "
            "or ends wild\nbattle."),
        .effect = EFFECT_ROAR,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 0 : 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        #if B_UPDATED_MOVE_DATA >= GEN_3
            .priority = -6,
        #elif B_UPDATED_MOVE_DATA == GEN_2
            .priority = -1,
        #else
            .priority = 0,
        #endif
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .soundMove = TRUE,
        .copycatBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_NEXT_APPEAL_LATER : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STEALTH_ROCK, COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE, COMBO_STARTER_SPIKES, COMBO_STARTER_TOXIC_SPIKES},
        .battleAnimScript = gBattleAnimMove_Roar,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SING] =
    {
        .name = COMPOUND_STRING("Sing"),
        .description = COMPOUND_STRING(
            "A soothing song\nlulls the "
            "foe into\na deep slumber."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 55,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = TRUE,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_SING,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Sing,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SUPERSONIC] =
    {
        .name = COMPOUND_STRING("Supersonic"),
        .description = COMPOUND_STRING(
            "Emits bizarre\nsound waves "
            "that\nmay confuse the\nfoe."),
        .effect = EFFECT_CONFUSE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 55,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = TRUE,
        .soundMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Supersonic,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SONIC_BOOM] =
    {
        .name = COMPOUND_STRING("Sonic Boom"),
        .description = COMPOUND_STRING(
            "Launches shock\nwaves that "
            "always\ninflict 20 HP\ndamage."),
        .effect = EFFECT_FIXED_HP_DAMAGE,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .fixedDamage = 20 },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SonicBoom,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DISABLE] =
    {
        .name = COMPOUND_STRING("Disable"),
        .description = COMPOUND_STRING(
        #if B_DISABLE_TURNS >= GEN_5
            "For 4 turns,\nprevents foe "
        #elif B_DISABLE_TURNS == GEN_4
            "For\n4-7 turns,\nprevents foe "
        #else
            "For 2-5 turns,\nprevents foe "
        #endif
            "from using last\nused move."),
        #if B_UPDATED_MOVE_DATA >= GEN_5
            .accuracy = 100,
        #elif B_UPDATED_MOVE_DATA == GEN_4
            .accuracy = 80,
        #else
            .accuracy = 55,
        #endif
        .effect = EFFECT_DISABLE,
        .power = 0,
        .type = TYPE_NORMAL,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresSubstitute = TRUE,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Disable,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ACID] =
    {
        .name = COMPOUND_STRING("Acid"),
        .description = COMPOUND_STRING(
            "Sprays a\nhide-melting acid.\n"
        #if B_UPDATED_MOVE_DATA >= GEN_4
            "May lower Sp. Def."),
        #else
            "May lower Defense."),
        #endif
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
            .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = B_UPDATED_MOVE_DATA >= GEN_4 ? MOVE_EFFECT_SP_DEF_MINUS_1 : MOVE_EFFECT_DEF_MINUS_1,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 10 : 33,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Acid,
    },

    [MOVE_EMBER] =
    {
        .name = COMPOUND_STRING("Ember"),
        .description = COMPOUND_STRING(
            "A weak fire attack\nthat may "
            "inflict a\nburn."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_Ember,
    },

    [MOVE_FLAMETHROWER] =
    {
        .name = COMPOUND_STRING("Flamethrower"),
        .description = COMPOUND_STRING(
            "A powerful fire\nattack that "
            "may\ninflict a burn."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 95,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_Flamethrower,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MIST] =
    {
        .name = COMPOUND_STRING("Mist"),
        .description = COMPOUND_STRING(
            "Creates a mist\nthat stops "
            "\nreduction of stats."),
        .effect = EFFECT_MIST,
        .power = 0,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Mist,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WATER_GUN] =
    {
        .name = COMPOUND_STRING("Water Gun"),
        .description = COMPOUND_STRING(
            "Squirts water to\nattack "
            "the foe."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MUD_SPORT, COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_WATER_SPORT},
        .battleAnimScript = gBattleAnimMove_WaterGun,
    },

    [MOVE_HYDRO_PUMP] =
    {
        .name = COMPOUND_STRING("Hydro Pump"),
        .description = COMPOUND_STRING(
            "Blasts water at\nhigh power "
            "to\nstrike the foe."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 110 : 120,
        .type = TYPE_WATER,
        .accuracy = 80,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_HydroPump,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SURF] =
    {
        .name = COMPOUND_STRING("Surf"),
        .description = COMPOUND_STRING(
            "Creates a huge\nwave, then "
        #if B_UPDATED_MOVE_DATA >= GEN_4
            "crashes\nit down on the\nfield."),
        #else
            "crashes\nit down on the\nfoes."),
        #endif
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 95,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 15,
        .target = B_UPDATED_MOVE_DATA >= GEN_4 ? TARGET_FOES_AND_ALLY : TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .damagesUnderwater = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MONS : CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_SURF,
        .contestComboMoves = {COMBO_STARTER_DIVE, COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Surf,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ICE_BEAM] =
    {
        .name = COMPOUND_STRING("Ice Beam"),
        .description = COMPOUND_STRING(
            "Blasts the foe\nwith an icy "
        #if B_USE_FROSTBITE == TRUE
            "beam.\nMay cause\nfrostbite."),
        #else
            "beam\nthat may freeze\nit."),
        #endif
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 95,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            // The following effect is also relevant in battle_Pike.c
            // If you cherry-pick this to use something other than the config, make sure to update it there too
            .moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_IceBeam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BLIZZARD] =
    {
        .name = COMPOUND_STRING("Blizzard"),
        .description = COMPOUND_STRING(
            "Hits the foes with\nan icy "
        #if B_USE_FROSTBITE == TRUE
            "storm. May\ncause frostbite."),
        #else
            "storm that\nmay freeze it."),
        #endif
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 110 : 120,
        .type = TYPE_ICE,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_2 ? 70 : 90,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .alwaysHitsInHailSnow = B_BLIZZARD_HAIL >= GEN_4,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL, COMBO_STARTER_POWDER_SNOW},
        .battleAnimScript = gBattleAnimMove_Blizzard,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PSYBEAM] =
    {
        .name = COMPOUND_STRING("Psybeam"),
        .description = COMPOUND_STRING(
            "Fires a peculiar\nray that "
            "may\nconfuse the foe."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_Psybeam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BUBBLE_BEAM] =
    {
        .name = COMPOUND_STRING("Bubble Beam"),
        .description = COMPOUND_STRING(
            "Forcefully sprays\nbubbles "
            "that may\nlower Speed."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 10 : 33,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_BubbleBeam,
    },

    [MOVE_AURORA_BEAM] =
    {
        .name = COMPOUND_STRING("Aurora Beam"),
        .description = COMPOUND_STRING(
            "Fires a\nrainbow-colored "
            "\nbeam that may\nlower Attack."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 10 : 33,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_AuroraBeam,
    },

    [MOVE_HYPER_BEAM] =
    {
        .name = COMPOUND_STRING("Hyper Beam"),
        .description = sHyperBeamDescription,
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HyperBeam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PECK] =
    {
        .name = COMPOUND_STRING("Peck"),
        .description = COMPOUND_STRING(
            "Attacks the foe\nwith a "
            "jabbing\nbeak, etc."),
        .effect = EFFECT_HIT,
        .power = 35,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_PECK,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Peck,
    },

    [MOVE_DRILL_PECK] =
    {
        .name = COMPOUND_STRING("Drill Peck"),
        .description = COMPOUND_STRING(
            "A corkscrewing\nattack with "
            "the\nbeak acting as a\ndrill."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_PECK},
        .battleAnimScript = gBattleAnimMove_DrillPeck,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SUBMISSION] =
    {
        .name = COMPOUND_STRING("Submission"),
        .description = COMPOUND_STRING(
            "A reckless body\nslam that "
            "also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = 80,
        .type = TYPE_FIGHTING,
        .accuracy = 80,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 20 : 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .argument = { .recoilPercentage = 25 },
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_Submission,
        .validApprenticeMove = TRUE,
    },

    [MOVE_LOW_KICK] =
    {
        .name = COMPOUND_STRING("Low Kick"),
        #if B_UPDATED_MOVE_DATA >= GEN_3
            .description = COMPOUND_STRING(
                "A\nkick that inflicts\nmore "
                "damage on\nheavier foes."),
            .effect = EFFECT_LOW_KICK,
        #else
            .description = COMPOUND_STRING(
                "A low, tripping\nkick that "
                "may\ncause flinching."),
            .effect = EFFECT_HIT,
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_FLINCH,
                .chance = 30,
            }),
        #endif
        .power = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 50,
        .type = TYPE_FIGHTING,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_3 ? 100 : 90,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WHEN_LATER : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LowKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_COUNTER] =
    {
        .name = COMPOUND_STRING("Counter"),
        .description = COMPOUND_STRING(
            "Retaliates any\nphysical hit "
            "with\ndouble the power."),
        .effect = EFFECT_REFLECT_DAMAGE,
        .power = 1,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_DEPENDS,
        .priority = -5,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .argument = {
            .reflectDamage.damagePercent = 200,
            .reflectDamage.damageCategories = 1u << DAMAGE_CATEGORY_PHYSICAL,
        },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS < GEN_5,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS >= GEN_4,
        .meFirstBanned = TRUE,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_2,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_TAUNT, COMBO_STARTER_ENCORE, COMBO_STARTER_TORMENT},
        .battleAnimScript = gBattleAnimMove_Counter,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SEISMIC_TOSS] =
    {
        .name = COMPOUND_STRING("Seismic Toss"),
        .description = COMPOUND_STRING(
            "Inflicts damage\nidentical "
            "to the\nuser's level."),
        .effect = EFFECT_LEVEL_DAMAGE,
        .power = 1,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FAKE_OUT, COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE},
        .battleAnimScript = gBattleAnimMove_SeismicToss,
        .validApprenticeMove = TRUE,
    },

    [MOVE_STRENGTH] =
    {
        .name = COMPOUND_STRING("Strength"),
        .description = COMPOUND_STRING(
            "Builds enormous\npower, "
            "then slams\nthe foe."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Strength,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ABSORB] =
    {
        .name = COMPOUND_STRING("Absorb"),
        .description = COMPOUND_STRING(
            "An attack that\nabsorbs "
            "half the\ndamage inflicted."),
        .effect = EFFECT_ABSORB,
        .power = 20,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_4 ? 25 : 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 50 },
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_Absorb,
    },

    [MOVE_MEGA_DRAIN] =
    {
        .name = COMPOUND_STRING("Mega Drain"),
        .description = sMegaDrainDescription,
        .effect = EFFECT_ABSORB,
        .power = 40,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_4 ? 15 : 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 50 },
        .zMove = { .powerOverride = 120 },
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_MegaDrain,
    },

    [MOVE_LEECH_SEED] =
    {
        .name = COMPOUND_STRING("Leech Seed"),
        .description = COMPOUND_STRING(
            "Plants a seed on\nthe foe to "
            "steal\nHP on every turn."),
        .effect = EFFECT_LEECH_SEED,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS : CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_LEECH_SEED,
        .contestComboMoves = {COMBO_STARTER_GROWTH, COMBO_STARTER_WORRY_SEED, COMBO_STARTER_ROTOTILLER},
        .battleAnimScript = gBattleAnimMove_LeechSeed,
        .validApprenticeMove = TRUE,
    },

    [MOVE_GROWTH] =
    {
        .name = COMPOUND_STRING("Growth"),
        .description = COMPOUND_STRING(
        #if B_GROWTH_STAT_RAISE >= GEN_5
            "Forces the body to\ngrow, "
            "raising\nAttack and Sp.\nAtk."),
        #else
            "Forces the body to\ngrow "
            "and heightens\nSp. Atk."),
        #endif
        .effect = B_GROWTH_STAT_RAISE >= GEN_5 ? EFFECT_GROWTH : EFFECT_SPECIAL_ATTACK_UP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 20 : 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_GROWTH,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_Growth,
        .validApprenticeMove = TRUE,
    },

    [MOVE_RAZOR_LEAF] =
    {
        .name = COMPOUND_STRING("Razor Leaf"),
        .description = COMPOUND_STRING(
            "Cuts enemies with\nleaves. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 55,
        .type = TYPE_GRASS,
        .accuracy = 95,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 25,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .slicingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_RazorLeaf,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SOLAR_BEAM] =
    {
        .name = COMPOUND_STRING("Solar Beam"),
        .description = COMPOUND_STRING(
            "Absorbs light in\none turn, "
            "then\nattacks next turn."),
        .effect = EFFECT_SOLAR_BEAM,
        .power = 120,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .argument.twoTurnAttack = { .stringId =  STRINGID_PKMNTOOKSUNLIGHT, .weather = B_WEATHER_SUN },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH, COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_SolarBeam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_POISON_POWDER] =
    {
        .name = COMPOUND_STRING("Poison Powder"),
        .description = COMPOUND_STRING(
            "Scatters a toxic\npowder "
            "that may\npoison the foe."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 75,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_POISON },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .powderMove = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_POISON_POWDER,
        .contestComboMoves = {COMBO_STARTER_SWEET_SCENT},
        .battleAnimScript = gBattleAnimMove_PoisonPowder,
        .validApprenticeMove = TRUE,
    },

    [MOVE_STUN_SPORE] =
    {
        .name = COMPOUND_STRING("Stun Spore"),
        .description = COMPOUND_STRING(
            "Scatters a powder\nthat may "
            "paralyze\nthe foe."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 75,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .magicCoatAffected = TRUE,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_PARALYSIS },
        .powderMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SWEET_SCENT},
        .battleAnimScript = gBattleAnimMove_StunSpore,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SLEEP_POWDER] =
    {
        .name = COMPOUND_STRING("Sleep Powder"),
        .description = COMPOUND_STRING(
            "Scatters a powder\nthat may "
            "cause the\nfoe to sleep."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 75,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .powderMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_SLEEP_POWDER,
        .contestComboMoves = {COMBO_STARTER_SWEET_SCENT},
        .battleAnimScript = gBattleAnimMove_SleepPowder,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PETAL_DANCE] =
    {
        .name = COMPOUND_STRING("Petal Dance"),
        .description = COMPOUND_STRING(
            "A rampage of 2 to\n3 turns "
            "that\nconfuses the user."),
        #if B_UPDATED_MOVE_DATA >= GEN_5
            .power = 120,
        #elif B_UPDATED_MOVE_DATA == GEN_4
            .power = 90,
        #else
            .power = 70,
        #endif
        .effect = EFFECT_HIT,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 10 : 20,
        .target = TARGET_RANDOM,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = TRUE,
        .danceMove = TRUE,
        .instructBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_THRASH,
            .self = TRUE,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_PetalDance,
        .validApprenticeMove = TRUE,
    },

    [MOVE_STRING_SHOT] =
    {
        .name = COMPOUND_STRING("String Shot"),
        .description = COMPOUND_STRING(
            "Binds the foe with\nstring "
            "to reduce\nits Speed."),
        .effect = B_UPDATED_MOVE_DATA >= GEN_6 ? EFFECT_SPEED_DOWN_2 : EFFECT_SPEED_DOWN,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 95,
        .pp = 40,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_STRING_SHOT,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_StringShot,
    },

    [MOVE_DRAGON_RAGE] =
    {
        .name = COMPOUND_STRING("Dragon Rage"),
        .description = COMPOUND_STRING(
            "Launches shock\nwaves that "
            "always\ninflict 40 HP\ndamage."),
        .effect = EFFECT_FIXED_HP_DAMAGE,
        .power = 1,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_4) || (B_UPDATED_MOVE_FLAGS < GEN_3),
        .argument = { .fixedDamage = 40 },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_DRAGON_RAGE,
        .contestComboMoves = {COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_DANCE, COMBO_STARTER_DRAGON_RUSH, COMBO_STARTER_DRAGON_TAIL},
        .battleAnimScript = gBattleAnimMove_DragonRage,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FIRE_SPIN] =
    {
        .name = COMPOUND_STRING("Fire Spin"),
        .description = COMPOUND_STRING(
            "Traps the foe in a\nring of "
            "fire for\n"BINDING_TURNS" turns."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 35 : 15,
        .type = TYPE_FIRE,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 85 : 70,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_FIRE_SPIN,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_FireSpin,
        .validApprenticeMove = TRUE,
    },

    [MOVE_THUNDER_SHOCK] =
    {
        .name = COMPOUND_STRING("Thunder Shock"),
        .description = COMPOUND_STRING(
            "An electrical\nattack that "
            "may\nparalyze the foe."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_ThunderShock,
    },

    [MOVE_THUNDERBOLT] =
    {
        .name = COMPOUND_STRING("Thunderbolt"),
        .description = COMPOUND_STRING(
            "A strong\nelectrical attack "
            "\nthat may paralyze\nthe foe."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 95,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_Thunderbolt,
        .validApprenticeMove = TRUE,
    },

    [MOVE_THUNDER_WAVE] =
    {
        .name = COMPOUND_STRING("Thunder Wave"),
        .description = COMPOUND_STRING(
            "A weak jolt of\nelectricity "
            "that\nparalyzes the foe."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_7 ? 90 : 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_PARALYSIS },
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS : CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_THUNDER_WAVE,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_ThunderWave,
        .validApprenticeMove = TRUE,
    },

    [MOVE_THUNDER] =
    {
        .name = COMPOUND_STRING("Thunder"),
        .description = COMPOUND_STRING(
            "A lightning attack\nthat may "
            "cause\nparalysis."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 110 : 120,
        .type = TYPE_ELECTRIC,
        .accuracy = 70,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .damagesAirborne = B_UPDATED_MOVE_FLAGS >= GEN_2,
        .alwaysHitsInRain = TRUE,
        .accuracy50InSun = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 30 : 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED : CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE, COMBO_STARTER_LOCK_ON, COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Thunder,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROCK_THROW] =
    {
        .name = COMPOUND_STRING("Rock Throw"),
        .description = COMPOUND_STRING(
            "Throws small rocks\nto "
            "strike the foe."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_ROCK,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_2 ? 90 : 65,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_ROCK_THROW,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RockThrow,
    },

    [MOVE_EARTHQUAKE] =
    {
        .name = COMPOUND_STRING("Earthquake"),
        .description = COMPOUND_STRING(
            "A powerful quake\nthat "
            "hits all\nother POKéMON."),
        .effect = EFFECT_EARTHQUAKE,
        .power = 100,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .damagesUnderground = B_UPDATED_MOVE_FLAGS >= GEN_2,
        .skyBattleBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_EARTHQUAKE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Earthquake,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FISSURE] =
    {
        .name = COMPOUND_STRING("Fissure"),
        .description = COMPOUND_STRING(
            "A one-hit KO move\nthat "
            "drops the foe\nin a fissure."),
        .effect = EFFECT_OHKO,
        .power = 1,
        .type = TYPE_GROUND,
        .accuracy = 30,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .damagesUnderground = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_EARTHQUAKE},
        .battleAnimScript = gBattleAnimMove_Fissure,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DIG] =
    {
        .name = COMPOUND_STRING("Dig"),
        .description = COMPOUND_STRING(
            "Digs underground\nthe first "
            "turn and\nstrikes next turn."),
        .effect = EFFECT_SEMI_INVULNERABLE,
        #if B_UPDATED_MOVE_DATA >= GEN_4
            .power = 80,
        #elif B_UPDATED_MOVE_DATA >= GEN_2
            .power = 60,
        #else
            .power = 100,
        #endif
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .skyBattleBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_PKMNDUGHOLE, .status = STATE_UNDERGROUND },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Dig,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TOXIC] =
    {
        .name = COMPOUND_STRING("Toxic"),
        .description = COMPOUND_STRING(
            "Poisons the foe\nwith an "
            "\nintensifying toxin."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 90 : 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_TOXIC },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .alwaysHitsOnSameType = B_TOXIC_NEVER_MISS >= GEN_6,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_TOXIC,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Toxic,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CONFUSION] =
    {
        .name = COMPOUND_STRING("Confusion"),
        .description = COMPOUND_STRING(
            "A psychic attack\nthat may "
            "cause\nconfusion."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_CONFUSION,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND, COMBO_STARTER_KINESIS, COMBO_STARTER_PSYCHIC},
        .battleAnimScript = gBattleAnimMove_Confusion,
    },

    [MOVE_PSYCHIC] =
    {
        .name = COMPOUND_STRING("Psychic"),
        .description = COMPOUND_STRING(
            "A powerful psychic\nattack "
            "that may\nlower Sp. Def."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 10 : 33,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_PSYCHIC,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND, COMBO_STARTER_CONFUSION, COMBO_STARTER_KINESIS},
        .battleAnimScript = gBattleAnimMove_Psychic,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HYPNOSIS] =
    {
        .name = COMPOUND_STRING("Hypnosis"),
        .description = COMPOUND_STRING(
            "A hypnotizing move\nthat "
            "may induce\nsleep."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 60,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_HYPNOSIS,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Hypnosis,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MEDITATE] =
    {
        .name = COMPOUND_STRING("Meditate"),
        .description = COMPOUND_STRING(
            "Meditates in a\npeaceful "
            "fashion\nto raise Attack."),
        .effect = EFFECT_ATTACK_UP,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_Meditate,
        .validApprenticeMove = TRUE,
    },

    [MOVE_AGILITY] =
    {
        .name = COMPOUND_STRING("Agility"),
        .description = COMPOUND_STRING(
            "Relaxes the body\nto sharply "
            "boost\nSpeed."),
        .effect = EFFECT_SPEED_UP_2,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_AGILITY,
        .contestComboMoves = {COMBO_STARTER_DOUBLE_TEAM},
        .battleAnimScript = gBattleAnimMove_Agility,
        .validApprenticeMove = TRUE,
    },

    [MOVE_QUICK_ATTACK] =
    {
        .name = COMPOUND_STRING("Quick Attack"),
        .description = COMPOUND_STRING(
            "An extremely fast\nattack "
            "that always\nstrikes first."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_DOUBLE_TEAM},
        .battleAnimScript = gBattleAnimMove_QuickAttack,
        .validApprenticeMove = TRUE,
    },

    [MOVE_RAGE] =
    {
        .name = COMPOUND_STRING("Rage"),
        .description = COMPOUND_STRING(
            "Raises the user's\nAttack "
            "every time\nit is hit."),
        .effect = EFFECT_HIT,
        .power = 20,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RAGE,
        }),
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS : CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_RAGE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Rage,
    },

    [MOVE_TELEPORT] =
    {
        .name = COMPOUND_STRING("Teleport"),
        #if B_TELEPORT_BEHAVIOR >= GEN_8
        .description = COMPOUND_STRING(
            "Switches\nthe user out last.\n"
            "Flees when used by\nwild {PKMN}."),
        #else
        .description = COMPOUND_STRING(
            "A psychic move for\nfleeing "
            "from\nbattle instantly."),
        #endif
        .effect = EFFECT_TELEPORT,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = B_UPDATED_MOVE_DATA >= GEN_8 ? -6 : 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CONFUSION, COMBO_STARTER_DOUBLE_TEAM, COMBO_STARTER_KINESIS, COMBO_STARTER_PSYCHIC},
        .battleAnimScript = gBattleAnimMove_Teleport,
    },

    [MOVE_NIGHT_SHADE] =
    {
        .name = COMPOUND_STRING("Night Shade"),
        .description = COMPOUND_STRING(
            "Inflicts damage\nidentical "
            "to the\nuser's level."),
        .effect = EFFECT_LEVEL_DAMAGE,
        .power = 1,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NightShade,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MIMIC] =
    {
        .name = COMPOUND_STRING("Mimic"),
        .description = COMPOUND_STRING(
            "Copies last move\nused by the "
            "foe\nduring one battle."),
        .effect = EFFECT_MIMIC,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_3 ? 0 : 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ACC_UP_1 },
        .ignoresSubstitute = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_2,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Mimic,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SCREECH] =
    {
        .name = COMPOUND_STRING("Screech"),
        .description = COMPOUND_STRING(
            "Emits a screech to\nsharply "
            "reduce the\nfoe's Defense."),
        .effect = EFFECT_DEFENSE_DOWN_2,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = TRUE,
        .soundMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Screech,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DOUBLE_TEAM] =
    {
        .name = COMPOUND_STRING("Double Team"),
        .description = COMPOUND_STRING(
            "Creates illusory\ncopies to "
            "raise\nevasiveness."),
        .effect = EFFECT_EVASION_UP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_DOUBLE_TEAM,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DoubleTeam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_RECOVER] =
    {
        .name = COMPOUND_STRING("Recover"),
        .description = COMPOUND_STRING(
            "Recovers up to\nhalf the "
            "user's\nmaximum HP."),
        #if B_UPDATED_MOVE_DATA >= GEN_9
            .pp = 5,
        #elif B_UPDATED_MOVE_DATA >= GEN_4
            .pp = 10,
        #else
            .pp = 20,
        #endif
        .effect = EFFECT_RESTORE_HP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_SAME_TYPE : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Recover,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HARDEN] =
    {
        .name = COMPOUND_STRING("Harden"),
        .description = COMPOUND_STRING(
            "Stiffens the\nbody's  "
            "muscles to\nraise Defense."),
        .effect = EFFECT_DEFENSE_UP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_HARDEN,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Harden,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MINIMIZE] =
    {
        .name = COMPOUND_STRING("Minimize"),
        .description = COMPOUND_STRING(
            "Minimizes the\nuser's size to "
        #if B_MINIMIZE_EVASION >= GEN_5
            "\nsharply raise\nevasiveness."),
        #else
            "\nraise evasiveness."),
        #endif
        .effect = EFFECT_MINIMIZE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 10 : 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Minimize,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SMOKESCREEN] =
    {
        .name = COMPOUND_STRING("Smokescreen"),
        .description = COMPOUND_STRING(
            "Lowers the foe's\naccuracy "
            "using\nsmoke, ink, etc."),
        .effect = EFFECT_ACCURACY_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SMOG},
        .battleAnimScript = gBattleAnimMove_Smokescreen,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CONFUSE_RAY] =
    {
        .name = COMPOUND_STRING("Confuse Ray"),
        .description = COMPOUND_STRING(
            "A sinister ray\nthat "
            "confuses the\nfoe."),
        .effect = EFFECT_CONFUSE,
        .power = 0,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ConfuseRay,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WITHDRAW] =
    {
        .name = COMPOUND_STRING("Withdraw"),
        .description = COMPOUND_STRING(
            "Withdraws the body\ninto its "
            "hard\nshell to raise\nDefense."),
        .effect = EFFECT_DEFENSE_UP,
        .power = 0,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Withdraw,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DEFENSE_CURL] =
    {
        .name = COMPOUND_STRING("Defense Curl"),
        .description = COMPOUND_STRING(
            "Curls up to\nconceal weak "
            "spots\nand raise Defense."),
        .effect = EFFECT_DEFENSE_CURL,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ACC_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_DEFENSE_CURL,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DefenseCurl,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BARRIER] =
    {
        .name = COMPOUND_STRING("Barrier"),
        .description = COMPOUND_STRING(
            "Creates a barrier\nthat "
            "sharply\nraises Defense."),
        .effect = EFFECT_DEFENSE_UP_2,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 20 : 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Barrier,
        .validApprenticeMove = TRUE,
    },

    [MOVE_LIGHT_SCREEN] =
    {
        .name = COMPOUND_STRING("Light Screen"),
        .description = COMPOUND_STRING(
            "Wall of light cuts\nspecial "
            "damage for\n5 turns."),
        .effect = EFFECT_LIGHT_SCREEN,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_LightScreen,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HAZE] =
    {
        .name = COMPOUND_STRING("Haze"),
        .description = COMPOUND_STRING(
            "Creates a black\nhaze that "
            "\neliminates all\nstat changes."),
        .effect = EFFECT_HAZE,
        .power = 0,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_Haze,
        .validApprenticeMove = TRUE,
    },

    [MOVE_REFLECT] =
    {
        .name = COMPOUND_STRING("Reflect"),
        .description = COMPOUND_STRING(
            "Wall of light cuts\nphysical "
            "damage\nfor 5 turns."),
        .effect = EFFECT_REFLECT,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_Reflect,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FOCUS_ENERGY] =
    {
        .name = COMPOUND_STRING("Focus Energy"),
        .description = COMPOUND_STRING(
            "Focuses power to\nraise the "
            "\ncritical-hit ratio."),
        .effect = EFFECT_FOCUS_ENERGY,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ACC_UP_1 },
        .argument = { .status = VOLATILE_FOCUS_ENERGY },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_FOCUS_ENERGY,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FocusEnergy,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BIDE] =
    {
        .name = COMPOUND_STRING("Bide"),
        .description = COMPOUND_STRING(
            "Endures attack for\n2 "
            "turns to\nretaliate double."),
        .effect = EFFECT_BIDE,
        .power = 1,
        .type = TYPE_NORMAL,
        #if B_UPDATED_MOVE_DATA >= GEN_4
            .accuracy = 0,
            .priority = 1,
        #elif B_UPDATED_MOVE_DATA >= GEN_2
            .accuracy = 100,
            .priority = 0,
        #else
            .accuracy = 0,
            .priority = 0,
        #endif
        .pp = 10,
        .target = TARGET_USER,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_NEXT_APPEAL_LATER : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Bide,
    },

    [MOVE_METRONOME] =
    {
        .name = COMPOUND_STRING("Metronome"),
        .description = COMPOUND_STRING(
            "Waggles a finger\nto use any "
            "\nPokémon move at\nrandom."),
        .effect = EFFECT_METRONOME,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = B_UPDATED_MOVE_FLAGS >= GEN_3,
        .instructBanned = TRUE,
        .encoreBanned = (B_UPDATED_MOVE_FLAGS >= GEN_7 || B_UPDATED_MOVE_FLAGS < GEN_3),
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Metronome,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MIRROR_MOVE] =
    {
        .name = COMPOUND_STRING("Mirror Move"),
        .description = COMPOUND_STRING(
            "Counters the foe's\nattack "
            "with the\nsame move."),
        .effect = EFFECT_MIRROR_MOVE,
        .power = 0,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_2 },
        .mimicBanned = TRUE,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_4,
        .copycatBanned = TRUE,
        .sleepTalkBanned = B_UPDATED_MOVE_FLAGS >= GEN_3,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MirrorMove,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SELF_DESTRUCT] =
    {
        .name = COMPOUND_STRING("Self-Destruct"),
        .description = COMPOUND_STRING(
            "Inflicts severe\ndamage but "
            "makes\nthe user faint."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_2 ? 200 : 130,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .explosion = TRUE,
        .parentalBondBanned = TRUE,
        .dampBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_BLOCK},
        .battleAnimScript = gBattleAnimMove_SelfDestruct,
        .validApprenticeMove = TRUE,
    },

    [MOVE_EGG_BOMB] =
    {
        .name = COMPOUND_STRING("Egg Bomb"),
        .description = COMPOUND_STRING(
            "An egg is forcibly\nhurled at "
            "the foe."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_NORMAL,
        .accuracy = 75,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ballisticMove = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SOFT_BOILED},
        .battleAnimScript = gBattleAnimMove_EggBomb,
        .validApprenticeMove = TRUE,
    },

    [MOVE_LICK] =
    {
        .name = COMPOUND_STRING("Lick"),
        .description = COMPOUND_STRING(
            "Licks with a long\ntongue to "
            "injure.\nMay also paralyze."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 30 : 20,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Lick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SMOG] =
    {
        .name = COMPOUND_STRING("Smog"),
        .description = COMPOUND_STRING(
            "An exhaust-gas\nattack "
            "that may\nalso poison."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 30 : 20,
        .type = TYPE_POISON,
        .accuracy = 70,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 40,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SMOG,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Smog,
    },

    [MOVE_SLUDGE] =
    {
        .name = COMPOUND_STRING("Sludge"),
        .description = COMPOUND_STRING(
            "Sludge is hurled\nto inflict "
            "damage.\nMay also poison."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 30 : 40,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SLUDGE,
        .contestComboMoves = {COMBO_STARTER_SLUDGE_BOMB},
        .battleAnimScript = gBattleAnimMove_Sludge,
    },

    [MOVE_BONE_CLUB] =
    {
        .name = COMPOUND_STRING("Bone Club"),
        .description = COMPOUND_STRING(
            "Clubs the foe with\na bone. "
            "May cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_GROUND,
        .accuracy = 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_BONE_CLUB,
        .contestComboMoves = {COMBO_STARTER_BONEMERANG, COMBO_STARTER_BONE_RUSH, COMBO_STARTER_SHADOW_BONE},
        .battleAnimScript = gBattleAnimMove_BoneClub,
    },

    [MOVE_FIRE_BLAST] =
    {
        .name = COMPOUND_STRING("Fire Blast"),
        .description = COMPOUND_STRING(
            "Incinerates\neverything it "
            "\nstrikes. May cause\na burn."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 110 : 120,
        .type = TYPE_FIRE,
        .accuracy = 85,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 10 : 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_FireBlast,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WATERFALL] =
    {
        .name = COMPOUND_STRING("Waterfall"),
        .description = COMPOUND_STRING(
            "Charges with speed\nto climb "
            "\nwaterfalls. May\nflinch."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        #if B_UPDATED_MOVE_DATA >= GEN_4
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_FLINCH,
                .chance = 20,
            }),
        #endif
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Waterfall,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CLAMP] =
    {
        .name = COMPOUND_STRING("Clamp"),
        .description = COMPOUND_STRING(
            "Traps and squeezes\nthe "
            "foe for "BINDING_TURNS"\nturns."),
        .effect = EFFECT_HIT,
        .power = 35,
        .type = TYPE_WATER,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 85 : 75,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 15 : 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_CLAMP,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Clamp,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SWIFT] =
    {
        .name = COMPOUND_STRING("Swift"),
        .description = COMPOUND_STRING(
            "Sprays star-shaped\nrays "
            "that never\nmiss."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Swift,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SKULL_BASH] =
    {
        .name = COMPOUND_STRING("Skull Bash"),
        .description = COMPOUND_STRING(
            "Tucks in the head,\nthen "
            "attacks on\nthe next turn."),
        .effect = EFFECT_TWO_TURNS_ATTACK,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 130 : 100,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 10 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_PKMNLOWEREDHEAD },
        #if B_UPDATED_MOVE_DATA >= GEN_2
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_DEF_PLUS_1,
                .self = TRUE,
                .onChargeTurnOnly = TRUE,
            }),
        #endif
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SkullBash,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPIKE_CANNON] =
    {
        .name = COMPOUND_STRING("Spike Cannon"),
        .description = COMPOUND_STRING(
            "Launches sharp\nspikes that "
            "strike\n2 to 5 times."),
        .effect = EFFECT_HIT,
        .power = 20,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SpikeCannon,
    },

    [MOVE_CONSTRICT] =
    {
        .name = COMPOUND_STRING("Constrict"),
        .description = COMPOUND_STRING(
            "Constricts to\ninflict pain. "
            "May\nlower Speed."),
        .effect = EFFECT_HIT,
        .power = 10,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 10 : 33,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Constrict,
    },

    [MOVE_AMNESIA] =
    {
        .name = COMPOUND_STRING("Amnesia"),
        .description = COMPOUND_STRING(
            "Forgets about\nsomething "
            "and\nsharply raises Sp.\nDef."),
        .effect = EFFECT_SPECIAL_DEFENSE_UP_2,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE : CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_AMNESIA,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Amnesia,
        .validApprenticeMove = TRUE,
    },

    [MOVE_KINESIS] =
    {
        .name = COMPOUND_STRING("Kinesis"),
        .description = COMPOUND_STRING(
            "Distracts the foe.\n"
            "May lower\naccuracy."),
        .effect = EFFECT_ACCURACY_DOWN,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 80,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_4,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_KINESIS,
        .contestComboMoves = {COMBO_STARTER_CONFUSION, COMBO_STARTER_PSYCHIC},
        .battleAnimScript = gBattleAnimMove_Kinesis,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SOFT_BOILED] =
    {
        .name = COMPOUND_STRING("Soft-Boiled"),
        .description = COMPOUND_STRING(
            "Recovers up to\nhalf the "
            "user's\nmaximum HP."),
        .effect = EFFECT_SOFTBOILED,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 5 : 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_FIRST : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_SOFT_BOILED,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SoftBoiled,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HIGH_JUMP_KICK] =
    {
        .name = COMPOUND_STRING("High Jump Kick"),
        .description = COMPOUND_STRING(
            "A jumping knee\nkick. If it "
            "\nmisses, the user\nis hurt."),
        #if B_UPDATED_MOVE_DATA >= GEN_5
            .power = 130,
        #elif B_UPDATED_MOVE_DATA == GEN_4
            .power = 100,
        #else
            .power = 85,
        #endif
        .effect = EFFECT_RECOIL_IF_MISS,
        .type = TYPE_FIGHTING,
        .accuracy = 90,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 10 : 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .gravityBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_HighJumpKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_GLARE] =
    {
        .name = COMPOUND_STRING("Glare"),
        .description = COMPOUND_STRING(
            "Intimidates and\nfrightens "
            "the foe\ninto paralysis."),
        #if B_UPDATED_MOVE_DATA >= GEN_6
            .accuracy = 100,
        #elif B_UPDATED_MOVE_DATA == GEN_5
            .accuracy = 90,
        #else
            .accuracy = 75,
        #endif
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_NORMAL,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_PARALYSIS },
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_SAME_TYPE : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_GLARE,
        .contestComboMoves = {COMBO_STARTER_LEER},
        .battleAnimScript = gBattleAnimMove_Glare,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DREAM_EATER] =
    {
        .name = COMPOUND_STRING("Dream Eater"),
        .description = COMPOUND_STRING(
            "Takes one half the\ndamage "
            "inflicted\non a sleeping foe."),
        .effect = EFFECT_DREAM_EATER,
        .power = 100,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 50 },
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND, COMBO_STARTER_HYPNOSIS, COMBO_STARTER_LOVELY_KISS, COMBO_STARTER_SPORE, COMBO_STARTER_SING, COMBO_STARTER_YAWN, COMBO_STARTER_DARK_VOID, COMBO_STARTER_GRASS_WHISTLE, COMBO_STARTER_SLEEP_POWDER},
        .battleAnimScript = gBattleAnimMove_DreamEater,
        .validApprenticeMove = TRUE,
    },

    [MOVE_POISON_GAS] =
    {
        .name = COMPOUND_STRING("Poison Gas"),
        .description = COMPOUND_STRING(
        #if B_UPDATED_MOVE_DATA >= GEN_5
            "Envelops the foes\nin a toxic "
        #else
            "Envelops the foe\nin a toxic "
        #endif
            "gas that may\npoison."),
        #if B_UPDATED_MOVE_DATA >= GEN_6
            .accuracy = 90,
        #elif B_UPDATED_MOVE_DATA == GEN_5
            .accuracy = 80,
        #else
            .accuracy = 55,
        #endif
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_POISON,
        .pp = 40,
        .target = B_UPDATED_MOVE_DATA >= GEN_5 ? TARGET_BOTH : TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_POISON },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_POISON_GAS,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PoisonGas,
    },

    [MOVE_BARRAGE] =
    {
        .name = COMPOUND_STRING("Barrage"),
        .description = COMPOUND_STRING(
            "Hurls round\nobjects at the "
            "foe\n2 to 5 times."),
        .effect = EFFECT_HIT,
        .power = 15,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .ballisticMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Barrage,
    },

    [MOVE_LEECH_LIFE] =
    {
        .name = COMPOUND_STRING("Leech Life"),
        .description = COMPOUND_STRING(
            "An attack that\nsteals half "
            "the\ndamage inflicted."),
        .effect = EFFECT_ABSORB,
        .power = B_UPDATED_MOVE_DATA >= GEN_7 ? 80 : 20,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_7 ? 10 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .absorbPercentage = 50 },
        .makesContact = TRUE,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LeechLife,
    },

    [MOVE_LOVELY_KISS] =
    {
        .name = COMPOUND_STRING("Lovely Kiss"),
        .description = COMPOUND_STRING(
            "Demands a kiss\nwith a scary "
            "face\nthat induces\nsleep."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 75,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_LOVELY_KISS,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LovelyKiss,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SKY_ATTACK] =
    {
        .name = COMPOUND_STRING("Sky Attack"),
        .description = COMPOUND_STRING(
            "2-turn attack.\nHigh critical "
            "hit\nratio, and may\nflinch."),
        .effect = EFFECT_TWO_TURNS_ATTACK,
        .power = 140,
        .type = TYPE_FLYING,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = B_UPDATED_MOVE_DATA >= GEN_4 ? STRINGID_CLOAKEDINAHARSHLIGHT : STRINGID_PKMNISGLOWING },
    #if B_UPDATED_MOVE_DATA >= GEN_3
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
    #endif
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SkyAttack,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TRANSFORM] =
    {
        .name = COMPOUND_STRING("Transform"),
        .description = COMPOUND_STRING(
            "Alters the user's\ncells to "
            "become a\ncopy of the foe."),
        .effect = EFFECT_TRANSFORM,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS < GEN_5,
        .mirrorMoveBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .copycatBanned = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Transform,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BUBBLE] =
    {
        .name = COMPOUND_STRING("Bubble"),
        .description = COMPOUND_STRING(
            "An attack using\nbubbles. "
            "May lower\nthe foe's Speed."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 40 : 20,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = B_UPDATED_MOVE_DATA >= GEN_2 ? 10 : 33,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Bubble,
    },

    [MOVE_DIZZY_PUNCH] =
    {
        .name = COMPOUND_STRING("Dizzy Punch"),
        #if B_UPDATED_MOVE_DATA >= GEN_2
            .description = COMPOUND_STRING(
                "A\nrhythmic punch\nthat may "
                "confuse\nthe target."),
        #else
            .description = COMPOUND_STRING(
                "The target is hit\nwith "
                "rhythmic\npunches."),
        #endif
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        #if B_UPDATED_MOVE_DATA >= GEN_2
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_CONFUSION,
                .chance = 20,
            }),
        #endif
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DizzyPunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPORE] =
    {
        .name = COMPOUND_STRING("Spore"),
        .description = COMPOUND_STRING(
            "Scatters a cloud\nof spores "
            "that\nalways induce\nsleep."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .magicCoatAffected = TRUE,
        .powderMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_SPORE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Spore,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FLASH] =
    {
        .name = COMPOUND_STRING("Flash"),
        .description = COMPOUND_STRING(
            "Looses a powerful\nblast of "
            "light\nthat cuts\naccuracy."),
        .effect = EFFECT_ACCURACY_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_4 ? 100 : 70,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Flash,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PSYWAVE] =
    {
        .name = COMPOUND_STRING("Psywave"),
        .description = COMPOUND_STRING(
            "Attacks with a\npsychic "
            "wave of\nvarying intensity."),
        .effect = EFFECT_PSYWAVE,
        .power = 1,
        .type = TYPE_PSYCHIC,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 100 : 80,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_Psywave,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPLASH] =
    {
        .name = COMPOUND_STRING("Splash"),
        .description = COMPOUND_STRING(
            "It's just a\nsplash... "
            "Has no\neffect whatsoever."),
        .effect = EFFECT_DO_NOTHING,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_3 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .gravityBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Splash,
    },

    [MOVE_ACID_ARMOR] =
    {
        .name = COMPOUND_STRING("Acid Armor"),
        .description = COMPOUND_STRING(
            "Liquifies the\nuser's body "
            "to\nsharply raise\nDefense."),
        .effect = EFFECT_DEFENSE_UP_2,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 20 : 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE : CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AcidArmor,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CRABHAMMER] =
    {
        .name = COMPOUND_STRING("Crabhammer"),
        .description = COMPOUND_STRING(
            "Hammers with a\npincer. Has a "
            "high\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 100 : 90,
        .type = TYPE_WATER,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 90 : 85,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SWORDS_DANCE},
        .battleAnimScript = gBattleAnimMove_Crabhammer,
        .validApprenticeMove = TRUE,
    },

    [MOVE_EXPLOSION] =
    {
        .name = COMPOUND_STRING("Explosion"),
        .description = COMPOUND_STRING(
            "Inflicts severe\ndamage but "
            "makes\nthe user faint."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_2 ? 250 : 170,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .explosion = TRUE,
        .parentalBondBanned = TRUE,
        .dampBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_BLOCK},
        .battleAnimScript = gBattleAnimMove_Explosion,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FURY_SWIPES] =
    {
        .name = COMPOUND_STRING("Fury Swipes"),
        .description = COMPOUND_STRING(
            "Rakes the foe with\nsharp "
            "claws, etc.,\n2 to 5 times."),
        .effect = EFFECT_HIT,
        .power = 18,
        .type = TYPE_NORMAL,
        .accuracy = 80,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SCRATCH},
        .battleAnimScript = gBattleAnimMove_FurySwipes,
    },

    [MOVE_BONEMERANG] =
    {
        .name = COMPOUND_STRING("Bonemerang"),
        .description = COMPOUND_STRING(
            "Throws a bone\nboomerang "
            "that\nstrikes twice."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_GROUND,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .strikeCount = 2,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_BONEMERANG,
        .contestComboMoves = {COMBO_STARTER_BONE_CLUB, COMBO_STARTER_BONE_RUSH, COMBO_STARTER_SHADOW_BONE},
        .battleAnimScript = gBattleAnimMove_Bonemerang,
        .validApprenticeMove = TRUE,
    },

    [MOVE_REST] =
    {
        .name = COMPOUND_STRING("Rest"),
        .description = COMPOUND_STRING(
            "The user sleeps\nfor 2 turns, "
            "\nrestoring HP and\nstatus."),
        .effect = EFFECT_REST,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 5 : 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_REST,
        .contestComboMoves = {COMBO_STARTER_BELLY_DRUM, COMBO_STARTER_CHARM, COMBO_STARTER_YAWN},
        .battleAnimScript = gBattleAnimMove_Rest,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROCK_SLIDE] =
    {
        .name = COMPOUND_STRING("Rock Slide"),
        #if B_UPDATED_MOVE_DATA >= GEN_2
            .description = COMPOUND_STRING(
                "Large\nboulders are\nhurled. "
                "May cause\nflinching."),
        #else
            .description = COMPOUND_STRING(
                "Hits the foe with\nan "
                "avalanche of\nrocks."),
        #endif
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_ROCK,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        #if B_UPDATED_MOVE_DATA >= GEN_2
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_FLINCH,
                .chance = 30,
            }),
        #endif
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MONS : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ROCK_THROW},
        .battleAnimScript = gBattleAnimMove_RockSlide,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HYPER_FANG] =
    {
        .name = COMPOUND_STRING("Hyper Fang"),
        .description = COMPOUND_STRING(
            "Attacks with sharp\nfangs. "
            "May cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HyperFang,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SHARPEN] =
    {
        .name = COMPOUND_STRING("Sharpen"),
        .description = COMPOUND_STRING(
            "Reduces the\npolygon count "
            "and\nraises Attack."),
        .effect = EFFECT_ATTACK_UP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Sharpen,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CONVERSION] =
    {
        .name = COMPOUND_STRING("Conversion"),
        .description = COMPOUND_STRING(
            "Changes the user's\ntype "
        #if B_UPDATED_CONVERSION >= GEN_6
            "into first\nknown move's type."),
        #else
            "into a known\nmove's type."),
        #endif
        .effect = EFFECT_CONVERSION,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Conversion,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TRI_ATTACK] =
    {
        .name = COMPOUND_STRING("Tri Attack"),
        #if B_UPDATED_MOVE_DATA >= GEN_2
            .description = COMPOUND_STRING(
                "Fires three\ntypes of beams. "
                #if B_USE_FROSTBITE == TRUE
                    "May\nburn/para/frostbite."),
                #else
                    "May\nburn/paralyze/freeze."),
                #endif
        #else
            .description = COMPOUND_STRING(
                "A triangular field\nof energy "
                "is\ncreated and\nlaunched."),
        #endif
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        #if B_UPDATED_MOVE_DATA >= GEN_2
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_TRI_ATTACK,
                .chance = 20,
            }),
        #endif
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_LOCK_ON},
        .battleAnimScript = gBattleAnimMove_TriAttack,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SUPER_FANG] =
    {
        .name = COMPOUND_STRING("Super Fang"),
        .description = COMPOUND_STRING(
            "Attacks with sharp\nfangs "
            "and cuts\nhalf the foe's HP."),
        .effect = EFFECT_FIXED_PERCENT_DAMAGE,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .damagePercentage = 50 },
        .makesContact = TRUE,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SCARY_FACE},
        .battleAnimScript = gBattleAnimMove_SuperFang,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SLASH] =
    {
        .name = COMPOUND_STRING("Slash"),
        .description = COMPOUND_STRING(
            "Slashes with\nclaws, etc. Has "
            "a\nhigh critical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SCRATCH, COMBO_STARTER_SWORDS_DANCE},
        .battleAnimScript = gBattleAnimMove_Slash,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SUBSTITUTE] =
    {
        .name = COMPOUND_STRING("Substitute"),
        .description = COMPOUND_STRING(
            "Creates a decoy\nusing 1/4 "
            "of the\nuser's maximum HP."),
        .effect = EFFECT_SUBSTITUTE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Substitute,
        .validApprenticeMove = TRUE,
    },

    [MOVE_STRUGGLE] =
    {
        .name = COMPOUND_STRING("Struggle"),
        .description = COMPOUND_STRING(
            "Used only if all\nPP are gone. "
            "Also\nhurts the user a\nlittle."),
        #if B_UPDATED_MOVE_DATA >= GEN_4
            .effect = EFFECT_STRUGGLE,
            .accuracy = 0,
            .pp = 1,
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_RECOIL_HP_25,
                .self = TRUE,
            }),
        #elif B_UPDATED_MOVE_DATA >= GEN_2
            .effect = EFFECT_RECOIL,
            .accuracy = 100,
            .pp = 1,
            .argument = { .recoilPercentage = 25 },
        #else
            .effect = EFFECT_RECOIL,
            .accuracy = 100,
            .pp = 10,
            .argument = { .recoilPercentage = 50 },
        #endif
        .power = 50,
        .type = TYPE_NORMAL,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .meFirstBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .copycatBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS >= GEN_4,
        .battleAnimScript = gBattleAnimMove_Struggle,
        .validApprenticeMove = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_TOUGH,
    },

    [MOVE_SKETCH] =
    {
        .name = COMPOUND_STRING("Sketch"),
        .description = COMPOUND_STRING(
            "Copies the foe's\nlast move "
            "\npermanently."),
        .effect = EFFECT_SKETCH,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .mirrorMoveBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Sketch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TRIPLE_KICK] =
    {
        .name = COMPOUND_STRING("Triple Kick"),
        .description = COMPOUND_STRING(
            "Kicks the foe 3\ntimes in a "
            "row\nwith rising\nintensity."),
        .effect = EFFECT_TRIPLE_KICK,
        .power = 10,
        .type = TYPE_FIGHTING,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .strikeCount = 3,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_TripleKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_THIEF] =
    {
        .name = COMPOUND_STRING("Thief"),
        .description = COMPOUND_STRING(
            "While attacking,\nit may "
            "steal the\nfoe's held item."),
        .effect = EFFECT_STEAL_ITEM,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 60 : 40,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 25 : 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .meFirstBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE : CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Thief,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPIDER_WEB] =
    {
        .name = COMPOUND_STRING("Spider Web"),
        .description = COMPOUND_STRING(
            "Ensnares the foe\nto stop it "
            "from\nfleeing or\nswitching."),
        .effect = EFFECT_MEAN_LOOK,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = (B_UPDATED_MOVE_FLAGS >= GEN_6) || (B_UPDATED_MOVE_FLAGS < GEN_3),
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STRING_SHOT},
        .battleAnimScript = gBattleAnimMove_SpiderWeb,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MIND_READER] =
    {
        .name = COMPOUND_STRING("Mind Reader"),
        .description = COMPOUND_STRING(
            "Senses the foe's\naction to "
            "ensure\nthe next move's\nhit."),
        .effect = EFFECT_LOCK_ON,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_4 ? 0 : 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_NEXT_APPEAL_EARLIER : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_MIND_READER,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MindReader,
        .validApprenticeMove = TRUE,
    },

    [MOVE_NIGHTMARE] =
    {
        .name = COMPOUND_STRING("Nightmare"),
        .description = COMPOUND_STRING(
            "Inflicts 1/4\ndamage on a "
            "\nsleeping foe every\nturn."),
        .effect = EFFECT_NIGHTMARE,
        .power = 0,
        .type = TYPE_GHOST,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_4 ? 100 : 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS < GEN_3,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_LOVELY_KISS, COMBO_STARTER_SPORE, COMBO_STARTER_SING, COMBO_STARTER_YAWN, COMBO_STARTER_HYPNOSIS, COMBO_STARTER_DARK_VOID, COMBO_STARTER_GRASS_WHISTLE, COMBO_STARTER_SLEEP_POWDER},
        .battleAnimScript = gBattleAnimMove_Nightmare,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FLAME_WHEEL] =
    {
        .name = COMPOUND_STRING("Flame Wheel"),
        .description = COMPOUND_STRING(
            "A fiery charge\nattack that "
            "may\ninflict a burn."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .thawsUser = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_FlameWheel,
    },

    [MOVE_SNORE] =
    {
        .name = COMPOUND_STRING("Snore"),
        .description = COMPOUND_STRING(
            "A loud attack that\ncan only "
            "be used\nasleep. May\nflinch."),
        .effect = EFFECT_SNORE,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 50 : 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_REST},
        .battleAnimScript = gBattleAnimMove_Snore,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CURSE] =
    {
        .name = COMPOUND_STRING("Curse"),
        .description = COMPOUND_STRING(
            "A move that\nfunctions "
            "\ndifferently for\nGHOSTS."),
        .effect = EFFECT_CURSE,
        .power = 0,
        .type = B_UPDATED_MOVE_TYPES >= GEN_5 ? TYPE_GHOST : TYPE_MYSTERY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_CURSE },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_CURSE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Curse,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FLAIL] =
    {
        .name = COMPOUND_STRING("Flail"),
        .description = COMPOUND_STRING(
            "Inflicts more\ndamage when "
            "the\nuser's HP is down."),
        .effect = EFFECT_FLAIL,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENDURE},
        .battleAnimScript = gBattleAnimMove_Flail,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CONVERSION_2] =
    {
        .name = COMPOUND_STRING("Conversion 2"),
        .description = COMPOUND_STRING(
            "Makes the user\nresistant "
            "to the\nlast attack's\ntype."),
        .effect = EFFECT_CONVERSION_2,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = B_UPDATED_MOVE_DATA >= GEN_5 ? TARGET_SELECTED : TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS >= GEN_3,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Conversion2,
        .validApprenticeMove = TRUE,
    },

    [MOVE_AEROBLAST] =
    {
        .name = COMPOUND_STRING("Aeroblast"),
        .description = COMPOUND_STRING(
            "Launches a\nvacuumed blast. "
            "\nHigh critical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FLYING,
        .accuracy = 95,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_LAST :
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Aeroblast,
        .validApprenticeMove = TRUE,
    },

    [MOVE_COTTON_SPORE] =
    {
        .name = COMPOUND_STRING("Cotton Spore"),
        .description = COMPOUND_STRING(
        #if B_UPDATED_MOVE_DATA >= GEN_6
            "Spores cling to\nthe foes, "
        #else
            "Spores cling to\nthe foe, "
        #endif
            "sharply reducing\nSpeed."),
        .effect = EFFECT_SPEED_DOWN_2,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 100 : 85,
        .pp = 40,
        .target = B_UPDATED_MOVE_DATA >= GEN_6 ? TARGET_BOTH : TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .magicCoatAffected = TRUE,
        .powderMove = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CottonSpore,
        .validApprenticeMove = TRUE,
    },

    [MOVE_REVERSAL] =
    {
        .name = COMPOUND_STRING("Reversal"),
        .description = COMPOUND_STRING(
            "Inflicts more\ndamage when "
            "the\nuser's HP is down."),
        .effect = EFFECT_FLAIL,
        .power = 1,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WHEN_LATER : CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENDURE},
        .battleAnimScript = gBattleAnimMove_Reversal,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPITE] =
    {
        .name = COMPOUND_STRING("Spite"),
        .description = COMPOUND_STRING(
            "Spitefully cuts\nthe PP "
        #if B_PP_REDUCED_BY_SPITE >= GEN_4
            "of the\nfoe's last move by\n4."),
        #else
            "of foe's\nlast move by 2-5."),
        #endif
        .effect = EFFECT_SPITE,
        .power = 0,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresSubstitute = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS : CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CURSE, COMBO_STARTER_ENCORE, COMBO_STARTER_TAUNT, COMBO_STARTER_TORMENT},
        .battleAnimScript = gBattleAnimMove_Spite,
        .validApprenticeMove = TRUE,
    },

    [MOVE_POWDER_SNOW] =
    {
        .name = COMPOUND_STRING("Powder Snow"),
        .description = COMPOUND_STRING(
            "Blasts the foes\nwith a snowy "
        #if B_USE_FROSTBITE == TRUE
            "gust.\nMay cause\nfrostbite."),
        #else
            "gust.\nMay cause\nfreezing."),
        #endif
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_POWDER_SNOW,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_PowderSnow,
    },

    [MOVE_PROTECT] =
    {
        .name = COMPOUND_STRING("Protect"),
        .description = sProtectDescription,
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        #if B_UPDATED_MOVE_DATA >= GEN_5
            .priority = 4,
        #elif B_UPDATED_MOVE_DATA >= GEN_3
            .priority = 3,
        #else
            .priority = 2,
        #endif
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_NORMAL },
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HARDEN},
        .battleAnimScript = gBattleAnimMove_Protect,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MACH_PUNCH] =
    {
        .name = COMPOUND_STRING("Mach Punch"),
        .description = COMPOUND_STRING(
            "A punch is thrown\nat wicked "
            "speed to\nstrike first."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MachPunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SCARY_FACE] =
    {
        .name = COMPOUND_STRING("Scary Face"),
        .description = COMPOUND_STRING(
            "Frightens with a\nscary face "
            "to\nsharply reduce\nSpeed."),
        .effect = EFFECT_SPEED_DOWN_2,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 100 : 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SCARY_FACE,
        .contestComboMoves = {COMBO_STARTER_LEER, COMBO_STARTER_RAGE},
        .battleAnimScript = gBattleAnimMove_ScaryFace,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FEINT_ATTACK] =
    {
        .name = COMPOUND_STRING("Feint Attack"),
        .description = COMPOUND_STRING(
            "Draws the foe\nclose, then "
            "\nstrikes without\nfail."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = B_UPDATED_MOVE_DATA >= GEN_4,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FAKE_OUT, COMBO_STARTER_LEER, COMBO_STARTER_POUND},
        .battleAnimScript = gBattleAnimMove_FeintAttack,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SWEET_KISS] =
    {
        .name = COMPOUND_STRING("Sweet Kiss"),
        .description = COMPOUND_STRING(
            "Demands a kiss\nwith a cute "
            "look.\nMay cause\nconfusion."),
        .effect = EFFECT_CONFUSE,
        .power = 0,
        .type = B_UPDATED_MOVE_TYPES >= GEN_6 ? TYPE_FAIRY : TYPE_NORMAL,
        .accuracy = 75,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARM},
        .battleAnimScript = gBattleAnimMove_SweetKiss,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BELLY_DRUM] =
    {
        .name = COMPOUND_STRING("Belly Drum"),
        .description = COMPOUND_STRING(
            "Maximizes Attack\nwhile "
            "sacrificing\nhalf of max HP."),
        .effect = EFFECT_BELLY_DRUM,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_BELLY_DRUM,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BellyDrum,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SLUDGE_BOMB] =
    {
        .name = COMPOUND_STRING("Sludge Bomb"),
        .description = COMPOUND_STRING(
            "Sludge is hurled\nto inflict "
            "damage.\nMay also poison."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SLUDGE_BOMB,
        .contestComboMoves = {COMBO_STARTER_SLUDGE},
        .battleAnimScript = gBattleAnimMove_SludgeBomb,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MUD_SLAP] =
    {
        .name = COMPOUND_STRING("Mud-Slap"),
        .description = COMPOUND_STRING(
            "Hurls mud in the\nfoe's face "
            "to\nreduce its\naccuracy."),
        .effect = EFFECT_HIT,
        .power = 20,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ACC_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_MUD_SLAP,
        .contestComboMoves = {COMBO_STARTER_MUD_SPORT, COMBO_STARTER_SAND_ATTACK, COMBO_STARTER_SANDSTORM},
        .battleAnimScript = gBattleAnimMove_MudSlap,
        .validApprenticeMove = TRUE,
    },

    [MOVE_OCTAZOOKA] =
    {
        .name = COMPOUND_STRING("Octazooka"),
        .description = COMPOUND_STRING(
            "Fires a lump of\nink to "
            "damage and\ncut accuracy."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_WATER,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ACC_MINUS_1,
            .chance = 50,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_LOCK_ON, COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Octazooka,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPIKES] =
    {
        .name = COMPOUND_STRING("Spikes"),
        .description = COMPOUND_STRING(
            "Sets spikes that\nhurt a  "
            "foe\nswitching in."),
        .effect = EFFECT_SPIKES,
        .power = 0,
        .type = TYPE_GROUND,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_OPPONENTS_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .forcePressure = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_SPIKES,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Spikes,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ZAP_CANNON] =
    {
        .name = COMPOUND_STRING("Zap Cannon"),
        .description = COMPOUND_STRING(
            "Powerful and sure\nto cause "
            "\nparalysis, but\ninaccurate."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_4 ? 120 : 100,
        .type = TYPE_ELECTRIC,
        .accuracy = 50,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 100,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE, COMBO_STARTER_LOCK_ON},
        .battleAnimScript = gBattleAnimMove_ZapCannon,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FORESIGHT] =
    {
        .name = COMPOUND_STRING("Foresight"),
        .description = COMPOUND_STRING(
            "Negates the foe's\nefforts "
            "to\nheighten\nevasiveness."),
        .effect = EFFECT_FORESIGHT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 0 : 100,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_BOOST_CRITS },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresSubstitute = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL : CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Foresight,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DESTINY_BOND] =
    {
        .name = COMPOUND_STRING("Destiny Bond"),
        .description = COMPOUND_STRING(
            "If the user\nfaints, the foe "
            "is\nalso made to\nfaint."),
        .effect = EFFECT_DESTINY_BOND,
        .power = 0,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_FOLLOW_ME },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CURSE, COMBO_STARTER_ENDURE, COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_ENCORE, COMBO_STARTER_TAUNT, COMBO_STARTER_TORMENT},
        .battleAnimScript = gBattleAnimMove_DestinyBond,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PERISH_SONG] =
    {
        .name = COMPOUND_STRING("Perish Song"),
        .description = COMPOUND_STRING(
            "Any Pokémon\nhearing this "
            "song\nfaints in 3 turns."),
        .effect = EFFECT_PERISH_SONG,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_ALL_BATTLERS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_SING, COMBO_STARTER_BLOCK},
        .battleAnimScript = gBattleAnimMove_PerishSong,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ICY_WIND] =
    {
        .name = COMPOUND_STRING("Icy Wind"),
        .description = COMPOUND_STRING(
            "A chilling attack\nthat "
            "lowers the\nfoe's Speed."),
        .effect = EFFECT_HIT,
        .power = 55,
        .type = TYPE_ICE,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_IcyWind,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DETECT] =
    {
        .name = COMPOUND_STRING("Detect"),
        .description = sProtectDescription,
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        #if B_UPDATED_MOVE_DATA >= GEN_5
            .priority = 4,
        #elif B_UPDATED_MOVE_DATA >= GEN_3
            .priority = 3,
        #else
            .priority = 2,
        #endif
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_NORMAL },
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_TAUNT},
        .battleAnimScript = gBattleAnimMove_Detect,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BONE_RUSH] =
    {
        .name = COMPOUND_STRING("Bone Rush"),
        .description = COMPOUND_STRING(
            "Strikes the foe\nwith a bone "
            "in\nhand 2 to 5 times."),
        .effect = EFFECT_HIT,
        .power = 25,
        .type = TYPE_GROUND,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 90 : 80,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_BONE_RUSH,
        .contestComboMoves = {COMBO_STARTER_BONE_CLUB, COMBO_STARTER_BONEMERANG, COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_SHADOW_BONE},
        .battleAnimScript = gBattleAnimMove_BoneRush,
    },

    [MOVE_LOCK_ON] =
    {
        .name = COMPOUND_STRING("Lock-On"),
        .description = COMPOUND_STRING(
            "Locks on to the\nfoe to "
            "ensure the\nnext move hits."),
        .effect = EFFECT_LOCK_ON,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_4 ? 0 : 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_NEXT_APPEAL_EARLIER : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_LOCK_ON,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LockOn,
        .validApprenticeMove = TRUE,
    },

    [MOVE_OUTRAGE] =
    {
        .name = COMPOUND_STRING("Outrage"),
        .description = COMPOUND_STRING(
            "A rampage of 2 to\n3 turns "
            "that\nconfuses the user."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_4 ? 120 : 90,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 10 : 15,
        .target = TARGET_RANDOM,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .instructBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_THRASH,
            .self = TRUE,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Outrage,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SANDSTORM] =
    {
        .name = COMPOUND_STRING("Sandstorm"),
        .description = COMPOUND_STRING(
            "Causes a sandstorm\nthat "
            "rages for\nseveral turns."),
        .effect = EFFECT_WEATHER,
        .power = 0,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .windMove = TRUE,
        .argument = { .weatherType = BATTLE_WEATHER_SANDSTORM },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SANDSTORM,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Sandstorm,
        .validApprenticeMove = TRUE,
    },

    [MOVE_GIGA_DRAIN] =
    {
        .name = COMPOUND_STRING("Giga Drain"),
        .description = COMPOUND_STRING(
            "An attack that\nsteals half "
            "the\ndamage inflicted."),
        .effect = EFFECT_ABSORB,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 75 : 60,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_4 ? 10 : 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 50 },
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_GigaDrain,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ENDURE] =
    {
        .name = COMPOUND_STRING("Endure"),
        .description = COMPOUND_STRING(
            "Endures any attack\nfor "
            "1 turn,\nleaving at least\n1HP."),
        .effect = EFFECT_ENDURE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        #if B_UPDATED_MOVE_DATA >= GEN_5
            .priority = 4,
        #elif B_UPDATED_MOVE_DATA >= GEN_3
            .priority = 3,
        #else
            .priority = 2,
        #endif
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_NONE },
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_NEXT_APPEAL_LATER : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_ENDURE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Endure,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CHARM] =
    {
        .name = COMPOUND_STRING("Charm"),
        .description = COMPOUND_STRING(
            "Charms the foe and\nsharply "
            "reduces\nits Attack."),
        .effect = EFFECT_ATTACK_DOWN_2,
        .power = 0,
        .type = B_UPDATED_MOVE_TYPES >= GEN_6 ? TYPE_FAIRY : TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_CHARM,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Charm,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROLLOUT] =
    {
        .name = COMPOUND_STRING("Rollout"),
        .description = COMPOUND_STRING(
            "An attack lasting\n5 turns "
            "with\nrising intensity."),
        .effect = EFFECT_ROLLOUT,
        .power = 30,
        .type = TYPE_ROCK,
        .accuracy = 90,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .instructBanned = TRUE,
        .parentalBondBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_DEFENSE_CURL, COMBO_STARTER_HARDEN},
        .battleAnimScript = gBattleAnimMove_Rollout,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FALSE_SWIPE] =
    {
        .name = COMPOUND_STRING("False Swipe"),
        .description = sFalseSwipeDescription,
        .effect = EFFECT_FALSE_SWIPE,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SWORDS_DANCE},
        .battleAnimScript = gBattleAnimMove_FalseSwipe,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SWAGGER] =
    {
        .name = COMPOUND_STRING("Swagger"),
        .description = COMPOUND_STRING(
            "Confuses the foe,\nbut also "
            "sharply\nraises its Attack."),
        .effect = EFFECT_SWAGGER,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_7 ? 85 : 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        //.ignoresSubstitute = TRUE, In Gen4+, the attack raise will no longer bypass Substitute. However, this is tricky to code
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS : CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Swagger,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MILK_DRINK] =
    {
        .name = COMPOUND_STRING("Milk Drink"),
        .description = COMPOUND_STRING(
            "Recovers up to\nhalf the "
            "user's\nmaximum HP."),
        .effect = EFFECT_SOFTBOILED,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 5 : 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_FIRST : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MilkDrink,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPARK] =
    {
        .name = COMPOUND_STRING("Spark"),
        .description = COMPOUND_STRING(
            "An electrified\ntackle that "
            "may\nparalyze the foe."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_Spark,
    },

    [MOVE_FURY_CUTTER] =
    {
        .name = COMPOUND_STRING("Fury Cutter"),
        .description = COMPOUND_STRING(
            "An attack that\nintensifies "
            "on\neach successive\nhit."),
        #if B_UPDATED_MOVE_DATA >= GEN_6
            .power = 40,
        #elif B_UPDATED_MOVE_DATA == GEN_5
            .power = 20,
        #else
            .power = 10,
        #endif
        .effect = EFFECT_FURY_CUTTER,
        .type = TYPE_BUG,
        .accuracy = 95,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SWORDS_DANCE},
        .battleAnimScript = gBattleAnimMove_FuryCutter,
        .validApprenticeMove = TRUE,
    },

    [MOVE_STEEL_WING] =
    {
        .name = COMPOUND_STRING("Steel Wing"),
        .description = COMPOUND_STRING(
            "Strikes the foe\nwith hard "
            "wings\nspread wide."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_STEEL,
        .accuracy = 90,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_PLUS_1,
            .self = TRUE,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SteelWing,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MEAN_LOOK] =
    {
        .name = COMPOUND_STRING("Mean Look"),
        .description = COMPOUND_STRING(
            "Fixes the foe with\na mean "
            "look that\nprevents escape."),
        .effect = EFFECT_MEAN_LOOK,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = (B_UPDATED_MOVE_FLAGS >= GEN_6) || (B_UPDATED_MOVE_FLAGS < GEN_3),
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_MEAN_LOOK,
        .contestComboMoves = {COMBO_STARTER_CURSE},
        .battleAnimScript = gBattleAnimMove_MeanLook,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ATTRACT] =
    {
        .name = COMPOUND_STRING("Attract"),
        .description = COMPOUND_STRING(
            "Makes the opposite\ngender "
            "less likely\nto attack."),
        .effect = EFFECT_ATTRACT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .magicCoatAffected = TRUE,
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Attract,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SLEEP_TALK] =
    {
        .name = COMPOUND_STRING("Sleep Talk"),
        .description = COMPOUND_STRING(
            "Uses an available\nmove "
            "randomly\nwhile asleep."),
        .effect = EFFECT_SLEEP_TALK,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_BOOST_CRITS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .mimicBanned = TRUE,
        .encoreBanned = (B_UPDATED_MOVE_FLAGS >= GEN_7 || B_UPDATED_MOVE_FLAGS < GEN_3),
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_REST},
        .battleAnimScript = gBattleAnimMove_SleepTalk,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HEAL_BELL] =
    {
        .name = COMPOUND_STRING("Heal Bell"),
        .description = COMPOUND_STRING(
            "Chimes soothingly\nto heal "
            "all status\nabnormalities."),
        .effect = EFFECT_HEAL_BELL,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .soundMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE : CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_HEAL_BELL,
        .contestComboMoves = {COMBO_STARTER_LUCKY_CHANT},
        .battleAnimScript = gBattleAnimMove_HealBell,
        .validApprenticeMove = TRUE,
    },

    [MOVE_RETURN] =
    {
        .name = COMPOUND_STRING("Return"),
        .description = COMPOUND_STRING(
            "An attack that\nincreases "
            "in power\nwith friendship."),
        .effect = EFFECT_RETURN,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Return,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PRESENT] =
    {
        .name = COMPOUND_STRING("Present"),
        .description = COMPOUND_STRING(
            "A gift in the form\nof a "
            "bomb. May\nrestore HP."),
        .effect = EFFECT_PRESENT,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CELEBRATE, COMBO_STARTER_COVET, COMBO_STARTER_HAPPY_HOUR, COMBO_STARTER_WISH},
        .battleAnimScript = gBattleAnimMove_Present,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FRUSTRATION] =
    {
        .name = COMPOUND_STRING("Frustration"),
        .description = COMPOUND_STRING(
            "An attack that is\nstronger "
            "if the\nTrainer is\ndisliked."),
        .effect = EFFECT_FRUSTRATION,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Frustration,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SAFEGUARD] =
    {
        .name = COMPOUND_STRING("Safeguard"),
        .description = COMPOUND_STRING(
            "Protects allies\nfrom status "
            "\nproblems for 5\nturns."),
        .effect = EFFECT_SAFEGUARD,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 25,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Safeguard,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PAIN_SPLIT] =
    {
        .name = COMPOUND_STRING("Pain Split"),
        .description = COMPOUND_STRING(
            "Adds the user and\nfoe's HP, "
            "then\nshares them\nequally."),
        .effect = EFFECT_PAIN_SPLIT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_3 ? 0 : 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENDURE},
        .battleAnimScript = gBattleAnimMove_PainSplit,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SACRED_FIRE] =
    {
        .name = COMPOUND_STRING("Sacred Fire"),
        .description = COMPOUND_STRING(
            "A mystical fire\nattack that "
            "may\ninflict a burn."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FIRE,
        .accuracy = 95,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .thawsUser = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 50,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_SacredFire,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MAGNITUDE] =
    {
        .name = COMPOUND_STRING("Magnitude"),
        .description = COMPOUND_STRING(
            "A ground-shaking\nattack "
            "of random\nintensity."),
        .effect = EFFECT_MAGNITUDE,
        .power = 1,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .damagesUnderground = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Magnitude,
    },

    [MOVE_DYNAMIC_PUNCH] =
    {
        .name = COMPOUND_STRING("Dynamic Punch"),
        .description = COMPOUND_STRING(
            "Powerful and sure\nto cause "
            "\nconfusion, but\ninaccurate."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FIGHTING,
        .accuracy = 50,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_DynamicPunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MEGAHORN] =
    {
        .name = COMPOUND_STRING("Megahorn"),
        .description = COMPOUND_STRING(
            "A brutal ramming\nattack "
            "using\nout-thrust horns."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_BUG,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Megahorn,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DRAGON_BREATH] =
    {
        .name = COMPOUND_STRING("Dragon Breath"),
        .description = COMPOUND_STRING(
            "Strikes the foe\nwith a blast "
            "of\nbreath. May\nparalyze."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_DRAGON_BREATH,
        .contestComboMoves = {COMBO_STARTER_DRAGON_DANCE, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_RUSH, COMBO_STARTER_DRAGON_TAIL},
        .battleAnimScript = gBattleAnimMove_DragonBreath,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BATON_PASS] =
    {
        .name = COMPOUND_STRING("Baton Pass"),
        .description = COMPOUND_STRING(
            "Switches out the\nuser while "
            "keeping\neffects in play."),
        .effect = EFFECT_BATON_PASS,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION : CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_AGILITY, COMBO_STARTER_AMNESIA, COMBO_STARTER_HONE_CLAWS, COMBO_STARTER_CALM_MIND, COMBO_STARTER_NASTY_PLOT, COMBO_STARTER_ROCK_POLISH},
        .battleAnimScript = gBattleAnimMove_BatonPass,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ENCORE] =
    {
        .name = COMPOUND_STRING("Encore"),
        .description = COMPOUND_STRING(
            "Makes the foe\nrepeat its "
            "last\nmove over 3 turns."),
        .effect = EFFECT_ENCORE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .encoreBanned = TRUE,
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_ENCORE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Encore,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PURSUIT] =
    {
        .name = COMPOUND_STRING("Pursuit"),
        .description = COMPOUND_STRING(
            "Inflicts bad\ndamage if used "
            "on\na foe switching\nout."),
        .effect = EFFECT_PURSUIT,
        .power = 40,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresKingsRock = (B_UPDATED_MOVE_FLAGS == GEN_3 || B_UPDATED_MOVE_FLAGS == GEN_4),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL : CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Pursuit,
        .validApprenticeMove = TRUE,
    },

    [MOVE_RAPID_SPIN] =
    {
        .name = COMPOUND_STRING("Rapid Spin"),
        .description = COMPOUND_STRING(
            "User spins and\nremoves some "
        #if B_SPEED_BUFFING_RAPID_SPIN >= GEN_8
            "\neffects, while\nupping speed."),
        #else
            "\neffects."),
        #endif
        .effect = EFFECT_RAPID_SPIN,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 50 : 20,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        #if B_SPEED_BUFFING_RAPID_SPIN >= GEN_8
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        #endif
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RapidSpin,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SWEET_SCENT] =
    {
        .name = COMPOUND_STRING("Sweet Scent"),
        .description = COMPOUND_STRING(
        #if B_UPDATED_MOVE_DATA >= GEN_6
            "Allures the foes\nto harshly "
            "reduce\nevasiveness."),
        #else
            "Allures the foes\nto reduce "
            "\nevasiveness."),
        #endif
        .effect = B_UPDATED_MOVE_DATA >= GEN_6 ? EFFECT_EVASION_DOWN_2 : EFFECT_EVASION_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ACC_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_SWEET_SCENT,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SweetScent,
        .validApprenticeMove = TRUE,
    },

    [MOVE_IRON_TAIL] =
    {
        .name = COMPOUND_STRING("Iron Tail"),
        .description = COMPOUND_STRING(
            "Attacks with a\nrock-hard "
            "tail.\nMay lower Defense."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_STEEL,
        .accuracy = 75,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_IronTail,
        .validApprenticeMove = TRUE,
    },

    [MOVE_METAL_CLAW] =
    {
        .name = COMPOUND_STRING("Metal Claw"),
        .description = COMPOUND_STRING(
            "A claw attack that\nmay "
            "raise the\nuser's Attack."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_STEEL,
        .accuracy = 95,
        .pp = 35,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_PLUS_1,
            .self = TRUE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_METAL_SOUND},
        .battleAnimScript = gBattleAnimMove_MetalClaw,
        .validApprenticeMove = TRUE,
    },

    [MOVE_VITAL_THROW] =
    {
        .name = COMPOUND_STRING("Vital Throw"),
        .description = COMPOUND_STRING(
            "Makes the user's\nmove last, "
            "but it\nnever misses."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = -1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FAKE_OUT, COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE},
        .battleAnimScript = gBattleAnimMove_VitalThrow,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MORNING_SUN] =
    {
        .name = COMPOUND_STRING("Morning Sun"),
        .description = COMPOUND_STRING(
            "Restores HP. The\namount "
            "varies with\nthe weather."),
        .effect = EFFECT_MORNING_SUN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_MorningSun,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SYNTHESIS] =
    {
        .name = COMPOUND_STRING("Synthesis"),
        .description = COMPOUND_STRING(
            "Restores HP. The\namount "
            "varies with\nthe weather."),
        .effect = EFFECT_SYNTHESIS,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_Synthesis,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MOONLIGHT] =
    {
        .name = COMPOUND_STRING("Moonlight"),
        .description = COMPOUND_STRING(
            "Restores HP. The\namount "
            "varies with\nthe weather."),
        .effect = EFFECT_MOONLIGHT,
        .power = 0,
        .type = B_UPDATED_MOVE_TYPES >= GEN_6 ? TYPE_FAIRY : TYPE_NORMAL,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_Moonlight,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HIDDEN_POWER] =
    {
        .name = COMPOUND_STRING("Hidden Power"),
        .description = COMPOUND_STRING(
        #if B_HIDDEN_POWER_DMG >= GEN_6
            "The type varies "
            "\nwith the user."),
        #else
            "The type and\neffectiveness "
            "vary\nwith the user."),
        #endif
        .power = B_HIDDEN_POWER_DMG >= GEN_6 ? 60 : 1,
        .effect = EFFECT_HIDDEN_POWER,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HiddenPower,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CROSS_CHOP] =
    {
        .name = COMPOUND_STRING("Cross Chop"),
        .description = COMPOUND_STRING(
            "A double-chopping\nattack. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FIGHTING,
        .accuracy = 80,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_CrossChop,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TWISTER] =
    {
        .name = COMPOUND_STRING("Twister"),
        .description = COMPOUND_STRING(
            "Whips up a vicious\ntwister "
            "to tear at\nfoes. May flinch."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .damagesAirborneDoubleDamage = TRUE,
        .windMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 20,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Twister,
    },

    [MOVE_RAIN_DANCE] =
    {
        .name = COMPOUND_STRING("Rain Dance"),
        .description = COMPOUND_STRING(
            "Boosts the power\nof Water- "
            "type\nmoves for 5 turns."),
        .effect = EFFECT_WEATHER,
        .power = 0,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .argument = { .weatherType =  BATTLE_WEATHER_RAIN },
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_RAIN_DANCE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RainDance,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SUNNY_DAY] =
    {
        .name = COMPOUND_STRING("Sunny Day"),
        .description = COMPOUND_STRING(
            "Boosts the power\nof Fire- "
            "type\nmoves for 5 turns."),
        .effect = EFFECT_WEATHER,
        .power = 0,
        .type = TYPE_FIRE,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .argument = { .weatherType = BATTLE_WEATHER_SUN },
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_SUNNY_DAY,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SunnyDay,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CRUNCH] =
    {
        .name = COMPOUND_STRING("Crunch"),
        .description = COMPOUND_STRING(
            "Crunches with\nsharp fangs. "
        #if B_UPDATED_MOVE_DATA >= GEN_4
            "May\nlower Defense."),
        #else
            "May\nlower Sp. Def."),
        #endif
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
            .additionalEffects = ADDITIONAL_EFFECTS({
        #if B_UPDATED_MOVE_DATA >= GEN_4
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
        #else
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
        #endif
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SCARY_FACE},
        .battleAnimScript = gBattleAnimMove_Crunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MIRROR_COAT] =
    {
        .name = COMPOUND_STRING("Mirror Coat"),
        .description = COMPOUND_STRING(
            "Counters the foe's\nspecial "
            "attack at\ndouble the power."),
        .effect = EFFECT_REFLECT_DAMAGE,
        .power = 1,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_DEPENDS,
        .priority = -5,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = {
            .reflectDamage.damagePercent = 200,
            .reflectDamage.damageCategories = 1u << DAMAGE_CATEGORY_SPECIAL,
        },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS < GEN_5,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS >= GEN_4,
        .meFirstBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = B_UPDATED_MOVE_FLAGS <= GEN_8,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_TAUNT, COMBO_STARTER_ENCORE, COMBO_STARTER_TORMENT},
        .battleAnimScript = gBattleAnimMove_MirrorCoat,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PSYCH_UP] =
    {
        .name = COMPOUND_STRING("Psych Up"),
        .description = COMPOUND_STRING(
            "Copies foe's stat\nchanges "
            "and gives\nto the user."),
        .effect = EFFECT_PSYCH_UP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = B_UPDATED_MOVE_FLAGS < GEN_5,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PsychUp,
        .validApprenticeMove = TRUE,
    },

    [MOVE_EXTREME_SPEED] =
    {
        .name = COMPOUND_STRING("Extreme Speed"),
        .description = COMPOUND_STRING(
            "An extremely fast\nand "
            "powerful\nattack."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = B_UPDATED_MOVE_DATA >= GEN_5 ? 2 : 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ExtremeSpeed,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ANCIENT_POWER] =
    {
        .name = COMPOUND_STRING("Ancient Power"),
        .description = COMPOUND_STRING(
            "An attack that may\nraise "
            "all stats."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_ROCK,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = B_UPDATED_MOVE_DATA < GEN_4,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ALL_STATS_UP,
            .self = TRUE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AncientPower,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SHADOW_BALL] =
    {
        .name = COMPOUND_STRING("Shadow Ball"),
        .description = COMPOUND_STRING(
            "Hurls a black blob\nthat may "
            "lower the\nfoe's Sp. Def."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 20,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShadowBall,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FUTURE_SIGHT] =
    {
        .name = COMPOUND_STRING("Future Sight"),
        .description = COMPOUND_STRING(
            "Heightens inner\npower to "
            "strike 2\nturns later."),
        #if B_UPDATED_MOVE_DATA >= GEN_6
            .power = 120,
        #elif B_UPDATED_MOVE_DATA == GEN_5
            .power = 100,
        #else
            .power = 80,
        #endif
        .effect = EFFECT_FUTURE_SIGHT,
        .type = TYPE_PSYCHIC,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 100 : 90,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 10 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_SAME_TYPE : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND, COMBO_STARTER_CONFUSION, COMBO_STARTER_KINESIS, COMBO_STARTER_PSYCHIC},
        .battleAnimScript = gBattleAnimMove_FutureSight,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROCK_SMASH] =
    {
        .name = COMPOUND_STRING("Rock Smash"),
        .description = COMPOUND_STRING(
            "A rock-crushing\nattack "
            "that may\nlower Defense."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_4 ? 40 : 20,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 50,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RockSmash,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WHIRLPOOL] =
    {
        .name = COMPOUND_STRING("Whirlpool"),
        .description = COMPOUND_STRING(
            "Traps and hurts\nthe foe in "
            "a\nwhirlpool for\n"BINDING_TURNS" turns."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 35 : 15,
        .type = TYPE_WATER,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 85 : 70,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresKingsRock = B_UPDATED_MOVE_FLAGS < GEN_3,
        .damagesUnderwater = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_WHIRLPOOL,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Whirlpool,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BEAT_UP] =
    {
        .name = COMPOUND_STRING("Beat Up"),
        .description = COMPOUND_STRING(
            "Summons party\nPokémon to "
            "join\nin the attack."),
        .effect = EFFECT_BEAT_UP,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 1 : 10,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BEAT_UP_MESSAGE,
            .preAttackEffect = TRUE,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION : CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BeatUp,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FAKE_OUT] =
    {
        .name = COMPOUND_STRING("Fake Out"),
        .description = COMPOUND_STRING(
            "Moves 1st and\nflinches. Only "
            "\nworks on user's\n1st turn."),
        .priority = B_UPDATED_MOVE_DATA >= GEN_5 ? 3 : 1,
        .makesContact = B_UPDATED_MOVE_DATA >= GEN_4,
        .effect = EFFECT_FIRST_TURN_ONLY,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 100,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_FAKE_OUT,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FakeOut,
        .validApprenticeMove = TRUE,
    },

    [MOVE_UPROAR] =
    {
        .name = COMPOUND_STRING("Uproar"),
        .description = COMPOUND_STRING(
        #if B_UPROAR_TURNS >= GEN_5
            "Causes an uproar\nfor 3 "
        #else
            "Causes an uproar\nfor 2 to 5 "
        #endif
            "turns and prevents\nsleep."),
        .effect = EFFECT_UPROAR,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 90 : 50,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_RANDOM,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_UPROAR,
            .self = TRUE,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Uproar,
        .validApprenticeMove = TRUE,
    },

    [MOVE_STOCKPILE] =
    {
        .name = COMPOUND_STRING("Stockpile"),
        .description = COMPOUND_STRING(
            "Charges up power\nfor up to "
            "3 turns."),
        .effect = EFFECT_STOCKPILE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_4 ? 20 : 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_STOCKPILE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Stockpile,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SPIT_UP] =
    {
        .name = COMPOUND_STRING("Spit Up"),
        .description = COMPOUND_STRING(
            "Releases\nstockpiled power "
            "\n(the more the\nbetter)."),
        .effect = EFFECT_SPIT_UP,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STOCKPILE},
        .battleAnimScript = gBattleAnimMove_SpitUp,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SWALLOW] =
    {
        .name = COMPOUND_STRING("Swallow"),
        .description = COMPOUND_STRING(
            "Absorbs stockpiled\npower "
            "and restores\nHP."),
        .effect = EFFECT_SWALLOW,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STOCKPILE},
        .battleAnimScript = gBattleAnimMove_Swallow,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HEAT_WAVE] =
    {
        .name = COMPOUND_STRING("Heat Wave"),
        .description = COMPOUND_STRING(
            "Exhales a hot\nbreath on the "
            "\nfoes. May inflict\na burn."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 95 : 100,
        .type = TYPE_FIRE,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MONS : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_HeatWave,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HAIL] =
    {
        .name = COMPOUND_STRING("Hail"),
        #if B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_SNOW
            .description = COMPOUND_STRING(
                "Summons a\nsnowstorm that "
                "\nlasts for five\nturns."),
        #else
            .description = COMPOUND_STRING(
                "Summons a\nhailstorm that "
                "\nstrikes every turn."),
        #endif
        .effect = EFFECT_WEATHER,
        .power = 0,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .argument = { .weatherType = (B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_SNOW) ? BATTLE_WEATHER_SNOW : BATTLE_WEATHER_HAIL },
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_HAIL,
        .contestComboMoves = {0},
        .battleAnimScript = (B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_SNOW) ? gBattleAnimMove_Snowscape : gBattleAnimMove_Hail,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TORMENT] =
    {
        .name = COMPOUND_STRING("Torment"),
        .description = COMPOUND_STRING(
            "Torments the foe\nand stops "
            "\nsuccessive use of\na move."),
        .effect = EFFECT_TORMENT,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_TORMENT,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Torment,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FLATTER] =
    {
        .name = COMPOUND_STRING("Flatter"),
        .description = COMPOUND_STRING(
            "Confuses the foe,\nbut "
            "raises its Sp.\nAtk."),
        .effect = EFFECT_FLATTER,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARM},
        .battleAnimScript = gBattleAnimMove_Flatter,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WILL_O_WISP] =
    {
        .name = COMPOUND_STRING("Will-O-Wisp"),
        .description = COMPOUND_STRING(
            "Inflicts a burn on\nthe foe "
            "with\nintense fire."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_FIRE,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 85 : 75,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_BURN },
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_WILL_O_WISP,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_WillOWisp,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MEMENTO] =
    {
        .name = COMPOUND_STRING("Memento"),
        .description = COMPOUND_STRING(
            "The user faints\nand harshly "
            "lowers\nfoes Atk and\nSp.Atk."),
        .effect = EFFECT_MEMENTO,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_4 ? 100 : 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESTORE_REPLACEMENT_HP },
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_BLOCK},
        .battleAnimScript = gBattleAnimMove_Memento,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FACADE] =
    {
        .name = COMPOUND_STRING("Facade"),
        .description = COMPOUND_STRING(
            "Boosts power when\nburned, "
            "paralyzed,\nor poisoned."),
        .effect = EFFECT_FACADE,
        .power = 70,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Facade,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FOCUS_PUNCH] =
    {
        .name = COMPOUND_STRING("Focus Punch"),
        .description = COMPOUND_STRING(
            "Powerful attack,\nmoves last. "
            "The\nuser flinches if\nhit."),
        .effect = EFFECT_FOCUS_PUNCH,
        .power = 150,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = -3,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .mirrorMoveBanned = TRUE,
        .punchingMove = TRUE,
        .meFirstBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_FocusPunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SMELLING_SALTS] =
    {
        .name = COMPOUND_STRING("Smelling Salts"),
        .description = COMPOUND_STRING(
            "Powerful against\nparalyzed "
            "foes,\nbut also heals\nthem."),
        .effect = EFFECT_DOUBLE_POWER_ON_ARG_STATUS,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 70 : 60,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .status = STATUS1_PARALYSIS },
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_REMOVE_STATUS,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FORCE_PALM, COMBO_STARTER_THUNDER_WAVE, COMBO_STARTER_GLARE},
        .battleAnimScript = gBattleAnimMove_SmellingSalts,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FOLLOW_ME] =
    {
        .name = COMPOUND_STRING("Follow Me"),
        .description = COMPOUND_STRING(
            "Draws attention to\nmake "
            "foes attack\nonly the user."),
        .effect = EFFECT_FOLLOW_ME,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = B_UPDATED_MOVE_DATA >= GEN_6 ? 2 : 3,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FollowMe,
        .validApprenticeMove = TRUE,
    },

    [MOVE_NATURE_POWER] =
    {
        .name = COMPOUND_STRING("Nature Power"),
        .description = COMPOUND_STRING(
            "The type of attack\nvaries "
            "depending\non the location."),
        .effect = EFFECT_NATURE_POWER,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = B_UPDATED_MOVE_FLAGS >= GEN_6 ? TARGET_SELECTED : TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = (B_UPDATED_MOVE_FLAGS >= GEN_7 || B_UPDATED_MOVE_FLAGS < GEN_3),
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .mimicBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NaturePower,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CHARGE] =
    {
        .name = COMPOUND_STRING("Charge"),
        .description = COMPOUND_STRING(
            "Charges power to\nboost the "
            "Electric\nmove used next."),
        .effect = EFFECT_CHARGE,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_CHARGE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Charge,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TAUNT] =
    {
        .name = COMPOUND_STRING("Taunt"),
        .description = COMPOUND_STRING(
            "Taunts the foe\ninto only "
            "using\nattack moves."),
        .effect = EFFECT_TAUNT,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .ignoresSubstitute = TRUE,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_4,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION : CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_TAUNT,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Taunt,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HELPING_HAND] =
    {
        .name = COMPOUND_STRING("Helping Hand"),
        .description = COMPOUND_STRING(
            "Boosts the power\nof ally "
            "\nrecipient's moves."),
        .effect = EFFECT_HELPING_HAND,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = B_UPDATED_MOVE_DATA >= GEN_4 ? TARGET_ALLY : TARGET_USER,
        .priority = 5,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HelpingHand,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TRICK] =
    {
        .name = COMPOUND_STRING("Trick"),
        .description = COMPOUND_STRING(
            "Tricks the foe\ninto trading "
            "held\nitems."),
        .effect = EFFECT_TRICK,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_2 },
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Trick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROLE_PLAY] =
    {
        .name = COMPOUND_STRING("Role Play"),
        .description = COMPOUND_STRING(
            "Mimics the target\nand "
            "copies its\nAbility."),
        .effect = EFFECT_ROLE_PLAY,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RolePlay,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WISH] =
    {
        .name = COMPOUND_STRING("Wish"),
        .description = COMPOUND_STRING(
            "A wish that\nrestores HP. "
            "It\ntakes time to\nwork."),
        .effect = EFFECT_WISH,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .healingMove = TRUE,
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_WISH,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Wish,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ASSIST] =
    {
        .name = COMPOUND_STRING("Assist"),
        .description = COMPOUND_STRING(
            "Attacks randomly\nwith one "
            "of the\npartner's moves."),
        .effect = EFFECT_ASSIST,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = (B_UPDATED_MOVE_FLAGS >= GEN_7 || B_UPDATED_MOVE_FLAGS < GEN_3),
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_4,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .mimicBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Assist,
        .validApprenticeMove = TRUE,
    },

    [MOVE_INGRAIN] =
    {
        .name = COMPOUND_STRING("Ingrain"),
        .description = COMPOUND_STRING(
            "Lays roots that\nrestore HP. "
            "The\nuser can't switch\nout."),
        .effect = EFFECT_INGRAIN,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Ingrain,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SUPERPOWER] =
    {
        .name = COMPOUND_STRING("Superpower"),
        .description = COMPOUND_STRING(
            "Boosts strength\nsharply, "
            "but\nlowers abilities."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_DEF_DOWN,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_LOCK_ON, COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_Superpower,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MAGIC_COAT] =
    {
        .name = COMPOUND_STRING("Magic Coat"),
        .description = COMPOUND_STRING(
            "Reflects special\neffects "
            "back to\nthe attacker."),
        .effect = EFFECT_MAGIC_COAT,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_DEPENDS,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_2 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MagicCoat,
        .validApprenticeMove = TRUE,
    },

    [MOVE_RECYCLE] =
    {
        .name = COMPOUND_STRING("Recycle"),
        .description = COMPOUND_STRING(
            "Recycles a used\nitem for "
            "one more\nuse."),
        .effect = EFFECT_RECYCLE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_2 },
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE : CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Recycle,
        .validApprenticeMove = TRUE,
    },

    [MOVE_REVENGE] =
    {
        .name = COMPOUND_STRING("Revenge"),
        .description = sRevengeDescription,
        .effect = EFFECT_REVENGE,
        .power = 60,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = -4,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_REVENGE,
        .contestComboMoves = {COMBO_STARTER_PAYBACK},
        .battleAnimScript = gBattleAnimMove_Revenge,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BRICK_BREAK] =
    {
        .name = COMPOUND_STRING("Brick Break"),
        .description = COMPOUND_STRING(
            "Destroys barriers\nsuch as "
            "REFLECT\nand causes damage."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BREAK_SCREEN,
            .preAttackEffect = TRUE,
        }),
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_BrickBreak,
        .validApprenticeMove = TRUE,
    },

    [MOVE_YAWN] =
    {
        .name = COMPOUND_STRING("Yawn"),
        .description = COMPOUND_STRING(
            "Lulls the foe into\nyawning, "
            "then\nsleeping next\nturn."),
        .effect = EFFECT_YAWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_YAWN,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Yawn,
        .validApprenticeMove = TRUE,
    },

    [MOVE_KNOCK_OFF] =
    {
        .name = COMPOUND_STRING("Knock Off"),
        .description = COMPOUND_STRING(
            "Knocks down the\nfoe's held "
            "item to\nprevent its use."),
        .effect = EFFECT_KNOCK_OFF,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 65 : 20,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MON : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FAKE_OUT},
        .battleAnimScript = gBattleAnimMove_KnockOff,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ENDEAVOR] =
    {
        .name = COMPOUND_STRING("Endeavor"),
        .description = COMPOUND_STRING(
            "Cuts foe's HP to\nequal "
            "user's HP."),
        .effect = EFFECT_ENDEAVOR,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .parentalBondBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENDURE},
        .battleAnimScript = gBattleAnimMove_Endeavor,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ERUPTION] =
    {
        .name = COMPOUND_STRING("Eruption"),
        .description = COMPOUND_STRING(
            "The higher the\nuser's HP, "
            "the\nmore damage\ncaused."),
        .effect = EFFECT_POWER_BASED_ON_USER_HP,
        .power = 150,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_EARTHQUAKE, COMBO_STARTER_ENDURE, COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_Eruption,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SKILL_SWAP] =
    {
        .name = COMPOUND_STRING("Skill Swap"),
        .description = COMPOUND_STRING(
            "The user swaps\nspecial "
            "abilities\nwith the target."),
        .effect = EFFECT_SKILL_SWAP,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SkillSwap,
        .validApprenticeMove = TRUE,
    },

    [MOVE_IMPRISON] =
    {
        .name = COMPOUND_STRING("Imprison"),
        .description = COMPOUND_STRING(
            "Prevents foes from\nusing "
            "moves known\nby the user."),
        .effect = EFFECT_IMPRISON,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_2 },
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .forcePressure = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_DONT_EXCITE_AUDIENCE : CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Imprison,
        .validApprenticeMove = TRUE,
    },

    [MOVE_REFRESH] =
    {
        .name = COMPOUND_STRING("Refresh"),
        .description = COMPOUND_STRING(
            "Heals poisoning,\nparalysis, "
            "or a\nburn."),
        .effect = EFFECT_REFRESH,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SING, COMBO_STARTER_WATER_SPORT},
        .battleAnimScript = gBattleAnimMove_Refresh,
        .validApprenticeMove = TRUE,
    },

    [MOVE_GRUDGE] =
    {
        .name = COMPOUND_STRING("Grudge"),
        .description = COMPOUND_STRING(
            "If the user\nfaints, deletes "
            "\nall PP of foe's\nlast move."),
        .effect = EFFECT_GRUDGE,
        .power = 0,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_FOLLOW_ME },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN : CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CURSE, COMBO_STARTER_ENCORE, COMBO_STARTER_TAUNT, COMBO_STARTER_TORMENT},
        .battleAnimScript = gBattleAnimMove_Grudge,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SNATCH] =
    {
        .name = COMPOUND_STRING("Snatch"),
        .description = COMPOUND_STRING(
            "Steals the effects\nof the "
            "move the\ntarget uses next."),
        .effect = EFFECT_SNATCH,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_DEPENDS,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_2 },
        .ignoresSubstitute = TRUE,
        .forcePressure = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE : CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Snatch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SECRET_POWER] =
    {
        .name = COMPOUND_STRING("Secret Power"),
        .description = COMPOUND_STRING(
            "An attack with\neffects "
            "that vary\nby location."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SECRET_POWER,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SecretPower,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DIVE] =
    {
        .name = COMPOUND_STRING("Dive"),
        .description = COMPOUND_STRING(
            "Dives underwater\nthe first "
            "turn and\nstrikes next turn."),
        .effect = EFFECT_SEMI_INVULNERABLE,
        .power = B_UPDATED_MOVE_DATA >= GEN_4 ? 80 : 60,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .skyBattleBanned = TRUE,
        .argument.twoTurnAttack = { .stringId =  STRINGID_PKMNHIDUNDERWATER, .status = STATE_UNDERWATER },
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_DIVE,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SURF},
        .battleAnimScript = gBattleAnimMove_Dive,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ARM_THRUST] =
    {
        .name = COMPOUND_STRING("Arm Thrust"),
        .description = COMPOUND_STRING(
            "Straight-arm\npunches that "
            "\nstrike the foe 2\nto 5 times."),
        .effect = EFFECT_HIT,
        .power = 15,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FAKE_OUT, COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_ArmThrust,
    },

    [MOVE_CAMOUFLAGE] =
    {
        .name = COMPOUND_STRING("Camouflage"),
        .description = COMPOUND_STRING(
            "Alters the\nPokémon's type "
            "\ndepending on the\nlocation."),
        .effect = EFFECT_CAMOUFLAGE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES : CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Camouflage,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TAIL_GLOW] =
    {
        .name = COMPOUND_STRING("Tail Glow"),
        .description = COMPOUND_STRING(
        #if B_UPDATED_MOVE_DATA >= GEN_5
            "Flash light that\ndrastically "
        #else
            "Flashes a light\nthat sharply "
        #endif
            "raises Sp. Atk."),
        .effect = B_UPDATED_MOVE_DATA >= GEN_5 ? EFFECT_SPECIAL_ATTACK_UP_3 : EFFECT_SPECIAL_ATTACK_UP_2,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TailGlow,
        .validApprenticeMove = TRUE,
    },

    [MOVE_LUSTER_PURGE] =
    {
        .name = COMPOUND_STRING("Luster Purge"),
        .description = COMPOUND_STRING(
            "Attacks with a\nburst of "
            "light.\nMay lower Sp. Def."),
        .effect = EFFECT_HIT,
        .power = (B_UPDATED_MOVE_DATA >= GEN_9) ? 95 : 70,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 50,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL : CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_LusterPurge,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MIST_BALL] =
    {
        .name = COMPOUND_STRING("Mist Ball"),
        .description = COMPOUND_STRING(
            "Attacks with a\nflurry of "
            "down.\nMay lower Sp. Atk."),
        .effect = EFFECT_HIT,
        .power = (B_UPDATED_MOVE_DATA >= GEN_9) ? 95 : 70,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .chance = 50,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_MistBall,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FEATHER_DANCE] =
    {
        .name = COMPOUND_STRING("Feather Dance"),
        .description = COMPOUND_STRING(
            "Envelops the foe\nwith down "
            "to\nsharply reduce\nAttack."),
        .effect = EFFECT_ATTACK_DOWN_2,
        .power = 0,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .danceMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FeatherDance,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TEETER_DANCE] =
    {
        .name = COMPOUND_STRING("Teeter Dance"),
        .description = COMPOUND_STRING(
            "Confuses all\nPokémon on "
            "the\nscene."),
        .effect = EFFECT_CONFUSE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .danceMove = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_4,
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TeeterDance,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BLAZE_KICK] =
    {
        .name = COMPOUND_STRING("Blaze Kick"),
        .description = COMPOUND_STRING(
            "A kick with a high\ncritical- "
            "hit\nratio. May cause a\nburn."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_FIRE,
        .accuracy = 90,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_BlazeKick,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MUD_SPORT] =
    {
        .name = COMPOUND_STRING("Mud Sport"),
        .description = COMPOUND_STRING(
            "Covers the user in\nmud to "
            "weaken all\nElectric moves."),
        // in theory this should mention 5 turns (gen 6+)
        .effect = EFFECT_MUD_SPORT,
        .power = 0,
        .type = TYPE_GROUND,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_MUD_SPORT,
        .contestComboMoves = {COMBO_STARTER_MUD_SLAP, COMBO_STARTER_SANDSTORM, COMBO_STARTER_WATER_SPORT},
        .battleAnimScript = gBattleAnimMove_MudSport,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ICE_BALL] =
    {
        .name = COMPOUND_STRING("Ice Ball"),
        .description = COMPOUND_STRING(
            "A 5-turn attack\nthat gains "
            "power\non successive\nhits."),
        .effect = EFFECT_ROLLOUT,
        .power = 30,
        .type = TYPE_ICE,
        .accuracy = 90,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ballisticMove = TRUE,
        .instructBanned = TRUE,
        .parentalBondBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL, COMBO_STARTER_DEFENSE_CURL},
        .battleAnimScript = gBattleAnimMove_IceBall,
    },

    [MOVE_NEEDLE_ARM] =
    {
        .name = COMPOUND_STRING("Needle Arm"),
        .description = COMPOUND_STRING(
            "Attacks with\nthorny arms. "
            "May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS < GEN_4,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NeedleArm,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SLACK_OFF] =
    {
        .name = COMPOUND_STRING("Slack Off"),
        .description = COMPOUND_STRING(
            "Slacks off and\nrestores "
            "half the\nmaximum HP."),
        .effect = EFFECT_RESTORE_HP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 5 : 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SlackOff,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HYPER_VOICE] =
    {
        .name = COMPOUND_STRING("Hyper Voice"),
        .description = COMPOUND_STRING(
            "A loud attack that\nuses "
            "sound waves\nto injure."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MONS : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HyperVoice,
        .validApprenticeMove = TRUE,
    },

    [MOVE_POISON_FANG] =
    {
        .name = COMPOUND_STRING("Poison Fang"),
        .description = COMPOUND_STRING(
            "A sharp-fanged\nattack. "
            "May badly\npoison the foe."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_TOXIC,
            .chance = B_UPDATED_MOVE_DATA >= GEN_6 ? 50 : 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PoisonFang,
    },

    [MOVE_CRUSH_CLAW] =
    {
        .name = COMPOUND_STRING("Crush Claw"),
        .description = COMPOUND_STRING(
            "Tears at the foe\nwith sharp "
            "claws.\nMay lower Defense."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_NORMAL,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 50,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SWORDS_DANCE},
        .battleAnimScript = gBattleAnimMove_CrushClaw,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BLAST_BURN] =
    {
        .name = COMPOUND_STRING("Blast Burn"),
        .description = COMPOUND_STRING(
            "Powerful, but\nleaves the "
            "user\nimmobile the next\nturn."),
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_FIRE,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_BlastBurn,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HYDRO_CANNON] =
    {
        .name = COMPOUND_STRING("Hydro Cannon"),
        .description = COMPOUND_STRING(
            "Powerful, but\nleaves the "
            "user\nimmobile the next\nturn."),
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_WATER,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_HydroCannon,
        .validApprenticeMove = TRUE,
    },

    [MOVE_METEOR_MASH] =
    {
        .name = COMPOUND_STRING("Meteor Mash"),
        .description = COMPOUND_STRING(
            "Fires a\nmeteor-like punch.\n"
            "May raise Attack."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 100,
        .type = TYPE_STEEL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_PLUS_1,
            .self = TRUE,
            .chance = 20,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MeteorMash,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ASTONISH] =
    {
        .name = COMPOUND_STRING("Astonish"),
        .description = COMPOUND_STRING(
            "An attack that may\nshock "
            "the foe into\nflinching."),
        .effect = EFFECT_HIT,
        .power = 30,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS < GEN_4,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Astonish,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WEATHER_BALL] =
    {
        .name = COMPOUND_STRING("Weather Ball"),
        .description = COMPOUND_STRING(
            "The move's type\nand power "
            "change\nwith the weather."),
        .effect = EFFECT_WEATHER_BALL,
        .power = 50,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .zMove = { .powerOverride = 160 },
        .ballisticMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL, COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SANDSTORM, COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_WeatherBall,
        .validApprenticeMove = TRUE,
    },

    [MOVE_AROMATHERAPY] =
    {
        .name = COMPOUND_STRING("Aromatherapy"),
        .description = COMPOUND_STRING(
            "Heals all status\nproblems "
            "with a\nsoothing scent."),
        .effect = EFFECT_HEAL_BELL,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS < GEN_6,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE : CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Aromatherapy,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FAKE_TEARS] =
    {
        .name = COMPOUND_STRING("Fake Tears"),
        .description = COMPOUND_STRING(
            "Feigns crying to\nsharply "
            "lower the\nfoe's Sp. Def."),
        .effect = EFFECT_SPECIAL_DEFENSE_DOWN_2,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUICKLY_GROW_BORED :
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FakeTears,
        .validApprenticeMove = TRUE,
    },

    [MOVE_AIR_CUTTER] =
    {
        .name = COMPOUND_STRING("Air Cutter"),
        .description = COMPOUND_STRING(
            "Hacks with\nrazorlike wind. "
            "\nHigh critical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 60 : 55,
        .type = TYPE_FLYING,
        .accuracy = 95,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 25,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .slicingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AirCutter,
        .validApprenticeMove = TRUE,
    },

    [MOVE_OVERHEAT] =
    {
        .name = COMPOUND_STRING("Overheat"),
        .description = COMPOUND_STRING(
            "Allows a\nfull-power attack,\n"
            "but sharply lowers\nSp. Atk."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 130 : 140,
        .type = TYPE_FIRE,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = B_UPDATED_MOVE_DATA < GEN_4,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_2,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_Overheat,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ODOR_SLEUTH] =
    {
        .name = COMPOUND_STRING("Odor Sleuth"),
        .description = COMPOUND_STRING(
            "Negate evasiveness\nand "
            "Ghost type's\nimmunities."),
        .effect = EFFECT_FORESIGHT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_4 ? 0 : 100,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .ignoresSubstitute = TRUE,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_OdorSleuth,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROCK_TOMB] =
    {
        .name = COMPOUND_STRING("Rock Tomb"),
        .description = COMPOUND_STRING(
            "Stops the foe from\nmoving "
            "with rocks\nand cuts Speed."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 60 : 50,
        .type = TYPE_ROCK,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 95 : 80,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 15 : 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ROCK_THROW},
        .battleAnimScript = gBattleAnimMove_RockTomb,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SILVER_WIND] =
    {
        .name = COMPOUND_STRING("Silver Wind"),
        .description = COMPOUND_STRING(
            "A powdery attack\nthat may "
            "raise\nabilities."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = B_EXTRAPOLATED_MOVE_FLAGS,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ALL_STATS_UP,
            .self = TRUE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SilverWind,
        .validApprenticeMove = TRUE,
    },

    [MOVE_METAL_SOUND] =
    {
        .name = COMPOUND_STRING("Metal Sound"),
        .description = COMPOUND_STRING(
            "Emits a horrible\nscreech "
            "that\nsharply lowers Sp.\nDef."),
        .effect = EFFECT_SPECIAL_DEFENSE_DOWN_2,
        .power = 0,
        .type = TYPE_STEEL,
        .accuracy = 85,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = TRUE,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_METAL_SOUND,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MetalSound,
        .validApprenticeMove = TRUE,
    },

    [MOVE_GRASS_WHISTLE] =
    {
        .name = COMPOUND_STRING("Grass Whistle"),
        .description = COMPOUND_STRING(
            "Lulls the foe into\nsleep "
            "with a\npleasant melody."),
        .effect = EFFECT_NON_VOLATILE_STATUS,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 55,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = TRUE,
        .soundMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_AVOID_STARTLE_ONCE : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_GRASS_WHISTLE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GrassWhistle,
        .validApprenticeMove = TRUE,
    },

    [MOVE_TICKLE] =
    {
        .name = COMPOUND_STRING("Tickle"),
        .description = COMPOUND_STRING(
            "Makes the foe\nlaugh to "
            "lower\nAttack and\nDefense."),
        .effect = EFFECT_TICKLE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS < GEN_4,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Tickle,
        .validApprenticeMove = TRUE,
    },

    [MOVE_COSMIC_POWER] =
    {
        .name = COMPOUND_STRING("Cosmic Power"),
        .description = COMPOUND_STRING(
            "Raises Defense and\nSp. Def "
            "with a\nmystic power."),
        .effect = EFFECT_COSMIC_POWER,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CosmicPower,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WATER_SPOUT] =
    {
        .name = COMPOUND_STRING("Water Spout"),
        .description = COMPOUND_STRING(
            "Inflicts more\ndamage if the "
            "\nuser's HP is high."),
        .effect = EFFECT_POWER_BASED_ON_USER_HP,
        .power = 150,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_WaterSpout,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SIGNAL_BEAM] =
    {
        .name = COMPOUND_STRING("Signal Beam"),
        .description = COMPOUND_STRING(
            "A strange beam\nattack that "
            "may\nconfuse the foe."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SignalBeam,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SHADOW_PUNCH] =
    {
        .name = COMPOUND_STRING("Shadow Punch"),
        .description = COMPOUND_STRING(
            "An unavoidable\npunch that "
            "is\nthrown from\nshadows."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShadowPunch,
        .validApprenticeMove = TRUE,
    },

    [MOVE_EXTRASENSORY] =
    {
        .name = COMPOUND_STRING("Extrasensory"),
        .description = COMPOUND_STRING(
            "Attacks with a\npeculiar "
            "power.\nMay cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 20 : 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS < GEN_4,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 10,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL : CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Extrasensory,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SKY_UPPERCUT] =
    {
        .name = COMPOUND_STRING("Sky Uppercut"),
        .description = COMPOUND_STRING(
            "An uppercut thrown\nas if "
            "leaping into\nthe sky."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_FIGHTING,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .damagesAirborne = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_SkyUppercut,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SAND_TOMB] =
    {
        .name = COMPOUND_STRING("Sand Tomb"),
        .description = COMPOUND_STRING(
            "Traps and hurts\nthe foe in "
            "\nquicksand for\n"BINDING_TURNS" turns."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 35 : 15,
        .type = TYPE_GROUND,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 85 : 70,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_SAND_TOMB,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SANDSTORM},
        .battleAnimScript = gBattleAnimMove_SandTomb,
        .validApprenticeMove = TRUE,
    },

    [MOVE_SHEER_COLD] =
    {
        .name = COMPOUND_STRING("Sheer Cold"),
        .description = COMPOUND_STRING(
            "A chilling attack\nthat "
            "causes\nfainting if it\nhits."),
        .effect = EFFECT_OHKO,
        .power = 1,
        .type = TYPE_ICE,
        .accuracy = 30,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .noAffectOnSameTypeTarget = B_SHEER_COLD_IMMUNITY >= GEN_7,
        .accIncreaseByTenOnSameType = B_SHEER_COLD_ACC >= GEN_7,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL, COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_SheerCold,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MUDDY_WATER] =
    {
        .name = COMPOUND_STRING("Muddy Water"),
        .description = COMPOUND_STRING(
            "Attacks with muddy\nwater. "
            "May lower\naccuracy."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 95,
        .type = TYPE_WATER,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .skyBattleBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ACC_MINUS_1,
            .chance = 30,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_STARTLE_PREV_MONS : CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_MuddyWater,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BULLET_SEED] =
    {
        .name = COMPOUND_STRING("Bullet Seed"),
        .description = COMPOUND_STRING(
            "Shoots 2 to 5\nseeds in a row "
            "to\nstrike the foe."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 25 : 10,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .ballisticMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH, COMBO_STARTER_ROTOTILLER},
        .battleAnimScript = gBattleAnimMove_BulletSeed,
    },

    [MOVE_AERIAL_ACE] =
    {
        .name = COMPOUND_STRING("Aerial Ace"),
        .description = COMPOUND_STRING(
            "An extremely\nspeedy and "
            "\nunavoidable attack."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AerialAce,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ICICLE_SPEAR] =
    {
        .name = COMPOUND_STRING("Icicle Spear"),
        .description = COMPOUND_STRING(
            "Attacks the foe by\nfiring "
            "2 to 5\nicicles in a row."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 25 : 10,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_IcicleSpear,
    },

    [MOVE_IRON_DEFENSE] =
    {
        .name = COMPOUND_STRING("Iron Defense"),
        .description = COMPOUND_STRING(
            "Hardens the body's\nsurface "
            "to sharply\nraise Defense."),
        .effect = EFFECT_DEFENSE_UP_2,
        .power = 0,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_IronDefense,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BLOCK] =
    {
        .name = COMPOUND_STRING("Block"),
        .description = COMPOUND_STRING(
            "Blocks the foe's\nway and "
            "prevents\nescape."),
        .effect = EFFECT_MEAN_LOOK,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_BLOCK,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Block,
        .validApprenticeMove = TRUE,
    },

    [MOVE_HOWL] =
    {
        .name = COMPOUND_STRING("Howl"),
        .description = COMPOUND_STRING(
            "Howls to raise the\nspirit "
            "and boosts\nAttack."),
        .power = 0,
        .effect = EFFECT_ATTACK_UP,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 40,
        .target = B_UPDATED_MOVE_DATA >= GEN_8 ? TARGET_USER_AND_ALLY: TARGET_USER ,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .soundMove = B_UPDATED_MOVE_FLAGS >= GEN_8,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BETTER_IF_LAST : CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Howl,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DRAGON_CLAW] =
    {
        .name = COMPOUND_STRING("Dragon Claw"),
        .description = COMPOUND_STRING(
            "Slashes the foe\nwith sharp "
            "claws."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_DANCE, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_RUSH, COMBO_STARTER_DRAGON_TAIL},
        .battleAnimScript = gBattleAnimMove_DragonClaw,
        .validApprenticeMove = TRUE,
    },

    [MOVE_FRENZY_PLANT] =
    {
        .name = COMPOUND_STRING("Frenzy Plant"),
        .description = COMPOUND_STRING(
            "Powerful, but\nleaves the "
            "user\nimmobile the next\nturn."),
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_GRASS,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .skyBattleBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_FrenzyPlant,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BULK_UP] =
    {
        .name = COMPOUND_STRING("Bulk Up"),
        .description = COMPOUND_STRING(
            "Bulks up the body\nto boost "
            "both\nAttack and\nDefense."),
        .effect = EFFECT_BULK_UP,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BulkUp,
        .validApprenticeMove = TRUE,
    },

    [MOVE_BOUNCE] =
    {
        .name = COMPOUND_STRING("Bounce"),
        .description = COMPOUND_STRING(
            "Bounces up, then\ndown the "
            "next\nturn. May\nparalyze."),
        .effect = EFFECT_SEMI_INVULNERABLE,
        .power = 85,
        .type = TYPE_FLYING,
        .accuracy = 85,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .gravityBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .argument.twoTurnAttack = { .stringId =  STRINGID_PKMNSPRANGUP, .status = STATE_ON_AIR },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Bounce,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MUD_SHOT] =
    {
        .name = COMPOUND_STRING("Mud Shot"),
        .description = COMPOUND_STRING(
            "Hurls mud at the\nfoe and "
            "reduces\nSpeed."),
        .effect = EFFECT_HIT,
        .power = 55,
        .type = TYPE_GROUND,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_HIGHLY_APPEALING : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SANDSTORM},
        .battleAnimScript = gBattleAnimMove_MudShot,
    },

    [MOVE_POISON_TAIL] =
    {
        .name = COMPOUND_STRING("Poison Tail"),
        .description = COMPOUND_STRING(
            "Has a high\ncritical-hit "
            "\nratio. May also\npoison."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_POISON,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_PoisonTail,
        .validApprenticeMove = TRUE,
    },

    [MOVE_COVET] =
    {
        .name = COMPOUND_STRING("Covet"),
        .description = COMPOUND_STRING(
            "Cutely begs to\nobtain an "
            "item\nheld by the foe."),
        .effect = EFFECT_STEAL_ITEM,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 60 : 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 25 : 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = B_UPDATED_MOVE_DATA >= GEN_4,
        .meFirstBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_COVET,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Covet,
        .validApprenticeMove = TRUE,
    },

    [MOVE_VOLT_TACKLE] =
    {
        .name = COMPOUND_STRING("Volt Tackle"),
        #if B_UPDATED_MOVE_DATA >= GEN_4
        .description = COMPOUND_STRING(
            "A\nlife-risking\ntackle that "
            "hurts\nthe user. May\nparalyze."),
        #else
        .description = COMPOUND_STRING(
            "A life-risking\ntackle that "
            "\nslightly hurts the\nuser."),
        #endif
        .effect = EFFECT_RECOIL,
        .power = 120,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 33 },
        .makesContact = TRUE,
        #if B_UPDATED_MOVE_DATA >= GEN_4
            .additionalEffects = ADDITIONAL_EFFECTS({
                .moveEffect = MOVE_EFFECT_PARALYSIS,
                .chance = 10,
            }),
        #endif
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_VoltTackle,
        .validApprenticeMove = TRUE,
    },

    [MOVE_MAGICAL_LEAF] =
    {
        .name = COMPOUND_STRING("Magical Leaf"),
        .description = COMPOUND_STRING(
            "Attacks with a\nstrange leaf "
            "that\ncannot be evaded."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_MagicalLeaf,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WATER_SPORT] =
    {
        .name = COMPOUND_STRING("Water Sport"),
        .description = COMPOUND_STRING(
            "The user becomes\nsoaked to "
            "weaken\nall Fire moves."),
        // in theory this should mention 5 turns (gen6+)
        .effect = EFFECT_WATER_SPORT,
        .power = 0,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_WATER_SPORT,
        .contestComboMoves = {COMBO_STARTER_MUD_SPORT, COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_WaterSport,
        .validApprenticeMove = TRUE,
    },

    [MOVE_CALM_MIND] =
    {
        .name = COMPOUND_STRING("Calm Mind"),
        .description = COMPOUND_STRING(
            "Raises Sp. Atk and\nSp. Def "
            "by\nfocusing the mind."),
        .effect = EFFECT_CALM_MIND,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS : CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_CALM_MIND,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CalmMind,
        .validApprenticeMove = TRUE,
    },

    [MOVE_LEAF_BLADE] =
    {
        .name = COMPOUND_STRING("Leaf Blade"),
        .description = COMPOUND_STRING(
            "Slashes with a\nsharp leaf. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_4 ? 90 : 70,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LeafBlade,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DRAGON_DANCE] =
    {
        .name = COMPOUND_STRING("Dragon Dance"),
        .description = COMPOUND_STRING(
            "A mystical dance\nthat ups "
            "Attack\nand Speed."),
        .effect = EFFECT_DRAGON_DANCE,
        .power = 0,
        .type = TYPE_DRAGON,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .danceMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_DRAGON_DANCE,
        .contestComboMoves = {COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_RUSH, COMBO_STARTER_DRAGON_TAIL},
        .battleAnimScript = gBattleAnimMove_DragonDance,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROCK_BLAST] =
    {
        .name = COMPOUND_STRING("Rock Blast"),
        .description = COMPOUND_STRING(
            "Hurls boulders at\nthe foe "
            "2 to 5\ntimes in a row."),
        .effect = EFFECT_HIT,
        .power = 25,
        .type = TYPE_ROCK,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 90 : 80,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .ballisticMove = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING : CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RockBlast,
    },

    [MOVE_SHOCK_WAVE] =
    {
        .name = COMPOUND_STRING("Shock Wave"),
        .description = COMPOUND_STRING(
            "A fast and\nunavoidable "
            "\nelectric attack."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_ShockWave,
        .validApprenticeMove = TRUE,
    },

    [MOVE_WATER_PULSE] =
    {
        .name = COMPOUND_STRING("Water Pulse"),
        .description = COMPOUND_STRING(
            "Attacks with\nultrasonic "
            "waves.\nMay confuse the\nfoe."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .pulseMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 20,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION : CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_WaterPulse,
        .validApprenticeMove = TRUE,
    },

    [MOVE_DOOM_DESIRE] =
    {
        .name = COMPOUND_STRING("Doom Desire"),
        .description = COMPOUND_STRING(
            "Summons strong\nlight to "
            "attack 2\nturns later."),
        .effect = EFFECT_FUTURE_SIGHT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 140 : 120,
        .type = TYPE_STEEL,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 100 : 85,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE, //C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_LAST :
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DoomDesire,
        .validApprenticeMove = TRUE,
    },

    [MOVE_PSYCHO_BOOST] =
    {
        .name = COMPOUND_STRING("Psycho Boost"),
        .description = COMPOUND_STRING(
            "Allows a\nfull-power attack,\n"
            "but sharply lowers\nSp. Atk."),
        .effect = EFFECT_HIT,
        .power = 140,
        .type = TYPE_PSYCHIC,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_2,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CALM_MIND},
        .battleAnimScript = gBattleAnimMove_PsychoBoost,
        .validApprenticeMove = TRUE,
    },

    [MOVE_ROOST] =
    {
        .name = COMPOUND_STRING("Roost"),
        .description = COMPOUND_STRING(
            "Restores the\nuser's HP by "
            "half\nof its max HP."),
        .effect = EFFECT_ROOST,
        .power = 0,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 5 : 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_BRAVE_BIRD},
        .battleAnimScript = gBattleAnimMove_Roost,
    },

    [MOVE_GRAVITY] =
    {
        .name = COMPOUND_STRING("Gravity"),
        .description = COMPOUND_STRING(
            "Gravity is\nintensified "
            "\nnegating\nlevitation."),
        .effect = EFFECT_GRAVITY,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Gravity,
    },

    [MOVE_MIRACLE_EYE] =
    {
        .name = COMPOUND_STRING("Miracle Eye"),
        .description = COMPOUND_STRING(
            "Negate evasiveness\nand "
            "Dark type's\nimmunities."),
        .effect = EFFECT_MIRACLE_EYE,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresSubstitute = TRUE,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MiracleEye,
    },

    [MOVE_WAKE_UP_SLAP] =
    {
        .name = COMPOUND_STRING("Wake-Up Slap"),
        .description = COMPOUND_STRING(
            "Powerful against\nsleeping "
            "foes, but\nalso wakes them."),
        .effect = EFFECT_DOUBLE_POWER_ON_ARG_STATUS,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 70 : 60,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .status = STATUS1_SLEEP },
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_REMOVE_STATUS,
        }),
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_LOVELY_KISS, COMBO_STARTER_SPORE, COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE, COMBO_STARTER_SING, COMBO_STARTER_YAWN, COMBO_STARTER_HYPNOSIS, COMBO_STARTER_DARK_VOID, COMBO_STARTER_GRASS_WHISTLE, COMBO_STARTER_SLEEP_POWDER},
        .battleAnimScript = gBattleAnimMove_WakeUpSlap,
    },

    [MOVE_HAMMER_ARM] =
    {
        .name = COMPOUND_STRING("Hammer Arm"),
        .description = COMPOUND_STRING(
            "A swinging fist\nattack "
            "that also\nlowers Speed."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FIGHTING,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_HammerArm,
    },

    [MOVE_GYRO_BALL] =
    {
        .name = COMPOUND_STRING("Gyro Ball"),
        .description = COMPOUND_STRING(
            "A high-speed spin\nthat does "
            "more\ndamage to faster\nfoes."),
        .effect = EFFECT_GYRO_BALL,
        .power = 1,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ballisticMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GyroBall,
    },

    [MOVE_HEALING_WISH] =
    {
        .name = COMPOUND_STRING("Healing Wish"),
        .description = sHealingWishDescription,
        .effect = EFFECT_HEALING_WISH,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .healingMove = TRUE,
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HealingWish,
    },

    [MOVE_BRINE] =
    {
        .name = COMPOUND_STRING("Brine"),
        .description = COMPOUND_STRING(
            "Does double damage\nto foes "
            "with half\nHP or less."),
        .effect = EFFECT_BRINE,
        .power = 65,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Brine,
    },

    [MOVE_NATURAL_GIFT] =
    {
        .name = COMPOUND_STRING("Natural Gift"),
        .description = COMPOUND_STRING(
            "The effectiveness\nvaries "
            "with the\nheld Berry."),
        .effect = EFFECT_NATURAL_GIFT,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NaturalGift,
    },

    [MOVE_FEINT] =
    {
        .name = COMPOUND_STRING("Feint"),
        .description = sFeintDescription,
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 30 : 50,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 2,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_6,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FEINT,
        }),
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Feint,
    },

    [MOVE_PLUCK] =
    {
        .name = COMPOUND_STRING("Pluck"),
        .description = sPluckDescription,
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BUG_BITE,
        }),
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Pluck,
    },

    [MOVE_TAILWIND] =
    {
        .name = COMPOUND_STRING("Tailwind"),
        .description = COMPOUND_STRING(
            "Whips up a breeze,\ndoubling "
        #if B_TAILWIND_TURNS >= GEN_5
            "ally\nSpeed for 4 turns."),
        #else
            "ally\nSpeed for 3 turns."),
        #endif
        .effect = EFFECT_TAILWIND,
        .power = 0,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 15 : 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_BOOST_CRITS },
        .snatchAffected = TRUE,
        .windMove = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Tailwind,
    },

    [MOVE_ACUPRESSURE] =
    {
        .name = COMPOUND_STRING("Acupressure"),
        .description = COMPOUND_STRING(
            "The user sharply\nraises "
            "one of its\nstats."),
        .effect = EFFECT_ACUPRESSURE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER_OR_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_BOOST_CRITS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .snatchAffected = B_UPDATED_MOVE_FLAGS < GEN_5,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Acupressure,
    },

    [MOVE_METAL_BURST] =
    {
        .name = COMPOUND_STRING("Metal Burst"),
        .description = COMPOUND_STRING(
            "Retaliates any hit\nwith "
            "greater\npower."),
        .effect = EFFECT_REFLECT_DAMAGE,
        .power = 1,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = {
            .reflectDamage.damagePercent = 150,
            .reflectDamage.damageCategories = 1u << DAMAGE_CATEGORY_PHYSICAL | 1u << DAMAGE_CATEGORY_SPECIAL,
        },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS < GEN_5,
        .meFirstBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_METAL_SOUND, COMBO_STARTER_ENCORE, COMBO_STARTER_TAUNT, COMBO_STARTER_TORMENT},
        .battleAnimScript = gBattleAnimMove_MetalBurst,
    },

    [MOVE_U_TURN] =
    {
        .name = COMPOUND_STRING("U-turn"),
        .description = sUTurnDescription,
        .effect = EFFECT_HIT_ESCAPE,
        .power = 70,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_UTurn,
    },

    [MOVE_CLOSE_COMBAT] =
    {
        .name = COMPOUND_STRING("Close Combat"),
        .description = sCloseCombatDescription,
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_SPDEF_DOWN,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER},
        .battleAnimScript = gBattleAnimMove_CloseCombat,
    },

    [MOVE_PAYBACK] =
    {
        .name = COMPOUND_STRING("Payback"),
        .description = COMPOUND_STRING(
            "An attack that\ngains power "
            "if the\nuser moves last."),
        .effect = EFFECT_PAYBACK,
        .power = 50,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_PAYBACK,
        .contestComboMoves = {COMBO_STARTER_REVENGE},
        .battleAnimScript = gBattleAnimMove_Payback,
    },

    [MOVE_ASSURANCE] =
    {
        .name = COMPOUND_STRING("Assurance"),
        .description = COMPOUND_STRING(
            "An attack that\ngains power "
            "if the\nfoe has been hurt."),
        .effect = EFFECT_ASSURANCE,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 60 : 50,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_PAYBACK, COMBO_STARTER_REVENGE},
        .battleAnimScript = gBattleAnimMove_Assurance,
    },

    [MOVE_EMBARGO] =
    {
        .name = COMPOUND_STRING("Embargo"),
        .description = COMPOUND_STRING(
            "Prevents the foe\nfrom "
            "using any\nitems."),
        .effect = EFFECT_EMBARGO,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Embargo,
    },

    [MOVE_FLING] =
    {
        .name = COMPOUND_STRING("Fling"),
        .description = COMPOUND_STRING(
            "The effectiveness\nvaries "
            "with the\nheld item."),
        .effect = EFFECT_FLING,
        .power = 1,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .parentalBondBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CELEBRATE, COMBO_STARTER_COVET, COMBO_STARTER_HAPPY_HOUR, COMBO_STARTER_WISH},
        .battleAnimScript = gBattleAnimMove_Fling,
    },

    [MOVE_PSYCHO_SHIFT] =
    {
        .name = COMPOUND_STRING("Psycho Shift"),
        .description = COMPOUND_STRING(
            "Transfers status\nproblems "
            "to the\nfoe."),
        .effect = EFFECT_PSYCHO_SHIFT,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 100 : 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_2 },
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PsychoShift,
    },

    [MOVE_TRUMP_CARD] =
    {
        .name = COMPOUND_STRING("Trump Card"),
        .description = COMPOUND_STRING(
            "The less PP the\nmove has "
            "the more\ndamage it does."),
        .effect = EFFECT_TRUMP_CARD,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TrumpCard,
    },

    [MOVE_HEAL_BLOCK] =
    {
        .name = COMPOUND_STRING("Heal Block"),
        .description = COMPOUND_STRING(
            "Prevents the foes\nfrom "
            "recovering HP\nfor 5 turns."),
        .effect = EFFECT_HEAL_BLOCK,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_2 },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HealBlock,
    },

    [MOVE_WRING_OUT] =
    {
        .name = COMPOUND_STRING("Wring Out"),
        .description = sWringOutDescription,
        .effect = EFFECT_POWER_BASED_ON_TARGET_HP,
        .power = 120,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WringOut,
    },

    [MOVE_POWER_TRICK] =
    {
        .name = COMPOUND_STRING("Power Trick"),
        .description = COMPOUND_STRING(
            "The user swaps its\nAttack "
            "and Defense\nstats."),
        .effect = EFFECT_POWER_TRICK,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PowerTrick,
    },

    [MOVE_GASTRO_ACID] =
    {
        .name = COMPOUND_STRING("Gastro Acid"),
        .description = COMPOUND_STRING(
            "Stomach acid\nsuppresses "
            "the\nfoe's Ability."),
        .effect = EFFECT_GASTRO_ACID,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GastroAcid,
    },

    [MOVE_LUCKY_CHANT] =
    {
        .name = COMPOUND_STRING("Lucky Chant"),
        .description = COMPOUND_STRING(
            "Prevents the foe\nfrom "
            "landing\ncritical hits."),
        .effect = EFFECT_LUCKY_CHANT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_LUCKY_CHANT,
        .contestComboMoves = {COMBO_STARTER_HEAL_BELL},
        .battleAnimScript = gBattleAnimMove_LuckyChant,
    },

    [MOVE_ME_FIRST] =
    {
        .name = COMPOUND_STRING("Me First"),
        .description = COMPOUND_STRING(
            "Executes the foe's\nattack "
            "with\ngreater power."),
        .effect = EFFECT_ME_FIRST,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_OPPONENT,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_2 },
        .ignoresSubstitute = TRUE,
        .metronomeBanned = TRUE,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = (B_UPDATED_MOVE_FLAGS >= GEN_7 || B_UPDATED_MOVE_FLAGS < GEN_3),
        .assistBanned = TRUE,
        .mimicBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MeFirst,
    },

    [MOVE_COPYCAT] =
    {
        .name = COMPOUND_STRING("Copycat"),
        .description = COMPOUND_STRING(
            "The user mimics\nthe last "
            "move used\nby a foe."),
        .effect = EFFECT_COPYCAT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ACC_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = (B_UPDATED_MOVE_FLAGS >= GEN_7 || B_UPDATED_MOVE_FLAGS < GEN_3),
        .assistBanned = TRUE,
        .mimicBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Copycat,
    },

    [MOVE_POWER_SWAP] =
    {
        .name = COMPOUND_STRING("Power Swap"),
        .description = COMPOUND_STRING(
            "Swaps changes to\nAttack "
            "and Sp. Atk\nwith the foe."),
        .effect = EFFECT_POWER_SWAP,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PowerSwap,
    },

    [MOVE_GUARD_SWAP] =
    {
        .name = COMPOUND_STRING("Guard Swap"),
        .description = COMPOUND_STRING(
            "Swaps changes to\nDefense "
            "and Sp.\nDef with the foe."),
        .effect = EFFECT_GUARD_SWAP,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GuardSwap,
    },

    [MOVE_PUNISHMENT] =
    {
        .name = COMPOUND_STRING("Punishment"),
        .description = COMPOUND_STRING(
            "Does more damage\nthe more "
            "the foe\nhas powered up."),
        .effect = EFFECT_PUNISHMENT,
        .power = 60,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Punishment,
    },

    [MOVE_LAST_RESORT] =
    {
        .name = COMPOUND_STRING("Last Resort"),
        .description = COMPOUND_STRING(
            "Can only be used\nif every "
            "other\nmove has been\nused."),
        .effect = EFFECT_LAST_RESORT,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 140 : 130,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LastResort,
    },

    [MOVE_WORRY_SEED] =
    {
        .name = COMPOUND_STRING("Worry Seed"),
        .description = COMPOUND_STRING(
            "Plants a seed on\nthe foe "
            "giving it\nInsomnia."),
        .effect = EFFECT_OVERWRITE_ABILITY,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .overwriteAbility = ABILITY_INSOMNIA },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_WORRY_SEED,
        .contestComboMoves = {COMBO_STARTER_LEECH_SEED, COMBO_STARTER_ROTOTILLER},
        .battleAnimScript = gBattleAnimMove_WorrySeed,
    },

    [MOVE_SUCKER_PUNCH] =
    {
        .name = COMPOUND_STRING("Sucker Punch"),
        .description = sSuckerPunchDescription,
        .effect = EFFECT_SUCKER_PUNCH,
        .power = B_UPDATED_MOVE_DATA >= GEN_7 ? 70 : 80,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SuckerPunch,
    },

    [MOVE_TOXIC_SPIKES] =
    {
        .name = COMPOUND_STRING("Toxic Spikes"),
        .description = COMPOUND_STRING(
            "Sets spikes that\npoison a "
            "foe\nswitching in."),
        .effect = EFFECT_TOXIC_SPIKES,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_OPPONENTS_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .forcePressure = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_TOXIC_SPIKES,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ToxicSpikes,
    },

    [MOVE_HEART_SWAP] =
    {
        .name = COMPOUND_STRING("Heart Swap"),
        .description = COMPOUND_STRING(
            "Swaps any stat\nchanges "
            "with the\nfoe."),
        .effect = EFFECT_HEART_SWAP,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_BOOST_CRITS },
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HeartSwap,
    },

    [MOVE_AQUA_RING] =
    {
        .name = COMPOUND_STRING("Aqua Ring"),
        .description = COMPOUND_STRING(
            "Forms a veil of\nwater "
            "that\nrestores HP."),
        .effect = EFFECT_AQUA_RING,
        .power = 0,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AquaRing,
    },

    [MOVE_MAGNET_RISE] =
    {
        .name = COMPOUND_STRING("Magnet Rise"),
        .description = COMPOUND_STRING(
            "The user levitates\nwith "
            "\nelectromagnetism."),
        .effect = EFFECT_MAGNET_RISE,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_EVSN_UP_1 },
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .gravityBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MagnetRise,
    },

    [MOVE_FLARE_BLITZ] =
    {
        .name = COMPOUND_STRING("Flare Blitz"),
        .description = COMPOUND_STRING(
            "A charge that may\nburn the "
            "foe. Also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = 120,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 33 },
        .makesContact = TRUE,
        .thawsUser = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_FlareBlitz,
    },

    [MOVE_FORCE_PALM] =
    {
        .name = COMPOUND_STRING("Force Palm"),
        .description = COMPOUND_STRING(
            "A shock wave\nattack that "
            "may\nparalyze the foe."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_FORCE_PALM,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ForcePalm,
    },

    [MOVE_AURA_SPHERE] =
    {
        .name = COMPOUND_STRING("Aura Sphere"),
        .description = COMPOUND_STRING(
            "Attacks with an\naura blast "
            "that\ncannot be evaded."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 80 : 90,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .pulseMove = TRUE,
        .ballisticMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AuraSphere,
    },

    [MOVE_ROCK_POLISH] =
    {
        .name = COMPOUND_STRING("Rock Polish"),
        .description = COMPOUND_STRING(
            "Polishes the body\nto "
            "sharply raise\nSpeed."),
        .effect = EFFECT_SPEED_UP_2,
        .power = 0,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_ROCK_POLISH,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RockPolish,
    },

    [MOVE_POISON_JAB] =
    {
        .name = COMPOUND_STRING("Poison Jab"),
        .description = COMPOUND_STRING(
            "A stabbing attack\nthat "
            "may poison\nthe foe."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PoisonJab,
    },

    [MOVE_DARK_PULSE] =
    {
        .name = COMPOUND_STRING("Dark Pulse"),
        .description = COMPOUND_STRING(
            "Attacks with a\nhorrible "
            "aura. May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .pulseMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DarkPulse,
    },

    [MOVE_NIGHT_SLASH] =
    {
        .name = COMPOUND_STRING("Night Slash"),
        .description = COMPOUND_STRING(
            "Hits as soon as\npossible. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_DARK,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_NightSlash,
    },

    [MOVE_AQUA_TAIL] =
    {
        .name = COMPOUND_STRING("Aqua Tail"),
        .description = COMPOUND_STRING(
            "The user swings\nits tail "
            "like a\nwave to attack."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_WATER,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_AquaTail,
    },

    [MOVE_SEED_BOMB] =
    {
        .name = COMPOUND_STRING("Seed Bomb"),
        .description = COMPOUND_STRING(
            "A barrage of hard\nseeds "
            "is fired at\nthe foe."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ballisticMove = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ROTOTILLER},
        .battleAnimScript = gBattleAnimMove_SeedBomb,
    },

    [MOVE_AIR_SLASH] =
    {
        .name = COMPOUND_STRING("Air Slash"),
        .description = COMPOUND_STRING(
            "Attacks with a\nblade of "
            "air. May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_FLYING,
        .accuracy = 95,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 15 : 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .slicingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AirSlash,
    },

    [MOVE_X_SCISSOR] =
    {
        .name = COMPOUND_STRING("X-Scissor"),
        .description = COMPOUND_STRING(
            "Slashes the foe\nwith crossed "
            "\nscythes, claws,\netc."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SWORDS_DANCE},
        .battleAnimScript = gBattleAnimMove_XScissor,
    },

    [MOVE_BUG_BUZZ] =
    {
        .name = COMPOUND_STRING("Bug Buzz"),
        .description = COMPOUND_STRING(
            "A damaging sound\nwave that "
            "may\nlower Sp. Def."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTIFUL : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BugBuzz,
    },

    [MOVE_DRAGON_PULSE] =
    {
        .name = COMPOUND_STRING("Dragon Pulse"),
        .description = COMPOUND_STRING(
            "Generates a shock\nwave to "
            "damage the\nfoe."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 85 : 90,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .pulseMove = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DragonPulse,
    },

    [MOVE_DRAGON_RUSH] =
    {
        .name = COMPOUND_STRING("Dragon Rush"),
        .description = COMPOUND_STRING(
            "Tackles the foe\nwith menace. "
            "May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_DRAGON,
        .accuracy = 75,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_DRAGON_RUSH,
        .contestComboMoves = {COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_DANCE, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_TAIL},
        .battleAnimScript = gBattleAnimMove_DragonRush,
    },

    [MOVE_POWER_GEM] =
    {
        .name = COMPOUND_STRING("Power Gem"),
        .description = COMPOUND_STRING(
            "Attacks with rays\nof light "
            "that\nsparkle like\ndiamonds."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 80 : 70,
        .type = TYPE_ROCK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PowerGem,
    },

    [MOVE_DRAIN_PUNCH] =
    {
        .name = COMPOUND_STRING("Drain Punch"),
        .description = sMegaDrainDescription,
        .effect = EFFECT_ABSORB,
        .power = B_UPDATED_MOVE_DATA >= GEN_5 ? 75 : 60,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_5 ? 10 : 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .absorbPercentage = 50 },
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_DrainPunch,
    },

    [MOVE_VACUUM_WAVE] =
    {
        .name = COMPOUND_STRING("Vacuum Wave"),
        .description = COMPOUND_STRING(
            "Whirls its fists\nto send "
            "a wave\nthat strikes\nfirst."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_VacuumWave,
    },

    [MOVE_FOCUS_BLAST] =
    {
        .name = COMPOUND_STRING("Focus Blast"),
        .description = COMPOUND_STRING(
            "Attacks at full\npower. "
            "May lower\nSp. Def."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_FIGHTING,
        .accuracy = 70,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_FocusBlast,
    },

    [MOVE_ENERGY_BALL] =
    {
        .name = COMPOUND_STRING("Energy Ball"),
        .description = COMPOUND_STRING(
            "Draws power from\nnature to "
            "attack.\nMay lower Sp. Def."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 90 : 80,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_EnergyBall,
    },

    [MOVE_BRAVE_BIRD] =
    {
        .name = COMPOUND_STRING("Brave Bird"),
        .description = COMPOUND_STRING(
            "A low altitude\ncharge that "
            "also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = 120,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 33 },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_BRAVE_BIRD,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BraveBird,
    },

    [MOVE_EARTH_POWER] =
    {
        .name = COMPOUND_STRING("Earth Power"),
        .description = COMPOUND_STRING(
            "Makes the ground\nerupt with "
            "power.\nMay lower Sp. Def."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .skyBattleBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_EarthPower,
    },

    [MOVE_SWITCHEROO] =
    {
        .name = COMPOUND_STRING("Switcheroo"),
        .description = COMPOUND_STRING(
            "Swaps items with\nthe foe "
            "faster\nthan the eye can\nsee."),
        .effect = EFFECT_TRICK,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_2 },
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Switcheroo,
    },

    [MOVE_GIGA_IMPACT] =
    {
        .name = COMPOUND_STRING("Giga Impact"),
        .description = sHyperBeamDescription,
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GigaImpact,
    },

    [MOVE_NASTY_PLOT] =
    {
        .name = COMPOUND_STRING("Nasty Plot"),
        .description = COMPOUND_STRING(
            "Thinks bad\nthoughts to "
            "\nsharply boost Sp.\nAtk."),
        .effect = EFFECT_SPECIAL_ATTACK_UP_2,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_NASTY_PLOT,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NastyPlot,
    },

    [MOVE_BULLET_PUNCH] =
    {
        .name = COMPOUND_STRING("Bullet Punch"),
        .description = COMPOUND_STRING(
            "Punches as fast as\na bul- "
            "let. It\nalways hits first."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BulletPunch,
    },

    [MOVE_AVALANCHE] =
    {
        .name = COMPOUND_STRING("Avalanche"),
        .description = sRevengeDescription,
        .effect = EFFECT_REVENGE,
        .power = 60,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = -4,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Avalanche,
    },

    [MOVE_ICE_SHARD] =
    {
        .name = COMPOUND_STRING("Ice Shard"),
        .description = COMPOUND_STRING(
            "Hurls a chunk of\nice that "
            "always\nstrikes first."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_IceShard,
    },

    [MOVE_SHADOW_CLAW] =
    {
        .name = COMPOUND_STRING("Shadow Claw"),
        .description = COMPOUND_STRING(
            "Strikes with a\nshadow claw. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_ShadowClaw,
    },

    [MOVE_THUNDER_FANG] =
    {
        .name = COMPOUND_STRING("Thunder Fang"),
        .description = COMPOUND_STRING(
            "May cause\nflinching or "
            "leave\nthe foe paralyzed."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_ELECTRIC,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 10,
        },
        {
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_THUNDER_FANG,
        .contestComboMoves = {COMBO_STARTER_CHARGE, COMBO_STARTER_FIRE_FANG, COMBO_STARTER_ICE_FANG},
        .battleAnimScript = gBattleAnimMove_ThunderFang,
    },

    [MOVE_ICE_FANG] =
    {
        .name = COMPOUND_STRING("Ice Fang"),
        .description = COMPOUND_STRING(
            "May cause\nflinching or "
        #if B_USE_FROSTBITE == TRUE
            "leave\nthe foe with\nfrostbite."),
        #else
            "leave\nthe foe frozen."),
        #endif
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_ICE,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
            .chance = 10,
        },
        {
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = COMBO_STARTER_ICE_FANG,
        .contestComboMoves = {COMBO_STARTER_FIRE_FANG, COMBO_STARTER_THUNDER_FANG},
        .battleAnimScript = gBattleAnimMove_IceFang,
    },

    [MOVE_FIRE_FANG] =
    {
        .name = COMPOUND_STRING("Fire Fang"),
        .description = COMPOUND_STRING(
            "May cause\nflinching or "
            "leave\nthe foe with a\nburn."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_FIRE,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        },
        {
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_FIRE_FANG,
        .contestComboMoves = {COMBO_STARTER_ICE_FANG, COMBO_STARTER_THUNDER_FANG},
        .battleAnimScript = gBattleAnimMove_FireFang,
    },

    [MOVE_SHADOW_SNEAK] =
    {
        .name = COMPOUND_STRING("Shadow Sneak"),
        .description = COMPOUND_STRING(
            "Extends the user's\nshadow "
            "to strike\nfirst."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShadowSneak,
    },

    [MOVE_MUD_BOMB] =
    {
        .name = COMPOUND_STRING("Mud Bomb"),
        .description = COMPOUND_STRING(
            "Throws a blob of\nmud to "
            "damage and\ncut accuracy."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_GROUND,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ACC_MINUS_1,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MudBomb,
    },

    [MOVE_PSYCHO_CUT] =
    {
        .name = COMPOUND_STRING("Psycho Cut"),
        .description = COMPOUND_STRING(
            "Tears with psychic\nblades. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .slicingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PsychoCut,
    },

    [MOVE_ZEN_HEADBUTT] =
    {
        .name = COMPOUND_STRING("Zen Headbutt"),
        .description = COMPOUND_STRING(
            "Hits with a strong\nhead- "
            "butt. May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ZenHeadbutt,
    },

    [MOVE_MIRROR_SHOT] =
    {
        .name = COMPOUND_STRING("Mirror Shot"),
        .description = COMPOUND_STRING(
            "Emits a flash of\nenergy to "
            "damage\nand cut accuracy."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_STEEL,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ACC_MINUS_1,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MirrorShot,
    },

    [MOVE_FLASH_CANNON] =
    {
        .name = COMPOUND_STRING("Flash Cannon"),
        .description = COMPOUND_STRING(
            "Releases a blast\nof light "
            "that may\nlower Sp. Def."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FlashCannon,
    },

    [MOVE_ROCK_CLIMB] =
    {
        .name = COMPOUND_STRING("Rock Climb"),
        .description = COMPOUND_STRING(
            "A charging attack\nthat may "
            "confuse\nthe foe."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RockClimb,
    },

    [MOVE_DEFOG] =
    {
        .name = COMPOUND_STRING("Defog"),
        .description = COMPOUND_STRING(
            "Removes obstacles\nand "
            "lowers\nevasion."),
        .effect = EFFECT_DEFOG,
        .power = 0,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ACC_UP_1 },
        //.ignoresSubstitute = TRUE, In Gen5+, the evasion drop will no longer bypass Substitute. However, this is tricky to code
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Defog,
    },

    [MOVE_TRICK_ROOM] =
    {
        .name = COMPOUND_STRING("Trick Room"),
        .description = COMPOUND_STRING(
            "Slower Pokémon\nget to move "
            "first\nfor 5 turns."),
        .effect = EFFECT_TRICK_ROOM,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_FIELD,
        .priority = -7,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ACC_UP_1 },
        .ignoresProtect = TRUE,
        .contestEffect = CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_SMART : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TrickRoom,
    },

    [MOVE_DRACO_METEOR] =
    {
        .name = COMPOUND_STRING("Draco Meteor"),
        .description = COMPOUND_STRING(
            "Casts comets onto\nthe foe. "
            "Harshly\nlowers the Sp.\nAtk."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 130 : 140,
        .type = TYPE_DRAGON,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_2,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DracoMeteor,
    },

    [MOVE_DISCHARGE] =
    {
        .name = COMPOUND_STRING("Discharge"),
        .description = COMPOUND_STRING(
            "Zaps all other\n{PKMN} with "
            "\nelectricity. May\nparalyze."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_Discharge,
    },

    [MOVE_LAVA_PLUME] =
    {
        .name = COMPOUND_STRING("Lava Plume"),
        .description = sLavaPlumeDescription,
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_LavaPlume,
    },

    [MOVE_LEAF_STORM] =
    {
        .name = COMPOUND_STRING("Leaf Storm"),
        .description = COMPOUND_STRING(
            "Whips up a storm\nof leaves. "
            "Harshly\nlowers the Sp.\nAtk."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 130 : 140,
        .type = TYPE_GRASS,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_2,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LeafStorm,
    },

    [MOVE_POWER_WHIP] =
    {
        .name = COMPOUND_STRING("Power Whip"),
        .description = COMPOUND_STRING(
            "Violently lashes\nthe foe "
            "with vines\nor tentacles."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_GRASS,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_PowerWhip,
    },

    [MOVE_ROCK_WRECKER] =
    {
        .name = COMPOUND_STRING("Rock Wrecker"),
        .description = sHyperBeamDescription,
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_ROCK,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RockWrecker,
    },

    [MOVE_CROSS_POISON] =
    {
        .name = COMPOUND_STRING("Cross Poison"),
        .description = COMPOUND_STRING(
            "A slash that may\npoison a "
            "foe and\ndo critical\ndamage."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_POISON,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CrossPoison,
    },

    [MOVE_GUNK_SHOT] =
    {
        .name = COMPOUND_STRING("Gunk Shot"),
        .description = COMPOUND_STRING(
            "Shoots filthy\ngarbage at "
            "the\nfoe. May also\npoison."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_POISON,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_6 ? 80 : 70,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_TOUGH : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GunkShot,
    },

    [MOVE_IRON_HEAD] =
    {
        .name = COMPOUND_STRING("Iron Head"),
        .description = COMPOUND_STRING(
            "Slams the foe with\na hard "
            "head. May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_IronHead,
    },

    [MOVE_MAGNET_BOMB] =
    {
        .name = COMPOUND_STRING("Magnet Bomb"),
        .description = COMPOUND_STRING(
            "Launches a magnet\nthat "
            "strikes\nwithout fail."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ballisticMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MagnetBomb,
    },

    [MOVE_STONE_EDGE] =
    {
        .name = COMPOUND_STRING("Stone Edge"),
        .description = COMPOUND_STRING(
            "Stabs the foe with\nstones. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_ROCK,
        .accuracy = 80,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_StoneEdge,
    },

    [MOVE_CAPTIVATE] =
    {
        .name = COMPOUND_STRING("Captivate"),
        .description = COMPOUND_STRING(
            "Makes the opposite\ngender "
            "sharply\nreduce its Sp.\nAtk."),
        .effect = EFFECT_CAPTIVATE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_2 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARM},
        .battleAnimScript = gBattleAnimMove_Captivate,
    },

    [MOVE_STEALTH_ROCK] =
    {
        .name = COMPOUND_STRING("Stealth Rock"),
        .description = COMPOUND_STRING(
            "Sets floating\nstones that "
            "hurt a\nfoe switching in."),
        .effect = EFFECT_STEALTH_ROCK,
        .power = 0,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_OPPONENTS_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .forcePressure = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STEALTH_ROCK},
        .battleAnimScript = gBattleAnimMove_StealthRock,
    },

    [MOVE_GRASS_KNOT] =
    {
        .name = COMPOUND_STRING("Grass Knot"),
        .description = COMPOUND_STRING(
            "A snare attack\nthat does "
            "more\ndamage to heavier\nfoes."),
        .effect = EFFECT_LOW_KICK,
        .power = 1,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GrassKnot,
    },

    [MOVE_CHATTER] =
    {
        .name = COMPOUND_STRING("Chatter"),
        .description = COMPOUND_STRING(
            "Attacks with a\nsound wave "
            "that\ncauses confusion."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 65 : 60,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_6,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
        #if B_UPDATED_MOVE_DATA >= GEN_6
            .chance = 100,
        #elif B_UPDATED_MOVE_DATA == GEN_5
            .chance = 10,
        #else
            .chance = 31,
        #endif
        }),
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Chatter,
    },

    [MOVE_JUDGMENT] =
    {
        .name = COMPOUND_STRING("Judgment"),
        .description = COMPOUND_STRING(
            "The type varies\nwith the "
            "kind of\nPlate held."),
        .effect = EFFECT_CHANGE_TYPE_ON_ITEM,
        .power = 100,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .holdEffect = HOLD_EFFECT_PLATE },
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Judgment,
    },

    [MOVE_BUG_BITE] =
    {
        .name = COMPOUND_STRING("Bug Bite"),
        .description = sPluckDescription,
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BUG_BITE,
        }),
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_CUTE : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BugBite,
    },

    [MOVE_CHARGE_BEAM] =
    {
        .name = COMPOUND_STRING("Charge Beam"),
        .description = COMPOUND_STRING(
            "Fires a beam of\nelectricity. "
            "May\nraise Sp. Atk."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_ELECTRIC,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_PLUS_1,
            .self = TRUE,
            .chance = 70,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_ChargeBeam,
    },

    [MOVE_WOOD_HAMMER] =
    {
        .name = COMPOUND_STRING("Wood Hammer"),
        .description = COMPOUND_STRING(
            "Slams the body\ninto a foe. "
            "The\nuser gets hurt\ntoo."),
        .effect = EFFECT_RECOIL,
        .power = 120,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 33 },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WoodHammer,
    },

    [MOVE_AQUA_JET] =
    {
        .name = COMPOUND_STRING("Aqua Jet"),
        .description = COMPOUND_STRING(
            "Strikes first by\ndashing "
            "at the foe\nat a high speed."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_AquaJet,
    },

    [MOVE_ATTACK_ORDER] =
    {
        .name = COMPOUND_STRING("Attack Order"),
        .description = COMPOUND_STRING(
            "Underlings pummel\nthe foe. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_BUG,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_ATTACK_ORDER,
        .contestComboMoves = {COMBO_STARTER_DEFEND_ORDER, COMBO_STARTER_HEAL_ORDER},
        .battleAnimScript = gBattleAnimMove_AttackOrder,
    },

    [MOVE_DEFEND_ORDER] =
    {
        .name = COMPOUND_STRING("Defend Order"),
        .description = COMPOUND_STRING(
            "Raises Defense and\nSp. Def "
            "with a\nliving shield."),
        .effect = EFFECT_COSMIC_POWER,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE_ONCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_DEFEND_ORDER,
        .contestComboMoves = {COMBO_STARTER_ATTACK_ORDER, COMBO_STARTER_HEAL_ORDER},
        .battleAnimScript = gBattleAnimMove_DefendOrder,
    },

    [MOVE_HEAL_ORDER] =
    {
        .name = COMPOUND_STRING("Heal Order"),
        .description = COMPOUND_STRING(
            "The user's\nunderlings show "
            "up\nto heal half its\nmax HP."),
        .effect = EFFECT_RESTORE_HP,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_HEAL_ORDER,
        .contestComboMoves = {COMBO_STARTER_ATTACK_ORDER, COMBO_STARTER_DEFEND_ORDER},
        .battleAnimScript = gBattleAnimMove_HealOrder,
    },

    [MOVE_HEAD_SMASH] =
    {
        .name = COMPOUND_STRING("Head Smash"),
        .description = COMPOUND_STRING(
            "A life-risking\nheadbutt that "
            "\nseriously hurts\nthe user."),
        .effect = EFFECT_RECOIL,
        .power = 150,
        .type = TYPE_ROCK,
        .accuracy = 80,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 50 },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HeadSmash,
    },

    [MOVE_DOUBLE_HIT] =
    {
        .name = COMPOUND_STRING("Double Hit"),
        .description = COMPOUND_STRING(
            "Slams the foe with\na tail "
            "etc.\nStrikes twice."),
        .effect = EFFECT_HIT,
        .power = 35,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .strikeCount = 2,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DoubleHit,
    },

    [MOVE_ROAR_OF_TIME] =
    {
        .name = COMPOUND_STRING("Roar of Time"),
        .description = COMPOUND_STRING(
            "Powerful, but\nleaves the "
            "user\nimmobile the next\nturn."),
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_DRAGON,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RoarOfTime,
    },

    [MOVE_SPACIAL_REND] =
    {
        .name = COMPOUND_STRING("Spacial Rend"),
        .description = COMPOUND_STRING(
            "Tears the foe, and\nspace. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_DRAGON,
        .accuracy = 95,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SpacialRend,
    },

    [MOVE_LUNAR_DANCE] =
    {
        .name = COMPOUND_STRING("Lunar Dance"),
        .description = sHealingWishDescription,
        .effect = EFFECT_LUNAR_DANCE,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = B_UPDATED_MOVE_FLAGS >= GEN_5,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .danceMove = TRUE,
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LunarDance,
    },

    [MOVE_CRUSH_GRIP] =
    {
        .name = COMPOUND_STRING("Crush Grip"),
        .description = sWringOutDescription,
        .effect = EFFECT_POWER_BASED_ON_TARGET_HP,
        .power = 120,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CrushGrip,
    },

    [MOVE_MAGMA_STORM] =
    {
        .name = COMPOUND_STRING("Magma Storm"),
        .description = COMPOUND_STRING(
            "Traps the foe in a\nvortex "
            "of fire for\n"BINDING_TURNS" turns."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 100 : 120,
        .type = TYPE_FIRE,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_5 ? 75 : 70,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_MAGMA_STORM,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_MagmaStorm,
    },

    [MOVE_DARK_VOID] =
    {
        .name = COMPOUND_STRING("Dark Void"),
        .description = COMPOUND_STRING(
            "Drags the foes\ninto total "
            "\ndarkness, inducing\nSleep."),
        .effect = EFFECT_DARK_VOID,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_7 ? 50 : 80,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .nonVolatileStatus = MOVE_EFFECT_SLEEP },
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .magicCoatAffected = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_DARK_VOID,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DarkVoid,
    },

    [MOVE_SEED_FLARE] =
    {
        .name = COMPOUND_STRING("Seed Flare"),
        .description = COMPOUND_STRING(
            "Generates a shock\nwave that "
            "sharply\nreduces Sp. Def."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_GRASS,
        .accuracy = 85,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_2,
            .chance = 40,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SeedFlare,
    },

    [MOVE_OMINOUS_WIND] =
    {
        .name = COMPOUND_STRING("Ominous Wind"),
        .description = COMPOUND_STRING(
            "A repulsive attack\nthat may "
            "raise all\nstats."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = B_EXTRAPOLATED_MOVE_FLAGS,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ALL_STATS_UP,
            .self = TRUE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_BEAUTY : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_OminousWind,
    },

    [MOVE_SHADOW_FORCE] =
    {
        .name = COMPOUND_STRING("Shadow Force"),
        .description = sShadowForceDescription,
        .effect = EFFECT_SEMI_INVULNERABLE,
        .power = 120,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresProtect = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS == GEN_6,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .argument.twoTurnAttack = { .stringId = STRINGID_VANISHEDINSTANTLY, .status = STATE_PHANTOM_FORCE },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FEINT,
        }),
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = C_UPDATED_MOVE_CATEGORIES >= GEN_6 ? CONTEST_CATEGORY_COOL : CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShadowForce,
    },

    [MOVE_HONE_CLAWS] =
    {
        .name = COMPOUND_STRING("Hone Claws"),
        .description = COMPOUND_STRING(
            "Sharpens its claws\nto raise "
            "Attack\nand Accuracy."),
        .effect = EFFECT_ATTACK_ACCURACY_UP,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_HONE_CLAWS,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HoneClaws,
    },

    [MOVE_WIDE_GUARD] =
    {
        .name = COMPOUND_STRING("Wide Guard"),
        .description = COMPOUND_STRING(
            "Evades\nwide-ranging\nattacks "
            "for one\nturn."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 3,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_WIDE_GUARD },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WideGuard,
    },

    [MOVE_GUARD_SPLIT] =
    {
        .name = COMPOUND_STRING("Guard Split"),
        .description = COMPOUND_STRING(
            "Averages changes\nto Defense "
            "and Sp.\nDef with the foe."),
        .effect = EFFECT_GUARD_SPLIT,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GuardSplit,
    },

    [MOVE_POWER_SPLIT] =
    {
        .name = COMPOUND_STRING("Power Split"),
        .description = COMPOUND_STRING(
            "Averages changes\nto Attack "
            "and Sp.\nAtk with the foe."),
        .effect = EFFECT_POWER_SPLIT,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PowerSplit,
    },

    [MOVE_WONDER_ROOM] =
    {
        .name = COMPOUND_STRING("Wonder Room"),
        .description = COMPOUND_STRING(
            "Defense and Sp.\nDef stats "
            "are\nswapped for 5\nturns."),
        .effect = EFFECT_WONDER_ROOM,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = B_UPDATED_MOVE_DATA >= GEN_6 ? 0 : -7,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .contestEffect = CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WonderRoom,
    },

    [MOVE_PSYSHOCK] =
    {
        .name = COMPOUND_STRING("Psyshock"),
        .description = sPsyshockDescription,
        .effect = EFFECT_PSYSHOCK,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Psyshock,
    },

    [MOVE_VENOSHOCK] =
    {
        .name = COMPOUND_STRING("Venoshock"),
        .description = COMPOUND_STRING(
            "Does double damage\nif the "
            "foe is\npoisoned."),
        .effect = EFFECT_DOUBLE_POWER_ON_ARG_STATUS,
        .power = 65,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .status = STATUS1_PSN_ANY },
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_TOXIC, COMBO_STARTER_POISON_GAS, COMBO_STARTER_POISON_POWDER, COMBO_STARTER_TOXIC_SPIKES},
        .battleAnimScript = gBattleAnimMove_Venoshock,
    },

    [MOVE_AUTOTOMIZE] =
    {
        .name = COMPOUND_STRING("Autotomize"),
        .description = COMPOUND_STRING(
            "Sheds additional\nweight to "
            "sharply\nboost Speed."),
        .effect = EFFECT_AUTOTOMIZE,
        .power = 0,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Autotomize,
    },

    [MOVE_RAGE_POWDER] =
    {
        .name = COMPOUND_STRING("Rage Powder"),
        .description = COMPOUND_STRING(
            "Scatters powder to\nmake "
            "foes attack\nonly the user."),
        .effect = EFFECT_FOLLOW_ME,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = B_UPDATED_MOVE_DATA >= GEN_6 ? 2 : 3,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .powderMove = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RagePowder,
    },

    [MOVE_TELEKINESIS] =
    {
        .name = COMPOUND_STRING("Telekinesis"),
        .description = COMPOUND_STRING(
            "Makes the foe\nfloat. It is "
            "\neasier to hit for\n3 turns."),
        .effect = EFFECT_TELEKINESIS,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .magicCoatAffected = TRUE,
        .gravityBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Telekinesis,
    },

    [MOVE_MAGIC_ROOM] =
    {
        .name = COMPOUND_STRING("Magic Room"),
        .description = COMPOUND_STRING(
            "Hold items lose\ntheir "
            "effects for\n5 turns."),
        .effect = EFFECT_MAGIC_ROOM,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = B_UPDATED_MOVE_DATA >= GEN_6 ? 0 : -7,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MagicRoom,
    },

    [MOVE_SMACK_DOWN] =
    {
        .name = COMPOUND_STRING("Smack Down"),
        .description = COMPOUND_STRING(
            "Throws a rock to\nknock the "
            "foe down\nto the ground."),
        .effect = EFFECT_SMACK_DOWN,
        .power = 50,
        .type = TYPE_ROCK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .damagesAirborne = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE},
        .battleAnimScript = gBattleAnimMove_SmackDown,
    },

    [MOVE_STORM_THROW] =
    {
        .name = COMPOUND_STRING("Storm Throw"),
        .description = sStormThrowDescription,
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 60 : 40,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .alwaysCriticalHit = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE},
        .battleAnimScript = gBattleAnimMove_StormThrow,
    },

    [MOVE_FLAME_BURST] =
    {
        .name = COMPOUND_STRING("Flame Burst"),
        .description = COMPOUND_STRING(
            "A bursting flame\nthat does "
            "damage\nto all foes."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLAME_BURST,
        }),
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FlameBurst,
    },

    [MOVE_SLUDGE_WAVE] =
    {
        .name = COMPOUND_STRING("Sludge Wave"),
        .description = COMPOUND_STRING(
            "Swamps all others\nwith a wave "
            "of\nsludge. May also\npoison."),
        .effect = EFFECT_HIT,
        .power = 95,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SludgeWave,
    },

    [MOVE_QUIVER_DANCE] =
    {
        .name = COMPOUND_STRING("Quiver Dance"),
        .description = COMPOUND_STRING(
            "Dances to raise\nSp. Atk "
            "Sp. Def\nand Speed."),
        .effect = EFFECT_QUIVER_DANCE,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .danceMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_QuiverDance,
    },

    [MOVE_HEAVY_SLAM] =
    {
        .name = COMPOUND_STRING("Heavy Slam"),
        .description = sHeavySlamDescription,
        .effect = EFFECT_HEAT_CRASH,
        .power = 1,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS >= GEN_7,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HeavySlam,
    },

    [MOVE_SYNCHRONOISE] =
    {
        .name = COMPOUND_STRING("Synchronoise"),
        .description = COMPOUND_STRING(
            "An odd shock wave\nthat only "
            "damages\nsame-type {PKMN}."),
        .effect = EFFECT_SYNCHRONOISE,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 120 : 70,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 10 : 15,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Synchronoise,
    },

    [MOVE_ELECTRO_BALL] =
    {
        .name = COMPOUND_STRING("Electro Ball"),
        .description = COMPOUND_STRING(
            "Hurls an orb that\ndoes more "
            "damage\nto slower foes."),
        .effect = EFFECT_ELECTRO_BALL,
        .power = 1,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_AGILITY, COMBO_STARTER_CHARGE, COMBO_STARTER_ROCK_POLISH},
        .battleAnimScript = gBattleAnimMove_ElectroBall,
    },

    [MOVE_SOAK] =
    {
        .name = COMPOUND_STRING("Soak"),
        .description = COMPOUND_STRING(
            "Sprays water at\nthe foe, "
            "changing\nit to Water type."),
        .effect = EFFECT_SOAK,
        .power = 0,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .type = TYPE_WATER },
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Soak,
    },

    [MOVE_FLAME_CHARGE] =
    {
        .name = COMPOUND_STRING("Flame Charge"),
        .description = COMPOUND_STRING(
            "Attacks in a cloak\nof "
            "flames. Raises\nSpeed."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FlameCharge,
    },

    [MOVE_COIL] =
    {
        .name = COMPOUND_STRING("Coil"),
        .description = COMPOUND_STRING(
            "Coils up to raise\nAttack, "
            "Defense\nand Accuracy."),
        .effect = EFFECT_COIL,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Coil,
    },

    [MOVE_LOW_SWEEP] =
    {
        .name = COMPOUND_STRING("Low Sweep"),
        .description = COMPOUND_STRING(
            "Attacks the foe's\nlegs "
            "lowering its\nSpeed."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 65 : 60,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LowSweep,
    },

    [MOVE_ACID_SPRAY] =
    {
        .name = COMPOUND_STRING("Acid Spray"),
        .description = COMPOUND_STRING(
            "Sprays a\nhide-melting acid.\n"
            "Sharply reduces\nSp. Def."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_2,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AcidSpray,
    },

    [MOVE_FOUL_PLAY] =
    {
        .name = COMPOUND_STRING("Foul Play"),
        .description = COMPOUND_STRING(
            "The higher the\nfoe's Attack "
            "the\nmore damage\ncaused."),
        .effect = EFFECT_FOUL_PLAY,
        .power = 95,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FoulPlay,
    },

    [MOVE_SIMPLE_BEAM] =
    {
        .name = COMPOUND_STRING("Simple Beam"),
        .description = COMPOUND_STRING(
            "A beam that\nchanges the "
            "foe's\nAbility to Simple."),
        .effect = EFFECT_OVERWRITE_ABILITY,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .overwriteAbility = ABILITY_SIMPLE },
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SimpleBeam,
    },

    [MOVE_ENTRAINMENT] =
    {
        .name = COMPOUND_STRING("Entrainment"),
        .description = COMPOUND_STRING(
            "Makes the foe\nmimic the "
            "user,\ngaining its\nAbility."),
        .effect = EFFECT_ENTRAINMENT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_ENTRAINMENT,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Entrainment,
    },

    [MOVE_AFTER_YOU] =
    {
        .name = COMPOUND_STRING("After You"),
        .description = COMPOUND_STRING(
            "Helps out the\ntarget, letting "
            "it\nmove next."),
        .effect = EFFECT_AFTER_YOU,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AfterYou,
    },

    [MOVE_ROUND] =
    {
        .name = COMPOUND_STRING("Round"),
        .description = COMPOUND_STRING(
            "A song that\ninflicts damage. "
            "\nOthers can join in\ntoo."),
        .effect = EFFECT_ROUND,
        .power = 60,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ROUND,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Round,
    },

    [MOVE_ECHOED_VOICE] =
    {
        .name = COMPOUND_STRING("Echoed Voice"),
        .description = COMPOUND_STRING(
            "Does more damage\nevery turn "
            "it is\nused."),
        .effect = EFFECT_ECHOED_VOICE,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_EchoedVoice,
    },

    [MOVE_CHIP_AWAY] =
    {
        .name = COMPOUND_STRING("Chip Away"),
        .description = sChipAwayDescription,
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresTargetDefenseEvasionStages = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ChipAway,
    },

    [MOVE_CLEAR_SMOG] =
    {
        .name = COMPOUND_STRING("Clear Smog"),
        .description = COMPOUND_STRING(
            "Attacks with white\nhaze that "
            "\neliminates all\nstat changes."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CLEAR_SMOG,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ClearSmog,
    },

    [MOVE_STORED_POWER] =
    {
        .name = COMPOUND_STRING("Stored Power"),
        .description = COMPOUND_STRING(
            "The higher the\nuser's stats "
            "the\nmore damage\ncaused."),
        .effect = EFFECT_STORED_POWER,
        .power = 20,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_AMNESIA, COMBO_STARTER_HONE_CLAWS, COMBO_STARTER_CALM_MIND, COMBO_STARTER_NASTY_PLOT},
        .battleAnimScript = gBattleAnimMove_StoredPower,
    },

    [MOVE_QUICK_GUARD] =
    {
        .name = COMPOUND_STRING("Quick Guard"),
        .description = COMPOUND_STRING(
            "Evades priority\nattacks "
            "for one\nturn."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = 3,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_QUICK_GUARD, },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_QuickGuard,
    },

    [MOVE_ALLY_SWITCH] =
    {
        .name = COMPOUND_STRING("Ally Switch"),
        .description = COMPOUND_STRING(
            "The user switches\nplaces "
            "with its\npartner."),
        .effect = EFFECT_ALLY_SWITCH,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = B_UPDATED_MOVE_DATA >= GEN_7 ? 2 : 1,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_2 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AllySwitch,
    },

    [MOVE_SCALD] =
    {
        .name = COMPOUND_STRING("Scald"),
        .description = COMPOUND_STRING(
            "Shoots boiling\nwater at the "
            "foe.\nMay inflict a\nburn."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .thawsUser = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SCALD,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Scald,
    },

    [MOVE_SHELL_SMASH] =
    {
        .name = COMPOUND_STRING("Shell Smash"),
        .description = COMPOUND_STRING(
            "Sharply raises\nAtk/Sp.Atk/ "
            "Speed,\nbut drops\nDef/Sp.Def."),
        .effect = EFFECT_SHELL_SMASH,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShellSmash,
    },

    [MOVE_HEAL_PULSE] =
    {
        .name = COMPOUND_STRING("Heal Pulse"),
        .description = COMPOUND_STRING(
            "Recovers up to\nhalf the "
            "target's\nmaximum HP."),
        .effect = EFFECT_HEAL_PULSE,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .magicCoatAffected = TRUE,
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .pulseMove = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HealPulse,
    },

    [MOVE_HEX] =
    {
        .name = COMPOUND_STRING("Hex"),
        .description = COMPOUND_STRING(
            "Does double damage\nif the "
            "foe has a\nstatus problem."),
        .effect = EFFECT_DOUBLE_POWER_ON_ARG_STATUS,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 65 : 50,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .zMove = { .powerOverride = 160 },
        .argument = { .status = STATUS1_ANY },
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_TOXIC, COMBO_STARTER_FORCE_PALM, COMBO_STARTER_THUNDER_WAVE, COMBO_STARTER_INFERNO, COMBO_STARTER_WILL_O_WISP, COMBO_STARTER_LOVELY_KISS, COMBO_STARTER_SPORE, COMBO_STARTER_SING, COMBO_STARTER_YAWN, COMBO_STARTER_HYPNOSIS, COMBO_STARTER_DARK_VOID, COMBO_STARTER_GRASS_WHISTLE, COMBO_STARTER_SLEEP_POWDER, COMBO_STARTER_POISON_GAS, COMBO_STARTER_POISON_POWDER, COMBO_STARTER_TOXIC_SPIKES, COMBO_STARTER_GLARE},
        .battleAnimScript = gBattleAnimMove_Hex,
    },

    [MOVE_SKY_DROP] =
    {
        .name = COMPOUND_STRING("Sky Drop"),
        .description = COMPOUND_STRING(
            "Takes the foe into\nthe sky "
            "then drops\nit the next turn."),
        .effect = EFFECT_SKY_DROP,
        .power = 60,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .gravityBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .argument.twoTurnAttack = { .stringId = STRINGID_PKMNTOOKTARGETHIGH, .status = STATE_ON_AIR },
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE},
        .battleAnimScript = gBattleAnimMove_SkyDrop,
    },

    [MOVE_SHIFT_GEAR] =
    {
        .name = COMPOUND_STRING("Shift Gear"),
        .description = COMPOUND_STRING(
            "Rotates its gears\nto raise "
            "Attack\nand Speed."),
        .effect = EFFECT_SHIFT_GEAR,
        .power = 0,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_SHIFT_GEAR,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShiftGear,
    },

    [MOVE_CIRCLE_THROW] =
    {
        .name = COMPOUND_STRING("Circle Throw"),
        .description = sCircleThrowDescription,
        .effect = EFFECT_HIT_SWITCH_TARGET,
        .power = 60,
        .type = TYPE_FIGHTING,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = -6,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ENTRAINMENT, COMBO_STARTER_PLAY_NICE},
        .battleAnimScript = gBattleAnimMove_CircleThrow,
    },

    [MOVE_INCINERATE] =
    {
        .name = COMPOUND_STRING("Incinerate"),
        .description = COMPOUND_STRING(
            "Burns up Berries\nand Gems "
            "\npreventing their\nuse."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 60 : 30,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_INCINERATE,
        }),
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Incinerate,
    },

    [MOVE_QUASH] =
    {
        .name = COMPOUND_STRING("Quash"),
        .description = COMPOUND_STRING(
            "Suppresses the\nfoe, making "
            "it\nmove last."),
        .effect = EFFECT_QUASH,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Quash,
    },

    [MOVE_ACROBATICS] =
    {
        .name = COMPOUND_STRING("Acrobatics"),
        .description = COMPOUND_STRING(
            "Does double damage\nif the "
            "user has no\nitem."),
        .effect = EFFECT_ACROBATICS,
        .power = 55,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Acrobatics,
    },

    [MOVE_REFLECT_TYPE] =
    {
        .name = COMPOUND_STRING("Reflect Type"),
        .description = COMPOUND_STRING(
            "The user reflects\nthe foe's "
            "type,\ncopying it."),
        .effect = EFFECT_REFLECT_TYPE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ReflectType,
    },

    [MOVE_RETALIATE] =
    {
        .name = COMPOUND_STRING("Retaliate"),
        .description = COMPOUND_STRING(
            "An attack that\ndoes more "
            "damage\nif an ally\nfainted."),
        .effect = EFFECT_RETALIATE,
        .power = 70,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Retaliate,
    },

    [MOVE_FINAL_GAMBIT] =
    {
        .name = COMPOUND_STRING("Final Gambit"),
        .description = COMPOUND_STRING(
            "The user faints to\ndamage "
            "the foe\nequal to its HP."),
        .effect = EFFECT_FINAL_GAMBIT,
        .power = 1,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .explosion = B_UPDATED_MOVE_FLAGS <= GEN_5,
        .mirrorMoveBanned = TRUE,
        .parentalBondBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FinalGambit,
    },

    [MOVE_BESTOW] =
    {
        .name = COMPOUND_STRING("Bestow"),
        .description = COMPOUND_STRING(
            "The user gives its\nheld "
            "item to the\nfoe."),
        .effect = EFFECT_BESTOW,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_2 },
        .ignoresProtect = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CELEBRATE, COMBO_STARTER_COVET, COMBO_STARTER_HAPPY_HOUR, COMBO_STARTER_WISH},
        .battleAnimScript = gBattleAnimMove_Bestow,
    },

    [MOVE_INFERNO] =
    {
        .name = COMPOUND_STRING("Inferno"),
        .description = COMPOUND_STRING(
            "Powerful and sure\nto inflict "
            "a burn,\nbut inaccurate."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FIRE,
        .accuracy = 50,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_INFERNO,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Inferno,
    },

    [MOVE_WATER_PLEDGE] =
    {
        .name = COMPOUND_STRING("Water Pledge"),
        .description = COMPOUND_STRING(
            "Attacks with a\ncolumn of "
            "water.\nMay make a\nrainbow."),
        .effect = EFFECT_PLEDGE,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 80 : 50,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WaterPledge,
    },

    [MOVE_FIRE_PLEDGE] =
    {
        .name = COMPOUND_STRING("Fire Pledge"),
        .description = COMPOUND_STRING(
            "Attacks with a\ncolumn of "
            "fire.\nMay burn the\ngrass."),
        .effect = EFFECT_PLEDGE,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 80 : 50,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FirePledge,
    },

    [MOVE_GRASS_PLEDGE] =
    {
        .name = COMPOUND_STRING("Grass Pledge"),
        .description = COMPOUND_STRING(
            "Attacks with a\ncolumn of "
            "grass.\nMay create a\nswamp."),
        .effect = EFFECT_PLEDGE,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 80 : 50,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GrassPledge,
    },

    [MOVE_VOLT_SWITCH] =
    {
        .name = COMPOUND_STRING("Volt Switch"),
        .description = sUTurnDescription,
        .effect = EFFECT_HIT_ESCAPE,
        .power = 70,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_VoltSwitch,
    },

    [MOVE_STRUGGLE_BUG] =
    {
        .name = COMPOUND_STRING("Struggle Bug"),
        .description = COMPOUND_STRING(
            "Resisting, the\nuser attacks "
            "the\nfoes. Lowers Sp.\nAtk."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 50 : 30,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_StruggleBug,
    },

    [MOVE_BULLDOZE] =
    {
        .name = COMPOUND_STRING("Bulldoze"),
        .description = COMPOUND_STRING(
            "Stomps down on the\nground. "
            "Hits all\nand lowers Speed."),
        .effect = EFFECT_EARTHQUAKE,
        .power = 60,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .skyBattleBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Bulldoze,
    },

    [MOVE_FROST_BREATH] =
    {
        .name = COMPOUND_STRING("Frost Breath"),
        .description = sStormThrowDescription,
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 60 : 40,
        .type = TYPE_ICE,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .alwaysCriticalHit = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FrostBreath,
    },

    [MOVE_DRAGON_TAIL] =
    {
        .name = COMPOUND_STRING("Dragon Tail"),
        .description = sCircleThrowDescription,
        .effect = EFFECT_HIT_SWITCH_TARGET,
        .power = 60,
        .type = TYPE_DRAGON,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = -6,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_LATER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_DRAGON_TAIL,
        .contestComboMoves = {COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_DANCE, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_RUSH, COMBO_STARTER_STEALTH_ROCK, COMBO_STARTER_SPIKES, COMBO_STARTER_TOXIC_SPIKES},
        .battleAnimScript = gBattleAnimMove_DragonTail,
    },

    [MOVE_WORK_UP] =
    {
        .name = COMPOUND_STRING("Work Up"),
        .description = COMPOUND_STRING(
            "The user is\nroused. "
            "Ups Attack\nand Sp. Atk."),
        .effect = EFFECT_ATTACK_SPATK_UP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WorkUp,
    },

    [MOVE_ELECTROWEB] =
    {
        .name = COMPOUND_STRING("Electroweb"),
        .description = COMPOUND_STRING(
            "Snares the foes\nwith an "
            "electric\nnet. Lowers Speed."),
        .effect = EFFECT_HIT,
        .power = 55,
        .type = TYPE_ELECTRIC,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STRING_SHOT},
        .battleAnimScript = gBattleAnimMove_Electroweb,
    },

    [MOVE_WILD_CHARGE] =
    {
        .name = COMPOUND_STRING("Wild Charge"),
        .description = COMPOUND_STRING(
            "An electrical\ntackle that "
            "also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = 90,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 25 },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WildCharge,
    },

    [MOVE_DRILL_RUN] =
    {
        .name = COMPOUND_STRING("Drill Run"),
        .description = COMPOUND_STRING(
            "Spins its body\nlike a drill. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_GROUND,
        .accuracy = 95,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_FOCUS_ENERGY},
        .battleAnimScript = gBattleAnimMove_DrillRun,
    },

    [MOVE_DUAL_CHOP] =
    {
        .name = COMPOUND_STRING("Dual Chop"),
        .description = COMPOUND_STRING(
            "Attacks with\nbrutal hits "
            "that\nstrike twice."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_DRAGON,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .strikeCount = 2,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DualChop,
    },

    [MOVE_HEART_STAMP] =
    {
        .name = COMPOUND_STRING("Heart Stamp"),
        .description = COMPOUND_STRING(
            "A sudden blow\nafter a cute "
            "act.\nMay cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HeartStamp,
    },

    [MOVE_HORN_LEECH] =
    {
        .name = COMPOUND_STRING("Horn Leech"),
        .description = sMegaDrainDescription,
        .effect = EFFECT_ABSORB,
        .power = 75,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .absorbPercentage = 50 },
        .makesContact = TRUE,
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HornLeech,
    },

    [MOVE_SACRED_SWORD] =
    {
        .name = COMPOUND_STRING("Sacred Sword"),
        .description = sChipAwayDescription,
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_6 ? 15 : 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresTargetDefenseEvasionStages = TRUE,
        .slicingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SacredSword,
    },

    [MOVE_RAZOR_SHELL] =
    {
        .name = COMPOUND_STRING("Razor Shell"),
        .description = COMPOUND_STRING(
            "Tears at the foe\nwith sharp "
            "shells.\nMay lower Defense."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_WATER,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 50,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RazorShell,
    },

    [MOVE_HEAT_CRASH] =
    {
        .name = COMPOUND_STRING("Heat Crash"),
        .description = sHeavySlamDescription,
        .effect = EFFECT_HEAT_CRASH,
        .power = 1,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HeatCrash,
    },

    [MOVE_LEAF_TORNADO] =
    {
        .name = COMPOUND_STRING("Leaf Tornado"),
        .description = COMPOUND_STRING(
            "Circles the foe\nwith leaves "
            "to\ndamage and cut\naccuracy."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_GRASS,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ACC_MINUS_1,
            .chance = 50,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LeafTornado,
    },

    [MOVE_STEAMROLLER] =
    {
        .name = COMPOUND_STRING("Steamroller"),
        .description = COMPOUND_STRING(
            "Crushes the foe\nwith its "
            "body. May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Steamroller,
    },

    [MOVE_COTTON_GUARD] =
    {
        .name = COMPOUND_STRING("Cotton Guard"),
        .description = COMPOUND_STRING(
            "Wraps its body in\ncotton. "
            "\nDrastically raises\nDefense."),
        .effect = EFFECT_DEFENSE_UP_3,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CottonGuard,
    },

    [MOVE_NIGHT_DAZE] =
    {
        .name = COMPOUND_STRING("Night Daze"),
        .description = COMPOUND_STRING(
            "Looses a\npitch-black shock "
            "\nwave. May lower\naccuracy."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_DARK,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ACC_MINUS_1,
            .chance = 40,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NightDaze,
    },

    [MOVE_PSYSTRIKE] =
    {
        .name = COMPOUND_STRING("Psystrike"),
        .description = sPsyshockDescription,
        .effect = EFFECT_PSYSHOCK,
        .power = 100,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Psystrike,
    },

    [MOVE_TAIL_SLAP] =
    {
        .name = COMPOUND_STRING("Tail Slap"),
        .description = COMPOUND_STRING(
            "Strikes the foe\nwith its "
            "tail 2 to\n5 times."),
        .effect = EFFECT_HIT,
        .power = 25,
        .type = TYPE_NORMAL,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TailSlap,
    },

    [MOVE_HURRICANE] =
    {
        .name = COMPOUND_STRING("Hurricane"),
        .description = COMPOUND_STRING(
            "Traps the foe in a\nfierce "
            "wind. May\ncause confusion."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 110 : 120,
        .type = TYPE_FLYING,
        .accuracy = 70,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .damagesAirborne = TRUE,
        .alwaysHitsInRain = TRUE,
        .accuracy50InSun = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Hurricane,
    },

    [MOVE_HEAD_CHARGE] =
    {
        .name = COMPOUND_STRING("Head Charge"),
        .description = COMPOUND_STRING(
            "A charge using\nguard hair. "
            "It\nhurts the user a\nlittle."),
        .effect = EFFECT_RECOIL,
        .power = 120,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 25 },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HeadCharge,
    },

    [MOVE_GEAR_GRIND] =
    {
        .name = COMPOUND_STRING("Gear Grind"),
        .description = COMPOUND_STRING(
            "Throws two steel\ngears "
            "that strike\ntwice."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_STEEL,
        .accuracy = 85,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .zMove = { .powerOverride = 180 },
        .makesContact = TRUE,
        .strikeCount = 2,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SHIFT_GEAR},
        .battleAnimScript = gBattleAnimMove_GearGrind,
    },

    [MOVE_SEARING_SHOT] =
    {
        .name = COMPOUND_STRING("Searing Shot"),
        .description = sLavaPlumeDescription,
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SearingShot,
    },

    [MOVE_TECHNO_BLAST] =
    {
        .name = COMPOUND_STRING("Techno Blast"),
        .description = COMPOUND_STRING(
            "The type varies\nwith the "
            "kind of\nDrive held."),
        .effect = EFFECT_CHANGE_TYPE_ON_ITEM,
        .power = B_UPDATED_MOVE_DATA >= GEN_6 ? 120 : 85,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .holdEffect = HOLD_EFFECT_DRIVE },
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TechnoBlast,
    },

    [MOVE_RELIC_SONG] =
    {
        .name = COMPOUND_STRING("Relic Song"),
        .description = COMPOUND_STRING(
            "Attacks with an\nancient "
            "song. May\ninduce sleep."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .status = STATUS1_SLEEP },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SLEEP,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_BEAUTIFUL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RelicSong,
    },

    [MOVE_SECRET_SWORD] =
    {
        .name = COMPOUND_STRING("Secret Sword"),
        .description = COMPOUND_STRING(
            "Cuts with a long\nhorn that "
            "does\nphysical damage."),
        .effect = EFFECT_PSYSHOCK,
        .power = 85,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .slicingMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_BEAUTIFUL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SecretSword,
    },

    [MOVE_GLACIATE] =
    {
        .name = COMPOUND_STRING("Glaciate"),
        .description = COMPOUND_STRING(
            "Blows very cold\nair at the "
            "foes.\nIt lowers their\nSpeed."),
        .effect = EFFECT_HIT,
        .power = 65,
        .type = TYPE_ICE,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_Glaciate,
    },

    [MOVE_BOLT_STRIKE] =
    {
        .name = COMPOUND_STRING("Bolt Strike"),
        .description = COMPOUND_STRING(
            "Strikes with a\ngreat amount "
            "of\nlightning. May\nparalyze."),
        .effect = EFFECT_HIT,
        .power = 130,
        .type = TYPE_ELECTRIC,
        .accuracy = 85,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BoltStrike,
    },

    [MOVE_BLUE_FLARE] =
    {
        .name = COMPOUND_STRING("Blue Flare"),
        .description = COMPOUND_STRING(
            "Engulfs the foe in\na blue "
            "flame. May\ninflict a burn."),
        .effect = EFFECT_HIT,
        .power = 130,
        .type = TYPE_FIRE,
        .accuracy = 85,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BlueFlare,
    },

    [MOVE_FIERY_DANCE] =
    {
        .name = COMPOUND_STRING("Fiery Dance"),
        .description = COMPOUND_STRING(
            "Dances cloaked in\nflames. "
            "May raise\nSp. Atk."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .danceMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_PLUS_1,
            .self = TRUE,
            .chance = 50,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FieryDance,
    },

    [MOVE_FREEZE_SHOCK] =
    {
        .name = COMPOUND_STRING("Freeze Shock"),
        .description = COMPOUND_STRING(
            "A powerful 2-turn\nmove that "
            "may\nparalyze the foe."),
        .effect = EFFECT_TWO_TURNS_ATTACK,
        .power = 140,
        .type = TYPE_ICE,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_CLOAKEDINAFREEZINGLIGHT },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FreezeShock,
    },

    [MOVE_ICE_BURN] =
    {
        .name = COMPOUND_STRING("Ice Burn"),
        .description = COMPOUND_STRING(
            "A powerful 2-turn\nmove that "
            "may\ninflict a burn."),
        .effect = EFFECT_TWO_TURNS_ATTACK,
        .power = 140,
        .type = TYPE_ICE,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_CLOAKEDINAFREEZINGLIGHT },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_IceBurn,
    },

    [MOVE_SNARL] =
    {
        .name = COMPOUND_STRING("Snarl"),
        .description = COMPOUND_STRING(
            "Yells and rants at\nthe foe "
            "lowering\nits Sp. Atk."),
        .effect = EFFECT_HIT,
        .power = 55,
        .type = TYPE_DARK,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Snarl,
    },

    [MOVE_ICICLE_CRASH] =
    {
        .name = COMPOUND_STRING("Icicle Crash"),
        .description = COMPOUND_STRING(
            "Drops large\nicicles on the "
            "\nfoe. May cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_ICE,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_IcicleCrash,
    },

    [MOVE_V_CREATE] =
    {
        .name = COMPOUND_STRING("V-create"),
        .description = COMPOUND_STRING(
            "Very powerful, but\nlowers "
            "Defense,\nSp. Def and Speed."),
        .effect = EFFECT_HIT,
        .power = 180,
        .type = TYPE_FIRE,
        .accuracy = 95,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .zMove = { .powerOverride = 220 },
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_V_CREATE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_VCreate,
    },

    [MOVE_FUSION_FLARE] =
    {
        .name = COMPOUND_STRING("Fusion Flare"),
        .description = COMPOUND_STRING(
            "Summons a\nfireball. Works "
            "\nwell with a\nthunderbolt."),
        .effect = EFFECT_FUSION_COMBO,
        .power = 100,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .thawsUser = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FusionFlare,
    },

    [MOVE_FUSION_BOLT] =
    {
        .name = COMPOUND_STRING("Fusion Bolt"),
        .description = COMPOUND_STRING(
            "Summons a\nthunderbolt. "
            "Works\nwell with a\nfireball."),
        .effect = EFFECT_FUSION_COMBO,
        .power = 100,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FusionBolt,
    },

    [MOVE_FLYING_PRESS] =
    {
        .name = COMPOUND_STRING("Flying Press"),
        .description = COMPOUND_STRING(
            "This attack does\nFighting "
            "and\nFlying-type\ndamage."),
        .effect = EFFECT_TWO_TYPED_MOVE,
        .power = B_UPDATED_MOVE_DATA >= GEN_7 ? 100 : 80,
        .type = TYPE_FIGHTING,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .zMove = { .powerOverride = 170 },
        .argument = { .type = TYPE_FLYING },
        .makesContact = TRUE,
        .minimizeDoubleDamage = TRUE,
        .gravityBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FlyingPress,
    },

    [MOVE_MAT_BLOCK] =
    {
        .name = COMPOUND_STRING("Mat Block"),
        .description = COMPOUND_STRING(
            "Evades damaging\nmoves. "
            "Only works\non 1st turn."),
        .effect = EFFECT_MAT_BLOCK,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_MAT_BLOCK, },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MatBlock,
    },

    [MOVE_BELCH] =
    {
        .name = COMPOUND_STRING("Belch"),
        .description = COMPOUND_STRING(
            "Lets out a loud\nbelch. "
            "Must eat a\nBerry to use it."),
        .effect = EFFECT_BELCH,
        .power = 120,
        .type = TYPE_POISON,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .metronomeBanned = TRUE,
        .mimicBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Belch,
    },

    [MOVE_ROTOTILLER] =
    {
        .name = COMPOUND_STRING("Rototiller"),
        .description = COMPOUND_STRING(
            "Ups the Attack and\nSp. Atk "
            "of\nGrass-type\nPokémon."),
        .effect = EFFECT_ROTOTILLER,
        .power = 0,
        .type = TYPE_GROUND,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_ALL_BATTLERS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_ROTOTILLER,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Rototiller,
    },

    [MOVE_STICKY_WEB] =
    {
        .name = COMPOUND_STRING("Sticky Web"),
        .description = COMPOUND_STRING(
            "Weaves a sticky\nnet that "
            "slows\nfoes switching in."),
        .effect = EFFECT_STICKY_WEB,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_OPPONENTS_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .magicCoatAffected = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_STRING_SHOT},
        .battleAnimScript = gBattleAnimMove_StickyWeb,
    },

    [MOVE_FELL_STINGER] =
    {
        .name = COMPOUND_STRING("Fell Stinger"),
        .description = COMPOUND_STRING(
            "If it knocks out a\nfoe "
            "the Attack\nstat is raised."),
        .effect = EFFECT_FELL_STINGER,
        .power = B_UPDATED_MOVE_DATA >= GEN_7 ? 50 : 30,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 25,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FellStinger,
    },

    [MOVE_PHANTOM_FORCE] =
    {
        .name = COMPOUND_STRING("Phantom Force"),
        .description = sShadowForceDescription,
        .effect = EFFECT_SEMI_INVULNERABLE,
        .power = 90,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresProtect = TRUE,
        .makesContact = TRUE,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS < GEN_7,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_VANISHEDINSTANTLY, .status = STATE_PHANTOM_FORCE },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FEINT,
        }),
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PhantomForce,
    },

    [MOVE_TRICK_OR_TREAT] =
    {
        .name = COMPOUND_STRING("Trick-or-Treat"),
        .description = COMPOUND_STRING(
            "Goes\ntrick-or-treating,\n"
            "adding Ghost type\nto foe."),
        .effect = EFFECT_THIRD_TYPE,
        .power = 0,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .type = TYPE_GHOST },
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TrickOrTreat,
    },

    [MOVE_NOBLE_ROAR] =
    {
        .name = COMPOUND_STRING("Noble Roar"),
        .description = COMPOUND_STRING(
            "Intimidates the\nfoe, to cut "
            "Attack\nand Sp. Atk."),
        .effect = EFFECT_NOBLE_ROAR,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .magicCoatAffected = TRUE,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NobleRoar,
    },

    [MOVE_ION_DELUGE] =
    {
        .name = COMPOUND_STRING("Ion Deluge"),
        .description = COMPOUND_STRING(
            "Electrifies\nNormal-type "
            "moves\nwith charged\natoms."),
        .effect = EFFECT_ION_DELUGE,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 25,
        .target = TARGET_FIELD,
        .priority = 1,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_IonDeluge,
    },

    [MOVE_PARABOLIC_CHARGE] =
    {
        .name = COMPOUND_STRING("Parabolic Charge"),
        .description = COMPOUND_STRING(
            "Damages adjacent\nPokémon "
            "and heals\nup by half of it."),
        .effect = EFFECT_ABSORB,
        .power = B_UPDATED_MOVE_DATA >= GEN_7 ? 65 : 50,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 50 },
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_PARABOLIC_CHARGE,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_ParabolicCharge,
    },

    [MOVE_FORESTS_CURSE] =
    {
        .name = COMPOUND_STRING("Forest's Curse"),
        .description = COMPOUND_STRING(
            "Puts a curse on\nthe foe, "
            "adding\nthe Grass type."),
        .effect = EFFECT_THIRD_TYPE,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .type = TYPE_GRASS },
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ForestsCurse,
    },

    [MOVE_PETAL_BLIZZARD] =
    {
        .name = COMPOUND_STRING("Petal Blizzard"),
        .description = COMPOUND_STRING(
            "Stirs up a violent\nstorm "
            "of petals to\nattack all."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .windMove = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PetalBlizzard,
    },

    [MOVE_FREEZE_DRY] =
    {
        .name = COMPOUND_STRING("Freeze-Dry"),
        .description = COMPOUND_STRING(
            "Super effective on\nWater- "
        #if B_USE_FROSTBITE == TRUE
            "types. May\ncause frostbite."),
        #else
            "types. May\ncause freezing."),
        #endif
        .effect = EFFECT_SUPER_EFFECTIVE_ON_ARG,
        .power = 70,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .type = TYPE_WATER },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FreezeDry,
    },

    [MOVE_DISARMING_VOICE] =
    {
        .name = COMPOUND_STRING("Disarming Voice"),
        .description = COMPOUND_STRING(
            "Lets out a\ncharming cry "
            "that\ncannot be evaded."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DisarmingVoice,
    },

    [MOVE_PARTING_SHOT] =
    {
        .name = COMPOUND_STRING("Parting Shot"),
        .description = COMPOUND_STRING(
            "Lowers the foe's\nAttack and "
            "Sp.\nAtk, then switches\nout."),
        .effect = EFFECT_PARTING_SHOT,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESTORE_REPLACEMENT_HP },
        .magicCoatAffected = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_LAST
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PartingShot,
    },

    [MOVE_TOPSY_TURVY] =
    {
        .name = COMPOUND_STRING("Topsy-Turvy"),
        .description = COMPOUND_STRING(
            "Swaps all stat\nchanges that "
            "\naffect the target."),
        .effect = EFFECT_TOPSY_TURVY,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_7 ? 0 : 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TopsyTurvy,
    },

    [MOVE_DRAINING_KISS] =
    {
        .name = COMPOUND_STRING("Draining Kiss"),
        .description = sDrainingKissDescription,
        .effect = EFFECT_ABSORB,
        .power = 50,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 75 },
        .makesContact = TRUE,
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DrainingKiss,
    },

    [MOVE_CRAFTY_SHIELD] =
    {
        .name = COMPOUND_STRING("Crafty Shield"),
        .description = COMPOUND_STRING(
            "Evades status\nmoves for "
            "one\nturn."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 3,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_CRAFTY_SHIELD },
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CraftyShield,
    },

    [MOVE_FLOWER_SHIELD] =
    {
        .name = COMPOUND_STRING("Flower Shield"),
        .description = COMPOUND_STRING(
            "Raises the Defense\nof "
            "Grass-type\nPokémon."),
        .effect = EFFECT_FLOWER_SHIELD,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_ALL_BATTLERS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FlowerShield,
    },

    [MOVE_GRASSY_TERRAIN] =
    {
        .name = COMPOUND_STRING("Grassy Terrain"),
        .description = COMPOUND_STRING(
            "The ground turns\nto grass "
            "for 5\nturns. Restores\nHP."),
        .effect = EFFECT_GRASSY_TERRAIN,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_GRASSY_TERRAIN,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GrassyTerrain,
    },

    [MOVE_MISTY_TERRAIN] =
    {
        .name = COMPOUND_STRING("Misty Terrain"),
        .description = COMPOUND_STRING(
            "Covers the ground\nwith mist "
            "for 5\nturns. Blocks\nstatus."),
        .effect = EFFECT_MISTY_TERRAIN,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = COMBO_STARTER_MISTY_TERRAIN,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MistyTerrain,
    },

    [MOVE_ELECTRIFY] =
    {
        .name = COMPOUND_STRING("Electrify"),
        .description = COMPOUND_STRING(
            "Electrifies the\nfoe, making "
            "its\nnext move\nElectric-type."),
        .effect = EFFECT_ELECTRIFY,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_PARABOLIC_CHARGE},
        .battleAnimScript = gBattleAnimMove_Electrify,
    },

    [MOVE_PLAY_ROUGH] =
    {
        .name = COMPOUND_STRING("Play Rough"),
        .description = COMPOUND_STRING(
            "Plays rough with\nthe foe. "
            "May lower\nAttack."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_FAIRY,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PlayRough,
    },

    [MOVE_FAIRY_WIND] =
    {
        .name = COMPOUND_STRING("Fairy Wind"),
        .description = COMPOUND_STRING(
            "Stirs up a fairy\nwind to "
            "strike the\nfoe."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FairyWind,
    },

    [MOVE_MOONBLAST] =
    {
        .name = COMPOUND_STRING("Moonblast"),
        .description = COMPOUND_STRING(
            "Attacks with the\npower of "
            "the moon.\nMay lower Sp. Atk."),
        .effect = EFFECT_HIT,
        .power = 95,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Moonblast,
    },

    [MOVE_BOOMBURST] =
    {
        .name = COMPOUND_STRING("Boomburst"),
        .description = COMPOUND_STRING(
            "Attacks everything\nwith a "
            "destructive\nsound wave."),
        .effect = EFFECT_HIT,
        .power = 140,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Boomburst,
    },

    [MOVE_FAIRY_LOCK] =
    {
        .name = COMPOUND_STRING("Fairy Lock"),
        .description = COMPOUND_STRING(
            "Locks down the\nbattlefield "
            "\npreventing escape\nnext turn."),
        .effect = EFFECT_FAIRY_LOCK,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FairyLock,
    },

    [MOVE_KINGS_SHIELD] =
    {
        .name = COMPOUND_STRING("King's Shield"),
        .description = COMPOUND_STRING(
            "Evades damage, and\nsharply "
            "reduces\nAttack if struck."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_KINGS_SHIELD },
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_KingsShield,
    },

    [MOVE_PLAY_NICE] =
    {
        .name = COMPOUND_STRING("Play Nice"),
        .description = COMPOUND_STRING(
            "Befriend the foe,\nlowering "
            "its\nAttack without\nfail."),
        .effect = EFFECT_ATTACK_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_PLAY_NICE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PlayNice,
    },

    [MOVE_CONFIDE] =
    {
        .name = COMPOUND_STRING("Confide"),
        .description = COMPOUND_STRING(
            "Shares a secret\nwith the "
            "foe,\nlowering Sp. Atk."),
        .effect = EFFECT_SPECIAL_ATTACK_DOWN,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .ignoresProtect = TRUE,
        .magicCoatAffected = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Confide,
    },

    [MOVE_DIAMOND_STORM] =
    {
        .name = COMPOUND_STRING("Diamond Storm"),
        .description = COMPOUND_STRING(
            "Whips up a storm\nof "
            "diamonds. May\nup Defense."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_ROCK,
        .accuracy = 95,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = B_UPDATED_MOVE_DATA >= GEN_7 ? MOVE_EFFECT_DEF_PLUS_2:  MOVE_EFFECT_DEF_PLUS_1,
            .self = TRUE,
            .chance = 50,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_LAST
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DiamondStorm,
    },

    [MOVE_STEAM_ERUPTION] =
    {
        .name = COMPOUND_STRING("Steam Eruption"),
        .description = COMPOUND_STRING(
            "Immerses the foe\nin heated "
            "steam.\nMay inflict a\nburn."),
        .effect = EFFECT_HIT,
        .power = 110,
        .type = TYPE_WATER,
        .accuracy = 95,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .thawsUser = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_LAST
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SCALD},
        .battleAnimScript = gBattleAnimMove_SteamEruption,
    },

    [MOVE_HYPERSPACE_HOLE] =
    {
        .name = COMPOUND_STRING("Hyperspace Hole"),
        .description = sHyperspaceHoleDescription,
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FEINT,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_HYPERSPACE_HOLE,
        .contestComboMoves = {COMBO_STARTER_HYPERSPACE_FURY},
        .battleAnimScript = gBattleAnimMove_HyperspaceHole,
    },

    [MOVE_WATER_SHURIKEN] =
    {
        .name = COMPOUND_STRING("Water Shuriken"),
        .description = COMPOUND_STRING(
            "Throws 2 to 5\nstars that "
            "are\nsure to strike\nfirst."),
        .effect = EFFECT_SPECIES_POWER_OVERRIDE,
        .power = 15,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = B_UPDATED_MOVE_DATA >= GEN_7 ? DAMAGE_CATEGORY_SPECIAL : DAMAGE_CATEGORY_PHYSICAL,
        .argument = {
            .speciesPowerOverride.species = SPECIES_GRENINJA_ASH,
            .speciesPowerOverride.power = 20,
            .speciesPowerOverride.numOfHits = 3
        },
        .multiHit = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WaterShuriken,
    },

    [MOVE_MYSTICAL_FIRE] =
    {
        .name = COMPOUND_STRING("Mystical Fire"),
        .description = COMPOUND_STRING(
            "Breathes a\nspecial, hot "
            "fire.\nLowers Sp. Atk."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_7 ? 75 : 65,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MysticalFire,
    },

    [MOVE_SPIKY_SHIELD] =
    {
        .name = COMPOUND_STRING("Spiky Shield"),
        .description = COMPOUND_STRING(
            "Evades attack, and\ndamages "
            "the foe if\nstruck."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_SPIKY_SHIELD },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SpikyShield,
    },

    [MOVE_AROMATIC_MIST] =
    {
        .name = COMPOUND_STRING("Aromatic Mist"),
        .description = COMPOUND_STRING(
            "Raises the Sp. Def\nof a "
            "partner\nPokémon."),
        .effect = EFFECT_AROMATIC_MIST,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_2 },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTIFUL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AromaticMist,
    },

    [MOVE_EERIE_IMPULSE] =
    {
        .name = COMPOUND_STRING("Eerie Impulse"),
        .description = COMPOUND_STRING(
            "Exposes the foe to\na pulse "
            "that\nsharply cuts Sp.\nAtk."),
        .effect = EFFECT_SPECIAL_ATTACK_DOWN_2,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_EerieImpulse,
    },

    [MOVE_VENOM_DRENCH] =
    {
        .name = COMPOUND_STRING("Venom Drench"),
        .description = COMPOUND_STRING(
            "Lowers the Attack,\nSp. Atk "
            "and Speed\nof poisoned foes."),
        .effect = EFFECT_VENOM_DRENCH,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_TOXIC, COMBO_STARTER_POISON_GAS, COMBO_STARTER_POISON_POWDER, COMBO_STARTER_TOXIC_SPIKES},
        .battleAnimScript = gBattleAnimMove_VenomDrench,
    },

    [MOVE_POWDER] =
    {
        .name = COMPOUND_STRING("Powder"),
        .description = COMPOUND_STRING(
            "Damages the foe if\nit uses "
            "a\nFire-type move."),
        .effect = EFFECT_POWDER,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_2 },
        .powderMove = TRUE,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Powder,
    },

    [MOVE_GEOMANCY] =
    {
        .name = COMPOUND_STRING("Geomancy"),
        .description = COMPOUND_STRING(
            "Raises Sp. Atk,\nSp. Def and "
            "Speed\non the 2nd turn."),
        .effect = EFFECT_GEOMANCY,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .skyBattleBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_PKNMABSORBINGPOWER },
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_BEAUTIFUL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Geomancy,
    },

    [MOVE_MAGNETIC_FLUX] =
    {
        .name = COMPOUND_STRING("Magnetic Flux"),
        .description = COMPOUND_STRING(
            "Boosts the\ndefenses of "
            "those\nwith Plus or\nMinus."),
        .effect = EFFECT_MAGNETIC_FLUX,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MagneticFlux,
    },

    [MOVE_HAPPY_HOUR] =
    {
        .name = COMPOUND_STRING("Happy Hour"),
        .description = COMPOUND_STRING(
            "Doubles the amount\nof "
            "Prize Money\nreceived."),
        .effect = EFFECT_HAPPY_HOUR,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_HAPPY_HOUR,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HappyHour,
    },

    [MOVE_ELECTRIC_TERRAIN] =
    {
        .name = COMPOUND_STRING("Electric Terrain"),
        .description = COMPOUND_STRING(
            "Electrifies the\nground for "
            "5\nturns. Prevents\nsleep."),
        .effect = EFFECT_ELECTRIC_TERRAIN,
        .power = 0,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_ELECTRIC_TERRAIN,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ElectricTerrain,
    },

    [MOVE_DAZZLING_GLEAM] =
    {
        .name = COMPOUND_STRING("Dazzling Gleam"),
        .description = COMPOUND_STRING(
            "Damages foes by\nemitting "
            "a bright\nflash."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DazzlingGleam,
    },

    [MOVE_CELEBRATE] =
    {
        .name = COMPOUND_STRING("Celebrate"),
        .description = COMPOUND_STRING(
            "Congratulates you\non your "
            "special\nday."),
        .effect = EFFECT_CELEBRATE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .mimicBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = COMBO_STARTER_CELEBRATE,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Celebrate,
    },

    [MOVE_HOLD_HANDS] =
    {
        .name = COMPOUND_STRING("Hold Hands"),
        .description = COMPOUND_STRING(
            "The user and ally\nhold hands "
            "making\nthem happy."),
        .effect = EFFECT_HOLD_HANDS,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 40,
        .target = TARGET_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .metronomeBanned = TRUE,
        .mimicBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HoldHands,
    },

    [MOVE_BABY_DOLL_EYES] =
    {
        .name = COMPOUND_STRING("Baby-Doll Eyes"),
        .description = COMPOUND_STRING(
            "Lowers the foe's\nAttack "
            "before it\ncan move."),
        .effect = EFFECT_ATTACK_DOWN,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 30,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BabyDollEyes,
    },

    [MOVE_NUZZLE] =
    {
        .name = COMPOUND_STRING("Nuzzle"),
        .description = COMPOUND_STRING(
            "Rubs its cheeks\nagainst "
            "the foe,\nparalyzing it."),
        .effect = EFFECT_HIT,
        .power = 20,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_Nuzzle,
    },

    [MOVE_HOLD_BACK] =
    {
        .name = COMPOUND_STRING("Hold Back"),
        .description = sFalseSwipeDescription,
        .effect = EFFECT_FALSE_SWIPE,
        .power = 40,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS, //CONTEST_EFFECT_QUICKLY_GROW_BORED
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HoldBack,
    },

    [MOVE_INFESTATION] =
    {
        .name = COMPOUND_STRING("Infestation"),
        .description = COMPOUND_STRING(
            "The foe is\ninfested and "
            "\nattacked for\n"BINDING_TURNS" turns."),
        .effect = EFFECT_HIT,
        .power = 20,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_INFESTATION,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Infestation,
    },

    [MOVE_POWER_UP_PUNCH] =
    {
        .name = COMPOUND_STRING("Power-Up Punch"),
        .description = COMPOUND_STRING(
            "A hard punch that\nraises "
            "the user's\nAttack."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PowerUpPunch,
    },

    [MOVE_OBLIVION_WING] =
    {
        .name = COMPOUND_STRING("Oblivion Wing"),
        .description = sDrainingKissDescription,
        .effect = EFFECT_ABSORB,
        .power = 80,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 75 },
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_OblivionWing,
    },

    [MOVE_THOUSAND_ARROWS] =
    {
        .name = COMPOUND_STRING("Thousand Arrows"),
        .description = COMPOUND_STRING(
            "Can hit Flying\nfoes, then "
            "knocks\nthem to the\nground."),
        .effect = EFFECT_SMACK_DOWN,
        .power = 90,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .damagesAirborne = TRUE,
        .ignoreTypeIfFlyingAndUngrounded = TRUE,
        .metronomeBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTIFUL,
        .contestComboStarterId = COMBO_STARTER_THOUSAND_ARROWS,
        .contestComboMoves = {COMBO_STARTER_THOUSAND_WAVES},
        .battleAnimScript = gBattleAnimMove_ThousandArrows,
    },

    [MOVE_THOUSAND_WAVES] =
    {
        .name = COMPOUND_STRING("Thousand Waves"),
        .description = COMPOUND_STRING(
            "Those hit by the\nwave can "
            "no longer\nescape."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .skyBattleBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PREVENT_ESCAPE,
        }),
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_THOUSAND_WAVES,
        .contestComboMoves = {COMBO_STARTER_THOUSAND_ARROWS},
        .battleAnimScript = gBattleAnimMove_ThousandWaves,
    },

    [MOVE_LANDS_WRATH] =
    {
        .name = COMPOUND_STRING("Land's Wrath"),
        .description = COMPOUND_STRING(
            "Gathers the energy\nof the "
            "land to\nattack every foe."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LandsWrath,
    },

    [MOVE_LIGHT_OF_RUIN] =
    {
        .name = COMPOUND_STRING("Light Of Ruin"),
        .description = COMPOUND_STRING(
            "Fires a great beam\nof light "
            "that also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = 140,
        .type = TYPE_FAIRY,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .recoilPercentage = 50 },
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LightOfRuin,
    },

    [MOVE_ORIGIN_PULSE] =
    {
        .name = COMPOUND_STRING("Origin Pulse"),
        .description = COMPOUND_STRING(
            "Beams of glowing\nblue light "
            "blast\nboth foes."),
        .effect = EFFECT_HIT,
        .power = 110,
        .type = TYPE_WATER,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .pulseMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_OriginPulse,
    },

    [MOVE_PRECIPICE_BLADES] =
    {
        .name = COMPOUND_STRING("Precipice Blades"),
        .description = COMPOUND_STRING(
            "Fearsome blades of\nstone "
            "attack both\nfoes."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_GROUND,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_LAST
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PrecipiceBlades,
    },

    [MOVE_DRAGON_ASCENT] =
    {
        .name = COMPOUND_STRING("Dragon Ascent"),
        .description = sCloseCombatDescription,
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_SPDEF_DOWN,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DragonAscent,
    },

    [MOVE_HYPERSPACE_FURY] =
    {
        .name = COMPOUND_STRING("Hyperspace Fury"),
        .description = sHyperspaceHoleDescription,
        .effect = EFFECT_HYPERSPACE_FURY,
        .power = 100,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .metronomeBanned = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FEINT, // TODO: Is this supposed to happen before the attack animation?
        },
        {
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING, //CONTEST_EFFECT_EXCITES_AUDIENCE_MORE_IF_FIRST
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_HYPERSPACE_FURY,
        .contestComboMoves = {COMBO_STARTER_HYPERSPACE_HOLE},
        .battleAnimScript = gBattleAnimMove_HyperspaceFury,
    },

    [MOVE_SHORE_UP] =
    {
        .name = COMPOUND_STRING("Shore Up"),
        .description = COMPOUND_STRING(
            "Restores the\nuser's HP. "
            "More HP\nin a sandstorm."),
        .effect = EFFECT_SHORE_UP,
        .power = 0,
        .type = TYPE_GROUND,
        .accuracy = 0,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 5 : 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .healingMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SANDSTORM},
        .battleAnimScript = gBattleAnimMove_ShoreUp,
    },

    [MOVE_FIRST_IMPRESSION] =
    {
        .name = COMPOUND_STRING("First Impression"),
        .description = COMPOUND_STRING(
            "Hits hard and\nfirst. "
            "Only works\nfirst turn."),
        .effect = EFFECT_FIRST_TURN_ONLY,
        .power = 90,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 2,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .moveProperty = MOVE_FIRST_IMPRESSION },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FirstImpression,
    },

    [MOVE_BANEFUL_BUNKER] =
    {
        .name = COMPOUND_STRING("Baneful Bunker"),
        .description = COMPOUND_STRING(
            "Protects user and\npoisons "
            "foes on\ncontact."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_BANEFUL_BUNKER },
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BanefulBunker,
    },

    [MOVE_SPIRIT_SHACKLE] =
    {
        .name = COMPOUND_STRING("Spirit Shackle"),
        .description = COMPOUND_STRING(
            "After being hit,\nfoes can "
            "no longer\nescape."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PREVENT_ESCAPE,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SpiritShackle,
    },

    [MOVE_DARKEST_LARIAT] =
    {
        .name = COMPOUND_STRING("Darkest Lariat"),
        .description = COMPOUND_STRING(
            "Swings the arms to\nstrike "
            "It ignores\nstat changes."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresTargetDefenseEvasionStages = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DarkestLariat,
    },

    [MOVE_SPARKLING_ARIA] =
    {
        .name = COMPOUND_STRING("Sparkling Aria"),
        .description = COMPOUND_STRING(
            "Sings with\nbubbles. Cures "
            "\nburns on contact."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .status = STATUS1_BURN },
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_REMOVE_STATUS,
            .sheerForceOverride = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SCALD},
        .battleAnimScript = gBattleAnimMove_SparklingAria,
    },

    [MOVE_ICE_HAMMER] =
    {
        .name = COMPOUND_STRING("Ice Hammer"),
        .description = COMPOUND_STRING(
            "Swings the fist to\nstrike. "
            "Lowers the\nuser's Speed."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_ICE,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_IceHammer,
    },

    [MOVE_FLORAL_HEALING] =
    {
        .name = COMPOUND_STRING("Floral Healing"),
        .description = COMPOUND_STRING(
            "Restores an ally's\nHP. "
            "Heals more on\ngrass."),
        .effect = EFFECT_HEAL_PULSE,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .argument = { .moveProperty = MOVE_EFFECT_FLORAL_HEALING },
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FloralHealing,
    },

    [MOVE_HIGH_HORSEPOWER] =
    {
        .name = COMPOUND_STRING("High Horsepower"),
        .description = COMPOUND_STRING(
            "Slams hard into\nthe foe with "
            "its\nentire body."),
        .effect = EFFECT_HIT,
        .power = 95,
        .type = TYPE_GROUND,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HighHorsepower,
    },

    [MOVE_STRENGTH_SAP] =
    {
        .name = COMPOUND_STRING("Strength Sap"),
        .description = COMPOUND_STRING(
            "Saps the foe's\nAttack to "
            "heal HP,\nthen drops Attack."),
        .effect = EFFECT_STRENGTH_SAP,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .magicCoatAffected = TRUE,
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_StrengthSap,
    },

    [MOVE_SOLAR_BLADE] =
    {
        .name = COMPOUND_STRING("Solar Blade"),
        .description = COMPOUND_STRING(
            "Charges first\nturn, then "
            "chops\nwith a blade of\nlight."),
        .effect = EFFECT_SOLAR_BEAM,
        .power = 125,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_PKMNTOOKSUNLIGHT, .weather = B_WEATHER_SUN },
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_SolarBlade,
    },

    [MOVE_LEAFAGE] =
    {
        .name = COMPOUND_STRING("Leafage"),
        .description = COMPOUND_STRING(
            "Attacks with a\nflurry of "
            "small\nleaves."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GROWTH},
        .battleAnimScript = gBattleAnimMove_Leafage,
    },

    [MOVE_SPOTLIGHT] =
    {
        .name = COMPOUND_STRING("Spotlight"),
        .description = COMPOUND_STRING(
            "Makes the foe\nattack the "
            "\nspotlighted\nPokémon."),
        .effect = EFFECT_FOLLOW_ME,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 3,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPDEF_UP_1 },
        .magicCoatAffected = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Spotlight,
    },

    [MOVE_TOXIC_THREAD] =
    {
        .name = COMPOUND_STRING("Toxic Thread"),
        .description = COMPOUND_STRING(
            "Attacks with a\nthread that "
            "\npoisons and drops\nSpeed."),
        .effect = EFFECT_TOXIC_THREAD,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_TOXIC},
        .battleAnimScript = gBattleAnimMove_ToxicThread,
    },

    [MOVE_LASER_FOCUS] =
    {
        .name = COMPOUND_STRING("Laser Focus"),
        .description = COMPOUND_STRING(
            "Guarantees the\nnext move "
            "will be\na critical hit."),
        .effect = EFFECT_LASER_FOCUS,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 30,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ATK_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LaserFocus,
    },

    [MOVE_GEAR_UP] =
    {
        .name = COMPOUND_STRING("Gear Up"),
        .description = COMPOUND_STRING(
            "Boosts the attacks\nof "
            "those with Plus\nor Minus."),
        .effect = EFFECT_GEAR_UP,
        .power = 0,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GearUp,
    },

    [MOVE_THROAT_CHOP] =
    {
        .name = COMPOUND_STRING("Throat Chop"),
        .description = COMPOUND_STRING(
            "Chops the throat\nto disable "
            "sound\nmoves for 2 turns."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_THROAT_CHOP,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ThroatChop,
    },

    [MOVE_POLLEN_PUFF] =
    {
        .name = COMPOUND_STRING("Pollen Puff"),
        .description = COMPOUND_STRING(
            "Explodes on foes,\nbut "
            "restores\nally's HP."),
        .effect = EFFECT_HIT_ENEMY_HEAL_ALLY,
        .power = 90,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PollenPuff,
    },

    [MOVE_ANCHOR_SHOT] =
    {
        .name = COMPOUND_STRING("Anchor Shot"),
        .description = COMPOUND_STRING(
            "Strangles the foe\nwith a "
            "chain. The\nfoe can't escape."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PREVENT_ESCAPE,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AnchorShot,
    },

    [MOVE_PSYCHIC_TERRAIN] =
    {
        .name = COMPOUND_STRING("Psychic Terrain"),
        .description = COMPOUND_STRING(
            "The ground turns\nweird for "
            "5 turns.\nBlocks priority."),
        .effect = EFFECT_PSYCHIC_TERRAIN,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = COMBO_STARTER_PSYCHIC_TERRAIN,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PsychicTerrain,
    },

    [MOVE_LUNGE] =
    {
        .name = COMPOUND_STRING("Lunge"),
        .description = COMPOUND_STRING(
            "Lunges at the foe\nto lower "
            "its\nAttack stat."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Lunge,
    },

    [MOVE_FIRE_LASH] =
    {
        .name = COMPOUND_STRING("Fire Lash"),
        .description = COMPOUND_STRING(
            "Whips the foe with\nfire "
            "lowering its\nDefense."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_FireLash,
    },

    [MOVE_POWER_TRIP] =
    {
        .name = COMPOUND_STRING("Power Trip"),
        .description = COMPOUND_STRING(
            "It hits harder the\nmore "
            "stat boosts\nthe user has."),
        .effect = EFFECT_STORED_POWER,
        .power = 20,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PowerTrip,
    },

    [MOVE_BURN_UP] =
    {
        .name = COMPOUND_STRING("Burn Up"),
        .description = COMPOUND_STRING(
            "Burns out the user\nfully "
            "removing the\nFire type."),
        .effect = EFFECT_FAIL_IF_NOT_ARG_TYPE,
        .power = 130,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .thawsUser = TRUE,
        .argument = { .type = TYPE_FIRE },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_REMOVE_ARG_TYPE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_SUNNY_DAY},
        .battleAnimScript = gBattleAnimMove_BurnUp,
    },

    [MOVE_SPEED_SWAP] =
    {
        .name = COMPOUND_STRING("Speed Swap"),
        .description = COMPOUND_STRING(
            "Swaps user's Speed\nwith "
            "the target's."),
        .effect = EFFECT_SPEED_SWAP,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresSubstitute = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SpeedSwap,
    },

    [MOVE_SMART_STRIKE] =
    {
        .name = COMPOUND_STRING("Smart Strike"),
        .description = COMPOUND_STRING(
            "Hits with an\naccurate "
            "horn that\nnever misses."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SmartStrike,
    },

    [MOVE_PURIFY] =
    {
        .name = COMPOUND_STRING("Purify"),
        .description = COMPOUND_STRING(
            "Cures the foe's\nstatus "
            "to restore\nHP."),
        .effect = EFFECT_PURIFY,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_ALL_STATS_UP_1 },
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Purify,
    },

    [MOVE_REVELATION_DANCE] =
    {
        .name = COMPOUND_STRING("Revelation Dance"),
        .description = COMPOUND_STRING(
            "Dances with\nmystical power. "
            "\nMatches user's\nfirst type."),
        .effect = EFFECT_REVELATION_DANCE,
        .power = 90,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .danceMove = TRUE,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RevelationDance,
    },

    [MOVE_CORE_ENFORCER] =
    {
        .name = COMPOUND_STRING("Core Enforcer"),
        .description = COMPOUND_STRING(
            "Hits with a ray\nthat "
            "nullifies the\nfoe's Ability."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .zMove = { .powerOverride = 140 },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CORE_ENFORCER,
        }),
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CoreEnforcer,
    },

    [MOVE_TROP_KICK] =
    {
        .name = COMPOUND_STRING("Trop Kick"),
        .description = COMPOUND_STRING(
            "An intense kick\nfrom the "
            "tropics.\nLowers Attack."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TropKick,
    },

    [MOVE_INSTRUCT] =
    {
        .name = COMPOUND_STRING("Instruct"),
        .description = COMPOUND_STRING(
            "Orders the target\nto use "
            "its last\nmove again."),
        .effect = EFFECT_INSTRUCT,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPATK_UP_1 },
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .instructBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Instruct,
    },

    [MOVE_BEAK_BLAST] =
    {
        .name = COMPOUND_STRING("Beak Blast"),
        .description = COMPOUND_STRING(
            "Heats beak to\nattack last. "
            "Burns\nfoe on contact."),
        .effect = EFFECT_BEAK_BLAST,
        .power = 100,
        .type = TYPE_FLYING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = -3,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = TRUE,
        .ballisticMove = TRUE,
        .meFirstBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BeakBlast,
    },

    [MOVE_CLANGING_SCALES] =
    {
        .name = COMPOUND_STRING("Clanging Scales"),
        .description = COMPOUND_STRING(
            "Makes a big noise\nwith "
            "its scales.\nDrops Defense."),
        .effect = EFFECT_HIT,
        .power = 110,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .soundMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ClangingScales,
    },

    [MOVE_DRAGON_HAMMER] =
    {
        .name = COMPOUND_STRING("Dragon Hammer"),
        .description = COMPOUND_STRING(
            "Swings its whole\nbody "
            "like a hammer\nto damage."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_DANCE, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_RUSH, COMBO_STARTER_DRAGON_TAIL},
        .battleAnimScript = gBattleAnimMove_DragonHammer,
    },

    [MOVE_BRUTAL_SWING] =
    {
        .name = COMPOUND_STRING("Brutal Swing"),
        .description = COMPOUND_STRING(
            "Violently swings\naround "
            "to hurt\neveryone nearby."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BrutalSwing,
    },

    [MOVE_AURORA_VEIL] =
    {
        .name = COMPOUND_STRING("Aurora Veil"),
        #if B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_SNOW
        .description = COMPOUND_STRING(
            "\nWeakens all\nattacks, but "
            "only\nusable with snow."),
        #elif B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_BOTH
        .description = COMPOUND_STRING(
            "\nWeakens all\nattacks if "
            "used in\nhail or snow."),
        #else
        .description = COMPOUND_STRING(
            "Weakens all\nattacks, but "
            "only\nusable with hail."),
        #endif
        .effect = EFFECT_AURORA_VEIL,
        .power = 0,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_HAIL},
        .battleAnimScript = gBattleAnimMove_AuroraVeil,
    },

    [MOVE_SHELL_TRAP] =
    {
        .name = COMPOUND_STRING("Shell Trap"),
        .description = COMPOUND_STRING(
            "Sets a shell trap\nthat "
            "damages on\ncontact."),
        .effect = EFFECT_SHELL_TRAP,
        .power = 150,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = -3,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .assistBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShellTrap,
    },

    [MOVE_FLEUR_CANNON] =
    {
        .name = COMPOUND_STRING("Fleur Cannon"),
        .description = COMPOUND_STRING(
            "A strong ray that\nharshly "
            "lowers Sp.\nAttack."),
        .effect = EFFECT_HIT,
        .power = 130,
        .type = TYPE_FAIRY,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_2,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FleurCannon,
    },

    [MOVE_PSYCHIC_FANGS] =
    {
        .name = COMPOUND_STRING("Psychic Fangs"),
        .description = COMPOUND_STRING(
            "Chomps with\npsychic fangs. "
            "\nDestroys any\nbarriers."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BREAK_SCREEN,
            .preAttackEffect = TRUE,
        }),
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PsychicFangs,
    },

    [MOVE_STOMPING_TANTRUM] =
    {
        .name = COMPOUND_STRING("Stomping Tantrum"),
        .description = COMPOUND_STRING(
            "Stomps around\nangrily. "
            "Stronger\nafter a failure."),
        .effect = EFFECT_STOMPING_TANTRUM,
        .power = 75,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_StompingTantrum,
    },

    [MOVE_SHADOW_BONE] =
    {
        .name = COMPOUND_STRING("Shadow Bone"),
        .description = COMPOUND_STRING(
            "Strikes with a\nhaunted "
            "bone.\nMight drop\nDefense."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = COMBO_STARTER_SHADOW_BONE,
        .contestComboMoves = {COMBO_STARTER_BONE_CLUB, COMBO_STARTER_BONEMERANG, COMBO_STARTER_BONE_RUSH},
        .battleAnimScript = gBattleAnimMove_ShadowBone,
    },

    [MOVE_ACCELEROCK] =
    {
        .name = COMPOUND_STRING("Accelerock"),
        .description = COMPOUND_STRING(
            "Hits with a\nhigh-speed "
            "rock\nthat always goes\nfirst."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_ROCK,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Accelerock,
    },

    [MOVE_LIQUIDATION] =
    {
        .name = COMPOUND_STRING("Liquidation"),
        .description = COMPOUND_STRING(
            "Slams the foe with\nwater. "
            "Can lower\nDefense."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_RAIN_DANCE},
        .battleAnimScript = gBattleAnimMove_Liquidation,
    },

    [MOVE_PRISMATIC_LASER] =
    {
        .name = COMPOUND_STRING("Prismatic Laser"),
        .description = COMPOUND_STRING(
            "A high power laser\nthat "
            "forces\nrecharge next\nturn."),
        .effect = EFFECT_HIT,
        .power = 160,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PrismaticLaser,
    },

    [MOVE_SPECTRAL_THIEF] =
    {
        .name = COMPOUND_STRING("Spectral Thief"),
        .description = COMPOUND_STRING(
            "Steals the\ntarget's stat "
            "\nboosts, then\nattacks."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_STEAL_STATS,
            .preAttackEffect = TRUE,
        }),
        .ignoresSubstitute = TRUE,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SpectralThief,
    },

    [MOVE_SUNSTEEL_STRIKE] =
    {
        .name = COMPOUND_STRING("Sunsteel Strike"),
        .description = COMPOUND_STRING(
            "A sun-fueled\nstrike that "
            "\nignores abilities."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresTargetAbility = TRUE,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_8,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SunsteelStrike,
    },

    [MOVE_MOONGEIST_BEAM] =
    {
        .name = COMPOUND_STRING("Moongeist Beam"),
        .description = COMPOUND_STRING(
            "A moon-powered\nbeam that "
            "ignores\nabilities."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresTargetAbility = TRUE,
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_8,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MoongeistBeam,
    },

    [MOVE_TEARFUL_LOOK] =
    {
        .name = COMPOUND_STRING("Tearful Look"),
        .description = COMPOUND_STRING(
            "The user tears up,\ndropping "
            "Attack\nand Sp. Attack."),
        .effect = EFFECT_NOBLE_ROAR,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_DEF_UP_1 },
        .ignoresProtect = TRUE,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TearfulLook,
    },

    [MOVE_ZING_ZAP] =
    {
        .name = COMPOUND_STRING("Zing Zap"),
        .description = COMPOUND_STRING(
            "An electrified\nimpact that "
            "can\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_CHARGE},
        .battleAnimScript = gBattleAnimMove_ZingZap,
    },

    [MOVE_NATURES_MADNESS] =
    {
        .name = COMPOUND_STRING("Nature's Madness"),
        .description = COMPOUND_STRING(
            "Halves the foe's\nHP with "
            "the power\nof nature."),
        .effect = EFFECT_FIXED_PERCENT_DAMAGE,
        .power = 1,
        .type = TYPE_FAIRY,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .damagePercentage = 50 },
        .metronomeBanned = B_UPDATED_MOVE_FLAGS >= GEN_8,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NaturesMadness,
    },

    [MOVE_MULTI_ATTACK] =
    {
        .name = COMPOUND_STRING("Multi-Attack"),
        .description = COMPOUND_STRING(
            "An attack that\nchanges "
            "with\nMemories."),
        .effect = EFFECT_CHANGE_TYPE_ON_ITEM,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 120 : 90,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .holdEffect = HOLD_EFFECT_MEMORY },
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MultiAttack,
    },

    [MOVE_MIND_BLOWN] =
    {
        .name = COMPOUND_STRING("Mind Blown"),
        .description = COMPOUND_STRING(
            "It explodes the\nuser's head "
            "to\ndamage everything\naround."),
        .effect = EFFECT_MAX_HP_50_RECOIL,
        .power = 150,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .dampBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MindBlown,
    },

    [MOVE_PLASMA_FISTS] =
    {
        .name = COMPOUND_STRING("Plasma Fists"),
        .description = COMPOUND_STRING(
            "Hits with\nelectrical fists. "
            "\nNormal moves turn\nElectric."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ION_DELUGE,
        }),
        .battleAnimScript = gBattleAnimMove_PlasmaFists,
    },

    [MOVE_PHOTON_GEYSER] =
    {
        .name = COMPOUND_STRING("Photon Geyser"),
        .description = COMPOUND_STRING(
            "User's highest\nattack stat "
            "\ndetermines its\ncategory."),
        .effect = EFFECT_PHOTON_GEYSER,
        .power = 100,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresTargetAbility = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PhotonGeyser,
    },

    [MOVE_ZIPPY_ZAP] =
    {
        .name = COMPOUND_STRING("Zippy Zap"),
        .description = COMPOUND_STRING(
            "Electric bursts\nalways go "
            "first\nand land a\ncritical hit."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 80 : 50,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_8 ? 10 : 15,
        .target = TARGET_SELECTED,
        .priority = 2,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .alwaysCriticalHit = TRUE,
        .metronomeBanned = TRUE,
        #if B_UPDATED_MOVE_DATA >= GEN_8
            .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_EVS_PLUS_1,
            .self = TRUE,
        }),
        #endif
        .battleAnimScript = gBattleAnimMove_ZippyZap,
    },

    [MOVE_SPLISHY_SPLASH] =
    {
        .name = COMPOUND_STRING("Splishy Splash"),
        .description = COMPOUND_STRING(
            "A huge electrified\nwave that "
            "may\nparalyze the foes."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_SplishySplash,
    },

    [MOVE_FLOATY_FALL] =
    {
        .name = COMPOUND_STRING("Floaty Fall"),
        .description = COMPOUND_STRING(
            "Floats in air and\ndives at "
            "angle.\nMay cause\nflinching."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_FLYING,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .gravityBanned = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
            .sheerForceOverride = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_FloatyFall,
    },

    [MOVE_PIKA_PAPOW] =
    {
        .name = COMPOUND_STRING("Pika Papow"),
        .description = COMPOUND_STRING(
            "Pikachu's love\nincreases its "
            "\npower. It never\nmisses."),
        .effect = EFFECT_RETURN,
        .power = 1,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_PikaPapow,
    },

    [MOVE_BOUNCY_BUBBLE] =
    {
        .name = COMPOUND_STRING("Bouncy Bubble"),
        .description = COMPOUND_STRING(
            "An attack that\nabsorbs "
        #if B_UPDATED_MOVE_DATA >= GEN_8
            "all the\ndamage inflicted."),
        #else
            "half the\ndamage inflicted."),
        #endif
        .effect = EFFECT_ABSORB,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 60 : 90,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_8 ? 20 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = B_UPDATED_MOVE_DATA >= GEN_8 ? 100 : 50 },
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .healingMove = B_HEAL_BLOCKING >= GEN_6,
        .battleAnimScript = gBattleAnimMove_BouncyBubble,
    },

    [MOVE_BUZZY_BUZZ] =
    {
        .name = COMPOUND_STRING("Buzzy Buzz"),
        .description = COMPOUND_STRING(
            "Shoots a jolt of\nelectricity "
            "that\nalways paralyzes."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 60 : 90,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_8 ? 20 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
        }),
        .battleAnimScript = gBattleAnimMove_BuzzyBuzz,
    },

    [MOVE_SIZZLY_SLIDE] =
    {
        .name = COMPOUND_STRING("Sizzly Slide"),
        .description = COMPOUND_STRING(
            "User cloaked in\nfire charges. "
            "\nLeaves the foe\nwith a burn."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 60 : 90,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_8 ? 20 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .thawsUser = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
        }),
        .battleAnimScript = gBattleAnimMove_SizzlySlide,
    },

    [MOVE_GLITZY_GLOW] =
    {
        .name = COMPOUND_STRING("Glitzy Glow"),
        .description = COMPOUND_STRING(
            "Telekinetic force\nthat sets "
            "wall,\nlowering Sp. Atk\ndamage."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 80 : 90,
        .type = TYPE_PSYCHIC,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_8 ? 95 : 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LIGHT_SCREEN,
        }),
        .battleAnimScript = gBattleAnimMove_GlitzyGlow,
    },

    [MOVE_BADDY_BAD] =
    {
        .name = COMPOUND_STRING("Baddy Bad"),
        .description = COMPOUND_STRING(
            "Acting badly,\nattacks. Sets "
            "\nwall, lowering\nAttack damage."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 80 : 90,
        .type = TYPE_DARK,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_8 ? 95 : 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_REFLECT,
        }),
        .battleAnimScript = gBattleAnimMove_BaddyBad,
    },

    [MOVE_SAPPY_SEED] =
    {
        .name = COMPOUND_STRING("Sappy Seed"),
        .description = COMPOUND_STRING(
            "Giant stalk\nscatters seeds "
            "\nthat drain HP\nevery turn."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 100 : 90,
        .type = TYPE_GRASS,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_8 ? 90 : 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_8 ? 10 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .magicCoatAffected = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LEECH_SEED,
        }),
        .battleAnimScript = gBattleAnimMove_SappySeed,
    },

    [MOVE_FREEZY_FROST] =
    {
        .name = COMPOUND_STRING("Freezy Frost"),
        .description = COMPOUND_STRING(
            "Crystal from cold\nhaze hits. "
            "\nEliminates all\nstat changes."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 100 : 90,
        .type = TYPE_ICE,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_8 ? 90 : 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_8 ? 10 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_HAZE,
        }),
        .battleAnimScript = gBattleAnimMove_FreezyFrost,
    },

    [MOVE_SPARKLY_SWIRL] =
    {
        .name = COMPOUND_STRING("Sparkly Swirl"),
        .description = COMPOUND_STRING(
            "Wrap foe with\nwhirlwind of "
            "\nscent. Heals\nparty's status."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_8 ? 120 : 90,
        .type = TYPE_FAIRY,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_8 ? 85 : 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_8 ? 5 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_AROMATHERAPY,
        }),
        .battleAnimScript = gBattleAnimMove_SparklySwirl,
    },

    [MOVE_VEEVEE_VOLLEY] =
    {
        .name = COMPOUND_STRING("Veevee Volley"),
        .description = COMPOUND_STRING(
            "Eevee's love\nincreases its "
            "\npower. It never\nmisses."),
        .effect = EFFECT_RETURN,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .mirrorMoveBanned = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_VeeveeVolley,
    },

    [MOVE_DOUBLE_IRON_BASH] =
    {
        .name = COMPOUND_STRING("Double Iron Bash"),
        .description = COMPOUND_STRING(
            "The user spins and\nhits with "
            "its\narms. May cause\nflinch."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .strikeCount = 2,
        .minimizeDoubleDamage = B_UPDATED_MOVE_FLAGS < GEN_8,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DoubleIronBash,
    },

    [MOVE_DYNAMAX_CANNON] =
    {
        .name = COMPOUND_STRING("Dynamax Cannon"),
        .description = COMPOUND_STRING(
            "Unleashes core\nenergy. "
            "2x against\nDynamaxed foes."),
        .effect = EFFECT_DYNAMAX_DOUBLE_DMG,
        .power = 100,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .mimicBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .parentalBondBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DynamaxCannon,
    },

    [MOVE_SNIPE_SHOT] =
    {
        .name = COMPOUND_STRING("Snipe Shot"),
        .description = COMPOUND_STRING(
            "The user ignores\neffects "
            "that draw\nin moves."),
        .effect = EFFECT_SNIPE_SHOT,
        .power = 80,
        .type = TYPE_WATER,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SnipeShot,
    },

    [MOVE_JAW_LOCK] =
    {
        .name = COMPOUND_STRING("Jaw Lock"),
        .description = COMPOUND_STRING(
            "Prevents the user\nand "
            "the target\nfrom escaping."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_TRAP_BOTH,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_JawLock,
    },

    [MOVE_STUFF_CHEEKS] =
    {
        .name = COMPOUND_STRING("Stuff Cheeks"),
        .description = COMPOUND_STRING(
            "Consumes the\nuser's Berry, "
            "then\nsharply raises\nDef."),
        .effect = EFFECT_STUFF_CHEEKS,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_StuffCheeks,
    },

    [MOVE_NO_RETREAT] =
    {
        .name = COMPOUND_STRING("No Retreat"),
        .description = COMPOUND_STRING(
            "Raises all of the\nuser's "
            "stats but\nprevents escape."),
        .effect = EFFECT_NO_RETREAT,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_NoRetreat,
    },

    [MOVE_TAR_SHOT] =
    {
        .name = COMPOUND_STRING("Tar Shot"),
        .description = COMPOUND_STRING(
            "Lowers the foe's\nSpeed and "
            "makes it\nweak to Fire."),
        .effect = EFFECT_TAR_SHOT,
        .power = 0,
        .type = TYPE_ROCK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TarShot,
    },

    [MOVE_MAGIC_POWDER] =
    {
        .name = COMPOUND_STRING("Magic Powder"),
        .description = COMPOUND_STRING(
            "Magic powder\nchanges the "
            "target\ninto a Psychic\ntype."),
        .effect = EFFECT_SOAK,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .type = TYPE_PSYCHIC },
        .magicCoatAffected = TRUE,
        .powderMove = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MagicPowder,
    },

    [MOVE_DRAGON_DARTS] =
    {
        .name = COMPOUND_STRING("Dragon Darts"),
        .description = COMPOUND_STRING(
            "The user attacks\ntwice. Two "
            "targets\nare hit once each."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SMART,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .strikeCount = 2,
        .parentalBondBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DragonDarts,
    },

    [MOVE_TEATIME] =
    {
        .name = COMPOUND_STRING("Teatime"),
        .description = COMPOUND_STRING(
            "All Pokémon have\nteatime "
            "and eat\ntheir Berries."),
        .effect = EFFECT_TEATIME,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_ALL_BATTLERS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Teatime,
    },

    [MOVE_OCTOLOCK] =
    {
        .name = COMPOUND_STRING("Octolock"),
        .description = COMPOUND_STRING(
            "Traps the foe to\nlower Def "
            "and Sp.\nDef each turn."),
        .effect = EFFECT_OCTOLOCK,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Octolock,
    },

    [MOVE_BOLT_BEAK] =
    {
        .name = COMPOUND_STRING("Bolt Beak"),
        .description = COMPOUND_STRING(
            "Double power if\nthe user "
            "moves\nbefore the target."),
        .effect = EFFECT_BOLT_BEAK,
        .power = 85,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BoltBeak,
    },

    [MOVE_FISHIOUS_REND] =
    {
        .name = COMPOUND_STRING("Fishious Rend"),
        .description = COMPOUND_STRING(
            "Double power if\nthe user "
            "moves\nbefore the target."),
        .effect = EFFECT_BOLT_BEAK,
        .power = 85,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .bitingMove = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FishiousRend,
    },

    [MOVE_COURT_CHANGE] =
    {
        .name = COMPOUND_STRING("Court Change"),
        .description = COMPOUND_STRING(
            "The user swaps\neffects on "
            "either\nside of the field."),
        .effect = EFFECT_COURT_CHANGE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .contestEffect = CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CourtChange,
    },

    [MOVE_CLANGOROUS_SOUL] =
    {
        .name = COMPOUND_STRING("Clangorous Soul"),
        .description = COMPOUND_STRING(
            "The user uses some\nof its "
            "HP to raise\nall its stats."),
        .effect = EFFECT_CLANGOROUS_SOUL,
        .power = 0,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .soundMove = TRUE,
        .danceMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ClangorousSoul,
    },

    [MOVE_BODY_PRESS] =
    {
        .name = COMPOUND_STRING("Body Press"),
        .description = COMPOUND_STRING(
            "Does more damage\nthe "
            "higher the\nuser's Def."),
        .effect = EFFECT_BODY_PRESS,
        .power = 80,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BodyPress,
    },

    [MOVE_DECORATE] =
    {
        .name = COMPOUND_STRING("Decorate"),
        .description = COMPOUND_STRING(
            "The user sharply\nraises "
            "the\ntarget's Atk and\nSp.Atk."),
        .effect = EFFECT_DECORATE,
        .power = 0,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Decorate,
    },

    [MOVE_DRUM_BEATING] =
    {
        .name = COMPOUND_STRING("Drum Beating"),
        .description = COMPOUND_STRING(
            "Plays a drum to\nattack. "
            "The foe's\nSpeed is lowered."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DrumBeating,
    },

    [MOVE_SNAP_TRAP] =
    {
        .name = COMPOUND_STRING("Snap Trap"),
        .description = COMPOUND_STRING(
            "Snares the target\nin a snap "
            "trap for\nfour to five\nturns."),
        .effect = EFFECT_HIT,
        .power = 35,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_SNAP_TRAP,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SnapTrap,
    },

    [MOVE_PYRO_BALL] =
    {
        .name = COMPOUND_STRING("Pyro Ball"),
        .description = COMPOUND_STRING(
            "Launches a fiery\nball at the "
            "\ntarget. It may\ncause a burn."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_FIRE,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .thawsUser = TRUE,
        .ballisticMove = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_PyroBall,
    },

    [MOVE_BEHEMOTH_BLADE] =
    {
        .name = COMPOUND_STRING("Behemoth Blade"),
        .description = COMPOUND_STRING(
            "Strikes as a\nsword. Deals 2x "
            "\ndamage to\nDynamaxed foes."),
        .effect = EFFECT_DYNAMAX_DOUBLE_DMG,
        .power = 100,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .mimicBanned = TRUE,
        .assistBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BehemothBlade,
    },

    [MOVE_BEHEMOTH_BASH] =
    {
        .name = COMPOUND_STRING("Behemoth Bash"),
        .description = COMPOUND_STRING(
            "Attacks as a\nshield. Deals 2x "
            "\ndamage to\nDynamaxed foes."),
        .effect = EFFECT_DYNAMAX_DOUBLE_DMG,
        .power = 100,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .mimicBanned = TRUE,
        .assistBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BehemothBash,
    },

    [MOVE_AURA_WHEEL] =
    {
        .name = COMPOUND_STRING("Aura Wheel"),
        .description = COMPOUND_STRING(
            "Raises Speed to\nattack. The "
            "Type\nis based on its\nform."),
        .effect = EFFECT_AURA_WHEEL,
        .power = 110,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AuraWheel,
    },

    [MOVE_BREAKING_SWIPE] =
    {
        .name = COMPOUND_STRING("Breaking Swipe"),
        .description = COMPOUND_STRING(
            "Swings its tail to\nattack. "
            "Lowers the\nAtk of those hit."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BreakingSwipe,
    },

    [MOVE_BRANCH_POKE] =
    {
        .name = COMPOUND_STRING("Branch Poke"),
        .description = COMPOUND_STRING(
            "The user pokes the\ntarget "
            "with a\npointed branch."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 40,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BranchPoke,
    },

    [MOVE_OVERDRIVE] =
    {
        .name = COMPOUND_STRING("Overdrive"),
        .description = COMPOUND_STRING(
            "The user twangs\nits guitar, "
            "\ncausing strong\nvibrations."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Overdrive,
    },

    [MOVE_APPLE_ACID] =
    {
        .name = COMPOUND_STRING("Apple Acid"),
        .description = COMPOUND_STRING(
            "Attacks with tart\napple acid "
            "to\nlower the foe's\nSp. Def."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AppleAcid,
    },

    [MOVE_GRAV_APPLE] =
    {
        .name = COMPOUND_STRING("Grav Apple"),
        .description = COMPOUND_STRING(
            "Drops an apple\nfrom above. "
            "Lowers\nthe foe's Defense."),
        .effect = EFFECT_GRAV_APPLE,
        .power = 80,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GravApple,
    },

    [MOVE_SPIRIT_BREAK] =
    {
        .name = COMPOUND_STRING("Spirit Break"),
        .description = COMPOUND_STRING(
            "Attacks with\nspirit-breaking "
            "\nforce. Lowers Sp.\nAtk."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SpiritBreak,
    },

    [MOVE_STRANGE_STEAM] =
    {
        .name = COMPOUND_STRING("Strange Steam"),
        .description = COMPOUND_STRING(
            "Emits a strange\nsteam to "
            "\npotentially\nconfuse the foe."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_FAIRY,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_StrangeSteam,
    },

    [MOVE_LIFE_DEW] =
    {
        .name = COMPOUND_STRING("Life Dew"),
        .description = COMPOUND_STRING(
            "Scatters water to\nrestore "
            "the HP of\nitself and allies."),
        .effect = EFFECT_LIFE_DEW,
        .power = 0,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LifeDew,
    },

    [MOVE_OBSTRUCT] =
    {
        .name = COMPOUND_STRING("Obstruct"),
        .description = COMPOUND_STRING(
            "Protects itself,\nharshly "
            "lowering\nDef on contact."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_OBSTRUCT },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .instructBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Obstruct,
    },

    [MOVE_FALSE_SURRENDER] =
    {
        .name = COMPOUND_STRING("False Surrender"),
        .description = COMPOUND_STRING(
            "Bows to stab the\nfoe "
            "with hair. It\nnever misses."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FalseSurrender,
    },

    [MOVE_METEOR_ASSAULT] =
    {
        .name = COMPOUND_STRING("Meteor Assault"),
        .description = COMPOUND_STRING(
            "Attacks with a\nthick leek. "
            "The\nuser must then\nrest."),
        .effect = EFFECT_HIT,
        .power = 150,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .instructBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MeteorAssault,
    },

    [MOVE_ETERNABEAM] =
    {
        .name = COMPOUND_STRING("Eternabeam"),
        .description = COMPOUND_STRING(
            "Eternatus'\nstrongest move. "
            "\nThe user rests\nnext turn."),
        .effect = EFFECT_HIT,
        .power = 160,
        .type = TYPE_DRAGON,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECHARGE,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Eternabeam,
    },

    [MOVE_STEEL_BEAM] =
    {
        .name = COMPOUND_STRING("Steel Beam"),
        .description = COMPOUND_STRING(
            "Fires a beam of\nsteel from "
            "its\nbody. It hurts the\nuser."),
        .effect = EFFECT_MAX_HP_50_RECOIL,
        .power = 140,
        .type = TYPE_STEEL,
        .accuracy = 95,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SteelBeam,
    },

    [MOVE_EXPANDING_FORCE] =
    {
        .name = COMPOUND_STRING("Expanding Force"),
        .description = COMPOUND_STRING(
            "Power goes up and\ndamages "
            "all foes\non Psychic\nTerrain."),
        .effect = EFFECT_TERRAIN_BOOST,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument.terrainBoost = {
            .terrain = STATUS_FIELD_PSYCHIC_TERRAIN,
            .percent = 50,
            .groundCheck = GROUND_CHECK_USER,
            .hitsBothFoes = TRUE,
        },
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_PSYCHIC_TERRAIN},
        .battleAnimScript = gBattleAnimMove_ExpandingForce,
    },

    [MOVE_STEEL_ROLLER] =
    {
        .name = COMPOUND_STRING("Steel Roller"),
        .description = COMPOUND_STRING(
            "Destroys terrain.\nFails if "
            "ground\nisn't terrain."),
        .effect = EFFECT_STEEL_ROLLER,
        .power = 130,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .skyBattleBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SteelRoller,
    },

    [MOVE_SCALE_SHOT] =
    {
        .name = COMPOUND_STRING("Scale Shot"),
        .description = COMPOUND_STRING(
            "Shoots scales 2 to\n5 times. "
            "Ups\nSpeed, lowers\ndefense."),
        .effect = EFFECT_HIT,
        .power = 25,
        .type = TYPE_DRAGON,
        .accuracy = 90,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .multiHit = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SCALE_SHOT,
        }),
        .battleAnimScript = gBattleAnimMove_ScaleShot,
    },

    [MOVE_METEOR_BEAM] =
    {
        .name = COMPOUND_STRING("Meteor Beam"),
        .description = COMPOUND_STRING(
            "A 2-turn move that\nraises "
            "Sp. Attack\nbefore attacking."),
        .effect = EFFECT_TWO_TURNS_ATTACK,
        .power = 120,
        .type = TYPE_ROCK,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .instructBanned = TRUE,
        .argument.twoTurnAttack = { .stringId = STRINGID_METEORBEAMCHARGING },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_PLUS_1,
            .self = TRUE,
            .onChargeTurnOnly = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_MeteorBeam,
    },

    [MOVE_SHELL_SIDE_ARM] =
    {
        .name = COMPOUND_STRING("Shell Side Arm"),
        .description = COMPOUND_STRING(
            "Deals better of\nphysical and "
            "\nspecial damage.\nMay poison."),
        .effect = EFFECT_SHELL_SIDE_ARM,
        .power = 90,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ShellSideArm,
    },

    [MOVE_MISTY_EXPLOSION] =
    {
        .name = COMPOUND_STRING("Misty Explosion"),
        .description = COMPOUND_STRING(
            "Hit everything and\nfaint. "
            "Powers up\non Misty Terrain."),
        .effect = EFFECT_TERRAIN_BOOST,
        .power = 100,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .explosion = TRUE,
        .dampBanned = TRUE,
        .argument.terrainBoost = {
            .terrain =  STATUS_FIELD_MISTY_TERRAIN,
            .percent = 50,
            .groundCheck = GROUND_CHECK_USER,
        },
        .contestEffect = CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_MISTY_TERRAIN},
        .battleAnimScript = gBattleAnimMove_MistyExplosion,
    },

    [MOVE_GRASSY_GLIDE] =
    {
        .name = COMPOUND_STRING("Grassy Glide"),
        .description = COMPOUND_STRING(
            "Gliding on ground,\nhits. Goes "
            "first\non Grassy Terrain."),
        .effect = EFFECT_GRASSY_GLIDE,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 55 : 70,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_GRASSY_TERRAIN},
        .battleAnimScript = gBattleAnimMove_GrassyGlide,
    },

    [MOVE_RISING_VOLTAGE] =
    {
        .name = COMPOUND_STRING("Rising Voltage"),
        .description = COMPOUND_STRING(
            "This move's power\ndoubles "
            "when on\nElectric Terrain."),
        .effect = EFFECT_TERRAIN_BOOST,
        .power = 70,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument.terrainBoost = {
            .terrain = STATUS_FIELD_ELECTRIC_TERRAIN,
            .percent = 100,
            .groundCheck = GROUND_CHECK_TARGET,
        },
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ELECTRIC_TERRAIN},
        .battleAnimScript = gBattleAnimMove_RisingVoltage,
    },

    [MOVE_TERRAIN_PULSE] =
    {
        .name = COMPOUND_STRING("Terrain Pulse"),
        .description = COMPOUND_STRING(
            "Type and power\nchanges "
            "depending\non the terrain."),
        .effect = EFFECT_TERRAIN_PULSE,
        .power = 50,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .pulseMove = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_REPETITION_NOT_BORING : CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {COMBO_STARTER_ELECTRIC_TERRAIN, COMBO_STARTER_MISTY_TERRAIN, COMBO_STARTER_GRASSY_TERRAIN, COMBO_STARTER_PSYCHIC_TERRAIN},
        .battleAnimScript = gBattleAnimMove_TerrainPulse,
    },

    [MOVE_SKITTER_SMACK] =
    {
        .name = COMPOUND_STRING("Skitter Smack"),
        .description = COMPOUND_STRING(
            "User skitters\nbehind foe to "
            "\nattack. Lowers\nfoe's Sp. Atk."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_BUG,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SkitterSmack,
    },

    [MOVE_BURNING_JEALOUSY] =
    {
        .name = COMPOUND_STRING("Burning Jealousy"),
        .description = COMPOUND_STRING(
            "Foes that have\nstats upped "
            "during\nthe turn get\nburned."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .onlyIfTargetRaisedStats = TRUE,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_BurningJealousy,
    },

    [MOVE_LASH_OUT] =
    {
        .name = COMPOUND_STRING("Lash Out"),
        .description = COMPOUND_STRING(
            "If user's stats\nwere lowered "
            "this\nturn, power is\ndoubled."),
        .effect = EFFECT_LASH_OUT,
        .power = 75,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_PREV_MON,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_LashOut,
    },

    [MOVE_POLTERGEIST] =
    {
        .name = COMPOUND_STRING("Poltergeist"),
        .description = COMPOUND_STRING(
            "Control foe's item\nto attack. "
            "Fails\nif foe has no\nitem."),
        .effect = EFFECT_POLTERGEIST,
        .power = 110,
        .type = TYPE_GHOST,
        .accuracy = 90,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Poltergeist,
    },

    [MOVE_CORROSIVE_GAS] =
    {
        .name = COMPOUND_STRING("Corrosive Gas"),
        .description = COMPOUND_STRING(
            "Highly acidic gas\nmelts items "
            "held\nby surrounding\nPokémon."),
        .effect = EFFECT_CORROSIVE_GAS,
        .power = 0,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 40,
        .target = TARGET_FOES_AND_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .magicCoatAffected = TRUE,
        .contestEffect = CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_CorrosiveGas,
    },

    [MOVE_COACHING] =
    {
        .name = COMPOUND_STRING("Coaching"),
        .description = COMPOUND_STRING(
            "Properly coaches\nallies to "
            "up their\nAttack and\nDefense."),
        .effect = EFFECT_COACHING,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Coaching,
    },

    [MOVE_FLIP_TURN] =
    {
        .name = COMPOUND_STRING("Flip Turn"),
        .description = COMPOUND_STRING(
            "Attacks and rushes\nback to "
            "switch\nwith a party\nPokémon."),
        .effect = EFFECT_HIT_ESCAPE,
        .power = 60,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .contestEffect = CONTEST_EFFECT_AVOID_STARTLE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FlipTurn,
    },

    [MOVE_TRIPLE_AXEL] =
    {
        .name = COMPOUND_STRING("Triple Axel"),
        .description = COMPOUND_STRING(
            "A 3-kick attack\nthat gets "
            "more\npowerful with each\nhit."),
        .effect = EFFECT_TRIPLE_KICK,
        .power = 20,
        .type = TYPE_ICE,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .strikeCount = 3,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_TripleAxel,
    },

    [MOVE_DUAL_WINGBEAT] =
    {
        .name = COMPOUND_STRING("Dual Wingbeat"),
        .description = COMPOUND_STRING(
            "User slams the\ntarget with "
            "wings\nand hits twice in\na row."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_FLYING,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .strikeCount = 2,
        .contestEffect = CONTEST_EFFECT_REPETITION_NOT_BORING,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DualWingbeat,
    },

    [MOVE_SCORCHING_SANDS] =
    {
        .name = COMPOUND_STRING("Scorching Sands"),
        .description = COMPOUND_STRING(
            "Throws scorching\nsand at "
            "the\ntarget. May leave\na burn."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .thawsUser = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ScorchingSands,
    },

    [MOVE_JUNGLE_HEALING] =
    {
        .name = COMPOUND_STRING("Jungle Healing"),
        .description = COMPOUND_STRING(
            "Heals HP and\nstatus of "
            "itself\nand allies in\nbattle."),
        .effect = EFFECT_JUNGLE_HEALING,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .ignoresSubstitute = TRUE,
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_JungleHealing,
    },

    [MOVE_WICKED_BLOW] =
    {
        .name = COMPOUND_STRING("Wicked Blow"),
        .description = COMPOUND_STRING(
            "Mastering the Dark\nstyle, "
            "strikes\nwith a critical\nhit."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 75 : 80,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .alwaysCriticalHit = TRUE,
        .punchingMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WickedBlow,
    },

    [MOVE_SURGING_STRIKES] =
    {
        .name = COMPOUND_STRING("Surging Strikes"),
        .description = COMPOUND_STRING(
            "Mastering the\nWater style, "
            "\nstrikes with 3\ncritical hits."),
        .effect = EFFECT_HIT,
        .power = 25,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .alwaysCriticalHit = TRUE,
        .punchingMove = TRUE,
        .strikeCount = 3,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SurgingStrikes,
    },

    [MOVE_THUNDER_CAGE] =
    {
        .name = COMPOUND_STRING("Thunder Cage"),
        .description = COMPOUND_STRING(
            "Traps the foe in a\ncage of "
            "\nelectricity for\n"BINDING_TURNS" turns."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_ELECTRIC,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WRAP,
            .multistring.wrapped = B_MSG_WRAPPED_THUNDER_CAGE,
        }),
        .contestEffect = CONTEST_EFFECT_DONT_EXCITE_AUDIENCE,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ThunderCage,
    },

    [MOVE_DRAGON_ENERGY] =
    {
        .name = COMPOUND_STRING("Dragon Energy"),
        .description = COMPOUND_STRING(
            "The higher the\nuser's HP "
            "the more\ndamage caused."),
        .effect = EFFECT_POWER_BASED_ON_USER_HP,
        .power = 150,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_DragonEnergy,
    },

    [MOVE_FREEZING_GLARE] =
    {
        .name = COMPOUND_STRING("Freezing Glare"),
        .description = COMPOUND_STRING(
            "Shoots psychic\npower from "
        #if B_USE_FROSTBITE == TRUE
            "the\neyes. May\nfrostbite."),
        #else
            "the\neyes. May freeze\nthe foe."),
        #endif
        .power = 90,
        .effect = EFFECT_HIT,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
            .chance = 10,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FreezingGlare,
    },

    [MOVE_FIERY_WRATH] =
    {
        .name = COMPOUND_STRING("Fiery Wrath"),
        .description = COMPOUND_STRING(
            "An attack fueled\nby your "
            "wrath. May\ncause flinching."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 20,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_FieryWrath,
    },

    [MOVE_THUNDEROUS_KICK] =
    {
        .name = COMPOUND_STRING("Thunderous Kick"),
        .description = COMPOUND_STRING(
            "Uses a\nlightning-like\nkick "
            "to hit.\nLowers foe's\nDefense."),
        .effect = EFFECT_HIT,
        .power = 90,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_HIGHLY_APPEALING,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ThunderousKick,
    },

    [MOVE_GLACIAL_LANCE] =
    {
        .name = COMPOUND_STRING("Glacial Lance"),
        .description = COMPOUND_STRING(
            "Hurls a\nblizzard-cloaked "
            "\nicicle lance at\nfoes."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 120 : 130,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_GlacialLance,
    },

    [MOVE_ASTRAL_BARRAGE] =
    {
        .name = COMPOUND_STRING("Astral Barrage"),
        .description = COMPOUND_STRING(
            "Sends a frightful\namount "
            "of small\nghosts at foes."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_AstralBarrage,
    },

    [MOVE_EERIE_SPELL] =
    {
        .name = COMPOUND_STRING("Eerie Spell"),
        .description = COMPOUND_STRING(
            "Attacks with\npsychic power. "
            "\nFoe's last move\nhas 3 PP cut."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .contestEffect = CONTEST_EFFECT_BETTER_WHEN_LATER,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_EERIE_SPELL,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_EerieSpell,
    },

    [MOVE_DIRE_CLAW] =
    {
        .name = COMPOUND_STRING("Dire Claw"),
        .description = COMPOUND_STRING(
            "High critical hit\nchance. May "
            "\nparalyze, poison\nor drowse."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 80 : 60,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DIRE_CLAW,
            .chance = 50,
        }),
        .battleAnimScript = gBattleAnimMove_DireClaw,
    },

    [MOVE_PSYSHIELD_BASH] =
    {
        .name = COMPOUND_STRING("Psyshield Bash"),
        .description = COMPOUND_STRING(
            "Hits a foe with\npsychic "
            "energy.\nMay raise Defense."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_PSYCHIC,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_PsyshieldBash,
    },

    [MOVE_POWER_SHIFT] =
    {
        .name = COMPOUND_STRING("Power Shift"),
        .description = COMPOUND_STRING(
            "The user swaps its\nAttack "
            "and Defense\nstats."),
        .effect = EFFECT_POWER_TRICK,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_PowerShift,
},

    [MOVE_STONE_AXE] =
    {
        .name = COMPOUND_STRING("Stone Axe"),
        .description = COMPOUND_STRING(
            "Sets sharp rocks\nthat hurt "
            "the foe."),
        .effect = EFFECT_STONE_AXE,
        .power = 65,
        .type = TYPE_ROCK,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .sheerForceOverride = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_StoneAxe,
    },

    [MOVE_SPRINGTIDE_STORM] =
    {
        .name = COMPOUND_STRING("Springtide Storm"),
        .description = COMPOUND_STRING(
            "Wraps a foe in\nfierce winds. "
            "\nVaries with the\nuser's form."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 100 : 95,
        .type = TYPE_FAIRY,
        .accuracy = 80,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_SpringtideStorm,
    },

    [MOVE_MYSTICAL_POWER] =
    {
        .name = COMPOUND_STRING("Mystical Power"),
        .description = COMPOUND_STRING(
            "A mysterious power\nstrikes, "
            "raising\nthe user's Sp.\nAtk."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_PSYCHIC,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_MysticalPower,
    },

    [MOVE_RAGING_FURY] =
    {
        .name = COMPOUND_STRING("Raging Fury"),
        .description = COMPOUND_STRING(
            "A rampage of 2 to\n3 turns "
            "that\nconfuses the user."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 120 : 90,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_RANDOM,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_THRASH,
            .self = TRUE,
        }),
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_USER_MORE_EASILY_STARTLED : CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_RagingFury,
    },

    [MOVE_WAVE_CRASH] =
    {
        .name = COMPOUND_STRING("Wave Crash"),
        .description = COMPOUND_STRING(
            "A slam shrouded in\nwater. "
            "It also\nhurts the user."),
        .effect = EFFECT_RECOIL,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 120 : 75,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .recoilPercentage = 33 },
        .makesContact = TRUE,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_WaveCrash,
    },

    [MOVE_CHLOROBLAST] =
    {
        .name = COMPOUND_STRING("Chloroblast"),
        .description = COMPOUND_STRING(
            "A user-hurting\nblast of "
            "amassed\nchlorophyll."),
        .effect = EFFECT_CHLOROBLAST,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 150 : 120,
        .type = TYPE_GRASS,
        .accuracy = 95,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .battleAnimScript = gBattleAnimMove_Chloroblast,
    },

    [MOVE_MOUNTAIN_GALE] =
    {
        .name = COMPOUND_STRING("Mountain Gale"),
        .description = COMPOUND_STRING(
            "Giant chunks of\nice damage "
            "the\nfoe. It may\nflinch."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_ICE,
        .accuracy = 85,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 10 : 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_MountainGale,
    },

    [MOVE_VICTORY_DANCE] =
    {
        .name = COMPOUND_STRING("Victory Dance"),
        .description = COMPOUND_STRING(
            "Dances to raise\nAttack, "
            "Defense\nand Speed."),
        .effect = EFFECT_VICTORY_DANCE,
        .power = 0,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 20,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .danceMove = TRUE,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_VictoryDance,
    },

    [MOVE_HEADLONG_RUSH] =
    {
        .name = COMPOUND_STRING("Headlong Rush"),
        .description = COMPOUND_STRING(
            "Hits with a\nfull-body tackle. "
            "\nLowers the users's\ndefenses."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 120 : 100,
        .type = TYPE_GROUND,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_SPDEF_DOWN,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_HeadlongRush,
    },

    [MOVE_BARB_BARRAGE] =
    {
        .name = COMPOUND_STRING("Barb Barrage"),
        .description = COMPOUND_STRING(
            "Can poison on\nimpact. Powers "
            "up\nagainst poisoned\nfoes."),
        .effect = EFFECT_DOUBLE_POWER_ON_ARG_STATUS,
        .power = 60,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 10 : 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .status = STATUS1_PSN_ANY },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 50,
        }),
        .battleAnimScript = gBattleAnimMove_BarbBarrage,
    },

    [MOVE_ESPER_WING] =
    {
        .name = COMPOUND_STRING("Esper Wing"),
        .description = COMPOUND_STRING(
            "High critical hit\nratio. "
            "Ups the\nuser's Speed."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 80 : 75,
        .type = TYPE_PSYCHIC,
        .accuracy = B_UPDATED_MOVE_DATA >= GEN_9 ? 100 : 90,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_EsperWing,
    },

    [MOVE_BITTER_MALICE] =
    {
        .name = COMPOUND_STRING("Bitter Malice"),
        .description = COMPOUND_STRING(
            "A spine-chilling\nresentment. "
            "Lowers\nthe foe's Attack."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 75 : 60,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_BitterMalice,
    },

    [MOVE_SHELTER] =
    {
        .name = COMPOUND_STRING("Shelter"),
        .description = COMPOUND_STRING(
            "The user hardens\ntheir skin, "
            "\nsharply raising\nits Defense."),
        .effect = EFFECT_DEFENSE_UP_2,
        .power = 0,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_Shelter,
    },

    [MOVE_TRIPLE_ARROWS] =
    {
        .name = COMPOUND_STRING("Triple Arrows"),
        .description = COMPOUND_STRING(
            "High critical hit\nratio. "
            "May lower\nDefense or flinch."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 90 : 50,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 10 : 15,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_MINUS_1,
            .chance = 50,
        },
        {
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_TripleArrows,
    },

    [MOVE_INFERNAL_PARADE] =
    {
        .name = COMPOUND_STRING("Infernal Parade"),
        .description = COMPOUND_STRING(
            "Hurts a foe harder\nif it has "
            "an\nailment. May leave\na burn."),
        .effect = EFFECT_DOUBLE_POWER_ON_ARG_STATUS,
        .power = 60,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .status = STATUS1_ANY },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_InfernalParade,
    },

    [MOVE_CEASELESS_EDGE] =
    {
        .name = COMPOUND_STRING("Ceaseless Edge"),
        .description = COMPOUND_STRING(
            "Sets Spikes that\nhurt the "
            "foe."),
        .effect = EFFECT_CEASELESS_EDGE,
        .power = 65,
        .type = TYPE_DARK,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .sheerForceOverride = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_CeaselessEdge,
    },

    [MOVE_BLEAKWIND_STORM] =
    {
        .name = COMPOUND_STRING("Bleakwind Storm"),
        .description = COMPOUND_STRING(
            "Hits with brutal,\ncold winds. "
            "May\nlower the foe's\nSpeed."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 100 : 95,
        .type = TYPE_FLYING,
        .accuracy = 80,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 10 : 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .alwaysHitsInRain = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_BleakwindStorm,
    },

    [MOVE_WILDBOLT_STORM] =
    {
        .name = COMPOUND_STRING("Wildbolt Storm"),
        .description = COMPOUND_STRING(
            "Hits with a brutal\ntempest. "
            "May\ninflict paralysis."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 100 : 95,
        .type = TYPE_ELECTRIC,
        .accuracy = 80,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 10 : 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .alwaysHitsInRain = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 20,
        }),
        .battleAnimScript = gBattleAnimMove_WildboltStorm,
    },

    [MOVE_SANDSEAR_STORM] =
    {
        .name = COMPOUND_STRING("Sandsear Storm"),
        .description = COMPOUND_STRING(
            "Hits with brutally\nhot sand. "
            "May\ninflict a burn."),
        .effect = EFFECT_HIT,
        .power = B_UPDATED_MOVE_DATA >= GEN_9 ? 100 : 95,
        .type = TYPE_GROUND,
        .accuracy = 80,
        .pp = B_UPDATED_MOVE_DATA >= GEN_9 ? 10 : 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .windMove = TRUE,
        .alwaysHitsInRain = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 20,
        }),
        .battleAnimScript = gBattleAnimMove_SandsearStorm,
    },

    [MOVE_LUNAR_BLESSING] =
    {
        .name = COMPOUND_STRING("Lunar Blessing"),
        .description = COMPOUND_STRING(
            "The user heals and\ncures "
            "itself and\nits ally."),
        .effect = EFFECT_JUNGLE_HEALING,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .healingMove = TRUE,
        .battleAnimScript = gBattleAnimMove_LunarBlessing,
    },

    [MOVE_TAKE_HEART] =
    {
        .name = COMPOUND_STRING("Take Heart"),
        .description = COMPOUND_STRING(
            "The user lifts its\nspirits to "
            "heal\nand strengthen\nitself."),
        .effect = EFFECT_TAKE_HEART,
        .power = 0,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_TakeHeart,
    },

    [MOVE_TERA_BLAST] =
    {
        .name = COMPOUND_STRING("Tera Blast"),
        .description = COMPOUND_STRING(
            "If the user's\nTerastallized, "
            "it\nhits with its Tera\ntype."),
        .effect = EFFECT_TERA_BLAST,
        .power = 80,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .forcePressure = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_TERA_BLAST,
            .self = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_TeraBlast,
    },

    [MOVE_SILK_TRAP] =
    {
        .name = COMPOUND_STRING("Silk Trap"),
        .description = COMPOUND_STRING(
            "Protects itself,\nlowering "
            "Speed on\ncontact."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_SILK_TRAP },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_SilkTrap,
    },

    [MOVE_AXE_KICK] =
    {
        .name = COMPOUND_STRING("Axe Kick"),
        .description = COMPOUND_STRING(
            "May miss and hurt\nthe kicker. "
            "May\ncause confusion."),
        .effect = EFFECT_RECOIL_IF_MISS,
        .power = 120,
        .type = TYPE_FIGHTING,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_AxeKick,
    },

    [MOVE_LAST_RESPECTS] =
    {
        .name = COMPOUND_STRING("Last Respects"),
        .description = COMPOUND_STRING(
            "This move deals\nmore damage "
            "for\neach defeated\nally."),
        .effect = EFFECT_LAST_RESPECTS,
        .power = 50,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_LastRespects,
    },

    [MOVE_LUMINA_CRASH] =
    {
        .name = COMPOUND_STRING("Lumina Crash"),
        .description = COMPOUND_STRING(
            "A mind-affecting\nlight "
            "harshly\nlowers Sp. Def."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_DEF_MINUS_2,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_LuminaCrash,
    },

    [MOVE_ORDER_UP] =
    {
        .name = COMPOUND_STRING("Order Up"),
        .description = COMPOUND_STRING(
            "Boosts a user's\nstats "
            "depending on\nTatsugiri."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ORDER_UP,
            .self = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_OrderUp,
    },

    [MOVE_JET_PUNCH] =
    {
        .name = COMPOUND_STRING("Jet Punch"),
        .description = COMPOUND_STRING(
            "A punch is thrown\nat blinding "
            "speed\nto strike first."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_JetPunch,
    },

    [MOVE_SPICY_EXTRACT] =
    {
        .name = COMPOUND_STRING("Spicy Extract"),
        .description = COMPOUND_STRING(
            "Sharply ups\ntarget's Attack, "
            "\nharshly lowers its\nDefense."),
        .effect = EFFECT_SPICY_EXTRACT,
        .power = 0,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .magicCoatAffected = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_SpicyExtract,
    },

    [MOVE_SPIN_OUT] =
    {
        .name = COMPOUND_STRING("Spin Out"),
        .description = COMPOUND_STRING(
            "Furiously strains\nits legs. "
            "Harshly\nlowers user's\nSpeed."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_2,
            .self = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_SpinOut,
    },

    [MOVE_POPULATION_BOMB] =
    {
        .name = COMPOUND_STRING("Population Bomb"),
        .description = COMPOUND_STRING(
            "The user's fellows\nhit one "
            "to ten\ntimes in a row."),
        .effect = EFFECT_POPULATION_BOMB,
        .power = 20,
        .type = TYPE_NORMAL,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .metronomeBanned = TRUE,
        .strikeCount = 10,
        .battleAnimScript = gBattleAnimMove_PopulationBomb,
    },

    [MOVE_ICE_SPINNER] =
    {
        .name = COMPOUND_STRING("Ice Spinner"),
        .description = COMPOUND_STRING(
            "Ice-covered feet\nhit a foe "
            "and\ndestroy the\nterrain."),
        .effect = EFFECT_ICE_SPINNER,
        .power = 80,
        .type = TYPE_ICE,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .battleAnimScript = gBattleAnimMove_IceSpinner,
    },

    [MOVE_GLAIVE_RUSH] =
    {
        .name = COMPOUND_STRING("Glaive Rush"),
        .description = COMPOUND_STRING(
            "Foe attacks next\nturn can't "
            "miss\nand do double\ndamage."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_GLAIVE_RUSH,
            .self = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_GlaiveRush,
    },

    [MOVE_REVIVAL_BLESSING] =
    {
        .name = COMPOUND_STRING("Revival Blessing"),
        .description = COMPOUND_STRING(
            "Revives a fainted\nparty {PKMN} "
            "and\nrestores half of\nits HP."),
        .effect = EFFECT_REVIVAL_BLESSING,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .healingMove = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .battleAnimScript = gBattleAnimMove_RevivalBlessing,
    },

    [MOVE_SALT_CURE] =
    {
        .name = COMPOUND_STRING("Salt Cure"),
        .description = COMPOUND_STRING(
            "Hurts foe every\nturn. Double "
            "\ndamage to Steel\nand Water."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_ROCK,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SALT_CURE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_SaltCure,
    },

    [MOVE_TRIPLE_DIVE] =
    {
        .name = COMPOUND_STRING("Triple Dive"),
        .description = COMPOUND_STRING(
            "Hits target with\nsplashes "
            "of water\n3 times in a row."),
        .effect = EFFECT_HIT,
        .power = 30,
        .type = TYPE_WATER,
        .accuracy = 95,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .strikeCount = 3,
        .battleAnimScript = gBattleAnimMove_TripleDive,
    },

    [MOVE_MORTAL_SPIN] =
    {
        .name = COMPOUND_STRING("Mortal Spin"),
        .description = COMPOUND_STRING(
            "Erases trap moves\nand Leech "
            "Seed.\nPoisons adjacent\nfoes."),
        .effect = EFFECT_RAPID_SPIN,
        .power = 30,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_MortalSpin,
    },

    [MOVE_DOODLE] =
    {
        .name = COMPOUND_STRING("Doodle"),
        .description = COMPOUND_STRING(
            "Changes user's and\nally's "
            "Ability\ninto the target's."),
        .effect = EFFECT_DOODLE,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_Doodle,
    },

    [MOVE_FILLET_AWAY] =
    {
        .name = COMPOUND_STRING("Fillet Away"),
        .description = COMPOUND_STRING(
            "Sharply boosts\noffenses and "
            "Speed\nby using its own\nHP."),
        .effect = EFFECT_FILLET_AWAY,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RECOVER_HP },
        .snatchAffected = TRUE,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_FilletAway,
    },

    [MOVE_KOWTOW_CLEAVE] =
    {
        .name = COMPOUND_STRING("Kowtow Cleave"),
        .description = COMPOUND_STRING(
            "User slashes the\nfoe after "
            "\nkowtowing. It\nnever misses."),
        .effect = EFFECT_HIT,
        .power = 85,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .battleAnimScript = gBattleAnimMove_KowtowCleave,
    },

    [MOVE_FLOWER_TRICK] =
    {
        .name = COMPOUND_STRING("Flower Trick"),
        .description = COMPOUND_STRING(
            "Rigged bouquet.\nAlways gets "
            "a\ncritical hit,\nnever missing."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .alwaysCriticalHit = TRUE,
        .battleAnimScript = gBattleAnimMove_FlowerTrick,
    },

    [MOVE_TORCH_SONG] =
    {
        .name = COMPOUND_STRING("Torch Song"),
        .description = COMPOUND_STRING(
            "Flames scorch the\ntarget. "
            "Boosts the\nuser's Sp. Atk."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_TorchSong,
    },

    [MOVE_AQUA_STEP] =
    {
        .name = COMPOUND_STRING("Aqua Step"),
        .description = COMPOUND_STRING(
            "Hits with light,\nfluid dance "
            "steps.\nUps the user's\nSpeed."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .danceMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_AquaStep,
    },

    [MOVE_RAGING_BULL] =
    {
        .name = COMPOUND_STRING("Raging Bull"),
        .description = COMPOUND_STRING(
            "Tackle that breaks\nbarriers. "
            "User's\nform determines\ntype."),
        .effect = EFFECT_RAGING_BULL,
        .power = 90,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BREAK_SCREEN,
            .preAttackEffect = TRUE,
        }),
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_RagingBull,
    },

    [MOVE_MAKE_IT_RAIN] =
    {
        .name = COMPOUND_STRING("Make It Rain"),
        .description = COMPOUND_STRING(
            "Lowers the user's\nSp. Atk. "
            "Money is\nrecovered after."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PAYDAY,
        },
        {
            .moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1,
            .self = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_MakeItRain,
    },

    [MOVE_RUINATION] =
    {
        .name = COMPOUND_STRING("Ruination"),
        .description = COMPOUND_STRING(
            "Summons a ruinous\ndisaster "
            "and cuts\nhalf the foe's HP."),
        .effect = EFFECT_FIXED_PERCENT_DAMAGE,
        .power = 1,
        .type = TYPE_DARK,
        .accuracy = 90,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .damagePercentage = 50 },
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Ruination,
    },

    [MOVE_COLLISION_COURSE] =
    {
        .name = COMPOUND_STRING("Collision Course"),
        .description = COMPOUND_STRING(
            "Prehistoric\nexplosion that's "
            "\nstronger if super\neffective."),
        .effect = EFFECT_COLLISION_COURSE,
        .power = 100,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_CollisionCourse,
    },

    [MOVE_ELECTRO_DRIFT] =
    {
        .name = COMPOUND_STRING("Electro Drift"),
        .description = COMPOUND_STRING(
            "Futuristic\nelectricity. It's "
            "\nstronger if super\neffective."),
        .effect = EFFECT_COLLISION_COURSE,
        .power = 100,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_ElectroDrift,
    },

    [MOVE_SHED_TAIL] =
    {
        .name = COMPOUND_STRING("Shed Tail"),
        .description = COMPOUND_STRING(
            "Creates a\nSubstitute for "
            "\nitself before\nswitching out."),
        .effect = EFFECT_SHED_TAIL,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_ShedTail,
    },

    [MOVE_CHILLY_RECEPTION] =
    {
        .name = COMPOUND_STRING("Chilly Reception"),
        #if B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_HAIL
        .description = COMPOUND_STRING(
            "Bad\njoke summons\nhailstorm. "
            "The\nuser also switches\nout."),
        #else
        .description = COMPOUND_STRING(
            "Bad joke summons\nsnowstorm. "
            "The\nuser also switches\nout."),
        #endif
        .effect = EFFECT_WEATHER_AND_SWITCH,
        .power = 0,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .argument = { .weatherType = (B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_HAIL) ? BATTLE_WEATHER_HAIL : BATTLE_WEATHER_SNOW },
        .battleAnimScript = gBattleAnimMove_ChillyReception,
    },

    [MOVE_TIDY_UP] =
    {
        .name = COMPOUND_STRING("Tidy Up"),
        .description = COMPOUND_STRING(
            "User tidies up\nhazards and "
            "raises\nits Attack and\nSpeed."),
        .effect = EFFECT_TIDY_UP,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_TidyUp,
    },

    [MOVE_SNOWSCAPE] =
    {
        .name = COMPOUND_STRING("Snowscape"),
        #if B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_HAIL
            .description = COMPOUND_STRING(
                "Summons a\nhailstorm that "
                "\nstrikes every turn."),
        #else
            .description = COMPOUND_STRING(
                "Summons a\nsnowstorm that "
                "\nlasts for five\nturns."),
        #endif
        .effect = EFFECT_WEATHER,
        .power = 0,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_FIELD,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .weatherType = (B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_HAIL) ? BATTLE_WEATHER_HAIL : BATTLE_WEATHER_SNOW },
        .zMove = { .effect = Z_EFFECT_SPD_UP_1 },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = C_UPDATED_MOVE_EFFECTS >= GEN_6 ? CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS : CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = (B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_HAIL) ? gBattleAnimMove_Hail : gBattleAnimMove_Snowscape,
    },

    [MOVE_POUNCE] =
    {
        .name = COMPOUND_STRING("Pounce"),
        .description = COMPOUND_STRING(
            "The user pounces\non the foe, "
            "\nlowering its Speed."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_BUG,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_MINUS_1,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_Pounce,
    },

    [MOVE_TRAILBLAZE] =
    {
        .name = COMPOUND_STRING("Trailblaze"),
        .description = COMPOUND_STRING(
            "The user attacks\nsuddenly, "
            "raising\nits Speed."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPD_PLUS_1,
            .self = TRUE,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Trailblaze,
    },

    [MOVE_CHILLING_WATER] =
    {
        .name = COMPOUND_STRING("Chilling Water"),
        .description = COMPOUND_STRING(
            "A shower with\nice-cold water "
            "\nlowers the\ntarget's Attack."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ATK_MINUS_1,
            .chance = 100,
        }),
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ChillingWater,
    },

    [MOVE_HYPER_DRILL] =
    {
        .name = COMPOUND_STRING("Hyper Drill"),
        .description = COMPOUND_STRING(
            "A spinning pointed\npart "
            "bypasses a\nfoe's Protect."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresProtect = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_HyperDrill,
    },

    [MOVE_TWIN_BEAM] =
    {
        .name = COMPOUND_STRING("Twin Beam"),
        .description = COMPOUND_STRING(
            "Mystical eye-beams\nthat hit "
            "the\ntarget twice in a\nrow."),
        .effect = EFFECT_HIT,
        .power = 40,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .strikeCount = 2,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_TwinBeam,
    },

    [MOVE_RAGE_FIST] =
    {
        .name = COMPOUND_STRING("Rage Fist"),
        .description = COMPOUND_STRING(
            "The more the user\nhas been "
            "hit, the\nstronger the move."),
        .effect = EFFECT_RAGE_FIST,
        .power = 50,
        .type = TYPE_GHOST,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .punchingMove = TRUE,
        .metronomeBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_RageFist,
    },

    [MOVE_ARMOR_CANNON] =
    {
        .name = COMPOUND_STRING("Armor Cannon"),
        .description = COMPOUND_STRING(
            "A strong attack\nbut lowers "
            "the\ndefensive stats."),
        .effect = EFFECT_HIT,
        .power = 120,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .metronomeBanned = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEF_SPDEF_DOWN,
            .self = TRUE,
        }),
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_ArmorCannon,
    },

    [MOVE_BITTER_BLADE] =
    {
        .name = COMPOUND_STRING("Bitter Blade"),
        .description = COMPOUND_STRING(
            "An attack that\nabsorbs "
            "half the\ndamage inflicted."),
        .effect = EFFECT_ABSORB,
        .power = 90,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = { .absorbPercentage = 50 },
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .healingMove = TRUE,
        .battleAnimScript = gBattleAnimMove_BitterBlade,
    },

    [MOVE_DOUBLE_SHOCK] =
    {
        .name = COMPOUND_STRING("Double Shock"),
        .description = COMPOUND_STRING(
            "Discharges all\nelectricity, "
            "\nlosing the\nElectric type."),
        .effect = EFFECT_FAIL_IF_NOT_ARG_TYPE,
        .power = 120,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .metronomeBanned = TRUE,
        .argument = { .type = TYPE_ELECTRIC },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_REMOVE_ARG_TYPE,
            .self = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_DoubleShock,
    },

    [MOVE_GIGATON_HAMMER] =
    {
        .name = COMPOUND_STRING("Gigaton Hammer"),
        .description = COMPOUND_STRING(
            "Swings a huge\nhammer. Can't "
            "be\nused twice in a\nrow."),
        .effect = EFFECT_HIT,
        .power = 160,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .cantUseTwice = TRUE,
        .battleAnimScript = gBattleAnimMove_GigatonHammer,
    },

    [MOVE_COMEUPPANCE] =
    {
        .name = COMPOUND_STRING("Comeuppance"),
        .description = COMPOUND_STRING(
            "Retaliates\nstrongly against "
            "\nwho last hurt the\nuser."),
        .effect = EFFECT_REFLECT_DAMAGE,
        .power = 1,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_DEPENDS,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument = {
            .reflectDamage.damagePercent = 150,
            .reflectDamage.damageCategories = 1u << DAMAGE_CATEGORY_PHYSICAL | 1u << DAMAGE_CATEGORY_SPECIAL,
        },
        .makesContact = TRUE,
        .meFirstBanned = TRUE,
        .metronomeBanned = TRUE,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_LAST,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Comeuppance,
    },

    [MOVE_AQUA_CUTTER] =
    {
        .name = COMPOUND_STRING("Aqua Cutter"),
        .description = COMPOUND_STRING(
            "Pressurized water\ncut with a "
            "high\ncritical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 70,
        .type = TYPE_WATER,
        .accuracy = 100,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .pp = 20,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .slicingMove = TRUE,
        .battleAnimScript = gBattleAnimMove_AquaCutter,
    },

    [MOVE_BLAZING_TORQUE] =
    {
        .name = COMPOUND_STRING("Blazing Torque"),
        .description = COMPOUND_STRING("---"),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_BlazingTorque,
    },

    [MOVE_WICKED_TORQUE] =
    {
        .name = COMPOUND_STRING("Wicked Torque"),
        .description = COMPOUND_STRING("---"),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_DARK,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SLEEP,
            .chance = 10,
        }),
        .battleAnimScript = gBattleAnimMove_WickedTorque,
    },

    [MOVE_NOXIOUS_TORQUE] =
    {
        .name = COMPOUND_STRING("Noxious Torque"),
        .description = COMPOUND_STRING("---"),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_NoxiousTorque,
    },

    [MOVE_COMBAT_TORQUE] =
    {
        .name = COMPOUND_STRING("Combat Torque"),
        .description = COMPOUND_STRING("---"),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_CombatTorque,
    },

    [MOVE_MAGICAL_TORQUE] =
    {
        .name = COMPOUND_STRING("Magical Torque"),
        .description = COMPOUND_STRING("---"),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .mirrorMoveBanned = TRUE,
        .meFirstBanned = TRUE,
        .mimicBanned = TRUE,
        .metronomeBanned = TRUE,
        .copycatBanned = TRUE,
        .sleepTalkBanned = TRUE,
        .instructBanned = TRUE,
        .encoreBanned = TRUE,
        .assistBanned = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .chance = 30,
        }),
        .battleAnimScript = gBattleAnimMove_MagicalTorque,
    },

    [MOVE_PSYBLADE] =
    {
        .name = COMPOUND_STRING("Psyblade"),
        .description = COMPOUND_STRING(
            "This move's power\nincreases "
            "when on\nElectric Terrain."),
        .effect = EFFECT_TERRAIN_BOOST,
        .power = 80,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .argument.terrainBoost = {
            .terrain = STATUS_FIELD_ELECTRIC_TERRAIN,
            .percent = 50,
            .groundCheck = GROUND_CHECK_NONE,
        },
        .makesContact = TRUE,
        .slicingMove = TRUE,
        .battleAnimScript = gBattleAnimMove_Psyblade,
    },

    [MOVE_HYDRO_STEAM] =
    {
        .name = COMPOUND_STRING("Hydro Steam"),
        .description = COMPOUND_STRING(
            "This move's power\nincreases "
            "under\nharsh sunlight."),
        .effect = EFFECT_HYDRO_STEAM,
        .power = 80,
        .type = TYPE_WATER,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .thawsUser = TRUE,
        .battleAnimScript = gBattleAnimMove_HydroSteam,
    },

    [MOVE_BLOOD_MOON] =
    {
        .name = COMPOUND_STRING("Blood Moon"),
        .description = COMPOUND_STRING(
            "Unleashes the\nblood moon. "
            "Can't\nbe used twice in a\nrow."),
        .effect = EFFECT_HIT,
        .power = 140,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .cantUseTwice = TRUE,
        .battleAnimScript = gBattleAnimMove_BloodMoon,
    },

    [MOVE_MATCHA_GOTCHA] =
    {
        .name = COMPOUND_STRING("Matcha Gotcha"),
        .description = COMPOUND_STRING(
            "Absorbs half the\ndamage "
            "inflicted.\nMay cause a burn."),
        .effect = EFFECT_ABSORB,
        .power = 80,
        .type = TYPE_GRASS,
        .accuracy = 90,
        .pp = 15,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .absorbPercentage = 50 },
        .thawsUser = TRUE,
        .healingMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_BURN,
            .chance = 20,
        }),
        .battleAnimScript = gBattleAnimMove_MatchaGotcha,
    },

    [MOVE_SYRUP_BOMB] =
    {
        .name = COMPOUND_STRING("Syrup Bomb"),
        .description = COMPOUND_STRING(
            "Lowers the foe's\nspeed "
            "each turn\nfor 3 turns."),
        .effect = EFFECT_HIT,
        .power = 60,
        .type = TYPE_GRASS,
        .accuracy = 85,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ballisticMove = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SYRUP_BOMB,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_SyrupBomb,
    },

    [MOVE_IVY_CUDGEL] =
    {
        .name = COMPOUND_STRING("Ivy Cudgel"),
        .description = COMPOUND_STRING(
            "Type changes with\nheld mask. "
            "High\ncritical-hit\nratio."),
        .effect = EFFECT_IVY_CUDGEL,
        .power = 100,
        .type = TYPE_GRASS,
        .accuracy = 100,
        .pp = 10,
        .criticalHitStage = B_UPDATED_MOVE_DATA >= GEN_3 ? 1 : 2,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_IvyCudgel,
    },

    [MOVE_ELECTRO_SHOT] =
    {
        .name = COMPOUND_STRING("Electro Shot"),
        .description = COMPOUND_STRING(
            "Gathers\nelectricity, then "
            "\nfires a\nhigh-voltage shot."),
        .effect = EFFECT_TWO_TURNS_ATTACK,
        .power = 130,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument.twoTurnAttack = { .stringId = STRINGID_ELECTROSHOTCHARGING, .weather = B_WEATHER_RAIN },
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SP_ATK_PLUS_1,
            .self = TRUE,
            .onChargeTurnOnly = TRUE,
            .sheerForceOverride = TRUE,
        }),
        .battleAnimScript = gBattleAnimMove_ElectroShot,
    },

    [MOVE_TERA_STARSTORM] =
    {
        .name = COMPOUND_STRING("Tera Starstorm"),
        .description = COMPOUND_STRING(
            "In Terapagos's\nStellar "
            "Form, it\nhits all foes."),
        .effect = EFFECT_TERA_STARSTORM,
        .power = 120,
        .type = TYPE_NORMAL,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .assistBanned = TRUE,
        .copycatBanned = TRUE,
        .mimicBanned = TRUE,
        .sketchBanned = (B_SKETCH_BANS >= GEN_9),
        .battleAnimScript = gBattleAnimMove_TeraStarstorm,
    },

    [MOVE_FICKLE_BEAM] =
    {
        .name = COMPOUND_STRING("Fickle Beam"),
        .description = COMPOUND_STRING(
            "Shoots a beam of\nlight. "
            "Sometimes\ntwice as strong."),
        .effect = EFFECT_FICKLE_BEAM,
        .power = 80,
        .type = TYPE_DRAGON,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .battleAnimScript = gBattleAnimMove_FickleBeam,
    },

    [MOVE_BURNING_BULWARK] =
    {
        .name = COMPOUND_STRING("Burning Bulwark"),
        .description = COMPOUND_STRING(
            "Evades attack, and\nburns "
            "the foe if\nstruck."),
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_FIRE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_BURNING_BULWARK },
        .zMove = { .effect = Z_EFFECT_RESET_STATS },
        .ignoresProtect = TRUE,
        .mirrorMoveBanned = TRUE,
        .copycatBanned = TRUE,
        .assistBanned = TRUE,
        .battleAnimScript = gBattleAnimMove_BurningBulwark,
    },

    [MOVE_THUNDERCLAP] =
    {
        .name = COMPOUND_STRING("Thunderclap"),
        .description = sSuckerPunchDescription,
        .effect = EFFECT_SUCKER_PUNCH,
        .power = 70,
        .type = TYPE_ELECTRIC,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 1,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .contestEffect = CONTEST_EFFECT_BETTER_IF_FIRST,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_Thunderclap,
    },

    [MOVE_MIGHTY_CLEAVE] =
    {
        .name = COMPOUND_STRING("Mighty Cleave"),
        .description = sFeintDescription,
        .effect = EFFECT_HIT,
        .power = 95,
        .type = TYPE_ROCK,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .ignoresProtect = TRUE,
        .slicingMove = TRUE,
        .battleAnimScript = gBattleAnimMove_MightyCleave,
    },

    [MOVE_TACHYON_CUTTER] =
    {
        .name = COMPOUND_STRING("Tachyon Cutter"),
        .description = COMPOUND_STRING(
            "Launches particle\nblades at "
            "the\ntarget. Strikes\ntwice."),
        .effect = EFFECT_HIT,
        .power = 50,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .strikeCount = 2,
        .slicingMove = TRUE,
        .battleAnimScript = gBattleAnimMove_TachyonCutter,
    },

    [MOVE_HARD_PRESS] =
    {
        .name = COMPOUND_STRING("Hard Press"),
        .description = sWringOutDescription,
        .effect = EFFECT_POWER_BASED_ON_TARGET_HP,
        .power = 100,
        .type = TYPE_STEEL,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .battleAnimScript = gBattleAnimMove_HardPress,
    },

    [MOVE_DRAGON_CHEER] =
    {
        .name = COMPOUND_STRING("Dragon Cheer"),
        .description = COMPOUND_STRING(
            "Increases allies'\ncritical hit "
            "\nratio, especially\nif Dragons."),
        .effect = EFFECT_DRAGON_CHEER,
        .power = 0,
        .type = TYPE_DRAGON,
        .accuracy = 0,
        .pp = 15,
        .target = TARGET_ALLY,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .ignoresSubstitute = TRUE,
        .battleAnimScript = gBattleAnimMove_DragonCheer,
    },

    [MOVE_ALLURING_VOICE] =
    {
        .name = COMPOUND_STRING("Alluring Voice"),
        .description = COMPOUND_STRING(
            "Confuses foe if\nits stats "
            "were\nboosted this turn."),
        .effect = EFFECT_HIT,
        .power = 80,
        .type = TYPE_FAIRY,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSION,
            .onlyIfTargetRaisedStats = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_AlluringVoice,
    },

    [MOVE_TEMPER_FLARE] =
    {
        .name = COMPOUND_STRING("Temper Flare"),
        .description = COMPOUND_STRING(
            "A desperation\nattack. Power "
            "\ndoubles if last\nmove failed."),
        .effect = EFFECT_STOMPING_TANTRUM,
        .power = 75,
        .type = TYPE_FIRE,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .battleAnimScript = gBattleAnimMove_TemperFlare,
    },

    [MOVE_SUPERCELL_SLAM] =
    {
        .name = COMPOUND_STRING("Supercell Slam"),
        .description = COMPOUND_STRING(
            "An electrified\nslam. If it "
            "\nmisses, the user\nis hurt."),
        .effect = EFFECT_RECOIL_IF_MISS,
        .power = 100,
        .type = TYPE_ELECTRIC,
        .accuracy = 95,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .minimizeDoubleDamage = TRUE,
        .contestEffect = CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
        .contestComboStarterId = 0,
        .contestComboMoves = {0},
        .battleAnimScript = gBattleAnimMove_SupercellSlam,
    },

    [MOVE_PSYCHIC_NOISE] =
    {
        .name = COMPOUND_STRING("Psychic Noise"),
        .description = COMPOUND_STRING(
            "Sound waves that\ndamage and "
            "prevent\nhealing for 2\nturns."),
        .effect = EFFECT_HIT,
        .power = 75,
        .type = TYPE_PSYCHIC,
        .accuracy = 100,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PSYCHIC_NOISE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_PsychicNoise,
    },

    [MOVE_UPPER_HAND] =
    {
        .effect = EFFECT_UPPER_HAND,
        .name = COMPOUND_STRING("Upper Hand"),
        .description = COMPOUND_STRING(
            "Makes the target\nflinch if "
            "readying\na priority move."),
        .power = 65,
        .type = TYPE_FIGHTING,
        .accuracy = 100,
        .pp = 15,
        .target = TARGET_SELECTED,
        .priority = 3,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .makesContact = TRUE,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FLINCH,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_UpperHand,
    },

    [MOVE_MALIGNANT_CHAIN] =
    {
        .name = COMPOUND_STRING("Malignant Chain"),
        .description = COMPOUND_STRING(
            "A corrosive chain\nattack "
            "that may\nbadly poison."),
        .effect = EFFECT_HIT,
        .power = 100,
        .type = TYPE_POISON,
        .accuracy = 100,
        .pp = 5,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_TOXIC,
            .chance = 50,
        }),
        .battleAnimScript = gBattleAnimMove_MalignantChain,
    },

    // Z-Moves
    [MOVE_BREAKNECK_BLITZ] =
    {
        .name = COMPOUND_STRING("Breakneck Blitz"),
        .description = COMPOUND_STRING(
            "Builds momentum\nand crashes "
            "into\nthe foe. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,    //determined from move type
        .battleAnimScript = gBattleAnimMove_BreakneckBlitz,
    },
    [MOVE_ALL_OUT_PUMMELING] =
    {
        .name = COMPOUND_STRING("All-Out Pummeling"),
        .description = COMPOUND_STRING(
            "Rams an energy orb\ninto "
            "the target.\nPower varies."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_AllOutPummeling,
    },
    [MOVE_SUPERSONIC_SKYSTRIKE] =
    {
        .name = COMPOUND_STRING("Supersonic Skystrike"),
        .description = COMPOUND_STRING(
            "Soars up and\nplummets toward "
            "\nthe target. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_SupersonicSkystrike,
    },
    [MOVE_ACID_DOWNPOUR] =
    {
        .name = COMPOUND_STRING("Acid Downpour"),
        .description = COMPOUND_STRING(
            "Sinks the target\nin a poison "
            "swamp.\nPower varies."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_AcidDownpour,
    },
    [MOVE_TECTONIC_RAGE] =
    {
        .name = COMPOUND_STRING("Tectonic Rage"),
        .description = COMPOUND_STRING(
            "Burrows deep and\nslams into "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_GROUND,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .battleAnimScript = gBattleAnimMove_TectonicRage,
    },
    [MOVE_CONTINENTAL_CRUSH] =
    {
        .name = COMPOUND_STRING("Continental Crush"),
        .description = COMPOUND_STRING(
            "Drops a huge rock\nmountain "
            "on the\nfoe. Power varies."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_ContinentalCrush,
    },
    [MOVE_SAVAGE_SPIN_OUT] =
    {
        .name = COMPOUND_STRING("Savage Spin-Out"),
        .description = COMPOUND_STRING(
            "Spits threads of\nsilk to "
            "bind the\nfoe. Power varies."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_SavageSpinOut,
    },
    [MOVE_NEVER_ENDING_NIGHTMARE] =
    {
        .name = COMPOUND_STRING("Never-Ending Nightmare"),
        .description = COMPOUND_STRING(
            "Deep-seated\ngrudges trap "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_NeverEndingNightmare,
    },
    [MOVE_CORKSCREW_CRASH] =
    {
        .name = COMPOUND_STRING("Corkscrew Crash"),
        .description = COMPOUND_STRING(
            "Spins very fast\nand rams "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_CorkscrewCrash,
    },
    [MOVE_INFERNO_OVERDRIVE] =
    {
        .name = COMPOUND_STRING("Inferno Overdrive"),
        .description = COMPOUND_STRING(
            "Breathes intense\nfire at "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_FIRE,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_InfernoOverdrive,
    },
    [MOVE_HYDRO_VORTEX] =
    {
        .name = COMPOUND_STRING("Hydro Vortex"),
        .description = COMPOUND_STRING(
            "A huge whirlpool\nswallows "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_HydroVortex,
    },
    [MOVE_BLOOM_DOOM] =
    {
        .name = COMPOUND_STRING("Bloom Doom"),
        .description = COMPOUND_STRING(
            "Uses plant energy\nto attack "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_BloomDoom,
    },
    [MOVE_GIGAVOLT_HAVOC] =
    {
        .name = COMPOUND_STRING("Gigavolt Havoc"),
        .description = COMPOUND_STRING(
            "Hits the foe with\npowerful "
            "\nelectricity. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GigavoltHavoc,
    },
    [MOVE_SHATTERED_PSYCHE] =
    {
        .name = COMPOUND_STRING("Shattered Psyche"),
        .description = COMPOUND_STRING(
            "Controls the\ntarget to "
            "hurt it.\nPower varies."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_ShatteredPsyche,
    },
    [MOVE_SUBZERO_SLAMMER] =
    {
        .name = COMPOUND_STRING("Subzero Slammer"),
        .description = COMPOUND_STRING(
            "Drops the temp and\nfreezes "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_SubzeroSlammer,
    },
    [MOVE_DEVASTATING_DRAKE] =
    {
        .name = COMPOUND_STRING("Devastating Drake"),
        .description = COMPOUND_STRING(
            "Develops aura and\nattacks "
            "the\ntarget. Power\nvaries."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_DRAGON,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_DevastatingDrake,
    },
    [MOVE_BLACK_HOLE_ECLIPSE] =
    {
        .name = COMPOUND_STRING("Black Hole Eclipse"),
        .description = COMPOUND_STRING(
            "Sucks the target\ninto dark "
            "energy.\nPower varies."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_BlackHoleEclipse,
    },
    [MOVE_TWINKLE_TACKLE] =
    {
        .name = COMPOUND_STRING("Twinkle Tackle"),
        .description = COMPOUND_STRING(
            "Toys with the\ntarget in a "
            "\ncharming space.\nPower varies."),
        .effect = EFFECT_HIT,
        .power = 1,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_TwinkleTackle,
    },
    [MOVE_CATASTROPIKA] =
    {
        .name = COMPOUND_STRING("Catastropika"),
        .description = COMPOUND_STRING(
            "Pikachu uses the\nmax amount "
            "of\nelectricity and\npounces."),
        .effect = EFFECT_HIT,
        .power = 210,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_Catastropika,
    },
    [MOVE_10000000_VOLT_THUNDERBOLT] =
    {
        .name = COMPOUND_STRING("10,000,000 Volt Thunderbolt"),
        .description = COMPOUND_STRING(
            "Cap Pikachu\nunleashes jolt. "
            "\nHigh critical-hit\nratio."),
        .effect = EFFECT_HIT,
        .power = 195,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .criticalHitStage = 2,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .battleAnimScript = gBattleAnimMove_10000000VoltThunderbolt,
    },
    [MOVE_STOKED_SPARKSURFER] =
    {
        .name = COMPOUND_STRING("Stoked Sparksurfer"),
        .description = COMPOUND_STRING(
            "Alolan Raichu\nattacks with "
            "full\nforce. Causes\nparalysis."),
        .effect = EFFECT_HIT,
        .power = 175,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYSIS,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_StokedSparksurfer,
    },
    [MOVE_EXTREME_EVOBOOST] =
    {
        .name = COMPOUND_STRING("Extreme Evoboost"),
        .description = COMPOUND_STRING(
            "Eevee gets energy\nfrom "
            "its friends.\nBoosts stats."),
        .effect = EFFECT_EXTREME_EVOBOOST,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_USER,
        .priority = 0,
        .category = DAMAGE_CATEGORY_STATUS,
        .battleAnimScript = gBattleAnimMove_ExtremeEvoboost,
    },
    [MOVE_PULVERIZING_PANCAKE] =
    {
        .name = COMPOUND_STRING("Pulverizing Pancake"),
        .description = COMPOUND_STRING(
            "Snorlax\nenergetically\nmoves "
            "and attacks\nwith full force."),
        .effect = EFFECT_HIT,
        .power = 210,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_PulverizingPancake,
    },
    [MOVE_GENESIS_SUPERNOVA] =
    {
        .name = COMPOUND_STRING("Genesis Supernova"),
        .description = COMPOUND_STRING(
            "Mew attacks with\nfull force. "
            "\nPsychically\ncharges terrain."),
        .effect = EFFECT_HIT,
        .power = 185,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .battleAnimScript = gBattleAnimMove_GenesisSupernova,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PSYCHIC_TERRAIN,
            .chance = 100,
        }),
    },
    [MOVE_SINISTER_ARROW_RAID] =
    {
        .name = COMPOUND_STRING("Sinister Arrow Raid"),
        .description = COMPOUND_STRING(
            "Decidueye shoots\ncountless "
            "arrows\nwith full force."),
        .effect = EFFECT_HIT,
        .power = 180,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_SinisterArrowRaid,
    },
    [MOVE_MALICIOUS_MOONSAULT] =
    {
        .name = COMPOUND_STRING("Malicious Moonsault"),
        .description = COMPOUND_STRING(
            "Incineroar crashes\ninto "
            "the target\nwith full force."),
        .effect = EFFECT_HIT,
        .power = 180,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .minimizeDoubleDamage = TRUE,
        .battleAnimScript = gBattleAnimMove_MaliciousMoonsault,
    },
    [MOVE_OCEANIC_OPERETTA] =
    {
        .name = COMPOUND_STRING("Oceanic Operetta"),
        .description = COMPOUND_STRING(
            "Primarina summons\na massive "
            "amount\nof water at the\nfoe."),
        .effect = EFFECT_HIT,
        .power = 195,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .battleAnimScript = gBattleAnimMove_OceanicOperetta,
    },
    [MOVE_SPLINTERED_STORMSHARDS] =
    {
        .name = COMPOUND_STRING("Splintered Stormshards"),
        .description = COMPOUND_STRING(
            "Lycanroc attacks\nwith full "
            "force.\nRemoves all\nterrain."),
        .effect = EFFECT_ICE_SPINNER,
        .power = 190,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_SplinteredStormshards,
    },
    [MOVE_LETS_SNUGGLE_FOREVER] =
    {
        .name = COMPOUND_STRING("Let's Snuggle Forever"),
        .description = COMPOUND_STRING(
            "Mimikyu punches\nthe target "
            "with\nfull force."),
        .effect = EFFECT_HIT,
        .power = 190,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_LetsSnuggleForever,
    },
    [MOVE_CLANGOROUS_SOULBLAZE] =
    {
        .name = COMPOUND_STRING("Clangorous Soulblaze"),
        .description = COMPOUND_STRING(
            "Kommo-o attacks\nwith full "
            "force.\nBoosts all stats."),
        .effect = EFFECT_HIT,
        .power = 185,
        .type = TYPE_DRAGON,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_BOTH,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .soundMove = TRUE,
        .ignoresSubstitute = B_UPDATED_MOVE_FLAGS >= GEN_6,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ALL_STATS_UP,
            .self = TRUE,
            .chance = 100,
        }),
        .battleAnimScript = gBattleAnimMove_ClangorousSoulblaze,
    },
    [MOVE_GUARDIAN_OF_ALOLA] =
    {
        .name = COMPOUND_STRING("Guardian of Alola"),
        .description = COMPOUND_STRING(
            "The Land Spirit\nPokémon "
            "greatly\nreduces the foe's\nHP."),
        .effect = EFFECT_FIXED_PERCENT_DAMAGE,
        .power = 1,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .argument = { .damagePercentage = 75 },
        .battleAnimScript = gBattleAnimMove_GuardianOfAlola,
    },
    [MOVE_SEARING_SUNRAZE_SMASH] =
    {
        .name = COMPOUND_STRING("Searing Sunraze Smash"),
        .description = COMPOUND_STRING(
            "Solgaleo attacks\nwith full "
            "force.\nIgnores abilities."),
        .effect = EFFECT_HIT,
        .power = 200,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresTargetAbility = TRUE,
        .battleAnimScript = gBattleAnimMove_SearingSunrazeSmash,
    },
    [MOVE_MENACING_MOONRAZE_MAELSTROM] =
    {
        .name = COMPOUND_STRING("Menacing Moonraze Maelstrom"),
        .description = COMPOUND_STRING(
            "Lunala attacks\nwith full "
            "force.\nIgnores abilities."),
        .effect = EFFECT_HIT,
        .power = 200,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresTargetAbility = TRUE,
        .battleAnimScript = gBattleAnimMove_MenacingMoonrazeMaelstrom,
    },
    [MOVE_LIGHT_THAT_BURNS_THE_SKY] =
    {
        .name = COMPOUND_STRING("Light That Burns the Sky"),
        .description = COMPOUND_STRING(
            "Uses Necrozma's\nhighest "
            "attack.\nIgnores abilities."),
        .effect = EFFECT_PHOTON_GEYSER,
        .power = 200,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_SPECIAL,
        .ignoresTargetAbility = TRUE,
        .battleAnimScript = gBattleAnimMove_LightThatBurnsTheSky,
    },
    [MOVE_SOUL_STEALING_7_STAR_STRIKE] =
    {
        .name = COMPOUND_STRING("Soul-Stealing 7-Star Strike"),
        .description = COMPOUND_STRING(
            "Marshadow punches\nand "
            "kicks with\nfull force."),
        .effect = EFFECT_HIT,
        .power = 195,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 1,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_SoulStealing7StarStrike,
    },

    [MOVE_MAX_GUARD] =
    {
        .name = COMPOUND_STRING("Max Guard"),
        .description = sProtectDescription,
        .effect = EFFECT_PROTECT,
        .power = 0,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_USER,
        .priority = 4,
        .category = DAMAGE_CATEGORY_STATUS,
        .argument = { .protectMethod = PROTECT_MAX_GUARD },
        .battleAnimScript = gBattleAnimMove_MaxGuard,
    },

    [MOVE_MAX_FLARE] =
    {
        .name = COMPOUND_STRING("Max Flare"),
        .description = COMPOUND_STRING(
            "Fire Dynamax\nattack. "
            "\nIntensifies sun\nfor 5 turns."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_FIRE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxFlare,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SUN,
        }),
    },

    [MOVE_MAX_FLUTTERBY] =
    {
        .name = COMPOUND_STRING("Max Flutterby"),
        .description = COMPOUND_STRING(
            "Bug Dynamax\nattack. "
            "Lowers\nfoe's Sp. Atk\nstat."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxFlutterby,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LOWER_SP_ATK_SIDE,
        }),
    },

    [MOVE_MAX_LIGHTNING] =
    {
        .name = COMPOUND_STRING("Max Lightning"),
        .description = COMPOUND_STRING(
            "Electric Dynamax\nattack. "
            "Turns the\nterrain electric."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxLightning,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_ELECTRIC_TERRAIN,
        }),
    },

    [MOVE_MAX_STRIKE] =
    {
        .name = COMPOUND_STRING("Max Strike"),
        .description = COMPOUND_STRING(
            "Normal Dynamax\nattack. "
            "Lowers\nfoe's Speed stat."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxStrike,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LOWER_SPEED_SIDE,
        }),
    },

    [MOVE_MAX_KNUCKLE] =
    {
        .name = COMPOUND_STRING("Max Knuckle"),
        .description = COMPOUND_STRING(
            "Fighting Dynamax\nattack. "
            "Boosts\nally Attack stats."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxKnuckle,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RAISE_TEAM_ATTACK,
        }),
    },

    [MOVE_MAX_PHANTASM] =
    {
        .name = COMPOUND_STRING("Max Phantasm"),
        .description = COMPOUND_STRING(
            "Ghost Dynamax\nattack. "
            "Lowers\nfoe's Defense\nstat."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxPhantasm,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LOWER_DEFENSE_SIDE,
        }),
    },

    [MOVE_MAX_HAILSTORM] =
    {
        .name = COMPOUND_STRING("Max Hailstorm"),
        .description = COMPOUND_STRING(
            "Ice Dynamax\nattack. "
            "Summons\nhail for 5 turns."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxHailstorm,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_HAIL,
        }),
    },

    [MOVE_MAX_OOZE] =
    {
        .name = COMPOUND_STRING("Max Ooze"),
        .description = COMPOUND_STRING(
            "Poison Dynamax\nattack. "
            "Boosts\nally Sp. Atk\nstats."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxOoze,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RAISE_TEAM_SP_ATK,
        }),
    },

    [MOVE_MAX_GEYSER] =
    {
        .name = COMPOUND_STRING("Max Geyser"),
        .description = COMPOUND_STRING(
            "Water Dynamax\nattack. "
            "Summons\nrain for 5 turns."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxGeyser,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RAIN,
        }),
    },

    [MOVE_MAX_AIRSTREAM] =
    {
        .name = COMPOUND_STRING("Max Airstream"),
        .description = COMPOUND_STRING(
            "Flying Dynamax\nattack. "
            "Boosts\nally Speed stats."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxAirstream,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RAISE_TEAM_SPEED,
        }),
    },

    [MOVE_MAX_STARFALL] =
    {
        .name = COMPOUND_STRING("Max Starfall"),
        .description = COMPOUND_STRING(
            "Fairy Dynamax\nattack. "
            "Turns the\nterrain misty."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxStarfall,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_MISTY_TERRAIN,
        }),
    },

    [MOVE_MAX_WYRMWIND] =
    {
        .name = COMPOUND_STRING("Max Wyrmwind"),
        .description = COMPOUND_STRING(
            "Dragon Dynamax\nattack. "
            "Lowers\nfoe's Attack stat."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_DRAGON,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxWyrmwind,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LOWER_ATTACK_SIDE,
        }),
    },

    [MOVE_MAX_MINDSTORM] =
    {
        .name = COMPOUND_STRING("Max Mindstorm"),
        .description = COMPOUND_STRING(
            "Psychic Dynamax\nattack. "
            "Turns the\nterrain psychic."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxMindstorm,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PSYCHIC_TERRAIN,
        }),
    },

    [MOVE_MAX_ROCKFALL] =
    {
        .name = COMPOUND_STRING("Max Rockfall"),
        .description = COMPOUND_STRING(
            "Rock Dynamax\nattack. "
            "Summons a\nsandstorm."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxRockfall,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SANDSTORM,
        }),
    },

    [MOVE_MAX_QUAKE] =
    {
        .name = COMPOUND_STRING("Max Quake"),
        .description = COMPOUND_STRING(
            "Ground Dynamax\nattack. "
            "Boosts\nally Sp. Def\nstats."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_GROUND,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .skyBattleBanned = B_EXTRAPOLATED_MOVE_FLAGS,
        .battleAnimScript = gBattleAnimMove_MaxQuake,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RAISE_TEAM_SP_DEF,
        }),
    },

    [MOVE_MAX_DARKNESS] =
    {
        .name = COMPOUND_STRING("Max Darkness"),
        .description = COMPOUND_STRING(
            "Dark Dynamax\nattack. "
            "Lowers\nfoe's Sp. Def\nstat."),
        .effect = EFFECT_MAX_MOVE,
        .power = 1,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxDarkness,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LOWER_SP_DEF_SIDE,
        }),
    },

    [MOVE_MAX_OVERGROWTH] =
    {
        .name = COMPOUND_STRING("Max Overgrowth"),
        .description = COMPOUND_STRING(
            "Grass Dynamax\nattack. "
            "Turns the\nterrain grassy."),
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxOvergrowth,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_GRASSY_TERRAIN,
        }),
    },

    [MOVE_MAX_STEELSPIKE] =
    {
        .name = COMPOUND_STRING("Max Steelspike"),
        .description = COMPOUND_STRING(
            "Steel Dynamax\nattack. "
            "Boosts\nally Defense\nstats."),
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_MaxSteelspike,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RAISE_TEAM_DEFENSE,
        }),
    },

    [MOVE_G_MAX_VINE_LASH] =
    {
        .name = COMPOUND_STRING("G-Max Vine Lash"),
        .description = COMPOUND_STRING(
            "G-max Venusaur\nattack. "
            "Damages\nfor 4 turns."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxVineLash,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_VINE_LASH,
        }),
    },

    [MOVE_G_MAX_WILDFIRE] =
    {
        .name = COMPOUND_STRING("G-Max Wildfire"),
        .description = COMPOUND_STRING(
            "G-max Charizard\nattack. "
            "Damages\nfor 4 turns."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_FIRE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxWildfire,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_WILDFIRE,
        }),
    },

    [MOVE_G_MAX_CANNONADE] =
    {
        .name = COMPOUND_STRING("G-Max Cannonade"),
        .description = COMPOUND_STRING(
            "G-max Blastoise\nattack. "
            "Damages\nfor 4 turns."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxCannonade,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CANNONADE,
        }),
    },

    [MOVE_G_MAX_BEFUDDLE] =
    {
        .name = COMPOUND_STRING("G-Max Befuddle"),
        .description = COMPOUND_STRING(
            "G-max Butterfree\nattack. "
            "Poison,\nparalysis, or\nsleep."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_BUG,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxBefuddle,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_EFFECT_SPORE_SIDE,
        }),
    },

    [MOVE_G_MAX_VOLT_CRASH] =
    {
        .name = COMPOUND_STRING("G-Max Volt Crash"),
        .description = COMPOUND_STRING(
            "G-max Pikachu\nattack. "
            "Paralyzes\nopponents."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxVoltCrash,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PARALYZE_SIDE,
        }),
    },

    [MOVE_G_MAX_GOLD_RUSH] =
    {
        .name = COMPOUND_STRING("G-Max Gold Rush"),
        .description = COMPOUND_STRING(
            "G-max Meowth\nattack. "
            "Confuses\nand earns money."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxGoldRush,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSE_PAY_DAY_SIDE,
        }),
    },

    [MOVE_G_MAX_CHI_STRIKE] =
    {
        .name = COMPOUND_STRING("G-Max Chi Strike"),
        .description = COMPOUND_STRING(
            "G-max Machamp\nattack. "
            "Boosts\ncritical-hit\nratio."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_FIGHTING,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxChiStrike,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CRIT_PLUS_SIDE,
        }),
    },

    [MOVE_G_MAX_TERROR] =
    {
        .name = COMPOUND_STRING("G-Max Terror"),
        .description = COMPOUND_STRING(
            "G-max Gengar\nattack. "
            "Prevents\nfoes from\nescaping."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_GHOST,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxTerror,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_PREVENT_ESCAPE_SIDE,
        }),
    },

    [MOVE_G_MAX_FOAM_BURST] =
    {
        .name = COMPOUND_STRING("G-Max Foam Burst"),
        .description = COMPOUND_STRING(
            "G-max Kingler\nattack. "
            "Harshly\nlowers foe's\nSpeed."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxFoamBurst,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LOWER_SPEED_2_SIDE,
        }),
    },

    [MOVE_G_MAX_RESONANCE] =
    {
        .name = COMPOUND_STRING("G-Max Resonance"),
        .description = COMPOUND_STRING(
            "G-max Lapras\nattack. "
            "Reduces\ndamage for 5\nturns."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_ICE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxResonance,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_AURORA_VEIL,
        }),
    },

    [MOVE_G_MAX_CUDDLE] =
    {
        .name = COMPOUND_STRING("G-Max Cuddle"),
        .description = COMPOUND_STRING(
            "G-max Eevee\nattack. "
            "Infatuates\nopponents."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxCuddle,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_INFATUATE_SIDE,
        }),
    },

    [MOVE_G_MAX_REPLENISH] =
    {
        .name = COMPOUND_STRING("G-Max Replenish"),
        .description = COMPOUND_STRING(
            "G-max Snorlax\nattack. "
            "Restores\neaten Berries."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_NORMAL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxReplenish,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_RECYCLE_BERRIES,
        }),
    },

    [MOVE_G_MAX_MALODOR] =
    {
        .name = COMPOUND_STRING("G-Max Malodor"),
        .description = COMPOUND_STRING(
            "G-max Garbodor\nattack. "
            "Poisons\nopponents."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_POISON,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxMalodor,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON_SIDE,
        }),
    },

    [MOVE_G_MAX_MELTDOWN] =
    {
        .name = COMPOUND_STRING("G-Max Meltdown"),
        .description = COMPOUND_STRING(
            "G-max Melmetal\nattack. "
            "Prevents\nrepeat move use."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxMeltdown,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_TORMENT_SIDE,
        }),
    },

    [MOVE_G_MAX_DRUM_SOLO] =
    {
        .name = COMPOUND_STRING("G-Max Drum Solo"),
        .description = COMPOUND_STRING(
            "G-max Rillaboom\nattack. "
            "Ignores\ntarget's\nabilities."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresTargetAbility = TRUE,
        .battleAnimScript = gBattleAnimMove_GMaxDrumSolo,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FIXED_POWER,
        }),
    },

    [MOVE_G_MAX_FIREBALL] =
    {
        .name = COMPOUND_STRING("G-Max Fireball"),
        .description = COMPOUND_STRING(
            "G-max Cinderace\nattack. "
            "Ignores\ntarget's\nabilities."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_FIRE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresTargetAbility = TRUE,
        .battleAnimScript = gBattleAnimMove_GMaxFireball,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FIXED_POWER,
        }),
    },

    [MOVE_G_MAX_HYDROSNIPE] =
    {
        .name = COMPOUND_STRING("G-Max Hydrosnipe"),
        .description = COMPOUND_STRING(
            "G-max Inteleon\nattack. "
            "Ignores\ntarget's\nabilities."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresTargetAbility = TRUE,
        .battleAnimScript = gBattleAnimMove_GMaxHydrosnipe,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FIXED_POWER,
        }),
    },

    [MOVE_G_MAX_WIND_RAGE] =
    {
        .name = COMPOUND_STRING("G-Max Wind Rage"),
        .description = COMPOUND_STRING(
            "G-max Corviknight\nattack. "
            "Removes\nopponent screens."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_FLYING,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxWindRage,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_DEFOG,
        }),
    },

    [MOVE_G_MAX_GRAVITAS] =
    {
        .name = COMPOUND_STRING("G-Max Gravitas"),
        .description = COMPOUND_STRING(
            "G-max Orbeetle\nattack. "
            "Changes\ngravity for 5\nturns."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_PSYCHIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxGravitas,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_GRAVITY,
        }),
    },

    [MOVE_G_MAX_STONESURGE] =
    {
        .name = COMPOUND_STRING("G-Max Stonesurge"),
        .description = COMPOUND_STRING(
            "G-max Drednaw\nattack. "
            "Scatters\nsharp rocks."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxStonesurge,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_STEALTH_ROCK,
        }),
    },

    [MOVE_G_MAX_VOLCALITH] =
    {
        .name = COMPOUND_STRING("G-Max Volcalith"),
        .description = COMPOUND_STRING(
            "G-max Coalossal\nattack. "
            "Damages\nfor 4 turns."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_ROCK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxVolcalith,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_VOLCALITH,
        }),
    },

    [MOVE_G_MAX_TARTNESS] =
    {
        .name = COMPOUND_STRING("G-Max Tartness"),
        .description = COMPOUND_STRING(
            "G-max Flapple\nattack. "
            "Lowers\nfoe's evasiveness."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxTartness,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_LOWER_EVASIVENESS_SIDE,
        }),
    },

    [MOVE_G_MAX_SWEETNESS] =
    {
        .name = COMPOUND_STRING("G-Max Sweetness"),
        .description = COMPOUND_STRING(
            "G-max Appletun\nattack. "
            "Heals ally\nstatus conditions."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_GRASS,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxSweetness,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_AROMATHERAPY,
        }),
    },

    [MOVE_G_MAX_SANDBLAST] =
    {
        .name = COMPOUND_STRING("G-Max Sandblast"),
        .description = COMPOUND_STRING(
            "G-max Sandaconda\nattack. "
            "Traps foes\nin a sandstorm."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_GROUND,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxSandblast,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SANDBLAST_SIDE,
        }),
    },

    [MOVE_G_MAX_STUN_SHOCK] =
    {
        .name = COMPOUND_STRING("G-Max Stun Shock"),
        .description = COMPOUND_STRING(
            "G-max Toxtricity\nattack. "
            "Poisons or\nparalyzes foes."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_ELECTRIC,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxStunShock,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_POISON_PARALYZE_SIDE,
        }),
    },

    [MOVE_G_MAX_CENTIFERNO] =
    {
        .name = COMPOUND_STRING("G-Max Centiferno"),
        .description = COMPOUND_STRING(
            "G-max Toxtricity\nattack. "
            "Traps foes\nin flames."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_FIRE,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxCentiferno,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_FIRE_SPIN_SIDE,
        }),
    },

    [MOVE_G_MAX_SMITE] =
    {
        .name = COMPOUND_STRING("G-Max Smite"),
        .description = COMPOUND_STRING(
            "G-max Hatterene\nattack. "
            "Confuses\nopponents."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxSmite,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_CONFUSE_SIDE,
        }),
    },


    [MOVE_G_MAX_SNOOZE] =
    {
        .name = COMPOUND_STRING("G-Max Snooze"),
        .description = COMPOUND_STRING(
            "G-max Grimmsnarl\nattack. "
            "Lulls foes\ninto sleep."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxSnooze,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_YAWN_FOE,
        }),
    },

    [MOVE_G_MAX_FINALE] =
    {
        .name = COMPOUND_STRING("G-Max Finale"),
        .description = COMPOUND_STRING(
            "G-max Alcremie\nattack. "
            "Heals ally\nHP."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_FAIRY,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxFinale,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_HEAL_TEAM,
        }),
    },

    [MOVE_G_MAX_STEELSURGE] =
    {
        .name = COMPOUND_STRING("G-Max Steelsurge"),
        .description = COMPOUND_STRING(
            "G-max Copperajah\nattack. "
            "Scatters\nsharp spikes."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_STEEL,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxSteelsurge,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_STEELSURGE,
        }),
    },

    [MOVE_G_MAX_DEPLETION] =
    {
        .name = COMPOUND_STRING("G-Max Depletion"),
        .description = COMPOUND_STRING(
            "G-max Duraludon\nattack. "
            "Reduces\ntarget's PP."),    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_DRAGON,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .battleAnimScript = gBattleAnimMove_GMaxDepletion,
        .additionalEffects = ADDITIONAL_EFFECTS({
            .moveEffect = MOVE_EFFECT_SPITE,
        }),
    },

    [MOVE_G_MAX_ONE_BLOW] =
    {
        .name = COMPOUND_STRING("G-Max One Blow"),
        .description = sGMaxOneBlowDescription,    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_DARK,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresProtect = TRUE,
        .battleAnimScript = gBattleAnimMove_GMaxOneBlow,
    },

    [MOVE_G_MAX_RAPID_FLOW] =
    {
        .name = COMPOUND_STRING("G-Max Rapid Flow"),
        .description = sGMaxOneBlowDescription,    //ANIM TODO
        .effect = EFFECT_MAX_MOVE,
        .power = 10,
        .type = TYPE_WATER,
        .accuracy = 0,
        .pp = 10,
        .target = TARGET_SELECTED,
        .priority = 0,
        .category = DAMAGE_CATEGORY_PHYSICAL,
        .ignoresProtect = TRUE,
        .battleAnimScript = gBattleAnimMove_GMaxRapidFlow,
    },
};
