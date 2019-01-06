	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ScrCmd_cmdCA
ScrCmd_cmdCA: @ 806C7BC
	push {lr}
	bl sub_8069A20
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cmdCA

	thumb_func_start ScrCmd_cmdCB
ScrCmd_cmdCB: @ 806C7C8
	push {lr}
	bl sub_8069A2C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cmdCB

	thumb_func_start ScrCmd_setmonobedient
ScrCmd_setmonobedient: @ 806C7D4
	push {lr}
	sub sp, 0x4
	movs r2, 0x1
	mov r1, sp
	strb r2, [r1]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C808 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x50
	mov r2, sp
	bl SetMonData
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_0806C808: .4byte gPlayerParty
	thumb_func_end ScrCmd_setmonobedient

	thumb_func_start ScrCmd_checkmonobedience
ScrCmd_checkmonobedience: @ 806C80C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0806C83C @ =gSpecialVar_Result
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806C840 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x50
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C83C: .4byte gSpecialVar_Result
_0806C840: .4byte gPlayerParty
	thumb_func_end ScrCmd_checkmonobedience

	thumb_func_start ScrCmd_setmonmetlocation
ScrCmd_setmonmetlocation: @ 806C844
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	mov r1, sp
	strb r2, [r1]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r3, 0x5
	bhi _0806C87A
	movs r0, 0x64
	muls r0, r3
	ldr r1, _0806C884 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	mov r2, sp
	bl SetMonData
_0806C87A:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C884: .4byte gPlayerParty
	thumb_func_end ScrCmd_setmonmetlocation

	.align 2, 0 @ Don't pad with nop.
