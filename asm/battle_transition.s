	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80D08B8
sub_80D08B8: @ 80D08B8
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080D08DC @ =gUnknown_2039A2C
	movs r0, 0x3C
	bl AllocZeroed
	str r0, [r5]
	ldr r1, _080D08E0 @ =gMain
	ldr r0, _080D08E4 @ =sub_80565A8
	str r0, [r1, 0x4]
	adds r0, r4, 0
	bl LaunchBattleTransitionTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D08DC: .4byte gUnknown_2039A2C
_080D08E0: .4byte gMain
_080D08E4: .4byte sub_80565A8
	thumb_func_end sub_80D08B8

	thumb_func_start sub_80D08E8
sub_80D08E8: @ 80D08E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl LaunchBattleTransitionTask
	pop {r0}
	bx r0
	thumb_func_end sub_80D08E8

	thumb_func_start sub_80D08F8
sub_80D08F8: @ 80D08F8
	push {r4,r5,lr}
	ldr r0, _080D091C @ =sub_80D0978
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D0920 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D0924
	movs r0, 0
	b _080D093C
	.align 2, 0
_080D091C: .4byte sub_80D0978
_080D0920: .4byte gTasks
_080D0924:
	bl sub_80D3DD0
	ldr r4, _080D0944 @ =gUnknown_2039A2C
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0
	bl DestroyTask
	movs r0, 0x1
_080D093C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D0944: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D08F8

	thumb_func_start LaunchBattleTransitionTask
LaunchBattleTransitionTask: @ 80D0948
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080D0970 @ =sub_80D0978
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D0974 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0970: .4byte sub_80D0978
_080D0974: .4byte gTasks
	thumb_func_end LaunchBattleTransitionTask

	thumb_func_start sub_80D0978
sub_80D0978: @ 80D0978
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D09A8 @ =gUnknown_83FA3B0
	ldr r2, _080D09AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D098A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D098A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D09A8: .4byte gUnknown_83FA3B0
_080D09AC: .4byte gTasks
	thumb_func_end sub_80D0978

	thumb_func_start Transition_Phase1
Transition_Phase1: @ 80D09B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807B05C
	ldr r0, _080D09DC @ =gPlttBufferFaded
	ldr r1, _080D09E0 @ =gPlttBufferUnfaded
	ldr r2, _080D09E4 @ =0x04000100
	bl CpuSet
	ldr r1, _080D09E8 @ =gUnknown_83FA320
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _080D09EC
	movs r0, 0x2
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _080D09FA
	.align 2, 0
_080D09DC: .4byte gPlttBufferFaded
_080D09E0: .4byte gPlttBufferUnfaded
_080D09E4: .4byte 0x04000100
_080D09E8: .4byte gUnknown_83FA320
_080D09EC:
	movs r1, 0x4
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
_080D09FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Transition_Phase1

	thumb_func_start Transition_WaitForPhase1
Transition_WaitForPhase1: @ 80D0A00
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080D0A20 @ =gUnknown_83FA320
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080D0A24
	movs r0, 0
	b _080D0A2C
	.align 2, 0
_080D0A20: .4byte gUnknown_83FA320
_080D0A24:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
_080D0A2C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Transition_WaitForPhase1

	thumb_func_start Transition_Phase2
Transition_Phase2: @ 80D0A34
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080D0A58 @ =gUnknown_83FA368
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D0A58: .4byte gUnknown_83FA368
	thumb_func_end Transition_Phase2

	thumb_func_start Transition_WaitForPhase2
Transition_WaitForPhase2: @ 80D0A5C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080D0A88 @ =gUnknown_83FA368
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080D0A80
	movs r0, 0x1
	strh r0, [r4, 0x26]
_080D0A80:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D0A88: .4byte gUnknown_83FA368
	thumb_func_end Transition_WaitForPhase2

	thumb_func_start Phase1Task_TransitionAll
Phase1Task_TransitionAll: @ 80D0A8C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _080D0AC0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080D0AC4
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl CreatePhase1Task
	b _080D0AD4
	.align 2, 0
_080D0AC0: .4byte gTasks
_080D0AC4:
	bl sub_80D3CA4
	lsls r0, 24
	cmp r0, 0
	beq _080D0AD4
	adds r0, r4, 0
	bl DestroyTask
_080D0AD4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Phase1Task_TransitionAll

	thumb_func_start sub_80D0ADC
sub_80D0ADC: @ 80D0ADC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D0B0C @ =gUnknown_83FA3C0
	ldr r2, _080D0B10 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D0AEE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D0AEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0B0C: .4byte gUnknown_83FA3C0
_080D0B10: .4byte gTasks
	thumb_func_end sub_80D0ADC

	thumb_func_start sub_80D0B14
sub_80D0B14: @ 80D0B14
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xA
	movs r1, 0x40
	bl SetGpuRegBits
	movs r0, 0xC
	movs r1, 0x40
	bl SetGpuRegBits
	movs r0, 0xE
	movs r1, 0x40
	bl SetGpuRegBits
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80D0B14

	thumb_func_start sub_80D0B48
sub_80D0B48: @ 80D0B48
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	cmp r2, 0
	beq _080D0B5E
	subs r0, 0x1
	strh r0, [r4, 0xA]
	b _080D0B9E
_080D0B5E:
	movs r0, 0x2
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080D0B80
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080D0B80:
	ldrh r1, [r4, 0xC]
	movs r0, 0xF
	ands r0, r1
	lsls r1, r0, 4
	orrs r1, r0
	movs r0, 0x4C
	bl SetGpuReg
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xE
	ble _080D0B9E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D0B9E:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80D0B48

	thumb_func_start sub_80D0BA8
sub_80D0BA8: @ 80D0BA8
	push {lr}
	ldr r0, _080D0BCC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080D0BC4
	ldr r0, _080D0BD0 @ =sub_80D0ADC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D0BC4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D0BCC: .4byte gPaletteFade
_080D0BD0: .4byte sub_80D0ADC
	thumb_func_end sub_80D0BA8

	thumb_func_start sub_80D0BD4
sub_80D0BD4: @ 80D0BD4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D0C04 @ =gUnknown_83FA3CC
	ldr r2, _080D0C08 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D0BE6:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D0BE6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0C04: .4byte gUnknown_83FA3CC
_080D0C08: .4byte gTasks
	thumb_func_end sub_80D0BD4

	thumb_func_start sub_80D0C0C
sub_80D0C0C: @ 80D0C0C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080D0C68 @ =gScanlineEffectRegBuffers + 0x780
	ldr r1, _080D0C6C @ =gUnknown_2039A2C
	ldr r1, [r1]
	movs r2, 0x14
	ldrsh r1, [r1, r2]
	str r4, [sp]
	movs r2, 0xA0
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_80D3E74
	ldr r0, _080D0C70 @ =sub_80D0CF0
	bl SetVBlankCallback
	ldr r0, _080D0C74 @ =sub_80D0D28
	bl SetHBlankCallback
	movs r0, 0x3
	bl EnableInterrupts
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D0C68: .4byte gScanlineEffectRegBuffers + 0x780
_080D0C6C: .4byte gUnknown_2039A2C
_080D0C70: .4byte sub_80D0CF0
_080D0C74: .4byte sub_80D0D28
	thumb_func_end sub_80D0C0C

	thumb_func_start sub_80D0C78
sub_80D0C78: @ 80D0C78
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _080D0CE0 @ =gUnknown_2039A2C
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r1, 0
	strb r1, [r2]
	ldrh r1, [r0, 0xA]
	adds r1, 0x4
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xC]
	adds r1, 0x8
	strh r1, [r0, 0xC]
	ldr r3, _080D0CE4 @ =gScanlineEffectRegBuffers
	ldr r1, [r4]
	movs r2, 0x14
	ldrsh r1, [r1, r2]
	movs r5, 0xA
	ldrsh r2, [r0, r5]
	movs r5, 0xC
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	adds r0, r3, 0
	movs r3, 0x2
	bl sub_80D3E74
	ldr r0, _080D0CE8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080D0CCA
	ldr r0, _080D0CEC @ =sub_80D0BD4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D0CCA:
	ldr r0, [r4]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D0CE0: .4byte gUnknown_2039A2C
_080D0CE4: .4byte gScanlineEffectRegBuffers
_080D0CE8: .4byte gPaletteFade
_080D0CEC: .4byte sub_80D0BD4
	thumb_func_end sub_80D0C78

	thumb_func_start sub_80D0CF0
sub_80D0CF0: @ 80D0CF0
	push {lr}
	bl sub_80D3DF4
	ldr r0, _080D0D18 @ =gUnknown_2039A2C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D0D14
	ldr r1, _080D0D1C @ =0x040000d4
	ldr r0, _080D0D20 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D0D24 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D0D14:
	pop {r0}
	bx r0
	.align 2, 0
_080D0D18: .4byte gUnknown_2039A2C
_080D0D1C: .4byte 0x040000d4
_080D0D20: .4byte gScanlineEffectRegBuffers
_080D0D24: .4byte 0x800000a0
	thumb_func_end sub_80D0CF0

	thumb_func_start sub_80D0D28
sub_80D0D28: @ 80D0D28
	ldr r1, _080D0D48 @ =gScanlineEffectRegBuffers
	ldr r0, _080D0D4C @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080D0D50 @ =0x04000014
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080D0D48: .4byte gScanlineEffectRegBuffers
_080D0D4C: .4byte 0x04000006
_080D0D50: .4byte 0x04000014
	thumb_func_end sub_80D0D28

	thumb_func_start sub_80D0D54
sub_80D0D54: @ 80D0D54
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D0D84 @ =gUnknown_83FA3D4
	ldr r2, _080D0D88 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D0D66:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D0D66
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0D84: .4byte gUnknown_83FA3D4
_080D0D88: .4byte gTasks
	thumb_func_end sub_80D0D54

	thumb_func_start sub_80D0D8C
sub_80D0D8C: @ 80D0D8C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080D0DE0 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldr r0, _080D0DE4 @ =gScanlineEffectRegBuffers + 0x780
	movs r2, 0x16
	ldrsh r1, [r1, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	ldr r0, _080D0DE8 @ =sub_80D0E80
	bl SetVBlankCallback
	ldr r0, _080D0DEC @ =sub_80D0EB8
	bl SetHBlankCallback
	movs r0, 0x3
	bl EnableInterrupts
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D0DE0: .4byte gUnknown_2039A2C
_080D0DE4: .4byte gScanlineEffectRegBuffers + 0x780
_080D0DE8: .4byte sub_80D0E80
_080D0DEC: .4byte sub_80D0EB8
	thumb_func_end sub_80D0D8C

	thumb_func_start sub_80D0DF0
sub_80D0DF0: @ 80D0DF0
	push {r4-r7,lr}
	ldr r1, _080D0E70 @ =gUnknown_2039A2C
	ldr r2, [r1]
	ldrb r1, [r2]
	movs r1, 0
	strb r1, [r2]
	ldrh r4, [r0, 0xA]
	ldrh r2, [r0, 0xC]
	lsls r3, r2, 16
	asrs r3, 24
	movs r5, 0x84
	lsls r5, 5
	adds r1, r4, r5
	strh r1, [r0, 0xA]
	movs r1, 0xC0
	lsls r1, 1
	adds r2, r1
	strh r2, [r0, 0xC]
	movs r5, 0
	lsls r7, r3, 16
_080D0E18:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r1, _080D0E74 @ =gScanlineEffectRegBuffers
	lsls r2, r5, 1
	adds r2, r1
	ldr r6, _080D0E70 @ =gUnknown_2039A2C
	ldr r1, [r6]
	ldrh r1, [r1, 0x16]
	adds r0, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x84
	lsls r1, 5
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _080D0E18
	ldr r0, _080D0E78 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080D0E5E
	ldr r0, _080D0E7C @ =sub_80D0D54
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D0E5E:
	ldr r0, [r6]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D0E70: .4byte gUnknown_2039A2C
_080D0E74: .4byte gScanlineEffectRegBuffers
_080D0E78: .4byte gPaletteFade
_080D0E7C: .4byte sub_80D0D54
	thumb_func_end sub_80D0DF0

	thumb_func_start sub_80D0E80
sub_80D0E80: @ 80D0E80
	push {lr}
	bl sub_80D3DF4
	ldr r0, _080D0EA8 @ =gUnknown_2039A2C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D0EA4
	ldr r1, _080D0EAC @ =0x040000d4
	ldr r0, _080D0EB0 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D0EB4 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D0EA4:
	pop {r0}
	bx r0
	.align 2, 0
_080D0EA8: .4byte gUnknown_2039A2C
_080D0EAC: .4byte 0x040000d4
_080D0EB0: .4byte gScanlineEffectRegBuffers
_080D0EB4: .4byte 0x800000a0
	thumb_func_end sub_80D0E80

	thumb_func_start sub_80D0EB8
sub_80D0EB8: @ 80D0EB8
	ldr r1, _080D0ED8 @ =gScanlineEffectRegBuffers
	ldr r0, _080D0EDC @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080D0EE0 @ =0x04000016
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080D0ED8: .4byte gScanlineEffectRegBuffers
_080D0EDC: .4byte 0x04000006
_080D0EE0: .4byte 0x04000016
	thumb_func_end sub_80D0EB8

	thumb_func_start sub_80D0EE4
sub_80D0EE4: @ 80D0EE4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D0F14 @ =gUnknown_83FA3DC
	ldr r2, _080D0F18 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D0EF6:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D0EF6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0F14: .4byte gUnknown_83FA3DC
_080D0F18: .4byte gTasks
	thumb_func_end sub_80D0EE4

	thumb_func_start sub_80D0F1C
sub_80D0F1C: @ 80D0F1C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	movs r1, 0
	movs r0, 0x10
	strh r0, [r4, 0xA]
	strh r1, [r4, 0xC]
	strh r1, [r4, 0x10]
	movs r0, 0x80
	lsls r0, 7
	strh r0, [r4, 0x12]
	ldr r0, _080D0FB8 @ =gUnknown_2039A2C
	ldr r2, [r0]
	movs r0, 0x3F
	strh r0, [r2, 0x2]
	strh r1, [r2, 0x4]
	movs r0, 0xF0
	strh r0, [r2, 0x6]
	movs r0, 0xA0
	strh r0, [r2, 0x8]
	ldr r0, _080D0FBC @ =0x00003f41
	strh r0, [r2, 0xE]
	ldrh r0, [r4, 0xA]
	lsls r0, 8
	ldrh r1, [r4, 0xC]
	orrs r0, r1
	strh r0, [r2, 0x10]
	movs r1, 0
	add r5, sp, 0x4
	add r6, sp, 0x8
	ldr r3, _080D0FC0 @ =gScanlineEffectRegBuffers + 0x780
	movs r2, 0xF0
_080D0F64:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _080D0F64
	ldr r0, _080D0FC4 @ =sub_80D1370
	bl SetVBlankCallback
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80D3E28
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _080D0FC8 @ =0x01000400
	mov r0, sp
	bl CpuSet
	ldr r0, _080D0FCC @ =gUnknown_83F87A0
	ldr r1, [sp, 0x8]
	movs r2, 0xB0
	lsls r2, 2
	bl CpuSet
	ldr r0, _080D0FD0 @ =gUnknown_83FA638
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D0FB8: .4byte gUnknown_2039A2C
_080D0FBC: .4byte 0x00003f41
_080D0FC0: .4byte gScanlineEffectRegBuffers + 0x780
_080D0FC4: .4byte sub_80D1370
_080D0FC8: .4byte 0x01000400
_080D0FCC: .4byte gUnknown_83F87A0
_080D0FD0: .4byte gUnknown_83FA638
	thumb_func_end sub_80D0F1C

	thumb_func_start sub_80D0FD4
sub_80D0FD4: @ 80D0FD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r5, _080D105C @ =gUnknown_83FA784
	add r1, sp, 0xC
	add r0, sp, 0x8
	bl sub_80D3E28
	movs r1, 0
	ldr r0, [sp, 0x8]
	mov r9, r0
	ldr r6, _080D1060 @ =gScanlineEffectRegBuffers
	mov r8, r6
	movs r0, 0xF0
	lsls r0, 8
	mov r12, r0
_080D0FFA:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_080D1000:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	add r1, r9
	ldrh r0, [r5]
	mov r6, r12
	orrs r0, r6
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r5, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1D
	ble _080D1000
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080D0FFA
	movs r6, 0x10
	ldrsh r2, [r7, r6]
	movs r1, 0x12
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	movs r3, 0x84
	bl sub_80D3E74
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D105C: .4byte gUnknown_83FA784
_080D1060: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D0FD4

	thumb_func_start sub_80D1064
sub_80D1064: @ 80D1064
	push {r4,r5,lr}
	sub sp, 0x8
	adds r3, r0, 0
	ldr r2, _080D10EC @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r1, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	adds r4, r2, 0
	cmp r0, 0
	beq _080D108A
	subs r0, r1, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080D1094
_080D108A:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r0, 0x1
	strh r0, [r3, 0xE]
_080D1094:
	ldr r2, [r4]
	ldrh r0, [r3, 0xA]
	lsls r0, 8
	ldrh r1, [r3, 0xC]
	orrs r0, r1
	strh r0, [r2, 0x10]
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	cmp r0, 0xF
	ble _080D10AE
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080D10AE:
	ldrh r0, [r3, 0x10]
	adds r0, 0xC
	strh r0, [r3, 0x10]
	ldr r0, _080D10F0 @ =0xfffffe80
	adds r1, r0, 0
	ldrh r5, [r3, 0x12]
	adds r1, r5
	strh r1, [r3, 0x12]
	ldr r0, _080D10F4 @ =gScanlineEffectRegBuffers
	movs r5, 0x10
	ldrsh r2, [r3, r5]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_80D3E74
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D10EC: .4byte gUnknown_2039A2C
_080D10F0: .4byte 0xfffffe80
_080D10F4: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D1064

	thumb_func_start sub_80D10F8
sub_80D10F8: @ 80D10F8
	push {r4,lr}
	sub sp, 0x8
	adds r3, r0, 0
	ldr r2, _080D1158 @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r1, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _080D111C
	subs r0, r1, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080D1126
_080D111C:
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	movs r0, 0x2
	strh r0, [r3, 0xE]
_080D1126:
	ldr r2, [r2]
	ldrh r0, [r3, 0xA]
	lsls r0, 8
	ldrh r1, [r3, 0xC]
	orrs r0, r1
	strh r0, [r2, 0x10]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080D1140
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080D1140:
	ldrh r1, [r3, 0x12]
	movs r2, 0x12
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080D1160
	ldrh r0, [r3, 0x10]
	adds r0, 0xC
	strh r0, [r3, 0x10]
	ldr r4, _080D115C @ =0xfffffe80
	adds r0, r1, r4
	b _080D1162
	.align 2, 0
_080D1158: .4byte gUnknown_2039A2C
_080D115C: .4byte 0xfffffe80
_080D1160:
	movs r0, 0
_080D1162:
	strh r0, [r3, 0x12]
	ldr r0, _080D1194 @ =gScanlineEffectRegBuffers
	movs r1, 0x10
	ldrsh r2, [r3, r1]
	ldrh r1, [r3, 0x12]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_80D3E74
	ldr r0, _080D1198 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D1194: .4byte gScanlineEffectRegBuffers
_080D1198: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D10F8

	thumb_func_start sub_80D119C
sub_80D119C: @ 80D119C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _080D11C4 @ =gUnknown_2039A2C
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r2, 0
	strb r2, [r0]
	ldrh r1, [r4, 0x12]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r0, 0
	ble _080D11CC
	ldrh r0, [r4, 0x10]
	adds r0, 0xC
	strh r0, [r4, 0x10]
	ldr r2, _080D11C8 @ =0xfffffe80
	adds r0, r1, r2
	strh r0, [r4, 0x12]
	b _080D11CE
	.align 2, 0
_080D11C4: .4byte gUnknown_2039A2C
_080D11C8: .4byte 0xfffffe80
_080D11CC:
	strh r2, [r4, 0x12]
_080D11CE:
	ldr r0, _080D1218 @ =gScanlineEffectRegBuffers
	movs r3, 0x10
	ldrsh r2, [r4, r3]
	ldrh r1, [r4, 0x12]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r5, 0xA0
	str r5, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_80D3E74
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _080D1202
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r5, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xC]
	strh r1, [r4, 0xE]
_080D1202:
	ldr r0, _080D121C @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D1218: .4byte gScanlineEffectRegBuffers
_080D121C: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D119C

	thumb_func_start sub_80D1220
sub_80D1220: @ 80D1220
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D12C4 @ =gUnknown_2039A2C
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r3, 0
	strb r3, [r0]
	ldrh r2, [r4, 0xC]
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	ldr r0, _080D12C8 @ =0x000007ff
	cmp r1, r0
	bgt _080D1242
	movs r1, 0x80
	lsls r1, 1
	adds r0, r2, r1
	strh r0, [r4, 0xC]
_080D1242:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080D125E
	ldrh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 24
	subs r0, r1, r0
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _080D125E
	strh r3, [r4, 0xA]
_080D125E:
	ldr r0, _080D12CC @ =gScanlineEffectRegBuffers
	movs r1, 0xA
	ldrsh r3, [r4, r1]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_80D3EF0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D129A
	ldr r1, _080D12D0 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D12D4 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D12D8 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_80D3E60
	ldr r0, _080D12DC @ =sub_80D0EE4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D129A:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D12AE
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _080D12E0 @ =sub_80D139C
	bl SetVBlankCallback
_080D12AE:
	ldr r0, _080D12C4 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D12C4: .4byte gUnknown_2039A2C
_080D12C8: .4byte 0x000007ff
_080D12CC: .4byte gScanlineEffectRegBuffers
_080D12D0: .4byte 0x040000b0
_080D12D4: .4byte 0x0000c5ff
_080D12D8: .4byte 0x00007fff
_080D12DC: .4byte sub_80D0EE4
_080D12E0: .4byte sub_80D139C
	thumb_func_end sub_80D1220

	thumb_func_start sub_80D12E4
sub_80D12E4: @ 80D12E4
	push {r4,lr}
	ldr r1, _080D1354 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D1358 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D135C @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_80D3DF4
	ldr r4, _080D1360 @ =gUnknown_2039A2C
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D131C
	ldr r1, _080D1364 @ =0x040000d4
	ldr r0, _080D1368 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D136C @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D131C:
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x10]
	movs r0, 0x52
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1354: .4byte 0x040000b0
_080D1358: .4byte 0x0000c5ff
_080D135C: .4byte 0x00007fff
_080D1360: .4byte gUnknown_2039A2C
_080D1364: .4byte 0x040000d4
_080D1368: .4byte gScanlineEffectRegBuffers
_080D136C: .4byte 0x800000a0
	thumb_func_end sub_80D12E4

	thumb_func_start sub_80D1370
sub_80D1370: @ 80D1370
	push {lr}
	bl sub_80D12E4
	ldr r1, _080D138C @ =0x040000b0
	ldr r0, _080D1390 @ =gScanlineEffectRegBuffers + 0x780
	str r0, [r1]
	ldr r0, _080D1394 @ =0x04000010
	str r0, [r1, 0x4]
	ldr r0, _080D1398 @ =0xa2400001
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080D138C: .4byte 0x040000b0
_080D1390: .4byte gScanlineEffectRegBuffers + 0x780
_080D1394: .4byte 0x04000010
_080D1398: .4byte 0xa2400001
	thumb_func_end sub_80D1370

	thumb_func_start sub_80D139C
sub_80D139C: @ 80D139C
	push {lr}
	bl sub_80D12E4
	ldr r1, _080D13B8 @ =0x040000b0
	ldr r0, _080D13BC @ =gScanlineEffectRegBuffers + 0x780
	str r0, [r1]
	ldr r0, _080D13C0 @ =0x04000040
	str r0, [r1, 0x4]
	ldr r0, _080D13C4 @ =0xa2400001
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080D13B8: .4byte 0x040000b0
_080D13BC: .4byte gScanlineEffectRegBuffers + 0x780
_080D13C0: .4byte 0x04000040
_080D13C4: .4byte 0xa2400001
	thumb_func_end sub_80D139C

	thumb_func_start sub_80D13C8
sub_80D13C8: @ 80D13C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D13F8 @ =gUnknown_83FA3F4
	ldr r2, _080D13FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D13DA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D13DA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D13F8: .4byte gUnknown_83FA3F4
_080D13FC: .4byte gTasks
	thumb_func_end sub_80D13C8

	thumb_func_start Phase2_Transition_PokeballsTrail_Func1
Phase2_Transition_PokeballsTrail_Func1: @ 80D1400
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_80D3E28
	ldr r0, _080D1440 @ =gUnknown_83F8D20
	ldr r1, [sp, 0x8]
	movs r2, 0x20
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, _080D1444 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r0, _080D1448 @ =gUnknown_83FA638
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D1440: .4byte gUnknown_83F8D20
_080D1444: .4byte 0x05000200
_080D1448: .4byte gUnknown_83FA638
	thumb_func_end Phase2_Transition_PokeballsTrail_Func1

	thumb_func_start Phase2_Transition_PokeballsTrail_Func2
Phase2_Transition_PokeballsTrail_Func2: @ 80D144C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r1, _080D14CC @ =gUnknown_83FA400
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _080D14D0 @ =gUnknown_83FA404
	adds r0, r4, 0
	movs r2, 0xA
	bl memcpy
	bl Random
	movs r5, 0x1
	ands r5, r0
	movs r1, 0
	mov r8, r4
	ldr r6, _080D14D4 @ =gFieldEffectArguments
_080D147A:
	lsls r5, 16
	asrs r5, 16
	lsls r0, r5, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r6]
	lsls r4, r1, 16
	asrs r4, 16
	lsls r0, r4, 5
	adds r0, 0x10
	str r0, [r6, 0x4]
	str r5, [r6, 0x8]
	lsls r0, r4, 1
	add r0, r8
	movs r1, 0
	ldrsh r0, [r0, r1]
	str r0, [r6, 0xC]
	movs r0, 0x2D
	bl FieldEffectStart
	adds r4, 0x1
	lsls r4, 16
	movs r0, 0x1
	eors r5, r0
	lsls r5, 16
	lsrs r5, 16
	lsrs r1, r4, 16
	asrs r4, 16
	cmp r4, 0x4
	ble _080D147A
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D14CC: .4byte gUnknown_83FA400
_080D14D0: .4byte gUnknown_83FA404
_080D14D4: .4byte gFieldEffectArguments
	thumb_func_end Phase2_Transition_PokeballsTrail_Func2

	thumb_func_start Phase2_Transition_PokeballsTrail_Func3
Phase2_Transition_PokeballsTrail_Func3: @ 80D14D8
	push {lr}
	movs r0, 0x2D
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080D14F8
	bl sub_80D3E60
	ldr r0, _080D1500 @ =sub_80D13C8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D14F8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D1500: .4byte sub_80D13C8
	thumb_func_end Phase2_Transition_PokeballsTrail_Func3

	thumb_func_start FldEff_Pokeball
FldEff_Pokeball: @ 80D1504
	push {r4,r5,lr}
	ldr r0, _080D1560 @ =gUnknown_83FA5CC
	ldr r5, _080D1564 @ =gFieldEffectArguments
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080D1568 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldr r0, [r5, 0xC]
	strh r0, [r4, 0x30]
	ldr r0, _080D156C @ =0x0000ffff
	strh r0, [r4, 0x32]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D1560: .4byte gUnknown_83FA5CC
_080D1564: .4byte gFieldEffectArguments
_080D1568: .4byte gSprites
_080D156C: .4byte 0x0000ffff
	thumb_func_end FldEff_Pokeball

	thumb_func_start sub_80D1570
sub_80D1570: @ 80D1570
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _080D1590 @ =gUnknown_83FA40E
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080D1594
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080D162A
	.align 2, 0
_080D1590: .4byte gUnknown_83FA40E
_080D1594:
	ldrh r0, [r4, 0x20]
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r0, 0xF0
	bhi _080D1606
	asrs r0, r1, 19
	lsls r0, 16
	ldrh r1, [r4, 0x22]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r6, r1, 16
	lsrs r1, r0, 16
	asrs r5, r0, 16
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r5, r0
	beq _080D1606
	strh r1, [r4, 0x32]
	movs r0, 0x8
	bl GetGpuReg
	lsls r0, 16
	lsrs r0, 24
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 11
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	lsls r2, r6, 16
	asrs r2, 16
	subs r1, r2, 0x2
	lsls r1, 5
	adds r1, r5
	lsls r1, 1
	adds r1, r0
	ldr r6, _080D1634 @ =0x0000f001
	adds r3, r6, 0
	strh r3, [r1]
	subs r1, r2, 0x1
	lsls r1, 5
	adds r1, r5
	lsls r1, 1
	adds r1, r0
	strh r3, [r1]
	lsls r1, r2, 5
	adds r1, r5
	lsls r1, 1
	adds r1, r0
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 5
	adds r2, r5
	lsls r2, 1
	adds r2, r0
	strh r3, [r2]
_080D1606:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, 0xF
	lsls r0, 16
	movs r1, 0x87
	lsls r1, 17
	cmp r0, r1
	bls _080D162A
	adds r0, r4, 0
	movs r1, 0x2D
	bl FieldEffectStop
_080D162A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1634: .4byte 0x0000f001
	thumb_func_end sub_80D1570

	thumb_func_start sub_80D1638
sub_80D1638: @ 80D1638
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D1668 @ =gUnknown_83FA414
	ldr r2, _080D166C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D164A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D164A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1668: .4byte gUnknown_83FA414
_080D166C: .4byte gTasks
	thumb_func_end sub_80D1638

	thumb_func_start sub_80D1670
sub_80D1670: @ 80D1670
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	ldr r0, _080D16C4 @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	ldr r0, _080D16C8 @ =0x0000f0f1
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _080D16CC @ =gScanlineEffectRegBuffers + 0x780
	ldr r2, _080D16D0 @ =0x0000f3f4
_080D1696:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _080D1696
	ldr r0, _080D16D4 @ =sub_80D1ABC
	bl SetVBlankCallback
	ldr r0, _080D16C4 @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r0, 0x78
	strh r0, [r1, 0x2C]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D16C4: .4byte gUnknown_2039A2C
_080D16C8: .4byte 0x0000f0f1
_080D16CC: .4byte gScanlineEffectRegBuffers + 0x780
_080D16D0: .4byte 0x0000f3f4
_080D16D4: .4byte sub_80D1ABC
	thumb_func_end sub_80D1670

	thumb_func_start sub_80D16D8
sub_80D16D8: @ 80D16D8
	push {r4-r7,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r2, _080D1760 @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x24
	movs r2, 0x2C
	ldrsh r3, [r1, r2]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_80D4088
	ldr r5, _080D1764 @ =gScanlineEffectRegBuffers
_080D1708:
	ldr r4, _080D1760 @ =gUnknown_2039A2C
	ldr r0, [r4]
	movs r7, 0x2A
	ldrsh r3, [r0, r7]
	lsls r3, 1
	adds r3, r5
	ldrh r1, [r0, 0x28]
	adds r1, 0x1
	movs r7, 0xF0
	lsls r7, 7
	adds r2, r7, 0
	orrs r1, r2
	strh r1, [r3]
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_80D4104
	lsls r0, 24
	cmp r0, 0
	beq _080D1708
	ldr r1, [r4]
	ldrh r0, [r1, 0x2C]
	adds r0, 0x20
	strh r0, [r1, 0x2C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _080D174C
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_080D174C:
	ldr r0, [r4]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1760: .4byte gUnknown_2039A2C
_080D1764: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D16D8

	thumb_func_start sub_80D1768
sub_80D1768: @ 80D1768
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	mov r8, r0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _080D17EC @ =gUnknown_2039A2C
	ldr r1, [r4]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r1, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0xF0
	bl sub_80D4088
	mov r9, r4
	mov r7, r9
	add r5, sp, 0xC
_080D17A6:
	movs r1, 0x78
	ldr r3, [r7]
	ldrh r0, [r3, 0x28]
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0x4F
	ble _080D17BE
	ldrh r1, [r3, 0x28]
	movs r4, 0xF0
_080D17BE:
	ldr r6, _080D17F0 @ =gScanlineEffectRegBuffers
	movs r0, 0x2A
	ldrsh r2, [r3, r0]
	lsls r2, 1
	adds r2, r6
	lsls r1, 16
	asrs r1, 8
	lsls r0, r4, 16
	asrs r4, r0, 16
	orrs r4, r1
	strh r4, [r2]
	ldrb r0, [r5]
	cmp r0, 0
	bne _080D17F4
	adds r0, r3, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_80D4104
	strb r0, [r5]
	b _080D17A6
	.align 2, 0
_080D17EC: .4byte gUnknown_2039A2C
_080D17F0: .4byte gScanlineEffectRegBuffers
_080D17F4:
	ldr r1, [r7]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x10
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0x9F
	ble _080D1812
	movs r0, 0xF0
	strh r0, [r1, 0x2C]
	mov r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080D183A
_080D1812:
	movs r3, 0x2A
	ldrsh r0, [r1, r3]
	cmp r0, r2
	bge _080D183A
	adds r3, r4, 0
	ldr r5, _080D1858 @ =gUnknown_2039A2C
_080D181E:
	ldr r2, [r5]
	ldrh r0, [r2, 0x2A]
	adds r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r6
	strh r3, [r0]
	movs r4, 0x2A
	ldrsh r1, [r2, r4]
	movs r4, 0x2E
	ldrsh r0, [r2, r4]
	cmp r1, r0
	blt _080D181E
_080D183A:
	mov r1, r9
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1858: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D1768

	thumb_func_start sub_80D185C
sub_80D185C: @ 80D185C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r2, _080D18DC @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x24
	movs r2, 0x2C
	ldrsh r3, [r1, r2]
	movs r1, 0xA0
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_80D4088
	ldr r5, _080D18E0 @ =gScanlineEffectRegBuffers
_080D188A:
	ldr r4, _080D18DC @ =gUnknown_2039A2C
	ldr r0, [r4]
	movs r1, 0x2A
	ldrsh r3, [r0, r1]
	lsls r3, 1
	adds r3, r5
	ldrh r1, [r0, 0x28]
	lsls r1, 8
	movs r2, 0xF0
	orrs r1, r2
	strh r1, [r3]
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_80D4104
	lsls r0, 24
	cmp r0, 0
	beq _080D188A
	ldr r1, [r4]
	ldrh r0, [r1, 0x2C]
	subs r0, 0x20
	strh r0, [r1, 0x2C]
	lsls r0, 16
	cmp r0, 0
	bgt _080D18C8
	movs r0, 0xA0
	strh r0, [r1, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_080D18C8:
	ldr r0, [r4]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D18DC: .4byte gUnknown_2039A2C
_080D18E0: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D185C

	thumb_func_start sub_80D18E4
sub_80D18E4: @ 80D18E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r9, r0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _080D196C @ =gUnknown_2039A2C
	ldr r1, [r4]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r1, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl sub_80D4088
	ldr r7, _080D1970 @ =gScanlineEffectRegBuffers
	mov r10, r7
	ldr r0, _080D196C @ =gUnknown_2039A2C
	mov r8, r0
	add r6, sp, 0xC
_080D1928:
	mov r1, r8
	ldr r4, [r1]
	movs r2, 0x2A
	ldrsh r0, [r4, r2]
	lsls r0, 1
	mov r7, r10
	adds r5, r0, r7
	ldrb r1, [r5]
	ldrh r2, [r4, 0x28]
	adds r3, r2, 0
	movs r7, 0x2E
	ldrsh r0, [r4, r7]
	cmp r0, 0x50
	bgt _080D1948
	movs r2, 0x78
	adds r1, r3, 0
_080D1948:
	lsls r0, r2, 16
	asrs r0, 8
	lsls r1, 16
	asrs r1, 16
	orrs r1, r0
	movs r7, 0
	strh r1, [r5]
	ldrb r0, [r6]
	cmp r0, 0
	bne _080D1974
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_80D4104
	strb r0, [r6]
	b _080D1928
	.align 2, 0
_080D196C: .4byte gUnknown_2039A2C
_080D1970: .4byte gScanlineEffectRegBuffers
_080D1974:
	mov r0, r8
	ldr r2, [r0]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x10
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bgt _080D1992
	strh r7, [r2, 0x2C]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080D19BC
_080D1992:
	movs r4, 0x2A
	ldrsh r0, [r2, r4]
	cmp r0, r3
	ble _080D19BC
	ldr r6, _080D19DC @ =gScanlineEffectRegBuffers
	adds r3, r1, 0
	ldr r5, _080D19E0 @ =gUnknown_2039A2C
_080D19A0:
	ldr r2, [r5]
	ldrh r0, [r2, 0x2A]
	subs r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r6
	strh r3, [r0]
	movs r7, 0x2A
	ldrsh r1, [r2, r7]
	movs r4, 0x2E
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bgt _080D19A0
_080D19BC:
	ldr r7, _080D19E0 @ =gUnknown_2039A2C
	ldr r0, [r7]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D19DC: .4byte gScanlineEffectRegBuffers
_080D19E0: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D18E4

	thumb_func_start sub_80D19E4
sub_80D19E4: @ 80D19E4
	push {r4-r7,lr}
	sub sp, 0xC
	adds r7, r0, 0
	ldr r1, _080D1A74 @ =gUnknown_2039A2C
	ldr r0, [r1]
	ldrb r2, [r0]
	movs r2, 0
	strb r2, [r0]
	ldr r1, [r1]
	adds r0, r1, 0
	adds r0, 0x24
	movs r4, 0x2C
	ldrsh r3, [r1, r4]
	str r2, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_80D4088
	ldr r6, _080D1A78 @ =gScanlineEffectRegBuffers
_080D1A10:
	movs r2, 0x78
	ldr r5, _080D1A74 @ =gUnknown_2039A2C
	ldr r3, [r5]
	ldrh r4, [r3, 0x28]
	movs r1, 0x28
	ldrsh r0, [r3, r1]
	cmp r0, 0x77
	ble _080D1A24
	movs r2, 0
	movs r4, 0xF0
_080D1A24:
	movs r0, 0x2A
	ldrsh r1, [r3, r0]
	lsls r1, 1
	adds r1, r6
	lsls r2, 8
	lsls r0, r4, 16
	asrs r0, 16
	orrs r0, r2
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_80D4104
	lsls r0, 24
	cmp r0, 0
	beq _080D1A10
	ldr r0, [r5]
	ldrh r1, [r0, 0x2C]
	adds r1, 0x20
	strh r1, [r0, 0x2C]
	movs r1, 0x28
	ldrsh r0, [r0, r1]
	cmp r0, 0x78
	ble _080D1A5E
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
_080D1A5E:
	ldr r0, [r5]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1A74: .4byte gUnknown_2039A2C
_080D1A78: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D19E4

	thumb_func_start sub_80D1A7C
sub_80D1A7C: @ 80D1A7C
	push {lr}
	ldr r1, _080D1AAC @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D1AB0 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D1AB4 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_80D3E60
	ldr r0, _080D1AB8 @ =sub_80D1638
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D1AAC: .4byte 0x040000b0
_080D1AB0: .4byte 0x0000c5ff
_080D1AB4: .4byte 0x00007fff
_080D1AB8: .4byte sub_80D1638
	thumb_func_end sub_80D1A7C

	thumb_func_start sub_80D1ABC
sub_80D1ABC: @ 80D1ABC
	push {r4,r5,lr}
	ldr r5, _080D1B34 @ =0x040000b0
	ldrh r1, [r5, 0xA]
	ldr r0, _080D1B38 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r1, [r5, 0xA]
	ldr r0, _080D1B3C @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0xA]
	bl sub_80D3DF4
	ldr r4, _080D1B40 @ =gUnknown_2039A2C
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D1AF4
	ldr r1, _080D1B44 @ =0x040000d4
	ldr r0, _080D1B48 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D1B4C @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D1AF4:
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	ldr r4, _080D1B48 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r4, r0
	ldrh r1, [r4]
	movs r0, 0x40
	bl SetGpuReg
	str r4, [r5]
	ldr r0, _080D1B50 @ =0x04000040
	str r0, [r5, 0x4]
	ldr r0, _080D1B54 @ =0xa2400001
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1B34: .4byte 0x040000b0
_080D1B38: .4byte 0x0000c5ff
_080D1B3C: .4byte 0x00007fff
_080D1B40: .4byte gUnknown_2039A2C
_080D1B44: .4byte 0x040000d4
_080D1B48: .4byte gScanlineEffectRegBuffers
_080D1B4C: .4byte 0x800000a0
_080D1B50: .4byte 0x04000040
_080D1B54: .4byte 0xa2400001
	thumb_func_end sub_80D1ABC

	thumb_func_start sub_80D1B58
sub_80D1B58: @ 80D1B58
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D1B88 @ =gUnknown_83FA430
	ldr r2, _080D1B8C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D1B6A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D1B6A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1B88: .4byte gUnknown_83FA430
_080D1B8C: .4byte gTasks
	thumb_func_end sub_80D1B58

	thumb_func_start sub_80D1B90
sub_80D1B90: @ 80D1B90
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	movs r2, 0
	ldr r4, _080D1BD8 @ =gScanlineEffectRegBuffers + 0x780
	ldr r3, _080D1BDC @ =gUnknown_2039A2C
_080D1BA2:
	lsls r1, r2, 1
	adds r1, r4
	ldr r0, [r3]
	ldrh r0, [r0, 0x16]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9F
	bls _080D1BA2
	ldr r0, _080D1BE0 @ =sub_80D1CC8
	bl SetVBlankCallback
	ldr r0, _080D1BE4 @ =sub_80D1D00
	bl SetHBlankCallback
	movs r0, 0x2
	bl EnableInterrupts
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D1BD8: .4byte gScanlineEffectRegBuffers + 0x780
_080D1BDC: .4byte gUnknown_2039A2C
_080D1BE0: .4byte sub_80D1CC8
_080D1BE4: .4byte sub_80D1D00
	thumb_func_end sub_80D1B90

	thumb_func_start sub_80D1BE8
sub_80D1BE8: @ 80D1BE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _080D1CB4 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r2, [r6, 0xC]
	lsls r1, r2, 16
	asrs r0, r1, 24
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r4, [r6, 0xA]
	movs r0, 0xC0
	lsls r0, 1
	mov r8, r0
	movs r5, 0x80
	lsls r5, 3
	adds r0, r4, r5
	strh r0, [r6, 0xA]
	ldr r0, _080D1CB8 @ =0x1fff0000
	cmp r1, r0
	bgt _080D1C24
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r2, r1
	strh r0, [r6, 0xC]
_080D1C24:
	movs r5, 0
	lsls r7, r3, 16
_080D1C28:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r1, _080D1CBC @ =gScanlineEffectRegBuffers
	lsls r2, r5, 1
	adds r2, r1
	ldr r1, _080D1CB4 @ =gUnknown_2039A2C
	ldr r1, [r1]
	ldrh r1, [r1, 0x16]
	adds r0, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _080D1C28
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x29
	bne _080D1C78
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x8
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080D1C78:
	movs r5, 0x10
	ldrsh r0, [r6, r5]
	cmp r0, 0
	beq _080D1C9A
	ldr r0, _080D1CC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080D1C9A
	ldr r0, _080D1CC4 @ =sub_80D1B58
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D1C9A:
	ldr r0, _080D1CB4 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1CB4: .4byte gUnknown_2039A2C
_080D1CB8: .4byte 0x1fff0000
_080D1CBC: .4byte gScanlineEffectRegBuffers
_080D1CC0: .4byte gPaletteFade
_080D1CC4: .4byte sub_80D1B58
	thumb_func_end sub_80D1BE8

	thumb_func_start sub_80D1CC8
sub_80D1CC8: @ 80D1CC8
	push {lr}
	bl sub_80D3DF4
	ldr r0, _080D1CF0 @ =gUnknown_2039A2C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D1CEC
	ldr r1, _080D1CF4 @ =0x040000d4
	ldr r0, _080D1CF8 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D1CFC @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D1CEC:
	pop {r0}
	bx r0
	.align 2, 0
_080D1CF0: .4byte gUnknown_2039A2C
_080D1CF4: .4byte 0x040000d4
_080D1CF8: .4byte gScanlineEffectRegBuffers
_080D1CFC: .4byte 0x800000a0
	thumb_func_end sub_80D1CC8

	thumb_func_start sub_80D1D00
sub_80D1D00: @ 80D1D00
	ldr r1, _080D1D20 @ =gScanlineEffectRegBuffers
	ldr r0, _080D1D24 @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080D1D28 @ =0x04000016
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080D1D20: .4byte gScanlineEffectRegBuffers
_080D1D24: .4byte 0x04000006
_080D1D28: .4byte 0x04000016
	thumb_func_end sub_80D1D00

	thumb_func_start sub_80D1D2C
sub_80D1D2C: @ 80D1D2C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D1D5C @ =gUnknown_83FA438
	ldr r2, _080D1D60 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D1D3E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D1D3E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1D5C: .4byte gUnknown_83FA438
_080D1D60: .4byte gTasks
	thumb_func_end sub_80D1D2C

	thumb_func_start sub_80D1D64
sub_80D1D64: @ 80D1D64
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	ldr r0, _080D1DB0 @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _080D1DB4 @ =gScanlineEffectRegBuffers + 0x780
	movs r2, 0xF2
_080D1D8A:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _080D1D8A
	ldr r0, _080D1DB8 @ =sub_80D1E98
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D1DB0: .4byte gUnknown_2039A2C
_080D1DB4: .4byte gScanlineEffectRegBuffers + 0x780
_080D1DB8: .4byte sub_80D1E98
	thumb_func_end sub_80D1D64

	thumb_func_start sub_80D1DBC
sub_80D1DBC: @ 80D1DBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldr r0, _080D1E50 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _080D1E54 @ =gScanlineEffectRegBuffers
	ldrh r0, [r4, 0xC]
	ldrb r5, [r4, 0xC]
	adds r0, 0x10
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	adds r0, 0x8
	strh r0, [r4, 0xA]
	movs r6, 0
	movs r0, 0x1
	mov r8, r0
_080D1DE4:
	adds r0, r5, 0
	movs r1, 0x28
	bl Sin
	ldrh r1, [r4, 0xA]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bge _080D1DFA
	movs r1, 0
_080D1DFA:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _080D1E04
	movs r1, 0xF0
_080D1E04:
	lsls r0, r1, 16
	asrs r0, 16
	lsls r1, r0, 8
	movs r2, 0xF1
	orrs r1, r2
	strh r1, [r7]
	cmp r0, 0xEF
	bgt _080D1E18
	movs r0, 0
	mov r8, r0
_080D1E18:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x2
	cmp r6, 0x9F
	bls _080D1DE4
	mov r1, r8
	cmp r1, 0
	beq _080D1E36
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D1E36:
	ldr r0, _080D1E50 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1E50: .4byte gUnknown_2039A2C
_080D1E54: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D1DBC

	thumb_func_start sub_80D1E58
sub_80D1E58: @ 80D1E58
	push {lr}
	ldr r1, _080D1E88 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D1E8C @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D1E90 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_80D3E60
	ldr r0, _080D1E94 @ =sub_80D1D2C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D1E88: .4byte 0x040000b0
_080D1E8C: .4byte 0x0000c5ff
_080D1E90: .4byte 0x00007fff
_080D1E94: .4byte sub_80D1D2C
	thumb_func_end sub_80D1E58

	thumb_func_start sub_80D1E98
sub_80D1E98: @ 80D1E98
	push {r4,r5,lr}
	ldr r4, _080D1F04 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _080D1F08 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _080D1F0C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_80D3DF4
	ldr r5, _080D1F10 @ =gUnknown_2039A2C
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D1ED0
	ldr r1, _080D1F14 @ =0x040000d4
	ldr r0, _080D1F18 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D1F1C @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D1ED0:
	ldr r0, [r5]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r5]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r5]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, _080D1F20 @ =gScanlineEffectRegBuffers + 0x780
	str r0, [r4]
	ldr r0, _080D1F24 @ =0x04000040
	str r0, [r4, 0x4]
	ldr r0, _080D1F28 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1F04: .4byte 0x040000b0
_080D1F08: .4byte 0x0000c5ff
_080D1F0C: .4byte 0x00007fff
_080D1F10: .4byte gUnknown_2039A2C
_080D1F14: .4byte 0x040000d4
_080D1F18: .4byte gScanlineEffectRegBuffers
_080D1F1C: .4byte 0x800000a0
_080D1F20: .4byte gScanlineEffectRegBuffers + 0x780
_080D1F24: .4byte 0x04000040
_080D1F28: .4byte 0xa2400001
	thumb_func_end sub_80D1E98

	thumb_func_start sub_80D1F2C
sub_80D1F2C: @ 80D1F2C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D1F5C @ =gUnknown_83FA464
	ldr r2, _080D1F60 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D1F3E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D1F3E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1F5C: .4byte gUnknown_83FA464
_080D1F60: .4byte gTasks
	thumb_func_end sub_80D1F2C

	thumb_func_start sub_80D1F64
sub_80D1F64: @ 80D1F64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	movs r0, 0
	mov r10, r0
	movs r1, 0xA0
	lsls r1, 17
	ldr r4, _080D1FD8 @ =gScanlineEffectRegBuffers + 0x780
	ldr r3, _080D1FDC @ =0x000003bf
	movs r2, 0x78
_080D1F8E:
	asrs r0, r1, 16
	lsls r1, r0, 1
	adds r1, r4
	strh r2, [r1]
	adds r0, 0x1
	lsls r1, r0, 16
	asrs r0, r1, 16
	cmp r0, r3
	ble _080D1F8E
	lsls r0, r5, 16
	movs r1, 0
	mov r9, r1
	str r0, [sp, 0xC]
	cmp r0, 0
	bgt _080D1FAE
	b _080D221A
_080D1FAE:
	mov r3, r10
	lsrs r2, r3, 3
	ldr r4, [sp]
	adds r0, r2, r4
	lsls r0, 16
	lsrs r3, r0, 16
	mov r0, r10
	adds r0, 0x1
	asrs r1, r0, 3
	str r0, [sp, 0x8]
	cmp r2, r1
	beq _080D1FE0
	lsls r1, r3, 16
	movs r6, 0x80
	lsls r6, 9
	adds r0, r1, r6
	lsrs r0, 16
	mov r8, r0
	adds r0, r1, 0
	b _080D1FE6
	.align 2, 0
_080D1FD8: .4byte gScanlineEffectRegBuffers + 0x780
_080D1FDC: .4byte 0x000003bf
_080D1FE0:
	lsls r0, r3, 16
	lsrs r1, r0, 16
	mov r8, r1
_080D1FE6:
	asrs r4, r0, 16
	mov r0, r10
	adds r1, r4, 0
	bl Sin
	movs r5, 0x50
	subs r0, r5, r0
	lsls r0, 16
	lsrs r2, r0, 16
	mov r0, r10
	adds r1, r4, 0
	str r2, [sp, 0x10]
	bl Cos
	adds r0, 0x78
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r6, [sp, 0x8]
	mov r3, r8
	lsls r4, r3, 16
	asrs r4, 16
	adds r0, r6, 0
	adds r1, r4, 0
	bl Sin
	subs r5, r0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	adds r1, r4, 0
	bl Cos
	adds r0, 0x78
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, [sp, 0x10]
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r1, 0
	bge _080D203E
	lsls r0, r5, 16
	cmp r0, 0
	bge _080D203E
	b _080D21F8
_080D203E:
	cmp r1, 0x9F
	ble _080D204C
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _080D204C
	b _080D21F8
_080D204C:
	cmp r1, 0
	bge _080D2052
	movs r2, 0
_080D2052:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _080D205C
	movs r2, 0x9F
_080D205C:
	lsls r0, r7, 16
	cmp r0, 0
	bge _080D2064
	movs r7, 0
_080D2064:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080D206E
	movs r7, 0xFF
_080D206E:
	lsls r0, r5, 16
	cmp r0, 0
	bge _080D2076
	movs r5, 0
_080D2076:
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _080D2080
	movs r5, 0x9F
_080D2080:
	lsls r0, r3, 16
	cmp r0, 0
	bge _080D2088
	movs r3, 0
_080D2088:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080D2092
	movs r3, 0xFF
_080D2092:
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r2, r1, 16
	subs r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r10
	subs r0, 0x40
	lsls r0, 24
	adds r6, r1, 0
	cmp r0, 0
	blt _080D2158
	movs r4, 0xA0
	lsls r4, 1
	adds r0, r2, r4
	lsls r0, 1
	ldr r1, _080D20E8 @ =gScanlineEffectRegBuffers + 0x780
	adds r0, r1
	strh r7, [r0]
	lsls r0, r5, 16
	adds r4, r0, 0
	cmp r4, 0
	bne _080D20C4
	b _080D21F8
_080D20C4:
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r2, r1, 16
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	mov r8, r0
	movs r0, 0x1
	negs r0, r0
	cmp r8, r0
	bge _080D20EC
	cmp r2, 0x1
	ble _080D20EC
	subs r0, r2, 0x1
	b _080D20FC
	.align 2, 0
_080D20E8: .4byte gScanlineEffectRegBuffers + 0x780
_080D20EC:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D2100
	asrs r0, r1, 16
	cmp r0, 0xFE
	bgt _080D2100
	adds r0, 0x1
_080D20FC:
	lsls r0, 16
	lsrs r7, r0, 16
_080D2100:
	adds r0, r4, 0
	asrs r1, r0, 16
	cmp r1, 0
	bge _080D212C
	asrs r2, r6, 16
	ldr r3, _080D2128 @ =gScanlineEffectRegBuffers + 0x780
_080D210C:
	asrs r1, r0, 16
	adds r0, r2, r1
	movs r4, 0xA0
	lsls r4, 1
	adds r0, r4
	lsls r0, 1
	adds r0, r3
	strh r7, [r0]
	adds r1, 0x1
	lsls r0, r1, 16
	cmp r0, 0
	blt _080D210C
	b _080D21F8
	.align 2, 0
_080D2128: .4byte gScanlineEffectRegBuffers + 0x780
_080D212C:
	cmp r1, 0
	ble _080D21F8
	asrs r2, r6, 16
	ldr r3, _080D2154 @ =gScanlineEffectRegBuffers + 0x780
_080D2134:
	lsls r1, r5, 16
	asrs r1, 16
	adds r0, r2, r1
	movs r6, 0xA0
	lsls r6, 1
	adds r0, r6
	lsls r0, 1
	adds r0, r3
	strh r7, [r0]
	subs r1, 0x1
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r1, 0
	bgt _080D2134
	b _080D21F8
	.align 2, 0
_080D2154: .4byte gScanlineEffectRegBuffers + 0x780
_080D2158:
	movs r1, 0xF0
	lsls r1, 1
	adds r0, r2, r1
	lsls r0, 1
	ldr r2, _080D2190 @ =gScanlineEffectRegBuffers + 0x780
	adds r0, r2
	strh r7, [r0]
	lsls r0, r5, 16
	adds r4, r0, 0
	cmp r4, 0
	beq _080D21F8
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r2, r1, 16
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	mov r8, r0
	movs r0, 0x1
	negs r0, r0
	cmp r8, r0
	bge _080D2194
	cmp r2, 0x1
	ble _080D2194
	subs r0, r2, 0x1
	b _080D21A4
	.align 2, 0
_080D2190: .4byte gScanlineEffectRegBuffers + 0x780
_080D2194:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D21A8
	asrs r0, r1, 16
	cmp r0, 0xFE
	bgt _080D21A8
	adds r0, 0x1
_080D21A4:
	lsls r0, 16
	lsrs r7, r0, 16
_080D21A8:
	adds r0, r4, 0
	asrs r1, r0, 16
	cmp r1, 0
	bge _080D21D4
	asrs r2, r6, 16
	ldr r3, _080D21D0 @ =gScanlineEffectRegBuffers + 0x780
_080D21B4:
	asrs r1, r0, 16
	adds r0, r2, r1
	movs r4, 0xF0
	lsls r4, 1
	adds r0, r4
	lsls r0, 1
	adds r0, r3
	strh r7, [r0]
	adds r1, 0x1
	lsls r0, r1, 16
	cmp r0, 0
	blt _080D21B4
	b _080D21F8
	.align 2, 0
_080D21D0: .4byte gScanlineEffectRegBuffers + 0x780
_080D21D4:
	cmp r1, 0
	ble _080D21F8
	asrs r2, r6, 16
	ldr r3, _080D2270 @ =gScanlineEffectRegBuffers + 0x780
_080D21DC:
	lsls r1, r5, 16
	asrs r1, 16
	adds r0, r2, r1
	movs r6, 0xF0
	lsls r6, 1
	adds r0, r6
	lsls r0, 1
	adds r0, r3
	strh r7, [r0]
	subs r1, 0x1
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r1, 0
	bgt _080D21DC
_080D21F8:
	mov r1, r9
	lsls r0, r1, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	ldr r3, [sp, 0x8]
	lsls r1, r3, 24
	lsrs r1, 24
	mov r10, r1
	lsrs r4, r0, 16
	mov r9, r4
	asrs r0, 16
	ldr r6, [sp, 0xC]
	asrs r1, r6, 12
	cmp r0, r1
	bge _080D221A
	b _080D1FAE
_080D221A:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	beq _080D222C
	movs r0, 0xC0
	lsls r0, 10
	ldr r1, [sp, 0xC]
	ands r0, r1
	cmp r0, 0
	bne _080D2274
_080D222C:
	movs r2, 0
	mov r9, r2
	ldr r4, _080D2270 @ =gScanlineEffectRegBuffers + 0x780
	movs r5, 0xA0
	lsls r5, 1
_080D2236:
	mov r3, r9
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldr r6, [sp, 0x4]
	adds r3, r6
	lsls r3, 1
	adds r3, r4
	adds r0, r1, r5
	lsls r0, 1
	adds r0, r4
	ldrh r2, [r0]
	lsls r2, 8
	movs r6, 0xF0
	lsls r6, 1
	adds r0, r1, r6
	lsls r0, 1
	adds r0, r4
	ldrh r0, [r0]
	orrs r2, r0
	strh r2, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r0, r1, 16
	mov r9, r0
	asrs r1, 16
	cmp r1, 0x9F
	ble _080D2236
	b _080D251C
	.align 2, 0
_080D2270: .4byte gScanlineEffectRegBuffers + 0x780
_080D2274:
	ldr r1, [sp, 0xC]
	asrs r4, r1, 16
	lsls r0, r4, 20
	asrs r0, 16
	lsls r5, r4, 1
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	adds r1, r5
	lsls r1, 16
	asrs r1, 16
	bl Sin
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r4, 0
	bge _080D2298
	adds r4, 0x3
_080D2298:
	asrs r0, r4, 2
	cmp r0, 0x1
	beq _080D234C
	cmp r0, 0x1
	bgt _080D22A8
	cmp r0, 0
	beq _080D22B6
	b _080D24DA
_080D22A8:
	cmp r0, 0x2
	bne _080D22AE
	b _080D23CC
_080D22AE:
	cmp r0, 0x3
	bne _080D22B4
	b _080D2466
_080D22B4:
	b _080D24DA
_080D22B6:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	ble _080D22C0
	movs r2, 0x50
_080D22C0:
	mov r9, r2
	lsls r1, r2, 16
	cmp r1, 0
	bgt _080D22CA
	b _080D24DA
_080D22CA:
	ldr r0, _080D2320 @ =gUnknown_83FA444
	adds r0, r5, r0
	movs r3, 0
	ldrsh r4, [r0, r3]
	ldr r6, _080D2324 @ =gScanlineEffectRegBuffers + 0x780
_080D22D4:
	ldr r0, _080D2328 @ =gUnknown_2039A2C
	ldr r5, [r0]
	asrs r2, r1, 16
	adds r0, r2, 0
	muls r0, r4
	asrs r0, 8
	adds r0, 0x78
	lsls r1, r0, 16
	lsrs r7, r1, 16
	strh r0, [r5, 0x28]
	lsls r1, r7, 16
	lsrs r0, r1, 16
	cmp r0, 0xFF
	bhi _080D2334
	movs r3, 0xC8
	lsls r3, 1
	adds r0, r3, 0
	subs r0, r2
	strh r0, [r5, 0x14]
	adds r0, r3, 0
	subs r0, r2
	lsls r0, 1
	adds r3, r0, r6
	ldrh r0, [r3]
	strh r0, [r5, 0x38]
	movs r0, 0x8C
	lsls r0, 2
	subs r0, r2
	lsls r0, 1
	adds r2, r0, r6
	ldrh r0, [r2]
	asrs r1, 16
	cmp r0, r1
	bge _080D232C
	movs r0, 0x78
	strh r0, [r2]
	b _080D2334
	.align 2, 0
_080D2320: .4byte gUnknown_83FA444
_080D2324: .4byte gScanlineEffectRegBuffers + 0x780
_080D2328: .4byte gUnknown_2039A2C
_080D232C:
	ldrh r0, [r3]
	cmp r0, r1
	bge _080D2334
	strh r7, [r3]
_080D2334:
	mov r1, r9
	lsls r0, r1, 16
	ldr r2, _080D2348 @ =0xffff0000
	adds r0, r2
	lsrs r0, 16
	mov r9, r0
	lsls r1, r0, 16
	cmp r1, 0
	bgt _080D22D4
	b _080D24DA
	.align 2, 0
_080D2348: .4byte 0xffff0000
_080D234C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	ble _080D2356
	movs r2, 0x50
_080D2356:
	mov r9, r2
	lsls r1, r2, 16
	cmp r1, 0
	bgt _080D2360
	b _080D24DA
_080D2360:
	ldr r0, _080D23BC @ =gUnknown_83FA444
	adds r0, r5, r0
	movs r3, 0
	ldrsh r4, [r0, r3]
	ldr r6, _080D23C0 @ =gScanlineEffectRegBuffers + 0x780
_080D236A:
	ldr r0, _080D23C4 @ =gUnknown_2039A2C
	ldr r3, [r0]
	asrs r2, r1, 16
	adds r0, r2, 0
	muls r0, r4
	asrs r0, 8
	adds r0, 0x78
	lsls r1, r0, 16
	lsrs r7, r1, 16
	strh r0, [r3, 0x28]
	lsls r5, r7, 16
	lsrs r0, r5, 16
	cmp r0, 0xFF
	bhi _080D23A6
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r1, 0
	subs r0, r2
	strh r0, [r3, 0x14]
	adds r0, r1, 0
	subs r0, r2
	lsls r0, 1
	adds r2, r0, r6
	ldrh r0, [r2]
	strh r0, [r3, 0x38]
	ldrh r1, [r2]
	asrs r0, r5, 16
	cmp r1, r0
	bge _080D23A6
	strh r7, [r2]
_080D23A6:
	mov r2, r9
	lsls r0, r2, 16
	ldr r3, _080D23C8 @ =0xffff0000
	adds r0, r3
	lsrs r0, 16
	mov r9, r0
	lsls r1, r0, 16
	cmp r1, 0
	bgt _080D236A
	b _080D24DA
	.align 2, 0
_080D23BC: .4byte gUnknown_83FA444
_080D23C0: .4byte gScanlineEffectRegBuffers + 0x780
_080D23C4: .4byte gUnknown_2039A2C
_080D23C8: .4byte 0xffff0000
_080D23CC:
	lsls r0, r2, 16
	asrs r0, 16
	movs r1, 0x4F
	negs r1, r1
	cmp r0, r1
	bge _080D23DA
	ldr r2, _080D2438 @ =0x0000ffb1
_080D23DA:
	mov r9, r2
	lsls r1, r2, 16
	cmp r1, 0
	bgt _080D24DA
	ldr r0, _080D243C @ =gUnknown_83FA444
	adds r0, r5, r0
	movs r6, 0
	ldrsh r4, [r0, r6]
	ldr r6, _080D2440 @ =gScanlineEffectRegBuffers + 0x780
_080D23EC:
	ldr r0, _080D2444 @ =gUnknown_2039A2C
	ldr r5, [r0]
	asrs r2, r1, 16
	adds r0, r2, 0
	muls r0, r4
	asrs r0, 8
	adds r0, 0x78
	lsls r1, r0, 16
	lsrs r7, r1, 16
	strh r0, [r5, 0x28]
	lsls r1, r7, 16
	lsrs r0, r1, 16
	cmp r0, 0xFF
	bhi _080D2450
	movs r3, 0x8C
	lsls r3, 2
	adds r0, r3, 0
	subs r0, r2
	strh r0, [r5, 0x14]
	adds r0, r3, 0
	subs r0, r2
	lsls r0, 1
	adds r3, r0, r6
	ldrh r0, [r3]
	strh r0, [r5, 0x38]
	movs r0, 0xC8
	lsls r0, 1
	subs r0, r2
	lsls r0, 1
	adds r2, r0, r6
	ldrh r0, [r2]
	asrs r1, 16
	cmp r0, r1
	blt _080D2448
	movs r0, 0x78
	strh r0, [r2]
	b _080D2450
	.align 2, 0
_080D2438: .4byte 0x0000ffb1
_080D243C: .4byte gUnknown_83FA444
_080D2440: .4byte gScanlineEffectRegBuffers + 0x780
_080D2444: .4byte gUnknown_2039A2C
_080D2448:
	ldrh r0, [r3]
	cmp r0, r1
	ble _080D2450
	strh r7, [r3]
_080D2450:
	mov r1, r9
	lsls r0, r1, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r0, 16
	mov r9, r0
	lsls r1, r0, 16
	cmp r1, 0
	ble _080D23EC
	b _080D24DA
_080D2466:
	lsls r0, r2, 16
	asrs r0, 16
	movs r1, 0x4F
	negs r1, r1
	cmp r0, r1
	bge _080D2474
	ldr r2, _080D252C @ =0x0000ffb1
_080D2474:
	mov r9, r2
	lsls r1, r2, 16
	cmp r1, 0
	bgt _080D24DA
	ldr r0, _080D2530 @ =gUnknown_83FA444
	adds r0, r5, r0
	movs r3, 0
	ldrsh r4, [r0, r3]
	ldr r6, _080D2534 @ =gUnknown_2039A2C
	mov r8, r6
	ldr r6, _080D2538 @ =gScanlineEffectRegBuffers + 0x780
_080D248A:
	mov r0, r8
	ldr r3, [r0]
	asrs r2, r1, 16
	adds r0, r2, 0
	muls r0, r4
	asrs r0, 8
	adds r0, 0x78
	lsls r1, r0, 16
	lsrs r7, r1, 16
	strh r0, [r3, 0x28]
	lsls r5, r7, 16
	lsrs r0, r5, 16
	cmp r0, 0xFF
	bhi _080D24C6
	movs r1, 0x8C
	lsls r1, 2
	adds r0, r1, 0
	subs r0, r2
	strh r0, [r3, 0x14]
	adds r0, r1, 0
	subs r0, r2
	lsls r0, 1
	adds r2, r0, r6
	ldrh r0, [r2]
	strh r0, [r3, 0x38]
	ldrh r1, [r2]
	asrs r0, r5, 16
	cmp r1, r0
	ble _080D24C6
	strh r7, [r2]
_080D24C6:
	mov r2, r9
	lsls r0, r2, 16
	movs r3, 0x80
	lsls r3, 9
	adds r0, r3
	lsrs r0, 16
	mov r9, r0
	lsls r1, r0, 16
	cmp r1, 0
	ble _080D248A
_080D24DA:
	movs r4, 0
	mov r9, r4
	ldr r4, _080D2538 @ =gScanlineEffectRegBuffers + 0x780
	movs r5, 0xA0
	lsls r5, 1
_080D24E4:
	mov r6, r9
	lsls r1, r6, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldr r0, [sp, 0x4]
	adds r3, r0
	lsls r3, 1
	adds r3, r4
	adds r0, r1, r5
	lsls r0, 1
	adds r0, r4
	ldrh r2, [r0]
	lsls r2, 8
	movs r6, 0xF0
	lsls r6, 1
	adds r0, r1, r6
	lsls r0, 1
	adds r0, r4
	ldrh r0, [r0]
	orrs r2, r0
	strh r2, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r0, r1, 16
	mov r9, r0
	asrs r1, 16
	cmp r1, 0x9F
	ble _080D24E4
_080D251C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D252C: .4byte 0x0000ffb1
_080D2530: .4byte gUnknown_83FA444
_080D2534: .4byte gUnknown_2039A2C
_080D2538: .4byte gScanlineEffectRegBuffers + 0x780
	thumb_func_end sub_80D1F64

	thumb_func_start sub_80D253C
sub_80D253C: @ 80D253C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	ldr r0, _080D25A0 @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r4, 0
	strh r4, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	ldr r0, _080D25A4 @ =0x00007878
	strh r0, [r1, 0x6]
	ldr r0, _080D25A8 @ =0x00003070
	strh r0, [r1, 0x8]
	ldr r0, _080D25AC @ =0x00001090
	strh r0, [r1, 0xC]
	strh r4, [r1, 0x20]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_80D1F64
	movs r0, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_80D1F64
	ldr r1, _080D25B0 @ =0x040000d4
	ldr r0, _080D25B4 @ =gScanlineEffectRegBuffers + 0x780
	str r0, [r1]
	ldr r2, _080D25B8 @ =0xfffff880
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D25BC @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, _080D25C0 @ =sub_80D2698
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	strh r4, [r5, 0xA]
	strh r4, [r5, 0xC]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D25A0: .4byte gUnknown_2039A2C
_080D25A4: .4byte 0x00007878
_080D25A8: .4byte 0x00003070
_080D25AC: .4byte 0x00001090
_080D25B0: .4byte 0x040000d4
_080D25B4: .4byte gScanlineEffectRegBuffers + 0x780
_080D25B8: .4byte 0xfffff880
_080D25BC: .4byte 0x80000140
_080D25C0: .4byte sub_80D2698
	thumb_func_end sub_80D253C

	thumb_func_start sub_80D25C4
sub_80D25C4: @ 80D25C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_80D1F64
	ldr r5, _080D2694 @ =gUnknown_2039A2C
	ldr r1, [r5]
	ldrb r0, [r1]
	movs r2, 0x1
	mov r8, r2
	ldrb r2, [r1]
	movs r7, 0
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	bne _080D2686
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r1, 0x10
	movs r2, 0
	bl sub_80D1F64
	ldrh r1, [r4, 0xC]
	movs r6, 0x30
	subs r0, r6, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r0, 0
	bge _080D2618
	movs r3, 0
_080D2618:
	adds r0, r1, 0
	adds r0, 0x70
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080D2628
	movs r2, 0xFF
_080D2628:
	ldr r0, [r5]
	orrs r2, r3
	strh r2, [r0, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x20
	strh r0, [r4, 0xC]
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	movs r1, 0
	movs r2, 0x1
	bl sub_80D1F64
	ldrh r1, [r4, 0xC]
	subs r0, r6, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r0, 0
	bge _080D2652
	movs r3, 0
_080D2652:
	adds r0, r1, 0
	adds r0, 0x70
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080D2662
	movs r2, 0xFF
_080D2662:
	ldr r1, [r5]
	orrs r2, r3
	strh r2, [r1, 0xC]
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	ldrb r2, [r1]
	orrs r0, r7
	strb r0, [r1]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x9F
	ble _080D2686
	ldr r1, [r5]
	movs r0, 0x1
	strh r0, [r1, 0x20]
	bl sub_80D3E60
_080D2686:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D2694: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D25C4

	thumb_func_start sub_80D2698
sub_80D2698: @ 80D2698
	push {r4-r6,lr}
	ldr r5, _080D26D0 @ =0x040000b0
	ldrh r1, [r5, 0xA]
	ldr r0, _080D26D4 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r1, [r5, 0xA]
	ldr r0, _080D26D8 @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0xA]
	bl sub_80D3DF4
	ldr r4, _080D26DC @ =gUnknown_2039A2C
	ldr r2, [r4]
	movs r0, 0x20
	ldrsh r3, [r2, r0]
	cmp r3, 0
	beq _080D26E4
	ldr r0, _080D26E0 @ =sub_80D1F2C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _080D2746
	.align 2, 0
_080D26D0: .4byte 0x040000b0
_080D26D4: .4byte 0x0000c5ff
_080D26D8: .4byte 0x00007fff
_080D26DC: .4byte gUnknown_2039A2C
_080D26E0: .4byte sub_80D1F2C
_080D26E4:
	ldrb r0, [r2]
	cmp r0, 0
	beq _080D2700
	ldr r1, _080D274C @ =0x040000d4
	ldr r0, _080D2750 @ =gScanlineEffectRegBuffers + 0x780
	str r0, [r1]
	ldr r6, _080D2754 @ =0xfffff880
	adds r0, r6
	str r0, [r1, 0x4]
	ldr r0, _080D2758 @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrb r0, [r2]
	strb r3, [r2]
_080D2700:
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0xC]
	movs r0, 0x46
	bl SetGpuReg
	ldr r4, _080D275C @ =gScanlineEffectRegBuffers
	ldrh r1, [r4]
	movs r0, 0x40
	bl SetGpuReg
	ldrh r1, [r4, 0x2]
	movs r0, 0x42
	bl SetGpuReg
	str r4, [r5]
	ldr r0, _080D2760 @ =0x04000040
	str r0, [r5, 0x4]
	ldr r0, _080D2764 @ =0xa6400001
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
_080D2746:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D274C: .4byte 0x040000d4
_080D2750: .4byte gScanlineEffectRegBuffers + 0x780
_080D2754: .4byte 0xfffff880
_080D2758: .4byte 0x80000140
_080D275C: .4byte gScanlineEffectRegBuffers
_080D2760: .4byte 0x04000040
_080D2764: .4byte 0xa6400001
	thumb_func_end sub_80D2698

	thumb_func_start Phase2Task_Transition_Sydney
Phase2Task_Transition_Sydney: @ 80D2768
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D2784 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	bl Phase2Task_MugShotTransition
	pop {r0}
	bx r0
	.align 2, 0
_080D2784: .4byte gTasks
	thumb_func_end Phase2Task_Transition_Sydney

	thumb_func_start Phase2Task_Transition_Phoebe
Phase2Task_Transition_Phoebe: @ 80D2788
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D27A4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1
	strh r2, [r1, 0x26]
	bl Phase2Task_MugShotTransition
	pop {r0}
	bx r0
	.align 2, 0
_080D27A4: .4byte gTasks
	thumb_func_end Phase2Task_Transition_Phoebe

	thumb_func_start Phase2Task_Transition_Glacia
Phase2Task_Transition_Glacia: @ 80D27A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D27C4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x2
	strh r2, [r1, 0x26]
	bl Phase2Task_MugShotTransition
	pop {r0}
	bx r0
	.align 2, 0
_080D27C4: .4byte gTasks
	thumb_func_end Phase2Task_Transition_Glacia

	thumb_func_start Phase2Task_Transition_Drake
Phase2Task_Transition_Drake: @ 80D27C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D27E4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x3
	strh r2, [r1, 0x26]
	bl Phase2Task_MugShotTransition
	pop {r0}
	bx r0
	.align 2, 0
_080D27E4: .4byte gTasks
	thumb_func_end Phase2Task_Transition_Drake

	thumb_func_start Phase2Task_Transition_Steven
Phase2Task_Transition_Steven: @ 80D27E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D2804 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x4
	strh r2, [r1, 0x26]
	bl Phase2Task_MugShotTransition
	pop {r0}
	bx r0
	.align 2, 0
_080D2804: .4byte gTasks
	thumb_func_end Phase2Task_Transition_Steven

	thumb_func_start Phase2Task_MugShotTransition
Phase2Task_MugShotTransition: @ 80D2808
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D2838 @ =gUnknown_83FA46C
	ldr r2, _080D283C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D281A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D281A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2838: .4byte gUnknown_83FA46C
_080D283C: .4byte gTasks
	thumb_func_end Phase2Task_MugShotTransition

	thumb_func_start Phase2_Mugshot_Func1
Phase2_Mugshot_Func1: @ 80D2840
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	adds r0, r4, 0
	bl sub_80D2EA4
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0xC]
	movs r0, 0xEF
	strh r0, [r4, 0xE]
	ldr r0, _080D2898 @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	movs r0, 0x3E
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _080D289C @ =gScanlineEffectRegBuffers + 0x780
	ldr r2, _080D28A0 @ =0x0000f0f1
_080D2874:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _080D2874
	ldr r0, _080D28A4 @ =sub_80D2D50
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D2898: .4byte gUnknown_2039A2C
_080D289C: .4byte gScanlineEffectRegBuffers + 0x780
_080D28A0: .4byte 0x0000f0f1
_080D28A4: .4byte sub_80D2D50
	thumb_func_end Phase2_Mugshot_Func1

	thumb_func_start Phase2_Mugshot_Func2
Phase2_Mugshot_Func2: @ 80D28A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	ldr r6, _080D2950 @ =gUnknown_83FAC34
	add r1, sp, 0x4
	mov r0, sp
	bl sub_80D3E28
	ldr r0, _080D2954 @ =gUnknown_83F8F60
	ldr r1, [sp, 0x4]
	movs r2, 0xF0
	bl CpuSet
	ldr r1, _080D2958 @ =gUnknown_83FA740
	mov r2, r8
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080D295C @ =gUnknown_83FA754
	ldr r0, _080D2960 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xFA
	movs r2, 0xC
	bl LoadPalette
	movs r1, 0
	ldr r5, [sp]
	movs r0, 0xF0
	lsls r0, 8
	adds r7, r0, 0
_080D28FC:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_080D2902:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r6]
	orrs r0, r7
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r6, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1F
	ble _080D2902
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080D28FC
	movs r0, 0x2
	bl EnableInterrupts
	ldr r0, _080D2964 @ =sub_80D2E6C
	bl SetHBlankCallback
	mov r2, r8
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D2950: .4byte gUnknown_83FAC34
_080D2954: .4byte gUnknown_83F8F60
_080D2958: .4byte gUnknown_83FA740
_080D295C: .4byte gUnknown_83FA754
_080D2960: .4byte gSaveBlock2Ptr
_080D2964: .4byte sub_80D2E6C
	thumb_func_end Phase2_Mugshot_Func2

	thumb_func_start sub_80D2968
sub_80D2968: @ 80D2968
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080D2A4C @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _080D2A50 @ =gScanlineEffectRegBuffers
	ldrh r0, [r4, 0xA]
	ldrb r5, [r4, 0xA]
	adds r0, 0x10
	strh r0, [r4, 0xA]
	movs r6, 0
_080D2982:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bge _080D2998
	movs r2, 0x1
_080D2998:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _080D29A2
	movs r2, 0xF0
_080D29A2:
	strh r2, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x4F
	bls _080D2982
	cmp r6, 0x9F
	bhi _080D29FA
_080D29BC:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xE]
	subs r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080D29D2
	movs r2, 0
_080D29D2:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _080D29DC
	movs r2, 0xEF
_080D29DC:
	lsls r0, r2, 16
	asrs r0, 8
	movs r1, 0xF0
	orrs r0, r1
	strh r0, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x9F
	bls _080D29BC
_080D29FA:
	ldrh r1, [r4, 0xC]
	adds r1, 0x8
	strh r1, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x8
	strh r0, [r4, 0xE]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF0
	ble _080D2A12
	movs r0, 0xF0
	strh r0, [r4, 0xC]
_080D2A12:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080D2A1E
	movs r0, 0
	strh r0, [r4, 0xE]
_080D2A1E:
	ldr r0, [r4, 0xC]
	cmp r0, 0xF0
	bne _080D2A2A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D2A2A:
	ldr r0, _080D2A4C @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D2A4C: .4byte gUnknown_2039A2C
_080D2A50: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D2968

	thumb_func_start sub_80D2A54
sub_80D2A54: @ 80D2A54
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, _080D2AC8 @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080D2ACC @ =gScanlineEffectRegBuffers
	adds r5, r2, 0
	movs r2, 0xF0
_080D2A68:
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r1, 0x2
	cmp r0, 0x9F
	bls _080D2A68
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	strh r1, [r4, 0xE]
	ldr r1, [r5]
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r1, 0
	bl sub_80D3120
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl sub_80D3120
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_80D3138
	movs r0, 0x61
	bl PlaySE
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D2AC8: .4byte gUnknown_2039A2C
_080D2ACC: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D2A54

	thumb_func_start sub_80D2AD0
sub_80D2AD0: @ 80D2AD0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D2B08 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_80D3154
	lsls r0, 16
	cmp r0, 0
	beq _080D2B00
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	bl sub_80D3138
_080D2B00:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D2B08: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D2AD0

	thumb_func_start sub_80D2B0C
sub_80D2B0C: @ 80D2B0C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r7, _080D2BAC @ =gUnknown_2039A2C
	ldr r1, [r7]
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	movs r2, 0
	mov r8, r2
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	bl sub_80D3154
	lsls r0, 16
	cmp r0, 0
	beq _080D2BA0
	ldr r1, [r7]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _080D2BB0 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D2BB4 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D2BB8 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r4, _080D2BBC @ =gScanlineEffectRegBuffers
	movs r5, 0xA0
	lsls r5, 1
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	movs r2, 0xF0
	lsls r2, 3
	adds r4, r2
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	mov r0, r8
	strh r0, [r6, 0xE]
	strh r0, [r6, 0x10]
	ldr r1, [r7]
	movs r0, 0xBF
	strh r0, [r1, 0xE]
	ldr r0, _080D2BC0 @ =sub_80D2DEC
	bl SetVBlankCallback
_080D2BA0:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D2BAC: .4byte gUnknown_2039A2C
_080D2BB0: .4byte 0x040000b0
_080D2BB4: .4byte 0x0000c5ff
_080D2BB8: .4byte 0x00007fff
_080D2BBC: .4byte gScanlineEffectRegBuffers
_080D2BC0: .4byte sub_80D2DEC
	thumb_func_end sub_80D2B0C

	thumb_func_start sub_80D2BC4
sub_80D2BC4: @ 80D2BC4
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r2, _080D2C84 @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	movs r6, 0x1
	ldr r1, [r2]
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrh r1, [r4, 0x10]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	mov r12, r2
	cmp r0, 0x4F
	bgt _080D2BF2
	adds r0, r1, 0x2
	strh r0, [r4, 0x10]
_080D2BF2:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080D2BFE
	movs r0, 0x50
	strh r0, [r4, 0x10]
_080D2BFE:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	movs r1, 0x1
	ands r0, r1
	ldrh r3, [r4, 0x10]
	cmp r0, 0
	beq _080D2C60
	movs r2, 0
	lsls r0, r3, 16
	movs r6, 0
	cmp r0, 0
	blt _080D2C60
	movs r7, 0x50
	ldr r5, _080D2C88 @ =gScanlineEffectRegBuffers
_080D2C1C:
	lsls r0, r2, 16
	asrs r3, r0, 16
	subs r1, r7, r3
	adds r0, r3, 0
	adds r0, 0x50
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	asrs r1, 15
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _080D2C3C
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_080D2C3C:
	lsls r0, r2, 16
	asrs r0, 15
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _080D2C4E
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_080D2C4E:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	ldrh r3, [r4, 0x10]
	cmp r0, r1
	ble _080D2C1C
_080D2C60:
	cmp r3, 0x50
	bne _080D2C6E
	cmp r6, 0
	bne _080D2C6E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D2C6E:
	mov r1, r12
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D2C84: .4byte gUnknown_2039A2C
_080D2C88: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D2BC4

	thumb_func_start sub_80D2C8C
sub_80D2C8C: @ 80D2C8C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080D2CBC @ =gUnknown_2039A2C
	ldr r0, [r5]
	ldrb r1, [r0]
	movs r6, 0
	strb r6, [r0]
	movs r0, 0x1
	negs r0, r0
	ldr r2, _080D2CC0 @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	ldr r1, [r5]
	movs r0, 0xFF
	strh r0, [r1, 0xE]
	strh r6, [r4, 0xE]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D2CBC: .4byte gUnknown_2039A2C
_080D2CC0: .4byte 0x00007fff
	thumb_func_end sub_80D2C8C

	thumb_func_start sub_80D2CC4
sub_80D2CC4: @ 80D2CC4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D2D08 @ =gUnknown_2039A2C
	ldr r1, [r5]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _080D2D0C @ =gScanlineEffectRegBuffers
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	ble _080D2CF4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D2CF4:
	ldr r0, [r5]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D2D08: .4byte gUnknown_2039A2C
_080D2D0C: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D2CC4

	thumb_func_start sub_80D2D10
sub_80D2D10: @ 80D2D10
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080D2D44 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D2D48 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D2D4C @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_80D3E60
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D2D44: .4byte 0x040000b0
_080D2D48: .4byte 0x0000c5ff
_080D2D4C: .4byte 0x00007fff
	thumb_func_end sub_80D2D10

	thumb_func_start sub_80D2D50
sub_80D2D50: @ 80D2D50
	push {r4,r5,lr}
	ldr r4, _080D2DC4 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _080D2DC8 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _080D2DCC @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_80D3DF4
	ldr r5, _080D2DD0 @ =gUnknown_2039A2C
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D2D88
	ldr r1, _080D2DD4 @ =0x040000d4
	ldr r0, _080D2DD8 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D2DDC @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D2D88:
	ldr r0, [r5]
	ldrh r1, [r0, 0x1C]
	movs r0, 0x12
	bl SetGpuReg
	ldr r0, [r5]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r5]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r5]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, _080D2DE0 @ =gScanlineEffectRegBuffers + 0x780
	str r0, [r4]
	ldr r0, _080D2DE4 @ =0x04000040
	str r0, [r4, 0x4]
	ldr r0, _080D2DE8 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2DC4: .4byte 0x040000b0
_080D2DC8: .4byte 0x0000c5ff
_080D2DCC: .4byte 0x00007fff
_080D2DD0: .4byte gUnknown_2039A2C
_080D2DD4: .4byte 0x040000d4
_080D2DD8: .4byte gScanlineEffectRegBuffers
_080D2DDC: .4byte 0x800000a0
_080D2DE0: .4byte gScanlineEffectRegBuffers + 0x780
_080D2DE4: .4byte 0x04000040
_080D2DE8: .4byte 0xa2400001
	thumb_func_end sub_80D2D50

	thumb_func_start sub_80D2DEC
sub_80D2DEC: @ 80D2DEC
	push {r4,lr}
	ldr r4, _080D2E44 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _080D2E48 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _080D2E4C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_80D3DF4
	ldr r2, _080D2E50 @ =gUnknown_2039A2C
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D2E24
	ldr r1, _080D2E54 @ =0x040000d4
	ldr r0, _080D2E58 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _080D2E5C @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D2E24:
	ldr r0, [r2]
	ldrh r1, [r0, 0xE]
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, _080D2E60 @ =gScanlineEffectRegBuffers + 0x780
	str r0, [r4]
	ldr r0, _080D2E64 @ =0x04000054
	str r0, [r4, 0x4]
	ldr r0, _080D2E68 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2E44: .4byte 0x040000b0
_080D2E48: .4byte 0x0000c5ff
_080D2E4C: .4byte 0x00007fff
_080D2E50: .4byte gUnknown_2039A2C
_080D2E54: .4byte 0x040000d4
_080D2E58: .4byte gScanlineEffectRegBuffers
_080D2E5C: .4byte 0x800000a0
_080D2E60: .4byte gScanlineEffectRegBuffers + 0x780
_080D2E64: .4byte 0x04000054
_080D2E68: .4byte 0xa2400001
	thumb_func_end sub_80D2DEC

	thumb_func_start sub_80D2E6C
sub_80D2E6C: @ 80D2E6C
	push {lr}
	ldr r0, _080D2E80 @ =0x04000006
	ldrh r0, [r0]
	cmp r0, 0x4F
	bhi _080D2E8C
	ldr r1, _080D2E84 @ =0x04000010
	ldr r0, _080D2E88 @ =gUnknown_2039A2C
	ldr r0, [r0]
	ldrh r0, [r0, 0x18]
	b _080D2E94
	.align 2, 0
_080D2E80: .4byte 0x04000006
_080D2E84: .4byte 0x04000010
_080D2E88: .4byte gUnknown_2039A2C
_080D2E8C:
	ldr r1, _080D2E9C @ =0x04000010
	ldr r0, _080D2EA0 @ =gUnknown_2039A2C
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
_080D2E94:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080D2E9C: .4byte 0x04000010
_080D2EA0: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D2E6C

	thumb_func_start sub_80D2EA4
sub_80D2EA4: @ 80D2EA4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r6, _080D2FF8 @ =gReservedSpritePaletteCount
	movs r0, 0xA
	strb r0, [r6]
	ldr r0, _080D2FFC @ =gUnknown_83FA494
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	mov r9, r1
	add r0, r9
	ldrb r0, [r0]
	ldr r2, _080D3000 @ =gUnknown_83FA4AE
	lsls r1, 2
	mov r9, r1
	adds r1, r2
	ldrh r1, [r1]
	subs r1, 0x20
	lsls r1, 16
	asrs r1, 16
	adds r2, 0x2
	add r2, r9
	ldrh r2, [r2]
	adds r2, 0x2A
	lsls r2, 16
	asrs r2, 16
	ldr r5, _080D3004 @ =gDecompressionBuffer
	str r5, [sp]
	movs r3, 0
	bl CreateTrainerSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080D3008 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	bl PlayerGenderToFrontTrainerPicId_Debug
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x88
	lsls r1, 1
	str r5, [sp]
	movs r2, 0x6A
	movs r3, 0
	bl CreateTrainerSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r0, 0xC
	strb r0, [r6]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r1, _080D300C @ =gSprites
	adds r5, r1
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	adds r6, r1
	ldr r0, _080D3010 @ =sub_80D301C
	str r0, [r5, 0x1C]
	str r0, [r6, 0x1C]
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	orrs r0, r1
	strb r0, [r6, 0x1]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1F
	mov r8, r3
	mov r4, r8
	ands r0, r4
	lsls r0, 1
	ldrb r2, [r5, 0x3]
	movs r4, 0x3F
	negs r4, r4
	adds r1, r4, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	ands r0, r1
	lsls r0, 1
	ldrb r1, [r6, 0x3]
	ands r4, r1
	orrs r4, r0
	strb r4, [r6, 0x3]
	ldrb r2, [r5, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, 0x1]
	ldrb r0, [r5, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r0, [r6, 0x3]
	orrs r0, r1
	strb r0, [r6, 0x3]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	adds r0, r6, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r2, _080D3014 @ =gUnknown_83FA49A
	mov r3, r9
	adds r1, r3, r2
	movs r4, 0
	ldrsh r1, [r1, r4]
	adds r2, 0x2
	add r9, r2
	mov r3, r9
	movs r4, 0
	ldrsh r2, [r3, r4]
	movs r3, 0
	bl SetOamMatrixRotationScaling
	ldrb r0, [r6, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _080D3018 @ =0xfffffe00
	movs r2, 0x80
	lsls r2, 2
	movs r3, 0
	bl SetOamMatrixRotationScaling
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D2FF8: .4byte gReservedSpritePaletteCount
_080D2FFC: .4byte gUnknown_83FA494
_080D3000: .4byte gUnknown_83FA4AE
_080D3004: .4byte gDecompressionBuffer
_080D3008: .4byte gSaveBlock2Ptr
_080D300C: .4byte gSprites
_080D3010: .4byte sub_80D301C
_080D3014: .4byte gUnknown_83FA49A
_080D3018: .4byte 0xfffffe00
	thumb_func_end sub_80D2EA4

	thumb_func_start sub_80D301C
sub_80D301C: @ 80D301C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D3040 @ =gUnknown_83FA4C4
_080D3022:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D3022
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3040: .4byte gUnknown_83FA4C4
	thumb_func_end sub_80D301C

	thumb_func_start sub_80D3044
sub_80D3044: @ 80D3044
	movs r0, 0
	bx lr
	thumb_func_end sub_80D3044

	thumb_func_start sub_80D3048
sub_80D3048: @ 80D3048
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r1, _080D308C @ =gUnknown_83FA4E0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _080D3090 @ =gUnknown_83FA4E4
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x30]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r4, r0
	ldrh r0, [r4]
	strh r0, [r5, 0x32]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D308C: .4byte gUnknown_83FA4E0
_080D3090: .4byte gUnknown_83FA4E4
	thumb_func_end sub_80D3048

	thumb_func_start sub_80D3094
sub_80D3094: @ 80D3094
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	ldrh r3, [r1, 0x20]
	adds r2, r0, r3
	strh r2, [r1, 0x20]
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080D30B2
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x84
	bgt _080D30C0
	b _080D30BA
_080D30B2:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x67
	ble _080D30C0
_080D30BA:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_080D30C0:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80D3094

	thumb_func_start sub_80D30C8
sub_80D30C8: @ 80D30C8
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	adds r1, r3, r0
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	lsls r1, 16
	cmp r1, 0
	bne _080D30EE
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	negs r0, r3
	strh r0, [r2, 0x32]
	movs r0, 0x1
	strh r0, [r2, 0x3A]
_080D30EE:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80D30C8

	thumb_func_start sub_80D30F4
sub_80D30F4: @ 80D30F4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x20]
	adds r1, r0
	strh r1, [r2, 0x20]
	adds r1, 0x1F
	lsls r1, 16
	movs r0, 0x97
	lsls r0, 17
	cmp r1, r0
	bls _080D3118
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080D3118:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80D30F4

	thumb_func_start sub_80D3120
sub_80D3120: @ 80D3120
	ldr r3, _080D3134 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3C]
	bx lr
	.align 2, 0
_080D3134: .4byte gSprites
	thumb_func_end sub_80D3120

	thumb_func_start sub_80D3138
sub_80D3138: @ 80D3138
	ldr r2, _080D3150 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	bx lr
	.align 2, 0
_080D3150: .4byte gSprites
	thumb_func_end sub_80D3138

	thumb_func_start sub_80D3154
sub_80D3154: @ 80D3154
	ldr r2, _080D3168 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_080D3168: .4byte gSprites
	thumb_func_end sub_80D3154

	thumb_func_start sub_80D316C
sub_80D316C: @ 80D316C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D319C @ =gUnknown_83FA4E8
	ldr r2, _080D31A0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D317E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D317E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D319C: .4byte gUnknown_83FA4E8
_080D31A0: .4byte gTasks
	thumb_func_end sub_80D316C

	thumb_func_start sub_80D31A4
sub_80D31A4: @ 80D31A4
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	movs r3, 0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0xC]
	movs r0, 0x1
	strh r0, [r5, 0xE]
	ldr r2, _080D3210 @ =gUnknown_2039A2C
	ldr r1, [r2]
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r3, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	ldr r4, _080D3214 @ =gScanlineEffectRegBuffers + 0x780
	adds r6, r2, 0
	movs r2, 0xF0
_080D31D0:
	lsls r1, r3, 1
	adds r1, r4
	ldr r0, [r6]
	ldrh r0, [r0, 0x14]
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r4
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9F
	bls _080D31D0
	movs r0, 0x2
	bl EnableInterrupts
	ldr r0, _080D3218 @ =sub_80D332C
	bl SetVBlankCallback
	ldr r0, _080D321C @ =sub_80D33C0
	bl SetHBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D3210: .4byte gUnknown_2039A2C
_080D3214: .4byte gScanlineEffectRegBuffers + 0x780
_080D3218: .4byte sub_80D332C
_080D321C: .4byte sub_80D33C0
	thumb_func_end sub_80D31A4

	thumb_func_start sub_80D3220
sub_80D3220: @ 80D3220
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r3, r0, 0
	ldr r2, _080D329C @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r3, 0xA]
	adds r0, r1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	mov r8, r2
	cmp r0, 0xF0
	ble _080D324C
	movs r0, 0xF0
	strh r0, [r3, 0xA]
_080D324C:
	ldrh r4, [r3, 0xC]
	movs r0, 0xC
	ldrsh r1, [r3, r0]
	ldr r0, _080D32A0 @ =0x00000fff
	ldrh r2, [r3, 0xE]
	cmp r1, r0
	bgt _080D325E
	adds r0, r4, r2
	strh r0, [r3, 0xC]
_080D325E:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x7F
	bgt _080D326A
	lsls r0, r2, 1
	strh r0, [r3, 0xE]
_080D326A:
	movs r5, 0
	ldr r7, _080D32A4 @ =gScanlineEffectRegBuffers
	movs r1, 0xA0
	lsls r1, 1
	adds r1, r7
	mov r12, r1
	mov r6, r8
_080D3278:
	lsls r0, r5, 1
	adds r2, r0, r7
	mov r1, r12
	adds r4, r0, r1
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _080D32A8
	ldr r1, [r6]
	ldrh r0, [r3, 0xA]
	ldrh r1, [r1, 0x14]
	adds r0, r1
	strh r0, [r2]
	ldrh r1, [r3, 0xA]
	movs r0, 0xF0
	subs r0, r1
	b _080D32BA
	.align 2, 0
_080D329C: .4byte gUnknown_2039A2C
_080D32A0: .4byte 0x00000fff
_080D32A4: .4byte gScanlineEffectRegBuffers
_080D32A8:
	ldr r0, [r6]
	ldrh r0, [r0, 0x14]
	ldrh r1, [r3, 0xA]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r3, 0xA]
	lsls r0, 8
	movs r1, 0xF1
	orrs r0, r1
_080D32BA:
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9F
	bls _080D3278
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0xEF
	ble _080D32D4
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080D32D4:
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80D3220

	thumb_func_start sub_80D32EC
sub_80D32EC: @ 80D32EC
	push {lr}
	ldr r1, _080D331C @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D3320 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D3324 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_80D3E60
	ldr r0, _080D3328 @ =sub_80D316C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D331C: .4byte 0x040000b0
_080D3320: .4byte 0x0000c5ff
_080D3324: .4byte 0x00007fff
_080D3328: .4byte sub_80D316C
	thumb_func_end sub_80D32EC

	thumb_func_start sub_80D332C
sub_80D332C: @ 80D332C
	push {r4,r5,lr}
	ldr r5, _080D3398 @ =0x040000b0
	ldrh r1, [r5, 0xA]
	ldr r0, _080D339C @ =0x0000c5ff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r1, [r5, 0xA]
	ldr r0, _080D33A0 @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0xA]
	bl sub_80D3DF4
	ldr r4, _080D33A4 @ =gUnknown_2039A2C
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D3382
	ldr r1, _080D33A8 @ =0x040000d4
	ldr r0, _080D33AC @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D33B0 @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D3382:
	ldr r0, _080D33B4 @ =gScanlineEffectRegBuffers + 0x8C0
	str r0, [r5]
	ldr r0, _080D33B8 @ =0x04000040
	str r0, [r5, 0x4]
	ldr r0, _080D33BC @ =0xa2400001
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3398: .4byte 0x040000b0
_080D339C: .4byte 0x0000c5ff
_080D33A0: .4byte 0x00007fff
_080D33A4: .4byte gUnknown_2039A2C
_080D33A8: .4byte 0x040000d4
_080D33AC: .4byte gScanlineEffectRegBuffers
_080D33B0: .4byte 0x80000140
_080D33B4: .4byte gScanlineEffectRegBuffers + 0x8C0
_080D33B8: .4byte 0x04000040
_080D33BC: .4byte 0xa2400001
	thumb_func_end sub_80D332C

	thumb_func_start sub_80D33C0
sub_80D33C0: @ 80D33C0
	ldr r1, _080D33E0 @ =gScanlineEffectRegBuffers
	ldr r0, _080D33E4 @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080D33E8 @ =0x04000014
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080D33E0: .4byte gScanlineEffectRegBuffers
_080D33E4: .4byte 0x04000006
_080D33E8: .4byte 0x04000014
	thumb_func_end sub_80D33C0

	thumb_func_start sub_80D33EC
sub_80D33EC: @ 80D33EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D341C @ =gUnknown_83FA4F4
	ldr r2, _080D3420 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D33FE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D33FE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D341C: .4byte gUnknown_83FA4F4
_080D3420: .4byte gTasks
	thumb_func_end sub_80D33EC

	thumb_func_start sub_80D3424
sub_80D3424: @ 80D3424
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	ldr r0, _080D348C @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0xBF
	strh r0, [r1, 0xE]
	strh r2, [r1, 0x12]
	movs r0, 0x1E
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _080D3490 @ =gScanlineEffectRegBuffers + 0x780
	movs r4, 0
	movs r3, 0xF0
_080D3450:
	lsls r0, r1, 1
	adds r0, r2
	strh r4, [r0]
	adds r0, r1, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _080D3450
	movs r0, 0x2
	bl EnableInterrupts
	ldr r0, _080D3494 @ =sub_80D36E0
	bl SetHBlankCallback
	ldr r0, _080D3498 @ =sub_80D35F4
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D348C: .4byte gUnknown_2039A2C
_080D3490: .4byte gScanlineEffectRegBuffers + 0x780
_080D3494: .4byte sub_80D36E0
_080D3498: .4byte sub_80D35F4
	thumb_func_end sub_80D3424

	thumb_func_start sub_80D349C
sub_80D349C: @ 80D349C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r1, _080D3504 @ =gUnknown_83FA508
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	movs r5, 0
	movs r4, 0
_080D34B0:
	ldr r0, _080D3508 @ =sub_80D3720
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080D350C @ =gSprites
	adds r2, r1, r0
	movs r0, 0xF0
	strh r0, [r2, 0x20]
	strh r4, [r2, 0x22]
	lsls r1, r5, 16
	asrs r1, 16
	lsls r0, r1, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r2, 0x38]
	adds r1, 0x1
	lsls r1, 16
	lsls r0, r4, 16
	movs r3, 0xD8
	lsls r3, 13
	adds r0, r3
	lsrs r4, r0, 16
	lsrs r5, r1, 16
	asrs r1, 16
	cmp r1, 0x5
	ble _080D34B0
	ldrh r0, [r2, 0x3A]
	adds r0, 0x1
	strh r0, [r2, 0x3A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D3504: .4byte gUnknown_83FA508
_080D3508: .4byte sub_80D3720
_080D350C: .4byte gSprites
	thumb_func_end sub_80D349C

	thumb_func_start sub_80D3510
sub_80D3510: @ 80D3510
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _080D3544 @ =gUnknown_2039A2C
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x20
	ldrsh r0, [r0, r1]
	cmp r0, 0x5
	ble _080D353A
	movs r0, 0x1
	negs r0, r0
	ldr r2, _080D3548 @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D353A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D3544: .4byte gUnknown_2039A2C
_080D3548: .4byte 0x00007fff
	thumb_func_end sub_80D3510

	thumb_func_start sub_80D354C
sub_80D354C: @ 80D354C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080D35A0 @ =gUnknown_2039A2C
	ldr r0, [r5]
	ldrb r1, [r0]
	movs r4, 0
	strb r4, [r0]
	ldr r1, _080D35A4 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D35A8 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D35AC @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	ldr r1, [r5]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	strh r4, [r1, 0x12]
	movs r0, 0xFF
	strh r0, [r1, 0xE]
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r4, [r1, 0x20]
	ldr r0, _080D35B0 @ =sub_80D3690
	bl SetVBlankCallback
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D35A0: .4byte gUnknown_2039A2C
_080D35A4: .4byte 0x040000b0
_080D35A8: .4byte 0x0000c5ff
_080D35AC: .4byte 0x00007fff
_080D35B0: .4byte sub_80D3690
	thumb_func_end sub_80D354C

	thumb_func_start sub_80D35B4
sub_80D35B4: @ 80D35B4
	push {lr}
	ldr r0, _080D35EC @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r2, 0
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bls _080D35E6
	bl sub_80D3E60
	ldr r0, _080D35F0 @ =sub_80D33EC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D35E6:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D35EC: .4byte gUnknown_2039A2C
_080D35F0: .4byte sub_80D33EC
	thumb_func_end sub_80D35B4

	thumb_func_start sub_80D35F4
sub_80D35F4: @ 80D35F4
	push {r4,r5,lr}
	ldr r5, _080D3668 @ =0x040000b0
	ldrh r1, [r5, 0xA]
	ldr r0, _080D366C @ =0x0000c5ff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r1, [r5, 0xA]
	ldr r0, _080D3670 @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0xA]
	bl sub_80D3DF4
	ldr r4, _080D3674 @ =gUnknown_2039A2C
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x6]
	movs r0, 0x44
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D3654
	ldr r1, _080D3678 @ =0x040000d4
	ldr r0, _080D367C @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D3680 @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D3654:
	ldr r0, _080D3684 @ =gScanlineEffectRegBuffers + 0x8C0
	str r0, [r5]
	ldr r0, _080D3688 @ =0x04000040
	str r0, [r5, 0x4]
	ldr r0, _080D368C @ =0xa2400001
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3668: .4byte 0x040000b0
_080D366C: .4byte 0x0000c5ff
_080D3670: .4byte 0x00007fff
_080D3674: .4byte gUnknown_2039A2C
_080D3678: .4byte 0x040000d4
_080D367C: .4byte gScanlineEffectRegBuffers
_080D3680: .4byte 0x80000140
_080D3684: .4byte gScanlineEffectRegBuffers + 0x8C0
_080D3688: .4byte 0x04000040
_080D368C: .4byte 0xa2400001
	thumb_func_end sub_80D35F4

	thumb_func_start sub_80D3690
sub_80D3690: @ 80D3690
	push {r4,lr}
	bl sub_80D3DF4
	ldr r4, _080D36DC @ =gUnknown_2039A2C
	ldr r0, [r4]
	ldrh r1, [r0, 0x12]
	movs r0, 0x54
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	movs r0, 0x50
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x6]
	movs r0, 0x40
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D36DC: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D3690

	thumb_func_start sub_80D36E0
sub_80D36E0: @ 80D36E0
	push {lr}
	sub sp, 0x4
	mov r1, sp
	ldr r0, _080D3714 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0xE3
	bne _080D36F8
	movs r0, 0
	strh r0, [r1]
_080D36F8:
	ldr r2, _080D3718 @ =0x04000054
	ldr r1, _080D371C @ =gScanlineEffectRegBuffers
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r1, r3
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080D3714: .4byte 0x04000006
_080D3718: .4byte 0x04000054
_080D371C: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_80D36E0

	thumb_func_start sub_80D3720
sub_80D3720: @ 80D3720
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x38]
	movs r2, 0x38
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080D374C
	subs r0, r1, 0x1
	strh r0, [r3, 0x38]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080D380A
	ldr r0, _080D3748 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, 0x1
	strb r0, [r1]
	b _080D380A
	.align 2, 0
_080D3748: .4byte gUnknown_2039A2C
_080D374C:
	movs r2, 0x22
	ldrsh r0, [r3, r2]
	lsls r0, 1
	ldr r1, _080D3810 @ =gScanlineEffectRegBuffers
	adds r7, r0, r1
	movs r2, 0xA0
	lsls r2, 1
	adds r1, r2
	adds r6, r0, r1
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	movs r5, 0x1B
	cmp r0, 0
	beq _080D376A
	movs r5, 0x19
_080D376A:
	movs r4, 0
	cmp r4, r5
	bcs _080D3790
_080D3770:
	lsls r1, r4, 1
	adds r2, r1, r7
	ldrh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r3, 0x20]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _080D3770
_080D3790:
	movs r2, 0x20
	ldrsh r0, [r3, r2]
	ldrh r2, [r3, 0x20]
	cmp r0, 0
	bne _080D37AA
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _080D37AA
	movs r0, 0x1
	strh r0, [r3, 0x30]
_080D37AA:
	adds r1, r2, 0
	subs r1, 0x18
	strh r1, [r3, 0x20]
	ldrh r0, [r3, 0x2E]
	adds r0, 0xC0
	strh r0, [r3, 0x2E]
	lsls r1, 16
	cmp r1, 0
	bge _080D37C0
	movs r0, 0
	strh r0, [r3, 0x20]
_080D37C0:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 5
	cmp r0, r1
	ble _080D37CE
	strh r1, [r3, 0x2E]
_080D37CE:
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080D37E0
	ldr r0, _080D3814 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, 0x1
	strb r0, [r1]
_080D37E0:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080D380A
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	ldr r1, _080D3814 @ =gUnknown_2039A2C
	cmp r0, 0
	beq _080D37FC
	ldr r0, [r1]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	cmp r0, 0x4
	ble _080D380A
_080D37FC:
	ldr r1, [r1]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	adds r0, r3, 0
	bl DestroySprite
_080D380A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3810: .4byte gScanlineEffectRegBuffers
_080D3814: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D3720

	thumb_func_start sub_80D3818
sub_80D3818: @ 80D3818
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D3848 @ =gUnknown_83FA514
	ldr r2, _080D384C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D382A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D382A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3848: .4byte gUnknown_83FA514
_080D384C: .4byte gTasks
	thumb_func_end sub_80D3818

	thumb_func_start Phase2_Transition_GridSquares_Func1
Phase2_Transition_GridSquares_Func1: @ 80D3850
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_80D3E28
	ldr r0, _080D3898 @ =gUnknown_83FA140
	ldr r1, [sp, 0x8]
	movs r2, 0x10
	bl CpuSet
	mov r1, sp
	movs r2, 0xF0
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _080D389C @ =0x01000400
	mov r0, sp
	bl CpuSet
	ldr r0, _080D38A0 @ =gUnknown_83FA638
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D3898: .4byte gUnknown_83FA140
_080D389C: .4byte 0x01000400
_080D38A0: .4byte gUnknown_83FA638
	thumb_func_end Phase2_Transition_GridSquares_Func1

	thumb_func_start Phase2_Transition_GridSquares_Func2
Phase2_Transition_GridSquares_Func2: @ 80D38A4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D38E6
	mov r0, sp
	bl sub_80D3E08
	movs r0, 0x3
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 5
	ldr r1, _080D38F8 @ =gUnknown_83FA140
	adds r0, r1
	ldr r1, [sp]
	movs r2, 0x10
	bl CpuSet
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xD
	ble _080D38E6
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_080D38E6:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D38F8: .4byte gUnknown_83FA140
	thumb_func_end Phase2_Transition_GridSquares_Func2

	thumb_func_start Phase2_Transition_GridSquares_Func3
Phase2_Transition_GridSquares_Func3: @ 80D38FC
	push {lr}
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	lsls r1, 16
	cmp r1, 0
	bne _080D391C
	bl sub_80D3E60
	ldr r0, _080D3924 @ =sub_80D3818
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080D391C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080D3924: .4byte sub_80D3818
	thumb_func_end Phase2_Transition_GridSquares_Func3

	thumb_func_start sub_80D3928
sub_80D3928: @ 80D3928
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D3958 @ =gUnknown_83FA520
	ldr r2, _080D395C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D393A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D393A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3958: .4byte gUnknown_83FA520
_080D395C: .4byte gTasks
	thumb_func_end sub_80D3928

	thumb_func_start sub_80D3960
sub_80D3960: @ 80D3960
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80D3DD0
	bl ScanlineEffect_Clear
	ldr r0, _080D39B8 @ =gUnknown_2039A2C
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _080D39BC @ =gScanlineEffectRegBuffers
	movs r3, 0xF0
	adds r4, r2, 0
_080D3984:
	lsls r0, r1, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _080D3984
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xA0
	bl CpuSet
	ldr r0, _080D39C0 @ =sub_80D3BA4
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D39B8: .4byte gUnknown_2039A2C
_080D39BC: .4byte gScanlineEffectRegBuffers
_080D39C0: .4byte sub_80D3BA4
	thumb_func_end sub_80D3960

	thumb_func_start sub_80D39C4
sub_80D39C4: @ 80D39C4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r8, r0
	ldr r0, _080D3A38 @ =gUnknown_2039A2C
	ldr r0, [r0]
	adds r0, 0x24
	ldr r6, _080D3A3C @ =gUnknown_83FA534
	mov r2, r8
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 1
	adds r1, r4, r6
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r2, r6, 0x2
	adds r2, r4, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r3, r6, 0x4
	adds r3, r4, r3
	movs r5, 0
	ldrsh r3, [r3, r5]
	adds r5, r6, 0x6
	adds r4, r5
	movs r5, 0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	bl sub_80D4088
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r0, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r6, 0x8
	adds r0, r6
	ldrh r0, [r0]
	mov r3, r8
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	movs r0, 0x1
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D3A38: .4byte gUnknown_2039A2C
_080D3A3C: .4byte gUnknown_83FA534
	thumb_func_end sub_80D39C4

	thumb_func_start sub_80D3A40
sub_80D3A40: @ 80D3A40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	ldr r0, _080D3A90 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	mov r8, r0
	movs r7, 0
	ldr r0, _080D3A94 @ =gScanlineEffectRegBuffers
	mov r9, r0
_080D3A5C:
	ldr r1, _080D3A94 @ =gScanlineEffectRegBuffers
	ldr r0, _080D3A90 @ =gUnknown_2039A2C
	ldr r2, [r0]
	movs r3, 0x2A
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, 8
	movs r5, 0xFF
	ands r5, r0
	movs r4, 0xC
	ldrsh r0, [r6, r4]
	cmp r0, 0
	bne _080D3A98
	movs r1, 0x28
	ldrsh r0, [r2, r1]
	cmp r3, r0
	bge _080D3A84
	ldrh r3, [r2, 0x28]
_080D3A84:
	lsls r0, r3, 16
	lsls r1, r5, 16
	cmp r0, r1
	ble _080D3AB0
	lsrs r3, r1, 16
	b _080D3AB0
	.align 2, 0
_080D3A90: .4byte gUnknown_2039A2C
_080D3A94: .4byte gScanlineEffectRegBuffers
_080D3A98:
	lsls r0, r5, 16
	asrs r0, 16
	movs r4, 0x28
	ldrsh r1, [r2, r4]
	cmp r0, r1
	ble _080D3AA6
	ldrh r5, [r2, 0x28]
_080D3AA6:
	lsls r0, r5, 16
	lsls r1, r3, 16
	cmp r0, r1
	bgt _080D3AB0
	lsrs r5, r1, 16
_080D3AB0:
	ldr r0, _080D3AD4 @ =gUnknown_2039A2C
	ldr r4, [r0]
	movs r0, 0x2A
	ldrsh r2, [r4, r0]
	lsls r2, 1
	add r2, r9
	lsls r1, r3, 16
	asrs r1, 8
	lsls r0, r5, 16
	asrs r0, 16
	orrs r0, r1
	strh r0, [r2]
	cmp r7, 0
	beq _080D3AD8
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _080D3AFC
	.align 2, 0
_080D3AD4: .4byte gUnknown_2039A2C
_080D3AD8:
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_80D4104
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, r8
	lsls r0, r1, 16
	movs r3, 0x80
	lsls r3, 9
	adds r0, r3
	lsrs r4, r0, 16
	mov r8, r4
	asrs r0, 16
	cmp r0, 0xF
	ble _080D3A5C
_080D3AFC:
	ldr r0, _080D3B18 @ =gUnknown_2039A2C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D3B18: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D3A40

	thumb_func_start sub_80D3B1C
sub_80D3B1C: @ 80D3B1C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080D3B68
	ldr r1, _080D3B58 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _080D3B5C @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080D3B60 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_80D3E60
	ldr r0, _080D3B64 @ =sub_80D3928
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	b _080D3B80
	.align 2, 0
_080D3B58: .4byte 0x040000b0
_080D3B5C: .4byte 0x0000c5ff
_080D3B60: .4byte 0x00007fff
_080D3B64: .4byte sub_80D3928
_080D3B68:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _080D3B84 @ =gUnknown_83FA57A
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	movs r0, 0x1
_080D3B80:
	pop {r1}
	bx r1
	.align 2, 0
_080D3B84: .4byte gUnknown_83FA57A
	thumb_func_end sub_80D3B1C

	thumb_func_start sub_80D3B88
sub_80D3B88: @ 80D3B88
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	cmp r0, 0
	beq _080D3B9C
	movs r0, 0
	b _080D3BA0
_080D3B9C:
	movs r0, 0x1
	strh r0, [r1, 0x8]
_080D3BA0:
	pop {r1}
	bx r1
	thumb_func_end sub_80D3B88

	thumb_func_start sub_80D3BA4
sub_80D3BA4: @ 80D3BA4
	push {r4,r5,lr}
	ldr r5, _080D3C1C @ =0x040000b0
	ldrh r1, [r5, 0xA]
	ldr r0, _080D3C20 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r1, [r5, 0xA]
	ldr r0, _080D3C24 @ =0x00007fff
	ands r0, r1
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0xA]
	bl sub_80D3DF4
	ldr r4, _080D3C28 @ =gUnknown_2039A2C
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080D3BDC
	ldr r1, _080D3C2C @ =0x040000d4
	ldr r0, _080D3C30 @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080D3C34 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080D3BDC:
	ldr r0, [r4]
	ldrh r1, [r0, 0x2]
	movs r0, 0x48
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x4]
	movs r0, 0x4A
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, 0x8]
	movs r0, 0x44
	bl SetGpuReg
	ldr r4, _080D3C30 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r4, r0
	ldrh r1, [r4]
	movs r0, 0x40
	bl SetGpuReg
	str r4, [r5]
	ldr r0, _080D3C38 @ =0x04000040
	str r0, [r5, 0x4]
	ldr r0, _080D3C3C @ =0xa2400001
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3C1C: .4byte 0x040000b0
_080D3C20: .4byte 0x0000c5ff
_080D3C24: .4byte 0x00007fff
_080D3C28: .4byte gUnknown_2039A2C
_080D3C2C: .4byte 0x040000d4
_080D3C30: .4byte gScanlineEffectRegBuffers
_080D3C34: .4byte 0x800000a0
_080D3C38: .4byte 0x04000040
_080D3C3C: .4byte 0xa2400001
	thumb_func_end sub_80D3BA4

	thumb_func_start CreatePhase1Task
CreatePhase1Task: @ 80D3C40
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x18]
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _080D3C9C @ =sub_80D3CC4
	movs r1, 0x3
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D3CA0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, r8
	strh r0, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r6, [r1, 0x10]
	ldr r3, [sp]
	strh r3, [r1, 0x12]
	strh r0, [r1, 0x14]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D3C9C: .4byte sub_80D3CC4
_080D3CA0: .4byte gTasks
	thumb_func_end CreatePhase1Task

	thumb_func_start sub_80D3CA4
sub_80D3CA4: @ 80D3CA4
	push {lr}
	ldr r0, _080D3CB8 @ =sub_80D3CC4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080D3CBC
	movs r0, 0
	b _080D3CBE
	.align 2, 0
_080D3CB8: .4byte sub_80D3CC4
_080D3CBC:
	movs r0, 0x1
_080D3CBE:
	pop {r1}
	bx r1
	thumb_func_end sub_80D3CA4

	thumb_func_start sub_80D3CC4
sub_80D3CC4: @ 80D3CC4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080D3CF4 @ =gUnknown_83FA588
	ldr r2, _080D3CF8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080D3CD6:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080D3CD6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3CF4: .4byte gUnknown_83FA588
_080D3CF8: .4byte gTasks
	thumb_func_end sub_80D3CC4

	thumb_func_start Phase1_TransitionAll_Func1
Phase1_TransitionAll_Func1: @ 80D3CFC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080D3D14
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080D3D38
_080D3D14:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D3D2C
	movs r0, 0x10
	strh r0, [r4, 0x16]
_080D3D2C:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _080D3D54 @ =0x00002d6b
	bl BlendPalettes
_080D3D38:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	ble _080D3D4A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
_080D3D4A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D3D54: .4byte 0x00002d6b
	thumb_func_end Phase1_TransitionAll_Func1

	thumb_func_start Phase1_TransitionAll_Func2
Phase1_TransitionAll_Func2: @ 80D3D58
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080D3D70
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080D3D92
_080D3D70:
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	bge _080D3D86
	movs r0, 0
	strh r0, [r4, 0x16]
_080D3D86:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _080D3DB8 @ =0x00002d6b
	bl BlendPalettes
_080D3D92:
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080D3DC6
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080D3DC0
	ldr r0, _080D3DBC @ =sub_80D3CC4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _080D3DC6
	.align 2, 0
_080D3DB8: .4byte 0x00002d6b
_080D3DBC: .4byte sub_80D3CC4
_080D3DC0:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x8]
_080D3DC6:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Phase1_TransitionAll_Func2

	thumb_func_start sub_80D3DD0
sub_80D3DD0: @ 80D3DD0
	push {r4,lr}
	ldr r4, _080D3DF0 @ =gUnknown_2039A2C
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x3C
	bl memset
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x14
	adds r1, 0x16
	bl sub_805A658
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3DF0: .4byte gUnknown_2039A2C
	thumb_func_end sub_80D3DD0

	thumb_func_start sub_80D3DF4
sub_80D3DF4: @ 80D3DF4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80D3DF4

	thumb_func_start sub_80D3E08
sub_80D3E08: @ 80D3E08
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x8
	bl GetGpuReg
	lsls r0, 16
	lsrs r0, 18
	lsls r0, 30
	lsrs r0, 16
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D3E08

	thumb_func_start sub_80D3E28
sub_80D3E28: @ 80D3E28
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0x8
	bl GetGpuReg
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 24
	movs r0, 0x1F
	ands r4, r0
	movs r0, 0x8
	bl GetGpuReg
	lsls r0, 16
	lsrs r0, 18
	lsls r4, 11
	lsls r0, 30
	lsrs r0, 16
	movs r1, 0xC0
	lsls r1, 19
	adds r4, r1
	str r4, [r5]
	adds r0, r1
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D3E28

	thumb_func_start sub_80D3E60
sub_80D3E60: @ 80D3E60
	push {lr}
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	pop {r0}
	bx r0
	thumb_func_end sub_80D3E60

	thumb_func_start sub_80D3E74
sub_80D3E74: @ 80D3E74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	ldr r0, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r4, 16
	movs r6, 0
	lsrs r5, r4, 16
	cmp r4, 0
	ble _080D3EDC
	lsls r0, r7, 16
	asrs r0, 16
	mov r9, r0
	lsls r1, 16
	mov r8, r1
	lsls r0, r3, 16
	asrs r7, r0, 16
_080D3EAC:
	lsls r4, r2, 16
	asrs r4, 16
	movs r0, 0xFF
	ands r0, r4
	mov r2, r8
	asrs r1, r2, 16
	bl Sin
	lsls r1, r6, 1
	add r1, r10
	add r0, r9
	strh r0, [r1]
	lsls r1, r5, 16
	ldr r0, _080D3EEC @ =0xffff0000
	adds r1, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r7
	lsls r4, 16
	lsrs r2, r4, 16
	lsrs r5, r1, 16
	cmp r1, 0
	bgt _080D3EAC
_080D3EDC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3EEC: .4byte 0xffff0000
	thumb_func_end sub_80D3E74

	thumb_func_start sub_80D3EF0
sub_80D3EF0: @ 80D3EF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	adds r5, r2, 0
	adds r4, r3, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r2, 0xA0
	lsls r2, 1
	movs r1, 0xA
	bl memset
	movs r1, 0
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
_080D3F28:
	lsls r5, r1, 16
	asrs r0, r5, 16
	mov r10, r0
	ldr r1, [sp, 0x4]
	bl Sin
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r10
	ldr r1, [sp, 0x4]
	bl Cos
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, 16
	asrs r4, 16
	subs r2, r1, r4
	lsls r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 16
	asrs r0, 16
	ldr r3, [sp, 0x8]
	subs r1, r3, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r3, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r1, r2, 16
	str r5, [sp, 0x10]
	cmp r2, 0
	bge _080D3F74
	movs r1, 0
_080D3F74:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _080D3F7E
	movs r6, 0xF0
_080D3F7E:
	lsls r0, r7, 16
	cmp r0, 0
	bge _080D3F86
	movs r7, 0
_080D3F86:
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _080D3F94
	movs r3, 0x9F
	mov r8, r3
_080D3F94:
	lsls r0, r1, 24
	lsrs r0, 16
	orrs r6, r0
	lsls r0, r7, 16
	asrs r0, 16
	str r0, [sp, 0xC]
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r4, 15
	add r0, r9
	strh r6, [r0]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	ldr r1, [sp, 0x4]
	bl Cos
	lsls r0, 16
	asrs r0, 16
	ldr r2, [sp, 0x8]
	subs r1, r2, r0
	lsls r1, 16
	adds r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r3, r1, 16
	cmp r1, 0
	bge _080D3FD6
	movs r3, 0
_080D3FD6:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _080D3FE0
	movs r2, 0x9F
_080D3FE0:
	lsls r0, r3, 16
	asrs r1, r0, 16
	adds r3, r0, 0
	lsls r5, r2, 16
	ldr r0, [sp, 0xC]
	cmp r0, r1
	ble _080D4004
	adds r2, r1, 0
_080D3FF0:
	lsls r1, r7, 16
	ldr r0, _080D4084 @ =0xffff0000
	adds r1, r0
	asrs r0, r1, 15
	add r0, r9
	strh r6, [r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _080D3FF0
_080D4004:
	lsls r1, r7, 16
	asrs r0, r3, 16
	cmp r1, r3
	bge _080D4022
	adds r2, r0, 0
_080D400E:
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, r3
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r1, r0, 0
	asrs r0, r1, 16
	cmp r0, r2
	blt _080D400E
_080D4022:
	asrs r0, r5, 16
	cmp r4, r5
	ble _080D4040
	adds r1, r0, 0
_080D402A:
	ldr r2, _080D4084 @ =0xffff0000
	adds r0, r4, r2
	lsrs r3, r0, 16
	mov r8, r3
	asrs r0, 15
	add r0, r9
	strh r6, [r0]
	lsls r4, r3, 16
	asrs r0, r4, 16
	cmp r0, r1
	bgt _080D402A
_080D4040:
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r5, 16
	cmp r4, r5
	bge _080D4060
	adds r2, r0, 0
_080D404C:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r4, r0, 0
	asrs r0, r4, 16
	cmp r0, r2
	blt _080D404C
_080D4060:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	bgt _080D4072
	b _080D3F28
_080D4072:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4084: .4byte 0xffff0000
	thumb_func_end sub_80D3EF0

	thumb_func_start sub_80D4088
sub_80D4088: @ 80D4088
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r0, 16
	adds r7, r0, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	strh r1, [r6]
	strh r2, [r6, 0x2]
	strh r1, [r6, 0x4]
	strh r2, [r6, 0x6]
	strh r3, [r6, 0x8]
	strh r7, [r6, 0xA]
	strh r5, [r6, 0xC]
	strh r4, [r6, 0xE]
	lsls r3, 16
	asrs r3, 16
	lsls r1, 16
	asrs r1, 16
	subs r3, r1
	strh r3, [r6, 0x10]
	lsls r0, r3, 16
	cmp r0, 0
	bge _080D40DA
	negs r0, r3
	strh r0, [r6, 0x10]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xC]
_080D40DA:
	lsls r0, r7, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, r0, r1
	strh r1, [r6, 0x12]
	lsls r0, r1, 16
	cmp r0, 0
	bge _080D40F8
	negs r0, r1
	strh r0, [r6, 0x12]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xE]
_080D40F8:
	movs r0, 0
	strh r0, [r6, 0x14]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4088

	thumb_func_start sub_80D4104
sub_80D4104: @ 80D4104
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldrh r0, [r3, 0x10]
	mov r8, r0
	movs r1, 0x10
	ldrsh r6, [r3, r1]
	ldrh r2, [r3, 0x12]
	mov r12, r2
	movs r4, 0x12
	ldrsh r5, [r3, r4]
	cmp r6, r5
	ble _080D4154
	ldrh r0, [r3, 0xC]
	ldrh r2, [r3, 0x4]
	adds r1, r0, r2
	strh r1, [r3, 0x4]
	ldrh r2, [r3, 0x14]
	add r2, r12
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	adds r4, r0, 0
	ldrh r7, [r3, 0xE]
	cmp r1, r6
	ble _080D417A
	ldrh r1, [r3, 0x6]
	adds r0, r7, r1
	strh r0, [r3, 0x6]
	mov r1, r8
	b _080D4176
_080D4154:
	ldrh r0, [r3, 0xE]
	ldrh r2, [r3, 0x6]
	adds r1, r0, r2
	strh r1, [r3, 0x6]
	ldrh r2, [r3, 0x14]
	add r2, r8
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r4, [r3, 0xC]
	adds r7, r0, 0
	cmp r1, r5
	ble _080D417A
	ldrh r1, [r3, 0x4]
	adds r0, r4, r1
	strh r0, [r3, 0x4]
	mov r1, r12
_080D4176:
	subs r0, r2, r1
	strh r0, [r3, 0x14]
_080D417A:
	movs r5, 0
	lsls r0, r4, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _080D4192
	movs r4, 0x4
	ldrsh r1, [r3, r4]
	movs r4, 0x8
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bge _080D41A4
_080D4192:
	cmp r2, 0
	bge _080D41B2
	movs r0, 0x4
	ldrsh r1, [r3, r0]
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bgt _080D41B2
_080D41A4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	cmp r0, 0
	beq _080D41B2
	strh r4, [r3, 0x4]
_080D41B2:
	lsls r0, r7, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _080D41C8
	movs r4, 0x6
	ldrsh r1, [r3, r4]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bge _080D41DA
_080D41C8:
	cmp r2, 0
	bge _080D41E8
	movs r0, 0x6
	ldrsh r1, [r3, r0]
	movs r2, 0xA
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bgt _080D41E8
_080D41DA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r10
	cmp r0, 0
	beq _080D41E8
	strh r4, [r3, 0x6]
_080D41E8:
	cmp r5, 0x2
	beq _080D41F0
	movs r0, 0
	b _080D41F2
_080D41F0:
	movs r0, 0x1
_080D41F2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80D4104

	.align 2, 0 @ Don't pad with nop.
