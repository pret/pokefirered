#include "global.h"

vu16 *const gBGControlRegs[] =
{
    &REG_BG0CNT,
    &REG_BG1CNT,
    &REG_BG2CNT,
    &REG_BG3CNT,
};

vu16 *const gBGHOffsetRegs[] =
{
    &REG_BG0HOFS,
    &REG_BG1HOFS,
    &REG_BG2HOFS,
    &REG_BG3HOFS,
};

vu16 *const gBGVOffsetRegs[] =
{
    &REG_BG0VOFS,
    &REG_BG1VOFS,
    &REG_BG2VOFS,
    &REG_BG3VOFS,
};

const u16 gDISPCNTBGFlags[] = { DISPCNT_BG0_ON, DISPCNT_BG1_ON, DISPCNT_BG2_ON, DISPCNT_BG3_ON };
const u16 gOverworldBackgroundLayerFlags[] = { BLDCNT_TGT2_BG0, BLDCNT_TGT2_BG1, BLDCNT_TGT2_BG2, BLDCNT_TGT2_BG3 };
const u16 gBLDCNTTarget1BGFlags[] = { BLDCNT_TGT1_BG0, BLDCNT_TGT1_BG1, BLDCNT_TGT1_BG2, BLDCNT_TGT1_BG3 };

const u8 gBGControlRegOffsets[] =
{
    REG_OFFSET_BG0CNT,
    REG_OFFSET_BG1CNT,
    REG_OFFSET_BG2CNT,
    REG_OFFSET_BG3CNT,
};

const u8 gBGHOffsetRegOffsets[] =
{
    REG_OFFSET_BG0HOFS,
    REG_OFFSET_BG1HOFS,
    REG_OFFSET_BG2HOFS,
    REG_OFFSET_BG3HOFS,
};

const u8 gBGVOffsetRegOffsets[] =
{
    REG_OFFSET_BG0VOFS,
    REG_OFFSET_BG1VOFS,
    REG_OFFSET_BG2VOFS,
    REG_OFFSET_BG3VOFS,
};
