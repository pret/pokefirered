// #include "global.h"
// #include "follower_npc.h"
// #include "follower_npc_alternate_sprites.h"
// #include "battle.h"
// #include "battle_setup.h"
// #include "battle_tower.h"
// #include "event_data.h"
// #include "event_object_movement.h"
// #include "event_scripts.h"
// #include "field_door.h"
// #include "field_effect.h"
// #include "field_effect_helpers.h"
// #include "field_player_avatar.h"
// #include "field_control_avatar.h"
// #include "field_screen_effect.h"
// #include "field_weather.h"
// #include "fieldmap.h"
// // #include "fldeff_misc.h"
// // #include "frontier_util.h"
// #include "item.h"
// #include "load_save.h"
// #include "metatile_behavior.h"
// #include "overworld.h"
// #include "party_menu.h"
// #include "script.h"
// #include "script_movement.h"
// #include "script_pokemon_util.h"
// #include "sound.h"
// #include "task.h"
// #include "trig.h"
// #include "constants/event_object_movement.h"
// #include "constants/field_effects.h"
// // #include "constants/frontier_util.h"
// #include "constants/map_types.h"
// #include "constants/metatile_behaviors.h"
// #include "constants/songs.h"

// /*
//  * Known Issues:
//  *     -follower gets messed up if you go into a map with a maximum number of event objects
//  *         -inherits incorrect palette, may get directionally confused
//  */

// // Task data
// #define tState          data[0]
// #define tDoorX          data[2]
// #define tDoorY          data[3]

// static void SetFollowerNPCScriptPointer(const u8 *script);
// static void PlayerLogCoordinates(struct ObjectEvent *player);
// static void TurnNPCIntoFollower(u32 localId, u32 followerFlags, u32 setScript, const u8 *script);
// static u32 GetFollowerNPCSprite(void);
// static bool32 IsStateMovement(u32 state);
// static u32 GetPlayerFaceToDoorDirection(struct ObjectEvent *player, struct ObjectEvent *follower);
// static u32 ReturnFollowerNPCDelayedState(u32 direction);
// static void TryUpdateFollowerNPCSpriteUnderwater(void);
// static void SetSurfJump(void);
// static void SetUpSurfBlobFieldEffect(struct ObjectEvent *npc);
// static void SetSurfDismount(void);
// static void Task_BindSurfBlobToFollowerNPC(u8 taskId);
// static void Task_FinishSurfDismount(u8 taskId);
// static void Task_ReallowPlayerMovement(u8 taskId);
// static void Task_FollowerNPCOutOfDoor(u8 taskId);
// static void Task_FollowerNPCHandleEscalator(u8 taskId);
// static void Task_FollowerNPCHandleEscalatorFinish(u8 taskId);
// static void CalculateFollowerNPCEscalatorTrajectoryUp(struct Task *task);
// static void CalculateFollowerNPCEscalatorTrajectoryDown(struct Task *task);

// void SetFollowerNPCData(enum FollowerNPCDataTypes type, u32 value)
// {
// #if FNPC_ENABLE_NPC_FOLLOWERS
//     switch (type)
//     {
//     case FNPC_DATA_IN_PROGRESS:
//         gSaveBlock3Ptr->NPCfollower.inProgress = value;
//         break;
//     case FNPC_DATA_WARP_END:
//         gSaveBlock3Ptr->NPCfollower.warpEnd = value;
//         break;
//     case FNPC_DATA_SURF_BLOB:
//         gSaveBlock3Ptr->NPCfollower.createSurfBlob = value;
//         break;
//     case FNPC_DATA_COME_OUT_DOOR:
//         gSaveBlock3Ptr->NPCfollower.comeOutDoorStairs = value;
//         break;
//     case FNPC_DATA_OBJ_ID:
//         gSaveBlock3Ptr->NPCfollower.objId = value;
//         break;
//     case FNPC_DATA_CURRENT_SPRITE:
//         gSaveBlock3Ptr->NPCfollower.currentSprite = value;
//         break;
//     case FNPC_DATA_DELAYED_STATE:
//         gSaveBlock3Ptr->NPCfollower.delayedState = value;
//         break;
//     case FNPC_DATA_MAP_ID:
//         gSaveBlock3Ptr->NPCfollower.map.id = value;
//         break;
//     case FNPC_DATA_MAP_NUM:
//         gSaveBlock3Ptr->NPCfollower.map.number = value;
//         break;
//     case FNPC_DATA_MAP_GROUP:
//         gSaveBlock3Ptr->NPCfollower.map.group = value;
//         break;
//     case FNPC_DATA_EVENT_FLAG:
//         gSaveBlock3Ptr->NPCfollower.flag = value;
//         break;
//     case FNPC_DATA_GFX_ID:
//         gSaveBlock3Ptr->NPCfollower.graphicsId = value;
//         break;
//     case FNPC_DATA_FOLLOWER_FLAGS:
//         gSaveBlock3Ptr->NPCfollower.flags = value;
//         break;
//     case FNPC_DATA_BATTLE_PARTNER:
//         gSaveBlock3Ptr->NPCfollower.battlePartner = value;
//         break;
//     }
// #endif
// }

// static void SetFollowerNPCScriptPointer(const u8 *script)
// {
// #if FNPC_ENABLE_NPC_FOLLOWERS
//     gSaveBlock3Ptr->NPCfollower.script = script;
// #endif
// }

// static void PlayerLogCoordinates(struct ObjectEvent *player)
// {
// #if FNPC_ENABLE_NPC_FOLLOWERS
//     gSaveBlock3Ptr->NPCfollower.log.x = player->currentCoords.x;
//     gSaveBlock3Ptr->NPCfollower.log.y = player->currentCoords.y;
// #endif
// }

// const u8 *GetFollowerNPCScriptPointer(void)
// {
// #if FNPC_ENABLE_NPC_FOLLOWERS
//     if (PlayerHasFollowerNPC())
//         return gSaveBlock3Ptr->NPCfollower.script;
        
// #endif
//     return NULL;
// }

// u32 GetFollowerNPCData(enum FollowerNPCDataTypes type)
// {
// #if FNPC_ENABLE_NPC_FOLLOWERS
//     switch (type)
//     {
//     case FNPC_DATA_IN_PROGRESS:
//         return gSaveBlock3Ptr->NPCfollower.inProgress;
//     case FNPC_DATA_WARP_END:
//         return gSaveBlock3Ptr->NPCfollower.warpEnd;
//     case FNPC_DATA_SURF_BLOB:
//         return gSaveBlock3Ptr->NPCfollower.createSurfBlob;
//     case FNPC_DATA_COME_OUT_DOOR:
//         return gSaveBlock3Ptr->NPCfollower.comeOutDoorStairs;
//     case FNPC_DATA_OBJ_ID:
//         return gSaveBlock3Ptr->NPCfollower.objId;
//     case FNPC_DATA_CURRENT_SPRITE:
//         return gSaveBlock3Ptr->NPCfollower.currentSprite;
//     case FNPC_DATA_DELAYED_STATE:
//         return gSaveBlock3Ptr->NPCfollower.delayedState;
//     case FNPC_DATA_MAP_ID:
//         return gSaveBlock3Ptr->NPCfollower.map.id;
//     case FNPC_DATA_MAP_NUM:
//         return gSaveBlock3Ptr->NPCfollower.map.number;
//     case FNPC_DATA_MAP_GROUP:
//         return gSaveBlock3Ptr->NPCfollower.map.group;
//     case FNPC_DATA_EVENT_FLAG:
//         return gSaveBlock3Ptr->NPCfollower.flag;
//     case FNPC_DATA_GFX_ID:
//         return gSaveBlock3Ptr->NPCfollower.graphicsId;
//     case FNPC_DATA_FOLLOWER_FLAGS:
//         return gSaveBlock3Ptr->NPCfollower.flags;
//     case FNPC_DATA_BATTLE_PARTNER:
//         return gSaveBlock3Ptr->NPCfollower.battlePartner;
//     }
// #endif
//     return 0;
// }

// void ClearFollowerNPCData(void)
// {
// #if FNPC_ENABLE_NPC_FOLLOWERS
//     memset(&gSaveBlock3Ptr->NPCfollower, 0, sizeof(gSaveBlock3Ptr->NPCfollower));
// #endif
// }

// static void TurnNPCIntoFollower(u32 localId, u32 followerFlags, u32 setScript, const u8 *ptr)
// {
//     struct ObjectEventTemplate npc;
//     struct ObjectEvent *follower;
//     u32 npcX, npcY;
//     u32 faceDirection;
//     u32 eventObjId;
//     const u8 *script;
//     u32 flag;

//     // Only allow 1 follower NPC at a time.
//     if (PlayerHasFollowerNPC())
//         return;

//     for (eventObjId = 0; eventObjId < OBJECT_EVENTS_COUNT; eventObjId++)
//     {
//         if (!gObjectEvents[eventObjId].active || gObjectEvents[eventObjId].isPlayer)
//             continue;

//         if (gObjectEvents[eventObjId].localId == localId)
//         {
//             flag = GetObjectEventFlagIdByLocalIdAndMap(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
//             // If the object does not have an event flag, don't create follower.
//             if (flag == 0)
//                 return;

//             if (setScript == TRUE)
//                 // Set the custom script.
//                 script = ptr;
//             else
//                 // Use the object's original script.
//                 script = GetObjectEventScriptPointerByObjectEventId(eventObjId);

//             npcX = gObjectEvents[eventObjId].currentCoords.x;
//             npcY = gObjectEvents[eventObjId].currentCoords.y;
//             faceDirection = gObjectEvents[eventObjId].facingDirection;
//             SetFollowerNPCData(FNPC_DATA_MAP_ID, gObjectEvents[eventObjId].localId);
//             RemoveObjectEvent(&gObjectEvents[eventObjId]);
//             FlagSet(flag);

//             npc = *GetObjectEventTemplateByLocalIdAndMap(GetFollowerNPCData(FNPC_DATA_MAP_ID), gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
//             npc.movementType = 0;
//             npc.script = script;
//             npc.localId = OBJ_EVENT_ID_NPC_FOLLOWER;
//             SetFollowerNPCData(FNPC_DATA_OBJ_ID, TrySpawnObjectEventTemplate(&npc, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, npcX, npcY));
//             follower = &gObjectEvents[GetFollowerNPCData(FNPC_DATA_OBJ_ID)];
//             MoveObjectEventToMapCoords(follower, npcX, npcY);
//             ObjectEventTurn(follower, faceDirection);
//             follower->movementType = MOVEMENT_TYPE_NONE;
//             gSprites[follower->spriteId].callback = MovementType_None;

//             SetFollowerNPCData(FNPC_DATA_IN_PROGRESS, TRUE);
//             SetFollowerNPCData(FNPC_DATA_GFX_ID, follower->graphicsId);
//             SetFollowerNPCData(FNPC_DATA_MAP_NUM, gSaveBlock1Ptr->location.mapNum);
//             SetFollowerNPCData(FNPC_DATA_MAP_GROUP, gSaveBlock1Ptr->location.mapGroup);
//             SetFollowerNPCScriptPointer(script);
//             SetFollowerNPCData(FNPC_DATA_EVENT_FLAG, flag);
//             SetFollowerNPCData(FNPC_DATA_FOLLOWER_FLAGS, followerFlags);
//             SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_NONE);
//             SetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR, FNPC_DOOR_NONE);

//             // If the player is biking and the follower flags prohibit biking, force the player to dismount the bike.
//             if (!CheckFollowerNPCFlag(FOLLOWER_NPC_FLAG_CAN_BIKE)
//             &&  TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_BIKE))
//                 SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);

//             // Set the follower sprite to match the player state.
//             if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ON_FOOT))
//                 FollowerNPC_HandleSprite();
//         }
//     }
// }

// static u32 GetFollowerNPCSprite(void)
// {
//     u32 i;

//     switch (GetFollowerNPCData(FNPC_DATA_CURRENT_SPRITE))
//     {
//     case FOLLOWER_NPC_SPRITE_INDEX_MACH_BIKE:
//         for (i = 0; i < NELEMS(gFollowerNPCAlternateSprites); i++)
//             if (gFollowerNPCAlternateSprites[i].normalId == GetFollowerNPCData(FNPC_DATA_GFX_ID))
//                 return gFollowerNPCAlternateSprites[i].machBikeId;
//         break;
//     case FOLLOWER_NPC_SPRITE_INDEX_ACRO_BIKE:
//         for (i = 0; i < NELEMS(gFollowerNPCAlternateSprites); i++)
//             if (gFollowerNPCAlternateSprites[i].normalId == GetFollowerNPCData(FNPC_DATA_GFX_ID))
//                 return gFollowerNPCAlternateSprites[i].acroBikeId;
//         break;
//     case FOLLOWER_NPC_SPRITE_INDEX_SURF:
//         for (i = 0; i < NELEMS(gFollowerNPCAlternateSprites); i++)
//             if (gFollowerNPCAlternateSprites[i].normalId == GetFollowerNPCData(FNPC_DATA_GFX_ID))
//                 return gFollowerNPCAlternateSprites[i].surfId;
//         break;
//     case FOLLOWER_NPC_SPRITE_INDEX_UNDERWATER:
//         for (i = 0; i < NELEMS(gFollowerNPCAlternateSprites); i++)
//             if (gFollowerNPCAlternateSprites[i].normalId == GetFollowerNPCData(FNPC_DATA_GFX_ID))
//                 return gFollowerNPCAlternateSprites[i].underwaterId;
//         break;
//     }

//     return GetFollowerNPCData(FNPC_DATA_GFX_ID);
// }

// static bool32 IsStateMovement(u32 state)
// {
//     switch (state) 
//     {
//     case MOVEMENT_ACTION_FACE_DOWN:
//     case MOVEMENT_ACTION_FACE_UP:
//     case MOVEMENT_ACTION_FACE_LEFT:
//     case MOVEMENT_ACTION_FACE_RIGHT:
//     case MOVEMENT_ACTION_DELAY_1:
//     case MOVEMENT_ACTION_DELAY_2:
//     case MOVEMENT_ACTION_DELAY_4:
//     case MOVEMENT_ACTION_DELAY_8:
//     case MOVEMENT_ACTION_DELAY_16:
//     case MOVEMENT_ACTION_FACE_PLAYER:
//     case MOVEMENT_ACTION_FACE_AWAY_PLAYER:
//     case MOVEMENT_ACTION_LOCK_FACING_DIRECTION:
//     case MOVEMENT_ACTION_UNLOCK_FACING_DIRECTION:
//     case MOVEMENT_ACTION_SET_INVISIBLE:
//     case MOVEMENT_ACTION_SET_VISIBLE:
//     case MOVEMENT_ACTION_EMOTE_EXCLAMATION_MARK:
//     case MOVEMENT_ACTION_EMOTE_QUESTION_MARK:
//     case MOVEMENT_ACTION_EMOTE_HEART:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_DOWN:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_UP:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_LEFT:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_SLOW_RIGHT:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_UP:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_LEFT:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_RIGHT:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_UP:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_LEFT:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_RIGHT:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_DOWN:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_UP:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_LEFT:
//     case MOVEMENT_ACTION_WALK_IN_PLACE_FASTER_RIGHT:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_UP:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN_UP:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT_RIGHT:
//     case MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT_LEFT:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_FACE_UP:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_FACE_RIGHT:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_FACE_LEFT:
//     case MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN:
//     case MOVEMENT_ACTION_ACRO_POP_WHEELIE_UP:
//     case MOVEMENT_ACTION_ACRO_POP_WHEELIE_RIGHT:
//     case MOVEMENT_ACTION_ACRO_POP_WHEELIE_LEFT:
//     case MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN:
//     case MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_UP:
//     case MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_RIGHT:
//     case MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_LEFT:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_UP:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_RIGHT:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_LEFT:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_UP:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_RIGHT:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_LEFT:
//         return FALSE;
//     }

//     return TRUE;
// }

// static u32 GetPlayerFaceToDoorDirection(struct ObjectEvent *player, struct ObjectEvent *follower)
// {
//     s32 delta_x = player->currentCoords.x - follower->currentCoords.x;

//     if (delta_x < 0)
//         return DIR_EAST;
//     else if (delta_x > 0)
//         return DIR_WEST;

//     return DIR_NORTH;
// }

// static u32 ReturnFollowerNPCDelayedState(u32 direction)
// {
//     u32 newState = GetFollowerNPCData(FNPC_DATA_DELAYED_STATE);
//     SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, 0);

//     return newState + direction;
// }

// static void TryUpdateFollowerNPCSpriteUnderwater(void)
// {
//     if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
//     {
//         struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//         SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_UNDERWATER);

//         follower = &gObjectEvents[GetFollowerNPCObjectId()];
//         follower->fieldEffectSpriteId = StartUnderwaterSurfBlobBobbing(follower->spriteId);
//     }
// }

// static void SetSurfJump(void)
// {
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     u32 direction;
//     u32 jumpState;

//     ObjectEventClearHeldMovement(follower);

//     // Jump animation according to direction.
//     direction = DetermineFollowerNPCDirection(&gObjectEvents[gPlayerAvatar.objectEventId], follower);
//     jumpState = GetJumpMovementAction(direction);
//     SetUpSurfBlobFieldEffect(follower);

//     // Adjust surf head spawn location infront of follower.
//     switch (direction) 
//     {
//     case DIR_SOUTH:
//         gFieldEffectArguments[1]++; // effect_y
//         break;
//     case DIR_NORTH:
//         gFieldEffectArguments[1]--;
//         break;
//     case DIR_WEST:
//         gFieldEffectArguments[0]--; // effect_x
//         break;
//     default: // DIR_EAST
//         gFieldEffectArguments[0]++;
//     };

//     // Execute, store sprite ID in fieldEffectSpriteId and bind surf blob.
//     follower->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
//     CreateTask(Task_BindSurfBlobToFollowerNPC, 0x1);
//     SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_SURF);

//     follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     ObjectEventSetHeldMovement(follower, jumpState);
// }

// static void SetUpSurfBlobFieldEffect(struct ObjectEvent *npc)
// {
//     // Set up gFieldEffectArguments for execution.
//     gFieldEffectArguments[0] = npc->currentCoords.x;                 // effect_x
//     gFieldEffectArguments[1] = npc->currentCoords.y;                 // effect_y
//     gFieldEffectArguments[2] = GetFollowerNPCData(FNPC_DATA_OBJ_ID); // objId
// }

// #define tSpriteId       data[0]

// static void SetSurfDismount(void)
// {
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     u32 direction;
//     u32 jumpState;
//     u32 task;

//     ObjectEventClearHeldMovement(follower);

//     // Jump animation according to direction
//     direction = DetermineFollowerNPCDirection(&gObjectEvents[gPlayerAvatar.objectEventId], follower);
//     jumpState = GetJumpMovementAction(direction);

//     // Unbind and destroy Surf Blob
//     task = CreateTask(Task_FinishSurfDismount, 1);
//     gTasks[task].tSpriteId = follower->fieldEffectSpriteId;
//     SetSurfBlob_BobState(follower->fieldEffectSpriteId, 2);
//     follower->fieldEffectSpriteId = 0;
//     FollowerNPC_HandleSprite();

//     follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     ObjectEventSetHeldMovement(follower, jumpState);
// }

// static void Task_BindSurfBlobToFollowerNPC(u8 taskId)
// {
//     struct ObjectEvent *npc = &gObjectEvents[GetFollowerNPCObjectId()];
//     // Wait for the jump animation.
//     bool32 animStatus = ObjectEventClearHeldMovementIfFinished(npc);
//     if (animStatus == 0)
//         return;

//     // Bind the blob to the follower.
//     SetSurfBlob_BobState(npc->fieldEffectSpriteId, 0x1);
//     UnfreezeObjectEvents();
//     DestroyTask(taskId);
//     gPlayerAvatar.preventStep = FALSE;
//     return;
// }

// static void Task_FinishSurfDismount(u8 taskId)
// {
//     struct ObjectEvent *npc = &gObjectEvents[GetFollowerNPCObjectId()];
//     // Wait for the animation to finish.
//     bool32 animStatus = ObjectEventClearHeldMovementIfFinished(npc);

//     if (animStatus == 0)
//     {
//         // Temporarily stop running.
//         if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH) && ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gPlayerAvatar.objectEventId]))
//             SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);

//         return;
//     }

//     SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_NORMAL);
//     DestroySprite(&gSprites[gTasks[taskId].tSpriteId]);
//     UnfreezeObjectEvents();
//     DestroyTask(taskId);
//     gPlayerAvatar.preventStep = FALSE;
// }

// #undef tSpriteId

// static void Task_ReallowPlayerMovement(u8 taskId)
// {
//     bool32 animStatus = ObjectEventClearHeldMovementIfFinished(&gObjectEvents[GetFollowerNPCObjectId()]);
//     if (animStatus == 0)
//     {
//         // Temporarily stop running.
//         if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH)
//         && ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gPlayerAvatar.objectEventId]))
//             SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);

//         return;
//     }

//     gPlayerAvatar.preventStep = FALSE;
//     DestroyTask(taskId);
// }

// // Task data.
// #define tDoorTask           data[1]

// static void Task_FollowerNPCOutOfDoor(u8 taskId)
// {
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     struct ObjectEvent *player = &gObjectEvents[gPlayerAvatar.objectEventId];
//     struct Task *task = &gTasks[taskId];
//     s16 *x = &task->tDoorX;
//     s16 *y = &task->tDoorY;

//     // The player faces follower as they exit the door.
//     if (FNPC_FACE_NPC_FOLLOWER_ON_DOOR_EXIT == TRUE && ObjectEventClearHeldMovementIfFinished(player))
//         ObjectEventTurn(player, GetPlayerFaceToDoorDirection(player, follower));

//     switch (task->tState)
//     {
//     case OPEN_DOOR:
//         FreezeObjectEvents();
//         task->tDoorTask = FieldAnimateDoorOpen(follower->currentCoords.x, follower->currentCoords.y);
//         // Only play SE for animated doors.
//         if (task->tDoorTask != -1)
//             PlaySE(GetDoorSoundEffect(*x, *y));
//         task->tState = NPC_WALK_OUT;
//         break;
//     case NPC_WALK_OUT:
//         // If the door isn't still opening.
//         if (task->tDoorTask < 0 || gTasks[task->tDoorTask].isActive != TRUE)
//         {
//             follower->invisible = FALSE;
//             // If the follower should be surfing.
//             if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
//             {
//                 SetUpSurfBlobFieldEffect(follower);
//                 follower->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
//                 SetSurfBlob_BobState(follower->fieldEffectSpriteId, 1);
//             }
//             ObjectEventTurn(follower, DIR_SOUTH);
//             follower->singleMovementActive = FALSE;
//             follower->heldMovementActive = FALSE;
//             ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_DOWN);
//             task->tState = CLOSE_DOOR;
//         }
//         break;
//     case CLOSE_DOOR:
//         if (ObjectEventClearHeldMovementIfFinished(follower))
//         {
//             task->tDoorTask = FieldAnimateDoorClose(*x, *y);
//             task->tState = UNFREEZE_OBJECTS;
//         }
//         break;
//     case UNFREEZE_OBJECTS:
//         // Wait for door to close.
//         if (task->tDoorTask < 0 || gTasks[task->tDoorTask].isActive != TRUE)
//         {
//             UnfreezeObjectEvents();
//             task->tState = REALLOW_MOVEMENT;
//         }
//         break;
//     case REALLOW_MOVEMENT:
//         FollowerNPC_HandleSprite();
//         SetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR, FNPC_DOOR_NONE);
//         gPlayerAvatar.preventStep = FALSE;
//         DestroyTask(taskId);
//         break;
//     }
// }

// #undef tDoorTask

// static void Task_FollowerNPCHandleEscalator(u8 taskId)
// {
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     struct ObjectEvent *player = &gObjectEvents[gPlayerAvatar.objectEventId];

//     ObjectEventClearHeldMovementIfActive(follower);
//     ObjectEventSetHeldMovement(follower, DetermineFollowerNPCState(follower, MOVEMENT_ACTION_WALK_NORMAL_DOWN, DetermineFollowerNPCDirection(player, follower)));
//     DestroyTask(taskId);
// }

// #define tCounter                data[1]
// #define tMetatileBehavior       data[2]
// #define tTimer                  data[7]

// static void Task_FollowerNPCHandleEscalatorFinish(u8 taskId)
// {
//     s16 x, y;
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     struct ObjectEvent *player = &gObjectEvents[gPlayerAvatar.objectEventId];
//     struct Sprite *sprite = &gSprites[follower->spriteId];
//     struct Task *task = &gTasks[taskId];

//     switch (task->tState)
//     {
//     case MOVE_TO_PLAYER_POS:
//         MoveObjectEventToMapCoords(follower, player->currentCoords.x, player->currentCoords.y);
//         PlayerGetDestCoords(&x, &y);
//         task->tMetatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
//         task->tTimer = 0;
//         task->tState = WAIT_FOR_PLAYER_MOVE;
//         break;
//     case WAIT_FOR_PLAYER_MOVE:
//         // Wait half a second before revealing the follower.
//         if (task->tTimer++ < 32)
//             break;

//         task->tState = SHOW_FOLLOWER_DOWN;
//         task->tCounter = 16;
//         SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_NONE);
//         gPlayerAvatar.preventStep = TRUE;
//         ObjectEventClearHeldMovementIfActive(follower);
//         ObjectEventSetHeldMovement(follower, GetFaceDirectionMovementAction(DIR_EAST));
//         if (task->tMetatileBehavior == 0x6b)
//             task->tState = SHOW_FOLLOWER_UP;

//         break;
//     case SHOW_FOLLOWER_DOWN:
//         follower->invisible = FALSE;
//         CalculateFollowerNPCEscalatorTrajectoryDown(task);
//         task->tState = MOVE_FOLLOWER_DOWN;
//         break;
//     case MOVE_FOLLOWER_DOWN:
//         CalculateFollowerNPCEscalatorTrajectoryDown(task);
//         task->tMetatileBehavior++;
//         if (task->tMetatileBehavior & 1)
//             task->tCounter--;

//         if (task->tCounter == 0)
//         {
//             sprite->x2 = 0;
//             sprite->y2 = 0;
//             task->tState = MOVEMENT_FINISH;
//         }
//         break;
//     case SHOW_FOLLOWER_UP:
//         follower->invisible = FALSE;
//         CalculateFollowerNPCEscalatorTrajectoryUp(task);
//         task->tState = MOVE_FOLLOWER_UP;
//         break;
//     case MOVE_FOLLOWER_UP:
//         CalculateFollowerNPCEscalatorTrajectoryUp(task);
//         task->tMetatileBehavior++;
//         if (task->tMetatileBehavior & 1)
//             task->tCounter--;

//         if (task->tCounter == 0)
//         {
//             sprite->x2 = 0;
//             sprite->y2 = 0;
//             task->tState = MOVEMENT_FINISH;
//         }
//         break;
//     case MOVEMENT_FINISH:
//         if (ObjectEventClearHeldMovementIfFinished(follower))
//         {
//             gPlayerAvatar.preventStep = FALSE;
//             DestroyTask(taskId);
//         }
//     }
// }

// #undef tMetatileBehavior
// #undef tTimer

// static void CalculateFollowerNPCEscalatorTrajectoryUp(struct Task *task)
// {
//     struct Sprite *sprite = &gSprites[gObjectEvents[GetFollowerNPCObjectId()].spriteId];

//     sprite->x2 = Cos(0x7c, task->tCounter);
//     sprite->y2 = Sin(0x76, task->tCounter);
// }

// static void CalculateFollowerNPCEscalatorTrajectoryDown(struct Task *task)
// {
//     struct Sprite *sprite = &gSprites[gObjectEvents[GetFollowerNPCObjectId()].spriteId];

//     sprite->x2 = Cos(0x84, task->tCounter);
//     sprite->y2 = Sin(0x94, task->tCounter);
// }

// #undef tCounter

// #define RETURN_STATE(state, dir) return newState == MOVEMENT_INVALID ? state + (dir - 1) : ReturnFollowerNPCDelayedState(dir - 1);
// u32 DetermineFollowerNPCState(struct ObjectEvent *follower, u32 state, u32 direction)
// {
//     u32 newState = MOVEMENT_INVALID;
//     u32 collision = COLLISION_NONE;
//     s16 followerX = follower->currentCoords.x;
//     s16 followerY = follower->currentCoords.y;
//     u32 currentBehavior = MapGridGetMetatileBehaviorAt(followerX, followerY);
//     u32 nextBehavior;
//     u32 noSpecialAnimFrames = (GetFollowerNPCSprite() == GetFollowerNPCData(FNPC_DATA_GFX_ID));
//     u32 delayedState = GetFollowerNPCData(FNPC_DATA_DELAYED_STATE);

//     MoveCoords(direction, &followerX, &followerY);
//     nextBehavior = MapGridGetMetatileBehaviorAt(followerX, followerY);

//     if (FindTaskIdByFunc(Task_MoveNPCFollowerAfterForcedMovement) == TASK_NONE)
//         follower->facingDirectionLocked = FALSE;

//     // Follower won't do delayed movement until player does a movement.
//     if (!IsStateMovement(state) && delayedState)
//         return MOVEMENT_ACTION_NONE;

//     if (IsStateMovement(state) && delayedState)
//     {
//         // Lock face direction for Acro side jump.
//         if (delayedState == MOVEMENT_ACTION_JUMP_DOWN && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
//             follower->facingDirectionLocked = TRUE;

//         newState = delayedState + (direction -1);
//     }    

//     // Clear ice tile stuff.
//     follower->disableAnim = FALSE;

//     // Clear overwrite movement.
//     follower->directionOverwrite = DIR_NONE;

//     // Sideways stairs checks.
//     collision = GetSidewaysStairsCollision(follower, direction, currentBehavior, nextBehavior, collision);
//     switch (collision)
//     {
//     case COLLISION_SIDEWAYS_STAIRS_TO_LEFT:
//         follower->directionOverwrite = GetLeftSideStairsDirection(direction);
//         break;
//     case COLLISION_SIDEWAYS_STAIRS_TO_RIGHT:
//         follower->directionOverwrite = GetRightSideStairsDirection(direction);
//         break;
//     }

//     switch (state) 
//     {
//     case MOVEMENT_ACTION_WALK_SLOW_DOWN ... MOVEMENT_ACTION_WALK_SLOW_RIGHT:
//         // Slow walk.
//         RETURN_STATE(MOVEMENT_ACTION_WALK_SLOW_DOWN, direction);

//     case MOVEMENT_ACTION_WALK_NORMAL_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT:
//         // Normal walk.
//         RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

//     case MOVEMENT_ACTION_JUMP_2_DOWN ... MOVEMENT_ACTION_JUMP_2_RIGHT:
//         // Ledge jump.
//         if (delayedState == MOVEMENT_ACTION_JUMP_2_DOWN)
//             return (MOVEMENT_ACTION_JUMP_2_DOWN + (direction - 1));

//         if (delayedState == MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN)
//             return (MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN + (direction - 1));

//         SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, MOVEMENT_ACTION_JUMP_2_DOWN);
//         RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

//     case MOVEMENT_ACTION_WALK_FAST_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT:
//         // Handle player on waterfall.
//         if (PlayerIsUnderWaterfall(&gObjectEvents[gPlayerAvatar.objectEventId]) && (state == MOVEMENT_ACTION_WALK_FAST_UP))
//             return MOVEMENT_INVALID;

//         // Handle ice tile (some walking animation).
//         if (MetatileBehavior_IsIce(follower->currentMetatileBehavior) || MetatileBehavior_IsTrickHouseSlipperyFloor(follower->currentMetatileBehavior))
//             follower->disableAnim = TRUE;

//         // Handle surfing.
//         if (GetFollowerNPCData(FNPC_DATA_CURRENT_SPRITE) == FOLLOWER_NPC_SPRITE_INDEX_SURF && GetFollowerNPCSprite() == GetFollowerNPCData(FNPC_DATA_GFX_ID))
//             RETURN_STATE(MOVEMENT_ACTION_SURF_STILL_DOWN, direction);

//         RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

//     case MOVEMENT_ACTION_WALK_FASTER_DOWN ... MOVEMENT_ACTION_WALK_FASTER_RIGHT:
//         if (MetatileBehavior_IsIce(follower->currentMetatileBehavior) || MetatileBehavior_IsTrickHouseSlipperyFloor(follower->currentMetatileBehavior))
//             follower->disableAnim = TRUE;

//         RETURN_STATE(MOVEMENT_ACTION_WALK_FASTER_DOWN, direction);

//     case MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN ... MOVEMENT_ACTION_RIDE_WATER_CURRENT_RIGHT:
//         // Handle player on waterfall.
//         if (PlayerIsUnderWaterfall(&gObjectEvents[gPlayerAvatar.objectEventId]) && IsPlayerSurfingNorth())
//             return MOVEMENT_INVALID;

//         RETURN_STATE(MOVEMENT_ACTION_RIDE_WATER_CURRENT_DOWN, direction);

//     // Acro bike.
//     case MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN ... MOVEMENT_ACTION_ACRO_WHEELIE_FACE_RIGHT:
//         if (noSpecialAnimFrames)
//             return MOVEMENT_ACTION_NONE;

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_WHEELIE_FACE_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN ... MOVEMENT_ACTION_ACRO_POP_WHEELIE_RIGHT:
//         if (noSpecialAnimFrames)
//             return MOVEMENT_ACTION_NONE;

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_POP_WHEELIE_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN ... MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_RIGHT:
//         if (noSpecialAnimFrames)
//             return MOVEMENT_ACTION_NONE;

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_END_WHEELIE_FACE_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN ... MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_RIGHT:
//         if (noSpecialAnimFrames)
//             return MOVEMENT_ACTION_NONE;

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_WHEELIE_HOP_FACE_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN ... MOVEMENT_ACTION_ACRO_WHEELIE_HOP_RIGHT:
//         if (noSpecialAnimFrames)
//             RETURN_STATE(MOVEMENT_ACTION_JUMP_DOWN, direction);

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_WHEELIE_HOP_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN ... MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_RIGHT:
//         // Ledge jump.
//         if (noSpecialAnimFrames)
//         {
//             if (delayedState == MOVEMENT_ACTION_JUMP_2_DOWN)
//                 return (MOVEMENT_ACTION_JUMP_2_DOWN + (direction - 1));

//             SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, MOVEMENT_ACTION_JUMP_2_DOWN);
//         }
//         else
//         {
//             if (delayedState == MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN)
//                 return (MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN + (direction - 1));

//             if (delayedState == MOVEMENT_ACTION_JUMP_2_DOWN)
//                 return (MOVEMENT_ACTION_JUMP_2_DOWN + (direction - 1));

//             SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN);
//         }

//         RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN ... MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_RIGHT:
//         if (noSpecialAnimFrames)
//             return MOVEMENT_ACTION_NONE;

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_WHEELIE_IN_PLACE_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN ... MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_RIGHT:
//         if (noSpecialAnimFrames)
//             RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_POP_WHEELIE_MOVE_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN ... MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_RIGHT:
//         if (noSpecialAnimFrames)
//             RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_WHEELIE_MOVE_DOWN, direction);

//     case MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_DOWN ... MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_RIGHT:
//         if (noSpecialAnimFrames)
//             RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

//         RETURN_STATE(MOVEMENT_ACTION_ACRO_END_WHEELIE_MOVE_DOWN, direction);

//     // Sliding.
//     case MOVEMENT_ACTION_SLIDE_DOWN ... MOVEMENT_ACTION_SLIDE_RIGHT:
//         RETURN_STATE(MOVEMENT_ACTION_SLIDE_DOWN, direction);

//     case MOVEMENT_ACTION_PLAYER_RUN_DOWN ... MOVEMENT_ACTION_PLAYER_RUN_RIGHT:
//         // Running frames.
//         if (CheckFollowerNPCFlag(FOLLOWER_NPC_FLAG_HAS_RUNNING_FRAMES))
//             RETURN_STATE(MOVEMENT_ACTION_PLAYER_RUN_DOWN, direction);

//         RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

//     case MOVEMENT_ACTION_JUMP_SPECIAL_DOWN ... MOVEMENT_ACTION_JUMP_SPECIAL_RIGHT:
//         SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, MOVEMENT_ACTION_JUMP_SPECIAL_DOWN);
//         RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

//     case MOVEMENT_ACTION_JUMP_DOWN ... MOVEMENT_ACTION_JUMP_RIGHT:
//         // Acro side hop.
//         if (delayedState == MOVEMENT_ACTION_JUMP_DOWN)
//         {
//             if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
//                 follower->facingDirectionLocked = TRUE;

//             return newState;
//         }
//         else
//         {
//             SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, MOVEMENT_ACTION_JUMP_DOWN);
//             RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);
//         }

//     // Run slow.
//     case MOVEMENT_ACTION_RUN_DOWN_SLOW ... MOVEMENT_ACTION_RUN_RIGHT_SLOW:
//         if (CheckFollowerNPCFlag(FOLLOWER_NPC_FLAG_HAS_RUNNING_FRAMES))
//             RETURN_STATE(MOVEMENT_ACTION_RUN_DOWN_SLOW, direction);

//         RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

//     default:
//         return MOVEMENT_INVALID;
//     }

//     return newState;
// }

// /*
//  * Reload the entire event object.
//  * It would usually be enough just to change the sprite Id, but if the original
//  * sprite and the new sprite have different palettes, the palette would need to
//  * be reloaded.
//  */
// void SetFollowerNPCSprite(u32 spriteIndex)
// {
//     u32 oldSpriteId;
//     u32 newSpriteId;
//     u32 newGraphicsId;
//     struct ObjectEventTemplate clone;
//     struct ObjectEvent backupFollower;
//     struct ObjectEvent *follower;

//     if (!PlayerHasFollowerNPC())
//         return;

//     if (GetFollowerNPCData(FNPC_DATA_CURRENT_SPRITE) == spriteIndex)
//         return;

//     // Save the sprite.
//     follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     SetFollowerNPCData(FNPC_DATA_CURRENT_SPRITE, spriteIndex);
//     oldSpriteId = follower->spriteId;
//     newGraphicsId = GetFollowerNPCSprite();

//     backupFollower = *follower;
//     backupFollower.graphicsId = newGraphicsId;
//     DestroySprite(&gSprites[oldSpriteId]);
//     RemoveObjectEvent(&gObjectEvents[GetFollowerNPCObjectId()]);

//     clone = *GetObjectEventTemplateByLocalIdAndMap(GetFollowerNPCData(FNPC_DATA_MAP_ID), GetFollowerNPCData(FNPC_DATA_MAP_NUM), GetFollowerNPCData(FNPC_DATA_MAP_GROUP));
//     clone.graphicsId = newGraphicsId;
//     clone.movementType = 0;
//     clone.localId = OBJ_EVENT_ID_NPC_FOLLOWER;
//     SetFollowerNPCData(FNPC_DATA_OBJ_ID, TrySpawnObjectEventTemplate(&clone, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, clone.x, clone.y));
//     if (GetFollowerNPCData(FNPC_DATA_OBJ_ID) != OBJECT_EVENTS_COUNT)
//     {
//         follower = &gObjectEvents[GetFollowerNPCObjectId()];
//         newSpriteId = follower->spriteId;
//         *follower = backupFollower;
//         follower->spriteId = newSpriteId;
//         MoveObjectEventToMapCoords(follower, follower->currentCoords.x, follower->currentCoords.y);
//         ObjectEventTurn(follower, follower->facingDirection);
//     }
//     else
//     {
//         ClearFollowerNPCData();
//     }
// }

// static void ChooseFirstThreeEligibleMons(void)
// {
//     u32 i;
//     u32 count = 0;

//     ClearSelectedPartyOrder();

//     for (i = 0; i < PARTY_SIZE; i++)
//     {
//         if (GetMonData(&gPlayerParty[i], MON_DATA_HP) != 0
//          && GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) == FALSE
//          && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE)
//         {
//             gSelectedOrderFromParty[count] = (i + 1);
//             count++;
//         }

//         if (count == 3)
//             break;
//     }
// }

// bool32 PlayerHasFollowerNPC(void)
// {
//     return GetFollowerNPCData(FNPC_DATA_IN_PROGRESS);
// }

// void NPCFollow(struct ObjectEvent *npc, u32 state, bool32 ignoreScriptActive)
// {
//     struct ObjectEvent *player = &gObjectEvents[gPlayerAvatar.objectEventId];
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     u32 dir;
//     u32 newState;
//     u32 taskId;

//     // Only when the player moves.
//     if (player != npc)
//         return;
//     // Only if a follower exists.
//     else if (!PlayerHasFollowerNPC())
//         return;
//     // Don't follow during a script.
//     else if (ArePlayerFieldControlsLocked() && !ignoreScriptActive)
//         return;

//     // Follower changes to normal sprite after getting off surf blob.
//     if (GetFollowerNPCData(FNPC_DATA_CURRENT_SPRITE) == FOLLOWER_NPC_SPRITE_INDEX_SURF && !CheckFollowerNPCFlag(PLAYER_AVATAR_FLAG_SURFING) && follower->fieldEffectSpriteId == 0)
//     {
//         SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_NORMAL);
//         SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_NONE);
//     }

//     // Check if the state would cause hidden follower to reappear.
//     if (IsStateMovement(state) && GetFollowerNPCData(FNPC_DATA_WARP_END) == FNPC_WARP_REAPPEAR)
//     {
//         SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_NONE);

//         if (GetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR) == FNPC_DOOR_NEEDS_TO_EXIT)
//         {
//             gPlayerAvatar.preventStep = TRUE;
//             taskId = CreateTask(Task_FollowerNPCOutOfDoor, 1);
//             gTasks[taskId].tState = 0;
//             gTasks[taskId].tDoorX = follower->currentCoords.x;
//             gTasks[taskId].tDoorY = follower->currentCoords.y;
//             TryUpdateFollowerNPCSpriteUnderwater();
//             ObjectEventClearHeldMovementIfFinished(follower);
//             return;
//         }

//         follower->invisible = FALSE;
//         MoveObjectEventToMapCoords(follower, player->currentCoords.x, player->currentCoords.y);
//         // The follower should be facing the same direction as the player when it comes out of hiding.
//         ObjectEventTurn(follower, player->facingDirection);

//         // Recreate the surf blob if needed.
//         if (GetFollowerNPCData(FNPC_DATA_SURF_BLOB) == FNPC_SURF_BLOB_RECREATE)
//         {
//             SetUpSurfBlobFieldEffect(follower);
//             follower->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
//             SetSurfBlob_BobState(follower->fieldEffectSpriteId, 1);
//         }
//         else
//         {
//             TryUpdateFollowerNPCSpriteUnderwater();
//         }
//     }

//     dir = DetermineFollowerNPCDirection(player, follower);

//     if (dir == DIR_NONE)
//     {
//         ObjectEventClearHeldMovementIfFinished(follower);
//         return;
//     }

//     newState = DetermineFollowerNPCState(follower, state, dir);
//     if (newState == MOVEMENT_INVALID)
//     {
//         ObjectEventClearHeldMovementIfFinished(follower);
//         return;
//     }

//     // Follower gets on surf blob.
//     if (GetFollowerNPCData(FNPC_DATA_SURF_BLOB) == FNPC_SURF_BLOB_NEW && IsStateMovement(state))
//     {
//         SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_RECREATE);
//         gPlayerAvatar.preventStep = TRUE;
//         SetSurfJump();
//         ObjectEventClearHeldMovementIfFinished(follower);
//         return;
//     }
//     // Follower gets off surf blob.
//     else if (GetFollowerNPCData(FNPC_DATA_SURF_BLOB) == FNPC_SURF_BLOB_DESTROY)
//     {
//         SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_NONE);
//         gPlayerAvatar.preventStep = TRUE;
//         SetSurfDismount();
//         ObjectEventClearHeldMovementIfFinished(follower);
//         return;
//     }

//     ObjectEventClearHeldMovementIfActive(follower);
//     ObjectEventSetHeldMovement(follower, newState);
//     PlayerLogCoordinates(player);

//     switch (newState) 
//     {
//     case MOVEMENT_ACTION_JUMP_2_DOWN ... MOVEMENT_ACTION_JUMP_2_RIGHT:
//     case MOVEMENT_ACTION_JUMP_DOWN ... MOVEMENT_ACTION_JUMP_RIGHT:
//     case MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_DOWN ... MOVEMENT_ACTION_ACRO_WHEELIE_JUMP_RIGHT:
//         // Synchronize movements on stairs and ledges.
//         CreateTask(Task_ReallowPlayerMovement, 1);
//         gPlayerAvatar.preventStep = TRUE;
//     }

//     ObjectEventClearHeldMovementIfFinished(follower);
// }

// void CreateFollowerNPCAvatar(void)
// {
//     struct ObjectEvent *player;
//     struct ObjectEventTemplate clone;

//     if (!PlayerHasFollowerNPC())
//         return;

//     player = &gObjectEvents[gPlayerAvatar.objectEventId];
//     clone = *GetObjectEventTemplateByLocalIdAndMap(GetFollowerNPCData(FNPC_DATA_MAP_ID), GetFollowerNPCData(FNPC_DATA_MAP_NUM), GetFollowerNPCData(FNPC_DATA_MAP_GROUP));

//     clone.graphicsId = GetFollowerNPCSprite();
//     clone.x = player->currentCoords.x - 7;
//     clone.y = player->currentCoords.y - 7;
//     clone.movementType = 0;
//     clone.localId = OBJ_EVENT_ID_NPC_FOLLOWER;

//     switch (GetPlayerFacingDirection())
//     {
//     case DIR_NORTH:
//         clone.movementType = MOVEMENT_TYPE_FACE_UP;
//         break;
//     case DIR_WEST:
//         clone.movementType = MOVEMENT_TYPE_FACE_LEFT;
//         break;
//     case DIR_EAST:
//         clone.movementType = MOVEMENT_TYPE_FACE_RIGHT;
//         break;
//     }

//     // Create NPC and store ID.
//     SetFollowerNPCData(FNPC_DATA_OBJ_ID, TrySpawnObjectEventTemplate(&clone, GetFollowerNPCData(FNPC_DATA_MAP_NUM), GetFollowerNPCData(FNPC_DATA_MAP_GROUP), clone.x, clone.y));
//     if (GetFollowerNPCData(FNPC_DATA_OBJ_ID) == OBJECT_EVENTS_COUNT)
//     {
//         ClearFollowerNPCData();
//         return;
//     }

//     if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
//         SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_NONE);

//     gObjectEvents[GetFollowerNPCData(FNPC_DATA_OBJ_ID)].invisible = TRUE;
// }

// void FollowerNPC_HandleSprite(void)
// {
//     if (CheckFollowerNPCFlag(FOLLOWER_NPC_FLAG_CAN_BIKE))
//     {
//         if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
//             SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_MACH_BIKE);
//         else if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
//             SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_ACRO_BIKE);
//     }
//     else if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
//     {
//         TryUpdateFollowerNPCSpriteUnderwater();
//     }
//     else
//     {
//         SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_NORMAL);
//     }
// }

// u32 DetermineFollowerNPCDirection(struct ObjectEvent *player, struct ObjectEvent *follower)
// {
//     s32 delta_x = follower->currentCoords.x - player->currentCoords.x;
//     s32 delta_y = follower->currentCoords.y - player->currentCoords.y;

//     if (delta_x < 0)
//         return DIR_EAST;
//     else if (delta_x > 0)
//         return DIR_WEST;

//     if (delta_y < 0)
//         return DIR_SOUTH;
//     else if (delta_y > 0)
//         return DIR_NORTH;

//     return DIR_NONE;
// }

// u32 GetFollowerNPCObjectId(void)
// {
//     if (PlayerHasFollowerNPC())
//         return GetFollowerNPCData(FNPC_DATA_OBJ_ID);

//     return 0;
// }

// bool32 CheckFollowerNPCFlag(u32 flag)
// {
//     if (!PlayerHasFollowerNPC())
//         return TRUE;

//     if (GetFollowerNPCData(FNPC_DATA_FOLLOWER_FLAGS) & flag)
//         return TRUE;

//     return FALSE;
// }

// bool32 FollowerNPC_IsCollisionExempt(struct ObjectEvent *obstacle, struct ObjectEvent *collider)
// {
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     struct ObjectEvent *player = &gObjectEvents[gPlayerAvatar.objectEventId];

//     if (!PlayerHasFollowerNPC())
//         return FALSE;

//     if (obstacle == follower && collider == player)
//         return TRUE;

//     return FALSE;
// }

// void HideNPCFollower(void)
// {
//     if (!PlayerHasFollowerNPC() || gObjectEvents[GetFollowerNPCObjectId()].invisible)
//         return;

//     if (GetFollowerNPCData(FNPC_DATA_SURF_BLOB) == FNPC_SURF_BLOB_RECREATE || GetFollowerNPCData(FNPC_DATA_SURF_BLOB) == FNPC_SURF_BLOB_DESTROY)
//     {
//         SetSurfBlob_BobState(gObjectEvents[GetFollowerNPCObjectId()].fieldEffectSpriteId, 2);
//         DestroySprite(&gSprites[gObjectEvents[GetFollowerNPCObjectId()].fieldEffectSpriteId]);
//         gObjectEvents[GetFollowerNPCObjectId()].fieldEffectSpriteId = 0;
//     }

//     SetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR, FNPC_DOOR_NONE);

//     gObjectEvents[GetFollowerNPCObjectId()].invisible = TRUE;
// }

// void FollowerNPC_WarpSetEnd(void)
// {
//     struct ObjectEvent *player;
//     struct ObjectEvent *follower;
//     u32 toY;

//     if (!PlayerHasFollowerNPC())
//         return;

//     player = &gObjectEvents[gPlayerAvatar.objectEventId];
//     follower = &gObjectEvents[GetFollowerNPCObjectId()];

//     SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_REAPPEAR);
//     PlayerLogCoordinates(player);

//     toY = GetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR) == FNPC_DOOR_NEEDS_TO_EXIT ? (player->currentCoords.y - 1) : player->currentCoords.y;
//     MoveObjectEventToMapCoords(follower, player->currentCoords.x, toY);

//     if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ON_FOOT)
//         SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_NORMAL);

//     follower->facingDirection = player->facingDirection;
//     follower->movementDirection = player->movementDirection;
// }

// bool32 FollowerNPCCanBike(void)
// {
//     if (!PlayerHasFollowerNPC())
//         return TRUE;
//     else if (CheckFollowerNPCFlag(FOLLOWER_NPC_FLAG_CAN_BIKE))
//         return TRUE;
//     else
//         return FALSE;
// }

// void FollowerNPC_HandleBike(void)
// {
//     // Wait until after get off surf blob to start biking.
//     if (GetFollowerNPCData(FNPC_DATA_CURRENT_SPRITE) == FOLLOWER_NPC_SPRITE_INDEX_SURF)
//         return;

//     if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE && FollowerNPCCanBike() && GetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR) != FNPC_DOOR_NEEDS_TO_EXIT) //Coming out door
//     {
//         SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_MACH_BIKE);
//     }
//     else if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE && FollowerNPCCanBike() && GetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR) != FNPC_DOOR_NEEDS_TO_EXIT) //Coming out door
//     {
//         SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_ACRO_BIKE);
//     }
//     else
//     {
//         SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_NORMAL);
//         // Disable saved Acro side jump.
//         if (GetFollowerNPCData(FNPC_DATA_DELAYED_STATE) == MOVEMENT_ACTION_JUMP_DOWN)
//             SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, 0);
//     }
// }

// void FollowerNPC_FollowerToWater(void)
// {
//     if (!PlayerHasFollowerNPC())
//         return;

//     // Prepare for making the follower do the jump and spawn the surf blob right in front of the follower's location.
//     NPCFollow(&gObjectEvents[gPlayerAvatar.objectEventId], MOVEMENT_ACTION_JUMP_DOWN, TRUE);
//     SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_NEW);
// }

// void FollowerNPC_SetIndicatorToRecreateSurfBlob(void)
// {
//     if (PlayerHasFollowerNPC())
//         SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_RECREATE);
// }

// void FollowerNPC_BindToSurfBlobOnReloadScreen(void)
// {
//     struct ObjectEvent *follower;

//     if (!PlayerHasFollowerNPC())
//         return;

//     follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     TryUpdateFollowerNPCSpriteUnderwater();

//     if (GetFollowerNPCData(FNPC_DATA_SURF_BLOB) != FNPC_SURF_BLOB_RECREATE && GetFollowerNPCData(FNPC_DATA_SURF_BLOB) != FNPC_SURF_BLOB_DESTROY)
//         return;

//     // Spawn the surf blob under the follower.
//     SetUpSurfBlobFieldEffect(follower);
//     follower->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
//     SetSurfBlob_BobState(follower->fieldEffectSpriteId, 1);
// }

// void PrepareFollowerNPCDismountSurf(void)
// {
//     if (!PlayerHasFollowerNPC())
//         return;

//     NPCFollow(&gObjectEvents[gPlayerAvatar.objectEventId], MOVEMENT_ACTION_WALK_NORMAL_DOWN, TRUE);
//     SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_DESTROY);
// }

// void SetFollowerNPCSurfSpriteAfterDive(void)
// {
//     SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_SURF);
//     SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_RECREATE);
// }

// bool32 FollowerNPCComingThroughDoor(void)
// {
//     if (!PlayerHasFollowerNPC())
//         return FALSE;

//     if (GetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR))
//         return TRUE;

//     return FALSE;
// }

// void FollowerNPC_SetIndicatorToComeOutDoor(void)
// {
//     if (PlayerHasFollowerNPC())
//         SetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR, FNPC_DOOR_NEEDS_TO_EXIT);
// }

// void EscalatorMoveFollowerNPC(u32 movementType)
// {
//     u8 taskId;

//     if (!PlayerHasFollowerNPC())
//         return;

//     taskId = CreateTask(Task_FollowerNPCHandleEscalator, 1);
//     gTasks[taskId].data[1] = movementType;
// }

// void EscalatorMoveFollowerNPCFinish(void)
// {
//     if (!PlayerHasFollowerNPC())
//         return;

//     CreateTask(Task_FollowerNPCHandleEscalatorFinish, 1);
// }

// void FollowerNPCWalkIntoPlayerForLeaveMap(void)
// {
//     u32 followerObjId = GetFollowerNPCObjectId();
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];

//     if (followerObjId == OBJECT_EVENTS_COUNT)
//         return;

//     follower->singleMovementActive = FALSE;
//     follower->heldMovementActive = FALSE;
//     switch (DetermineFollowerNPCDirection(&gObjectEvents[gPlayerAvatar.objectEventId], &gObjectEvents[followerObjId]))
//     {
//     case DIR_NORTH:
//         ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_UP);
//         break;
//     case DIR_SOUTH:
//         ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_DOWN);
//         break;
//     case DIR_EAST:
//         ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_RIGHT);
//         break;
//     case DIR_WEST:
//         ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_LEFT);
//         break;
//     }
// }

// void FollowerNPCHideForLeaveMap(struct ObjectEvent *follower)
// {
//     SetFollowerNPCSprite(FOLLOWER_NPC_SPRITE_INDEX_NORMAL);
//     follower->invisible = TRUE;
//     SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_REAPPEAR);
//     SetFollowerNPCData(FNPC_DATA_COME_OUT_DOOR, FNPC_DOOR_NONE);
//     SetFollowerNPCData(FNPC_DATA_SURF_BLOB, FNPC_SURF_BLOB_NONE);
//     SetFollowerNPCData(FNPC_DATA_DELAYED_STATE, 0);
// }

// void FollowerNPCReappearAfterLeaveMap(struct ObjectEvent *follower, struct ObjectEvent *player)
// {
//     if (PlayerHasFollowerNPC())
//     {
//         follower->invisible = FALSE;
//         MoveObjectEventToMapCoords(follower, player->currentCoords.x, player->currentCoords.y);
//         ObjectEventTurn(follower, DIR_SOUTH);
//         follower->singleMovementActive = FALSE;
//         follower->heldMovementActive = FALSE;

//         // Follower only steps onto a tile without collision.
//         if (GetCollisionAtCoords(player, player->currentCoords.x, player->currentCoords.y + 1, DIR_SOUTH) == COLLISION_NONE)
//             ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_DOWN);
//         else if (GetCollisionAtCoords(player, player->currentCoords.x + 1, player->currentCoords.y, DIR_EAST) == COLLISION_NONE)
//             ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_RIGHT);
//         else if (GetCollisionAtCoords(player, player->currentCoords.x - 1, player->currentCoords.y, DIR_WEST) == COLLISION_NONE)
//             ObjectEventSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_LEFT);
//         else
//             HideNPCFollower();
//     }
// }

// void FollowerNPCFaceAfterLeaveMap(void)
// {
//     struct ObjectEvent *player = &gObjectEvents[gPlayerAvatar.objectEventId];
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCData(FNPC_DATA_OBJ_ID)];

//     if (follower->invisible)
//         return;

//     ObjectEventTurn(follower, DetermineFollowerNPCDirection(player, follower));
//     SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_NONE);
// }

// bool32 FollowerNPCIsBattlePartner(void)
// {
//     if (PlayerHasFollowerNPC() && GetFollowerNPCData(FNPC_DATA_BATTLE_PARTNER))
//         return TRUE;

//     return FALSE;
// }

// u32 GetFollowerNPCBattlePartner(void)
// {
//     return GetFollowerNPCData(FNPC_DATA_BATTLE_PARTNER);
// }

// bool32 IsNPCFollowerWildBattle(void)
// {
//     if (FollowerNPCIsBattlePartner() && FNPC_FLAG_PARTNER_WILD_BATTLES != 0
//      && (FNPC_FLAG_PARTNER_WILD_BATTLES == FNPC_ALWAYS || FlagGet(FNPC_FLAG_PARTNER_WILD_BATTLES)))
//         return TRUE;

//     return FALSE;
// }

// void PrepareForFollowerNPCBattle(void)
// {
//     // Load the partner party if the NPC follower should participate.
//     if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && FollowerNPCIsBattlePartner())
//     {
//         SavePlayerParty();
//         ChooseFirstThreeEligibleMons();
//         ReducePlayerPartyToSelectedMons();
//         // VarSet(VAR_0x8004, FRONTIER_UTIL_FUNC_SET_DATA);
//         // VarSet(VAR_0x8005, FRONTIER_DATA_SELECTED_MON_ORDER);
//         CallFrontierUtilFunc();
//         gPartnerTrainerId = TRAINER_PARTNER(GetFollowerNPCData(FNPC_DATA_BATTLE_PARTNER));
//         FillPartnerParty(gPartnerTrainerId);
//     }
// }

// void RestorePartyAfterFollowerNPCBattle(void)
// {
//     // VarSet(VAR_0x8004, FRONTIER_UTIL_FUNC_SAVE_PARTY);
//     CallFrontierUtilFunc();
//     LoadPlayerParty();
// }

// void FollowerNPC_TryRemoveFollowerOnWhiteOut(void)
// {
//     if (PlayerHasFollowerNPC())
//     {
//         if (CheckFollowerNPCFlag(FOLLOWER_NPC_FLAG_CLEAR_ON_WHITE_OUT))
//             ClearFollowerNPCData();
//         else
//             FollowerNPC_WarpSetEnd();
//     }
// }

// #undef tDoorX
// #undef tDoorY

// // Task data
// #define PREVENT_PLAYER_STEP     0
// #define DO_ALL_FORCED_MOVEMENTS 1
// #define NPC_INTO_PLAYER         2
// #define ENABLE_PLAYER_STEP      3

// void Task_MoveNPCFollowerAfterForcedMovement(u8 taskId)
// {
//     struct ObjectEvent *follower = &gObjectEvents[GetFollowerNPCObjectId()];
//     struct ObjectEvent *player = &gObjectEvents[gPlayerAvatar.objectEventId];

//     // Prevent player input until all forced mmovements are done and the follower is hidden.
//     if (gTasks[taskId].tState == PREVENT_PLAYER_STEP)
//     {
//         gPlayerAvatar.preventStep = TRUE;
//         gTasks[taskId].tState = DO_ALL_FORCED_MOVEMENTS;
//     }
//     // The player will keep doing forced movments until they land on a non-forced-move metatile or hit collision.
//     else if (gTasks[taskId].tState == DO_ALL_FORCED_MOVEMENTS && ObjectEventClearHeldMovementIfFinished(player) != 0)
//     {
//         // Lock follower facing direction for muddy slope.
//         // if (follower->currentMetatileBehavior == MB_MUDDY_SLOPE)
//         //     follower->facingDirectionLocked = TRUE;
            
//         if (TryDoMetatileBehaviorForcedMovement() == 0)
//             gTasks[taskId].tState = NPC_INTO_PLAYER;

//         return;
//     }
//     // The NPC will take an extra step and be on the same tile as the player.
//     else if (gTasks[taskId].tState == NPC_INTO_PLAYER && ObjectEventClearHeldMovementIfFinished(player) != 0 && ObjectEventClearHeldMovementIfFinished(follower) != 0)
//     {
//         ObjectEventSetHeldMovement(follower, GetWalkFastMovementAction(DetermineFollowerNPCDirection(player, follower)));
//         gTasks[taskId].tState = ENABLE_PLAYER_STEP;
//         return;
//     }
//     // Hide the NPC until the player takes a step. Reallow player input.
//     else if (gTasks[taskId].tState == ENABLE_PLAYER_STEP && ObjectEventClearHeldMovementIfFinished(follower) != 0)
//     {
//         follower->facingDirectionLocked = FALSE;
//         HideNPCFollower();
//         SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_REAPPEAR);
//         gPlayerAvatar.preventStep = FALSE;
//         DestroyTask(taskId);
//     }
// }

// #undef tState
// #undef PREVENT_PLAYER_STEP
// #undef DO_ALL_FORCED_MOVEMENTS
// #undef NPC_INTO_PLAYER
// #undef ENABLE_PLAYER_STEP

// void Task_HideNPCFollowerAfterMovementFinish(u8 taskId)
// {
//     struct ObjectEvent *npcFollower = &gObjectEvents[GetFollowerNPCObjectId()];
    
//     if (ObjectEventClearHeldMovementIfFinished(npcFollower) != 0)
//     {
//         HideNPCFollower();
//         SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_REAPPEAR);
//         gPlayerAvatar.preventStep = FALSE;
//         DestroyTask(taskId);
//     }
// }

// // Script commands.
// void ScriptSetFollowerNPC(struct ScriptContext *ctx)
// {
//     u32 localId = ScriptReadByte(ctx);
//     u32 flags = ScriptReadHalfword(ctx);
//     u32 setScript = ScriptReadByte(ctx);
//     u32 battlePartner = ScriptReadHalfword(ctx);
//     const u8 *script = (const u8 *)ScriptReadWord(ctx);

//     SetFollowerNPCData(FNPC_DATA_BATTLE_PARTNER, battlePartner);
//     TurnNPCIntoFollower(localId, flags, setScript, script);
// }

// void ScriptDestroyFollowerNPC(struct ScriptContext *ctx)
// {
//     if (PlayerHasFollowerNPC())
//     {
//         RemoveObjectEvent(&gObjectEvents[GetFollowerNPCData(FNPC_DATA_OBJ_ID)]);
//         FlagSet(GetFollowerNPCData(FNPC_DATA_EVENT_FLAG));
//         ClearFollowerNPCData();
//     }

//     UpdateFollowingPokemon();
// }

// void ScriptFaceFollowerNPC(struct ScriptContext *ctx)
// {
//     if (PlayerHasFollowerNPC())
//     {
//         u32 playerDirection, followerDirection;
//         struct ObjectEvent *player, *follower;

//         player = &gObjectEvents[gPlayerAvatar.objectEventId];
//         follower = &gObjectEvents[GetFollowerNPCData(FNPC_DATA_OBJ_ID)];
//         playerDirection = DetermineFollowerNPCDirection(player, follower);
//         followerDirection = playerDirection;

//         //Flip direction.
//         switch (playerDirection) 
//         {
//         case DIR_NORTH:
//             playerDirection = DIR_SOUTH;
//             break;
//         case DIR_SOUTH:
//             playerDirection = DIR_NORTH;
//             break;
//         case DIR_WEST:
//             playerDirection = DIR_EAST;
//             break;
//         case DIR_EAST:
//             playerDirection = DIR_WEST;
//             break;
//         }

//         ObjectEventTurn(player, playerDirection);
//         ObjectEventTurn(follower, followerDirection);
//     }
// }

// static const u8 *const FollowerNPCHideMovementsSpeedTable[][4] = 
// {
//     [DIR_SOUTH] = {Common_Movement_WalkDownSlow, Common_Movement_WalkDown, Common_Movement_WalkDownFast, Common_Movement_WalkDownFaster},
//     [DIR_NORTH] = {Common_Movement_WalkUpSlow, Common_Movement_WalkUp, Common_Movement_WalkUpFast, Common_Movement_WalkUpFaster},
//     [DIR_WEST] = {Common_Movement_WalkLeftSlow, Common_Movement_WalkLeft, Common_Movement_WalkLeftFast, Common_Movement_WalkLeftFaster},
//     [DIR_EAST] = {Common_Movement_WalkRightSlow, Common_Movement_WalkRight, Common_Movement_WalkRightFast, Common_Movement_WalkRightFaster}
// };

// void ScriptHideNPCFollower(struct ScriptContext *ctx)
// {
//     u32 walkSpeed = ScriptReadByte(ctx);
//     struct ObjectEvent *npc = &gObjectEvents[GetFollowerNPCObjectId()];

//     if (PlayerHasFollowerNPC() && npc->invisible == FALSE)
//     {
//         u32 direction = DetermineFollowerNPCDirection(&gObjectEvents[gPlayerAvatar.objectEventId], npc);

//         if (walkSpeed > 3)
//             walkSpeed = 3;

//         ScriptMovement_StartObjectMovementScript(OBJ_EVENT_ID_NPC_FOLLOWER, npc->mapGroup, npc->mapNum, FollowerNPCHideMovementsSpeedTable[direction][walkSpeed]);
//         SetFollowerNPCData(FNPC_DATA_WARP_END, FNPC_WARP_REAPPEAR);
//     }
// }

// void ScriptCheckFollowerNPC(struct ScriptContext *ctx)
// {
//     gSpecialVar_Result = PlayerHasFollowerNPC();
// }

// void ScriptUpdateFollowingMon(struct ScriptContext *ctx)
// {
//     UpdateFollowingPokemon();
// }

// void ScriptChangeFollowerNPCBattlePartner(struct ScriptContext *ctx)
// {
//     u32 newBattlePartner = ScriptReadHalfword(ctx);

//     if (PlayerHasFollowerNPC())
//         SetFollowerNPCData(FNPC_DATA_BATTLE_PARTNER, newBattlePartner);
// }
