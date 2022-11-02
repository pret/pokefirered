#ifndef GUARD_HELP_MESSAGE_H
#define GUARD_HELP_MESSAGE_H

extern const u8 gHelpMessageWindow_Gfx[];

void DestroyHelpMessageWindow(u8 a0);
u8 CreateHelpMessageWindow(void);
void PrintTextOnHelpMessageWindow(const u8 * text, u8 mode);
void MapNamePopupWindowIdSetDummy(void);
void DrawHelpMessageWindowTilesById(u8 windowId);

#endif //GUARD_HELP_MESSAGE_H
