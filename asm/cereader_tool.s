	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_815D654
sub_815D654: @ 815D654
	push {lr}
	ldr r0, _0815D674 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _0815D678 @ =0x00003d41
	adds r0, r1
	ldrb r1, [r0]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 8
	lsls r0, 8
	subs r0, r2, r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0815D674: .4byte gSaveBlock1Ptr
_0815D678: .4byte 0x00003d41
	thumb_func_end sub_815D654

	thumb_func_start sub_815D67C
sub_815D67C: @ 815D67C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _0815D6AA
	ldrb r0, [r5, 0x2]
	cmp r0, 0x2
	bhi _0815D6AA
	movs r4, 0xF7
	lsls r4, 2
	adds r0, r5, 0
	adds r1, r4, 0
	bl CalcByteArraySum
	adds r4, r5, r4
	ldr r1, [r4]
	cmp r0, r1
	bne _0815D6AA
	movs r0, 0x1
	b _0815D6AC
_0815D6AA:
	movs r0, 0
_0815D6AC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_815D67C

	thumb_func_start sub_815D6B4
sub_815D6B4: @ 815D6B4
	push {r4-r7,lr}
	adds r7, r0, 0
	ldrb r6, [r7]
	subs r0, r6, 0x1
	cmp r0, 0x7
	bhi _0815D6F8
	movs r5, 0
	cmp r5, r6
	bcs _0815D6E0
	adds r4, r7, 0
	adds r4, 0x8
_0815D6CA:
	adds r0, r4, 0
	bl sub_815D67C
	cmp r0, 0
	beq _0815D6F8
	movs r0, 0xF8
	lsls r0, 2
	adds r4, r0
	adds r5, 0x1
	cmp r5, r6
	bcc _0815D6CA
_0815D6E0:
	adds r0, r7, 0
	adds r0, 0x8
	lsls r1, r6, 5
	subs r1, r6
	lsls r1, 5
	bl CalcByteArraySum
	ldr r1, [r7, 0x4]
	cmp r0, r1
	bne _0815D6F8
	movs r0, 0x1
	b _0815D6FA
_0815D6F8:
	movs r0, 0
_0815D6FA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_815D6B4

	thumb_func_start sub_815D700
sub_815D700: @ 815D700
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrh r0, [r5, 0x2]
	cmp r0, 0
	beq _0815D718
	ldr r0, _0815D77C @ =gUnknown_8479CD8	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/cereader_tool.c"
	ldr r2, _0815D780 @ =gUnknown_8479D10	"ttdata->dummy == 0"
	movs r1, 0xC6
	movs r3, 0x1
	bl AGBAssert
_0815D718:
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _0815D72A
	ldr r0, _0815D77C @ =gUnknown_8479CD8	"C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/cereader_tool.c"
	ldr r2, _0815D784 @ =gUnknown_8479D24	"ttdata->id == 0"
	movs r1, 0xC7
	movs r3, 0x1
	bl AGBAssert
_0815D72A:
	movs r6, 0x80
	lsls r6, 5
	adds r0, r4, 0
	movs r1, 0
	adds r2, r6, 0
	bl memset
	ldr r2, _0815D788 @ =0x00000f88
	adds r0, r4, 0
	adds r1, r5, 0
	bl memcpy
	bl sub_815D654
	strb r0, [r4, 0x1]
	movs r0, 0x1E
	adds r1, r4, 0
	bl sub_80DA5E0
	cmp r0, 0x1
	bne _0815D78C
	adds r0, r4, 0
	movs r1, 0
	adds r2, r6, 0
	bl memset
	ldr r0, _0815D788 @ =0x00000f88
	adds r1, r5, r0
	movs r2, 0xF8
	lsls r2, 4
	adds r0, r4, 0
	bl memcpy
	movs r0, 0x1F
	adds r1, r4, 0
	bl sub_80DA5E0
	cmp r0, 0x1
	bne _0815D78C
	movs r0, 0x1
	b _0815D78E
	.align 2, 0
_0815D77C: .4byte gUnknown_8479CD8
_0815D780: .4byte gUnknown_8479D10
_0815D784: .4byte gUnknown_8479D24
_0815D788: .4byte 0x00000f88
_0815D78C:
	movs r0, 0
_0815D78E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_815D700

	thumb_func_start sub_815D794
sub_815D794: @ 815D794
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x80
	lsls r0, 5
	bl AllocZeroed
	adds r5, r0, 0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_815D700
	adds r4, r0, 0
	adds r0, r5, 0
	bl Free
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_815D794

	.align 2, 0 @ Don't pad with nop.
