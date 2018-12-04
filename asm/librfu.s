	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start STWI_init_all
STWI_init_all: @ 81DF114
	push {r4,lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x1
	bne _081DF150
	adds r2, r3, 0
	adds r2, 0xE8
	str r2, [r1]
	ldr r1, _081DF13C @ =0x040000d4
	ldr r0, _081DF140 @ =IntrSIO32
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _081DF144 @ =0x800004b0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _081DF148 @ =gRfuState
	ldr r2, _081DF14C @ =0x00000a48
	adds r0, r3, r2
	b _081DF15A
	.align 2, 0
_081DF13C: .4byte 0x040000d4
_081DF140: .4byte IntrSIO32
_081DF144: .4byte 0x800004b0
_081DF148: .4byte gRfuState
_081DF14C: .4byte 0x00000a48
_081DF150:
	ldr r0, _081DF1D4 @ =IntrSIO32
	str r0, [r1]
	ldr r1, _081DF1D8 @ =gRfuState
	adds r0, r3, 0
	adds r0, 0xE8
_081DF15A:
	str r0, [r1]
	adds r2, r1, 0
	ldr r1, [r2]
	str r3, [r1, 0x28]
	adds r0, r3, 0
	adds r0, 0x74
	str r0, [r1, 0x24]
	ldrb r0, [r1, 0x14]
	movs r4, 0
	movs r0, 0x1
	strb r0, [r1, 0x14]
	ldr r0, [r2]
	str r4, [r0]
	strb r4, [r0, 0x4]
	ldr r0, [r2]
	strb r4, [r0, 0x5]
	ldr r0, [r2]
	strb r4, [r0, 0x7]
	ldr r0, [r2]
	strb r4, [r0, 0x8]
	ldr r0, [r2]
	strb r4, [r0, 0x9]
	ldr r0, [r2]
	str r4, [r0, 0xC]
	ldrb r1, [r0, 0x10]
	strb r4, [r0, 0x10]
	ldr r0, [r2]
	ldrh r1, [r0, 0x12]
	movs r1, 0
	strh r4, [r0, 0x12]
	strb r1, [r0, 0x15]
	ldr r0, [r2]
	adds r0, 0x2C
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r1, _081DF1DC @ =0x04000134
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	ldr r2, _081DF1E0 @ =0x00005003
	adds r0, r2, 0
	strh r0, [r1]
	bl STWI_init_Callback_M
	bl STWI_init_Callback_S
	ldr r3, _081DF1E4 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _081DF1E8 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DF1D4: .4byte IntrSIO32
_081DF1D8: .4byte gRfuState
_081DF1DC: .4byte 0x04000134
_081DF1E0: .4byte 0x00005003
_081DF1E4: .4byte 0x04000208
_081DF1E8: .4byte 0x04000200
	thumb_func_end STWI_init_all

	thumb_func_start STWI_init_timer
STWI_init_timer: @ 81DF1EC
	push {r4,r5,lr}
	ldr r2, _081DF218 @ =STWI_intr_timer
	str r2, [r0]
	ldr r5, _081DF21C @ =gRfuState
	ldr r0, [r5]
	movs r4, 0
	strb r1, [r0, 0xA]
	ldr r3, _081DF220 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _081DF224 @ =0x04000200
	ldr r1, [r5]
	movs r0, 0x8
	ldrb r1, [r1, 0xA]
	lsls r0, r1
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DF218: .4byte STWI_intr_timer
_081DF21C: .4byte gRfuState
_081DF220: .4byte 0x04000208
_081DF224: .4byte 0x04000200
	thumb_func_end STWI_init_timer

	thumb_func_start AgbRFU_SoftReset
AgbRFU_SoftReset: @ 81DF228
	push {r4,r5,lr}
	ldr r5, _081DF2C0 @ =0x04000134
	movs r1, 0x80
	lsls r1, 8
	adds r0, r1, 0
	strh r0, [r5]
	ldr r2, _081DF2C4 @ =0x000080a0
	adds r0, r2, 0
	strh r0, [r5]
	ldr r1, _081DF2C8 @ =gRfuState
	ldr r0, [r1]
	ldrb r0, [r0, 0xA]
	lsls r0, 2
	ldr r3, _081DF2CC @ =0x04000100
	adds r2, r0, r3
	ldr r4, _081DF2D0 @ =0x04000102
	adds r3, r0, r4
	movs r0, 0
	strh r0, [r3]
	strh r0, [r2]
	movs r0, 0x83
	strh r0, [r3]
	ldrh r0, [r2]
	adds r4, r1, 0
	cmp r0, 0x11
	bhi _081DF268
	ldr r0, _081DF2D4 @ =0x000080a2
	adds r1, r0, 0
_081DF260:
	strh r1, [r5]
	ldrh r0, [r2]
	cmp r0, 0x11
	bls _081DF260
_081DF268:
	movs r0, 0x3
	strh r0, [r3]
	ldr r1, _081DF2C0 @ =0x04000134
	ldr r2, _081DF2C4 @ =0x000080a0
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	ldr r3, _081DF2D8 @ =0x00005003
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, [r4]
	movs r2, 0
	str r2, [r0]
	strb r2, [r0, 0x4]
	ldr r0, [r4]
	strb r2, [r0, 0x5]
	ldr r0, [r4]
	strb r2, [r0, 0x6]
	ldr r0, [r4]
	strb r2, [r0, 0x7]
	ldr r0, [r4]
	strb r2, [r0, 0x8]
	ldr r0, [r4]
	strb r2, [r0, 0x9]
	ldr r0, [r4]
	str r2, [r0, 0xC]
	ldrb r1, [r0, 0x10]
	strb r2, [r0, 0x10]
	ldr r1, [r4]
	ldrh r0, [r1, 0x12]
	movs r3, 0
	strh r2, [r1, 0x12]
	ldrb r0, [r1, 0x14]
	movs r0, 0x1
	strb r0, [r1, 0x14]
	ldr r0, [r4]
	strb r3, [r0, 0x15]
	ldr r0, [r4]
	adds r0, 0x2C
	ldrb r1, [r0]
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DF2C0: .4byte 0x04000134
_081DF2C4: .4byte 0x000080a0
_081DF2C8: .4byte gRfuState
_081DF2CC: .4byte 0x04000100
_081DF2D0: .4byte 0x04000102
_081DF2D4: .4byte 0x000080a2
_081DF2D8: .4byte 0x00005003
	thumb_func_end AgbRFU_SoftReset

	thumb_func_start STWI_set_MS_mode
STWI_set_MS_mode: @ 81DF2DC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081DF2EC @ =gRfuState
	ldr r1, [r1]
	ldrb r2, [r1, 0x14]
	strb r0, [r1, 0x14]
	bx lr
	.align 2, 0
_081DF2EC: .4byte gRfuState
	thumb_func_end STWI_set_MS_mode

	thumb_func_start STWI_read_status
STWI_read_status: @ 81DF2F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _081DF31C
	cmp r0, 0x1
	bgt _081DF306
	cmp r0, 0
	beq _081DF310
	b _081DF344
_081DF306:
	cmp r1, 0x2
	beq _081DF328
	cmp r1, 0x3
	beq _081DF338
	b _081DF344
_081DF310:
	ldr r0, _081DF318 @ =gRfuState
	ldr r0, [r0]
	ldrh r0, [r0, 0x12]
	b _081DF346
	.align 2, 0
_081DF318: .4byte gRfuState
_081DF31C:
	ldr r0, _081DF324 @ =gRfuState
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	b _081DF346
	.align 2, 0
_081DF324: .4byte gRfuState
_081DF328:
	ldr r0, _081DF334 @ =gRfuState
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r0, 16
	lsrs r0, 16
	b _081DF346
	.align 2, 0
_081DF334: .4byte gRfuState
_081DF338:
	ldr r0, _081DF340 @ =gRfuState
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	b _081DF346
	.align 2, 0
_081DF340: .4byte gRfuState
_081DF344:
	ldr r0, _081DF34C @ =0x0000ffff
_081DF346:
	pop {r1}
	bx r1
	.align 2, 0
_081DF34C: .4byte 0x0000ffff
	thumb_func_end STWI_read_status

	thumb_func_start STWI_init_Callback_M
STWI_init_Callback_M: @ 81DF350
	push {lr}
	movs r0, 0
	bl STWI_set_Callback_M
	pop {r0}
	bx r0
	thumb_func_end STWI_init_Callback_M

	thumb_func_start STWI_init_Callback_S
STWI_init_Callback_S: @ 81DF35C
	push {lr}
	movs r0, 0
	bl STWI_set_Callback_S
	pop {r0}
	bx r0
	thumb_func_end STWI_init_Callback_S

	thumb_func_start STWI_set_Callback_M
STWI_set_Callback_M: @ 81DF368
	ldr r1, _081DF370 @ =gRfuState
	ldr r1, [r1]
	str r0, [r1, 0x18]
	bx lr
	.align 2, 0
_081DF370: .4byte gRfuState
	thumb_func_end STWI_set_Callback_M

	thumb_func_start STWI_set_Callback_S
STWI_set_Callback_S: @ 81DF374
	ldr r1, _081DF37C @ =gRfuState
	ldr r1, [r1]
	str r0, [r1, 0x1C]
	bx lr
	.align 2, 0
_081DF37C: .4byte gRfuState
	thumb_func_end STWI_set_Callback_S

	thumb_func_start STWI_set_Callback_ID
STWI_set_Callback_ID: @ 81DF380
	ldr r1, _081DF388 @ =gRfuState
	ldr r1, [r1]
	str r0, [r1, 0x20]
	bx lr
	.align 2, 0
_081DF388: .4byte gRfuState
	thumb_func_end STWI_set_Callback_ID

	thumb_func_start STWI_poll_CommandEnd
STWI_poll_CommandEnd: @ 81DF38C
	push {lr}
	ldr r0, _081DF3B0 @ =gRfuState
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _081DF3A6
	adds r1, r2, 0
_081DF3A0:
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _081DF3A0
_081DF3A6:
	ldr r0, [r3]
	ldrh r0, [r0, 0x12]
	pop {r1}
	bx r1
	.align 2, 0
_081DF3B0: .4byte gRfuState
	thumb_func_end STWI_poll_CommandEnd

	thumb_func_start STWI_send_ResetREQ
STWI_send_ResetREQ: @ 81DF3B4
	push {lr}
	movs r0, 0x10
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF3CE
	ldr r0, _081DF3D4 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF3CE:
	pop {r0}
	bx r0
	.align 2, 0
_081DF3D4: .4byte gRfuState
	thumb_func_end STWI_send_ResetREQ

	thumb_func_start STWI_send_LinkStatusREQ
STWI_send_LinkStatusREQ: @ 81DF3D8
	push {lr}
	movs r0, 0x11
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF3F2
	ldr r0, _081DF3F8 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF3F2:
	pop {r0}
	bx r0
	.align 2, 0
_081DF3F8: .4byte gRfuState
	thumb_func_end STWI_send_LinkStatusREQ

	thumb_func_start STWI_send_VersionStatusREQ
STWI_send_VersionStatusREQ: @ 81DF3FC
	push {lr}
	movs r0, 0x12
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF416
	ldr r0, _081DF41C @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF416:
	pop {r0}
	bx r0
	.align 2, 0
_081DF41C: .4byte gRfuState
	thumb_func_end STWI_send_VersionStatusREQ

	thumb_func_start STWI_send_SystemStatusREQ
STWI_send_SystemStatusREQ: @ 81DF420
	push {lr}
	movs r0, 0x13
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF43A
	ldr r0, _081DF440 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF43A:
	pop {r0}
	bx r0
	.align 2, 0
_081DF440: .4byte gRfuState
	thumb_func_end STWI_send_SystemStatusREQ

	thumb_func_start STWI_send_SlotStatusREQ
STWI_send_SlotStatusREQ: @ 81DF444
	push {lr}
	movs r0, 0x14
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF45E
	ldr r0, _081DF464 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF45E:
	pop {r0}
	bx r0
	.align 2, 0
_081DF464: .4byte gRfuState
	thumb_func_end STWI_send_SlotStatusREQ

	thumb_func_start STWI_send_ConfigStatusREQ
STWI_send_ConfigStatusREQ: @ 81DF468
	push {lr}
	movs r0, 0x15
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF482
	ldr r0, _081DF488 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF482:
	pop {r0}
	bx r0
	.align 2, 0
_081DF488: .4byte gRfuState
	thumb_func_end STWI_send_ConfigStatusREQ

	thumb_func_start STWI_send_GameConfigREQ
STWI_send_GameConfigREQ: @ 81DF48C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x16
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF4D8
	ldr r2, _081DF4E0 @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x6
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	ldr r1, [r0, 0x24]
	adds r1, 0x4
	ldrh r0, [r4]
	strh r0, [r1]
	adds r1, 0x2
	adds r4, 0x2
	movs r2, 0xD
_081DF4B6:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r1, 0x1
	adds r4, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _081DF4B6
	movs r2, 0x7
_081DF4C6:
	ldrb r0, [r5]
	strb r0, [r1]
	adds r1, 0x1
	adds r5, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _081DF4C6
	bl STWI_start_Command
_081DF4D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DF4E0: .4byte gRfuState
	thumb_func_end STWI_send_GameConfigREQ

	thumb_func_start STWI_send_SystemConfigREQ
STWI_send_SystemConfigREQ: @ 81DF4E4
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r0, 0x17
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF51A
	ldr r2, _081DF520 @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	ldr r0, [r0, 0x24]
	adds r0, 0x4
	strb r4, [r0]
	adds r0, 0x1
	strb r5, [r0]
	adds r0, 0x1
	strh r6, [r0]
	bl STWI_start_Command
_081DF51A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DF520: .4byte gRfuState
	thumb_func_end STWI_send_SystemConfigREQ

	thumb_func_start STWI_send_SC_StartREQ
STWI_send_SC_StartREQ: @ 81DF524
	push {lr}
	movs r0, 0x19
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF53E
	ldr r0, _081DF544 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF53E:
	pop {r0}
	bx r0
	.align 2, 0
_081DF544: .4byte gRfuState
	thumb_func_end STWI_send_SC_StartREQ

	thumb_func_start STWI_send_SC_PollingREQ
STWI_send_SC_PollingREQ: @ 81DF548
	push {lr}
	movs r0, 0x1A
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF562
	ldr r0, _081DF568 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF562:
	pop {r0}
	bx r0
	.align 2, 0
_081DF568: .4byte gRfuState
	thumb_func_end STWI_send_SC_PollingREQ

	thumb_func_start STWI_send_SC_EndREQ
STWI_send_SC_EndREQ: @ 81DF56C
	push {lr}
	movs r0, 0x1B
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF586
	ldr r0, _081DF58C @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF586:
	pop {r0}
	bx r0
	.align 2, 0
_081DF58C: .4byte gRfuState
	thumb_func_end STWI_send_SC_EndREQ

	thumb_func_start STWI_send_SP_StartREQ
STWI_send_SP_StartREQ: @ 81DF590
	push {lr}
	movs r0, 0x1C
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF5AA
	ldr r0, _081DF5B0 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF5AA:
	pop {r0}
	bx r0
	.align 2, 0
_081DF5B0: .4byte gRfuState
	thumb_func_end STWI_send_SP_StartREQ

	thumb_func_start STWI_send_SP_PollingREQ
STWI_send_SP_PollingREQ: @ 81DF5B4
	push {lr}
	movs r0, 0x1D
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF5CE
	ldr r0, _081DF5D4 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF5CE:
	pop {r0}
	bx r0
	.align 2, 0
_081DF5D4: .4byte gRfuState
	thumb_func_end STWI_send_SP_PollingREQ

	thumb_func_start STWI_send_SP_EndREQ
STWI_send_SP_EndREQ: @ 81DF5D8
	push {lr}
	movs r0, 0x1E
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF5F2
	ldr r0, _081DF5F8 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF5F2:
	pop {r0}
	bx r0
	.align 2, 0
_081DF5F8: .4byte gRfuState
	thumb_func_end STWI_send_SP_EndREQ

	thumb_func_start STWI_send_CP_StartREQ
STWI_send_CP_StartREQ: @ 81DF5FC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x1F
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF620
	ldr r2, _081DF628 @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	ldr r0, [r0, 0x24]
	str r4, [r0, 0x4]
	bl STWI_start_Command
_081DF620:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DF628: .4byte gRfuState
	thumb_func_end STWI_send_CP_StartREQ

	thumb_func_start STWI_send_CP_PollingREQ
STWI_send_CP_PollingREQ: @ 81DF62C
	push {lr}
	movs r0, 0x20
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF646
	ldr r0, _081DF64C @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF646:
	pop {r0}
	bx r0
	.align 2, 0
_081DF64C: .4byte gRfuState
	thumb_func_end STWI_send_CP_PollingREQ

	thumb_func_start STWI_send_CP_EndREQ
STWI_send_CP_EndREQ: @ 81DF650
	push {lr}
	movs r0, 0x21
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF66A
	ldr r0, _081DF670 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF66A:
	pop {r0}
	bx r0
	.align 2, 0
_081DF670: .4byte gRfuState
	thumb_func_end STWI_send_CP_EndREQ

	thumb_func_start STWI_send_DataTxREQ
STWI_send_DataTxREQ: @ 81DF674
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r5, r4, 24
	movs r0, 0x24
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF6B2
	lsrs r2, r4, 26
	movs r0, 0x3
	ands r0, r5
	cmp r0, 0
	beq _081DF694
	adds r2, 0x1
_081DF694:
	ldr r1, _081DF6B8 @ =gRfuState
	ldr r0, [r1]
	strb r2, [r0, 0x4]
	ldr r0, [r1]
	ldr r1, [r0, 0x24]
	adds r1, 0x4
	ldrb r2, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 19
	orrs r2, r0
	adds r0, r6, 0
	bl CpuSet
	bl STWI_start_Command
_081DF6B2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DF6B8: .4byte gRfuState
	thumb_func_end STWI_send_DataTxREQ

	thumb_func_start STWI_send_DataTxAndChangeREQ
STWI_send_DataTxAndChangeREQ: @ 81DF6BC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r5, r4, 24
	movs r0, 0x25
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF6FA
	lsrs r2, r4, 26
	movs r0, 0x3
	ands r0, r5
	cmp r0, 0
	beq _081DF6DC
	adds r2, 0x1
_081DF6DC:
	ldr r1, _081DF700 @ =gRfuState
	ldr r0, [r1]
	strb r2, [r0, 0x4]
	ldr r0, [r1]
	ldr r1, [r0, 0x24]
	adds r1, 0x4
	ldrb r2, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 19
	orrs r2, r0
	adds r0, r6, 0
	bl CpuSet
	bl STWI_start_Command
_081DF6FA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DF700: .4byte gRfuState
	thumb_func_end STWI_send_DataTxAndChangeREQ

	thumb_func_start STWI_send_DataRxREQ
STWI_send_DataRxREQ: @ 81DF704
	push {lr}
	movs r0, 0x26
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF71E
	ldr r0, _081DF724 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF71E:
	pop {r0}
	bx r0
	.align 2, 0
_081DF724: .4byte gRfuState
	thumb_func_end STWI_send_DataRxREQ

	thumb_func_start STWI_send_MS_ChangeREQ
STWI_send_MS_ChangeREQ: @ 81DF728
	push {lr}
	movs r0, 0x27
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF742
	ldr r0, _081DF748 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF742:
	pop {r0}
	bx r0
	.align 2, 0
_081DF748: .4byte gRfuState
	thumb_func_end STWI_send_MS_ChangeREQ

	thumb_func_start STWI_send_DataReadyAndChangeREQ
STWI_send_DataReadyAndChangeREQ: @ 81DF74C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	movs r0, 0x28
	bl STWI_init
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _081DF792
	cmp r4, 0
	bne _081DF774
	ldr r0, _081DF770 @ =gRfuState
	ldr r0, [r0]
	strb r3, [r0, 0x4]
	b _081DF78E
	.align 2, 0
_081DF770: .4byte gRfuState
_081DF774:
	ldr r2, _081DF798 @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	ldr r0, [r0, 0x24]
	adds r0, 0x4
	strb r5, [r0]
	adds r0, 0x1
	strb r3, [r0]
	adds r0, 0x1
	strb r3, [r0]
	strb r3, [r0, 0x1]
_081DF78E:
	bl STWI_start_Command
_081DF792:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DF798: .4byte gRfuState
	thumb_func_end STWI_send_DataReadyAndChangeREQ

	thumb_func_start STWI_send_DisconnectedAndChangeREQ
STWI_send_DisconnectedAndChangeREQ: @ 81DF79C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x29
	bl STWI_init
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _081DF7D2
	ldr r2, _081DF7D8 @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	ldr r0, [r0, 0x24]
	adds r0, 0x4
	strb r4, [r0]
	adds r0, 0x1
	strb r5, [r0]
	adds r0, 0x1
	strb r3, [r0]
	strb r3, [r0, 0x1]
	bl STWI_start_Command
_081DF7D2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DF7D8: .4byte gRfuState
	thumb_func_end STWI_send_DisconnectedAndChangeREQ

	thumb_func_start STWI_send_ResumeRetransmitAndChangeREQ
STWI_send_ResumeRetransmitAndChangeREQ: @ 81DF7DC
	push {lr}
	movs r0, 0x37
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF7F6
	ldr r0, _081DF7FC @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF7F6:
	pop {r0}
	bx r0
	.align 2, 0
_081DF7FC: .4byte gRfuState
	thumb_func_end STWI_send_ResumeRetransmitAndChangeREQ

	thumb_func_start STWI_send_DisconnectREQ
STWI_send_DisconnectREQ: @ 81DF800
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x30
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF824
	ldr r2, _081DF82C @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	ldr r0, [r0, 0x24]
	str r4, [r0, 0x4]
	bl STWI_start_Command
_081DF824:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DF82C: .4byte gRfuState
	thumb_func_end STWI_send_DisconnectREQ

	thumb_func_start STWI_send_TestModeREQ
STWI_send_TestModeREQ: @ 81DF830
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r0, 0x31
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF85C
	ldr r2, _081DF864 @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldr r0, [r2]
	ldr r1, [r0, 0x24]
	lsls r0, r4, 8
	orrs r0, r5
	str r0, [r1, 0x4]
	bl STWI_start_Command
_081DF85C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DF864: .4byte gRfuState
	thumb_func_end STWI_send_TestModeREQ

	thumb_func_start STWI_send_CPR_StartREQ
STWI_send_CPR_StartREQ: @ 81DF868
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	movs r0, 0x32
	bl STWI_init
	lsls r0, 16
	cmp r0, 0
	bne _081DF89A
	ldr r2, _081DF8A0 @ =gRfuState
	ldr r1, [r2]
	movs r0, 0x2
	strb r0, [r1, 0x4]
	lsls r0, r5, 16
	orrs r0, r4
	ldr r1, [r2]
	ldr r1, [r1, 0x24]
	str r0, [r1, 0x4]
	str r6, [r1, 0x8]
	bl STWI_start_Command
_081DF89A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081DF8A0: .4byte gRfuState
	thumb_func_end STWI_send_CPR_StartREQ

	thumb_func_start STWI_send_CPR_PollingREQ
STWI_send_CPR_PollingREQ: @ 81DF8A4
	push {lr}
	movs r0, 0x33
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF8BE
	ldr r0, _081DF8C4 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF8BE:
	pop {r0}
	bx r0
	.align 2, 0
_081DF8C4: .4byte gRfuState
	thumb_func_end STWI_send_CPR_PollingREQ

	thumb_func_start STWI_send_CPR_EndREQ
STWI_send_CPR_EndREQ: @ 81DF8C8
	push {lr}
	movs r0, 0x34
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF8E2
	ldr r0, _081DF8E8 @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF8E2:
	pop {r0}
	bx r0
	.align 2, 0
_081DF8E8: .4byte gRfuState
	thumb_func_end STWI_send_CPR_EndREQ

	thumb_func_start STWI_send_StopModeREQ
STWI_send_StopModeREQ: @ 81DF8EC
	push {lr}
	movs r0, 0x3D
	bl STWI_init
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081DF906
	ldr r0, _081DF90C @ =gRfuState
	ldr r0, [r0]
	strb r1, [r0, 0x4]
	bl STWI_start_Command
_081DF906:
	pop {r0}
	bx r0
	.align 2, 0
_081DF90C: .4byte gRfuState
	thumb_func_end STWI_send_StopModeREQ

	thumb_func_start STWI_intr_timer
STWI_intr_timer: @ 81DF910
	push {r4,lr}
	ldr r4, _081DF928 @ =gRfuState
	ldr r1, [r4]
	ldr r0, [r1, 0xC]
	cmp r0, 0x2
	beq _081DF936
	cmp r0, 0x2
	bhi _081DF92C
	cmp r0, 0x1
	beq _081DF944
	b _081DF96C
	.align 2, 0
_081DF928: .4byte gRfuState
_081DF92C:
	cmp r0, 0x3
	beq _081DF94E
	cmp r0, 0x4
	beq _081DF944
	b _081DF96C
_081DF936:
	ldrb r0, [r1, 0x10]
	movs r0, 0x1
	strb r0, [r1, 0x10]
	movs r0, 0x32
	bl STWI_set_timer
	b _081DF96C
_081DF944:
	bl STWI_stop_timer
	bl STWI_restart_Command
	b _081DF96C
_081DF94E:
	ldrb r0, [r1, 0x10]
	movs r0, 0x1
	strb r0, [r1, 0x10]
	bl STWI_stop_timer
	bl STWI_reset_ClockCounter
	ldr r0, [r4]
	ldr r2, [r0, 0x18]
	cmp r2, 0
	beq _081DF96C
	movs r0, 0xFF
	movs r1, 0
	bl _call_via_r2
_081DF96C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end STWI_intr_timer

	thumb_func_start STWI_set_timer
STWI_set_timer: @ 81DF974
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	ldr r2, _081DF9A4 @ =gRfuState
	ldr r0, [r2]
	ldrb r0, [r0, 0xA]
	lsls r0, 2
	ldr r1, _081DF9A8 @ =0x04000100
	adds r4, r0, r1
	adds r1, 0x2
	adds r7, r0, r1
	ldr r1, _081DF9AC @ =0x04000208
	movs r0, 0
	strh r0, [r1]
	adds r6, r2, 0
	cmp r3, 0x50
	beq _081DF9CC
	cmp r3, 0x50
	bgt _081DF9B0
	cmp r3, 0x32
	beq _081DF9BA
	b _081DF9F8
	.align 2, 0
_081DF9A4: .4byte gRfuState
_081DF9A8: .4byte 0x04000100
_081DF9AC: .4byte 0x04000208
_081DF9B0:
	cmp r5, 0x64
	beq _081DF9DC
	cmp r5, 0x82
	beq _081DF9EC
	b _081DF9F8
_081DF9BA:
	ldr r1, _081DF9C8 @ =0x0000fccb
	adds r0, r1, 0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, 0x1
	b _081DF9F6
	.align 2, 0
_081DF9C8: .4byte 0x0000fccb
_081DF9CC:
	ldr r1, _081DF9D8 @ =0x0000fae0
	adds r0, r1, 0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, 0x2
	b _081DF9F6
	.align 2, 0
_081DF9D8: .4byte 0x0000fae0
_081DF9DC:
	ldr r1, _081DF9E8 @ =0x0000f996
	adds r0, r1, 0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, 0x3
	b _081DF9F6
	.align 2, 0
_081DF9E8: .4byte 0x0000f996
_081DF9EC:
	ldr r1, _081DFA14 @ =0x0000f7ad
	adds r0, r1, 0
	strh r0, [r4]
	ldr r1, [r6]
	movs r0, 0x4
_081DF9F6:
	str r0, [r1, 0xC]
_081DF9F8:
	movs r0, 0xC3
	strh r0, [r7]
	ldr r2, _081DFA18 @ =0x04000202
	ldr r1, [r6]
	movs r0, 0x8
	ldrb r1, [r1, 0xA]
	lsls r0, r1
	strh r0, [r2]
	ldr r1, _081DFA1C @ =0x04000208
	movs r0, 0x1
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081DFA14: .4byte 0x0000f7ad
_081DFA18: .4byte 0x04000202
_081DFA1C: .4byte 0x04000208
	thumb_func_end STWI_set_timer

	thumb_func_start STWI_stop_timer
STWI_stop_timer: @ 81DFA20
	ldr r2, _081DFA40 @ =gRfuState
	ldr r0, [r2]
	movs r1, 0
	str r1, [r0, 0xC]
	ldrb r0, [r0, 0xA]
	lsls r0, 2
	ldr r3, _081DFA44 @ =0x04000100
	adds r0, r3
	strh r1, [r0]
	ldr r0, [r2]
	ldrb r0, [r0, 0xA]
	lsls r0, 2
	ldr r2, _081DFA48 @ =0x04000102
	adds r0, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_081DFA40: .4byte gRfuState
_081DFA44: .4byte 0x04000100
_081DFA48: .4byte 0x04000102
	thumb_func_end STWI_stop_timer

	thumb_func_start STWI_init
STWI_init: @ 81DFA4C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	ldr r0, _081DFA78 @ =0x04000208
	ldrh r0, [r0]
	cmp r0, 0
	bne _081DFA80
	ldr r0, _081DFA7C @ =gRfuState
	ldr r1, [r0]
	ldrh r0, [r1, 0x12]
	movs r0, 0x6
	strh r0, [r1, 0x12]
	ldr r2, [r1, 0x18]
	cmp r2, 0
	beq _081DFACA
	ldrh r1, [r1, 0x12]
	adds r0, r5, 0
	bl _call_via_r2
	b _081DFACA
	.align 2, 0
_081DFA78: .4byte 0x04000208
_081DFA7C: .4byte gRfuState
_081DFA80:
	ldr r4, _081DFAAC @ =gRfuState
	ldr r2, [r4]
	adds r3, r2, 0
	adds r3, 0x2C
	ldrb r0, [r3]
	cmp r0, 0x1
	bne _081DFAB0
	ldrh r0, [r2, 0x12]
	movs r1, 0
	movs r0, 0x2
	strh r0, [r2, 0x12]
	ldrb r0, [r3]
	strb r1, [r3]
	ldr r0, [r4]
	ldr r2, [r0, 0x18]
	cmp r2, 0
	beq _081DFACA
	ldrh r1, [r0, 0x12]
	adds r0, r5, 0
	bl _call_via_r2
	b _081DFACA
	.align 2, 0
_081DFAAC: .4byte gRfuState
_081DFAB0:
	ldrb r0, [r2, 0x14]
	cmp r0, 0
	bne _081DFACE
	ldrh r0, [r2, 0x12]
	movs r0, 0x4
	strh r0, [r2, 0x12]
	ldr r3, [r2, 0x18]
	cmp r3, 0
	beq _081DFACA
	ldrh r1, [r2, 0x12]
	adds r0, r5, 0
	bl _call_via_r3
_081DFACA:
	movs r0, 0x1
	b _081DFB16
_081DFACE:
	ldrb r0, [r3]
	movs r1, 0
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, [r4]
	strb r6, [r0, 0x6]
	ldr r0, [r4]
	str r1, [r0]
	strb r1, [r0, 0x4]
	ldr r0, [r4]
	strb r1, [r0, 0x5]
	ldr r0, [r4]
	strb r1, [r0, 0x7]
	ldr r0, [r4]
	strb r1, [r0, 0x8]
	ldr r0, [r4]
	strb r1, [r0, 0x9]
	ldr r0, [r4]
	str r1, [r0, 0xC]
	ldrb r2, [r0, 0x10]
	strb r1, [r0, 0x10]
	ldr r0, [r4]
	ldrh r2, [r0, 0x12]
	movs r2, 0
	strh r1, [r0, 0x12]
	strb r2, [r0, 0x15]
	ldr r1, _081DFB1C @ =0x04000134
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	ldr r2, _081DFB20 @ =0x00005003
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
_081DFB16:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081DFB1C: .4byte 0x04000134
_081DFB20: .4byte 0x00005003
	thumb_func_end STWI_init

	thumb_func_start STWI_start_Command
STWI_start_Command: @ 81DFB24
	push {r4,r5,lr}
	ldr r5, _081DFB7C @ =gRfuState
	ldr r0, [r5]
	ldr r3, [r0, 0x24]
	ldrb r1, [r0, 0x4]
	lsls r1, 8
	ldrb r0, [r0, 0x6]
	ldr r2, _081DFB80 @ =0x99660000
	orrs r0, r2
	orrs r1, r0
	str r1, [r3]
	ldr r2, _081DFB84 @ =0x04000120
	ldr r1, [r5]
	ldr r0, [r1, 0x24]
	ldr r0, [r0]
	str r0, [r2]
	movs r2, 0
	str r2, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x5]
	ldr r4, _081DFB88 @ =0x04000208
	ldrh r3, [r4]
	strh r2, [r4]
	ldr r2, _081DFB8C @ =0x04000200
	ldr r1, [r5]
	movs r0, 0x8
	ldrb r1, [r1, 0xA]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r2]
	strh r3, [r4]
	ldr r1, _081DFB90 @ =0x04000128
	ldr r2, _081DFB94 @ =0x00005083
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081DFB7C: .4byte gRfuState
_081DFB80: .4byte 0x99660000
_081DFB84: .4byte 0x04000120
_081DFB88: .4byte 0x04000208
_081DFB8C: .4byte 0x04000200
_081DFB90: .4byte 0x04000128
_081DFB94: .4byte 0x00005083
	thumb_func_end STWI_start_Command

	thumb_func_start STWI_restart_Command
STWI_restart_Command: @ 81DFB98
	push {r4,lr}
	ldr r4, _081DFBB0 @ =gRfuState
	ldr r2, [r4]
	ldrb r0, [r2, 0x15]
	adds r3, r4, 0
	cmp r0, 0x1
	bhi _081DFBB4
	adds r0, 0x1
	strb r0, [r2, 0x15]
	bl STWI_start_Command
	b _081DFC0E
	.align 2, 0
_081DFBB0: .4byte gRfuState
_081DFBB4:
	ldrb r0, [r2, 0x6]
	cmp r0, 0x27
	beq _081DFBC6
	cmp r0, 0x25
	beq _081DFBC6
	cmp r0, 0x35
	beq _081DFBC6
	cmp r0, 0x37
	bne _081DFBE8
_081DFBC6:
	ldr r0, [r3]
	ldrh r1, [r0, 0x12]
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x12]
	adds r0, 0x2C
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r1, [r3]
	ldr r2, [r1, 0x18]
	cmp r2, 0
	beq _081DFC0E
	ldrb r0, [r1, 0x6]
	ldrh r1, [r1, 0x12]
	bl _call_via_r2
	b _081DFC0E
_081DFBE8:
	ldrh r0, [r2, 0x12]
	movs r1, 0
	movs r0, 0x1
	strh r0, [r2, 0x12]
	adds r0, r2, 0
	adds r0, 0x2C
	ldrb r2, [r0]
	strb r1, [r0]
	ldr r1, [r4]
	ldr r2, [r1, 0x18]
	cmp r2, 0
	beq _081DFC08
	ldrb r0, [r1, 0x6]
	ldrh r1, [r1, 0x12]
	bl _call_via_r2
_081DFC08:
	ldr r1, [r4]
	movs r0, 0x4
	str r0, [r1]
_081DFC0E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end STWI_restart_Command

	thumb_func_start STWI_reset_ClockCounter
STWI_reset_ClockCounter: @ 81DFC18
	ldr r3, _081DFC44 @ =gRfuState
	ldr r1, [r3]
	movs r0, 0x5
	str r0, [r1]
	movs r2, 0
	strb r2, [r1, 0x4]
	ldr r0, [r3]
	strb r2, [r0, 0x5]
	ldr r1, _081DFC48 @ =0x04000120
	movs r0, 0x80
	lsls r0, 24
	str r0, [r1]
	adds r1, 0x8
	strh r2, [r1]
	ldr r2, _081DFC4C @ =0x00005003
	adds r0, r2, 0
	strh r0, [r1]
	adds r2, 0x7F
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	bx lr
	.align 2, 0
_081DFC44: .4byte gRfuState
_081DFC48: .4byte 0x04000120
_081DFC4C: .4byte 0x00005003
	thumb_func_end STWI_reset_ClockCounter

	arm_func_start IntrSIO32
IntrSIO32: @ 81DFC50
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	ldr r3, _081DFCB0 @ =gRfuState
	ldr r0, [r3]
	ldr r2, [r0]
	sub r11, r12, 0x4
	cmp r2, 0xA
	bne _081DFC8C
	ldr r0, [r0, 0x20]
	cmp r0, 0
	ldmdbeq r11, {r11,sp,lr}
	bxeq lr
	bl sub_81E05AC
	ldmdb r11, {r11,sp,lr}
	bx lr
_081DFC8C:
	ldrb r3, [r0, 0x14]
	cmp r3, 0x1
	bne _081DFCA4
	bl sio32intr_clock_master
	ldmdb r11, {r11,sp,lr}
	bx lr
_081DFCA4:
	bl sio32intr_clock_slave
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081DFCB0: .4byte gRfuState
	arm_func_end IntrSIO32

	arm_func_start sio32intr_clock_master
sio32intr_clock_master: @ 81DFCB4
	mov r12, sp
	stmdb sp!, {r4-r6,r11,r12,lr,pc}
	mov r0, 0x50
	sub r11, r12, 0x4
	bl STWI_set_timer_in_RAM
	mov r4, 0x120
	ldr r2, _081DFF28 @ =gRfuState
	add r4, r4, 0x4000000
	ldr lr, [r4]
	ldr r12, [r2]
	ldr r3, [r12]
	mov r6, r2
	cmp r3, 0
	bne _081DFD34
	cmp lr, 0x80000000
	bne _081DFDB4
	ldrb r2, [r12, 0x5]
	ldrb r3, [r12, 0x4]
	cmp r2, r3
	bhi _081DFD24
	ldr r3, [r12, 0x24]
	mov r1, r2
	ldr r2, [r3, r1, lsl 2]
	str r2, [r4]
	ldrb r3, [r12, 0x5]
	add r3, r3, 0x1
	strb r3, [r12, 0x5]
	b _081DFE10
_081DFD24:
	mov r3, 0x1
	str r3, [r12]
	str lr, [r4]
	b _081DFE10
_081DFD34:
	ldr r3, [r12]
	cmp r3, 0x1
	bne _081DFDC4
	mov r3, 0x99000000
	add r3, r3, 0x660000
	mov r5, 0x80000000
	and r2, lr, r5, asr 15
	cmp r2, r3
	bne _081DFDB4
	mov r3, 0
	strb r3, [r12, 0x8]
	ldr r1, [r6]
	ldrb r0, [r1, 0x8]
	ldr r2, [r1, 0x28]
	str lr, [r2, r0, lsl 2]
	ldrb r3, [r1, 0x8]
	add r3, r3, 0x1
	strb r3, [r1, 0x8]
	ldr r2, [r6]
	strb lr, [r2, 0x9]
	ldr r3, [r6]
	mov r2, lr, lsr 8
	strb r2, [r3, 0x7]
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	ldrb r3, [r1, 0x8]
	cmp r2, r3
	bcc _081DFDFC
	mov r3, 0x2
	str r3, [r1]
	str r5, [r4]
	b _081DFE10
_081DFDB4:
	bl STWI_stop_timer_in_RAM
	mov r0, 0x82
	bl STWI_set_timer_in_RAM
	b _081DFF3C
_081DFDC4:
	ldr r3, [r12]
	cmp r3, 0x2
	bne _081DFE10
	ldrb r1, [r12, 0x8]
	ldr r2, [r12, 0x28]
	str lr, [r2, r1, lsl 2]
	ldrb r3, [r12, 0x8]
	add r3, r3, 0x1
	strb r3, [r12, 0x8]
	ldr r1, [r6]
	ldrb r2, [r1, 0x7]
	ldrb r3, [r1, 0x8]
	cmp r2, r3
	bcs _081DFE08
_081DFDFC:
	mov r3, 0x3
	str r3, [r1]
	b _081DFE10
_081DFE08:
	mov r3, 0x80000000
	str r3, [r4]
_081DFE10:
	mov r0, 0x1
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	beq _081DFF3C
	mov r4, 0x128
	add r4, r4, 0x4000000
	mov r5, 0x5000
	add r3, r5, 0xB
	strh r3, [r4]
	mov r0, 0
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	beq _081DFF3C
	bl STWI_stop_timer_in_RAM
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, 0x3
	bne _081DFF2C
	ldrb r3, [r1, 0x9]
	cmp r3, 0xA5
	cmpne r3, 0xA7
	beq _081DFE84
	and r3, r3, 0xFF
	cmp r3, 0xB5
	beq _081DFE84
	cmp r3, 0xB7
	bne _081DFECC
_081DFE84:
	mov r1, 0x120
	add r1, r1, 0x4000000
	mov r12, 0x128
	add r12, r12, 0x4000000
	ldr r0, [r6]
	mov r3, 0
	strb r3, [r0, 0x14]
	mov r2, 0x80000000
	str r2, [r1]
	add r3, r3, 0x5000
	add r2, r3, 0x2
	strh r2, [r12]
	add r3, r3, 0x82
	strh r3, [r12]
	ldr r2, [r6]
	mov r3, 0x5
	str r3, [r2]
	b _081DFEFC
_081DFECC:
	cmp r3, 0xEE
	bne _081DFEEC
	add r3, r5, 0x3
	strh r3, [r4]
	mov r2, 0x4
	str r2, [r1]
	strh r0, [r1, 0x12]
	b _081DFEFC
_081DFEEC:
	add r3, r5, 0x3
	strh r3, [r4]
	mov r2, 0x4
	str r2, [r1]
_081DFEFC:
	ldr r2, [r6]
	mov r3, 0
	strb r3, [r2, 0x2C]
	ldr r0, [r6]
	ldr r2, [r0, 0x18]
	cmp r2, r3
	beq _081DFF3C
	ldrh r1, [r0, 0x12]
	ldrb r0, [r0, 0x6]
	bl sub_81E05A4
	b _081DFF3C
	.align 2, 0
_081DFF28: .4byte gRfuState
_081DFF2C:
	add r3, r5, 0x3
	strh r3, [r4]
	add r2, r5, 0x83
	strh r2, [r4]
_081DFF3C:
	ldmdb r11, {r4-r6,r11,sp,lr}
	bx lr
	arm_func_end sio32intr_clock_master

	arm_func_start sio32intr_clock_slave
sio32intr_clock_slave: @ 81DFF44
	mov r12, sp
	stmdb sp!, {r4-r6,r11,r12,lr,pc}
	ldr r4, _081E02F0 @ =gRfuState
	mov r0, 0x64
	ldr r3, [r4]
	mov r6, 0
	strb r6, [r3, 0x10]
	sub r11, r12, 0x4
	bl STWI_set_timer_in_RAM
	mov r0, r6
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	mov r5, r4
	beq _081E0348
	mov r3, 0x128
	add r3, r3, 0x4000000
	mov r2, 0x5000
	add r2, r2, 0xA
	strh r2, [r3]
	mov lr, 0x120
	ldr r0, [r5]
	add lr, lr, 0x4000000
	ldr r12, [lr]
	ldr r3, [r0]
	cmp r3, 0x5
	bne _081E0074
	ldr r3, [r0, 0x28]
	mov r4, 0x1
	mov r0, 0x99000000
	str r12, [r3]
	add r0, r0, 0x660000
	ldr r2, [r5]
	mov r3, r0, lsr 16
	strb r4, [r2, 0x5]
	cmp r3, r12, lsr 16
	bne _081E01C0
	ldr r3, [r5]
	mov r2, r12, lsr 8
	strb r2, [r3, 0x4]
	ldr r2, [r5]
	strb r12, [r2, 0x6]
	ldr r1, [r5]
	ldrb r3, [r1, 0x4]
	cmp r3, r6
	bne _081E0058
	ldrb r2, [r1, 0x6]
	sub r3, r2, 0x27
	cmp r2, 0x36
	cmpne r3, 0x2
	bhi _081E002C
	add r3, r2, 0x80
	strb r3, [r1, 0x9]
	ldr r2, [r5]
	ldrb r3, [r2, 0x9]
	ldr r1, [r2, 0x24]
	add r3, r3, r0
	b _081E00DC
_081E002C:
	ldr r2, [r1, 0x24]
	ldr r3, _081E02F4 @ =0x996601ee
	str r3, [r2]
	ldr r2, [r5]
	ldrb r3, [r2, 0x6]
	sub r3, r3, 0x10
	cmp r3, 0x2D
	bhi _081E0114
	ldr r3, [r2, 0x24]
	str r4, [r3, 0x4]
	b _081E0120
_081E0058:
	mov r3, 0x80000000
	str r3, [lr]
	strb r4, [r1, 0x5]
	ldr r2, [r5]
	add r3, r3, 0x80000006
	str r3, [r2]
	b _081E01D0
_081E0074:
	ldr r3, [r0]
	cmp r3, 0x6
	bne _081E0174
	ldrb r1, [r0, 0x5]
	ldr r2, [r0, 0x28]
	str r12, [r2, r1, lsl 2]
	ldrb r3, [r0, 0x5]
	add r3, r3, 0x1
	strb r3, [r0, 0x5]
	ldr r1, [r5]
	ldrb r2, [r1, 0x4]
	ldrb r3, [r1, 0x5]
	cmp r2, r3
	bcs _081E0168
	ldrb r2, [r1, 0x6]
	sub r3, r2, 0x28
	cmp r2, 0x36
	cmpne r3, 0x1
	bhi _081E00EC
	add r3, r2, 0x80
	strb r3, [r1, 0x9]
	ldr r2, [r5]
	ldrb r3, [r2, 0x9]
	ldr r1, [r2, 0x24]
	orr r3, r3, 0x99000000
	orr r3, r3, 0x660000
_081E00DC:
	str r3, [r1]
	ldr r2, [r5]
	strb r6, [r2, 0x7]
	b _081E0138
_081E00EC:
	ldr r2, [r1, 0x24]
	ldr r3, _081E02F4 @ =0x996601ee
	str r3, [r2]
	ldr r2, [r5]
	ldrb r3, [r2, 0x6]
	sub r3, r3, 0x10
	cmp r3, 0x2D
	ldrls r2, [r2, 0x24]
	movls r3, 0x1
	bls _081E011C
_081E0114:
	ldr r2, [r2, 0x24]
	mov r3, 0x2
_081E011C:
	str r3, [r2, 0x4]
_081E0120:
	ldr r2, [r5]
	mov r3, 0x1
	strb r3, [r2, 0x7]
	ldr r1, [r5]
	add r3, r3, 0x2
	strh r3, [r1, 0x12]
_081E0138:
	ldr r0, [r5]
	ldr r2, [r0, 0x24]
	mov r3, 0x120
	ldr r1, [r2]
	add r3, r3, 0x4000000
	str r1, [r3]
	mov r2, 0x1
	strb r2, [r0, 0x8]
	ldr r1, [r5]
	mov r3, 0x7
	str r3, [r1]
	b _081E01D0
_081E0168:
	mov r3, 0x80000000
	str r3, [lr]
	b _081E01D0
_081E0174:
	ldr r3, [r0]
	cmp r3, 0x7
	bne _081E01D0
	cmp r12, 0x80000000
	bne _081E01C0
	ldrb r2, [r0, 0x7]
	ldrb r3, [r0, 0x8]
	cmp r2, r3
	movcc r3, 0x8
	strcc r3, [r0]
	bcc _081E01D0
	ldrb r1, [r0, 0x8]
	ldr r3, [r0, 0x24]
	ldr r2, [r3, r1, lsl 2]
	str r2, [lr]
	ldrb r3, [r0, 0x8]
	add r3, r3, 0x1
	strb r3, [r0, 0x8]
	b _081E01D0
_081E01C0:
	bl STWI_stop_timer_in_RAM
	mov r0, 0x64
	bl STWI_set_timer_in_RAM
	b _081E0348
_081E01D0:
	mov r0, 0x1
	bl handshake_wait
	mov r0, r0, lsl 16
	cmp r0, 0x10000
	beq _081E0348
	mov r6, r5
	ldr r3, [r6]
	ldr r2, [r3]
	cmp r2, 0x8
	bne _081E0298
	mov r4, 0x128
	add r4, r4, 0x4000000
	mov r3, 0x5000
	add r3, r3, 0x2
	strh r3, [r4]
	bl STWI_stop_timer_in_RAM
	ldr r0, [r6]
	ldrh r3, [r0, 0x12]
	cmp r3, 0x3
	bne _081E0244
	bl STWI_init_slave
	ldr r3, [r6]
	ldr r1, [r3, 0x1C]
	cmp r1, 0
	beq _081E0348
	mov r0, 0x1EC
	add r0, r0, 0x2
	bl sub_81E05A8
	b _081E0348
_081E0244:
	mov r3, 0x120
	add r3, r3, 0x4000000
	mov r1, 0
	str r1, [r3]
	mov r2, 0x5000
	strh r1, [r4]
	add r2, r2, 0x3
	strh r2, [r4]
	mov r3, 0x1
	strb r3, [r0, 0x14]
	ldr r0, [r5]
	ldr r2, [r0, 0x1C]
	str r1, [r0]
	cmp r2, r1
	beq _081E0348
	ldrb r3, [r0, 0x4]
	ldrb r0, [r0, 0x6]
	mov r1, r2
	orr r0, r0, r3, lsl 8
	bl sub_81E05A8
	b _081E0348
_081E0298:
	mov r3, 0x208
	add r3, r3, 0x4000000
	mov r2, 0
	strh r2, [r3]
	mov r1, 0x100
	add r2, r1, 0x4000002
	ldrh r3, [r2]
	tst r3, 0x80
	beq _081E031C
	ldrh r3, [r2]
	tst r3, 0x3
	bne _081E02F8
	mov r2, 0xFF00
	add r1, r1, 0x4000000
	ldrh r3, [r1]
	add r2, r2, 0x9B
	cmp r3, r2
	bls _081E031C
_081E02E0:
	ldrh r3, [r1]
	cmp r3, r2
	bhi _081E02E0
	b _081E031C
	.align 2, 0
_081E02F0: .4byte gRfuState
_081E02F4: .4byte 0x996601ee
_081E02F8:
	mov r2, 0xFF00
	add r1, r1, 0x4000000
	ldrh r3, [r1]
	add r2, r2, 0xFE
	cmp r3, r2
	bls _081E031C
_081E0310:
	ldrh r3, [r1]
	cmp r3, r2
	bhi _081E0310
_081E031C:
	mov r1, 0x128
	add r1, r1, 0x4000000
	mov r0, 0x208
	add r0, r0, 0x4000000
	mov r3, 0x5000
	add r2, r3, 0x2
	strh r2, [r1]
	add r3, r3, 0x82
	strh r3, [r1]
	mov r2, 0x1
	strh r2, [r0]
_081E0348:
	ldmdb r11, {r4-r6,r11,sp,lr}
	bx lr
	arm_func_end sio32intr_clock_slave

	arm_func_start handshake_wait
handshake_wait: @ 81E0350
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	mov r1, 0x128
	add r1, r1, 0x4000000
	mov r0, r0, lsl 16
	ldr r2, _081E03B4 @ =gRfuState
	sub r11, r12, 0x4
	mov lr, r0, lsr 14
	ldr r12, [r2]
_081E0374:
	ldrb r3, [r12, 0x10]
	and r0, r3, 0xFF
	cmp r0, 0x1
	beq _081E03A0
	ldrh r3, [r1]
	and r3, r3, 0x4
	cmp r3, lr
	bne _081E0374
	mov r0, 0
	ldmdb r11, {r11,sp,lr}
	bx lr
_081E03A0:
	ldr r2, [r2]
	mov r3, 0
	strb r3, [r2, 0x10]
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081E03B4: .4byte gRfuState
	arm_func_end handshake_wait

	arm_func_start STWI_set_timer_in_RAM
STWI_set_timer_in_RAM: @ 81E03B8
	mov r12, sp
	stmdb sp!, {r4,r5,r11,r12,lr,pc}
	mov r1, 0x208
	add r1, r1, 0x4000000
	mov r3, 0
	sub r11, r12, 0x4
	ldr r12, _081E0470 @ =gRfuState
	and lr, r0, 0xFF
	ldr r2, [r12]
	cmp lr, 0x50
	ldrb r0, [r2, 0xA]
	mov r4, r12
	mov r2, lr
	strh r3, [r1]
	mov r0, r0, lsl 2
	add r3, r3, 0x100
	add r1, r3, 0x4000000
	add r3, r3, 0x4000002
	add r5, r0, r3
	beq _081E0440
	bgt _081E0418
	cmp lr, 0x32
	beq _081E042C
	b _081E048C
_081E0418:
	cmp r2, 0x64
	beq _081E0458
	cmp r2, 0x82
	beq _081E0474
	b _081E048C
_081E042C:
	mvn r3, 0x334
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x1
	b _081E0488
_081E0440:
	mov r3, 0xAE000000
	mov r3, r3, asr 20
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x2
	b _081E0488
_081E0458:
	mvn r3, 0x660
	sub r3, r3, 0x9
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x3
	b _081E0488
	.align 2, 0
_081E0470: .4byte gRfuState
_081E0474:
	mvn r3, 0x850
	sub r3, r3, 0x2
	strh r3, [r0, r1]
	ldr r2, [r4]
	mov r3, 0x4
_081E0488:
	str r3, [r2, 0xC]
_081E048C:
	mov r12, 0x200
	add r12, r12, 0x4000002
	mov r3, 0xC3
	strh r3, [r5]
	mov r1, 0x208
	ldr r2, [r4]
	add r1, r1, 0x4000000
	ldrb r0, [r2, 0xA]
	sub r3, r3, 0xBB
	mov r3, r3, lsl r0
	strh r3, [r12]
	mov r2, 0x1
	strh r2, [r1]
	ldmdb r11, {r4,r5,r11,sp,lr}
	bx lr
	arm_func_end STWI_set_timer_in_RAM

	arm_func_start STWI_stop_timer_in_RAM
STWI_stop_timer_in_RAM: @ 81E04C8
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	mov r1, 0x100
	ldr lr, _081E0514 @ =gRfuState
	add r0, r1, 0x4000000
	ldr r2, [lr]
	sub r11, r12, 0x4
	ldrb r3, [r2, 0xA]
	mov r12, 0
	str r12, [r2, 0xC]
	mov r3, r3, lsl 2
	strh r12, [r3, r0]
	ldr r2, [lr]
	ldrb r3, [r2, 0xA]
	add r1, r1, 0x4000002
	mov r3, r3, lsl 2
	strh r12, [r3, r1]
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081E0514: .4byte gRfuState
	arm_func_end STWI_stop_timer_in_RAM

	arm_func_start STWI_init_slave
STWI_init_slave: @ 81E0518
	mov r12, sp
	stmdb sp!, {r11,r12,lr,pc}
	ldr r0, _081E05A0 @ =gRfuState
	ldr r2, [r0]
	mov r3, 0x5
	str r3, [r2]
	mov r1, 0
	strb r1, [r2, 0x14]
	ldr r3, [r0]
	strb r1, [r3, 0x4]
	ldr r2, [r0]
	strb r1, [r2, 0x5]
	ldr r3, [r0]
	strb r1, [r3, 0x6]
	ldr r2, [r0]
	strb r1, [r2, 0x7]
	ldr r3, [r0]
	strb r1, [r3, 0x8]
	ldr r2, [r0]
	strb r1, [r2, 0x9]
	ldr r3, [r0]
	str r1, [r3, 0xC]
	sub r11, r12, 0x4
	strb r1, [r3, 0x10]
	mov r2, 0x128
	ldr r12, [r0]
	add r2, r2, 0x4000000
	strh r1, [r12, 0x12]
	mov r3, 0x5000
	strb r1, [r12, 0x15]
	add r3, r3, 0x82
	strh r3, [r2]
	ldmdb r11, {r11,sp,lr}
	bx lr
	.align 2, 0
_081E05A0: .4byte gRfuState
	arm_func_end STWI_init_slave

	arm_func_start sub_81E05A4
sub_81E05A4: @ 81E05A4
	bx r2
	arm_func_end sub_81E05A4

	arm_func_start sub_81E05A8
sub_81E05A8: @ 81E05A8
	bx r1
	arm_func_end sub_81E05A8

	arm_func_start sub_81E05AC
sub_81E05AC: @ 81E05AC
	bx r0
	arm_func_end sub_81E05AC

	thumb_func_start sub_81E05B0
sub_81E05B0: @ 81E05B0
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r2
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r3, 24
	lsrs r7, r3, 24
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r4
	movs r1, 0x80
	lsls r1, 18
	cmp r0, r1
	bne _081E05D0
	cmp r7, 0
	bne _081E05D8
_081E05D0:
	movs r0, 0x3
	ands r0, r4
	cmp r0, 0
	beq _081E05DC
_081E05D8:
	movs r0, 0x2
	b _081E06C6
_081E05DC:
	cmp r7, 0
	beq _081E05E8
	ldr r3, _081E05E4 @ =0x00000e64
	b _081E05EA
	.align 2, 0
_081E05E4: .4byte 0x00000e64
_081E05E8:
	ldr r3, _081E05F4 @ =0x00000504
_081E05EA:
	cmp r2, r3
	bcs _081E05F8
	movs r0, 0x1
	b _081E06C6
	.align 2, 0
_081E05F4: .4byte 0x00000504
_081E05F8:
	ldr r0, _081E06CC @ =gUnknown_3007460
	str r4, [r0]
	ldr r1, _081E06D0 @ =gUnknown_3007464
	adds r0, r4, 0
	adds r0, 0xB4
	str r0, [r1]
	ldr r1, _081E06D4 @ =gUnknown_3007468
	adds r0, 0x28
	str r0, [r1]
	ldr r2, _081E06D8 @ =gUnknown_3007450
	movs r1, 0xDE
	lsls r1, 1
	adds r0, r4, r1
	str r0, [r2]
	ldr r1, _081E06DC @ =gUnknown_3007440
	movs r3, 0xDF
	lsls r3, 2
	adds r0, r4, r3
	str r0, [r1]
	movs r5, 0x1
	adds r6, r2, 0
	adds r4, r1, 0
_081E0624:
	lsls r2, r5, 2
	adds r3, r2, r6
	subs r1, r5, 0x1
	lsls r1, 2
	adds r0, r1, r6
	ldr r0, [r0]
	adds r0, 0x70
	str r0, [r3]
	adds r2, r4
	adds r1, r4
	ldr r0, [r1]
	adds r0, 0x1C
	str r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _081E0624
	ldr r0, _081E06D4 @ =gUnknown_3007468
	ldr r1, [r0]
	adds r1, 0xDC
	ldr r4, _081E06DC @ =gUnknown_3007440
	ldr r0, [r4, 0xC]
	adds r0, 0x1C
	str r0, [r1]
	mov r1, r12
	adds r2, r7, 0
	bl STWI_init_all
	bl rfu_STC_clearAPIVariables
	movs r5, 0
	ldr r3, _081E06D8 @ =gUnknown_3007450
	movs r2, 0
_081E0668:
	lsls r1, r5, 2
	adds r0, r1, r3
	ldr r0, [r0]
	str r2, [r0, 0x68]
	str r2, [r0, 0x6C]
	adds r1, r4
	ldr r0, [r1]
	str r2, [r0, 0x14]
	str r2, [r0, 0x18]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _081E0668
	ldr r1, _081E06E0 @ =0x081E1B25
	movs r5, 0x2
	negs r5, r5
	ands r5, r1
	ldr r2, _081E06D4 @ =gUnknown_3007468
	ldr r0, [r2]
	adds r4, r0, 0
	adds r4, 0x8
	ldr r0, _081E06E4 @ =0x081E1B55
	subs r0, r1
	lsls r0, 15
	lsrs r3, r0, 16
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _081E06E8 @ =0x0000ffff
	cmp r3, r0
	beq _081E06BC
	adds r6, r0, 0
_081E06AA:
	ldrh r0, [r5]
	strh r0, [r4]
	adds r5, 0x2
	adds r4, 0x2
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r6
	bne _081E06AA
_081E06BC:
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x9
	str r0, [r1, 0x4]
	movs r0, 0
_081E06C6:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E06CC: .4byte gUnknown_3007460
_081E06D0: .4byte gUnknown_3007464
_081E06D4: .4byte gUnknown_3007468
_081E06D8: .4byte gUnknown_3007450
_081E06DC: .4byte gUnknown_3007440
_081E06E0: .4byte 0x081E1B25
_081E06E4: .4byte 0x081E1B55
_081E06E8: .4byte 0x0000ffff
	thumb_func_end sub_81E05B0

	thumb_func_start rfu_STC_clearAPIVariables
rfu_STC_clearAPIVariables: @ 81E06EC
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _081E0760 @ =0x04000208
	ldrh r0, [r1]
	adds r7, r0, 0
	movs r6, 0
	strh r6, [r1]
	ldr r5, _081E0764 @ =gUnknown_3007464
	ldr r1, [r5]
	ldrb r4, [r1]
	mov r0, sp
	strh r6, [r0]
	ldr r2, _081E0768 @ =0x01000014
	bl CpuSet
	ldr r2, [r5]
	movs r0, 0x8
	ands r4, r0
	movs r1, 0
	strb r4, [r2]
	mov r0, sp
	adds r0, 0x2
	strh r1, [r0]
	ldr r4, _081E076C @ =gUnknown_3007460
	ldr r1, [r4]
	ldr r2, _081E0770 @ =0x0100005a
	bl CpuSet
	ldr r1, [r4]
	movs r0, 0x4
	strb r0, [r1, 0x9]
	ldr r0, [r5]
	strb r6, [r0, 0x6]
	ldr r1, [r4]
	movs r0, 0xFF
	strb r0, [r1]
	bl rfu_clearAllSlot
	ldr r0, [r5]
	strb r6, [r0, 0x9]
	movs r2, 0
	movs r3, 0
_081E0740:
	ldr r0, [r5]
	lsls r1, r2, 1
	adds r0, 0x12
	adds r0, r1
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E0740
	ldr r0, _081E0760 @ =0x04000208
	strh r7, [r0]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E0760: .4byte 0x04000208
_081E0764: .4byte gUnknown_3007464
_081E0768: .4byte 0x01000014
_081E076C: .4byte gUnknown_3007460
_081E0770: .4byte 0x0100005a
	thumb_func_end rfu_STC_clearAPIVariables

	thumb_func_start rfu_REQ_PARENT_resumeRetransmitAndChange
rfu_REQ_PARENT_resumeRetransmitAndChange: @ 81E0774
	push {lr}
	ldr r0, _081E0784 @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	bl STWI_send_ResumeRetransmitAndChangeREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0784: .4byte rfu_STC_REQ_callback
	thumb_func_end rfu_REQ_PARENT_resumeRetransmitAndChange

	thumb_func_start rfu_UNI_PARENT_getDRAC_ACK
rfu_UNI_PARENT_getDRAC_ACK: @ 81E0788
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strb r0, [r4]
	ldr r5, _081E07A0 @ =gUnknown_3007460
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _081E07A4
	movs r0, 0xC0
	lsls r0, 2
	b _081E07CA
	.align 2, 0
_081E07A0: .4byte gUnknown_3007460
_081E07A4:
	bl rfu_getSTWIRecvBuffer
	adds r1, r0, 0
	ldrb r0, [r1]
	cmp r0, 0x28
	beq _081E07B4
	cmp r0, 0x36
	bne _081E07C8
_081E07B4:
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _081E07C0
	ldr r0, [r5]
	ldrb r0, [r0, 0x2]
	b _081E07C2
_081E07C0:
	ldrb r0, [r1, 0x4]
_081E07C2:
	strb r0, [r4]
	movs r0, 0
	b _081E07CA
_081E07C8:
	movs r0, 0x10
_081E07CA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end rfu_UNI_PARENT_getDRAC_ACK

	thumb_func_start rfu_setTimerInterrupt
rfu_setTimerInterrupt: @ 81E07D0
	push {lr}
	adds r2, r0, 0
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	adds r1, r2, 0
	bl STWI_init_timer
	pop {r0}
	bx r0
	thumb_func_end rfu_setTimerInterrupt

	thumb_func_start rfu_getSTWIRecvBuffer
rfu_getSTWIRecvBuffer: @ 81E07E4
	ldr r0, _081E07F0 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_081E07F0: .4byte gUnknown_3007468
	thumb_func_end rfu_getSTWIRecvBuffer

	thumb_func_start rfu_setMSCCallback
rfu_setMSCCallback: @ 81E07F4
	push {lr}
	bl STWI_set_Callback_S
	pop {r0}
	bx r0
	thumb_func_end rfu_setMSCCallback

	thumb_func_start rfu_setREQCallback
rfu_setREQCallback: @ 81E0800
	push {lr}
	adds r1, r0, 0
	ldr r0, _081E0818 @ =gUnknown_3007468
	ldr r0, [r0]
	str r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bl rfu_enableREQCallback
	pop {r0}
	bx r0
	.align 2, 0
_081E0818: .4byte gUnknown_3007468
	thumb_func_end rfu_setREQCallback

	thumb_func_start rfu_enableREQCallback
rfu_enableREQCallback: @ 81E081C
	push {lr}
	lsls r0, 24
	cmp r0, 0
	beq _081E0834
	ldr r0, _081E0830 @ =gUnknown_3007464
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, 0x8
	orrs r0, r1
	b _081E083E
	.align 2, 0
_081E0830: .4byte gUnknown_3007464
_081E0834:
	ldr r0, _081E0844 @ =gUnknown_3007464
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
_081E083E:
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_081E0844: .4byte gUnknown_3007464
	thumb_func_end rfu_enableREQCallback

	thumb_func_start rfu_STC_REQ_callback
rfu_STC_REQ_callback: @ 81E0848
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r0, _081E087C @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	ldr r0, _081E0880 @ =gUnknown_3007464
	ldr r0, [r0]
	strh r4, [r0, 0x1C]
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _081E0876
	ldr r0, _081E0884 @ =gUnknown_3007468
	ldr r0, [r0]
	ldr r2, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r2
_081E0876:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E087C: .4byte rfu_CB_defaultCallback
_081E0880: .4byte gUnknown_3007464
_081E0884: .4byte gUnknown_3007468
	thumb_func_end rfu_STC_REQ_callback

	thumb_func_start rfu_CB_defaultCallback
rfu_CB_defaultCallback: @ 81E0888
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	cmp r0, 0xFF
	bne _081E08E4
	ldr r0, _081E08EC @ =gUnknown_3007464
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _081E08B2
	ldr r0, _081E08F0 @ =gUnknown_3007468
	ldr r0, [r0]
	ldr r2, [r0]
	movs r0, 0xFF
	adds r1, r3, 0
	bl _call_via_r2
_081E08B2:
	ldr r0, _081E08F4 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	adds r5, r0, 0
	orrs r5, r1
	movs r4, 0
_081E08C0:
	adds r0, r5, 0
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081E08D2
	adds r0, r4, 0
	bl rfu_STC_removeLinkData
_081E08D2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E08C0
	ldr r0, _081E08F4 @ =gUnknown_3007460
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1]
_081E08E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E08EC: .4byte gUnknown_3007464
_081E08F0: .4byte gUnknown_3007468
_081E08F4: .4byte gUnknown_3007460
	thumb_func_end rfu_CB_defaultCallback

	thumb_func_start rfu_waitREQComplete
rfu_waitREQComplete: @ 81E08F8
	push {lr}
	bl STWI_poll_CommandEnd
	ldr r0, _081E0908 @ =gUnknown_3007464
	ldr r0, [r0]
	ldrh r0, [r0, 0x1C]
	pop {r1}
	bx r1
	.align 2, 0
_081E0908: .4byte gUnknown_3007464
	thumb_func_end rfu_waitREQComplete

	thumb_func_start rfu_REQ_RFUStatus
rfu_REQ_RFUStatus: @ 81E090C
	push {lr}
	ldr r0, _081E091C @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E091C: .4byte rfu_STC_REQ_callback
	thumb_func_end rfu_REQ_RFUStatus

	thumb_func_start rfu_getRFUStatus
rfu_getRFUStatus: @ 81E0920
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _081E0938 @ =gUnknown_3007468
	ldr r0, [r5]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x93
	beq _081E093C
	movs r0, 0x10
	b _081E0956
	.align 2, 0
_081E0938: .4byte gUnknown_3007468
_081E093C:
	bl STWI_poll_CommandEnd
	lsls r0, 16
	cmp r0, 0
	bne _081E0950
	ldr r0, [r5]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	b _081E0952
_081E0950:
	movs r0, 0xFF
_081E0952:
	strb r0, [r4]
	movs r0, 0
_081E0956:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end rfu_getRFUStatus

	thumb_func_start sub_81E095C
sub_81E095C: @ 81E095C
	push {lr}
	ldr r2, _081E0964 @ =_Str_RFU_MBOOT
	ldr r3, _081E0968 @ =0x30000F0
	b _081E0976
	.align 2, 0
_081E0964: .4byte _Str_RFU_MBOOT
_081E0968: .4byte 0x30000F0
_081E096C:
	ldrb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r1, r0
	bne _081E09CC
_081E0976:
	ldrb r1, [r2]
	cmp r1, 0
	bne _081E096C
	movs r2, 0xC0
	lsls r2, 18
	movs r3, 0
	movs r1, 0
_081E0984:
	ldrh r0, [r2]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x2
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x59
	bls _081E0984
	ldr r0, _081E09C0 @ =0x30000FA
	ldrh r0, [r0]
	cmp r3, r0
	bne _081E09CC
	movs r0, 0xC0
	lsls r0, 18
	ldr r1, _081E09C4 @ =gUnknown_3007460
	ldr r1, [r1]
	movs r2, 0x5A
	bl CpuSet
	ldr r0, _081E09C8 @ =gUnknown_3007464
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	b _081E09CE
	.align 2, 0
_081E09C0: .4byte 0x30000FA
_081E09C4: .4byte gUnknown_3007460
_081E09C8: .4byte gUnknown_3007464
_081E09CC:
	movs r0, 0x1
_081E09CE:
	pop {r1}
	bx r1
	thumb_func_end sub_81E095C

	thumb_func_start rfu_REQ_stopMode
rfu_REQ_stopMode: @ 81E09D4
	push {lr}
	ldr r0, _081E09F4 @ =0x04000208
	ldrh r0, [r0]
	cmp r0, 0
	bne _081E09FC
	movs r0, 0x3D
	movs r1, 0x6
	bl rfu_STC_REQ_callback
	ldr r0, _081E09F8 @ =gRfuState
	ldr r1, [r0]
	ldrh r0, [r1, 0x12]
	movs r0, 0x6
	strh r0, [r1, 0x12]
	b _081E0A72
	.align 2, 0
_081E09F4: .4byte 0x04000208
_081E09F8: .4byte gRfuState
_081E09FC:
	bl AgbRFU_SoftReset
	bl rfu_STC_clearAPIVariables
	movs r0, 0x8
	bl sub_81E349C
	ldr r1, _081E0A4C @ =0x00008001
	cmp r0, r1
	bne _081E0A60
	ldr r0, _081E0A50 @ =gRfuState
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	lsls r0, 2
	ldr r2, _081E0A54 @ =0x04000100
	adds r1, r0, r2
	movs r0, 0
	str r0, [r1]
	movs r0, 0x83
	lsls r0, 16
	str r0, [r1]
	ldr r0, [r1]
	lsls r0, 16
	ldr r2, _081E0A58 @ =0x0105ffff
	ldr r3, _081E0A5C @ =rfu_CB_stopMode
	cmp r0, r2
	bhi _081E0A3A
_081E0A32:
	ldr r0, [r1]
	lsls r0, 16
	cmp r0, r2
	bls _081E0A32
_081E0A3A:
	movs r0, 0
	str r0, [r1]
	adds r0, r3, 0
	bl STWI_set_Callback_M
	bl STWI_send_StopModeREQ
	b _081E0A72
	.align 2, 0
_081E0A4C: .4byte 0x00008001
_081E0A50: .4byte gRfuState
_081E0A54: .4byte 0x04000100
_081E0A58: .4byte 0x0105ffff
_081E0A5C: .4byte rfu_CB_stopMode
_081E0A60:
	ldr r1, _081E0A78 @ =0x04000128
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x3D
	movs r1, 0
	bl rfu_STC_REQ_callback
_081E0A72:
	pop {r0}
	bx r0
	.align 2, 0
_081E0A78: .4byte 0x04000128
	thumb_func_end rfu_REQ_stopMode

	thumb_func_start rfu_CB_stopMode
rfu_CB_stopMode: @ 81E0A7C
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r1, 16
	adds r2, r1, 0
	cmp r2, 0
	bne _081E0A96
	ldr r1, _081E0AA4 @ =0x04000128
	movs r4, 0x80
	lsls r4, 6
	adds r0, r4, 0
	strh r0, [r1]
_081E0A96:
	adds r0, r3, 0
	adds r1, r2, 0
	bl rfu_STC_REQ_callback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081E0AA4: .4byte 0x04000128
	thumb_func_end rfu_CB_stopMode

	thumb_func_start rfu_REQBN_softReset_and_checkID
rfu_REQBN_softReset_and_checkID: @ 81E0AA8
	push {lr}
	ldr r0, _081E0AB8 @ =0x04000208
	ldrh r0, [r0]
	cmp r0, 0
	bne _081E0ABC
	movs r0, 0x1
	negs r0, r0
	b _081E0ADC
	.align 2, 0
_081E0AB8: .4byte 0x04000208
_081E0ABC:
	bl AgbRFU_SoftReset
	bl rfu_STC_clearAPIVariables
	movs r0, 0x1E
	bl sub_81E349C
	adds r2, r0, 0
	cmp r2, 0
	bne _081E0ADA
	ldr r1, _081E0AE0 @ =0x04000128
	movs r3, 0x80
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
_081E0ADA:
	adds r0, r2, 0
_081E0ADC:
	pop {r1}
	bx r1
	.align 2, 0
_081E0AE0: .4byte 0x04000128
	thumb_func_end rfu_REQBN_softReset_and_checkID

	thumb_func_start rfu_REQ_reset
rfu_REQ_reset: @ 81E0AE4
	push {lr}
	ldr r0, _081E0AF4 @ =rfu_CB_reset
	bl STWI_set_Callback_M
	bl STWI_send_ResetREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0AF4: .4byte rfu_CB_reset
	thumb_func_end rfu_REQ_reset

	thumb_func_start rfu_CB_reset
rfu_CB_reset: @ 81E0AF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r1, 16
	adds r4, r1, 0
	cmp r4, 0
	bne _081E0B0C
	bl rfu_STC_clearAPIVariables
_081E0B0C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl rfu_STC_REQ_callback
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end rfu_CB_reset

	thumb_func_start rfu_REQ_configSystem
rfu_REQ_configSystem: @ 81E0B1C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _081E0B54 @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	movs r0, 0x3
	ands r4, r0
	movs r0, 0x3C
	orrs r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl STWI_send_SystemConfigREQ
	cmp r6, 0
	bne _081E0B5C
	ldr r0, _081E0B58 @ =gUnknown_3007464
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x1A]
	b _081E0B76
	.align 2, 0
_081E0B54: .4byte rfu_STC_REQ_callback
_081E0B58: .4byte gUnknown_3007464
_081E0B5C:
	ldr r5, _081E0B7C @ =0x04000208
	ldrh r4, [r5]
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x96
	lsls r0, 2
	adds r1, r6, 0
	bl Div
	ldr r1, _081E0B80 @ =gUnknown_3007464
	ldr r1, [r1]
	strh r0, [r1, 0x1A]
	strh r4, [r5]
_081E0B76:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E0B7C: .4byte 0x04000208
_081E0B80: .4byte gUnknown_3007464
	thumb_func_end rfu_REQ_configSystem

	thumb_func_start rfu_REQ_configGameData
rfu_REQ_configGameData: @ 81E0B84
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r2, 0
	adds r7, r3, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, r1, 16
	adds r5, r4, 0
	mov r0, sp
	strb r1, [r0]
	lsrs r2, 24
	strb r2, [r0, 0x1]
	cmp r6, 0
	beq _081E0BAA
	movs r1, 0x80
	orrs r2, r1
	movs r1, 0
	orrs r2, r1
	strb r2, [r0, 0x1]
_081E0BAA:
	movs r2, 0x2
	ldr r0, _081E0C0C @ =rfu_CB_configGameData
	mov r12, r0
_081E0BB0:
	mov r3, sp
	adds r1, r3, r2
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xE
	bls _081E0BB0
	movs r3, 0
	adds r1, r7, 0
	movs r2, 0
_081E0BCA:
	ldrb r0, [r1]
	adds r0, r3, r0
	lsls r0, 24
	adds r1, 0x1
	lsrs r0, 24
	ldrb r3, [r5]
	adds r0, r3
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, 0x1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _081E0BCA
	mov r1, sp
	mvns r0, r3
	strb r0, [r1, 0xF]
	cmp r6, 0
	beq _081E0BF6
	movs r0, 0
	strb r0, [r1, 0xE]
_081E0BF6:
	mov r0, r12
	bl STWI_set_Callback_M
	mov r0, sp
	adds r1, r7, 0
	bl STWI_send_GameConfigREQ
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E0C0C: .4byte rfu_CB_configGameData
	thumb_func_end rfu_REQ_configGameData

	thumb_func_start rfu_CB_configGameData
rfu_CB_configGameData: @ 81E0C10
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 16
	lsrs r7, r1, 16
	cmp r7, 0
	bne _081E0C9A
	ldr r0, _081E0C54 @ =gRfuState
	ldr r0, [r0]
	ldr r1, [r0, 0x24]
	ldr r0, _081E0C58 @ =gUnknown_3007460
	ldr r6, [r0]
	ldrb r2, [r1, 0x4]
	adds r5, r6, 0
	adds r5, 0x98
	strh r2, [r5]
	ldrb r0, [r1, 0x5]
	lsls r3, r0, 8
	orrs r3, r2
	strh r3, [r5]
	adds r4, r1, 0x6
	movs r1, 0x80
	lsls r1, 8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _081E0C5C
	eors r3, r1
	strh r3, [r5]
	adds r1, r6, 0
	adds r1, 0x97
	movs r0, 0x1
	b _081E0C62
	.align 2, 0
_081E0C54: .4byte gRfuState
_081E0C58: .4byte gUnknown_3007460
_081E0C5C:
	adds r1, r6, 0
	adds r1, 0x97
	movs r0, 0
_081E0C62:
	strb r0, [r1]
	movs r2, 0
	ldr r3, _081E0CA8 @ =gUnknown_3007460
_081E0C68:
	ldr r0, [r3]
	adds r0, 0x9A
	adds r0, r2
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _081E0C68
	adds r4, 0x1
	movs r2, 0
	ldr r3, _081E0CA8 @ =gUnknown_3007460
_081E0C84:
	ldr r0, [r3]
	adds r0, 0xA9
	adds r0, r2
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _081E0C84
_081E0C9A:
	mov r0, r12
	adds r1, r7, 0
	bl rfu_STC_REQ_callback
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E0CA8: .4byte gUnknown_3007460
	thumb_func_end rfu_CB_configGameData

	thumb_func_start sub_81E0CAC
sub_81E0CAC: @ 81E0CAC
	push {lr}
	ldr r0, _081E0CDC @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _081E0CE4
	ldr r0, _081E0CE0 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _081E0CEA
	movs r0, 0x1
	bl rfu_STC_clearLinkStatus
	b _081E0CEA
	.align 2, 0
_081E0CDC: .4byte rfu_CB_defaultCallback
_081E0CE0: .4byte gUnknown_3007468
_081E0CE4:
	movs r0, 0x19
	bl rfu_STC_REQ_callback
_081E0CEA:
	ldr r0, _081E0CF8 @ =rfu_CB_startSearchChild
	bl STWI_set_Callback_M
	bl STWI_send_SC_StartREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0CF8: .4byte rfu_CB_startSearchChild
	thumb_func_end sub_81E0CAC

	thumb_func_start rfu_CB_startSearchChild
rfu_CB_startSearchChild: @ 81E0CFC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r1, 16
	adds r2, r1, 0
	cmp r2, 0
	bne _081E0D14
	ldr r0, _081E0D20 @ =gUnknown_3007464
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1, 0x9]
_081E0D14:
	adds r0, r3, 0
	adds r1, r2, 0
	bl rfu_STC_REQ_callback
	pop {r0}
	bx r0
	.align 2, 0
_081E0D20: .4byte gUnknown_3007464
	thumb_func_end rfu_CB_startSearchChild

	thumb_func_start rfu_STC_clearLinkStatus
rfu_STC_clearLinkStatus: @ 81E0D24
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl rfu_clearAllSlot
	cmp r4, 0
	beq _081E0D4C
	mov r0, sp
	movs r5, 0
	strh r5, [r0]
	ldr r4, _081E0D80 @ =gUnknown_3007460
	ldr r1, [r4]
	adds r1, 0x14
	ldr r2, _081E0D84 @ =0x01000040
	bl CpuSet
	ldr r0, [r4]
	strb r5, [r0, 0x8]
_081E0D4C:
	movs r1, 0
	ldr r2, _081E0D80 @ =gUnknown_3007460
	adds r4, r2, 0
	movs r3, 0
_081E0D54:
	ldr r0, [r4]
	adds r0, 0xA
	adds r0, r1
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _081E0D54
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, [r2]
	strb r1, [r0, 0x2]
	ldr r0, [r2]
	strb r1, [r0, 0x3]
	ldr r0, [r2]
	strb r1, [r0, 0x7]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E0D80: .4byte gUnknown_3007460
_081E0D84: .4byte 0x01000040
	thumb_func_end rfu_STC_clearLinkStatus

	thumb_func_start rfu_REQ_pollSearchChild
rfu_REQ_pollSearchChild: @ 81E0D88
	push {lr}
	ldr r0, _081E0D98 @ =rfu_CB_pollAndEndSearchChild
	bl STWI_set_Callback_M
	bl STWI_send_SC_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0D98: .4byte rfu_CB_pollAndEndSearchChild
	thumb_func_end rfu_REQ_pollSearchChild

	thumb_func_start rfu_REQ_endSearchChild
rfu_REQ_endSearchChild: @ 81E0D9C
	push {lr}
	ldr r0, _081E0DAC @ =rfu_CB_pollAndEndSearchChild
	bl STWI_set_Callback_M
	bl STWI_send_SC_EndREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0DAC: .4byte rfu_CB_pollAndEndSearchChild
	thumb_func_end rfu_REQ_endSearchChild

	thumb_func_start rfu_CB_pollAndEndSearchChild
rfu_CB_pollAndEndSearchChild: @ 81E0DB0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	cmp r6, 0
	bne _081E0DC2
	bl sub_81E0E38
_081E0DC2:
	cmp r4, 0x1A
	bne _081E0E04
	ldr r5, _081E0DF8 @ =gUnknown_3007460
	ldr r0, [r5]
	adds r0, 0x94
	ldrh r0, [r0]
	cmp r0, 0
	bne _081E0E20
	ldr r0, _081E0DFC @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	cmp r0, 0
	bne _081E0E20
	ldr r1, [r5]
	ldr r0, _081E0E00 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrh r0, [r0, 0x4]
	adds r1, 0x94
	strh r0, [r1]
	b _081E0E20
	.align 2, 0
_081E0DF8: .4byte gUnknown_3007460
_081E0DFC: .4byte rfu_CB_defaultCallback
_081E0E00: .4byte gUnknown_3007468
_081E0E04:
	cmp r4, 0x1B
	bne _081E0E20
	ldr r0, _081E0E30 @ =gUnknown_3007460
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _081E0E18
	adds r1, 0x94
	movs r0, 0
	strh r0, [r1]
_081E0E18:
	ldr r0, _081E0E34 @ =gUnknown_3007464
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x9]
_081E0E20:
	adds r0, r4, 0
	adds r1, r6, 0
	bl rfu_STC_REQ_callback
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E0E30: .4byte gUnknown_3007460
_081E0E34: .4byte gUnknown_3007464
	thumb_func_end rfu_CB_pollAndEndSearchChild

	thumb_func_start sub_81E0E38
sub_81E0E38: @ 81E0E38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r1, _081E0F64 @ =gUnknown_3007468
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r2, [r0, 0x1]
	mov r8, r2
	adds r4, r1, 0
	cmp r2, 0
	beq _081E0E96
	ldr r5, [r0, 0x4]
	ldr r0, _081E0F68 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_LinkStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	cmp r0, 0
	bne _081E0E8A
	ldr r0, [r4]
	adds r0, 0xDC
	ldr r0, [r0]
	adds r4, r0, 0x4
	movs r2, 0
_081E0E76:
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E0E76
_081E0E8A:
	ldr r0, _081E0F64 @ =gUnknown_3007468
	ldr r1, [r0]
	adds r1, 0xDC
	ldr r1, [r1]
	str r5, [r1, 0x4]
	adds r4, r0, 0
_081E0E96:
	ldr r0, [r4]
	adds r0, 0xDC
	ldr r0, [r0]
	adds r4, r0, 0x4
	mov r1, r8
	cmp r1, 0
	beq _081E0F52
	ldr r2, _081E0F6C @ =gUnknown_3007464
	mov r9, r2
	ldr r7, _081E0F70 @ =gUnknown_3007460
	mov r10, r9
_081E0EAC:
	ldrb r2, [r4, 0x2]
	adds r5, r2, 0
	cmp r2, 0x3
	bhi _081E0F42
	ldr r1, [r7]
	ldrb r0, [r1, 0x2]
	asrs r0, r2
	movs r6, 0x1
	ands r0, r6
	cmp r0, 0
	bne _081E0F42
	ldrb r3, [r1, 0x3]
	asrs r3, r2
	ands r3, r6
	cmp r3, 0
	bne _081E0F42
	mov r1, sp
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r12, r10
	cmp r0, 0
	beq _081E0EE6
	mov r0, r9
	ldr r1, [r0]
	adds r1, 0xE
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081E0EE6:
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0xE
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0x3
	bls _081E0F42
	strb r3, [r1]
	ldr r0, [r7]
	adds r0, 0xA
	adds r0, r5
	movs r1, 0xFF
	strb r1, [r0]
	ldr r2, [r7]
	adds r0, r6, 0
	lsls r0, r5
	ldrb r1, [r2, 0x2]
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldr r1, [r7]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldr r1, [r7]
	lsls r3, r5, 5
	adds r1, r3
	ldrh r0, [r4]
	strh r0, [r1, 0x14]
	strb r5, [r1, 0x16]
	ldr r0, [r7]
	strb r6, [r0]
	mov r0, r12
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	mov r2, r12
	ldr r1, [r2]
	lsls r0, r5, 1
	adds r1, 0x12
	adds r1, r0
	ldr r0, [r7]
	adds r0, r3
	ldrh r0, [r0, 0x14]
	strh r0, [r1]
_081E0F42:
	mov r0, r8
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r4, 0x4
	cmp r0, 0
	bne _081E0EAC
_081E0F52:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E0F64: .4byte gUnknown_3007468
_081E0F68: .4byte rfu_CB_defaultCallback
_081E0F6C: .4byte gUnknown_3007464
_081E0F70: .4byte gUnknown_3007460
	thumb_func_end sub_81E0E38

	thumb_func_start rfu_REQ_startSearchParent
rfu_REQ_startSearchParent: @ 81E0F74
	push {lr}
	ldr r0, _081E0F84 @ =rfu_CB_startSearchParent
	bl STWI_set_Callback_M
	bl STWI_send_SP_StartREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0F84: .4byte rfu_CB_startSearchParent
	thumb_func_end rfu_REQ_startSearchParent

	thumb_func_start rfu_CB_startSearchParent
rfu_CB_startSearchParent: @ 81E0F88
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r1, 16
	adds r4, r1, 0
	cmp r4, 0
	bne _081E0F9E
	movs r0, 0
	bl rfu_STC_clearLinkStatus
_081E0F9E:
	adds r0, r5, 0
	adds r1, r4, 0
	bl rfu_STC_REQ_callback
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end rfu_CB_startSearchParent

	thumb_func_start rfu_REQ_pollSearchParent
rfu_REQ_pollSearchParent: @ 81E0FAC
	push {lr}
	ldr r0, _081E0FBC @ =sub_81E0FC0
	bl STWI_set_Callback_M
	bl STWI_send_SP_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0FBC: .4byte sub_81E0FC0
	thumb_func_end rfu_REQ_pollSearchParent

	thumb_func_start sub_81E0FC0
sub_81E0FC0: @ 81E0FC0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r1, 16
	adds r4, r1, 0
	cmp r4, 0
	bne _081E0FD4
	bl rfu_STC_readParentCandidateList
_081E0FD4:
	adds r0, r5, 0
	adds r1, r4, 0
	bl rfu_STC_REQ_callback
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81E0FC0

	thumb_func_start rfu_REQ_endSearchParent
rfu_REQ_endSearchParent: @ 81E0FE4
	push {lr}
	ldr r0, _081E0FF4 @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	bl STWI_send_SP_EndREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E0FF4: .4byte rfu_STC_REQ_callback
	thumb_func_end rfu_REQ_endSearchParent

	thumb_func_start rfu_STC_readParentCandidateList
rfu_STC_readParentCandidateList: @ 81E0FF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r5, _081E10A0 @ =gUnknown_3007460
	ldr r1, [r5]
	adds r1, 0x14
	ldr r2, _081E10A4 @ =0x01000040
	bl CpuSet
	ldr r0, _081E10A8 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r2, [r0]
	ldrb r7, [r2, 0x1]
	adds r2, 0x4
	ldr r0, [r5]
	strb r4, [r0, 0x8]
	movs r6, 0
	cmp r7, 0
	beq _081E10FC
	mov r12, r5
	ldr r0, _081E10AC @ =0x00007fff
	mov r8, r0
_081E102E:
	subs r0, r7, 0x7
	lsls r0, 24
	lsrs r7, r0, 24
	adds r1, r2, 0x6
	adds r2, 0x13
	ldrb r0, [r2]
	mvns r0, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, 0x1
	movs r4, 0
	movs r3, 0
	adds r6, 0x1
_081E1048:
	ldrb r0, [r2]
	adds r0, r4, r0
	lsls r0, 24
	adds r2, 0x1
	lsrs r0, 24
	ldrb r4, [r1]
	adds r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r1, 0x1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _081E1048
	cmp r4, r5
	bne _081E10F0
	subs r2, 0x1C
	mov r0, r12
	ldr r1, [r0]
	ldrb r0, [r1, 0x8]
	lsls r0, 5
	adds r0, 0x14
	adds r4, r1, r0
	ldrh r0, [r2]
	movs r3, 0
	strh r0, [r4]
	adds r2, 0x2
	ldrb r0, [r2]
	strb r0, [r4, 0x2]
	adds r2, 0x2
	ldrh r1, [r2]
	mov r0, r8
	ands r0, r1
	strh r0, [r4, 0x4]
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081E10B0
	movs r0, 0x1
	strb r0, [r4, 0x3]
	b _081E10B2
	.align 2, 0
_081E10A0: .4byte gUnknown_3007460
_081E10A4: .4byte 0x01000040
_081E10A8: .4byte gUnknown_3007468
_081E10AC: .4byte 0x00007fff
_081E10B0:
	strb r3, [r4, 0x3]
_081E10B2:
	adds r2, 0x2
	movs r3, 0
	adds r5, r4, 0
	adds r5, 0x15
	adds r4, 0x6
_081E10BC:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xC
	bls _081E10BC
	adds r2, 0x1
	movs r3, 0
	adds r4, r5, 0
_081E10D4:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _081E10D4
	mov r4, r12
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
_081E10F0:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _081E10FC
	cmp r7, 0
	bne _081E102E
_081E10FC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end rfu_STC_readParentCandidateList

	thumb_func_start rfu_REQ_startConnectParent
rfu_REQ_startConnectParent: @ 81E1108
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	movs r3, 0
	movs r2, 0
	ldr r1, _081E1154 @ =gUnknown_3007460
	ldr r0, [r1]
	ldrh r0, [r0, 0x14]
	cmp r0, r4
	beq _081E1134
	adds r5, r1, 0
_081E111E:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bhi _081E1134
	ldr r0, [r5]
	lsls r1, r2, 5
	adds r0, r1
	ldrh r0, [r0, 0x14]
	cmp r0, r4
	bne _081E111E
_081E1134:
	cmp r2, 0x4
	bne _081E113C
	movs r3, 0x80
	lsls r3, 1
_081E113C:
	cmp r3, 0
	bne _081E1160
	ldr r0, _081E1158 @ =gUnknown_3007464
	ldr r0, [r0]
	strh r4, [r0, 0x1E]
	ldr r0, _081E115C @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	adds r0, r4, 0
	bl STWI_send_CP_StartREQ
	b _081E1168
	.align 2, 0
_081E1154: .4byte gUnknown_3007460
_081E1158: .4byte gUnknown_3007464
_081E115C: .4byte rfu_STC_REQ_callback
_081E1160:
	movs r0, 0x1F
	adds r1, r3, 0
	bl rfu_STC_REQ_callback
_081E1168:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end rfu_REQ_startConnectParent

	thumb_func_start rfu_REQ_pollConnectParent
rfu_REQ_pollConnectParent: @ 81E1170
	push {lr}
	ldr r0, _081E1180 @ =rfu_CB_pollConnectParent
	bl STWI_set_Callback_M
	bl STWI_send_CP_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E1180: .4byte rfu_CB_pollConnectParent
	thumb_func_end rfu_REQ_pollConnectParent

	thumb_func_start rfu_CB_pollConnectParent
rfu_CB_pollConnectParent: @ 81E1184
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x28]
	cmp r1, 0
	bne _081E1286
	ldr r0, _081E1240 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrh r5, [r0, 0x4]
	ldrb r1, [r0, 0x6]
	mov r10, r1
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _081E1286
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r2, r0, 24
	ldr r4, _081E1244 @ =gUnknown_3007460
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _081E1286
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r3, 0x2]
	ldr r1, [r4]
	ldrb r0, [r1, 0x3]
	bics r0, r2
	strb r0, [r1, 0x3]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x94
	movs r2, 0
	strh r5, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, [r4]
	strb r2, [r0]
	ldr r3, _081E1248 @ =gUnknown_3007464
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r5, 0
	adds r7, r4, 0
	add r6, sp, 0x20
	movs r0, 0
	mov r8, r0
_081E1202:
	ldr r2, [r7]
	lsls r4, r5, 5
	adds r0, r2, r4
	ldr r1, [r3]
	ldrh r0, [r0, 0x14]
	ldrh r1, [r1, 0x1E]
	cmp r0, r1
	bne _081E125A
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _081E1250
	mov r9, sp
	adds r0, r4, 0
	adds r0, 0x14
	adds r0, r2, r0
	mov r1, sp
	movs r2, 0x10
	bl CpuSet
	mov r1, r8
	strh r1, [r6]
	ldr r1, [r7]
	adds r1, 0x14
	adds r0, r6, 0
	ldr r2, _081E124C @ =0x01000040
	bl CpuSet
	ldr r0, [r7]
	mov r1, r8
	strb r1, [r0, 0x8]
	b _081E1264
	.align 2, 0
_081E1240: .4byte gUnknown_3007468
_081E1244: .4byte gUnknown_3007460
_081E1248: .4byte gUnknown_3007464
_081E124C: .4byte 0x01000040
_081E1250:
	adds r0, r4, 0
	adds r0, 0x14
	adds r2, r0
	mov r9, r2
	b _081E1264
_081E125A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E1202
_081E1264:
	cmp r5, 0x3
	bhi _081E1286
	ldr r4, _081E12A0 @ =gUnknown_3007460
	mov r0, r10
	lsls r5, r0, 5
	adds r0, r5, 0
	adds r0, 0x14
	ldr r1, [r4]
	adds r1, r0
	mov r0, r9
	movs r2, 0x10
	bl CpuSet
	ldr r0, [r4]
	adds r0, r5
	mov r1, r10
	strb r1, [r0, 0x16]
_081E1286:
	ldr r0, [sp, 0x24]
	ldr r1, [sp, 0x28]
	bl rfu_STC_REQ_callback
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E12A0: .4byte gUnknown_3007460
	thumb_func_end rfu_CB_pollConnectParent

	thumb_func_start rfu_getConnectParentStatus
rfu_getConnectParentStatus: @ 81E12A4
	push {lr}
	adds r3, r0, 0
	movs r0, 0xFF
	strb r0, [r3]
	ldr r0, _081E12C4 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r2, [r0]
	ldrb r0, [r2]
	adds r0, 0x60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _081E12C8
	movs r0, 0x10
	b _081E12D4
	.align 2, 0
_081E12C4: .4byte gUnknown_3007468
_081E12C8:
	adds r2, 0x6
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r2, 0x1]
	strb r0, [r3]
	movs r0, 0
_081E12D4:
	pop {r1}
	bx r1
	thumb_func_end rfu_getConnectParentStatus

	thumb_func_start rfu_REQ_endConnectParent
rfu_REQ_endConnectParent: @ 81E12D8
	push {lr}
	ldr r0, _081E1304 @ =rfu_CB_pollConnectParent
	bl STWI_set_Callback_M
	bl STWI_send_CP_EndREQ
	ldr r0, _081E1308 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldrb r0, [r1, 0x6]
	cmp r0, 0x3
	bhi _081E1300
	ldr r0, _081E130C @ =gUnknown_3007464
	ldr r0, [r0]
	adds r0, 0xA
	ldrb r1, [r1, 0x6]
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_081E1300:
	pop {r0}
	bx r0
	.align 2, 0
_081E1304: .4byte rfu_CB_pollConnectParent
_081E1308: .4byte gUnknown_3007468
_081E130C: .4byte gUnknown_3007464
	thumb_func_end rfu_REQ_endConnectParent

	thumb_func_start rfu_syncVBlank
rfu_syncVBlank: @ 81E1310
	push {r4,r5,lr}
	bl rfu_NI_checkCommFailCounter
	ldr r0, _081E1358 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _081E13E8
	ldr r4, _081E135C @ =gUnknown_3007464
	ldr r1, [r4]
	ldrb r0, [r1, 0x6]
	cmp r0, 0
	beq _081E132E
	subs r0, 0x1
	strb r0, [r1, 0x6]
_081E132E:
	bl rfu_getMasterSlave
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081E1360
	cmp r3, 0
	bne _081E136E
	movs r0, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r4]
	movs r0, 0xB4
	lsls r0, 1
	strh r0, [r1, 0x20]
	b _081E136A
	.align 2, 0
_081E1358: .4byte gUnknown_3007460
_081E135C: .4byte gUnknown_3007464
_081E1360:
	cmp r3, 0
	beq _081E1380
	movs r0, 0xFB
	ands r0, r1
	strb r0, [r2]
_081E136A:
	cmp r3, 0
	beq _081E1380
_081E136E:
	ldr r3, _081E137C @ =gUnknown_3007464
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, 0xFD
	ands r0, r1
	b _081E138A
	.align 2, 0
_081E137C: .4byte gUnknown_3007464
_081E1380:
	ldr r3, _081E13DC @ =gUnknown_3007464
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, 0x2
	orrs r0, r1
_081E138A:
	strb r0, [r2]
	ldr r3, [r3]
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081E13E8
	ldrh r0, [r3, 0x20]
	cmp r0, 0
	bne _081E13E4
	movs r0, 0xFB
	ands r0, r1
	strb r0, [r3]
	ldr r0, _081E13E0 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	adds r5, r0, 0
	orrs r5, r1
	movs r4, 0
_081E13B2:
	adds r0, r5, 0
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081E13C4
	adds r0, r4, 0
	bl rfu_STC_removeLinkData
_081E13C4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E13B2
	ldr r0, _081E13E0 @ =gUnknown_3007460
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0x1
	b _081E13EA
	.align 2, 0
_081E13DC: .4byte gUnknown_3007464
_081E13E0: .4byte gUnknown_3007460
_081E13E4:
	subs r0, 0x1
	strh r0, [r3, 0x20]
_081E13E8:
	movs r0, 0
_081E13EA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end rfu_syncVBlank

	thumb_func_start sub_81E13F0
sub_81E13F0: @ 81E13F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	mov r8, r1
	str r2, [sp]
	str r3, [sp, 0x4]
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0
	str r0, [sp, 0x8]
	movs r1, 0
	str r1, [sp, 0xC]
	mov r2, r8
	strb r1, [r2]
	mov r0, sp
	ldrb r1, [r0, 0xC]
	ldr r0, [sp]
	strb r1, [r0]
	mov r2, sp
	ldrb r0, [r2, 0xC]
	ldr r2, [sp, 0x4]
	strb r0, [r2]
	ldr r4, _081E1490 @ =gUnknown_3007460
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081E142E
	b _081E178E
_081E142E:
	ldr r0, _081E1494 @ =gRfuState
	ldr r0, [r0]
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _081E143A
	b _081E178E
_081E143A:
	ldr r3, _081E1498 @ =gUnknown_3007464
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081E144E
	movs r0, 0xB4
	lsls r0, 1
	strh r0, [r2, 0x20]
_081E144E:
	ldr r1, [r3]
	ldrb r0, [r1, 0x6]
	cmp r0, 0
	bne _081E1460
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	strb r0, [r1, 0x6]
	movs r1, 0x1
	str r1, [sp, 0x8]
_081E1460:
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, 0x29
	bne _081E14A0
	ldr r0, _081E149C @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r1, 0x5]
	ldr r1, [sp]
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081E148A
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	strb r0, [r2]
_081E148A:
	movs r2, 0x2
	str r2, [sp, 0x8]
	b _081E14F8
	.align 2, 0
_081E1490: .4byte gUnknown_3007460
_081E1494: .4byte gRfuState
_081E1498: .4byte gUnknown_3007464
_081E149C: .4byte gUnknown_3007468
_081E14A0:
	movs r0, 0x9B
	lsls r0, 1
	cmp r5, r0
	bne _081E14F0
	ldr r0, _081E154C @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r6, [r0, 0x5]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	eors r6, r0
	ands r6, r0
	mov r0, r8
	strb r6, [r0]
	movs r0, 0x1
	ldr r1, [sp]
	strb r0, [r1]
	movs r5, 0
_081E14C6:
	mov r2, r8
	ldrb r0, [r2]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081E14E6
	ldr r0, _081E1550 @ =gUnknown_3007460
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r5
	movs r1, 0
	strb r1, [r0]
	adds r0, r5, 0
	bl rfu_STC_removeLinkData
_081E14E6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E14C6
_081E14F0:
	ldr r0, [sp, 0x8]
	cmp r0, 0
	bne _081E14F8
	b _081E178E
_081E14F8:
	ldr r4, _081E154C @ =gUnknown_3007468
	ldr r0, [r4]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r1, [r0]
	str r1, [sp, 0x10]
	ldr r0, [r0, 0x4]
	str r0, [sp, 0x14]
	ldr r0, _081E1554 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_LinkStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	cmp r0, 0
	bne _081E1558
	ldr r0, [r4]
	adds r0, 0xDC
	ldr r0, [r0]
	adds r2, r0, 0x4
	movs r5, 0
	ldr r3, _081E1550 @ =gUnknown_3007460
_081E152C:
	ldr r0, [r3]
	adds r0, 0xA
	adds r0, r5
	ldrb r1, [r2]
	strb r1, [r0]
	adds r2, 0x1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E152C
	movs r2, 0
	mov r9, r2
	movs r5, 0
	b _081E1564
	.align 2, 0
_081E154C: .4byte gUnknown_3007468
_081E1550: .4byte gUnknown_3007460
_081E1554: .4byte rfu_CB_defaultCallback
_081E1558:
	movs r0, 0x11
	ldr r1, [sp, 0xC]
	bl rfu_STC_REQ_callback
	ldr r0, [sp, 0xC]
	b _081E1790
_081E1564:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r5
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	mov r10, r0
	ldr r1, [sp, 0xC]
	cmp r1, 0
	beq _081E1578
	b _081E1742
_081E1578:
	ldr r2, [sp, 0x8]
	cmp r2, 0x1
	bne _081E164E
	ldr r4, _081E15B8 @ =gUnknown_3007460
	ldr r1, [r4]
	ldrb r0, [r1, 0x2]
	ands r0, r6
	cmp r0, 0
	beq _081E164E
	adds r0, r1, 0
	adds r0, 0xA
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _081E1640
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _081E15C0
	ldr r2, _081E15BC @ =gUnknown_3007464
	ldr r1, [r2]
	adds r1, 0xA
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xA
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _081E164E
	b _081E1626
	.align 2, 0
_081E15B8: .4byte gUnknown_3007460
_081E15BC: .4byte gUnknown_3007464
_081E15C0:
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	cmp r0, 0
	bne _081E164E
	ldr r0, _081E15F0 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _081E15F4
	mov r2, r8
	ldrb r1, [r2]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrb r1, [r0, 0x8]
	ldr r0, [sp]
	b _081E164C
	.align 2, 0
_081E15F0: .4byte gUnknown_3007468
_081E15F4:
	ldr r2, _081E163C @ =gUnknown_3007464
	ldr r1, [r2]
	adds r1, 0xA
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	ldr r2, [r2]
	lsrs r0, 24
	ldrh r1, [r2, 0x1A]
	cmp r0, r1
	bls _081E164E
	adds r0, r2, 0
	adds r0, 0xA
	adds r0, r5
	mov r2, sp
	ldrb r2, [r2, 0xC]
	strb r2, [r0]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	bl STWI_send_DisconnectREQ
	bl STWI_poll_CommandEnd
_081E1626:
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, 0
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r2, sp
	ldrb r0, [r2, 0x8]
	ldr r2, [sp]
	strb r0, [r2]
	b _081E164E
	.align 2, 0
_081E163C: .4byte gUnknown_3007464
_081E1640:
	ldr r0, _081E16B0 @ =gUnknown_3007464
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r5
	mov r1, sp
	ldrb r1, [r1, 0xC]
_081E164C:
	strb r1, [r0]
_081E164E:
	ldr r2, _081E16B4 @ =gUnknown_3007460
	mov r12, r2
	ldr r1, [r2]
	ldrb r7, [r1]
	adds r0, r5, 0x1
	mov r10, r0
	cmp r7, 0x1
	bne _081E1742
	adds r0, r1, 0
	adds r0, 0xA
	adds r4, r0, r5
	ldrb r3, [r4]
	cmp r3, 0
	beq _081E1742
	ldrb r2, [r1, 0x3]
	adds r0, r6, 0
	ands r0, r2
	cmp r0, 0
	beq _081E16BE
	cmp r3, 0xA
	bls _081E16B8
	ldr r2, [sp, 0x4]
	ldrb r1, [r2]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2]
	mov r0, r12
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	adds r0, r6, 0
	orrs r0, r1
	movs r3, 0
	strb r0, [r2, 0x2]
	mov r2, r12
	ldr r1, [r2]
	ldrb r0, [r1, 0x3]
	bics r0, r6
	strb r0, [r1, 0x3]
	ldr r1, [r2]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, _081E16B0 @ =gUnknown_3007464
	ldr r0, [r0]
	adds r0, 0xA
	adds r0, r5
	strb r3, [r0]
	b _081E1742
	.align 2, 0
_081E16B0: .4byte gUnknown_3007464
_081E16B4: .4byte gUnknown_3007460
_081E16B8:
	movs r0, 0
	strb r0, [r4]
	b _081E1742
_081E16BE:
	ldrb r0, [r1, 0x2]
	orrs r0, r2
	ands r0, r6
	cmp r0, 0
	bne _081E1742
	bl STWI_send_SlotStatusREQ
	bl STWI_poll_CommandEnd
	ldr r0, _081E1708 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r2, [r0]
	ldrb r0, [r2, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, 0x8
	cmp r3, 0
	beq _081E1742
	ldrh r4, [r2]
	ldrb r0, [r2, 0x2]
	cmp r0, r5
	bne _081E1710
	ldr r0, _081E170C @ =gUnknown_3007464
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, 0x12
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _081E1710
	lsls r7, r5
	mov r0, r9
	orrs r0, r7
	lsls r0, 24
	b _081E173E
	.align 2, 0
_081E1708: .4byte gUnknown_3007468
_081E170C: .4byte gUnknown_3007464
_081E1710:
	adds r2, 0x4
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _081E1742
	ldrh r4, [r2]
	ldrb r0, [r2, 0x2]
	cmp r0, r5
	bne _081E1710
	ldr r0, _081E17A0 @ =gUnknown_3007464
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, 0x12
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _081E1710
	movs r0, 0x1
	lsls r0, r5
	mov r1, r9
	orrs r1, r0
	lsls r0, r1, 24
_081E173E:
	lsrs r0, 24
	mov r9, r0
_081E1742:
	ldr r0, _081E17A4 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
	mov r2, r8
	ldrb r0, [r2]
	ands r0, r1
	ands r6, r0
	cmp r6, 0
	beq _081E175C
	adds r0, r5, 0
	movs r1, 0
	bl rfu_STC_removeLinkData
_081E175C:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bhi _081E1768
	b _081E1564
_081E1768:
	mov r2, r9
	cmp r2, 0
	beq _081E1778
	mov r0, r9
	bl STWI_send_DisconnectREQ
	bl STWI_poll_CommandEnd
_081E1778:
	ldr r1, _081E17A8 @ =gUnknown_3007468
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r2, [sp, 0x10]
	str r2, [r0]
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r1, [sp, 0x14]
	str r1, [r0, 0x4]
_081E178E:
	movs r0, 0
_081E1790:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E17A0: .4byte gUnknown_3007464
_081E17A4: .4byte gUnknown_3007460
_081E17A8: .4byte gUnknown_3007468
	thumb_func_end sub_81E13F0

	thumb_func_start rfu_STC_removeLinkData
rfu_STC_removeLinkData: @ 81E17AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r7
	lsrs r5, r0, 24
	ldr r1, _081E1850 @ =gUnknown_3007460
	ldr r4, [r1]
	ldrb r0, [r4, 0x2]
	ands r0, r5
	mov r8, r1
	cmp r0, 0
	beq _081E17DE
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _081E17DE
	subs r0, 0x1
	strb r0, [r4, 0x1]
_081E17DE:
	mov r3, r8
	ldr r2, [r3]
	mvns r6, r5
	ldrb r1, [r2, 0x2]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r2, 0x2]
	ldr r2, [r3]
	ldrb r1, [r2, 0x3]
	adds r0, r5, 0
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r3, [r3]
	ldr r0, [r3]
	ldr r1, _081E1854 @ =0x00ff00ff
	ands r0, r1
	cmp r0, 0
	bne _081E1806
	movs r0, 0xFF
	strb r0, [r3]
_081E1806:
	mov r0, r12
	cmp r0, 0
	beq _081E1844
	mov r1, sp
	movs r4, 0
	movs r0, 0
	strh r0, [r1]
	lsls r0, r7, 5
	adds r0, 0x14
	mov r2, r8
	ldr r1, [r2]
	adds r1, r0
	ldr r2, _081E1858 @ =0x01000010
	mov r0, sp
	bl CpuSet
	mov r0, r8
	ldr r2, [r0]
	ldrb r1, [r2, 0x3]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r2, 0x3]
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r1, 0x7]
	ands r6, r0
	strb r6, [r1, 0x7]
	ldr r0, [r2]
	adds r0, 0xA
	adds r0, r7
	strb r4, [r0]
_081E1844:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E1850: .4byte gUnknown_3007460
_081E1854: .4byte 0x00ff00ff
_081E1858: .4byte 0x01000010
	thumb_func_end rfu_STC_removeLinkData

	thumb_func_start rfu_REQ_disconnect
rfu_REQ_disconnect: @ 81E185C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _081E18A0 @ =gUnknown_3007460
	ldr r1, [r2]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	ands r0, r4
	cmp r0, 0
	beq _081E18E0
	ldr r0, _081E18A4 @ =gUnknown_3007464
	ldr r1, [r0]
	strb r4, [r1, 0x5]
	ldr r2, [r2]
	ldrb r1, [r2]
	adds r3, r0, 0
	cmp r1, 0xFF
	bne _081E18A8
	ldr r0, [r3]
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081E18A8
	ldrb r0, [r2, 0x3]
	ands r0, r4
	cmp r0, 0
	beq _081E18E0
	movs r0, 0x30
	movs r1, 0
	bl rfu_CB_disconnect
	b _081E18E0
	.align 2, 0
_081E18A0: .4byte gUnknown_3007460
_081E18A4: .4byte gUnknown_3007464
_081E18A8:
	ldr r0, [r3]
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _081E18D4
	ldr r0, _081E18D0 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SC_EndREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _081E18D4
	movs r0, 0x1B
	bl rfu_STC_REQ_callback
	b _081E18E0
	.align 2, 0
_081E18D0: .4byte rfu_CB_defaultCallback
_081E18D4:
	ldr r0, _081E18E8 @ =rfu_CB_disconnect
	bl STWI_set_Callback_M
	adds r0, r4, 0
	bl STWI_send_DisconnectREQ
_081E18E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081E18E8: .4byte rfu_CB_disconnect
	thumb_func_end rfu_REQ_disconnect

	thumb_func_start rfu_CB_disconnect
rfu_CB_disconnect: @ 81E18EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r5, 0x3
	bne _081E1928
	ldr r0, _081E19BC @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0
	bne _081E1928
	ldr r0, _081E19C0 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SystemStatusREQ
	bl STWI_poll_CommandEnd
	lsls r0, 16
	cmp r0, 0
	bne _081E1928
	ldr r0, _081E19C4 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	bne _081E1928
	movs r5, 0
_081E1928:
	ldr r3, _081E19C8 @ =gUnknown_3007464
	ldr r2, [r3]
	ldr r0, _081E19BC @ =gUnknown_3007460
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	ldrb r1, [r2, 0x5]
	ands r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _081E19C4 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldr r0, [r3]
	ldrb r0, [r0, 0x5]
	strb r0, [r1, 0x8]
	cmp r5, 0
	bne _081E1976
	movs r4, 0
_081E1950:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r0, 24
	ldr r1, _081E19C8 @ =gUnknown_3007464
	ldr r1, [r1]
	ldrb r1, [r1, 0x5]
	ands r0, r1
	cmp r0, 0
	beq _081E196C
	adds r0, r4, 0
	movs r1, 0x1
	bl rfu_STC_removeLinkData
_081E196C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E1950
_081E1976:
	ldr r0, _081E19BC @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	orrs r0, r1
	cmp r0, 0
	bne _081E1988
	movs r0, 0xFF
	strb r0, [r2]
_081E1988:
	adds r0, r6, 0
	adds r1, r5, 0
	bl rfu_STC_REQ_callback
	ldr r0, _081E19C8 @ =gUnknown_3007464
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _081E19B6
	ldr r0, _081E19C0 @ =rfu_CB_defaultCallback
	bl STWI_set_Callback_M
	bl STWI_send_SC_StartREQ
	bl STWI_poll_CommandEnd
	adds r5, r0, 0
	cmp r5, 0
	beq _081E19B6
	movs r0, 0x19
	adds r1, r5, 0
	bl rfu_STC_REQ_callback
_081E19B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E19BC: .4byte gUnknown_3007460
_081E19C0: .4byte rfu_CB_defaultCallback
_081E19C4: .4byte gUnknown_3007468
_081E19C8: .4byte gUnknown_3007464
	thumb_func_end rfu_CB_disconnect

	thumb_func_start rfu_REQ_CHILD_startConnectRecovery
rfu_REQ_CHILD_startConnectRecovery: @ 81E19CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081E1A1C @ =gUnknown_3007464
	ldr r0, [r0]
	strb r5, [r0, 0x5]
	movs r4, 0
	movs r0, 0x1
	ands r0, r5
	ldr r2, _081E1A20 @ =rfu_STC_REQ_callback
	cmp r0, 0
	bne _081E19FA
	movs r1, 0x1
_081E19E6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bhi _081E19FA
	adds r0, r5, 0
	asrs r0, r4
	ands r0, r1
	cmp r0, 0
	beq _081E19E6
_081E19FA:
	adds r0, r2, 0
	bl STWI_set_Callback_M
	ldr r0, _081E1A24 @ =gUnknown_3007460
	ldr r1, [r0]
	lsls r0, r4, 5
	adds r0, r1, r0
	ldrh r0, [r0, 0x14]
	adds r1, 0x94
	ldrh r1, [r1]
	adds r2, r5, 0
	bl STWI_send_CPR_StartREQ
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E1A1C: .4byte gUnknown_3007464
_081E1A20: .4byte rfu_STC_REQ_callback
_081E1A24: .4byte gUnknown_3007460
	thumb_func_end rfu_REQ_CHILD_startConnectRecovery

	thumb_func_start rfu_REQ_CHILD_pollConnectRecovery
rfu_REQ_CHILD_pollConnectRecovery: @ 81E1A28
	push {lr}
	ldr r0, _081E1A38 @ =rfu_CB_CHILD_pollConnectRecovery
	bl STWI_set_Callback_M
	bl STWI_send_CPR_PollingREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E1A38: .4byte rfu_CB_CHILD_pollConnectRecovery
	thumb_func_end rfu_REQ_CHILD_pollConnectRecovery

	thumb_func_start rfu_CB_CHILD_pollConnectRecovery
rfu_CB_CHILD_pollConnectRecovery: @ 81E1A3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r7, r1, 16
	cmp r7, 0
	bne _081E1AC0
	ldr r0, _081E1AD4 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _081E1AC0
	ldr r0, _081E1AD8 @ =gUnknown_3007464
	ldr r1, [r0]
	ldrb r1, [r1, 0x5]
	adds r6, r0, 0
	cmp r1, 0
	beq _081E1AC0
	ldr r1, _081E1ADC @ =gUnknown_3007460
	ldr r0, [r1]
	strb r7, [r0]
	movs r4, 0
	adds r5, r1, 0
	mov r12, r4
_081E1A76:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r3, r0, 24
	ldr r2, [r5]
	ldr r0, [r6]
	ldrb r0, [r0, 0x5]
	ands r0, r3
	ldrb r1, [r2, 0x3]
	ands r0, r1
	cmp r0, 0
	beq _081E1AB0
	ldrb r1, [r2, 0x2]
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	bics r0, r3
	strb r0, [r1, 0x3]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, [r6]
	adds r0, 0xA
	adds r0, r4
	mov r1, r12
	strb r1, [r0]
_081E1AB0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E1A76
	ldr r1, [r6]
	movs r0, 0
	strb r0, [r1, 0x5]
_081E1AC0:
	mov r0, r8
	adds r1, r7, 0
	bl rfu_STC_REQ_callback
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E1AD4: .4byte gUnknown_3007468
_081E1AD8: .4byte gUnknown_3007464
_081E1ADC: .4byte gUnknown_3007460
	thumb_func_end rfu_CB_CHILD_pollConnectRecovery

	thumb_func_start rfu_CHILD_getConnectRecoveryStatus
rfu_CHILD_getConnectRecoveryStatus: @ 81E1AE0
	push {lr}
	adds r2, r0, 0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _081E1B00 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x4D
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _081E1B04
	movs r0, 0x10
	b _081E1B0A
	.align 2, 0
_081E1B00: .4byte gUnknown_3007468
_081E1B04:
	ldrb r0, [r1, 0x4]
	strb r0, [r2]
	movs r0, 0
_081E1B0A:
	pop {r1}
	bx r1
	thumb_func_end rfu_CHILD_getConnectRecoveryStatus

	thumb_func_start rfu_REQ_CHILD_endConnectRecovery
rfu_REQ_CHILD_endConnectRecovery: @ 81E1B10
	push {lr}
	ldr r0, _081E1B20 @ =rfu_CB_CHILD_pollConnectRecovery
	bl STWI_set_Callback_M
	bl STWI_send_CPR_EndREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E1B20: .4byte rfu_CB_CHILD_pollConnectRecovery
	thumb_func_end rfu_REQ_CHILD_endConnectRecovery

	thumb_func_start sub_81E1B24
sub_81E1B24: @ 81E1B24
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r3, [r5]
	ldr r1, [r6]
	subs r2, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _081E1B48
	adds r4, r0, 0
_081E1B3A:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, r4
	bne _081E1B3A
_081E1B48:
	str r3, [r5]
	str r1, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81E1B24

	thumb_func_start rfu_REQ_changeMasterSlave
rfu_REQ_changeMasterSlave: @ 81E1B54
	push {lr}
	movs r0, 0x1
	bl STWI_read_status
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _081E1B74
	ldr r0, _081E1B70 @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	bl STWI_send_MS_ChangeREQ
	b _081E1B7C
	.align 2, 0
_081E1B70: .4byte rfu_STC_REQ_callback
_081E1B74:
	movs r0, 0x27
	movs r1, 0
	bl rfu_STC_REQ_callback
_081E1B7C:
	pop {r0}
	bx r0
	thumb_func_end rfu_REQ_changeMasterSlave

	thumb_func_start rfu_getMasterSlave
rfu_getMasterSlave: @ 81E1B80
	push {lr}
	movs r0, 0x1
	bl STWI_read_status
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bne _081E1BAE
	ldr r0, _081E1BB4 @ =gRfuState
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	cmp r0, 0
	beq _081E1BAE
	ldrb r0, [r1, 0x6]
	cmp r0, 0x27
	beq _081E1BAC
	cmp r0, 0x25
	beq _081E1BAC
	cmp r0, 0x37
	bne _081E1BAE
_081E1BAC:
	movs r2, 0
_081E1BAE:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_081E1BB4: .4byte gRfuState
	thumb_func_end rfu_getMasterSlave

	thumb_func_start rfu_clearAllSlot
rfu_clearAllSlot: @ 81E1BB8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _081E1C3C @ =0x04000208
	ldrh r0, [r1]
	mov r8, r0
	movs r0, 0
	strh r0, [r1]
	movs r5, 0
	mov r0, sp
	adds r0, 0x2
	movs r7, 0
	adds r6, r0, 0
_081E1BD4:
	mov r0, sp
	strh r7, [r0]
	ldr r0, _081E1C40 @ =gUnknown_3007450
	lsls r4, r5, 2
	adds r0, r4, r0
	ldr r1, [r0]
	mov r0, sp
	ldr r2, _081E1C44 @ =0x01000034
	bl CpuSet
	strh r7, [r6]
	ldr r0, _081E1C48 @ =gUnknown_3007440
	adds r4, r0
	ldr r1, [r4]
	adds r0, r6, 0
	ldr r2, _081E1C4C @ =0x0100000a
	bl CpuSet
	ldr r3, _081E1C50 @ =gUnknown_3007460
	ldr r0, [r3]
	adds r0, 0x10
	adds r0, r5
	movs r1, 0x10
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _081E1BD4
	ldr r2, [r3]
	movs r1, 0
	movs r0, 0x57
	strb r0, [r2, 0xF]
	ldr r0, [r3]
	strb r1, [r0, 0x4]
	ldr r0, [r3]
	strb r1, [r0, 0x5]
	ldr r0, [r3]
	strb r1, [r0, 0x6]
	ldr r0, _081E1C54 @ =gUnknown_3007464
	ldr r0, [r0]
	strb r1, [r0, 0x2]
	ldr r0, _081E1C3C @ =0x04000208
	mov r1, r8
	strh r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E1C3C: .4byte 0x04000208
_081E1C40: .4byte gUnknown_3007450
_081E1C44: .4byte 0x01000034
_081E1C48: .4byte gUnknown_3007440
_081E1C4C: .4byte 0x0100000a
_081E1C50: .4byte gUnknown_3007460
_081E1C54: .4byte gUnknown_3007464
	thumb_func_end rfu_clearAllSlot

	thumb_func_start rfu_STC_releaseFrame
rfu_STC_releaseFrame: @ 81E1C58
	push {r4-r6,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r0, _081E1C90 @ =gUnknown_3007464
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081E1C98
	ldr r6, _081E1C94 @ =gUnknown_3007460
	cmp r3, 0
	bne _081E1C84
	ldr r1, [r6]
	ldrb r0, [r1, 0xF]
	ldrh r4, [r4, 0x2E]
	adds r0, r4
	strb r0, [r1, 0xF]
_081E1C84:
	ldr r1, [r6]
	ldrb r0, [r1, 0xF]
	adds r0, 0x3
	strb r0, [r1, 0xF]
	b _081E1CB8
	.align 2, 0
_081E1C90: .4byte gUnknown_3007464
_081E1C94: .4byte gUnknown_3007460
_081E1C98:
	ldr r6, _081E1CC0 @ =gUnknown_3007460
	cmp r3, 0
	bne _081E1CAC
	ldr r1, [r6]
	adds r1, 0x10
	adds r1, r2
	ldrb r0, [r1]
	ldrh r4, [r4, 0x2E]
	adds r0, r4
	strb r0, [r1]
_081E1CAC:
	ldr r1, [r6]
	adds r1, 0x10
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x2
	strb r0, [r1]
_081E1CB8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E1CC0: .4byte gUnknown_3007460
	thumb_func_end rfu_STC_releaseFrame

	thumb_func_start rfu_clearSlot
rfu_clearSlot: @ 81E1CC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r7, 0x3
	bls _081E1CE4
	movs r0, 0x80
	lsls r0, 3
	b _081E1E5C
_081E1CE4:
	movs r0, 0xF
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _081E1CF4
	movs r0, 0xC0
	lsls r0, 3
	b _081E1E5C
_081E1CF4:
	ldr r1, _081E1D38 @ =0x04000208
	ldrh r0, [r1]
	mov r10, r0
	movs r0, 0
	strh r0, [r1]
	movs r0, 0xC
	mov r2, r8
	ands r0, r2
	cmp r0, 0
	beq _081E1DBC
	movs r3, 0
	ldr r1, _081E1D3C @ =gUnknown_3007450
	lsls r0, r7, 2
	adds r0, r1
	mov r9, r0
_081E1D12:
	movs r4, 0
	cmp r3, 0
	bne _081E1D44
	movs r0, 0x4
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _081E1D64
	mov r2, r9
	ldr r4, [r2]
	ldr r0, _081E1D40 @ =gUnknown_3007460
	ldr r2, [r0]
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	ldrb r0, [r2, 0x4]
	bics r0, r1
	strb r0, [r2, 0x4]
	b _081E1D64
	.align 2, 0
_081E1D38: .4byte 0x04000208
_081E1D3C: .4byte gUnknown_3007450
_081E1D40: .4byte gUnknown_3007460
_081E1D44:
	movs r0, 0x8
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _081E1D64
	mov r2, r9
	ldr r0, [r2]
	adds r4, r0, 0
	adds r4, 0x34
	ldr r0, _081E1DF8 @ =gUnknown_3007460
	ldr r2, [r0]
	movs r1, 0x1
	lsls r1, r7
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
_081E1D64:
	adds r6, r3, 0x1
	cmp r4, 0
	beq _081E1DB4
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _081E1DA4
	lsls r1, r3, 24
	lsrs r1, 24
	adds r0, r7, 0
	adds r2, r4, 0
	bl rfu_STC_releaseFrame
	movs r1, 0
	adds r2, r4, 0
	adds r2, 0x2C
	movs r5, 0x1
	movs r3, 0
_081E1D8E:
	ldrb r0, [r2]
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _081E1D9A
	strh r3, [r4, 0x2]
_081E1D9A:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _081E1D8E
_081E1DA4:
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, 0
	ldr r2, _081E1DFC @ =0x0100001a
	bl CpuSet
_081E1DB4:
	lsls r0, r6, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _081E1D12
_081E1DBC:
	movs r0, 0x1
	mov r4, r8
	ands r0, r4
	cmp r0, 0
	beq _081E1E32
	ldr r1, _081E1E00 @ =gUnknown_3007440
	lsls r0, r7, 2
	adds r0, r1
	ldr r3, [r0]
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081E1E24
	ldr r0, _081E1E04 @ =gUnknown_3007464
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081E1E08
	ldr r2, _081E1DF8 @ =gUnknown_3007460
	ldr r1, [r2]
	ldrb r0, [r1, 0xF]
	adds r0, 0x3
	ldrb r4, [r3, 0x4]
	adds r0, r4
	strb r0, [r1, 0xF]
	b _081E1E1A
	.align 2, 0
_081E1DF8: .4byte gUnknown_3007460
_081E1DFC: .4byte 0x0100001a
_081E1E00: .4byte gUnknown_3007440
_081E1E04: .4byte gUnknown_3007464
_081E1E08:
	ldr r2, _081E1E6C @ =gUnknown_3007460
	ldr r1, [r2]
	adds r1, 0x10
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x2
	ldrb r4, [r3, 0x4]
	adds r0, r4
	strb r0, [r1]
_081E1E1A:
	ldr r2, [r2]
	ldrb r1, [r3, 0x3]
	ldrb r0, [r2, 0x6]
	bics r0, r1
	strb r0, [r2, 0x6]
_081E1E24:
	mov r0, sp
	movs r1, 0
	strh r1, [r0]
	ldr r2, _081E1E70 @ =0x01000006
	adds r1, r3, 0
	bl CpuSet
_081E1E32:
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _081E1E54
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _081E1E74 @ =gUnknown_3007440
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0xC
	ldr r2, _081E1E78 @ =0x01000004
	mov r0, sp
	bl CpuSet
_081E1E54:
	ldr r0, _081E1E7C @ =0x04000208
	mov r2, r10
	strh r2, [r0]
	movs r0, 0
_081E1E5C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E1E6C: .4byte gUnknown_3007460
_081E1E70: .4byte 0x01000006
_081E1E74: .4byte gUnknown_3007440
_081E1E78: .4byte 0x01000004
_081E1E7C: .4byte 0x04000208
	thumb_func_end rfu_clearSlot

	thumb_func_start rfu_setRecvBuffer
rfu_setRecvBuffer: @ 81E1E80
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r3, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	cmp r1, 0x3
	bls _081E1E9C
	movs r0, 0x80
	lsls r0, 3
	b _081E1ED4
_081E1E9C:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _081E1EB8
	ldr r0, _081E1EB4 @ =gUnknown_3007450
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	str r5, [r0, 0x68]
	str r6, [r0, 0x6C]
	b _081E1ED2
	.align 2, 0
_081E1EB4: .4byte gUnknown_3007450
_081E1EB8:
	movs r0, 0x10
	ands r2, r0
	cmp r2, 0
	bne _081E1EC6
	movs r0, 0xC0
	lsls r0, 3
	b _081E1ED4
_081E1EC6:
	ldr r0, _081E1EDC @ =gUnknown_3007440
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	str r5, [r0, 0x14]
	str r6, [r0, 0x18]
_081E1ED2:
	movs r0, 0
_081E1ED4:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081E1EDC: .4byte gUnknown_3007440
	thumb_func_end rfu_setRecvBuffer

	thumb_func_start rfu_NI_setSendData
rfu_NI_setSendData: @ 81E1EE0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	str r3, [sp]
	movs r0, 0x20
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl rfu_STC_setSendData_org
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end rfu_NI_setSendData

	thumb_func_start rfu_UNI_setSendData
rfu_UNI_setSendData: @ 81E1F0C
	push {lr}
	sub sp, 0x4
	adds r3, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _081E1F28 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E1F2C
	adds r0, r2, 0x3
	b _081E1F2E
	.align 2, 0
_081E1F28: .4byte gUnknown_3007460
_081E1F2C:
	adds r0, r2, 0x2
_081E1F2E:
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x10
	bl rfu_STC_setSendData_org
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end rfu_UNI_setSendData

	thumb_func_start rfu_NI_CHILD_setSendGameName
rfu_NI_CHILD_setSendGameName: @ 81E1F48
	push {lr}
	sub sp, 0x4
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r1, 24
	ldr r0, _081E1F78 @ =gUnknown_3007460
	ldr r3, [r0]
	adds r3, 0x98
	movs r0, 0x1A
	str r0, [sp]
	movs r0, 0x40
	bl rfu_STC_setSendData_org
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_081E1F78: .4byte gUnknown_3007460
	thumb_func_end rfu_NI_CHILD_setSendGameName

	thumb_func_start rfu_STC_setSendData_org
rfu_STC_setSendData_org: @ 81E1F7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	str r3, [sp]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r0, _081E1FA8 @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r1, [r2]
	mov r10, r0
	cmp r1, 0xFF
	bne _081E1FB0
	ldr r0, _081E1FAC @ =0x00000301
	b _081E2166
	.align 2, 0
_081E1FA8: .4byte gUnknown_3007460
_081E1FAC: .4byte 0x00000301
_081E1FB0:
	movs r0, 0xF
	ands r0, r3
	cmp r0, 0
	bne _081E1FBE
	movs r0, 0x80
	lsls r0, 3
	b _081E2166
_081E1FBE:
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	orrs r0, r1
	ands r0, r3
	cmp r0, r3
	beq _081E1FD4
	ldr r0, _081E1FD0 @ =0x00000401
	b _081E2166
	.align 2, 0
_081E1FD0: .4byte 0x00000401
_081E1FD4:
	movs r0, 0x10
	ands r0, r6
	cmp r0, 0
	beq _081E1FE0
	ldrb r0, [r2, 0x6]
	b _081E1FE2
_081E1FE0:
	ldrb r0, [r2, 0x4]
_081E1FE2:
	ands r0, r3
	cmp r0, 0
	beq _081E1FF0
	ldr r0, _081E1FEC @ =0x00000402
	b _081E2166
	.align 2, 0
_081E1FEC: .4byte 0x00000402
_081E1FF0:
	movs r2, 0
	movs r0, 0x1
	ands r0, r3
	ldr r4, _081E2020 @ =_Str_RfuHeader
	cmp r0, 0
	bne _081E2012
	movs r1, 0x1
_081E1FFE:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bhi _081E2012
	adds r0, r3, 0
	asrs r0, r2
	ands r0, r1
	cmp r0, 0
	beq _081E1FFE
_081E2012:
	mov r0, r10
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _081E2024
	adds r1, 0xF
	b _081E202E
	.align 2, 0
_081E2020: .4byte _Str_RfuHeader
_081E2024:
	cmp r0, 0
	bne _081E2030
	adds r0, r2, 0
	adds r0, 0x10
	adds r1, r0
_081E202E:
	mov r9, r1
_081E2030:
	mov r1, r10
	ldr r0, [r1]
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r4
	ldrb r4, [r0]
	mov r0, r9
	ldrb r0, [r0]
	cmp r8, r0
	bhi _081E2048
	cmp r8, r4
	bhi _081E204E
_081E2048:
	movs r0, 0xA0
	lsls r0, 3
	b _081E2166
_081E204E:
	ldr r1, _081E209C @ =0x04000208
	ldrh r0, [r1]
	str r0, [sp, 0x4]
	movs r7, 0
	strh r7, [r1]
	movs r0, 0x20
	ands r0, r6
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _081E2068
	cmp r6, 0x40
	bne _081E2124
_081E2068:
	ldr r1, _081E20A0 @ =gUnknown_3007450
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	mov r12, r0
	movs r1, 0
	strh r1, [r0, 0x18]
	mov r1, r12
	adds r1, 0x2D
	mov r2, r12
	str r1, [r2, 0x4]
	movs r0, 0x7
	str r0, [r2, 0x14]
	mov r0, r12
	adds r0, 0x2C
	strb r3, [r0]
	strb r3, [r2, 0x1A]
	mov r2, r8
	subs r0, r2, r4
	mov r2, r12
	strh r0, [r2, 0x2E]
	cmp r5, 0
	beq _081E20A4
	strb r7, [r1]
	b _081E20A8
	.align 2, 0
_081E209C: .4byte 0x04000208
_081E20A0: .4byte gUnknown_3007450
_081E20A4:
	movs r0, 0x1
	strb r0, [r1]
_081E20A8:
	ldr r0, [sp, 0x28]
	mov r1, r12
	str r0, [r1, 0x30]
	ldr r2, [sp]
	str r2, [r1, 0x28]
	movs r1, 0
	mov r0, r12
	strb r1, [r0, 0x1F]
	adds r0, 0x20
	strb r1, [r0]
	mov r4, r12
	adds r4, 0x1B
	movs r6, 0
	mov r2, r12
	adds r2, 0x21
	movs r5, 0x1
_081E20C8:
	adds r0, r4, r1
	strb r6, [r0]
	adds r0, r2, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _081E20C8
	movs r2, 0
	movs r5, 0x1
	ldr r4, _081E211C @ =gUnknown_3007450
	movs r1, 0
_081E20E2:
	adds r0, r3, 0
	asrs r0, r2
	ands r0, r5
	cmp r0, 0
	beq _081E20F4
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	strh r1, [r0, 0x2]
_081E20F4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E20E2
	mov r1, r10
	ldr r2, [r1]
	ldrb r1, [r2, 0x4]
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2, 0x4]
	mov r2, r9
	ldrb r0, [r2]
	mov r1, r8
	subs r0, r1
	strb r0, [r2]
	ldr r0, _081E2120 @ =0x00008021
	mov r2, r12
	strh r0, [r2]
	b _081E215C
	.align 2, 0
_081E211C: .4byte gUnknown_3007450
_081E2120: .4byte 0x00008021
_081E2124:
	movs r0, 0x10
	ands r0, r6
	cmp r0, 0
	beq _081E215C
	ldr r1, _081E2178 @ =gUnknown_3007440
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, [r0]
	strb r3, [r1, 0x3]
	ldr r0, [sp]
	str r0, [r1, 0x8]
	mov r2, r8
	subs r0, r2, r4
	strh r0, [r1, 0x4]
	mov r2, r9
	ldrb r0, [r2]
	mov r2, r8
	subs r0, r2
	mov r2, r9
	strb r0, [r2]
	ldr r0, _081E217C @ =0x00008024
	strh r0, [r1]
	mov r0, r10
	ldr r2, [r0]
	ldrb r1, [r2, 0x6]
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2, 0x6]
_081E215C:
	ldr r0, _081E2180 @ =0x04000208
	mov r1, sp
	ldrh r1, [r1, 0x4]
	strh r1, [r0]
	movs r0, 0
_081E2166:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E2178: .4byte gUnknown_3007440
_081E217C: .4byte 0x00008024
_081E2180: .4byte 0x04000208
	thumb_func_end rfu_STC_setSendData_org

	thumb_func_start rfu_changeSendTarget
rfu_changeSendTarget: @ 81E2184
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r7, 0x3
	bls _081E21A8
	movs r0, 0x80
	lsls r0, 3
	b _081E22DC
_081E21A8:
	cmp r0, 0x20
	bne _081E2248
	ldr r0, _081E2238 @ =gUnknown_3007450
	mov r12, r0
	lsls r0, r7, 2
	add r0, r12
	ldr r5, [r0]
	ldrh r2, [r5]
	ldr r1, _081E223C @ =0x00008020
	adds r0, r1, 0
	ands r0, r2
	cmp r0, r1
	bne _081E225E
	ldrb r0, [r5, 0x1A]
	adds r3, r6, 0
	eors r3, r0
	adds r2, r3, 0
	ands r2, r6
	cmp r2, 0
	bne _081E2296
	cmp r3, 0
	bne _081E21D6
	b _081E22DA
_081E21D6:
	ldr r1, _081E2240 @ =0x04000208
	ldrh r0, [r1]
	mov r8, r0
	strh r2, [r1]
	movs r2, 0
	mvns r1, r3
	str r1, [sp]
	lsls r4, r6, 24
	mov r10, r4
	movs r0, 0x1
	mov r9, r0
	movs r1, 0
_081E21EE:
	adds r0, r3, 0
	asrs r0, r2
	mov r4, r9
	ands r0, r4
	cmp r0, 0
	beq _081E2202
	lsls r0, r2, 2
	add r0, r12
	ldr r0, [r0]
	strh r1, [r0, 0x2]
_081E2202:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E21EE
	ldr r0, _081E2244 @ =gUnknown_3007460
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	ldr r2, [sp]
	ands r2, r0
	strb r2, [r1, 0x4]
	strb r6, [r5, 0x1A]
	mov r0, r10
	cmp r0, 0
	bne _081E222E
	adds r0, r7, 0
	movs r1, 0
	adds r2, r5, 0
	bl rfu_STC_releaseFrame
	movs r0, 0x27
	strh r0, [r5]
_081E222E:
	ldr r0, _081E2240 @ =0x04000208
	mov r1, r8
	strh r1, [r0]
	b _081E22DA
	.align 2, 0
_081E2238: .4byte gUnknown_3007450
_081E223C: .4byte 0x00008020
_081E2240: .4byte 0x04000208
_081E2244: .4byte gUnknown_3007460
_081E2248:
	cmp r3, 0x10
	bne _081E22D4
	ldr r3, _081E2264 @ =gUnknown_3007440
	lsls r1, r7, 2
	adds r0, r1, r3
	ldr r0, [r0]
	ldrh r2, [r0]
	ldr r0, _081E2268 @ =0x00008024
	adds r5, r3, 0
	cmp r2, r0
	beq _081E2270
_081E225E:
	ldr r0, _081E226C @ =0x00000403
	b _081E22DC
	.align 2, 0
_081E2264: .4byte gUnknown_3007440
_081E2268: .4byte 0x00008024
_081E226C: .4byte 0x00000403
_081E2270:
	movs r3, 0
	movs r2, 0
	adds r4, r5, 0
_081E2276:
	cmp r2, r7
	beq _081E2284
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	orrs r3, r0
_081E2284:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _081E2276
	adds r2, r6, 0
	ands r2, r3
	cmp r2, 0
	beq _081E22A0
_081E2296:
	ldr r0, _081E229C @ =0x00000404
	b _081E22DC
	.align 2, 0
_081E229C: .4byte 0x00000404
_081E22A0:
	ldr r3, _081E22CC @ =0x04000208
	ldrh r0, [r3]
	mov r8, r0
	strh r2, [r3]
	ldr r4, _081E22D0 @ =gUnknown_3007460
	ldr r2, [r4]
	adds r5, r1, r5
	ldr r0, [r5]
	ldrb r1, [r0, 0x3]
	ldrb r0, [r2, 0x6]
	bics r0, r1
	strb r0, [r2, 0x6]
	ldr r2, [r4]
	ldrb r1, [r2, 0x6]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2, 0x6]
	ldr r0, [r5]
	strb r6, [r0, 0x3]
	mov r2, r8
	strh r2, [r3]
	b _081E22DA
	.align 2, 0
_081E22CC: .4byte 0x04000208
_081E22D0: .4byte gUnknown_3007460
_081E22D4:
	movs r0, 0xC0
	lsls r0, 3
	b _081E22DC
_081E22DA:
	movs r0, 0
_081E22DC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_changeSendTarget

	thumb_func_start rfu_NI_stopReceivingData
rfu_NI_stopReceivingData: @ 81E22EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _081E22FC
	movs r0, 0x80
	lsls r0, 3
	b _081E2356
_081E22FC:
	ldr r1, _081E2328 @ =gUnknown_3007450
	lsls r0, r3, 2
	adds r0, r1
	ldr r2, [r0]
	adds r5, r2, 0
	adds r5, 0x34
	ldr r1, _081E232C @ =0x04000208
	ldrh r0, [r1]
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r1]
	ldrh r1, [r2, 0x34]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081E2350
	ldr r0, _081E2330 @ =0x00008043
	cmp r1, r0
	bne _081E2334
	movs r0, 0x48
	b _081E2336
	.align 2, 0
_081E2328: .4byte gUnknown_3007450
_081E232C: .4byte 0x04000208
_081E2330: .4byte 0x00008043
_081E2334:
	movs r0, 0x47
_081E2336:
	strh r0, [r2, 0x34]
	ldr r0, _081E235C @ =gUnknown_3007460
	ldr r2, [r0]
	movs r1, 0x1
	lsls r1, r3
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
	adds r0, r3, 0
	movs r1, 0x1
	adds r2, r5, 0
	bl rfu_STC_releaseFrame
_081E2350:
	ldr r0, _081E2360 @ =0x04000208
	strh r4, [r0]
	movs r0, 0
_081E2356:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081E235C: .4byte gUnknown_3007460
_081E2360: .4byte 0x04000208
	thumb_func_end rfu_NI_stopReceivingData

	thumb_func_start rfu_UNI_changeAndReadySendData
rfu_UNI_changeAndReadySendData: @ 81E2364
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r2, 24
	lsrs r5, r2, 24
	cmp r0, 0x3
	bls _081E237C
	movs r0, 0x80
	lsls r0, 3
	b _081E23F0
_081E237C:
	ldr r1, _081E2390 @ =gUnknown_3007440
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	ldrh r1, [r4]
	ldr r0, _081E2394 @ =0x00008024
	cmp r1, r0
	beq _081E239C
	ldr r0, _081E2398 @ =0x00000403
	b _081E23F0
	.align 2, 0
_081E2390: .4byte gUnknown_3007440
_081E2394: .4byte 0x00008024
_081E2398: .4byte 0x00000403
_081E239C:
	ldr r0, _081E23B0 @ =gUnknown_3007460
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _081E23B4
	adds r6, r1, 0
	adds r6, 0xF
	ldrb r0, [r4, 0x4]
	ldrb r1, [r1, 0xF]
	b _081E23C2
	.align 2, 0
_081E23B0: .4byte gUnknown_3007460
_081E23B4:
	adds r0, r3, 0
	adds r0, 0x10
	adds r6, r1, r0
	adds r1, 0x10
	adds r1, r3
	ldrb r0, [r4, 0x4]
	ldrb r1, [r1]
_081E23C2:
	adds r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _081E23EC
	ldr r2, _081E23E8 @ =0x04000208
	ldrh r1, [r2]
	movs r0, 0
	strh r0, [r2]
	str r7, [r4, 0x8]
	subs r0, r3, r5
	strb r0, [r6]
	strh r5, [r4, 0x4]
	movs r0, 0x1
	strb r0, [r4, 0x2]
	strh r1, [r2]
	movs r0, 0
	b _081E23F0
	.align 2, 0
_081E23E8: .4byte 0x04000208
_081E23EC:
	movs r0, 0xA0
	lsls r0, 3
_081E23F0:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_UNI_changeAndReadySendData

	thumb_func_start rfu_UNI_readySendData
rfu_UNI_readySendData: @ 81E23F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _081E2416
	ldr r1, _081E241C @ =gUnknown_3007440
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	ldrh r1, [r2]
	ldr r0, _081E2420 @ =0x00008024
	cmp r1, r0
	bne _081E2416
	movs r0, 0x1
	strb r0, [r2, 0x2]
_081E2416:
	pop {r0}
	bx r0
	.align 2, 0
_081E241C: .4byte gUnknown_3007440
_081E2420: .4byte 0x00008024
	thumb_func_end rfu_UNI_readySendData

	thumb_func_start rfu_UNI_clearRecvNewDataFlag
rfu_UNI_clearRecvNewDataFlag: @ 81E2424
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _081E243A
	ldr r1, _081E2440 @ =gUnknown_3007440
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x12]
_081E243A:
	pop {r0}
	bx r0
	.align 2, 0
_081E2440: .4byte gUnknown_3007440
	thumb_func_end rfu_UNI_clearRecvNewDataFlag

	thumb_func_start rfu_REQ_sendData
rfu_REQ_sendData: @ 81E2444
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081E2490 @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r1, [r2]
	adds r4, r0, 0
	cmp r1, 0xFF
	bne _081E2458
	b _081E257E
_081E2458:
	cmp r1, 0x1
	bne _081E24E8
	ldrb r0, [r2, 0x4]
	ldrb r1, [r2, 0x5]
	adds r3, r0, 0
	orrs r3, r1
	ldrb r0, [r2, 0x6]
	orrs r3, r0
	cmp r3, 0
	bne _081E24E8
	ldr r0, _081E2494 @ =gUnknown_3007464
	ldr r2, [r0]
	ldrb r1, [r2, 0x3]
	adds r4, r0, 0
	cmp r1, 0
	beq _081E2480
	movs r0, 0x10
	strb r0, [r2, 0x8]
	ldr r0, [r4]
	strb r3, [r0, 0x7]
_081E2480:
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _081E2498
	subs r0, 0x1
	strb r0, [r1, 0x8]
	b _081E249E
	.align 2, 0
_081E2490: .4byte gUnknown_3007460
_081E2494: .4byte gUnknown_3007464
_081E2498:
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	strb r0, [r1, 0x7]
_081E249E:
	ldr r1, [r4]
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	bne _081E24B0
	ldrb r1, [r1, 0x7]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _081E2542
_081E24B0:
	ldr r4, _081E24D4 @ =gUnknown_3007468
	ldr r1, [r4]
	movs r0, 0x1
	str r0, [r1, 0x68]
	movs r0, 0xFF
	str r0, [r1, 0x78]
	ldr r0, _081E24D8 @ =sub_81E2630
	bl STWI_set_Callback_M
	cmp r5, 0
	bne _081E24DC
	ldr r0, [r4]
	adds r0, 0x68
	movs r1, 0x1
	bl STWI_send_DataTxREQ
	b _081E257E
	.align 2, 0
_081E24D4: .4byte gUnknown_3007468
_081E24D8: .4byte sub_81E2630
_081E24DC:
	ldr r0, [r4]
	adds r0, 0x68
	movs r1, 0x1
	bl STWI_send_DataTxAndChangeREQ
	b _081E257E
_081E24E8:
	ldr r0, [r4]
	ldrb r0, [r0, 0xE]
	cmp r0, 0
	bne _081E24F4
	bl rfu_constructSendLLFrame
_081E24F4:
	ldr r0, [r4]
	ldrb r0, [r0, 0xE]
	cmp r0, 0
	beq _081E2542
	ldr r0, _081E2520 @ =rfu_CB_sendData
	bl STWI_set_Callback_M
	cmp r5, 0
	beq _081E252C
	ldr r0, _081E2524 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0x68
	ldr r1, _081E2528 @ =gUnknown_3007464
	ldr r1, [r1]
	ldr r1, [r1, 0x24]
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl STWI_send_DataTxAndChangeREQ
	b _081E257E
	.align 2, 0
_081E2520: .4byte rfu_CB_sendData
_081E2524: .4byte gUnknown_3007468
_081E2528: .4byte gUnknown_3007464
_081E252C:
	ldr r0, _081E2564 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0x68
	ldr r1, _081E2568 @ =gUnknown_3007464
	ldr r1, [r1]
	ldr r1, [r1, 0x24]
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl STWI_send_DataTxREQ
_081E2542:
	cmp r5, 0
	beq _081E257E
	ldr r0, _081E256C @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E2574
	ldr r0, _081E2570 @ =gRfuState
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	cmp r1, 0
	beq _081E257E
	movs r0, 0x27
	bl _call_via_r1
	b _081E257E
	.align 2, 0
_081E2564: .4byte gUnknown_3007468
_081E2568: .4byte gUnknown_3007464
_081E256C: .4byte gUnknown_3007460
_081E2570: .4byte gRfuState
_081E2574:
	ldr r0, _081E2584 @ =rfu_CB_sendData2
	bl STWI_set_Callback_M
	bl STWI_send_MS_ChangeREQ
_081E257E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E2584: .4byte rfu_CB_sendData2
	thumb_func_end rfu_REQ_sendData

	thumb_func_start rfu_CB_sendData
rfu_CB_sendData: @ 81E2588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 16
	lsrs r7, r1, 16
	cmp r7, 0
	bne _081E25F2
	movs r6, 0
	ldr r0, _081E2610 @ =0x00008020
	mov r8, r0
_081E259C:
	ldr r0, _081E2614 @ =gUnknown_3007440
	lsls r2, r6, 2
	adds r0, r2, r0
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _081E25AE
	movs r0, 0
	strb r0, [r1, 0x2]
_081E25AE:
	ldr r0, _081E2618 @ =gUnknown_3007450
	adds r0, r2, r0
	ldr r4, [r0]
	ldrh r0, [r4]
	cmp r0, r8
	bne _081E25E8
	adds r0, r6, 0
	movs r1, 0
	adds r2, r4, 0
	bl rfu_STC_releaseFrame
	ldr r5, _081E261C @ =gUnknown_3007460
	ldr r2, [r5]
	ldrb r1, [r4, 0x1A]
	ldrb r0, [r2, 0x4]
	bics r0, r1
	strb r0, [r2, 0x4]
	adds r0, r4, 0
	adds r0, 0x2D
	ldrb r3, [r0]
	cmp r3, 0x1
	bne _081E25E4
	ldr r1, [r5]
	lsls r3, r6
	ldrb r0, [r1, 0x7]
	orrs r3, r0
	strb r3, [r1, 0x7]
_081E25E4:
	movs r0, 0x26
	strh r0, [r4]
_081E25E8:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _081E259C
_081E25F2:
	ldr r0, _081E261C @ =gUnknown_3007460
	ldr r1, [r0]
	ldrb r0, [r1, 0xE]
	movs r0, 0
	strb r0, [r1, 0xE]
	movs r0, 0x24
	adds r1, r7, 0
	bl rfu_STC_REQ_callback
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2610: .4byte 0x00008020
_081E2614: .4byte gUnknown_3007440
_081E2618: .4byte gUnknown_3007450
_081E261C: .4byte gUnknown_3007460
	thumb_func_end rfu_CB_sendData

	thumb_func_start rfu_CB_sendData2
rfu_CB_sendData2: @ 81E2620
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x24
	bl rfu_STC_REQ_callback
	pop {r0}
	bx r0
	thumb_func_end rfu_CB_sendData2

	thumb_func_start sub_81E2630
sub_81E2630: @ 81E2630
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0
	beq _081E2646
	movs r0, 0x24
	bl rfu_STC_REQ_callback
	b _081E2652
_081E2646:
	cmp r0, 0xFF
	bne _081E2652
	movs r0, 0xFF
	movs r1, 0
	bl rfu_STC_REQ_callback
_081E2652:
	pop {r0}
	bx r0
	thumb_func_end sub_81E2630

	thumb_func_start rfu_constructSendLLFrame
rfu_constructSendLLFrame: @ 81E2658
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _081E2704 @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _081E2670
	b _081E2774
_081E2670:
	ldrb r0, [r2, 0x4]
	ldrb r1, [r2, 0x5]
	orrs r0, r1
	ldrb r1, [r2, 0x6]
	orrs r0, r1
	cmp r0, 0
	beq _081E2774
	ldrb r0, [r2, 0xE]
	movs r0, 0
	strb r0, [r2, 0xE]
	mov r8, r0
	ldr r0, _081E2708 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0x6C
	str r0, [sp]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	mov r9, r0
	ldr r1, _081E270C @ =0x00008024
	mov r10, r1
_081E269A:
	movs r5, 0
	ldr r0, _081E2710 @ =gUnknown_3007450
	lsls r7, r6, 2
	adds r4, r7, r0
	ldr r2, [r4]
	ldrh r1, [r2]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _081E26BA
	adds r0, r6, 0
	mov r1, sp
	bl rfu_STC_NI_constructLLSF
	lsls r0, 16
	lsrs r5, r0, 16
_081E26BA:
	ldr r2, [r4]
	ldrh r1, [r2, 0x34]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _081E26D6
	adds r2, 0x34
	adds r0, r6, 0
	mov r1, sp
	bl rfu_STC_NI_constructLLSF
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
_081E26D6:
	ldr r0, _081E2714 @ =gUnknown_3007440
	adds r0, r7, r0
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, r10
	bne _081E26F0
	adds r0, r6, 0
	mov r1, sp
	bl rfu_STC_UNI_constructLLSF
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
_081E26F0:
	cmp r5, 0
	beq _081E2724
	ldr r0, _081E2704 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E2718
	add r8, r5
	b _081E2724
	.align 2, 0
_081E2704: .4byte gUnknown_3007460
_081E2708: .4byte gUnknown_3007468
_081E270C: .4byte 0x00008024
_081E2710: .4byte gUnknown_3007450
_081E2714: .4byte gUnknown_3007440
_081E2718:
	adds r0, r7, r6
	adds r0, 0x8
	lsls r5, r0
	mov r2, r8
	orrs r2, r5
	mov r8, r2
_081E2724:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _081E269A
	ldr r6, _081E2784 @ =gUnknown_3007464
	mov r0, r8
	cmp r0, 0
	beq _081E276E
	ldr r2, [sp]
	movs r0, 0x3
	ands r0, r2
	ldr r5, _081E2788 @ =gUnknown_3007460
	ldr r1, _081E278C @ =gUnknown_3007468
	cmp r0, 0
	beq _081E2756
	movs r4, 0
	movs r3, 0x3
_081E2748:
	strb r4, [r2]
	adds r0, r2, 0x1
	str r0, [sp]
	adds r2, r0, 0
	ands r0, r3
	cmp r0, 0
	bne _081E2748
_081E2756:
	ldr r0, [r1]
	mov r2, r8
	str r2, [r0, 0x68]
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, 0
	bne _081E276E
	ldr r0, [sp]
	subs r0, 0x6C
	ldr r1, [r1]
	subs r0, r1
	mov r8, r0
_081E276E:
	ldr r0, [r6]
	mov r1, r8
	str r1, [r0, 0x24]
_081E2774:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2784: .4byte gUnknown_3007464
_081E2788: .4byte gUnknown_3007460
_081E278C: .4byte gUnknown_3007468
	thumb_func_end rfu_constructSendLLFrame

	thumb_func_start rfu_STC_NI_constructLLSF
rfu_STC_NI_constructLLSF: @ 81E2790
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r12, r1
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r2, _081E280C @ =gUnknown_3007460
	ldr r0, [r2]
	ldrb r0, [r0]
	lsls r0, 4
	ldr r1, _081E2810 @ =_Str_RfuHeader
	adds r0, r1
	mov r8, r0
	ldrh r1, [r4]
	ldr r0, _081E2814 @ =0x00008022
	cmp r1, r0
	bne _081E27FA
	adds r3, r4, 0
	adds r3, 0x20
	ldrb r1, [r3]
	lsls r1, 2
	adds r5, r4, 0x4
	adds r1, r5, r1
	ldr r2, [r4, 0x28]
	ldr r0, [r4, 0x30]
	adds r2, r0
	ldr r0, [r1]
	adds r6, r3, 0
	cmp r0, r2
	bcc _081E27FA
	movs r7, 0
_081E27D8:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _081E27E8
	strb r7, [r6]
_081E27E8:
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r5, r1
	ldr r2, [r4, 0x28]
	ldr r0, [r4, 0x30]
	adds r2, r0
	ldr r0, [r1]
	cmp r0, r2
	bcs _081E27D8
_081E27FA:
	ldrh r1, [r4]
	movs r0, 0x40
	ands r0, r1
	mov r9, r1
	cmp r0, 0
	beq _081E2818
	movs r5, 0
	b _081E285C
	.align 2, 0
_081E280C: .4byte gUnknown_3007460
_081E2810: .4byte _Str_RfuHeader
_081E2814: .4byte 0x00008022
_081E2818:
	ldr r0, _081E2844 @ =0x00008022
	cmp r9, r0
	bne _081E284C
	adds r3, r4, 0
	adds r3, 0x20
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, r4, 0x4
	adds r1, r0
	ldrh r7, [r4, 0x2E]
	ldr r5, [r1]
	adds r2, r5, r7
	ldr r1, [r4, 0x28]
	ldr r0, [r4, 0x30]
	adds r0, r1, r0
	adds r6, r3, 0
	cmp r2, r0
	bls _081E2848
	subs r0, r5
	lsls r0, 16
	lsrs r5, r0, 16
	b _081E2860
	.align 2, 0
_081E2844: .4byte 0x00008022
_081E2848:
	adds r5, r7, 0
	b _081E2860
_081E284C:
	ldrh r2, [r4, 0x2E]
	ldr r0, [r4, 0x14]
	cmp r0, r2
	bcc _081E2858
	adds r5, r2, 0
	b _081E285C
_081E2858:
	lsls r0, 16
	lsrs r5, r0, 16
_081E285C:
	adds r6, r4, 0
	adds r6, 0x20
_081E2860:
	movs r3, 0xF
	mov r0, r9
	ands r3, r0
	mov r1, r8
	ldrb r1, [r1, 0x3]
	lsls r3, r1
	ldrb r0, [r4, 0x1F]
	mov r2, r8
	ldrb r2, [r2, 0x4]
	lsls r0, r2
	orrs r3, r0
	ldrb r1, [r6]
	adds r0, r1, 0
	mov r7, r8
	ldrb r7, [r7, 0x5]
	lsls r0, r7
	orrs r3, r0
	adds r0, r4, 0
	adds r0, 0x21
	adds r0, r1
	ldrb r0, [r0]
	mov r1, r8
	ldrb r1, [r1, 0x6]
	lsls r0, r1
	orrs r3, r0
	orrs r3, r5
	str r3, [sp]
	ldr r2, _081E291C @ =gUnknown_3007460
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E28A8
	ldrb r0, [r4, 0x1A]
	lsls r0, 18
	orrs r3, r0
	str r3, [sp]
_081E28A8:
	mov r2, sp
	movs r3, 0
	mov r7, r8
	ldrb r7, [r7]
	cmp r3, r7
	bcs _081E28D2
_081E28B4:
	mov r0, r12
	ldr r1, [r0]
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	mov r7, r12
	str r1, [r7]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	mov r0, r8
	ldrb r0, [r0]
	cmp r3, r0
	bcc _081E28B4
_081E28D2:
	cmp r5, 0
	beq _081E28F2
	ldrb r1, [r6]
	lsls r1, 2
	adds r0, r4, 0x4
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _081E2920 @ =gUnknown_3007468
	ldr r1, [r0]
	add r0, sp, 0x4
	ldr r3, [r1, 0x4]
	mov r1, r12
	adds r2, r5, 0
	bl _call_via_r3
_081E28F2:
	ldrh r1, [r4]
	ldr r0, _081E2924 @ =0x00008022
	cmp r1, r0
	bne _081E290C
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _081E290C
	movs r0, 0
	strb r0, [r6]
_081E290C:
	ldr r0, _081E291C @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r1, [r2]
	cmp r1, 0x1
	bne _081E2928
	ldrb r0, [r2, 0xE]
	strb r1, [r2, 0xE]
	b _081E2936
	.align 2, 0
_081E291C: .4byte gUnknown_3007460
_081E2920: .4byte gUnknown_3007468
_081E2924: .4byte 0x00008022
_081E2928:
	movs r0, 0x1
	mov r1, r10
	lsls r0, r1
	ldrb r1, [r2, 0xE]
	orrs r0, r1
	ldrb r1, [r2, 0xE]
	strb r0, [r2, 0xE]
_081E2936:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r5, r0
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_STC_NI_constructLLSF

	thumb_func_start rfu_STC_UNI_constructLLSF
rfu_STC_UNI_constructLLSF: @ 81E2950
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _081E2978 @ =gUnknown_3007440
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _081E2974
	ldrb r0, [r4, 0x3]
	cmp r0, 0
	bne _081E297C
_081E2974:
	movs r0, 0
	b _081E2A18
	.align 2, 0
_081E2978: .4byte gUnknown_3007440
_081E297C:
	ldr r0, _081E29F4 @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r0, [r2]
	lsls r0, 4
	ldr r1, _081E29F8 @ =_Str_RfuHeader
	adds r5, r0, r1
	ldrh r0, [r4]
	movs r1, 0xF
	ands r1, r0
	ldrb r0, [r5, 0x3]
	lsls r1, r0
	ldrh r0, [r4, 0x4]
	orrs r1, r0
	str r1, [sp]
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _081E29A6
	ldrb r0, [r4, 0x3]
	lsls r0, 18
	orrs r1, r0
	str r1, [sp]
_081E29A6:
	mov r2, sp
	movs r3, 0
	ldr r1, _081E29FC @ =gUnknown_3007468
	mov r12, r1
	add r7, sp, 0x4
	ldrb r0, [r5]
	cmp r3, r0
	bcs _081E29CE
_081E29B6:
	ldr r1, [r6]
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	str r1, [r6]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r1, [r5]
	cmp r3, r1
	bcc _081E29B6
_081E29CE:
	ldr r0, [r4, 0x8]
	str r0, [sp, 0x4]
	mov r2, r12
	ldr r0, [r2]
	ldrh r2, [r4, 0x4]
	ldr r3, [r0, 0x4]
	adds r0, r7, 0
	adds r1, r6, 0
	bl _call_via_r3
	ldr r0, _081E29F4 @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _081E2A00
	ldrb r0, [r2, 0xE]
	movs r0, 0x10
	b _081E2A0C
	.align 2, 0
_081E29F4: .4byte gUnknown_3007460
_081E29F8: .4byte _Str_RfuHeader
_081E29FC: .4byte gUnknown_3007468
_081E2A00:
	movs r0, 0x10
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r2, 0xE]
	orrs r0, r1
	ldrb r1, [r2, 0xE]
_081E2A0C:
	strb r0, [r2, 0xE]
	ldrh r0, [r4, 0x4]
	ldrb r5, [r5]
	adds r0, r5
	lsls r0, 16
	lsrs r0, 16
_081E2A18:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end rfu_STC_UNI_constructLLSF

	thumb_func_start rfu_REQ_recvData
rfu_REQ_recvData: @ 81E2A24
	push {r4,lr}
	ldr r0, _081E2A58 @ =gUnknown_3007460
	ldr r4, [r0]
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _081E2A50
	ldr r2, _081E2A5C @ =gUnknown_3007464
	ldr r3, [r2]
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	orrs r0, r1
	ldrb r1, [r4, 0x6]
	orrs r0, r1
	movs r1, 0
	strb r0, [r3, 0x3]
	ldr r0, [r2]
	strb r1, [r0, 0x4]
	ldr r0, _081E2A60 @ =rfu_CB_recvData
	bl STWI_set_Callback_M
	bl STWI_send_DataRxREQ
_081E2A50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081E2A58: .4byte gUnknown_3007460
_081E2A5C: .4byte gUnknown_3007464
_081E2A60: .4byte rfu_CB_recvData
	thumb_func_end rfu_REQ_recvData

	thumb_func_start rfu_CB_recvData
rfu_CB_recvData: @ 81E2A64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r7, r1, 16
	cmp r7, 0
	bne _081E2B28
	ldr r0, _081E2AA0 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _081E2B28
	ldr r0, _081E2AA4 @ =gUnknown_3007464
	ldr r0, [r0]
	strb r7, [r0, 0x1]
	ldr r0, _081E2AA8 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E2AAC
	bl rfu_STC_PARENT_analyzeRecvPacket
	b _081E2AB0
	.align 2, 0
_081E2AA0: .4byte gUnknown_3007468
_081E2AA4: .4byte gUnknown_3007464
_081E2AA8: .4byte gUnknown_3007460
_081E2AAC:
	bl rfu_STC_CHILD_analyzeRecvPacket
_081E2AB0:
	movs r6, 0
	ldr r0, _081E2B40 @ =0x00008043
	mov r8, r0
	ldr r3, _081E2B44 @ =gUnknown_3007460
_081E2AB8:
	ldr r0, _081E2B48 @ =gUnknown_3007450
	lsls r1, r6, 2
	adds r1, r0
	ldr r4, [r1]
	ldrh r0, [r4, 0x34]
	cmp r0, r8
	bne _081E2B0A
	ldr r0, _081E2B4C @ =gUnknown_3007464
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	asrs r0, r6
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081E2B0A
	adds r5, r4, 0
	adds r5, 0x34
	adds r0, r4, 0
	adds r0, 0x61
	ldrb r2, [r0]
	cmp r2, 0x1
	bne _081E2AEE
	ldr r1, [r3]
	lsls r2, r6
	ldrb r0, [r1, 0x7]
	orrs r2, r0
	strb r2, [r1, 0x7]
_081E2AEE:
	adds r0, r6, 0
	movs r1, 0x1
	adds r2, r5, 0
	str r3, [sp]
	bl rfu_STC_releaseFrame
	ldr r3, [sp]
	ldr r2, [r3]
	ldrb r1, [r5, 0x1A]
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x46
	strh r0, [r4, 0x34]
_081E2B0A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _081E2AB8
	ldr r0, _081E2B4C @ =gUnknown_3007464
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081E2B28
	adds r7, r0, 0
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1, 0
	orrs r7, r0
_081E2B28:
	mov r0, r9
	adds r1, r7, 0
	bl rfu_STC_REQ_callback
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2B40: .4byte 0x00008043
_081E2B44: .4byte gUnknown_3007460
_081E2B48: .4byte gUnknown_3007450
_081E2B4C: .4byte gUnknown_3007464
	thumb_func_end rfu_CB_recvData

	thumb_func_start rfu_STC_PARENT_analyzeRecvPacket
rfu_STC_PARENT_analyzeRecvPacket: @ 81E2B50
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _081E2BE0 @ =gUnknown_3007468
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsrs r3, r0, 8
	movs r5, 0
	mov r12, r1
	movs r7, 0x1F
	ldr r4, _081E2BE4 @ =gUnknown_3007464
	movs r6, 0x1
_081E2B6A:
	mov r0, sp
	adds r1, r0, r5
	adds r0, r3, 0
	ands r0, r7
	strb r0, [r1]
	lsrs r3, 5
	cmp r0, 0
	bne _081E2B86
	ldr r0, [r4]
	adds r1, r6, 0
	lsls r1, r5
	ldrb r2, [r0, 0x1]
	orrs r1, r2
	strb r1, [r0, 0x1]
_081E2B86:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E2B6A
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0xDC
	ldr r0, [r0]
	adds r6, r0, 0
	adds r6, 0x8
	movs r5, 0
_081E2B9E:
	mov r0, sp
	adds r1, r0, r5
	ldrb r0, [r1]
	adds r7, r5, 0x1
	cmp r0, 0
	beq _081E2BD0
	adds r4, r1, 0
_081E2BAC:
	ldrb r2, [r4]
	adds r0, r5, 0
	adds r1, r6, 0
	bl rfu_STC_analyzeLLSF
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0
	ldrb r1, [r4]
	subs r1, r0
	strb r1, [r4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081E2BD0
	lsls r0, r1, 24
	cmp r0, 0
	bne _081E2BAC
_081E2BD0:
	lsls r0, r7, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081E2B9E
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2BE0: .4byte gUnknown_3007468
_081E2BE4: .4byte gUnknown_3007464
	thumb_func_end rfu_STC_PARENT_analyzeRecvPacket

	thumb_func_start rfu_STC_CHILD_analyzeRecvPacket
rfu_STC_CHILD_analyzeRecvPacket: @ 81E2BE8
	push {r4-r6,lr}
	ldr r0, _081E2C38 @ =gUnknown_3007468
	ldr r0, [r0]
	adds r0, 0xDC
	ldr r1, [r0]
	ldrh r0, [r1, 0x4]
	movs r4, 0x7F
	ands r4, r0
	adds r5, r1, 0
	adds r5, 0x8
	cmp r4, 0
	bne _081E2C08
	ldr r0, _081E2C3C @ =gUnknown_3007464
	ldr r1, [r0]
	movs r0, 0xF
	strb r0, [r1, 0x1]
_081E2C08:
	movs r0, 0x80
	lsls r0, 8
	adds r6, r0, 0
_081E2C0E:
	cmp r4, 0
	beq _081E2C30
	movs r0, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl rfu_STC_analyzeLLSF
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	ands r0, r6
	cmp r0, 0
	beq _081E2C0E
_081E2C30:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081E2C38: .4byte gUnknown_3007468
_081E2C3C: .4byte gUnknown_3007464
	thumb_func_end rfu_STC_CHILD_analyzeRecvPacket

	thumb_func_start rfu_STC_analyzeLLSF
rfu_STC_analyzeLLSF: @ 81E2C40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r2, 16
	lsrs r3, r2, 16
	ldr r2, _081E2C74 @ =gUnknown_3007460
	ldr r0, [r2]
	ldrb r0, [r0]
	mvns r0, r0
	movs r1, 0x1
	ands r0, r1
	lsls r0, 4
	ldr r1, _081E2C78 @ =_Str_RfuHeader
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r3, r0
	bcs _081E2C7C
	adds r0, r3, 0
	b _081E2E6E
	.align 2, 0
_081E2C74: .4byte gUnknown_3007460
_081E2C78: .4byte _Str_RfuHeader
_081E2C7C:
	movs r5, 0
	movs r4, 0
	ldrb r3, [r6, 0x1]
	ldrb r1, [r6, 0x7]
	mov r8, r1
	ldr r2, [sp]
	mov r9, r2
	cmp r4, r0
	bcs _081E2CA4
	adds r2, r0, 0
_081E2C90:
	ldrb r0, [r7]
	lsls r1, r4, 3
	lsls r0, r1
	orrs r5, r0
	adds r7, 0x1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r2
	bcc _081E2C90
_081E2CA4:
	adds r0, r5, 0
	lsrs r0, r3
	mov r3, r8
	ands r0, r3
	ldr r1, _081E2D7C @ =0xffffff00
	mov r10, r1
	mov r3, r10
	mov r2, r9
	ands r3, r2
	orrs r3, r0
	str r3, [sp]
	adds r0, r5, 0
	ldrb r1, [r6, 0x2]
	lsrs r0, r1
	ldrb r1, [r6, 0x8]
	ands r0, r1
	lsls r0, 8
	ldr r4, _081E2D80 @ =0xffff00ff
	adds r2, r4, 0
	ands r2, r3
	orrs r2, r0
	str r2, [sp]
	adds r0, r5, 0
	ldrb r3, [r6, 0x3]
	lsrs r0, r3
	ldrb r1, [r6, 0x9]
	ands r0, r1
	lsls r0, 16
	ldr r3, _081E2D84 @ =0xff00ffff
	ands r3, r2
	orrs r3, r0
	str r3, [sp]
	adds r0, r5, 0
	ldrb r1, [r6, 0x4]
	lsrs r0, r1
	ldrb r1, [r6, 0xA]
	ands r0, r1
	lsls r0, 24
	ldr r2, _081E2D88 @ =0x00ffffff
	mov r8, r2
	mov r1, r8
	ands r1, r3
	orrs r1, r0
	mov r8, r1
	str r1, [sp]
	adds r1, r5, 0
	ldrb r2, [r6, 0x5]
	lsrs r1, r2
	ldrb r0, [r6, 0xB]
	ands r1, r0
	mov r9, sp
	ldr r2, [sp, 0x4]
	mov r3, r10
	ands r2, r3
	orrs r2, r1
	str r2, [sp, 0x4]
	adds r0, r5, 0
	ldrb r1, [r6, 0x6]
	lsrs r0, r1
	ldrb r1, [r6, 0xC]
	ands r0, r1
	lsls r0, 8
	ands r4, r2
	orrs r4, r0
	str r4, [sp, 0x4]
	ldrh r0, [r6, 0xE]
	ands r5, r0
	lsls r1, r5, 16
	ldr r0, _081E2D8C @ =0x0000ffff
	ands r0, r4
	orrs r0, r1
	str r0, [sp, 0x4]
	lsrs r0, 16
	ldrb r6, [r6]
	adds r0, r6
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	beq _081E2D4A
	b _081E2E6C
_081E2D4A:
	ldr r2, _081E2D90 @ =gUnknown_3007460
	ldr r3, [r2]
	ldrb r2, [r3]
	cmp r2, 0x1
	bne _081E2E08
	ldrb r0, [r3, 0x2]
	mov r5, r12
	asrs r0, r5
	ands r0, r2
	cmp r0, 0
	bne _081E2D62
	b _081E2E6C
_081E2D62:
	mov r1, r8
	lsrs r0, r1, 16
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _081E2D94
	mov r0, r12
	mov r1, sp
	adds r2, r7, 0
	bl rfu_STC_UNI_receive
	b _081E2E6C
	.align 2, 0
_081E2D7C: .4byte 0xffffff00
_081E2D80: .4byte 0xffff00ff
_081E2D84: .4byte 0xff00ffff
_081E2D88: .4byte 0x00ffffff
_081E2D8C: .4byte 0x0000ffff
_081E2D90: .4byte gUnknown_3007460
_081E2D94:
	mov r5, r9
	ldrb r0, [r5, 0x3]
	cmp r0, 0
	bne _081E2DA8
	mov r0, r12
	mov r1, sp
	adds r2, r7, 0
	bl rfu_STC_NI_receive_Receiver
	b _081E2E6C
_081E2DA8:
	movs r4, 0
	ldr r1, _081E2DC0 @ =gUnknown_3007450
	ldr r0, [r1]
	ldrb r0, [r0, 0x1A]
	mov r5, r12
	asrs r0, r5
	ands r0, r2
	cmp r0, 0
	beq _081E2DC4
	ldrb r0, [r3, 0x4]
	b _081E2DEA
	.align 2, 0
_081E2DC0: .4byte gUnknown_3007450
_081E2DC4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bhi _081E2E6C
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, 0x1A]
	mov r2, r12
	asrs r0, r2
	movs r2, 0x1
	ands r0, r2
	cmp r0, 0
	beq _081E2DC4
	ldr r3, _081E2E04 @ =gUnknown_3007460
	ldr r0, [r3]
	ldrb r0, [r0, 0x4]
	mov r5, r12
_081E2DEA:
	asrs r0, r5
	ands r0, r2
	cmp r0, 0
	beq _081E2DC4
	cmp r4, 0x3
	bhi _081E2E6C
	adds r0, r4, 0
	mov r1, r12
	mov r2, sp
	adds r3, r7, 0
	bl rfu_STC_NI_receive_Sender
	b _081E2E6C
	.align 2, 0
_081E2E04: .4byte gUnknown_3007460
_081E2E08:
	ldrb r1, [r3, 0x2]
	mov r2, r9
	ldrb r0, [r2, 0x1]
	adds r5, r1, 0
	ands r5, r0
	cmp r5, 0
	beq _081E2E6C
	movs r4, 0
	movs r6, 0x1
_081E2E1A:
	adds r0, r5, 0
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _081E2E62
	mov r1, sp
	ldrb r0, [r1, 0x2]
	cmp r0, 0x4
	bne _081E2E36
	adds r0, r4, 0
	adds r2, r7, 0
	bl rfu_STC_UNI_receive
	b _081E2E62
_081E2E36:
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _081E2E48
	adds r0, r4, 0
	mov r1, sp
	adds r2, r7, 0
	bl rfu_STC_NI_receive_Receiver
	b _081E2E62
_081E2E48:
	ldr r0, _081E2E80 @ =gUnknown_3007460
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	asrs r0, r4
	ands r0, r6
	cmp r0, 0
	beq _081E2E62
	adds r0, r4, 0
	adds r1, r4, 0
	mov r2, sp
	adds r3, r7, 0
	bl rfu_STC_NI_receive_Sender
_081E2E62:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E2E1A
_081E2E6C:
	mov r0, r10
_081E2E6E:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E2E80: .4byte gUnknown_3007460
	thumb_func_end rfu_STC_analyzeLLSF

	thumb_func_start rfu_STC_UNI_receive
rfu_STC_UNI_receive: @ 81E2E84
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r1, 0
	str r2, [sp]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _081E2EB8 @ =gUnknown_3007440
	lsls r1, r7, 2
	adds r1, r2
	ldr r3, [r1]
	adds r5, r3, 0
	adds r5, 0xC
	movs r4, 0
	movs r0, 0
	strh r0, [r5, 0x2]
	ldr r0, [r1]
	ldr r0, [r0, 0x18]
	adds r1, r2, 0
	ldrh r2, [r6, 0x6]
	cmp r0, r2
	bcs _081E2EC0
	movs r0, 0x49
	strh r0, [r3, 0xC]
	ldr r0, _081E2EBC @ =0x00000701
	strh r0, [r5, 0x2]
	b _081E2F0E
	.align 2, 0
_081E2EB8: .4byte gUnknown_3007440
_081E2EBC: .4byte 0x00000701
_081E2EC0:
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _081E2ED8
	ldrb r0, [r5, 0x6]
	cmp r0, 0
	beq _081E2EE4
	ldr r0, _081E2ED4 @ =0x00000709
	strh r0, [r5, 0x2]
	b _081E2F0E
	.align 2, 0
_081E2ED4: .4byte 0x00000709
_081E2ED8:
	ldrb r0, [r5, 0x6]
	cmp r0, 0
	beq _081E2EE4
	movs r0, 0xE1
	lsls r0, 3
	strh r0, [r5, 0x2]
_081E2EE4:
	movs r4, 0
	ldr r0, _081E2F2C @ =0x00008042
	strh r0, [r5]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x4]
	ldrh r2, [r6, 0x6]
	lsls r0, r7, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	str r0, [sp, 0x4]
	ldr r0, _081E2F30 @ =gUnknown_3007468
	ldr r0, [r0]
	add r1, sp, 0x4
	ldr r3, [r0, 0x4]
	mov r0, sp
	bl _call_via_r3
	movs r0, 0x1
	strb r0, [r5, 0x6]
	strh r4, [r5]
_081E2F0E:
	ldrh r0, [r5, 0x2]
	cmp r0, 0
	beq _081E2F22
	ldr r0, _081E2F34 @ =gUnknown_3007464
	ldr r2, [r0]
	movs r0, 0x10
	lsls r0, r7
	ldrb r1, [r2, 0x4]
	orrs r0, r1
	strb r0, [r2, 0x4]
_081E2F22:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E2F2C: .4byte 0x00008042
_081E2F30: .4byte gUnknown_3007468
_081E2F34: .4byte gUnknown_3007464
	thumb_func_end rfu_STC_UNI_receive

	thumb_func_start rfu_STC_NI_receive_Sender
rfu_STC_NI_receive_Sender: @ 81E2F38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r2, 0
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r1, _081E3004 @ =gUnknown_3007450
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	mov r12, r0
	ldrh r0, [r0]
	mov r9, r0
	mov r0, r12
	adds r0, 0x21
	ldrb r2, [r6, 0x4]
	adds r0, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldrb r2, [r6, 0x2]
	cmp r2, 0x2
	bne _081E2F74
	ldr r0, _081E3008 @ =0x00008022
	cmp r9, r0
	beq _081E2F8E
_081E2F74:
	cmp r2, 0x1
	bne _081E2F7E
	ldr r0, _081E300C @ =0x00008021
	cmp r9, r0
	beq _081E2F8E
_081E2F7E:
	movs r3, 0x1B
	add r3, r12
	mov r8, r3
	cmp r2, 0x3
	bne _081E2FB2
	ldr r0, _081E3010 @ =0x00008023
	cmp r9, r0
	bne _081E2FB2
_081E2F8E:
	ldrb r1, [r6, 0x4]
	mov r0, r12
	adds r0, 0x21
	adds r0, r1
	ldrb r0, [r0]
	movs r7, 0x1B
	add r7, r12
	mov r8, r7
	ldrb r2, [r6, 0x5]
	cmp r0, r2
	bne _081E2FB2
	adds r0, r7, r1
	movs r1, 0x1
	mov r3, r10
	lsls r1, r3
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_081E2FB2:
	ldrb r2, [r6, 0x4]
	mov r7, r8
	adds r0, r7, r2
	ldrb r0, [r0]
	mov r3, r12
	ldrb r1, [r3, 0x1A]
	ands r0, r1
	cmp r0, r1
	bne _081E30AE
	adds r3, 0x21
	adds r2, r3, r2
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	movs r1, 0
	strb r0, [r2]
	ldrb r0, [r6, 0x4]
	add r0, r8
	strb r1, [r0]
	mov r7, r12
	ldrh r1, [r7]
	ldr r2, _081E3014 @ =0x00007fdf
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	adds r5, r3, 0
	cmp r0, 0x1
	bhi _081E30A0
	ldr r0, _081E300C @ =0x00008021
	cmp r1, r0
	bne _081E3018
	ldrb r1, [r6, 0x4]
	lsls r1, 2
	subs r3, 0x1D
	adds r1, r3, r1
	ldrh r2, [r7, 0x2E]
	ldr r0, [r1]
	adds r0, r2
	str r0, [r1]
	b _081E302E
	.align 2, 0
_081E3004: .4byte gUnknown_3007450
_081E3008: .4byte 0x00008022
_081E300C: .4byte 0x00008021
_081E3010: .4byte 0x00008023
_081E3014: .4byte 0x00007fdf
_081E3018:
	ldrb r2, [r6, 0x4]
	lsls r2, 2
	mov r3, r12
	adds r3, 0x4
	adds r2, r3, r2
	mov r7, r12
	ldrh r1, [r7, 0x2E]
	lsls r1, 2
	ldr r0, [r2]
	adds r0, r1
	str r0, [r2]
_081E302E:
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	ldr r0, [r0, 0x14]
	subs r0, r1
	mov r1, r12
	str r0, [r1, 0x14]
	cmp r0, 0
	beq _081E3042
	cmp r0, 0
	bge _081E30AE
_081E3042:
	mov r0, r12
	adds r0, 0x20
	movs r2, 0
	strb r2, [r0]
	mov r7, r12
	ldrh r1, [r7]
	ldr r0, _081E3084 @ =0x00008021
	cmp r1, r0
	bne _081E308C
	movs r4, 0
_081E3056:
	adds r0, r5, r4
	movs r1, 0x1
	strb r1, [r0]
	lsls r1, r4, 2
	adds r1, r3, r1
	mov r2, r12
	ldrh r0, [r2, 0x2E]
	adds r2, r0, 0
	muls r2, r4
	mov r7, r12
	ldr r0, [r7, 0x28]
	adds r0, r2
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081E3056
	ldr r0, [r7, 0x30]
	str r0, [r7, 0x14]
	ldr r0, _081E3088 @ =0x00008022
	strh r0, [r7]
	b _081E30AE
	.align 2, 0
_081E3084: .4byte 0x00008021
_081E3088: .4byte 0x00008022
_081E308C:
	strb r2, [r5]
	mov r0, r12
	str r2, [r0, 0x14]
	ldr r0, _081E309C @ =0x00008023
	mov r1, r12
	strh r0, [r1]
	b _081E30AE
	.align 2, 0
_081E309C: .4byte 0x00008023
_081E30A0:
	lsls r1, 16
	ldr r0, _081E3110 @ =0x80230000
	cmp r1, r0
	bne _081E30AE
	ldr r0, _081E3114 @ =0x00008020
	mov r2, r12
	strh r0, [r2]
_081E30AE:
	mov r3, r12
	ldrh r0, [r3]
	cmp r0, r9
	bne _081E30D8
	ldrb r2, [r6, 0x4]
	mov r0, r12
	adds r0, 0x21
	adds r0, r2
	ldrb r0, [r0]
	ldr r7, [sp]
	cmp r0, r7
	bne _081E30D8
	mov r1, r8
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r2, r10
	asrs r0, r2
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081E30FE
_081E30D8:
	ldr r4, _081E3118 @ =0x04000208
	ldrh r2, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r0, _081E311C @ =gUnknown_3007464
	ldr r3, [r0]
	movs r0, 0x10
	mov r7, r10
	lsls r0, r7
	ldrb r1, [r3, 0x2]
	orrs r0, r1
	movs r1, 0
	strb r0, [r3, 0x2]
	lsls r0, r7, 2
	ldr r3, _081E3120 @ =gUnknown_3007450
	adds r0, r3
	ldr r0, [r0]
	strh r1, [r0, 0x2]
	strh r2, [r4]
_081E30FE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E3110: .4byte 0x80230000
_081E3114: .4byte 0x00008020
_081E3118: .4byte 0x04000208
_081E311C: .4byte gUnknown_3007464
_081E3120: .4byte gUnknown_3007450
	thumb_func_end rfu_STC_NI_receive_Sender

	thumb_func_start rfu_STC_NI_receive_Receiver
rfu_STC_NI_receive_Receiver: @ 81E3124
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r1, 0
	str r2, [sp]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	ldr r1, _081E3184 @ =gUnknown_3007450
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	adds r5, r4, 0
	adds r5, 0x34
	ldrh r0, [r4, 0x34]
	mov r9, r0
	ldrb r0, [r6, 0x4]
	adds r3, r4, 0
	adds r3, 0x55
	adds r0, r3, r0
	ldrb r0, [r0]
	mov r10, r0
	ldrb r0, [r6, 0x2]
	cmp r0, 0x3
	bne _081E3194
	ldr r0, _081E3188 @ =gUnknown_3007464
	ldr r2, [r0]
	movs r0, 0x1
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r2, 0x1]
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrh r1, [r4, 0x34]
	ldr r0, _081E318C @ =0x00008042
	cmp r1, r0
	bne _081E31DA
	adds r0, r4, 0
	adds r0, 0x54
	strb r7, [r0]
	strb r7, [r3]
	ldr r0, _081E3190 @ =0x00008043
	strh r0, [r4, 0x34]
	b _081E31DA
	.align 2, 0
_081E3184: .4byte gUnknown_3007450
_081E3188: .4byte gUnknown_3007464
_081E318C: .4byte 0x00008042
_081E3190: .4byte 0x00008043
_081E3194:
	cmp r0, 0x2
	bne _081E31C0
	ldr r0, _081E31B8 @ =0x00008041
	cmp r9, r0
	bne _081E31AC
	ldr r0, [r5, 0x14]
	cmp r0, 0
	bne _081E31AC
	mov r0, r8
	adds r1, r5, 0
	bl rfu_STC_NI_initSlot_asRecvDataEntity
_081E31AC:
	ldrh r1, [r5]
	ldr r0, _081E31BC @ =0x00008042
	cmp r1, r0
	bne _081E31DA
	b _081E31DE
	.align 2, 0
_081E31B8: .4byte 0x00008041
_081E31BC: .4byte 0x00008042
_081E31C0:
	cmp r0, 0x1
	bne _081E31DA
	ldr r7, _081E328C @ =0x00008041
	cmp r9, r7
	beq _081E31DE
	mov r0, r8
	adds r1, r5, 0
	bl rfu_STC_NI_initSlot_asRecvControllData
	ldrh r0, [r4, 0x34]
	cmp r0, r7
	bne _081E327A
	movs r7, 0x1
_081E31DA:
	cmp r7, 0
	beq _081E3234
_081E31DE:
	ldrb r2, [r6, 0x5]
	ldrb r3, [r6, 0x4]
	adds r4, r5, 0
	adds r4, 0x21
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	cmp r2, r0
	bne _081E3234
	ldr r0, _081E3290 @ =gUnknown_3007468
	ldr r0, [r0]
	lsls r1, r3, 2
	adds r1, 0x4
	adds r1, r5, r1
	ldrh r2, [r6, 0x6]
	ldr r3, [r0, 0x4]
	mov r0, sp
	bl _call_via_r3
	ldrh r1, [r5]
	ldr r0, _081E3294 @ =0x00008042
	cmp r1, r0
	bne _081E3224
	ldrb r0, [r6, 0x4]
	lsls r0, 2
	adds r2, r5, 0x4
	adds r2, r0
	ldrh r0, [r5, 0x2E]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, [r2]
	adds r0, r1
	str r0, [r2]
_081E3224:
	ldrh r1, [r6, 0x6]
	ldr r0, [r5, 0x14]
	subs r0, r1
	str r0, [r5, 0x14]
	ldrb r0, [r6, 0x4]
	adds r0, r4, r0
	ldrb r1, [r6, 0x5]
	strb r1, [r0]
_081E3234:
	ldrh r0, [r5, 0x18]
	cmp r0, 0
	bne _081E327A
	ldrb r0, [r6, 0x4]
	adds r1, r5, 0
	adds r1, 0x20
	strb r0, [r1]
	ldrh r0, [r5]
	cmp r0, r9
	bne _081E325C
	adds r0, r5, 0
	adds r0, 0x21
	ldrb r2, [r6, 0x4]
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, r10
	bne _081E325C
	ldrb r6, [r6, 0x5]
	cmp r0, r6
	bne _081E327A
_081E325C:
	ldr r3, _081E3298 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r0, _081E329C @ =gUnknown_3007464
	ldr r4, [r0]
	movs r0, 0x1
	mov r1, r8
	lsls r0, r1
	ldrb r1, [r4, 0x2]
	orrs r0, r1
	movs r1, 0
	strb r0, [r4, 0x2]
	strh r1, [r5, 0x2]
	strh r2, [r3]
_081E327A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E328C: .4byte 0x00008041
_081E3290: .4byte gUnknown_3007468
_081E3294: .4byte 0x00008042
_081E3298: .4byte 0x04000208
_081E329C: .4byte gUnknown_3007464
	thumb_func_end rfu_STC_NI_receive_Receiver

	thumb_func_start rfu_STC_NI_initSlot_asRecvControllData
rfu_STC_NI_initSlot_asRecvControllData: @ 81E32A0
	push {r4-r7,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081E32BC @ =gUnknown_3007460
	ldr r3, [r0]
	ldrb r1, [r3]
	mov r12, r0
	cmp r1, 0x1
	bne _081E32C0
	movs r5, 0x3
	adds r1, r3, 0
	adds r1, 0xF
	b _081E32C8
	.align 2, 0
_081E32BC: .4byte gUnknown_3007460
_081E32C0:
	movs r5, 0x2
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r3, r0
_081E32C8:
	movs r7, 0x1
	adds r0, r7, 0
	lsls r0, r4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r6, 0
	ldrh r3, [r2]
	cmp r3, 0
	bne _081E3326
	ldrb r0, [r1]
	cmp r0, r5
	bcs _081E3300
	movs r0, 0x49
	strh r0, [r2]
	ldr r0, _081E32F8 @ =0x00000702
	strh r0, [r2, 0x18]
	ldr r0, _081E32FC @ =gUnknown_3007464
	ldr r2, [r0]
	ldrb r1, [r2, 0x4]
	adds r0, r6, 0
	orrs r0, r1
	strb r0, [r2, 0x4]
	b _081E3326
	.align 2, 0
_081E32F8: .4byte 0x00000702
_081E32FC: .4byte gUnknown_3007464
_081E3300:
	strh r3, [r2, 0x18]
	ldrb r0, [r1]
	subs r0, r5
	strb r0, [r1]
	adds r0, r2, 0
	adds r0, 0x2D
	str r0, [r2, 0x4]
	movs r0, 0x7
	str r0, [r2, 0x14]
	strb r7, [r2, 0x1F]
	strh r3, [r2, 0x2E]
	strb r4, [r2, 0x1A]
	ldr r0, _081E332C @ =0x00008041
	strh r0, [r2]
	mov r0, r12
	ldr r1, [r0]
	ldrb r0, [r1, 0x5]
	orrs r4, r0
	strb r4, [r1, 0x5]
_081E3326:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E332C: .4byte 0x00008041
	thumb_func_end rfu_STC_NI_initSlot_asRecvControllData

	thumb_func_start rfu_STC_NI_initSlot_asRecvDataEntity
rfu_STC_NI_initSlot_asRecvDataEntity: @ 81E3330
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r0, 0x2D
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081E3354
	ldr r0, _081E3350 @ =gUnknown_3007460
	lsls r1, r5, 5
	adds r1, 0x14
	ldr r0, [r0]
	adds r0, r1
	adds r0, 0x4
	b _081E33AA
	.align 2, 0
_081E3350: .4byte gUnknown_3007460
_081E3354:
	ldr r1, _081E3398 @ =gUnknown_3007450
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	ldr r1, [r4, 0x30]
	ldr r0, [r2, 0x6C]
	cmp r1, r0
	bls _081E33A8
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r5
	lsrs r1, 24
	ldr r0, _081E339C @ =gUnknown_3007464
	ldr r3, [r0]
	ldrb r2, [r3, 0x4]
	adds r0, r1, 0
	orrs r0, r2
	strb r0, [r3, 0x4]
	ldr r0, _081E33A0 @ =gUnknown_3007460
	ldr r2, [r0]
	ldrb r0, [r2, 0x5]
	bics r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _081E33A4 @ =0x00000701
	strh r0, [r4, 0x18]
	movs r0, 0x47
	strh r0, [r4]
	adds r0, r5, 0
	movs r1, 0x1
	adds r2, r4, 0
	bl rfu_STC_releaseFrame
	b _081E33DC
	.align 2, 0
_081E3398: .4byte gUnknown_3007450
_081E339C: .4byte gUnknown_3007464
_081E33A0: .4byte gUnknown_3007460
_081E33A4: .4byte 0x00000701
_081E33A8:
	ldr r0, [r2, 0x68]
_081E33AA:
	str r0, [r4, 0x4]
	movs r3, 0
	adds r6, r4, 0
	adds r6, 0x21
	movs r7, 0
	adds r5, r4, 0x4
_081E33B6:
	adds r0, r6, r3
	strb r7, [r0]
	lsls r1, r3, 2
	adds r1, r5, r1
	ldrh r0, [r4, 0x2E]
	adds r2, r0, 0
	muls r2, r3
	ldr r0, [r4, 0x4]
	adds r0, r2
	str r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _081E33B6
	ldr r0, [r4, 0x30]
	str r0, [r4, 0x14]
	ldr r0, _081E33E4 @ =0x00008042
	strh r0, [r4]
_081E33DC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E33E4: .4byte 0x00008042
	thumb_func_end rfu_STC_NI_initSlot_asRecvDataEntity

	thumb_func_start rfu_NI_checkCommFailCounter
rfu_NI_checkCommFailCounter: @ 81E33E8
	push {r4-r7,lr}
	ldr r2, _081E3474 @ =gUnknown_3007460
	ldr r0, [r2]
	ldrb r1, [r0, 0x4]
	ldrb r0, [r0, 0x5]
	orrs r0, r1
	cmp r0, 0
	beq _081E346E
	ldr r1, _081E3478 @ =0x04000208
	ldrh r0, [r1]
	mov r12, r0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _081E347C @ =gUnknown_3007464
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	lsrs r7, r0, 4
	movs r3, 0
	adds r6, r1, 0
	adds r5, r2, 0
	ldr r4, _081E3480 @ =gUnknown_3007450
_081E3412:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r3
	lsrs r2, r0, 24
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	ands r0, r2
	cmp r0, 0
	beq _081E343A
	ldr r0, [r6]
	ldrb r0, [r0, 0x2]
	ands r0, r2
	cmp r0, 0
	bne _081E343A
	lsls r0, r3, 2
	adds r0, r4
	ldr r1, [r0]
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	strh r0, [r1, 0x2]
_081E343A:
	ldr r0, [r5]
	ldrb r0, [r0, 0x5]
	ands r0, r2
	cmp r0, 0
	beq _081E3458
	adds r0, r7, 0
	ands r0, r2
	cmp r0, 0
	bne _081E3458
	lsls r0, r3, 2
	adds r0, r4
	ldr r1, [r0]
	ldrh r0, [r1, 0x36]
	adds r0, 0x1
	strh r0, [r1, 0x36]
_081E3458:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _081E3412
	ldr r0, [r6]
	movs r1, 0
	strb r1, [r0, 0x2]
	ldr r0, _081E3478 @ =0x04000208
	mov r1, r12
	strh r1, [r0]
_081E346E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081E3474: .4byte gUnknown_3007460
_081E3478: .4byte 0x04000208
_081E347C: .4byte gUnknown_3007464
_081E3480: .4byte gUnknown_3007450
	thumb_func_end rfu_NI_checkCommFailCounter

	thumb_func_start rfu_REQ_noise
rfu_REQ_noise: @ 81E3484
	push {lr}
	ldr r0, _081E3498 @ =rfu_STC_REQ_callback
	bl STWI_set_Callback_M
	movs r0, 0x1
	movs r1, 0
	bl STWI_send_TestModeREQ
	pop {r0}
	bx r0
	.align 2, 0
_081E3498: .4byte rfu_STC_REQ_callback
	thumb_func_end rfu_REQ_noise

	thumb_func_start sub_81E349C
sub_81E349C: @ 81E349C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081E34B4 @ =0x04000208
	ldrh r0, [r0]
	cmp r0, 0
	bne _081E34B8
	movs r0, 0x1
	negs r0, r0
	b _081E3538
	.align 2, 0
_081E34B4: .4byte 0x04000208
_081E34B8:
	ldr r0, _081E34E4 @ =0x04000200
	ldrh r0, [r0]
	mov r8, r0
	ldr r4, _081E34E8 @ =gRfuState
	ldr r1, [r4]
	movs r0, 0xA
	str r0, [r1]
	ldr r0, _081E34EC @ =sub_81E36B8
	bl STWI_set_Callback_ID
	bl sub_81E3550
	ldr r0, [r4]
	ldrb r0, [r0, 0xA]
	lsls r0, 2
	ldr r1, _081E34F0 @ =0x04000100
	adds r4, r0, r1
	lsls r0, r5, 27
	lsrs r5, r0, 24
	movs r7, 0
	b _081E3506
	.align 2, 0
_081E34E4: .4byte 0x04000200
_081E34E8: .4byte gRfuState
_081E34EC: .4byte sub_81E36B8
_081E34F0: .4byte 0x04000100
_081E34F4:
	strh r6, [r4, 0x2]
	strh r6, [r4]
	movs r0, 0x83
	strh r0, [r4, 0x2]
_081E34FC:
	ldrh r0, [r4]
	cmp r0, 0x1F
	bls _081E34FC
	strh r7, [r4, 0x2]
	strh r7, [r4]
_081E3506:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	beq _081E351A
	bl sub_81E35C4
	adds r6, r0, 0
	cmp r6, 0
	beq _081E34F4
_081E351A:
	ldr r1, _081E3544 @ =0x04000208
	movs r0, 0
	strh r0, [r1]
	ldr r0, _081E3548 @ =0x04000200
	mov r2, r8
	strh r2, [r0]
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, _081E354C @ =gRfuState
	ldr r1, [r0]
	movs r0, 0
	str r0, [r1]
	bl STWI_set_Callback_ID
	adds r0, r6, 0
_081E3538:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081E3544: .4byte 0x04000208
_081E3548: .4byte 0x04000200
_081E354C: .4byte gRfuState
	thumb_func_end sub_81E349C

	thumb_func_start sub_81E3550
sub_81E3550: @ 81E3550
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r3, _081E35A8 @ =0x04000208
	movs r4, 0
	strh r4, [r3]
	ldr r2, _081E35AC @ =0x04000200
	ldr r0, _081E35B0 @ =gRfuState
	ldr r0, [r0]
	movs r1, 0x8
	ldrb r0, [r0, 0xA]
	lsls r1, r0
	movs r5, 0x80
	orrs r1, r5
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	movs r0, 0x1
	strh r0, [r3]
	ldr r0, _081E35B4 @ =0x04000134
	strh r4, [r0]
	subs r2, 0xD8
	movs r1, 0x80
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	movs r3, 0x81
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0
	str r0, [sp]
	ldr r1, _081E35B8 @ =gUnknown_3007470
	ldr r2, _081E35BC @ =0x05000003
	mov r0, sp
	bl CpuSet
	ldr r0, _081E35C0 @ =0x04000202
	strh r5, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E35A8: .4byte 0x04000208
_081E35AC: .4byte 0x04000200
_081E35B0: .4byte gRfuState
_081E35B4: .4byte 0x04000134
_081E35B8: .4byte gUnknown_3007470
_081E35BC: .4byte 0x05000003
_081E35C0: .4byte 0x04000202
	thumb_func_end sub_81E3550

	thumb_func_start sub_81E35C4
sub_81E35C4: @ 81E35C4
	push {r4-r7,lr}
	ldr r0, _081E35D8 @ =gUnknown_3007470
	ldrb r1, [r0, 0x1]
	mov r12, r1
	adds r7, r0, 0
	cmp r1, 0
	beq _081E35DC
	cmp r1, 0x1
	beq _081E3614
	b _081E36AC
	.align 2, 0
_081E35D8: .4byte gUnknown_3007470
_081E35DC:
	movs r6, 0x1
	strb r6, [r7]
	ldr r3, _081E3608 @ =0x04000128
	ldrh r0, [r3]
	movs r5, 0x1
	orrs r0, r5
	strh r0, [r3]
	ldr r4, _081E360C @ =0x04000208
	mov r0, r12
	strh r0, [r4]
	ldr r2, _081E3610 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4]
	strb r5, [r7, 0x1]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
	b _081E36B0
	.align 2, 0
_081E3608: .4byte 0x04000128
_081E360C: .4byte 0x04000208
_081E3610: .4byte 0x04000200
_081E3614:
	ldrh r0, [r7, 0xA]
	cmp r0, 0
	bne _081E36A8
	ldrb r0, [r7]
	cmp r0, 0x1
	bne _081E3644
	ldrh r0, [r7, 0x2]
	cmp r0, 0
	bne _081E36B0
	ldr r3, _081E363C @ =0x04000208
	strh r0, [r3]
	ldr r2, _081E3640 @ =0x04000128
	ldrh r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r2]
	mov r1, r12
	strh r1, [r3]
	b _081E36B0
	.align 2, 0
_081E363C: .4byte 0x04000208
_081E3640: .4byte 0x04000128
_081E3644:
	ldrh r1, [r7, 0x4]
	ldr r0, _081E3690 @ =0x00008001
	cmp r1, r0
	beq _081E36B0
	ldrh r6, [r7, 0x2]
	cmp r6, 0
	bne _081E36B0
	ldr r4, _081E3694 @ =0x04000208
	strh r6, [r4]
	ldr r3, _081E3698 @ =0x04000200
	ldrh r1, [r3]
	ldr r0, _081E369C @ =0x0000ff7f
	ands r0, r1
	strh r0, [r3]
	mov r7, r12
	strh r7, [r4]
	ldr r2, _081E36A0 @ =0x04000128
	strh r6, [r2]
	movs r1, 0x80
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r2]
	ldr r0, _081E36A4 @ =0x04000202
	movs r5, 0x80
	strh r5, [r0]
	ldrh r0, [r2]
	movs r7, 0x81
	lsls r7, 7
	adds r1, r7, 0
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4]
	ldrh r0, [r3]
	orrs r0, r5
	strh r0, [r3]
	mov r0, r12
	strh r0, [r4]
	b _081E36B0
	.align 2, 0
_081E3690: .4byte 0x00008001
_081E3694: .4byte 0x04000208
_081E3698: .4byte 0x04000200
_081E369C: .4byte 0x0000ff7f
_081E36A0: .4byte 0x04000128
_081E36A4: .4byte 0x04000202
_081E36A8:
	movs r0, 0x2
	strb r0, [r7, 0x1]
_081E36AC:
	ldrh r0, [r7, 0xA]
	b _081E36B2
_081E36B0:
	movs r0, 0
_081E36B2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81E35C4

	thumb_func_start sub_81E36B8
sub_81E36B8: @ 81E36B8
	push {r4,r5,lr}
	ldr r0, _081E3700 @ =0x04000120
	ldr r5, [r0]
	ldr r0, _081E3704 @ =gUnknown_3007470
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x1
	beq _081E36D2
	ldr r0, _081E3708 @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_081E36D2:
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r0, r5, 0
	lsls r0, r1
	lsrs r1, r0, 16
	movs r0, 0x1
	subs r0, r2
	lsls r0, 4
	lsls r5, r0
	adds r0, r5, 0
	lsrs r5, r0, 16
	ldrh r0, [r4, 0xA]
	cmp r0, 0
	bne _081E3726
	ldrh r2, [r4, 0x6]
	cmp r1, r2
	bne _081E3724
	ldrh r3, [r4, 0x2]
	cmp r3, 0x3
	bls _081E370C
	strh r5, [r4, 0xA]
	b _081E3726
	.align 2, 0
_081E3700: .4byte 0x04000120
_081E3704: .4byte gUnknown_3007470
_081E3708: .4byte 0x04000128
_081E370C:
	ldrh r0, [r4, 0x4]
	mvns r0, r0
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bne _081E3726
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	bne _081E3726
	adds r0, r3, 0x1
_081E3724:
	strh r0, [r4, 0x2]
_081E3726:
	ldrh r0, [r4, 0x2]
	cmp r0, 0x3
	bhi _081E373C
	lsls r0, 1
	ldr r1, _081E3738 @ =_Str_Sio32ID
	adds r0, r1
	ldrh r0, [r0]
	b _081E373E
	.align 2, 0
_081E3738: .4byte _Str_Sio32ID
_081E373C:
	ldr r0, _081E3794 @ =0x00008001
_081E373E:
	strh r0, [r4, 0x4]
	mvns r0, r5
	strh r0, [r4, 0x6]
	ldr r3, _081E3798 @ =0x04000120
	ldrh r2, [r4, 0x4]
	ldrb r1, [r4]
	movs r0, 0x1
	subs r0, r1
	lsls r0, 4
	lsls r2, r0
	ldrh r0, [r4, 0x6]
	lsls r1, 4
	lsls r0, r1
	adds r2, r0
	str r2, [r3]
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _081E378C
	ldrh r0, [r4, 0x2]
	cmp r0, 0
	bne _081E376E
	ldr r0, _081E379C @ =0x0000494e
	cmp r5, r0
	bne _081E378C
_081E376E:
	movs r0, 0
	ldr r1, _081E37A0 @ =0x00000257
_081E3772:
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r1
	bls _081E3772
	ldrh r0, [r4, 0xA]
	cmp r0, 0
	bne _081E378C
	ldr r0, _081E37A4 @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_081E378C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081E3794: .4byte 0x00008001
_081E3798: .4byte 0x04000120
_081E379C: .4byte 0x0000494e
_081E37A0: .4byte 0x00000257
_081E37A4: .4byte 0x04000128
	thumb_func_end sub_81E36B8

	.align 2, 0 @ Don't pad with nop.
