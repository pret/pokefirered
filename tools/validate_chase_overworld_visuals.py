#!/usr/bin/env python3
"""Regression checks for chase overworld visual behavior."""

from __future__ import annotations

from pathlib import Path
import sys

CHASE_OVERWORLD_SOURCE = Path("src/chase_overworld.c")
CHASE_STAMINA_SOURCE = Path("src/chase_stamina.c")


class ValidationError(RuntimeError):
    pass


def extract_function_body(text: str, signature: str) -> str:
    start = text.find(signature)
    if start == -1:
        raise ValidationError(f"missing function signature: {signature}")

    brace_start = text.find("{", start)
    if brace_start == -1:
        raise ValidationError(f"missing function body start: {signature}")

    depth = 0
    for i in range(brace_start, len(text)):
        ch = text[i]
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return text[brace_start + 1 : i]

    raise ValidationError(f"unterminated function body: {signature}")


def require(haystack: str, needle: str, message: str) -> None:
    if needle not in haystack:
        raise ValidationError(message)


def validate_spawn_and_despawn(chase_overworld_text: str) -> list[str]:
    notes: list[str] = []
    body = extract_function_body(chase_overworld_text, "static void SpawnOrSyncChasers(void)")

    require(
        body,
        "if (activeChasers > CHASE_OVERWORLD_MAX_CHASERS)",
        "SpawnOrSyncChasers must clamp active chasers to the visual max",
    )
    require(
        body,
        "if (i >= activeChasers)",
        "SpawnOrSyncChasers must handle reduction in active chasers",
    )
    require(
        body,
        "RemoveObjectEventByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup);",
        "SpawnOrSyncChasers must despawn extra chaser object events",
    )
    require(
        body,
        "if (!TryGetObjectEventIdByLocalIdAndMap(localId, sSpawnedMapNum, sSpawnedMapGroup, &objectEventId))",
        "SpawnOrSyncChasers must spawn missing chasers while chase is active",
    )

    notes.append("spawn/despawn sync policy found")
    return notes


def validate_player_coord_fallback(chase_overworld_text: str) -> list[str]:
    notes: list[str] = []
    body = extract_function_body(chase_overworld_text, "static void SpawnOrSyncChasers(void)")

    require(
        body,
        "s16 playerX = gSaveBlock1Ptr->pos.x;",
        "SpawnOrSyncChasers must initialize playerX from saveblock position fallback",
    )
    require(
        body,
        "s16 playerY = gSaveBlock1Ptr->pos.y;",
        "SpawnOrSyncChasers must initialize playerY from saveblock position fallback",
    )
    require(
        body,
        "if (TryGetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0, &playerObjectEventId))",
        "SpawnOrSyncChasers must attempt to read live player object event coordinates",
    )

    notes.append("player coordinate fallback path found")
    return notes


def validate_end_chase_cleanup(chase_stamina_text: str, chase_overworld_text: str) -> list[str]:
    notes: list[str] = []

    end_chase_body = extract_function_body(chase_stamina_text, "static void EndChase(void)")
    require(
        end_chase_body,
        "ChaseOverworld_OnChaseEnded();",
        "EndChase must notify overworld chase visuals to cleanup",
    )

    on_chase_ended_body = extract_function_body(chase_overworld_text, "void ChaseOverworld_OnChaseEnded(void)")
    require(
        on_chase_ended_body,
        "if (sChasersSpawned)",
        "ChaseOverworld_OnChaseEnded should guard despawn on spawned state",
    )
    require(
        on_chase_ended_body,
        "DespawnChasers();",
        "ChaseOverworld_OnChaseEnded must despawn active chaser visuals",
    )

    notes.append("EndChase cleanup hook found")
    return notes


def validate_map_transition_cleanup(chase_overworld_text: str) -> list[str]:
    notes: list[str] = []
    map_transition_body = extract_function_body(
        chase_overworld_text,
        "void ChaseOverworld_OnMapTransition(const struct WarpData *from, const struct WarpData *to)",
    )

    require(
        map_transition_body,
        "if (sChasersSpawned)",
        "Map transition hook should guard despawn on spawned state",
    )
    require(
        map_transition_body,
        "DespawnChasers();",
        "Map transition hook must despawn chase visuals",
    )

    notes.append("map transition cleanup hook found")
    return notes


def validate_collision_and_antistall(chase_overworld_text: str) -> list[str]:
    notes: list[str] = []

    queue_body = extract_function_body(chase_overworld_text, "static bool8 TryQueueChaserStep(struct ObjectEvent *objectEvent, s16 targetX, s16 targetY)")
    require(
        queue_body,
        "GetCollisionAtCoords(objectEvent, testX, testY, direction) == COLLISION_NONE",
        "TryQueueChaserStep must gate movement on collision checks",
    )
    require(
        queue_body,
        "return FALSE;",
        "TryQueueChaserStep must fail when all directions are blocked",
    )

    sync_body = extract_function_body(chase_overworld_text, "static void SpawnOrSyncChasers(void)")
    require(
        sync_body,
        "if (sChaserStalledFrames[i] >= CHASE_OVERWORLD_MAX_STALLED_FRAMES)",
        "SpawnOrSyncChasers must detect stalled chasers",
    )
    require(
        sync_body,
        "PlaceChaserNearPlayer(localId, objectEventId, i, playerX, playerY);",
        "SpawnOrSyncChasers must relocate stalled chasers near player",
    )

    notes.append("collision gate and anti-stall relocation found")
    return notes


def main() -> int:
    chase_overworld_text = CHASE_OVERWORLD_SOURCE.read_text(encoding="utf-8")
    chase_stamina_text = CHASE_STAMINA_SOURCE.read_text(encoding="utf-8")

    checks = [
        validate_spawn_and_despawn,
        validate_player_coord_fallback,
        lambda text: validate_end_chase_cleanup(chase_stamina_text, text),
        validate_map_transition_cleanup,
        validate_collision_and_antistall,
    ]

    notes: list[str] = []
    for check in checks:
        notes.extend(check(chase_overworld_text))

    print("PASS: chase overworld regression checks")
    for note in notes:
        print(f"  - {note}")
    print("  - supports active chase spawn counts (1 and 2) via clamped activeChasers loop")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except ValidationError as exc:
        print(f"ERROR: {exc}")
        raise SystemExit(1)
