#ifndef GUARD_MAIL_H
#define GUARD_MAIL_H

#include "global.h"

#define MAIL_WORDS_COUNT 9

#define IS_ITEM_MAIL(itemId)((itemId == ITEM_ORANGE_MAIL            \
                              || itemId == ITEM_HARBOR_MAIL         \
                              || itemId == ITEM_GLITTER_MAIL        \
                              || itemId == ITEM_MECH_MAIL           \
                              || itemId == ITEM_WOOD_MAIL           \
                              || itemId == ITEM_WAVE_MAIL           \
                              || itemId == ITEM_BEAD_MAIL           \
                              || itemId == ITEM_SHADOW_MAIL         \
                              || itemId == ITEM_TROPIC_MAIL         \
                              || itemId == ITEM_DREAM_MAIL          \
                              || itemId == ITEM_FAB_MAIL            \
                              || itemId == ITEM_RETRO_MAIL))

#define FIRST_MAIL_IDX ITEM_ORANGE_MAIL

#define ITEM_TO_MAIL(itemId) (itemId - FIRST_MAIL_IDX)

void ReadMail(struct Mail * mail, void (*savedCallback)(void), bool8 messageExists);

#endif // GUARD_MAIL_H
