	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_810CCA0
sub_810CCA0: @ 810CCA0
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0810CD0A
	lsls r0, 2
	ldr r1, _0810CCB8 @ =_0810CCBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810CCB8: .4byte _0810CCBC
	.align 2, 0
_0810CCBC:
	.4byte _0810CD0A
	.4byte _0810CCD4
	.4byte _0810CCDC
	.4byte _0810CCE4
	.4byte _0810CCEC
	.4byte _0810CCF4
_0810CCD4:
	ldr r0, _0810CCD8 @ =0x00000292
	b _0810CCF6
	.align 2, 0
_0810CCD8: .4byte 0x00000292
_0810CCDC:
	ldr r0, _0810CCE0 @ =0x00000896
	b _0810CCF6
	.align 2, 0
_0810CCE0: .4byte 0x00000896
_0810CCE4:
	ldr r0, _0810CCE8 @ =0x00000897
	b _0810CCF6
	.align 2, 0
_0810CCE8: .4byte 0x00000897
_0810CCEC:
	ldr r0, _0810CCF0 @ =0x0000082c
	b _0810CCF6
	.align 2, 0
_0810CCF0: .4byte 0x0000082c
_0810CCF4:
	ldr r0, _0810CD10 @ =0x00000844
_0810CCF6:
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810CD0A
	ldrb r1, [r4]
	adds r0, r5, 0
	bl sub_810CD14
	strb r0, [r4]
_0810CD0A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CD10: .4byte 0x00000844
	thumb_func_end sub_810CCA0

	thumb_func_start sub_810CD14
sub_810CD14: @ 810CD14
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	movs r0, 0xFF
	lsls r0, 24
	adds r1, r0
	lsrs r1, 24
	cmp r1, 0
	beq _0810CD46
	ldr r3, _0810CD38 @ =0x0000ffff
_0810CD28:
	lsls r0, r1, 1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, r3
	beq _0810CD3C
	adds r0, r1, 0
	b _0810CD48
	.align 2, 0
_0810CD38: .4byte 0x0000ffff
_0810CD3C:
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0810CD28
_0810CD46:
	movs r0, 0
_0810CD48:
	pop {r1}
	bx r1
	thumb_func_end sub_810CD14

	thumb_func_start sub_810CD4C
sub_810CD4C: @ 810CD4C
	push {r4,r5,lr}
	ldr r5, _0810CD70 @ =gUnknown_845318C
	ldr r4, _0810CD74 @ =gTrainerBattleOpponent_A
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_810CD80
	lsls r0, 24
	cmp r0, 0
	bne _0810CD78
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_810CDB4
	lsls r0, 24
	lsrs r0, 24
	b _0810CD7A
	.align 2, 0
_0810CD70: .4byte gUnknown_845318C
_0810CD74: .4byte gTrainerBattleOpponent_A
_0810CD78:
	movs r0, 0x1
_0810CD7A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810CD4C

	thumb_func_start sub_810CD80
sub_810CD80: @ 810CD80
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_810D084
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0810CDAC
	cmp r1, 0xDC
	bhi _0810CDAC
	ldr r0, _0810CDA8 @ =gUnknown_20370D2
	ldrh r0, [r0]
	bl sub_810D0A8
	cmp r0, 0
	beq _0810CDAC
	movs r0, 0x1
	b _0810CDAE
	.align 2, 0
_0810CDA8: .4byte gUnknown_20370D2
_0810CDAC:
	movs r0, 0
_0810CDAE:
	pop {r1}
	bx r1
	thumb_func_end sub_810CD80

	thumb_func_start sub_810CDB4
sub_810CDB4: @ 810CDB4
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_810D084
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0810CDDE
	lsls r0, r1, 4
	adds r0, r4
	ldrh r0, [r0]
	bl HasTrainerAlreadyBeenFought
	lsls r0, 24
	cmp r0, 0
	beq _0810CDDE
	movs r0, 0x1
	b _0810CDE0
_0810CDDE:
	movs r0, 0
_0810CDE0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810CDB4

	thumb_func_start sub_810CDE8
sub_810CDE8: @ 810CDE8
	push {lr}
	ldr r0, _0810CE04 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	ldr r1, _0810CE08 @ =gUnknown_20370D2
	ldr r2, _0810CE0C @ =0x0000063a
	adds r0, r2
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	bl sub_80803FC
	pop {r0}
	bx r0
	.align 2, 0
_0810CE04: .4byte gSaveBlock1Ptr
_0810CE08: .4byte gUnknown_20370D2
_0810CE0C: .4byte 0x0000063a
	thumb_func_end sub_810CDE8

	thumb_func_start sub_810CE10
sub_810CE10: @ 810CE10
	push {r4-r7,lr}
	mov r12, r0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r1, 0
	mov r4, r12
	movs r7, 0
_0810CE1E:
	movs r3, 0
	ldrh r0, [r4]
	cmp r0, 0
	beq _0810CE4E
	ldr r5, _0810CE3C @ =0x0000ffff
	mov r0, r12
	adds r2, r7, r0
_0810CE2C:
	ldrh r0, [r2]
	cmp r0, r5
	beq _0810CE40
	cmp r0, r6
	bne _0810CE40
	adds r0, r1, 0
	b _0810CE5C
	.align 2, 0
_0810CE3C: .4byte 0x0000ffff
_0810CE40:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x5
	bgt _0810CE4E
	ldrh r0, [r2]
	cmp r0, 0
	bne _0810CE2C
_0810CE4E:
	adds r4, 0x10
	adds r7, 0x10
	adds r1, 0x1
	cmp r1, 0xDC
	bls _0810CE1E
	movs r0, 0x1
	negs r0, r0
_0810CE5C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CE10

	thumb_func_start sub_810CE64
sub_810CE64: @ 810CE64
	push {r4,r5,lr}
	sub sp, 0x4
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _0810CEA4 @ =gUnknown_845318C
	adds r0, r5, 0
	mov r2, sp
	bl sub_810D164
	mov r4, sp
	adds r4, 0x1
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810CEA8
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r5
	adds r1, r4, 0
	bl sub_810CCA0
	ldrb r1, [r4]
	lsls r1, 1
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 4
	adds r1, r0
	adds r1, r5
	ldrh r0, [r1]
	b _0810CEAA
	.align 2, 0
_0810CEA4: .4byte gUnknown_845318C
_0810CEA8:
	movs r0, 0
_0810CEAA:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810CE64

	thumb_func_start sub_810CEB4
sub_810CEB4: @ 810CEB4
	push {lr}
	ldr r0, _0810CEC8 @ =gUnknown_845318C
	ldr r1, _0810CECC @ =gTrainerBattleOpponent_A
	ldrh r1, [r1]
	bl sub_810CED0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810CEC8: .4byte gUnknown_845318C
_0810CECC: .4byte gTrainerBattleOpponent_A
	thumb_func_end sub_810CEB4

	thumb_func_start sub_810CED0
sub_810CED0: @ 810CED0
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_810CE10
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0810CEFC
	cmp r1, 0xDC
	bhi _0810CEFC
	ldr r0, _0810CEF8 @ =gUnknown_20370D2
	ldrh r0, [r0]
	bl sub_810D0A8
	cmp r0, 0
	beq _0810CEFC
	movs r0, 0x1
	b _0810CEFE
	.align 2, 0
_0810CEF8: .4byte gUnknown_20370D2
_0810CEFC:
	movs r0, 0
_0810CEFE:
	pop {r1}
	bx r1
	thumb_func_end sub_810CED0

	thumb_func_start sub_810CF04
sub_810CF04: @ 810CF04
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r1, _0810CF40 @ =gUnknown_2036E38
	adds r1, r0, r1
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0810CF4C
	ldr r0, _0810CF44 @ =gMapHeader
	ldr r0, [r0, 0x4]
	ldrb r0, [r0]
	ldrb r2, [r1, 0x8]
	cmp r0, r2
	bcc _0810CF4C
	ldr r2, _0810CF48 @ =gSprites
	ldrb r1, [r1, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, r3
	bne _0810CF4C
	movs r0, 0x1
	b _0810CF4E
	.align 2, 0
_0810CF40: .4byte gUnknown_2036E38
_0810CF44: .4byte gMapHeader
_0810CF48: .4byte gSprites
_0810CF4C:
	movs r0, 0
_0810CF4E:
	pop {r1}
	bx r1
	thumb_func_end sub_810CF04

	thumb_func_start sub_810CF54
sub_810CF54: @ 810CF54
	push {lr}
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	adds r0, r1, 0
	cmp r1, 0x1
	beq _0810CF8A
	cmp r1, 0x1
	bgt _0810CF74
	cmp r1, 0
	beq _0810CF7E
	b _0810CF8A
_0810CF74:
	cmp r0, 0x2
	beq _0810CF82
	cmp r0, 0x3
	beq _0810CF86
	b _0810CF8A
_0810CF7E:
	movs r0, 0x7
	b _0810CF8C
_0810CF82:
	movs r0, 0x9
	b _0810CF8C
_0810CF86:
	movs r0, 0xA
	b _0810CF8C
_0810CF8A:
	movs r0, 0x8
_0810CF8C:
	pop {r1}
	bx r1
	thumb_func_end sub_810CF54

	thumb_func_start sub_810CF90
sub_810CF90: @ 810CF90
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x11
	cmp r0, 0x2D
	bhi _0810D06C
	lsls r0, 2
	ldr r1, _0810CFA8 @ =_0810CFAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810CFA8: .4byte _0810CFAC
	.align 2, 0
_0810CFAC:
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D068
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D068
	.4byte _0810D068
	.4byte _0810D064
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D064
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D06C
	.4byte _0810D064
_0810D064:
	movs r0, 0x4E
	b _0810D06E
_0810D068:
	movs r0, 0x4F
	b _0810D06E
_0810D06C:
	movs r0, 0x4D
_0810D06E:
	pop {r1}
	bx r1
	thumb_func_end sub_810CF90

	thumb_func_start sub_810D074
sub_810D074: @ 810D074
	adds r0, 0x2
	ldrb r1, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 8
	orrs r1, r0
	adds r0, r1, 0
	bx lr
	thumb_func_end sub_810D074

	thumb_func_start sub_810D084
sub_810D084: @ 810D084
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	adds r2, r0, 0
_0810D08E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _0810D098
	adds r0, r3, 0
	b _0810D0A4
_0810D098:
	adds r2, 0x10
	adds r3, 0x1
	cmp r3, 0xDC
	bls _0810D08E
	movs r0, 0x1
	negs r0, r0
_0810D0A4:
	pop {r1}
	bx r1
	thumb_func_end sub_810D084

	thumb_func_start sub_810D0A8
sub_810D0A8: @ 810D0A8
	push {lr}
	ldr r1, _0810D0C0 @ =gSaveBlock1Ptr
	ldr r1, [r1]
	ldr r2, _0810D0C4 @ =0x0000063a
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810D0C8
	movs r0, 0x1
	b _0810D0CA
	.align 2, 0
_0810D0C0: .4byte gSaveBlock1Ptr
_0810D0C4: .4byte 0x0000063a
_0810D0C8:
	movs r0, 0
_0810D0CA:
	pop {r1}
	bx r1
	thumb_func_end sub_810D0A8

	thumb_func_start sub_810D0D0
sub_810D0D0: @ 810D0D0
	push {r4,lr}
	movs r1, 0
	ldr r4, _0810D0F4 @ =gSaveBlock1Ptr
	ldr r3, _0810D0F8 @ =0x0000063a
	movs r2, 0
_0810D0DA:
	ldr r0, [r4]
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x63
	bls _0810D0DA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D0F4: .4byte gSaveBlock1Ptr
_0810D0F8: .4byte 0x0000063a
	thumb_func_end sub_810D0D0

	thumb_func_start sub_810D0FC
sub_810D0FC: @ 810D0FC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	strh r0, [r1]
	ldrh r0, [r4]
	subs r0, 0x7
	strh r0, [r4]
	mov r0, sp
	movs r1, 0
	ldrsh r2, [r0, r1]
	subs r0, r2, 0x7
	movs r3, 0x8
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bgt _0810D15A
	adds r0, r2, 0x7
	cmp r0, r1
	blt _0810D15A
	movs r0, 0
	ldrsh r1, [r4, r0]
	subs r0, r1, 0x5
	movs r3, 0xA
	ldrsh r2, [r5, r3]
	cmp r0, r2
	bgt _0810D15A
	adds r0, r1, 0x5
	cmp r0, r2
	blt _0810D15A
	ldrb r0, [r5, 0x7]
	bl sub_810CF04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D15A
	movs r0, 0x1
	b _0810D15C
_0810D15A:
	movs r0, 0
_0810D15C:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810D0FC

	thumb_func_start sub_810D164
sub_810D164: @ 810D164
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r1, 16
	movs r4, 0
	adds r3, r0, 0
_0810D16E:
	ldrh r0, [r3]
	cmp r0, r1
	bne _0810D1B8
	strb r4, [r2]
	movs r5, 0x1
	ldr r7, _0810D188 @ =0x0000ffff
	adds r4, r3, 0x2
	movs r6, 0
_0810D17E:
	ldrh r0, [r4]
	cmp r0, 0
	bne _0810D18C
	lsrs r0, r6, 24
	b _0810D1C6
	.align 2, 0
_0810D188: .4byte 0x0000ffff
_0810D18C:
	cmp r0, r7
	beq _0810D1A2
	ldrh r0, [r4]
	bl HasTrainerAlreadyBeenFought
	lsls r0, 24
	cmp r0, 0
	bne _0810D1A2
	lsls r0, r5, 24
	lsrs r0, 24
	b _0810D1C6
_0810D1A2:
	adds r4, 0x2
	movs r0, 0x80
	lsls r0, 17
	adds r6, r0
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D17E
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _0810D1C6
_0810D1B8:
	adds r3, 0x10
	adds r4, 0x1
	cmp r4, 0xDC
	bls _0810D16E
	movs r0, 0
	strb r0, [r2]
	movs r0, 0
_0810D1C6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810D164

	thumb_func_start sub_810D1CC
sub_810D1CC: @ 810D1CC
	push {r4-r7,lr}
	sub sp, 0x4
	movs r5, 0
	ldr r6, _0810D220 @ =gUnknown_203ADB8
	ldr r0, [r6]
	ldrb r0, [r0, 0x6]
	cmp r0, 0xFF
	beq _0810D23C
	adds r7, r6, 0
_0810D1DE:
	lsls r4, r5, 4
	ldr r0, [r7]
	adds r0, r4
	bl sub_810D0FC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D228
	ldr r0, [r6]
	adds r0, r4
	ldrh r0, [r0, 0x4]
	bl HasTrainerAlreadyBeenFought
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D216
	ldr r0, [r7]
	adds r0, r4
	ldrh r1, [r0, 0x4]
	ldr r0, _0810D224 @ =gUnknown_845318C
	mov r2, sp
	bl sub_810D164
	lsls r0, 24
	cmp r0, 0
	beq _0810D228
_0810D216:
	ldr r0, [r7]
	adds r0, r4
	ldrb r0, [r0, 0x6]
	b _0810D23E
	.align 2, 0
_0810D220: .4byte gUnknown_203ADB8
_0810D224: .4byte gUnknown_845318C
_0810D228:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0810D248 @ =gUnknown_203ADB8
	ldr r0, [r6]
	lsls r1, r5, 4
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0xFF
	bne _0810D1DE
_0810D23C:
	movs r0, 0xFF
_0810D23E:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810D248: .4byte gUnknown_203ADB8
	thumb_func_end sub_810D1CC

	thumb_func_start sub_810D24C
sub_810D24C: @ 810D24C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r1, [r4, 0x7]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810D278 @ =gUnknown_2036E38
	adds r0, r1
	bl npc_sync_anim_pause_bits
	ldrb r0, [r4, 0x6]
	ldr r1, _0810D27C @ =gSaveBlock1Ptr
	ldr r2, [r1]
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	adds r3, r5, 0
	bl ScriptMovement_StartObjectMovementScript
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D278: .4byte gUnknown_2036E38
_0810D27C: .4byte gSaveBlock1Ptr
	thumb_func_end sub_810D24C

	thumb_func_start sub_810D280
sub_810D280: @ 810D280
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r5, 0
	cmp r5, r6
	bge _0810D2F8
	ldr r7, _0810D2E0 @ =gUnknown_203ADB8
	movs r4, 0
_0810D298:
	ldr r0, [r7]
	adds r0, r4
	bl sub_810D0FC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D2F0
	ldr r1, [r7]
	adds r0, r1, r4
	ldrh r0, [r0, 0x4]
	cmp r0, r8
	bne _0810D2F0
	movs r3, 0
	movs r2, 0x86
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r3, r0
	bge _0810D2EC
	ldr r0, _0810D2E0 @ =gUnknown_203ADB8
	ldr r1, [r0]
	adds r0, r1, r4
	ldrh r4, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 3
	adds r2, r1, r0
	adds r0, 0x30
	adds r1, r0
	ldrb r1, [r1]
_0810D2D4:
	ldrh r0, [r2]
	cmp r0, r4
	bne _0810D2E4
	movs r0, 0x2
	b _0810D2FA
	.align 2, 0
_0810D2E0: .4byte gUnknown_203ADB8
_0810D2E4:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, r1
	blt _0810D2D4
_0810D2EC:
	movs r0, 0x1
	b _0810D2FA
_0810D2F0:
	adds r4, 0x10
	adds r5, 0x1
	cmp r5, r6
	blt _0810D298
_0810D2F8:
	movs r0, 0
_0810D2FA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810D280

	thumb_func_start sub_810D304
sub_810D304: @ 810D304
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r1, 0
	mov r0, sp
	strb r1, [r0]
	movs r7, 0
	ldr r2, _0810D328 @ =gUnknown_203ADB8
	ldr r0, [r2]
	movs r1, 0x86
	lsls r1, 3
	adds r0, r1
	mov r10, r2
	b _0810D3CC
	.align 2, 0
_0810D328: .4byte gUnknown_203ADB8
_0810D32C:
	ldr r0, [r2]
	ldrb r0, [r0, 0x6]
	adds r3, r7, 0x1
	mov r8, r3
	cmp r0, 0xFF
	beq _0810D3C0
	adds r5, r2, 0
	mov r10, r5
	movs r6, 0
	mov r9, r5
_0810D340:
	ldr r0, [r5]
	adds r2, r0, r6
	lsls r1, r7, 1
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3
	adds r0, r1
	ldrh r1, [r2, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0810D3B2
	ldrb r0, [r2, 0x7]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r2, _0810D3E4 @ =gUnknown_2036E38
	adds r4, r1, r2
	bl sub_810CF04
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810D380
	ldr r0, [r5]
	movs r1, 0x84
	lsls r1, 3
	adds r0, r1
	adds r0, r7
	ldrb r1, [r0]
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
_0810D380:
	ldr r0, [r5]
	movs r3, 0x84
	lsls r3, 3
	adds r0, r3
	adds r0, r7
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_805FE7C
	ldr r0, [r5]
	adds r0, r6
	ldrh r1, [r0, 0x4]
	ldr r0, _0810D3E8 @ =gUnknown_845318C
	mov r2, sp
	bl sub_810D164
	ldr r1, _0810D3EC @ =gSaveBlock1Ptr
	ldr r1, [r1]
	ldr r2, [r5]
	adds r2, r6
	ldr r3, _0810D3F0 @ =0x0000063a
	adds r1, r3
	ldrb r2, [r2, 0x6]
	adds r1, r2
	strb r0, [r1]
_0810D3B2:
	adds r6, 0x10
	mov r1, r9
	ldr r0, [r1]
	adds r0, r6
	ldrb r0, [r0, 0x6]
	cmp r0, 0xFF
	bne _0810D340
_0810D3C0:
	mov r7, r8
	mov r2, r10
	ldr r0, [r2]
	movs r3, 0x86
	lsls r3, 3
	adds r0, r3
_0810D3CC:
	ldrb r0, [r0]
	cmp r7, r0
	blt _0810D32C
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810D3E4: .4byte gUnknown_2036E38
_0810D3E8: .4byte gUnknown_845318C
_0810D3EC: .4byte gSaveBlock1Ptr
_0810D3F0: .4byte 0x0000063a
	thumb_func_end sub_810D304

	.align 2, 0 @ Don't pad with nop.
