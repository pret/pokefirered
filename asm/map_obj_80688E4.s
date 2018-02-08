	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start FreezeMapObject
FreezeMapObject: @ 80688E4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5]
	movs r0, 0xA0
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0806896C
	ldrb r0, [r5, 0x1]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0x1]
	ldr r3, _08068968 @ =gSprites
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 7
	ldrb r2, [r5, 0x2]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x2]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	lsrs r1, 7
	ands r1, r4
	ldrb r2, [r5, 0x3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0
	b _0806896E
	.align 2, 0
_08068968: .4byte gSprites
_0806896C:
	movs r0, 0x1
_0806896E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FreezeMapObject

	thumb_func_start player_bitmagic
player_bitmagic: @ 8068974
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080689A8 @ =gUnknown_2036E38
_0806897A:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08068998
	ldr r0, _080689AC @ =gUnknown_2037078
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _08068998
	adds r0, r1, 0
	bl FreezeMapObject
_08068998:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0806897A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080689A8: .4byte gUnknown_2036E38
_080689AC: .4byte gUnknown_2037078
	thumb_func_end player_bitmagic

	thumb_func_start FreezeMapObjectsExceptOne
FreezeMapObjectsExceptOne: @ 80689B0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080689EC @ =gUnknown_2036E38
_080689BA:
	cmp r4, r5
	beq _080689DC
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r6
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _080689DC
	ldr r0, _080689F0 @ =gUnknown_2037078
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _080689DC
	adds r0, r1, 0
	bl FreezeMapObject
_080689DC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080689BA
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080689EC: .4byte gUnknown_2036E38
_080689F0: .4byte gUnknown_2037078
	thumb_func_end FreezeMapObjectsExceptOne

	thumb_func_start npc_sync_anim_pause_bits
npc_sync_anim_pause_bits: @ 80689F4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r2, [r5]
	ldr r1, _08068A54 @ =0x00000101
	adds r0, r1, 0
	ands r0, r2
	cmp r0, r1
	bne _08068A4C
	ldrb r1, [r5, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldr r4, _08068A58 @ =gSprites
	ldrb r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r5, 0x2]
	adds r1, 0x2C
	lsrs r2, 7
	lsls r2, 6
	ldrb r3, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldrb r1, [r5, 0x3]
	lsls r1, 31
	lsrs r1, 31
	adds r2, 0x2C
	lsls r1, 7
	ldrb r3, [r2]
	movs r0, 0x7F
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_08068A4C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068A54: .4byte 0x00000101
_08068A58: .4byte gSprites
	thumb_func_end npc_sync_anim_pause_bits

	thumb_func_start UnfreezeMapObjects
UnfreezeMapObjects: @ 8068A5C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08068A88 @ =gUnknown_2036E38
_08068A62:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08068A78
	adds r0, r1, 0
	bl npc_sync_anim_pause_bits
_08068A78:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08068A62
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068A88: .4byte gUnknown_2036E38
	thumb_func_end UnfreezeMapObjects

	thumb_func_start little_step
little_step: @ 8068A8C
	lsls r1, 24
	ldr r2, _08068AA8 @ =gUnknown_83A64C8
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08068AA8: .4byte gUnknown_83A64C8
	thumb_func_end little_step

	thumb_func_start double_little_steps
double_little_steps: @ 8068AAC
	lsls r1, 24
	ldr r2, _08068ACC @ =gUnknown_83A64C8
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 1
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 1
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08068ACC: .4byte gUnknown_83A64C8
	thumb_func_end double_little_steps

	thumb_func_start triple_little_steps
triple_little_steps: @ 8068AD0
	lsls r1, 24
	ldr r2, _08068AF4 @ =gUnknown_83A64C8
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r3, r2, 1
	adds r2, r3
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r2, r1, 1
	adds r1, r2
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08068AF4: .4byte gUnknown_83A64C8
	thumb_func_end triple_little_steps

	thumb_func_start quad_little_steps
quad_little_steps: @ 8068AF8
	lsls r1, 24
	ldr r2, _08068B18 @ =gUnknown_83A64C8
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 2
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 2
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08068B18: .4byte gUnknown_83A64C8
	thumb_func_end quad_little_steps

	thumb_func_start oct_little_steps
oct_little_steps: @ 8068B1C
	lsls r1, 24
	ldr r2, _08068B3C @ =gUnknown_83A64C8
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 3
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 3
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08068B3C: .4byte gUnknown_83A64C8
	thumb_func_end oct_little_steps

	thumb_func_start oamt_npc_ministep_reset
oamt_npc_ministep_reset: @ 8068B40
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r3, [r0, 0x38]
	bx lr
	thumb_func_end oamt_npc_ministep_reset

	thumb_func_start obj_npc_ministep
obj_npc_ministep: @ 8068B54
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _08068BAC @ =gUnknown_83A71B0
	movs r0, 0x36
	ldrsh r2, [r4, r0]
	lsls r0, r2, 1
	adds r0, r5
	movs r3, 0x38
	ldrsh r1, [r4, r3]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _08068BB4
	ldr r1, _08068BB0 @ =gUnknown_83A719C
	lsls r0, r2, 2
	adds r0, r1
	movs r1, 0x38
	ldrsh r2, [r4, r1]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r5
	lsls r0, 16
	asrs r0, 16
	movs r3, 0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	blt _08068BB4
	movs r0, 0x1
	b _08068BB6
	.align 2, 0
_08068BAC: .4byte gUnknown_83A71B0
_08068BB0: .4byte gUnknown_83A719C
_08068BB4:
	movs r0, 0
_08068BB6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end obj_npc_ministep

	thumb_func_start sub_8068BBC
sub_8068BBC: @ 8068BBC
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_8068BBC

	thumb_func_start sub_8068BCC
sub_8068BCC: @ 8068BCC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x36]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08068BEC
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
_08068BEC:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bgt _08068BFE
	movs r0, 0
	b _08068C00
_08068BFE:
	movs r0, 0x1
_08068C00:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068BCC

	thumb_func_start sub_8068C08
sub_8068C08: @ 8068C08
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_8068C08

	thumb_func_start sub_8068C18
sub_8068C18: @ 8068C18
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bgt _08068C3E
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _08068C42
_08068C3E:
	movs r0, 0
	strh r0, [r4, 0x36]
_08068C42:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bgt _08068C4E
	movs r0, 0
	b _08068C50
_08068C4E:
	movs r0, 0x1
_08068C50:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068C18

	thumb_func_start sub_8068C58
sub_8068C58: @ 8068C58
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_8068C58

	thumb_func_start sub_8068C68
sub_8068C68: @ 8068C68
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08068C90
	movs r0, 0
	strh r0, [r4, 0x36]
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
_08068C90:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bgt _08068C9C
	movs r0, 0
	b _08068C9E
_08068C9C:
	movs r0, 0x1
_08068C9E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068C68

	thumb_func_start sub_8068CA4
sub_8068CA4: @ 8068CA4
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_8068CA4

	thumb_func_start sub_8068CB4
sub_8068CB4: @ 8068CB4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08068CD8
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	b _08068CE8
_08068CD8:
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl double_little_steps
	ldrh r0, [r4, 0x38]
	adds r0, 0x2
_08068CE8:
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bgt _08068CF6
	movs r0, 0
	b _08068CF8
_08068CF6:
	movs r0, 0x1
_08068CF8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068CB4

	thumb_func_start sub_8068D00
sub_8068D00: @ 8068D00
	lsls r1, 24
	ldr r2, _08068D18 @ =gUnknown_83A71EC
	lsrs r1, 22
	adds r1, r2
	lsls r0, 16
	asrs r0, 16
	ldr r1, [r1]
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_08068D18: .4byte gUnknown_83A71EC
	thumb_func_end sub_8068D00

	thumb_func_start sub_8068D1C
sub_8068D1C: @ 8068D1C
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r3, [r0, 0x38]
	strh r4, [r0, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8068D1C

	thumb_func_start sub_8068D3C
sub_8068D3C: @ 8068D3C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _08068DBC @ =gUnknown_83A71F8
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _08068DC0 @ =gUnknown_83A71FE
	adds r0, r5, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08068D6E
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
_08068D6E:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	adds r1, r5, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r4, 0x38]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8068D00
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x3A]
	adds r1, 0x1
	strh r1, [r4, 0x3A]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, 16
	asrs r2, r0, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 17
	cmp r1, r0
	bne _08068DA8
	movs r6, 0x1
_08068DA8:
	cmp r1, r2
	blt _08068DB2
	movs r0, 0
	strh r0, [r4, 0x26]
	movs r6, 0xFF
_08068DB2:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068DBC: .4byte gUnknown_83A71F8
_08068DC0: .4byte gUnknown_83A71FE
	thumb_func_end sub_8068D3C

	thumb_func_start sub_8068DC4
sub_8068DC4: @ 8068DC4
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	ldr r1, _08068E50 @ =gUnknown_83A7202
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _08068E54 @ =gUnknown_83A7208
	adds r0, r4, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08068E00
	ldrh r1, [r5, 0x3A]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08068E00
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl little_step
_08068E00:
	movs r2, 0x3A
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	adds r1, r4, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r5, 0x38]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8068D00
	strh r0, [r5, 0x26]
	ldrh r1, [r5, 0x3A]
	adds r1, 0x1
	strh r1, [r5, 0x3A]
	movs r2, 0x36
	ldrsh r0, [r5, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, 16
	asrs r2, r0, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 17
	cmp r1, r0
	bne _08068E3A
	movs r6, 0x1
_08068E3A:
	cmp r1, r2
	blt _08068E44
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r6, 0xFF
_08068E44:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068E50: .4byte gUnknown_83A7202
_08068E54: .4byte gUnknown_83A7208
	thumb_func_end sub_8068DC4

	thumb_func_start SetFieldObjectStepTimer
SetFieldObjectStepTimer: @ 8068E58
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end SetFieldObjectStepTimer

	thumb_func_start RunFieldObjectStepTimer
RunFieldObjectStepTimer: @ 8068E5C
	push {lr}
	ldrh r1, [r0, 0x34]
	subs r1, 0x1
	strh r1, [r0, 0x34]
	lsls r1, 16
	cmp r1, 0
	beq _08068E6E
	movs r0, 0
	b _08068E70
_08068E6E:
	movs r0, 0x1
_08068E70:
	pop {r1}
	bx r1
	thumb_func_end RunFieldObjectStepTimer

	thumb_func_start obj_anim_image_set_and_seek
obj_anim_image_set_and_seek: @ 8068E74
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	adds r3, r0, 0
	adds r3, 0x2A
	strb r1, [r3]
	adds r4, r0, 0
	adds r4, 0x2C
	ldrb r3, [r4]
	movs r1, 0x41
	negs r1, r1
	ands r1, r3
	strb r1, [r4]
	adds r1, r2, 0
	bl SeekSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end obj_anim_image_set_and_seek

	thumb_func_start sub_8068E9C
sub_8068E9C: @ 8068E9C
	push {lr}
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08068EAE
	movs r0, 0
	b _08068EB0
_08068EAE:
	movs r0, 0x1
_08068EB0:
	pop {r1}
	bx r1
	thumb_func_end sub_8068E9C

	thumb_func_start sub_8068EB4
sub_8068EB4: @ 8068EB4
	push {r4-r6,lr}
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	mov r3, r12
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08068F1C
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	mov r4, r12
	adds r4, 0x28
	movs r0, 0
	ldrsb r0, [r4, r0]
	ldr r2, _08068F14 @ =gSpriteCoordOffsetX
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r12
	ldrh r1, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	subs r3, 0x15
	movs r0, 0
	ldrsb r0, [r3, r0]
	ldr r2, _08068F18 @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, r3, 0
	b _08068F4A
	.align 2, 0
_08068F14: .4byte gSpriteCoordOffsetX
_08068F18: .4byte gSpriteCoordOffsetY
_08068F1C:
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	mov r3, r12
	adds r3, 0x28
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r12
	ldrh r1, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	mov r2, r12
	adds r2, 0x29
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, r3, 0
_08068F4A:
	ldrb r0, [r4]
	lsls r0, 24
	asrs r0, 25
	subs r0, r6, r0
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r0, [r2]
	lsls r0, 24
	asrs r0, 25
	subs r0, r5, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _08068F76
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08068F82
_08068F76:
	mov r4, r12
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_08068F82:
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _08068F96
	lsls r0, r2, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08068FA2
_08068F96:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08068FA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8068EB4

	thumb_func_start sub_8068FA8
sub_8068FA8: @ 8068FA8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8069248
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	ldrh r1, [r4, 0x32]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8068EB4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8068FA8

	thumb_func_start sub_8068FD0
sub_8068FD0: @ 8068FD0
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0x3F
_08068FD6:
	ldr r0, _08069004 @ =gSprites
	adds r2, r5, r0
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08068FF6
	ldr r1, [r2, 0x1C]
	ldr r0, _08069008 @ =sub_8068FA8
	cmp r1, r0
	bne _08068FF6
	adds r0, r2, 0
	bl DestroySprite
_08068FF6:
	adds r5, 0x44
	subs r4, 0x1
	cmp r4, 0
	bge _08068FD6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069004: .4byte gSprites
_08069008: .4byte sub_8068FA8
	thumb_func_end sub_8068FD0

	thumb_func_start sub_806900C
sub_806900C: @ 806900C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r6, _08069040 @ =gSprites
	movs r4, 0
_08069018:
	adds r2, r4, r6
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08069048
	ldr r1, [r2, 0x1C]
	ldr r0, _08069044 @ =sub_8068FA8
	cmp r1, r0
	bne _08069048
	ldrh r0, [r2, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _08069048
	adds r0, r3, 0
	b _08069052
	.align 2, 0
_08069040: .4byte gSprites
_08069044: .4byte sub_8068FA8
_08069048:
	adds r4, 0x44
	adds r3, 0x1
	cmp r3, 0x3F
	ble _08069018
	movs r0, 0x40
_08069052:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806900C

	thumb_func_start sub_8069058
sub_8069058: @ 8069058
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	bl sub_806900C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0806908A
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08069090 @ =gSprites
	adds r4, r0
	adds r0, r5, 0
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0806908A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069090: .4byte gSprites
	thumb_func_end sub_8069058

	thumb_func_start sub_8069094
sub_8069094: @ 8069094
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	bl sub_806900C
	adds r1, r0, 0
	cmp r1, 0x40
	beq _0806911E
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080690F8 @ =gSprites
	adds r4, r0, r1
	adds r0, r5, 0
	bl GetFieldObjectGraphicsInfo
	ldrh r3, [r4, 0x4]
	lsls r3, 22
	ldr r1, [r0, 0x10]
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r4]
	str r2, [r4, 0x4]
	lsrs r3, 22
	ldrh r2, [r4, 0x4]
	ldr r1, _080690FC @ =0xfffffc00
	ands r1, r2
	orrs r1, r3
	strh r1, [r4, 0x4]
	ldrb r2, [r0, 0xC]
	lsls r2, 28
	lsrs r2, 24
	ldrb r3, [r4, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r2
	strb r1, [r4, 0x5]
	ldr r1, [r0, 0x1C]
	str r1, [r4, 0xC]
	ldr r1, [r0, 0x14]
	cmp r1, 0
	bne _08069100
	str r1, [r4, 0x18]
	adds r0, r4, 0
	adds r0, 0x42
	strb r1, [r0]
	b _08069116
	.align 2, 0
_080690F8: .4byte gSprites
_080690FC: .4byte 0xfffffc00
_08069100:
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r0, [r2]
	movs r1, 0x3F
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r2]
_08069116:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_0806911E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8069094

	thumb_func_start sub_8069124
sub_8069124: @ 8069124
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl sub_806900C
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r2, 0x40
	beq _08069160
	cmp r4, 0
	beq _08069154
	ldr r0, _08069150 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x32]
	b _08069160
	.align 2, 0
_08069150: .4byte gSprites
_08069154:
	ldr r1, _08069168 @ =gSprites
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x32]
_08069160:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069168: .4byte gSprites
	thumb_func_end sub_8069124

	thumb_func_start sub_806916C
sub_806916C: @ 806916C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806900C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	bne _08069182
	movs r0, 0
	b _0806919A
_08069182:
	movs r3, 0
	ldr r0, _080691A0 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r2, 0x32
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _08069198
	movs r3, 0x1
_08069198:
	adds r0, r3, 0
_0806919A:
	pop {r1}
	bx r1
	.align 2, 0
_080691A0: .4byte gSprites
	thumb_func_end sub_806916C

	thumb_func_start sub_80691A4
sub_80691A4: @ 80691A4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806900C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080691CA
	ldr r0, _080691D0 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r4, [r1, 0x34]
	strh r0, [r1, 0x36]
_080691CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080691D0: .4byte gSprites
	thumb_func_end sub_80691A4

	thumb_func_start sub_80691D4
sub_80691D4: @ 80691D4
	push {lr}
	adds r2, r0, 0
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080691E6
	cmp r0, 0x1
	beq _080691EE
	b _0806920C
_080691E6:
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x36]
	adds r0, 0x1
	strh r0, [r2, 0x36]
_080691EE:
	ldrh r0, [r2, 0x26]
	subs r0, 0x8
	movs r3, 0
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xA0
	negs r1, r1
	cmp r0, r1
	bne _0806920C
	strh r3, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r2, 0x32]
	strh r3, [r2, 0x34]
	strh r3, [r2, 0x36]
_0806920C:
	pop {r0}
	bx r0
	thumb_func_end sub_80691D4

	thumb_func_start sub_8069210
sub_8069210: @ 8069210
	push {lr}
	adds r1, r0, 0
	movs r2, 0x36
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08069222
	cmp r0, 0x1
	beq _0806922C
	b _0806923E
_08069222:
	ldr r0, _08069244 @ =0x0000ff60
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x36]
	adds r0, 0x1
	strh r0, [r1, 0x36]
_0806922C:
	ldrh r0, [r1, 0x26]
	adds r0, 0x8
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _0806923E
	strh r0, [r1, 0x34]
	strh r0, [r1, 0x36]
_0806923E:
	pop {r0}
	bx r0
	.align 2, 0
_08069244: .4byte 0x0000ff60
	thumb_func_end sub_8069210

	thumb_func_start sub_8069248
sub_8069248: @ 8069248
	push {lr}
	adds r1, r0, 0
	movs r2, 0x34
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08069264
	cmp r0, 0x1
	bgt _0806925E
	cmp r0, 0
	beq _08069284
	b _08069274
_0806925E:
	cmp r0, 0x2
	beq _0806926C
	b _08069274
_08069264:
	adds r0, r1, 0
	bl sub_8069210
	b _08069284
_0806926C:
	adds r0, r1, 0
	bl sub_80691D4
	b _08069284
_08069274:
	movs r0, 0
	strh r0, [r1, 0x34]
	ldr r0, _08069288 @ =gUnknown_83A720C	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/evobjmv.c"
	ldr r1, _0806928C @ =0x00003413
	ldr r2, _08069290 @ =gUnknown_83A7240	"0"
	movs r3, 0x1
	bl AGBAssert
_08069284:
	pop {r0}
	bx r0
	.align 2, 0
_08069288: .4byte gUnknown_83A720C
_0806928C: .4byte 0x00003413
_08069290: .4byte gUnknown_83A7240
	thumb_func_end sub_8069248

	thumb_func_start sub_8069294
sub_8069294: @ 8069294
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806900C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080692B8
	ldr r0, _080692BC @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r2, 0x34
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080692C0
_080692B8:
	movs r0, 0
	b _080692C2
	.align 2, 0
_080692BC: .4byte gSprites
_080692C0:
	movs r0, 0x1
_080692C2:
	pop {r1}
	bx r1
	thumb_func_end sub_8069294

	thumb_func_start oe_exec_and_other_stuff
oe_exec_and_other_stuff: @ 80692C8
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080692EC @ =gUnknown_20386E0
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	adds r0, r4, 0
	bl FieldEffectStart
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080692EC: .4byte gUnknown_20386E0
	thumb_func_end oe_exec_and_other_stuff

	thumb_func_start DoShadowFieldEffect
DoShadowFieldEffect: @ 80692F0
	push {lr}
	adds r1, r0, 0
	ldrb r2, [r1, 0x2]
	lsls r0, r2, 25
	cmp r0, 0
	blt _08069308
	movs r0, 0x40
	orrs r0, r2
	strb r0, [r1, 0x2]
	movs r0, 0x3
	bl oe_exec_and_other_stuff
_08069308:
	pop {r0}
	bx r0
	thumb_func_end DoShadowFieldEffect

	thumb_func_start DoRippleFieldEffect
DoRippleFieldEffect: @ 806930C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r2, _08069344 @ =gUnknown_20386E0
	movs r3, 0x20
	ldrsh r1, [r4, r3]
	str r1, [r2]
	movs r3, 0x22
	ldrsh r1, [r4, r3]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	adds r1, r0
	subs r1, 0x2
	str r1, [r2, 0x4]
	movs r0, 0x97
	str r0, [r2, 0x8]
	movs r0, 0x3
	str r0, [r2, 0xC]
	movs r0, 0x5
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069344: .4byte gUnknown_20386E0
	thumb_func_end DoRippleFieldEffect

	.align 2, 0 @ Don't pad with nop.
