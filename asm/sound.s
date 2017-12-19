	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start InitMapMusic
InitMapMusic: @ 8071938
	push {lr}
	ldr r1, _08071948 @ =gUnknown_3005080
	movs r0, 0
	strb r0, [r1]
	bl ResetMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_08071948: .4byte gUnknown_3005080
	thumb_func_end InitMapMusic

	thumb_func_start MapMusicMain
MapMusicMain: @ 807194C
	push {r4,r5,lr}
	ldr r0, _08071964 @ =gUnknown_3000FC4
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0x7
	bhi _08071A2E
	lsls r0, r1, 2
	ldr r1, _08071968 @ =_0807196C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071964: .4byte gUnknown_3000FC4
_08071968: .4byte _0807196C
	.align 2, 0
_0807196C:
	.4byte _08071A2E
	.4byte _0807198C
	.4byte _08071A2E
	.4byte _08071A2E
	.4byte _08071A2E
	.4byte _080719A0
	.4byte _080719C0
	.4byte _080719FC
_0807198C:
	movs r0, 0x2
	strb r0, [r2]
	ldr r0, _0807199C @ =gUnknown_3000FC0
	ldrh r0, [r0]
	bl PlayBGM
	b _08071A2E
	.align 2, 0
_0807199C: .4byte gUnknown_3000FC0
_080719A0:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08071A2E
	ldr r0, _080719B8 @ =gUnknown_3000FC2
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080719BC @ =gUnknown_3000FC4
	strb r1, [r0]
	b _08071A2E
	.align 2, 0
_080719B8: .4byte gUnknown_3000FC2
_080719BC: .4byte gUnknown_3000FC4
_080719C0:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08071A2E
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08071A2E
	ldr r2, _080719F0 @ =gUnknown_3000FC0
	ldr r1, _080719F4 @ =gUnknown_3000FC2
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080719F8 @ =gUnknown_3000FC4
	movs r0, 0x2
	strb r0, [r1]
	ldrh r0, [r2]
	bl PlayBGM
	b _08071A2E
	.align 2, 0
_080719F0: .4byte gUnknown_3000FC0
_080719F4: .4byte gUnknown_3000FC2
_080719F8: .4byte gUnknown_3000FC4
_080719FC:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08071A2E
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08071A2E
	ldr r4, _08071A34 @ =gUnknown_3000FC2
	ldrh r0, [r4]
	ldr r5, _08071A38 @ =gUnknown_3000FC5
	ldrb r1, [r5]
	bl FadeInNewBGM
	ldr r1, _08071A3C @ =gUnknown_3000FC0
	ldrh r0, [r4]
	strh r0, [r1]
	movs r2, 0
	strh r2, [r4]
	ldr r1, _08071A40 @ =gUnknown_3000FC4
	movs r0, 0x2
	strb r0, [r1]
	strb r2, [r5]
_08071A2E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071A34: .4byte gUnknown_3000FC2
_08071A38: .4byte gUnknown_3000FC5
_08071A3C: .4byte gUnknown_3000FC0
_08071A40: .4byte gUnknown_3000FC4
	thumb_func_end MapMusicMain

	thumb_func_start ResetMapMusic
ResetMapMusic: @ 8071A44
	ldr r0, _08071A58 @ =gUnknown_3000FC0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08071A5C @ =gUnknown_3000FC2
	strh r1, [r0]
	ldr r0, _08071A60 @ =gUnknown_3000FC4
	strb r1, [r0]
	ldr r0, _08071A64 @ =gUnknown_3000FC5
	strb r1, [r0]
	bx lr
	.align 2, 0
_08071A58: .4byte gUnknown_3000FC0
_08071A5C: .4byte gUnknown_3000FC2
_08071A60: .4byte gUnknown_3000FC4
_08071A64: .4byte gUnknown_3000FC5
	thumb_func_end ResetMapMusic

	thumb_func_start GetCurrentMapMusic
GetCurrentMapMusic: @ 8071A68
	ldr r0, _08071A70 @ =gUnknown_3000FC0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08071A70: .4byte gUnknown_3000FC0
	thumb_func_end GetCurrentMapMusic

	thumb_func_start PlayNewMapMusic
PlayNewMapMusic: @ 8071A74
	ldr r1, _08071A88 @ =gUnknown_3000FC0
	strh r0, [r1]
	ldr r1, _08071A8C @ =gUnknown_3000FC2
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08071A90 @ =gUnknown_3000FC4
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08071A88: .4byte gUnknown_3000FC0
_08071A8C: .4byte gUnknown_3000FC2
_08071A90: .4byte gUnknown_3000FC4
	thumb_func_end PlayNewMapMusic

	thumb_func_start StopMapMusic
StopMapMusic: @ 8071A94
	ldr r0, _08071AA8 @ =gUnknown_3000FC0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08071AAC @ =gUnknown_3000FC2
	strh r1, [r0]
	ldr r1, _08071AB0 @ =gUnknown_3000FC4
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08071AA8: .4byte gUnknown_3000FC0
_08071AAC: .4byte gUnknown_3000FC2
_08071AB0: .4byte gUnknown_3000FC4
	thumb_func_end StopMapMusic

	thumb_func_start FadeOutMapMusic
FadeOutMapMusic: @ 8071AB4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	cmp r0, 0
	beq _08071ACA
	adds r0, r4, 0
	bl FadeOutBGM
_08071ACA:
	ldr r0, _08071AE0 @ =gUnknown_3000FC0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08071AE4 @ =gUnknown_3000FC2
	strh r1, [r0]
	ldr r1, _08071AE8 @ =gUnknown_3000FC4
	movs r0, 0x5
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071AE0: .4byte gUnknown_3000FC0
_08071AE4: .4byte gUnknown_3000FC2
_08071AE8: .4byte gUnknown_3000FC4
	thumb_func_end FadeOutMapMusic

	thumb_func_start FadeOutAndPlayNewMapMusic
FadeOutAndPlayNewMapMusic: @ 8071AEC
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	bl FadeOutMapMusic
	ldr r1, _08071B14 @ =gUnknown_3000FC0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08071B18 @ =gUnknown_3000FC2
	strh r4, [r0]
	ldr r1, _08071B1C @ =gUnknown_3000FC4
	movs r0, 0x6
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071B14: .4byte gUnknown_3000FC0
_08071B18: .4byte gUnknown_3000FC2
_08071B1C: .4byte gUnknown_3000FC4
	thumb_func_end FadeOutAndPlayNewMapMusic

	thumb_func_start FadeOutAndFadeInNewMapMusic
FadeOutAndFadeInNewMapMusic: @ 8071B20
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	bl FadeOutMapMusic
	ldr r1, _08071B54 @ =gUnknown_3000FC0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08071B58 @ =gUnknown_3000FC2
	strh r4, [r0]
	ldr r1, _08071B5C @ =gUnknown_3000FC4
	movs r0, 0x7
	strb r0, [r1]
	ldr r0, _08071B60 @ =gUnknown_3000FC5
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071B54: .4byte gUnknown_3000FC0
_08071B58: .4byte gUnknown_3000FC2
_08071B5C: .4byte gUnknown_3000FC4
_08071B60: .4byte gUnknown_3000FC5
	thumb_func_end FadeOutAndFadeInNewMapMusic

	thumb_func_start FadeInNewMapMusic
FadeInNewMapMusic: @ 8071B64
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FadeInNewBGM
	ldr r0, _08071B90 @ =gUnknown_3000FC0
	strh r4, [r0]
	ldr r0, _08071B94 @ =gUnknown_3000FC2
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08071B98 @ =gUnknown_3000FC4
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _08071B9C @ =gUnknown_3000FC5
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071B90: .4byte gUnknown_3000FC0
_08071B94: .4byte gUnknown_3000FC2
_08071B98: .4byte gUnknown_3000FC4
_08071B9C: .4byte gUnknown_3000FC5
	thumb_func_end FadeInNewMapMusic

	thumb_func_start IsNotWaitingForBGMStop
IsNotWaitingForBGMStop: @ 8071BA0
	push {lr}
	ldr r0, _08071BB8 @ =gUnknown_3000FC4
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _08071BBC
	cmp r0, 0x5
	beq _08071BBC
	cmp r0, 0x7
	beq _08071BBC
	movs r0, 0x1
	b _08071BBE
	.align 2, 0
_08071BB8: .4byte gUnknown_3000FC4
_08071BBC:
	movs r0, 0
_08071BBE:
	pop {r1}
	bx r1
	thumb_func_end IsNotWaitingForBGMStop

	thumb_func_start sub_8071BC4
sub_8071BC4: @ 8071BC4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08071BDC @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08071BE4
	ldr r1, _08071BE0 @ =gUnknown_3000FC6
	movs r0, 0xFF
	strh r0, [r1]
	b _08071BFC
	.align 2, 0
_08071BDC: .4byte gUnknown_203ADFA
_08071BE0: .4byte gUnknown_3000FC6
_08071BE4:
	ldr r0, _08071C04 @ =gMPlay_BGM
	bl m4aMPlayStop
	ldr r0, _08071C08 @ =gUnknown_83AC990
	lsls r1, r4, 2
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _08071C0C @ =gUnknown_3000FC6
	ldrh r1, [r1, 0x2]
	strh r1, [r2]
	bl m4aSongNumStart
_08071BFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071C04: .4byte gMPlay_BGM
_08071C08: .4byte gUnknown_83AC990
_08071C0C: .4byte gUnknown_3000FC6
	thumb_func_end sub_8071BC4

	thumb_func_start WaitFanfare
WaitFanfare: @ 8071C10
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _08071C28 @ =gUnknown_3000FC6
	ldrh r0, [r2]
	cmp r0, 0
	beq _08071C2C
	subs r0, 0x1
	strh r0, [r2]
	movs r0, 0
	b _08071C44
	.align 2, 0
_08071C28: .4byte gUnknown_3000FC6
_08071C2C:
	cmp r1, 0
	bne _08071C3C
	ldr r0, _08071C38 @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _08071C42
	.align 2, 0
_08071C38: .4byte gMPlay_BGM
_08071C3C:
	movs r0, 0
	bl m4aSongNumStart
_08071C42:
	movs r0, 0x1
_08071C44:
	pop {r1}
	bx r1
	thumb_func_end WaitFanfare

	thumb_func_start StopFanfareByFanfareNum
StopFanfareByFanfareNum: @ 8071C48
	push {lr}
	lsls r0, 24
	ldr r1, _08071C5C @ =gUnknown_83AC990
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_08071C5C: .4byte gUnknown_83AC990
	thumb_func_end StopFanfareByFanfareNum

	thumb_func_start PlayFanfare
PlayFanfare: @ 8071C60
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _08071C80 @ =gUnknown_83AC990
_08071C6A:
	ldrh r0, [r2]
	cmp r0, r3
	bne _08071C84
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_8071BC4
	bl CreateFanfareTask
	b _08071C96
	.align 2, 0
_08071C80: .4byte gUnknown_83AC990
_08071C84:
	adds r2, 0x4
	adds r1, 0x1
	cmp r1, 0xD
	bls _08071C6A
	movs r0, 0
	bl sub_8071BC4
	bl CreateFanfareTask
_08071C96:
	pop {r0}
	bx r0
	thumb_func_end PlayFanfare

	thumb_func_start IsFanfareTaskInactive
IsFanfareTaskInactive: @ 8071C9C
	push {lr}
	ldr r0, _08071CB0 @ =Task_Fanfare
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08071CB4
	movs r0, 0x1
	b _08071CB6
	.align 2, 0
_08071CB0: .4byte Task_Fanfare
_08071CB4:
	movs r0, 0
_08071CB6:
	pop {r1}
	bx r1
	thumb_func_end IsFanfareTaskInactive

	thumb_func_start Task_Fanfare
Task_Fanfare: @ 8071CBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08071CD0 @ =gUnknown_3000FC6
	ldrh r0, [r1]
	cmp r0, 0
	beq _08071CD4
	subs r0, 0x1
	strh r0, [r1]
	b _08071CE0
	.align 2, 0
_08071CD0: .4byte gUnknown_3000FC6
_08071CD4:
	ldr r0, _08071CE8 @ =gMPlay_BGM
	bl m4aMPlayContinue
	adds r0, r4, 0
	bl DestroyTask
_08071CE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071CE8: .4byte gMPlay_BGM
	thumb_func_end Task_Fanfare

	thumb_func_start CreateFanfareTask
CreateFanfareTask: @ 8071CEC
	push {r4,lr}
	ldr r4, _08071D0C @ =Task_Fanfare
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08071D06
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08071D06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071D0C: .4byte Task_Fanfare
	thumb_func_end CreateFanfareTask

	thumb_func_start FadeInNewBGM
FadeInNewBGM: @ 8071D10
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _08071D58 @ =gUnknown_3005080
	ldrb r0, [r0]
	cmp r0, 0
	beq _08071D24
	movs r5, 0
_08071D24:
	ldr r6, _08071D5C @ =0x0000ffff
	cmp r5, r6
	bne _08071D2C
	movs r5, 0
_08071D2C:
	adds r0, r5, 0
	bl m4aSongNumStart
	ldr r4, _08071D60 @ =gMPlay_BGM
	adds r0, r4, 0
	bl m4aMPlayImmInit
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	bl m4aMPlayVolumeControl
	adds r0, r5, 0
	bl m4aSongNumStop
	adds r0, r4, 0
	adds r1, r7, 0
	bl m4aMPlayFadeIn
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071D58: .4byte gUnknown_3005080
_08071D5C: .4byte 0x0000ffff
_08071D60: .4byte gMPlay_BGM
	thumb_func_end FadeInNewBGM

	thumb_func_start FadeOutBGMTemporarily
FadeOutBGMTemporarily: @ 8071D64
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08071D78 @ =gMPlay_BGM
	bl m4aMPlayFadeOutTemporarily
	pop {r0}
	bx r0
	.align 2, 0
_08071D78: .4byte gMPlay_BGM
	thumb_func_end FadeOutBGMTemporarily

	thumb_func_start IsBGMPausedOrStopped
IsBGMPausedOrStopped: @ 8071D7C
	push {lr}
	ldr r0, _08071D94 @ =gMPlay_BGM
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _08071D9C
	ldr r0, _08071D98 @ =0x0000ffff
	ands r1, r0
	cmp r1, 0
	beq _08071D9C
	movs r0, 0
	b _08071D9E
	.align 2, 0
_08071D94: .4byte gMPlay_BGM
_08071D98: .4byte 0x0000ffff
_08071D9C:
	movs r0, 0x1
_08071D9E:
	pop {r1}
	bx r1
	thumb_func_end IsBGMPausedOrStopped

	thumb_func_start FadeInBGM
FadeInBGM: @ 8071DA4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08071DB8 @ =gMPlay_BGM
	bl m4aMPlayFadeIn
	pop {r0}
	bx r0
	.align 2, 0
_08071DB8: .4byte gMPlay_BGM
	thumb_func_end FadeInBGM

	thumb_func_start FadeOutBGM
FadeOutBGM: @ 8071DBC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08071DD0 @ =gMPlay_BGM
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_08071DD0: .4byte gMPlay_BGM
	thumb_func_end FadeOutBGM

	thumb_func_start IsBGMStopped
IsBGMStopped: @ 8071DD4
	push {lr}
	ldr r0, _08071DE4 @ =gMPlay_BGM
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	beq _08071DE8
	movs r0, 0
	b _08071DEA
	.align 2, 0
_08071DE4: .4byte gMPlay_BGM
_08071DE8:
	movs r0, 0x1
_08071DEA:
	pop {r1}
	bx r1
	thumb_func_end IsBGMStopped

	thumb_func_start PlayCry1
PlayCry1: @ 8071DF0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08071E30 @ =gMPlay_BGM
	ldr r1, _08071E34 @ =0x0000ffff
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	lsls r4, 24
	asrs r4, 24
	movs r0, 0
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x78
	movs r3, 0xA
	bl sub_8071F78
	ldr r1, _08071E38 @ =gUnknown_2037ED0
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071E30: .4byte gMPlay_BGM
_08071E34: .4byte 0x0000ffff
_08071E38: .4byte gUnknown_2037ED0
	thumb_func_end PlayCry1

	thumb_func_start PlayCry2
PlayCry2: @ 8071E3C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	movs r4, 0
	str r4, [sp]
	bl sub_8071F78
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayCry2

	thumb_func_start PlayCry3
PlayCry3: @ 8071E60
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x1
	bne _08071E86
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x78
	movs r3, 0xA
	bl sub_8071F78
	b _08071EAA
_08071E86:
	ldr r0, _08071EB4 @ =gMPlay_BGM
	ldr r1, _08071EB8 @ =0x0000ffff
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x78
	movs r3, 0xA
	bl sub_8071F78
	ldr r1, _08071EBC @ =gUnknown_2037ED0
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
_08071EAA:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071EB4: .4byte gMPlay_BGM
_08071EB8: .4byte 0x0000ffff
_08071EBC: .4byte gUnknown_2037ED0
	thumb_func_end PlayCry3

	thumb_func_start PlayCry4
PlayCry4: @ 8071EC0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	adds r4, r2, 0
	cmp r2, 0x1
	bne _08071EEA
	lsls r1, 24
	asrs r1, 24
	str r2, [sp]
	movs r2, 0x78
	movs r3, 0xA
	bl sub_8071F78
	b _08071F10
_08071EEA:
	ldr r0, _08071F18 @ =gUnknown_2022B4C
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08071F00
	ldr r0, _08071F1C @ =gMPlay_BGM
	ldr r1, _08071F20 @ =0x0000ffff
	movs r2, 0x55
	bl m4aMPlayVolumeControl
_08071F00:
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x78
	movs r3, 0xA
	bl sub_8071F78
_08071F10:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071F18: .4byte gUnknown_2022B4C
_08071F1C: .4byte gMPlay_BGM
_08071F20: .4byte 0x0000ffff
	thumb_func_end PlayCry4

	thumb_func_start sub_8071F24
sub_8071F24: @ 8071F24
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08071F68 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08071F56
	ldr r0, _08071F6C @ =gMPlay_BGM
	ldr r1, _08071F70 @ =0x0000ffff
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x78
	movs r3, 0xA
	bl sub_8071F78
_08071F56:
	ldr r1, _08071F74 @ =gUnknown_2037ED0
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071F68: .4byte gUnknown_203ADFA
_08071F6C: .4byte gMPlay_BGM
_08071F70: .4byte 0x0000ffff
_08071F74: .4byte gUnknown_2037ED0
	thumb_func_end sub_8071F24

	thumb_func_start sub_8071F78
sub_8071F78: @ 8071F78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	lsls r4, 24
	lsrs r1, r4, 24
	ldr r3, _08071FC0 @ =0xffff0000
	adds r0, r3
	lsrs r7, r0, 16
	movs r6, 0x8C
	movs r0, 0
	mov r9, r0
	movs r5, 0
	movs r4, 0xF0
	lsls r4, 6
	mov r8, r5
	cmp r1, 0xC
	bhi _0807208A
	lsls r0, r1, 2
	ldr r1, _08071FC4 @ =_08071FC8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071FC0: .4byte 0xffff0000
_08071FC4: .4byte _08071FC8
	.align 2, 0
_08071FC8:
	.4byte _0807208A
	.4byte _08071FFC
	.4byte _08072002
	.4byte _08072010
	.4byte _08072020
	.4byte _08072038
	.4byte _08072044
	.4byte _08072054
	.4byte _0807205E
	.4byte _08072068
	.4byte _08072078
	.4byte _08072088
	.4byte _08072084
_08071FFC:
	movs r6, 0x14
	movs r5, 0xE1
	b _0807208A
_08072002:
	movs r5, 0xE1
	ldr r4, _0807200C @ =0x00003cf0
	movs r1, 0x14
	b _0807202C
	.align 2, 0
_0807200C: .4byte 0x00003cf0
_08072010:
	movs r6, 0x32
	movs r5, 0xC8
	ldr r4, _0807201C @ =0x00003db8
	movs r3, 0x14
	b _0807204A
	.align 2, 0
_0807201C: .4byte 0x00003db8
_08072020:
	movs r6, 0x19
	movs r0, 0x1
	mov r9, r0
	movs r5, 0x64
	ldr r4, _08072034 @ =0x00003cf0
	movs r1, 0xC0
_0807202C:
	mov r8, r1
	movs r2, 0x5A
	b _0807208A
	.align 2, 0
_08072034: .4byte 0x00003cf0
_08072038:
	movs r5, 0xC8
	ldr r4, _08072040 @ =0x00003868
	b _0807208A
	.align 2, 0
_08072040: .4byte 0x00003868
_08072044:
	movs r5, 0xDC
	ldr r4, _08072050 @ =0x00003cc3
	movs r3, 0xC0
_0807204A:
	mov r8, r3
	movs r2, 0x5A
	b _0807208A
	.align 2, 0
_08072050: .4byte 0x00003cc3
_08072054:
	movs r6, 0xA
	movs r5, 0x64
	movs r4, 0xE8
	lsls r4, 6
	b _0807208A
_0807205E:
	movs r6, 0x3C
	movs r5, 0xE1
	movs r4, 0xF4
	lsls r4, 6
	b _0807208A
_08072068:
	movs r6, 0xF
	movs r0, 0x1
	mov r9, r0
	movs r5, 0x7D
	ldr r4, _08072074 @ =0x00003b60
	b _0807208A
	.align 2, 0
_08072074: .4byte 0x00003b60
_08072078:
	movs r6, 0x64
	movs r5, 0xE1
	ldr r4, _08072080 @ =0x00003b60
	b _0807208A
	.align 2, 0
_08072080: .4byte 0x00003b60
_08072084:
	movs r6, 0x14
	movs r5, 0xE1
_08072088:
	ldr r4, _080720E4 @ =0x00003a98
_0807208A:
	adds r0, r2, 0
	bl SetPokemonCryVolume
	mov r1, r10
	lsls r0, r1, 24
	asrs r0, 24
	bl SetPokemonCryPanpot
	adds r0, r4, 0
	bl SetPokemonCryPitch
	adds r0, r6, 0
	bl SetPokemonCryLength
	movs r0, 0
	bl SetPokemonCryProgress
	adds r0, r5, 0
	bl SetPokemonCryRelease
	mov r3, r8
	lsls r0, r3, 24
	asrs r0, 24
	bl SetPokemonCryChorus
	ldr r0, [sp]
	bl SetPokemonCryPriority
	adds r0, r7, 0
	bl SpeciesToCryId
	adds r7, r0, 0
	movs r1, 0x7F
	ands r1, r7
	lsrs r0, r7, 7
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r0, 0x1
	beq _08072118
	cmp r0, 0x1
	bgt _080720E8
	cmp r0, 0
	beq _080720F2
	b _08072186
	.align 2, 0
_080720E4: .4byte 0x00003a98
_080720E8:
	cmp r2, 0x2
	beq _0807213C
	cmp r2, 0x3
	beq _08072160
	b _08072186
_080720F2:
	mov r0, r9
	cmp r0, 0
	beq _08072108
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08072104 @ =gUnknown_848DB44
	b _0807217C
	.align 2, 0
_08072104: .4byte gUnknown_848DB44
_08072108:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08072114 @ =gUnknown_848C914
	b _0807217C
	.align 2, 0
_08072114: .4byte gUnknown_848C914
_08072118:
	mov r3, r9
	cmp r3, 0
	beq _0807212C
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08072128 @ =gUnknown_848E144
	b _0807217C
	.align 2, 0
_08072128: .4byte gUnknown_848E144
_0807212C:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08072138 @ =gUnknown_848CF14
	b _0807217C
	.align 2, 0
_08072138: .4byte gUnknown_848CF14
_0807213C:
	mov r0, r9
	cmp r0, 0
	beq _08072150
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807214C @ =gUnknown_848E744
	b _0807217C
	.align 2, 0
_0807214C: .4byte gUnknown_848E744
_08072150:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807215C @ =gUnknown_848D514
	b _0807217C
	.align 2, 0
_0807215C: .4byte gUnknown_848D514
_08072160:
	mov r3, r9
	cmp r3, 0
	beq _08072174
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08072170 @ =gUnknown_848ED44
	b _0807217C
	.align 2, 0
_08072170: .4byte gUnknown_848ED44
_08072174:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08072198 @ =gUnknown_848DB14
_0807217C:
	adds r0, r1
	bl SetPokemonCryTone
	ldr r1, _0807219C @ =gUnknown_2037ECC
	str r0, [r1]
_08072186:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072198: .4byte gUnknown_848DB14
_0807219C: .4byte gUnknown_2037ECC
	thumb_func_end sub_8071F78

	thumb_func_start IsCryFinished
IsCryFinished: @ 80721A0
	push {lr}
	ldr r0, _080721B8 @ =Task_DuckBGMForPokemonCry
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080721BC
	bl ClearPokemonCrySongs
	movs r0, 0x1
	b _080721BE
	.align 2, 0
_080721B8: .4byte Task_DuckBGMForPokemonCry
_080721BC:
	movs r0, 0
_080721BE:
	pop {r1}
	bx r1
	thumb_func_end IsCryFinished

	thumb_func_start StopCryAndClearCrySongs
StopCryAndClearCrySongs: @ 80721C4
	push {lr}
	ldr r0, _080721D8 @ =gUnknown_2037ECC
	ldr r0, [r0]
	bl m4aMPlayStop
	bl ClearPokemonCrySongs
	pop {r0}
	bx r0
	.align 2, 0
_080721D8: .4byte gUnknown_2037ECC
	thumb_func_end StopCryAndClearCrySongs

	thumb_func_start StopCry
StopCry: @ 80721DC
	push {lr}
	ldr r0, _080721EC @ =gUnknown_2037ECC
	ldr r0, [r0]
	bl m4aMPlayStop
	pop {r0}
	bx r0
	.align 2, 0
_080721EC: .4byte gUnknown_2037ECC
	thumb_func_end StopCry

	thumb_func_start IsCryPlayingOrClearCrySongs
IsCryPlayingOrClearCrySongs: @ 80721F0
	push {lr}
	ldr r0, _08072208 @ =gUnknown_2037ECC
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _0807220C
	bl ClearPokemonCrySongs
	movs r0, 0
	b _0807220E
	.align 2, 0
_08072208: .4byte gUnknown_2037ECC
_0807220C:
	movs r0, 0x1
_0807220E:
	pop {r1}
	bx r1
	thumb_func_end IsCryPlayingOrClearCrySongs

	thumb_func_start IsCryPlaying
IsCryPlaying: @ 8072214
	push {lr}
	ldr r0, _08072228 @ =gUnknown_2037ECC
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _0807222C
	movs r0, 0
	b _0807222E
	.align 2, 0
_08072228: .4byte gUnknown_2037ECC
_0807222C:
	movs r0, 0x1
_0807222E:
	pop {r1}
	bx r1
	thumb_func_end IsCryPlaying

	thumb_func_start Task_DuckBGMForPokemonCry
Task_DuckBGMForPokemonCry: @ 8072234
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08072248 @ =gUnknown_2037ED0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0807224C
	subs r0, 0x1
	strb r0, [r1]
	b _0807226A
	.align 2, 0
_08072248: .4byte gUnknown_2037ED0
_0807224C:
	ldr r0, _08072270 @ =gUnknown_2037ECC
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _0807226A
	ldr r0, _08072274 @ =gMPlay_BGM
	ldr r1, _08072278 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	adds r0, r4, 0
	bl DestroyTask
_0807226A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072270: .4byte gUnknown_2037ECC
_08072274: .4byte gMPlay_BGM
_08072278: .4byte 0x0000ffff
	thumb_func_end Task_DuckBGMForPokemonCry

	thumb_func_start RestoreBGMVolumeAfterPokemonCry
RestoreBGMVolumeAfterPokemonCry: @ 807227C
	push {r4,lr}
	ldr r4, _0807229C @ =Task_DuckBGMForPokemonCry
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08072296
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08072296:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807229C: .4byte Task_DuckBGMForPokemonCry
	thumb_func_end RestoreBGMVolumeAfterPokemonCry

	thumb_func_start PlayBGM
PlayBGM: @ 80722A0
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080722C4 @ =gUnknown_3005080
	ldrb r0, [r0]
	cmp r0, 0
	beq _080722B0
	movs r1, 0
_080722B0:
	ldr r0, _080722C8 @ =0x0000ffff
	cmp r1, r0
	bne _080722B8
	movs r1, 0
_080722B8:
	adds r0, r1, 0
	bl m4aSongNumStart
	pop {r0}
	bx r0
	.align 2, 0
_080722C4: .4byte gUnknown_3005080
_080722C8: .4byte 0x0000ffff
	thumb_func_end PlayBGM

	thumb_func_start PlaySE
PlaySE: @ 80722CC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080722EC @ =gUnknown_2031DD8
	ldrb r0, [r0]
	cmp r0, 0
	bne _080722E8
	ldr r0, _080722F0 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080722E8
	adds r0, r1, 0
	bl m4aSongNumStart
_080722E8:
	pop {r0}
	bx r0
	.align 2, 0
_080722EC: .4byte gUnknown_2031DD8
_080722F0: .4byte gUnknown_203ADFA
	thumb_func_end PlaySE

	thumb_func_start PlaySE12WithPanning
PlaySE12WithPanning: @ 80722F4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r6, _0807233C @ =gMPlay_SE1
	adds r0, r6, 0
	bl m4aMPlayImmInit
	ldr r0, _08072340 @ =gMPlay_SE2
	mov r8, r0
	bl m4aMPlayImmInit
	ldr r5, _08072344 @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807233C: .4byte gMPlay_SE1
_08072340: .4byte gMPlay_SE2
_08072344: .4byte 0x0000ffff
	thumb_func_end PlaySE12WithPanning

	thumb_func_start PlaySE1WithPanning
PlaySE1WithPanning: @ 8072348
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r5, _08072374 @ =gMPlay_SE1
	adds r0, r5, 0
	bl m4aMPlayImmInit
	ldr r1, _08072378 @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072374: .4byte gMPlay_SE1
_08072378: .4byte 0x0000ffff
	thumb_func_end PlaySE1WithPanning

	thumb_func_start PlaySE2WithPanning
PlaySE2WithPanning: @ 807237C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r5, _080723A8 @ =gMPlay_SE2
	adds r0, r5, 0
	bl m4aMPlayImmInit
	ldr r1, _080723AC @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080723A8: .4byte gMPlay_SE2
_080723AC: .4byte 0x0000ffff
	thumb_func_end PlaySE2WithPanning

	thumb_func_start SE12PanpotControl
SE12PanpotControl: @ 80723B0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _080723D4 @ =gMPlay_SE1
	ldr r5, _080723D8 @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _080723DC @ =gMPlay_SE2
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080723D4: .4byte gMPlay_SE1
_080723D8: .4byte 0x0000ffff
_080723DC: .4byte gMPlay_SE2
	thumb_func_end SE12PanpotControl

	thumb_func_start IsSEPlaying
IsSEPlaying: @ 80723E0
	push {lr}
	ldr r0, _08072410 @ =gMPlay_SE1
	ldr r1, [r0, 0x4]
	movs r2, 0x80
	lsls r2, 24
	adds r3, r0, 0
	cmp r1, 0
	bge _080723FA
	ldr r0, _08072414 @ =gMPlay_SE2
	ldr r0, [r0, 0x4]
	ands r0, r2
	cmp r0, 0
	bne _0807240C
_080723FA:
	ldr r1, _08072418 @ =0x0000ffff
	ldrh r0, [r3, 0x4]
	cmp r0, 0
	bne _0807241C
	ldr r0, _08072414 @ =gMPlay_SE2
	ldr r0, [r0, 0x4]
	ands r0, r1
	cmp r0, 0
	bne _0807241C
_0807240C:
	movs r0, 0
	b _0807241E
	.align 2, 0
_08072410: .4byte gMPlay_SE1
_08072414: .4byte gMPlay_SE2
_08072418: .4byte 0x0000ffff
_0807241C:
	movs r0, 0x1
_0807241E:
	pop {r1}
	bx r1
	thumb_func_end IsSEPlaying

	thumb_func_start IsBGMPlaying
IsBGMPlaying: @ 8072424
	push {lr}
	ldr r0, _0807243C @ =gMPlay_BGM
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _08072444
	ldr r0, _08072440 @ =0x0000ffff
	ands r1, r0
	cmp r1, 0
	beq _08072444
	movs r0, 0x1
	b _08072446
	.align 2, 0
_0807243C: .4byte gMPlay_BGM
_08072440: .4byte 0x0000ffff
_08072444:
	movs r0, 0
_08072446:
	pop {r1}
	bx r1
	thumb_func_end IsBGMPlaying

	thumb_func_start IsSpecialSEPlaying
IsSpecialSEPlaying: @ 807244C
	push {lr}
	ldr r0, _08072464 @ =gMPlay_SE3
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _0807246C
	ldr r0, _08072468 @ =0x0000ffff
	ands r1, r0
	cmp r1, 0
	beq _0807246C
	movs r0, 0x1
	b _0807246E
	.align 2, 0
_08072464: .4byte gMPlay_SE3
_08072468: .4byte 0x0000ffff
_0807246C:
	movs r0, 0
_0807246E:
	pop {r1}
	bx r1
	thumb_func_end IsSpecialSEPlaying

	thumb_func_start sub_8072474
sub_8072474: @ 8072474
	push {lr}
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _08072490 @ =gUnknown_203F174
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08072494 @ =gMPlay_BGM
	ldr r1, _08072498 @ =0x0000ffff
	bl m4aMPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_08072490: .4byte gUnknown_203F174
_08072494: .4byte gMPlay_BGM
_08072498: .4byte 0x0000ffff
	thumb_func_end sub_8072474

	thumb_func_start sub_807249C
sub_807249C: @ 807249C
	push {lr}
	ldr r1, _080724B4 @ =gUnknown_203F174
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080724B8 @ =gMPlay_BGM
	ldr r1, _080724BC @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_080724B4: .4byte gUnknown_203F174
_080724B8: .4byte gMPlay_BGM
_080724BC: .4byte 0x0000ffff
	thumb_func_end sub_807249C

	.align 2, 0 @ Don't pad with nop.
