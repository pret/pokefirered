@#include "constants/layouts.h"
@#include "constants/map_types.h"
#include "constants/maps.h"
@#include "constants/weather.h"
@#include "constants/region_map_sections.h"
#include "constants/songs.h"
@#include "constants/weather.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

    @ 2D4A94
    .include "data/tilesets/headers.inc"

@ players house border and blockdata
@gUnknown_82D50F4::
@    .incbin "baserom.gba", 0x2D50F4, 0x10C

	.include "data/layouts/layouts.inc"
	.include "data/layouts/layouts_table.inc"
@	.include "data/maps/headers.inc"
	.include "data/maps/groups.inc"
@	.include "data/maps/connections.inc"
