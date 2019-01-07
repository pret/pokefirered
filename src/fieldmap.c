#include "global.h"
#include "overworld.h"
#include "script.h"
#include "fieldmap.h"

void sub_8058A00(struct MapHeader *mapHeader);
void map_copy_with_padding(u16 *map, u16 width, u16 height);
void mapheader_copy_mapdata_of_adjacent_maps(struct MapHeader *mapHeader);
void sub_80591C4(void);

struct BackupMapData VMap;
EWRAM_DATA u16 gBackupMapData[VIRTUAL_MAP_SIZE];

const struct MapHeader * mapconnection_get_mapheader(struct MapConnection * connection)
{
    return get_mapheader_by_bank_and_number(connection->mapGroup, connection->mapNum);
}

void not_trainer_hill_battle_pyramid(void)
{
    sub_8058A00(&gMapHeader);
    mapheader_run_script_with_tag_x1();
}

void sub_80589E8(void)
{
    sub_8058A00(&gMapHeader);
    sub_80591C4();
    mapheader_run_script_with_tag_x1();
}

void sub_8058A00(struct MapHeader * mapHeader)
{
    const struct MapData * mapData = mapHeader->mapData;
    CpuFastFill(0x03FF03FF, gBackupMapData, sizeof(gBackupMapData));
    VMap.map = gBackupMapData;
    VMap.Xsize = mapData->width + 15;
    VMap.Ysize = mapData->height + 14;
    AGB_ASSERT_EX(VMap.Xsize * VMap.Ysize <= VIRTUAL_MAP_SIZE, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/fieldmap.c", 158);
    map_copy_with_padding(mapData->map, mapData->width, mapData->height);
    mapheader_copy_mapdata_of_adjacent_maps(mapHeader);
}
