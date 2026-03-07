# Chase boundary policy

This document defines where an **active chase** is allowed to continue in the overworld.

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

## Suppression safety rule

`ChaseStamina_ShouldSuppressRandomEncounters()` re-checks map-context validity. If the map context is invalid, it clears chase state and returns `FALSE` so random-encounter suppression cannot persist outside chase-valid zones.

## Scenario coverage expectation

State-machine coverage should include the following sequence:

1. Player runs from a wild battle in Route 1 grass to begin chase.
2. Player steps onto a non-encounter Route 1 path tile.
3. Chase remains active on the path tile.
4. Player returns to grass before timeout.
5. Forced chase re-engagement is again eligible on encounter-valid terrain.

Future tuning should update this document alongside `src/chase_stamina.c` so map/terrain rules stay explicit.
