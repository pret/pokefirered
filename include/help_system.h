#ifndef GUARD_HELP_SYSTEM_H
#define GUARD_HELP_SYSTEM_H

#include "global.h"
#include "list_menu.h"
#include "blit.h"

struct HelpSystemListMenu_sub
{
    struct ListMenuItem * items;
    u16 totalItems;
    u16 maxShowed;
    u8 left;
    u8 top;
};

struct HelpSystemListMenu
{
    struct HelpSystemListMenu_sub sub;
    u8 field_0C;
    u8 field_0D;
    u8 field_0E;
    u8 filler_10[0xC];
};

extern struct HelpSystemListMenu gHelpSystemListMenu;
extern struct ListMenuItem gHelpSystemListMenuItems[];
extern bool8 gHelpSystemEnabled;
extern u8 gUnknown_203F175;

// help_system_812B1E0
void HelpSystem_SetSomeVariable(u8);
void HelpSystem_SetSomeVariable2(u8);
bool8 sub_812B40C(void);
bool8 sub_812B45C(void);
void HelpSystem_Disable(void);
void HelpSystem_Enable(void);
void sub_812B4B8(void);
bool8 sub_812BB9C(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BC54(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BC80(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BCA8(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BCD0(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BD2C(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BD64(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BD98(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
void sub_812BDEC(void);
bool8 sub_812BE10(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BEEC(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BF18(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
bool8 sub_812BF88(void);

// help_system
bool8 RunHelpSystemCallback(void);
void SaveCallbacks(void);
void SaveMapGPURegs(void);
void SaveMapTiles(void);
void SaveMapTextColors(void);
void RestoreCallbacks(void);
void RestoreGPURegs(void);
void RestoreMapTiles(void);
void RestoreMapTextColors(void);
void CommitTilemap(void);
void sub_813BCF4(void);
void sub_813BD14(u8);
void sub_813BD5C(u8);
void sub_813BDA4(u8);
void sub_813BDE8(u8);
void sub_813BE30(u8);
void sub_813BE78(u8);
void sub_813BEE4(u8);
void sub_813BF50(u8);
void sub_813BFC0(u8);
void sub_813C004(u8, u8);
void HelpSystem_PrintTextRightAlign_Row52(const u8 *str);
void HelpSystem_PrintTextAt(const u8 *, u8, u8);
void HelpSystem_PrintTwoStrings(const u8 *a0, const u8 *a1);
void HelpSystem_PrintText_813C584(const u8 *str);
void HelpSystem_FillPanel2(void);
void HelpSystem_FillPanel1(void);
void HelpSystem_InitListMenuController(struct HelpSystemListMenu *, u8, u8);
void HelpSystem_SetInputDelay(u8);
s32 HelpSystem_GetMenuInput(void);
void sub_813C75C(void);

void DecompressAndRenderGlyph(u8 font, u16 glyph, struct Bitmap *srcBlit, struct Bitmap *destBlit, u8 *destBuffer, u8 x, u8 y, u8 width, u8 height);
void HelpSystem_PrintText_Row61(const u8 * str);
void HelpSystem_FillPanel3(void);
void PrintListMenuItems(void);
void PlaceListMenuCursor(void);
bool8 MoveCursor(u8 by, u8 dirn);
void HelpSystem_BackupSomeVariable(void);
void HelpSystem_RestoreSomeVariable(void);
void HelpSystemRenderText(u8 font, u8 * dest, const u8 * src, u8 x, u8 y, u8 width, u8 height);
void sub_812B4AC(void);

#endif //GUARD_HELP_SYSTEM_H
