#ifndef GUARD_FIELD_CAMERA_H
#define GUARD_FIELD_CAMERA_H

#include "global.h"

// Exported type declarations

struct CameraObject
{
    void (*callback)(struct CameraObject *);
    u32 unk4;
    s32 unk8;
    s32 unkC;
    s32 x;
    s32 y;
};

// Exported RAM declarations

extern struct CameraObject gFieldCamera;
extern u16 gTotalCameraPixelOffsetX;
extern u16 gTotalCameraPixelOffsetY;

// Exported ROM declarations

void DrawWholeMapView(void);
void CurrentMapDrawMetatileAt(int x, int y);
void sub_805A658(s16 *x, s16 *y);
void SetCameraPanningCallback(void (*cb)(void));
void SetCameraPanning(s16 x, s16 y);
void InstallCameraPanAheadCallback(void);
void DrawDoorMetatileAt(int x, int y, const u16 *data);

#endif //GUARD_FIELD_CAMERA_H
