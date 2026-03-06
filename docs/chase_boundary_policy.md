# Chase boundary policy

This document defines where an **active chase** is allowed to continue in the overworld.

## Continuation gate

While a chase is active, the runtime checks the player's current map and metatile context.
A chase continues only when **all** of the following are true:

1. The current map type is chase-compatible.
2. The current map is not treated as a safe/scripted hub.
3. The player is on a metatile that supports encounter-driven pursuit.

If any condition fails, chase state is cleared immediately (`EndChase()`).

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

## Metatile policy near player

The player's current destination tile must expose a usable encounter context:

- `METATILE_ATTRIBUTE_ENCOUNTER_TYPE == TILE_ENCOUNTER_LAND` → allowed
- `METATILE_ATTRIBUTE_ENCOUNTER_TYPE == TILE_ENCOUNTER_WATER` → allowed
- Surfing on a bridge metatile (`PLAYER_AVATAR_FLAG_SURFING` + bridge behavior) → allowed
- Otherwise → blocked

## Suppression safety rule

`ChaseStamina_ShouldSuppressRandomEncounters()` re-checks the same boundary gate. If the area is invalid, it clears chase state and returns `FALSE` so random-encounter suppression cannot persist outside chase-valid zones.

## Tuning intent

This policy is intentionally fail-closed:

- route-like, encounter-valid terrain keeps pressure on the player;
- hubs/buildings/script maps end pressure predictably;
- crossing into non-encounter terrain deterministically breaks pursuit.

Future tuning should update this document alongside `src/chase_stamina.c` so map/terrain rules stay explicit.
