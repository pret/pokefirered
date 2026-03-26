	.ifdef FIRERED
	.equiv GAME_VERSION, 4
	.endif
	.ifdef FULLSPEC
	.equiv GAME_VERSION, 4
	.endif
	.ifdef LEAFGREEN
	.equiv GAME_VERSION, 5
	.endif

	.ifdef ENGLISH
	.equiv GAME_LANGUAGE, 2
	.else
	.ifdef GERMAN
	.equiv GAME_LANGUAGE, 5
	.endif
	.endif
