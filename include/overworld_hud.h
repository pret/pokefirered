#ifndef GUARD_OVERWORLD_HUD_H
#define GUARD_OVERWORLD_HUD_H

void OverworldHud_Show(void);
void OverworldHud_Hide(void);
void OverworldHud_ShowToast(const u8 *text, u8 durationFrames);
void OverworldHud_Update(void);
void OverworldHud_BeginChaseResolvedState(void);

#endif // GUARD_OVERWORLD_HUD_H
