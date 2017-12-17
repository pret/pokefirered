	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8069ED0
sub_8069ED0: @ 8069ED0
	movs r0, 0
	bx lr
	thumb_func_end sub_8069ED0

	thumb_func_start sub_8069ED4
sub_8069ED4: @ 8069ED4
	movs r0, 0
	bx lr
	thumb_func_end sub_8069ED4

	thumb_func_start sub_8069ED8
sub_8069ED8: @ 8069ED8
	push {lr}
	bl sub_80697FC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8069ED8

	thumb_func_start sub_8069EE4
sub_8069EE4: @ 8069EE4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8069EE4

	thumb_func_start sub_8069EFC
sub_8069EFC: @ 8069EFC
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 14
	ldr r1, _08069F18 @ =gUnknown_815FD60
	adds r1, r0, r1
	ldr r0, _08069F1C @ =gUnknown_8160450
	cmp r1, r0
	bcs _08069F20
	ldr r0, [r1]
	bl _call_via_r0
	b _08069F2C
	.align 2, 0
_08069F18: .4byte gUnknown_815FD60
_08069F1C: .4byte gUnknown_8160450
_08069F20:
	ldr r0, _08069F34 @ =gUnknown_83A725C
	ldr r2, _08069F38 @ =gUnknown_83A7290
	movs r1, 0xF1
	movs r3, 0x1
	bl AGBAssert
_08069F2C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08069F34: .4byte gUnknown_83A725C
_08069F38: .4byte gUnknown_83A7290
	thumb_func_end sub_8069EFC

	thumb_func_start sub_8069F3C
sub_8069F3C: @ 8069F3C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 14
	ldr r1, _08069F6C @ =gUnknown_815FD60
	adds r1, r0, r1
	ldr r0, _08069F70 @ =gUnknown_8160450
	cmp r1, r0
	bcs _08069F74
	ldr r0, [r1]
	bl _call_via_r0
	strh r0, [r5]
	b _08069F80
	.align 2, 0
_08069F6C: .4byte gUnknown_815FD60
_08069F70: .4byte gUnknown_8160450
_08069F74:
	ldr r0, _08069F88 @ =gUnknown_83A725C
	ldr r1, _08069F8C @ =0x00000107
	ldr r2, _08069F90 @ =gUnknown_83A7290
	movs r3, 0x1
	bl AGBAssert
_08069F80:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08069F88: .4byte gUnknown_83A725C
_08069F8C: .4byte 0x00000107
_08069F90: .4byte gUnknown_83A7290
	thumb_func_end sub_8069F3C

	thumb_func_start sub_8069F94
sub_8069F94: @ 8069F94
	push {lr}
	bl sub_8069910
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8069F94

	thumb_func_start sub_8069FA4
sub_8069FA4: @ 8069FA4
	push {lr}
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8069FA4

	thumb_func_start sub_8069FB0
sub_8069FB0: @ 8069FB0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_80698D0
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8069FB0

	thumb_func_start sub_8069FC8
sub_8069FC8: @ 8069FC8
	push {lr}
	bl sub_80698E8
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8069FC8

	thumb_func_start sub_8069FD4
sub_8069FD4: @ 8069FD4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_80698D4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8069FD4

	thumb_func_start sub_8069FEC
sub_8069FEC: @ 8069FEC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl sub_8069910
	adds r2, r0, 0
	ldr r1, _0806A024 @ =gUnknown_83A7248
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0806A01A
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80698D0
_0806A01A:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A024: .4byte gUnknown_83A7248
	thumb_func_end sub_8069FEC

	thumb_func_start sub_806A028
sub_806A028: @ 806A028
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl sub_8069910
	adds r2, r0, 0
	ldr r1, _0806A060 @ =gUnknown_83A7248
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0806A056
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80698D4
_0806A056:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A060: .4byte gUnknown_83A7248
	thumb_func_end sub_806A028

	thumb_func_start sub_806A064
sub_806A064: @ 806A064
	push {r4,lr}
	ldr r4, [r0, 0x8]
	subs r4, 0x1
	bl sub_8069910
	ldr r1, _0806A07C @ =gUnknown_20370A8
	subs r0, r4
	str r0, [r1]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A07C: .4byte gUnknown_20370A8
	thumb_func_end sub_806A064

	thumb_func_start sub_806A080
sub_806A080: @ 806A080
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, _0806A0A0 @ =gUnknown_20370A8
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl sub_80698D0
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A0A0: .4byte gUnknown_20370A8
	thumb_func_end sub_806A080

	thumb_func_start sub_806A0A4
sub_806A0A4: @ 806A0A4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, _0806A0C4 @ =gUnknown_20370A8
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl sub_80698D4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A0C4: .4byte gUnknown_20370A8
	thumb_func_end sub_806A0A4

	thumb_func_start sub_806A0C8
sub_806A0C8: @ 806A0C8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl sub_8069910
	ldr r1, _0806A104 @ =gUnknown_20370A8
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _0806A108 @ =gUnknown_83A7248
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0806A0FA
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80698D0
_0806A0FA:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A104: .4byte gUnknown_20370A8
_0806A108: .4byte gUnknown_83A7248
	thumb_func_end sub_806A0C8

	thumb_func_start sub_806A10C
sub_806A10C: @ 806A10C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl sub_8069910
	ldr r1, _0806A148 @ =gUnknown_20370A8
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _0806A14C @ =gUnknown_83A7248
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0806A13E
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80698D4
_0806A13E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A148: .4byte gUnknown_20370A8
_0806A14C: .4byte gUnknown_83A7248
	thumb_func_end sub_806A10C

	thumb_func_start sub_806A150
sub_806A150: @ 806A150
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _0806A178 @ =gUnknown_8160450
	adds r1, r0
	ldr r0, _0806A17C @ =gUnknown_8160478
	cmp r1, r0
	bcs _0806A170
	ldr r1, [r1]
	adds r0, r2, 0
	bl sub_80698D0
_0806A170:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806A178: .4byte gUnknown_8160450
_0806A17C: .4byte gUnknown_8160478
	thumb_func_end sub_806A150

	thumb_func_start sub_806A180
sub_806A180: @ 806A180
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _0806A1A8 @ =gUnknown_8160450
	adds r1, r0
	ldr r0, _0806A1AC @ =gUnknown_8160478
	cmp r1, r0
	bcs _0806A1A0
	ldr r1, [r1]
	adds r0, r2, 0
	bl sub_80698D4
_0806A1A0:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806A1A8: .4byte gUnknown_8160450
_0806A1AC: .4byte gUnknown_8160478
	thumb_func_end sub_806A180

	thumb_func_start sub_806A1B0
sub_806A1B0: @ 806A1B0
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _0806A1F0 @ =gUnknown_83A7248
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0806A1E8
	lsls r0, r4, 2
	ldr r1, _0806A1F4 @ =gUnknown_8160450
	adds r1, r0, r1
	ldr r0, _0806A1F8 @ =gUnknown_8160478
	cmp r1, r0
	bcs _0806A1E8
	ldr r1, [r1]
	adds r0, r3, 0
	bl sub_80698D0
_0806A1E8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A1F0: .4byte gUnknown_83A7248
_0806A1F4: .4byte gUnknown_8160450
_0806A1F8: .4byte gUnknown_8160478
	thumb_func_end sub_806A1B0

	thumb_func_start sub_806A1FC
sub_806A1FC: @ 806A1FC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _0806A23C @ =gUnknown_83A7248
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0806A234
	lsls r0, r4, 2
	ldr r1, _0806A240 @ =gUnknown_8160450
	adds r1, r0, r1
	ldr r0, _0806A244 @ =gUnknown_8160478
	cmp r1, r0
	bcs _0806A234
	ldr r1, [r1]
	adds r0, r3, 0
	bl sub_80698D4
_0806A234:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A23C: .4byte gUnknown_83A7248
_0806A240: .4byte gUnknown_8160450
_0806A244: .4byte gUnknown_8160478
	thumb_func_end sub_806A1FC

	thumb_func_start sub_806A248
sub_806A248: @ 806A248
	push {lr}
	ldr r1, _0806A258 @ =gUnknown_20370A4
	ldr r1, [r1]
	bl sub_80698D0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806A258: .4byte gUnknown_20370A4
	thumb_func_end sub_806A248

	thumb_func_start sub_806A25C
sub_806A25C: @ 806A25C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069CD4
	adds r0, r4, 0
	bl sub_80697FC
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A25C

	thumb_func_start sub_806A274
sub_806A274: @ 806A274
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_80DA8E8
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A274

	thumb_func_start sub_806A28C
sub_806A28C: @ 806A28C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069E48
	adds r2, r0, 0
	cmp r2, 0
	beq _0806A2A8
	ldr r1, _0806A2B0 @ =gUnknown_20370A4
	ldr r0, [r4, 0x8]
	str r0, [r1]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80698D0
_0806A2A8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A2B0: .4byte gUnknown_20370A4
	thumb_func_end sub_806A28C

	thumb_func_start sub_806A2B4
sub_806A2B4: @ 806A2B4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl sub_8069910
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A2B4

	thumb_func_start sub_806A2D8
sub_806A2D8: @ 806A2D8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl sub_8069910
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldrb r0, [r0]
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A2D8

	thumb_func_start sub_806A2FC
sub_806A2FC: @ 806A2FC
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_8069910
	strb r4, [r0]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A2FC

	thumb_func_start sub_806A314
sub_806A314: @ 806A314
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r2, r0, 0
	adds r2, 0x64
	adds r2, r3
	ldrb r3, [r1]
	str r3, [r2]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_806A314

	thumb_func_start sub_806A330
sub_806A330: @ 806A330
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl sub_8069910
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldr r1, [r4]
	strb r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A330

	thumb_func_start sub_806A354
sub_806A354: @ 806A354
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r0, 0x64
	adds r3, r0, r3
	lsls r2, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0
	bx lr
	thumb_func_end sub_806A354

	thumb_func_start sub_806A374
sub_806A374: @ 806A374
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_8069910
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A374

	thumb_func_start sub_806A390
sub_806A390: @ 806A390
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_80698F8
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A390

	thumb_func_start sub_806A3B4
sub_806A3B4: @ 806A3B4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A3B4

	thumb_func_start sub_806A3E0
sub_806A3E0: @ 806A3E0
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A3E0

	thumb_func_start sub_806A40C
sub_806A40C: @ 806A40C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r0, r1
	bcs _0806A41E
	movs r0, 0
	b _0806A428
_0806A41E:
	cmp r0, r1
	beq _0806A426
	movs r0, 0x2
	b _0806A428
_0806A426:
	movs r0, 0x1
_0806A428:
	pop {r1}
	bx r1
	thumb_func_end sub_806A40C

	thumb_func_start sub_806A42C
sub_806A42C: @ 806A42C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, r4, 0
	adds r3, 0x64
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r3, r1
	ldrb r1, [r3]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A42C

	thumb_func_start sub_806A45C
sub_806A45C: @ 806A45C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A45C

	thumb_func_start sub_806A484
sub_806A484: @ 806A484
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r5, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	adds r0, r4, 0
	bl sub_8069910
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A484

	thumb_func_start sub_806A4B0
sub_806A4B0: @ 806A4B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	ldrb r0, [r0]
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	lsls r2, 2
	adds r1, r4, 0
	adds r1, 0x64
	adds r1, r2
	ldrb r1, [r1]
	adds r3, 0x1
	str r3, [r4, 0x8]
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A4B0

	thumb_func_start sub_806A4DC
sub_806A4DC: @ 806A4DC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	ldrb r0, [r0]
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A4DC

	thumb_func_start sub_806A4FC
sub_806A4FC: @ 806A4FC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8069910
	ldrb r5, [r0]
	adds r0, r4, 0
	bl sub_8069910
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A4FC

	thumb_func_start sub_806A520
sub_806A520: @ 806A520
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	ldrh r5, [r0]
	adds r0, r4, 0
	bl sub_80698F8
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A520

	thumb_func_start sub_806A550
sub_806A550: @ 806A550
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	ldrh r2, [r5]
	ldrh r1, [r0]
	adds r0, r2, 0
	bl sub_806A40C
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A550

	thumb_func_start sub_806A584
sub_806A584: @ 806A584
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_80698F8
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A584

	thumb_func_start sub_806A5AC
sub_806A5AC: @ 806A5AC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldrh r1, [r5]
	subs r1, r0
	strh r1, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A5AC

	thumb_func_start sub_806A5DC
sub_806A5DC: @ 806A5DC
	push {r4,r5,lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r5, _0806A60C @ =gUnknown_20370D0
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __umodsi3
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A60C: .4byte gUnknown_20370D0
	thumb_func_end sub_806A5DC

	thumb_func_start sub_806A610
sub_806A610: @ 806A610
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	ldr r5, _0806A658 @ =gUnknown_20370D0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_809A084
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	adds r0, r4, 0
	bl sub_809A824
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A658: .4byte gUnknown_20370D0
	thumb_func_end sub_806A610

	thumb_func_start sub_806A65C
sub_806A65C: @ 806A65C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	ldr r5, _0806A69C @ =gUnknown_20370D0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_809A1D8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A69C: .4byte gUnknown_20370D0
	thumb_func_end sub_806A65C

	thumb_func_start sub_806A6A0
sub_806A6A0: @ 806A6A0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	ldr r5, _0806A6E0 @ =gUnknown_20370D0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_809A000
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A6E0: .4byte gUnknown_20370D0
	thumb_func_end sub_806A6A0

	thumb_func_start sub_806A6E4
sub_806A6E4: @ 806A6E4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	ldr r5, _0806A724 @ =gUnknown_20370D0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8099F40
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A724: .4byte gUnknown_20370D0
	thumb_func_end sub_806A6E4

	thumb_func_start sub_806A728
sub_806A728: @ 806A728
	push {r4,lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0806A750 @ =gUnknown_20370D0
	bl sub_809A260
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A750: .4byte gUnknown_20370D0
	thumb_func_end sub_806A728

	thumb_func_start sub_806A754
sub_806A754: @ 806A754
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _0806A794 @ =gUnknown_20370D0
	adds r0, r4, 0
	bl sub_809A3C8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A794: .4byte gUnknown_20370D0
	thumb_func_end sub_806A754

	thumb_func_start sub_806A798
sub_806A798: @ 806A798
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _0806A7D8 @ =gUnknown_20370D0
	adds r0, r4, 0
	bl sub_809A374
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806A7D8: .4byte gUnknown_20370D0
	thumb_func_end sub_806A798

	thumb_func_start sub_806A7DC
sub_806A7DC: @ 806A7DC
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A7DC

	thumb_func_start sub_806A7F0
sub_806A7F0: @ 806A7F0
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A7F0

	thumb_func_start sub_806A804
sub_806A804: @ 806A804
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A804

	thumb_func_start sub_806A818
sub_806A818: @ 806A818
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A818

	thumb_func_start sub_806A82C
sub_806A82C: @ 806A82C
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E680
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A82C

	thumb_func_start sub_806A840
sub_806A840: @ 806A840
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E6A8
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A840

	thumb_func_start sub_806A854
sub_806A854: @ 806A854
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E6D0
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A854

	thumb_func_start sub_806A870
sub_806A870: @ 806A870
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_8054E90
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A870

	thumb_func_start sub_806A888
sub_806A888: @ 806A888
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl sub_8069910
	adds r6, r0, 0
	adds r0, r4, 0
	bl sub_8054EC4
	cmp r0, r6
	bcs _0806A8AA
	movs r0, 0
	b _0806A8B4
_0806A8AA:
	cmp r0, r6
	bne _0806A8B2
	movs r0, 0x1
	b _0806A8B4
_0806A8B2:
	movs r0, 0x2
_0806A8B4:
	strb r0, [r5, 0x2]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806A888

	thumb_func_start sub_806A8C0
sub_806A8C0: @ 806A8C0
	push {r4,lr}
	bl sub_80698F8
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8115748
	adds r0, r4, 0
	bl sub_80F85BC
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806A8C0

	thumb_func_start sub_806A8E0
sub_806A8E0: @ 806A8E0
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_807F028
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806A8E0

	thumb_func_start sub_806A8FC
sub_806A8FC: @ 806A8FC
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_8055D08
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A8FC

	thumb_func_start sub_806A918
sub_806A918: @ 806A918
	push {lr}
	ldr r0, _0806A92C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806A930
	movs r0, 0
	b _0806A932
	.align 2, 0
_0806A92C: .4byte gUnknown_2037AB8
_0806A930:
	movs r0, 0x1
_0806A932:
	pop {r1}
	bx r1
	thumb_func_end sub_806A918

	thumb_func_start sub_806A938
sub_806A938: @ 806A938
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	movs r1, 0
	bl sub_807A818
	ldr r1, _0806A95C @ =sub_806A918
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A95C: .4byte sub_806A918
	thumb_func_end sub_806A938

	thumb_func_start sub_806A960
sub_806A960: @ 806A960
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	lsls r1, 24
	asrs r1, 24
	bl sub_807A818
	ldr r1, _0806A98C @ =sub_806A918
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A98C: .4byte sub_806A918
	thumb_func_end sub_806A960

	thumb_func_start sub_806A990
sub_806A990: @ 806A990
	push {lr}
	ldr r1, _0806A9A4 @ =gUnknown_20370AE
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0806A9A8
	movs r0, 0
	b _0806A9AA
	.align 2, 0
_0806A9A4: .4byte gUnknown_20370AE
_0806A9A8:
	movs r0, 0x1
_0806A9AA:
	pop {r1}
	bx r1
	thumb_func_end sub_806A990

	thumb_func_start sub_806A9B0
sub_806A9B0: @ 806A9B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	ldr r1, _0806A9CC @ =gUnknown_20370AE
	strh r0, [r1]
	ldr r1, _0806A9D0 @ =sub_806A990
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806A9CC: .4byte gUnknown_20370AE
_0806A9D0: .4byte sub_806A990
	thumb_func_end sub_806A9B0

	thumb_func_start sub_806A9D4
sub_806A9D4: @ 806A9D4
	movs r0, 0
	bx lr
	thumb_func_end sub_806A9D4

	thumb_func_start sub_806A9D8
sub_806A9D8: @ 806A9D8
	movs r0, 0
	bx lr
	thumb_func_end sub_806A9D8

	thumb_func_start sub_806A9DC
sub_806A9DC: @ 806A9DC
	ldr r0, _0806A9F0 @ =gUnknown_20370B8
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0806A9F4 @ =gUnknown_20370BA
	strh r1, [r0]
	ldr r0, _0806A9F8 @ =gUnknown_20370BC
	strh r1, [r0]
	movs r0, 0
	bx lr
	.align 2, 0
_0806A9F0: .4byte gUnknown_20370B8
_0806A9F4: .4byte gUnknown_20370BA
_0806A9F8: .4byte gUnknown_20370BC
	thumb_func_end sub_806A9DC

	thumb_func_start sub_806A9FC
sub_806A9FC: @ 806A9FC
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_807B100
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806A9FC

	thumb_func_start sub_806AA18
sub_806AA18: @ 806AA18
	push {lr}
	bl sub_807B140
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806AA18

	thumb_func_start sub_806AA24
sub_806AA24: @ 806AA24
	push {lr}
	bl sub_807B1A4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806AA24

	thumb_func_start sub_806AA30
sub_806AA30: @ 806AA30
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_806E8D0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806AA30

	thumb_func_start sub_806AA48
sub_806AA48: @ 806AA48
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_8055D40
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806AA48

	thumb_func_start sub_806AA64
sub_806AA64: @ 806AA64
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805538C
	bl sub_807E438
	bl sub_80559E4
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AA64

	thumb_func_start sub_806AAEC
sub_806AAEC: @ 806AAEC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805538C
	bl sub_807E470
	bl sub_80559E4
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AAEC

	thumb_func_start sub_806AB74
sub_806AB74: @ 806AB74
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805538C
	bl sub_807E4DC
	bl sub_80559E4
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AB74

	thumb_func_start sub_806ABFC
sub_806ABFC: @ 806ABFC
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, [r0, 0x8]
	ldrb r6, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl sub_805C538
	cmp r6, 0xFF
	bne _0806AC3A
	cmp r5, 0xFF
	bne _0806AC3A
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8055688
	b _0806AC5E
_0806AC3A:
	lsls r0, r6, 24
	asrs r0, 24
	lsls r1, r5, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x4
	ldrb r3, [r3]
	subs r3, 0x7
	lsls r3, 24
	asrs r3, 24
	ldrb r4, [r4]
	subs r4, 0x7
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl sub_805538C
_0806AC5E:
	bl sub_807E548
	bl sub_80559E4
	movs r0, 0x1
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806ABFC

	thumb_func_start sub_806AC70
sub_806AC70: @ 806AC70
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805538C
	bl sub_807E59C
	bl sub_80559E4
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AC70

	thumb_func_start sub_806ACF8
sub_806ACF8: @ 806ACF8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805538C
	bl sub_805C6C4
	lsls r0, 24
	lsrs r0, 24
	bl sub_805DAE4
	bl sub_807E500
	bl sub_80559E4
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806ACF8

	thumb_func_start sub_806AD8C
sub_806AD8C: @ 806AD8C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805538C
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AD8C

	thumb_func_start sub_806AE0C
sub_806AE0C: @ 806AE0C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl sub_805541C
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AE0C

	thumb_func_start sub_806AE90
sub_806AE90: @ 806AE90
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_80555F8
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AE90

	thumb_func_start sub_806AF10
sub_806AF10: @ 806AF10
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805564C
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AF10

	thumb_func_start sub_806AF90
sub_806AF90: @ 806AF90
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_80555A0
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806AF90

	thumb_func_start sub_806B010
sub_806B010: @ 806B010
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	ldr r2, _0806B048 @ =gUnknown_3005008
	ldr r1, [r2]
	ldrh r1, [r1]
	strh r1, [r5]
	ldr r1, [r2]
	ldrh r1, [r1, 0x2]
	strh r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B048: .4byte gUnknown_3005008
	thumb_func_end sub_806B010

	thumb_func_start sub_806B04C
sub_806B04C: @ 806B04C
	push {r4,lr}
	ldr r4, _0806B064 @ =gUnknown_20370D0
	bl sub_8040C3C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B064: .4byte gUnknown_20370D0
	thumb_func_end sub_806B04C

	thumb_func_start sub_806B068
sub_806B068: @ 806B068
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_80722CC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B068

	thumb_func_start sub_806B07C
sub_806B07C: @ 806B07C
	push {lr}
	bl sub_80723E0
	lsls r0, 24
	cmp r0, 0
	beq _0806B08C
	movs r0, 0
	b _0806B08E
_0806B08C:
	movs r0, 0x1
_0806B08E:
	pop {r1}
	bx r1
	thumb_func_end sub_806B07C

	thumb_func_start sub_806B094
sub_806B094: @ 806B094
	push {lr}
	ldr r1, _0806B0A4 @ =sub_806B07C
	bl sub_80697F4
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806B0A4: .4byte sub_806B07C
	thumb_func_end sub_806B094

	thumb_func_start sub_806B0A8
sub_806B0A8: @ 806B0A8
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_8071C60
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B0A8

	thumb_func_start sub_806B0BC
sub_806B0BC: @ 806B0BC
	push {lr}
	bl sub_8071C9C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_806B0BC

	thumb_func_start sub_806B0CC
sub_806B0CC: @ 806B0CC
	push {lr}
	ldr r1, _0806B0DC @ =sub_806B0BC
	bl sub_80697F4
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806B0DC: .4byte sub_806B0BC
	thumb_func_end sub_806B0CC

	thumb_func_start sub_806B0E0
sub_806B0E0: @ 806B0E0
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r1, r0, 16
	adds r5, r1, 0
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _0806B11C @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806B114
	cmp r2, 0x1
	bne _0806B10E
	adds r0, r1, 0
	bl sub_8055E78
_0806B10E:
	adds r0, r5, 0
	bl sub_8071A74
_0806B114:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B11C: .4byte gUnknown_203ADFA
	thumb_func_end sub_806B0E0

	thumb_func_start sub_806B120
sub_806B120: @ 806B120
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_8055E78
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B120

	thumb_func_start sub_806B134
sub_806B134: @ 806B134
	push {lr}
	ldr r0, _0806B150 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806B148
	bl sub_8055F1C
_0806B148:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B150: .4byte gUnknown_203ADFA
	thumb_func_end sub_806B134

	thumb_func_start sub_806B154
sub_806B154: @ 806B154
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0806B178 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806B172
	adds r0, r1, 0
	bl sub_8055F48
_0806B172:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B178: .4byte gUnknown_203ADFA
	thumb_func_end sub_806B154

	thumb_func_start sub_806B17C
sub_806B17C: @ 806B17C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _0806B19C @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806B1A0
	movs r0, 0
	b _0806B1BE
	.align 2, 0
_0806B19C: .4byte gUnknown_203ADFA
_0806B1A0:
	cmp r1, 0
	beq _0806B1AE
	lsls r0, r1, 26
	lsrs r0, 24
	bl sub_8071D64
	b _0806B1B4
_0806B1AE:
	movs r0, 0x4
	bl sub_8071D64
_0806B1B4:
	ldr r1, _0806B1C4 @ =sub_8071D7C
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
_0806B1BE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B1C4: .4byte sub_8071D7C
	thumb_func_end sub_806B17C

	thumb_func_start sub_806B1C8
sub_806B1C8: @ 806B1C8
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _0806B1F0 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806B1FA
	cmp r2, 0
	beq _0806B1F4
	lsls r0, r2, 26
	lsrs r0, 24
	bl sub_8071DA4
	b _0806B1FA
	.align 2, 0
_0806B1F0: .4byte gUnknown_203ADFA
_0806B1F4:
	movs r0, 0x4
	bl sub_8071DA4
_0806B1FA:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B1C8

	thumb_func_start sub_806B200
sub_806B200: @ 806B200
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_8069910
	adds r3, r0, 0
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r1, _0806B23C @ =gUnknown_3005008
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_8097434
	ldr r0, _0806B240 @ =gUnknown_20370B0
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B23C: .4byte gUnknown_3005008
_0806B240: .4byte gUnknown_20370B0
	thumb_func_end sub_806B200

	thumb_func_start sub_806B244
sub_806B244: @ 806B244
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_8069910
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_8097434
	ldr r0, _0806B284 @ =gUnknown_20370B0
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B284: .4byte gUnknown_20370B0
	thumb_func_end sub_806B244

	thumb_func_start sub_806B288
sub_806B288: @ 806B288
	push {lr}
	ldr r0, _0806B2A4 @ =gUnknown_20370B0
	ldrb r0, [r0]
	ldr r1, _0806B2A8 @ =gUnknown_20370B4
	ldrb r1, [r1]
	ldr r2, _0806B2AC @ =gUnknown_20370B2
	ldrb r2, [r2]
	bl sub_809748C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806B2A4: .4byte gUnknown_20370B0
_0806B2A8: .4byte gUnknown_20370B4
_0806B2AC: .4byte gUnknown_20370B2
	thumb_func_end sub_806B288

	thumb_func_start sub_806B2B0
sub_806B2B0: @ 806B2B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806B2CC
	ldr r0, _0806B2F0 @ =gUnknown_20370B0
	strh r1, [r0]
_0806B2CC:
	ldr r1, _0806B2F4 @ =gUnknown_20370B2
	ldr r0, _0806B2F8 @ =gUnknown_3005008
	ldr r2, [r0]
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _0806B2FC @ =gUnknown_20370B4
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _0806B300 @ =sub_806B288
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B2F0: .4byte gUnknown_20370B0
_0806B2F4: .4byte gUnknown_20370B2
_0806B2F8: .4byte gUnknown_3005008
_0806B2FC: .4byte gUnknown_20370B4
_0806B300: .4byte sub_806B288
	thumb_func_end sub_806B2B0

	thumb_func_start sub_806B304
sub_806B304: @ 806B304
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806B320
	ldr r0, _0806B348 @ =gUnknown_20370B0
	strh r1, [r0]
_0806B320:
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _0806B34C @ =gUnknown_20370B2
	strh r2, [r0]
	ldr r0, _0806B350 @ =gUnknown_20370B4
	strh r1, [r0]
	ldr r1, _0806B354 @ =sub_806B288
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B348: .4byte gUnknown_20370B0
_0806B34C: .4byte gUnknown_20370B2
_0806B350: .4byte gUnknown_20370B4
_0806B354: .4byte sub_806B288
	thumb_func_end sub_806B304

	thumb_func_start sub_806B358
sub_806B358: @ 806B358
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B37C @ =gUnknown_3005008
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805E4C8
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B37C: .4byte gUnknown_3005008
	thumb_func_end sub_806B358

	thumb_func_start sub_806B380
sub_806B380: @ 806B380
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_805E4C8
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B380

	thumb_func_start sub_806B3B0
sub_806B3B0: @ 806B3B0
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B3D4 @ =gUnknown_3005008
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805E898
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B3D4: .4byte gUnknown_3005008
	thumb_func_end sub_806B3B0

	thumb_func_start sub_806B3D8
sub_806B3D8: @ 806B3D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_805E898
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B3D8

	thumb_func_start sub_806B408
sub_806B408: @ 806B408
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0806B46C @ =gUnknown_3005008
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	lsls r4, 16
	asrs r4, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	adds r3, r4, 0
	bl sub_805F7C4
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806B46C: .4byte gUnknown_3005008
	thumb_func_end sub_806B408

	thumb_func_start sub_806B470
sub_806B470: @ 806B470
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r2, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80550D8
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806B470

	thumb_func_start sub_806B4C8
sub_806B4C8: @ 806B4C8
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B4EC @ =gUnknown_3005008
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805FE94
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B4EC: .4byte gUnknown_3005008
	thumb_func_end sub_806B4C8

	thumb_func_start sub_806B4F0
sub_806B4F0: @ 806B4F0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	bl sub_805F314
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B4F0

	thumb_func_start sub_806B520
sub_806B520: @ 806B520
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	bl sub_805F314
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B520

	thumb_func_start sub_806B550
sub_806B550: @ 806B550
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r3, [r5, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r5, 0x8]
	ldrb r1, [r3]
	adds r4, r3, 0x1
	str r4, [r5, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r5, 0x8]
	lsls r0, 24
	lsrs r0, 24
	adds r3, 0x53
	lsls r3, 24
	lsrs r3, 24
	bl sub_805F3A8
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806B550

	thumb_func_start sub_806B58C
sub_806B58C: @ 806B58C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_805F400
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B58C

	thumb_func_start sub_806B5BC
sub_806B5BC: @ 806B5BC
	push {r4,lr}
	ldr r2, _0806B5EC @ =gUnknown_2036E38
	ldr r0, _0806B5F0 @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _0806B5E4
	bl sub_805C6C4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80642C8
_0806B5E4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B5EC: .4byte gUnknown_2036E38
_0806B5F0: .4byte gUnknown_3005074
	thumb_func_end sub_806B5BC

	thumb_func_start sub_806B5F4
sub_806B5F4: @ 806B5F4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r1, [r4, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806B624 @ =gUnknown_3005008
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805F268
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B624: .4byte gUnknown_3005008
	thumb_func_end sub_806B5F4

	thumb_func_start sub_806B628
sub_806B628: @ 806B628
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8055114
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B628

	thumb_func_start sub_806B650
sub_806B650: @ 806B650
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r4, 16
	asrs r4, 16
	lsls r3, 16
	asrs r3, 16
	str r2, [sp]
	str r1, [sp, 0x4]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805E9F8
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806B650

	thumb_func_start sub_806B6C0
sub_806B6C0: @ 806B6C0
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_8069058
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B6C0

	thumb_func_start sub_806B6DC
sub_806B6DC: @ 806B6DC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805642C
	cmp r0, 0
	bne _0806B6FC
	bl sub_80695B4
	ldr r1, _0806B6F8 @ =sub_8069590
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	b _0806B6FE
	.align 2, 0
_0806B6F8: .4byte sub_8069590
_0806B6FC:
	movs r0, 0
_0806B6FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B6DC

	thumb_func_start sub_806B704
sub_806B704: @ 806B704
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805642C
	cmp r0, 0
	beq _0806B714
	movs r0, 0
	b _0806B752
_0806B714:
	ldr r2, _0806B738 @ =gUnknown_2036E38
	ldr r0, _0806B73C @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0806B744
	bl sub_806966C
	ldr r1, _0806B740 @ =sub_8069648
	adds r0, r4, 0
	bl sub_80697F4
	b _0806B750
	.align 2, 0
_0806B738: .4byte gUnknown_2036E38
_0806B73C: .4byte gUnknown_3005074
_0806B740: .4byte sub_8069648
_0806B744:
	bl sub_80695B4
	ldr r1, _0806B758 @ =sub_8069590
	adds r0, r4, 0
	bl sub_80697F4
_0806B750:
	movs r0, 0x1
_0806B752:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B758: .4byte sub_8069590
	thumb_func_end sub_806B704

	thumb_func_start sub_806B75C
sub_806B75C: @ 806B75C
	push {lr}
	bl sub_80694F4
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl sub_805DF60
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806B790 @ =gUnknown_2036E38
	adds r0, r1
	bl sub_8063D7C
	bl sub_80974D8
	bl sub_8068A5C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806B790: .4byte gUnknown_2036E38
	thumb_func_end sub_806B75C

	thumb_func_start sub_806B794
sub_806B794: @ 806B794
	push {r4,lr}
	bl sub_80694F4
	ldr r4, _0806B7E4 @ =gUnknown_2036E38
	ldr r0, _0806B7E8 @ =gUnknown_3005074
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0806B7B6
	adds r0, r1, 0
	bl sub_8063D7C
_0806B7B6:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl sub_805DF60
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_8063D7C
	bl sub_80974D8
	bl sub_8068A5C
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B7E4: .4byte gUnknown_2036E38
_0806B7E8: .4byte gUnknown_3005074
	thumb_func_end sub_806B794

	thumb_func_start sub_806B7EC
sub_806B7EC: @ 806B7EC
	ldr r2, _0806B804 @ =gUnknown_20370DC
	ldr r3, _0806B808 @ =gUnknown_20370DA
	ldrh r1, [r3]
	strh r1, [r2]
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	strh r2, [r3]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_0806B804: .4byte gUnknown_20370DC
_0806B808: .4byte gUnknown_20370DA
	thumb_func_end sub_806B7EC

	thumb_func_start sub_806B80C
sub_806B80C: @ 806B80C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	cmp r0, 0
	bne _0806B81A
	ldr r0, [r4, 0x64]
_0806B81A:
	bl sub_806943C
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B80C

	thumb_func_start sub_806B828
sub_806B828: @ 806B828
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	cmp r0, 0
	bne _0806B836
	ldr r0, [r4, 0x64]
_0806B836:
	bl sub_80F7974
	bl sub_80F793C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_8003F20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B828

	thumb_func_start sub_806B850
sub_806B850: @ 806B850
	push {lr}
	bl sub_80F7998
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B850

	thumb_func_start sub_806B85C
sub_806B85C: @ 806B85C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	cmp r0, 0
	bne _0806B86A
	ldr r0, [r4, 0x64]
_0806B86A:
	bl sub_8069464
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B85C

	thumb_func_start sub_806B878
sub_806B878: @ 806B878
	push {lr}
	ldr r1, _0806B888 @ =sub_806951C
	bl sub_80697F4
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806B888: .4byte sub_806951C
	thumb_func_end sub_806B878

	thumb_func_start sub_806B88C
sub_806B88C: @ 806B88C
	push {lr}
	bl sub_80694F4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806B88C

	thumb_func_start sub_806B898
sub_806B898: @ 806B898
	push {r4,lr}
	ldr r0, _0806B8F0 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0806B922
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0806B922
	ldr r4, _0806B8F4 @ =gUnknown_3005070
	ldr r0, [r4]
	bl sub_806B93C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B906
	ldr r0, [r4]
	bl sub_806B96C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8069998
	cmp r4, 0
	beq _0806B906
	ldr r0, _0806B8F8 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0806B906
	bl sub_80699F8
	adds r0, r4, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806B8FC
	bl sub_8069964
	b _0806B922
	.align 2, 0
_0806B8F0: .4byte gUnknown_30030F0
_0806B8F4: .4byte gUnknown_3005070
_0806B8F8: .4byte gUnknown_203ADFA
_0806B8FC:
	bl sub_80699A4
	bl sub_8069970
	b _0806B922
_0806B906:
	bl sub_8112CAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806B91A
	ldr r0, _0806B928 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0806B934
_0806B91A:
	ldr r1, _0806B92C @ =gUnknown_20370AC
	ldrb r0, [r1]
	cmp r0, 0x78
	bne _0806B930
_0806B922:
	movs r0, 0x1
	b _0806B936
	.align 2, 0
_0806B928: .4byte gUnknown_203ADFA
_0806B92C: .4byte gUnknown_20370AC
_0806B930:
	adds r0, 0x1
	strb r0, [r1]
_0806B934:
	movs r0, 0
_0806B936:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806B898

	thumb_func_start sub_806B93C
sub_806B93C: @ 806B93C
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0806B958
	ldrb r1, [r2]
	subs r1, 0x1
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0]
_0806B958:
	subs r0, 0x6B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806B966
	movs r0, 0x1
	b _0806B968
_0806B966:
	movs r0, 0
_0806B968:
	pop {r1}
	bx r1
	thumb_func_end sub_806B93C

	thumb_func_start sub_806B96C
sub_806B96C: @ 806B96C
	push {lr}
	ldr r2, _0806B988 @ =gUnknown_30030F0
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0806B990
	ldr r0, _0806B98C @ =gUnknown_20370D4
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _0806B990
	movs r0, 0x1
	b _0806BA36
	.align 2, 0
_0806B988: .4byte gUnknown_30030F0
_0806B98C: .4byte gUnknown_20370D4
_0806B990:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806B9AC
	ldr r0, _0806B9A8 @ =gUnknown_20370D4
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _0806B9AC
	movs r0, 0x2
	b _0806BA36
	.align 2, 0
_0806B9A8: .4byte gUnknown_20370D4
_0806B9AC:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806B9C8
	ldr r0, _0806B9C4 @ =gUnknown_20370D4
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _0806B9C8
	movs r0, 0x3
	b _0806BA36
	.align 2, 0
_0806B9C4: .4byte gUnknown_20370D4
_0806B9C8:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0806B9E4
	ldr r0, _0806B9E0 @ =gUnknown_20370D4
	ldrh r0, [r0]
	cmp r0, 0x4
	beq _0806B9E4
	movs r0, 0x4
	b _0806BA36
	.align 2, 0
_0806B9E0: .4byte gUnknown_20370D4
_0806B9E4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0806B9F4
	movs r0, 0x5
	b _0806BA36
_0806B9F4:
	ldrh r2, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0806BA04
	movs r0, 0x6
	b _0806BA36
_0806BA04:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0806BA10
	movs r0, 0x7
	b _0806BA36
_0806BA10:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _0806BA1C
	movs r0, 0x8
	b _0806BA36
_0806BA1C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806BA28
	movs r0, 0x9
	b _0806BA36
_0806BA28:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0806BA34
	movs r0, 0
	b _0806BA36
_0806BA34:
	movs r0, 0xA
_0806BA36:
	pop {r1}
	bx r1
	thumb_func_end sub_806B96C

	thumb_func_start sub_806BA3C
sub_806BA3C: @ 806BA3C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0806BA70 @ =gUnknown_3005070
	str r4, [r0]
	bl sub_8112CAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BA58
	ldr r0, _0806BA74 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0806BA5E
_0806BA58:
	ldr r1, _0806BA78 @ =gUnknown_20370AC
	movs r0, 0
	strb r0, [r1]
_0806BA5E:
	ldr r1, _0806BA7C @ =sub_806B898
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BA70: .4byte gUnknown_3005070
_0806BA74: .4byte gUnknown_203ADFA
_0806BA78: .4byte gUnknown_20370AC
_0806BA7C: .4byte sub_806B898
	thumb_func_end sub_806BA3C

	thumb_func_start sub_806BA80
sub_806BA80: @ 806BA80
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_809CDEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BAA2
	movs r0, 0
	b _0806BAA8
_0806BAA2:
	bl sub_8069B28
	movs r0, 0x1
_0806BAA8:
	pop {r1}
	bx r1
	thumb_func_end sub_806BA80

	thumb_func_start sub_806BAAC
sub_806BAAC: @ 806BAAC
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl sub_809C9B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BADA
	movs r0, 0
	b _0806BAE0
_0806BADA:
	bl sub_8069B28
	movs r0, 0x1
_0806BAE0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806BAAC

	thumb_func_start sub_806BAE8
sub_806BAE8: @ 806BAE8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_809CA04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BB26
	movs r0, 0
	b _0806BB2C
_0806BB26:
	bl sub_8069B28
	movs r0, 0x1
_0806BB2C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806BAE8

	thumb_func_start sub_806BB38
sub_806BB38: @ 806BB38
	movs r0, 0
	bx lr
	thumb_func_end sub_806BB38

	thumb_func_start sub_806BB3C
sub_806BB3C: @ 806BB3C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_809CEC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BB7A
	movs r0, 0
	b _0806BB80
_0806BB7A:
	bl sub_8069B28
	movs r0, 0x1
_0806BB80:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806BB3C

	thumb_func_start sub_806BB8C
sub_806BB8C: @ 806BB8C
	ldr r1, [r0, 0x8]
	adds r1, 0x4
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_806BB8C

	thumb_func_start sub_806BB98
sub_806BB98: @ 806BB98
	movs r0, 0
	bx lr
	thumb_func_end sub_806BB98

	thumb_func_start sub_806BB9C
sub_806BB9C: @ 806BB9C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r4, 0
	bl sub_809D2F0
	adds r0, r4, 0
	movs r1, 0
	bl sub_8071F24
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806BB9C

	thumb_func_start sub_806BBD8
sub_806BBD8: @ 806BBD8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D3CC
	adds r1, r0, 0
	cmp r1, 0
	beq _0806BBF0
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	b _0806BBF2
_0806BBF0:
	movs r0, 0
_0806BBF2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806BBD8

	thumb_func_start sub_806BBF8
sub_806BBF8: @ 806BBF8
	ldr r1, [r0, 0x8]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_806BBF8

	thumb_func_start sub_806BC04
sub_806BC04: @ 806BC04
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r0, 0
	bl sub_8069910
	adds r4, r0, 0
	cmp r4, 0
	bne _0806BC16
	ldr r4, [r5, 0x64]
_0806BC16:
	bl sub_80F6E9C
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6EE4
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r1, 0x6
	adds r2, r4, 0
	movs r3, 0
	bl sub_8002C48
	movs r0, 0
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806BC04

	thumb_func_start sub_806BC40
sub_806BC40: @ 806BC40
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r1, r0, 0
	cmp r1, 0
	bne _0806BC50
	ldr r1, [r4, 0x64]
_0806BC50:
	ldr r4, _0806BC68 @ =gUnknown_20370C0
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x6
	bl sub_8005ED4
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BC68: .4byte gUnknown_20370C0
	thumb_func_end sub_806BC40

	thumb_func_start sub_806BC6C
sub_806BC6C: @ 806BC6C
	push {lr}
	bl sub_8069910
	ldr r1, _0806BC84 @ =gUnknown_20370A8
	ldr r1, [r1]
	subs r0, r1
	bl sub_806943C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806BC84: .4byte gUnknown_20370A8
	thumb_func_end sub_806BC6C

	thumb_func_start sub_806BC88
sub_806BC88: @ 806BC88
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806BCC0 @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xB
	muls r1, r0
	ldr r0, _0806BCC4 @ =gUnknown_8245EE0
	adds r1, r0
	adds r0, r2, 0
	bl sub_8008D84
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BCC0: .4byte gUnknown_83A7294
_0806BCC4: .4byte gUnknown_8245EE0
	thumb_func_end sub_806BC88

	thumb_func_start sub_806BCC8
sub_806BCC8: @ 806BCC8
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _0806BD08 @ =gUnknown_83A7294
	lsls r2, 2
	adds r2, r0
	ldr r4, [r2]
	bl sub_80CACFC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806BD0C @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	movs r1, 0xB
	muls r1, r0
	ldr r0, _0806BD10 @ =gUnknown_8245EE0
	adds r1, r0
	adds r0, r4, 0
	bl sub_8008D84
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD08: .4byte gUnknown_83A7294
_0806BD0C: .4byte gUnknown_2024284
_0806BD10: .4byte gUnknown_8245EE0
	thumb_func_end sub_806BCC8

	thumb_func_start sub_806BD14
sub_806BD14: @ 806BD14
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806BD54 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _0806BD58 @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r1
	ldr r4, [r4]
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_803FBE8
	adds r0, r4, 0
	bl sub_8008D28
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD54: .4byte gUnknown_2024284
_0806BD58: .4byte gUnknown_83A7294
	thumb_func_end sub_806BD14

	thumb_func_start sub_806BD5C
sub_806BD5C: @ 806BD5C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806BD8C @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r1
	ldr r1, [r4]
	bl sub_8099E90
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD8C: .4byte gUnknown_83A7294
	thumb_func_end sub_806BD5C

	thumb_func_start sub_806BD90
sub_806BD90: @ 806BD90
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r7, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _0806BDE4 @ =gUnknown_83A7294
	lsls r0, r7, 2
	adds r0, r1
	ldr r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8099E90
	cmp r5, 0x4
	bne _0806BDEC
	cmp r6, 0x1
	bls _0806BDEC
	ldr r1, _0806BDE8 @ =gUnknown_83A72A0
	adds r0, r4, 0
	bl sub_8008DA4
	b _0806BE22
	.align 2, 0
_0806BDE4: .4byte gUnknown_83A7294
_0806BDE8: .4byte gUnknown_83A72A0
_0806BDEC:
	adds r0, r5, 0
	subs r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x29
	bhi _0806BE22
	cmp r6, 0x1
	bls _0806BE22
	ldr r0, _0806BE2C @ =gUnknown_83A7294
	lsls r1, r7, 2
	adds r1, r0
	ldr r4, [r1]
	adds r0, r4, 0
	bl sub_8008E08
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _0806BE22
	adds r0, r4, r0
	subs r0, 0x1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _0806BE30 @ =gUnknown_83A72A2
	adds r0, r4, 0
	bl sub_8008DA4
_0806BE22:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806BE2C: .4byte gUnknown_83A7294
_0806BE30: .4byte gUnknown_83A72A2
	thumb_func_end sub_806BD90

	thumb_func_start sub_806BE34
sub_806BE34: @ 806BE34
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806BE34

	thumb_func_start sub_806BE50
sub_806BE50: @ 806BE50
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806BE88 @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xD
	muls r1, r0
	ldr r0, _0806BE8C @ =gUnknown_8247094
	adds r1, r0
	adds r0, r2, 0
	bl sub_8008D84
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BE88: .4byte gUnknown_83A7294
_0806BE8C: .4byte gUnknown_8247094
	thumb_func_end sub_806BE50

	thumb_func_start sub_806BE90
sub_806BE90: @ 806BE90
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_80CBF04
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0806BED0 @ =gUnknown_83A7294
	lsls r5, 2
	adds r5, r0
	ldr r0, [r5]
	adds r1, r4, 0
	movs r2, 0
	bl sub_8008E78
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806BED0: .4byte gUnknown_83A7294
	thumb_func_end sub_806BE90

	thumb_func_start sub_806BED4
sub_806BED4: @ 806BED4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	ldr r1, _0806BF0C @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	ldr r1, _0806BF10 @ =gUnknown_83E06B8
	lsrs r0, 14
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl sub_8008D84
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BF0C: .4byte gUnknown_83A7294
_0806BF10: .4byte gUnknown_83E06B8
	thumb_func_end sub_806BED4

	thumb_func_start sub_806BF14
sub_806BF14: @ 806BF14
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, _0806BF38 @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl sub_8008D84
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BF38: .4byte gUnknown_83A7294
	thumb_func_end sub_806BF14

	thumb_func_start sub_806BF3C
sub_806BF3C: @ 806BF3C
	push {lr}
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, _0806BF58 @ =gUnknown_20370A8
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _0806BF5C @ =gUnknown_2021D18
	bl sub_8008FCC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806BF58: .4byte gUnknown_20370A8
_0806BF5C: .4byte gUnknown_2021D18
	thumb_func_end sub_806BF3C

	thumb_func_start sub_806BF60
sub_806BF60: @ 806BF60
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_8069910
	adds r1, r0, 0
	ldr r0, _0806BF8C @ =gUnknown_20370A8
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _0806BF90 @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl sub_8008D84
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BF8C: .4byte gUnknown_20370A8
_0806BF90: .4byte gUnknown_83A7294
	thumb_func_end sub_806BF60

	thumb_func_start sub_806BF94
sub_806BF94: @ 806BF94
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r1, _0806BFCC @ =gUnknown_83A7294
	lsls r4, 2
	adds r4, r1
	ldr r4, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl sub_808BD6C
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8008D84
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BFCC: .4byte gUnknown_83A7294
	thumb_func_end sub_806BF94

	thumb_func_start sub_806BFD0
sub_806BFD0: @ 806BFD0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl sub_8069910
	mov r8, r0
	adds r0, r4, 0
	bl sub_8069910
	ldr r1, [r4, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	ldr r4, _0806C04C @ =gUnknown_20370D0
	str r0, [sp]
	str r2, [sp, 0x4]
	adds r0, r6, 0
	mov r1, r9
	adds r2, r5, 0
	mov r3, r8
	bl sub_80A011C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806C04C: .4byte gUnknown_20370D0
	thumb_func_end sub_806BFD0

	thumb_func_start sub_806C050
sub_806C050: @ 806C050
	push {r4,lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0806C078 @ =gUnknown_20370D0
	bl sub_80A01AC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C078: .4byte gUnknown_20370D0
	thumb_func_end sub_806C050

	thumb_func_start sub_806C07C
sub_806C07C: @ 806C07C
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_80A02FC
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806C07C

	thumb_func_start sub_806C0A8
sub_806C0A8: @ 806C0A8
	push {r4-r7,lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _0806C0BC @ =gUnknown_20370D0
	movs r0, 0x6
	strh r0, [r1]
	movs r6, 0
	b _0806C0F6
	.align 2, 0
_0806C0BC: .4byte gUnknown_20370D0
_0806C0C0:
	adds r0, r4, 0
	movs r1, 0x2D
	bl sub_803FBE8
	cmp r0, 0
	bne _0806C0F0
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_8125AC0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C0F0
	ldr r0, _0806C0E8 @ =gUnknown_20370D0
	strh r6, [r0]
	ldr r0, _0806C0EC @ =gUnknown_20370C0
	strh r5, [r0]
	b _0806C116
	.align 2, 0
_0806C0E8: .4byte gUnknown_20370D0
_0806C0EC: .4byte gUnknown_20370C0
_0806C0F0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0806C0F6:
	cmp r6, 0x5
	bhi _0806C116
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _0806C120 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _0806C0C0
_0806C116:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806C120: .4byte gUnknown_2024284
	thumb_func_end sub_806C0A8

	thumb_func_start sub_806C124
sub_806C124: @ 806C124
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806C14A
	ldr r0, _0806C154 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	bl sub_809FDA0
_0806C14A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C154: .4byte gUnknown_3005008
	thumb_func_end sub_806C124

	thumb_func_start sub_806C158
sub_806C158: @ 806C158
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806C17E
	ldr r0, _0806C188 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	bl sub_809FDD8
_0806C17E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C188: .4byte gUnknown_3005008
	thumb_func_end sub_806C158

	thumb_func_start sub_806C18C
sub_806C18C: @ 806C18C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069910
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806C1BA
	ldr r4, _0806C1C4 @ =gUnknown_20370D0
	ldr r0, _0806C1C8 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	bl sub_809FD88
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_0806C1BA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C1C4: .4byte gUnknown_20370D0
_0806C1C8: .4byte gUnknown_3005008
	thumb_func_end sub_806C18C

	thumb_func_start sub_806C1CC
sub_806C1CC: @ 806C1CC
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _0806C20A
	ldr r0, _0806C214 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806C20A
	ldr r0, _0806C218 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl sub_809FD58
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_809FFB8
_0806C20A:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806C214: .4byte sub_809D6D4
_0806C218: .4byte gUnknown_3005008
	thumb_func_end sub_806C1CC

	thumb_func_start sub_806C21C
sub_806C21C: @ 806C21C
	push {lr}
	bl sub_80A0034
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C21C

	thumb_func_start sub_806C228
sub_806C228: @ 806C228
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x1
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _0806C24E
	ldr r0, _0806C254 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl sub_809FD58
	bl sub_809FFA0
_0806C24E:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C254: .4byte gUnknown_3005008
	thumb_func_end sub_806C228

	thumb_func_start sub_806C258
sub_806C258: @ 806C258
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _0806C290 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806C286
	bl sub_80D0554
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80D072C
_0806C286:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806C290: .4byte sub_809D6D4
	thumb_func_end sub_806C258

	thumb_func_start sub_806C294
sub_806C294: @ 806C294
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x2
	str r1, [r0, 0x8]
	bl sub_80D07C8
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C294

	thumb_func_start sub_806C2A8
sub_806C2A8: @ 806C2A8
	push {lr}
	ldr r1, [r0, 0x8]
	adds r1, 0x2
	str r1, [r0, 0x8]
	bl sub_80D0554
	lsls r0, 16
	lsrs r0, 16
	bl sub_80D06D0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C2A8

	thumb_func_start sub_806C2C4
sub_806C2C4: @ 806C2C4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	bl sub_8080228
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806C2C4

	thumb_func_start sub_806C2D8
sub_806C2D8: @ 806C2D8
	push {lr}
	bl sub_8080464
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C2D8

	thumb_func_start sub_806C2E4
sub_806C2E4: @ 806C2E4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80805E8
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806C2E4

	thumb_func_start sub_806C2F8
sub_806C2F8: @ 806C2F8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8080600
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806C2F8

	thumb_func_start sub_806C30C
sub_806C30C: @ 806C30C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_8080424
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806C30C

	thumb_func_start sub_806C330
sub_806C330: @ 806C330
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_808043C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C330

	thumb_func_start sub_806C34C
sub_806C34C: @ 806C34C
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_8080450
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C34C

	thumb_func_start sub_806C368
sub_806C368: @ 806C368
	push {r4-r6,lr}
	adds r4, r0, 0
	bl sub_80698F8
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r0, [r4, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl sub_80698F8
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80A029C
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806C368

	thumb_func_start sub_806C39C
sub_806C39C: @ 806C39C
	push {lr}
	bl sub_807F8C4
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C39C

	thumb_func_start sub_806C3AC
sub_806C3AC: @ 806C3AC
	push {lr}
	bl sub_8069910
	bl sub_809C164
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C3AC

	thumb_func_start sub_806C3C0
sub_806C3C0: @ 806C3C0
	push {lr}
	bl sub_8069910
	bl sub_809C1A0
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C3C0

	thumb_func_start sub_806C3D4
sub_806C3D4: @ 806C3D4
	push {lr}
	bl sub_8069910
	bl sub_809C1BC
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C3D4

	thumb_func_start sub_806C3E8
sub_806C3E8: @ 806C3E8
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806C40C @ =sub_80568E0
	bl sub_813F804
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C40C: .4byte sub_80568E0
	thumb_func_end sub_806C3E8

	thumb_func_start sub_806C410
sub_806C410: @ 806C410
	movs r0, 0
	bx lr
	thumb_func_end sub_806C410

	thumb_func_start sub_806C414
sub_806C414: @ 806C414
	movs r0, 0
	bx lr
	thumb_func_end sub_806C414

	thumb_func_start sub_806C418
sub_806C418: @ 806C418
	push {lr}
	bl sub_8069B28
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806C418

	thumb_func_start sub_806C424
sub_806C424: @ 806C424
	movs r0, 0
	bx lr
	thumb_func_end sub_806C424

	thumb_func_start sub_806C428
sub_806C428: @ 806C428
	movs r0, 0
	bx lr
	thumb_func_end sub_806C428

	thumb_func_start sub_806C42C
sub_806C42C: @ 806C42C
	movs r0, 0
	bx lr
	thumb_func_end sub_806C42C

	thumb_func_start sub_806C430
sub_806C430: @ 806C430
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0806C454 @ =gUnknown_20370B6
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8083444
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C454: .4byte gUnknown_20370B6
	thumb_func_end sub_806C430

	thumb_func_start sub_806C458
sub_806C458: @ 806C458
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r1, _0806C484 @ =gUnknown_20386E0
	lsls r4, 2
	adds r4, r1
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C484: .4byte gUnknown_20386E0
	thumb_func_end sub_806C458

	thumb_func_start sub_806C488
sub_806C488: @ 806C488
	push {lr}
	ldr r0, _0806C49C @ =gUnknown_20370B6
	ldrb r0, [r0]
	bl sub_808382C
	lsls r0, 24
	cmp r0, 0
	beq _0806C4A0
	movs r0, 0
	b _0806C4A2
	.align 2, 0
_0806C49C: .4byte gUnknown_20370B6
_0806C4A0:
	movs r0, 0x1
_0806C4A2:
	pop {r1}
	bx r1
	thumb_func_end sub_806C488

	thumb_func_start sub_806C4A8
sub_806C4A8: @ 806C4A8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	ldr r1, _0806C4CC @ =gUnknown_20370B6
	strh r0, [r1]
	ldr r1, _0806C4D0 @ =sub_806C488
	adds r0, r4, 0
	bl sub_80697F4
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C4CC: .4byte gUnknown_20370B6
_0806C4D0: .4byte sub_806C488
	thumb_func_end sub_806C4A8

	thumb_func_start sub_806C4D4
sub_806C4D4: @ 806C4D4
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 24
	lsrs r0, 24
	bl sub_80554CC
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C4D4

	thumb_func_start sub_806C4F0
sub_806C4F0: @ 806C4F0
	ldr r1, _0806C500 @ =gUnknown_20370D0
	ldr r0, _0806C504 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	movs r0, 0
	bx lr
	.align 2, 0
_0806C500: .4byte gUnknown_20370D0
_0806C504: .4byte gUnknown_300500C
	thumb_func_end sub_806C4F0

	thumb_func_start sub_806C508
sub_806C508: @ 806C508
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8071F24
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806C508

	thumb_func_start sub_806C540
sub_806C540: @ 806C540
	push {lr}
	ldr r1, _0806C550 @ =sub_80721A0
	bl sub_80697F4
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C550: .4byte sub_80721A0
	thumb_func_end sub_806C540

	thumb_func_start sub_806C554
sub_806C554: @ 806C554
	push {r4-r7,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	adds r1, r6, 0x7
	lsls r1, 16
	lsrs r6, r1, 16
	adds r1, r5, 0x7
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r0, 0
	bne _0806C5B8
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl sub_8058FA4
	b _0806C5CA
_0806C5B8:
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r2, r7, 0
	orrs r2, r0
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8058FA4
_0806C5CA:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806C554

	thumb_func_start sub_806C5D4
sub_806C5D4: @ 806C5D4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	adds r5, 0x7
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r4, r0
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805B364
	lsls r0, 16
	lsrs r0, 16
	bl sub_80722CC
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805B310
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806C5D4

	thumb_func_start sub_806C62C
sub_806C62C: @ 806C62C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B2D0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806C62C

	thumb_func_start sub_806C670
sub_806C670: @ 806C670
	push {lr}
	bl sub_805B350
	lsls r0, 24
	cmp r0, 0
	beq _0806C680
	movs r0, 0
	b _0806C682
_0806C680:
	movs r0, 0x1
_0806C682:
	pop {r1}
	bx r1
	thumb_func_end sub_806C670

	thumb_func_start sub_806C688
sub_806C688: @ 806C688
	push {lr}
	ldr r1, _0806C698 @ =sub_806C670
	bl sub_80697F4
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806C698: .4byte sub_806C670
	thumb_func_end sub_806C688

	thumb_func_start sub_806C69C
sub_806C69C: @ 806C69C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B268
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806C69C

	thumb_func_start sub_806C6E0
sub_806C6E0: @ 806C6E0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805B29C
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806C6E0

	thumb_func_start sub_806C724
sub_806C724: @ 806C724
	movs r0, 0
	bx lr
	thumb_func_end sub_806C724

	thumb_func_start sub_806C728
sub_806C728: @ 806C728
	movs r0, 0
	bx lr
	thumb_func_end sub_806C728

	thumb_func_start sub_806C72C
sub_806C72C: @ 806C72C
	push {r4,lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E454
	adds r4, r0, 0
	bl sub_80D0554
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806C72C

	thumb_func_start sub_806C74C
sub_806C74C: @ 806C74C
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_80D05A4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C774
	ldr r1, _0806C770 @ =gUnknown_20370D0
	movs r0, 0
	b _0806C778
	.align 2, 0
_0806C770: .4byte gUnknown_20370D0
_0806C774:
	ldr r1, _0806C780 @ =gUnknown_20370D0
	movs r0, 0x1
_0806C778:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C780: .4byte gUnknown_20370D0
	thumb_func_end sub_806C74C

	thumb_func_start sub_806C784
sub_806C784: @ 806C784
	push {lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_80D05E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C7AC
	ldr r1, _0806C7A8 @ =gUnknown_20370D0
	movs r0, 0
	b _0806C7B0
	.align 2, 0
_0806C7A8: .4byte gUnknown_20370D0
_0806C7AC:
	ldr r1, _0806C7B8 @ =gUnknown_20370D0
	movs r0, 0x1
_0806C7B0:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806C7B8: .4byte gUnknown_20370D0
	thumb_func_end sub_806C784

	thumb_func_start sub_806C7BC
sub_806C7BC: @ 806C7BC
	push {lr}
	bl sub_8069A20
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C7BC

	thumb_func_start sub_806C7C8
sub_806C7C8: @ 806C7C8
	push {lr}
	bl sub_8069A2C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806C7C8

	thumb_func_start sub_806C7D4
sub_806C7D4: @ 806C7D4
	push {lr}
	sub sp, 0x4
	movs r2, 0x1
	mov r1, sp
	strb r2, [r1]
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C808 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x50
	mov r2, sp
	bl sub_804037C
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_0806C808: .4byte gUnknown_2024284
	thumb_func_end sub_806C7D4

	thumb_func_start sub_806C80C
sub_806C80C: @ 806C80C
	push {r4,lr}
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0806C83C @ =gUnknown_20370D0
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C840 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x50
	movs r2, 0
	bl sub_803FBE8
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C83C: .4byte gUnknown_20370D0
_0806C840: .4byte gUnknown_2024284
	thumb_func_end sub_806C80C

	thumb_func_start sub_806C844
sub_806C844: @ 806C844
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_80698F8
	lsls r0, 16
	lsrs r0, 16
	bl sub_806E568
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	mov r1, sp
	strb r2, [r1]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r3, 0x5
	bhi _0806C87A
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0806C884 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x23
	mov r2, sp
	bl sub_804037C
_0806C87A:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C884: .4byte gUnknown_2024284
	thumb_func_end sub_806C844

	.align 2, 0 @ Don't pad with nop.
