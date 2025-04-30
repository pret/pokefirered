#ifndef GUARD_FOLLOWER_NPC_ALTERNATE_SPRITES_H
#define GUARD_FOLLOWER_NPC_ALTERNATE_SPRITES_H

#include "constants/event_objects.h"

// This is where alternate sprites for NPC followers should be listed.
// If the appropriate alternate sprites are not added here, the NPC follower will not use the correct sprites for biking,
// surfing, etc.
// The normalId tells the game what GFX to tie the associated alternate sprites to. This is usually the sprite you would
// give to the object in Porymap.
// For example, Rival May's normalId is OBJ_EVENT_GFX_RIVAL_MAY_NORMAL. All the rest of the sprites in that same block
// will be used with an NPC follower that has that normalId.

static const struct FollowerNPCSpriteGraphics gFollowerNPCAlternateSprites[] =
{
    {
        .normalId = OBJ_EVENT_GFX_RED_NORMAL,
        .machBikeId = OBJ_EVENT_GFX_RED_BIKE,
        .acroBikeId = OBJ_EVENT_GFX_RED_BIKE,
        .surfId = OBJ_EVENT_GFX_RED_SURF,
        .underwaterId = OBJ_EVENT_GFX_RED_SURF,
    },
    {
        .normalId = OBJ_EVENT_GFX_GREEN_NORMAL,
        .machBikeId = OBJ_EVENT_GFX_GREEN_BIKE,
        .acroBikeId = OBJ_EVENT_GFX_GREEN_BIKE,
        .surfId = OBJ_EVENT_GFX_GREEN_SURF,
        .underwaterId = OBJ_EVENT_GFX_GREEN_SURF,
    },

};

#endif // GUARD_FOLLOWER_NPC_ALTERNATE_SPRITES_H
