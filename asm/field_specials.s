	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CA618
sub_80CA618: @ 80CA618
	push {lr}
	bl sub_8112364
	ldr r0, _080CA62C @ =sub_80F4C10
	bl sub_8000544
	bl sub_8069940
	pop {r0}
	bx r0
	.align 2, 0
_080CA62C: .4byte sub_80F4C10
	thumb_func_end sub_80CA618

	thumb_func_start sub_80CA630
sub_80CA630: @ 80CA630
	push {r4,lr}
	ldr r0, _080CA65C @ =gUnknown_2037078
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CA644
	movs r0, 0x2
	bl sub_805BDEC
_080CA644:
	movs r4, 0x8D
	lsls r4, 1
	adds r0, r4, 0
	bl sub_8055E78
	adds r0, r4, 0
	bl sub_8055F48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA65C: .4byte gUnknown_2037078
	thumb_func_end sub_80CA630

	thumb_func_start nullsub_74
nullsub_74: @ 80CA660
	bx lr
	thumb_func_end nullsub_74

	thumb_func_start sub_80CA664
sub_80CA664: @ 80CA664
	push {lr}
	movs r0, 0x4
	bl sub_805C74C
	lsls r0, 24
	cmp r0, 0
	beq _080CA676
	movs r0, 0x1
	b _080CA688
_080CA676:
	movs r0, 0x2
	bl sub_805C74C
	lsls r0, 24
	cmp r0, 0
	bne _080CA686
	movs r0, 0
	b _080CA688
_080CA686:
	movs r0, 0x2
_080CA688:
	pop {r1}
	bx r1
	thumb_func_end sub_80CA664

	thumb_func_start sub_80CA68C
sub_80CA68C: @ 80CA68C
	push {lr}
	ldr r0, _080CA698 @ =gUnknown_2021D18
	bl sub_806943C
	pop {r0}
	bx r0
	.align 2, 0
_080CA698: .4byte gUnknown_2021D18
	thumb_func_end sub_80CA68C

	thumb_func_start sub_80CA69C
sub_80CA69C: @ 80CA69C
	ldr r1, _080CA6B0 @ =gUnknown_20370C0
	ldr r0, _080CA6B4 @ =gUnknown_3005008
	ldr r2, [r0]
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _080CA6B8 @ =gUnknown_20370C2
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080CA6B0: .4byte gUnknown_20370C0
_080CA6B4: .4byte gUnknown_3005008
_080CA6B8: .4byte gUnknown_20370C2
	thumb_func_end sub_80CA69C

	thumb_func_start sub_80CA6BC
sub_80CA6BC: @ 80CA6BC
	push {lr}
	ldr r0, _080CA6D8 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r1, [r0, 0xB]
	lsls r1, 8
	ldrb r0, [r0, 0xA]
	orrs r0, r1
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080CA6D8: .4byte gUnknown_300500C
	thumb_func_end sub_80CA6BC

	thumb_func_start sub_80CA6DC
sub_80CA6DC: @ 80CA6DC
	push {lr}
	ldr r0, _080CA6F4 @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080CA700
	ldr r0, _080CA6F8 @ =gUnknown_2021CD0
	ldr r1, _080CA6FC @ =gUnknown_8417FBB
	bl sub_8008D84
	b _080CA708
	.align 2, 0
_080CA6F4: .4byte gUnknown_300500C
_080CA6F8: .4byte gUnknown_2021CD0
_080CA6FC: .4byte gUnknown_8417FBB
_080CA700:
	ldr r0, _080CA70C @ =gUnknown_2021CD0
	ldr r1, _080CA710 @ =gUnknown_8417FC3
	bl sub_8008D84
_080CA708:
	pop {r0}
	bx r0
	.align 2, 0
_080CA70C: .4byte gUnknown_2021CD0
_080CA710: .4byte gUnknown_8417FC3
	thumb_func_end sub_80CA6DC

	thumb_func_start sub_80CA714
sub_80CA714: @ 80CA714
	push {lr}
	ldr r0, _080CA72C @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080CA738
	ldr r0, _080CA730 @ =gUnknown_2021CD0
	ldr r1, _080CA734 @ =gUnknown_8417FD0
	bl sub_8008D84
	b _080CA740
	.align 2, 0
_080CA72C: .4byte gUnknown_300500C
_080CA730: .4byte gUnknown_2021CD0
_080CA734: .4byte gUnknown_8417FD0
_080CA738:
	ldr r0, _080CA744 @ =gUnknown_2021CD0
	ldr r1, _080CA748 @ =gUnknown_8417FCC
	bl sub_8008D84
_080CA740:
	pop {r0}
	bx r0
	.align 2, 0
_080CA744: .4byte gUnknown_2021CD0
_080CA748: .4byte gUnknown_8417FCC
	thumb_func_end sub_80CA714

	thumb_func_start sub_80CA74C
sub_80CA74C: @ 80CA74C
	ldr r0, _080CA754 @ =gUnknown_2023E8A
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CA754: .4byte gUnknown_2023E8A
	thumb_func_end sub_80CA74C

	thumb_func_start sub_80CA758
sub_80CA758: @ 80CA758
	push {lr}
	ldr r0, _080CA768 @ =gUnknown_20370C0
	ldrh r0, [r0]
	bl sub_806E680
	pop {r0}
	bx r0
	.align 2, 0
_080CA768: .4byte gUnknown_20370C0
	thumb_func_end sub_80CA758

	thumb_func_start sub_80CA76C
sub_80CA76C: @ 80CA76C
	push {r4,lr}
	bl sub_80CACFC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080CA790 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_803FBE8
	cmp r0, 0xFF
	bne _080CA794
	movs r0, 0x6
	b _080CA7E6
	.align 2, 0
_080CA790: .4byte gUnknown_2024284
_080CA794:
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_803FBE8
	cmp r0, 0xC7
	bls _080CA7A4
	movs r0, 0x5
	b _080CA7E6
_080CA7A4:
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_803FBE8
	cmp r0, 0x95
	bls _080CA7B4
	movs r0, 0x4
	b _080CA7E6
_080CA7B4:
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_803FBE8
	cmp r0, 0x63
	bls _080CA7C4
	movs r0, 0x3
	b _080CA7E6
_080CA7C4:
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_803FBE8
	cmp r0, 0x31
	bls _080CA7D4
	movs r0, 0x2
	b _080CA7E6
_080CA7D4:
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_803FBE8
	cmp r0, 0
	bne _080CA7E4
	movs r0, 0
	b _080CA7E6
_080CA7E4:
	movs r0, 0x1
_080CA7E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CA76C

	thumb_func_start sub_80CA7EC
sub_80CA7EC: @ 80CA7EC
	push {lr}
	bl sub_8112364
	ldr r1, _080CA800 @ =sub_80568E0
	movs r0, 0x1
	bl sub_80BFF50
	pop {r0}
	bx r0
	.align 2, 0
_080CA800: .4byte sub_80568E0
	thumb_func_end sub_80CA7EC

	thumb_func_start sub_80CA804
sub_80CA804: @ 80CA804
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _080CA850 @ =gUnknown_8254784
_080CA80A:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080CA854 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_803FBE8
	cmp r0, 0
	beq _080CA858
	adds r0, r4, 0
	movs r1, 0x2D
	bl sub_803FBE8
	cmp r0, 0
	bne _080CA858
	adds r0, r4, 0
	movs r1, 0xB
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x6]
	cmp r0, 0xC
	beq _080CA84C
	ldrb r0, [r1, 0x7]
	cmp r0, 0xC
	bne _080CA858
_080CA84C:
	movs r0, 0x1
	b _080CA864
	.align 2, 0
_080CA850: .4byte gUnknown_8254784
_080CA854: .4byte gUnknown_2024284
_080CA858:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080CA80A
	movs r0, 0
_080CA864:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80CA804

	thumb_func_start sub_80CA86C
sub_80CA86C: @ 80CA86C
	push {r4,lr}
	ldr r4, _080CA8A0 @ =sub_80CA8A8
	adds r0, r4, 0
	bl sub_8077650
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CA89A
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA8A4 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
_080CA89A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA8A0: .4byte sub_80CA8A8
_080CA8A4: .4byte gUnknown_3005090
	thumb_func_end sub_80CA86C

	thumb_func_start sub_80CA8A8
sub_80CA8A8: @ 80CA8A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CA8F4 @ =gUnknown_3005098
	adds r4, r0, r1
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bne _080CA8E6
	ldrh r1, [r4]
	movs r0, 0x1
	ands r0, r1
	bl sub_80CA8F8
	bl sub_805A684
	movs r0, 0
	strh r0, [r4, 0x2]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080CA8E6
	adds r0, r5, 0
	bl sub_8077508
_080CA8E6:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA8F4: .4byte gUnknown_3005098
	thumb_func_end sub_80CA8A8

	thumb_func_start sub_80CA8F8
sub_80CA8F8: @ 80CA8F8
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r4, 0
	movs r7, 0
	movs r5, 0
	bl sub_805C6C4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _080CA926
	cmp r0, 0x3
	bgt _080CA91C
	cmp r0, 0x2
	beq _080CA922
	b _080CA92E
_080CA91C:
	cmp r1, 0x4
	beq _080CA92A
	b _080CA92E
_080CA922:
	movs r7, 0
	b _080CA92C
_080CA926:
	movs r7, 0xFF
	b _080CA92C
_080CA92A:
	movs r7, 0x1
_080CA92C:
	movs r5, 0xFF
_080CA92E:
	cmp r6, 0
	beq _080CA954
	ldr r0, _080CA940 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080CA944
	movs r4, 0x62
	b _080CA96E
	.align 2, 0
_080CA940: .4byte gUnknown_20370C0
_080CA944:
	cmp r0, 0x1
	beq _080CA94C
	cmp r0, 0x2
	bne _080CA96E
_080CA94C:
	ldr r4, _080CA950 @ =0x0000028f
	b _080CA96E
	.align 2, 0
_080CA950: .4byte 0x0000028f
_080CA954:
	ldr r0, _080CA960 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080CA964
	movs r4, 0x63
	b _080CA96E
	.align 2, 0
_080CA960: .4byte gUnknown_20370C0
_080CA964:
	cmp r0, 0x1
	beq _080CA96C
	cmp r0, 0x2
	bne _080CA96E
_080CA96C:
	ldr r4, _080CA9A0 @ =0x0000028a
_080CA96E:
	ldr r0, _080CA9A4 @ =gUnknown_3005008
	ldr r2, [r0]
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r7, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	lsls r2, r5, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r3, 0xC0
	lsls r3, 4
	adds r2, r3, 0
	orrs r4, r2
	adds r2, r4, 0
	bl sub_8058FA4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CA9A0: .4byte 0x0000028a
_080CA9A4: .4byte gUnknown_3005008
	thumb_func_end sub_80CA8F8

	thumb_func_start sub_80CA9A8
sub_80CA9A8: @ 80CA9A8
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0
	movs r5, 0
	bl sub_805C6C4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _080CA9D2
	cmp r0, 0x3
	bgt _080CA9C8
	cmp r0, 0x2
	beq _080CA9CE
	b _080CA9DA
_080CA9C8:
	cmp r1, 0x4
	beq _080CA9D6
	b _080CA9DA
_080CA9CE:
	movs r6, 0
	b _080CA9D8
_080CA9D2:
	movs r6, 0xFF
	b _080CA9D8
_080CA9D6:
	movs r6, 0x1
_080CA9D8:
	movs r5, 0xFF
_080CA9DA:
	ldr r0, _080CA9E8 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080CA9EC
	movs r4, 0x62
	b _080CA9F6
	.align 2, 0
_080CA9E8: .4byte gUnknown_20370C0
_080CA9EC:
	cmp r0, 0x1
	beq _080CA9F4
	cmp r0, 0x2
	bne _080CA9F6
_080CA9F4:
	ldr r4, _080CAA2C @ =0x0000028f
_080CA9F6:
	ldr r0, _080CAA30 @ =gUnknown_3005008
	ldr r2, [r0]
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r6, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	lsls r2, r5, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r3, 0xC0
	lsls r3, 4
	adds r2, r3, 0
	orrs r4, r2
	adds r2, r4, 0
	bl sub_8058FA4
	bl sub_805A684
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CAA2C: .4byte 0x0000028f
_080CAA30: .4byte gUnknown_3005008
	thumb_func_end sub_80CA9A8

	thumb_func_start sub_80CAA34
sub_80CAA34: @ 80CAA34
	push {lr}
	sub sp, 0x8
	ldr r0, _080CAA80 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrh r3, [r0]
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0x12
	movs r1, 0x8
	movs r2, 0x7F
	bl sub_805E830
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CAA84 @ =gUnknown_2036E38
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r1, 0x4]
	bl sub_805FAC4
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080CAA80: .4byte gUnknown_3005008
_080CAA84: .4byte gUnknown_2036E38
	thumb_func_end sub_80CAA34

	thumb_func_start sub_80CAA88
sub_80CAA88: @ 80CAA88
	push {lr}
	bl sub_805C768
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FAC4
	ldr r0, _080CAAA8 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	bl sub_805E4C8
	pop {r0}
	bx r0
	.align 2, 0
_080CAAA8: .4byte gUnknown_3005008
	thumb_func_end sub_80CAA88

	thumb_func_start sub_80CAAAC
sub_80CAAAC: @ 80CAAAC
	push {lr}
	ldr r0, _080CAAB8 @ =gUnknown_2021CD0
	bl sub_80E7460
	pop {r0}
	bx r0
	.align 2, 0
_080CAAB8: .4byte gUnknown_2021CD0
	thumb_func_end sub_80CAAAC

	thumb_func_start sub_80CAABC
sub_80CAABC: @ 80CAABC
	push {lr}
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x16
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080CAADC @ =gUnknown_83F5B1A
	adds r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080CAADC: .4byte gUnknown_83F5B1A
	thumb_func_end sub_80CAABC

	thumb_func_start sub_80CAAE0
sub_80CAAE0: @ 80CAAE0
	push {lr}
	bl sub_80CACFC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080CAB04 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x47
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080CAB04: .4byte gUnknown_2024284
	thumb_func_end sub_80CAAE0

	thumb_func_start sub_80CAB08
sub_80CAB08: @ 80CAB08
	push {lr}
	sub sp, 0x4
	movs r0, 0x2A
	bl sub_8054E90
	ldr r0, _080CAB3C @ =0x0000083b
	bl sub_806E680
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	bl sub_80CACFC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080CAB40 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x47
	mov r2, sp
	bl sub_804037C
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080CAB3C: .4byte 0x0000083b
_080CAB40: .4byte gUnknown_2024284
	thumb_func_end sub_80CAB08

	thumb_func_start sub_80CAB44
sub_80CAB44: @ 80CAB44
	push {lr}
	bl sub_80CACFC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080CAB68 @ =gUnknown_2024284
	adds r0, r1
	bl sub_8043A40
	lsls r0, 16
	ldr r1, _080CAB6C @ =0x01fd0000
	cmp r0, r1
	bhi _080CAB70
	movs r0, 0
	b _080CAB72
	.align 2, 0
_080CAB68: .4byte gUnknown_2024284
_080CAB6C: .4byte 0x01fd0000
_080CAB70:
	movs r0, 0x1
_080CAB72:
	pop {r1}
	bx r1
	thumb_func_end sub_80CAB44

	thumb_func_start sub_80CAB78
sub_80CAB78: @ 80CAB78
	push {r4-r6,lr}
	ldr r0, _080CABB4 @ =0x00004031
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_80CBD94
	lsls r0, 16
	lsrs r6, r0, 16
	bl sub_8040C3C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _080CABC6
_080CAB9A:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080CABB8 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	cmp r0, r6
	bne _080CABBC
	movs r0, 0x1
	b _080CABC8
	.align 2, 0
_080CABB4: .4byte 0x00004031
_080CABB8: .4byte gUnknown_2024284
_080CABBC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080CAB9A
_080CABC6:
	movs r0, 0
_080CABC8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80CAB78

	thumb_func_start sub_80CABD0
sub_80CABD0: @ 80CABD0
	push {r4-r6,lr}
	movs r6, 0
_080CABD4:
	movs r4, 0
	lsls r5, r6, 24
_080CABD8:
	lsls r1, r4, 24
	lsrs r1, 24
	lsrs r0, r5, 24
	movs r2, 0xB
	bl sub_808BA18
	cmp r0, 0
	bne _080CABEC
	movs r0, 0x1
	b _080CAC02
_080CABEC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _080CABD8
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0xD
	bls _080CABD4
	movs r0, 0
_080CAC02:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80CABD0

	thumb_func_start sub_80CAC08
sub_80CAC08: @ 80CAC08
	push {lr}
	ldr r0, _080CAC1C @ =gUnknown_2024284
	movs r1, 0x3F
	bl sub_8043A70
	lsls r0, 24
	cmp r0, 0
	beq _080CAC20
	movs r0, 0x1
	b _080CAC22
	.align 2, 0
_080CAC1C: .4byte gUnknown_2024284
_080CAC20:
	movs r0, 0
_080CAC22:
	pop {r1}
	bx r1
	thumb_func_end sub_80CAC08

	thumb_func_start sub_80CAC28
sub_80CAC28: @ 80CAC28
	push {lr}
	ldr r0, _080CAC6C @ =sub_80CAC84
	movs r1, 0x9
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CAC70 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080CAC74 @ =gUnknown_20370C2
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldr r0, _080CAC78 @ =gUnknown_20370C4
	ldrh r0, [r0]
	strh r0, [r1, 0xC]
	ldr r0, _080CAC7C @ =gUnknown_20370C6
	ldrh r0, [r0]
	strh r0, [r1, 0xE]
	ldr r0, _080CAC80 @ =gUnknown_20370C0
	ldrh r0, [r0]
	strh r0, [r1, 0x10]
	movs r0, 0
	bl sub_805ADD4
	movs r0, 0xCF
	bl sub_80722CC
	pop {r0}
	bx r0
	.align 2, 0
_080CAC6C: .4byte sub_80CAC84
_080CAC70: .4byte gUnknown_3005090
_080CAC74: .4byte gUnknown_20370C2
_080CAC78: .4byte gUnknown_20370C4
_080CAC7C: .4byte gUnknown_20370C6
_080CAC80: .4byte gUnknown_20370C0
	thumb_func_end sub_80CAC28

	thumb_func_start sub_80CAC84
sub_80CAC84: @ 80CAC84
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CACE4 @ =gUnknown_3005098
	adds r4, r0, r1
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _080CACDC
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	subs r0, 0x1
	strh r0, [r4, 0x4]
	ldrh r0, [r4]
	negs r0, r0
	strh r0, [r4]
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	bl sub_805ADE0
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CACDC
	adds r0, r5, 0
	bl sub_80CACE8
	bl sub_805ADF8
_080CACDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CACE4: .4byte gUnknown_3005098
	thumb_func_end sub_80CAC84

	thumb_func_start sub_80CACE8
sub_80CACE8: @ 80CACE8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8077508
	bl sub_8069B34
	pop {r0}
	bx r0
	thumb_func_end sub_80CACE8

	thumb_func_start sub_80CACFC
sub_80CACFC: @ 80CACFC
	push {r4-r6,lr}
	bl sub_8040C3C
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	cmp r5, r6
	bcs _080CAD4A
_080CAD0C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080CAD3C @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _080CAD40
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	cmp r0, 0
	beq _080CAD40
	adds r0, r5, 0
	b _080CAD4C
	.align 2, 0
_080CAD3C: .4byte gUnknown_2024284
_080CAD40:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _080CAD0C
_080CAD4A:
	movs r0, 0
_080CAD4C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80CACFC

	thumb_func_start sub_80CAD54
sub_80CAD54: @ 80CAD54
	push {lr}
	ldr r0, _080CAD74 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CAD78 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080CAD74: .4byte gUnknown_20370C0
_080CAD78: .4byte gUnknown_2024284
	thumb_func_end sub_80CAD54

	thumb_func_start sub_80CAD7C
sub_80CAD7C: @ 80CAD7C
	push {r4,lr}
	ldr r0, _080CADA8 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CADAC @ =gUnknown_2024284
	adds r0, r1
	ldr r4, _080CADB0 @ =gUnknown_2021CD0
	movs r1, 0x7
	adds r2, r4, 0
	bl sub_803FBE8
	ldr r0, _080CADB4 @ =gUnknown_300500C
	ldr r0, [r0]
	adds r1, r4, 0
	bl sub_8008E28
	cmp r0, 0
	beq _080CADB8
	movs r0, 0x1
	b _080CADBA
	.align 2, 0
_080CADA8: .4byte gUnknown_20370C0
_080CADAC: .4byte gUnknown_2024284
_080CADB0: .4byte gUnknown_2021CD0
_080CADB4: .4byte gUnknown_300500C
_080CADB8:
	movs r0, 0
_080CADBA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CAD7C

	thumb_func_start nullsub_75
nullsub_75: @ 80CADC0
	bx lr
	thumb_func_end nullsub_75

	thumb_func_start sub_80CADC4
sub_80CADC4: @ 80CADC4
	push {lr}
	sub sp, 0x10
	movs r1, 0xFF
	add r0, sp, 0xC
	strb r1, [r0]
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r1, 0x2
	add r2, sp, 0xC
	movs r3, 0
	bl sub_8002C48
	bl sub_809D424
	add sp, 0x10
	pop {r0}
	bx r0
	thumb_func_end sub_80CADC4

	thumb_func_start sub_80CADEC
sub_80CADEC: @ 80CADEC
	push {r4,r5,lr}
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	bl __umodsi3
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _080CAE20 @ =gUnknown_20370C0
	strh r2, [r1]
	ldr r0, _080CAE24 @ =gUnknown_20370C2
	strh r2, [r0]
	ldrh r0, [r1]
	subs r0, 0x1
	cmp r0, 0xE
	bls _080CAE14
	b _080CB01C
_080CAE14:
	lsls r0, 2
	ldr r1, _080CAE28 @ =_080CAE2C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CAE20: .4byte gUnknown_20370C0
_080CAE24: .4byte gUnknown_20370C2
_080CAE28: .4byte _080CAE2C
	.align 2, 0
_080CAE2C:
	.4byte _080CAE68
	.4byte _080CAE90
	.4byte _080CAE90
	.4byte _080CAE90
	.4byte _080CAEC8
	.4byte _080CAEE8
	.4byte _080CAF28
	.4byte _080CAF28
	.4byte _080CAF28
	.4byte _080CAF68
	.4byte _080CAF9C
	.4byte _080CAFC4
	.4byte _080CAFC4
	.4byte _080CAFC4
	.4byte _080CAFF8
_080CAE68:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CAE84
	ldr r1, _080CAE80 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x1
	b _080CB01A
	.align 2, 0
_080CAE80: .4byte gUnknown_20370C2
_080CAE84:
	ldr r1, _080CAE8C @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAE8C: .4byte gUnknown_20370C2
_080CAE90:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	bne _080CAEB4
	ldr r1, _080CAEB0 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x1
	b _080CB01A
	.align 2, 0
_080CAEB0: .4byte gUnknown_20370C2
_080CAEB4:
	cmp r2, 0x1
	beq _080CAEBA
	b _080CB014
_080CAEBA:
	ldr r1, _080CAEC4 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAEC4: .4byte gUnknown_20370C2
_080CAEC8:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CAEDA
	b _080CB014
_080CAEDA:
	ldr r1, _080CAEE4 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAEE4: .4byte gUnknown_20370C2
_080CAEE8:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	bne _080CAF0C
	ldr r1, _080CAF08 @ =gUnknown_20370C2
	ldrh r0, [r1]
	subs r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAF08: .4byte gUnknown_20370C2
_080CAF0C:
	cmp r2, 0x1
	bne _080CAF1C
	ldr r1, _080CAF18 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x1
	b _080CB01A
	.align 2, 0
_080CAF18: .4byte gUnknown_20370C2
_080CAF1C:
	ldr r1, _080CAF24 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAF24: .4byte gUnknown_20370C2
_080CAF28:
	bl sub_8044EC8
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r2, r1, 16
	cmp r2, 0
	bne _080CAF48
	ldr r1, _080CAF44 @ =gUnknown_20370C2
	ldrh r0, [r1]
	subs r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAF44: .4byte gUnknown_20370C2
_080CAF48:
	cmp r2, 0x1
	bne _080CAF58
	ldr r1, _080CAF54 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x1
	b _080CB01A
	.align 2, 0
_080CAF54: .4byte gUnknown_20370C2
_080CAF58:
	cmp r2, 0x2
	bne _080CB014
	ldr r1, _080CAF64 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAF64: .4byte gUnknown_20370C2
_080CAF68:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	bne _080CAF8C
	ldr r1, _080CAF88 @ =gUnknown_20370C2
	ldrh r0, [r1]
	subs r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAF88: .4byte gUnknown_20370C2
_080CAF8C:
	cmp r2, 0x1
	bne _080CB014
	ldr r1, _080CAF98 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAF98: .4byte gUnknown_20370C2
_080CAF9C:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CAFB8
	ldr r1, _080CAFB4 @ =gUnknown_20370C2
	ldrh r0, [r1]
	subs r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAFB4: .4byte gUnknown_20370C2
_080CAFB8:
	ldr r1, _080CAFC0 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x1
	b _080CB01A
	.align 2, 0
_080CAFC0: .4byte gUnknown_20370C2
_080CAFC4:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	bne _080CAFE8
	ldr r1, _080CAFE4 @ =gUnknown_20370C2
	ldrh r0, [r1]
	subs r0, 0x5
	b _080CB01A
	.align 2, 0
_080CAFE4: .4byte gUnknown_20370C2
_080CAFE8:
	cmp r2, 0x1
	bne _080CB014
	ldr r1, _080CAFF4 @ =gUnknown_20370C2
	ldrh r0, [r1]
	adds r0, 0x1
	b _080CB01A
	.align 2, 0
_080CAFF4: .4byte gUnknown_20370C2
_080CAFF8:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CB014
	ldr r1, _080CB010 @ =gUnknown_20370C2
	ldrh r0, [r1]
	subs r0, 0x5
	b _080CB01A
	.align 2, 0
_080CB010: .4byte gUnknown_20370C2
_080CB014:
	ldr r1, _080CB040 @ =gUnknown_20370C2
	ldrh r0, [r1]
	subs r0, 0x1
_080CB01A:
	strh r0, [r1]
_080CB01C:
	ldr r5, _080CB040 @ =gUnknown_20370C2
	ldrh r0, [r5]
	cmp r0, 0xF
	bls _080CB04C
	ldr r0, _080CB044 @ =gUnknown_20370C0
	ldrh r4, [r0]
	adds r0, r4, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080CB048
	cmp r0, 0
	bne _080CB048
	subs r0, r4, 0x1
	b _080CB04A
	.align 2, 0
_080CB040: .4byte gUnknown_20370C2
_080CB044: .4byte gUnknown_20370C0
_080CB048:
	adds r0, r4, 0x1
_080CB04A:
	strh r0, [r5]
_080CB04C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CADEC

	thumb_func_start sub_80CB054
sub_80CB054: @ 80CB054
	push {r4-r6,lr}
	ldr r5, _080CB08C @ =0x00004035
	adds r0, r5, 0
	bl sub_806E568
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r6, _080CB090 @ =0x00004036
	adds r0, r6, 0
	bl sub_806E568
	lsls r0, 16
	cmp r0, 0
	beq _080CB0A0
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF9
	bls _080CB098
	ldr r1, _080CB094 @ =0x0000ffff
	adds r0, r6, 0
	bl sub_806E584
	adds r0, r5, 0
	movs r1, 0
	bl sub_806E584
	b _080CB0A0
	.align 2, 0
_080CB08C: .4byte 0x00004035
_080CB090: .4byte 0x00004036
_080CB094: .4byte 0x0000ffff
_080CB098:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806E584
_080CB0A0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB054

	thumb_func_start sub_80CB0A8
sub_80CB0A8: @ 80CB0A8
	push {r4,lr}
	ldr r4, _080CB10C @ =0x00004036
	adds r0, r4, 0
	bl sub_806E568
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080CB0C0
	ldr r0, _080CB110 @ =0x0000ffff
	cmp r1, r0
	bne _080CB0EA
_080CB0C0:
	bl sub_80CB124
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	ldr r4, _080CB114 @ =0x0000403b
	bl sub_80CB198
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	ldr r0, _080CB118 @ =0x00004035
	movs r1, 0
	bl sub_806E584
_080CB0EA:
	ldr r4, _080CB11C @ =gUnknown_2021CD0
	ldr r0, _080CB10C @ =0x00004036
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080CB120 @ =gUnknown_8245EE0
	adds r1, r0
	adds r0, r4, 0
	bl sub_8008D84
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB10C: .4byte 0x00004036
_080CB110: .4byte 0x0000ffff
_080CB114: .4byte 0x0000403b
_080CB118: .4byte 0x00004035
_080CB11C: .4byte gUnknown_2021CD0
_080CB120: .4byte gUnknown_8245EE0
	thumb_func_end sub_80CB0A8

	thumb_func_start sub_80CB124
sub_80CB124: @ 80CB124
	push {r4,r5,lr}
	movs r5, 0
_080CB128:
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080CB160 @ =0x0000019b
	bl __umodsi3
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8043298
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8088E74
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _080CB18E
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x63
	bls _080CB128
	b _080CB176
	.align 2, 0
_080CB160: .4byte 0x0000019b
_080CB164:
	cmp r4, 0x1
	bne _080CB170
	ldr r4, _080CB16C @ =0x0000019b
	b _080CB176
	.align 2, 0
_080CB16C: .4byte 0x0000019b
_080CB170:
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080CB176:
	adds r0, r4, 0
	bl sub_8043298
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8088E74
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _080CB164
_080CB18E:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80CB124

	thumb_func_start sub_80CB198
sub_80CB198: @ 80CB198
	push {r4,lr}
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _080CB1D0
	ldr r4, _080CB1CC @ =gUnknown_83F5B30
	bl sub_8044EC8
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 15
	adds r0, r4
	ldrh r0, [r0]
	b _080CB1D2
	.align 2, 0
_080CB1CC: .4byte gUnknown_83F5B30
_080CB1D0:
	movs r0, 0xB
_080CB1D2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CB198

	thumb_func_start sub_80CB1D8
sub_80CB1D8: @ 80CB1D8
	push {lr}
	ldr r0, _080CB1F0 @ =gUnknown_20370D0
	ldrh r1, [r0]
	ldr r0, _080CB1F4 @ =gUnknown_20370C4
	ldrh r0, [r0]
	adds r1, r0
	ldr r0, _080CB1F8 @ =0x0000270f
	cmp r1, r0
	bgt _080CB1FC
	movs r0, 0x1
	b _080CB1FE
	.align 2, 0
_080CB1F0: .4byte gUnknown_20370D0
_080CB1F4: .4byte gUnknown_20370C4
_080CB1F8: .4byte 0x0000270f
_080CB1FC:
	movs r0, 0
_080CB1FE:
	pop {r1}
	bx r1
	thumb_func_end sub_80CB1D8

	thumb_func_start sub_80CB204
sub_80CB204: @ 80CB204
	push {r4,lr}
	movs r3, 0x4
	ldr r0, _080CB22C @ =gUnknown_3005008
	ldr r2, [r0]
	movs r1, 0x14
	ldrsb r1, [r2, r1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _080CB2AA
	ldrb r0, [r2, 0x15]
	subs r0, 0x2A
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xF
	bhi _080CB2AA
	lsls r0, 2
	ldr r1, _080CB230 @ =_080CB234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB22C: .4byte gUnknown_3005008
_080CB230: .4byte _080CB234
	.align 2, 0
_080CB234:
	.4byte _080CB2A0
	.4byte _080CB2A4
	.4byte _080CB2AA
	.4byte _080CB2A8
	.4byte _080CB2AA
	.4byte _080CB274
	.4byte _080CB278
	.4byte _080CB27C
	.4byte _080CB280
	.4byte _080CB284
	.4byte _080CB288
	.4byte _080CB28C
	.4byte _080CB290
	.4byte _080CB294
	.4byte _080CB298
	.4byte _080CB29C
_080CB274:
	movs r3, 0x4
	b _080CB2AA
_080CB278:
	movs r3, 0x5
	b _080CB2AA
_080CB27C:
	movs r3, 0x6
	b _080CB2AA
_080CB280:
	movs r3, 0x7
	b _080CB2AA
_080CB284:
	movs r3, 0x8
	b _080CB2AA
_080CB288:
	movs r3, 0x9
	b _080CB2AA
_080CB28C:
	movs r3, 0xA
	b _080CB2AA
_080CB290:
	movs r3, 0xB
	b _080CB2AA
_080CB294:
	movs r3, 0xC
	b _080CB2AA
_080CB298:
	movs r3, 0xD
	b _080CB2AA
_080CB29C:
	movs r3, 0xE
	b _080CB2AA
_080CB2A0:
	movs r3, 0x3
	b _080CB2AA
_080CB2A4:
	movs r3, 0x2
	b _080CB2AA
_080CB2A8:
	movs r3, 0
_080CB2AA:
	ldr r1, [r4]
	movs r0, 0x14
	ldrsb r0, [r1, r0]
	cmp r0, 0xA
	bne _080CB2F2
	movs r0, 0x15
	ldrsb r0, [r1, r0]
	cmp r0, 0x4
	bhi _080CB2F2
	lsls r0, 2
	ldr r1, _080CB2C8 @ =_080CB2CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB2C8: .4byte _080CB2CC
	.align 2, 0
_080CB2CC:
	.4byte _080CB2E0
	.4byte _080CB2E4
	.4byte _080CB2E8
	.4byte _080CB2EC
	.4byte _080CB2F0
_080CB2E0:
	movs r3, 0x4
	b _080CB2F2
_080CB2E4:
	movs r3, 0x5
	b _080CB2F2
_080CB2E8:
	movs r3, 0x6
	b _080CB2F2
_080CB2EC:
	movs r3, 0x7
	b _080CB2F2
_080CB2F0:
	movs r3, 0x8
_080CB2F2:
	ldr r1, [r4]
	movs r0, 0x14
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bne _080CB314
	movs r0, 0x15
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	blt _080CB314
	cmp r0, 0x9
	ble _080CB30E
	cmp r0, 0xA
	beq _080CB312
	b _080CB314
_080CB30E:
	movs r3, 0xF
	b _080CB314
_080CB312:
	movs r3, 0x3
_080CB314:
	ldr r0, _080CB324 @ =0x0000403a
	adds r1, r3, 0
	bl sub_806E584
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB324: .4byte 0x0000403a
	thumb_func_end sub_80CB204

	thumb_func_start sub_80CB328
sub_80CB328: @ 80CB328
	push {r4-r6,lr}
	ldr r3, _080CB35C @ =gUnknown_2039A0E
	movs r0, 0
	strh r0, [r3]
	ldr r1, _080CB360 @ =gUnknown_2039A10
	strh r0, [r1]
	ldr r0, _080CB364 @ =gUnknown_3005008
	ldr r5, [r0]
	movs r2, 0x14
	ldrsb r2, [r5, r2]
	adds r4, r3, 0
	adds r3, r1, 0
	adds r6, r0, 0
	cmp r2, 0x1
	bne _080CB40C
	ldrb r0, [r5, 0x15]
	subs r0, 0x2A
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xF
	bhi _080CB40C
	lsls r0, 2
	ldr r1, _080CB368 @ =_080CB36C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB35C: .4byte gUnknown_2039A0E
_080CB360: .4byte gUnknown_2039A10
_080CB364: .4byte gUnknown_3005008
_080CB368: .4byte _080CB36C
	.align 2, 0
_080CB36C:
	.4byte _080CB3F6
	.4byte _080CB3FC
	.4byte _080CB40C
	.4byte _080CB404
	.4byte _080CB40C
	.4byte _080CB3F0
	.4byte _080CB3E8
	.4byte _080CB3E2
	.4byte _080CB3DA
	.4byte _080CB3D2
	.4byte _080CB3CA
	.4byte _080CB3C2
	.4byte _080CB3BA
	.4byte _080CB404
	.4byte _080CB3B2
	.4byte _080CB3AC
_080CB3AC:
	movs r0, 0
	strh r0, [r4]
	b _080CB40A
_080CB3B2:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x1
	b _080CB40A
_080CB3BA:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x3
	b _080CB40A
_080CB3C2:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x4
	b _080CB40A
_080CB3CA:
	movs r0, 0x1
	strh r0, [r4]
	movs r0, 0x4
	b _080CB40A
_080CB3D2:
	movs r0, 0x2
	strh r0, [r4]
	movs r0, 0x4
	b _080CB40A
_080CB3DA:
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0x4
	b _080CB40A
_080CB3E2:
	movs r0, 0x4
	strh r0, [r4]
	b _080CB40A
_080CB3E8:
	movs r0, 0x5
	strh r0, [r4]
	movs r0, 0x4
	b _080CB40A
_080CB3F0:
	movs r0, 0x5
	strh r0, [r4]
	b _080CB40A
_080CB3F6:
	movs r0, 0
	strh r0, [r4]
	b _080CB40A
_080CB3FC:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x1
	b _080CB40A
_080CB404:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x2
_080CB40A:
	strh r0, [r3]
_080CB40C:
	ldr r1, [r6]
	movs r0, 0x14
	ldrsb r0, [r1, r0]
	cmp r0, 0xA
	bne _080CB466
	movs r0, 0x15
	ldrsb r0, [r1, r0]
	cmp r0, 0x4
	bhi _080CB466
	lsls r0, 2
	ldr r1, _080CB428 @ =_080CB42C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB428: .4byte _080CB42C
	.align 2, 0
_080CB42C:
	.4byte _080CB45E
	.4byte _080CB456
	.4byte _080CB44E
	.4byte _080CB446
	.4byte _080CB440
_080CB440:
	movs r0, 0
	strh r0, [r4]
	b _080CB464
_080CB446:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x1
	b _080CB464
_080CB44E:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x2
	b _080CB464
_080CB456:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x3
	b _080CB464
_080CB45E:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x4
_080CB464:
	strh r0, [r3]
_080CB466:
	ldr r1, [r6]
	movs r0, 0x14
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bne _080CB490
	movs r0, 0x15
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	blt _080CB490
	cmp r0, 0x9
	ble _080CB482
	cmp r0, 0xA
	beq _080CB488
	b _080CB490
_080CB482:
	movs r0, 0
	strh r0, [r4]
	b _080CB48E
_080CB488:
	movs r0, 0
	strh r0, [r4]
	movs r0, 0x1
_080CB48E:
	strh r0, [r3]
_080CB490:
	ldrh r0, [r3]
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80CB328

	thumb_func_start sub_80CB498
sub_80CB498: @ 80CB498
	push {r4-r6,lr}
	ldr r0, _080CB4D0 @ =sub_80CB514
	movs r1, 0x9
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080CB4D4 @ =gUnknown_3005098
	adds r4, r1, r0
	movs r3, 0
	strh r3, [r4, 0x2]
	strh r3, [r4, 0x4]
	movs r6, 0x1
	strh r6, [r4, 0x8]
	ldr r0, _080CB4D8 @ =gUnknown_20370C2
	ldr r1, _080CB4DC @ =gUnknown_20370C4
	ldrh r2, [r0]
	ldrh r0, [r1]
	cmp r2, r0
	bls _080CB4E0
	subs r0, r2, r0
	lsls r0, 16
	lsrs r5, r0, 16
	strh r6, [r4, 0xC]
	b _080CB4E8
	.align 2, 0
_080CB4D0: .4byte sub_80CB514
_080CB4D4: .4byte gUnknown_3005098
_080CB4D8: .4byte gUnknown_20370C2
_080CB4DC: .4byte gUnknown_20370C4
_080CB4E0:
	subs r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	strh r3, [r4, 0xC]
_080CB4E8:
	cmp r5, 0x8
	bls _080CB4EE
	movs r5, 0x8
_080CB4EE:
	ldr r0, _080CB510 @ =gUnknown_83F5BB8
	adds r0, r5, r0
	ldrb r0, [r0]
	strh r0, [r4, 0xA]
	movs r0, 0
	bl sub_805ADD4
	ldrb r1, [r4, 0xC]
	adds r0, r5, 0
	bl sub_80CB658
	movs r0, 0x52
	bl sub_80722CC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB510: .4byte gUnknown_83F5BB8
	thumb_func_end sub_80CB498

	thumb_func_start sub_80CB514
sub_80CB514: @ 80CB514
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CB57C @ =gUnknown_3005098
	adds r4, r0, r1
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080CB574
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	movs r0, 0
	bl sub_805ADE0
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080CB574
	movs r0, 0x42
	bl sub_80722CC
	adds r0, r5, 0
	bl sub_8077508
	bl sub_8069B34
	bl sub_805ADF8
_080CB574:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB57C: .4byte gUnknown_3005098
	thumb_func_end sub_80CB514

	thumb_func_start sub_80CB580
sub_80CB580: @ 80CB580
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	ldr r0, _080CB620 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CB614
	ldr r4, _080CB624 @ =gUnknown_2039A0C
	ldr r0, _080CB628 @ =gUnknown_83F5B3C
	bl sub_8003CE4
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r5, _080CB62C @ =0x0000021d
	adds r1, r5, 0
	movs r2, 0xD0
	bl sub_814FF2C
	ldrb r0, [r4]
	movs r1, 0
	adds r2, r5, 0
	movs r3, 0xD
	bl sub_810F2E8
	ldrb r0, [r4]
	ldr r2, _080CB630 @ =gUnknown_8418075
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xFF
	mov r8, r1
	str r1, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	movs r1, 0x2
	movs r3, 0
	bl sub_8002C48
	ldr r1, _080CB634 @ =gUnknown_83F5B44
	ldr r0, _080CB638 @ =gUnknown_20370C2
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r5, [r0]
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0
	bl sub_8005ED4
	ldrb r1, [r4]
	movs r3, 0x38
	subs r3, r0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl sub_8002C48
	ldrb r0, [r4]
	bl sub_8003FA0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8003F20
_080CB614:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB620: .4byte sub_809D6D4
_080CB624: .4byte gUnknown_2039A0C
_080CB628: .4byte gUnknown_83F5B3C
_080CB62C: .4byte 0x0000021d
_080CB630: .4byte gUnknown_8418075
_080CB634: .4byte gUnknown_83F5B44
_080CB638: .4byte gUnknown_20370C2
	thumb_func_end sub_80CB580

	thumb_func_start sub_80CB63C
sub_80CB63C: @ 80CB63C
	push {r4,lr}
	ldr r4, _080CB654 @ =gUnknown_2039A0C
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_810F4D8
	ldrb r0, [r4]
	bl sub_8003E3C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB654: .4byte gUnknown_2039A0C
	thumb_func_end sub_80CB63C

	thumb_func_start sub_80CB658
sub_80CB658: @ 80CB658
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _080CB6A0 @ =sub_80CB6AC
	adds r0, r4, 0
	bl sub_8077650
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CB698
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CB6A4 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r5, [r1, 0xC]
	ldr r0, _080CB6A8 @ =gUnknown_83F5BC1
	adds r0, r6, r0
	ldrb r0, [r0]
	strh r0, [r1, 0xE]
_080CB698:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB6A0: .4byte sub_80CB6AC
_080CB6A4: .4byte gUnknown_3005090
_080CB6A8: .4byte gUnknown_83F5BC1
	thumb_func_end sub_80CB658

	thumb_func_start sub_80CB6AC
sub_80CB6AC: @ 80CB6AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r0, 2
	ldr r1, [sp]
	adds r0, r1
	lsls r0, 3
	ldr r1, _080CB734 @ =gUnknown_3005098
	adds r6, r0, r1
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	cmp r0, 0x6
	bne _080CB7A8
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CB73C
	movs r1, 0
	ldr r2, _080CB738 @ =gUnknown_83F5B94
	mov r10, r2
_080CB6E6:
	movs r5, 0
	adds r7, r1, 0x7
	lsls r0, r1, 1
	adds r2, r1, 0x1
	mov r8, r2
	adds r0, r1
	lsls r0, 1
	mov r9, r0
_080CB6F6:
	adds r4, r5, 0
	adds r4, 0x8
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	asrs r0, 15
	add r0, r9
	add r0, r10
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 4
	adds r2, r1, 0
	orrs r2, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_8058FA4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080CB6F6
	mov r2, r8
	lsls r0, r2, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _080CB6E6
	b _080CB78E
	.align 2, 0
_080CB734: .4byte gUnknown_3005098
_080CB738: .4byte gUnknown_83F5B94
_080CB73C:
	movs r1, 0
	ldr r0, _080CB7C0 @ =gUnknown_83F5BA6
	mov r10, r0
_080CB742:
	movs r5, 0
	adds r7, r1, 0x7
	lsls r0, r1, 1
	adds r2, r1, 0x1
	mov r8, r2
	adds r0, r1
	lsls r0, 1
	mov r9, r0
_080CB752:
	adds r4, r5, 0
	adds r4, 0x8
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	asrs r0, 15
	add r0, r9
	add r0, r10
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 4
	adds r2, r1, 0
	orrs r2, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_8058FA4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080CB752
	mov r2, r8
	lsls r0, r2, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _080CB742
_080CB78E:
	bl sub_805A684
	movs r0, 0
	strh r0, [r6, 0x2]
	movs r0, 0
	ldrsh r1, [r6, r0]
	movs r2, 0x6
	ldrsh r0, [r6, r2]
	cmp r1, r0
	bne _080CB7A8
	ldr r0, [sp]
	bl sub_8077508
_080CB7A8:
	ldrh r0, [r6, 0x2]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CB7C0: .4byte gUnknown_83F5BA6
	thumb_func_end sub_80CB6AC

	thumb_func_start sub_80CB7C4
sub_80CB7C4: @ 80CB7C4
	push {r4,r5,lr}
	ldr r0, _080CB808 @ =sub_809D6D4
	bl sub_81119D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CB7D6
	b _080CB8F8
_080CB7D6:
	ldr r0, _080CB80C @ =sub_80CB904
	movs r1, 0x8
	bl sub_807741C
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CB810 @ =gUnknown_3005090
	adds r3, r0, r1
	ldr r0, _080CB814 @ =gUnknown_20370C0
	ldrh r4, [r0]
	cmp r4, 0x3
	beq _080CB886
	cmp r4, 0x3
	bgt _080CB818
	cmp r4, 0x1
	beq _080CB842
	cmp r4, 0x1
	bgt _080CB870
	cmp r4, 0
	beq _080CB82A
	b _080CB8EC
	.align 2, 0
_080CB808: .4byte sub_809D6D4
_080CB80C: .4byte sub_80CB904
_080CB810: .4byte gUnknown_3005090
_080CB814: .4byte gUnknown_20370C0
_080CB818:
	cmp r4, 0x5
	beq _080CB8B4
	cmp r4, 0x5
	blt _080CB89E
	cmp r4, 0x6
	beq _080CB8D2
	cmp r4, 0x63
	beq _080CB8F8
	b _080CB8EC
_080CB82A:
	movs r0, 0x4
	strh r0, [r3, 0x8]
	movs r0, 0x9
	strh r0, [r3, 0xA]
	movs r1, 0x1
	strh r1, [r3, 0xC]
	strh r1, [r3, 0xE]
	movs r0, 0xC
	strh r0, [r3, 0x10]
	movs r0, 0x7
	strh r0, [r3, 0x12]
	b _080CB8E6
_080CB842:
	movs r2, 0
	movs r0, 0x7
	strh r0, [r3, 0x8]
	movs r1, 0xC
	strh r1, [r3, 0xA]
	strh r4, [r3, 0xC]
	strh r4, [r3, 0xE]
	movs r0, 0x8
	strh r0, [r3, 0x10]
	strh r1, [r3, 0x12]
	strh r2, [r3, 0x14]
	strh r5, [r3, 0x26]
	ldr r0, _080CB868 @ =gUnknown_2039A0E
	ldrh r0, [r0]
	strh r0, [r3, 0x16]
	ldr r0, _080CB86C @ =gUnknown_2039A10
	ldrh r0, [r0]
	strh r0, [r3, 0x18]
	b _080CB8F8
	.align 2, 0
_080CB868: .4byte gUnknown_2039A0E
_080CB86C: .4byte gUnknown_2039A10
_080CB870:
	movs r1, 0
	movs r0, 0x4
	strh r0, [r3, 0x8]
	strh r0, [r3, 0xA]
	movs r0, 0x1
	strh r0, [r3, 0xC]
	strh r0, [r3, 0xE]
	movs r0, 0x8
	strh r0, [r3, 0x10]
	strh r0, [r3, 0x12]
	b _080CB8E6
_080CB886:
	movs r1, 0
	movs r0, 0x4
	strh r0, [r3, 0x8]
	movs r0, 0x6
	strh r0, [r3, 0xA]
	movs r0, 0x1
	strh r0, [r3, 0xC]
	strh r0, [r3, 0xE]
	movs r0, 0x8
	strh r0, [r3, 0x10]
	strh r0, [r3, 0x12]
	b _080CB8E6
_080CB89E:
	movs r0, 0x4
	strh r0, [r3, 0x8]
	strh r0, [r3, 0xA]
	movs r1, 0x1
	strh r1, [r3, 0xC]
	strh r1, [r3, 0xE]
	movs r0, 0x11
	strh r0, [r3, 0x10]
	movs r0, 0x8
	strh r0, [r3, 0x12]
	b _080CB8E6
_080CB8B4:
	movs r2, 0
	movs r0, 0x7
	strh r0, [r3, 0x8]
	movs r1, 0xC
	strh r1, [r3, 0xA]
	movs r0, 0x10
	strh r0, [r3, 0xC]
	movs r0, 0x1
	strh r0, [r3, 0xE]
	movs r0, 0x11
	strh r0, [r3, 0x10]
	strh r1, [r3, 0x12]
	strh r2, [r3, 0x14]
	strh r5, [r3, 0x26]
	b _080CB8F8
_080CB8D2:
	movs r1, 0
	movs r0, 0x3
	strh r0, [r3, 0x8]
	strh r0, [r3, 0xA]
	movs r0, 0x1
	strh r0, [r3, 0xC]
	strh r0, [r3, 0xE]
	movs r0, 0x8
	strh r0, [r3, 0x10]
	strh r4, [r3, 0x12]
_080CB8E6:
	strh r1, [r3, 0x14]
	strh r5, [r3, 0x26]
	b _080CB8F8
_080CB8EC:
	ldr r1, _080CB900 @ =gUnknown_20370D0
	movs r0, 0x7F
	strh r0, [r1]
	adds r0, r5, 0
	bl sub_8077508
_080CB8F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB900: .4byte gUnknown_20370D0
	thumb_func_end sub_80CB7C4

	thumb_func_start sub_80CB904
sub_80CB904: @ 80CB904
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080CB934 @ =gUnknown_3005090
	adds r5, r0, r1
	bl sub_8069940
	ldr r0, _080CB938 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080CB944
	ldr r0, _080CB93C @ =gUnknown_2039A18
	ldr r1, _080CB940 @ =gUnknown_2039A0E
	ldrh r1, [r1]
	strh r1, [r0]
	b _080CB94A
	.align 2, 0
_080CB934: .4byte gUnknown_3005090
_080CB938: .4byte gUnknown_20370C0
_080CB93C: .4byte gUnknown_2039A18
_080CB940: .4byte gUnknown_2039A0E
_080CB944:
	ldr r1, _080CBA60 @ =gUnknown_2039A18
	movs r0, 0
	strh r0, [r1]
_080CB94A:
	ldr r4, _080CBA64 @ =gUnknown_2039A14
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r0, 3
	bl sub_8002BB0
	str r0, [r4]
	bl sub_80CBA7C
	movs r6, 0
	movs r4, 0
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r3, r7, 2
	mov r10, r3
	add r1, sp, 0x18
	mov r9, r1
	cmp r6, r0
	bge _080CB9AE
	ldr r2, _080CBA68 @ =gUnknown_83F5BCC
	mov r8, r2
_080CB974:
	ldr r0, _080CBA64 @ =gUnknown_2039A14
	ldr r0, [r0]
	lsls r3, r4, 3
	adds r3, r0
	lsls r2, r4, 2
	ldr r0, _080CBA6C @ =gUnknown_20370C0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	adds r2, r0
	add r2, r8
	ldr r1, [r2]
	str r1, [r3]
	str r4, [r3, 0x4]
	movs r0, 0x2
	movs r2, 0
	bl sub_8005ED4
	cmp r0, r6
	ble _080CB9A0
	adds r6, r0, 0
_080CB9A0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0xA
	ldrsh r0, [r5, r3]
	cmp r4, r0
	blt _080CB974
_080CB9AE:
	adds r0, r6, 0
	adds r0, 0x9
	cmp r0, 0
	bge _080CB9B8
	adds r0, 0x7
_080CB9B8:
	asrs r0, 3
	adds r2, r0, 0x1
	strh r2, [r5, 0x10]
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	movs r3, 0x10
	ldrsh r1, [r5, r3]
	adds r0, r1
	cmp r0, 0x1D
	ble _080CB9D2
	movs r0, 0x1D
	subs r0, r2
	strh r0, [r5, 0xC]
_080CB9D2:
	ldrb r2, [r5, 0xC]
	ldrb r3, [r5, 0xE]
	ldrb r0, [r5, 0x10]
	str r0, [sp]
	ldrb r0, [r5, 0x12]
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x38
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	bl sub_810FE50
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	mov r0, r9
	bl sub_8003CE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r1, 0
	bl sub_80F7750
	ldr r4, _080CBA70 @ =gUnknown_3005360
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x22]
	strb r0, [r4, 0x10]
	adds r0, r7, 0
	bl sub_80CBCC0
	ldrh r1, [r5, 0x16]
	ldrh r2, [r5, 0x18]
	adds r0, r4, 0
	bl sub_8106FF8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x22]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8003FA0
	ldrh r0, [r5, 0x22]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8003F20
	ldr r1, _080CBA74 @ =gUnknown_3005090
	mov r2, r10
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CBA78 @ =sub_80CBB28
	str r1, [r0]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CBA60: .4byte gUnknown_2039A18
_080CBA64: .4byte gUnknown_2039A14
_080CBA68: .4byte gUnknown_83F5BCC
_080CBA6C: .4byte gUnknown_20370C0
_080CBA70: .4byte gUnknown_3005360
_080CBA74: .4byte gUnknown_3005090
_080CBA78: .4byte sub_80CBB28
	thumb_func_end sub_80CB904

	thumb_func_start sub_80CBA7C
sub_80CBA7C: @ 80CBA7C
	ldr r2, _080CBAD0 @ =gUnknown_3005360
	ldr r0, _080CBAD4 @ =gUnknown_2039A14
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080CBAD8 @ =sub_80CBADC
	str r0, [r2, 0x4]
	movs r0, 0
	str r0, [r2, 0x8]
	movs r1, 0
	movs r0, 0x1
	strh r0, [r2, 0xC]
	strh r0, [r2, 0xE]
	strb r1, [r2, 0x10]
	strb r1, [r2, 0x11]
	movs r0, 0x8
	strb r0, [r2, 0x12]
	strb r1, [r2, 0x13]
	movs r0, 0x20
	strb r0, [r2, 0x14]
	movs r3, 0x1
	movs r0, 0x31
	strb r0, [r2, 0x15]
	ldrb r1, [r2, 0x16]
	subs r0, 0x39
	ands r0, r1
	orrs r0, r3
	movs r1, 0x39
	negs r1, r1
	ands r0, r1
	movs r3, 0x3F
	ands r0, r3
	strb r0, [r2, 0x16]
	ldrb r1, [r2, 0x17]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	ands r0, r3
	strb r0, [r2, 0x17]
	bx lr
	.align 2, 0
_080CBAD0: .4byte gUnknown_3005360
_080CBAD4: .4byte gUnknown_2039A14
_080CBAD8: .4byte sub_80CBADC
	thumb_func_end sub_80CBA7C

	thumb_func_start sub_80CBADC
sub_80CBADC: @ 80CBADC
	push {r4,lr}
	movs r0, 0x5
	bl sub_80722CC
	ldr r0, _080CBB18 @ =sub_80CBB28
	bl sub_8077688
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080CBB12
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080CBB1C @ =gUnknown_3005090
	adds r0, r1
	ldrh r0, [r0, 0x24]
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080CBB20 @ =gUnknown_3005378
	adds r1, r4, 0
	movs r2, 0
	bl sub_81072D4
	ldr r1, _080CBB24 @ =gUnknown_2039A18
	ldrh r0, [r4]
	strh r0, [r1]
_080CBB12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBB18: .4byte sub_80CBB28
_080CBB1C: .4byte gUnknown_3005090
_080CBB20: .4byte gUnknown_3005378
_080CBB24: .4byte gUnknown_2039A18
	thumb_func_end sub_80CBADC

	thumb_func_start sub_80CBB28
sub_80CBB28: @ 80CBB28
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CBB54 @ =gUnknown_3005090
	adds r6, r0, r1
	ldrh r0, [r6, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8107078
	adds r4, r0, 0
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _080CBB58
	adds r0, 0x1
	cmp r4, r0
	bne _080CBB6C
	b _080CBBA2
	.align 2, 0
_080CBB54: .4byte gUnknown_3005090
_080CBB58:
	ldr r1, _080CBB68 @ =gUnknown_20370D0
	movs r0, 0x7F
	strh r0, [r1]
	movs r0, 0x5
	bl sub_80722CC
	b _080CBB88
	.align 2, 0
_080CBB68: .4byte gUnknown_20370D0
_080CBB6C:
	ldr r0, _080CBB90 @ =gUnknown_20370D0
	strh r4, [r0]
	movs r0, 0x5
	bl sub_80722CC
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080CBB88
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	subs r0, 0x1
	cmp r4, r0
	bne _080CBB94
_080CBB88:
	adds r0, r5, 0
	bl sub_80CBBAC
	b _080CBBA2
	.align 2, 0
_080CBB90: .4byte gUnknown_20370D0
_080CBB94:
	adds r0, r5, 0
	bl sub_80CBD50
	ldr r0, _080CBBA8 @ =sub_80CBC2C
	str r0, [r6]
	bl sub_8069B34
_080CBBA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBBA8: .4byte sub_80CBC2C
	thumb_func_end sub_80CBB28

	thumb_func_start sub_80CBBAC
sub_80CBBAC: @ 80CBBAC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080CBC24 @ =gUnknown_3005090
	adds r4, r0
	adds r0, r5, 0
	bl sub_80CBD50
	ldrh r0, [r4, 0x24]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	ldr r0, _080CBC28 @ =gUnknown_2039A14
	ldr r0, [r0]
	bl sub_8002BC4
	ldrh r0, [r4, 0x22]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_810F4D8
	ldrh r0, [r4, 0x22]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_800445C
	ldrh r0, [r4, 0x22]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80040B8
	ldrh r0, [r4, 0x22]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8003F20
	ldrh r0, [r4, 0x22]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8003E3C
	adds r0, r5, 0
	bl sub_8077508
	bl sub_8069B34
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBC24: .4byte gUnknown_3005090
_080CBC28: .4byte gUnknown_2039A14
	thumb_func_end sub_80CBBAC

	thumb_func_start sub_80CBC2C
sub_80CBC2C: @ 80CBC2C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CBC54 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x14
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080CBC50
	cmp r0, 0x2
	bne _080CBC50
	movs r0, 0x1
	strh r0, [r1, 0x14]
	ldr r0, _080CBC58 @ =sub_80CBC90
	str r0, [r1]
_080CBC50:
	pop {r0}
	bx r0
	.align 2, 0
_080CBC54: .4byte gUnknown_3005090
_080CBC58: .4byte sub_80CBC90
	thumb_func_end sub_80CBC2C

	thumb_func_start sub_80CBC5C
sub_80CBC5C: @ 80CBC5C
	push {lr}
	ldr r0, _080CBC74 @ =sub_80CBC2C
	bl sub_8077688
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080CBC78
	bl sub_8069B34
	b _080CBC88
	.align 2, 0
_080CBC74: .4byte sub_80CBC2C
_080CBC78:
	ldr r0, _080CBC8C @ =gUnknown_3005090
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	adds r0, 0x1
	strh r0, [r1, 0x14]
_080CBC88:
	pop {r0}
	bx r0
	.align 2, 0
_080CBC8C: .4byte gUnknown_3005090
	thumb_func_end sub_80CBC5C

	thumb_func_start sub_80CBC90
sub_80CBC90: @ 80CBC90
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8069940
	adds r0, r4, 0
	bl sub_80CBCC0
	ldr r1, _080CBCB8 @ =gUnknown_3005090
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CBCBC @ =sub_80CBB28
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBCB8: .4byte gUnknown_3005090
_080CBCBC: .4byte sub_80CBB28
	thumb_func_end sub_80CBC90

	thumb_func_start sub_80CBCC0
sub_80CBCC0: @ 80CBCC0
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080CBD44 @ =gUnknown_3005090
	adds r4, r1, r0
	mov r1, sp
	ldr r0, _080CBD48 @ =gUnknown_83F5D1C
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080CBD3C
	mov r2, sp
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	lsls r1, 2
	movs r5, 0xC
	ldrsh r0, [r4, r5]
	lsls r0, 3
	adds r1, r0
	movs r3, 0
	strb r1, [r2, 0x1]
	mov r1, sp
	movs r0, 0x8
	strb r0, [r1, 0x2]
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	lsls r1, 2
	movs r5, 0xC
	ldrsh r0, [r4, r5]
	lsls r0, 3
	adds r1, r0
	strb r1, [r2, 0x4]
	mov r1, sp
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r0, 0xA
	strb r0, [r1, 0x5]
	mov r0, sp
	strh r3, [r0, 0x6]
	mov r2, sp
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	subs r0, r1
	strh r0, [r2, 0x8]
	ldr r1, _080CBD4C @ =gUnknown_2039A18
	mov r0, sp
	bl sub_8133A20
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
_080CBD3C:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBD44: .4byte gUnknown_3005090
_080CBD48: .4byte gUnknown_83F5D1C
_080CBD4C: .4byte gUnknown_2039A18
	thumb_func_end sub_80CBCC0

	thumb_func_start sub_80CBD50
sub_80CBD50: @ 80CBD50
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080CBD7C @ =gUnknown_3005090
	adds r2, r1, r0
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r1, r0
	beq _080CBD76
	ldrh r0, [r2, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8133C30
_080CBD76:
	pop {r0}
	bx r0
	.align 2, 0
_080CBD7C: .4byte gUnknown_3005090
	thumb_func_end sub_80CBD50

	thumb_func_start sub_80CBD80
sub_80CBD80: @ 80CBD80
	push {lr}
	movs r0, 0x16
	bl sub_812B1F0
	movs r0, 0x8
	bl sub_805BDEC
	pop {r0}
	bx r0
	thumb_func_end sub_80CBD80

	thumb_func_start sub_80CBD94
sub_80CBD94: @ 80CBD94
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x2
	bls _080CBDA0
	movs r1, 0
_080CBDA0:
	ldr r0, _080CBDAC @ =gUnknown_83F5D2C
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_080CBDAC: .4byte gUnknown_83F5D2C
	thumb_func_end sub_80CBD94

	thumb_func_start sub_80CBDB0
sub_80CBDB0: @ 80CBDB0
	push {lr}
	ldr r0, _080CBDC8 @ =0x00004031
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	bl sub_80CBD94
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080CBDC8: .4byte 0x00004031
	thumb_func_end sub_80CBDB0

	thumb_func_start sub_80CBDCC
sub_80CBDCC: @ 80CBDCC
	push {lr}
	ldr r0, _080CBDE4 @ =gUnknown_20370C0
	ldrh r0, [r0]
	bl sub_8043298
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8088E74
	pop {r0}
	bx r0
	.align 2, 0
_080CBDE4: .4byte gUnknown_20370C0
	thumb_func_end sub_80CBDCC

	thumb_func_start sub_80CBDE8
sub_80CBDE8: @ 80CBDE8
	ldr r1, _080CBDF8 @ =gUnknown_3005074
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080CBDFC @ =gUnknown_20370DA
	movs r0, 0xFF
	strh r0, [r1]
	bx lr
	.align 2, 0
_080CBDF8: .4byte gUnknown_3005074
_080CBDFC: .4byte gUnknown_20370DA
	thumb_func_end sub_80CBDE8

	thumb_func_start sub_80CBE00
sub_80CBE00: @ 80CBE00
	push {lr}
	ldr r0, _080CBE18 @ =gUnknown_20370DA
	ldrh r0, [r0]
	cmp r0, 0xFF
	bne _080CBE44
	ldr r1, _080CBE1C @ =gUnknown_3005074
	ldrb r0, [r1]
	cmp r0, 0
	bne _080CBE20
	movs r0, 0x3
	b _080CBE48
	.align 2, 0
_080CBE18: .4byte gUnknown_20370DA
_080CBE1C: .4byte gUnknown_3005074
_080CBE20:
	ldr r2, _080CBE4C @ =gUnknown_2036E38
	ldrb r1, [r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x5]
	cmp r0, 0xEF
	bls _080CBE40
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl sub_806E5A4
	lsls r0, 24
	lsrs r0, 24
_080CBE40:
	bl sub_813CD24
_080CBE44:
	lsls r0, 24
	lsrs r0, 24
_080CBE48:
	pop {r1}
	bx r1
	.align 2, 0
_080CBE4C: .4byte gUnknown_2036E38
	thumb_func_end sub_80CBE00

	thumb_func_start sub_80CBE50
sub_80CBE50: @ 80CBE50
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080CBEA4 @ =gUnknown_2024284
	adds r5, r1, r0
	ldr r6, _080CBEA8 @ =gUnknown_2021CD0
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r6, 0
	bl sub_803FBE8
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, sp
	bl sub_803FBE8
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080CBEB0
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	movs r1, 0xB
	muls r0, r1
	ldr r1, _080CBEAC @ =gUnknown_8245EE0
	adds r0, r1
	adds r1, r6, 0
	bl sub_8008E28
	cmp r0, 0
	bne _080CBEB0
	movs r0, 0
	b _080CBEB2
	.align 2, 0
_080CBEA4: .4byte gUnknown_2024284
_080CBEA8: .4byte gUnknown_2021CD0
_080CBEAC: .4byte gUnknown_8245EE0
_080CBEB0:
	movs r0, 0x1
_080CBEB2:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80CBE50

	thumb_func_start sub_80CBEBC
sub_80CBEBC: @ 80CBEBC
	push {lr}
	bl sub_80CACFC
	lsls r0, 24
	lsrs r0, 24
	bl sub_80CBE50
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80CBEBC

	thumb_func_start sub_80CBED4
sub_80CBED4: @ 80CBED4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_80CBF04
	adds r3, r0, 0
	ldr r0, _080CBF00 @ =gUnknown_83F5AF8
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsls r3, 24
	lsrs r3, 24
	adds r1, r5, 0
	movs r2, 0
	bl sub_8008E78
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBF00: .4byte gUnknown_83F5AF8
	thumb_func_end sub_80CBED4

	thumb_func_start sub_80CBF04
sub_80CBF04: @ 80CBF04
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xA
	bl __divsi3
	cmp r0, 0
	beq _080CBF90
	adds r0, r4, 0
	movs r1, 0x64
	bl __divsi3
	cmp r0, 0
	bne _080CBF22
	movs r0, 0x2
	b _080CBF9A
_080CBF22:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080CBF34
	movs r0, 0x3
	b _080CBF9A
_080CBF34:
	ldr r1, _080CBF44 @ =0x00002710
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080CBF48
	movs r0, 0x4
	b _080CBF9A
	.align 2, 0
_080CBF44: .4byte 0x00002710
_080CBF48:
	ldr r1, _080CBF58 @ =0x000186a0
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080CBF5C
	movs r0, 0x5
	b _080CBF9A
	.align 2, 0
_080CBF58: .4byte 0x000186a0
_080CBF5C:
	ldr r1, _080CBF6C @ =0x000f4240
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080CBF70
	movs r0, 0x6
	b _080CBF9A
	.align 2, 0
_080CBF6C: .4byte 0x000f4240
_080CBF70:
	ldr r1, _080CBF80 @ =0x00989680
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080CBF84
	movs r0, 0x7
	b _080CBF9A
	.align 2, 0
_080CBF80: .4byte 0x00989680
_080CBF84:
	ldr r1, _080CBF94 @ =0x05f5e100
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	beq _080CBF98
_080CBF90:
	movs r0, 0x1
	b _080CBF9A
	.align 2, 0
_080CBF94: .4byte 0x05f5e100
_080CBF98:
	movs r0, 0x8
_080CBF9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CBF04

	thumb_func_start sub_80CBFA0
sub_80CBFA0: @ 80CBFA0
	push {r4,lr}
	ldr r0, _080CBFC8 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CBFCC @ =gUnknown_2024284
	adds r0, r1
	ldr r4, _080CBFD0 @ =gUnknown_2021CD0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_803FBE8
	ldr r0, _080CBFD4 @ =gUnknown_2021D04
	adds r1, r4, 0
	bl sub_8008E28
	cmp r0, 0
	beq _080CBFD8
	movs r0, 0x1
	b _080CBFDA
	.align 2, 0
_080CBFC8: .4byte gUnknown_20370C0
_080CBFCC: .4byte gUnknown_2024284
_080CBFD0: .4byte gUnknown_2021CD0
_080CBFD4: .4byte gUnknown_2021D04
_080CBFD8:
	movs r0, 0
_080CBFDA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CBFA0

	thumb_func_start sub_80CBFE0
sub_80CBFE0: @ 80CBFE0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	ldr r0, _080CC050 @ =gUnknown_20370D6
	ldrb r0, [r0]
	ldr r1, _080CC054 @ =gUnknown_20370D8
	ldrb r1, [r1]
	bl sub_808BD30
	adds r6, r0, 0
	ldr r2, _080CC058 @ =gUnknown_2021D04
	movs r1, 0x2
	bl sub_803FD44
	ldr r0, _080CC05C @ =gUnknown_2021CF0
	mov r8, r0
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, r8
	bl sub_803FD44
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0
	bl sub_803FD44
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl sub_803F730
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl sub_803FD44
	str r0, [sp]
	ldr r0, _080CC060 @ =sub_80CC064
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r8
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_809D954
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CC050: .4byte gUnknown_20370D6
_080CC054: .4byte gUnknown_20370D8
_080CC058: .4byte gUnknown_2021D04
_080CC05C: .4byte gUnknown_2021CF0
_080CC060: .4byte sub_80CC064
	thumb_func_end sub_80CBFE0

	thumb_func_start sub_80CC064
sub_80CC064: @ 80CC064
	push {lr}
	ldr r0, _080CC07C @ =gUnknown_20370D6
	ldrb r0, [r0]
	ldr r1, _080CC080 @ =gUnknown_20370D8
	ldrb r1, [r1]
	ldr r2, _080CC084 @ =gUnknown_2021CF0
	bl sub_808BB2C
	bl sub_80568E0
	pop {r0}
	bx r0
	.align 2, 0
_080CC07C: .4byte gUnknown_20370D6
_080CC080: .4byte gUnknown_20370D8
_080CC084: .4byte gUnknown_2021CF0
	thumb_func_end sub_80CC064

	thumb_func_start sub_80CC088
sub_80CC088: @ 80CC088
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r0, _080CC130 @ =gUnknown_20370C0
	mov r9, r0
	ldrh r0, [r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _080CC134 @ =gUnknown_2024284
	adds r0, r6
	ldr r2, _080CC138 @ =gUnknown_2021D04
	movs r1, 0x2
	bl sub_803FBE8
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	ldr r1, _080CC13C @ =gUnknown_2021CF0
	mov r10, r1
	movs r1, 0x2
	mov r2, r10
	bl sub_803FBE8
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl sub_803FBE8
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	bl sub_803F720
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0
	movs r2, 0
	bl sub_803FBE8
	str r0, [sp]
	ldr r0, _080CC140 @ =sub_80CC144
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r10
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_809D954
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CC130: .4byte gUnknown_20370C0
_080CC134: .4byte gUnknown_2024284
_080CC138: .4byte gUnknown_2021D04
_080CC13C: .4byte gUnknown_2021CF0
_080CC140: .4byte sub_80CC144
	thumb_func_end sub_80CC088

	thumb_func_start sub_80CC144
sub_80CC144: @ 80CC144
	push {lr}
	ldr r0, _080CC164 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CC168 @ =gUnknown_2024284
	adds r0, r1
	ldr r2, _080CC16C @ =gUnknown_2021CF0
	movs r1, 0x2
	bl sub_804037C
	bl sub_80568E0
	pop {r0}
	bx r0
	.align 2, 0
_080CC164: .4byte gUnknown_20370C0
_080CC168: .4byte gUnknown_2024284
_080CC16C: .4byte gUnknown_2021CF0
	thumb_func_end sub_80CC144

	thumb_func_start sub_80CC170
sub_80CC170: @ 80CC170
	push {r4,lr}
	ldr r0, _080CC194 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CC198 @ =gUnknown_2024284
	adds r0, r1
	ldr r4, _080CC19C @ =gUnknown_2021CD0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_803FBE8
	adds r0, r4, 0
	bl sub_8008D28
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC194: .4byte gUnknown_20370C0
_080CC198: .4byte gUnknown_2024284
_080CC19C: .4byte gUnknown_2021CD0
	thumb_func_end sub_80CC170

	thumb_func_start sub_80CC1A0
sub_80CC1A0: @ 80CC1A0
	push {r4,lr}
	bl sub_80CC1E4
	adds r4, r0, 0
	ldr r0, _080CC1C8 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CC1CC @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x1
	movs r2, 0
	bl sub_803FBE8
	cmp r4, r0
	bne _080CC1D4
	ldr r1, _080CC1D0 @ =gUnknown_20370D0
	movs r0, 0
	b _080CC1D8
	.align 2, 0
_080CC1C8: .4byte gUnknown_20370C0
_080CC1CC: .4byte gUnknown_2024284
_080CC1D0: .4byte gUnknown_20370D0
_080CC1D4:
	ldr r1, _080CC1E0 @ =gUnknown_20370D0
	movs r0, 0x1
_080CC1D8:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC1E0: .4byte gUnknown_20370D0
	thumb_func_end sub_80CC1A0

	thumb_func_start sub_80CC1E4
sub_80CC1E4: @ 80CC1E4
	ldr r0, _080CC200 @ =gUnknown_300500C
	ldr r2, [r0]
	ldrb r0, [r2, 0xD]
	lsls r0, 24
	ldrb r1, [r2, 0xC]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0xB]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0xA]
	orrs r0, r1
	bx lr
	.align 2, 0
_080CC200: .4byte gUnknown_300500C
	thumb_func_end sub_80CC1E4

	thumb_func_start sub_80CC204
sub_80CC204: @ 80CC204
	push {r4,lr}
	movs r4, 0
	ldr r0, _080CC2A4 @ =0x0000089b
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC218
	movs r4, 0x1
_080CC218:
	ldr r0, _080CC2A8 @ =0x0000089c
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC22A
	movs r0, 0x2
	orrs r4, r0
_080CC22A:
	ldr r0, _080CC2AC @ =0x0000089d
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC240
	movs r0, 0x4
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080CC240:
	ldr r0, _080CC2B0 @ =0x0000089e
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC256
	movs r0, 0x8
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080CC256:
	ldr r0, _080CC2B4 @ =0x0000089f
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC26C
	movs r0, 0x10
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080CC26C:
	ldr r0, _080CC2B8 @ =0x000008a1
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC282
	movs r0, 0x20
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080CC282:
	movs r0, 0x8A
	lsls r0, 4
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC29A
	movs r0, 0x40
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080CC29A:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CC2A4: .4byte 0x0000089b
_080CC2A8: .4byte 0x0000089c
_080CC2AC: .4byte 0x0000089d
_080CC2B0: .4byte 0x0000089e
_080CC2B4: .4byte 0x0000089f
_080CC2B8: .4byte 0x000008a1
	thumb_func_end sub_80CC204

	thumb_func_start sub_80CC2BC
sub_80CC2BC: @ 80CC2BC
	push {r4-r7,lr}
	sub sp, 0x24
	movs r5, 0
	add r7, sp, 0xC
	movs r1, 0
_080CC2C6:
	lsls r0, r5, 1
	add r0, sp
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080CC2C6
	bl sub_8040C3C
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	cmp r5, r6
	bcs _080CC318
_080CC2E4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _080CC3BC @ =gUnknown_2024284
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	lsls r1, r5, 1
	add r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl sub_803FBE8
	lsls r1, r5, 2
	adds r1, r7, r1
	str r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _080CC2E4
_080CC318:
	ldr r4, _080CC3C0 @ =0x00004043
	mov r0, sp
	ldrh r0, [r0]
	ldr r1, [sp, 0xC]
	bl sub_8097F00
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	adds r4, 0x1
	mov r0, sp
	ldrh r0, [r0, 0x2]
	ldr r1, [r7, 0x4]
	bl sub_8097F00
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	adds r4, 0x1
	mov r0, sp
	ldrh r0, [r0, 0x4]
	ldr r1, [r7, 0x8]
	bl sub_8097F00
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	adds r4, 0x1
	mov r0, sp
	ldrh r0, [r0, 0x6]
	ldr r1, [r7, 0xC]
	bl sub_8097F00
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	adds r4, 0x1
	mov r0, sp
	ldrh r0, [r0, 0x8]
	ldr r1, [r7, 0x10]
	bl sub_8097F00
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	adds r4, 0x1
	mov r0, sp
	ldrh r0, [r0, 0xA]
	ldr r1, [r7, 0x14]
	bl sub_8097F00
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
	ldr r0, _080CC3C4 @ =0x00004042
	ldr r1, _080CC3C8 @ =gUnknown_20370C0
	ldrh r1, [r1]
	bl sub_806E584
	add sp, 0x24
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC3BC: .4byte gUnknown_2024284
_080CC3C0: .4byte 0x00004043
_080CC3C4: .4byte 0x00004042
_080CC3C8: .4byte gUnknown_20370C0
	thumb_func_end sub_80CC2BC

	thumb_func_start sub_80CC3CC
sub_80CC3CC: @ 80CC3CC
	push {r4-r6,lr}
	movs r5, 0
	ldr r4, _080CC3F8 @ =gUnknown_20370C0
	movs r0, 0xA
	bl sub_8054EC4
	strh r0, [r4]
	movs r0, 0xD
	bl sub_8054EC4
	adds r6, r0, 0
	ldr r4, _080CC3FC @ =gUnknown_20370C4
	movs r0, 0x17
	bl sub_8054EC4
	strh r0, [r4]
	ldr r1, _080CC400 @ =0x0000ffff
	cmp r6, r1
	bls _080CC408
	ldr r0, _080CC404 @ =gUnknown_20370C2
	strh r1, [r0]
	b _080CC40C
	.align 2, 0
_080CC3F8: .4byte gUnknown_20370C0
_080CC3FC: .4byte gUnknown_20370C4
_080CC400: .4byte 0x0000ffff
_080CC404: .4byte gUnknown_20370C2
_080CC408:
	ldr r0, _080CC440 @ =gUnknown_20370C2
	strh r6, [r0]
_080CC40C:
	adds r1, r0, 0
	ldr r0, _080CC444 @ =gUnknown_20370C0
	ldrh r0, [r0]
	cmp r0, 0
	beq _080CC41A
	movs r0, 0x1
	orrs r5, r0
_080CC41A:
	ldrh r0, [r1]
	cmp r0, 0
	beq _080CC428
	movs r0, 0x2
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r5, r0, 16
_080CC428:
	ldr r0, _080CC448 @ =gUnknown_20370C4
	ldrh r0, [r0]
	cmp r0, 0
	beq _080CC438
	movs r0, 0x4
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r5, r0, 16
_080CC438:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080CC440: .4byte gUnknown_20370C2
_080CC444: .4byte gUnknown_20370C0
_080CC448: .4byte gUnknown_20370C4
	thumb_func_end sub_80CC3CC

	thumb_func_start sub_80CC44C
sub_80CC44C: @ 80CC44C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0
	bne _080CC45E
	lsls r0, 16
	lsrs r0, 16
	b _080CC486
_080CC45E:
	cmp r1, 0x1
	bne _080CC470
	lsrs r0, 16
	movs r1, 0xFF
	ands r0, r1
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r1
	b _080CC486
_080CC470:
	cmp r1, 0x2
	bne _080CC47C
	lsrs r0, 24
	movs r1, 0x7F
	ands r0, r1
	b _080CC486
_080CC47C:
	cmp r2, 0x3
	beq _080CC484
	movs r0, 0x1
	b _080CC486
_080CC484:
	lsrs r0, 31
_080CC486:
	pop {r1}
	bx r1
	thumb_func_end sub_80CC44C

	thumb_func_start sub_80CC48C
sub_80CC48C: @ 80CC48C
	push {r4,r5,lr}
	bl sub_8040C3C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _080CC4CA
_080CC49C:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080CC4B8 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	ldr r1, _080CC4BC @ =gUnknown_20370C0
	ldrh r1, [r1]
	cmp r0, r1
	bne _080CC4C0
	movs r0, 0x1
	b _080CC4CC
	.align 2, 0
_080CC4B8: .4byte gUnknown_2024284
_080CC4BC: .4byte gUnknown_20370C0
_080CC4C0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080CC49C
_080CC4CA:
	movs r0, 0
_080CC4CC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC48C

	thumb_func_start sub_80CC4D4
sub_80CC4D4: @ 80CC4D4
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, _080CC508 @ =gUnknown_3005008
	ldr r4, [r0]
	movs r6, 0x4
	ldrsb r6, [r4, r6]
	ldr r5, _080CC50C @ =gUnknown_83F5D32
	adds r0, r5, 0x2
	mov r12, r0
	adds r7, r5, 0x1
_080CC4E8:
	lsls r0, r3, 1
	adds r2, r0, r3
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r6, r0
	bne _080CC510
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r1, r0
	bne _080CC510
	mov r1, r12
	adds r0, r2, r1
	ldrb r0, [r0]
	b _080CC51C
	.align 2, 0
_080CC508: .4byte gUnknown_3005008
_080CC50C: .4byte gUnknown_83F5D32
_080CC510:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xB
	bls _080CC4E8
	movs r0, 0x1
_080CC51C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC4D4

	thumb_func_start sub_80CC524
sub_80CC524: @ 80CC524
	push {lr}
	movs r0, 0xB
	movs r1, 0
	bl sub_8113550
	pop {r0}
	bx r0
	thumb_func_end sub_80CC524

	thumb_func_start sub_80CC534
sub_80CC534: @ 80CC534
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _080CC57C @ =gUnknown_3005008
	ldr r5, _080CC580 @ =gUnknown_83F5D58
_080CC53C:
	ldr r3, [r6]
	movs r1, 0x4
	ldrsb r1, [r3, r1]
	lsls r0, r4, 3
	adds r2, r0, r5
	ldrh r0, [r2]
	cmp r1, r0
	bne _080CC58C
	movs r0, 0x5
	ldrsb r0, [r3, r0]
	ldrh r2, [r2, 0x2]
	cmp r0, r2
	bne _080CC58C
	ldr r5, _080CC584 @ =0x0000404d
	adds r0, r5, 0
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x23
	bne _080CC56A
	cmp r4, 0x20
	beq _080CC596
_080CC56A:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806E584
	ldr r0, _080CC588 @ =0x00000808
	bl sub_806E680
	b _080CC596
	.align 2, 0
_080CC57C: .4byte gUnknown_3005008
_080CC580: .4byte gUnknown_83F5D58
_080CC584: .4byte 0x0000404d
_080CC588: .4byte 0x00000808
_080CC58C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x32
	bls _080CC53C
_080CC596:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CC534

	thumb_func_start sub_80CC59C
sub_80CC59C: @ 80CC59C
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080CC5F8 @ =0x0000404d
	bl sub_806E568
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r6, _080CC5FC @ =0xffffff00
	ldr r0, [sp, 0x4]
	ands r0, r6
	ldr r4, _080CC600 @ =0xffff00ff
	ands r0, r4
	str r0, [sp, 0x4]
	ldr r0, _080CC604 @ =0x00000808
	bl sub_806E6D0
	lsls r0, 24
	cmp r0, 0
	bne _080CC5C4
	b _080CC71E
_080CC5C4:
	cmp r5, 0x5
	bne _080CC61C
	ldr r0, _080CC608 @ =gUnknown_3005008
	ldr r2, [r0]
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	adds r7, r0, 0
	cmp r1, 0xF
	bne _080CC67C
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, 0
	beq _080CC5E2
	cmp r0, 0x3
	bne _080CC67C
_080CC5E2:
	ldr r1, [sp, 0x4]
	ands r1, r6
	movs r0, 0x66
	orrs r1, r0
	str r1, [sp, 0x4]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, 0
	bne _080CC60C
	lsls r0, r5, 8
	b _080CC610
	.align 2, 0
_080CC5F8: .4byte 0x0000404d
_080CC5FC: .4byte 0xffffff00
_080CC600: .4byte 0xffff00ff
_080CC604: .4byte 0x00000808
_080CC608: .4byte gUnknown_3005008
_080CC60C:
	movs r0, 0xC0
	lsls r0, 3
_080CC610:
	ands r1, r4
	orrs r1, r0
	str r1, [sp, 0x4]
	add r1, sp, 0x4
	movs r0, 0x23
	b _080CC66C
_080CC61C:
	ldr r7, _080CC65C @ =gUnknown_3005008
	cmp r5, 0x3
	bne _080CC67C
	ldr r1, [r7]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x3
	bne _080CC67C
	ldrb r0, [r1, 0x5]
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080CC67C
	ldr r1, _080CC660 @ =gUnknown_83F5D58
	ldrh r0, [r1, 0x18]
	ldrh r1, [r1, 0x1A]
	bl sub_8055238
	ldrb r0, [r0, 0x14]
	add r1, sp, 0x4
	strb r0, [r1]
	ldr r0, [r7]
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	adds r6, r1, 0
	cmp r0, 0x29
	bne _080CC664
	strb r5, [r6, 0x1]
	b _080CC668
	.align 2, 0
_080CC65C: .4byte gUnknown_3005008
_080CC660: .4byte gUnknown_83F5D58
_080CC664:
	movs r0, 0x4
	strb r0, [r6, 0x1]
_080CC668:
	movs r0, 0x23
	adds r1, r6, 0
_080CC66C:
	bl sub_8113550
	ldr r0, _080CC678 @ =0x00000808
	bl sub_806E6A8
	b _080CC71E
	.align 2, 0
_080CC678: .4byte 0x00000808
_080CC67C:
	ldr r3, [r7]
	movs r2, 0x4
	ldrsb r2, [r3, r2]
	ldr r1, _080CC6D0 @ =gUnknown_83F5D58
	lsls r0, r5, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0x4]
	cmp r2, r0
	bne _080CC71E
	movs r0, 0x5
	ldrsb r0, [r3, r0]
	ldrh r2, [r1, 0x6]
	cmp r0, r2
	bne _080CC71E
	ldrh r0, [r1]
	ldrh r1, [r1, 0x2]
	bl sub_8055238
	ldrb r1, [r0, 0x14]
	add r0, sp, 0x4
	strb r1, [r0]
	strb r5, [r0, 0x1]
	adds r6, r0, 0
	cmp r5, 0x16
	bne _080CC6D4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sub_805C538
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xF
	bne _080CC6F6
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x1A
	beq _080CC6FC
	b _080CC6F6
	.align 2, 0
_080CC6D0: .4byte gUnknown_83F5D58
_080CC6D4:
	cmp r5, 0x2A
	bne _080CC6FC
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sub_805C538
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x43
	bne _080CC6F6
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	beq _080CC6FC
_080CC6F6:
	ldrb r0, [r6, 0x1]
	adds r0, 0x1
	strb r0, [r6, 0x1]
_080CC6FC:
	movs r0, 0x23
	adds r1, r6, 0
	bl sub_8113550
	ldr r4, _080CC728 @ =0x00000808
	adds r0, r4, 0
	bl sub_806E6A8
	cmp r5, 0x23
	bne _080CC71E
	ldr r0, _080CC72C @ =0x0000404d
	movs r1, 0x20
	bl sub_806E584
	adds r0, r4, 0
	bl sub_806E680
_080CC71E:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC728: .4byte 0x00000808
_080CC72C: .4byte 0x0000404d
	thumb_func_end sub_80CC59C

	thumb_func_start sub_80CC730
sub_80CC730: @ 80CC730
	push {lr}
	ldr r0, _080CC744 @ =gUnknown_20370D0
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080CC77C
	lsls r0, 2
	ldr r1, _080CC748 @ =_080CC74C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CC744: .4byte gUnknown_20370D0
_080CC748: .4byte _080CC74C
	.align 2, 0
_080CC74C:
	.4byte _080CC760
	.4byte _080CC764
	.4byte _080CC768
	.4byte _080CC76C
	.4byte _080CC770
_080CC760:
	movs r0, 0x3
	b _080CC772
_080CC764:
	movs r0, 0x4
	b _080CC772
_080CC768:
	movs r0, 0
	b _080CC772
_080CC76C:
	movs r0, 0x1
	b _080CC772
_080CC770:
	movs r0, 0x2
_080CC772:
	bl sub_81445C0
	lsls r0, 16
	lsrs r0, 16
	b _080CC78A
_080CC77C:
	ldr r0, _080CC790 @ =gUnknown_83F5EF0
	ldr r1, _080CC794 @ =0x00000f21
	ldr r2, _080CC798 @ =gUnknown_83F5F24
	movs r3, 0x1
	bl AGBAssert
	movs r0, 0
_080CC78A:
	pop {r1}
	bx r1
	.align 2, 0
_080CC790: .4byte gUnknown_83F5EF0
_080CC794: .4byte 0x00000f21
_080CC798: .4byte gUnknown_83F5F24
	thumb_func_end sub_80CC730

	thumb_func_start sub_80CC79C
sub_80CC79C: @ 80CC79C
	ldr r1, _080CC7A4 @ =gUnknown_2039A1A
	strb r0, [r1]
	bx lr
	.align 2, 0
_080CC7A4: .4byte gUnknown_2039A1A
	thumb_func_end sub_80CC79C

	thumb_func_start sub_80CC7A8
sub_80CC7A8: @ 80CC7A8
	ldr r0, _080CC7B0 @ =gUnknown_2039A1A
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080CC7B0: .4byte gUnknown_2039A1A
	thumb_func_end sub_80CC7A8

	thumb_func_start sub_80CC7B4
sub_80CC7B4: @ 80CC7B4
	push {r4,r5,lr}
	ldr r5, _080CC7E8 @ =0x00000843
	adds r0, r5, 0
	bl sub_806E6D0
	lsls r0, 24
	cmp r0, 0
	bne _080CC7F0
	bl sub_808B9F4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080CC7EC @ =0x00004037
	bl sub_806E568
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _080CC7F0
	adds r0, r5, 0
	bl sub_806E680
	movs r0, 0x1
	b _080CC7F2
	.align 2, 0
_080CC7E8: .4byte 0x00000843
_080CC7EC: .4byte 0x00004037
_080CC7F0:
	movs r0, 0
_080CC7F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC7B4

	thumb_func_start sub_80CC7F8
sub_80CC7F8: @ 80CC7F8
	push {r4-r7,lr}
	ldr r0, _080CC850 @ =0x00004037
	bl sub_806E568
	lsls r0, 24
	lsrs r0, 24
	bl sub_80CC79C
	bl sub_808B9F4
	lsls r0, 24
	lsrs r4, r0, 24
_080CC810:
	movs r5, 0
	lsls r6, r4, 24
	lsls r7, r4, 16
_080CC816:
	lsls r1, r5, 24
	lsrs r1, 24
	lsrs r0, r6, 24
	bl sub_808BD30
	movs r1, 0xB
	movs r2, 0
	bl sub_803FD44
	cmp r0, 0
	bne _080CC858
	bl sub_80CC7A8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	beq _080CC83E
	ldr r0, _080CC854 @ =0x00000843
	bl sub_806E6A8
_080CC83E:
	ldr r0, _080CC850 @ =0x00004037
	lsrs r1, r7, 16
	bl sub_806E584
	bl sub_80CC7B4
	lsls r0, 24
	lsrs r0, 24
	b _080CC874
	.align 2, 0
_080CC850: .4byte 0x00004037
_080CC854: .4byte 0x00000843
_080CC858:
	adds r5, 0x1
	cmp r5, 0x1D
	ble _080CC816
	adds r4, 0x1
	cmp r4, 0xE
	bne _080CC866
	movs r4, 0
_080CC866:
	bl sub_808B9F4
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080CC810
	movs r0, 0
_080CC874:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC7F8

	thumb_func_start sub_80CC87C
sub_80CC87C: @ 80CC87C
	push {r4,lr}
	ldr r0, _080CC8AC @ =gUnknown_2031DB4
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x1]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, _080CC8B0 @ =gUnknown_83F5F26
	ldrh r0, [r2]
	ldr r1, _080CC8B4 @ =0x0000ffff
	cmp r0, r1
	beq _080CC8C2
	adds r4, r1, 0
	adds r1, r2, 0
_080CC8A0:
	ldrh r0, [r2]
	cmp r0, r3
	bne _080CC8B8
	movs r0, 0x1
	b _080CC8C4
	.align 2, 0
_080CC8AC: .4byte gUnknown_2031DB4
_080CC8B0: .4byte gUnknown_83F5F26
_080CC8B4: .4byte 0x0000ffff
_080CC8B8:
	adds r1, 0x2
	adds r2, 0x2
	ldrh r0, [r1]
	cmp r0, r4
	bne _080CC8A0
_080CC8C2:
	movs r0, 0
_080CC8C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CC87C

	thumb_func_start sub_80CC8CC
sub_80CC8CC: @ 80CC8CC
	push {r4,lr}
	ldr r1, _080CC8E4 @ =gUnknown_20370C0
	ldr r2, _080CC8E8 @ =0xfffffedf
	adds r0, r2, 0
	ldrh r2, [r1]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x39
	bls _080CC8EC
	movs r0, 0
	b _080CC908
	.align 2, 0
_080CC8E4: .4byte gUnknown_20370C0
_080CC8E8: .4byte 0xfffffedf
_080CC8EC:
	ldr r4, _080CC910 @ =gUnknown_2021CD0
	ldrh r0, [r1]
	bl sub_8125A78
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _080CC914 @ =gUnknown_8247094
	adds r1, r0
	adds r0, r4, 0
	bl sub_8008D84
	movs r0, 0x1
_080CC908:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CC910: .4byte gUnknown_2021CD0
_080CC914: .4byte gUnknown_8247094
	thumb_func_end sub_80CC8CC

	thumb_func_start sub_80CC918
sub_80CC918: @ 80CC918
	push {r4,lr}
	ldr r4, _080CC940 @ =0x00004025
	adds r0, r4, 0
	bl sub_806E568
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080CC944 @ =0x000001f3
	cmp r1, r0
	bhi _080CC938
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_806E584
_080CC938:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC940: .4byte 0x00004025
_080CC944: .4byte 0x000001f3
	thumb_func_end sub_80CC918

	thumb_func_start sub_80CC948
sub_80CC948: @ 80CC948
	push {lr}
	ldr r0, _080CC968 @ =gUnknown_20370C0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080CC96C @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x6
	bl sub_80436F8
	ldr r0, _080CC970 @ =0x00004025
	movs r1, 0
	bl sub_806E584
	pop {r0}
	bx r0
	.align 2, 0
_080CC968: .4byte gUnknown_20370C0
_080CC96C: .4byte gUnknown_2024284
_080CC970: .4byte 0x00004025
	thumb_func_end sub_80CC948

	thumb_func_start sub_80CC974
sub_80CC974: @ 80CC974
	push {r4-r6,lr}
	ldr r0, _080CC9A8 @ =sub_80CCA18
	movs r1, 0x8
	bl sub_807741C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r5, r1, 3
	ldr r6, _080CC9AC @ =gUnknown_3005098
	adds r4, r5, r6
	movs r0, 0x3
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CC9B4
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _080CC9B0 @ =sub_80CCAF4
	str r1, [r0]
	b _080CCA08
	.align 2, 0
_080CC9A8: .4byte sub_80CCA18
_080CC9AC: .4byte gUnknown_3005098
_080CC9B0: .4byte sub_80CCAF4
_080CC9B4:
	ldr r0, _080CC9D8 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CC9DC @ =0x00004f01
	cmp r1, r0
	bne _080CC9E8
	ldr r0, _080CC9E0 @ =gUnknown_83F61FB
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, 0x8
	strh r0, [r4, 0x4]
	ldr r0, _080CC9E4 @ =gUnknown_83F60D0
	movs r1, 0x70
	movs r2, 0x20
	bl sub_80703EC
	b _080CC9FC
	.align 2, 0
_080CC9D8: .4byte gUnknown_3005008
_080CC9DC: .4byte 0x00004f01
_080CC9E0: .4byte gUnknown_83F61FB
_080CC9E4: .4byte gUnknown_83F60D0
_080CC9E8:
	ldr r0, _080CCA10 @ =gUnknown_83F61F0
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, 0xB
	strh r0, [r4, 0x4]
	ldr r0, _080CCA14 @ =gUnknown_83F5F50
	movs r1, 0x70
	movs r2, 0x20
	bl sub_80703EC
_080CC9FC:
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x7
	movs r1, 0x1
	bl sub_8059948
_080CCA08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCA10: .4byte gUnknown_83F61F0
_080CCA14: .4byte gUnknown_83F5F50
	thumb_func_end sub_80CC974

	thumb_func_start sub_80CCA18
sub_80CCA18: @ 80CCA18
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080CCAA4 @ =gUnknown_3005098
	adds r4, r1, r0
	ldr r0, _080CCAA8 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CCAE6
	movs r0, 0x2
	bl sub_806E6D0
	lsls r0, 24
	cmp r0, 0
	beq _080CCAE6
	movs r0, 0x5
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CCAE6
	ldr r0, _080CCAAC @ =gUnknown_2036E28
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _080CCAE6
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _080CCAE6
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x4
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080CCA78
	strh r2, [r4, 0x2]
_080CCA78:
	ldr r0, _080CCAB0 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CCAB4 @ =0x00004f01
	cmp r1, r0
	bne _080CCAC0
	ldr r1, _080CCAB8 @ =gUnknown_83F61FB
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 5
	ldr r1, _080CCABC @ =gUnknown_83F60D0
	adds r0, r1
	movs r1, 0x70
	movs r2, 0x20
	bl sub_80703EC
	b _080CCADE
	.align 2, 0
_080CCAA4: .4byte gUnknown_3005098
_080CCAA8: .4byte gUnknown_2037AB8
_080CCAAC: .4byte gUnknown_2036E28
_080CCAB0: .4byte gUnknown_3005008
_080CCAB4: .4byte 0x00004f01
_080CCAB8: .4byte gUnknown_83F61FB
_080CCABC: .4byte gUnknown_83F60D0
_080CCAC0:
	ldr r1, _080CCAEC @ =gUnknown_83F61F0
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 5
	ldr r1, _080CCAF0 @ =gUnknown_83F5F50
	adds r0, r1
	movs r1, 0x70
	movs r2, 0x20
	bl sub_80703EC
_080CCADE:
	movs r0, 0x7
	movs r1, 0x1
	bl sub_8059948
_080CCAE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCAEC: .4byte gUnknown_83F61F0
_080CCAF0: .4byte gUnknown_83F5F50
	thumb_func_end sub_80CCA18

	thumb_func_start sub_80CCAF4
sub_80CCAF4: @ 80CCAF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x4
	bl sub_806E6D0
	lsls r0, 24
	cmp r0, 0
	beq _080CCB5A
	ldr r0, _080CCB20 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CCB24 @ =0x00004f01
	cmp r1, r0
	bne _080CCB2C
	ldr r0, _080CCB28 @ =gUnknown_83F61D0
	movs r1, 0x70
	movs r2, 0x20
	bl sub_80703EC
	b _080CCB36
	.align 2, 0
_080CCB20: .4byte gUnknown_3005008
_080CCB24: .4byte 0x00004f01
_080CCB28: .4byte gUnknown_83F61D0
_080CCB2C:
	ldr r0, _080CCB60 @ =gUnknown_83F60B0
	movs r1, 0x70
	movs r2, 0x20
	bl sub_80703EC
_080CCB36:
	movs r0, 0x7
	movs r1, 0x1
	bl sub_8059948
	ldr r0, _080CCB64 @ =gUnknown_2037AB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CCB54
	movs r0, 0x80
	movs r1, 0x10
	movs r2, 0
	bl sub_80714D4
_080CCB54:
	adds r0, r4, 0
	bl sub_8077508
_080CCB5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB60: .4byte gUnknown_83F60B0
_080CCB64: .4byte gUnknown_2037AB8
	thumb_func_end sub_80CCAF4

	thumb_func_start sub_80CCB68
sub_80CCB68: @ 80CCB68
	push {r4,lr}
	ldr r4, _080CCB90 @ =sub_80CCA18
	adds r0, r4, 0
	bl sub_8077650
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCB88
	adds r0, r4, 0
	bl sub_8077688
	lsls r0, 24
	lsrs r0, 24
	bl sub_8077508
_080CCB88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB90: .4byte sub_80CCA18
	thumb_func_end sub_80CCB68

	thumb_func_start sub_80CCB94
sub_80CCB94: @ 80CCB94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	movs r6, 0
	bl sub_80CACFC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080CCBC0 @ =gUnknown_20370C6
	mov r1, r8
	strh r1, [r0]
	movs r4, 0
	movs r0, 0x64
	mov r5, r8
	muls r5, r0
	ldr r0, _080CCBC4 @ =gUnknown_2024284
	mov r9, r0
	b _080CCBCE
	.align 2, 0
_080CCBC0: .4byte gUnknown_20370C6
_080CCBC4: .4byte gUnknown_2024284
_080CCBC8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCBCE:
	cmp r4, 0x2
	bhi _080CCBEA
	mov r1, r9
	adds r0, r5, r1
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	ldr r1, _080CCC1C @ =gUnknown_83F6203
	adds r1, r4, r1
	ldrb r1, [r1]
	cmp r0, r1
	bne _080CCBC8
	adds r7, r4, 0
_080CCBEA:
	cmp r4, 0x3
	beq _080CCC7A
	movs r0, 0x64
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _080CCC20 @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x20
	bl sub_803FBE8
	cmp r0, 0xFF
	bne _080CCC7A
	cmp r7, 0
	bne _080CCC34
	ldr r0, _080CCC24 @ =gUnknown_2021CF0
	ldr r1, _080CCC28 @ =gUnknown_82481BE
	bl sub_8008D84
	ldr r1, _080CCC2C @ =gUnknown_20370C2
	movs r0, 0xF
	strh r0, [r1]
	ldr r0, _080CCC30 @ =0x000002de
	b _080CCC6E
	.align 2, 0
_080CCC1C: .4byte gUnknown_83F6203
_080CCC20: .4byte gUnknown_2024284
_080CCC24: .4byte gUnknown_2021CF0
_080CCC28: .4byte gUnknown_82481BE
_080CCC2C: .4byte gUnknown_20370C2
_080CCC30: .4byte 0x000002de
_080CCC34:
	cmp r7, 0x1
	bne _080CCC5C
	ldr r0, _080CCC4C @ =gUnknown_2021CF0
	ldr r1, _080CCC50 @ =gUnknown_824802B
	bl sub_8008D84
	ldr r1, _080CCC54 @ =gUnknown_20370C2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, _080CCC58 @ =0x000002df
	b _080CCC6E
	.align 2, 0
_080CCC4C: .4byte gUnknown_2021CF0
_080CCC50: .4byte gUnknown_824802B
_080CCC54: .4byte gUnknown_20370C2
_080CCC58: .4byte 0x000002df
_080CCC5C:
	ldr r0, _080CCC80 @ =gUnknown_2021CF0
	ldr r1, _080CCC84 @ =gUnknown_8248038
	bl sub_8008D84
	ldr r1, _080CCC88 @ =gUnknown_20370C2
	movs r0, 0x11
	strh r0, [r1]
	movs r0, 0xB8
	lsls r0, 2
_080CCC6E:
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCC8C
_080CCC7A:
	movs r0, 0
	b _080CCCE4
	.align 2, 0
_080CCC80: .4byte gUnknown_2021CF0
_080CCC84: .4byte gUnknown_8248038
_080CCC88: .4byte gUnknown_20370C2
_080CCC8C:
	movs r0, 0x64
	mov r1, r8
	muls r1, r0
	ldr r0, _080CCCF0 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xD
	bl sub_803FBE8
	cmp r0, 0
	beq _080CCCA8
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCA8:
	adds r0, r4, 0
	movs r1, 0xE
	bl sub_803FBE8
	cmp r0, 0
	beq _080CCCBA
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCBA:
	adds r0, r4, 0
	movs r1, 0xF
	bl sub_803FBE8
	cmp r0, 0
	beq _080CCCCC
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCCC:
	adds r0, r4, 0
	movs r1, 0x10
	bl sub_803FBE8
	cmp r0, 0
	beq _080CCCDE
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080CCCDE:
	ldr r0, _080CCCF4 @ =gUnknown_20370C4
	strh r6, [r0]
	movs r0, 0x1
_080CCCE4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CCCF0: .4byte gUnknown_2024284
_080CCCF4: .4byte gUnknown_20370C4
	thumb_func_end sub_80CCB94

	thumb_func_start sub_80CCCF8
sub_80CCCF8: @ 80CCCF8
	push {r4,lr}
	movs r4, 0
	ldr r0, _080CCD0C @ =gUnknown_20370C2
	ldrh r0, [r0]
	cmp r0, 0xF
	bne _080CCD14
	ldr r0, _080CCD10 @ =0x000002de
	bl sub_806E680
	b _080CCD2C
	.align 2, 0
_080CCD0C: .4byte gUnknown_20370C2
_080CCD10: .4byte 0x000002de
_080CCD14:
	cmp r0, 0x10
	bne _080CCD24
	ldr r0, _080CCD20 @ =0x000002df
	bl sub_806E680
	b _080CCD2C
	.align 2, 0
_080CCD20: .4byte 0x000002df
_080CCD24:
	movs r0, 0xB8
	lsls r0, 2
	bl sub_806E680
_080CCD2C:
	ldr r0, _080CCD74 @ =0x000002de
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCD40
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCD40:
	ldr r0, _080CCD78 @ =0x000002df
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCD54
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCD54:
	movs r0, 0xB8
	lsls r0, 2
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCD6A
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CCD6A:
	cmp r4, 0x3
	beq _080CCD7C
	movs r0, 0
	b _080CCD7E
	.align 2, 0
_080CCD74: .4byte 0x000002de
_080CCD78: .4byte 0x000002df
_080CCD7C:
	movs r0, 0x1
_080CCD7E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80CCCF8

	thumb_func_start sub_80CCD84
sub_80CCD84: @ 80CCD84
	push {lr}
	ldr r0, _080CCDB8 @ =0x000002e3
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080CCDC8
	ldr r0, _080CCDBC @ =gUnknown_3005008
	ldr r2, [r0]
	ldrh r1, [r2, 0x4]
	ldr r0, _080CCDC0 @ =0x00003d03
	cmp r1, r0
	bne _080CCDC8
	ldr r1, [r2]
	ldr r0, _080CCDC4 @ =0x00190018
	cmp r1, r0
	bne _080CCDC8
	bl sub_805C6C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080CCDC8
	movs r0, 0x1
	b _080CCDCA
	.align 2, 0
_080CCDB8: .4byte 0x000002e3
_080CCDBC: .4byte gUnknown_3005008
_080CCDC0: .4byte 0x00003d03
_080CCDC4: .4byte 0x00190018
_080CCDC8:
	movs r0, 0
_080CCDCA:
	pop {r1}
	bx r1
	thumb_func_end sub_80CCD84

	thumb_func_start sub_80CCDD0
sub_80CCDD0: @ 80CCDD0
	push {lr}
	movs r2, 0xD6
	lsls r2, 2
	movs r0, 0x1F
	movs r1, 0x1F
	bl sub_8058FA4
	bl sub_805A684
	movs r0, 0x14
	bl sub_80722CC
	ldr r0, _080CCDF8 @ =0x000002e3
	bl sub_806E680
	bl sub_806994C
	pop {r0}
	bx r0
	.align 2, 0
_080CCDF8: .4byte 0x000002e3
	thumb_func_end sub_80CCDD0

	thumb_func_start sub_80CCDFC
sub_80CCDFC: @ 80CCDFC
	push {lr}
	ldr r0, _080CCE0C @ =sub_80CCE10
	movs r1, 0x8
	bl sub_807741C
	pop {r0}
	bx r0
	.align 2, 0
_080CCE0C: .4byte sub_80CCE10
	thumb_func_end sub_80CCDFC

	thumb_func_start sub_80CCE10
sub_80CCE10: @ 80CCE10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080CCE30 @ =0x00000848
	bl sub_806E6D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CCE38
	ldr r1, _080CCE34 @ =gUnknown_20370D0
	movs r0, 0x3
	b _080CCE9E
	.align 2, 0
_080CCE30: .4byte 0x00000848
_080CCE34: .4byte gUnknown_20370D0
_080CCE38:
	ldr r0, _080CCE80 @ =0x0000403e
	mov r8, r0
	bl sub_806E568
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _080CCE84 @ =0x00004026
	adds r0, r4, 0
	bl sub_806E568
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E584
	cmp r5, 0
	beq _080CCE90
	ldr r0, _080CCE88 @ =gUnknown_83F637C
	subs r1, r5, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, r6
	bcs _080CCE90
	movs r0, 0
	bl sub_80CCEE8
	mov r0, r8
	movs r1, 0
	bl sub_806E584
	ldr r1, _080CCE8C @ =gUnknown_20370D0
	movs r0, 0
	strh r0, [r1]
	b _080CCEA4
	.align 2, 0
_080CCE80: .4byte 0x0000403e
_080CCE84: .4byte 0x00004026
_080CCE88: .4byte gUnknown_83F637C
_080CCE8C: .4byte gUnknown_20370D0
_080CCE90:
	cmp r5, 0xA
	bne _080CCEB4
	ldr r0, _080CCEAC @ =0x00000848
	bl sub_806E680
	ldr r1, _080CCEB0 @ =gUnknown_20370D0
	movs r0, 0x2
_080CCE9E:
	strh r0, [r1]
	bl sub_8069B34
_080CCEA4:
	adds r0, r7, 0
	bl sub_8077508
	b _080CCED6
	.align 2, 0
_080CCEAC: .4byte 0x00000848
_080CCEB0: .4byte gUnknown_20370D0
_080CCEB4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80CCEE8
	ldr r0, _080CCEE0 @ =0x0000403e
	adds r1, r5, 0
	bl sub_806E584
	ldr r1, _080CCEE4 @ =gUnknown_20370D0
	movs r0, 0x1
	strh r0, [r1]
	adds r0, r7, 0
	bl sub_8077508
_080CCED6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCEE0: .4byte 0x0000403e
_080CCEE4: .4byte gUnknown_20370D0
	thumb_func_end sub_80CCE10

	thumb_func_start sub_80CCEE8
sub_80CCEE8: @ 80CCEE8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 5
	ldr r1, _080CCF24 @ =gUnknown_83F6206
	adds r0, r1
	movs r1, 0xD0
	lsls r1, 1
	movs r2, 0x8
	bl sub_80703EC
	movs r0, 0xA
	bl sub_8083598
	ldr r0, _080CCF28 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x1
	mov r3, sp
	bl sub_805DF84
	cmp r4, 0
	bne _080CCF2C
	movs r0, 0xBD
	bl sub_80722CC
	b _080CCF32
	.align 2, 0
_080CCF24: .4byte gUnknown_83F6206
_080CCF28: .4byte gUnknown_3005008
_080CCF2C:
	movs r0, 0xFD
	bl sub_80722CC
_080CCF32:
	ldr r0, _080CCF64 @ =sub_80CCF98
	movs r1, 0x8
	bl sub_807741C
	ldr r3, _080CCF68 @ =gUnknown_20386E0
	movs r0, 0x1
	str r0, [r3]
	movs r0, 0x38
	str r0, [r3, 0x4]
	movs r0, 0x2
	str r0, [r3, 0x8]
	ldr r0, _080CCF6C @ =gUnknown_83F6366
	lsls r2, r4, 1
	adds r1, r2, r0
	ldrb r1, [r1]
	str r1, [r3, 0xC]
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	str r0, [r3, 0x10]
	adds r5, r2, 0
	cmp r4, 0
	bne _080CCF70
	movs r0, 0x3C
	b _080CCF72
	.align 2, 0
_080CCF64: .4byte sub_80CCF98
_080CCF68: .4byte gUnknown_20386E0
_080CCF6C: .4byte gUnknown_83F6366
_080CCF70:
	movs r0, 0x5
_080CCF72:
	str r0, [r3, 0x14]
	movs r0, 0x43
	bl sub_8083444
	ldr r0, _080CCF94 @ =gUnknown_83F6366
	adds r1, r5, r0
	ldrb r1, [r1]
	adds r0, 0x1
	adds r0, r5, r0
	ldrb r2, [r0]
	movs r0, 0x1
	bl sub_80550D8
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCF94: .4byte gUnknown_83F6366
	thumb_func_end sub_80CCEE8

	thumb_func_start sub_80CCF98
sub_80CCF98: @ 80CCF98
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x43
	bl sub_808382C
	lsls r0, 24
	cmp r0, 0
	bne _080CCFB4
	bl sub_8069B34
	adds r0, r4, 0
	bl sub_8077508
_080CCFB4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CCF98

	thumb_func_start sub_80CCFBC
sub_80CCFBC: @ 80CCFBC
	push {r4,lr}
	ldr r4, _080CCFEC @ =0x00004026
	adds r0, r4, 0
	bl sub_806E568
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080CCFF0 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CCFF4 @ =0x00003802
	cmp r1, r0
	bne _080CD000
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x63
	bls _080CCFF8
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E584
	b _080CD000
	.align 2, 0
_080CCFEC: .4byte 0x00004026
_080CCFF0: .4byte gUnknown_3005008
_080CCFF4: .4byte 0x00003802
_080CCFF8:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_806E584
_080CD000:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CCFBC

	thumb_func_start sub_80CD008
sub_80CD008: @ 80CD008
	push {lr}
	ldr r0, _080CD02C @ =0x0000403e
	bl sub_806E568
	lsls r0, 24
	lsrs r0, 19
	ldr r1, _080CD030 @ =gUnknown_83F6206
	adds r0, r1
	movs r1, 0xD0
	lsls r1, 1
	movs r2, 0x8
	bl sub_80703EC
	movs r0, 0xA
	bl sub_8083598
	pop {r0}
	bx r0
	.align 2, 0
_080CD02C: .4byte 0x0000403e
_080CD030: .4byte gUnknown_83F6206
	thumb_func_end sub_80CD008

	thumb_func_start sub_80CD034
sub_80CD034: @ 80CD034
	push {r4,r5,lr}
	bl sub_8040C3C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _080CD06A
_080CD044:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080CD05C @ =gUnknown_2024284
	adds r0, r1
	movs r1, 0x4
	bl sub_803FBE8
	cmp r0, 0x1
	bne _080CD060
	movs r0, 0x1
	b _080CD06C
	.align 2, 0
_080CD05C: .4byte gUnknown_2024284
_080CD060:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080CD044
_080CD06A:
	movs r0, 0
_080CD06C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80CD034

	thumb_func_start sub_80CD074
sub_80CD074: @ 80CD074
	push {lr}
	ldr r0, _080CD088 @ =gUnknown_3005008
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldr r0, _080CD08C @ =0x00000a02
	cmp r1, r0
	beq _080CD090
	movs r0, 0x1
	b _080CD092
	.align 2, 0
_080CD088: .4byte gUnknown_3005008
_080CD08C: .4byte 0x00000a02
_080CD090:
	movs r0, 0
_080CD092:
	pop {r1}
	bx r1
	thumb_func_end sub_80CD074

	thumb_func_start sub_80CD098
sub_80CD098: @ 80CD098
	push {lr}
	sub sp, 0x4
	ldr r0, _080CD0CC @ =gUnknown_203ADFA
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080CD0E8
	ldr r0, _080CD0D0 @ =gUnknown_20370C0
	ldrh r0, [r0]
	adds r0, 0x1B
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080CD0D4 @ =gUnknown_20370C4
	ldrh r3, [r0]
	cmp r3, 0
	bne _080CD0E0
	ldr r0, _080CD0D8 @ =gUnknown_20370C2
	ldrh r2, [r0]
	str r3, [sp]
	movs r0, 0
	movs r3, 0
	bl sub_8006300
	ldr r1, _080CD0DC @ =gUnknown_2039A1B
	strb r0, [r1]
	b _080CD0E8
	.align 2, 0
_080CD0CC: .4byte gUnknown_203ADFA
_080CD0D0: .4byte gUnknown_20370C0
_080CD0D4: .4byte gUnknown_20370C4
_080CD0D8: .4byte gUnknown_20370C2
_080CD0DC: .4byte gUnknown_2039A1B
_080CD0E0:
	ldr r0, _080CD0F0 @ =gUnknown_2039A1B
	ldrb r0, [r0]
	bl sub_8006398
_080CD0E8:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080CD0F0: .4byte gUnknown_2039A1B
	thumb_func_end sub_80CD098

	thumb_func_start sub_80CD0F4
sub_80CD0F4: @ 80CD0F4
	push {r4-r7,lr}
	bl sub_8040C3C
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	cmp r6, r7
	bcs _080CD14A
_080CD104:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _080CD138 @ =gUnknown_2024284
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x41
	movs r2, 0
	bl sub_803FBE8
	ldr r1, _080CD13C @ =gUnknown_20370C0
	ldrh r1, [r1]
	cmp r0, r1
	bne _080CD140
	bl sub_80CC1E4
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_803FBE8
	cmp r4, r0
	bne _080CD140
	movs r0, 0x1
	b _080CD14C
	.align 2, 0
_080CD138: .4byte gUnknown_2024284
_080CD13C: .4byte gUnknown_20370C0
_080CD140:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _080CD104
_080CD14A:
	movs r0, 0
_080CD14C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CD0F4

	thumb_func_start sub_80CD154
sub_80CD154: @ 80CD154
	push {r4,lr}
	movs r0, 0xA
	bl sub_8054EC4
	adds r4, r0, 0
	cmp r4, 0x18
	bls _080CD1AE
	movs r0, 0xA5
	bl sub_806E6A8
	cmp r4, 0x31
	bls _080CD172
	movs r0, 0xA6
	bl sub_806E6A8
_080CD172:
	cmp r4, 0x4A
	bls _080CD17C
	movs r0, 0xA7
	bl sub_806E6A8
_080CD17C:
	cmp r4, 0x63
	bls _080CD186
	movs r0, 0xA8
	bl sub_806E6A8
_080CD186:
	cmp r4, 0x7C
	bls _080CD190
	movs r0, 0xA9
	bl sub_806E6A8
_080CD190:
	cmp r4, 0x95
	bls _080CD19A
	movs r0, 0xAA
	bl sub_806E6A8
_080CD19A:
	cmp r4, 0xAE
	bls _080CD1A4
	movs r0, 0xAB
	bl sub_806E6A8
_080CD1A4:
	cmp r4, 0xC7
	bls _080CD1AE
	movs r0, 0xAC
	bl sub_806E6A8
_080CD1AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD154

	thumb_func_start sub_80CD1B4
sub_80CD1B4: @ 80CD1B4
	push {lr}
	ldr r0, _080CD1C8 @ =sub_80CD1CC
	movs r1, 0x8
	bl sub_807741C
	movs r0, 0x96
	bl sub_80722CC
	pop {r0}
	bx r0
	.align 2, 0
_080CD1C8: .4byte sub_80CD1CC
	thumb_func_end sub_80CD1B4

	thumb_func_start sub_80CD1CC
sub_80CD1CC: @ 80CD1CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CD21C @ =gUnknown_3005098
	adds r4, r0, r1
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	ldr r0, _080CD220 @ =gUnknown_20370C2
	ldrh r0, [r0]
	cmp r1, r0
	bne _080CD200
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x96
	bl sub_80722CC
_080CD200:
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _080CD224 @ =gUnknown_20370C0
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _080CD214
	adds r0, r5, 0
	bl sub_8077508
_080CD214:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD21C: .4byte gUnknown_3005098
_080CD220: .4byte gUnknown_20370C2
_080CD224: .4byte gUnknown_20370C0
	thumb_func_end sub_80CD1CC

	.align 2, 0 @ Don't pad with nop.
