	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80EE704
sub_80EE704: @ 80EE704
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080EE740
	cmp r0, 0x1
	bgt _080EE71A
	cmp r0, 0
	beq _080EE726
	b _080EE846
_080EE71A:
	cmp r0, 0x2
	beq _080EE7C4
	cmp r0, 0x3
	bne _080EE724
	b _080EE824
_080EE724:
	b _080EE846
_080EE726:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080EE736
	b _080EE846
_080EE736:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080EE818
_080EE740:
	ldrh r2, [r4, 0x3C]
	ldrh r3, [r4, 0x32]
	adds r1, r2, r3
	movs r5, 0
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x8
	strh r0, [r4, 0x34]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x24]
	ldr r1, _080EE7B0 @ =gSineTable
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _080EE7B4 @ =gUnknown_203AB04
	ldrh r0, [r0]
	muls r0, r1
	ldr r1, _080EE7B8 @ =gUnknown_203AB08
	ldrh r1, [r1]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	ldr r0, _080EE7BC @ =gUnknown_203AB06
	ldrh r0, [r0]
	cmp r1, r0
	ble _080EE78C
	strh r5, [r4, 0x38]
	subs r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080EE78C:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080EE846
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
	ldr r0, _080EE7C0 @ =0x00004757
	strh r0, [r4, 0x3A]
	movs r0, 0x1C
	strh r0, [r4, 0x3C]
	b _080EE818
	.align 2, 0
_080EE7B0: .4byte gSineTable
_080EE7B4: .4byte gUnknown_203AB04
_080EE7B8: .4byte gUnknown_203AB08
_080EE7BC: .4byte gUnknown_203AB06
_080EE7C0: .4byte 0x00004757
_080EE7C4:
	ldrh r0, [r4, 0x3C]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r1, r0, 20
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080EE804
	ldrh r0, [r4, 0x20]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r3, 0x3A
	ldrsh r2, [r4, r3]
	bl sub_80EE864
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	ldr r0, _080EE820 @ =0x41c64e6d
	muls r0, r1
	strh r0, [r4, 0x3A]
_080EE804:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0xC
	ble _080EE846
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0x30]
_080EE818:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EE846
	.align 2, 0
_080EE820: .4byte 0x41c64e6d
_080EE824:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080EE846
	ldr r0, _080EE84C @ =gUnknown_203AB0A
	ldrh r1, [r0]
	ldrh r2, [r4, 0x24]
	negs r2, r2
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	movs r3, 0x4
	bl sub_80EE970
_080EE846:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE84C: .4byte gUnknown_203AB0A
	thumb_func_end sub_80EE704

	thumb_func_start sub_80EE850
sub_80EE850: @ 80EE850
	ldr r0, [r0, 0x18]
	ldr r1, [r0, 0x1C]
	ldr r0, _080EE860 @ =SpriteCallbackDummy
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_080EE860: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE850

	thumb_func_start sub_80EE864
sub_80EE864: @ 80EE864
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r2, 16
	lsrs r5, r2, 16
	movs r6, 0
	lsls r0, 16
	ldr r2, _080EE8D4 @ =0xffea0000
	adds r2, r0
	mov r8, r2
	lsls r1, 16
	movs r0, 0xC0
	lsls r0, 13
	adds r7, r1, r0
_080EE880:
	ldr r0, _080EE8D8 @ =gUnknown_840BEC4
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080EE8C4
	ldr r0, _080EE8DC @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	lsls r5, 16
	asrs r5, 16
	adds r0, r5, 0
	movs r1, 0xD
	bl __modsi3
	adds r0, 0x8
	strh r0, [r4, 0x34]
	adds r0, r5, 0
	movs r1, 0x3
	bl __modsi3
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x3C]
	ldr r0, _080EE8E0 @ =0x41c64e6d
	muls r0, r5
	lsls r0, 16
	lsrs r5, r0, 16
_080EE8C4:
	adds r6, 0x1
	cmp r6, 0x1
	ble _080EE880
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE8D4: .4byte 0xffea0000
_080EE8D8: .4byte gUnknown_840BEC4
_080EE8DC: .4byte gSprites
_080EE8E0: .4byte 0x41c64e6d
	thumb_func_end sub_80EE864

	thumb_func_start sub_80EE8E4
sub_80EE8E4: @ 80EE8E4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x2E
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080EE8FA
	cmp r0, 0x1
	beq _080EE90C
	b _080EE93E
_080EE8FA:
	ldrh r0, [r5, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_080EE90C:
	ldrh r1, [r4, 0x2]
	ldrh r0, [r4, 0x6]
	subs r1, r0
	strh r1, [r4, 0x2]
	ldrh r0, [r4, 0x8]
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r4, 0x4]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x20]
	ldrh r0, [r4, 0x4]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080EE93E
	adds r0, r5, 0
	bl DestroySprite
_080EE93E:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080EE96A
	movs r0, 0
	strh r0, [r4, 0xE]
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080EE96A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80EE8E4

	thumb_func_start sub_80EE970
sub_80EE970: @ 80EE970
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	adds r6, r3, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	movs r1, 0
	mov r8, r1
	mov r1, r8
	strh r1, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldrh r1, [r4, 0x24]
	lsls r1, 4
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 12
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	movs r0, 0x80
	lsls r0, 4
	adds r1, r5, 0
	bl __divsi3
	strh r0, [r4, 0x38]
	mov r1, r8
	strh r1, [r4, 0x3A]
	strh r6, [r4, 0x3C]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, _080EE9D0 @ =sub_80EE9D4
	str r0, [r4, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE9D0: .4byte sub_80EE9D4
	thumb_func_end sub_80EE970

	thumb_func_start sub_80EE9D4
sub_80EE9D4: @ 80EE9D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080EEA08
	cmp r5, 0x1
	bgt _080EE9EA
	cmp r5, 0
	beq _080EE9F0
	b _080EEA88
_080EE9EA:
	cmp r5, 0x2
	beq _080EEA6E
	b _080EEA88
_080EE9F0:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080EEA88
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080EEA64
_080EEA08:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0
	beq _080EEA4C
	ldrh r1, [r4, 0x34]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x24]
	ldr r1, _080EEA48 @ =gSineTable
	lsls r0, 16
	asrs r0, 20
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	b _080EEA88
	.align 2, 0
_080EEA48: .4byte gSineTable
_080EEA4C:
	ldrh r0, [r4, 0x32]
	lsrs r0, 4
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x26]
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	beq _080EEA84
_080EEA64:
	strh r5, [r4, 0x3A]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EEA88
_080EEA6E:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080EEA88
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080EEA84:
	ldr r0, _080EEA90 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EEA88:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEA90: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EE9D4

	thumb_func_start sub_80EEA94
sub_80EEA94: @ 80EEA94
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x18]
	movs r2, 0
	strh r2, [r0, 0x2E]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x30]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x32]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x34]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x36]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x38]
	ldr r1, [r4, 0x18]
	ldrh r0, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	strh r0, [r1, 0x20]
	ldr r0, [r4, 0x18]
	strh r2, [r0, 0x24]
	ldr r1, _080EEAF4 @ =gUnknown_203AB0C
	movs r0, 0x24
	strh r0, [r1]
	ldr r1, _080EEAF8 @ =gUnknown_203AB06
	movs r0, 0x28
	strh r0, [r1]
	ldr r1, _080EEAFC @ =gUnknown_203AB04
	movs r0, 0x3
	strh r0, [r1]
	ldr r1, _080EEB00 @ =gUnknown_203AB08
	movs r0, 0x4
	strh r0, [r1]
	ldr r1, [r4, 0x18]
	movs r0, 0x24
	strh r0, [r1, 0x3C]
	ldr r0, [r4, 0x18]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r1, [r4, 0x18]
	ldr r0, _080EEB04 @ =sub_80EEB08
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EEAF4: .4byte gUnknown_203AB0C
_080EEAF8: .4byte gUnknown_203AB06
_080EEAFC: .4byte gUnknown_203AB04
_080EEB00: .4byte gUnknown_203AB08
_080EEB04: .4byte sub_80EEB08
	thumb_func_end sub_80EEA94

	thumb_func_start sub_80EEB08
sub_80EEB08: @ 80EEB08
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080EEB58
	cmp r0, 0x1
	bgt _080EEB1E
	cmp r0, 0
	beq _080EEB24
	b _080EEBCE
_080EEB1E:
	cmp r0, 0x2
	beq _080EEB84
	b _080EEBCE
_080EEB24:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EEB4A
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ands r0, r1
	cmp r0, 0
	beq _080EEB44
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	b _080EEB48
_080EEB44:
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
_080EEB48:
	strh r0, [r4, 0x24]
_080EEB4A:
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x11
	ble _080EEBCE
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080EEB78
_080EEB58:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _080EEB80 @ =gUnknown_203AB06
	ldrh r1, [r1]
	cmp r0, r1
	blt _080EEBCE
	adds r0, r4, 0
	movs r1, 0x4
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
_080EEB78:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080EEBCE
	.align 2, 0
_080EEB80: .4byte gUnknown_203AB06
_080EEB84:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x30]
	adds r0, r2, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	negs r1, r0
	strh r1, [r4, 0x24]
	ldr r1, _080EEBD4 @ =gSineTable
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _080EEBD8 @ =gUnknown_203AB04
	ldrh r0, [r0]
	muls r0, r1
	ldr r1, _080EEBDC @ =gUnknown_203AB08
	ldrh r1, [r1]
	asrs r0, r1
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080EEBC0
	subs r0, r2, 0x1
	strh r0, [r4, 0x3C]
_080EEBC0:
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 20
	cmp r0, 0x3F
	ble _080EEBCE
	ldr r0, _080EEBE0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080EEBCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEBD4: .4byte gSineTable
_080EEBD8: .4byte gUnknown_203AB04
_080EEBDC: .4byte gUnknown_203AB08
_080EEBE0: .4byte SpriteCallbackDummy
	thumb_func_end sub_80EEB08

	thumb_func_start sub_80EEBE4
sub_80EEBE4: @ 80EEBE4
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _080EEC04 @ =gUnknown_840BEDC
_080EEBEA:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x6
	bls _080EEBEA
	ldr r0, _080EEC08 @ =gUnknown_840BF14
	bl LoadSpritePalettes
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EEC04: .4byte gUnknown_840BEDC
_080EEC08: .4byte gUnknown_840BF14
	thumb_func_end sub_80EEBE4

	.align 2, 0 @ Don't pad with nop.
