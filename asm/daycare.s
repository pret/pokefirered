	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GetMonNick
GetMonNick: @ 80453C0
	push {r4,lr}
	sub sp, 0x14
	adds r4, r1, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy10
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonNick

	thumb_func_start GetBoxMonNick
GetBoxMonNick: @ 80453E0
	push {r4,lr}
	sub sp, 0x14
	adds r4, r1, 0
	movs r1, 0x2
	mov r2, sp
	bl GetBoxMonData
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy10
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonNick

	thumb_func_start CountPokemonInDaycare
CountPokemonInDaycare: @ 8045400
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_08045408:
	movs r0, 0x8C
	muls r0, r4
	adds r0, r6, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _0804541E
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0804541E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08045408
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CountPokemonInDaycare

	thumb_func_start InitDaycareMailRecordMixing
InitDaycareMailRecordMixing: @ 8045430
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r10, r1
	movs r7, 0
	movs r5, 0
	mov r6, r10
	adds r6, 0x74
	movs r0, 0x1
	mov r8, r0
_0804544A:
	movs r0, 0x8C
	muls r0, r5
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08045478
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0xC
	bl GetBoxMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _08045478
	lsls r0, r5, 1
	adds r0, r6, r0
	b _0804547E
_08045478:
	lsls r0, r5, 1
	adds r0, r6, r0
	mov r1, r8
_0804547E:
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _0804544A
	mov r0, r10
	str r7, [r0, 0x70]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end InitDaycareMailRecordMixing

	thumb_func_start Daycare_FindEmptySpot
Daycare_FindEmptySpot: @ 804549C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_080454A2:
	movs r0, 0x8C
	muls r0, r4
	adds r0, r5, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _080454B8
	lsls r0, r4, 24
	asrs r0, 24
	b _080454C6
_080454B8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _080454A2
	movs r0, 0x1
	negs r0, r0
_080454C6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end Daycare_FindEmptySpot

	thumb_func_start StorePokemonInDaycare
StorePokemonInDaycare: @ 80454CC
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl MonHasMail
	lsls r0, 24
	cmp r0, 0
	beq _08045524
	adds r0, r4, 0
	adds r0, 0x74
	ldr r1, _08045550 @ =gUnknown_300500C
	ldr r1, [r1]
	bl StringCopy
	adds r1, r4, 0
	adds r1, 0x7C
	adds r0, r5, 0
	bl GetMonNick
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08045554 @ =gUnknown_3005008
	ldr r1, [r1]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r1, r2
	adds r0, r4, 0
	adds r0, 0x50
	ldr r2, _08045558 @ =0x00002cd0
	adds r1, r2
	ldm r1!, {r2,r3,r6}
	stm r0!, {r2,r3,r6}
	ldm r1!, {r2,r3,r6}
	stm r0!, {r2,r3,r6}
	ldm r1!, {r2,r3,r6}
	stm r0!, {r2,r3,r6}
	adds r0, r5, 0
	bl TakeMailFromMon
_08045524:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl BoxMonRestorePP
	adds r1, r4, 0
	adds r1, 0x88
	movs r0, 0
	str r0, [r1]
	adds r0, r5, 0
	bl ZeroMonData
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045550: .4byte gUnknown_300500C
_08045554: .4byte gUnknown_3005008
_08045558: .4byte 0x00002cd0
	thumb_func_end StorePokemonInDaycare

	thumb_func_start StorePokemonInEmptyDaycareSlot
StorePokemonInEmptyDaycareSlot: @ 804555C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	bl Daycare_FindEmptySpot
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x8C
	muls r0, r1
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl StorePokemonInDaycare
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end StorePokemonInEmptyDaycareSlot

	thumb_func_start StoreSelectedPokemonInDaycare
StoreSelectedPokemonInDaycare: @ 8045580
	push {lr}
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080455A4 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _080455A8 @ =gUnknown_3005008
	ldr r1, [r1]
	movs r2, 0xBE
	lsls r2, 6
	adds r1, r2
	bl StorePokemonInEmptyDaycareSlot
	pop {r0}
	bx r0
	.align 2, 0
_080455A4: .4byte gUnknown_2024284
_080455A8: .4byte gUnknown_3005008
	thumb_func_end StoreSelectedPokemonInDaycare

	thumb_func_start ShiftDaycareSlots
ShiftDaycareSlots: @ 80455AC
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x8C
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08045602
	adds r0, r5, 0
	movs r1, 0xB
	bl GetBoxMonData
	adds r6, r0, 0
	cmp r6, 0
	bne _08045602
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl ZeroBoxMonData
	adds r4, 0x50
	adds r0, r5, 0
	adds r0, 0x50
	adds r1, r4, 0
	movs r2, 0x38
	bl memcpy
	adds r2, r5, 0
	adds r2, 0x88
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r5, r0
	ldr r0, [r1]
	str r0, [r2]
	str r6, [r1]
	adds r0, r4, 0
	bl ClearDaycareMonMisc
_08045602:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ShiftDaycareSlots

	thumb_func_start ApplyDaycareExperience
ApplyDaycareExperience: @ 8045608
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	ldr r7, _08045624 @ =0x0000ffff
_08045610:
	adds r0, r4, 0
	bl sub_8043B90
	lsls r0, 24
	cmp r0, 0
	beq _0804564C
	movs r6, 0x1
	adds r5, 0x1
	b _08045638
	.align 2, 0
_08045624: .4byte 0x0000ffff
_08045628:
	movs r6, 0
	cmp r0, r7
	bne _08045638
	ldr r0, _08045658 @ =gUnknown_2024022
	ldrh r1, [r0]
	adds r0, r4, 0
	bl DeleteFirstMoveAndGiveMoveToMon
_08045638:
	adds r0, r4, 0
	adds r1, r6, 0
	bl MonTryLearningNewMove
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08045628
	cmp r5, 0x63
	ble _08045610
_0804564C:
	adds r0, r4, 0
	bl CalculateMonStats
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045658: .4byte gUnknown_2024022
	thumb_func_end ApplyDaycareExperience

	thumb_func_start TakeSelectedPokemonFromDaycare
TakeSelectedPokemonFromDaycare: @ 804565C
	push {r4-r7,lr}
	sub sp, 0x68
	adds r5, r0, 0
	ldr r1, _080456F8 @ =gUnknown_2021CD0
	bl GetBoxMonNick
	adds r0, r5, 0
	movs r1, 0xB
	bl GetBoxMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	mov r1, sp
	bl BoxMonToMon
	mov r0, sp
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _080456AA
	mov r0, sp
	movs r1, 0x19
	bl GetMonData
	adds r1, r5, 0
	adds r1, 0x88
	ldr r1, [r1]
	adds r0, r1
	str r0, [sp, 0x64]
	add r2, sp, 0x64
	mov r0, sp
	movs r1, 0x19
	bl sub_804037C
	mov r0, sp
	bl ApplyDaycareExperience
_080456AA:
	ldr r0, _080456FC @ =gUnknown_2024284
	movs r1, 0xFA
	lsls r1, 1
	adds r6, r0, r1
	adds r0, r6, 0
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	adds r0, r5, 0
	adds r0, 0x70
	ldrh r0, [r0]
	cmp r0, 0
	beq _080456D8
	adds r4, r5, 0
	adds r4, 0x50
	adds r0, r6, 0
	adds r1, r4, 0
	bl GiveMailToMon2
	adds r0, r4, 0
	bl ClearDaycareMonMisc
_080456D8:
	adds r0, r5, 0
	bl ZeroBoxMonData
	adds r1, r5, 0
	adds r1, 0x88
	movs r0, 0
	str r0, [r1]
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	adds r0, r7, 0
	add sp, 0x68
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080456F8: .4byte gUnknown_2021CD0
_080456FC: .4byte gUnknown_2024284
	thumb_func_end TakeSelectedPokemonFromDaycare

	thumb_func_start TakeSelectedPokemonMonFromDaycareShiftSlots
TakeSelectedPokemonMonFromDaycareShiftSlots: @ 8045700
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x8C
	muls r0, r1
	adds r0, r5, r0
	bl TakeSelectedPokemonFromDaycare
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ShiftDaycareSlots
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end TakeSelectedPokemonMonFromDaycareShiftSlots

	thumb_func_start TakePokemonFromDaycare
TakePokemonFromDaycare: @ 8045728
	push {lr}
	ldr r0, _08045744 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	ldr r1, _08045748 @ =gUnknown_20370C0
	ldrb r1, [r1]
	bl TakeSelectedPokemonMonFromDaycareShiftSlots
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08045744: .4byte gUnknown_3005008
_08045748: .4byte gUnknown_20370C0
	thumb_func_end TakePokemonFromDaycare

	thumb_func_start GetLevelAfterDaycareSteps
GetLevelAfterDaycareSteps: @ 804574C
	push {r4,r5,lr}
	sub sp, 0x54
	adds r4, r0, 0
	adds r5, r1, 0
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x19
	bl GetBoxMonData
	adds r0, r5
	str r0, [sp, 0x50]
	add r2, sp, 0x50
	mov r0, sp
	movs r1, 0x19
	bl sub_80404D0
	mov r0, sp
	bl GetLevelFromBoxMonExp
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x54
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetLevelAfterDaycareSteps

	thumb_func_start GetNumLevelsGainedFromSteps
GetNumLevelsGainedFromSteps: @ 8045788
	push {r4,r5,lr}
	adds r5, r0, 0
	bl GetLevelFromBoxMonExp
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r0, 0x88
	ldr r1, [r0]
	adds r0, r5, 0
	bl GetLevelAfterDaycareSteps
	lsls r0, 24
	lsrs r0, 24
	subs r0, r4
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetNumLevelsGainedFromSteps

	thumb_func_start GetNumLevelsGainedForDaycareMon
GetNumLevelsGainedForDaycareMon: @ 80457B4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl GetNumLevelsGainedFromSteps
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080457E0 @ =gUnknown_2021CF0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_8008E78
	ldr r1, _080457E4 @ =gUnknown_2021CD0
	adds r0, r5, 0
	bl GetBoxMonNick
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080457E0: .4byte gUnknown_2021CF0
_080457E4: .4byte gUnknown_2021CD0
	thumb_func_end GetNumLevelsGainedForDaycareMon

	thumb_func_start GetDaycareCostForSelectedMon
GetDaycareCostForSelectedMon: @ 80457E8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl GetNumLevelsGainedFromSteps
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08045818 @ =gUnknown_2021CD0
	adds r0, r5, 0
	bl GetBoxMonNick
	movs r0, 0x64
	muls r4, r0
	adds r4, 0x64
	ldr r0, _0804581C @ =gUnknown_2021CF0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x5
	bl sub_8008E78
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08045818: .4byte gUnknown_2021CD0
_0804581C: .4byte gUnknown_2021CF0
	thumb_func_end GetDaycareCostForSelectedMon

	thumb_func_start GetDaycareCostForMon
GetDaycareCostForMon: @ 8045820
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x8C
	muls r1, r2
	adds r0, r1
	bl GetDaycareCostForSelectedMon
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end GetDaycareCostForMon

	thumb_func_start GetDaycareCost
GetDaycareCost: @ 8045838
	push {lr}
	ldr r0, _08045854 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	ldr r1, _08045858 @ =gUnknown_20370C0
	ldrb r1, [r1]
	bl GetDaycareCostForMon
	ldr r1, _0804585C @ =gUnknown_20370C2
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08045854: .4byte gUnknown_3005008
_08045858: .4byte gUnknown_20370C0
_0804585C: .4byte gUnknown_20370C2
	thumb_func_end GetDaycareCost

	thumb_func_start sub_8045860
sub_8045860: @ 8045860
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08045888 @ =gUnknown_3005008
	ldr r2, [r1]
	ldr r1, _0804588C @ =0x00003008
	adds r3, r2, r1
	ldr r1, [r3]
	adds r1, r0
	str r1, [r3]
	ldr r1, _08045890 @ =0x00003094
	adds r3, r2, r1
	ldr r1, [r3]
	adds r1, r0
	str r1, [r3]
	ldr r1, _08045894 @ =0x00003d20
	adds r2, r1
	ldr r1, [r2]
	adds r1, r0
	str r1, [r2]
	bx lr
	.align 2, 0
_08045888: .4byte gUnknown_3005008
_0804588C: .4byte 0x00003008
_08045890: .4byte 0x00003094
_08045894: .4byte 0x00003d20
	thumb_func_end sub_8045860

	thumb_func_start GetNumLevelsGainedFromDaycare
GetNumLevelsGainedFromDaycare: @ 8045898
	push {r4-r6,lr}
	ldr r6, _080458C0 @ =gUnknown_3005008
	ldr r5, _080458C4 @ =gUnknown_20370C0
	ldrh r0, [r5]
	movs r4, 0x8C
	adds r1, r0, 0
	muls r1, r4
	movs r0, 0xBE
	lsls r0, 6
	adds r1, r0
	ldr r0, [r6]
	adds r0, r1
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _080458C8
	movs r0, 0
	b _080458E0
	.align 2, 0
_080458C0: .4byte gUnknown_3005008
_080458C4: .4byte gUnknown_20370C0
_080458C8:
	ldrh r0, [r5]
	adds r1, r0, 0
	muls r1, r4
	movs r0, 0xBE
	lsls r0, 6
	adds r1, r0
	ldr r0, [r6]
	adds r0, r1
	bl GetNumLevelsGainedForDaycareMon
	lsls r0, 24
	lsrs r0, 24
_080458E0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetNumLevelsGainedFromDaycare

	thumb_func_start ClearDaycareMonMisc
ClearDaycareMonMisc: @ 80458E8
	push {lr}
	movs r3, 0
	movs r2, 0x7
	adds r1, r0, 0
	adds r1, 0x2B
_080458F2:
	strb r3, [r1]
	subs r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _080458F2
	adds r2, r0, 0
	adds r2, 0x2C
	movs r3, 0
	adds r1, r0, 0
	adds r1, 0x36
_08045906:
	strb r3, [r1]
	subs r1, 0x1
	cmp r1, r2
	bge _08045906
	bl ClearMailStruct
	pop {r0}
	bx r0
	thumb_func_end ClearDaycareMonMisc

	thumb_func_start ClearDaycareMon
ClearDaycareMon: @ 8045918
	push {r4,lr}
	adds r4, r0, 0
	bl ZeroBoxMonData
	adds r1, r4, 0
	adds r1, 0x88
	movs r0, 0
	str r0, [r1]
	adds r4, 0x50
	adds r0, r4, 0
	bl ClearDaycareMonMisc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearDaycareMon

	thumb_func_start ClearAllDaycareData
ClearAllDaycareData: @ 8045938
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	movs r6, 0x8C
_08045940:
	adds r0, r4, 0
	muls r0, r6
	adds r0, r5, r0
	bl ClearDaycareMon
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08045940
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r5, r1
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r5, r1
	strb r2, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ClearAllDaycareData

	thumb_func_start sub_8045970
sub_8045970: @ 8045970
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0
	mov r8, r0
	ldr r0, _0804599C @ =gUnknown_8259754
	mov r12, r0
_08045982:
	movs r7, 0
	movs r6, 0x1
	movs r4, 0x80
	lsls r4, 9
	movs r5, 0x28
	mov r3, r12
	adds r3, 0x28
_08045990:
	movs r1, 0
	ldrh r0, [r3, 0x4]
	cmp r0, r2
	bne _080459A0
	lsrs r2, r4, 16
	b _080459CC
	.align 2, 0
_0804599C: .4byte gUnknown_8259754
_080459A0:
	adds r1, 0x1
	cmp r1, 0x4
	bgt _080459B6
	lsls r0, r1, 3
	adds r0, r5
	add r0, r12
	ldrh r0, [r0, 0x4]
	cmp r0, r2
	bne _080459A0
	lsrs r2, r4, 16
	movs r7, 0x1
_080459B6:
	cmp r7, 0
	bne _080459CC
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x28
	adds r3, 0x28
	adds r6, 0x1
	ldr r0, _080459EC @ =0x0000019b
	cmp r6, r0
	ble _08045990
_080459CC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	beq _080459DE
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x4
	ble _08045982
_080459DE:
	adds r0, r2, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080459EC: .4byte 0x0000019b
	thumb_func_end sub_8045970

	thumb_func_start sub_80459F0
sub_80459F0: @ 80459F0
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08045A18 @ =0x0000fffe
	bl __umodsi3
	adds r0, 0x1
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	strh r0, [r4]
	ldr r0, _08045A1C @ =0x00000266
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045A18: .4byte 0x0000fffe
_08045A1C: .4byte 0x00000266
	thumb_func_end sub_80459F0

	thumb_func_start sub_8045A20
sub_8045A20: @ 8045A20
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	movs r2, 0x8C
	lsls r2, 1
	adds r4, r2
	orrs r1, r0
	strh r1, [r4]
	ldr r0, _08045A44 @ =0x00000266
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045A44: .4byte 0x00000266
	thumb_func_end sub_8045A20

	thumb_func_start sub_8045A48
sub_8045A48: @ 8045A48
	push {lr}
	ldr r0, _08045A5C @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl sub_80459F0
	pop {r0}
	bx r0
	.align 2, 0
_08045A5C: .4byte gUnknown_3005008
	thumb_func_end sub_8045A48

	thumb_func_start sub_8045A60
sub_8045A60: @ 8045A60
	push {lr}
	ldr r0, _08045A74 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl sub_8045A20
	pop {r0}
	bx r0
	.align 2, 0
_08045A74: .4byte gUnknown_3005008
	thumb_func_end sub_8045A60

	thumb_func_start RemoveIVIndexFromList
RemoveIVIndexFromList: @ 8045A78
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	movs r2, 0
_08045A8A:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x5
	ble _08045A8A
	movs r3, 0
	movs r2, 0
_08045A9E:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08045AB0
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, 0x1
_08045AB0:
	adds r2, 0x1
	cmp r2, 0x5
	ble _08045A9E
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RemoveIVIndexFromList

	thumb_func_start InheritIVs
InheritIVs: @ 8045AC0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r0
	mov r8, r1
	movs r5, 0
	add r1, sp, 0x4
	add r7, sp, 0xC
	adds r2, r1, 0
_08045AD6:
	adds r0, r2, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08045AD6
	movs r5, 0
	adds r6, r1, 0
_08045AE8:
	bl Random
	mov r1, sp
	adds r4, r1, r5
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	subs r1, r5
	bl __modsi3
	adds r0, r6, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	adds r0, r6, 0
	bl RemoveIVIndexFromList
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08045AE8
	movs r5, 0
	movs r4, 0x1
_08045B18:
	bl Random
	adds r1, r7, r5
	lsls r0, 16
	lsrs r0, 16
	ands r0, r4
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08045B18
	movs r5, 0
_08045B32:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08045C0E
	lsls r0, 2
	ldr r1, _08045B48 @ =_08045B4C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08045B48: .4byte _08045B4C
	.align 2, 0
_08045B4C:
	.4byte _08045B64
	.4byte _08045B82
	.4byte _08045B9C
	.4byte _08045BB6
	.4byte _08045BD0
	.4byte _08045BF0
_08045B64:
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, 0x8C
	muls r0, r1
	add r0, r8
	movs r1, 0x27
	bl GetBoxMonData
	add r2, sp, 0x10
	strb r0, [r2]
	mov r0, r9
	movs r1, 0x27
	bl sub_804037C
	b _08045C0E
_08045B82:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, 0x8C
	muls r0, r1
	add r0, r8
	movs r1, 0x28
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x28
	b _08045BE8
_08045B9C:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, 0x8C
	muls r0, r1
	add r0, r8
	movs r1, 0x29
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x29
	b _08045BE8
_08045BB6:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, 0x8C
	muls r0, r1
	add r0, r8
	movs r1, 0x2A
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2A
	b _08045BE8
_08045BD0:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, 0x8C
	muls r0, r1
	add r0, r8
	movs r1, 0x2B
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2B
_08045BE8:
	adds r2, r4, 0
	bl sub_804037C
	b _08045C0E
_08045BF0:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, 0x8C
	muls r0, r1
	add r0, r8
	movs r1, 0x2C
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2C
	adds r2, r4, 0
	bl sub_804037C
_08045C0E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08045B32
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end InheritIVs

	thumb_func_start GetEggMoves
GetEggMoves: @ 8045C28
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r6, 0
	movs r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r5, _08045C50 @ =gUnknown_825EF0C
	ldrh r1, [r5]
	ldr r7, _08045C54 @ =0x00004e20
	adds r0, r3, r7
	cmp r1, r0
	bne _08045C58
	movs r4, 0x1
	b _08045C7A
	.align 2, 0
_08045C50: .4byte gUnknown_825EF0C
_08045C54: .4byte 0x00004e20
_08045C58:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08045CC4 @ =0x00000471
	ldr r5, _08045CC8 @ =gUnknown_825EF0C
	cmp r2, r0
	bhi _08045C7A
	lsls r0, r2, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r7, _08045CCC @ =0x00004e20
	adds r0, r3, r7
	cmp r1, r0
	bne _08045C58
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08045C7A:
	movs r2, 0
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r1, _08045CCC @ =0x00004e20
	cmp r0, r1
	bhi _08045CB6
	adds r7, r5, 0
	adds r3, r1, 0
_08045C8C:
	lsls r1, r2, 1
	add r1, r8
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bhi _08045CB6
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r3
	bls _08045C8C
_08045CB6:
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045CC4: .4byte 0x00000471
_08045CC8: .4byte gUnknown_825EF0C
_08045CCC: .4byte 0x00004e20
	thumb_func_end GetEggMoves

	thumb_func_start BuildEggMoveset
BuildEggMoveset: @ 8045CD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r7, r0, 0
	mov r10, r1
	mov r9, r2
	movs r0, 0
	str r0, [sp]
	movs r6, 0
	ldr r5, _08045DD4 @ =gUnknown_2024580
	movs r2, 0
	ldr r4, _08045DD8 @ =gUnknown_202455C
	ldr r3, _08045DDC @ =gUnknown_2024564
_08045CF0:
	lsls r1, r6, 1
	adds r0, r1, r5
	strh r2, [r0]
	adds r0, r1, r4
	strh r2, [r0]
	adds r1, r3
	strh r2, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08045CF0
	movs r6, 0
	ldr r2, _08045DE0 @ =gUnknown_202456C
	movs r1, 0
_08045D0E:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x9
	bls _08045D0E
	movs r6, 0
	ldr r2, _08045DE4 @ =gUnknown_20244F8
	movs r1, 0
_08045D24:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x31
	bls _08045D24
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08045DE4 @ =gUnknown_20244F8
	bl GetLevelUpMovesBySpecies
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r6, 0
	ldr r1, _08045DD8 @ =gUnknown_202455C
	mov r8, r1
_08045D52:
	adds r5, r6, 0
	adds r5, 0xD
	mov r0, r10
	adds r1, r5, 0
	bl GetBoxMonData
	lsls r4, r6, 1
	mov r2, r8
	adds r1, r4, r2
	strh r0, [r1]
	mov r0, r9
	adds r1, r5, 0
	bl GetBoxMonData
	ldr r1, _08045DD4 @ =gUnknown_2024580
	adds r4, r1
	strh r0, [r4]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08045D52
	ldr r1, _08045DE0 @ =gUnknown_202456C
	adds r0, r7, 0
	bl GetEggMoves
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r6, 0
_08045D8E:
	ldr r0, _08045DD8 @ =gUnknown_202455C
	lsls r1, r6, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	mov r9, r0
	cmp r1, 0
	beq _08045E04
	movs r5, 0
	cmp r5, r8
	bcs _08045DF6
	adds r4, r2, 0
	ldr r2, _08045DE8 @ =0x0000ffff
_08045DA6:
	ldr r0, _08045DE0 @ =gUnknown_202456C
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08045DEC
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _08045DF6
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _08045DF6
	.align 2, 0
_08045DD4: .4byte gUnknown_2024580
_08045DD8: .4byte gUnknown_202455C
_08045DDC: .4byte gUnknown_2024564
_08045DE0: .4byte gUnknown_202456C
_08045DE4: .4byte gUnknown_20244F8
_08045DE8: .4byte 0x0000ffff
_08045DEC:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _08045DA6
_08045DF6:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, _08045F20 @ =gUnknown_202455C
	mov r9, r3
	cmp r6, 0x3
	bls _08045D8E
_08045E04:
	movs r6, 0
_08045E06:
	lsls r0, r6, 1
	mov r2, r9
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, 0
	adds r6, 0x1
	mov r8, r6
	cmp r1, 0
	beq _08045E68
	movs r5, 0
	ldr r0, _08045F20 @ =gUnknown_202455C
	adds r4, r2, r0
	ldr r6, _08045F24 @ =0x0000ffff
	mov r9, r0
_08045E22:
	ldr r3, _08045F28 @ =0x00000121
	adds r0, r5, r3
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBattleMoveId
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bne _08045E5E
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl sub_8043C2C
	cmp r0, 0
	beq _08045E5E
	ldrh r1, [r4]
	adds r0, r7, 0
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bne _08045E5E
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
_08045E5E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x39
	bls _08045E22
_08045E68:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08045E06
	movs r6, 0
	mov r2, r9
	ldrh r0, [r2]
	ldr r3, _08045F2C @ =gUnknown_2024564
	mov r10, r3
	cmp r0, 0
	beq _08045ED2
	mov r4, r9
	ldr r0, _08045F30 @ =gUnknown_2024580
	mov r9, r0
	mov r12, r10
_08045E88:
	movs r5, 0
	lsls r2, r6, 1
	adds r6, 0x1
	mov r8, r6
	adds r3, r2, r4
_08045E92:
	lsls r0, r5, 1
	add r0, r9
	ldrh r2, [r3]
	adds r1, r2, 0
	ldrh r0, [r0]
	cmp r1, r0
	bne _08045EB4
	cmp r1, 0
	beq _08045EB4
	ldr r1, [sp]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 1
	add r1, r12
	strh r2, [r1]
_08045EB4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _08045E92
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08045ED2
	lsls r0, r6, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	bne _08045E88
_08045ED2:
	movs r6, 0
	mov r2, r10
	ldrh r0, [r2]
	cmp r0, 0
	beq _08045F5C
_08045EDC:
	movs r5, 0
	adds r3, r6, 0x1
	mov r8, r3
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcs _08045F44
	ldr r2, _08045F24 @ =0x0000ffff
_08045EEA:
	ldr r1, _08045F34 @ =gUnknown_20244F8
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	beq _08045F38
	lsls r0, r6, 1
	mov r3, r10
	adds r4, r0, r3
	ldrh r0, [r4]
	cmp r0, r1
	bne _08045F38
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _08045F44
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _08045F44
	.align 2, 0
_08045F20: .4byte gUnknown_202455C
_08045F24: .4byte 0x0000ffff
_08045F28: .4byte 0x00000121
_08045F2C: .4byte gUnknown_2024564
_08045F30: .4byte gUnknown_2024580
_08045F34: .4byte gUnknown_20244F8
_08045F38:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcc _08045EEA
_08045F44:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08045F5C
	ldr r0, _08045F6C @ =gUnknown_2024564
	lsls r1, r6, 1
	adds r1, r0
	ldrh r1, [r1]
	mov r10, r0
	cmp r1, 0
	bne _08045EDC
_08045F5C:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045F6C: .4byte gUnknown_2024564
	thumb_func_end BuildEggMoveset

	thumb_func_start RemoveEggFromDayCare
RemoveEggFromDayCare: @ 8045F70
	adds r3, r0, 0
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r3, r1
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r3, r1
	strb r2, [r0]
	bx lr
	thumb_func_end RemoveEggFromDayCare

	thumb_func_start RejectEggFromDayCare
RejectEggFromDayCare: @ 8045F88
	push {lr}
	ldr r0, _08045F9C @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl RemoveEggFromDayCare
	pop {r0}
	bx r0
	.align 2, 0
_08045F9C: .4byte gUnknown_3005008
	thumb_func_end RejectEggFromDayCare

	thumb_func_start sub_8045FA0
sub_8045FA0: @ 8045FA0
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrh r1, [r4]
	movs r7, 0xB4
	lsls r7, 1
	cmp r1, r7
	beq _08045FB8
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _08045FFA
_08045FB8:
	adds r0, r5, 0
	movs r1, 0xC
	bl GetBoxMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r0, 0x8C
	movs r1, 0xC
	bl GetBoxMonData
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4]
	cmp r0, r7
	bne _08045FE4
	cmp r6, 0xDD
	beq _08045FE4
	cmp r2, 0xDD
	beq _08045FE4
	movs r0, 0xCA
	strh r0, [r4]
_08045FE4:
	ldrh r1, [r4]
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _08045FFA
	cmp r6, 0xDC
	beq _08045FFA
	cmp r2, 0xDC
	beq _08045FFA
	movs r0, 0xB7
	strh r0, [r4]
_08045FFA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8045FA0

	thumb_func_start sub_8046000
sub_8046000: @ 8046000
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	movs r4, 0
	movs r7, 0x1
_08046010:
	movs r0, 0x8C
	muls r0, r4
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetBoxMonData
	lsls r1, r4, 1
	add r1, sp
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bne _08046038
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6]
	strb r4, [r6, 0x1]
	b _0804604E
_08046038:
	adds r0, r5, 0
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	bne _0804604E
	strb r4, [r6]
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6, 0x1]
_0804604E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08046010
	ldrb r0, [r6]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	bl sub_8045970
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bne _08046080
	movs r0, 0x8C
	lsls r0, 1
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08046080
	movs r4, 0x20
_08046080:
	ldr r0, _080460D0 @ =0x00000183
	cmp r4, r0
	bne _0804609A
	subs r0, 0x6B
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _0804609A
	movs r4, 0xC1
	lsls r4, 1
_0804609A:
	ldrb r0, [r6, 0x1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r0, 0x84
	bne _080460C2
	ldrb r1, [r6]
	movs r0, 0x8C
	muls r0, r1
	add r0, r8
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	beq _080460C2
	ldrb r1, [r6, 0x1]
	ldrb r0, [r6]
	strb r0, [r6, 0x1]
	strb r1, [r6]
_080460C2:
	adds r0, r4, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080460D0: .4byte 0x00000183
	thumb_func_end sub_8046000

	thumb_func_start sub_80460D4
sub_80460D4: @ 80460D4
	push {r4-r6,lr}
	sub sp, 0x6C
	adds r5, r0, 0
	add r6, sp, 0x64
	adds r1, r6, 0
	bl sub_8046000
	add r4, sp, 0x68
	strh r0, [r4]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8045FA0
	ldrh r1, [r4]
	mov r0, sp
	adds r2, r5, 0
	bl SetInitialEggData
	mov r0, sp
	adds r1, r5, 0
	bl InheritIVs
	ldrb r0, [r6, 0x1]
	movs r2, 0x8C
	adds r1, r0, 0
	muls r1, r2
	adds r1, r5, r1
	ldrb r0, [r6]
	muls r2, r0
	adds r2, r5, r2
	mov r0, sp
	bl BuildEggMoveset
	mov r2, sp
	adds r2, 0x6A
	movs r0, 0x1
	strb r0, [r2]
	mov r0, sp
	movs r1, 0x2D
	bl sub_804037C
	ldr r0, _0804614C @ =gUnknown_2024284
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r1
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	adds r0, r5, 0
	bl RemoveEggFromDayCare
	add sp, 0x6C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804614C: .4byte gUnknown_2024284
	thumb_func_end sub_80460D4

	thumb_func_start CreateEgg
CreateEgg: @ 8046150
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	adds r7, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r0, 0x12
	add r0, sp
	mov r8, r0
	strb r4, [r0]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	movs r0, 0x1
	mov r9, r0
	mov r0, r9
	strb r0, [r4]
	adds r0, r7, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl sub_804037C
	ldr r2, _08046200 @ =gUnknown_825F83E
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_804037C
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _08046204 @ =gUnknown_8254795
	adds r2, r0
	adds r0, r7, 0
	movs r1, 0x20
	bl sub_804037C
	adds r0, r7, 0
	movs r1, 0x24
	mov r2, r8
	bl sub_804037C
	adds r0, r7, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_804037C
	cmp r6, 0
	beq _080461E2
	add r2, sp, 0x14
	movs r0, 0xFD
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x23
	bl sub_804037C
_080461E2:
	mov r2, sp
	adds r2, 0x15
	mov r0, r9
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x2D
	bl sub_804037C
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046200: .4byte gUnknown_825F83E
_08046204: .4byte gUnknown_8254795
	thumb_func_end CreateEgg

	thumb_func_start SetInitialEggData
SetInitialEggData: @ 8046208
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	bl Random
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	ldrh r1, [r4]
	lsls r0, 16
	orrs r1, r0
	movs r0, 0x1
	mov r8, r0
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r1, 0x12
	add r1, sp
	mov r9, r1
	strb r4, [r1]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	mov r0, r8
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl sub_804037C
	ldr r2, _080462A4 @ =gUnknown_825F83E
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_804037C
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _080462A8 @ =gUnknown_8254795
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x20
	bl sub_804037C
	adds r0, r6, 0
	movs r1, 0x24
	mov r2, r9
	bl sub_804037C
	adds r0, r6, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_804037C
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080462A4: .4byte gUnknown_825F83E
_080462A8: .4byte gUnknown_8254795
	thumb_func_end SetInitialEggData

	thumb_func_start sub_80462AC
sub_80462AC: @ 80462AC
	push {lr}
	ldr r0, _080462C0 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl sub_80460D4
	pop {r0}
	bx r0
	.align 2, 0
_080462C0: .4byte gUnknown_3005008
	thumb_func_end sub_80462AC

	thumb_func_start sub_80462C4
sub_80462C4: @ 80462C4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	movs r7, 0
	movs r5, 0
_080462CE:
	movs r0, 0x8C
	adds r4, r5, 0
	muls r4, r0
	adds r0, r6, r4
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _080462EE
	adds r1, r6, 0
	adds r1, 0x88
	adds r1, r4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	adds r7, 0x1
_080462EE:
	adds r5, 0x1
	cmp r5, 0x1
	bls _080462CE
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r6, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08046334
	cmp r7, 0x2
	bne _08046334
	subs r1, 0x4
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08046334
	adds r0, r6, 0
	bl GetDaycareCompatibilityScore
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0804634C @ =0x0000ffff
	bl __udivsi3
	cmp r4, r0
	bls _08046334
	bl sub_8045A48
_08046334:
	movs r0, 0x8D
	lsls r0, 1
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080463A8
	movs r5, 0
	b _080463A0
	.align 2, 0
_0804634C: .4byte 0x0000ffff
_08046350:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08046388 @ =gUnknown_2024284
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0804639E
	adds r0, r4, 0
	movs r1, 0x4
	bl GetMonData
	cmp r0, 0
	bne _0804639E
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	str r0, [sp]
	cmp r0, 0
	bne _08046390
	ldr r0, _0804638C @ =gUnknown_20370C0
	strh r5, [r0]
	movs r0, 0x1
	b _080463AA
	.align 2, 0
_08046388: .4byte gUnknown_2024284
_0804638C: .4byte gUnknown_20370C0
_08046390:
	subs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x20
	mov r2, sp
	bl sub_804037C
_0804639E:
	adds r5, 0x1
_080463A0:
	ldr r0, _080463B4 @ =gUnknown_2024029
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08046350
_080463A8:
	movs r0, 0
_080463AA:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080463B4: .4byte gUnknown_2024029
	thumb_func_end sub_80462C4

	thumb_func_start sub_80463B8
sub_80463B8: @ 80463B8
	push {r4,lr}
	ldr r4, _080463F0 @ =gUnknown_3005008
	ldr r0, [r4]
	ldr r1, _080463F4 @ =0x00003c98
	adds r0, r1
	movs r1, 0x5
	bl GetBoxMonData
	cmp r0, 0
	beq _080463D8
	ldr r1, [r4]
	ldr r0, _080463F8 @ =0x00003d20
	adds r1, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_080463D8:
	ldr r0, [r4]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl sub_80462C4
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080463F0: .4byte gUnknown_3005008
_080463F4: .4byte 0x00003c98
_080463F8: .4byte 0x00003d20
	thumb_func_end sub_80463B8

	thumb_func_start sub_80463FC
sub_80463FC: @ 80463FC
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	thumb_func_end sub_80463FC

	thumb_func_start _GetDaycareMonNicknames
_GetDaycareMonNicknames: @ 804640C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08046436
	ldr r1, _08046454 @ =gUnknown_2021CD0
	adds r0, r4, 0
	bl GetBoxMonNick
	adds r0, r4, 0
	movs r1, 0x7
	mov r2, sp
	bl GetBoxMonData
	ldr r0, _08046458 @ =gUnknown_2021D04
	mov r1, sp
	bl StringCopy
_08046436:
	adds r4, 0x8C
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _0804644C
	ldr r1, _0804645C @ =gUnknown_2021CF0
	adds r0, r4, 0
	bl GetBoxMonNick
_0804644C:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046454: .4byte gUnknown_2021CD0
_08046458: .4byte gUnknown_2021D04
_0804645C: .4byte gUnknown_2021CF0
	thumb_func_end _GetDaycareMonNicknames

	thumb_func_start GetSelectedMonNickAndSpecies
GetSelectedMonNickAndSpecies: @ 8046460
	push {r4,r5,lr}
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08046494 @ =gUnknown_2024284
	adds r0, r4
	ldr r1, _08046498 @ =gUnknown_2021CD0
	bl GetBoxMonNick
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08046494: .4byte gUnknown_2024284
_08046498: .4byte gUnknown_2021CD0
	thumb_func_end GetSelectedMonNickAndSpecies

	thumb_func_start GetDaycareMonNicknames
GetDaycareMonNicknames: @ 804649C
	push {lr}
	ldr r0, _080464B0 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl _GetDaycareMonNicknames
	pop {r0}
	bx r0
	.align 2, 0
_080464B0: .4byte gUnknown_3005008
	thumb_func_end GetDaycareMonNicknames

	thumb_func_start sub_80464B4
sub_80464B4: @ 80464B4
	push {r4,lr}
	ldr r4, _080464D0 @ =gUnknown_3005008
	ldr r0, [r4]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl sub_80463FC
	lsls r0, 24
	cmp r0, 0
	beq _080464D4
	movs r0, 0x1
	b _080464F2
	.align 2, 0
_080464D0: .4byte gUnknown_3005008
_080464D4:
	ldr r0, [r4]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl CountPokemonInDaycare
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080464EC
	movs r0, 0
	b _080464F2
_080464EC:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080464F2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80464B4

	thumb_func_start GetDaycarePokemonCount
GetDaycarePokemonCount: @ 80464F8
	push {lr}
	ldr r0, _08046518 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl CountPokemonInDaycare
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08046512
	movs r0, 0
_08046512:
	pop {r1}
	bx r1
	.align 2, 0
_08046518: .4byte gUnknown_3005008
	thumb_func_end GetDaycarePokemonCount

	thumb_func_start EggGroupsOverlap
EggGroupsOverlap: @ 804651C
	push {r4-r6,lr}
	adds r5, r1, 0
	movs r4, 0
	adds r1, r0, 0
_08046524:
	movs r3, 0
	ldrh r0, [r1]
	adds r2, r5, 0
_0804652A:
	ldrh r6, [r2]
	cmp r0, r6
	bne _08046534
	movs r0, 0x1
	b _08046546
_08046534:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x1
	ble _0804652A
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x1
	ble _08046524
	movs r0, 0
_08046546:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end EggGroupsOverlap

	thumb_func_start GetDaycareCompatibilityScore
GetDaycareCompatibilityScore: @ 804654C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	str r0, [sp, 0x1C]
	movs r7, 0
	mov r0, sp
	adds r0, 0x8
	str r0, [sp, 0x20]
	add r1, sp, 0xC
	mov r9, r1
	mov r2, sp
	adds r2, 0x14
	str r2, [sp, 0x24]
	subs r0, 0x6
	ldr r1, _08046600 @ =gUnknown_8254784
	mov r10, r1
	ldr r5, [sp, 0x20]
	mov r8, r0
	mov r6, sp
	str r2, [sp, 0x28]
	mov r2, r9
	str r2, [sp, 0x2C]
_0804657E:
	movs r0, 0x8C
	adds r4, r7, 0
	muls r4, r0
	ldr r0, [sp, 0x1C]
	adds r4, r0, r4
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBoxMonData
	ldr r1, [sp, 0x2C]
	stm r1!, {r0}
	str r1, [sp, 0x2C]
	adds r0, r4, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	ldrh r0, [r5]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp, 0x28]
	stm r2!, {r0}
	str r2, [sp, 0x28]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r0, [r0, 0x14]
	strh r0, [r6]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r0, [r0, 0x15]
	mov r1, r8
	strh r0, [r1]
	adds r5, 0x2
	movs r2, 0x4
	add r8, r2
	adds r6, 0x4
	adds r7, 0x1
	cmp r7, 0x1
	bls _0804657E
	mov r0, sp
	ldrh r1, [r0]
	cmp r1, 0xF
	beq _080465FC
	ldrh r0, [r0, 0x4]
	cmp r0, 0xF
	beq _080465FC
	cmp r1, 0xD
	bne _08046604
	cmp r0, 0xD
	bne _08046608
_080465FC:
	movs r0, 0
	b _0804665C
	.align 2, 0
_08046600: .4byte gUnknown_8254784
_08046604:
	cmp r0, 0xD
	bne _08046614
_08046608:
	ldr r1, [sp, 0xC]
	mov r2, r9
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _08046656
	b _0804665A
_08046614:
	ldr r0, [sp, 0x14]
	ldr r2, [sp, 0x24]
	ldr r1, [r2, 0x4]
	cmp r0, r1
	beq _080465FC
	cmp r0, 0xFF
	beq _080465FC
	cmp r1, 0xFF
	beq _080465FC
	add r1, sp, 0x4
	mov r0, sp
	bl EggGroupsOverlap
	lsls r0, 24
	cmp r0, 0
	beq _080465FC
	ldr r0, [sp, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r0, [r0]
	cmp r0, r1
	bne _0804664C
	ldr r1, [sp, 0xC]
	mov r2, r9
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _0804665A
	movs r0, 0x46
	b _0804665C
_0804664C:
	ldr r1, [sp, 0xC]
	mov r2, r9
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bne _0804665A
_08046656:
	movs r0, 0x14
	b _0804665C
_0804665A:
	movs r0, 0x32
_0804665C:
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetDaycareCompatibilityScore

	thumb_func_start GetDaycareCompatibilityScoreFromSave
GetDaycareCompatibilityScoreFromSave: @ 804666C
	push {lr}
	ldr r0, _08046684 @ =gUnknown_3005008
	ldr r0, [r0]
	movs r1, 0xBE
	lsls r1, 6
	adds r0, r1
	bl GetDaycareCompatibilityScore
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08046684: .4byte gUnknown_3005008
	thumb_func_end GetDaycareCompatibilityScoreFromSave

	thumb_func_start SetDaycareCompatibilityString
SetDaycareCompatibilityString: @ 8046688
	push {lr}
	bl GetDaycareCompatibilityScoreFromSave
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	movs r1, 0
	cmp r0, 0
	bne _0804669C
	movs r1, 0x3
_0804669C:
	cmp r0, 0x14
	bne _080466A2
	movs r1, 0x2
_080466A2:
	cmp r0, 0x32
	bne _080466A8
	movs r1, 0x1
_080466A8:
	cmp r2, 0x46
	bne _080466AE
	movs r1, 0
_080466AE:
	ldr r0, _080466C0 @ =gUnknown_2021D18
	ldr r2, _080466C4 @ =gUnknown_825F82C
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080466C0: .4byte gUnknown_2021D18
_080466C4: .4byte gUnknown_825F82C
	thumb_func_end SetDaycareCompatibilityString

	thumb_func_start NameHasGenderSymbol
NameHasGenderSymbol: @ 80466C8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r2, sp
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x1]
	strb r0, [r2]
	movs r3, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _0804670C
_080466E4:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, 0xB5
	bne _080466F2
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_080466F2:
	ldrb r0, [r1]
	cmp r0, 0xB6
	bne _080466FE
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	strb r0, [r2, 0x1]
_080466FE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080466E4
_0804670C:
	cmp r5, 0
	bne _08046720
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	beq _08046720
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _08046734
_08046720:
	cmp r5, 0xFE
	bne _08046738
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _08046738
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _08046738
_08046734:
	movs r0, 0x1
	b _0804673A
_08046738:
	movs r0, 0
_0804673A:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end NameHasGenderSymbol

	thumb_func_start AppendGenderSymbol
AppendGenderSymbol: @ 8046744
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _08046764
	movs r1, 0
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08046780
	ldr r1, _08046760 @ =gUnknown_8261EC1
	b _08046782
	.align 2, 0
_08046760: .4byte gUnknown_8261EC1
_08046764:
	cmp r1, 0xFE
	bne _08046780
	adds r0, r4, 0
	movs r1, 0xFE
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08046780
	ldr r1, _0804677C @ =gUnknown_8261EC3
	b _08046782
	.align 2, 0
_0804677C: .4byte gUnknown_8261EC3
_08046780:
	ldr r1, _08046790 @ =gUnknown_8261EC5
_08046782:
	adds r0, r4, 0
	bl StringAppend
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08046790: .4byte gUnknown_8261EC5
	thumb_func_end AppendGenderSymbol

	thumb_func_start AppendMonGenderSymbol
AppendMonGenderSymbol: @ 8046794
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl GetBoxMonGender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl AppendGenderSymbol
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AppendMonGenderSymbol

	thumb_func_start GetDaycareLevelMenuText
GetDaycareLevelMenuText: @ 80467B0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	mov r8, r0
	adds r7, r1, 0
	movs r0, 0xFF
	strb r0, [r7]
	movs r6, 0
	add r0, sp, 0x14
	mov r9, r0
_080467C8:
	movs r0, 0x8C
	adds r4, r6, 0
	muls r4, r0
	add r4, r8
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	mov r1, sp
	adds r5, r1, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetBoxMonNick
	adds r0, r5, 0
	adds r1, r4, 0
	bl AppendMonGenderSymbol
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _080467C8
	adds r0, r7, 0
	mov r1, sp
	bl StringCopy
	ldr r4, _0804682C @ =gUnknown_825F83C
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	adds r0, r7, 0
	mov r1, r9
	bl StringAppend
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	ldr r1, _08046830 @ =gUnknown_84161C8
	adds r0, r7, 0
	bl StringAppend
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804682C: .4byte gUnknown_825F83C
_08046830: .4byte gUnknown_84161C8
	thumb_func_end GetDaycareLevelMenuText

	thumb_func_start GetDaycareLevelMenuLevelText
GetDaycareLevelMenuLevelText: @ 8046834
	push {r4-r6,lr}
	sub sp, 0x14
	adds r6, r0, 0
	adds r4, r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r5, 0
_08046842:
	adds r0, r4, 0
	ldr r1, _08046890 @ =gUnknown_8416223
	bl StringAppend
	movs r0, 0x8C
	adds r2, r5, 0
	muls r2, r0
	adds r0, r6, r2
	adds r1, r6, 0
	adds r1, 0x88
	adds r1, r2
	ldr r1, [r1]
	bl GetLevelAfterDaycareSteps
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	movs r2, 0
	movs r3, 0x3
	bl sub_8008E78
	adds r0, r4, 0
	mov r1, sp
	bl StringAppend
	adds r0, r4, 0
	ldr r1, _08046894 @ =gUnknown_825F83C
	bl StringAppend
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08046842
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046890: .4byte gUnknown_8416223
_08046894: .4byte gUnknown_825F83C
	thumb_func_end GetDaycareLevelMenuLevelText

	thumb_func_start DaycareAddTextPrinter
DaycareAddTextPrinter: @ 8046898
	push {r4,r5,lr}
	sub sp, 0x10
	str r1, [sp]
	mov r1, sp
	strb r0, [r1, 0x4]
	movs r0, 0x3
	strb r0, [r1, 0x5]
	mov r0, sp
	strb r2, [r0, 0x6]
	strb r3, [r0, 0x7]
	strb r2, [r0, 0x8]
	strb r3, [r0, 0x9]
	mov r3, sp
	ldrb r1, [r3, 0xC]
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r3, 0xC]
	ldr r3, _08046908 @ =gUnknown_3003E50
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	mov r0, sp
	movs r5, 0x1
	movs r1, 0x1
	strb r1, [r0, 0xA]
	strb r1, [r0, 0xB]
	mov r3, sp
	ldrb r1, [r3, 0xC]
	movs r4, 0xF
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r3, 0xC]
	mov r1, sp
	ldrb r0, [r1, 0xD]
	ands r2, r0
	orrs r2, r5
	strb r2, [r1, 0xD]
	ands r2, r4
	movs r0, 0x30
	orrs r2, r0
	strb r2, [r1, 0xD]
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0
	bl AddTextPrinter
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046908: .4byte gUnknown_3003E50
	thumb_func_end DaycareAddTextPrinter

	thumb_func_start DaycarePrintMonNick
DaycarePrintMonNick: @ 804690C
	push {r4-r6,lr}
	sub sp, 0x14
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r3, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x8C
	muls r0, r2
	adds r5, r0
	adds r0, r5, 0
	mov r1, sp
	bl GetBoxMonNick
	mov r0, sp
	adds r1, r5, 0
	bl AppendMonGenderSymbol
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0x8
	adds r3, r6, 0
	bl DaycareAddTextPrinter
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DaycarePrintMonNick

	thumb_func_start DaycarePrintMonLvl
DaycarePrintMonLvl: @ 8046944
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080469B0 @ =gUnknown_8416223
	mov r0, sp
	bl strcpy
	movs r0, 0x8C
	adds r1, r6, 0
	muls r1, r0
	adds r0, r4, r1
	adds r4, 0x88
	adds r4, r1
	ldr r1, [r4]
	bl GetLevelAfterDaycareSteps
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	add r4, sp, 0xC
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl sub_8008E78
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	movs r0, 0x3
	mov r1, sp
	movs r2, 0
	bl sub_8005ED4
	movs r2, 0x84
	subs r2, r0
	adds r0, r5, 0
	mov r1, sp
	mov r3, r8
	bl DaycareAddTextPrinter
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080469B0: .4byte gUnknown_8416223
	thumb_func_end DaycarePrintMonLvl

	thumb_func_start DaycarePrintMonInfo
DaycarePrintMonInfo: @ 80469B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 24
	lsrs r5, r2, 24
	cmp r6, 0x1
	bhi _080469EE
	ldr r0, _080469F8 @ =gUnknown_3005008
	mov r8, r0
	ldr r0, [r0]
	movs r4, 0xBE
	lsls r4, 6
	adds r0, r4
	adds r1, r7, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl DaycarePrintMonNick
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4
	adds r1, r7, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl DaycarePrintMonLvl
_080469EE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080469F8: .4byte gUnknown_3005008
	thumb_func_end DaycarePrintMonInfo

	thumb_func_start Task_HandleDaycareLevelMenuInput
Task_HandleDaycareLevelMenuInput: @ 80469FC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08046A2C @ =gUnknown_3005090
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrb r0, [r4, 0x8]
	bl ListMenuHandleInput
	adds r1, r0, 0
	ldr r0, _08046A30 @ =gUnknown_30030F0
	ldrh r2, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _08046A7C
	cmp r1, 0x1
	bls _08046A34
	cmp r1, 0x5
	beq _08046A40
	b _08046A46
	.align 2, 0
_08046A2C: .4byte gUnknown_3005090
_08046A30: .4byte gUnknown_30030F0
_08046A34:
	ldr r0, _08046A3C @ =gUnknown_20370D0
	strh r1, [r0]
	b _08046A46
	.align 2, 0
_08046A3C: .4byte gUnknown_20370D0
_08046A40:
	ldr r1, _08046A74 @ =gUnknown_20370D0
	movs r0, 0x2
	strh r0, [r1]
_08046A46:
	ldr r0, _08046A78 @ =gUnknown_3005090
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	ldrb r0, [r4, 0xA]
	movs r1, 0x1
	bl sub_80F6F9C
	ldrb r0, [r4, 0xA]
	bl RemoveWindow
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	b _08046AAC
	.align 2, 0
_08046A74: .4byte gUnknown_20370D0
_08046A78: .4byte gUnknown_3005090
_08046A7C:
	movs r1, 0x2
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _08046AAC
	ldr r0, _08046AB4 @ =gUnknown_20370D0
	strh r1, [r0]
	ldrb r0, [r4, 0x8]
	movs r1, 0
	movs r2, 0
	bl sub_810713C
	ldrb r0, [r4, 0xA]
	movs r1, 0x1
	bl sub_80F6F9C
	ldrb r0, [r4, 0xA]
	bl RemoveWindow
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08046AAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046AB4: .4byte gUnknown_20370D0
	thumb_func_end Task_HandleDaycareLevelMenuInput

	thumb_func_start ShowDaycareLevelMenu
ShowDaycareLevelMenu: @ 8046AB8
	push {r4,r5,lr}
	sub sp, 0x18
	ldr r0, _08046B18 @ =gUnknown_825F7F4
	bl AddWindow
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_80F6F1C
	mov r1, sp
	ldr r0, _08046B1C @ =gUnknown_825F814
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r0, sp
	strb r4, [r0, 0x10]
	movs r1, 0
	movs r2, 0
	bl ListMenuInit
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, _08046B20 @ =Task_HandleDaycareLevelMenuInput
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08046B24 @ =gUnknown_3005090
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r4, [r1, 0xA]
	add sp, 0x18
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046B18: .4byte gUnknown_825F7F4
_08046B1C: .4byte gUnknown_825F814
_08046B20: .4byte Task_HandleDaycareLevelMenuInput
_08046B24: .4byte gUnknown_3005090
	thumb_func_end ShowDaycareLevelMenu

	thumb_func_start ChooseSendDaycareMon
ChooseSendDaycareMon: @ 8046B28
	push {lr}
	bl sub_8128370
	ldr r1, _08046B38 @ =gUnknown_30030F0
	ldr r0, _08046B3C @ =c2_exit_to_overworld_2_switch
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08046B38: .4byte gUnknown_30030F0
_08046B3C: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end ChooseSendDaycareMon

	thumb_func_start sub_8046B40
sub_8046B40: @ 8046B40
	push {lr}
	bl GetCursorSelectionMonId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08046B64 @ =gUnknown_2024284
	adds r0, r1
	ldr r1, _08046B68 @ =gUnknown_3005008
	ldr r1, [r1]
	ldr r2, _08046B6C @ =0x00003c98
	adds r1, r2
	bl StorePokemonInDaycare
	pop {r0}
	bx r0
	.align 2, 0
_08046B64: .4byte gUnknown_2024284
_08046B68: .4byte gUnknown_3005008
_08046B6C: .4byte 0x00003c98
	thumb_func_end sub_8046B40

	thumb_func_start sub_8046B70
sub_8046B70: @ 8046B70
	push {lr}
	ldr r0, _08046B88 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08046B8C @ =0x00003c98
	adds r0, r1
	bl GetDaycareCostForSelectedMon
	ldr r1, _08046B90 @ =gUnknown_20370C2
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08046B88: .4byte gUnknown_3005008
_08046B8C: .4byte 0x00003c98
_08046B90: .4byte gUnknown_20370C2
	thumb_func_end sub_8046B70

	thumb_func_start sub_8046B94
sub_8046B94: @ 8046B94
	push {lr}
	ldr r0, _08046BAC @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08046BB0 @ =0x00003c98
	adds r0, r1
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _08046BB4
	movs r0, 0
	b _08046BB6
	.align 2, 0
_08046BAC: .4byte gUnknown_3005008
_08046BB0: .4byte 0x00003c98
_08046BB4:
	movs r0, 0x1
_08046BB6:
	pop {r1}
	bx r1
	thumb_func_end sub_8046B94

	thumb_func_start sub_8046BBC
sub_8046BBC: @ 8046BBC
	push {lr}
	ldr r0, _08046BD4 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08046BD8 @ =0x00003c98
	adds r0, r1
	bl GetNumLevelsGainedForDaycareMon
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08046BD4: .4byte gUnknown_3005008
_08046BD8: .4byte 0x00003c98
	thumb_func_end sub_8046BBC

	thumb_func_start sub_8046BDC
sub_8046BDC: @ 8046BDC
	push {lr}
	ldr r0, _08046BF4 @ =gUnknown_3005008
	ldr r0, [r0]
	ldr r1, _08046BF8 @ =0x00003c98
	adds r0, r1
	bl TakeSelectedPokemonFromDaycare
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08046BF4: .4byte gUnknown_3005008
_08046BF8: .4byte 0x00003c98
	thumb_func_end sub_8046BDC

	.align 2, 0 @ Don't pad with nop.
