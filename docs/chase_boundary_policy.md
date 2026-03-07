# Chase boundary policy

This document defines where an **active chase** is allowed to continue in the overworld and how chase visuals move while the chase state is active.

## Continuation gate

While a chase is active, runtime checks only the player's current **map context** for continuation.
A chase continues only when **all** of the following are true:

1. The current map type is chase-compatible.
2. The current map is not treated as a safe/scripted hub.

If either condition fails, chase state is cleared immediately (`EndChase()`).

## Map-type policy

| Map type | Continue chase? | Notes |
| --- | --- | --- |
| `MAP_TYPE_ROUTE` | Allowed | Standard pursuit space. |
| `MAP_TYPE_UNDERGROUND` | Allowed | Extended pursuit space. |
| `MAP_TYPE_OCEAN_ROUTE` | Allowed | Treated like route space. |
| `MAP_TYPE_TOWN` | Blocked | Safe hub exclusion. |
| `MAP_TYPE_CITY` | Blocked | Safe hub exclusion. |
| `MAP_TYPE_INDOOR` | Blocked | Building/script-heavy exclusion. |
| Any non-compatible map type | Blocked | Defensive fail-closed behavior. |

## Encounter tile eligibility policy

Encounter-eligible tiles are used for **re-engagement attempts only** (forced chase encounters), not for chase continuation:

- `METATILE_ATTRIBUTE_ENCOUNTER_TYPE == TILE_ENCOUNTER_LAND` → eligible
- `METATILE_ATTRIBUTE_ENCOUNTER_TYPE == TILE_ENCOUNTER_WATER` → eligible
- Surfing on a bridge metatile (`PLAYER_AVATAR_FLAG_SURFING` + bridge behavior) → eligible
- Otherwise → not eligible for forced re-engagement on that step

### Practical behavior

- Active chase can persist while crossing safe/non-encounter tiles (for example, route path tiles) as long as map context remains valid.
- Forced chase encounter generation resumes once the player steps back onto an encounter-eligible tile before chase timeout expires.

## Overworld chaser movement policy

When `ChaseStamina_IsChaseActive()` is true, a chase-overworld layer drives 1..`ChaseStamina_GetActiveChasers()` visual object events.

- Chasers use a reserved local-id range (`LOCALID_CHASE_VISUAL_BASE..LOCALID_CHASE_VISUAL_MAX`) and a dedicated chase graphics id (`OBJ_EVENT_GFX_MEOWTH`).
- Spawn point is biased behind the player when possible; each chaser then pursues every overworld frame.
- Target coordinate selection prefers the live player object-event coordinates and falls back to `gSaveBlock1Ptr->pos` when needed.
- Movement evaluates all four cardinal directions, ranks them by `GetDistanceScore` distance-to-player score, and selects the first legal collision-free step via `TryQueueChaserStep`.
- Every attempted step is validated with object collision checks; if all checks fail the chaser turns in place toward the player instead of forcing illegal movement.
- If a chaser is stalled for too long, stuck recovery now performs a deterministic perimeter search centered on the player: radius `1..4`, scanning each ring clockwise (top edge, right edge, bottom edge, left edge). Each candidate relocation must succeed (object coordinates match requested tile) and the player's exact tile is always skipped.
- If no valid relocation candidate is found in the bounded search, the chaser remains in place and retries on a later update cycle.

This policy keeps chasers visible and responsive while avoiding collision softlocks.

## Edge cases and invalidation handling

- **Chase termination (`EndChase`)**: all spawned chaser object events are explicitly removed immediately.
- **Map transitions / warps**: transition hooks despawn all chase object events before map context changes settle.
- **Context mismatch safety**: if spawned chasers belong to a previous map context, the chase-overworld layer invalidates and despawns them before any updates.
- **Doors/buildings/safe hubs**: entering non-chase contexts still terminates the chase state per core policy above, and visual chasers are cleaned up with that termination.
- **Ledges / blocked terrain**: collision fallback can choose alternate legal directions or no-step facing updates, preventing repeated illegal moves.

## Suppression safety rule

`ChaseStamina_ShouldSuppressRandomEncounters()` re-checks map-context validity. If the map context is invalid, it clears chase state and returns `FALSE` so random-encounter suppression cannot persist outside chase-valid zones.

## Scenario coverage expectation

State-machine coverage should include the following sequence:

1. Player runs from a wild battle in Route 1 grass to begin chase.
2. Player steps onto a non-encounter Route 1 path tile.
3. Chase remains active on the path tile.
4. Player returns to grass before timeout.
5. Forced chase re-engagement is again eligible on encounter-valid terrain.

Future tuning should update this document alongside `src/chase_stamina.c` and `src/chase_overworld.c` so map, terrain, and visual pursuit behavior stay explicit.
