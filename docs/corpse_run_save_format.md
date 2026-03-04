# Corpse-run save format

`SaveBlock1.corpseRun` is a fixed-width 400-byte payload with a versioned header.

## Current schema (`version = 1`)

- `magic` (`'CRSV'`) and `version` identify the schema.
- `payloadLength` and `payloadChecksum` protect the rest of the schema bytes (`state` through `partySnapshot[]`).
- Death metadata is persisted as map group/num/coords/elevation.
- Stored party payload is persisted as a compact 6-slot snapshot.
- Dropped souls are persisted in `droppedSouls`.
- Corpse marker metadata is persisted as spawn flag, map identity, coords, elevation, style, map section, and spawn counter.
- `state` is persisted as `CR_OFF`, `CR_ACTIVE`, `CR_RECOVERED`, or `CR_FAILED`.

## Validation and safe recovery

On load, corpse-run data is considered invalid unless all checks pass:

1. `magic` and `version` match expected constants.
2. `payloadLength` matches the expected v1 payload size.
3. `payloadChecksum` matches the checksum of the payload bytes.
4. `state` enum is in-range.
5. Party count and marker metadata are sane.

If validation fails, data is reset to a safe baseline (`CR_OFF`, marker despawned, dropped souls cleared).
This ensures players can always continue the game without a permanent softlock/lockout.

## Save/quit behavior during active corpse run

When a player saves/quits while `state == CR_ACTIVE`:

- Active run state is preserved as-is.
- Marker location and dropped souls remain persisted.
- On continue, player can recover by touching the marker.
- If the player whites out before recovery, the run transitions to failed then a new run is initialized by the normal defeat flow.

## Versioning / migration strategy

To evolve this schema safely:

- Never repurpose existing fields.
- Append new fields before `reserved[]`.
- Bump `version` when interpretation changes.
- Keep old-version readers in loader validation and up-migrate in-memory before re-saving.
- Recompute `payloadLength` and `payloadChecksum` whenever payload-affecting fields change.

This preserves backward compatibility and makes forward migrations explicit.
