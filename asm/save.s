	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ClearSaveData
ClearSaveData: @ 80D972C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080D974C @ =EraseFlashSector
_080D9732:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _080D9732
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D974C: .4byte EraseFlashSector
	thumb_func_end ClearSaveData

	thumb_func_start ResetSaveCounters
ResetSaveCounters: @ 80D9750
	ldr r0, _080D9760 @ =gUnknown_3005390
	movs r1, 0
	str r1, [r0]
	ldr r0, _080D9764 @ =gUnknown_3005380
	strh r1, [r0]
	ldr r0, _080D9768 @ =gUnknown_300538C
	str r1, [r0]
	bx lr
	.align 2, 0
_080D9760: .4byte gUnknown_3005390
_080D9764: .4byte gUnknown_3005380
_080D9768: .4byte gUnknown_300538C
	thumb_func_end ResetSaveCounters

	thumb_func_start SetDamagedSectorBits
SetDamagedSectorBits: @ 80D976C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r4, 0
	cmp r0, 0x1
	beq _080D97A0
	cmp r0, 0x1
	bgt _080D9786
	cmp r0, 0
	beq _080D978C
	b _080D97C4
_080D9786:
	cmp r0, 0x2
	beq _080D97B4
	b _080D97C4
_080D978C:
	ldr r2, _080D979C @ =gUnknown_300538C
	movs r1, 0x1
	lsls r1, r3
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _080D97C4
	.align 2, 0
_080D979C: .4byte gUnknown_300538C
_080D97A0:
	ldr r2, _080D97B0 @ =gUnknown_300538C
	adds r1, r0, 0
	lsls r1, r3
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	b _080D97C4
	.align 2, 0
_080D97B0: .4byte gUnknown_300538C
_080D97B4:
	ldr r0, _080D97CC @ =gUnknown_300538C
	movs r1, 0x1
	lsls r1, r3
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	beq _080D97C4
	movs r4, 0x1
_080D97C4:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D97CC: .4byte gUnknown_300538C
	thumb_func_end SetDamagedSectorBits

	thumb_func_start save_write_to_flash
save_write_to_flash: @ 80D97D0
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _080D97F4 @ =gUnknown_3005394
	ldr r0, _080D97F8 @ =gUnknown_2039A38
	str r0, [r1]
	ldr r0, _080D97FC @ =0x0000ffff
	cmp r2, r0
	beq _080D9800
	adds r0, r2, 0
	adds r1, r7, 0
	bl HandleWriteSector
	lsls r0, 24
	lsrs r5, r0, 24
	b _080D9852
	.align 2, 0
_080D97F4: .4byte gUnknown_3005394
_080D97F8: .4byte gUnknown_2039A38
_080D97FC: .4byte 0x0000ffff
_080D9800:
	ldr r1, _080D985C @ =gUnknown_3005388
	ldr r5, _080D9860 @ =gUnknown_3005380
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _080D9864 @ =gUnknown_3005384
	ldr r6, _080D9868 @ =gUnknown_3005390
	ldr r4, [r6]
	str r4, [r1]
	adds r0, 0x1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, 0xE
	bl __umodsi3
	strh r0, [r5]
	adds r4, 0x1
	str r4, [r6]
	movs r5, 0x1
	movs r4, 0
_080D9826:
	adds r0, r4, 0
	adds r1, r7, 0
	bl HandleWriteSector
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _080D9826
	ldr r0, _080D986C @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080D9852
	movs r5, 0xFF
	ldr r1, _080D9860 @ =gUnknown_3005380
	ldr r0, _080D985C @ =gUnknown_3005388
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080D9868 @ =gUnknown_3005390
	ldr r0, _080D9864 @ =gUnknown_3005384
	ldr r0, [r0]
	str r0, [r1]
_080D9852:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D985C: .4byte gUnknown_3005388
_080D9860: .4byte gUnknown_3005380
_080D9864: .4byte gUnknown_3005384
_080D9868: .4byte gUnknown_3005390
_080D986C: .4byte gUnknown_300538C
	thumb_func_end save_write_to_flash

	thumb_func_start HandleWriteSector
HandleWriteSector: @ 80D9870
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080D993C @ =gUnknown_3005380
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _080D9940 @ =gUnknown_3005390
	ldr r1, [r2]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r6, 3
	adds r0, r4
	ldr r1, [r0]
	mov r10, r1
	ldrh r4, [r0, 0x4]
	movs r3, 0
	mov r9, r2
	ldr r2, _080D9944 @ =gUnknown_3005394
	mov r12, r2
	mov r8, r12
	movs r2, 0
	ldr r1, _080D9948 @ =0x00000fff
_080D98C2:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r3
	strb r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bls _080D98C2
	mov r0, r12
	ldr r1, [r0]
	ldr r2, _080D994C @ =0x00000ff4
	adds r0, r1, r2
	strh r6, [r0]
	ldr r3, _080D9950 @ =0x00000ff8
	adds r2, r1, r3
	ldr r0, _080D9954 @ =0x08012025
	str r0, [r2]
	ldr r6, _080D9958 @ =0x00000ffc
	adds r1, r6
	mov r7, r9
	ldr r0, [r7]
	str r0, [r1]
	movs r3, 0
	lsls r5, 24
	cmp r3, r4
	bcs _080D9910
	mov r2, r12
_080D98FA:
	ldr r1, [r2]
	adds r1, r3
	mov r6, r10
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _080D98FA
_080D9910:
	mov r0, r10
	adds r1, r4, 0
	bl CalculateChecksum
	ldr r1, _080D9944 @ =gUnknown_3005394
	ldr r1, [r1]
	ldr r7, _080D995C @ =0x00000ff6
	adds r2, r1, r7
	strh r0, [r2]
	lsrs r0, r5, 24
	bl TryWriteSector
	lsls r0, 24
	lsrs r0, 24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D993C: .4byte gUnknown_3005380
_080D9940: .4byte gUnknown_3005390
_080D9944: .4byte gUnknown_3005394
_080D9948: .4byte 0x00000fff
_080D994C: .4byte 0x00000ff4
_080D9950: .4byte 0x00000ff8
_080D9954: .4byte 0x08012025
_080D9958: .4byte 0x00000ffc
_080D995C: .4byte 0x00000ff6
	thumb_func_end HandleWriteSector

	thumb_func_start HandleWriteSectorNBytes
HandleWriteSectorNBytes: @ 80D9960
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080D99C4 @ =gUnknown_2039A38
	movs r3, 0
	movs r6, 0
	ldr r1, _080D99C8 @ =0x00000fff
_080D9974:
	adds r0, r4, r3
	strb r6, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bls _080D9974
	ldr r0, _080D99CC @ =0x00000ff8
	adds r1, r4, r0
	ldr r0, _080D99D0 @ =0x08012025
	str r0, [r1]
	movs r3, 0
	cmp r3, r2
	bcs _080D99A2
_080D9990:
	adds r1, r4, r3
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _080D9990
_080D99A2:
	adds r0, r5, 0
	adds r1, r2, 0
	bl CalculateChecksum
	ldr r2, _080D99D4 @ =0x00000ff4
	adds r1, r4, r2
	strh r0, [r1]
	adds r0, r7, 0
	adds r1, r4, 0
	bl TryWriteSector
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D99C4: .4byte gUnknown_2039A38
_080D99C8: .4byte 0x00000fff
_080D99CC: .4byte 0x00000ff8
_080D99D0: .4byte 0x08012025
_080D99D4: .4byte 0x00000ff4
	thumb_func_end HandleWriteSectorNBytes

	thumb_func_start TryWriteSector
TryWriteSector: @ 80D99D8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl ProgramFlashSectorAndVerify
	cmp r0, 0
	bne _080D99F4
	movs r0, 0x1
	adds r1, r4, 0
	bl SetDamagedSectorBits
	movs r0, 0x1
	b _080D99FE
_080D99F4:
	movs r0, 0
	adds r1, r4, 0
	bl SetDamagedSectorBits
	movs r0, 0xFF
_080D99FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryWriteSector

	thumb_func_start RestoreSaveBackupVarsAndIncrement
RestoreSaveBackupVarsAndIncrement: @ 80D9A04
	push {r4-r6,lr}
	ldr r1, _080D9A40 @ =gUnknown_3005394
	ldr r0, _080D9A44 @ =gUnknown_2039A38
	str r0, [r1]
	ldr r1, _080D9A48 @ =gUnknown_3005388
	ldr r5, _080D9A4C @ =gUnknown_3005380
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _080D9A50 @ =gUnknown_3005384
	ldr r6, _080D9A54 @ =gUnknown_3005390
	ldr r4, [r6]
	str r4, [r1]
	adds r0, 0x1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, 0xE
	bl __umodsi3
	strh r0, [r5]
	adds r4, 0x1
	str r4, [r6]
	ldr r1, _080D9A58 @ =gUnknown_3005398
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080D9A5C @ =gUnknown_300538C
	movs r0, 0
	str r0, [r1]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D9A40: .4byte gUnknown_3005394
_080D9A44: .4byte gUnknown_2039A38
_080D9A48: .4byte gUnknown_3005388
_080D9A4C: .4byte gUnknown_3005380
_080D9A50: .4byte gUnknown_3005384
_080D9A54: .4byte gUnknown_3005390
_080D9A58: .4byte gUnknown_3005398
_080D9A5C: .4byte gUnknown_300538C
	thumb_func_end RestoreSaveBackupVarsAndIncrement

	thumb_func_start RestoreSaveBackupVars
RestoreSaveBackupVars: @ 80D9A60
	ldr r1, _080D9A84 @ =gUnknown_3005394
	ldr r0, _080D9A88 @ =gUnknown_2039A38
	str r0, [r1]
	ldr r1, _080D9A8C @ =gUnknown_3005388
	ldr r0, _080D9A90 @ =gUnknown_3005380
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080D9A94 @ =gUnknown_3005384
	ldr r0, _080D9A98 @ =gUnknown_3005390
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _080D9A9C @ =gUnknown_3005398
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080D9AA0 @ =gUnknown_300538C
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080D9A84: .4byte gUnknown_3005394
_080D9A88: .4byte gUnknown_2039A38
_080D9A8C: .4byte gUnknown_3005388
_080D9A90: .4byte gUnknown_3005380
_080D9A94: .4byte gUnknown_3005384
_080D9A98: .4byte gUnknown_3005390
_080D9A9C: .4byte gUnknown_3005398
_080D9AA0: .4byte gUnknown_300538C
	thumb_func_end RestoreSaveBackupVars

	thumb_func_start sub_80D9AA4
sub_80D9AA4: @ 80D9AA4
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080D9AE0 @ =gUnknown_3005398
	ldrh r2, [r4]
	subs r0, 0x1
	cmp r2, r0
	bge _080D9AF8
	movs r5, 0x1
	adds r0, r2, 0
	bl HandleWriteSector
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r0, _080D9AE4 @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080D9AFA
	movs r5, 0xFF
	ldr r1, _080D9AE8 @ =gUnknown_3005380
	ldr r0, _080D9AEC @ =gUnknown_3005388
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080D9AF0 @ =gUnknown_3005390
	ldr r0, _080D9AF4 @ =gUnknown_3005384
	ldr r0, [r0]
	str r0, [r1]
	b _080D9AFA
	.align 2, 0
_080D9AE0: .4byte gUnknown_3005398
_080D9AE4: .4byte gUnknown_300538C
_080D9AE8: .4byte gUnknown_3005380
_080D9AEC: .4byte gUnknown_3005388
_080D9AF0: .4byte gUnknown_3005390
_080D9AF4: .4byte gUnknown_3005384
_080D9AF8:
	movs r5, 0xFF
_080D9AFA:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D9AA4

	thumb_func_start sub_80D9B04
sub_80D9B04: @ 80D9B04
	push {r4,lr}
	lsls r0, 16
	movs r4, 0x1
	ldr r2, _080D9B38 @ =0xffff0000
	adds r0, r2
	lsrs r0, 16
	bl ClearSaveData_2
	ldr r0, _080D9B3C @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080D9B2E
	movs r4, 0xFF
	ldr r1, _080D9B40 @ =gUnknown_3005380
	ldr r0, _080D9B44 @ =gUnknown_3005388
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080D9B48 @ =gUnknown_3005390
	ldr r0, _080D9B4C @ =gUnknown_3005384
	ldr r0, [r0]
	str r0, [r1]
_080D9B2E:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D9B38: .4byte 0xffff0000
_080D9B3C: .4byte gUnknown_300538C
_080D9B40: .4byte gUnknown_3005380
_080D9B44: .4byte gUnknown_3005388
_080D9B48: .4byte gUnknown_3005390
_080D9B4C: .4byte gUnknown_3005384
	thumb_func_end sub_80D9B04

	thumb_func_start ClearSaveData_2
ClearSaveData_2: @ 80D9B50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080D9C1C @ =gUnknown_3005380
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _080D9C20 @ =gUnknown_3005390
	ldr r1, [r2]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r6, 3
	adds r0, r4
	ldr r1, [r0]
	mov r10, r1
	ldrh r3, [r0, 0x4]
	movs r4, 0
	mov r9, r2
	ldr r2, _080D9C24 @ =gUnknown_3005394
	mov r12, r2
	mov r8, r12
	movs r2, 0
	ldr r1, _080D9C28 @ =0x00000fff
_080D9BA2:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r4
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	bls _080D9BA2
	mov r0, r12
	ldr r1, [r0]
	ldr r2, _080D9C2C @ =0x00000ff4
	adds r0, r1, r2
	strh r6, [r0]
	ldr r6, _080D9C30 @ =0x00000ff8
	adds r2, r1, r6
	ldr r0, _080D9C34 @ =0x08012025
	str r0, [r2]
	ldr r7, _080D9C38 @ =0x00000ffc
	adds r1, r7
	mov r2, r9
	ldr r0, [r2]
	str r0, [r1]
	movs r4, 0
	lsls r6, r5, 24
	mov r8, r6
	cmp r4, r3
	bcs _080D9BF2
	mov r2, r12
_080D9BDC:
	ldr r1, [r2]
	adds r1, r4
	mov r7, r10
	adds r0, r7, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r3
	bcc _080D9BDC
_080D9BF2:
	mov r0, r10
	adds r1, r3, 0
	bl CalculateChecksum
	ldr r1, _080D9C24 @ =gUnknown_3005394
	ldr r1, [r1]
	ldr r2, _080D9C3C @ =0x00000ff6
	adds r1, r2
	strh r0, [r1]
	ldr r0, _080D9C40 @ =EraseFlashSector
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	movs r6, 0x1
	movs r4, 0
	ldr r7, _080D9C44 @ =0x00000ff7
	mov r9, r7
	ldr r7, _080D9C48 @ =ProgramFlashByte
	b _080D9C52
	.align 2, 0
_080D9C1C: .4byte gUnknown_3005380
_080D9C20: .4byte gUnknown_3005390
_080D9C24: .4byte gUnknown_3005394
_080D9C28: .4byte 0x00000fff
_080D9C2C: .4byte 0x00000ff4
_080D9C30: .4byte 0x00000ff8
_080D9C34: .4byte 0x08012025
_080D9C38: .4byte 0x00000ffc
_080D9C3C: .4byte 0x00000ff6
_080D9C40: .4byte EraseFlashSector
_080D9C44: .4byte 0x00000ff7
_080D9C48: .4byte ProgramFlashByte
_080D9C4C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080D9C52:
	cmp r4, r9
	bhi _080D9C70
	ldr r0, _080D9C7C @ =gUnknown_3005394
	ldr r0, [r0]
	adds r0, r4
	ldrb r2, [r0]
	ldr r3, [r7]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	beq _080D9C4C
	movs r6, 0xFF
_080D9C70:
	cmp r6, 0xFF
	bne _080D9C80
	mov r0, r8
	lsrs r1, r0, 24
	b _080D9CD8
	.align 2, 0
_080D9C7C: .4byte gUnknown_3005394
_080D9C80:
	movs r6, 0x1
	movs r4, 0
	ldr r1, _080D9C8C @ =ProgramFlashByte
	mov r9, r1
	ldr r7, _080D9C90 @ =0x00000ff9
	b _080D9C9A
	.align 2, 0
_080D9C8C: .4byte ProgramFlashByte
_080D9C90: .4byte 0x00000ff9
_080D9C94:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080D9C9A:
	cmp r4, 0x6
	bhi _080D9CBC
	adds r1, r4, r7
	ldr r0, _080D9CD0 @ =gUnknown_3005394
	ldr r0, [r0]
	adds r0, r4, r0
	adds r0, r7
	ldrb r2, [r0]
	mov r0, r9
	ldr r3, [r0]
	adds r0, r5, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	beq _080D9C94
	movs r6, 0xFF
_080D9CBC:
	cmp r6, 0xFF
	beq _080D9CD4
	mov r2, r8
	lsrs r1, r2, 24
	movs r0, 0x1
	bl SetDamagedSectorBits
	movs r0, 0x1
	b _080D9CE0
	.align 2, 0
_080D9CD0: .4byte gUnknown_3005394
_080D9CD4:
	mov r6, r8
	lsrs r1, r6, 24
_080D9CD8:
	movs r0, 0
	bl SetDamagedSectorBits
	movs r0, 0xFF
_080D9CE0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ClearSaveData_2

	thumb_func_start sub_80D9CF0
sub_80D9CF0: @ 80D9CF0
	push {r4-r6,lr}
	lsls r0, 16
	ldr r6, _080D9D4C @ =gUnknown_3005380
	lsrs r0, 16
	ldrh r1, [r6]
	adds r0, r1
	subs r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _080D9D50 @ =gUnknown_3005390
	ldr r1, [r5]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, _080D9D54 @ =ProgramFlashByte
	ldr r1, _080D9D58 @ =0x00000ff8
	ldr r0, _080D9D5C @ =gUnknown_3005394
	ldr r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	bne _080D9D60
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	bl SetDamagedSectorBits
	movs r0, 0x1
	b _080D9D78
	.align 2, 0
_080D9D4C: .4byte gUnknown_3005380
_080D9D50: .4byte gUnknown_3005390
_080D9D54: .4byte ProgramFlashByte
_080D9D58: .4byte 0x00000ff8
_080D9D5C: .4byte gUnknown_3005394
_080D9D60:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0
	bl SetDamagedSectorBits
	ldr r0, _080D9D80 @ =gUnknown_3005388
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _080D9D84 @ =gUnknown_3005384
	ldr r0, [r0]
	str r0, [r5]
	movs r0, 0xFF
_080D9D78:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D9D80: .4byte gUnknown_3005388
_080D9D84: .4byte gUnknown_3005384
	thumb_func_end sub_80D9CF0

	thumb_func_start sub_80D9D88
sub_80D9D88: @ 80D9D88
	push {r4-r6,lr}
	lsls r0, 16
	ldr r6, _080D9DDC @ =gUnknown_3005380
	lsrs r0, 16
	ldrh r1, [r6]
	adds r0, r1
	subs r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _080D9DE0 @ =gUnknown_3005390
	ldr r1, [r5]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080D9DE4 @ =ProgramFlashByte
	ldr r1, _080D9DE8 @ =0x00000ff8
	ldr r3, [r0]
	adds r0, r4, 0
	movs r2, 0x25
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	bne _080D9DEC
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	bl SetDamagedSectorBits
	movs r0, 0x1
	b _080D9E04
	.align 2, 0
_080D9DDC: .4byte gUnknown_3005380
_080D9DE0: .4byte gUnknown_3005390
_080D9DE4: .4byte ProgramFlashByte
_080D9DE8: .4byte 0x00000ff8
_080D9DEC:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0
	bl SetDamagedSectorBits
	ldr r0, _080D9E0C @ =gUnknown_3005388
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _080D9E10 @ =gUnknown_3005384
	ldr r0, [r0]
	str r0, [r5]
	movs r0, 0xFF
_080D9E04:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D9E0C: .4byte gUnknown_3005388
_080D9E10: .4byte gUnknown_3005384
	thumb_func_end sub_80D9D88

	thumb_func_start sub_80D9E14
sub_80D9E14: @ 80D9E14
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080D9E2C @ =gUnknown_3005394
	ldr r0, _080D9E30 @ =gUnknown_2039A38
	str r0, [r1]
	ldr r0, _080D9E34 @ =0x0000ffff
	cmp r4, r0
	beq _080D9E38
	movs r5, 0xFF
	b _080D9E4A
	.align 2, 0
_080D9E2C: .4byte gUnknown_3005394
_080D9E30: .4byte gUnknown_2039A38
_080D9E34: .4byte 0x0000ffff
_080D9E38:
	adds r0, r6, 0
	bl GetSaveValidStatus
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80D9E54
_080D9E4A:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80D9E14

	thumb_func_start sub_80D9E54
sub_80D9E54: @ 80D9E54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r0, _080D9EF0 @ =gUnknown_3005390
	ldr r1, [r0]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 17
	lsrs r7, r0, 16
	movs r5, 0
	ldr r6, _080D9EF4 @ =gUnknown_3005394
_080D9E70:
	adds r0, r5, r7
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r6]
	bl DoReadFlashWholeSection
	ldr r0, [r6]
	ldr r1, _080D9EF8 @ =0x00000ff4
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	bne _080D9E8C
	ldr r0, _080D9EFC @ =gUnknown_3005380
	strh r5, [r0]
_080D9E8C:
	ldr r0, [r6]
	lsls r1, 3
	mov r2, r8
	adds r4, r1, r2
	ldrh r1, [r4, 0x4]
	bl CalculateChecksum
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, [r6]
	ldr r1, _080D9F00 @ =0x00000ff8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _080D9F04 @ =0x08012025
	adds r5, 0x1
	cmp r1, r0
	bne _080D9EDC
	ldr r1, _080D9F08 @ =0x00000ff6
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _080D9EDC
	movs r2, 0
	ldrh r0, [r4, 0x4]
	cmp r2, r0
	bcs _080D9EDC
	adds r3, r4, 0
	ldr r4, _080D9EF4 @ =gUnknown_3005394
_080D9EC4:
	ldr r1, [r3]
	adds r1, r2
	ldr r0, [r4]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r1, [r3, 0x4]
	cmp r2, r1
	bcc _080D9EC4
_080D9EDC:
	lsls r0, r5, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _080D9E70
	movs r0, 0x1
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D9EF0: .4byte gUnknown_3005390
_080D9EF4: .4byte gUnknown_3005394
_080D9EF8: .4byte 0x00000ff4
_080D9EFC: .4byte gUnknown_3005380
_080D9F00: .4byte 0x00000ff8
_080D9F04: .4byte 0x08012025
_080D9F08: .4byte 0x00000ff6
	thumb_func_end sub_80D9E54

	thumb_func_start GetSaveValidStatus
GetSaveValidStatus: @ 80D9F0C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	movs r0, 0
	mov r8, r0
	mov r9, r0
	movs r6, 0
	movs r5, 0
	movs r4, 0
	ldr r7, _080D9F98 @ =gUnknown_3005394
_080D9F28:
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r1, [r7]
	bl DoReadFlashWholeSection
	ldr r2, [r7]
	ldr r1, _080D9F9C @ =0x00000ff8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _080D9FA0 @ =0x08012025
	cmp r1, r0
	bne _080D9F78
	movs r5, 0x1
	ldr r3, _080D9FA4 @ =0x00000ff4
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, 3
	add r0, r10
	ldrh r1, [r0, 0x4]
	adds r0, r2, 0
	bl CalculateChecksum
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, [r7]
	ldr r3, _080D9FA8 @ =0x00000ff6
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _080D9F78
	ldr r2, _080D9FAC @ =0x00000ffc
	adds r0, r1, r2
	ldr r0, [r0]
	mov r8, r0
	subs r3, 0x2
	adds r1, r3
	adds r0, r5, 0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_080D9F78:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _080D9F28
	cmp r5, 0
	beq _080D9FB4
	ldr r0, _080D9FB0 @ =0x00003fff
	movs r1, 0xFF
	str r1, [sp]
	cmp r6, r0
	bne _080D9FB8
	movs r2, 0x1
	str r2, [sp]
	b _080D9FB8
	.align 2, 0
_080D9F98: .4byte gUnknown_3005394
_080D9F9C: .4byte 0x00000ff8
_080D9FA0: .4byte 0x08012025
_080D9FA4: .4byte 0x00000ff4
_080D9FA8: .4byte 0x00000ff6
_080D9FAC: .4byte 0x00000ffc
_080D9FB0: .4byte 0x00003fff
_080D9FB4:
	movs r3, 0
	str r3, [sp]
_080D9FB8:
	movs r6, 0
	movs r5, 0
	movs r4, 0
	ldr r7, _080DA030 @ =gUnknown_3005394
_080D9FC0:
	adds r0, r4, 0
	adds r0, 0xE
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r7]
	bl DoReadFlashWholeSection
	ldr r2, [r7]
	ldr r1, _080DA034 @ =0x00000ff8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _080DA038 @ =0x08012025
	cmp r1, r0
	bne _080DA014
	movs r5, 0x1
	ldr r3, _080DA03C @ =0x00000ff4
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, 3
	add r0, r10
	ldrh r1, [r0, 0x4]
	adds r0, r2, 0
	bl CalculateChecksum
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, [r7]
	ldr r3, _080DA040 @ =0x00000ff6
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _080DA014
	ldr r2, _080DA044 @ =0x00000ffc
	adds r0, r1, r2
	ldr r0, [r0]
	mov r9, r0
	subs r3, 0x2
	adds r1, r3
	adds r0, r5, 0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_080DA014:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _080D9FC0
	cmp r5, 0
	beq _080DA04C
	ldr r0, _080DA048 @ =0x00003fff
	movs r1, 0xFF
	cmp r6, r0
	bne _080DA04E
	movs r1, 0x1
	b _080DA04E
	.align 2, 0
_080DA030: .4byte gUnknown_3005394
_080DA034: .4byte 0x00000ff8
_080DA038: .4byte 0x08012025
_080DA03C: .4byte 0x00000ff4
_080DA040: .4byte 0x00000ff6
_080DA044: .4byte 0x00000ffc
_080DA048: .4byte 0x00003fff
_080DA04C:
	movs r1, 0
_080DA04E:
	ldr r0, [sp]
	cmp r0, 0x1
	bne _080DA0C0
	cmp r1, 0x1
	bne _080DA0B0
	movs r0, 0x1
	negs r0, r0
	cmp r8, r0
	bne _080DA066
	mov r1, r9
	cmp r1, 0
	beq _080DA070
_080DA066:
	mov r2, r8
	cmp r2, 0
	bne _080DA094
	cmp r9, r0
	bne _080DA094
_080DA070:
	mov r1, r8
	adds r1, 0x1
	mov r0, r9
	adds r0, 0x1
	cmp r1, r0
	bcs _080DA088
	ldr r0, _080DA084 @ =gUnknown_3005390
	mov r3, r9
	b _080DA0A8
	.align 2, 0
_080DA084: .4byte gUnknown_3005390
_080DA088:
	ldr r0, _080DA090 @ =gUnknown_3005390
	mov r1, r8
	str r1, [r0]
	b _080DA0D8
	.align 2, 0
_080DA090: .4byte gUnknown_3005390
_080DA094:
	cmp r8, r9
	bcs _080DA0A4
	ldr r0, _080DA0A0 @ =gUnknown_3005390
	mov r2, r9
	str r2, [r0]
	b _080DA0D8
	.align 2, 0
_080DA0A0: .4byte gUnknown_3005390
_080DA0A4:
	ldr r0, _080DA0AC @ =gUnknown_3005390
	mov r3, r8
_080DA0A8:
	str r3, [r0]
	b _080DA0D8
	.align 2, 0
_080DA0AC: .4byte gUnknown_3005390
_080DA0B0:
	ldr r0, _080DA0BC @ =gUnknown_3005390
	mov r2, r8
	str r2, [r0]
	cmp r1, 0xFF
	beq _080DA0D0
	b _080DA0D8
	.align 2, 0
_080DA0BC: .4byte gUnknown_3005390
_080DA0C0:
	cmp r1, 0x1
	bne _080DA0DC
	ldr r0, _080DA0D4 @ =gUnknown_3005390
	mov r3, r9
	str r3, [r0]
	ldr r0, [sp]
	cmp r0, 0xFF
	bne _080DA0D8
_080DA0D0:
	movs r0, 0xFF
	b _080DA108
	.align 2, 0
_080DA0D4: .4byte gUnknown_3005390
_080DA0D8:
	movs r0, 0x1
	b _080DA108
_080DA0DC:
	ldr r2, [sp]
	cmp r2, 0
	bne _080DA0FC
	cmp r1, 0
	bne _080DA0FC
	ldr r0, _080DA0F4 @ =gUnknown_3005390
	str r1, [r0]
	ldr r0, _080DA0F8 @ =gUnknown_3005380
	strh r1, [r0]
	movs r0, 0
	b _080DA108
	.align 2, 0
_080DA0F4: .4byte gUnknown_3005390
_080DA0F8: .4byte gUnknown_3005380
_080DA0FC:
	ldr r0, _080DA118 @ =gUnknown_3005390
	movs r1, 0
	str r1, [r0]
	ldr r0, _080DA11C @ =gUnknown_3005380
	strh r1, [r0]
	movs r0, 0x2
_080DA108:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DA118: .4byte gUnknown_3005390
_080DA11C: .4byte gUnknown_3005380
	thumb_func_end GetSaveValidStatus

	thumb_func_start sub_80DA120
sub_80DA120: @ 80DA120
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r4, r2, 16
	ldr r5, _080DA174 @ =gUnknown_2039A38
	adds r1, r5, 0
	bl DoReadFlashWholeSection
	ldr r1, _080DA178 @ =0x00000ff8
	adds r0, r5, r1
	ldr r1, [r0]
	ldr r0, _080DA17C @ =0x08012025
	cmp r1, r0
	bne _080DA188
	adds r0, r5, 0
	adds r1, r4, 0
	bl CalculateChecksum
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080DA180 @ =0x00000ff4
	adds r1, r5, r2
	ldrh r1, [r1]
	cmp r1, r0
	bne _080DA184
	movs r2, 0
	cmp r2, r4
	bcs _080DA16E
_080DA15C:
	adds r1, r6, r2
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bcc _080DA15C
_080DA16E:
	movs r0, 0x1
	b _080DA18A
	.align 2, 0
_080DA174: .4byte gUnknown_2039A38
_080DA178: .4byte 0x00000ff8
_080DA17C: .4byte 0x08012025
_080DA180: .4byte 0x00000ff4
_080DA184:
	movs r0, 0x2
	b _080DA18A
_080DA188:
	movs r0, 0
_080DA18A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA120

	thumb_func_start DoReadFlashWholeSection
DoReadFlashWholeSection: @ 80DA190
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	bl ReadFlash
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end DoReadFlashWholeSection

	thumb_func_start CalculateChecksum
CalculateChecksum: @ 80DA1A8
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	movs r2, 0
	movs r3, 0
	lsrs r1, 18
	cmp r2, r1
	bcs _080DA1C6
_080DA1B8:
	ldm r4!, {r0}
	adds r2, r0
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bcc _080DA1B8
_080DA1C6:
	lsrs r0, r2, 16
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CalculateChecksum

	thumb_func_start UpdateSaveAddresses
UpdateSaveAddresses: @ 80DA1D4
	push {r4,r5,lr}
	ldr r3, _080DA234 @ =gUnknown_30053B0
	ldr r0, _080DA238 @ =gUnknown_300500C
	ldr r2, _080DA23C @ =gUnknown_83FEC94
	ldrh r1, [r2]
	ldr r0, [r0]
	adds r0, r1
	str r0, [r3]
	ldrh r0, [r2, 0x2]
	strh r0, [r3, 0x4]
	ldr r5, _080DA240 @ =gUnknown_3005008
	adds r3, 0x8
	adds r2, 0x4
	movs r4, 0x3
_080DA1F0:
	ldrh r0, [r2]
	ldr r1, [r5]
	adds r1, r0
	str r1, [r3]
	ldrh r0, [r2, 0x2]
	strh r0, [r3, 0x4]
	adds r3, 0x8
	adds r2, 0x4
	subs r4, 0x1
	cmp r4, 0
	bge _080DA1F0
	movs r4, 0x5
	ldr r1, _080DA234 @ =gUnknown_30053B0
	ldr r5, _080DA244 @ =gUnknown_3005010
	ldr r0, _080DA23C @ =gUnknown_83FEC94
	adds r3, r1, 0
	adds r3, 0x28
	adds r2, r0, 0
	adds r2, 0x14
_080DA216:
	ldrh r0, [r2]
	ldr r1, [r5]
	adds r1, r0
	str r1, [r3]
	ldrh r0, [r2, 0x2]
	strh r0, [r3, 0x4]
	adds r3, 0x8
	adds r2, 0x4
	adds r4, 0x1
	cmp r4, 0xD
	ble _080DA216
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA234: .4byte gUnknown_30053B0
_080DA238: .4byte gUnknown_300500C
_080DA23C: .4byte gUnknown_83FEC94
_080DA240: .4byte gUnknown_3005008
_080DA244: .4byte gUnknown_3005010
	thumb_func_end UpdateSaveAddresses

	thumb_func_start sub_80DA248
sub_80DA248: @ 80DA248
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080DA268 @ =gUnknown_30030F0
	ldr r6, [r1, 0x20]
	movs r0, 0
	str r0, [r1, 0x20]
	bl UpdateSaveAddresses
	cmp r4, 0x5
	bhi _080DA2CC
	lsls r0, r4, 2
	ldr r1, _080DA26C @ =_080DA270
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DA268: .4byte gUnknown_30030F0
_080DA26C: .4byte _080DA270
	.align 2, 0
_080DA270:
	.4byte _080DA2CC
	.4byte _080DA2F0
	.4byte _080DA310
	.4byte _080DA29E
	.4byte _080DA324
	.4byte _080DA288
_080DA288:
	movs r4, 0x1C
	ldr r5, _080DA2DC @ =EraseFlashSector
_080DA28C:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _080DA28C
_080DA29E:
	movs r0, 0xA
	bl GetGameStat
	ldr r1, _080DA2E0 @ =0x000003e6
	cmp r0, r1
	bhi _080DA2B0
	movs r0, 0xA
	bl IncrementGameStat
_080DA2B0:
	ldr r4, _080DA2E4 @ =gUnknown_201C000
	movs r5, 0xF8
	lsls r5, 4
	movs r0, 0x1C
	adds r1, r4, 0
	adds r2, r5, 0
	bl HandleWriteSectorNBytes
	adds r4, r5
	movs r0, 0x1D
	adds r1, r4, 0
	adds r2, r5, 0
	bl HandleWriteSectorNBytes
_080DA2CC:
	bl SaveSerializedGame
	ldr r0, _080DA2E8 @ =0x0000ffff
	ldr r1, _080DA2EC @ =gUnknown_30053B0
	bl save_write_to_flash
	b _080DA346
	.align 2, 0
_080DA2DC: .4byte EraseFlashSector
_080DA2E0: .4byte 0x000003e6
_080DA2E4: .4byte gUnknown_201C000
_080DA2E8: .4byte 0x0000ffff
_080DA2EC: .4byte gUnknown_30053B0
_080DA2F0:
	bl SaveSerializedGame
	movs r4, 0
_080DA2F6:
	adds r0, r4, 0
	ldr r1, _080DA30C @ =gUnknown_30053B0
	bl save_write_to_flash
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080DA2F6
	b _080DA346
	.align 2, 0
_080DA30C: .4byte gUnknown_30053B0
_080DA310:
	bl SaveSerializedGame
	ldr r1, _080DA320 @ =gUnknown_30053B0
	movs r0, 0
	bl save_write_to_flash
	b _080DA346
	.align 2, 0
_080DA320: .4byte gUnknown_30053B0
_080DA324:
	movs r4, 0x1C
	ldr r5, _080DA354 @ =EraseFlashSector
_080DA328:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _080DA328
	bl SaveSerializedGame
	ldr r0, _080DA358 @ =0x0000ffff
	ldr r1, _080DA35C @ =gUnknown_30053B0
	bl save_write_to_flash
_080DA346:
	ldr r0, _080DA360 @ =gUnknown_30030F0
	str r6, [r0, 0x20]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DA354: .4byte EraseFlashSector
_080DA358: .4byte 0x0000ffff
_080DA35C: .4byte gUnknown_30053B0
_080DA360: .4byte gUnknown_30030F0
	thumb_func_end sub_80DA248

	thumb_func_start TrySavingData
TrySavingData: @ 80DA364
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080DA390 @ =gUnknown_3005004
	ldr r4, [r0]
	cmp r4, 0x1
	bne _080DA386
	adds r0, r5, 0
	bl sub_80DA248
	ldr r0, _080DA394 @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080DA39C
	adds r0, r5, 0
	bl sub_80F5100
_080DA386:
	ldr r1, _080DA398 @ =gUnknown_3005420
	movs r0, 0xFF
	strh r0, [r1]
	movs r0, 0xFF
	b _080DA3A2
	.align 2, 0
_080DA390: .4byte gUnknown_3005004
_080DA394: .4byte gUnknown_300538C
_080DA398: .4byte gUnknown_3005420
_080DA39C:
	ldr r0, _080DA3A8 @ =gUnknown_3005420
	strh r4, [r0]
	movs r0, 0x1
_080DA3A2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA3A8: .4byte gUnknown_3005420
	thumb_func_end TrySavingData

	thumb_func_start sub_80DA3AC
sub_80DA3AC: @ 80DA3AC
	push {lr}
	ldr r0, _080DA3C8 @ =gUnknown_3005004
	ldr r0, [r0]
	cmp r0, 0x1
	bne _080DA3D0
	bl UpdateSaveAddresses
	bl SaveSerializedGame
	ldr r0, _080DA3CC @ =gUnknown_30053B0
	bl RestoreSaveBackupVarsAndIncrement
	movs r0, 0
	b _080DA3D2
	.align 2, 0
_080DA3C8: .4byte gUnknown_3005004
_080DA3CC: .4byte gUnknown_30053B0
_080DA3D0:
	movs r0, 0x1
_080DA3D2:
	pop {r1}
	bx r1
	thumb_func_end sub_80DA3AC

	thumb_func_start sub_80DA3D8
sub_80DA3D8: @ 80DA3D8
	push {r4,lr}
	ldr r1, _080DA3FC @ =gUnknown_30053B0
	movs r0, 0xE
	bl sub_80D9AA4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DA400 @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080DA3F4
	movs r0, 0
	bl sub_80F5100
_080DA3F4:
	cmp r4, 0xFF
	beq _080DA404
	movs r0, 0
	b _080DA406
	.align 2, 0
_080DA3FC: .4byte gUnknown_30053B0
_080DA400: .4byte gUnknown_300538C
_080DA404:
	movs r0, 0x1
_080DA406:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA3D8

	thumb_func_start sub_80DA40C
sub_80DA40C: @ 80DA40C
	push {lr}
	ldr r1, _080DA42C @ =gUnknown_30053B0
	movs r0, 0xE
	bl sub_80D9B04
	ldr r0, _080DA430 @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080DA424
	movs r0, 0
	bl sub_80F5100
_080DA424:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080DA42C: .4byte gUnknown_30053B0
_080DA430: .4byte gUnknown_300538C
	thumb_func_end sub_80DA40C

	thumb_func_start sub_80DA434
sub_80DA434: @ 80DA434
	push {lr}
	ldr r1, _080DA454 @ =gUnknown_30053B0
	movs r0, 0xE
	bl sub_80D9CF0
	ldr r0, _080DA458 @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080DA44C
	movs r0, 0
	bl sub_80F5100
_080DA44C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080DA454: .4byte gUnknown_30053B0
_080DA458: .4byte gUnknown_300538C
	thumb_func_end sub_80DA434

	thumb_func_start sub_80DA45C
sub_80DA45C: @ 80DA45C
	push {r4,lr}
	ldr r0, _080DA48C @ =gUnknown_3005004
	ldr r0, [r0]
	cmp r0, 0x1
	bne _080DA498
	bl UpdateSaveAddresses
	bl SaveSerializedGame
	ldr r4, _080DA490 @ =gUnknown_30053B0
	adds r0, r4, 0
	bl RestoreSaveBackupVars
	ldr r0, _080DA494 @ =gUnknown_3005398
	ldrh r0, [r0]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl sub_80D9B04
	movs r0, 0
	b _080DA49A
	.align 2, 0
_080DA48C: .4byte gUnknown_3005004
_080DA490: .4byte gUnknown_30053B0
_080DA494: .4byte gUnknown_3005398
_080DA498:
	movs r0, 0x1
_080DA49A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA45C

	thumb_func_start sub_80DA4A0
sub_80DA4A0: @ 80DA4A0
	push {r4-r6,lr}
	movs r6, 0
	ldr r0, _080DA4CC @ =gUnknown_3005398
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r0, r1, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bhi _080DA4D4
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080DA4D0 @ =gUnknown_30053B0
	adds r1, r4, 0
	bl sub_80D9B04
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80D9D88
	b _080DA4DE
	.align 2, 0
_080DA4CC: .4byte gUnknown_3005398
_080DA4D0: .4byte gUnknown_30053B0
_080DA4D4:
	ldr r1, _080DA4F4 @ =gUnknown_30053B0
	adds r0, r5, 0
	bl sub_80D9D88
	movs r6, 0x1
_080DA4DE:
	ldr r0, _080DA4F8 @ =gUnknown_300538C
	ldr r0, [r0]
	cmp r0, 0
	beq _080DA4EC
	movs r0, 0x1
	bl sub_80F5100
_080DA4EC:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DA4F4: .4byte gUnknown_30053B0
_080DA4F8: .4byte gUnknown_300538C
	thumb_func_end sub_80DA4A0

	thumb_func_start sub_80DA4FC
sub_80DA4FC: @ 80DA4FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DA514 @ =gUnknown_3005004
	ldr r0, [r0]
	cmp r0, 0x1
	beq _080DA51C
	ldr r1, _080DA518 @ =gUnknown_30053A0
	movs r0, 0x4
	strh r0, [r1]
	movs r0, 0xFF
	b _080DA57C
	.align 2, 0
_080DA514: .4byte gUnknown_3005004
_080DA518: .4byte gUnknown_30053A0
_080DA51C:
	bl UpdateSaveAddresses
	cmp r4, 0
	beq _080DA528
	cmp r4, 0x3
	beq _080DA554
_080DA528:
	ldr r0, _080DA544 @ =0x0000ffff
	ldr r1, _080DA548 @ =gUnknown_30053B0
	bl sub_80D9E14
	lsls r0, 24
	lsrs r4, r0, 24
	bl LoadSerializedGame
	ldr r0, _080DA54C @ =gUnknown_30053A0
	strh r4, [r0]
	ldr r1, _080DA550 @ =gUnknown_30053A4
	movs r0, 0
	str r0, [r1]
	b _080DA57A
	.align 2, 0
_080DA544: .4byte 0x0000ffff
_080DA548: .4byte gUnknown_30053B0
_080DA54C: .4byte gUnknown_30053A0
_080DA550: .4byte gUnknown_30053A4
_080DA554:
	ldr r5, _080DA584 @ =gUnknown_201C000
	movs r6, 0xF8
	lsls r6, 4
	movs r0, 0x1C
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_80DA120
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080DA57A
	adds r1, r5, r6
	movs r0, 0x1D
	adds r2, r6, 0
	bl sub_80DA120
	lsls r0, 24
	lsrs r4, r0, 24
_080DA57A:
	adds r0, r4, 0
_080DA57C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DA584: .4byte gUnknown_201C000
	thumb_func_end sub_80DA4FC

	thumb_func_start TryCopySpecialSaveSection
TryCopySpecialSaveSection: @ 80DA588
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xE2
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080DA5B4
	ldr r4, _080DA5B8 @ =gUnknown_2039A38
	movs r3, 0x80
	lsls r3, 5
	adds r0, r1, 0
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	ldr r1, [r4]
	ldr r0, _080DA5BC @ =0x0000b39d
	cmp r1, r0
	beq _080DA5C0
_080DA5B4:
	movs r0, 0xFF
	b _080DA5D6
	.align 2, 0
_080DA5B8: .4byte gUnknown_2039A38
_080DA5BC: .4byte 0x0000b39d
_080DA5C0:
	movs r3, 0
	ldr r5, _080DA5DC @ =0x00000ffb
	adds r2, r4, 0x4
_080DA5C6:
	adds r0, r6, r3
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, r5
	ble _080DA5C6
	movs r0, 0x1
_080DA5D6:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080DA5DC: .4byte 0x00000ffb
	thumb_func_end TryCopySpecialSaveSection

	thumb_func_start sub_80DA5E0
sub_80DA5E0: @ 80DA5E0
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0xE2
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080DA62C
	ldr r7, _080DA620 @ =gUnknown_2039A38
	ldr r0, _080DA624 @ =0x0000b39d
	adds r3, r7, 0
	stm r3!, {r0}
	movs r2, 0
	ldr r4, _080DA628 @ =0x00000ffb
_080DA600:
	adds r0, r3, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r4
	ble _080DA600
	adds r0, r6, 0
	adds r1, r7, 0
	bl ProgramFlashSectorAndVerify
	cmp r0, 0
	bne _080DA62C
	movs r0, 0x1
	b _080DA62E
	.align 2, 0
_080DA620: .4byte gUnknown_2039A38
_080DA624: .4byte 0x0000b39d
_080DA628: .4byte 0x00000ffb
_080DA62C:
	movs r0, 0xFF
_080DA62E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA5E0

	thumb_func_start sub_80DA634
sub_80DA634: @ 80DA634
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080DA65C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0xB
	bls _080DA650
	b _080DA7F6
_080DA650:
	lsls r0, 2
	ldr r1, _080DA660 @ =_080DA664
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DA65C: .4byte gUnknown_3005090
_080DA660: .4byte _080DA664
	.align 2, 0
_080DA664:
	.4byte _080DA694
	.4byte _080DA6AC
	.4byte _080DA6C4
	.4byte _080DA6E8
	.4byte _080DA6F2
	.4byte _080DA712
	.4byte _080DA744
	.4byte _080DA75C
	.4byte _080DA778
	.4byte _080DA79C
	.4byte _080DA7B4
	.4byte _080DA7D4
_080DA694:
	ldr r1, _080DA6A8 @ =gUnknown_3003530
	movs r0, 0x1
	strb r0, [r1]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA6A8: .4byte gUnknown_3003530
_080DA6AC:
	bl sub_800AB9C
	ldr r0, _080DA6C0 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x2
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA6C0: .4byte gUnknown_3005090
_080DA6C4:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	bne _080DA6D0
	b _080DA7F6
_080DA6D0:
	bl sub_80590D8
	ldr r0, _080DA6E4 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x3
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA6E4: .4byte gUnknown_3005090
_080DA6E8:
	bl sub_804C1C0
	bl sub_80DA3AC
	b _080DA730
_080DA6F2:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0x5
	beq _080DA70A
	b _080DA7F6
_080DA70A:
	movs r0, 0
	strh r0, [r1, 0xA]
	strh r2, [r1, 0x8]
	b _080DA7F6
_080DA712:
	bl sub_80DA3D8
	lsls r0, 24
	cmp r0, 0
	beq _080DA730
	ldr r0, _080DA72C @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x6
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA72C: .4byte gUnknown_3005090
_080DA730:
	ldr r0, _080DA740 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x4
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA740: .4byte gUnknown_3005090
_080DA744:
	bl sub_80DA40C
	ldr r0, _080DA758 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x7
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA758: .4byte gUnknown_3005090
_080DA75C:
	bl sav2_gender2_inplace_and_xFE
	bl sub_800AB9C
	ldr r0, _080DA774 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x8
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA774: .4byte gUnknown_3005090
_080DA778:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _080DA7F6
	bl sub_80DA434
	ldr r0, _080DA798 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA798: .4byte gUnknown_3005090
_080DA79C:
	bl sub_800AB9C
	ldr r0, _080DA7B0 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA7B0: .4byte gUnknown_3005090
_080DA7B4:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _080DA7F6
	ldr r0, _080DA7D0 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080DA7F6
	.align 2, 0
_080DA7D0: .4byte gUnknown_3005090
_080DA7D4:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080DA7F6
	ldr r1, _080DA7FC @ =gUnknown_3003530
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_080DA7F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA7FC: .4byte gUnknown_3003530
	thumb_func_end sub_80DA634

	.align 2, 0 @ Don't pad with nop.
