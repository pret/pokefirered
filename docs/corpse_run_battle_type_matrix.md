# Corpse-run battle-type reward/action matrix

While `corpseRun.state == CR_ACTIVE`, battle permissions and payouts are resolved by centralized checks (not per-script toggles).

| Capability | Corpse-run active policy | Central check |
| --- | --- | --- |
| Bag availability in battle menu | Blocked | `CorpseRun_CanUseBagInCurrentBattle` |
| Run/flee availability | Allowed (including trainer battles) | `CorpseRun_CanRunFromCurrentBattle` |
| EXP payout | Blocked | `CorpseRun_CanGainExpFromCurrentBattle` |
| Souls/currency payout | Blocked | `CorpseRun_CanGainCurrencyFromCurrentBattle` |
| Capture permission (ball throws) | Blocked | `CorpseRun_CanCaptureInCurrentBattle` |
| Post-battle trainer scripts | Blocked | `CorpseRun_ShouldRunPostBattleScripts` |

## Integration points

- Action menu handling and action acceptance (`battle_controller_player.c`, `battle_main.c`).
- EXP script dispatch (`battle_util.c`).
- Prize money / Pay Day grants and capture throw gate (`battle_script_commands.c`).
- Trainer post-battle script return dispatch (`battle_setup.c`).
- Safari Zone step-limit countdown bypass while active (`safari_zone.c`).

## Safari Zone behavior during corpse-run mode

When corpse-run mode is active, Safari step countdown is paused so Safari-linked encounters do not force `Times Up` during the run.

Vanilla step countdown resumes automatically as soon as corpse-run exits active state (recovery/failure/off), because the pause check is keyed directly to `CorpseRun_IsActive()`.

## Chase encounter party eligibility

Chase pressure can scale to request a double wild encounter when multiple chasers are active, but battle startup now downgrades to a single wild encounter unless `GetMonsStateToDoubles()` reports `PLAYER_HAS_TWO_USABLE_MONS`. Chase timers/chaser counts are still preserved regardless of this downgrade.
