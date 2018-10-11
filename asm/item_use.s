	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A0FBC
sub_80A0FBC: @ 80A0FBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A0FD8 @ =gUnknown_203AD30
	ldrh r0, [r1]
	cmp r0, 0xAF
	bne _080A0FE0
	ldr r0, _080A0FDC @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x10]
	b _080A0FE6
	.align 2, 0
_080A0FD8: .4byte gUnknown_203AD30
_080A0FDC: .4byte gTasks
_080A0FE0:
	ldrh r0, [r1]
	bl ItemId_GetType
_080A0FE6:
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1010 @ =gUnknown_203AD30
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080A1018
	ldr r0, _080A1014 @ =gUnknown_83E2954
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_813D934
	adds r0, r5, 0
	bl sub_813D808
	b _080A1032
	.align 2, 0
_080A1010: .4byte gUnknown_203AD30
_080A1014: .4byte gUnknown_83E2954
_080A1018:
	ldr r0, _080A1038 @ =gUnknown_83E2954
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_8108EE0
	cmp r4, 0x1
	bne _080A102C
	bl sub_8108CB4
_080A102C:
	adds r0, r5, 0
	bl sub_8108B50
_080A1032:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1038: .4byte gUnknown_83E2954
	thumb_func_end sub_80A0FBC

	thumb_func_start sub_80A103C
sub_80A103C: @ 80A103C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080A1064 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080A1070
	ldr r1, _080A1068 @ =gUnknown_3005020
	ldr r0, _080A106C @ =sub_80A1084
	str r0, [r1]
	adds r0, r2, 0
	bl sub_80A0FBC
	b _080A107A
	.align 2, 0
_080A1064: .4byte gTasks
_080A1068: .4byte gUnknown_3005020
_080A106C: .4byte sub_80A1084
_080A1070:
	ldr r0, _080A1080 @ =gUnknown_2039998
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
_080A107A:
	pop {r0}
	bx r0
	.align 2, 0
_080A1080: .4byte gUnknown_2039998
	thumb_func_end sub_80A103C

	thumb_func_start sub_80A1084
sub_80A1084: @ 80A1084
	push {lr}
	bl sub_807DC00
	ldr r0, _080A1098 @ =sub_80A109C
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080A1098: .4byte sub_80A109C
	thumb_func_end sub_80A1084

	thumb_func_start sub_80A109C
sub_80A109C: @ 80A109C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A10B8
	ldr r0, _080A10C0 @ =gUnknown_2039998
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_080A10B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A10C0: .4byte gUnknown_2039998
	thumb_func_end sub_80A109C

	thumb_func_start sub_80A10C4
sub_80A10C4: @ 80A10C4
	push {r4-r7,lr}
	adds r4, r1, 0
	adds r1, r3, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r5, _080A10F0 @ =gStringVar4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	cmp r4, 0
	bne _080A10F8
	ldr r3, _080A10F4 @ =sub_810A1F8
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_8108E70
	b _080A1104
	.align 2, 0
_080A10F0: .4byte gStringVar4
_080A10F4: .4byte sub_810A1F8
_080A10F8:
	ldr r3, _080A110C @ =sub_80A112C
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl DisplayItemMessageOnField
_080A1104:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A110C: .4byte sub_80A112C
	thumb_func_end sub_80A10C4

	thumb_func_start sub_80A1110
sub_80A1110: @ 80A1110
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080A1128 @ =gUnknown_8416425
	movs r2, 0x4
	bl sub_80A10C4
	pop {r0}
	bx r0
	.align 2, 0
_080A1128: .4byte gUnknown_8416425
	thumb_func_end sub_80A1110

	thumb_func_start sub_80A112C
sub_80A112C: @ 80A112C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6F54
	adds r0, r4, 0
	bl DestroyTask
	bl sub_80696C0
	bl ScriptContext2_Disable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A112C

	thumb_func_start sub_80A1150
sub_80A1150: @ 80A1150
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080A1168
	movs r0, 0x1
	b _080A117E
_080A1168:
	adds r0, r4, 0
	bl ItemId_GetFieldFunc
	ldr r1, _080A1178 @ =sub_80A1750
	cmp r0, r1
	beq _080A117C
	movs r0, 0
	b _080A117E
	.align 2, 0
_080A1178: .4byte sub_80A1750
_080A117C:
	movs r0, 0x2
_080A117E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1150

	thumb_func_start sub_80A1184
sub_80A1184: @ 80A1184
	ldr r1, _080A118C @ =gUnknown_3005024
	ldr r0, _080A1190 @ =sub_80A1194
	str r0, [r1]
	bx lr
	.align 2, 0
_080A118C: .4byte gUnknown_3005024
_080A1190: .4byte sub_80A1194
	thumb_func_end sub_80A1184

	thumb_func_start sub_80A1194
sub_80A1194: @ 80A1194
	push {lr}
	bl player_bitmagic
	bl ScriptContext2_Enable
	bl sub_807DC00
	ldr r0, _080A11B8 @ =sub_80A11C0
	movs r1, 0xA
	bl CreateTask
	ldr r1, _080A11BC @ =gUnknown_2031DE0
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080A11B8: .4byte sub_80A11C0
_080A11BC: .4byte gUnknown_2031DE0
	thumb_func_end sub_80A1194

	thumb_func_start sub_80A11C0
sub_80A11C0: @ 80A11C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A11E0
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_080A11E0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A11C0

	thumb_func_start sub_80A11E8
sub_80A11E8: @ 80A11E8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A1204 @ =sub_80A1208
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1204: .4byte sub_80A1208
	thumb_func_end sub_80A11E8

	thumb_func_start sub_80A1208
sub_80A1208: @ 80A1208
	push {lr}
	sub sp, 0x24
	mov r1, sp
	ldr r0, _080A1224 @ =gUnknown_203AD30
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	ldr r1, _080A1228 @ =sub_8107EB8
	mov r0, sp
	movs r2, 0
	bl sub_80BEBEC
	add sp, 0x24
	pop {r0}
	bx r0
	.align 2, 0
_080A1224: .4byte gUnknown_203AD30
_080A1228: .4byte sub_8107EB8
	thumb_func_end sub_80A1208

	thumb_func_start sub_80A122C
sub_80A122C: @ 80A122C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x83
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A129A
	adds r0, r4, 0
	bl sub_805A218
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A129A
	adds r0, r4, 0
	bl sub_805A21C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A129A
	adds r0, r4, 0
	bl sub_805A210
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A129A
	adds r0, r4, 0
	bl sub_805A214
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A12BC
_080A129A:
	ldr r1, _080A12B4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xE]
	ldr r3, _080A12B8 @ =gUnknown_8416451
	adds r0, r5, 0
	movs r2, 0x2
	bl sub_80A10C4
	b _080A12F6
	.align 2, 0
_080A12B4: .4byte gTasks
_080A12B8: .4byte gUnknown_8416451
_080A12BC:
	bl sub_8055C9C
	cmp r0, 0x1
	bne _080A12E4
	bl sub_80BD540
	lsls r0, 24
	cmp r0, 0
	bne _080A12E4
	ldr r1, _080A12DC @ =gUnknown_2039998
	ldr r0, _080A12E0 @ =sub_80A1304
	str r0, [r1]
	adds r0, r5, 0
	bl sub_80A103C
	b _080A12F6
	.align 2, 0
_080A12DC: .4byte gUnknown_2039998
_080A12E0: .4byte sub_80A1304
_080A12E4:
	ldr r0, _080A1300 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r5, 0
	bl sub_80A1110
_080A12F6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1300: .4byte gTasks
	thumb_func_end sub_80A122C

	thumb_func_start sub_80A1304
sub_80A1304: @ 80A1304
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080A131C
	movs r0, 0xB
	bl PlaySE
_080A131C:
	movs r0, 0x6
	bl sub_80BD5C8
	bl sub_80696C0
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1304

	thumb_func_start sub_80A1338
sub_80A1338: @ 80A1338
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80A137C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A1360
	ldr r1, _080A1358 @ =gUnknown_2039998
	ldr r0, _080A135C @ =ItemUseOnFieldCB_Rod
	str r0, [r1]
	adds r0, r4, 0
	bl sub_80A103C
	b _080A1372
	.align 2, 0
_080A1358: .4byte gUnknown_2039998
_080A135C: .4byte ItemUseOnFieldCB_Rod
_080A1360:
	ldr r0, _080A1378 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r4, 0
	bl sub_80A1110
_080A1372:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1378: .4byte gTasks
	thumb_func_end sub_80A1338

	thumb_func_start sub_80A137C
sub_80A137C: @ 80A137C
	push {r4-r6,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _080A1404
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080A1404
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080A13D4
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	cmp r0, 0
	beq _080A1404
_080A13D0:
	movs r0, 0x1
	b _080A1406
_080A13D4:
	adds r0, r5, 0
	bl sub_8059CA4
	lsls r0, 24
	cmp r0, 0
	beq _080A13F4
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_8058DC4
	lsls r0, 24
	cmp r0, 0
	beq _080A13D0
_080A13F4:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_8059F58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A13D0
_080A1404:
	movs r0, 0
_080A1406:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80A137C

	thumb_func_start ItemUseOnFieldCB_Rod
ItemUseOnFieldCB_Rod: @ 80A1410
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A1434 @ =gUnknown_203AD30
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 24
	bl sub_805D2C0
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1434: .4byte gUnknown_203AD30
	thumb_func_end ItemUseOnFieldCB_Rod

	thumb_func_start ItemUseOutOfBattle_Itemfinder
ItemUseOutOfBattle_Itemfinder: @ 80A1438
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x27
	bl IncrementGameStat
	ldr r1, _080A1458 @ =gUnknown_2039998
	ldr r0, _080A145C @ =sub_813EC8C
	str r0, [r1]
	adds r0, r4, 0
	bl sub_80A103C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1458: .4byte gUnknown_2039998
_080A145C: .4byte sub_813EC8C
	thumb_func_end ItemUseOutOfBattle_Itemfinder

	thumb_func_start sub_80A1460
sub_80A1460: @ 80A1460
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A14B4 @ =gStringVar1
	bl sub_80D0554
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r4, _080A14B8 @ =gStringVar4
	ldr r1, _080A14BC @ =gUnknown_8416537
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080A14C0 @ =gUnknown_203AD30
	ldrh r2, [r0]
	ldr r3, _080A14C4 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r1, _080A14C8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A14D0
	ldr r3, _080A14CC @ =sub_810A1F8
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_8108E70
	b _080A14DC
	.align 2, 0
_080A14B4: .4byte gStringVar1
_080A14B8: .4byte gStringVar4
_080A14BC: .4byte gUnknown_8416537
_080A14C0: .4byte gUnknown_203AD30
_080A14C4: .4byte 0x0000ffff
_080A14C8: .4byte gTasks
_080A14CC: .4byte sub_810A1F8
_080A14D0:
	ldr r3, _080A14E4 @ =sub_80A112C
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageOnField
_080A14DC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A14E4: .4byte sub_80A112C
	thumb_func_end sub_80A1460

	thumb_func_start sub_80A14E8
sub_80A14E8: @ 80A14E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A1538 @ =gStringVar1
	bl sub_815EFA0
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r4, _080A153C @ =gStringVar4
	ldr r1, _080A1540 @ =gUnknown_8416644
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080A1544 @ =gUnknown_203AD30
	ldrh r2, [r0]
	ldr r3, _080A1548 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r1, _080A154C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A1554
	ldr r3, _080A1550 @ =sub_810A1F8
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_8108E70
	b _080A1560
	.align 2, 0
_080A1538: .4byte gStringVar1
_080A153C: .4byte gStringVar4
_080A1540: .4byte gUnknown_8416644
_080A1544: .4byte gUnknown_203AD30
_080A1548: .4byte 0x0000ffff
_080A154C: .4byte gTasks
_080A1550: .4byte sub_810A1F8
_080A1554:
	ldr r3, _080A1568 @ =sub_80A112C
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl DisplayItemMessageOnField
_080A1560:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1568: .4byte sub_80A112C
	thumb_func_end sub_80A14E8

	thumb_func_start sub_80A156C
sub_80A156C: @ 80A156C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	movs r4, 0
	b _080A1598
_080A1578:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080A15D0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x11
	adds r2, r4, 0
	movs r3, 0
	bl ExecuteTableBasedItemEffect
	lsls r0, 24
	cmp r0, 0
	bne _080A1592
	movs r6, 0x1
_080A1592:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080A1598:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _080A1578
	cmp r6, 0
	beq _080A1600
	ldr r0, _080A15D4 @ =gUnknown_203AD30
	ldrh r2, [r0]
	ldr r3, _080A15D8 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r1, _080A15DC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A15E8
	ldr r2, _080A15E0 @ =gUnknown_8416690
	ldr r3, _080A15E4 @ =sub_80A1648
	b _080A1616
	.align 2, 0
_080A15D0: .4byte gPlayerParty
_080A15D4: .4byte gUnknown_203AD30
_080A15D8: .4byte 0x0000ffff
_080A15DC: .4byte gTasks
_080A15E0: .4byte gUnknown_8416690
_080A15E4: .4byte sub_80A1648
_080A15E8:
	ldr r2, _080A15F8 @ =gUnknown_8416690
	ldr r3, _080A15FC @ =sub_80A1648
	adds r0, r5, 0
	movs r1, 0x2
	bl DisplayItemMessageOnField
	b _080A1638
	.align 2, 0
_080A15F8: .4byte gUnknown_8416690
_080A15FC: .4byte sub_80A1648
_080A1600:
	ldr r0, _080A1620 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080A162C
	ldr r2, _080A1624 @ =gUnknown_841665C
	ldr r3, _080A1628 @ =sub_810A1F8
_080A1616:
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8108E70
	b _080A1638
	.align 2, 0
_080A1620: .4byte gTasks
_080A1624: .4byte gUnknown_841665C
_080A1628: .4byte sub_810A1F8
_080A162C:
	ldr r2, _080A1640 @ =gUnknown_841665C
	ldr r3, _080A1644 @ =sub_80A112C
	adds r0, r5, 0
	movs r1, 0x2
	bl DisplayItemMessageOnField
_080A1638:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1640: .4byte gUnknown_841665C
_080A1644: .4byte sub_80A112C
	thumb_func_end sub_80A156C

	thumb_func_start sub_80A1648
sub_80A1648: @ 80A1648
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xB
	bl PlayFanfareByFanfareNum
	ldr r1, _080A166C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A1670 @ =sub_80A1674
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A166C: .4byte gTasks
_080A1670: .4byte sub_80A1674
	thumb_func_end sub_80A1648

	thumb_func_start sub_80A1674
sub_80A1674: @ 80A1674
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _080A16C0
	ldr r0, _080A16A8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080A16B4
	ldr r2, _080A16AC @ =gUnknown_84166A7
	ldr r3, _080A16B0 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8108E70
	b _080A16C0
	.align 2, 0
_080A16A8: .4byte gTasks
_080A16AC: .4byte gUnknown_84166A7
_080A16B0: .4byte sub_810A1F8
_080A16B4:
	ldr r2, _080A16C8 @ =gUnknown_84166A7
	ldr r3, _080A16CC @ =sub_80A112C
	adds r0, r5, 0
	movs r1, 0x2
	bl DisplayItemMessageOnField
_080A16C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A16C8: .4byte gUnknown_84166A7
_080A16CC: .4byte sub_80A112C
	thumb_func_end sub_80A1674

	thumb_func_start sub_80A16D0
sub_80A16D0: @ 80A16D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A0FBC
	pop {r0}
	bx r0
	thumb_func_end sub_80A16D0

	thumb_func_start sub_80A16E0
sub_80A16E0: @ 80A16E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A16F4 @ =gUnknown_3005E98
	ldr r1, _080A16F8 @ =sub_81252D0
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A16F4: .4byte gUnknown_3005E98
_080A16F8: .4byte sub_81252D0
	thumb_func_end sub_80A16E0

	thumb_func_start sub_80A16FC
sub_80A16FC: @ 80A16FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1710 @ =gUnknown_3005E98
	ldr r1, _080A1714 @ =sub_81256F8
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A1710: .4byte gUnknown_3005E98
_080A1714: .4byte sub_81256F8
	thumb_func_end sub_80A16FC

	thumb_func_start sub_80A1718
sub_80A1718: @ 80A1718
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A172C @ =gUnknown_3005E98
	ldr r1, _080A1730 @ =dp05_pp_up
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A172C: .4byte gUnknown_3005E98
_080A1730: .4byte dp05_pp_up
	thumb_func_end sub_80A1718

	thumb_func_start sub_80A1734
sub_80A1734: @ 80A1734
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1748 @ =gUnknown_3005E98
	ldr r1, _080A174C @ =dp05_rare_candy
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A1748: .4byte gUnknown_3005E98
_080A174C: .4byte dp05_rare_candy
	thumb_func_end sub_80A1734

	thumb_func_start sub_80A1750
sub_80A1750: @ 80A1750
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1764 @ =gUnknown_3005E98
	ldr r1, _080A1768 @ =sub_8126B60
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A1764: .4byte gUnknown_3005E98
_080A1768: .4byte sub_8126B60
	thumb_func_end sub_80A1750

	thumb_func_start sub_80A176C
sub_80A176C: @ 80A176C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1780 @ =gUnknown_3005E98
	ldr r1, _080A1784 @ =sub_8126894
	str r1, [r2]
	bl sub_80A0FBC
	pop {r0}
	bx r0
	.align 2, 0
_080A1780: .4byte gUnknown_3005E98
_080A1784: .4byte sub_8126894
	thumb_func_end sub_80A176C

	thumb_func_start sub_80A1788
sub_80A1788: @ 80A1788
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A17B0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A17B8
	ldr r0, _080A17B4 @ =sub_80A17D4
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A17C8
	.align 2, 0
_080A17B0: .4byte gTasks
_080A17B4: .4byte sub_80A17D4
_080A17B8:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A17D0 @ =sub_80A17E8
	str r0, [r5]
_080A17C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A17D0: .4byte sub_80A17E8
	thumb_func_end sub_80A1788

	thumb_func_start sub_80A17D4
sub_80A17D4: @ 80A17D4
	push {lr}
	ldr r1, _080A17E4 @ =sub_8107EB8
	movs r0, 0
	movs r2, 0
	bl sub_81317F8
	pop {r0}
	bx r0
	.align 2, 0
_080A17E4: .4byte sub_8107EB8
	thumb_func_end sub_80A17D4

	thumb_func_start sub_80A17E8
sub_80A17E8: @ 80A17E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1818 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1812
	bl sub_80563F0
	bl sub_80A1184
	ldr r1, _080A181C @ =c2_exit_to_overworld_2_switch
	movs r0, 0
	movs r2, 0x1
	bl sub_81317F8
	adds r0, r4, 0
	bl DestroyTask
_080A1812:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1818: .4byte gUnknown_2037AB8
_080A181C: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A17E8

	thumb_func_start sub_80A1820
sub_80A1820: @ 80A1820
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A1848 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1850
	ldr r0, _080A184C @ =sub_80A186C
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1860
	.align 2, 0
_080A1848: .4byte gTasks
_080A184C: .4byte sub_80A186C
_080A1850:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1868 @ =sub_80A1880
	str r0, [r5]
_080A1860:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1868: .4byte sub_80A1880
	thumb_func_end sub_80A1820

	thumb_func_start sub_80A186C
sub_80A186C: @ 80A186C
	push {lr}
	ldr r1, _080A187C @ =sub_8107EB8
	movs r0, 0
	movs r2, 0
	bl sub_813CD50
	pop {r0}
	bx r0
	.align 2, 0
_080A187C: .4byte sub_8107EB8
	thumb_func_end sub_80A186C

	thumb_func_start sub_80A1880
sub_80A1880: @ 80A1880
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A18B0 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A18AA
	bl sub_80563F0
	bl sub_80A1184
	ldr r1, _080A18B4 @ =c2_exit_to_overworld_2_switch
	movs r0, 0
	movs r2, 0x1
	bl sub_813CD50
	adds r0, r4, 0
	bl DestroyTask
_080A18AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A18B0: .4byte gUnknown_2037AB8
_080A18B4: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A1880

	thumb_func_start sub_80A18B8
sub_80A18B8: @ 80A18B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A18D4 @ =sub_80A18D8
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A18D4: .4byte sub_80A18D8
	thumb_func_end sub_80A18B8

	thumb_func_start sub_80A18D8
sub_80A18D8: @ 80A18D8
	push {lr}
	ldr r1, _080A18E8 @ =sub_8107ECC
	movs r0, 0x4
	movs r2, 0
	bl sub_813CD50
	pop {r0}
	bx r0
	.align 2, 0
_080A18E8: .4byte sub_8107ECC
	thumb_func_end sub_80A18D8

	thumb_func_start sub_80A18EC
sub_80A18EC: @ 80A18EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1920 @ =gUnknown_203AD30
	ldrh r2, [r0]
	ldr r3, _080A1924 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r1, _080A1928 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1930
	ldr r0, _080A192C @ =sub_80A194C
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1940
	.align 2, 0
_080A1920: .4byte gUnknown_203AD30
_080A1924: .4byte 0x0000ffff
_080A1928: .4byte gTasks
_080A192C: .4byte sub_80A194C
_080A1930:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1948 @ =sub_80A1960
	str r0, [r5]
_080A1940:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1948: .4byte sub_80A1960
	thumb_func_end sub_80A18EC

	thumb_func_start sub_80A194C
sub_80A194C: @ 80A194C
	push {lr}
	ldr r1, _080A195C @ =sub_8107EB8
	movs r0, 0
	bl sub_815ABC4
	pop {r0}
	bx r0
	.align 2, 0
_080A195C: .4byte sub_8107EB8
	thumb_func_end sub_80A194C

	thumb_func_start sub_80A1960
sub_80A1960: @ 80A1960
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1990 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1988
	bl sub_80563F0
	bl sub_80A1184
	ldr r1, _080A1994 @ =c2_exit_to_overworld_2_switch
	movs r0, 0
	bl sub_815ABC4
	adds r0, r4, 0
	bl DestroyTask
_080A1988:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1990: .4byte gUnknown_2037AB8
_080A1994: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A1960

	thumb_func_start sub_80A1998
sub_80A1998: @ 80A1998
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A19C0 @ =0x00004020
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080A19CC
	movs r0, 0x29
	bl PlaySE
	ldr r0, _080A19C4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A19C8 @ =sub_80A19E8
	str r0, [r1]
	b _080A19D8
	.align 2, 0
_080A19C0: .4byte 0x00004020
_080A19C4: .4byte gTasks
_080A19C8: .4byte sub_80A19E8
_080A19CC:
	ldr r2, _080A19E0 @ =gUnknown_841659E
	ldr r3, _080A19E4 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8108E70
_080A19D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A19E0: .4byte gUnknown_841659E
_080A19E4: .4byte sub_810A1F8
	thumb_func_end sub_80A1998

	thumb_func_start sub_80A19E8
sub_80A19E8: @ 80A19E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080A1A2A
	ldr r4, _080A1A30 @ =gUnknown_203AD30
	ldrh r2, [r4]
	ldr r3, _080A1A34 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r5, _080A1A38 @ =0x00004020
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl VarSet
	bl sub_80A1A44
	ldr r2, _080A1A3C @ =gStringVar4
	ldr r3, _080A1A40 @ =sub_810A1F8
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8108E70
_080A1A2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A30: .4byte gUnknown_203AD30
_080A1A34: .4byte 0x0000ffff
_080A1A38: .4byte 0x00004020
_080A1A3C: .4byte gStringVar4
_080A1A40: .4byte sub_810A1F8
	thumb_func_end sub_80A19E8

	thumb_func_start sub_80A1A44
sub_80A1A44: @ 80A1A44
	push {r4,lr}
	ldr r4, _080A1A84 @ =gUnknown_203AD30
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_809A1D8
	ldrh r0, [r4]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	bl sub_8108DC8
	ldrh r0, [r4]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	bl sub_81089F4
	ldrh r0, [r4]
	ldr r1, _080A1A88 @ =gStringVar2
	bl sub_8099E90
	ldr r0, _080A1A8C @ =gStringVar4
	ldr r1, _080A1A90 @ =gUnknown_841658C
	bl StringExpandPlaceholders
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A84: .4byte gUnknown_203AD30
_080A1A88: .4byte gStringVar2
_080A1A8C: .4byte gStringVar4
_080A1A90: .4byte gUnknown_841658C
	thumb_func_end sub_80A1A44

	thumb_func_start sub_80A1A94
sub_80A1A94: @ 80A1A94
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r5, _080A1AD4 @ =gUnknown_203AD30
	ldrh r2, [r5]
	ldr r3, _080A1AD8 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldrh r0, [r5]
	cmp r0, 0x2B
	bne _080A1AF4
	ldr r0, _080A1ADC @ =0x00000803
	bl FlagSet
	ldr r0, _080A1AE0 @ =0x00000804
	bl FlagClear
	ldrh r0, [r5]
	ldr r1, _080A1AE4 @ =gStringVar2
	bl sub_8099E90
	ldr r0, _080A1AE8 @ =gStringVar4
	ldr r1, _080A1AEC @ =gUnknown_84165D2
	bl StringExpandPlaceholders
	ldr r1, _080A1AF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	b _080A1B1A
	.align 2, 0
_080A1AD4: .4byte gUnknown_203AD30
_080A1AD8: .4byte 0x0000ffff
_080A1ADC: .4byte 0x00000803
_080A1AE0: .4byte 0x00000804
_080A1AE4: .4byte gStringVar2
_080A1AE8: .4byte gStringVar4
_080A1AEC: .4byte gUnknown_84165D2
_080A1AF0: .4byte gTasks
_080A1AF4:
	cmp r0, 0x2A
	bne _080A1B26
	ldr r0, _080A1B2C @ =0x00000804
	bl FlagSet
	ldr r0, _080A1B30 @ =0x00000803
	bl FlagClear
	ldrh r0, [r5]
	ldr r1, _080A1B34 @ =gStringVar2
	bl sub_8099E90
	ldr r0, _080A1B38 @ =gStringVar4
	ldr r1, _080A1B3C @ =gUnknown_8416600
	bl StringExpandPlaceholders
	ldr r1, _080A1B40 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
_080A1B1A:
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A1B44 @ =sub_80A1B48
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x18]
_080A1B26:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B2C: .4byte 0x00000804
_080A1B30: .4byte 0x00000803
_080A1B34: .4byte gStringVar2
_080A1B38: .4byte gStringVar4
_080A1B3C: .4byte gUnknown_8416600
_080A1B40: .4byte gTasks
_080A1B44: .4byte sub_80A1B48
	thumb_func_end sub_80A1A94

	thumb_func_start sub_80A1B48
sub_80A1B48: @ 80A1B48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1B80 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080A1B78
	movs r0, 0x6E
	bl PlaySE
	ldr r2, _080A1B84 @ =gStringVar4
	ldr r3, _080A1B88 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8108E70
_080A1B78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B80: .4byte gTasks
_080A1B84: .4byte gStringVar4
_080A1B88: .4byte sub_810A1F8
	thumb_func_end sub_80A1B48

	thumb_func_start sub_80A1B8C
sub_80A1B8C: @ 80A1B8C
	push {lr}
	ldr r0, _080A1BA0 @ =gMapHeader
	ldrb r1, [r0, 0x19]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A1BA4
	movs r0, 0
	b _080A1BA6
	.align 2, 0
_080A1BA0: .4byte gMapHeader
_080A1BA4:
	movs r0, 0x1
_080A1BA6:
	pop {r1}
	bx r1
	thumb_func_end sub_80A1B8C

	thumb_func_start ItemUseOutOfBattle_EscapeRope
ItemUseOutOfBattle_EscapeRope: @ 80A1BAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80A1B8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A1BEC
	ldr r0, _080A1BDC @ =gUnknown_203AD30
	ldrh r2, [r0]
	ldr r0, _080A1BE0 @ =gMapHeader
	ldrb r3, [r0, 0x14]
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r1, _080A1BE4 @ =gUnknown_2039998
	ldr r0, _080A1BE8 @ =sub_80A1C08
	str r0, [r1]
	adds r0, r4, 0
	bl sub_80A103C
	b _080A1BFE
	.align 2, 0
_080A1BDC: .4byte gUnknown_203AD30
_080A1BE0: .4byte gMapHeader
_080A1BE4: .4byte gUnknown_2039998
_080A1BE8: .4byte sub_80A1C08
_080A1BEC:
	ldr r0, _080A1C04 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r4, 0
	bl sub_80A1110
_080A1BFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C04: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EscapeRope

	thumb_func_start sub_80A1C08
sub_80A1C08: @ 80A1C08
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8054D70
	bl sub_80A1A44
	ldr r1, _080A1C38 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r2, _080A1C3C @ =gStringVar4
	ldr r3, _080A1C40 @ =sub_80A1C44
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C38: .4byte gTasks
_080A1C3C: .4byte gStringVar4
_080A1C40: .4byte sub_80A1C44
	thumb_func_end sub_80A1C08

	thumb_func_start sub_80A1C44
sub_80A1C44: @ 80A1C44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80559E4
	bl sub_8085620
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1C44

	thumb_func_start sub_80A1C60
sub_80A1C60: @ 80A1C60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A1C88 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1C90
	ldr r0, _080A1C8C @ =sub_80A1CAC
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1CA0
	.align 2, 0
_080A1C88: .4byte gTasks
_080A1C8C: .4byte sub_80A1CAC
_080A1C90:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1CA8 @ =sub_80A1CC0
	str r0, [r5]
_080A1CA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CA8: .4byte sub_80A1CC0
	thumb_func_end sub_80A1C60

	thumb_func_start sub_80A1CAC
sub_80A1CAC: @ 80A1CAC
	push {lr}
	ldr r1, _080A1CBC @ =sub_8107EB8
	movs r0, 0
	bl sub_80BFF50
	pop {r0}
	bx r0
	.align 2, 0
_080A1CBC: .4byte sub_8107EB8
	thumb_func_end sub_80A1CAC

	thumb_func_start sub_80A1CC0
sub_80A1CC0: @ 80A1CC0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1CF0 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1CE8
	bl sub_80563F0
	bl sub_80A1184
	ldr r1, _080A1CF4 @ =c2_exit_to_overworld_2_switch
	movs r0, 0
	bl sub_80BFF50
	adds r0, r4, 0
	bl DestroyTask
_080A1CE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CF0: .4byte gUnknown_2037AB8
_080A1CF4: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A1CC0

	thumb_func_start sub_80A1CF8
sub_80A1CF8: @ 80A1CF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1D2C @ =gUnknown_203AD30
	ldrh r2, [r0]
	ldr r3, _080A1D30 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r1, _080A1D34 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1D3C
	ldr r0, _080A1D38 @ =sub_80A1D58
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1D4C
	.align 2, 0
_080A1D2C: .4byte gUnknown_203AD30
_080A1D30: .4byte 0x0000ffff
_080A1D34: .4byte gTasks
_080A1D38: .4byte sub_80A1D58
_080A1D3C:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1D54 @ =sub_80A1D68
	str r0, [r5]
_080A1D4C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D54: .4byte sub_80A1D68
	thumb_func_end sub_80A1CF8

	thumb_func_start sub_80A1D58
sub_80A1D58: @ 80A1D58
	push {lr}
	ldr r0, _080A1D64 @ =sub_8107EB8
	bl sub_812C3AC
	pop {r0}
	bx r0
	.align 2, 0
_080A1D64: .4byte sub_8107EB8
	thumb_func_end sub_80A1D58

	thumb_func_start sub_80A1D68
sub_80A1D68: @ 80A1D68
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1D94 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1D8E
	bl sub_80563F0
	bl sub_80A1184
	ldr r0, _080A1D98 @ =c2_exit_to_overworld_2_switch
	bl sub_812C3AC
	adds r0, r4, 0
	bl DestroyTask
_080A1D8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D94: .4byte gUnknown_2037AB8
_080A1D98: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A1D68

	thumb_func_start sub_80A1D9C
sub_80A1D9C: @ 80A1D9C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080A1DE8 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x3
	beq _080A1DB2
	cmp r0, 0x1
	beq _080A1DB2
	cmp r0, 0x2
	bne _080A1DD2
_080A1DB2:
	ldr r0, _080A1DEC @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	bne _080A1DF4
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080A1DD2
	cmp r0, 0x61
	beq _080A1DD2
	cmp r0, 0x6D
	beq _080A1DD2
	cmp r0, 0x79
	bne _080A1DF4
_080A1DD2:
	ldr r0, _080A1DF0 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r2, 0
	bl sub_80A1110
	b _080A1E00
	.align 2, 0
_080A1DE8: .4byte gMapHeader
_080A1DEC: .4byte gSaveBlock1Ptr
_080A1DF0: .4byte gTasks
_080A1DF4:
	ldr r1, _080A1E04 @ =gUnknown_2039998
	ldr r0, _080A1E08 @ =sub_810C670
	str r0, [r1]
	adds r0, r2, 0
	bl sub_80A103C
_080A1E00:
	pop {r0}
	bx r0
	.align 2, 0
_080A1E04: .4byte gUnknown_2039998
_080A1E08: .4byte sub_810C670
	thumb_func_end sub_80A1D9C

	thumb_func_start sub_80A1E0C
sub_80A1E0C: @ 80A1E0C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A112C
	pop {r0}
	bx r0
	thumb_func_end sub_80A1E0C

	thumb_func_start sub_80A1E1C
sub_80A1E1C: @ 80A1E1C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	bne _080A1E48
	ldr r0, _080A1E44 @ =gUnknown_203AD30
	ldrh r0, [r0]
	movs r1, 0x1
	bl sub_809A1D8
	bl sub_8108CB4
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1E54
	.align 2, 0
_080A1E44: .4byte gUnknown_203AD30
_080A1E48:
	ldr r2, _080A1E5C @ =gUnknown_8416631
	ldr r3, _080A1E60 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8108E70
_080A1E54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E5C: .4byte gUnknown_8416631
_080A1E60: .4byte sub_810A1F8
	thumb_func_end sub_80A1E1C

	thumb_func_start sub_80A1E64
sub_80A1E64: @ 80A1E64
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8108CB4
	adds r0, r4, 0
	bl sub_8108B50
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1E64

	thumb_func_start sub_80A1E7C
sub_80A1E7C: @ 80A1E7C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A1EBC @ =gBattlerPartyIndexes
	ldr r0, _080A1EC0 @ =gBattlerInMenuId
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r1, _080A1EC4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080A1EC8 @ =gUnknown_203AD30
	ldrh r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	bl ExecuteTableBasedItemEffect
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080A1ED4
	ldr r2, _080A1ECC @ =gUnknown_84169DC
	ldr r3, _080A1ED0 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8108E70
	b _080A1EE4
	.align 2, 0
_080A1EBC: .4byte gBattlerPartyIndexes
_080A1EC0: .4byte gBattlerInMenuId
_080A1EC4: .4byte gPlayerParty
_080A1EC8: .4byte gUnknown_203AD30
_080A1ECC: .4byte gUnknown_84169DC
_080A1ED0: .4byte sub_810A1F8
_080A1ED4:
	ldr r0, _080A1EEC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x18]
	ldr r0, _080A1EF0 @ =sub_80A1EF4
	str r0, [r1]
_080A1EE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1EEC: .4byte gTasks
_080A1EF0: .4byte sub_80A1EF4
	thumb_func_end sub_80A1E7C

	thumb_func_start sub_80A1EF4
sub_80A1EF4: @ 80A1EF4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	ldr r0, _080A1F3C @ =gTasks+0x8
	adds r1, r0
	ldrh r0, [r1, 0x10]
	adds r0, 0x1
	strh r0, [r1, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080A1F36
	ldr r0, _080A1F40 @ =gUnknown_203AD30
	ldrh r4, [r0]
	movs r0, 0x1
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_809A1D8
	adds r0, r4, 0
	bl sub_8042DA4
	adds r2, r0, 0
	ldr r3, _080A1F44 @ =sub_80A1F48
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8108E70
_080A1F36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F3C: .4byte gTasks+0x8
_080A1F40: .4byte gUnknown_203AD30
_080A1F44: .4byte sub_80A1F48
	thumb_func_end sub_80A1EF4

	thumb_func_start sub_80A1F48
sub_80A1F48: @ 80A1F48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1F74 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A1F62
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A1F6C
_080A1F62:
	bl sub_8108CB4
	adds r0, r4, 0
	bl sub_8108B50
_080A1F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F74: .4byte gMain
	thumb_func_end sub_80A1F48

	thumb_func_start sub_80A1F78
sub_80A1F78: @ 80A1F78
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1F9C @ =gUnknown_203AD30
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080A1FA4
	ldr r0, _080A1FA0 @ =sub_81279E0
	bl sub_813D934
	adds r0, r4, 0
	bl sub_813D808
	b _080A1FB0
	.align 2, 0
_080A1F9C: .4byte gUnknown_203AD30
_080A1FA0: .4byte sub_81279E0
_080A1FA4:
	ldr r0, _080A1FB8 @ =sub_81279E0
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
_080A1FB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1FB8: .4byte sub_81279E0
	thumb_func_end sub_80A1F78

	thumb_func_start sub_80A1FBC
sub_80A1FBC: @ 80A1FBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1FD0 @ =gUnknown_3005E98
	ldr r1, _080A1FD4 @ =ItemUseCB_Medicine
	str r1, [r2]
	bl sub_80A1F78
	pop {r0}
	bx r0
	.align 2, 0
_080A1FD0: .4byte gUnknown_3005E98
_080A1FD4: .4byte ItemUseCB_Medicine
	thumb_func_end sub_80A1FBC

	thumb_func_start sub_80A1FD8
sub_80A1FD8: @ 80A1FD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1FEC @ =gUnknown_3005E98
	ldr r1, _080A1FF0 @ =sub_8126894
	str r1, [r2]
	bl sub_80A1F78
	pop {r0}
	bx r0
	.align 2, 0
_080A1FEC: .4byte gUnknown_3005E98
_080A1FF0: .4byte sub_8126894
	thumb_func_end sub_80A1FD8

	thumb_func_start sub_80A1FF4
sub_80A1FF4: @ 80A1FF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A2008 @ =gUnknown_3005E98
	ldr r1, _080A200C @ =sub_81256F8
	str r1, [r2]
	bl sub_80A1F78
	pop {r0}
	bx r0
	.align 2, 0
_080A2008: .4byte gUnknown_3005E98
_080A200C: .4byte sub_81256F8
	thumb_func_end sub_80A1FF4

	thumb_func_start sub_80A2010
sub_80A2010: @ 80A2010
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A2044 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080A2058
	bl sub_80A1A44
	ldr r0, _080A2048 @ =gUnknown_203AD30
	ldrh r2, [r0]
	ldr r3, _080A204C @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl sub_80A2294
	ldr r2, _080A2050 @ =gStringVar4
	ldr r3, _080A2054 @ =sub_8108B50
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8108E70
	b _080A2060
	.align 2, 0
_080A2044: .4byte gBattleTypeFlags
_080A2048: .4byte gUnknown_203AD30
_080A204C: .4byte 0x0000ffff
_080A2050: .4byte gStringVar4
_080A2054: .4byte sub_8108B50
_080A2058:
	adds r0, r4, 0
	movs r1, 0
	bl sub_80A1110
_080A2060:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2010

	thumb_func_start ItemUseOutOfBattle_EnigmaBerry
ItemUseOutOfBattle_EnigmaBerry: @ 80A2068
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A208C @ =gUnknown_203AD30
	ldrh r0, [r0]
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x14
	bls _080A2082
	b _080A2174
_080A2082:
	lsls r0, 2
	ldr r1, _080A2090 @ =_080A2094
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A208C: .4byte gUnknown_203AD30
_080A2090: .4byte _080A2094
	.align 2, 0
_080A2094:
	.4byte _080A2120
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A2174
	.4byte _080A2174
	.4byte _080A2104
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A2174
	.4byte _080A213C
	.4byte _080A213C
	.4byte _080A2158
_080A20E8:
	ldr r0, _080A2100 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl sub_80A16E0
	b _080A2188
	.align 2, 0
_080A2100: .4byte gTasks
_080A2104:
	ldr r0, _080A211C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl sub_80A176C
	b _080A2188
	.align 2, 0
_080A211C: .4byte gTasks
_080A2120:
	ldr r0, _080A2138 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl sub_80A1734
	b _080A2188
	.align 2, 0
_080A2138: .4byte gTasks
_080A213C:
	ldr r0, _080A2154 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl sub_80A1718
	b _080A2188
	.align 2, 0
_080A2154: .4byte gTasks
_080A2158:
	ldr r0, _080A2170 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl sub_80A16FC
	b _080A2188
	.align 2, 0
_080A2170: .4byte gTasks
_080A2174:
	ldr r0, _080A2190 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x4
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl sub_80A2238
_080A2188:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2190: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EnigmaBerry

	thumb_func_start ItemUseInBattle_EnigmaBerry
ItemUseInBattle_EnigmaBerry: @ 80A2194
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A21B4 @ =gUnknown_203AD30
	ldrh r0, [r0]
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _080A222C
	lsls r0, 2
	ldr r1, _080A21B8 @ =_080A21BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A21B4: .4byte gUnknown_203AD30
_080A21B8: .4byte _080A21BC
	.align 2, 0
_080A21BC:
	.4byte _080A2214
	.4byte _080A222C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A222C
	.4byte _080A221C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A2224
_080A2214:
	adds r0, r4, 0
	bl sub_80A1E7C
	b _080A2232
_080A221C:
	adds r0, r4, 0
	bl sub_80A1FBC
	b _080A2232
_080A2224:
	adds r0, r4, 0
	bl sub_80A1FF4
	b _080A2232
_080A222C:
	adds r0, r4, 0
	bl sub_80A2238
_080A2232:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemUseInBattle_EnigmaBerry

	thumb_func_start sub_80A2238
sub_80A2238: @ 80A2238
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080A2268 @ =gUnknown_203AD30
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080A2278
	ldr r4, _080A226C @ =gStringVar4
	ldr r1, _080A2270 @ =gUnknown_8416425
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _080A2274 @ =sub_813E2B8
	adds r0, r5, 0
	movs r1, 0x4
	adds r2, r4, 0
	bl sub_813EB20
	b _080A228A
	.align 2, 0
_080A2268: .4byte gUnknown_203AD30
_080A226C: .4byte gStringVar4
_080A2270: .4byte gUnknown_8416425
_080A2274: .4byte sub_813E2B8
_080A2278:
	ldr r0, _080A2290 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r5, 0
	bl sub_80A1110
_080A228A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2290: .4byte gTasks
	thumb_func_end sub_80A2238

	thumb_func_start sub_80A2294
sub_80A2294: @ 80A2294
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x8
	bl Alloc
	adds r6, r0, 0
	strh r4, [r6]
	strh r5, [r6, 0x6]
	cmp r7, 0
	beq _080A22C8
	adds r0, r7, 0
	movs r1, 0x41
	bl GetMonData
	b _080A22CA
_080A22C8:
	ldr r0, _080A22E4 @ =0x0000ffff
_080A22CA:
	strh r0, [r6, 0x4]
	mov r0, r8
	adds r1, r6, 0
	bl sub_8113550
	adds r0, r6, 0
	bl Free
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A22E4: .4byte 0x0000ffff
	thumb_func_end sub_80A2294

	.align 2, 0 @ Don't pad with nop.
