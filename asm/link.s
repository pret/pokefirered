	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8009FE8
sub_8009FE8: @ 8009FE8
	push {lr}
	ldr r0, _0800A000 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08009FF6
	bl sub_80F9828
_08009FF6:
	ldr r1, _0800A004 @ =gLinkCallback
	ldr r0, _0800A008 @ =sub_800A040
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800A000: .4byte gWirelessCommType
_0800A004: .4byte gLinkCallback
_0800A008: .4byte sub_800A040
	thumb_func_end sub_8009FE8

	thumb_func_start sub_800A00C
sub_800A00C: @ 800A00C
	push {lr}
	ldr r0, _0800A01C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800A020
	bl sub_80F9808
	b _0800A03A
	.align 2, 0
_0800A01C: .4byte gWirelessCommType
_0800A020:
	ldr r0, _0800A030 @ =gLinkCallback
	ldr r1, [r0]
	ldr r0, _0800A034 @ =sub_800A040
	cmp r1, r0
	beq _0800A038
	movs r0, 0
	b _0800A03A
	.align 2, 0
_0800A030: .4byte gLinkCallback
_0800A034: .4byte sub_800A040
_0800A038:
	movs r0, 0x1
_0800A03A:
	pop {r1}
	bx r1
	thumb_func_end sub_800A00C

	thumb_func_start sub_800A040
sub_800A040: @ 800A040
	push {lr}
	ldr r0, _0800A054 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A050
	ldr r0, _0800A058 @ =0x0000cafe
	bl BuildSendCmd
_0800A050:
	pop {r0}
	bx r0
	.align 2, 0
_0800A054: .4byte gReceivedRemoteLinkPlayers
_0800A058: .4byte 0x0000cafe
	thumb_func_end sub_800A040

	thumb_func_start sub_800A05C
sub_800A05C: @ 800A05C
	ldr r1, _0800A064 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0800A064: .4byte gLinkCallback
	thumb_func_end sub_800A05C

	thumb_func_start sub_800A068
sub_800A068: @ 800A068
	push {lr}
	ldr r0, _0800A078 @ =gWirelessCommType
	ldrb r1, [r0]
	cmp r1, 0
	beq _0800A07C
	bl sub_80F985C
	b _0800A080
	.align 2, 0
_0800A078: .4byte gWirelessCommType
_0800A07C:
	ldr r0, _0800A084 @ =gLinkCallback
	str r1, [r0]
_0800A080:
	pop {r0}
	bx r0
	.align 2, 0
_0800A084: .4byte gLinkCallback
	thumb_func_end sub_800A068

	thumb_func_start GetLinkPlayerCount
GetLinkPlayerCount: @ 800A088
	push {lr}
	ldr r0, _0800A0A0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800A0A8
	ldr r0, _0800A0A4 @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	b _0800A0B0
	.align 2, 0
_0800A0A0: .4byte gWirelessCommType
_0800A0A4: .4byte gLinkStatus
_0800A0A8:
	bl sub_80FA4EC
	lsls r0, 24
	lsrs r0, 24
_0800A0B0:
	pop {r1}
	bx r1
	thumb_func_end GetLinkPlayerCount

	thumb_func_start sub_800A0B4
sub_800A0B4: @ 800A0B4
	push {lr}
	ldr r0, _0800A0C8 @ =sPlayerDataExchangeStatus
	movs r1, 0
	str r1, [r0]
	ldr r0, _0800A0CC @ =gLinkTimeOutCounter
	strh r1, [r0]
	bl OpenLink
	pop {r0}
	bx r0
	.align 2, 0
_0800A0C8: .4byte sPlayerDataExchangeStatus
_0800A0CC: .4byte gLinkTimeOutCounter
	thumb_func_end sub_800A0B4

	thumb_func_start sub_800A0D0
sub_800A0D0: @ 800A0D0
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	movs r7, 0
	ldr r0, _0800A0F8 @ =gReceivedRemoteLinkPlayers
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _0800A1C8
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bgt _0800A0F0
	cmp r0, r6
	ble _0800A100
_0800A0F0:
	ldr r1, _0800A0FC @ =sPlayerDataExchangeStatus
	movs r0, 0x6
	str r0, [r1]
	b _0800A1E2
	.align 2, 0
_0800A0F8: .4byte gReceivedRemoteLinkPlayers
_0800A0FC: .4byte sPlayerDataExchangeStatus
_0800A100:
	bl GetLinkPlayerCount
	lsls r0, 24
	cmp r0, 0
	bne _0800A112
	ldr r0, _0800A11C @ =gLinkErrorOccurred
	strb r4, [r0]
	bl CloseLink
_0800A112:
	movs r6, 0
	ldr r4, _0800A120 @ =gLinkPlayers
	movs r5, 0
	b _0800A138
	.align 2, 0
_0800A11C: .4byte gLinkErrorOccurred
_0800A120: .4byte gLinkPlayers
_0800A124:
	adds r0, r4, 0
	adds r0, 0x14
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	bne _0800A134
	adds r7, 0x1
_0800A134:
	adds r5, 0x1C
	adds r6, 0x1
_0800A138:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	blt _0800A124
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r7, r0
	bne _0800A1B8
	ldr r0, _0800A170 @ =gLinkPlayers
	ldr r1, [r0, 0x14]
	ldr r0, _0800A174 @ =0x00001133
	cmp r1, r0
	bne _0800A1AC
	bl sub_804FB34
	cmp r0, 0x1
	beq _0800A194
	cmp r0, 0x1
	bgt _0800A17C
	cmp r0, 0
	beq _0800A188
	ldr r2, _0800A178 @ =sPlayerDataExchangeStatus
	b _0800A1E0
	.align 2, 0
_0800A170: .4byte gLinkPlayers
_0800A174: .4byte 0x00001133
_0800A178: .4byte sPlayerDataExchangeStatus
_0800A17C:
	cmp r0, 0x2
	beq _0800A1A0
	ldr r2, _0800A184 @ =sPlayerDataExchangeStatus
	b _0800A1E0
	.align 2, 0
_0800A184: .4byte sPlayerDataExchangeStatus
_0800A188:
	ldr r1, _0800A190 @ =sPlayerDataExchangeStatus
	movs r0, 0x1
	b _0800A1BC
	.align 2, 0
_0800A190: .4byte sPlayerDataExchangeStatus
_0800A194:
	ldr r1, _0800A19C @ =sPlayerDataExchangeStatus
	movs r0, 0x4
	b _0800A1BC
	.align 2, 0
_0800A19C: .4byte sPlayerDataExchangeStatus
_0800A1A0:
	ldr r1, _0800A1A8 @ =sPlayerDataExchangeStatus
	movs r0, 0x5
	b _0800A1BC
	.align 2, 0
_0800A1A8: .4byte sPlayerDataExchangeStatus
_0800A1AC:
	ldr r1, _0800A1B4 @ =sPlayerDataExchangeStatus
	movs r0, 0x1
	b _0800A1BC
	.align 2, 0
_0800A1B4: .4byte sPlayerDataExchangeStatus
_0800A1B8:
	ldr r1, _0800A1C4 @ =sPlayerDataExchangeStatus
	movs r0, 0x3
_0800A1BC:
	str r0, [r1]
	adds r2, r1, 0
	b _0800A1E0
	.align 2, 0
_0800A1C4: .4byte sPlayerDataExchangeStatus
_0800A1C8:
	ldr r0, _0800A1E8 @ =gLinkTimeOutCounter
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 18
	ldr r2, _0800A1EC @ =sPlayerDataExchangeStatus
	cmp r1, r0
	bls _0800A1E0
	movs r0, 0x2
	str r0, [r2]
_0800A1E0:
	ldrb r0, [r2]
_0800A1E2:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A1E8: .4byte gLinkTimeOutCounter
_0800A1EC: .4byte sPlayerDataExchangeStatus
	thumb_func_end sub_800A0D0

	thumb_func_start IsLinkPlayerDataExchangeComplete
IsLinkPlayerDataExchangeComplete: @ 800A1F0
	push {r4-r6,lr}
	movs r6, 0
	movs r4, 0
	ldr r5, _0800A1FC @ =gLinkPlayers
	b _0800A220
	.align 2, 0
_0800A1FC: .4byte gLinkPlayers
_0800A200:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x14
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r5, 0x14]
	cmp r1, r0
	bne _0800A21A
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0800A21A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0800A220:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0800A200
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0800A244
	movs r2, 0x1
	ldr r0, _0800A240 @ =sPlayerDataExchangeStatus
	str r2, [r0]
	b _0800A24C
	.align 2, 0
_0800A240: .4byte sPlayerDataExchangeStatus
_0800A244:
	movs r2, 0
	ldr r1, _0800A254 @ =sPlayerDataExchangeStatus
	movs r0, 0x3
	str r0, [r1]
_0800A24C:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800A254: .4byte sPlayerDataExchangeStatus
	thumb_func_end IsLinkPlayerDataExchangeComplete

	thumb_func_start GetLinkPlayerTrainerId
GetLinkPlayerTrainerId: @ 800A258
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800A26C @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, 0x4
	adds r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_0800A26C: .4byte gLinkPlayers
	thumb_func_end GetLinkPlayerTrainerId

	thumb_func_start sub_800A270
sub_800A270: @ 800A270
	push {r4,r5,lr}
	ldr r5, _0800A290 @ =gLinkPlayers
	movs r4, 0x4
_0800A276:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1C
	bl memset
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _0800A276
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A290: .4byte gLinkPlayers
	thumb_func_end sub_800A270

	thumb_func_start ResetBlockSend
ResetBlockSend: @ 800A294
	ldr r1, _0800A2A4 @ =sBlockSend
	movs r0, 0
	strb r0, [r1, 0x8]
	strh r0, [r1]
	strh r0, [r1, 0x2]
	str r0, [r1, 0x4]
	bx lr
	.align 2, 0
_0800A2A4: .4byte sBlockSend
	thumb_func_end ResetBlockSend

	thumb_func_start InitBlockSend
InitBlockSend: @ 800A2A8
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r4, _0800A2BC @ =sBlockSend
	ldrb r5, [r4, 0x8]
	cmp r5, 0
	beq _0800A2C0
	movs r0, 0
	b _0800A2FE
	.align 2, 0
_0800A2BC: .4byte sBlockSend
_0800A2C0:
	bl GetMultiplayerId
	strb r0, [r4, 0x9]
	movs r0, 0x1
	strb r0, [r4, 0x8]
	strh r6, [r4, 0x2]
	strh r5, [r4]
	adds r0, 0xFF
	cmp r6, r0
	bls _0800A2D8
	str r7, [r4, 0x4]
	b _0800A2EA
_0800A2D8:
	ldr r5, _0800A304 @ =gBlockSendBuffer
	cmp r7, r5
	beq _0800A2E8
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
_0800A2E8:
	str r5, [r4, 0x4]
_0800A2EA:
	ldr r0, _0800A308 @ =0x0000bbbb
	bl BuildSendCmd
	ldr r1, _0800A30C @ =gLinkCallback
	ldr r0, _0800A310 @ =LinkCB_BlockSendBegin
	str r0, [r1]
	ldr r1, _0800A314 @ =sBlockSendDelayCounter
	movs r0, 0
	str r0, [r1]
	movs r0, 0x1
_0800A2FE:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A304: .4byte gBlockSendBuffer
_0800A308: .4byte 0x0000bbbb
_0800A30C: .4byte gLinkCallback
_0800A310: .4byte LinkCB_BlockSendBegin
_0800A314: .4byte sBlockSendDelayCounter
	thumb_func_end InitBlockSend

	thumb_func_start LinkCB_BlockSendBegin
LinkCB_BlockSendBegin: @ 800A318
	push {lr}
	ldr r1, _0800A330 @ =sBlockSendDelayCounter
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x2
	bls _0800A32C
	ldr r1, _0800A334 @ =gLinkCallback
	ldr r0, _0800A338 @ =LinkCB_BlockSend
	str r0, [r1]
_0800A32C:
	pop {r0}
	bx r0
	.align 2, 0
_0800A330: .4byte sBlockSendDelayCounter
_0800A334: .4byte gLinkCallback
_0800A338: .4byte LinkCB_BlockSend
	thumb_func_end LinkCB_BlockSendBegin

	thumb_func_start LinkCB_BlockSend
LinkCB_BlockSend: @ 800A33C
	push {r4-r6,lr}
	ldr r0, _0800A38C @ =sBlockSend
	ldr r5, [r0, 0x4]
	ldr r2, _0800A390 @ =gSendCmd
	ldr r1, _0800A394 @ =0x00008888
	strh r1, [r2]
	movs r3, 0
	adds r4, r0, 0
	adds r6, r4, 0
	adds r2, 0x2
_0800A350:
	lsls r0, r3, 1
	ldrh r1, [r6]
	adds r0, r1
	adds r0, r5
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x6
	ble _0800A350
	ldrh r0, [r4]
	adds r0, 0xE
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0800A384
	movs r0, 0
	strb r0, [r4, 0x8]
	ldr r1, _0800A398 @ =gLinkCallback
	ldr r0, _0800A39C @ =sub_800A3A0
	str r0, [r1]
_0800A384:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A38C: .4byte sBlockSend
_0800A390: .4byte gSendCmd
_0800A394: .4byte 0x00008888
_0800A398: .4byte gLinkCallback
_0800A39C: .4byte sub_800A3A0
	thumb_func_end LinkCB_BlockSend

	thumb_func_start sub_800A3A0
sub_800A3A0: @ 800A3A0
	ldr r1, _0800A3A8 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0800A3A8: .4byte gLinkCallback
	thumb_func_end sub_800A3A0

	thumb_func_start sub_800A3AC
sub_800A3AC: @ 800A3AC
	push {lr}
	bl GetMultiplayerId
	ldr r0, _0800A3C4 @ =0x00004444
	bl BuildSendCmd
	ldr r1, _0800A3C8 @ =gUnknown_2022114
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800A3C4: .4byte 0x00004444
_0800A3C8: .4byte gUnknown_2022114
	thumb_func_end sub_800A3AC

	thumb_func_start sub_800A3CC
sub_800A3CC: @ 800A3CC
	ldr r1, _0800A3DC @ =gUnknown_2022114
	movs r0, 0
	str r0, [r1]
	ldr r1, _0800A3E0 @ =gLinkCallback
	ldr r0, _0800A3E4 @ =sub_800A3AC
	str r0, [r1]
	bx lr
	.align 2, 0
_0800A3DC: .4byte gUnknown_2022114
_0800A3E0: .4byte gLinkCallback
_0800A3E4: .4byte sub_800A3AC
	thumb_func_end sub_800A3CC

	thumb_func_start sub_800A3E8
sub_800A3E8: @ 800A3E8
	ldr r0, _0800A3F0 @ =gUnknown_2022114
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800A3F0: .4byte gUnknown_2022114
	thumb_func_end sub_800A3E8

	thumb_func_start sub_800A3F4
sub_800A3F4: @ 800A3F4
	push {lr}
	ldr r0, _0800A400 @ =0x0000aaaa
	bl BuildSendCmd
	pop {r0}
	bx r0
	.align 2, 0
_0800A400: .4byte 0x0000aaaa
	thumb_func_end sub_800A3F4

	thumb_func_start GetMultiplayerId
GetMultiplayerId: @ 800A404
	push {lr}
	ldr r0, _0800A418 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800A420
	ldr r0, _0800A41C @ =0x04000128
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	b _0800A428
	.align 2, 0
_0800A418: .4byte gWirelessCommType
_0800A41C: .4byte 0x04000128
_0800A420:
	bl rfu_get_multiplayer_id
	lsls r0, 24
	lsrs r0, 24
_0800A428:
	pop {r1}
	bx r1
	thumb_func_end GetMultiplayerId

	thumb_func_start bitmask_all_link_players_but_self
bitmask_all_link_players_but_self: @ 800A42C
	push {lr}
	bl GetMultiplayerId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0xF
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end bitmask_all_link_players_but_self

	thumb_func_start SendBlock
SendBlock: @ 800A448
	push {lr}
	adds r3, r1, 0
	lsls r2, 16
	lsrs r1, r2, 16
	ldr r0, _0800A460 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800A464
	adds r0, r3, 0
	bl InitBlockSend
	b _0800A46A
	.align 2, 0
_0800A460: .4byte gWirelessCommType
_0800A464:
	adds r0, r3, 0
	bl sub_80F9E60
_0800A46A:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end SendBlock

	thumb_func_start sub_800A474
sub_800A474: @ 800A474
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _0800A490 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A494
	adds r0, r1, 0
	bl sub_80FA0F8
	lsls r0, 24
	lsrs r0, 24
	b _0800A4B0
	.align 2, 0
_0800A490: .4byte gWirelessCommType
_0800A494:
	ldr r0, _0800A4A0 @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	beq _0800A4A4
	movs r0, 0
	b _0800A4B0
	.align 2, 0
_0800A4A0: .4byte gLinkCallback
_0800A4A4:
	ldr r0, _0800A4B4 @ =gBlockRequestType
	strb r2, [r0]
	ldr r0, _0800A4B8 @ =0x0000cccc
	bl BuildSendCmd
	movs r0, 0x1
_0800A4B0:
	pop {r1}
	bx r1
	.align 2, 0
_0800A4B4: .4byte gBlockRequestType
_0800A4B8: .4byte 0x0000cccc
	thumb_func_end sub_800A474

	thumb_func_start IsLinkTaskFinished
IsLinkTaskFinished: @ 800A4BC
	push {lr}
	ldr r0, _0800A4D0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A4D4
	bl IsNoOneConnected
	lsls r0, 24
	lsrs r0, 24
	b _0800A4E2
	.align 2, 0
_0800A4D0: .4byte gWirelessCommType
_0800A4D4:
	movs r1, 0
	ldr r0, _0800A4E8 @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	bne _0800A4E0
	movs r1, 0x1
_0800A4E0:
	adds r0, r1, 0
_0800A4E2:
	pop {r1}
	bx r1
	.align 2, 0
_0800A4E8: .4byte gLinkCallback
	thumb_func_end IsLinkTaskFinished

	thumb_func_start GetBlockReceivedStatus
GetBlockReceivedStatus: @ 800A4EC
	push {lr}
	ldr r0, _0800A510 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800A518
	ldr r2, _0800A514 @ =gBlockReceivedStatus
	ldrb r0, [r2, 0x3]
	lsls r0, 3
	ldrb r1, [r2, 0x2]
	lsls r1, 2
	orrs r0, r1
	ldrb r1, [r2, 0x1]
	lsls r1, 1
	orrs r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	b _0800A51C
	.align 2, 0
_0800A510: .4byte gWirelessCommType
_0800A514: .4byte gBlockReceivedStatus
_0800A518:
	bl sub_80F9CC8
_0800A51C:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetBlockReceivedStatus

	thumb_func_start SetBlockReceivedFlag
SetBlockReceivedFlag: @ 800A524
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0800A53C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A540
	adds r0, r1, 0
	bl sub_80F9720
	b _0800A548
	.align 2, 0
_0800A53C: .4byte gWirelessCommType
_0800A540:
	ldr r0, _0800A54C @ =gBlockReceivedStatus
	adds r0, r1, r0
	movs r1, 0x1
	strb r1, [r0]
_0800A548:
	pop {r0}
	bx r0
	.align 2, 0
_0800A54C: .4byte gBlockReceivedStatus
	thumb_func_end SetBlockReceivedFlag

	thumb_func_start ResetBlockReceivedFlags
ResetBlockReceivedFlags: @ 800A550
	push {r4,lr}
	ldr r0, _0800A56C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A570
	movs r4, 0
_0800A55C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80F974C
	adds r4, 0x1
	cmp r4, 0x4
	ble _0800A55C
	b _0800A57E
	.align 2, 0
_0800A56C: .4byte gWirelessCommType
_0800A570:
	ldr r1, _0800A584 @ =gBlockReceivedStatus
	movs r2, 0
	adds r0, r1, 0x3
_0800A576:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _0800A576
_0800A57E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A584: .4byte gBlockReceivedStatus
	thumb_func_end ResetBlockReceivedFlags

	thumb_func_start ResetBlockReceivedFlag
ResetBlockReceivedFlag: @ 800A588
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0800A5A0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800A5A4
	adds r0, r1, 0
	bl sub_80F974C
	b _0800A5B2
	.align 2, 0
_0800A5A0: .4byte gWirelessCommType
_0800A5A4:
	ldr r0, _0800A5B8 @ =gBlockReceivedStatus
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800A5B2
	movs r0, 0
	strb r0, [r1]
_0800A5B2:
	pop {r0}
	bx r0
	.align 2, 0
_0800A5B8: .4byte gBlockReceivedStatus
	thumb_func_end ResetBlockReceivedFlag

	thumb_func_start CheckShouldAdvanceLinkState
CheckShouldAdvanceLinkState: @ 800A5BC
	push {lr}
	ldr r0, _0800A5DC @ =gLinkStatus
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800A5D8
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bls _0800A5D8
	ldr r1, _0800A5E0 @ =gShouldAdvanceLinkState
	movs r0, 0x1
	strb r0, [r1]
_0800A5D8:
	pop {r0}
	bx r0
	.align 2, 0
_0800A5DC: .4byte gLinkStatus
_0800A5E0: .4byte gShouldAdvanceLinkState
	thumb_func_end CheckShouldAdvanceLinkState

	thumb_func_start LinkTestCalcBlockChecksum
LinkTestCalcBlockChecksum: @ 800A5E4
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	movs r3, 0
	movs r2, 0
	lsrs r1, 17
	cmp r3, r1
	bcs _0800A60A
_0800A5F4:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bcc _0800A5F4
_0800A60A:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LinkTestCalcBlockChecksum

	thumb_func_start PrintHexDigit
PrintHexDigit: @ 800A614
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r4, _0800A648 @ =gLinkTestBGInfo
	ldr r3, [r4]
	lsls r3, 11
	movs r5, 0xC0
	lsls r5, 19
	adds r3, r5
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r3
	ldr r3, [r4, 0x4]
	lsls r3, 12
	ldr r1, [r4, 0x8]
	adds r1, 0x1
	adds r0, r1
	orrs r3, r0
	strh r3, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A648: .4byte gLinkTestBGInfo
	thumb_func_end PrintHexDigit

	thumb_func_start sub_800A64C
sub_800A64C: @ 800A64C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r4, _0800A680 @ =gLinkTestBGInfo
	ldr r3, [r4]
	lsls r3, 11
	movs r5, 0xC0
	lsls r5, 19
	adds r3, r5
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r3
	ldr r3, [r4, 0x4]
	lsls r3, 12
	ldr r1, [r4, 0x8]
	adds r1, r0
	orrs r3, r1
	strh r3, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A680: .4byte gLinkTestBGInfo
	thumb_func_end sub_800A64C

	thumb_func_start LinkTest_prnthex
LinkTest_prnthex: @ 800A684
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	cmp r4, r3
	bge _0800A6B0
	movs r2, 0xF
_0800A69E:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	lsrs r5, 4
	adds r4, 0x1
	cmp r4, r3
	blt _0800A69E
_0800A6B0:
	subs r4, r3, 0x1
	cmp r4, 0
	blt _0800A6D0
_0800A6B6:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r1, r6, 0
	adds r2, r7, 0
	bl PrintHexDigit
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bge _0800A6B6
_0800A6D0:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end LinkTest_prnthex

	thumb_func_start sub_800A6D8
sub_800A6D8: @ 800A6D8
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r6, 0
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800A718
	adds r4, r3, 0
	lsls r5, r2, 24
_0800A6F0:
	ldrb r0, [r4]
	cmp r0, 0xA
	bne _0800A700
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	movs r6, 0
	b _0800A710
_0800A700:
	ldrb r0, [r4]
	adds r1, r7, r6
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r5, 24
	bl sub_800A64C
	adds r6, 0x1
_0800A710:
	adds r4, 0x1
	ldrb r0, [r4]
	cmp r0, 0
	bne _0800A6F0
_0800A718:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800A6D8

	thumb_func_start LinkCB_RequestPlayerDataExchange
LinkCB_RequestPlayerDataExchange: @ 800A720
	push {lr}
	ldr r0, _0800A740 @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800A734
	ldr r0, _0800A744 @ =0x00002222
	bl BuildSendCmd
_0800A734:
	ldr r1, _0800A748 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800A740: .4byte gLinkStatus
_0800A744: .4byte 0x00002222
_0800A748: .4byte gLinkCallback
	thumb_func_end LinkCB_RequestPlayerDataExchange

	thumb_func_start task00_link_test
task00_link_test: @ 800A74C
	push {r4-r6,lr}
	sub sp, 0x20
	ldr r1, _0800A86C @ =gASCIITestPrint
	mov r0, sp
	bl strcpy
	mov r0, sp
	movs r1, 0x5
	movs r2, 0x2
	bl sub_800A6D8
	ldr r0, _0800A870 @ =gShouldAdvanceLinkState
	ldrb r0, [r0]
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x2
	bl LinkTest_prnthex
	ldr r4, _0800A874 @ =gLinkStatus
	ldr r0, [r4]
	movs r1, 0xF
	movs r2, 0x1
	movs r3, 0x8
	bl LinkTest_prnthex
	ldr r0, _0800A878 @ =gLink
	ldrb r0, [r0, 0x1]
	movs r1, 0x2
	movs r2, 0xA
	movs r3, 0x2
	bl LinkTest_prnthex
	ldr r0, [r4]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	movs r1, 0xF
	movs r2, 0xA
	movs r3, 0x2
	bl LinkTest_prnthex
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0xC
	movs r3, 0x2
	bl LinkTest_prnthex
	ldr r0, _0800A87C @ =gLastSendQueueCount
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x1
	movs r3, 0x2
	bl LinkTest_prnthex
	ldr r0, _0800A880 @ =gLastRecvQueueCount
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x2
	movs r3, 0x2
	bl LinkTest_prnthex
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0x5
	movs r3, 0x2
	bl LinkTest_prnthex
	ldr r0, _0800A884 @ =gLinkDebugSeed
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xC
	movs r3, 0x8
	bl LinkTest_prnthex
	ldr r0, _0800A888 @ =gLinkDebugFlags
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	movs r3, 0x8
	bl LinkTest_prnthex
	bl GetSioMultiSI
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x5
	movs r3, 0x1
	bl LinkTest_prnthex
	bl IsSioMultiMaster
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x6
	movs r3, 0x1
	bl LinkTest_prnthex
	bl IsLinkConnectionEstablished
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x7
	movs r3, 0x1
	bl LinkTest_prnthex
	bl HasLinkErrorOccurred
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x8
	movs r3, 0x1
	bl LinkTest_prnthex
	movs r6, 0
	movs r5, 0x80
	lsls r5, 19
	ldr r4, _0800A88C @ =gLinkTestBlockChecksums
_0800A84A:
	ldrh r0, [r4]
	lsrs r2, r5, 24
	movs r1, 0xA
	movs r3, 0x4
	bl LinkTest_prnthex
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0800A84A
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A86C: .4byte gASCIITestPrint
_0800A870: .4byte gShouldAdvanceLinkState
_0800A874: .4byte gLinkStatus
_0800A878: .4byte gLink
_0800A87C: .4byte gLastSendQueueCount
_0800A880: .4byte gLastRecvQueueCount
_0800A884: .4byte gLinkDebugSeed
_0800A888: .4byte gLinkDebugFlags
_0800A88C: .4byte gLinkTestBlockChecksums
	thumb_func_end task00_link_test

	thumb_func_start SetLinkDebugValues
SetLinkDebugValues: @ 800A890
	ldr r2, _0800A89C @ =gLinkDebugSeed
	str r0, [r2]
	ldr r0, _0800A8A0 @ =gLinkDebugFlags
	str r1, [r0]
	bx lr
	.align 2, 0
_0800A89C: .4byte gLinkDebugSeed
_0800A8A0: .4byte gLinkDebugFlags
	thumb_func_end SetLinkDebugValues

	thumb_func_start sub_800A8A4
sub_800A8A4: @ 800A8A4
	push {r4,lr}
	movs r1, 0
	movs r2, 0
	ldr r0, _0800A8D0 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r1, r0
	bge _0800A8C6
	movs r4, 0x1
	adds r3, r0, 0
_0800A8B6:
	adds r0, r4, 0
	lsls r0, r2
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r1, r0, 24
	adds r2, 0x1
	cmp r2, r3
	blt _0800A8B6
_0800A8C6:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800A8D0: .4byte gSavedLinkPlayerCount
	thumb_func_end sub_800A8A4

	thumb_func_start sub_800A8D4
sub_800A8D4: @ 800A8D4
	push {r4-r6,lr}
	movs r4, 0
	movs r5, 0
	movs r6, 0x1
	b _0800A8EA
_0800A8DE:
	adds r0, r6, 0
	lsls r0, r5
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
	adds r5, 0x1
_0800A8EA:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	blt _0800A8DE
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_800A8D4

	thumb_func_start sub_800A900
sub_800A900: @ 800A900
	push {r4-r7,lr}
	ldr r1, _0800A934 @ =gSavedLinkPlayerCount
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r1, _0800A938 @ =gSavedMultiplayerId
	strb r0, [r1]
	ldr r4, _0800A93C @ =gLinkPlayers
	ldr r3, _0800A940 @ =gSavedLinkPlayers
	movs r2, 0x4
_0800A914:
	adds r0, r3, 0
	adds r1, r4, 0
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bge _0800A914
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A934: .4byte gSavedLinkPlayerCount
_0800A938: .4byte gSavedMultiplayerId
_0800A93C: .4byte gLinkPlayers
_0800A940: .4byte gSavedLinkPlayers
	thumb_func_end sub_800A900

	thumb_func_start sub_800A944
sub_800A944: @ 800A944
	ldr r0, _0800A94C @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800A94C: .4byte gSavedLinkPlayerCount
	thumb_func_end sub_800A944

	thumb_func_start sub_800A950
sub_800A950: @ 800A950
	ldr r0, _0800A958 @ =gSavedMultiplayerId
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800A958: .4byte gSavedMultiplayerId
	thumb_func_end sub_800A950

	thumb_func_start sub_800A95C
sub_800A95C: @ 800A95C
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _0800A990 @ =gSavedLinkPlayerCount
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r5, r2
	bge _0800A986
	ldr r1, _0800A994 @ =gLinkPlayers
	ldr r0, _0800A998 @ =gSavedLinkPlayers
	adds r4, r0, 0x4
	adds r3, r1, 0x4
_0800A972:
	ldr r1, [r3]
	ldr r0, [r4]
	cmp r1, r0
	bne _0800A97C
	adds r5, 0x1
_0800A97C:
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bne _0800A972
_0800A986:
	ldrb r6, [r6]
	cmp r5, r6
	beq _0800A99C
	movs r0, 0
	b _0800A99E
	.align 2, 0
_0800A990: .4byte gSavedLinkPlayerCount
_0800A994: .4byte gLinkPlayers
_0800A998: .4byte gSavedLinkPlayers
_0800A99C:
	movs r0, 0x1
_0800A99E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_800A95C

	thumb_func_start sub_800A9A4
sub_800A9A4: @ 800A9A4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r0, _0800AA10 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0800AA04
	ldr r6, _0800AA14 @ =gSavedLinkPlayers
	ldr r5, _0800AA18 @ =gLinkPlayers
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
_0800A9C2:
	lsls r0, r4, 3
	subs r0, r4
	lsls r2, r0, 2
	adds r1, r6, 0x4
	adds r1, r2, r1
	adds r0, r5, 0x4
	adds r0, r2, r0
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _0800A9E6
	mov r1, r8
	adds r0, r2, r1
	adds r1, r2, r7
	bl StringCompare
	cmp r0, 0
	beq _0800A9F6
_0800A9E6:
	ldr r1, _0800AA1C @ =gLinkErrorOccurred
	movs r0, 0x1
	strb r0, [r1]
	bl CloseLink
	ldr r0, _0800AA20 @ =CB2_LinkError
	bl SetMainCallback2
_0800A9F6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800AA10 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0800A9C2
_0800AA04:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AA10: .4byte gSavedLinkPlayerCount
_0800AA14: .4byte gSavedLinkPlayers
_0800AA18: .4byte gLinkPlayers
_0800AA1C: .4byte gLinkErrorOccurred
_0800AA20: .4byte CB2_LinkError
	thumb_func_end sub_800A9A4

	thumb_func_start sub_800AA24
sub_800AA24: @ 800AA24
	ldr r0, _0800AA30 @ =gSavedLinkPlayerCount
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0800AA34 @ =gSavedMultiplayerId
	strb r1, [r0]
	bx lr
	.align 2, 0
_0800AA30: .4byte gSavedLinkPlayerCount
_0800AA34: .4byte gSavedMultiplayerId
	thumb_func_end sub_800AA24

	thumb_func_start GetLinkPlayerCount_2
GetLinkPlayerCount_2: @ 800AA38
	ldr r0, _0800AA44 @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.align 2, 0
_0800AA44: .4byte gLinkStatus
	thumb_func_end GetLinkPlayerCount_2

	thumb_func_start IsLinkMaster
IsLinkMaster: @ 800AA48
	push {lr}
	ldr r0, _0800AA60 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AA68
	ldr r0, _0800AA64 @ =gLinkStatus
	ldr r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	ands r0, r1
	b _0800AA70
	.align 2, 0
_0800AA60: .4byte gWirelessCommType
_0800AA64: .4byte gLinkStatus
_0800AA68:
	bl sub_80FBA2C
	lsls r0, 24
	lsrs r0, 24
_0800AA70:
	pop {r1}
	bx r1
	thumb_func_end IsLinkMaster

	thumb_func_start sub_800AA74
sub_800AA74: @ 800AA74
	ldr r0, _0800AA7C @ =gUnknown_3000E50
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800AA7C: .4byte gUnknown_3000E50
	thumb_func_end sub_800AA74

	thumb_func_start sub_800AA80
sub_800AA80: @ 800AA80
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _0800AA94 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800AA98
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	b _0800AAAC
	.align 2, 0
_0800AA94: .4byte gWirelessCommType
_0800AA98:
	ldr r2, _0800AAB0 @ =gLinkCallback
	ldr r1, [r2]
	cmp r1, 0
	bne _0800AAAC
	ldr r0, _0800AAB4 @ =sub_800AB0C
	str r0, [r2]
	ldr r0, _0800AAB8 @ =gUnknown_3003F24
	strb r1, [r0]
	ldr r0, _0800AABC @ =gUnknown_3003F34
	strh r3, [r0]
_0800AAAC:
	pop {r0}
	bx r0
	.align 2, 0
_0800AAB0: .4byte gLinkCallback
_0800AAB4: .4byte sub_800AB0C
_0800AAB8: .4byte gUnknown_3003F24
_0800AABC: .4byte gUnknown_3003F34
	thumb_func_end sub_800AA80

	thumb_func_start sub_800AAC0
sub_800AAC0: @ 800AAC0
	push {lr}
	ldr r0, _0800AAD0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800AAD4
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	b _0800AAFC
	.align 2, 0
_0800AAD0: .4byte gWirelessCommType
_0800AAD4:
	ldr r2, _0800AAE8 @ =gLinkCallback
	ldr r1, [r2]
	cmp r1, 0
	beq _0800AAF0
	ldr r1, _0800AAEC @ =gUnknown_202285C
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0800AAFC
	.align 2, 0
_0800AAE8: .4byte gLinkCallback
_0800AAEC: .4byte gUnknown_202285C
_0800AAF0:
	ldr r0, _0800AB00 @ =sub_800AB0C
	str r0, [r2]
	ldr r0, _0800AB04 @ =gUnknown_3003F24
	strb r1, [r0]
	ldr r0, _0800AB08 @ =gUnknown_3003F34
	strh r1, [r0]
_0800AAFC:
	pop {r0}
	bx r0
	.align 2, 0
_0800AB00: .4byte sub_800AB0C
_0800AB04: .4byte gUnknown_3003F24
_0800AB08: .4byte gUnknown_3003F34
	thumb_func_end sub_800AAC0

	thumb_func_start sub_800AB0C
sub_800AB0C: @ 800AB0C
	push {lr}
	ldr r0, _0800AB28 @ =gLastRecvQueueCount
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AB22
	ldr r0, _0800AB2C @ =0x00005fff
	bl BuildSendCmd
	ldr r1, _0800AB30 @ =gLinkCallback
	ldr r0, _0800AB34 @ =sub_800AB38
	str r0, [r1]
_0800AB22:
	pop {r0}
	bx r0
	.align 2, 0
_0800AB28: .4byte gLastRecvQueueCount
_0800AB2C: .4byte 0x00005fff
_0800AB30: .4byte gLinkCallback
_0800AB34: .4byte sub_800AB38
	thumb_func_end sub_800AB0C

	thumb_func_start sub_800AB38
sub_800AB38: @ 800AB38
	push {r4,lr}
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	movs r1, 0
	cmp r3, r2
	bge _0800AB5C
	ldr r4, _0800AB84 @ =gUnknown_3003F30
_0800AB4C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800AB56
	adds r3, 0x1
_0800AB56:
	adds r1, 0x1
	cmp r1, r2
	blt _0800AB4C
_0800AB5C:
	cmp r3, r2
	bne _0800AB7E
	ldr r2, _0800AB88 @ =gBattleTypeFlags
	ldr r0, [r2]
	ldr r1, _0800AB8C @ =0x0000ffdf
	ands r0, r1
	str r0, [r2]
	ldr r0, _0800AB90 @ =gLinkVSyncDisabled
	movs r4, 0x1
	strb r4, [r0]
	bl CloseLink
	ldr r1, _0800AB94 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	ldr r0, _0800AB98 @ =gUnknown_3003F24
	strb r4, [r0]
_0800AB7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB84: .4byte gUnknown_3003F30
_0800AB88: .4byte gBattleTypeFlags
_0800AB8C: .4byte 0x0000ffdf
_0800AB90: .4byte gLinkVSyncDisabled
_0800AB94: .4byte gLinkCallback
_0800AB98: .4byte gUnknown_3003F24
	thumb_func_end sub_800AB38

	thumb_func_start sub_800AB9C
sub_800AB9C: @ 800AB9C
	push {lr}
	ldr r0, _0800ABAC @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0800ABB0
	bl sub_80FA42C
	b _0800ABC2
	.align 2, 0
_0800ABAC: .4byte gWirelessCommType
_0800ABB0:
	ldr r1, _0800ABC8 @ =gLinkCallback
	ldr r0, [r1]
	cmp r0, 0
	bne _0800ABBC
	ldr r0, _0800ABCC @ =sub_800ABD4
	str r0, [r1]
_0800ABBC:
	ldr r1, _0800ABD0 @ =gUnknown_3003F24
	movs r0, 0
	strb r0, [r1]
_0800ABC2:
	pop {r0}
	bx r0
	.align 2, 0
_0800ABC8: .4byte gLinkCallback
_0800ABCC: .4byte sub_800ABD4
_0800ABD0: .4byte gUnknown_3003F24
	thumb_func_end sub_800AB9C

	thumb_func_start sub_800ABD4
sub_800ABD4: @ 800ABD4
	push {lr}
	ldr r0, _0800ABF0 @ =gLastRecvQueueCount
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800ABEA
	ldr r0, _0800ABF4 @ =0x00002ffe
	bl BuildSendCmd
	ldr r1, _0800ABF8 @ =gLinkCallback
	ldr r0, _0800ABFC @ =sub_800AC00
	str r0, [r1]
_0800ABEA:
	pop {r0}
	bx r0
	.align 2, 0
_0800ABF0: .4byte gLastRecvQueueCount
_0800ABF4: .4byte 0x00002ffe
_0800ABF8: .4byte gLinkCallback
_0800ABFC: .4byte sub_800AC00
	thumb_func_end sub_800ABD4

	thumb_func_start sub_800AC00
sub_800AC00: @ 800AC00
	push {r4,lr}
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	cmp r1, r2
	bcs _0800AC2A
	ldr r3, _0800AC50 @ =gUnknown_3003F2C
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800AC2A
_0800AC18:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _0800AC2A
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AC18
_0800AC2A:
	cmp r1, r2
	bne _0800AC48
	movs r1, 0
	ldr r4, _0800AC54 @ =gLinkCallback
	ldr r3, _0800AC50 @ =gUnknown_3003F2C
	movs r2, 0
_0800AC36:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _0800AC36
	movs r0, 0
	str r0, [r4]
_0800AC48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AC50: .4byte gUnknown_3003F2C
_0800AC54: .4byte gLinkCallback
	thumb_func_end sub_800AC00

	thumb_func_start CheckErrorStatus
CheckErrorStatus: @ 800AC58
	push {lr}
	ldr r0, _0800AC9C @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800AC98
	ldr r0, _0800ACA0 @ =gLinkStatus
	ldr r2, [r0]
	movs r0, 0xFE
	lsls r0, 11
	ands r0, r2
	cmp r0, 0
	beq _0800AC98
	ldr r0, _0800ACA4 @ =gSuppressLinkErrorMessage
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800AC8E
	ldr r1, _0800ACA8 @ =sLinkErrorBuffer
	str r2, [r1]
	ldr r0, _0800ACAC @ =gLastRecvQueueCount
	ldrb r0, [r0]
	strb r0, [r1, 0x4]
	ldr r0, _0800ACB0 @ =gLastSendQueueCount
	ldrb r0, [r0]
	strb r0, [r1, 0x5]
	ldr r0, _0800ACB4 @ =CB2_LinkError
	bl SetMainCallback2
_0800AC8E:
	ldr r1, _0800ACB8 @ =gLinkErrorOccurred
	movs r0, 0x1
	strb r0, [r1]
	bl CloseLink
_0800AC98:
	pop {r0}
	bx r0
	.align 2, 0
_0800AC9C: .4byte gLinkOpen
_0800ACA0: .4byte gLinkStatus
_0800ACA4: .4byte gSuppressLinkErrorMessage
_0800ACA8: .4byte sLinkErrorBuffer
_0800ACAC: .4byte gLastRecvQueueCount
_0800ACB0: .4byte gLastSendQueueCount
_0800ACB4: .4byte CB2_LinkError
_0800ACB8: .4byte gLinkErrorOccurred
	thumb_func_end CheckErrorStatus

	thumb_func_start sub_800ACBC
sub_800ACBC: @ 800ACBC
	push {r4,lr}
	ldr r4, _0800ACD0 @ =sLinkErrorBuffer
	str r0, [r4]
	strb r1, [r4, 0x5]
	strb r2, [r4, 0x4]
	strb r3, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ACD0: .4byte sLinkErrorBuffer
	thumb_func_end sub_800ACBC

	thumb_func_start CB2_LinkError
CB2_LinkError: @ 800ACD4
	push {r4,lr}
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	ldr r0, _0800ADE0 @ =gMPlayInfo_SE1
	bl m4aMPlayStop
	ldr r0, _0800ADE4 @ =gMPlayInfo_SE2
	bl m4aMPlayStop
	ldr r0, _0800ADE8 @ =gMPlayInfo_SE3
	bl m4aMPlayStop
	ldr r0, _0800ADEC @ =gHeap
	movs r1, 0xE0
	lsls r1, 9
	bl InitHeap
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFadeControl
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl ResetTasks
	bl ScanlineEffect_Stop
	ldr r1, _0800ADF0 @ =gWirelessCommType
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800AD30
	ldr r0, _0800ADF4 @ =sLinkErrorBuffer
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _0800AD2C
	movs r0, 0x3
	strb r0, [r1]
_0800AD2C:
	bl sub_80F85F8
_0800AD30:
	ldr r0, _0800ADF8 @ =sub_800978C
	bl SetVBlankCallback
	movs r0, 0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0800ADFC @ =gUnknown_82345E8
	movs r0, 0
	movs r2, 0x2
	bl InitBgsFromTemplates
	ldr r4, _0800AE00 @ =gUnknown_2022860
	movs r0, 0x80
	lsls r0, 4
	bl Alloc
	adds r1, r0, 0
	str r1, [r4]
	movs r0, 0x1
	bl SetBgTilemapBuffer
	ldr r0, _0800AE04 @ =gUnknown_82345F0
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	beq _0800ADD8
	bl DeactivateAllTextPrinters
	bl ResetTempTileDataBuffers
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x10
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x12
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x14
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x16
	movs r1, 0
	bl SetGpuReg
	movs r1, 0xE0
	lsls r1, 8
	movs r0, 0
	bl ClearGpuRegBits
	ldr r0, _0800AE08 @ =gTMCaseMainWindowPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0800AE0C @ =gSoftResetDisabled
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0800AE10 @ =Task_DestroySelf
	movs r1, 0
	bl CreateTask
	bl StopMapMusic
	ldr r1, _0800AE14 @ =gMain
	movs r0, 0
	str r0, [r1]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _0800AE18 @ =sub_800AF2C
	bl SetMainCallback2
_0800ADD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ADE0: .4byte gMPlayInfo_SE1
_0800ADE4: .4byte gMPlayInfo_SE2
_0800ADE8: .4byte gMPlayInfo_SE3
_0800ADEC: .4byte gHeap
_0800ADF0: .4byte gWirelessCommType
_0800ADF4: .4byte sLinkErrorBuffer
_0800ADF8: .4byte sub_800978C
_0800ADFC: .4byte gUnknown_82345E8
_0800AE00: .4byte gUnknown_2022860
_0800AE04: .4byte gUnknown_82345F0
_0800AE08: .4byte gTMCaseMainWindowPalette
_0800AE0C: .4byte gSoftResetDisabled
_0800AE10: .4byte Task_DestroySelf
_0800AE14: .4byte gMain
_0800AE18: .4byte sub_800AF2C
	thumb_func_end CB2_LinkError

	thumb_func_start sub_800AE1C
sub_800AE1C: @ 800AE1C
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r1, _0800AEB8 @ =gWirelessLinkDisplay4bpp
	movs r5, 0
	str r5, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0800AEBC @ =gWirelessLinkDisplayBin
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl CopyToBgTilemapBuffer
	movs r0, 0x1
	bl CopyBgTilemapBufferToVram
	ldr r0, _0800AEC0 @ =gWirelessLinkDisplayPal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r4, _0800AEC4 @ =gUnknown_8234610
	str r4, [sp]
	str r5, [sp, 0x4]
	ldr r0, _0800AEC8 @ =gUnknown_841DEF0
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x5
	bl AddTextPrinterParameterized3
	str r4, [sp]
	str r5, [sp, 0x4]
	ldr r0, _0800AECC @ =gUnknown_841DF05
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x2
	bl AddTextPrinterParameterized3
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0
	movs r1, 0
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800AEB8: .4byte gWirelessLinkDisplay4bpp
_0800AEBC: .4byte gWirelessLinkDisplayBin
_0800AEC0: .4byte gWirelessLinkDisplayPal
_0800AEC4: .4byte gUnknown_8234610
_0800AEC8: .4byte gUnknown_841DEF0
_0800AECC: .4byte gUnknown_841DF05
	thumb_func_end sub_800AE1C

	thumb_func_start sub_800AED0
sub_800AED0: @ 800AED0
	push {lr}
	sub sp, 0xC
	movs r0, 0x1
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x2
	movs r1, 0
	bl FillWindowPixelBuffer
	ldr r0, _0800AF24 @ =gUnknown_8234610
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0800AF28 @ =gUnknown_841DE9D
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized3
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x2
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0
	bl CopyWindowToVram
	movs r0, 0x2
	movs r1, 0x3
	bl CopyWindowToVram
	movs r0, 0
	bl ShowBg
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0800AF24: .4byte gUnknown_8234610
_0800AF28: .4byte gUnknown_841DE9D
	thumb_func_end sub_800AED0

	thumb_func_start sub_800AF2C
sub_800AF2C: @ 800AF2C
	push {r4,lr}
	sub sp, 0xC
	ldr r0, _0800AF4C @ =gMain
	movs r1, 0x87
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3C
	beq _0800AF72
	cmp r0, 0x3C
	bgt _0800AF50
	cmp r0, 0
	beq _0800AF5A
	cmp r0, 0x1E
	beq _0800AF72
	b _0800AFC4
	.align 2, 0
_0800AF4C: .4byte gMain
_0800AF50:
	cmp r0, 0x5A
	beq _0800AF72
	cmp r0, 0x82
	beq _0800AF7A
	b _0800AFC4
_0800AF5A:
	ldr r0, _0800AF68 @ =sLinkErrorBuffer
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	beq _0800AF6C
	bl sub_800AE1C
	b _0800AFC4
	.align 2, 0
_0800AF68: .4byte sLinkErrorBuffer
_0800AF6C:
	bl sub_800AED0
	b _0800AFC4
_0800AF72:
	movs r0, 0x16
	bl PlaySE
	b _0800AFC4
_0800AF7A:
	ldr r0, _0800AF9C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800AFA8
	ldr r0, _0800AFA0 @ =gUnknown_8234610
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0800AFA4 @ =gUnknown_841DF6B
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x14
	bl AddTextPrinterParameterized3
	b _0800AFC4
	.align 2, 0
_0800AF9C: .4byte gWirelessCommType
_0800AFA0: .4byte gUnknown_8234610
_0800AFA4: .4byte gUnknown_841DF6B
_0800AFA8:
	cmp r0, 0x1
	bne _0800AFC4
	ldr r0, _0800AFFC @ =gUnknown_8234610
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r0, _0800B000 @ =gUnknown_841DF4C
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x14
	bl AddTextPrinterParameterized3
_0800AFC4:
	ldr r0, _0800B004 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, 0xA0
	bne _0800B03C
	ldr r4, _0800B008 @ =gWirelessCommType
	ldrb r2, [r4]
	cmp r2, 0x1
	bne _0800B010
	ldrh r0, [r0, 0x2E]
	ands r2, r0
	cmp r2, 0
	beq _0800B02E
	bl sub_812B484
	movs r0, 0x15
	bl PlaySE
	movs r0, 0
	strb r0, [r4]
	ldr r1, _0800B00C @ =sLinkErrorBuffer
	movs r0, 0
	strb r0, [r1, 0x6]
	bl sub_8079B7C
	b _0800B02E
	.align 2, 0
_0800AFFC: .4byte gUnknown_8234610
_0800B000: .4byte gUnknown_841DF4C
_0800B004: .4byte gMain
_0800B008: .4byte gWirelessCommType
_0800B00C: .4byte sLinkErrorBuffer
_0800B010:
	cmp r2, 0x2
	bne _0800B02E
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0800B02E
	bl sub_812B484
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	bl DoSoftReset
_0800B02E:
	ldr r0, _0800B050 @ =gMain
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, 0xA0
	beq _0800B048
_0800B03C:
	movs r2, 0x87
	lsls r2, 3
	adds r1, r0, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0800B048:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B050: .4byte gMain
	thumb_func_end sub_800AF2C

	thumb_func_start GetSioMultiSI
GetSioMultiSI: @ 800B054
	ldr r0, _0800B060 @ =0x04000128
	ldrh r0, [r0]
	lsrs r0, 2
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0800B060: .4byte 0x04000128
	thumb_func_end GetSioMultiSI

	thumb_func_start IsSioMultiMaster
IsSioMultiMaster: @ 800B064
	push {lr}
	movs r3, 0
	ldr r2, _0800B088 @ =0x04000128
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800B080
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0800B080
	movs r3, 0x1
_0800B080:
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_0800B088: .4byte 0x04000128
	thumb_func_end IsSioMultiMaster

	thumb_func_start IsLinkConnectionEstablished
IsLinkConnectionEstablished: @ 800B08C
	ldr r0, _0800B098 @ =gLinkStatus
	ldr r0, [r0]
	lsrs r0, 6
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0800B098: .4byte gLinkStatus
	thumb_func_end IsLinkConnectionEstablished

	thumb_func_start SetSuppressLinkErrorMessage
SetSuppressLinkErrorMessage: @ 800B09C
	ldr r1, _0800B0A4 @ =gSuppressLinkErrorMessage
	strb r0, [r1]
	bx lr
	.align 2, 0
_0800B0A4: .4byte gSuppressLinkErrorMessage
	thumb_func_end SetSuppressLinkErrorMessage

	thumb_func_start HasLinkErrorOccurred
HasLinkErrorOccurred: @ 800B0A8
	ldr r0, _0800B0B0 @ =gLinkErrorOccurred
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800B0B0: .4byte gLinkErrorOccurred
	thumb_func_end HasLinkErrorOccurred

	thumb_func_start sub_800B0B4
sub_800B0B4: @ 800B0B4
	push {r4-r6,lr}
	bl InitLocalLinkPlayer
	ldr r1, _0800B100 @ =gLocalLinkPlayerBlock
	adds r2, r1, 0
	adds r2, 0x10
	ldr r0, _0800B104 @ =gLocalLinkPlayer
	ldm r0!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r0!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldr r0, [r0]
	str r0, [r2]
	ldr r3, _0800B108 @ =gASCIIGameFreakInc
	adds r2, r1, 0
	adds r0, r3, 0
	ldm r0!, {r4-r6}
	stm r2!, {r4-r6}
	ldrh r4, [r0]
	strh r4, [r2]
	ldrb r0, [r0, 0x2]
	strb r0, [r2, 0x2]
	adds r0, r1, 0
	adds r0, 0x2C
	ldm r3!, {r2,r5,r6}
	stm r0!, {r2,r5,r6}
	ldrh r2, [r3]
	strh r2, [r0]
	ldrb r2, [r3, 0x2]
	strb r2, [r0, 0x2]
	ldr r0, _0800B10C @ =gBlockSendBuffer
	movs r2, 0x3C
	bl memcpy
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B100: .4byte gLocalLinkPlayerBlock
_0800B104: .4byte gLocalLinkPlayer
_0800B108: .4byte gASCIIGameFreakInc
_0800B10C: .4byte gBlockSendBuffer
	thumb_func_end sub_800B0B4

	thumb_func_start sub_800B110
sub_800B110: @ 800B110
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 8
	ldr r1, _0800B168 @ =gBlockRecvBuffer
	adds r4, r2, r1
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, _0800B16C @ =gLinkPlayers
	adds r2, r0
	adds r1, r2, 0
	adds r0, r4, 0
	adds r0, 0x10
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r2, 0
	bl sub_800B284
	ldr r5, _0800B170 @ =gASCIIGameFreakInc
	adds r0, r4, 0
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	bne _0800B15A
	adds r0, r4, 0
	adds r0, 0x2C
	adds r1, r5, 0
	bl strcmp
	cmp r0, 0
	beq _0800B160
_0800B15A:
	ldr r0, _0800B174 @ =CB2_LinkError
	bl SetMainCallback2
_0800B160:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B168: .4byte gBlockRecvBuffer
_0800B16C: .4byte gLinkPlayers
_0800B170: .4byte gASCIIGameFreakInc
_0800B174: .4byte CB2_LinkError
	thumb_func_end sub_800B110

	thumb_func_start HandleLinkConnection
HandleLinkConnection: @ 800B178
	push {r4,r5,lr}
	ldr r0, _0800B1B0 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B1C8
	ldr r0, _0800B1B4 @ =gShouldAdvanceLinkState
	ldr r1, _0800B1B8 @ =gSendCmd
	ldr r2, _0800B1BC @ =gRecvCmds
	bl LinkMain1
	ldr r4, _0800B1C0 @ =gLinkStatus
	str r0, [r4]
	ldr r0, _0800B1C4 @ =gMain + 0x2C
	bl LinkMain2
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	beq _0800B1EC
	bl sub_8058318
	cmp r0, 0x1
	bne _0800B1EC
_0800B1AA:
	movs r0, 0x1
	b _0800B1EE
	.align 2, 0
_0800B1B0: .4byte gWirelessCommType
_0800B1B4: .4byte gShouldAdvanceLinkState
_0800B1B8: .4byte gSendCmd
_0800B1BC: .4byte gRecvCmds
_0800B1C0: .4byte gLinkStatus
_0800B1C4: .4byte gMain + 0x2C
_0800B1C8:
	bl sub_80FAE94
	adds r4, r0, 0
	bl sub_80FAEF0
	adds r5, r0, 0
	bl sub_8058318
	cmp r0, 0x1
	bne _0800B1EC
	cmp r4, 0x1
	beq _0800B1AA
	bl sub_80F90DC
	cmp r0, 0
	bne _0800B1AA
	cmp r5, 0
	bne _0800B1AA
_0800B1EC:
	movs r0, 0
_0800B1EE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end HandleLinkConnection

	thumb_func_start sub_800B1F4
sub_800B1F4: @ 800B1F4
	push {lr}
	ldr r0, _0800B208 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B204
	ldr r1, _0800B20C @ =gWirelessCommType
	movs r0, 0x1
	strb r0, [r1]
_0800B204:
	pop {r0}
	bx r0
	.align 2, 0
_0800B208: .4byte gReceivedRemoteLinkPlayers
_0800B20C: .4byte gWirelessCommType
	thumb_func_end sub_800B1F4

	thumb_func_start sub_800B210
sub_800B210: @ 800B210
	push {lr}
	ldr r0, _0800B224 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _0800B21E
	ldr r0, _0800B228 @ =gWirelessCommType
	strb r1, [r0]
_0800B21E:
	pop {r0}
	bx r0
	.align 2, 0
_0800B224: .4byte gReceivedRemoteLinkPlayers
_0800B228: .4byte gWirelessCommType
	thumb_func_end sub_800B210

	thumb_func_start sub_800B22C
sub_800B22C: @ 800B22C
	push {lr}
	ldr r0, _0800B240 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _0800B23A
	ldr r0, _0800B244 @ =gWirelessCommType
	strb r1, [r0]
_0800B23A:
	pop {r0}
	bx r0
	.align 2, 0
_0800B240: .4byte gReceivedRemoteLinkPlayers
_0800B244: .4byte gWirelessCommType
	thumb_func_end sub_800B22C

	thumb_func_start sub_800B248
sub_800B248: @ 800B248
	push {lr}
	ldr r0, _0800B25C @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800B268
	ldr r0, _0800B260 @ =gLink
	ldr r1, _0800B264 @ =0x00000fbd
	adds r0, r1
	ldrb r0, [r0]
	b _0800B26C
	.align 2, 0
_0800B25C: .4byte gWirelessCommType
_0800B260: .4byte gLink
_0800B264: .4byte 0x00000fbd
_0800B268:
	bl sub_80FC460
_0800B26C:
	pop {r1}
	bx r1
	thumb_func_end sub_800B248

	thumb_func_start sub_800B270
sub_800B270: @ 800B270
	push {lr}
	bl sub_800B248
	cmp r0, 0x2
	bhi _0800B27E
	movs r0, 0
	b _0800B280
_0800B27E:
	movs r0, 0x1
_0800B280:
	pop {r1}
	bx r1
	thumb_func_end sub_800B270

	thumb_func_start sub_800B284
sub_800B284: @ 800B284
	push {lr}
	ldrb r1, [r0, 0x10]
	strb r1, [r0, 0x12]
	adds r2, r0, 0
	adds r2, 0x8
	ldrb r1, [r0, 0x1A]
	adds r0, r2, 0
	bl ConvertInternationalString
	pop {r0}
	bx r0
	thumb_func_end sub_800B284

	thumb_func_start DisableSerial
DisableSerial: @ 800B29C
	push {lr}
	sub sp, 0x4
	movs r0, 0xC0
	bl DisableInterrupts
	ldr r1, _0800B2DC @ =0x04000128
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0800B2E0 @ =0x0400010e
	movs r2, 0
	strh r2, [r0]
	adds r1, 0xDA
	movs r0, 0xC0
	strh r0, [r1]
	ldr r0, _0800B2E4 @ =0x0400012a
	strh r2, [r0]
	ldr r2, _0800B2E8 @ =0x04000120
	movs r0, 0
	movs r1, 0
	str r0, [r2]
	str r1, [r2, 0x4]
	str r0, [sp]
	ldr r1, _0800B2EC @ =gLink
	ldr r2, _0800B2F0 @ =0x050003f0
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0800B2DC: .4byte 0x04000128
_0800B2E0: .4byte 0x0400010e
_0800B2E4: .4byte 0x0400012a
_0800B2E8: .4byte 0x04000120
_0800B2EC: .4byte gLink
_0800B2F0: .4byte 0x050003f0
	thumb_func_end DisableSerial

	thumb_func_start EnableSerial
EnableSerial: @ 800B2F4
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0xC0
	bl DisableInterrupts
	ldr r0, _0800B354 @ =0x04000134
	movs r4, 0
	strh r4, [r0]
	ldr r2, _0800B358 @ =0x04000128
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r3, _0800B35C @ =0x00004003
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0x80
	bl EnableInterrupts
	ldr r0, _0800B360 @ =0x0400012a
	strh r4, [r0]
	movs r5, 0
	str r5, [sp]
	ldr r1, _0800B364 @ =gLink
	ldr r2, _0800B368 @ =0x050003f0
	mov r0, sp
	bl CpuSet
	ldr r0, _0800B36C @ =sNumVBlanksWithoutSerialIntr
	strb r4, [r0]
	ldr r0, _0800B370 @ =sSendNonzeroCheck
	strh r5, [r0]
	ldr r0, _0800B374 @ =sRecvNonzeroCheck
	strh r5, [r0]
	ldr r0, _0800B378 @ =sChecksumAvailable
	strb r4, [r0]
	ldr r0, _0800B37C @ =sHandshakePlayerCount
	strb r4, [r0]
	ldr r0, _0800B380 @ =gLastSendQueueCount
	strb r4, [r0]
	ldr r0, _0800B384 @ =gLastRecvQueueCount
	strb r4, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B354: .4byte 0x04000134
_0800B358: .4byte 0x04000128
_0800B35C: .4byte 0x00004003
_0800B360: .4byte 0x0400012a
_0800B364: .4byte gLink
_0800B368: .4byte 0x050003f0
_0800B36C: .4byte sNumVBlanksWithoutSerialIntr
_0800B370: .4byte sSendNonzeroCheck
_0800B374: .4byte sRecvNonzeroCheck
_0800B378: .4byte sChecksumAvailable
_0800B37C: .4byte sHandshakePlayerCount
_0800B380: .4byte gLastSendQueueCount
_0800B384: .4byte gLastRecvQueueCount
	thumb_func_end EnableSerial

	thumb_func_start ResetSerial
ResetSerial: @ 800B388
	push {lr}
	bl EnableSerial
	bl DisableSerial
	pop {r0}
	bx r0
	thumb_func_end ResetSerial

	thumb_func_start LinkMain1
LinkMain1: @ 800B398
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _0800B3B4 @ =gLink
	ldrb r0, [r0, 0x1]
	cmp r0, 0x4
	bhi _0800B44A
	lsls r0, 2
	ldr r1, _0800B3B8 @ =_0800B3BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B3B4: .4byte gLink
_0800B3B8: .4byte _0800B3BC
	.align 2, 0
_0800B3BC:
	.4byte _0800B3D0
	.4byte _0800B3E0
	.4byte _0800B3F8
	.4byte _0800B434
	.4byte _0800B43E
_0800B3D0:
	bl DisableSerial
	ldr r1, _0800B3DC @ =gLink
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _0800B44A
	.align 2, 0
_0800B3DC: .4byte gLink
_0800B3E0:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _0800B44A
	bl EnableSerial
	ldr r1, _0800B3F4 @ =gLink
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _0800B44A
	.align 2, 0
_0800B3F4: .4byte gLink
_0800B3F8:
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _0800B408
	cmp r1, 0x2
	beq _0800B420
	bl CheckMasterOrSlave
	b _0800B44A
_0800B408:
	ldr r2, _0800B41C @ =gLink
	ldrb r0, [r2]
	cmp r0, 0x8
	bne _0800B44A
	ldrb r0, [r2, 0x3]
	cmp r0, 0x1
	bls _0800B44A
	strb r1, [r2, 0xE]
	b _0800B44A
	.align 2, 0
_0800B41C: .4byte gLink
_0800B420:
	ldr r0, _0800B42C @ =gLink
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, _0800B430 @ =0x0400012a
	strh r1, [r0]
	b _0800B44A
	.align 2, 0
_0800B42C: .4byte gLink
_0800B430: .4byte 0x0400012a
_0800B434:
	bl InitTimer
	ldr r1, _0800B484 @ =gLink
	movs r0, 0x4
	strb r0, [r1, 0x1]
_0800B43E:
	adds r0, r5, 0
	bl sub_800B520
	adds r0, r6, 0
	bl sub_800B608
_0800B44A:
	movs r0, 0
	strb r0, [r4]
	ldr r1, _0800B484 @ =gLink
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _0800B462
	movs r0, 0x20
	orrs r2, r0
_0800B462:
	ldrb r0, [r1, 0xC]
	lsls r3, r0, 8
	ldrb r0, [r1, 0xF]
	lsls r4, r0, 9
	ldrb r0, [r1, 0x10]
	lsls r5, r0, 12
	ldrb r0, [r1, 0x11]
	lsls r6, r0, 13
	ldrb r0, [r1, 0x12]
	lsls r7, r0, 14
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _0800B488
	movs r0, 0x40
	orrs r0, r3
	orrs r0, r2
	b _0800B48C
	.align 2, 0
_0800B484: .4byte gLink
_0800B488:
	adds r0, r2, 0
	orrs r0, r3
_0800B48C:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, 0
	ldrb r3, [r1, 0x13]
	cmp r3, 0x1
	bne _0800B4A2
	movs r0, 0x80
	lsls r0, 9
	orrs r2, r0
_0800B4A2:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x3
	bls _0800B4AE
	movs r0, 0x80
	lsls r0, 10
	orrs r2, r0
_0800B4AE:
	adds r1, r2, 0
	cmp r3, 0x2
	bne _0800B4BA
	movs r0, 0x80
	lsls r0, 11
	orrs r1, r0
_0800B4BA:
	adds r0, r1, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LinkMain1

	thumb_func_start CheckMasterOrSlave
CheckMasterOrSlave: @ 800B4C4
	push {lr}
	ldr r0, _0800B4E0 @ =0x04000128
	ldr r1, [r0]
	movs r0, 0xC
	ands r1, r0
	ldr r2, _0800B4E4 @ =gLink
	cmp r1, 0x8
	bne _0800B4E8
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _0800B4E8
	strb r1, [r2]
	b _0800B4EC
	.align 2, 0
_0800B4E0: .4byte 0x04000128
_0800B4E4: .4byte gLink
_0800B4E8:
	movs r0, 0
	strb r0, [r2]
_0800B4EC:
	pop {r0}
	bx r0
	thumb_func_end CheckMasterOrSlave

	thumb_func_start InitTimer
InitTimer: @ 800B4F0
	push {lr}
	ldr r0, _0800B514 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800B50E
	ldr r1, _0800B518 @ =0x0400010c
	ldr r2, _0800B51C @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x41
	strh r0, [r1]
	movs r0, 0x40
	bl EnableInterrupts
_0800B50E:
	pop {r0}
	bx r0
	.align 2, 0
_0800B514: .4byte gLink
_0800B518: .4byte 0x0400010c
_0800B51C: .4byte 0x0000ff3b
	thumb_func_end InitTimer

	thumb_func_start sub_800B520
sub_800B520: @ 800B520
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	ldr r2, _0800B598 @ =gLinkSavedIme
	ldr r1, _0800B59C @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0800B5A0 @ =gLink
	ldr r4, _0800B5A4 @ =0x00000339
	adds r0, r1, r4
	ldrb r4, [r0]
	adds r6, r1, 0
	cmp r4, 0x31
	bhi _0800B5B0
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B55E
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800B55E:
	movs r2, 0
	ldr r4, _0800B5A8 @ =sSendNonzeroCheck
	mov r9, r4
	ldr r1, _0800B5AC @ =gLastSendQueueCount
	mov r10, r1
	lsls r5, r0, 1
	movs r0, 0x18
	adds r0, r6
	mov r8, r0
	mov r12, r2
	movs r7, 0x64
_0800B574:
	ldrh r0, [r4]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r2, 0
	muls r0, r7
	adds r0, r5, r0
	add r0, r8
	strh r1, [r0]
	mov r1, r12
	strh r1, [r3]
	adds r3, 0x2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B574
	b _0800B5BC
	.align 2, 0
_0800B598: .4byte gLinkSavedIme
_0800B59C: .4byte 0x04000208
_0800B5A0: .4byte gLink
_0800B5A4: .4byte 0x00000339
_0800B5A8: .4byte sSendNonzeroCheck
_0800B5AC: .4byte gLastSendQueueCount
_0800B5B0:
	movs r0, 0x1
	strb r0, [r6, 0x12]
	ldr r2, _0800B5F4 @ =sSendNonzeroCheck
	mov r9, r2
	ldr r4, _0800B5F8 @ =gLastSendQueueCount
	mov r10, r4
_0800B5BC:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	beq _0800B5D4
	ldr r2, _0800B5FC @ =0x00000339
	adds r0, r6, r2
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	mov r4, r9
	strh r2, [r4]
_0800B5D4:
	ldr r1, _0800B600 @ =0x04000208
	ldr r2, _0800B604 @ =gLinkSavedIme
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r4, _0800B5FC @ =0x00000339
	adds r0, r6, r4
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B5F4: .4byte sSendNonzeroCheck
_0800B5F8: .4byte gLastSendQueueCount
_0800B5FC: .4byte 0x00000339
_0800B600: .4byte 0x04000208
_0800B604: .4byte gLinkSavedIme
	thumb_func_end sub_800B520

	thumb_func_start sub_800B608
sub_800B608: @ 800B608
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	ldr r2, _0800B664 @ =gLinkSavedIme
	ldr r1, _0800B668 @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0800B66C @ =gLink
	ldr r3, _0800B670 @ =0x00000fbd
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0
	bne _0800B674
	movs r3, 0
	ldrb r0, [r1, 0x3]
	cmp r3, r0
	bcs _0800B65A
	movs r5, 0
	adds r6, r0, 0
_0800B63A:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	add r1, r9
_0800B642:
	lsls r0, r2, 1
	adds r0, r1
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B642
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r6
	bcc _0800B63A
_0800B65A:
	movs r0, 0x1
	mov r7, r12
	strb r0, [r7, 0xC]
	b _0800B6F0
	.align 2, 0
_0800B664: .4byte gLinkSavedIme
_0800B668: .4byte 0x04000208
_0800B66C: .4byte gLink
_0800B670: .4byte 0x00000fbd
_0800B674:
	movs r3, 0
	mov r0, r12
	ldrb r1, [r0, 0x3]
	cmp r3, r1
	bcs _0800B6CA
	ldr r0, _0800B708 @ =0x00000fbc
	add r0, r12
	ldrb r0, [r0]
	lsls r6, r0, 1
	movs r2, 0xCF
	lsls r2, 2
	add r2, r12
	mov r8, r2
	mov r10, r1
_0800B690:
	movs r2, 0
	lsls r1, r3, 4
	adds r4, r3, 0x1
	lsls r0, r3, 1
	mov r7, r9
	adds r5, r1, r7
	adds r0, r3
	lsls r0, 3
	adds r0, r3
	lsls r3, r0, 5
_0800B6A4:
	lsls r1, r2, 1
	adds r1, r5
	movs r7, 0x64
	adds r0, r2, 0
	muls r0, r7
	adds r0, r6, r0
	adds r0, r3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0800B6A4
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, r10
	bcc _0800B690
_0800B6CA:
	mov r2, r12
	ldr r0, _0800B70C @ =0x00000fbd
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	movs r3, 0
	strb r0, [r1]
	ldr r1, _0800B708 @ =0x00000fbc
	adds r2, r1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B6EC
	strb r3, [r2]
_0800B6EC:
	mov r2, r12
	strb r3, [r2, 0xC]
_0800B6F0:
	ldr r1, _0800B710 @ =0x04000208
	ldr r3, _0800B714 @ =gLinkSavedIme
	ldrh r0, [r3]
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B708: .4byte 0x00000fbc
_0800B70C: .4byte 0x00000fbd
_0800B710: .4byte 0x04000208
_0800B714: .4byte gLinkSavedIme
	thumb_func_end sub_800B608

	thumb_func_start LinkVSync
LinkVSync: @ 800B718
	push {r4,lr}
	ldr r3, _0800B740 @ =gLink
	ldrb r4, [r3]
	cmp r4, 0
	beq _0800B754
	ldrb r0, [r3, 0x1]
	cmp r0, 0x2
	beq _0800B74E
	cmp r0, 0x4
	bne _0800B77E
	movs r0, 0xD
	ldrsb r0, [r3, r0]
	cmp r0, 0x8
	bgt _0800B744
	ldrb r0, [r3, 0x10]
	cmp r0, 0x1
	beq _0800B74E
	movs r0, 0x1
	strb r0, [r3, 0x13]
	b _0800B77E
	.align 2, 0
_0800B740: .4byte gLink
_0800B744:
	ldrb r0, [r3, 0x13]
	cmp r0, 0x1
	beq _0800B77E
	movs r0, 0
	strb r0, [r3, 0xD]
_0800B74E:
	bl sub_800B820
	b _0800B77E
_0800B754:
	ldrb r2, [r3, 0x1]
	cmp r2, 0x4
	beq _0800B75E
	cmp r2, 0x2
	bne _0800B77E
_0800B75E:
	ldr r1, _0800B784 @ =sNumVBlanksWithoutSerialIntr
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _0800B77E
	cmp r2, 0x4
	bne _0800B776
	movs r0, 0x2
	strb r0, [r3, 0x13]
_0800B776:
	cmp r2, 0x2
	bne _0800B77E
	strb r4, [r3, 0x3]
	strb r4, [r3, 0xF]
_0800B77E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B784: .4byte sNumVBlanksWithoutSerialIntr
	thumb_func_end LinkVSync

	thumb_func_start Timer3Intr
Timer3Intr: @ 800B788
	push {lr}
	bl StopTimer
	bl sub_800B820
	pop {r0}
	bx r0
	thumb_func_end Timer3Intr

	thumb_func_start SerialCB
SerialCB: @ 800B798
	push {r4,lr}
	ldr r4, _0800B7C4 @ =gLink
	ldr r0, _0800B7C8 @ =0x04000128
	ldr r1, [r0]
	lsls r0, r1, 26
	lsrs r0, 30
	strb r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _0800B7CC
	cmp r0, 0x4
	bne _0800B7EA
	lsls r0, r1, 25
	lsrs r0, 31
	strb r0, [r4, 0x10]
	bl DoRecv
	bl DoSend
	bl SendRecvDone
	b _0800B7EA
	.align 2, 0
_0800B7C4: .4byte gLink
_0800B7C8: .4byte 0x04000128
_0800B7CC:
	bl DoHandshake
	lsls r0, 24
	cmp r0, 0
	beq _0800B7EA
	ldrb r0, [r4]
	cmp r0, 0
	beq _0800B7E6
	movs r0, 0x3
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0xD]
	b _0800B7EA
_0800B7E6:
	movs r0, 0x4
	strb r0, [r4, 0x1]
_0800B7EA:
	ldr r3, _0800B810 @ =gLink
	ldrb r0, [r3, 0xD]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r3, 0xD]
	ldr r1, _0800B814 @ =sNumVBlanksWithoutSerialIntr
	strb r2, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	bne _0800B80A
	ldr r0, _0800B818 @ =gLastRecvQueueCount
	ldr r2, _0800B81C @ =0x00000fbd
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_0800B80A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B810: .4byte gLink
_0800B814: .4byte sNumVBlanksWithoutSerialIntr
_0800B818: .4byte gLastRecvQueueCount
_0800B81C: .4byte 0x00000fbd
	thumb_func_end SerialCB

	thumb_func_start sub_800B820
sub_800B820: @ 800B820
	ldr r0, _0800B82C @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800B82C: .4byte 0x04000128
	thumb_func_end sub_800B820

	thumb_func_start DoHandshake
DoHandshake: @ 800B830
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r5, 0
	ldr r6, _0800B84C @ =0x0000ffff
	ldr r0, _0800B850 @ =gLink
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _0800B85C
	ldr r1, _0800B854 @ =0x0400012a
	ldr r2, _0800B858 @ =0x00008fff
	b _0800B860
	.align 2, 0
_0800B84C: .4byte 0x0000ffff
_0800B850: .4byte gLink
_0800B854: .4byte 0x0400012a
_0800B858: .4byte 0x00008fff
_0800B85C:
	ldr r1, _0800B8B4 @ =0x0400012a
	ldr r2, _0800B8B8 @ =0x0000b9a0
_0800B860:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0800B8BC @ =gLink + 4
	ldr r3, _0800B8C0 @ =0x04000120
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	movs r1, 0
	str r0, [r3]
	str r1, [r3, 0x4]
	strb r0, [r2, 0xA]
	movs r4, 0
	ldr r0, _0800B8C4 @ =sHandshakePlayerCount
	mov r9, r0
	mov r8, r2
	ldr r2, _0800B8C8 @ =0x00008fff
	ldr r1, _0800B8CC @ =0x0000ffff
	mov r12, r1
_0800B888:
	lsls r0, r4, 1
	add r0, r8
	ldrh r3, [r0]
	movs r0, 0x4
	negs r0, r0
	ands r0, r3
	ldr r1, _0800B8B8 @ =0x0000b9a0
	cmp r0, r1
	beq _0800B8A0
	adds r0, r3, 0
	cmp r0, r2
	bne _0800B8D0
_0800B8A0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r3, 0
	cmp r6, r0
	bls _0800B8D8
	cmp r0, 0
	beq _0800B8D8
	adds r6, r3, 0
	b _0800B8D8
	.align 2, 0
_0800B8B4: .4byte 0x0400012a
_0800B8B8: .4byte 0x0000b9a0
_0800B8BC: .4byte gLink + 4
_0800B8C0: .4byte 0x04000120
_0800B8C4: .4byte sHandshakePlayerCount
_0800B8C8: .4byte 0x00008fff
_0800B8CC: .4byte 0x0000ffff
_0800B8D0:
	cmp r0, r12
	beq _0800B8E2
	movs r5, 0
	b _0800B8E2
_0800B8D8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0800B888
_0800B8E2:
	strb r5, [r7, 0x3]
	adds r0, r5, 0
	cmp r0, 0x1
	bls _0800B912
	mov r2, r9
	ldrb r2, [r2]
	cmp r0, r2
	bne _0800B904
	ldrh r1, [r7, 0x4]
	ldr r0, _0800B900 @ =0x00008fff
	cmp r1, r0
	bne _0800B904
	movs r0, 0x1
	b _0800B91E
	.align 2, 0
_0800B900: .4byte 0x00008fff
_0800B904:
	ldrb r0, [r7, 0x3]
	cmp r0, 0x1
	bls _0800B912
	movs r0, 0x3
	ands r6, r0
	adds r0, r6, 0x1
	b _0800B914
_0800B912:
	movs r0, 0
_0800B914:
	strb r0, [r7, 0xF]
	ldrb r0, [r7, 0x3]
	mov r1, r9
	strb r0, [r1]
	movs r0, 0
_0800B91E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DoHandshake

	thumb_func_start DoRecv
DoRecv: @ 800B92C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r0, _0800B984 @ =0x04000120
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _0800B988 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r6, r0, 0
	cmp r1, 0
	bne _0800B990
	movs r4, 0
	ldr r7, _0800B98C @ =sChecksumAvailable
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	bcs _0800B97A
	adds r5, r6, 0
	ldrh r1, [r6, 0x14]
	adds r3, r7, 0
	adds r2, r6, 0
_0800B95A:
	lsls r0, r4, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _0800B96E
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800B96E
	movs r0, 0x1
	strb r0, [r5, 0x11]
_0800B96E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r2, 0x3]
	cmp r4, r0
	bcc _0800B95A
_0800B97A:
	movs r0, 0
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strb r0, [r7]
	b _0800BA30
	.align 2, 0
_0800B984: .4byte 0x04000120
_0800B988: .4byte gLink
_0800B98C: .4byte sChecksumAvailable
_0800B990:
	ldr r2, _0800BA00 @ =0x00000fbc
	adds r1, r6, r2
	adds r2, 0x1
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	adds r0, r2, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800B9AC
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800B9AC:
	cmp r2, 0x31
	bhi _0800BA08
	movs r4, 0
	ldrb r1, [r6, 0x3]
	cmp r4, r1
	bcs _0800BA0C
	adds r5, r6, 0
	ldr r7, _0800BA04 @ =sRecvNonzeroCheck
	lsls r0, 1
	mov r12, r0
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r6
	mov r8, r2
_0800B9C8:
	lsls r1, r4, 1
	mov r2, sp
	adds r0, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r5, 0x14]
	adds r0, r3, r2
	strh r0, [r5, 0x14]
	ldrh r0, [r7]
	orrs r0, r3
	strh r0, [r7]
	ldrb r2, [r5, 0x17]
	movs r0, 0x64
	muls r0, r2
	add r0, r12
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 5
	adds r0, r1
	add r0, r8
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	bcc _0800B9C8
	b _0800BA0C
	.align 2, 0
_0800BA00: .4byte 0x00000fbc
_0800BA04: .4byte sRecvNonzeroCheck
_0800BA08:
	movs r0, 0x2
	strb r0, [r6, 0x12]
_0800BA0C:
	ldrb r0, [r6, 0x17]
	adds r0, 0x1
	strb r0, [r6, 0x17]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _0800BA30
	ldr r2, _0800BA3C @ =sRecvNonzeroCheck
	ldrh r0, [r2]
	cmp r0, 0
	beq _0800BA30
	ldr r1, _0800BA40 @ =0x00000fbd
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0
	strh r0, [r2]
_0800BA30:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA3C: .4byte sRecvNonzeroCheck
_0800BA40: .4byte 0x00000fbd
	thumb_func_end DoRecv

	thumb_func_start DoSend
DoSend: @ 800BA44
	push {r4,lr}
	ldr r0, _0800BA80 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r4, r0, 0
	cmp r1, 0x8
	bne _0800BA96
	ldr r1, _0800BA84 @ =0x0400012a
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	ldr r1, _0800BA88 @ =sSendBufferEmpty
	ldrb r2, [r1]
	cmp r2, 0
	bne _0800BA90
	ldr r0, _0800BA8C @ =0x00000339
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r0, 0xCE
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800BAEC
	strb r2, [r1]
	b _0800BAEC
	.align 2, 0
_0800BA80: .4byte gLink
_0800BA84: .4byte 0x0400012a
_0800BA88: .4byte sSendBufferEmpty
_0800BA8C: .4byte 0x00000339
_0800BA90:
	movs r0, 0
	strb r0, [r1]
	b _0800BAEC
_0800BA96:
	ldr r1, _0800BABC @ =sSendBufferEmpty
	ldrb r0, [r1]
	cmp r0, 0
	bne _0800BAB2
	ldr r2, _0800BAC0 @ =0x00000339
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800BAAC
	movs r0, 0x1
	strb r0, [r1]
_0800BAAC:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BAC8
_0800BAB2:
	ldr r1, _0800BAC4 @ =0x0400012a
	movs r0, 0
	strh r0, [r1]
	b _0800BAE6
	.align 2, 0
_0800BABC: .4byte sSendBufferEmpty
_0800BAC0: .4byte 0x00000339
_0800BAC4: .4byte 0x0400012a
_0800BAC8:
	ldr r3, _0800BAF4 @ =0x0400012a
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r2, [r4, 0x16]
	movs r1, 0x64
	muls r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_0800BAE6:
	ldrb r0, [r4, 0x16]
	adds r0, 0x1
	strb r0, [r4, 0x16]
_0800BAEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAF4: .4byte 0x0400012a
	thumb_func_end DoSend

	thumb_func_start StopTimer
StopTimer: @ 800BAF8
	push {lr}
	ldr r0, _0800BB18 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800BB14
	ldr r2, _0800BB1C @ =0x0400010e
	ldrh r1, [r2]
	ldr r0, _0800BB20 @ =0x0000ff7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0800BB24 @ =0x0400010c
	ldr r2, _0800BB28 @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
_0800BB14:
	pop {r0}
	bx r0
	.align 2, 0
_0800BB18: .4byte gLink
_0800BB1C: .4byte 0x0400010e
_0800BB20: .4byte 0x0000ff7f
_0800BB24: .4byte 0x0400010c
_0800BB28: .4byte 0x0000ff3b
	thumb_func_end StopTimer

	thumb_func_start SendRecvDone
SendRecvDone: @ 800BB2C
	push {lr}
	ldr r1, _0800BB40 @ =gLink
	ldrb r0, [r1, 0x17]
	cmp r0, 0x8
	bne _0800BB44
	movs r0, 0
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	b _0800BB54
	.align 2, 0
_0800BB40: .4byte gLink
_0800BB44:
	ldrb r0, [r1]
	cmp r0, 0
	beq _0800BB54
	ldr r0, _0800BB58 @ =0x0400010e
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_0800BB54:
	pop {r0}
	bx r0
	.align 2, 0
_0800BB58: .4byte 0x0400010e
	thumb_func_end SendRecvDone

	thumb_func_start ResetSendBuffer
ResetSendBuffer: @ 800BB5C
	push {r4-r6,lr}
	ldr r1, _0800BBA4 @ =gLink
	ldr r2, _0800BBA8 @ =0x00000339
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	movs r3, 0xCE
	lsls r3, 2
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0
	movs r6, 0x64
	adds r5, r1, 0
	adds r5, 0x18
	ldr r4, _0800BBAC @ =0x0000efff
_0800BB7A:
	movs r2, 0
	adds r1, r0, 0x1
	adds r3, r0, 0
	muls r3, r6
_0800BB82:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BB82
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0800BB7A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BBA4: .4byte gLink
_0800BBA8: .4byte 0x00000339
_0800BBAC: .4byte 0x0000efff
	thumb_func_end ResetSendBuffer

	thumb_func_start ResetRecvBuffer
ResetRecvBuffer: @ 800BBB0
	push {r4-r7,lr}
	ldr r1, _0800BC10 @ =gLink
	ldr r2, _0800BC14 @ =0x00000fbd
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _0800BC18 @ =0x00000fbc
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0x64
	mov r12, r0
	movs r3, 0xCF
	lsls r3, 2
	adds r7, r1, r3
	ldr r6, _0800BC1C @ =0x0000efff
_0800BBCE:
	movs r3, 0
	lsls r0, r2, 1
	adds r5, r2, 0x1
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r4, r0, 5
_0800BBDC:
	movs r2, 0
	adds r1, r3, 0x1
	mov r0, r12
	muls r0, r3
	adds r3, r0, 0
_0800BBE6:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r4
	adds r0, r7
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _0800BBE6
	lsls r0, r1, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _0800BBDC
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800BBCE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BC10: .4byte gLink
_0800BC14: .4byte 0x00000fbd
_0800BC18: .4byte 0x00000fbc
_0800BC1C: .4byte 0x0000efff
	thumb_func_end ResetRecvBuffer

	.align 2, 0 @ Don't pad with nop.
