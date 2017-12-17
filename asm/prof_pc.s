	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CA3D8
sub_80CA3D8: @ 80CA3D8
	push {lr}
	ldr r0, _080CA3F4 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080CA3FC
	movs r0, 0
	bl sub_8088EDC
	ldr r1, _080CA3F8 @ =gUnknown_20370C2
	strh r0, [r1]
	movs r0, 0x1
	bl sub_8088EDC
	b _080CA40C
	.align 2, 0
_080CA3F4: .4byte gUnknown_20370C0
_080CA3F8: .4byte gUnknown_20370C2
_080CA3FC:
	movs r0, 0
	bl sub_8088E8C
	ldr r1, _080CA41C @ =gUnknown_20370C2
	strh r0, [r1]
	movs r0, 0x1
	bl sub_8088E8C
_080CA40C:
	ldr r1, _080CA420 @ =gUnknown_20370C4
	strh r0, [r1]
	bl sub_806E25C
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080CA41C: .4byte gUnknown_20370C2
_080CA420: .4byte gUnknown_20370C4
	thumb_func_end sub_80CA3D8

	thumb_func_start sub_80CA424
sub_80CA424: @ 80CA424
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _080CA440 @ =gUnknown_20370D0
	movs r0, 0
	strh r0, [r1]
	cmp r2, 0x9
	bhi _080CA436
	b _080CA50C
_080CA436:
	cmp r2, 0x13
	bhi _080CA448
	ldr r0, _080CA444 @ =gUnknown_81A6D6D
	b _080CA51A
	.align 2, 0
_080CA440: .4byte gUnknown_20370D0
_080CA444: .4byte gUnknown_81A6D6D
_080CA448:
	cmp r2, 0x1D
	bhi _080CA454
	ldr r0, _080CA450 @ =gUnknown_81A6DDF
	b _080CA51A
	.align 2, 0
_080CA450: .4byte gUnknown_81A6DDF
_080CA454:
	cmp r2, 0x27
	bhi _080CA460
	ldr r0, _080CA45C @ =gUnknown_81A6E36
	b _080CA51A
	.align 2, 0
_080CA45C: .4byte gUnknown_81A6E36
_080CA460:
	cmp r2, 0x31
	bhi _080CA46C
	ldr r0, _080CA468 @ =gUnknown_81A6EA4
	b _080CA51A
	.align 2, 0
_080CA468: .4byte gUnknown_81A6EA4
_080CA46C:
	cmp r2, 0x3B
	bhi _080CA478
	ldr r0, _080CA474 @ =gUnknown_81A6F0B
	b _080CA51A
	.align 2, 0
_080CA474: .4byte gUnknown_81A6F0B
_080CA478:
	cmp r2, 0x45
	bhi _080CA484
	ldr r0, _080CA480 @ =gUnknown_81A6F71
	b _080CA51A
	.align 2, 0
_080CA480: .4byte gUnknown_81A6F71
_080CA484:
	cmp r2, 0x4F
	bhi _080CA490
	ldr r0, _080CA48C @ =gUnknown_81A6FAB
	b _080CA51A
	.align 2, 0
_080CA48C: .4byte gUnknown_81A6FAB
_080CA490:
	cmp r2, 0x59
	bhi _080CA49C
	ldr r0, _080CA498 @ =gUnknown_81A6FF1
	b _080CA51A
	.align 2, 0
_080CA498: .4byte gUnknown_81A6FF1
_080CA49C:
	cmp r2, 0x63
	bhi _080CA4A8
	ldr r0, _080CA4A4 @ =gUnknown_81A7031
	b _080CA51A
	.align 2, 0
_080CA4A4: .4byte gUnknown_81A7031
_080CA4A8:
	cmp r2, 0x6D
	bhi _080CA4B4
	ldr r0, _080CA4B0 @ =gUnknown_81A7063
	b _080CA51A
	.align 2, 0
_080CA4B0: .4byte gUnknown_81A7063
_080CA4B4:
	cmp r2, 0x77
	bhi _080CA4C0
	ldr r0, _080CA4BC @ =gUnknown_81A70A5
	b _080CA51A
	.align 2, 0
_080CA4BC: .4byte gUnknown_81A70A5
_080CA4C0:
	cmp r2, 0x81
	bhi _080CA4CC
	ldr r0, _080CA4C8 @ =gUnknown_81A70D8
	b _080CA51A
	.align 2, 0
_080CA4C8: .4byte gUnknown_81A70D8
_080CA4CC:
	cmp r2, 0x8B
	bhi _080CA4D8
	ldr r0, _080CA4D4 @ =gUnknown_81A7108
	b _080CA51A
	.align 2, 0
_080CA4D4: .4byte gUnknown_81A7108
_080CA4D8:
	cmp r2, 0x95
	bls _080CA4F6
	cmp r2, 0x96
	bne _080CA508
	movs r0, 0x97
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8088E74
	lsls r0, 24
	cmp r0, 0
	beq _080CA500
_080CA4F6:
	ldr r0, _080CA4FC @ =gUnknown_81A7137
	b _080CA51A
	.align 2, 0
_080CA4FC: .4byte gUnknown_81A7137
_080CA500:
	ldr r1, _080CA504 @ =gUnknown_20370D0
	b _080CA514
	.align 2, 0
_080CA504: .4byte gUnknown_20370D0
_080CA508:
	cmp r2, 0x97
	beq _080CA514
_080CA50C:
	ldr r0, _080CA510 @ =gUnknown_81A6D17
	b _080CA51A
	.align 2, 0
_080CA510: .4byte gUnknown_81A6D17
_080CA514:
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, _080CA520 @ =gUnknown_81A7175
_080CA51A:
	pop {r1}
	bx r1
	.align 2, 0
_080CA520: .4byte gUnknown_81A7175
	thumb_func_end sub_80CA424

	thumb_func_start sub_80CA524
sub_80CA524: @ 80CA524
	push {lr}
	ldr r0, _080CA538 @ =gUnknown_20370C0
	ldrh r0, [r0]
	bl sub_80CA424
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_080CA538: .4byte gUnknown_20370C0
	thumb_func_end sub_80CA524

	.align 2, 0 @ Don't pad with nop.
