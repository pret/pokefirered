	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_814AD6C
sub_814AD6C: @ 814AD6C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r4, 0
	ldr r5, _0814ADAC @ =gUnknown_846E0B0
_0814AD74:
	adds r0, r5, 0
	bl LoadCompressedSpriteSheet
	adds r5, 0x8
	adds r4, 0x1
	cmp r4, 0x4
	bls _0814AD74
	movs r4, 0
	ldr r5, _0814ADB0 @ =gUnknown_846E0D8
_0814AD86:
	adds r0, r5, 0
	bl LoadSpritePalette
	adds r5, 0x8
	adds r4, 0x1
	cmp r4, 0x1
	bls _0814AD86
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	strb r0, [r6, 0xE]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	strb r0, [r6, 0xF]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814ADAC: .4byte gUnknown_846E0B0
_0814ADB0: .4byte gUnknown_846E0D8
	thumb_func_end sub_814AD6C

	thumb_func_start sub_814ADB4
sub_814ADB4: @ 814ADB4
	push {lr}
	movs r2, 0
	movs r1, 0x7
	adds r0, 0x3C
_0814ADBC:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0814ADBC
	pop {r0}
	bx r0
	thumb_func_end sub_814ADB4

	thumb_func_start sub_814ADCC
sub_814ADCC: @ 814ADCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	mov r9, r0
	adds r7, r1, 0
	ldr r0, [sp, 0x54]
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x28]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x2C]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, sp
	ldr r0, _0814AE20 @ =gUnknown_846E0E8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x80
	lsls r0, 6
	bl Alloc
	mov r8, r0
	movs r0, 0x80
	lsls r0, 4
	bl Alloc
	mov r10, r0
	bl sub_81499B4
	lsls r0, 16
	lsrs r0, 16
	cmp r6, r0
	bne _0814AE24
	movs r0, 0x3
	b _0814AE2A
	.align 2, 0
_0814AE20: .4byte gUnknown_846E0E8
_0814AE24:
	adds r0, r6, 0x4
	lsls r0, 24
	lsrs r0, 24
_0814AE2A:
	str r0, [sp, 0x30]
	mov r1, r8
	cmp r1, 0
	beq _0814AEEC
	mov r2, r10
	cmp r2, 0
	beq _0814AEEC
	ldrh r2, [r7]
	lsls r0, r2, 3
	ldr r1, _0814AED8 @ =gMonFrontPicTable
	adds r0, r1
	ldr r3, [r7, 0x8]
	mov r1, r8
	bl HandleLoadSpecialPokePic
	mov r3, r8
	str r3, [sp, 0x18]
	adds r4, r6, 0
	add r0, sp, 0x18
	ldr r5, _0814AEDC @ =0xffff0000
	lsls r1, r4, 16
	movs r2, 0x80
	lsls r2, 4
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpriteSheet
	ldrh r0, [r7]
	ldr r1, [r7, 0x4]
	ldr r2, [r7, 0x8]
	bl GetMonSpritePalFromSpeciesAndPersonality
	str r0, [sp, 0x20]
	add r0, sp, 0x20
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r4
	str r1, [r0, 0x4]
	bl LoadCompressedSpritePalette
	mov r0, r8
	bl Free
	mov r0, r10
	bl Free
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r6
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	adds r0, r6
	strh r0, [r1, 0x2]
	ldr r4, [sp, 0x28]
	lsls r1, r4, 16
	asrs r1, 16
	ldr r0, [sp, 0x2C]
	lsls r2, r0, 16
	asrs r2, 16
	mov r0, sp
	ldr r3, [sp, 0x30]
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0814AEEC
	lsls r0, r6, 2
	ldr r2, _0814AEE0 @ =0x000081a8
	add r2, r9
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AEE4 @ =gSprites
	adds r0, r1
	str r0, [r2]
	ldr r0, _0814AEE8 @ =0x000081fc
	add r0, r9
	adds r0, r6
	add r1, sp, 0x30
	ldrb r1, [r1]
	strb r1, [r0]
	b _0814AEF8
	.align 2, 0
_0814AED8: .4byte gMonFrontPicTable
_0814AEDC: .4byte 0xffff0000
_0814AEE0: .4byte 0x000081a8
_0814AEE4: .4byte gSprites
_0814AEE8: .4byte 0x000081fc
_0814AEEC:
	lsls r0, r6, 2
	ldr r1, _0814AF08 @ =0x000081a8
	add r1, r9
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0814AEF8:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AF08: .4byte 0x000081a8
	thumb_func_end sub_814ADCC

	thumb_func_start sub_814AF0C
sub_814AF0C: @ 814AF0C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r6, r1, 2
	ldr r0, _0814AF64 @ =0x000081bc
	adds r5, r4, r0
	adds r5, r6
	ldr r0, [r5]
	bl sub_814ADB4
	ldr r2, [r5]
	ldr r0, _0814AF68 @ =0x000081a8
	adds r4, r0
	adds r4, r6
	ldr r1, [r4]
	ldr r0, _0814AF6C @ =gSprites
	subs r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r1, r0, 8
	adds r0, r1
	lsls r1, r0, 16
	adds r0, r1
	negs r0, r0
	asrs r0, 2
	strh r0, [r2, 0x3C]
	ldr r1, [r5]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r5]
	movs r0, 0x60
	strh r0, [r1, 0x22]
	ldr r0, [r5]
	ldr r1, _0814AF70 @ =sub_814AF74
	str r1, [r0, 0x1C]
	movs r1, 0x1
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814AF64: .4byte 0x000081bc
_0814AF68: .4byte 0x000081a8
_0814AF6C: .4byte gSprites
_0814AF70: .4byte sub_814AF74
	thumb_func_end sub_814AF0C

	thumb_func_start sub_814AF74
sub_814AF74: @ 814AF74
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _0814AFA0
	cmp r0, 0x1
	bgt _0814AF8A
	cmp r0, 0
	beq _0814AF90
	b _0814AFDE
_0814AF8A:
	cmp r0, 0x2
	beq _0814AFC0
	b _0814AFDE
_0814AF90:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0814AFDE
	b _0814AFCE
_0814AFA0:
	ldrh r1, [r2, 0x22]
	subs r1, 0x1
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x48
	bgt _0814AFDE
	movs r0, 0x48
	strh r0, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _0814AFDE
_0814AFC0:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _0814AFDE
_0814AFCE:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0814AFE4 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0814AFDE:
	pop {r0}
	bx r0
	.align 2, 0
_0814AFE4: .4byte SpriteCallbackDummy
	thumb_func_end sub_814AF74

	thumb_func_start sub_814AFE8
sub_814AFE8: @ 814AFE8
	push {lr}
	lsls r1, 2
	ldr r2, _0814B008 @ =0x000081a8
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	ldr r1, _0814B00C @ =sub_814B038
	str r1, [r2, 0x1C]
	movs r1, 0
	strh r1, [r2, 0x26]
	ldr r0, [r0]
	bl sub_814ADB4
	pop {r0}
	bx r0
	.align 2, 0
_0814B008: .4byte 0x000081a8
_0814B00C: .4byte sub_814B038
	thumb_func_end sub_814AFE8

	thumb_func_start sub_814B010
sub_814B010: @ 814B010
	push {lr}
	movs r2, 0
	lsls r1, 2
	ldr r3, _0814B030 @ =0x000081a8
	adds r0, r3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	ldr r0, _0814B034 @ =sub_814B038
	cmp r1, r0
	bne _0814B028
	movs r2, 0x1
_0814B028:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814B030: .4byte 0x000081a8
_0814B034: .4byte sub_814B038
	thumb_func_end sub_814B010

	thumb_func_start sub_814B038
sub_814B038: @ 814B038
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0814B064
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814B05C
	movs r0, 0x2
	b _0814B05E
_0814B05C:
	ldr r0, _0814B078 @ =0x0000fffe
_0814B05E:
	strh r0, [r2, 0x26]
	movs r0, 0
	strh r0, [r2, 0x30]
_0814B064:
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0xC
	ble _0814B074
	movs r0, 0
	strh r0, [r2, 0x26]
	ldr r0, _0814B07C @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0814B074:
	pop {r0}
	bx r0
	.align 2, 0
_0814B078: .4byte 0x0000fffe
_0814B07C: .4byte SpriteCallbackDummy
	thumb_func_end sub_814B038

	thumb_func_start sub_814B080
sub_814B080: @ 814B080
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 2
	ldr r0, _0814B0A0 @ =0x000081a8
	adds r4, r0
	adds r4, r1
	ldr r0, [r4]
	bl sub_814ADB4
	ldr r1, [r4]
	ldr r0, _0814B0A4 @ =sub_814B100
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B0A0: .4byte 0x000081a8
_0814B0A4: .4byte sub_814B100
	thumb_func_end sub_814B080

	thumb_func_start sub_814B0A8
sub_814B0A8: @ 814B0A8
	push {r4-r7,lr}
	adds r4, r0, 0
	bl sub_81499A4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _0814B0EC
	movs r1, 0x5
	negs r1, r1
	mov r12, r1
	ldr r1, _0814B0F4 @ =0x000081a8
	adds r3, r4, r1
	ldr r7, _0814B0F8 @ =sub_814B100
	ldr r6, _0814B0FC @ =SpriteCallbackDummy
	movs r5, 0xA
	adds r4, r0, 0
_0814B0CA:
	ldr r2, [r3]
	ldr r0, [r2, 0x1C]
	cmp r0, r7
	bne _0814B0E4
	adds r2, 0x3E
	ldrb r1, [r2]
	mov r0, r12
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	str r6, [r0, 0x1C]
	adds r0, 0x43
	strb r5, [r0]
_0814B0E4:
	adds r3, 0x4
	subs r4, 0x1
	cmp r4, 0
	bne _0814B0CA
_0814B0EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B0F4: .4byte 0x000081a8
_0814B0F8: .4byte sub_814B100
_0814B0FC: .4byte SpriteCallbackDummy
	thumb_func_end sub_814B0A8

	thumb_func_start sub_814B100
sub_814B100: @ 814B100
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0814B12E
	movs r0, 0
	strh r0, [r3, 0x2E]
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
_0814B12E:
	pop {r0}
	bx r0
	thumb_func_end sub_814B100

	thumb_func_start sub_814B134
sub_814B134: @ 814B134
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_81499A4
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	cmp r2, r3
	bge _0814B15E
	ldr r0, _0814B164 @ =0x000081fc
	adds r5, r4, r0
	subs r0, 0x54
	adds r4, r0
_0814B14E:
	ldm r4!, {r0}
	adds r1, r5, r2
	ldrb r1, [r1]
	adds r0, 0x43
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r3
	blt _0814B14E
_0814B15E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814B164: .4byte 0x000081fc
	thumb_func_end sub_814B134

	thumb_func_start sub_814B168
sub_814B168: @ 814B168
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 2
	ldr r0, _0814B188 @ =0x000081a8
	adds r4, r0
	adds r4, r1
	ldr r0, [r4]
	bl sub_814ADB4
	ldr r1, [r4]
	ldr r0, _0814B18C @ =sub_814B1CC
	str r0, [r1, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B188: .4byte 0x000081a8
_0814B18C: .4byte sub_814B1CC
	thumb_func_end sub_814B168

	thumb_func_start sub_814B190
sub_814B190: @ 814B190
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_81499A4
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	cmp r2, r3
	bge _0814B1C4
	ldr r5, _0814B1B4 @ =sub_814B1CC
	ldr r0, _0814B1B8 @ =0x000081a8
	adds r1, r4, r0
_0814B1A8:
	ldr r0, [r1]
	ldr r0, [r0, 0x1C]
	cmp r0, r5
	bne _0814B1BC
	movs r0, 0x1
	b _0814B1C6
	.align 2, 0
_0814B1B4: .4byte sub_814B1CC
_0814B1B8: .4byte 0x000081a8
_0814B1BC:
	adds r1, 0x4
	adds r2, 0x1
	cmp r2, r3
	blt _0814B1A8
_0814B1C4:
	movs r0, 0
_0814B1C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_814B190

	thumb_func_start sub_814B1CC
sub_814B1CC: @ 814B1CC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	cmp r4, 0
	beq _0814B1DE
	cmp r4, 0x1
	beq _0814B1EC
	b _0814B234
_0814B1DE:
	movs r0, 0x1C
	bl PlaySE
	strh r4, [r5, 0x30]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0814B1EC:
	ldrh r0, [r5, 0x30]
	adds r0, 0x4
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _0814B1FE
	movs r0, 0
	strh r0, [r5, 0x30]
_0814B1FE:
	ldr r1, _0814B22C @ =gSineTable
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	negs r0, r0
	strh r0, [r5, 0x26]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	cmp r1, 0
	bne _0814B234
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _0814B230
	strh r1, [r5, 0x2E]
	b _0814B234
	.align 2, 0
_0814B22C: .4byte gSineTable
_0814B230:
	ldr r0, _0814B23C @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
_0814B234:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814B23C: .4byte SpriteCallbackDummy
	thumb_func_end sub_814B1CC

	thumb_func_start sub_814B240
sub_814B240: @ 814B240
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, _0814B288 @ =gUnknown_846E2B4
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0814B280
	ldr r0, _0814B28C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r3]
	lsls r2, r4, 2
	ldr r3, _0814B290 @ =0x000081bc
	adds r0, r5, r3
	adds r0, r2
	str r1, [r0]
_0814B280:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814B288: .4byte gUnknown_846E2B4
_0814B28C: .4byte gSprites
_0814B290: .4byte 0x000081bc
	thumb_func_end sub_814B240

	thumb_func_start sub_814B294
sub_814B294: @ 814B294
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r5, 0
	movs r4, 0
	ldr r6, _0814B334 @ =gUnknown_846E100
_0814B29E:
	ldr r1, _0814B338 @ =gUnknown_846E160
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r2, _0814B33C @ =gUnknown_846E150
	lsls r1, r5, 1
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r6, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r5, 2
	ldr r3, _0814B340 @ =0x000081d0
	adds r2, r7, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B344 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r5, 0x1
	adds r6, 0x14
	adds r4, 0x1
	cmp r4, 0x3
	ble _0814B29E
	movs r4, 0x3
	movs r6, 0x3C
_0814B2E0:
	ldr r1, _0814B338 @ =gUnknown_846E160
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r2, _0814B33C @ =gUnknown_846E150
	lsls r1, r5, 1
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, _0814B334 @ =gUnknown_846E100
	adds r2, r6, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r5, 2
	ldr r3, _0814B340 @ =0x000081d0
	adds r2, r7, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B344 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	adds r5, 0x1
	subs r6, 0x14
	subs r4, 0x1
	cmp r4, 0
	bge _0814B2E0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B334: .4byte gUnknown_846E100
_0814B338: .4byte gUnknown_846E160
_0814B33C: .4byte gUnknown_846E150
_0814B340: .4byte 0x000081d0
_0814B344: .4byte gSprites
	thumb_func_end sub_814B294

	thumb_func_start sub_814B348
sub_814B348: @ 814B348
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp, 0x8]
	cmp r1, 0x5
	ble _0814B368
	movs r0, 0xA
	subs r1, r0, r1
	movs r0, 0x3
	str r0, [sp]
	ldr r2, [sp, 0x8]
	ldrb r0, [r2, 0xF]
	b _0814B370
_0814B368:
	movs r3, 0x2
	str r3, [sp]
	ldr r7, [sp, 0x8]
	ldrb r0, [r7, 0xE]
_0814B370:
	movs r6, 0
	lsls r2, r1, 1
	str r2, [sp, 0x4]
	lsls r0, 4
	mov r9, r0
	lsls r1, 24
	mov r8, r1
	ldr r0, _0814B434 @ =gUnknown_846E100
	adds r4, r2, r0
	ldr r3, [sp]
	lsls r3, 2
	mov r10, r3
	movs r5, 0x3
_0814B38A:
	lsls r0, r6, 2
	ldr r7, [sp, 0x8]
	ldr r1, _0814B438 @ =0x000081d0
	adds r2, r7, r1
	adds r2, r0
	ldr r1, [r2]
	ldrh r0, [r4]
	strh r0, [r1, 0x22]
	ldr r3, [r2]
	ldrb r0, [r3, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	mov r1, r10
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xF
	ands r0, r1
	mov r7, r9
	orrs r0, r7
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	mov r2, r8
	lsrs r1, r2, 24
	bl StartSpriteAnim
	adds r6, 0x1
	adds r4, 0x14
	subs r5, 0x1
	cmp r5, 0
	bge _0814B38A
	movs r5, 0x3
	ldr r0, _0814B434 @ =gUnknown_846E100
	ldr r3, [sp, 0x4]
	adds r0, r3, r0
	adds r4, r0, 0
	adds r4, 0x3C
	ldr r7, [sp]
	lsls r7, 2
	mov r10, r7
_0814B3E0:
	lsls r0, r6, 2
	ldr r1, [sp, 0x8]
	ldr r3, _0814B438 @ =0x000081d0
	adds r2, r1, r3
	adds r2, r0
	ldr r1, [r2]
	ldrh r0, [r4]
	strh r0, [r1, 0x22]
	ldr r3, [r2]
	ldrb r0, [r3, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	mov r1, r10
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xF
	ands r0, r1
	mov r7, r9
	orrs r0, r7
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	mov r2, r8
	lsrs r1, r2, 24
	bl StartSpriteAnim
	adds r6, 0x1
	subs r4, 0x14
	subs r5, 0x1
	cmp r5, 0
	bge _0814B3E0
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B434: .4byte gUnknown_846E100
_0814B438: .4byte 0x000081d0
	thumb_func_end sub_814B348

	thumb_func_start sub_814B43C
sub_814B43C: @ 814B43C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0x7
	movs r2, 0x78
	movs r3, 0x50
	bl StartMinigameCountdown
	adds r0, r4, 0
	bl sub_814B134
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814B43C

	thumb_func_start sub_814B460
sub_814B460: @ 814B460
	push {lr}
	bl IsMinigameCountdownRunning
	pop {r1}
	bx r1
	thumb_func_end sub_814B460

	thumb_func_start sub_814B46C
sub_814B46C: @ 814B46C
	ldr r0, _0814B478 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	bx lr
	.align 2, 0
_0814B478: .4byte gSaveBlock2Ptr
	thumb_func_end sub_814B46C

	thumb_func_start ResetPokeJumpResults
ResetPokeJumpResults: @ 814B47C
	push {lr}
	bl sub_814B46C
	movs r1, 0
	strh r1, [r0]
	str r1, [r0, 0xC]
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	str r1, [r0, 0x8]
	strh r1, [r0, 0x2]
	pop {r0}
	bx r0
	thumb_func_end ResetPokeJumpResults

	thumb_func_start sub_814B494
sub_814B494: @ 814B494
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	bl sub_814B46C
	adds r1, r0, 0
	movs r2, 0
	ldr r0, [r1, 0xC]
	cmp r0, r4
	bcs _0814B4B8
	ldr r0, _0814B4E0 @ =0x00018696
	cmp r4, r0
	bhi _0814B4B8
	str r4, [r1, 0xC]
	movs r2, 0x1
_0814B4B8:
	ldrh r0, [r1]
	cmp r0, r5
	bcs _0814B4C8
	ldr r0, _0814B4E4 @ =0x0000270f
	cmp r5, r0
	bhi _0814B4C8
	strh r5, [r1]
	movs r2, 0x1
_0814B4C8:
	ldrh r0, [r1, 0x4]
	cmp r0, r6
	bcs _0814B4D8
	ldr r0, _0814B4E4 @ =0x0000270f
	cmp r6, r0
	bhi _0814B4D8
	strh r6, [r1, 0x4]
	movs r2, 0x1
_0814B4D8:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814B4E0: .4byte 0x00018696
_0814B4E4: .4byte 0x0000270f
	thumb_func_end sub_814B494

	thumb_func_start sub_814B4E8
sub_814B4E8: @ 814B4E8
	push {lr}
	bl sub_814B46C
	adds r2, r0, 0
	ldrh r1, [r2, 0x6]
	ldr r0, _0814B500 @ =0x0000270e
	cmp r1, r0
	bhi _0814B4FC
	adds r0, r1, 0x1
	strh r0, [r2, 0x6]
_0814B4FC:
	pop {r0}
	bx r0
	.align 2, 0
_0814B500: .4byte 0x0000270e
	thumb_func_end sub_814B4E8

	thumb_func_start ShowPokemonJumpRecords
ShowPokemonJumpRecords: @ 814B504
	push {r4,lr}
	ldr r4, _0814B520 @ =sub_814B524
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B520: .4byte sub_814B524
	thumb_func_end ShowPokemonJumpRecords

	thumb_func_start sub_814B524
sub_814B524: @ 814B524
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0814B548 @ =gTasks+0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0814B570
	cmp r0, 0x1
	bgt _0814B54C
	cmp r0, 0
	beq _0814B556
	b _0814B5BE
	.align 2, 0
_0814B548: .4byte gTasks+0x8
_0814B54C:
	cmp r0, 0x2
	beq _0814B57C
	cmp r0, 0x3
	beq _0814B5A4
	b _0814B5BE
_0814B556:
	ldr r0, _0814B56C @ =gUnknown_846E2CC
	bl AddWindow
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x2]
	bl sub_814B5C4
	ldrb r0, [r4, 0x2]
	movs r1, 0x3
	b _0814B592
	.align 2, 0
_0814B56C: .4byte gUnknown_846E2CC
_0814B570:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814B5BE
	b _0814B596
_0814B57C:
	ldr r0, _0814B5A0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0814B5BE
	ldrb r0, [r4, 0x2]
	bl rbox_fill_rectangle
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
_0814B592:
	bl CopyWindowToVram
_0814B596:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0814B5BE
	.align 2, 0
_0814B5A0: .4byte gMain
_0814B5A4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0814B5BE
	ldrb r0, [r4, 0x2]
	bl RemoveWindow
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0814B5BE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814B524

	thumb_func_start sub_814B5C4
sub_814B5C4: @ 814B5C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x28]
	bl sub_814B46C
	ldrh r1, [r0]
	str r1, [sp, 0x14]
	ldr r1, [r0, 0xC]
	str r1, [sp, 0x18]
	ldrh r0, [r0, 0x4]
	str r0, [sp, 0x1C]
	ldr r0, [sp, 0x28]
	lsls r4, r0, 24
	lsrs r4, 24
	ldr r5, _0814B6C8 @ =0x0000021d
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xD
	bl DrawTextBorderOuter
	adds r0, r4, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0814B6CC @ =gUnknown_841CB63
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized5
	movs r7, 0
	mov r8, r4
	movs r1, 0xFF
	mov r10, r1
	movs r6, 0
	mov r0, sp
	adds r0, 0x14
	str r0, [sp, 0x2C]
	movs r1, 0xA0
	lsls r1, 21
	mov r9, r1
	add r5, sp, 0x20
_0814B63E:
	ldr r1, _0814B6D0 @ =gUnknown_846E2D4
	lsls r0, r7, 2
	adds r0, r1
	ldr r2, [r0]
	mov r0, r9
	lsrs r4, r0, 24
	str r4, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0xC]
	str r6, [sp, 0x10]
	mov r0, r8
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized5
	ldr r0, [sp, 0x2C]
	ldm r0!, {r1}
	str r0, [sp, 0x2C]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0
	bl sub_814B6D4
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r3, 0xDE
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	str r4, [sp]
	mov r1, r10
	str r1, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	str r6, [sp, 0x10]
	mov r0, r8
	movs r1, 0x2
	adds r2, r5, 0
	bl AddTextPrinterParameterized5
	movs r0, 0xE0
	lsls r0, 20
	add r9, r0
	adds r7, 0x1
	ldr r1, [sp, 0x28]
	lsls r0, r1, 24
	cmp r7, 0x2
	bls _0814B63E
	lsrs r0, 24
	bl PutWindowTilemap
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B6C8: .4byte 0x0000021d
_0814B6CC: .4byte gUnknown_841CB63
_0814B6D0: .4byte gUnknown_846E2D4
	thumb_func_end sub_814B5C4

	thumb_func_start sub_814B6D4
sub_814B6D4: @ 814B6D4
	push {lr}
	adds r1, r0, 0
	b _0814B6DC
_0814B6DA:
	adds r1, 0x1
_0814B6DC:
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0814B6EA
	cmp r0, 0
	bne _0814B6DA
	movs r0, 0xFF
	strb r0, [r1]
_0814B6EA:
	pop {r0}
	bx r0
	thumb_func_end sub_814B6D4

	.align 2, 0 @ Don't pad with nop.
