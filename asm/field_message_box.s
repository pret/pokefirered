	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8069348
sub_8069348: @ 8069348
	ldr r1, _08069368 @ =gUnknown_203709C
	movs r0, 0
	strb r0, [r1]
	ldr r2, _0806936C @ =gTextFlags
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	movs r1, 0x3
	negs r1, r1
	ands r0, r1
	subs r1, 0x2
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08069368: .4byte gUnknown_203709C
_0806936C: .4byte gTextFlags
	thumb_func_end sub_8069348

	thumb_func_start sub_8069370
sub_8069370: @ 8069370
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08069394 @ =gUnknown_3005090
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080693DA
	cmp r0, 0x1
	bgt _08069398
	cmp r0, 0
	beq _0806939E
	b _08069402
	.align 2, 0
_08069394: .4byte gUnknown_3005090
_08069398:
	cmp r0, 0x2
	beq _080693EA
	b _08069402
_0806939E:
	ldr r0, _080693BC @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080693C4
	ldr r2, _080693C0 @ =gTextFlags
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x80
	lsls r1, 2
	movs r0, 0
	bl sub_814FF98
	b _080693E2
	.align 2, 0
_080693BC: .4byte gUnknown_203ADFA
_080693C0: .4byte gTextFlags
_080693C4:
	bl sub_8069A38
	lsls r0, 24
	cmp r0, 0
	bne _080693D4
	bl sub_80F6E9C
	b _080693E2
_080693D4:
	bl sub_80F79A4
	b _080693E2
_080693DA:
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6EE4
_080693E2:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _08069402
_080693EA:
	bl sub_80F6CBC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08069402
	ldr r1, _08069408 @ =gUnknown_203709C
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_08069402:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069408: .4byte gUnknown_203709C
	thumb_func_end sub_8069370

	thumb_func_start task_add_textbox
task_add_textbox: @ 806940C
	push {lr}
	ldr r0, _0806941C @ =sub_8069370
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0806941C: .4byte sub_8069370
	thumb_func_end task_add_textbox

	thumb_func_start task_del_textbox
task_del_textbox: @ 8069420
	push {lr}
	ldr r0, _08069438 @ =sub_8069370
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08069434
	bl DestroyTask
_08069434:
	pop {r0}
	bx r0
	.align 2, 0
_08069438: .4byte sub_8069370
	thumb_func_end task_del_textbox

	thumb_func_start ShowFieldMessage
ShowFieldMessage: @ 806943C
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08069458 @ =gUnknown_203709C
	ldrb r0, [r4]
	cmp r0, 0
	bne _0806945C
	adds r0, r1, 0
	bl textbox_fdecode_auto_and_task_add
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0x1
	b _0806945E
	.align 2, 0
_08069458: .4byte gUnknown_203709C
_0806945C:
	movs r0, 0
_0806945E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ShowFieldMessage

	thumb_func_start ShowFieldAutoScrollMessage
ShowFieldAutoScrollMessage: @ 8069464
	push {lr}
	adds r1, r0, 0
	ldr r2, _08069480 @ =gUnknown_203709C
	ldrb r0, [r2]
	cmp r0, 0
	bne _08069484
	movs r0, 0x3
	strb r0, [r2]
	adds r0, r1, 0
	bl textbox_fdecode_auto_and_task_add
	movs r0, 0x1
	b _08069486
	.align 2, 0
_08069480: .4byte gUnknown_203709C
_08069484:
	movs r0, 0
_08069486:
	pop {r1}
	bx r1
	thumb_func_end ShowFieldAutoScrollMessage

	thumb_func_start sub_806948C
sub_806948C: @ 806948C
	push {lr}
	ldr r2, _080694A0 @ =gUnknown_203709C
	movs r1, 0x3
	strb r1, [r2]
	bl textbox_fdecode_auto_and_task_add
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080694A0: .4byte gUnknown_203709C
	thumb_func_end sub_806948C

	thumb_func_start sub_80694A4
sub_80694A4: @ 80694A4
	push {lr}
	ldr r1, _080694BC @ =gUnknown_203709C
	ldrb r0, [r1]
	cmp r0, 0
	bne _080694C0
	movs r0, 0x2
	strb r0, [r1]
	bl textbox_auto_and_task_add
	movs r0, 0x1
	b _080694C2
	.align 2, 0
_080694BC: .4byte gUnknown_203709C
_080694C0:
	movs r0, 0
_080694C2:
	pop {r1}
	bx r1
	thumb_func_end sub_80694A4

	thumb_func_start textbox_fdecode_auto_and_task_add
textbox_fdecode_auto_and_task_add: @ 80694C8
	push {lr}
	adds r1, r0, 0
	ldr r0, _080694E0 @ =gStringVar4
	bl StringExpandPlaceholders
	movs r0, 0x1
	bl sub_80F6D5C
	bl task_add_textbox
	pop {r0}
	bx r0
	.align 2, 0
_080694E0: .4byte gStringVar4
	thumb_func_end textbox_fdecode_auto_and_task_add

	thumb_func_start textbox_auto_and_task_add
textbox_auto_and_task_add: @ 80694E4
	push {lr}
	movs r0, 0x1
	bl sub_80F6D5C
	bl task_add_textbox
	pop {r0}
	bx r0
	thumb_func_end textbox_auto_and_task_add

	thumb_func_start HideFieldMessageBox
HideFieldMessageBox: @ 80694F4
	push {lr}
	bl task_del_textbox
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F54
	ldr r1, _0806950C @ =gUnknown_203709C
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806950C: .4byte gUnknown_203709C
	thumb_func_end HideFieldMessageBox

	thumb_func_start textbox_any_visible
textbox_any_visible: @ 8069510
	ldr r0, _08069518 @ =gUnknown_203709C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08069518: .4byte gUnknown_203709C
	thumb_func_end textbox_any_visible

	thumb_func_start IsFieldMessageBoxHidden
IsFieldMessageBoxHidden: @ 806951C
	push {lr}
	ldr r0, _0806952C @ =gUnknown_203709C
	ldrb r0, [r0]
	cmp r0, 0
	beq _08069530
	movs r0, 0
	b _08069532
	.align 2, 0
_0806952C: .4byte gUnknown_203709C
_08069530:
	movs r0, 0x1
_08069532:
	pop {r1}
	bx r1
	thumb_func_end IsFieldMessageBoxHidden

	thumb_func_start sub_8069538
sub_8069538: @ 8069538
	push {lr}
	bl task_del_textbox
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F1C
	ldr r1, _08069550 @ =gUnknown_203709C
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08069550: .4byte gUnknown_203709C
	thumb_func_end sub_8069538

	.align 2, 0 @ Don't pad with nop.
