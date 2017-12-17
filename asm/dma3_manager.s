	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ClearDma3Requests
ClearDma3Requests: @ 8000BFC
	push {lr}
	ldr r2, _08000C28 @ =gUnknown_30008C8
	movs r0, 0x1
	strb r0, [r2]
	ldr r1, _08000C2C @ =gUnknown_30008C9
	movs r0, 0
	strb r0, [r1]
	movs r3, 0
	ldr r0, _08000C30 @ =gUnknown_30000C8
	movs r1, 0x7F
_08000C10:
	strh r3, [r0, 0x8]
	str r3, [r0]
	str r3, [r0, 0x4]
	adds r0, 0x10
	subs r1, 0x1
	cmp r1, 0
	bge _08000C10
	movs r0, 0
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08000C28: .4byte gUnknown_30008C8
_08000C2C: .4byte gUnknown_30008C9
_08000C30: .4byte gUnknown_30000C8
	thumb_func_end ClearDma3Requests

	thumb_func_start ProcessDma3Requests
ProcessDma3Requests: @ 8000C34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r0, _08000CB0 @ =gUnknown_30008C8
	ldrb r0, [r0]
	cmp r0, 0
	beq _08000C4A
	b _08000E8A
_08000C4A:
	movs r0, 0
	str r0, [sp, 0x8]
	ldr r1, _08000CB4 @ =gUnknown_30000C8
	ldr r2, _08000CB8 @ =gUnknown_30008C9
	ldrb r0, [r2]
	lsls r0, 4
	adds r0, r1
	ldrh r0, [r0, 0x8]
	mov r12, r2
	cmp r0, 0
	bne _08000C62
	b _08000E8A
_08000C62:
	mov r8, r1
	adds r1, 0x4
	mov r10, r1
	movs r6, 0x80
	lsls r6, 5
	ldr r7, _08000CBC @ =0x040000d4
	movs r2, 0
	mov r9, r2
_08000C72:
	mov r3, r12
	ldrb r0, [r3]
	lsls r5, r0, 4
	mov r0, r8
	adds r1, r5, r0
	ldrh r0, [r1, 0x8]
	ldr r2, [sp, 0x8]
	adds r0, r2, r0
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r0, 0xA0
	lsls r0, 8
	ldr r3, [sp, 0x8]
	cmp r3, r0
	bls _08000C94
	b _08000E8A
_08000C94:
	ldr r0, _08000CC0 @ =0x04000006
	ldrb r0, [r0]
	cmp r0, 0xE0
	bls _08000C9E
	b _08000E8A
_08000C9E:
	ldrh r0, [r1, 0xA]
	cmp r0, 0x2
	beq _08000D14
	cmp r0, 0x2
	bgt _08000CC4
	cmp r0, 0x1
	beq _08000CD0
	b _08000E34
	.align 2, 0
_08000CB0: .4byte gUnknown_30008C8
_08000CB4: .4byte gUnknown_30000C8
_08000CB8: .4byte gUnknown_30008C9
_08000CBC: .4byte 0x040000d4
_08000CC0: .4byte 0x04000006
_08000CC4:
	cmp r0, 0x3
	beq _08000D80
	cmp r0, 0x4
	bne _08000CCE
	b _08000DCC
_08000CCE:
	b _08000E34
_08000CD0:
	ldr r3, [r1]
	mov r2, r10
	adds r0, r5, r2
	ldr r2, [r0]
	ldrh r1, [r1, 0x8]
	cmp r1, r6
	bhi _08000CEA
	str r3, [r7]
	str r2, [r7, 0x4]
	lsrs r0, r1, 2
	movs r1, 0x84
	lsls r1, 24
	b _08000DEE
_08000CEA:
	ldr r4, _08000D0C @ =0x040000d4
	str r3, [r4]
	str r2, [r4, 0x4]
	ldr r0, _08000D10 @ =0x84000400
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r3, r6
	adds r2, r6
	subs r1, r6
	cmp r1, r6
	bhi _08000CEA
	str r3, [r4]
	str r2, [r4, 0x4]
	lsrs r0, r1, 2
	movs r1, 0x84
	lsls r1, 24
	b _08000DBA
	.align 2, 0
_08000D0C: .4byte 0x040000d4
_08000D10: .4byte 0x84000400
_08000D14:
	mov r3, r10
	adds r0, r5, r3
	ldr r4, [r0]
	ldrh r1, [r1, 0x8]
	cmp r1, r6
	bhi _08000D38
	mov r0, r8
	adds r0, 0xC
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp]
	mov r5, sp
	str r5, [r7]
	str r4, [r7, 0x4]
	lsrs r0, r1, 2
	movs r1, 0x85
	lsls r1, 24
	b _08000DEE
_08000D38:
	mov r2, r12
	ldrb r0, [r2]
	lsls r0, 4
	mov r5, r8
	adds r5, 0xC
	adds r0, r5
	ldr r0, [r0]
	str r0, [sp]
	ldr r3, _08000D78 @ =0x040000d4
	mov r0, sp
	str r0, [r3]
	str r4, [r3, 0x4]
	ldr r0, _08000D7C @ =0x85000400
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
	adds r4, r6
	subs r1, r6
	cmp r1, r6
	bhi _08000D38
	ldrb r0, [r2]
	lsls r0, 4
	adds r0, r5
	ldr r0, [r0]
	str r0, [sp]
	mov r2, sp
	str r2, [r3]
	str r4, [r3, 0x4]
	lsrs r0, r1, 2
	movs r1, 0x85
	lsls r1, 24
	b _08000E2E
	.align 2, 0
_08000D78: .4byte 0x040000d4
_08000D7C: .4byte 0x85000400
_08000D80:
	ldr r3, [r1]
	mov r2, r10
	adds r0, r5, r2
	ldr r2, [r0]
	ldrh r1, [r1, 0x8]
	cmp r1, r6
	bhi _08000D9A
	str r3, [r7]
	str r2, [r7, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
	b _08000DEE
_08000D9A:
	ldr r4, _08000DC4 @ =0x040000d4
	str r3, [r4]
	str r2, [r4, 0x4]
	ldr r0, _08000DC8 @ =0x80000800
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r3, r6
	adds r2, r6
	subs r1, r6
	cmp r1, r6
	bhi _08000D9A
	str r3, [r4]
	str r2, [r4, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
_08000DBA:
	orrs r0, r1
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	b _08000E34
	.align 2, 0
_08000DC4: .4byte 0x040000d4
_08000DC8: .4byte 0x80000800
_08000DCC:
	mov r3, r10
	adds r0, r5, r3
	ldr r2, [r0]
	ldrh r4, [r1, 0x8]
	add r1, sp, 0x4
	cmp r4, r6
	bhi _08000DF6
	mov r0, r8
	adds r0, 0xC
	adds r0, r5, r0
	ldr r0, [r0]
	strh r0, [r1]
	str r1, [r7]
	str r2, [r7, 0x4]
	lsrs r0, r4, 1
	movs r1, 0x81
	lsls r1, 24
_08000DEE:
	orrs r0, r1
	str r0, [r7, 0x8]
	ldr r0, [r7, 0x8]
	b _08000E34
_08000DF6:
	mov r5, r12
	ldrb r0, [r5]
	lsls r0, 4
	ldr r3, _08000E9C @ =gUnknown_30000D4
	adds r0, r3
	ldr r0, [r0]
	strh r0, [r1]
	ldr r3, _08000EA0 @ =0x040000d4
	str r1, [r3]
	str r2, [r3, 0x4]
	ldr r0, _08000EA4 @ =0x81000800
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
	adds r2, r6
	subs r4, r6
	cmp r4, r6
	bhi _08000DF6
	ldrb r0, [r5]
	lsls r0, 4
	ldr r5, _08000E9C @ =gUnknown_30000D4
	adds r0, r5
	ldr r0, [r0]
	strh r0, [r1]
	str r1, [r3]
	str r2, [r3, 0x4]
	lsrs r0, r4, 1
	movs r1, 0x81
	lsls r1, 24
_08000E2E:
	orrs r0, r1
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
_08000E34:
	ldr r1, _08000EA8 @ =gUnknown_30000C8
	mov r3, r12
	ldrb r0, [r3]
	lsls r0, 4
	adds r0, r1
	mov r2, r9
	str r2, [r0]
	ldrb r0, [r3]
	lsls r0, 4
	add r0, r10
	str r2, [r0]
	ldrb r0, [r3]
	lsls r0, 4
	adds r0, r1
	movs r4, 0
	strh r2, [r0, 0x8]
	ldrb r0, [r3]
	lsls r0, 4
	adds r0, r1
	mov r5, r9
	strh r5, [r0, 0xA]
	ldrb r0, [r3]
	lsls r0, 4
	adds r1, 0xC
	adds r0, r1
	mov r1, r9
	str r1, [r0]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	cmp r0, 0
	bge _08000E78
	strb r4, [r3]
_08000E78:
	mov r2, r12
	ldrb r0, [r2]
	lsls r0, 4
	ldr r3, _08000EA8 @ =gUnknown_30000C8
	adds r0, r3
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _08000E8A
	b _08000C72
_08000E8A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000E9C: .4byte gUnknown_30000D4
_08000EA0: .4byte 0x040000d4
_08000EA4: .4byte 0x81000800
_08000EA8: .4byte gUnknown_30000C8
	thumb_func_end ProcessDma3Requests

	thumb_func_start RequestDma3Copy
RequestDma3Copy: @ 8000EAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r12, r0
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 24
	lsrs r4, r3, 24
	movs r5, 0
	ldr r1, _08000EF8 @ =gUnknown_30008C8
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08000EFC @ =gUnknown_30008C9
	ldrb r2, [r0]
	mov r10, r1
	ldr r6, _08000F00 @ =gUnknown_30000C8
	mov r9, r6
	lsls r0, r2, 4
	adds r1, r0, r6
_08000ED8:
	lsls r3, r2, 4
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	bne _08000F18
	mov r0, r12
	str r0, [r1]
	mov r0, r9
	adds r0, 0x4
	adds r0, r3, r0
	mov r3, r8
	str r3, [r0]
	strh r7, [r1, 0x8]
	cmp r4, 0x1
	bne _08000F04
	strh r4, [r1, 0xA]
	b _08000F08
	.align 2, 0
_08000EF8: .4byte gUnknown_30008C8
_08000EFC: .4byte gUnknown_30008C9
_08000F00: .4byte gUnknown_30000C8
_08000F04:
	movs r0, 0x3
	strh r0, [r1, 0xA]
_08000F08:
	movs r0, 0
	ldr r1, _08000F14 @ =gUnknown_30008C8
	strb r0, [r1]
	lsls r0, r2, 16
	asrs r0, 16
	b _08000F34
	.align 2, 0
_08000F14: .4byte gUnknown_30008C8
_08000F18:
	adds r1, 0x10
	adds r2, 0x1
	cmp r2, 0x7F
	ble _08000F24
	adds r1, r6, 0
	movs r2, 0
_08000F24:
	adds r5, 0x1
	cmp r5, 0x7F
	ble _08000ED8
	movs r0, 0
	mov r3, r10
	strb r0, [r3]
	movs r0, 0x1
	negs r0, r0
_08000F34:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end RequestDma3Copy

	thumb_func_start RequestDma3Fill
RequestDma3Fill: @ 8000F44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	movs r6, 0
	ldr r0, _08000F9C @ =gUnknown_30008C9
	ldrb r2, [r0]
	ldr r1, _08000FA0 @ =gUnknown_30008C8
	movs r0, 0x1
	strb r0, [r1]
	mov r10, r1
	ldr r0, _08000FA4 @ =gUnknown_30000C8
	mov r12, r0
	mov r4, r12
	lsls r0, r2, 4
	adds r0, 0x8
	adds r1, r0, r4
_08000F74:
	lsls r3, r2, 4
	ldrh r0, [r1]
	cmp r0, 0
	bne _08000FBC
	adds r0, r4, 0x4
	adds r0, r3, r0
	mov r6, r8
	str r6, [r0]
	strh r7, [r1]
	strh r5, [r1, 0x2]
	adds r0, r4, 0
	adds r0, 0xC
	adds r0, r3, r0
	mov r3, r9
	str r3, [r0]
	cmp r5, 0x1
	bne _08000FA8
	movs r0, 0x2
	b _08000FAA
	.align 2, 0
_08000F9C: .4byte gUnknown_30008C9
_08000FA0: .4byte gUnknown_30008C8
_08000FA4: .4byte gUnknown_30000C8
_08000FA8:
	movs r0, 0x4
_08000FAA:
	strh r0, [r1, 0x2]
	movs r0, 0
	ldr r6, _08000FB8 @ =gUnknown_30008C8
	strb r0, [r6]
	lsls r0, r2, 16
	asrs r0, 16
	b _08000FDA
	.align 2, 0
_08000FB8: .4byte gUnknown_30008C8
_08000FBC:
	adds r1, 0x10
	adds r2, 0x1
	cmp r2, 0x7F
	ble _08000FCA
	mov r1, r12
	adds r1, 0x8
	movs r2, 0
_08000FCA:
	adds r6, 0x1
	cmp r6, 0x7F
	ble _08000F74
	movs r0, 0
	mov r1, r10
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
_08000FDA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end RequestDma3Fill

	thumb_func_start CheckForSpaceForDma3Request
CheckForSpaceForDma3Request: @ 8000FE8
	push {lr}
	movs r2, 0
	lsls r0, 16
	asrs r1, r0, 16
	movs r3, 0x1
	negs r3, r3
	cmp r1, r3
	bne _08001010
	ldr r1, _0800100C @ =gUnknown_30000C8
_08000FFA:
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	bne _0800101C
	adds r1, 0x10
	adds r2, 0x1
	cmp r2, 0x7F
	ble _08000FFA
_08001008:
	movs r0, 0
	b _08001020
	.align 2, 0
_0800100C: .4byte gUnknown_30000C8
_08001010:
	ldr r0, _08001024 @ =gUnknown_30000C8
	lsls r1, 4
	adds r1, r0
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	beq _08001008
_0800101C:
	movs r0, 0x1
	negs r0, r0
_08001020:
	pop {r1}
	bx r1
	.align 2, 0
_08001024: .4byte gUnknown_30000C8
	thumb_func_end CheckForSpaceForDma3Request

	.align 2, 0 @ Don't pad with nop.
