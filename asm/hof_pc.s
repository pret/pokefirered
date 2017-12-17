	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CA53C
sub_80CA53C: @ 80CA53C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA56C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CA564
	bl FreeAllWindowBuffers
	movs r0, 0
	bl sub_8001618
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _080CA570 @ =sub_80F2978
	bl SetMainCallback2
_080CA564:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA56C: .4byte gUnknown_2037AB8
_080CA570: .4byte sub_80F2978
	thumb_func_end sub_80CA53C

	thumb_func_start sub_80CA574
sub_80CA574: @ 80CA574
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl ScriptContext2_Enable
	ldr r0, _080CA59C @ =sub_80CA53C
	movs r1, 0
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080CA59C: .4byte sub_80CA53C
	thumb_func_end sub_80CA574

	thumb_func_start sub_80CA5A0
sub_80CA5A0: @ 80CA5A0
	push {lr}
	ldr r0, _080CA5B4 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _080CA5B8 @ =gUnknown_3005020
	ldr r0, _080CA5BC @ =sub_80CA5C0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080CA5B4: .4byte c2_exit_to_overworld_2_switch
_080CA5B8: .4byte gUnknown_3005020
_080CA5BC: .4byte sub_80CA5C0
	thumb_func_end sub_80CA5A0

	thumb_func_start sub_80CA5C0
sub_80CA5C0: @ 80CA5C0
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl sub_8055DC4
	bl sp109_CreatePCMenu
	bl sub_809D254
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080CA5F4 @ =sub_80CA5F8
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080CA5F4: .4byte sub_80CA5F8
	thumb_func_end sub_80CA5C0

	thumb_func_start sub_80CA5F8
sub_80CA5F8: @ 80CA5F8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CA614 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CA610
	adds r0, r2, 0
	bl DestroyTask
_080CA610:
	pop {r0}
	bx r0
	.align 2, 0
_080CA614: .4byte gUnknown_2037AB8
	thumb_func_end sub_80CA5F8

	.align 2, 0 @ Don't pad with nop.
