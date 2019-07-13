	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8088FF0
sub_8088FF0: @ 8088FF0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_808B180
	ldr r0, _08089024 @ =gUnknown_20397A4
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _08089020
	ldr r1, _08089028 @ =0x040000d4
	ldr r0, _0808902C @ =gScanlineEffectRegBuffers
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _08089030 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_08089020:
	pop {r0}
	bx r0
	.align 2, 0
_08089024: .4byte gUnknown_20397A4
_08089028: .4byte 0x040000d4
_0808902C: .4byte gScanlineEffectRegBuffers
_08089030: .4byte 0x800000a0
	thumb_func_end sub_8088FF0

	thumb_func_start sub_8089034
sub_8089034: @ 8089034
	push {r4,lr}
	ldr r4, _08089060 @ =0x04000208
	ldrh r3, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r1, _08089064 @ =gScanlineEffectRegBuffers
	ldr r0, _08089068 @ =0x04000006
	ldrh r2, [r0]
	movs r0, 0xFF
	ands r0, r2
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0808906C @ =0x04000012
	strh r1, [r0]
	strh r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089060: .4byte 0x04000208
_08089064: .4byte gScanlineEffectRegBuffers
_08089068: .4byte 0x04000006
_0808906C: .4byte 0x04000012
	thumb_func_end sub_8089034

	thumb_func_start sub_8089070
sub_8089070: @ 8089070
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8089070

	thumb_func_start sub_8089088
sub_8089088: @ 8089088
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080890BC @ =gUnknown_20397A4
	ldr r0, [r5]
	movs r1, 0x8B
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl SetMainCallback2
	bl FreeAllWindowBuffers
	ldr r0, [r5]
	bl Free
	movs r0, 0
	str r0, [r5]
	adds r0, r4, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080890BC: .4byte gUnknown_20397A4
	thumb_func_end sub_8089088

	thumb_func_start sub_80890C0
sub_80890C0: @ 80890C0
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080890E0 @ =gUnknown_20397A4
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x10
	bls _080890D6
	b _08089416
_080890D6:
	lsls r0, 2
	ldr r1, _080890E4 @ =_080890E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080890E0: .4byte gUnknown_20397A4
_080890E4: .4byte _080890E8
	.align 2, 0
_080890E8:
	.4byte _0808912C
	.4byte _08089142
	.4byte _08089150
	.4byte _08089158
	.4byte _0808916C
	.4byte _08089180
	.4byte _08089194
	.4byte _0808919A
	.4byte _080891DC
	.4byte _08089208
	.4byte _08089224
	.4byte _080892E4
	.4byte _080892B8
	.4byte _080893F6
	.4byte _080893E4
	.4byte _0808937A
	.4byte _080893B8
_0808912C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _08089138
	b _08089416
_08089138:
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	b _08089214
_08089142:
	bl sub_8089DC8
	lsls r0, 24
	cmp r0, 0
	bne _0808914E
	b _08089416
_0808914E:
	b _08089214
_08089150:
	movs r0, 0x1
	bl sub_808ACC8
	b _08089214
_08089158:
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	bl sub_808B838
	movs r0, 0x2
	bl sub_808ACC8
	b _08089214
_0808916C:
	ldr r0, [r4]
	ldr r1, _0808917C @ =0x00000e1c
	adds r0, r1
	bl sub_808AE94
	ldr r1, [r4]
	b _08089218
	.align 2, 0
_0808917C: .4byte 0x00000e1c
_08089180:
	ldr r0, [r4]
	ldr r1, _08089190 @ =0x000004bc
	adds r0, r1
	bl sub_808AF04
	ldr r1, [r4]
	b _08089218
	.align 2, 0
_08089190: .4byte 0x000004bc
_08089194:
	bl sub_808AF74
	b _08089214
_0808919A:
	ldr r0, _080891D0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080891B6
	ldr r0, _080891D4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080891B6
	bl sub_80FCEA8
	movs r0, 0xE6
	movs r1, 0x96
	bl sub_80FCD74
_080891B6:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080891D8 @ =sub_8088FF0
	bl SetVBlankCallback
	b _08089214
	.align 2, 0
_080891D0: .4byte gWirelessCommType
_080891D4: .4byte gReceivedRemoteLinkPlayers
_080891D8: .4byte sub_8088FF0
_080891DC:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	beq _080891E8
	b _08089416
_080891E8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	beq _080891F4
	b _08089416
_080891F4:
	movs r0, 0xF4
	bl PlaySE
	ldr r0, _08089204 @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0xA
	strb r0, [r1]
	b _08089416
	.align 2, 0
_08089204: .4byte gUnknown_20397A4
_08089208:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08089214
	b _08089416
_08089214:
	ldr r0, _08089220 @ =gUnknown_20397A4
	ldr r1, [r0]
_08089218:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08089416
	.align 2, 0
_08089220: .4byte gUnknown_20397A4
_08089224:
	ldr r0, _08089270 @ =gReceivedRemoteLinkPlayers
	ldrb r5, [r0]
	cmp r5, 0
	bne _0808924A
	ldr r0, [r4]
	ldr r1, _08089274 @ =0x00007bce
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808924A
	bl sub_808A22C
	movs r0, 0x1
	bl sub_808ACC8
	ldr r0, [r4]
	ldr r1, _08089274 @ =0x00007bce
	adds r0, r1
	strb r5, [r0]
_0808924A:
	ldr r0, _08089278 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08089280
	movs r0, 0xB
	bl HelpSystem_SetSomeVariable2
	bl sub_808B1D4
	movs r0, 0xF2
	bl PlaySE
	ldr r0, _0808927C @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0xC
	strb r0, [r1]
	b _08089416
	.align 2, 0
_08089270: .4byte gReceivedRemoteLinkPlayers
_08089274: .4byte 0x00007bce
_08089278: .4byte gMain
_0808927C: .4byte gUnknown_20397A4
_08089280:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0808928A
	b _08089416
_0808928A:
	ldr r0, _080892B0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080892A4
	ldr r4, _080892B4 @ =gUnknown_20397A4
	ldr r0, [r4]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _080892A4
	bl InUnionRoom
	cmp r0, 0x1
	beq _08089364
_080892A4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	b _080893C8
	.align 2, 0
_080892B0: .4byte gReceivedRemoteLinkPlayers
_080892B4: .4byte gUnknown_20397A4
_080892B8:
	bl sub_808B1FC
	lsls r0, 24
	cmp r0, 0
	bne _080892C4
	b _08089416
_080892C4:
	bl sub_8058244
	cmp r0, 0x1
	bne _080892CE
	b _08089416
_080892CE:
	movs r0, 0xF4
	bl PlaySE
	ldr r0, _080892E0 @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0xB
	strb r0, [r1]
	b _08089416
	.align 2, 0
_080892E0: .4byte gUnknown_20397A4
_080892E4:
	ldr r0, _0808931C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08089344
	ldr r0, _08089320 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089324
	ldr r0, [r4]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _08089308
	bl InUnionRoom
	cmp r0, 0x1
	beq _08089364
_08089308:
	ldr r0, _08089320 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089324
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	b _080893C8
	.align 2, 0
_0808931C: .4byte gMain
_08089320: .4byte gReceivedRemoteLinkPlayers
_08089324:
	movs r0, 0xA
	bl HelpSystem_SetSomeVariable2
	bl sub_808B1D4
	ldr r0, _08089340 @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0xD
	strb r0, [r1]
	movs r0, 0xF2
	bl PlaySE
	b _08089416
	.align 2, 0
_08089340: .4byte gUnknown_20397A4
_08089344:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08089416
	ldr r0, _0808936C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089370
	ldr r0, [r4]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	beq _08089370
	bl InUnionRoom
	cmp r0, 0x1
	bne _08089370
_08089364:
	ldr r1, [r4]
	movs r0, 0xF
	strb r0, [r1]
	b _08089416
	.align 2, 0
_0808936C: .4byte gReceivedRemoteLinkPlayers
_08089370:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	b _080893C8
_0808937A:
	bl sub_800AAC0
	movs r0, 0
	movs r1, 0x1
	bl DrawDialogueFrame
	ldr r2, _080893B0 @ =gUnknown_8419D89
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _080893B4 @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0x10
	strb r0, [r1]
	b _08089416
	.align 2, 0
_080893B0: .4byte gUnknown_8419D89
_080893B4: .4byte gUnknown_20397A4
_080893B8:
	ldr r0, _080893DC @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _08089416
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
_080893C8:
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080893E0 @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0xE
	strb r0, [r1]
	b _08089416
	.align 2, 0
_080893DC: .4byte gReceivedRemoteLinkPlayers
_080893E0: .4byte gUnknown_20397A4
_080893E4:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08089416
	adds r0, r5, 0
	bl sub_8089088
	b _08089416
_080893F6:
	bl sub_808B1FC
	lsls r0, 24
	cmp r0, 0
	beq _08089416
	bl sub_8058244
	cmp r0, 0x1
	beq _08089416
	ldr r0, _08089420 @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0xA
	strb r0, [r1]
	movs r0, 0xF4
	bl PlaySE
_08089416:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089420: .4byte gUnknown_20397A4
	thumb_func_end sub_80890C0

	thumb_func_start sub_8089424
sub_8089424: @ 8089424
	push {lr}
	ldr r0, _0808943C @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	cmp r0, 0x5
	bls _08089432
	b _0808959C
_08089432:
	lsls r0, 2
	ldr r1, _08089440 @ =_08089444
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808943C: .4byte gUnknown_20397A4
_08089440: .4byte _08089444
	.align 2, 0
_08089444:
	.4byte _0808945C
	.4byte _08089490
	.4byte _080894C4
	.4byte _08089524
	.4byte _0808953C
	.4byte _08089570
_0808945C:
	ldr r0, _08089470 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r2, _08089474 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08089480
	ldr r0, _08089478 @ =gUnknown_83CCE30
	ldr r2, _0808947C @ =0x00000e1c
	b _08089582
	.align 2, 0
_08089470: .4byte gUnknown_20397A4
_08089474: .4byte 0x00000457
_08089478: .4byte gUnknown_83CCE30
_0808947C: .4byte 0x00000e1c
_08089480:
	ldr r0, _08089488 @ =gUnknown_83CCEC8
	ldr r2, _0808948C @ =0x00000e1c
	b _08089582
	.align 2, 0
_08089488: .4byte gUnknown_83CCEC8
_0808948C: .4byte 0x00000e1c
_08089490:
	ldr r0, _080894A4 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r2, _080894A8 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080894B4
	ldr r0, _080894AC @ =gUnknown_83CC8A8
	ldr r2, _080894B0 @ =0x0000096c
	b _08089582
	.align 2, 0
_080894A4: .4byte gUnknown_20397A4
_080894A8: .4byte 0x00000457
_080894AC: .4byte gUnknown_83CC8A8
_080894B0: .4byte 0x0000096c
_080894B4:
	ldr r0, _080894BC @ =gUnknown_83CC984
	ldr r2, _080894C0 @ =0x0000096c
	b _08089582
	.align 2, 0
_080894BC: .4byte gUnknown_83CC984
_080894C0: .4byte 0x0000096c
_080894C4:
	ldr r0, _080894E0 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	bne _080894FC
	ldr r2, _080894E4 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080894EC
	ldr r0, _080894E8 @ =gUnknown_83CC4DC
	adds r2, 0x65
	b _08089582
	.align 2, 0
_080894E0: .4byte gUnknown_20397A4
_080894E4: .4byte 0x00000457
_080894E8: .4byte gUnknown_83CC4DC
_080894EC:
	ldr r0, _080894F4 @ =gUnknown_83CC6F0
	ldr r2, _080894F8 @ =0x000004bc
	b _08089582
	.align 2, 0
_080894F4: .4byte gUnknown_83CC6F0
_080894F8: .4byte 0x000004bc
_080894FC:
	ldr r2, _0808950C @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08089514
	ldr r0, _08089510 @ =gUnknown_83CCAB0
	adds r2, 0x65
	b _08089582
	.align 2, 0
_0808950C: .4byte 0x00000457
_08089510: .4byte gUnknown_83CCAB0
_08089514:
	ldr r0, _0808951C @ =gUnknown_83CCCA4
	ldr r2, _08089520 @ =0x000004bc
	b _08089582
	.align 2, 0
_0808951C: .4byte gUnknown_83CCCA4
_08089520: .4byte 0x000004bc
_08089524:
	ldr r0, _08089530 @ =gUnknown_83CD5E8
	ldr r1, _08089534 @ =gUnknown_20397A4
	ldr r1, [r1]
	ldr r2, _08089538 @ =0x000012cc
	b _08089582
	.align 2, 0
_08089530: .4byte gUnknown_83CD5E8
_08089534: .4byte gUnknown_20397A4
_08089538: .4byte 0x000012cc
_0808953C:
	ldr r0, _08089550 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r2, _08089554 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08089560
	ldr r0, _08089558 @ =gUnknown_8E998CC
	ldr r2, _0808955C @ =0x000018cc
	b _08089582
	.align 2, 0
_08089550: .4byte gUnknown_20397A4
_08089554: .4byte 0x00000457
_08089558: .4byte gUnknown_8E998CC
_0808955C: .4byte 0x000018cc
_08089560:
	ldr r0, _08089568 @ =gUnknown_8E991F8
	ldr r2, _0808956C @ =0x000018cc
	b _08089582
	.align 2, 0
_08089568: .4byte gUnknown_8E991F8
_0808956C: .4byte 0x000018cc
_08089570:
	ldr r0, _0808958C @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r2, _08089590 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080895A4
	ldr r0, _08089594 @ =gUnknown_83CC368
	ldr r2, _08089598 @ =0x000016cc
_08089582:
	adds r1, r2
	bl LZ77UnCompWram
	b _080895A4
	.align 2, 0
_0808958C: .4byte gUnknown_20397A4
_08089590: .4byte 0x00000457
_08089594: .4byte gUnknown_83CC368
_08089598: .4byte 0x000016cc
_0808959C:
	movs r0, 0
	strb r0, [r1, 0x2]
	movs r0, 0x1
	b _080895B0
_080895A4:
	ldr r0, _080895B4 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0
_080895B0:
	pop {r1}
	bx r1
	.align 2, 0
_080895B4: .4byte gUnknown_20397A4
	thumb_func_end sub_8089424

	thumb_func_start sub_80895B8
sub_80895B8: @ 80895B8
	push {lr}
	ldr r1, _080895D8 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xD
	bls _080895CC
	b _0808973A
_080895CC:
	lsls r0, 2
	ldr r1, _080895DC @ =_080895E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080895D8: .4byte gMain
_080895DC: .4byte _080895E0
	.align 2, 0
_080895E0:
	.4byte _08089618
	.4byte _08089630
	.4byte _08089644
	.4byte _08089658
	.4byte _0808966A
	.4byte _0808967C
	.4byte _08089690
	.4byte _080896A4
	.4byte _080896B8
	.4byte _080896D4
	.4byte _080896E8
	.4byte _080896FC
	.4byte _08089710
	.4byte _0808972C
_08089618:
	bl sub_8089C3C
	bl sub_8089DA4
	ldr r1, _0808962C @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08089732
	.align 2, 0
_0808962C: .4byte gMain
_08089630:
	bl nullsub_51
	ldr r1, _08089640 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08089732
	.align 2, 0
_08089640: .4byte gMain
_08089644:
	bl sub_8089C5C
	ldr r1, _08089654 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08089732
	.align 2, 0
_08089654: .4byte gMain
_08089658:
	bl sub_8089C80
	ldr r1, _08089678 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0808966A:
	bl sub_8089CA4
	ldr r1, _08089678 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08089732
	.align 2, 0
_08089678: .4byte gMain
_0808967C:
	bl sub_8089D0C
	ldr r1, _0808968C @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08089732
	.align 2, 0
_0808968C: .4byte gMain
_08089690:
	bl sub_80F6E9C
	ldr r1, _080896A0 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08089732
	.align 2, 0
_080896A0: .4byte gMain
_080896A4:
	bl sub_808AB10
	ldr r1, _080896B4 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08089732
	.align 2, 0
_080896B4: .4byte gMain
_080896B8:
	bl sub_8089424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808973E
	ldr r1, _080896D0 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08089732
	.align 2, 0
_080896D0: .4byte gMain
_080896D4:
	bl sub_808AC6C
	ldr r1, _080896E4 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08089732
	.align 2, 0
_080896E4: .4byte gMain
_080896E8:
	bl sub_8089B64
	ldr r1, _080896F8 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08089732
	.align 2, 0
_080896F8: .4byte gMain
_080896FC:
	bl sub_8089ECC
	ldr r1, _0808970C @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r2
	b _08089732
	.align 2, 0
_0808970C: .4byte gMain
_08089710:
	bl sub_808ACE4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808973E
	ldr r1, _08089728 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	b _08089732
	.align 2, 0
_08089728: .4byte gMain
_0808972C:
	movs r0, 0x87
	lsls r0, 3
	adds r1, r2, r0
_08089732:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808973E
_0808973A:
	bl sub_8089D8C
_0808973E:
	pop {r0}
	bx r0
	thumb_func_end sub_80895B8

	thumb_func_start sav12_xor_get_clamped_above
sav12_xor_get_clamped_above: @ 8089744
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl GetGameStat
	cmp r0, r4
	bls _08089756
	adds r0, r4, 0
_08089756:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sav12_xor_get_clamped_above

	thumb_func_start sub_808975C
sub_808975C: @ 808975C
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldrh r0, [r1, 0x6]
	cmp r0, 0
	bne _0808976E
	ldr r0, [r1, 0x8]
	cmp r0, 0
	beq _08089770
_0808976E:
	movs r2, 0x1
_08089770:
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _0808977C
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0808977C:
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x31
	bls _08089788
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08089788:
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08089794
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08089794:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_808975C

	thumb_func_start sub_808979C
sub_808979C: @ 808979C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r7, _08089888 @ =gSaveBlock2Ptr
	ldr r1, [r7]
	ldrb r0, [r1, 0x8]
	movs r6, 0
	strb r0, [r5]
	ldrh r0, [r1, 0xE]
	strh r0, [r5, 0x10]
	ldrb r0, [r1, 0x10]
	strh r0, [r5, 0x12]
	movs r0, 0x1
	bl GetGameStat
	adds r4, r0, 0
	movs r0, 0xA
	bl GetGameStat
	cmp r0, 0
	bne _080897D0
	movs r4, 0
_080897D0:
	lsrs r0, r4, 16
	strh r0, [r5, 0x6]
	lsrs r1, r4, 8
	movs r2, 0xFF
	ands r1, r2
	strh r1, [r5, 0x8]
	ands r4, r2
	strh r4, [r5, 0xA]
	ldr r1, _0808988C @ =0x000003e7
	cmp r0, r1
	bls _080897EE
	strh r1, [r5, 0x6]
	movs r0, 0x3B
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
_080897EE:
	ldr r0, _08089890 @ =0x00000829
	bl FlagGet
	strb r0, [r5, 0x2]
	bl sub_8088F24
	strb r0, [r5, 0x3]
	bl sub_808A0E0
	strh r0, [r5, 0xC]
	ldr r0, [r7]
	ldrb r1, [r0, 0xB]
	lsls r1, 8
	ldrb r0, [r0, 0xA]
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r4, _08089894 @ =0x0000270f
	movs r0, 0x17
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x14]
	movs r0, 0x18
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x16]
	ldr r1, _08089898 @ =0x0000ffff
	movs r0, 0x15
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x20]
	strh r6, [r5, 0x18]
	strh r6, [r5, 0x1A]
	strh r6, [r5, 0x1C]
	strh r6, [r5, 0x1E]
	movs r0, 0
	strb r0, [r5, 0x4]
	ldr r4, _0808989C @ =gSaveBlock1Ptr
	ldr r0, [r4]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	str r0, [r5, 0x24]
	movs r2, 0
	adds r7, r5, 0
	adds r7, 0x30
	adds r6, r5, 0
	adds r6, 0x28
	ldr r0, [r4]
	ldr r1, _080898A0 @ =0x00002ca0
	adds r3, r0, r1
_0808985A:
	lsls r0, r2, 1
	adds r1, r6, r0
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0808985A
	ldr r0, _08089888 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	cmp r0, 0
	bne _080898A4
	adds r0, r5, 0
	bl sub_808975C
	b _080898DC
	.align 2, 0
_08089888: .4byte gSaveBlock2Ptr
_0808988C: .4byte 0x000003e7
_08089890: .4byte 0x00000829
_08089894: .4byte 0x0000270f
_08089898: .4byte 0x0000ffff
_0808989C: .4byte gSaveBlock1Ptr
_080898A0: .4byte 0x00002ca0
_080898A4:
	mov r1, r8
	cmp r1, 0x1
	bne _080898DE
	movs r0, 0
	strb r0, [r5, 0x1]
	ldrh r0, [r5, 0x6]
	cmp r0, 0
	bne _080898BA
	ldr r0, [r5, 0x8]
	cmp r0, 0
	beq _080898BE
_080898BA:
	mov r0, r8
	strb r0, [r5, 0x1]
_080898BE:
	bl sub_8088F58
	lsls r0, 16
	cmp r0, 0
	beq _080898CE
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
_080898CE:
	bl HasAllKantoMons
	lsls r0, 16
	cmp r0, 0
	beq _080898DE
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
_080898DC:
	strb r0, [r5, 0x1]
_080898DE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808979C

	thumb_func_start sub_80898E8
sub_80898E8: @ 80898E8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	adds r1, r5, 0
	adds r1, 0x38
	movs r0, 0x4
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_808979C
	bl sub_808B800
	lsls r0, 24
	cmp r0, 0
	beq _0808990A
	b _08089A60
_0808990A:
	strb r4, [r5, 0x1]
	ldrh r0, [r5, 0x6]
	cmp r0, 0
	bne _08089918
	ldr r0, [r5, 0x8]
	cmp r0, 0
	beq _0808991C
_08089918:
	movs r0, 0x1
	strb r0, [r5, 0x1]
_0808991C:
	bl sub_8088F58
	strb r0, [r5, 0x3]
	bl HasAllKantoMons
	adds r6, r5, 0
	adds r6, 0x4D
	strb r0, [r6]
	ldr r0, _0808999C @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldr r2, _080899A0 @ =0x00000b14
	adds r1, r0, r2
	ldrh r1, [r1]
	str r1, [r5, 0x44]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldrh r0, [r0]
	str r0, [r5, 0x48]
	ldr r4, _080899A4 @ =0x0000ffff
	movs r0, 0x33
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	str r0, [r5, 0x3C]
	movs r0, 0x32
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	str r0, [r5, 0x40]
	adds r1, r5, 0
	adds r1, 0x4C
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r5, 0x3]
	cmp r0, 0
	beq _0808996C
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
_0808996C:
	ldrb r0, [r6]
	cmp r0, 0
	beq _08089978
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
_08089978:
	ldr r0, [r5, 0x44]
	cmp r0, 0xC7
	bls _0808998A
	ldr r0, [r5, 0x48]
	cmp r0, 0xC7
	bls _0808998A
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
_0808998A:
	ldrh r4, [r5, 0xE]
	movs r0, 0x7
	ands r4, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _080899AC
	ldr r0, _080899A8 @ =gUnknown_83CD8F8
	adds r0, 0x8
	b _080899AE
	.align 2, 0
_0808999C: .4byte gSaveBlock2Ptr
_080899A0: .4byte 0x00000b14
_080899A4: .4byte 0x0000ffff
_080899A8: .4byte gUnknown_83CD8F8
_080899AC:
	ldr r0, _08089A68 @ =gUnknown_83CD8F8
_080899AE:
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r1, 0x4F
	strb r0, [r1]
	ldr r0, _08089A6C @ =0x00004049
	bl VarGet
	adds r1, r5, 0
	adds r1, 0x50
	strb r0, [r1]
	ldr r0, _08089A70 @ =0x0000404a
	bl VarGet
	adds r1, r5, 0
	adds r1, 0x51
	strb r0, [r1]
	ldr r0, _08089A74 @ =0x0000404b
	bl VarGet
	adds r1, r5, 0
	adds r1, 0x52
	strb r0, [r1]
	ldr r0, _08089A78 @ =0x00004042
	bl VarGet
	adds r1, r5, 0
	adds r1, 0x4E
	strb r0, [r1]
	ldr r0, _08089A7C @ =0x00004043
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8096FD4
	adds r1, r5, 0
	adds r1, 0x54
	strh r0, [r1]
	ldr r0, _08089A80 @ =0x00004044
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8096FD4
	adds r1, r5, 0
	adds r1, 0x56
	strh r0, [r1]
	ldr r0, _08089A84 @ =0x00004045
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8096FD4
	adds r1, r5, 0
	adds r1, 0x58
	strh r0, [r1]
	ldr r0, _08089A88 @ =0x00004046
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8096FD4
	adds r1, r5, 0
	adds r1, 0x5A
	strh r0, [r1]
	ldr r0, _08089A8C @ =0x00004047
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8096FD4
	adds r1, r5, 0
	adds r1, 0x5C
	strh r0, [r1]
	ldr r0, _08089A90 @ =0x00004048
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8096FD4
	adds r1, r5, 0
	adds r1, 0x5E
	strh r0, [r1]
_08089A60:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089A68: .4byte gUnknown_83CD8F8
_08089A6C: .4byte 0x00004049
_08089A70: .4byte 0x0000404a
_08089A74: .4byte 0x0000404b
_08089A78: .4byte 0x00004042
_08089A7C: .4byte 0x00004043
_08089A80: .4byte 0x00004044
_08089A84: .4byte 0x00004045
_08089A88: .4byte 0x00004046
_08089A8C: .4byte 0x00004047
_08089A90: .4byte 0x00004048
	thumb_func_end sub_80898E8

	thumb_func_start sub_8089A94
sub_8089A94: @ 8089A94
	push {r4,r5,lr}
	ldr r4, _08089B4C @ =gUnknown_20397A4
	ldr r0, [r4]
	movs r1, 0
	strb r1, [r0, 0xA]
	ldr r0, [r4]
	strb r1, [r0, 0xB]
	ldr r0, [r4]
	strb r1, [r0, 0xC]
	ldr r0, [r4]
	strb r1, [r0, 0xD]
	ldr r0, [r4]
	strb r1, [r0, 0xE]
	ldr r0, [r4]
	strb r1, [r0, 0xF]
	ldr r0, [r4]
	strb r1, [r0, 0x10]
	ldr r0, [r4]
	adds r0, 0x11
	movs r2, 0x8
	bl memset
	ldr r1, [r4]
	ldr r2, _08089B50 @ =0x0000045e
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089AD2
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_08089AD2:
	ldr r1, [r4]
	ldr r3, _08089B54 @ =0x00000462
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _08089AE8
	ldr r2, _08089B58 @ =0x00000464
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08089AEE
_08089AE8:
	ldrb r0, [r1, 0xB]
	adds r0, 0x1
	strb r0, [r1, 0xB]
_08089AEE:
	ldr r2, _08089B4C @ =gUnknown_20397A4
	ldr r1, [r2]
	movs r3, 0x8E
	lsls r3, 3
	adds r0, r1, r3
	ldr r0, [r0]
	cmp r0, 0
	beq _08089B04
	ldrb r0, [r1, 0xC]
	adds r0, 0x1
	strb r0, [r1, 0xC]
_08089B04:
	ldr r1, [r2]
	ldr r2, _08089B5C @ =0x0000047c
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0
	beq _08089B16
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
_08089B16:
	movs r5, 0
	movs r4, 0x82
	lsls r4, 4
_08089B1C:
	lsls r0, r4, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08089B38
	ldr r0, _08089B4C @ =gUnknown_20397A4
	ldr r1, [r0]
	adds r1, 0x11
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08089B38:
	adds r4, 0x1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08089B60 @ =0x00000827
	cmp r4, r0
	bls _08089B1C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089B4C: .4byte gUnknown_20397A4
_08089B50: .4byte 0x0000045e
_08089B54: .4byte 0x00000462
_08089B58: .4byte 0x00000464
_08089B5C: .4byte 0x0000047c
_08089B60: .4byte 0x00000827
	thumb_func_end sub_8089A94

	thumb_func_start sub_8089B64
sub_8089B64: @ 8089B64
	push {lr}
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r1, 0xFD
	lsls r1, 6
	movs r0, 0
	bl SetGpuReg
	movs r0, 0x50
	movs r1, 0xC1
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x1E
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xA0
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0xF0
	bl SetGpuReg
	ldr r0, _08089BC8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089BCC
	movs r0, 0xC7
	bl EnableInterrupts
	b _08089BD2
	.align 2, 0
_08089BC8: .4byte gReceivedRemoteLinkPlayers
_08089BCC:
	movs r0, 0x3
	bl EnableInterrupts
_08089BD2:
	pop {r0}
	bx r0
	thumb_func_end sub_8089B64

	thumb_func_start sub_8089BD8
sub_8089BD8: @ 8089BD8
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x28
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bgt _08089BF2
	movs r2, 0
_08089BF2:
	ldr r4, _08089C30 @ =gUnknown_20397A4
	ldr r0, [r4]
	ldr r1, _08089C34 @ =0x00000456
	adds r0, r1
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x54
	bl SetGpuReg
	ldr r0, [r4]
	ldr r1, _08089C38 @ =0x00007bcc
	adds r0, r1
	ldrh r2, [r0]
	lsls r1, r2, 8
	movs r0, 0xA0
	subs r0, r2
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x44
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089C30: .4byte gUnknown_20397A4
_08089C34: .4byte 0x00000456
_08089C38: .4byte 0x00007bcc
	thumb_func_end sub_8089BD8

	thumb_func_start sub_8089C3C
sub_8089C3C: @ 8089C3C
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_8089C3C

	thumb_func_start nullsub_51
nullsub_51: @ 8089C58
	bx lr
	thumb_func_end nullsub_51

	thumb_func_start sub_8089C5C
sub_8089C5C: @ 8089C5C
	sub sp, 0x4
	movs r1, 0xE0
	lsls r1, 19
	movs r0, 0
	str r0, [sp]
	ldr r0, _08089C78 @ =0x040000d4
	mov r2, sp
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08089C7C @ =0x85000100
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_08089C78: .4byte 0x040000d4
_08089C7C: .4byte 0x85000100
	thumb_func_end sub_8089C5C

	thumb_func_start sub_8089C80
sub_8089C80: @ 8089C80
	sub sp, 0x4
	movs r2, 0xA0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08089C9C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08089CA0 @ =0x81000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_08089C9C: .4byte 0x040000d4
_08089CA0: .4byte 0x81000200
	thumb_func_end sub_8089C80

	thumb_func_start sub_8089CA4
sub_8089CA4: @ 8089CA4
	push {lr}
	movs r0, 0x8
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xA
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xC
	movs r1, 0
	bl SetGpuReg
	movs r0, 0xE
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_8089CA4

	thumb_func_start sub_8089D0C
sub_8089D0C: @ 8089D0C
	push {lr}
	bl ResetSpriteData
	bl ResetPaletteFade
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08089D84 @ =gUnknown_83CD888
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
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
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	ldr r0, _08089D88 @ =gUnknown_83CD898
	bl InitWindows
	bl DeactivateAllTextPrinters
	pop {r0}
	bx r0
	.align 2, 0
_08089D84: .4byte gUnknown_83CD888
_08089D88: .4byte gUnknown_83CD898
	thumb_func_end sub_8089D0C

	thumb_func_start sub_8089D8C
sub_8089D8C: @ 8089D8C
	push {lr}
	ldr r0, _08089DA0 @ =sub_8089070
	bl SetMainCallback2
	movs r0, 0xA
	bl HelpSystem_SetSomeVariable2
	pop {r0}
	bx r0
	.align 2, 0
_08089DA0: .4byte sub_8089070
	thumb_func_end sub_8089D8C

	thumb_func_start sub_8089DA4
sub_8089DA4: @ 8089DA4
	push {lr}
	bl ResetTasks
	bl ScanlineEffect_Stop
	ldr r0, _08089DC4 @ =sub_80890C0
	movs r1, 0
	bl CreateTask
	bl sub_808B774
	bl sub_8089A94
	pop {r0}
	bx r0
	.align 2, 0
_08089DC4: .4byte sub_80890C0
	thumb_func_end sub_8089DA4

	thumb_func_start sub_8089DC8
sub_8089DC8: @ 8089DC8
	push {lr}
	ldr r0, _08089DE0 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x5
	bhi _08089E24
	lsls r0, 2
	ldr r1, _08089DE4 @ =_08089DE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08089DE0: .4byte gUnknown_20397A4
_08089DE4: .4byte _08089DE8
	.align 2, 0
_08089DE8:
	.4byte _08089E00
	.4byte _08089E06
	.4byte _08089E0C
	.4byte _08089E12
	.4byte _08089E18
	.4byte _08089E1E
_08089E00:
	bl sub_8089EEC
	b _08089E2C
_08089E06:
	bl sub_8089F78
	b _08089E2C
_08089E0C:
	bl sub_8089FEC
	b _08089E2C
_08089E12:
	bl sub_808A100
	b _08089E2C
_08089E18:
	bl sub_808A22C
	b _08089E2C
_08089E1E:
	bl sub_808A3D0
	b _08089E2C
_08089E24:
	movs r0, 0
	strb r0, [r1, 0x1]
	movs r0, 0x1
	b _08089E38
_08089E2C:
	ldr r0, _08089E3C @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0
_08089E38:
	pop {r1}
	bx r1
	.align 2, 0
_08089E3C: .4byte gUnknown_20397A4
	thumb_func_end sub_8089DC8

	thumb_func_start sub_8089E40
sub_8089E40: @ 8089E40
	push {lr}
	ldr r0, _08089E58 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x7
	bhi _08089EB0
	lsls r0, 2
	ldr r1, _08089E5C @ =_08089E60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08089E58: .4byte gUnknown_20397A4
_08089E5C: .4byte _08089E60
	.align 2, 0
_08089E60:
	.4byte _08089E80
	.4byte _08089E86
	.4byte _08089E8C
	.4byte _08089E92
	.4byte _08089E98
	.4byte _08089E9E
	.4byte _08089EA4
	.4byte _08089EAA
_08089E80:
	bl sub_808A4FC
	b _08089EB8
_08089E86:
	bl sub_808A654
	b _08089EB8
_08089E8C:
	bl sub_808A760
	b _08089EB8
_08089E92:
	bl sub_808A854
	b _08089EB8
_08089E98:
	bl sub_808A91C
	b _08089EB8
_08089E9E:
	bl sub_808A9F0
	b _08089EB8
_08089EA4:
	bl sub_808AA78
	b _08089EB8
_08089EAA:
	bl sub_808ABE0
	b _08089EB8
_08089EB0:
	movs r0, 0
	strb r0, [r1, 0x1]
	movs r0, 0x1
	b _08089EC4
_08089EB8:
	ldr r0, _08089EC8 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0
_08089EC4:
	pop {r1}
	bx r1
	.align 2, 0
_08089EC8: .4byte gUnknown_20397A4
	thumb_func_end sub_8089E40

	thumb_func_start sub_8089ECC
sub_8089ECC: @ 8089ECC
	push {lr}
	bl sub_808A4A8
	bl sub_808A5B8
	bl sub_808A6C8
	bl sub_808A810
	bl sub_808A8D0
	bl sub_808A9A4
	pop {r0}
	bx r0
	thumb_func_end sub_8089ECC

	thumb_func_start sub_8089EEC
sub_8089EEC: @ 8089EEC
	push {r4,r5,lr}
	sub sp, 0x4C
	ldr r1, _08089F54 @ =gUnknown_8419CDA
	add r0, sp, 0xC
	bl StringCopy
	add r4, sp, 0x2C
	ldr r5, _08089F58 @ =gUnknown_20397A4
	ldr r1, [r5]
	ldr r0, _08089F5C @ =0x0000048c
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, [r5]
	ldr r1, _08089F60 @ =0x00007bcf
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl ConvertInternationalString
	add r0, sp, 0xC
	adds r1, r4, 0
	bl StringAppend
	ldr r0, _08089F64 @ =gUnknown_83CD8E9
	ldrb r1, [r0, 0x1]
	ldr r2, _08089F68 @ =gUnknown_83CD920
	ldr r0, [r5]
	ldr r3, _08089F6C @ =0x00000457
	adds r0, r3
	ldrb r0, [r0]
	adds r2, r0, r2
	ldrb r2, [r2]
	ldr r3, _08089F70 @ =gUnknown_83CD922
	adds r0, r3
	ldrb r3, [r0]
	ldr r0, _08089F74 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	bl AddTextPrinterParameterized3
	add sp, 0x4C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089F54: .4byte gUnknown_8419CDA
_08089F58: .4byte gUnknown_20397A4
_08089F5C: .4byte 0x0000048c
_08089F60: .4byte 0x00007bcf
_08089F64: .4byte gUnknown_83CD8E9
_08089F68: .4byte gUnknown_83CD920
_08089F6C: .4byte 0x00000457
_08089F70: .4byte gUnknown_83CD922
_08089F74: .4byte gUnknown_83CD8E0
	thumb_func_end sub_8089EEC

	thumb_func_start sub_8089F78
sub_8089F78: @ 8089F78
	push {r4,lr}
	sub sp, 0x2C
	ldr r1, _08089FCC @ =gUnknown_8419CE1
	add r0, sp, 0xC
	bl StringCopy
	ldr r4, _08089FD0 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldr r2, _08089FD4 @ =0x0000046a
	adds r1, r2
	ldrh r1, [r1]
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r0, _08089FD8 @ =gUnknown_83CD8E9
	ldrb r1, [r0, 0x1]
	ldr r2, _08089FDC @ =gUnknown_83CD924
	ldr r0, [r4]
	ldr r3, _08089FE0 @ =0x00000457
	adds r0, r3
	ldrb r0, [r0]
	adds r2, r0, r2
	ldrb r2, [r2]
	ldr r3, _08089FE4 @ =gUnknown_83CD926
	adds r0, r3
	ldrb r3, [r0]
	ldr r0, _08089FE8 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	bl AddTextPrinterParameterized3
	add sp, 0x2C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089FCC: .4byte gUnknown_8419CE1
_08089FD0: .4byte gUnknown_20397A4
_08089FD4: .4byte 0x0000046a
_08089FD8: .4byte gUnknown_83CD8E9
_08089FDC: .4byte gUnknown_83CD924
_08089FE0: .4byte 0x00000457
_08089FE4: .4byte gUnknown_83CD926
_08089FE8: .4byte gUnknown_83CD8E0
	thumb_func_end sub_8089F78

	thumb_func_start sub_8089FEC
sub_8089FEC: @ 8089FEC
	push {r4-r7,lr}
	sub sp, 0x18
	ldr r1, _0808A068 @ =gUnknown_8419CED
	add r0, sp, 0xC
	bl StringCopy
	ldr r4, _0808A06C @ =gUnknown_20397A4
	ldr r1, [r4]
	movs r2, 0x90
	lsls r2, 3
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _0808A070 @ =0x00000457
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A080
	add r0, sp, 0xC
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r2, 0x7A
	negs r2, r2
	adds r0, r2, 0
	subs r0, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0808A074 @ =gUnknown_83CD8E9
	ldrb r6, [r0, 0x1]
	ldr r5, _0808A078 @ =gUnknown_83CD8E0
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0808A07C @ =gUnknown_8419CE7
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x14
	movs r3, 0x38
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x38
	bl AddTextPrinterParameterized3
	b _0808A0CA
	.align 2, 0
_0808A068: .4byte gUnknown_8419CED
_0808A06C: .4byte gUnknown_20397A4
_0808A070: .4byte 0x00000457
_0808A074: .4byte gUnknown_83CD8E9
_0808A078: .4byte gUnknown_83CD8E0
_0808A07C: .4byte gUnknown_8419CE7
_0808A080:
	add r0, sp, 0xC
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r0, 0x76
	subs r0, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0808A0D4 @ =gUnknown_83CD8E9
	ldrb r6, [r0, 0x1]
	ldr r5, _0808A0D8 @ =gUnknown_83CD8E0
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0808A0DC @ =gUnknown_8419CE7
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x10
	movs r3, 0x39
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x39
	bl AddTextPrinterParameterized3
_0808A0CA:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A0D4: .4byte gUnknown_83CD8E9
_0808A0D8: .4byte gUnknown_83CD8E0
_0808A0DC: .4byte gUnknown_8419CE7
	thumb_func_end sub_8089FEC

	thumb_func_start sub_808A0E0
sub_808A0E0: @ 808A0E0
	push {lr}
	bl sub_806E25C
	cmp r0, 0
	bne _0808A0F2
	movs r0, 0x1
	bl sub_8088EDC
	b _0808A0F8
_0808A0F2:
	movs r0, 0x1
	bl pokedex_count
_0808A0F8:
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_808A0E0

	thumb_func_start sub_808A100
sub_808A100: @ 808A100
	push {r4-r7,lr}
	sub sp, 0x18
	ldr r0, _0808A198 @ =0x00000829
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0808A112
	b _0808A212
_0808A112:
	ldr r4, _0808A19C @ =gUnknown_20397A4
	ldr r0, [r4]
	movs r1, 0x8D
	lsls r1, 3
	adds r0, r1
	ldrh r1, [r0]
	add r0, sp, 0xC
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r2, _0808A1A0 @ =0x00000457
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A1B4
	add r0, sp, 0xC
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r2, 0x78
	negs r2, r2
	adds r0, r2, 0
	subs r0, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0808A1A4 @ =gUnknown_83CD8E9
	ldrb r6, [r0, 0x1]
	ldr r5, _0808A1A8 @ =gUnknown_83CD8E0
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0808A1AC @ =gUnknown_8419CEF
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x14
	movs r3, 0x48
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	add r0, sp, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x48
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, _0808A1B0 @ =gUnknown_8419CF7
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x8A
	movs r3, 0x48
	bl AddTextPrinterParameterized3
	b _0808A212
	.align 2, 0
_0808A198: .4byte 0x00000829
_0808A19C: .4byte gUnknown_20397A4
_0808A1A0: .4byte 0x00000457
_0808A1A4: .4byte gUnknown_83CD8E9
_0808A1A8: .4byte gUnknown_83CD8E0
_0808A1AC: .4byte gUnknown_8419CEF
_0808A1B0: .4byte gUnknown_8419CF7
_0808A1B4:
	add r0, sp, 0xC
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	movs r0, 0x78
	subs r0, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0808A21C @ =gUnknown_83CD8E9
	ldrb r6, [r0, 0x1]
	ldr r5, _0808A220 @ =gUnknown_83CD8E0
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0808A224 @ =gUnknown_8419CEF
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x10
	movs r3, 0x49
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x49
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, _0808A228 @ =gUnknown_8419CF7
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x8A
	movs r3, 0x49
	bl AddTextPrinterParameterized3
_0808A212:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A21C: .4byte gUnknown_83CD8E9
_0808A220: .4byte gUnknown_83CD8E0
_0808A224: .4byte gUnknown_8419CEF
_0808A228: .4byte gUnknown_8419CF7
	thumb_func_end sub_808A100

	thumb_func_start sub_808A22C
sub_808A22C: @ 808A22C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r0, _0808A2B0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrh r5, [r0, 0xE]
	ldrb r7, [r0, 0x10]
	ldr r6, _0808A2B4 @ =gUnknown_20397A4
	ldr r2, [r6]
	ldrb r0, [r2, 0x5]
	cmp r0, 0
	beq _0808A256
	ldr r1, _0808A2B8 @ =0x0000046c
	adds r0, r2, r1
	ldrh r5, [r0]
	adds r1, 0x2
	adds r0, r2, r1
	ldrh r7, [r0]
_0808A256:
	ldr r0, _0808A2BC @ =0x000003e7
	cmp r5, r0
	bls _0808A25E
	adds r5, r0, 0
_0808A25E:
	cmp r7, 0x3B
	bls _0808A264
	movs r7, 0x3B
_0808A264:
	ldr r1, _0808A2C0 @ =gUnknown_83CD930
	ldr r4, _0808A2C4 @ =0x00000457
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	ldr r1, _0808A2C8 @ =gUnknown_83CD936
	adds r0, r1
	ldrb r3, [r0]
	movs r0, 0x32
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelRect
	ldr r0, [r6]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A2D8
	ldr r0, _0808A2CC @ =gUnknown_83CD8E9
	ldrb r1, [r0, 0x1]
	ldr r0, _0808A2D0 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r0, _0808A2D4 @ =gUnknown_8419CFD
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x14
	movs r3, 0x58
	bl AddTextPrinterParameterized3
	b _0808A2F4
	.align 2, 0
_0808A2B0: .4byte gSaveBlock2Ptr
_0808A2B4: .4byte gUnknown_20397A4
_0808A2B8: .4byte 0x0000046c
_0808A2BC: .4byte 0x000003e7
_0808A2C0: .4byte gUnknown_83CD930
_0808A2C4: .4byte 0x00000457
_0808A2C8: .4byte gUnknown_83CD936
_0808A2CC: .4byte gUnknown_83CD8E9
_0808A2D0: .4byte gUnknown_83CD8E0
_0808A2D4: .4byte gUnknown_8419CFD
_0808A2D8:
	ldr r0, _0808A3A4 @ =gUnknown_83CD8E9
	ldrb r1, [r0, 0x1]
	ldr r0, _0808A3A8 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	ldr r0, _0808A3AC @ =gUnknown_8419CFD
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r2, 0x10
	movs r3, 0x59
	bl AddTextPrinterParameterized3
_0808A2F4:
	add r0, sp, 0xC
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0808A3A4 @ =gUnknown_83CD8E9
	ldrb r0, [r0, 0x1]
	mov r10, r0
	ldr r1, _0808A3B0 @ =gUnknown_83CD930
	ldr r2, _0808A3B4 @ =gUnknown_20397A4
	mov r9, r2
	ldr r0, [r2]
	ldr r2, _0808A3B8 @ =0x00000457
	mov r8, r2
	add r0, r8
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	ldr r6, _0808A3BC @ =gUnknown_83CD936
	adds r0, r6
	ldrb r3, [r0]
	ldr r0, _0808A3A8 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r0, 0x1
	mov r1, r10
	bl AddTextPrinterParameterized3
	ldr r1, _0808A3C0 @ =gUnknown_83CD932
	mov r2, r9
	ldr r4, [r2]
	mov r2, r8
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	adds r0, r6
	ldrb r3, [r0]
	ldr r1, _0808A3C4 @ =gUnknown_83CD928
	ldrb r0, [r4, 0x7]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp]
	str r5, [sp, 0x4]
	ldr r0, _0808A3C8 @ =gUnknown_8419CF8
	str r0, [sp, 0x8]
	movs r0, 0x1
	mov r1, r10
	bl AddTextPrinterParameterized3
	add r0, sp, 0xC
	adds r1, r7, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0808A3CC @ =gUnknown_83CD934
	mov r2, r9
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	adds r0, r6
	ldrb r3, [r0]
	ldr r0, _0808A3A8 @ =gUnknown_83CD8E0
	str r0, [sp]
	str r5, [sp, 0x4]
	add r1, sp, 0xC
	str r1, [sp, 0x8]
	movs r0, 0x1
	mov r1, r10
	bl AddTextPrinterParameterized3
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A3A4: .4byte gUnknown_83CD8E9
_0808A3A8: .4byte gUnknown_83CD8E0
_0808A3AC: .4byte gUnknown_8419CFD
_0808A3B0: .4byte gUnknown_83CD930
_0808A3B4: .4byte gUnknown_20397A4
_0808A3B8: .4byte 0x00000457
_0808A3BC: .4byte gUnknown_83CD936
_0808A3C0: .4byte gUnknown_83CD932
_0808A3C4: .4byte gUnknown_83CD928
_0808A3C8: .4byte gUnknown_8419CF8
_0808A3CC: .4byte gUnknown_83CD934
	thumb_func_end sub_808A22C

	thumb_func_start sub_808A3D0
sub_808A3D0: @ 808A3D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r7, _0808A494 @ =gUnknown_20397A4
	ldr r1, [r7]
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	beq _0808A486
	ldr r0, _0808A498 @ =gUnknown_83CD938
	mov r8, r0
	ldr r4, _0808A49C @ =0x00000457
	adds r0, r1, r4
	ldrb r0, [r0]
	add r0, r8
	ldrb r3, [r0]
	ldr r6, _0808A4A0 @ =gUnknown_83CD8E0
	str r6, [sp]
	movs r5, 0x1
	negs r5, r5
	str r5, [sp, 0x4]
	adds r0, r1, 0
	adds r0, 0x19
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0xA
	bl AddTextPrinterParameterized3
	ldr r1, [r7]
	adds r1, 0x19
	movs r0, 0x2
	movs r2, 0
	bl GetStringWidth
	adds r2, r0, 0
	adds r2, 0x10
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	add r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, 0x26
	str r1, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	bl AddTextPrinterParameterized3
	ldr r0, _0808A4A4 @ =gUnknown_83CD93A
	mov r8, r0
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	add r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, 0x33
	str r1, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0xA
	bl AddTextPrinterParameterized3
	ldr r1, [r7]
	adds r1, 0x33
	movs r0, 0x2
	movs r2, 0
	bl GetStringWidth
	adds r2, r0, 0
	adds r2, 0x10
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [r7]
	adds r4, r1, r4
	ldrb r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, 0x40
	str r1, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x2
	bl AddTextPrinterParameterized3
_0808A486:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A494: .4byte gUnknown_20397A4
_0808A498: .4byte gUnknown_83CD938
_0808A49C: .4byte 0x00000457
_0808A4A0: .4byte gUnknown_83CD8E0
_0808A4A4: .4byte gUnknown_83CD93A
	thumb_func_end sub_808A3D0

	thumb_func_start sub_808A4A8
sub_808A4A8: @ 808A4A8
	push {r4,lr}
	ldr r4, _0808A4E8 @ =gUnknown_20397A4
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4D
	ldr r2, _0808A4EC @ =0x0000048c
	adds r1, r2
	bl StringCopy
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4D
	ldr r2, _0808A4F0 @ =0x00007bcf
	adds r1, r2
	ldrb r1, [r1]
	bl ConvertInternationalString
	ldr r4, [r4]
	ldr r1, _0808A4F4 @ =0x00000457
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0808A4E0
	adds r0, r4, 0
	adds r0, 0x4D
	ldr r1, _0808A4F8 @ =gUnknown_8419D0A
	bl StringAppend
_0808A4E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A4E8: .4byte gUnknown_20397A4
_0808A4EC: .4byte 0x0000048c
_0808A4F0: .4byte 0x00007bcf
_0808A4F4: .4byte 0x00000457
_0808A4F8: .4byte gUnknown_8419D0A
	thumb_func_end sub_808A4A8

	thumb_func_start sub_808A4FC
sub_808A4FC: @ 808A4FC
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _0808A538 @ =gUnknown_20397A4
	ldr r4, [r6]
	ldr r0, _0808A53C @ =0x00000457
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0808A550
	ldr r0, _0808A540 @ =gUnknown_83CD8E9
	ldrb r1, [r0, 0x1]
	ldr r0, _0808A544 @ =gUnknown_83CD93C
	ldrb r3, [r2]
	adds r0, r3, r0
	ldrb r2, [r0]
	ldr r0, _0808A548 @ =gUnknown_83CD93E
	adds r3, r0
	ldrb r3, [r3]
	ldr r0, _0808A54C @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r0, 0x4D
	str r0, [sp, 0x8]
	movs r0, 0x1
	bl AddTextPrinterParameterized3
	b _0808A59C
	.align 2, 0
_0808A538: .4byte gUnknown_20397A4
_0808A53C: .4byte 0x00000457
_0808A540: .4byte gUnknown_83CD8E9
_0808A544: .4byte gUnknown_83CD93C
_0808A548: .4byte gUnknown_83CD93E
_0808A54C: .4byte gUnknown_83CD8E0
_0808A550:
	ldr r0, _0808A5A4 @ =gUnknown_83CD8E9
	ldrb r5, [r0, 0x1]
	adds r4, 0x4D
	adds r0, r5, 0
	movs r1, 0x2
	bl GetFontAttribute
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetStringWidth
	ldr r2, _0808A5A8 @ =gUnknown_83CD93C
	ldr r4, [r6]
	ldr r3, _0808A5AC @ =0x00000457
	adds r1, r4, r3
	ldrb r1, [r1]
	adds r2, r1, r2
	ldrb r2, [r2]
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0808A5B0 @ =gUnknown_83CD93E
	adds r1, r0
	ldrb r3, [r1]
	ldr r0, _0808A5B4 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0x4]
	adds r4, 0x4D
	str r4, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	bl AddTextPrinterParameterized3
_0808A59C:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5A4: .4byte gUnknown_83CD8E9
_0808A5A8: .4byte gUnknown_83CD93C
_0808A5AC: .4byte 0x00000457
_0808A5B0: .4byte gUnknown_83CD93E
_0808A5B4: .4byte gUnknown_83CD8E0
	thumb_func_end sub_808A4FC

	thumb_func_start sub_808A5B8
sub_808A5B8: @ 808A5B8
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r5, _0808A640 @ =gUnknown_20397A4
	ldr r1, [r5]
	ldrb r0, [r1, 0xB]
	cmp r0, 0
	beq _0808A636
	ldr r2, _0808A644 @ =0x00000462
	adds r0, r1, r2
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, 0x93
	mov r1, sp
	bl StringCopy
	ldr r0, [r5]
	adds r0, 0x93
	ldr r4, _0808A648 @ =gUnknown_8419CF8
	adds r1, r4, 0
	movs r2, 0x2
	bl StringAppendN
	ldr r0, [r5]
	ldr r1, _0808A64C @ =0x00000464
	adds r0, r1
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, 0x93
	mov r1, sp
	movs r2, 0x3
	bl StringAppendN
	ldr r0, [r5]
	adds r0, 0x93
	adds r1, r4, 0
	movs r2, 0x2
	bl StringAppendN
	ldr r0, [r5]
	ldr r2, _0808A650 @ =0x00000466
	adds r0, r2
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, 0x93
	mov r1, sp
	movs r2, 0x3
	bl StringAppendN
_0808A636:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A640: .4byte gUnknown_20397A4
_0808A644: .4byte 0x00000462
_0808A648: .4byte gUnknown_8419CF8
_0808A64C: .4byte 0x00000464
_0808A650: .4byte 0x00000466
	thumb_func_end sub_808A5B8

	thumb_func_start sub_808A654
sub_808A654: @ 808A654
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _0808A6AC @ =gUnknown_20397A4
	ldr r2, [r6]
	ldrb r0, [r2, 0xB]
	cmp r0, 0
	beq _0808A6A2
	ldr r0, _0808A6B0 @ =gUnknown_83CD8E9
	ldrb r5, [r0, 0x1]
	ldr r1, _0808A6B4 @ =gUnknown_83CD940
	ldr r3, _0808A6B8 @ =0x00000457
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r0, _0808A6BC @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r0, _0808A6C0 @ =gUnknown_8419D1A
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r3, 0x23
	bl AddTextPrinterParameterized3
	ldr r0, _0808A6C4 @ =gUnknown_83CD8E3
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, [r6]
	adds r0, 0x93
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r2, 0xA4
	movs r3, 0x23
	bl AddTextPrinterParameterized3
_0808A6A2:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6AC: .4byte gUnknown_20397A4
_0808A6B0: .4byte gUnknown_83CD8E9
_0808A6B4: .4byte gUnknown_83CD940
_0808A6B8: .4byte 0x00000457
_0808A6BC: .4byte gUnknown_83CD8E0
_0808A6C0: .4byte gUnknown_8419D1A
_0808A6C4: .4byte gUnknown_83CD8E3
	thumb_func_end sub_808A654

	thumb_func_start sub_808A6C8
sub_808A6C8: @ 808A6C8
	push {r4,lr}
	sub sp, 0x20
	ldr r4, _0808A740 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldrb r0, [r1, 0xC]
	cmp r0, 0
	beq _0808A736
	adds r0, r1, 0
	adds r0, 0xD9
	ldr r2, _0808A744 @ =gUnknown_83CD944
	ldr r3, _0808A748 @ =0x00000457
	adds r1, r3
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r0, [r4]
	ldr r1, _0808A74C @ =0x0000011f
	adds r0, r1
	ldr r1, _0808A750 @ =gUnknown_8419D4F
	bl StringCopy
	ldr r0, [r4]
	movs r3, 0x8E
	lsls r3, 3
	adds r0, r3
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _0808A754 @ =0x00000165
	adds r0, r1
	mov r1, sp
	bl StringCopy
	ldr r0, [r4]
	ldr r3, _0808A758 @ =0x00000472
	adds r0, r3
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _0808A75C @ =0x000001ab
	adds r0, r1
	mov r1, sp
	bl StringCopy
_0808A736:
	add sp, 0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A740: .4byte gUnknown_20397A4
_0808A744: .4byte gUnknown_83CD944
_0808A748: .4byte 0x00000457
_0808A74C: .4byte 0x0000011f
_0808A750: .4byte gUnknown_8419D4F
_0808A754: .4byte 0x00000165
_0808A758: .4byte 0x00000472
_0808A75C: .4byte 0x000001ab
	thumb_func_end sub_808A6C8

	thumb_func_start sub_808A760
sub_808A760: @ 808A760
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r7, _0808A7EC @ =gUnknown_20397A4
	ldr r3, [r7]
	ldrb r0, [r3, 0xC]
	cmp r0, 0
	beq _0808A7E2
	ldr r0, _0808A7F0 @ =gUnknown_83CD8E9
	ldrb r6, [r0, 0x1]
	ldr r1, _0808A7F4 @ =gUnknown_83CD940
	ldr r2, _0808A7F8 @ =0x00000457
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r5, _0808A7FC @ =gUnknown_83CD8E0
	str r5, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	adds r0, r3, 0
	adds r0, 0xD9
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r3, 0x33
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, [r7]
	ldr r1, _0808A800 @ =0x0000011f
	adds r0, r1
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x82
	movs r3, 0x33
	bl AddTextPrinterParameterized3
	ldr r5, _0808A804 @ =gUnknown_83CD8E3
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, [r7]
	ldr r2, _0808A808 @ =0x00000165
	adds r0, r2
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x90
	movs r3, 0x33
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, 0x4]
	ldr r0, [r7]
	ldr r1, _0808A80C @ =0x000001ab
	adds r0, r1
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0xC0
	movs r3, 0x33
	bl AddTextPrinterParameterized3
_0808A7E2:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A7EC: .4byte gUnknown_20397A4
_0808A7F0: .4byte gUnknown_83CD8E9
_0808A7F4: .4byte gUnknown_83CD940
_0808A7F8: .4byte 0x00000457
_0808A7FC: .4byte gUnknown_83CD8E0
_0808A800: .4byte 0x0000011f
_0808A804: .4byte gUnknown_83CD8E3
_0808A808: .4byte 0x00000165
_0808A80C: .4byte 0x000001ab
	thumb_func_end sub_808A760

	thumb_func_start sub_808A810
sub_808A810: @ 808A810
	push {r4,lr}
	ldr r4, _0808A840 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldrb r0, [r1, 0x10]
	cmp r0, 0
	beq _0808A83A
	ldr r2, _0808A844 @ =0x000001f1
	adds r0, r1, r2
	ldr r1, _0808A848 @ =gUnknown_8419D57
	bl StringCopy
	ldr r1, [r4]
	ldr r2, _0808A84C @ =0x00000237
	adds r0, r1, r2
	ldr r2, _0808A850 @ =0x0000047c
	adds r1, r2
	ldrh r1, [r1]
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
_0808A83A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A840: .4byte gUnknown_20397A4
_0808A844: .4byte 0x000001f1
_0808A848: .4byte gUnknown_8419D57
_0808A84C: .4byte 0x00000237
_0808A850: .4byte 0x0000047c
	thumb_func_end sub_808A810

	thumb_func_start sub_808A854
sub_808A854: @ 808A854
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _0808A8B0 @ =gUnknown_20397A4
	ldr r3, [r6]
	ldrb r0, [r3, 0x10]
	cmp r0, 0
	beq _0808A8A6
	ldr r0, _0808A8B4 @ =gUnknown_83CD8E9
	ldrb r5, [r0, 0x1]
	ldr r1, _0808A8B8 @ =gUnknown_83CD940
	ldr r2, _0808A8BC @ =0x00000457
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r0, _0808A8C0 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r1, _0808A8C4 @ =0x000001f1
	adds r0, r3, r1
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r3, 0x43
	bl AddTextPrinterParameterized3
	ldr r0, _0808A8C8 @ =gUnknown_83CD8E3
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, [r6]
	ldr r2, _0808A8CC @ =0x00000237
	adds r0, r2
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r2, 0xBA
	movs r3, 0x43
	bl AddTextPrinterParameterized3
_0808A8A6:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A8B0: .4byte gUnknown_20397A4
_0808A8B4: .4byte gUnknown_83CD8E9
_0808A8B8: .4byte gUnknown_83CD940
_0808A8BC: .4byte 0x00000457
_0808A8C0: .4byte gUnknown_83CD8E0
_0808A8C4: .4byte 0x000001f1
_0808A8C8: .4byte gUnknown_83CD8E3
_0808A8CC: .4byte 0x00000237
	thumb_func_end sub_808A854

	thumb_func_start sub_808A8D0
sub_808A8D0: @ 808A8D0
	push {r4,lr}
	ldr r4, _0808A908 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldr r2, _0808A90C @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A900
	ldr r2, _0808A910 @ =0x0000027d
	adds r0, r1, r2
	ldr r1, _0808A914 @ =gUnknown_8419D7D
	bl StringCopy
	ldr r1, [r4]
	ldr r2, _0808A918 @ =0x000002c3
	adds r0, r1, r2
	movs r2, 0x93
	lsls r2, 3
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
_0808A900:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A908: .4byte gUnknown_20397A4
_0808A90C: .4byte 0x00000457
_0808A910: .4byte 0x0000027d
_0808A914: .4byte gUnknown_8419D7D
_0808A918: .4byte 0x000002c3
	thumb_func_end sub_808A8D0

	thumb_func_start sub_808A91C
sub_808A91C: @ 808A91C
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _0808A984 @ =gUnknown_20397A4
	ldr r3, [r6]
	ldr r0, _0808A988 @ =0x00000457
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _0808A97A
	movs r1, 0x93
	lsls r1, 3
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _0808A97A
	ldr r0, _0808A98C @ =gUnknown_83CD8E9
	ldrb r5, [r0, 0x1]
	ldr r1, _0808A990 @ =gUnknown_83CD940
	ldrb r0, [r2]
	adds r0, r1
	ldrb r2, [r0]
	ldr r0, _0808A994 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r1, _0808A998 @ =0x0000027d
	adds r0, r3, r1
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r3, 0x63
	bl AddTextPrinterParameterized3
	ldr r0, _0808A99C @ =gUnknown_83CD8E3
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, [r6]
	ldr r1, _0808A9A0 @ =0x000002c3
	adds r0, r1
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r2, 0xBA
	movs r3, 0x63
	bl AddTextPrinterParameterized3
_0808A97A:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A984: .4byte gUnknown_20397A4
_0808A988: .4byte 0x00000457
_0808A98C: .4byte gUnknown_83CD8E9
_0808A990: .4byte gUnknown_83CD940
_0808A994: .4byte gUnknown_83CD8E0
_0808A998: .4byte 0x0000027d
_0808A99C: .4byte gUnknown_83CD8E3
_0808A9A0: .4byte 0x000002c3
	thumb_func_end sub_808A91C

	thumb_func_start sub_808A9A4
sub_808A9A4: @ 808A9A4
	push {r4,lr}
	ldr r4, _0808A9D8 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldr r2, _0808A9DC @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A9D2
	ldr r2, _0808A9E0 @ =0x00000309
	adds r0, r1, r2
	ldr r1, _0808A9E4 @ =gUnknown_8419D66
	bl StringCopy
	ldr r1, [r4]
	ldr r2, _0808A9E8 @ =0x0000034f
	adds r0, r1, r2
	ldr r2, _0808A9EC @ =0x0000049c
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
_0808A9D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A9D8: .4byte gUnknown_20397A4
_0808A9DC: .4byte 0x00000457
_0808A9E0: .4byte 0x00000309
_0808A9E4: .4byte gUnknown_8419D66
_0808A9E8: .4byte 0x0000034f
_0808A9EC: .4byte 0x0000049c
	thumb_func_end sub_808A9A4

	thumb_func_start sub_808A9F0
sub_808A9F0: @ 808A9F0
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _0808AA54 @ =gUnknown_20397A4
	ldr r3, [r6]
	ldr r0, _0808AA58 @ =0x00000457
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _0808AA4C
	ldr r1, _0808AA5C @ =0x0000049c
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _0808AA4C
	ldr r0, _0808AA60 @ =gUnknown_83CD8E9
	ldrb r5, [r0, 0x1]
	ldr r1, _0808AA64 @ =gUnknown_83CD940
	ldrb r0, [r2]
	adds r0, r1
	ldrb r2, [r0]
	ldr r0, _0808AA68 @ =gUnknown_83CD8E0
	str r0, [sp]
	movs r4, 0x1
	negs r4, r4
	str r4, [sp, 0x4]
	ldr r1, _0808AA6C @ =0x00000309
	adds r0, r3, r1
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r3, 0x53
	bl AddTextPrinterParameterized3
	ldr r0, _0808AA70 @ =gUnknown_83CD8E3
	str r0, [sp]
	str r4, [sp, 0x4]
	ldr r0, [r6]
	ldr r1, _0808AA74 @ =0x0000034f
	adds r0, r1
	str r0, [sp, 0x8]
	movs r0, 0x1
	adds r1, r5, 0
	movs r2, 0xBA
	movs r3, 0x53
	bl AddTextPrinterParameterized3
_0808AA4C:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808AA54: .4byte gUnknown_20397A4
_0808AA58: .4byte 0x00000457
_0808AA5C: .4byte 0x0000049c
_0808AA60: .4byte gUnknown_83CD8E9
_0808AA64: .4byte gUnknown_83CD940
_0808AA68: .4byte gUnknown_83CD8E0
_0808AA6C: .4byte 0x00000309
_0808AA70: .4byte gUnknown_83CD8E3
_0808AA74: .4byte 0x0000034f
	thumb_func_end sub_808A9F0

	thumb_func_start sub_808AA78
sub_808AA78: @ 808AA78
	push {r4,r5,lr}
	sub sp, 0x20
	ldr r1, _0808AB00 @ =gUnknown_83CD94C
	add r0, sp, 0x10
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x18
	ldr r1, _0808AB04 @ =gUnknown_83CD952
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	ldr r0, _0808AB08 @ =gUnknown_20397A4
	ldr r0, [r0]
	ldr r1, _0808AB0C @ =0x00000457
	adds r0, r1
	ldrb r0, [r0]
	adds r5, r4, 0
	cmp r0, 0x1
	beq _0808AAF8
	movs r4, 0
_0808AAA4:
	ldr r0, _0808AB08 @ =gUnknown_20397A4
	ldr r0, [r0]
	lsls r1, r4, 1
	movs r2, 0x96
	lsls r2, 3
	adds r0, r2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	beq _0808AAEE
	bl sub_8097218
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 20
	movs r2, 0xE0
	lsls r2, 16
	adds r1, r2
	lsrs r1, 16
	adds r2, r5, r4
	ldrb r2, [r2]
	adds r2, 0x3
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x4
	str r3, [sp]
	str r3, [sp, 0x4]
	add r0, sp
	adds r0, 0x10
	ldrb r0, [r0]
	str r0, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0xC]
	movs r0, 0x3
	movs r3, 0xF
	bl WriteSequenceToBgTilemapBuffer
_0808AAEE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0808AAA4
_0808AAF8:
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB00: .4byte gUnknown_83CD94C
_0808AB04: .4byte gUnknown_83CD952
_0808AB08: .4byte gUnknown_20397A4
_0808AB0C: .4byte 0x00000457
	thumb_func_end sub_808AA78

	thumb_func_start sub_808AB10
sub_808AB10: @ 808AB10
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _0808AB40 @ =gUnknown_83D3740
	ldr r4, _0808AB44 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldr r5, _0808AB48 @ =0x00000396
	adds r1, r5
	movs r2, 0x60
	bl CpuSet
	ldr r4, [r4]
	ldr r1, _0808AB4C @ =0x000004aa
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808AB50
	cmp r0, 0x1
	ble _0808AB88
	cmp r0, 0x2
	beq _0808AB68
	cmp r0, 0x3
	beq _0808AB80
	b _0808AB88
	.align 2, 0
_0808AB40: .4byte gUnknown_83D3740
_0808AB44: .4byte gUnknown_20397A4
_0808AB48: .4byte 0x00000396
_0808AB4C: .4byte 0x000004aa
_0808AB50:
	ldr r2, _0808AB64 @ =0x00000396
	adds r0, r4, r2
	movs r1, 0
	str r1, [sp]
	movs r1, 0x60
	movs r2, 0
	movs r3, 0
	bl sub_8071660
	b _0808AB88
	.align 2, 0
_0808AB64: .4byte 0x00000396
_0808AB68:
	adds r0, r4, r5
	movs r2, 0xFA
	lsls r2, 1
	movs r3, 0xA5
	lsls r3, 1
	movs r1, 0x9B
	lsls r1, 1
	str r1, [sp]
	movs r1, 0x60
	bl sub_8071660
	b _0808AB88
_0808AB80:
	adds r0, r4, r5
	movs r1, 0x60
	bl TintPalette_SepiaTone
_0808AB88:
	ldr r0, _0808ABD8 @ =gUnknown_20397A4
	ldr r0, [r0]
	ldr r1, _0808ABDC @ =0x00000396
	adds r0, r1
	movs r1, 0x50
	movs r2, 0xC0
	bl LoadPalette
	movs r4, 0
_0808AB9A:
	ldr r0, _0808ABD8 @ =gUnknown_20397A4
	ldr r0, [r0]
	lsls r1, r4, 1
	movs r2, 0x96
	lsls r2, 3
	adds r0, r2
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0
	bl sub_8097028
	adds r1, r0, 0
	lsls r3, r4, 20
	movs r0, 0x80
	lsls r0, 14
	adds r3, r0
	lsrs r3, 16
	movs r0, 0x3
	movs r2, 0x80
	lsls r2, 2
	bl LoadBgTiles
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0808AB9A
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808ABD8: .4byte gUnknown_20397A4
_0808ABDC: .4byte 0x00000396
	thumb_func_end sub_808AB10

	thumb_func_start sub_808ABE0
sub_808ABE0: @ 808ABE0
	push {r4,lr}
	sub sp, 0x14
	ldr r1, _0808AC5C @ =gUnknown_83CD958
	add r0, sp, 0x10
	movs r2, 0x4
	bl memcpy
	ldr r0, _0808AC60 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r2, _0808AC64 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808AC52
	adds r2, 0x51
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0808AC52
	movs r4, 0
_0808AC08:
	ldr r0, _0808AC60 @ =gUnknown_20397A4
	ldr r0, [r0]
	ldr r1, _0808AC68 @ =0x000004ac
	adds r0, r1
	adds r0, r4
	ldrb r3, [r0]
	cmp r3, 0
	beq _0808AC48
	lsls r1, r4, 18
	movs r2, 0xA0
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	lsls r2, r4, 1
	adds r2, r4
	adds r2, 0x2
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x2
	str r0, [sp]
	str r0, [sp, 0x4]
	subs r0, r3, 0x1
	add r0, sp
	adds r0, 0x10
	ldrb r0, [r0]
	str r0, [sp, 0x8]
	movs r0, 0x1
	str r0, [sp, 0xC]
	movs r0, 0x3
	movs r3, 0x2
	bl WriteSequenceToBgTilemapBuffer
_0808AC48:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0808AC08
_0808AC52:
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC5C: .4byte gUnknown_83CD958
_0808AC60: .4byte gUnknown_20397A4
_0808AC64: .4byte 0x00000457
_0808AC68: .4byte 0x000004ac
	thumb_func_end sub_808ABE0

	thumb_func_start sub_808AC6C
sub_808AC6C: @ 808AC6C
	push {lr}
	ldr r0, _0808ACB0 @ =gUnknown_83CD320
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0808ACB4 @ =gUnknown_83CD340
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0808ACB8 @ =gUnknown_83CD360
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0808ACBC @ =gUnknown_83CD380
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0808ACC0 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r0, _0808ACC4 @ =0x000016cc
	adds r1, r0
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x3
	movs r3, 0x80
	bl LoadBgTiles
	pop {r0}
	bx r0
	.align 2, 0
_0808ACB0: .4byte gUnknown_83CD320
_0808ACB4: .4byte gUnknown_83CD340
_0808ACB8: .4byte gUnknown_83CD360
_0808ACBC: .4byte gUnknown_83CD380
_0808ACC0: .4byte gUnknown_20397A4
_0808ACC4: .4byte 0x000016cc
	thumb_func_end sub_808AC6C

	thumb_func_start sub_808ACC8
sub_808ACC8: @ 808ACC8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808ACC8

	thumb_func_start sub_808ACE4
sub_808ACE4: @ 808ACE4
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _0808AD00 @ =gUnknown_20397A4
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0x6
	bls _0808ACF4
	b _0808AE44
_0808ACF4:
	lsls r0, 2
	ldr r1, _0808AD04 @ =_0808AD08
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808AD00: .4byte gUnknown_20397A4
_0808AD04: .4byte _0808AD08
	.align 2, 0
_0808AD08:
	.4byte _0808AD24
	.4byte _0808AD3C
	.4byte _0808AD58
	.4byte _0808AD98
	.4byte _0808ADC4
	.4byte _0808AE0C
	.4byte _0808AE1C
_0808AD24:
	ldr r0, _0808AD34 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r0, _0808AD38 @ =0x000012cc
	adds r1, r0
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x3
	b _0808AD48
	.align 2, 0
_0808AD34: .4byte gUnknown_20397A4
_0808AD38: .4byte 0x000012cc
_0808AD3C:
	ldr r0, _0808AD50 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r2, _0808AD54 @ =0x000018cc
	adds r1, r2
	subs r2, 0xCC
	movs r0, 0
_0808AD48:
	movs r3, 0
	bl LoadBgTiles
	b _0808AE7A
	.align 2, 0
_0808AD50: .4byte gUnknown_20397A4
_0808AD54: .4byte 0x000018cc
_0808AD58:
	ldr r0, _0808AD6C @ =gUnknown_20397A4
	ldr r2, [r0]
	ldr r3, _0808AD70 @ =0x00000457
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0808AD78
	ldr r1, _0808AD74 @ =gUnknown_83CD8B8
	adds r3, 0x6
	b _0808AD7C
	.align 2, 0
_0808AD6C: .4byte gUnknown_20397A4
_0808AD70: .4byte 0x00000457
_0808AD74: .4byte gUnknown_83CD8B8
_0808AD78:
	ldr r1, _0808AD90 @ =gUnknown_83CD8CC
	ldr r3, _0808AD94 @ =0x0000045d
_0808AD7C:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	b _0808AE7A
	.align 2, 0
_0808AD90: .4byte gUnknown_83CD8CC
_0808AD94: .4byte 0x0000045d
_0808AD98:
	ldr r0, _0808ADAC @ =gUnknown_20397A4
	ldr r0, [r0]
	ldr r1, _0808ADB0 @ =0x00000457
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0808ADB8
	ldr r0, _0808ADB4 @ =gUnknown_83CD2C0
	movs r1, 0x30
	b _0808AE10
	.align 2, 0
_0808ADAC: .4byte gUnknown_20397A4
_0808ADB0: .4byte 0x00000457
_0808ADB4: .4byte gUnknown_83CD2C0
_0808ADB8:
	ldr r0, _0808ADC0 @ =gUnknown_83CD2E0
	movs r1, 0x30
	b _0808AE10
	.align 2, 0
_0808ADC0: .4byte gUnknown_83CD2E0
_0808ADC4:
	ldr r0, _0808ADE4 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldr r2, _0808ADE8 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0808ADF4
	ldr r3, _0808ADEC @ =0x0000045c
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808AE7A
	ldr r0, _0808ADF0 @ =gUnknown_83CD280
	movs r1, 0x10
	b _0808AE10
	.align 2, 0
_0808ADE4: .4byte gUnknown_20397A4
_0808ADE8: .4byte 0x00000457
_0808ADEC: .4byte 0x0000045c
_0808ADF0: .4byte gUnknown_83CD280
_0808ADF4:
	ldr r2, _0808AE04 @ =0x0000045c
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808AE7A
	ldr r0, _0808AE08 @ =gUnknown_83CD2A0
	movs r1, 0x10
	b _0808AE10
	.align 2, 0
_0808AE04: .4byte 0x0000045c
_0808AE08: .4byte gUnknown_83CD2A0
_0808AE0C:
	ldr r0, _0808AE18 @ =gUnknown_83CD300
	movs r1, 0x40
_0808AE10:
	movs r2, 0x20
	bl LoadPalette
	b _0808AE7A
	.align 2, 0
_0808AE18: .4byte gUnknown_83CD300
_0808AE1C:
	ldr r4, _0808AE38 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldr r3, _0808AE3C @ =0x00003bcc
	adds r1, r3
	movs r0, 0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0808AE40 @ =0x00005bcc
	adds r1, r0
	movs r0, 0x2
	bl SetBgTilemapBuffer
	b _0808AE7A
	.align 2, 0
_0808AE38: .4byte gUnknown_20397A4
_0808AE3C: .4byte 0x00003bcc
_0808AE40: .4byte 0x00005bcc
_0808AE44:
	movs r4, 0x20
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x1
	b _0808AE86
_0808AE7A:
	ldr r0, _0808AE90 @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	movs r0, 0
_0808AE86:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808AE90: .4byte gUnknown_20397A4
	thumb_func_end sub_808ACE4

	thumb_func_start sub_808AE94
sub_808AE94: @ 808AE94
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r0, _0808AECC @ =gUnknown_20397A4
	ldr r0, [r0]
	ldr r1, _0808AED0 @ =0x00005bcc
	adds r6, r0, r1
	movs r1, 0
_0808AEA2:
	movs r2, 0
	lsls r5, r1, 16
	asrs r1, r5, 16
	lsls r3, r1, 5
	lsls r0, r1, 4
	subs r0, r1
	lsls r4, r0, 1
_0808AEB0:
	lsls r0, r2, 16
	asrs r1, r0, 16
	adds r2, r0, 0
	cmp r1, 0x1D
	bgt _0808AED4
	adds r0, r3, r1
	lsls r0, 1
	adds r0, r6
	adds r1, r4, r1
	lsls r1, 1
	adds r1, r7
	ldrh r1, [r1]
	b _0808AEDC
	.align 2, 0
_0808AECC: .4byte gUnknown_20397A4
_0808AED0: .4byte 0x00005bcc
_0808AED4:
	adds r0, r3, r1
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r7]
_0808AEDC:
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 9
	adds r0, r2, r1
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	ble _0808AEB0
	adds r0, r5, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0808AEA2
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808AE94

	thumb_func_start sub_808AF04
sub_808AF04: @ 808AF04
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r0, _0808AF3C @ =gUnknown_20397A4
	ldr r0, [r0]
	ldr r1, _0808AF40 @ =0x00003bcc
	adds r6, r0, r1
	movs r1, 0
_0808AF12:
	movs r2, 0
	lsls r5, r1, 16
	asrs r1, r5, 16
	lsls r3, r1, 5
	lsls r0, r1, 4
	subs r0, r1
	lsls r4, r0, 1
_0808AF20:
	lsls r0, r2, 16
	asrs r1, r0, 16
	adds r2, r0, 0
	cmp r1, 0x1D
	bgt _0808AF44
	adds r0, r3, r1
	lsls r0, 1
	adds r0, r6
	adds r1, r4, r1
	lsls r1, 1
	adds r1, r7
	ldrh r1, [r1]
	b _0808AF4C
	.align 2, 0
_0808AF3C: .4byte gUnknown_20397A4
_0808AF40: .4byte 0x00003bcc
_0808AF44:
	adds r0, r3, r1
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r7]
_0808AF4C:
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 9
	adds r0, r2, r1
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	ble _0808AF20
	adds r0, r5, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0808AF12
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808AF04

	thumb_func_start sub_808AF74
sub_808AF74: @ 808AF74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0xC0
	mov r8, r0
	movs r2, 0x3
	mov r10, r2
	ldr r2, _0808B080 @ =gUnknown_83CD95C
	ldr r4, _0808B084 @ =gUnknown_20397A4
	ldr r1, [r4]
	ldr r3, _0808B088 @ =0x00000457
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r0, r2
	ldrb r3, [r0]
	ldr r0, _0808B08C @ =0x0000045d
	adds r1, r0
	ldrb r0, [r1]
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x4
	str r0, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x8F
	movs r2, 0xF
	bl FillBgTilemapBufferRect
	ldr r0, [r4]
	ldrb r0, [r0, 0x5]
	cmp r0, 0
	bne _0808B068
	movs r2, 0x4
	mov r9, r2
	movs r2, 0
	movs r6, 0x1
_0808AFC2:
	ldr r0, _0808B084 @ =gUnknown_20397A4
	ldr r1, [r0]
	lsls r0, r2, 16
	asrs r7, r0, 16
	adds r1, 0x11
	adds r1, r7
	ldrb r0, [r1]
	cmp r0, 0
	beq _0808B044
	mov r3, r9
	lsls r5, r3, 24
	lsrs r5, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	movs r0, 0x3
	mov r1, r8
	adds r2, r5, 0
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	mov r1, r8
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	mov r4, r9
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r2, r10
	str r2, [sp, 0x8]
	movs r0, 0x3
	adds r2, r4, 0
	movs r3, 0x10
	bl FillBgTilemapBufferRect
	mov r1, r8
	adds r1, 0x10
	lsls r1, 16
	lsrs r1, 16
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r3, r10
	str r3, [sp, 0x8]
	movs r0, 0x3
	adds r2, r5, 0
	movs r3, 0x11
	bl FillBgTilemapBufferRect
	mov r1, r8
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	str r6, [sp]
	str r6, [sp, 0x4]
	mov r0, r10
	str r0, [sp, 0x8]
	movs r0, 0x3
	adds r2, r4, 0
	movs r3, 0x11
	bl FillBgTilemapBufferRect
_0808B044:
	adds r0, r7, 0x1
	lsls r0, 16
	mov r1, r8
	adds r1, 0x2
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	mov r2, r9
	lsls r1, r2, 16
	movs r3, 0xC0
	lsls r3, 10
	adds r1, r3
	lsrs r1, 16
	mov r9, r1
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0808AFC2
_0808B068:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B080: .4byte gUnknown_83CD95C
_0808B084: .4byte gUnknown_20397A4
_0808B088: .4byte 0x00000457
_0808B08C: .4byte 0x0000045d
	thumb_func_end sub_808AF74

	thumb_func_start sub_808B090
sub_808B090: @ 808B090
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r6, _0808B138 @ =gUnknown_20397A4
	ldr r1, [r6]
	ldr r2, _0808B13C @ =0x00000457
	adds r0, r1, r2
	ldrb r5, [r0]
	cmp r5, 0x1
	beq _0808B144
	ldrb r0, [r1, 0x10]
	cmp r0, 0
	beq _0808B0CE
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x8D
	movs r2, 0x1A
	movs r3, 0x9
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x9D
	movs r2, 0x1A
	movs r3, 0xA
	bl FillBgTilemapBufferRect
_0808B0CE:
	ldr r0, [r6]
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _0808B102
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x8D
	movs r2, 0x15
	movs r3, 0xD
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x9D
	movs r2, 0x15
	movs r3, 0xE
	bl FillBgTilemapBufferRect
_0808B102:
	ldr r0, [r6]
	ldr r2, _0808B140 @ =0x0000049c
	adds r0, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _0808B170
	movs r4, 0x1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x8D
	movs r2, 0x1B
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x9D
	movs r2, 0x1B
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	b _0808B170
	.align 2, 0
_0808B138: .4byte gUnknown_20397A4
_0808B13C: .4byte 0x00000457
_0808B140: .4byte 0x0000049c
_0808B144:
	ldrb r0, [r1, 0x10]
	cmp r0, 0
	beq _0808B170
	str r5, [sp]
	str r5, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x8D
	movs r2, 0x1A
	movs r3, 0x9
	bl FillBgTilemapBufferRect
	str r5, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x3
	movs r1, 0x9D
	movs r2, 0x1A
	movs r3, 0xA
	bl FillBgTilemapBufferRect
_0808B170:
	movs r0, 0x3
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_808B090

	thumb_func_start sub_808B180
sub_808B180: @ 808B180
	push {lr}
	ldr r3, _0808B1B4 @ =gUnknown_20397A4
	ldr r1, [r3]
	ldrb r0, [r1, 0x6]
	adds r0, 0x1
	strb r0, [r1, 0x6]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3C
	bls _0808B1AE
	ldr r1, [r3]
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r2, [r3]
	ldrb r0, [r2, 0x7]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2, 0x7]
	ldr r0, [r3]
	ldr r1, _0808B1B8 @ =0x00007bce
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0808B1AE:
	pop {r0}
	bx r0
	.align 2, 0
_0808B1B4: .4byte gUnknown_20397A4
_0808B1B8: .4byte 0x00007bce
	thumb_func_end sub_808B180

	thumb_func_start sub_808B1BC
sub_808B1BC: @ 808B1BC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0808B1D0 @ =gTrainerCards
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldrb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_0808B1D0: .4byte gTrainerCards
	thumb_func_end sub_808B1BC

	thumb_func_start sub_808B1D4
sub_808B1D4: @ 808B1D4
	push {r4,lr}
	ldr r4, _0808B1F4 @ =sub_808B21C
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	ldr r0, _0808B1F8 @ =sub_8089034
	bl SetHBlankCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B1F4: .4byte sub_808B21C
_0808B1F8: .4byte sub_8089034
	thumb_func_end sub_808B1D4

	thumb_func_start sub_808B1FC
sub_808B1FC: @ 808B1FC
	push {lr}
	ldr r0, _0808B210 @ =sub_808B21C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0808B214
	movs r0, 0
	b _0808B216
	.align 2, 0
_0808B210: .4byte sub_808B21C
_0808B214:
	movs r0, 0x1
_0808B216:
	pop {r1}
	bx r1
	thumb_func_end sub_808B1FC

	thumb_func_start sub_808B21C
sub_808B21C: @ 808B21C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0808B24C @ =gUnknown_83CD908
	ldr r2, _0808B250 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0808B22E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0808B22E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B24C: .4byte gUnknown_83CD908
_0808B250: .4byte gTasks
	thumb_func_end sub_808B21C

	thumb_func_start sub_808B254
sub_808B254: @ 808B254
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl HideBg
	movs r0, 0x3
	bl HideBg
	bl ScanlineEffect_Stop
	bl ScanlineEffect_Clear
	movs r1, 0
	ldr r0, _0808B290 @ =gScanlineEffectRegBuffers
	movs r2, 0
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
_0808B278:
	strh r2, [r0]
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	bls _0808B278
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808B290: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_808B254

	thumb_func_start sub_808B294
sub_808B294: @ 808B294
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	ldr r0, _0808B2C0 @ =gUnknown_20397A4
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x9]
	mov r0, r8
	ldrh r1, [r0, 0xA]
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0x4C
	ble _0808B2C4
	movs r0, 0x4D
	mov r3, r8
	strh r0, [r3, 0xA]
	b _0808B2CA
	.align 2, 0
_0808B2C0: .4byte gUnknown_20397A4
_0808B2C4:
	adds r0, r1, 0x7
	mov r4, r8
	strh r0, [r4, 0xA]
_0808B2CA:
	ldr r0, _0808B3B4 @ =gUnknown_20397A4
	ldr r0, [r0]
	mov r2, r8
	ldrh r1, [r2, 0xA]
	ldr r3, _0808B3B8 @ =0x00007bcc
	adds r0, r3
	strh r1, [r0]
	ldrh r0, [r2, 0xA]
	bl sub_8089BD8
	mov r4, r8
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r0, 0xA0
	subs r0, r7
	mov r9, r0
	subs r4, r0, r7
	negs r0, r7
	lsls r6, r0, 16
	movs r0, 0xA0
	lsls r0, 16
	adds r1, r4, 0
	bl __udivsi3
	adds r5, r0, 0
	ldr r1, _0808B3BC @ =0xffff0000
	adds r5, r1
	adds r0, r5, 0
	muls r0, r4
	adds r0, r6, r0
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r4, 0
	bl __udivsi3
	mov r10, r0
	lsls r5, 1
	movs r2, 0
	cmp r2, r7
	bcs _0808B334
	ldr r3, _0808B3C0 @ =gScanlineEffectRegBuffers
_0808B31C:
	lsls r0, r2, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r3
	negs r2, r0
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r7
	bcc _0808B31C
_0808B334:
	lsls r1, r2, 16
	mov r3, r9
	lsls r0, r3, 16
	asrs r3, r0, 16
	ldr r4, _0808B3B4 @ =gUnknown_20397A4
	mov r9, r4
	ldr r4, [sp]
	lsrs r7, r4, 16
	cmp r1, r0
	bge _0808B36C
	ldr r0, _0808B3C0 @ =gScanlineEffectRegBuffers
	mov r12, r0
	adds r4, r3, 0
_0808B34E:
	lsrs r3, r6, 16
	adds r6, r5
	mov r2, r10
	subs r5, r2
	asrs r0, r1, 16
	lsls r1, r0, 1
	add r1, r12
	strh r3, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, r4
	blt _0808B34E
_0808B36C:
	adds r3, r7, 0
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _0808B38A
	ldr r2, _0808B3C0 @ =gScanlineEffectRegBuffers
_0808B378:
	asrs r0, r1, 16
	lsls r1, r0, 1
	adds r1, r2
	strh r3, [r1]
	adds r0, 0x1
	lsls r1, r0, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _0808B378
_0808B38A:
	mov r3, r9
	ldr r0, [r3]
	movs r1, 0x1
	strb r1, [r0, 0x9]
	mov r4, r8
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x4C
	ble _0808B3A2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808B3A2:
	movs r0, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808B3B4: .4byte gUnknown_20397A4
_0808B3B8: .4byte 0x00007bcc
_0808B3BC: .4byte 0xffff0000
_0808B3C0: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_808B294

	thumb_func_start sub_808B3C4
sub_808B3C4: @ 808B3C4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r4, _0808B3F0 @ =gUnknown_20397A4
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x9]
	bl sub_8058244
	adds r2, r4, 0
	cmp r0, 0x1
	beq _0808B4C4
_0808B3DC:
	ldr r3, [r2]
	ldrb r0, [r3, 0x4]
	cmp r0, 0x4
	bhi _0808B4A0
	lsls r0, 2
	ldr r1, _0808B3F4 @ =_0808B3F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B3F0: .4byte gUnknown_20397A4
_0808B3F4: .4byte _0808B3F8
	.align 2, 0
_0808B3F8:
	.4byte _0808B40C
	.4byte _0808B428
	.4byte _0808B448
	.4byte _0808B46C
	.4byte _0808B48A
_0808B40C:
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	b _0808B4B2
_0808B428:
	ldr r0, [r2]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0808B43C
	bl sub_8089E40
	lsls r0, 24
	cmp r0, 0
	bne _0808B4B2
	b _0808B4C4
_0808B43C:
	bl sub_8089DC8
	lsls r0, 24
	cmp r0, 0
	bne _0808B4B2
	b _0808B4C4
_0808B448:
	ldr r0, _0808B45C @ =gUnknown_20397A4
	ldr r1, [r0]
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	bne _0808B464
	ldr r2, _0808B460 @ =0x0000096c
	adds r0, r1, r2
	bl sub_808AF04
	b _0808B4B2
	.align 2, 0
_0808B45C: .4byte gUnknown_20397A4
_0808B460: .4byte 0x0000096c
_0808B464:
	movs r0, 0x1
	bl sub_808ACC8
	b _0808B4B2
_0808B46C:
	ldr r0, _0808B47C @ =gUnknown_20397A4
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0808B480
	bl sub_808B090
	b _0808B4B2
	.align 2, 0
_0808B47C: .4byte gUnknown_20397A4
_0808B480:
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	b _0808B4B2
_0808B48A:
	ldr r0, _0808B49C @ =gUnknown_20397A4
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _0808B4B2
	bl sub_808B838
	b _0808B4B2
	.align 2, 0
_0808B49C: .4byte gUnknown_20397A4
_0808B4A0:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x8]
	movs r0, 0x1
	strb r0, [r3, 0x9]
	ldr r0, [r2]
	strb r1, [r0, 0x4]
	b _0808B4C4
_0808B4B2:
	ldr r2, _0808B4D0 @ =gUnknown_20397A4
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	ldr r0, _0808B4D4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808B3DC
_0808B4C4:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808B4D0: .4byte gUnknown_20397A4
_0808B4D4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_808B3C4

	thumb_func_start sub_808B4D8
sub_808B4D8: @ 808B4D8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0808B534 @ =gUnknown_20397A4
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1, 0x9]
	ldr r0, [r4]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _0808B50A
	movs r0, 0x2
	bl sub_808ACC8
	ldr r0, [r4]
	ldr r1, _0808B538 @ =0x00000e1c
	adds r0, r1
	bl sub_808AE94
	ldr r0, [r4]
	ldr r1, _0808B53C @ =0x000004bc
	adds r0, r1
	bl sub_808AF04
	bl sub_808AF74
_0808B50A:
	movs r0, 0x1
	bl sub_808ACC8
	ldr r2, [r4]
	ldrb r0, [r2, 0x8]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2, 0x8]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldr r1, [r4]
	movs r0, 0x1
	strb r0, [r1, 0x9]
	movs r0, 0xF3
	bl PlaySE
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808B534: .4byte gUnknown_20397A4
_0808B538: .4byte 0x00000e1c
_0808B53C: .4byte 0x000004bc
	thumb_func_end sub_808B4D8

	thumb_func_start sub_808B540
sub_808B540: @ 808B540
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	ldr r0, _0808B568 @ =gUnknown_20397A4
	ldr r0, [r0]
	movs r2, 0
	strb r2, [r0, 0x9]
	mov r0, r8
	ldrh r1, [r0, 0xA]
	movs r3, 0xA
	ldrsh r0, [r0, r3]
	cmp r0, 0x5
	bgt _0808B56C
	mov r4, r8
	strh r2, [r4, 0xA]
	b _0808B572
	.align 2, 0
_0808B568: .4byte gUnknown_20397A4
_0808B56C:
	subs r0, r1, 0x5
	mov r1, r8
	strh r0, [r1, 0xA]
_0808B572:
	ldr r0, _0808B65C @ =gUnknown_20397A4
	ldr r0, [r0]
	mov r2, r8
	ldrh r1, [r2, 0xA]
	ldr r3, _0808B660 @ =0x00007bcc
	adds r0, r3
	strh r1, [r0]
	ldrh r0, [r2, 0xA]
	bl sub_8089BD8
	mov r4, r8
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r0, 0xA0
	subs r0, r7
	mov r9, r0
	subs r4, r0, r7
	negs r0, r7
	lsls r6, r0, 16
	movs r0, 0xA0
	lsls r0, 16
	adds r1, r4, 0
	bl __udivsi3
	adds r5, r0, 0
	ldr r1, _0808B664 @ =0xffff0000
	adds r5, r1
	adds r0, r5, 0
	muls r0, r4
	adds r0, r6, r0
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r4, 0
	bl __udivsi3
	mov r10, r0
	lsrs r5, 1
	movs r2, 0
	cmp r2, r7
	bcs _0808B5DC
	ldr r3, _0808B668 @ =gScanlineEffectRegBuffers
_0808B5C4:
	lsls r0, r2, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r3
	negs r2, r0
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r7
	bcc _0808B5C4
_0808B5DC:
	lsls r1, r2, 16
	mov r3, r9
	lsls r0, r3, 16
	asrs r3, r0, 16
	ldr r4, _0808B65C @ =gUnknown_20397A4
	mov r9, r4
	ldr r4, [sp]
	lsrs r7, r4, 16
	cmp r1, r0
	bge _0808B612
	ldr r0, _0808B668 @ =gScanlineEffectRegBuffers
	mov r12, r0
	adds r4, r3, 0
_0808B5F6:
	lsrs r3, r6, 16
	adds r6, r5
	add r5, r10
	asrs r0, r1, 16
	lsls r1, r0, 1
	add r1, r12
	strh r3, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, r4
	blt _0808B5F6
_0808B612:
	adds r3, r7, 0
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _0808B630
	ldr r2, _0808B668 @ =gScanlineEffectRegBuffers
_0808B61E:
	asrs r0, r1, 16
	lsls r1, r0, 1
	adds r1, r2
	strh r3, [r1]
	adds r0, 0x1
	lsls r1, r0, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _0808B61E
_0808B630:
	mov r1, r9
	ldr r0, [r1]
	movs r1, 0x1
	strb r1, [r0, 0x9]
	mov r2, r8
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bgt _0808B648
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_0808B648:
	movs r0, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808B65C: .4byte gUnknown_20397A4
_0808B660: .4byte 0x00007bcc
_0808B664: .4byte 0xffff0000
_0808B668: .4byte gScanlineEffectRegBuffers
	thumb_func_end sub_808B540

	thumb_func_start sub_808B66C
sub_808B66C: @ 808B66C
	push {lr}
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	movs r0, 0
	bl SetHBlankCallback
	ldr r0, _0808B694 @ =sub_808B21C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808B694: .4byte sub_808B21C
	thumb_func_end sub_808B66C

	thumb_func_start sub_808B698
sub_808B698: @ 808B698
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0808B6C0 @ =gUnknown_20397A4
	ldr r0, _0808B6C4 @ =0x00007bd0
	bl AllocZeroed
	str r0, [r5]
	movs r1, 0x8B
	lsls r1, 3
	adds r0, r1
	str r4, [r0]
	bl InUnionRoom
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0808B6C8
	ldr r0, [r5]
	strb r1, [r0, 0x5]
	b _0808B6CE
	.align 2, 0
_0808B6C0: .4byte gUnknown_20397A4
_0808B6C4: .4byte 0x00007bd0
_0808B6C8:
	ldr r1, [r5]
	movs r0, 0
	strb r0, [r1, 0x5]
_0808B6CE:
	ldr r2, _0808B6F0 @ =gUnknown_20397A4
	ldr r0, [r2]
	ldr r1, _0808B6F4 @ =0x00007bcf
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _0808B6F8 @ =0x0000045c
	adds r0, r1
	bl sub_80898E8
	ldr r0, _0808B6FC @ =sub_80895B8
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B6F0: .4byte gUnknown_20397A4
_0808B6F4: .4byte 0x00007bcf
_0808B6F8: .4byte 0x0000045c
_0808B6FC: .4byte sub_80895B8
	thumb_func_end sub_808B698

	thumb_func_start sub_808B700
sub_808B700: @ 808B700
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0808B758 @ =gUnknown_20397A4
	ldr r0, _0808B75C @ =0x00007bd0
	bl AllocZeroed
	str r0, [r5]
	movs r2, 0x8B
	lsls r2, 3
	adds r1, r0, r2
	str r6, [r1]
	movs r1, 0x1
	strb r1, [r0, 0x5]
	ldr r0, [r5]
	ldr r1, _0808B760 @ =0x0000045c
	adds r0, r1
	ldr r2, _0808B764 @ =gTrainerCards
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 5
	adds r1, r2
	movs r2, 0x60
	bl memcpy
	ldr r1, [r5]
	ldr r2, _0808B768 @ =gLinkPlayers
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x1A]
	ldr r2, _0808B76C @ =0x00007bcf
	adds r1, r2
	strb r0, [r1]
	ldr r0, _0808B770 @ =sub_80895B8
	bl SetMainCallback2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B758: .4byte gUnknown_20397A4
_0808B75C: .4byte 0x00007bd0
_0808B760: .4byte 0x0000045c
_0808B764: .4byte gTrainerCards
_0808B768: .4byte gLinkPlayers
_0808B76C: .4byte 0x00007bcf
_0808B770: .4byte sub_80895B8
	thumb_func_end sub_808B700

	thumb_func_start sub_808B774
sub_808B774: @ 808B774
	push {r4,r5,lr}
	ldr r4, _0808B7B0 @ =gUnknown_20397A4
	ldr r0, [r4]
	movs r5, 0
	strb r5, [r0]
	ldr r1, [r4]
	ldr r0, _0808B7B4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x12]
	strb r0, [r1, 0x6]
	ldr r0, [r4]
	strb r5, [r0, 0x7]
	ldr r0, [r4]
	strb r5, [r0, 0x8]
	ldr r0, [r4]
	ldr r1, _0808B7B8 @ =0x00000456
	adds r0, r1
	strb r5, [r0]
	bl sub_808B800
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _0808B7C0
	ldr r0, [r4]
	ldr r2, _0808B7BC @ =0x00000457
	adds r0, r2
	strb r1, [r0]
	b _0808B7C8
	.align 2, 0
_0808B7B0: .4byte gUnknown_20397A4
_0808B7B4: .4byte gSaveBlock2Ptr
_0808B7B8: .4byte 0x00000456
_0808B7BC: .4byte 0x00000457
_0808B7C0:
	ldr r0, [r4]
	ldr r3, _0808B7F4 @ =0x00000457
	adds r0, r3
	strb r5, [r0]
_0808B7C8:
	movs r4, 0
	ldr r5, _0808B7F8 @ =gUnknown_20397A4
_0808B7CC:
	movs r0, 0xD
	muls r0, r4
	adds r0, 0x19
	ldr r1, [r5]
	adds r0, r1, r0
	lsls r2, r4, 1
	ldr r3, _0808B7FC @ =0x00000484
	adds r1, r3
	adds r1, r2
	ldrh r1, [r1]
	bl CopyEasyChatWord
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0808B7CC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B7F4: .4byte 0x00000457
_0808B7F8: .4byte gUnknown_20397A4
_0808B7FC: .4byte 0x00000484
	thumb_func_end sub_808B774

	thumb_func_start sub_808B800
sub_808B800: @ 808B800
	push {lr}
	ldr r0, _0808B810 @ =gUnknown_20397A4
	ldr r0, [r0]
	cmp r0, 0
	bne _0808B818
	ldr r0, _0808B814 @ =gGameVersion
	b _0808B81C
	.align 2, 0
_0808B810: .4byte gUnknown_20397A4
_0808B814: .4byte gGameVersion
_0808B818:
	ldr r1, _0808B82C @ =0x00000494
	adds r0, r1
_0808B81C:
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0808B830
	movs r0, 0x1
	b _0808B832
	.align 2, 0
_0808B82C: .4byte 0x00000494
_0808B830:
	movs r0, 0
_0808B832:
	pop {r1}
	bx r1
	thumb_func_end sub_808B800

	thumb_func_start sub_808B838
sub_808B838: @ 808B838
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r2, _0808B888 @ =gUnknown_83CD8F4
	ldr r5, _0808B88C @ =gUnknown_20397A4
	ldr r0, [r5]
	ldr r6, _0808B890 @ =0x0000045c
	adds r1, r0, r6
	ldr r7, _0808B894 @ =0x00000457
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r1, [r1]
	adds r0, r1
	adds r0, r2
	ldrb r4, [r0]
	bl InUnionRoom
	cmp r0, 0x1
	bne _0808B8A4
	ldr r0, _0808B898 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0808B8A4
	ldr r0, [r5]
	ldr r1, _0808B89C @ =0x000004ab
	adds r0, r1
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_804454C
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0808B8A0 @ =gUnknown_83CD8EC
	ldr r1, [r5]
	adds r2, r1, r6
	ldrb r3, [r2]
	lsls r3, 1
	adds r1, r7
	b _0808B8CC
	.align 2, 0
_0808B888: .4byte gUnknown_83CD8F4
_0808B88C: .4byte gUnknown_20397A4
_0808B890: .4byte 0x0000045c
_0808B894: .4byte 0x00000457
_0808B898: .4byte gReceivedRemoteLinkPlayers
_0808B89C: .4byte 0x000004ab
_0808B8A0: .4byte gUnknown_83CD8EC
_0808B8A4:
	ldr r6, _0808B8EC @ =gUnknown_20397A4
	ldr r1, [r6]
	ldr r2, _0808B8F0 @ =0x00000457
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808B8FC
	adds r0, r4, 0
	bl sub_804454C
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0808B8F4 @ =gUnknown_83CD8EC
	ldr r1, [r6]
	ldr r3, _0808B8F8 @ =0x0000045c
	adds r2, r1, r3
	ldrb r3, [r2]
	lsls r3, 1
	ldr r2, _0808B8F0 @ =0x00000457
	adds r1, r2
_0808B8CC:
	ldrb r1, [r1]
	lsls r1, 2
	adds r3, r1
	adds r1, r3, r4
	ldrb r2, [r1]
	adds r4, 0x1
	adds r3, r4
	ldrb r3, [r3]
	movs r1, 0x8
	str r1, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	movs r1, 0x1
	bl sub_810C330
	b _0808B938
	.align 2, 0
_0808B8EC: .4byte gUnknown_20397A4
_0808B8F0: .4byte 0x00000457
_0808B8F4: .4byte gUnknown_83CD8EC
_0808B8F8: .4byte 0x0000045c
_0808B8FC:
	ldr r4, _0808B940 @ =0x0000045c
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r1, 0x1
	bl PlayerGenderToFrontTrainerPicId_Debug
	lsls r0, 16
	lsrs r0, 16
	ldr r5, _0808B944 @ =gUnknown_83CD8EC
	ldr r1, [r6]
	adds r4, r1, r4
	ldrb r3, [r4]
	lsls r3, 1
	ldr r2, _0808B948 @ =0x00000457
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r3, r1
	adds r1, r3, r5
	ldrb r2, [r1]
	adds r5, 0x1
	adds r3, r5
	ldrb r3, [r3]
	movs r1, 0x8
	str r1, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	movs r1, 0x1
	bl sub_810C330
_0808B938:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B940: .4byte 0x0000045c
_0808B944: .4byte gUnknown_83CD8EC
_0808B948: .4byte 0x00000457
	thumb_func_end sub_808B838

	thumb_func_start sub_808B94C
sub_808B94C: @ 808B94C
	push {lr}
	bl sub_808B698
	ldr r0, _0808B95C @ =sub_80895B8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808B95C: .4byte sub_80895B8
	thumb_func_end sub_808B94C

	thumb_func_start sub_808B960
sub_808B960: @ 808B960
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0808B984 @ =gTrainerCards
	ldr r1, _0808B988 @ =gUnknown_83CD960
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	adds r1, r4, 0
	bl sub_808B700
	ldr r0, _0808B98C @ =sub_80895B8
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B984: .4byte gTrainerCards
_0808B988: .4byte gUnknown_83CD960
_0808B98C: .4byte sub_80895B8
	thumb_func_end sub_808B960

	thumb_func_start sub_808B990
sub_808B990: @ 808B990
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0808B9B4 @ =gTrainerCards
	ldr r1, _0808B9B8 @ =gUnknown_83CD9C0
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	adds r1, r4, 0
	bl sub_808B700
	ldr r0, _0808B9BC @ =sub_80895B8
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B9B4: .4byte gTrainerCards
_0808B9B8: .4byte gUnknown_83CD9C0
_0808B9BC: .4byte sub_80895B8
	thumb_func_end sub_808B990

	.align 2, 0 @ Don't pad with nop.
