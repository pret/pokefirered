	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_8079B7C
sub_8079B7C: @ 8079B7C
	push {r4,r5,lr}
	ldr r5, _08079BEC @ =0x04000208
	ldrh r4, [r5]
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x1
	bl RegisterRamReset
	movs r0, 0
	movs r1, 0x80
	bl ClearGpuRegBits
	strh r4, [r5]
	ldr r1, _08079BF0 @ =gUnknown_30030F0
	ldr r0, _08079BF4 @ =0x00000439
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bl sub_804C058
	bl sub_8054A28
	bl ResetSaveCounters
	movs r0, 0
	bl sub_80DA4FC
	ldr r0, _08079BF8 @ =gUnknown_30053A0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08079BC4
	cmp r0, 0x2
	bne _08079BC8
_08079BC4:
	bl sub_8054A18
_08079BC8:
	ldr r0, _08079BFC @ =gUnknown_300500C
	ldr r0, [r0]
	ldrb r0, [r0, 0x15]
	lsls r0, 31
	lsrs r0, 31
	bl SetPokemonCryStereo
	ldr r0, _08079C00 @ =gHeap
	movs r1, 0xE0
	lsls r1, 9
	bl InitHeap
	ldr r0, _08079C04 @ =sub_8056938
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079BEC: .4byte 0x04000208
_08079BF0: .4byte gUnknown_30030F0
_08079BF4: .4byte 0x00000439
_08079BF8: .4byte gUnknown_30053A0
_08079BFC: .4byte gUnknown_300500C
_08079C00: .4byte gHeap
_08079C04: .4byte sub_8056938
	thumb_func_end sub_8079B7C

	.align 2, 0 @ Don't pad with nop.
