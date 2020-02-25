#include "global.h"
#include "gflib.h"
#include "fieldmap.h"
#include "field_specials.h"
#include "fldeff.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "party_menu.h"
#include "constants/event_objects.h"

EWRAM_DATA u8 *sCutGrassSpriteArrayPtr = NULL;
EWRAM_DATA bool8 sScheduleOpenDottedHole = FALSE;

void FieldCallback_CutTree(void);
void FieldCallback_CutGrass(void);

u8 MetatileAtCoordsIsGrassTile(s16 x, s16 y)
{
    return TestMetatileAttributeBit(MapGridGetMetatileAttributeAt(x, y, 1), 1);
}

bool8 SetUpFieldMove_Cut(void)
{
    s16 x, y;
    u8 i, j;
    sScheduleOpenDottedHole = FALSE;
    if (CutMoveRuinValleyCheck() == TRUE)
    {
        sScheduleOpenDottedHole = TRUE;
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_CutGrass;
        return TRUE;
    }

    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_CUT_TREE) == TRUE)
    {
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_CutTree;
        return TRUE;
    }
    else
    {
        register s32 neg1 asm("r8");
        struct MapPosition *pos;
        PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);

        for (i = 0, pos = &gPlayerFacingPosition, neg1 = 0xFFFF; i < 3; i++)
        {

            y = i + neg1 + pos->y;
            for (j = 0; j < 3; j++)
            {
                x = j + neg1 + pos->x;
                if (MapGridGetZCoordAt(x, y) == pos->height)
                {
                    if (MetatileAtCoordsIsGrassTile(x, y) == TRUE)
                    {
                        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
                        gPostMenuFieldCallback = FieldCallback_CutGrass;
                        return TRUE;
                    }
                }
            }
        }
        return FALSE;
    }
}
