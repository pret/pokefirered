#ifndef GUARD_GBA_DEFINES
#define GUARD_GBA_DEFINES

#include <stddef.h>
#include "types.h"

#define TRUE  1
#define FALSE 0

#if MODERN
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

#define ALIGNED(n) __attribute__((aligned(n)))

extern struct SoundInfo * SOUND_INFO_PTR;
extern u16 INTR_CHECK;
extern void * INTR_VECTOR;


#define BG_PLTT_SIZE  0x200
#define OBJ_PLTT_SIZE 0x200
#define PLTT_SIZE     (BG_PLTT_SIZE + OBJ_PLTT_SIZE)

extern u8 PLTT[PLTT_SIZE] __attribute__ ((aligned (4)));
#define BG_PLTT       PLTT
#define OBJ_PLTT      (PLTT + BG_PLTT_SIZE)



#define VRAM_SIZE 0x18000
extern u8 VRAM_[VRAM_SIZE] __attribute__ ((aligned (4)));
#define VRAM (u32)VRAM_

#define BG_VRAM           VRAM
#define BG_VRAM_SIZE      0x10000
#define BG_CHAR_SIZE      0x4000
#define BG_SCREEN_SIZE    0x800
#define BG_CHAR_ADDR(n)   (void *)(BG_VRAM + (BG_CHAR_SIZE * (n)))
#define BG_SCREEN_ADDR(n) (void *)(BG_VRAM + (BG_SCREEN_SIZE * (n)))
#define BG_TILE_ADDR(n)   (void *)(BG_VRAM + (0x80 * (n)))

#define BG_TILE_H_FLIP(n)   (0x400 + (n))
#define BG_TILE_V_FLIP(n)   (0x800 + (n))
#define BG_TILE_H_V_FLIP(n) (0xC00 + (n))

// text-mode BG
#define OBJ_VRAM0      (void *)(VRAM + 0x10000)
#define OBJ_VRAM0_SIZE 0x8000

// bitmap-mode BG
#define OBJ_VRAM1      (void *)(VRAM + 0x14000)
#define OBJ_VRAM1_SIZE 0x4000

#define OAM_SIZE 0x400
extern u8 OAM[OAM_SIZE] __attribute__ ((aligned (4)));

#define ROM_HEADER_SIZE   0xC0

#define DISPLAY_WIDTH  240
#define DISPLAY_HEIGHT 160

#define TILE_SIZE_4BPP 32
#define TILE_SIZE_8BPP 64

#define BG_TILE_ADDR_4BPP(n)   (void *)(BG_VRAM + (TILE_SIZE_4BPP * (n)))

#define TILE_OFFSET_4BPP(n) ((n) * TILE_SIZE_4BPP)
#define TILE_OFFSET_8BPP(n) ((n) * TILE_SIZE_8BPP)

#define TOTAL_OBJ_TILE_COUNT 1024

#define PLTT_SIZEOF(n) ((n) * sizeof(u16))
#define PLTT_SIZE_4BPP PLTT_SIZEOF(16)
#define PLTT_SIZE_8BPP PLTT_SIZEOF(256)

#define PLTT_OFFSET_4BPP(n) ((n) * PLTT_SIZE_4BPP)

// Some functions are strictly inline asm
#define NAKED __attribute__((naked))
#define UNUSED __attribute__((unused))

#endif // GUARD_GBA_DEFINES
