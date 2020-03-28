	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start CB1_UpdateLinkState
CB1_UpdateLinkState: @ 8057884
	push {r4,lr}
	ldr r0, _080578C8 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805789E
	bl IsRfuRecvQueueEmpty
	cmp r0, 0
	beq _0805789E
	bl IsSendingKeysToLink
	cmp r0, 0
	bne _080578C0
_0805789E:
	ldr r0, _080578CC @ =gLocalLinkPlayerId
	ldrb r4, [r0]
	ldr r0, _080578D0 @ =gLinkPartnersHeldKeys
	adds r1, r4, 0
	bl sub_8057BE4
	ldr r0, _080578D4 @ =gUnknown_3000E84
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 16
	lsrs r0, 16
	bl sub_8057C4C
	bl ClearAllPlayerKeys
_080578C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080578C8: .4byte gWirelessCommType
_080578CC: .4byte gLocalLinkPlayerId
_080578D0: .4byte gLinkPartnersHeldKeys
_080578D4: .4byte gUnknown_3000E84
	thumb_func_end CB1_UpdateLinkState

	thumb_func_start ResetAllMultiplayerState
ResetAllMultiplayerState: @ 80578D8
	push {lr}
	bl sub_805793C
	ldr r0, _080578E8 @ =sub_8057D5C
	bl c1_link_related_func_set
	pop {r0}
	bx r0
	.align 2, 0
_080578E8: .4byte sub_8057D5C
	thumb_func_end ResetAllMultiplayerState

	thumb_func_start ClearAllPlayerKeys
ClearAllPlayerKeys: @ 80578EC
	push {lr}
	ldr r0, _080578F8 @ =gLinkPartnersHeldKeys
	bl sub_8057D48
	pop {r0}
	bx r0
	.align 2, 0
_080578F8: .4byte gLinkPartnersHeldKeys
	thumb_func_end ClearAllPlayerKeys

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
	bl LinkRfu_FatalError
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
	ldr r0, _08057974 @ =gFieldLinkPlayerCount
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
_08057974: .4byte gFieldLinkPlayerCount
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
	ldr r0, _080579AC @ =gFieldLinkPlayerCount
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
_080579AC: .4byte gFieldLinkPlayerCount
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
	ldr r0, _08057C68 @ =gHeldKeyCodeToSend
	strh r4, [r0]
	b _08057C72
	.align 2, 0
_08057C64: .4byte 0xffef0000
_08057C68: .4byte gHeldKeyCodeToSend
_08057C6C:
	ldr r1, _08057CB0 @ =gHeldKeyCodeToSend
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
	bl IsUpdateLinkStateCBActive
	cmp r0, 0x1
	bne _08057CA8
	bl IsSendingKeysToLink
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
	ldr r1, _08057CB0 @ =gHeldKeyCodeToSend
	movs r0, 0
	strh r0, [r1]
_08057CA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057CB0: .4byte gHeldKeyCodeToSend
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
	bl GetLinkRecvQueueLength
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
	bl GetLinkRecvQueueLength
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
	ldr r0, _08057EA0 @ =CableClub_EventScript_DoLinkRoomExit
	bl ScriptContext1_SetupScript
	ldr r0, _08057EA4 @ =sub_8057E6C
	bl c1_link_related_func_set
_08057E96:
	movs r0, 0x11
	pop {r1}
	bx r1
	.align 2, 0
_08057E9C: .4byte gUnknown_3000E80
_08057EA0: .4byte CableClub_EventScript_DoLinkRoomExit
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
	ldr r0, _08057F0C @ =gLocalLinkPlayerId
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
	ldr r0, _08057F0C @ =gLocalLinkPlayerId
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
_08057F0C: .4byte gLocalLinkPlayerId
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
	ldr r1, _08057FE8 @ =gLinkPlayerObjectEvents
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
_08057FE8: .4byte gLinkPlayerObjectEvents
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
	bl GetCoordEventScriptAtMapPosition
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
	ldr r0, _080580F8 @ =CableClub_EventScript_TooBusyToNotice
	b _08058122
	.align 2, 0
_080580E4: .4byte gDirectionToVectors
_080580E8: .4byte 0xffff0000
_080580EC: .4byte 0x0000ffff
_080580F0: .4byte 0xffffff00
_080580F4: .4byte gUnknown_3000E80
_080580F8: .4byte CableClub_EventScript_TooBusyToNotice
_080580FC:
	adds r0, r2, 0
	bl GetSeeingLinkPlayerCardMsg
	cmp r0, 0
	bne _08058110
	ldr r0, _0805810C @ =CableClub_EventScript_ReadTrainerCard
	b _08058122
	.align 2, 0
_0805810C: .4byte CableClub_EventScript_ReadTrainerCard
_08058110:
	ldr r0, _08058114 @ =CableClub_EventScript_ReadTrainerCardColored
	b _08058122
	.align 2, 0
_08058114: .4byte CableClub_EventScript_ReadTrainerCardColored
_08058118:
	ldrb r1, [r4, 0xC]
	ldrb r2, [r4, 0x3]
	mov r0, sp
	bl GetInteractedLinkPlayerScript
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
	ldr r0, _08058178 @ =BattleColosseum_4P_EventScript_PlayerSpot0
	cmp r1, r0
	beq _08058172
	ldr r0, _0805817C @ =BattleColosseum_4P_EventScript_PlayerSpot1
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058180 @ =BattleColosseum_4P_EventScript_PlayerSpot2
	cmp r1, r0
	beq _08058172
	ldr r0, _08058184 @ =BattleColosseum_4P_EventScript_PlayerSpot3
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058188 @ =RecordCenter_EventScript_Spot
	cmp r1, r0
	beq _08058172
	ldr r0, _0805818C @ =RecordCenter_EventScript_Spot
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058190 @ =RecordCenter_EventScript_Spot
	cmp r1, r0
	beq _08058172
	ldr r0, _08058194 @ =RecordCenter_EventScript_Spot
	cmp r1, r0
	beq _080581B4
	ldr r0, _08058198 @ =BattleColosseum_2P_EventScript_PlayerSpot0
	cmp r1, r0
	beq _08058172
	ldr r0, _0805819C @ =BattleColosseum_2P_EventScript_PlayerSpot1
	cmp r1, r0
	beq _080581B4
	ldr r0, _080581A0 @ =TradeCenter_EventScript_Chair0
	cmp r1, r0
	bne _080581A4
_08058172:
	movs r0, 0xA
	b _080581B6
	.align 2, 0
_08058178: .4byte BattleColosseum_4P_EventScript_PlayerSpot0
_0805817C: .4byte BattleColosseum_4P_EventScript_PlayerSpot1
_08058180: .4byte BattleColosseum_4P_EventScript_PlayerSpot2
_08058184: .4byte BattleColosseum_4P_EventScript_PlayerSpot3
_08058188: .4byte RecordCenter_EventScript_Spot
_0805818C: .4byte RecordCenter_EventScript_Spot
_08058190: .4byte RecordCenter_EventScript_Spot
_08058194: .4byte RecordCenter_EventScript_Spot
_08058198: .4byte BattleColosseum_2P_EventScript_PlayerSpot0
_0805819C: .4byte BattleColosseum_2P_EventScript_PlayerSpot1
_080581A0: .4byte TradeCenter_EventScript_Chair0
_080581A4:
	ldr r0, _080581B0 @ =TradeCenter_EventScript_Chair1
	cmp r1, r0
	beq _080581B4
	movs r0, 0
	b _080581B6
	.align 2, 0
_080581B0: .4byte TradeCenter_EventScript_Chair1
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
	ldr r0, _08058210 @ =TradeCenter_ConfirmLeaveRoom
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08058210: .4byte TradeCenter_ConfirmLeaveRoom
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
	ldr r0, _08058240 @ =TradeCenter_TerminateLink
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08058240: .4byte TradeCenter_TerminateLink
	thumb_func_end sub_8058230

	thumb_func_start sub_8058244
sub_8058244: @ 8058244
	push {lr}
	bl IsUpdateLinkStateCBActive
	cmp r0, 0
	bne _08058252
	movs r0, 0
	b _0805826C
_08058252:
	bl GetLinkRecvQueueLength
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
	bl GetLinkRecvQueueLength
	cmp r0, 0x1
	bls _080582D8
	bl IsUpdateLinkStateCBActive
	cmp r0, 0x1
	bne _080582D8
	bl IsSendingKeysToLink
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
	bl IsUpdateLinkStateCBActive
	cmp r0, 0x1
	bne _08058304
	bl IsSendingKeysToLink
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
	bl IsSendingKeysToLink
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
	ldr r0, _08058354 @ =gLink
	ldr r1, _08058358 @ =0x00000339
	adds r0, r1
	ldrb r0, [r0]
	b _08058364
	.align 2, 0
_08058350: .4byte gWirelessCommType
_08058354: .4byte gLink
_08058358: .4byte 0x00000339
_0805835C:
	ldr r0, _08058368 @ =Rfu
	ldr r1, _0805836C @ =0x000008d2
	adds r0, r1
	ldrb r0, [r0]
_08058364:
	pop {r1}
	bx r1
	.align 2, 0
_08058368: .4byte Rfu
_0805836C: .4byte 0x000008d2
	thumb_func_end sub_805833C

	thumb_func_start ZeroLinkPlayerObjectEvent
ZeroLinkPlayerObjectEvent: @ 8058370
	movs r1, 0
	str r1, [r0]
	bx lr
	thumb_func_end ZeroLinkPlayerObjectEvent

	thumb_func_start ClearLinkPlayerObjectEvents
ClearLinkPlayerObjectEvents: @ 8058378
	push {lr}
	ldr r0, _08058388 @ =gLinkPlayerObjectEvents
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08058388: .4byte gLinkPlayerObjectEvents
	thumb_func_end ClearLinkPlayerObjectEvents

	thumb_func_start ZeroObjectEvent
ZeroObjectEvent: @ 805838C
	push {lr}
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	thumb_func_end ZeroObjectEvent

	thumb_func_start SpawnLinkPlayerObjectEvent
SpawnLinkPlayerObjectEvent: @ 805839C
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
	bl GetFirstInactiveObjectEventId
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, r7, 2
	ldr r0, _08058440 @ =gLinkPlayerObjectEvents
	adds r4, r0
	lsls r5, r6, 3
	adds r5, r6
	lsls r5, 2
	ldr r0, _08058444 @ =gObjectEvents
	adds r5, r0
	adds r0, r4, 0
	bl ZeroLinkPlayerObjectEvent
	adds r0, r5, 0
	bl ZeroObjectEvent
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
	bl InitLinkPlayerObjectEventPos
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058440: .4byte gLinkPlayerObjectEvents
_08058444: .4byte gObjectEvents
	thumb_func_end SpawnLinkPlayerObjectEvent

	thumb_func_start InitLinkPlayerObjectEventPos
InitLinkPlayerObjectEventPos: @ 8058448
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
	bl SetSpritePosToMapCoords
	ldrh r0, [r4, 0xC]
	adds r0, 0x8
	strh r0, [r4, 0xC]
	adds r0, r4, 0
	bl ObjectEventUpdateZCoord
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end InitLinkPlayerObjectEventPos

	thumb_func_start sub_8058488
sub_8058488: @ 8058488
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _080584B0 @ =gLinkPlayerObjectEvents
	lsrs r0, 22
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _080584AA
	ldrb r0, [r1, 0x2]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080584B4 @ =gObjectEvents
	adds r1, r0
	strb r2, [r1, 0x19]
_080584AA:
	pop {r0}
	bx r0
	.align 2, 0
_080584B0: .4byte gLinkPlayerObjectEvents
_080584B4: .4byte gObjectEvents
	thumb_func_end sub_8058488

	thumb_func_start sub_80584B8
sub_80584B8: @ 80584B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _080584F8 @ =gLinkPlayerObjectEvents
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080584FC @ =gObjectEvents
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
_080584F8: .4byte gLinkPlayerObjectEvents
_080584FC: .4byte gObjectEvents
_08058500: .4byte gSprites
	thumb_func_end sub_80584B8

	thumb_func_start GetSpriteForLinkedPlayer
GetSpriteForLinkedPlayer: @ 8058504
	lsls r0, 24
	ldr r1, _0805851C @ =gLinkPlayerObjectEvents
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058520 @ =gObjectEvents
	adds r0, r1
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_0805851C: .4byte gLinkPlayerObjectEvents
_08058520: .4byte gObjectEvents
	thumb_func_end GetSpriteForLinkedPlayer

	thumb_func_start sub_8058524
sub_8058524: @ 8058524
	lsls r0, 24
	ldr r3, _08058544 @ =gLinkPlayerObjectEvents
	lsrs r0, 22
	adds r0, r3
	ldrb r3, [r0, 0x2]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _08058548 @ =gObjectEvents
	adds r0, r3
	ldrh r3, [r0, 0x10]
	strh r3, [r1]
	ldrh r0, [r0, 0x12]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08058544: .4byte gLinkPlayerObjectEvents
_08058548: .4byte gObjectEvents
	thumb_func_end sub_8058524

	thumb_func_start sub_805854C
sub_805854C: @ 805854C
	lsls r0, 24
	ldr r1, _08058564 @ =gLinkPlayerObjectEvents
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058568 @ =gObjectEvents
	adds r0, r1
	ldrb r0, [r0, 0x19]
	bx lr
	.align 2, 0
_08058564: .4byte gLinkPlayerObjectEvents
_08058568: .4byte gObjectEvents
	thumb_func_end sub_805854C

	thumb_func_start sub_805856C
sub_805856C: @ 805856C
	lsls r0, 24
	ldr r1, _08058588 @ =gLinkPlayerObjectEvents
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805858C @ =gObjectEvents
	adds r0, r1
	ldrb r0, [r0, 0xB]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08058588: .4byte gLinkPlayerObjectEvents
_0805858C: .4byte gObjectEvents
	thumb_func_end sub_805856C

	thumb_func_start sub_8058590
sub_8058590: @ 8058590
	lsls r0, 24
	ldr r1, _080585B0 @ =gLinkPlayerObjectEvents
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080585B4 @ =gObjectEvents
	adds r0, r1
	adds r0, 0x21
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x10
	subs r0, r1
	bx lr
	.align 2, 0
_080585B0: .4byte gLinkPlayerObjectEvents
_080585B4: .4byte gObjectEvents
	thumb_func_end sub_8058590

	thumb_func_start GetLinkPlayerIdAt
GetLinkPlayerIdAt: @ 80585B8
	push {r4-r6,lr}
	movs r2, 0
	ldr r5, _080585FC @ =gLinkPlayerObjectEvents
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
	ldr r1, _08058600 @ =gObjectEvents
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
_080585FC: .4byte gLinkPlayerObjectEvents
_08058600: .4byte gObjectEvents
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
	ldr r1, _08058648 @ =gLinkPlayerObjectEvents
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805864C @ =gObjectEvents
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
_08058648: .4byte gLinkPlayerObjectEvents
_0805864C: .4byte gObjectEvents
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
	bl ObjectEventMoveDestCoords
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
	bl ShiftObjectEventCoords
	adds r0, r5, 0
	bl ObjectEventUpdateZCoord
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
	bl ShiftStillObjectEventCoords
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
	ldr r0, _08058850 @ =gObjectEvents
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
_08058850: .4byte gObjectEvents
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

	thumb_func_start CreateLinkPlayerSprite
CreateLinkPlayerSprite: @ 8058878
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, r5, 2
	ldr r0, _080588B4 @ =gLinkPlayerObjectEvents
	adds r2, r0
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080588B8 @ =gObjectEvents
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
	bl GetRivalAvatarGraphicsIdByStateIdAndGender
	b _080588C6
	.align 2, 0
_080588B4: .4byte gLinkPlayerObjectEvents
_080588B8: .4byte gObjectEvents
_080588BC:
	ldrb r0, [r4]
	lsls r0, 30
	lsrs r0, 31
	bl GetHoennLinkPartnerGraphicsIdByGender
_080588C6:
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08058904 @ =SpriteCB_LinkPlayer
	movs r2, 0
	str r2, [sp]
	movs r3, 0
	bl AddPseudoObjectEvent
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
	thumb_func_end CreateLinkPlayerSprite

	thumb_func_start SpriteCB_LinkPlayer
SpriteCB_LinkPlayer: @ 805890C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 2
	ldr r0, _08058970 @ =gLinkPlayerObjectEvents
	adds r4, r0
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058974 @ =gObjectEvents
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
	bl GetFaceDirectionAnimNum
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	b _0805898A
	.align 2, 0
_08058970: .4byte gLinkPlayerObjectEvents
_08058974: .4byte gObjectEvents
_08058978:
	ldrb r0, [r6, 0x19]
	bl GetMoveDirectionAnimNum
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
_0805898A:
	adds r0, r5, 0
	movs r1, 0
	bl UpdateObjectEventSpriteVisibility
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
