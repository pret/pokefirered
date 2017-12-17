	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_806C888
sub_806C888: @ 806C888
	push {r4-r6,lr}
	movs r1, 0x2
	negs r1, r1
	movs r3, 0x3
	negs r3, r3
	movs r4, 0x5
	negs r4, r4
	movs r5, 0x9
	negs r5, r5
	movs r6, 0x11
	negs r6, r6
	movs r2, 0
	strb r2, [r0]
	ldrb r2, [r0, 0x1]
	ands r1, r2
	ands r1, r3
	ands r1, r4
	ands r1, r5
	ands r1, r6
	strb r1, [r0, 0x1]
	movs r1, 0
	strb r1, [r0, 0x2]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806C888

	thumb_func_start sub_806C8BC
sub_806C8BC: @ 806C8BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	mov r0, sp
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x2
	strh r2, [r4]
	ldr r0, _0806CA14 @ =gUnknown_2037078
	ldrb r1, [r0, 0x2]
	mov r8, r1
	ldrb r6, [r0, 0x3]
	bl cur_mapdata_block_role_at_player_pos
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059D70
	lsls r0, 24
	lsrs r7, r0, 24
	bl ScriptContext1_IsScriptSetUp
	lsls r0, 24
	cmp r0, 0
	bne _0806C908
	bl sub_806997C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806C908
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_806CA4C
_0806C908:
	cmp r6, 0x2
	bne _0806C910
	cmp r7, 0
	beq _0806C914
_0806C910:
	cmp r6, 0
	bne _0806C9D0
_0806C914:
	bl sub_80BD674
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _0806C9AC
	mov r0, sp
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0806C940
	ldr r0, _0806CA14 @ =gUnknown_2037078
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0806C940
	ldrb r0, [r5]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5]
_0806C940:
	ldr r0, _0806CA18 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806C9D0
	ldr r0, _0806CA14 @ =gUnknown_2037078
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0806C9AC
	mov r0, sp
	ldrh r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0806C96E
	ldrb r0, [r5]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r5]
_0806C96E:
	mov r0, sp
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806C982
	ldrb r0, [r5]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5]
_0806C982:
	mov r0, sp
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806C996
	ldrb r0, [r5]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r5]
_0806C996:
	mov r0, sp
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _0806C9AC
	ldrb r0, [r5, 0x1]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5, 0x1]
_0806C9AC:
	ldr r0, _0806CA18 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806C9D0
	ldrh r1, [r4]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _0806C9D0
	ldrb r0, [r5]
	movs r1, 0x10
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5]
_0806C9D0:
	cmp r7, 0
	bne _0806C9F6
	cmp r6, 0x2
	bne _0806C9E6
	mov r0, r8
	cmp r0, 0x2
	bne _0806C9E6
	ldrb r0, [r5]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5]
_0806C9E6:
	cmp r7, 0
	bne _0806C9F6
	cmp r6, 0x2
	bne _0806C9F6
	ldrb r0, [r5]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r5]
_0806C9F6:
	ldr r0, _0806CA18 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806CA40
	ldrh r1, [r4]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0806CA1C
	movs r0, 0x2
	b _0806CA3E
	.align 2, 0
_0806CA14: .4byte gUnknown_2037078
_0806CA18: .4byte gUnknown_203ADFA
_0806CA1C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806CA28
	movs r0, 0x1
	b _0806CA3E
_0806CA28:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806CA34
	movs r0, 0x3
	b _0806CA3E
_0806CA34:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0806CA40
	movs r0, 0x4
_0806CA3E:
	strb r0, [r5, 0x2]
_0806CA40:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806C8BC

	thumb_func_start sub_806CA4C
sub_806CA4C: @ 806CA4C
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	bl sub_80699B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bhi _0806CABA
	lsls r0, 2
	ldr r1, _0806CA68 @ =_0806CA6C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806CA68: .4byte _0806CA6C
	.align 2, 0
_0806CA6C:
	.4byte _0806CABA
	.4byte _0806CA90
	.4byte _0806CA94
	.4byte _0806CA98
	.4byte _0806CA9C
	.4byte _0806CAA0
	.4byte _0806CAA8
	.4byte _0806CAB0
	.4byte _0806CAB4
_0806CA90:
	movs r0, 0x40
	b _0806CAB6
_0806CA94:
	movs r0, 0x80
	b _0806CAB6
_0806CA98:
	movs r0, 0x20
	b _0806CAB6
_0806CA9C:
	movs r0, 0x10
	b _0806CAB6
_0806CAA0:
	movs r1, 0x80
	lsls r1, 2
	adds r0, r1, 0
	b _0806CAB6
_0806CAA8:
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	b _0806CAB6
_0806CAB0:
	movs r0, 0x8
	b _0806CAB6
_0806CAB4:
	movs r0, 0x4
_0806CAB6:
	strh r0, [r4]
	strh r0, [r5]
_0806CABA:
	bl sub_8069970
	bl sub_80699A4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806CA4C

	thumb_func_start sub_806CAC8
sub_806CAC8: @ 806CAC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r5, r0, 0
	bl sub_8069A54
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0xFF
	bl sub_8058F48
	mov r8, r0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r7, _0806CB70 @ =gUnknown_3005078
	adds r0, r7, 0
	bl sub_806C888
	ldrb r0, [r5, 0x2]
	strb r0, [r7, 0x2]
	bl sub_8081B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806CB6C
	bl sub_8069C74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806CB6C
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0806CB74
	movs r0, 0x5
	bl IncrementGameStat
	bl sub_8146CA4
	bl sub_815D8C8
	bl sub_80CC918
	bl sub_80CB054
	bl sub_80CCFBC
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806D5E8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CB74
	ldrb r0, [r7]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r7]
_0806CB6C:
	movs r0, 0x1
	b _0806CD22
	.align 2, 0
_0806CB70: .4byte gUnknown_3005078
_0806CB74:
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806CBFC
	ldrb r0, [r5, 0x2]
	cmp r0, 0
	beq _0806CB88
	cmp r0, r6
	bne _0806CBD8
_0806CB88:
	mov r7, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r7, r2]
	bl sub_8058F78
	lsls r0, 16
	lsrs r4, r0, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806D804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CBC0
	ldr r0, _0806CBBC @ =gUnknown_3005078
	ldrb r1, [r0]
	movs r2, 0x2
	b _0806CD16
	.align 2, 0
_0806CBBC: .4byte gUnknown_3005078
_0806CBC0:
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r7, r2]
	bl sub_8058F78
	lsls r0, 16
	lsrs r4, r0, 16
_0806CBD8:
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806CBFC
	mov r0, r8
	bl sub_806D7F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CBFC
	ldr r0, _0806CBF8 @ =gUnknown_3005078
	ldrb r1, [r0]
	movs r2, 0x2
	b _0806CD16
	.align 2, 0
_0806CBF8: .4byte gUnknown_3005078
_0806CBFC:
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0806CC2C
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _0806CC2C
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806D964
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CC2C
	ldr r0, _0806CC28 @ =gUnknown_3005078
	ldrb r1, [r0]
	movs r2, 0x10
	b _0806CD16
	.align 2, 0
_0806CC28: .4byte gUnknown_3005078
_0806CC2C:
	mov r4, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0806CC74
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _0806CC74
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806D804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CC74
	ldr r0, _0806CC70 @ =gUnknown_3005078
	ldrb r1, [r0]
	movs r2, 0x10
	b _0806CD16
	.align 2, 0
_0806CC70: .4byte gUnknown_3005078
_0806CC74:
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806CC9C
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806CEA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CC9C
	ldr r0, _0806CC98 @ =gUnknown_3005078
	ldrb r1, [r0]
	movs r2, 0x1
	b _0806CD16
	.align 2, 0
_0806CC98: .4byte gUnknown_3005078
_0806CC9C:
	ldrb r1, [r5]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806CCCC
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _0806CCCC
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806DCD0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CCCC
	ldr r0, _0806CCC8 @ =gUnknown_3005078
	ldrb r1, [r0]
	movs r2, 0x20
	b _0806CD16
	.align 2, 0
_0806CCC8: .4byte gUnknown_3005078
_0806CCCC:
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0806CCFC
	ldr r2, _0806CCF4 @ =gUnknown_3005078
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0806CCF8 @ =0x0000083e
	bl FlagSet
	movs r0, 0x6
	bl sub_80722CC
	bl sub_806F258
	b _0806CB6C
	.align 2, 0
_0806CCF4: .4byte gUnknown_3005078
_0806CCF8: .4byte 0x0000083e
_0806CCFC:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0806CD20
	bl sub_810AD10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CD20
	ldr r0, _0806CD1C @ =gUnknown_3005078
	ldrb r1, [r0]
	movs r2, 0x8
_0806CD16:
	orrs r1, r2
	strb r1, [r0]
	b _0806CB6C
	.align 2, 0
_0806CD1C: .4byte gUnknown_3005078
_0806CD20:
	movs r0, 0
_0806CD22:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806CAC8

	thumb_func_start sub_806CD30
sub_806CD30: @ 806CD30
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext1_IsScriptSetUp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CDEA
	ldr r1, _0806CD50 @ =gUnknown_20370A0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0806CD54
	subs r0, 0x1
	strb r0, [r1]
	b _0806CDEA
	.align 2, 0
_0806CD50: .4byte gUnknown_20370A0
_0806CD54:
	bl sub_8069A04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806CDEA
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _0806CDC0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x2]
	cmp r0, r1
	beq _0806CDC0
	bl sub_80699D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806CDEA
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	bne _0806CD8E
	movs r0, 0x1
	bl sub_8069998
	b _0806CDB0
_0806CD8E:
	cmp r0, 0x1
	bne _0806CD9A
	movs r0, 0x2
	bl sub_8069998
	b _0806CDB0
_0806CD9A:
	cmp r0, 0x3
	bne _0806CDA6
	movs r0, 0x3
	bl sub_8069998
	b _0806CDB0
_0806CDA6:
	cmp r0, 0x4
	bne _0806CDB0
	movs r0, 0x4
	bl sub_8069998
_0806CDB0:
	ldr r0, _0806CDBC @ =gUnknown_81A7ADB
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	b _0806CDEA
	.align 2, 0
_0806CDBC: .4byte gUnknown_81A7ADB
_0806CDC0:
	ldrb r1, [r4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0806CDEA
	ldr r0, _0806CDF0 @ =gUnknown_81A7ADB
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	ldr r4, _0806CDF4 @ =sub_806CDF8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806CDEA
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
_0806CDEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CDF0: .4byte gUnknown_81A7ADB
_0806CDF4: .4byte sub_806CDF8
	thumb_func_end sub_806CD30

	thumb_func_start sub_806CDF8
sub_806CDF8: @ 806CDF8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _0806CE18
	movs r0, 0x6
	bl sub_80722CC
	bl sub_806F258
	adds r0, r4, 0
	bl DestroyTask
_0806CE18:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CDF8

	thumb_func_start player_get_pos_to_and_height
player_get_pos_to_and_height: @ 806CE20
	push {r4,lr}
	adds r4, r0, 0
	adds r1, r4, 0x2
	bl PlayerGetDestCoords
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end player_get_pos_to_and_height

	thumb_func_start player_get_next_pos_and_height
player_get_next_pos_and_height: @ 806CE38
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r1, r5, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
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
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806CE6A
	bl PlayerGetZCoord
_0806CE6A:
	strb r0, [r5, 0x4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end player_get_next_pos_and_height

	thumb_func_start cur_mapdata_block_role_at_player_pos
cur_mapdata_block_role_at_player_pos: @ 806CE74
	push {r4,lr}
	sub sp, 0x4
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
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_block_role_at_player_pos

	thumb_func_start sub_806CEA0
sub_806CEA0: @ 806CEA0
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	bl TryGetScriptOnPressingA
	adds r4, r0, 0
	cmp r4, 0
	bne _0806CEB8
	movs r0, 0
	b _0806CED2
_0806CEB8:
	ldr r0, _0806CED8 @ =gUnknown_8168CE4
	cmp r4, r0
	beq _0806CECA
	ldr r0, _0806CEDC @ =gUnknown_81A6955
	cmp r4, r0
	beq _0806CECA
	movs r0, 0x5
	bl sub_80722CC
_0806CECA:
	adds r0, r4, 0
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_0806CED2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806CED8: .4byte gUnknown_8168CE4
_0806CEDC: .4byte gUnknown_81A6955
	thumb_func_end sub_806CEA0

	thumb_func_start TryGetScriptOnPressingA
TryGetScriptOnPressingA: @ 806CEE0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r4, r2, 24
	adds r7, r4, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806CFF4
	cmp r0, 0
	bne _0806CF2C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806D0E4
	cmp r0, 0
	bne _0806CF2C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806D1F0
	cmp r0, 0
	bne _0806CF2C
	adds r0, r6, 0
	mov r1, r8
	adds r2, r7, 0
	bl sub_806D548
	cmp r0, 0
	bne _0806CF2C
	movs r0, 0
_0806CF2C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetScriptOnPressingA

	thumb_func_start sub_806CF38
sub_806CF38: @ 806CF38
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	cmp r0, 0
	bne _0806CF60
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	b _0806CF7E
_0806CF60:
	ldr r1, _0806CFA4 @ =gUnknown_826D2D8
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
_0806CF7E:
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _0806CF9E
	ldr r1, _0806CFA8 @ =gUnknown_2036E38
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	adds r5, r1, 0
	cmp r0, 0xFF
	bne _0806CFAC
_0806CF9E:
	movs r0, 0
	b _0806CFDE
	.align 2, 0
_0806CFA4: .4byte gUnknown_826D2D8
_0806CFA8: .4byte gUnknown_2036E38
_0806CFAC:
	movs r4, 0
	ldr r1, _0806CFE4 @ =gUnknown_2031DEC
_0806CFB0:
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _0806CFBC
	ldrb r0, [r1, 0x2]
	cmp r0, r3
	beq _0806CF9E
_0806CFBC:
	adds r1, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _0806CFB0
	ldr r0, _0806CFE8 @ =gUnknown_3005074
	strb r3, [r0]
	ldr r1, _0806CFEC @ =gUnknown_20370D2
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	ldr r0, _0806CFF0 @ =gUnknown_20370D4
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
_0806CFDE:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806CFE4: .4byte gUnknown_2031DEC
_0806CFE8: .4byte gUnknown_3005074
_0806CFEC: .4byte gUnknown_20370D2
_0806CFF0: .4byte gUnknown_20370D4
	thumb_func_end sub_806CF38

	thumb_func_start sub_806CFF4
sub_806CFF4: @ 806CFF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x10
	beq _0806D02A
	ldr r2, _0806D098 @ =gUnknown_2036E38
	lsls r1, r5, 3
	adds r0, r1, r5
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x8]
	adds r6, r1, 0
	cmp r0, 0xFF
	bne _0806D078
_0806D02A:
	adds r0, r7, 0
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D092
	ldr r1, _0806D09C @ =gUnknown_826D2D8
	mov r0, r8
	lsls r2, r0, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x10
	beq _0806D092
	ldr r2, _0806D098 @ =gUnknown_2036E38
	lsls r1, r5, 3
	adds r0, r1, r5
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x8]
	adds r6, r1, 0
	cmp r0, 0xFF
	beq _0806D092
_0806D078:
	bl InUnionRoom
	cmp r0, 0x1
	bne _0806D0A0
	adds r0, r6, r5
	lsls r0, 2
	ldr r1, _0806D098 @ =gUnknown_2036E38
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	bne _0806D0A0
_0806D092:
	movs r0, 0
	b _0806D0C8
	.align 2, 0
_0806D098: .4byte gUnknown_2036E38
_0806D09C: .4byte gUnknown_826D2D8
_0806D0A0:
	ldr r0, _0806D0D4 @ =gUnknown_3005074
	strb r5, [r0]
	ldr r4, _0806D0D8 @ =gUnknown_20370D2
	ldr r1, _0806D0DC @ =gUnknown_2036E38
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	strh r0, [r4]
	ldr r0, _0806D0E0 @ =gUnknown_20370D4
	mov r1, r8
	strh r1, [r0]
	adds r0, r5, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r1, r0, 0
	ldrb r0, [r4]
	bl GetRamScript
	adds r1, r0, 0
_0806D0C8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806D0D4: .4byte gUnknown_3005074
_0806D0D8: .4byte gUnknown_20370D2
_0806D0DC: .4byte gUnknown_2036E38
_0806D0E0: .4byte gUnknown_20370D4
	thumb_func_end sub_806CFF4

	thumb_func_start sub_806D0E4
sub_806D0E4: @ 806D0E4
	push {r4-r7,lr}
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r4, _0806D118 @ =gUnknown_2036DFC
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl FindInvisibleMapObjectByPosition
	adds r5, r0, 0
	cmp r5, 0
	beq _0806D164
	ldr r0, [r5, 0x8]
	cmp r0, 0
	bne _0806D120
	ldr r0, _0806D11C @ =gUnknown_81C555B
	b _0806D1E6
	.align 2, 0
_0806D118: .4byte gUnknown_2036DFC
_0806D11C: .4byte gUnknown_81C555B
_0806D120:
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_806D898
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r5, 0x5]
	cmp r0, 0x7
	bhi _0806D1D8
	lsls r0, 2
	ldr r1, _0806D13C @ =_0806D140
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806D13C: .4byte _0806D140
	.align 2, 0
_0806D140:
	.4byte _0806D1D8
	.4byte _0806D160
	.4byte _0806D168
	.4byte _0806D16E
	.4byte _0806D174
	.4byte _0806D17A
	.4byte _0806D17A
	.4byte _0806D17A
_0806D160:
	cmp r6, 0x2
	beq _0806D1D8
_0806D164:
	movs r0, 0
	b _0806D1E6
_0806D168:
	cmp r6, 0x1
	beq _0806D1D8
	b _0806D164
_0806D16E:
	cmp r6, 0x4
	beq _0806D1D8
	b _0806D164
_0806D174:
	cmp r6, 0x3
	beq _0806D1D8
	b _0806D164
_0806D17A:
	ldr r0, [r5, 0x8]
	movs r1, 0x3
	bl sub_80CC44C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _0806D164
	ldr r0, [r5, 0x8]
	movs r1, 0
	bl sub_80CC44C
	ldr r1, _0806D1C4 @ =gUnknown_20370C2
	strh r0, [r1]
	ldr r0, [r5, 0x8]
	movs r1, 0x1
	bl sub_80CC44C
	ldr r4, _0806D1C8 @ =gUnknown_20370C0
	strh r0, [r4]
	ldr r0, [r5, 0x8]
	movs r1, 0x2
	bl sub_80CC44C
	ldr r1, _0806D1CC @ =gUnknown_20370C4
	strh r0, [r1]
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D164
	ldr r0, _0806D1D0 @ =gUnknown_20370D4
	strh r6, [r0]
	ldr r0, _0806D1D4 @ =gUnknown_81A6843
	b _0806D1E6
	.align 2, 0
_0806D1C4: .4byte gUnknown_20370C2
_0806D1C8: .4byte gUnknown_20370C0
_0806D1CC: .4byte gUnknown_20370C4
_0806D1D0: .4byte gUnknown_20370D4
_0806D1D4: .4byte gUnknown_81A6843
_0806D1D8:
	cmp r2, 0xFF
	beq _0806D1E0
	bl sub_8069A20
_0806D1E0:
	ldr r0, _0806D1EC @ =gUnknown_20370D4
	strh r6, [r0]
	ldr r0, [r5, 0x8]
_0806D1E6:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806D1EC: .4byte gUnknown_20370D4
	thumb_func_end sub_806D0E4

	thumb_func_start sub_806D1F0
sub_806D1F0: @ 806D1F0
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r0, _0806D210 @ =gUnknown_20370D4
	strh r5, [r0]
	adds r0, r4, 0
	bl MetatileBehavior_IsPC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D218
	ldr r0, _0806D214 @ =gUnknown_81A6955
	b _0806D53E
	.align 2, 0
_0806D210: .4byte gUnknown_20370D4
_0806D214: .4byte gUnknown_81A6955
_0806D218:
	adds r0, r4, 0
	bl sub_805A134
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D230
	ldr r0, _0806D22C @ =gUnknown_81A6C32
	b _0806D53E
	.align 2, 0
_0806D22C: .4byte gUnknown_81A6C32
_0806D230:
	adds r0, r4, 0
	bl sub_805A24C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D248
	ldr r0, _0806D244 @ =gUnknown_81A7606
	b _0806D53E
	.align 2, 0
_0806D244: .4byte gUnknown_81A7606
_0806D248:
	adds r0, r4, 0
	bl sub_805A260
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D260
	ldr r0, _0806D25C @ =gUnknown_81A760F
	b _0806D53E
	.align 2, 0
_0806D25C: .4byte gUnknown_81A760F
_0806D260:
	adds r0, r4, 0
	bl sub_805A44C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D278
	ldr r0, _0806D274 @ =gUnknown_81A7618
	b _0806D53E
	.align 2, 0
_0806D274: .4byte gUnknown_81A7618
_0806D278:
	adds r0, r4, 0
	bl sub_805A558
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D290
	ldr r0, _0806D28C @ =gUnknown_81A7633
	b _0806D53E
	.align 2, 0
_0806D28C: .4byte gUnknown_81A7633
_0806D290:
	adds r0, r4, 0
	bl sub_805A474
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D2A8
	ldr r0, _0806D2A4 @ =gUnknown_81A763C
	b _0806D53E
	.align 2, 0
_0806D2A4: .4byte gUnknown_81A763C
_0806D2A8:
	adds r0, r4, 0
	bl sub_805A56C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D2C0
	ldr r0, _0806D2BC @ =gUnknown_81A7621
	b _0806D53E
	.align 2, 0
_0806D2BC: .4byte gUnknown_81A7621
_0806D2C0:
	adds r0, r4, 0
	bl sub_805A580
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D2D8
	ldr r0, _0806D2D4 @ =gUnknown_81A7645
	b _0806D53E
	.align 2, 0
_0806D2D4: .4byte gUnknown_81A7645
_0806D2D8:
	adds r0, r4, 0
	bl sub_805A4C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D2F0
	ldr r0, _0806D2EC @ =gUnknown_81A762A
	b _0806D53E
	.align 2, 0
_0806D2EC: .4byte gUnknown_81A762A
_0806D2F0:
	adds r0, r4, 0
	bl sub_805A594
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D308
	ldr r0, _0806D304 @ =gUnknown_81C549C
	b _0806D53E
	.align 2, 0
_0806D304: .4byte gUnknown_81C549C
_0806D308:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MetatileBehavior_IsPlayerFacingTVScreen
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D320
	ldr r0, _0806D31C @ =gUnknown_81A764E
	b _0806D53E
	.align 2, 0
_0806D31C: .4byte gUnknown_81A764E
_0806D320:
	adds r0, r4, 0
	bl sub_805A374
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D338
	ldr r0, _0806D334 @ =gUnknown_81A7657
	b _0806D53E
	.align 2, 0
_0806D334: .4byte gUnknown_81A7657
_0806D338:
	adds r0, r4, 0
	bl sub_805A388
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D350
	ldr r0, _0806D34C @ =gUnknown_81A7660
	b _0806D53E
	.align 2, 0
_0806D34C: .4byte gUnknown_81A7660
_0806D350:
	adds r0, r4, 0
	bl sub_805A39C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D368
	ldr r0, _0806D364 @ =gUnknown_81A7669
	b _0806D53E
	.align 2, 0
_0806D364: .4byte gUnknown_81A7669
_0806D368:
	adds r0, r4, 0
	bl sub_805A3B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D380
	ldr r0, _0806D37C @ =gUnknown_81A7672
	b _0806D53E
	.align 2, 0
_0806D37C: .4byte gUnknown_81A7672
_0806D380:
	adds r0, r4, 0
	bl sub_805A488
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D398
	ldr r0, _0806D394 @ =gUnknown_81A767B
	b _0806D53E
	.align 2, 0
_0806D394: .4byte gUnknown_81A767B
_0806D398:
	adds r0, r4, 0
	bl sub_805A49C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D3B0
	ldr r0, _0806D3AC @ =gUnknown_81A7684
	b _0806D53E
	.align 2, 0
_0806D3AC: .4byte gUnknown_81A7684
_0806D3B0:
	adds r0, r4, 0
	bl sub_805A4B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D3C8
	ldr r0, _0806D3C4 @ =gUnknown_81A768D
	b _0806D53E
	.align 2, 0
_0806D3C4: .4byte gUnknown_81A768D
_0806D3C8:
	adds r0, r4, 0
	bl sub_805A4D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D3E0
	ldr r0, _0806D3DC @ =gUnknown_81A7696
	b _0806D53E
	.align 2, 0
_0806D3DC: .4byte gUnknown_81A7696
_0806D3E0:
	adds r0, r4, 0
	bl sub_805A4EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D3F8
	ldr r0, _0806D3F4 @ =gUnknown_81A769F
	b _0806D53E
	.align 2, 0
_0806D3F4: .4byte gUnknown_81A769F
_0806D3F8:
	adds r0, r4, 0
	bl sub_805A500
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D410
	ldr r0, _0806D40C @ =gUnknown_81A76A8
	b _0806D53E
	.align 2, 0
_0806D40C: .4byte gUnknown_81A76A8
_0806D410:
	adds r0, r4, 0
	bl sub_805A514
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D428
	ldr r0, _0806D424 @ =gUnknown_81A76B1
	b _0806D53E
	.align 2, 0
_0806D424: .4byte gUnknown_81A76B1
_0806D428:
	adds r0, r4, 0
	bl sub_805A528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D440
	ldr r0, _0806D43C @ =gUnknown_81A76BA
	b _0806D53E
	.align 2, 0
_0806D43C: .4byte gUnknown_81A76BA
_0806D440:
	adds r0, r4, 0
	bl sub_805A52C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D458
	ldr r0, _0806D454 @ =gUnknown_81A76C3
	b _0806D53E
	.align 2, 0
_0806D454: .4byte gUnknown_81A76C3
_0806D458:
	adds r0, r4, 0
	bl sub_805A530
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D470
	ldr r0, _0806D46C @ =gUnknown_81A76CC
	b _0806D53E
	.align 2, 0
_0806D46C: .4byte gUnknown_81A76CC
_0806D470:
	adds r0, r4, 0
	bl sub_805A544
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D488
	ldr r0, _0806D484 @ =gUnknown_81A76D5
	b _0806D53E
	.align 2, 0
_0806D484: .4byte gUnknown_81A76D5
_0806D488:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805A3D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D4A0
	ldr r0, _0806D49C @ =gUnknown_81BBFD8
	b _0806D53E
	.align 2, 0
_0806D49C: .4byte gUnknown_81BBFD8
_0806D4A0:
	adds r0, r4, 0
	bl sub_805A410
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D4B8
	ldr r0, _0806D4B4 @ =gUnknown_81A7702
	b _0806D53E
	.align 2, 0
_0806D4B4: .4byte gUnknown_81A7702
_0806D4B8:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805A3F4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D4D0
	ldr r0, _0806D4CC @ =gUnknown_81BB8A7
	b _0806D53E
	.align 2, 0
_0806D4CC: .4byte gUnknown_81BB8A7
_0806D4D0:
	adds r0, r4, 0
	bl sub_805A424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D4EC
	bl sub_8069A20
	ldr r0, _0806D4E8 @ =gUnknown_81A76F0
	b _0806D53E
	.align 2, 0
_0806D4E8: .4byte gUnknown_81A76F0
_0806D4EC:
	adds r0, r4, 0
	bl sub_805A438
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D508
	bl sub_8069A20
	ldr r0, _0806D504 @ =gUnknown_81A76F9
	b _0806D53E
	.align 2, 0
_0806D504: .4byte gUnknown_81A76F9
_0806D508:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805A290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D524
	bl sub_8069A20
	ldr r0, _0806D520 @ =gUnknown_81A76DE
	b _0806D53E
	.align 2, 0
_0806D520: .4byte gUnknown_81A76DE
_0806D524:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805A274
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D538
	movs r0, 0
	b _0806D53E
_0806D538:
	bl sub_8069A20
	ldr r0, _0806D544 @ =gUnknown_81A76E7
_0806D53E:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806D544: .4byte gUnknown_81A76E7
	thumb_func_end sub_806D1F0

	thumb_func_start sub_806D548
sub_806D548: @ 806D548
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r4, 0
	bl sub_8059CC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D570
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D570
	ldr r0, _0806D56C @ =gUnknown_81A6B0D
	b _0806D5E2
	.align 2, 0
_0806D56C: .4byte gUnknown_81A6B0D
_0806D570:
	ldr r0, _0806D59C @ =0x00000824
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D5A4
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D5A4
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D5A4
	ldr r0, _0806D5A0 @ =gUnknown_81A6AC8
	b _0806D5E2
	.align 2, 0
_0806D59C: .4byte 0x00000824
_0806D5A0: .4byte gUnknown_81A6AC8
_0806D5A4:
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D5E0
	ldr r0, _0806D5D0 @ =0x00000826
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D5D8
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D5D8
	ldr r0, _0806D5D4 @ =gUnknown_81BE2B7
	b _0806D5E2
	.align 2, 0
_0806D5D0: .4byte 0x00000826
_0806D5D4: .4byte gUnknown_81BE2B7
_0806D5D8:
	ldr r0, _0806D5DC @ =gUnknown_81BE2FF
	b _0806D5E2
	.align 2, 0
_0806D5DC: .4byte gUnknown_81BE2FF
_0806D5E0:
	movs r0, 0
_0806D5E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806D548

	thumb_func_start sub_806D5E8
sub_806D5E8: @ 806D5E8
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl sub_806D660
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D650
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806DA10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D650
	adds r0, r4, 0
	bl sub_806D694
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D650
	adds r0, r4, 0
	bl sub_806D698
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D650
	ldr r0, _0806D654 @ =gUnknown_2037078
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0806D658
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_8059D70
	lsls r0, 24
	cmp r0, 0
	bne _0806D658
	bl sub_80830B8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D658
_0806D650:
	movs r0, 0x1
	b _0806D65A
	.align 2, 0
_0806D654: .4byte gUnknown_2037078
_0806D658:
	movs r0, 0
_0806D65A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806D5E8

	thumb_func_start sub_806D660
sub_806D660: @ 806D660
	push {r4,lr}
	ldr r4, _0806D688 @ =gUnknown_2036DFC
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	cmp r0, 0
	beq _0806D68C
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _0806D68E
	.align 2, 0
_0806D688: .4byte gUnknown_2036DFC
_0806D68C:
	movs r0, 0
_0806D68E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806D660

	thumb_func_start sub_806D694
sub_806D694: @ 806D694
	movs r0, 0
	bx lr
	thumb_func_end sub_806D694

	thumb_func_start sub_806D698
sub_806D698: @ 806D698
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl InUnionRoom
	cmp r0, 0x1
	beq _0806D72C
	ldr r0, _0806D6E0 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0806D72C
	bl AdjustFriendship_step
	ldr r0, _0806D6E4 @ =gUnknown_2037078
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0806D720
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_8059D70
	lsls r0, 24
	cmp r0, 0
	bne _0806D720
	bl sub_810C4EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D6EC
	ldr r0, _0806D6E8 @ =gUnknown_81A8CED
	bl ScriptContext1_SetupScript
	b _0806D730
	.align 2, 0
_0806D6E0: .4byte gUnknown_203ADFA
_0806D6E4: .4byte gUnknown_2037078
_0806D6E8: .4byte gUnknown_81A8CED
_0806D6EC:
	bl overworld_poison_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D704
	ldr r0, _0806D700 @ =gUnknown_81A8DFD
	bl ScriptContext1_SetupScript
	b _0806D730
	.align 2, 0
_0806D700: .4byte gUnknown_81A8DFD
_0806D704:
	bl sub_80463B8
	lsls r0, 24
	cmp r0, 0
	beq _0806D720
	movs r0, 0xD
	bl IncrementGameStat
	ldr r0, _0806D71C @ =gUnknown_81BF546
	bl ScriptContext1_SetupScript
	b _0806D730
	.align 2, 0
_0806D71C: .4byte gUnknown_81BF546
_0806D720:
	bl sub_80A0F0C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D730
_0806D72C:
	movs r0, 0
	b _0806D732
_0806D730:
	movs r0, 0x1
_0806D732:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806D698

	thumb_func_start sub_806D738
sub_806D738: @ 806D738
	push {lr}
	ldr r0, _0806D748 @ =0x00004021
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806D748: .4byte 0x00004021
	thumb_func_end sub_806D738

	thumb_func_start AdjustFriendship_step
AdjustFriendship_step: @ 806D74C
	push {r4,r5,lr}
	ldr r0, _0806D780 @ =0x00004021
	bl sub_806E454
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _0806D77A
	ldr r5, _0806D784 @ =gUnknown_2024284
	movs r4, 0x5
_0806D76A:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_80436F8
	adds r5, 0x64
	subs r4, 0x1
	cmp r4, 0
	bge _0806D76A
_0806D77A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D780: .4byte 0x00004021
_0806D784: .4byte gUnknown_2024284
	thumb_func_end AdjustFriendship_step

	thumb_func_start overworld_poison_timer_set
overworld_poison_timer_set: @ 806D788
	push {lr}
	ldr r0, _0806D798 @ =0x00004022
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806D798: .4byte 0x00004022
	thumb_func_end overworld_poison_timer_set

	thumb_func_start overworld_poison_step
overworld_poison_step: @ 806D79C
	push {r4,lr}
	ldr r0, _0806D7D8 @ =gUnknown_2036DFC
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	beq _0806D7E0
	ldr r0, _0806D7DC @ =0x00004022
	bl sub_806E454
	adds r4, r0, 0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0806D7E0
	bl overworld_poison
	cmp r0, 0x1
	beq _0806D7E0
	cmp r0, 0x1
	ble _0806D7E0
	cmp r0, 0x2
	bne _0806D7E0
	movs r0, 0x1
	b _0806D7E2
	.align 2, 0
_0806D7D8: .4byte gUnknown_2036DFC
_0806D7DC: .4byte 0x00004022
_0806D7E0:
	movs r0, 0
_0806D7E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end overworld_poison_step

	thumb_func_start sub_806D7E8
sub_806D7E8: @ 806D7E8
	push {lr}
	bl sub_80832D4
	pop {r0}
	bx r0
	thumb_func_end sub_806D7E8

	thumb_func_start sub_806D7F4
sub_806D7F4: @ 806D7F4
	push {lr}
	bl sub_80833B0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_806D7F4

	thumb_func_start sub_806D804
sub_806D804: @ 806D804
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	adds r7, r5, 0
	ldr r0, _0806D840 @ =gUnknown_30030F0
	ldrh r1, [r0, 0x2C]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	bne _0806D890
	subs r0, r5, 0x3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0806D890
	adds r0, r3, 0
	adds r1, r5, 0
	bl sub_806D898
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0806D848
	ldr r0, _0806D844 @ =gUnknown_81A76E7
	adds r1, r5, 0
	b _0806D888
	.align 2, 0
_0806D840: .4byte gUnknown_30030F0
_0806D844: .4byte gUnknown_81A76E7
_0806D848:
	cmp r4, 0x1
	bne _0806D858
	ldr r0, _0806D854 @ =gUnknown_81A76DE
	adds r1, r5, 0
	b _0806D888
	.align 2, 0
_0806D854: .4byte gUnknown_81A76DE
_0806D858:
	cmp r4, 0x2
	bne _0806D868
	ldr r0, _0806D864 @ =gUnknown_81A76F0
	adds r1, r5, 0
	b _0806D888
	.align 2, 0
_0806D864: .4byte gUnknown_81A76F0
_0806D868:
	cmp r4, 0x3
	bne _0806D878
	ldr r0, _0806D874 @ =gUnknown_81A76F9
	adds r1, r5, 0
	b _0806D888
	.align 2, 0
_0806D874: .4byte gUnknown_81A76F9
_0806D878:
	adds r0, r6, 0
	bl sub_806D928
	cmp r0, 0
	beq _0806D890
	cmp r4, 0xF0
	bne _0806D890
	adds r1, r7, 0
_0806D888:
	bl sub_806D908
	movs r0, 0x1
	b _0806D892
_0806D890:
	movs r0, 0
_0806D892:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806D804

	thumb_func_start sub_806D898
sub_806D898: @ 806D898
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805A274
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D8B6
	movs r0, 0
	b _0806D902
_0806D8B6:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805A290
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D8CA
	movs r0, 0x1
	b _0806D902
_0806D8CA:
	adds r0, r4, 0
	bl sub_805A424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D8DC
	movs r0, 0x2
	b _0806D902
_0806D8DC:
	adds r0, r4, 0
	bl sub_805A438
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D8EE
	movs r0, 0x3
	b _0806D902
_0806D8EE:
	adds r0, r4, 0
	bl sub_805A360
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806D900
	movs r0, 0xFF
	b _0806D902
_0806D900:
	movs r0, 0xF0
_0806D902:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806D898

	thumb_func_start sub_806D908
sub_806D908: @ 806D908
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806D924 @ =gUnknown_20370D4
	strh r1, [r2]
	bl ScriptContext1_SetupScript
	bl sub_80699E0
	bl sub_8069A20
	pop {r0}
	bx r0
	.align 2, 0
_0806D924: .4byte gUnknown_20370D4
	thumb_func_end sub_806D908

	thumb_func_start sub_806D928
sub_806D928: @ 806D928
	push {r4,lr}
	ldr r4, _0806D94C @ =gUnknown_2036DFC
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl FindInvisibleMapObjectByPosition
	cmp r0, 0
	bne _0806D950
	movs r0, 0
	b _0806D958
	.align 2, 0
_0806D94C: .4byte gUnknown_2036DFC
_0806D950:
	ldr r0, [r0, 0x8]
	cmp r0, 0
	bne _0806D958
	ldr r0, _0806D960 @ =gUnknown_81C555B
_0806D958:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806D960: .4byte gUnknown_81C555B
	thumb_func_end sub_806D928

	thumb_func_start sub_806D964
sub_806D964: @ 806D964
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	mov r10, r4
	lsls r2, 24
	lsrs r6, r2, 24
	mov r9, r6
	ldr r0, _0806D9B8 @ =gUnknown_2036DFC
	mov r8, r0
	adds r1, r7, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r5, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	beq _0806DA00
	adds r0, r4, 0
	adds r1, r6, 0
	bl is_non_stair_warp_tile
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D9BC
	bl sub_8055A08
	mov r0, r8
	adds r1, r5, 0
	adds r2, r7, 0
	bl sub_806DC54
	bl sub_807E438
	movs r0, 0x1
	b _0806DA02
	.align 2, 0
_0806D9B8: .4byte gUnknown_2036DFC
_0806D9BC:
	adds r0, r4, 0
	mov r1, r9
	bl sub_806DB84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DA00
	movs r4, 0
	ldr r0, _0806D9FC @ =gUnknown_2037078
	ldrb r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _0806D9E2
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	movs r4, 0xC
_0806D9E2:
	bl sub_8055A08
	mov r0, r8
	adds r1, r5, 0
	adds r2, r7, 0
	bl sub_806DC54
	mov r0, r10
	adds r1, r4, 0
	bl sub_807E4A0
	movs r0, 0x1
	b _0806DA02
	.align 2, 0
_0806D9FC: .4byte gUnknown_2037078
_0806DA00:
	movs r0, 0
_0806DA02:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806D964

	thumb_func_start sub_806DA10
sub_806DA10: @ 806DA10
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r7, _0806DA68 @ =gUnknown_2036DFC
	adds r0, r7, 0
	adds r1, r6, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _0806DAEC
	adds r0, r5, 0
	bl sub_806DAF4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DAEC
	bl sub_8055A08
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806DC54
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8059BF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DA6C
	adds r0, r4, 0
	bl sub_807E560
	movs r0, 0x1
	b _0806DAEE
	.align 2, 0
_0806DA68: .4byte gUnknown_2036DFC
_0806DA6C:
	adds r0, r4, 0
	bl sub_805A158
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DA82
	bl sub_807E57C
	movs r0, 0x1
	b _0806DAEE
_0806DA82:
	adds r0, r4, 0
	bl MetatileBehavior_IsLavaridge1FWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DA98
	bl sub_807E58C
	movs r0, 0x1
	b _0806DAEE
_0806DA98:
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DAAE
	bl sub_807E59C
	movs r0, 0x1
	b _0806DAEE
_0806DAAE:
	adds r0, r4, 0
	bl sub_805A184
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DAC4
	bl sub_807E524
	movs r0, 0x1
	b _0806DAEE
_0806DAC4:
	adds r0, r4, 0
	bl sub_805A1C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DAE4
	bl sub_80559E4
	ldr r0, _0806DAE0 @ =gUnknown_81C1361
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _0806DAEE
	.align 2, 0
_0806DAE0: .4byte gUnknown_81C1361
_0806DAE4:
	bl sub_807E438
	movs r0, 0x1
	b _0806DAEE
_0806DAEC:
	movs r0, 0
_0806DAEE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806DA10

	thumb_func_start sub_806DAF4
sub_806DAF4: @ 806DAF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsWarpDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl sub_8059C78
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl sub_8059BF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl sub_8059C8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl sub_805A158
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsLavaridge1FWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl sub_805A1C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	adds r0, r4, 0
	bl sub_805A184
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806DB7C
	movs r0, 0
	b _0806DB7E
_0806DB7C:
	movs r0, 0x1
_0806DB7E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806DAF4

	thumb_func_start sub_806DB84
sub_806DB84: @ 806DB84
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x3
	beq _0806DB98
	cmp r1, 0x4
	beq _0806DBB0
	b _0806DBD0
_0806DB98:
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8059C20
	lsls r0, 24
	cmp r0, 0
	bne _0806DBCC
	adds r0, r4, 0
	bl sub_8059C48
	b _0806DBC6
_0806DBB0:
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8059C0C
	lsls r0, 24
	cmp r0, 0
	bne _0806DBCC
	adds r0, r4, 0
	bl sub_8059C34
_0806DBC6:
	lsls r0, 24
	cmp r0, 0
	beq _0806DBD0
_0806DBCC:
	movs r0, 0x1
	b _0806DBD2
_0806DBD0:
	movs r0, 0
_0806DBD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806DB84

	thumb_func_start is_non_stair_warp_tile
is_non_stair_warp_tile: @ 806DBD8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x2
	beq _0806DBFC
	cmp r1, 0x2
	bgt _0806DBF2
	cmp r1, 0x1
	beq _0806DC06
	b _0806DC28
_0806DBF2:
	cmp r2, 0x3
	beq _0806DC10
	cmp r2, 0x4
	beq _0806DC1A
	b _0806DC28
_0806DBFC:
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059D04
	b _0806DC22
_0806DC06:
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059D18
	b _0806DC22
_0806DC10:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWestArrowWarp
	b _0806DC22
_0806DC1A:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsEastArrowWarp
_0806DC22:
	lsls r0, 24
	lsrs r0, 24
	b _0806DC2A
_0806DC28:
	movs r0, 0
_0806DC2A:
	pop {r1}
	bx r1
	thumb_func_end is_non_stair_warp_tile

	thumb_func_start map_warp_check_packed
map_warp_check_packed: @ 806DC30
	push {lr}
	adds r3, r1, 0
	ldrh r1, [r3]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r3, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r3, 0x4]
	bl map_warp_check
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end map_warp_check_packed

	thumb_func_start sub_806DC54
sub_806DC54: @ 806DC54
	push {r4-r7,lr}
	adds r5, r2, 0
	ldr r0, _0806DC74 @ =gUnknown_2036DFC
	ldr r0, [r0, 0x4]
	lsls r1, 24
	asrs r7, r1, 24
	lsls r6, r7, 3
	ldr r0, [r0, 0x8]
	adds r4, r0, r6
	ldrb r0, [r4, 0x6]
	cmp r0, 0x7F
	bne _0806DC78
	ldrb r0, [r4, 0x5]
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	b _0806DCC4
	.align 2, 0
_0806DC74: .4byte gUnknown_2036DFC
_0806DC78:
	movs r0, 0x7
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	ldrsb r1, [r4, r1]
	movs r2, 0x5
	ldrsb r2, [r4, r2]
	bl warp1_set_2
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl sub_805550C
	ldrb r0, [r4, 0x7]
	ldrb r1, [r4, 0x6]
	bl get_mapheader_by_bank_and_number
	ldr r1, [r0, 0x4]
	ldrb r0, [r4, 0x5]
	ldr r1, [r1, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x7F
	bne _0806DCC4
	adds r0, r6, r1
	ldrb r0, [r0, 0x5]
	ldr r1, _0806DCCC @ =gUnknown_3005008
	ldr r2, [r1]
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, 0x5]
	lsls r2, 24
	asrs r2, 24
	adds r3, r7, 0
	bl saved_warp2_set
_0806DCC4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DCCC: .4byte gUnknown_3005008
	thumb_func_end sub_806DC54

	thumb_func_start sub_806DCD0
sub_806DCD0: @ 806DCD0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x2
	bne _0806DD30
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWarpDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DD30
	ldr r7, _0806DD2C @ =gUnknown_2036DFC
	adds r0, r7, 0
	adds r1, r6, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _0806DD30
	adds r0, r5, 0
	bl sub_806DAF4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DD30
	bl sub_8055A08
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_806DC54
	bl sub_807E4DC
	movs r0, 0x1
	b _0806DD32
	.align 2, 0
_0806DD2C: .4byte gUnknown_2036DFC
_0806DD30:
	movs r0, 0
_0806DD32:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806DCD0

	thumb_func_start map_warp_check
map_warp_check: @ 806DD38
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x8]
	ldrb r3, [r0, 0x1]
	movs r2, 0
	cmp r2, r3
	bge _0806DD76
_0806DD52:
	ldrh r0, [r1]
	cmp r0, r6
	bne _0806DD6E
	ldrh r0, [r1, 0x2]
	cmp r0, r5
	bne _0806DD6E
	ldrb r0, [r1, 0x4]
	cmp r0, r4
	beq _0806DD68
	cmp r0, 0
	bne _0806DD6E
_0806DD68:
	lsls r0, r2, 24
	asrs r0, 24
	b _0806DD7A
_0806DD6E:
	adds r2, 0x1
	adds r1, 0x8
	cmp r2, r3
	blt _0806DD52
_0806DD76:
	movs r0, 0x1
	negs r0, r0
_0806DD7A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end map_warp_check

	thumb_func_start trigger_activate
trigger_activate: @ 806DD80
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _0806DDB6
	ldr r1, [r4, 0xC]
	cmp r1, 0
	bne _0806DD96
	ldrb r0, [r4, 0x6]
	bl trigger_activate_weather
	b _0806DDB6
_0806DD96:
	ldrh r0, [r4, 0x6]
	cmp r0, 0
	beq _0806DDB0
	ldrh r0, [r4, 0x6]
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _0806DDB6
	ldr r0, [r4, 0xC]
	b _0806DDB8
_0806DDB0:
	adds r0, r1, 0
	bl ScriptContext2_RunNewScript
_0806DDB6:
	movs r0, 0
_0806DDB8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end trigger_activate

	thumb_func_start mapheader_trigger_activate_at
mapheader_trigger_activate_at: @ 806DDC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0xC]
	ldrb r7, [r0, 0x2]
	movs r6, 0
	cmp r6, r7
	bge _0806DE16
	adds r5, r1, 0
	adds r4, r5, 0
_0806DDEC:
	ldrh r0, [r4]
	cmp r0, r10
	bne _0806DE0C
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bne _0806DE0C
	ldrb r0, [r4, 0x4]
	cmp r0, r8
	beq _0806DE02
	cmp r0, 0
	bne _0806DE0C
_0806DE02:
	adds r0, r5, 0
	bl trigger_activate
	cmp r0, 0
	bne _0806DE18
_0806DE0C:
	adds r4, 0x10
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r7
	blt _0806DDEC
_0806DE16:
	movs r0, 0
_0806DE18:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at

	thumb_func_start sub_806DE28
sub_806DE28: @ 806DE28
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl sub_8058F78
	cmp r0, 0x66
	bne _0806DE64
	movs r0, 0x25
	bl sub_80722CC
	ldrb r0, [r5, 0x8]
	ldr r4, _0806DE6C @ =gUnknown_3005008
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveFieldObjectByLocalIdAndMap
	ldrb r0, [r5, 0x8]
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805FCD8
	lsls r0, 16
	lsrs r0, 16
	bl FlagClear
_0806DE64:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DE6C: .4byte gUnknown_3005008
	thumb_func_end sub_806DE28

	thumb_func_start sub_806DE70
sub_806DE70: @ 806DE70
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	ldr r2, _0806DEC0 @ =gUnknown_2036DFC
	ldr r2, [r2, 0x4]
	ldr r4, [r2, 0xC]
	ldrb r5, [r2, 0x2]
	lsrs r7, r0, 16
	asrs r0, 16
	lsrs r6, r1, 16
	asrs r1, 16
	bl sub_8058F78
	cmp r0, 0x20
	bne _0806DEB8
	cmp r5, 0
	beq _0806DEB8
_0806DE92:
	ldrh r0, [r4]
	adds r0, 0x7
	cmp r0, r7
	bne _0806DEB0
	ldrh r0, [r4, 0x2]
	adds r0, 0x7
	cmp r0, r6
	bne _0806DEB0
	bl sub_8112364
	ldr r0, [r4, 0xC]
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
_0806DEB0:
	adds r4, 0x10
	subs r5, 0x1
	cmp r5, 0
	bne _0806DE92
_0806DEB8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEC0: .4byte gUnknown_2036DFC
	thumb_func_end sub_806DE70

	thumb_func_start sub_806DEC4
sub_806DEC4: @ 806DEC4
	push {r4,lr}
	ldr r4, _0806DEE8 @ =gUnknown_2036DFC
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806DEE8: .4byte gUnknown_2036DFC
	thumb_func_end sub_806DEC4

	thumb_func_start FindInvisibleMapObjectByPosition
FindInvisibleMapObjectByPosition: @ 806DEEC
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, [r0, 0x4]
	ldr r4, [r0, 0x10]
	ldrb r3, [r0, 0x3]
	movs r2, 0
	cmp r2, r3
	bcs _0806DF32
_0806DF06:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	bne _0806DF28
	ldrh r0, [r1, 0x2]
	cmp r0, r6
	bne _0806DF28
	ldrb r0, [r1, 0x4]
	cmp r0, r5
	beq _0806DF24
	cmp r0, 0
	bne _0806DF28
_0806DF24:
	adds r0, r1, 0
	b _0806DF34
_0806DF28:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _0806DF06
_0806DF32:
	movs r0, 0
_0806DF34:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FindInvisibleMapObjectByPosition

	thumb_func_start dive_warp
dive_warp: @ 806DF3C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _0806DF70 @ =gUnknown_2036DFC
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _0806DF74
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_8059FCC
	lsls r0, 24
	cmp r0, 0
	bne _0806DF74
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055824
	b _0806DF98
	.align 2, 0
_0806DF70: .4byte gUnknown_2036DFC
_0806DF74:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_8059FB0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DFB0
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055844
_0806DF98:
	lsls r0, 24
	cmp r0, 0
	beq _0806DFB0
	bl sub_8055A08
	bl sp13E_warp_to_last_warp
	movs r0, 0xE2
	bl sub_80722CC
	movs r0, 0x1
	b _0806DFB2
_0806DFB0:
	movs r0, 0
_0806DFB2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end dive_warp

	thumb_func_start sub_806DFB8
sub_806DFB8: @ 806DFB8
	push {r4,r5,lr}
	sub sp, 0x4
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
	lsrs r5, r0, 24
	ldr r0, _0806E010 @ =gUnknown_2036DFC
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _0806E014
	adds r0, r5, 0
	bl sub_8059FCC
	lsls r0, 24
	cmp r0, 0
	bne _0806E014
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055824
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E044
	movs r0, 0x1
	b _0806E046
	.align 2, 0
_0806E010: .4byte gUnknown_2036DFC
_0806E014:
	adds r0, r5, 0
	bl sub_8059FB0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E044
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_8055844
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E044
	movs r0, 0x2
	b _0806E046
_0806E044:
	movs r0, 0
_0806E046:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806DFB8

	thumb_func_start GetFieldObjectScriptPointerForComparison
GetFieldObjectScriptPointerForComparison: @ 806E050
	push {r4,r5,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl sub_8058F78
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	adds r2, r4, 0
	bl sub_806CFF4
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerForComparison

	thumb_func_start sub_806E08C
sub_806E08C: @ 806E08C
	push {r4,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_8058F78
	ldr r4, _0806E0CC @ =gUnknown_2036DFC
	adds r0, r4, 0
	mov r1, sp
	bl map_warp_check_packed
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	mov r2, sp
	bl sub_806DC54
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E0CC: .4byte gUnknown_2036DFC
	thumb_func_end sub_806E08C

	.align 2, 0 @ Don't pad with nop.
