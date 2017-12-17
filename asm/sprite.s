	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ResetSpriteData
ResetSpriteData: @ 8006B10
	push {r4,lr}
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl ResetAllSprites
	bl ClearSpriteCopyRequests
	bl ResetAffineAnimData
	bl FreeSpriteTileRanges
	ldr r1, _08006B4C @ =gUnknown_2021B44
	movs r0, 0x40
	strb r0, [r1]
	ldr r0, _08006B50 @ =gUnknown_2021B46
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl AllocSpriteTiles
	ldr r0, _08006B54 @ =gUnknown_2021BC8
	strh r4, [r0]
	ldr r0, _08006B58 @ =gUnknown_2021BCA
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006B4C: .4byte gUnknown_2021B44
_08006B50: .4byte gUnknown_2021B46
_08006B54: .4byte gUnknown_2021BC8
_08006B58: .4byte gUnknown_2021BCA
	thumb_func_end ResetSpriteData

	thumb_func_start AnimateSprites
AnimateSprites: @ 8006B5C
	push {r4-r7,lr}
	movs r6, 0
	movs r7, 0x1
_08006B62:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _08006BA4 @ =gUnknown_202063C
	adds r4, r0, r1
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _08006B92
	ldr r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	ldrb r1, [r5]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _08006B92
	adds r0, r4, 0
	bl AnimateSprite
_08006B92:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _08006B62
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006BA4: .4byte gUnknown_202063C
	thumb_func_end AnimateSprites

	thumb_func_start BuildOamBuffer
BuildOamBuffer: @ 8006BA8
	push {r4,r5,lr}
	bl UpdateOamCoords
	bl BuildSpritePriorities
	bl SortSprites
	ldr r5, _08006BE8 @ =gMain
	ldr r0, _08006BEC @ =0x00000439
	adds r5, r0
	ldrb r0, [r5]
	lsls r4, r0, 31
	lsrs r4, 31
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5]
	bl AddSpritesToOamBuffer
	bl CopyMatricesToOamBuffer
	movs r2, 0x1
	ldrb r1, [r5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	orrs r4, r0
	strb r4, [r5]
	ldr r0, _08006BF0 @ =gUnknown_2021840
	strb r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006BE8: .4byte gMain
_08006BEC: .4byte 0x00000439
_08006BF0: .4byte gUnknown_2021840
	thumb_func_end BuildOamBuffer

	thumb_func_start UpdateOamCoords
UpdateOamCoords: @ 8006BF4
	push {r4-r7,lr}
	movs r4, 0
	ldr r7, _08006C60 @ =gUnknown_202063C
	ldr r0, _08006C64 @ =0x000001ff
	adds r5, r0, 0
	ldr r6, _08006C68 @ =0xfffffe00
_08006C00:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x5
	ands r0, r1
	cmp r0, 0x1
	bne _08006CA6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08006C74
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r0
	ldr r0, _08006C6C @ =gUnknown_2021BC8
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r1, r0
	ands r1, r5
	ldrh r2, [r3, 0x2]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrh r1, [r3, 0x26]
	ldrh r0, [r3, 0x22]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	ldr r2, _08006C70 @ =gUnknown_2021BCA
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	b _08006CA4
	.align 2, 0
_08006C60: .4byte gUnknown_202063C
_08006C64: .4byte 0x000001ff
_08006C68: .4byte 0xfffffe00
_08006C6C: .4byte gUnknown_2021BC8
_08006C70: .4byte gUnknown_2021BCA
_08006C74:
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r0
	ands r1, r5
	ldrh r2, [r3, 0x2]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrh r1, [r3, 0x26]
	ldrh r0, [r3, 0x22]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	adds r0, r1
_08006CA4:
	strb r0, [r3]
_08006CA6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3F
	bls _08006C00
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end UpdateOamCoords

	thumb_func_start BuildSpritePriorities
BuildSpritePriorities: @ 8006CB8
	push {r4,lr}
	movs r2, 0
	ldr r4, _08006CF0 @ =gUnknown_202063C
	ldr r3, _08006CF4 @ =gUnknown_2021780
_08006CC0:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	adds r1, r0, 0
	adds r1, 0x43
	ldrb r1, [r1]
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	lsls r0, 8
	orrs r1, r0
	lsls r0, r2, 1
	adds r0, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3F
	bls _08006CC0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006CF0: .4byte gUnknown_202063C
_08006CF4: .4byte gUnknown_2021780
	thumb_func_end BuildSpritePriorities

	thumb_func_start SortSprites
SortSprites: @ 8006CF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0x1
	mov r12, r0
	ldr r1, _08006DC0 @ =gUnknown_2021800
	mov r10, r1
	ldr r3, _08006DC4 @ =0xffffff00
	mov r9, r3
	ldr r6, _08006DC8 @ =0xc0000300
	mov r8, r6
_08006D14:
	mov r5, r12
	mov r0, r12
	subs r0, 0x1
	add r0, r10
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r7, _08006DCC @ =gUnknown_202063C
	adds r3, r0, r7
	mov r0, r12
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r7
	lsls r2, 1
	ldr r0, _08006DD0 @ =gUnknown_2021780
	adds r2, r0
	ldrh r2, [r2]
	str r2, [sp]
	lsls r1, 1
	adds r1, r0
	ldrh r6, [r1]
	ldrb r1, [r3]
	ldrb r2, [r4]
	adds r0, r1, 0
	cmp r0, 0x9F
	ble _08006D56
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08006D56:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _08006D64
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08006D64:
	ldr r0, [r3]
	mov r7, r8
	ands r0, r7
	cmp r0, r8
	bne _08006D88
	ldrb r0, [r3, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08006D7A
	cmp r0, 0x2
	bne _08006D88
_08006D7A:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08006D88
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08006D88:
	ldr r0, [r4]
	mov r3, r8
	ands r0, r3
	cmp r0, r8
	bne _08006DAC
	ldrb r0, [r4, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08006D9E
	cmp r0, 0x2
	bne _08006DAC
_08006D9E:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08006DAC
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08006DAC:
	movs r7, 0x1
	add r12, r7
	cmp r5, 0
	beq _08006E92
	ldr r0, [sp]
	cmp r0, r6
	bhi _08006DD4
	cmp r0, r6
	bne _08006E92
	b _08006E8A
	.align 2, 0
_08006DC0: .4byte gUnknown_2021800
_08006DC4: .4byte 0xffffff00
_08006DC8: .4byte 0xc0000300
_08006DCC: .4byte gUnknown_202063C
_08006DD0: .4byte gUnknown_2021780
_08006DD4:
	mov r1, r10
	adds r3, r5, r1
	ldrb r4, [r3]
	subs r2, r5, 0x1
	adds r1, r2, r1
	ldrb r0, [r1]
	strb r0, [r3]
	strb r4, [r1]
	lsls r2, 24
	lsrs r5, r2, 24
	subs r0, r5, 0x1
	add r0, r10
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r6, _08006EB0 @ =gUnknown_202063C
	adds r3, r0, r6
	mov r7, r10
	adds r0, r5, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r6
	lsls r2, 1
	ldr r0, _08006EB4 @ =gUnknown_2021780
	adds r2, r0
	ldrh r2, [r2]
	str r2, [sp]
	lsls r1, 1
	adds r1, r0
	ldrh r6, [r1]
	ldrb r1, [r3]
	ldrb r2, [r4]
	adds r0, r1, 0
	cmp r0, 0x9F
	ble _08006E26
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08006E26:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _08006E34
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08006E34:
	ldr r0, [r3]
	mov r7, r8
	ands r0, r7
	cmp r0, r8
	bne _08006E58
	ldrb r0, [r3, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08006E4A
	cmp r0, 0x2
	bne _08006E58
_08006E4A:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08006E58
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08006E58:
	ldr r0, [r4]
	mov r3, r8
	ands r0, r3
	cmp r0, r8
	bne _08006E7C
	ldrb r0, [r4, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08006E6E
	cmp r0, 0x2
	bne _08006E7C
_08006E6E:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08006E7C
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08006E7C:
	cmp r5, 0
	beq _08006E92
	ldr r7, [sp]
	cmp r7, r6
	bhi _08006DD4
	cmp r7, r6
	bne _08006E92
_08006E8A:
	lsls r1, 16
	lsls r0, r2, 16
	cmp r1, r0
	blt _08006DD4
_08006E92:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x3F
	bhi _08006EA0
	b _08006D14
_08006EA0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006EB0: .4byte gUnknown_202063C
_08006EB4: .4byte gUnknown_2021780
	thumb_func_end SortSprites

	thumb_func_start CopyMatricesToOamBuffer
CopyMatricesToOamBuffer: @ 8006EB8
	push {r4-r6,lr}
	movs r4, 0
	ldr r5, _08006EFC @ =gMain
	ldr r6, _08006F00 @ =gUnknown_2021BCC
_08006EC0:
	lsls r2, r4, 2
	lsls r1, r4, 5
	adds r1, r5
	lsls r3, r4, 3
	adds r3, r6
	ldrh r0, [r3]
	strh r0, [r1, 0x3E]
	adds r0, r2, 0x1
	lsls r0, 3
	adds r0, r5
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0x3E]
	adds r0, r2, 0x2
	lsls r0, 3
	adds r0, r5
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0x3E]
	adds r2, 0x3
	lsls r2, 3
	adds r2, r5
	ldrh r0, [r3, 0x6]
	strh r0, [r2, 0x3E]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08006EC0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006EFC: .4byte gMain
_08006F00: .4byte gUnknown_2021BCC
	thumb_func_end CopyMatricesToOamBuffer

	thumb_func_start AddSpritesToOamBuffer
AddSpritesToOamBuffer: @ 8006F04
	push {r4-r6,lr}
	sub sp, 0x4
	movs r4, 0
	mov r0, sp
	strb r4, [r0]
_08006F0E:
	ldr r0, _08006F78 @ =gUnknown_2021800
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08006F7C @ =gUnknown_202063C
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x5
	ands r0, r1
	cmp r0, 0x1
	bne _08006F3A
	adds r0, r2, 0
	mov r1, sp
	bl AddSpriteToOamBuffer
	lsls r0, 24
	cmp r0, 0
	bne _08006F70
_08006F3A:
	adds r4, 0x1
	cmp r4, 0x3F
	ble _08006F0E
	mov r0, sp
	ldr r4, _08006F80 @ =gUnknown_2021B44
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	bcs _08006F70
	mov r1, sp
	ldr r5, _08006F84 @ =gMain + 0x38
	ldr r0, _08006F88 @ =gUnknown_8231CE4
	ldr r2, [r0]
	ldr r3, [r0, 0x4]
_08006F56:
	ldrb r0, [r1]
	lsls r0, 3
	adds r0, r5
	str r2, [r0]
	str r3, [r0, 0x4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	ldrb r6, [r4]
	cmp r0, r6
	bcc _08006F56
_08006F70:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006F78: .4byte gUnknown_2021800
_08006F7C: .4byte gUnknown_202063C
_08006F80: .4byte gUnknown_2021B44
_08006F84: .4byte gMain + 0x38
_08006F88: .4byte gUnknown_8231CE4
	thumb_func_end AddSpritesToOamBuffer

	thumb_func_start CreateSprite
CreateSprite: @ 8006F8C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r3, 24
	lsrs r4, r3, 24
	movs r3, 0
	ldr r0, _08006FC8 @ =gUnknown_202063C
	mov r12, r0
	lsls r5, r1, 16
	lsls r6, r2, 16
_08006FA0:
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	add r0, r12
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _08006FCC
	str r4, [sp]
	adds r0, r3, 0
	adds r1, r7, 0
	asrs r2, r5, 16
	asrs r3, r6, 16
	bl CreateSpriteAt
	lsls r0, 24
	lsrs r0, 24
	b _08006FD8
	.align 2, 0
_08006FC8: .4byte gUnknown_202063C
_08006FCC:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3F
	bls _08006FA0
	movs r0, 0x40
_08006FD8:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSprite

	thumb_func_start CreateSpriteAtEnd
CreateSpriteAtEnd: @ 8006FE0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r3, 24
	lsrs r6, r3, 24
	movs r3, 0x3F
	ldr r0, _0800702C @ =gUnknown_202063C
	mov r8, r0
	movs r0, 0x1
	negs r0, r0
	mov r12, r0
	lsls r4, r1, 16
	lsls r5, r2, 16
_08006FFE:
	lsls r0, r3, 16
	asrs r1, r0, 16
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _08007030
	lsls r0, r3, 24
	lsrs r0, 24
	str r6, [sp]
	adds r1, r7, 0
	asrs r2, r4, 16
	asrs r3, r5, 16
	bl CreateSpriteAt
	lsls r0, 24
	lsrs r0, 24
	b _0800703E
	.align 2, 0
_0800702C: .4byte gUnknown_202063C
_08007030:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, r12
	bgt _08006FFE
	movs r0, 0x40
_0800703E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSpriteAtEnd

	thumb_func_start CreateInvisibleSprite
CreateInvisibleSprite: @ 800704C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _08007084 @ =gUnknown_8231D00
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0800708C
	ldr r4, _08007088 @ =gUnknown_202063C
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r2, r1, r4
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r2]
	adds r4, 0x1C
	adds r1, r4
	str r6, [r1]
	adds r0, r5, 0
	b _0800708E
	.align 2, 0
_08007084: .4byte gUnknown_8231D00
_08007088: .4byte gUnknown_202063C
_0800708C:
	movs r0, 0x40
_0800708E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CreateInvisibleSprite

	thumb_func_start CreateSpriteAt
CreateSpriteAt: @ 8007094
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r1
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 4
	add r0, r10
	lsls r0, 2
	ldr r1, _08007158 @ =gUnknown_202063C
	adds r7, r0, r1
	adds r0, r7, 0
	bl ResetSprite
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x3F
	adds r0, r7
	mov r9, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x40
	orrs r0, r1
	mov r1, r9
	strb r0, [r1]
	adds r0, r7, 0
	adds r0, 0x43
	strb r4, [r0]
	mov r1, r8
	ldr r0, [r1, 0x4]
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r7]
	str r1, [r7, 0x4]
	mov r1, r8
	ldr r0, [r1, 0x8]
	str r0, [r7, 0x8]
	ldr r0, [r1, 0x10]
	str r0, [r7, 0x10]
	str r1, [r7, 0x14]
	ldr r0, [r1, 0x14]
	str r0, [r7, 0x1C]
	strh r5, [r7, 0x20]
	strh r6, [r7, 0x22]
	ldrb r3, [r7, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r7, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r7, 0
	bl CalcCenterToCornerVec
	mov r0, r8
	ldrh r1, [r0]
	ldr r4, _0800715C @ =0xffff0000
	lsrs r0, r4, 16
	cmp r1, r0
	bne _08007190
	mov r1, r8
	ldr r0, [r1, 0xC]
	str r0, [r7, 0xC]
	ldrh r0, [r0, 0x4]
	lsrs r0, 5
	lsls r0, 24
	lsrs r0, 24
	bl AllocSpriteTiles
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	asrs r1, r4, 16
	cmp r0, r1
	bne _08007160
	adds r0, r7, 0
	bl ResetSprite
	movs r0, 0x40
	b _080071D8
	.align 2, 0
_08007158: .4byte gUnknown_202063C
_0800715C: .4byte 0xffff0000
_08007160:
	ldr r1, _08007188 @ =0x000003ff
	adds r0, r1, 0
	ands r2, r0
	ldrh r1, [r7, 0x4]
	ldr r0, _0800718C @ =0xfffffc00
	ands r0, r1
	orrs r0, r2
	strh r0, [r7, 0x4]
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	mov r1, r9
	strb r0, [r1]
	adds r1, r7, 0
	adds r1, 0x40
	movs r0, 0
	strh r0, [r1]
	b _080071A4
	.align 2, 0
_08007188: .4byte 0x000003ff
_0800718C: .4byte 0xfffffc00
_08007190:
	mov r1, r8
	ldrh r0, [r1]
	bl GetSpriteTileStartByTag
	adds r1, r7, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r0, r7, 0
	bl SetSpriteSheetFrameTileNum
_080071A4:
	ldrb r0, [r7, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080071B8
	adds r0, r7, 0
	bl InitSpriteAffineAnim
_080071B8:
	mov r0, r8
	ldrh r1, [r0, 0x2]
	ldr r0, _080071E8 @ =0x0000ffff
	cmp r1, r0
	beq _080071D6
	mov r1, r8
	ldrh r0, [r1, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r7, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
_080071D6:
	mov r0, r10
_080071D8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080071E8: .4byte 0x0000ffff
	thumb_func_end CreateSpriteAt

	thumb_func_start CreateSpriteAndAnimate
CreateSpriteAndAnimate: @ 80071EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	movs r3, 0
	ldr r5, _0800725C @ =gUnknown_202063C
	lsls r1, 16
	mov r12, r1
	lsls r2, 16
	mov r8, r2
_0800720C:
	lsls r0, r3, 4
	adds r0, r3
	lsls r6, r0, 2
	adds r4, r6, r5
	adds r7, r4, 0
	adds r7, 0x3E
	ldrb r0, [r7]
	lsls r0, 31
	cmp r0, 0
	bne _08007264
	mov r0, r9
	str r0, [sp]
	adds r0, r3, 0
	mov r1, r10
	mov r3, r12
	asrs r2, r3, 16
	mov r5, r8
	asrs r3, r5, 16
	bl CreateSpriteAt
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r5, 0x40
	beq _0800726E
	ldr r1, _08007260 @ =gUnknown_2020658
	adds r0, r6, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	ldrb r0, [r7]
	lsls r0, 31
	cmp r0, 0
	beq _08007258
	adds r0, r4, 0
	bl AnimateSprite
_08007258:
	adds r0, r5, 0
	b _08007270
	.align 2, 0
_0800725C: .4byte gUnknown_202063C
_08007260: .4byte gUnknown_2020658
_08007264:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3F
	bls _0800720C
_0800726E:
	movs r0, 0x40
_08007270:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSpriteAndAnimate

	thumb_func_start DestroySprite
DestroySprite: @ 8007280
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080072DC
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080072D6
	ldr r0, [r5, 0xC]
	ldrh r2, [r0, 0x4]
	lsrs r2, 5
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r1, r0, 22
	adds r4, r1, r2
	adds r3, r1, 0
	cmp r3, r4
	bcs _080072D6
	ldr r0, _080072E4 @ =gUnknown_2021B48
	mov r12, r0
	movs r6, 0x7
	movs r7, 0x1
_080072BA:
	lsrs r2, r3, 3
	add r2, r12
	adds r0, r3, 0
	ands r0, r6
	adds r1, r7, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _080072BA
_080072D6:
	adds r0, r5, 0
	bl ResetSprite
_080072DC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080072E4: .4byte gUnknown_2021B48
	thumb_func_end DestroySprite

	thumb_func_start ResetOamRange
ResetOamRange: @ 80072E8
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsrs r3, r0, 24
	cmp r3, r4
	bcs _08007310
	ldr r6, _08007318 @ =gMain + 0x38
	ldr r5, _0800731C @ =gUnknown_8231CE4
_080072FA:
	lsls r0, r3, 3
	adds r0, r6
	ldr r1, [r5]
	ldr r2, [r5, 0x4]
	str r1, [r0]
	str r2, [r0, 0x4]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r4
	bcc _080072FA
_08007310:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007318: .4byte gMain + 0x38
_0800731C: .4byte gUnknown_8231CE4
	thumb_func_end ResetOamRange

	thumb_func_start LoadOam
LoadOam: @ 8007320
	push {lr}
	ldr r2, _08007344 @ =gMain
	ldr r1, _08007348 @ =0x00000439
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08007340
	adds r0, r2, 0
	adds r0, 0x38
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _0800734C @ =0x04000100
	bl CpuSet
_08007340:
	pop {r0}
	bx r0
	.align 2, 0
_08007344: .4byte gMain
_08007348: .4byte 0x00000439
_0800734C: .4byte 0x04000100
	thumb_func_end LoadOam

	thumb_func_start ClearSpriteCopyRequests
ClearSpriteCopyRequests: @ 8007350
	push {r4,r5,lr}
	ldr r0, _08007384 @ =gUnknown_2021840
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08007388 @ =gUnknown_2021841
	strb r1, [r0]
	movs r2, 0
	ldr r4, _0800738C @ =gUnknown_2021844
	movs r3, 0
	adds r5, r4, 0x4
_08007364:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	str r3, [r1]
	adds r0, r5
	str r3, [r0]
	strh r3, [r1, 0x8]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _08007364
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007384: .4byte gUnknown_2021840
_08007388: .4byte gUnknown_2021841
_0800738C: .4byte gUnknown_2021844
	thumb_func_end ClearSpriteCopyRequests

	thumb_func_start ResetOamMatrices
ResetOamMatrices: @ 8007390
	push {r4,lr}
	movs r1, 0
	ldr r4, _080073B8 @ =gUnknown_2021BCC
	movs r3, 0
	movs r2, 0x80
	lsls r2, 1
_0800739C:
	lsls r0, r1, 3
	adds r0, r4
	strh r2, [r0]
	strh r3, [r0, 0x2]
	strh r3, [r0, 0x4]
	strh r2, [r0, 0x6]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _0800739C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080073B8: .4byte gUnknown_2021BCC
	thumb_func_end ResetOamMatrices

	thumb_func_start SetOamMatrix
SetOamMatrix: @ 80073BC
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 24
	ldr r4, _080073D8 @ =gUnknown_2021BCC
	lsrs r0, 21
	adds r0, r4
	strh r1, [r0]
	strh r2, [r0, 0x2]
	strh r3, [r0, 0x4]
	strh r5, [r0, 0x6]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080073D8: .4byte gUnknown_2021BCC
	thumb_func_end SetOamMatrix

	thumb_func_start ResetSprite
ResetSprite: @ 80073DC
	push {lr}
	ldr r1, _080073EC @ =gUnknown_8231CA0
	movs r2, 0x44
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_080073EC: .4byte gUnknown_8231CA0
	thumb_func_end ResetSprite

	thumb_func_start CalcCenterToCornerVec
CalcCenterToCornerVec: @ 80073F0
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08007430 @ =gUnknown_8231C85
	lsrs r2, 23
	lsrs r1, 21
	adds r2, r1
	adds r0, r2, r4
	ldrb r5, [r0]
	adds r4, 0x1
	adds r2, r4
	ldrb r1, [r2]
	movs r0, 0x2
	ands r3, r0
	cmp r3, 0
	beq _0800741E
	lsls r0, r5, 25
	lsrs r5, r0, 24
	lsls r0, r1, 25
	lsrs r1, r0, 24
_0800741E:
	adds r0, r6, 0
	adds r0, 0x28
	strb r5, [r0]
	adds r0, 0x1
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007430: .4byte gUnknown_8231C85
	thumb_func_end CalcCenterToCornerVec

	thumb_func_start AllocSpriteTiles
AllocSpriteTiles: @ 8007434
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _0800748A
	ldr r0, _08007478 @ =gUnknown_2021B46
	ldrh r3, [r0]
	ldr r0, _0800747C @ =0x000003ff
	cmp r3, r0
	bhi _08007472
	ldr r7, _08007480 @ =gUnknown_2021B48
	movs r6, 0x7
	adds r4, r0, 0
	movs r5, 0x1
_08007456:
	lsrs r2, r3, 3
	adds r2, r7
	adds r0, r3, 0
	ands r0, r6
	adds r1, r5, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bls _08007456
_08007472:
	movs r0, 0
	b _0800753C
	.align 2, 0
_08007478: .4byte gUnknown_2021B46
_0800747C: .4byte 0x000003ff
_08007480: .4byte gUnknown_2021B48
_08007484:
	movs r0, 0x1
	negs r0, r0
	b _0800753C
_0800748A:
	ldr r0, _08007548 @ =gUnknown_2021B46
	ldrh r3, [r0]
	ldr r0, _0800754C @ =gUnknown_2021B48
	mov r9, r0
	movs r7, 0x7
	movs r6, 0x1
_08007496:
	lsrs r0, r3, 3
	add r0, r9
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, 0
	beq _080074CA
	movs r5, 0x80
	lsls r5, 3
	ldr r2, _0800754C @ =gUnknown_2021B48
_080074AE:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r5
	beq _08007484
	lsrs r0, 19
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, 0
	bne _080074AE
_080074CA:
	mov r8, r3
	movs r2, 0x1
	cmp r2, r4
	beq _08007504
	movs r1, 0x80
	lsls r1, 3
	mov r12, r1
	ldr r5, _0800754C @ =gUnknown_2021B48
_080074DA:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r12
	beq _08007484
	lsrs r0, 19
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, 0
	bne _08007500
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bne _080074DA
_08007500:
	cmp r2, r4
	bne _08007496
_08007504:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
	asrs r1, r0, 16
	adds r1, r4, r1
	adds r6, r0, 0
	cmp r3, r1
	bge _0800753A
	ldr r0, _0800754C @ =gUnknown_2021B48
	mov r8, r0
	movs r7, 0x7
	adds r4, r1, 0
	movs r5, 0x1
_0800751E:
	lsrs r2, r3, 3
	add r2, r8
	adds r1, r3, 0
	ands r1, r7
	adds r0, r5, 0
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _0800751E
_0800753A:
	asrs r0, r6, 16
_0800753C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007548: .4byte gUnknown_2021B46
_0800754C: .4byte gUnknown_2021B48
	thumb_func_end AllocSpriteTiles

	thumb_func_start SpriteTileAllocBitmapOp
SpriteTileAllocBitmapOp: @ 8007550
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsrs r0, 19
	lsls r0, 24
	lsrs r3, r0, 24
	adds r6, r3, 0
	movs r0, 0x7
	ands r2, r0
	adds r4, r2, 0
	movs r5, 0
	cmp r1, 0
	bne _08007588
	movs r0, 0x1
	lsls r0, r2
	mvns r0, r0
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08007584 @ =gUnknown_2021B48
	adds r0, r3, r0
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _080075B4
	.align 2, 0
_08007584: .4byte gUnknown_2021B48
_08007588:
	cmp r1, 0x1
	bne _080075A4
	lsls r1, r2
	lsls r0, r1, 24
	lsrs r2, r0, 24
	ldr r0, _080075A0 @ =gUnknown_2021B48
	adds r0, r3, r0
	ldrb r1, [r0]
	orrs r2, r1
	strb r2, [r0]
	b _080075B4
	.align 2, 0
_080075A0: .4byte gUnknown_2021B48
_080075A4:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r5, r0, 24
	ldr r0, _080075BC @ =gUnknown_2021B48
	adds r0, r6, r0
	ldrb r0, [r0]
	ands r5, r0
_080075B4:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080075BC: .4byte gUnknown_2021B48
	thumb_func_end SpriteTileAllocBitmapOp

	thumb_func_start sub_80075C0
sub_80075C0: @ 80075C0
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08007602
	ldr r0, [r3, 0xC]
	ldrh r2, [r0, 0x4]
	lsrs r2, 5
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r1, r0, 22
	adds r4, r2, r1
	adds r3, r1, 0
	cmp r3, r4
	bge _08007602
	ldr r7, _08007608 @ =gUnknown_2021B48
	movs r5, 0x7
	movs r6, 0x1
_080075EA:
	asrs r2, r3, 3
	adds r2, r7
	adds r0, r3, 0
	ands r0, r5
	adds r1, r6, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r3, 0x1
	cmp r3, r4
	blt _080075EA
_08007602:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007608: .4byte gUnknown_2021B48
	thumb_func_end sub_80075C0

	thumb_func_start nullsub_8
nullsub_8: @ 800760C
	bx lr
	thumb_func_end nullsub_8

	thumb_func_start ProcessSpriteCopyRequests
ProcessSpriteCopyRequests: @ 8007610
	push {r4-r7,lr}
	ldr r0, _08007660 @ =gUnknown_2021840
	ldrb r0, [r0]
	cmp r0, 0
	beq _08007658
	movs r4, 0
	ldr r1, _08007664 @ =gUnknown_2021841
	ldrb r0, [r1]
	cmp r0, 0
	beq _08007652
	ldr r6, _08007668 @ =gUnknown_2021844
	adds r7, r6, 0x4
	adds r5, r1, 0
_0800762A:
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r2, r1, r6
	ldr r0, [r2]
	adds r1, r7
	ldr r1, [r1]
	ldrh r2, [r2, 0x8]
	lsrs r2, 1
	bl CpuSet
	ldrb r1, [r5]
	subs r1, 0x1
	strb r1, [r5]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _0800762A
_08007652:
	ldr r1, _08007660 @ =gUnknown_2021840
	movs r0, 0
	strb r0, [r1]
_08007658:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007660: .4byte gUnknown_2021840
_08007664: .4byte gUnknown_2021841
_08007668: .4byte gUnknown_2021844
	thumb_func_end ProcessSpriteCopyRequests

	thumb_func_start RequestSpriteFrameImageCopy
RequestSpriteFrameImageCopy: @ 800766C
	push {r4-r6,lr}
	adds r5, r2, 0
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r4, _080076C4 @ =gUnknown_2021841
	ldrb r0, [r4]
	cmp r0, 0x3F
	bhi _080076BC
	ldr r3, _080076C8 @ =gUnknown_2021844
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	lsls r2, 3
	adds r2, r5
	ldr r1, [r2]
	str r1, [r0]
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r1, r0
	lsls r0, r6, 5
	ldr r5, _080076CC @ =0x06010000
	adds r0, r5
	str r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x8]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080076BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080076C4: .4byte gUnknown_2021841
_080076C8: .4byte gUnknown_2021844
_080076CC: .4byte 0x06010000
	thumb_func_end RequestSpriteFrameImageCopy

	thumb_func_start RequestSpriteCopy
RequestSpriteCopy: @ 80076D0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r3, _08007718 @ =gUnknown_2021841
	ldrb r0, [r3]
	cmp r0, 0x3F
	bhi _08007710
	ldr r2, _0800771C @ =gUnknown_2021844
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0x4
	adds r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x8]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_08007710:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007718: .4byte gUnknown_2021841
_0800771C: .4byte gUnknown_2021844
	thumb_func_end RequestSpriteCopy

	thumb_func_start CopyFromSprites
CopyFromSprites: @ 8007720
	push {r4,lr}
	adds r1, r0, 0
	ldr r3, _08007740 @ =gUnknown_202063C
	movs r2, 0
	ldr r4, _08007744 @ =0x000010ff
_0800772A:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, 0x1
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, r4
	bls _0800772A
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007740: .4byte gUnknown_202063C
_08007744: .4byte 0x000010ff
	thumb_func_end CopyFromSprites

	thumb_func_start CopyToSprites
CopyToSprites: @ 8007748
	push {r4,lr}
	adds r1, r0, 0
	ldr r3, _08007768 @ =gUnknown_202063C
	movs r2, 0
	ldr r4, _0800776C @ =0x000010ff
_08007752:
	ldrb r0, [r1]
	strb r0, [r3]
	adds r1, 0x1
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, r4
	bls _08007752
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007768: .4byte gUnknown_202063C
_0800776C: .4byte 0x000010ff
	thumb_func_end CopyToSprites

	thumb_func_start ResetAllSprites
ResetAllSprites: @ 8007770
	push {r4,r5,lr}
	movs r4, 0
_08007774:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r5, _080077A4 @ =gUnknown_202063C
	adds r0, r5
	bl ResetSprite
	ldr r0, _080077A8 @ =gUnknown_2021800
	adds r0, r4, r0
	strb r4, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3F
	bls _08007774
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	bl ResetSprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080077A4: .4byte gUnknown_202063C
_080077A8: .4byte gUnknown_2021800
	thumb_func_end ResetAllSprites

	thumb_func_start FreeSpriteTiles
FreeSpriteTiles: @ 80077AC
	push {lr}
	ldr r2, [r0, 0x14]
	ldrh r1, [r2]
	ldr r0, _080077C4 @ =0x0000ffff
	cmp r1, r0
	beq _080077BE
	adds r0, r1, 0
	bl FreeSpriteTilesByTag
_080077BE:
	pop {r0}
	bx r0
	.align 2, 0
_080077C4: .4byte 0x0000ffff
	thumb_func_end FreeSpriteTiles

	thumb_func_start FreeSpritePalette
FreeSpritePalette: @ 80077C8
	push {lr}
	ldr r0, [r0, 0x14]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end FreeSpritePalette

	thumb_func_start FreeSpriteOamMatrix
FreeSpriteOamMatrix: @ 80077D8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080077FE
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080077FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FreeSpriteOamMatrix

	thumb_func_start DestroySpriteAndFreeResources
DestroySpriteAndFreeResources: @ 8007804
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteTiles
	adds r0, r4, 0
	bl FreeSpritePalette
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroySpriteAndFreeResources

	thumb_func_start AnimateSprite
AnimateSprite: @ 8007824
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, _08007860 @ =gUnknown_8231D18
	adds r5, r4, 0
	adds r5, 0x3F
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	adds r0, r2
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	ldr r0, _08007864 @ =gUnknown_2021CCC
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800785A
	ldr r0, _08007868 @ =gUnknown_8231D20
	ldrb r1, [r5]
	lsls r1, 28
	lsrs r1, 31
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
_0800785A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007860: .4byte gUnknown_8231D18
_08007864: .4byte gUnknown_2021CCC
_08007868: .4byte gUnknown_8231D20
	thumb_func_end AnimateSprite

	thumb_func_start BeginAnim
BeginAnim: @ 800786C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	adds r3, r4, 0
	adds r3, 0x2B
	movs r2, 0
	strb r2, [r3]
	adds r5, r4, 0
	adds r5, 0x3F
	ldrb r1, [r5]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	adds r0, r4, 0
	adds r0, 0x2D
	strb r2, [r0]
	adds r2, r4, 0
	adds r2, 0x2A
	ldrb r1, [r2]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	mov r9, r0
	lsls r0, 16
	mov r8, r0
	asrs r1, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08007950
	ldrb r1, [r5]
	subs r0, 0x4
	ands r0, r1
	strb r0, [r5]
	ldrb r1, [r2]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r0, 10
	lsrs r3, r1, 26
	lsls r1, r0, 9
	lsrs r7, r1, 31
	lsls r0, 8
	lsrs r6, r0, 31
	cmp r3, 0
	beq _080078E8
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080078E8:
	adds r2, r4, 0
	adds r2, 0x2C
	movs r0, 0x3F
	ands r3, r0
	ldrb r1, [r2]
	subs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08007912
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SetSpriteOamFlipBits
_08007912:
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08007940
	adds r0, r4, 0
	adds r0, 0x40
	ldrh r1, [r0]
	add r1, r9
	ldr r2, _08007938 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _0800793C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	b _08007950
	.align 2, 0
_08007938: .4byte 0x000003ff
_0800793C: .4byte 0xfffffc00
_08007940:
	mov r1, r8
	lsrs r0, r1, 16
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldr r2, [r4, 0xC]
	bl RequestSpriteFrameImageCopy
_08007950:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BeginAnim

	thumb_func_start ContinueAnim
ContinueAnim: @ 800795C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	beq _080079AC
	adds r0, r4, 0
	bl DecrementAnimDelayCounter
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r0, 9
	lsrs r3, r1, 31
	lsls r0, 8
	lsrs r2, r0, 31
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080079F2
	adds r0, r4, 0
	adds r1, r3, 0
	bl SetSpriteOamFlipBits
	b _080079F2
_080079AC:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080079F2
	adds r2, r4, 0
	adds r2, 0x2B
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0x3
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bge _080079E2
	adds r0, 0x3
	lsls r0, 16
	lsrs r2, r0, 16
_080079E2:
	ldr r0, _080079F8 @ =gUnknown_8231D28
	lsls r1, r2, 16
	asrs r1, 14
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
_080079F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080079F8: .4byte gUnknown_8231D28
	thumb_func_end ContinueAnim

	thumb_func_start AnimCmd_frame
AnimCmd_frame: @ 80079FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r7, [r0]
	mov r8, r7
	ldr r0, [r0]
	lsls r1, r0, 10
	lsrs r3, r1, 26
	lsls r1, r0, 9
	lsrs r6, r1, 31
	lsls r0, 8
	lsrs r5, r0, 31
	cmp r3, 0
	beq _08007A36
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_08007A36:
	adds r2, r4, 0
	adds r2, 0x2C
	movs r0, 0x3F
	ands r3, r0
	ldrb r1, [r2]
	subs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08007A60
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl SetSpriteOamFlipBits
_08007A60:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08007A90
	adds r0, r4, 0
	adds r0, 0x40
	ldrh r1, [r0]
	adds r1, r7
	ldr r2, _08007A88 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _08007A8C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	b _08007A9E
	.align 2, 0
_08007A88: .4byte 0x000003ff
_08007A8C: .4byte 0xfffffc00
_08007A90:
	mov r0, r8
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldr r2, [r4, 0xC]
	bl RequestSpriteFrameImageCopy
_08007A9E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_frame

	thumb_func_start AnimCmd_end
AnimCmd_end: @ 8007AA8
	adds r2, r0, 0
	adds r2, 0x2B
	ldrb r1, [r2]
	subs r1, 0x1
	strb r1, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end AnimCmd_end

	thumb_func_start AnimCmd_jump
AnimCmd_jump: @ 8007AC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r3, r4, 0
	adds r3, 0x2A
	ldrb r1, [r3]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r2, r4, 0
	adds r2, 0x2B
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	strb r0, [r2]
	ldrb r0, [r3]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r7, [r1]
	mov r8, r7
	ldr r0, [r1]
	lsls r1, r0, 10
	lsrs r3, r1, 26
	lsls r1, r0, 9
	lsrs r6, r1, 31
	lsls r0, 8
	lsrs r5, r0, 31
	cmp r3, 0
	beq _08007B14
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_08007B14:
	adds r2, r4, 0
	adds r2, 0x2C
	movs r0, 0x3F
	ands r3, r0
	ldrb r1, [r2]
	subs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08007B3E
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl SetSpriteOamFlipBits
_08007B3E:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08007B70
	adds r0, r4, 0
	adds r0, 0x40
	ldrh r1, [r0]
	adds r1, r7
	ldr r2, _08007B68 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _08007B6C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	b _08007B7E
	.align 2, 0
_08007B68: .4byte 0x000003ff
_08007B6C: .4byte 0xfffffc00
_08007B70:
	mov r0, r8
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldr r2, [r4, 0xC]
	bl RequestSpriteFrameImageCopy
_08007B7E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_jump

	thumb_func_start AnimCmd_loop
AnimCmd_loop: @ 8007B88
	push {lr}
	adds r1, r0, 0
	adds r0, 0x2D
	ldrb r0, [r0]
	cmp r0, 0
	beq _08007B9C
	adds r0, r1, 0
	bl ContinueAnimLoop
	b _08007BA2
_08007B9C:
	adds r0, r1, 0
	bl BeginAnimLoop
_08007BA2:
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_loop

	thumb_func_start BeginAnimLoop
BeginAnimLoop: @ 8007BA8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	adds r1, r4, 0
	adds r1, 0x2D
	strb r0, [r1]
	adds r0, r4, 0
	bl JumpToTopOfAnimLoop
	adds r0, r4, 0
	bl ContinueAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BeginAnimLoop

	thumb_func_start ContinueAnimLoop
ContinueAnimLoop: @ 8007BE0
	push {r4,lr}
	adds r4, r0, 0
	adds r1, r4, 0
	adds r1, 0x2D
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl JumpToTopOfAnimLoop
	adds r0, r4, 0
	bl ContinueAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContinueAnimLoop

	thumb_func_start JumpToTopOfAnimLoop
JumpToTopOfAnimLoop: @ 8007C00
	push {r4-r7,lr}
	mov r12, r0
	adds r0, 0x2D
	ldrb r0, [r0]
	cmp r0, 0
	beq _08007C6C
	mov r3, r12
	adds r3, 0x2B
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	mov r5, r12
	adds r5, 0x2A
	ldrb r1, [r5]
	mov r2, r12
	ldr r0, [r2, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	subs r0, 0x4
	movs r7, 0
	ldrsh r0, [r0, r7]
	movs r1, 0x3
	negs r1, r1
	adds r4, r3, 0
	cmp r0, r1
	beq _08007C66
	adds r6, r1, 0
	adds r2, r4, 0
_08007C40:
	ldrb r0, [r2]
	cmp r0, 0
	beq _08007C66
	subs r0, 0x1
	strb r0, [r3]
	ldrb r1, [r5]
	mov r7, r12
	ldr r0, [r7, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	subs r0, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r6
	bne _08007C40
_08007C66:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
_08007C6C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end JumpToTopOfAnimLoop

	thumb_func_start BeginAffineAnim
BeginAffineAnim: @ 8007C74
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r0, 0
	ldrb r0, [r6, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08007CF6
	ldr r0, [r6, 0x10]
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _08007D00 @ =0x00007fff
	cmp r1, r0
	beq _08007CF6
	adds r0, r6, 0
	bl GetSpriteMatrixNum
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl AffineAnimStateRestartAnim
	mov r5, sp
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r7, r6, 0
	adds r7, 0x3F
	ldrb r1, [r7]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r7]
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldr r1, _08007D04 @ =gUnknown_3000C68
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r5, 0x5]
	strb r1, [r0, 0x2]
	ldrb r1, [r7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08007CF6
	movs r0, 0x3A
	ldrsh r1, [r6, r0]
	movs r0, 0x3C
	ldrsh r2, [r6, r0]
	adds r0, r6, 0
	bl obj_update_pos2
_08007CF6:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007D00: .4byte 0x00007fff
_08007D04: .4byte gUnknown_3000C68
	thumb_func_end BeginAffineAnim

	thumb_func_start ContinueAffineAnim
ContinueAffineAnim: @ 8007D08
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08007DAA
	adds r0, r4, 0
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	ldr r1, _08007D40 @ =gUnknown_3000C68
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0x2]
	cmp r0, 0
	beq _08007D44
	adds r0, r2, 0
	adds r1, r4, 0
	bl AffineAnimDelay
	b _08007D8E
	.align 2, 0
_08007D40: .4byte gUnknown_3000C68
_08007D44:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08007DAA
	ldrb r0, [r3, 0x1]
	adds r0, 0x1
	strb r0, [r3, 0x1]
	ldrb r0, [r3]
	ldr r1, [r4, 0x10]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r3, 0x1]
	ldr r0, [r0]
	lsls r1, 3
	adds r1, r0
	movs r2, 0x3
	movs r0, 0
	ldrsh r1, [r1, r0]
	ldr r0, _08007DB0 @ =0x00007ffc
	cmp r1, r0
	ble _08007D7C
	ldr r2, _08007DB4 @ =0xffff8003
	adds r0, r1, r2
	lsls r0, 16
	lsrs r2, r0, 16
_08007D7C:
	ldr r0, _08007DB8 @ =gUnknown_8231D38
	lsls r1, r2, 16
	asrs r1, 14
	adds r1, r0
	ldr r2, [r1]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r2
_08007D8E:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08007DAA
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	adds r0, r4, 0
	bl obj_update_pos2
_08007DAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007DB0: .4byte 0x00007ffc
_08007DB4: .4byte 0xffff8003
_08007DB8: .4byte gUnknown_8231D38
	thumb_func_end ContinueAffineAnim

	thumb_func_start AffineAnimDelay
AffineAnimDelay: @ 8007DBC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecrementAffineAnimDelayCounter
	lsls r0, 24
	cmp r0, 0
	bne _08007DE6
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
_08007DE6:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end AffineAnimDelay

	thumb_func_start AffineAnimCmd_loop
AffineAnimCmd_loop: @ 8007DF0
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08007E14 @ =gUnknown_3000C68
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _08007E18
	adds r0, r2, 0
	adds r1, r3, 0
	bl ContinueAffineAnimLoop
	b _08007E20
	.align 2, 0
_08007E14: .4byte gUnknown_3000C68
_08007E18:
	adds r0, r2, 0
	adds r1, r3, 0
	bl BeginAffineAnimLoop
_08007E20:
	pop {r0}
	bx r0
	thumb_func_end AffineAnimCmd_loop

	thumb_func_start BeginAffineAnimLoop
BeginAffineAnimLoop: @ 8007E24
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08007E5C @ =gUnknown_3000C68
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r1
	ldrb r2, [r3]
	ldr r1, [r4, 0x10]
	lsls r2, 2
	adds r2, r1
	ldrb r1, [r3, 0x1]
	ldr r2, [r2]
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0x2]
	strb r1, [r3, 0x3]
	adds r1, r4, 0
	bl JumpToTopOfAffineAnimLoop
	adds r0, r4, 0
	bl ContinueAffineAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007E5C: .4byte gUnknown_3000C68
	thumb_func_end BeginAffineAnimLoop

	thumb_func_start ContinueAffineAnimLoop
ContinueAffineAnimLoop: @ 8007E60
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08007E8C @ =gUnknown_3000C68
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x3]
	subs r2, 0x1
	strb r2, [r1, 0x3]
	adds r1, r4, 0
	bl JumpToTopOfAffineAnimLoop
	adds r0, r4, 0
	bl ContinueAffineAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007E8C: .4byte gUnknown_3000C68
	thumb_func_end ContinueAffineAnimLoop

	thumb_func_start JumpToTopOfAffineAnimLoop
JumpToTopOfAffineAnimLoop: @ 8007E90
	push {r4-r7,lr}
	mov r12, r1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08007EB4 @ =gUnknown_3000C68
	lsls r3, r5, 1
	adds r0, r3, r5
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x3]
	adds r6, r1, 0
	cmp r0, 0
	beq _08007EF0
	ldrb r0, [r2, 0x1]
	subs r0, 0x1
	strb r0, [r2, 0x1]
	adds r4, r3, 0
	b _08007EC0
	.align 2, 0
_08007EB4: .4byte gUnknown_3000C68
_08007EB8:
	cmp r2, 0
	beq _08007EE4
	subs r0, r2, 0x1
	strb r0, [r3, 0x1]
_08007EC0:
	adds r0, r4, r5
	lsls r0, 2
	adds r3, r0, r6
	ldrb r0, [r3]
	mov r2, r12
	ldr r1, [r2, 0x10]
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r3, 0x1]
	ldr r1, [r0]
	lsls r0, r2, 3
	adds r0, r1
	subs r0, 0x8
	movs r7, 0
	ldrsh r1, [r0, r7]
	ldr r0, _08007EF8 @ =0x00007ffd
	cmp r1, r0
	bne _08007EB8
_08007EE4:
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x1]
	subs r0, 0x1
	strb r0, [r1, 0x1]
_08007EF0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007EF8: .4byte 0x00007ffd
	thumb_func_end JumpToTopOfAffineAnimLoop

	thumb_func_start AffineAnimCmd_jump
AffineAnimCmd_jump: @ 8007EFC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08007F44 @ =gUnknown_3000C68
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrb r2, [r4]
	ldr r0, [r1, 0x10]
	lsls r2, 2
	adds r2, r0
	ldrb r0, [r4, 0x1]
	ldr r2, [r2]
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x2]
	strb r0, [r4, 0x1]
	mov r6, sp
	adds r0, r5, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r5, 0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldrb r0, [r6, 0x5]
	strb r0, [r4, 0x2]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007F44: .4byte gUnknown_3000C68
	thumb_func_end AffineAnimCmd_jump

	thumb_func_start AffineAnimCmd_end
AffineAnimCmd_end: @ 8007F48
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	movs r3, 0
	str r2, [sp]
	str r3, [sp, 0x4]
	adds r1, 0x3F
	ldrb r2, [r1]
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r1]
	ldr r2, _08007F80 @ =gUnknown_3000C68
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	subs r2, 0x1
	strb r2, [r1, 0x1]
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08007F80: .4byte gUnknown_3000C68
	thumb_func_end AffineAnimCmd_end

	thumb_func_start AffineAnimCmd_frame
AffineAnimCmd_frame: @ 8007F84
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r0, r4, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldr r1, _08007FB8 @ =gUnknown_3000C68
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r5, 0x5]
	strb r1, [r0, 0x2]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007FB8: .4byte gUnknown_3000C68
	thumb_func_end AffineAnimCmd_frame

	thumb_func_start CopyOamMatrix
CopyOamMatrix: @ 8007FBC
	lsls r0, 24
	ldr r2, _08007FD8 @ =gUnknown_2021BCC
	lsrs r0, 21
	adds r0, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, 0x2]
	strh r2, [r0, 0x2]
	ldrh r2, [r1, 0x4]
	strh r2, [r0, 0x4]
	ldrh r1, [r1, 0x6]
	strh r1, [r0, 0x6]
	bx lr
	.align 2, 0
_08007FD8: .4byte gUnknown_2021BCC
	thumb_func_end CopyOamMatrix

	thumb_func_start GetSpriteMatrixNum
GetSpriteMatrixNum: @ 8007FDC
	push {lr}
	adds r2, r0, 0
	movs r3, 0
	ldrb r0, [r2, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08007FF6
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r3, r0, 27
_08007FF6:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end GetSpriteMatrixNum

	thumb_func_start sub_8007FFC
sub_8007FFC: @ 8007FFC
	strh r1, [r0, 0x3A]
	strh r2, [r0, 0x3C]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8007FFC

	thumb_func_start sub_800800C
sub_800800C: @ 800800C
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r2, 0
	subs r0, r1, r3
	cmp r0, 0
	bge _0800801E
	negs r0, r0
	asrs r4, r0, 9
	b _08008022
_0800801E:
	asrs r0, 9
	negs r4, r0
_08008022:
	adds r0, r5, 0
	muls r0, r1
	adds r1, r3, 0
	bl __udivsi3
	adds r0, r4
	subs r0, r5, r0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_800800C

	thumb_func_start obj_update_pos2
obj_update_pos2: @ 8008038
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	ldrb r1, [r5, 0x3]
	lsls r0, r1, 26
	lsrs r7, r0, 27
	movs r0, 0x80
	lsls r0, 4
	mov r9, r0
	cmp r6, r9
	beq _08008086
	ldr r2, _080080CC @ =gUnknown_8231D48
	lsrs r1, 6
	lsls r1, 3
	ldrb r0, [r5, 0x1]
	lsrs r0, 6
	lsls r0, 5
	adds r1, r0
	adds r1, r2
	ldr r0, [r1]
	lsls r4, r0, 8
	lsls r0, 16
	ldr r2, _080080D0 @ =gUnknown_2021BCC
	lsls r1, r7, 3
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, 0
	adds r0, r4, 0
	adds r2, r6, 0
	bl sub_800800C
	strh r0, [r5, 0x24]
_08008086:
	cmp r8, r9
	beq _080080BE
	ldr r2, _080080CC @ =gUnknown_8231D48
	ldrb r1, [r5, 0x3]
	lsrs r1, 6
	lsls r1, 3
	ldrb r0, [r5, 0x1]
	lsrs r0, 6
	lsls r0, 5
	adds r1, r0
	adds r2, 0x4
	adds r1, r2
	ldr r0, [r1]
	lsls r4, r0, 8
	lsls r0, 16
	ldr r2, _080080D0 @ =gUnknown_2021BCC
	lsls r1, r7, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, 0
	adds r0, r4, 0
	mov r2, r8
	bl sub_800800C
	strh r0, [r5, 0x26]
_080080BE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080080CC: .4byte gUnknown_8231D48
_080080D0: .4byte gUnknown_2021BCC
	thumb_func_end obj_update_pos2

	thumb_func_start SetSpriteOamFlipBits
SetSpriteOamFlipBits: @ 80080D4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldrb r6, [r0, 0x3]
	lsls r3, r6, 26
	lsrs r3, 27
	movs r4, 0x7
	ands r3, r4
	lsls r3, 1
	subs r4, 0x46
	mov r8, r4
	mov r5, r8
	ands r5, r6
	orrs r5, r3
	strb r5, [r0, 0x3]
	lsls r4, r5, 26
	lsrs r4, 27
	movs r6, 0x3F
	adds r6, r0
	mov r12, r6
	ldrb r3, [r6]
	lsls r3, 31
	lsrs r3, 31
	eors r1, r3
	movs r6, 0x1
	ands r1, r6
	lsls r1, 3
	orrs r4, r1
	lsls r4, 1
	mov r3, r8
	ands r3, r5
	orrs r3, r4
	strb r3, [r0, 0x3]
	lsls r4, r3, 26
	lsrs r4, 27
	mov r5, r12
	ldrb r1, [r5]
	lsls r1, 30
	lsrs r1, 31
	eors r2, r1
	ands r2, r6
	lsls r2, 4
	orrs r4, r2
	lsls r4, 1
	mov r6, r8
	ands r3, r6
	orrs r3, r4
	strb r3, [r0, 0x3]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SetSpriteOamFlipBits

	thumb_func_start AffineAnimStateRestartAnim
AffineAnimStateRestartAnim: @ 8008148
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08008160 @ =gUnknown_3000C68
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	strb r0, [r1, 0x3]
	bx lr
	.align 2, 0
_08008160: .4byte gUnknown_3000C68
	thumb_func_end AffineAnimStateRestartAnim

	thumb_func_start AffineAnimStateStartAnim
AffineAnimStateStartAnim: @ 8008164
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08008188 @ =gUnknown_3000C68
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r3, 0
	strb r1, [r2]
	strb r3, [r2, 0x1]
	strb r3, [r2, 0x2]
	strb r3, [r2, 0x3]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r2, 0x4]
	strh r0, [r2, 0x6]
	strh r3, [r2, 0x8]
	bx lr
	.align 2, 0
_08008188: .4byte gUnknown_3000C68
	thumb_func_end AffineAnimStateStartAnim

	thumb_func_start AffineAnimStateReset
AffineAnimStateReset: @ 800818C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080081B0 @ =gUnknown_3000C68
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	strb r0, [r1, 0x3]
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r1, 0x4]
	strh r2, [r1, 0x6]
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_080081B0: .4byte gUnknown_3000C68
	thumb_func_end AffineAnimStateReset

	thumb_func_start ApplyAffineAnimFrameAbsolute
ApplyAffineAnimFrameAbsolute: @ 80081B4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080081D4 @ =gUnknown_3000C68
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r1]
	strh r0, [r2, 0x4]
	ldrh r0, [r1, 0x2]
	strh r0, [r2, 0x6]
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	strh r0, [r2, 0x8]
	bx lr
	.align 2, 0
_080081D4: .4byte gUnknown_3000C68
	thumb_func_end ApplyAffineAnimFrameAbsolute

	thumb_func_start DecrementAnimDelayCounter
DecrementAnimDelayCounter: @ 80081D8
	push {lr}
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _080081FC
	lsls r0, r2, 26
	lsrs r0, 26
	subs r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_080081FC:
	pop {r0}
	bx r0
	thumb_func_end DecrementAnimDelayCounter

	thumb_func_start DecrementAffineAnimDelayCounter
DecrementAffineAnimDelayCounter: @ 8008200
	push {lr}
	lsls r1, 24
	lsrs r2, r1, 24
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08008224
	ldr r0, _0800822C @ =gUnknown_3000C68
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x2]
	subs r0, 0x1
	strb r0, [r1, 0x2]
_08008224:
	ldrb r0, [r3]
	lsrs r0, 7
	pop {r1}
	bx r1
	.align 2, 0
_0800822C: .4byte gUnknown_3000C68
	thumb_func_end DecrementAffineAnimDelayCounter

	thumb_func_start ApplyAffineAnimFrameRelativeAndUpdateMatrix
ApplyAffineAnimFrameRelativeAndUpdateMatrix: @ 8008230
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080082B8 @ =gUnknown_3000C68
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r1]
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r4, 0x4]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x6]
	adds r0, r2
	strh r0, [r4, 0x6]
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	ldrh r1, [r4, 0x8]
	adds r0, r1
	ldr r2, _080082BC @ =0xffffff00
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r4, 0x8]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	bl ConvertScaleParam
	lsls r0, 16
	lsrs r0, 16
	ldr r6, _080082C0 @ =0xffff0000
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	bl ConvertScaleParam
	lsls r0, 16
	ldr r2, _080082C4 @ =0x0000ffff
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldrh r1, [r4, 0x8]
	ldr r0, [sp, 0x4]
	ands r0, r6
	orrs r0, r1
	str r0, [sp, 0x4]
	add r4, sp, 0x8
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	adds r0, r5, 0
	adds r1, r4, 0
	bl CopyOamMatrix
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080082B8: .4byte gUnknown_3000C68
_080082BC: .4byte 0xffffff00
_080082C0: .4byte 0xffff0000
_080082C4: .4byte 0x0000ffff
	thumb_func_end ApplyAffineAnimFrameRelativeAndUpdateMatrix

	thumb_func_start ConvertScaleParam
ConvertScaleParam: @ 80082C8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 9
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end ConvertScaleParam

	thumb_func_start GetAffineAnimFrame
GetAffineAnimFrame: @ 80082E0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08008348 @ =gUnknown_3000C68
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r3, [r3]
	lsls r0, 3
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r3, [r3]
	lsls r0, 3
	adds r0, r3
	ldrh r0, [r0, 0x2]
	strh r0, [r2, 0x2]
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r3, [r3]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x4]
	strb r0, [r2, 0x4]
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x5]
	strb r0, [r2, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008348: .4byte gUnknown_3000C68
	thumb_func_end GetAffineAnimFrame

	thumb_func_start ApplyAffineAnimFrame
ApplyAffineAnimFrame: @ 800834C
	push {r4,lr}
	sub sp, 0x8
	adds r2, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrb r0, [r2, 0x5]
	cmp r0, 0
	beq _08008372
	subs r0, 0x1
	strb r0, [r2, 0x5]
	adds r0, r4, 0
	adds r1, r2, 0
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
	b _08008382
_08008372:
	adds r0, r4, 0
	adds r1, r2, 0
	bl ApplyAffineAnimFrameAbsolute
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
_08008382:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ApplyAffineAnimFrame

	thumb_func_start StartSpriteAnim
StartSpriteAnim: @ 800838C
	adds r2, r0, 0
	adds r2, 0x2A
	strb r1, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	movs r2, 0x11
	negs r2, r2
	ands r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end StartSpriteAnim

	thumb_func_start StartSpriteAnimIfDifferent
StartSpriteAnimIfDifferent: @ 80083A4
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, r1
	beq _080083BA
	adds r0, r2, 0
	bl StartSpriteAnim
_080083BA:
	pop {r0}
	bx r0
	thumb_func_end StartSpriteAnimIfDifferent

	thumb_func_start SeekSpriteAnim
SeekSpriteAnim: @ 80083C0
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r3, 0
	adds r4, 0x2C
	ldrb r0, [r4]
	lsls r0, 25
	lsrs r6, r0, 31
	subs r1, 0x1
	adds r0, r3, 0
	adds r0, 0x2B
	strb r1, [r0]
	ldrb r1, [r4]
	movs r7, 0x40
	negs r7, r7
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r4]
	adds r2, r3, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	movs r5, 0x41
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r4]
	adds r0, r3, 0
	bl ContinueAnim
	ldrb r2, [r4]
	movs r0, 0x3F
	ands r0, r2
	cmp r0, 0
	beq _08008428
	lsls r0, r2, 26
	lsrs r0, 26
	adds r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	adds r1, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
_08008428:
	lsls r2, r6, 6
	ldrb r1, [r4]
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SeekSpriteAnim

	thumb_func_start StartSpriteAffineAnim
StartSpriteAffineAnim: @ 800843C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl AffineAnimStateStartAnim
	adds r5, 0x3F
	ldrb r0, [r5]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end StartSpriteAffineAnim

	thumb_func_start StartSpriteAffineAnimIfDifferent
StartSpriteAffineAnimIfDifferent: @ 8008468
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08008498 @ =gUnknown_3000C68
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, r4
	beq _08008490
	adds r0, r5, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
_08008490:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008498: .4byte gUnknown_3000C68
	thumb_func_end StartSpriteAffineAnimIfDifferent

	thumb_func_start ChangeSpriteAffineAnim
ChangeSpriteAffineAnim: @ 800849C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080084D0 @ =gUnknown_3000C68
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strb r4, [r1]
	adds r5, 0x3F
	ldrb r0, [r5]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080084D0: .4byte gUnknown_3000C68
	thumb_func_end ChangeSpriteAffineAnim

	thumb_func_start ChangeSpriteAffineAnimIfDifferent
ChangeSpriteAffineAnimIfDifferent: @ 80084D4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08008504 @ =gUnknown_3000C68
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, r4
	beq _080084FC
	adds r0, r5, 0
	adds r1, r4, 0
	bl ChangeSpriteAffineAnim
_080084FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008504: .4byte gUnknown_3000C68
	thumb_func_end ChangeSpriteAffineAnimIfDifferent

	thumb_func_start SetSpriteSheetFrameTileNum
SetSpriteSheetFrameTileNum: @ 8008508
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08008554
	adds r0, r3, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r3, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r2, [r0]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0800853C
	movs r2, 0
_0800853C:
	adds r0, r3, 0
	adds r0, 0x40
	ldrh r1, [r0]
	adds r1, r2
	ldr r2, _08008558 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _0800855C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
_08008554:
	pop {r0}
	bx r0
	.align 2, 0
_08008558: .4byte 0x000003ff
_0800855C: .4byte 0xfffffc00
	thumb_func_end SetSpriteSheetFrameTileNum

	thumb_func_start ResetAffineAnimData
ResetAffineAnimData: @ 8008560
	push {r4,lr}
	ldr r1, _0800858C @ =gUnknown_2021CCC
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08008590 @ =gUnknown_3003E54
	movs r0, 0
	str r0, [r1]
	bl ResetOamMatrices
	movs r4, 0
_08008574:
	adds r0, r4, 0
	bl AffineAnimStateReset
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08008574
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800858C: .4byte gUnknown_2021CCC
_08008590: .4byte gUnknown_3003E54
	thumb_func_end ResetAffineAnimData

	thumb_func_start AllocOamMatrix
AllocOamMatrix: @ 8008594
	push {r4,lr}
	movs r2, 0
	movs r1, 0x1
	ldr r0, _080085B4 @ =gUnknown_3003E54
	ldr r4, [r0]
	adds r3, r0, 0
_080085A0:
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080085B8
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r0, r2, 0
	b _080085C6
	.align 2, 0
_080085B4: .4byte gUnknown_3003E54
_080085B8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 1
	cmp r2, 0x1F
	bls _080085A0
	movs r0, 0xFF
_080085C6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AllocOamMatrix

	thumb_func_start FreeOamMatrix
FreeOamMatrix: @ 80085CC
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0
	movs r1, 0x1
	ldr r3, _08008608 @ =gUnknown_3003E54
	cmp r0, r2
	bcs _080085EA
_080085DE:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 1
	cmp r0, r2
	bcc _080085DE
_080085EA:
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	movs r1, 0x80
	lsls r1, 1
	str r1, [sp]
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08008608: .4byte gUnknown_3003E54
	thumb_func_end FreeOamMatrix

	thumb_func_start InitSpriteAffineAnim
InitSpriteAffineAnim: @ 800860C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	beq _08008654
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	movs r0, 0x1F
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl AffineAnimStateReset
_08008654:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end InitSpriteAffineAnim

	thumb_func_start SetOamMatrixRotationScaling
SetOamMatrixRotationScaling: @ 800865C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	adds r6, r0, 0
	adds r0, r1, 0
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r0, 16
	asrs r0, 16
	bl ConvertScaleParam
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080086D4 @ =0xffff0000
	mov r8, r1
	ldr r1, [sp]
	mov r2, r8
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl ConvertScaleParam
	lsls r0, 16
	ldr r2, _080086D8 @ =0x0000ffff
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r0, [sp, 0x4]
	mov r1, r8
	ands r0, r1
	orrs r0, r5
	str r0, [sp, 0x4]
	add r4, sp, 0x8
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	adds r0, r6, 0
	adds r1, r4, 0
	bl CopyOamMatrix
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080086D4: .4byte 0xffff0000
_080086D8: .4byte 0x0000ffff
	thumb_func_end SetOamMatrixRotationScaling

	thumb_func_start LoadSpriteSheet
LoadSpriteSheet: @ 80086DC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	lsrs r0, 5
	bl AllocSpriteTiles
	lsls r4, r0, 16
	asrs r6, r4, 16
	cmp r6, 0
	blt _08008718
	ldrh r0, [r5, 0x6]
	lsrs r4, 16
	ldrh r2, [r5, 0x4]
	lsrs r2, 5
	adds r1, r4, 0
	bl AllocSpriteTileRange
	ldr r0, [r5]
	lsls r1, r6, 5
	ldr r2, _08008714 @ =0x06010000
	adds r1, r2
	ldrh r2, [r5, 0x4]
	lsrs r2, 1
	bl CpuSet
	adds r0, r4, 0
	b _0800871A
	.align 2, 0
_08008714: .4byte 0x06010000
_08008718:
	movs r0, 0
_0800871A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end LoadSpriteSheet

	thumb_func_start LoadSpriteSheets
LoadSpriteSheets: @ 8008720
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r0, [r5]
	cmp r0, 0
	beq _08008744
_0800872C:
	lsls r0, r4, 3
	adds r0, r5, r0
	bl LoadSpriteSheet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 3
	adds r0, r5
	ldr r0, [r0]
	cmp r0, 0
	bne _0800872C
_08008744:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadSpriteSheets

	thumb_func_start FreeSpriteTilesByTag
FreeSpriteTilesByTag: @ 800874C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	bl IndexOfSpriteTileTag
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _080087AA
	ldr r0, _080087B4 @ =gUnknown_3000B68
	lsls r1, r4, 2
	adds r2, r1, r0
	adds r0, 0x2
	adds r1, r0
	ldrh r0, [r1]
	ldrh r3, [r2]
	adds r0, r3, r0
	ldr r1, _080087B8 @ =gUnknown_3000AE8
	mov r8, r1
	lsls r5, r4, 1
	cmp r3, r0
	bge _080087A2
	ldr r1, _080087BC @ =gUnknown_2021B48
	mov r12, r1
	movs r6, 0x7
	movs r7, 0x1
	adds r4, r0, 0
_08008786:
	lsrs r2, r3, 3
	add r2, r12
	adds r0, r3, 0
	ands r0, r6
	adds r1, r7, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _08008786
_080087A2:
	mov r0, r8
	adds r1, r5, r0
	ldr r0, _080087C0 @ =0x0000ffff
	strh r0, [r1]
_080087AA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080087B4: .4byte gUnknown_3000B68
_080087B8: .4byte gUnknown_3000AE8
_080087BC: .4byte gUnknown_2021B48
_080087C0: .4byte 0x0000ffff
	thumb_func_end FreeSpriteTilesByTag

	thumb_func_start FreeSpriteTileRanges
FreeSpriteTileRanges: @ 80087C4
	push {r4-r7,lr}
	movs r2, 0
	ldr r7, _080087F8 @ =gUnknown_3000AE8
	ldr r0, _080087FC @ =0x0000ffff
	adds r6, r0, 0
	ldr r4, _08008800 @ =gUnknown_3000B68
	movs r3, 0
	adds r5, r4, 0x2
_080087D4:
	lsls r1, r2, 1
	adds r1, r7
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	lsls r1, r2, 2
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _080087D4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080087F8: .4byte gUnknown_3000AE8
_080087FC: .4byte 0x0000ffff
_08008800: .4byte gUnknown_3000B68
	thumb_func_end FreeSpriteTileRanges

	thumb_func_start GetSpriteTileStartByTag
GetSpriteTileStartByTag: @ 8008804
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl IndexOfSpriteTileTag
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08008824
	ldr r0, _08008820 @ =gUnknown_3000B68
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	b _08008826
	.align 2, 0
_08008820: .4byte gUnknown_3000B68
_08008824:
	ldr r0, _0800882C @ =0x0000ffff
_08008826:
	pop {r1}
	bx r1
	.align 2, 0
_0800882C: .4byte 0x0000ffff
	thumb_func_end GetSpriteTileStartByTag

	thumb_func_start IndexOfSpriteTileTag
IndexOfSpriteTileTag: @ 8008830
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _08008848 @ =gUnknown_3000AE8
_0800883A:
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0800884C
	adds r0, r1, 0
	b _08008858
	.align 2, 0
_08008848: .4byte gUnknown_3000AE8
_0800884C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3F
	bls _0800883A
	movs r0, 0xFF
_08008858:
	pop {r1}
	bx r1
	thumb_func_end IndexOfSpriteTileTag

	thumb_func_start GetSpriteTileTagByTileStart
GetSpriteTileTagByTileStart: @ 800885C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r6, _08008884 @ =gUnknown_3000AE8
	ldr r5, _08008888 @ =0x0000ffff
	ldr r4, _0800888C @ =gUnknown_3000B68
_0800886A:
	lsls r0, r2, 1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, r5
	beq _08008890
	lsls r0, r2, 2
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	bne _08008890
	ldrh r0, [r1]
	b _0800889C
	.align 2, 0
_08008884: .4byte gUnknown_3000AE8
_08008888: .4byte 0x0000ffff
_0800888C: .4byte gUnknown_3000B68
_08008890:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _0800886A
	ldr r0, _080088A4 @ =0x0000ffff
_0800889C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080088A4: .4byte 0x0000ffff
	thumb_func_end GetSpriteTileTagByTileStart

	thumb_func_start AllocSpriteTileRange
AllocSpriteTileRange: @ 80088A8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080088E4 @ =0x0000ffff
	bl IndexOfSpriteTileTag
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080088E8 @ =gUnknown_3000AE8
	lsls r1, r0, 1
	adds r1, r2
	strh r4, [r1]
	ldr r1, _080088EC @ =gUnknown_3000B68
	lsls r0, 2
	adds r2, r0, r1
	strh r5, [r2]
	adds r1, 0x2
	adds r0, r1
	strh r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080088E4: .4byte 0x0000ffff
_080088E8: .4byte gUnknown_3000AE8
_080088EC: .4byte gUnknown_3000B68
	thumb_func_end AllocSpriteTileRange

	thumb_func_start FreeAllSpritePalettes
FreeAllSpritePalettes: @ 80088F0
	push {r4,lr}
	ldr r1, _0800891C @ =gUnknown_3003E58
	movs r0, 0
	strb r0, [r1]
	movs r2, 0
	ldr r4, _08008920 @ =gUnknown_3000DE8
	ldr r0, _08008924 @ =0x0000ffff
	adds r3, r0, 0
_08008900:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _08008900
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800891C: .4byte gUnknown_3003E58
_08008920: .4byte gUnknown_3000DE8
_08008924: .4byte 0x0000ffff
	thumb_func_end FreeAllSpritePalettes

	thumb_func_start LoadSpritePalette
LoadSpritePalette: @ 8008928
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _0800893E
	adds r0, r4, 0
	b _0800896E
_0800893E:
	ldr r0, _08008964 @ =0x0000ffff
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _0800896C
	ldr r1, _08008968 @ =gUnknown_3000DE8
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r5, 0x4]
	strh r1, [r0]
	ldr r0, [r5]
	lsls r1, r4, 4
	bl DoLoadSpritePalette
	adds r0, r4, 0
	b _0800896E
	.align 2, 0
_08008964: .4byte 0x0000ffff
_08008968: .4byte gUnknown_3000DE8
_0800896C:
	movs r0, 0xFF
_0800896E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end LoadSpritePalette

	thumb_func_start LoadSpritePalettes
LoadSpritePalettes: @ 8008974
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	b _08008982
_0800897C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08008982:
	lsls r0, r4, 3
	adds r1, r0, r5
	ldr r0, [r1]
	cmp r0, 0
	beq _0800899A
	adds r0, r1, 0
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0800897C
_0800899A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadSpritePalettes

	thumb_func_start DoLoadSpritePalette
DoLoadSpritePalette: @ 80089A0
	push {lr}
	lsls r1, 16
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	thumb_func_end DoLoadSpritePalette

	thumb_func_start AllocSpritePalette
AllocSpritePalette: @ 80089B8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080089D8 @ =0x0000ffff
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080089E0
	ldr r1, _080089DC @ =gUnknown_3000DE8
	lsls r0, r2, 1
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	b _080089E2
	.align 2, 0
_080089D8: .4byte 0x0000ffff
_080089DC: .4byte gUnknown_3000DE8
_080089E0:
	movs r0, 0xFF
_080089E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AllocSpritePalette

	thumb_func_start IndexOfSpritePaletteTag
IndexOfSpritePaletteTag: @ 80089E8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08008A08 @ =gUnknown_3003E58
	ldrb r1, [r0]
	cmp r1, 0xF
	bhi _08008A1A
	ldr r3, _08008A0C @ =gUnknown_3000DE8
_080089F8:
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08008A10
	adds r0, r1, 0
	b _08008A1C
	.align 2, 0
_08008A08: .4byte gUnknown_3003E58
_08008A0C: .4byte gUnknown_3000DE8
_08008A10:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080089F8
_08008A1A:
	movs r0, 0xFF
_08008A1C:
	pop {r1}
	bx r1
	thumb_func_end IndexOfSpritePaletteTag

	thumb_func_start GetSpritePaletteTagByPaletteNum
GetSpritePaletteTagByPaletteNum: @ 8008A20
	lsls r0, 24
	ldr r1, _08008A2C @ =gUnknown_3000DE8
	lsrs r0, 23
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08008A2C: .4byte gUnknown_3000DE8
	thumb_func_end GetSpritePaletteTagByPaletteNum

	thumb_func_start FreeSpritePaletteByTag
FreeSpritePaletteByTag: @ 8008A30
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08008A4C
	ldr r0, _08008A50 @ =gUnknown_3000DE8
	lsls r1, 1
	adds r1, r0
	ldr r0, _08008A54 @ =0x0000ffff
	strh r0, [r1]
_08008A4C:
	pop {r0}
	bx r0
	.align 2, 0
_08008A50: .4byte gUnknown_3000DE8
_08008A54: .4byte 0x0000ffff
	thumb_func_end FreeSpritePaletteByTag

	thumb_func_start SetSubspriteTables
SetSubspriteTables: @ 8008A58
	str r1, [r0, 0x18]
	adds r0, 0x42
	movs r1, 0x40
	strb r1, [r0]
	bx lr
	thumb_func_end SetSubspriteTables

	thumb_func_start AddSpriteToOamBuffer
AddSpriteToOamBuffer: @ 8008A64
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	ldr r1, _08008A78 @ =gUnknown_2021B44
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08008A7C
	movs r0, 0x1
	b _08008AC4
	.align 2, 0
_08008A78: .4byte gUnknown_2021B44
_08008A7C:
	ldr r0, [r4, 0x18]
	cmp r0, 0
	beq _08008A90
	adds r0, r4, 0
	adds r0, 0x42
	ldrb r1, [r0]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	bne _08008AB0
_08008A90:
	ldr r0, _08008AAC @ =gMain
	ldrb r2, [r3]
	lsls r2, 3
	adds r0, 0x38
	adds r2, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r0, 0
	b _08008AC4
	.align 2, 0
_08008AAC: .4byte gMain
_08008AB0:
	ldrb r1, [r3]
	lsls r1, 3
	ldr r0, _08008ACC @ =gMain + 0x38
	adds r1, r0
	adds r0, r4, 0
	adds r2, r3, 0
	bl AddSubspritesToOamBuffer
	lsls r0, 24
	lsrs r0, 24
_08008AC4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008ACC: .4byte gMain + 0x38
	thumb_func_end AddSpriteToOamBuffer

	thumb_func_start AddSubspritesToOamBuffer
AddSubspritesToOamBuffer: @ 8008AD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	adds r3, r0, 0
	str r1, [sp]
	mov r8, r2
	ldr r0, _08008AF0 @ =gUnknown_2021B44
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08008AF4
_08008AEC:
	movs r0, 0x1
	b _08008CCA
	.align 2, 0
_08008AF0: .4byte gUnknown_2021B44
_08008AF4:
	adds r0, r3, 0
	adds r0, 0x42
	ldrb r1, [r0]
	lsls r1, 26
	lsrs r1, 23
	ldr r2, [r3, 0x18]
	adds r7, r2, r1
	mov r12, r3
	str r0, [sp, 0x18]
	cmp r7, 0
	beq _08008B10
	ldr r0, [r7, 0x4]
	cmp r0, 0
	bne _08008B26
_08008B10:
	mov r2, r12
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [sp]
	str r0, [r2]
	str r1, [r2, 0x4]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08008CC8
_08008B26:
	mov r2, r12
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 22
	str r0, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0xC]
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	asrs r1, r0, 3
	str r1, [sp, 0x10]
	movs r1, 0x1
	ldr r2, [sp, 0x10]
	ands r2, r1
	str r2, [sp, 0x10]
	asrs r0, 4
	mov r10, r0
	ands r0, r1
	mov r10, r0
	mov r1, r12
	ldrh r0, [r1, 0x2]
	lsls r0, 23
	lsrs r0, 23
	adds r1, 0x28
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	mov r1, r12
	ldrb r0, [r1]
	adds r1, 0x29
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0xC]
	cmp r9, r1
	bcc _08008B84
	b _08008CC8
_08008B84:
	lsls r0, r2, 16
	asrs r0, 16
	str r0, [sp, 0x14]
_08008B8A:
	mov r2, r8
	ldrb r0, [r2]
	ldr r1, _08008CDC @ =gUnknown_2021B44
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08008AEC
	ldr r0, [r7, 0x4]
	mov r2, r9
	lsls r6, r2, 2
	adds r2, r6, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x1
	ldrsb r0, [r2, r0]
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [sp, 0x10]
	cmp r0, 0
	beq _08008BE0
	ldr r0, [r2]
	lsls r1, r0, 12
	lsrs r1, 30
	lsls r1, 2
	lsls r0, 14
	lsrs r0, 30
	lsls r0, 4
	adds r1, r0
	ldr r0, _08008CE0 @ =gUnknown_8231DA8
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r0, r4, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	mvns r0, r4
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08008BE0:
	mov r1, r10
	cmp r1, 0
	beq _08008C12
	ldr r0, [r2]
	lsls r1, r0, 12
	lsrs r1, 30
	lsls r1, 2
	lsls r0, 14
	lsrs r0, 30
	lsls r0, 4
	adds r1, r0
	ldr r2, _08008CE0 @ =gUnknown_8231DA8
	adds r1, r2
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	mvns r0, r5
	adds r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08008C12:
	mov r1, r9
	lsls r0, r1, 3
	ldr r2, [sp]
	adds r3, r0, r2
	mov r2, r12
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	str r0, [r3]
	str r1, [r3, 0x4]
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsls r1, 14
	lsrs r1, 30
	lsls r1, 6
	ldrb r2, [r3, 0x1]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsls r1, 12
	lsrs r1, 30
	lsls r1, 6
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	lsls r1, r4, 16
	asrs r1, 16
	ldr r0, [sp, 0x14]
	adds r1, r0, r1
	ldr r2, _08008CE4 @ =0x000001ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x2]
	ldr r0, _08008CE8 @ =0xfffffe00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldr r1, [sp, 0x8]
	adds r0, r1, r5
	strb r0, [r3]
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsls r1, 2
	lsrs r1, 22
	ldr r2, [sp, 0x4]
	adds r1, r2, r1
	ldr r2, _08008CEC @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08008CF0 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldr r0, [sp, 0x18]
	ldrb r1, [r0]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x80
	beq _08008CAE
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsrs r1, 30
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
_08008CAE:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r2, [sp, 0xC]
	cmp r9, r2
	bcs _08008CC8
	b _08008B8A
_08008CC8:
	movs r0, 0
_08008CCA:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008CDC: .4byte gUnknown_2021B44
_08008CE0: .4byte gUnknown_8231DA8
_08008CE4: .4byte 0x000001ff
_08008CE8: .4byte 0xfffffe00
_08008CEC: .4byte 0x000003ff
_08008CF0: .4byte 0xfffffc00
	thumb_func_end AddSubspritesToOamBuffer

	.align 2, 0 @ Don't pad with nop.
