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
