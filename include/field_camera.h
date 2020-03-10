#ifndef GUARD_FIELD_CAMERA_H
#define GUARD_FIELD_CAMERA_H

#include "global.h"

// Exported type declarations

struct CameraObject
{
    void (*callback)(struct CameraObject *);
    u32 spriteId;
    s32 movementSpeedX;
    s32 movementSpeedY;
    s32 x;
    s32 y;
};

extern struct CameraObject gFieldCamera;

// Exported RAM declarations

extern u16 gTotalCameraPixelOffsetX;
extern u16 gTotalCameraPixelOffsetY;

// Exported ROM declarations

void DrawWholeMapView(void);
void CurrentMapDrawMetatileAt(int x, int y);
void sub_805A658(s16 *x, s16 *y);
void SetCameraPanningCallback(void (*cb)(void));
void SetCameraPanning(s16 x, s16 y);
void UpdateCameraPanning(void);
void InstallCameraPanAheadCallback(void);
void DrawDoorMetatileAt(int x, int y, const u16 *data);

#endif //GUARD_FIELD_CAMERA_H
