	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80DA800
sub_80DA800: @ 80DA800
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	lsrs r2, 16
	movs r4, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080DA828
	ands r1, r4
	cmp r1, 0
	beq _080DA828
	ands r2, r4
	cmp r2, 0
	beq _080DA828
	ands r3, r4
	cmp r3, 0
	beq _080DA828
	movs r0, 0x1
	b _080DA82A
_080DA828:
	movs r0, 0
_080DA82A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DA800

	thumb_func_start SetIncompatible
SetIncompatible: @ 80DA830
	push {lr}
	ldr r0, _080DA844 @ =gStringVar4
	ldr r1, _080DA848 @ =gUnknown_8488DFD
	bl StringExpandPlaceholders
	movs r0, 0x3
	bl sub_80DA8E8
	pop {r0}
	bx r0
	.align 2, 0
_080DA844: .4byte gStringVar4
_080DA848: .4byte gUnknown_8488DFD
	thumb_func_end SetIncompatible

	thumb_func_start InitMysteryEventScript
InitMysteryEventScript: @ 80DA84C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _080DA874 @ =gUnknown_81DBCF0
	ldr r2, _080DA878 @ =0x081dbd34
	bl InitScriptContext
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetupBytecodeScript
	str r5, [r4, 0x64]
	movs r0, 0
	str r0, [r4, 0x68]
	str r0, [r4, 0x6C]
	str r0, [r4, 0x70]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA874: .4byte gUnknown_81DBCF0
_080DA878: .4byte 0x081dbd34
	thumb_func_end InitMysteryEventScript

	thumb_func_start RunMysteryEventScriptCommand
RunMysteryEventScriptCommand: @ 80DA87C
	push {r4,lr}
	adds r4, r0, 0
	bl RunScriptCommand
	lsls r0, 24
	cmp r0, 0
	beq _080DA894
	ldr r0, [r4, 0x70]
	cmp r0, 0
	beq _080DA894
	movs r0, 0x1
	b _080DA896
_080DA894:
	movs r0, 0
_080DA896:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end RunMysteryEventScriptCommand

	thumb_func_start sub_80DA89C
sub_80DA89C: @ 80DA89C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080DA8AC @ =gUnknown_203AA3C
	bl InitMysteryEventScript
	pop {r0}
	bx r0
	.align 2, 0
_080DA8AC: .4byte gUnknown_203AA3C
	thumb_func_end sub_80DA89C

	thumb_func_start sub_80DA8B0
sub_80DA8B0: @ 80DA8B0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DA8C8 @ =gUnknown_203AA3C
	adds r0, r4, 0
	bl RunMysteryEventScriptCommand
	ldr r1, [r4, 0x6C]
	str r1, [r5]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA8C8: .4byte gUnknown_203AA3C
	thumb_func_end sub_80DA8B0

	thumb_func_start sub_80DA8CC
sub_80DA8CC: @ 80DA8CC
	push {lr}
	sub sp, 0x4
	bl sub_80DA89C
_080DA8D4:
	mov r0, sp
	bl sub_80DA8B0
	cmp r0, 0
	bne _080DA8D4
	ldr r0, [sp]
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_80DA8CC

	thumb_func_start sub_80DA8E8
sub_80DA8E8: @ 80DA8E8
	ldr r1, _080DA8F0 @ =gUnknown_203AA3C
	str r0, [r1, 0x6C]
	bx lr
	.align 2, 0
_080DA8F0: .4byte gUnknown_203AA3C
	thumb_func_end sub_80DA8E8

	thumb_func_start script_status_stop_and_ret_1
script_status_stop_and_ret_1: @ 80DA8F4
	push {lr}
	bl StopScript
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end script_status_stop_and_ret_1

	thumb_func_start MEScrCmd_checkcompat
MEScrCmd_checkcompat: @ 80DA900
	push {r4-r7,lr}
	adds r7, r0, 0
	bl ScriptReadWord
	str r0, [r7, 0x68]
	adds r0, r7, 0
	bl ScriptReadHalfword
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r7, 0
	bl ScriptReadWord
	adds r6, r0, 0
	adds r0, r7, 0
	bl ScriptReadHalfword
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl ScriptReadWord
	adds r3, r0, 0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80DA800
	cmp r0, 0x1
	bne _080DA944
	str r0, [r7, 0x70]
	b _080DA948
_080DA944:
	bl SetIncompatible
_080DA948:
	movs r0, 0x1
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_checkcompat

	thumb_func_start sub_80DA950
sub_80DA950: @ 80DA950
	movs r0, 0
	bx lr
	thumb_func_end sub_80DA950

	thumb_func_start MEScrCmd_setstatus
MEScrCmd_setstatus: @ 80DA954
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	str r2, [r0, 0x6C]
	movs r0, 0
	bx lr
	thumb_func_end MEScrCmd_setstatus

	thumb_func_start MEScrCmd_setmsg
MEScrCmd_setmsg: @ 80DA964
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	ldr r1, [r4, 0x68]
	subs r0, r1
	ldr r1, [r4, 0x64]
	adds r1, r0, r1
	cmp r5, 0xFF
	beq _080DA988
	ldr r0, [r4, 0x6C]
	cmp r5, r0
	bne _080DA98E
_080DA988:
	ldr r0, _080DA998 @ =gStringVar4
	bl StringExpandPlaceholders
_080DA98E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA998: .4byte gStringVar4
	thumb_func_end MEScrCmd_setmsg

	thumb_func_start MEScrCmd_runscript
MEScrCmd_runscript: @ 80DA99C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	ldr r1, [r4, 0x68]
	subs r0, r1
	ldr r1, [r4, 0x64]
	adds r0, r1
	bl ScriptContext2_RunNewScript
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_runscript

	thumb_func_start MEScrCmd_setenigmaberry
MEScrCmd_setenigmaberry: @ 80DA9B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	bl IsEnigmaBerryValid
	mov r8, r0
	adds r0, r7, 0
	bl ScriptReadWord
	adds r4, r0, 0
	ldr r0, [r7, 0x68]
	subs r4, r0
	ldr r0, [r7, 0x64]
	adds r4, r0
	ldr r0, _080DAA0C @ =gStringVar1
	mov r9, r0
	ldr r6, _080DAA10 @ =gSaveBlock1Ptr
	ldr r1, [r6]
	ldr r5, _080DAA14 @ =0x000030ec
	adds r1, r5
	movs r2, 0x7
	bl StringCopyN
	adds r0, r4, 0
	bl sub_809C7C4
	ldr r4, _080DAA18 @ =gStringVar2
	ldr r1, [r6]
	adds r1, r5
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	mov r0, r8
	cmp r0, 0
	bne _080DAA24
	ldr r0, _080DAA1C @ =gStringVar4
	ldr r1, _080DAA20 @ =gUnknown_8488C70
	b _080DAA44
	.align 2, 0
_080DAA0C: .4byte gStringVar1
_080DAA10: .4byte gSaveBlock1Ptr
_080DAA14: .4byte 0x000030ec
_080DAA18: .4byte gStringVar2
_080DAA1C: .4byte gStringVar4
_080DAA20: .4byte gUnknown_8488C70
_080DAA24:
	mov r0, r9
	adds r1, r4, 0
	bl StringCompare
	cmp r0, 0
	beq _080DAA40
	ldr r0, _080DAA38 @ =gStringVar4
	ldr r1, _080DAA3C @ =gUnknown_8488CA2
	b _080DAA44
	.align 2, 0
_080DAA38: .4byte gStringVar4
_080DAA3C: .4byte gUnknown_8488CA2
_080DAA40:
	ldr r0, _080DAA60 @ =gStringVar4
	ldr r1, _080DAA64 @ =gUnknown_8488CCE
_080DAA44:
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r7, 0x6C]
	bl IsEnigmaBerryValid
	cmp r0, 0x1
	bne _080DAA6C
	ldr r0, _080DAA68 @ =0x00004033
	movs r1, 0x1
	bl VarSet
	b _080DAA70
	.align 2, 0
_080DAA60: .4byte gStringVar4
_080DAA64: .4byte gUnknown_8488CCE
_080DAA68: .4byte 0x00004033
_080DAA6C:
	movs r0, 0x1
	str r0, [r7, 0x6C]
_080DAA70:
	movs r0, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_setenigmaberry

	thumb_func_start MEScrCmd_giveribbon
MEScrCmd_giveribbon: @ 80DAA80
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl GiveGiftRibbonToParty
	ldr r0, _080DAAAC @ =gStringVar4
	ldr r1, _080DAAB0 @ =gUnknown_8488CF6
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DAAAC: .4byte gStringVar4
_080DAAB0: .4byte gUnknown_8488CF6
	thumb_func_end MEScrCmd_giveribbon

	thumb_func_start MEScrCmd_initramscript
MEScrCmd_initramscript: @ 80DAAB4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r4, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	adds r5, r0, 0
	ldr r0, [r4, 0x68]
	subs r5, r0
	ldr r0, [r4, 0x64]
	adds r5, r0
	adds r0, r4, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r4, 0x68]
	subs r1, r0
	ldr r0, [r4, 0x64]
	adds r1, r0
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	str r6, [sp]
	adds r0, r5, 0
	mov r2, r9
	mov r3, r8
	bl InitRamScript
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_initramscript

	thumb_func_start sub_80DAB1C
sub_80DAB1C: @ 80DAB1C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_806E22C
	ldr r0, _080DAB38 @ =gStringVar4
	ldr r1, _080DAB3C @ =gUnknown_8488D2A
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DAB38: .4byte gStringVar4
_080DAB3C: .4byte gUnknown_8488D2A
	thumb_func_end sub_80DAB1C

	thumb_func_start MEScrCmd_addrareword
MEScrCmd_addrareword: @ 80DAB40
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	bl sub_80BDB70
	ldr r0, _080DAB64 @ =gStringVar4
	ldr r1, _080DAB68 @ =gUnknown_8488D60
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DAB64: .4byte gStringVar4
_080DAB68: .4byte gUnknown_8488D60
	thumb_func_end MEScrCmd_addrareword

	thumb_func_start sub_80DAB6C
sub_80DAB6C: @ 80DAB6C
	push {r4,lr}
	adds r4, r0, 0
	bl SetIncompatible
	movs r0, 0
	str r0, [r4, 0x70]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DAB6C

	thumb_func_start sub_80DAB80
sub_80DAB80: @ 80DAB80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x88
	adds r6, r0, 0
	bl ScriptReadWord
	ldr r1, [r6, 0x68]
	subs r0, r1
	ldr r1, [r6, 0x64]
	adds r5, r0, r1
	movs r0, 0x64
	adds r0, r5
	mov r8, r0
	add r4, sp, 0x24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _080DABD0
	ldr r0, _080DABC8 @ =gStringVar1
	ldr r1, _080DABCC @ =gText_EggNickname
	movs r2, 0xB
	bl StringCopyN
	b _080DABDA
	.align 2, 0
_080DABC8: .4byte gStringVar1
_080DABCC: .4byte gText_EggNickname
_080DABD0:
	ldr r0, _080DABF0 @ =gStringVar1
	ldr r1, _080DABF4 @ =gUnknown_8415A66
	movs r2, 0xB
	bl StringCopyN
_080DABDA:
	ldr r0, _080DABF8 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _080DAC04
	ldr r0, _080DABFC @ =gStringVar4
	ldr r1, _080DAC00 @ =gUnknown_8488D8E
	bl StringExpandPlaceholders
	movs r0, 0x3
	b _080DAC6E
	.align 2, 0
_080DABF0: .4byte gStringVar1
_080DABF4: .4byte gUnknown_8415A66
_080DABF8: .4byte gPlayerPartyCount
_080DABFC: .4byte gStringVar4
_080DAC00: .4byte gUnknown_8488D8E
_080DAC04:
	ldr r7, _080DAC80 @ =gUnknown_2024478
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	mov r0, sp
	mov r1, r8
	movs r2, 0x24
	bl memcpy
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _080DAC3E
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8088E74
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8088E74
_080DAC3E:
	adds r0, r7, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _080DAC5C
	adds r0, r7, 0
	mov r1, sp
	bl GiveMailToMon2
_080DAC5C:
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	ldr r0, _080DAC84 @ =gStringVar4
	ldr r1, _080DAC88 @ =gUnknown_8488D7C
	bl StringExpandPlaceholders
	movs r0, 0x2
_080DAC6E:
	str r0, [r6, 0x6C]
	movs r0, 0
	add sp, 0x88
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DAC80: .4byte gUnknown_2024478
_080DAC84: .4byte gStringVar4
_080DAC88: .4byte gUnknown_8488D7C
	thumb_func_end sub_80DAB80

	thumb_func_start sub_80DAC8C
sub_80DAC8C: @ 80DAC8C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r4, 0x68]
	subs r1, r0
	ldr r0, [r4, 0x64]
	adds r1, r0
	ldr r0, _080DACC8 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r2, 0x94
	lsls r2, 3
	adds r0, r2
	movs r2, 0xBC
	bl memcpy
	bl sub_80E7490
	ldr r0, _080DACCC @ =gStringVar4
	ldr r1, _080DACD0 @ =gUnknown_8488DBD
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DACC8: .4byte gSaveBlock2Ptr
_080DACCC: .4byte gStringVar4
_080DACD0: .4byte gUnknown_8488DBD
	thumb_func_end sub_80DAC8C

	thumb_func_start sub_80DACD4
sub_80DACD4: @ 80DACD4
	push {r4,lr}
	adds r4, r0, 0
	bl SetIncompatible
	movs r0, 0
	str r0, [r4, 0x70]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80DACD4

	thumb_func_start MEScrCmd_checksum
MEScrCmd_checksum: @ 80DACE8
	push {r4-r6,lr}
	adds r6, r0, 0
	bl ScriptReadWord
	adds r5, r0, 0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r4, r0, 0
	ldr r0, [r6, 0x68]
	subs r4, r0
	ldr r0, [r6, 0x64]
	adds r4, r0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r6, 0x68]
	subs r1, r0
	ldr r0, [r6, 0x64]
	adds r1, r0
	subs r1, r4
	adds r0, r4, 0
	bl CalcByteArraySum
	cmp r5, r0
	beq _080DAD26
	movs r0, 0
	str r0, [r6, 0x70]
	movs r0, 0x1
	str r0, [r6, 0x6C]
_080DAD26:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_checksum

	thumb_func_start MEScrCmd_crc
MEScrCmd_crc: @ 80DAD30
	push {r4-r6,lr}
	adds r6, r0, 0
	bl ScriptReadWord
	adds r5, r0, 0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r4, r0, 0
	ldr r0, [r6, 0x68]
	subs r4, r0
	ldr r0, [r6, 0x64]
	adds r4, r0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r6, 0x68]
	subs r1, r0
	ldr r0, [r6, 0x64]
	adds r1, r0
	subs r1, r4
	adds r0, r4, 0
	bl CalcCRC16
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	beq _080DAD72
	movs r0, 0
	str r0, [r6, 0x70]
	movs r0, 0x1
	str r0, [r6, 0x6C]
_080DAD72:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_crc

	.align 2, 0 @ Don't pad with nop.
