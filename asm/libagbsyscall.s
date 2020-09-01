	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ArcTan2
ArcTan2: @ 81E3B58
	svc 0xA
	bx lr
	thumb_func_end ArcTan2

	thumb_func_start BgAffineSet
BgAffineSet: @ 81E3B5C
	svc 0xE
	bx lr
	thumb_func_end BgAffineSet

	thumb_func_start CpuFastSet
CpuFastSet: @ 81E3B60
	svc 0xC
	bx lr
	thumb_func_end CpuFastSet

	thumb_func_start CpuSet
CpuSet: @ 81E3B64
	svc 0xB
	bx lr
	thumb_func_end CpuSet

	thumb_func_start Div
Div: @ 81E3B68
	svc 0x6
	bx lr
	thumb_func_end Div

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 81E3B6C
	svc 0x12
	bx lr
	thumb_func_end LZ77UnCompVram

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 81E3B70
	svc 0x11
	bx lr
	thumb_func_end LZ77UnCompWram

	thumb_func_start MultiBoot
MultiBoot: @ 81E3B74
	movs r1, 0x1
	svc 0x25
	bx lr
	thumb_func_end MultiBoot

	thumb_func_start ObjAffineSet
ObjAffineSet: @ 81E3B7C
	svc 0xF
	bx lr
	thumb_func_end ObjAffineSet

	thumb_func_start RegisterRamReset
RegisterRamReset: @ 81E3B80
	svc 0x1
	bx lr
	thumb_func_end RegisterRamReset

	thumb_func_start SoftReset
SoftReset: @ 81E3B84
	ldr r3, =REG_IME
	movs r2, 0
	strb r2, [r3]
	ldr r1, =0x03007f00 @ User Stack
	mov sp, r1
	svc 0x1
	svc 0
	.pool
	thumb_func_end SoftReset

	thumb_func_start Sqrt
Sqrt: @ 81E3B9C
	svc 0x8
	bx lr
	thumb_func_end Sqrt

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 81E3BA0
	movs r2, 0
	svc 0x5
	bx lr
	thumb_func_end VBlankIntrWait

	.align 2, 0 @ Don't pad with nop.
