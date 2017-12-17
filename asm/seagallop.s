	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8146E78
sub_8146E78: @ 8146E78
	push {lr}
	movs r0, 0
	bl sub_80006F4
	bl sub_812B478
	ldr r0, _08146E90 @ =sub_8146E94
	bl sub_8000544
	pop {r0}
	bx r0
	.align 2, 0
_08146E90: .4byte sub_8146E94
	thumb_func_end sub_8146E78

	thumb_func_start sub_8146E94
sub_8146E94: @ 8146E94
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _08146EB4 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08146EA8
	b _0814703C
_08146EA8:
	lsls r0, 2
	ldr r1, _08146EB8 @ =_08146EBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146EB4: .4byte gUnknown_30030F0
_08146EB8: .4byte _08146EBC
	.align 2, 0
_08146EBC:
	.4byte _08146EDC
	.4byte _08146EE8
	.4byte _08146EEE
	.4byte _08146F20
	.4byte _08146F8C
	.4byte _08146FAC
	.4byte _08146FBE
	.4byte _08146FE4
_08146EDC:
	movs r0, 0
	bl sub_80006F4
	bl sub_81471C4
	b _08146FCE
_08146EE8:
	bl sub_81472FC
	b _08146FCE
_08146EEE:
	ldr r4, _08146F18 @ =gUnknown_203F3D0
	movs r0, 0x80
	lsls r0, 4
	bl sub_8002BB0
	str r0, [r4]
	movs r0, 0
	bl sub_8001618
	ldr r1, _08146F1C @ =gUnknown_846AEF8
	movs r0, 0
	movs r2, 0x1
	bl sub_8001658
	ldr r1, [r4]
	movs r0, 0x3
	bl sub_8001FA0
	bl sub_814732C
	b _08146FCE
	.align 2, 0
_08146F18: .4byte gUnknown_203F3D0
_08146F1C: .4byte gUnknown_846AEF8
_08146F20:
	ldr r1, _08146F50 @ =gUnknown_8468C98
	movs r2, 0xA4
	lsls r2, 3
	movs r0, 0x3
	movs r3, 0
	bl sub_80017D0
	bl sub_81474CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08146F58
	ldr r1, _08146F54 @ =gUnknown_84699D8
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl sub_8002124
	b _08146F6A
	.align 2, 0
_08146F50: .4byte gUnknown_8468C98
_08146F54: .4byte gUnknown_84699D8
_08146F58:
	ldr r1, _08146F84 @ =gUnknown_84691D8
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl sub_8002124
_08146F6A:
	ldr r0, _08146F88 @ =gUnknown_84691B8
	movs r1, 0x40
	movs r2, 0x20
	bl sub_80703EC
	movs r0, 0x2
	bl sub_8150408
	movs r1, 0xF0
	movs r2, 0x20
	bl sub_80703EC
	b _08146FCE
	.align 2, 0
_08146F84: .4byte gUnknown_84691D8
_08146F88: .4byte gUnknown_84691B8
_08146F8C:
	bl sub_8001960
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0814703C
	movs r0, 0
	bl sub_80019BC
	movs r0, 0x3
	bl sub_80019BC
	movs r0, 0x3
	bl sub_80020BC
	b _08146FCE
_08146FAC:
	bl sub_8147384
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl sub_80714D4
	b _08146FCE
_08146FBE:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl sub_8070588
_08146FCE:
	ldr r1, _08146FE0 @ =gUnknown_30030F0
	movs r0, 0x87
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0814703C
	.align 2, 0
_08146FE0: .4byte gUnknown_30030F0
_08146FE4:
	bl sub_814731C
	ldr r0, _08147044 @ =sub_8147058
	bl sub_80006F4
	movs r0, 0x13
	bl sub_80722CC
	bl sub_81473C4
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	bl sub_8000AF4
	movs r0, 0x48
	movs r1, 0x3F
	bl sub_8000A38
	movs r0, 0x4A
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x40
	movs r1, 0xF0
	bl sub_8000A38
	ldr r1, _08147048 @ =0x00001888
	movs r0, 0x44
	bl sub_8000A38
	ldr r0, _0814704C @ =sub_8147084
	movs r1, 0x8
	bl sub_807741C
	ldr r0, _08147050 @ =sub_814706C
	bl sub_8000544
	ldr r0, _08147054 @ =gUnknown_30030F0
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0814703C:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147044: .4byte sub_8147058
_08147048: .4byte 0x00001888
_0814704C: .4byte sub_8147084
_08147050: .4byte sub_814706C
_08147054: .4byte gUnknown_30030F0
	thumb_func_end sub_8146E94

	thumb_func_start sub_8147058
sub_8147058: @ 8147058
	push {lr}
	bl sub_8007320
	bl sub_8007610
	bl sub_8070474
	pop {r0}
	bx r0
	thumb_func_end sub_8147058

	thumb_func_start sub_814706C
sub_814706C: @ 814706C
	push {lr}
	bl sub_8077578
	bl sub_8006B5C
	bl sub_8006BA8
	bl sub_80704D0
	pop {r0}
	bx r0
	thumb_func_end sub_814706C

	thumb_func_start sub_8147084
sub_8147084: @ 8147084
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147098 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0814709C @ =sub_81470CC
	str r0, [r1]
	bx lr
	.align 2, 0
_08147098: .4byte gUnknown_3005090
_0814709C: .4byte sub_81470CC
	thumb_func_end sub_8147084

	thumb_func_start sub_81470A0
sub_81470A0: @ 81470A0
	push {lr}
	bl sub_81474CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081470BC
	movs r1, 0xC0
	lsls r1, 3
	movs r0, 0x3
	movs r2, 0x1
	bl sub_8001B90
	b _081470C8
_081470BC:
	movs r1, 0xC0
	lsls r1, 3
	movs r0, 0x3
	movs r2, 0x2
	bl sub_8001B90
_081470C8:
	pop {r0}
	bx r0
	thumb_func_end sub_81470A0

	thumb_func_start sub_81470CC
sub_81470CC: @ 81470CC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08147100 @ =gUnknown_3005090
	adds r4, r1, r0
	bl sub_81470A0
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8C
	bne _081470FA
	bl sub_8055FD4
	bl sub_807DC18
	ldr r0, _08147104 @ =sub_8147108
	str r0, [r4]
_081470FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147100: .4byte gUnknown_3005090
_08147104: .4byte sub_8147108
	thumb_func_end sub_81470CC

	thumb_func_start sub_8147108
sub_8147108: @ 8147108
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81470A0
	bl sub_8055FC4
	lsls r0, 24
	cmp r0, 0
	beq _08147136
	ldr r0, _0814713C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08147136
	bl sub_8147140
	bl sub_812B484
	adds r0, r4, 0
	bl sub_8077508
_08147136:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814713C: .4byte gUnknown_2037AB8
	thumb_func_end sub_8147108

	thumb_func_start sub_8147140
sub_8147140: @ 8147140
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _081471AC @ =gUnknown_20370C4
	ldrh r0, [r1]
	cmp r0, 0xA
	bls _08147150
	movs r0, 0
	strh r0, [r1]
_08147150:
	ldrh r4, [r1]
	lsls r4, 2
	ldr r0, _081471B0 @ =gUnknown_846AEFC
	adds r4, r0
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	movs r3, 0x2
	ldrsb r3, [r4, r3]
	ldrb r4, [r4, 0x3]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl sub_805538C
	bl sub_807B004
	movs r0, 0x9
	bl sub_80722CC
	ldr r1, _081471B4 @ =gUnknown_3005020
	ldr r0, _081471B8 @ =sub_807DF64
	str r0, [r1]
	bl sub_8055378
	ldr r0, _081471BC @ =sub_805671C
	bl sub_8000544
	bl sub_80559E4
	bl sub_81473A0
	ldr r0, _081471C0 @ =gUnknown_203F3D0
	ldr r0, [r0]
	bl sub_8002BC4
	bl sub_8003ECC
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081471AC: .4byte gUnknown_20370C4
_081471B0: .4byte gUnknown_846AEFC
_081471B4: .4byte gUnknown_3005020
_081471B8: .4byte sub_807DF64
_081471BC: .4byte sub_805671C
_081471C0: .4byte gUnknown_203F3D0
	thumb_func_end sub_8147140

	thumb_func_start sub_81471C4
sub_81471C4: @ 81471C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _081472F4 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _081472F8 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_081471EA:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _081471EA
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _081472F4 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x8
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x10
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x12
	movs r1, 0
	bl sub_8000A38
	movs r0, 0xA
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x14
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x16
	movs r1, 0
	bl sub_8000A38
	movs r0, 0xC
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x18
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x1A
	movs r1, 0
	bl sub_8000A38
	movs r0, 0xE
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x1C
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x1E
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x40
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x44
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x48
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x4A
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x50
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x52
	movs r1, 0
	bl sub_8000A38
	movs r0, 0x54
	movs r1, 0
	bl sub_8000A38
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081472F4: .4byte 0x040000d4
_081472F8: .4byte 0x81000800
	thumb_func_end sub_81471C4

	thumb_func_start sub_81472FC
sub_81472FC: @ 81472FC
	push {lr}
	bl sub_8087E64
	bl sub_80773BC
	bl sub_8006B10
	bl sub_810BB8C
	bl sub_8070528
	bl sub_80088F0
	pop {r0}
	bx r0
	thumb_func_end sub_81472FC

	thumb_func_start sub_814731C
sub_814731C: @ 814731C
	push {lr}
	movs r1, 0xCA
	lsls r1, 5
	movs r0, 0
	bl sub_8000A38
	pop {r0}
	bx r0
	thumb_func_end sub_814731C

	thumb_func_start sub_814732C
sub_814732C: @ 814732C
	push {lr}
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_8001B90
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_8001D08
	pop {r0}
	bx r0
	thumb_func_end sub_814732C

	thumb_func_start sub_8147384
sub_8147384: @ 8147384
	push {lr}
	ldr r0, _08147398 @ =gUnknown_846AF78
	bl sub_8008720
	ldr r0, _0814739C @ =gUnknown_846AF90
	bl sub_8008974
	pop {r0}
	bx r0
	.align 2, 0
_08147398: .4byte gUnknown_846AF78
_0814739C: .4byte gUnknown_846AF90
	thumb_func_end sub_8147384

	thumb_func_start sub_81473A0
sub_81473A0: @ 81473A0
	push {r4,lr}
	ldr r4, _081473C0 @ =0x00000bb8
	adds r0, r4, 0
	bl sub_800874C
	movs r0, 0xFA
	lsls r0, 4
	bl sub_800874C
	adds r0, r4, 0
	bl sub_8008A30
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081473C0: .4byte 0x00000bb8
	thumb_func_end sub_81473A0

	thumb_func_start sub_81473C4
sub_81473C4: @ 81473C4
	push {r4,lr}
	ldr r0, _081473FC @ =gUnknown_846AF60
	movs r1, 0
	movs r2, 0x5C
	movs r3, 0
	bl sub_8006F8C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147400 @ =gUnknown_202063C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	movs r0, 0x30
	strh r0, [r4, 0x2E]
	bl sub_81474CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147404
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_800838C
	b _08147410
	.align 2, 0
_081473FC: .4byte gUnknown_846AF60
_08147400: .4byte gUnknown_202063C
_08147404:
	movs r0, 0xF0
	strh r0, [r4, 0x20]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x2E]
_08147410:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81473C4

	thumb_func_start sub_8147418
sub_8147418: @ 8147418
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r5, r0, 20
	strh r5, [r4, 0x24]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _08147446
	ldrh r0, [r4, 0x20]
	adds r0, r5
	lsls r0, 16
	asrs r0, 16
	bl sub_814746C
_08147446:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x96
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r4, 0x24]
	adds r0, r1
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 18
	cmp r0, r1
	bls _08147466
	adds r0, r4, 0
	bl sub_8007280
_08147466:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8147418

	thumb_func_start sub_814746C
sub_814746C: @ 814746C
	push {r4,lr}
	adds r1, r0, 0
	ldr r0, _081474A8 @ =gUnknown_846AFD0
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x5C
	movs r3, 0x8
	bl sub_8006F8C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _081474A2
	bl sub_81474CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081474A2
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _081474AC @ =gUnknown_202063C
	adds r0, r1
	movs r1, 0x1
	bl sub_800838C
_081474A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081474A8: .4byte gUnknown_846AFD0
_081474AC: .4byte gUnknown_202063C
	thumb_func_end sub_814746C

	thumb_func_start sub_81474B0
sub_81474B0: @ 81474B0
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081474C6
	adds r0, r2, 0
	bl sub_8007280
_081474C6:
	pop {r0}
	bx r0
	thumb_func_end sub_81474B0

	thumb_func_start sub_81474CC
sub_81474CC: @ 81474CC
	push {lr}
	ldr r2, _081474EC @ =gUnknown_20370C0
	ldrh r0, [r2]
	cmp r0, 0xA
	bhi _081474F8
	ldr r1, _081474F0 @ =gUnknown_846AF28
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _081474F4 @ =gUnknown_20370C4
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	b _081474FA
	.align 2, 0
_081474EC: .4byte gUnknown_20370C0
_081474F0: .4byte gUnknown_846AF28
_081474F4: .4byte gUnknown_20370C4
_081474F8:
	movs r0, 0x1
_081474FA:
	pop {r1}
	bx r1
	thumb_func_end sub_81474CC

	.align 2, 0 @ Don't pad with nop.
