	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_91
nullsub_91: @ 810BB88
	bx lr
	thumb_func_end nullsub_91

	thumb_func_start dp13_810BB8C
dp13_810BB8C: @ 810BB8C
	push {r4-r7,lr}
	ldr r4, _0810BBAC @ =gUnknown_8453178
	ldr r3, _0810BBB0 @ =gUnknown_203AD58
	movs r2, 0x7
_0810BB94:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r3, 0xC
	subs r2, 0x1
	cmp r2, 0
	bge _0810BB94
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810BBAC: .4byte gUnknown_8453178
_0810BBB0: .4byte gUnknown_203AD58
	thumb_func_end dp13_810BB8C

	thumb_func_start load_pokemon_image_TODO
load_pokemon_image_TODO: @ 810BBB4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r1, 0
	adds r5, r3, 0
	ldr r3, [sp, 0x18]
	ldr r1, [sp, 0x1C]
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r4, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	cmp r3, 0
	bne _0810BC28
	cmp r2, 0
	beq _0810BBF4
	cmp r1, 0
	bne _0810BBE8
	lsls r0, r4, 3
	ldr r1, _0810BBE4 @ =gUnknown_82350AC
	b _0810BBFC
	.align 2, 0
_0810BBE4: .4byte gUnknown_82350AC
_0810BBE8:
	lsls r0, r4, 3
	ldr r1, _0810BBF0 @ =gUnknown_82350AC
	b _0810BC14
	.align 2, 0
_0810BBF0: .4byte gUnknown_82350AC
_0810BBF4:
	cmp r0, 0
	bne _0810BC10
	lsls r0, r4, 3
	ldr r1, _0810BC0C @ =gUnknown_823654C
_0810BBFC:
	adds r0, r1
	str r2, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_800ECF0
	b _0810BC4E
	.align 2, 0
_0810BC0C: .4byte gUnknown_823654C
_0810BC10:
	lsls r0, r4, 3
	ldr r1, _0810BC24 @ =gUnknown_823654C
_0810BC14:
	adds r0, r1
	str r2, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_800F134
	b _0810BC4E
	.align 2, 0
_0810BC24: .4byte gUnknown_823654C
_0810BC28:
	cmp r2, 0
	beq _0810BC40
	lsls r0, r4, 3
	ldr r1, _0810BC3C @ =gUnknown_823957C
	adds r0, r1
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_800EC8C
	b _0810BC4E
	.align 2, 0
_0810BC3C: .4byte gUnknown_823957C
_0810BC40:
	lsls r0, r7, 3
	ldr r1, _0810BC58 @ =gUnknown_8239FA4
	adds r0, r1
	adds r1, r5, 0
	adds r2, r7, 0
	bl sub_800EC8C
_0810BC4E:
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810BC58: .4byte gUnknown_8239FA4
	thumb_func_end load_pokemon_image_TODO

	thumb_func_start sub_810BC5C
sub_810BC5C: @ 810BC5C
	push {r4,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl load_pokemon_image_TODO
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810BC5C

	thumb_func_start sub_810BC84
sub_810BC84: @ 810BC84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	mov r8, r2
	ldr r1, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	lsls r3, 24
	lsrs r5, r3, 24
	mov r12, r5
	lsls r1, 16
	lsrs r3, r1, 16
	adds r1, r3, 0
	lsls r2, 24
	cmp r2, 0
	bne _0810BCE8
	ldr r0, _0810BCC8 @ =0x0000ffff
	cmp r3, r0
	bne _0810BCD0
	ldr r2, _0810BCCC @ =gUnknown_203AD40
	ldrh r1, [r2, 0x2]
	adds r0, r3, 0
	orrs r0, r1
	strh r0, [r2, 0x2]
	adds r0, r4, 0
	adds r1, r7, 0
	mov r2, r8
	bl GetFrontSpritePalFromSpeciesAndPersonality
	lsls r1, r5, 20
	b _0810BD04
	.align 2, 0
_0810BCC8: .4byte 0x0000ffff
_0810BCCC: .4byte gUnknown_203AD40
_0810BCD0:
	ldr r0, _0810BCE4 @ =gUnknown_203AD40
	strh r3, [r0, 0x2]
	adds r0, r4, 0
	adds r1, r7, 0
	mov r2, r8
	bl GetMonSpritePalStructFromOtIdPersonality
	bl LoadCompressedObjectPalette
	b _0810BD2E
	.align 2, 0
_0810BCE4: .4byte gUnknown_203AD40
_0810BCE8:
	ldr r0, _0810BD14 @ =0x0000ffff
	cmp r3, r0
	bne _0810BD20
	ldr r2, _0810BD18 @ =gUnknown_203AD40
	ldrh r1, [r2, 0x2]
	adds r0, r3, 0
	orrs r0, r1
	strh r0, [r2, 0x2]
	ldr r1, _0810BD1C @ =gUnknown_8239A1C
	lsls r0, r4, 3
	adds r0, r1
	ldr r0, [r0]
	mov r2, r12
	lsls r1, r2, 20
_0810BD04:
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	b _0810BD2E
	.align 2, 0
_0810BD14: .4byte 0x0000ffff
_0810BD18: .4byte gUnknown_203AD40
_0810BD1C: .4byte gUnknown_8239A1C
_0810BD20:
	ldr r0, _0810BD38 @ =gUnknown_203AD40
	strh r1, [r0, 0x2]
	lsls r0, r6, 3
	ldr r1, _0810BD3C @ =gUnknown_8239A1C
	adds r0, r1
	bl LoadCompressedObjectPalette
_0810BD2E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810BD38: .4byte gUnknown_203AD40
_0810BD3C: .4byte gUnknown_8239A1C
	thumb_func_end sub_810BC84

	thumb_func_start sub_810BD40
sub_810BD40: @ 810BD40
	push {r4,r5,lr}
	adds r5, r1, 0
	ldr r1, [sp, 0xC]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r4, r3, 24
	lsls r1, 24
	cmp r1, 0
	bne _0810BD64
	adds r1, r5, 0
	bl GetFrontSpritePalFromSpeciesAndPersonality
	lsls r1, r4, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _0810BD74
_0810BD64:
	ldr r1, _0810BD7C @ =gUnknown_8239A1C
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r4, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_0810BD74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810BD7C: .4byte gUnknown_8239A1C
	thumb_func_end sub_810BD40

	thumb_func_start uns_builder_assign_animtable1
uns_builder_assign_animtable1: @ 810BD80
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _0810BD98
	ldr r1, _0810BD90 @ =gUnknown_203AD40
	ldr r0, _0810BD94 @ =gUnknown_82349BC
	str r0, [r1, 0x8]
	b _0810BDA0
	.align 2, 0
_0810BD90: .4byte gUnknown_203AD40
_0810BD94: .4byte gUnknown_82349BC
_0810BD98:
	ldr r0, _0810BDA4 @ =gUnknown_203AD40
	ldr r1, _0810BDA8 @ =gUnknown_82390DC
	ldr r1, [r1]
	str r1, [r0, 0x8]
_0810BDA0:
	pop {r0}
	bx r0
	.align 2, 0
_0810BDA4: .4byte gUnknown_203AD40
_0810BDA8: .4byte gUnknown_82390DC
	thumb_func_end uns_builder_assign_animtable1

	thumb_func_start oamt_spawn_poke_or_trainer_picture
oamt_spawn_poke_or_trainer_picture: @ 810BDAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x30
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	ldr r1, [sp, 0x50]
	ldr r2, [sp, 0x54]
	ldr r4, [sp, 0x58]
	ldr r5, [sp, 0x5C]
	ldr r6, [sp, 0x60]
	ldr r7, [sp, 0x64]
	mov r8, r7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x14]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x18]
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x20]
	lsls r5, 16
	lsrs r5, 16
	mov r10, r5
	lsls r6, 24
	lsrs r6, 24
	mov r9, r6
	mov r0, r8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r1, _0810BE44 @ =gUnknown_203AD58
	ldrb r0, [r1, 0xB]
	cmp r0, 0
	beq _0810BE1C
_0810BE04:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bhi _0810BE1C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	bne _0810BE04
_0810BE1C:
	cmp r4, 0x8
	beq _0810BE40
	movs r0, 0x80
	lsls r0, 6
	bl Alloc
	adds r7, r0, 0
	cmp r7, 0
	beq _0810BE40
	movs r0, 0x20
	bl Alloc
	mov r8, r0
	cmp r0, 0
	bne _0810BE4C
	adds r0, r7, 0
	bl Free
_0810BE40:
	ldr r0, _0810BE48 @ =0x0000ffff
	b _0810BF16
	.align 2, 0
_0810BE44: .4byte gUnknown_203AD58
_0810BE48: .4byte 0x0000ffff
_0810BE4C:
	mov r1, r9
	str r1, [sp]
	str r5, [sp, 0x4]
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x14]
	adds r3, r7, 0
	bl load_pokemon_image_TODO
	lsls r0, 16
	cmp r0, 0
	bne _0810BE40
	lsls r2, r4, 1
	str r2, [sp, 0x2C]
	ldr r5, _0810BF28 @ =gUnknown_203AD40
	ldr r0, _0810BF2C @ =gUnknown_8453184
	mov r12, r0
	ldr r1, [sp, 0x18]
	lsls r1, 16
	str r1, [sp, 0x24]
	ldr r2, [sp, 0x1C]
	lsls r2, 16
	str r2, [sp, 0x28]
	movs r3, 0x80
	lsls r3, 4
	mov r0, r8
	adds r1, r7, 0
	adds r6, r3, 0
	movs r2, 0x3
_0810BE86:
	str r1, [r0]
	strh r3, [r0, 0x4]
	adds r0, 0x8
	adds r1, r6
	subs r2, 0x1
	cmp r2, 0
	bge _0810BE86
	ldr r0, _0810BF30 @ =0x0000ffff
	strh r0, [r5]
	mov r0, r12
	str r0, [r5, 0x4]
	mov r0, r9
	bl uns_builder_assign_animtable1
	mov r1, r8
	str r1, [r5, 0xC]
	ldr r0, _0810BF34 @ =gUnknown_8231CFC
	str r0, [r5, 0x10]
	ldr r0, _0810BF38 @ =nullsub_91
	str r0, [r5, 0x14]
	mov r2, r10
	str r2, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x10]
	ldr r3, [sp, 0x20]
	bl sub_810BC84
	ldr r2, [sp, 0x24]
	asrs r1, r2, 16
	ldr r0, [sp, 0x28]
	asrs r2, r0, 16
	adds r0, r5, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	adds r6, r2, 0
	ldr r0, _0810BF30 @ =0x0000ffff
	cmp r10, r0
	bne _0810BEF6
	ldr r0, _0810BF3C @ =gUnknown_202063C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r2, [sp, 0x20]
	lsls r3, r2, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_0810BEF6:
	ldr r1, _0810BF40 @ =gUnknown_203AD58
	ldr r2, [sp, 0x2C]
	adds r0, r2, r4
	lsls r0, 2
	adds r2, r0, r1
	str r7, [r2]
	adds r1, 0x4
	adds r0, r1
	mov r7, r8
	str r7, [r0]
	mov r0, r10
	strh r0, [r2, 0x8]
	strb r6, [r2, 0xA]
	movs r0, 0x1
	strb r0, [r2, 0xB]
	adds r0, r6, 0
_0810BF16:
	add sp, 0x30
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810BF28: .4byte gUnknown_203AD40
_0810BF2C: .4byte gUnknown_8453184
_0810BF30: .4byte 0x0000ffff
_0810BF34: .4byte gUnknown_8231CFC
_0810BF38: .4byte nullsub_91
_0810BF3C: .4byte gUnknown_202063C
_0810BF40: .4byte gUnknown_203AD58
	thumb_func_end oamt_spawn_poke_or_trainer_picture

	thumb_func_start sub_810BF44
sub_810BF44: @ 810BF44
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	ldr r4, [sp, 0x34]
	ldr r5, [sp, 0x38]
	ldr r6, [sp, 0x3C]
	ldr r7, [sp, 0x40]
	mov r8, r7
	ldr r7, [sp, 0x44]
	mov r9, r7
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r6, 24
	lsrs r6, 24
	mov r7, r8
	lsls r7, 16
	lsrs r7, 16
	mov r8, r7
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r4, r8
	str r4, [sp, 0xC]
	str r7, [sp, 0x10]
	movs r4, 0
	str r4, [sp, 0x14]
	bl oamt_spawn_poke_or_trainer_picture
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810BF44

	thumb_func_start sub_810BFA4
sub_810BFA4: @ 810BFA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r4, r0, 16
	movs r2, 0
	ldr r0, _0810BFDC @ =gUnknown_203AD58
	ldrb r1, [r0, 0xA]
	adds r3, r0, 0
	cmp r1, r4
	beq _0810BFD4
	adds r1, r3, 0
_0810BFBC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bhi _0810BFD4
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0xA]
	cmp r0, r4
	bne _0810BFBC
_0810BFD4:
	cmp r2, 0x8
	bne _0810BFE4
	ldr r0, _0810BFE0 @ =0x0000ffff
	b _0810C03A
	.align 2, 0
_0810BFDC: .4byte gUnknown_203AD58
_0810BFE0: .4byte 0x0000ffff
_0810BFE4:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r3
	ldr r1, [r5]
	mov r8, r1
	adds r1, r3, 0x4
	adds r0, r1
	ldr r7, [r0]
	ldrh r1, [r5, 0x8]
	ldr r0, _0810C044 @ =0x0000ffff
	lsls r6, r4, 4
	cmp r1, r0
	beq _0810C018
	ldr r1, _0810C048 @ =gUnknown_202063C
	adds r0, r6, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
_0810C018:
	adds r0, r6, r4
	lsls r0, 2
	ldr r1, _0810C048 @ =gUnknown_202063C
	adds r0, r1
	bl DestroySprite
	mov r0, r8
	bl Free
	adds r0, r7, 0
	bl Free
	adds r1, r5, 0
	ldr r0, _0810C04C @ =gUnknown_8453178
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0
_0810C03A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810C044: .4byte 0x0000ffff
_0810C048: .4byte gUnknown_202063C
_0810C04C: .4byte gUnknown_8453178
	thumb_func_end sub_810BFA4

	thumb_func_start sub_810C050
sub_810C050: @ 810C050
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r9, r1
	adds r7, r2, 0
	adds r4, r3, 0
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x24]
	ldr r3, [sp, 0x28]
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	adds r0, r2, 0
	movs r1, 0x7
	bl sub_8004950
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r4, 0
	bl sub_810BC5C
	lsls r0, 16
	cmp r0, 0
	bne _0810C0AC
	str r6, [sp]
	adds r0, r5, 0
	mov r1, r9
	adds r2, r7, 0
	mov r3, r8
	bl sub_810BD40
	movs r0, 0
	b _0810C0AE
_0810C0AC:
	ldr r0, _0810C0BC @ =0x0000ffff
_0810C0AE:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810C0BC: .4byte 0x0000ffff
	thumb_func_end sub_810C050

	thumb_func_start sub_810C0C0
sub_810C0C0: @ 810C0C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r1, [sp, 0x18]
	str r2, [sp, 0x1C]
	ldr r1, [sp, 0x44]
	ldr r2, [sp, 0x48]
	ldr r4, [sp, 0x4C]
	ldr r5, [sp, 0x50]
	ldr r6, [sp, 0x54]
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x20]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x80
	lsls r0, 6
	bl Alloc
	adds r4, r0, 0
	cmp r4, 0
	beq _0810C156
	str r6, [sp]
	mov r0, r9
	ldr r1, [sp, 0x1C]
	adds r2, r7, 0
	adds r3, r4, 0
	bl sub_810BC5C
	lsls r0, 16
	cmp r0, 0
	bne _0810C156
	movs r0, 0x40
	str r0, [sp]
	str r0, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r0, [sp, 0x10]
	str r0, [sp, 0x14]
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl BlitBitmapRectToWindow
	str r6, [sp]
	mov r0, r9
	ldr r1, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	ldr r3, [sp, 0x20]
	bl sub_810BD40
	adds r0, r4, 0
	bl Free
	movs r0, 0
	b _0810C158
_0810C156:
	ldr r0, _0810C168 @ =0x0000ffff
_0810C158:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810C168: .4byte 0x0000ffff
	thumb_func_end sub_810C0C0

	thumb_func_start sub_810C16C
sub_810C16C: @ 810C16C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	ldr r4, [sp, 0x34]
	ldr r5, [sp, 0x38]
	ldr r6, [sp, 0x3C]
	ldr r7, [sp, 0x40]
	mov r8, r7
	ldr r7, [sp, 0x44]
	mov r9, r7
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r6, 24
	lsrs r6, 24
	mov r7, r8
	lsls r7, 16
	lsrs r7, 16
	mov r8, r7
	mov r7, r9
	lsls r7, 24
	lsrs r7, 24
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	mov r4, r8
	str r4, [sp, 0xC]
	movs r4, 0
	str r4, [sp, 0x10]
	str r7, [sp, 0x14]
	bl oamt_spawn_poke_or_trainer_picture
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810C16C

	thumb_func_start sub_810C1CC
sub_810C1CC: @ 810C1CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	ldr r6, [sp, 0x34]
	ldr r7, [sp, 0x38]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r7, 16
	lsrs r7, 16
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	str r7, [sp, 0xC]
	movs r4, 0
	str r4, [sp, 0x10]
	bl sub_810C16C
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810C1CC

	thumb_func_start sub_810C214
sub_810C214: @ 810C214
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_810BFA4
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_810C214

	thumb_func_start sub_810C228
sub_810C228: @ 810C228
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r5, [sp, 0x24]
	ldr r6, [sp, 0x28]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	str r4, [sp, 0x10]
	bl sub_810C0C0
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x14
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810C228

	thumb_func_start sub_810C25C
sub_810C25C: @ 810C25C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	ldr r6, [sp, 0x34]
	ldr r7, [sp, 0x38]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	lsls r7, 24
	lsrs r7, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	str r7, [sp, 0xC]
	movs r4, 0
	str r4, [sp, 0x10]
	bl sub_810C0C0
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810C25C

	thumb_func_start sub_810C2A4
sub_810C2A4: @ 810C2A4
	push {r4,r5,lr}
	sub sp, 0x14
	adds r5, r1, 0
	ldr r1, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r0, 16
	lsrs r0, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	asrs r2, 16
	str r2, [sp]
	lsls r3, 16
	asrs r3, 16
	str r3, [sp, 0x4]
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r1, 0x1
	str r1, [sp, 0x10]
	movs r1, 0
	movs r2, 0
	adds r3, r5, 0
	bl sub_810BF44
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x14
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810C2A4

	thumb_func_start sub_810C2E8
sub_810C2E8: @ 810C2E8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_810BFA4
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_810C2E8

	thumb_func_start sub_810C2FC
sub_810C2FC: @ 810C2FC
	push {r4,lr}
	sub sp, 0xC
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r2, [sp]
	str r3, [sp, 0x4]
	movs r1, 0x1
	str r1, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	adds r3, r4, 0
	bl sub_810C050
	lsls r0, 16
	lsrs r0, 16
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810C2FC

	thumb_func_start sub_810C330
sub_810C330: @ 810C330
	push {r4,r5,lr}
	sub sp, 0x14
	adds r5, r1, 0
	ldr r1, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r0, 16
	lsrs r0, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r2, [sp]
	str r3, [sp, 0x4]
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r1, 0x1
	str r1, [sp, 0x10]
	movs r1, 0
	movs r2, 0
	adds r3, r5, 0
	bl sub_810C0C0
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x14
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_810C330

	thumb_func_start sub_810C374
sub_810C374: @ 810C374
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	bne _0810C39A
	cmp r0, 0
	beq _0810C394
	ldr r0, _0810C390 @ =gUnknown_82538A8
	adds r0, 0x87
	ldrb r0, [r0]
	b _0810C39A
	.align 2, 0
_0810C390: .4byte gUnknown_82538A8
_0810C394:
	ldr r0, _0810C3A0 @ =gUnknown_82538A8
	adds r0, 0x86
	ldrb r0, [r0]
_0810C39A:
	pop {r1}
	bx r1
	.align 2, 0
_0810C3A0: .4byte gUnknown_82538A8
	thumb_func_end sub_810C374

	.align 2, 0 @ Don't pad with nop.
