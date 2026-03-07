# Chase tutorial design notes

## Goal
Provide a one-time, lightweight explanation the first time a player enters chase state, then offer an optional reminder if the player repeatedly fails chase re-engagements.

## Rule framing reference
Tutorial text should stay aligned with the chase continuation and safe-hub rules documented in [`docs/chase_boundary_policy.md`](./chase_boundary_policy.md):
- Chasers pursue while chase state is active.
- Safe/scripted hubs (towns, cities, indoors) terminate chase.
- Encounter-eligible terrain is used for re-engagement attempts while chase remains active.

## Runtime behavior
- **First-time tutorial** is queued when chase starts for the first time in a save.
- **Reminder hint** is queued after repeated chase failures (currently two consecutive chase-battle escapes/teleports that continue pressure).
- Messages are shown only when no script is running and no field message box is active.
- Reminder is optional and one-time per save.
