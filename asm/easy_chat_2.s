	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8101BC0
sub_8101BC0: @ 8101BC0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r6, _08101C38 @ =gUnknown_843F9B8
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08101C3C @ =gUnknown_203ACEC
	ldr r2, [r5]
	movs r1, 0xB7
	lsls r1, 2
	mov r8, r1
	add r2, r8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _08101C40 @ =gSprites
	adds r1, r4
	str r1, [r2]
	movs r0, 0x20
	strh r0, [r1, 0x24]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	movs r1, 0xB8
	lsls r1, 2
	adds r3, r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r3]
	ldr r0, _08101C44 @ =0x0000ffe0
	strh r0, [r1, 0x24]
	add r2, r8
	ldr r1, [r2]
	adds r1, 0x3F
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	bl sub_8101C80
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C38: .4byte gUnknown_843F9B8
_08101C3C: .4byte gUnknown_203ACEC
_08101C40: .4byte gSprites
_08101C44: .4byte 0x0000ffe0
	thumb_func_end sub_8101BC0

	thumb_func_start sub_8101C48
sub_8101C48: @ 8101C48
	push {r4-r6,lr}
	ldr r5, _08101C7C @ =gUnknown_203ACEC
	ldr r0, [r5]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	adds r4, r0, r4
	movs r6, 0
	str r6, [r4]
	movs r4, 0xB8
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	adds r0, r4
	str r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101C48

	thumb_func_start sub_8101C80
sub_8101C80: @ 8101C80
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08101CC8 @ =gUnknown_203ACEC
	ldr r1, [r0]
	movs r2, 0xB7
	lsls r2, 2
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08101CDC
	adds r2, 0x4
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08101CDC
	mov r4, sp
	adds r4, 0x1
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FFE08
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08101CCC
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	bl sub_8101CE4
	b _08101CDC
	.align 2, 0
_08101CC8: .4byte gUnknown_203ACEC
_08101CCC:
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	bl sub_8101D9C
_08101CDC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101C80

	thumb_func_start sub_8101CE4
sub_8101CE4: @ 8101CE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	asrs r5, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08101D48
	ldr r0, _08101D44 @ =gUnknown_203ACEC
	mov r8, r0
	ldr r0, [r0]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r4
	ldr r2, [r4]
	movs r0, 0x54
	muls r5, r0
	adds r5, 0x3A
	strh r5, [r2, 0x20]
	ldr r0, [r4]
	lsls r4, r7, 24
	asrs r4, 20
	adds r4, 0x60
	strh r4, [r0, 0x22]
	movs r6, 0xB8
	lsls r6, 2
	adds r1, r6
	ldr r0, [r1]
	movs r1, 0
	bl StartSpriteAnim
	mov r1, r8
	ldr r0, [r1]
	adds r0, r6
	ldr r1, [r0]
	strh r5, [r1, 0x20]
	b _08101D8A
	.align 2, 0
_08101D44: .4byte gUnknown_203ACEC
_08101D48:
	ldr r6, _08101D98 @ =gUnknown_203ACEC
	ldr r0, [r6]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r6]
	adds r4, r1, r4
	ldr r0, [r4]
	movs r2, 0xD8
	mov r8, r2
	mov r2, r8
	strh r2, [r0, 0x20]
	ldr r0, [r4]
	lsls r4, r7, 24
	asrs r4, 20
	adds r4, 0x70
	strh r4, [r0, 0x22]
	movs r5, 0xB8
	lsls r5, 2
	adds r1, r5
	ldr r0, [r1]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldr r1, [r0]
	mov r2, r8
	strh r2, [r1, 0x20]
_08101D8A:
	ldr r0, [r0]
	strh r4, [r0, 0x22]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101D98: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101CE4

	thumb_func_start sub_8101D9C
sub_8101D9C: @ 8101D9C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsrs r4, r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _08101E2C
	lsls r0, r5, 24
	asrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, 0x60
	mov r8, r0
	movs r7, 0x20
	cmp r2, 0x6
	bne _08101DCE
	cmp r1, 0
	bne _08101DCE
	movs r7, 0x9D
	movs r6, 0x2
	b _08101DE4
_08101DCE:
	ldr r3, _08101E24 @ =gUnknown_843F958
	lsls r1, r4, 24
	lsrs r0, r1, 24
	movs r2, 0
	cmp r0, 0x6
	bhi _08101DDC
	asrs r2, r1, 24
_08101DDC:
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r7, r0
	movs r6, 0x3
_08101DE4:
	ldr r5, _08101E28 @ =gUnknown_203ACEC
	ldr r0, [r5]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	adds r1, r6, 0
	bl StartSpriteAnim
	ldr r1, [r5]
	adds r4, r1, r4
	ldr r0, [r4]
	strh r7, [r0, 0x20]
	ldr r0, [r4]
	mov r2, r8
	strh r2, [r0, 0x22]
	movs r4, 0xB8
	lsls r4, 2
	adds r1, r4
	ldr r0, [r1]
	adds r1, r6, 0
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, r4
	ldr r1, [r0]
	strh r7, [r1, 0x20]
	ldr r0, [r0]
	mov r1, r8
	strh r1, [r0, 0x22]
	b _08101E72
	.align 2, 0
_08101E24: .4byte gUnknown_843F958
_08101E28: .4byte gUnknown_203ACEC
_08101E2C:
	ldr r6, _08101E7C @ =gUnknown_203ACEC
	ldr r0, [r6]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r6]
	adds r4, r1, r4
	ldr r0, [r4]
	movs r2, 0xD8
	mov r8, r2
	mov r2, r8
	strh r2, [r0, 0x20]
	ldr r0, [r4]
	lsls r4, r5, 24
	asrs r4, 20
	adds r4, 0x70
	strh r4, [r0, 0x22]
	movs r5, 0xB8
	lsls r5, 2
	adds r1, r5
	ldr r0, [r1]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldr r1, [r0]
	mov r2, r8
	strh r2, [r1, 0x20]
	ldr r0, [r0]
	strh r4, [r0, 0x22]
_08101E72:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101E7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101D9C

	thumb_func_start sub_8101E80
sub_8101E80: @ 8101E80
	push {lr}
	ldr r0, _08101EC4 @ =gUnknown_843F968
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08101EC8 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r1, 0xB9
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08101ECC @ =gSprites
	adds r1, r0
	str r1, [r2]
	ldr r0, _08101ED0 @ =sub_8101ED4
	str r0, [r1, 0x1C]
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	bl sub_8101F04
	pop {r0}
	bx r0
	.align 2, 0
_08101EC4: .4byte gUnknown_843F968
_08101EC8: .4byte gUnknown_203ACEC
_08101ECC: .4byte gSprites
_08101ED0: .4byte sub_8101ED4
	thumb_func_end sub_8101E80

	thumb_func_start sub_8101ED4
sub_8101ED4: @ 8101ED4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08101EFA
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _08101EFA
	ldr r0, _08101F00 @ =0x0000fffa
	strh r0, [r1, 0x24]
_08101EFA:
	pop {r0}
	bx r0
	.align 2, 0
_08101F00: .4byte 0x0000fffa
	thumb_func_end sub_8101ED4

	thumb_func_start sub_8101F04
sub_8101F04: @ 8101F04
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x1
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FFE34
	mov r0, sp
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xD
	muls r0, r1
	adds r0, 0x3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r1, 25
	movs r2, 0xB0
	lsls r2, 20
	adds r1, r2
	lsrs r1, 24
	bl sub_8101F40
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101F04

	thumb_func_start sub_8101F40
sub_8101F40: @ 8101F40
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08101F7C @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB9
	lsls r1, 2
	adds r3, r0, r1
	ldr r1, [r3]
	cmp r1, 0
	beq _08101F74
	lsls r0, r2, 3
	adds r0, 0x4
	movs r2, 0
	strh r0, [r1, 0x20]
	ldr r1, [r3]
	adds r0, r4, 0x1
	lsls r0, 3
	adds r0, 0x1
	strh r0, [r1, 0x22]
	ldr r0, [r3]
	strh r2, [r0, 0x24]
	ldr r0, [r3]
	strh r2, [r0, 0x2E]
_08101F74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101F7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101F40

	thumb_func_start sub_8101F80
sub_8101F80: @ 8101F80
	push {r4,lr}
	ldr r4, _08101FA8 @ =gUnknown_203ACEC
	ldr r0, [r4]
	movs r1, 0xB9
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08101FA2
	bl DestroySprite
	ldr r0, [r4]
	movs r1, 0xB9
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_08101FA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101FA8: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101F80

	thumb_func_start sub_8101FAC
sub_8101FAC: @ 8101FAC
	push {r4-r6,lr}
	ldr r0, _08102004 @ =gUnknown_843FA40
	movs r1, 0xD0
	movs r2, 0x80
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08102008 @ =gUnknown_203ACEC
	ldr r2, [r5]
	movs r1, 0xBA
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0810200C @ =gSprites
	adds r1, r4
	str r1, [r2]
	movs r6, 0
	ldr r0, _08102010 @ =0x0000ffc0
	strh r0, [r1, 0x24]
	ldr r0, _08102014 @ =gUnknown_843FA20
	movs r1, 0xD0
	movs r2, 0x50
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	movs r1, 0xBB
	lsls r1, 2
	adds r3, r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r3]
	strb r6, [r2, 0x9]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102004: .4byte gUnknown_843FA40
_08102008: .4byte gUnknown_203ACEC
_0810200C: .4byte gSprites
_08102010: .4byte 0x0000ffc0
_08102014: .4byte gUnknown_843FA20
	thumb_func_end sub_8101FAC

	thumb_func_start sub_8102018
sub_8102018: @ 8102018
	push {r4,lr}
	ldr r4, _0810202C @ =gUnknown_203ACEC
	ldr r2, [r4]
	ldrb r3, [r2, 0x9]
	cmp r3, 0
	beq _08102030
	cmp r3, 0x1
	beq _08102088
	movs r0, 0
	b _081020A6
	.align 2, 0
_0810202C: .4byte gUnknown_203ACEC
_08102030:
	movs r0, 0xBA
	lsls r0, 2
	adds r2, r0
	ldr r1, [r2]
	ldrh r0, [r1, 0x24]
	adds r0, 0x8
	strh r0, [r1, 0x24]
	ldr r2, [r2]
	movs r1, 0x24
	ldrsh r0, [r2, r1]
	cmp r0, 0
	blt _081020A4
	strh r3, [r2, 0x24]
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08102066
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _08102076
_08102066:
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
_08102076:
	ldr r0, _08102084 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	b _081020A4
	.align 2, 0
_08102084: .4byte gUnknown_203ACEC
_08102088:
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081020A4
	movs r0, 0x2
	strb r0, [r2, 0x9]
	movs r0, 0
	b _081020A6
_081020A4:
	movs r0, 0x1
_081020A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8102018

	thumb_func_start sub_81020AC
sub_81020AC: @ 81020AC
	push {lr}
	ldr r2, _081020CC @ =gUnknown_203ACEC
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0x9]
	ldr r0, [r2]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081020CC: .4byte gUnknown_203ACEC
	thumb_func_end sub_81020AC

	thumb_func_start sub_81020D0
sub_81020D0: @ 81020D0
	push {r4-r6,lr}
	ldr r5, _081020E4 @ =gUnknown_203ACEC
	ldr r3, [r5]
	ldrb r0, [r3, 0x9]
	cmp r0, 0
	beq _081020E8
	cmp r0, 0x1
	beq _08102102
	movs r0, 0
	b _08102154
	.align 2, 0
_081020E4: .4byte gUnknown_203ACEC
_081020E8:
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r3, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08102152
	movs r0, 0x1
	strb r0, [r3, 0x9]
	b _08102152
_08102102:
	movs r0, 0xBA
	lsls r0, 2
	adds r2, r3, r0
	ldr r1, [r2]
	ldrh r0, [r1, 0x24]
	subs r0, 0x8
	movs r6, 0
	strh r0, [r1, 0x24]
	ldr r0, [r2]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bgt _08102152
	movs r4, 0xBB
	lsls r4, 2
	adds r0, r3, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	movs r1, 0xBA
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	ldr r1, [r5]
	adds r4, r1, r4
	str r6, [r4]
	movs r2, 0xBA
	lsls r2, 2
	adds r0, r1, r2
	str r6, [r0]
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	movs r0, 0
	b _08102154
_08102152:
	movs r0, 0x1
_08102154:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81020D0

	thumb_func_start sub_810215C
sub_810215C: @ 810215C
	push {lr}
	ldr r0, _08102174 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x4
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08102174: .4byte gUnknown_203ACEC
	thumb_func_end sub_810215C

	thumb_func_start sub_8102178
sub_8102178: @ 8102178
	push {lr}
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _0810219C
	ldr r0, _08102198 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _081021AE
	.align 2, 0
_08102198: .4byte gUnknown_203ACEC
_0810219C:
	ldr r0, _081021B4 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
_081021AE:
	pop {r0}
	bx r0
	.align 2, 0
_081021B4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8102178

	thumb_func_start sub_81021B8
sub_81021B8: @ 81021B8
	ldr r0, _081021D0 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	lsrs r1, 4
	movs r0, 0x1
	bics r0, r1
	bx lr
	.align 2, 0
_081021D0: .4byte gUnknown_203ACEC
	thumb_func_end sub_81021B8

	thumb_func_start sub_81021D4
sub_81021D4: @ 81021D4
	push {r4,lr}
	ldr r4, _08102240 @ =gUnknown_843FA98
	adds r0, r4, 0
	movs r1, 0x60
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08102202
	ldr r0, _08102244 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBC
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102248 @ =gSprites
	adds r0, r1
	str r0, [r2]
_08102202:
	adds r0, r4, 0
	movs r1, 0x60
	movs r2, 0x9C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08102236
	ldr r0, _08102244 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBD
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102248 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_08102236:
	bl sub_81022B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102240: .4byte gUnknown_843FA98
_08102244: .4byte gUnknown_203ACEC
_08102248: .4byte gSprites
	thumb_func_end sub_81021D4

	thumb_func_start sub_810224C
sub_810224C: @ 810224C
	push {r4-r6,lr}
	bl sub_80FFE64
	ldr r6, _081022AC @ =gUnknown_203ACEC
	ldr r1, [r6]
	movs r2, 0xBC
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _08102266
	movs r2, 0x1
_08102266:
	adds r3, r1, 0
	adds r3, 0x3E
	movs r4, 0x1
	lsls r2, 2
	ldrb r1, [r3]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_80FFE98
	ldr r1, [r6]
	movs r2, 0xBD
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _08102292
	movs r2, 0x1
_08102292:
	adds r3, r1, 0
	adds r3, 0x3E
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081022AC: .4byte gUnknown_203ACEC
	thumb_func_end sub_810224C

	thumb_func_start sub_81022B0
sub_81022B0: @ 81022B0
	ldr r3, _081022DC @ =gUnknown_203ACEC
	ldr r0, [r3]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xBD
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081022DC: .4byte gUnknown_203ACEC
	thumb_func_end sub_81022B0

	thumb_func_start sub_81022E0
sub_81022E0: @ 81022E0
	push {lr}
	cmp r0, 0
	bne _081022FC
	ldr r0, _081022F8 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, 0x60
	b _0810230A
	.align 2, 0
_081022F8: .4byte gUnknown_203ACEC
_081022FC:
	ldr r0, _0810231C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, 0x78
_0810230A:
	strh r1, [r0, 0x20]
	movs r3, 0xBD
	lsls r3, 2
	adds r0, r2, r3
	ldr r0, [r0]
	strh r1, [r0, 0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0810231C: .4byte gUnknown_203ACEC
	thumb_func_end sub_81022E0

	thumb_func_start sub_8102320
sub_8102320: @ 8102320
	push {r4,lr}
	ldr r4, _08102388 @ =gUnknown_843FA80
	adds r0, r4, 0
	movs r1, 0xDC
	movs r2, 0x54
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0810234E
	ldr r0, _0810238C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBE
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102390 @ =gSprites
	adds r0, r1
	str r0, [r2]
_0810234E:
	adds r0, r4, 0
	movs r1, 0xDC
	movs r2, 0x9C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0810237E
	ldr r0, _0810238C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBF
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102390 @ =gSprites
	adds r0, r1
	str r0, [r2]
	movs r1, 0x1
	bl StartSpriteAnim
_0810237E:
	bl sub_81023F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102388: .4byte gUnknown_843FA80
_0810238C: .4byte gUnknown_203ACEC
_08102390: .4byte gSprites
	thumb_func_end sub_8102320

	thumb_func_start sub_8102394
sub_8102394: @ 8102394
	push {r4-r6,lr}
	bl sub_80FFE64
	ldr r6, _081023F4 @ =gUnknown_203ACEC
	ldr r1, [r6]
	movs r2, 0xBE
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _081023AE
	movs r2, 0x1
_081023AE:
	adds r3, r1, 0
	adds r3, 0x3E
	movs r4, 0x1
	lsls r2, 2
	ldrb r1, [r3]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_80FFE98
	ldr r1, [r6]
	movs r2, 0xBF
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _081023DA
	movs r2, 0x1
_081023DA:
	adds r3, r1, 0
	adds r3, 0x3E
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081023F4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8102394

	thumb_func_start sub_81023F8
sub_81023F8: @ 81023F8
	ldr r3, _08102424 @ =gUnknown_203ACEC
	ldr r0, [r3]
	movs r1, 0xBE
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xBF
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08102424: .4byte gUnknown_203ACEC
	thumb_func_end sub_81023F8

	thumb_func_start sub_8102428
sub_8102428: @ 8102428
	push {r4,lr}
	sub sp, 0x14
	ldr r3, _081024A8 @ =0xffffff00
	ldr r0, [sp, 0xC]
	ands r0, r3
	movs r1, 0x3
	orrs r0, r1
	ldr r2, _081024AC @ =0xffff00ff
	ands r0, r2
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	ldr r1, _081024B0 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xB0
	lsls r1, 12
	orrs r0, r1
	ldr r1, _081024B4 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 21
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r3
	movs r1, 0x2
	orrs r0, r1
	ands r0, r2
	movs r1, 0xB0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _081024B8 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 14
	orrs r0, r1
	str r0, [sp, 0x10]
	add r0, sp, 0xC
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _081024BC @ =gUnknown_841EE2B
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
	adds r0, r4, 0
	bl PutWindowTilemap
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081024A8: .4byte 0xffffff00
_081024AC: .4byte 0xffff00ff
_081024B0: .4byte 0xff00ffff
_081024B4: .4byte 0x00ffffff
_081024B8: .4byte 0x0000ffff
_081024BC: .4byte gUnknown_841EE2B
	thumb_func_end sub_8102428

	.align 2, 0 @ Don't pad with nop.
