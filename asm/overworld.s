	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8054BC8
sub_8054BC8: @ 8054BC8
	push {r4,lr}
	ldr r0, _08054BFC @ =gUnknown_81A654B
	bl ScriptContext2_RunNewScript
	ldr r0, _08054C00 @ =gSaveBlock1Ptr
	ldr r4, [r0]
	movs r0, 0xA4
	lsls r0, 2
	adds r4, r0
	bl sub_8054C04
	adds r1, r0, 0
	adds r0, r4, 0
	bl RemoveMoney
	bl sp000_heal_pokemon
	bl sub_8054DD8
	bl sub_80554BC
	bl warp_in
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054BFC: .4byte gUnknown_81A654B
_08054C00: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8054BC8

	thumb_func_start sub_8054C04
sub_8054C04: @ 8054C04
	push {r4,lr}
	bl sub_8054C70
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80444F8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08054C40 @ =gUnknown_826D294
	adds r4, r1
	ldrb r1, [r4]
	lsls r1, 2
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _08054C44 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 2
	adds r0, r1
	bl GetMoney
	cmp r4, r0
	bls _08054C38
	adds r4, r0, 0
_08054C38:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08054C40: .4byte gUnknown_826D294
_08054C44: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8054C04

	thumb_func_start sub_8054C48
sub_8054C48: @ 8054C48
	push {r4,r5,lr}
	bl sub_8054C04
	adds r4, r0, 0
	ldr r5, _08054C6C @ =gStringVar1
	bl CountDigits
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054C6C: .4byte gStringVar1
	thumb_func_end sub_8054C48

	thumb_func_start sub_8054C70
sub_8054C70: @ 8054C70
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	ldr r4, _08054C9C @ =gUnknown_826D29E
_08054C78:
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08054C8A
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08054C8A:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	bls _08054C78
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08054C9C: .4byte gUnknown_826D29E
	thumb_func_end sub_8054C70

	thumb_func_start sub_8054CA0
sub_8054CA0: @ 8054CA0
	push {lr}
	bl ResetInitialPlayerAvatarState
	movs r0, 0x83
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054CEC @ =0x0000405e
	movs r1, 0
	bl VarSet
	ldr r0, _08054CF0 @ =0x00000802
	bl FlagClear
	movs r0, 0x80
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054CF4 @ =0x0000406e
	movs r1, 0
	bl VarSet
	ldr r0, _08054CF8 @ =0x00000805
	bl FlagClear
	ldr r0, _08054CFC @ =0x00000806
	bl FlagClear
	ldr r0, _08054D00 @ =0x00000808
	bl FlagClear
	ldr r0, _08054D04 @ =0x0000404d
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08054CEC: .4byte 0x0000405e
_08054CF0: .4byte 0x00000802
_08054CF4: .4byte 0x0000406e
_08054CF8: .4byte 0x00000805
_08054CFC: .4byte 0x00000806
_08054D00: .4byte 0x00000808
_08054D04: .4byte 0x0000404d
	thumb_func_end sub_8054CA0

	thumb_func_start Overworld_ResetStateAfterTeleport
Overworld_ResetStateAfterTeleport: @ 8054D08
	push {lr}
	bl ResetInitialPlayerAvatarState
	movs r0, 0x83
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054D54 @ =0x0000405e
	movs r1, 0
	bl VarSet
	ldr r0, _08054D58 @ =0x00000802
	bl FlagClear
	movs r0, 0x80
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054D5C @ =0x0000406e
	movs r1, 0
	bl VarSet
	ldr r0, _08054D60 @ =0x00000805
	bl FlagClear
	ldr r0, _08054D64 @ =0x00000806
	bl FlagClear
	ldr r0, _08054D68 @ =0x00000808
	bl FlagClear
	ldr r0, _08054D6C @ =0x0000404d
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08054D54: .4byte 0x0000405e
_08054D58: .4byte 0x00000802
_08054D5C: .4byte 0x0000406e
_08054D60: .4byte 0x00000805
_08054D64: .4byte 0x00000806
_08054D68: .4byte 0x00000808
_08054D6C: .4byte 0x0000404d
	thumb_func_end Overworld_ResetStateAfterTeleport

	thumb_func_start sub_8054D70
sub_8054D70: @ 8054D70
	push {lr}
	bl ResetInitialPlayerAvatarState
	movs r0, 0x83
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054DBC @ =0x0000405e
	movs r1, 0
	bl VarSet
	ldr r0, _08054DC0 @ =0x00000802
	bl FlagClear
	movs r0, 0x80
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054DC4 @ =0x0000406e
	movs r1, 0
	bl VarSet
	ldr r0, _08054DC8 @ =0x00000805
	bl FlagClear
	ldr r0, _08054DCC @ =0x00000806
	bl FlagClear
	ldr r0, _08054DD0 @ =0x00000808
	bl FlagClear
	ldr r0, _08054DD4 @ =0x0000404d
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08054DBC: .4byte 0x0000405e
_08054DC0: .4byte 0x00000802
_08054DC4: .4byte 0x0000406e
_08054DC8: .4byte 0x00000805
_08054DCC: .4byte 0x00000806
_08054DD0: .4byte 0x00000808
_08054DD4: .4byte 0x0000404d
	thumb_func_end sub_8054D70

	thumb_func_start sub_8054DD8
sub_8054DD8: @ 8054DD8
	push {lr}
	bl ResetInitialPlayerAvatarState
	movs r0, 0x83
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054E24 @ =0x0000405e
	movs r1, 0
	bl VarSet
	ldr r0, _08054E28 @ =0x00000802
	bl FlagClear
	movs r0, 0x80
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054E2C @ =0x0000406e
	movs r1, 0
	bl VarSet
	ldr r0, _08054E30 @ =0x00000805
	bl FlagClear
	ldr r0, _08054E34 @ =0x00000806
	bl FlagClear
	ldr r0, _08054E38 @ =0x00000808
	bl FlagClear
	ldr r0, _08054E3C @ =0x0000404d
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08054E24: .4byte 0x0000405e
_08054E28: .4byte 0x00000802
_08054E2C: .4byte 0x0000406e
_08054E30: .4byte 0x00000805
_08054E34: .4byte 0x00000806
_08054E38: .4byte 0x00000808
_08054E3C: .4byte 0x0000404d
	thumb_func_end sub_8054DD8

	thumb_func_start sub_8054E40
sub_8054E40: @ 8054E40
	push {lr}
	movs r0, 0x80
	lsls r0, 4
	bl FlagClear
	ldr r0, _08054E64 @ =0x0000406e
	movs r1, 0
	bl VarSet
	bl sub_805610C
	bl UpdateLocationHistoryForRoamer
	bl RoamerMoveToOtherLocationSet
	pop {r0}
	bx r0
	.align 2, 0
_08054E64: .4byte 0x0000406e
	thumb_func_end sub_8054E40

	thumb_func_start sub_8054E68
sub_8054E68: @ 8054E68
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, _08054E8C @ =gSaveBlock1Ptr
	movs r4, 0x90
	lsls r4, 5
	movs r3, 0
_08054E74:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	str r3, [r0]
	adds r2, 0x1
	cmp r2, 0x3F
	ble _08054E74
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054E8C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8054E68

	thumb_func_start IncrementGameStat
IncrementGameStat: @ 8054E90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x33
	bhi _08054EB8
	adds r0, r4, 0
	bl GetGameStat
	adds r1, r0, 0
	ldr r0, _08054EAC @ =0x00fffffe
	cmp r1, r0
	bhi _08054EB0
	adds r1, 0x1
	b _08054EB2
	.align 2, 0
_08054EAC: .4byte 0x00fffffe
_08054EB0:
	ldr r1, _08054EC0 @ =0x00ffffff
_08054EB2:
	adds r0, r4, 0
	bl sub_8054F00
_08054EB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054EC0: .4byte 0x00ffffff
	thumb_func_end IncrementGameStat

	thumb_func_start GetGameStat
GetGameStat: @ 8054EC4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x33
	bhi _08054EF8
	ldr r0, _08054EF0 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	lsls r0, r1, 2
	movs r1, 0x90
	lsls r1, 5
	adds r2, r1
	adds r2, r0
	ldr r0, _08054EF4 @ =gSaveBlock2Ptr
	ldr r1, [r0]
	movs r0, 0xF2
	lsls r0, 4
	adds r1, r0
	ldr r0, [r2]
	ldr r1, [r1]
	eors r0, r1
	b _08054EFA
	.align 2, 0
_08054EF0: .4byte gSaveBlock1Ptr
_08054EF4: .4byte gSaveBlock2Ptr
_08054EF8:
	movs r0, 0
_08054EFA:
	pop {r1}
	bx r1
	thumb_func_end GetGameStat

	thumb_func_start sub_8054F00
sub_8054F00: @ 8054F00
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x33
	bhi _08054F2A
	ldr r0, _08054F30 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	lsls r0, r2, 2
	movs r2, 0x90
	lsls r2, 5
	adds r1, r2
	adds r1, r0
	ldr r0, _08054F34 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	movs r2, 0xF2
	lsls r2, 4
	adds r0, r2
	ldr r0, [r0]
	eors r0, r3
	str r0, [r1]
_08054F2A:
	pop {r0}
	bx r0
	.align 2, 0
_08054F30: .4byte gSaveBlock1Ptr
_08054F34: .4byte gSaveBlock2Ptr
	thumb_func_end sub_8054F00

	thumb_func_start sub_8054F38
sub_8054F38: @ 8054F38
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r6, _08054F64 @ =gSaveBlock1Ptr
_08054F40:
	lsls r1, r4, 2
	movs r0, 0x90
	lsls r0, 5
	adds r1, r0
	ldr r0, [r6]
	adds r0, r1
	adds r1, r5, 0
	bl ApplyNewEncryptionKeyToWord
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3F
	bls _08054F40
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054F64: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8054F38

	thumb_func_start sub_8054F68
sub_8054F68: @ 8054F68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	mov r8, r0
	ldr r1, _08055040 @ =gMapHeader
	ldr r0, [r1, 0x4]
	ldrb r0, [r0]
	cmp r9, r0
	bcc _08054F86
	b _08055092
_08054F86:
	ldr r2, _08055044 @ =gSaveBlock1Ptr
	mov r10, r2
_08054F8A:
	ldr r3, _08055040 @ =gMapHeader
	ldr r0, [r3, 0x4]
	ldr r1, [r0, 0x4]
	mov r4, r9
	lsls r0, r4, 1
	add r0, r9
	lsls r7, r0, 3
	adds r2, r7, r1
	ldrb r0, [r2, 0x2]
	cmp r0, 0xFF
	bne _08055054
	ldrb r4, [r2, 0x8]
	ldrb r5, [r2, 0xC]
	str r5, [sp]
	ldrb r2, [r2, 0xE]
	str r2, [sp, 0x4]
	adds r0, r2, 0
	adds r1, r5, 0
	bl get_mapheader_by_bank_and_number
	mov r6, r10
	ldr r1, [r6]
	mov r2, r8
	lsls r3, r2, 1
	add r3, r8
	lsls r3, 3
	adds r1, r3
	ldr r0, [r0, 0x4]
	ldr r2, [r0, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	movs r5, 0x8E
	lsls r5, 4
	adds r1, r5
	subs r0, 0x18
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	mov r6, r10
	ldr r1, [r6]
	adds r1, r3
	ldr r2, _08055040 @ =gMapHeader
	ldr r0, [r2, 0x4]
	ldr r0, [r0, 0x4]
	adds r0, r7, r0
	ldrb r0, [r0]
	movs r5, 0x8E
	lsls r5, 4
	adds r1, r5
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r3
	ldr r0, [r2, 0x4]
	ldr r0, [r0, 0x4]
	adds r0, r7, r0
	ldrh r2, [r0, 0x4]
	ldr r6, _08055048 @ =0x000008e4
	adds r0, r1, r6
	strh r2, [r0]
	ldr r2, _08055040 @ =gMapHeader
	ldr r0, [r2, 0x4]
	ldr r0, [r0, 0x4]
	adds r0, r7, r0
	ldrh r2, [r0, 0x6]
	adds r5, 0x6
	adds r0, r1, r5
	strh r2, [r0]
	adds r6, 0x4
	adds r1, r6
	strb r4, [r1]
	mov r1, r10
	ldr r0, [r1]
	adds r0, r3
	ldr r2, _0805504C @ =0x000008ec
	adds r1, r0, r2
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r1]
	ldr r4, _08055050 @ =0x000008ee
	adds r1, r0, r4
	mov r5, sp
	ldrh r5, [r5, 0x4]
	strh r5, [r1]
	subs r6, 0x6
	adds r0, r6
	movs r1, 0xFF
	strb r1, [r0]
	b _08055072
	.align 2, 0
_08055040: .4byte gMapHeader
_08055044: .4byte gSaveBlock1Ptr
_08055048: .4byte 0x000008e4
_0805504C: .4byte 0x000008ec
_08055050: .4byte 0x000008ee
_08055054:
	mov r0, r10
	ldr r1, [r0]
	mov r3, r8
	lsls r0, r3, 1
	add r0, r8
	lsls r0, 3
	adds r1, r0
	movs r4, 0x8E
	lsls r4, 4
	adds r1, r4
	adds r0, r2, 0
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
_08055072:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r6, _080550A4 @ =gMapHeader
	ldr r0, [r6, 0x4]
	ldrb r0, [r0]
	cmp r9, r0
	bcs _08055092
	b _08054F8A
_08055092:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080550A4: .4byte gMapHeader
	thumb_func_end sub_8054F68

	thumb_func_start sub_80550A8
sub_80550A8: @ 80550A8
	push {lr}
	ldr r0, _080550D0 @ =gMapHeader
	ldr r1, [r0, 0x4]
	ldr r0, _080550D4 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r2, [r1, 0x4]
	movs r3, 0x8E
	lsls r3, 4
	adds r1, r0, r3
	movs r3, 0x3F
_080550BC:
	ldr r0, [r2, 0x10]
	str r0, [r1, 0x10]
	adds r2, 0x18
	adds r1, 0x18
	subs r3, 0x1
	cmp r3, 0
	bge _080550BC
	pop {r0}
	bx r0
	.align 2, 0
_080550D0: .4byte gMapHeader
_080550D4: .4byte gSaveBlock1Ptr
	thumb_func_end sub_80550A8

	thumb_func_start Overworld_SetMapObjTemplateCoords
Overworld_SetMapObjTemplateCoords: @ 80550D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08055100 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r1, 0
	movs r6, 0x8E
	lsls r6, 4
	adds r3, r0, r6
_080550F2:
	ldrb r0, [r3]
	cmp r0, r5
	bne _08055104
	strh r4, [r3, 0x4]
	strh r2, [r3, 0x6]
	b _0805510C
	.align 2, 0
_08055100: .4byte gSaveBlock1Ptr
_08055104:
	adds r3, 0x18
	adds r1, 0x1
	cmp r1, 0x3F
	ble _080550F2
_0805510C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end Overworld_SetMapObjTemplateCoords

	thumb_func_start Overworld_SetMapObjTemplateMovementType
Overworld_SetMapObjTemplateMovementType: @ 8055114
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08055134 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	movs r3, 0
	movs r5, 0x8E
	lsls r5, 4
	adds r2, r0, r5
_0805512A:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08055138
	strb r1, [r2, 0x9]
	b _08055140
	.align 2, 0
_08055134: .4byte gSaveBlock1Ptr
_08055138:
	adds r2, 0x18
	adds r3, 0x1
	cmp r3, 0x3F
	ble _0805512A
_08055140:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Overworld_SetMapObjTemplateMovementType

	thumb_func_start mapdata_load_assets_to_gpu_and_full_redraw
mapdata_load_assets_to_gpu_and_full_redraw: @ 8055148
	push {r4,lr}
	bl move_tilemap_camera_to_upper_left_corner
	ldr r4, _0805516C @ =gMapHeader
	ldr r0, [r4]
	bl copy_map_tileset1_tileset2_to_vram
	ldr r0, [r4]
	bl apply_map_tileset1_tileset2_palette
	bl DrawWholeMapView
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805516C: .4byte gMapHeader
	thumb_func_end mapdata_load_assets_to_gpu_and_full_redraw

	thumb_func_start get_mapdata_header
get_mapdata_header: @ 8055170
	push {lr}
	ldr r0, _08055180 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x32]
	cmp r1, 0
	bne _08055184
	movs r0, 0
	b _0805518E
	.align 2, 0
_08055180: .4byte gSaveBlock1Ptr
_08055184:
	ldr r0, _08055194 @ =gUnknown_834EB8C
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_0805518E:
	pop {r1}
	bx r1
	.align 2, 0
_08055194: .4byte gUnknown_834EB8C
	thumb_func_end get_mapdata_header

	thumb_func_start warp_shift
warp_shift: @ 8055198
	ldr r3, _080551C4 @ =gUnknown_2031DB4
	ldr r0, _080551C8 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	str r0, [r3]
	str r1, [r3, 0x4]
	ldr r0, _080551CC @ =gUnknown_2031DBC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2, 0x4]
	str r1, [r2, 0x8]
	ldr r2, _080551D0 @ =gUnknown_2031DC4
	ldr r0, _080551D4 @ =gUnknown_826D2B0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r2, _080551D8 @ =gUnknown_2031DCC
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080551C4: .4byte gUnknown_2031DB4
_080551C8: .4byte gSaveBlock1Ptr
_080551CC: .4byte gUnknown_2031DBC
_080551D0: .4byte gUnknown_2031DC4
_080551D4: .4byte gUnknown_826D2B0
_080551D8: .4byte gUnknown_2031DCC
	thumb_func_end warp_shift

	thumb_func_start warp_set
warp_set: @ 80551DC
	push {r4,r5,lr}
	ldr r4, [sp, 0xC]
	ldr r5, [sp, 0x10]
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r3, [r0, 0x2]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r0, 0x4]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r0, 0x6]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end warp_set

	thumb_func_start warp_data_is_not_neg_1
warp_data_is_not_neg_1: @ 80551FC
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08055230
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08055230
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	cmp r2, r0
	bne _08055230
	movs r0, 0x4
	ldrsh r3, [r1, r0]
	cmp r3, r2
	bne _08055230
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bne _08055230
	movs r0, 0x1
	b _08055232
_08055230:
	movs r0, 0
_08055232:
	pop {r1}
	bx r1
	thumb_func_end warp_data_is_not_neg_1

	thumb_func_start get_mapheader_by_bank_and_number
get_mapheader_by_bank_and_number: @ 8055238
	lsls r0, 16
	lsls r1, 16
	ldr r2, _0805524C @ =gMapGroups
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_0805524C: .4byte gMapGroups
	thumb_func_end get_mapheader_by_bank_and_number

	thumb_func_start warp1_get_mapheader
warp1_get_mapheader: @ 8055250
	push {lr}
	ldr r1, _08055270 @ =gUnknown_2031DBC
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	pop {r1}
	bx r1
	.align 2, 0
_08055270: .4byte gUnknown_2031DBC
	thumb_func_end warp1_get_mapheader

	thumb_func_start set_current_map_header_from_sav1_save_old_name
set_current_map_header_from_sav1_save_old_name: @ 8055274
	push {r4-r6,lr}
	ldr r4, _080552B4 @ =gMapHeader
	ldr r5, _080552B8 @ =gSaveBlock1Ptr
	ldr r1, [r5]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r4, 0
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, [r5]
	ldrh r0, [r4, 0x12]
	strh r0, [r1, 0x32]
	bl get_mapdata_header
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080552B4: .4byte gMapHeader
_080552B8: .4byte gSaveBlock1Ptr
	thumb_func_end set_current_map_header_from_sav1_save_old_name

	thumb_func_start set_current_map_header_from_sav1
set_current_map_header_from_sav1: @ 80552BC
	push {r4,r5,lr}
	ldr r4, _080552F4 @ =gMapHeader
	ldr r0, _080552F8 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r4, 0
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r0]
	str r0, [r1]
	bl get_mapdata_header
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080552F4: .4byte gMapHeader
_080552F8: .4byte gSaveBlock1Ptr
	thumb_func_end set_current_map_header_from_sav1

	thumb_func_start update_camera_pos_from_warpid
update_camera_pos_from_warpid: @ 80552FC
	push {r4,r5,lr}
	ldr r0, _0805532C @ =gSaveBlock1Ptr
	ldr r2, [r0]
	movs r1, 0x6
	ldrsb r1, [r2, r1]
	adds r4, r0, 0
	cmp r1, 0
	blt _08055334
	ldr r3, _08055330 @ =gMapHeader
	ldr r0, [r3, 0x4]
	ldrb r5, [r0, 0x1]
	cmp r1, r5
	bge _08055334
	ldr r0, [r0, 0x8]
	lsls r1, 3
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, [r3, 0x4]
	ldr r0, [r0, 0x8]
	adds r1, r0
	ldrh r0, [r1, 0x2]
	strh r0, [r2, 0x2]
	b _0805536C
	.align 2, 0
_0805532C: .4byte gSaveBlock1Ptr
_08055330: .4byte gMapHeader
_08055334:
	ldr r1, [r4]
	ldrh r3, [r1, 0x8]
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	blt _08055350
	ldrh r2, [r1, 0xA]
	movs r5, 0xA
	ldrsh r0, [r1, r5]
	cmp r0, 0
	blt _08055350
	strh r3, [r1]
	strh r2, [r1, 0x2]
	b _0805536C
_08055350:
	ldr r3, [r4]
	ldr r2, _08055374 @ =gMapHeader
	ldr r0, [r2]
	ldr r0, [r0]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r3]
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r3, 0x2]
_0805536C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055374: .4byte gMapHeader
	thumb_func_end update_camera_pos_from_warpid

	thumb_func_start warp_in
warp_in: @ 8055378
	push {lr}
	bl warp_shift
	bl set_current_map_header_from_sav1_save_old_name
	bl update_camera_pos_from_warpid
	pop {r0}
	bx r0
	thumb_func_end warp_in

	thumb_func_start Overworld_SetWarpDestination
Overworld_SetWarpDestination: @ 805538C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080553C4 @ =gUnknown_2031DBC
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080553C4: .4byte gUnknown_2031DBC
	thumb_func_end Overworld_SetWarpDestination

	thumb_func_start warp1_set_2
warp1_set_2: @ 80553C8
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	asrs r0, 24
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	bl Overworld_SetWarpDestination
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end warp1_set_2

	thumb_func_start saved_warp2_set
saved_warp2_set: @ 80553E8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _08055418 @ =gSaveBlock1Ptr
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0x14
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	lsls r3, 24
	asrs r3, 24
	movs r4, 0
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055418: .4byte gSaveBlock1Ptr
	thumb_func_end saved_warp2_set

	thumb_func_start SetDynamicWarpWithCoords
SetDynamicWarpWithCoords: @ 805541C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r0, _08055450 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x14
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	lsls r3, 24
	asrs r3, 24
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	lsls r5, 24
	asrs r5, 24
	str r5, [sp, 0x4]
	bl warp_set
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055450: .4byte gSaveBlock1Ptr
	thumb_func_end SetDynamicWarpWithCoords

	thumb_func_start copy_saved_warp2_bank_and_enter_x_to_warp1
copy_saved_warp2_bank_and_enter_x_to_warp1: @ 8055454
	ldr r2, _08055464 @ =gUnknown_2031DBC
	ldr r0, _08055468 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, [r0, 0x18]
	ldr r0, [r0, 0x14]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08055464: .4byte gUnknown_2031DBC
_08055468: .4byte gSaveBlock1Ptr
	thumb_func_end copy_saved_warp2_bank_and_enter_x_to_warp1

	thumb_func_start sub_805546C
sub_805546C: @ 805546C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocationPointer
	adds r4, r0, 0
	cmp r4, 0
	beq _0805549A
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	movs r3, 0x2
	ldrsb r3, [r4, r3]
	ldrb r4, [r4, 0x4]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl Overworld_SetWarpDestination
_0805549A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805546C

	thumb_func_start copy_saved_warp3_bank_and_enter_x_to_warp1
copy_saved_warp3_bank_and_enter_x_to_warp1: @ 80554A4
	ldr r2, _080554B4 @ =gUnknown_2031DBC
	ldr r0, _080554B8 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, [r0, 0x20]
	ldr r0, [r0, 0x1C]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080554B4: .4byte gUnknown_2031DBC
_080554B8: .4byte gSaveBlock1Ptr
	thumb_func_end copy_saved_warp3_bank_and_enter_x_to_warp1

	thumb_func_start sub_80554BC
sub_80554BC: @ 80554BC
	push {lr}
	ldr r0, _080554C8 @ =gUnknown_2031DBC
	bl sub_80BFCD0
	pop {r0}
	bx r0
	.align 2, 0
_080554C8: .4byte gUnknown_2031DBC
	thumb_func_end sub_80554BC

	thumb_func_start SetLastHealLocationWarp
SetLastHealLocationWarp: @ 80554CC
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocationPointer
	adds r5, r0, 0
	cmp r5, 0
	beq _08055500
	ldr r0, _08055508 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x1C
	movs r1, 0
	ldrsb r1, [r5, r1]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	movs r3, 0x1
	negs r3, r3
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, 0x4
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
_08055500:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055508: .4byte gSaveBlock1Ptr
	thumb_func_end SetLastHealLocationWarp

	thumb_func_start sub_805550C
sub_805550C: @ 805550C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	bl sav1_map_get_light_level
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08055598 @ =gUnknown_2031DBC
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _08055590
	adds r0, r5, 0
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055590
	ldr r5, _0805559C @ =gSaveBlock1Ptr
	ldr r0, [r5]
	ldrh r0, [r0, 0x4]
	cmp r0, 0x1
	beq _08055590
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r4, r0
	orrs r4, r0
	ldr r1, [r5]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	subs r3, r6, 0x7
	lsls r3, 24
	asrs r3, 24
	lsrs r4, 31
	subs r4, 0x7
	adds r4, r7, r4
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl SetEscapeWarp
_08055590:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055598: .4byte gUnknown_2031DBC
_0805559C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_805550C

	thumb_func_start SetEscapeWarp
SetEscapeWarp: @ 80555A0
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080555DC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x24
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080555DC: .4byte gSaveBlock1Ptr
	thumb_func_end SetEscapeWarp

	thumb_func_start sub_80555E0
sub_80555E0: @ 80555E0
	ldr r2, _080555F0 @ =gUnknown_2031DBC
	ldr r0, _080555F4 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, [r0, 0x28]
	ldr r0, [r0, 0x24]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080555F0: .4byte gUnknown_2031DBC
_080555F4: .4byte gSaveBlock1Ptr
	thumb_func_end sub_80555E0

	thumb_func_start SetFixedDiveWarp
SetFixedDiveWarp: @ 80555F8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08055630 @ =gUnknown_2031DC4
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055630: .4byte gUnknown_2031DC4
	thumb_func_end SetFixedDiveWarp

	thumb_func_start warp1_set_to_warp2
warp1_set_to_warp2: @ 8055634
	ldr r2, _08055644 @ =gUnknown_2031DBC
	ldr r0, _08055648 @ =gUnknown_2031DC4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08055644: .4byte gUnknown_2031DBC
_08055648: .4byte gUnknown_2031DC4
	thumb_func_end warp1_set_to_warp2

	thumb_func_start SetFixedHoleWarp
SetFixedHoleWarp: @ 805564C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08055684 @ =gUnknown_2031DCC
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055684: .4byte gUnknown_2031DCC
	thumb_func_end SetFixedHoleWarp

	thumb_func_start SetWarpDestinationToFixedHoleWarp
SetWarpDestinationToFixedHoleWarp: @ 8055688
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r4, _080556B0 @ =gUnknown_2031DCC
	adds r0, r4, 0
	bl warp_data_is_not_neg_1
	cmp r0, 0x1
	bne _080556BC
	ldr r2, _080556B4 @ =gUnknown_2031DBC
	ldr r0, _080556B8 @ =gUnknown_2031DB4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	b _080556D6
	.align 2, 0
_080556B0: .4byte gUnknown_2031DCC
_080556B4: .4byte gUnknown_2031DBC
_080556B8: .4byte gUnknown_2031DB4
_080556BC:
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	lsls r3, r5, 24
	asrs r3, 24
	lsls r4, r6, 24
	asrs r4, 24
	str r4, [sp]
	bl Overworld_SetWarpDestination
_080556D6:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SetWarpDestinationToFixedHoleWarp

	thumb_func_start warp1_set_to_sav1w
warp1_set_to_sav1w: @ 80556E0
	ldr r2, _080556F0 @ =gUnknown_2031DBC
	ldr r0, _080556F4 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, [r0, 0x10]
	ldr r0, [r0, 0xC]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080556F0: .4byte gUnknown_2031DBC
_080556F4: .4byte gSaveBlock1Ptr
	thumb_func_end warp1_set_to_sav1w

	thumb_func_start sub_80556F8
sub_80556F8: @ 80556F8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08055734 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0xC
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055734: .4byte gSaveBlock1Ptr
	thumb_func_end sub_80556F8

	thumb_func_start sub_8055738
sub_8055738: @ 8055738
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocationPointer
	adds r5, r0, 0
	cmp r5, 0
	beq _0805576C
	ldr r0, _08055774 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0xC
	movs r1, 0
	ldrsb r1, [r5, r1]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	movs r3, 0x1
	negs r3, r3
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, 0x4
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
_0805576C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055774: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8055738

	thumb_func_start sub_8055778
sub_8055778: @ 8055778
	ldr r0, _08055788 @ =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, [r2, 0x14]
	ldr r1, [r2, 0x18]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	bx lr
	.align 2, 0
_08055788: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8055778

	thumb_func_start GetMapConnection
GetMapConnection: @ 805578C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080557A0 @ =gMapHeader
	ldr r0, [r0, 0xC]
	ldr r3, [r0]
	ldr r1, [r0, 0x4]
	cmp r1, 0
	bne _080557A8
	b _080557BC
	.align 2, 0
_080557A0: .4byte gMapHeader
_080557A4:
	adds r0, r1, 0
	b _080557BE
_080557A8:
	movs r2, 0
	cmp r2, r3
	bge _080557BC
_080557AE:
	ldrb r0, [r1]
	cmp r0, r4
	beq _080557A4
	adds r2, 0x1
	adds r1, 0xC
	cmp r2, r3
	blt _080557AE
_080557BC:
	movs r0, 0
_080557BE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMapConnection

	thumb_func_start sub_80557C4
sub_80557C4: @ 80557C4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	bl GetMapConnection
	adds r1, r0, 0
	cmp r1, 0
	beq _080557FC
	movs r0, 0x8
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x9]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	lsls r3, r4, 24
	asrs r3, 24
	lsls r4, r5, 24
	asrs r4, 24
	str r4, [sp]
	bl Overworld_SetWarpDestination
	b _08055818
_080557FC:
	bl mapheader_run_script_with_tag_x6
	ldr r0, _08055810 @ =gUnknown_2031DC4
	bl warp_data_is_not_neg_1
	cmp r0, 0
	beq _08055814
	movs r0, 0
	b _0805581A
	.align 2, 0
_08055810: .4byte gUnknown_2031DC4
_08055814:
	bl warp1_set_to_warp2
_08055818:
	movs r0, 0x1
_0805581A:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80557C4

	thumb_func_start sub_8055824
sub_8055824: @ 8055824
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x6
	adds r1, r3, 0
	bl sub_80557C4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8055824

	thumb_func_start sub_8055844
sub_8055844: @ 8055844
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x5
	adds r1, r3, 0
	bl sub_80557C4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8055844

	thumb_func_start sub_8055864
sub_8055864: @ 8055864
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	asrs r0, 24
	lsrs r4, r1, 24
	asrs r1, 24
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	adds r2, r3, 0
	bl Overworld_SetWarpDestination
	bl sub_8055E94
	bl warp_shift
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8054F68
	bl TrySetMapSaveWarpStatus
	bl sub_806E110
	bl nullsub_74
	bl sub_806D7E8
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_810C578
	bl SetSav1WeatherFromCurrMapHeader
	bl sub_805610C
	bl sub_8055CB8
	bl sav1_reset_battle_music_maybe
	bl mapheader_run_script_with_tag_x3
	bl sub_815D8F8
	bl not_trainer_hill_battle_pyramid
	ldr r4, _0805591C @ =gMapHeader
	ldr r0, [r4]
	bl copy_map_tileset2_to_vram_2
	ldr r0, [r4]
	bl apply_map_tileset2_palette
	movs r4, 0x7
_080558D4:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807AB74
	adds r4, 0x1
	cmp r4, 0xC
	ble _080558D4
	bl sub_806FFB0
	bl UpdateLocationHistoryForRoamer
	bl RoamerMove
	bl sub_8110920
	bl DoCurrentWeather
	bl wild_encounter_reset_coro_args
	bl mapheader_run_script_with_tag_x5
	bl sub_80561B4
	ldr r1, _0805591C @ =gMapHeader
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x14]
	cmp r0, r1
	beq _08055914
	movs r0, 0x1
	bl sub_8098110
_08055914:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805591C: .4byte gMapHeader
	thumb_func_end sub_8055864

	thumb_func_start sub_8055920
sub_8055920: @ 8055920
	push {r4,lr}
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8054F68
	ldr r0, _0805599C @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_5_or_6
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl TrySetMapSaveWarpStatus
	bl sub_806E110
	bl nullsub_74
	bl sub_806D7E8
	ldr r0, _080559A0 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_810C578
	bl SetSav1WeatherFromCurrMapHeader
	bl sub_805610C
	cmp r4, 0
	beq _08055974
	ldr r0, _080559A4 @ =0x00000806
	bl FlagClear
_08055974:
	bl sub_8055CB8
	bl sav1_reset_battle_music_maybe
	bl mapheader_run_script_with_tag_x3
	bl sub_815D8F8
	bl UpdateLocationHistoryForRoamer
	bl RoamerMoveToOtherLocationSet
	bl sub_8110920
	bl not_trainer_hill_battle_pyramid
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805599C: .4byte gMapHeader
_080559A0: .4byte gSaveBlock1Ptr
_080559A4: .4byte 0x00000806
	thumb_func_end sub_8055920

	thumb_func_start sub_80559A8
sub_80559A8: @ 80559A8
	push {lr}
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8054F68
	ldr r0, _080559E0 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_5_or_6
	bl TrySetMapSaveWarpStatus
	bl SetSav1WeatherFromCurrMapHeader
	bl sub_805610C
	bl sub_8055CB8
	bl sub_8110920
	bl sub_8111708
	bl set_current_map_header_from_sav1
	bl not_trainer_hill_battle_pyramid
	pop {r0}
	bx r0
	.align 2, 0
_080559E0: .4byte gMapHeader
	thumb_func_end sub_80559A8

	thumb_func_start ResetInitialPlayerAvatarState
ResetInitialPlayerAvatarState: @ 80559E4
	ldr r0, _080559F4 @ =gUnknown_2031DD4
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0, 0x1]
	strb r1, [r0]
	strb r2, [r0, 0x2]
	bx lr
	.align 2, 0
_080559F4: .4byte gUnknown_2031DD4
	thumb_func_end ResetInitialPlayerAvatarState

	thumb_func_start sub_80559F8
sub_80559F8: @ 80559F8
	ldr r1, _08055A04 @ =gUnknown_2031DD4
	strb r0, [r1, 0x1]
	movs r0, 0x1
	strb r0, [r1]
	strb r0, [r1, 0x2]
	bx lr
	.align 2, 0
_08055A04: .4byte gUnknown_2031DD4
	thumb_func_end sub_80559F8

	thumb_func_start sub_8055A08
sub_8055A08: @ 8055A08
	push {r4,lr}
	bl player_get_direction_lower_nybble
	ldr r4, _08055A24 @ =gUnknown_2031DD4
	strb r0, [r4, 0x1]
	movs r0, 0x2
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08055A28
	movs r0, 0x2
	b _08055A5A
	.align 2, 0
_08055A24: .4byte gUnknown_2031DD4
_08055A28:
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08055A38
	movs r0, 0x4
	b _08055A5A
_08055A38:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08055A48
	movs r0, 0x8
	b _08055A5A
_08055A48:
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08055A58
	movs r0, 0x10
	b _08055A5A
_08055A58:
	movs r0, 0x1
_08055A5A:
	strb r0, [r4]
	ldr r1, _08055A68 @ =gUnknown_2031DD4
	movs r0, 0
	strb r0, [r1, 0x2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055A68: .4byte gUnknown_2031DD4
	thumb_func_end sub_8055A08

	thumb_func_start sub_8055A6C
sub_8055A6C: @ 8055A6C
	push {r4-r7,lr}
	bl sav1_map_get_light_level
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl sub_8055C74
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r6, _08055ABC @ =gUnknown_2031DD4
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8055ACC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08055AC0 @ =0xffffff00
	ands r7, r0
	orrs r7, r1
	adds r0, r6, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_8055B74
	lsls r0, 24
	lsrs r0, 16
	ldr r1, _08055AC4 @ =0xffff00ff
	ands r7, r1
	orrs r7, r0
	ldr r0, _08055AC8 @ =0xff00ffff
	ands r7, r0
	str r7, [r6]
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08055ABC: .4byte gUnknown_2031DD4
_08055AC0: .4byte 0xffffff00
_08055AC4: .4byte 0xffff00ff
_08055AC8: .4byte 0xff00ffff
	thumb_func_end sub_8055A6C

	thumb_func_start sub_8055ACC
sub_8055ACC: @ 8055ACC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x8
	beq _08055AE8
	ldr r0, _08055AF0 @ =0x00000802
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08055B30
_08055AE8:
	cmp r4, 0x5
	bne _08055AF4
	movs r0, 0x10
	b _08055B32
	.align 2, 0
_08055AF0: .4byte 0x00000802
_08055AF4:
	adds r0, r5, 0
	bl sub_8055B38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055B30
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08055B16
	movs r0, 0x8
	b _08055B32
_08055B16:
	bl sub_8055C9C
	cmp r0, 0x1
	bne _08055B30
	ldrb r0, [r6]
	cmp r0, 0x2
	bne _08055B28
	movs r0, 0x2
	b _08055B32
_08055B28:
	cmp r0, 0x4
	bne _08055B30
	movs r0, 0x4
	b _08055B32
_08055B30:
	movs r0, 0x1
_08055B32:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8055ACC

	thumb_func_start sub_8055B38
sub_8055B38: @ 8055B38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08055B6C
	ldr r0, _08055B60 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _08055B64 @ =0x00005601
	cmp r1, r0
	beq _08055B5C
	ldr r0, _08055B68 @ =0x00005701
	cmp r1, r0
	bne _08055B6C
_08055B5C:
	movs r0, 0x1
	b _08055B6E
	.align 2, 0
_08055B60: .4byte gSaveBlock1Ptr
_08055B64: .4byte 0x00005601
_08055B68: .4byte 0x00005701
_08055B6C:
	movs r0, 0
_08055B6E:
	pop {r1}
	bx r1
	thumb_func_end sub_8055B38

	thumb_func_start sub_8055B74
sub_8055B74: @ 8055B74
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _08055BD4 @ =0x00000802
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08055B94
	cmp r5, 0x6
	beq _08055C3E
_08055B94:
	lsls r4, 24
	lsrs r5, r4, 24
	adds r0, r5, 0
	bl MetatileBehavior_ReturnFalse_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055BD0
	adds r0, r5, 0
	bl MetatileBehavior_IsCaveDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C68
	adds r0, r5, 0
	bl MetatileBehavior_IsWarpDoor_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C68
	adds r0, r5, 0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08055BD8
_08055BD0:
	movs r0, 0x2
	b _08055C6E
	.align 2, 0
_08055BD4: .4byte 0x00000802
_08055BD8:
	adds r0, r5, 0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C68
	adds r0, r5, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C3E
	adds r0, r5, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C1E
	adds r0, r5, 0
	bl MetatileBehavior_IsUnknownWarp6C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C1E
	adds r0, r5, 0
	bl MetatileBehavior_IsUnknownWarp6E
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08055C22
_08055C1E:
	movs r0, 0x3
	b _08055C6E
_08055C22:
	adds r0, r5, 0
	bl MetatileBehavior_IsUnknownWarp6D
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C3E
	adds r0, r5, 0
	bl MetatileBehavior_IsUnknownWarp6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08055C42
_08055C3E:
	movs r0, 0x4
	b _08055C6E
_08055C42:
	ldrb r0, [r6]
	cmp r0, 0x10
	bne _08055C4C
	cmp r7, 0x8
	beq _08055C6C
_08055C4C:
	cmp r0, 0x8
	bne _08055C54
	cmp r7, 0x10
	beq _08055C6C
_08055C54:
	lsrs r0, r4, 24
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055C6C
	ldrb r0, [r6, 0x2]
	cmp r0, 0
	bne _08055C6C
_08055C68:
	movs r0, 0x1
	b _08055C6E
_08055C6C:
	ldrb r0, [r6, 0x1]
_08055C6E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8055B74

	thumb_func_start sub_8055C74
sub_8055C74: @ 8055C74
	push {lr}
	ldr r0, _08055C98 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r1, 0x2]
	adds r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08055C98: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8055C74

	thumb_func_start sub_8055C9C
sub_8055C9C: @ 8055C9C
	push {lr}
	ldr r0, _08055CAC @ =gMapHeader
	ldrb r0, [r0, 0x18]
	cmp r0, 0
	beq _08055CB0
	movs r0, 0x1
	b _08055CB2
	.align 2, 0
_08055CAC: .4byte gMapHeader
_08055CB0:
	movs r0, 0
_08055CB2:
	pop {r1}
	bx r1
	thumb_func_end sub_8055C9C

	thumb_func_start sub_8055CB8
sub_8055CB8: @ 8055CB8
	push {lr}
	ldr r0, _08055CC8 @ =gMapHeader
	ldrb r1, [r0, 0x15]
	cmp r1, 0
	bne _08055CD0
	ldr r0, _08055CCC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	b _08055CF8
	.align 2, 0
_08055CC8: .4byte gMapHeader
_08055CCC: .4byte gSaveBlock1Ptr
_08055CD0:
	ldr r0, _08055CE8 @ =0x00000806
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08055CF0
	ldr r0, _08055CEC @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x30
	movs r1, 0
	b _08055CFA
	.align 2, 0
_08055CE8: .4byte 0x00000806
_08055CEC: .4byte gSaveBlock1Ptr
_08055CF0:
	ldr r0, _08055D00 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _08055D04 @ =gUnknown_83C68E0
	ldr r1, [r1]
_08055CF8:
	adds r0, 0x30
_08055CFA:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08055D00: .4byte gSaveBlock1Ptr
_08055D04: .4byte gUnknown_83C68E0
	thumb_func_end sub_8055CB8

	thumb_func_start Overworld_SetFlashLevel
Overworld_SetFlashLevel: @ 8055D08
	push {lr}
	adds r1, r0, 0
	cmp r1, 0
	blt _08055D18
	ldr r0, _08055D28 @ =gUnknown_83C68E0
	ldr r0, [r0]
	cmp r1, r0
	ble _08055D1A
_08055D18:
	movs r1, 0
_08055D1A:
	ldr r0, _08055D2C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x30
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08055D28: .4byte gUnknown_83C68E0
_08055D2C: .4byte gSaveBlock1Ptr
	thumb_func_end Overworld_SetFlashLevel

	thumb_func_start sav1_get_flash_used_on_map
sav1_get_flash_used_on_map: @ 8055D30
	ldr r0, _08055D3C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x30
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08055D3C: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_get_flash_used_on_map

	thumb_func_start SetCurrentMapLayout
SetCurrentMapLayout: @ 8055D40
	push {lr}
	ldr r1, _08055D54 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	strh r0, [r1, 0x32]
	bl get_mapdata_header
	ldr r1, _08055D58 @ =gMapHeader
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08055D54: .4byte gSaveBlock1Ptr
_08055D58: .4byte gMapHeader
	thumb_func_end SetCurrentMapLayout

	thumb_func_start sub_8055D5C
sub_8055D5C: @ 8055D5C
	ldr r2, _08055D68 @ =gUnknown_2031DBC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08055D68: .4byte gUnknown_2031DBC
	thumb_func_end sub_8055D5C

	thumb_func_start sub_8055D6C
sub_8055D6C: @ 8055D6C
	push {lr}
	adds r1, r0, 0
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrh r0, [r0, 0x10]
	pop {r1}
	bx r1
	thumb_func_end sub_8055D6C

	thumb_func_start sub_8055D8C
sub_8055D8C: @ 8055D8C
	push {lr}
	ldr r0, _08055DA0 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x4
	bl sub_8055D6C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08055DA0: .4byte gSaveBlock1Ptr
	thumb_func_end sub_8055D8C

	thumb_func_start sub_8055DA4
sub_8055DA4: @ 8055DA4
	push {lr}
	ldr r0, _08055DB4 @ =gUnknown_2031DBC
	bl sub_8055D6C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08055DB4: .4byte gUnknown_2031DBC
	thumb_func_end sub_8055DA4

	thumb_func_start sub_8055DB8
sub_8055DB8: @ 8055DB8
	push {lr}
	bl ResetMapMusic
	pop {r0}
	bx r0
	thumb_func_end sub_8055DB8

	thumb_func_start sub_8055DC4
sub_8055DC4: @ 8055DC4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08055DD8 @ =gUnknown_2031DD8
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08055DDC
	bl StopMapMusic
	b _08055E6C
	.align 2, 0
_08055DD8: .4byte gUnknown_2031DD8
_08055DDC:
	cmp r0, 0x2
	beq _08055E6C
	ldr r0, _08055E14 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _08055E18 @ =0x00004f01
	cmp r1, r0
	bne _08055E24
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r4, r1]
	subs r0, 0x7
	cmp r0, 0xA
	bgt _08055E24
	ldr r0, _08055E1C @ =gMPlayInfo_BGM
	ldr r1, [r0]
	ldr r0, _08055E20 @ =gUnknown_86E6B0C
	cmp r1, r0
	bne _08055E24
	movs r0, 0x4
	bl FadeInBGM
	b _08055E6C
	.align 2, 0
_08055E14: .4byte gSaveBlock1Ptr
_08055E18: .4byte 0x00004f01
_08055E1C: .4byte gMPlayInfo_BGM
_08055E20: .4byte gUnknown_86E6B0C
_08055E24:
	bl sub_8055D8C
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08055E3C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	ldrh r0, [r1, 0x2C]
	cmp r0, 0
	beq _08055E40
	adds r4, r0, 0
	b _08055E5A
	.align 2, 0
_08055E3C: .4byte gSaveBlock1Ptr
_08055E40:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08055E5A
	ldr r5, _08055E74 @ =0x00000131
	adds r0, r5, 0
	bl sub_8056124
	cmp r0, 0
	beq _08055E5A
	adds r4, r5, 0
_08055E5A:
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08055E6C
	adds r0, r4, 0
	bl PlayNewMapMusic
_08055E6C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055E74: .4byte 0x00000131
	thumb_func_end sub_8055DC4

	thumb_func_start Overworld_SetSavedMusic
Overworld_SetSavedMusic: @ 8055E78
	ldr r1, _08055E80 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_08055E80: .4byte gSaveBlock1Ptr
	thumb_func_end Overworld_SetSavedMusic

	thumb_func_start sav1_reset_battle_music_maybe
sav1_reset_battle_music_maybe: @ 8055E84
	ldr r0, _08055E90 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_08055E90: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_reset_battle_music_maybe

	thumb_func_start sub_8055E94
sub_8055E94: @ 8055E94
	push {r4-r6,lr}
	ldr r0, _08055EA4 @ =gUnknown_2031DD8
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08055EA8
	bl StopMapMusic
	b _08055F14
	.align 2, 0
_08055EA4: .4byte gUnknown_2031DD8
_08055EA8:
	cmp r0, 0x2
	beq _08055F14
	ldr r0, _08055F04 @ =0x00004001
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055F14
	bl sub_8055DA4
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r5, _08055F08 @ =0x00000131
	cmp r6, r5
	beq _08055F14
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08055EE8
	adds r0, r5, 0
	bl sub_8056124
	cmp r0, 0
	beq _08055EE8
	adds r4, r5, 0
_08055EE8:
	cmp r4, r6
	beq _08055F14
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08055F0C
	adds r0, r4, 0
	movs r1, 0x4
	movs r2, 0x4
	bl FadeOutAndFadeInNewMapMusic
	b _08055F14
	.align 2, 0
_08055F04: .4byte 0x00004001
_08055F08: .4byte 0x00000131
_08055F0C:
	adds r0, r4, 0
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_08055F14:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8055E94

	thumb_func_start Overworld_ChangeMusicToDefault
Overworld_ChangeMusicToDefault: @ 8055F1C
	push {r4,lr}
	bl GetCurrentMapMusic
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_8055D8C
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08055F42
	bl sub_8055D8C
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_08055F42:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Overworld_ChangeMusicToDefault

	thumb_func_start Overworld_ChangeMusicTo
Overworld_ChangeMusicTo: @ 8055F48
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	beq _08055F62
	adds r0, r4, 0
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_08055F62:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Overworld_ChangeMusicTo

	thumb_func_start GetMapMusicFadeoutSpeed
GetMapMusicFadeoutSpeed: @ 8055F68
	push {lr}
	bl warp1_get_mapheader
	ldrb r0, [r0, 0x17]
	bl is_light_level_8_or_9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055F80
	movs r0, 0x4
	b _08055F82
_08055F80:
	movs r0, 0x2
_08055F82:
	pop {r1}
	bx r1
	thumb_func_end GetMapMusicFadeoutSpeed

	thumb_func_start sub_8055F88
sub_8055F88: @ 8055F88
	push {r4,lr}
	bl sub_8055DA4
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08055FC0 @ =0x00004001
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08055FB8
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08055FB8
	bl GetMapMusicFadeoutSpeed
	lsls r0, 24
	lsrs r0, 24
	bl FadeOutMapMusic
_08055FB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055FC0: .4byte 0x00004001
	thumb_func_end sub_8055F88

	thumb_func_start sub_8055FC4
sub_8055FC4: @ 8055FC4
	push {lr}
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8055FC4

	thumb_func_start Overworld_FadeOutMapMusic
Overworld_FadeOutMapMusic: @ 8055FD4
	push {lr}
	movs r0, 0x4
	bl FadeOutMapMusic
	pop {r0}
	bx r0
	thumb_func_end Overworld_FadeOutMapMusic

	thumb_func_start sub_8055FE0
sub_8055FE0: @ 8055FE0
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r0, _0805604C @ =gUnknown_2031DDC
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08056014
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfable
	lsls r0, 24
	cmp r0, 0
	beq _0805606A
_08056014:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x58
	bl __umodsi3
	adds r0, 0xD4
	lsls r0, 24
	lsrs r4, r0, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	adds r0, 0x32
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08056050 @ =gUnknown_2031DD8
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08056054
	bl StopMapMusic
	b _0805606A
	.align 2, 0
_0805604C: .4byte gUnknown_2031DDC
_08056050: .4byte gUnknown_2031DD8
_08056054:
	cmp r0, 0x2
	beq _0805606A
	ldr r0, _08056074 @ =gUnknown_2031DDA
	ldrh r0, [r0]
	lsls r1, r4, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	movs r3, 0x1
	bl PlayCry2
_0805606A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056074: .4byte gUnknown_2031DDA
	thumb_func_end sub_8055FE0

	thumb_func_start sub_8056078
sub_8056078: @ 8056078
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x4
	bhi _08056106
	lsls r0, 2
	ldr r1, _08056090 @ =_08056094
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056090: .4byte _08056094
	.align 2, 0
_08056094:
	.4byte _080560A8
	.4byte _080560BC
	.4byte _080560D8
	.4byte _080560F2
	.4byte _08056106
_080560A8:
	ldr r0, _080560B4 @ =gUnknown_2031DDA
	ldrh r0, [r0]
	cmp r0, 0
	bne _080560B8
	movs r0, 0x4
	b _08056104
	.align 2, 0
_080560B4: .4byte gUnknown_2031DDA
_080560B8:
	movs r0, 0x1
	b _08056104
_080560BC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x96
	lsls r1, 4
	bl __umodsi3
	movs r1, 0x96
	lsls r1, 3
	adds r0, r1
	strh r0, [r5]
	movs r0, 0x3
	b _08056104
_080560D8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x96
	lsls r4, 3
	adds r1, r4, 0
	bl __umodsi3
	adds r0, r4
	strh r0, [r5]
	movs r0, 0x3
	b _08056104
_080560F2:
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _08056106
	bl sub_8055FE0
	movs r0, 0x2
_08056104:
	strh r0, [r6]
_08056106:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8056078

	thumb_func_start sub_805610C
sub_805610C: @ 805610C
	push {lr}
	ldr r0, _0805611C @ =gUnknown_2031DDC
	bl GetLocalWildMon
	ldr r1, _08056120 @ =gUnknown_2031DDA
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805611C: .4byte gUnknown_2031DDC
_08056120: .4byte gUnknown_2031DDA
	thumb_func_end sub_805610C

	thumb_func_start sub_8056124
sub_8056124: @ 8056124
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0x8D
	lsls r0, 1
	cmp r1, r0
	beq _08056138
	adds r0, 0x17
	cmp r1, r0
	bne _08056150
_08056138:
	ldr r0, _0805614C @ =gMapHeader
	ldrb r0, [r0, 0x14]
	cmp r0, 0x84
	beq _08056148
	cmp r0, 0x7B
	beq _08056148
	cmp r0, 0x61
	bne _08056150
_08056148:
	movs r0, 0
	b _08056152
	.align 2, 0
_0805614C: .4byte gMapHeader
_08056150:
	movs r0, 0x1
_08056152:
	pop {r1}
	bx r1
	thumb_func_end sub_8056124

	thumb_func_start get_map_light_level_by_bank_and_number
get_map_light_level_by_bank_and_number: @ 8056158
	push {lr}
	lsls r0, 24
	asrs r0, 8
	lsrs r0, 16
	lsls r1, 24
	asrs r1, 8
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x17]
	pop {r1}
	bx r1
	thumb_func_end get_map_light_level_by_bank_and_number

	thumb_func_start get_map_light_level_from_warp
get_map_light_level_from_warp: @ 8056170
	push {lr}
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	adds r0, r2, 0
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end get_map_light_level_from_warp

	thumb_func_start sav1_map_get_light_level
sav1_map_get_light_level: @ 8056188
	push {lr}
	ldr r0, _0805619C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x4
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805619C: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_map_get_light_level

	thumb_func_start get_map_light_from_warp0
get_map_light_from_warp0: @ 80561A0
	push {lr}
	ldr r0, _080561B0 @ =gUnknown_2031DB4
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080561B0: .4byte gUnknown_2031DB4
	thumb_func_end get_map_light_from_warp0

	thumb_func_start sub_80561B4
sub_80561B4: @ 80561B4
	push {lr}
	ldr r1, _080561D4 @ =gUnknown_2031DB4
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	.align 2, 0
_080561D4: .4byte gUnknown_2031DB4
	thumb_func_end sub_80561B4

	thumb_func_start is_light_level_1_2_3_5_or_6
is_light_level_1_2_3_5_or_6: @ 80561D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080561F2
	cmp r0, 0x1
	beq _080561F2
	cmp r0, 0x5
	beq _080561F2
	cmp r0, 0x2
	beq _080561F2
	cmp r0, 0x6
	bne _080561F6
_080561F2:
	movs r0, 0x1
	b _080561F8
_080561F6:
	movs r0, 0
_080561F8:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_1_2_3_5_or_6

	thumb_func_start Overworld_MapTypeAllowsTeleportAndFly
Overworld_MapTypeAllowsTeleportAndFly: @ 80561FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08056212
	cmp r0, 0x1
	beq _08056212
	cmp r0, 0x6
	beq _08056212
	cmp r0, 0x2
	bne _08056216
_08056212:
	movs r0, 0x1
	b _08056218
_08056216:
	movs r0, 0
_08056218:
	pop {r1}
	bx r1
	thumb_func_end Overworld_MapTypeAllowsTeleportAndFly

	thumb_func_start is_light_level_8_or_9
is_light_level_8_or_9: @ 805621C
	push {lr}
	lsls r0, 24
	movs r1, 0xF8
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056230
	movs r0, 0
	b _08056232
_08056230:
	movs r0, 0x1
_08056232:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_8_or_9

	thumb_func_start sav1_saved_warp2_map_get_name
sav1_saved_warp2_map_get_name: @ 8056238
	push {lr}
	ldr r0, _0805625C @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x14
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x15]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	.align 2, 0
_0805625C: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_saved_warp2_map_get_name

	thumb_func_start sav1_map_get_name
sav1_map_get_name: @ 8056260
	push {lr}
	ldr r0, _08056284 @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	.align 2, 0
_08056284: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_map_get_name

	thumb_func_start sav1_map_get_battletype
sav1_map_get_battletype: @ 8056288
	push {lr}
	ldr r0, _080562AC @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x1B]
	pop {r1}
	bx r1
	.align 2, 0
_080562AC: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_map_get_battletype

	thumb_func_start sub_80562B0
sub_80562B0: @ 80562B0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	bl MoveSaveBlocks_ResetHeap_
	bl sub_8056E80
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08056344 @ =gUnknown_826D320
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0x1
	movs r1, 0x5
	movs r2, 0x1
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x5
	movs r2, 0x1
	bl SetBgAttribute
	movs r0, 0x3
	movs r1, 0x5
	movs r2, 0x1
	bl SetBgAttribute
	ldr r0, _08056348 @ =gUnknown_3005018
	mov r8, r0
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl AllocZeroed
	mov r1, r8
	str r0, [r1]
	ldr r6, _0805634C @ =gUnknown_3005014
	adds r0, r4, 0
	bl AllocZeroed
	str r0, [r6]
	ldr r5, _08056350 @ =gUnknown_300501C
	adds r0, r4, 0
	bl AllocZeroed
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r6]
	movs r0, 0x2
	bl SetBgTilemapBuffer
	ldr r1, [r5]
	movs r0, 0x3
	bl SetBgTilemapBuffer
	bl InitStandardTextBoxWindows
	bl ResetBg0
	bl sub_8069348
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056344: .4byte gUnknown_826D320
_08056348: .4byte gUnknown_3005018
_0805634C: .4byte gUnknown_3005014
_08056350: .4byte gUnknown_300501C
	thumb_func_end sub_80562B0

	thumb_func_start sub_8056354
sub_8056354: @ 8056354
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080563E0 @ =gUnknown_826D320
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	movs r0, 0x1
	movs r1, 0x5
	movs r2, 0x1
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x5
	movs r2, 0x1
	bl SetBgAttribute
	movs r0, 0x3
	movs r1, 0x5
	movs r2, 0x1
	bl SetBgAttribute
	ldr r0, _080563E4 @ =gUnknown_3005018
	mov r8, r0
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	bl AllocZeroed
	mov r1, r8
	str r0, [r1]
	ldr r6, _080563E8 @ =gUnknown_3005014
	adds r0, r4, 0
	bl AllocZeroed
	str r0, [r6]
	ldr r5, _080563EC @ =gUnknown_300501C
	adds r0, r4, 0
	bl AllocZeroed
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r1, [r6]
	movs r0, 0x2
	bl SetBgTilemapBuffer
	ldr r1, [r5]
	movs r0, 0x3
	bl SetBgTilemapBuffer
	bl InitStandardTextBoxWindows
	bl ResetBg0
	bl sub_8069348
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080563E0: .4byte gUnknown_826D320
_080563E4: .4byte gUnknown_3005018
_080563E8: .4byte gUnknown_3005014
_080563EC: .4byte gUnknown_300501C
	thumb_func_end sub_8056354

	thumb_func_start sub_80563F0
sub_80563F0: @ 80563F0
	push {lr}
	bl sub_80F6C8C
	ldr r0, _08056414 @ =gUnknown_300501C
	ldr r0, [r0]
	bl Free
	ldr r0, _08056418 @ =gUnknown_3005014
	ldr r0, [r0]
	bl Free
	ldr r0, _0805641C @ =gUnknown_3005018
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_08056414: .4byte gUnknown_300501C
_08056418: .4byte gUnknown_3005014
_0805641C: .4byte gUnknown_3005018
	thumb_func_end sub_80563F0

	thumb_func_start sub_8056420
sub_8056420: @ 8056420
	push {lr}
	bl ResetSafariZoneFlag
	pop {r0}
	bx r0
	thumb_func_end sub_8056420

	thumb_func_start is_c1_link_related_active
is_c1_link_related_active: @ 805642C
	push {lr}
	ldr r0, _0805643C @ =gMain
	ldr r1, [r0]
	ldr r0, _08056440 @ =c1_link_related
	cmp r1, r0
	beq _08056444
	movs r0, 0
	b _08056446
	.align 2, 0
_0805643C: .4byte gMain
_08056440: .4byte c1_link_related
_08056444:
	movs r0, 0x1
_08056446:
	pop {r1}
	bx r1
	thumb_func_end is_c1_link_related_active

	thumb_func_start sub_805644C
sub_805644C: @ 805644C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r4, r1, 0
	bl sub_8112B3C
	bl sub_805BEB8
	mov r6, sp
	mov r0, sp
	bl sub_806C888
	mov r0, sp
	adds r1, r5, 0
	adds r2, r4, 0
	bl FieldGetPlayerInput
	mov r0, sp
	bl sub_806CD30
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _080564BA
	mov r0, sp
	bl sub_806CAC8
	cmp r0, 0x1
	bne _080564B0
	ldr r0, _080564A8 @ =gUnknown_3005E88
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0805649E
	ldr r0, _080564AC @ =gUnknown_3005078
	bl sub_81127F8
_0805649E:
	bl ScriptContext2_Enable
	bl sub_80982EC
	b _080564BA
	.align 2, 0
_080564A8: .4byte gUnknown_3005E88
_080564AC: .4byte gUnknown_3005078
_080564B0:
	ldrb r0, [r6, 0x2]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_805B3E0
_080564BA:
	bl sub_811092C
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_805644C

	thumb_func_start sub_80564C8
sub_80564C8: @ 80564C8
	push {lr}
	sub sp, 0x4
	bl sub_8112B3C
	bl sub_805BEB8
	bl sub_8111C68
	mov r0, sp
	bl sub_806C888
	ldr r0, _08056508 @ =gUnknown_3005E90
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_806CD30
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _08056512
	mov r0, sp
	bl sub_806CAC8
	cmp r0, 0x1
	bne _0805650C
	bl ScriptContext2_Enable
	bl sub_80982EC
	b _08056522
	.align 2, 0
_08056508: .4byte gUnknown_3005E90
_0805650C:
	bl sub_811092C
	b _08056522
_08056512:
	bl sub_8111CD0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08056522
	bl sub_811092C
_08056522:
	ldr r0, _08056530 @ =gUnknown_3005E90
	bl sub_806C888
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08056530: .4byte gUnknown_3005E90
	thumb_func_end sub_80564C8

	thumb_func_start sub_8056534
sub_8056534: @ 8056534
	push {r4,lr}
	ldr r4, _0805655C @ =gMain
	ldr r1, [r4, 0x4]
	ldr r0, _08056560 @ =sub_80565B4
	cmp r1, r0
	bne _08056570
	bl sub_8112CAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08056554
	ldr r0, _08056564 @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08056568
_08056554:
	bl sub_80564C8
	b _08056570
	.align 2, 0
_0805655C: .4byte gMain
_08056560: .4byte sub_80565B4
_08056564: .4byte gUnknown_203ADFA
_08056568:
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x2C]
	bl sub_805644C
_08056570:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8056534

	thumb_func_start sub_8056578
sub_8056578: @ 8056578
	push {lr}
	bl ScriptContext2_RunScript
	bl RunTasks
	bl AnimateSprites
	bl CameraUpdate
	bl sub_8115798
	bl UpdateCameraPanning
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_806FFBC
	bl do_scheduled_bg_tilemap_copies_to_vram
	pop {r0}
	bx r0
	thumb_func_end sub_8056578

	thumb_func_start sub_80565A8
sub_80565A8: @ 80565A8
	push {lr}
	bl sub_8056578
	pop {r0}
	bx r0
	thumb_func_end sub_80565A8

	thumb_func_start sub_80565B4
sub_80565B4: @ 80565B4
	push {r4,lr}
	ldr r0, _080565DC @ =gPaletteFade
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	adds r4, r0, 0
	cmp r4, 0
	beq _080565C8
	movs r0, 0
	bl SetVBlankCallback
_080565C8:
	bl sub_8056578
	cmp r4, 0
	beq _080565D4
	bl SetFieldVBlankCallback
_080565D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080565DC: .4byte gPaletteFade
	thumb_func_end sub_80565B4

	thumb_func_start sub_80565E0
sub_80565E0: @ 80565E0
	ldr r1, _080565E8 @ =gMain
	str r0, [r1]
	bx lr
	.align 2, 0
_080565E8: .4byte gMain
	thumb_func_end sub_80565E0

	thumb_func_start map_post_load_hook_exec
map_post_load_hook_exec: @ 80565EC
	push {r4,lr}
	ldr r4, _08056604 @ =gFieldCallback2
	ldr r0, [r4]
	cmp r0, 0
	beq _08056618
	bl _call_via_r0
	lsls r0, 24
	cmp r0, 0
	bne _08056608
	movs r0, 0
	b _08056638
	.align 2, 0
_08056604: .4byte gFieldCallback2
_08056608:
	movs r1, 0
	str r1, [r4]
	ldr r0, _08056614 @ =gUnknown_3005020
	str r1, [r0]
	b _08056636
	.align 2, 0
_08056614: .4byte gUnknown_3005020
_08056618:
	ldr r0, _08056628 @ =gUnknown_3005020
	ldr r0, [r0]
	cmp r0, 0
	beq _0805662C
	bl _call_via_r0
	b _08056630
	.align 2, 0
_08056628: .4byte gUnknown_3005020
_0805662C:
	bl sub_807DF64
_08056630:
	ldr r1, _08056640 @ =gUnknown_3005020
	movs r0, 0
	str r0, [r1]
_08056636:
	movs r0, 0x1
_08056638:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08056640: .4byte gUnknown_3005020
	thumb_func_end map_post_load_hook_exec

	thumb_func_start CB2_NewGame
CB2_NewGame: @ 8056644
	push {lr}
	bl sub_80569BC
	bl StopMapMusic
	bl sub_8056420
	bl sub_8054A60
	bl ResetInitialPlayerAvatarState
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _0805668C @ =gUnknown_3005020
	ldr r0, _08056690 @ =sub_807DF7C
	str r0, [r1]
	ldr r1, _08056694 @ =gFieldCallback2
	movs r0, 0
	str r0, [r1]
	ldr r0, _08056698 @ =gMain + 0x438
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _0805669C @ =sub_8056534
	bl sub_80565E0
	ldr r0, _080566A0 @ =sub_80565B4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0805668C: .4byte gUnknown_3005020
_08056690: .4byte sub_807DF7C
_08056694: .4byte gFieldCallback2
_08056698: .4byte gMain + 0x438
_0805669C: .4byte sub_8056534
_080566A0: .4byte sub_80565B4
	thumb_func_end CB2_NewGame

	thumb_func_start c2_whiteout
c2_whiteout: @ 80566A4
	push {lr}
	sub sp, 0x4
	ldr r1, _08056708 @ =gMain
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _08056702
	bl sub_80569BC
	bl StopMapMusic
	bl sub_8056420
	bl sub_8054BC8
	movs r0, 0x2
	bl sub_80559F8
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _0805670C @ =gUnknown_3005020
	ldr r0, _08056710 @ =sub_807F5F0
	str r0, [r1]
	mov r1, sp
	movs r0, 0
	strb r0, [r1]
	mov r0, sp
	bl do_load_map_stuff_loop
	bl sub_8112364
	bl SetFieldVBlankCallback
	ldr r0, _08056714 @ =sub_8056534
	bl sub_80565E0
	ldr r0, _08056718 @ =sub_80565B4
	bl SetMainCallback2
_08056702:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08056708: .4byte gMain
_0805670C: .4byte gUnknown_3005020
_08056710: .4byte sub_807F5F0
_08056714: .4byte sub_8056534
_08056718: .4byte sub_80565B4
	thumb_func_end c2_whiteout

	thumb_func_start sub_805671C
sub_805671C: @ 805671C
	push {lr}
	bl sub_80569BC
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl sub_80565E0
	ldr r0, _08056740 @ =sub_80C9BFC
	bl SetMainCallback2
	ldr r1, _08056744 @ =gMain
	ldr r0, _08056748 @ =sub_805674C
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08056740: .4byte sub_80C9BFC
_08056744: .4byte gMain
_08056748: .4byte sub_805674C
	thumb_func_end sub_805671C

	thumb_func_start sub_805674C
sub_805674C: @ 805674C
	push {lr}
	ldr r0, _08056768 @ =gMain + 0x438
	bl do_load_map_stuff_loop
	bl sub_8113748
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805676C
	bl sub_81119C8
	b _0805677C
	.align 2, 0
_08056768: .4byte gMain + 0x438
_0805676C:
	bl SetFieldVBlankCallback
	ldr r0, _08056780 @ =sub_8056534
	bl sub_80565E0
	ldr r0, _08056784 @ =sub_80565B4
	bl SetMainCallback2
_0805677C:
	pop {r0}
	bx r0
	.align 2, 0
_08056780: .4byte sub_8056534
_08056784: .4byte sub_80565B4
	thumb_func_end sub_805674C

	thumb_func_start sub_8056788
sub_8056788: @ 8056788
	push {lr}
	bl sub_80569BC
	ldr r0, _080567A0 @ =gUnknown_3005020
	ldr r1, _080567A4 @ =sub_807DE58
	str r1, [r0]
	ldr r0, _080567A8 @ =c2_80567AC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080567A0: .4byte gUnknown_3005020
_080567A4: .4byte sub_807DE58
_080567A8: .4byte c2_80567AC
	thumb_func_end sub_8056788

	thumb_func_start c2_80567AC
c2_80567AC: @ 80567AC
	push {lr}
	ldr r0, _080567D0 @ =gMain + 0x438
	bl sub_8056A5C
	cmp r0, 0
	beq _080567CC
	bl SetFieldVBlankCallback
	ldr r0, _080567D4 @ =c1_link_related
	bl sub_80565E0
	bl sub_80578D8
	ldr r0, _080567D8 @ =sub_80565B4
	bl SetMainCallback2
_080567CC:
	pop {r0}
	bx r0
	.align 2, 0
_080567D0: .4byte gMain + 0x438
_080567D4: .4byte c1_link_related
_080567D8: .4byte sub_80565B4
	thumb_func_end c2_80567AC

	thumb_func_start c2_exit_to_overworld_2_switch
c2_exit_to_overworld_2_switch: @ 80567DC
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _080567F4
	ldr r0, _080567F0 @ =c2_exit_to_overworld_2_link
	bl SetMainCallback2
	b _080567FE
	.align 2, 0
_080567F0: .4byte c2_exit_to_overworld_2_link
_080567F4:
	bl sub_80569BC
	ldr r0, _08056804 @ =c2_exit_to_overworld_2_local
	bl SetMainCallback2
_080567FE:
	pop {r0}
	bx r0
	.align 2, 0
_08056804: .4byte c2_exit_to_overworld_2_local
	thumb_func_end c2_exit_to_overworld_2_switch

	thumb_func_start c2_exit_to_overworld_2_local
c2_exit_to_overworld_2_local: @ 8056808
	push {lr}
	ldr r0, _08056824 @ =gMain + 0x438
	bl sub_8056CD8
	cmp r0, 0
	beq _0805681E
	bl SetFieldVBlankCallback
	ldr r0, _08056828 @ =sub_80565B4
	bl SetMainCallback2
_0805681E:
	pop {r0}
	bx r0
	.align 2, 0
_08056824: .4byte gMain + 0x438
_08056828: .4byte sub_80565B4
	thumb_func_end c2_exit_to_overworld_2_local

	thumb_func_start c2_exit_to_overworld_2_link
c2_exit_to_overworld_2_link: @ 805682C
	push {lr}
	bl sub_8058244
	cmp r0, 0
	bne _08056846
	ldr r0, _0805684C @ =gMain + 0x438
	bl map_loading_iteration_2_link
	cmp r0, 0
	beq _08056846
	ldr r0, _08056850 @ =sub_80565B4
	bl SetMainCallback2
_08056846:
	pop {r0}
	bx r0
	.align 2, 0
_0805684C: .4byte gMain + 0x438
_08056850: .4byte sub_80565B4
	thumb_func_end c2_exit_to_overworld_2_link

	thumb_func_start c2_8056854
c2_8056854: @ 8056854
	push {lr}
	bl sub_80569BC
	bl StopMapMusic
	ldr r0, _08056878 @ =c1_link_related
	bl sub_80565E0
	bl sub_80578D8
	ldr r0, _0805687C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08056888
	ldr r1, _08056880 @ =gUnknown_3005020
	ldr r0, _08056884 @ =sub_807DE58
	b _0805688C
	.align 2, 0
_08056878: .4byte c1_link_related
_0805687C: .4byte gWirelessCommType
_08056880: .4byte gUnknown_3005020
_08056884: .4byte sub_807DE58
_08056888:
	ldr r1, _080568A0 @ =gUnknown_3005020
	ldr r0, _080568A4 @ =sub_807DDD0
_0805688C:
	str r0, [r1]
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080568A0: .4byte gUnknown_3005020
_080568A4: .4byte sub_807DDD0
	thumb_func_end c2_8056854

	thumb_func_start sub_80568A8
sub_80568A8: @ 80568A8
	push {lr}
	bl sub_80569BC
	ldr r1, _080568BC @ =gFieldCallback2
	ldr r0, _080568C0 @ =sub_807E3BC
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080568BC: .4byte gFieldCallback2
_080568C0: .4byte sub_807E3BC
	thumb_func_end sub_80568A8

	thumb_func_start sub_80568C4
sub_80568C4: @ 80568C4
	push {lr}
	bl sub_80569BC
	ldr r1, _080568D8 @ =gUnknown_3005020
	ldr r0, _080568DC @ =sub_807DD44
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080568D8: .4byte gUnknown_3005020
_080568DC: .4byte sub_807DD44
	thumb_func_end sub_80568C4

	thumb_func_start c2_exit_to_overworld_1_continue_scripts_restart_music
c2_exit_to_overworld_1_continue_scripts_restart_music: @ 80568E0
	push {lr}
	bl sub_80569BC
	ldr r1, _080568F4 @ =gUnknown_3005020
	ldr r0, _080568F8 @ =sub_807DD24
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080568F4: .4byte gUnknown_3005020
_080568F8: .4byte sub_807DD24
	thumb_func_end c2_exit_to_overworld_1_continue_scripts_restart_music

	thumb_func_start sub_80568FC
sub_80568FC: @ 80568FC
	push {lr}
	bl sub_80569BC
	ldr r1, _08056910 @ =gUnknown_3005020
	ldr r0, _08056914 @ =sub_807DF7C
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_08056910: .4byte gUnknown_3005020
_08056914: .4byte sub_807DF7C
	thumb_func_end sub_80568FC

	thumb_func_start sub_8056918
sub_8056918: @ 8056918
	push {lr}
	ldr r0, _08056934 @ =gMapHeader
	ldrb r1, [r0, 0x19]
	movs r0, 0xFC
	ands r0, r1
	cmp r0, 0x4
	bne _0805692C
	movs r0, 0
	bl sub_8098110
_0805692C:
	bl sub_807DF7C
	pop {r0}
	bx r0
	.align 2, 0
_08056934: .4byte gMapHeader
	thumb_func_end sub_8056918

	thumb_func_start sub_8056938
sub_8056938: @ 8056938
	push {lr}
	bl sub_80569BC
	bl StopMapMusic
	bl sub_8056420
	bl set_current_map_header_from_sav1
	bl sub_80550A8
	bl UnfreezeMapObjects
	bl sub_8054E40
	bl sub_80589E8
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _08056990 @ =gFieldCallback2
	movs r0, 0
	str r0, [r1]
	ldr r1, _08056994 @ =gUnknown_2031DE0
	movs r0, 0x1
	strb r0, [r1]
	bl sav2_x1_query_bit1
	cmp r0, 0x1
	bne _0805699C
	bl sav2_x9_clear_bit1
	bl warp1_set_to_sav1w
	bl warp_in
	ldr r0, _08056998 @ =sub_805671C
	bl SetMainCallback2
	b _080569AC
	.align 2, 0
_08056990: .4byte gFieldCallback2
_08056994: .4byte gUnknown_2031DE0
_08056998: .4byte sub_805671C
_0805699C:
	ldr r0, _080569B0 @ =gUnknown_3005020
	ldr r1, _080569B4 @ =sub_8056918
	str r1, [r0]
	ldr r0, _080569B8 @ =sub_8056534
	bl sub_80565E0
	bl c2_exit_to_overworld_2_switch
_080569AC:
	pop {r0}
	bx r0
	.align 2, 0
_080569B0: .4byte gUnknown_3005020
_080569B4: .4byte sub_8056918
_080569B8: .4byte sub_8056534
	thumb_func_end sub_8056938

	thumb_func_start sub_80569BC
sub_80569BC: @ 80569BC
	push {lr}
	bl sub_80CC87C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080569CE
	bl sub_80098B8
_080569CE:
	ldr r0, _080569E4 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _080569E8
	movs r0, 0xC5
	bl EnableInterrupts
	movs r0, 0x2
	bl DisableInterrupts
	b _080569F4
	.align 2, 0
_080569E4: .4byte gWirelessCommType
_080569E8:
	movs r0, 0x2
	bl DisableInterrupts
	movs r0, 0x1
	bl EnableInterrupts
_080569F4:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_80569BC

	thumb_func_start SetFieldVBlankCallback
SetFieldVBlankCallback: @ 8056A04
	push {lr}
	ldr r0, _08056A10 @ =VBlankCB_Field
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_08056A10: .4byte VBlankCB_Field
	thumb_func_end SetFieldVBlankCallback

	thumb_func_start VBlankCB_Field
VBlankCB_Field: @ 8056A14
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl ScanlineEffect_InitHBlankDmaTransfer
	bl FieldUpdateBgTilemapScroll
	bl TransferPlttBuffer
	bl TransferTilesetAnimsBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_Field

	thumb_func_start sub_8056A34
sub_8056A34: @ 8056A34
	push {lr}
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08056A52
	bl sub_807F074
	ldr r2, _08056A58 @ =gUnknown_826D330
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl ScanlineEffect_SetParams
_08056A52:
	pop {r0}
	bx r0
	.align 2, 0
_08056A58: .4byte gUnknown_826D330
	thumb_func_end sub_8056A34

	thumb_func_start sub_8056A5C
sub_8056A5C: @ 8056A5C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bls _08056A68
	b _08056B6E
_08056A68:
	lsls r0, 2
	ldr r1, _08056A74 @ =_08056A78
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056A74: .4byte _08056A78
	.align 2, 0
_08056A78:
	.4byte _08056AB0
	.4byte _08056ABE
	.4byte _08056AC6
	.4byte _08056ACE
	.4byte _08056AE4
	.4byte _08056AEE
	.4byte _08056AF4
	.4byte _08056B04
	.4byte _08056B14
	.4byte _08056B30
	.4byte _08056B36
	.4byte _08056B3C
	.4byte _08056B58
	.4byte _08056B6A
_08056AB0:
	bl sub_80562B0
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	b _08056B62
_08056ABE:
	movs r0, 0x1
	bl sub_8055920
	b _08056B62
_08056AC6:
	movs r0, 0x1
	bl sub_8057024
	b _08056B62
_08056ACE:
	bl sub_8057178
	bl sub_8057074
	bl sub_80571A8
	bl sub_8057140
	bl sub_812B35C
	b _08056B62
_08056AE4:
	bl sub_8056A34
	bl sub_8056F1C
	b _08056B62
_08056AEE:
	bl move_tilemap_camera_to_upper_left_corner
	b _08056B62
_08056AF4:
	ldr r0, _08056B00 @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _08056B62
	.align 2, 0
_08056B00: .4byte gMapHeader
_08056B04:
	ldr r0, _08056B10 @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _08056B62
	.align 2, 0
_08056B10: .4byte gMapHeader
_08056B14:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08056B6E
	ldr r0, _08056B2C @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08056B62
	.align 2, 0
_08056B2C: .4byte gMapHeader
_08056B30:
	bl DrawWholeMapView
	b _08056B62
_08056B36:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08056B62
_08056B3C:
	ldr r0, _08056B54 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08056B62
	bl sub_80FCEA8
	movs r0, 0
	movs r1, 0
	bl sub_80FCD74
	b _08056B62
	.align 2, 0
_08056B54: .4byte gWirelessCommType
_08056B58:
	bl map_post_load_hook_exec
	lsls r0, 24
	cmp r0, 0
	beq _08056B6E
_08056B62:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08056B6E
_08056B6A:
	movs r0, 0x1
	b _08056B70
_08056B6E:
	movs r0, 0
_08056B70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056A5C

	thumb_func_start sub_8056B78
sub_8056B78: @ 8056B78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0xE
	bls _08056B86
	b _08056CD0
_08056B86:
	lsls r0, 2
	ldr r1, _08056B90 @ =_08056B94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056B90: .4byte _08056B94
	.align 2, 0
_08056B94:
	.4byte _08056BD0
	.4byte _08056BE0
	.4byte _08056BE6
	.4byte _08056BEE
	.4byte _08056BFE
	.4byte _08056C20
	.4byte _08056C2A
	.4byte _08056C30
	.4byte _08056C40
	.4byte _08056C50
	.4byte _08056C6C
	.4byte _08056C72
	.4byte _08056C78
	.4byte _08056CC0
	.4byte _08056BFA
_08056BD0:
	bl sub_80562B0
	bl sub_80569BC
	adds r0, r5, 0
	bl sub_8055920
	b _08056CCA
_08056BE0:
	bl sub_8111F14
	b _08056CCA
_08056BE6:
	adds r0, r5, 0
	bl sub_8057024
	b _08056CCA
_08056BEE:
	bl sub_8113748
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08056CCA
_08056BFA:
	movs r0, 0x1
	b _08056CD2
_08056BFE:
	bl mli4_mapscripts_and_other
	bl sub_8057114
	ldr r0, _08056C1C @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08056C16
	bl sub_80CC534
	bl sub_80CC59C
_08056C16:
	bl sub_812B35C
	b _08056CCA
	.align 2, 0
_08056C1C: .4byte gUnknown_203ADFA
_08056C20:
	bl sub_8056A34
	bl sub_8056F1C
	b _08056CCA
_08056C2A:
	bl move_tilemap_camera_to_upper_left_corner
	b _08056CCA
_08056C30:
	ldr r0, _08056C3C @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _08056CCA
	.align 2, 0
_08056C3C: .4byte gMapHeader
_08056C40:
	ldr r0, _08056C4C @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _08056CCA
	.align 2, 0
_08056C4C: .4byte gMapHeader
_08056C50:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08056CD0
	ldr r0, _08056C68 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08056CCA
	.align 2, 0
_08056C68: .4byte gMapHeader
_08056C6C:
	bl DrawWholeMapView
	b _08056CCA
_08056C72:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08056CCA
_08056C78:
	bl sub_80561B4
	ldr r5, _08056CA4 @ =gMapHeader
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x14]
	cmp r0, r1
	beq _08056CA8
	ldrb r0, [r5, 0x14]
	movs r1, 0x1
	bl sub_80F8154
	cmp r0, 0x1
	bne _08056CA8
	ldrb r0, [r5, 0x14]
	bl sub_80F819C
	ldrb r0, [r5, 0x14]
	bl sub_80F8268
	b _08056CCA
	.align 2, 0
_08056CA4: .4byte gMapHeader
_08056CA8:
	ldr r0, _08056CBC @ =gMapHeader
	ldrb r1, [r0, 0x19]
	movs r0, 0xFC
	ands r0, r1
	cmp r0, 0x4
	bne _08056CCA
	movs r0, 0
	bl sub_8098110
	b _08056CCA
	.align 2, 0
_08056CBC: .4byte gMapHeader
_08056CC0:
	bl map_post_load_hook_exec
	lsls r0, 24
	cmp r0, 0
	beq _08056CD0
_08056CCA:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08056CD0:
	movs r0, 0
_08056CD2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8056B78

	thumb_func_start sub_8056CD8
sub_8056CD8: @ 8056CD8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x4
	bhi _08056D3C
	lsls r0, 2
	ldr r1, _08056CEC @ =_08056CF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056CEC: .4byte _08056CF0
	.align 2, 0
_08056CF0:
	.4byte _08056D04
	.4byte _08056D30
	.4byte _08056D1C
	.4byte _08056D26
	.4byte _08056D38
_08056D04:
	bl sub_80562B0
	bl sub_8111F14
	movs r0, 0
	bl sub_8057024
	bl sub_8057100
	bl sub_8057114
	b _08056D30
_08056D1C:
	bl sub_8056F08
	bl sub_812B35C
	b _08056D30
_08056D26:
	bl map_post_load_hook_exec
	lsls r0, 24
	cmp r0, 0
	beq _08056D3C
_08056D30:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08056D3C
_08056D38:
	movs r0, 0x1
	b _08056D3E
_08056D3C:
	movs r0, 0
_08056D3E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056CD8

	thumb_func_start map_loading_iteration_2_link
map_loading_iteration_2_link: @ 8056D44
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bls _08056D50
	b _08056E54
_08056D50:
	lsls r0, 2
	ldr r1, _08056D5C @ =_08056D60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056D5C: .4byte _08056D60
	.align 2, 0
_08056D60:
	.4byte _08056D98
	.4byte _08056DA2
	.4byte _08056DAE
	.4byte _08056DC0
	.4byte _08056DCA
	.4byte _08056DD0
	.4byte _08056DE0
	.4byte _08056DF0
	.4byte _08056E0C
	.4byte _08056E12
	.4byte _08056E3E
	.4byte _08056E18
	.4byte _08056E34
	.4byte _08056E46
_08056D98:
	bl sub_80562B0
	bl sub_80569BC
	b _08056E3E
_08056DA2:
	bl sub_8111F14
	movs r0, 0x1
	bl sub_8057024
	b _08056E3E
_08056DAE:
	bl sub_8057230
	bl sub_8057100
	bl sub_805715C
	bl sub_812B35C
	b _08056E3E
_08056DC0:
	bl sub_8056A34
	bl sub_8056F1C
	b _08056E3E
_08056DCA:
	bl move_tilemap_camera_to_upper_left_corner
	b _08056E3E
_08056DD0:
	ldr r0, _08056DDC @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _08056E3E
	.align 2, 0
_08056DDC: .4byte gMapHeader
_08056DE0:
	ldr r0, _08056DEC @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _08056E3E
	.align 2, 0
_08056DEC: .4byte gMapHeader
_08056DF0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08056E54
	ldr r0, _08056E08 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08056E3E
	.align 2, 0
_08056E08: .4byte gMapHeader
_08056E0C:
	bl DrawWholeMapView
	b _08056E3E
_08056E12:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08056E3E
_08056E18:
	ldr r0, _08056E30 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08056E3E
	bl sub_80FCEA8
	movs r0, 0
	movs r1, 0
	bl sub_80FCD74
	b _08056E3E
	.align 2, 0
_08056E30: .4byte gWirelessCommType
_08056E34:
	bl map_post_load_hook_exec
	lsls r0, 24
	cmp r0, 0
	beq _08056E54
_08056E3E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08056E54
_08056E46:
	bl SetFieldVBlankCallback
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
	b _08056E56
_08056E54:
	movs r0, 0
_08056E56:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end map_loading_iteration_2_link

	thumb_func_start do_load_map_stuff_loop
do_load_map_stuff_loop: @ 8056E5C
	push {r4,lr}
	adds r4, r0, 0
_08056E60:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8056B78
	cmp r0, 0
	beq _08056E60
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end do_load_map_stuff_loop

	thumb_func_start MoveSaveBlocks_ResetHeap_
MoveSaveBlocks_ResetHeap_: @ 8056E74
	push {lr}
	bl MoveSaveBlocks_ResetHeap
	pop {r0}
	bx r0
	thumb_func_end MoveSaveBlocks_ResetHeap_

	thumb_func_start sub_8056E80
sub_8056E80: @ 8056E80
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl ScanlineEffect_Stop
	ldr r2, _08056EF8 @ =0x05000002
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08056EFC @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08056F00 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08056F04 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08056EBE:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08056EBE
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056EF8: .4byte 0x05000002
_08056EFC: .4byte 0x040000d4
_08056F00: .4byte 0x810001ff
_08056F04: .4byte 0x81000800
	thumb_func_end sub_8056E80

	thumb_func_start sub_8056F08
sub_8056F08: @ 8056F08
	push {lr}
	bl sub_8056A34
	bl sub_8056F1C
	bl mapdata_load_assets_to_gpu_and_full_redraw
	pop {r0}
	bx r0
	thumb_func_end sub_8056F08

	thumb_func_start sub_8056F1C
sub_8056F1C: @ 8056F1C
	push {r4,lr}
	bl clear_scheduled_bg_copies_to_vram
	bl reset_temp_tile_data_buffers
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	ldr r1, _0805700C @ =0x00001f1f
	movs r0, 0x48
	bl SetGpuReg
	ldr r1, _08057010 @ =0x00000101
	movs r0, 0x4A
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0xFF
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0xFF
	bl SetGpuReg
	ldr r4, _08057014 @ =0x0000ffff
	movs r0, 0x42
	adds r1, r4, 0
	bl SetGpuReg
	movs r0, 0x46
	adds r1, r4, 0
	bl SetGpuReg
	ldr r0, _08057018 @ =gBLDCNTTarget2BGFlags
	ldrh r1, [r0, 0x2]
	ldrh r2, [r0, 0x4]
	orrs r1, r2
	ldrh r0, [r0, 0x6]
	orrs r1, r0
	movs r2, 0x82
	lsls r2, 5
	adds r0, r2, 0
	orrs r1, r0
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _0805701C @ =0x0000070d
	movs r0, 0x52
	bl SetGpuReg
	movs r0, 0x1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, 0x3
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08057020 @ =0x00007060
	movs r0, 0
	bl SetGpuReg
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805700C: .4byte 0x00001f1f
_08057010: .4byte 0x00000101
_08057014: .4byte 0x0000ffff
_08057018: .4byte gBLDCNTTarget2BGFlags
_0805701C: .4byte 0x0000070d
_08057020: .4byte 0x00007060
	thumb_func_end sub_8056F1C

	thumb_func_start sub_8057024
sub_8057024: @ 8057024
	push {r4,lr}
	adds r4, r0, 0
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl ScanlineEffect_Clear
	bl dp13_810BB8C
	bl ResetCameraUpdateInfo
	bl InstallCameraPanAheadCallback
	cmp r4, 0
	bne _08057050
	movs r0, 0
	bl npc_paltag_set_load
	b _08057056
_08057050:
	movs r0, 0x1
	bl npc_paltag_set_load
_08057056:
	bl FieldEffectActiveListClear
	bl sub_8079C08
	bl sub_807B1B8
	cmp r4, 0
	bne _0805706A
	bl sub_806E87C
_0805706A:
	bl mapheader_run_script_with_tag_x5
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8057024

	thumb_func_start sub_8057074
sub_8057074: @ 8057074
	push {lr}
	ldr r0, _08057094 @ =gUnknown_300506C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08057098 @ =gUnknown_3005068
	strh r1, [r0]
	bl sub_805DE74
	movs r0, 0
	movs r1, 0
	bl sub_805EC30
	bl mapheader_run_first_tag4_script_list_match
	pop {r0}
	bx r0
	.align 2, 0
_08057094: .4byte gUnknown_300506C
_08057098: .4byte gUnknown_3005068
	thumb_func_end sub_8057074

	thumb_func_start mli4_mapscripts_and_other
mli4_mapscripts_and_other: @ 805709C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _080570F4 @ =gUnknown_300506C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080570F8 @ =gUnknown_3005068
	strh r1, [r0]
	bl sub_805DE74
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetCameraFocusCoords
	bl sub_8055A6C
	adds r5, r0, 0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldrb r2, [r5, 0x1]
	ldr r3, _080570FC @ =gSaveBlock2Ptr
	ldr r3, [r3]
	ldrb r3, [r3, 0x8]
	bl InitPlayerAvatar
	ldrb r0, [r5]
	bl SetPlayerAvatarTransitionFlags
	bl ResetInitialPlayerAvatarState
	movs r0, 0
	movs r1, 0
	bl sub_805EC30
	bl mapheader_run_first_tag4_script_list_match
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080570F4: .4byte gUnknown_300506C
_080570F8: .4byte gUnknown_3005068
_080570FC: .4byte gSaveBlock2Ptr
	thumb_func_end mli4_mapscripts_and_other

	thumb_func_start sub_8057100
sub_8057100: @ 8057100
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_805EDF0
	bl mapheader_run_script_with_tag_x7
	pop {r0}
	bx r0
	thumb_func_end sub_8057100

	thumb_func_start sub_8057114
sub_8057114: @ 8057114
	push {lr}
	ldr r2, _08057138 @ =gMapObjects
	ldr r3, _0805713C @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r0, [r3, 0x4]
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08057138: .4byte gMapObjects
_0805713C: .4byte gPlayerAvatar
	thumb_func_end sub_8057114

	thumb_func_start sub_8057140
sub_8057140: @ 8057140
	push {lr}
	ldr r0, _08057158 @ =gUnknown_300502C
	ldrb r0, [r0]
	bl sub_8058504
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08057158: .4byte gUnknown_300502C
	thumb_func_end sub_8057140

	thumb_func_start sub_805715C
sub_805715C: @ 805715C
	push {lr}
	ldr r0, _08057174 @ =gUnknown_300502C
	ldrb r0, [r0]
	bl sub_8058504
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08057174: .4byte gUnknown_300502C
	thumb_func_end sub_805715C

	thumb_func_start sub_8057178
sub_8057178: @ 8057178
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetCameraFocusCoords
	mov r2, sp
	ldr r0, _080571A4 @ =gUnknown_300502C
	ldrb r1, [r0]
	ldrh r0, [r2]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	bl SetCameraFocusCoords
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080571A4: .4byte gUnknown_300502C
	thumb_func_end sub_8057178

	thumb_func_start sub_80571A8
sub_80571A8: @ 80571A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetCameraFocusCoords
	mov r3, sp
	mov r2, sp
	ldr r0, _08057224 @ =gUnknown_300502C
	ldrb r1, [r0]
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r3]
	movs r6, 0
	ldr r0, _08057228 @ =gUnknown_3005030
	mov r8, r4
	ldrb r0, [r0]
	cmp r6, r0
	bcs _08057212
	ldr r7, _0805722C @ =gLinkPlayers
_080571D8:
	lsls r5, r6, 24
	lsrs r5, 24
	mov r0, sp
	ldrh r1, [r0]
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r3, 0
	ldrsh r2, [r0, r3]
	lsls r4, r6, 3
	subs r4, r6
	lsls r4, 2
	adds r4, r7
	ldrb r3, [r4, 0x13]
	adds r0, r5, 0
	bl SpawnLinkPlayerMapObject
	ldrb r1, [r4]
	adds r0, r5, 0
	bl sub_8058878
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08057228 @ =gUnknown_3005030
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080571D8
_08057212:
	bl sub_80578EC
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057224: .4byte gUnknown_300502C
_08057228: .4byte gUnknown_3005030
_0805722C: .4byte gLinkPlayers
	thumb_func_end sub_80571A8

	thumb_func_start sub_8057230
sub_8057230: @ 8057230
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _08057264 @ =gUnknown_3005030
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0805725E
	ldr r5, _08057268 @ =gLinkPlayers
_0805723E:
	lsls r0, r4, 24
	lsrs r0, 24
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r5
	ldrb r1, [r1]
	bl sub_8058878
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08057264 @ =gUnknown_3005030
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0805723E
_0805725E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057264: .4byte gUnknown_3005030
_08057268: .4byte gLinkPlayers
	thumb_func_end sub_8057230

	thumb_func_start sub_805726C
sub_805726C: @ 805726C
	push {lr}
	bl sub_80569BC
	ldr r1, _08057298 @ =gUnknown_2036E28
	movs r0, 0x1
	strb r0, [r1]
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl sub_80565E0
	ldr r0, _0805729C @ =sub_80C9BFC
	bl SetMainCallback2
	ldr r1, _080572A0 @ =gMain
	ldr r0, _080572A4 @ =sub_80572D8
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08057298: .4byte gUnknown_2036E28
_0805729C: .4byte sub_80C9BFC
_080572A0: .4byte gMain
_080572A4: .4byte sub_80572D8
	thumb_func_end sub_805726C

	thumb_func_start sub_80572A8
sub_80572A8: @ 80572A8
	push {lr}
	bl sub_80569BC
	ldr r0, _080572D0 @ =gUnknown_2036E28
	movs r1, 0x1
	strb r1, [r0]
	bl set_current_map_header_from_sav1
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl sub_80565E0
	ldr r0, _080572D4 @ =sub_80572D8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080572D0: .4byte gUnknown_2036E28
_080572D4: .4byte sub_80572D8
	thumb_func_end sub_80572A8

	thumb_func_start sub_80572D8
sub_80572D8: @ 80572D8
	push {lr}
	ldr r0, _080572F4 @ =gMain + 0x438
	bl sub_8057300
	bl SetFieldVBlankCallback
	ldr r0, _080572F8 @ =sub_8056534
	bl sub_80565E0
	ldr r0, _080572FC @ =sub_80565B4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080572F4: .4byte gMain + 0x438
_080572F8: .4byte sub_8056534
_080572FC: .4byte sub_80565B4
	thumb_func_end sub_80572D8

	thumb_func_start sub_8057300
sub_8057300: @ 8057300
	push {r4,lr}
	adds r4, r0, 0
_08057304:
	adds r0, r4, 0
	bl sub_8057314
	cmp r0, 0
	beq _08057304
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8057300

	thumb_func_start sub_8057314
sub_8057314: @ 8057314
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xA
	bls _08057320
	b _0805741A
_08057320:
	lsls r0, 2
	ldr r1, _0805732C @ =_08057330
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805732C: .4byte _08057330
	.align 2, 0
_08057330:
	.4byte _0805735C
	.4byte _080573A0
	.4byte _080573A6
	.4byte _080573AE
	.4byte _080573B8
	.4byte _080573C2
	.4byte _080573C8
	.4byte _080573D8
	.4byte _080573E8
	.4byte _08057404
	.4byte _0805740A
_0805735C:
	bl sub_80562B0
	bl sub_80569BC
	bl sub_8111F14
	bl sub_81113E4
	bl sub_8111438
	bl sub_8110AC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08057390
	ldr r1, _0805738C @ =gUnknown_2031DE0
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	bl sub_8055920
	b _08057412
	.align 2, 0
_0805738C: .4byte gUnknown_2031DE0
_08057390:
	ldr r1, _0805739C @ =gUnknown_2031DE0
	movs r0, 0x1
	strb r0, [r1]
	bl sub_80559A8
	b _08057412
	.align 2, 0
_0805739C: .4byte gUnknown_2031DE0
_080573A0:
	bl sub_8110FCC
	b _08057412
_080573A6:
	movs r0, 0
	bl sub_8057024
	b _08057412
_080573AE:
	bl sub_8057100
	bl sub_8057114
	b _08057412
_080573B8:
	bl sub_8056A34
	bl sub_8056F1C
	b _08057412
_080573C2:
	bl move_tilemap_camera_to_upper_left_corner
	b _08057412
_080573C8:
	ldr r0, _080573D4 @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _08057412
	.align 2, 0
_080573D4: .4byte gMapHeader
_080573D8:
	ldr r0, _080573E4 @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _08057412
	.align 2, 0
_080573E4: .4byte gMapHeader
_080573E8:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08057428
	ldr r0, _08057400 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08057412
	.align 2, 0
_08057400: .4byte gMapHeader
_08057404:
	bl DrawWholeMapView
	b _08057412
_0805740A:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	bl sub_815A540
_08057412:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08057428
_0805741A:
	bl map_post_load_hook_exec
	lsls r0, 24
	cmp r0, 0
	beq _08057428
	movs r0, 0x1
	b _0805742A
_08057428:
	movs r0, 0
_0805742A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8057314

	thumb_func_start sub_8057430
sub_8057430: @ 8057430
	push {lr}
	bl sub_80569BC
	bl StopMapMusic
	ldr r1, _08057484 @ =gUnknown_2036E28
	movs r0, 0x3
	strb r0, [r1]
	bl sub_8056420
	bl set_current_map_header_from_sav1
	bl sub_80550A8
	bl UnfreezeMapObjects
	bl sub_8054E40
	bl sub_80589E8
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	ldr r1, _08057488 @ =gUnknown_2031DE0
	movs r0, 0x1
	strb r0, [r1]
	bl sav2_x1_query_bit1
	cmp r0, 0x1
	bne _08057490
	bl sav2_x9_clear_bit1
	bl warp1_set_to_sav1w
	bl warp_in
	ldr r0, _0805748C @ =sub_805671C
	bl SetMainCallback2
	b _0805749A
	.align 2, 0
_08057484: .4byte gUnknown_2036E28
_08057488: .4byte gUnknown_2031DE0
_0805748C: .4byte sub_805671C
_08057490:
	ldr r0, _080574A0 @ =sub_8056534
	bl sub_80565E0
	bl c2_exit_to_overworld_2_switch
_0805749A:
	pop {r0}
	bx r0
	.align 2, 0
_080574A0: .4byte sub_8056534
	thumb_func_end sub_8057430

	thumb_func_start sub_80574A4
sub_80574A4: @ 80574A4
	push {r4,lr}
	ldr r0, _080574E8 @ =gPaletteFade
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	adds r4, r0, 0
	cmp r4, 0
	beq _080574B8
	movs r0, 0
	bl SetVBlankCallback
_080574B8:
	bl RunTasks
	bl AnimateSprites
	bl sub_805ACF0
	bl UpdateCameraPanning
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_806FFBC
	bl do_scheduled_bg_tilemap_copies_to_vram
	cmp r4, 0
	beq _080574E0
	bl SetFieldVBlankCallback
_080574E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080574E8: .4byte gPaletteFade
	thumb_func_end sub_80574A4

	thumb_func_start sub_80574EC
sub_80574EC: @ 80574EC
	push {lr}
	ldr r0, _08057500 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08057504
	movs r0, 0
	b _08057506
	.align 2, 0
_08057500: .4byte gPaletteFade
_08057504:
	movs r0, 0x1
_08057506:
	pop {r1}
	bx r1
	thumb_func_end sub_80574EC

	thumb_func_start sub_805750C
sub_805750C: @ 805750C
	push {lr}
	ldr r3, _08057520 @ =gUnknown_2031DE4
	str r1, [r3]
	ldr r1, _08057524 @ =gUnknown_2036E28
	strb r2, [r1]
	movs r1, 0
	bl sub_8057528
	pop {r1}
	bx r1
	.align 2, 0
_08057520: .4byte gUnknown_2031DE4
_08057524: .4byte gUnknown_2036E28
	thumb_func_end sub_805750C

	thumb_func_start sub_8057528
sub_8057528: @ 8057528
	push {r4-r7,lr}
	adds r7, r0, 0
	ldrb r1, [r7]
	cmp r1, 0x1
	beq _08057560
	cmp r1, 0x1
	bgt _0805753C
	cmp r1, 0
	beq _08057546
	b _08057648
_0805753C:
	cmp r1, 0x2
	beq _08057620
	cmp r1, 0x3
	beq _0805762C
	b _08057648
_08057546:
	ldr r0, _08057558 @ =gUnknown_2031DEA
	strh r1, [r0]
	ldr r0, _0805755C @ =gUnknown_2031DE8
	strh r1, [r0]
_0805754E:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _08057648
	.align 2, 0
_08057558: .4byte gUnknown_2031DEA
_0805755C: .4byte gUnknown_2031DE8
_08057560:
	ldr r3, _080575F0 @ =gUnknown_2031DEA
	movs r0, 0
	ldrsh r1, [r3, r0]
	ldr r0, _080575F4 @ =gUnknown_2031DE4
	ldr r4, [r0]
	lsls r1, 3
	adds r1, r4
	ldrb r2, [r1, 0x2]
	ldr r0, _080575F8 @ =0xffffff00
	ands r0, r5
	orrs r0, r2
	ldrb r1, [r1, 0x4]
	lsls r1, 8
	ldr r2, _080575FC @ =0xffff00ff
	ands r0, r2
	adds r5, r0, 0
	orrs r5, r1
	movs r0, 0xFF
	lsls r0, 16
	orrs r5, r0
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	movs r2, 0
	ldrsh r1, [r3, r2]
	lsls r1, 3
	adds r1, r4
	ldrh r2, [r1]
	ldr r0, _08057600 @ =0xffff0000
	ands r0, r6
	orrs r0, r2
	ldrh r1, [r1, 0x2]
	lsls r1, 16
	ldr r2, _08057604 @ =0x0000ffff
	ands r0, r2
	adds r6, r0, 0
	orrs r6, r1
	ldr r0, _08057608 @ =gUnknown_2031DBC
	str r5, [r0]
	str r6, [r0, 0x4]
	ldr r1, _0805760C @ =gUnknown_2031DE8
	movs r2, 0
	ldrsh r0, [r3, r2]
	lsls r0, 3
	adds r0, r4
	ldrh r0, [r0, 0x4]
	strh r0, [r1]
	bl warp_in
	ldr r2, _08057610 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl sub_80565E0
	ldr r1, _08057614 @ =gFieldCallback2
	ldr r0, _08057618 @ =sub_80574EC
	str r0, [r1]
	ldr r0, _0805761C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0805754E
	.align 2, 0
_080575F0: .4byte gUnknown_2031DEA
_080575F4: .4byte gUnknown_2031DE4
_080575F8: .4byte 0xffffff00
_080575FC: .4byte 0xffff00ff
_08057600: .4byte 0xffff0000
_08057604: .4byte 0x0000ffff
_08057608: .4byte gUnknown_2031DBC
_0805760C: .4byte gUnknown_2031DE8
_08057610: .4byte gPaletteFade
_08057614: .4byte gFieldCallback2
_08057618: .4byte sub_80574EC
_0805761C: .4byte gMain
_08057620:
	bl sub_8057650
	lsls r0, 24
	cmp r0, 0
	beq _08057648
	b _0805754E
_0805762C:
	ldr r0, _08057640 @ =gUnknown_3005050
	ldr r1, _08057644 @ =sub_8057748
	str r1, [r0]
	bl SetFieldVBlankCallback
	movs r0, 0
	strb r0, [r7]
	movs r0, 0x1
	b _0805764A
	.align 2, 0
_08057640: .4byte gUnknown_3005050
_08057644: .4byte sub_8057748
_08057648:
	movs r0, 0
_0805764A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8057528

	thumb_func_start sub_8057650
sub_8057650: @ 8057650
	push {r4,lr}
	ldr r4, _08057664 @ =gMain + 0x438
	ldrb r0, [r4]
	cmp r0, 0x8
	bhi _0805773C
	lsls r0, 2
	ldr r1, _08057668 @ =_0805766C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057664: .4byte gMain + 0x438
_08057668: .4byte _0805766C
	.align 2, 0
_0805766C:
	.4byte _08057690
	.4byte _0805769C
	.4byte _080576C2
	.4byte _080576CC
	.4byte _080576D2
	.4byte _080576E0
	.4byte _080576F0
	.4byte _0805770C
	.4byte _08057712
_08057690:
	bl sub_8056354
	movs r0, 0
	bl sub_8055920
	b _0805772A
_0805769C:
	bl ScanlineEffect_Clear
	bl dp13_810BB8C
	bl ResetCameraUpdateInfo
	bl InstallCameraPanAheadCallback
	bl FieldEffectActiveListClear
	bl sub_8079C08
	bl sub_807B1B8
	bl sub_806E87C
	bl mapheader_run_script_with_tag_x5
	b _0805772A
_080576C2:
	bl sub_8056A34
	bl sub_8056F1C
	b _0805772A
_080576CC:
	bl move_tilemap_camera_to_upper_left_corner
	b _0805772A
_080576D2:
	ldr r0, _080576DC @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _0805772A
	.align 2, 0
_080576DC: .4byte gMapHeader
_080576E0:
	ldr r0, _080576EC @ =gMapHeader
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _0805772A
	.align 2, 0
_080576EC: .4byte gMapHeader
_080576F0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08057740
	ldr r0, _08057708 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _0805772A
	.align 2, 0
_08057708: .4byte gMapHeader
_0805770C:
	bl DrawWholeMapView
	b _0805772A
_08057712:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	ldr r2, _08057734 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _08057738 @ =0x3fffffff
	movs r0, 0
	movs r1, 0
	bl sub_807A944
_0805772A:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08057740
	.align 2, 0
_08057734: .4byte gPaletteFade
_08057738: .4byte 0x3fffffff
_0805773C:
	movs r0, 0x1
	b _08057742
_08057740:
	movs r0, 0
_08057742:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8057650

	thumb_func_start sub_8057748
sub_8057748: @ 8057748
	push {r4-r6,lr}
	adds r2, r0, 0
	ldr r0, _08057784 @ =gUnknown_2031DE8
	movs r3, 0
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	ldr r4, _08057788 @ =gUnknown_2031DEA
	ldr r6, _0805778C @ =gUnknown_2031DE4
	cmp r1, 0
	bne _080577F4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	ldr r1, [r6]
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3]
	subs r0, 0xFB
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bhi _080577D4
	lsls r0, 2
	ldr r1, _08057790 @ =_08057794
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057784: .4byte gUnknown_2031DE8
_08057788: .4byte gUnknown_2031DEA
_0805778C: .4byte gUnknown_2031DE4
_08057790: .4byte _08057794
	.align 2, 0
_08057794:
	.4byte _080577C0
	.4byte _08057814
	.4byte _080577CA
	.4byte _08057814
	.4byte _080577A8
_080577A8:
	movs r0, 0
	str r0, [r2, 0x8]
	str r0, [r2, 0xC]
	str r0, [r2]
	ldr r0, _080577BC @ =sub_805781C
	movs r1, 0
	bl CreateTask
	b _08057814
	.align 2, 0
_080577BC: .4byte sub_805781C
_080577C0:
	movs r0, 0
	str r0, [r2, 0x8]
	str r0, [r2, 0xC]
	str r0, [r2]
	b _080577F4
_080577CA:
	movs r0, 0
	str r0, [r2, 0x8]
	str r0, [r2, 0xC]
	str r0, [r2]
	b _08057814
_080577D4:
	ldrh r0, [r3, 0x4]
	strh r0, [r5]
	movs r3, 0
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r0, r1
	movs r3, 0
	ldrsh r0, [r0, r3]
	str r0, [r2, 0x8]
	movs r3, 0
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	str r0, [r2, 0xC]
_080577F4:
	movs r3, 0
	ldrsh r0, [r4, r3]
	ldr r1, [r6]
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	bne _0805780E
	movs r0, 0
	str r0, [r2, 0x8]
	str r0, [r2, 0xC]
	b _08057814
_0805780E:
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
_08057814:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8057748

	thumb_func_start sub_805781C
sub_805781C: @ 805781C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0805784C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08057850 @ =sub_8057854
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805784C: .4byte gTasks
_08057850: .4byte sub_8057854
	thumb_func_end sub_805781C

	thumb_func_start sub_8057854
sub_8057854: @ 8057854
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0805787C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08057876
	bl sub_80563F0
	ldr r0, _08057880 @ =sub_805671C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08057876:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805787C: .4byte gPaletteFade
_08057880: .4byte sub_805671C
	thumb_func_end sub_8057854

	thumb_func_start c1_link_related
c1_link_related: @ 8057884
	push {r4,lr}
	ldr r0, _080578C8 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805789E
	bl sub_80F90DC
	cmp r0, 0
	beq _0805789E
	bl sub_800A00C
	cmp r0, 0
	bne _080578C0
_0805789E:
	ldr r0, _080578CC @ =gUnknown_300502C
	ldrb r4, [r0]
	ldr r0, _080578D0 @ =gUnknown_3003E60
	adds r1, r4, 0
	bl sub_8057BE4
	ldr r0, _080578D4 @ =gUnknown_3000E84
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 16
	lsrs r0, 16
	bl sub_8057C4C
	bl sub_80578EC
_080578C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080578C8: .4byte gWirelessCommType
_080578CC: .4byte gUnknown_300502C
_080578D0: .4byte gUnknown_3003E60
_080578D4: .4byte gUnknown_3000E84
	thumb_func_end c1_link_related

	thumb_func_start sub_80578D8
sub_80578D8: @ 80578D8
	push {lr}
	bl sub_805793C
	ldr r0, _080578E8 @ =sub_8057D5C
	bl c1_link_related_func_set
	pop {r0}
	bx r0
	.align 2, 0
_080578E8: .4byte sub_8057D5C
	thumb_func_end sub_80578D8

	thumb_func_start sub_80578EC
sub_80578EC: @ 80578EC
	push {lr}
	ldr r0, _080578F8 @ =gUnknown_3003E60
	bl sub_8057D48
	pop {r0}
	bx r0
	.align 2, 0
_080578F8: .4byte gUnknown_3003E60
	thumb_func_end sub_80578EC

	thumb_func_start c1_link_related_func_set
c1_link_related_func_set: @ 80578FC
	ldr r2, _08057908 @ =gUnknown_3000E89
	movs r1, 0
	strb r1, [r2]
	ldr r1, _0805790C @ =gUnknown_3000E84
	str r0, [r1]
	bx lr
	.align 2, 0
_08057908: .4byte gUnknown_3000E89
_0805790C: .4byte gUnknown_3000E84
	thumb_func_end c1_link_related_func_set

	thumb_func_start sub_8057910
sub_8057910: @ 8057910
	push {lr}
	ldr r0, _08057934 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805792E
	ldr r1, _08057938 @ =gUnknown_3000E89
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3C
	bls _0805792E
	bl sub_80FA190
_0805792E:
	pop {r0}
	bx r0
	.align 2, 0
_08057934: .4byte gWirelessCommType
_08057938: .4byte gUnknown_3000E89
	thumb_func_end sub_8057910

	thumb_func_start sub_805793C
sub_805793C: @ 805793C
	push {lr}
	ldr r1, _08057950 @ =gUnknown_3000E80
	movs r2, 0x80
	adds r0, r1, 0x3
_08057944:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08057944
	pop {r0}
	bx r0
	.align 2, 0
_08057950: .4byte gUnknown_3000E80
	thumb_func_end sub_805793C

	thumb_func_start sub_8057954
sub_8057954: @ 8057954
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08057974 @ =gUnknown_3005030
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _08057982
	ldr r4, _08057978 @ =gUnknown_3000E80
_08057966:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _0805797C
	movs r0, 0
	b _08057984
	.align 2, 0
_08057974: .4byte gUnknown_3005030
_08057978: .4byte gUnknown_3000E80
_0805797C:
	adds r1, 0x1
	cmp r1, r2
	blt _08057966
_08057982:
	movs r0, 0x1
_08057984:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8057954

	thumb_func_start sub_805798C
sub_805798C: @ 805798C
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080579AC @ =gUnknown_3005030
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _080579BA
	ldr r4, _080579B0 @ =gUnknown_3000E80
_0805799E:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080579B4
	movs r0, 0x1
	b _080579BC
	.align 2, 0
_080579AC: .4byte gUnknown_3005030
_080579B0: .4byte gUnknown_3000E80
_080579B4:
	adds r1, 0x1
	cmp r1, r2
	blt _0805799E
_080579BA:
	movs r0, 0
_080579BC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805798C

	thumb_func_start sub_80579C4
sub_80579C4: @ 80579C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r6, r2, 0
	mov r9, r3
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r0, _08057A14 @ =gUnknown_3000E80
	adds r5, r7, r0
	ldrb r0, [r5]
	cmp r0, 0x80
	beq _080579E4
	b _08057B5E
_080579E4:
	adds r0, r6, 0
	bl sub_805801C
	adds r4, r0, 0
	cmp r4, 0
	beq _08057A1C
	bl sub_805812C
	mov r1, r9
	strh r0, [r1]
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _08057A04
	b _08057BD2
_08057A04:
	ldr r0, _08057A18 @ =sub_8057DA4
	bl c1_link_related_func_set
	adds r0, r4, 0
	bl sub_80581DC
	b _08057BD2
	.align 2, 0
_08057A14: .4byte gUnknown_3000E80
_08057A18: .4byte sub_8057DA4
_08057A1C:
	movs r0, 0x83
	bl sub_805798C
	cmp r0, 0x1
	bne _08057A44
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _08057A32
	b _08057BD2
_08057A32:
	ldr r0, _08057A40 @ =sub_8057DA4
	bl c1_link_related_func_set
	bl sub_8058230
	b _08057BD2
	.align 2, 0
_08057A40: .4byte sub_8057DA4
_08057A44:
	mov r0, r8
	subs r0, 0x12
	cmp r0, 0xA
	bls _08057A4E
	b _08057B5E
_08057A4E:
	lsls r0, 2
	ldr r1, _08057A58 @ =_08057A5C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057A58: .4byte _08057A5C
	.align 2, 0
_08057A5C:
	.4byte _08057AB4
	.4byte _08057B5E
	.4byte _08057B5E
	.4byte _08057B5E
	.4byte _08057B5E
	.4byte _08057B5E
	.4byte _08057A88
	.4byte _08057AE0
	.4byte _08057B5E
	.4byte _08057B10
	.4byte _08057B3C
_08057A88:
	adds r0, r6, 0
	bl sub_8058004
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057AAC @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057AB0 @ =sub_8057DA4
	bl c1_link_related_func_set
	bl sub_80581C8
	b _08057B5E
	.align 2, 0
_08057AAC: .4byte gUnknown_3000E80
_08057AB0: .4byte sub_8057DA4
_08057AB4:
	adds r0, r6, 0
	bl sub_8058034
	cmp r0, 0x1
	bne _08057B5E
	ldr r0, _08057AD8 @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057ADC @ =sub_8057DA4
	bl c1_link_related_func_set
	bl sub_80581F8
	b _08057B5E
	.align 2, 0
_08057AD8: .4byte gUnknown_3000E80
_08057ADC: .4byte sub_8057DA4
_08057AE0:
	adds r0, r6, 0
	bl sub_8058060
	adds r4, r0, 0
	cmp r4, 0
	beq _08057B5E
	ldr r0, _08057B08 @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057B0C @ =sub_8057DA4
	bl c1_link_related_func_set
	adds r0, r4, 0
	bl sub_8058214
	b _08057B5E
	.align 2, 0
_08057B08: .4byte gUnknown_3000E80
_08057B0C: .4byte sub_8057DA4
_08057B10:
	adds r0, r6, 0
	bl sub_8057FEC
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057B34 @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057B38 @ =sub_8057DC8
	bl c1_link_related_func_set
	bl sub_80581BC
	b _08057B5E
	.align 2, 0
_08057B34: .4byte gUnknown_3000E80
_08057B38: .4byte sub_8057DC8
_08057B3C:
	adds r0, r6, 0
	bl sub_8057FEC
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057B70 @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08057B5E
	ldr r0, _08057B74 @ =sub_8057DEC
	bl c1_link_related_func_set
	bl sub_80581BC
_08057B5E:
	mov r0, r8
	cmp r0, 0x17
	beq _08057B84
	cmp r0, 0x17
	bgt _08057B78
	cmp r0, 0x16
	beq _08057B94
	b _08057BD2
	.align 2, 0
_08057B70: .4byte gUnknown_3000E80
_08057B74: .4byte sub_8057DEC
_08057B78:
	mov r1, r8
	cmp r1, 0x1A
	beq _08057BA4
	cmp r1, 0x1D
	beq _08057BC4
	b _08057BD2
_08057B84:
	ldr r0, _08057B90 @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x83
	strb r1, [r0]
	b _08057BD2
	.align 2, 0
_08057B90: .4byte gUnknown_3000E80
_08057B94:
	ldr r0, _08057BA0 @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x82
	strb r1, [r0]
	b _08057BD2
	.align 2, 0
_08057BA0: .4byte gUnknown_3000E80
_08057BA4:
	ldr r0, _08057BBC @ =gUnknown_3000E80
	adds r0, r7, r0
	movs r1, 0x80
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08057BD2
	ldr r0, _08057BC0 @ =sub_8057D5C
	bl c1_link_related_func_set
	b _08057BD2
	.align 2, 0
_08057BBC: .4byte gUnknown_3000E80
_08057BC0: .4byte sub_8057D5C
_08057BC4:
	ldr r0, _08057BE0 @ =gUnknown_3000E80
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, 0x82
	bne _08057BD2
	movs r0, 0x81
	strb r0, [r1]
_08057BD2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057BE0: .4byte gUnknown_3000E80
	thumb_func_end sub_80579C4

	thumb_func_start sub_8057BE4
sub_8057BE4: @ 8057BE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r8, r1
	movs r6, 0
	add r5, sp, 0x10
	mov r9, r5
	adds r7, r0, 0
_08057BF8:
	ldrb r4, [r7]
	movs r0, 0
	strh r0, [r5]
	adds r0, r6, 0
	mov r1, r8
	mov r2, sp
	bl sub_8057F84
	adds r0, r6, 0
	adds r1, r4, 0
	mov r2, sp
	adds r3, r5, 0
	bl sub_80579C4
	ldr r0, _08057C48 @ =gUnknown_3000E80
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	bne _08057C28
	adds r0, r4, 0
	bl sub_8057D14
	mov r1, r9
	strh r0, [r1]
_08057C28:
	lsls r0, r6, 24
	lsrs r0, 24
	ldrb r1, [r5]
	bl sub_8058618
	adds r7, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08057BF8
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057C48: .4byte gUnknown_3000E80
	thumb_func_end sub_8057BE4

	thumb_func_start sub_8057C4C
sub_8057C4C: @ 8057C4C
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _08057C64 @ =0xffef0000
	adds r0, r1
	lsrs r0, 16
	cmp r0, 0xC
	bhi _08057C6C
	ldr r0, _08057C68 @ =gUnknown_3005028
	strh r4, [r0]
	b _08057C72
	.align 2, 0
_08057C64: .4byte 0xffef0000
_08057C68: .4byte gUnknown_3005028
_08057C6C:
	ldr r1, _08057CB0 @ =gUnknown_3005028
	movs r0, 0x11
	strh r0, [r1]
_08057C72:
	ldr r0, _08057CB4 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08057CA8
	bl sub_805833C
	cmp r0, 0x1
	bls _08057CA8
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _08057CA8
	bl sub_800A00C
	cmp r0, 0x1
	bne _08057CA8
	cmp r4, 0x11
	blt _08057CA8
	cmp r4, 0x15
	ble _08057CA2
	cmp r4, 0x19
	bgt _08057CA8
	cmp r4, 0x18
	blt _08057CA8
_08057CA2:
	ldr r1, _08057CB0 @ =gUnknown_3005028
	movs r0, 0
	strh r0, [r1]
_08057CA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057CB0: .4byte gUnknown_3005028
_08057CB4: .4byte gWirelessCommType
	thumb_func_end sub_8057C4C

	thumb_func_start sub_8057CB8
sub_8057CB8: @ 8057CB8
	push {lr}
	ldr r2, _08057CCC @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08057CD0
	movs r0, 0x13
	b _08057D10
	.align 2, 0
_08057CCC: .4byte gMain
_08057CD0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08057CDC
	movs r0, 0x12
	b _08057D10
_08057CDC:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08057CE8
	movs r0, 0x14
	b _08057D10
_08057CE8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08057CF4
	movs r0, 0x15
	b _08057D10
_08057CF4:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08057D02
	movs r0, 0x18
	b _08057D10
_08057D02:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08057D0E
	movs r0, 0x11
	b _08057D10
_08057D0E:
	movs r0, 0x19
_08057D10:
	pop {r1}
	bx r1
	thumb_func_end sub_8057CB8

	thumb_func_start sub_8057D14
sub_8057D14: @ 8057D14
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x13
	beq _08057D3A
	cmp r0, 0x13
	bgt _08057D2A
	cmp r0, 0x12
	beq _08057D3E
	b _08057D42
_08057D2A:
	cmp r1, 0x14
	beq _08057D36
	cmp r1, 0x15
	bne _08057D42
	movs r0, 0x4
	b _08057D44
_08057D36:
	movs r0, 0x3
	b _08057D44
_08057D3A:
	movs r0, 0x1
	b _08057D44
_08057D3E:
	movs r0, 0x2
	b _08057D44
_08057D42:
	movs r0, 0
_08057D44:
	pop {r1}
	bx r1
	thumb_func_end sub_8057D14

	thumb_func_start sub_8057D48
sub_8057D48: @ 8057D48
	push {lr}
	movs r2, 0x11
	adds r1, r0, 0x6
_08057D4E:
	strh r2, [r1]
	subs r1, 0x2
	cmp r1, r0
	bge _08057D4E
	pop {r0}
	bx r0
	thumb_func_end sub_8057D48

	thumb_func_start sub_8057D5C
sub_8057D5C: @ 8057D5C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08057D70
	movs r0, 0x11
	b _08057D92
_08057D70:
	bl sub_800B248
	cmp r0, 0x4
	bls _08057D7C
	movs r0, 0x1B
	b _08057D92
_08057D7C:
	bl sub_805833C
	cmp r0, 0x4
	bls _08057D88
	movs r0, 0x1C
	b _08057D92
_08057D88:
	adds r0, r4, 0
	bl sub_8057CB8
	lsls r0, 16
	lsrs r0, 16
_08057D92:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8057D5C

	thumb_func_start sub_8057D98
sub_8057D98: @ 8057D98
	push {lr}
	bl sub_8057910
	movs r0, 0x11
	pop {r1}
	bx r1
	thumb_func_end sub_8057D98

	thumb_func_start sub_8057DA4
sub_8057DA4: @ 8057DA4
	push {r4,lr}
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x11
	cmp r0, 0x1
	beq _08057DBC
	movs r4, 0x1A
	ldr r0, _08057DC4 @ =sub_8057D98
	bl c1_link_related_func_set
_08057DBC:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08057DC4: .4byte sub_8057D98
	thumb_func_end sub_8057DA4

	thumb_func_start sub_8057DC8
sub_8057DC8: @ 8057DC8
	push {r4,lr}
	bl sub_800B248
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08057DE0
	movs r4, 0x1A
	bl ScriptContext2_Disable
	ldr r0, _08057DE8 @ =sub_8057D98
	bl c1_link_related_func_set
_08057DE0:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08057DE8: .4byte sub_8057D98
	thumb_func_end sub_8057DC8

	thumb_func_start sub_8057DEC
sub_8057DEC: @ 8057DEC
	push {r4,lr}
	bl sub_805833C
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08057E04
	movs r4, 0x1A
	bl ScriptContext2_Disable
	ldr r0, _08057E0C @ =sub_8057D98
	bl c1_link_related_func_set
_08057E04:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08057E0C: .4byte sub_8057D98
	thumb_func_end sub_8057DEC

	thumb_func_start sub_8057E10
sub_8057E10: @ 8057E10
	push {lr}
	bl sub_8057910
	movs r0, 0x11
	pop {r1}
	bx r1
	thumb_func_end sub_8057E10

	thumb_func_start sub_8057E1C
sub_8057E1C: @ 8057E1C
	push {lr}
	ldr r1, _08057E40 @ =gUnknown_3000E80
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	bne _08057E4C
	ldr r0, _08057E44 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08057E50
	ldr r0, _08057E48 @ =sub_8057E10
	bl c1_link_related_func_set
	movs r0, 0x1D
	b _08057E52
	.align 2, 0
_08057E40: .4byte gUnknown_3000E80
_08057E44: .4byte gMain
_08057E48: .4byte sub_8057E10
_08057E4C:
	bl sub_8057910
_08057E50:
	movs r0, 0x11
_08057E52:
	pop {r1}
	bx r1
	thumb_func_end sub_8057E1C

	thumb_func_start sub_8057E58
sub_8057E58: @ 8057E58
	push {lr}
	ldr r0, _08057E68 @ =sub_8057E1C
	bl c1_link_related_func_set
	movs r0, 0x16
	pop {r1}
	bx r1
	.align 2, 0
_08057E68: .4byte sub_8057E1C
	thumb_func_end sub_8057E58

	thumb_func_start sub_8057E6C
sub_8057E6C: @ 8057E6C
	movs r0, 0x11
	bx lr
	thumb_func_end sub_8057E6C

	thumb_func_start sub_8057E70
sub_8057E70: @ 8057E70
	push {lr}
	ldr r1, _08057E9C @ =gUnknown_3000E80
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x83
	beq _08057E80
	bl sub_8057910
_08057E80:
	movs r0, 0x83
	bl sub_8057954
	cmp r0, 0x1
	bne _08057E96
	ldr r0, _08057EA0 @ =gUnknown_81BB9FC
	bl ScriptContext1_SetupScript
	ldr r0, _08057EA4 @ =sub_8057E6C
	bl c1_link_related_func_set
_08057E96:
	movs r0, 0x11
	pop {r1}
	bx r1
	.align 2, 0
_08057E9C: .4byte gUnknown_3000E80
_08057EA0: .4byte gUnknown_81BB9FC
_08057EA4: .4byte sub_8057E6C
	thumb_func_end sub_8057E70

	thumb_func_start sub_8057EA8
sub_8057EA8: @ 8057EA8
	push {lr}
	ldr r0, _08057EB8 @ =sub_8057E70
	bl c1_link_related_func_set
	movs r0, 0x17
	pop {r1}
	bx r1
	.align 2, 0
_08057EB8: .4byte sub_8057E70
	thumb_func_end sub_8057EA8

	thumb_func_start sub_8057EBC
sub_8057EBC: @ 8057EBC
	movs r0, 0x11
	bx lr
	thumb_func_end sub_8057EBC

	thumb_func_start sub_8057EC0
sub_8057EC0: @ 8057EC0
	push {lr}
	movs r0, 0x83
	bl sub_805798C
	cmp r0, 0x1
	beq _08057EFC
	ldr r0, _08057F00 @ =gUnknown_3000E84
	ldr r2, [r0]
	ldr r1, _08057F04 @ =sub_8057E1C
	adds r3, r0, 0
	cmp r2, r1
	bne _08057EE6
	ldr r1, _08057F08 @ =gUnknown_3000E80
	ldr r0, _08057F0C @ =gUnknown_300502C
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	bne _08057F1E
_08057EE6:
	ldr r1, [r3]
	ldr r0, _08057F10 @ =sub_8057E10
	cmp r1, r0
	bne _08057F14
	ldr r1, _08057F08 @ =gUnknown_3000E80
	ldr r0, _08057F0C @ =gUnknown_300502C
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x81
	bne _08057F14
_08057EFC:
	movs r0, 0x2
	b _08057F24
	.align 2, 0
_08057F00: .4byte gUnknown_3000E84
_08057F04: .4byte sub_8057E1C
_08057F08: .4byte gUnknown_3000E80
_08057F0C: .4byte gUnknown_300502C
_08057F10: .4byte sub_8057E10
_08057F14:
	movs r0, 0x82
	bl sub_8057954
	cmp r0, 0
	bne _08057F22
_08057F1E:
	movs r0, 0
	b _08057F24
_08057F22:
	movs r0, 0x1
_08057F24:
	pop {r1}
	bx r1
	thumb_func_end sub_8057EC0

	thumb_func_start sub_8057F28
sub_8057F28: @ 8057F28
	push {lr}
	movs r0, 0x83
	bl sub_805798C
	pop {r1}
	bx r1
	thumb_func_end sub_8057F28

	thumb_func_start sub_8057F34
sub_8057F34: @ 8057F34
	push {lr}
	ldr r0, _08057F44 @ =sub_8057E58
	bl c1_link_related_func_set
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08057F44: .4byte sub_8057E58
	thumb_func_end sub_8057F34

	thumb_func_start sub_8057F48
sub_8057F48: @ 8057F48
	push {lr}
	ldr r0, _08057F58 @ =sub_8057DA4
	bl c1_link_related_func_set
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08057F58: .4byte sub_8057DA4
	thumb_func_end sub_8057F48

	thumb_func_start sub_8057F5C
sub_8057F5C: @ 8057F5C
	push {lr}
	ldr r0, _08057F6C @ =sub_8057EA8
	bl c1_link_related_func_set
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08057F6C: .4byte sub_8057EA8
	thumb_func_end sub_8057F5C

	thumb_func_start sub_8057F70
sub_8057F70: @ 8057F70
	push {lr}
	ldr r0, _08057F80 @ =sub_8057EBC
	bl c1_link_related_func_set
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08057F80: .4byte sub_8057EBC
	thumb_func_end sub_8057F70

	thumb_func_start sub_8057F84
sub_8057F84: @ 8057F84
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	strb r4, [r6]
	movs r0, 0
	cmp r4, r1
	bne _08057F96
	movs r0, 0x1
_08057F96:
	strb r0, [r6, 0x1]
	ldr r1, _08057FE8 @ =gUnknown_2031DEC
	lsls r0, r4, 2
	adds r0, r1
	ldrb r0, [r0, 0x3]
	strb r0, [r6, 0x2]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_805854C
	strb r0, [r6, 0x3]
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	bl sub_8058524
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	ldrh r0, [r5]
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	bl sub_805856C
	strb r0, [r6, 0x8]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	strh r0, [r6, 0xC]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057FE8: .4byte gUnknown_2031DEC
	thumb_func_end sub_8057F84

	thumb_func_start sub_8057FEC
sub_8057FEC: @ 8057FEC
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _08057FF8
	cmp r0, 0
	bne _08057FFC
_08057FF8:
	movs r0, 0x1
	b _08057FFE
_08057FFC:
	movs r0, 0
_08057FFE:
	pop {r1}
	bx r1
	thumb_func_end sub_8057FEC

	thumb_func_start sub_8058004
sub_8058004: @ 8058004
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _08058010
	cmp r0, 0
	bne _08058014
_08058010:
	movs r0, 0x1
	b _08058016
_08058014:
	movs r0, 0
_08058016:
	pop {r1}
	bx r1
	thumb_func_end sub_8058004

	thumb_func_start sub_805801C
sub_805801C: @ 805801C
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1, 0x2]
	cmp r0, 0x2
	bne _0805802E
	adds r0, r1, 0x4
	bl sub_806DEC4
	b _08058030
_0805802E:
	movs r0, 0
_08058030:
	pop {r1}
	bx r1
	thumb_func_end sub_805801C

	thumb_func_start sub_8058034
sub_8058034: @ 8058034
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _08058042
	cmp r0, 0
	bne _08058058
_08058042:
	ldrb r0, [r4, 0xC]
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	cmp r0, 0
	beq _08058058
	ldrb r0, [r4, 0x3]
	cmp r0, 0x1
	bne _08058058
	movs r0, 0x1
	b _0805805A
_08058058:
	movs r0, 0
_0805805A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8058034

	thumb_func_start sub_8058060
sub_8058060: @ 8058060
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _08058074
	cmp r0, 0x2
	beq _08058074
	movs r0, 0
	b _08058122
_08058074:
	ldr r0, [r4, 0x4]
	ldr r1, [r4, 0x8]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r3, _080580E4 @ =gDirectionToVectors
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	adds r0, r3
	ldr r0, [r0]
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080580E8 @ =0xffff0000
	ldr r2, [sp]
	ands r2, r1
	orrs r2, r0
	str r2, [sp]
	asrs r1, r2, 16
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	adds r3, 0x4
	adds r0, r3
	ldr r0, [r0]
	adds r0, r1
	lsls r0, 16
	ldr r1, _080580EC @ =0x0000ffff
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r2, _080580F0 @ =0xffffff00
	ldr r0, [sp, 0x4]
	ands r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	asrs r1, 16
	bl GetLinkPlayerIdAt
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0x4
	beq _08058118
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _080580E0
	ldr r0, _080580F4 @ =gUnknown_3000E80
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	beq _080580FC
_080580E0:
	ldr r0, _080580F8 @ =gUnknown_81BB9A3
	b _08058122
	.align 2, 0
_080580E4: .4byte gDirectionToVectors
_080580E8: .4byte 0xffff0000
_080580EC: .4byte 0x0000ffff
_080580F0: .4byte 0xffffff00
_080580F4: .4byte gUnknown_3000E80
_080580F8: .4byte gUnknown_81BB9A3
_080580FC:
	adds r0, r2, 0
	bl sub_8081A34
	cmp r0, 0
	bne _08058110
	ldr r0, _0805810C @ =gUnknown_81BB981
	b _08058122
	.align 2, 0
_0805810C: .4byte gUnknown_81BB981
_08058110:
	ldr r0, _08058114 @ =gUnknown_81BB992
	b _08058122
	.align 2, 0
_08058114: .4byte gUnknown_81BB992
_08058118:
	ldrb r1, [r4, 0xC]
	ldrb r2, [r4, 0x3]
	mov r0, sp
	bl sub_806CF38
_08058122:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8058060

	thumb_func_start sub_805812C
sub_805812C: @ 805812C
	push {lr}
	adds r1, r0, 0
	ldr r0, _08058178 @ =gUnknown_81BB8DB
	cmp r1, r0
	beq _08058172
	ldr r0, _0805817C @ =gUnknown_81BB8F8
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058180 @ =gUnknown_81BB915
	cmp r1, r0
	beq _08058172
	ldr r0, _08058184 @ =gUnknown_81BB932
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058188 @ =gUnknown_81BB980
	cmp r1, r0
	beq _08058172
	ldr r0, _0805818C @ =gUnknown_81BB980
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058190 @ =gUnknown_81BB980
	cmp r1, r0
	beq _08058172
	ldr r0, _08058194 @ =gUnknown_81BB980
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058198 @ =gUnknown_81BB8C3
	cmp r1, r0
	beq _08058172
	ldr r0, _0805819C @ =gUnknown_81BB8CF
	cmp r1, r0
	beq _080581B4
	ldr r0, _080581A0 @ =gUnknown_81BB950
	cmp r1, r0
	bne _080581A4
_08058172:
	movs r0, 0xA
	b _080581B6
	.align 2, 0
_08058178: .4byte gUnknown_81BB8DB
_0805817C: .4byte gUnknown_81BB8F8
_08058180: .4byte gUnknown_81BB915
_08058184: .4byte gUnknown_81BB932
_08058188: .4byte gUnknown_81BB980
_0805818C: .4byte gUnknown_81BB980
_08058190: .4byte gUnknown_81BB980
_08058194: .4byte gUnknown_81BB980
_08058198: .4byte gUnknown_81BB8C3
_0805819C: .4byte gUnknown_81BB8CF
_080581A0: .4byte gUnknown_81BB950
_080581A4:
	ldr r0, _080581B0 @ =gUnknown_81BB95C
	cmp r1, r0
	beq _080581B4
	movs r0, 0
	b _080581B6
	.align 2, 0
_080581B0: .4byte gUnknown_81BB95C
_080581B4:
	movs r0, 0x9
_080581B6:
	pop {r1}
	bx r1
	thumb_func_end sub_805812C

	thumb_func_start sub_80581BC
sub_80581BC: @ 80581BC
	push {lr}
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_80581BC

	thumb_func_start sub_80581C8
sub_80581C8: @ 80581C8
	push {lr}
	movs r0, 0x6
	bl PlaySE
	bl ShowStartMenu
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_80581C8

	thumb_func_start sub_80581DC
sub_80581DC: @ 80581DC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80581DC

	thumb_func_start sub_80581F8
sub_80581F8: @ 80581F8
	push {lr}
	movs r0, 0x6
	bl PlaySE
	ldr r0, _08058210 @ =gUnknown_81BB9D4
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08058210: .4byte gUnknown_81BB9D4
	thumb_func_end sub_80581F8

	thumb_func_start sub_8058214
sub_8058214: @ 8058214
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8058214

	thumb_func_start sub_8058230
sub_8058230: @ 8058230
	push {lr}
	ldr r0, _08058240 @ =gUnknown_81BB9F0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08058240: .4byte gUnknown_81BB9F0
	thumb_func_end sub_8058230

	thumb_func_start sub_8058244
sub_8058244: @ 8058244
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0
	bne _08058252
	movs r0, 0
	b _0805826C
_08058252:
	bl sub_800B248
	cmp r0, 0x2
	bls _08058264
	ldr r1, _08058260 @ =gUnknown_3000E88
	movs r0, 0x1
	b _08058268
	.align 2, 0
_08058260: .4byte gUnknown_3000E88
_08058264:
	ldr r1, _08058270 @ =gUnknown_3000E88
	movs r0, 0
_08058268:
	strb r0, [r1]
	ldrb r0, [r1]
_0805826C:
	pop {r1}
	bx r1
	.align 2, 0
_08058270: .4byte gUnknown_3000E88
	thumb_func_end sub_8058244

	thumb_func_start sub_8058274
sub_8058274: @ 8058274
	push {lr}
	bl sub_800B248
	cmp r0, 0x1
	bls _080582D8
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _080582D8
	bl sub_800A00C
	cmp r0, 0x1
	bne _080582D8
	ldr r0, _080582C4 @ =gUnknown_3000E84
	ldr r1, [r0]
	ldr r0, _080582C8 @ =sub_8057DC8
	cmp r1, r0
	beq _080582C0
	ldr r0, _080582CC @ =sub_8057DA4
	cmp r1, r0
	bne _080582D8
	ldr r0, _080582D0 @ =gUnknown_3000E88
	ldrb r2, [r0]
	movs r1, 0
	strb r1, [r0]
	cmp r2, 0x1
	beq _080582C0
	ldr r2, _080582D4 @ =gPaletteFade
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080582D8
	ldrb r1, [r2, 0xA]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080582D8
_080582C0:
	movs r0, 0x1
	b _080582DA
	.align 2, 0
_080582C4: .4byte gUnknown_3000E84
_080582C8: .4byte sub_8057DC8
_080582CC: .4byte sub_8057DA4
_080582D0: .4byte gUnknown_3000E88
_080582D4: .4byte gPaletteFade
_080582D8:
	movs r0, 0
_080582DA:
	pop {r1}
	bx r1
	thumb_func_end sub_8058274

	thumb_func_start sub_80582E0
sub_80582E0: @ 80582E0
	push {lr}
	bl sub_805833C
	cmp r0, 0x1
	bls _08058304
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _08058304
	bl sub_800A00C
	cmp r0, 0x1
	bne _08058304
	ldr r0, _08058308 @ =gUnknown_3000E84
	ldr r1, [r0]
	ldr r0, _0805830C @ =sub_8057DEC
	cmp r1, r0
	beq _08058310
_08058304:
	movs r0, 0
	b _08058312
	.align 2, 0
_08058308: .4byte gUnknown_3000E84
_0805830C: .4byte sub_8057DEC
_08058310:
	movs r0, 0x1
_08058312:
	pop {r1}
	bx r1
	thumb_func_end sub_80582E0

	thumb_func_start sub_8058318
sub_8058318: @ 8058318
	push {lr}
	ldr r0, _08058330 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _08058334
	bl sub_800A00C
	cmp r0, 0
	beq _08058334
	movs r0, 0x1
	b _08058336
	.align 2, 0
_08058330: .4byte gWirelessCommType
_08058334:
	movs r0, 0
_08058336:
	pop {r1}
	bx r1
	thumb_func_end sub_8058318

	thumb_func_start sub_805833C
sub_805833C: @ 805833C
	push {lr}
	ldr r0, _08058350 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805835C
	ldr r0, _08058354 @ =gUnknown_3003FB0
	ldr r1, _08058358 @ =0x00000339
	adds r0, r1
	ldrb r0, [r0]
	b _08058364
	.align 2, 0
_08058350: .4byte gWirelessCommType
_08058354: .4byte gUnknown_3003FB0
_08058358: .4byte 0x00000339
_0805835C:
	ldr r0, _08058368 @ =gUnknown_3005450
	ldr r1, _0805836C @ =0x000008d2
	adds r0, r1
	ldrb r0, [r0]
_08058364:
	pop {r1}
	bx r1
	.align 2, 0
_08058368: .4byte gUnknown_3005450
_0805836C: .4byte 0x000008d2
	thumb_func_end sub_805833C

	thumb_func_start ZeroLinkPlayerMapObject
ZeroLinkPlayerMapObject: @ 8058370
	movs r1, 0
	str r1, [r0]
	bx lr
	thumb_func_end ZeroLinkPlayerMapObject

	thumb_func_start strange_npc_table_clear
strange_npc_table_clear: @ 8058378
	push {lr}
	ldr r0, _08058388 @ =gUnknown_2031DEC
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08058388: .4byte gUnknown_2031DEC
	thumb_func_end strange_npc_table_clear

	thumb_func_start ZeroMapObject
ZeroMapObject: @ 805838C
	push {lr}
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	thumb_func_end ZeroMapObject

	thumb_func_start SpawnLinkPlayerMapObject
SpawnLinkPlayerMapObject: @ 805839C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r1
	mov r10, r2
	mov r8, r3
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	bl sub_805DF30
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, r7, 2
	ldr r0, _08058440 @ =gUnknown_2031DEC
	adds r4, r0
	lsls r5, r6, 3
	adds r5, r6
	lsls r5, 2
	ldr r0, _08058444 @ =gMapObjects
	adds r5, r0
	adds r0, r4, 0
	bl ZeroLinkPlayerMapObject
	adds r0, r5, 0
	bl ZeroMapObject
	movs r2, 0
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r4]
	strb r7, [r4, 0x1]
	strb r6, [r4, 0x2]
	strb r2, [r4, 0x3]
	ldrb r0, [r5]
	orrs r0, r1
	mov r2, r8
	ands r2, r1
	lsls r2, 1
	movs r1, 0x3
	negs r1, r1
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x19]
	movs r0, 0x40
	strb r0, [r5, 0x4]
	mov r0, r9
	lsls r0, 16
	asrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	asrs r1, 16
	mov r10, r1
	adds r0, r5, 0
	mov r1, r9
	mov r2, r10
	bl InitLinkPlayerMapObjectPos
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058440: .4byte gUnknown_2031DEC
_08058444: .4byte gMapObjects
	thumb_func_end SpawnLinkPlayerMapObject

	thumb_func_start InitLinkPlayerMapObjectPos
InitLinkPlayerMapObjectPos: @ 8058448
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0xC
	adds r3, r4, 0
	adds r3, 0xE
	bl sub_8063B1C
	ldrh r0, [r4, 0xC]
	adds r0, 0x8
	strh r0, [r4, 0xC]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoord
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end InitLinkPlayerMapObjectPos

	thumb_func_start sub_8058488
sub_8058488: @ 8058488
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _080584B0 @ =gUnknown_2031DEC
	lsrs r0, 22
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _080584AA
	ldrb r0, [r1, 0x2]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080584B4 @ =gMapObjects
	adds r1, r0
	strb r2, [r1, 0x19]
_080584AA:
	pop {r0}
	bx r0
	.align 2, 0
_080584B0: .4byte gUnknown_2031DEC
_080584B4: .4byte gMapObjects
	thumb_func_end sub_8058488

	thumb_func_start sub_80584B8
sub_80584B8: @ 80584B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _080584F8 @ =gUnknown_2031DEC
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080584FC @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0x40
	beq _080584E4
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058500 @ =gSprites
	adds r0, r1
	bl DestroySprite
_080584E4:
	movs r0, 0
	strb r0, [r5]
	ldrb r1, [r4]
	subs r0, 0x2
	ands r0, r1
	strb r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080584F8: .4byte gUnknown_2031DEC
_080584FC: .4byte gMapObjects
_08058500: .4byte gSprites
	thumb_func_end sub_80584B8

	thumb_func_start sub_8058504
sub_8058504: @ 8058504
	lsls r0, 24
	ldr r1, _0805851C @ =gUnknown_2031DEC
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058520 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_0805851C: .4byte gUnknown_2031DEC
_08058520: .4byte gMapObjects
	thumb_func_end sub_8058504

	thumb_func_start sub_8058524
sub_8058524: @ 8058524
	lsls r0, 24
	ldr r3, _08058544 @ =gUnknown_2031DEC
	lsrs r0, 22
	adds r0, r3
	ldrb r3, [r0, 0x2]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _08058548 @ =gMapObjects
	adds r0, r3
	ldrh r3, [r0, 0x10]
	strh r3, [r1]
	ldrh r0, [r0, 0x12]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08058544: .4byte gUnknown_2031DEC
_08058548: .4byte gMapObjects
	thumb_func_end sub_8058524

	thumb_func_start sub_805854C
sub_805854C: @ 805854C
	lsls r0, 24
	ldr r1, _08058564 @ =gUnknown_2031DEC
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058568 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x19]
	bx lr
	.align 2, 0
_08058564: .4byte gUnknown_2031DEC
_08058568: .4byte gMapObjects
	thumb_func_end sub_805854C

	thumb_func_start sub_805856C
sub_805856C: @ 805856C
	lsls r0, 24
	ldr r1, _08058588 @ =gUnknown_2031DEC
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805858C @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0xB]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08058588: .4byte gUnknown_2031DEC
_0805858C: .4byte gMapObjects
	thumb_func_end sub_805856C

	thumb_func_start sub_8058590
sub_8058590: @ 8058590
	lsls r0, 24
	ldr r1, _080585B0 @ =gUnknown_2031DEC
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080585B4 @ =gMapObjects
	adds r0, r1
	adds r0, 0x21
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x10
	subs r0, r1
	bx lr
	.align 2, 0
_080585B0: .4byte gUnknown_2031DEC
_080585B4: .4byte gMapObjects
	thumb_func_end sub_8058590

	thumb_func_start GetLinkPlayerIdAt
GetLinkPlayerIdAt: @ 80585B8
	push {r4-r6,lr}
	movs r2, 0
	ldr r5, _080585FC @ =gUnknown_2031DEC
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r3, r1, 16
_080585C6:
	lsls r0, r2, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	beq _08058604
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _080585DA
	cmp r0, 0x2
	bne _08058604
_080585DA:
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058600 @ =gMapObjects
	adds r1, r0, r1
	movs r6, 0x10
	ldrsh r0, [r1, r6]
	cmp r0, r4
	bne _08058604
	movs r6, 0x12
	ldrsh r0, [r1, r6]
	cmp r0, r3
	bne _08058604
	adds r0, r2, 0
	b _08058610
	.align 2, 0
_080585FC: .4byte gUnknown_2031DEC
_08058600: .4byte gMapObjects
_08058604:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080585C6
	movs r0, 0x4
_08058610:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLinkPlayerIdAt

	thumb_func_start sub_8058618
sub_8058618: @ 8058618
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	adds r2, r3, 0
	lsrs r0, 22
	ldr r1, _08058648 @ =gUnknown_2031DEC
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805864C @ =gMapObjects
	adds r6, r0, r1
	ldrb r0, [r5]
	cmp r0, 0
	beq _08058674
	cmp r3, 0xA
	bls _08058650
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	b _08058674
	.align 2, 0
_08058648: .4byte gUnknown_2031DEC
_0805864C: .4byte gMapObjects
_08058650:
	ldr r4, _0805867C @ =gUnknown_826D374
	ldr r1, _08058680 @ =gUnknown_826D33C
	ldrb r0, [r5, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r2, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl _call_via_r2
_08058674:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805867C: .4byte gUnknown_826D374
_08058680: .4byte gUnknown_826D33C
	thumb_func_end sub_8058618

	thumb_func_start sub_8058684
sub_8058684: @ 8058684
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _080586A0 @ =gUnknown_826D348
	lsls r3, r2, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080586A0: .4byte gUnknown_826D348
	thumb_func_end sub_8058684

	thumb_func_start sub_80586A4
sub_80586A4: @ 80586A4
	movs r0, 0x1
	bx lr
	thumb_func_end sub_80586A4

	thumb_func_start sub_80586A8
sub_80586A8: @ 80586A8
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _080586C4 @ =gUnknown_826D348
	lsls r3, r2, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080586C4: .4byte gUnknown_826D348
	thumb_func_end sub_80586A8

	thumb_func_start sub_80586C8
sub_80586C8: @ 80586C8
	movs r0, 0
	bx lr
	thumb_func_end sub_80586C8

	thumb_func_start sub_80586CC
sub_80586CC: @ 80586CC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x19]
	bl npc_something3
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x19]
	mov r6, sp
	adds r6, 0x2
	adds r0, r5, 0
	mov r2, sp
	adds r3, r6, 0
	bl FieldObjectMoveDestCoords
	ldrb r0, [r4, 0x2]
	ldrb r1, [r5, 0x19]
	mov r2, sp
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r4, 0
	ldrsh r3, [r6, r4]
	bl npc_080587EC
	lsls r0, 24
	cmp r0, 0
	bne _0805872A
	adds r1, r5, 0
	adds r1, 0x21
	movs r0, 0x10
	strb r0, [r1]
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r3, 0
	ldrsh r2, [r6, r3]
	adds r0, r5, 0
	bl npc_coords_shift
	adds r0, r5, 0
	bl FieldObjectUpdateZCoord
	movs r0, 0x1
	b _0805872C
_0805872A:
	movs r0, 0
_0805872C:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80586CC

	thumb_func_start sub_8058734
sub_8058734: @ 8058734
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x19]
	bl npc_something3
	strb r0, [r4, 0x19]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8058734

	thumb_func_start sub_805874C
sub_805874C: @ 805874C
	movs r1, 0
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end sub_805874C

	thumb_func_start sub_8058754
sub_8058754: @ 8058754
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r4, 0
	adds r5, 0x21
	ldrb r0, [r5]
	subs r0, 0x1
	strb r0, [r5]
	movs r0, 0x1
	strb r0, [r6, 0x3]
	ldrb r0, [r4, 0x19]
	adds r1, 0xC
	adds r2, r4, 0
	adds r2, 0xE
	bl MoveCoords
	ldrb r0, [r5]
	cmp r0, 0
	bne _08058784
	adds r0, r4, 0
	bl npc_coords_shift_still
	movs r0, 0x2
	strb r0, [r6, 0x3]
_08058784:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8058754

	thumb_func_start npc_something3
npc_something3: @ 805878C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _080587E4
	lsls r0, 2
	ldr r1, _080587A8 @ =_080587AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080587A8: .4byte _080587AC
	.align 2, 0
_080587AC:
	.4byte _080587D4
	.4byte _080587D8
	.4byte _080587DC
	.4byte _080587E0
	.4byte _080587E4
	.4byte _080587E4
	.4byte _080587D4
	.4byte _080587D8
	.4byte _080587DC
	.4byte _080587E0
_080587D4:
	movs r0, 0x2
	b _080587E6
_080587D8:
	movs r0, 0x1
	b _080587E6
_080587DC:
	movs r0, 0x3
	b _080587E6
_080587E0:
	movs r0, 0x4
	b _080587E6
_080587E4:
	adds r0, r2, 0
_080587E6:
	pop {r1}
	bx r1
	thumb_func_end npc_something3

	thumb_func_start npc_080587EC
npc_080587EC: @ 80587EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	lsls r3, 16
	movs r4, 0
	ldr r0, _08058850 @ =gMapObjects
	mov r9, r0
	lsrs r2, r3, 16
	mov r10, r2
	asrs r6, r3, 16
_08058810:
	mov r7, r12
	lsls r3, r7, 16
	mov r0, r10
	lsls r5, r0, 16
	cmp r4, r8
	beq _08058854
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	mov r2, r9
	adds r1, r0, r2
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	asrs r2, r3, 16
	cmp r0, r2
	bne _08058838
	movs r7, 0x12
	ldrsh r0, [r1, r7]
	cmp r0, r6
	beq _0805884A
_08058838:
	movs r7, 0x14
	ldrsh r0, [r1, r7]
	cmp r0, r2
	bne _08058854
	movs r0, 0x16
	ldrsh r1, [r1, r0]
	asrs r0, r5, 16
	cmp r1, r0
	bne _08058854
_0805884A:
	movs r0, 0x1
	b _0805886A
	.align 2, 0
_08058850: .4byte gMapObjects
_08058854:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08058810
	asrs r0, r3, 16
	asrs r1, r5, 16
	bl MapGridIsImpassableAt
	lsls r0, 24
	lsrs r0, 24
_0805886A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end npc_080587EC

	thumb_func_start sub_8058878
sub_8058878: @ 8058878
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, r5, 2
	ldr r0, _080588B4 @ =gUnknown_2031DEC
	adds r2, r0
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080588B8 @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r2]
	cmp r0, 0
	beq _080588FC
	subs r0, r3, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080588BC
	ldrb r1, [r4]
	lsls r1, 30
	lsrs r1, 31
	movs r0, 0
	bl sub_805C7C8
	b _080588C6
	.align 2, 0
_080588B4: .4byte gUnknown_2031DEC
_080588B8: .4byte gMapObjects
_080588BC:
	ldrb r0, [r4]
	lsls r0, 30
	lsrs r0, 31
	bl sub_805C7F8
_080588C6:
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08058904 @ =SpriteCB_LinkPlayer
	movs r2, 0
	str r2, [sp]
	movs r3, 0
	bl AddPseudoFieldObject
	strb r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058908 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, 0x2E]
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_080588FC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058904: .4byte SpriteCB_LinkPlayer
_08058908: .4byte gSprites
	thumb_func_end sub_8058878

	thumb_func_start SpriteCB_LinkPlayer
SpriteCB_LinkPlayer: @ 805890C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 2
	ldr r0, _08058970 @ =gUnknown_2031DEC
	adds r4, r0
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058974 @ =gMapObjects
	adds r6, r0, r1
	ldrh r0, [r6, 0xC]
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0xE]
	strh r0, [r5, 0x22]
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	adds r1, r5, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	bl ZCoordToPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	ldrb r0, [r4, 0x3]
	cmp r0, 0
	bne _08058978
	ldrb r0, [r6, 0x19]
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	b _0805898A
	.align 2, 0
_08058970: .4byte gUnknown_2031DEC
_08058974: .4byte gMapObjects
_08058978:
	ldrb r0, [r6, 0x19]
	bl get_go_image_anim_num
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
_0805898A:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8068EB4
	ldrb r0, [r6]
	lsls r0, 29
	cmp r0, 0
	bge _080589BC
	ldrh r0, [r5, 0x3C]
	movs r1, 0x4
	ands r1, r0
	lsls r1, 16
	adds r3, r5, 0
	adds r3, 0x3E
	lsrs r1, 18
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_080589BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_LinkPlayer

	.align 2, 0 @ Don't pad with nop.
