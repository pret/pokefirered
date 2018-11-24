	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_812C334
sub_812C334: @ 812C334
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r3, _0812C35C @ =gLinkPlayers
	ldr r4, _0812C360 @ =gBattleStruct
	ldr r0, [r4]
	adds r0, 0xB5
	ldrb r2, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x18]
	movs r0, 0x2
	movs r5, 0
	eors r2, r0
_0812C352:
	ldrh r0, [r3, 0x18]
	cmp r2, r0
	bne _0812C364
	str r5, [r6]
	b _0812C370
	.align 2, 0
_0812C35C: .4byte gLinkPlayers
_0812C360: .4byte gBattleStruct
_0812C364:
	ldr r0, [r4]
	adds r0, 0xB5
	ldrb r0, [r0]
	cmp r5, r0
	beq _0812C370
	stm r1!, {r5}
_0812C370:
	adds r3, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _0812C352
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812C334

	.align 2, 0 @ Don't pad with nop.
