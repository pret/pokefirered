	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start CreateInvisibleSpriteWithCallback
CreateInvisibleSpriteWithCallback: @ 8044EF8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _08044F2C @ =gUnknown_825E4DC
	movs r1, 0xF8
	movs r2, 0xA8
	movs r3, 0xE
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08044F30 @ =gUnknown_202063C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r3, r2, r5
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r4, 0x4
	orrs r1, r4
	strb r1, [r3]
	adds r5, 0x1C
	adds r2, r5
	str r6, [r2]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08044F2C: .4byte gUnknown_825E4DC
_08044F30: .4byte gUnknown_202063C
	thumb_func_end CreateInvisibleSpriteWithCallback

	thumb_func_start StoreWordInTwoHalfwords
StoreWordInTwoHalfwords: @ 8044F34
	strh r1, [r0]
	lsrs r1, 16
	strh r1, [r0, 0x2]
	bx lr
	thumb_func_end StoreWordInTwoHalfwords

	thumb_func_start LoadWordFromTwoHalfwords
LoadWordFromTwoHalfwords: @ 8044F3C
	ldrh r2, [r0]
	movs r3, 0x2
	ldrsh r0, [r0, r3]
	lsls r0, 16
	orrs r2, r0
	str r2, [r1]
	bx lr
	thumb_func_end LoadWordFromTwoHalfwords

	thumb_func_start SetBgAffineStruct
SetBgAffineStruct: @ 8044F4C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	ldr r7, [sp, 0x24]
	mov r8, r7
	str r1, [r0]
	str r2, [r0, 0x4]
	strh r3, [r0, 0x8]
	strh r4, [r0, 0xA]
	strh r5, [r0, 0xC]
	strh r6, [r0, 0xE]
	mov r1, r8
	strh r1, [r0, 0x10]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SetBgAffineStruct

	thumb_func_start DoBgAffineSet
DoBgAffineSet: @ 8044F78
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x24
	mov r8, r0
	ldr r0, [sp, 0x38]
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	ldr r6, [sp, 0x44]
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	asrs r3, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	add r0, sp, 0x10
	bl SetBgAffineStruct
	add r0, sp, 0x10
	mov r1, r8
	movs r2, 0x1
	bl BgAffineSet
	add sp, 0x24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DoBgAffineSet

	thumb_func_start CopySpriteTiles
CopySpriteTiles: @ 8044FC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	str r2, [sp, 0x20]
	adds r4, r3, 0
	ldr r7, [sp, 0x5C]
	lsls r0, 24
	lsls r1, 24
	ldr r2, _0804504C @ =gUnknown_825E4F4
	lsrs r1, 23
	lsrs r0, 21
	adds r1, r0
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp, 0x24]
	adds r1, r2
	ldrb r1, [r1]
	str r1, [sp, 0x28]
	movs r1, 0
	cmp r1, r0
	bcc _08044FF8
	b _0804517A
_08044FF8:
	movs r0, 0x20
	ldr r2, [sp, 0x28]
	subs r0, r2
	lsls r0, 1
	str r0, [sp, 0x2C]
_08045002:
	movs r2, 0
	adds r1, 0x1
	str r1, [sp, 0x34]
	ldr r3, [sp, 0x28]
	cmp r2, r3
	bcc _08045010
	b _08045168
_08045010:
	ldr r0, _08045050 @ =0x040000d4
	mov r8, r0
_08045014:
	ldrh r1, [r4]
	ldr r0, _08045054 @ =0x000003ff
	ands r0, r1
	lsls r0, 5
	mov r12, r0
	movs r0, 0xC0
	lsls r0, 4
	ands r0, r1
	mov r3, sp
	strh r1, [r3, 0x38]
	cmp r0, 0
	bne _0804505C
	ldr r0, [sp, 0x20]
	add r0, r12
	mov r1, r8
	str r0, [r1]
	str r7, [r1, 0x4]
	ldr r3, _08045058 @ =0x84000008
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, 0x2
	str r4, [sp, 0x30]
	adds r7, 0x20
	mov r10, r7
	adds r2, 0x1
	mov r9, r2
	b _08045156
	.align 2, 0
_0804504C: .4byte gUnknown_825E4F4
_08045050: .4byte 0x040000d4
_08045054: .4byte 0x000003ff
_08045058: .4byte 0x84000008
_0804505C:
	movs r1, 0x80
	lsls r1, 4
	cmp r0, r1
	bne _080450AC
	movs r3, 0
	adds r4, 0x2
	str r4, [sp, 0x30]
	movs r0, 0x20
	adds r0, r7
	mov r10, r0
	adds r2, 0x1
	mov r9, r2
	ldr r4, _080450A4 @ =0x040000d4
	ldr r6, _080450A8 @ =0x84000001
	movs r5, 0x7
_0804507A:
	lsls r2, r3, 24
	asrs r2, 24
	subs r0, r5, r2
	lsls r0, 2
	add r0, r12
	ldr r1, [sp, 0x20]
	adds r0, r1, r0
	lsls r1, r2, 2
	adds r1, r7, r1
	str r0, [r4]
	str r1, [r4, 0x4]
	str r6, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, 0x1
	lsls r2, 24
	lsrs r3, r2, 24
	asrs r2, 24
	cmp r2, 0x7
	ble _0804507A
	b _08045156
	.align 2, 0
_080450A4: .4byte 0x040000d4
_080450A8: .4byte 0x84000001
_080450AC:
	movs r3, 0
	adds r4, 0x2
	str r4, [sp, 0x30]
	movs r0, 0x20
	adds r0, r7
	mov r10, r0
	adds r2, 0x1
	mov r9, r2
_080450BC:
	movs r2, 0
	lsls r4, r3, 24
	lsls r0, r4, 2
	lsrs r0, 24
	adds r6, r0, 0x3
	mov r1, r12
	adds r5, r1, r0
_080450CA:
	lsls r1, r2, 24
	asrs r1, 24
	subs r0, r6, r1
	mov r2, sp
	adds r3, r2, r0
	adds r0, r5, r1
	ldr r2, [sp, 0x20]
	adds r0, r2, r0
	ldrb r2, [r0]
	movs r0, 0xF
	ands r0, r2
	lsls r0, 4
	lsrs r2, 4
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x1
	lsls r1, 24
	lsrs r2, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080450CA
	movs r3, 0x80
	lsls r3, 17
	adds r0, r4, r3
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x7
	ble _080450BC
	movs r0, 0x80
	lsls r0, 4
	mov r1, sp
	ldrh r1, [r1, 0x38]
	ands r0, r1
	cmp r0, 0
	beq _08045148
	movs r3, 0
	ldr r4, _08045140 @ =0x040000d4
	ldr r6, _08045144 @ =0x84000001
	movs r5, 0x7
_08045118:
	lsls r1, r3, 24
	asrs r1, 24
	subs r0, r5, r1
	lsls r0, 2
	mov r3, sp
	adds r2, r3, r0
	lsls r0, r1, 2
	adds r0, r7, r0
	str r2, [r4]
	str r0, [r4, 0x4]
	str r6, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r1, 0x1
	lsls r1, 24
	lsrs r3, r1, 24
	asrs r1, 24
	cmp r1, 0x7
	ble _08045118
	b _08045156
	.align 2, 0
_08045140: .4byte 0x040000d4
_08045144: .4byte 0x84000001
_08045148:
	mov r0, sp
	mov r1, r8
	str r0, [r1]
	str r7, [r1, 0x4]
	ldr r2, _0804518C @ =0x84000008
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
_08045156:
	ldr r4, [sp, 0x30]
	mov r7, r10
	mov r3, r9
	lsls r0, r3, 24
	lsrs r2, r0, 24
	ldr r0, [sp, 0x28]
	cmp r2, r0
	bcs _08045168
	b _08045014
_08045168:
	ldr r1, [sp, 0x2C]
	adds r4, r1
	ldr r2, [sp, 0x34]
	lsls r0, r2, 24
	lsrs r1, r0, 24
	ldr r3, [sp, 0x24]
	cmp r1, r3
	bcs _0804517A
	b _08045002
_0804517A:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804518C: .4byte 0x84000008
	thumb_func_end CopySpriteTiles

	thumb_func_start CountTrailingZeroBits
CountTrailingZeroBits: @ 8045190
	push {lr}
	adds r2, r0, 0
	movs r1, 0
	movs r3, 0x1
_08045198:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _080451A4
	adds r0, r1, 0
	b _080451B2
_080451A4:
	lsrs r2, 1
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08045198
	movs r0, 0
_080451B2:
	pop {r1}
	bx r1
	thumb_func_end CountTrailingZeroBits

	thumb_func_start CalcCRC16
CalcCRC16: @ 80451B8
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r4, r1, 0
	ldr r2, _080451E8 @ =0x00001121
	movs r3, 0
	cmp r3, r4
	bcs _08045204
	movs r6, 0x1
	ldr r0, _080451EC @ =0x00008408
	adds r5, r0, 0
_080451CC:
	adds r0, r7, r3
	ldrb r0, [r0]
	eors r2, r0
	movs r1, 0
	adds r3, 0x1
_080451D6:
	adds r0, r2, 0
	ands r0, r6
	cmp r0, 0
	beq _080451F0
	lsrs r0, r2, 1
	eors r0, r5
	lsls r0, 16
	lsrs r2, r0, 16
	b _080451F2
	.align 2, 0
_080451E8: .4byte 0x00001121
_080451EC: .4byte 0x00008408
_080451F0:
	lsrs r2, 1
_080451F2:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x7
	bls _080451D6
	lsls r0, r3, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _080451CC
_08045204:
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CalcCRC16

	thumb_func_start CalcCRC16WithTable
CalcCRC16WithTable: @ 8045210
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r2, _0804524C @ =0x00001121
	movs r3, 0
	cmp r3, r4
	bcs _0804523E
	ldr r6, _08045250 @ =gUnknown_825E50C
_08045220:
	lsrs r1, r2, 8
	adds r0, r5, r3
	ldrb r0, [r0]
	eors r2, r0
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r6
	ldrh r0, [r0]
	adds r2, r0, 0
	eors r2, r1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _08045220
_0804523E:
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804524C: .4byte 0x00001121
_08045250: .4byte gUnknown_825E50C
	thumb_func_end CalcCRC16WithTable

	thumb_func_start CalcByteArraySum
CalcByteArraySum: @ 8045254
	push {r4,lr}
	adds r4, r0, 0
	movs r3, 0
	movs r2, 0
	cmp r3, r1
	bcs _0804526C
_08045260:
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r3, r0
	adds r2, 0x1
	cmp r2, r1
	bcc _08045260
_0804526C:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CalcByteArraySum

	.align 2, 0 @ Don't pad with nop.
