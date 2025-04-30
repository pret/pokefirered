#include "global.h"
#include "test/battle.h"

ASSUMPTIONS
{
    ASSUME(GetMoveEffect(MOVE_MAGIC_ROOM) == EFFECT_MAGIC_ROOM);
}

DOUBLE_BATTLE_TEST("Magic Room prevents item hold effects")
{
    GIVEN {
        ASSUME(gItemsInfo[ITEM_BERRY_JUICE].holdEffect == HOLD_EFFECT_RESTORE_HP);
        ASSUME(GetMoveEffect(MOVE_DRAGON_RAGE) == EFFECT_FIXED_DAMAGE_ARG);
        ASSUME(GetMoveFixedDamage(MOVE_DRAGON_RAGE) == 40);

        PLAYER(SPECIES_WOBBUFFET) { MaxHP(100); HP(60); Item(ITEM_BERRY_JUICE); }
        PLAYER(SPECIES_WOBBUFFET) { MaxHP(100); HP(60); Item(ITEM_BERRY_JUICE); }
        OPPONENT(SPECIES_WOBBUFFET) { MaxHP(100); HP(60); Item(ITEM_BERRY_JUICE); }
        OPPONENT(SPECIES_WOBBUFFET) { MaxHP(100); HP(60); Item(ITEM_BERRY_JUICE); }
    } WHEN {
        TURN { MOVE(playerLeft, MOVE_MAGIC_ROOM); }
        TURN {
            MOVE(playerLeft, MOVE_DRAGON_RAGE, target: opponentLeft);
            MOVE(opponentLeft, MOVE_DRAGON_RAGE, target: playerLeft);
            MOVE(playerRight, MOVE_DRAGON_RAGE, target: opponentRight);
            MOVE(opponentRight, MOVE_DRAGON_RAGE, target: playerRight);
        }
        TURN { MOVE(playerLeft, MOVE_MAGIC_ROOM); }
    } SCENE {
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MAGIC_ROOM, playerLeft);
        ANIMATION(ANIM_TYPE_MOVE, MOVE_MAGIC_ROOM, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, playerLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponentLeft);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, playerRight);
        ANIMATION(ANIM_TYPE_GENERAL, B_ANIM_HELD_ITEM_EFFECT, opponentRight);
    }
}
