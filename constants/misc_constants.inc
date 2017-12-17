	.set TRUE, 1
	.set FALSE, 0

	.set NULL, 0

	.set POKEMON_NAME_LENGTH, 11
	.set MOVE_NAME_LENGTH,    13

	.set SPRITE_SIZE_8x8,   (OAM_SIZE_0 >> 28) | (OAM_SQUARE >> 14)
	.set SPRITE_SIZE_16x16, (OAM_SIZE_1 >> 28) | (OAM_SQUARE >> 14)
	.set SPRITE_SIZE_32x32, (OAM_SIZE_2 >> 28) | (OAM_SQUARE >> 14)
	.set SPRITE_SIZE_64x64, (OAM_SIZE_3 >> 28) | (OAM_SQUARE >> 14)

	.set SPRITE_SIZE_16x8,  (OAM_SIZE_0 >> 28) | (OAM_H_RECTANGLE >> 14)
	.set SPRITE_SIZE_32x8,  (OAM_SIZE_1 >> 28) | (OAM_H_RECTANGLE >> 14)
	.set SPRITE_SIZE_32x16, (OAM_SIZE_2 >> 28) | (OAM_H_RECTANGLE >> 14)
	.set SPRITE_SIZE_64x32, (OAM_SIZE_3 >> 28) | (OAM_H_RECTANGLE >> 14)

	.set SPRITE_SIZE_8x16,  (OAM_SIZE_0 >> 28) | (OAM_V_RECTANGLE >> 14)
	.set SPRITE_SIZE_8x32,  (OAM_SIZE_1 >> 28) | (OAM_V_RECTANGLE >> 14)
	.set SPRITE_SIZE_16x32, (OAM_SIZE_2 >> 28) | (OAM_V_RECTANGLE >> 14)
	.set SPRITE_SIZE_32x64, (OAM_SIZE_3 >> 28) | (OAM_V_RECTANGLE >> 14)

	.set OBJ_IMAGE_ANIM_H_FLIP, 1 << 6
	.set OBJ_IMAGE_ANIM_V_FLIP, 1 << 7

	.equiv DIR_SOUTH, 1
	.equiv DIR_NORTH, 2
	.equiv DIR_WEST,  3
	.equiv DIR_EAST,  4

	.equiv MALE, 0
	.equiv FEMALE, 1

	.ifdef ENGLISH
	.equiv GAME_LANGUAGE, 2
	.else
	.ifdef GERMAN
	.equiv GAME_LANGUAGE, 5
	.endif
	.endif

	.equiv ENEMY_TYPE1,  0
	.equiv ENEMY_TYPE2,  1
	.equiv PLAYER_TYPE1,  2
	.equiv PLAYER_TYPE2,  3
	.equiv CURRENT_MOVE,  4
	
	.equiv LESS_THAN, 0
	.equiv GREATER_THAN, 1
	.equiv EQUAL, 2
