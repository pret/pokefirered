#include "global.h"
#include "main.h"
#include "help_system.h"
#include "list_menu.h"

struct HelpSystemVideoState
{
    /*0x00*/ MainCallback savedVblankCb;
    /*0x04*/ MainCallback savedHblankCb;
    /*0x08*/ u16 savedDispCnt;
    /*0x0a*/ u16 savedBg0Cnt;
    /*0x0c*/ u16 savedBg0Hofs;
    /*0x0e*/ u16 savedBg0Vofs;
    /*0x10*/ u16 savedBldCnt;
    /*0x12*/ u8 savedTextColor[3];
    /*0x15*/ u8 state;
};

EWRAM_DATA u8 gUnknown_203B174[0x4000] = {0};
EWRAM_DATA u8 gUnknown_203F174 = 0;
EWRAM_DATA u8 gUnknown_203F175 = 0;
EWRAM_DATA u8 gUnknown_203F176 = 0;
EWRAM_DATA u8 gUnknown_203F177 = 0;
EWRAM_DATA struct HelpSystemVideoState gUnknown_203F178 = {0};
EWRAM_DATA struct HelpSystemStruct_203F190 gUnknown_203F190 = {0};
EWRAM_DATA struct ListMenuItem gUnknown_203F1AC[52] = {0};
