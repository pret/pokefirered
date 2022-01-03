        .include "asm/macros/function.inc"
	.include "constants/gba_constants.inc"

        .set 

	.syntax unified

	.text

	thumb_func_start CpuSet
	thumb_func_start CpuSet2
CpuSet: @ 81E3B64
CpuSet2:
	svc 0xB
	bx lr
	thumb_func_end CpuSet
	thumb_func_end CpuSet2

	thumb_func_start Div
Div: @ 81E3B68
	svc 0x6
	bx lr
	thumb_func_end Div

	thumb_func_start Mod
Mod:
	svc 0x6
	adds r0, r1, 0
	bx lr
	thumb_func_end Mod

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 81E3B6C
	svc 0x12
	bx lr
	thumb_func_end LZ77UnCompVram

	thumb_func_start RegisterRamReset
RegisterRamReset: @ 81E3B80
	svc 0x1
	bx lr
	thumb_func_end RegisterRamReset

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 81E3BA0
	movs r2, 0
	svc 0x5
	bx lr
	thumb_func_end VBlankIntrWait
	
thumb_func_start ExecuteFunc
ExecuteFunc:
    bx r0
    thumb_func_end ExecuteFunc

thumb_func_start RTCStart
RTCStart:
    push {r0-r7,lr}
    bl _check
    pop {r0-r7,pc}
    
_check:
    push {lr}
    bl _check2
    pop {r0}
    bx r0

_check2:
    push {lr}
    bl _check3
    cmp r0, 0
    bne _nextcheck2
    bl _check4
    
_nextcheck2:
    ldr r0, =gRtcLocation + 1
    bl _check5
    mov r0, 0
    pop {r1}
    bx r1
    
_check3:
    ldr r0, =gRtcCheckLocation
    ldr r0, [r0]
    cmp r0, 0
    beq _nextcheck3
    mov r0, 1
    
_nextcheck3:
    bx lr
    
_check4:
    push {r4,r5,lr}
    ldr r0, =PORT_DATA_START
    mov r1, 1
    mov r5, 5
    strh r5, [r0]
    strh r1, [r0, 4]
    ldr r4, =PORT_DATA_START_PLUS2
    mov r0, 7
    strh r0, [r4]
    mov r0, 99
    bl _check8 
    strh r5, [r4]
    bl _check6 
    ldr r1, =gRtcCheckLocation
    str r0, [r1]
    bl _check3
    ldr r1, =gUnknownRtcLoc
    str r0, [r1]
    ldr r0, =gUnknownRtcLoc + 1
    bl _check7 
    mov r0, 0
    pop {r4,r5}
    pop {r1}
    bx r1
    
_check5: 
    push {r4,r5,lr}
    add sp, -8
    mov r5, r0
    ldr r0, =gUnknownRtcLoc
    ldr r0, [r0]
    cmp r0, 0
    bne _nextcheck5
    mov r1, 0
    ldr r0, =0x000007d9
    strh r0, [r5]
    mov r0, 6
    strb r0, [r5, 2]
    mov r0, 26
    strb r0, [r5, 3]
    mov r0, 1
    strb r0, [r5, 4]
    mov r0, 12
    strb r0, [r5, 5]
    strb r1, [r5, 6]
    strb r1, [r5, 7]
    b _endcheck5

_nextcheck5:
    mov r0, sp
    bl _check7
    mov r0, sp
    ldrb r0, [r0]
    bl _check9
    ldr r1, =0x000007d0
    add r0, r1
    strh r0, [r5]
    mov r0, sp
    ldrb r0, [r0, 1]
    bl _check9
    strb r0, [r5, 2]
    mov r0, sp
    ldrb r1, [r0, 2]
    mov r4, 63
    mov r0, r4
    and r0, r1
    bl _check9
    strb r0, [r5, 3]
    mov r0, sp
    ldrb r1, [r0, 3]
    mov r0, r4
    and r0, r1
    bl _check9
    strb r0, [r5, 4]
    mov r0, sp
    ldrb r0, [r0, 4]
    and r4, r0
    mov r0, r4
    bl _check9
    strb r0, [r5, 5]
    mov r0, sp
    ldrb r0, [r0, 5]
    bl _check9
    strb r0, [r5, 6]
    mov r0, sp
    ldrb r0, [r0, 6]
    bl _check9
    strb r0, [r5, 7]
    ldr r2, =gUnknownRtcLoc2
    ldrb r3, [r5, 6]
    ldrb r0, [r2, 2]
    add r1, r3, r0
    strb r1, [r5, 6]
    lsl r0, r1, 24
    lsr r0, 24
    cmp r0, 59
    bls _next2check5
    mov r0, r1
    sub r0, 60
    strb r0, [r5, 6]
    ldrb r0, [r5, 5]
    add r0, 1
    strb r0, [r5, 5]
    
_next2check5:
    ldrb r3, [r5, 5]
    ldrb r0, [r2, 1]
    add r1, r3, r0
    strb r1, [r5, 5]
    lsl r0, r1, 24
    lsr r0, 24
    cmp r0, 23
    bls _next3check5
    mov r0, r1
    sub r0, 24
    strb r0, [r5, 5]
    ldrb r0, [r5, 4]
    add r0, 1
    strb r0, [r5, 4]
    
_next3check5:
    ldrb r2, [r2]
    ldrb r1, [r5, 4]
    add r0, r2, r1
    mov r1, 7
    bl Div
    strb r0, [r5, 4]
    
_endcheck5:
    mov r0, 0
    add sp, 8
    pop {r4,r5}
    pop {r1}
    bx r1
    
_check6:
    push {r4-r7,lr}
    mov r7, r8
    push {r7}
    mov r5, 0
    mov r2, 0
    ldr r3, =PORT_DATA_START
    mov r6, 4
    mov r7, 5
    mov r0, 2
    mov r8, r0
    
_loop2check6:
    add r4, r2, 1
    mov r0, 4
    
_loopcheck6:
    strh r6, [r3]
    sub r0, 1
    cmp r0, 0
    bge _loopcheck6
    strh r7, [r3]
    ldrh r1, [r3]
    mov r0, r8
    and r0, r1
    lsl r0, 16
    lsr r0, 16
    lsl r0, r2
    orr r5, r0
    mov r2, r4
    cmp r2, 7
    ble _loop2check6
    asr r5, 1
    mov r0, r5
    pop {r7}
    mov r8, r7
    pop {r4-r7}
    pop {r1}
    bx r1
    
_check7:
    push {r4-r6,lr}
    mov r6, r0
    ldr r1, =PORT_DATA_START
    mov r2, 1
    strh r2, [r1]
    ldr r5, =0x00b01148
    mov r0, 7
    strh r0, [r5]
    strh r2, [r1]
    mov r4, 5
    strh r4, [r1]
    mov r0, 101
    bl _check8
    strh r4, [r5]
    mov r4, r6
    mov r5, 3
    
_loopcheck7:
    bl _check6
    strb r0, [r4]
    add r4, 1
    sub r5, 1
    cmp r5, 0
    bge _loopcheck7
    ldr r1, =0x00b01148
    mov r0, 5
    strh r0, [r1]
    add r4, r6, 4
    mov r5, 2
    
_loop2check7:
    bl _check6
    strb r0, [r4]
    add r4, 1
    sub r5, 1
    cmp r5, 0
    bge _loop2check7
    mov r0, 0
    pop {r4-r6}
    pop {r1}
    bx r1
    
_check8:
    push {r4-r7,lr}
    lsl r4, r0, 1
    mov r3, 7
    mov r7, 2
    ldr r2, =PORT_DATA_START
    mov r6, 4
    mov r5, 5
    
_loopcheck8:
    mov r0, r4
    asr r0, r3
    and r0, r7
    lsl r0, 16
    lsr r0, 16
    mov r1, r0
    orr r1, r6
    strh r1, [r2]
    orr r0, r5
    strh r0, [r2]
    sub r3, 1
    cmp r3, 0
    bge _loopcheck8
    mov r0, 0
    pop {r4-r7}
    pop {r1}
    bx r1
    
_check9:
    mov r2, 15
    and r2, r0
    asr r0, 4
    lsl r1, r0, 2
    add r1, r0
    lsl r1, 1
    add r2, r1
    mov r0, r2
    bx lr
	.align 2, 0 @ Don't pad with nop.
PORT_DATA_START: .word 0x080000C4
PORT_DATA_START_PLUS2: .word 0x080000C6
