	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B8B6C
sub_80B8B6C: @ 80B8B6C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B8BC4 @ =gBattleAnimAttacker
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080B8BC8 @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080B8BCC @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_8075068
	ldr r0, _080B8BD0 @ =sub_80B8BD4
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8BC4: .4byte gBattleAnimAttacker
_080B8BC8: .4byte gBattleAnimTarget
_080B8BCC: .4byte 0x0000ffd8
_080B8BD0: .4byte sub_80B8BD4
	thumb_func_end sub_80B8B6C

	thumb_func_start sub_80B8BD4
sub_80B8BD4: @ 80B8BD4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B8C28
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	movs r0, 0x14
	strh r0, [r5, 0x2E]
	ldr r4, _080B8C30 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	movs r0, 0x28
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080B8C34 @ =sub_80B8C38
	str r0, [r5, 0x1C]
_080B8C28:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8C30: .4byte gBattleAnimAttacker
_080B8C34: .4byte sub_80B8C38
	thumb_func_end sub_80B8BD4

	thumb_func_start sub_80B8C38
sub_80B8C38: @ 80B8C38
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B8C4C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B8C4C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B8C38

	thumb_func_start sub_80B8C54
sub_80B8C54: @ 80B8C54
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075114
	ldr r0, _080B8CB4 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B8C74
	ldr r1, _080B8CB8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B8C74:
	ldr r4, _080B8CB8 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080B8CBC @ =gBattleAnimTarget
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	ldr r0, _080B8CC0 @ =sub_8075590
	str r0, [r6, 0x1C]
	ldr r1, _080B8CC4 @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8CB4: .4byte gBattleAnimAttacker
_080B8CB8: .4byte gBattleAnimArgs
_080B8CBC: .4byte gBattleAnimTarget
_080B8CC0: .4byte sub_8075590
_080B8CC4: .4byte DestroyAnimSprite
	thumb_func_end sub_80B8C54

	thumb_func_start sub_80B8CC8
sub_80B8CC8: @ 80B8CC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8075160
	ldr r4, _080B8D48 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074844
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074844
	lsls r0, 24
	lsrs r7, r0, 24
	bl Random
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	bl Random
	ands r4, r0
	adds r1, r5, 0
	cmp r1, 0x10
	ble _080B8D10
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080B8D10:
	lsls r0, r4, 16
	asrs r1, r0, 16
	cmp r1, 0x10
	ble _080B8D20
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080B8D20:
	ldr r0, _080B8D4C @ =gBattleAnimArgs
	ldrh r0, [r0, 0x4]
	strh r0, [r6, 0x2E]
	mov r1, r8
	adds r0, r1, r5
	strh r0, [r6, 0x32]
	adds r0, r7, r4
	strh r0, [r6, 0x36]
	ldr r0, _080B8D50 @ =sub_8075590
	str r0, [r6, 0x1C]
	ldr r1, _080B8D54 @ =move_anim_8074EE0
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8D48: .4byte gBattleAnimTarget
_080B8D4C: .4byte gBattleAnimArgs
_080B8D50: .4byte sub_8075590
_080B8D54: .4byte move_anim_8074EE0
	thumb_func_end sub_80B8CC8

	thumb_func_start sub_80B8D58
sub_80B8D58: @ 80B8D58
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x1
	ldr r3, _080B8DB8 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080B8DBC @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r6, _080B8DC0 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080B8DCC
	ldr r4, _080B8DC4 @ =gBattleAnimAttacker
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x2]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r6, 0x4]
	adds r0, r3
	strh r0, [r5, 0x22]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	ble _080B8DB2
	movs r1, 0x1
_080B8DB2:
	strh r1, [r5, 0x2E]
	ldr r0, _080B8DC8 @ =sub_80B8DE8
	b _080B8DDA
	.align 2, 0
_080B8DB8: .4byte 0x000003ff
_080B8DBC: .4byte 0xfffffc00
_080B8DC0: .4byte gBattleAnimArgs
_080B8DC4: .4byte gBattleAnimAttacker
_080B8DC8: .4byte sub_80B8DE8
_080B8DCC:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x22]
	negs r0, r0
	strh r0, [r5, 0x26]
	ldr r0, _080B8DE4 @ =sub_80B8E24
_080B8DDA:
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8DE4: .4byte sub_80B8E24
	thumb_func_end sub_80B8D58

	thumb_func_start sub_80B8DE8
sub_80B8DE8: @ 80B8DE8
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B8E06
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
_080B8E06:
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x4
	negs r1, r1
	cmp r0, r1
	bge _080B8E1E
	adds r0, r2, 0
	bl DestroyAnimSprite
_080B8E1E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B8DE8

	thumb_func_start sub_80B8E24
sub_80B8E24: @ 80B8E24
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080B8E36
	cmp r1, 0x1
	beq _080B8E4C
	b _080B8E8E
_080B8E36:
	ldrh r0, [r3, 0x26]
	adds r0, 0x4
	strh r0, [r3, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B8E8E
	strh r1, [r3, 0x26]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080B8E8E
_080B8E4C:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _080B8E8E
	movs r0, 0
	strh r0, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080B8E8E
	adds r0, r3, 0
	bl DestroyAnimSprite
_080B8E8E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B8E24

	thumb_func_start sub_80B8E94
sub_80B8E94: @ 80B8E94
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B8EB4 @ =gTasks
	adds r1, r0, r1
	ldr r0, _080B8EB8 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080B8EC0
	ldr r0, _080B8EBC @ =sub_80B8ED4
	b _080B8EC2
	.align 2, 0
_080B8EB4: .4byte gTasks
_080B8EB8: .4byte gBattleAnimArgs
_080B8EBC: .4byte sub_80B8ED4
_080B8EC0:
	ldr r0, _080B8ED0 @ =sub_80B908C
_080B8EC2:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B8ED0: .4byte sub_80B908C
	thumb_func_end sub_80B8E94

	thumb_func_start sub_80B8ED4
sub_80B8ED4: @ 80B8ED4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B8EF8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080B8EEE
	b _080B9082
_080B8EEE:
	lsls r0, 2
	ldr r1, _080B8EFC @ =_080B8F00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8EF8: .4byte gTasks
_080B8EFC: .4byte _080B8F00
	.align 2, 0
_080B8F00:
	.4byte _080B8F14
	.4byte _080B8F9C
	.4byte _080B8FAC
	.4byte _080B9050
	.4byte _080B9064
_080B8F14:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080B8F3C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080B8F48
	ldr r0, _080B8F40 @ =gBattle_BG1_X
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B8F44 @ =gBattle_BG1_Y
	b _080B8F50
	.align 2, 0
_080B8F3C: .4byte gBattleAnimAttacker
_080B8F40: .4byte gBattle_BG1_X
_080B8F44: .4byte gBattle_BG1_Y
_080B8F48:
	ldr r0, _080B8F8C @ =gBattle_BG2_X
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B8F90 @ =gBattle_BG2_Y
_080B8F50:
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080B8F94 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	cmp r1, 0
	bge _080B8F72
	movs r0, 0
	strh r0, [r4, 0x24]
_080B8F72:
	ldr r2, _080B8F98 @ =gSprites
	movs r3, 0x1C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080B9056
	.align 2, 0
_080B8F8C: .4byte gBattle_BG2_X
_080B8F90: .4byte gBattle_BG2_Y
_080B8F94: .4byte gBattleAnimAttacker
_080B8F98: .4byte gSprites
_080B8F9C:
	ldrb r0, [r4, 0x1E]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	bl sub_80B92B8
	b _080B9056
_080B8FAC:
	ldrh r0, [r4, 0xC]
	adds r0, 0x6
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B8FCE
	movs r0, 0
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080B8FCE:
	ldr r1, _080B8FF0 @ =gSineTable
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	ldrh r3, [r4, 0xE]
	adds r2, r0, r3
	strh r2, [r4, 0x12]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B8FF8
	ldr r1, _080B8FF4 @ =gBattle_BG1_Y
	b _080B8FFA
	.align 2, 0
_080B8FF0: .4byte gSineTable
_080B8FF4: .4byte gBattle_BG1_Y
_080B8FF8:
	ldr r1, _080B901C @ =gBattle_BG2_Y
_080B8FFA:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x3F
	ble _080B9082
	ldrh r0, [r4, 0x24]
	movs r1, 0x78
	subs r2, r1, r0
	strh r2, [r4, 0x12]
	movs r3, 0x1E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080B9024
	ldr r1, _080B9020 @ =gBattle_BG1_Y
	b _080B9026
	.align 2, 0
_080B901C: .4byte gBattle_BG2_Y
_080B9020: .4byte gBattle_BG1_Y
_080B9024:
	ldr r1, _080B9048 @ =gBattle_BG2_Y
_080B9026:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	ldr r2, _080B904C @ =gSprites
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r3, 0
	subs r0, r2
	strh r0, [r1, 0x24]
	b _080B9056
	.align 2, 0
_080B9048: .4byte gBattle_BG2_Y
_080B904C: .4byte gSprites
_080B9050:
	ldr r1, _080B9060 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B9056:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B9082
	.align 2, 0
_080B9060: .4byte gScanlineEffect
_080B9064:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	ldr r2, _080B9088 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080B9082:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9088: .4byte gSprites
	thumb_func_end sub_80B8ED4

	thumb_func_start sub_80B908C
sub_80B908C: @ 80B908C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B90CC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r3]
	movs r4, 0
	strh r4, [r1, 0x24]
	strh r4, [r1, 0x26]
	ldr r0, _080B90D0 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B90D8
	ldr r0, _080B90D4 @ =gBattle_BG1_Y
	b _080B90DA
	.align 2, 0
_080B90CC: .4byte gSprites
_080B90D0: .4byte gBattleAnimAttacker
_080B90D4: .4byte gBattle_BG1_Y
_080B90D8:
	ldr r0, _080B90E8 @ =gBattle_BG2_Y
_080B90DA:
	strh r4, [r0]
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B90E8: .4byte gBattle_BG2_Y
	thumb_func_end sub_80B908C

	thumb_func_start sub_80B90EC
sub_80B90EC: @ 80B90EC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B910C @ =gTasks
	adds r1, r0, r1
	ldr r0, _080B9110 @ =gBattleAnimArgs
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080B9118
	ldr r0, _080B9114 @ =sub_80B912C
	b _080B911A
	.align 2, 0
_080B910C: .4byte gTasks
_080B9110: .4byte gBattleAnimArgs
_080B9114: .4byte sub_80B912C
_080B9118:
	ldr r0, _080B9128 @ =sub_80B91B0
_080B911A:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B9128: .4byte sub_80B91B0
	thumb_func_end sub_80B90EC

	thumb_func_start sub_80B912C
sub_80B912C: @ 80B912C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B914C @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080B9150
	cmp r5, 0x1
	beq _080B91A4
	b _080B91AA
	.align 2, 0
_080B914C: .4byte gTasks
_080B9150:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r3, _080B91A0 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r5, [r0, 0x24]
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x22]
	movs r0, 0xA0
	subs r0, r2
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B91AA
	.align 2, 0
_080B91A0: .4byte gSprites
_080B91A4:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B91AA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B912C

	thumb_func_start sub_80B91B0
sub_80B91B0: @ 80B91B0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B91D4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _080B92B2
	lsls r0, 2
	ldr r1, _080B91D8 @ =_080B91DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B91D4: .4byte gTasks
_080B91D8: .4byte _080B91DC
	.align 2, 0
_080B91DC:
	.4byte _080B91F0
	.4byte _080B9244
	.4byte _080B9252
	.4byte _080B926C
	.4byte _080B92AC
_080B91F0:
	movs r0, 0
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080B9214 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_80768B0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080B921C
	ldr r0, _080B9218 @ =gBattle_BG1_X
	b _080B921E
	.align 2, 0
_080B9214: .4byte gBattleAnimAttacker
_080B9218: .4byte gBattle_BG1_X
_080B921C:
	ldr r0, _080B923C @ =gBattle_BG2_X
_080B921E:
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080B9240 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	b _080B929A
	.align 2, 0
_080B923C: .4byte gBattle_BG2_X
_080B9240: .4byte gBattleAnimAttacker
_080B9244:
	ldrb r0, [r4, 0x1E]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0
	bl sub_80B92B8
	b _080B929A
_080B9252:
	ldr r2, _080B9268 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x60
	strh r1, [r0, 0x26]
	b _080B929A
	.align 2, 0
_080B9268: .4byte gSprites
_080B926C:
	ldr r2, _080B92A4 @ =gSprites
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B92B2
	ldr r1, _080B92A8 @ =gScanlineEffect
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080B929A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B92B2
	.align 2, 0
_080B92A4: .4byte gSprites
_080B92A8: .4byte gScanlineEffect
_080B92AC:
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B92B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B91B0

	thumb_func_start sub_80B92B8
sub_80B92B8: @ 80B92B8
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r0, 0x1
	bne _080B92DC
	ldr r0, _080B92D4 @ =gBattle_BG1_X
	ldrh r3, [r0]
	ldr r0, _080B92D8 @ =0x04000014
	b _080B92E2
	.align 2, 0
_080B92D4: .4byte gBattle_BG1_X
_080B92D8: .4byte 0x04000014
_080B92DC:
	ldr r0, _080B9368 @ =gBattle_BG2_X
	ldrh r3, [r0]
	ldr r0, _080B936C @ =0x04000018
_080B92E2:
	str r0, [sp]
	lsls r0, r1, 16
	cmp r0, 0
	bge _080B92EC
	movs r1, 0
_080B92EC:
	lsls r2, r1, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	cmp r2, r0
	bge _080B9318
	ldr r5, _080B9370 @ =gScanlineEffectRegBuffers
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080B92FE:
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r5
	strh r3, [r0]
	adds r1, r6
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 16
	lsrs r1, r2, 16
	lsls r2, r1, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _080B92FE
_080B9318:
	lsls r1, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080B9346
	ldr r4, _080B9370 @ =gScanlineEffectRegBuffers
	lsls r0, r3, 16
	asrs r0, 16
	adds r3, r0, 0
	adds r3, 0xF0
	movs r0, 0xF0
	lsls r0, 3
	adds r5, r4, r0
_080B9330:
	asrs r2, r1, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	adds r2, 0x1
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080B9330
_080B9346:
	ldr r0, _080B9374 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl ScanlineEffect_SetParams
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9368: .4byte gBattle_BG2_X
_080B936C: .4byte 0x04000018
_080B9370: .4byte gScanlineEffectRegBuffers
_080B9374: .4byte 0xa2600001
	thumb_func_end sub_80B92B8

	thumb_func_start sub_80B9378
sub_80B9378: @ 80B9378
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080B938C @ =gBattleAnimArgs
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r7, r0, 0
	cmp r1, 0
	bne _080B9394
	ldr r0, _080B9390 @ =gBattleAnimAttacker
	b _080B9396
	.align 2, 0
_080B938C: .4byte gBattleAnimArgs
_080B9390: .4byte gBattleAnimAttacker
_080B9394:
	ldr r0, _080B93F8 @ =gBattleAnimTarget
_080B9396:
	ldrb r4, [r0]
	movs r6, 0x18
	adds r1, r7, 0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080B93B2
	negs r0, r6
	lsls r0, 16
	lsrs r6, r0, 16
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x4]
_080B93B2:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1E
	strh r0, [r5, 0x22]
	ldrh r1, [r7, 0xA]
	strh r1, [r5, 0x2E]
	ldrh r1, [r7, 0x4]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x32]
	ldrh r1, [r7, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_8075068
	ldr r0, _080B93FC @ =sub_80B9400
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B93F8: .4byte gBattleAnimTarget
_080B93FC: .4byte sub_80B9400
	thumb_func_end sub_80B9378

	thumb_func_start sub_80B9400
sub_80B9400: @ 80B9400
	push {r4,lr}
	adds r4, r0, 0
	bl AnimateBallThrow
	lsls r0, 24
	cmp r0, 0
	beq _080B9414
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B9414:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9400

	thumb_func_start sub_80B941C
sub_80B941C: @ 80B941C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080B9430 @ =gBattleAnimArgs
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080B9438
	ldr r0, _080B9434 @ =gBattleAnimAttacker
	b _080B943A
	.align 2, 0
_080B9430: .4byte gBattleAnimArgs
_080B9434: .4byte gBattleAnimAttacker
_080B9438:
	ldr r0, _080B9498 @ =gBattleAnimTarget
_080B943A:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B949C @ =0x0000fff0
	adds r0, r2
	ldr r4, _080B94A0 @ =gBattleAnimArgs
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	lsls r1, 5
	adds r0, r1
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	bl sub_807492C
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r6, 0x22]
	ldrh r2, [r6, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r1, r0
	ldr r3, _080B94A4 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080B94A8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080B94AC @ =DestroyAnimSprite
	adds r0, r6, 0
	bl StoreSpriteCallbackInData6
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x2E]
	ldr r0, _080B94B0 @ =sub_8074C44
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9498: .4byte gBattleAnimTarget
_080B949C: .4byte 0x0000fff0
_080B94A0: .4byte gBattleAnimArgs
_080B94A4: .4byte 0x000003ff
_080B94A8: .4byte 0xfffffc00
_080B94AC: .4byte DestroyAnimSprite
_080B94B0: .4byte sub_8074C44
	thumb_func_end sub_80B941C

	thumb_func_start sub_80B94B4
sub_80B94B4: @ 80B94B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B94D8 @ =gTasks
	adds r4, r0, r1
	ldr r0, _080B94DC @ =gBattleAnimArgs
	ldrh r2, [r0, 0x2]
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	adds r6, r0, 0
	cmp r1, 0
	beq _080B94E0
	adds r0, r2, 0x3
	b _080B94EC
	.align 2, 0
_080B94D8: .4byte gTasks
_080B94DC: .4byte gBattleAnimArgs
_080B94E0:
	ldr r0, _080B950C @ =gAnimMovePower
	ldrh r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0x3
_080B94EC:
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x24]
	adds r1, r6, 0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xE]
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080B9518
	cmp r0, 0x5
	bne _080B9558
	ldr r0, _080B9510 @ =gBattle_BG3_X
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080B9514 @ =sub_80B9584
	b _080B9576
	.align 2, 0
_080B950C: .4byte gAnimMovePower
_080B9510: .4byte gBattle_BG3_X
_080B9514: .4byte sub_80B9584
_080B9518:
	movs r0, 0
	strh r0, [r4, 0x22]
	movs r5, 0
_080B951E:
	lsls r0, r5, 24
	lsrs r0, 24
	bl IsBattlerSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _080B9548
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	adds r0, 0x9
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x8
	adds r1, r0
	ldr r0, _080B9554 @ =gBattlerSpriteIds
	adds r0, r5, r0
	ldrb r0, [r0]
	strh r0, [r1]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080B9548:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080B951E
	b _080B9574
	.align 2, 0
_080B9554: .4byte gBattlerSpriteIds
_080B9558:
	ldrb r0, [r6]
	bl GetAnimBankSpriteId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	cmp r0, 0xFF
	bne _080B9570
	adds r0, r5, 0
	bl DestroyAnimVisualTask
	b _080B9578
_080B9570:
	movs r0, 0x1
	strh r0, [r4, 0x22]
_080B9574:
	ldr r0, _080B9580 @ =sub_80B967C
_080B9576:
	str r0, [r4]
_080B9578:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9580: .4byte sub_80B967C
	thumb_func_end sub_80B94B4

	thumb_func_start sub_80B9584
sub_80B9584: @ 80B9584
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080B95A8 @ =gTasks
	adds r3, r0, r1
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _080B9608
	cmp r1, 0x1
	bgt _080B95AC
	cmp r1, 0
	beq _080B95B2
	b _080B9674
	.align 2, 0
_080B95A8: .4byte gTasks
_080B95AC:
	cmp r1, 0x2
	beq _080B9668
	b _080B9674
_080B95B2:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9674
	strh r1, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B95DC
	ldr r1, _080B95D8 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080B95E6
	.align 2, 0
_080B95D8: .4byte gBattle_BG3_X
_080B95DC:
	ldr r0, _080B9604 @ =gBattle_BG3_X
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x26]
	subs r1, r2
	strh r1, [r0]
_080B95E6:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _080B9674
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	b _080B965C
	.align 2, 0
_080B9604: .4byte gBattle_BG3_X
_080B9608:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9674
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	ands r1, r0
	cmp r1, 0
	bne _080B9634
	ldr r1, _080B9630 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x24]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080B963E
	.align 2, 0
_080B9630: .4byte gBattle_BG3_X
_080B9634:
	ldr r0, _080B9664 @ =gBattle_BG3_X
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x24]
	subs r1, r2
	strh r1, [r0]
_080B963E:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080B9674
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080B9674
_080B965C:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080B9674
	.align 2, 0
_080B9664: .4byte gBattle_BG3_X
_080B9668:
	ldr r1, _080B9678 @ =gBattle_BG3_X
	ldrh r0, [r3, 0x22]
	strh r0, [r1]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
_080B9674:
	pop {r0}
	bx r0
	.align 2, 0
_080B9678: .4byte gBattle_BG3_X
	thumb_func_end sub_80B9584

	thumb_func_start sub_80B967C
sub_80B967C: @ 80B967C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080B96A0 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080B96DC
	cmp r5, 0x1
	bgt _080B96A4
	cmp r5, 0
	beq _080B96AA
	b _080B9756
	.align 2, 0
_080B96A0: .4byte gTasks
_080B96A4:
	cmp r5, 0x2
	beq _080B9718
	b _080B9756
_080B96AA:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9756
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80B9760
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080B9756
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	b _080B9710
_080B96DC:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080B9756
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80B9760
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080B9756
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080B9756
_080B9710:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B9756
_080B9718:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r2, r0
	bge _080B9750
	ldr r0, _080B975C @ =gSprites
	mov r12, r0
	adds r5, r4, 0
	adds r5, 0x8
	movs r6, 0
_080B972C:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r12
	strh r6, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080B972C
_080B9750:
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_080B9756:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B975C: .4byte gSprites
	thumb_func_end sub_80B967C

	thumb_func_start sub_80B9760
sub_80B9760: @ 80B9760
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0xC]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080B9788
	movs r0, 0x24
	ldrsh r1, [r3, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r2, [r3, 0x24]
	adds r0, r4, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	b _080B9798
_080B9788:
	movs r1, 0x24
	ldrsh r0, [r3, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
_080B9798:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r3, r7]
	cmp r2, r0
	bge _080B97CC
	ldr r6, _080B97D4 @ =gSprites
	adds r5, r3, 0
	adds r5, 0x8
_080B97A8:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r4, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	cmp r2, r0
	blt _080B97A8
_080B97CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B97D4: .4byte gSprites
	thumb_func_end sub_80B9760

	thumb_func_start sub_80B97D8
sub_80B97D8: @ 80B97D8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080B97F8 @ =gBattleAnimArgs
	movs r2, 0
	ldr r0, _080B97FC @ =gAnimMovePower
	ldrh r0, [r0]
	cmp r0, 0x63
	bls _080B97EC
	movs r2, 0x1
_080B97EC:
	strh r2, [r3, 0x1E]
	adds r0, r1, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_080B97F8: .4byte gBattleAnimArgs
_080B97FC: .4byte gAnimMovePower
	thumb_func_end sub_80B97D8

	thumb_func_start sub_80B9800
sub_80B9800: @ 80B9800
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _080B9818 @ =gBattleAnimArgs
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _080B9820
	ldr r0, _080B981C @ =gBattleAnimTarget
	b _080B9822
	.align 2, 0
_080B9818: .4byte gBattleAnimArgs
_080B981C: .4byte gBattleAnimTarget
_080B9820:
	ldr r0, _080B9890 @ =gBattleAnimAttacker
_080B9822:
	ldrb r0, [r0]
	adds r5, r0, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	ble _080B9832
	movs r0, 0x2
	eors r5, r0
_080B9832:
	ldr r0, _080B9894 @ =sub_80B98A8
	ldrb r1, [r6, 0x2]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B9898 @ =gTasks
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x20
	subs r1, r0
	ldr r2, _080B989C @ =0x000001ff
	adds r0, r2, 0
	ands r1, r0
	strh r1, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8074480
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x40
	subs r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0xC]
	ldr r2, _080B98A0 @ =gBattle_BG3_X
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	ldr r0, _080B98A4 @ =gBattle_BG3_Y
	strh r1, [r0]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0xE]
	adds r0, r7, 0
	bl DestroyAnimVisualTask
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9890: .4byte gBattleAnimAttacker
_080B9894: .4byte sub_80B98A8
_080B9898: .4byte gTasks
_080B989C: .4byte 0x000001ff
_080B98A0: .4byte gBattle_BG3_X
_080B98A4: .4byte gBattle_BG3_Y
	thumb_func_end sub_80B9800

	thumb_func_start sub_80B98A8
sub_80B98A8: @ 80B98A8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080B98D8 @ =gTasks
	adds r2, r0, r1
	ldr r0, _080B98DC @ =gBattleAnimArgs
	movs r4, 0xE
	ldrsh r1, [r0, r4]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _080B98E8
	ldr r0, _080B98E0 @ =gBattle_BG3_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080B98E4 @ =gBattle_BG3_Y
	strh r1, [r0]
	adds r0, r3, 0
	bl DestroyTask
	b _080B98F4
	.align 2, 0
_080B98D8: .4byte gTasks
_080B98DC: .4byte gBattleAnimArgs
_080B98E0: .4byte gBattle_BG3_X
_080B98E4: .4byte gBattle_BG3_Y
_080B98E8:
	ldr r1, _080B98FC @ =gBattle_BG3_X
	ldrh r0, [r2, 0xA]
	strh r0, [r1]
	ldr r1, _080B9900 @ =gBattle_BG3_Y
	ldrh r0, [r2, 0xC]
	strh r0, [r1]
_080B98F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B98FC: .4byte gBattle_BG3_X
_080B9900: .4byte gBattle_BG3_Y
	thumb_func_end sub_80B98A8

	.align 2, 0 @ Don't pad with nop.
