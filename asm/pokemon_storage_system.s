	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_808B9C0
sub_808B9C0: @ 808B9C0
	push {lr}
	ldr r1, _0808B9D0 @ =gPokemonStoragePtr
	ldr r1, [r1]
	ldr r2, _0808B9D4 @ =0x000083d0
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_0808B9D0: .4byte gPokemonStoragePtr
_0808B9D4: .4byte 0x000083d0
	thumb_func_end sub_808B9C0

	thumb_func_start sub_808B9D8
sub_808B9D8: @ 808B9D8
	push {lr}
	adds r1, r0, 0
	ldr r0, _0808B9EC @ =gPokemonStoragePtr
	ldr r0, [r0]
	ldr r2, _0808B9F0 @ =0x000083d0
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_0808B9EC: .4byte gPokemonStoragePtr
_0808B9F0: .4byte 0x000083d0
	thumb_func_end sub_808B9D8

	thumb_func_start StorageGetCurrentBox
StorageGetCurrentBox: @ 808B9F4
	ldr r0, _0808B9FC @ =gPokemonStoragePtr
	ldr r0, [r0]
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0808B9FC: .4byte gPokemonStoragePtr
	thumb_func_end StorageGetCurrentBox

	thumb_func_start sub_808BA00
sub_808BA00: @ 808BA00
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xD
	bhi _0808BA10
	ldr r0, _0808BA14 @ =gPokemonStoragePtr
	ldr r0, [r0]
	strb r1, [r0]
_0808BA10:
	pop {r0}
	bx r0
	.align 2, 0
_0808BA14: .4byte gPokemonStoragePtr
	thumb_func_end sub_808BA00

	thumb_func_start GetBoxMonDataFromAnyBox
GetBoxMonDataFromAnyBox: @ 808BA18
	push {r4,r5,lr}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BA54
	cmp r4, 0x1D
	bhi _0808BA54
	ldr r2, _0808BA50 @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	adds r1, r5, 0
	bl GetBoxMonData
	b _0808BA56
	.align 2, 0
_0808BA50: .4byte gPokemonStoragePtr
_0808BA54:
	movs r0, 0
_0808BA56:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonDataFromAnyBox

	thumb_func_start SetBoxMonDataFromAnyBox
SetBoxMonDataFromAnyBox: @ 808BA5C
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BA94
	cmp r4, 0x1D
	bhi _0808BA94
	ldr r2, _0808BA9C @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetBoxMonData
_0808BA94:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BA9C: .4byte gPokemonStoragePtr
	thumb_func_end SetBoxMonDataFromAnyBox

	thumb_func_start GetBoxMonDataFromSelectedBox
GetBoxMonDataFromSelectedBox: @ 808BAA0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0808BABC @ =gPokemonStoragePtr
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r1, r3, 0
	bl GetBoxMonDataFromAnyBox
	pop {r1}
	bx r1
	.align 2, 0
_0808BABC: .4byte gPokemonStoragePtr
	thumb_func_end GetBoxMonDataFromSelectedBox

	thumb_func_start SetBoxMonDataFromSelectedBox
SetBoxMonDataFromSelectedBox: @ 808BAC0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0808BAE0 @ =gPokemonStoragePtr
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetBoxMonDataFromAnyBox
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BAE0: .4byte gPokemonStoragePtr
	thumb_func_end SetBoxMonDataFromSelectedBox

	thumb_func_start GetBoxMonNickFromAnyBox
GetBoxMonNickFromAnyBox: @ 808BAE4
	push {r4,r5,lr}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BB20
	cmp r4, 0x1D
	bhi _0808BB20
	ldr r2, _0808BB1C @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	movs r1, 0x2
	adds r2, r5, 0
	bl GetBoxMonData
	b _0808BB24
	.align 2, 0
_0808BB1C: .4byte gPokemonStoragePtr
_0808BB20:
	movs r0, 0xFF
	strb r0, [r5]
_0808BB24:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetBoxMonNickFromAnyBox

	thumb_func_start SetBoxMonNickFromAnyBox
SetBoxMonNickFromAnyBox: @ 808BB2C
	push {r4,r5,lr}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BB62
	cmp r4, 0x1D
	bhi _0808BB62
	ldr r2, _0808BB68 @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	movs r1, 0x2
	adds r2, r5, 0
	bl SetBoxMonData
_0808BB62:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BB68: .4byte gPokemonStoragePtr
	thumb_func_end SetBoxMonNickFromAnyBox

	thumb_func_start GetAndCopyBoxMonDataFromAnyBox
GetAndCopyBoxMonDataFromAnyBox: @ 808BB6C
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BBAC
	cmp r4, 0x1D
	bhi _0808BBAC
	ldr r2, _0808BBA8 @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	adds r1, r5, 0
	adds r2, r6, 0
	bl GetBoxMonData
	b _0808BBAE
	.align 2, 0
_0808BBA8: .4byte gPokemonStoragePtr
_0808BBAC:
	movs r0, 0
_0808BBAE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetAndCopyBoxMonDataFromAnyBox

	thumb_func_start CopyBoxMonFromAnyBox
CopyBoxMonFromAnyBox: @ 808BBB4
	push {r4,r5,lr}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r4, 0xD
	bhi _0808BBEA
	cmp r1, 0x1D
	bhi _0808BBEA
	ldr r0, _0808BBF0 @ =gPokemonStoragePtr
	ldr r0, [r0]
	lsls r3, r1, 2
	adds r3, r1
	lsls r3, 4
	lsls r2, r4, 2
	adds r2, r4
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 5
	adds r3, r1
	adds r0, r3
	adds r0, 0x4
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
_0808BBEA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BBF0: .4byte gPokemonStoragePtr
	thumb_func_end CopyBoxMonFromAnyBox

	thumb_func_start sub_808BBF4
sub_808BBF4: @ 808BBF4
	push {r4,r5,lr}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r4, 0xD
	bhi _0808BC2A
	cmp r2, 0x1D
	bhi _0808BC2A
	ldr r0, _0808BC30 @ =gPokemonStoragePtr
	ldr r1, [r0]
	lsls r3, r2, 2
	adds r3, r2
	lsls r3, 4
	lsls r2, r4, 2
	adds r2, r4
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 5
	adds r3, r0
	adds r1, r3
	adds r1, 0x4
	adds r0, r5, 0
	movs r2, 0x50
	bl memcpy
_0808BC2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BC30: .4byte gPokemonStoragePtr
	thumb_func_end sub_808BBF4

	thumb_func_start sub_808BC34
sub_808BC34: @ 808BC34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r4, [sp, 0x30]
	ldr r5, [sp, 0x34]
	ldr r6, [sp, 0x3C]
	mov r12, r6
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r0, r12
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r7, 0xD
	bhi _0808BCA0
	cmp r6, 0x1D
	bhi _0808BCA0
	ldr r2, _0808BCB0 @ =gPokemonStoragePtr
	lsls r0, r7, 2
	adds r0, r7
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 4
	adds r0, r1
	str r5, [sp]
	ldr r1, [sp, 0x38]
	str r1, [sp, 0x4]
	str r3, [sp, 0x8]
	ldr r1, [sp, 0x40]
	str r1, [sp, 0xC]
	mov r1, r9
	mov r2, r8
	adds r3, r4, 0
	bl CreateBoxMon
_0808BCA0:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BCB0: .4byte gPokemonStoragePtr
	thumb_func_end sub_808BC34

	thumb_func_start sub_808BCB4
sub_808BCB4: @ 808BCB4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BCE4
	cmp r4, 0x1D
	bhi _0808BCE4
	ldr r2, _0808BCEC @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	bl ZeroBoxMonData
_0808BCE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808BCEC: .4byte gPokemonStoragePtr
	thumb_func_end sub_808BCB4

	thumb_func_start sub_808BCF0
sub_808BCF0: @ 808BCF0
	push {r4,r5,lr}
	adds r5, r2, 0
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BD24
	cmp r4, 0x1D
	bhi _0808BD24
	ldr r2, _0808BD2C @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	adds r1, r5, 0
	bl BoxMonToMon
_0808BD24:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BD2C: .4byte gPokemonStoragePtr
	thumb_func_end sub_808BCF0

	thumb_func_start GetBoxedMonPtr
GetBoxedMonPtr: @ 808BD30
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r3, 0xD
	bhi _0808BD64
	cmp r4, 0x1D
	bhi _0808BD64
	ldr r2, _0808BD60 @ =gPokemonStoragePtr
	lsls r0, r3, 2
	adds r0, r3
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	adds r1, 0x4
	ldr r0, [r2]
	adds r0, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	adds r0, r1
	b _0808BD66
	.align 2, 0
_0808BD60: .4byte gPokemonStoragePtr
_0808BD64:
	movs r0, 0
_0808BD66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBoxedMonPtr

	thumb_func_start GetBoxNamePtr
GetBoxNamePtr: @ 808BD6C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xD
	bls _0808BD7A
	movs r0, 0
	b _0808BD88
_0808BD7A:
	ldr r0, _0808BD8C @ =gPokemonStoragePtr
	lsls r1, r2, 3
	adds r1, r2
	ldr r2, _0808BD90 @ =0x00008344
	adds r1, r2
	ldr r0, [r0]
	adds r0, r1
_0808BD88:
	pop {r1}
	bx r1
	.align 2, 0
_0808BD8C: .4byte gPokemonStoragePtr
_0808BD90: .4byte 0x00008344
	thumb_func_end GetBoxNamePtr

	thumb_func_start sub_808BD94
sub_808BD94: @ 808BD94
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xD
	bls _0808BDA2
	movs r0, 0
	b _0808BDAE
_0808BDA2:
	ldr r0, _0808BDB4 @ =gPokemonStoragePtr
	ldr r0, [r0]
	ldr r2, _0808BDB8 @ =0x000083c2
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
_0808BDAE:
	pop {r1}
	bx r1
	.align 2, 0
_0808BDB4: .4byte gPokemonStoragePtr
_0808BDB8: .4byte 0x000083c2
	thumb_func_end sub_808BD94

	thumb_func_start sub_808BDBC
sub_808BDBC: @ 808BDBC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r2, 0xD
	bhi _0808BDDA
	cmp r1, 0xF
	bhi _0808BDDA
	ldr r0, _0808BDE0 @ =gPokemonStoragePtr
	ldr r0, [r0]
	ldr r3, _0808BDE4 @ =0x000083c2
	adds r0, r3
	adds r0, r2
	strb r1, [r0]
_0808BDDA:
	pop {r0}
	bx r0
	.align 2, 0
_0808BDE0: .4byte gPokemonStoragePtr
_0808BDE4: .4byte 0x000083c2
	thumb_func_end sub_808BDBC

	thumb_func_start sub_808BDE8
sub_808BDE8: @ 808BDE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	adds r4, r3, 0
	ldr r2, _0808BE4C @ =0x0000ffff
	cmp r3, 0x1
	bhi _0808BE0A
	movs r2, 0x1
	cmp r3, 0x1
	beq _0808BE0E
_0808BE0A:
	cmp r4, 0x3
	bne _0808BE58
_0808BE0E:
	lsls r0, 24
	asrs r0, 24
	lsls r2, 16
	asrs r1, r2, 16
	adds r1, r0
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r6, r2, 0
	cmp r1, 0
	blt _0808BEA4
	cmp r1, r7
	bgt _0808BEA4
_0808BE26:
	asrs r4, r0, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	add r0, r8
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _0808BE50
	asrs r0, r6, 16
	adds r0, r4, r0
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _0808BEA4
	cmp r2, r7
	ble _0808BE26
	b _0808BEA4
	.align 2, 0
_0808BE4C: .4byte 0x0000ffff
_0808BE50:
	adds r0, r4, 0
	b _0808BEA8
_0808BE54:
	adds r0, r5, 0
	b _0808BEA8
_0808BE58:
	lsls r0, 24
	asrs r0, 24
	lsls r2, 16
	asrs r1, r2, 16
	adds r1, r0
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r6, r2, 0
	cmp r1, 0
	blt _0808BEA4
	cmp r1, r7
	bgt _0808BEA4
_0808BE70:
	asrs r5, r0, 16
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _0808BE94
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	beq _0808BE54
_0808BE94:
	asrs r0, r6, 16
	adds r0, r5, r0
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _0808BEA4
	cmp r2, r7
	ble _0808BE70
_0808BEA4:
	movs r0, 0x1
	negs r0, r0
_0808BEA8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_808BDE8

	thumb_func_start sub_808BEB4
sub_808BEB4: @ 808BEB4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	str r0, [sp, 0x24]
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x28]
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	movs r0, 0
	movs r1, 0
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	ldr r1, _0808BF30 @ =0x00ffffff
	ldr r0, [sp, 0x1C]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 21
	orrs r0, r1
	str r0, [sp, 0x1C]
	ldr r1, _0808BF34 @ =0xffffff00
	add r5, sp, 0x1C
	ldr r0, [r5, 0x4]
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	str r0, [r5, 0x4]
	adds r0, r5, 0
	bl AddWindow
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r4, r0, 24
	lsrs r4, 24
	mov r0, r9
	lsls r1, r0, 4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	movs r1, 0x7
	bl GetWindowAttribute
	adds r6, r0, 0
	ldrb r0, [r5, 0x3]
	lsls r0, 5
	adds r0, r6
	mov r8, r0
	ldr r1, [sp, 0x28]
	cmp r1, 0
	bne _0808BF38
	add r0, sp, 0x14
	b _0808BF3C
	.align 2, 0
_0808BF30: .4byte 0x00ffffff
_0808BF34: .4byte 0xffffff00
_0808BF38:
	add r0, sp, 0x14
	mov r1, r9
_0808BF3C:
	strb r1, [r0]
	add r1, sp, 0x14
	movs r2, 0
	movs r0, 0xF
	strb r0, [r1, 0x1]
	movs r0, 0xE
	strb r0, [r1, 0x2]
	mov r0, r10
	lsls r4, r0, 24
	lsrs r0, r4, 24
	str r2, [sp]
	str r2, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp, 0xC]
	ldr r1, [sp, 0x24]
	str r1, [sp, 0x10]
	movs r1, 0x1
	movs r3, 0x2
	bl AddTextPrinterParameterized4
	ldr r0, [sp, 0x50]
	mov r10, r4
	cmp r0, 0x6
	ble _0808BF72
	movs r0, 0x6
_0808BF72:
	ldr r4, [sp, 0x50]
	subs r4, 0x6
	cmp r0, 0
	ble _0808BFA4
	adds r5, r0, 0
_0808BF7C:
	adds r0, r6, 0
	adds r1, r7, 0
	movs r2, 0x40
	bl CpuSet
	adds r1, r7, 0
	adds r1, 0x80
	mov r0, r8
	movs r2, 0x40
	bl CpuSet
	adds r6, 0x80
	movs r2, 0x80
	add r8, r2
	movs r0, 0x80
	lsls r0, 1
	adds r7, r0
	subs r5, 0x1
	cmp r5, 0
	bne _0808BF7C
_0808BFA4:
	cmp r4, 0
	ble _0808BFC4
	add r0, sp, 0x18
	mov r2, r9
	lsls r1, r2, 4
	orrs r1, r2
	strh r1, [r0]
	lsls r2, r4, 7
	ldr r1, _0808BFDC @ =0x001fffff
	ands r2, r1
	movs r1, 0x80
	lsls r1, 17
	orrs r2, r1
	adds r1, r7, 0
	bl CpuSet
_0808BFC4:
	mov r1, r10
	lsrs r0, r1, 24
	bl RemoveWindow
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BFDC: .4byte 0x001fffff
	thumb_func_end sub_808BEB4

	thumb_func_start sub_808BFE0
sub_808BFE0: @ 808BFE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	adds r6, r3, 0
	ldr r0, [sp, 0x4C]
	mov r9, r0
	ldr r1, [sp, 0x50]
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x28]
	lsls r6, 24
	lsrs r6, 24
	mov r2, r9
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	movs r1, 0
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	bl StringLength_Multibyte
	lsls r0, 24
	ldr r2, _0808C0CC @ =0x00ffffff
	ldr r1, [sp, 0x18]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, 0x18]
	ldr r1, _0808C0D0 @ =0xffffff00
	add r2, sp, 0x18
	mov r8, r2
	ldr r0, [r2, 0x4]
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	str r0, [r2, 0x4]
	ldr r5, [sp, 0x18]
	lsrs r5, 24
	lsls r5, 5
	mov r0, r8
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r6, 4
	orrs r1, r6
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FillWindowPixelBuffer
	adds r0, r4, 0
	movs r1, 0x7
	bl GetWindowAttribute
	adds r7, r0, 0
	mov r0, r8
	ldrb r0, [r0, 0x3]
	lsls r0, 5
	mov r8, r0
	add r8, r7
	add r0, sp, 0x14
	movs r1, 0
	strb r6, [r0]
	mov r2, r9
	strb r2, [r0, 0x1]
	mov r2, r10
	strb r2, [r0, 0x2]
	str r1, [sp]
	str r1, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x1
	negs r0, r0
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x20]
	str r0, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x2
	bl AddTextPrinterParameterized4
	lsrs r5, 1
	adds r0, r7, 0
	ldr r1, [sp, 0x24]
	adds r2, r5, 0
	bl CpuSet
	ldr r2, [sp, 0x24]
	ldr r0, [sp, 0x28]
	adds r1, r2, r0
	mov r0, r8
	adds r2, r5, 0
	bl CpuSet
	adds r0, r4, 0
	bl RemoveWindow
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C0CC: .4byte 0x00ffffff
_0808C0D0: .4byte 0xffffff00
	thumb_func_end sub_808BFE0

	thumb_func_start CountMonsInBox
CountMonsInBox: @ 808C0D4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	movs r5, 0
_0808C0DE:
	lsls r1, r4, 24
	lsrs r1, 24
	adds r0, r6, 0
	movs r2, 0xB
	bl GetBoxMonDataFromAnyBox
	cmp r0, 0
	beq _0808C0F4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0808C0F4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0808C0DE
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CountMonsInBox

	thumb_func_start GetFirstFreeBoxSpot
GetFirstFreeBoxSpot: @ 808C108
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
_0808C110:
	lsls r1, r4, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0xB
	bl GetBoxMonDataFromAnyBox
	cmp r0, 0
	bne _0808C126
	lsls r0, r4, 16
	asrs r0, 16
	b _0808C134
_0808C126:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0808C110
	movs r0, 0x1
	negs r0, r0
_0808C134:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetFirstFreeBoxSpot

	thumb_func_start CountPartyNonEggMons
CountPartyNonEggMons: @ 808C13C
	push {r4-r6,lr}
	movs r5, 0
	movs r6, 0
_0808C142:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808C180 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808C16A
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808C16A
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_0808C16A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0808C142
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808C180: .4byte gPlayerParty
	thumb_func_end CountPartyNonEggMons

	thumb_func_start CountPartyAliveNonEggMonsExcept
CountPartyAliveNonEggMonsExcept: @ 808C184
	push {r4-r7,lr}
	lsls r0, 24
	movs r5, 0
	movs r6, 0
	lsrs r7, r0, 24
_0808C18E:
	cmp r5, r7
	beq _0808C1C6
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808C1DC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808C1C6
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808C1C6
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0808C1C6
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_0808C1C6:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0808C18E
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808C1DC: .4byte gPlayerParty
	thumb_func_end CountPartyAliveNonEggMonsExcept

	thumb_func_start CountPartyAliveNonEggMons_IgnoreVar0x8004Slot
CountPartyAliveNonEggMons_IgnoreVar0x8004Slot: @ 808C1E0
	push {lr}
	ldr r0, _0808C1F4 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl CountPartyAliveNonEggMonsExcept
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0808C1F4: .4byte gSpecialVar_0x8004
	thumb_func_end CountPartyAliveNonEggMons_IgnoreVar0x8004Slot

	thumb_func_start CountPartyMons
CountPartyMons: @ 808C1F8
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_0808C1FE:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0808C22C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808C216
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0808C216:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x5
	bls _0808C1FE
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C22C: .4byte gPlayerParty
	thumb_func_end CountPartyMons

	thumb_func_start StringCopyAndFillWithSpaces
StringCopyAndFillWithSpaces: @ 808C230
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r2, 16
	lsrs r4, 16
	bl StringCopy
	adds r1, r0, 0
	adds r5, r4
	cmp r1, r5
	bcs _0808C24E
	movs r0, 0
_0808C246:
	strb r0, [r1]
	adds r1, 0x1
	cmp r1, r5
	bcc _0808C246
_0808C24E:
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringCopyAndFillWithSpaces

	thumb_func_start sub_808C25C
sub_808C25C: @ 808C25C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	adds r7, r3, 0
	ldr r5, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	ldr r0, [sp, 0x24]
	mov r9, r0
	ldr r0, [sp, 0x28]
	ldr r3, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	mov r0, r9
	lsls r0, 17
	mov r9, r0
	lsrs r2, 11
	adds r2, r1
	lsls r2, 1
	adds r6, r2
	adds r0, r4, 0
	muls r0, r3
	adds r0, r5
	lsls r0, 1
	adds r7, r0
	movs r4, 0
	cmp r4, r8
	bcs _0808C2CC
	mov r0, r9
	lsrs r0, 1
	mov r9, r0
	lsls r5, r3, 1
_0808C2B2:
	adds r0, r7, 0
	adds r1, r6, 0
	mov r3, r9
	lsrs r2, r3, 16
	bl CpuSet
	adds r6, 0x40
	adds r7, r5
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bcc _0808C2B2
_0808C2CC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808C25C

	thumb_func_start sub_808C2D8
sub_808C2D8: @ 808C2D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [sp, 0x28]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsrs r2, 11
	adds r2, r1
	lsls r2, 1
	adds r4, r2
	lsls r3, 17
	lsrs r0, r3, 16
	str r0, [sp, 0x4]
	movs r0, 0
	cmp r0, r10
	bcs _0808C382
	movs r6, 0x80
	lsls r6, 5
	mov r5, sp
	ldr r7, _0808C344 @ =0x040000d4
	lsrs r3, 17
	mov r9, r3
	mov r1, r9
	movs r2, 0x81
	lsls r2, 24
	orrs r1, r2
	mov r9, r1
_0808C31E:
	adds r3, r4, 0
	ldr r2, [sp, 0x4]
	movs r1, 0x40
	adds r1, r4
	mov r8, r1
	adds r0, 0x1
	mov r12, r0
	cmp r2, r6
	bhi _0808C348
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	str r2, [r7]
	str r4, [r7, 0x4]
	mov r0, r9
	str r0, [r7, 0x8]
	ldr r0, [r7, 0x8]
	b _0808C376
	.align 2, 0
_0808C344: .4byte 0x040000d4
_0808C348:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _0808C394 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	ldr r0, _0808C398 @ =0x81000800
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r6
	subs r2, r6
	cmp r2, r6
	bhi _0808C348
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r2, 1
	movs r2, 0x81
	lsls r2, 24
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0808C376:
	mov r4, r8
	mov r1, r12
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, r10
	bcc _0808C31E
_0808C382:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C394: .4byte 0x040000d4
_0808C398: .4byte 0x81000800
	thumb_func_end sub_808C2D8

	thumb_func_start c3_0808C39C
c3_0808C39C: @ 808C39C
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0808C3C4 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _0808C3B8
	b _0808C69C
_0808C3B8:
	lsls r0, 2
	ldr r1, _0808C3C8 @ =_0808C3CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808C3C4: .4byte gTasks
_0808C3C8: .4byte _0808C3CC
	.align 2, 0
_0808C3CC:
	.4byte _0808C3E0
	.4byte _0808C448
	.4byte _0808C45C
	.4byte _0808C5A6
	.4byte _0808C680
_0808C3E0:
	movs r0, 0x1C
	bl HelpSystem_SetSomeVariable2
	ldrb r0, [r5, 0xA]
	adds r1, r5, 0
	adds r1, 0x26
	bl sub_808C72C
	bl sub_80F6E9C
	movs r0, 0
	movs r1, 0
	bl DrawDialogueFrame
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r1, _0808C444 @ =gUnknown_83CDA20
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0xFF
	bl AddTextPrinterParameterized2
	movs r0, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl CopyWindowToVram
	b _0808C454
	.align 2, 0
_0808C444: .4byte gUnknown_83CDA20
_0808C448:
	bl sub_807AA70
	lsls r0, 24
	cmp r0, 0
	bne _0808C454
	b _0808C69C
_0808C454:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _0808C69C
_0808C45C:
	bl ProcessMenuInput
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xC]
	movs r3, 0xC
	ldrsh r1, [r5, r3]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0808C50C
	cmp r1, r0
	bgt _0808C47E
	subs r0, 0x1
	cmp r1, r0
	beq _0808C484
	b _0808C530
_0808C47E:
	cmp r1, 0x4
	beq _0808C50C
	b _0808C530
_0808C484:
	ldrh r3, [r5, 0xA]
	strh r3, [r5, 0xE]
	ldr r2, _0808C504 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0808C4A2
	subs r0, r3, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bge _0808C4A2
	movs r0, 0x4
	strh r0, [r5, 0xE]
_0808C4A2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0808C4BE
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0808C4BE
	movs r0, 0
	strh r0, [r5, 0xE]
_0808C4BE:
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r2, [r5, 0xE]
	movs r3, 0xE
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bne _0808C4CE
	b _0808C69C
_0808C4CE:
	movs r4, 0
	strh r2, [r5, 0xA]
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r1, _0808C508 @ =gUnknown_83CDA20
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r2, [r0]
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	b _0808C69C
	.align 2, 0
_0808C504: .4byte gMain
_0808C508: .4byte gUnknown_83CDA20
_0808C50C:
	movs r0, 0
	movs r1, 0x1
	bl ClearStdWindowAndFrame
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl ClearStdWindowAndFrame
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	b _0808C69C
_0808C530:
	movs r3, 0xC
	ldrsh r4, [r5, r3]
	cmp r4, 0
	bne _0808C564
	bl CountPartyMons
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0808C564
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0808C560 @ =gUnknown_84186B0
	str r4, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r4, 0x3
	str r4, [sp, 0xC]
	b _0808C66E
	.align 2, 0
_0808C560: .4byte gUnknown_84186B0
_0808C564:
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _0808C598
	bl CountPartyMons
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _0808C598
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, _0808C594 @ =gUnknown_8418690
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r4, 0x3
	str r4, [sp, 0xC]
	b _0808C66E
	.align 2, 0
_0808C594: .4byte gUnknown_8418690
_0808C598:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _0808C69C
_0808C5A6:
	ldr r0, _0808C5D0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r7, 0x3
	adds r4, r7, 0
	ands r4, r1
	cmp r4, 0
	beq _0808C5D8
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r1, _0808C5D4 @ =gUnknown_83CDA20
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0
	str r0, [sp]
	b _0808C664
	.align 2, 0
_0808C5D0: .4byte gMain
_0808C5D4: .4byte gUnknown_83CDA20
_0808C5D8:
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _0808C624
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0808C5F4
	movs r0, 0x4
	strh r0, [r5, 0xA]
_0808C5F4:
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r1, _0808C620 @ =gUnknown_83CDA20
	movs r3, 0xA
	ldrsh r0, [r5, r3]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r2, [r0]
	str r4, [sp]
	b _0808C664
	.align 2, 0
_0808C620: .4byte gUnknown_83CDA20
_0808C624:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0808C69C
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0808C63C
	strh r6, [r5, 0xA]
_0808C63C:
	movs r0, 0x1
	bl MoveMenuCursor
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r1, _0808C67C @ =gUnknown_83CDA20
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r2, [r0]
	str r6, [sp]
_0808C664:
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	str r7, [sp, 0xC]
_0808C66E:
	movs r0, 0
	movs r1, 0x2
	movs r3, 0
	bl AddTextPrinterParameterized2
	strh r4, [r5, 0x8]
	b _0808C69C
	.align 2, 0
_0808C67C: .4byte gUnknown_83CDA20
_0808C680:
	ldr r0, _0808C6A4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808C69C
	bl CleanupOverworldWindowsAndTilemaps
	ldrb r0, [r5, 0xC]
	bl sub_808CDE4
	adds r0, r4, 0
	bl DestroyTask
_0808C69C:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C6A4: .4byte gPaletteFade
	thumb_func_end c3_0808C39C

	thumb_func_start sub_808C6A8
sub_808C6A8: @ 808C6A8
	push {lr}
	ldr r0, _0808C6D0 @ =c3_0808C39C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0808C6D4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0808C6D0: .4byte c3_0808C39C
_0808C6D4: .4byte gTasks
	thumb_func_end sub_808C6A8

	thumb_func_start mapldr_0808C6D8
mapldr_0808C6D8: @ 808C6D8
	push {r4,r5,lr}
	ldr r0, _0808C71C @ =gMain
	ldr r5, [r0, 0xC]
	movs r0, 0
	bl SetVBlankCallback
	ldr r4, _0808C720 @ =c3_0808C39C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0808C724 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	ldr r2, _0808C728 @ =gUnknown_20397A8
	ldrb r2, [r2]
	strh r2, [r1, 0xA]
	bl _call_via_r4
	adds r0, r5, 0
	bl SetVBlankCallback
	bl sub_807DC00
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808C71C: .4byte gMain
_0808C720: .4byte c3_0808C39C
_0808C724: .4byte gTasks
_0808C728: .4byte gUnknown_20397A8
	thumb_func_end mapldr_0808C6D8

	thumb_func_start sub_808C72C
sub_808C72C: @ 808C72C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	adds r6, r0, 0
	mov r10, r1
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0808C7AC @ =gUnknown_83CDA48
	bl AddWindow
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, r5, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl DrawStdWindowFrame
	movs r0, 0x2
	movs r1, 0
	bl GetMenuCursorDimensionByFont
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x10
	mov r9, r0
	str r0, [sp]
	movs r0, 0x5
	mov r8, r0
	str r0, [sp, 0x4]
	ldr r0, _0808C7B0 @ =gUnknown_83CDA20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x2
	movs r3, 0x2
	bl PrintTextArray
	mov r0, r9
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	str r6, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl ProgramAndPlaceMenuCursorOnWindow
	mov r0, r10
	strh r5, [r0]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C7AC: .4byte gUnknown_83CDA48
_0808C7B0: .4byte gUnknown_83CDA20
	thumb_func_end sub_808C72C

	thumb_func_start sub_808C7B4
sub_808C7B4: @ 808C7B4
	push {lr}
	bl sub_808FDF0
	ldr r1, _0808C7D0 @ =gUnknown_20397A8
	strb r0, [r1]
	ldr r1, _0808C7D4 @ =gFieldCallback
	ldr r0, _0808C7D8 @ =mapldr_0808C6D8
	str r0, [r1]
	ldr r0, _0808C7DC @ =CB2_ReturnToField
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808C7D0: .4byte gUnknown_20397A8
_0808C7D4: .4byte gFieldCallback
_0808C7D8: .4byte mapldr_0808C6D8
_0808C7DC: .4byte CB2_ReturnToField
	thumb_func_end sub_808C7B4

	thumb_func_start sub_808C7E0
sub_808C7E0: @ 808C7E0
	push {r4-r6,lr}
	movs r0, 0
	bl sub_808BA00
	movs r5, 0
_0808C7EA:
	movs r4, 0
	lsls r6, r5, 24
_0808C7EE:
	lsls r1, r4, 24
	lsrs r1, 24
	lsrs r0, r6, 24
	bl sub_808BCB4
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0808C7EE
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0808C7EA
	movs r5, 0
_0808C80E:
	lsls r0, r5, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	ldr r1, _0808C850 @ =gUnknown_84186CD
	bl StringCopy
	adds r4, r5, 0x1
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	lsls r4, 16
	lsrs r5, r4, 16
	cmp r5, 0xD
	bls _0808C80E
	movs r5, 0
_0808C832:
	lsls r0, r5, 24
	lsrs r0, 24
	movs r1, 0x3
	ands r1, r5
	bl sub_808BDBC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0808C832
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C850: .4byte gUnknown_84186CD
	thumb_func_end sub_808C7E0

	thumb_func_start sub_808C854
sub_808C854: @ 808C854
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x20
	adds r5, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r6, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r7, r2, 0
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, _0808C8E8 @ =gUnknown_83CDA98
	str r0, [sp, 0x18]
	ldr r1, _0808C8EC @ =0xffff0000
	add r4, sp, 0x18
	ldr r0, [r4, 0x4]
	ands r0, r1
	orrs r0, r7
	str r0, [r4, 0x4]
	mov r1, sp
	ldr r0, _0808C8F0 @ =gUnknown_83CDAB8
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r1, 0x4]
	strh r6, [r1, 0x6]
	ldr r0, _0808C8F4 @ =gUnknown_83CE2B8
	str r0, [sp, 0x8]
	movs r0, 0xC0
	lsls r0, 1
	strh r0, [r1, 0xC]
	adds r0, r6, 0x1
	strh r0, [r1, 0xE]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x8
	bl memset
	ldr r0, [sp, 0x38]
	cmp r0, 0
	beq _0808C8B2
	adds r0, r4, 0
	bl LoadSpritePalette
_0808C8B2:
	mov r0, sp
	bl LoadSpriteSheets
	ldr r0, _0808C8F8 @ =gUnknown_20397AC
	str r5, [r0]
	movs r1, 0x90
	lsls r1, 2
	adds r0, r5, r1
	strh r6, [r0]
	adds r1, 0x2
	adds r0, r5, r1
	strh r7, [r0]
	adds r1, 0x4
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r5, r1
	ldr r1, [sp, 0x38]
	str r1, [r0]
	add sp, 0x20
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C8E8: .4byte gUnknown_83CDA98
_0808C8EC: .4byte 0xffff0000
_0808C8F0: .4byte gUnknown_83CDAB8
_0808C8F4: .4byte gUnknown_83CE2B8
_0808C8F8: .4byte gUnknown_20397AC
	thumb_func_end sub_808C854

	thumb_func_start sub_808C8FC
sub_808C8FC: @ 808C8FC
	push {r4,r5,lr}
	ldr r5, _0808C93C @ =gUnknown_20397AC
	ldr r1, [r5]
	movs r2, 0x8F
	lsls r2, 2
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _0808C918
	adds r2, 0x6
	adds r0, r1, r2
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_0808C918:
	ldr r0, [r5]
	movs r4, 0x90
	lsls r4, 2
	adds r0, r4
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r5]
	adds r0, r4
	ldrh r0, [r0]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808C93C: .4byte gUnknown_20397AC
	thumb_func_end sub_808C8FC

	thumb_func_start sub_808C940
sub_808C940: @ 808C940
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_808C9C4
	pop {r0}
	bx r0
	thumb_func_end sub_808C940

	thumb_func_start sub_808C950
sub_808C950: @ 808C950
	push {lr}
	bl sub_808CBA4
	pop {r0}
	bx r0
	thumb_func_end sub_808C950

	thumb_func_start sub_808C95C
sub_808C95C: @ 808C95C
	push {lr}
	ldr r0, _0808C974 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808C978
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xC9
	b _0808C9C0
	.align 2, 0
_0808C974: .4byte gMain
_0808C978:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808C998
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808C994 @ =gUnknown_20397AC
	ldr r0, [r0]
	movs r1, 0x91
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	b _0808C9C0
	.align 2, 0
_0808C994: .4byte gUnknown_20397AC
_0808C998:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0808C9AC
	movs r0, 0x5
	bl PlaySE
	bl sub_808CC44
	b _0808C9BE
_0808C9AC:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808C9BE
	movs r0, 0x5
	bl PlaySE
	bl sub_808CC10
_0808C9BE:
	movs r0, 0xC8
_0808C9C0:
	pop {r1}
	bx r1
	thumb_func_end sub_808C95C

	thumb_func_start sub_808C9C4
sub_808C9C4: @ 808C9C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x3C
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	str r0, [sp, 0x34]
	str r1, [sp, 0x38]
	movs r1, 0xC0
	lsls r1, 24
	ldr r0, [sp, 0x34]
	orrs r0, r1
	str r0, [sp, 0x34]
	ldr r1, _0808CB78 @ =0xffff0fff
	add r4, sp, 0x34
	ldr r0, [r4, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r4, 0x4]
	add r0, sp, 0x1C
	mov r8, r0
	movs r1, 0
	strh r1, [r0]
	mov r0, sp
	adds r0, 0x1E
	strh r1, [r0]
	str r4, [sp, 0x20]
	ldr r0, _0808CB7C @ =gDummySpriteAnimTable
	str r0, [sp, 0x24]
	str r1, [sp, 0x28]
	ldr r0, _0808CB80 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x2C]
	ldr r0, _0808CB84 @ =SpriteCallbackDummy
	str r0, [sp, 0x30]
	add r0, sp, 0x4
	mov r1, r8
	movs r2, 0x18
	bl memcpy
	ldr r1, _0808CB88 @ =gUnknown_83CDA94
	mov r0, r8
	movs r2, 0x4
	bl memcpy
	ldr r6, _0808CB8C @ =gUnknown_20397AC
	ldr r0, [r6]
	movs r1, 0x91
	lsls r1, 2
	adds r0, r1
	strb r5, [r0]
	add r2, sp, 0x4
	ldr r1, [r6]
	movs r5, 0x90
	lsls r5, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r3, _0808CB90 @ =0x00000242
	adds r1, r3
	ldrh r0, [r1]
	strh r0, [r2, 0x2]
	adds r0, r2, 0
	movs r1, 0xA0
	movs r2, 0x60
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808CB94 @ =gSprites
	adds r0, r1
	str r0, [r3]
	ldrb r2, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r4, 0x3]
	add r1, sp, 0x4
	adds r3, r5
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _0808CB98 @ =gUnknown_83CDA70
	str r0, [sp, 0xC]
	movs r4, 0
	mov r7, r8
_0808CA90:
	ldr r0, [r6]
	ldr r1, _0808CB9C @ =0x00000246
	adds r0, r1
	ldrb r3, [r0]
	add r0, sp, 0x4
	movs r1, 0x7C
	movs r2, 0x50
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, [r6]
	lsls r3, r4, 2
	adds r2, 0x4
	adds r2, r3
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808CB94 @ =gSprites
	adds r1, r0, r1
	str r1, [r2]
	movs r5, 0
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _0808CACA
	movs r0, 0xC4
	strh r0, [r1, 0x20]
	movs r5, 0x2
_0808CACA:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0808CAEE
	ldr r1, [r6]
	adds r1, 0x4
	adds r1, r3
	ldr r2, [r1]
	movs r0, 0x70
	strh r0, [r2, 0x22]
	ldr r2, [r1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x3]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0808CAEE:
	ldr r0, [r6]
	adds r0, 0x4
	adds r0, r3
	ldr r0, [r0]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _0808CA90
	movs r4, 0
	ldr r5, _0808CB8C @ =gUnknown_20397AC
_0808CB0C:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 19
	movs r3, 0xF8
	lsls r3, 15
	adds r0, r3
	lsrs r0, 16
	lsls r2, r4, 24
	lsrs r2, 24
	ldr r1, [r5]
	ldr r3, _0808CB9C @ =0x00000246
	adds r1, r3
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0x58
	movs r3, 0
	bl sub_809223C
	adds r2, r0, 0
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, 0x20
	adds r0, r1
	str r2, [r0]
	cmp r2, 0
	beq _0808CB54
	movs r1, 0x1
	cmp r4, 0
	bne _0808CB4C
	movs r3, 0x1
	negs r3, r3
	adds r1, r3, 0
_0808CB4C:
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	ldr r0, _0808CBA0 @ =sub_808CD64
	str r0, [r1, 0x1C]
_0808CB54:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _0808CB0C
	bl sub_808CC74
	adds r0, r7, 0
	movs r1, 0x5
	movs r2, 0x3
	bl sub_808CCFC
	add sp, 0x3C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CB78: .4byte 0xffff0fff
_0808CB7C: .4byte gDummySpriteAnimTable
_0808CB80: .4byte gDummySpriteAffineAnimTable
_0808CB84: .4byte SpriteCallbackDummy
_0808CB88: .4byte gUnknown_83CDA94
_0808CB8C: .4byte gUnknown_20397AC
_0808CB90: .4byte 0x00000242
_0808CB94: .4byte gSprites
_0808CB98: .4byte gUnknown_83CDA70
_0808CB9C: .4byte 0x00000246
_0808CBA0: .4byte sub_808CD64
	thumb_func_end sub_808C9C4

	thumb_func_start sub_808CBA4
sub_808CBA4: @ 808CBA4
	push {r4-r6,lr}
	ldr r4, _0808CC0C @ =gUnknown_20397AC
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _0808CBBA
	bl DestroySprite
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_0808CBBA:
	movs r5, 0
	adds r6, r4, 0
_0808CBBE:
	ldr r0, [r6]
	lsls r4, r5, 2
	adds r0, 0x4
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _0808CBDA
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0x4
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_0808CBDA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _0808CBBE
	movs r5, 0
_0808CBE6:
	ldr r0, _0808CC0C @ =gUnknown_20397AC
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0x20
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _0808CBFA
	bl DestroySprite
_0808CBFA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _0808CBE6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CC0C: .4byte gUnknown_20397AC
	thumb_func_end sub_808CBA4

	thumb_func_start sub_808CC10
sub_808CC10: @ 808CC10
	push {lr}
	ldr r2, _0808CC40 @ =gUnknown_20397AC
	ldr r1, [r2]
	movs r0, 0x91
	lsls r0, 2
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bls _0808CC36
	ldr r0, [r2]
	movs r1, 0x91
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0808CC36:
	bl sub_808CC74
	pop {r0}
	bx r0
	.align 2, 0
_0808CC40: .4byte gUnknown_20397AC
	thumb_func_end sub_808CC10

	thumb_func_start sub_808CC44
sub_808CC44: @ 808CC44
	push {lr}
	ldr r0, _0808CC5C @ =gUnknown_20397AC
	ldr r2, [r0]
	movs r1, 0x91
	lsls r1, 2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808CC60
	subs r1, r0, 0x1
	b _0808CC62
	.align 2, 0
_0808CC5C: .4byte gUnknown_20397AC
_0808CC60:
	movs r1, 0xD
_0808CC62:
	movs r3, 0x91
	lsls r3, 2
	adds r0, r2, r3
	strb r1, [r0]
	bl sub_808CC74
	pop {r0}
	bx r0
	thumb_func_end sub_808CC44

	thumb_func_start sub_808CC74
sub_808CC74: @ 808CC74
	push {r4-r7,lr}
	ldr r6, _0808CCF8 @ =gUnknown_20397AC
	ldr r0, [r6]
	movs r5, 0x91
	lsls r5, 2
	adds r0, r5
	ldrb r0, [r0]
	bl CountMonsInBox
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, [r6]
	movs r1, 0x8A
	lsls r1, 2
	adds r4, r0, r1
	adds r0, r5
	ldrb r0, [r0]
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	adds r1, r0, 0
	ldr r0, [r6]
	movs r2, 0x8C
	lsls r2, 2
	adds r0, r2
	cmp r1, r0
	bcs _0808CCC0
	movs r4, 0
	adds r3, r6, 0
_0808CCB4:
	strb r4, [r1]
	adds r1, 0x1
	ldr r0, [r3]
	adds r0, r2
	cmp r1, r0
	bcc _0808CCB4
_0808CCC0:
	movs r0, 0xFF
	strb r0, [r1]
	ldr r5, _0808CCF8 @ =gUnknown_20397AC
	ldr r0, [r5]
	movs r4, 0x8A
	lsls r4, 2
	adds r0, r4
	movs r1, 0
	movs r2, 0x1
	bl sub_808CCFC
	ldr r0, [r5]
	adds r0, r4
	adds r1, r7, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x3
	movs r2, 0x3
	bl sub_808CCFC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CCF8: .4byte gUnknown_20397AC
	thumb_func_end sub_808CC74

	thumb_func_start sub_808CCFC
sub_808CCFC: @ 808CCFC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	ldr r6, _0808CD5C @ =gUnknown_20397AC
	ldr r0, [r6]
	movs r1, 0x90
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	bl GetSpriteTileStartByTag
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 11
	lsls r4, 8
	ldr r0, _0808CD60 @ =0x06010000
	adds r4, r0
	adds r1, r4
	lsls r5, 5
	adds r1, r5
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0xF
	str r0, [sp]
	movs r0, 0xE
	str r0, [sp, 0x4]
	ldr r0, [r6]
	adds r0, 0x28
	str r0, [sp, 0x8]
	mov r0, r8
	movs r3, 0x4
	bl sub_808BFE0
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CD5C: .4byte gUnknown_20397AC
_0808CD60: .4byte 0x06010000
	thumb_func_end sub_808CCFC

	thumb_func_start sub_808CD64
sub_808CD64: @ 808CD64
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0808CD94
	strh r2, [r1, 0x30]
	ldrh r0, [r1, 0x2E]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0808CD94
	strh r2, [r1, 0x32]
	strh r2, [r1, 0x24]
_0808CD94:
	pop {r0}
	bx r0
	thumb_func_end sub_808CD64

	thumb_func_start sub_808CD98
sub_808CD98: @ 808CD98
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_8096BF8
	bl TransferPlttBuffer
	ldr r0, _0808CDC0 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xB3
	lsls r1, 2
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x18
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0808CDC0: .4byte gUnknown_20397B0
	thumb_func_end sub_808CD98

	thumb_func_start c2_Box
c2_Box: @ 808CDC4
	push {lr}
	bl RunTasks
	bl DoScheduledBgTilemapCopiesToVram
	bl sub_808EFC8
	bl sub_808F99C
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	thumb_func_end c2_Box

	thumb_func_start sub_808CDE4
sub_808CDE4: @ 808CDE4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl ResetTasks
	ldr r0, _0808CE08 @ =gUnknown_20397B5
	strb r5, [r0]
	ldr r4, _0808CE0C @ =gUnknown_20397B0
	ldr r0, _0808CE10 @ =0x000062bc
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	bne _0808CE18
	ldr r0, _0808CE14 @ =sub_808C7B4
	bl SetMainCallback2
	b _0808CE4A
	.align 2, 0
_0808CE08: .4byte gUnknown_20397B5
_0808CE0C: .4byte gUnknown_20397B0
_0808CE10: .4byte 0x000062bc
_0808CE14: .4byte sub_808C7B4
_0808CE18:
	movs r2, 0
	strb r5, [r0, 0x1]
	ldr r0, [r4]
	strb r2, [r0, 0x3]
	ldr r0, _0808CE50 @ =gUnknown_20397BA
	movs r1, 0
	strh r2, [r0]
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, _0808CE54 @ =task_box_related_3
	movs r1, 0x3
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, 0x4]
	movs r0, 0x1C
	bl HelpSystem_SetSomeVariable2
	bl StorageGetCurrentBox
	ldr r1, _0808CE58 @ =gUnknown_20397B8
	strb r0, [r1]
	ldr r0, _0808CE5C @ =c2_Box
	bl SetMainCallback2
_0808CE4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808CE50: .4byte gUnknown_20397BA
_0808CE54: .4byte task_box_related_3
_0808CE58: .4byte gUnknown_20397B8
_0808CE5C: .4byte c2_Box
	thumb_func_end sub_808CDE4

	thumb_func_start sub_808CE60
sub_808CE60: @ 808CE60
	push {r4,lr}
	bl ResetTasks
	ldr r4, _0808CE80 @ =gUnknown_20397B0
	ldr r0, _0808CE84 @ =0x000062bc
	bl Alloc
	adds r1, r0, 0
	str r1, [r4]
	cmp r1, 0
	bne _0808CE8C
	ldr r0, _0808CE88 @ =sub_808C7B4
	bl SetMainCallback2
	b _0808CEB6
	.align 2, 0
_0808CE80: .4byte gUnknown_20397B0
_0808CE84: .4byte 0x000062bc
_0808CE88: .4byte sub_808C7B4
_0808CE8C:
	ldr r0, _0808CEBC @ =gUnknown_20397B5
	ldrb r0, [r0]
	movs r2, 0
	strb r0, [r1, 0x1]
	ldr r1, [r4]
	movs r0, 0x1
	strb r0, [r1, 0x3]
	ldr r0, [r4]
	strb r2, [r0]
	ldr r0, _0808CEC0 @ =task_box_related_3
	movs r1, 0x3
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, 0x4]
	movs r0, 0x1C
	bl HelpSystem_SetSomeVariable2
	ldr r0, _0808CEC4 @ =c2_Box
	bl SetMainCallback2
_0808CEB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CEBC: .4byte gUnknown_20397B5
_0808CEC0: .4byte task_box_related_3
_0808CEC4: .4byte c2_Box
	thumb_func_end sub_808CE60

	thumb_func_start sub_808CEC8
sub_808CEC8: @ 808CEC8
	push {lr}
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
	movs r0, 0x18
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1A
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1C
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x1E
	movs r1, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_808CEC8

	thumb_func_start sub_808CF10
sub_808CF10: @ 808CF10
	push {r4,lr}
	sub sp, 0x4
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	bl ClearDma3Requests
	ldr r1, _0808CF80 @ =gReservedSpriteTileCount
	movs r2, 0xA0
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0808CF84 @ =gUnknown_20397B0
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x8
	adds r1, 0x10
	movs r2, 0x8
	bl sub_8096BE4
	ldr r1, _0808CF88 @ =gKeyRepeatStartDelay
	movs r0, 0x14
	strh r0, [r1]
	bl ClearScheduledBgCopiesToVram
	movs r0, 0x3
	bl sub_80F7AD8
	ldr r2, _0808CF8C @ =gUnknown_83CE6F8
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x1
	movs r3, 0x8
	bl sub_80F7B80
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_80F7CAC
	ldr r0, [r4]
	ldr r1, _0808CF90 @ =0x000002c7
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CF80: .4byte gReservedSpriteTileCount
_0808CF84: .4byte gUnknown_20397B0
_0808CF88: .4byte gKeyRepeatStartDelay
_0808CF8C: .4byte gUnknown_83CE6F8
_0808CF90: .4byte 0x000002c7
	thumb_func_end sub_808CF10

	thumb_func_start sub_808CF94
sub_808CF94: @ 808CF94
	push {lr}
	bl sub_8092B50
	ldr r2, _0808CFB8 @ =gUnknown_20397B4
	movs r1, 0
	ldr r0, _0808CFBC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _0808CFAA
	movs r1, 0x1
_0808CFAA:
	strb r1, [r2]
	ldr r1, _0808CFC0 @ =gUnknown_20397B6
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808CFB8: .4byte gUnknown_20397B4
_0808CFBC: .4byte gUnknown_20397B0
_0808CFC0: .4byte gUnknown_20397B6
	thumb_func_end sub_808CF94

	thumb_func_start sub_808CFC4
sub_808CFC4: @ 808CFC4
	push {lr}
	ldr r0, _0808CFF0 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _0808CFE2
	movs r1, 0xFC
	lsls r1, 6
	movs r0, 0x50
	bl SetGpuReg
	ldr r1, _0808CFF4 @ =0x00000b07
	movs r0, 0x52
	bl SetGpuReg
_0808CFE2:
	movs r1, 0xFA
	lsls r1, 5
	movs r0, 0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0808CFF0: .4byte gUnknown_20397B0
_0808CFF4: .4byte 0x00000b07
	thumb_func_end sub_808CFC4

	thumb_func_start add_to_c3_somehow
add_to_c3_somehow: @ 808CFF8
	push {r4,lr}
	ldr r4, _0808D018 @ =gTasks
	ldr r1, _0808D01C @ =gUnknown_20397B0
	ldr r3, [r1]
	ldrb r2, [r3, 0x4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r4
	str r0, [r1]
	movs r0, 0
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D018: .4byte gTasks
_0808D01C: .4byte gUnknown_20397B0
	thumb_func_end add_to_c3_somehow

	thumb_func_start task_box_related_3
task_box_related_3: @ 808D020
	push {lr}
	sub sp, 0x4
	ldr r0, _0808D03C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xA
	bls _0808D030
	b _0808D216
_0808D030:
	lsls r0, 2
	ldr r1, _0808D040 @ =_0808D044
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D03C: .4byte gUnknown_20397B0
_0808D040: .4byte _0808D044
	.align 2, 0
_0808D044:
	.4byte _0808D070
	.4byte _0808D0C8
	.4byte _0808D0D6
	.4byte _0808D104
	.4byte _0808D120
	.4byte _0808D13E
	.4byte _0808D15E
	.4byte _0808D164
	.4byte _0808D16A
	.4byte _0808D178
	.4byte _0808D1BE
_0808D070:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	movs r1, 0
	bl SetGpuReg
	bl sub_808CF10
	ldr r0, _0808D0A0 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _0808D0BE
	ldr r0, _0808D0A4 @ =gUnknown_20397B7
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808D0AE
	cmp r0, 0x1
	bgt _0808D0A8
	cmp r0, 0
	beq _0808D0B4
	b _0808D0BE
	.align 2, 0
_0808D0A0: .4byte gUnknown_20397B0
_0808D0A4: .4byte gUnknown_20397B7
_0808D0A8:
	cmp r0, 0x2
	beq _0808D0BA
	b _0808D0BE
_0808D0AE:
	bl sub_8093660
	b _0808D0BE
_0808D0B4:
	bl sub_80937B4
	b _0808D0BE
_0808D0BA:
	bl sub_808EF0C
_0808D0BE:
	bl sub_808EFE4
	bl sub_808F068
	b _0808D20C
_0808D0C8:
	bl sub_808F044
	lsls r0, 24
	cmp r0, 0
	beq _0808D0D4
	b _0808D20C
_0808D0D4:
	b _0808D148
_0808D0D6:
	movs r0, 0
	bl PutWindowTilemap
	movs r0, 0x1
	bl ClearWindowTilemap
	movs r0, 0
	str r0, [sp]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _0808D100 @ =0x05000080
	mov r0, sp
	bl CpuSet
	movs r0, 0x1
	movs r1, 0xB
	movs r2, 0xE0
	bl TextWindow_SetUserSelectedFrame
	b _0808D20C
	.align 2, 0
_0808D100: .4byte 0x05000080
_0808D104:
	bl sub_808CEC8
	ldr r0, _0808D11C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _0808D114
	b _0808D20C
_0808D114:
	bl sub_808CF94
	b _0808D20C
	.align 2, 0
_0808D11C: .4byte gUnknown_20397B0
_0808D120:
	bl sub_808FFAC
	ldr r0, _0808D134 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	bne _0808D138
	bl sub_80922C0
	b _0808D20C
	.align 2, 0
_0808D134: .4byte gUnknown_20397B0
_0808D138:
	bl sub_8092340
	b _0808D20C
_0808D13E:
	bl sub_8095050
	lsls r0, 24
	cmp r0, 0
	bne _0808D154
_0808D148:
	ldr r0, _0808D150 @ =sub_808EE18
	bl add_to_c3_somehow
	b _0808D216
	.align 2, 0
_0808D150: .4byte sub_808EE18
_0808D154:
	bl sub_808EF8C
	bl sub_808FB68
	b _0808D20C
_0808D15E:
	bl sub_808F078
	b _0808D20C
_0808D164:
	bl sub_808F68C
	b _0808D20C
_0808D16A:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	bl sub_80913DC
	b _0808D20C
_0808D178:
	bl sub_809140C
	lsls r0, 24
	cmp r0, 0
	bne _0808D216
	ldr r0, _0808D1A8 @ =gUnknown_20397B0
	ldr r2, [r0]
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3
	beq _0808D1B4
	movs r1, 0xDA
	lsls r1, 4
	adds r0, r2, r1
	movs r1, 0xD
	strh r1, [r0]
	ldr r1, _0808D1AC @ =0x00000da2
	adds r2, r1
	ldr r1, _0808D1B0 @ =0x0000dace
	strh r1, [r2]
	bl sub_80BE46C
	bl sub_80BE5F0
	b _0808D20C
	.align 2, 0
_0808D1A8: .4byte gUnknown_20397B0
_0808D1AC: .4byte 0x00000da2
_0808D1B0: .4byte 0x0000dace
_0808D1B4:
	bl sub_8095B5C
	bl sub_808FDFC
	b _0808D20C
_0808D1BE:
	bl sub_808CFC4
	ldr r0, _0808D1E0 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	bne _0808D1E8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _0808D1E4 @ =sub_808D220
	bl add_to_c3_somehow
	b _0808D1FA
	.align 2, 0
_0808D1E0: .4byte gUnknown_20397B0
_0808D1E4: .4byte sub_808D220
_0808D1E8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _0808D204 @ =sub_808D26C
	bl add_to_c3_somehow
_0808D1FA:
	ldr r0, _0808D208 @ =sub_808CD98
	bl SetVBlankCallback
	b _0808D216
	.align 2, 0
_0808D204: .4byte sub_808D26C
_0808D208: .4byte sub_808CD98
_0808D20C:
	ldr r0, _0808D21C @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0808D216:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808D21C: .4byte gUnknown_20397B0
	thumb_func_end task_box_related_3

	thumb_func_start sub_808D220
sub_808D220: @ 808D220
	push {r4,lr}
	ldr r4, _0808D234 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808D238
	cmp r0, 0x1
	beq _0808D252
	b _0808D262
	.align 2, 0
_0808D234: .4byte gUnknown_20397B0
_0808D238:
	movs r0, 0x2
	bl PlaySE
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1
	bl sub_80A0A48
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808D262
_0808D252:
	bl sub_80A0A98
	lsls r0, 24
	cmp r0, 0
	bne _0808D262
	ldr r0, _0808D268 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808D262:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D268: .4byte sub_808D2BC
	thumb_func_end sub_808D220

	thumb_func_start sub_808D26C
sub_808D26C: @ 808D26C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _0808D280 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808D284
	cmp r0, 0x1
	beq _0808D29E
	b _0808D2AE
	.align 2, 0
_0808D280: .4byte gUnknown_20397B0
_0808D284:
	movs r1, 0x1
	negs r1, r1
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808D2AE
_0808D29E:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0808D2AE
	ldr r0, _0808D2B8 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808D2AE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D2B8: .4byte sub_808D2BC
	thumb_func_end sub_808D26C

	thumb_func_start sub_808D2BC
sub_808D2BC: @ 808D2BC
	push {r4,r5,lr}
	ldr r0, _0808D2D4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xB
	bls _0808D2CA
	b _0808D7B2
_0808D2CA:
	lsls r0, 2
	ldr r1, _0808D2D8 @ =_0808D2DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D2D4: .4byte gUnknown_20397B0
_0808D2D8: .4byte _0808D2DC
	.align 2, 0
_0808D2DC:
	.4byte _0808D30C
	.4byte _0808D630
	.4byte _0808D670
	.4byte _0808D6C8
	.4byte _0808D6EC
	.4byte _0808D6F6
	.4byte _0808D710
	.4byte _0808D730
	.4byte _0808D736
	.4byte _0808D74C
	.4byte _0808D778
	.4byte _0808D7A0
_0808D30C:
	bl sub_80948B4
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x19
	bls _0808D31C
	b _0808D7B2
_0808D31C:
	lsls r0, 2
	ldr r1, _0808D328 @ =_0808D32C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D328: .4byte _0808D32C
	.align 2, 0
_0808D32C:
	.4byte _0808D394
	.4byte _0808D7B2
	.4byte _0808D7B2
	.4byte _0808D424
	.4byte _0808D3A8
	.4byte _0808D3DC
	.4byte _0808D43C
	.4byte _0808D450
	.4byte _0808D45C
	.4byte _0808D494
	.4byte _0808D4D8
	.4byte _0808D55C
	.4byte _0808D51C
	.4byte _0808D52E
	.4byte _0808D570
	.4byte _0808D584
	.4byte _0808D598
	.4byte _0808D5AC
	.4byte _0808D430
	.4byte _0808D5C0
	.4byte _0808D5E0
	.4byte _0808D5CA
	.4byte _0808D5EA
	.4byte _0808D628
	.4byte _0808D5EE
	.4byte _0808D608
_0808D394:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D3A4 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D3A4: .4byte gUnknown_20397B0
_0808D3A8:
	ldr r4, _0808D3C8 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0808D3CC
	movs r0, 0x10
	bl sub_808FBA4
	ldr r1, [r4]
	movs r0, 0x3
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D3C8: .4byte gUnknown_20397B0
_0808D3CC:
	bl sub_8092B50
	ldr r0, _0808D3D8 @ =sub_808D7BC
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D3D8: .4byte sub_808D7BC
_0808D3DC:
	ldr r4, _0808D408 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _0808D410
	bl sub_80939A0
	lsls r0, 24
	cmp r0, 0
	beq _0808D416
	ldr r0, [r4]
	ldr r1, _0808D40C @ =0x00000ce2
	adds r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _0808D404
	b _0808D4F6
_0808D404:
	b _0808D416
	.align 2, 0
_0808D408: .4byte gUnknown_20397B0
_0808D40C: .4byte 0x00000ce2
_0808D410:
	cmp r0, 0x3
	beq _0808D416
	b _0808D7B2
_0808D416:
	ldr r0, _0808D420 @ =sub_808D7FC
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D420: .4byte sub_808D7FC
_0808D424:
	ldr r0, _0808D42C @ =sub_808EBB0
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D42C: .4byte sub_808EBB0
_0808D430:
	ldr r0, _0808D438 @ =sub_808ECE4
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D438: .4byte sub_808ECE4
_0808D43C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D44C @ =box_related
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D44C: .4byte box_related
_0808D450:
	ldr r0, _0808D458 @ =sub_808D878
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D458: .4byte sub_808D878
_0808D45C:
	movs r0, 0x5
	bl PlaySE
	bl StorageGetCurrentBox
	ldr r4, _0808D48C @ =gUnknown_20397B0
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	ldr r2, _0808D490 @ =0x000002ca
	adds r1, r2
	strh r0, [r1]
	cmp r0, 0xD
	ble _0808D47E
	movs r0, 0
	strh r0, [r1]
_0808D47E:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x3
	beq _0808D4CC
	adds r0, r1, r2
	b _0808D78A
	.align 2, 0
_0808D48C: .4byte gUnknown_20397B0
_0808D490: .4byte 0x000002ca
_0808D494:
	movs r0, 0x5
	bl PlaySE
	bl StorageGetCurrentBox
	ldr r4, _0808D4C4 @ =gUnknown_20397B0
	ldr r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	ldr r2, _0808D4C8 @ =0x000002ca
	adds r1, r2
	strh r0, [r1]
	cmp r0, 0
	bge _0808D4B6
	movs r0, 0xD
	strh r0, [r1]
_0808D4B6:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x3
	beq _0808D4CC
	adds r0, r1, r2
	b _0808D78A
	.align 2, 0
_0808D4C4: .4byte gUnknown_20397B0
_0808D4C8: .4byte 0x000002ca
_0808D4CC:
	bl sub_8094D60
	ldr r1, [r4]
	movs r0, 0xA
	strb r0, [r1]
	b _0808D7B2
_0808D4D8:
	bl sub_8093900
	lsls r0, 24
	cmp r0, 0
	bne _0808D538
	ldr r4, _0808D500 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _0808D504 @ =0x00000ce2
	adds r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _0808D508
_0808D4F6:
	ldr r1, [r4]
	movs r0, 0x5
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D500: .4byte gUnknown_20397B0
_0808D504: .4byte 0x00000ce2
_0808D508:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D518 @ =sub_808DD88
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D518: .4byte sub_808DD88
_0808D51C:
	bl sub_8093900
	lsls r0, 24
	cmp r0, 0
	bne _0808D538
	movs r0, 0x5
	bl PlaySE
	b _0808D740
_0808D52E:
	bl sub_809393C
	lsls r0, 24
	cmp r0, 0
	bne _0808D548
_0808D538:
	ldr r0, _0808D544 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x4
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D544: .4byte gUnknown_20397B0
_0808D548:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D558 @ =sub_808DC50
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D558: .4byte sub_808DC50
_0808D55C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D56C @ =sub_808DC9C
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D56C: .4byte sub_808DC9C
_0808D570:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D580 @ =sub_808DBF0
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D580: .4byte sub_808DBF0
_0808D584:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D594 @ =sub_808E140
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D594: .4byte sub_808E140
_0808D598:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D5A8 @ =sub_808E1F4
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D5A8: .4byte sub_808E1F4
_0808D5AC:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808D5BC @ =sub_808E3C8
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D5BC: .4byte sub_808E3C8
_0808D5C0:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	b _0808D616
_0808D5CA:
	movs r0, 0x1
	bl sub_80950BC
	ldr r0, _0808D5DC @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x8
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D5DC: .4byte gUnknown_20397B0
_0808D5E0:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	b _0808D5F6
_0808D5EA:
	movs r0, 0x3
	b _0808D616
_0808D5EE:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x4
_0808D5F6:
	bl sub_80950BC
	ldr r0, _0808D604 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x9
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D604: .4byte gUnknown_20397B0
_0808D608:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x3
	bl sub_808FE54
	movs r0, 0x5
_0808D616:
	bl sub_80950BC
	ldr r0, _0808D624 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x7
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D624: .4byte gUnknown_20397B0
_0808D628:
	movs r0, 0x1A
	bl PlaySE
	b _0808D7B2
_0808D630:
	bl sub_80924A8
	lsls r0, 24
	cmp r0, 0
	beq _0808D63C
	b _0808D7B2
_0808D63C:
	bl sub_80939C8
	lsls r0, 24
	cmp r0, 0
	beq _0808D64C
	bl sub_808F948
	b _0808D650
_0808D64C:
	bl sub_808F974
_0808D650:
	ldr r4, _0808D668 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _0808D66C @ =0x00000ce6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808D662
	bl BoxSetMosaic
_0808D662:
	ldr r1, [r4]
	b _0808D6DC
	.align 2, 0
_0808D668: .4byte gUnknown_20397B0
_0808D66C: .4byte 0x00000ce6
_0808D670:
	bl sub_80915FC
	lsls r0, 24
	cmp r0, 0
	beq _0808D67C
	b _0808D7B2
_0808D67C:
	ldr r0, _0808D6BC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0808D6C0 @ =0x000002ca
	adds r0, r1
	ldrb r0, [r0]
	bl sub_808BA00
	ldr r0, _0808D6C4 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808D6A4
	bl sub_80939A0
	lsls r0, 24
	cmp r0, 0
	bne _0808D6A4
	bl sub_8092F54
	bl BoxSetMosaic
_0808D6A4:
	ldr r4, _0808D6BC @ =gUnknown_20397B0
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x3
	bne _0808D6DC
	bl sub_8094D84
	ldr r1, [r4]
	movs r0, 0xB
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D6BC: .4byte gUnknown_20397B0
_0808D6C0: .4byte 0x000002ca
_0808D6C4: .4byte gUnknown_20397B4
_0808D6C8:
	ldr r0, _0808D6E4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808D7B2
	bl sub_808FD20
	ldr r0, _0808D6E8 @ =gUnknown_20397B0
	ldr r1, [r0]
_0808D6DC:
	movs r0, 0
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D6E4: .4byte gMain
_0808D6E8: .4byte gUnknown_20397B0
_0808D6EC:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0xD
	b _0808D6FE
_0808D6F6:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0x16
_0808D6FE:
	bl sub_808FBA4
	ldr r0, _0808D70C @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x6
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D70C: .4byte gUnknown_20397B0
_0808D710:
	ldr r0, _0808D728 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808D7B2
	bl sub_808FD20
	ldr r0, _0808D72C @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D728: .4byte gMain
_0808D72C: .4byte sub_808D2BC
_0808D730:
	bl sub_80950D0
	b _0808D7A4
_0808D736:
	bl sub_80950D0
	lsls r0, 24
	cmp r0, 0
	bne _0808D7B2
_0808D740:
	ldr r0, _0808D748 @ =sub_808DB94
	bl add_to_c3_somehow
	b _0808D7B2
	.align 2, 0
_0808D748: .4byte sub_808DB94
_0808D74C:
	bl sub_80950D0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0808D7B2
	ldr r5, _0808D770 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r1, _0808D774 @ =0x00000ce6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808D76A
	bl BoxSetMosaic
_0808D76A:
	ldr r0, [r5]
	strb r4, [r0]
	b _0808D7B2
	.align 2, 0
_0808D770: .4byte gUnknown_20397B0
_0808D774: .4byte 0x00000ce6
_0808D778:
	bl sub_809610C
	lsls r0, 24
	cmp r0, 0
	bne _0808D7B2
	ldr r4, _0808D798 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _0808D79C @ =0x000002ca
	adds r0, r1
_0808D78A:
	ldrb r0, [r0]
	bl sub_8091514
	ldr r1, [r4]
	movs r0, 0x2
	strb r0, [r1]
	b _0808D7B2
	.align 2, 0
_0808D798: .4byte gUnknown_20397B0
_0808D79C: .4byte 0x000002ca
_0808D7A0:
	bl sub_809610C
_0808D7A4:
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0808D7B2
	ldr r0, _0808D7B8 @ =gUnknown_20397B0
	ldr r0, [r0]
	strb r1, [r0]
_0808D7B2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D7B8: .4byte gUnknown_20397B0
	thumb_func_end sub_808D2BC

	thumb_func_start sub_808D7BC
sub_808D7BC: @ 808D7BC
	push {r4,lr}
	ldr r4, _0808D7D0 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808D7D4
	cmp r0, 0x1
	beq _0808D7E2
	b _0808D7F2
	.align 2, 0
_0808D7D0: .4byte gUnknown_20397B0
_0808D7D4:
	bl sub_808FAD4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808D7F2
_0808D7E2:
	bl sub_808FAF8
	lsls r0, 24
	cmp r0, 0
	bne _0808D7F2
	ldr r0, _0808D7F8 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808D7F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D7F8: .4byte sub_808D2BC
	thumb_func_end sub_808D7BC

	thumb_func_start sub_808D7FC
sub_808D7FC: @ 808D7FC
	push {r4,lr}
	ldr r4, _0808D814 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808D82A
	cmp r0, 0x1
	bgt _0808D818
	cmp r0, 0
	beq _0808D81E
	b _0808D86A
	.align 2, 0
_0808D814: .4byte gUnknown_20397B0
_0808D818:
	cmp r0, 0x2
	beq _0808D84A
	b _0808D86A
_0808D81E:
	movs r0, 0x5
	bl PlaySE
	bl sub_808F810
	b _0808D840
_0808D82A:
	bl sub_808F850
	lsls r0, 24
	cmp r0, 0
	bne _0808D86A
	bl sub_8092B70
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092B3C
_0808D840:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808D86A
_0808D84A:
	bl sub_80924A8
	lsls r0, 24
	cmp r0, 0
	bne _0808D86A
	ldr r0, [r4]
	ldr r1, _0808D870 @ =0x00000ce6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808D864
	bl BoxSetMosaic
_0808D864:
	ldr r0, _0808D874 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808D86A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D870: .4byte 0x00000ce6
_0808D874: .4byte sub_808D2BC
	thumb_func_end sub_808D7FC

	thumb_func_start sub_808D878
sub_808D878: @ 808D878
	push {r4,lr}
	ldr r0, _0808D890 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _0808D886
	b _0808DB86
_0808D886:
	lsls r0, 2
	ldr r1, _0808D894 @ =_0808D898
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D890: .4byte gUnknown_20397B0
_0808D894: .4byte _0808D898
	.align 2, 0
_0808D898:
	.4byte _0808D8B4
	.4byte _0808D918
	.4byte _0808D934
	.4byte _0808DB40
	.4byte _0808DB54
	.4byte _0808DB4A
	.4byte _0808DB70
_0808D8B4:
	bl sub_808F258
	lsls r0, 24
	cmp r0, 0
	beq _0808D8C0
	b _0808DB86
_0808D8C0:
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0808D8D8 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	beq _0808D8DC
	movs r0, 0x4
	bl sub_808FBA4
	b _0808D906
	.align 2, 0
_0808D8D8: .4byte gUnknown_20397B0
_0808D8DC:
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	bne _0808D8F2
	ldr r0, [r4]
	ldr r1, _0808D8FC @ =0x00000ce2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0808D900
_0808D8F2:
	movs r0, 0x17
	bl sub_808FBA4
	b _0808D906
	.align 2, 0
_0808D8FC: .4byte 0x00000ce2
_0808D900:
	movs r0, 0x18
	bl sub_808FBA4
_0808D906:
	bl sub_8094E88
	ldr r0, _0808D914 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1]
	b _0808DB86
	.align 2, 0
_0808D914: .4byte gUnknown_20397B0
_0808D918:
	bl sub_8094F90
	lsls r0, 24
	cmp r0, 0
	beq _0808D924
	b _0808DB86
_0808D924:
	ldr r0, _0808D930 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x2
	strb r0, [r1]
	b _0808DB86
	.align 2, 0
_0808D930: .4byte gUnknown_20397B0
_0808D934:
	bl sub_8094F94
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x12
	bls _0808D944
	b _0808DB86
_0808D944:
	lsls r0, 2
	ldr r1, _0808D950 @ =_0808D954
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D950: .4byte _0808D954
	.align 2, 0
_0808D954:
	.4byte _0808D9A0
	.4byte _0808D9A0
	.4byte _0808DA20
	.4byte _0808DA08
	.4byte _0808D9B0
	.4byte _0808D9E8
	.4byte _0808D9D0
	.4byte _0808DAC0
	.4byte _0808DA5C
	.4byte _0808DAD4
	.4byte _0808DB86
	.4byte _0808DB86
	.4byte _0808DB86
	.4byte _0808DAE8
	.4byte _0808DAFC
	.4byte _0808DB28
	.4byte _0808DB1C
	.4byte _0808DB10
	.4byte _0808DB34
_0808D9A0:
	bl sub_808FD20
	ldr r0, _0808D9AC @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808D9AC: .4byte sub_808D2BC
_0808D9B0:
	bl sub_8093900
	lsls r0, 24
	cmp r0, 0
	bne _0808DA66
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r0, _0808D9CC @ =sub_808DB94
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808D9CC: .4byte sub_808DB94
_0808D9D0:
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r0, _0808D9E4 @ =sub_808DBF0
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808D9E4: .4byte sub_808DBF0
_0808D9E8:
	bl sub_809393C
	lsls r0, 24
	cmp r0, 0
	beq _0808DA66
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r0, _0808DA04 @ =sub_808DC50
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DA04: .4byte sub_808DC50
_0808DA08:
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r0, _0808DA1C @ =sub_808DC9C
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DA1C: .4byte sub_808DC9C
_0808DA20:
	bl sub_8093900
	lsls r0, 24
	cmp r0, 0
	bne _0808DA66
	ldr r4, _0808DA50 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r2, _0808DA54 @ =0x00000ce2
	adds r0, r2
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	bne _0808DAA0
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r0, _0808DA58 @ =sub_808DD88
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DA50: .4byte gUnknown_20397B0
_0808DA54: .4byte 0x00000ce2
_0808DA58: .4byte sub_808DD88
_0808DA5C:
	bl sub_8093900
	lsls r0, 24
	cmp r0, 0
	beq _0808DA74
_0808DA66:
	ldr r0, _0808DA70 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x3
	strb r0, [r1]
	b _0808DB86
	.align 2, 0
_0808DA70: .4byte gUnknown_20397B0
_0808DA74:
	ldr r4, _0808DA88 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r2, _0808DA8C @ =0x00000ce9
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808DA90
	movs r0, 0x5
	strb r0, [r1]
	b _0808DB86
	.align 2, 0
_0808DA88: .4byte gUnknown_20397B0
_0808DA8C: .4byte 0x00000ce9
_0808DA90:
	ldr r2, _0808DAA8 @ =0x00000ce2
	adds r0, r1, r2
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _0808DAAC
_0808DAA0:
	ldr r1, [r4]
	movs r0, 0x4
	strb r0, [r1]
	b _0808DB86
	.align 2, 0
_0808DAA8: .4byte 0x00000ce2
_0808DAAC:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808DABC @ =sub_808DECC
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DABC: .4byte sub_808DECC
_0808DAC0:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808DAD0 @ =sub_808EAF0
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DAD0: .4byte sub_808EAF0
_0808DAD4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808DAE4 @ =sub_808E0BC
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DAE4: .4byte sub_808E0BC
_0808DAE8:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808DAF8 @ =sub_808E140
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DAF8: .4byte sub_808E140
_0808DAFC:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808DB0C @ =sub_808E1F4
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DB0C: .4byte sub_808E1F4
_0808DB10:
	ldr r0, _0808DB18 @ =sub_808E2B0
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DB18: .4byte sub_808E2B0
_0808DB1C:
	ldr r0, _0808DB24 @ =sub_808E3C8
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DB24: .4byte sub_808E3C8
_0808DB28:
	ldr r0, _0808DB30 @ =sub_808EB50
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DB30: .4byte sub_808EB50
_0808DB34:
	ldr r0, _0808DB3C @ =sub_808E4B0
	bl add_to_c3_somehow
	b _0808DB86
	.align 2, 0
_0808DB3C: .4byte sub_808E4B0
_0808DB40:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0xD
	b _0808DB5C
_0808DB4A:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0x11
	b _0808DB5C
_0808DB54:
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0x16
_0808DB5C:
	bl sub_808FBA4
	ldr r0, _0808DB6C @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x6
	strb r0, [r1]
	b _0808DB86
	.align 2, 0
_0808DB6C: .4byte gUnknown_20397B0
_0808DB70:
	ldr r0, _0808DB8C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808DB86
	bl sub_808FD20
	ldr r0, _0808DB90 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808DB86:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB8C: .4byte gMain
_0808DB90: .4byte sub_808D2BC
	thumb_func_end sub_808D878

	thumb_func_start sub_808DB94
sub_808DB94: @ 808DB94
	push {r4,lr}
	ldr r4, _0808DBA8 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808DBAC
	cmp r0, 0x1
	beq _0808DBBC
	b _0808DBE6
	.align 2, 0
_0808DBA8: .4byte gUnknown_20397B0
_0808DBAC:
	movs r0, 0
	bl sub_8092B7C
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808DBE6
_0808DBBC:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0808DBE6
	ldr r0, _0808DBD8 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808DBE0
	ldr r0, _0808DBDC @ =sub_808E688
	bl add_to_c3_somehow
	b _0808DBE6
	.align 2, 0
_0808DBD8: .4byte gUnknown_20397B4
_0808DBDC: .4byte sub_808E688
_0808DBE0:
	ldr r0, _0808DBEC @ =sub_808D2BC
	bl add_to_c3_somehow
_0808DBE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DBEC: .4byte sub_808D2BC
	thumb_func_end sub_808DB94

	thumb_func_start sub_808DBF0
sub_808DBF0: @ 808DBF0
	push {r4,lr}
	ldr r4, _0808DC04 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808DC08
	cmp r0, 0x1
	beq _0808DC1E
	b _0808DC46
	.align 2, 0
_0808DC04: .4byte gUnknown_20397B0
_0808DC08:
	movs r0, 0x1
	bl sub_808FE54
	movs r0, 0x1
	bl sub_8092B7C
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808DC46
_0808DC1E:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0808DC46
	ldr r0, _0808DC38 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808DC40
	ldr r0, _0808DC3C @ =sub_808E688
	bl add_to_c3_somehow
	b _0808DC46
	.align 2, 0
_0808DC38: .4byte gUnknown_20397B4
_0808DC3C: .4byte sub_808E688
_0808DC40:
	ldr r0, _0808DC4C @ =sub_808D2BC
	bl add_to_c3_somehow
_0808DC46:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DC4C: .4byte sub_808D2BC
	thumb_func_end sub_808DBF0

	thumb_func_start sub_808DC50
sub_808DC50: @ 808DC50
	push {r4,lr}
	ldr r4, _0808DC64 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808DC68
	cmp r0, 0x1
	beq _0808DC7E
	b _0808DC92
	.align 2, 0
_0808DC64: .4byte gUnknown_20397B0
_0808DC68:
	movs r0, 0
	bl sub_808FE54
	movs r0, 0x2
	bl sub_8092B7C
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808DC92
_0808DC7E:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0808DC92
	bl BoxSetMosaic
	ldr r0, _0808DC98 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808DC92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DC98: .4byte sub_808D2BC
	thumb_func_end sub_808DC50

	thumb_func_start sub_808DC9C
sub_808DC9C: @ 808DC9C
	push {lr}
	ldr r0, _0808DCB4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0808DD7E
	lsls r0, 2
	ldr r1, _0808DCB8 @ =_0808DCBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808DCB4: .4byte gUnknown_20397B0
_0808DCB8: .4byte _0808DCBC
	.align 2, 0
_0808DCBC:
	.4byte _0808DCD4
	.4byte _0808DD0C
	.4byte _0808DD2C
	.4byte _0808DD42
	.4byte _0808DD5A
	.4byte _0808DD78
_0808DCD4:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _0808DCF4
	movs r0, 0xE
	bl sub_808FBA4
	ldr r0, _0808DCF0 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1]
	b _0808DD7E
	.align 2, 0
_0808DCF0: .4byte gUnknown_20397B0
_0808DCF4:
	bl sub_8092B5C
	movs r0, 0
	bl sub_8092B7C
	ldr r0, _0808DD08 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x2
	strb r0, [r1]
	b _0808DD7E
	.align 2, 0
_0808DD08: .4byte gUnknown_20397B0
_0808DD0C:
	ldr r0, _0808DD24 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808DD7E
	bl sub_808FD20
	ldr r0, _0808DD28 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808DD7E
	.align 2, 0
_0808DD24: .4byte gMain
_0808DD28: .4byte sub_808D2BC
_0808DD2C:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0808DD7E
	movs r0, 0x1
	bl sub_8091184
	bl sub_808FAD4
	b _0808DD68
_0808DD42:
	bl sub_808FAF8
	lsls r0, 24
	cmp r0, 0
	bne _0808DD7E
	movs r0, 0x1
	bl sub_808FE54
	movs r0, 0x1
	bl sub_8092B7C
	b _0808DD68
_0808DD5A:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0808DD7E
	bl sub_808FAA8
_0808DD68:
	ldr r0, _0808DD74 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808DD7E
	.align 2, 0
_0808DD74: .4byte gUnknown_20397B0
_0808DD78:
	ldr r0, _0808DD84 @ =sub_808D7FC
	bl add_to_c3_somehow
_0808DD7E:
	pop {r0}
	bx r0
	.align 2, 0
_0808DD84: .4byte sub_808D7FC
	thumb_func_end sub_808DC9C

	thumb_func_start sub_808DD88
sub_808DD88: @ 808DD88
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0808DDA4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0808DD98
	b _0808DEBA
_0808DD98:
	lsls r0, 2
	ldr r1, _0808DDA8 @ =_0808DDAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808DDA4: .4byte gUnknown_20397B0
_0808DDA8: .4byte _0808DDAC
	.align 2, 0
_0808DDAC:
	.4byte _0808DDC0
	.4byte _0808DDFC
	.4byte _0808DE64
	.4byte _0808DE7C
	.4byte _0808DEA0
_0808DDC0:
	movs r0, 0x6
	bl sub_808FBA4
	ldr r4, _0808DDEC @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _0808DDF0 @ =0x00001e58
	adds r0, r1
	ldr r2, _0808DDF4 @ =0x0000dac7
	movs r1, 0
	str r1, [sp]
	movs r1, 0xA
	movs r3, 0x3
	bl sub_808C854
	ldr r0, _0808DDF8 @ =gUnknown_20397B6
	ldrb r0, [r0]
	bl sub_808C940
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	b _0808DEB8
	.align 2, 0
_0808DDEC: .4byte gUnknown_20397B0
_0808DDF0: .4byte 0x00001e58
_0808DDF4: .4byte 0x0000dac7
_0808DDF8: .4byte gUnknown_20397B6
_0808DDFC:
	bl sub_808C95C
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r0, 0xC8
	beq _0808DEBA
	cmp r0, 0xC9
	bne _0808DE1C
	bl sub_808FD20
	bl sub_808C950
	bl sub_808C8FC
	b _0808DE92
_0808DE1C:
	adds r0, r4, 0
	bl sub_80930E4
	lsls r0, 24
	cmp r0, 0
	beq _0808DE50
	ldr r0, _0808DE48 @ =gUnknown_20397B6
	strb r4, [r0]
	movs r0, 0x2
	bl sub_808FE54
	bl sub_808FD20
	bl sub_808C950
	bl sub_808C8FC
	ldr r0, _0808DE4C @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x2
	b _0808DEB8
	.align 2, 0
_0808DE48: .4byte gUnknown_20397B6
_0808DE4C: .4byte gUnknown_20397B0
_0808DE50:
	movs r0, 0x8
	bl sub_808FBA4
	ldr r0, _0808DE60 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x4
	b _0808DEB8
	.align 2, 0
_0808DE60: .4byte gUnknown_20397B0
_0808DE64:
	bl CompactPartySlots
	bl sub_80909F4
	ldr r0, _0808DE78 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _0808DEB8
	.align 2, 0
_0808DE78: .4byte gUnknown_20397B0
_0808DE7C:
	bl sub_8090A60
	lsls r0, 24
	cmp r0, 0
	bne _0808DEBA
	bl sub_8093174
	bl BoxSetMosaic
	bl sub_808FAA8
_0808DE92:
	ldr r0, _0808DE9C @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808DEBA
	.align 2, 0
_0808DE9C: .4byte sub_808D2BC
_0808DEA0:
	ldr r0, _0808DEC4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808DEBA
	movs r0, 0x6
	bl sub_808FBA4
	ldr r0, _0808DEC8 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x1
_0808DEB8:
	strb r0, [r1]
_0808DEBA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DEC4: .4byte gMain
_0808DEC8: .4byte gUnknown_20397B0
	thumb_func_end sub_808DD88

	thumb_func_start sub_808DECC
sub_808DECC: @ 808DECC
	push {lr}
	ldr r0, _0808DEE4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xD
	bls _0808DEDA
	b _0808E0AE
_0808DEDA:
	lsls r0, 2
	ldr r1, _0808DEE8 @ =_0808DEEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808DEE4: .4byte gUnknown_20397B0
_0808DEE8: .4byte _0808DEEC
	.align 2, 0
_0808DEEC:
	.4byte _0808DF24
	.4byte _0808DF3A
	.4byte _0808DF72
	.4byte _0808DF98
	.4byte _0808DFA4
	.4byte _0808DFBC
	.4byte _0808DFF8
	.4byte _0808E010
	.4byte _0808E01C
	.4byte _0808E020
	.4byte _0808E034
	.4byte _0808E050
	.4byte _0808E062
	.4byte _0808E098
_0808DF24:
	movs r0, 0x9
	bl sub_808FBA4
	movs r0, 0x1
	bl sub_808FCE8
	ldr r0, _0808DF54 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0808DF3A:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0808DF64
	cmp r1, 0
	bgt _0808DF58
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0808DF5E
	b _0808E0AE
	.align 2, 0
_0808DF54: .4byte gUnknown_20397B0
_0808DF58:
	cmp r1, 0x1
	beq _0808DF5E
	b _0808E0AE
_0808DF5E:
	bl sub_808FD20
	b _0808E010
_0808DF64:
	bl sub_808FD20
	bl sub_809328C
	bl sub_8093194
	b _0808E074
_0808DF72:
	bl sub_8093420
	bl sub_80931EC
	lsls r0, 24
	cmp r0, 0
	beq _0808DF82
	b _0808E0AE
_0808DF82:
	b _0808DF8A
_0808DF84:
	cmp r0, 0
	bne _0808DF8A
	b _0808E088
_0808DF8A:
	bl sub_8093420
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0808DF84
	b _0808E074
_0808DF98:
	bl sub_8093218
	bl sub_808F1D0
	movs r0, 0xA
	b _0808E070
_0808DFA4:
	ldr r0, _0808DFB8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	bne _0808DFB2
	b _0808E0AE
_0808DFB2:
	movs r0, 0xB
	b _0808E070
	.align 2, 0
_0808DFB8: .4byte gMain
_0808DFBC:
	ldr r0, _0808DFE0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E0AE
	bl sub_808FD20
	ldr r0, _0808DFE4 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808DFE8
	bl CompactPartySlots
	bl sub_80909F4
	b _0808E074
	.align 2, 0
_0808DFE0: .4byte gMain
_0808DFE4: .4byte gUnknown_20397B4
_0808DFE8:
	ldr r0, _0808DFF4 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x7
	strb r0, [r1]
	b _0808E0AE
	.align 2, 0
_0808DFF4: .4byte gUnknown_20397B0
_0808DFF8:
	bl sub_8090A60
	lsls r0, 24
	cmp r0, 0
	bne _0808E0AE
	bl sub_8092F54
	bl BoxSetMosaic
	bl sub_808FAA8
	b _0808E074
_0808E010:
	ldr r0, _0808E018 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808E0AE
	.align 2, 0
_0808E018: .4byte sub_808D2BC
_0808E01C:
	movs r0, 0xA
	b _0808E070
_0808E020:
	ldr r0, _0808E030 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E0AE
	movs r0, 0x15
	b _0808E070
	.align 2, 0
_0808E030: .4byte gMain
_0808E034:
	ldr r0, _0808E04C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E0AE
	bl sub_808FD20
	bl sub_8091114
	b _0808E074
	.align 2, 0
_0808E04C: .4byte gMain
_0808E050:
	bl sub_8091150
	lsls r0, 24
	cmp r0, 0
	bne _0808E0AE
	bl sub_8093264
	movs r0, 0x13
	b _0808E070
_0808E062:
	ldr r0, _0808E080 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E0AE
	movs r0, 0x14
_0808E070:
	bl sub_808FBA4
_0808E074:
	ldr r0, _0808E084 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E0AE
	.align 2, 0
_0808E080: .4byte gMain
_0808E084: .4byte gUnknown_20397B0
_0808E088:
	ldr r0, _0808E094 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x8
	strb r0, [r1]
	b _0808E0AE
	.align 2, 0
_0808E094: .4byte gUnknown_20397B0
_0808E098:
	ldr r0, _0808E0B4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E0AE
	bl sub_808FD20
	ldr r0, _0808E0B8 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E0AE:
	pop {r0}
	bx r0
	.align 2, 0
_0808E0B4: .4byte gMain
_0808E0B8: .4byte sub_808D2BC
	thumb_func_end sub_808DECC

	thumb_func_start sub_808E0BC
sub_808E0BC: @ 808E0BC
	push {r4,lr}
	ldr r4, _0808E0D0 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808E0D4
	cmp r0, 0x1
	beq _0808E108
	b _0808E130
	.align 2, 0
_0808E0D0: .4byte gUnknown_20397B0
_0808E0D4:
	movs r0, 0xC
	bl sub_808FBA4
	ldr r0, [r4]
	ldr r2, _0808E100 @ =0x00000ce7
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r3, _0808E104 @ =0x00000da4
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r2
	ldrb r0, [r0]
	movs r1, 0xB0
	movs r2, 0x10
	bl sub_80BE604
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E130
	.align 2, 0
_0808E100: .4byte 0x00000ce7
_0808E104: .4byte 0x00000da4
_0808E108:
	bl sub_80BE6F0
	lsls r0, 24
	cmp r0, 0
	bne _0808E130
	bl sub_80BE658
	bl sub_808FD20
	ldr r0, [r4]
	ldr r1, _0808E138 @ =0x00000da4
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8093878
	bl sub_808F1D0
	ldr r0, _0808E13C @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E130:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E138: .4byte 0x00000da4
_0808E13C: .4byte sub_808D2BC
	thumb_func_end sub_808E0BC

	thumb_func_start sub_808E140
sub_808E140: @ 808E140
	push {r4,r5,lr}
	ldr r5, _0808E158 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldrb r1, [r0]
	cmp r1, 0x1
	beq _0808E18C
	cmp r1, 0x1
	bgt _0808E15C
	cmp r1, 0
	beq _0808E166
	b _0808E1EA
	.align 2, 0
_0808E158: .4byte gUnknown_20397B0
_0808E15C:
	cmp r1, 0x2
	beq _0808E1B4
	cmp r1, 0x3
	beq _0808E1DA
	b _0808E1EA
_0808E166:
	ldr r1, _0808E17C @ =0x00000ce2
	adds r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	bne _0808E180
	bl sub_808FD20
	b _0808E1D0
	.align 2, 0
_0808E17C: .4byte 0x00000ce2
_0808E180:
	ldr r0, _0808E188 @ =sub_808E6D0
	bl add_to_c3_somehow
	b _0808E1EA
	.align 2, 0
_0808E188: .4byte sub_808E6D0
_0808E18C:
	movs r0, 0x2
	bl sub_8094D14
	ldr r0, _0808E1B0 @ =gUnknown_20397B4
	ldrb r0, [r0]
	negs r4, r0
	orrs r4, r0
	lsrs r4, 31
	bl sub_8094CC8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8095D84
	b _0808E1D0
	.align 2, 0
_0808E1B0: .4byte gUnknown_20397B4
_0808E1B4:
	bl sub_809610C
	lsls r0, 24
	cmp r0, 0
	bne _0808E1EA
	movs r0, 0x3
	bl sub_8094D14
	bl sub_808FD20
	bl sub_8092F54
	bl sub_808F49C
_0808E1D0:
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E1EA
_0808E1DA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E1EA
	ldr r0, _0808E1F0 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E1EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E1F0: .4byte sub_808D2BC
	thumb_func_end sub_808E140

	thumb_func_start sub_808E1F4
sub_808E1F4: @ 808E1F4
	push {r4,lr}
	ldr r0, _0808E20C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0808E2A4
	lsls r0, 2
	ldr r1, _0808E210 @ =_0808E214
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E20C: .4byte gUnknown_20397B0
_0808E210: .4byte _0808E214
	.align 2, 0
_0808E214:
	.4byte _0808E27C
	.4byte _0808E228
	.4byte _0808E250
	.4byte _0808E270
	.4byte _0808E294
_0808E228:
	movs r0, 0x2
	bl sub_8094D14
	ldr r0, _0808E24C @ =gUnknown_20397B4
	ldrb r0, [r0]
	negs r4, r0
	orrs r4, r0
	lsrs r4, 31
	bl sub_8094CC8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8095F74
	b _0808E280
	.align 2, 0
_0808E24C: .4byte gUnknown_20397B4
_0808E250:
	bl sub_809610C
	lsls r0, 24
	cmp r0, 0
	bne _0808E2A4
	movs r0, 0
	bl sub_8094D14
	bl sub_8092F54
	bl sub_808F49C
	movs r0, 0x1C
	bl sub_808FBA4
	b _0808E280
_0808E270:
	ldr r0, _0808E28C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E2A4
_0808E27C:
	bl sub_808FD20
_0808E280:
	ldr r0, _0808E290 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E2A4
	.align 2, 0
_0808E28C: .4byte gMain
_0808E290: .4byte gUnknown_20397B0
_0808E294:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E2A4
	ldr r0, _0808E2AC @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E2A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E2AC: .4byte sub_808D2BC
	thumb_func_end sub_808E1F4

	thumb_func_start sub_808E2B0
sub_808E2B0: @ 808E2B0
	push {r4,r5,lr}
	ldr r1, _0808E2CC @ =gUnknown_20397B0
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x4
	bls _0808E2C0
	b _0808E3BA
_0808E2C0:
	lsls r0, 2
	ldr r1, _0808E2D0 @ =_0808E2D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E2CC: .4byte gUnknown_20397B0
_0808E2D0: .4byte _0808E2D4
	.align 2, 0
_0808E2D4:
	.4byte _0808E2E8
	.4byte _0808E340
	.4byte _0808E360
	.4byte _0808E3A4
	.4byte _0808E38C
_0808E2E8:
	ldr r0, [r5]
	ldr r1, _0808E310 @ =0x00000ce2
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _0808E314
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0x1A
	bl sub_808FBA4
	ldr r1, [r5]
	movs r0, 0x3
	strb r0, [r1]
	b _0808E3BA
	.align 2, 0
_0808E310: .4byte 0x00000ce2
_0808E314:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808E33C @ =gUnknown_20397B4
	ldrb r0, [r0]
	negs r4, r0
	orrs r4, r0
	lsrs r4, 31
	bl sub_8094CC8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8096008
	ldr r1, [r5]
	movs r0, 0x1
	strb r0, [r1]
	b _0808E3BA
	.align 2, 0
_0808E33C: .4byte gUnknown_20397B4
_0808E340:
	bl sub_809610C
	lsls r0, 24
	cmp r0, 0
	bne _0808E3BA
	movs r0, 0x19
	bl sub_808FBA4
	ldr r0, _0808E35C @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x2
	strb r0, [r1]
	b _0808E3BA
	.align 2, 0
_0808E35C: .4byte gUnknown_20397B0
_0808E360:
	ldr r0, _0808E384 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E3BA
	bl sub_808FD20
	bl sub_8092F54
	bl sub_808F49C
	ldr r0, _0808E388 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x4
	strb r0, [r1]
	b _0808E3BA
	.align 2, 0
_0808E384: .4byte gMain
_0808E388: .4byte gUnknown_20397B0
_0808E38C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E3BA
	ldr r0, _0808E3A0 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808E3BA
	.align 2, 0
_0808E3A0: .4byte sub_808D2BC
_0808E3A4:
	ldr r0, _0808E3C0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E3BA
	bl sub_808FD20
	ldr r0, _0808E3C4 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E3BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E3C0: .4byte gMain
_0808E3C4: .4byte sub_808D2BC
	thumb_func_end sub_808E2B0

	thumb_func_start sub_808E3C8
sub_808E3C8: @ 808E3C8
	push {r4,lr}
	ldr r1, _0808E3E0 @ =gUnknown_20397B0
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _0808E4A4
	lsls r0, 2
	ldr r1, _0808E3E4 @ =_0808E3E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E3E0: .4byte gUnknown_20397B0
_0808E3E4: .4byte _0808E3E8
	.align 2, 0
_0808E3E8:
	.4byte _0808E3FC
	.4byte _0808E428
	.4byte _0808E450
	.4byte _0808E470
	.4byte _0808E494
_0808E3FC:
	ldr r0, [r4]
	ldr r1, _0808E418 @ =0x00000ce2
	adds r0, r1
	ldrh r0, [r0]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	bne _0808E41C
	bl sub_808FD20
	ldr r1, [r4]
	b _0808E484
	.align 2, 0
_0808E418: .4byte 0x00000ce2
_0808E41C:
	ldr r0, _0808E424 @ =sub_808E6D0
	bl add_to_c3_somehow
	b _0808E4A4
	.align 2, 0
_0808E424: .4byte sub_808E6D0
_0808E428:
	movs r0, 0x2
	bl sub_8094D14
	ldr r0, _0808E44C @ =gUnknown_20397B4
	ldrb r0, [r0]
	negs r4, r0
	orrs r4, r0
	lsrs r4, 31
	bl sub_8094CC8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8095EA0
	b _0808E480
	.align 2, 0
_0808E44C: .4byte gUnknown_20397B4
_0808E450:
	bl sub_809610C
	lsls r0, 24
	cmp r0, 0
	bne _0808E4A4
	movs r0, 0x3
	bl sub_8094D14
	bl sub_8092F54
	bl sub_808F49C
	movs r0, 0x1D
	bl sub_808FBA4
	b _0808E480
_0808E470:
	ldr r0, _0808E48C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E4A4
	bl sub_808FD20
_0808E480:
	ldr r0, _0808E490 @ =gUnknown_20397B0
	ldr r1, [r0]
_0808E484:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E4A4
	.align 2, 0
_0808E48C: .4byte gMain
_0808E490: .4byte gUnknown_20397B0
_0808E494:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E4A4
	ldr r0, _0808E4AC @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E4A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E4AC: .4byte sub_808D2BC
	thumb_func_end sub_808E3C8

	thumb_func_start sub_808E4B0
sub_808E4B0: @ 808E4B0
	push {lr}
	ldr r0, _0808E4C8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _0808E55C
	lsls r0, 2
	ldr r1, _0808E4CC @ =_0808E4D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E4C8: .4byte gUnknown_20397B0
_0808E4CC: .4byte _0808E4D0
	.align 2, 0
_0808E4D0:
	.4byte _0808E4EC
	.4byte _0808E4F2
	.4byte _0808E50C
	.4byte _0808E512
	.4byte _0808E518
	.4byte _0808E530
	.4byte _0808E54C
_0808E4EC:
	bl sub_808FD20
	b _0808E53A
_0808E4F2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E55C
	movs r0, 0x6
	bl PlaySE
	bl sub_8096694
	bl sub_80966F4
	b _0808E53A
_0808E50C:
	bl sub_8096728
	b _0808E534
_0808E512:
	bl IsDma3ManagerBusyWithBgCopy
	b _0808E534
_0808E518:
	ldr r0, _0808E52C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E55C
	movs r0, 0x6
	bl PlaySE
	b _0808E53A
	.align 2, 0
_0808E52C: .4byte gMain
_0808E530:
	bl sub_80967C0
_0808E534:
	lsls r0, 24
	cmp r0, 0
	bne _0808E55C
_0808E53A:
	ldr r0, _0808E548 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E55C
	.align 2, 0
_0808E548: .4byte gUnknown_20397B0
_0808E54C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E55C
	ldr r0, _0808E560 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E55C:
	pop {r0}
	bx r0
	.align 2, 0
_0808E560: .4byte sub_808D2BC
	thumb_func_end sub_808E4B0

	thumb_func_start sub_808E564
sub_808E564: @ 808E564
	push {r4,lr}
	ldr r0, _0808E57C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0808E572
	b _0808E67C
_0808E572:
	lsls r0, 2
	ldr r1, _0808E580 @ =_0808E584
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E57C: .4byte gUnknown_20397B0
_0808E580: .4byte _0808E584
	.align 2, 0
_0808E584:
	.4byte _0808E59C
	.4byte _0808E5BC
	.4byte _0808E61A
	.4byte _0808E63C
	.4byte _0808E650
	.4byte _0808E66C
_0808E59C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1B
	bl sub_808FBA4
	movs r0, 0
	bl sub_808FCE8
	ldr r0, _0808E5B8 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1]
	b _0808E67C
	.align 2, 0
_0808E5B8: .4byte gUnknown_20397B0
_0808E5BC:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0808E5E0
	cmp r1, 0
	bgt _0808E5D6
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0808E5DA
	b _0808E67C
_0808E5D6:
	cmp r1, 0x1
	bne _0808E67C
_0808E5DA:
	bl sub_808FD20
	b _0808E660
_0808E5E0:
	ldr r4, _0808E604 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _0808E608 @ =0x00002224
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808E60C
	bl sub_808FD20
	ldr r1, [r4]
	movs r0, 0x3
	strb r0, [r1]
	b _0808E67C
	.align 2, 0
_0808E604: .4byte gUnknown_20397B0
_0808E608: .4byte 0x00002224
_0808E60C:
	movs r0, 0x1A
	bl sub_808FBA4
	ldr r1, [r4]
	movs r0, 0x2
	strb r0, [r1]
	b _0808E67C
_0808E61A:
	ldr r0, _0808E634 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E67C
	bl sub_808FD20
	ldr r0, _0808E638 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x5
	strb r0, [r1]
	b _0808E67C
	.align 2, 0
_0808E634: .4byte gMain
_0808E638: .4byte gUnknown_20397B0
_0808E63C:
	bl sub_8096088
	ldr r0, _0808E64C @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x4
	strb r0, [r1]
	b _0808E67C
	.align 2, 0
_0808E64C: .4byte gUnknown_20397B0
_0808E650:
	bl sub_809610C
	lsls r0, 24
	cmp r0, 0
	bne _0808E67C
	movs r0, 0
	bl sub_8094D14
_0808E660:
	ldr r0, _0808E668 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808E67C
	.align 2, 0
_0808E668: .4byte sub_808D2BC
_0808E66C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E67C
	ldr r0, _0808E684 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E67C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E684: .4byte sub_808D2BC
	thumb_func_end sub_808E564

	thumb_func_start sub_808E688
sub_808E688: @ 808E688
	push {r4,lr}
	ldr r4, _0808E69C @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808E6A0
	cmp r0, 0x1
	beq _0808E6B2
	b _0808E6C6
	.align 2, 0
_0808E69C: .4byte gUnknown_20397B0
_0808E6A0:
	bl CompactPartySlots
	bl sub_80909F4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E6C6
_0808E6B2:
	bl sub_8090A60
	lsls r0, 24
	cmp r0, 0
	bne _0808E6C6
	bl sub_808FAA8
	ldr r0, _0808E6CC @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E6C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E6CC: .4byte sub_808D2BC
	thumb_func_end sub_808E688

	thumb_func_start sub_808E6D0
sub_808E6D0: @ 808E6D0
	push {r4,lr}
	ldr r4, _0808E6E8 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808E6FE
	cmp r0, 0x1
	bgt _0808E6EC
	cmp r0, 0
	beq _0808E6F6
	b _0808E738
	.align 2, 0
_0808E6E8: .4byte gUnknown_20397B0
_0808E6EC:
	cmp r0, 0x2
	beq _0808E70A
	cmp r0, 0x3
	beq _0808E728
	b _0808E738
_0808E6F6:
	movs r0, 0x1E
	bl sub_808FBA4
	b _0808E71A
_0808E6FE:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E738
	b _0808E71A
_0808E70A:
	ldr r0, _0808E724 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808E738
	bl sub_808FD20
_0808E71A:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E738
	.align 2, 0
_0808E724: .4byte gMain
_0808E728:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E738
	ldr r0, _0808E740 @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E740: .4byte sub_808D2BC
	thumb_func_end sub_808E6D0

	thumb_func_start box_related
box_related: @ 808E744
	push {r4,lr}
	ldr r4, _0808E75C @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808E77A
	cmp r0, 0x1
	bgt _0808E760
	cmp r0, 0
	beq _0808E766
	b _0808E830
	.align 2, 0
_0808E75C: .4byte gUnknown_20397B0
_0808E760:
	cmp r0, 0x2
	beq _0808E78C
	b _0808E830
_0808E766:
	movs r0, 0x1
	bl sub_808FBA4
	bl sub_8094E88
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E830
_0808E77A:
	bl sub_8094F90
	lsls r0, 24
	cmp r0, 0
	bne _0808E830
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0808E78C:
	bl sub_8094F94
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bhi _0808E830
	lsls r0, 2
	ldr r1, _0808E7A4 @ =_0808E7A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E7A4: .4byte _0808E7A8
	.align 2, 0
_0808E7A8:
	.4byte _0808E7DC
	.4byte _0808E7DC
	.4byte _0808E830
	.4byte _0808E830
	.4byte _0808E830
	.4byte _0808E830
	.4byte _0808E830
	.4byte _0808E830
	.4byte _0808E830
	.4byte _0808E830
	.4byte _0808E820
	.4byte _0808E808
	.4byte _0808E7F4
_0808E7DC:
	movs r0, 0x1
	bl sub_80920FC
	bl sub_808FD20
	ldr r0, _0808E7F0 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808E830
	.align 2, 0
_0808E7F0: .4byte sub_808D2BC
_0808E7F4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808E804 @ =sub_808EA90
	bl add_to_c3_somehow
	b _0808E830
	.align 2, 0
_0808E804: .4byte sub_808EA90
_0808E808:
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r0, _0808E81C @ =sub_808E83C
	bl add_to_c3_somehow
	b _0808E830
	.align 2, 0
_0808E81C: .4byte sub_808E83C
_0808E820:
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r0, _0808E838 @ =sub_808E9A0
	bl add_to_c3_somehow
_0808E830:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E838: .4byte sub_808E9A0
	thumb_func_end box_related

	thumb_func_start sub_808E83C
sub_808E83C: @ 808E83C
	push {r4,r5,lr}
	ldr r0, _0808E854 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0808E84A
	b _0808E994
_0808E84A:
	lsls r0, 2
	ldr r1, _0808E858 @ =_0808E85C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E854: .4byte gUnknown_20397B0
_0808E858: .4byte _0808E85C
	.align 2, 0
_0808E85C:
	.4byte _0808E874
	.4byte _0808E888
	.4byte _0808E8A0
	.4byte _0808E8FA
	.4byte _0808E924
	.4byte _0808E97E
_0808E874:
	bl sub_808FD34
	movs r0, 0x2
	bl sub_808FBA4
	ldr r0, _0808E884 @ =gUnknown_20397B0
	ldr r1, [r0]
	b _0808E976
	.align 2, 0
_0808E884: .4byte gUnknown_20397B0
_0808E888:
	bl sub_8094F90
	lsls r0, 24
	cmp r0, 0
	beq _0808E894
	b _0808E994
_0808E894:
	ldr r0, _0808E89C @ =gUnknown_20397B0
	ldr r1, [r0]
	b _0808E976
	.align 2, 0
_0808E89C: .4byte gUnknown_20397B0
_0808E8A0:
	bl sub_8094F94
	ldr r5, _0808E8CC @ =gUnknown_20397B0
	ldr r1, [r5]
	ldr r4, _0808E8D0 @ =0x0000078e
	adds r1, r4
	strh r0, [r1]
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0808E8D8
	movs r0, 0x1
	bl sub_80920FC
	bl sub_808FD20
	ldr r0, _0808E8D4 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808E994
	.align 2, 0
_0808E8CC: .4byte gUnknown_20397B0
_0808E8D0: .4byte 0x0000078e
_0808E8D4: .4byte sub_808D2BC
_0808E8D8:
	cmp r0, r1
	blt _0808E994
	cmp r0, 0x15
	bgt _0808E994
	cmp r0, 0x12
	blt _0808E994
	movs r0, 0x5
	bl PlaySE
	bl sub_8095024
	ldr r1, [r5]
	adds r2, r1, r4
	ldrh r0, [r2]
	subs r0, 0x12
	strh r0, [r2]
	b _0808E976
_0808E8FA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0808E994
	ldr r4, _0808E91C @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _0808E920 @ =0x0000078e
	adds r0, r1
	ldrb r0, [r0]
	bl sub_808FD5C
	movs r0, 0x3
	bl sub_808FBA4
	b _0808E974
	.align 2, 0
_0808E91C: .4byte gUnknown_20397B0
_0808E920: .4byte 0x0000078e
_0808E924:
	bl sub_8094F94
	ldr r4, _0808E954 @ =gUnknown_20397B0
	ldr r1, [r4]
	movs r5, 0xF2
	lsls r5, 3
	adds r1, r5
	strh r0, [r1]
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _0808E994
	adds r0, 0x1
	cmp r1, r0
	bne _0808E958
	bl sub_808FD20
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1]
	b _0808E994
	.align 2, 0
_0808E954: .4byte gUnknown_20397B0
_0808E958:
	movs r0, 0x5
	bl PlaySE
	bl sub_808FD20
	ldr r1, [r4]
	adds r1, r5
	ldrh r0, [r1]
	subs r0, 0x16
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8091730
_0808E974:
	ldr r1, [r4]
_0808E976:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808E994
_0808E97E:
	bl sub_8091760
	lsls r0, 24
	cmp r0, 0
	bne _0808E994
	movs r0, 0x1
	bl sub_80920FC
	ldr r0, _0808E99C @ =sub_808D2BC
	bl add_to_c3_somehow
_0808E994:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E99C: .4byte sub_808D2BC
	thumb_func_end sub_808E83C

	thumb_func_start sub_808E9A0
sub_808E9A0: @ 808E9A0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _0808E9B8 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldrb r4, [r0]
	cmp r4, 0x1
	beq _0808E9F4
	cmp r4, 0x1
	bgt _0808E9BC
	cmp r4, 0
	beq _0808E9C6
	b _0808EA80
	.align 2, 0
_0808E9B8: .4byte gUnknown_20397B0
_0808E9BC:
	cmp r4, 0x2
	beq _0808EA4C
	cmp r4, 0x3
	beq _0808EA64
	b _0808EA80
_0808E9C6:
	movs r0, 0x5
	bl sub_808FBA4
	ldr r0, [r5]
	ldr r1, _0808E9EC @ =0x00001e58
	adds r0, r1
	ldr r2, _0808E9F0 @ =0x0000dac7
	str r4, [sp]
	movs r1, 0xA
	movs r3, 0x3
	bl sub_808C854
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	bl sub_808C940
	b _0808EA56
	.align 2, 0
_0808E9EC: .4byte 0x00001e58
_0808E9F0: .4byte 0x0000dac7
_0808E9F4:
	bl sub_808C95C
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0808EA44 @ =0x000002ca
	adds r1, r2
	strh r0, [r1]
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xC8
	beq _0808EA80
	bl sub_808FD20
	bl sub_808C950
	bl sub_808C8FC
	ldr r0, [r5]
	ldr r2, _0808EA44 @ =0x000002ca
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xC9
	beq _0808EA34
	adds r4, r0, 0
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0808EA56
_0808EA34:
	movs r0, 0x1
	bl sub_80920FC
	ldr r0, _0808EA48 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808EA80
	.align 2, 0
_0808EA44: .4byte 0x000002ca
_0808EA48: .4byte sub_808D2BC
_0808EA4C:
	ldr r1, _0808EA60 @ =0x000002ca
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8091514
_0808EA56:
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808EA80
	.align 2, 0
_0808EA60: .4byte 0x000002ca
_0808EA64:
	bl sub_80915FC
	lsls r0, 24
	cmp r0, 0
	bne _0808EA80
	ldr r0, [r5]
	ldr r2, _0808EA88 @ =0x000002ca
	adds r0, r2
	ldrb r0, [r0]
	bl sub_808BA00
	ldr r0, _0808EA8C @ =sub_808D2BC
	bl add_to_c3_somehow
_0808EA80:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EA88: .4byte 0x000002ca
_0808EA8C: .4byte sub_808D2BC
	thumb_func_end sub_808E9A0

	thumb_func_start sub_808EA90
sub_808EA90: @ 808EA90
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _0808EAA4 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldrb r4, [r0]
	cmp r4, 0
	beq _0808EAA8
	cmp r4, 0x1
	beq _0808EAC6
	b _0808EAE0
	.align 2, 0
_0808EAA4: .4byte gUnknown_20397B0
_0808EAA8:
	bl sub_8093630
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808EAE0
_0808EAC6:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0808EAE0
	ldr r0, _0808EAE8 @ =gUnknown_20397B7
	strb r4, [r0]
	ldr r1, [r5]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	ldr r0, _0808EAEC @ =sub_808EE18
	bl add_to_c3_somehow
_0808EAE0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EAE8: .4byte gUnknown_20397B7
_0808EAEC: .4byte sub_808EE18
	thumb_func_end sub_808EA90

	thumb_func_start sub_808EAF0
sub_808EAF0: @ 808EAF0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _0808EB04 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldrb r4, [r0]
	cmp r4, 0
	beq _0808EB08
	cmp r4, 0x1
	beq _0808EB26
	b _0808EB40
	.align 2, 0
_0808EB04: .4byte gUnknown_20397B0
_0808EB08:
	bl sub_80936B8
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808EB40
_0808EB26:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0808EB40
	ldr r0, _0808EB48 @ =gUnknown_20397B7
	strb r1, [r0]
	ldr r0, [r5]
	strb r4, [r0, 0x2]
	ldr r0, _0808EB4C @ =sub_808EE18
	bl add_to_c3_somehow
_0808EB40:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EB48: .4byte gUnknown_20397B7
_0808EB4C: .4byte sub_808EE18
	thumb_func_end sub_808EAF0

	thumb_func_start sub_808EB50
sub_808EB50: @ 808EB50
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _0808EB64 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldrb r1, [r0]
	cmp r1, 0
	beq _0808EB68
	cmp r1, 0x1
	beq _0808EB82
	b _0808EB9E
	.align 2, 0
_0808EB64: .4byte gUnknown_20397B0
_0808EB68:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808EB9E
_0808EB82:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0808EB9E
	ldr r1, _0808EBA8 @ =gUnknown_20397B7
	movs r0, 0x2
	strb r0, [r1]
	ldr r1, [r4]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	ldr r0, _0808EBAC @ =sub_808EE18
	bl add_to_c3_somehow
_0808EB9E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EBA8: .4byte gUnknown_20397B7
_0808EBAC: .4byte sub_808EE18
	thumb_func_end sub_808EB50

	thumb_func_start sub_808EBB0
sub_808EBB0: @ 808EBB0
	push {r4,lr}
	ldr r0, _0808EBC8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0808EBBE
	b _0808ECD0
_0808EBBE:
	lsls r0, 2
	ldr r1, _0808EBCC @ =_0808EBD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808EBC8: .4byte gUnknown_20397B0
_0808EBCC: .4byte _0808EBD0
	.align 2, 0
_0808EBD0:
	.4byte _0808EBE4
	.4byte _0808EC40
	.4byte _0808EC54
	.4byte _0808EC90
	.4byte _0808ECAC
_0808EBE4:
	bl sub_80939A0
	lsls r0, 24
	cmp r0, 0
	beq _0808EC08
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0xF
	bl sub_808FBA4
	ldr r0, _0808EC04 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1]
	b _0808ECD0
	.align 2, 0
_0808EC04: .4byte gUnknown_20397B0
_0808EC08:
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	beq _0808EC20
	ldr r0, _0808EC1C @ =sub_808E564
	bl add_to_c3_somehow
	b _0808ECD0
	.align 2, 0
_0808EC1C: .4byte sub_808E564
_0808EC20:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_808FBA4
	movs r0, 0
	bl sub_808FCE8
	ldr r0, _0808EC3C @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x2
	strb r0, [r1]
	b _0808ECD0
	.align 2, 0
_0808EC3C: .4byte gUnknown_20397B0
_0808EC40:
	ldr r0, _0808EC50 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808ECD0
	b _0808EC72
	.align 2, 0
_0808EC50: .4byte gMain
_0808EC54:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0808EC84
	cmp r1, 0
	bgt _0808EC6E
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0808EC72
	b _0808ECD0
_0808EC6E:
	cmp r1, 0x1
	bne _0808ECD0
_0808EC72:
	bl sub_808FD20
	ldr r0, _0808EC80 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808ECD0
	.align 2, 0
_0808EC80: .4byte sub_808D2BC
_0808EC84:
	movs r0, 0x3
	bl PlaySE
	bl sub_808FD20
	b _0808EC9A
_0808EC90:
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1
	bl sub_80A0A70
_0808EC9A:
	ldr r0, _0808ECA8 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808ECD0
	.align 2, 0
_0808ECA8: .4byte gUnknown_20397B0
_0808ECAC:
	bl sub_80A0AAC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0808ECD0
	bl sub_808FF70
	bl CalculatePlayerPartyCount
	ldr r1, _0808ECD8 @ =gPlayerPartyCount
	strb r0, [r1]
	ldr r0, _0808ECDC @ =gUnknown_20397B0
	ldr r0, [r0]
	strb r4, [r0, 0x2]
	ldr r0, _0808ECE0 @ =sub_808EE18
	bl add_to_c3_somehow
_0808ECD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECD8: .4byte gPlayerPartyCount
_0808ECDC: .4byte gUnknown_20397B0
_0808ECE0: .4byte sub_808EE18
	thumb_func_end sub_808EBB0

	thumb_func_start sub_808ECE4
sub_808ECE4: @ 808ECE4
	push {r4,lr}
	ldr r0, _0808ECFC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0808ECF2
	b _0808EE04
_0808ECF2:
	lsls r0, 2
	ldr r1, _0808ED00 @ =_0808ED04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808ECFC: .4byte gUnknown_20397B0
_0808ED00: .4byte _0808ED04
	.align 2, 0
_0808ED04:
	.4byte _0808ED18
	.4byte _0808ED74
	.4byte _0808ED88
	.4byte _0808EDC4
	.4byte _0808EDE0
_0808ED18:
	bl sub_80939A0
	lsls r0, 24
	cmp r0, 0
	beq _0808ED3C
	movs r0, 0x1A
	bl PlaySE
	movs r0, 0xF
	bl sub_808FBA4
	ldr r0, _0808ED38 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1]
	b _0808EE04
	.align 2, 0
_0808ED38: .4byte gUnknown_20397B0
_0808ED3C:
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	beq _0808ED54
	ldr r0, _0808ED50 @ =sub_808E564
	bl add_to_c3_somehow
	b _0808EE04
	.align 2, 0
_0808ED50: .4byte sub_808E564
_0808ED54:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x12
	bl sub_808FBA4
	movs r0, 0
	bl sub_808FCE8
	ldr r0, _0808ED70 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0x2
	strb r0, [r1]
	b _0808EE04
	.align 2, 0
_0808ED70: .4byte gUnknown_20397B0
_0808ED74:
	ldr r0, _0808ED84 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0808EE04
	b _0808EDA8
	.align 2, 0
_0808ED84: .4byte gMain
_0808ED88:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0808EDA8
	cmp r1, 0
	bgt _0808EDA2
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0808EDB8
	b _0808EE04
_0808EDA2:
	cmp r1, 0x1
	beq _0808EDB8
	b _0808EE04
_0808EDA8:
	bl sub_808FD20
	ldr r0, _0808EDB4 @ =sub_808D2BC
	bl add_to_c3_somehow
	b _0808EE04
	.align 2, 0
_0808EDB4: .4byte sub_808D2BC
_0808EDB8:
	movs r0, 0x3
	bl PlaySE
	bl sub_808FD20
	b _0808EDCE
_0808EDC4:
	movs r0, 0x14
	movs r1, 0
	movs r2, 0
	bl sub_80A0A70
_0808EDCE:
	ldr r0, _0808EDDC @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808EE04
	.align 2, 0
_0808EDDC: .4byte gUnknown_20397B0
_0808EDE0:
	bl sub_80A0AAC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0808EE04
	bl sub_808FF70
	bl CalculatePlayerPartyCount
	ldr r1, _0808EE0C @ =gPlayerPartyCount
	strb r0, [r1]
	ldr r0, _0808EE10 @ =gUnknown_20397B0
	ldr r0, [r0]
	strb r4, [r0, 0x2]
	ldr r0, _0808EE14 @ =sub_808EE18
	bl add_to_c3_somehow
_0808EE04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EE0C: .4byte gPlayerPartyCount
_0808EE10: .4byte gUnknown_20397B0
_0808EE14: .4byte sub_808EE18
	thumb_func_end sub_808ECE4

	thumb_func_start sub_808EE18
sub_808EE18: @ 808EE18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0808EE44 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r4, [r0, 0x2]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _0808EE4C
	bl sub_809616C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808EE4C
	bl sub_80961C4
	ldr r1, _0808EE48 @ =gUnknown_20397BA
	b _0808EE50
	.align 2, 0
_0808EE44: .4byte gUnknown_20397B0
_0808EE48: .4byte gUnknown_20397BA
_0808EE4C:
	ldr r1, _0808EE70 @ =gUnknown_20397BA
	movs r0, 0
_0808EE50:
	strh r0, [r1]
	cmp r4, 0x1
	beq _0808EE78
	cmp r4, 0x1
	ble _0808EE62
	cmp r4, 0x2
	beq _0808EEBC
	cmp r4, 0x3
	beq _0808EEE8
_0808EE62:
	bl sub_808EF68
	ldr r0, _0808EE74 @ =sub_808C7B4
	bl SetMainCallback2
	b _0808EEF6
	.align 2, 0
_0808EE70: .4byte gUnknown_20397BA
_0808EE74: .4byte sub_808C7B4
_0808EE78:
	ldr r0, _0808EEAC @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _0808EEB0 @ =0x0000217c
	adds r0, r1, r2
	ldr r0, [r0]
	mov r8, r0
	subs r2, 0x3
	adds r0, r1, r2
	ldrb r6, [r0]
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r5, [r0]
	ldr r0, _0808EEB4 @ =0x0000217a
	adds r1, r0
	ldrb r4, [r1]
	bl sub_808EF68
	ldr r3, _0808EEB8 @ =sub_808CE60
	str r4, [sp]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_81344F8
	b _0808EEF6
	.align 2, 0
_0808EEAC: .4byte gUnknown_20397B0
_0808EEB0: .4byte 0x0000217c
_0808EEB4: .4byte 0x0000217a
_0808EEB8: .4byte sub_808CE60
_0808EEBC:
	bl sub_808EF68
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	bl GetBoxNamePtr
	adds r1, r0, 0
	movs r0, 0
	str r0, [sp]
	ldr r0, _0808EEE4 @ =sub_808CE60
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DoNamingScreen
	b _0808EEF6
	.align 2, 0
_0808EEE4: .4byte sub_808CE60
_0808EEE8:
	bl sub_808EF68
	ldr r2, _0808EF08 @ =sub_808CE60
	movs r0, 0x4
	movs r1, 0
	bl sub_8107DB4
_0808EEF6:
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EF08: .4byte sub_808CE60
	thumb_func_end sub_808EE18

	thumb_func_start sub_808EF0C
sub_808EF0C: @ 808EF0C
	push {lr}
	sub sp, 0x4
	ldr r0, _0808EF40 @ =gSpecialVar_ItemId
	ldrh r1, [r0]
	mov r0, sp
	strh r1, [r0]
	cmp r1, 0
	beq _0808EF60
	bl sub_8094CC8
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0808EF44 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808EF4C
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808EF48 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	b _0808EF56
	.align 2, 0
_0808EF40: .4byte gSpecialVar_ItemId
_0808EF44: .4byte gUnknown_20397B4
_0808EF48: .4byte gPlayerParty
_0808EF4C:
	adds r0, r1, 0
	movs r1, 0xC
	mov r2, sp
	bl SetBoxMonDataFromSelectedBox
_0808EF56:
	mov r0, sp
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
_0808EF60:
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_808EF0C

	thumb_func_start sub_808EF68
sub_808EF68: @ 808EF68
	push {r4,lr}
	bl sub_80F7B2C
	bl sub_80950A4
	ldr r4, _0808EF88 @ =gUnknown_20397B0
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
	bl FreeAllWindowBuffers
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EF88: .4byte gUnknown_20397B0
	thumb_func_end sub_808EF68

	thumb_func_start sub_808EF8C
sub_808EF8C: @ 808EF8C
	push {lr}
	sub sp, 0x4
	ldr r1, _0808EFB8 @ =0x00001f0f
	movs r0, 0xE
	bl SetGpuReg
	ldr r1, _0808EFBC @ =gUnknown_83CE438
	movs r0, 0
	str r0, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _0808EFC0 @ =gUnknown_83CE4D0
	ldr r1, _0808EFC4 @ =0x0600f800
	bl LZ77UnCompVram
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808EFB8: .4byte 0x00001f0f
_0808EFBC: .4byte gUnknown_83CE438
_0808EFC0: .4byte gUnknown_83CE4D0
_0808EFC4: .4byte 0x0600f800
	thumb_func_end sub_808EF8C

	thumb_func_start sub_808EFC8
sub_808EFC8: @ 808EFC8
	push {lr}
	movs r0, 0x3
	movs r1, 0x80
	movs r2, 0x1
	bl ChangeBgX
	movs r0, 0x3
	movs r1, 0x80
	movs r2, 0x2
	bl ChangeBgY
	pop {r0}
	bx r0
	thumb_func_end sub_808EFC8

	thumb_func_start sub_808EFE4
sub_808EFE4: @ 808EFE4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _0808F030 @ =gUnknown_83CEA50
	movs r0, 0
	movs r2, 0x4
	bl InitBgsFromTemplates
	ldr r1, _0808F034 @ =gUnknown_8E9C438
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _0808F038 @ =gUnknown_83CE5FC
	ldr r5, _0808F03C @ =gUnknown_20397B0
	ldr r1, [r5]
	ldr r4, _0808F040 @ =0x00005abc
	adds r1, r4
	bl LZ77UnCompWram
	ldr r1, [r5]
	adds r1, r4
	movs r0, 0x1
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F030: .4byte gUnknown_83CEA50
_0808F034: .4byte gUnknown_8E9C438
_0808F038: .4byte gUnknown_83CE5FC
_0808F03C: .4byte gUnknown_20397B0
_0808F040: .4byte 0x00005abc
	thumb_func_end sub_808EFE4

	thumb_func_start sub_808F044
sub_808F044: @ 808F044
	push {lr}
	ldr r0, _0808F05C @ =gUnknown_83CEA30
	bl InitWindows
	lsls r0, 16
	cmp r0, 0
	beq _0808F060
	bl DeactivateAllTextPrinters
	movs r0, 0x1
	b _0808F062
	.align 2, 0
_0808F05C: .4byte gUnknown_83CEA30
_0808F060:
	movs r0, 0
_0808F062:
	pop {r1}
	bx r1
	thumb_func_end sub_808F044

	thumb_func_start sub_808F068
sub_808F068: @ 808F068
	push {lr}
	ldr r0, _0808F074 @ =gUnknown_83CEA60
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0808F074: .4byte gUnknown_83CEA60
	thumb_func_end sub_808F068

	thumb_func_start sub_808F078
sub_808F078: @ 808F078
	push {lr}
	ldr r0, _0808F0B0 @ =gUnknown_8E9C3F8
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0808F0B4 @ =gUnknown_8E9C418
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0808F0B8 @ =gUnknown_83CEA10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0808F0BC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	beq _0808F0C4
	ldr r0, _0808F0C0 @ =gUnknown_83CE738
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	b _0808F0CE
	.align 2, 0
_0808F0B0: .4byte gUnknown_8E9C3F8
_0808F0B4: .4byte gUnknown_8E9C418
_0808F0B8: .4byte gUnknown_83CEA10
_0808F0BC: .4byte gUnknown_20397B0
_0808F0C0: .4byte gUnknown_83CE738
_0808F0C4:
	ldr r0, _0808F0EC @ =gUnknown_83CE758
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
_0808F0CE:
	ldr r1, _0808F0F0 @ =0x00001e05
	movs r0, 0xA
	bl SetGpuReg
	bl sub_808F2BC
	bl sub_808F0F4
	bl sub_808F164
	bl sub_808F1D0
	pop {r0}
	bx r0
	.align 2, 0
_0808F0EC: .4byte gUnknown_83CE758
_0808F0F0: .4byte 0x00001e05
	thumb_func_end sub_808F078

	thumb_func_start sub_808F0F4
sub_808F0F4: @ 808F0F4
	push {r4,lr}
	ldr r1, _0808F154 @ =0x0000dac8
	movs r0, 0x10
	movs r2, 0
	bl sub_80BEB00
	ldr r4, _0808F158 @ =gUnknown_20397B0
	ldr r1, [r4]
	movs r3, 0xD9
	lsls r3, 4
	adds r1, r3
	str r0, [r1]
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r0, [r4]
	adds r0, r3
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r3
	ldr r2, [r0]
	movs r1, 0x28
	strh r1, [r2, 0x20]
	ldr r1, [r0]
	movs r0, 0x96
	strh r0, [r1, 0x22]
	movs r0, 0x10
	bl GetSpriteTileStartByTag
	ldr r1, [r4]
	ldr r2, _0808F15C @ =0x00000d9c
	adds r1, r2
	lsls r0, 16
	lsrs r0, 11
	ldr r2, _0808F160 @ =0x06010000
	adds r0, r2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F154: .4byte 0x0000dac8
_0808F158: .4byte gUnknown_20397B0
_0808F15C: .4byte 0x00000d9c
_0808F160: .4byte 0x06010000
	thumb_func_end sub_808F0F4

	thumb_func_start sub_808F164
sub_808F164: @ 808F164
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _0808F1BC @ =gUnknown_83CEA68
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r4, 0
_0808F17A:
	lsls r1, r4, 6
	subs r1, r4
	adds r1, 0x8
	lsls r1, 16
	asrs r1, 16
	ldr r0, _0808F1C0 @ =gUnknown_83CEBD8
	movs r2, 0x9
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808F1C4 @ =gUnknown_20397B0
	ldr r2, [r1]
	lsls r1, r4, 2
	ldr r3, _0808F1C8 @ =0x00000d94
	adds r2, r3
	adds r2, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0808F1CC @ =gSprites
	adds r1, r0
	str r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _0808F17A
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F1BC: .4byte gUnknown_83CEA68
_0808F1C0: .4byte gUnknown_83CEBD8
_0808F1C4: .4byte gUnknown_20397B0
_0808F1C8: .4byte 0x00000d94
_0808F1CC: .4byte gSprites
	thumb_func_end sub_808F164

	thumb_func_start sub_808F1D0
sub_808F1D0: @ 808F1D0
	push {lr}
	ldr r0, _0808F1FC @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r2, 0xCE
	lsls r2, 4
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r2, 0x4
	adds r1, r2
	ldr r1, [r1]
	bl sub_808F3F8
	bl sub_808F49C
	bl sub_808F5E8
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	pop {r0}
	bx r0
	.align 2, 0
_0808F1FC: .4byte gUnknown_20397B0
	thumb_func_end sub_808F1D0

	thumb_func_start BoxSetMosaic
BoxSetMosaic: @ 808F200
	push {lr}
	bl sub_808F1D0
	ldr r3, _0808F24C @ =gUnknown_20397B0
	ldr r0, [r3]
	ldr r1, _0808F250 @ =0x00002238
	adds r0, r1
	ldr r2, [r0]
	cmp r2, 0
	beq _0808F248
	ldrb r0, [r2, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r1, [r3]
	ldr r0, _0808F250 @ =0x00002238
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0xA
	strh r0, [r2, 0x2E]
	ldr r2, [r1]
	movs r0, 0x1
	strh r0, [r2, 0x30]
	ldr r2, [r1]
	ldr r0, _0808F254 @ =BoxSetMosaic2
	str r0, [r2, 0x1C]
	ldr r0, [r1]
	ldrh r0, [r0, 0x2E]
	lsls r1, r0, 12
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4C
	bl SetGpuReg
_0808F248:
	pop {r0}
	bx r0
	.align 2, 0
_0808F24C: .4byte gUnknown_20397B0
_0808F250: .4byte 0x00002238
_0808F254: .4byte BoxSetMosaic2
	thumb_func_end BoxSetMosaic

	thumb_func_start sub_808F258
sub_808F258: @ 808F258
	ldr r0, _0808F26C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0808F270 @ =0x00002238
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_0808F26C: .4byte gUnknown_20397B0
_0808F270: .4byte 0x00002238
	thumb_func_end sub_808F258

	thumb_func_start BoxSetMosaic2
BoxSetMosaic2: @ 808F274
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	subs r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bge _0808F28A
	movs r0, 0
	strh r0, [r4, 0x2E]
_0808F28A:
	ldrh r0, [r4, 0x2E]
	lsls r1, r0, 12
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x4C
	bl SetGpuReg
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808F2B2
	ldrb r0, [r4, 0x1]
	movs r1, 0x11
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x1]
	ldr r0, _0808F2B8 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0808F2B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F2B8: .4byte SpriteCallbackDummy
	thumb_func_end BoxSetMosaic2

	thumb_func_start sub_808F2BC
sub_808F2BC: @ 808F2BC
	push {r4-r7,lr}
	sub sp, 0x28
	ldr r0, _0808F350 @ =gUnknown_20397B0
	mov r12, r0
	ldr r1, [r0]
	ldr r4, _0808F354 @ =0x000022bc
	adds r0, r1, r4
	str r0, [sp, 0x18]
	add r3, sp, 0x18
	movs r0, 0x82
	lsls r0, 10
	str r0, [r3, 0x4]
	ldr r5, _0808F358 @ =0x0000223c
	adds r1, r5
	str r1, [sp, 0x20]
	ldr r0, _0808F35C @ =0x0000dac6
	add r2, sp, 0x20
	str r0, [r2, 0x4]
	mov r1, sp
	ldr r0, _0808F360 @ =gUnknown_83CEA70
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	movs r6, 0
	adds r7, r2, 0
	mov r5, r12
	movs r2, 0
	ldr r1, _0808F364 @ =0x000007ff
_0808F2F6:
	ldr r0, [r5]
	adds r0, r4
	adds r0, r6
	strb r2, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r1
	bls _0808F2F6
	movs r6, 0
	ldr r5, _0808F350 @ =gUnknown_20397B0
	ldr r4, _0808F358 @ =0x0000223c
	movs r2, 0
_0808F310:
	ldr r0, [r5]
	lsls r1, r6, 1
	adds r0, r4
	adds r0, r1
	strh r2, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0xF
	bls _0808F310
	ldr r0, _0808F350 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r6, _0808F368 @ =0x00002238
	adds r0, r6
	movs r1, 0
	str r1, [r0]
	adds r0, r3, 0
	bl LoadSpriteSheet
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _0808F3C8
	adds r0, r7, 0
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _0808F3C8
	b _0808F3B4
	.align 2, 0
_0808F350: .4byte gUnknown_20397B0
_0808F354: .4byte 0x000022bc
_0808F358: .4byte 0x0000223c
_0808F35C: .4byte 0x0000dac6
_0808F360: .4byte gUnknown_83CEA70
_0808F364: .4byte 0x000007ff
_0808F368: .4byte 0x00002238
_0808F36C:
	ldr r0, _0808F39C @ =gUnknown_20397B0
	ldr r2, [r0]
	ldr r7, _0808F3A0 @ =0x00002238
	adds r3, r2, r7
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808F3A4 @ =gSprites
	adds r0, r1
	str r0, [r3]
	lsls r0, r4, 4
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldr r3, _0808F3A8 @ =0x00002232
	adds r1, r2, r3
	strh r0, [r1]
	ldr r6, _0808F3AC @ =0x00002234
	adds r2, r6
	lsls r0, r5, 5
	ldr r7, _0808F3B0 @ =0x06010000
	adds r0, r7
	str r0, [r2]
	b _0808F3C8
	.align 2, 0
_0808F39C: .4byte gUnknown_20397B0
_0808F3A0: .4byte 0x00002238
_0808F3A4: .4byte gSprites
_0808F3A8: .4byte 0x00002232
_0808F3AC: .4byte 0x00002234
_0808F3B0: .4byte 0x06010000
_0808F3B4:
	mov r0, sp
	movs r1, 0x28
	movs r2, 0x30
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _0808F36C
_0808F3C8:
	ldr r0, _0808F3EC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0808F3F0 @ =0x00002238
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0808F3E2
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	ldr r0, _0808F3F4 @ =0x0000dac6
	bl FreeSpritePaletteByTag
_0808F3E2:
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F3EC: .4byte gUnknown_20397B0
_0808F3F0: .4byte 0x00002238
_0808F3F4: .4byte 0x0000dac6
	thumb_func_end sub_808F2BC

	thumb_func_start sub_808F3F8
sub_808F3F8: @ 808F3F8
	push {r4-r7,lr}
	adds r3, r1, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r6, _0808F468 @ =gUnknown_20397B0
	ldr r4, [r6]
	ldr r7, _0808F46C @ =0x00002238
	adds r0, r4, r7
	ldr r0, [r0]
	cmp r0, 0
	beq _0808F496
	cmp r2, 0
	beq _0808F48C
	lsls r0, r2, 3
	ldr r1, _0808F470 @ =gMonFrontPicTable
	adds r0, r1
	ldr r5, _0808F474 @ =0x000022bc
	adds r1, r4, r5
	bl HandleLoadSpecialPokePic
	ldr r1, [r6]
	ldr r2, _0808F478 @ =0x00000cd8
	adds r0, r1, r2
	ldr r0, [r0]
	ldr r4, _0808F47C @ =0x0000223c
	adds r1, r4
	bl LZ77UnCompWram
	ldr r0, [r6]
	adds r5, r0, r5
	ldr r1, _0808F480 @ =0x00002234
	adds r0, r1
	ldr r1, [r0]
	ldr r2, _0808F484 @ =0x04000200
	adds r0, r5, 0
	bl CpuSet
	ldr r0, [r6]
	adds r4, r0, r4
	ldr r2, _0808F488 @ =0x00002232
	adds r0, r2
	ldrh r1, [r0]
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, [r6]
	adds r0, r7
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _0808F496
	.align 2, 0
_0808F468: .4byte gUnknown_20397B0
_0808F46C: .4byte 0x00002238
_0808F470: .4byte gMonFrontPicTable
_0808F474: .4byte 0x000022bc
_0808F478: .4byte 0x00000cd8
_0808F47C: .4byte 0x0000223c
_0808F480: .4byte 0x00002234
_0808F484: .4byte 0x04000200
_0808F488: .4byte 0x00002232
_0808F48C:
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0808F496:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808F3F8

	thumb_func_start sub_808F49C
sub_808F49C: @ 808F49C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	movs r0, 0
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r6, _0808F51C @ =gUnknown_20397B0
	ldr r2, [r6]
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3
	beq _0808F528
	movs r4, 0
	movs r5, 0
	mov r8, r6
_0808F4BC:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0808F520 @ =0x00000cf5
	adds r0, r1
	mov r2, r8
	ldr r1, [r2]
	adds r2, r1, r0
	movs r3, 0x6
	cmp r4, 0x2
	bne _0808F4D4
	movs r3, 0xA
_0808F4D4:
	lsls r0, r5, 24
	lsrs r0, 24
	str r0, [sp]
	movs r7, 0xFF
	str r7, [sp, 0x4]
	movs r6, 0
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0x2
	bl AddTextPrinterParameterized
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	adds r0, 0xE
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0x2
	bls _0808F4BC
	ldr r0, _0808F51C @ =gUnknown_20397B0
	ldr r2, [r0]
	ldr r0, _0808F524 @ =0x00000d61
	adds r2, r0
	adds r0, r5, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	str r7, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r3, 0x6
	bl AddTextPrinterParameterized
	b _0808F57E
	.align 2, 0
_0808F51C: .4byte gUnknown_20397B0
_0808F520: .4byte 0x00000cf5
_0808F524: .4byte 0x00000d61
_0808F528:
	ldr r1, _0808F5BC @ =0x00000d61
	adds r2, r1
	movs r1, 0
	str r1, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0
	movs r3, 0x6
	bl AddTextPrinterParameterized
	movs r4, 0
	movs r5, 0xF
_0808F542:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r2, _0808F5C0 @ =0x00000cf5
	adds r0, r2
	ldr r1, [r6]
	adds r2, r1, r0
	movs r3, 0x6
	cmp r4, 0x2
	bne _0808F558
	movs r3, 0xA
_0808F558:
	lsls r0, r5, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0x2
	bl AddTextPrinterParameterized
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	adds r0, 0xE
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0x2
	bls _0808F542
_0808F57E:
	movs r0, 0
	movs r1, 0x2
	bl CopyWindowToVram
	ldr r4, _0808F5C4 @ =gUnknown_20397B0
	ldr r1, [r4]
	movs r2, 0xCE
	lsls r2, 4
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0
	beq _0808F5C8
	adds r2, 0x7
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0xB5
	adds r1, r2
	ldr r1, [r1]
	bl sub_80BEBD0
	ldr r0, [r4]
	movs r1, 0xD9
	lsls r1, 4
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _0808F5D8
	.align 2, 0
_0808F5BC: .4byte 0x00000d61
_0808F5C0: .4byte 0x00000cf5
_0808F5C4: .4byte gUnknown_20397B0
_0808F5C8:
	movs r2, 0xD9
	lsls r2, 4
	adds r0, r1, r2
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
_0808F5D8:
	strb r0, [r1]
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808F49C

	thumb_func_start sub_808F5E8
sub_808F5E8: @ 808F5E8
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0808F634 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCE
	lsls r1, 4
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0808F63C
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x8
	bl sub_80F7CE8
	movs r4, 0
_0808F60E:
	ldr r0, _0808F634 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 2
	ldr r2, _0808F638 @ =0x00000d94
	adds r0, r2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnimIfDifferent
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _0808F60E
	b _0808F66E
	.align 2, 0
_0808F634: .4byte gUnknown_20397B0
_0808F638: .4byte 0x00000d94
_0808F63C:
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x8
	bl sub_80F7CE8
	movs r4, 0
_0808F64E:
	ldr r0, _0808F684 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 2
	ldr r2, _0808F688 @ =0x00000d94
	adds r0, r2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r4, 25
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _0808F64E
_0808F66E:
	movs r0, 0
	bl sub_80F7E54
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F684: .4byte gUnknown_20397B0
_0808F688: .4byte 0x00000d94
	thumb_func_end sub_808F5E8

	thumb_func_start sub_808F68C
sub_808F68C: @ 808F68C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0808F704 @ =gUnknown_8E9CAEC
	ldr r4, _0808F708 @ =gUnknown_20397B0
	ldr r1, [r4]
	adds r1, 0xB0
	bl LZ77UnCompWram
	ldr r0, _0808F70C @ =gUnknown_8E9C3D8
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r2, [r4]
	adds r2, 0xB0
	movs r0, 0x16
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r3, 0xC
	bl sub_80F7B80
	ldr r2, _0808F710 @ =gUnknown_83CE778
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x2
	movs r1, 0x1
	movs r3, 0x9
	bl sub_80F7B80
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0
	bl sub_80F7CAC
	movs r0, 0x2
	movs r1, 0x15
	movs r2, 0
	bl sub_80F7CAC
	bl sub_808F9FC
	ldr r0, _0808F714 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808F718
	movs r0, 0x1
	bl sub_808F90C
	movs r0, 0x1
	bl sub_809088C
	movs r0, 0x2
	bl sub_80F7E54
	movs r0, 0x1
	bl sub_80F7E54
	b _0808F73A
	.align 2, 0
_0808F704: .4byte gUnknown_8E9CAEC
_0808F708: .4byte gUnknown_20397B0
_0808F70C: .4byte gUnknown_8E9C3D8
_0808F710: .4byte gUnknown_83CE778
_0808F714: .4byte gUnknown_20397B4
_0808F718:
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xC
	bl sub_80F7CE8
	movs r0, 0x1
	bl sub_808F90C
	movs r0, 0x1
	bl sub_80F7E54
	movs r0, 0x2
	bl sub_80F7E54
_0808F73A:
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	ldr r0, _0808F754 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0808F758 @ =0x000002c7
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F754: .4byte gUnknown_20397B0
_0808F758: .4byte 0x000002c7
	thumb_func_end sub_808F68C

	thumb_func_start sub_808F75C
sub_808F75C: @ 808F75C
	push {lr}
	ldr r0, _0808F788 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r0, 0xB0
	lsls r0, 2
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0x14
	strh r0, [r2]
	ldr r0, _0808F78C @ =0x000002c2
	adds r2, r1, r0
	movs r0, 0x2
	strh r0, [r2]
	ldr r0, _0808F790 @ =0x000002c5
	adds r1, r0
	strb r3, [r1]
	movs r0, 0
	bl sub_809088C
	pop {r0}
	bx r0
	.align 2, 0
_0808F788: .4byte gUnknown_20397B0
_0808F78C: .4byte 0x000002c2
_0808F790: .4byte 0x000002c5
	thumb_func_end sub_808F75C

	thumb_func_start sub_808F794
sub_808F794: @ 808F794
	push {r4,lr}
	ldr r4, _0808F7F0 @ =gUnknown_20397B0
	ldr r2, [r4]
	ldr r1, _0808F7F4 @ =0x000002c5
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x14
	beq _0808F802
	movs r0, 0xB0
	lsls r0, 2
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldr r0, _0808F7F8 @ =0x000002c2
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	movs r1, 0x3
	movs r2, 0x1
	bl sub_80F7D30
	movs r0, 0x1
	bl sub_80F7E54
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x8
	bl sub_8090B98
	ldr r1, [r4]
	ldr r0, _0808F7F4 @ =0x000002c5
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	beq _0808F7FC
	movs r0, 0x1
	b _0808F804
	.align 2, 0
_0808F7F0: .4byte gUnknown_20397B0
_0808F7F4: .4byte 0x000002c5
_0808F7F8: .4byte 0x000002c2
_0808F7FC:
	ldr r1, _0808F80C @ =gUnknown_20397B4
	movs r0, 0x1
	strb r0, [r1]
_0808F802:
	movs r0, 0
_0808F804:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F80C: .4byte gUnknown_20397B4
	thumb_func_end sub_808F794

	thumb_func_start sub_808F810
sub_808F810: @ 808F810
	push {r4,lr}
	ldr r4, _0808F844 @ =gUnknown_20397B0
	ldr r1, [r4]
	movs r0, 0xB0
	lsls r0, 2
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _0808F848 @ =0x000002c2
	adds r2, r1, r0
	movs r0, 0x16
	strh r0, [r2]
	ldr r0, _0808F84C @ =0x000002c5
	adds r1, r0
	strb r3, [r1]
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _0808F83C
	bl sub_80960C0
_0808F83C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F844: .4byte gUnknown_20397B0
_0808F848: .4byte 0x000002c2
_0808F84C: .4byte 0x000002c5
	thumb_func_end sub_808F810

	thumb_func_start sub_808F850
sub_808F850: @ 808F850
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r5, _0808F8C8 @ =gUnknown_20397B0
	ldr r2, [r5]
	ldr r1, _0808F8CC @ =0x000002c5
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x14
	beq _0808F8FC
	movs r0, 0xB0
	lsls r0, 2
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r4, _0808F8D0 @ =0x000002c2
	adds r1, r2, r4
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x1
	movs r1, 0x3
	bl sub_80F7D30
	movs r0, 0x1
	bl sub_80F7E54
	movs r1, 0x80
	lsls r1, 1
	ldr r0, [r5]
	adds r0, r4
	ldrb r3, [r0]
	movs r0, 0xC
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r2, 0xA
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0x8
	negs r0, r0
	bl sub_8090B98
	ldr r1, [r5]
	ldr r0, _0808F8CC @ =0x000002c5
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	beq _0808F8D4
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	movs r0, 0x1
	b _0808F8FE
	.align 2, 0
_0808F8C8: .4byte gUnknown_20397B0
_0808F8CC: .4byte 0x000002c5
_0808F8D0: .4byte 0x000002c2
_0808F8D4:
	ldr r0, _0808F908 @ =gUnknown_20397B4
	movs r1, 0
	strb r1, [r0]
	bl sub_8090C44
	bl CompactPartySlots
	movs r0, 0x2
	str r0, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x9
	bl sub_80F7CE8
	movs r0, 0x2
	bl sub_80F7E54
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
_0808F8FC:
	movs r0, 0
_0808F8FE:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808F908: .4byte gUnknown_20397B4
	thumb_func_end sub_808F850

	thumb_func_start sub_808F90C
sub_808F90C: @ 808F90C
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	cmp r0, 0
	beq _0808F926
	movs r0, 0x2
	str r0, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x9
	bl sub_80F7CE8
	b _0808F934
_0808F926:
	movs r0, 0x2
	str r0, [sp]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x9
	bl sub_80F7CE8
_0808F934:
	movs r0, 0x2
	bl sub_80F7E54
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_808F90C

	thumb_func_start sub_808F948
sub_808F948: @ 808F948
	ldr r2, _0808F968 @ =gUnknown_20397B0
	ldr r0, [r2]
	ldr r1, _0808F96C @ =0x000002c7
	adds r0, r1
	movs r3, 0x1
	strb r3, [r0]
	ldr r0, [r2]
	adds r1, 0x1
	adds r0, r1
	movs r1, 0x1E
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _0808F970 @ =0x000002c9
	adds r0, r1
	strb r3, [r0]
	bx lr
	.align 2, 0
_0808F968: .4byte gUnknown_20397B0
_0808F96C: .4byte 0x000002c7
_0808F970: .4byte 0x000002c9
	thumb_func_end sub_808F948

	thumb_func_start sub_808F974
sub_808F974: @ 808F974
	push {lr}
	ldr r0, _0808F994 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _0808F998 @ =0x000002c7
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0808F98E
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	bl sub_808F90C
_0808F98E:
	pop {r0}
	bx r0
	.align 2, 0
_0808F994: .4byte gUnknown_20397B0
_0808F998: .4byte 0x000002c7
	thumb_func_end sub_808F974

	thumb_func_start sub_808F99C
sub_808F99C: @ 808F99C
	push {r4,lr}
	ldr r3, _0808F9F0 @ =gUnknown_20397B0
	ldr r1, [r3]
	ldr r2, _0808F9F4 @ =0x000002c7
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808F9E8
	movs r0, 0xB2
	lsls r0, 2
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bls _0808F9E8
	ldr r0, [r3]
	movs r1, 0xB2
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r3]
	movs r2, 0
	ldr r4, _0808F9F8 @ =0x000002c9
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, 0
	bne _0808F9DC
	movs r2, 0x1
_0808F9DC:
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, r4
	ldrb r0, [r0]
	bl sub_808F90C
_0808F9E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F9F0: .4byte gUnknown_20397B0
_0808F9F4: .4byte 0x000002c7
_0808F9F8: .4byte 0x000002c9
	thumb_func_end sub_808F99C

	thumb_func_start sub_808F9FC
sub_808F9FC: @ 808F9FC
	push {r4,lr}
	movs r4, 0x1
_0808FA00:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0808FA2C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_808FA30
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0808FA00
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FA2C: .4byte gPlayerParty
	thumb_func_end sub_808F9FC

	thumb_func_start sub_808FA30
sub_808FA30: @ 808FA30
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r7, _0808FA9C @ =gUnknown_83CE7D8
	cmp r1, 0
	beq _0808FA40
	ldr r7, _0808FAA0 @ =gUnknown_83CE7C0
_0808FA40:
	subs r0, 0x1
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 18
	movs r1, 0xE0
	lsls r1, 11
	adds r0, r1
	lsrs r3, r0, 16
	movs r0, 0
	ldr r1, _0808FAA4 @ =gUnknown_20397B0
	mov r12, r1
_0808FA5C:
	movs r2, 0
	adds r4, r7, 0
	adds r4, 0x8
	adds r5, r3, 0
	adds r5, 0xC
	adds r6, r0, 0x1
_0808FA68:
	mov r0, r12
	ldr r1, [r0]
	adds r0, r3, r2
	lsls r0, 1
	adds r1, 0xB0
	adds r1, r0
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _0808FA68
	adds r7, r4, 0
	lsls r0, r5, 16
	lsrs r3, r0, 16
	lsls r0, r6, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _0808FA5C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FA9C: .4byte gUnknown_83CE7D8
_0808FAA0: .4byte gUnknown_83CE7C0
_0808FAA4: .4byte gUnknown_20397B0
	thumb_func_end sub_808FA30

	thumb_func_start sub_808FAA8
sub_808FAA8: @ 808FAA8
	push {lr}
	sub sp, 0x4
	bl sub_808F9FC
	movs r0, 0x16
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0xC
	bl sub_80F7CE8
	movs r0, 0x1
	bl sub_80F7E54
	movs r0, 0x1
	bl ScheduleBgCopyTilemapToVram
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_808FAA8

	thumb_func_start sub_808FAD4
sub_808FAD4: @ 808FAD4
	push {lr}
	ldr r0, _0808FAF0 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0808FAF4 @ =0x000002c6
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x6
	bl PlaySE
	bl sub_808F75C
	pop {r0}
	bx r0
	.align 2, 0
_0808FAF0: .4byte gUnknown_20397B0
_0808FAF4: .4byte 0x000002c6
	thumb_func_end sub_808FAD4

	thumb_func_start sub_808FAF8
sub_808FAF8: @ 808FAF8
	push {r4,r5,lr}
	ldr r4, _0808FB14 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r5, _0808FB18 @ =0x000002c6
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808FB32
	cmp r0, 0x1
	bgt _0808FB1C
	cmp r0, 0
	beq _0808FB22
	b _0808FB60
	.align 2, 0
_0808FB14: .4byte gUnknown_20397B0
_0808FB18: .4byte 0x000002c6
_0808FB1C:
	cmp r0, 0x2
	beq _0808FB5C
	b _0808FB60
_0808FB22:
	bl sub_808F794
	lsls r0, 24
	cmp r0, 0
	bne _0808FB60
	bl sub_8092AE4
	b _0808FB4C
_0808FB32:
	bl sub_80924A8
	lsls r0, 24
	cmp r0, 0
	bne _0808FB60
	ldr r0, [r4]
	ldr r1, _0808FB58 @ =0x00000ce6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808FB4C
	bl BoxSetMosaic
_0808FB4C:
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808FB60
	.align 2, 0
_0808FB58: .4byte 0x00000ce6
_0808FB5C:
	movs r0, 0
	b _0808FB62
_0808FB60:
	movs r0, 0x1
_0808FB62:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_808FAF8

	thumb_func_start sub_808FB68
sub_808FB68: @ 808FB68
	push {lr}
	sub sp, 0xC
	movs r1, 0xE8
	lsls r1, 5
	movs r0, 0x8
	bl SetGpuReg
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0xD0
	bl TextWindow_SetStdFrame0_WithPal
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0xC
	pop {r0}
	bx r0
	thumb_func_end sub_808FB68

	thumb_func_start sub_808FBA4
sub_808FBA4: @ 808FBA4
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	bl UnkTextUtil_Reset
	ldr r1, _0808FBC8 @ =gUnknown_83CEA88
	lsls r0, r6, 3
	adds r0, r1
	ldrb r0, [r0, 0x4]
	cmp r0, 0x7
	bhi _0808FC7C
	lsls r0, 2
	ldr r1, _0808FBCC @ =_0808FBD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808FBC8: .4byte gUnknown_83CEA88
_0808FBCC: .4byte _0808FBD0
	.align 2, 0
_0808FBD0:
	.4byte _0808FC7C
	.4byte _0808FBF0
	.4byte _0808FBF0
	.4byte _0808FBF0
	.4byte _0808FC04
	.4byte _0808FC04
	.4byte _0808FC04
	.4byte _0808FC1C
_0808FBF0:
	ldr r0, _0808FBFC @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r0, _0808FC00 @ =0x00000cea
	adds r1, r0
	b _0808FC0C
	.align 2, 0
_0808FBFC: .4byte gUnknown_20397B0
_0808FC00: .4byte 0x00000cea
_0808FC04:
	ldr r0, _0808FC14 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _0808FC18 @ =0x000021d0
	adds r1, r2
_0808FC0C:
	movs r0, 0
	bl UnkTextUtil_SetPtrI
	b _0808FC7C
	.align 2, 0
_0808FC14: .4byte gUnknown_20397B0
_0808FC18: .4byte 0x000021d0
_0808FC1C:
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	beq _0808FC40
	ldr r0, _0808FC38 @ =gUnknown_20397B0
	ldr r4, [r0]
	ldr r0, _0808FC3C @ =0x000021db
	adds r4, r0
	bl sub_80961A8
	adds r1, r0, 0
	adds r0, r4, 0
	b _0808FC4C
	.align 2, 0
_0808FC38: .4byte gUnknown_20397B0
_0808FC3C: .4byte 0x000021db
_0808FC40:
	ldr r0, _0808FC54 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _0808FC58 @ =0x000021db
	adds r0, r1, r2
	ldr r2, _0808FC5C @ =0x00000d61
	adds r1, r2
_0808FC4C:
	bl StringCopy
	adds r2, r0, 0
	b _0808FC62
	.align 2, 0
_0808FC54: .4byte gUnknown_20397B0
_0808FC58: .4byte 0x000021db
_0808FC5C: .4byte 0x00000d61
_0808FC60:
	adds r2, r1, 0
_0808FC62:
	subs r1, r2, 0x1
	ldrb r0, [r1]
	cmp r0, 0
	beq _0808FC60
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _0808FCDC @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r0, _0808FCE0 @ =0x000021db
	adds r1, r0
	movs r0, 0
	bl UnkTextUtil_SetPtrI
_0808FC7C:
	ldr r5, _0808FCDC @ =gUnknown_20397B0
	ldr r0, [r5]
	movs r4, 0x86
	lsls r4, 6
	adds r0, r4
	ldr r2, _0808FCE4 @ =gUnknown_83CEA88
	lsls r1, r6, 3
	adds r1, r2
	ldr r1, [r1]
	bl UnkTextUtil_StringExpandPlaceholders
	movs r0, 0x1
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r2, [r5]
	adds r2, r4
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0xFF
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r3, 0
	bl AddTextPrinterParameterized
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0xD
	bl DrawTextBorderOuter
	movs r0, 0x1
	bl PutWindowTilemap
	movs r0, 0x1
	movs r1, 0x2
	bl CopyWindowToVram
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808FCDC: .4byte gUnknown_20397B0
_0808FCE0: .4byte 0x000021db
_0808FCE4: .4byte gUnknown_83CEA88
	thumb_func_end sub_808FBA4

	thumb_func_start sub_808FCE8
sub_808FCE8: @ 808FCE8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0808FD1C @ =gUnknown_83CEB80
	movs r1, 0xB
	str r1, [sp]
	movs r1, 0xE
	str r1, [sp, 0x4]
	movs r1, 0x1
	str r1, [sp, 0x8]
	movs r2, 0
	movs r3, 0x2
	bl CreateYesNoMenu
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl MoveMenuCursorNoWrapAround
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FD1C: .4byte gUnknown_83CEB80
	thumb_func_end sub_808FCE8

	thumb_func_start sub_808FD20
sub_808FD20: @ 808FD20
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl ClearMenuWindow
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	pop {r0}
	bx r0
	thumb_func_end sub_808FD20

	thumb_func_start sub_808FD34
sub_808FD34: @ 808FD34
	push {lr}
	bl sub_8094DA8
	movs r0, 0x12
	bl sub_8094DEC
	movs r0, 0x13
	bl sub_8094DEC
	movs r0, 0x14
	bl sub_8094DEC
	movs r0, 0x15
	bl sub_8094DEC
	bl sub_8094E88
	pop {r0}
	bx r0
	thumb_func_end sub_808FD34

	thumb_func_start sub_808FD5C
sub_808FD5C: @ 808FD5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8094DA8
	cmp r4, 0x1
	beq _0808FD9A
	cmp r4, 0x1
	bgt _0808FD76
	cmp r4, 0
	beq _0808FD80
	b _0808FDE6
_0808FD76:
	cmp r5, 0x2
	beq _0808FDB4
	cmp r5, 0x3
	beq _0808FDCE
	b _0808FDE6
_0808FD80:
	movs r0, 0x16
	bl sub_8094DEC
	movs r0, 0x17
	bl sub_8094DEC
	movs r0, 0x18
	bl sub_8094DEC
	movs r0, 0x19
	bl sub_8094DEC
	b _0808FDE6
_0808FD9A:
	movs r0, 0x1A
	bl sub_8094DEC
	movs r0, 0x1B
	bl sub_8094DEC
	movs r0, 0x1C
	bl sub_8094DEC
	movs r0, 0x1D
	bl sub_8094DEC
	b _0808FDE6
_0808FDB4:
	movs r0, 0x1E
	bl sub_8094DEC
	movs r0, 0x1F
	bl sub_8094DEC
	movs r0, 0x20
	bl sub_8094DEC
	movs r0, 0x21
	bl sub_8094DEC
	b _0808FDE6
_0808FDCE:
	movs r0, 0x22
	bl sub_8094DEC
	movs r0, 0x23
	bl sub_8094DEC
	movs r0, 0x24
	bl sub_8094DEC
	movs r0, 0x25
	bl sub_8094DEC
_0808FDE6:
	bl sub_8094E88
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808FD5C

	thumb_func_start sub_808FDF0
sub_808FDF0: @ 808FDF0
	ldr r0, _0808FDF8 @ =gUnknown_20397B5
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0808FDF8: .4byte gUnknown_20397B5
	thumb_func_end sub_808FDF0

	thumb_func_start sub_808FDFC
sub_808FDFC: @ 808FDFC
	push {lr}
	bl sub_80939AC
	lsls r0, 24
	cmp r0, 0
	bne _0808FE38
	ldr r0, _0808FE24 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808FE28
	bl sub_8094CC8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_8095C84
	b _0808FE38
	.align 2, 0
_0808FE24: .4byte gUnknown_20397B4
_0808FE28:
	bl sub_8094CC8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8095C84
_0808FE38:
	ldr r1, _0808FE50 @ =gUnknown_20397BA
	ldrh r0, [r1]
	cmp r0, 0
	beq _0808FE4A
	bl sub_8095E2C
	movs r0, 0x3
	bl sub_8094D14
_0808FE4A:
	pop {r0}
	bx r0
	.align 2, 0
_0808FE50: .4byte gUnknown_20397BA
	thumb_func_end sub_808FDFC

	thumb_func_start sub_808FE54
sub_808FE54: @ 808FE54
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8094D34
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808FE90 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCE
	lsls r1, 4
	adds r0, r1
	ldrh r7, [r0]
	ldr r0, _0808FE94 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808FE9C
	movs r6, 0xE
	bl sub_8094CC8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808FE98 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	b _0808FEB2
	.align 2, 0
_0808FE90: .4byte gUnknown_20397B0
_0808FE94: .4byte gUnknown_20397B4
_0808FE98: .4byte gPlayerParty
_0808FE9C:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8094CC8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x41
	bl GetBoxMonDataFromSelectedBox
_0808FEB2:
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _0808FECC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _0808FED0 @ =0x00002228
	adds r1, r0, r2
	cmp r5, 0x1
	beq _0808FF08
	cmp r5, 0x1
	bgt _0808FED4
	cmp r5, 0
	beq _0808FEDE
	b _0808FF6A
	.align 2, 0
_0808FECC: .4byte gUnknown_20397B0
_0808FED0: .4byte 0x00002228
_0808FED4:
	cmp r5, 0x2
	beq _0808FF3E
	cmp r5, 0x3
	beq _0808FF58
	b _0808FF6A
_0808FEDE:
	ldr r0, _0808FEF0 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808FEF4
	cmp r4, 0xE
	beq _0808FF6A
_0808FEEA:
	movs r2, 0x16
	b _0808FF02
	.align 2, 0
_0808FEF0: .4byte gUnknown_20397B4
_0808FEF4:
	cmp r4, 0xE
	beq _0808FEEA
	movs r0, 0x15
	cmp r4, r6
	beq _0808FF00
	movs r0, 0x14
_0808FF00:
	adds r2, r0, 0
_0808FF02:
	strh r7, [r1]
	strh r3, [r1, 0x2]
	b _0808FF60
_0808FF08:
	movs r0, 0
	strh r7, [r1]
	strh r0, [r1, 0x2]
	strb r4, [r1, 0x4]
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	ldr r0, _0808FF24 @ =gUnknown_20397B4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808FF28
	cmp r4, 0xE
	beq _0808FF6A
	movs r2, 0x19
	b _0808FF64
	.align 2, 0
_0808FF24: .4byte gUnknown_20397B4
_0808FF28:
	cmp r4, 0xE
	bne _0808FF32
	movs r2, 0x1A
	strb r6, [r1, 0x4]
	b _0808FF64
_0808FF32:
	cmp r4, r6
	beq _0808FF3A
	movs r2, 0x17
	b _0808FF62
_0808FF3A:
	movs r2, 0x18
	b _0808FF64
_0808FF3E:
	movs r2, 0x1A
	movs r0, 0
	strh r7, [r1]
	strh r0, [r1, 0x2]
	ldr r0, _0808FF54 @ =gUnknown_20397B6
	ldrb r0, [r0]
	strb r0, [r1, 0x4]
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	b _0808FF64
	.align 2, 0
_0808FF54: .4byte gUnknown_20397B6
_0808FF58:
	movs r2, 0x1B
	movs r0, 0
	strh r0, [r1]
	strh r0, [r1, 0x2]
_0808FF60:
	strb r4, [r1, 0x4]
_0808FF62:
	strb r6, [r1, 0x5]
_0808FF64:
	adds r0, r2, 0
	bl sub_8113550
_0808FF6A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808FE54

	thumb_func_start sub_808FF70
sub_808FF70: @ 808FF70
	push {r4,lr}
	ldr r4, _0808FFA0 @ =gUnknown_20397B8
	bl StorageGetCurrentBox
	ldrb r1, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	beq _0808FF9A
	ldr r0, _0808FFA4 @ =0x00000843
	bl FlagClear
	ldr r4, _0808FFA8 @ =0x00004037
	bl StorageGetCurrentBox
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl VarSet
_0808FF9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FFA0: .4byte gUnknown_20397B8
_0808FFA4: .4byte 0x00000843
_0808FFA8: .4byte 0x00004037
	thumb_func_end sub_808FF70

	thumb_func_start sub_808FFAC
sub_808FFAC: @ 808FFAC
	push {r4-r6,lr}
	bl sub_809707C
	movs r2, 0
	ldr r3, _0809003C @ =gUnknown_20397B0
	ldr r5, _08090040 @ =0x00000b04
	movs r4, 0
	adds r6, r3, 0
_0808FFBC:
	ldr r0, [r3]
	lsls r1, r2, 1
	adds r0, r5
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x27
	bls _0808FFBC
	movs r2, 0
	ldr r5, _0809003C @ =gUnknown_20397B0
	ldr r4, _08090044 @ =0x00000b54
	movs r3, 0
_0808FFD8:
	ldr r0, [r5]
	lsls r1, r2, 1
	adds r0, r4
	adds r0, r1
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x27
	bls _0808FFD8
	movs r2, 0
	ldr r5, _0809003C @ =gUnknown_20397B0
	ldr r4, _08090048 @ =0x00000a6c
	movs r3, 0
_0808FFF4:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	str r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _0808FFF4
	movs r2, 0
	ldr r5, _0809003C @ =gUnknown_20397B0
	ldr r4, _0809004C @ =0x00000a84
	movs r3, 0
_08090010:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	str r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1D
	bls _08090010
	ldr r0, [r6]
	ldr r2, _08090050 @ =0x00000a68
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r1, _08090054 @ =0x0000078c
	adds r0, r1
	strh r2, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809003C: .4byte gUnknown_20397B0
_08090040: .4byte 0x00000b04
_08090044: .4byte 0x00000b54
_08090048: .4byte 0x00000a6c
_0809004C: .4byte 0x00000a84
_08090050: .4byte 0x00000a68
_08090054: .4byte 0x0000078c
	thumb_func_end sub_808FFAC

	thumb_func_start sub_8090058
sub_8090058: @ 8090058
	push {lr}
	bl sub_80939F4
	lsls r0, 24
	movs r1, 0x1
	cmp r0, 0
	beq _08090068
	movs r1, 0x2
_08090068:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8090058

	thumb_func_start sub_8090070
sub_8090070: @ 8090070
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r5, _080900C4 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r4, _080900C8 @ =0x000020a0
	adds r0, r4
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sub_8090058
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0
	bl sub_80912E0
	ldr r1, [r5]
	ldr r2, _080900CC @ =0x00000a68
	adds r1, r2
	str r0, [r1]
	ldr r1, _080900D0 @ =sub_80911B0
	str r1, [r0, 0x1C]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080900C4: .4byte gUnknown_20397B0
_080900C8: .4byte 0x000020a0
_080900CC: .4byte 0x00000a68
_080900D0: .4byte sub_80911B0
	thumb_func_end sub_8090070

	thumb_func_start sub_80900D4
sub_80900D4: @ 80900D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r0, 0
	mov r8, r0
	movs r6, 0
	movs r7, 0
_080900EE:
	movs r5, 0
	adds r1, r7, 0x1
	mov r10, r1
_080900F4:
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0x41
	bl GetBoxMonDataFromAnyBox
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0809015C
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0
	bl GetBoxMonDataFromAnyBox
	adds r1, r0, 0
	lsls r2, r5, 1
	adds r2, r5
	lsls r2, 19
	movs r3, 0xC8
	lsls r3, 15
	adds r2, r3
	asrs r2, 16
	lsls r3, r7, 1
	adds r3, r7
	lsls r3, 19
	movs r0, 0xB0
	lsls r0, 14
	adds r3, r0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x13
	subs r0, r5
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	asrs r3, 16
	bl sub_80912E0
	ldr r1, _08090154 @ =gUnknown_20397B0
	ldr r1, [r1]
	mov r3, r8
	lsls r2, r3, 2
	ldr r3, _08090158 @ =0x00000a84
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	b _0809016C
	.align 2, 0
_08090154: .4byte gUnknown_20397B0
_08090158: .4byte 0x00000a84
_0809015C:
	ldr r0, _080901E4 @ =gUnknown_20397B0
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, 2
	ldr r3, _080901E8 @ =0x00000a84
	adds r0, r3
	adds r0, r1
	str r4, [r0]
_0809016C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _080900F4
	mov r1, r10
	lsls r0, r1, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _080900EE
	ldr r0, _080901E4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _080901D2
	movs r6, 0
	movs r2, 0xD
	negs r2, r2
	adds r4, r2, 0
_080901A2:
	mov r0, r9
	adds r1, r6, 0
	movs r2, 0xC
	bl GetBoxMonDataFromAnyBox
	cmp r0, 0
	bne _080901C8
	ldr r0, _080901E4 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r6, 2
	ldr r3, _080901E8 @ =0x00000a84
	adds r0, r3
	adds r0, r1
	ldr r2, [r0]
	ldrb r0, [r2, 0x1]
	ands r0, r4
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
_080901C8:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1D
	bls _080901A2
_080901D2:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080901E4: .4byte gUnknown_20397B0
_080901E8: .4byte 0x00000a84
	thumb_func_end sub_80900D4

	thumb_func_start sub_80901EC
sub_80901EC: @ 80901EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r7, 0
	movs r1, 0x41
	bl GetBoxMonDataFromSelectedBox
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _08090286
	adds r0, r7, 0
	movs r1, 0x6
	bl __umodsi3
	adds r6, r0, 0
	lsls r0, r6, 24
	lsrs r0, 24
	lsls r5, r0, 1
	adds r5, r0
	lsls r5, 19
	movs r0, 0xC8
	lsls r0, 15
	adds r5, r0
	lsrs r5, 16
	adds r0, r7, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 19
	movs r0, 0xB0
	lsls r0, 14
	adds r4, r0
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonDataFromSelectedBox
	adds r1, r0, 0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x13
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_80912E0
	adds r3, r0, 0
	ldr r0, _08090294 @ =gUnknown_20397B0
	ldr r2, [r0]
	lsls r1, r7, 2
	ldr r4, _08090298 @ =0x00000a84
	adds r0, r2, r4
	adds r0, r1
	str r3, [r0]
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3
	bne _08090286
	ldrb r0, [r3, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r3, 0x1]
_08090286:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090294: .4byte gUnknown_20397B0
_08090298: .4byte 0x00000a84
	thumb_func_end sub_80901EC

	thumb_func_start sub_809029C
sub_809029C: @ 809029C
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r7, _080902D4 @ =gUnknown_20397B0
	ldr r6, _080902D8 @ =0x00000a84
	movs r5, 0x1
	ldr r4, _080902DC @ =sub_8090324
_080902AC:
	ldr r0, [r7]
	lsls r1, r2, 2
	adds r0, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, 0
	beq _080902C4
	strh r3, [r0, 0x32]
	ldr r0, [r1]
	strh r5, [r0, 0x36]
	ldr r0, [r1]
	str r4, [r0, 0x1C]
_080902C4:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1D
	bls _080902AC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080902D4: .4byte gUnknown_20397B0
_080902D8: .4byte 0x00000a84
_080902DC: .4byte sub_8090324
	thumb_func_end sub_809029C

	thumb_func_start sub_80902E0
sub_80902E0: @ 80902E0
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080902FC
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	b _08090312
_080902FC:
	ldr r0, _08090318 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r3, _0809031C @ =0x00000c62
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrh r0, [r2, 0x34]
	strh r0, [r2, 0x20]
	ldr r0, _08090320 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_08090312:
	pop {r0}
	bx r0
	.align 2, 0
_08090318: .4byte gUnknown_20397B0
_0809031C: .4byte 0x00000c62
_08090320: .4byte SpriteCallbackDummy
	thumb_func_end sub_80902E0

	thumb_func_start sub_8090324
sub_8090324: @ 8090324
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x36]
	movs r3, 0x36
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08090338
	subs r0, r1, 0x1
	strh r0, [r2, 0x36]
	b _08090354
_08090338:
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x38]
	subs r0, 0x45
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB6
	bls _08090354
	ldr r0, _08090358 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_08090354:
	pop {r0}
	bx r0
	.align 2, 0
_08090358: .4byte SpriteCallbackDummy
	thumb_func_end sub_8090324

	thumb_func_start sub_809035C
sub_809035C: @ 809035C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r7, _0809039C @ =gUnknown_20397B0
_08090366:
	ldr r0, [r7]
	lsls r4, r5, 2
	ldr r1, _080903A0 @ =0x00000a84
	adds r0, r1
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _08090386
	bl sub_80913C4
	ldr r0, [r7]
	ldr r1, _080903A0 @ =0x00000a84
	adds r0, r1
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_08090386:
	adds r0, r5, 0x6
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _08090366
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809039C: .4byte gUnknown_20397B0
_080903A0: .4byte 0x00000a84
	thumb_func_end sub_809035C

	thumb_func_start sub_80903A4
sub_80903A4: @ 80903A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x8]
	lsls r2, 16
	movs r1, 0x2C
	mov r8, r1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 19
	movs r3, 0xC8
	lsls r3, 15
	adds r1, r3
	lsrs r1, 16
	str r1, [sp, 0x10]
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	lsrs r6, r2, 16
	str r6, [sp, 0xC]
	asrs r2, 16
	muls r1, r2
	ldr r2, [sp, 0x10]
	subs r1, r2, r1
	lsls r1, 16
	lsrs r2, r1, 16
	movs r1, 0x13
	subs r1, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x14]
	movs r3, 0
	mov r9, r3
	adds r5, r0, 0
	ldr r1, _08090488 @ =gUnknown_20397B0
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	beq _08090498
	movs r7, 0x4
	lsls r2, 16
	mov r10, r2
_08090404:
	ldr r6, _08090488 @ =gUnknown_20397B0
	ldr r2, [r6]
	lsls r0, r5, 1
	ldr r3, _0809048C @ =0x00000ba4
	adds r1, r2, r3
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08090470
	lsls r4, r5, 2
	movs r6, 0xBE
	lsls r6, 4
	adds r1, r2, r6
	adds r1, r4
	ldr r1, [r1]
	mov r2, r8
	lsls r3, r2, 16
	asrs r3, 16
	movs r2, 0x2
	str r2, [sp]
	ldr r6, [sp, 0x14]
	str r6, [sp, 0x4]
	mov r6, r10
	asrs r2, r6, 16
	bl sub_80912E0
	adds r2, r0, 0
	ldr r1, _08090488 @ =gUnknown_20397B0
	ldr r0, [r1]
	ldr r3, _08090490 @ =0x00000a84
	adds r0, r3
	adds r1, r0, r4
	str r2, [r1]
	cmp r2, 0
	beq _08090470
	mov r6, sp
	ldrh r6, [r6, 0x8]
	strh r6, [r2, 0x30]
	ldr r0, [r1]
	mov r2, sp
	ldrh r2, [r2, 0xC]
	strh r2, [r0, 0x32]
	ldr r0, [r1]
	mov r3, sp
	ldrh r3, [r3, 0x10]
	strh r3, [r0, 0x34]
	ldr r1, [r1]
	ldr r0, _08090494 @ =sub_80902E0
	str r0, [r1, 0x1C]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08090470:
	adds r0, r5, 0x6
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	adds r0, 0x18
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	subs r7, 0x1
	cmp r7, 0
	bge _08090404
	b _08090550
	.align 2, 0
_08090488: .4byte gUnknown_20397B0
_0809048C: .4byte 0x00000ba4
_08090490: .4byte 0x00000a84
_08090494: .4byte sub_80902E0
_08090498:
	mov r10, r1
	movs r7, 0x4
	lsls r2, 16
	str r2, [sp, 0x18]
_080904A0:
	mov r6, r10
	ldr r2, [r6]
	lsls r0, r5, 1
	ldr r3, _08090564 @ =0x00000ba4
	adds r1, r2, r3
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0809053A
	lsls r4, r5, 2
	movs r6, 0xBE
	lsls r6, 4
	adds r1, r2, r6
	adds r1, r4
	ldr r1, [r1]
	mov r2, r8
	lsls r3, r2, 16
	asrs r3, 16
	movs r2, 0x2
	str r2, [sp]
	ldr r6, [sp, 0x14]
	str r6, [sp, 0x4]
	ldr r6, [sp, 0x18]
	asrs r2, r6, 16
	bl sub_80912E0
	adds r2, r0, 0
	mov r0, r10
	ldr r3, [r0]
	ldr r1, _08090568 @ =0x00000a84
	adds r0, r3, r1
	adds r1, r0, r4
	str r2, [r1]
	cmp r2, 0
	beq _0809053A
	mov r6, sp
	ldrh r6, [r6, 0x8]
	strh r6, [r2, 0x30]
	ldr r0, [r1]
	mov r2, sp
	ldrh r2, [r2, 0xC]
	strh r2, [r0, 0x32]
	ldr r0, [r1]
	mov r6, sp
	ldrh r6, [r6, 0x10]
	strh r6, [r0, 0x34]
	ldr r1, [r1]
	ldr r0, _0809056C @ =sub_80902E0
	str r0, [r1, 0x1C]
	ldr r1, _08090570 @ =0x00000c58
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r1, r5, 0
	movs r2, 0xC
	bl GetBoxMonDataFromAnyBox
	cmp r0, 0
	bne _08090530
	mov r2, r10
	ldr r0, [r2]
	ldr r3, _08090568 @ =0x00000a84
	adds r0, r3
	adds r0, r4
	ldr r2, [r0]
	ldrb r1, [r2, 0x1]
	movs r6, 0xD
	negs r6, r6
	adds r0, r6, 0
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r2, 0x1]
_08090530:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0809053A:
	adds r0, r5, 0x6
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	adds r0, 0x18
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	subs r7, 0x1
	cmp r7, 0
	bge _080904A0
_08090550:
	mov r0, r9
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08090564: .4byte 0x00000ba4
_08090568: .4byte 0x00000a84
_0809056C: .4byte sub_80902E0
_08090570: .4byte 0x00000c58
	thumb_func_end sub_80903A4

	thumb_func_start sub_8090574
sub_8090574: @ 8090574
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080905D0 @ =gUnknown_20397B0
	ldr r1, [r6]
	ldr r2, _080905D4 @ =0x00000c66
	adds r1, r2
	movs r5, 0
	strb r5, [r1]
	ldr r1, [r6]
	ldr r3, _080905D8 @ =0x00000c67
	adds r1, r3
	strb r0, [r1]
	ldr r1, [r6]
	ldr r7, _080905DC @ =0x00000c65
	adds r1, r7
	strb r4, [r1]
	ldr r3, [r6]
	ldr r1, _080905E0 @ =0x00000c5c
	adds r2, r3, r1
	movs r1, 0x20
	strh r1, [r2]
	lsls r4, 24
	asrs r4, 24
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 1
	negs r1, r1
	subs r7, 0x5
	adds r2, r3, r7
	strh r1, [r2]
	ldr r1, _080905E4 @ =0x00000c62
	adds r3, r1
	strh r5, [r3]
	bl sub_8090794
	cmp r4, 0
	ble _080905EC
	ldr r0, [r6]
	ldr r2, _080905E8 @ =0x00000c64
	adds r0, r2
	movs r1, 0
	b _080905F4
	.align 2, 0
_080905D0: .4byte gUnknown_20397B0
_080905D4: .4byte 0x00000c66
_080905D8: .4byte 0x00000c67
_080905DC: .4byte 0x00000c65
_080905E0: .4byte 0x00000c5c
_080905E4: .4byte 0x00000c62
_080905E8: .4byte 0x00000c64
_080905EC:
	ldr r0, [r6]
	ldr r3, _08090620 @ =0x00000c64
	adds r0, r3
	movs r1, 0x5
_080905F4:
	strb r1, [r0]
	ldr r0, _08090624 @ =gUnknown_20397B0
	ldr r2, [r0]
	ldr r7, _08090620 @ =0x00000c64
	adds r0, r2, r7
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x64
	ldr r3, _08090628 @ =0x00000c5e
	adds r1, r2, r3
	strh r0, [r1]
	subs r7, 0x4
	adds r2, r7
	movs r1, 0
	ldrsh r0, [r2, r1]
	bl sub_809029C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090620: .4byte 0x00000c64
_08090624: .4byte gUnknown_20397B0
_08090628: .4byte 0x00000c5e
	thumb_func_end sub_8090574

	thumb_func_start sub_809062C
sub_809062C: @ 809062C
	push {r4-r6,lr}
	ldr r5, _08090658 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r4, _0809065C @ =0x00000c5c
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, 0
	beq _08090640
	subs r0, 0x1
	strh r0, [r1]
_08090640:
	ldr r3, [r5]
	ldr r6, _08090660 @ =0x00000c66
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080906C4
	cmp r0, 0x1
	bgt _08090664
	cmp r0, 0
	beq _0809066C
	b _08090782
	.align 2, 0
_08090658: .4byte gUnknown_20397B0
_0809065C: .4byte 0x00000c5c
_08090660: .4byte 0x00000c66
_08090664:
	cmp r0, 0x2
	bne _0809066A
	b _08090770
_0809066A:
	b _08090782
_0809066C:
	ldr r0, _080906B8 @ =0x00000c5e
	adds r1, r3, r0
	movs r2, 0xC6
	lsls r2, 4
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBA
	bhi _0809068A
	b _0809078C
_0809068A:
	ldr r1, _080906BC @ =0x00000c64
	adds r0, r3, r1
	ldrb r0, [r0]
	bl sub_809035C
	ldr r2, [r5]
	ldr r0, _080906B8 @ =0x00000c5e
	adds r3, r2, r0
	ldr r1, _080906C0 @ =0x00000c65
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldrh r1, [r3]
	adds r0, r1
	strh r0, [r3]
	adds r2, r6
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _0809078C
	.align 2, 0
_080906B8: .4byte 0x00000c5e
_080906BC: .4byte 0x00000c64
_080906C0: .4byte 0x00000c65
_080906C4:
	ldr r2, _08090728 @ =0x00000c5e
	adds r1, r3, r2
	movs r6, 0xC6
	lsls r6, 4
	adds r2, r3, r6
	ldrh r0, [r2]
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	ldr r6, _0809072C @ =0x00000c64
	adds r0, r3, r6
	ldrb r0, [r0]
	adds r1, r3, r4
	ldrh r1, [r1]
	movs r3, 0
	ldrsh r2, [r2, r3]
	bl sub_80903A4
	ldr r2, [r5]
	ldr r3, _08090730 @ =0x00000c62
	adds r1, r2, r3
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r1]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _08090734 @ =0x00000c65
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r1, 0
	ble _0809070C
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _08090718
_0809070C:
	cmp r1, 0
	bge _08090740
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08090740
_08090718:
	ldr r0, _08090738 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _0809073C @ =0x00000c66
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0809078C
	.align 2, 0
_08090728: .4byte 0x00000c5e
_0809072C: .4byte 0x00000c64
_08090730: .4byte 0x00000c62
_08090734: .4byte 0x00000c65
_08090738: .4byte gUnknown_20397B0
_0809073C: .4byte 0x00000c66
_08090740:
	ldr r3, _08090760 @ =gUnknown_20397B0
	ldr r0, [r3]
	ldr r6, _08090764 @ =0x00000c64
	adds r1, r0, r6
	ldr r2, _08090768 @ =0x00000c65
	adds r0, r2
	ldrb r0, [r0]
	ldrb r6, [r1]
	adds r0, r6
	movs r2, 0
	strb r0, [r1]
	ldr r0, [r3]
	ldr r1, _0809076C @ =0x00000c66
	adds r0, r1
	strb r2, [r0]
	b _0809078C
	.align 2, 0
_08090760: .4byte gUnknown_20397B0
_08090764: .4byte 0x00000c64
_08090768: .4byte 0x00000c65
_0809076C: .4byte 0x00000c66
_08090770:
	ldr r2, _08090788 @ =0x00000c62
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809078C
	adds r1, r3, r4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08090782:
	movs r0, 0
	b _0809078E
	.align 2, 0
_08090788: .4byte 0x00000c62
_0809078C:
	movs r0, 0x1
_0809078E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809062C

	thumb_func_start sub_8090794
sub_8090794: @ 8090794
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r0, 0
	ldr r1, _08090810 @ =gUnknown_20397B0
	mov r9, r1
_080907A8:
	adds r0, 0x1
	mov r8, r0
	movs r7, 0x5
_080907AE:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x41
	bl GetBoxMonDataFromAnyBox
	mov r2, r9
	ldr r1, [r2]
	lsls r2, r5, 1
	ldr r3, _08090814 @ =0x00000ba4
	adds r1, r3
	adds r1, r2
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080907EA
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonDataFromAnyBox
	mov r2, r9
	ldr r1, [r2]
	lsls r2, r5, 2
	movs r3, 0xBE
	lsls r3, 4
	adds r1, r3
	adds r1, r2
	str r0, [r1]
_080907EA:
	adds r5, 0x1
	subs r7, 0x1
	cmp r7, 0
	bge _080907AE
	mov r0, r8
	cmp r0, 0x4
	ble _080907A8
	ldr r0, _08090810 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08090818 @ =0x00000c58
	adds r0, r1
	strb r6, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090810: .4byte gUnknown_20397B0
_08090814: .4byte 0x00000ba4
_08090818: .4byte 0x00000c58
	thumb_func_end sub_8090794

	thumb_func_start sub_809081C
sub_809081C: @ 809081C
	push {r4,r5,lr}
	lsls r0, 24
	ldr r5, _08090848 @ =gUnknown_20397B0
	ldr r1, [r5]
	lsrs r4, r0, 22
	ldr r0, _0809084C @ =0x00000a84
	adds r1, r0
	adds r1, r4
	ldr r0, [r1]
	cmp r0, 0
	beq _08090842
	bl sub_80913C4
	ldr r0, [r5]
	ldr r1, _0809084C @ =0x00000a84
	adds r0, r1
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_08090842:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090848: .4byte gUnknown_20397B0
_0809084C: .4byte 0x00000a84
	thumb_func_end sub_809081C

	thumb_func_start sub_8090850
sub_8090850: @ 8090850
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _08090884 @ =gUnknown_20397B0
	ldr r1, [r1]
	lsrs r0, 22
	ldr r3, _08090888 @ =0x00000a84
	adds r1, r3
	adds r1, r0
	ldr r3, [r1]
	cmp r3, 0
	beq _0809087E
	movs r0, 0x3
	adds r1, r2, 0
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
_0809087E:
	pop {r0}
	bx r0
	.align 2, 0
_08090884: .4byte gUnknown_20397B0
_08090888: .4byte 0x00000a84
	thumb_func_end sub_8090850

	thumb_func_start sub_809088C
sub_809088C: @ 809088C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _0809092C @ =gPlayerParty
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0x68
	movs r3, 0x40
	bl sub_80912E0
	ldr r1, _08090930 @ =gUnknown_20397B0
	ldr r1, [r1]
	ldr r2, _08090934 @ =0x00000a6c
	adds r1, r2
	str r0, [r1]
	movs r7, 0x1
	movs r6, 0x1
_080908D2:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _0809092C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _08090938
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	subs r0, r6, 0x1
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 19
	movs r0, 0x80
	lsls r0, 13
	adds r3, r0
	asrs r3, 16
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0x98
	bl sub_80912E0
	ldr r1, _08090930 @ =gUnknown_20397B0
	ldr r1, [r1]
	lsls r2, r6, 2
	ldr r3, _08090934 @ =0x00000a6c
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	b _08090946
	.align 2, 0
_0809092C: .4byte gPlayerParty
_08090930: .4byte gUnknown_20397B0
_08090934: .4byte 0x00000a6c
_08090938:
	ldr r0, _080909E8 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r6, 2
	ldr r2, _080909EC @ =0x00000a6c
	adds r0, r2
	adds r0, r1
	str r5, [r0]
_08090946:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080908D2
	ldr r3, _080909E8 @ =gUnknown_20397B0
	mov r0, r8
	cmp r0, 0
	bne _0809098A
	movs r6, 0
	cmp r6, r7
	bcs _0809098A
	mov r12, r3
	ldr r5, _080909EC @ =0x00000a6c
	movs r4, 0x4
_08090964:
	mov r2, r12
	ldr r1, [r2]
	lsls r0, r6, 2
	adds r1, r5
	adds r1, r0
	ldr r2, [r1]
	ldrh r0, [r2, 0x22]
	subs r0, 0xA0
	strh r0, [r2, 0x22]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r7
	bcc _08090964
_0809098A:
	ldr r0, [r3]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _080909DA
	movs r6, 0
	adds r7, r3, 0
	ldr r5, _080909EC @ =0x00000a6c
_08090998:
	ldr r0, [r7]
	lsls r4, r6, 2
	adds r0, r5
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _080909D0
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080909F0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0
	bne _080909D0
	ldr r0, [r7]
	adds r0, r5
	adds r0, r4
	ldr r2, [r0]
	ldrb r1, [r2, 0x1]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r2, 0x1]
_080909D0:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _08090998
_080909DA:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080909E8: .4byte gUnknown_20397B0
_080909EC: .4byte 0x00000a6c
_080909F0: .4byte gPlayerParty
	thumb_func_end sub_809088C

	thumb_func_start sub_80909F4
sub_80909F4: @ 80909F4
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _08090A54 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _08090A58 @ =0x00000c5a
	adds r1, r2
	movs r2, 0
	strb r2, [r1]
	movs r5, 0
	movs r6, 0
	adds r3, r0, 0
	ldr r7, _08090A5C @ =0x00000a6c
_08090A0C:
	ldr r0, [r3]
	lsls r4, r5, 2
	adds r0, r7
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _08090A42
	cmp r5, r6
	beq _08090A3C
	adds r1, r6, 0
	str r3, [sp]
	bl sub_8090A74
	ldr r3, [sp]
	ldr r2, [r3]
	adds r0, r2, r7
	adds r0, r4
	movs r1, 0
	str r1, [r0]
	ldr r0, _08090A58 @ =0x00000c5a
	adds r2, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08090A3C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08090A42:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08090A0C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090A54: .4byte gUnknown_20397B0
_08090A58: .4byte 0x00000c5a
_08090A5C: .4byte 0x00000a6c
	thumb_func_end sub_80909F4

	thumb_func_start sub_8090A60
sub_8090A60: @ 8090A60
	ldr r0, _08090A6C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08090A70 @ =0x00000c5a
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08090A6C: .4byte gUnknown_20397B0
_08090A70: .4byte 0x00000c5a
	thumb_func_end sub_8090A60

	thumb_func_start sub_8090A74
sub_8090A74: @ 8090A74
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	strh r1, [r2, 0x30]
	cmp r1, 0
	bne _08090A88
	movs r3, 0x68
	movs r4, 0x40
	b _08090A9A
_08090A88:
	movs r3, 0x98
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 19
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
_08090A9A:
	ldrh r0, [r2, 0x20]
	lsls r0, 3
	strh r0, [r2, 0x32]
	ldrh r0, [r2, 0x22]
	lsls r0, 3
	strh r0, [r2, 0x34]
	lsls r1, r3, 3
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, 0
	bge _08090AB4
	adds r0, 0x7
_08090AB4:
	asrs r0, 3
	strh r0, [r2, 0x36]
	lsls r0, r4, 16
	asrs r0, 13
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	subs r0, r1
	cmp r0, 0
	bge _08090AC8
	adds r0, 0x7
_08090AC8:
	asrs r0, 3
	strh r0, [r2, 0x38]
	movs r0, 0x8
	strh r0, [r2, 0x3A]
	ldr r0, _08090ADC @ =sub_8090AE0
	str r0, [r2, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090ADC: .4byte sub_8090AE0
	thumb_func_end sub_8090A74

	thumb_func_start sub_8090AE0
sub_8090AE0: @ 8090AE0
	push {r4,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08090B10
	ldrh r0, [r3, 0x36]
	ldrh r4, [r3, 0x32]
	adds r0, r4
	strh r0, [r3, 0x32]
	ldrh r1, [r3, 0x38]
	ldrh r4, [r3, 0x34]
	adds r1, r4
	strh r1, [r3, 0x34]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r3, 0x20]
	lsls r1, 16
	asrs r1, 19
	strh r1, [r3, 0x22]
	subs r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _08090B54
_08090B10:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08090B20
	movs r0, 0x68
	strh r0, [r3, 0x20]
	movs r0, 0x40
	b _08090B32
_08090B20:
	movs r0, 0x98
	strh r0, [r3, 0x20]
	movs r4, 0x30
	ldrsh r1, [r3, r4]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x10
_08090B32:
	strh r0, [r3, 0x22]
	ldr r0, _08090B5C @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
	ldr r0, _08090B60 @ =gUnknown_20397B0
	ldr r2, [r0]
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r1, 2
	ldr r4, _08090B64 @ =0x00000a6c
	adds r0, r2, r4
	adds r0, r1
	str r3, [r0]
	ldr r0, _08090B68 @ =0x00000c5a
	adds r2, r0
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
_08090B54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090B5C: .4byte SpriteCallbackDummy
_08090B60: .4byte gUnknown_20397B0
_08090B64: .4byte 0x00000a6c
_08090B68: .4byte 0x00000c5a
	thumb_func_end sub_8090AE0

	thumb_func_start sub_8090B6C
sub_8090B6C: @ 8090B6C
	push {r4,lr}
	ldr r4, _08090B90 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _08090B94 @ =0x00000a68
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08090B8A
	bl sub_80913C4
	ldr r0, [r4]
	ldr r1, _08090B94 @ =0x00000a68
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_08090B8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090B90: .4byte gUnknown_20397B0
_08090B94: .4byte 0x00000a68
	thumb_func_end sub_8090B6C

	thumb_func_start sub_8090B98
sub_8090B98: @ 8090B98
	push {r4-r6,lr}
	movs r3, 0
	ldr r6, _08090BEC @ =gUnknown_20397B0
	lsls r0, 16
	asrs r4, r0, 16
	movs r5, 0x5
	negs r5, r5
_08090BA6:
	ldr r0, [r6]
	lsls r1, r3, 2
	ldr r2, _08090BF0 @ =0x00000a6c
	adds r0, r2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, 0
	beq _08090BFE
	ldrh r0, [r1, 0x22]
	adds r0, r4, r0
	strh r0, [r1, 0x22]
	ldr r2, [r2]
	ldrh r1, [r2, 0x26]
	ldrh r0, [r2, 0x22]
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r0, 16
	cmp r0, 0xC0
	bls _08090BF4
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08090BFE
	.align 2, 0
_08090BEC: .4byte gUnknown_20397B0
_08090BF0: .4byte 0x00000a6c
_08090BF4:
	adds r2, 0x3E
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2]
_08090BFE:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _08090BA6
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8090B98

	thumb_func_start sub_8090C10
sub_8090C10: @ 8090C10
	push {r4,r5,lr}
	lsls r0, 24
	ldr r5, _08090C3C @ =gUnknown_20397B0
	ldr r1, [r5]
	lsrs r4, r0, 22
	ldr r0, _08090C40 @ =0x00000a6c
	adds r1, r0
	adds r1, r4
	ldr r0, [r1]
	cmp r0, 0
	beq _08090C36
	bl sub_80913C4
	ldr r0, [r5]
	ldr r1, _08090C40 @ =0x00000a6c
	adds r0, r1
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_08090C36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090C3C: .4byte gUnknown_20397B0
_08090C40: .4byte 0x00000a6c
	thumb_func_end sub_8090C10

	thumb_func_start sub_8090C44
sub_8090C44: @ 8090C44
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _08090C7C @ =gUnknown_20397B0
_08090C4A:
	ldr r0, [r6]
	lsls r4, r5, 2
	ldr r1, _08090C80 @ =0x00000a6c
	adds r0, r1
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _08090C6A
	bl sub_80913C4
	ldr r0, [r6]
	ldr r1, _08090C80 @ =0x00000a6c
	adds r0, r1
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_08090C6A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08090C4A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08090C7C: .4byte gUnknown_20397B0
_08090C80: .4byte 0x00000a6c
	thumb_func_end sub_8090C44

	thumb_func_start sub_8090C84
sub_8090C84: @ 8090C84
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _08090CB8 @ =gUnknown_20397B0
	ldr r1, [r1]
	lsrs r0, 22
	ldr r3, _08090CBC @ =0x00000a6c
	adds r1, r3
	adds r1, r0
	ldr r3, [r1]
	cmp r3, 0
	beq _08090CB2
	movs r0, 0x3
	adds r1, r2, 0
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
_08090CB2:
	pop {r0}
	bx r0
	.align 2, 0
_08090CB8: .4byte gUnknown_20397B0
_08090CBC: .4byte 0x00000a6c
	thumb_func_end sub_8090C84

	thumb_func_start sub_8090CC0
sub_8090CC0: @ 8090CC0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	cmp r4, 0
	bne _08090CF0
	ldr r3, _08090CE8 @ =gUnknown_20397B0
	ldr r0, [r3]
	ldr r5, _08090CEC @ =0x00000a68
	adds r2, r0, r5
	lsls r1, 2
	adds r5, 0x4
	adds r0, r5
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r4, [r0]
	b _08090D0C
	.align 2, 0
_08090CE8: .4byte gUnknown_20397B0
_08090CEC: .4byte 0x00000a68
_08090CF0:
	cmp r4, 0x1
	bne _08090D42
	ldr r3, _08090D48 @ =gUnknown_20397B0
	ldr r0, [r3]
	ldr r1, _08090D4C @ =0x00000a68
	adds r2, r0, r1
	lsls r1, r5, 2
	ldr r4, _08090D50 @ =0x00000a84
	adds r0, r4
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	movs r1, 0
	str r1, [r0]
_08090D0C:
	adds r5, r3, 0
	ldr r0, [r5]
	ldr r4, _08090D4C @ =0x00000a68
	adds r0, r4
	ldr r1, [r0]
	ldr r0, _08090D54 @ =sub_80911B0
	str r0, [r1, 0x1C]
	bl sub_8090058
	ldr r1, [r5]
	adds r1, r4
	ldr r3, [r1]
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r5]
	adds r0, r4
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0x7
	strb r1, [r0]
_08090D42:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090D48: .4byte gUnknown_20397B0
_08090D4C: .4byte 0x00000a68
_08090D50: .4byte 0x00000a84
_08090D54: .4byte sub_80911B0
	thumb_func_end sub_8090CC0

	thumb_func_start sub_8090D58
sub_8090D58: @ 8090D58
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r0, 0xE
	bne _08090DA4
	ldr r3, _08090D98 @ =gUnknown_20397B0
	ldr r1, [r3]
	lsls r5, r6, 2
	ldr r4, _08090D9C @ =0x00000a6c
	adds r0, r1, r4
	adds r0, r5
	ldr r2, _08090DA0 @ =0x00000a68
	adds r1, r2
	ldr r2, [r1]
	str r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r3]
	adds r0, r4
	adds r0, r5
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0xC
	strb r1, [r0]
	b _08090DE0
	.align 2, 0
_08090D98: .4byte gUnknown_20397B0
_08090D9C: .4byte 0x00000a6c
_08090DA0: .4byte 0x00000a68
_08090DA4:
	ldr r5, _08090DF8 @ =gUnknown_20397B0
	ldr r1, [r5]
	lsls r4, r6, 2
	ldr r3, _08090DFC @ =0x00000a84
	adds r0, r1, r3
	adds r0, r4
	ldr r2, _08090E00 @ =0x00000a68
	adds r1, r2
	ldr r2, [r1]
	str r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r5]
	adds r0, r3
	adds r0, r4
	ldr r4, [r0]
	adds r0, r6, 0
	movs r1, 0x6
	bl __umodsi3
	movs r1, 0x13
	subs r1, r0
	adds r4, 0x43
	strb r1, [r4]
	adds r3, r5, 0
_08090DE0:
	ldr r1, [r3]
	ldr r0, _08090E00 @ =0x00000a68
	adds r1, r0
	ldr r2, [r1]
	ldr r0, _08090E04 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
	movs r0, 0
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08090DF8: .4byte gUnknown_20397B0
_08090DFC: .4byte 0x00000a84
_08090E00: .4byte 0x00000a68
_08090E04: .4byte SpriteCallbackDummy
	thumb_func_end sub_8090D58

	thumb_func_start sub_8090E08
sub_8090E08: @ 8090E08
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r0, 0xE
	bne _08090E30
	ldr r3, _08090E24 @ =gUnknown_20397B0
	ldr r1, [r3]
	ldr r0, _08090E28 @ =0x00000afc
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08090E2C @ =0x00000a6c
	b _08090E3C
	.align 2, 0
_08090E24: .4byte gUnknown_20397B0
_08090E28: .4byte 0x00000afc
_08090E2C: .4byte 0x00000a6c
_08090E30:
	ldr r3, _08090E5C @ =gUnknown_20397B0
	ldr r1, [r3]
	ldr r0, _08090E60 @ =0x00000afc
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08090E64 @ =0x00000a84
_08090E3C:
	adds r0, r4
	adds r1, r0
	str r1, [r2]
	ldr r1, [r3]
	ldr r2, _08090E68 @ =0x00000a68
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _08090E6C @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
	ldr r4, _08090E70 @ =0x00000c59
	adds r1, r4
	movs r0, 0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090E5C: .4byte gUnknown_20397B0
_08090E60: .4byte 0x00000afc
_08090E64: .4byte 0x00000a84
_08090E68: .4byte 0x00000a68
_08090E6C: .4byte SpriteCallbackDummy
_08090E70: .4byte 0x00000c59
	thumb_func_end sub_8090E08

	thumb_func_start sub_8090E74
sub_8090E74: @ 8090E74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r6, _08090E90 @ =gUnknown_20397B0
	ldr r0, [r6]
	ldr r1, _08090E94 @ =0x00000c59
	mov r9, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0x10
	bne _08090E98
	movs r0, 0
	b _08090FA0
	.align 2, 0
_08090E90: .4byte gUnknown_20397B0
_08090E94: .4byte 0x00000c59
_08090E98:
	adds r0, 0x1
	strb r0, [r1]
	ldr r2, [r6]
	ldr r5, _08090FAC @ =0x00000c59
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08090EC6
	ldr r1, _08090FB0 @ =0x00000afc
	adds r0, r2, r1
	ldr r0, [r0]
	ldr r1, [r0]
	ldrh r0, [r1, 0x22]
	subs r0, 0x1
	strh r0, [r1, 0x22]
	ldr r5, _08090FB4 @ =0x00000a68
	adds r0, r2, r5
	ldr r1, [r0]
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
_08090EC6:
	ldr r3, [r6]
	ldr r7, _08090FB0 @ =0x00000afc
	adds r4, r3, r7
	ldr r0, [r4]
	ldr r0, [r0]
	mov r8, r0
	ldr r5, _08090FB8 @ =gSineTable
	mov r0, r9
	adds r1, r3, r0
	ldrb r0, [r1]
	lsls r0, 4
	adds r0, r5
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _08090EE8
	adds r0, 0xF
_08090EE8:
	asrs r0, 4
	mov r2, r8
	strh r0, [r2, 0x24]
	ldr r0, _08090FB4 @ =0x00000a68
	mov r8, r0
	add r3, r8
	ldr r2, [r3]
	ldrb r0, [r1]
	lsls r0, 4
	adds r0, r5
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0
	bge _08090F06
	adds r0, 0xF
_08090F06:
	asrs r0, 4
	negs r0, r0
	strh r0, [r2, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _08090F6A
	ldr r3, [r3]
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	movs r5, 0x3
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r3, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r6]
	mov r2, r8
	adds r1, r0, r2
	ldr r1, [r1]
	adds r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, 0x43
	strb r0, [r1]
	bl sub_8090058
	ldr r1, [r6]
	adds r1, r7
	ldr r1, [r1]
	ldr r1, [r1]
	ands r5, r0
	lsls r5, 2
	ldrb r0, [r1, 0x5]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, 0x5]
	ldr r0, [r6]
	adds r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0x7
	strb r1, [r0]
_08090F6A:
	ldr r1, [r6]
	mov r5, r9
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _08090F9E
	mov r0, r8
	adds r2, r1, r0
	ldr r3, [r2]
	adds r1, r7
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r1]
	str r3, [r0]
	ldr r1, [r6]
	mov r2, r8
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _08090FBC @ =sub_80911B0
	str r0, [r2, 0x1C]
	adds r1, r7
	ldr r0, [r1]
	ldr r1, [r0]
	ldr r0, _08090FC0 @ =SpriteCallbackDummy
	str r0, [r1, 0x1C]
_08090F9E:
	movs r0, 0x1
_08090FA0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08090FAC: .4byte 0x00000c59
_08090FB0: .4byte 0x00000afc
_08090FB4: .4byte 0x00000a68
_08090FB8: .4byte gSineTable
_08090FBC: .4byte sub_80911B0
_08090FC0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8090E74

	thumb_func_start sub_8090FC4
sub_8090FC4: @ 8090FC4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r0, 0x1
	beq _08090FFC
	cmp r0, 0x1
	bgt _08090FDE
	cmp r0, 0
	beq _08090FE4
	b _08091072
_08090FDE:
	cmp r2, 0x2
	beq _0809101C
	b _08091072
_08090FE4:
	ldr r3, _08090FF4 @ =gUnknown_20397B0
	ldr r1, [r3]
	movs r0, 0xB0
	lsls r0, 4
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08090FF8 @ =0x00000a6c
	b _0809100A
	.align 2, 0
_08090FF4: .4byte gUnknown_20397B0
_08090FF8: .4byte 0x00000a6c
_08090FFC:
	ldr r3, _08091014 @ =gUnknown_20397B0
	ldr r1, [r3]
	movs r0, 0xB0
	lsls r0, 4
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08091018 @ =0x00000a84
_0809100A:
	adds r0, r4
	adds r1, r0
	str r1, [r2]
	adds r4, r3, 0
	b _0809102E
	.align 2, 0
_08091014: .4byte gUnknown_20397B0
_08091018: .4byte 0x00000a84
_0809101C:
	ldr r0, _08091078 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r3, 0xB0
	lsls r3, 4
	adds r2, r1, r3
	ldr r4, _0809107C @ =0x00000a68
	adds r1, r4
	str r1, [r2]
	adds r4, r0, 0
_0809102E:
	ldr r0, [r4]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _08091072
	bl InitSpriteAffineAnim
	ldr r0, [r4]
	movs r3, 0xB0
	lsls r3, 4
	adds r0, r3
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r1, [r2, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r1, [r4]
	adds r1, r3
	ldr r0, [r1]
	ldr r2, [r0]
	ldr r0, _08091080 @ =gUnknown_83CEC38
	str r0, [r2, 0x10]
	ldr r0, [r1]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAffineAnim
_08091072:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091078: .4byte gUnknown_20397B0
_0809107C: .4byte 0x00000a68
_08091080: .4byte gUnknown_83CEC38
	thumb_func_end sub_8090FC4

	thumb_func_start sub_8091084
sub_8091084: @ 8091084
	push {lr}
	ldr r0, _080910AC @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r1, 0
	beq _080910A6
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _080910B0
_080910A6:
	movs r0, 0
	b _080910C6
	.align 2, 0
_080910AC: .4byte gUnknown_20397B0
_080910B0:
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080910C4
	movs r0, 0x4
	orrs r0, r2
	strb r0, [r3]
_080910C4:
	movs r0, 0x1
_080910C6:
	pop {r1}
	bx r1
	thumb_func_end sub_8091084

	thumb_func_start sub_80910CC
sub_80910CC: @ 80910CC
	push {r4,lr}
	ldr r4, _08091110 @ =gUnknown_20397B0
	ldr r0, [r4]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _08091108
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, [r4]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80913C4
	ldr r0, [r4]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	str r0, [r1]
_08091108:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091110: .4byte gUnknown_20397B0
	thumb_func_end sub_80910CC

	thumb_func_start sub_8091114
sub_8091114: @ 8091114
	push {lr}
	ldr r3, _0809114C @ =gUnknown_20397B0
	ldr r0, [r3]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, 0
	beq _08091148
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	movs r1, 0xB0
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08091148:
	pop {r0}
	bx r0
	.align 2, 0
_0809114C: .4byte gUnknown_20397B0
	thumb_func_end sub_8091114

	thumb_func_start sub_8091150
sub_8091150: @ 8091150
	push {lr}
	ldr r0, _08091168 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xB0
	lsls r1, 4
	adds r2, r0, r1
	ldr r0, [r2]
	cmp r0, 0
	bne _0809116C
	movs r0, 0
	b _08091180
	.align 2, 0
_08091168: .4byte gUnknown_20397B0
_0809116C:
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809117E
	movs r0, 0
	str r0, [r2]
_0809117E:
	movs r0, 0x1
_08091180:
	pop {r1}
	bx r1
	thumb_func_end sub_8091150

	thumb_func_start sub_8091184
sub_8091184: @ 8091184
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080911A8 @ =gUnknown_20397B0
	ldr r1, [r1]
	ldr r2, _080911AC @ =0x00000a68
	adds r1, r2
	ldr r3, [r1]
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r3, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x5]
	bx lr
	.align 2, 0
_080911A8: .4byte gUnknown_20397B0
_080911AC: .4byte 0x00000a68
	thumb_func_end sub_8091184

	thumb_func_start sub_80911B0
sub_80911B0: @ 80911B0
	ldr r1, _080911D0 @ =gUnknown_20397B0
	ldr r1, [r1]
	movs r2, 0xCB
	lsls r2, 4
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r2, [r1]
	ldrh r1, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r1, r2
	adds r1, 0x4
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080911D0: .4byte gUnknown_20397B0
	thumb_func_end sub_80911B0

	thumb_func_start sub_80911D4
sub_80911D4: @ 80911D4
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r4, 0
	ldr r1, _0809123C @ =gUnknown_20397B0
	ldr r0, [r1]
	ldr r2, _08091240 @ =0x00000b54
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, r3
	beq _08091208
	adds r6, r2, 0
	ldr r5, _08091240 @ =0x00000b54
_080911F0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x27
	bhi _08091208
	ldr r0, [r6]
	lsls r1, r4, 1
	adds r0, r5
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _080911F0
_08091208:
	cmp r4, 0x28
	bne _08091248
	movs r4, 0
	ldr r0, [r2]
	ldr r5, _08091240 @ =0x00000b54
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08091234
	adds r6, r2, 0
_0809121C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x27
	bhi _08091234
	ldr r0, [r6]
	lsls r1, r4, 1
	adds r0, r5
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809121C
_08091234:
	cmp r4, 0x28
	bne _08091248
	ldr r0, _08091244 @ =0x0000ffff
	b _0809127A
	.align 2, 0
_0809123C: .4byte gUnknown_20397B0
_08091240: .4byte 0x00000b54
_08091244: .4byte 0x0000ffff
_08091248:
	ldr r1, [r2]
	lsls r2, r4, 1
	ldr r5, _08091280 @ =0x00000b54
	adds r0, r1, r5
	adds r0, r2
	strh r3, [r0]
	ldr r0, _08091284 @ =0x00000b04
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r4, 20
	lsrs r4, 16
	adds r0, r3, 0
	movs r1, 0x1
	bl sub_8097028
	lsls r1, r4, 5
	ldr r2, _08091288 @ =0x06010000
	adds r1, r2
	ldr r2, _0809128C @ =0x04000080
	bl CpuSet
	adds r0, r4, 0
_0809127A:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08091280: .4byte 0x00000b54
_08091284: .4byte 0x00000b04
_08091288: .4byte 0x06010000
_0809128C: .4byte 0x04000080
	thumb_func_end sub_80911D4

	thumb_func_start sub_8091290
sub_8091290: @ 8091290
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	movs r3, 0
	ldr r6, _080912C4 @ =gUnknown_20397B0
_0809129A:
	ldr r1, [r6]
	lsls r2, r3, 1
	ldr r4, _080912C8 @ =0x00000b54
	adds r0, r1, r4
	adds r4, r0, r2
	ldrh r0, [r4]
	cmp r0, r5
	bne _080912D0
	ldr r0, _080912CC @ =0x00000b04
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _080912DA
	strh r0, [r4]
	b _080912DA
	.align 2, 0
_080912C4: .4byte gUnknown_20397B0
_080912C8: .4byte 0x00000b54
_080912CC: .4byte 0x00000b04
_080912D0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x27
	bls _0809129A
_080912DA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8091290

	thumb_func_start sub_80912E0
sub_80912E0: @ 80912E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x18]
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r9, r5
	mov r2, sp
	ldr r0, _08091390 @ =gUnknown_83CEBF0
	ldm r0!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	adds r0, r6, 0
	bl mon_icon_convert_unown_species_id
	mov r10, r0
	mov r6, r10
	mov r2, sp
	ldr r1, _08091394 @ =gUnknown_83D3E80
	adds r1, r6, r1
	ldr r3, _08091398 @ =0x0000dac0
	adds r0, r3, 0
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r2, 0x2]
	adds r0, r6, 0
	bl sub_80911D4
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	ldr r0, _0809139C @ =0x0000ffff
	cmp r5, r0
	beq _080913B2
	ldr r7, [sp, 0x18]
	lsls r1, r7, 16
	asrs r1, 16
	mov r0, r8
	lsls r2, r0, 16
	asrs r2, 16
	mov r0, sp
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080913AC
	ldr r1, _080913A0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldr r2, _080913A4 @ =0x000003ff
	ands r2, r5
	ldrh r3, [r0, 0x4]
	ldr r1, _080913A8 @ =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, 0x4]
	movs r1, 0x3
	ands r4, r1
	lsls r3, r4, 2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r3
	strb r1, [r0, 0x5]
	mov r1, r10
	strh r1, [r0, 0x2E]
	b _080913B4
	.align 2, 0
_08091390: .4byte gUnknown_83CEBF0
_08091394: .4byte gUnknown_83D3E80
_08091398: .4byte 0x0000dac0
_0809139C: .4byte 0x0000ffff
_080913A0: .4byte gSprites
_080913A4: .4byte 0x000003ff
_080913A8: .4byte 0xfffffc00
_080913AC:
	adds r0, r6, 0
	bl sub_8091290
_080913B2:
	movs r0, 0
_080913B4:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80912E0

	thumb_func_start sub_80913C4
sub_80913C4: @ 80913C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	bl sub_8091290
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80913C4

	thumb_func_start sub_80913DC
sub_80913DC: @ 80913DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08091404 @ =sub_8091420
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08091408 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091404: .4byte sub_8091420
_08091408: .4byte gTasks
	thumb_func_end sub_80913DC

	thumb_func_start sub_809140C
sub_809140C: @ 809140C
	push {lr}
	ldr r0, _0809141C @ =sub_8091420
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0809141C: .4byte sub_8091420
	thumb_func_end sub_809140C

	thumb_func_start sub_8091420
sub_8091420: @ 8091420
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08091444 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _08091504
	lsls r0, 2
	ldr r1, _08091448 @ =_0809144C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091444: .4byte gTasks
_08091448: .4byte _0809144C
	.align 2, 0
_0809144C:
	.4byte _08091460
	.4byte _08091498
	.4byte _080914CC
	.4byte _080914D6
	.4byte _080914FC
_08091460:
	ldr r1, _0809148C @ =gUnknown_20397B0
	ldr r0, [r1]
	ldr r2, _08091490 @ =0x000002d2
	adds r0, r2
	movs r2, 0
	strb r2, [r0]
	ldr r1, [r1]
	movs r3, 0xB3
	lsls r3, 2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _08091494 @ =0x00004abc
	adds r1, r0
	movs r2, 0x80
	lsls r2, 5
	movs r0, 0
	movs r3, 0x1
	bl RequestDma3Fill
	strh r0, [r4, 0xA]
	b _08091508
	.align 2, 0
_0809148C: .4byte gUnknown_20397B0
_08091490: .4byte 0x000002d2
_08091494: .4byte 0x00004abc
_08091498:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	bl CheckForSpaceForDma3Request
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0809150E
	ldr r0, _080914C4 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _080914C8 @ =0x00004abc
	adds r1, r2
	movs r0, 0x2
	bl SetBgTilemapBuffer
	movs r0, 0x2
	bl ShowBg
	b _08091508
	.align 2, 0
_080914C4: .4byte gUnknown_20397B0
_080914C8: .4byte 0x00004abc
_080914CC:
	ldrb r0, [r4, 0xC]
	movs r1, 0
	bl sub_8091850
	b _08091508
_080914D6:
	bl sub_809196C
	cmp r0, 0
	beq _0809150E
	ldrb r0, [r4, 0xC]
	bl sub_8091A94
	bl sub_8091F80
	ldrb r0, [r4, 0xC]
	bl sub_80900D4
	ldr r1, _080914F8 @ =0x00005b0a
	movs r0, 0xC
	bl SetGpuReg
	b _08091508
	.align 2, 0
_080914F8: .4byte 0x00005b0a
_080914FC:
	adds r0, r2, 0
	bl DestroyTask
	b _08091508
_08091504:
	movs r0, 0
	b _0809150C
_08091508:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
_0809150C:
	strh r0, [r4, 0x8]
_0809150E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8091420

	thumb_func_start sub_8091514
sub_8091514: @ 8091514
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	adds r0, r4, 0
	bl sub_80916F4
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r5, _080915D8 @ =gUnknown_20397B0
	ldr r2, [r5]
	lsls r0, r6, 24
	asrs r3, r0, 24
	movs r0, 0x6
	negs r0, r0
	adds r1, r0, 0
	cmp r3, 0
	ble _08091540
	movs r1, 0x6
_08091540:
	ldr r7, _080915DC @ =0x000002ce
	adds r0, r2, r7
	strh r1, [r0]
	movs r1, 0x2
	cmp r3, 0
	ble _0809154E
	movs r1, 0x1
_0809154E:
	ldr r7, _080915E0 @ =0x000002d3
	adds r0, r2, r7
	strb r1, [r0]
	ldr r2, [r5]
	movs r0, 0xB4
	lsls r0, 2
	adds r1, r2, r0
	movs r0, 0x20
	strh r0, [r1]
	movs r1, 0xB5
	lsls r1, 2
	adds r0, r2, r1
	strb r4, [r0]
	ldr r2, [r5]
	movs r1, 0
	cmp r3, 0
	bgt _08091572
	movs r1, 0x5
_08091572:
	ldr r4, _080915E4 @ =0x000002d6
	adds r0, r2, r4
	strh r1, [r0]
	movs r7, 0xB6
	lsls r7, 2
	adds r0, r2, r7
	strh r3, [r0]
	movs r1, 0x38
	cmp r3, 0
	ble _0809158C
	movs r0, 0x84
	lsls r0, 1
	adds r1, r0, 0
_0809158C:
	ldr r4, _080915E8 @ =0x000002da
	adds r0, r2, r4
	strh r1, [r0]
	movs r1, 0
	cmp r3, 0
	bgt _0809159A
	movs r1, 0x5
_0809159A:
	movs r7, 0xB7
	lsls r7, 2
	adds r0, r2, r7
	strh r1, [r0]
	ldr r0, _080915EC @ =0x000002de
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	movs r3, 0xB8
	lsls r3, 2
	adds r1, r2, r3
	movs r0, 0x2
	strh r0, [r1]
	ldr r4, _080915F0 @ =0x00000a64
	adds r0, r2, r4
	mov r7, r8
	strb r7, [r0]
	ldr r0, [r5]
	ldr r1, _080915F4 @ =0x00000a65
	adds r0, r1
	strb r6, [r0]
	ldr r0, [r5]
	ldr r3, _080915F8 @ =0x00000a63
	adds r0, r3
	movs r1, 0
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080915D8: .4byte gUnknown_20397B0
_080915DC: .4byte 0x000002ce
_080915E0: .4byte 0x000002d3
_080915E4: .4byte 0x000002d6
_080915E8: .4byte 0x000002da
_080915EC: .4byte 0x000002de
_080915F0: .4byte 0x00000a64
_080915F4: .4byte 0x00000a65
_080915F8: .4byte 0x00000a63
	thumb_func_end sub_8091514

	thumb_func_start sub_80915FC
sub_80915FC: @ 80915FC
	push {r4-r6,lr}
	ldr r4, _08091618 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r5, _0809161C @ =0x00000a63
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08091644
	cmp r0, 0x1
	bgt _08091620
	cmp r0, 0
	beq _08091626
	b _080916D4
	.align 2, 0
_08091618: .4byte gUnknown_20397B0
_0809161C: .4byte 0x00000a63
_08091620:
	cmp r0, 0x2
	beq _08091694
	b _080916D4
_08091626:
	ldr r2, _08091688 @ =0x00000a64
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	bl sub_8091850
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08091644:
	bl sub_809196C
	cmp r0, 0
	beq _080916E2
	ldr r6, _0809168C @ =gUnknown_20397B0
	ldr r1, [r6]
	ldr r4, _08091688 @ =0x00000a64
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r5, _08091690 @ =0x00000a65
	adds r1, r5
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	bl sub_8090574
	ldr r1, [r6]
	adds r4, r1, r4
	ldrb r0, [r4]
	adds r1, r5
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	bl sub_8091C48
	ldr r0, [r6]
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	bl sub_809200C
	b _080916D4
	.align 2, 0
_08091688: .4byte 0x00000a64
_0809168C: .4byte gUnknown_20397B0
_08091690: .4byte 0x00000a65
_08091694:
	bl sub_809062C
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, [r4]
	movs r4, 0xB4
	lsls r4, 2
	adds r3, r2, r4
	ldrh r0, [r3]
	cmp r0, 0
	beq _080916D0
	movs r0, 0xB3
	lsls r0, 2
	adds r1, r2, r0
	subs r4, 0x2
	adds r0, r2, r4
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _080916E2
	bl sub_8091E34
	bl sub_80920AC
_080916D0:
	adds r0, r5, 0
	b _080916E4
_080916D4:
	ldr r0, _080916EC @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r4, _080916F0 @ =0x00000a63
	adds r1, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080916E2:
	movs r0, 0x1
_080916E4:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080916EC: .4byte gUnknown_20397B0
_080916F0: .4byte 0x00000a63
	thumb_func_end sub_80915FC

	thumb_func_start sub_80916F4
sub_80916F4: @ 80916F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0
	cmp r1, r4
	beq _0809171E
_08091708:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xD
	bls _08091714
	movs r1, 0
_08091714:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r1, r4
	bne _08091708
_0809171E:
	movs r0, 0x1
	negs r0, r0
	cmp r2, 0x6
	bhi _08091728
	movs r0, 0x1
_08091728:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80916F4

	thumb_func_start sub_8091730
sub_8091730: @ 8091730
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_808BDBC
	ldr r0, _08091758 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0809175C @ =0x00000a62
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091758: .4byte gUnknown_20397B0
_0809175C: .4byte 0x00000a62
	thumb_func_end sub_8091730

	thumb_func_start sub_8091760
sub_8091760: @ 8091760
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08091780 @ =gUnknown_20397B0
	ldr r0, [r1]
	ldr r2, _08091784 @ =0x00000a62
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _08091844
	lsls r0, 2
	ldr r1, _08091788 @ =_0809178C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091780: .4byte gUnknown_20397B0
_08091784: .4byte 0x00000a62
_08091788: .4byte _0809178C
	.align 2, 0
_0809178C:
	.4byte _080917A0
	.4byte _080917C8
	.4byte _080917E2
	.4byte _0809181C
	.4byte _08091840
_080917A0:
	ldr r0, [r4]
	movs r1, 0xE7
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080917C0 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldr r2, _080917C4 @ =0x00000a62
	adds r1, r2
	b _0809182E
	.align 2, 0
_080917C0: .4byte 0x0000ffff
_080917C4: .4byte 0x00000a62
_080917C8:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08091844
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8091850
	b _08091826
_080917E2:
	bl sub_809196C
	cmp r0, 0x1
	bne _08091844
	bl sub_8091EF0
	ldr r4, _08091810 @ =gUnknown_20397B0
	ldr r0, [r4]
	movs r1, 0xE7
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08091814 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldr r2, _08091818 @ =0x00000a62
	adds r1, r2
	b _0809182E
	.align 2, 0
_08091810: .4byte gUnknown_20397B0
_08091814: .4byte 0x0000ffff
_08091818: .4byte 0x00000a62
_0809181C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08091844
_08091826:
	ldr r0, _08091838 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r0, _0809183C @ =0x00000a62
	adds r1, r0
_0809182E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08091844
	.align 2, 0
_08091838: .4byte gUnknown_20397B0
_0809183C: .4byte 0x00000a62
_08091840:
	movs r0, 0
	b _08091846
_08091844:
	movs r0, 0x1
_08091846:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8091760

	thumb_func_start sub_8091850
sub_8091850: @ 8091850
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _08091904 @ =gUnknown_20397B0
	ldr r2, [r4]
	ldr r3, _08091908 @ =0x000006f9
	adds r2, r3
	movs r3, 0
	strb r3, [r2]
	ldr r2, [r4]
	ldr r3, _0809190C @ =0x000006fa
	adds r2, r3
	strb r0, [r2]
	ldr r0, [r4]
	ldr r2, _08091910 @ =0x000006fb
	adds r0, r2
	strb r1, [r0]
	ldr r1, [r4]
	adds r2, r1, r2
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	beq _08091896
	movs r3, 0
	ldr r0, _08091914 @ =0x000002d2
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0809188A
	movs r3, 0x1
_0809188A:
	strb r3, [r2]
	ldr r0, [r4]
	ldr r1, _08091918 @ =0x00004abc
	adds r0, r1
	bl sub_8091A24
_08091896:
	ldr r6, _08091904 @ =gUnknown_20397B0
	ldr r0, [r6]
	ldr r2, _0809190C @ =0x000006fa
	adds r0, r2
	ldrb r0, [r0]
	bl sub_808BD94
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0809191C @ =gUnknown_83D2A10
	adds r7, r1, r0
	ldr r0, [r7, 0x4]
	ldr r1, [r6]
	ldr r5, _08091920 @ =0x00000792
	adds r1, r5
	bl LZ77UnCompWram
	ldr r1, [r6]
	ldr r3, _08091918 @ =0x00004abc
	adds r0, r1, r3
	adds r5, r1, r5
	ldr r4, _08091910 @ =0x000006fb
	adds r2, r1, r4
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	ldr r3, _08091914 @ =0x000002d2
	adds r1, r3
	ldrb r3, [r1]
	adds r1, r5, 0
	bl sub_8091984
	ldr r1, [r6]
	adds r4, r1, r4
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	beq _08091924
	ldr r0, [r7, 0x8]
	ldr r2, _08091914 @ =0x000002d2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 21
	movs r3, 0x80
	lsls r3, 15
	adds r1, r3
	lsrs r1, 16
	movs r2, 0x40
	bl LoadPalette
	b _08091938
	.align 2, 0
_08091904: .4byte gUnknown_20397B0
_08091908: .4byte 0x000006f9
_0809190C: .4byte 0x000006fa
_08091910: .4byte 0x000006fb
_08091914: .4byte 0x000002d2
_08091918: .4byte 0x00004abc
_0809191C: .4byte gUnknown_83D2A10
_08091920: .4byte 0x00000792
_08091924:
	ldr r0, [r7, 0x8]
	ldr r2, _08091960 @ =0x000002d2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 6
	ldr r2, _08091964 @ =gPlttBufferUnfaded + 0x80
	adds r1, r2
	movs r2, 0x20
	bl CpuSet
_08091938:
	ldr r1, [r7]
	ldr r0, _08091968 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r3, _08091960 @ =0x000002d2
	adds r0, r3
	ldrb r3, [r0]
	lsls r3, 8
	movs r0, 0
	str r0, [sp]
	movs r0, 0x2
	movs r2, 0
	bl DecompressAndLoadBgGfxUsingHeap
	movs r0, 0x2
	bl CopyBgTilemapBufferToVram
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091960: .4byte 0x000002d2
_08091964: .4byte gPlttBufferUnfaded + 0x80
_08091968: .4byte gUnknown_20397B0
	thumb_func_end sub_8091850

	thumb_func_start sub_809196C
sub_809196C: @ 809196C
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809197E
	movs r0, 0x1
	b _08091980
_0809197E:
	movs r0, 0
_08091980:
	pop {r1}
	bx r1
	thumb_func_end sub_809196C

	thumb_func_start sub_8091984
sub_8091984: @ 8091984
	push {r4-r7,lr}
	sub sp, 0x24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, r3, 17
	ldr r0, _080919F0 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r4, 0xB3
	lsls r4, 2
	adds r0, r4
	ldrh r4, [r0]
	lsrs r4, 3
	adds r4, 0xA
	lsls r2, 24
	asrs r7, r2, 24
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	adds r6, r4, r0
	movs r0, 0x3F
	ands r6, r0
	movs r4, 0x14
	str r4, [sp]
	movs r2, 0x12
	str r2, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	str r4, [sp, 0x10]
	str r2, [sp, 0x14]
	movs r0, 0x11
	str r0, [sp, 0x18]
	lsls r3, 24
	asrs r3, 16
	str r3, [sp, 0x1C]
	movs r0, 0xC0
	lsls r0, 10
	adds r5, r0
	asrs r5, 16
	str r5, [sp, 0x20]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl CopyRectToBgTilemapBufferRect
	cmp r7, 0
	beq _08091A16
	cmp r7, 0
	ble _080919F4
	lsls r0, r6, 16
	movs r1, 0xA0
	lsls r1, 13
	adds r0, r1
	b _080919FA
	.align 2, 0
_080919F0: .4byte gUnknown_20397B0
_080919F4:
	lsls r0, r6, 16
	ldr r4, _08091A20 @ =0xfffc0000
	adds r0, r4
_080919FA:
	lsrs r6, r0, 16
	lsls r2, r6, 24
	lsrs r2, 24
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x12
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0x2
	movs r1, 0
	movs r3, 0x2
	bl FillBgTilemapBufferRect
_08091A16:
	add sp, 0x24
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091A20: .4byte 0xfffc0000
	thumb_func_end sub_8091984

	thumb_func_start sub_8091A24
sub_8091A24: @ 8091A24
	push {r4-r6,lr}
	adds r2, r0, 0
	ldr r0, _08091A50 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xB3
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 3
	adds r3, r0, 0
	adds r3, 0x1E
	movs r0, 0x3F
	ands r3, r0
	adds r0, r3, 0
	cmp r0, 0x1F
	bgt _08091A54
	lsls r0, 1
	movs r6, 0x98
	lsls r6, 3
	adds r0, r6
	b _08091A5C
	.align 2, 0
_08091A50: .4byte gUnknown_20397B0
_08091A54:
	lsls r0, 1
	movs r1, 0xC8
	lsls r1, 4
	adds r0, r1
_08091A5C:
	adds r2, r0
	movs r0, 0
	movs r5, 0
	movs r4, 0x3F
_08091A64:
	strh r5, [r2]
	adds r2, 0x2
	adds r3, 0x1
	ands r3, r4
	adds r1, r3, 0
	cmp r1, 0
	bne _08091A76
	ldr r6, _08091A90 @ =0xfffff7c0
	adds r2, r6
_08091A76:
	cmp r1, 0x20
	bne _08091A80
	movs r1, 0xF8
	lsls r1, 3
	adds r2, r1
_08091A80:
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2B
	bls _08091A64
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091A90: .4byte 0xfffff7c0
	thumb_func_end sub_8091A24

	thumb_func_start sub_8091A94
sub_8091A94: @ 8091A94
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08091C1C @ =gUnknown_20397B0
	mov r10, r1
	ldr r1, [r1]
	movs r2, 0xBE
	lsls r2, 2
	adds r0, r1, r2
	str r0, [sp, 0x28]
	mov r3, sp
	adds r3, 0x28
	str r3, [sp, 0x30]
	ldr r0, _08091C20 @ =0x00030200
	str r0, [r3, 0x4]
	ldr r4, _08091C24 @ =0x000006fc
	adds r1, r4
	str r1, [sp, 0x18]
	add r0, sp, 0x1C
	ldr r7, _08091C28 @ =0x0000dac9
	strh r7, [r0]
	add r0, sp, 0x20
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r1, sp, 0x18
	add r0, sp, 0x8
	movs r2, 0x10
	bl memcpy
	mov r0, r8
	bl sub_808BD94
	lsls r0, 24
	mov r5, r10
	ldr r4, [r5]
	ldr r2, _08091C2C @ =gUnknown_83D29D0
	lsrs r0, 22
	adds r1, r0, r2
	ldrh r3, [r1]
	movs r5, 0xE3
	lsls r5, 3
	adds r1, r4, r5
	strh r3, [r1]
	adds r2, 0x2
	adds r0, r2
	ldrh r0, [r0]
	ldr r1, _08091C30 @ =0x0000071a
	adds r4, r1
	strh r0, [r4]
	add r0, sp, 0x8
	bl LoadSpritePalettes
	mov r2, r10
	ldr r0, [r2]
	movs r6, 0xE7
	lsls r6, 3
	adds r0, r6
	movs r1, 0xFC
	lsls r1, 2
	str r1, [r0]
	adds r0, r7, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	mov r4, r10
	ldr r3, [r4]
	lsls r1, r0, 4
	movs r5, 0x87
	lsls r5, 1
	mov r9, r5
	add r1, r9
	ldr r4, _08091C34 @ =0x0000071c
	adds r2, r3, r4
	strh r1, [r2]
	adds r3, r6
	movs r5, 0x80
	lsls r5, 9
	adds r1, r5, 0
	lsls r1, r0
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r0, r7, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	mov r1, r10
	ldr r4, [r1]
	lsls r1, r0, 4
	add r1, r9
	ldr r3, _08091C38 @ =0x0000071e
	adds r2, r4, r3
	strh r1, [r2]
	adds r6, r4, r6
	lsls r5, r0
	ldr r0, [r6]
	orrs r0, r5
	str r0, [r6]
	ldr r5, _08091C3C @ =0x000021a8
	adds r4, r5
	mov r0, r8
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x8
	bl StringCopyPadded
	mov r4, r10
	ldr r0, [r4]
	adds r5, r0, r5
	movs r2, 0xBE
	lsls r2, 2
	adds r1, r0, r2
	movs r3, 0x9F
	lsls r3, 3
	adds r0, r3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0
	bl sub_808BEB4
	ldr r0, [sp, 0x30]
	bl LoadSpriteSheet
	mov r0, r8
	bl GetBoxNamePtr
	bl sub_8091F60
	movs r4, 0
	lsls r0, 16
	asrs r6, r0, 16
_08091BBC:
	lsls r1, r4, 5
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	ldr r0, _08091C40 @ =gUnknown_83D2B7C
	movs r2, 0x1C
	movs r3, 0x18
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r5, _08091C1C @ =gUnknown_20397B0
	ldr r2, [r5]
	lsls r0, r4, 2
	movs r3, 0xE4
	lsls r3, 3
	adds r2, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08091C44 @ =gSprites
	adds r0, r1
	str r0, [r2]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08091BBC
	ldr r0, [r5]
	movs r4, 0xDF
	lsls r4, 3
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091C1C: .4byte gUnknown_20397B0
_08091C20: .4byte 0x00030200
_08091C24: .4byte 0x000006fc
_08091C28: .4byte 0x0000dac9
_08091C2C: .4byte gUnknown_83D29D0
_08091C30: .4byte 0x0000071a
_08091C34: .4byte 0x0000071c
_08091C38: .4byte 0x0000071e
_08091C3C: .4byte 0x000021a8
_08091C40: .4byte gUnknown_83D2B7C
_08091C44: .4byte gSprites
	thumb_func_end sub_8091A94

	thumb_func_start sub_8091C48
sub_8091C48: @ 8091C48
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x2C]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r4, _08091CC4 @ =gUnknown_20397B0
	ldr r2, [r4]
	movs r1, 0xBE
	lsls r1, 2
	adds r0, r2, r1
	str r0, [sp, 0x20]
	add r3, sp, 0x20
	ldr r5, _08091CC8 @ =0x0000ffff
	mov r12, r5
	movs r6, 0xC0
	lsls r6, 10
	mov r9, r6
	ldr r0, _08091CCC @ =0x00030200
	str r0, [r3, 0x4]
	add r1, sp, 0x8
	ldr r0, _08091CD0 @ =gUnknown_83D2B7C
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	movs r1, 0
	movs r5, 0xDF
	lsls r5, 3
	adds r2, r5
	ldrb r0, [r2]
	mov r8, r4
	adds r6, r3, 0
	cmp r0, 0
	bne _08091C9C
	movs r1, 0x1
_08091C9C:
	strb r1, [r2]
	mov r7, r8
	ldr r0, [r7]
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _08091CD8
	ldr r0, [r6, 0x4]
	mov r1, r12
	ands r0, r1
	mov r2, r9
	orrs r0, r2
	str r0, [r6, 0x4]
	ldr r0, [r7]
	ldr r3, _08091CD4 @ =0x0000071c
	adds r0, r3
	ldrh r0, [r0]
	mov r9, r0
	b _08091CFC
	.align 2, 0
_08091CC4: .4byte gUnknown_20397B0
_08091CC8: .4byte 0x0000ffff
_08091CCC: .4byte 0x00030200
_08091CD0: .4byte gUnknown_83D2B7C
_08091CD4: .4byte 0x0000071c
_08091CD8:
	ldr r0, [r6, 0x4]
	mov r5, r12
	ands r0, r5
	movs r1, 0x80
	lsls r1, 11
	orrs r0, r1
	str r0, [r6, 0x4]
	mov r7, r8
	ldr r0, [r7]
	ldr r1, _08091E18 @ =0x0000071c
	adds r0, r1
	ldrh r0, [r0]
	mov r9, r0
	add r1, sp, 0x8
	movs r0, 0x4
	strh r0, [r1]
	ldr r0, _08091E1C @ =0x0000dac9
	strh r0, [r1, 0x2]
_08091CFC:
	mov r2, r8
	ldr r4, [r2]
	ldr r5, _08091E20 @ =0x000021a8
	adds r4, r5
	ldr r0, [sp, 0x2C]
	bl GetBoxNamePtr
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x8
	bl StringCopyPadded
	mov r3, r8
	ldr r0, [r3]
	adds r5, r0, r5
	movs r7, 0xBE
	lsls r7, 2
	adds r1, r0, r7
	movs r2, 0x9F
	lsls r2, 3
	adds r0, r2
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0
	bl sub_808BEB4
	adds r0, r6, 0
	bl LoadSpriteSheet
	ldr r0, [sp, 0x2C]
	bl sub_808BD94
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08091E24 @ =gUnknown_83D29D0
	adds r0, r1
	mov r1, r9
	movs r2, 0x4
	bl LoadPalette
	ldr r0, [sp, 0x2C]
	bl GetBoxNamePtr
	bl sub_8091F60
	lsls r0, 16
	mov r3, r10
	lsls r2, r3, 24
	asrs r2, 24
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 6
	lsrs r5, r0, 16
	str r5, [sp, 0x28]
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r7, 0
	mov r9, r8
	negs r2, r2
	mov r8, r2
_08091D82:
	lsls r6, r7, 5
	mov r0, r10
	lsls r1, r0, 16
	asrs r1, 16
	adds r1, r6
	lsls r1, 16
	asrs r1, 16
	add r0, sp, 0x8
	movs r2, 0x1C
	movs r3, 0x18
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r1, r9
	ldr r2, [r1]
	lsls r5, r7, 2
	movs r3, 0xE5
	lsls r3, 3
	adds r2, r3
	adds r2, r5
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08091E28 @ =gSprites
	adds r1, r0
	str r1, [r2]
	mov r0, r8
	lsls r4, r0, 1
	add r4, r8
	lsls r4, 1
	strh r4, [r1, 0x2E]
	ldr r1, [r2]
	ldr r3, [sp, 0x28]
	lsls r0, r3, 16
	asrs r0, 16
	adds r0, r6
	strh r0, [r1, 0x30]
	ldr r0, [r2]
	movs r6, 0
	strh r6, [r0, 0x32]
	ldr r0, [r2]
	ldr r1, _08091E2C @ =sub_8091E84
	str r1, [r0, 0x1C]
	lsls r1, r7, 24
	lsrs r1, 24
	bl StartSpriteAnim
	mov r1, r9
	ldr r0, [r1]
	movs r2, 0xE4
	lsls r2, 3
	adds r0, r2
	adds r0, r5
	ldr r1, [r0]
	strh r4, [r1, 0x2E]
	ldr r2, [r0]
	movs r1, 0x1
	strh r1, [r2, 0x30]
	ldr r1, [r0]
	ldr r0, _08091E30 @ =sub_8091EB8
	str r0, [r1, 0x1C]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1
	bls _08091D82
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091E18: .4byte 0x0000071c
_08091E1C: .4byte 0x0000dac9
_08091E20: .4byte 0x000021a8
_08091E24: .4byte gUnknown_83D29D0
_08091E28: .4byte gSprites
_08091E2C: .4byte sub_8091E84
_08091E30: .4byte sub_8091EB8
	thumb_func_end sub_8091C48

	thumb_func_start sub_8091E34
sub_8091E34: @ 8091E34
	push {lr}
	ldr r0, _08091E50 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xDF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08091E54
	movs r0, 0x4
	bl FreeSpriteTilesByTag
	b _08091E5A
	.align 2, 0
_08091E50: .4byte gUnknown_20397B0
_08091E54:
	movs r0, 0x3
	bl FreeSpriteTilesByTag
_08091E5A:
	ldr r0, _08091E7C @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r3, 0xE4
	lsls r3, 3
	adds r2, r0, r3
	adds r3, 0x8
	adds r1, r0, r3
	ldr r1, [r1]
	str r1, [r2]
	ldr r2, _08091E80 @ =0x00000724
	adds r1, r0, r2
	adds r3, 0x4
	adds r0, r3
	ldr r0, [r0]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08091E7C: .4byte gUnknown_20397B0
_08091E80: .4byte 0x00000724
	thumb_func_end sub_8091E34

	thumb_func_start sub_8091E84
sub_8091E84: @ 8091E84
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x32]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08091E98
	subs r0, r1, 0x1
	strh r0, [r2, 0x32]
	b _08091EB0
_08091E98:
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _08091EB0
	ldr r0, _08091EB4 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_08091EB0:
	pop {r0}
	bx r0
	.align 2, 0
_08091EB4: .4byte SpriteCallbackDummy
	thumb_func_end sub_8091E84

	thumb_func_start sub_8091EB8
sub_8091EB8: @ 8091EB8
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08091ECC
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
	b _08091EEA
_08091ECC:
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x32]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC0
	bls _08091EEA
	adds r0, r2, 0
	bl DestroySprite
_08091EEA:
	pop {r0}
	bx r0
	thumb_func_end sub_8091EB8

	thumb_func_start sub_8091EF0
sub_8091EF0: @ 8091EF0
	push {lr}
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	bl sub_808BD94
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08091F2C @ =gUnknown_20397B0
	ldr r2, [r0]
	movs r3, 0xDF
	lsls r3, 3
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08091F38
	lsls r0, r1, 2
	ldr r1, _08091F30 @ =gUnknown_83D29D0
	adds r0, r1
	adds r3, 0x24
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, 1
	ldr r2, _08091F34 @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x2
	bl CpuSet
	b _08091F50
	.align 2, 0
_08091F2C: .4byte gUnknown_20397B0
_08091F30: .4byte gUnknown_83D29D0
_08091F34: .4byte gPlttBufferUnfaded
_08091F38:
	lsls r0, r1, 2
	ldr r1, _08091F54 @ =gUnknown_83D29D0
	adds r0, r1
	ldr r3, _08091F58 @ =0x0000071e
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, 1
	ldr r2, _08091F5C @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x2
	bl CpuSet
_08091F50:
	pop {r0}
	bx r0
	.align 2, 0
_08091F54: .4byte gUnknown_83D29D0
_08091F58: .4byte 0x0000071e
_08091F5C: .4byte gPlttBufferUnfaded
	thumb_func_end sub_8091EF0

	thumb_func_start sub_8091F60
sub_8091F60: @ 8091F60
	push {lr}
	adds r1, r0, 0
	movs r0, 0x1
	movs r2, 0
	bl GetStringWidth
	adds r1, r0, 0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	movs r0, 0xB0
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_8091F60

	thumb_func_start sub_8091F80
sub_8091F80: @ 8091F80
	push {r4,r5,lr}
	ldr r0, _08091FFC @ =gUnknown_83D2B54
	bl LoadSpriteSheet
	movs r5, 0
_08091F8A:
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 19
	movs r0, 0xB8
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	ldr r0, _08092000 @ =gUnknown_83D2BB4
	movs r2, 0x1C
	movs r3, 0x16
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08091FDC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08092004 @ =gSprites
	adds r4, r0, r1
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0x1
	cmp r5, 0
	bne _08091FCA
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
_08091FCA:
	strh r0, [r4, 0x34]
	ldr r0, _08092008 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r5, 2
	movs r2, 0xE6
	lsls r2, 3
	adds r0, r2
	adds r0, r1
	str r4, [r0]
_08091FDC:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _08091F8A
	bl sub_80939AC
	lsls r0, 24
	cmp r0, 0
	beq _08091FF6
	movs r0, 0x1
	bl sub_80920FC
_08091FF6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091FFC: .4byte gUnknown_83D2B54
_08092000: .4byte gUnknown_83D2BB4
_08092004: .4byte gSprites
_08092008: .4byte gUnknown_20397B0
	thumb_func_end sub_8091F80

	thumb_func_start sub_809200C
sub_809200C: @ 809200C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0
	ldr r7, _08092060 @ =gUnknown_20397B0
	mov r12, r7
	movs r6, 0xE6
	lsls r6, 3
	movs r4, 0
	movs r3, 0x2
_08092020:
	mov r0, r12
	ldr r1, [r0]
	lsls r0, r2, 2
	adds r1, r6
	adds r1, r0
	ldr r0, [r1]
	strh r4, [r0, 0x24]
	ldr r0, [r1]
	strh r3, [r0, 0x2E]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _08092020
	lsls r0, r5, 24
	cmp r0, 0
	bge _08092068
	ldr r1, [r7]
	movs r2, 0xE6
	lsls r2, 3
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, 0x1D
	strh r0, [r2, 0x30]
	ldr r0, _08092064 @ =0x00000734
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x5
	strh r0, [r2, 0x30]
	ldr r0, [r3]
	movs r2, 0x48
	b _08092084
	.align 2, 0
_08092060: .4byte gUnknown_20397B0
_08092064: .4byte 0x00000734
_08092068:
	ldr r1, [r7]
	movs r2, 0xE6
	lsls r2, 3
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, 0x5
	strh r0, [r2, 0x30]
	ldr r0, _080920A8 @ =0x00000734
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x1D
	strh r0, [r2, 0x30]
	ldr r0, [r3]
	movs r2, 0xF8
_08092084:
	strh r2, [r0, 0x32]
	ldr r0, [r1]
	strh r2, [r0, 0x32]
	ldr r1, [r7]
	movs r2, 0xE6
	lsls r2, 3
	adds r0, r1, r2
	ldr r2, [r0]
	movs r0, 0
	strh r0, [r2, 0x3C]
	ldr r0, _080920A8 @ =0x00000734
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920A8: .4byte 0x00000734
	thumb_func_end sub_809200C

	thumb_func_start sub_80920AC
sub_80920AC: @ 80920AC
	push {r4-r6,lr}
	movs r3, 0
	movs r5, 0
	movs r6, 0x5
	negs r6, r6
	ldr r4, _080920F8 @ =gUnknown_20397B0
_080920B8:
	ldr r1, [r4]
	lsls r0, r3, 2
	movs r2, 0xE6
	lsls r2, 3
	adds r1, r2
	adds r1, r0
	ldr r2, [r1]
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 3
	adds r0, 0x5C
	strh r0, [r2, 0x20]
	ldr r0, [r1]
	strh r5, [r0, 0x24]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _080920B8
	movs r0, 0x1
	bl sub_80920FC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080920F8: .4byte gUnknown_20397B0
	thumb_func_end sub_80920AC

	thumb_func_start sub_80920FC
sub_80920FC: @ 80920FC
	push {r4-r6,lr}
	lsls r0, 24
	cmp r0, 0
	beq _08092138
	movs r2, 0
	ldr r6, _08092134 @ =gUnknown_20397B0
	movs r5, 0xE6
	lsls r5, 3
	movs r3, 0
	movs r4, 0x1
_08092110:
	ldr r1, [r6]
	lsls r0, r2, 2
	adds r1, r5
	adds r1, r0
	ldr r0, [r1]
	strh r4, [r0, 0x2E]
	ldr r0, [r1]
	strh r3, [r0, 0x30]
	ldr r0, [r1]
	strh r3, [r0, 0x32]
	ldr r0, [r1]
	strh r3, [r0, 0x36]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _08092110
	b _08092158
	.align 2, 0
_08092134: .4byte gUnknown_20397B0
_08092138:
	movs r2, 0
	ldr r5, _08092160 @ =gUnknown_20397B0
	movs r4, 0xE6
	lsls r4, 3
	movs r3, 0
_08092142:
	ldr r0, [r5]
	lsls r1, r2, 2
	adds r0, r4
	adds r0, r1
	ldr r0, [r0]
	strh r3, [r0, 0x2E]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _08092142
_08092158:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092160: .4byte gUnknown_20397B0
	thumb_func_end sub_80920FC

	thumb_func_start sub_8092164
sub_8092164: @ 8092164
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bhi _08092230
	lsls r0, 2
	ldr r1, _0809217C @ =_08092180
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809217C: .4byte _08092180
	.align 2, 0
_08092180:
	.4byte _08092194
	.4byte _0809219A
	.4byte _080921C8
	.4byte _080921CE
	.4byte _08092220
_08092194:
	movs r0, 0
	strh r0, [r2, 0x24]
	b _08092230
_0809219A:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08092230
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x24]
	adds r0, r3
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _08092230
	strh r1, [r2, 0x32]
	strh r1, [r2, 0x24]
	b _08092230
_080921C8:
	movs r0, 0x3
	strh r0, [r2, 0x2E]
	b _08092230
_080921CE:
	ldr r0, _08092218 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r0, _0809221C @ =0x000002ce
	adds r1, r0
	ldrh r0, [r2, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2, 0x20]
	subs r0, 0x49
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAE
	bls _080921F4
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_080921F4:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08092230
	ldrh r0, [r2, 0x32]
	strh r0, [r2, 0x20]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x4
	strh r0, [r2, 0x2E]
	b _08092230
	.align 2, 0
_08092218: .4byte gUnknown_20397B0
_0809221C: .4byte 0x000002ce
_08092220:
	ldr r0, _08092234 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08092238 @ =0x000002ce
	adds r0, r1
	ldrh r1, [r2, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r2, 0x20]
_08092230:
	pop {r0}
	bx r0
	.align 2, 0
_08092234: .4byte gUnknown_20397B0
_08092238: .4byte 0x000002ce
	thumb_func_end sub_8092164

	thumb_func_start sub_809223C
sub_809223C: @ 809223C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, [sp, 0x18]
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080922A8 @ =gUnknown_83D2BB4
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080922B4
	movs r1, 0x1
	ands r1, r7
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _080922AC @ =gSprites
	adds r6, r4, r5
	adds r0, r6, 0
	bl StartSpriteAnim
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x5]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080922B0 @ =SpriteCallbackDummy
	str r0, [r4]
	adds r0, r6, 0
	b _080922B6
	.align 2, 0
_080922A8: .4byte gUnknown_83D2BB4
_080922AC: .4byte gSprites
_080922B0: .4byte SpriteCallbackDummy
_080922B4:
	movs r0, 0
_080922B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809223C

	thumb_func_start sub_80922C0
sub_80922C0: @ 80922C0
	push {lr}
	ldr r0, _080922D4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	cmp r1, 0x1
	beq _080922DC
	ldr r1, _080922D8 @ =gUnknown_2039820
	movs r0, 0
	strb r0, [r1]
	b _080922E0
	.align 2, 0
_080922D4: .4byte gUnknown_20397B0
_080922D8: .4byte gUnknown_2039820
_080922DC:
	ldr r0, _0809231C @ =gUnknown_2039820
	strb r1, [r0]
_080922E0:
	ldr r0, _08092320 @ =gUnknown_2039821
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08092324 @ =gUnknown_2039822
	strb r1, [r0]
	ldr r0, _08092328 @ =gUnknown_2039823
	strb r1, [r0]
	ldr r0, _0809232C @ =gUnknown_2039824
	strb r1, [r0]
	ldr r0, _08092330 @ =gUnknown_2039825
	strb r1, [r0]
	bl sub_8092B50
	bl sub_8094AD8
	ldr r2, _08092334 @ =gUnknown_20397B0
	ldr r0, [r2]
	ldr r1, _08092338 @ =0x00000cd2
	adds r0, r1
	movs r3, 0
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _0809233C @ =0x000021ef
	adds r0, r1
	strb r3, [r0]
	bl sub_8093A10
	pop {r0}
	bx r0
	.align 2, 0
_0809231C: .4byte gUnknown_2039820
_08092320: .4byte gUnknown_2039821
_08092324: .4byte gUnknown_2039822
_08092328: .4byte gUnknown_2039823
_0809232C: .4byte gUnknown_2039824
_08092330: .4byte gUnknown_2039825
_08092334: .4byte gUnknown_20397B0
_08092338: .4byte 0x00000cd2
_0809233C: .4byte 0x000021ef
	thumb_func_end sub_80922C0

	thumb_func_start sub_8092340
sub_8092340: @ 8092340
	push {lr}
	bl sub_8094AD8
	bl sub_8093AAC
	ldr r3, _08092380 @ =gUnknown_20397B0
	ldr r0, [r3]
	ldr r1, _08092384 @ =0x00000cd2
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r3]
	ldr r1, _08092388 @ =0x000021ef
	adds r0, r1
	strb r2, [r0]
	ldr r0, _0809238C @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809237A
	ldr r0, [r3]
	ldr r1, _08092390 @ =0x000020a0
	adds r0, r1
	ldr r1, _08092394 @ =gUnknown_20397BC
	movs r2, 0x64
	bl memcpy
	bl sub_8090070
_0809237A:
	pop {r0}
	bx r0
	.align 2, 0
_08092380: .4byte gUnknown_20397B0
_08092384: .4byte 0x00000cd2
_08092388: .4byte 0x000021ef
_0809238C: .4byte gUnknown_2039822
_08092390: .4byte 0x000020a0
_08092394: .4byte gUnknown_20397BC
	thumb_func_end sub_8092340

	thumb_func_start sub_8092398
sub_8092398: @ 8092398
	push {r4-r6,lr}
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x4
	bhi _08092450
	lsls r0, 2
	ldr r1, _080923B4 @ =_080923B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080923B4: .4byte _080923B8
	.align 2, 0
_080923B8:
	.4byte _080923CC
	.4byte _080923FA
	.4byte _08092422
	.4byte _0809242A
	.4byte _08092448
_080923CC:
	adds r0, r5, 0
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x64
	strh r1, [r4]
	adds r0, r5, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x20
	strh r1, [r6]
	b _08092450
_080923FA:
	cmp r5, 0
	bne _08092406
	movs r0, 0x68
	strh r0, [r4]
	movs r0, 0x34
	b _0809244E
_08092406:
	cmp r5, 0x6
	bne _08092412
	movs r0, 0x98
	strh r0, [r4]
	movs r0, 0x84
	b _0809244E
_08092412:
	movs r0, 0x98
	strh r0, [r4]
	subs r1, r5, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x4
	b _0809244E
_08092422:
	movs r0, 0xA2
	strh r0, [r4]
	movs r0, 0xC
	b _0809244E
_0809242A:
	ldr r0, _08092444 @ =gUnknown_2039822
	ldrb r0, [r0]
	movs r1, 0xE
	cmp r0, 0
	beq _08092436
	movs r1, 0x8
_08092436:
	strh r1, [r6]
	movs r0, 0x58
	muls r0, r5
	adds r0, 0x78
	strh r0, [r4]
	b _08092450
	.align 2, 0
_08092444: .4byte gUnknown_2039822
_08092448:
	movs r0, 0xA0
	strh r0, [r4]
	movs r0, 0x60
_0809244E:
	strh r0, [r6]
_08092450:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8092398

	thumb_func_start sub_8092458
sub_8092458: @ 8092458
	push {lr}
	ldr r0, _08092480 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809248C
	cmp r0, 0x1
	bne _080924A0
	ldr r0, _08092484 @ =gUnknown_2039821
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08092488 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	b _08092496
	.align 2, 0
_08092480: .4byte gUnknown_2039820
_08092484: .4byte gUnknown_2039821
_08092488: .4byte gPlayerParty
_0809248C:
	ldr r0, _0809249C @ =gUnknown_2039821
	ldrb r0, [r0]
	movs r1, 0xB
	bl GetBoxMonDataFromSelectedBox
_08092496:
	lsls r0, 16
	lsrs r0, 16
	b _080924A2
	.align 2, 0
_0809249C: .4byte gUnknown_2039821
_080924A0:
	movs r0, 0
_080924A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8092458

	thumb_func_start sub_80924A8
sub_80924A8: @ 80924A8
	push {r4-r7,lr}
	ldr r7, _080924C4 @ =gUnknown_20397B0
	ldr r5, [r7]
	ldr r0, _080924C8 @ =0x00000ccc
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _080924D6
	ldrb r0, [r5, 0x1]
	cmp r0, 0x3
	beq _080924CC
	movs r0, 0
	b _080925F4
	.align 2, 0
_080924C4: .4byte gUnknown_20397B0
_080924C8: .4byte 0x00000ccc
_080924CC:
	bl sub_809610C
	lsls r0, 24
	lsrs r0, 24
	b _080925F4
_080924D6:
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080925D4
	ldr r1, _080925C4 @ =0x00000cb8
	adds r4, r5, r1
	movs r2, 0xCC
	lsls r2, 4
	adds r1, r5, r2
	ldr r0, [r4]
	ldr r1, [r1]
	adds r0, r1
	str r0, [r4]
	ldr r0, _080925C8 @ =0x00000cbc
	adds r3, r5, r0
	adds r2, 0x4
	adds r1, r5, r2
	ldr r0, [r3]
	ldr r1, [r1]
	adds r0, r1
	str r0, [r3]
	movs r6, 0xCB
	lsls r6, 4
	adds r1, r5, r6
	ldr r2, [r1]
	ldr r0, [r4]
	asrs r0, 8
	strh r0, [r2, 0x20]
	ldr r2, [r1]
	ldr r0, [r3]
	asrs r0, 8
	strh r0, [r2, 0x22]
	ldr r1, [r1]
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x80
	lsls r3, 1
	cmp r0, r3
	ble _08092534
	ldr r4, _080925CC @ =0xffffff00
	adds r0, r2, r4
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x40
	strh r0, [r1, 0x20]
_08092534:
	ldr r0, [r7]
	adds r0, r6
	ldr r1, [r0]
	ldrh r2, [r1, 0x20]
	movs r4, 0x20
	ldrsh r0, [r1, r4]
	cmp r0, 0x3F
	bgt _08092550
	movs r0, 0x40
	subs r0, r2
	lsls r0, 16
	asrs r0, 16
	subs r0, r3, r0
	strh r0, [r1, 0x20]
_08092550:
	ldr r0, [r7]
	adds r0, r6
	ldr r1, [r0]
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0xB0
	ble _0809256C
	adds r0, r2, 0
	subs r0, 0xB0
	lsls r0, 16
	asrs r0, 16
	subs r0, 0x10
	strh r0, [r1, 0x22]
_0809256C:
	ldr r0, [r7]
	adds r0, r6
	ldr r2, [r0]
	ldrh r3, [r2, 0x22]
	movs r4, 0x22
	ldrsh r0, [r2, r4]
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _0809258C
	subs r0, r1, r3
	movs r1, 0xB0
	lsls r0, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r2, 0x22]
_0809258C:
	ldr r0, [r7]
	ldr r2, _080925D0 @ =0x00000cd3
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080925F2
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080925F2
	ldr r0, [r7]
	adds r0, r6
	ldr r2, [r0]
	adds r2, 0x3F
	ldrb r3, [r2]
	lsrs r1, r3, 1
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _080925F2
	.align 2, 0
_080925C4: .4byte 0x00000cb8
_080925C8: .4byte 0x00000cbc
_080925CC: .4byte 0xffffff00
_080925D0: .4byte 0x00000cd3
_080925D4:
	movs r3, 0xCB
	lsls r3, 4
	adds r2, r5, r3
	ldr r1, [r2]
	ldr r4, _080925FC @ =0x00000cc8
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	ldr r1, [r2]
	ldr r2, _08092600 @ =0x00000cca
	adds r0, r5, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	bl sub_80929B0
_080925F2:
	movs r0, 0x1
_080925F4:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080925FC: .4byte 0x00000cc8
_08092600: .4byte 0x00000cca
	thumb_func_end sub_80924A8

	thumb_func_start sub_8092604
sub_8092604: @ 8092604
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r6, sp
	adds r6, 0x2
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	adds r3, r6, 0
	bl sub_8092398
	ldr r1, _08092654 @ =gUnknown_20397B0
	ldr r0, [r1]
	movs r2, 0xCD
	lsls r2, 4
	adds r0, r2
	strb r4, [r0]
	ldr r0, [r1]
	ldr r3, _08092658 @ =0x00000cd1
	adds r0, r3
	strb r5, [r0]
	ldr r1, [r1]
	mov r0, sp
	ldrh r2, [r0]
	subs r3, 0x9
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r0, [r6]
	ldr r2, _0809265C @ =0x00000cca
	adds r1, r2
	strh r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092654: .4byte gUnknown_20397B0
_08092658: .4byte 0x00000cd1
_0809265C: .4byte 0x00000cca
	thumb_func_end sub_8092604

	thumb_func_start sub_8092660
sub_8092660: @ 8092660
	push {r4-r7,lr}
	ldr r0, _0809267C @ =gUnknown_20397B0
	ldr r2, [r0]
	ldr r3, _08092680 @ =0x00000cce
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	beq _08092688
	ldr r0, _08092684 @ =0x00000ccc
	adds r1, r2, r0
	movs r0, 0xC
	b _0809268E
	.align 2, 0
_0809267C: .4byte gUnknown_20397B0
_08092680: .4byte 0x00000cce
_08092684: .4byte 0x00000ccc
_08092688:
	ldr r3, _080926D4 @ =0x00000ccc
	adds r1, r2, r3
	movs r0, 0x6
_0809268E:
	strh r0, [r1]
	ldr r1, [r4]
	ldr r0, _080926D8 @ =0x00000cd3
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	beq _080926A6
	ldr r3, _080926D4 @ =0x00000ccc
	adds r0, r1, r3
	ldrh r0, [r0]
	lsrs r0, 1
	strb r0, [r2]
_080926A6:
	ldr r2, [r4]
	ldr r1, _080926DC @ =0x00000cce
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080926E4
	cmp r1, 0x1
	beq _08092700
	ldr r3, _080926E0 @ =0x00000cca
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0xCB
	lsls r3, 4
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	b _08092716
	.align 2, 0
_080926D4: .4byte 0x00000ccc
_080926D8: .4byte 0x00000cd3
_080926DC: .4byte 0x00000cce
_080926E0: .4byte 0x00000cca
_080926E4:
	ldr r3, _080926FC @ =0x00000cca
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0xCB
	lsls r3, 4
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	adds r0, 0xC0
	b _08092716
	.align 2, 0
_080926FC: .4byte 0x00000cca
_08092700:
	ldr r3, _08092744 @ =0x00000cca
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0xCB
	lsls r3, 4
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	subs r0, 0xC0
_08092716:
	subs r7, r1, r0
	ldr r2, [r4]
	ldr r3, _08092748 @ =0x00000ccf
	adds r0, r2, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08092750
	cmp r1, 0x1
	beq _0809276C
	ldr r1, _0809274C @ =0x00000cc8
	adds r0, r2, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0xCB
	lsls r3, 4
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	b _08092782
	.align 2, 0
_08092744: .4byte 0x00000cca
_08092748: .4byte 0x00000ccf
_0809274C: .4byte 0x00000cc8
_08092750:
	ldr r3, _08092768 @ =0x00000cc8
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0xCB
	lsls r3, 4
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r0, 0xC0
	b _08092782
	.align 2, 0
_08092768: .4byte 0x00000cc8
_0809276C:
	ldr r3, _080927D4 @ =0x00000cc8
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0xCB
	lsls r3, 4
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	subs r0, 0xC0
_08092782:
	subs r0, r1, r0
	lsls r7, 8
	lsls r0, 8
	ldr r4, [r4]
	movs r3, 0xCC
	lsls r3, 4
	adds r6, r4, r3
	ldr r1, _080927D8 @ =0x00000ccc
	adds r5, r4, r1
	ldrh r1, [r5]
	bl __divsi3
	str r0, [r6]
	ldr r2, _080927DC @ =0x00000cc4
	adds r6, r4, r2
	ldrh r1, [r5]
	adds r0, r7, 0
	bl __divsi3
	str r0, [r6]
	ldr r3, _080927E0 @ =0x00000cb8
	adds r2, r4, r3
	movs r0, 0xCB
	lsls r0, 4
	adds r1, r4, r0
	ldr r0, [r1]
	movs r3, 0x20
	ldrsh r0, [r0, r3]
	lsls r0, 8
	str r0, [r2]
	ldr r0, _080927E4 @ =0x00000cbc
	adds r4, r0
	ldr r0, [r1]
	movs r1, 0x22
	ldrsh r0, [r0, r1]
	lsls r0, 8
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080927D4: .4byte 0x00000cc8
_080927D8: .4byte 0x00000ccc
_080927DC: .4byte 0x00000cc4
_080927E0: .4byte 0x00000cb8
_080927E4: .4byte 0x00000cbc
	thumb_func_end sub_8092660

	thumb_func_start sub_80927E8
sub_80927E8: @ 80927E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8092604
	bl sub_8092660
	ldr r5, _0809282C @ =gUnknown_20397B0
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x3
	beq _08092838
	ldr r2, _08092830 @ =0x000021ef
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08092852
	ldr r0, _08092834 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	bne _08092852
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r1, r2
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _08092852
	.align 2, 0
_0809282C: .4byte gUnknown_20397B0
_08092830: .4byte 0x000021ef
_08092834: .4byte gUnknown_2039822
_08092838:
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	bne _08092852
	ldr r0, [r5]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
_08092852:
	ldr r0, _08092874 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _080928AC
	ldr r0, _08092878 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08092880
	ldr r0, _0809287C @ =gUnknown_2039821
	ldrb r1, [r0]
	movs r0, 0
	bl sub_8095D44
	b _0809288E
	.align 2, 0
_08092874: .4byte gUnknown_20397B0
_08092878: .4byte gUnknown_2039820
_0809287C: .4byte gUnknown_2039821
_08092880:
	cmp r0, 0x1
	bne _0809288E
	ldr r0, _0809289C @ =gUnknown_2039821
	ldrb r1, [r0]
	movs r0, 0x1
	bl sub_8095D44
_0809288E:
	cmp r4, 0
	bne _080928A0
	movs r0, 0
	adds r1, r6, 0
	bl sub_8095C84
	b _080928AC
	.align 2, 0
_0809289C: .4byte gUnknown_2039821
_080928A0:
	cmp r4, 0x1
	bne _080928D8
	movs r0, 0x1
	adds r1, r6, 0
	bl sub_8095C84
_080928AC:
	cmp r4, 0x1
	bne _080928D8
	ldr r0, _08092920 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _080928D8
	ldr r1, _08092924 @ =gUnknown_20397B0
	ldr r0, [r1]
	ldr r2, _08092928 @ =0x00000cd2
	adds r0, r2
	strb r4, [r0]
	ldr r0, [r1]
	ldr r1, _0809292C @ =0x00000cb4
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_080928D8:
	cmp r4, 0
	beq _08092930
	cmp r4, 0
	blt _080929A0
	cmp r4, 0x3
	bgt _080929A0
	ldr r5, _08092924 @ =gUnknown_20397B0
	ldr r0, [r5]
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r2
	ldr r4, [r0]
	ldrb r1, [r4, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r4, 0x5]
	ldr r0, [r5]
	ldr r4, _0809292C @ =0x00000cb4
	adds r0, r4
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r4
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	ands r2, r0
	orrs r2, r3
	strb r2, [r1, 0x5]
	b _080929A0
	.align 2, 0
_08092920: .4byte gUnknown_2039820
_08092924: .4byte gUnknown_20397B0
_08092928: .4byte 0x00000cd2
_0809292C: .4byte 0x00000cb4
_08092930:
	ldr r3, _08092964 @ =gUnknown_20397B0
	ldr r1, [r3]
	ldr r2, _08092968 @ =0x000021ef
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08092970
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r1, r2
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r3]
	ldr r1, _0809296C @ =0x00000cb4
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _080929A0
	.align 2, 0
_08092964: .4byte gUnknown_20397B0
_08092968: .4byte 0x000021ef
_0809296C: .4byte 0x00000cb4
_08092970:
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r1, r2
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _080929A8 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080929A0
	ldr r0, _080929AC @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _080929A0
	movs r0, 0x2
	bl sub_8091184
_080929A0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080929A8: .4byte gUnknown_2039820
_080929AC: .4byte gUnknown_2039822
	thumb_func_end sub_80927E8

	thumb_func_start sub_80929B0
sub_80929B0: @ 80929B0
	push {r4,lr}
	ldr r1, _080929F4 @ =gUnknown_2039820
	ldr r4, _080929F8 @ =gUnknown_20397B0
	ldr r2, [r4]
	movs r3, 0xCD
	lsls r3, 4
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080929FC @ =gUnknown_2039821
	adds r3, 0x1
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3
	beq _08092A08
	ldr r1, _08092A00 @ =0x000021ef
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08092A22
	ldr r0, _08092A04 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	bne _08092A22
	subs r3, 0x21
	adds r0, r2, r3
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	b _08092A22
	.align 2, 0
_080929F4: .4byte gUnknown_2039820
_080929F8: .4byte gUnknown_20397B0
_080929FC: .4byte gUnknown_2039821
_08092A00: .4byte 0x000021ef
_08092A04: .4byte gUnknown_2039822
_08092A08:
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	bne _08092A22
	ldr r0, [r4]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
_08092A22:
	bl sub_8093A10
	ldr r0, _08092A3C @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _08092A52
	cmp r0, 0x1
	bgt _08092A40
	cmp r0, 0
	beq _08092A74
	b _08092AD0
	.align 2, 0
_08092A3C: .4byte gUnknown_2039820
_08092A40:
	cmp r0, 0x2
	beq _08092A4A
	cmp r0, 0x3
	bne _08092AD0
	b _08092A62
_08092A4A:
	movs r0, 0x1
	bl sub_80920FC
	b _08092AD0
_08092A52:
	ldr r0, _08092A6C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _08092A70 @ =0x00000cb4
	adds r0, r2
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0xD
	strb r1, [r0]
_08092A62:
	movs r0, 0x1
	bl sub_8091184
	b _08092AD0
	.align 2, 0
_08092A6C: .4byte gUnknown_20397B0
_08092A70: .4byte 0x00000cb4
_08092A74:
	ldr r4, _08092AD8 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r3, _08092ADC @ =0x000021ef
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _08092AD0
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r1, r2
	ldr r3, [r0]
	ldrb r1, [r3, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r4]
	ldr r3, _08092AE0 @ =0x00000cb4
	adds r0, r3
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	ands r2, r0
	movs r0, 0x8
	orrs r2, r0
	strb r2, [r1, 0x5]
	ldr r0, [r4]
	adds r0, r3
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0x15
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r3
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	movs r0, 0x2
	bl sub_8091184
_08092AD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092AD8: .4byte gUnknown_20397B0
_08092ADC: .4byte 0x000021ef
_08092AE0: .4byte 0x00000cb4
	thumb_func_end sub_80929B0

	thumb_func_start sub_8092AE4
sub_8092AE4: @ 8092AE4
	push {lr}
	ldr r0, _08092AF4 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	bne _08092AF8
	movs r3, 0
	b _08092B06
	.align 2, 0
_08092AF4: .4byte gUnknown_2039822
_08092AF8:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _08092B06
	movs r3, 0x5
_08092B06:
	ldr r0, _08092B34 @ =gUnknown_20397B0
	ldr r2, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08092B26
	ldr r0, _08092B38 @ =0x00000cd3
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
_08092B26:
	movs r0, 0x1
	adds r1, r3, 0
	bl sub_80927E8
	pop {r0}
	bx r0
	.align 2, 0
_08092B34: .4byte gUnknown_20397B0
_08092B38: .4byte 0x00000cd3
	thumb_func_end sub_8092AE4

	thumb_func_start sub_8092B3C
sub_8092B3C: @ 8092B3C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_80927E8
	pop {r0}
	bx r0
	thumb_func_end sub_8092B3C

	thumb_func_start sub_8092B50
sub_8092B50: @ 8092B50
	ldr r1, _08092B58 @ =gUnknown_2039826
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08092B58: .4byte gUnknown_2039826
	thumb_func_end sub_8092B50

	thumb_func_start sub_8092B5C
sub_8092B5C: @ 8092B5C
	ldr r0, _08092B68 @ =gUnknown_2039826
	ldr r1, _08092B6C @ =gUnknown_2039821
	ldrb r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_08092B68: .4byte gUnknown_2039826
_08092B6C: .4byte gUnknown_2039821
	thumb_func_end sub_8092B5C

	thumb_func_start sub_8092B70
sub_8092B70: @ 8092B70
	ldr r0, _08092B78 @ =gUnknown_2039826
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092B78: .4byte gUnknown_2039826
	thumb_func_end sub_8092B70

	thumb_func_start sub_8092B7C
sub_8092B7C: @ 8092B7C
	lsls r0, 24
	ldr r1, _08092B9C @ =gUnknown_20397B0
	ldr r1, [r1]
	ldr r2, _08092BA0 @ =0x00000d88
	adds r3, r1, r2
	ldr r2, _08092BA4 @ =gUnknown_83D346C
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _08092BA8 @ =0x00000d8c
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08092B9C: .4byte gUnknown_20397B0
_08092BA0: .4byte 0x00000d88
_08092BA4: .4byte gUnknown_83D346C
_08092BA8: .4byte 0x00000d8c
	thumb_func_end sub_8092B7C

	thumb_func_start sub_8092BAC
sub_8092BAC: @ 8092BAC
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _08092BCC
	ldr r0, _08092BC0 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _08092BC4 @ =0x00000d88
	adds r1, r2
	ldr r2, _08092BC8 @ =sub_8092E00
	b _08092BD6
	.align 2, 0
_08092BC0: .4byte gUnknown_20397B0
_08092BC4: .4byte 0x00000d88
_08092BC8: .4byte sub_8092E00
_08092BCC:
	ldr r0, _08092BE8 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _08092BEC @ =0x00000d88
	adds r1, r2
	ldr r2, _08092BF0 @ =sub_8092E10
_08092BD6:
	str r2, [r1]
	ldr r0, [r0]
	ldr r1, _08092BF4 @ =0x00000d8c
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08092BE8: .4byte gUnknown_20397B0
_08092BEC: .4byte 0x00000d88
_08092BF0: .4byte sub_8092E10
_08092BF4: .4byte 0x00000d8c
	thumb_func_end sub_8092BAC

	thumb_func_start sub_8092BF8
sub_8092BF8: @ 8092BF8
	push {lr}
	ldr r0, _08092C10 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08092C14 @ =0x00000d88
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08092C10: .4byte gUnknown_20397B0
_08092C14: .4byte 0x00000d88
	thumb_func_end sub_8092BF8

	thumb_func_start sub_8092C18
sub_8092C18: @ 8092C18
	push {r4,r5,lr}
	ldr r4, _08092C34 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r5, _08092C38 @ =0x00000d8c
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08092C68
	cmp r0, 0x1
	bgt _08092C3C
	cmp r0, 0
	beq _08092C46
	b _08092C9C
	.align 2, 0
_08092C34: .4byte gUnknown_20397B0
_08092C38: .4byte 0x00000d8c
_08092C3C:
	cmp r0, 0x2
	beq _08092C88
	cmp r0, 0x3
	beq _08092C4E
	b _08092C9C
_08092C46:
	ldr r0, _08092C54 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _08092C58
_08092C4E:
	movs r0, 0
	b _08092C9E
	.align 2, 0
_08092C54: .4byte gUnknown_2039822
_08092C58:
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r1, r2
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	b _08092C92
_08092C68:
	bl sub_8092E20
	lsls r0, 24
	cmp r0, 0
	bne _08092C9C
	ldr r0, [r4]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	bl sub_8092E80
	b _08092C92
_08092C88:
	bl sub_8092E54
	lsls r0, 24
	cmp r0, 0
	bne _08092C9C
_08092C92:
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08092C9C:
	movs r0, 0x1
_08092C9E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8092C18

	thumb_func_start sub_8092CA4
sub_8092CA4: @ 8092CA4
	push {r4,r5,lr}
	ldr r4, _08092CC0 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r5, _08092CC4 @ =0x00000d8c
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08092CEE
	cmp r0, 0x1
	bgt _08092CC8
	cmp r0, 0
	beq _08092CCE
	b _08092D18
	.align 2, 0
_08092CC0: .4byte gUnknown_20397B0
_08092CC4: .4byte 0x00000d8c
_08092CC8:
	cmp r0, 0x2
	beq _08092D14
	b _08092D18
_08092CCE:
	bl sub_8092E20
	lsls r0, 24
	cmp r0, 0
	bne _08092D18
	ldr r0, [r4]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	bl sub_8092EF4
	b _08092D08
_08092CEE:
	bl sub_8092E54
	lsls r0, 24
	cmp r0, 0
	bne _08092D18
	ldr r0, [r4]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
_08092D08:
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08092D18
_08092D14:
	movs r0, 0
	b _08092D1A
_08092D18:
	movs r0, 0x1
_08092D1A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8092CA4

	thumb_func_start sub_8092D20
sub_8092D20: @ 8092D20
	push {r4,r5,lr}
	ldr r4, _08092D3C @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r5, _08092D40 @ =0x00000d8c
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08092DB4
	cmp r0, 0x1
	bgt _08092D44
	cmp r0, 0
	beq _08092D4A
	b _08092DF8
	.align 2, 0
_08092D3C: .4byte gUnknown_20397B0
_08092D40: .4byte 0x00000d8c
_08092D44:
	cmp r0, 0x2
	beq _08092DF4
	b _08092DF8
_08092D4A:
	ldr r0, _08092D64 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08092D6C
	cmp r0, 0x1
	bne _08092DF4
	ldr r0, _08092D68 @ =0x00000d8d
	adds r1, r0
	movs r0, 0xE
	b _08092D76
	.align 2, 0
_08092D64: .4byte gUnknown_2039820
_08092D68: .4byte 0x00000d8d
_08092D6C:
	bl StorageGetCurrentBox
	ldr r1, [r4]
	ldr r2, _08092DA4 @ =0x00000d8d
	adds r1, r2
_08092D76:
	strb r0, [r1]
	ldr r4, _08092DA8 @ =gUnknown_20397B0
	ldr r0, [r4]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r2, _08092DA4 @ =0x00000d8d
	adds r0, r2
	ldrb r0, [r0]
	ldr r1, _08092DAC @ =gUnknown_2039821
	ldrb r1, [r1]
	bl sub_8090E08
	ldr r1, [r4]
	ldr r0, _08092DB0 @ =0x00000d8c
	adds r1, r0
	b _08092DE2
	.align 2, 0
_08092DA4: .4byte 0x00000d8d
_08092DA8: .4byte gUnknown_20397B0
_08092DAC: .4byte gUnknown_2039821
_08092DB0: .4byte 0x00000d8c
_08092DB4:
	bl sub_8090E74
	lsls r0, 24
	cmp r0, 0
	bne _08092DF8
	ldr r0, [r4]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	ldr r0, [r4]
	ldr r2, _08092DEC @ =0x00000d8d
	adds r0, r2
	ldrb r0, [r0]
	ldr r1, _08092DF0 @ =gUnknown_2039821
	ldrb r1, [r1]
	bl diegohint1
	ldr r1, [r4]
	adds r1, r5
_08092DE2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08092DF8
	.align 2, 0
_08092DEC: .4byte 0x00000d8d
_08092DF0: .4byte gUnknown_2039821
_08092DF4:
	movs r0, 0
	b _08092DFA
_08092DF8:
	movs r0, 0x1
_08092DFA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8092D20

	thumb_func_start sub_8092E00
sub_8092E00: @ 8092E00
	push {lr}
	bl sub_8092E20
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8092E00

	thumb_func_start sub_8092E10
sub_8092E10: @ 8092E10
	push {lr}
	bl sub_8092E54
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8092E10

	thumb_func_start sub_8092E20
sub_8092E20: @ 8092E20
	push {lr}
	ldr r0, _08092E44 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08092E3A
	cmp r0, 0x8
	beq _08092E48
_08092E3A:
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08092E4C
	.align 2, 0
_08092E44: .4byte gUnknown_20397B0
_08092E48:
	movs r0, 0
	b _08092E4E
_08092E4C:
	movs r0, 0x1
_08092E4E:
	pop {r1}
	bx r1
	thumb_func_end sub_8092E20

	thumb_func_start sub_8092E54
sub_8092E54: @ 8092E54
	push {lr}
	ldr r0, _08092E74 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08092E78
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	strh r0, [r1, 0x26]
	movs r0, 0x1
	b _08092E7A
	.align 2, 0
_08092E74: .4byte gUnknown_20397B0
_08092E78:
	movs r0, 0
_08092E7A:
	pop {r1}
	bx r1
	thumb_func_end sub_8092E54

	thumb_func_start sub_8092E80
sub_8092E80: @ 8092E80
	push {r4,lr}
	ldr r0, _08092EA8 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08092EB0
	cmp r0, 0x1
	bne _08092EDC
	ldr r4, _08092EAC @ =gUnknown_2039821
	ldrb r1, [r4]
	movs r0, 0xE
	bl sub_8092F60
	ldrb r1, [r4]
	movs r0, 0
	bl sub_8090CC0
	b _08092ED6
	.align 2, 0
_08092EA8: .4byte gUnknown_2039820
_08092EAC: .4byte gUnknown_2039821
_08092EB0:
	ldr r0, _08092EE4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08092EE8 @ =0x000021ef
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08092ED6
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08092EEC @ =gUnknown_2039821
	ldrb r1, [r4]
	bl sub_8092F60
	ldrb r1, [r4]
	movs r0, 0x1
	bl sub_8090CC0
_08092ED6:
	ldr r1, _08092EF0 @ =gUnknown_2039822
	movs r0, 0x1
	strb r0, [r1]
_08092EDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092EE4: .4byte gUnknown_20397B0
_08092EE8: .4byte 0x000021ef
_08092EEC: .4byte gUnknown_2039821
_08092EF0: .4byte gUnknown_2039822
	thumb_func_end sub_8092E80

	thumb_func_start sub_8092EF4
sub_8092EF4: @ 8092EF4
	push {r4,r5,lr}
	ldr r0, _08092F1C @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08092F24
	cmp r0, 0x1
	bne _08092F46
	ldr r4, _08092F20 @ =gUnknown_2039821
	ldrb r1, [r4]
	movs r0, 0xE
	bl diegohint2
	ldrb r1, [r4]
	movs r0, 0xE
	bl sub_8090D58
	b _08092F40
	.align 2, 0
_08092F1C: .4byte gUnknown_2039820
_08092F20: .4byte gUnknown_2039821
_08092F24:
	bl StorageGetCurrentBox
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08092F4C @ =gUnknown_2039821
	ldrb r1, [r5]
	adds r0, r4, 0
	bl diegohint2
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_8090D58
_08092F40:
	ldr r1, _08092F50 @ =gUnknown_2039822
	movs r0, 0
	strb r0, [r1]
_08092F46:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092F4C: .4byte gUnknown_2039821
_08092F50: .4byte gUnknown_2039822
	thumb_func_end sub_8092EF4

	thumb_func_start sub_8092F54
sub_8092F54: @ 8092F54
	push {lr}
	bl sub_8093A10
	pop {r0}
	bx r0
	thumb_func_end sub_8092F54

	thumb_func_start sub_8092F60
sub_8092F60: @ 8092F60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0xE
	bne _08092F9C
	ldr r0, _08092F8C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08092F90 @ =0x000020a0
	adds r0, r1
	ldr r3, _08092F94 @ =gPlayerParty
	ldr r1, _08092F98 @ =gUnknown_2039821
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x64
	muls r1, r2
	adds r1, r3
	movs r2, 0x64
	bl memcpy
	b _08092FAC
	.align 2, 0
_08092F8C: .4byte gUnknown_20397B0
_08092F90: .4byte 0x000020a0
_08092F94: .4byte gPlayerParty
_08092F98: .4byte gUnknown_2039821
_08092F9C:
	ldr r0, _08092FC4 @ =gUnknown_20397B0
	ldr r2, [r0]
	ldr r0, _08092FC8 @ =0x000020a0
	adds r2, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_808BCF0
_08092FAC:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8093030
	ldr r0, _08092FCC @ =gUnknown_2039823
	strb r4, [r0]
	ldr r0, _08092FD0 @ =gUnknown_2039824
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092FC4: .4byte gUnknown_20397B0
_08092FC8: .4byte 0x000020a0
_08092FCC: .4byte gUnknown_2039823
_08092FD0: .4byte gUnknown_2039824
	thumb_func_end sub_8092F60

	thumb_func_start diegohint2
diegohint2: @ 8092FD4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r6, 0xE
	bne _08093008
	ldr r1, _08092FFC @ =gPlayerParty
	movs r0, 0x64
	muls r0, r7
	adds r0, r1
	ldr r1, _08093000 @ =gUnknown_20397B0
	ldr r1, [r1]
	ldr r2, _08093004 @ =0x000020a0
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	b _08093020
	.align 2, 0
_08092FFC: .4byte gPlayerParty
_08093000: .4byte gUnknown_20397B0
_08093004: .4byte 0x000020a0
_08093008:
	ldr r5, _08093028 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r4, _0809302C @ =0x000020a0
	adds r0, r4
	bl BoxMonRestorePP
	ldr r2, [r5]
	adds r2, r4
	adds r0, r6, 0
	adds r1, r7, 0
	bl CopyBoxMonFromAnyBox
_08093020:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093028: .4byte gUnknown_20397B0
_0809302C: .4byte 0x000020a0
	thumb_func_end diegohint2

	thumb_func_start sub_8093030
sub_8093030: @ 8093030
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r0, 0xE
	bne _08093050
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809304C @ =gPlayerParty
	adds r0, r1
	bl ZeroMonData
	b _08093054
	.align 2, 0
_0809304C: .4byte gPlayerParty
_08093050:
	bl sub_808BCB4
_08093054:
	pop {r0}
	bx r0
	thumb_func_end sub_8093030

	thumb_func_start diegohint1
diegohint1: @ 8093058
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r6, 0xE
	bne _0809308C
	ldr r0, _08093080 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08093084 @ =0x00002104
	adds r0, r1
	ldr r2, _08093088 @ =gPlayerParty
	movs r1, 0x64
	muls r1, r7
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	b _0809309C
	.align 2, 0
_08093080: .4byte gUnknown_20397B0
_08093084: .4byte 0x00002104
_08093088: .4byte gPlayerParty
_0809308C:
	ldr r0, _080930D0 @ =gUnknown_20397B0
	ldr r2, [r0]
	ldr r0, _080930D4 @ =0x00002104
	adds r2, r0
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_808BCF0
_0809309C:
	adds r0, r6, 0
	adds r1, r7, 0
	bl diegohint2
	ldr r5, _080930D0 @ =gUnknown_20397B0
	ldr r1, [r5]
	ldr r4, _080930D8 @ =0x000020a0
	adds r0, r1, r4
	ldr r2, _080930D4 @ =0x00002104
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	ldr r0, [r5]
	adds r0, r4
	movs r1, 0
	bl sub_8093AD0
	ldr r0, _080930DC @ =gUnknown_2039823
	strb r6, [r0]
	ldr r0, _080930E0 @ =gUnknown_2039824
	strb r7, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080930D0: .4byte gUnknown_20397B0
_080930D4: .4byte 0x00002104
_080930D8: .4byte 0x000020a0
_080930DC: .4byte gUnknown_2039823
_080930E0: .4byte gUnknown_2039824
	thumb_func_end diegohint1

	thumb_func_start sub_80930E4
sub_80930E4: @ 80930E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl GetFirstFreeBoxSpot
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08093102
	movs r0, 0
	b _08093164
_08093102:
	ldr r5, _08093120 @ =gUnknown_2039822
	ldrb r0, [r5]
	cmp r0, 0
	beq _08093124
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r6, 0
	bl diegohint2
	bl sub_8090B6C
	movs r0, 0
	strb r0, [r5]
	b _0809313E
	.align 2, 0
_08093120: .4byte gUnknown_2039822
_08093124:
	ldr r5, _0809316C @ =gUnknown_2039821
	ldrb r1, [r5]
	movs r0, 0xE
	bl sub_8092F60
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r6, 0
	bl diegohint2
	ldrb r0, [r5]
	bl sub_8090C10
_0809313E:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _08093150
	lsrs r0, r4, 24
	bl sub_80901EC
_08093150:
	ldr r0, _08093170 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x1
_08093164:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809316C: .4byte gUnknown_2039821
_08093170: .4byte gUnknown_20397B0
	thumb_func_end sub_80930E4

	thumb_func_start sub_8093174
sub_8093174: @ 8093174
	push {lr}
	ldr r0, _08093190 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	bl sub_8093A10
	pop {r0}
	bx r0
	.align 2, 0
_08093190: .4byte gUnknown_20397B0
	thumb_func_end sub_8093174

	thumb_func_start sub_8093194
sub_8093194: @ 8093194
	push {lr}
	ldr r0, _080931A4 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _080931A8
	movs r2, 0x2
	b _080931B8
	.align 2, 0
_080931A4: .4byte gUnknown_2039822
_080931A8:
	ldr r0, _080931D8 @ =gUnknown_2039820
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r2, 0x1
	eors r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r2, r0, 31
_080931B8:
	ldr r0, _080931DC @ =gUnknown_2039821
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_8090FC4
	ldr r0, _080931E0 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _080931E4 @ =0x000021d0
	adds r0, r1, r2
	ldr r2, _080931E8 @ =0x00000cea
	adds r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080931D8: .4byte gUnknown_2039820
_080931DC: .4byte gUnknown_2039821
_080931E0: .4byte gUnknown_20397B0
_080931E4: .4byte 0x000021d0
_080931E8: .4byte 0x00000cea
	thumb_func_end sub_8093194

	thumb_func_start sub_80931EC
sub_80931EC: @ 80931EC
	push {lr}
	bl sub_8091084
	lsls r0, 24
	cmp r0, 0
	beq _080931FC
	movs r0, 0x1
	b _08093210
_080931FC:
	ldr r0, _08093214 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
_08093210:
	pop {r1}
	bx r1
	.align 2, 0
_08093214: .4byte gUnknown_20397B0
	thumb_func_end sub_80931EC

	thumb_func_start sub_8093218
sub_8093218: @ 8093218
	push {lr}
	bl sub_80910CC
	ldr r1, _0809322C @ =gUnknown_2039822
	ldrb r0, [r1]
	cmp r0, 0
	beq _08093230
	movs r0, 0
	strb r0, [r1]
	b _08093256
	.align 2, 0
_0809322C: .4byte gUnknown_2039822
_08093230:
	ldr r0, _08093240 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _08093244
	movs r2, 0xE
	b _0809324C
	.align 2, 0
_08093240: .4byte gUnknown_2039820
_08093244:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r2, r0, 24
_0809324C:
	ldr r0, _08093260 @ =gUnknown_2039821
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_8093030
_08093256:
	bl sub_8093A10
	pop {r0}
	bx r0
	.align 2, 0
_08093260: .4byte gUnknown_2039821
	thumb_func_end sub_8093218

	thumb_func_start sub_8093264
sub_8093264: @ 8093264
	push {lr}
	ldr r0, _08093284 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _08093280
	ldr r0, _08093288 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
_08093280:
	pop {r0}
	bx r0
	.align 2, 0
_08093284: .4byte gUnknown_2039822
_08093288: .4byte gUnknown_20397B0
	thumb_func_end sub_8093264

	thumb_func_start sub_809328C
sub_809328C: @ 809328C
	push {r4-r6,lr}
	ldr r0, _080932C0 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _080932D8
	ldr r4, _080932C4 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r2, _080932C8 @ =0x00002104
	adds r0, r1, r2
	ldr r3, _080932CC @ =0x000020a0
	adds r1, r3
	movs r2, 0x64
	bl memcpy
	ldr r0, [r4]
	ldr r1, _080932D0 @ =0x0000216e
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _080932D4 @ =0x0000216f
	adds r0, r2
	movs r1, 0x1
	negs r1, r1
	b _08093354
	.align 2, 0
_080932C0: .4byte gUnknown_2039822
_080932C4: .4byte gUnknown_20397B0
_080932C8: .4byte 0x00002104
_080932CC: .4byte 0x000020a0
_080932D0: .4byte 0x0000216e
_080932D4: .4byte 0x0000216f
_080932D8:
	ldr r0, _0809330C @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _08093324
	ldr r4, _08093310 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r3, _08093314 @ =0x00002104
	adds r0, r3
	ldr r3, _08093318 @ =gPlayerParty
	ldr r1, _0809331C @ =gUnknown_2039821
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x64
	muls r1, r2
	adds r1, r3
	movs r2, 0x64
	bl memcpy
	ldr r0, [r4]
	ldr r1, _08093320 @ =0x0000216e
	adds r0, r1
	movs r1, 0xE
	strb r1, [r0]
	b _08093348
	.align 2, 0
_0809330C: .4byte gUnknown_2039820
_08093310: .4byte gUnknown_20397B0
_08093314: .4byte 0x00002104
_08093318: .4byte gPlayerParty
_0809331C: .4byte gUnknown_2039821
_08093320: .4byte 0x0000216e
_08093324:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080933BC @ =gUnknown_2039821
	ldrb r1, [r1]
	ldr r4, _080933C0 @ =gUnknown_20397B0
	ldr r2, [r4]
	ldr r3, _080933C4 @ =0x00002104
	adds r2, r3
	bl sub_808BCF0
	bl StorageGetCurrentBox
	ldr r1, [r4]
	ldr r2, _080933C8 @ =0x0000216e
	adds r1, r2
	strb r0, [r1]
_08093348:
	ldr r0, _080933C0 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080933BC @ =gUnknown_2039821
	ldrb r1, [r1]
	ldr r3, _080933CC @ =0x0000216f
	adds r0, r3
_08093354:
	strb r1, [r0]
	ldr r6, _080933C0 @ =gUnknown_20397B0
	ldr r0, [r6]
	ldr r4, _080933D0 @ =0x0000216a
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r6]
	ldr r5, _080933D4 @ =0x0000216b
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _080933D8 @ =0x00002172
	adds r2, r0, r1
	movs r1, 0x39
	strh r1, [r2]
	ldr r1, _080933DC @ =0x00002174
	adds r3, r0, r1
	ldr r1, _080933E0 @ =0x00000123
	strh r1, [r3]
	ldr r1, _080933E4 @ =0x00002176
	adds r3, r0, r1
	ldr r1, _080933E8 @ =0x00000163
	strh r1, [r3]
	ldr r3, _080933C4 @ =0x00002104
	adds r0, r3
	movs r1, 0x51
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, [r6]
	movs r2, 0x1
	ands r3, r2
	adds r1, r4
	strb r3, [r1]
	ldr r1, [r6]
	lsrs r0, 17
	movs r2, 0x1
	ands r0, r2
	adds r1, r5
	strb r0, [r1]
	ldr r1, [r6]
	adds r4, r1, r4
	ldrh r0, [r4]
	cmp r0, 0
	beq _080933F0
	ldr r0, _080933EC @ =0x00002169
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	b _080933FE
	.align 2, 0
_080933BC: .4byte gUnknown_2039821
_080933C0: .4byte gUnknown_20397B0
_080933C4: .4byte 0x00002104
_080933C8: .4byte 0x0000216e
_080933CC: .4byte 0x0000216f
_080933D0: .4byte 0x0000216a
_080933D4: .4byte 0x0000216b
_080933D8: .4byte 0x00002172
_080933DC: .4byte 0x00002174
_080933E0: .4byte 0x00000123
_080933E4: .4byte 0x00002176
_080933E8: .4byte 0x00000163
_080933EC: .4byte 0x00002169
_080933F0:
	ldr r3, _08093410 @ =0x00002169
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, [r6]
	ldr r1, _08093414 @ =0x00002168
	adds r0, r1
	strb r2, [r0]
_080933FE:
	ldr r0, _08093418 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _0809341C @ =0x00002170
	adds r0, r2
	movs r1, 0
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093410: .4byte 0x00002169
_08093414: .4byte 0x00002168
_08093418: .4byte gUnknown_20397B0
_0809341C: .4byte 0x00002170
	thumb_func_end sub_809328C

	thumb_func_start sub_8093420
sub_8093420: @ 8093420
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08093444 @ =gUnknown_20397B0
	ldr r3, [r0]
	ldr r2, _08093448 @ =0x00002169
	adds r1, r3, r2
	ldrb r1, [r1]
	mov r12, r0
	cmp r1, 0
	beq _08093450
	ldr r1, _0809344C @ =0x00002168
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	b _08093604
	.align 2, 0
_08093444: .4byte gUnknown_20397B0
_08093448: .4byte 0x00002169
_0809344C: .4byte 0x00002168
_08093450:
	ldr r2, _08093460 @ =0x00002170
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, 0
	beq _08093464
	cmp r0, 0x1
	beq _0809353C
	b _08093600
	.align 2, 0
_08093460: .4byte 0x00002170
_08093464:
	movs r6, 0
	mov r5, r12
	movs r7, 0
_0809346A:
	ldr r2, [r5]
	ldr r1, _08093500 @ =0x0000216e
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xE
	bne _08093488
	adds r1, 0x1
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r6
	beq _080934C2
_08093488:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _08093504 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08093508 @ =0x00002172
	adds r2, r1
	movs r1, 0x51
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080934AE
	ldr r0, [r5]
	ldr r2, _0809350C @ =0x0000216a
	adds r0, r2
	strb r7, [r0]
_080934AE:
	movs r0, 0x2
	ands r4, r0
	ldr r0, _08093510 @ =gUnknown_20397B0
	mov r12, r0
	cmp r4, 0
	beq _080934C2
	ldr r0, [r5]
	ldr r1, _08093514 @ =0x0000216b
	adds r0, r1
	strb r7, [r0]
_080934C2:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _0809346A
	mov r2, r12
	ldr r1, [r2]
	ldr r2, _0809350C @ =0x0000216a
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _080934DC
	b _080935EE
_080934DC:
	ldr r2, _08093518 @ =0x0000216c
	adds r0, r1, r2
	movs r1, 0
	strb r1, [r0]
	mov r2, r12
	ldr r0, [r2]
	ldr r2, _0809351C @ =0x0000216d
	adds r0, r2
	strb r1, [r0]
	mov r0, r12
	ldr r1, [r0]
	adds r2, 0x3
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08093600
	.align 2, 0
_08093500: .4byte 0x0000216e
_08093504: .4byte gPlayerParty
_08093508: .4byte 0x00002172
_0809350C: .4byte 0x0000216a
_08093510: .4byte gUnknown_20397B0
_08093514: .4byte 0x0000216b
_08093518: .4byte 0x0000216c
_0809351C: .4byte 0x0000216d
_08093520:
	mov r1, r12
	ldr r0, [r1]
	ldr r2, _08093538 @ =0x00002169
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	mov r1, r12
	ldr r0, [r1]
	subs r2, 0x1
	adds r0, r2
	strb r3, [r0]
	b _080935E0
	.align 2, 0
_08093538: .4byte 0x00002169
_0809353C:
	movs r6, 0
	mov r7, r12
	ldr r0, _08093610 @ =0x0000ffff
	mov r8, r0
_08093544:
	ldr r3, [r7]
	ldr r1, _08093614 @ =0x0000216c
	adds r0, r3, r1
	ldrb r0, [r0]
	ldr r2, _08093618 @ =0x0000216d
	adds r1, r3, r2
	ldrb r1, [r1]
	adds r2, 0x5
	adds r3, r2
	movs r2, 0x51
	bl GetAndCopyBoxMonDataFromAnyBox
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080935A0
	ldr r5, [r7]
	ldr r1, _0809361C @ =0x0000216e
	adds r0, r5, r1
	ldrh r2, [r0]
	subs r1, 0x2
	adds r0, r5, r1
	ldrh r3, [r0]
	mov r1, r8
	ands r1, r2
	mov r0, r8
	ands r0, r3
	cmp r1, r0
	beq _080935A0
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0809358E
	ldr r2, _08093620 @ =0x0000216a
	adds r1, r5, r2
	movs r0, 0
	strb r0, [r1]
_0809358E:
	movs r0, 0x2
	ands r4, r0
	cmp r4, 0
	beq _080935A0
	ldr r0, [r7]
	ldr r1, _08093624 @ =0x0000216b
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080935A0:
	ldr r2, _08093628 @ =gUnknown_20397B0
	ldr r1, [r2]
	ldr r0, _08093618 @ =0x0000216d
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	mov r12, r2
	cmp r0, 0x1D
	ble _080935D6
	ldr r0, [r2]
	ldr r1, _08093618 @ =0x0000216d
	adds r0, r1
	strb r3, [r0]
	ldr r1, [r2]
	ldr r2, _08093614 @ =0x0000216c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xD
	bgt _08093520
_080935D6:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _08093544
_080935E0:
	mov r0, r12
	ldr r1, [r0]
	ldr r2, _08093620 @ =0x0000216a
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _08093600
_080935EE:
	subs r2, 0x1
	adds r0, r1, r2
	movs r1, 0x1
	strb r1, [r0]
	mov r2, r12
	ldr r0, [r2]
	ldr r2, _0809362C @ =0x00002168
	adds r0, r2
	strb r1, [r0]
_08093600:
	movs r0, 0x1
	negs r0, r0
_08093604:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093610: .4byte 0x0000ffff
_08093614: .4byte 0x0000216c
_08093618: .4byte 0x0000216d
_0809361C: .4byte 0x0000216e
_08093620: .4byte 0x0000216a
_08093624: .4byte 0x0000216b
_08093628: .4byte gUnknown_20397B0
_0809362C: .4byte 0x00002168
	thumb_func_end sub_8093420

	thumb_func_start sub_8093630
sub_8093630: @ 8093630
	push {lr}
	ldr r0, _08093650 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809364A
	ldr r0, _08093654 @ =gUnknown_20397BC
	ldr r1, _08093658 @ =gUnknown_20397B0
	ldr r1, [r1]
	ldr r2, _0809365C @ =0x000020a0
	adds r1, r2
	movs r2, 0x64
	bl memcpy
_0809364A:
	pop {r0}
	bx r0
	.align 2, 0
_08093650: .4byte gUnknown_2039822
_08093654: .4byte gUnknown_20397BC
_08093658: .4byte gUnknown_20397B0
_0809365C: .4byte 0x000020a0
	thumb_func_end sub_8093630

	thumb_func_start sub_8093660
sub_8093660: @ 8093660
	push {lr}
	ldr r0, _08093684 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _080936A8
	ldr r0, _08093688 @ =gUnknown_2039823
	ldrb r0, [r0]
	cmp r0, 0xE
	bne _08093698
	ldr r0, _0809368C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08093690 @ =0x000020a0
	adds r0, r1
	ldr r1, _08093694 @ =gUnknown_20397BC
	movs r2, 0x64
	bl memcpy
	b _080936A8
	.align 2, 0
_08093684: .4byte gUnknown_2039822
_08093688: .4byte gUnknown_2039823
_0809368C: .4byte gUnknown_20397B0
_08093690: .4byte 0x000020a0
_08093694: .4byte gUnknown_20397BC
_08093698:
	ldr r0, _080936AC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080936B0 @ =0x000020a0
	adds r0, r1
	ldr r1, _080936B4 @ =gUnknown_20397BC
	movs r2, 0x50
	bl memcpy
_080936A8:
	pop {r0}
	bx r0
	.align 2, 0
_080936AC: .4byte gUnknown_20397B0
_080936B0: .4byte 0x000020a0
_080936B4: .4byte gUnknown_20397BC
	thumb_func_end sub_8093660

	thumb_func_start sub_80936B8
sub_80936B8: @ 80936B8
	push {r4,r5,lr}
	ldr r0, _080936EC @ =gUnknown_2039822
	ldrb r5, [r0]
	cmp r5, 0
	beq _08093708
	bl sub_8093630
	ldr r3, _080936F0 @ =gUnknown_20397B0
	ldr r1, [r3]
	ldr r0, _080936F4 @ =0x0000217c
	adds r2, r1, r0
	ldr r0, _080936F8 @ =gUnknown_20397BC
	str r0, [r2]
	ldr r2, _080936FC @ =0x00002179
	adds r1, r2
	movs r2, 0
	strb r2, [r1]
	ldr r0, [r3]
	ldr r4, _08093700 @ =0x00002178
	adds r0, r4
	strb r2, [r0]
	ldr r0, [r3]
	ldr r1, _08093704 @ =0x0000217a
	adds r0, r1
	strb r2, [r0]
	b _0809379A
	.align 2, 0
_080936EC: .4byte gUnknown_2039822
_080936F0: .4byte gUnknown_20397B0
_080936F4: .4byte 0x0000217c
_080936F8: .4byte gUnknown_20397BC
_080936FC: .4byte 0x00002179
_08093700: .4byte 0x00002178
_08093704: .4byte 0x0000217a
_08093708:
	ldr r0, _08093744 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _08093764
	ldr r4, _08093748 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r0, _0809374C @ =0x0000217c
	adds r2, r1, r0
	ldr r0, _08093750 @ =gPlayerParty
	str r0, [r2]
	ldr r0, _08093754 @ =gUnknown_2039821
	ldrb r0, [r0]
	ldr r2, _08093758 @ =0x00002179
	adds r1, r2
	strb r0, [r1]
	bl CountPartyMons
	ldr r1, [r4]
	subs r0, 0x1
	ldr r2, _0809375C @ =0x00002178
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	ldr r4, _08093760 @ =0x0000217a
	adds r0, r4
	strb r5, [r0]
	b _0809379A
	.align 2, 0
_08093744: .4byte gUnknown_2039820
_08093748: .4byte gUnknown_20397B0
_0809374C: .4byte 0x0000217c
_08093750: .4byte gPlayerParty
_08093754: .4byte gUnknown_2039821
_08093758: .4byte 0x00002179
_0809375C: .4byte 0x00002178
_08093760: .4byte 0x0000217a
_08093764:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl GetBoxedMonPtr
	ldr r3, _080937A0 @ =gUnknown_20397B0
	ldr r2, [r3]
	ldr r4, _080937A4 @ =0x0000217c
	adds r1, r2, r4
	str r0, [r1]
	ldr r0, _080937A8 @ =gUnknown_2039821
	ldrb r0, [r0]
	ldr r1, _080937AC @ =0x00002179
	adds r2, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r2, _080937B0 @ =0x00002178
	adds r0, r2
	movs r1, 0x1D
	strb r1, [r0]
	ldr r0, [r3]
	subs r4, 0x2
	adds r0, r4
	movs r1, 0x5
	strb r1, [r0]
_0809379A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080937A0: .4byte gUnknown_20397B0
_080937A4: .4byte 0x0000217c
_080937A8: .4byte gUnknown_2039821
_080937AC: .4byte 0x00002179
_080937B0: .4byte 0x00002178
	thumb_func_end sub_80936B8

	thumb_func_start sub_80937B4
sub_80937B4: @ 80937B4
	push {r4,lr}
	ldr r0, _080937C4 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _080937C8
	bl sub_8093660
	b _080937D0
	.align 2, 0
_080937C4: .4byte gUnknown_2039822
_080937C8:
	ldr r4, _080937D8 @ =gUnknown_2039821
	bl sub_8138B20
	strb r0, [r4]
_080937D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080937D8: .4byte gUnknown_2039821
	thumb_func_end sub_80937B4

	thumb_func_start CompactPartySlots
CompactPartySlots: @ 80937DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r7, _08093828 @ =0x0000ffff
	movs r6, 0
	movs r5, 0
	movs r0, 0x64
	mov r9, r0
	ldr r1, _0809382C @ =gPlayerParty
	mov r8, r1
	subs r0, 0x65
	mov r10, r0
_080937F8:
	mov r0, r9
	muls r0, r6
	mov r1, r8
	adds r4, r0, r1
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	cmp r0, 0
	beq _08093830
	cmp r6, r5
	beq _08093820
	mov r0, r9
	muls r0, r5
	add r0, r8
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
_08093820:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	b _0809383A
	.align 2, 0
_08093828: .4byte 0x0000ffff
_0809382C: .4byte gPlayerParty
_08093830:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r10
	bne _0809383A
	adds r7, r6, 0
_0809383A:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080937F8
	lsls r7, 16
	cmp r5, 0x5
	bhi _08093862
	movs r6, 0x64
	ldr r4, _08093874 @ =gPlayerParty
_0809384E:
	adds r0, r5, 0
	muls r0, r6
	adds r0, r4
	bl ZeroMonData
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0809384E
_08093862:
	asrs r0, r7, 16
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093874: .4byte gPlayerParty
	thumb_func_end CompactPartySlots

	thumb_func_start sub_8093878
sub_8093878: @ 8093878
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	ldr r2, _080938A8 @ =gUnknown_20397B0
	ldr r1, [r2]
	ldr r3, _080938AC @ =0x00000ce7
	adds r1, r3
	strb r0, [r1]
	ldr r0, _080938B0 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _080938B8
	ldr r0, [r2]
	ldr r1, _080938B4 @ =0x000020a0
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	b _080938EC
	.align 2, 0
_080938A8: .4byte gUnknown_20397B0
_080938AC: .4byte 0x00000ce7
_080938B0: .4byte gUnknown_2039822
_080938B4: .4byte 0x000020a0
_080938B8:
	ldr r4, _080938F4 @ =gUnknown_2039820
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1
	bne _080938D8
	ldr r0, _080938F8 @ =gUnknown_2039821
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080938FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
_080938D8:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _080938EC
	ldr r0, _080938F8 @ =gUnknown_2039821
	ldrb r0, [r0]
	movs r1, 0x8
	mov r2, sp
	bl SetBoxMonDataFromSelectedBox
_080938EC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080938F4: .4byte gUnknown_2039820
_080938F8: .4byte gUnknown_2039821
_080938FC: .4byte gPlayerParty
	thumb_func_end sub_8093878

	thumb_func_start sub_8093900
sub_8093900: @ 8093900
	push {lr}
	ldr r0, _08093928 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _08093934
	ldr r0, _0809392C @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	bne _08093934
	ldr r0, _08093930 @ =gUnknown_2039821
	ldrb r0, [r0]
	bl CountPartyAliveNonEggMonsExcept
	lsls r0, 24
	cmp r0, 0
	bne _08093934
	movs r0, 0x1
	b _08093936
	.align 2, 0
_08093928: .4byte gUnknown_2039820
_0809392C: .4byte gUnknown_2039822
_08093930: .4byte gUnknown_2039821
_08093934:
	movs r0, 0
_08093936:
	pop {r1}
	bx r1
	thumb_func_end sub_8093900

	thumb_func_start sub_809393C
sub_809393C: @ 809393C
	push {lr}
	ldr r0, _08093980 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _08093998
	ldr r0, _08093984 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809397C
	ldr r0, _08093988 @ =gUnknown_2039821
	ldrb r0, [r0]
	bl CountPartyAliveNonEggMonsExcept
	lsls r0, 24
	cmp r0, 0
	bne _0809397C
	ldr r0, _0809398C @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r2, _08093990 @ =0x00000ce9
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08093998
	ldr r2, _08093994 @ =0x000020a0
	adds r0, r1, r2
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08093998
_0809397C:
	movs r0, 0x1
	b _0809399A
	.align 2, 0
_08093980: .4byte gUnknown_2039822
_08093984: .4byte gUnknown_2039820
_08093988: .4byte gUnknown_2039821
_0809398C: .4byte gUnknown_20397B0
_08093990: .4byte 0x00000ce9
_08093994: .4byte 0x000020a0
_08093998:
	movs r0, 0
_0809399A:
	pop {r1}
	bx r1
	thumb_func_end sub_809393C

	thumb_func_start sub_80939A0
sub_80939A0: @ 80939A0
	ldr r0, _080939A8 @ =gUnknown_2039822
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080939A8: .4byte gUnknown_2039822
	thumb_func_end sub_80939A0

	thumb_func_start sub_80939AC
sub_80939AC: @ 80939AC
	push {lr}
	movs r1, 0
	ldr r0, _080939C4 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	bne _080939BE
	movs r1, 0x1
_080939BE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080939C4: .4byte gUnknown_2039820
	thumb_func_end sub_80939AC

	thumb_func_start sub_80939C8
sub_80939C8: @ 80939C8
	push {lr}
	movs r1, 0
	ldr r0, _080939EC @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080939E6
	ldr r0, _080939F0 @ =gUnknown_2039821
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _080939E6
	movs r1, 0x1
_080939E6:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080939EC: .4byte gUnknown_2039820
_080939F0: .4byte gUnknown_2039821
	thumb_func_end sub_80939C8

	thumb_func_start sub_80939F4
sub_80939F4: @ 80939F4
	push {lr}
	movs r1, 0
	ldr r0, _08093A0C @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08093A06
	movs r1, 0x1
_08093A06:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093A0C: .4byte gUnknown_2039820
	thumb_func_end sub_80939F4

	thumb_func_start sub_8093A10
sub_8093A10: @ 8093A10
	push {r4,lr}
	ldr r0, _08093A44 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r2, 0
	ldr r3, _08093A48 @ =gUnknown_2039822
	ldrb r0, [r3]
	cmp r0, 0
	bne _08093A22
	movs r2, 0x1
_08093A22:
	ldr r4, _08093A4C @ =0x00000ce6
	adds r0, r1, r4
	strb r2, [r0]
	ldrb r0, [r3]
	cmp r0, 0
	bne _08093AA0
	ldr r0, _08093A50 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _08093A5A
	cmp r0, 0x1
	bgt _08093A54
	cmp r0, 0
	beq _08093A8A
	b _08093AA0
	.align 2, 0
_08093A44: .4byte gUnknown_20397B0
_08093A48: .4byte gUnknown_2039822
_08093A4C: .4byte 0x00000ce6
_08093A50: .4byte gUnknown_2039820
_08093A54:
	cmp r0, 0x3
	bgt _08093AA0
	b _08093A80
_08093A5A:
	ldr r1, _08093A78 @ =gUnknown_2039821
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _08093A80
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08093A7C @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl sub_8093AD0
	b _08093AA0
	.align 2, 0
_08093A78: .4byte gUnknown_2039821
_08093A7C: .4byte gPlayerParty
_08093A80:
	movs r0, 0
	movs r1, 0x2
	bl sub_8093AD0
	b _08093AA0
_08093A8A:
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08093AA8 @ =gUnknown_2039821
	ldrb r1, [r1]
	bl GetBoxedMonPtr
	movs r1, 0x1
	bl sub_8093AD0
_08093AA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093AA8: .4byte gUnknown_2039821
	thumb_func_end sub_8093A10

	thumb_func_start sub_8093AAC
sub_8093AAC: @ 8093AAC
	push {lr}
	ldr r0, _08093AC0 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _08093AC8
	ldr r0, _08093AC4 @ =gUnknown_20397BC
	movs r1, 0
	bl sub_8093AD0
	b _08093ACC
	.align 2, 0
_08093AC0: .4byte gUnknown_2039822
_08093AC4: .4byte gUnknown_20397BC
_08093AC8:
	bl sub_8093A10
_08093ACC:
	pop {r0}
	bx r0
	thumb_func_end sub_8093AAC

	thumb_func_start sub_8093AD0
sub_8093AD0: @ 8093AD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	ldr r0, _08093B38 @ =gUnknown_20397B0
	mov r8, r0
	ldr r1, [r0]
	ldr r3, _08093B3C @ =0x00000ce2
	adds r2, r1, r3
	movs r0, 0
	strh r0, [r2]
	mov r9, r0
	mov r10, r0
	cmp r5, 0
	bne _08093BEC
	adds r6, r4, 0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	mov r2, r8
	ldr r1, [r2]
	movs r3, 0xCE
	lsls r3, 4
	adds r1, r3
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _08093B16
	b _08093D0C
_08093B16:
	adds r0, r4, 0
	movs r1, 0x4
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0
	beq _08093B44
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08093B40 @ =0x00000ce9
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08093B56
	.align 2, 0
_08093B38: .4byte gUnknown_20397B0
_08093B3C: .4byte 0x00000ce2
_08093B40: .4byte 0x00000ce9
_08093B44:
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, r8
	ldr r1, [r3]
	ldr r2, _08093BCC @ =0x00000ce9
	adds r1, r2
	strb r0, [r1]
_08093B56:
	ldr r4, _08093BD0 @ =gUnknown_20397B0
	ldr r2, [r4]
	ldr r5, _08093BD4 @ =0x00000cea
	adds r2, r5
	adds r0, r6, 0
	movs r1, 0x2
	bl GetMonData
	ldr r0, [r4]
	adds r0, r5
	bl StringGetEnd10
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [r4]
	ldr r3, _08093BD8 @ =0x00000ce8
	adds r1, r3
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x8
	bl GetMonData
	ldr r1, [r4]
	ldr r2, _08093BDC @ =0x00000ce7
	adds r1, r2
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	ldr r1, [r4]
	ldr r3, _08093BE0 @ =0x00000cdc
	adds r1, r3
	str r0, [r1]
	adds r0, r6, 0
	bl GetMonFrontSpritePal
	ldr r1, [r4]
	ldr r2, _08093BE4 @ =0x00000cd8
	adds r1, r2
	str r0, [r1]
	adds r0, r6, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r6, 0
	movs r1, 0xC
	bl GetMonData
	ldr r1, [r4]
	ldr r3, _08093BE8 @ =0x00000ce2
	adds r1, r3
	strh r0, [r1]
	b _08093CFC
	.align 2, 0
_08093BCC: .4byte 0x00000ce9
_08093BD0: .4byte gUnknown_20397B0
_08093BD4: .4byte 0x00000cea
_08093BD8: .4byte 0x00000ce8
_08093BDC: .4byte 0x00000ce7
_08093BE0: .4byte 0x00000cdc
_08093BE4: .4byte 0x00000cd8
_08093BE8: .4byte 0x00000ce2
_08093BEC:
	cmp r5, 0x1
	beq _08093BF2
	b _08093CF0
_08093BF2:
	adds r7, r4, 0
	adds r0, r7, 0
	movs r1, 0x41
	bl GetBoxMonData
	mov r2, r8
	ldr r1, [r2]
	movs r3, 0xCE
	lsls r3, 4
	adds r1, r3
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _08093C10
	b _08093D0C
_08093C10:
	adds r0, r7, 0
	movs r1, 0x1
	bl GetBoxMonData
	mov r9, r0
	adds r0, r7, 0
	movs r1, 0x4
	bl GetBoxMonData
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0
	beq _08093C3C
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08093C38 @ =0x00000ce9
	adds r0, r2
	strb r5, [r0]
	b _08093C4E
	.align 2, 0
_08093C38: .4byte 0x00000ce9
_08093C3C:
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetBoxMonData
	mov r3, r8
	ldr r1, [r3]
	ldr r2, _08093CD0 @ =0x00000ce9
	adds r1, r2
	strb r0, [r1]
_08093C4E:
	ldr r5, _08093CD4 @ =gUnknown_20397B0
	ldr r2, [r5]
	ldr r4, _08093CD8 @ =0x00000cea
	adds r2, r4
	adds r0, r7, 0
	movs r1, 0x2
	bl GetBoxMonData
	ldr r0, [r5]
	adds r0, r4
	bl StringGetEnd10
	adds r0, r7, 0
	bl GetLevelFromBoxMonExp
	ldr r1, [r5]
	ldr r3, _08093CDC @ =0x00000ce8
	adds r1, r3
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x8
	bl GetBoxMonData
	ldr r1, [r5]
	ldr r2, _08093CE0 @ =0x00000ce7
	adds r1, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonData
	adds r2, r0, 0
	ldr r1, [r5]
	ldr r6, _08093CE4 @ =0x00000cdc
	adds r0, r1, r6
	str r2, [r0]
	subs r4, 0xA
	adds r1, r4
	ldrh r0, [r1]
	mov r1, r9
	bl GetFrontSpritePalFromSpeciesAndPersonality
	ldr r1, [r5]
	ldr r3, _08093CE8 @ =0x00000cd8
	adds r2, r1, r3
	str r0, [r2]
	adds r4, r1, r4
	ldrh r0, [r4]
	adds r1, r6
	ldr r1, [r1]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r7, 0
	movs r1, 0xC
	bl GetBoxMonData
	ldr r1, [r5]
	ldr r2, _08093CEC @ =0x00000ce2
	adds r1, r2
	strh r0, [r1]
	b _08093CFC
	.align 2, 0
_08093CD0: .4byte 0x00000ce9
_08093CD4: .4byte gUnknown_20397B0
_08093CD8: .4byte 0x00000cea
_08093CDC: .4byte 0x00000ce8
_08093CE0: .4byte 0x00000ce7
_08093CE4: .4byte 0x00000cdc
_08093CE8: .4byte 0x00000cd8
_08093CEC: .4byte 0x00000ce2
_08093CF0:
	movs r3, 0xCE
	lsls r3, 4
	adds r0, r1, r3
	mov r1, r9
	strh r1, [r0]
	strh r1, [r2]
_08093CFC:
	ldr r0, _08093D50 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r2, 0xCE
	lsls r2, 4
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, 0
	bne _08093D68
_08093D0C:
	ldr r4, _08093D50 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r3, _08093D54 @ =0x00000cea
	adds r0, r3
	movs r1, 0
	movs r2, 0x5
	bl StringFill
	ldr r0, [r4]
	ldr r1, _08093D58 @ =0x00000cf5
	adds r0, r1
	movs r1, 0
	movs r2, 0x8
	bl StringFill
	ldr r0, [r4]
	ldr r2, _08093D5C @ =0x00000d19
	adds r0, r2
	movs r1, 0
	movs r2, 0x8
	bl StringFill
	ldr r0, [r4]
	ldr r3, _08093D60 @ =0x00000d3d
	adds r0, r3
	movs r1, 0
	movs r2, 0x8
	bl StringFill
	ldr r0, [r4]
	ldr r1, _08093D64 @ =0x00000d61
	adds r0, r1
	b _08093DC6
	.align 2, 0
_08093D50: .4byte gUnknown_20397B0
_08093D54: .4byte 0x00000cea
_08093D58: .4byte 0x00000cf5
_08093D5C: .4byte 0x00000d19
_08093D60: .4byte 0x00000d3d
_08093D64: .4byte 0x00000d61
_08093D68:
	ldr r3, _08093D8C @ =0x00000ce9
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _08093DE8
	mov r0, r10
	cmp r0, 0
	beq _08093D94
	ldr r2, _08093D90 @ =0x00000cf5
	adds r0, r1, r2
	adds r3, 0x1
	adds r1, r3
	movs r2, 0
	movs r3, 0x5
	bl StringCopyPadded
	b _08093DA2
	.align 2, 0
_08093D8C: .4byte 0x00000ce9
_08093D90: .4byte 0x00000cf5
_08093D94:
	ldr r2, _08093DD0 @ =0x00000cf5
	adds r0, r1, r2
	ldr r1, _08093DD4 @ =gText_EggNickname
	movs r2, 0
	movs r3, 0x8
	bl StringCopyPadded
_08093DA2:
	ldr r4, _08093DD8 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r3, _08093DDC @ =0x00000d19
	adds r0, r3
	movs r1, 0
	movs r2, 0x8
	bl StringFill
	ldr r0, [r4]
	ldr r1, _08093DE0 @ =0x00000d3d
	adds r0, r1
	movs r1, 0
	movs r2, 0x8
	bl StringFill
	ldr r0, [r4]
	ldr r2, _08093DE4 @ =0x00000d61
	adds r0, r2
_08093DC6:
	movs r1, 0
	movs r2, 0x8
	bl StringFill
	b _08093F84
	.align 2, 0
_08093DD0: .4byte 0x00000cf5
_08093DD4: .4byte gText_EggNickname
_08093DD8: .4byte gUnknown_20397B0
_08093DDC: .4byte 0x00000d19
_08093DE0: .4byte 0x00000d3d
_08093DE4: .4byte 0x00000d61
_08093DE8:
	cmp r2, 0x1D
	beq _08093DF0
	cmp r2, 0x20
	bne _08093DF4
_08093DF0:
	movs r3, 0xFF
	mov r9, r3
_08093DF4:
	ldr r4, _08093E78 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r2, _08093E7C @ =0x00000cf5
	adds r0, r1, r2
	ldr r3, _08093E80 @ =0x00000cea
	adds r1, r3
	movs r2, 0
	movs r3, 0x5
	bl StringCopyPadded
	ldr r1, [r4]
	ldr r0, _08093E84 @ =0x00000d19
	adds r2, r1, r0
	movs r0, 0xBA
	strb r0, [r2]
	ldr r3, _08093E88 @ =0x00000d1a
	adds r2, r1, r3
	ldr r0, [r4]
	movs r1, 0xCE
	lsls r1, 4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _08093E8C @ =gSpeciesNames
	adds r1, r0
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0x5
	bl StringCopyPadded
	ldr r4, [r4]
	ldr r3, _08093E90 @ =0x00000d3d
	adds r2, r4, r3
	movs r0, 0xFC
	strb r0, [r2]
	ldr r0, _08093E94 @ =0x00000d3e
	adds r2, r4, r0
	movs r0, 0x4
	strb r0, [r2]
	ldr r1, _08093E98 @ =0x00000d3f
	adds r2, r4, r1
	mov r3, r9
	cmp r3, 0
	beq _08093EA4
	cmp r3, 0xFE
	beq _08093ED0
	movs r0, 0x2
	strb r0, [r2]
	movs r0, 0xD4
	lsls r0, 4
	adds r2, r4, r0
	movs r0, 0x1
	strb r0, [r2]
	adds r1, 0x2
	adds r2, r4, r1
	movs r0, 0x3
	strb r0, [r2]
	ldr r3, _08093E9C @ =0x00000d42
	adds r2, r4, r3
	movs r0, 0
	strb r0, [r2]
	ldr r0, _08093EA0 @ =0x00000d43
	adds r2, r4, r0
	b _08093EF2
	.align 2, 0
_08093E78: .4byte gUnknown_20397B0
_08093E7C: .4byte 0x00000cf5
_08093E80: .4byte 0x00000cea
_08093E84: .4byte 0x00000d19
_08093E88: .4byte 0x00000d1a
_08093E8C: .4byte gSpeciesNames
_08093E90: .4byte 0x00000d3d
_08093E94: .4byte 0x00000d3e
_08093E98: .4byte 0x00000d3f
_08093E9C: .4byte 0x00000d42
_08093EA0: .4byte 0x00000d43
_08093EA4:
	strb r0, [r2]
	movs r1, 0xD4
	lsls r1, 4
	adds r2, r4, r1
	movs r0, 0x1
	strb r0, [r2]
	ldr r3, _08093EC8 @ =0x00000d41
	adds r2, r4, r3
	movs r0, 0x5
	strb r0, [r2]
	ldr r0, _08093ECC @ =0x00000d42
	adds r2, r4, r0
	movs r0, 0xB5
	strb r0, [r2]
	adds r1, 0x3
	adds r2, r4, r1
	b _08093EF2
	.align 2, 0
_08093EC8: .4byte 0x00000d41
_08093ECC: .4byte 0x00000d42
_08093ED0:
	movs r0, 0x6
	strb r0, [r2]
	movs r3, 0xD4
	lsls r3, 4
	adds r2, r4, r3
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _08093F60 @ =0x00000d41
	adds r2, r4, r0
	movs r0, 0x7
	strb r0, [r2]
	ldr r1, _08093F64 @ =0x00000d42
	adds r2, r4, r1
	movs r0, 0xB6
	strb r0, [r2]
	adds r3, 0x3
	adds r2, r4, r3
_08093EF2:
	movs r0, 0xFC
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0x4
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0x2
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0x1
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0x3
	strb r0, [r2]
	adds r2, 0x1
	movs r5, 0
	strb r5, [r2]
	adds r2, 0x1
	movs r0, 0xF9
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0x5
	strb r0, [r2]
	adds r2, 0x1
	ldr r4, _08093F68 @ =gUnknown_20397B0
	ldr r0, [r4]
	ldr r1, _08093F6C @ =0x00000ce8
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	strb r5, [r2]
	movs r0, 0xFF
	strb r0, [r2, 0x1]
	ldr r4, [r4]
	ldr r2, _08093F70 @ =0x00000ce2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, 0
	beq _08093F78
	ldr r3, _08093F74 @ =0x00000d61
	adds r4, r3
	bl ItemId_GetName
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x8
	bl StringCopyPadded
	b _08093F84
	.align 2, 0
_08093F60: .4byte 0x00000d41
_08093F64: .4byte 0x00000d42
_08093F68: .4byte gUnknown_20397B0
_08093F6C: .4byte 0x00000ce8
_08093F70: .4byte 0x00000ce2
_08093F74: .4byte 0x00000d61
_08093F78:
	ldr r1, _08093F94 @ =0x00000d61
	adds r0, r4, r1
	movs r1, 0
	movs r2, 0x8
	bl StringFill
_08093F84:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093F94: .4byte 0x00000d61
	thumb_func_end sub_8093AD0

	thumb_func_start sub_8093F98
sub_8093F98: @ 8093F98
	push {lr}
	ldr r0, _08093FB8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08093FBC @ =0x000021ef
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08093FC0
	cmp r0, 0x1
	ble _08093FB0
	cmp r0, 0x2
	beq _08093FC6
_08093FB0:
	bl sub_8093FD4
	b _08093FCA
	.align 2, 0
_08093FB8: .4byte gUnknown_20397B0
_08093FBC: .4byte 0x000021ef
_08093FC0:
	bl sub_8094240
	b _08093FCA
_08093FC6:
	bl sub_8094378
_08093FCA:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8093F98

	thumb_func_start sub_8093FD4
sub_8093FD4: @ 8093FD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08094058 @ =gUnknown_2039820
	ldrb r0, [r0]
	mov r8, r0
	ldr r2, _0809405C @ =gUnknown_2039821
	ldrb r4, [r2]
	ldr r5, _08094060 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r1, _08094064 @ =0x00000cce
	mov r10, r1
	add r0, r10
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r5]
	ldr r7, _08094068 @ =0x00000ccf
	adds r0, r7
	strb r1, [r0]
	ldr r0, [r5]
	ldr r3, _0809406C @ =0x00000cd3
	mov r9, r3
	add r0, r9
	strb r1, [r0]
	ldr r6, _08094070 @ =gMain
	ldrh r1, [r6, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0
	beq _08094018
	b _08094208
_08094018:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08094074
	movs r6, 0x1
	lsls r0, r4, 24
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x1D
	bgt _08094034
	b _08094224
_08094034:
	movs r2, 0x3
	mov r8, r2
	subs r0, 0x1E
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x3
	bl __divsi3
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r5]
	add r0, r10
	strb r6, [r0]
	ldr r0, [r5]
	add r0, r9
	strb r6, [r0]
	b _08094224
	.align 2, 0
_08094058: .4byte gUnknown_2039820
_0809405C: .4byte gUnknown_2039821
_08094060: .4byte gUnknown_20397B0
_08094064: .4byte 0x00000cce
_08094068: .4byte 0x00000ccf
_0809406C: .4byte 0x00000cd3
_08094070: .4byte gMain
_08094074:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080940AA
	movs r6, 0x1
	movs r0, 0
	ldrsb r0, [r3, r0]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 24
	cmp r0, 0
	beq _08094096
	lsls r0, r4, 24
	movs r3, 0xFF
	lsls r3, 24
	b _08094218
_08094096:
	ldr r0, [r5]
	adds r0, r7
	movs r1, 0xFF
	strb r1, [r0]
	lsls r0, r4, 24
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r4, r0, 24
	b _08094224
_080940AA:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080940DE
	movs r6, 0x1
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, 0x1
	movs r1, 0x6
	bl __modsi3
	cmp r0, 0
	beq _080940D0
	lsls r0, r4, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r4, r0, 24
	b _08094224
_080940D0:
	ldr r0, [r5]
	adds r0, r7
	strb r6, [r0]
	lsls r0, r4, 24
	movs r3, 0xFB
	lsls r3, 24
	b _08094218
_080940DE:
	ldrh r1, [r6, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080940EC
	movs r6, 0x1
	b _0809421E
_080940EC:
	movs r4, 0x1
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080941B0
	bl sub_8094924
	lsls r0, 24
	cmp r0, 0
	beq _080941B0
	ldr r0, _0809410C @ =gUnknown_2039825
	ldrb r0, [r0]
	cmp r0, 0
	bne _08094110
	movs r0, 0x8
	b _08094232
	.align 2, 0
_0809410C: .4byte gUnknown_2039825
_08094110:
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x2
	bne _08094120
	ldr r0, _0809413C @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080941A0
_08094120:
	movs r0, 0
	bl sub_8094E50
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xE
	bhi _080941B0
	lsls r0, 2
	ldr r1, _08094140 @ =_08094144
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809413C: .4byte gUnknown_2039822
_08094140: .4byte _08094144
	.align 2, 0
_08094144:
	.4byte _08094180
	.4byte _08094184
	.4byte _08094188
	.4byte _0809418C
	.4byte _08094190
	.4byte _080941B0
	.4byte _080941B0
	.4byte _080941B0
	.4byte _080941B0
	.4byte _080941B0
	.4byte _080941B0
	.4byte _08094194
	.4byte _08094198
	.4byte _080941B0
	.4byte _0809419C
_08094180:
	movs r0, 0xB
	b _08094232
_08094184:
	movs r0, 0xC
	b _08094232
_08094188:
	movs r0, 0xD
	b _08094232
_0809418C:
	movs r0, 0xE
	b _08094232
_08094190:
	movs r0, 0xF
	b _08094232
_08094194:
	movs r0, 0x10
	b _08094232
_08094198:
	movs r0, 0x11
	b _08094232
_0809419C:
	movs r0, 0x12
	b _08094232
_080941A0:
	ldr r2, _080941AC @ =0x000021ef
	adds r0, r1, r2
	strb r4, [r0]
	movs r0, 0x14
	b _08094232
	.align 2, 0
_080941AC: .4byte 0x000021ef
_080941B0:
	ldr r2, _080941C0 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080941C4
	movs r0, 0x13
	b _08094232
	.align 2, 0
_080941C0: .4byte gMain
_080941C4:
	ldr r0, _080941E0 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _080941F2
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080941E4
	movs r0, 0xA
	b _08094232
	.align 2, 0
_080941E0: .4byte gSaveBlock2Ptr
_080941E4:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080941F2
	movs r0, 0x9
	b _08094232
_080941F2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08094204
	bl sub_8094C84
	movs r0, 0
	b _08094232
_08094204:
	movs r6, 0
	b _08094230
_08094208:
	movs r6, 0x1
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x5
	ble _0809421E
	lsls r0, r4, 24
	movs r3, 0xFA
	lsls r3, 24
_08094218:
	adds r0, r3
	lsrs r4, r0, 24
	b _08094224
_0809421E:
	movs r0, 0x2
	mov r8, r0
	movs r4, 0
_08094224:
	cmp r6, 0
	beq _08094230
	mov r0, r8
	adds r1, r4, 0
	bl sub_80927E8
_08094230:
	adds r0, r6, 0
_08094232:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8093FD4

	thumb_func_start sub_8094240
sub_8094240: @ 8094240
	push {r4,lr}
	ldr r1, _08094270 @ =gMain
	ldrh r0, [r1, 0x2C]
	movs r4, 0x1
	ands r4, r0
	cmp r4, 0
	beq _080942F4
	ldrh r1, [r1, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08094278
	ldr r4, _08094274 @ =gUnknown_2039821
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	bl __divsi3
	lsls r0, 24
	cmp r0, 0
	beq _080942EC
	ldrb r1, [r4]
	subs r1, 0x6
	b _080942DA
	.align 2, 0
_08094270: .4byte gMain
_08094274: .4byte gUnknown_2039821
_08094278:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08094298
	ldr r1, _08094294 @ =gUnknown_2039821
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, 0x6
	cmp r0, 0x1D
	bgt _080942EC
	ldrb r1, [r1]
	adds r1, 0x6
	b _080942DA
	.align 2, 0
_08094294: .4byte gUnknown_2039821
_08094298:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080942BC
	ldr r4, _080942B8 @ =gUnknown_2039821
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 24
	cmp r0, 0
	beq _080942EC
	ldrb r1, [r4]
	subs r1, 0x1
	b _080942DA
	.align 2, 0
_080942B8: .4byte gUnknown_2039821
_080942BC:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080942F0
	ldr r4, _080942E8 @ =gUnknown_2039821
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, 0x1
	movs r1, 0x6
	bl __modsi3
	cmp r0, 0
	beq _080942EC
	ldrb r1, [r4]
	adds r1, 0x1
_080942DA:
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_80927E8
	movs r0, 0x15
	b _08094364
	.align 2, 0
_080942E8: .4byte gUnknown_2039821
_080942EC:
	movs r0, 0x18
	b _08094364
_080942F0:
	movs r0, 0
	b _08094364
_080942F4:
	bl sub_8095AA0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08094330 @ =gUnknown_2039821
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	cmp r0, r1
	beq _08094344
	ldr r2, _08094334 @ =gUnknown_2039822
	ldr r0, _08094338 @ =gUnknown_20397B0
	ldr r1, [r0]
	movs r3, 0xCE
	lsls r3, 4
	adds r0, r1, r3
	ldrh r0, [r0]
	negs r0, r0
	lsrs r0, 31
	strb r0, [r2]
	ldr r0, _0809433C @ =0x000021ef
	adds r1, r0
	movs r0, 0x2
	strb r0, [r1]
	bl StorageGetCurrentBox
	ldr r1, _08094340 @ =gUnknown_2039823
	strb r0, [r1]
	movs r0, 0x17
	b _08094364
	.align 2, 0
_08094330: .4byte gUnknown_2039821
_08094334: .4byte gUnknown_2039822
_08094338: .4byte gUnknown_20397B0
_0809433C: .4byte 0x000021ef
_08094340: .4byte gUnknown_2039823
_08094344:
	ldr r1, _0809436C @ =gUnknown_20397B0
	ldr r0, [r1]
	ldr r2, _08094370 @ =0x000021ef
	adds r0, r2
	strb r4, [r0]
	ldr r0, [r1]
	ldr r3, _08094374 @ =0x00000cb4
	adds r0, r3
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	movs r0, 0x16
_08094364:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809436C: .4byte gUnknown_20397B0
_08094370: .4byte 0x000021ef
_08094374: .4byte 0x00000cb4
	thumb_func_end sub_8094240

	thumb_func_start sub_8094378
sub_8094378: @ 8094378
	push {r4,lr}
	ldr r2, _0809439C @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080943A4
	movs r0, 0
	bl sub_8095474
	lsls r0, 24
	cmp r0, 0
	beq _08094450
	ldr r0, _080943A0 @ =gUnknown_2039821
	ldrb r1, [r0]
	subs r1, 0x6
	b _08094402
	.align 2, 0
_0809439C: .4byte gMain
_080943A0: .4byte gUnknown_2039821
_080943A4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080943C4
	movs r0, 0x1
	bl sub_8095474
	lsls r0, 24
	cmp r0, 0
	beq _08094450
	ldr r0, _080943C0 @ =gUnknown_2039821
	ldrb r1, [r0]
	adds r1, 0x6
	b _08094402
	.align 2, 0
_080943C0: .4byte gUnknown_2039821
_080943C4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080943E4
	movs r0, 0x2
	bl sub_8095474
	lsls r0, 24
	cmp r0, 0
	beq _0809446A
	ldr r0, _080943E0 @ =gUnknown_2039821
	ldrb r1, [r0]
	subs r1, 0x1
	b _08094402
	.align 2, 0
_080943E0: .4byte gUnknown_2039821
_080943E4:
	movs r0, 0x10
	ands r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08094414
	movs r0, 0x3
	bl sub_8095474
	lsls r0, 24
	cmp r0, 0
	beq _0809447E
	ldr r0, _08094410 @ =gUnknown_2039821
	ldrb r1, [r0]
	adds r1, 0x1
_08094402:
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_80927E8
	movs r0, 0x19
	b _08094484
	.align 2, 0
_08094410: .4byte gUnknown_2039821
_08094414:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08094448
	bl sub_8095ABC
	lsls r0, 24
	cmp r0, 0
	beq _08094450
	ldr r0, _0809443C @ =gUnknown_2039822
	strb r4, [r0]
	ldr r0, _08094440 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08094444 @ =0x000021ef
	adds r0, r1
	strb r4, [r0]
	movs r0, 0x1A
	b _08094484
	.align 2, 0
_0809443C: .4byte gUnknown_2039822
_08094440: .4byte gUnknown_20397B0
_08094444: .4byte 0x000021ef
_08094448:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08094454
_08094450:
	movs r0, 0x18
	b _08094484
_08094454:
	ldr r0, _08094470 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08094482
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _08094474
_0809446A:
	movs r0, 0xA
	b _08094484
	.align 2, 0
_08094470: .4byte gSaveBlock2Ptr
_08094474:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08094482
_0809447E:
	movs r0, 0x9
	b _08094484
_08094482:
	movs r0, 0
_08094484:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8094378

	thumb_func_start sub_809448C
sub_809448C: @ 809448C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080944FC @ =gUnknown_2039820
	ldrb r0, [r0]
	mov r9, r0
	ldr r6, _08094500 @ =gUnknown_2039821
	ldrb r4, [r6]
	ldr r2, _08094504 @ =gUnknown_20397B0
	ldr r0, [r2]
	ldr r1, _08094508 @ =0x00000ccf
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r3, _0809450C @ =0x00000cce
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x5
	adds r0, r3
	strb r1, [r0]
	mov r8, r1
	movs r7, 0
	ldr r1, _08094510 @ =gMain
	ldrh r3, [r1, 0x30]
	movs r0, 0x40
	ands r0, r3
	adds r5, r6, 0
	mov r12, r1
	cmp r0, 0
	beq _080944D0
	b _08094670
_080944D0:
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _08094514
	lsls r0, r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x6
	ble _080944EA
	movs r4, 0
_080944EA:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r5, r1]
	cmp r0, r1
	bne _080944F8
	b _0809468E
_080944F8:
	movs r7, 0x1
	b _08094692
	.align 2, 0
_080944FC: .4byte gUnknown_2039820
_08094500: .4byte gUnknown_2039821
_08094504: .4byte gUnknown_20397B0
_08094508: .4byte 0x00000ccf
_0809450C: .4byte 0x00000cce
_08094510: .4byte gMain
_08094514:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _08094538
	ldrb r1, [r5]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	beq _08094538
	movs r7, 0x1
	ldr r0, [r2]
	ldr r2, _08094534 @ =0x00000cd2
	adds r0, r2
	strb r1, [r0]
	movs r4, 0
	b _0809468E
	.align 2, 0
_08094534: .4byte 0x00000cd2
_08094538:
	mov r3, r12
	ldrh r1, [r3, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08094566
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	bne _0809455C
	movs r7, 0x1
	ldr r0, [r2]
	ldr r1, _08094558 @ =0x00000cd2
	adds r0, r1
	ldrb r4, [r0]
	b _0809468E
	.align 2, 0
_08094558: .4byte 0x00000cd2
_0809455C:
	movs r7, 0x6
	movs r2, 0
	mov r9, r2
	movs r4, 0
	b _0809468E
_08094566:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08094624
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x6
	bne _0809458C
	ldr r0, [r2]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _08094586
	movs r0, 0x4
	b _080946A0
_08094586:
	movs r0, 0x1
	mov r8, r0
	b _08094624
_0809458C:
	bl sub_8094924
	lsls r0, 24
	cmp r0, 0
	beq _08094624
	ldr r0, _080945A4 @ =gUnknown_2039825
	ldrb r0, [r0]
	cmp r0, 0
	bne _080945A8
	movs r0, 0x8
	b _080946A0
	.align 2, 0
_080945A4: .4byte gUnknown_2039825
_080945A8:
	movs r0, 0
	bl sub_8094E50
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xE
	bhi _08094624
	lsls r0, 2
	ldr r1, _080945C4 @ =_080945C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080945C4: .4byte _080945C8
	.align 2, 0
_080945C8:
	.4byte _08094604
	.4byte _08094608
	.4byte _0809460C
	.4byte _08094610
	.4byte _08094614
	.4byte _08094624
	.4byte _08094624
	.4byte _08094624
	.4byte _08094624
	.4byte _08094624
	.4byte _08094624
	.4byte _08094618
	.4byte _0809461C
	.4byte _08094624
	.4byte _08094620
_08094604:
	movs r0, 0xB
	b _080946A0
_08094608:
	movs r0, 0xC
	b _080946A0
_0809460C:
	movs r0, 0xD
	b _080946A0
_08094610:
	movs r0, 0xE
	b _080946A0
_08094614:
	movs r0, 0xF
	b _080946A0
_08094618:
	movs r0, 0x10
	b _080946A0
_0809461C:
	movs r0, 0x11
	b _080946A0
_08094620:
	movs r0, 0x12
	b _080946A0
_08094624:
	ldr r2, _08094640 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	mov r12, r2
	cmp r0, 0
	beq _0809464C
	ldr r0, _08094644 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _08094648
	movs r0, 0x13
	b _080946A0
	.align 2, 0
_08094640: .4byte gMain
_08094644: .4byte gUnknown_20397B0
_08094648:
	movs r1, 0x1
	mov r8, r1
_0809464C:
	mov r2, r8
	cmp r2, 0
	beq _0809465C
	movs r7, 0x6
	movs r3, 0
	mov r9, r3
	movs r4, 0
	b _0809468E
_0809465C:
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809468E
	bl sub_8094C84
	movs r0, 0
	b _080946A0
_08094670:
	lsls r0, r4, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r4, r0, 24
	cmp r0, 0
	bge _08094680
	movs r4, 0x6
_08094680:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r6, r1]
	cmp r0, r1
	beq _0809468E
	movs r7, 0x1
_0809468E:
	cmp r7, 0
	beq _0809469E
_08094692:
	cmp r7, 0x6
	beq _0809469E
	mov r0, r9
	adds r1, r4, 0
	bl sub_80927E8
_0809469E:
	adds r0, r7, 0
_080946A0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809448C

	thumb_func_start sub_80946AC
sub_80946AC: @ 80946AC
	push {r4-r6,lr}
	ldr r3, _080946E8 @ =gUnknown_20397B0
	ldr r0, [r3]
	ldr r1, _080946EC @ =0x00000ccf
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r3]
	ldr r2, _080946F0 @ =0x00000cce
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldr r5, _080946F4 @ =0x00000cd3
	adds r0, r5
	strb r1, [r0]
	ldr r1, _080946F8 @ =gMain
	ldrh r2, [r1, 0x30]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _08094772
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080946FC
	movs r4, 0x1
	movs r1, 0
	movs r6, 0x2
	b _0809477E
	.align 2, 0
_080946E8: .4byte gUnknown_20397B0
_080946EC: .4byte 0x00000ccf
_080946F0: .4byte 0x00000cce
_080946F4: .4byte 0x00000cd3
_080946F8: .4byte gMain
_080946FC:
	ldrh r2, [r1, 0x2C]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _08094722
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _08094736
	ldr r0, _08094728 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809473A
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0809472C
_08094722:
	movs r0, 0xA
	b _0809479A
	.align 2, 0
_08094728: .4byte gSaveBlock2Ptr
_0809472C:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0809473A
_08094736:
	movs r0, 0x9
	b _0809479A
_0809473A:
	ldrh r1, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08094752
	movs r0, 0
	bl sub_80920FC
	bl sub_8094900
	movs r0, 0x7
	b _0809479A
_08094752:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809475E
	movs r0, 0x13
	b _0809479A
_0809475E:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809476E
	bl sub_8094C84
	movs r0, 0
	b _0809479A
_0809476E:
	movs r4, 0
	b _08094798
_08094772:
	movs r4, 0x1
	movs r1, 0x3
	movs r6, 0
	ldr r0, [r3]
	adds r0, r5
	strb r4, [r0]
_0809477E:
	cmp r4, 0
	beq _08094798
	lsls r5, r1, 24
	cmp r1, 0x2
	beq _0809478E
	movs r0, 0
	bl sub_80920FC
_0809478E:
	lsrs r0, r5, 24
	lsls r1, r6, 24
	lsrs r1, 24
	bl sub_80927E8
_08094798:
	adds r0, r4, 0
_0809479A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80946AC

	thumb_func_start sub_80947A0
sub_80947A0: @ 80947A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080947F0 @ =gUnknown_2039820
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _080947F4 @ =gUnknown_2039821
	mov r12, r0
	ldrb r2, [r0]
	ldr r3, _080947F8 @ =gUnknown_20397B0
	ldr r0, [r3]
	ldr r1, _080947FC @ =0x00000ccf
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r3]
	ldr r6, _08094800 @ =0x00000cce
	adds r0, r6
	strb r1, [r0]
	ldr r0, [r3]
	ldr r5, _08094804 @ =0x00000cd3
	adds r0, r5
	strb r1, [r0]
	ldr r7, _08094808 @ =gMain
	ldrh r1, [r7, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r4, r3, 0
	cmp r0, 0
	bne _0809487A
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	beq _0809480C
	movs r7, 0x1
	movs r0, 0x2
	mov r8, r0
	movs r2, 0
	ldr r0, [r4]
	b _08094898
	.align 2, 0
_080947F0: .4byte gUnknown_2039820
_080947F4: .4byte gUnknown_2039821
_080947F8: .4byte gUnknown_20397B0
_080947FC: .4byte 0x00000ccf
_08094800: .4byte 0x00000cce
_08094804: .4byte 0x00000cd3
_08094808: .4byte gMain
_0809480C:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08094828
	movs r7, 0x1
	lsls r0, r2, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r2, r0, 24
	cmp r0, 0
	bge _0809489C
	movs r2, 0x1
	b _0809489C
_08094828:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08094846
	movs r7, 0x1
	lsls r0, r2, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x1
	ble _0809489C
	movs r2, 0
	b _0809489C
_08094846:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809485A
	movs r0, 0x4
	cmp r2, 0
	bne _080948AA
	movs r0, 0x5
	b _080948AA
_0809485A:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08094866
	movs r0, 0x13
	b _080948AA
_08094866:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08094876
	bl sub_8094C84
	movs r0, 0
	b _080948AA
_08094876:
	movs r7, 0
	b _080948A8
_0809487A:
	movs r7, 0x1
	movs r0, 0
	mov r8, r0
	ldr r0, [r3]
	adds r0, r6
	movs r1, 0xFF
	strb r1, [r0]
	mov r1, r12
	movs r0, 0
	ldrsb r0, [r1, r0]
	movs r2, 0x1D
	cmp r0, 0
	bne _08094896
	movs r2, 0x18
_08094896:
	ldr r0, [r3]
_08094898:
	adds r0, r5
	strb r7, [r0]
_0809489C:
	cmp r7, 0
	beq _080948A8
	mov r0, r8
	adds r1, r2, 0
	bl sub_80927E8
_080948A8:
	adds r0, r7, 0
_080948AA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80947A0

	thumb_func_start sub_80948B4
sub_80948B4: @ 80948B4
	push {r4,r5,lr}
	movs r3, 0
	ldr r0, _080948E0 @ =gUnknown_83D3478
	ldr r1, [r0]
	adds r4, r0, 0
	cmp r1, 0
	beq _080948F8
	ldr r5, _080948E4 @ =gUnknown_2039820
_080948C4:
	lsls r0, r3, 3
	adds r2, r0, r4
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _080948E8
	ldr r0, [r2]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	b _080948FA
	.align 2, 0
_080948E0: .4byte gUnknown_83D3478
_080948E4: .4byte gUnknown_2039820
_080948E8:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r0, r3, 3
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	bne _080948C4
_080948F8:
	movs r0, 0
_080948FA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80948B4

	thumb_func_start sub_8094900
sub_8094900: @ 8094900
	push {lr}
	bl sub_8094DA8
	movs r0, 0x9
	bl sub_8094DEC
	movs r0, 0xA
	bl sub_8094DEC
	movs r0, 0xB
	bl sub_8094DEC
	movs r0, 0
	bl sub_8094DEC
	pop {r0}
	bx r0
	thumb_func_end sub_8094900

	thumb_func_start sub_8094924
sub_8094924: @ 8094924
	push {lr}
	bl sub_8094DA8
	ldr r0, _0809493C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08094940
	bl sub_8094A0C
	b _08094944
	.align 2, 0
_0809493C: .4byte gUnknown_20397B0
_08094940:
	bl sub_809494C
_08094944:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8094924

	thumb_func_start sub_809494C
sub_809494C: @ 809494C
	push {lr}
	bl sub_8092458
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0809496C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _08094976
	cmp r0, 0x1
	bgt _08094970
	cmp r0, 0
	beq _08094982
	b _080949BC
	.align 2, 0
_0809496C: .4byte gUnknown_20397B0
_08094970:
	cmp r0, 0x2
	beq _0809498E
	b _080949BC
_08094976:
	cmp r1, 0
	beq _080949BC
	movs r0, 0x1
	bl sub_8094DEC
	b _080949C0
_08094982:
	cmp r1, 0
	beq _080949BC
	movs r0, 0x2
	bl sub_8094DEC
	b _080949C0
_0809498E:
	ldr r0, _080949A4 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _080949B0
	cmp r1, 0
	beq _080949A8
	movs r0, 0x4
	bl sub_8094DEC
	b _080949C0
	.align 2, 0
_080949A4: .4byte gUnknown_2039822
_080949A8:
	movs r0, 0x5
	bl sub_8094DEC
	b _080949C0
_080949B0:
	cmp r1, 0
	beq _080949BC
	movs r0, 0x3
	bl sub_8094DEC
	b _080949C0
_080949BC:
	movs r0, 0
	b _08094A06
_080949C0:
	movs r0, 0x6
	bl sub_8094DEC
	ldr r0, _080949E4 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _080949F2
	ldr r0, _080949E8 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080949EC
	movs r0, 0x2
	bl sub_8094DEC
	b _080949F2
	.align 2, 0
_080949E4: .4byte gUnknown_20397B0
_080949E8: .4byte gUnknown_2039820
_080949EC:
	movs r0, 0x1
	bl sub_8094DEC
_080949F2:
	movs r0, 0x8
	bl sub_8094DEC
	movs r0, 0x7
	bl sub_8094DEC
	movs r0, 0
	bl sub_8094DEC
	movs r0, 0x1
_08094A06:
	pop {r1}
	bx r1
	thumb_func_end sub_809494C

	thumb_func_start sub_8094A0C
sub_8094A0C: @ 8094A0C
	push {r4,r5,lr}
	ldr r4, _08094A48 @ =gUnknown_20397B0
	ldr r0, [r4]
	movs r5, 0xCE
	lsls r5, 4
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08094A9E
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	bne _08094A70
	ldr r2, [r4]
	ldr r0, _08094A4C @ =0x00000ce2
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _08094A50
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08094A9E
	movs r0, 0xE
	bl sub_8094DEC
	b _08094AA8
	.align 2, 0
_08094A48: .4byte gUnknown_20397B0
_08094A4C: .4byte 0x00000ce2
_08094A50:
	ldrh r0, [r1]
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	bne _08094A68
	movs r0, 0xC
	bl sub_8094DEC
	movs r0, 0x10
	bl sub_8094DEC
_08094A68:
	movs r0, 0x11
	bl sub_8094DEC
	b _08094AA8
_08094A70:
	ldr r2, [r4]
	ldr r0, _08094A8C @ =0x00000ce2
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _08094A90
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08094A9E
	movs r0, 0xD
	bl sub_8094DEC
	b _08094AA8
	.align 2, 0
_08094A8C: .4byte 0x00000ce2
_08094A90:
	ldrh r0, [r1]
	bl ItemIsMail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08094AA2
_08094A9E:
	movs r0, 0
	b _08094AB0
_08094AA2:
	movs r0, 0xF
	bl sub_8094DEC
_08094AA8:
	movs r0, 0
	bl sub_8094DEC
	movs r0, 0x1
_08094AB0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8094A0C

	thumb_func_start sub_8094AB8
sub_8094AB8: @ 8094AB8
	ldr r1, _08094AD4 @ =gUnknown_20397B0
	ldr r1, [r1]
	movs r2, 0xCB
	lsls r2, 4
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r1, [r1]
	ldrh r1, [r1, 0x22]
	adds r1, 0x14
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08094AD4: .4byte gUnknown_20397B0
	thumb_func_end sub_8094AB8

	thumb_func_start sub_8094AD8
sub_8094AD8: @ 8094AD8
	push {r4-r6,lr}
	sub sp, 0x2C
	mov r1, sp
	ldr r0, _08094BA4 @ =gUnknown_83D34A0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r4, sp, 0x18
	adds r1, r4, 0
	ldr r0, _08094BA8 @ =gUnknown_83D34B8
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r0]
	str r0, [r1]
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	ldr r0, _08094BAC @ =0x0000daca
	bl IndexOfSpritePaletteTag
	ldr r6, _08094BB0 @ =gUnknown_20397B0
	ldr r1, [r6]
	ldr r4, _08094BB4 @ =0x00000cd4
	adds r1, r4
	strb r0, [r1]
	ldr r0, _08094BB8 @ =0x0000dac7
	bl IndexOfSpritePaletteTag
	ldr r1, [r6]
	ldr r5, _08094BBC @ =0x00000cd5
	adds r1, r5
	strb r0, [r1]
	ldr r0, _08094BC0 @ =gUnknown_2039820
	ldrb r0, [r0]
	ldr r1, _08094BC4 @ =gUnknown_2039821
	ldrb r1, [r1]
	add r4, sp, 0x28
	mov r5, sp
	adds r5, 0x2A
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_8092398
	ldr r0, _08094BC8 @ =gUnknown_83D350C
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0
	ldrsh r2, [r5, r3]
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08094BD8
	ldr r2, [r6]
	movs r4, 0xCB
	lsls r4, 4
	adds r3, r2, r4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08094BCC @ =gSprites
	adds r1, r0
	str r1, [r3]
	ldr r0, _08094BD0 @ =gUnknown_2039825
	ldr r5, _08094BB4 @ =0x00000cd4
	adds r2, r5
	ldrb r0, [r0]
	adds r2, r0
	ldrb r2, [r2]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r6]
	adds r0, r4
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08094BD4 @ =gUnknown_2039822
	ldrb r0, [r0]
	cmp r0, 0
	beq _08094BE4
	ldr r0, [r6]
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	b _08094BE4
	.align 2, 0
_08094BA4: .4byte gUnknown_83D34A0
_08094BA8: .4byte gUnknown_83D34B8
_08094BAC: .4byte 0x0000daca
_08094BB0: .4byte gUnknown_20397B0
_08094BB4: .4byte 0x00000cd4
_08094BB8: .4byte 0x0000dac7
_08094BBC: .4byte 0x00000cd5
_08094BC0: .4byte gUnknown_2039820
_08094BC4: .4byte gUnknown_2039821
_08094BC8: .4byte gUnknown_83D350C
_08094BCC: .4byte gSprites
_08094BD0: .4byte gUnknown_2039825
_08094BD4: .4byte gUnknown_2039822
_08094BD8:
	ldr r0, [r6]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_08094BE4:
	ldr r0, _08094BF8 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _08094BFC
	movs r3, 0xD
	movs r4, 0x1
	b _08094C00
	.align 2, 0
_08094BF8: .4byte gUnknown_2039820
_08094BFC:
	movs r3, 0x15
	movs r4, 0x2
_08094C00:
	ldr r0, _08094C54 @ =gUnknown_83D3524
	movs r1, 0
	movs r2, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08094C68
	ldr r5, _08094C58 @ =gUnknown_20397B0
	ldr r2, [r5]
	ldr r3, _08094C5C @ =0x00000cb4
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08094C60 @ =gSprites
	adds r1, r0
	str r1, [r2]
	lsls r3, r4, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, _08094C64 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08094C74
	ldr r0, [r5]
	ldr r4, _08094C5C @ =0x00000cb4
	adds r0, r4
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _08094C74
	.align 2, 0
_08094C54: .4byte gUnknown_83D3524
_08094C58: .4byte gUnknown_20397B0
_08094C5C: .4byte 0x00000cb4
_08094C60: .4byte gSprites
_08094C64: .4byte gUnknown_2039820
_08094C68:
	ldr r0, _08094C7C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r5, _08094C80 @ =0x00000cb4
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_08094C74:
	add sp, 0x2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094C7C: .4byte gUnknown_20397B0
_08094C80: .4byte 0x00000cb4
	thumb_func_end sub_8094AD8

	thumb_func_start sub_8094C84
sub_8094C84: @ 8094C84
	push {lr}
	ldr r2, _08094CBC @ =gUnknown_2039825
	movs r1, 0
	ldrb r0, [r2]
	cmp r0, 0
	bne _08094C92
	movs r1, 0x1
_08094C92:
	strb r1, [r2]
	ldr r0, _08094CC0 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r3, 0xCB
	lsls r3, 4
	adds r1, r0, r3
	ldr r3, [r1]
	ldr r1, _08094CC4 @ =0x00000cd4
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r3, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	pop {r0}
	bx r0
	.align 2, 0
_08094CBC: .4byte gUnknown_2039825
_08094CC0: .4byte gUnknown_20397B0
_08094CC4: .4byte 0x00000cd4
	thumb_func_end sub_8094C84

	thumb_func_start sub_8094CC8
sub_8094CC8: @ 8094CC8
	ldr r0, _08094CD0 @ =gUnknown_2039821
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08094CD0: .4byte gUnknown_2039821
	thumb_func_end sub_8094CC8

	thumb_func_start sub_8094CD4
sub_8094CD4: @ 8094CD4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r0, _08094D00 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08094D08
	ldr r4, _08094D04 @ =gUnknown_2039821
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	bl __modsi3
	strb r0, [r5]
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	bl __divsi3
	b _08094D0C
	.align 2, 0
_08094D00: .4byte gUnknown_2039820
_08094D04: .4byte gUnknown_2039821
_08094D08:
	movs r0, 0
	strb r0, [r5]
_08094D0C:
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8094CD4

	thumb_func_start sub_8094D14
sub_8094D14: @ 8094D14
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08094D30 @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r2, 0xCB
	lsls r2, 4
	adds r0, r2
	ldr r0, [r0]
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08094D30: .4byte gUnknown_20397B0
	thumb_func_end sub_8094D14

	thumb_func_start sub_8094D34
sub_8094D34: @ 8094D34
	ldr r0, _08094D3C @ =gUnknown_2039823
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08094D3C: .4byte gUnknown_2039823
	thumb_func_end sub_8094D34

	thumb_func_start sub_8094D40
sub_8094D40: @ 8094D40
	ldr r0, _08094D5C @ =gUnknown_20397B0
	ldr r0, [r0]
	movs r1, 0xCB
	lsls r1, 4
	adds r0, r1
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	bx lr
	.align 2, 0
_08094D5C: .4byte gUnknown_20397B0
	thumb_func_end sub_8094D40

	thumb_func_start sub_8094D60
sub_8094D60: @ 8094D60
	push {lr}
	ldr r0, _08094D7C @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08094D78
	ldr r0, _08094D80 @ =gUnknown_2039821
	ldrb r1, [r0]
	movs r0, 0
	bl sub_8095D44
_08094D78:
	pop {r0}
	bx r0
	.align 2, 0
_08094D7C: .4byte gUnknown_2039820
_08094D80: .4byte gUnknown_2039821
	thumb_func_end sub_8094D60

	thumb_func_start sub_8094D84
sub_8094D84: @ 8094D84
	push {lr}
	ldr r0, _08094DA0 @ =gUnknown_2039820
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08094D9C
	ldr r0, _08094DA4 @ =gUnknown_2039821
	ldrb r1, [r0]
	movs r0, 0
	bl sub_8095C84
_08094D9C:
	pop {r0}
	bx r0
	.align 2, 0
_08094DA0: .4byte gUnknown_2039820
_08094DA4: .4byte gUnknown_2039821
	thumb_func_end sub_8094D84

	thumb_func_start sub_8094DA8
sub_8094DA8: @ 8094DA8
	ldr r2, _08094DDC @ =gUnknown_20397B0
	ldr r0, [r2]
	ldr r1, _08094DE0 @ =0x00000ca8
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r3, _08094DE4 @ =0x00000ca9
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	subs r3, 0x41
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _08094DE8 @ =0x00000c6d
	adds r0, r1
	movs r1, 0xF
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x6
	adds r0, r3
	movs r1, 0x5C
	strh r1, [r0]
	bx lr
	.align 2, 0
_08094DDC: .4byte gUnknown_20397B0
_08094DE0: .4byte 0x00000ca8
_08094DE4: .4byte 0x00000ca9
_08094DE8: .4byte 0x00000c6d
	thumb_func_end sub_8094DA8

	thumb_func_start sub_8094DEC
sub_8094DEC: @ 8094DEC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r4, _08094E40 @ =gUnknown_20397B0
	ldr r2, [r4]
	ldr r5, _08094E44 @ =0x00000ca8
	adds r1, r2, r5
	ldrb r0, [r1]
	cmp r0, 0x6
	bhi _08094E38
	adds r1, r0, 0
	lsls r1, 3
	movs r0, 0xC7
	lsls r0, 4
	adds r1, r0
	adds r1, r2, r1
	ldr r2, _08094E48 @ =gUnknown_83D353C
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	str r3, [r1, 0x4]
	bl StringLength
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, [r4]
	ldr r2, _08094E4C @ =0x00000ca9
	adds r0, r2
	ldrb r2, [r0]
	cmp r1, r2
	bls _08094E2E
	strb r1, [r0]
_08094E2E:
	ldr r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08094E38:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094E40: .4byte gUnknown_20397B0
_08094E44: .4byte 0x00000ca8
_08094E48: .4byte gUnknown_83D353C
_08094E4C: .4byte 0x00000ca9
	thumb_func_end sub_8094DEC

	thumb_func_start sub_8094E50
sub_8094E50: @ 8094E50
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08094E74 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldr r3, _08094E78 @ =0x00000ca8
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08094E80
	lsls r0, r2, 3
	ldr r2, _08094E7C @ =0x00000c74
	adds r1, r2
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	b _08094E84
	.align 2, 0
_08094E74: .4byte gUnknown_20397B0
_08094E78: .4byte 0x00000ca8
_08094E7C: .4byte 0x00000c74
_08094E80:
	movs r0, 0x1
	negs r0, r0
_08094E84:
	pop {r1}
	bx r1
	thumb_func_end sub_8094E50

	thumb_func_start sub_8094E88
sub_8094E88: @ 8094E88
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	ldr r5, _08094F6C @ =gUnknown_20397B0
	ldr r1, [r5]
	ldr r2, _08094F70 @ =0x00000ca9
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, 0x2
	subs r2, 0x3E
	adds r1, r2
	movs r3, 0
	mov r10, r3
	strb r0, [r1]
	ldr r1, [r5]
	ldr r0, _08094F74 @ =0x00000ca8
	mov r8, r0
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, 1
	ldr r3, _08094F78 @ =0x00000c6c
	adds r1, r3
	strb r0, [r1]
	ldr r1, [r5]
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r0, 0x1D
	subs r0, r2
	ldr r2, _08094F7C @ =0x00000c69
	adds r1, r2
	strb r0, [r1]
	ldr r1, [r5]
	adds r3, r1, r3
	ldrb r2, [r3]
	movs r0, 0xF
	subs r0, r2
	ldr r3, _08094F80 @ =0x00000c6a
	adds r1, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldr r1, _08094F84 @ =0x00000c68
	adds r0, r1
	bl AddWindow
	ldr r1, [r5]
	ldr r4, _08094F88 @ =0x00000cac
	adds r1, r4
	movs r2, 0
	mov r9, r2
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0xB
	movs r3, 0xE
	bl SetWindowBorderStyle
	ldr r2, [r5]
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r6, 0x10
	str r6, [sp]
	mov r3, r8
	adds r1, r2, r3
	ldrb r1, [r1]
	str r1, [sp, 0x4]
	movs r1, 0xC7
	lsls r1, 4
	adds r2, r1
	str r2, [sp, 0x8]
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x2
	bl PrintTextArray
	ldr r1, [r5]
	adds r4, r1, r4
	ldrb r0, [r4]
	str r6, [sp]
	add r1, r8
	ldrb r1, [r1]
	str r1, [sp, 0x4]
	mov r2, r10
	str r2, [sp, 0x8]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x2
	bl ProgramAndPlaceMenuCursorOnWindow
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	ldr r0, [r5]
	ldr r3, _08094F8C @ =0x00000caa
	adds r0, r3
	mov r1, r9
	strb r1, [r0]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094F6C: .4byte gUnknown_20397B0
_08094F70: .4byte 0x00000ca9
_08094F74: .4byte 0x00000ca8
_08094F78: .4byte 0x00000c6c
_08094F7C: .4byte 0x00000c69
_08094F80: .4byte 0x00000c6a
_08094F84: .4byte 0x00000c68
_08094F88: .4byte 0x00000cac
_08094F8C: .4byte 0x00000caa
	thumb_func_end sub_8094E88

	thumb_func_start sub_8094F90
sub_8094F90: @ 8094F90
	movs r0, 0
	bx lr
	thumb_func_end sub_8094F90

	thumb_func_start sub_8094F94
sub_8094F94: @ 8094F94
	push {r4,r5,lr}
	movs r5, 0x2
	negs r5, r5
	ldr r4, _08094FD0 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08094FEA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08094FB6
	movs r0, 0x5
	bl PlaySE
	adds r5, 0x1
_08094FB6:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08094FD4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08094FF2
	.align 2, 0
_08094FD0: .4byte gMain
_08094FD4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08094FF2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08094FF2
_08094FEA:
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
_08094FF2:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _08094FFE
	bl sub_8095024
_08094FFE:
	cmp r5, 0
	blt _08095010
	ldr r0, _0809501C @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r5, 3
	ldr r2, _08095020 @ =0x00000c74
	adds r0, r2
	adds r0, r1
	ldr r5, [r0]
_08095010:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809501C: .4byte gUnknown_20397B0
_08095020: .4byte 0x00000c74
	thumb_func_end sub_8094F94

	thumb_func_start sub_8095024
sub_8095024: @ 8095024
	push {r4,r5,lr}
	ldr r5, _08095048 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r4, _0809504C @ =0x00000cac
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x1
	bl ClearMenuWindow
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095048: .4byte gUnknown_20397B0
_0809504C: .4byte 0x00000cac
	thumb_func_end sub_8095024

	thumb_func_start sub_8095050
sub_8095050: @ 8095050
	push {r4,lr}
	ldr r4, _08095088 @ =gUnknown_2039828
	ldr r0, _0809508C @ =0x00000974
	bl Alloc
	str r0, [r4]
	cmp r0, 0
	beq _0809509C
	ldr r0, _08095090 @ =gUnknown_83D35D4
	bl AddWindow8Bit
	adds r1, r0, 0
	ldr r0, _08095094 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _08095098 @ =0x000021f0
	adds r0, r2
	strh r1, [r0]
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	beq _0809509C
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0
	bl FillWindowPixelBuffer
	movs r0, 0x1
	b _0809509E
	.align 2, 0
_08095088: .4byte gUnknown_2039828
_0809508C: .4byte 0x00000974
_08095090: .4byte gUnknown_83D35D4
_08095094: .4byte gUnknown_20397B0
_08095098: .4byte 0x000021f0
_0809509C:
	movs r0, 0
_0809509E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095050

	thumb_func_start sub_80950A4
sub_80950A4: @ 80950A4
	push {lr}
	ldr r0, _080950B8 @ =gUnknown_2039828
	ldr r0, [r0]
	cmp r0, 0
	beq _080950B2
	bl Free
_080950B2:
	pop {r0}
	bx r0
	.align 2, 0
_080950B8: .4byte gUnknown_2039828
	thumb_func_end sub_80950A4

	thumb_func_start sub_80950BC
sub_80950BC: @ 80950BC
	ldr r2, _080950CC @ =gUnknown_2039828
	ldr r1, [r2]
	movs r3, 0
	strb r0, [r1]
	ldr r0, [r2]
	strb r3, [r0, 0x1]
	bx lr
	.align 2, 0
_080950CC: .4byte gUnknown_2039828
	thumb_func_end sub_80950BC

	thumb_func_start sub_80950D0
sub_80950D0: @ 80950D0
	push {lr}
	ldr r0, _080950E8 @ =gUnknown_2039828
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08095130
	lsls r0, 2
	ldr r1, _080950EC @ =_080950F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080950E8: .4byte gUnknown_2039828
_080950EC: .4byte _080950F0
	.align 2, 0
_080950F0:
	.4byte _08095108
	.4byte _0809510E
	.4byte _08095114
	.4byte _0809511A
	.4byte _08095120
	.4byte _08095126
_08095108:
	bl sub_8095138
	b _0809512A
_0809510E:
	bl sub_8095234
	b _0809512A
_08095114:
	bl sub_80952A0
	b _0809512A
_0809511A:
	bl sub_8095314
	b _0809512A
_08095120:
	bl sub_8095394
	b _0809512A
_08095126:
	bl sub_80953BC
_0809512A:
	lsls r0, 24
	lsrs r0, 24
	b _08095132
_08095130:
	movs r0, 0
_08095132:
	pop {r1}
	bx r1
	thumb_func_end sub_80950D0

	thumb_func_start sub_8095138
sub_8095138: @ 8095138
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08095150 @ =gUnknown_2039828
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	beq _08095168
	cmp r0, 0x1
	bgt _08095154
	cmp r0, 0
	beq _0809515A
	b _08095228
	.align 2, 0
_08095150: .4byte gUnknown_2039828
_08095154:
	cmp r0, 0x2
	beq _08095214
	b _08095228
_0809515A:
	movs r0, 0
	bl HideBg
	movs r0, 0x80
	bl sub_8097198
	b _080951F8
_08095168:
	adds r0, r1, 0x2
	adds r1, 0x3
	bl sub_8094CD4
	ldr r1, [r6]
	ldrb r0, [r1, 0x2]
	strb r0, [r1, 0x4]
	ldr r1, [r6]
	ldrb r0, [r1, 0x3]
	strb r0, [r1, 0x5]
	ldr r4, _08095204 @ =0xfffffc00
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	adds r1, r4, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _08095208 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r4, _0809520C @ =0x000021f0
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	bl FillWindowPixelBuffer8Bit
	ldr r1, [r6]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	bl sub_80956A4
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1
	bl SetBgAttribute
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x3
	bl CopyWindowToVram8Bit
	movs r0, 0xFC
	lsls r0, 6
	ldr r2, _08095210 @ =0x00007fff
	movs r1, 0x8
	bl BlendPalettes
	movs r0, 0x2
	bl sub_8094D14
	movs r0, 0x8
	movs r1, 0x80
	bl SetGpuRegBits
_080951F8:
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _08095228
	.align 2, 0
_08095204: .4byte 0xfffffc00
_08095208: .4byte gUnknown_20397B0
_0809520C: .4byte 0x000021f0
_08095210: .4byte 0x00007fff
_08095214:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08095228
	movs r0, 0
	bl ShowBg
	movs r0, 0
	b _0809522A
_08095228:
	movs r0, 0x1
_0809522A:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8095138

	thumb_func_start sub_8095234
sub_8095234: @ 8095234
	push {r4,lr}
	ldr r4, _0809524C @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _0809525E
	cmp r0, 0x1
	bgt _08095250
	cmp r0, 0
	beq _08095256
	b _08095298
	.align 2, 0
_0809524C: .4byte gUnknown_2039828
_08095250:
	cmp r0, 0x2
	beq _08095272
	b _08095298
_08095256:
	movs r0, 0
	bl HideBg
	b _08095268
_0809525E:
	bl sub_8095A58
	movs r0, 0
	bl sub_8094D14
_08095268:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _08095298
_08095272:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _08095298
	bl sub_8094D40
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0
	bl ShowBg
	movs r0, 0
	b _0809529A
_08095298:
	movs r0, 0x1
_0809529A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095234

	thumb_func_start sub_80952A0
sub_80952A0: @ 80952A0
	push {r4,lr}
	ldr r4, _080952B4 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080952B8
	cmp r0, 0x1
	beq _08095300
	b _0809530A
	.align 2, 0
_080952B4: .4byte gUnknown_2039828
_080952B8:
	bl sub_80924A8
	lsls r0, 24
	cmp r0, 0
	bne _0809530A
	ldr r1, [r4]
	adds r0, r1, 0x6
	adds r1, 0x7
	bl sub_8094CD4
	bl sub_8095520
	ldr r1, [r4]
	ldrb r0, [r1, 0x6]
	strb r0, [r1, 0x4]
	ldr r1, [r4]
	ldrb r0, [r1, 0x7]
	strb r0, [r1, 0x5]
	ldr r0, _080952F8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080952FC @ =0x000021f0
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	bl CopyWindowToVram8Bit
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0809530A
	.align 2, 0
_080952F8: .4byte gUnknown_20397B0
_080952FC: .4byte 0x000021f0
_08095300:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	lsrs r0, 24
	b _0809530C
_0809530A:
	movs r0, 0x1
_0809530C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80952A0

	thumb_func_start sub_8095314
sub_8095314: @ 8095314
	push {r4,lr}
	ldr r4, _0809532C @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _08095342
	cmp r0, 0x1
	bgt _08095330
	cmp r0, 0
	beq _08095336
	b _0809538C
	.align 2, 0
_0809532C: .4byte gUnknown_2039828
_08095330:
	cmp r0, 0x2
	beq _0809536E
	b _0809538C
_08095336:
	bl sub_80957C8
	bl sub_80958A0
	movs r0, 0
	b _08095360
_08095342:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0809538C
	movs r0, 0x3
	bl sub_8094D14
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0
	movs r2, 0x8
	bl sub_8095780
	movs r0, 0x1
_08095360:
	bl sub_8092BAC
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0809538C
_0809536E:
	bl sub_8095790
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8092BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0
	bne _0809538C
	cmp r0, 0
	bne _0809538C
	movs r0, 0
	b _0809538E
_0809538C:
	movs r0, 0x1
_0809538E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095314

	thumb_func_start sub_8095394
sub_8095394: @ 8095394
	push {r4,lr}
	bl sub_80924A8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8095790
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0
	bne _080953B4
	cmp r0, 0
	bne _080953B4
	movs r0, 0
	b _080953B6
_080953B4:
	movs r0, 0x1
_080953B6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8095394

	thumb_func_start sub_80953BC
sub_80953BC: @ 80953BC
	push {r4,lr}
	ldr r4, _080953D4 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	beq _080953FA
	cmp r0, 0x1
	bgt _080953D8
	cmp r0, 0
	beq _080953E2
	b _0809546A
	.align 2, 0
_080953D4: .4byte gUnknown_2039828
_080953D8:
	cmp r0, 0x2
	beq _08095426
	cmp r0, 0x3
	beq _08095444
	b _0809546A
_080953E2:
	bl sub_80959A8
	movs r1, 0xFF
	lsls r1, 8
	movs r0, 0
	movs r2, 0x8
	bl sub_8095780
	movs r0, 0
	bl sub_8092BAC
	b _0809543A
_080953FA:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	bl sub_8095790
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	bl sub_8095918
	movs r0, 0x2
	bl sub_8094D14
	movs r0, 0x1
	bl sub_8092BAC
	movs r0, 0
	bl HideBg
	b _0809543A
_08095426:
	bl sub_8092BF8
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	movs r0, 0
	bl sub_8094D14
	bl sub_8095A58
_0809543A:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0809546A
_08095444:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, 24
	cmp r0, 0
	bne _0809546A
	movs r0, 0x3
	bl stdpal_get
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	bl sub_8094D40
	movs r0, 0
	bl ShowBg
	movs r0, 0
	b _0809546C
_0809546A:
	movs r0, 0x1
_0809546C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80953BC

	thumb_func_start sub_8095474
sub_8095474: @ 8095474
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080954B0
	cmp r0, 0x1
	bgt _0809548A
	cmp r0, 0
	beq _08095494
	b _08095518
_0809548A:
	cmp r1, 0x2
	beq _080954D0
	cmp r1, 0x3
	beq _080954F0
	b _08095518
_08095494:
	ldr r0, _080954AC @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r0, [r1, 0x9]
	cmp r0, 0
	beq _080954FE
	subs r0, 0x1
	strb r0, [r1, 0x9]
	movs r1, 0x80
	lsls r1, 3
	movs r0, 0
	b _080954E4
	.align 2, 0
_080954AC: .4byte gUnknown_2039828
_080954B0:
	ldr r0, _080954CC @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r2, [r1, 0x9]
	ldrb r0, [r1, 0xB]
	adds r0, r2, r0
	cmp r0, 0x4
	bgt _080954FE
	adds r0, r2, 0x1
	strb r0, [r1, 0x9]
	movs r1, 0xFC
	lsls r1, 8
	movs r0, 0
	b _080954E4
	.align 2, 0
_080954CC: .4byte gUnknown_2039828
_080954D0:
	ldr r0, _080954EC @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _080954FE
	subs r0, 0x1
	strb r0, [r1, 0x8]
	movs r0, 0x80
	lsls r0, 3
	movs r1, 0
_080954E4:
	movs r2, 0x6
	bl sub_8095780
	b _08095518
	.align 2, 0
_080954EC: .4byte gUnknown_2039828
_080954F0:
	ldr r0, _08095504 @ =gUnknown_2039828
	ldr r1, [r0]
	ldrb r2, [r1, 0x8]
	ldrb r0, [r1, 0xA]
	adds r0, r2, r0
	cmp r0, 0x5
	ble _08095508
_080954FE:
	movs r0, 0
	b _0809551A
	.align 2, 0
_08095504: .4byte gUnknown_2039828
_08095508:
	adds r0, r2, 0x1
	strb r0, [r1, 0x8]
	movs r0, 0xFC
	lsls r0, 8
	movs r1, 0
	movs r2, 0x6
	bl sub_8095780
_08095518:
	movs r0, 0x1
_0809551A:
	pop {r1}
	bx r1
	thumb_func_end sub_8095474

	thumb_func_start sub_8095520
sub_8095520: @ 8095520
	push {r4-r7,lr}
	ldr r6, _080955C0 @ =gUnknown_2039828
	ldr r2, [r6]
	ldrb r3, [r2, 0x2]
	ldrb r5, [r2, 0x6]
	subs r1, r3, r5
	cmp r1, 0
	bge _08095532
	negs r1, r1
_08095532:
	ldrb r0, [r2, 0x4]
	subs r0, r3, r0
	cmp r0, 0
	bge _0809553C
	negs r0, r0
_0809553C:
	subs r0, r1, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x7]
	subs r3, r1, r0
	cmp r3, 0
	bge _0809554E
	negs r3, r3
_0809554E:
	ldrb r2, [r2, 0x5]
	subs r0, r1, r2
	cmp r0, 0
	bge _08095558
	negs r0, r0
_08095558:
	subs r0, r3, r0
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	cmp r4, 0
	ble _0809556C
	adds r0, r5, 0
	bl sub_80955C4
_0809556C:
	cmp r4, 0
	bge _08095588
	ldr r2, [r6]
	ldrb r0, [r2, 0x4]
	ldrb r1, [r2, 0x3]
	ldrb r2, [r2, 0x5]
	bl sub_8095634
	ldr r2, [r6]
	ldrb r0, [r2, 0x6]
	ldrb r1, [r2, 0x3]
	ldrb r2, [r2, 0x5]
	bl sub_80955C4
_08095588:
	lsls r0, r7, 16
	asrs r4, r0, 16
	cmp r4, 0
	ble _0809559C
	ldr r2, [r6]
	ldrb r0, [r2, 0x7]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x4]
	bl sub_80955FC
_0809559C:
	cmp r4, 0
	bge _080955B8
	ldr r2, [r6]
	ldrb r0, [r2, 0x5]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x4]
	bl sub_809566C
	ldr r2, [r6]
	ldrb r0, [r2, 0x7]
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x4]
	bl sub_80955FC
_080955B8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080955C0: .4byte gUnknown_2039828
	thumb_func_end sub_8095520

	thumb_func_start sub_80955C4
sub_80955C4: @ 80955C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _080955E2
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _080955F4
_080955E2:
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	bl sub_80956A4
	cmp r4, r5
	bls _080955E2
_080955F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80955C4

	thumb_func_start sub_80955FC
sub_80955FC: @ 80955FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _0809561A
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _0809562C
_0809561A:
	adds r0, r4, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r6, 0
	bl sub_80956A4
	cmp r4, r5
	bls _0809561A
_0809562C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80955FC

	thumb_func_start sub_8095634
sub_8095634: @ 8095634
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _08095652
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _08095664
_08095652:
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	bl sub_809572C
	cmp r4, r5
	bls _08095652
_08095664:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8095634

	thumb_func_start sub_809566C
sub_809566C: @ 809566C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r4, 0
	lsls r2, 24
	lsrs r5, r2, 24
	adds r0, r5, 0
	cmp r4, r5
	bls _0809568A
	adds r4, r5, 0
	adds r5, r1, 0
	cmp r0, r5
	bhi _0809569C
_0809568A:
	adds r0, r4, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r4, r1, 24
	adds r1, r6, 0
	bl sub_809572C
	cmp r4, r5
	bls _0809568A
_0809569C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_809566C

	thumb_func_start sub_80956A4
sub_80956A4: @ 80956A4
	push {r4-r7,lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r7, r0, r1
	lsls r4, r7, 1
	adds r4, r6, r4
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x41
	bl GetBoxMonDataFromSelectedBox
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetBoxMonDataFromSelectedBox
	adds r1, r0, 0
	cmp r5, 0
	beq _0809571A
	adds r0, r5, 0
	movs r2, 0x1
	bl GetMonIconPtr
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_80971F8
	adds r0, 0x8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08095724 @ =gUnknown_20397B0
	ldr r1, [r1]
	ldr r2, _08095728 @ =0x000021f0
	adds r1, r2
	ldrb r3, [r1]
	movs r2, 0x20
	str r2, [sp]
	str r2, [sp, 0x4]
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 3
	str r1, [sp, 0x8]
	lsls r1, r7, 3
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	str r2, [sp, 0x14]
	str r0, [sp, 0x18]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow4BitTo8Bit
_0809571A:
	add sp, 0x1C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095724: .4byte gUnknown_20397B0
_08095728: .4byte 0x000021f0
	thumb_func_end sub_80956A4

	thumb_func_start sub_809572C
sub_809572C: @ 809572C
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r5, r0, r1
	lsls r0, r5, 1
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x41
	bl GetBoxMonDataFromSelectedBox
	lsls r0, 16
	cmp r0, 0
	beq _0809576E
	ldr r0, _08095778 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0809577C @ =0x000021f0
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r4, 1
	adds r2, r4
	lsls r2, 3
	lsls r3, r5, 3
	movs r1, 0x20
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	bl FillWindowPixelRect8Bit
_0809576E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095778: .4byte gUnknown_20397B0
_0809577C: .4byte 0x000021f0
	thumb_func_end sub_809572C

	thumb_func_start sub_8095780
sub_8095780: @ 8095780
	ldr r3, _0809578C @ =gUnknown_2039828
	ldr r3, [r3]
	strh r0, [r3, 0xC]
	strh r1, [r3, 0xE]
	strh r2, [r3, 0x10]
	bx lr
	.align 2, 0
_0809578C: .4byte gUnknown_2039828
	thumb_func_end sub_8095780

	thumb_func_start sub_8095790
sub_8095790: @ 8095790
	push {r4,lr}
	ldr r4, _080957C4 @ =gUnknown_2039828
	ldr r1, [r4]
	ldrh r0, [r1, 0x10]
	cmp r0, 0
	beq _080957BA
	ldrh r1, [r1, 0xC]
	movs r0, 0
	movs r2, 0x1
	bl ChangeBgX
	ldr r0, [r4]
	ldrh r1, [r0, 0xE]
	movs r0, 0
	movs r2, 0x1
	bl ChangeBgY
	ldr r1, [r4]
	ldrh r0, [r1, 0x10]
	subs r0, 0x1
	strh r0, [r1, 0x10]
_080957BA:
	ldr r0, [r4]
	ldrb r0, [r0, 0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080957C4: .4byte gUnknown_2039828
	thumb_func_end sub_8095790

	thumb_func_start sub_80957C8
sub_80957C8: @ 80957C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _0809589C @ =gUnknown_2039828
	ldr r1, [r4]
	ldrb r0, [r1, 0x4]
	ldrb r2, [r1, 0x2]
	cmp r0, r2
	bls _080957E0
	adds r0, r2, 0
_080957E0:
	strb r0, [r1, 0x8]
	ldr r1, [r4]
	ldrb r0, [r1, 0x5]
	ldrb r2, [r1, 0x3]
	cmp r0, r2
	bls _080957EE
	adds r0, r2, 0
_080957EE:
	strb r0, [r1, 0x9]
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x4]
	subs r0, r1, r0
	cmp r0, 0
	bge _080957FE
	negs r0, r0
_080957FE:
	adds r0, 0x1
	strb r0, [r2, 0xA]
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x5]
	subs r0, r1, r0
	cmp r0, 0
	bge _08095810
	negs r0, r0
_08095810:
	adds r0, 0x1
	strb r0, [r2, 0xB]
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r6, 0
	ldr r0, [r4]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r8, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r0, r1
	mov r9, r0
	adds r2, r1, 0
	cmp r2, r9
	bge _0809588C
_08095838:
	lsls r0, r2, 1
	adds r0, r2
	ldr r3, _0809589C @ =gUnknown_2039828
	ldr r1, [r3]
	lsls r0, 1
	ldrb r3, [r1, 0x8]
	adds r0, r3
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	adds r7, r2, 0x1
	cmp r4, r8
	bge _08095886
	mov r0, r8
	subs r4, r0, r4
_08095856:
	mov r0, r10
	adds r1, r5, 0
	bl GetBoxedMonPtr
	adds r1, r0, 0
	ldr r2, _0809589C @ =gUnknown_2039828
	ldr r0, [r2]
	lsls r2, r6, 2
	adds r2, r6
	lsls r2, 4
	adds r0, r2
	adds r0, 0x14
	movs r2, 0x50
	bl memcpy
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _08095856
_08095886:
	adds r2, r7, 0
	cmp r2, r9
	blt _08095838
_0809588C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809589C: .4byte gUnknown_2039828
	thumb_func_end sub_80957C8

	thumb_func_start sub_80958A0
sub_80958A0: @ 80958A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, _08095914 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r7, r2, r1
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r1, r0
	mov r9, r1
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, [r4]
	ldrb r2, [r0, 0x9]
	cmp r2, r9
	bge _08095908
_080958CC:
	lsls r0, r2, 1
	adds r0, r2
	ldr r1, _08095914 @ =gUnknown_2039828
	ldr r1, [r1]
	lsls r0, 1
	ldrb r3, [r1, 0x8]
	adds r0, r3
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	adds r6, r2, 0x1
	cmp r4, r7
	bge _08095902
	subs r4, r7, r4
_080958E8:
	adds r0, r5, 0
	bl sub_809081C
	mov r0, r8
	adds r1, r5, 0
	bl sub_808BCB4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _080958E8
_08095902:
	adds r2, r6, 0
	cmp r2, r9
	blt _080958CC
_08095908:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095914: .4byte gUnknown_2039828
	thumb_func_end sub_80958A0

	thumb_func_start sub_8095918
sub_8095918: @ 8095918
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080959A4 @ =gUnknown_2039828
	ldr r0, [r0]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r8, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r0, r1
	mov r10, r0
	movs r6, 0
	adds r2, r1, 0
	cmp r2, r10
	bge _08095994
_0809593E:
	lsls r0, r2, 1
	adds r0, r2
	ldr r3, _080959A4 @ =gUnknown_2039828
	ldr r1, [r3]
	lsls r0, 1
	ldrb r4, [r1, 0x8]
	adds r0, r4
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	adds r7, r2, 0x1
	cmp r4, r8
	bge _0809598E
	mov r9, r3
	mov r0, r8
	subs r4, r0, r4
_0809595E:
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 4
	adds r1, 0x14
	mov r2, r9
	ldr r0, [r2]
	adds r0, r1
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _0809597C
	adds r0, r5, 0
	bl sub_80901EC
_0809597C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bne _0809595E
_0809598E:
	adds r2, r7, 0
	cmp r2, r10
	blt _0809593E
_08095994:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080959A4: .4byte gUnknown_2039828
	thumb_func_end sub_8095918

	thumb_func_start sub_80959A8
sub_80959A8: @ 80959A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, _08095A54 @ =gUnknown_2039828
	ldr r0, [r4]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r10, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r1, r0
	str r1, [sp]
	bl StorageGetCurrentBox
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r7, 0
	ldr r0, [r4]
	ldrb r3, [r0, 0x9]
	ldr r0, [sp]
	cmp r3, r0
	bge _08095A42
_080959DE:
	lsls r0, r3, 1
	adds r0, r3
	ldr r2, _08095A54 @ =gUnknown_2039828
	ldr r1, [r2]
	lsls r0, 1
	ldrb r4, [r1, 0x8]
	adds r0, r4
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r5, [r1, 0x8]
	adds r3, 0x1
	mov r9, r3
	cmp r5, r10
	bge _08095A3A
	mov r8, r2
	mov r0, r10
	subs r5, r0, r5
_08095A00:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 4
	adds r4, r0, 0
	adds r4, 0x14
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _08095A28
	mov r0, r8
	ldr r2, [r0]
	adds r2, r4
	ldr r0, [sp, 0x4]
	adds r1, r6, 0
	bl CopyBoxMonFromAnyBox
_08095A28:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	subs r5, 0x1
	cmp r5, 0
	bne _08095A00
_08095A3A:
	mov r3, r9
	ldr r1, [sp]
	cmp r3, r1
	blt _080959DE
_08095A42:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095A54: .4byte gUnknown_2039828
	thumb_func_end sub_80959A8

	thumb_func_start sub_8095A58
sub_8095A58: @ 8095A58
	push {lr}
	sub sp, 0x8
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgX
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl ChangeBgY
	movs r0, 0
	movs r1, 0x4
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x8
	movs r1, 0x80
	bl ClearGpuRegBits
	movs r0, 0x20
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, 0
	bl CopyBgTilemapBufferToVram
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8095A58

	thumb_func_start sub_8095AA0
sub_8095AA0: @ 8095AA0
	ldr r0, _08095AB8 @ =gUnknown_2039828
	ldr r2, [r0]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldrb r2, [r2, 0x2]
	adds r0, r2
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08095AB8: .4byte gUnknown_2039828
	thumb_func_end sub_8095AA0

	thumb_func_start sub_8095ABC
sub_8095ABC: @ 8095ABC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _08095B28 @ =gUnknown_2039828
	ldr r0, [r0]
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0xA]
	adds r2, r1
	mov r9, r2
	ldrb r1, [r0, 0x9]
	ldrb r0, [r0, 0xB]
	adds r0, r1, r0
	str r0, [sp]
	movs r7, 0
	adds r6, r1, 0
	cmp r6, r0
	bge _08095B4A
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	mov r8, r0
_08095AEC:
	ldr r2, _08095B28 @ =gUnknown_2039828
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	add r0, r8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r4, [r1, 0x8]
	cmp r4, r9
	bge _08095B3E
	mov r10, r2
_08095B00:
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 4
	adds r1, 0x14
	mov r2, r10
	ldr r0, [r2]
	adds r0, r1
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _08095B2C
	adds r0, r5, 0
	movs r1, 0x5
	bl GetBoxMonDataFromSelectedBox
	cmp r0, 0
	beq _08095B2C
	movs r0, 0
	b _08095B4C
	.align 2, 0
_08095B28: .4byte gUnknown_2039828
_08095B2C:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x1
	cmp r4, r9
	blt _08095B00
_08095B3E:
	movs r0, 0x6
	add r8, r0
	adds r6, 0x1
	ldr r2, [sp]
	cmp r6, r2
	blt _08095AEC
_08095B4A:
	movs r0, 0x1
_08095B4C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8095ABC

	thumb_func_start sub_8095B5C
sub_8095B5C: @ 8095B5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r3, _08095C58 @ =gUnknown_20397B0
	ldr r0, [r3]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095C3C
	ldr r0, _08095C5C @ =gUnknown_3000FE8
	str r0, [sp, 0x18]
	ldr r1, _08095C60 @ =0xffff0000
	add r2, sp, 0x18
	ldr r0, [r2, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r2, 0x4]
	mov r1, sp
	ldr r0, _08095C64 @ =gUnknown_83D3728
	ldm r0!, {r4-r6}
	stm r1!, {r4-r6}
	ldm r0!, {r4-r6}
	stm r1!, {r4-r6}
	movs r7, 0
	mov r9, r2
	mov r8, r3
	movs r0, 0
	mov r10, r0
_08095B9C:
	adds r6, r7, 0x7
	lsls r1, r6, 16
	mov r2, r9
	ldrh r0, [r2, 0x4]
	orrs r0, r1
	str r0, [r2, 0x4]
	mov r0, r9
	bl LoadCompressedSpriteSheet
	mov r4, r9
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	mov r5, r8
	ldr r1, [r5]
	lsls r5, r7, 4
	ldr r2, _08095C68 @ =0x000021f8
	adds r1, r2
	adds r1, r5
	lsls r0, 16
	lsrs r0, 11
	ldr r4, _08095C6C @ =0x06010000
	adds r0, r4
	str r0, [r1]
	ldr r0, _08095C70 @ =0xffffdacb
	adds r4, r7, r0
	lsls r0, r4, 16
	lsrs r0, 16
	bl AllocSpritePalette
	mov r2, r8
	ldr r1, [r2]
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08095C74 @ =0x000021fc
	adds r1, r2
	strh r0, [r1]
	ldrh r0, [r1]
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	strh r0, [r1]
	mov r0, sp
	strh r6, [r0]
	strh r4, [r0, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0xB
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r4, r8
	ldr r2, [r4]
	ldr r6, _08095C78 @ =0x000021f4
	adds r2, r6
	adds r2, r5
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08095C7C @ =gSprites
	adds r1, r0
	str r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r5
	movs r1, 0x88
	lsls r1, 6
	adds r0, r1
	mov r2, r10
	strb r2, [r0]
	adds r7, 0x1
	cmp r7, 0x2
	ble _08095B9C
_08095C3C:
	ldr r0, _08095C58 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r4, _08095C80 @ =0x00002224
	adds r0, r4
	movs r1, 0
	strh r1, [r0]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095C58: .4byte gUnknown_20397B0
_08095C5C: .4byte gUnknown_3000FE8
_08095C60: .4byte 0xffff0000
_08095C64: .4byte gUnknown_83D3728
_08095C68: .4byte 0x000021f8
_08095C6C: .4byte 0x06010000
_08095C70: .4byte 0xffffdacb
_08095C74: .4byte 0x000021fc
_08095C78: .4byte 0x000021f4
_08095C7C: .4byte gSprites
_08095C80: .4byte 0x00002224
	thumb_func_end sub_8095B5C

	thumb_func_start sub_8095C84
sub_8095C84: @ 8095C84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _08095CB8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095D36
	mov r0, r8
	adds r1, r7, 0
	bl sub_8096210
	cmp r0, 0
	bne _08095D36
	mov r0, r8
	cmp r0, 0
	beq _08095CBC
	cmp r0, 0x1
	beq _08095CD2
	b _08095D36
	.align 2, 0
_08095CB8: .4byte gUnknown_20397B0
_08095CBC:
	adds r0, r7, 0
	movs r1, 0x5
	bl GetBoxMonDataFromSelectedBox
	cmp r0, 0
	beq _08095D36
	adds r0, r7, 0
	movs r1, 0xC
	bl GetBoxMonDataFromSelectedBox
	b _08095CF0
_08095CD2:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08095D40 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _08095D36
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
_08095CF0:
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08095D36
	adds r0, r4, 0
	bl GetItemIconPic
	adds r6, r0, 0
	adds r0, r4, 0
	bl GetItemIconPalette
	adds r5, r0, 0
	bl sub_80961D8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	mov r1, r8
	adds r2, r7, 0
	bl sub_80962F0
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_8096408
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8096624
_08095D36:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095D40: .4byte gPlayerParty
	thumb_func_end sub_8095C84

	thumb_func_start sub_8095D44
sub_8095D44: @ 8095D44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08095D80 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095D7A
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80964E8
_08095D7A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095D80: .4byte gUnknown_20397B0
	thumb_func_end sub_8095D44

	thumb_func_start sub_8095D84
sub_8095D84: @ 8095D84
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	ldr r0, _08095DE8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095E14
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80964E8
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0
	bl sub_80962F0
	cmp r6, 0
	bne _08095DEC
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetBoxMonDataFromSelectedBox
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8090850
	b _08095E04
	.align 2, 0
_08095DE8: .4byte gUnknown_20397B0
_08095DEC:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _08095E1C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_8090C84
_08095E04:
	ldr r0, _08095E20 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _08095E24 @ =0x00000ce2
	adds r1, r0, r2
	ldrh r1, [r1]
	ldr r2, _08095E28 @ =0x00002224
	adds r0, r2
	strh r1, [r0]
_08095E14:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095E1C: .4byte gPlayerParty
_08095E20: .4byte gUnknown_20397B0
_08095E24: .4byte 0x00000ce2
_08095E28: .4byte 0x00002224
	thumb_func_end sub_8095D84

	thumb_func_start sub_8095E2C
sub_8095E2C: @ 8095E2C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
	bl GetItemIconPic
	mov r8, r0
	adds r0, r5, 0
	bl GetItemIconPalette
	adds r6, r0, 0
	bl sub_80961D8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	mov r1, r8
	adds r2, r6, 0
	bl sub_8096408
	adds r0, r4, 0
	movs r1, 0x6
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0
	bl sub_80964E8
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0
	bl sub_80962F0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8096624
	ldr r0, _08095E98 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08095E9C @ =0x00002224
	adds r0, r1
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095E98: .4byte gUnknown_20397B0
_08095E9C: .4byte 0x00002224
	thumb_func_end sub_8095E2C

	thumb_func_start sub_8095EA0
sub_8095EA0: @ 8095EA0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _08095F08 @ =gUnknown_20397B0
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095F5E
	mov r0, r9
	adds r1, r7, 0
	bl sub_8096258
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0
	bl sub_80964E8
	mov r1, r9
	cmp r1, 0
	bne _08095F10
	adds r0, r7, 0
	movs r1, 0xC
	bl GetBoxMonDataFromSelectedBox
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r8
	ldr r2, [r0]
	ldr r4, _08095F0C @ =0x00002224
	adds r2, r4
	adds r0, r7, 0
	movs r1, 0xC
	bl SetBoxMonDataFromSelectedBox
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	b _08095F3C
	.align 2, 0
_08095F08: .4byte gUnknown_20397B0
_08095F0C: .4byte 0x00002224
_08095F10:
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _08095F6C @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r8
	ldr r2, [r0]
	ldr r5, _08095F70 @ =0x00002224
	adds r2, r5
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5
_08095F3C:
	strh r6, [r0]
	movs r0, 0x2
	movs r1, 0
	bl sub_8096258
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x4
	mov r2, r9
	adds r3, r7, 0
	bl sub_80964E8
_08095F5E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095F6C: .4byte gPlayerParty
_08095F70: .4byte 0x00002224
	thumb_func_end sub_8095EA0

	thumb_func_start sub_8095F74
sub_8095F74: @ 8095F74
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	ldr r6, _08095FCC @ =gUnknown_20397B0
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08095FF4
	movs r0, 0x2
	movs r1, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r7, 0
	adds r3, r5, 0
	bl sub_80964E8
	cmp r7, 0
	bne _08095FD4
	ldr r2, [r6]
	ldr r0, _08095FD0 @ =0x00002224
	adds r2, r0
	adds r0, r5, 0
	movs r1, 0xC
	bl SetBoxMonDataFromSelectedBox
	adds r0, r5, 0
	movs r1, 0
	bl sub_8090850
	b _08095FF4
	.align 2, 0
_08095FCC: .4byte gUnknown_20397B0
_08095FD0: .4byte 0x00002224
_08095FD4:
	movs r0, 0x64
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _08096000 @ =gPlayerParty
	adds r0, r1
	ldr r2, [r6]
	ldr r1, _08096004 @ =0x00002224
	adds r2, r1
	movs r1, 0xC
	bl SetMonData
	mov r0, r8
	movs r1, 0
	bl sub_8090C84
_08095FF4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096000: .4byte gPlayerParty
_08096004: .4byte 0x00002224
	thumb_func_end sub_8095F74

	thumb_func_start sub_8096008
sub_8096008: @ 8096008
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	ldr r0, _08096060 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _0809607C
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80964E8
	cmp r6, 0
	bne _08096064
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetBoxMonDataFromSelectedBox
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8090850
	b _0809607C
	.align 2, 0
_08096060: .4byte gUnknown_20397B0
_08096064:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _08096084 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_8090C84
_0809607C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096084: .4byte gPlayerParty
	thumb_func_end sub_8096008

	thumb_func_start sub_8096088
sub_8096088: @ 8096088
	push {r4,lr}
	ldr r0, _080960BC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _080960B6
	movs r0, 0x2
	movs r1, 0
	bl sub_8096258
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_80964B8
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_80964E8
_080960B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080960BC: .4byte gUnknown_20397B0
	thumb_func_end sub_8096088

	thumb_func_start sub_80960C0
sub_80960C0: @ 80960C0
	push {r4,lr}
	ldr r0, _08096108 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x3
	bne _08096100
	movs r4, 0
_080960CE:
	ldr r0, _08096108 @ =gUnknown_20397B0
	ldr r1, [r0]
	lsls r0, r4, 4
	adds r1, r0
	movs r2, 0x88
	lsls r2, 6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080960FA
	subs r2, 0x2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080960FA
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0x7
	movs r2, 0x2
	movs r3, 0
	bl sub_80964E8
_080960FA:
	adds r4, 0x1
	cmp r4, 0x2
	ble _080960CE
_08096100:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096108: .4byte gUnknown_20397B0
	thumb_func_end sub_80960C0

	thumb_func_start sub_809610C
sub_809610C: @ 809610C
	push {r4,r5,lr}
	movs r5, 0
	ldr r0, _08096148 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _0809614C @ =0x000021f4
	adds r4, r0, r1
	adds r3, r0, 0
_0809611A:
	movs r1, 0x88
	lsls r1, 6
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096158
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x28
	ands r0, r1
	cmp r0, 0x8
	beq _08096144
	ldr r1, [r2, 0x1C]
	ldr r0, _08096150 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _08096158
	ldr r0, _08096154 @ =sub_80969BC
	cmp r1, r0
	beq _08096158
_08096144:
	movs r0, 0x1
	b _08096164
	.align 2, 0
_08096148: .4byte gUnknown_20397B0
_0809614C: .4byte 0x000021f4
_08096150: .4byte SpriteCallbackDummy
_08096154: .4byte sub_80969BC
_08096158:
	adds r4, 0x10
	adds r3, 0x10
	adds r5, 0x1
	cmp r5, 0x2
	ble _0809611A
	movs r0, 0
_08096164:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809610C

	thumb_func_start sub_809616C
sub_809616C: @ 809616C
	push {lr}
	ldr r0, _08096190 @ =gUnknown_20397B0
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x3
	bne _080961A0
	movs r2, 0
	ldr r0, _08096194 @ =0x000021fe
	adds r1, r0
_0809617E:
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _08096198
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _08096198
	movs r0, 0x1
	b _080961A2
	.align 2, 0
_08096190: .4byte gUnknown_20397B0
_08096194: .4byte 0x000021fe
_08096198:
	adds r1, 0x10
	adds r2, 0x1
	cmp r2, 0x2
	ble _0809617E
_080961A0:
	movs r0, 0
_080961A2:
	pop {r1}
	bx r1
	thumb_func_end sub_809616C

	thumb_func_start sub_80961A8
sub_80961A8: @ 80961A8
	push {lr}
	ldr r0, _080961BC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080961C0 @ =0x00002224
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetName
	pop {r1}
	bx r1
	.align 2, 0
_080961BC: .4byte gUnknown_20397B0
_080961C0: .4byte 0x00002224
	thumb_func_end sub_80961A8

	thumb_func_start sub_80961C4
sub_80961C4: @ 80961C4
	ldr r0, _080961D0 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080961D4 @ =0x00002224
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080961D0: .4byte gUnknown_20397B0
_080961D4: .4byte 0x00002224
	thumb_func_end sub_80961C4

	thumb_func_start sub_80961D8
sub_80961D8: @ 80961D8
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, _080961F8 @ =gUnknown_20397B0
	movs r3, 0x88
	lsls r3, 6
	movs r4, 0x1
_080961E4:
	ldr r0, [r5]
	lsls r1, r2, 4
	adds r0, r1
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0
	bne _080961FC
	strb r4, [r1]
	adds r0, r2, 0
	b _08096208
	.align 2, 0
_080961F8: .4byte gUnknown_20397B0
_080961FC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080961E4
	movs r0, 0x3
_08096208:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80961D8

	thumb_func_start sub_8096210
sub_8096210: @ 8096210
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	ldr r0, _08096244 @ =gUnknown_20397B0
	ldr r2, [r0]
_08096220:
	movs r5, 0x88
	lsls r5, 6
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096248
	subs r5, 0x2
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _08096248
	adds r5, 0x1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r1
	bne _08096248
	movs r0, 0x1
	b _08096252
	.align 2, 0
_08096244: .4byte gUnknown_20397B0
_08096248:
	adds r2, 0x10
	adds r3, 0x1
	cmp r3, 0x2
	ble _08096220
	movs r0, 0
_08096252:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8096210

	thumb_func_start sub_8096258
sub_8096258: @ 8096258
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r0, _08096290 @ =gUnknown_20397B0
	ldr r1, [r0]
_08096268:
	lsls r0, r3, 4
	adds r2, r1, r0
	movs r6, 0x88
	lsls r6, 6
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096294
	subs r6, 0x2
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _08096294
	adds r6, 0x1
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r4
	bne _08096294
	adds r0, r3, 0
	b _080962A0
	.align 2, 0
_08096290: .4byte gUnknown_20397B0
_08096294:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _08096268
	movs r0, 0x3
_080962A0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8096258

	thumb_func_start sub_80962A8
sub_80962A8: @ 80962A8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r2, 0
	ldr r0, _080962D4 @ =gUnknown_20397B0
	ldr r3, [r0]
	ldr r0, _080962D8 @ =0x000021f4
	adds r4, r3, r0
	movs r6, 0x88
	lsls r6, 6
_080962BA:
	lsls r1, r2, 4
	adds r0, r3, r1
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0
	beq _080962DC
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, r5
	bne _080962DC
	adds r0, r2, 0
	b _080962E8
	.align 2, 0
_080962D4: .4byte gUnknown_20397B0
_080962D8: .4byte 0x000021f4
_080962DC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080962BA
	movs r0, 0x3
_080962E8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80962A8

	thumb_func_start sub_80962F0
sub_80962F0: @ 80962F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	cmp r5, 0x2
	bhi _080963EE
	cmp r1, 0
	beq _0809631C
	cmp r1, 0x1
	beq _08096378
	ldr r4, _08096318 @ =gUnknown_20397B0
	lsls r3, r5, 4
	b _080963D8
	.align 2, 0
_08096318: .4byte gUnknown_20397B0
_0809631C:
	adds r0, r7, 0
	movs r1, 0x6
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08096370 @ =gUnknown_20397B0
	ldr r2, [r6]
	lsls r5, 4
	ldr r1, _08096374 @ =0x000021f4
	adds r2, r1
	adds r2, r5
	ldr r3, [r2]
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 3
	adds r1, 0x70
	strh r1, [r3, 0x20]
	ldr r3, [r2]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x38
	strh r1, [r3, 0x22]
	ldr r2, [r2]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	adds r4, r6, 0
	adds r3, r5, 0
	b _080963D8
	.align 2, 0
_08096370: .4byte gUnknown_20397B0
_08096374: .4byte 0x000021f4
_08096378:
	cmp r7, 0
	bne _080963A0
	ldr r4, _08096398 @ =gUnknown_20397B0
	ldr r0, [r4]
	lsls r3, r5, 4
	ldr r1, _0809639C @ =0x000021f4
	adds r0, r1
	adds r0, r3
	ldr r2, [r0]
	movs r1, 0x74
	strh r1, [r2, 0x20]
	ldr r1, [r0]
	movs r0, 0x4C
	strh r0, [r1, 0x22]
	b _080963C0
	.align 2, 0
_08096398: .4byte gUnknown_20397B0
_0809639C: .4byte 0x000021f4
_080963A0:
	ldr r4, _080963F8 @ =gUnknown_20397B0
	ldr r0, [r4]
	lsls r3, r5, 4
	ldr r1, _080963FC @ =0x000021f4
	adds r0, r1
	adds r0, r3
	ldr r2, [r0]
	movs r1, 0xA4
	strh r1, [r2, 0x20]
	ldr r2, [r0]
	subs r1, r7, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x1C
	strh r0, [r2, 0x22]
_080963C0:
	ldr r0, [r4]
	ldr r1, _080963FC @ =0x000021f4
	adds r0, r1
	adds r0, r3
	ldr r2, [r0]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
_080963D8:
	ldr r0, [r4]
	adds r0, r3
	ldr r1, _08096400 @ =0x000021fe
	adds r0, r1
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r3
	ldr r1, _08096404 @ =0x000021ff
	adds r0, r1
	strb r7, [r0]
_080963EE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080963F8: .4byte gUnknown_20397B0
_080963FC: .4byte 0x000021f4
_08096400: .4byte 0x000021fe
_08096404: .4byte 0x000021ff
	thumb_func_end sub_80962F0

	thumb_func_start sub_8096408
sub_8096408: @ 8096408
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r1
	mov r9, r2
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bhi _08096490
	movs r0, 0
	str r0, [sp]
	ldr r4, _080964A0 @ =gUnknown_20397B0
	ldr r1, [r4]
	ldr r6, _080964A4 @ =0x000042bc
	adds r1, r6
	ldr r2, _080964A8 @ =0x01000080
	mov r0, sp
	bl CpuFastSet
	ldr r1, [r4]
	ldr r5, _080964AC @ =0x000022bc
	adds r1, r5
	mov r0, r8
	bl LZ77UnCompWram
	lsls r7, 4
	mov r8, r7
	adds r7, r4, 0
	movs r4, 0x2
_08096446:
	ldr r1, [r7]
	adds r0, r1, r5
	adds r1, r6
	movs r2, 0x18
	bl CpuFastSet
	adds r6, 0x80
	adds r5, 0x60
	subs r4, 0x1
	cmp r4, 0
	bge _08096446
	ldr r5, _080964A0 @ =gUnknown_20397B0
	ldr r1, [r5]
	ldr r4, _080964A4 @ =0x000042bc
	adds r0, r1, r4
	ldr r2, _080964B0 @ =0x000021f8
	adds r1, r2
	add r1, r8
	ldr r1, [r1]
	movs r2, 0x80
	bl CpuFastSet
	ldr r1, [r5]
	adds r1, r4
	mov r0, r9
	bl LZ77UnCompWram
	ldr r0, [r5]
	adds r4, r0, r4
	add r0, r8
	ldr r1, _080964B4 @ =0x000021fc
	adds r0, r1
	ldrh r1, [r0]
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
_08096490:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080964A0: .4byte gUnknown_20397B0
_080964A4: .4byte 0x000042bc
_080964A8: .4byte 0x01000080
_080964AC: .4byte 0x000022bc
_080964B0: .4byte 0x000021f8
_080964B4: .4byte 0x000021fc
	thumb_func_end sub_8096408

	thumb_func_start sub_80964B8
sub_80964B8: @ 80964B8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r2, 0x2
	bhi _080964DA
	ldr r0, _080964E0 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r2, 4
	ldr r2, _080964E4 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r0, [r0]
	adds r1, r3, 0
	bl StartSpriteAffineAnim
_080964DA:
	pop {r0}
	bx r0
	.align 2, 0
_080964E0: .4byte gUnknown_20397B0
_080964E4: .4byte 0x000021f4
	thumb_func_end sub_80964B8

	thumb_func_start sub_80964E8
sub_80964E8: @ 80964E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r3, 24
	cmp r4, 0x2
	bls _08096500
	b _08096612
_08096500:
	cmp r0, 0x7
	bls _08096506
	b _08096612
_08096506:
	lsls r0, 2
	ldr r1, _08096510 @ =_08096514
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096510: .4byte _08096514
	.align 2, 0
_08096514:
	.4byte _08096534
	.4byte _08096558
	.4byte _0809657C
	.4byte _080965A8
	.4byte _080965D4
	.4byte _08096612
	.4byte _08096612
	.4byte _08096600
_08096534:
	ldr r0, _0809654C @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _08096550 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
	strh r4, [r1, 0x2E]
	ldr r1, [r0]
	ldr r0, _08096554 @ =sub_809692C
	b _08096610
	.align 2, 0
_0809654C: .4byte gUnknown_20397B0
_08096550: .4byte 0x000021f4
_08096554: .4byte sub_809692C
_08096558:
	ldr r0, _08096570 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _08096574 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	ldr r0, _08096578 @ =sub_8096958
	b _08096610
	.align 2, 0
_08096570: .4byte gUnknown_20397B0
_08096574: .4byte 0x000021f4
_08096578: .4byte sub_8096958
_0809657C:
	ldr r0, _0809659C @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _080965A0 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	strh r5, [r1, 0x3A]
	ldr r1, [r0]
	strh r3, [r1, 0x3C]
	ldr r1, [r0]
	ldr r0, _080965A4 @ =sub_80969F4
	b _08096610
	.align 2, 0
_0809659C: .4byte gUnknown_20397B0
_080965A0: .4byte 0x000021f4
_080965A4: .4byte sub_80969F4
_080965A8:
	ldr r0, _080965C8 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _080965CC @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r2, [r0]
	ldr r1, _080965D0 @ =sub_8096A74
	str r1, [r2, 0x1C]
	strh r5, [r2, 0x3A]
	ldr r0, [r0]
	strh r3, [r0, 0x3C]
	b _08096612
	.align 2, 0
_080965C8: .4byte gUnknown_20397B0
_080965CC: .4byte 0x000021f4
_080965D0: .4byte sub_8096A74
_080965D4:
	ldr r0, _080965F4 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _080965F8 @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r2, [r0]
	movs r1, 0
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	strh r5, [r1, 0x3A]
	ldr r1, [r0]
	strh r3, [r1, 0x3C]
	ldr r1, [r0]
	ldr r0, _080965FC @ =sub_8096B10
	b _08096610
	.align 2, 0
_080965F4: .4byte gUnknown_20397B0
_080965F8: .4byte 0x000021f4
_080965FC: .4byte sub_8096B10
_08096600:
	ldr r0, _08096618 @ =gUnknown_20397B0
	ldr r0, [r0]
	lsls r1, r4, 4
	ldr r2, _0809661C @ =0x000021f4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08096620 @ =sub_8096BAC
_08096610:
	str r0, [r1, 0x1C]
_08096612:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096618: .4byte gUnknown_20397B0
_0809661C: .4byte 0x000021f4
_08096620: .4byte sub_8096BAC
	thumb_func_end sub_80964E8

	thumb_func_start sub_8096624
sub_8096624: @ 8096624
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r2, 0x2
	bhi _08096666
	ldr r1, _0809666C @ =gUnknown_20397B0
	ldr r0, [r1]
	lsls r2, 4
	adds r0, r2
	movs r3, 0x88
	lsls r3, 6
	adds r0, r3
	strb r4, [r0]
	ldr r0, [r1]
	ldr r1, _08096670 @ =0x000021f4
	adds r0, r1
	adds r0, r2
	ldr r0, [r0]
	movs r3, 0
	cmp r4, 0
	bne _08096654
	movs r3, 0x1
_08096654:
	adds r2, r0, 0
	adds r2, 0x3E
	lsls r3, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_08096666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809666C: .4byte gUnknown_20397B0
_08096670: .4byte 0x000021f4
	thumb_func_end sub_8096624

	thumb_func_start GetItemIconPic
GetItemIconPic: @ 8096674
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8098974
	pop {r1}
	bx r1
	thumb_func_end GetItemIconPic

	thumb_func_start GetItemIconPalette
GetItemIconPalette: @ 8096684
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8098974
	pop {r1}
	bx r1
	thumb_func_end GetItemIconPalette

	thumb_func_start sub_8096694
sub_8096694: @ 8096694
	push {r4,lr}
	sub sp, 0x14
	bl sub_809616C
	lsls r0, 24
	cmp r0, 0
	beq _080966B4
	ldr r0, _080966AC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080966B0 @ =0x00002224
	b _080966BA
	.align 2, 0
_080966AC: .4byte gUnknown_20397B0
_080966B0: .4byte 0x00002224
_080966B4:
	ldr r0, _080966EC @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080966F0 @ =0x00000ce2
_080966BA:
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetDescription
	adds r4, r0, 0
	movs r0, 0x2
	movs r1, 0x11
	bl FillWindowPixelBuffer
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	str r0, [sp, 0x10]
	movs r0, 0x2
	movs r1, 0x2
	adds r2, r4, 0
	movs r3, 0x2
	bl AddTextPrinterParameterized5
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080966EC: .4byte gUnknown_20397B0
_080966F0: .4byte 0x00000ce2
	thumb_func_end sub_8096694

	thumb_func_start sub_80966F4
sub_80966F4: @ 80966F4
	push {lr}
	ldr r0, _0809671C @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08096720 @ =0x00002226
	adds r0, r1
	movs r1, 0x19
	strh r1, [r0]
	ldr r1, _08096724 @ =gUnknown_83D35DC
	movs r3, 0xD2
	lsls r3, 1
	movs r0, 0
	movs r2, 0x80
	bl LoadBgTiles
	movs r0, 0
	bl sub_8096898
	pop {r0}
	bx r0
	.align 2, 0
_0809671C: .4byte gUnknown_20397B0
_08096720: .4byte 0x00002226
_08096724: .4byte gUnknown_83D35DC
	thumb_func_end sub_80966F4

	thumb_func_start sub_8096728
sub_8096728: @ 8096728
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r0, _08096740 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _08096744 @ =0x00002226
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0
	bne _08096748
	movs r0, 0
	b _080967AE
	.align 2, 0
_08096740: .4byte gUnknown_20397B0
_08096744: .4byte 0x00002226
_08096748:
	subs r0, 0x1
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, 0x19
	subs r5, r0, r1
	movs r4, 0
	cmp r4, r5
	bge _08096798
_08096758:
	movs r0, 0
	movs r1, 0xA
	bl GetBgAttribute
	adds r1, r0, 0
	ldr r0, _080967B8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _080967BC @ =0x00002226
	adds r0, r2
	adds r1, 0x14
	ldrh r0, [r0]
	adds r1, r0
	adds r1, r4
	lsls r1, 16
	lsrs r1, 16
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x19
	str r0, [sp, 0xC]
	movs r0, 0
	movs r3, 0xC
	bl WriteSequenceToBgTilemapBuffer
	adds r4, 0x1
	cmp r4, r5
	blt _08096758
_08096798:
	adds r0, r5, 0
	bl sub_8096898
	ldr r0, _080967B8 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _080967BC @ =0x00002226
	adds r0, r1
	ldrh r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_080967AE:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080967B8: .4byte gUnknown_20397B0
_080967BC: .4byte 0x00002226
	thumb_func_end sub_8096728

	thumb_func_start sub_80967C0
sub_80967C0: @ 80967C0
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r5, _080967D8 @ =gUnknown_20397B0
	ldr r0, [r5]
	ldr r4, _080967DC @ =0x00002226
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x19
	bne _080967E0
	movs r0, 0
	b _08096886
	.align 2, 0
_080967D8: .4byte gUnknown_20397B0
_080967DC: .4byte 0x00002226
_080967E0:
	cmp r0, 0
	bne _080967FC
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	movs r3, 0xB
	bl FillBgTilemapBufferRect
_080967FC:
	ldr r1, [r5]
	adds r1, r4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrh r1, [r1]
	movs r0, 0x19
	subs r5, r0, r1
	movs r4, 0
	cmp r4, r5
	bge _08096852
_08096812:
	movs r0, 0
	movs r1, 0xA
	bl GetBgAttribute
	adds r1, r0, 0
	ldr r0, _08096890 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r2, _08096894 @ =0x00002226
	adds r0, r2
	adds r1, 0x14
	ldrh r0, [r0]
	adds r1, r0
	adds r1, r4
	lsls r1, 16
	lsrs r1, 16
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r0, 0xF
	str r0, [sp, 0x8]
	movs r0, 0x19
	str r0, [sp, 0xC]
	movs r0, 0
	movs r3, 0xC
	bl WriteSequenceToBgTilemapBuffer
	adds r4, 0x1
	cmp r4, r5
	blt _08096812
_08096852:
	adds r0, r5, 0
	bl sub_8096898
	lsls r2, r5, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0x11
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	ldr r0, _08096890 @ =gUnknown_20397B0
	ldr r0, [r0]
	ldr r1, _08096894 @ =0x00002226
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x19
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_08096886:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08096890: .4byte gUnknown_20397B0
_08096894: .4byte 0x00002226
	thumb_func_end sub_80967C0

	thumb_func_start sub_8096898
sub_8096898: @ 8096898
	push {r4-r7,lr}
	sub sp, 0xC
	adds r7, r0, 0
	cmp r7, 0
	beq _080968D0
	movs r1, 0xD2
	lsls r1, 1
	lsls r4, r7, 24
	lsrs r4, 24
	str r4, [sp]
	movs r6, 0x1
	str r6, [sp, 0x4]
	movs r5, 0xF
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	ldr r1, _08096920 @ =0x000009a4
	str r4, [sp]
	str r6, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0
	movs r2, 0
	movs r3, 0x14
	bl FillBgTilemapBufferRect
_080968D0:
	ldr r1, _08096924 @ =0x000001a5
	lsls r5, r7, 24
	lsrs r5, 24
	movs r4, 0x1
	str r4, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r6, 0xF
	str r6, [sp, 0x8]
	movs r0, 0
	adds r2, r5, 0
	movs r3, 0xC
	bl FillBgTilemapBufferRect
	movs r1, 0xD3
	lsls r1, 1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	adds r2, r5, 0
	movs r3, 0xB
	bl FillBgTilemapBufferRect
	ldr r1, _08096928 @ =0x000001a7
	str r4, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0
	adds r2, r5, 0
	movs r3, 0x14
	bl FillBgTilemapBufferRect
	movs r0, 0
	bl ScheduleBgCopyTilemapToVram
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096920: .4byte 0x000009a4
_08096924: .4byte 0x000001a5
_08096928: .4byte 0x000001a7
	thumb_func_end sub_8096898

	thumb_func_start sub_809692C
sub_809692C: @ 809692C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809694C
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8096624
	ldr r0, _08096954 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0809694C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096954: .4byte SpriteCallbackDummy
	thumb_func_end sub_809692C

	thumb_func_start sub_8096958
sub_8096958: @ 8096958
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _0809696A
	cmp r1, 0x1
	beq _08096986
	b _080969B4
_0809696A:
	ldrh r0, [r3, 0x20]
	lsls r0, 4
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x22]
	lsls r0, 4
	strh r0, [r3, 0x32]
	movs r0, 0xA
	strh r0, [r3, 0x34]
	movs r0, 0x15
	strh r0, [r3, 0x36]
	strh r1, [r3, 0x38]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_08096986:
	ldrh r1, [r3, 0x30]
	ldrh r0, [r3, 0x34]
	subs r1, r0
	strh r1, [r3, 0x30]
	ldrh r0, [r3, 0x32]
	ldrh r2, [r3, 0x36]
	subs r0, r2
	strh r0, [r3, 0x32]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r3, 0x20]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r3, 0x22]
	ldrh r0, [r3, 0x38]
	adds r0, 0x1
	strh r0, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _080969B4
	ldr r0, _080969B8 @ =sub_80969BC
	str r0, [r3, 0x1C]
_080969B4:
	pop {r0}
	bx r0
	.align 2, 0
_080969B8: .4byte sub_80969BC
	thumb_func_end sub_8096958

	thumb_func_start sub_80969BC
sub_80969BC: @ 80969BC
	ldr r1, _080969F0 @ =gUnknown_20397B0
	ldr r3, [r1]
	movs r1, 0xCB
	lsls r1, 4
	adds r3, r1
	ldr r1, [r3]
	ldrh r1, [r1, 0x20]
	adds r1, 0x4
	strh r1, [r0, 0x20]
	ldr r2, [r3]
	ldrh r1, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r1, r2
	adds r1, 0x8
	strh r1, [r0, 0x22]
	ldr r1, [r3]
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	bx lr
	.align 2, 0
_080969F0: .4byte gUnknown_20397B0
	thumb_func_end sub_80969BC

	thumb_func_start sub_80969F4
sub_80969F4: @ 80969F4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08096A06
	cmp r1, 0x1
	beq _08096A22
	b _08096A6A
_08096A06:
	ldrh r0, [r4, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0xA
	strh r0, [r4, 0x34]
	movs r0, 0x15
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08096A22:
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x22]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08096A6A
	adds r0, r4, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80962F0
	ldr r0, _08096A70 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_08096A6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096A70: .4byte SpriteCallbackDummy
	thumb_func_end sub_80969F4

	thumb_func_start sub_8096A74
sub_8096A74: @ 8096A74
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08096A86
	cmp r1, 0x1
	beq _08096AA2
	b _08096B00
_08096A86:
	ldrh r0, [r4, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0xA
	strh r0, [r4, 0x34]
	movs r0, 0x15
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08096AA2:
	ldrh r1, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	subs r1, r0
	strh r1, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	subs r0, r2
	strh r0, [r4, 0x32]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x20]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x22]
	ldr r1, _08096B08 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 4
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08096B00
	adds r0, r4, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80962F0
	movs r0, 0
	strh r0, [r4, 0x24]
	ldr r0, _08096B0C @ =sub_80969BC
	str r0, [r4, 0x1C]
_08096B00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096B08: .4byte gSineTable
_08096B0C: .4byte sub_80969BC
	thumb_func_end sub_8096A74

	thumb_func_start sub_8096B10
sub_8096B10: @ 8096B10
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08096B22
	cmp r1, 0x1
	beq _08096B3E
	b _08096B9E
_08096B22:
	ldrh r0, [r4, 0x20]
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0xA
	strh r0, [r4, 0x34]
	movs r0, 0x15
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08096B3E:
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	ldrh r2, [r4, 0x32]
	adds r1, r2
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x22]
	ldr r1, _08096BA4 @ =gSineTable
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 4
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08096B9E
	adds r0, r4, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80962F0
	ldr r0, _08096BA8 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x24]
_08096B9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096BA4: .4byte gSineTable
_08096BA8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8096B10

	thumb_func_start sub_8096BAC
sub_8096BAC: @ 8096BAC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x22]
	subs r0, 0x8
	strh r0, [r2, 0x22]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08096BDC
	ldr r0, _08096BE0 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
	adds r0, r2, 0
	bl sub_80962A8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8096624
_08096BDC:
	pop {r0}
	bx r0
	.align 2, 0
_08096BE0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8096BAC

	thumb_func_start sub_8096BE4
sub_8096BE4: @ 8096BE4
	ldr r3, _08096BF4 @ =gUnknown_203982C
	str r0, [r3]
	str r1, [r0]
	movs r1, 0
	strb r2, [r0, 0x5]
	strb r1, [r0, 0x4]
	bx lr
	.align 2, 0
_08096BF4: .4byte gUnknown_203982C
	thumb_func_end sub_8096BE4

	thumb_func_start sub_8096BF8
sub_8096BF8: @ 8096BF8
	push {r4,r5,lr}
	ldr r2, _08096C3C @ =gUnknown_203982C
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08096C36
	movs r4, 0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _08096C2E
	adds r5, r2, 0
_08096C0E:
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	ldr r0, [r0]
	adds r0, r1
	ldr r1, [r0, 0x10]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcc _08096C0E
_08096C2E:
	ldr r0, _08096C3C @ =gUnknown_203982C
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
_08096C36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096C3C: .4byte gUnknown_203982C
	thumb_func_end sub_8096BF8

	thumb_func_start sub_8096C40
sub_8096C40: @ 8096C40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	mov r10, r3
	ldr r0, [sp, 0x24]
	ldr r3, [sp, 0x28]
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	ldr r6, [sp, 0x34]
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp]
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08096CC0 @ =gUnknown_203982C
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _08096CC8
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, [r2]
	adds r1, r0
	lsls r0, r4, 1
	strh r0, [r1, 0x8]
	ldr r2, [sp]
	lsls r0, r2, 5
	add r0, r12
	lsls r0, 1
	add r0, r9
	str r0, [r1, 0x4]
	adds r0, r3, 0
	muls r0, r6
	add r0, r8
	lsls r0, 1
	add r0, r10
	str r0, [r1]
	strh r5, [r1, 0xC]
	strh r6, [r1, 0xA]
	ldr r0, _08096CC4 @ =sub_8096CDC
	str r0, [r1, 0x10]
	movs r0, 0x1
	b _08096CCA
	.align 2, 0
_08096CC0: .4byte gUnknown_203982C
_08096CC4: .4byte sub_8096CDC
_08096CC8:
	movs r0, 0
_08096CCA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8096C40

	thumb_func_start sub_8096CDC
sub_8096CDC: @ 8096CDC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	b _08096D06
_08096CE4:
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	ldrh r2, [r4, 0x8]
	lsrs r2, 1
	bl CpuSet
	ldr r0, [r4, 0x4]
	adds r0, 0x40
	str r0, [r4, 0x4]
	ldrh r1, [r4, 0xA]
	lsls r1, 1
	ldr r0, [r4]
	adds r0, r1
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08096D06:
	ldrh r0, [r4, 0xC]
	cmp r5, r0
	bcc _08096CE4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8096CDC

	thumb_func_start sub_8096D14
sub_8096D14: @ 8096D14
	push {r4-r7,lr}
	mov r12, r0
	ldr r0, [sp, 0x14]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08096D60 @ =gUnknown_203982C
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _08096D68
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, [r2]
	adds r1, r0
	lsls r0, r3, 1
	strh r0, [r1, 0x8]
	lsls r0, r4, 5
	adds r0, r6
	lsls r0, 1
	add r0, r12
	str r0, [r1, 0x4]
	strh r5, [r1, 0xC]
	ldr r0, _08096D64 @ =sub_8096D70
	str r0, [r1, 0x10]
	movs r0, 0x1
	b _08096D6A
	.align 2, 0
_08096D60: .4byte gUnknown_203982C
_08096D64: .4byte sub_8096D70
_08096D68:
	movs r0, 0
_08096D6A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8096D14

	thumb_func_start sub_8096D70
sub_8096D70: @ 8096D70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	movs r0, 0
	ldrh r1, [r6, 0xC]
	cmp r0, r1
	bcs _08096DFE
	movs r7, 0x80
	lsls r7, 5
	mov r5, sp
	ldr r2, _08096DBC @ =0x040000d4
	mov r8, r2
	movs r1, 0x81
	lsls r1, 24
	mov r10, r1
_08096D96:
	ldr r2, [r6, 0x4]
	ldrh r3, [r6, 0x8]
	mov r12, r2
	adds r0, 0x1
	mov r9, r0
	cmp r3, r7
	bhi _08096DC0
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	mov r0, r8
	str r2, [r0]
	mov r1, r12
	str r1, [r0, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
	mov r1, r8
	b _08096DE8
	.align 2, 0
_08096DBC: .4byte 0x040000d4
_08096DC0:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _08096E10 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08096E14 @ =0x81000800
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r7
	subs r3, r7
	cmp r3, r7
	bhi _08096DC0
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
_08096DE8:
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	adds r0, 0x40
	str r0, [r6, 0x4]
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	ldrh r2, [r6, 0xC]
	cmp r0, r2
	bcc _08096D96
_08096DFE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096E10: .4byte 0x040000d4
_08096E14: .4byte 0x81000800
	thumb_func_end sub_8096D70

	.align 2, 0 @ Don't pad with nop.
