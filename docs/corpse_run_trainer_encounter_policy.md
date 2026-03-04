# Corpse-run trainer encounter policy

This table defines whether trainer encounters are treated as **corpse-run escape encounters** while `corpseRun.state == CR_ACTIVE`.

| Category | Policy | Notes |
| --- | --- | --- |
| Route trainers | Allowed | Defeat persistence is bypassed **only** for these encounters, and only as whiteout escape encounters. |
| Gym leaders | Blocked | No bypass; normal corpse-run defeat persistence applies. |
| Scripted bosses | Blocked | No bypass; includes story boss encounters and Team Rocket admin/boss battles. |
| Rivals | Blocked | No bypass; includes early rival and later rival/champion encounters. |
| Event trainers | Blocked | No bypass for continue-script/event-controlled trainer battle modes. |

## Side-effect suppression during corpse-run encounters

When in corpse-run mode (`CR_ACTIVE`), trainer battle side effects are suppressed for non-critical trainer encounters:

- badge/story advancement
- rematch registration/clear operations
- trainer-script victory side effects
- item/event rewards tied to normal trainer completion scripts

## Explicit critical-battle exclusions

To avoid sequence breaks, the following are always excluded from corpse-run encounter bypass/suppression:

- Oak's Lab starter rival battles
- Route 22 early/late rival battles
- Cerulean/SS Anne/Pokémon Tower/Silph rival battles
- Champion rival battles
- Giovanni boss/leader battles
- Team Rocket admin battles
