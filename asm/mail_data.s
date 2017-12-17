	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ClearMailData
ClearMailData: @ 8097C84
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08097CAC @ =gUnknown_3005008
_08097C8A:
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _08097CB0 @ =0x00002cd0
	adds r1, r0
	ldr r0, [r5]
	adds r0, r1
	bl ClearMailStruct
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08097C8A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097CAC: .4byte gUnknown_3005008
_08097CB0: .4byte 0x00002cd0
	thumb_func_end ClearMailData

	thumb_func_start ClearMailStruct
ClearMailStruct: @ 8097CB4
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r0, _08097D04 @ =0x0000ffff
	adds r4, r0, 0
	adds r1, r3, 0
	movs r2, 0x8
_08097CC0:
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _08097CC0
	movs r2, 0
	adds r6, r3, 0
	adds r6, 0x1A
	adds r4, r3, 0
	adds r4, 0x12
	movs r5, 0xFF
_08097CDA:
	adds r1, r4, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x7
	ble _08097CDA
	adds r1, r6, 0
	movs r2, 0
	adds r0, r1, 0x3
_08097CEE:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08097CEE
	movs r1, 0
	movs r0, 0x1
	strh r0, [r3, 0x1E]
	strh r1, [r3, 0x20]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08097D04: .4byte 0x0000ffff
	thumb_func_end ClearMailStruct

	thumb_func_start MonHasMail
MonHasMail: @ 8097D08
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08097D30
	adds r0, r4, 0
	movs r1, 0x40
	bl GetMonData
	cmp r0, 0xFF
	beq _08097D30
	movs r0, 0x1
	b _08097D32
_08097D30:
	movs r0, 0
_08097D32:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonHasMail

	thumb_func_start sub_8097D38
sub_8097D38: @ 8097D38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r8, r0
	lsls r1, 16
	lsrs r0, r1, 16
	str r0, [sp, 0x8]
	mov r0, sp
	movs r2, 0
	ldrb r3, [r0, 0x8]
	strb r3, [r0]
	lsrs r1, 24
	strb r1, [r0, 0x1]
	add r4, sp, 0x4
	strb r2, [r4]
	mov r12, r4
	mov r9, r4
	adds r5, r4, 0
_08097D62:
	ldr r2, _08097EC0 @ =gUnknown_3005008
	ldr r0, [r2]
	ldrb r3, [r5]
	lsls r1, r3, 3
	adds r1, r3
	lsls r1, 2
	adds r0, r1
	ldr r1, _08097EC4 @ =0x00002cf0
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08097D7C
	b _08097EE0
_08097D7C:
	movs r4, 0
	ldr r3, _08097EC8 @ =gUnknown_300500C
	mov r10, r3
	adds r7, r2, 0
	mov r5, r12
	ldr r0, _08097ECC @ =0x0000ffff
	adds r6, r0, 0
_08097D8A:
	ldr r2, [r7]
	lsls r3, r4, 1
	ldrb r1, [r5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r3, r0
	ldr r1, _08097ED0 @ =0x00002cd0
	adds r2, r1
	adds r2, r3
	ldrh r0, [r2]
	orrs r0, r6
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08097D8A
	movs r4, 0
	mov r2, r10
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08097DEE
	ldr r3, _08097EC8 @ =gUnknown_300500C
_08097DBC:
	ldr r0, _08097EC0 @ =gUnknown_3005008
	ldr r2, [r0]
	mov r0, r12
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldr r1, _08097ED4 @ =0x00002ce2
	adds r2, r1
	adds r2, r0
	ldr r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bhi _08097DEE
	ldr r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08097DBC
_08097DEE:
	cmp r4, 0x5
	bhi _08097E16
	ldr r7, _08097EC0 @ =gUnknown_3005008
	mov r3, r12
	ldr r6, _08097ED4 @ =0x00002ce2
	movs r5, 0
_08097DFA:
	ldr r2, [r7]
	ldrb r1, [r3]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	adds r2, r6
	adds r2, r0
	strb r5, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08097DFA
_08097E16:
	ldr r3, _08097EC0 @ =gUnknown_3005008
	ldr r2, [r3]
	mov r0, r12
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldr r1, _08097ED4 @ =0x00002ce2
	adds r2, r1
	adds r2, r0
	movs r0, 0xFF
	strb r0, [r2]
	movs r4, 0
	adds r5, r3, 0
	mov r3, r12
_08097E36:
	ldr r2, [r5]
	ldrb r1, [r3]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldr r1, _08097ED8 @ =0x00002cea
	adds r2, r1
	adds r2, r0
	mov r1, r10
	ldr r0, [r1]
	adds r0, 0xA
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08097E36
	mov r0, r8
	movs r1, 0xB
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8097F00
	ldr r1, _08097EC0 @ =gUnknown_3005008
	ldr r3, [r1]
	mov r4, r9
	ldrb r2, [r4]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r3, r1
	ldr r2, _08097EDC @ =0x00002cee
	adds r1, r2
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r3, r0
	ldr r4, _08097EC4 @ =0x00002cf0
	adds r3, r4
	mov r0, sp
	ldrh r0, [r0, 0x8]
	strh r0, [r3]
	mov r0, r8
	movs r1, 0x40
	mov r2, r9
	bl sub_804037C
	mov r0, r8
	movs r1, 0xC
	mov r2, sp
	bl sub_804037C
	mov r1, r9
	ldrb r0, [r1]
	b _08097EEE
	.align 2, 0
_08097EC0: .4byte gUnknown_3005008
_08097EC4: .4byte 0x00002cf0
_08097EC8: .4byte gUnknown_300500C
_08097ECC: .4byte 0x0000ffff
_08097ED0: .4byte 0x00002cd0
_08097ED4: .4byte 0x00002ce2
_08097ED8: .4byte 0x00002cea
_08097EDC: .4byte 0x00002cee
_08097EE0:
	adds r0, r3, 0x1
	strb r0, [r4]
	ldrb r0, [r5]
	cmp r0, 0x5
	bhi _08097EEC
	b _08097D62
_08097EEC:
	movs r0, 0xFF
_08097EEE:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8097D38

	thumb_func_start sub_8097F00
sub_8097F00: @ 8097F00
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _08097F18
	adds r0, r1, 0
	bl mon_icon_personality_to_unown_id
	lsls r0, 16
	ldr r1, _08097F1C @ =0x75300000
	adds r0, r1
	lsrs r0, 16
_08097F18:
	pop {r1}
	bx r1
	.align 2, 0
_08097F1C: .4byte 0x75300000
	thumb_func_end sub_8097F00

	thumb_func_start sub_8097F20
sub_8097F20: @ 8097F20
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08097F38 @ =0xffff8ad0
	adds r2, r3, r0
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0x1B
	bhi _08097F3C
	movs r0, 0xC9
	strh r2, [r1]
	b _08097F3E
	.align 2, 0
_08097F38: .4byte 0xffff8ad0
_08097F3C:
	adds r0, r3, 0
_08097F3E:
	pop {r1}
	bx r1
	thumb_func_end sub_8097F20

	thumb_func_start GiveMailToMon2
GiveMailToMon2: @ 8097F44
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r7, r1, 0
	ldrh r5, [r7, 0x20]
	adds r1, r5, 0
	bl sub_8097D38
	add r4, sp, 0x4
	strb r0, [r4]
	ldrb r2, [r4]
	cmp r2, 0xFF
	beq _08097FA8
	ldr r0, _08097FA0 @ =gUnknown_3005008
	ldr r1, [r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0
	ldr r0, _08097FA4 @ =0x00002cd0
	adds r1, r0
	adds r0, r7, 0
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r6, 0
	movs r1, 0x40
	adds r2, r4, 0
	bl sub_804037C
	mov r0, sp
	strb r5, [r0]
	mov r1, sp
	lsrs r0, r5, 8
	strb r0, [r1, 0x1]
	adds r0, r6, 0
	movs r1, 0xC
	mov r2, sp
	bl sub_804037C
	ldrb r0, [r4]
	b _08097FAA
	.align 2, 0
_08097FA0: .4byte gUnknown_3005008
_08097FA4: .4byte 0x00002cd0
_08097FA8:
	movs r0, 0xFF
_08097FAA:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GiveMailToMon2

	thumb_func_start sub_8097FB4
sub_8097FB4: @ 8097FB4
	movs r0, 0
	bx lr
	thumb_func_end sub_8097FB4

	thumb_func_start TakeMailFromMon
TakeMailFromMon: @ 8097FB8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	bl MonHasMail
	lsls r0, 24
	cmp r0, 0
	beq _08098008
	adds r0, r4, 0
	movs r1, 0x40
	bl GetMonData
	add r2, sp, 0x4
	strb r0, [r2]
	ldr r0, _08098010 @ =gUnknown_3005008
	ldr r3, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r3, r0
	ldr r0, _08098014 @ =0x00002cf0
	adds r3, r0
	movs r1, 0
	movs r0, 0
	strh r0, [r3]
	movs r0, 0xFF
	strb r0, [r2]
	mov r0, sp
	strb r1, [r0]
	strb r1, [r0, 0x1]
	adds r0, r4, 0
	movs r1, 0x40
	bl sub_804037C
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl sub_804037C
_08098008:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098010: .4byte gUnknown_3005008
_08098014: .4byte 0x00002cf0
	thumb_func_end TakeMailFromMon

	thumb_func_start sub_8098018
sub_8098018: @ 8098018
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08098034 @ =gUnknown_3005008
	ldr r2, [r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r2, r1
	ldr r0, _08098038 @ =0x00002cf0
	adds r2, r0
	movs r0, 0
	strh r0, [r2]
	bx lr
	.align 2, 0
_08098034: .4byte gUnknown_3005008
_08098038: .4byte 0x00002cf0
	thumb_func_end sub_8098018

	thumb_func_start sub_809803C
sub_809803C: @ 809803C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	adds r5, r0, 0
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	add r1, sp, 0x4
	movs r0, 0xFF
	strb r0, [r1]
	movs r7, 0x6
	mov r9, r1
	ldr r0, _080980D0 @ =gUnknown_3005008
	mov r8, r0
	ldr r3, _080980D4 @ =0x00002cd0
_08098060:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r7, 3
	adds r1, r7
	lsls r1, 2
	adds r4, r0, r1
	ldr r2, _080980D8 @ =0x00002cf0
	adds r0, r4, r2
	ldrh r6, [r0]
	cmp r6, 0
	bne _080980DC
	adds r4, r3
	adds r0, r5, 0
	movs r1, 0x40
	str r3, [sp, 0x8]
	bl GetMonData
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r3, [sp, 0x8]
	adds r1, r3
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r2, r1
	ldr r3, _080980D8 @ =0x00002cf0
	adds r2, r3
	strh r6, [r2]
	adds r0, r5, 0
	movs r1, 0x40
	mov r2, r9
	bl sub_804037C
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl sub_804037C
	adds r0, r7, 0
	b _080980E8
	.align 2, 0
_080980D0: .4byte gUnknown_3005008
_080980D4: .4byte 0x00002cd0
_080980D8: .4byte 0x00002cf0
_080980DC:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _08098060
	movs r0, 0xFF
_080980E8:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809803C

	thumb_func_start itemid_is_mail
itemid_is_mail: @ 80980F8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bgt _0809810A
	cmp r0, 0x79
	blt _0809810A
	movs r0, 0x1
	b _0809810C
_0809810A:
	movs r0, 0
_0809810C:
	pop {r1}
	bx r1
	thumb_func_end itemid_is_mail

	.align 2, 0 @ Don't pad with nop.
