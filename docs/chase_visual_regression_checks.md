# Chase visual regression checks

This repository uses a lightweight **scripted validation** approach for field-system regressions where full host-side unit tests are not practical.

## Strategy

- **Unit-style checks where possible**: assert concrete control-flow and state-handling invariants by inspecting function bodies in `src/chase_overworld.c` and `src/chase_stamina.c`.
- **Scripted integration checks otherwise**: verify that linked hooks and update paths remain connected across systems (for example, `EndChase` -> overworld cleanup hooks).

## Covered behaviors

`tools/validate_chase_overworld_visuals.py` validates:

- Active chase visual sync supports spawning up to 2 chasers and clamps to visual max.
- Active chaser count reduction despawns extras.
- `EndChase` cleanup path calls `ChaseOverworld_OnChaseEnded`, and that hook despawns chasers.
- Map transition cleanup via `ChaseOverworld_OnMapTransition`.
- Collision-blocked movement handling and anti-stall relocation after stall-frame threshold.
- Player coordinate fallback path uses `gSaveBlock1Ptr->pos` when player object coords are unavailable.

`tools/validate_chase_escape_outcomes.py` remains the policy check for chase-start outcomes from wild battle escapes.

## How to run

```bash
python3 tools/validate_chase_overworld_visuals.py
python3 tools/validate_chase_escape_outcomes.py
```

Optional convenience target:

```bash
make check-chase
```
