	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ResetBgs
ResetBgs: @ 8001028
	push {lr}
	bl ResetBgControlStructs
	ldr r1, _0800103C @ =gUnknown_30008D0
	movs r0, 0
	strh r0, [r1, 0x10]
	bl SetTextModeAndHideBgs
	pop {r0}
	bx r0
	.align 2, 0
_0800103C: .4byte gUnknown_30008D0
	thumb_func_end ResetBgs

	thumb_func_start SetBgModeInternal
SetBgModeInternal: @ 8001040
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08001054 @ =gUnknown_30008D0
	ldrh r2, [r3, 0x10]
	ldr r1, _08001058 @ =0x0000fff8
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x10]
	bx lr
	.align 2, 0
_08001054: .4byte gUnknown_30008D0
_08001058: .4byte 0x0000fff8
	thumb_func_end SetBgModeInternal

	thumb_func_start GetBgMode
GetBgMode: @ 800105C
	ldr r0, _08001068 @ =gUnknown_30008D0
	ldrb r1, [r0, 0x10]
	movs r0, 0x7
	ands r0, r1
	bx lr
	.align 2, 0
_08001068: .4byte gUnknown_30008D0
	thumb_func_end GetBgMode

	thumb_func_start ResetBgControlStructs
ResetBgControlStructs: @ 800106C
	push {lr}
	ldr r2, _08001084 @ =gUnknown_30008D0
	ldr r0, _08001088 @ =gUnknown_81E9F64
	ldr r0, [r0]
	adds r1, r2, 0
	adds r1, 0xC
_08001078:
	str r0, [r1]
	subs r1, 0x4
	cmp r1, r2
	bge _08001078
	pop {r0}
	bx r0
	.align 2, 0
_08001084: .4byte gUnknown_30008D0
_08001088: .4byte gUnknown_81E9F64
	thumb_func_end ResetBgControlStructs

	thumb_func_start Unused_ResetBgControlStruct
Unused_ResetBgControlStruct: @ 800108C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsInvalidBg
	lsls r0, 24
	cmp r0, 0
	bne _080010AA
	ldr r1, _080010B0 @ =gUnknown_30008D0
	lsls r0, r4, 2
	adds r0, r1
	ldr r1, _080010B4 @ =gUnknown_81E9F64
	ldr r1, [r1]
	str r1, [r0]
_080010AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080010B0: .4byte gUnknown_30008D0
_080010B4: .4byte gUnknown_81E9F64
	thumb_func_end Unused_ResetBgControlStruct

	thumb_func_start SetBgControlAttributes
SetBgControlAttributes: @ 80010B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r4, [sp, 0x30]
	ldr r5, [sp, 0x34]
	ldr r6, [sp, 0x38]
	mov r12, r6
	ldr r6, [sp, 0x3C]
	mov r8, r6
	lsls r0, 24
	lsrs r7, r0, 24
	str r7, [sp]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x4]
	lsls r5, 24
	lsrs r5, 24
	mov r0, r12
	lsls r0, 24
	lsrs r4, r0, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0xC]
	adds r0, r7, 0
	bl IsInvalidBg
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0
	bne _080011D0
	ldr r2, _080011E0 @ =gUnknown_30008D0
	mov r8, r2
	mov r0, r10
	cmp r0, 0xFF
	beq _0800112C
	lsls r2, r7, 2
	add r2, r8
	movs r1, 0x3
	ands r1, r0
	ldrb r3, [r2, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x1]
_0800112C:
	cmp r6, 0xFF
	beq _08001144
	lsls r1, r7, 2
	add r1, r8
	movs r0, 0x1F
	ands r6, r0
	lsls r3, r6, 2
	ldrb r2, [r1, 0x1]
	subs r0, 0x9C
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
_08001144:
	mov r1, r9
	cmp r1, 0xFF
	beq _08001160
	lsls r1, r7, 2
	add r1, r8
	movs r0, 0x3
	mov r2, r9
	ands r2, r0
	lsls r3, r2, 2
	ldrb r2, [r1]
	subs r0, 0x10
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_08001160:
	ldr r6, [sp, 0x4]
	cmp r6, 0xFF
	beq _08001176
	lsls r1, r7, 2
	add r1, r8
	lsls r3, r6, 7
	ldrb r2, [r1, 0x1]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
_08001176:
	cmp r5, 0xFF
	beq _0800118E
	lsls r1, r7, 2
	add r1, r8
	movs r0, 0x3
	ands r5, r0
	lsls r3, r5, 4
	ldrb r2, [r1]
	subs r0, 0x34
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_0800118E:
	cmp r4, 0xFF
	beq _080011A6
	lsls r1, r7, 2
	add r1, r8
	movs r0, 0x1
	ands r4, r0
	lsls r3, r4, 6
	ldrb r2, [r1]
	subs r0, 0x42
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_080011A6:
	ldr r0, [sp, 0xC]
	cmp r0, 0xFF
	beq _080011BC
	lsls r1, r7, 2
	add r1, r8
	lsls r3, r0, 7
	ldrb r2, [r1]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_080011BC:
	ldr r1, [sp]
	lsls r0, r1, 2
	add r0, r8
	mov r2, r12
	strb r2, [r0, 0x2]
	strb r2, [r0, 0x3]
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
_080011D0:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080011E0: .4byte gUnknown_30008D0
	thumb_func_end SetBgControlAttributes

	thumb_func_start GetBgControlAttribute
GetBgControlAttribute: @ 80011E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	bl IsInvalidBg
	lsls r0, 24
	cmp r0, 0
	bne _08001290
	ldr r1, _0800121C @ =gUnknown_30008D0
	lsls r2, r4, 2
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 31
	adds r3, r1, 0
	cmp r0, 0
	beq _08001290
	subs r0, r5, 0x1
	cmp r0, 0x7
	bhi _08001290
	lsls r0, 2
	ldr r1, _08001220 @ =_08001224
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800121C: .4byte gUnknown_30008D0
_08001220: .4byte _08001224
	.align 2, 0
_08001224:
	.4byte _08001244
	.4byte _0800124E
	.4byte _08001258
	.4byte _08001262
	.4byte _0800126C
	.4byte _08001274
	.4byte _0800127E
	.4byte _08001288
_08001244:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	b _08001292
_0800124E:
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 30
	lsrs r0, 30
	b _08001292
_08001258:
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 25
	lsrs r0, 27
	b _08001292
_08001262:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 30
	b _08001292
_0800126C:
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsrs r0, 7
	b _08001292
_08001274:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	b _08001292
_0800127E:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 31
	b _08001292
_08001288:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsrs r0, 7
	b _08001292
_08001290:
	movs r0, 0xFF
_08001292:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetBgControlAttribute

	thumb_func_start LoadBgVram
LoadBgVram: @ 8001298
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r1, [sp, 0x18]
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	bl IsInvalidBg
	lsls r0, 24
	cmp r0, 0
	bne _08001310
	ldr r1, _080012D8 @ =gUnknown_30008D0
	lsls r0, r4, 2
	adds r1, r0, r1
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08001310
	cmp r5, 0x1
	beq _080012DC
	cmp r5, 0x2
	beq _080012E4
	movs r2, 0xFF
	b _08001314
	.align 2, 0
_080012D8: .4byte gUnknown_30008D0
_080012DC:
	ldrb r0, [r1, 0x1]
	lsls r0, 30
	lsrs r0, 16
	b _080012EC
_080012E4:
	ldrb r0, [r1, 0x1]
	lsls r0, 25
	lsrs r0, 27
	lsls r0, 11
_080012EC:
	adds r0, r6, r0
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xC0
	lsls r1, 19
	adds r1, r0, r1
	mov r0, r8
	adds r2, r7, 0
	movs r3, 0
	bl RequestDma3Copy
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08001314
_08001310:
	movs r0, 0xFF
	b _08001316
_08001314:
	adds r0, r2, 0
_08001316:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LoadBgVram

	thumb_func_start ShowBgInternal
ShowBgInternal: @ 8001320
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsInvalidBg
	lsls r0, 24
	cmp r0, 0
	bne _0800138E
	ldr r5, _08001394 @ =gUnknown_30008D0
	lsls r0, r4, 2
	adds r2, r0, r5
	ldrb r3, [r2]
	lsls r0, r3, 31
	cmp r0, 0
	beq _0800138E
	lsls r1, r3, 26
	lsrs r1, 30
	ldrb r2, [r2, 0x1]
	lsls r0, r2, 30
	lsrs r0, 28
	orrs r1, r0
	movs r0, 0x40
	ands r0, r3
	orrs r1, r0
	lsrs r0, r2, 7
	lsls r0, 7
	orrs r1, r0
	lsls r2, 25
	lsrs r2, 27
	lsls r2, 8
	orrs r1, r2
	lsrs r0, r3, 7
	lsls r0, 13
	orrs r1, r0
	lsls r0, r3, 28
	lsrs r0, 30
	lsls r0, 14
	orrs r1, r0
	lsls r0, r4, 25
	movs r2, 0x80
	lsls r2, 20
	adds r0, r2
	lsrs r0, 24
	bl SetGpuReg
	adds r1, r4, 0
	adds r1, 0x8
	movs r0, 0x1
	lsls r0, r1
	ldrh r1, [r5, 0x10]
	orrs r0, r1
	ldr r1, _08001398 @ =0x00000f07
	ands r0, r1
	strh r0, [r5, 0x10]
_0800138E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001394: .4byte gUnknown_30008D0
_08001398: .4byte 0x00000f07
	thumb_func_end ShowBgInternal

	thumb_func_start HideBgInternal
HideBgInternal: @ 800139C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsInvalidBg
	lsls r0, 24
	cmp r0, 0
	bne _080013C2
	ldr r2, _080013C8 @ =gUnknown_30008D0
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x1
	lsls r1, r0
	ldrh r0, [r2, 0x10]
	bics r0, r1
	ldr r1, _080013CC @ =0x00000f07
	ands r0, r1
	strh r0, [r2, 0x10]
_080013C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080013C8: .4byte gUnknown_30008D0
_080013CC: .4byte 0x00000f07
	thumb_func_end HideBgInternal

	thumb_func_start SyncBgVisibilityAndMode
SyncBgVisibilityAndMode: @ 80013D0
	push {lr}
	movs r0, 0
	bl GetGpuReg
	ldr r1, _080013EC @ =0x0000f0f8
	ands r1, r0
	ldr r0, _080013F0 @ =gUnknown_30008D0
	ldrh r0, [r0, 0x10]
	orrs r1, r0
	movs r0, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080013EC: .4byte 0x0000f0f8
_080013F0: .4byte gUnknown_30008D0
	thumb_func_end SyncBgVisibilityAndMode

	thumb_func_start SetTextModeAndHideBgs
SetTextModeAndHideBgs: @ 80013F4
	push {lr}
	movs r0, 0
	bl GetGpuReg
	ldr r1, _0800140C @ =0x0000f0f8
	ands r1, r0
	movs r0, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0800140C: .4byte 0x0000f0f8
	thumb_func_end SetTextModeAndHideBgs

	thumb_func_start SetBgAffineInternal
SetBgAffineInternal: @ 8001410
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x24
	mov r12, r1
	mov r8, r2
	ldr r1, [sp, 0x3C]
	ldr r2, [sp, 0x40]
	ldr r4, [sp, 0x44]
	ldr r5, [sp, 0x48]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08001454 @ =gUnknown_30008D0
	ldrh r0, [r0, 0x10]
	movs r1, 0x7
	ands r1, r0
	cmp r1, 0x1
	beq _08001458
	cmp r1, 0x1
	ble _080014CE
	cmp r1, 0x2
	beq _0800145E
	b _080014CE
	.align 2, 0
_08001454: .4byte gUnknown_30008D0
_08001458:
	cmp r6, 0x2
	bne _080014CE
	b _08001468
_0800145E:
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080014CE
_08001468:
	mov r0, r12
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	mov r0, sp
	strh r3, [r0, 0x8]
	strh r7, [r0, 0xA]
	strh r2, [r0, 0xC]
	strh r4, [r0, 0xE]
	strh r5, [r0, 0x10]
	add r4, sp, 0x14
	adds r1, r4, 0
	movs r2, 0x1
	bl BgAffineSet
	ldrh r1, [r4]
	movs r0, 0x20
	bl SetGpuReg
	ldrh r1, [r4, 0x2]
	movs r0, 0x22
	bl SetGpuReg
	ldrh r1, [r4, 0x4]
	movs r0, 0x24
	bl SetGpuReg
	ldrh r1, [r4, 0x6]
	movs r0, 0x26
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, 0x20
	bl SetGpuReg
	ldrh r1, [r4, 0x8]
	movs r0, 0x28
	bl SetGpuReg
	ldrh r1, [r4, 0xA]
	movs r0, 0x2A
	bl SetGpuReg
	ldrh r1, [r4, 0xC]
	movs r0, 0x2C
	bl SetGpuReg
	ldrh r1, [r4, 0xE]
	movs r0, 0x2E
	bl SetGpuReg
_080014CE:
	add sp, 0x24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SetBgAffineInternal

	thumb_func_start IsInvalidBg
IsInvalidBg: @ 80014DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080014EA
	movs r0, 0
	b _080014EC
_080014EA:
	movs r0, 0x1
_080014EC:
	pop {r1}
	bx r1
	thumb_func_end IsInvalidBg

	thumb_func_start sub_80014F0
sub_80014F0: @ 80014F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r1, 0
	mov r8, r2
	cmp r3, 0x1
	beq _08001582
	cmp r3, 0x1
	bgt _08001508
	cmp r3, 0
	beq _0800150E
	b _08001606
_08001508:
	cmp r3, 0x2
	beq _080015C8
	b _08001606
_0800150E:
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl GetBgControlAttribute
	lsls r0, 16
	lsrs r0, 7
	movs r1, 0x80
	lsls r1, 3
	adds r4, r0, r1
	movs r1, 0x80
	lsls r1, 4
	cmp r4, r1
	ble _0800152C
	adds r4, r1, 0
_0800152C:
	movs r2, 0
	movs r6, 0
	adds r3, r0, 0
	movs r5, 0
	cmp r3, r4
	bge _0800157C
	ldr r7, _08001568 @ =gUnknown_3000938
	mov r12, r7
_0800153C:
	adds r0, r3, 0
	cmp r3, 0
	bge _08001544
	adds r0, r3, 0x7
_08001544:
	asrs r0, 3
	mov r7, r12
	adds r1, r0, r7
	ldrb r1, [r1]
	lsls r0, 3
	subs r0, r3, r0
	asrs r1, r0
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _08001572
	cmp r2, 0
	beq _0800156C
	adds r2, 0x1
	cmp r2, r8
	bne _08001574
	adds r0, r6, 0
	b _08001608
	.align 2, 0
_08001568: .4byte gUnknown_3000938
_0800156C:
	adds r6, r5, 0
	movs r2, 0x1
	b _08001574
_08001572:
	movs r2, 0
_08001574:
	adds r3, 0x1
	adds r5, 0x1
	cmp r3, r4
	blt _0800153C
_0800157C:
	movs r0, 0x1
	negs r0, r0
	b _08001608
_08001582:
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl GetBgControlAttribute
	lsls r0, 16
	lsrs r0, 7
	adds r0, r5
	mov r1, r8
	adds r4, r0, r1
	adds r3, r0, 0
	cmp r3, r4
	bge _08001606
	ldr r5, _080015C4 @ =gUnknown_3000938
	movs r6, 0x1
_080015A0:
	adds r1, r3, 0
	cmp r3, 0
	bge _080015A8
	adds r1, r3, 0x7
_080015A8:
	asrs r1, 3
	adds r2, r1, r5
	lsls r1, 3
	subs r1, r3, r1
	adds r0, r6, 0
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, r4
	blt _080015A0
	b _08001606
	.align 2, 0
_080015C4: .4byte gUnknown_3000938
_080015C8:
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl GetBgControlAttribute
	lsls r0, 16
	lsrs r0, 7
	adds r0, r5
	mov r7, r8
	adds r4, r0, r7
	adds r3, r0, 0
	cmp r3, r4
	bge _08001606
	ldr r5, _08001614 @ =gUnknown_3000938
	movs r6, 0x1
_080015E6:
	adds r0, r3, 0
	cmp r3, 0
	bge _080015EE
	adds r0, r3, 0x7
_080015EE:
	asrs r0, 3
	adds r2, r0, r5
	lsls r0, 3
	subs r0, r3, r0
	adds r1, r6, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, r4
	blt _080015E6
_08001606:
	movs r0, 0
_08001608:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08001614: .4byte gUnknown_3000938
	thumb_func_end sub_80014F0

	thumb_func_start sub_8001618
sub_8001618: @ 8001618
	push {r4,lr}
	adds r4, r0, 0
	bl ResetBgs
	ldr r1, _0800164C @ =gUnknown_3000928
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xC
_08001628:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _08001628
	ldr r0, _08001650 @ =gUnknown_3003D8C
	str r4, [r0]
	ldr r1, _08001654 @ =gUnknown_3000938
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xFF
_0800163C:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _0800163C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800164C: .4byte gUnknown_3000928
_08001650: .4byte gUnknown_3003D8C
_08001654: .4byte gUnknown_3000938
	thumb_func_end sub_8001618

	thumb_func_start sub_8001658
sub_8001658: @ 8001658
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r4, r2, 24
	bl SetBgModeInternal
	bl ResetBgControlStructs
	cmp r4, 0
	beq _08001712
	movs r7, 0
	ldr r0, _08001724 @ =gUnknown_30008E8
	mov r9, r0
	adds r6, r5, 0
	ldr r2, _08001728 @ =gUnknown_3000938
	mov r10, r2
	mov r8, r4
_08001688:
	ldr r4, [r6]
	lsls r0, r4, 30
	lsrs r5, r0, 30
	cmp r5, 0x3
	bhi _08001704
	lsls r1, r4, 28
	lsrs r1, 30
	lsls r2, r4, 23
	lsrs r2, 27
	lsls r3, r4, 21
	lsrs r3, 30
	lsls r0, r4, 20
	lsrs r0, 31
	str r0, [sp]
	lsls r0, r4, 18
	lsrs r0, 30
	str r0, [sp, 0x4]
	str r7, [sp, 0x8]
	str r7, [sp, 0xC]
	adds r0, r5, 0
	bl SetBgControlAttributes
	lsls r4, r5, 4
	mov r5, r9
	adds r3, r4, r5
	ldr r2, [r6]
	lsls r2, 8
	lsrs r2, 22
	ldrh r0, [r3]
	ldr r5, _0800172C @ =0xfffffc00
	adds r1, r5, 0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
	ldrb r0, [r3, 0x1]
	movs r2, 0x3D
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r3, 0x1]
	ldr r0, [r3]
	ldr r1, _08001730 @ =0x00003fff
	ands r0, r1
	str r0, [r3]
	mov r0, r9
	adds r0, 0x4
	adds r0, r4, r0
	str r7, [r0]
	mov r0, r9
	adds r0, 0x8
	adds r0, r4, r0
	str r7, [r0]
	ldr r5, _08001734 @ =gUnknown_30008F4
	adds r4, r5
	str r7, [r4]
	ldr r0, [r6]
	lsls r0, 28
	lsrs r0, 30
	lsls r0, 6
	add r0, r10
	movs r1, 0x1
	strb r1, [r0]
_08001704:
	adds r6, 0x4
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	mov r2, r8
	cmp r2, 0
	bne _08001688
_08001712:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001724: .4byte gUnknown_30008E8
_08001728: .4byte gUnknown_3000938
_0800172C: .4byte 0xfffffc00
_08001730: .4byte 0x00003fff
_08001734: .4byte gUnknown_30008F4
	thumb_func_end sub_8001658

	thumb_func_start sub_8001738
sub_8001738: @ 8001738
	push {r4-r7,lr}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r4, [r7]
	lsls r0, r4, 30
	lsrs r5, r0, 30
	cmp r5, 0x3
	bhi _080017B8
	lsls r1, r4, 28
	lsrs r1, 30
	lsls r2, r4, 23
	lsrs r2, 27
	lsls r3, r4, 21
	lsrs r3, 30
	lsls r0, r4, 20
	lsrs r0, 31
	str r0, [sp]
	lsls r0, r4, 18
	lsrs r0, 30
	str r0, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	adds r0, r5, 0
	bl SetBgControlAttributes
	ldr r4, _080017C0 @ =gUnknown_30008E8
	lsls r5, 4
	adds r3, r5, r4
	ldr r1, [r7]
	lsls r1, 8
	lsrs r1, 22
	ldrh r2, [r3]
	ldr r0, _080017C4 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	ldrb r1, [r3, 0x1]
	movs r0, 0x3D
	negs r0, r0
	ands r0, r1
	strb r0, [r3, 0x1]
	ldr r0, [r3]
	ldr r1, _080017C8 @ =0x00003fff
	ands r0, r1
	str r0, [r3]
	adds r0, r4, 0x4
	adds r0, r5, r0
	str r6, [r0]
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r5, r0
	str r6, [r0]
	adds r4, 0xC
	adds r5, r4
	str r6, [r5]
	ldr r1, _080017CC @ =gUnknown_3000938
	ldr r0, [r7]
	lsls r0, 28
	lsrs r0, 30
	lsls r0, 6
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_080017B8:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080017C0: .4byte gUnknown_30008E8
_080017C4: .4byte 0xfffffc00
_080017C8: .4byte 0x00003fff
_080017CC: .4byte gUnknown_3000938
	thumb_func_end sub_8001738

	thumb_func_start LoadBgTiles
LoadBgTiles: @ 80017D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r3, 16
	lsrs r4, r3, 16
	adds r0, r5, 0
	movs r1, 0x5
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	bne _0800180C
	ldr r1, _08001808 @ =gUnknown_30008E8
	lsls r0, r5, 4
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 22
	lsrs r0, 22
	adds r0, r4
	lsls r0, 21
	b _0800181C
	.align 2, 0
_08001808: .4byte gUnknown_30008E8
_0800180C:
	ldr r1, _0800183C @ =gUnknown_30008E8
	lsls r0, r5, 4
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 22
	lsrs r0, 22
	adds r0, r4
	lsls r0, 22
_0800181C:
	lsrs r4, r0, 16
	movs r6, 0x1
	str r6, [sp]
	adds r0, r5, 0
	adds r1, r7, 0
	mov r2, r8
	adds r3, r4, 0
	bl LoadBgVram
	lsls r2, r0, 24
	lsrs r1, r2, 24
	adds r7, r1, 0
	cmp r1, 0xFF
	bne _08001844
	ldr r0, _08001840 @ =0x0000ffff
	b _08001872
	.align 2, 0
_0800183C: .4byte gUnknown_30008E8
_08001840: .4byte 0x0000ffff
_08001844:
	ldr r0, _08001880 @ =gUnknown_3000928
	lsrs r2, 29
	lsls r2, 2
	adds r2, r0
	movs r0, 0x1F
	ands r0, r1
	adds r1, r6, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, _08001884 @ =gUnknown_3003D8C
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08001870
	lsrs r1, r4, 5
	mov r0, r8
	lsrs r2, r0, 5
	adds r0, r5, 0
	movs r3, 0x1
	bl sub_80014F0
_08001870:
	adds r0, r7, 0
_08001872:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08001880: .4byte gUnknown_3000928
_08001884: .4byte gUnknown_3003D8C
	thumb_func_end LoadBgTiles

	thumb_func_start LoadBgTilemap
LoadBgTilemap: @ 8001888
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 21
	lsrs r3, 16
	movs r4, 0x2
	str r4, [sp]
	bl LoadBgVram
	lsls r2, r0, 24
	lsrs r3, r2, 24
	cmp r3, 0xFF
	beq _080018C8
	ldr r0, _080018C4 @ =gUnknown_3000928
	lsrs r2, 29
	lsls r2, 2
	adds r2, r0
	movs r0, 0x1F
	ands r0, r3
	movs r1, 0x1
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	adds r0, r3, 0
	b _080018CA
	.align 2, 0
_080018C4: .4byte gUnknown_3000928
_080018C8:
	ldr r0, _080018D4 @ =0x0000ffff
_080018CA:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080018D4: .4byte 0x0000ffff
	thumb_func_end LoadBgTilemap

	thumb_func_start Unused_LoadBgPalette
Unused_LoadBgPalette: @ 80018D8
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 16
	lsrs r5, r3, 16
	adds r0, r4, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08001924
	ldr r1, _08001928 @ =gUnknown_30008E8
	lsls r0, r4, 4
	adds r0, r1
	ldrb r1, [r0, 0x1]
	lsls r1, 26
	lsrs r1, 28
	lsls r1, 5
	lsls r0, r5, 1
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0xA0
	lsls r0, 19
	adds r1, r0
	adds r0, r7, 0
	adds r2, r6, 0
	movs r3, 0
	bl RequestDma3Copy
	lsls r3, r0, 24
	asrs r1, r3, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08001930
_08001924:
	ldr r0, _0800192C @ =0x0000ffff
	b _08001954
	.align 2, 0
_08001928: .4byte gUnknown_30008E8
_0800192C: .4byte 0x0000ffff
_08001930:
	ldr r4, _0800195C @ =gUnknown_3000928
	adds r0, r1, 0
	cmp r1, 0
	bge _0800193A
	adds r0, 0x1F
_0800193A:
	asrs r0, 5
	lsls r2, r0, 2
	adds r2, r4
	lsls r0, 5
	subs r0, r1, r0
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	lsrs r0, r3, 24
_08001954:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800195C: .4byte gUnknown_3000928
	thumb_func_end Unused_LoadBgPalette

	thumb_func_start IsDma3ManagerBusyWithBgCopy
IsDma3ManagerBusyWithBgCopy: @ 8001960
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x1
	negs r7, r7
_08001968:
	adds r0, r5, 0
	cmp r5, 0
	bge _08001970
	adds r0, 0x1F
_08001970:
	asrs r0, 5
	lsls r2, r0, 24
	lsls r0, 5
	subs r0, r5, r0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080019A4 @ =gUnknown_3000928
	lsrs r2, 22
	adds r4, r2, r1
	movs r6, 0x1
	lsls r6, r0
	ldr r0, [r4]
	ands r0, r6
	cmp r0, 0
	beq _080019AE
	lsls r0, r5, 16
	asrs r0, 16
	bl CheckForSpaceForDma3Request
	lsls r0, 24
	asrs r0, 24
	cmp r0, r7
	bne _080019A8
	movs r0, 0x1
	b _080019B6
	.align 2, 0
_080019A4: .4byte gUnknown_3000928
_080019A8:
	ldr r0, [r4]
	bics r0, r6
	str r0, [r4]
_080019AE:
	adds r5, 0x1
	cmp r5, 0x7F
	ble _08001968
	movs r0, 0
_080019B6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end IsDma3ManagerBusyWithBgCopy

	thumb_func_start ShowBg
ShowBg: @ 80019BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl ShowBgInternal
	bl SyncBgVisibilityAndMode
	pop {r0}
	bx r0
	thumb_func_end ShowBg

	thumb_func_start HideBg
HideBg: @ 80019D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl HideBgInternal
	bl SyncBgVisibilityAndMode
	pop {r0}
	bx r0
	thumb_func_end HideBg

	thumb_func_start SetBgAttribute
SetBgAttribute: @ 80019E4
	push {r4,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r3, r2, 24
	subs r0, r1, 0x1
	cmp r0, 0x6
	bhi _08001A9E
	lsls r0, 2
	ldr r1, _08001A04 @ =_08001A08
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08001A04: .4byte _08001A08
	.align 2, 0
_08001A08:
	.4byte _08001A24
	.4byte _08001A34
	.4byte _08001A46
	.4byte _08001A5C
	.4byte _08001A70
	.4byte _08001A88
	.4byte _08001A66
_08001A24:
	movs r0, 0xFF
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r4, 0
	adds r1, r3, 0
	b _08001A7E
_08001A34:
	movs r0, 0xFF
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xFF
	adds r2, r3, 0
	b _08001A80
_08001A46:
	movs r0, 0xFF
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0xFF
	bl SetBgControlAttributes
	b _08001A9E
_08001A5C:
	str r3, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	b _08001A78
_08001A66:
	movs r0, 0xFF
	str r0, [sp]
	str r3, [sp, 0x4]
	str r0, [sp, 0x8]
	b _08001A78
_08001A70:
	movs r0, 0xFF
	str r0, [sp]
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
_08001A78:
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xFF
_08001A7E:
	movs r2, 0xFF
_08001A80:
	movs r3, 0xFF
	bl SetBgControlAttributes
	b _08001A9E
_08001A88:
	movs r0, 0xFF
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r3, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0xFF
	movs r3, 0xFF
	bl SetBgControlAttributes
_08001A9E:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SetBgAttribute

	thumb_func_start GetBgAttribute
GetBgAttribute: @ 8001AA8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1, 0x1
	cmp r0, 0x9
	bhi _08001B84
	lsls r0, 2
	ldr r1, _08001AC4 @ =_08001AC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08001AC4: .4byte _08001AC8
	.align 2, 0
_08001AC8:
	.4byte _08001AF0
	.4byte _08001AFA
	.4byte _08001B04
	.4byte _08001B0E
	.4byte _08001B22
	.4byte _08001B2C
	.4byte _08001B18
	.4byte _08001B36
	.4byte _08001B64
	.4byte _08001B70
_08001AF0:
	adds r0, r4, 0
	movs r1, 0x2
	bl GetBgControlAttribute
	b _08001B6A
_08001AFA:
	adds r0, r4, 0
	movs r1, 0x3
	bl GetBgControlAttribute
	b _08001B6A
_08001B04:
	adds r0, r4, 0
	movs r1, 0x4
	bl GetBgControlAttribute
	b _08001B6A
_08001B0E:
	adds r0, r4, 0
	movs r1, 0x5
	bl GetBgControlAttribute
	b _08001B6A
_08001B18:
	adds r0, r4, 0
	movs r1, 0x6
	bl GetBgControlAttribute
	b _08001B6A
_08001B22:
	adds r0, r4, 0
	movs r1, 0x7
	bl GetBgControlAttribute
	b _08001B6A
_08001B2C:
	adds r0, r4, 0
	movs r1, 0x8
	bl GetBgControlAttribute
	b _08001B6A
_08001B36:
	adds r0, r4, 0
	bl GetBgType
	cmp r0, 0
	beq _08001B48
	cmp r0, 0x1
	beq _08001B56
	movs r0, 0
	b _08001B86
_08001B48:
	adds r0, r4, 0
	movs r1, 0
	bl GetBgMetricTextMode
	lsls r0, 27
	lsrs r0, 16
	b _08001B86
_08001B56:
	adds r0, r4, 0
	movs r1, 0
	bl GetBgMetricAffineMode
	lsls r0, 24
	lsrs r0, 16
	b _08001B86
_08001B64:
	adds r0, r4, 0
	bl GetBgType
_08001B6A:
	lsls r0, 16
	lsrs r0, 16
	b _08001B86
_08001B70:
	ldr r0, _08001B80 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r1, r0
	ldrh r0, [r1]
	lsls r0, 22
	lsrs r0, 22
	b _08001B86
	.align 2, 0
_08001B80: .4byte gUnknown_30008E8
_08001B84:
	ldr r0, _08001B8C @ =0x0000ffff
_08001B86:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08001B8C: .4byte 0x0000ffff
	thumb_func_end GetBgAttribute

	thumb_func_start ChangeBgX
ChangeBgX: @ 8001B90
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r4, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08001BB4
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	bne _08001BBA
_08001BB4:
	movs r0, 0x1
	negs r0, r0
	b _08001CC0
_08001BBA:
	cmp r5, 0x1
	beq _08001BD8
	cmp r5, 0x1
	ble _08001BC6
	cmp r5, 0x2
	beq _08001BEC
_08001BC6:
	ldr r0, _08001BD4 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0x8
	adds r0, r1, r0
	str r6, [r0]
	adds r5, r1, 0
	b _08001BFC
	.align 2, 0
_08001BD4: .4byte gUnknown_30008E8
_08001BD8:
	ldr r0, _08001BE8 @ =gUnknown_30008E8
	lsls r2, r4, 4
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r6
	b _08001BF8
	.align 2, 0
_08001BE8: .4byte gUnknown_30008E8
_08001BEC:
	ldr r0, _08001C14 @ =gUnknown_30008E8
	lsls r2, r4, 4
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r0]
	subs r1, r6
_08001BF8:
	str r1, [r0]
	adds r5, r2, 0
_08001BFC:
	bl GetBgMode
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x1
	beq _08001C38
	cmp r4, 0x1
	bgt _08001C18
	cmp r4, 0
	beq _08001C22
	b _08001CB8
	.align 2, 0
_08001C14: .4byte gUnknown_30008E8
_08001C18:
	cmp r4, 0x2
	beq _08001C4C
	cmp r4, 0x3
	beq _08001C84
	b _08001CB8
_08001C22:
	ldr r0, _08001C34 @ =gUnknown_30008E8
	ldr r0, [r0, 0x8]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x10
	bl SetGpuReg
	b _08001CB8
	.align 2, 0
_08001C34: .4byte gUnknown_30008E8
_08001C38:
	ldr r0, _08001C48 @ =gUnknown_30008E8
	ldr r0, [r0, 0x18]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x14
	bl SetGpuReg
	b _08001CB8
	.align 2, 0
_08001C48: .4byte gUnknown_30008E8
_08001C4C:
	cmp r0, 0
	bne _08001C64
	ldr r0, _08001C60 @ =gUnknown_30008E8
	ldr r0, [r0, 0x28]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x18
	bl SetGpuReg
	b _08001CB8
	.align 2, 0
_08001C60: .4byte gUnknown_30008E8
_08001C64:
	ldr r0, _08001C80 @ =gUnknown_30008E8
	ldr r0, [r0, 0x28]
	lsrs r1, r0, 16
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x2A
	bl SetGpuReg
	movs r0, 0x28
	adds r1, r4, 0
	bl SetGpuReg
	b _08001CB8
	.align 2, 0
_08001C80: .4byte gUnknown_30008E8
_08001C84:
	cmp r0, 0
	bne _08001C9C
	ldr r0, _08001C98 @ =gUnknown_30008E8
	ldr r0, [r0, 0x38]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x1C
	bl SetGpuReg
	b _08001CB8
	.align 2, 0
_08001C98: .4byte gUnknown_30008E8
_08001C9C:
	cmp r0, 0x2
	bne _08001CB8
	ldr r0, _08001CC8 @ =gUnknown_30008E8
	ldr r0, [r0, 0x38]
	lsrs r1, r0, 16
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x3A
	bl SetGpuReg
	movs r0, 0x38
	adds r1, r4, 0
	bl SetGpuReg
_08001CB8:
	ldr r0, _08001CC8 @ =gUnknown_30008E8
	adds r0, 0x8
	adds r0, r5, r0
	ldr r0, [r0]
_08001CC0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08001CC8: .4byte gUnknown_30008E8
	thumb_func_end ChangeBgX

	thumb_func_start GetBgX
GetBgX: @ 8001CCC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08001CFC
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	beq _08001CFC
	ldr r0, _08001CF8 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0x8
	adds r1, r0
	ldr r0, [r1]
	b _08001D00
	.align 2, 0
_08001CF8: .4byte gUnknown_30008E8
_08001CFC:
	movs r0, 0x1
	negs r0, r0
_08001D00:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBgX

	thumb_func_start ChangeBgY
ChangeBgY: @ 8001D08
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r4, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08001D2C
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	bne _08001D32
_08001D2C:
	movs r0, 0x1
	negs r0, r0
	b _08001E38
_08001D32:
	cmp r5, 0x1
	beq _08001D50
	cmp r5, 0x1
	ble _08001D3E
	cmp r5, 0x2
	beq _08001D64
_08001D3E:
	ldr r0, _08001D4C @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0xC
	adds r0, r1, r0
	str r6, [r0]
	adds r5, r1, 0
	b _08001D74
	.align 2, 0
_08001D4C: .4byte gUnknown_30008E8
_08001D50:
	ldr r0, _08001D60 @ =gUnknown_30008E8
	lsls r2, r4, 4
	adds r0, 0xC
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r6
	b _08001D70
	.align 2, 0
_08001D60: .4byte gUnknown_30008E8
_08001D64:
	ldr r0, _08001D8C @ =gUnknown_30008E8
	lsls r2, r4, 4
	adds r0, 0xC
	adds r0, r2, r0
	ldr r1, [r0]
	subs r1, r6
_08001D70:
	str r1, [r0]
	adds r5, r2, 0
_08001D74:
	bl GetBgMode
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x1
	beq _08001DB0
	cmp r4, 0x1
	bgt _08001D90
	cmp r4, 0
	beq _08001D9A
	b _08001E30
	.align 2, 0
_08001D8C: .4byte gUnknown_30008E8
_08001D90:
	cmp r4, 0x2
	beq _08001DC4
	cmp r4, 0x3
	beq _08001DFC
	b _08001E30
_08001D9A:
	ldr r0, _08001DAC @ =gUnknown_30008E8
	ldr r0, [r0, 0xC]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x12
	bl SetGpuReg
	b _08001E30
	.align 2, 0
_08001DAC: .4byte gUnknown_30008E8
_08001DB0:
	ldr r0, _08001DC0 @ =gUnknown_30008E8
	ldr r0, [r0, 0x1C]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x16
	bl SetGpuReg
	b _08001E30
	.align 2, 0
_08001DC0: .4byte gUnknown_30008E8
_08001DC4:
	cmp r0, 0
	bne _08001DDC
	ldr r0, _08001DD8 @ =gUnknown_30008E8
	ldr r0, [r0, 0x2C]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x1A
	bl SetGpuReg
	b _08001E30
	.align 2, 0
_08001DD8: .4byte gUnknown_30008E8
_08001DDC:
	ldr r0, _08001DF8 @ =gUnknown_30008E8
	ldr r0, [r0, 0x2C]
	lsrs r1, r0, 16
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x2E
	bl SetGpuReg
	movs r0, 0x2C
	adds r1, r4, 0
	bl SetGpuReg
	b _08001E30
	.align 2, 0
_08001DF8: .4byte gUnknown_30008E8
_08001DFC:
	cmp r0, 0
	bne _08001E14
	ldr r0, _08001E10 @ =gUnknown_30008E8
	ldr r0, [r0, 0x3C]
	lsls r0, 8
	lsrs r1, r0, 16
	movs r0, 0x1E
	bl SetGpuReg
	b _08001E30
	.align 2, 0
_08001E10: .4byte gUnknown_30008E8
_08001E14:
	cmp r0, 0x2
	bne _08001E30
	ldr r0, _08001E40 @ =gUnknown_30008E8
	ldr r0, [r0, 0x3C]
	lsrs r1, r0, 16
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x3E
	bl SetGpuReg
	movs r0, 0x3C
	adds r1, r4, 0
	bl SetGpuReg
_08001E30:
	ldr r0, _08001E40 @ =gUnknown_30008E8
	adds r0, 0xC
	adds r0, r5, r0
	ldr r0, [r0]
_08001E38:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08001E40: .4byte gUnknown_30008E8
	thumb_func_end ChangeBgY

	thumb_func_start GetBgY
GetBgY: @ 8001E44
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08001E74
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	beq _08001E74
	ldr r0, _08001E70 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0xC
	adds r1, r0
	ldr r0, [r1]
	b _08001E78
	.align 2, 0
_08001E70: .4byte gUnknown_30008E8
_08001E74:
	movs r0, 0x1
	negs r0, r0
_08001E78:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBgY

	thumb_func_start SetBgAffine
SetBgAffine: @ 8001E80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	ldr r7, [sp, 0x34]
	lsls r0, 24
	lsrs r0, 24
	lsls r7, 16
	lsrs r7, 16
	lsls r3, 16
	asrs r3, 16
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	lsls r6, 16
	asrs r6, 16
	str r6, [sp, 0x8]
	str r7, [sp, 0xC]
	bl SetBgAffineInternal
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SetBgAffine

	thumb_func_start Unused_AdjustBgMosaic
Unused_AdjustBgMosaic: @ 8001EC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r0, 0x4C
	bl GetGpuReg
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0xF
	movs r3, 0xF
	ands r3, r5
	lsrs r2, r0, 20
	ands r2, r1
	movs r0, 0xFF
	lsls r0, 8
	ands r5, r0
	cmp r6, 0x6
	bhi _08001F14
	lsls r0, r6, 2
	ldr r1, _08001EF4 @ =_08001EF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08001EF4: .4byte _08001EF8
	.align 2, 0
_08001EF8:
	.4byte _08001F14
	.4byte _08001F1C
	.4byte _08001F22
	.4byte _08001F34
	.4byte _08001F4A
	.4byte _08001F50
	.4byte _08001F62
_08001F14:
	movs r3, 0xF
	ands r3, r4
	lsrs r2, r4, 4
	b _08001F76
_08001F1C:
	movs r3, 0xF
	ands r3, r4
	b _08001F76
_08001F22:
	lsls r0, r3, 16
	asrs r0, 16
	adds r0, r4
	cmp r0, 0xF
	ble _08001F30
	movs r3, 0xF
	b _08001F76
_08001F30:
	adds r0, r3, r4
	b _08001F44
_08001F34:
	lsls r0, r3, 16
	asrs r0, 16
	subs r0, r4
	cmp r0, 0
	bge _08001F42
	movs r3, 0
	b _08001F76
_08001F42:
	subs r0, r3, r4
_08001F44:
	lsls r0, 16
	lsrs r3, r0, 16
	b _08001F76
_08001F4A:
	movs r2, 0xF
	ands r2, r4
	b _08001F76
_08001F50:
	lsls r0, r2, 16
	asrs r0, 16
	adds r0, r4
	cmp r0, 0xF
	ble _08001F5E
	movs r2, 0xF
	b _08001F76
_08001F5E:
	adds r0, r2, r4
	b _08001F72
_08001F62:
	lsls r0, r2, 16
	asrs r0, 16
	subs r0, r4
	cmp r0, 0
	bge _08001F70
	movs r2, 0
	b _08001F76
_08001F70:
	subs r0, r2, r4
_08001F72:
	lsls r0, 16
	lsrs r2, r0, 16
_08001F76:
	lsls r0, r2, 16
	asrs r0, 12
	movs r1, 0xF0
	ands r0, r1
	orrs r5, r0
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0xF
	ands r0, r1
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r5, r0, 16
	movs r0, 0x4C
	adds r1, r5, 0
	bl SetGpuReg
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end Unused_AdjustBgMosaic

	thumb_func_start SetBgTilemapBuffer
SetBgTilemapBuffer: @ 8001FA0
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08001FCA
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	beq _08001FCA
	ldr r0, _08001FD0 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0x4
	adds r1, r0
	str r5, [r1]
_08001FCA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001FD0: .4byte gUnknown_30008E8
	thumb_func_end SetBgTilemapBuffer

	thumb_func_start UnsetBgTilemapBuffer
UnsetBgTilemapBuffer: @ 8001FD4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsInvalidBg32
	adds r5, r0, 0
	cmp r5, 0
	bne _08001FFE
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	beq _08001FFE
	ldr r0, _08002004 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0x4
	adds r1, r0
	str r5, [r1]
_08001FFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002004: .4byte gUnknown_30008E8
	thumb_func_end UnsetBgTilemapBuffer

	thumb_func_start GetBgTilemapBuffer
GetBgTilemapBuffer: @ 8002008
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08002038
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBgControlAttribute
	lsls r0, 16
	cmp r0, 0
	beq _08002038
	ldr r0, _08002034 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	b _0800203A
	.align 2, 0
_08002034: .4byte gUnknown_30008E8
_08002038:
	movs r0, 0
_0800203A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBgTilemapBuffer

	thumb_func_start CopyToBgTilemapBuffer
CopyToBgTilemapBuffer: @ 8002040
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	lsls r7, r2, 16
	lsrs r6, r7, 16
	lsls r3, 16
	lsrs r5, r3, 16
	mov r8, r5
	adds r0, r4, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _080020A8
	adds r0, r4, 0
	bl IsTileMapOutsideWram
	cmp r0, 0
	bne _080020A8
	cmp r6, 0
	beq _08002090
	ldr r0, _0800208C @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0x4
	adds r1, r0
	lsls r0, r5, 5
	ldr r1, [r1]
	adds r1, r0
	lsrs r2, r7, 17
	mov r0, r10
	bl CpuSet
	b _080020A8
	.align 2, 0
_0800208C: .4byte gUnknown_30008E8
_08002090:
	ldr r0, _080020B8 @ =gUnknown_30008E8
	mov r2, r9
	lsls r1, r2, 4
	adds r0, 0x4
	adds r1, r0
	mov r2, r8
	lsls r0, r2, 5
	ldr r1, [r1]
	adds r1, r0
	mov r0, r10
	bl LZ77UnCompWram
_080020A8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080020B8: .4byte gUnknown_30008E8
	thumb_func_end CopyToBgTilemapBuffer

	thumb_func_start CopyBgTilemapBufferToVram
CopyBgTilemapBufferToVram: @ 80020BC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08002118
	adds r0, r4, 0
	bl IsTileMapOutsideWram
	cmp r0, 0
	bne _08002118
	adds r0, r4, 0
	bl GetBgType
	cmp r0, 0
	beq _080020EA
	cmp r0, 0x1
	beq _080020F6
	movs r2, 0
	b _08002102
_080020EA:
	adds r0, r4, 0
	movs r1, 0
	bl GetBgMetricTextMode
	lsls r0, 27
	b _08002100
_080020F6:
	adds r0, r4, 0
	movs r1, 0
	bl GetBgMetricAffineMode
	lsls r0, 24
_08002100:
	lsrs r2, r0, 16
_08002102:
	ldr r0, _08002120 @ =gUnknown_30008E8
	lsls r1, r4, 4
	adds r0, 0x4
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0
	bl LoadBgVram
_08002118:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002120: .4byte gUnknown_30008E8
	thumb_func_end CopyBgTilemapBufferToVram

	thumb_func_start CopyToBgTilemapBufferRect
CopyToBgTilemapBufferRect: @ 8002124
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r1
	ldr r1, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r4, 24
	lsrs r6, r4, 24
	adds r0, r5, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08002214
	adds r0, r5, 0
	bl IsTileMapOutsideWram
	cmp r0, 0
	bne _08002214
	adds r0, r5, 0
	bl GetBgType
	cmp r0, 0
	beq _08002172
	cmp r0, 0x1
	beq _080021C0
	b _08002214
_08002172:
	mov r4, r8
	adds r3, r7, 0
	adds r0, r3, r6
	cmp r3, r0
	bge _08002214
	mov r12, r0
	lsls r1, r5, 4
	ldr r0, _080021BC @ =gUnknown_30008EC
	adds r1, r0
	mov r8, r1
_08002186:
	mov r2, r10
	mov r1, r9
	adds r0, r2, r1
	adds r7, r3, 0x1
	cmp r2, r0
	bge _080021B0
	mov r1, r8
	ldr r6, [r1]
	lsls r5, r3, 5
	adds r3, r0, 0
_0800219A:
	adds r0, r5, r2
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r4]
	strh r1, [r0]
	adds r4, 0x2
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	blt _0800219A
_080021B0:
	lsls r0, r7, 16
	lsrs r3, r0, 16
	cmp r3, r12
	blt _08002186
	b _08002214
	.align 2, 0
_080021BC: .4byte gUnknown_30008EC
_080021C0:
	mov r4, r8
	adds r0, r5, 0
	movs r1, 0x1
	bl GetBgMetricAffineMode
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	adds r3, r7, 0
	adds r0, r3, r6
	cmp r3, r0
	bge _08002214
	mov r12, r0
	lsls r5, 4
	mov r8, r5
_080021DE:
	mov r2, r10
	mov r1, r9
	adds r0, r2, r1
	adds r7, r3, 0x1
	cmp r2, r0
	bge _0800220C
	ldr r6, _08002224 @ =gUnknown_30008EC
	add r6, r8
	ldr r1, [sp]
	adds r5, r3, 0
	muls r5, r1
	adds r3, r0, 0
_080021F6:
	ldr r1, [r6]
	adds r0, r5, r2
	adds r1, r0
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	blt _080021F6
_0800220C:
	lsls r0, r7, 16
	lsrs r3, r0, 16
	cmp r3, r12
	blt _080021DE
_08002214:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002224: .4byte gUnknown_30008EC
	thumb_func_end CopyToBgTilemapBufferRect

	thumb_func_start CopyToBgTilemapBufferRect_ChangePalette
CopyToBgTilemapBufferRect_ChangePalette: @ 8002228
	push {r4-r6,lr}
	sub sp, 0x24
	ldr r4, [sp, 0x34]
	ldr r5, [sp, 0x38]
	ldr r6, [sp, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	str r4, [sp, 0x10]
	str r5, [sp, 0x14]
	str r6, [sp, 0x18]
	movs r2, 0
	str r2, [sp, 0x1C]
	str r2, [sp, 0x20]
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	add sp, 0x24
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end CopyToBgTilemapBufferRect_ChangePalette

	thumb_func_start CopyRectToBgTilemapBufferRect
CopyRectToBgTilemapBufferRect: @ 800226C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x40
	str r1, [sp, 0x8]
	ldr r1, [sp, 0x60]
	ldr r4, [sp, 0x68]
	ldr r5, [sp, 0x6C]
	ldr r6, [sp, 0x70]
	ldr r7, [sp, 0x74]
	mov r8, r7
	ldr r7, [sp, 0x78]
	mov r9, r7
	ldr r7, [sp, 0x7C]
	mov r10, r7
	ldr r7, [sp, 0x80]
	mov r12, r7
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x14]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x18]
	mov r0, r8
	lsls r0, 24
	lsrs r4, r0, 24
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x1C]
	mov r2, r10
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x20]
	mov r0, r12
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x24]
	ldr r0, [sp, 0x4]
	bl IsInvalidBg32
	cmp r0, 0
	beq _080022E2
	b _0800243E
_080022E2:
	ldr r0, [sp, 0x4]
	bl IsTileMapOutsideWram
	cmp r0, 0
	beq _080022EE
	b _0800243E
_080022EE:
	ldr r0, [sp, 0x4]
	movs r1, 0x4
	bl GetBgControlAttribute
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x30]
	ldr r0, [sp, 0x4]
	movs r1, 0x1
	bl GetBgMetricTextMode
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x28]
	ldr r0, [sp, 0x4]
	movs r1, 0x2
	bl GetBgMetricTextMode
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x2C]
	ldr r0, [sp, 0x4]
	bl GetBgType
	cmp r0, 0
	beq _08002328
	cmp r0, 0x1
	beq _080023C4
	b _0800243E
_08002328:
	ldr r1, [sp, 0x10]
	adds r0, r1, 0
	muls r0, r7
	ldr r2, [sp, 0xC]
	adds r0, r2
	lsls r0, 1
	ldr r1, [sp, 0x8]
	adds r6, r1, r0
	adds r0, r5, r4
	cmp r5, r0
	blt _08002340
	b _0800243E
_08002340:
	ldr r2, [sp, 0x18]
	subs r2, r7, r2
	str r2, [sp, 0x34]
	str r0, [sp, 0x38]
_08002348:
	ldr r4, [sp, 0x14]
	ldr r7, [sp, 0x18]
	adds r0, r4, r7
	adds r1, r5, 0x1
	str r1, [sp, 0x3C]
	cmp r4, r0
	bge _080023AA
	ldr r2, [sp, 0x4]
	lsls r0, r2, 4
	ldr r1, _080023C0 @ =gUnknown_30008EC
	adds r0, r1
	mov r10, r0
	ldr r7, [sp, 0x20]
	lsls r7, 16
	mov r9, r7
	ldr r1, [sp, 0x24]
	lsls r0, r1, 16
	asrs r0, 16
	mov r8, r0
_0800236E:
	ldr r2, [sp, 0x2C]
	str r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	ldr r2, [sp, 0x30]
	ldr r3, [sp, 0x28]
	bl GetTileMapIndexFromCoords
	lsls r0, 16
	lsrs r0, 15
	mov r7, r10
	ldr r1, [r7]
	adds r1, r0
	mov r0, r8
	str r0, [sp]
	adds r0, r6, 0
	ldr r2, [sp, 0x1C]
	mov r7, r9
	asrs r3, r7, 16
	bl CopyTileMapEntry
	adds r6, 0x2
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, [sp, 0x14]
	ldr r2, [sp, 0x18]
	adds r0, r1, r2
	cmp r4, r0
	blt _0800236E
_080023AA:
	ldr r5, [sp, 0x34]
	lsls r0, r5, 1
	adds r6, r0
	ldr r7, [sp, 0x3C]
	lsls r0, r7, 16
	lsrs r5, r0, 16
	ldr r0, [sp, 0x38]
	cmp r5, r0
	blt _08002348
	b _0800243E
	.align 2, 0
_080023C0: .4byte gUnknown_30008EC
_080023C4:
	ldr r1, [sp, 0x10]
	adds r0, r1, 0
	muls r0, r7
	ldr r2, [sp, 0xC]
	adds r0, r2
	ldr r1, [sp, 0x8]
	adds r6, r1, r0
	ldr r0, [sp, 0x4]
	movs r1, 0x1
	bl GetBgMetricAffineMode
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	adds r0, r5, r4
	cmp r5, r0
	bge _0800243E
	ldr r2, [sp, 0x18]
	subs r2, r7, r2
	str r2, [sp, 0x34]
	str r0, [sp, 0x38]
	ldr r7, _08002450 @ =gUnknown_30008EC
	mov r10, r7
	ldr r0, [sp, 0x4]
	lsls r0, 4
	mov r8, r0
_080023F8:
	ldr r4, [sp, 0x14]
	ldr r1, [sp, 0x18]
	adds r0, r4, r1
	adds r2, r5, 0x1
	str r2, [sp, 0x3C]
	cmp r4, r0
	bge _0800242E
	mov r3, r8
	add r3, r10
	mov r7, r9
	muls r7, r5
	mov r12, r7
	adds r2, r0, 0
_08002412:
	ldr r1, [r3]
	mov r5, r12
	adds r0, r5, r4
	adds r1, r0
	ldrb r0, [r6]
	ldr r7, [sp, 0x20]
	adds r0, r7
	strb r0, [r1]
	adds r6, 0x1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	blt _08002412
_0800242E:
	ldr r0, [sp, 0x34]
	adds r6, r0
	ldr r1, [sp, 0x3C]
	lsls r0, r1, 16
	lsrs r5, r0, 16
	ldr r2, [sp, 0x38]
	cmp r5, r2
	blt _080023F8
_0800243E:
	add sp, 0x40
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002450: .4byte gUnknown_30008EC
	thumb_func_end CopyRectToBgTilemapBufferRect

	thumb_func_start FillBgTilemapBufferRect_Palette0
FillBgTilemapBufferRect_Palette0: @ 8002454
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl IsInvalidBg32
	cmp r0, 0
	bne _08002540
	adds r0, r6, 0
	bl IsTileMapOutsideWram
	cmp r0, 0
	bne _08002540
	adds r0, r6, 0
	bl GetBgType
	cmp r0, 0
	beq _080024A6
	cmp r0, 0x1
	beq _080024F0
	b _08002540
_080024A6:
	adds r3, r7, 0
	adds r5, r3, r5
	cmp r3, r5
	bge _08002540
	adds r7, r5, 0
	lsls r1, r6, 4
	ldr r0, _080024EC @ =gUnknown_30008EC
	adds r1, r0
	mov r12, r1
_080024B8:
	mov r2, r10
	mov r1, r9
	adds r0, r2, r1
	adds r6, r3, 0x1
	cmp r2, r0
	bge _080024E0
	mov r5, r12
	ldr r4, [r5]
	lsls r3, 5
	adds r1, r0, 0
_080024CC:
	adds r0, r3, r2
	lsls r0, 1
	adds r0, r4
	mov r5, r8
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	blt _080024CC
_080024E0:
	lsls r0, r6, 16
	lsrs r3, r0, 16
	cmp r3, r7
	blt _080024B8
	b _08002540
	.align 2, 0
_080024EC: .4byte gUnknown_30008EC
_080024F0:
	adds r0, r6, 0
	movs r1, 0x1
	bl GetBgMetricAffineMode
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	adds r3, r7, 0
	adds r5, r3, r5
	cmp r3, r5
	bge _08002540
	adds r7, r5, 0
	lsls r6, 4
	mov r12, r6
_0800250C:
	mov r2, r10
	mov r1, r9
	adds r0, r2, r1
	adds r6, r3, 0x1
	cmp r2, r0
	bge _08002538
	ldr r5, _08002550 @ =gUnknown_30008EC
	add r5, r12
	ldr r1, [sp]
	adds r4, r3, 0
	muls r4, r1
	adds r3, r0, 0
_08002524:
	ldr r0, [r5]
	adds r1, r4, r2
	adds r0, r1
	mov r1, r8
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	blt _08002524
_08002538:
	lsls r0, r6, 16
	lsrs r3, r0, 16
	cmp r3, r7
	blt _0800250C
_08002540:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002550: .4byte gUnknown_30008EC
	thumb_func_end FillBgTilemapBufferRect_Palette0

	thumb_func_start FillBgTilemapBufferRect
FillBgTilemapBufferRect: @ 8002554
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	ldr r6, [sp, 0x28]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r4, 0
	str r4, [sp, 0xC]
	bl WriteSequenceToBgTilemapBuffer
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FillBgTilemapBufferRect

	thumb_func_start WriteSequenceToBgTilemapBuffer
WriteSequenceToBgTilemapBuffer: @ 8002590
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	ldr r4, [sp, 0x4C]
	ldr r5, [sp, 0x50]
	ldr r6, [sp, 0x54]
	ldr r7, [sp, 0x58]
	mov r8, r7
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	add r0, sp, 0x4
	strh r1, [r0]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x8]
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsls r5, 24
	lsrs r4, r5, 24
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0xC]
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	mov r0, r9
	bl IsInvalidBg32
	cmp r0, 0
	beq _080025DE
	b _08002724
_080025DE:
	mov r0, r9
	bl IsTileMapOutsideWram
	cmp r0, 0
	beq _080025EA
	b _08002724
_080025EA:
	mov r0, r9
	movs r1, 0x4
	bl GetBgControlAttribute
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x1C]
	mov r0, r9
	movs r1, 0x1
	bl GetBgMetricTextMode
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x14]
	mov r0, r9
	movs r1, 0x2
	bl GetBgMetricTextMode
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x18]
	mov r0, r9
	bl GetBgType
	cmp r0, 0
	beq _08002624
	cmp r0, 0x1
	beq _080026AC
	b _08002724
_08002624:
	adds r5, r7, 0
	adds r0, r5, r4
	cmp r5, r0
	bge _08002724
	str r0, [sp, 0x24]
	add r7, sp, 0x4
_08002630:
	ldr r4, [sp, 0x8]
	mov r1, r10
	adds r0, r4, r1
	adds r2, r5, 0x1
	mov r8, r2
	cmp r4, r0
	bge _08002694
	mov r3, r9
	lsls r1, r3, 4
	ldr r0, _080026A4 @ =gUnknown_30008EC
	adds r6, r1, r0
_08002646:
	ldr r0, [sp, 0x18]
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	ldr r2, [sp, 0x1C]
	ldr r3, [sp, 0x14]
	bl GetTileMapIndexFromCoords
	lsls r0, 16
	lsrs r0, 15
	ldr r1, [r6]
	adds r1, r0
	movs r0, 0
	str r0, [sp]
	add r0, sp, 0x4
	ldr r2, [sp, 0xC]
	movs r3, 0
	bl CopyTileMapEntry
	ldrh r0, [r7]
	movs r2, 0xFC
	lsls r2, 8
	adds r1, r2, 0
	adds r2, r0, 0
	ands r2, r1
	ldr r3, [sp, 0x10]
	adds r0, r3
	ldr r3, _080026A8 @ =0x000003ff
	adds r1, r3, 0
	ands r0, r1
	adds r2, r0
	strh r2, [r7]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [sp, 0x8]
	add r0, r10
	cmp r4, r0
	blt _08002646
_08002694:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r5, r0, 16
	ldr r2, [sp, 0x24]
	cmp r5, r2
	blt _08002630
	b _08002724
	.align 2, 0
_080026A4: .4byte gUnknown_30008EC
_080026A8: .4byte 0x000003ff
_080026AC:
	mov r0, r9
	movs r1, 0x1
	bl GetBgMetricAffineMode
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x20]
	adds r5, r7, 0
	adds r0, r5, r4
	cmp r5, r0
	bge _08002724
	str r0, [sp, 0x24]
	mov r3, r9
	lsls r3, 4
	mov r12, r3
_080026CA:
	ldr r4, [sp, 0x8]
	mov r7, r10
	adds r0, r4, r7
	adds r1, r5, 0x1
	mov r8, r1
	cmp r4, r0
	bge _08002718
	ldr r2, _08002734 @ =gUnknown_30008EC
	add r2, r12
	str r2, [sp, 0x28]
	ldr r7, [sp, 0x20]
	adds r3, r5, 0
	muls r3, r7
	add r2, sp, 0x4
	movs r1, 0xFC
	lsls r1, 8
	mov r9, r1
	ldr r7, _08002738 @ =0x000003ff
	adds r5, r7, 0
	adds r6, r0, 0
_080026F2:
	ldr r0, [sp, 0x28]
	ldr r1, [r0]
	adds r0, r3, r4
	adds r1, r0
	ldrh r0, [r2]
	strb r0, [r1]
	ldrh r0, [r2]
	mov r1, r9
	ands r1, r0
	ldr r7, [sp, 0x10]
	adds r0, r7
	ands r0, r5
	adds r1, r0
	strh r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r6
	blt _080026F2
_08002718:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r5, r0, 16
	ldr r2, [sp, 0x24]
	cmp r5, r2
	blt _080026CA
_08002724:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002734: .4byte gUnknown_30008EC
_08002738: .4byte 0x000003ff
	thumb_func_end WriteSequenceToBgTilemapBuffer

	thumb_func_start GetBgMetricTextMode
GetBgMetricTextMode: @ 800273C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0x4
	bl GetBgControlAttribute
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x1
	beq _0800277C
	cmp r4, 0x1
	bgt _08002760
	cmp r4, 0
	beq _08002766
	b _080027A2
_08002760:
	cmp r5, 0x2
	beq _0800278E
	b _080027A2
_08002766:
	cmp r0, 0x2
	bgt _08002774
	cmp r0, 0x1
	bge _0800279E
_0800276E:
	cmp r0, 0
	beq _08002796
	b _080027A2
_08002774:
	cmp r0, 0x3
	bne _080027A2
	movs r0, 0x4
	b _080027A4
_0800277C:
	cmp r0, 0x1
	beq _0800279E
	cmp r0, 0x1
	ble _0800276E
	cmp r0, 0x2
	beq _08002796
	cmp r0, 0x3
	bne _080027A2
	b _0800279E
_0800278E:
	cmp r0, 0
	blt _080027A2
	cmp r0, 0x1
	bgt _0800279A
_08002796:
	movs r0, 0x1
	b _080027A4
_0800279A:
	cmp r0, 0x3
	bgt _080027A2
_0800279E:
	movs r0, 0x2
	b _080027A4
_080027A2:
	movs r0, 0
_080027A4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetBgMetricTextMode

	thumb_func_start GetBgMetricAffineMode
GetBgMetricAffineMode: @ 80027AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r1, 0x4
	bl GetBgControlAttribute
	lsls r0, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	cmp r4, 0
	beq _080027D4
	cmp r4, 0
	blt _080027FC
	cmp r4, 0x2
	bgt _080027FC
	movs r0, 0x10
	lsls r0, r1
	b _080027FE
_080027D4:
	cmp r1, 0x1
	beq _080027F0
	cmp r1, 0x1
	bgt _080027E2
	cmp r1, 0
	beq _080027EC
	b _080027FC
_080027E2:
	cmp r0, 0x2
	beq _080027F4
	cmp r0, 0x3
	beq _080027F8
	b _080027FC
_080027EC:
	movs r0, 0x1
	b _080027FE
_080027F0:
	movs r0, 0x4
	b _080027FE
_080027F4:
	movs r0, 0x10
	b _080027FE
_080027F8:
	movs r0, 0x40
	b _080027FE
_080027FC:
	movs r0, 0
_080027FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBgMetricAffineMode

	thumb_func_start GetTileMapIndexFromCoords
GetTileMapIndexFromCoords: @ 8002804
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [sp, 0x8]
	subs r3, 0x1
	ands r4, r3
	subs r0, 0x1
	ands r1, r0
	cmp r2, 0x1
	beq _08002828
	cmp r2, 0x1
	ble _08002830
	cmp r2, 0x2
	beq _08002830
	cmp r2, 0x3
	bne _08002830
	cmp r1, 0x1F
	ble _08002828
	adds r1, 0x20
_08002828:
	cmp r4, 0x1F
	ble _08002830
	subs r4, 0x20
	adds r1, 0x20
_08002830:
	lsls r0, r1, 5
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetTileMapIndexFromCoords

	thumb_func_start CopyTileMapEntry
CopyTileMapEntry: @ 800283C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r5, [sp, 0x10]
	cmp r2, 0x10
	beq _08002864
	cmp r2, 0x10
	bgt _08002884
	cmp r2, 0
	blt _08002884
	ldrh r0, [r4]
	adds r0, r3
	ldr r3, _08002860 @ =0x00000fff
	adds r1, r3, 0
	ands r0, r1
	adds r1, r2, r5
	lsls r1, 12
	b _0800288A
	.align 2, 0
_08002860: .4byte 0x00000fff
_08002864:
	ldrh r1, [r6]
	movs r0, 0xFC
	lsls r0, 8
	ands r1, r0
	lsls r2, r5, 12
	adds r2, r1, r2
	ldrh r0, [r4]
	adds r0, r3
	ldr r3, _08002880 @ =0x000003ff
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	b _0800288C
	.align 2, 0
_08002880: .4byte 0x000003ff
_08002884:
	ldrh r0, [r4]
	adds r0, r3
	lsls r1, r5, 12
_0800288A:
	adds r0, r1
_0800288C:
	lsls r0, 16
	lsrs r1, r0, 16
	strh r1, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end CopyTileMapEntry

	thumb_func_start GetBgType
GetBgType: @ 8002898
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl GetBgMode
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x2
	beq _080028C6
	cmp r4, 0x2
	ble _080028B6
	cmp r4, 0x3
	beq _080028D6
	b _080028DE
_080028B6:
	cmp r5, 0
	blt _080028DE
	cmp r0, 0x1
	bgt _080028DE
	cmp r0, 0
	blt _080028DE
_080028C2:
	movs r0, 0
	b _080028E0
_080028C6:
	cmp r0, 0
	beq _080028C2
	cmp r0, 0
	blt _080028DE
	cmp r0, 0x2
	bgt _080028DE
_080028D2:
	movs r0, 0x1
	b _080028E0
_080028D6:
	cmp r0, 0
	beq _080028C2
	cmp r0, 0x2
	beq _080028D2
_080028DE:
	ldr r0, _080028E8 @ =0x0000ffff
_080028E0:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080028E8: .4byte 0x0000ffff
	thumb_func_end GetBgType

	thumb_func_start IsInvalidBg32
IsInvalidBg32: @ 80028EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080028FA
	movs r0, 0
	b _080028FC
_080028FA:
	movs r0, 0x1
_080028FC:
	pop {r1}
	bx r1
	thumb_func_end IsInvalidBg32

	thumb_func_start IsTileMapOutsideWram
IsTileMapOutsideWram: @ 8002900
	push {lr}
	lsls r0, 24
	ldr r1, _0800291C @ =gUnknown_30008E8
	lsrs r0, 20
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08002920 @ =0x03008000
	cmp r1, r0
	bhi _08002924
	cmp r1, 0
	beq _08002924
	movs r0, 0
	b _08002926
	.align 2, 0
_0800291C: .4byte gUnknown_30008E8
_08002920: .4byte 0x03008000
_08002924:
	movs r0, 0x1
_08002926:
	pop {r1}
	bx r1
	thumb_func_end IsTileMapOutsideWram

	.align 2, 0 @ Don't pad with nop.
