	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B1620
sub_80B1620: @ 80B1620
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080B1674 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B1636
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080B1636:
	adds r0, r5, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r4, _080B1678 @ =gBattleAnimTarget
	ldrb r0, [r4]
	movs r1, 0x2
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080B167C @ =0x0000ffe2
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl InitAnimArcTranslation
	ldr r0, _080B1680 @ =sub_80B1684
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1674: .4byte gBattleAnimArgs
_080B1678: .4byte gBattleAnimTarget
_080B167C: .4byte 0x0000ffe2
_080B1680: .4byte sub_80B1684
	thumb_func_end sub_80B1620

	thumb_func_start sub_80B1684
sub_80B1684: @ 80B1684
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateAnimHorizontalArc
	lsls r0, 24
	cmp r0, 0
	beq _080B1698
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B1698:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1684

	thumb_func_start sub_80B16A0
sub_80B16A0: @ 80B16A0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r5, _080B1714 @ =gBattleAnimArgs
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B16B8
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080B16B8:
	adds r0, r4, 0
	movs r1, 0x1
	bl InitSpritePosToAnimAttacker
	ldr r0, _080B1718 @ =gBattleAnimTarget
	ldrb r0, [r0]
	mov r6, sp
	adds r6, 0x2
	movs r1, 0x1
	mov r2, sp
	adds r3, r6, 0
	bl SetAverageBattlerPositions
	ldr r0, _080B171C @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B16E6
	ldrh r0, [r5, 0x8]
	negs r0, r0
	strh r0, [r5, 0x8]
_080B16E6:
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	mov r1, sp
	ldrh r0, [r5, 0x8]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r6, [r6]
	adds r0, r6
	strh r0, [r4, 0x36]
	ldr r0, _080B1720 @ =0x0000ffe2
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl InitAnimArcTranslation
	ldr r0, _080B1724 @ =sub_80B1728
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1714: .4byte gBattleAnimArgs
_080B1718: .4byte gBattleAnimTarget
_080B171C: .4byte gBattleAnimAttacker
_080B1720: .4byte 0x0000ffe2
_080B1724: .4byte sub_80B1728
	thumb_func_end sub_80B16A0

	thumb_func_start sub_80B1728
sub_80B1728: @ 80B1728
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateAnimHorizontalArc
	lsls r0, 24
	cmp r0, 0
	beq _080B173C
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B173C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1728

	thumb_func_start sub_80B1744
sub_80B1744: @ 80B1744
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B1790 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl InitSpriteDataForLinearTranslation
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x38]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x3A]
	ldr r0, _080B1794 @ =sub_80B1798
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1790: .4byte gBattleAnimArgs
_080B1794: .4byte sub_80B1798
	thumb_func_end sub_80B1744

	thumb_func_start sub_80B1798
sub_80B1798: @ 80B1798
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateSpriteLinearFixedPoint
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x3A]
	subs r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080B17BE
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B17BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1798

	thumb_func_start sub_80B17C4
sub_80B17C4: @ 80B17C4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080B1824 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl SetAverageBattlerPositions
	ldr r0, _080B1828 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B17F0
	ldr r1, _080B182C @ =gBattleAnimArgs
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080B17F0:
	ldr r0, _080B182C @ =gBattleAnimArgs
	ldrh r2, [r0]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	ldrh r3, [r0, 0x8]
	strh r3, [r4, 0x2E]
	ldrh r0, [r0, 0x4]
	adds r2, r0
	strh r2, [r4, 0x32]
	adds r1, r3
	strh r1, [r4, 0x36]
	ldr r0, _080B1830 @ =StartAnimLinearTranslation
	str r0, [r4, 0x1C]
	ldr r1, _080B1834 @ =DestroyAnimSprite
	adds r0, r4, 0
	bl StoreSpriteCallbackInData6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1824: .4byte gBattleAnimTarget
_080B1828: .4byte gBattleAnimAttacker
_080B182C: .4byte gBattleAnimArgs
_080B1830: .4byte StartAnimLinearTranslation
_080B1834: .4byte DestroyAnimSprite
	thumb_func_end sub_80B17C4

	thumb_func_start sub_80B1838
sub_80B1838: @ 80B1838
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B1850 @ =gBattleAnimArgs
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080B1854
	adds r0, r4, 0
	movs r1, 0x1
	bl InitSpritePosToAnimTarget
	b _080B188A
	.align 2, 0
_080B1850: .4byte gBattleAnimArgs
_080B1854:
	ldr r0, _080B1894 @ =gBattleAnimTarget
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl SetAverageBattlerPositions
	ldr r0, _080B1898 @ =gBattleAnimAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _080B187A
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080B187A:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080B188A:
	ldr r0, _080B189C @ =sub_80B18A0
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1894: .4byte gBattleAnimTarget
_080B1898: .4byte gBattleAnimAttacker
_080B189C: .4byte sub_80B18A0
	thumb_func_end sub_80B1838

	thumb_func_start sub_80B18A0
sub_80B18A0: @ 80B18A0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x30
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B18DC
	adds r0, r4, 0
	bl DestroyAnimSprite
_080B18DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B18A0

	.align 2, 0 @ Don't pad with nop.
