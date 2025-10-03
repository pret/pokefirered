#include "global.h"
#include "test/battle.h"
#include "battle_ai_util.h"

AI_SINGLE_BATTLE_TEST("AI will not further increase Attack / Sp. Atk stat if it knows it faints to target: AI faster")
{
    u16 move;

    PARAMETRIZE { move = MOVE_HOWL; }
    PARAMETRIZE { move = MOVE_CALM_MIND; }

    GIVEN {
        ASSUME(GetMovePower(MOVE_SKY_UPPERCUT) == 85);
        ASSUME(GetMoveEffect(MOVE_HOWL) == EFFECT_ATTACK_UP
            || GetMoveEffect(MOVE_HOWL) == EFFECT_ATTACK_UP_USER_ALLY);
        ASSUME(GetMoveEffect(MOVE_CALM_MIND) == EFFECT_CALM_MIND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_COMBUSKEN) { Speed(15); Moves(MOVE_SKY_UPPERCUT, MOVE_CELEBRATE); };
        OPPONENT(SPECIES_KANGASKHAN) { Speed(20); Moves(MOVE_CHIP_AWAY, MOVE_SWIFT, move); }
    } WHEN {
        TURN { MOVE(player, MOVE_SKY_UPPERCUT); EXPECT_MOVE(opponent, move); }
        TURN { EXPECT_MOVE(opponent, MOVE_CHIP_AWAY); MOVE(player, MOVE_SKY_UPPERCUT); }
    }
}

AI_SINGLE_BATTLE_TEST("AI will not further increase Attack / Sp. Atk stat if it knows it faints to target: AI slower")
{
    u16 move;

    PARAMETRIZE { move = MOVE_HOWL; }
    PARAMETRIZE { move = MOVE_CALM_MIND; }

    GIVEN {
        ASSUME(GetMovePower(MOVE_SKY_UPPERCUT) == 85);
        ASSUME(GetMoveEffect(MOVE_HOWL) == EFFECT_ATTACK_UP
            || GetMoveEffect(MOVE_HOWL) == EFFECT_ATTACK_UP_USER_ALLY);
        ASSUME(GetMoveEffect(MOVE_CALM_MIND) == EFFECT_CALM_MIND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_COMBUSKEN) { Speed(20); Moves(MOVE_DOUBLE_KICK, MOVE_CELEBRATE); };
        OPPONENT(SPECIES_KANGASKHAN) { Speed(15); Moves(MOVE_CHIP_AWAY, MOVE_SWIFT, move); }
    } WHEN {
        TURN { MOVE(player, MOVE_DOUBLE_KICK); EXPECT_MOVE(opponent, move); }
        TURN { EXPECT_MOVE(opponent, MOVE_CHIP_AWAY); MOVE(player, MOVE_DOUBLE_KICK); }
    }
}

AI_SINGLE_BATTLE_TEST("AI will increase speed if it is slower")
{
    GIVEN {
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_COMBUSKEN) { Speed(20); Moves(MOVE_DOUBLE_KICK, MOVE_CELEBRATE); };
        OPPONENT(SPECIES_KANGASKHAN) { Speed(15); Moves(MOVE_CHIP_AWAY, MOVE_AGILITY); }
    } WHEN {
        TURN { MOVE(player, MOVE_DOUBLE_KICK); EXPECT_MOVE(opponent, MOVE_AGILITY); }
        TURN { EXPECT_MOVE(opponent, MOVE_CHIP_AWAY); MOVE(player, MOVE_DOUBLE_KICK); }
    }
}

AI_SINGLE_BATTLE_TEST("AI will not waste a turn setting up if it knows target can faint it")
{
    u16 move;

    PARAMETRIZE { move = MOVE_HOWL; }
    PARAMETRIZE { move = MOVE_CALM_MIND; }

    GIVEN {
        ASSUME(GetMovePower(MOVE_SKY_UPPERCUT) == 85);
        ASSUME(GetMoveEffect(MOVE_HOWL) == EFFECT_ATTACK_UP
            || GetMoveEffect(MOVE_HOWL) == EFFECT_ATTACK_UP_USER_ALLY);
        ASSUME(GetMoveEffect(MOVE_CALM_MIND) == EFFECT_CALM_MIND);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT | AI_FLAG_OMNISCIENT);
        PLAYER(SPECIES_COMBUSKEN) { Speed(15); Moves(MOVE_SKY_UPPERCUT, MOVE_DOUBLE_KICK, MOVE_FLAME_WHEEL, MOVE_CELEBRATE); };
        OPPONENT(SPECIES_KANGASKHAN) { Speed(20); Moves(MOVE_CHIP_AWAY, MOVE_SWIFT, move); }
    } WHEN {
        TURN { MOVE(player, MOVE_DOUBLE_KICK); EXPECT_MOVE(opponent, move); }
        TURN { EXPECT_MOVE(opponent, MOVE_CHIP_AWAY); MOVE(player, MOVE_SKY_UPPERCUT); }
    }
}

AI_SINGLE_BATTLE_TEST("AI will not use Throat Chop if opposing mon has a better move")
{
    GIVEN {
        ASSUME(GetMovePower(MOVE_PSYCHIC_FANGS) == 85);
        ASSUME(GetMovePower(MOVE_THROAT_CHOP) == 80);
        ASSUME(GetMovePower(MOVE_DISARMING_VOICE) == 40);
        ASSUME(GetMovePower(MOVE_FLAME_BURST) == 70);
        ASSUME(MoveHasAdditionalEffect(MOVE_THROAT_CHOP, MOVE_EFFECT_THROAT_CHOP) == TRUE);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_REGIROCK) { Speed(15); Moves(MOVE_DISARMING_VOICE, MOVE_FLAME_BURST); };
        OPPONENT(SPECIES_WOBBUFFET) { Speed(20); Moves(MOVE_THROAT_CHOP, MOVE_PSYCHIC_FANGS); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_PSYCHIC_FANGS); MOVE(player, MOVE_FLAME_BURST); }
        TURN { EXPECT_MOVE(opponent, MOVE_PSYCHIC_FANGS); MOVE(player, MOVE_DISARMING_VOICE); }
        TURN { EXPECT_MOVE(opponent, MOVE_PSYCHIC_FANGS); MOVE(player, MOVE_FLAME_BURST);}
    }
}

AI_SINGLE_BATTLE_TEST("AI will select Throat Chop if the sound move is the best damaging move from opposing mon")
{
    GIVEN {
        ASSUME(MoveHasAdditionalEffect(MOVE_THROAT_CHOP, MOVE_EFFECT_THROAT_CHOP) == TRUE);
        ASSUME(GetMovePower(MOVE_PSYCHIC_FANGS) == 85);
        ASSUME(GetMovePower(MOVE_THROAT_CHOP) == 80);
        ASSUME(GetMovePower(MOVE_FLAME_BURST) == 70);
        ASSUME(GetMovePower(MOVE_HYPER_VOICE) == 90);
        AI_FLAGS(AI_FLAG_CHECK_BAD_MOVE | AI_FLAG_CHECK_VIABILITY | AI_FLAG_TRY_TO_FAINT);
        PLAYER(SPECIES_REGIROCK) { Speed(15); Moves(MOVE_HYPER_VOICE, MOVE_FLAME_BURST); };
        OPPONENT(SPECIES_WOBBUFFET) { Speed(20); Moves(MOVE_THROAT_CHOP, MOVE_PSYCHIC_FANGS); }
    } WHEN {
        TURN { EXPECT_MOVE(opponent, MOVE_PSYCHIC_FANGS); MOVE(player, MOVE_FLAME_BURST); }
        TURN { EXPECT_MOVE(opponent, MOVE_PSYCHIC_FANGS); MOVE(player, MOVE_HYPER_VOICE); }
        TURN { EXPECT_MOVE(opponent, MOVE_THROAT_CHOP); MOVE(player, MOVE_HYPER_VOICE);}
    }
}
