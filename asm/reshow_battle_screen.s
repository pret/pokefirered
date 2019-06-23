	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_44
nullsub_44: @ 8077760
	bx lr
	thumb_func_end nullsub_44

	thumb_func_start sub_8077764
sub_8077764: @ 8077764
	push {lr}
	ldr r2, _080777B0 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0x4C
	movs r1, 0
	bl SetGpuReg
	ldr r0, _080777B4 @ =gBattleScripting
	adds r2, r0, 0
	adds r2, 0x21
	movs r1, 0
	strb r1, [r2]
	adds r0, 0x22
	strb r1, [r0]
	ldr r0, _080777B8 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080777DA
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080777C4
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080777BC
	movs r0, 0x19
	bl HelpSystem_SetSomeVariable2
	b _080777DA
	.align 2, 0
_080777B0: .4byte gPaletteFade
_080777B4: .4byte gBattleScripting
_080777B8: .4byte gBattleTypeFlags
_080777BC:
	movs r0, 0x18
	bl HelpSystem_SetSomeVariable2
	b _080777DA
_080777C4:
	movs r0, 0x80
	ands r1, r0
	cmp r1, 0
	beq _080777D4
	movs r0, 0x1A
	bl HelpSystem_SetSomeVariable2
	b _080777DA
_080777D4:
	movs r0, 0x17
	bl HelpSystem_SetSomeVariable2
_080777DA:
	ldr r0, _080777E4 @ =sub_80777E8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080777E4: .4byte sub_80777E8
	thumb_func_end sub_8077764

	thumb_func_start sub_80777E8
sub_80777E8: @ 80777E8
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _08077804 @ =gBattleScripting
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x14
	bls _080777F8
	b _08077A8A
_080777F8:
	lsls r0, 2
	ldr r1, _08077808 @ =_0807780C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077804: .4byte gBattleScripting
_08077808: .4byte _0807780C
	.align 2, 0
_0807780C:
	.4byte _08077860
	.4byte _08077866
	.4byte _080778E8
	.4byte _08077900
	.4byte _08077906
	.4byte _08077918
	.4byte _0807791E
	.4byte _08077946
	.4byte _0807794A
	.4byte _0807794E
	.4byte _08077952
	.4byte _08077970
	.4byte _08077978
	.4byte _08077980
	.4byte _08077988
	.4byte _08077990
	.4byte _08077998
	.4byte _080779A0
	.4byte _080779A8
	.4byte _080779B0
	.4byte _08077A5C
_08077860:
	bl ResetSpriteData
	b _08077A8A
_08077866:
	movs r0, 0
	bl SetVBlankCallback
	bl ScanlineEffect_Clear
	bl sub_800F324
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl SetBgAttribute
	movs r0, 0
	bl ShowBg
	movs r0, 0x1
	bl ShowBg
	movs r0, 0x2
	bl ShowBg
	movs r0, 0x3
	bl ShowBg
	bl ResetPaletteFade
	ldr r0, _080778C8 @ =gBattle_BG0_X
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080778CC @ =gBattle_BG0_Y
	strh r1, [r0]
	ldr r0, _080778D0 @ =gBattle_BG1_X
	strh r1, [r0]
	ldr r0, _080778D4 @ =gBattle_BG1_Y
	strh r1, [r0]
	ldr r0, _080778D8 @ =gBattle_BG2_X
	strh r1, [r0]
	ldr r0, _080778DC @ =gBattle_BG2_Y
	strh r1, [r0]
	ldr r0, _080778E0 @ =gBattle_BG3_X
	strh r1, [r0]
	ldr r0, _080778E4 @ =gBattle_BG3_Y
	strh r1, [r0]
	b _08077A8A
	.align 2, 0
_080778C8: .4byte gBattle_BG0_X
_080778CC: .4byte gBattle_BG0_Y
_080778D0: .4byte gBattle_BG1_X
_080778D4: .4byte gBattle_BG1_Y
_080778D8: .4byte gBattle_BG2_X
_080778DC: .4byte gBattle_BG2_Y
_080778E0: .4byte gBattle_BG3_X
_080778E4: .4byte gBattle_BG3_Y
_080778E8:
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _080778FC @ =0x01006000
	add r0, sp, 0x4
	bl CpuFastSet
	b _08077A8A
	.align 2, 0
_080778FC: .4byte 0x01006000
_08077900:
	bl LoadBattleTextboxAndBackground
	b _08077A8A
_08077906:
	bl FreeAllSpritePalettes
	ldr r1, _08077914 @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	b _08077A8A
	.align 2, 0
_08077914: .4byte gReservedSpritePaletteCount
_08077918:
	bl ClearSpritesHealthboxAnimData
	b _08077A8A
_0807791E:
	ldr r5, _08077938 @ =gBattleScripting
	adds r4, r5, 0
	adds r4, 0x22
	ldrb r0, [r4]
	bl BattleLoadAllHealthBoxesGfx
	lsls r0, 24
	cmp r0, 0
	beq _0807793C
	movs r0, 0
	strb r0, [r4]
	b _08077A8A
	.align 2, 0
_08077938: .4byte gBattleScripting
_0807793C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r1, r5, 0
	b _08077962
_08077946:
	movs r0, 0
	b _08077954
_0807794A:
	movs r0, 0x1
	b _08077954
_0807794E:
	movs r0, 0x2
	b _08077954
_08077952:
	movs r0, 0x3
_08077954:
	bl sub_8077B0C
	lsls r0, 24
	cmp r0, 0
	beq _08077960
	b _08077A8A
_08077960:
	ldr r1, _0807796C @ =gBattleScripting
_08077962:
	adds r1, 0x21
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	b _08077A8A
	.align 2, 0
_0807796C: .4byte gBattleScripting
_08077970:
	movs r0, 0
	bl sub_8077C38
	b _08077A8A
_08077978:
	movs r0, 0x1
	bl sub_8077C38
	b _08077A8A
_08077980:
	movs r0, 0x2
	bl sub_8077C38
	b _08077A8A
_08077988:
	movs r0, 0x3
	bl sub_8077C38
	b _08077A8A
_08077990:
	movs r0, 0
	bl CreateHealthboxSprite
	b _08077A8A
_08077998:
	movs r0, 0x1
	bl CreateHealthboxSprite
	b _08077A8A
_080779A0:
	movs r0, 0x2
	bl CreateHealthboxSprite
	b _08077A8A
_080779A8:
	movs r0, 0x3
	bl CreateHealthboxSprite
	b _08077A8A
_080779B0:
	bl LoadAndCreateEnemyShadowSprites
	movs r0, 0x1
	bl GetBattlerAtPosition
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _08077A44 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08077A48 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBankEnemyShadowSpriteCallback
	bl sub_8075290
	lsls r0, 24
	cmp r0, 0
	beq _08077A14
	movs r0, 0x3
	bl GetBattlerAtPosition
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl SetBankEnemyShadowSpriteCallback
_08077A14:
	ldr r1, _08077A4C @ =gUnknown_2023FF8
	ldr r0, _08077A50 @ =gBattlerInMenuId
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl ActionSelectionCreateCursorAt
	ldr r0, _08077A54 @ =gWirelessCommType
	ldrb r0, [r0]
	cmp r0, 0
	beq _08077A8A
	ldr r0, _08077A58 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08077A8A
	bl sub_80FCEA8
	movs r0, 0
	movs r1, 0
	bl sub_80FCD74
	b _08077A8A
	.align 2, 0
_08077A44: .4byte gBattlerPartyIndexes
_08077A48: .4byte gEnemyParty
_08077A4C: .4byte gUnknown_2023FF8
_08077A50: .4byte gBattlerInMenuId
_08077A54: .4byte gWirelessCommType
_08077A58: .4byte gReceivedRemoteLinkPlayers
_08077A5C:
	ldr r0, _08077A9C @ =sub_80116F4
	bl SetVBlankCallback
	bl sub_8077AAC
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r2, _08077AA0 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _08077AA4 @ =sub_8011100
	bl SetMainCallback2
	bl sub_80357C8
_08077A8A:
	ldr r1, _08077AA8 @ =gBattleScripting
	adds r1, 0x21
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077A9C: .4byte sub_80116F4
_08077AA0: .4byte gPaletteFade
_08077AA4: .4byte sub_8011100
_08077AA8: .4byte gBattleScripting
	thumb_func_end sub_80777E8

	thumb_func_start sub_8077AAC
sub_8077AAC: @ 8077AAC
	push {lr}
	movs r0, 0x1
	bl EnableInterrupts
	movs r0, 0x50
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x52
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x54
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x48
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x4A
	movs r1, 0x3F
	bl SetGpuReg
	movs r0, 0x40
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x44
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x42
	movs r1, 0
	bl SetGpuReg
	movs r0, 0x46
	movs r1, 0
	bl SetGpuReg
	ldr r1, _08077B08 @ =0x0000b040
	movs r0, 0
	bl SetGpuRegBits
	pop {r0}
	bx r0
	.align 2, 0
_08077B08: .4byte 0x0000b040
	thumb_func_end sub_8077AAC

	thumb_func_start sub_8077B0C
sub_8077B0C: @ 8077B0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08077B54 @ =gBattlersCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08077B1C
	b _08077C2C
_08077B1C:
	adds r0, r4, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08077BA6
	ldr r0, _08077B58 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0xA0
	lsls r1, 8
	ands r0, r1
	movs r1, 0x80
	lsls r1, 8
	cmp r0, r1
	bne _08077B64
	ldr r1, _08077B5C @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077B60 @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_8034658
	b _08077C24
	.align 2, 0
_08077B54: .4byte gBattlersCount
_08077B58: .4byte gBattleTypeFlags
_08077B5C: .4byte gBattlerPartyIndexes
_08077B60: .4byte gEnemyParty
_08077B64:
	ldr r0, _08077B90 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08077B9C
	ldr r1, _08077B94 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077B98 @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	bl BattleLoadOpponentMonSpriteGfx
	b _08077C24
	.align 2, 0
_08077B90: .4byte gUnknown_2024018
_08077B94: .4byte gBattlerPartyIndexes
_08077B98: .4byte gEnemyParty
_08077B9C:
	adds r0, r4, 0
	movs r1, 0
	bl sub_80350BC
	b _08077C24
_08077BA6:
	ldr r0, _08077BC0 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0x80
	ands r1, r2
	cmp r1, 0
	beq _08077BC8
	cmp r4, 0
	bne _08077BC8
	ldr r0, _08077BC4 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	b _08077BDA
	.align 2, 0
_08077BC0: .4byte gBattleTypeFlags
_08077BC4: .4byte gSaveBlock2Ptr
_08077BC8:
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _08077BE2
	cmp r4, 0
	bne _08077BE2
	movs r0, 0x5
_08077BDA:
	movs r1, 0
	bl sub_8034750
	b _08077C24
_08077BE2:
	ldr r0, _08077C10 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08077C1C
	ldr r1, _08077C14 @ =gBattlerPartyIndexes
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077C18 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_8034498
	b _08077C24
	.align 2, 0
_08077C10: .4byte gUnknown_2024018
_08077C14: .4byte gBattlerPartyIndexes
_08077C18: .4byte gPlayerParty
_08077C1C:
	adds r0, r4, 0
	movs r1, 0
	bl sub_80350BC
_08077C24:
	ldr r0, _08077C34 @ =gBattleScripting
	adds r0, 0x22
	movs r1, 0
	strb r1, [r0]
_08077C2C:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08077C34: .4byte gBattleScripting
	thumb_func_end sub_8077B0C

	thumb_func_start sub_8077C38
sub_8077C38: @ 8077C38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08077C6C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r7, r0
	bcc _08077C50
	b _08077FB4
_08077C50:
	ldr r0, _08077C70 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0xA0
	lsls r1, 8
	ands r0, r1
	movs r1, 0x80
	lsls r1, 8
	cmp r0, r1
	bne _08077C74
	adds r0, r7, 0
	bl sub_8074900
	b _08077C9A
	.align 2, 0
_08077C6C: .4byte gBattlersCount
_08077C70: .4byte gBattleTypeFlags
_08077C74:
	ldr r0, _08077C90 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r7, 2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08077C94
	adds r0, r7, 0
	bl GetSubstituteSpriteDefault_Y
	b _08077C9A
	.align 2, 0
_08077C90: .4byte gUnknown_2024018
_08077C94:
	adds r0, r7, 0
	bl GetBankSpriteDefault_Y
_08077C9A:
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r7, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	bne _08077CAE
	b _08077DAC
_08077CAE:
	ldr r1, _08077D90 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _08077D94 @ =gEnemyParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08077CD2
	b _08077FB4
_08077CD2:
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r5, _08077D98 @ =gMultiuseSpriteTemplate
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _08077D9C @ =gBattlerSpriteIds
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _08077DA0 @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08077DA4 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08077DA8 @ =gBattleMonForms
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
	b _08077F84
	.align 2, 0
_08077D90: .4byte gBattlerPartyIndexes
_08077D94: .4byte gEnemyParty
_08077D98: .4byte gMultiuseSpriteTemplate
_08077D9C: .4byte gBattlerSpriteIds
_08077DA0: .4byte gSprites
_08077DA4: .4byte SpriteCallbackDummy
_08077DA8: .4byte gBattleMonForms
_08077DAC:
	ldr r0, _08077E00 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0x80
	ands r1, r2
	cmp r1, 0
	beq _08077E10
	cmp r7, 0
	bne _08077E10
	ldr r5, _08077E04 @ =gSaveBlock2Ptr
	ldr r0, [r5]
	ldrb r4, [r0, 0x8]
	movs r0, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _08077E08 @ =gMultiuseSpriteTemplate
	ldr r1, _08077E0C @ =gUnknown_8239F8C
	ldr r0, [r5]
	ldrb r0, [r0, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	movs r0, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	b _08077E54
	.align 2, 0
_08077E00: .4byte gBattleTypeFlags
_08077E04: .4byte gSaveBlock2Ptr
_08077E08: .4byte gMultiuseSpriteTemplate
_08077E0C: .4byte gUnknown_8239F8C
_08077E10:
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _08077EA8
	cmp r7, 0
	bne _08077EA8
	movs r0, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r5, _08077E94 @ =gMultiuseSpriteTemplate
	ldr r0, _08077E98 @ =gUnknown_8239F8C
	ldrb r0, [r0, 0x14]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r4, r1
	asrs r4, 16
	movs r0, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
_08077E54:
	movs r1, 0x50
	adds r2, r4, 0
	bl CreateSprite
	ldr r3, _08077E9C @ =gBattlerSpriteIds
	strb r0, [r3]
	ldr r4, _08077EA0 @ =gSprites
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08077EA4 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x2E]
	b _08077F84
	.align 2, 0
_08077E94: .4byte gMultiuseSpriteTemplate
_08077E98: .4byte gUnknown_8239F8C
_08077E9C: .4byte gBattlerSpriteIds
_08077EA0: .4byte gSprites
_08077EA4: .4byte SpriteCallbackDummy
_08077EA8:
	ldr r1, _08077FC4 @ =gBattlerPartyIndexes
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _08077FC8 @ =gPlayerParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08077FB4
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl GetBattlerPosition
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r5, _08077FCC @ =gMultiuseSpriteTemplate
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8074480
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_807685C
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _08077FD0 @ =gBattlerSpriteIds
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _08077FD4 @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08077FD8 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08077FDC @ =gBattleMonForms
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
_08077F84:
	ldr r1, _08077FD4 @ =gSprites
	ldr r0, _08077FD0 @ =gBattlerSpriteIds
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r0, _08077FE0 @ =gUnknown_2024018
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 31
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_08077FB4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077FC4: .4byte gBattlerPartyIndexes
_08077FC8: .4byte gPlayerParty
_08077FCC: .4byte gMultiuseSpriteTemplate
_08077FD0: .4byte gBattlerSpriteIds
_08077FD4: .4byte gSprites
_08077FD8: .4byte SpriteCallbackDummy
_08077FDC: .4byte gBattleMonForms
_08077FE0: .4byte gUnknown_2024018
	thumb_func_end sub_8077C38

	thumb_func_start CreateHealthboxSprite
CreateHealthboxSprite: @ 8077FE4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0807800C @ =gBattlersCount
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08077FF4
	b _08078166
_08077FF4:
	ldr r0, _08078010 @ =gBattleTypeFlags
	ldr r1, [r0]
	movs r2, 0x80
	ands r1, r2
	cmp r1, 0
	beq _08078014
	cmp r5, 0
	bne _08078014
	bl CreateSafariPlayerHealthboxSprites
	b _0807802C
	.align 2, 0
_0807800C: .4byte gBattlersCount
_08078010: .4byte gBattleTypeFlags
_08078014:
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _08078026
	cmp r5, 0
	bne _08078026
	b _08078166
_08078026:
	adds r0, r5, 0
	bl CreateBankHealthboxSprites
_0807802C:
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08078068 @ =gUnknown_3004FF0
	adds r4, r5, r0
	strb r6, [r4]
	adds r0, r5, 0
	bl SetBankHealthboxSpritePos
	adds r0, r6, 0
	bl SetHealthboxSpriteVisible
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _08078074
	ldrb r0, [r4]
	ldr r1, _0807806C @ =gBattlerPartyIndexes
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08078070 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
	b _080780C0
	.align 2, 0
_08078068: .4byte gUnknown_3004FF0
_0807806C: .4byte gBattlerPartyIndexes
_08078070: .4byte gEnemyParty
_08078074:
	ldr r0, _0807809C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080780A8
	ldrb r0, [r4]
	ldr r1, _080780A0 @ =gBattlerPartyIndexes
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080780A4 @ =gPlayerParty
	adds r1, r2
	movs r2, 0xA
	bl UpdateHealthboxAttribute
	b _080780C0
	.align 2, 0
_0807809C: .4byte gBattleTypeFlags
_080780A0: .4byte gBattlerPartyIndexes
_080780A4: .4byte gPlayerParty
_080780A8:
	ldrb r0, [r4]
	ldr r1, _080780EC @ =gBattlerPartyIndexes
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _080780F0 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl UpdateHealthboxAttribute
_080780C0:
	adds r0, r5, 0
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080780DC
	adds r0, r5, 0
	bl GetBattlerPosition
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080780F8
_080780DC:
	ldr r0, _080780F4 @ =gUnknown_3004FF0
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x1
	bl nullsub_21
	b _08078104
	.align 2, 0
_080780EC: .4byte gBattlerPartyIndexes
_080780F0: .4byte gPlayerParty
_080780F4: .4byte gUnknown_3004FF0
_080780F8:
	ldr r0, _08078130 @ =gUnknown_3004FF0
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0
	bl nullsub_21
_08078104:
	adds r0, r5, 0
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0807813C
	ldr r0, _08078134 @ =gBattlerPartyIndexes
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078138 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08078166
	adds r0, r6, 0
	bl SetHealthboxSpriteInvisible
	b _08078166
	.align 2, 0
_08078130: .4byte gUnknown_3004FF0
_08078134: .4byte gBattlerPartyIndexes
_08078138: .4byte gEnemyParty
_0807813C:
	ldr r0, _0807816C @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08078166
	ldr r0, _08078170 @ =gBattlerPartyIndexes
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078174 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08078166
	adds r0, r6, 0
	bl SetHealthboxSpriteInvisible
_08078166:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807816C: .4byte gBattleTypeFlags
_08078170: .4byte gBattlerPartyIndexes
_08078174: .4byte gPlayerParty
	thumb_func_end CreateHealthboxSprite

	.align 2, 0 @ Don't pad with nop.
