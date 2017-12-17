	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80EB658
sub_80EB658: @ 80EB658
	push {r4-r6,lr}
	movs r4, 0
	bl sub_809A2A4
	ldr r1, _080EB6A8 @ =gUnknown_8402220
	ldrh r0, [r1]
	cmp r0, 0
	beq _080EB6A0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _080EB6A0
	adds r5, r1, 0
	adds r6, r5, 0x2
_080EB672:
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	adds r1, r6
	ldrh r1, [r1]
	bl sub_809A3C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080EB6A0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _080EB6A0
	adds r0, r1, r6
	ldrh r0, [r0]
	cmp r0, 0
	bne _080EB672
_080EB6A0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB6A8: .4byte gUnknown_8402220
	thumb_func_end sub_80EB658

	thumb_func_start sub_80EB6AC
sub_80EB6AC: @ 80EB6AC
	push {lr}
	ldr r1, _080EB6E0 @ =gUnknown_203AAC4
	movs r0, 0
	strb r0, [r1, 0x9]
	bl sub_812B234
	ldr r1, _080EB6E4 @ =gUnknown_203AABC
	ldr r0, _080EB6E8 @ =gUnknown_8402200
	str r0, [r1]
	ldr r1, _080EB6EC @ =gUnknown_203AAC0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _080EB6F0 @ =nullsub_43
	movs r1, 0
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EB6F4 @ =gUnknown_8416262
	ldr r3, _080EB6F8 @ =sub_80EB74C
	movs r1, 0x2
	bl sub_80F7808
	pop {r0}
	bx r0
	.align 2, 0
_080EB6E0: .4byte gUnknown_203AAC4
_080EB6E4: .4byte gUnknown_203AABC
_080EB6E8: .4byte gUnknown_8402200
_080EB6EC: .4byte gUnknown_203AAC0
_080EB6F0: .4byte nullsub_43
_080EB6F4: .4byte gUnknown_8416262
_080EB6F8: .4byte sub_80EB74C
	thumb_func_end sub_80EB6AC

	thumb_func_start sub_80EB6FC
sub_80EB6FC: @ 80EB6FC
	push {lr}
	ldr r1, _080EB730 @ =gUnknown_203AAC4
	movs r0, 0x1
	strb r0, [r1, 0x9]
	bl sub_812B234
	ldr r1, _080EB734 @ =gUnknown_203AABC
	ldr r0, _080EB738 @ =gUnknown_8402203
	str r0, [r1]
	ldr r1, _080EB73C @ =gUnknown_203AAC0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _080EB740 @ =nullsub_43
	movs r1, 0
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EB744 @ =gUnknown_8416262
	ldr r3, _080EB748 @ =sub_80EB74C
	movs r1, 0x2
	bl sub_80F7808
	pop {r0}
	bx r0
	.align 2, 0
_080EB730: .4byte gUnknown_203AAC4
_080EB734: .4byte gUnknown_203AABC
_080EB738: .4byte gUnknown_8402203
_080EB73C: .4byte gUnknown_203AAC0
_080EB740: .4byte nullsub_43
_080EB744: .4byte gUnknown_8416262
_080EB748: .4byte sub_80EB74C
	thumb_func_end sub_80EB6FC

	thumb_func_start sub_80EB74C
sub_80EB74C: @ 80EB74C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _080EB770 @ =gUnknown_3005098
	adds r7, r0, r1
	ldr r0, _080EB774 @ =gUnknown_203AAC0
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080EB77C
	ldr r0, _080EB778 @ =gUnknown_8402248
	b _080EB77E
	.align 2, 0
_080EB770: .4byte gUnknown_3005098
_080EB774: .4byte gUnknown_203AAC0
_080EB778: .4byte gUnknown_8402248
_080EB77C:
	ldr r0, _080EB804 @ =gUnknown_8402250
_080EB77E:
	bl sub_8003CE4
	strh r0, [r7, 0x14]
	ldrb r0, [r7, 0x14]
	movs r1, 0
	bl sub_80F7750
	movs r0, 0x2
	movs r1, 0
	bl sub_80F7AC0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x2
	bl sub_80F79D8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r7, 0x14]
	str r0, [sp]
	movs r6, 0x10
	str r6, [sp, 0x4]
	ldr r5, _080EB808 @ =gUnknown_203AAC0
	ldrb r0, [r5]
	str r0, [sp, 0x8]
	ldr r0, _080EB80C @ =gUnknown_84021E8
	str r0, [sp, 0xC]
	ldr r0, _080EB810 @ =gUnknown_203AABC
	ldr r0, [r0]
	str r0, [sp, 0x10]
	adds r0, r1, 0
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x2
	bl sub_810FCD0
	ldrb r0, [r7, 0x14]
	str r6, [sp]
	ldrb r1, [r5]
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	movs r0, 0
	bl sub_80F67A4
	ldr r1, _080EB814 @ =gUnknown_3005090
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _080EB818 @ =sub_80EB81C
	str r1, [r0]
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB804: .4byte gUnknown_8402250
_080EB808: .4byte gUnknown_203AAC0
_080EB80C: .4byte gUnknown_84021E8
_080EB810: .4byte gUnknown_203AABC
_080EB814: .4byte gUnknown_3005090
_080EB818: .4byte sub_80EB81C
	thumb_func_end sub_80EB74C

	thumb_func_start sub_80EB81C
sub_80EB81C: @ 80EB81C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _080EB870 @ =gUnknown_3005098
	adds r4, r6, r7
	bl sub_810FA04
	lsls r0, 24
	asrs r5, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _080EB8AC
	adds r0, 0x1
	cmp r5, r0
	bne _080EB878
	movs r0, 0x5
	bl sub_80722CC
	ldrb r0, [r4, 0x14]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4, 0x14]
	bl sub_80040B8
	ldrb r0, [r4, 0x14]
	bl sub_8003E3C
	movs r0, 0
	bl sub_80F67A4
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080EB874 @ =sub_80EB9B8
	str r1, [r0]
	b _080EB8AC
	.align 2, 0
_080EB870: .4byte gUnknown_3005098
_080EB874: .4byte sub_80EB9B8
_080EB878:
	ldrb r0, [r4, 0x14]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4, 0x14]
	bl sub_80040B8
	ldrb r0, [r4, 0x14]
	bl sub_8003E3C
	movs r0, 0
	bl sub_80F67A4
	adds r2, r7, 0
	subs r2, 0x8
	adds r2, r6, r2
	ldr r1, _080EB8B4 @ =gUnknown_84021E8
	ldr r0, _080EB8B8 @ =gUnknown_203AABC
	ldr r0, [r0]
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
_080EB8AC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB8B4: .4byte gUnknown_84021E8
_080EB8B8: .4byte gUnknown_203AABC
	thumb_func_end sub_80EB81C

	thumb_func_start sub_80EB8BC
sub_80EB8BC: @ 80EB8BC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_812B248
	ldr r2, _080EB8DC @ =gUnknown_8416262
	ldr r3, _080EB8E0 @ =sub_80EB74C
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_80F7808
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB8DC: .4byte gUnknown_8416262
_080EB8E0: .4byte sub_80EB74C
	thumb_func_end sub_80EB8BC

	thumb_func_start sub_80EB8E4
sub_80EB8E4: @ 80EB8E4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_80EB9E8
	ldr r1, _080EB908 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080EB90C @ =sub_80EBAB8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB908: .4byte gUnknown_3005090
_080EB90C: .4byte sub_80EBAB8
	thumb_func_end sub_80EB8E4

	thumb_func_start sub_80EB910
sub_80EB910: @ 80EB910
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80EBDC8
	ldr r4, _080EB934 @ =gUnknown_203AAC4
	movs r1, 0
	strb r0, [r4, 0x5]
	lsls r0, 24
	cmp r0, 0
	bne _080EB940
	ldr r2, _080EB938 @ =gUnknown_84177EE
	ldr r3, _080EB93C @ =sub_80EB8BC
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_80F7808
	b _080EB9A8
	.align 2, 0
_080EB934: .4byte gUnknown_203AAC4
_080EB938: .4byte gUnknown_84177EE
_080EB93C: .4byte sub_80EB8BC
_080EB940:
	strh r1, [r4]
	strh r1, [r4, 0x2]
	bl sub_80EBE04
	adds r0, r5, 0
	bl sub_80EBD88
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	bne _080EB95C
	movs r0, 0x22
	bl sub_812B1F0
	b _080EB962
_080EB95C:
	movs r0, 0x1E
	bl sub_812B1F0
_080EB962:
	ldr r0, _080EB990 @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x5]
	bl sub_810EB6C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080EB99C
	movs r0, 0
	movs r1, 0
	bl sub_80F6F54
	adds r0, r5, 0
	bl sub_80EBEB0
	ldr r0, _080EB994 @ =gUnknown_3005090
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080EB998 @ =sub_80EBF40
	str r0, [r1]
	b _080EB9A8
	.align 2, 0
_080EB990: .4byte gUnknown_203AAC4
_080EB994: .4byte gUnknown_3005090
_080EB998: .4byte sub_80EBF40
_080EB99C:
	ldr r2, _080EB9B0 @ =gUnknown_84177EE
	ldr r3, _080EB9B4 @ =sub_80EB8BC
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_80F7808
_080EB9A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EB9B0: .4byte gUnknown_84177EE
_080EB9B4: .4byte sub_80EB8BC
	thumb_func_end sub_80EB910

	thumb_func_start sub_80EB9B8
sub_80EB9B8: @ 80EB9B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EB9D0 @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _080EB9D8
	ldr r0, _080EB9D4 @ =gUnknown_8168D17
	bl sub_8069AE4
	b _080EB9DC
	.align 2, 0
_080EB9D0: .4byte gUnknown_203AAC4
_080EB9D4: .4byte gUnknown_8168D17
_080EB9D8:
	bl sub_8069B34
_080EB9DC:
	adds r0, r4, 0
	bl sub_8077508
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EB9B8

	thumb_func_start sub_80EB9E8
sub_80EB9E8: @ 80EB9E8
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080EBA10 @ =gUnknown_3005098
	adds r6, r1, r0
	ldr r0, _080EBA14 @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _080EBA18
	movs r0, 0x21
	bl sub_812B1F0
	b _080EBA1E
	.align 2, 0
_080EBA10: .4byte gUnknown_3005098
_080EBA14: .4byte gUnknown_203AAC4
_080EBA18:
	movs r0, 0x1D
	bl sub_812B1F0
_080EBA1E:
	ldr r0, _080EBA80 @ =gUnknown_8402258
	bl sub_8003CE4
	strh r0, [r6, 0x14]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80F7750
	movs r0, 0x2
	movs r1, 0
	bl sub_80F7AC0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r6, 0x14]
	movs r5, 0x10
	str r5, [sp]
	movs r4, 0x3
	str r4, [sp, 0x4]
	ldr r1, _080EBA84 @ =gUnknown_8402208
	str r1, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0x2
	bl sub_810FB6C
	ldrb r0, [r6, 0x14]
	str r5, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	movs r0, 0
	bl sub_80F67A4
	ldr r1, _080EBA88 @ =gUnknown_84021DC
	lsls r0, r7, 2
	adds r0, r1
	ldr r0, [r0]
	bl sub_80EBA8C
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBA80: .4byte gUnknown_8402258
_080EBA84: .4byte gUnknown_8402208
_080EBA88: .4byte gUnknown_84021DC
	thumb_func_end sub_80EB9E8

	thumb_func_start sub_80EBA8C
sub_80EBA8C: @ 80EBA8C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0
	bl sub_80F6EE4
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0
	bl sub_8002C48
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EBA8C

	thumb_func_start sub_80EBAB8
sub_80EBAB8: @ 80EBAB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _080EBAE4 @ =gUnknown_30030F0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080EBAE8
	bl sub_810F98C
	lsls r0, 24
	cmp r0, 0
	beq _080EBB64
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x1
	negs r0, r0
	b _080EBB04
	.align 2, 0
_080EBAE4: .4byte gUnknown_30030F0
_080EBAE8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EBB20
	bl sub_810F98C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080EBB64
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0x1
_080EBB04:
	bl sub_810F904
	ldr r4, _080EBB1C @ =gUnknown_84021DC
	bl sub_810F98C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	bl sub_80EBA8C
	b _080EBB64
	.align 2, 0
_080EBB1C: .4byte gUnknown_84021DC
_080EBB20:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EBB4C
	movs r0, 0x5
	bl sub_80722CC
	ldr r4, _080EBB48 @ =gUnknown_8402208
	bl sub_810F98C
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _080EBB64
	.align 2, 0
_080EBB48: .4byte gUnknown_8402208
_080EBB4C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080EBB64
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _080EBB6C @ =gUnknown_8402208
	ldr r1, [r0, 0x14]
	adds r0, r4, 0
	bl _call_via_r1
_080EBB64:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EBB6C: .4byte gUnknown_8402208
	thumb_func_end sub_80EBAB8

	thumb_func_start sub_80EBB70
sub_80EBB70: @ 80EBB70
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EBBA4 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EBB9C
	bl sub_80563F0
	ldr r2, _080EBBA8 @ =sub_80567DC
	movs r0, 0x3
	movs r1, 0
	bl sub_8107DB4
	ldr r1, _080EBBAC @ =gUnknown_3005020
	ldr r0, _080EBBB0 @ =sub_80EBC0C
	str r0, [r1]
	adds r0, r4, 0
	bl sub_8077508
_080EBB9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EBBA4: .4byte gUnknown_2037AB8
_080EBBA8: .4byte sub_80567DC
_080EBBAC: .4byte gUnknown_3005020
_080EBBB0: .4byte sub_80EBC0C
	thumb_func_end sub_80EBB70

	thumb_func_start sub_80EBBB4
sub_80EBBB4: @ 80EBBB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EBBD4 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080EBBD8 @ =sub_80EBB70
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0
	bl sub_807A818
	pop {r0}
	bx r0
	.align 2, 0
_080EBBD4: .4byte gUnknown_3005090
_080EBBD8: .4byte sub_80EBB70
	thumb_func_end sub_80EBBB4

	thumb_func_start sub_80EBBDC
sub_80EBBDC: @ 80EBBDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080EBBFC
	ldr r0, _080EBC04 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080EBC08 @ =sub_80EBAB8
	str r0, [r1]
_080EBBFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EBC04: .4byte gUnknown_3005090
_080EBC08: .4byte sub_80EBAB8
	thumb_func_end sub_80EBBDC

	thumb_func_start sub_80EBC0C
sub_80EBC0C: @ 80EBC0C
	push {lr}
	bl sub_80F6E9C
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6EE4
	ldr r0, _080EBC34 @ =sub_80EBBDC
	movs r1, 0
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_80EB9E8
	bl sub_807DC00
	pop {r0}
	bx r0
	.align 2, 0
_080EBC34: .4byte sub_80EBBDC
	thumb_func_end sub_80EBC0C

	thumb_func_start sub_80EBC38
sub_80EBC38: @ 80EBC38
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _080EBC6C @ =gUnknown_3005098
	adds r4, r6, r7
	bl sub_809A33C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	cmp r0, 0
	beq _080EBC7C
	movs r0, 0
	strh r0, [r4, 0xC]
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080EBC70 @ =sub_80EBD18
	str r1, [r0]
	ldr r1, _080EBC74 @ =gUnknown_3005020
	ldr r0, _080EBC78 @ =sub_80EBCAC
	str r0, [r1]
	b _080EBC9C
	.align 2, 0
_080EBC6C: .4byte gUnknown_3005098
_080EBC70: .4byte sub_80EBD18
_080EBC74: .4byte gUnknown_3005020
_080EBC78: .4byte sub_80EBCAC
_080EBC7C:
	ldrb r0, [r4, 0x14]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4, 0x14]
	bl sub_80040B8
	ldrb r0, [r4, 0x14]
	bl sub_8003E3C
	ldr r2, _080EBCA4 @ =gUnknown_8417774
	ldr r3, _080EBCA8 @ =sub_80EB8E4
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_80F7808
_080EBC9C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBCA4: .4byte gUnknown_8417774
_080EBCA8: .4byte sub_80EB8E4
	thumb_func_end sub_80EBC38

	thumb_func_start sub_80EBCAC
sub_80EBCAC: @ 80EBCAC
	push {lr}
	bl sub_80F6E9C
	movs r0, 0
	movs r1, 0x1
	bl sub_80F6EE4
	ldr r0, _080EBCD4 @ =sub_80EBBDC
	movs r1, 0
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80EB9E8
	bl sub_807DC00
	pop {r0}
	bx r0
	.align 2, 0
_080EBCD4: .4byte sub_80EBBDC
	thumb_func_end sub_80EBCAC

	thumb_func_start sub_80EBCD8
sub_80EBCD8: @ 80EBCD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080EBD0C @ =gUnknown_3005098
	adds r5, r0, r1
	ldr r0, _080EBD10 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EBD06
	bl sub_80563F0
	ldrb r0, [r5, 0xC]
	ldr r1, _080EBD14 @ =sub_80567DC
	bl sub_810D3F4
	adds r0, r4, 0
	bl sub_8077508
_080EBD06:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EBD0C: .4byte gUnknown_3005098
_080EBD10: .4byte gUnknown_2037AB8
_080EBD14: .4byte sub_80567DC
	thumb_func_end sub_80EBCD8

	thumb_func_start sub_80EBD18
sub_80EBD18: @ 80EBD18
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EBD40 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080EBD44 @ =sub_80EBCD8
	str r0, [r1]
	movs r0, 0
	bl sub_810DE94
	movs r0, 0x1
	movs r1, 0
	bl sub_807A818
	pop {r0}
	bx r0
	.align 2, 0
_080EBD40: .4byte gUnknown_3005090
_080EBD44: .4byte sub_80EBCD8
	thumb_func_end sub_80EBD18

	thumb_func_start sub_80EBD48
sub_80EBD48: @ 80EBD48
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080EBD84 @ =gUnknown_3005098
	adds r4, r0
	ldrb r0, [r4, 0x14]
	movs r1, 0
	bl sub_810F4D8
	ldrb r0, [r4, 0x14]
	bl sub_80040B8
	ldrb r0, [r4, 0x14]
	movs r1, 0x1
	bl sub_8003F20
	ldrb r0, [r4, 0x14]
	bl sub_8003E3C
	adds r0, r5, 0
	bl sub_80EB8BC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EBD84: .4byte gUnknown_3005098
	thumb_func_end sub_80EBD48

	thumb_func_start sub_80EBD88
sub_80EBD88: @ 80EBD88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080EBDA8 @ =gUnknown_3005098
	adds r1, r0
	ldrh r2, [r1, 0x4]
	movs r3, 0x4
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	ble _080EBDAC
	movs r0, 0x8
	b _080EBDAE
	.align 2, 0
_080EBDA8: .4byte gUnknown_3005098
_080EBDAC:
	adds r0, r2, 0x1
_080EBDAE:
	strh r0, [r1, 0x8]
	ldr r1, _080EBDBC @ =gUnknown_203AAC4
	ldrb r0, [r1, 0x5]
	cmp r0, 0x7
	bls _080EBDC0
	movs r0, 0x8
	b _080EBDC2
	.align 2, 0
_080EBDBC: .4byte gUnknown_203AAC4
_080EBDC0:
	adds r0, 0x1
_080EBDC2:
	strb r0, [r1, 0x4]
	pop {r0}
	bx r0
	thumb_func_end sub_80EBD88

	thumb_func_start sub_80EBDC8
sub_80EBDC8: @ 80EBDC8
	push {r4,lr}
	movs r2, 0
	movs r1, 0x6
	ldr r0, _080EBDFC @ =gUnknown_3005008
	ldr r3, [r0]
	ldr r4, _080EBE00 @ =0x00002cf0
_080EBDD4:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	beq _080EBDEA
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080EBDEA:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080EBDD4
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EBDFC: .4byte gUnknown_3005008
_080EBE00: .4byte 0x00002cf0
	thumb_func_end sub_80EBDC8

	thumb_func_start sub_80EBE04
sub_80EBE04: @ 80EBE04
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	movs r2, 0x6
_080EBE12:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r4, r0, 24
	mov r8, r1
	cmp r4, 0xF
	bhi _080EBE8A
	ldr r0, _080EBEA4 @ =gUnknown_3005008
	mov r10, r0
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	mov r12, r0
	ldr r6, _080EBEA8 @ =0x00002cd0
_080EBE2C:
	mov r1, r10
	ldr r1, [r1]
	mov r9, r1
	mov r2, r9
	add r2, r12
	ldr r3, _080EBEAC @ =0x00002cf0
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _080EBE80
	adds r2, r6
	mov r1, sp
	adds r0, r2, 0
	ldm r0!, {r3,r5,r7}
	stm r1!, {r3,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r1!, {r3,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r1!, {r3,r5,r7}
	lsls r3, r4, 3
	adds r3, r4
	lsls r3, 2
	mov r5, r9
	adds r0, r5, r3
	adds r0, r6
	ldm r0!, {r1,r5,r7}
	stm r2!, {r1,r5,r7}
	ldm r0!, {r1,r5,r7}
	stm r2!, {r1,r5,r7}
	ldm r0!, {r1,r5,r7}
	stm r2!, {r1,r5,r7}
	mov r7, r10
	ldr r1, [r7]
	adds r1, r3
	adds r1, r6
	mov r0, sp
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r5,r7}
	stm r1!, {r2,r5,r7}
_080EBE80:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080EBE2C
_080EBE8A:
	mov r3, r8
	lsls r0, r3, 24
	lsrs r2, r0, 24
	cmp r2, 0xE
	bls _080EBE12
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBEA4: .4byte gUnknown_3005008
_080EBEA8: .4byte 0x00002cd0
_080EBEAC: .4byte 0x00002cf0
	thumb_func_end sub_80EBE04

	thumb_func_start sub_80EBEB0
sub_80EBEB0: @ 80EBEB0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0
	bl sub_810EBAC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080EBF34 @ =gUnknown_84176FE
	mov r8, r0
	movs r0, 0x2
	mov r1, r8
	movs r2, 0
	bl sub_8005ED4
	adds r5, r0, 0
	movs r0, 0x1
	bl sub_810EBAC
	movs r3, 0x50
	subs r3, r5
	lsrs r0, r3, 31
	adds r3, r0
	asrs r3, 1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, r8
	bl sub_8002C48
	movs r0, 0
	bl sub_80F67A4
	ldr r4, _080EBF38 @ =gUnknown_203AAC4
	adds r0, r4, 0
	bl sub_810EC98
	ldr r2, _080EBF3C @ =gUnknown_3005090
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x1E]
	adds r0, r4, 0
	bl sub_810ED80
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EBF34: .4byte gUnknown_84176FE
_080EBF38: .4byte gUnknown_203AAC4
_080EBF3C: .4byte gUnknown_3005090
	thumb_func_end sub_80EBEB0

	thumb_func_start sub_80EBF40
sub_80EBF40: @ 80EBF40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	mov r9, r0
	ldr r0, _080EBF94 @ =gUnknown_3005098
	mov r10, r0
	mov r4, r9
	add r4, r10
	ldr r0, _080EBF98 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EBFEA
	ldrb r0, [r4, 0x16]
	bl sub_8107078
	adds r6, r0, 0
	ldrb r0, [r4, 0x16]
	ldr r7, _080EBF9C @ =gUnknown_203AAC6
	subs r1, r7, 0x2
	mov r8, r1
	adds r1, r7, 0
	mov r2, r8
	bl sub_81072D4
	movs r0, 0x2
	negs r0, r0
	cmp r6, r0
	beq _080EBFA0
	adds r0, 0x1
	cmp r6, r0
	bne _080EBFB6
	b _080EBFEA
	.align 2, 0
_080EBF94: .4byte gUnknown_3005098
_080EBF98: .4byte gUnknown_2037AB8
_080EBF9C: .4byte gUnknown_203AAC6
_080EBFA0:
	movs r0, 0x5
	bl sub_80722CC
	mov r1, r8
	ldrb r0, [r1, 0xA]
	bl sub_8133C30
	adds r0, r5, 0
	bl sub_80EC094
	b _080EBFEA
_080EBFB6:
	movs r0, 0x5
	bl sub_80722CC
	movs r0, 0
	bl sub_810EBE0
	movs r0, 0x1
	bl sub_810EBE0
	ldrb r0, [r4, 0x16]
	adds r1, r7, 0
	mov r2, r8
	bl sub_810713C
	movs r0, 0
	bl sub_80F67A4
	mov r1, r8
	ldrb r0, [r1, 0xA]
	bl sub_8133C30
	mov r0, r10
	subs r0, 0x8
	add r0, r9
	ldr r1, _080EBFF8 @ =sub_80EBFFC
	str r1, [r0]
_080EBFEA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBFF8: .4byte sub_80EBFFC
	thumb_func_end sub_80EBF40

	thumb_func_start sub_80EBFFC
sub_80EBFFC: @ 80EBFFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080EC054 @ =gUnknown_2021CD0
	ldr r2, _080EC058 @ =gUnknown_3005008
	ldr r1, _080EC05C @ =gUnknown_203AAC4
	ldrh r0, [r1]
	adds r0, 0x6
	ldrh r1, [r1, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, [r2]
	adds r1, r0
	ldr r0, _080EC060 @ =0x00002ce2
	adds r1, r0
	adds r0, r4, 0
	bl sub_8008D84
	adds r0, r4, 0
	bl sub_8008E08
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x5
	ble _080EC064
	subs r0, r4, 0x1
	adds r1, r0
	cmp r1, r4
	bcc _080EC06C
	ldrb r0, [r1]
	cmp r0, 0
	bne _080EC06C
	movs r3, 0xFF
	adds r2, r4, 0
_080EC044:
	strb r3, [r1]
	subs r1, 0x1
	cmp r1, r2
	bcc _080EC06C
	ldrb r0, [r1]
	cmp r0, 0
	beq _080EC044
	b _080EC06C
	.align 2, 0
_080EC054: .4byte gUnknown_2021CD0
_080EC058: .4byte gUnknown_3005008
_080EC05C: .4byte gUnknown_203AAC4
_080EC060: .4byte 0x00002ce2
_080EC064:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80093BC
_080EC06C:
	ldr r4, _080EC088 @ =gUnknown_2021D18
	ldr r1, _080EC08C @ =gUnknown_8417806
	adds r0, r4, 0
	bl sub_8008FCC
	ldr r3, _080EC090 @ =sub_80EC0D8
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_80F7808
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EC088: .4byte gUnknown_2021D18
_080EC08C: .4byte gUnknown_8417806
_080EC090: .4byte sub_80EC0D8
	thumb_func_end sub_80EBFFC

	thumb_func_start sub_80EC094
sub_80EC094: @ 80EC094
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080EC0D4 @ =gUnknown_3005098
	adds r4, r0
	movs r0, 0
	bl sub_810EBE0
	movs r0, 0x1
	bl sub_810EBE0
	ldrb r0, [r4, 0x16]
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	movs r0, 0
	bl sub_80F67A4
	bl sub_810EDB0
	adds r0, r5, 0
	bl sub_80EB8BC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EC0D4: .4byte gUnknown_3005098
	thumb_func_end sub_80EC094

	thumb_func_start sub_80EC0D8
sub_80EC0D8: @ 80EC0D8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x2
	bl sub_810EBAC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0
	bl sub_80F7AC0
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x10
	mov r8, r0
	str r0, [sp]
	movs r6, 0x4
	str r6, [sp, 0x4]
	ldr r0, _080EC150 @ =gUnknown_8402228
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x2
	movs r3, 0x2
	bl sub_810FB6C
	mov r0, r8
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl sub_810F7D8
	movs r0, 0
	bl sub_80F67A4
	ldr r1, _080EC154 @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080EC158 @ =sub_80EC15C
	str r1, [r0]
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EC150: .4byte gUnknown_8402228
_080EC154: .4byte gUnknown_3005090
_080EC158: .4byte sub_80EC15C
	thumb_func_end sub_80EC0D8

	thumb_func_start sub_80EC15C
sub_80EC15C: @ 80EC15C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl sub_810FA84
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _080EC19E
	adds r0, 0x1
	cmp r4, r0
	bne _080EC188
	movs r0, 0x5
	bl sub_80722CC
	adds r0, r5, 0
	bl sub_80EC574
	b _080EC19E
_080EC188:
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _080EC1A4 @ =gUnknown_8402228
	lsls r1, r4, 3
	adds r0, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r6, 0
	bl _call_via_r1
_080EC19E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EC1A4: .4byte gUnknown_8402228
	thumb_func_end sub_80EC15C

	thumb_func_start sub_80EC1A8
sub_80EC1A8: @ 80EC1A8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl sub_807A818
	ldr r1, _080EC1CC @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080EC1D0 @ =sub_80EC1D4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC1CC: .4byte gUnknown_3005090
_080EC1D0: .4byte sub_80EC1D4
	thumb_func_end sub_80EC1A8

	thumb_func_start sub_80EC1D4
sub_80EC1D4: @ 80EC1D4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EC21C @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EC216
	bl sub_810EDB0
	bl sub_80563F0
	ldr r2, _080EC220 @ =gUnknown_3005008
	ldr r1, _080EC224 @ =gUnknown_203AAC4
	ldrh r0, [r1]
	adds r0, 0x6
	ldrh r1, [r1, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080EC228 @ =0x00002cd0
	adds r1, r0
	ldr r0, [r2]
	adds r0, r1
	ldr r1, _080EC22C @ =sub_80EC2C0
	movs r2, 0x1
	bl sub_80BEBEC
	adds r0, r4, 0
	bl sub_8077508
_080EC216:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC21C: .4byte gUnknown_2037AB8
_080EC220: .4byte gUnknown_3005008
_080EC224: .4byte gUnknown_203AAC4
_080EC228: .4byte 0x00002cd0
_080EC22C: .4byte sub_80EC2C0
	thumb_func_end sub_80EC1D4

	thumb_func_start sub_80EC230
sub_80EC230: @ 80EC230
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807AA70
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080EC250
	ldr r0, _080EC258 @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080EC25C @ =sub_80EBF40
	str r0, [r1]
_080EC250:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC258: .4byte gUnknown_3005090
_080EC25C: .4byte sub_80EBF40
	thumb_func_end sub_80EC230

	thumb_func_start sub_80EC260
sub_80EC260: @ 80EC260
	push {r4,lr}
	ldr r0, _080EC274 @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _080EC278
	movs r0, 0x22
	bl sub_812B1F0
	b _080EC27E
	.align 2, 0
_080EC274: .4byte gUnknown_203AAC4
_080EC278:
	movs r0, 0x1E
	bl sub_812B1F0
_080EC27E:
	bl sub_80F6E9C
	ldr r0, _080EC2A8 @ =sub_80EC230
	movs r1, 0
	bl sub_807741C
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EC2AC @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x5]
	bl sub_810EB6C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080EC2B0
	adds r0, r4, 0
	bl sub_80EBEB0
	b _080EC2B6
	.align 2, 0
_080EC2A8: .4byte sub_80EC230
_080EC2AC: .4byte gUnknown_203AAC4
_080EC2B0:
	adds r0, r4, 0
	bl sub_8077508
_080EC2B6:
	bl sub_807DC00
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EC260

	thumb_func_start sub_80EC2C0
sub_80EC2C0: @ 80EC2C0
	push {lr}
	ldr r0, _080EC2D4 @ =gUnknown_3005020
	ldr r1, _080EC2D8 @ =sub_80EC260
	str r1, [r0]
	ldr r0, _080EC2DC @ =sub_80567DC
	bl sub_8000544
	pop {r0}
	bx r0
	.align 2, 0
_080EC2D4: .4byte gUnknown_3005020
_080EC2D8: .4byte sub_80EC260
_080EC2DC: .4byte sub_80567DC
	thumb_func_end sub_80EC2C0

	thumb_func_start sub_80EC2E0
sub_80EC2E0: @ 80EC2E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EC2F4 @ =gUnknown_8417830
	ldr r3, _080EC2F8 @ =sub_80EC2FC
	movs r1, 0x2
	bl sub_80F7808
	pop {r0}
	bx r0
	.align 2, 0
_080EC2F4: .4byte gUnknown_8417830
_080EC2F8: .4byte sub_80EC2FC
	thumb_func_end sub_80EC2E0

	thumb_func_start sub_80EC2FC
sub_80EC2FC: @ 80EC2FC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F7858
	ldr r1, _080EC31C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080EC320 @ =sub_80EC324
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC31C: .4byte gUnknown_3005090
_080EC320: .4byte sub_80EC324
	thumb_func_end sub_80EC2FC

	thumb_func_start sub_80EC324
sub_80EC324: @ 80EC324
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81100C8
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080EC350
	cmp r0, r1
	ble _080EC35C
	cmp r0, 0
	beq _080EC348
	cmp r0, 0x1
	beq _080EC356
	b _080EC35C
_080EC348:
	adds r0, r4, 0
	bl sub_80EC364
	b _080EC35C
_080EC350:
	movs r0, 0x5
	bl sub_80722CC
_080EC356:
	adds r0, r4, 0
	bl sub_80EC3F8
_080EC35C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EC324

	thumb_func_start sub_80EC364
sub_80EC364: @ 80EC364
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080EC3A0 @ =gUnknown_3005008
	ldr r4, _080EC3A4 @ =gUnknown_203AAC4
	ldrh r1, [r4]
	adds r1, 0x6
	ldrh r0, [r4, 0x2]
	adds r1, r0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080EC3A8 @ =0x00002cd0
	adds r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldrh r0, [r5, 0x20]
	movs r1, 0x1
	bl sub_809A084
	lsls r0, 24
	cmp r0, 0
	bne _080EC3B4
	ldr r2, _080EC3AC @ =gUnknown_8417858
	ldr r3, _080EC3B0 @ =sub_80EC574
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_80F7808
	b _080EC3EA
	.align 2, 0
_080EC3A0: .4byte gUnknown_3005008
_080EC3A4: .4byte gUnknown_203AAC4
_080EC3A8: .4byte 0x00002cd0
_080EC3AC: .4byte gUnknown_8417858
_080EC3B0: .4byte sub_80EC574
_080EC3B4:
	ldr r2, _080EC3F0 @ =gUnknown_841786B
	ldr r3, _080EC3F4 @ =sub_80EC574
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_80F7808
	adds r0, r5, 0
	bl sub_8097CB4
	bl sub_80EBE04
	ldrb r0, [r4, 0x5]
	subs r0, 0x1
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x5]
	ldrb r0, [r4, 0x4]
	ldrh r2, [r4, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _080EC3E4
	cmp r2, 0
	beq _080EC3E4
	subs r0, r2, 0x1
	strh r0, [r4, 0x2]
_080EC3E4:
	adds r0, r6, 0
	bl sub_80EBD88
_080EC3EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EC3F0: .4byte gUnknown_841786B
_080EC3F4: .4byte sub_80EC574
	thumb_func_end sub_80EC364

	thumb_func_start sub_80EC3F8
sub_80EC3F8: @ 80EC3F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80EC574
	pop {r0}
	bx r0
	thumb_func_end sub_80EC3F8

	thumb_func_start sub_80EC408
sub_80EC408: @ 80EC408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8040C3C
	lsls r0, 24
	cmp r0, 0
	bne _080EC420
	adds r0, r4, 0
	bl sub_80EC520
	b _080EC436
_080EC420:
	movs r0, 0x1
	movs r1, 0
	bl sub_807A818
	ldr r0, _080EC43C @ =gUnknown_3005090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080EC440 @ =sub_80EC444
	str r0, [r1]
_080EC436:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC43C: .4byte gUnknown_3005090
_080EC440: .4byte sub_80EC444
	thumb_func_end sub_80EC408

	thumb_func_start sub_80EC444
sub_80EC444: @ 80EC444
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EC470 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EC468
	bl sub_810EDB0
	bl sub_80563F0
	bl sub_81273D8
	adds r0, r4, 0
	bl sub_8077508
_080EC468:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC470: .4byte gUnknown_2037AB8
	thumb_func_end sub_80EC444

	thumb_func_start sub_80EC474
sub_80EC474: @ 80EC474
	push {r4-r6,lr}
	ldr r0, _080EC488 @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _080EC48C
	movs r0, 0x22
	bl sub_812B1F0
	b _080EC492
	.align 2, 0
_080EC488: .4byte gUnknown_203AAC4
_080EC48C:
	movs r0, 0x1E
	bl sub_812B1F0
_080EC492:
	ldr r0, _080EC4E8 @ =sub_80EC230
	movs r1, 0
	bl sub_807741C
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080EC4EC @ =gUnknown_203AAC4
	ldrb r4, [r5, 0x5]
	bl sub_80EBDC8
	strb r0, [r5, 0x5]
	bl sub_80EBE04
	ldrb r0, [r5, 0x5]
	cmp r4, r0
	beq _080EC4C6
	ldrb r1, [r5, 0x5]
	ldrb r0, [r5, 0x4]
	ldrh r2, [r5, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _080EC4C6
	cmp r2, 0
	beq _080EC4C6
	subs r0, r2, 0x1
	strh r0, [r5, 0x2]
_080EC4C6:
	adds r0, r6, 0
	bl sub_80EBD88
	bl sub_80F6E9C
	ldr r0, _080EC4EC @ =gUnknown_203AAC4
	ldrb r0, [r0, 0x5]
	bl sub_810EB6C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080EC4F0
	adds r0, r6, 0
	bl sub_80EBEB0
	b _080EC4F6
	.align 2, 0
_080EC4E8: .4byte sub_80EC230
_080EC4EC: .4byte gUnknown_203AAC4
_080EC4F0:
	adds r0, r6, 0
	bl sub_8077508
_080EC4F6:
	bl sub_807DC00
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EC474

	thumb_func_start sub_80EC500
sub_80EC500: @ 80EC500
	push {lr}
	ldr r0, _080EC514 @ =gUnknown_3005020
	ldr r1, _080EC518 @ =sub_80EC474
	str r1, [r0]
	ldr r0, _080EC51C @ =sub_80567DC
	bl sub_8000544
	pop {r0}
	bx r0
	.align 2, 0
_080EC514: .4byte gUnknown_3005020
_080EC518: .4byte sub_80EC474
_080EC51C: .4byte sub_80567DC
	thumb_func_end sub_80EC500

	thumb_func_start sub_80EC520
sub_80EC520: @ 80EC520
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EC534 @ =gUnknown_841632A
	ldr r3, _080EC538 @ =sub_80EC574
	movs r1, 0x2
	bl sub_80F7808
	pop {r0}
	bx r0
	.align 2, 0
_080EC534: .4byte gUnknown_841632A
_080EC538: .4byte sub_80EC574
	thumb_func_end sub_80EC520

	thumb_func_start sub_80EC53C
sub_80EC53C: @ 80EC53C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	bl sub_80F6F54
	adds r0, r4, 0
	bl sub_80EBEB0
	movs r0, 0
	bl sub_80F67A4
	ldr r1, _080EC56C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080EC570 @ =sub_80EBF40
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC56C: .4byte gUnknown_3005090
_080EC570: .4byte sub_80EBF40
	thumb_func_end sub_80EC53C

	thumb_func_start sub_80EC574
sub_80EC574: @ 80EC574
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	bl sub_810EBE0
	movs r0, 0
	bl sub_80F67A4
	ldr r1, _080EC59C @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080EC5A0 @ =sub_80EC53C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC59C: .4byte gUnknown_3005090
_080EC5A0: .4byte sub_80EC53C
	thumb_func_end sub_80EC574

	.align 2, 0 @ Don't pad with nop.
