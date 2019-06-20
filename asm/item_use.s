	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start FieldUseFunc_OpenPartyMenu
FieldUseFunc_OpenPartyMenu: @ 80A16E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A16F4 @ =gUnknown_3005E98
	ldr r1, _080A16F8 @ =sub_81252D0
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A16F4: .4byte gUnknown_3005E98
_080A16F8: .4byte sub_81252D0
	thumb_func_end FieldUseFunc_OpenPartyMenu

	thumb_func_start FieldUseFunc_Ether
FieldUseFunc_Ether: @ 80A16FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1710 @ =gUnknown_3005E98
	ldr r1, _080A1714 @ =sub_81256F8
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A1710: .4byte gUnknown_3005E98
_080A1714: .4byte sub_81256F8
	thumb_func_end FieldUseFunc_Ether

	thumb_func_start FieldUseFunc_PpUp
FieldUseFunc_PpUp: @ 80A1718
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A172C @ =gUnknown_3005E98
	ldr r1, _080A1730 @ =dp05_pp_up
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A172C: .4byte gUnknown_3005E98
_080A1730: .4byte dp05_pp_up
	thumb_func_end FieldUseFunc_PpUp

	thumb_func_start FieldUseFunc_RareCandy
FieldUseFunc_RareCandy: @ 80A1734
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1748 @ =gUnknown_3005E98
	ldr r1, _080A174C @ =dp05_rare_candy
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A1748: .4byte gUnknown_3005E98
_080A174C: .4byte dp05_rare_candy
	thumb_func_end FieldUseFunc_RareCandy

	thumb_func_start FieldUseFunc_EvoItem
FieldUseFunc_EvoItem: @ 80A1750
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1764 @ =gUnknown_3005E98
	ldr r1, _080A1768 @ =sub_8126B60
	str r1, [r2]
	bl sub_80A16D0
	pop {r0}
	bx r0
	.align 2, 0
_080A1764: .4byte gUnknown_3005E98
_080A1768: .4byte sub_8126B60
	thumb_func_end FieldUseFunc_EvoItem

	thumb_func_start FieldUseFunc_SacredAsh
FieldUseFunc_SacredAsh: @ 80A176C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1780 @ =gUnknown_3005E98
	ldr r1, _080A1784 @ =sub_8126894
	str r1, [r2]
	bl sub_80A0FBC
	pop {r0}
	bx r0
	.align 2, 0
_080A1780: .4byte gUnknown_3005E98
_080A1784: .4byte sub_8126894
	thumb_func_end FieldUseFunc_SacredAsh

	thumb_func_start FieldUseFunc_TmCase
FieldUseFunc_TmCase: @ 80A1788
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A17B0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A17B8
	ldr r0, _080A17B4 @ =sub_80A17D4
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A17C8
	.align 2, 0
_080A17B0: .4byte gTasks
_080A17B4: .4byte sub_80A17D4
_080A17B8:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A17D0 @ =sub_80A17E8
	str r0, [r5]
_080A17C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A17D0: .4byte sub_80A17E8
	thumb_func_end FieldUseFunc_TmCase

	thumb_func_start sub_80A17D4
sub_80A17D4: @ 80A17D4
	push {lr}
	ldr r1, _080A17E4 @ =UseFameCheckerFromMenu
	movs r0, 0
	movs r2, 0
	bl InitTMCase
	pop {r0}
	bx r0
	.align 2, 0
_080A17E4: .4byte UseFameCheckerFromMenu
	thumb_func_end sub_80A17D4

	thumb_func_start sub_80A17E8
sub_80A17E8: @ 80A17E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1818 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1812
	bl CleanupOverworldWindowsAndTilemaps
	bl sub_80A1184
	ldr r1, _080A181C @ =CB2_ReturnToField
	movs r0, 0
	movs r2, 0x1
	bl InitTMCase
	adds r0, r4, 0
	bl DestroyTask
_080A1812:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1818: .4byte gPaletteFade
_080A181C: .4byte CB2_ReturnToField
	thumb_func_end sub_80A17E8

	thumb_func_start FieldUseFunc_BerryPouch
FieldUseFunc_BerryPouch: @ 80A1820
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A1848 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1850
	ldr r0, _080A184C @ =sub_80A186C
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1860
	.align 2, 0
_080A1848: .4byte gTasks
_080A184C: .4byte sub_80A186C
_080A1850:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1868 @ =sub_80A1880
	str r0, [r5]
_080A1860:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1868: .4byte sub_80A1880
	thumb_func_end FieldUseFunc_BerryPouch

	thumb_func_start sub_80A186C
sub_80A186C: @ 80A186C
	push {lr}
	ldr r1, _080A187C @ =UseFameCheckerFromMenu
	movs r0, 0
	movs r2, 0
	bl sub_813CD50
	pop {r0}
	bx r0
	.align 2, 0
_080A187C: .4byte UseFameCheckerFromMenu
	thumb_func_end sub_80A186C

	thumb_func_start sub_80A1880
sub_80A1880: @ 80A1880
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A18B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A18AA
	bl CleanupOverworldWindowsAndTilemaps
	bl sub_80A1184
	ldr r1, _080A18B4 @ =CB2_ReturnToField
	movs r0, 0
	movs r2, 0x1
	bl sub_813CD50
	adds r0, r4, 0
	bl DestroyTask
_080A18AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A18B0: .4byte gPaletteFade
_080A18B4: .4byte CB2_ReturnToField
	thumb_func_end sub_80A1880

	thumb_func_start BattleUseFunc_BerryPouch
BattleUseFunc_BerryPouch: @ 80A18B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A18D4 @ =sub_80A18D8
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A18D4: .4byte sub_80A18D8
	thumb_func_end BattleUseFunc_BerryPouch

	thumb_func_start sub_80A18D8
sub_80A18D8: @ 80A18D8
	push {lr}
	ldr r1, _080A18E8 @ =sub_8107ECC
	movs r0, 0x4
	movs r2, 0
	bl sub_813CD50
	pop {r0}
	bx r0
	.align 2, 0
_080A18E8: .4byte sub_8107ECC
	thumb_func_end sub_80A18D8

	thumb_func_start FieldUseFunc_TeachyTv
FieldUseFunc_TeachyTv: @ 80A18EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1920 @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	ldr r3, _080A1924 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldr r1, _080A1928 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1930
	ldr r0, _080A192C @ =sub_80A194C
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1940
	.align 2, 0
_080A1920: .4byte gSpecialVar_ItemId
_080A1924: .4byte 0x0000ffff
_080A1928: .4byte gTasks
_080A192C: .4byte sub_80A194C
_080A1930:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1948 @ =sub_80A1960
	str r0, [r5]
_080A1940:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1948: .4byte sub_80A1960
	thumb_func_end FieldUseFunc_TeachyTv

	thumb_func_start sub_80A194C
sub_80A194C: @ 80A194C
	push {lr}
	ldr r1, _080A195C @ =UseFameCheckerFromMenu
	movs r0, 0
	bl InitTeachyTvController
	pop {r0}
	bx r0
	.align 2, 0
_080A195C: .4byte UseFameCheckerFromMenu
	thumb_func_end sub_80A194C

	thumb_func_start sub_80A1960
sub_80A1960: @ 80A1960
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1990 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1988
	bl CleanupOverworldWindowsAndTilemaps
	bl sub_80A1184
	ldr r1, _080A1994 @ =CB2_ReturnToField
	movs r0, 0
	bl InitTeachyTvController
	adds r0, r4, 0
	bl DestroyTask
_080A1988:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1990: .4byte gPaletteFade
_080A1994: .4byte CB2_ReturnToField
	thumb_func_end sub_80A1960

	thumb_func_start FieldUseFunc_SuperRepel
FieldUseFunc_SuperRepel: @ 80A1998
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A19C0 @ =0x00004020
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080A19CC
	movs r0, 0x29
	bl PlaySE
	ldr r0, _080A19C4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A19C8 @ =sub_80A19E8
	str r0, [r1]
	b _080A19D8
	.align 2, 0
_080A19C0: .4byte 0x00004020
_080A19C4: .4byte gTasks
_080A19C8: .4byte sub_80A19E8
_080A19CC:
	ldr r2, _080A19E0 @ =gUnknown_841659E
	ldr r3, _080A19E4 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
_080A19D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A19E0: .4byte gUnknown_841659E
_080A19E4: .4byte sub_810A1F8
	thumb_func_end FieldUseFunc_SuperRepel

	thumb_func_start sub_80A19E8
sub_80A19E8: @ 80A19E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _080A1A2A
	ldr r4, _080A1A30 @ =gSpecialVar_ItemId
	ldrh r2, [r4]
	ldr r3, _080A1A34 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldr r5, _080A1A38 @ =0x00004020
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl VarSet
	bl sub_80A1A44
	ldr r2, _080A1A3C @ =gStringVar4
	ldr r3, _080A1A40 @ =sub_810A1F8
	adds r0, r6, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
_080A1A2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A30: .4byte gSpecialVar_ItemId
_080A1A34: .4byte 0x0000ffff
_080A1A38: .4byte 0x00004020
_080A1A3C: .4byte gStringVar4
_080A1A40: .4byte sub_810A1F8
	thumb_func_end sub_80A19E8

	thumb_func_start sub_80A1A44
sub_80A1A44: @ 80A1A44
	push {r4,lr}
	ldr r4, _080A1A84 @ =gSpecialVar_ItemId
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	ldrh r0, [r4]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	bl sub_8108DC8
	ldrh r0, [r4]
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	bl sub_81089F4
	ldrh r0, [r4]
	ldr r1, _080A1A88 @ =gStringVar2
	bl CopyItemName
	ldr r0, _080A1A8C @ =gStringVar4
	ldr r1, _080A1A90 @ =gUnknown_841658C
	bl StringExpandPlaceholders
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A84: .4byte gSpecialVar_ItemId
_080A1A88: .4byte gStringVar2
_080A1A8C: .4byte gStringVar4
_080A1A90: .4byte gUnknown_841658C
	thumb_func_end sub_80A1A44

	thumb_func_start FieldUseFunc_BlackFlute
FieldUseFunc_BlackFlute: @ 80A1A94
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r5, _080A1AD4 @ =gSpecialVar_ItemId
	ldrh r2, [r5]
	ldr r3, _080A1AD8 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldrh r0, [r5]
	cmp r0, 0x2B
	bne _080A1AF4
	ldr r0, _080A1ADC @ =0x00000803
	bl FlagSet
	ldr r0, _080A1AE0 @ =0x00000804
	bl FlagClear
	ldrh r0, [r5]
	ldr r1, _080A1AE4 @ =gStringVar2
	bl CopyItemName
	ldr r0, _080A1AE8 @ =gStringVar4
	ldr r1, _080A1AEC @ =gUnknown_84165D2
	bl StringExpandPlaceholders
	ldr r1, _080A1AF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	b _080A1B1A
	.align 2, 0
_080A1AD4: .4byte gSpecialVar_ItemId
_080A1AD8: .4byte 0x0000ffff
_080A1ADC: .4byte 0x00000803
_080A1AE0: .4byte 0x00000804
_080A1AE4: .4byte gStringVar2
_080A1AE8: .4byte gStringVar4
_080A1AEC: .4byte gUnknown_84165D2
_080A1AF0: .4byte gTasks
_080A1AF4:
	cmp r0, 0x2A
	bne _080A1B26
	ldr r0, _080A1B2C @ =0x00000804
	bl FlagSet
	ldr r0, _080A1B30 @ =0x00000803
	bl FlagClear
	ldrh r0, [r5]
	ldr r1, _080A1B34 @ =gStringVar2
	bl CopyItemName
	ldr r0, _080A1B38 @ =gStringVar4
	ldr r1, _080A1B3C @ =gUnknown_8416600
	bl StringExpandPlaceholders
	ldr r1, _080A1B40 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
_080A1B1A:
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A1B44 @ =sub_80A1B48
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x18]
_080A1B26:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B2C: .4byte 0x00000804
_080A1B30: .4byte 0x00000803
_080A1B34: .4byte gStringVar2
_080A1B38: .4byte gStringVar4
_080A1B3C: .4byte gUnknown_8416600
_080A1B40: .4byte gTasks
_080A1B44: .4byte sub_80A1B48
	thumb_func_end FieldUseFunc_BlackFlute

	thumb_func_start sub_80A1B48
sub_80A1B48: @ 80A1B48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1B80 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080A1B78
	movs r0, 0x6E
	bl PlaySE
	ldr r2, _080A1B84 @ =gStringVar4
	ldr r3, _080A1B88 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
_080A1B78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B80: .4byte gTasks
_080A1B84: .4byte gStringVar4
_080A1B88: .4byte sub_810A1F8
	thumb_func_end sub_80A1B48

	thumb_func_start sub_80A1B8C
sub_80A1B8C: @ 80A1B8C
	push {lr}
	ldr r0, _080A1BA0 @ =gMapHeader
	ldrb r1, [r0, 0x19]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A1BA4
	movs r0, 0
	b _080A1BA6
	.align 2, 0
_080A1BA0: .4byte gMapHeader
_080A1BA4:
	movs r0, 0x1
_080A1BA6:
	pop {r1}
	bx r1
	thumb_func_end sub_80A1B8C

	thumb_func_start ItemUseOutOfBattle_EscapeRope
ItemUseOutOfBattle_EscapeRope: @ 80A1BAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80A1B8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A1BEC
	ldr r0, _080A1BDC @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	ldr r0, _080A1BE0 @ =gMapHeader
	ldrb r3, [r0, 0x14]
	movs r0, 0x4
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldr r1, _080A1BE4 @ =sItemUseOnFieldCB
	ldr r0, _080A1BE8 @ =sub_80A1C08
	str r0, [r1]
	adds r0, r4, 0
	bl sub_80A103C
	b _080A1BFE
	.align 2, 0
_080A1BDC: .4byte gSpecialVar_ItemId
_080A1BE0: .4byte gMapHeader
_080A1BE4: .4byte sItemUseOnFieldCB
_080A1BE8: .4byte sub_80A1C08
_080A1BEC:
	ldr r0, _080A1C04 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r4, 0
	bl sub_80A1110
_080A1BFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C04: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EscapeRope

	thumb_func_start sub_80A1C08
sub_80A1C08: @ 80A1C08
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8054D70
	bl sub_80A1A44
	ldr r1, _080A1C38 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r2, _080A1C3C @ =gStringVar4
	ldr r3, _080A1C40 @ =sub_80A1C44
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C38: .4byte gTasks
_080A1C3C: .4byte gStringVar4
_080A1C40: .4byte sub_80A1C44
	thumb_func_end sub_80A1C08

	thumb_func_start sub_80A1C44
sub_80A1C44: @ 80A1C44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ResetInitialPlayerAvatarState
	bl sub_8085620
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1C44

	thumb_func_start FieldUseFunc_TownMap
FieldUseFunc_TownMap: @ 80A1C60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A1C88 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1C90
	ldr r0, _080A1C8C @ =sub_80A1CAC
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1CA0
	.align 2, 0
_080A1C88: .4byte gTasks
_080A1C8C: .4byte sub_80A1CAC
_080A1C90:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1CA8 @ =sub_80A1CC0
	str r0, [r5]
_080A1CA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CA8: .4byte sub_80A1CC0
	thumb_func_end FieldUseFunc_TownMap

	thumb_func_start sub_80A1CAC
sub_80A1CAC: @ 80A1CAC
	push {lr}
	ldr r1, _080A1CBC @ =UseFameCheckerFromMenu
	movs r0, 0
	bl sub_80BFF50
	pop {r0}
	bx r0
	.align 2, 0
_080A1CBC: .4byte UseFameCheckerFromMenu
	thumb_func_end sub_80A1CAC

	thumb_func_start sub_80A1CC0
sub_80A1CC0: @ 80A1CC0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1CF0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1CE8
	bl CleanupOverworldWindowsAndTilemaps
	bl sub_80A1184
	ldr r1, _080A1CF4 @ =CB2_ReturnToField
	movs r0, 0
	bl sub_80BFF50
	adds r0, r4, 0
	bl DestroyTask
_080A1CE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CF0: .4byte gPaletteFade
_080A1CF4: .4byte CB2_ReturnToField
	thumb_func_end sub_80A1CC0

	thumb_func_start FieldUseFunc_FameChecker
FieldUseFunc_FameChecker: @ 80A1CF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1D2C @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	ldr r3, _080A1D30 @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldr r1, _080A1D34 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A1D3C
	ldr r0, _080A1D38 @ =sub_80A1D58
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1D4C
	.align 2, 0
_080A1D2C: .4byte gSpecialVar_ItemId
_080A1D30: .4byte 0x0000ffff
_080A1D34: .4byte gTasks
_080A1D38: .4byte sub_80A1D58
_080A1D3C:
	bl sub_80CCB68
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080A1D54 @ =sub_80A1D68
	str r0, [r5]
_080A1D4C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D54: .4byte sub_80A1D68
	thumb_func_end FieldUseFunc_FameChecker

	thumb_func_start sub_80A1D58
sub_80A1D58: @ 80A1D58
	push {lr}
	ldr r0, _080A1D64 @ =UseFameCheckerFromMenu
	bl UseFameChecker
	pop {r0}
	bx r0
	.align 2, 0
_080A1D64: .4byte UseFameCheckerFromMenu
	thumb_func_end sub_80A1D58

	thumb_func_start sub_80A1D68
sub_80A1D68: @ 80A1D68
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1D94 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1D8E
	bl CleanupOverworldWindowsAndTilemaps
	bl sub_80A1184
	ldr r0, _080A1D98 @ =CB2_ReturnToField
	bl UseFameChecker
	adds r0, r4, 0
	bl DestroyTask
_080A1D8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D94: .4byte gPaletteFade
_080A1D98: .4byte CB2_ReturnToField
	thumb_func_end sub_80A1D68

	thumb_func_start FieldUseFunc_VsSeeker
FieldUseFunc_VsSeeker: @ 80A1D9C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080A1DE8 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x3
	beq _080A1DB2
	cmp r0, 0x1
	beq _080A1DB2
	cmp r0, 0x2
	bne _080A1DD2
_080A1DB2:
	ldr r0, _080A1DEC @ =gSaveBlock1Ptr
	ldr r1, [r0]
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	bne _080A1DF4
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080A1DD2
	cmp r0, 0x61
	beq _080A1DD2
	cmp r0, 0x6D
	beq _080A1DD2
	cmp r0, 0x79
	bne _080A1DF4
_080A1DD2:
	ldr r0, _080A1DF0 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r2, 0
	bl sub_80A1110
	b _080A1E00
	.align 2, 0
_080A1DE8: .4byte gMapHeader
_080A1DEC: .4byte gSaveBlock1Ptr
_080A1DF0: .4byte gTasks
_080A1DF4:
	ldr r1, _080A1E04 @ =sItemUseOnFieldCB
	ldr r0, _080A1E08 @ =Task_VsSeeker_0
	str r0, [r1]
	adds r0, r2, 0
	bl sub_80A103C
_080A1E00:
	pop {r0}
	bx r0
	.align 2, 0
_080A1E04: .4byte sItemUseOnFieldCB
_080A1E08: .4byte Task_VsSeeker_0
	thumb_func_end FieldUseFunc_VsSeeker

	thumb_func_start sub_80A1E0C
sub_80A1E0C: @ 80A1E0C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A112C
	pop {r0}
	bx r0
	thumb_func_end sub_80A1E0C

	thumb_func_start BattleUseFunc_MasterBall
BattleUseFunc_MasterBall: @ 80A1E1C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	bne _080A1E48
	ldr r0, _080A1E44 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	bl sub_8108CB4
	adds r0, r4, 0
	bl sub_8108B50
	b _080A1E54
	.align 2, 0
_080A1E44: .4byte gSpecialVar_ItemId
_080A1E48:
	ldr r2, _080A1E5C @ =gUnknown_8416631
	ldr r3, _080A1E60 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
_080A1E54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E5C: .4byte gUnknown_8416631
_080A1E60: .4byte sub_810A1F8
	thumb_func_end BattleUseFunc_MasterBall

	thumb_func_start BattleUseFunc_PokeFlute
BattleUseFunc_PokeFlute: @ 80A1E64
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8108CB4
	adds r0, r4, 0
	bl sub_8108B50
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleUseFunc_PokeFlute

	thumb_func_start BattleUseFunc_GuardSpec
BattleUseFunc_GuardSpec: @ 80A1E7C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A1EBC @ =gBattlerPartyIndexes
	ldr r0, _080A1EC0 @ =gBattlerInMenuId
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r1, _080A1EC4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080A1EC8 @ =gSpecialVar_ItemId
	ldrh r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	bl ExecuteTableBasedItemEffect
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080A1ED4
	ldr r2, _080A1ECC @ =gUnknown_84169DC
	ldr r3, _080A1ED0 @ =sub_810A1F8
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
	b _080A1EE4
	.align 2, 0
_080A1EBC: .4byte gBattlerPartyIndexes
_080A1EC0: .4byte gBattlerInMenuId
_080A1EC4: .4byte gPlayerParty
_080A1EC8: .4byte gSpecialVar_ItemId
_080A1ECC: .4byte gUnknown_84169DC
_080A1ED0: .4byte sub_810A1F8
_080A1ED4:
	ldr r0, _080A1EEC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x18]
	ldr r0, _080A1EF0 @ =sub_80A1EF4
	str r0, [r1]
_080A1EE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1EEC: .4byte gTasks
_080A1EF0: .4byte sub_80A1EF4
	thumb_func_end BattleUseFunc_GuardSpec

	thumb_func_start sub_80A1EF4
sub_80A1EF4: @ 80A1EF4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	ldr r0, _080A1F3C @ =gTasks+0x8
	adds r1, r0
	ldrh r0, [r1, 0x10]
	adds r0, 0x1
	strh r0, [r1, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080A1F36
	ldr r0, _080A1F40 @ =gSpecialVar_ItemId
	ldrh r4, [r0]
	movs r0, 0x1
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r4, 0
	bl sub_8042DA4
	adds r2, r0, 0
	ldr r3, _080A1F44 @ =sub_80A1F48
	adds r0, r5, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
_080A1F36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F3C: .4byte gTasks+0x8
_080A1F40: .4byte gSpecialVar_ItemId
_080A1F44: .4byte sub_80A1F48
	thumb_func_end sub_80A1EF4

	thumb_func_start sub_80A1F48
sub_80A1F48: @ 80A1F48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1F74 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A1F62
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A1F6C
_080A1F62:
	bl sub_8108CB4
	adds r0, r4, 0
	bl sub_8108B50
_080A1F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F74: .4byte gMain
	thumb_func_end sub_80A1F48

	thumb_func_start sub_80A1F78
sub_80A1F78: @ 80A1F78
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A1F9C @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080A1FA4
	ldr r0, _080A1FA0 @ =sub_81279E0
	bl sub_813D934
	adds r0, r4, 0
	bl sub_813D808
	b _080A1FB0
	.align 2, 0
_080A1F9C: .4byte gSpecialVar_ItemId
_080A1FA0: .4byte sub_81279E0
_080A1FA4:
	ldr r0, _080A1FB8 @ =sub_81279E0
	bl sub_8108EE0
	adds r0, r4, 0
	bl sub_8108B50
_080A1FB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1FB8: .4byte sub_81279E0
	thumb_func_end sub_80A1F78

	thumb_func_start BattleUseFunc_OpenPartyMenu
BattleUseFunc_OpenPartyMenu: @ 80A1FBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1FD0 @ =gUnknown_3005E98
	ldr r1, _080A1FD4 @ =ItemUseCB_Medicine
	str r1, [r2]
	bl sub_80A1F78
	pop {r0}
	bx r0
	.align 2, 0
_080A1FD0: .4byte gUnknown_3005E98
_080A1FD4: .4byte ItemUseCB_Medicine
	thumb_func_end BattleUseFunc_OpenPartyMenu

	thumb_func_start sub_80A1FD8
sub_80A1FD8: @ 80A1FD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A1FEC @ =gUnknown_3005E98
	ldr r1, _080A1FF0 @ =sub_8126894
	str r1, [r2]
	bl sub_80A1F78
	pop {r0}
	bx r0
	.align 2, 0
_080A1FEC: .4byte gUnknown_3005E98
_080A1FF0: .4byte sub_8126894
	thumb_func_end sub_80A1FD8

	thumb_func_start BattleUseFunc_Ether
BattleUseFunc_Ether: @ 80A1FF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A2008 @ =gUnknown_3005E98
	ldr r1, _080A200C @ =sub_81256F8
	str r1, [r2]
	bl sub_80A1F78
	pop {r0}
	bx r0
	.align 2, 0
_080A2008: .4byte gUnknown_3005E98
_080A200C: .4byte sub_81256F8
	thumb_func_end BattleUseFunc_Ether

	thumb_func_start BattleUseFunc_PokeDoll
BattleUseFunc_PokeDoll: @ 80A2010
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A2044 @ =gBattleTypeFlags
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080A2058
	bl sub_80A1A44
	ldr r0, _080A2048 @ =gSpecialVar_ItemId
	ldrh r2, [r0]
	ldr r3, _080A204C @ =0x0000ffff
	movs r0, 0x4
	movs r1, 0
	bl ItemUse_SetQuestLogEvent
	ldr r2, _080A2050 @ =gStringVar4
	ldr r3, _080A2054 @ =sub_8108B50
	adds r0, r4, 0
	movs r1, 0x2
	bl DisplayItemMessageInBag
	b _080A2060
	.align 2, 0
_080A2044: .4byte gBattleTypeFlags
_080A2048: .4byte gSpecialVar_ItemId
_080A204C: .4byte 0x0000ffff
_080A2050: .4byte gStringVar4
_080A2054: .4byte sub_8108B50
_080A2058:
	adds r0, r4, 0
	movs r1, 0
	bl sub_80A1110
_080A2060:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleUseFunc_PokeDoll

	thumb_func_start ItemUseOutOfBattle_EnigmaBerry
ItemUseOutOfBattle_EnigmaBerry: @ 80A2068
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A208C @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x14
	bls _080A2082
	b _080A2174
_080A2082:
	lsls r0, 2
	ldr r1, _080A2090 @ =_080A2094
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A208C: .4byte gSpecialVar_ItemId
_080A2090: .4byte _080A2094
	.align 2, 0
_080A2094:
	.4byte _080A2120
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A2174
	.4byte _080A2174
	.4byte _080A2104
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A20E8
	.4byte _080A2174
	.4byte _080A213C
	.4byte _080A213C
	.4byte _080A2158
_080A20E8:
	ldr r0, _080A2100 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl FieldUseFunc_OpenPartyMenu
	b _080A2188
	.align 2, 0
_080A2100: .4byte gTasks
_080A2104:
	ldr r0, _080A211C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl FieldUseFunc_SacredAsh
	b _080A2188
	.align 2, 0
_080A211C: .4byte gTasks
_080A2120:
	ldr r0, _080A2138 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl FieldUseFunc_RareCandy
	b _080A2188
	.align 2, 0
_080A2138: .4byte gTasks
_080A213C:
	ldr r0, _080A2154 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl FieldUseFunc_PpUp
	b _080A2188
	.align 2, 0
_080A2154: .4byte gTasks
_080A2158:
	ldr r0, _080A2170 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl FieldUseFunc_Ether
	b _080A2188
	.align 2, 0
_080A2170: .4byte gTasks
_080A2174:
	ldr r0, _080A2190 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x4
	strh r0, [r1, 0x10]
	adds r0, r4, 0
	bl FieldUseFunc_OakStopsYou
_080A2188:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2190: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EnigmaBerry

	thumb_func_start ItemUseInBattle_EnigmaBerry
ItemUseInBattle_EnigmaBerry: @ 80A2194
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A21B4 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetItemEffectType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _080A222C
	lsls r0, 2
	ldr r1, _080A21B8 @ =_080A21BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A21B4: .4byte gSpecialVar_ItemId
_080A21B8: .4byte _080A21BC
	.align 2, 0
_080A21BC:
	.4byte _080A2214
	.4byte _080A222C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A221C
	.4byte _080A222C
	.4byte _080A221C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A222C
	.4byte _080A2224
_080A2214:
	adds r0, r4, 0
	bl BattleUseFunc_GuardSpec
	b _080A2232
_080A221C:
	adds r0, r4, 0
	bl BattleUseFunc_OpenPartyMenu
	b _080A2232
_080A2224:
	adds r0, r4, 0
	bl BattleUseFunc_Ether
	b _080A2232
_080A222C:
	adds r0, r4, 0
	bl FieldUseFunc_OakStopsYou
_080A2232:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemUseInBattle_EnigmaBerry

	thumb_func_start FieldUseFunc_OakStopsYou
FieldUseFunc_OakStopsYou: @ 80A2238
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080A2268 @ =gSpecialVar_ItemId
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080A2278
	ldr r4, _080A226C @ =gStringVar4
	ldr r1, _080A2270 @ =gUnknown_8416425
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r3, _080A2274 @ =sub_813E2B8
	adds r0, r5, 0
	movs r1, 0x4
	adds r2, r4, 0
	bl sub_813EB20
	b _080A228A
	.align 2, 0
_080A2268: .4byte gSpecialVar_ItemId
_080A226C: .4byte gStringVar4
_080A2270: .4byte gUnknown_8416425
_080A2274: .4byte sub_813E2B8
_080A2278:
	ldr r0, _080A2290 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xE]
	adds r0, r5, 0
	bl sub_80A1110
_080A228A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2290: .4byte gTasks
	thumb_func_end FieldUseFunc_OakStopsYou

	thumb_func_start ItemUse_SetQuestLogEvent
ItemUse_SetQuestLogEvent: @ 80A2294
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x8
	bl Alloc
	adds r6, r0, 0
	strh r4, [r6]
	strh r5, [r6, 0x6]
	cmp r7, 0
	beq _080A22C8
	adds r0, r7, 0
	movs r1, 0x41
	bl GetMonData
	b _080A22CA
_080A22C8:
	ldr r0, _080A22E4 @ =0x0000ffff
_080A22CA:
	strh r0, [r6, 0x4]
	mov r0, r8
	adds r1, r6, 0
	bl sub_8113550
	adds r0, r6, 0
	bl Free
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A22E4: .4byte 0x0000ffff
	thumb_func_end ItemUse_SetQuestLogEvent

	.align 2, 0 @ Don't pad with nop.
