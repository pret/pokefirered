#!/usr/bin/env python

import json
import pathlib

commands = []
working_dir = pathlib.Path().resolve()
agbcc = working_dir / 'tools/agbcc'
builddir = working_dir / 'build/firered'


class MyEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, pathlib.PurePath):
            return str(o)
        return super().default(o)

# c sources
for src in (working_dir / 'src').rglob('*.c'):
    outfile = builddir / str(src.relative_to(working_dir).with_suffix('.o'))
    commands.append({
        'directory': working_dir,
        'arguments': ['arm-none-eabi-gcc', '-c', '-O2', '-g', '-std=c99', '-mcpu=arm7tdmi', '-mthumb', '-iquote' + str(working_dir / 'include'), '-I' + str(agbcc / 'include'), '-D__INTELLISENSE__', '-DFIRERED', '-DENGLISH', '-o', outfile, src],
        'file': src,
        'output': outfile
    })

with open('compile_commands.json', 'w') as ofp:
    json.dump(commands, ofp, cls=MyEncoder, indent=4)
