	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812BB10
sub_812BB10: @ 812BB10
	push {lr}
	ldr r0, _0812BB7C @ =0x00000237
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	movs r0, 0x8E
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB80 @ =0x00000239
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB84 @ =0x0000023a
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB88 @ =0x0000023b
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB8C @ =0x000002ef
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	ldr r0, _0812BB90 @ =0x000001f1
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0812BB94
	movs r0, 0
	b _0812BB96
	.align 2, 0
_0812BB7C: .4byte 0x00000237
_0812BB80: .4byte 0x00000239
_0812BB84: .4byte 0x0000023a
_0812BB88: .4byte 0x0000023b
_0812BB8C: .4byte 0x000002ef
_0812BB90: .4byte 0x000001f1
_0812BB94:
	movs r0, 0x1
_0812BB96:
	pop {r1}
	bx r1
	thumb_func_end sub_812BB10

	thumb_func_start sub_812BB9C
sub_812BB9C: @ 812BB9C
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r0, [r2, 0xE]
	cmp r0, 0xA
	bhi _0812BC4C
	lsls r0, 2
	ldr r1, _0812BBB4 @ =_0812BBB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812BBB4: .4byte _0812BBB8
	.align 2, 0
_0812BBB8:
	.4byte _0812BC02
	.4byte _0812BC0C
	.4byte _0812BC16
	.4byte _0812BC20
	.4byte _0812BC2A
	.4byte _0812BC34
	.4byte _0812BC3E
	.4byte _0812BC4C
	.4byte _0812BBE4
	.4byte _0812BBEE
	.4byte _0812BBF8
_0812BBE4:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BC54
	b _0812BC46
_0812BBEE:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BC80
	b _0812BC46
_0812BBF8:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BCA8
	b _0812BC46
_0812BC02:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BCD0
	b _0812BC46
_0812BC0C:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BD2C
	b _0812BC46
_0812BC16:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BD64
	b _0812BC46
_0812BC20:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BD98
	b _0812BC46
_0812BC2A:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BE10
	b _0812BC46
_0812BC34:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BEEC
	b _0812BC46
_0812BC3E:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_812BF18
_0812BC46:
	lsls r0, 24
	lsrs r0, 24
	b _0812BC4E
_0812BC4C:
	movs r0, 0
_0812BC4E:
	pop {r1}
	bx r1
	thumb_func_end sub_812BB9C

	thumb_func_start sub_812BC54
sub_812BC54: @ 812BC54
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812BC7C @ =gUnknown_841DFA5
	bl sub_812BF74
	bl sub_812BF5C
	movs r0, 0x1
	bl sub_813BDA4
	movs r0, 0x1
	bl sub_813BD5C
	movs r0, 0x9
	strb r0, [r4, 0xE]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BC7C: .4byte gUnknown_841DFA5
	thumb_func_end sub_812BC54

	thumb_func_start sub_812BC80
sub_812BC80: @ 812BC80
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812BCA4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812BC9A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	strb r0, [r4, 0xE]
_0812BC9A:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BCA4: .4byte gMain
	thumb_func_end sub_812BC80

	thumb_func_start sub_812BCA8
sub_812BCA8: @ 812BCA8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	ldr r0, _0812BCCC @ =gUnknown_3005E9C
	movs r5, 0
	strb r5, [r0, 0x2]
	adds r0, r4, 0
	bl sub_812BF94
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_812B4D8
	strb r5, [r4, 0xE]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812BCCC: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BCA8

	thumb_func_start sub_812BCD0
sub_812BCD0: @ 812BCD0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_813C690
	adds r1, r0, 0
	adds r0, r1, 0x6
	cmp r0, 0x5
	bhi _0812BD16
	lsls r0, 2
	ldr r1, _0812BCEC @ =_0812BCF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812BCEC: .4byte _0812BCF0
	.align 2, 0
_0812BCF0:
	.4byte _0812BD08
	.4byte _0812BD0C
	.4byte _0812BD0C
	.4byte _0812BD1E
	.4byte _0812BD08
	.4byte _0812BD1E
_0812BD08:
	movs r0, 0
	b _0812BD20
_0812BD0C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812BF9C
	b _0812BD1E
_0812BD16:
	ldr r0, _0812BD28 @ =gUnknown_3005E9C
	strb r1, [r0, 0x1]
	movs r0, 0x1
	strb r0, [r4, 0xE]
_0812BD1E:
	movs r0, 0x1
_0812BD20:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812BD28: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BCD0

	thumb_func_start sub_812BD2C
sub_812BD2C: @ 812BD2C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0812BD60 @ =gUnknown_3005E9C
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4, 0xD]
	strb r0, [r1, 0x2]
	adds r0, r4, 0
	bl sub_812BF94
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_812B5A8
	bl sub_813C75C
	movs r0, 0x2
	bl sub_813C684
	movs r0, 0x3
	strb r0, [r4, 0xE]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812BD60: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BD2C

	thumb_func_start sub_812BD64
sub_812BD64: @ 812BD64
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0
	movs r1, 0
	bl sub_813C004
	movs r0, 0x1
	movs r1, 0
	bl sub_813C004
	ldr r0, _0812BD94 @ =gUnknown_3005E9C
	movs r4, 0
	strb r4, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_812B4D8
	strb r4, [r5, 0xE]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812BD94: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BD64

	thumb_func_start sub_812BD98
sub_812BD98: @ 812BD98
	push {r4,lr}
	adds r4, r0, 0
	bl sub_813C690
	adds r1, r0, 0
	adds r0, r1, 0x6
	cmp r0, 0x5
	bhi _0812BDD8
	lsls r0, 2
	ldr r1, _0812BDB4 @ =_0812BDB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812BDB4: .4byte _0812BDB8
	.align 2, 0
_0812BDB8:
	.4byte _0812BDD0
	.4byte _0812BDE0
	.4byte _0812BDE0
	.4byte _0812BDE0
	.4byte _0812BDD4
	.4byte _0812BDE0
_0812BDD0:
	movs r0, 0
	b _0812BDE2
_0812BDD4:
	movs r0, 0x2
	b _0812BDDE
_0812BDD8:
	ldr r0, _0812BDE8 @ =gUnknown_3005E9C
	strb r1, [r0, 0x3]
	movs r0, 0x4
_0812BDDE:
	strb r0, [r4, 0xE]
_0812BDE0:
	movs r0, 0x1
_0812BDE2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BDE8: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BD98

	thumb_func_start sub_812BDEC
sub_812BDEC: @ 812BDEC
	push {lr}
	ldr r1, _0812BE08 @ =gUnknown_845B080
	ldr r0, _0812BE0C @ =gUnknown_3005E9C
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_813C4CC
	pop {r0}
	bx r0
	.align 2, 0
_0812BE08: .4byte gUnknown_845B080
_0812BE0C: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BDEC

	thumb_func_start sub_812BE10
sub_812BE10: @ 812BE10
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0812BE4C @ =gUnknown_3005E9C
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0
	bl sub_813BDA4
	bl sub_813C624
	ldr r0, _0812BE50 @ =gUnknown_841DFBE
	bl sub_812BF74
	movs r0, 0x1
	bl sub_813BDE8
	movs r0, 0x1
	bl sub_813BEE4
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _0812BE5C
	ldr r0, _0812BE54 @ =gUnknown_845B0B0
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BE58 @ =gUnknown_845B164
	b _0812BEA4
	.align 2, 0
_0812BE4C: .4byte gUnknown_3005E9C
_0812BE50: .4byte gUnknown_841DFBE
_0812BE54: .4byte gUnknown_845B0B0
_0812BE58: .4byte gUnknown_845B164
_0812BE5C:
	cmp r0, 0x1
	bne _0812BE78
	ldr r0, _0812BE70 @ =gUnknown_845B218
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BE74 @ =gUnknown_845B2DC
	b _0812BEA4
	.align 2, 0
_0812BE70: .4byte gUnknown_845B218
_0812BE74: .4byte gUnknown_845B2DC
_0812BE78:
	cmp r0, 0x2
	bne _0812BE94
	ldr r0, _0812BE8C @ =gUnknown_845B3A0
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BE90 @ =gUnknown_845B450
	b _0812BEA4
	.align 2, 0
_0812BE8C: .4byte gUnknown_845B3A0
_0812BE90: .4byte gUnknown_845B450
_0812BE94:
	cmp r0, 0x3
	bne _0812BEB8
	ldr r0, _0812BEB0 @ =gUnknown_845B500
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BEB4 @ =gUnknown_845B520
_0812BEA4:
	adds r1, r2
	ldr r1, [r1]
	bl sub_813C50C
	b _0812BECC
	.align 2, 0
_0812BEB0: .4byte gUnknown_845B500
_0812BEB4: .4byte gUnknown_845B520
_0812BEB8:
	ldr r0, _0812BEE4 @ =gUnknown_845B540
	ldrb r1, [r4, 0x3]
	lsls r1, 2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0812BEE8 @ =gUnknown_845B5D0
	adds r1, r2
	ldr r1, [r1]
	bl sub_813C50C
_0812BECC:
	movs r0, 0x1
	bl sub_813BDA4
	movs r0, 0x1
	bl sub_813BD5C
	movs r0, 0x6
	strb r0, [r5, 0xE]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812BEE4: .4byte gUnknown_845B540
_0812BEE8: .4byte gUnknown_845B5D0
	thumb_func_end sub_812BE10

	thumb_func_start sub_812BEEC
sub_812BEEC: @ 812BEEC
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0812BF14 @ =gUnknown_3005E9C
	movs r0, 0x1
	strb r0, [r2]
	adds r0, r4, 0
	bl sub_812B5A8
	bl sub_813C75C
	movs r0, 0x2
	bl sub_813C684
	movs r0, 0x3
	strb r0, [r4, 0xE]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BF14: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BEEC

	thumb_func_start sub_812BF18
sub_812BF18: @ 812BF18
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812BF40 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0812BF30
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812BF44
_0812BF30:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x5
	strb r0, [r4, 0xE]
	movs r0, 0x1
	b _0812BF54
	.align 2, 0
_0812BF40: .4byte gMain
_0812BF44:
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0812BF52
	movs r0, 0x1
	b _0812BF54
_0812BF52:
	movs r0, 0
_0812BF54:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812BF18

	thumb_func_start sub_812BF5C
sub_812BF5C: @ 812BF5C
	push {lr}
	bl sub_813C624
	ldr r0, _0812BF70 @ =gUnknown_81B2FC9
	movs r1, 0
	movs r2, 0
	bl sub_813C4CC
	pop {r0}
	bx r0
	.align 2, 0
_0812BF70: .4byte gUnknown_81B2FC9
	thumb_func_end sub_812BF5C

	thumb_func_start sub_812BF74
sub_812BF74: @ 812BF74
	push {r4,lr}
	adds r4, r0, 0
	bl sub_813C5FC
	adds r0, r4, 0
	bl sub_813C488
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812BF74

	thumb_func_start sub_812BF88
sub_812BF88: @ 812BF88
	ldr r0, _0812BF90 @ =gUnknown_3005E9C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0812BF90: .4byte gUnknown_3005E9C
	thumb_func_end sub_812BF88

	thumb_func_start sub_812BF94
sub_812BF94: @ 812BF94
	movs r1, 0
	strb r1, [r0, 0xC]
	strb r1, [r0, 0xD]
	bx lr
	thumb_func_end sub_812BF94

	thumb_func_start sub_812BF9C
sub_812BF9C: @ 812BF9C
	push {lr}
	ldrb r2, [r0, 0xC]
	ldrb r0, [r0, 0xD]
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldr r1, [r2, 0x4]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _0812BFC0
	ldr r0, _0812BFBC @ =gUnknown_845B098
	ldr r0, [r0, 0x14]
	bl sub_813C584
	b _0812BFCC
	.align 2, 0
_0812BFBC: .4byte gUnknown_845B098
_0812BFC0:
	ldr r0, _0812BFD8 @ =gUnknown_845B098
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_813C584
_0812BFCC:
	movs r0, 0x1
	bl sub_813BE30
	pop {r0}
	bx r0
	.align 2, 0
_0812BFD8: .4byte gUnknown_845B098
	thumb_func_end sub_812BF9C

	.align 2, 0 @ Don't pad with nop.
