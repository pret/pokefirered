	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start palette_bg_faded_fill_white
palette_bg_faded_fill_white: @ 807DB14
	push {lr}
	sub sp, 0x4
	ldr r0, _0807DB2C @ =0x7fff7fff
	str r0, [sp]
	ldr r1, _0807DB30 @ =gUnknown_20375F8
	ldr r2, _0807DB34 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0807DB2C: .4byte 0x7fff7fff
_0807DB30: .4byte gUnknown_20375F8
_0807DB34: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_white

	thumb_func_start palette_bg_faded_fill_black
palette_bg_faded_fill_black: @ 807DB38
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _0807DB50 @ =gUnknown_20375F8
	ldr r2, _0807DB54 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0807DB50: .4byte gUnknown_20375F8
_0807DB54: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_black

	thumb_func_start pal_fill_for_maplights
pal_fill_for_maplights: @ 807DB58
	push {r4,lr}
	bl get_map_light_from_warp0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sav1_map_get_light_level
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80C9DCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807DB82
	cmp r0, 0x1
	beq _0807DB94
	b _0807DBA4
_0807DB82:
	bl palette_bg_faded_fill_black
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_black
	b _0807DBA4
_0807DB94:
	bl palette_bg_faded_fill_white
	movs r0, 0x2
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_white
_0807DBA4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pal_fill_for_maplights

	thumb_func_start sub_807DBAC
sub_807DBAC: @ 807DBAC
	push {r4,lr}
	bl get_map_light_from_warp0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sav1_map_get_light_level
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80C9DCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807DBD6
	cmp r0, 0x1
	beq _0807DBE8
	b _0807DBF8
_0807DBD6:
	bl palette_bg_faded_fill_black
	movs r0, 0
	movs r1, 0x3
	bl fade_screen
	bl palette_bg_faded_fill_black
	b _0807DBF8
_0807DBE8:
	bl palette_bg_faded_fill_white
	movs r0, 0x2
	movs r1, 0x3
	bl fade_screen
	bl palette_bg_faded_fill_white
_0807DBF8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807DBAC

	thumb_func_start sub_807DC00
sub_807DC00: @ 807DC00
	push {lr}
	bl palette_bg_faded_fill_black
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_black
	pop {r0}
	bx r0
	thumb_func_end sub_807DC00

	thumb_func_start sub_807DC18
sub_807DC18: @ 807DC18
	push {r4,lr}
	bl warp1_get_mapheader
	adds r4, r0, 0
	ldr r1, _0807DC54 @ =gUnknown_2036DFC
	ldrb r0, [r4, 0x14]
	ldrb r1, [r1, 0x14]
	cmp r0, r1
	beq _0807DC36
	movs r1, 0
	bl sub_80F8110
	lsls r0, 24
	cmp r0, 0
	bne _0807DC58
_0807DC36:
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x17]
	bl sub_80C9D7C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807DC58
	cmp r0, 0x1
	beq _0807DC62
	b _0807DC6A
	.align 2, 0
_0807DC54: .4byte gUnknown_2036DFC
_0807DC58:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	b _0807DC6A
_0807DC62:
	movs r0, 0x3
	movs r1, 0
	bl fade_screen
_0807DC6A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807DC18

	thumb_func_start sub_807DC70
sub_807DC70: @ 807DC70
	push {r4,lr}
	bl sav1_map_get_light_level
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl warp1_get_mapheader
	ldrb r1, [r0, 0x17]
	adds r0, r4, 0
	bl sub_80C9D7C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807DC96
	cmp r0, 0x1
	beq _0807DCA0
	b _0807DCA8
_0807DC96:
	movs r0, 0x1
	movs r1, 0x3
	bl fade_screen
	b _0807DCA8
_0807DCA0:
	movs r0, 0x3
	movs r1, 0x3
	bl fade_screen
_0807DCA8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807DC70

	thumb_func_start sub_807DCB0
sub_807DCB0: @ 807DCB0
	push {lr}
	lsls r0, 24
	movs r1, 0
	cmp r0, 0
	bne _0807DCBC
	movs r1, 0x1
_0807DCBC:
	adds r0, r1, 0
	bl sub_805CB04
	pop {r0}
	bx r0
	thumb_func_end sub_807DCB0

	thumb_func_start task0A_nop_for_a_while
task0A_nop_for_a_while: @ 807DCC8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807E418
	cmp r0, 0x1
	bne _0807DCDC
	adds r0, r4, 0
	bl DestroyTask
_0807DCDC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task0A_nop_for_a_while

	thumb_func_start sub_807DCE4
sub_807DCE4: @ 807DCE4
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055DC4
	bl sub_807DC00
	ldr r0, _0807DD00 @ =task0A_nop_for_a_while
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807DD00: .4byte task0A_nop_for_a_while
	thumb_func_end sub_807DCE4

	thumb_func_start task0A_asap_script_env_2_enable_and_set_ctx_running
task0A_asap_script_env_2_enable_and_set_ctx_running: @ 807DD04
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807E418
	cmp r0, 0x1
	bne _0807DD1C
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_0807DD1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task0A_asap_script_env_2_enable_and_set_ctx_running

	thumb_func_start sub_807DD24
sub_807DD24: @ 807DD24
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055DC4
	bl sub_807DC00
	ldr r0, _0807DD40 @ =task0A_asap_script_env_2_enable_and_set_ctx_running
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807DD40: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_807DD24

	thumb_func_start sub_807DD44
sub_807DD44: @ 807DD44
	push {lr}
	bl ScriptContext2_Enable
	bl sub_807DC00
	ldr r0, _0807DD5C @ =task0A_asap_script_env_2_enable_and_set_ctx_running
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807DD5C: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_807DD44

	thumb_func_start task_mpl_807DD60
task_mpl_807DD60: @ 807DD60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r2, _0807DD84 @ =gUnknown_3005090
	adds r4, r0, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807DD9A
	cmp r0, 0x1
	bgt _0807DD88
	cmp r0, 0
	beq _0807DD8E
	b _0807DDCA
	.align 2, 0
_0807DD84: .4byte gUnknown_3005090
_0807DD88:
	cmp r0, 0x2
	beq _0807DDB8
	b _0807DDCA
_0807DD8E:
	bl sub_8081150
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	b _0807DDB0
_0807DD9A:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _0807DDCA
	bl pal_fill_for_maplights
_0807DDB0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807DDCA
_0807DDB8:
	bl sub_807E418
	cmp r0, 0x1
	bne _0807DDCA
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_0807DDCA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807DD60

	thumb_func_start sub_807DDD0
sub_807DDD0: @ 807DDD0
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055DC4
	bl palette_bg_faded_fill_black
	ldr r0, _0807DDEC @ =task_mpl_807DD60
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807DDEC: .4byte task_mpl_807DD60
	thumb_func_end sub_807DDD0

	thumb_func_start sub_807DDF0
sub_807DDF0: @ 807DDF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807DE14 @ =gUnknown_3005090
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807DE24
	cmp r0, 0x1
	bgt _0807DE18
	cmp r0, 0
	beq _0807DE1E
	b _0807DE50
	.align 2, 0
_0807DE14: .4byte gUnknown_3005090
_0807DE18:
	cmp r0, 0x2
	beq _0807DE3A
	b _0807DE50
_0807DE1E:
	bl sub_800AB9C
	b _0807DE32
_0807DE24:
	bl sub_800A4BC
	lsls r0, 24
	cmp r0, 0
	beq _0807DE50
	bl pal_fill_for_maplights
_0807DE32:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807DE50
_0807DE3A:
	bl sub_807E418
	cmp r0, 0x1
	bne _0807DE50
	bl sub_8009FE8
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_0807DE50:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807DDF0

	thumb_func_start sub_807DE58
sub_807DE58: @ 807DE58
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055DC4
	bl palette_bg_faded_fill_black
	ldr r0, _0807DE74 @ =sub_807DDF0
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807DE74: .4byte sub_807DDF0
	thumb_func_end sub_807DE58

	thumb_func_start sub_807DE78
sub_807DE78: @ 807DE78
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
	adds r0, r4, 0
	bl sub_8059BDC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807DEE8
	ldr r5, _0807DED8 @ =sub_807DFBC
	bl get_map_light_from_warp0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sav1_map_get_light_level
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80C9DCC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807DEDC
	cmp r0, 0x1
	beq _0807DEE2
	b _0807DF2E
	.align 2, 0
_0807DED8: .4byte sub_807DFBC
_0807DEDC:
	bl palette_bg_faded_fill_black
	b _0807DF2E
_0807DEE2:
	bl palette_bg_faded_fill_white
	b _0807DF2E
_0807DEE8:
	adds r0, r5, 0
	bl sub_807DF4C
	adds r0, r4, 0
	bl sub_8059C8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807DF04
	ldr r5, _0807DF00 @ =task_map_chg_seq_0807E20C
	b _0807DF2E
	.align 2, 0
_0807DF00: .4byte task_map_chg_seq_0807E20C
_0807DF04:
	adds r0, r4, 0
	bl sub_8059C5C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807DF2C
	ldr r0, _0807DF20 @ =gUnknown_2031DE0
	ldrb r0, [r0]
	ldr r5, _0807DF24 @ =task_map_chg_seq_0807E2CC
	cmp r0, 0
	bne _0807DF2E
	ldr r5, _0807DF28 @ =sub_807EC34
	b _0807DF2E
	.align 2, 0
_0807DF20: .4byte gUnknown_2031DE0
_0807DF24: .4byte task_map_chg_seq_0807E2CC
_0807DF28: .4byte sub_807EC34
_0807DF2C:
	ldr r5, _0807DF44 @ =task_map_chg_seq_0807E2CC
_0807DF2E:
	ldr r1, _0807DF48 @ =gUnknown_2031DE0
	movs r0, 0
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF44: .4byte task_map_chg_seq_0807E2CC
_0807DF48: .4byte gUnknown_2031DE0
	thumb_func_end sub_807DE78

	thumb_func_start sub_807DF4C
sub_807DF4C: @ 807DF4C
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _0807DF5A
	bl pal_fill_for_maplights
	b _0807DF5E
_0807DF5A:
	bl sub_807DC00
_0807DF5E:
	pop {r0}
	bx r0
	thumb_func_end sub_807DF4C

	thumb_func_start sub_807DF64
sub_807DF64: @ 807DF64
	push {lr}
	bl sub_8055DC4
	bl sub_8111CF0
	movs r0, 0
	bl sub_807DE78
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_807DF64

	thumb_func_start sub_807DF7C
sub_807DF7C: @ 807DF7C
	push {lr}
	bl sub_8055DC4
	bl sub_8111CF0
	movs r0, 0x1
	bl sub_807DE78
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_807DF7C

	thumb_func_start sub_807DF94
sub_807DF94: @ 807DF94
	push {lr}
	bl sub_8055DC4
	bl pal_fill_for_maplights
	bl sub_8111CF0
	movs r0, 0x28
	bl PlaySE
	ldr r0, _0807DFB8 @ =sub_807E31C
	movs r1, 0xA
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0807DFB8: .4byte sub_807E31C
	thumb_func_end sub_807DF94

	thumb_func_start sub_807DFBC
sub_807DFBC: @ 807DFBC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807DFF8 @ =gUnknown_3005090
	adds r4, r0, r1
	adds r6, r4, 0
	adds r6, 0xC
	adds r7, r4, 0
	adds r7, 0xE
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	adds r2, r1, 0
	cmp r0, 0
	bne _0807DFE2
	movs r0, 0x5
	strh r0, [r4, 0x8]
_0807DFE2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	bls _0807DFEC
	b _0807E206
_0807DFEC:
	lsls r0, 2
	ldr r1, _0807DFFC @ =_0807E000
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807DFF8: .4byte gUnknown_3005090
_0807DFFC: .4byte _0807E000
	.align 2, 0
_0807E000:
	.4byte _0807E028
	.4byte _0807E160
	.4byte _0807E198
	.4byte _0807E1DC
	.4byte _0807E1F8
	.4byte _0807E04C
	.4byte _0807E064
	.4byte _0807E0A2
	.4byte _0807E0EC
	.4byte _0807E10E
_0807E028:
	movs r0, 0
	bl sub_807DCB0
	bl player_bitmagic
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r2, 0
	ldrsh r0, [r6, r2]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_805B268
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E206
_0807E04C:
	movs r0, 0
	bl sub_807DCB0
	bl player_bitmagic
	bl sub_807F114
	bl sub_807DBAC
	movs r0, 0x6
	strh r0, [r4, 0x8]
	b _0807E206
_0807E064:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x19
	beq _0807E074
	b _0807E206
_0807E074:
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_805B364
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_805B310
	movs r0, 0x7
	strh r0, [r4, 0x8]
	b _0807E206
_0807E0A2:
	bl sub_805B350
	lsls r0, 24
	cmp r0, 0
	beq _0807E0AE
	b _0807E206
_0807E0AE:
	adds r0, r4, 0
	adds r0, 0x20
	adds r1, r4, 0
	adds r1, 0x22
	bl PlayerGetDestCoords
	movs r0, 0x1
	bl sub_807DCB0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E0E8 @ =gUnknown_2036E38
	adds r0, r1
	movs r1, 0x10
	bl sub_8063CA4
	movs r0, 0x8
	strh r0, [r4, 0x8]
	b _0807E206
	.align 2, 0
_0807E0E8: .4byte gUnknown_2036E38
_0807E0EC:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	beq _0807E0FC
	b _0807E206
_0807E0FC:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	bl sub_805B2D0
	movs r0, 0x9
	strh r0, [r4, 0x8]
	b _0807E206
_0807E10E:
	bl sub_807E418
	cmp r0, 0
	beq _0807E206
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _0807E206
	bl sub_805B350
	lsls r0, 24
	cmp r0, 0
	bne _0807E206
	ldr r0, _0807E158 @ =sub_807F204
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0807E206
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E15C @ =gUnknown_2036E38
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	b _0807E1F2
	.align 2, 0
_0807E158: .4byte sub_807F204
_0807E15C: .4byte gUnknown_2036E38
_0807E160:
	bl sub_807E418
	cmp r0, 0
	beq _0807E206
	movs r0, 0x1
	bl sub_807DCB0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E194 @ =gUnknown_2036E38
	adds r0, r1
	movs r1, 0x10
	bl sub_8063CA4
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _0807E206
	.align 2, 0
_0807E194: .4byte gUnknown_2036E38
_0807E198:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _0807E206
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_805B2D0
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E1D8 @ =gUnknown_2036E38
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _0807E206
	.align 2, 0
_0807E1D8: .4byte gUnknown_2036E38
_0807E1DC:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	blt _0807E1F2
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _0807E206
_0807E1F2:
	movs r0, 0x4
	strh r0, [r4, 0x8]
	b _0807E206
_0807E1F8:
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_0807E206:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807DFBC

	thumb_func_start task_map_chg_seq_0807E20C
task_map_chg_seq_0807E20C: @ 807E20C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807E238 @ =gUnknown_3005090
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0xC
	adds r7, r5, 0
	adds r7, 0xE
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0807E25E
	cmp r0, 0x1
	bgt _0807E23C
	cmp r0, 0
	beq _0807E246
	b _0807E2C6
	.align 2, 0
_0807E238: .4byte gUnknown_3005090
_0807E23C:
	cmp r0, 0x2
	beq _0807E2A8
	cmp r0, 0x3
	beq _0807E2B8
	b _0807E2C6
_0807E246:
	movs r0, 0
	bl sub_807DCB0
	bl player_bitmagic
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _0807E2C6
_0807E25E:
	bl sub_807E418
	cmp r0, 0
	beq _0807E2C6
	movs r0, 0x1
	bl sub_807DCB0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807E2A4 @ =gUnknown_2036E38
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8063F84
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8063CA4
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _0807E2C6
	.align 2, 0
_0807E2A4: .4byte gUnknown_2036E38
_0807E2A8:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _0807E2C6
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _0807E2C6
_0807E2B8:
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_0807E2C6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E20C

	thumb_func_start task_map_chg_seq_0807E2CC
task_map_chg_seq_0807E2CC: @ 807E2CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807E2EC @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807E2F0
	cmp r0, 0x1
	beq _0807E300
	b _0807E316
	.align 2, 0
_0807E2EC: .4byte gUnknown_3005090
_0807E2F0:
	bl player_bitmagic
	bl ScriptContext2_Enable
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E316
_0807E300:
	bl sub_807E418
	cmp r0, 0
	beq _0807E316
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_0807E316:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E2CC

	thumb_func_start sub_807E31C
sub_807E31C: @ 807E31C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807E33C @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807E340
	cmp r0, 0x1
	beq _0807E354
	b _0807E372
	.align 2, 0
_0807E33C: .4byte gUnknown_3005090
_0807E340:
	bl player_bitmagic
	bl ScriptContext2_Enable
	bl sub_805DC04
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E372
_0807E354:
	bl sub_807E418
	cmp r0, 0
	beq _0807E372
	bl sub_805DC24
	cmp r0, 0x1
	beq _0807E372
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_0807E372:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807E31C

	thumb_func_start sub_807E378
sub_807E378: @ 807E378
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807E418
	cmp r0, 0x1
	bne _0807E394
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _0807E39C @ =sub_806F1F0
	movs r1, 0x50
	bl CreateTask
_0807E394:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E39C: .4byte sub_806F1F0
	thumb_func_end sub_807E378

	thumb_func_start sub_807E3A0
sub_807E3A0: @ 807E3A0
	push {lr}
	bl sub_807DC00
	ldr r0, _0807E3B8 @ =sub_807E378
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0807E3B8: .4byte sub_807E378
	thumb_func_end sub_807E3A0

	thumb_func_start sub_807E3BC
sub_807E3BC: @ 807E3BC
	push {lr}
	bl sub_806F1D4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_807E3BC

	thumb_func_start task_mpl_807E3C8
task_mpl_807E3C8: @ 807E3C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807E418
	cmp r0, 0x1
	bne _0807E3E4
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	bl sub_80696C0
_0807E3E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807E3C8

	thumb_func_start sub_807E3EC
sub_807E3EC: @ 807E3EC
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055DC4
	bl sub_807DC00
	ldr r0, _0807E408 @ =task_mpl_807E3C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E408: .4byte task_mpl_807E3C8
	thumb_func_end sub_807E3EC

	thumb_func_start sub_807E40C
sub_807E40C: @ 807E40C
	ldr r0, _0807E414 @ =gUnknown_2037AB8
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	bx lr
	.align 2, 0
_0807E414: .4byte gUnknown_2037AB8
	thumb_func_end sub_807E40C

	thumb_func_start sub_807E418
sub_807E418: @ 807E418
	push {lr}
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807E432
	bl sub_80F83B0
	cmp r0, 0
	beq _0807E432
	movs r0, 0x1
	b _0807E434
_0807E432:
	movs r0, 0
_0807E434:
	pop {r1}
	bx r1
	thumb_func_end sub_807E418

	thumb_func_start sub_807E438
sub_807E438: @ 807E438
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	bl sub_807DC18
	bl play_some_sound
	movs r0, 0x9
	bl PlaySE
	ldr r0, _0807E464 @ =gUnknown_3005020
	ldr r1, _0807E468 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E46C @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E464: .4byte gUnknown_3005020
_0807E468: .4byte sub_807DF64
_0807E46C: .4byte sub_807E718
	thumb_func_end sub_807E438

	thumb_func_start sp13E_warp_to_last_warp
sp13E_warp_to_last_warp: @ 807E470
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	bl sub_807DC18
	bl play_some_sound
	ldr r0, _0807E494 @ =gUnknown_3005020
	ldr r1, _0807E498 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E49C @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E494: .4byte gUnknown_3005020
_0807E498: .4byte sub_807DF64
_0807E49C: .4byte sub_807E718
	thumb_func_end sp13E_warp_to_last_warp

	thumb_func_start sub_807E4A0
sub_807E4A0: @ 807E4A0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _0807E4D4 @ =sub_807E980
	adds r0, r6, 0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807E4D8 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0x26]
	bl _call_via_r6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E4D4: .4byte sub_807E980
_0807E4D8: .4byte gUnknown_3005090
	thumb_func_end sub_807E4A0

	thumb_func_start sub_807E4DC
sub_807E4DC: @ 807E4DC
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0807E4F4 @ =gUnknown_3005020
	ldr r1, _0807E4F8 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E4FC @ =sub_807E80C
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E4F4: .4byte gUnknown_3005020
_0807E4F8: .4byte sub_807DF64
_0807E4FC: .4byte sub_807E80C
	thumb_func_end sub_807E4DC

	thumb_func_start sub_807E500
sub_807E500: @ 807E500
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0807E518 @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	ldr r1, _0807E51C @ =gUnknown_3005020
	ldr r0, _0807E520 @ =sub_807DF94
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E518: .4byte sub_807E718
_0807E51C: .4byte gUnknown_3005020
_0807E520: .4byte sub_807DF94
	thumb_func_end sub_807E500

	thumb_func_start sub_807E524
sub_807E524: @ 807E524
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0807E53C @ =gUnknown_3005020
	ldr r1, _0807E540 @ =sub_807DF64
	str r1, [r0]
	ldr r0, _0807E544 @ =sub_807E784
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E53C: .4byte gUnknown_3005020
_0807E540: .4byte sub_807DF64
_0807E544: .4byte sub_807E784
	thumb_func_end sub_807E524

	thumb_func_start sp13F_fall_to_last_warp
sp13F_fall_to_last_warp: @ 807E548
	push {lr}
	bl sp13E_warp_to_last_warp
	ldr r1, _0807E558 @ =gUnknown_3005020
	ldr r0, _0807E55C @ =sub_8084454
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E558: .4byte gUnknown_3005020
_0807E55C: .4byte sub_8084454
	thumb_func_end sp13F_fall_to_last_warp

	thumb_func_start sub_807E560
sub_807E560: @ 807E560
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	adds r0, r4, 0
	movs r1, 0xA
	bl sub_8084784
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807E560

	thumb_func_start sub_807E57C
sub_807E57C: @ 807E57C
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_8084F2C
	pop {r0}
	bx r0
	thumb_func_end sub_807E57C

	thumb_func_start sub_807E58C
sub_807E58C: @ 807E58C
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_80853CC
	pop {r0}
	bx r0
	thumb_func_end sub_807E58C

	thumb_func_start sub_807E59C
sub_807E59C: @ 807E59C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	ldr r0, _0807E5B8 @ =sub_807E784
	movs r1, 0xA
	bl CreateTask
	ldr r1, _0807E5BC @ =gUnknown_3005020
	ldr r0, _0807E5C0 @ =sub_807DF94
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E5B8: .4byte sub_807E784
_0807E5BC: .4byte gUnknown_3005020
_0807E5C0: .4byte sub_807DF94
	thumb_func_end sub_807E59C

	thumb_func_start sub_807E5C4
sub_807E5C4: @ 807E5C4
	push {lr}
	bl ScriptContext2_Enable
	bl sub_807DC18
	ldr r0, _0807E5E0 @ =sub_807E718
	movs r1, 0xA
	bl CreateTask
	ldr r1, _0807E5E4 @ =gUnknown_3005020
	ldr r0, _0807E5E8 @ =nullsub_60
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807E5E0: .4byte sub_807E718
_0807E5E4: .4byte gUnknown_3005020
_0807E5E8: .4byte nullsub_60
	thumb_func_end sub_807E5C4

	thumb_func_start sub_807E5EC
sub_807E5EC: @ 807E5EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E610 @ =gUnknown_3005090
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E620
	cmp r0, 0x1
	bgt _0807E614
	cmp r0, 0
	beq _0807E61A
	b _0807E64A
	.align 2, 0
_0807E610: .4byte gUnknown_3005090
_0807E614:
	cmp r0, 0x2
	beq _0807E63A
	b _0807E64A
_0807E61A:
	bl ScriptContext2_Enable
	b _0807E632
_0807E620:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E64A
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E64A
_0807E632:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E64A
_0807E63A:
	bl warp_in
	ldr r0, _0807E650 @ =sub_8056788
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E64A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E650: .4byte sub_8056788
	thumb_func_end sub_807E5EC

	thumb_func_start sub_807E654
sub_807E654: @ 807E654
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8055F88
	bl sub_807DC18
	movs r0, 0x9
	bl PlaySE
	ldr r0, _0807E674 @ =sub_807E5EC
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E674: .4byte sub_807E5EC
	thumb_func_end sub_807E654

	thumb_func_start sub_807E678
sub_807E678: @ 807E678
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E69C @ =gUnknown_3005098
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E6BE
	cmp r0, 0x1
	bgt _0807E6A0
	cmp r0, 0
	beq _0807E6A6
	b _0807E6F4
	.align 2, 0
_0807E69C: .4byte gUnknown_3005098
_0807E6A0:
	cmp r0, 0x2
	beq _0807E6DC
	b _0807E6F4
_0807E6A6:
	bl sub_800A068
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl sub_8055F88
	movs r0, 0x9
	bl PlaySE
	b _0807E6D4
_0807E6BE:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E6F4
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E6F4
	bl sub_800AAC0
_0807E6D4:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807E6F4
_0807E6DC:
	ldr r0, _0807E6FC @ =gUnknown_3003F64
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E6F4
	bl warp_in
	ldr r0, _0807E700 @ =sub_805671C
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E6F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E6FC: .4byte gUnknown_3003F64
_0807E700: .4byte sub_805671C
	thumb_func_end sub_807E678

	thumb_func_start sub_807E704
sub_807E704: @ 807E704
	push {lr}
	ldr r0, _0807E714 @ =sub_807E678
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E714: .4byte sub_807E678
	thumb_func_end sub_807E704

	thumb_func_start sub_807E718
sub_807E718: @ 807E718
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E73C @ =gUnknown_3005090
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E750
	cmp r0, 0x1
	bgt _0807E740
	cmp r0, 0
	beq _0807E746
	b _0807E77A
	.align 2, 0
_0807E73C: .4byte gUnknown_3005090
_0807E740:
	cmp r0, 0x2
	beq _0807E76A
	b _0807E77A
_0807E746:
	bl player_bitmagic
	bl ScriptContext2_Enable
	b _0807E762
_0807E750:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E77A
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E77A
_0807E762:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E77A
_0807E76A:
	bl warp_in
	ldr r0, _0807E780 @ =sub_805671C
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E77A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E780: .4byte sub_805671C
	thumb_func_end sub_807E718

	thumb_func_start sub_807E784
sub_807E784: @ 807E784
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807E7A8 @ =gUnknown_3005090
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807E7CA
	cmp r0, 0x1
	bgt _0807E7AC
	cmp r0, 0
	beq _0807E7B6
	b _0807E802
	.align 2, 0
_0807E7A8: .4byte gUnknown_3005090
_0807E7AC:
	cmp r0, 0x2
	beq _0807E7D8
	cmp r0, 0x3
	beq _0807E7F2
	b _0807E802
_0807E7B6:
	bl player_bitmagic
	bl ScriptContext2_Enable
	movs r0, 0x27
	bl PlaySE
	bl sub_805DAB0
	b _0807E7EA
_0807E7CA:
	bl sub_805DAD0
	cmp r0, 0
	bne _0807E802
	bl sub_807DC18
	b _0807E7EA
_0807E7D8:
	bl sub_807E40C
	cmp r0, 0
	bne _0807E802
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807E802
_0807E7EA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0807E802
_0807E7F2:
	bl warp_in
	ldr r0, _0807E808 @ =sub_805671C
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0807E802:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E808: .4byte sub_805671C
	thumb_func_end sub_807E784

	thumb_func_start sub_807E80C
sub_807E80C: @ 807E80C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0807E83C @ =gUnknown_3005090
	adds r5, r1, r0
	adds r4, r5, 0
	adds r4, 0xC
	adds r6, r5, 0
	adds r6, 0xE
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	adds r2, r0, 0
	cmp r1, 0x5
	bls _0807E830
	b _0807E976
_0807E830:
	lsls r0, r1, 2
	ldr r1, _0807E840 @ =_0807E844
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E83C: .4byte gUnknown_3005090
_0807E840: .4byte _0807E844
	.align 2, 0
_0807E844:
	.4byte _0807E85C
	.4byte _0807E898
	.4byte _0807E8F4
	.4byte _0807E940
	.4byte _0807E95C
	.4byte _0807E966
_0807E85C:
	bl player_bitmagic
	adds r0, r4, 0
	adds r1, r6, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl sub_805B364
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl sub_805B310
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _0807E976
_0807E898:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _0807E8AE
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _0807E976
_0807E8AE:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _0807E8F0 @ =gUnknown_2036E38
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimActive
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x11
	bl sub_8063CA4
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _0807E976
	.align 2, 0
_0807E8F0: .4byte gUnknown_2036E38
_0807E8F4:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _0807E976
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl sub_805B2D0
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E93C @ =gUnknown_2036E38
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0
	bl sub_807DCB0
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _0807E976
	.align 2, 0
_0807E93C: .4byte gUnknown_2036E38
_0807E940:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _0807E956
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _0807E976
_0807E956:
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _0807E976
_0807E95C:
	bl sub_8055F88
	bl sub_807DC18
	b _0807E96A
_0807E966:
	bl sub_8055F88
_0807E96A:
	bl play_some_sound
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _0807E97C @ =sub_807E718
	str r0, [r5]
_0807E976:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E97C: .4byte sub_807E718
	thumb_func_end sub_807E80C

	thumb_func_start sub_807E980
sub_807E980: @ 807E980
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807E9C0 @ =gUnknown_3005098
	adds r5, r0, r1
	ldr r2, _0807E9C4 @ =gUnknown_2037078
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E9C8 @ =gUnknown_2036E38
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807E9CC @ =gSprites
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0807E9E8
	cmp r0, 0x1
	bgt _0807E9D0
	cmp r0, 0
	beq _0807E9DA
	b _0807EA9A
	.align 2, 0
_0807E9C0: .4byte gUnknown_3005098
_0807E9C4: .4byte gUnknown_2037078
_0807E9C8: .4byte gUnknown_2036E38
_0807E9CC: .4byte gSprites
_0807E9D0:
	cmp r0, 0x2
	beq _0807EA38
	cmp r0, 0x3
	beq _0807EA66
	b _0807EA9A
_0807E9DA:
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl CameraObjectReset2
	b _0807EA92
_0807E9E8:
	adds r0, r6, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0807EA00
	adds r0, r6, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0807EAB0
_0807EA00:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0807EA10
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
	b _0807EAB0
_0807EA10:
	bl sub_8055F88
	bl play_some_sound
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrh r0, [r5, 0x2]
	adds r1, r5, 0x4
	adds r2, r5, 0x6
	bl sub_807EB64
	movs r0, 0x9
	bl PlaySE
	b _0807EA92
_0807EA38:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	adds r2, r5, 0
	adds r2, 0x8
	adds r3, r5, 0
	adds r3, 0xA
	adds r4, r5, 0
	adds r4, 0xC
	str r4, [sp]
	bl sub_807EAC4
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _0807EAB0
	bl sub_807DC18
	b _0807EA92
_0807EA66:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	adds r2, r5, 0
	adds r2, 0x8
	adds r3, r5, 0
	adds r3, 0xA
	adds r4, r5, 0
	adds r4, 0xC
	str r4, [sp]
	bl sub_807EAC4
	bl sub_807E40C
	cmp r0, 0
	bne _0807EAB0
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _0807EAB0
_0807EA92:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _0807EAB0
_0807EA9A:
	ldr r0, _0807EAB8 @ =gUnknown_3005020
	ldr r1, _0807EABC @ =sub_807DF64
	str r1, [r0]
	bl warp_in
	ldr r0, _0807EAC0 @ =sub_805671C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0807EAB0:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAB8: .4byte gUnknown_3005020
_0807EABC: .4byte sub_807DF64
_0807EAC0: .4byte sub_805671C
	thumb_func_end sub_807E980

	thumb_func_start sub_807EAC4
sub_807EAC4: @ 807EAC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r2, 0
	adds r5, r3, 0
	ldr r6, [sp, 0x18]
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	ldr r3, _0807EB58 @ =gUnknown_2037078
	ldrb r2, [r3, 0x4]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _0807EB5C @ =gSprites
	adds r7, r0, r2
	ldrb r2, [r3, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0807EB60 @ =gUnknown_2036E38
	adds r0, r2
	mov r8, r0
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	bgt _0807EB02
	movs r2, 0
	ldrsh r0, [r6, r2]
	cmp r0, 0x6
	ble _0807EB08
_0807EB02:
	ldrh r0, [r5]
	adds r0, r1, r0
	strh r0, [r5]
_0807EB08:
	mov r1, r12
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r4]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	ldrh r0, [r4]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r7, 0x24]
	ldrh r0, [r5]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r7, 0x26]
	mov r1, r8
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0807EB4C
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl FieldObjectForceSetSpecialAnim
_0807EB4C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB58: .4byte gUnknown_2037078
_0807EB5C: .4byte gSprites
_0807EB60: .4byte gUnknown_2036E38
	thumb_func_end sub_807EAC4

	thumb_func_start sub_807EB64
sub_807EB64: @ 807EB64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0807EBB4 @ =gUnknown_2037078
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807EBB8 @ =gUnknown_2036E38
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectForceSetSpecialAnim
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	bl sub_807EBBC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807EBB4: .4byte gUnknown_2037078
_0807EBB8: .4byte gUnknown_2036E38
	thumb_func_end sub_807EB64

	thumb_func_start sub_807EBBC
sub_807EBBC: @ 807EBBC
	push {r4-r7,lr}
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl sub_8059C0C
	lsls r0, 24
	cmp r0, 0
	beq _0807EBE0
	movs r0, 0x10
	strh r0, [r5]
	movs r1, 0xA
	negs r1, r1
	adds r0, r1, 0
	b _0807EC2A
_0807EBE0:
	adds r0, r4, 0
	bl sub_8059C20
	lsls r0, 24
	cmp r0, 0
	beq _0807EBFA
	movs r1, 0x11
	negs r1, r1
	adds r0, r1, 0
	strh r0, [r5]
	adds r1, 0x7
	adds r0, r1, 0
	b _0807EC2A
_0807EBFA:
	adds r0, r4, 0
	bl sub_8059C34
	lsls r0, 24
	cmp r0, 0
	beq _0807EC0E
	movs r0, 0x11
	strh r0, [r5]
	movs r0, 0x3
	b _0807EC2A
_0807EC0E:
	adds r0, r7, 0
	bl sub_8059C48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807EC28
	movs r1, 0x11
	negs r1, r1
	adds r0, r1, 0
	strh r0, [r5]
	movs r0, 0x3
	b _0807EC2A
_0807EC28:
	strh r0, [r5]
_0807EC2A:
	strh r0, [r6]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807EBBC

	thumb_func_start sub_807EC34
sub_807EC34: @ 807EC34
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807EC6C @ =gUnknown_3005098
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0807EC70
	cmp r0, 0x1
	beq _0807EC92
	bl sub_807E418
	cmp r0, 0x1
	bne _0807ECB2
	bl CameraObjectReset1
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	b _0807ECB2
	.align 2, 0
_0807EC6C: .4byte gUnknown_3005098
_0807EC70:
	bl sub_8055DC4
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	adds r0, r5, 0x2
	adds r1, r5, 0x4
	adds r2, r5, 0x6
	adds r3, r5, 0
	adds r3, 0x8
	adds r4, r5, 0
	adds r4, 0xA
	str r4, [sp]
	bl sub_807ECBC
	b _0807ECAC
_0807EC92:
	adds r0, r5, 0x2
	adds r1, r5, 0x4
	adds r2, r5, 0x6
	adds r3, r5, 0
	adds r3, 0x8
	adds r4, r5, 0
	adds r4, 0xA
	str r4, [sp]
	bl sub_807EDA0
	lsls r0, 24
	cmp r0, 0
	bne _0807ECB2
_0807ECAC:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807ECB2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807EC34

	thumb_func_start sub_807ECBC
sub_807ECBC: @ 807ECBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	adds r5, r1, 0
	mov r9, r2
	mov r10, r3
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
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8059C34
	lsls r0, 24
	cmp r0, 0
	bne _0807ED06
	adds r0, r6, 0
	bl sub_8059C0C
	lsls r0, 24
	cmp r0, 0
	beq _0807ED0A
_0807ED06:
	movs r1, 0x3
	b _0807ED0C
_0807ED0A:
	movs r1, 0x4
_0807ED0C:
	ldr r0, _0807ED94 @ =gUnknown_2037078
	mov r8, r0
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807ED98 @ =gUnknown_2036E38
	adds r4, r0
	adds r0, r1, 0
	bl sub_8064270
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectForceSetSpecialAnim
	adds r0, r6, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl sub_807EBBC
	movs r1, 0
	ldrsh r0, [r7, r1]
	lsls r0, 4
	mov r2, r9
	strh r0, [r2]
	movs r1, 0
	ldrsh r0, [r5, r1]
	lsls r0, 4
	mov r2, r10
	strh r0, [r2]
	movs r1, 0x10
	ldr r0, [sp, 0x24]
	strh r1, [r0]
	mov r1, r8
	ldrb r0, [r1, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0807ED9C @ =gSprites
	adds r1, r0
	mov r2, r9
	ldrh r0, [r2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	mov r2, r10
	ldrh r0, [r2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x26]
	movs r1, 0
	ldrsh r0, [r7, r1]
	negs r0, r0
	strh r0, [r7]
	movs r2, 0
	ldrsh r0, [r5, r2]
	negs r0, r0
	strh r0, [r5]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED94: .4byte gUnknown_2037078
_0807ED98: .4byte gUnknown_2036E38
_0807ED9C: .4byte gSprites
	thumb_func_end sub_807ECBC

	thumb_func_start sub_807EDA0
sub_807EDA0: @ 807EDA0
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, [sp, 0x14]
	ldr r0, _0807EDC8 @ =gUnknown_2037078
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807EDCC @ =gSprites
	adds r1, r0, r1
	movs r7, 0
	ldrsh r0, [r4, r7]
	cmp r0, 0
	bne _0807EDD0
	strh r0, [r1, 0x24]
	strh r0, [r1, 0x26]
	movs r0, 0
	b _0807EDF8
	.align 2, 0
_0807EDC8: .4byte gUnknown_2037078
_0807EDCC: .4byte gSprites
_0807EDD0:
	ldrh r0, [r5]
	ldrh r5, [r2]
	adds r0, r5
	strh r0, [r2]
	ldrh r0, [r6]
	ldrh r7, [r3]
	adds r0, r7
	strh r0, [r3]
	ldrh r0, [r2]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	ldrh r0, [r3]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x26]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	movs r0, 0x1
_0807EDF8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807EDA0

	.align 2, 0 @ Don't pad with nop.
