gInGameTrades:: @ 826CF8C
	.string "MIMIEN$", 11
	.align 1
	.2byte SPECIES_MR_MIME @ species
	.byte 20, 15, 17, 24, 23, 22 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 1985 @ OT ID
	.byte 5, 5, 5, 30, 5 @ contest stats
	.align 2
	.4byte 0x00009cae @ personality
	.2byte ITEM_NONE @ held item
	.byte 255 @ mail index
	.string "REYLEY$", 11
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_ABRA @ species requested
	.align 2

	.string "ZYNX$", 11
	.align 1
	.2byte SPECIES_JYNX @ species
	.byte 18, 17, 18, 22, 25, 21 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 36728 @ OT ID
	.byte 5, 30, 5, 5, 5 @ contest stats
	.align 2
	.4byte 0x498a2e1d @ personality
	.2byte ITEM_FAB_MAIL @ held item
	.byte 0 @ mail index
	.string "DONTAE$", 11
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_POLIWHIRL @ species requested
	.align 2

	.string "MS. NIDO$", 11
	.align 1
	.2byte SPECIES_NIDORAN_F @ species
	.byte 22, 18, 25, 19, 15, 22 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 63184 @ OT ID
	.byte 5, 5, 5, 5, 30 @ contest stats
	.align 2
	.4byte 0x4c970b89 @ personality
	.2byte ITEM_TINY_MUSHROOM @ held item
	.byte 255 @ mail index
	.string "SAIGE$", 11
	.byte FEMALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_NIDORAN_M @ species requested
	.align 2

	.string "CH'DING$", 11
	.align 1
	.2byte SPECIES_FARFETCHD @ species
	.byte 20, 25, 21, 24, 15, 20 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 8810 @ OT ID
	.byte 30, 5, 5, 5, 5 @ contest stats
	.align 2
	.4byte 0x151943d7 @ personality
	.2byte ITEM_STICK @ held item
	.byte 255 @ mail index
	.string "ELYSSA$", 11
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_SPEAROW @ species requested
	.align 2

	.string "NINA$", 11
	.align 1
	.2byte SPECIES_NIDORINA @ species
	.byte 22, 25, 18, 19, 22, 15 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 13637 @ OT ID
	.byte 5, 5, 30, 5, 5 @ contest stats
	.align 2
	.4byte 0x00eeca15 @ personality
	.2byte ITEM_NONE @ held item
	.byte 255 @ mail index
	.string "TURNER$", 11
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_NIDORINO @ species requested
	.align 2

	.string "MARC$", 11
	.align 1
	.2byte SPECIES_LICKITUNG @ species
	.byte 24, 19, 21, 15, 23, 21 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 1239 @ OT ID
	.byte 5, 5, 5, 5, 30 @ contest stats
	.align 2
	.4byte 0x451308ab @ personality
	.2byte ITEM_NONE @ held item
	.byte 255 @ mail index
	.string "HADEN$", 11
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_GOLDUCK @ species requested
	.align 2

	.string "ESPHERE$", 11
	.align 1
	.2byte SPECIES_ELECTRODE @ species
	.byte 19, 16, 18, 25, 25, 19 @ IVs
	.byte TRUE @ has second ability
	.align 2
	.4byte 50298 @ OT ID
	.byte 30, 5, 5, 5, 5 @ contest stats
	.align 2
	.4byte 0x06341016 @ personality
	.2byte ITEM_NONE @ held item
	.byte 255 @ mail index
	.string "CLIFTON$", 11
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_RAICHU @ species requested
	.align 2

	.string "TANGENY$", 11
	.align 1
	.2byte SPECIES_TANGELA @ species
	.byte 22, 17, 25, 16, 23, 20 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 60042 @ OT ID
	.byte 5, 5, 30, 5, 5 @ contest stats
	.align 2
	.4byte 0x5c77ecfa @ personality
	.2byte ITEM_STARDUST @ held item
	.byte 255 @ mail index
	.string "NORMA$", 11
	.byte FEMALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_VENONAT @ species requested
	.align 2

	.string "SEELOR$", 11
	.align 1
	.2byte SPECIES_SEEL @ species
	.byte 24, 15, 22, 16, 23, 22 @ IVs
	.byte FALSE @ has second ability
	.align 2
	.4byte 9853 @ OT ID
	.byte 5, 5, 5, 5, 30 @ contest stats
	.align 2
	.4byte 0x482cac89 @ personality
	.2byte ITEM_NONE @ held item
	.byte 255 @ mail index
	.string "GARETT$", 11
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_PONYTA @ species requested
	.align 2

sInGameTradeMailMessages:: @ 826D1A8
	.2byte EC_WORD_THAT_S
	.2byte EC_WORD_A
	.2byte EC_WORD_HEALTHY
	.2byte EC_POKEMON2(JYNX)
	.2byte EC_WORD_EXCL
	.2byte EC_WORD_BE
	.2byte EC_WORD_KIND
	.2byte EC_WORD_TO
	.2byte EC_WORD_IT
	.2byte 0
