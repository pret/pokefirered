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

// Exported RAM declarations

extern struct CameraObject gFieldCamera;
extern u16 gTotalCameraPixelOffsetX;
extern u16 gTotalCameraPixelOffsetY;
extern bool8 gBikeCameraAheadPanback;

// Exported ROM declarations

void DrawWholeMapView(void);
void CurrentMapDrawMetatileAt(int x, int y);
void FieldCameraGetPixelOffsetAtGround(s16 *x, s16 *y);
void SetCameraPanningCallback(void (*cb)(void));
void SetCameraPanning(s16 x, s16 y);
void UpdateCameraPanning(void);
void InstallCameraPanAheadCallback(void);
void DrawDoorMetatileAt(int x, int y, const u16 *data);
void move_tilemap_camera_to_upper_left_corner(void);
void CameraUpdate(void);
void FieldUpdateBgTilemapScroll(void);
void ResetCameraUpdateInfo(void);
u32 InitCameraUpdateCallback(u8 trackedSpriteId);
void CameraUpdateNoObjectRefresh(void);

#endif //GUARD_FIELD_CAMERA_H
