	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_807B0C4
sub_807B0C4: @ 807B0C4
	push {lr}
	adds r1, r0, 0
	adds r3, r2, 0
	ldr r0, _0807B0E8 @ =gWeather
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xB
	beq _0807B0F0
	cmp r0, 0xB
	bgt _0807B0EC
	cmp r0, 0x5
	bgt _0807B0FA
	cmp r0, 0x3
	blt _0807B0FA
	b _0807B0F0
	.align 2, 0
_0807B0E8: .4byte gWeather
_0807B0EC:
	cmp r0, 0xD
	bne _0807B0FA
_0807B0F0:
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0x3
	bl sub_8045314
_0807B0FA:
	pop {r0}
	bx r0
	thumb_func_end sub_807B0C4

	thumb_func_start SetSav1Weather
SetSav1Weather: @ 807B100
	push {r4,r5,lr}
	ldr r4, _0807B12C @ =gSaveBlock1Ptr
	ldr r1, [r4]
	adds r1, 0x2E
	ldrb r5, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl TranslateWeatherNum
	ldr r1, [r4]
	adds r1, 0x2E
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x2E
	ldrb r0, [r0]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B12C: .4byte gSaveBlock1Ptr
	thumb_func_end SetSav1Weather

	thumb_func_start sav1_get_weather_probably
sav1_get_weather_probably: @ 807B130
	ldr r0, _0807B13C @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x2E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807B13C: .4byte gSaveBlock1Ptr
	thumb_func_end sav1_get_weather_probably

	thumb_func_start SetSav1WeatherFromCurrMapHeader
SetSav1WeatherFromCurrMapHeader: @ 807B140
	push {r4,r5,lr}
	ldr r4, _0807B16C @ =gSaveBlock1Ptr
	ldr r0, [r4]
	adds r0, 0x2E
	ldrb r5, [r0]
	ldr r0, _0807B170 @ =gMapHeader
	ldrb r0, [r0, 0x16]
	bl TranslateWeatherNum
	ldr r1, [r4]
	adds r1, 0x2E
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x2E
	ldrb r0, [r0]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B16C: .4byte gSaveBlock1Ptr
_0807B170: .4byte gMapHeader
	thumb_func_end SetSav1WeatherFromCurrMapHeader

	thumb_func_start SetWeather
SetWeather: @ 807B174
	push {lr}
	bl SetSav1Weather
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl SetNextWeather
	pop {r0}
	bx r0
	thumb_func_end SetWeather

	thumb_func_start sub_807B18C
sub_807B18C: @ 807B18C
	push {lr}
	bl SetSav1Weather
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl SetCurrentAndNextWeather
	pop {r0}
	bx r0
	thumb_func_end sub_807B18C

	thumb_func_start DoCurrentWeather
DoCurrentWeather: @ 807B1A4
	push {lr}
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl SetNextWeather
	pop {r0}
	bx r0
	thumb_func_end DoCurrentWeather

	thumb_func_start sub_807B1B8
sub_807B1B8: @ 807B1B8
	push {lr}
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl SetCurrentAndNextWeather
	pop {r0}
	bx r0
	thumb_func_end sub_807B1B8

	thumb_func_start TranslateWeatherNum
TranslateWeatherNum: @ 807B1CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _0807B294
	lsls r0, 2
	ldr r1, _0807B1E0 @ =_0807B1E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B1E0: .4byte _0807B1E4
	.align 2, 0
_0807B1E4:
	.4byte _0807B294
	.4byte _0807B23C
	.4byte _0807B240
	.4byte _0807B244
	.4byte _0807B248
	.4byte _0807B24C
	.4byte _0807B250
	.4byte _0807B254
	.4byte _0807B258
	.4byte _0807B25C
	.4byte _0807B260
	.4byte _0807B264
	.4byte _0807B268
	.4byte _0807B26C
	.4byte _0807B270
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B294
	.4byte _0807B274
	.4byte _0807B27C
_0807B23C:
	movs r0, 0x1
	b _0807B296
_0807B240:
	movs r0, 0x2
	b _0807B296
_0807B244:
	movs r0, 0x3
	b _0807B296
_0807B248:
	movs r0, 0x4
	b _0807B296
_0807B24C:
	movs r0, 0x5
	b _0807B296
_0807B250:
	movs r0, 0x6
	b _0807B296
_0807B254:
	movs r0, 0x7
	b _0807B296
_0807B258:
	movs r0, 0x8
	b _0807B296
_0807B25C:
	movs r0, 0x9
	b _0807B296
_0807B260:
	movs r0, 0xA
	b _0807B296
_0807B264:
	movs r0, 0xB
	b _0807B296
_0807B268:
	movs r0, 0xC
	b _0807B296
_0807B26C:
	movs r0, 0xD
	b _0807B296
_0807B270:
	movs r0, 0xE
	b _0807B296
_0807B274:
	ldr r1, _0807B278 @ =gUnknown_83C65C0
	b _0807B27E
	.align 2, 0
_0807B278: .4byte gUnknown_83C65C0
_0807B27C:
	ldr r1, _0807B28C @ =gUnknown_83C65C4
_0807B27E:
	ldr r0, _0807B290 @ =gSaveBlock1Ptr
	ldr r0, [r0]
	adds r0, 0x2F
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	b _0807B296
	.align 2, 0
_0807B28C: .4byte gUnknown_83C65C4
_0807B290: .4byte gSaveBlock1Ptr
_0807B294:
	movs r0, 0
_0807B296:
	pop {r1}
	bx r1
	thumb_func_end TranslateWeatherNum

	thumb_func_start UpdateWeatherPerDay
UpdateWeatherPerDay: @ 807B29C
	lsls r0, 16
	ldr r1, _0807B2B8 @ =gSaveBlock1Ptr
	ldr r2, [r1]
	adds r2, 0x2F
	lsrs r0, 16
	ldrb r1, [r2]
	adds r0, r1
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	strb r1, [r2]
	bx lr
	.align 2, 0
_0807B2B8: .4byte gSaveBlock1Ptr
	thumb_func_end UpdateWeatherPerDay

	thumb_func_start UpdateRainCounter
UpdateRainCounter: @ 807B2BC
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r0, 24
	cmp r0, r1
	beq _0807B2D6
	cmp r2, 0x3
	beq _0807B2D0
	cmp r2, 0x5
	bne _0807B2D6
_0807B2D0:
	movs r0, 0x28
	bl IncrementGameStat
_0807B2D6:
	pop {r0}
	bx r0
	thumb_func_end UpdateRainCounter

	.align 2, 0 @ Don't pad with nop
