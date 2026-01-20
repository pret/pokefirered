from itertools import chain
from textwrap import dedent

import glob
import json
import pathlib
import re
import sys
import typing

CONFIG_ENABLED_PAT = re.compile(r"#define P_LEARNSET_HELPER_TEACHABLE\s+(?P<cfg_val>[^ ]*)")
INCFILE_HAS_TUTOR_PAT = re.compile(r"special ChooseMonForMoveTutor")
INCFILE_MOVE_PAT = re.compile(r"setvar VAR_ITEM_ID, (MOVE_.*)")

def enabled() -> bool:
    """
    Check if the user has explicitly enabled this opt-in helper.
    """
    with open("./include/config/pokemon.h", "r") as cfg_pokemon_fp:
        cfg_pokemon = cfg_pokemon_fp.read()
        cfg_defined = CONFIG_ENABLED_PAT.search(cfg_pokemon)
        return cfg_defined is not None and cfg_defined.group("cfg_val") in ("TRUE", "1")

def extract_repo_tutors() -> typing.Generator[str, None, None]:
    """
    Yield MOVE constants which are *likely* assigned to a move tutor. This isn't
    foolproof, but it's suitable.
    """
    for inc_fname in chain(glob.glob("./data/scripts/*.inc"), glob.glob("./data/maps/*/scripts.inc")):
        with open(inc_fname, "r") as inc_fp:
            incfile = inc_fp.read()
            if not INCFILE_HAS_TUTOR_PAT.search(incfile):
                continue

            for move in INCFILE_MOVE_PAT.finditer(incfile):
                yield move.group(1)

def dump_output(file, data):
    with open(file, "w") as fp:
        fp.write(data)

def main():
    if not enabled():
        quit()

    if len(sys.argv) < 2:
        print("Missing required arguments", file=sys.stderr)
        print(__doc__, file=sys.stderr)
        quit(1)

    OUTPUT_FILE = pathlib.Path(sys.argv[1])

    assert OUTPUT_FILE.parent.exists(), f"parent of {OUTPUT_FILE=} does not exist"

    tutors_list = sorted(list(extract_repo_tutors()))
    new_tutors = json.dumps(tutors_list, indent=2)
    old_tutors = ""
    if OUTPUT_FILE.exists() and OUTPUT_FILE.is_file():
        with open(OUTPUT_FILE, "r") as fp:
            old_tutors = fp.read()

    dump_output(OUTPUT_FILE, new_tutors)

    if new_tutors != old_tutors:
        pathlib.Path("./tools/learnset_helpers/make_teachables.py").touch()

if __name__ == "__main__":
    main()
