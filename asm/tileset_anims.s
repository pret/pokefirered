	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ResetTilesetAnimBuffer
ResetTilesetAnimBuffer: @ 806FED8
	push {lr}
	sub sp, 0x4
	ldr r1, _0806FEF8 @ =gUnknown_3000FAC
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	str r0, [sp]
	ldr r1, _0806FEFC @ =gUnknown_2037108
	ldr r2, _0806FF00 @ =0x0500003c
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0806FEF8: .4byte gUnknown_3000FAC
_0806FEFC: .4byte gUnknown_2037108
_0806FF00: .4byte 0x0500003c
	thumb_func_end ResetTilesetAnimBuffer

	thumb_func_start AppendTilesetAnimToBuffer
AppendTilesetAnimToBuffer: @ 806FF04
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r3, _0806FF4C @ =gUnknown_3000FAC
	ldrb r0, [r3]
	cmp r0, 0x13
	bhi _0806FF44
	ldr r2, _0806FF50 @ =gUnknown_2037108
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0x4
	adds r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x8]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_0806FF44:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF4C: .4byte gUnknown_3000FAC
_0806FF50: .4byte gUnknown_2037108
	thumb_func_end AppendTilesetAnimToBuffer

	thumb_func_start TransferTilesetAnimsBuffer
TransferTilesetAnimsBuffer: @ 806FF54
	push {r4-r6,lr}
	movs r3, 0
	ldr r4, _0806FF90 @ =gUnknown_3000FAC
	adds r6, r4, 0
	ldrb r0, [r4]
	cmp r3, r0
	bge _0806FF86
	ldr r2, _0806FF94 @ =0x040000d4
	ldr r1, _0806FF98 @ =gUnknown_2037108
	movs r5, 0x80
	lsls r5, 24
_0806FF6A:
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, 0x4]
	str r0, [r2, 0x4]
	ldrh r0, [r1, 0x8]
	lsrs r0, 1
	orrs r0, r5
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, 0xC
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _0806FF6A
_0806FF86:
	movs r0, 0
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF90: .4byte gUnknown_3000FAC
_0806FF94: .4byte 0x040000d4
_0806FF98: .4byte gUnknown_2037108
	thumb_func_end TransferTilesetAnimsBuffer

	thumb_func_start cur_mapheader_run_tileset_funcs_after_some_cpuset
cur_mapheader_run_tileset_funcs_after_some_cpuset: @ 806FF9C
	push {lr}
	bl ResetTilesetAnimBuffer
	bl cur_mapheader_run_tileset1_func
	bl cur_mapheader_run_tileset2_func
	pop {r0}
	bx r0
	thumb_func_end cur_mapheader_run_tileset_funcs_after_some_cpuset

	thumb_func_start sub_806FFB0
sub_806FFB0: @ 806FFB0
	push {lr}
	bl cur_mapheader_run_tileset2_func
	pop {r0}
	bx r0
	thumb_func_end sub_806FFB0

	thumb_func_start sub_806FFBC
sub_806FFBC: @ 806FFBC
	push {r4,lr}
	bl ResetTilesetAnimBuffer
	ldr r2, _08070014 @ =sPrimaryTilesetCBCounter
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r1, _08070018 @ =sPrimaryTilesetCBBufferSize
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _0806FFDA
	movs r0, 0
	strh r0, [r2]
_0806FFDA:
	ldr r4, _0807001C @ =sSecondaryTilesetCBCounter
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r1, _08070020 @ =sSecondaryTilesetCBBufferSize
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _0806FFF2
	movs r0, 0
	strh r0, [r4]
_0806FFF2:
	ldr r0, _08070024 @ =sPrimaryTilesetCB
	ldr r1, [r0]
	cmp r1, 0
	beq _08070000
	ldrh r0, [r2]
	bl _call_via_r1
_08070000:
	ldr r0, _08070028 @ =sSecondaryTilesetCB
	ldr r1, [r0]
	cmp r1, 0
	beq _0807000E
	ldrh r0, [r4]
	bl _call_via_r1
_0807000E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070014: .4byte sPrimaryTilesetCBCounter
_08070018: .4byte sPrimaryTilesetCBBufferSize
_0807001C: .4byte sSecondaryTilesetCBCounter
_08070020: .4byte sSecondaryTilesetCBBufferSize
_08070024: .4byte sPrimaryTilesetCB
_08070028: .4byte sSecondaryTilesetCB
	thumb_func_end sub_806FFBC

	thumb_func_start cur_mapheader_run_tileset1_func
cur_mapheader_run_tileset1_func: @ 807002C
	push {lr}
	ldr r0, _08070058 @ =sPrimaryTilesetCBCounter
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0807005C @ =sPrimaryTilesetCBBufferSize
	strh r1, [r0]
	ldr r1, _08070060 @ =sPrimaryTilesetCB
	movs r0, 0
	str r0, [r1]
	ldr r0, _08070064 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08070052
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08070052
	bl _call_via_r0
_08070052:
	pop {r0}
	bx r0
	.align 2, 0
_08070058: .4byte sPrimaryTilesetCBCounter
_0807005C: .4byte sPrimaryTilesetCBBufferSize
_08070060: .4byte sPrimaryTilesetCB
_08070064: .4byte gMapHeader
	thumb_func_end cur_mapheader_run_tileset1_func

	thumb_func_start cur_mapheader_run_tileset2_func
cur_mapheader_run_tileset2_func: @ 8070068
	push {lr}
	ldr r0, _08070094 @ =sSecondaryTilesetCBCounter
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08070098 @ =sSecondaryTilesetCBBufferSize
	strh r1, [r0]
	ldr r1, _0807009C @ =sSecondaryTilesetCB
	movs r0, 0
	str r0, [r1]
	ldr r0, _080700A0 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _0807008E
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _0807008E
	bl _call_via_r0
_0807008E:
	pop {r0}
	bx r0
	.align 2, 0
_08070094: .4byte sSecondaryTilesetCBCounter
_08070098: .4byte sSecondaryTilesetCBBufferSize
_0807009C: .4byte sSecondaryTilesetCB
_080700A0: .4byte gMapHeader
	thumb_func_end cur_mapheader_run_tileset2_func

	thumb_func_start sub_80700A4
sub_80700A4: @ 80700A4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080700C8 @ =gUnknown_83A7660
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 14
	adds r0, r4
	ldr r0, [r0]
	ldr r1, _080700CC @ =0x06003f80
	movs r2, 0x80
	bl AppendTilesetAnimToBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080700C8: .4byte gUnknown_83A7660
_080700CC: .4byte 0x06003f80
	thumb_func_end sub_80700A4

	thumb_func_start sub_80700D0
sub_80700D0: @ 80700D0
	push {lr}
	lsls r0, 16
	ldr r2, _080700F0 @ =gUnknown_83AA654
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 14
	adds r1, r2
	ldr r0, [r1]
	ldr r1, _080700F4 @ =0x06003400
	movs r2, 0xC0
	lsls r2, 3
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080700F0: .4byte gUnknown_83AA654
_080700F4: .4byte 0x06003400
	thumb_func_end sub_80700D0

	thumb_func_start sub_80700F8
sub_80700F8: @ 80700F8
	push {lr}
	lsls r0, 16
	ldr r2, _08070118 @ =gUnknown_83AB874
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 14
	adds r1, r2
	ldr r0, [r1]
	ldr r1, _0807011C @ =0x06003a00
	movs r2, 0x90
	lsls r2, 2
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08070118: .4byte gUnknown_83AB874
_0807011C: .4byte 0x06003a00
	thumb_func_end sub_80700F8

	thumb_func_start sub_8070120
sub_8070120: @ 8070120
	push {r4-r6,lr}
	lsls r5, r0, 16
	lsrs r6, r5, 16
	movs r0, 0x7
	ands r0, r6
	cmp r0, 0
	bne _08070134
	lsrs r0, r5, 19
	bl sub_80700F8
_08070134:
	movs r4, 0xF
	ands r4, r6
	cmp r4, 0x1
	bne _08070142
	lsrs r0, r5, 20
	bl sub_80700D0
_08070142:
	cmp r4, 0x2
	bne _0807014C
	lsrs r0, r5, 20
	bl sub_80700A4
_0807014C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8070120

	thumb_func_start sub_8070154
sub_8070154: @ 8070154
	ldr r1, _0807016C @ =sPrimaryTilesetCBCounter
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08070170 @ =sPrimaryTilesetCBBufferSize
	movs r2, 0xA0
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08070174 @ =sPrimaryTilesetCB
	ldr r0, _08070178 @ =sub_8070120
	str r0, [r1]
	bx lr
	.align 2, 0
_0807016C: .4byte sPrimaryTilesetCBCounter
_08070170: .4byte sPrimaryTilesetCBBufferSize
_08070174: .4byte sPrimaryTilesetCB
_08070178: .4byte sub_8070120
	thumb_func_end sub_8070154

	thumb_func_start sub_807017C
sub_807017C: @ 807017C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080701A4 @ =gUnknown_83ABDB4
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 14
	adds r0, r4
	ldr r0, [r0]
	ldr r1, _080701A8 @ =0x06005d00
	movs r2, 0x80
	lsls r2, 1
	bl AppendTilesetAnimToBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080701A4: .4byte gUnknown_83ABDB4
_080701A8: .4byte 0x06005d00
	thumb_func_end sub_807017C

	thumb_func_start sub_80701AC
sub_80701AC: @ 80701AC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0xC
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080701D0
	adds r0, r4, 0
	movs r1, 0xC
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	bl sub_807017C
_080701D0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80701AC

	thumb_func_start sub_80701D8
sub_80701D8: @ 80701D8
	ldr r1, _080701EC @ =sSecondaryTilesetCBCounter
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080701F0 @ =sSecondaryTilesetCBBufferSize
	movs r0, 0x78
	strh r0, [r1]
	ldr r1, _080701F4 @ =sSecondaryTilesetCB
	ldr r0, _080701F8 @ =sub_80701AC
	str r0, [r1]
	bx lr
	.align 2, 0
_080701EC: .4byte sSecondaryTilesetCBCounter
_080701F0: .4byte sSecondaryTilesetCBBufferSize
_080701F4: .4byte sSecondaryTilesetCB
_080701F8: .4byte sub_80701AC
	thumb_func_end sub_80701D8

	thumb_func_start sub_80701FC
sub_80701FC: @ 80701FC
	push {lr}
	lsls r0, 16
	ldr r2, _0807021C @ =gUnknown_83AC1E8
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 14
	adds r1, r2
	ldr r0, [r1]
	ldr r1, _08070220 @ =0x06007a00
	movs r2, 0x80
	lsls r2, 1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0807021C: .4byte gUnknown_83AC1E8
_08070220: .4byte 0x06007a00
	thumb_func_end sub_80701FC

	thumb_func_start sub_8070224
sub_8070224: @ 8070224
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _08070248
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	bl sub_80701FC
_08070248:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8070224

	thumb_func_start sub_8070250
sub_8070250: @ 8070250
	ldr r1, _08070264 @ =sSecondaryTilesetCBCounter
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08070268 @ =sSecondaryTilesetCBBufferSize
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _0807026C @ =sSecondaryTilesetCB
	ldr r0, _08070270 @ =sub_8070224
	str r0, [r1]
	bx lr
	.align 2, 0
_08070264: .4byte sSecondaryTilesetCBCounter
_08070268: .4byte sSecondaryTilesetCBBufferSize
_0807026C: .4byte sSecondaryTilesetCB
_08070270: .4byte sub_8070224
	thumb_func_end sub_8070250

	thumb_func_start sub_8070274
sub_8070274: @ 8070274
	push {lr}
	lsls r0, 16
	ldr r2, _08070294 @ =gUnknown_83AC5F8
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 14
	adds r1, r2
	ldr r0, [r1]
	ldr r1, _08070298 @ =0x06007000
	movs r2, 0x80
	lsls r2, 1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08070294: .4byte gUnknown_83AC5F8
_08070298: .4byte 0x06007000
	thumb_func_end sub_8070274

	thumb_func_start sub_807029C
sub_807029C: @ 807029C
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	bne _080702B0
	lsrs r0, r1, 20
	bl sub_8070274
_080702B0:
	pop {r0}
	bx r0
	thumb_func_end sub_807029C

	thumb_func_start sub_80702B4
sub_80702B4: @ 80702B4
	ldr r1, _080702CC @ =sSecondaryTilesetCBCounter
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080702D0 @ =sSecondaryTilesetCBBufferSize
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080702D4 @ =sSecondaryTilesetCB
	ldr r0, _080702D8 @ =sub_807029C
	str r0, [r1]
	bx lr
	.align 2, 0
_080702CC: .4byte sSecondaryTilesetCBCounter
_080702D0: .4byte sSecondaryTilesetCBBufferSize
_080702D4: .4byte sSecondaryTilesetCB
_080702D8: .4byte sub_807029C
	thumb_func_end sub_80702B4

	thumb_func_start sub_80702DC
sub_80702DC: @ 80702DC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _080702FC @ =gUnknown_83AC7C8
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08070300 @ =0x06006e00
	movs r2, 0xE0
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080702FC: .4byte gUnknown_83AC7C8
_08070300: .4byte 0x06006e00
	thumb_func_end sub_80702DC

	thumb_func_start sub_8070304
sub_8070304: @ 8070304
	push {lr}
	lsls r2, r0, 16
	lsrs r0, r2, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08070318
	lsrs r0, r2, 17
	bl sub_80702DC
_08070318:
	pop {r0}
	bx r0
	thumb_func_end sub_8070304

	thumb_func_start sub_807031C
sub_807031C: @ 807031C
	ldr r1, _08070330 @ =sSecondaryTilesetCBCounter
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08070334 @ =sSecondaryTilesetCBBufferSize
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _08070338 @ =sSecondaryTilesetCB
	ldr r0, _0807033C @ =sub_8070304
	str r0, [r1]
	bx lr
	.align 2, 0
_08070330: .4byte sSecondaryTilesetCBCounter
_08070334: .4byte sSecondaryTilesetCBBufferSize
_08070338: .4byte sSecondaryTilesetCB
_0807033C: .4byte sub_8070304
	thumb_func_end sub_807031C

	thumb_func_start sub_8070340
sub_8070340: @ 8070340
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08070360 @ =gUnknown_83AC950
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08070364 @ =0x06005c60
	movs r2, 0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08070360: .4byte gUnknown_83AC950
_08070364: .4byte 0x06005c60
	thumb_func_end sub_8070340

	thumb_func_start sub_8070368
sub_8070368: @ 8070368
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	bne _0807037C
	lsrs r0, r1, 20
	bl sub_8070340
_0807037C:
	pop {r0}
	bx r0
	thumb_func_end sub_8070368

	thumb_func_start sub_8070380
sub_8070380: @ 8070380
	ldr r1, _08070398 @ =sSecondaryTilesetCBCounter
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807039C @ =sSecondaryTilesetCBBufferSize
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080703A0 @ =sSecondaryTilesetCB
	ldr r0, _080703A4 @ =sub_8070368
	str r0, [r1]
	bx lr
	.align 2, 0
_08070398: .4byte sSecondaryTilesetCBCounter
_0807039C: .4byte sSecondaryTilesetCBBufferSize
_080703A0: .4byte sSecondaryTilesetCB
_080703A4: .4byte sub_8070368
	thumb_func_end sub_8070380

	.align 2, 0 @ Don't pad with nop.
