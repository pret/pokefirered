# Corpse-run save format

`SaveBlock1.corpseRun` is a fixed-width 400-byte payload with a versioned header.

## Current schema (`version = 1`)

- `magic` (`'CRSV'`) and `version` identify the schema.
- `payloadLength` and `payloadChecksum` protect the rest of the schema bytes (`state` through `reserved[]`).
- Death metadata is persisted as map group/num/coords/elevation.
- Stored party payload is persisted as a compact 6-slot snapshot.
- Dropped souls are persisted in `droppedSouls`.
- Corpse marker metadata is persisted as spawn flag, map identity, coords, elevation, style, map section, and spawn counter.
- `state` is persisted as `CR_OFF`, `CR_ACTIVE`, `CR_RECOVERED`, or `CR_FAILED`.
- State 2 (salvage) persists explicit fields:
  - `salvageActive`
  - `salvageBallsRemaining`
  - `salvageCatchConsumed`
  - `respawnMapId`, `respawnX`, `respawnY`

## Validation and safe recovery

On load, corpse-run data is considered invalid unless all checks pass:

1. `magic` and `version` match expected constants.
2. `payloadLength` matches the expected v1 payload size.
3. `payloadChecksum` matches the checksum of the payload bytes.
4. `state` enum is in-range.
5. Party count and marker metadata are sane.

If validation fails, data is reset to a safe baseline (`CR_OFF`, marker despawned, dropped souls cleared).
This ensures players can always continue the game without a permanent softlock/lockout.

## State 2 (salvage) load reconciliation

On map enter after loading:

1. If `salvageActive == FALSE`, no salvage-mode setup is required.
2. If `salvageActive == TRUE`:
   - If the player has a usable party already, salvage is cleared and the player is warped to the last Pokémon Center.
   - If `salvageCatchConsumed == TRUE`, salvage completion is treated as authoritative and completed immediately (warp to Center + clear salvage).
   - If the current map is outside Safari salvage scope, the player is warped to Safari entrance.
   - Safari runtime state is reinitialized/reconciled as needed (`FLAG_SYS_SAFARI_MODE`, balls, and timeout suppression prerequisites).
3. If `salvageCatchConsumed == TRUE` while `salvageActive == FALSE`, load still finalizes salvage exit immediately to recover from interrupted mid-transition saves.

This guarantees crash-safe completion and prevents invalid non-Safari salvage contexts.

## Salvage catch atomicity

On a valid salvage catch, commit order is deterministic:

1. Set `salvageCatchConsumed = TRUE`.
2. Set `salvageActive = FALSE`.
3. Add the caught Pokémon to party slot 1.
4. Warp to last rested Center.

Load-time reconciliation treats `salvageCatchConsumed` as authoritative, so interrupted transitions cannot duplicate or bypass one-catch completion.


## Salvage level policy

Salvage catch eligibility uses an upper-bound-only check: a catch is allowed when the caught level is less than or equal to the dynamic salvage cap (gym ace / Elite Four reference minus 5). There is no lower-bound rejection in salvage logic.

When an out-of-band high-level encounter is caught above the cap, the catch is rejected with the in-battle “too strong to follow” message.
Encounter-table tuning is expected to guarantee at least one achievable encounter in-band for salvage progression.

## Permanent second-death invalidation

Second-death handling permanently invalidates prior run recovery payload before salvage:

- `droppedSouls` is zeroed.
- Stored party snapshot (`partySnapshot[]` + `partyCount`) is invalidated.

Those invalidations persist across reloads and are never restored from pre-salvage State 1.

## Versioning / migration strategy

To evolve this schema safely:

- Never repurpose existing fields.
- Append new fields before `reserved[]`.
- Bump `version` when interpretation changes.
- Keep old-version readers in loader validation and up-migrate in-memory before re-saving.
- Recompute `payloadLength` and `payloadChecksum` whenever payload-affecting fields change.

This preserves backward compatibility and makes forward migrations explicit.
