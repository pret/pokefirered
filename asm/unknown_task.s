	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start remove_some_task
remove_some_task: @ 8087E64
	push {r4,lr}
	ldr r4, _08087E94 @ =gUnknown_2039600
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _08087E98 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _08087E9C @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _08087EA0 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x18]
	cmp r0, 0xFF
	beq _08087E8E
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r4, 0x18]
_08087E8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E94: .4byte gUnknown_2039600
_08087E98: .4byte 0x040000b0
_08087E9C: .4byte 0x0000c5ff
_08087EA0: .4byte 0x00007fff
	thumb_func_end remove_some_task

	thumb_func_start dp12_8087EA4
dp12_8087EA4: @ 8087EA4
	push {r4,lr}
	sub sp, 0x4
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r1, _08087ED8 @ =gUnknown_2038700
	ldr r2, _08087EDC @ =0x01000780
	bl CpuSet
	ldr r0, _08087EE0 @ =gUnknown_2039600
	movs r1, 0
	str r1, [r0]
	str r1, [r0, 0x4]
	str r1, [r0, 0x8]
	str r1, [r0, 0xC]
	strb r4, [r0, 0x14]
	strb r4, [r0, 0x15]
	strb r4, [r0, 0x16]
	strb r4, [r0, 0x17]
	movs r1, 0xFF
	strb r1, [r0, 0x18]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087ED8: .4byte gUnknown_2038700
_08087EDC: .4byte 0x01000780
_08087EE0: .4byte gUnknown_2039600
	thumb_func_end dp12_8087EA4

	thumb_func_start sub_8087EE4
sub_8087EE4: @ 8087EE4
	push {lr}
	sub sp, 0xC
	str r0, [sp]
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	ldr r0, _08087F08 @ =0xa2600001
	cmp r1, r0
	bne _08087F18
	ldr r0, _08087F0C @ =gUnknown_2039600
	ldr r1, _08087F10 @ =gUnknown_2038702
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08087F14 @ =sub_8087FE0
	b _08087F28
	.align 2, 0
_08087F08: .4byte 0xa2600001
_08087F0C: .4byte gUnknown_2039600
_08087F10: .4byte gUnknown_2038702
_08087F14: .4byte sub_8087FE0
_08087F18:
	ldr r0, _08087F48 @ =gUnknown_2039600
	ldr r1, _08087F4C @ =gUnknown_2038704
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08087F50 @ =sub_8088000
_08087F28:
	str r1, [r0, 0x10]
	adds r1, r0, 0
	ldr r0, [sp, 0x4]
	str r0, [r1, 0xC]
	ldr r0, [sp]
	str r0, [r1, 0x8]
	mov r0, sp
	ldrb r0, [r0, 0x8]
	strb r0, [r1, 0x15]
	mov r0, sp
	ldrb r0, [r0, 0x9]
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08087F48: .4byte gUnknown_2039600
_08087F4C: .4byte gUnknown_2038704
_08087F50: .4byte sub_8088000
	thumb_func_end sub_8087EE4

	thumb_func_start sub_8087F54
sub_8087F54: @ 8087F54
	push {r4,lr}
	ldr r4, _08087F84 @ =gUnknown_2039600
	ldrb r0, [r4, 0x15]
	cmp r0, 0
	beq _08087FCE
	cmp r0, 0x3
	bne _08087F98
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _08087F88 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _08087F8C @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _08087F90 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r1, _08087F94 @ =gUnknown_203961C
	movs r0, 0x1
	strb r0, [r1]
	b _08087FCE
	.align 2, 0
_08087F84: .4byte gUnknown_2039600
_08087F88: .4byte 0x040000b0
_08087F8C: .4byte 0x0000c5ff
_08087F90: .4byte 0x00007fff
_08087F94: .4byte gUnknown_203961C
_08087F98:
	ldr r1, _08087FD4 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _08087FD8 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _08087FDC @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x14]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, 0x8]
	str r0, [r1, 0x4]
	ldr r0, [r4, 0xC]
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, [r4, 0x10]
	bl _call_via_r0
	ldrb r0, [r4, 0x14]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4, 0x14]
_08087FCE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087FD4: .4byte 0x040000b0
_08087FD8: .4byte 0x0000c5ff
_08087FDC: .4byte 0x00007fff
	thumb_func_end sub_8087F54

	thumb_func_start sub_8087FE0
sub_8087FE0: @ 8087FE0
	ldr r0, _08087FF8 @ =gUnknown_2039600
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08087FFC @ =gUnknown_2038700
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087FF8: .4byte gUnknown_2039600
_08087FFC: .4byte gUnknown_2038700
	thumb_func_end sub_8087FE0

	thumb_func_start sub_8088000
sub_8088000: @ 8088000
	ldr r0, _08088018 @ =gUnknown_2039600
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _0808801C @ =gUnknown_2038700
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_08088018: .4byte gUnknown_2039600
_0808801C: .4byte gUnknown_2038700
	thumb_func_end sub_8088000

	thumb_func_start task00_for_dp12
task00_for_dp12: @ 8088020
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r6, 0
	ldr r0, _08088048 @ =gUnknown_203961C
	ldrb r0, [r0]
	cmp r0, 0
	beq _08088050
	mov r0, r12
	bl DestroyTask
	ldr r1, _0808804C @ =gUnknown_2039600
	movs r0, 0xFF
	strb r0, [r1, 0x18]
	b _080881D0
	.align 2, 0
_08088048: .4byte gUnknown_203961C
_0808804C: .4byte gUnknown_2039600
_08088050:
	ldr r1, _0808807C @ =gTasks
	mov r0, r12
	lsls r2, r0, 2
	adds r0, r2, r0
	lsls r0, 3
	adds r3, r0, r1
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	mov r10, r1
	mov r9, r2
	cmp r0, 0
	beq _080880FC
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	cmp r0, 0xE
	bhi _080880FC
	lsls r0, 2
	ldr r1, _08088080 @ =_08088084
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808807C: .4byte gTasks
_08088080: .4byte _08088084
	.align 2, 0
_08088084:
	.4byte _080880C0
	.4byte _080880FC
	.4byte _080880C8
	.4byte _080880FC
	.4byte _080880D0
	.4byte _080880FC
	.4byte _080880D8
	.4byte _080880FC
	.4byte _080880E0
	.4byte _080880FC
	.4byte _080880E8
	.4byte _080880FC
	.4byte _080880F0
	.4byte _080880FC
	.4byte _080880F8
_080880C0:
	ldr r0, _080880C4 @ =gUnknown_2022974
	b _080880FA
	.align 2, 0
_080880C4: .4byte gUnknown_2022974
_080880C8:
	ldr r0, _080880CC @ =gUnknown_2022976
	b _080880FA
	.align 2, 0
_080880CC: .4byte gUnknown_2022976
_080880D0:
	ldr r0, _080880D4 @ =gUnknown_2022978
	b _080880FA
	.align 2, 0
_080880D4: .4byte gUnknown_2022978
_080880D8:
	ldr r0, _080880DC @ =gUnknown_202297A
	b _080880FA
	.align 2, 0
_080880DC: .4byte gUnknown_202297A
_080880E0:
	ldr r0, _080880E4 @ =gUnknown_202297C
	b _080880FA
	.align 2, 0
_080880E4: .4byte gUnknown_202297C
_080880E8:
	ldr r0, _080880EC @ =gUnknown_202297E
	b _080880FA
	.align 2, 0
_080880EC: .4byte gUnknown_202297E
_080880F0:
	ldr r0, _080880F4 @ =gUnknown_2022980
	b _080880FA
	.align 2, 0
_080880F4: .4byte gUnknown_2022980
_080880F8:
	ldr r0, _0808815C @ =gUnknown_2022982
_080880FA:
	ldrh r6, [r0]
_080880FC:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r2, r10
	adds r1, r0, r2
	ldrh r2, [r1, 0x10]
	movs r3, 0x10
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08088168
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	movs r4, 0xE
	ldrsh r0, [r1, r4]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080881D0
	ldr r5, _08088160 @ =gUnknown_2038700
	ldr r0, _08088164 @ =gUnknown_2039600
	mov r8, r0
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
_08088136:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _08088136
	b _080881D0
	.align 2, 0
_0808815C: .4byte gUnknown_2022982
_08088160: .4byte gUnknown_2038700
_08088164: .4byte gUnknown_2039600
_08088168:
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x10]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080881B0
	ldr r5, _080881E0 @ =gUnknown_2038700
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
	ldr r0, _080881E4 @ =gUnknown_2039600
	mov r8, r0
_0808818E:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _0808818E
_080881B0:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r3, r10
	adds r2, r0, r3
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bne _080881D0
	movs r0, 0
	strh r0, [r2, 0xE]
_080881D0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080881E0: .4byte gUnknown_2038700
_080881E4: .4byte gUnknown_2039600
	thumb_func_end task00_for_dp12

	thumb_func_start sub_80881E8
sub_80881E8: @ 80881E8
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r1, 0
	movs r2, 0
	ldr r0, _0808822C @ =gUnknown_825E074
	mov r12, r0
_080881FC:
	lsls r0, r1, 1
	adds r3, r0, r6
	lsls r0, r2, 1
	add r0, r12
	movs r7, 0
	ldrsh r0, [r0, r7]
	muls r0, r4
	cmp r0, 0
	bge _08088210
	adds r0, 0xFF
_08088210:
	asrs r0, 8
	strh r0, [r3]
	adds r0, r2, r5
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _080881FC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808822C: .4byte gUnknown_825E074
	thumb_func_end sub_80881E8

	thumb_func_start sub_8088230
sub_8088230: @ 8088230
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r5, r0, 0
	str r1, [sp, 0x10]
	ldr r0, [sp, 0x40]
	mov r8, r0
	ldr r1, [sp, 0x44]
	mov r9, r1
	ldr r0, [sp, 0x48]
	mov r10, r0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, [sp, 0x10]
	lsls r1, 24
	str r1, [sp, 0x14]
	lsrs r0, r1, 24
	str r0, [sp, 0xC]
	lsls r1, r2, 24
	lsrs r1, 24
	str r1, [sp, 0x18]
	lsls r2, r3, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r3, r9
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl dp12_8087EA4
	ldr r0, _0808833C @ =0x04000010
	add r0, r9
	str r0, [sp]
	ldr r0, _08088340 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_8087EE4
	ldr r0, _08088344 @ =task00_for_dp12
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08088348 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	strh r5, [r4, 0x8]
	mov r3, sp
	ldrh r3, [r3, 0xC]
	strh r3, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ldr r1, [sp, 0x18]
	bl __divsi3
	strh r0, [r4, 0xC]
	movs r0, 0
	strh r0, [r4, 0xE]
	mov r1, r8
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x12]
	mov r3, r9
	strh r3, [r4, 0x14]
	mov r0, r10
	strh r0, [r4, 0x16]
	ldr r0, _0808834C @ =gUnknown_2039600
	strb r7, [r0, 0x18]
	ldr r0, _08088350 @ =gUnknown_203961C
	movs r1, 0
	strb r1, [r0]
	ldr r4, _08088354 @ =gUnknown_2038980
	ldr r3, [sp, 0xC]
	subs r6, r3, r5
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r4, 0
	ldr r1, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	bl sub_80881E8
	ldr r0, [sp, 0xC]
	cmp r5, r0
	bge _0808832A
	ldr r1, _08088358 @ =0xfffffd80
	adds r2, r4, r1
	lsls r1, r5, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r1, r3
	adds r3, r0, r2
	adds r1, r2
	adds r2, r4, 0
	adds r5, r6, 0
_08088316:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, 0x2
	adds r3, 0x2
	adds r1, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _08088316
_0808832A:
	adds r0, r7, 0
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808833C: .4byte 0x04000010
_08088340: .4byte 0xa2600001
_08088344: .4byte task00_for_dp12
_08088348: .4byte gTasks
_0808834C: .4byte gUnknown_2039600
_08088350: .4byte gUnknown_203961C
_08088354: .4byte gUnknown_2038980
_08088358: .4byte 0xfffffd80
	thumb_func_end sub_8088230

	.align 2, 0 @ Don't pad with nop.
