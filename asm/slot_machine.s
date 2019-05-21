	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_81406E8
sub_81406E8: @ 81406E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r0, 0
	adds r5, r1, 0
	mov r8, r2
	ldr r0, _081407C8 @ =sSlotMachineState
	ldr r2, [r0]
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	lsls r0, 1
	adds r1, r2, 0
	adds r1, 0x20
	adds r0, r1, r0
	movs r3, 0
	ldrsh r0, [r0, r3]
	adds r6, r0, 0x1
	movs r3, 0x34
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r1, r0
	movs r3, 0
	ldrsh r0, [r1, r3]
	adds r3, r0, 0x1
	adds r5, 0x1
	cmp r6, 0x14
	ble _08140726
	movs r6, 0
_08140726:
	cmp r3, 0x14
	ble _0814072C
	movs r3, 0
_0814072C:
	cmp r5, 0x14
	ble _08140732
	movs r5, 0
_08140732:
	movs r4, 0
	lsls r1, r7, 1
	lsls r0, r7, 2
	mov r9, r2
	ldr r2, _081407CC @ =gUnknown_8464926
	mov r10, r2
	adds r1, r7
	add r1, sp
	mov r12, r1
	adds r0, r7
	lsls r0, 2
	adds r0, r7
	str r0, [sp, 0xC]
_0814074C:
	mov r7, r9
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r0, r4
	mov r7, sp
	adds r2, r7, r0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r1
	adds r0, r6, r0
	add r0, r10
	ldrb r0, [r0]
	strb r0, [r2]
	mov r0, r9
	movs r2, 0x34
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	adds r0, r4
	adds r2, r7, r0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r1
	adds r0, r3, r0
	add r0, r10
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r7, [sp, 0xC]
	adds r0, r5, r7
	add r0, r10
	ldrb r0, [r0]
	mov r1, r12
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x14
	ble _0814079E
	movs r6, 0
_0814079E:
	adds r3, 0x1
	cmp r3, 0x14
	ble _081407A6
	movs r3, 0
_081407A6:
	adds r5, 0x1
	cmp r5, 0x14
	ble _081407AE
	movs r5, 0
_081407AE:
	movs r2, 0x1
	add r12, r2
	adds r4, 0x1
	cmp r4, 0x2
	ble _0814074C
	mov r3, r8
	cmp r3, 0x1
	beq _08140828
	cmp r3, 0x1
	bgt _081407D0
	cmp r3, 0
	beq _081407D8
	b _081408A0
	.align 2, 0
_081407C8: .4byte sSlotMachineState
_081407CC: .4byte gUnknown_8464926
_081407D0:
	mov r6, r8
	cmp r6, 0x2
	beq _08140870
	b _081408A0
_081407D8:
	movs r4, 0
_081407DA:
	mov r7, sp
	adds r0, r7, r4
	ldrb r1, [r0]
	movs r0, 0x1
	bl sub_81408F4
	cmp r0, 0
	bne _081408DC
	adds r4, 0x1
	cmp r4, 0x2
	ble _081407DA
	movs r4, 0
	ldr r2, _08140824 @ =gUnknown_84648AE
	movs r3, 0
	adds r5, r2, 0x2
_081407F8:
	ldrb r0, [r2]
	mov r6, sp
	adds r1, r6, r0
	ldrb r0, [r2, 0x1]
	add r0, sp
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08140816
	adds r0, r3, r5
	ldrb r0, [r0]
	add r0, sp
	ldrb r0, [r0]
	cmp r1, r0
	beq _081408DC
_08140816:
	adds r2, 0x3
	adds r3, 0x3
	adds r4, 0x1
	cmp r4, 0x4
	ble _081407F8
_08140820:
	movs r0, 0x1
	b _081408DE
	.align 2, 0
_08140824: .4byte gUnknown_84648AE
_08140828:
	movs r4, 0
	ldr r5, _0814086C @ =gUnknown_84648AE
_0814082C:
	ldrb r0, [r5]
	mov r7, sp
	adds r2, r7, r0
	ldrb r0, [r5, 0x1]
	adds r1, r7, r0
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0814084A
	adds r1, r0, 0
	mov r0, r8
	bl sub_81408F4
	cmp r0, 0
	bne _081408DC
_0814084A:
	adds r5, 0x3
	adds r4, 0x1
	cmp r4, 0x4
	ble _0814082C
	movs r4, 0
_08140854:
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	mov r0, r8
	bl sub_81408F4
	cmp r0, 0
	bne _08140820
	adds r4, 0x1
	cmp r4, 0x2
	ble _08140854
	b _081408DC
	.align 2, 0
_0814086C: .4byte gUnknown_84648AE
_08140870:
	movs r4, 0
	ldr r5, _0814089C @ =gUnknown_84648AE
_08140874:
	ldrb r0, [r5]
	mov r3, sp
	adds r2, r3, r0
	ldrb r0, [r5, 0x1]
	adds r1, r3, r0
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08140892
	adds r1, r0, 0
	mov r0, r8
	bl sub_81408F4
	cmp r0, 0
	bne _08140820
_08140892:
	adds r5, 0x3
	adds r4, 0x1
	cmp r4, 0x4
	ble _08140874
	b _081408DC
	.align 2, 0
_0814089C: .4byte gUnknown_84648AE
_081408A0:
	movs r4, 0
	ldr r5, _081408F0 @ =gUnknown_84648AE
	adds r7, r5, 0
	movs r6, 0
_081408A8:
	ldrb r0, [r5]
	mov r1, sp
	adds r2, r1, r0
	adds r0, r7, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	add r0, sp
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081408D2
	ldrb r0, [r5, 0x2]
	add r0, sp
	ldrb r0, [r0]
	cmp r1, r0
	bne _081408D2
	mov r0, r8
	bl sub_81408F4
	cmp r0, 0
	bne _08140820
_081408D2:
	adds r5, 0x3
	adds r6, 0x3
	adds r4, 0x1
	cmp r4, 0x4
	ble _081408A8
_081408DC:
	movs r0, 0
_081408DE:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081408F0: .4byte gUnknown_84648AE
	thumb_func_end sub_81406E8

	thumb_func_start sub_81408F4
sub_81408F4: @ 81408F4
	push {lr}
	adds r2, r1, 0
	cmp r0, 0x6
	bhi _08140966
	lsls r0, 2
	ldr r1, _08140908 @ =_0814090C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08140908: .4byte _0814090C
	.align 2, 0
_0814090C:
	.4byte _08140928
	.4byte _08140934
	.4byte _08140934
	.4byte _0814093E
	.4byte _08140944
	.4byte _08140952
	.4byte _0814095C
_08140928:
	movs r1, 0x4
	eors r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	b _08140968
_08140934:
	movs r0, 0
	cmp r2, 0x4
	bne _08140968
	movs r0, 0x1
	b _08140968
_0814093E:
	movs r1, 0
	subs r0, r2, 0x5
	b _08140948
_08140944:
	movs r1, 0
	subs r0, r2, 0x2
_08140948:
	cmp r0, 0x1
	bhi _0814094E
	movs r1, 0x1
_0814094E:
	adds r0, r1, 0
	b _08140968
_08140952:
	movs r0, 0
	cmp r2, 0x1
	bne _08140968
	movs r0, 0x1
	b _08140968
_0814095C:
	movs r0, 0
	cmp r2, 0
	bne _08140968
	movs r0, 0x1
	b _08140968
_08140966:
	movs r0, 0
_08140968:
	pop {r1}
	bx r1
	thumb_func_end sub_81408F4

	thumb_func_start sub_814096C
sub_814096C: @ 814096C
	push {lr}
	cmp r0, 0x6
	bhi _0814099C
	lsls r0, 2
	ldr r1, _0814097C @ =_08140980
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814097C: .4byte _08140980
	.align 2, 0
_08140980:
	.4byte _081409AC
	.4byte _081409A8
	.4byte _081409A4
	.4byte _081409A4
	.4byte _0814099C
	.4byte _081409A0
	.4byte _081409A0
_0814099C:
	movs r0, 0x1
	b _081409AE
_081409A0:
	movs r0, 0x3
	b _081409AE
_081409A4:
	movs r0, 0x4
	b _081409AE
_081409A8:
	movs r0, 0x5
	b _081409AE
_081409AC:
	movs r0, 0x6
_081409AE:
	pop {r1}
	bx r1
	thumb_func_end sub_814096C

	thumb_func_start sub_81409B4
sub_81409B4: @ 81409B4
	push {r4-r6,lr}
	bl Random
	lsls r0, 16
	lsrs r2, r0, 18
	ldr r0, _08140A60 @ =sSlotMachineState
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	ldr r1, _08140A64 @ =gUnknown_84648D2
	adds r4, r0, r1
	movs r5, 0
	ldrh r0, [r4]
	cmp r2, r0
	bcc _081409E6
	adds r0, r4, 0
_081409D8:
	adds r0, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	bgt _081409E6
	ldrh r1, [r0]
	cmp r2, r1
	bcs _081409D8
_081409E6:
	ldr r6, _08140A60 @ =sSlotMachineState
	ldr r1, [r6]
	ldrh r0, [r1, 0x8]
	cmp r0, 0x4
	bhi _08140A5A
	ldrh r0, [r1, 0xC]
	cmp r0, 0
	bne _08140A22
	bl Random
	ldr r1, _08140A68 @ =0x00003fff
	ands r1, r0
	ldrh r4, [r4, 0xC]
	cmp r1, r4
	bcs _08140A18
	ldr r4, [r6]
	bl Random
	movs r1, 0x1
	ands r1, r0
	movs r0, 0x3C
	cmp r1, 0
	beq _08140A16
	movs r0, 0x5
_08140A16:
	strh r0, [r4, 0xC]
_08140A18:
	ldr r0, _08140A60 @ =sSlotMachineState
	ldr r1, [r0]
	ldrh r1, [r1, 0xC]
	cmp r1, 0
	beq _08140A56
_08140A22:
	cmp r5, 0
	bne _08140A4A
	bl Random
	ldr r1, _08140A68 @ =0x00003fff
	ands r1, r0
	ldr r0, _08140A6C @ =0x00002ccb
	cmp r1, r0
	bhi _08140A4A
	ldr r0, _08140A60 @ =sSlotMachineState
	ldr r4, [r0]
	bl Random
	movs r1, 0x1
	ands r1, r0
	movs r0, 0x3C
	cmp r1, 0
	beq _08140A48
	movs r0, 0x5
_08140A48:
	strh r0, [r4, 0xC]
_08140A4A:
	ldr r2, _08140A60 @ =sSlotMachineState
	ldr r1, [r2]
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	adds r0, r2, 0
_08140A56:
	ldr r0, [r0]
	strh r5, [r0, 0x8]
_08140A5A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08140A60: .4byte sSlotMachineState
_08140A64: .4byte gUnknown_84648D2
_08140A68: .4byte 0x00003fff
_08140A6C: .4byte 0x00002ccb
	thumb_func_end sub_81409B4

	thumb_func_start sub_8140A70
sub_8140A70: @ 8140A70
	ldr r0, _08140A7C @ =sSlotMachineState
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_08140A7C: .4byte sSlotMachineState
	thumb_func_end sub_8140A70

	thumb_func_start sub_8140A80
sub_8140A80: @ 8140A80
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	mov r0, sp
	movs r1, 0
	movs r2, 0x9
	bl memset
	movs r5, 0
	ldr r2, _08140B58 @ =sSlotMachineState
	movs r3, 0
	adds r4, r2, 0
_08140A9C:
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0x3C
	adds r0, r1
	str r3, [r0]
	adds r5, 0x1
	cmp r5, 0x4
	ble _08140A9C
	movs r0, 0
	mov r9, r0
	ldr r0, [r4]
	movs r1, 0x20
	ldrsh r4, [r0, r1]
	movs r7, 0x22
	ldrsh r3, [r0, r7]
	movs r1, 0x24
	ldrsh r2, [r0, r1]
	ldr r6, _08140B5C @ =gUnknown_8464926
	movs r7, 0x2A
	adds r7, r6
	mov r8, r7
	mov r1, sp
	movs r0, 0x15
	adds r0, r6
	mov r12, r0
	movs r5, 0x2
_08140AD0:
	adds r4, 0x1
	cmp r4, 0x14
	ble _08140AD8
	movs r4, 0
_08140AD8:
	adds r3, 0x1
	cmp r3, 0x14
	ble _08140AE0
	movs r3, 0
_08140AE0:
	adds r2, 0x1
	cmp r2, 0x14
	ble _08140AE8
	movs r2, 0
_08140AE8:
	adds r0, r4, r6
	ldrb r0, [r0]
	strb r0, [r1]
	mov r7, r12
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	mov r7, r8
	adds r0, r2, r7
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	adds r1, 0x1
	subs r5, 0x1
	cmp r5, 0
	bge _08140AD0
	ldr r0, _08140B58 @ =sSlotMachineState
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0
	strh r1, [r0]
	ldr r7, _08140B60 @ =gUnknown_84648BD
	mov r8, r7
	movs r6, 0
	movs r5, 0x4
_08140B18:
	ldr r0, _08140B58 @ =sSlotMachineState
	ldr r1, [r0]
	mov r0, r8
	adds r0, 0x3
	adds r0, r6, r0
	ldrh r1, [r1, 0xE]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08140BB6
	ldrb r0, [r7]
	mov r1, sp
	adds r4, r1, r0
	ldrb r1, [r4]
	movs r0, 0x1
	bl sub_81408F4
	cmp r0, 0
	beq _08140B64
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	add r0, sp
	ldrb r1, [r0]
	movs r0, 0x2
	bl sub_81408F4
	movs r3, 0x1
	cmp r0, 0
	beq _08140B8E
	movs r3, 0x2
	b _08140B92
	.align 2, 0
_08140B58: .4byte sSlotMachineState
_08140B5C: .4byte gUnknown_8464926
_08140B60: .4byte gUnknown_84648BD
_08140B64:
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	add r0, sp
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08140B8C
	ldrb r0, [r7, 0x2]
	add r0, sp
	ldrb r0, [r0]
	cmp r1, r0
	bne _08140B8C
	adds r0, r1, 0
	bl sub_814096C
	lsls r0, 24
	lsrs r3, r0, 24
	b _08140B8E
_08140B8C:
	movs r3, 0
_08140B8E:
	cmp r3, 0
	beq _08140BB0
_08140B92:
	ldr r0, _08140BD4 @ =sSlotMachineState
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x3C
	adds r0, r6
	movs r1, 0x1
	str r1, [r0]
	adds r2, 0x50
	ldr r1, _08140BD8 @ =gUnknown_8464966
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
_08140BB0:
	cmp r3, r9
	ble _08140BB6
	mov r9, r3
_08140BB6:
	adds r7, 0x4
	adds r6, 0x4
	subs r5, 0x1
	cmp r5, 0
	bge _08140B18
	mov r7, r9
	lsls r0, r7, 16
	lsrs r0, 16
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08140BD4: .4byte sSlotMachineState
_08140BD8: .4byte gUnknown_8464966
	thumb_func_end sub_8140A80

	thumb_func_start sub_8140BDC
sub_8140BDC: @ 8140BDC
	ldr r0, _08140BE8 @ =sSlotMachineState
	ldr r0, [r0]
	adds r0, 0x50
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08140BE8: .4byte sSlotMachineState
	thumb_func_end sub_8140BDC

	thumb_func_start sub_8140BEC
sub_8140BEC: @ 8140BEC
	ldr r0, _08140BF4 @ =sSlotMachineState
	ldr r0, [r0]
	ldrb r0, [r0, 0xE]
	bx lr
	.align 2, 0
_08140BF4: .4byte sSlotMachineState
	thumb_func_end sub_8140BEC

	thumb_func_start sub_8140BF8
sub_8140BF8: @ 8140BF8
	ldr r1, _08140C08 @ =sSlotMachineState
	ldr r1, [r1]
	lsls r0, 2
	adds r1, 0x3C
	adds r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08140C08: .4byte sSlotMachineState
	thumb_func_end sub_8140BF8

	thumb_func_start sub_8140C0C
sub_8140C0C: @ 8140C0C
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _08140C3C @ =gUnknown_84655B0
_08140C12:
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x2
	bls _08140C12
	ldr r0, _08140C40 @ =gUnknown_84655C8
	bl LoadSpritePalettes
	ldr r4, _08140C44 @ =gUnknown_203F3A4
	movs r0, 0x74
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _08140C48
	bl sub_8140C6C
	movs r0, 0x1
	b _08140C4A
	.align 2, 0
_08140C3C: .4byte gUnknown_84655B0
_08140C40: .4byte gUnknown_84655C8
_08140C44: .4byte gUnknown_203F3A4
_08140C48:
	movs r0, 0
_08140C4A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8140C0C

	thumb_func_start sub_8140C50
sub_8140C50: @ 8140C50
	push {r4,lr}
	ldr r4, _08140C68 @ =gUnknown_203F3A4
	ldr r0, [r4]
	cmp r0, 0
	beq _08140C62
	bl Free
	movs r0, 0
	str r0, [r4]
_08140C62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140C68: .4byte gUnknown_203F3A4
	thumb_func_end sub_8140C50

	thumb_func_start sub_8140C6C
sub_8140C6C: @ 8140C6C
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r2, 0
	movs r5, 0
	adds r6, r4, 0
	adds r6, 0xC
_08140C78:
	lsls r0, r2, 2
	adds r1, r4, r0
	str r5, [r1]
	adds r3, r2, 0x1
	adds r0, r2
	lsls r0, 2
	movs r1, 0x4
	adds r0, r6
	adds r0, 0x10
_08140C8A:
	str r5, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _08140C8A
	adds r2, r3, 0
	cmp r2, 0x2
	ble _08140C78
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8140C6C

	thumb_func_start sub_8140CA0
sub_8140CA0: @ 8140CA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r7, 0
_08140CAE:
	movs r6, 0
	lsls r0, r7, 2
	adds r1, r7, 0x1
	str r1, [sp]
	adds r0, r7
	mov r10, r0
	mov r2, r10
	lsls r2, 2
	mov r8, r2
	movs r3, 0xB0
	lsls r3, 14
	mov r9, r3
_08140CC6:
	mov r0, r10
	lsls r1, r0, 19
	movs r2, 0xA0
	lsls r2, 15
	adds r1, r2
	mov r3, r9
	asrs r2, r3, 16
	ldr r0, _08140D64 @ =gUnknown_84657E4
	asrs r1, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08140D68 @ =gUnknown_8464926
	mov r3, r8
	adds r1, r3, r7
	adds r1, r6, r1
	adds r1, r2
	ldrb r4, [r1]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _08140D6C @ =gSprites
	adds r5, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl StartSpriteAnim
	ldr r0, _08140D70 @ =gUnknown_8465608
	lsls r4, 1
	adds r4, r0
	ldrh r0, [r4]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r5, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
	movs r0, 0
	strh r7, [r5, 0x2E]
	strh r6, [r5, 0x30]
	strh r6, [r5, 0x32]
	strh r0, [r5, 0x34]
	ldrb r0, [r5, 0x3]
	movs r2, 0x3F
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r5, 0x3]
	ldr r0, _08140D74 @ =gUnknown_203F3A4
	ldr r2, [r0]
	lsls r1, r6, 2
	add r1, r8
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	str r5, [r0]
	ldr r0, _08140D78 @ =0x07000006
	str r0, [r2, 0x70]
	movs r3, 0xC0
	lsls r3, 13
	add r9, r3
	adds r6, 0x1
	cmp r6, 0x4
	ble _08140CC6
	ldr r7, [sp]
	cmp r7, 0x2
	ble _08140CAE
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140D64: .4byte gUnknown_84657E4
_08140D68: .4byte gUnknown_8464926
_08140D6C: .4byte gSprites
_08140D70: .4byte gUnknown_8465608
_08140D74: .4byte gUnknown_203F3A4
_08140D78: .4byte 0x07000006
	thumb_func_end sub_8140CA0

	thumb_func_start sub_8140D7C
sub_8140D7C: @ 8140D7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r3, r0, 0
	movs r2, 0
	ldr r0, _08140E34 @ =gUnknown_203F3A4
	mov r8, r0
_08140D90:
	movs r4, 0
	ldrsh r6, [r3, r4]
	movs r4, 0
	ldrsh r0, [r1, r4]
	lsls r0, 3
	mov r10, r0
	lsls r0, r2, 2
	adds r3, 0x2
	str r3, [sp]
	adds r1, 0x2
	str r1, [sp, 0x4]
	adds r1, r2, 0x1
	str r1, [sp, 0x8]
	adds r0, r2
	lsls r0, 2
	adds r2, r0
	mov r9, r2
	adds r5, r0, 0
	movs r7, 0x4
_08140DB6:
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0xC
	adds r1, r5
	ldr r0, [r1]
	mov r3, r10
	strh r3, [r0, 0x26]
	ldr r2, _08140E38 @ =gUnknown_8464926
	mov r4, r9
	adds r0, r6, r4
	adds r0, r2
	ldrb r4, [r0]
	ldr r0, [r1]
	adds r1, r4, 0
	bl StartSpriteAnim
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xC
	adds r0, r5
	ldr r0, [r0]
	adds r1, r4, 0
	bl StartSpriteAnim
	ldr r0, _08140E3C @ =gUnknown_8465608
	lsls r4, 1
	adds r4, r0
	ldrh r0, [r4]
	bl IndexOfSpritePaletteTag
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0xC
	adds r1, r5
	ldr r3, [r1]
	lsls r0, 4
	ldrb r2, [r3, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x5]
	adds r6, 0x1
	cmp r6, 0x14
	ble _08140E10
	movs r6, 0
_08140E10:
	adds r5, 0x4
	subs r7, 0x1
	cmp r7, 0
	bge _08140DB6
	ldr r3, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	cmp r2, 0x2
	ble _08140D90
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140E34: .4byte gUnknown_203F3A4
_08140E38: .4byte gUnknown_8464926
_08140E3C: .4byte gUnknown_8465608
	thumb_func_end sub_8140D7C

	thumb_func_start sub_8140E40
sub_8140E40: @ 8140E40
	push {lr}
	ldr r0, _08140E68 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, 0
	subs r3, 0x2B
	cmp r3, 0x53
	bhi _08140E7C
	ldr r0, _08140E6C @ =gUnknown_203F3A4
	ldr r0, [r0]
	ldr r2, [r0, 0x70]
	ldr r1, _08140E70 @ =gUnknown_8465616
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r1, _08140E74 @ =0x04000054
	ldr r0, _08140E78 @ =gUnknown_84656D6
	adds r0, r3, r0
	ldrb r0, [r0]
	b _08140E8E
	.align 2, 0
_08140E68: .4byte 0x04000006
_08140E6C: .4byte gUnknown_203F3A4
_08140E70: .4byte gUnknown_8465616
_08140E74: .4byte 0x04000054
_08140E78: .4byte gUnknown_84656D6
_08140E7C:
	ldr r0, _08140E94 @ =gUnknown_203F3A4
	ldr r0, [r0]
	ldr r1, [r0, 0x70]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08140E98 @ =0x04000054
	movs r0, 0
_08140E8E:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08140E94: .4byte gUnknown_203F3A4
_08140E98: .4byte 0x04000054
	thumb_func_end sub_8140E40

	thumb_func_start sub_8140E9C
sub_8140E9C: @ 8140E9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r0, _08140F20 @ =gUnknown_846587C
	mov r10, r0
	ldr r0, _08140F24 @ =gUnknown_203F3A4
	mov r9, r0
	ldr r0, _08140F28 @ =gSprites
	mov r8, r0
	movs r7, 0x85
	lsls r7, 16
	movs r6, 0xAA
	lsls r6, 15
_08140EBC:
	asrs r1, r6, 16
	mov r0, r10
	movs r2, 0x1E
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	mov r0, r9
	ldr r1, [r0]
	lsls r4, r5, 2
	adds r1, 0x48
	adds r1, r4
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	add r0, r8
	str r0, [r1]
	asrs r1, r7, 16
	mov r0, r10
	movs r2, 0x1E
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	mov r0, r9
	ldr r1, [r0]
	adds r1, 0x58
	adds r1, r4
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	add r0, r8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 11
	adds r7, r0
	adds r6, r0
	adds r5, 0x1
	cmp r5, 0x3
	ble _08140EBC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140F20: .4byte gUnknown_846587C
_08140F24: .4byte gUnknown_203F3A4
_08140F28: .4byte gSprites
	thumb_func_end sub_8140E9C

	thumb_func_start sub_8140F2C
sub_8140F2C: @ 8140F2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl GetCoins
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	bl sub_8140BDC
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r6, 0xFA
	lsls r6, 2
	movs r7, 0
	ldr r0, _08140FC0 @ =gUnknown_203F3A4
	mov r10, r0
_08140F54:
	mov r0, r9
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	mov r1, r10
	ldr r0, [r1]
	lsls r5, r7, 2
	adds r0, 0x48
	adds r0, r5
	ldr r0, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0
	muls r0, r6
	mov r1, r9
	subs r1, r0
	mov r9, r1
	mov r0, r8
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	mov r1, r10
	ldr r0, [r1]
	adds r0, 0x58
	adds r0, r5
	ldr r0, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0
	muls r0, r6
	mov r1, r8
	subs r1, r0
	mov r8, r1
	adds r0, r6, 0
	movs r1, 0xA
	bl __divsi3
	adds r6, r0, 0
	adds r7, 0x1
	cmp r7, 0x3
	ble _08140F54
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140FC0: .4byte gUnknown_203F3A4
	thumb_func_end sub_8140F2C

	thumb_func_start sub_8140FC4
sub_8140FC4: @ 8140FC4
	push {r4-r6,lr}
	ldr r6, _08141014 @ =gUnknown_84658D8
	adds r0, r6, 0
	movs r1, 0x10
	movs r2, 0x88
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r5, _08141018 @ =gUnknown_203F3A4
	ldr r1, [r5]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r4, _0814101C @ =gSprites
	adds r0, r4
	str r0, [r1, 0x68]
	adds r0, r6, 0
	movs r1, 0xE0
	movs r2, 0x88
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, [r5]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	str r0, [r1, 0x6C]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08141014: .4byte gUnknown_84658D8
_08141018: .4byte gUnknown_203F3A4
_0814101C: .4byte gSprites
	thumb_func_end sub_8140FC4

	thumb_func_start sub_8141020
sub_8141020: @ 8141020
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _08141048 @ =gUnknown_203F3A4
_0814102A:
	ldr r0, [r6]
	lsls r1, r4, 2
	adds r0, 0x68
	adds r0, r1
	ldr r0, [r0]
	adds r1, r5, 0
	bl StartSpriteAnim
	adds r4, 0x1
	cmp r4, 0x1
	ble _0814102A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08141048: .4byte gUnknown_203F3A4
	thumb_func_end sub_8141020

	thumb_func_start sub_814104C
sub_814104C: @ 814104C
	push {r4,lr}
	ldr r0, _0814108C @ =0x0000285c
	bl Alloc
	adds r4, r0, 0
	cmp r4, 0
	beq _08141082
	ldr r2, _08141090 @ =sub_81410CC
	movs r1, 0
	adds r0, r4, 0
	adds r0, 0x1C
_08141062:
	strb r1, [r0, 0x3]
	subs r0, 0x4
	cmp r0, r4
	bge _08141062
	movs r0, 0
	str r0, [r4, 0x28]
	adds r0, r2, 0
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	adds r2, r4, 0
	bl SetWordTaskArg
_08141082:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814108C: .4byte 0x0000285c
_08141090: .4byte sub_81410CC
	thumb_func_end sub_814104C

	thumb_func_start sub_8141094
sub_8141094: @ 8141094
	push {r4,lr}
	ldr r4, _081410C8 @ =sub_81410CC
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _081410BA
	bl sub_814112C
	bl Free
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_081410BA:
	bl sub_8140C50
	bl FreeAllWindowBuffers
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081410C8: .4byte sub_81410CC
	thumb_func_end sub_8141094

	thumb_func_start sub_81410CC
sub_81410CC: @ 81410CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl GetWordTaskArg
	adds r6, r0, 0
	ldr r0, _08141114 @ =gUnknown_84658F0
	mov r8, r0
	adds r4, r6, 0x2
	adds r5, r6, 0
	movs r7, 0x7
_081410E8:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08141100
	ldrh r0, [r5]
	lsls r0, 2
	add r0, r8
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r6, 0
	bl _call_via_r2
	strb r0, [r4, 0x1]
_08141100:
	adds r4, 0x4
	adds r5, 0x4
	subs r7, 0x1
	cmp r7, 0
	bge _081410E8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141114: .4byte gUnknown_84658F0
	thumb_func_end sub_81410CC

	thumb_func_start sub_8141118
sub_8141118: @ 8141118
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_8141118

	thumb_func_start sub_814112C
sub_814112C: @ 814112C
	push {lr}
	ldr r0, _08141144 @ =sub_81410CC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl GetWordTaskArg
	pop {r1}
	bx r1
	.align 2, 0
_08141144: .4byte sub_81410CC
	thumb_func_end sub_814112C

	thumb_func_start sub_8141148
sub_8141148: @ 8141148
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	bl sub_814112C
	adds r1, r0, 0
	lsls r5, 2
	adds r5, r1, r5
	movs r0, 0
	strh r4, [r5]
	strb r0, [r5, 0x2]
	ldr r0, _0814117C @ =gUnknown_84658F0
	lsls r4, 2
	adds r4, r0
	adds r0, r5, 0x2
	ldr r2, [r4]
	bl _call_via_r2
	strb r0, [r5, 0x3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814117C: .4byte gUnknown_84658F0
	thumb_func_end sub_8141148

	thumb_func_start sub_8141180
sub_8141180: @ 8141180
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_814112C
	lsls r4, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141180

	thumb_func_start sub_8141198
sub_8141198: @ 8141198
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r7, r0, 0
	mov r8, r1
	ldrb r6, [r7]
	cmp r6, 0x1
	beq _081411D0
	cmp r6, 0x1
	bgt _081411B4
	cmp r6, 0
	beq _081411C2
	b _08141450
_081411B4:
	cmp r6, 0x2
	bne _081411BA
	b _081413E4
_081411BA:
	cmp r6, 0x3
	bne _081411C0
	b _08141436
_081411C0:
	b _08141450
_081411C2:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _0814142E
_081411D0:
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r1, 0xE0
	lsls r1, 19
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0
	movs r3, 0x1
	bl RequestDma3Fill
	movs r1, 0xC0
	lsls r1, 19
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	ldr r1, _0814139C @ =0x0600c000
	movs r0, 0
	movs r2, 0x20
	movs r3, 0x1
	bl RequestDma3Fill
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl sub_80F6C14
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081413A0 @ =gUnknown_8466B10
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r0, _081413A4 @ =gUnknown_8466B20
	bl InitWindows
	ldr r1, _081413A8 @ =0x0000205c
	add r1, r8
	movs r0, 0x3
	bl SetBgTilemapBuffer
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	bl reset_temp_tile_data_buffers
	ldr r1, _081413AC @ =gUnknown_84659D0
	movs r5, 0
	str r5, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081413B0 @ =gUnknown_846653C
	str r5, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0xC0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081413B4 @ =0x0000185c
	add r1, r8
	movs r0, 0x2
	bl SetBgTilemapBuffer
	ldr r1, _081413B8 @ =gUnknown_84661D4
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldr r0, _081413BC @ =gUnknown_8465930
	movs r1, 0
	movs r2, 0xA0
	bl LoadPalette
	ldr r0, _081413C0 @ =gUnknown_84664BC
	movs r1, 0x50
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _081413C4 @ =gUnknown_84665C0
	movs r1, 0x70
	movs r2, 0x60
	bl LoadPalette
	ldr r1, _081413C8 @ =0x00007fde
	add r0, sp, 0xC
	strh r1, [r0]
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD0
	bl LoadUserWindowBorderGfx
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xF0
	bl sub_814FDA0
	ldr r1, _081413CC @ =0x0000085c
	add r1, r8
	movs r0, 0
	bl SetBgTilemapBuffer
	str r4, [sp]
	movs r0, 0x1E
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, _081413D0 @ =gUnknown_8466620
	str r5, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081413D4 @ =gUnknown_8466998
	str r6, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl decompress_and_copy_tile_data_to_vram
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	movs r0, 0x2
	bl stdpal_get
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x1
	movs r1, 0xFF
	bl FillWindowPixelBuffer
	movs r0, 0x1
	bl PutWindowTilemap
	ldr r4, _081413D8 @ =gUnknown_841B779
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetStringWidth
	movs r2, 0xEC
	subs r2, r0
	add r1, sp, 0x10
	movs r0, 0xF
	strb r0, [r1]
	strb r6, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	lsls r2, 24
	lsrs r2, 24
	str r1, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl box_print
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	movs r1, 0x83
	lsls r1, 5
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x50
	movs r1, 0xF8
	bl SetGpuReg
	bl sub_8140C0C
	bl sub_8140CA0
	bl sub_8140E9C
	bl sub_8140FC4
	bl sub_8140F2C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _081413DC @ =sub_8141118
	bl SetVBlankCallback
	ldr r0, _081413E0 @ =sub_8140E40
	bl SetHBlankCallback
	b _0814142E
	.align 2, 0
_0814139C: .4byte 0x0600c000
_081413A0: .4byte gUnknown_8466B10
_081413A4: .4byte gUnknown_8466B20
_081413A8: .4byte 0x0000205c
_081413AC: .4byte gUnknown_84659D0
_081413B0: .4byte gUnknown_846653C
_081413B4: .4byte 0x0000185c
_081413B8: .4byte gUnknown_84661D4
_081413BC: .4byte gUnknown_8465930
_081413C0: .4byte gUnknown_84664BC
_081413C4: .4byte gUnknown_84665C0
_081413C8: .4byte 0x00007fde
_081413CC: .4byte 0x0000085c
_081413D0: .4byte gUnknown_8466620
_081413D4: .4byte gUnknown_8466998
_081413D8: .4byte gUnknown_841B779
_081413DC: .4byte sub_8141118
_081413E0: .4byte sub_8140E40
_081413E4:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08141450
	movs r0, 0
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x1
	bl HideBg
	bl sub_8141B34
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, 0
	adds r1, r4, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x3
	bl EnableInterrupts
_0814142E:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _08141450
_08141436:
	bl UpdatePaletteFade
	ldr r0, _0814144C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08141450
	movs r0, 0
	b _08141452
	.align 2, 0
_0814144C: .4byte gPaletteFade
_08141450:
	movs r0, 0x1
_08141452:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8141198

	thumb_func_start sub_8141460
sub_8141460: @ 8141460
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08141472
	cmp r0, 0x1
	beq _0814148A
	b _081414A0
_08141472:
	movs r1, 0x1
	negs r1, r1
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _081414A0
_0814148A:
	ldr r0, _0814149C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081414A0
	movs r0, 0
	b _081414A2
	.align 2, 0
_0814149C: .4byte gPaletteFade
_081414A0:
	movs r0, 0x1
_081414A2:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141460

	thumb_func_start sub_81414AC
sub_81414AC: @ 81414AC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _081414BC
	cmp r0, 0x1
	beq _081414D4
	b _081414E2
_081414BC:
	movs r0, 0x2
	bl GetBgTilemapBuffer
	bl sub_8141834
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _081414E2
_081414D4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081414E2
	movs r0, 0
	b _081414E4
_081414E2:
	movs r0, 0x1
_081414E4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81414AC

	thumb_func_start sub_81414EC
sub_81414EC: @ 81414EC
	push {lr}
	movs r0, 0x1
	bl sub_8141020
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_81414EC

	thumb_func_start sub_81414FC
sub_81414FC: @ 81414FC
	push {lr}
	movs r0, 0x2
	bl sub_8141020
	ldr r0, _08141514 @ =sub_814191C
	movs r1, 0x3
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08141514: .4byte sub_814191C
	thumb_func_end sub_81414FC

	thumb_func_start sub_8141518
sub_8141518: @ 8141518
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08141528
	cmp r0, 0x1
	beq _08141534
	b _08141550
_08141528:
	bl sub_8141AB0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08141550
_08141534:
	ldr r0, _0814154C @ =sub_814191C
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08141550
	movs r0, 0
	bl sub_8141020
	movs r0, 0
	b _08141552
	.align 2, 0
_0814154C: .4byte sub_814191C
_08141550:
	movs r0, 0x1
_08141552:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141518

	thumb_func_start sub_8141558
sub_8141558: @ 8141558
	push {lr}
	movs r0, 0x3
	bl sub_8141020
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8141558

	thumb_func_start sub_8141568
sub_8141568: @ 8141568
	push {lr}
	movs r0, 0
	bl sub_8141020
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8141568

	thumb_func_start sub_8141578
sub_8141578: @ 8141578
	push {lr}
	bl sub_8140F2C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8141578

	thumb_func_start sub_8141584
sub_8141584: @ 8141584
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08141594
	cmp r0, 0x1
	beq _081415B0
	b _081415BE
_08141594:
	ldr r0, _081415AC @ =gUnknown_841B747
	bl sub_81417E4
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _081415BE
	.align 2, 0
_081415AC: .4byte gUnknown_841B747
_081415B0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081415BE
	movs r0, 0
	b _081415C0
_081415BE:
	movs r0, 0x1
_081415C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141584

	thumb_func_start sub_81415C8
sub_81415C8: @ 81415C8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _081415D8
	cmp r0, 0x1
	beq _081415F8
	b _08141606
_081415D8:
	ldr r0, _081415F4 @ =gUnknown_841B76B
	bl sub_81417E4
	movs r0, 0
	bl sub_8141AD8
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08141606
	.align 2, 0
_081415F4: .4byte gUnknown_841B76B
_081415F8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08141606
	movs r0, 0
	b _08141608
_08141606:
	movs r0, 0x1
_08141608:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81415C8

	thumb_func_start sub_8141610
sub_8141610: @ 8141610
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08141620
	cmp r0, 0x1
	beq _08141638
	b _08141646
_08141620:
	bl sub_8141828
	bl sub_8141B18
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08141646
_08141638:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08141646
	movs r0, 0
	b _08141648
_08141646:
	movs r0, 0x1
_08141648:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141610

	thumb_func_start sub_8141650
sub_8141650: @ 8141650
	push {r4,lr}
	adds r4, r0, 0
	ldrb r2, [r4]
	cmp r2, 0
	beq _08141660
	cmp r2, 0x1
	beq _08141678
	b _08141686
_08141660:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	bl sub_8141BA0
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08141686
_08141678:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08141686
	movs r0, 0
	b _08141688
_08141686:
	movs r0, 0x1
_08141688:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141650

	thumb_func_start sub_8141690
sub_8141690: @ 8141690
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _081416A0
	cmp r0, 0x1
	beq _081416B2
	b _081416C0
_081416A0:
	bl sub_8141BE4
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _081416C0
_081416B2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081416C0
	movs r0, 0
	b _081416C2
_081416C0:
	movs r0, 0x1
_081416C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141690

	thumb_func_start sub_81416C8
sub_81416C8: @ 81416C8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	ldrb r4, [r6]
	cmp r4, 0x1
	beq _08141724
	cmp r4, 0x1
	bgt _081416DE
	cmp r4, 0
	beq _081416E4
	b _0814175A
_081416DE:
	cmp r4, 0x2
	beq _08141756
	b _0814175A
_081416E4:
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl SetGpuRegBits
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3D
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x42
	movs r1, 0xA0
	bl SetGpuReg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x6
	bl PlaySE
	str r4, [r5, 0x24]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0814175A
_08141724:
	ldr r0, [r5, 0x24]
	adds r0, 0x10
	str r0, [r5, 0x24]
	cmp r0, 0xFF
	ble _0814173A
	movs r0, 0x80
	lsls r0, 1
	str r0, [r5, 0x24]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
_0814173A:
	ldr r0, [r5, 0x24]
	movs r1, 0x80
	lsls r1, 1
	subs r1, r0
	lsls r1, 8
	movs r0, 0x1
	movs r2, 0
	bl ChangeBgX
	ldrh r1, [r5, 0x24]
	movs r0, 0x40
	bl SetGpuReg
	b _0814175A
_08141756:
	movs r0, 0
	b _0814175C
_0814175A:
	movs r0, 0x1
_0814175C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81416C8

	thumb_func_start sub_8141764
sub_8141764: @ 8141764
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08141790
	cmp r0, 0x1
	bgt _0814177A
	cmp r0, 0
	beq _08141784
	b _081417DC
_0814177A:
	cmp r0, 0x2
	beq _081417C0
	cmp r0, 0x3
	beq _081417D8
	b _081417DC
_08141784:
	movs r0, 0x6
	bl PlaySE
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08141790:
	ldr r0, [r5, 0x24]
	subs r0, 0x10
	str r0, [r5, 0x24]
	cmp r0, 0
	bgt _081417A4
	movs r0, 0
	str r0, [r5, 0x24]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_081417A4:
	ldr r0, [r5, 0x24]
	movs r1, 0x80
	lsls r1, 1
	subs r1, r0
	lsls r1, 8
	movs r0, 0x1
	movs r2, 0
	bl ChangeBgX
	ldrh r1, [r5, 0x24]
	movs r0, 0x40
	bl SetGpuReg
	b _081417DC
_081417C0:
	movs r0, 0x1
	bl HideBg
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl ClearGpuRegBits
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _081417DC
_081417D8:
	movs r0, 0
	b _081417DE
_081417DC:
	movs r0, 0x1
_081417DE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8141764

	thumb_func_start sub_81417E4
sub_81417E4: @ 81417E4
	push {r4,lr}
	sub sp, 0x14
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xF
	bl DrawTextBorderOuter
	movs r1, 0x2
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r0, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_812E62C
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81417E4

	thumb_func_start sub_8141828
sub_8141828: @ 8141828
	push {lr}
	movs r0, 0
	bl rbox_fill_rectangle
	pop {r0}
	bx r0
	thumb_func_end sub_8141828

	thumb_func_start sub_8141834
sub_8141834: @ 8141834
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8140BEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081418B4
	cmp r0, 0x1
	bgt _0814184E
	cmp r0, 0
	beq _08141858
	b _081418BE
_0814184E:
	cmp r0, 0x2
	beq _081418A0
	cmp r0, 0x3
	beq _0814188C
	b _081418BE
_08141858:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x4
	bl sub_81418C4
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x4
	bl sub_81418C4
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x4
	bl sub_81418C4
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0x4
	bl sub_81418C4
	adds r0, r4, 0
	movs r1, 0x4
	movs r2, 0x4
	bl sub_81418C4
	b _081418BE
_0814188C:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x5
	bl sub_81418C4
	adds r0, r4, 0
	movs r1, 0x4
	movs r2, 0x5
	bl sub_81418C4
_081418A0:
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x5
	bl sub_81418C4
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0x5
	bl sub_81418C4
_081418B4:
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x5
	bl sub_81418C4
_081418BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8141834

	thumb_func_start sub_81418C4
sub_81418C4: @ 81418C4
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	ldr r3, _08141914 @ =gUnknown_8466C0C
	lsrs r1, 13
	adds r0, r1, r3
	ldr r4, [r0]
	lsls r2, 28
	lsrs r7, r2, 16
	movs r5, 0
	adds r3, 0x4
	adds r1, r3
	ldr r1, [r1]
	cmp r5, r1
	bcs _0814190C
	ldr r0, _08141918 @ =0x00000fff
	mov r12, r0
	adds r3, r1, 0
_081418E8:
	ldrh r1, [r4]
	lsls r1, 1
	adds r1, r6
	ldrh r2, [r1]
	mov r0, r12
	ands r0, r2
	strh r0, [r1]
	ldrh r1, [r4]
	lsls r1, 1
	adds r1, r6
	ldrh r2, [r1]
	adds r0, r7, 0
	orrs r0, r2
	strh r0, [r1]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, r3
	bcc _081418E8
_0814190C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141914: .4byte gUnknown_8466C0C
_08141918: .4byte 0x00000fff
	thumb_func_end sub_81418C4

	thumb_func_start sub_814191C
sub_814191C: @ 814191C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08141940 @ =gTasks+0x8
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08141984
	cmp r0, 0x1
	bgt _08141944
	cmp r0, 0
	beq _08141952
	b _08141AA8
	.align 2, 0
_08141940: .4byte gTasks+0x8
_08141944:
	cmp r0, 0x2
	bne _0814194A
	b _08141A58
_0814194A:
	cmp r0, 0x3
	bne _08141950
	b _08141A98
_08141950:
	b _08141AA8
_08141952:
	ldr r0, _08141980 @ =gUnknown_84664BC
	movs r1, 0x60
	movs r2, 0x20
	bl LoadPalette
	movs r4, 0
_0814195E:
	adds r0, r4, 0
	bl sub_8140BF8
	cmp r0, 0
	beq _08141978
	movs r0, 0x2
	bl GetBgTilemapBuffer
	lsls r1, r4, 16
	lsrs r1, 16
	movs r2, 0x6
	bl sub_81418C4
_08141978:
	adds r4, 0x1
	cmp r4, 0x4
	ble _0814195E
	b _08141A84
	.align 2, 0
_08141980: .4byte gUnknown_84664BC
_08141984:
	ldrh r1, [r5, 0x2]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _081419C4
	ldr r1, _081419BC @ =gSineTable
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 23
	lsls r0, 16
	lsrs r0, 11
	ldr r1, _081419C0 @ =gUnknown_84664DC
	adds r0, r1
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r5, 0x4]
	adds r0, 0x20
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r5, 0x4]
	movs r0, 0x8
	b _081419C6
	.align 2, 0
_081419BC: .4byte gSineTable
_081419C0: .4byte gUnknown_84664DC
_081419C4:
	subs r0, r1, 0x1
_081419C6:
	strh r0, [r5, 0x2]
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08141A00
	ldrh r0, [r5, 0x8]
	adds r0, 0x8
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r5, 0x8]
	ldr r1, _081419FC @ =gSineTable
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 21
	strh r1, [r5, 0xA]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x40
	movs r2, 0
	bl BlendPalettes
	b _08141A2C
	.align 2, 0
_081419FC: .4byte gSineTable
_08141A00:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08141A2C
	movs r0, 0
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r5, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r1, 27
	lsrs r1, 24
	movs r0, 0x40
	movs r2, 0
	bl BlendPalettes
_08141A2C:
	movs r4, 0
	ldr r5, _08141A4C @ =gPlttBufferFaded
	ldr r3, _08141A50 @ =gUnknown_8466C34
	ldr r2, _08141A54 @ =gPlttBufferUnfaded
_08141A34:
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, 0x60
	lsls r0, 1
	adds r1, r0, r5
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, 0x1
	cmp r4, 0x1
	bls _08141A34
	b _08141AA8
	.align 2, 0
_08141A4C: .4byte gPlttBufferFaded
_08141A50: .4byte gUnknown_8466C34
_08141A54: .4byte gPlttBufferUnfaded
_08141A58:
	movs r4, 0
_08141A5A:
	adds r0, r4, 0
	bl sub_8140BF8
	cmp r0, 0
	beq _08141A74
	movs r0, 0x2
	bl GetBgTilemapBuffer
	lsls r1, r4, 16
	lsrs r1, 16
	movs r2, 0x4
	bl sub_81418C4
_08141A74:
	adds r4, 0x1
	cmp r4, 0x4
	ble _08141A5A
	ldr r0, _08141A94 @ =gUnknown_8465950
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
_08141A84:
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _08141AA8
	.align 2, 0
_08141A94: .4byte gUnknown_8465950
_08141A98:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08141AA8
	adds r0, r4, 0
	bl DestroyTask
_08141AA8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814191C

	thumb_func_start sub_8141AB0
sub_8141AB0: @ 8141AB0
	push {lr}
	ldr r0, _08141AD0 @ =sub_814191C
	bl FindTaskIdByFunc
	ldr r2, _08141AD4 @ =gTasks
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x2
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08141AD0: .4byte sub_814191C
_08141AD4: .4byte gTasks
	thumb_func_end sub_8141AB0

	thumb_func_start sub_8141AD8
sub_8141AD8: @ 8141AD8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08141B14 @ =gUnknown_8466C38
	movs r1, 0xA
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl MoveMenuCursorNoWrapAround
	bl sub_814112C
	movs r1, 0x1
	str r1, [r0, 0x28]
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141B14: .4byte gUnknown_8466C38
	thumb_func_end sub_8141AD8

	thumb_func_start sub_8141B18
sub_8141B18: @ 8141B18
	push {r4,lr}
	bl sub_814112C
	adds r4, r0, 0
	ldr r0, [r4, 0x28]
	cmp r0, 0
	beq _08141B2E
	bl sub_81100E8
	movs r0, 0
	str r0, [r4, 0x28]
_08141B2E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8141B18

	thumb_func_start sub_8141B34
sub_8141B34: @ 8141B34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	bl sub_814112C
	adds r4, r0, 0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	mov r12, r0
	movs r1, 0
	movs r0, 0x44
	adds r0, r4
	mov r8, r0
	adds r7, r4, 0
	adds r7, 0x2C
	ldr r0, _08141B9C @ =gUnknown_8466C40
	mov r9, r0
_08141B5A:
	movs r5, 0
	lsls r0, r1, 3
	adds r6, r1, 0x1
	mov r1, r8
	adds r4, r0, r1
	mov r1, r9
	adds r3, r0, r1
	adds r2, r0, 0
_08141B6A:
	ldrh r0, [r3]
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	strh r0, [r4]
	adds r1, r7, r2
	adds r0, r5, 0
	adds r0, 0xC0
	strh r0, [r1]
	adds r4, 0x2
	adds r3, 0x2
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08141B6A
	adds r1, r6, 0
	cmp r1, 0x2
	ble _08141B5A
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141B9C: .4byte gUnknown_8466C40
	thumb_func_end sub_8141B34

	thumb_func_start sub_8141BA0
sub_8141BA0: @ 8141BA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bhi _08141BD8
	bl sub_814112C
	adds r4, r0, 0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	adds r6, r0, 0
	lsls r0, r5, 3
	ldr r1, _08141BE0 @ =gUnknown_8466C40
	adds r4, 0x2C
	adds r3, r0, r4
	adds r2, r0, r1
	movs r4, 0x3
_08141BC4:
	ldrh r0, [r2]
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08141BC4
_08141BD8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08141BE0: .4byte gUnknown_8466C40
	thumb_func_end sub_8141BA0

	thumb_func_start sub_8141BE4
sub_8141BE4: @ 8141BE4
	push {r4-r7,lr}
	bl sub_814112C
	adds r4, r0, 0
	movs r0, 0x2
	bl GetBgTilemapBuffer
	adds r6, r0, 0
	movs r1, 0
	adds r7, r4, 0
	adds r7, 0x44
	ldr r0, _08141C2C @ =gUnknown_8466C40
	mov r12, r0
_08141BFE:
	lsls r0, r1, 3
	adds r5, r1, 0x1
	adds r3, r0, r7
	mov r1, r12
	adds r2, r0, r1
	movs r4, 0x3
_08141C0A:
	ldrh r0, [r2]
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08141C0A
	adds r1, r5, 0
	cmp r1, 0x2
	ble _08141BFE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141C2C: .4byte gUnknown_8466C40
	thumb_func_end sub_8141BE4

	thumb_func_start sub_8141C30
sub_8141C30: @ 8141C30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	bl sub_814112C
	adds r0, 0x20
	strb r4, [r0]
	movs r0, 0xC
	adds r1, r5, 0
	bl sub_8141148
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8141C30

	.align 2, 0 @ Don't pad with nop.
