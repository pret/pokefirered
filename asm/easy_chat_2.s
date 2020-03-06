	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FFF98
sub_80FFF98: @ 80FFF98
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080FFFB4 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x5
	bls _080FFFA8
	b _08100100
_080FFFA8:
	lsls r0, 2
	ldr r1, _080FFFB8 @ =_080FFFBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FFFB4: .4byte gUnknown_203ACEC
_080FFFB8: .4byte _080FFFBC
	.align 2, 0
_080FFFBC:
	.4byte _080FFFD4
	.4byte _08100038
	.4byte _0810006C
	.4byte _0810009C
	.4byte _081000AE
	.4byte _081000B8
_080FFFD4:
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08100028 @ =gUnknown_843F8A0
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r4, _0810002C @ =gUnknown_203ACEC
	ldr r1, [r4]
	movs r0, 0xB0
	lsls r0, 4
	adds r1, r0
	movs r0, 0x3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r0
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r0, _08100030 @ =gUnknown_843F8B0
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl sub_8100CBC
	bl sub_8100C5C
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _08100034 @ =0x01000100
	add r0, sp, 0x4
	bl CpuFastSet
	b _08100104
	.align 2, 0
_08100028: .4byte gUnknown_843F8A0
_0810002C: .4byte gUnknown_203ACEC
_08100030: .4byte gUnknown_843F8B0
_08100034: .4byte 0x01000100
_08100038:
	ldr r1, _08100064 @ =gUnknown_8E99DAC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _08100068 @ =gUnknown_8E99E74
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	bl sub_8100F44
	bl sub_8102428
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	b _08100104
	.align 2, 0
_08100064: .4byte gUnknown_8E99DAC
_08100068: .4byte gUnknown_8E99E74
_0810006C:
	ldr r0, _08100094 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 2
	adds r0, r1
	bl sub_8101100
	ldr r1, _08100098 @ =gUnknown_843F7AC
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	b _08100104
	.align 2, 0
_08100094: .4byte gUnknown_203ACEC
_08100098: .4byte gUnknown_843F7AC
_0810009C:
	bl sub_8100D24
	bl sub_8100E34
	bl sub_8100FDC
	bl sub_81012CC
	b _08100104
_081000AE:
	bl sub_8101A90
	bl sub_8101AC4
	b _08100104
_081000B8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0810010E
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8101A5C
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3B
	bl SetGpuReg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0
	bl ShowBg
	bl sub_81021D4
	bl sub_8102320
	b _08100104
_08100100:
	movs r0, 0
	b _08100110
_08100104:
	ldr r0, _08100118 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810010E:
	movs r0, 0x1
_08100110:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08100118: .4byte gUnknown_203ACEC
	thumb_func_end sub_80FFF98

	thumb_func_start sub_810011C
sub_810011C: @ 810011C
	push {lr}
	ldr r0, _08100130 @ =gUnknown_203ACEC
	ldr r0, [r0]
	cmp r0, 0
	beq _0810012A
	bl Free
_0810012A:
	pop {r0}
	bx r0
	.align 2, 0
_08100130: .4byte gUnknown_203ACEC
	thumb_func_end sub_810011C

	thumb_func_start sub_8100134
sub_8100134: @ 8100134
	push {lr}
	ldr r1, _08100148 @ =gUnknown_203ACEC
	ldr r1, [r1]
	movs r2, 0
	strh r0, [r1, 0x4]
	strh r2, [r1]
	bl sub_810014C
	pop {r0}
	bx r0
	.align 2, 0
_08100148: .4byte gUnknown_203ACEC
	thumb_func_end sub_8100134

	thumb_func_start sub_810014C
sub_810014C: @ 810014C
	push {lr}
	ldr r0, _08100164 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0, 0x4]
	cmp r0, 0x16
	bhi _08100250
	lsls r0, 2
	ldr r1, _08100168 @ =_0810016C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08100164: .4byte gUnknown_203ACEC
_08100168: .4byte _0810016C
	.align 2, 0
_0810016C:
	.4byte _08100250
	.4byte _081001C8
	.4byte _081001CE
	.4byte _081001D4
	.4byte _081001DA
	.4byte _081001E0
	.4byte _081001E6
	.4byte _081001EC
	.4byte _081001F2
	.4byte _081001F8
	.4byte _081001FE
	.4byte _08100204
	.4byte _0810020A
	.4byte _08100210
	.4byte _08100216
	.4byte _0810021C
	.4byte _08100222
	.4byte _08100228
	.4byte _0810022E
	.4byte _08100234
	.4byte _0810023A
	.4byte _08100240
	.4byte _08100246
_081001C8:
	bl sub_8100258
	b _0810024A
_081001CE:
	bl sub_8100290
	b _0810024A
_081001D4:
	bl sub_8100374
	b _0810024A
_081001DA:
	bl sub_8100430
	b _0810024A
_081001E0:
	bl sub_81003A8
	b _0810024A
_081001E6:
	bl sub_81003EC
	b _0810024A
_081001EC:
	bl sub_8100474
	b _0810024A
_081001F2:
	bl sub_81004B8
	b _0810024A
_081001F8:
	bl sub_81004F4
	b _0810024A
_081001FE:
	bl sub_81005C0
	b _0810024A
_08100204:
	bl sub_81007D0
	b _0810024A
_0810020A:
	bl sub_8100890
	b _0810024A
_08100210:
	bl sub_810093C
	b _0810024A
_08100216:
	bl sub_8100720
	b _0810024A
_0810021C:
	bl sub_810072C
	b _0810024A
_08100222:
	bl sub_8100774
	b _0810024A
_08100228:
	bl sub_81009F8
	b _0810024A
_0810022E:
	bl sub_8100A78
	b _0810024A
_08100234:
	bl sub_8100A04
	b _0810024A
_0810023A:
	bl sub_8100B70
	b _0810024A
_08100240:
	bl sub_8100AE8
	b _0810024A
_08100246:
	bl sub_8100660
_0810024A:
	lsls r0, 24
	lsrs r0, 24
	b _08100252
_08100250:
	movs r0, 0
_08100252:
	pop {r1}
	bx r1
	thumb_func_end sub_810014C

	thumb_func_start sub_8100258
sub_8100258: @ 8100258
	push {r4,lr}
	ldr r4, _0810026C @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100270
	cmp r0, 0x1
	beq _0810027E
	b _08100288
	.align 2, 0
_0810026C: .4byte gUnknown_203ACEC
_08100270:
	bl sub_8100FDC
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100288
_0810027E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0810028A
_08100288:
	movs r0, 0x1
_0810028A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100258

	thumb_func_start sub_8100290
sub_8100290: @ 8100290
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x40
	bl GetEasyChatWordBuffer
	adds r4, r0, 0
	bl GetEasyChatScreenFrameId
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	bl GetMainCursorColumn
	lsls r0, 24
	lsrs r7, r0, 24
	bl GetMainCursorRow
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl GetNumColumns
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	lsls r0, 1
	adds r4, r0
	ldr r1, _08100304 @ =gUnknown_843F888
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 19
	movs r1, 0xD0
	lsls r1, 12
	adds r0, r1
	lsrs r6, r0, 16
	movs r5, 0
	cmp r5, r7
	bcs _0810033A
	ldr r2, _08100308 @ =0x0000ffff
	mov r10, r2
_081002EE:
	ldrh r0, [r4]
	cmp r0, r10
	bne _08100310
	movs r0, 0x1
	ldr r1, _0810030C @ =gUnknown_843F8D8
	movs r2, 0
	bl GetStringWidth
	lsls r1, r0, 3
	subs r0, r1, r0
	b _08100322
	.align 2, 0
_08100304: .4byte gUnknown_843F888
_08100308: .4byte 0x0000ffff
_0810030C: .4byte gUnknown_843F8D8
_08100310:
	ldrh r1, [r4]
	mov r0, sp
	bl CopyEasyChatWord
	movs r0, 0x1
	mov r1, sp
	movs r2, 0
	bl GetStringWidth
_08100322:
	adds r0, 0x11
	lsls r1, r6, 16
	asrs r1, 16
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	adds r4, 0x2
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _081002EE
_0810033A:
	ldr r1, _08100370 @ =gUnknown_843F888
	mov r2, r9
	lsls r0, r2, 2
	adds r0, r1
	mov r2, r8
	lsls r1, r2, 1
	ldrb r0, [r0, 0x1]
	adds r1, r0
	adds r1, 0x1
	lsls r1, 3
	adds r1, 0x1
	lsls r0, r6, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_8101B58
	movs r0, 0
	add sp, 0x40
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08100370: .4byte gUnknown_843F888
	thumb_func_end sub_8100290

	thumb_func_start sub_8100374
sub_8100374: @ 8100374
	push {lr}
	bl GetMainCursorColumn
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08100396
	cmp r0, 0x1
	bgt _0810038C
	cmp r0, 0
	beq _08100392
	b _081003A2
_0810038C:
	cmp r0, 0x2
	beq _0810039A
	b _081003A2
_08100392:
	movs r0, 0x1C
	b _0810039C
_08100396:
	movs r0, 0x73
	b _0810039C
_0810039A:
	movs r0, 0xBF
_0810039C:
	movs r1, 0x61
	bl sub_8101B58
_081003A2:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8100374

	thumb_func_start sub_81003A8
sub_81003A8: @ 81003A8
	push {r4,lr}
	ldr r4, _081003BC @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _081003C0
	cmp r0, 0x1
	beq _081003DA
	b _081003E4
	.align 2, 0
_081003BC: .4byte gUnknown_203ACEC
_081003C0:
	bl sub_8101B88
	movs r0, 0x2
	bl sub_8100E7C
	movs r0, 0x1
	bl sub_8100F18
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081003E4
_081003DA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _081003E6
_081003E4:
	movs r0, 0x1
_081003E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81003A8

	thumb_func_start sub_81003EC
sub_81003EC: @ 81003EC
	push {r4,lr}
	ldr r4, _08100400 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100404
	cmp r0, 0x1
	beq _0810041E
	b _08100428
	.align 2, 0
_08100400: .4byte gUnknown_203ACEC
_08100404:
	bl sub_8101B88
	movs r0, 0x3
	bl sub_8100E7C
	movs r0, 0
	bl sub_8100F18
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100428
_0810041E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0810042A
_08100428:
	movs r0, 0x1
_0810042A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81003EC

	thumb_func_start sub_8100430
sub_8100430: @ 8100430
	push {r4,lr}
	ldr r4, _08100444 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100448
	cmp r0, 0x1
	beq _08100462
	b _0810046C
	.align 2, 0
_08100444: .4byte gUnknown_203ACEC
_08100448:
	bl sub_8101B88
	movs r0, 0x1
	bl sub_8100E7C
	movs r0, 0x1
	bl sub_8100F18
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0810046C
_08100462:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0810046E
_0810046C:
	movs r0, 0x1
_0810046E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100430

	thumb_func_start sub_8100474
sub_8100474: @ 8100474
	push {r4,lr}
	ldr r4, _08100488 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _0810048C
	cmp r0, 0x1
	beq _081004A6
	b _081004B0
	.align 2, 0
_08100488: .4byte gUnknown_203ACEC
_0810048C:
	bl sub_8101BA8
	movs r0, 0
	bl sub_8100E7C
	movs r0, 0
	bl ShowBg
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081004B0
_081004A6:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _081004B2
_081004B0:
	movs r0, 0x1
_081004B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100474

	thumb_func_start sub_81004B8
sub_81004B8: @ 81004B8
	push {r4,lr}
	ldr r4, _081004CC @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _081004D0
	cmp r0, 0x1
	beq _081004E6
	movs r0, 0x1
	b _081004EE
	.align 2, 0
_081004CC: .4byte gUnknown_203ACEC
_081004D0:
	bl sub_8101BA8
	movs r0, 0
	bl sub_8100E7C
	bl sub_8100FDC
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081004E6:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
_081004EE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81004B8

	thumb_func_start sub_81004F4
sub_81004F4: @ 81004F4
	push {lr}
	ldr r0, _0810050C @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _081005AE
	lsls r0, 2
	ldr r1, _08100510 @ =_08100514
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810050C: .4byte gUnknown_203ACEC
_08100510: .4byte _08100514
	.align 2, 0
_08100514:
	.4byte _08100528
	.4byte _08100544
	.4byte _08100556
	.4byte _0810056C
	.4byte _0810058C
_08100528:
	bl sub_8101B88
	movs r0, 0
	bl HideBg
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8101A5C
	bl sub_810131C
	b _0810057A
_08100544:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	movs r0, 0
	bl sub_81015D4
	b _0810057A
_08100556:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	b _0810057A
_0810056C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	bl sub_8101FAC
_0810057A:
	ldr r0, _08100588 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081005B8
	.align 2, 0
_08100588: .4byte gUnknown_203ACEC
_0810058C:
	bl sub_8102018
	lsls r0, 24
	cmp r0, 0
	bne _081005B8
	bl sub_8101BC0
	movs r0, 0
	bl sub_81022E0
	bl sub_810224C
	ldr r0, _081005B4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081005AE:
	movs r0, 0
	b _081005BA
	.align 2, 0
_081005B4: .4byte gUnknown_203ACEC
_081005B8:
	movs r0, 0x1
_081005BA:
	pop {r1}
	bx r1
	thumb_func_end sub_81004F4

	thumb_func_start sub_81005C0
sub_81005C0: @ 81005C0
	push {lr}
	ldr r0, _081005D8 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _08100658
	lsls r0, 2
	ldr r1, _081005DC @ =_081005E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081005D8: .4byte gUnknown_203ACEC
_081005DC: .4byte _081005E0
	.align 2, 0
_081005E0:
	.4byte _081005F4
	.4byte _08100602
	.4byte _0810061E
	.4byte _08100630
	.4byte _08100654
_081005F4:
	bl sub_8101C48
	bl sub_81020AC
	bl sub_81022B0
	b _08100644
_08100602:
	bl sub_81020D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08100658
	movs r0, 0x1
	bl sub_81015D4
	ldr r0, _0810062C @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810061E:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100658
	b _08100644
	.align 2, 0
_0810062C: .4byte gUnknown_203ACEC
_08100630:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100658
	bl sub_8101BA8
	movs r0, 0
	bl ShowBg
_08100644:
	ldr r0, _08100650 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100658
	.align 2, 0
_08100650: .4byte gUnknown_203ACEC
_08100654:
	movs r0, 0
	b _0810065A
_08100658:
	movs r0, 0x1
_0810065A:
	pop {r1}
	bx r1
	thumb_func_end sub_81005C0

	thumb_func_start sub_8100660
sub_8100660: @ 8100660
	push {lr}
	ldr r0, _08100678 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _08100718
	lsls r0, 2
	ldr r1, _0810067C @ =_08100680
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08100678: .4byte gUnknown_203ACEC
_0810067C: .4byte _08100680
	.align 2, 0
_08100680:
	.4byte _08100694
	.4byte _081006A8
	.4byte _081006C2
	.4byte _081006E8
	.4byte _0810070E
_08100694:
	bl sub_8101C48
	bl sub_81022B0
	bl sub_810215C
	movs r0, 0x5
	bl sub_81015D4
	b _081006D6
_081006A8:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_81021B8
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_810131C
	b _081006D6
_081006C2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	movs r0, 0x6
	bl sub_81015D4
	bl sub_8102178
_081006D6:
	ldr r0, _081006E4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100718
	.align 2, 0
_081006E4: .4byte gUnknown_203ACEC
_081006E8:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_81021B8
	lsls r0, 24
	cmp r0, 0
	bne _08100718
	bl sub_810224C
	bl sub_8101BC0
	ldr r0, _08100714 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810070E:
	movs r0, 0
	b _0810071A
	.align 2, 0
_08100714: .4byte gUnknown_203ACEC
_08100718:
	movs r0, 0x1
_0810071A:
	pop {r1}
	bx r1
	thumb_func_end sub_8100660

	thumb_func_start sub_8100720
sub_8100720: @ 8100720
	push {lr}
	bl sub_8101C80
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8100720

	thumb_func_start sub_810072C
sub_810072C: @ 810072C
	push {r4,lr}
	ldr r4, _08100740 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0
	beq _08100744
	cmp r0, 0x1
	beq _08100754
	b _0810076A
	.align 2, 0
_08100740: .4byte gUnknown_203ACEC
_08100744:
	movs r0, 0x1
	movs r1, 0x2
	bl sub_81019B0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100754:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _0810076A
	bl sub_8101C80
	bl sub_810224C
	movs r0, 0
	b _0810076C
_0810076A:
	movs r0, 0x1
_0810076C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810072C

	thumb_func_start sub_8100774
sub_8100774: @ 8100774
	push {r4,lr}
	ldr r4, _0810078C @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _081007A8
	cmp r0, 0x1
	bgt _08100790
	cmp r0, 0
	beq _08100796
	b _081007C8
	.align 2, 0
_0810078C: .4byte gUnknown_203ACEC
_08100790:
	cmp r0, 0x2
	beq _081007C0
	b _081007C8
_08100796:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	bl sub_81019B0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081007A8:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _081007C8
	bl sub_810224C
	ldr r0, _081007C4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081007C0:
	movs r0, 0
	b _081007CA
	.align 2, 0
_081007C4: .4byte gUnknown_203ACEC
_081007C8:
	movs r0, 0x1
_081007CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100774

	thumb_func_start sub_81007D0
sub_81007D0: @ 81007D0
	push {lr}
	ldr r0, _081007E8 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x5
	bhi _08100888
	lsls r0, 2
	ldr r1, _081007EC @ =_081007F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081007E8: .4byte gUnknown_203ACEC
_081007EC: .4byte _081007F0
	.align 2, 0
_081007F0:
	.4byte _08100808
	.4byte _08100816
	.4byte _08100826
	.4byte _08100838
	.4byte _08100858
	.4byte _0810087E
_08100808:
	bl sub_8101C48
	bl sub_81020AC
	bl sub_81022B0
	b _08100848
_08100816:
	bl sub_81020D0
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	bl sub_81015BC
	b _08100848
_08100826:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	movs r0, 0x2
	bl sub_81015D4
	b _08100848
_08100838:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	movs r0, 0x2
	bl sub_81012E0
_08100848:
	ldr r0, _08100854 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100888
	.align 2, 0
_08100854: .4byte gUnknown_203ACEC
_08100858:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100888
	bl sub_8101E80
	movs r0, 0x1
	bl sub_81022E0
	bl sub_810224C
	bl sub_8102394
	ldr r0, _08100884 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810087E:
	movs r0, 0
	b _0810088A
	.align 2, 0
_08100884: .4byte gUnknown_203ACEC
_08100888:
	movs r0, 0x1
_0810088A:
	pop {r1}
	bx r1
	thumb_func_end sub_81007D0

	thumb_func_start sub_8100890
sub_8100890: @ 8100890
	push {lr}
	ldr r0, _081008A8 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x5
	bhi _08100934
	lsls r0, 2
	ldr r1, _081008AC @ =_081008B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081008A8: .4byte gUnknown_203ACEC
_081008AC: .4byte _081008B0
	.align 2, 0
_081008B0:
	.4byte _081008C8
	.4byte _081008CE
	.4byte _081008E0
	.4byte _081008F2
	.4byte _08100914
	.4byte _0810092C
_081008C8:
	bl sub_8100FDC
	b _08100902
_081008CE:
	bl sub_8101F80
	bl sub_81022B0
	bl sub_81023F8
	bl sub_81015BC
	b _08100902
_081008E0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100934
	movs r0, 0x3
	bl sub_81015D4
	b _08100902
_081008F2:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _08100934
	movs r0, 0
	bl ShowBg
_08100902:
	ldr r0, _08100910 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100934
	.align 2, 0
_08100910: .4byte gUnknown_203ACEC
_08100914:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100934
	bl sub_8101BA8
	ldr r0, _08100930 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0810092C:
	movs r0, 0
	b _08100936
	.align 2, 0
_08100930: .4byte gUnknown_203ACEC
_08100934:
	movs r0, 0x1
_08100936:
	pop {r1}
	bx r1
	thumb_func_end sub_8100890

	thumb_func_start sub_810093C
sub_810093C: @ 810093C
	push {lr}
	ldr r0, _08100954 @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _081009F0
	lsls r0, 2
	ldr r1, _08100958 @ =_0810095C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08100954: .4byte gUnknown_203ACEC
_08100958: .4byte _0810095C
	.align 2, 0
_0810095C:
	.4byte _08100970
	.4byte _08100982
	.4byte _08100994
	.4byte _081009A4
	.4byte _081009C4
_08100970:
	bl sub_8101F80
	bl sub_81022B0
	bl sub_81023F8
	bl sub_81015BC
	b _081009B2
_08100982:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	movs r0, 0x4
	bl sub_81015D4
	b _081009B2
_08100994:
	bl sub_81016AC
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	bl sub_810131C
	b _081009B2
_081009A4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	bl sub_8101FAC
_081009B2:
	ldr r0, _081009C0 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081009F0
	.align 2, 0
_081009C0: .4byte gUnknown_203ACEC
_081009C4:
	bl sub_8102018
	lsls r0, 24
	cmp r0, 0
	bne _081009F0
	bl sub_8101BC0
	movs r0, 0
	bl sub_81022E0
	bl sub_810224C
	ldr r0, _081009EC @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _081009F2
	.align 2, 0
_081009EC: .4byte gUnknown_203ACEC
_081009F0:
	movs r0, 0x1
_081009F2:
	pop {r1}
	bx r1
	thumb_func_end sub_810093C

	thumb_func_start sub_81009F8
sub_81009F8: @ 81009F8
	push {lr}
	bl sub_8101F04
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_81009F8

	thumb_func_start sub_8100A04
sub_8100A04: @ 8100A04
	push {r4,lr}
	ldr r4, _08100A1C @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100A30
	cmp r0, 0x1
	bgt _08100A20
	cmp r0, 0
	beq _08100A2A
	b _08100A6E
	.align 2, 0
_08100A1C: .4byte gUnknown_203ACEC
_08100A20:
	cmp r0, 0x2
	beq _08100A4C
	cmp r0, 0x3
	beq _08100A6A
	b _08100A6E
_08100A2A:
	bl sub_81013EC
	b _08100A42
_08100A30:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100A6E
	movs r0, 0x1
	movs r1, 0x2
	bl sub_81019B0
_08100A42:
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100A6E
_08100A4C:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100A6E
	bl sub_8101F04
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100A6A:
	movs r0, 0
	b _08100A70
_08100A6E:
	movs r0, 0x1
_08100A70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100A04

	thumb_func_start sub_8100A78
sub_8100A78: @ 8100A78
	push {r4,lr}
	ldr r4, _08100A90 @ =gUnknown_203ACEC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100AA4
	cmp r0, 0x1
	bgt _08100A94
	cmp r0, 0
	beq _08100A9E
	b _08100AE0
	.align 2, 0
_08100A90: .4byte gUnknown_203ACEC
_08100A94:
	cmp r0, 0x2
	beq _08100AC2
	cmp r0, 0x3
	beq _08100ADC
	b _08100AE0
_08100A9E:
	bl sub_8101410
	b _08100AB8
_08100AA4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100AE0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	bl sub_81019B0
_08100AB8:
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100AE0
_08100AC2:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100AE0
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100ADC:
	movs r0, 0
	b _08100AE2
_08100AE0:
	movs r0, 0x1
_08100AE2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100A78

	thumb_func_start sub_8100AE8
sub_8100AE8: @ 8100AE8
	push {r4,r5,lr}
	ldr r5, _08100B00 @ =gUnknown_203ACEC
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100B14
	cmp r0, 0x1
	bgt _08100B04
	cmp r0, 0
	beq _08100B0E
	b _08100B66
	.align 2, 0
_08100B00: .4byte gUnknown_203ACEC
_08100B04:
	cmp r0, 0x2
	beq _08100B44
	cmp r0, 0x3
	beq _08100B62
	b _08100B66
_08100B0E:
	bl sub_8101434
	b _08100B3A
_08100B14:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100B66
	bl sub_80FFE48
	adds r4, r0, 0
	bl sub_8101A48
	lsls r4, 24
	lsrs r4, 24
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_81019B0
_08100B3A:
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100B66
_08100B44:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100B66
	bl sub_8101F04
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100B62:
	movs r0, 0
	b _08100B68
_08100B66:
	movs r0, 0x1
_08100B68:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8100AE8

	thumb_func_start sub_8100B70
sub_8100B70: @ 8100B70
	push {r4,r5,lr}
	ldr r5, _08100B88 @ =gUnknown_203ACEC
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08100B9C
	cmp r0, 0x1
	bgt _08100B8C
	cmp r0, 0
	beq _08100B96
	b _08100BEA
	.align 2, 0
_08100B88: .4byte gUnknown_203ACEC
_08100B8C:
	cmp r0, 0x2
	beq _08100BCC
	cmp r0, 0x3
	beq _08100BE6
	b _08100BEA
_08100B96:
	bl sub_8101478
	b _08100BC2
_08100B9C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08100BEA
	bl sub_80FFE48
	adds r4, r0, 0
	bl sub_8101A48
	lsls r4, 24
	lsrs r4, 24
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_81019B0
_08100BC2:
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08100BEA
_08100BCC:
	bl sub_8101A10
	lsls r0, 24
	cmp r0, 0
	bne _08100BEA
	bl sub_810224C
	bl sub_8102394
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08100BE6:
	movs r0, 0
	b _08100BEC
_08100BEA:
	movs r0, 0x1
_08100BEC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8100B70

	thumb_func_start sub_8100BF4
sub_8100BF4: @ 8100BF4
	push {r4,lr}
	ldr r4, _08100C50 @ =gUnknown_203ACEC
	movs r0, 0x98
	lsls r0, 5
	bl Alloc
	adds r2, r0, 0
	str r2, [r4]
	cmp r2, 0
	beq _08100C54
	movs r1, 0
	strh r1, [r2]
	movs r3, 0xB6
	lsls r3, 2
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	str r1, [r0]
	movs r0, 0x1
	b _08100C56
	.align 2, 0
_08100C50: .4byte gUnknown_203ACEC
_08100C54:
	movs r0, 0
_08100C56:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8100BF4

	thumb_func_start sub_8100C5C
sub_8100C5C: @ 8100C5C
	push {lr}
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r1, 0xC1
	lsls r1, 6
	movs r0, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_8100C5C

	thumb_func_start sub_8100CBC
sub_8100CBC: @ 8100CBC
	push {r4,lr}
	bl ResetPaletteFade
	ldr r0, _08100D10 @ =gUnknown_8E99D8C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08100D14 @ =gUnknown_843F76C
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08100D18 @ =gUnknown_843F78C
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08100D1C @ =gUnknown_843F874
	movs r1, 0xA0
	movs r2, 0x8
	bl LoadPalette
	ldr r4, _08100D20 @ =gUnknown_843F87C
	adds r0, r4, 0
	movs r1, 0xB0
	movs r2, 0xA
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0xA
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100D10: .4byte gUnknown_8E99D8C
_08100D14: .4byte gUnknown_843F76C
_08100D18: .4byte gUnknown_843F78C
_08100D1C: .4byte gUnknown_843F874
_08100D20: .4byte gUnknown_843F87C
	thumb_func_end sub_8100CBC

	thumb_func_start sub_8100D24
sub_8100D24: @ 8100D24
	push {r4,r5,lr}
	sub sp, 0x14
	bl GetTitleText
	adds r5, r0, 0
	cmp r5, 0
	beq _08100D7A
	movs r0, 0x1
	adds r1, r5, 0
	movs r2, 0
	bl GetStringWidth
	movs r4, 0x80
	subs r4, r0
	lsrs r4, 1
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	movs r0, 0x3
	str r0, [sp, 0x10]
	movs r0, 0
	movs r1, 0x1
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8100DC4
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
_08100D7A:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8100D24

	thumb_func_start sub_8100D84
sub_8100D84: @ 8100D84
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r2, 0
	ldr r2, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r0, r2, 24
	lsls r4, 24
	lsrs r4, 24
	cmp r1, 0x1
	bne _08100DAC
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
_08100DAC:
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, [sp, 0x24]
	str r0, [sp, 0x8]
	adds r0, r5, 0
	adds r2, r6, 0
	bl AddTextPrinterParameterized
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8100D84

	thumb_func_start sub_8100DC4
sub_8100DC4: @ 8100DC4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	mov r9, r2
	ldr r2, [sp, 0x2C]
	ldr r4, [sp, 0x30]
	ldr r5, [sp, 0x34]
	ldr r6, [sp, 0x38]
	ldr r7, [sp, 0x3C]
	mov r8, r7
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r2, 24
	lsrs r3, r2, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r1, 0x1
	bne _08100E0A
	adds r0, r3, 0x2
	lsls r0, 24
	lsrs r3, r0, 24
_08100E0A:
	add r0, sp, 0xC
	strb r5, [r0]
	strb r6, [r0, 0x1]
	strb r2, [r0, 0x2]
	str r0, [sp]
	lsls r0, r4, 24
	asrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r9
	str r0, [sp, 0x8]
	mov r0, r12
	adds r2, r7, 0
	bl AddTextPrinterParameterized3
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8100DC4

	thumb_func_start sub_8100E34
sub_8100E34: @ 8100E34
	push {lr}
	sub sp, 0xC
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xE0
	bl TextWindow_SetUserSelectedFrame
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0xE
	bl DrawTextBorderOuter
	movs r0, 0
	bl sub_8100E7C
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_8100E34

	thumb_func_start sub_8100E7C
sub_8100E7C: @ 8100E7C
	push {lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	movs r0, 0
	str r0, [sp, 0x10]
	str r0, [sp, 0xC]
	cmp r1, 0x1
	beq _08100EC2
	cmp r1, 0x1
	bgt _08100E9A
	cmp r1, 0
	beq _08100EA4
	b _08100ECA
_08100E9A:
	cmp r2, 0x2
	beq _08100EAE
	cmp r2, 0x3
	beq _08100EB8
	b _08100ECA
_08100EA4:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl GetEasyChatInstructionsText
	b _08100ECA
_08100EAE:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl sub_80FFDC8
	b _08100ECA
_08100EB8:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl GetEasyChatConfirmText
	b _08100ECA
_08100EC2:
	add r1, sp, 0x10
	add r0, sp, 0xC
	bl GetEasyChatConfirmDeletionText
_08100ECA:
	movs r0, 0x1
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, [sp, 0xC]
	cmp r2, 0
	beq _08100EEC
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
_08100EEC:
	ldr r2, [sp, 0x10]
	cmp r2, 0
	beq _08100F08
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
_08100F08:
	movs r0, 0x1
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r0}
	bx r0
	thumb_func_end sub_8100E7C

	thumb_func_start sub_8100F18
sub_8100F18: @ 8100F18
	push {lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08100F40 @ =gUnknown_843F8D0
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r2, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08100F40: .4byte gUnknown_843F8D0
	thumb_func_end sub_8100F18

	thumb_func_start sub_8100F44
sub_8100F44: @ 8100F44
	push {r4,r5,lr}
	sub sp, 0x8
	bl GetEasyChatScreenFrameId
	lsls r0, 24
	ldr r5, _08100FC0 @ =0xffffff00
	ldr r3, [sp]
	ands r3, r5
	movs r1, 0x3
	orrs r3, r1
	str r3, [sp]
	ldr r1, _08100FC4 @ =gUnknown_843F888
	lsrs r0, 22
	adds r0, r1
	ldrb r2, [r0]
	lsls r2, 8
	ldr r4, _08100FC8 @ =0xffff00ff
	adds r1, r4, 0
	ands r1, r3
	orrs r1, r2
	str r1, [sp]
	ldrb r2, [r0, 0x1]
	lsls r2, 16
	ldr r3, _08100FCC @ =0xff00ffff
	ands r3, r1
	orrs r3, r2
	str r3, [sp]
	ldrb r2, [r0, 0x2]
	lsls r2, 24
	ldr r1, _08100FD0 @ =0x00ffffff
	ands r1, r3
	orrs r1, r2
	str r1, [sp]
	ldrb r1, [r0, 0x3]
	ldr r0, [sp, 0x4]
	ands r0, r5
	orrs r0, r1
	ands r0, r4
	movs r1, 0xB0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _08100FD4 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 15
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl AddWindow
	ldr r1, _08100FD8 @ =gUnknown_203ACEC
	ldr r1, [r1]
	strh r0, [r1, 0x2]
	lsls r0, 24
	lsrs r0, 24
	bl PutWindowTilemap
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100FC0: .4byte 0xffffff00
_08100FC4: .4byte gUnknown_843F888
_08100FC8: .4byte 0xffff00ff
_08100FCC: .4byte 0xff00ffff
_08100FD0: .4byte 0x00ffffff
_08100FD4: .4byte 0x0000ffff
_08100FD8: .4byte gUnknown_203ACEC
	thumb_func_end sub_8100F44

	thumb_func_start sub_8100FDC
sub_8100FDC: @ 8100FDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	bl GetEasyChatWordBuffer
	adds r4, r0, 0
	bl GetNumColumns
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl GetNumRows
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	bl GetEasyChatScreenFrameId
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	ldr r0, _0810101C @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r6, 0
	b _081010D6
	.align 2, 0
_0810101C: .4byte gUnknown_203ACEC
_08101020:
	ldr r0, _0810105C @ =gUnknown_203ACEC
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0xA
	movs r0, 0xFF
	strb r0, [r1, 0xA]
	adds r0, r2, 0
	ldr r1, _08101060 @ =gUnknown_843F8DB
	bl StringAppend
	adds r2, r0, 0
	movs r5, 0
	lsls r7, r6, 28
	adds r0, r6, 0x1
	mov r9, r0
	cmp r5, r8
	bge _081010B4
	ldr r0, _08101064 @ =0x0000ffff
	mov r10, r0
_08101046:
	ldrh r0, [r4]
	cmp r0, r10
	beq _08101068
	adds r1, r0, 0
	adds r0, r2, 0
	bl CopyEasyChatWord
	adds r2, r0, 0
	adds r4, 0x2
	b _08101096
	.align 2, 0
_0810105C: .4byte gUnknown_203ACEC
_08101060: .4byte gUnknown_843F8DB
_08101064: .4byte 0x0000ffff
_08101068:
	adds r0, r2, 0
	movs r1, 0
	movs r2, 0x4
	bl WriteColorChangeControlCode
	adds r2, r0, 0
	adds r4, 0x2
	movs r3, 0xF9
	movs r1, 0x9
	movs r0, 0x6
_0810107C:
	strb r3, [r2]
	adds r2, 0x1
	strb r1, [r2]
	adds r2, 0x1
	subs r0, 0x1
	cmp r0, 0
	bge _0810107C
	adds r0, r2, 0
	movs r1, 0
	movs r2, 0x2
	bl WriteColorChangeControlCode
	adds r2, r0, 0
_08101096:
	adds r0, r2, 0
	ldr r1, _081010F8 @ =gUnknown_843F8DB
	bl StringAppend
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	cmp r0, 0x2
	bne _081010AE
	cmp r5, 0
	bne _081010AE
	cmp r6, 0x4
	beq _081010B4
_081010AE:
	adds r5, 0x1
	cmp r5, r8
	blt _08101046
_081010B4:
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _081010FC @ =gUnknown_203ACEC
	ldr r2, [r0]
	ldrb r0, [r2, 0x2]
	adds r2, 0xA
	lsrs r1, r7, 24
	str r1, [sp]
	movs r1, 0xFF
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
	mov r6, r9
_081010D6:
	ldr r0, [sp, 0xC]
	cmp r6, r0
	blt _08101020
	ldr r0, _081010FC @ =gUnknown_203ACEC
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081010F8: .4byte gUnknown_843F8DB
_081010FC: .4byte gUnknown_203ACEC
	thumb_func_end sub_8100FDC

	thumb_func_start sub_8101100
sub_8101100: @ 8101100
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	bl GetEasyChatScreenFrameId
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	str r0, [sp]
	ldr r2, _08101194 @ =0x01000200
	mov r0, sp
	mov r1, r8
	bl CpuFastSet
	cmp r5, 0x2
	bne _081011A4
	ldr r0, _08101198 @ =gUnknown_843F888
	adds r1, r0, 0
	adds r1, 0x8
	ldrb r5, [r0, 0x8]
	ldrb r0, [r1, 0x2]
	adds r4, r5, r0
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	adds r0, r2
	mov r12, r0
	adds r7, r2, 0
	cmp r7, r12
	blt _08101144
	b _08101296
_08101144:
	adds r3, r5, 0
	lsls r0, r3, 1
	mov r9, r0
_0810114A:
	subs r6, r3, 0x1
	lsls r0, r7, 5
	adds r1, r0, r6
	lsls r1, 1
	add r1, r8
	ldr r5, _0810119C @ =0x00001005
	adds r2, r5, 0
	strh r2, [r1]
	adds r6, r3, 0
	adds r5, r0, 0
	adds r2, r7, 0x1
	cmp r6, r4
	bge _0810117E
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0, 0
	lsls r0, r7, 6
	add r0, r8
	add r0, r9
	subs r6, r4, r6
_08101172:
	strh r1, [r0]
	adds r0, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _08101172
	adds r6, r4, 0
_0810117E:
	adds r0, r5, r6
	lsls r0, 1
	add r0, r8
	ldr r5, _081011A0 @ =0x00001007
	adds r1, r5, 0
	strh r1, [r0]
	adds r7, r2, 0
	cmp r7, r12
	blt _0810114A
	b _08101296
	.align 2, 0
_08101194: .4byte 0x01000200
_08101198: .4byte gUnknown_843F888
_0810119C: .4byte 0x00001005
_081011A0: .4byte 0x00001007
_081011A4:
	ldr r6, _081012A8 @ =gUnknown_843F888
	mov r9, r6
	lsls r5, 2
	adds r1, r5, r6
	ldrb r3, [r1, 0x1]
	subs r7, r3, 0x1
	ldrb r2, [r1]
	subs r6, r2, 0x1
	ldrb r0, [r1, 0x2]
	adds r4, r2, r0
	ldrb r0, [r1, 0x3]
	adds r3, r0
	mov r12, r3
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r3, _081012AC @ =0x00001001
	adds r1, r3, 0
	strh r1, [r0]
	adds r6, r2, 0
	mov r10, r9
	mov r9, r5
	cmp r6, r4
	bge _081011F0
	ldr r5, _081012B0 @ =0x00001002
	adds r2, r5, 0
	lsls r1, r6, 1
	lsls r0, r7, 6
	add r0, r8
	adds r1, r0
	subs r6, r4, r6
_081011E4:
	strh r2, [r1]
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _081011E4
	adds r6, r4, 0
_081011F0:
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r6, _081012B4 @ =0x00001003
	adds r1, r6, 0
	strh r1, [r0]
	adds r7, 0x1
	cmp r7, r12
	bge _08101252
	ldr r0, _081012A8 @ =gUnknown_843F888
	add r0, r9
	ldrb r3, [r0]
	lsls r5, r3, 1
_0810120C:
	subs r6, r3, 0x1
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r2, _081012B8 @ =0x00001005
	adds r1, r2, 0
	strh r1, [r0]
	adds r6, r3, 0
	adds r2, r7, 0x1
	cmp r6, r4
	bge _0810123E
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0, 0
	lsls r0, r7, 6
	add r0, r8
	adds r0, r5, r0
	subs r6, r4, r6
_08101232:
	strh r1, [r0]
	adds r0, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _08101232
	adds r6, r4, 0
_0810123E:
	lsls r0, r7, 5
	adds r0, r6
	lsls r0, 1
	add r0, r8
	ldr r6, _081012BC @ =0x00001007
	adds r1, r6, 0
	strh r1, [r0]
	adds r7, r2, 0
	cmp r7, r12
	blt _0810120C
_08101252:
	mov r0, r9
	add r0, r10
	ldrb r3, [r0]
	subs r6, r3, 0x1
	lsls r2, r7, 5
	adds r0, r2, r6
	lsls r0, 1
	add r0, r8
	ldr r5, _081012C0 @ =0x00001009
	adds r1, r5, 0
	strh r1, [r0]
	adds r6, r3, 0
	adds r5, r2, 0
	cmp r6, r4
	bge _0810128A
	ldr r0, _081012C4 @ =0x0000100a
	adds r2, r0, 0
	lsls r1, r6, 1
	lsls r0, r7, 6
	add r0, r8
	adds r0, r1, r0
	subs r6, r4, r6
_0810127E:
	strh r2, [r0]
	adds r0, 0x2
	subs r6, 0x1
	cmp r6, 0
	bne _0810127E
	adds r6, r4, 0
_0810128A:
	adds r0, r5, r6
	lsls r0, 1
	add r0, r8
	ldr r2, _081012C8 @ =0x0000100b
	adds r1, r2, 0
	strh r1, [r0]
_08101296:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081012A8: .4byte gUnknown_843F888
_081012AC: .4byte 0x00001001
_081012B0: .4byte 0x00001002
_081012B4: .4byte 0x00001003
_081012B8: .4byte 0x00001005
_081012BC: .4byte 0x00001007
_081012C0: .4byte 0x00001009
_081012C4: .4byte 0x0000100a
_081012C8: .4byte 0x0000100b
	thumb_func_end sub_8101100

	thumb_func_start sub_81012CC
sub_81012CC: @ 81012CC
	push {lr}
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	pop {r0}
	bx r0
	thumb_func_end sub_81012CC

	thumb_func_start sub_81012E0
sub_81012E0: @ 81012E0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_810198C
	movs r0, 0x2
	movs r1, 0x11
	bl FillWindowPixelBuffer
	cmp r4, 0x1
	beq _08101304
	cmp r4, 0x1
	bcc _081012FE
	cmp r4, 0x2
	beq _0810130A
	b _0810130E
_081012FE:
	bl sub_810133C
	b _0810130E
_08101304:
	bl sub_81013A0
	b _0810130E
_0810130A:
	bl sub_81013DC
_0810130E:
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81012E0

	thumb_func_start sub_810131C
sub_810131C: @ 810131C
	push {lr}
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08101330
	movs r0, 0
	bl sub_81012E0
	b _08101336
_08101330:
	movs r0, 0x1
	bl sub_81012E0
_08101336:
	pop {r0}
	bx r0
	thumb_func_end sub_810131C

	thumb_func_start sub_810133C
sub_810133C: @ 810133C
	push {r4-r7,lr}
	sub sp, 0xC
	movs r5, 0
	movs r7, 0x60
_08101344:
	movs r4, 0
	lsls r0, r7, 24
	lsrs r6, r0, 24
_0810134A:
	lsls r0, r5, 24
	lsrs r0, 24
	adds r5, 0x1
	bl GetSelectedGroupByIndex
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x16
	beq _0810138A
	bl GetEasyChatWordGroupName
	adds r2, r0, 0
	movs r0, 0x54
	adds r3, r4, 0
	muls r3, r0
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	str r6, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8100D84
	adds r4, 0x1
	cmp r4, 0x1
	ble _0810134A
	adds r7, 0x10
	b _08101344
_0810138A:
	bl sub_80FFE28
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_81019B0
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810133C

	thumb_func_start sub_81013A0
sub_81013A0: @ 81013A0
	push {r4-r6,lr}
	sub sp, 0xC
	movs r5, 0
	movs r4, 0xC0
	lsls r4, 23
	ldr r6, _081013D8 @ =gUnknown_843F8E0
_081013AC:
	ldm r6!, {r2}
	lsrs r0, r4, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x1
	movs r3, 0xA
	bl sub_8100D84
	movs r0, 0x80
	lsls r0, 21
	adds r4, r0
	adds r5, 0x1
	cmp r5, 0x3
	bls _081013AC
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081013D8: .4byte gUnknown_843F8E0
	thumb_func_end sub_81013A0

	thumb_func_start sub_81013DC
sub_81013DC: @ 81013DC
	push {lr}
	movs r0, 0
	movs r1, 0x4
	bl sub_81014AC
	pop {r0}
	bx r0
	thumb_func_end sub_81013DC

	thumb_func_start sub_81013EC
sub_81013EC: @ 81013EC
	push {r4,lr}
	bl sub_80FFE48
	adds r4, r0, 0
	adds r4, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8101558
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81014AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81013EC

	thumb_func_start sub_8101410
sub_8101410: @ 8101410
	push {r4,lr}
	bl sub_80FFE48
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8101558
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81014AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101410

	thumb_func_start sub_8101434
sub_8101434: @ 8101434
	push {r4,r5,lr}
	bl sub_80FFE48
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	adds r0, r5, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80FFE54
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bls _08101456
	adds r4, r0, 0
_08101456:
	cmp r5, r4
	bcs _08101470
	subs r4, r5
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8101558
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81014AC
_08101470:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101434

	thumb_func_start sub_8101478
sub_8101478: @ 8101478
	push {r4,r5,lr}
	bl sub_80FFE48
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8101A48
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _081014A4
	subs r4, r0, r5
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8101558
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81014AC
_081014A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101478

	thumb_func_start sub_81014AC
sub_81014AC: @ 81014AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r4, r0, 1
	lsls r0, 4
	adds r1, r0, 0
	adds r1, 0x60
	movs r0, 0xFF
	ands r1, r0
	movs r0, 0
	cmp r0, r10
	bge _08101538
	ldr r2, _08101550 @ =gUnknown_203ACEC
	mov r9, r2
_081014D8:
	movs r5, 0
	movs r2, 0x10
	adds r2, r1
	mov r8, r2
	adds r7, r0, 0x1
	lsls r0, r1, 24
	lsrs r6, r0, 24
_081014E6:
	lsls r0, r4, 16
	lsrs r0, 16
	adds r4, 0x1
	bl GetDisplayedWordByIndex
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08101554 @ =0x0000ffff
	cmp r1, r0
	beq _0810152A
	mov r2, r9
	ldr r0, [r2]
	adds r0, 0xCB
	movs r2, 0
	bl CopyEasyChatWordPadded
	mov r0, r9
	ldr r2, [r0]
	adds r2, 0xCB
	movs r0, 0xD
	adds r3, r5, 0
	muls r3, r0
	adds r3, 0x3
	lsls r3, 27
	lsrs r3, 24
	str r6, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8100D84
_0810152A:
	adds r5, 0x1
	cmp r5, 0x1
	ble _081014E6
	mov r1, r8
	adds r0, r7, 0
	cmp r0, r10
	blt _081014D8
_08101538:
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101550: .4byte gUnknown_203ACEC
_08101554: .4byte 0x0000ffff
	thumb_func_end sub_81014AC

	thumb_func_start sub_8101558
sub_8101558: @ 8101558
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r0, 20
	adds r3, r0, 0
	adds r3, 0x60
	movs r0, 0xFF
	ands r3, r0
	lsrs r0, r1, 20
	adds r1, r3, r0
	cmp r1, 0xFF
	ble _08101584
	ldr r0, _08101580 @ =0xffffff00
	adds r4, r1, r0
	movs r0, 0x80
	lsls r0, 1
	subs r0, r3
	b _08101586
	.align 2, 0
_08101580: .4byte 0xffffff00
_08101584:
	movs r4, 0
_08101586:
	movs r5, 0xE0
	str r5, [sp]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x11
	movs r2, 0
	bl FillWindowPixelRect
	cmp r4, 0
	beq _081015B2
	str r5, [sp]
	lsls r0, r4, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0x11
	movs r2, 0
	movs r3, 0
	bl FillWindowPixelRect
_081015B2:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101558

	thumb_func_start sub_81015BC
sub_81015BC: @ 81015BC
	push {lr}
	movs r0, 0x2
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0x2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_81015BC

	thumb_func_start sub_81015D4
sub_81015D4: @ 81015D4
	push {lr}
	ldr r1, _081015E8 @ =gUnknown_203ACEC
	cmp r0, 0x6
	bhi _0810168E
	lsls r0, 2
	ldr r1, _081015EC @ =_081015F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081015E8: .4byte gUnknown_203ACEC
_081015EC: .4byte _081015F0
	.align 2, 0
_081015F0:
	.4byte _0810160C
	.4byte _08101620
	.4byte _08101630
	.4byte _08101644
	.4byte _08101658
	.4byte _0810166C
	.4byte _08101680
_0810160C:
	ldr r1, _0810161C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0xA
	b _0810168C
	.align 2, 0
_0810161C: .4byte gUnknown_203ACEC
_08101620:
	ldr r1, _0810162C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x9
	b _0810164C
	.align 2, 0
_0810162C: .4byte gUnknown_203ACEC
_08101630:
	ldr r1, _08101640 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0xB
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0x11
	b _0810168C
	.align 2, 0
_08101640: .4byte gUnknown_203ACEC
_08101644:
	ldr r1, _08101654 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x11
_0810164C:
	strb r0, [r2, 0x6]
	ldr r0, [r1]
	strb r3, [r0, 0x7]
	b _0810168E
	.align 2, 0
_08101654: .4byte gUnknown_203ACEC
_08101658:
	ldr r1, _08101668 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0x11
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0xA
	b _0810168C
	.align 2, 0
_08101668: .4byte gUnknown_203ACEC
_0810166C:
	ldr r1, _0810167C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0x12
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0x16
	b _0810168C
	.align 2, 0
_0810167C: .4byte gUnknown_203ACEC
_08101680:
	ldr r1, _081016A8 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r0, 0x16
	strb r0, [r2, 0x6]
	ldr r2, [r1]
	movs r0, 0x12
_0810168C:
	strb r0, [r2, 0x7]
_0810168E:
	ldr r1, [r1]
	ldrb r0, [r1, 0x6]
	movs r3, 0x1
	negs r3, r3
	adds r2, r3, 0
	ldrb r3, [r1, 0x7]
	cmp r0, r3
	bcs _081016A0
	movs r2, 0x1
_081016A0:
	strb r2, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_081016A8: .4byte gUnknown_203ACEC
	thumb_func_end sub_81015D4

	thumb_func_start sub_81016AC
sub_81016AC: @ 81016AC
	push {r4,lr}
	ldr r4, _081016D8 @ =gUnknown_203ACEC
	ldr r1, [r4]
	ldrb r2, [r1, 0x6]
	ldrb r0, [r1, 0x7]
	cmp r2, r0
	beq _081016DC
	ldrb r0, [r1, 0x8]
	adds r0, r2, r0
	strb r0, [r1, 0x6]
	ldr r0, [r4]
	ldrb r0, [r0, 0x6]
	bl sub_81016E4
	ldr r0, [r4]
	ldrb r1, [r0, 0x6]
	ldrb r0, [r0, 0x7]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	b _081016DE
	.align 2, 0
_081016D8: .4byte gUnknown_203ACEC
_081016DC:
	movs r0, 0
_081016DE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81016AC

	thumb_func_start sub_81016E4
sub_81016E4: @ 81016E4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1E
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0xA
	bl FillBgTilemapBufferRect_Palette0
	cmp r4, 0x16
	bls _08101706
	b _08101822
_08101706:
	lsls r0, r4, 2
	ldr r1, _08101710 @ =_08101714
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08101710: .4byte _08101714
	.align 2, 0
_08101714:
	.4byte _08101822
	.4byte _08101770
	.4byte _08101778
	.4byte _08101780
	.4byte _08101788
	.4byte _08101790
	.4byte _08101798
	.4byte _08101808
	.4byte _081017FA
	.4byte _081017EC
	.4byte _081017DE
	.4byte _081017A6
	.4byte _081017AE
	.4byte _081017B6
	.4byte _081017BE
	.4byte _081017C6
	.4byte _081017CE
	.4byte _081017D6
	.4byte _081017DE
	.4byte _081017EC
	.4byte _081017FA
	.4byte _08101808
	.4byte _08101816
_08101770:
	movs r0, 0xB
	movs r1, 0xE
	movs r2, 0x3
	b _0810179E
_08101778:
	movs r0, 0x9
	movs r1, 0xE
	movs r2, 0x7
	b _0810179E
_08101780:
	movs r0, 0x7
	movs r1, 0xE
	movs r2, 0xB
	b _0810179E
_08101788:
	movs r0, 0x5
	movs r1, 0xE
	movs r2, 0xF
	b _0810179E
_08101790:
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x13
	b _0810179E
_08101798:
	movs r0, 0x1
	movs r1, 0xE
	movs r2, 0x17
_0810179E:
	movs r3, 0x2
	bl sub_8101830
	b _08101822
_081017A6:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x18
	b _081017E4
_081017AE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x19
	b _081017E4
_081017B6:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1A
	b _081017E4
_081017BE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1B
	b _081017E4
_081017C6:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	b _081017E4
_081017CE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1D
	b _081017E4
_081017D6:
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x1E
	b _081017E4
_081017DE:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x17
_081017E4:
	movs r3, 0xA
	bl sub_8101830
	b _08101822
_081017EC:
	movs r0, 0x1
	movs r1, 0xB
	movs r2, 0x17
	movs r3, 0x8
	bl sub_8101830
	b _08101822
_081017FA:
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x17
	movs r3, 0x6
	bl sub_8101830
	b _08101822
_08101808:
	movs r0, 0x1
	movs r1, 0xD
	movs r2, 0x17
	movs r3, 0x4
	bl sub_8101830
	b _08101822
_08101816:
	movs r0, 0x1
	movs r1, 0xE
	movs r2, 0x17
	movs r3, 0x2
	bl sub_8101830
_08101822:
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81016E4

	thumb_func_start sub_8101830
sub_8101830: @ 8101830
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r12, r0
	adds r7, r1, 0
	mov r9, r2
	mov r10, r3
	ldr r0, _08101968 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 2
	adds r6, r0, r1
	mov r0, r12
	add r0, r9
	subs r5, r0, 0x1
	adds r0, r7, r3
	subs r0, 0x1
	mov r8, r0
	mov r2, r12
	adds r3, r7, 0
	lsls r0, r3, 5
	adds r0, r2
	lsls r0, 1
	adds r0, r6
	ldr r4, _0810196C @ =0x00004001
	adds r1, r4, 0
	strh r1, [r0]
	adds r2, 0x1
	cmp r2, r5
	bge _0810188C
	ldr r0, _08101970 @ =0x00004002
	adds r4, r0, 0
	lsls r1, r2, 1
	lsls r0, r3, 6
	adds r0, r6
	adds r1, r0
	subs r2, r5, r2
_08101880:
	strh r4, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _08101880
	adds r2, r5, 0
_0810188C:
	lsls r0, r3, 5
	adds r0, r2
	lsls r0, 1
	adds r0, r6
	ldr r2, _08101974 @ =0x00004003
	adds r1, r2, 0
	strh r1, [r0]
	adds r3, 0x1
	mov r4, r12
	adds r4, 0x1
	adds r0, r7, 0x1
	str r0, [sp, 0x4]
	mov r1, r9
	subs r1, 0x2
	str r1, [sp]
	movs r2, 0x2
	negs r2, r2
	add r10, r2
	cmp r3, r8
	bge _081018FC
	lsls r7, r4, 1
	mov r9, r7
_081018B8:
	lsls r0, r3, 5
	add r0, r12
	lsls r0, 1
	adds r0, r6
	ldr r2, _08101978 @ =0x00004005
	adds r1, r2, 0
	strh r1, [r0]
	adds r2, r4, 0
	adds r7, r3, 0x1
	cmp r4, r5
	bge _081018E8
	movs r0, 0x80
	lsls r0, 7
	adds r1, r0, 0
	lsls r0, r3, 6
	adds r0, r6
	add r0, r9
	subs r2, r5, r4
_081018DC:
	strh r1, [r0]
	adds r0, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _081018DC
	adds r2, r5, 0
_081018E8:
	lsls r0, r3, 5
	adds r0, r2
	lsls r0, 1
	adds r0, r6
	ldr r2, _0810197C @ =0x00004007
	adds r1, r2, 0
	strh r1, [r0]
	adds r3, r7, 0
	cmp r3, r8
	blt _081018B8
_081018FC:
	lsls r0, r3, 5
	mov r7, r12
	adds r1, r0, r7
	lsls r1, 1
	adds r1, r6
	ldr r7, _08101980 @ =0x00004009
	adds r2, r7, 0
	strh r2, [r1]
	adds r2, r4, 0
	mov r12, r0
	cmp r4, r5
	bge _0810192E
	ldr r0, _08101984 @ =0x0000400a
	adds r7, r0, 0
	lsls r1, r4, 1
	lsls r0, r3, 6
	adds r0, r6
	adds r0, r1, r0
	subs r2, r5, r4
_08101922:
	strh r7, [r0]
	adds r0, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _08101922
	adds r2, r5, 0
_0810192E:
	mov r1, r12
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r6
	ldr r2, _08101988 @ =0x0000400b
	adds r1, r2, 0
	strh r1, [r0]
	lsls r0, r4, 27
	lsrs r0, 24
	ldr r3, [sp, 0x4]
	lsls r1, r3, 27
	lsrs r1, 24
	ldr r4, [sp]
	lsls r2, r4, 27
	lsrs r2, 24
	mov r7, r10
	lsls r3, r7, 27
	lsrs r3, 24
	bl sub_8101A5C
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101968: .4byte gUnknown_203ACEC
_0810196C: .4byte 0x00004001
_08101970: .4byte 0x00004002
_08101974: .4byte 0x00004003
_08101978: .4byte 0x00004005
_0810197C: .4byte 0x00004007
_08101980: .4byte 0x00004009
_08101984: .4byte 0x0000400a
_08101988: .4byte 0x0000400b
	thumb_func_end sub_8101830

	thumb_func_start sub_810198C
sub_810198C: @ 810198C
	push {lr}
	movs r1, 0x80
	lsls r1, 4
	movs r0, 0x2
	movs r2, 0
	bl ChangeBgY
	ldr r0, _081019AC @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB3
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_081019AC: .4byte gUnknown_203ACEC
	thumb_func_end sub_810198C

	thumb_func_start sub_81019B0
sub_81019B0: @ 81019B0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x2
	bl GetBgY
	adds r2, r0, 0
	ldr r0, _081019FC @ =gUnknown_203ACEC
	ldr r3, [r0]
	movs r0, 0xB3
	lsls r0, 2
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, r4
	strh r0, [r1]
	lsls r4, 20
	asrs r4, 16
	lsls r0, r4, 8
	adds r2, r0
	cmp r5, 0
	beq _08101A00
	movs r1, 0xB4
	lsls r1, 2
	adds r0, r3, r1
	str r2, [r0]
	movs r0, 0xB5
	lsls r0, 2
	adds r1, r3, r0
	lsls r0, r5, 8
	str r0, [r1]
	cmp r4, 0
	bge _08101A0A
	negs r0, r0
	str r0, [r1]
	b _08101A0A
	.align 2, 0
_081019FC: .4byte gUnknown_203ACEC
_08101A00:
	movs r0, 0x2
	adds r1, r2, 0
	movs r2, 0
	bl ChangeBgY
_08101A0A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81019B0

	thumb_func_start sub_8101A10
sub_8101A10: @ 8101A10
	push {lr}
	movs r0, 0x2
	bl GetBgY
	ldr r1, _08101A3C @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r3, 0xB4
	lsls r3, 2
	adds r1, r2, r3
	ldr r1, [r1]
	cmp r0, r1
	beq _08101A40
	movs r1, 0xB5
	lsls r1, 2
	adds r0, r2, r1
	ldr r1, [r0]
	movs r0, 0x2
	movs r2, 0x1
	bl ChangeBgY
	movs r0, 0x1
	b _08101A42
	.align 2, 0
_08101A3C: .4byte gUnknown_203ACEC
_08101A40:
	movs r0, 0
_08101A42:
	pop {r1}
	bx r1
	thumb_func_end sub_8101A10

	thumb_func_start sub_8101A48
sub_8101A48: @ 8101A48
	ldr r0, _08101A58 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB3
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08101A58: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101A48

	thumb_func_start sub_8101A5C
sub_8101A5C: @ 8101A5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, r0, 8
	adds r0, r2
	orrs r4, r0
	lsls r5, r1, 8
	adds r1, r3
	orrs r5, r1
	movs r0, 0x40
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x44
	adds r1, r5, 0
	bl SetGpuReg
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8101A5C

	thumb_func_start sub_8101A90
sub_8101A90: @ 8101A90
	push {r4,r5,lr}
	ldr r0, _08101AB8 @ =gUnknown_843F8F0
	bl LoadSpriteSheets
	ldr r0, _08101ABC @ =gUnknown_843F910
	bl LoadSpritePalettes
	movs r5, 0
	ldr r4, _08101AC0 @ =gUnknown_843F938
_08101AA2:
	adds r0, r4, 0
	bl LoadCompressedSpriteSheet
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, 0x3
	bls _08101AA2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101AB8: .4byte gUnknown_843F8F0
_08101ABC: .4byte gUnknown_843F910
_08101AC0: .4byte gUnknown_843F938
	thumb_func_end sub_8101A90

	thumb_func_start sub_8101AC4
sub_8101AC4: @ 8101AC4
	push {lr}
	bl GetEasyChatScreenFrameId
	lsls r0, 24
	ldr r1, _08101B10 @ =gUnknown_843F888
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 19
	ldrb r2, [r0, 0x1]
	adds r2, 0x1
	lsls r2, 3
	adds r2, 0x1
	ldr r0, _08101B14 @ =gUnknown_843F968
	movs r3, 0xD0
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08101B18 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r1, 0xB6
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08101B1C @ =gSprites
	adds r1, r0
	str r1, [r2]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	pop {r0}
	bx r0
	.align 2, 0
_08101B10: .4byte gUnknown_843F888
_08101B14: .4byte gUnknown_843F968
_08101B18: .4byte gUnknown_203ACEC
_08101B1C: .4byte gSprites
	thumb_func_end sub_8101AC4

	thumb_func_start sub_8101B20
sub_8101B20: @ 8101B20
	push {lr}
	adds r1, r0, 0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08101B4E
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08101B4E
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _08101B4E
	ldr r0, _08101B54 @ =0x0000fffa
	strh r0, [r1, 0x24]
_08101B4E:
	pop {r0}
	bx r0
	.align 2, 0
_08101B54: .4byte 0x0000fffa
	thumb_func_end sub_8101B20

	thumb_func_start sub_8101B58
sub_8101B58: @ 8101B58
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08101B84 @ =gUnknown_203ACEC
	ldr r2, [r2]
	movs r3, 0xB6
	lsls r3, 2
	adds r2, r3
	ldr r3, [r2]
	movs r4, 0
	strh r0, [r3, 0x20]
	ldr r0, [r2]
	strh r1, [r0, 0x22]
	ldr r0, [r2]
	strh r4, [r0, 0x24]
	ldr r0, [r2]
	strh r4, [r0, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101B84: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101B58

	thumb_func_start sub_8101B88
sub_8101B88: @ 8101B88
	ldr r0, _08101BA4 @ =gUnknown_203ACEC
	ldr r1, [r0]
	movs r0, 0xB6
	lsls r0, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0
	strh r2, [r0, 0x2E]
	ldr r0, [r1]
	strh r2, [r0, 0x30]
	ldr r0, [r1]
	strh r2, [r0, 0x24]
	bx lr
	.align 2, 0
_08101BA4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101B88

	thumb_func_start sub_8101BA8
sub_8101BA8: @ 8101BA8
	ldr r0, _08101BBC @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB6
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	bx lr
	.align 2, 0
_08101BBC: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101BA8

	thumb_func_start sub_8101BC0
sub_8101BC0: @ 8101BC0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r6, _08101C38 @ =gUnknown_843F9B8
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08101C3C @ =gUnknown_203ACEC
	ldr r2, [r5]
	movs r1, 0xB7
	lsls r1, 2
	mov r8, r1
	add r2, r8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _08101C40 @ =gSprites
	adds r1, r4
	str r1, [r2]
	movs r0, 0x20
	strh r0, [r1, 0x24]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	movs r1, 0xB8
	lsls r1, 2
	adds r3, r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r3]
	ldr r0, _08101C44 @ =0x0000ffe0
	strh r0, [r1, 0x24]
	add r2, r8
	ldr r1, [r2]
	adds r1, 0x3F
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	bl sub_8101C80
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C38: .4byte gUnknown_843F9B8
_08101C3C: .4byte gUnknown_203ACEC
_08101C40: .4byte gSprites
_08101C44: .4byte 0x0000ffe0
	thumb_func_end sub_8101BC0

	thumb_func_start sub_8101C48
sub_8101C48: @ 8101C48
	push {r4-r6,lr}
	ldr r5, _08101C7C @ =gUnknown_203ACEC
	ldr r0, [r5]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	adds r4, r0, r4
	movs r6, 0
	str r6, [r4]
	movs r4, 0xB8
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	adds r0, r4
	str r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101C48

	thumb_func_start sub_8101C80
sub_8101C80: @ 8101C80
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08101CC8 @ =gUnknown_203ACEC
	ldr r1, [r0]
	movs r2, 0xB7
	lsls r2, 2
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08101CDC
	adds r2, 0x4
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08101CDC
	mov r4, sp
	adds r4, 0x1
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FFE08
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08101CCC
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	bl sub_8101CE4
	b _08101CDC
	.align 2, 0
_08101CC8: .4byte gUnknown_203ACEC
_08101CCC:
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	bl sub_8101D9C
_08101CDC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101C80

	thumb_func_start sub_8101CE4
sub_8101CE4: @ 8101CE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	asrs r5, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _08101D48
	ldr r0, _08101D44 @ =gUnknown_203ACEC
	mov r8, r0
	ldr r0, [r0]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r4
	ldr r2, [r4]
	movs r0, 0x54
	muls r5, r0
	adds r5, 0x3A
	strh r5, [r2, 0x20]
	ldr r0, [r4]
	lsls r4, r7, 24
	asrs r4, 20
	adds r4, 0x60
	strh r4, [r0, 0x22]
	movs r6, 0xB8
	lsls r6, 2
	adds r1, r6
	ldr r0, [r1]
	movs r1, 0
	bl StartSpriteAnim
	mov r1, r8
	ldr r0, [r1]
	adds r0, r6
	ldr r1, [r0]
	strh r5, [r1, 0x20]
	b _08101D8A
	.align 2, 0
_08101D44: .4byte gUnknown_203ACEC
_08101D48:
	ldr r6, _08101D98 @ =gUnknown_203ACEC
	ldr r0, [r6]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r6]
	adds r4, r1, r4
	ldr r0, [r4]
	movs r2, 0xD8
	mov r8, r2
	mov r2, r8
	strh r2, [r0, 0x20]
	ldr r0, [r4]
	lsls r4, r7, 24
	asrs r4, 20
	adds r4, 0x70
	strh r4, [r0, 0x22]
	movs r5, 0xB8
	lsls r5, 2
	adds r1, r5
	ldr r0, [r1]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldr r1, [r0]
	mov r2, r8
	strh r2, [r1, 0x20]
_08101D8A:
	ldr r0, [r0]
	strh r4, [r0, 0x22]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101D98: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101CE4

	thumb_func_start sub_8101D9C
sub_8101D9C: @ 8101D9C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsrs r4, r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _08101E2C
	lsls r0, r5, 24
	asrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, 0x60
	mov r8, r0
	movs r7, 0x20
	cmp r2, 0x6
	bne _08101DCE
	cmp r1, 0
	bne _08101DCE
	movs r7, 0x9D
	movs r6, 0x2
	b _08101DE4
_08101DCE:
	ldr r3, _08101E24 @ =gUnknown_843F958
	lsls r1, r4, 24
	lsrs r0, r1, 24
	movs r2, 0
	cmp r0, 0x6
	bhi _08101DDC
	asrs r2, r1, 24
_08101DDC:
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r7, r0
	movs r6, 0x3
_08101DE4:
	ldr r5, _08101E28 @ =gUnknown_203ACEC
	ldr r0, [r5]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	adds r1, r6, 0
	bl StartSpriteAnim
	ldr r1, [r5]
	adds r4, r1, r4
	ldr r0, [r4]
	strh r7, [r0, 0x20]
	ldr r0, [r4]
	mov r2, r8
	strh r2, [r0, 0x22]
	movs r4, 0xB8
	lsls r4, 2
	adds r1, r4
	ldr r0, [r1]
	adds r1, r6, 0
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, r4
	ldr r1, [r0]
	strh r7, [r1, 0x20]
	ldr r0, [r0]
	mov r1, r8
	strh r1, [r0, 0x22]
	b _08101E72
	.align 2, 0
_08101E24: .4byte gUnknown_843F958
_08101E28: .4byte gUnknown_203ACEC
_08101E2C:
	ldr r6, _08101E7C @ =gUnknown_203ACEC
	ldr r0, [r6]
	movs r4, 0xB7
	lsls r4, 2
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r6]
	adds r4, r1, r4
	ldr r0, [r4]
	movs r2, 0xD8
	mov r8, r2
	mov r2, r8
	strh r2, [r0, 0x20]
	ldr r0, [r4]
	lsls r4, r5, 24
	asrs r4, 20
	adds r4, 0x70
	strh r4, [r0, 0x22]
	movs r5, 0xB8
	lsls r5, 2
	adds r1, r5
	ldr r0, [r1]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldr r1, [r0]
	mov r2, r8
	strh r2, [r1, 0x20]
	ldr r0, [r0]
	strh r4, [r0, 0x22]
_08101E72:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101E7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101D9C

	thumb_func_start sub_8101E80
sub_8101E80: @ 8101E80
	push {lr}
	ldr r0, _08101EC4 @ =gUnknown_843F968
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08101EC8 @ =gUnknown_203ACEC
	ldr r2, [r1]
	movs r1, 0xB9
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08101ECC @ =gSprites
	adds r1, r0
	str r1, [r2]
	ldr r0, _08101ED0 @ =sub_8101ED4
	str r0, [r1, 0x1C]
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	bl sub_8101F04
	pop {r0}
	bx r0
	.align 2, 0
_08101EC4: .4byte gUnknown_843F968
_08101EC8: .4byte gUnknown_203ACEC
_08101ECC: .4byte gSprites
_08101ED0: .4byte sub_8101ED4
	thumb_func_end sub_8101E80

	thumb_func_start sub_8101ED4
sub_8101ED4: @ 8101ED4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08101EFA
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _08101EFA
	ldr r0, _08101F00 @ =0x0000fffa
	strh r0, [r1, 0x24]
_08101EFA:
	pop {r0}
	bx r0
	.align 2, 0
_08101F00: .4byte 0x0000fffa
	thumb_func_end sub_8101ED4

	thumb_func_start sub_8101F04
sub_8101F04: @ 8101F04
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x1
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FFE34
	mov r0, sp
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xD
	muls r0, r1
	adds r0, 0x3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r1, 25
	movs r2, 0xB0
	lsls r2, 20
	adds r1, r2
	lsrs r1, 24
	bl sub_8101F40
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101F04

	thumb_func_start sub_8101F40
sub_8101F40: @ 8101F40
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08101F7C @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xB9
	lsls r1, 2
	adds r3, r0, r1
	ldr r1, [r3]
	cmp r1, 0
	beq _08101F74
	lsls r0, r2, 3
	adds r0, 0x4
	movs r2, 0
	strh r0, [r1, 0x20]
	ldr r1, [r3]
	adds r0, r4, 0x1
	lsls r0, 3
	adds r0, 0x1
	strh r0, [r1, 0x22]
	ldr r0, [r3]
	strh r2, [r0, 0x24]
	ldr r0, [r3]
	strh r2, [r0, 0x2E]
_08101F74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101F7C: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101F40

	thumb_func_start sub_8101F80
sub_8101F80: @ 8101F80
	push {r4,lr}
	ldr r4, _08101FA8 @ =gUnknown_203ACEC
	ldr r0, [r4]
	movs r1, 0xB9
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08101FA2
	bl DestroySprite
	ldr r0, [r4]
	movs r1, 0xB9
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_08101FA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101FA8: .4byte gUnknown_203ACEC
	thumb_func_end sub_8101F80

	thumb_func_start sub_8101FAC
sub_8101FAC: @ 8101FAC
	push {r4-r6,lr}
	ldr r0, _08102004 @ =gUnknown_843FA40
	movs r1, 0xD0
	movs r2, 0x80
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08102008 @ =gUnknown_203ACEC
	ldr r2, [r5]
	movs r1, 0xBA
	lsls r1, 2
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _0810200C @ =gSprites
	adds r1, r4
	str r1, [r2]
	movs r6, 0
	ldr r0, _08102010 @ =0x0000ffc0
	strh r0, [r1, 0x24]
	ldr r0, _08102014 @ =gUnknown_843FA20
	movs r1, 0xD0
	movs r2, 0x50
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	movs r1, 0xBB
	lsls r1, 2
	adds r3, r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r3]
	strb r6, [r2, 0x9]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102004: .4byte gUnknown_843FA40
_08102008: .4byte gUnknown_203ACEC
_0810200C: .4byte gSprites
_08102010: .4byte 0x0000ffc0
_08102014: .4byte gUnknown_843FA20
	thumb_func_end sub_8101FAC

	thumb_func_start sub_8102018
sub_8102018: @ 8102018
	push {r4,lr}
	ldr r4, _0810202C @ =gUnknown_203ACEC
	ldr r2, [r4]
	ldrb r3, [r2, 0x9]
	cmp r3, 0
	beq _08102030
	cmp r3, 0x1
	beq _08102088
	movs r0, 0
	b _081020A6
	.align 2, 0
_0810202C: .4byte gUnknown_203ACEC
_08102030:
	movs r0, 0xBA
	lsls r0, 2
	adds r2, r0
	ldr r1, [r2]
	ldrh r0, [r1, 0x24]
	adds r0, 0x8
	strh r0, [r1, 0x24]
	ldr r2, [r2]
	movs r1, 0x24
	ldrsh r0, [r2, r1]
	cmp r0, 0
	blt _081020A4
	strh r3, [r2, 0x24]
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _08102066
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _08102076
_08102066:
	ldr r0, [r4]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
_08102076:
	ldr r0, _08102084 @ =gUnknown_203ACEC
	ldr r1, [r0]
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	b _081020A4
	.align 2, 0
_08102084: .4byte gUnknown_203ACEC
_08102088:
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081020A4
	movs r0, 0x2
	strb r0, [r2, 0x9]
	movs r0, 0
	b _081020A6
_081020A4:
	movs r0, 0x1
_081020A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8102018

	thumb_func_start sub_81020AC
sub_81020AC: @ 81020AC
	push {lr}
	ldr r2, _081020CC @ =gUnknown_203ACEC
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1, 0x9]
	ldr r0, [r2]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081020CC: .4byte gUnknown_203ACEC
	thumb_func_end sub_81020AC

	thumb_func_start sub_81020D0
sub_81020D0: @ 81020D0
	push {r4-r6,lr}
	ldr r5, _081020E4 @ =gUnknown_203ACEC
	ldr r3, [r5]
	ldrb r0, [r3, 0x9]
	cmp r0, 0
	beq _081020E8
	cmp r0, 0x1
	beq _08102102
	movs r0, 0
	b _08102154
	.align 2, 0
_081020E4: .4byte gUnknown_203ACEC
_081020E8:
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r3, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08102152
	movs r0, 0x1
	strb r0, [r3, 0x9]
	b _08102152
_08102102:
	movs r0, 0xBA
	lsls r0, 2
	adds r2, r3, r0
	ldr r1, [r2]
	ldrh r0, [r1, 0x24]
	subs r0, 0x8
	movs r6, 0
	strh r0, [r1, 0x24]
	ldr r0, [r2]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bgt _08102152
	movs r4, 0xBB
	lsls r4, 2
	adds r0, r3, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	movs r1, 0xBA
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	ldr r1, [r5]
	adds r4, r1, r4
	str r6, [r4]
	movs r2, 0xBA
	lsls r2, 2
	adds r0, r1, r2
	str r6, [r0]
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
	movs r0, 0
	b _08102154
_08102152:
	movs r0, 0x1
_08102154:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81020D0

	thumb_func_start sub_810215C
sub_810215C: @ 810215C
	push {lr}
	ldr r0, _08102174 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x4
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08102174: .4byte gUnknown_203ACEC
	thumb_func_end sub_810215C

	thumb_func_start sub_8102178
sub_8102178: @ 8102178
	push {lr}
	bl sub_80FFE1C
	lsls r0, 24
	cmp r0, 0
	bne _0810219C
	ldr r0, _08102198 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _081021AE
	.align 2, 0
_08102198: .4byte gUnknown_203ACEC
_0810219C:
	ldr r0, _081021B4 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
_081021AE:
	pop {r0}
	bx r0
	.align 2, 0
_081021B4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8102178

	thumb_func_start sub_81021B8
sub_81021B8: @ 81021B8
	ldr r0, _081021D0 @ =gUnknown_203ACEC
	ldr r0, [r0]
	movs r1, 0xBB
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	lsrs r1, 4
	movs r0, 0x1
	bics r0, r1
	bx lr
	.align 2, 0
_081021D0: .4byte gUnknown_203ACEC
	thumb_func_end sub_81021B8

	thumb_func_start sub_81021D4
sub_81021D4: @ 81021D4
	push {r4,lr}
	ldr r4, _08102240 @ =gUnknown_843FA98
	adds r0, r4, 0
	movs r1, 0x60
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08102202
	ldr r0, _08102244 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBC
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102248 @ =gSprites
	adds r0, r1
	str r0, [r2]
_08102202:
	adds r0, r4, 0
	movs r1, 0x60
	movs r2, 0x9C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08102236
	ldr r0, _08102244 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBD
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102248 @ =gSprites
	adds r0, r1
	str r0, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_08102236:
	bl sub_81022B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102240: .4byte gUnknown_843FA98
_08102244: .4byte gUnknown_203ACEC
_08102248: .4byte gSprites
	thumb_func_end sub_81021D4

	thumb_func_start sub_810224C
sub_810224C: @ 810224C
	push {r4-r6,lr}
	bl sub_80FFE64
	ldr r6, _081022AC @ =gUnknown_203ACEC
	ldr r1, [r6]
	movs r2, 0xBC
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _08102266
	movs r2, 0x1
_08102266:
	adds r3, r1, 0
	adds r3, 0x3E
	movs r4, 0x1
	lsls r2, 2
	ldrb r1, [r3]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_80FFE98
	ldr r1, [r6]
	movs r2, 0xBD
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _08102292
	movs r2, 0x1
_08102292:
	adds r3, r1, 0
	adds r3, 0x3E
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081022AC: .4byte gUnknown_203ACEC
	thumb_func_end sub_810224C

	thumb_func_start sub_81022B0
sub_81022B0: @ 81022B0
	ldr r3, _081022DC @ =gUnknown_203ACEC
	ldr r0, [r3]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xBD
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081022DC: .4byte gUnknown_203ACEC
	thumb_func_end sub_81022B0

	thumb_func_start sub_81022E0
sub_81022E0: @ 81022E0
	push {lr}
	cmp r0, 0
	bne _081022FC
	ldr r0, _081022F8 @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, 0x60
	b _0810230A
	.align 2, 0
_081022F8: .4byte gUnknown_203ACEC
_081022FC:
	ldr r0, _0810231C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r1, 0xBC
	lsls r1, 2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, 0x78
_0810230A:
	strh r1, [r0, 0x20]
	movs r3, 0xBD
	lsls r3, 2
	adds r0, r2, r3
	ldr r0, [r0]
	strh r1, [r0, 0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0810231C: .4byte gUnknown_203ACEC
	thumb_func_end sub_81022E0

	thumb_func_start sub_8102320
sub_8102320: @ 8102320
	push {r4,lr}
	ldr r4, _08102388 @ =gUnknown_843FA80
	adds r0, r4, 0
	movs r1, 0xDC
	movs r2, 0x54
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0810234E
	ldr r0, _0810238C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBE
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102390 @ =gSprites
	adds r0, r1
	str r0, [r2]
_0810234E:
	adds r0, r4, 0
	movs r1, 0xDC
	movs r2, 0x9C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0810237E
	ldr r0, _0810238C @ =gUnknown_203ACEC
	ldr r2, [r0]
	movs r0, 0xBF
	lsls r0, 2
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08102390 @ =gSprites
	adds r0, r1
	str r0, [r2]
	movs r1, 0x1
	bl StartSpriteAnim
_0810237E:
	bl sub_81023F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102388: .4byte gUnknown_843FA80
_0810238C: .4byte gUnknown_203ACEC
_08102390: .4byte gSprites
	thumb_func_end sub_8102320

	thumb_func_start sub_8102394
sub_8102394: @ 8102394
	push {r4-r6,lr}
	bl sub_80FFE64
	ldr r6, _081023F4 @ =gUnknown_203ACEC
	ldr r1, [r6]
	movs r2, 0xBE
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _081023AE
	movs r2, 0x1
_081023AE:
	adds r3, r1, 0
	adds r3, 0x3E
	movs r4, 0x1
	lsls r2, 2
	ldrb r1, [r3]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_80FFE98
	ldr r1, [r6]
	movs r2, 0xBF
	lsls r2, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	cmp r0, 0
	bne _081023DA
	movs r2, 0x1
_081023DA:
	adds r3, r1, 0
	adds r3, 0x3E
	adds r1, r4, 0
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081023F4: .4byte gUnknown_203ACEC
	thumb_func_end sub_8102394

	thumb_func_start sub_81023F8
sub_81023F8: @ 81023F8
	ldr r3, _08102424 @ =gUnknown_203ACEC
	ldr r0, [r3]
	movs r1, 0xBE
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xBF
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08102424: .4byte gUnknown_203ACEC
	thumb_func_end sub_81023F8

	thumb_func_start sub_8102428
sub_8102428: @ 8102428
	push {r4,lr}
	sub sp, 0x14
	ldr r3, _081024A8 @ =0xffffff00
	ldr r0, [sp, 0xC]
	ands r0, r3
	movs r1, 0x3
	orrs r0, r1
	ldr r2, _081024AC @ =0xffff00ff
	ands r0, r2
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	ldr r1, _081024B0 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xB0
	lsls r1, 12
	orrs r0, r1
	ldr r1, _081024B4 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 21
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	ands r0, r3
	movs r1, 0x2
	orrs r0, r1
	ands r0, r2
	movs r1, 0xB0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _081024B8 @ =0x0000ffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 14
	orrs r0, r1
	str r0, [sp, 0x10]
	add r0, sp, 0xC
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _081024BC @ =gUnknown_841EE2B
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x1
	movs r3, 0
	bl sub_8100D84
	adds r0, r4, 0
	bl PutWindowTilemap
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081024A8: .4byte 0xffffff00
_081024AC: .4byte 0xffff00ff
_081024B0: .4byte 0xff00ffff
_081024B4: .4byte 0x00ffffff
_081024B8: .4byte 0x0000ffff
_081024BC: .4byte gUnknown_841EE2B
	thumb_func_end sub_8102428

	.align 2, 0 @ Don't pad with nop.
