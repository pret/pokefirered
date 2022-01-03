        #include "main.h"
	#include "global.fieldmap.h"
	.include "asm/macros/function.inc"
	.include "constants/gba_constants.inc"

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
    ldr r0, gRtcLocation
	adds r0, 1
    bl _check5
    movs r0, 0
    pop {r1}
    bx r1
    
_check3:
    ldr r0, gRtcCheckLocation
    ldr r0, [r0]
    cmp r0, 0
    beq _nextcheck3
    movs r0, 1
    
_nextcheck3:
    bx lr
    
_check4:
    push {r4,r5,lr}
    ldr r0, PORT_DATA_START
    movs r1, 1
    movs r5, 5
    strh r5, [r0]
    strh r1, [r0, 4]
    ldr r4, PORT_DATA_START_PLUS2
    movs r0, 7
    strh r0, [r4]
    movs r0, 99
    bl _check8 
    strh r5, [r4]
    bl _check6 
    ldr r1, gRtcCheckLocation
    str r0, [r1]
    bl _check3
    ldr r1, gRtcLocationDecimal
    str r0, [r1]
    ldr r0, gRtcLocationDecimal
    adds r0, 1
    bl _check7 
    movs r0, 0
    pop {r4,r5}
    pop {r1}
    bx r1
    
_check5: 
    push {r4,r5,lr}
    add sp, -8
    movs r5, r0
    ldr r0, gRtcLocationDecimal
    ldr r0, [r0]
    cmp r0, 0
    bne _nextcheck5
    movs r1, 0
    ldr r0, =0x000007d9
    strh r0, [r5]
    movs r0, 6
    strb r0, [r5, 2]
    movs r0, 26
    strb r0, [r5, 3]
    movs r0, 1
    strb r0, [r5, 4]
    movs r0, 12
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
    adds r0, r1
    strh r0, [r5]
    mov r0, sp
    ldrb r0, [r0, 1]
    bl _check9
    strb r0, [r5, 2]
    mov r0, sp
    ldrb r1, [r0, 2]
    movs r4, 63
    movs r0, r4
    ands r0, r1
    bl _check9
    strb r0, [r5, 3]
    mov r0, sp
    ldrb r1, [r0, 3]
    movs r0, r4
    ands r0, r1
    bl _check9
    strb r0, [r5, 4]
    mov r0, sp
    ldrb r0, [r0, 4]
    ands r4, r0
    movs r0, r4
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
    ldr r2, gUnknownRtcLoc2
    ldrb r3, [r5, 6]
    ldrb r0, [r2, 2]
    adds r1, r3, r0
    strb r1, [r5, 6]
    lsls r0, r1, 24
    lsrs r0, 24
    cmp r0, 59
    bls _next2check5
    movs r0, r1
    subs r0, 60
    strb r0, [r5, 6]
    ldrb r0, [r5, 5]
    adds r0, 1
    strb r0, [r5, 5]
    
_next2check5:
    ldrb r3, [r5, 5]
    ldrb r0, [r2, 1]
    adds r1, r3, r0
    strb r1, [r5, 5]
    lsls r0, r1, 24
    lsrs r0, 24
    cmp r0, 23
    bls _next3check5
    movs r0, r1
    subs r0, 24
    strb r0, [r5, 5]
    ldrb r0, [r5, 4]
    adds r0, 1
    strb r0, [r5, 4]
    
_next3check5:
    ldrb r2, [r2]
    ldrb r1, [r5, 4]
    adds r0, r2, r1
    movs r1, 7
    bl Div
    strb r0, [r5, 4]
    
_endcheck5:
    movs r0, 0
    add sp, 8
    pop {r4,r5}
    pop {r1}
    bx r1
    
_check6:
    push {r4-r7,lr}
    mov r7, r8
    push {r7}
    movs r5, 0
    movs r2, 0
    ldr r3, PORT_DATA_START
    movs r6, 4
    movs r7, 5
    movs r0, 2
    mov r8, r0
    
_loop2check6:
    adds r4, r2, 1
    movs r0, 4
    
_loopcheck6:
    strh r6, [r3]
    subs r0, 1
    cmp r0, 0
    bge _loopcheck6
    strh r7, [r3]
    ldrh r1, [r3]
    mov r0, r8
    ands r0, r1
    lsls r0, 16
    lsrs r0, 16
    lsls r0, r2
    orrs r5, r0
    movs r2, r4
    cmp r2, 7
    ble _loop2check6
    asrs r5, 1
    movs r0, r5
    pop {r7}
    mov r8, r7
    pop {r4-r7}
    pop {r1}
    bx r1
    
_check7:
    push {r4-r6,lr}
    movs r6, r0
    ldr r1, PORT_DATA_START
    movs r2, 1
    strh r2, [r1]
    ldr r5, =0x00b01148
    movs r0, 7
    strh r0, [r5]
    strh r2, [r1]
    movs r4, 5
    strh r4, [r1]
    movs r0, 101
    bl _check8
    strh r4, [r5]
    movs r4, r6
    movs r5, 3
    
_loopcheck7:
    bl _check6
    strb r0, [r4]
    adds r4, 1
    subs r5, 1
    cmp r5, 0
    bge _loopcheck7
    ldr r1, =0x00b01148
    movs r0, 5
    strh r0, [r1]
    adds r4, r6, 4
    movs r5, 2
    
_loop2check7:
    bl _check6
    strb r0, [r4]
    adds r4, 1
    subs r5, 1
    cmp r5, 0
    bge _loop2check7
    movs r0, 0
    pop {r4-r6}
    pop {r1}
    bx r1
    
_check8:
    push {r4-r7,lr}
    lsls r4, r0, 1
    movs r3, 7
    movs r7, 2
    ldr r2, PORT_DATA_START
    movs r6, 4
    movs r5, 5
    
_loopcheck8:
    movs r0, r4
    asrs r0, r3
    ands r0, r7
    lsls r0, 16
    lsrs r0, 16
    movs r1, r0
    orrs r1, r6
    strh r1, [r2]
    orrs r0, r5
    strh r0, [r2]
    subs r3, 1
    cmp r3, 0
    bge _loopcheck8
    movs r0, 0
    pop {r4-r7}
    pop {r1}
    bx r1
    
_check9:
    movs r2, 15
    ands r2, r0
    asrs r0, 4
    lsls r1, r0, 2
    adds r1, r0
    lsls r1, 1
    adds r2, r1
    movs r0, r2
    bx lr
    
       .align 2, 0
PORT_DATA_START: .word 0x080000C4
PORT_DATA_START_PLUS2: .word 0x080000C6
thumb_func_end RTCStart

        .align 2, 0
thumb_func_start DayAndNightPalleteChange
DayAndNightPalleteChange:
    push {r2-r7,lr}
    mov r4, r8
    push {r4}
    movs r4, r0
    movs r5, r1
    ldr r0, gRtcLocation
    ldrb r1, [r0, 6]
    ldr r0, gDayAndNightStatus
    cmp r1, DAWN_OF_DAY_START
    blt _dawn
    cmp r1, MORNING_OF_DAY_START
    blt _morning
    cmp r1, AFTERNOON_OF_DAY_START
    blt _afternoon
    cmp r1, NIGHT_OF_DAY_START
    blt _night
    cmp r1, MIDNIGHT_OF_DAY_START
    blt _midnight
    movs r1, 5
    ldr r2, =0x7C007C00
    b _next

_dawn:
    movs r1, 0
    movs r2, 0
    b _next

_morning:
    movs r1, 1
    ldr r2, =0x03FF03FF
    b _next

_afternoon:
    movs r1, 2
    ldr r2, =0x7FFF7FFF
    b _next
    
_night:
    movs r1, 3
    ldr r2, =0x001F001F
    b _next
    
_midnight:
    movs r1, 4
    ldr r2, =0x7C1F7C1F
    
_next:
    strb r1, [r0]
    ldr r0, gMapHeader
    ldrb r0, [r0, 23]
    cmp r0, 0
    beq _return
    cmp r0, 4
    beq _return
    cmp r0, 8
    beq _return
    ldr r0, gMain
    ldr r1, =0x0000439
    adds r0, r1
    ldrb r1, [r0]
    cmp r1, 0
    bne _return
    ldrb r0, [r0, 1]
    cmp r0, 2
    bgt _return
    movs r0, r4
    movs r1, r5
    ldr r4, =0x04210421
    orrs r4, r2
    mvns r4, r4
    movs r7, 31
    mov r8, r7
    ldr r7, =0xFFFF1FFF
    
_mainloop:
    movs r3, 7
    movs r6, 1
    ands r6, r7
    cmp r6, 1
    beq _loop2
    
_loop1:
    ldr r5, [r0]
    str r5, [r1]
    adds r0, 4
    adds r1, 4
    subs r3, 1
    bpl _loop1
    b _endLoop
    
_loop2:
    ldr r5, [r0]
    movs r6, r2
    ands r6, r5
    ands r5, r4
    lsrs r5, 1
    adds r5, r6
    str r5, [r1]
    adds r0, 4
    adds r1, 4
    subs r3, 1
    bpl _loop2

_endLoop:
    lsrs r7, 1
    mov r6, r8
    subs r6, 1
    mov r8, r6
    bpl _mainloop
    
_return:
    pop {r4}
    mov r8, r4
    pop {r2-r7,pc}
thumb_func_end DayAndNightPalleteChange
        .align 2, 0
