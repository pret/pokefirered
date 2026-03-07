#!/usr/bin/env python3
"""Validate chase-start escape outcomes in src/chase_stamina.c."""

from pathlib import Path
import re
import sys

SOURCE = Path("src/chase_stamina.c")

EXPECTED_START = {
    "B_OUTCOME_RAN",
    "B_OUTCOME_PLAYER_TELEPORTED",
    "B_OUTCOME_MON_TELEPORTED",
}
EXPECTED_NO_START = {
    "B_OUTCOME_WON",
    "B_OUTCOME_CAUGHT",
}


def main() -> int:
    text = SOURCE.read_text(encoding="utf-8")
    fn_match = re.search(
        r"static bool8 IsEscapeLikeWildOutcome\(u8 normalizedOutcome\)\n\{(?P<body>.*?)\n\}\n",
        text,
        flags=re.S,
    )
    if not fn_match:
        print("ERROR: IsEscapeLikeWildOutcome helper not found")
        return 1

    body = fn_match.group("body")
    case_values = set(re.findall(r"case\s+(B_OUTCOME_[A-Z_]+)\s*:", body))

    missing = sorted(EXPECTED_START - case_values)
    if missing:
        print("ERROR: missing chase-start cases:", ", ".join(missing))
        return 1

    forbidden = sorted(case_values & EXPECTED_NO_START)
    if forbidden:
        print("ERROR: unexpected chase-start cases present:", ", ".join(forbidden))
        return 1

    if "B_OUTCOME_MON_FLED" not in case_values:
        print("ERROR: helper should explicitly document MON_FLED handling")
        return 1

    if "if (IsEscapeLikeWildOutcome(normalizedOutcome)" not in text:
        print("ERROR: ChaseStamina_OnWildBattleEnded is not using IsEscapeLikeWildOutcome")
        return 1

    print("PASS: chase escape outcomes match expected policy")
    print("  starts chase:", ", ".join(sorted(EXPECTED_START)))
    print("  no chase:", ", ".join(sorted(EXPECTED_NO_START | {"B_OUTCOME_MON_FLED"})))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
