	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80989F8
sub_80989F8: @ 80989F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08098A18 @ =gUnknown_2037F02
	ldrb r0, [r4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08098A1C
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _08098A58
	.align 2, 0
_08098A18: .4byte gUnknown_2037F02
_08098A1C:
	ldr r1, _08098A60 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x26]
	ldr r1, _08098A64 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x8]
	ldrh r1, [r4, 0x6]
	strh r1, [r0, 0xA]
	ldrh r1, [r4, 0x8]
	strh r1, [r0, 0xC]
	ldrh r1, [r4, 0x8]
	strh r1, [r0, 0xE]
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x10]
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x12]
	ldr r1, _08098A68 @ =sub_8098A6C
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_08098A58:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098A60: .4byte gSprites
_08098A64: .4byte gUnknown_3005090
_08098A68: .4byte sub_8098A6C
	thumb_func_end sub_80989F8

	thumb_func_start sub_8098A6C
sub_8098A6C: @ 8098A6C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08098AA8 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xE]
	movs r2, 0xE
	ldrsh r5, [r3, r2]
	adds r7, r1, 0
	cmp r5, 0
	bne _08098B12
	ldr r2, _08098AAC @ =gSprites
	movs r6, 0x8
	ldrsh r1, [r3, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r6, 0x24
	ldrsh r0, [r1, r6]
	adds r6, r2, 0
	cmp r0, 0
	bne _08098AB0
	ldrh r0, [r3, 0x10]
	strh r0, [r1, 0x24]
	b _08098AB2
	.align 2, 0
_08098AA8: .4byte gUnknown_3005090
_08098AAC: .4byte gSprites
_08098AB0:
	strh r5, [r1, 0x24]
_08098AB2:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r7
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r6
	movs r5, 0x26
	ldrsh r0, [r1, r5]
	cmp r0, 0
	bne _08098AD2
	ldrh r0, [r3, 0x12]
	b _08098AD4
_08098AD2:
	movs r0, 0
_08098AD4:
	strh r0, [r1, 0x26]
	adds r0, r2, r4
	lsls r0, 3
	adds r2, r0, r7
	ldrh r0, [r2, 0xC]
	strh r0, [r2, 0xE]
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _08098B16
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r3, [r0, 0x24]
	movs r5, 0x8
	ldrsh r1, [r2, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r3, [r0, 0x26]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	b _08098B16
_08098B12:
	subs r0, 0x1
	strh r0, [r3, 0xE]
_08098B16:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8098A6C

	thumb_func_start sub_8098B1C
sub_8098B1C: @ 8098B1C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _08098B44 @ =gUnknown_2037F02
	ldrh r0, [r2]
	movs r3, 0
	ldrsh r1, [r2, r3]
	cmp r1, 0x3
	bgt _08098B48
	lsls r0, 24
	lsrs r0, 24
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _08098B9E
	b _08098BA2
	.align 2, 0
_08098B44: .4byte gUnknown_2037F02
_08098B48:
	cmp r1, 0x8
	beq _08098B94
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x5
	beq _08098B68
	cmp r0, 0x5
	bgt _08098B5E
	cmp r0, 0x4
	beq _08098B64
	b _08098B70
_08098B5E:
	cmp r0, 0x6
	beq _08098B6C
	b _08098B70
_08098B64:
	movs r0, 0
	b _08098B72
_08098B68:
	movs r0, 0x2
	b _08098B72
_08098B6C:
	movs r0, 0x1
	b _08098B72
_08098B70:
	movs r0, 0x3
_08098B72:
	bl GetBankByIdentity
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	bne _08098B88
	movs r6, 0x1
_08098B88:
	ldr r0, _08098B90 @ =gUnknown_2023D44
	adds r0, r4, r0
	b _08098B9C
	.align 2, 0
_08098B90: .4byte gUnknown_2023D44
_08098B94:
	ldr r1, _08098BAC @ =gUnknown_2023D44
	ldr r0, _08098BB0 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r0, r1
_08098B9C:
	ldrb r3, [r0]
_08098B9E:
	cmp r6, 0
	beq _08098BB4
_08098BA2:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _08098BF2
	.align 2, 0
_08098BAC: .4byte gUnknown_2023D44
_08098BB0: .4byte gUnknown_2037F1A
_08098BB4:
	ldr r1, _08098BF8 @ =gSprites
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldr r2, _08098BFC @ =gUnknown_2037F02
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x24]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x26]
	ldr r1, _08098C00 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x8]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0xA]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0xC]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0xE]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x10]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x12]
	ldr r1, _08098C04 @ =sub_8098C08
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_08098BF2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098BF8: .4byte gSprites
_08098BFC: .4byte gUnknown_2037F02
_08098C00: .4byte gUnknown_3005090
_08098C04: .4byte sub_8098C08
	thumb_func_end sub_8098B1C

	thumb_func_start sub_8098C08
sub_8098C08: @ 8098C08
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08098C4C @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	mov r12, r1
	cmp r0, 0
	bne _08098CC0
	ldr r2, _08098C50 @ =gSprites
	movs r7, 0x8
	ldrsh r1, [r3, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrh r5, [r3, 0x10]
	movs r7, 0x10
	ldrsh r0, [r3, r7]
	adds r7, r2, 0
	cmp r1, r0
	bne _08098C54
	negs r0, r5
	strh r0, [r4, 0x24]
	b _08098C56
	.align 2, 0
_08098C4C: .4byte gUnknown_3005090
_08098C50: .4byte gSprites
_08098C54:
	strh r5, [r4, 0x24]
_08098C56:
	lsls r3, r6, 2
	adds r1, r3, r6
	lsls r1, 3
	add r1, r12
	movs r0, 0x8
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r7
	movs r0, 0x26
	ldrsh r2, [r4, r0]
	mov r8, r2
	ldrh r5, [r1, 0x12]
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r8, r0
	bne _08098C80
	negs r0, r5
	strh r0, [r4, 0x26]
	b _08098C82
_08098C80:
	strh r5, [r4, 0x26]
_08098C82:
	adds r0, r3, r6
	lsls r0, 3
	mov r4, r12
	adds r3, r0, r4
	ldrh r0, [r3, 0xC]
	strh r0, [r3, 0xE]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _08098CC4
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x24]
	movs r4, 0x8
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	b _08098CC4
_08098CC0:
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_08098CC4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8098C08

	thumb_func_start sub_8098CD0
sub_8098CD0: @ 8098CD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08098CF0 @ =gUnknown_2037F02
	ldrb r0, [r4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _08098CF4
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _08098D42
	.align 2, 0
_08098CF0: .4byte gUnknown_2037F02
_08098CF4:
	ldr r0, _08098D48 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x2]
	ldrh r2, [r1, 0x24]
	adds r0, r2
	movs r2, 0
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x4]
	ldrh r6, [r1, 0x26]
	adds r0, r6
	strh r0, [r1, 0x26]
	ldr r0, _08098D4C @ =gUnknown_3005090
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	strh r3, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r1, 0xC]
	strh r2, [r1, 0xE]
	ldrh r0, [r4, 0x8]
	strh r0, [r1, 0x10]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 1
	strh r0, [r1, 0x12]
	movs r6, 0x4
	ldrsh r0, [r4, r6]
	lsls r0, 1
	strh r0, [r1, 0x14]
	ldr r2, _08098D50 @ =sub_8098D54
	str r2, [r1]
	adds r0, r5, 0
	bl _call_via_r2
_08098D42:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098D48: .4byte gSprites
_08098D4C: .4byte gUnknown_3005090
_08098D50: .4byte sub_8098D54
	thumb_func_end sub_8098CD0

	thumb_func_start sub_8098D54
sub_8098D54: @ 8098D54
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08098DAC @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	adds r6, r1, 0
	cmp r0, 0
	beq _08098D72
	b _08098E84
_08098D72:
	ldrh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08098DB4
	ldr r2, _08098DB0 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r3, [r0, 0x24]
	adds r1, r3
	strh r1, [r0, 0x24]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x14]
	ldrh r3, [r0, 0x26]
	adds r1, r3
	strh r1, [r0, 0x26]
	adds r3, r2, 0
	b _08098DDE
	.align 2, 0
_08098DAC: .4byte gUnknown_3005090
_08098DB0: .4byte gSprites
_08098DB4:
	ldr r3, _08098E40 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0x12]
	subs r1, r2
	strh r1, [r0, 0x24]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	ldrh r2, [r4, 0x14]
	subs r1, r2
	strh r1, [r0, 0x26]
_08098DDE:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r0, [r4, 0x10]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0xA]
	adds r2, r0, 0x1
	strh r2, [r4, 0xA]
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0xC
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _08098E88
	movs r0, 0x1
	ands r2, r0
	cmp r2, 0
	beq _08098E44
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	ldrh r6, [r1, 0x24]
	adds r0, r6
	strh r0, [r1, 0x24]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	ldrh r3, [r1, 0x26]
	adds r0, r3
	strh r0, [r1, 0x26]
	b _08098E7C
	.align 2, 0
_08098E40: .4byte gSprites
_08098E44:
	movs r6, 0x8
	ldrsh r0, [r4, r6]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r2, 0x26]
	subs r0, r1
	strh r0, [r2, 0x26]
_08098E7C:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _08098E88
_08098E84:
	subs r0, r2, 0x1
	strh r0, [r4, 0xE]
_08098E88:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8098D54

	thumb_func_start sub_8098E90
sub_8098E90: @ 8098E90
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08098EE0 @ =gUnknown_2037F02
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08098EE4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r5, 0x2]
	strh r2, [r1, 0x24]
	ldr r2, _08098EE8 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x8]
	ldrh r0, [r5, 0x2]
	strh r0, [r1, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r1, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r1, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r1, 0x10]
	ldr r2, _08098EEC @ =sub_8098EF0
	str r2, [r1]
	adds r0, r4, 0
	bl _call_via_r2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098EE0: .4byte gUnknown_2037F02
_08098EE4: .4byte gSprites
_08098EE8: .4byte gUnknown_3005090
_08098EEC: .4byte sub_8098EF0
	thumb_func_end sub_8098E90

	thumb_func_start sub_8098EF0
sub_8098EF0: @ 8098EF0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _08098F7C @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r2
	ldrb r5, [r3, 0x8]
	ldrh r4, [r3, 0xA]
	ldrh r1, [r3, 0x18]
	adds r0, r1, 0x1
	strh r0, [r3, 0x18]
	movs r7, 0xC
	ldrsh r0, [r3, r7]
	lsls r1, 16
	asrs r1, 16
	mov r12, r2
	ldr r7, _08098F80 @ =gSprites
	cmp r0, r1
	bne _08098F42
	movs r0, 0
	strh r0, [r3, 0x18]
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r1, r0, r7
	ldrh r3, [r1, 0x24]
	movs r0, 0x24
	ldrsh r2, [r1, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r2, r0
	bne _08098F3A
	negs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
_08098F3A:
	lsls r0, r4, 16
	asrs r0, 16
	adds r0, r3
	strh r0, [r1, 0x24]
_08098F42:
	lsls r2, r6, 2
	adds r2, r6
	lsls r2, 3
	add r2, r12
	strh r4, [r2, 0xA]
	ldrh r1, [r2, 0xE]
	ldrh r0, [r2, 0x1A]
	adds r1, r0
	strh r1, [r2, 0x1A]
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r7
	lsls r1, 16
	asrs r1, 24
	strh r1, [r0, 0x26]
	ldrh r0, [r2, 0x10]
	subs r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _08098F74
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_08098F74:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098F7C: .4byte gUnknown_3005090
_08098F80: .4byte gSprites
	thumb_func_end sub_8098EF0

	thumb_func_start sub_8098F84
sub_8098F84: @ 8098F84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0x1
	ldr r4, _08098FF8 @ =gUnknown_2037F02
	ldrb r0, [r4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r7, r0, 24
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	ble _08098FA8
	movs r0, 0x5
	strh r0, [r4, 0x8]
_08098FA8:
	movs r1, 0
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	adds r3, r4, 0
	ldr r2, _08098FFC @ =gUnknown_3005090
	mov r12, r2
	lsls r4, r5, 2
	ldr r2, _08099000 @ =sub_8099004
	mov r8, r2
	cmp r1, r0
	bge _08098FCE
	adds r2, r0, 0
_08098FC0:
	lsls r0, r6, 25
	lsrs r6, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	blt _08098FC0
_08098FCE:
	adds r0, r4, r5
	lsls r0, 3
	add r0, r12
	strh r7, [r0, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0xE]
	strh r6, [r0, 0x10]
	mov r1, r8
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098FF8: .4byte gUnknown_2037F02
_08098FFC: .4byte gUnknown_3005090
_08099000: .4byte sub_8099004
	thumb_func_end sub_8098F84

	thumb_func_start sub_8099004
sub_8099004: @ 8099004
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _08099074 @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrb r4, [r5, 0x8]
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r2, _08099078 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r4, r1, r2
	strh r0, [r4, 0x24]
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r5, 0xC]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x10]
	ldrh r1, [r5, 0x12]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x12]
	cmp r0, 0
	bne _0809905C
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
_0809905C:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _0809906E
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_0809906E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099074: .4byte gUnknown_3005090
_08099078: .4byte gSprites
	thumb_func_end sub_8099004

	thumb_func_start sub_809907C
sub_809907C: @ 809907C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080990A4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08099098
	ldr r1, _080990A8 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_08099098:
	adds r0, r4, 0
	bl sub_8098F84
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080990A4: .4byte gUnknown_2037F1A
_080990A8: .4byte gUnknown_2037F02
	thumb_func_end sub_809907C

	thumb_func_start sub_80990AC
sub_80990AC: @ 80990AC
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080990D4 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080990DC
	ldr r1, _080990D8 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	negs r0, r0
	b _080990E0
	.align 2, 0
_080990D4: .4byte gUnknown_2037F1A
_080990D8: .4byte gUnknown_2037F02
_080990DC:
	ldr r1, _0809910C @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
_080990E0:
	strh r0, [r4, 0x30]
	ldrh r2, [r1]
	movs r0, 0
	strh r2, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldr r1, _08099110 @ =gUnknown_2023D44
	ldr r0, _08099114 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r1, _08099118 @ =sub_8099120
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _0809911C @ =sub_8074DC4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809910C: .4byte gUnknown_2037F02
_08099110: .4byte gUnknown_2023D44
_08099114: .4byte gUnknown_2037F1A
_08099118: .4byte sub_8099120
_0809911C: .4byte sub_8074DC4
	thumb_func_end sub_80990AC

	thumb_func_start sub_8099120
sub_8099120: @ 8099120
	push {lr}
	ldrh r1, [r0, 0x36]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x30]
	negs r1, r1
	strh r1, [r0, 0x30]
	ldr r1, _0809913C @ =sub_8074DC4
	str r1, [r0, 0x1C]
	ldr r1, _08099140 @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_0809913C: .4byte sub_8074DC4
_08099140: .4byte DestroyAnimSprite
	thumb_func_end sub_8099120

	thumb_func_start sub_8099144
sub_8099144: @ 8099144
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r5, _08099184 @ =gUnknown_2037F02
	ldrb r0, [r5, 0x4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r5]
	movs r1, 0
	strh r2, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldrh r1, [r5, 0x2]
	strh r1, [r4, 0x32]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r1, _08099188 @ =sub_8099190
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _0809918C @ =sub_8074DC4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099184: .4byte gUnknown_2037F02
_08099188: .4byte sub_8099190
_0809918C: .4byte sub_8074DC4
	thumb_func_end sub_8099144

	thumb_func_start sub_8099190
sub_8099190: @ 8099190
	push {lr}
	ldrh r1, [r0, 0x36]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x32]
	negs r1, r1
	strh r1, [r0, 0x32]
	ldr r1, _080991AC @ =sub_8074DC4
	str r1, [r0, 0x1C]
	ldr r1, _080991B0 @ =DestroyAnimSprite
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080991AC: .4byte sub_8074DC4
_080991B0: .4byte DestroyAnimSprite
	thumb_func_end sub_8099190

	thumb_func_start sub_80991B4
sub_80991B4: @ 80991B4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _080991CC @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080991D8
	ldr r1, _080991D0 @ =gUnknown_2023D44
	ldr r0, _080991D4 @ =gUnknown_2037F1A
	b _080991DC
	.align 2, 0
_080991CC: .4byte gUnknown_2037F02
_080991D0: .4byte gUnknown_2023D44
_080991D4: .4byte gUnknown_2037F1A
_080991D8:
	ldr r1, _0809923C @ =gUnknown_2023D44
	ldr r0, _08099240 @ =gUnknown_2037F1B
_080991DC:
	ldrb r0, [r0]
	adds r0, r1
	ldrb r7, [r0]
	ldr r5, _08099244 @ =gUnknown_2037F02
	ldrh r0, [r5, 0x4]
	movs r3, 0
	strh r0, [r6, 0x2E]
	ldr r0, _08099248 @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r6, 0x30]
	ldrh r0, [r4, 0x20]
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x22]
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	str r3, [sp]
	bl sub_80754B8
	ldr r3, [sp]
	strh r3, [r6, 0x34]
	strh r3, [r6, 0x36]
	ldrh r0, [r4, 0x24]
	strh r0, [r6, 0x38]
	ldrh r0, [r4, 0x26]
	strh r0, [r6, 0x3A]
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _0809924C
	strh r3, [r6, 0x32]
	b _08099252
	.align 2, 0
_0809923C: .4byte gUnknown_2023D44
_08099240: .4byte gUnknown_2037F1B
_08099244: .4byte gUnknown_2037F02
_08099248: .4byte gSprites
_0809924C:
	cmp r0, 0x2
	bne _08099252
	strh r3, [r6, 0x30]
_08099252:
	ldr r0, _08099268 @ =gUnknown_2037F02
	ldrh r1, [r0, 0x2]
	lsls r0, r7, 8
	orrs r0, r1
	strh r0, [r6, 0x3C]
	ldr r0, _0809926C @ =sub_8099270
	str r0, [r6, 0x1C]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099268: .4byte gUnknown_2037F02
_0809926C: .4byte sub_8099270
	thumb_func_end sub_80991B4

	thumb_func_start sub_8099270
sub_8099270: @ 8099270
	push {r4-r6,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3C]
	lsls r1, r0, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	lsls r0, 16
	asrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080992AC @ =gSprites
	adds r3, r1, r0
	ldrh r0, [r2, 0x2E]
	movs r6, 0x2E
	ldrsh r1, [r2, r6]
	cmp r1, 0
	bne _080992B0
	cmp r4, 0x1
	bhi _0809929A
	strh r1, [r3, 0x24]
_0809929A:
	cmp r5, 0x2
	beq _080992A2
	cmp r5, 0
	bne _080992A4
_080992A2:
	strh r1, [r3, 0x26]
_080992A4:
	adds r0, r2, 0
	bl DestroyAnimSprite
	b _080992DA
	.align 2, 0
_080992AC: .4byte gSprites
_080992B0:
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	adds r1, r0
	strh r1, [r2, 0x34]
	ldrh r0, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r0, r4
	strh r0, [r2, 0x36]
	lsls r1, 16
	asrs r1, 24
	ldrh r6, [r2, 0x38]
	adds r1, r6
	strh r1, [r3, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r2, 0x3A]
	adds r0, r2
	strh r0, [r3, 0x26]
_080992DA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8099270

	thumb_func_start sub_80992E0
sub_80992E0: @ 80992E0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080992F4 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080992FC
	ldr r0, _080992F8 @ =gUnknown_2037F1A
	b _080992FE
	.align 2, 0
_080992F4: .4byte gUnknown_2037F02
_080992F8: .4byte gUnknown_2037F1A
_080992FC:
	ldr r0, _0809937C @ =gUnknown_2037F1B
_080992FE:
	ldrb r2, [r0]
	ldr r0, _08099380 @ =gUnknown_2023D44
	adds r0, r2, r0
	ldrb r6, [r0]
	adds r0, r2, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08099328
	ldr r1, _08099384 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _08099328
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_08099328:
	ldr r2, _08099384 @ =gUnknown_2037F02
	ldrh r0, [r2, 0x8]
	movs r4, 0
	strh r0, [r5, 0x2E]
	ldr r0, _08099388 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x2]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x22]
	strh r0, [r5, 0x34]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_80754B8
	strh r4, [r5, 0x34]
	strh r4, [r5, 0x36]
	strh r6, [r5, 0x38]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0809938C @ =DestroyAnimSprite
	adds r0, r5, 0
	bl StoreSpriteCallbackInData6
	ldr r0, _08099390 @ =sub_8074E14
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809937C: .4byte gUnknown_2037F1B
_08099380: .4byte gUnknown_2023D44
_08099384: .4byte gUnknown_2037F02
_08099388: .4byte gSprites
_0809938C: .4byte DestroyAnimSprite
_08099390: .4byte sub_8074E14
	thumb_func_end sub_80992E0

	thumb_func_start sub_8099394
sub_8099394: @ 8099394
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080993B4 @ =gUnknown_2037F02
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080993BC
	ldr r0, _080993B8 @ =gUnknown_2037F1A
	b _080993BE
	.align 2, 0
_080993B4: .4byte gUnknown_2037F02
_080993B8: .4byte gUnknown_2037F1A
_080993BC:
	ldr r0, _0809943C @ =gUnknown_2037F1B
_080993BE:
	ldrb r1, [r0]
	ldr r0, _08099440 @ =gUnknown_2023D44
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r0, r1, 0
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080993E8
	ldr r1, _08099444 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080993E8
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080993E8:
	ldr r5, _08099444 @ =gUnknown_2037F02
	ldrh r0, [r5, 0x8]
	strh r0, [r6, 0x2E]
	ldr r0, _08099448 @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r6, 0x30]
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r6, 0x34]
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl sub_80754B8
	ldrh r0, [r4, 0x24]
	lsls r0, 8
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x26]
	lsls r0, 8
	strh r0, [r6, 0x36]
	strh r7, [r6, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r6, 0x3A]
	lsls r0, 16
	cmp r0, 0
	bne _08099450
	ldr r1, _0809944C @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	b _08099458
	.align 2, 0
_0809943C: .4byte gUnknown_2037F1B
_08099440: .4byte gUnknown_2023D44
_08099444: .4byte gUnknown_2037F02
_08099448: .4byte gSprites
_0809944C: .4byte DestroyAnimSprite
_08099450:
	ldr r1, _08099464 @ =sub_809946C
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
_08099458:
	ldr r0, _08099468 @ =sub_8074E14
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099464: .4byte sub_809946C
_08099468: .4byte sub_8074E14
	thumb_func_end sub_8099394

	thumb_func_start sub_809946C
sub_809946C: @ 809946C
	push {r4,lr}
	ldr r4, _08099498 @ =gSprites
	movs r1, 0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	movs r3, 0
	strh r3, [r1, 0x24]
	movs r1, 0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r3, [r1, 0x26]
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099498: .4byte gSprites
	thumb_func_end sub_809946C

	thumb_func_start sub_809949C
sub_809949C: @ 809949C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _08099520 @ =gUnknown_2037F02
	movs r0, 0x6
	ldrsh r1, [r5, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _08099524 @ =gUnknown_2037F1A
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _080994CE
	ldrh r0, [r5, 0x2]
	negs r0, r0
	strh r0, [r5, 0x2]
	ldrh r0, [r5, 0xA]
	negs r0, r0
	strh r0, [r5, 0xA]
_080994CE:
	ldrb r0, [r5]
	bl GetAnimBankSpriteId
	ldr r1, _08099528 @ =gUnknown_3005090
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	strh r7, [r4, 0x16]
	ldr r0, _0809952C @ =sub_8099530
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099520: .4byte gUnknown_2037F02
_08099524: .4byte gUnknown_2037F1A
_08099528: .4byte gUnknown_3005090
_0809952C: .4byte sub_8099530
	thumb_func_end sub_809949C

	thumb_func_start sub_8099530
sub_8099530: @ 8099530
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08099588 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r1, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	ldrh r2, [r5, 0x1E]
	adds r0, r2
	strh r0, [r5, 0x1E]
	ldr r2, _0809958C @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r2
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x1C]
	lsrs r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x16]
	ldrh r1, [r5, 0x1C]
	adds r0, r1
	strh r0, [r5, 0x1C]
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _08099580
	ldr r0, _08099590 @ =sub_8099594
	str r0, [r5]
_08099580:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099588: .4byte gUnknown_3005090
_0809958C: .4byte gSprites
_08099590: .4byte sub_8099594
	thumb_func_end sub_8099530

	thumb_func_start sub_8099594
sub_8099594: @ 8099594
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080995B8 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080995BC
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	b _080995F0
	.align 2, 0
_080995B8: .4byte gUnknown_3005090
_080995BC:
	ldrb r0, [r4, 0x8]
	ldrh r2, [r4, 0x12]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldr r3, _080995F8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsls r2, 16
	asrs r2, 24
	ldrh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 24
	adds r2, r0
	strh r2, [r1, 0x24]
	ldrh r0, [r4, 0x14]
	subs r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080995F0
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_080995F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080995F8: .4byte gSprites
	thumb_func_end sub_8099594

	thumb_func_start sub_80995FC
sub_80995FC: @ 80995FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08099620 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _0809962A
	cmp r0, 0x2
	bgt _08099624
	cmp r0, 0
	blt _0809965C
	ldrb r0, [r1]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r2, r0, 24
	b _08099664
	.align 2, 0
_08099620: .4byte gUnknown_2037F02
_08099624:
	cmp r0, 0x3
	beq _08099634
	b _0809965C
_0809962A:
	ldr r5, _08099630 @ =gUnknown_2037F1A
	b _08099636
	.align 2, 0
_08099630: .4byte gUnknown_2037F1A
_08099634:
	ldr r5, _08099654 @ =gUnknown_2037F1B
_08099636:
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl sub_8072DF0
	lsls r0, 24
	cmp r0, 0
	beq _0809965C
	ldr r1, _08099658 @ =gUnknown_2023D44
	ldrb r0, [r5]
	eors r0, r4
	adds r0, r1
	ldrb r2, [r0]
	b _08099664
	.align 2, 0
_08099654: .4byte gUnknown_2037F1B
_08099658: .4byte gUnknown_2023D44
_0809965C:
	adds r0, r6, 0
	bl DestroyAnimVisualTask
	b _080996A4
_08099664:
	ldr r1, _08099684 @ =gUnknown_3005090
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	strh r2, [r5, 0x8]
	ldr r0, _08099688 @ =gUnknown_2037F1B
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08099690
	ldr r0, _0809968C @ =gUnknown_2037F02
	ldrh r0, [r0, 0x2]
	b _08099696
	.align 2, 0
_08099684: .4byte gUnknown_3005090
_08099688: .4byte gUnknown_2037F1B
_0809968C: .4byte gUnknown_2037F02
_08099690:
	ldr r0, _080996AC @ =gUnknown_2037F02
	ldrh r0, [r0, 0x2]
	negs r0, r0
_08099696:
	strh r0, [r5, 0xA]
	ldr r0, _080996B0 @ =gUnknown_3005090
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080996B4 @ =sub_80996B8
	str r0, [r1]
_080996A4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080996AC: .4byte gUnknown_2037F02
_080996B0: .4byte gUnknown_3005090
_080996B4: .4byte sub_80996B8
	thumb_func_end sub_80995FC

	thumb_func_start sub_80996B8
sub_80996B8: @ 80996B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080996FC @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r2, [r1, 0x8]
	ldr r3, _08099700 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r1, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _080996F6
	adds r0, r4, 0
	bl DestroyAnimVisualTask
_080996F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080996FC: .4byte gUnknown_3005090
_08099700: .4byte gSprites
	thumb_func_end sub_80996B8

	thumb_func_start sub_8099704
sub_8099704: @ 8099704
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08099754 @ =gUnknown_2037F1A
	ldrb r0, [r6]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08099720
	ldr r1, _08099758 @ =gUnknown_2037F02
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_08099720:
	ldr r4, _08099758 @ =gUnknown_2037F02
	ldrb r0, [r4, 0x8]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809975C @ =gUnknown_3005090
	lsls r3, r5, 2
	adds r1, r3, r5
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r4]
	strh r1, [r2, 0x8]
	ldrh r1, [r4, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r4, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r4, 0x6]
	strh r1, [r2, 0xE]
	strh r0, [r2, 0x10]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08099760
	ldrb r0, [r6]
	b _08099764
	.align 2, 0
_08099754: .4byte gUnknown_2037F1A
_08099758: .4byte gUnknown_2037F02
_0809975C: .4byte gUnknown_3005090
_08099760:
	ldr r0, _0809977C @ =gUnknown_2037F1B
	ldrb r0, [r0]
_08099764:
	strh r0, [r2, 0x12]
	ldr r1, _08099780 @ =gUnknown_3005090
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x20]
	ldr r1, _08099784 @ =sub_8099788
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809977C: .4byte gUnknown_2037F1B
_08099780: .4byte gUnknown_3005090
_08099784: .4byte sub_8099788
	thumb_func_end sub_8099704

	thumb_func_start sub_8099788
sub_8099788: @ 8099788
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080997D8 @ =gUnknown_3005090
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrb r7, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	lsls r1, r0, 16
	strh r0, [r4, 0x1C]
	lsrs r1, 24
	mov r8, r1
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	lsrs r5, r0, 16
	mov r9, r5
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080997E0
	ldr r0, _080997DC @ =gSprites
	lsls r2, r7, 4
	adds r1, r2, r7
	lsls r1, 2
	adds r1, r0
	strh r5, [r1, 0x24]
	mov r9, r0
	adds r4, r2, 0
	b _08099826
	.align 2, 0
_080997D8: .4byte gUnknown_3005090
_080997DC: .4byte gSprites
_080997E0:
	ldrb r0, [r4, 0x12]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	bne _08099808
	ldr r1, _08099804 @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	lsls r0, r5, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _08099824
	b _08099822
	.align 2, 0
_08099804: .4byte gSprites
_08099808:
	ldr r1, _080998A8 @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	mov r4, r9
	lsls r0, r4, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _08099822
	negs r0, r0
_08099822:
	negs r0, r0
_08099824:
	strh r0, [r3, 0x26]
_08099826:
	mov r5, r8
	cmp r5, 0x7F
	bls _08099848
	ldr r1, _080998AC @ =gUnknown_3005090
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0
	bne _08099848
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _0809986A
_08099848:
	mov r2, r8
	cmp r2, 0x7E
	bhi _0809989C
	ldr r1, _080998AC @ =gUnknown_3005090
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0x1
	bne _0809989C
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _0809989C
_0809986A:
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x1E]
	movs r2, 0x1
	eors r0, r2
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	eors r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _0809989C
	adds r0, r4, r7
	lsls r0, 2
	add r0, r9
	strh r3, [r0, 0x24]
	strh r3, [r0, 0x26]
	adds r0, r6, 0
	bl DestroyAnimVisualTask
_0809989C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080998A8: .4byte gSprites
_080998AC: .4byte gUnknown_3005090
	thumb_func_end sub_8099788

	thumb_func_start sub_80998B0
sub_80998B0: @ 80998B0
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080998FC @ =gUnknown_2037F02
	ldrb r0, [r6, 0x6]
	bl GetAnimBankSpriteId
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r6, 0x8]
	adds r0, r5, 0
	bl sub_80758E0
	ldr r1, _08099900 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r6]
	strh r1, [r0, 0x8]
	ldrh r1, [r6, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xE]
	strh r5, [r0, 0x10]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x1C]
	strh r1, [r0, 0x1E]
	ldr r1, _08099904 @ =sub_8099908
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080998FC: .4byte gUnknown_2037F02
_08099900: .4byte gUnknown_3005090
_08099904: .4byte sub_8099908
	thumb_func_end sub_80998B0

	thumb_func_start sub_8099908
sub_8099908: @ 8099908
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08099968 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xA]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrb r0, [r4, 0x10]
	adds r6, r0, 0
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _08099978
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	ble _0809996C
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r1, [r4, 0xE]
	b _08099978
	.align 2, 0
_08099968: .4byte gUnknown_3005090
_0809996C:
	adds r0, r6, 0
	bl sub_8075980
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_08099978:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8099908

	thumb_func_start sub_8099980
sub_8099980: @ 8099980
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080999BC @ =gUnknown_2037F02
	ldrb r0, [r4, 0x4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_80758E0
	ldr r1, _080999C0 @ =gUnknown_3005090
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2, 0xA]
	ldrh r0, [r4]
	strh r0, [r2, 0xC]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	beq _080999C4
	strh r1, [r2, 0xE]
	b _080999D0
	.align 2, 0
_080999BC: .4byte gUnknown_2037F02
_080999C0: .4byte gUnknown_3005090
_080999C4:
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r3, r0, 0
	muls r3, r1
	adds r0, r3, 0
	strh r0, [r2, 0xE]
_080999D0:
	ldr r1, _080999FC @ =gUnknown_3005090
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r5, r0, r1
	ldr r6, _08099A00 @ =gUnknown_2037F02
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x10]
	mov r0, r8
	strh r0, [r5, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x14]
	bl sub_8073788
	lsls r0, 24
	mov r8, r4
	cmp r0, 0
	beq _08099A04
	movs r0, 0x1
	strh r0, [r5, 0x16]
	b _08099A28
	.align 2, 0
_080999FC: .4byte gUnknown_3005090
_08099A00: .4byte gUnknown_2037F02
_08099A04:
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08099A14
	ldr r0, _08099A10 @ =gUnknown_2037F1A
	b _08099A16
	.align 2, 0
_08099A10: .4byte gUnknown_2037F1A
_08099A14:
	ldr r0, _08099A6C @ =gUnknown_2037F1B
_08099A16:
	ldrb r0, [r0]
	bl GetBankSide
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _08099A26
	movs r1, 0x1
_08099A26:
	strh r1, [r5, 0x16]
_08099A28:
	ldr r0, _08099A70 @ =gUnknown_3005090
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r4, r1, r0
	movs r3, 0x16
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08099A54
	bl sub_8073788
	lsls r0, 24
	cmp r0, 0
	bne _08099A54
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0xE]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
_08099A54:
	ldr r0, _08099A70 @ =gUnknown_3005090
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08099A74 @ =sub_8099B54
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099A6C: .4byte gUnknown_2037F1B
_08099A70: .4byte gUnknown_3005090
_08099A74: .4byte sub_8099B54
	thumb_func_end sub_8099980

	thumb_func_start sub_8099A78
sub_8099A78: @ 8099A78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08099AB4 @ =gUnknown_2037F02
	ldrb r0, [r4, 0x4]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_80758E0
	ldr r1, _08099AB8 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldrh r1, [r4]
	strh r1, [r0, 0xC]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08099AC0
	ldr r0, _08099ABC @ =gUnknown_2037F1A
	b _08099AC2
	.align 2, 0
_08099AB4: .4byte gUnknown_2037F02
_08099AB8: .4byte gUnknown_3005090
_08099ABC: .4byte gUnknown_2037F1A
_08099AC0:
	ldr r0, _08099AF0 @ =gUnknown_2037F1B
_08099AC2:
	ldrb r0, [r0]
	bl GetBankSide
	lsls r0, 24
	cmp r0, 0
	beq _08099AD4
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_08099AD4:
	ldr r0, _08099AF4 @ =gUnknown_2037F02
	movs r2, 0x6
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0x1
	beq _08099AFC
	ldr r2, _08099AF8 @ =gUnknown_3005090
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0xE]
	b _08099B16
	.align 2, 0
_08099AF0: .4byte gUnknown_2037F1B
_08099AF4: .4byte gUnknown_2037F02
_08099AF8: .4byte gUnknown_3005090
_08099AFC:
	ldr r3, _08099B4C @ =gUnknown_3005090
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r0, r3
	ldrh r2, [r6]
	ldrh r1, [r6, 0x2]
	adds r7, r2, 0
	muls r7, r1
	adds r1, r7, 0
	strh r1, [r0, 0xE]
	adds r2, r3, 0
	adds r3, r4, 0
_08099B16:
	adds r1, r3, r5
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r6, 0x2]
	strh r0, [r1, 0x10]
	mov r0, r8
	strh r0, [r1, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r1, 0x14]
	movs r0, 0x1
	strh r0, [r1, 0x16]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0xE]
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	negs r0, r0
	strh r0, [r1, 0x10]
	ldr r0, _08099B50 @ =sub_8099B54
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099B4C: .4byte gUnknown_3005090
_08099B50: .4byte sub_8099B54
	thumb_func_end sub_8099A78

	thumb_func_start sub_8099B54
sub_8099B54: @ 8099B54
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08099BAC @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrb r0, [r4, 0x12]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xE]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08099B88
	ldrb r0, [r4, 0x12]
	bl sub_80759DC
_08099B88:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08099BCE
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08099BB0
	cmp r0, 0x1
	ble _08099BB6
	cmp r0, 0x2
	beq _08099BBE
	b _08099BB6
	.align 2, 0
_08099BAC: .4byte gUnknown_3005090
_08099BB0:
	ldrb r0, [r4, 0x12]
	bl sub_8075980
_08099BB6:
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _08099BCE
_08099BBE:
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_08099BCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8099B54

	thumb_func_start sub_8099BD4
sub_8099BD4: @ 8099BD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08099C00 @ =gUnknown_2037F02
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, 0
	bne _08099C0C
	ldr r4, _08099C04 @ =gUnknown_3005090
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _08099C08 @ =gUnknown_2037EEC
	ldrh r0, [r0]
	movs r1, 0xC
	bl __udivsi3
	b _08099C20
	.align 2, 0
_08099C00: .4byte gUnknown_2037F02
_08099C04: .4byte gUnknown_3005090
_08099C08: .4byte gUnknown_2037EEC
_08099C0C:
	ldr r4, _08099CA8 @ =gUnknown_3005090
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _08099CAC @ =gUnknown_2037EE8
	ldr r0, [r0]
	movs r1, 0xC
	bl __divsi3
_08099C20:
	strh r0, [r6, 0x26]
	lsls r0, 16
	adds r1, r4, 0
	cmp r0, 0
	bgt _08099C2E
	movs r0, 0x1
	strh r0, [r6, 0x26]
_08099C2E:
	movs r2, 0x26
	ldrsh r0, [r6, r2]
	cmp r0, 0x10
	ble _08099C3A
	movs r0, 0x10
	strh r0, [r6, 0x26]
_08099C3A:
	adds r4, r5, r7
	lsls r4, 3
	adds r4, r1
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	movs r5, 0
	strh r1, [r4, 0x24]
	ldrh r2, [r4, 0x26]
	movs r0, 0x1
	ands r0, r2
	adds r1, r0
	strh r1, [r4, 0x22]
	strh r5, [r4, 0x20]
	mov r1, r8
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x1E]
	movs r0, 0x1
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	ldr r2, _08099CB0 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x18]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x1A]
	strh r5, [r4, 0x8]
	mov r1, r8
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _08099CB4 @ =sub_8099CB8
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099CA8: .4byte gUnknown_3005090
_08099CAC: .4byte gUnknown_2037EE8
_08099CB0: .4byte gSprites
_08099CB4: .4byte sub_8099CB8
	thumb_func_end sub_8099BD4

	thumb_func_start sub_8099CB8
sub_8099CB8: @ 8099CB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08099D0C @ =gUnknown_3005090
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _08099D96
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0x20]
	adds r1, r0, 0x1
	movs r0, 0x1
	ands r1, r0
	strh r1, [r3, 0x20]
	movs r2, 0x1C
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _08099D2A
	cmp r1, 0
	beq _08099D14
	ldr r2, _08099D10 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x18]
	adds r1, r2
	b _08099D28
	.align 2, 0
_08099D0C: .4byte gUnknown_3005090
_08099D10: .4byte gSprites
_08099D14:
	ldr r2, _08099D50 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x18]
	ldrh r2, [r3, 0x24]
	subs r1, r2
_08099D28:
	strh r1, [r0, 0x24]
_08099D2A:
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08099D64
	movs r2, 0x20
	ldrsh r4, [r3, r2]
	cmp r4, 0
	beq _08099D54
	ldr r2, _08099D50 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x26]
	strh r1, [r0, 0x26]
	b _08099D64
	.align 2, 0
_08099D50: .4byte gSprites
_08099D54:
	ldr r2, _08099D9C @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
_08099D64:
	ldrh r0, [r3, 0xC]
	subs r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r4, r0, 16
	cmp r4, 0
	bne _08099D96
	ldr r2, _08099D9C @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x24]
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_08099D96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099D9C: .4byte gSprites
	thumb_func_end sub_8099CB8

	.align 2, 0 @ Don't pad with nop.
