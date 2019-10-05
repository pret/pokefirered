#include "constants/decorations.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

	.include "data/decoration_tiles.inc"
	.include "data/text/decoration_descriptions.inc"

	.align 2
gDecorations:: @ 84556F8
	.byte DECOR_NONE
	.string "SMALL DESK$", 16
	.byte 0x00, 0x00, 0x00
	.2byte 0, 0
	.4byte gUnknown_8454238
	.4byte gUnknown_8454004

	.byte DECOR_SMALL_DESK
	.string "SMALL DESK$", 16
	.byte 0x00, 0x00, 0x00
	.2byte 3000, 0
	.4byte gUnknown_8454238
	.4byte gUnknown_8454004

	.byte DECOR_POKEMON_DESK
	.string "POKéMON DESK$", 16
	.byte 0x00, 0x00, 0x00
	.2byte 3000, 0
	.4byte gUnknown_8454254
	.4byte gUnknown_8454006

	.byte DECOR_HEAVY_DESK
	.string "HEAVY DESK$", 16
	.byte 0x00, 0x09, 0x00
	.2byte 6000, 0
	.4byte gUnknown_8454284
	.4byte gUnknown_8454008

	.byte DECOR_RAGGED_DESK
	.string "RAGGED DESK$", 16
	.byte 0x00, 0x09, 0x00
	.2byte 6000, 0
	.4byte gUnknown_84542BC
	.4byte gUnknown_8454014

	.byte DECOR_COMFORT_DESK
	.string "COMFORT DESK$", 16
	.byte 0x00, 0x09, 0x00
	.2byte 6000, 0
	.4byte gUnknown_84542F3
	.4byte gUnknown_8454020

	.byte DECOR_PRETTY_DESK
	.string "PRETTY DESK$", 16
	.byte 0x00, 0x08, 0x00
	.2byte 9000, 0
	.4byte gUnknown_845432C
	.4byte gUnknown_845402C

	.byte DECOR_BRICK_DESK
	.string "BRICK DESK$", 16
	.byte 0x00, 0x08, 0x00
	.2byte 9000, 0
	.4byte gUnknown_8454362
	.4byte gUnknown_845403E

	.byte DECOR_CAMP_DESK
	.string "CAMP DESK$", 16
	.byte 0x00, 0x08, 0x00
	.2byte 9000, 0
	.4byte gUnknown_8454398
	.4byte gUnknown_8454050

	.byte DECOR_HARD_DESK
	.string "HARD DESK$", 16
	.byte 0x00, 0x08, 0x00
	.2byte 9000, 0
	.4byte gUnknown_84543D1
	.4byte gUnknown_8454062

	.byte DECOR_SMALL_CHAIR
	.string "SMALL CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_8454404
	.4byte gUnknown_8454074

	.byte DECOR_POKEMON_CHAIR
	.string "POKéMON CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_8454420
	.4byte gUnknown_8454076

	.byte DECOR_HEAVY_CHAIR
	.string "HEAVY CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_8454451
	.4byte gUnknown_8454078

	.byte DECOR_PRETTY_CHAIR
	.string "PRETTY CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_845446E
	.4byte gUnknown_845407A

	.byte DECOR_COMFORT_CHAIR
	.string "COMFORT CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_845448B
	.4byte gUnknown_845407C

	.byte DECOR_RAGGED_CHAIR
	.string "RAGGED CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_84544A9
	.4byte gUnknown_845407E

	.byte DECOR_BRICK_CHAIR
	.string "BRICK CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_84544C5
	.4byte gUnknown_8454080

	.byte DECOR_CAMP_CHAIR
	.string "CAMP CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_84544E2
	.4byte gUnknown_8454082

	.byte DECOR_HARD_CHAIR
	.string "HARD CHAIR$", 16
	.byte 0x01, 0x00, 0x01
	.2byte 2000, 0
	.4byte gUnknown_84544FE
	.4byte gUnknown_8454084

	.byte DECOR_RED_PLANT
	.string "RED PLANT$", 16
	.byte 0x02, 0x05, 0x02
	.2byte 3000, 0
	.4byte gUnknown_845451A
	.4byte gUnknown_8454086

	.byte DECOR_TROPICAL_PLANT
	.string "TROPICAL PLANT$", 16
	.byte 0x02, 0x05, 0x02
	.2byte 3000, 0
	.4byte gUnknown_8454534
	.4byte gUnknown_845408A

	.byte DECOR_PRETTY_FLOWERS
	.string "PRETTY FLOWERS$", 16
	.byte 0x02, 0x05, 0x02
	.2byte 3000, 0
	.4byte gUnknown_8454559
	.4byte gUnknown_845408E

	.byte DECOR_COLORFUL_PLANT
	.string "COLORFUL PLANT$", 16
	.byte 0x02, 0x04, 0x02
	.2byte 5000, 0
	.4byte gUnknown_8454570
	.4byte gUnknown_8454092

	.byte DECOR_BIG_PLANT
	.string "BIG PLANT$", 16
	.byte 0x02, 0x04, 0x02
	.2byte 5000, 0
	.4byte gUnknown_8454598
	.4byte gUnknown_845409A

	.byte DECOR_GORGEOUS_PLANT
	.string "GORGEOUS PLANT$", 16
	.byte 0x02, 0x04, 0x02
	.2byte 5000, 0
	.4byte gUnknown_84545C6
	.4byte gUnknown_84540A2

	.byte DECOR_RED_BRICK
	.string "RED BRICK$", 16
	.byte 0x00, 0x05, 0x03
	.2byte 500, 0
	.4byte gUnknown_84545EE
	.4byte gUnknown_84540AA

	.byte DECOR_YELLOW_BRICK
	.string "YELLOW BRICK$", 16
	.byte 0x00, 0x05, 0x03
	.2byte 500, 0
	.4byte gUnknown_8454625
	.4byte gUnknown_84540AE

	.byte DECOR_BLUE_BRICK
	.string "BLUE BRICK$", 16
	.byte 0x00, 0x05, 0x03
	.2byte 500, 0
	.4byte gUnknown_845465A
	.4byte gUnknown_84540B2

	.byte DECOR_RED_BALLOON
	.string "RED BALLOON$", 16
	.byte 0x01, 0x00, 0x03
	.2byte 500, 0
	.4byte gUnknown_845468D
	.4byte gUnknown_84540B6

	.byte DECOR_BLUE_BALLOON
	.string "BLUE BALLOON$", 16
	.byte 0x01, 0x00, 0x03
	.2byte 500, 0
	.4byte gUnknown_84546C4
	.4byte gUnknown_84540B8

	.byte DECOR_YELLOW_BALLOON
	.string "YELLOW BALLOON$", 16
	.byte 0x01, 0x00, 0x03
	.2byte 500, 0
	.4byte gUnknown_84546FC
	.4byte gUnknown_84540BA

	.byte DECOR_RED_TENT
	.string "RED TENT$", 16
	.byte 0x01, 0x08, 0x03
	.2byte 10000, 0
	.4byte gUnknown_8454734
	.4byte gUnknown_84540BC

	.byte DECOR_BLUE_TENT
	.string "BLUE TENT$", 16
	.byte 0x01, 0x08, 0x03
	.2byte 10000, 0
	.4byte gUnknown_845475E
	.4byte gUnknown_84540CE

	.byte DECOR_SOLID_BOARD
	.string "SOLID BOARD$", 16
	.byte 0x01, 0x05, 0x03
	.2byte 3000, 0
	.4byte gUnknown_8454789
	.4byte gUnknown_84540E0

	.byte DECOR_SLIDE
	.string "SLIDE$", 16
	.byte 0x01, 0x07, 0x03
	.2byte 8000, 0
	.4byte gUnknown_84547B7
	.4byte gUnknown_84540E4

	.byte DECOR_FENCE_LENGTH
	.string "FENCE LENGTH$", 16
	.byte 0x00, 0x00, 0x03
	.2byte 500, 0
	.4byte gUnknown_84547DC
	.4byte gUnknown_84540F4

	.byte DECOR_FENCE_WIDTH
	.string "FENCE WIDTH$", 16
	.byte 0x00, 0x00, 0x03
	.2byte 500, 0
	.4byte gUnknown_84547FF
	.4byte gUnknown_84540F6

	.byte DECOR_TIRE
	.string "TIRE$", 16
	.byte 0x00, 0x04, 0x03
	.2byte 800, 0
	.4byte gUnknown_8454822
	.4byte gUnknown_84540F8

	.byte DECOR_STAND
	.string "STAND$", 16
	.byte 0x01, 0x03, 0x03
	.2byte 7000, 0
	.4byte gUnknown_8454857
	.4byte gUnknown_8454100

	.byte DECOR_MUD_BALL
	.string "MUD BALL$", 16
	.byte 0x01, 0x00, 0x03
	.2byte 200, 0
	.4byte gUnknown_8454874
	.4byte gUnknown_8454110

	.byte DECOR_BREAKABLE_DOOR
	.string "BREAKABLE DOOR$", 16
	.byte 0x01, 0x05, 0x03
	.2byte 3000, 0
	.4byte gUnknown_84548A1
	.4byte gUnknown_8454112

	.byte DECOR_SAND_ORNAMENT
	.string "SAND ORNAMENT$", 16
	.byte 0x02, 0x05, 0x03
	.2byte 3000, 0
	.4byte gUnknown_84548D2
	.4byte gUnknown_8454116

	.byte DECOR_SILVER_SHIELD
	.string "SILVER SHIELD$", 16
	.byte 0x02, 0x05, 0x03
	.2byte 0, 0
	.4byte gUnknown_8454901
	.4byte gUnknown_845411A

	.byte DECOR_GOLD_SHIELD
	.string "GOLD SHIELD$", 16
	.byte 0x02, 0x05, 0x03
	.2byte 0, 0
	.4byte gUnknown_8454933
	.4byte gUnknown_845411E

	.byte DECOR_GLASS_ORNAMENT
	.string "GLASS ORNAMENT$", 16
	.byte 0x02, 0x05, 0x03
	.2byte 0, 0
	.4byte gUnknown_8454966
	.4byte gUnknown_8454122

	.byte DECOR_TV
	.string "TV$", 16
	.byte 0x00, 0x00, 0x03
	.2byte 3000, 0
	.4byte gUnknown_845499F
	.4byte gUnknown_8454126

	.byte DECOR_ROUND_TV
	.string "ROUND TV$", 16
	.byte 0x00, 0x00, 0x03
	.2byte 4000, 0
	.4byte gUnknown_84549BE
	.4byte gUnknown_8454128

	.byte DECOR_CUTE_TV
	.string "CUTE TV$", 16
	.byte 0x00, 0x00, 0x03
	.2byte 4000, 0
	.4byte gUnknown_84549E9
	.4byte gUnknown_845412A

	.byte DECOR_GLITTER_MAT
	.string "GLITTER MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 2000, 0
	.4byte gUnknown_8454A14
	.4byte gUnknown_845412C

	.byte DECOR_JUMP_MAT
	.string "JUMP MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 2000, 0
	.4byte gUnknown_8454A3C
	.4byte gUnknown_845412E

	.byte DECOR_SPIN_MAT
	.string "SPIN MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 2000, 0
	.4byte gUnknown_8454A6A
	.4byte gUnknown_8454130

	.byte DECOR_C_LOW_NOTE_MAT
	.string "C Low NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454A99
	.4byte gUnknown_8454132

	.byte DECOR_D_NOTE_MAT
	.string "D NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454AC8
	.4byte gUnknown_8454134

	.byte DECOR_E_NOTE_MAT
	.string "E NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454AF3
	.4byte gUnknown_8454136

	.byte DECOR_F_NOTE_MAT
	.string "F NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454B1F
	.4byte gUnknown_8454138

	.byte DECOR_G_NOTE_MAT
	.string "G NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454B4B
	.4byte gUnknown_845413A

	.byte DECOR_A_NOTE_MAT
	.string "A NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454B76
	.4byte gUnknown_845413C

	.byte DECOR_B_NOTE_MAT
	.string "B NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454BA2
	.4byte gUnknown_845413E

	.byte DECOR_C_HIGH_NOTE_MAT
	.string "C High NOTE MAT$", 16
	.byte 0x01, 0x00, 0x04
	.2byte 500, 0
	.4byte gUnknown_8454BCD
	.4byte gUnknown_8454140

	.byte DECOR_SURF_MAT
	.string "SURF MAT$", 16
	.byte 0x01, 0x08, 0x04
	.2byte 4000, 0
	.4byte gUnknown_8454BFD
	.4byte gUnknown_8454142

	.byte DECOR_THUNDER_MAT
	.string "THUNDER MAT$", 16
	.byte 0x01, 0x08, 0x04
	.2byte 4000, 0
	.4byte gUnknown_8454C31
	.4byte gUnknown_8454154

	.byte DECOR_FIRE_BLAST_MAT
	.string "FIRE BLAST MAT$", 16
	.byte 0x01, 0x08, 0x04
	.2byte 4000, 0
	.4byte gUnknown_8454C68
	.4byte gUnknown_8454166

	.byte DECOR_POWDER_SNOW_MAT
	.string "POWDER SNOW MAT$", 16
	.byte 0x01, 0x08, 0x04
	.2byte 4000, 0
	.4byte gUnknown_8454CA2
	.4byte gUnknown_8454178

	.byte DECOR_ATTRACT_MAT
	.string "ATTRACT MAT$", 16
	.byte 0x01, 0x08, 0x04
	.2byte 4000, 0
	.4byte gUnknown_8454CDB
	.4byte gUnknown_845418A

	.byte DECOR_FISSURE_MAT
	.string "FISSURE MAT$", 16
	.byte 0x01, 0x08, 0x04
	.2byte 4000, 0
	.4byte gUnknown_8454D13
	.4byte gUnknown_845419C

	.byte DECOR_SPIKES_MAT
	.string "SPIKES MAT$", 16
	.byte 0x01, 0x08, 0x04
	.2byte 4000, 0
	.4byte gUnknown_8454D4A
	.4byte gUnknown_84541AE

	.byte DECOR_BALL_POSTER
	.string "BALL POSTER$", 16
	.byte 0x03, 0x00, 0x05
	.2byte 1000, 0
	.4byte gUnknown_8454D80
	.4byte gUnknown_84541C0

	.byte DECOR_GREEN_POSTER
	.string "GREEN POSTER$", 16
	.byte 0x03, 0x00, 0x05
	.2byte 1000, 0
	.4byte gUnknown_8454DA8
	.4byte gUnknown_84541C2

	.byte DECOR_RED_POSTER
	.string "RED POSTER$", 16
	.byte 0x03, 0x00, 0x05
	.2byte 1000, 0
	.4byte gUnknown_8454DCD
	.4byte gUnknown_84541C4

	.byte DECOR_BLUE_POSTER
	.string "BLUE POSTER$", 16
	.byte 0x03, 0x00, 0x05
	.2byte 1000, 0
	.4byte gUnknown_8454DF2
	.4byte gUnknown_84541C6

	.byte DECOR_CUTE_POSTER
	.string "CUTE POSTER$", 16
	.byte 0x03, 0x00, 0x05
	.2byte 1000, 0
	.4byte gUnknown_8454E16
	.4byte gUnknown_84541C8

	.byte DECOR_PIKA_POSTER
	.string "PIKA POSTER$", 16
	.byte 0x03, 0x01, 0x05
	.2byte 1500, 0
	.4byte gUnknown_8454E3C
	.4byte gUnknown_84541CA

	.byte DECOR_LONG_POSTER
	.string "LONG POSTER$", 16
	.byte 0x03, 0x01, 0x05
	.2byte 1500, 0
	.4byte gUnknown_8454E6B
	.4byte gUnknown_84541CE

	.byte DECOR_SEA_POSTER
	.string "SEA POSTER$", 16
	.byte 0x03, 0x01, 0x05
	.2byte 1500, 0
	.4byte gUnknown_8454E90
	.4byte gUnknown_84541D2

	.byte DECOR_SKY_POSTER
	.string "SKY POSTER$", 16
	.byte 0x03, 0x01, 0x05
	.2byte 1500, 0
	.4byte gUnknown_8454EB7
	.4byte gUnknown_84541D6

	.byte DECOR_KISS_POSTER
	.string "KISS POSTER$", 16
	.byte 0x03, 0x01, 0x05
	.2byte 1500, 0
	.4byte gUnknown_8454EDC
	.4byte gUnknown_84541DA

	.byte DECOR_PICHU_DOLL
	.string "PICHU DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8454F02
	.4byte gUnknown_84541DE

	.byte DECOR_PIKACHU_DOLL
	.string "PIKACHU DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8454F2D
	.4byte gUnknown_84541E0

	.byte DECOR_MARILL_DOLL
	.string "MARILL DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8454F5A
	.4byte gUnknown_84541E2

	.byte DECOR_TOGEPI_DOLL
	.string "TOGEPI DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8454F86
	.4byte gUnknown_84541E4

	.byte DECOR_CYNDAQUIL_DOLL
	.string "CYNDAQUIL DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8454FB2
	.4byte gUnknown_84541E6

	.byte DECOR_CHIKORITA_DOLL
	.string "CHIKORITA DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8454FE1
	.4byte gUnknown_84541E8

	.byte DECOR_TOTODILE_DOLL
	.string "TOTODILE DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8455010
	.4byte gUnknown_84541EA

	.byte DECOR_JIGGLYPUFF_DOLL
	.string "JIGGLYPUFF DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_845503E
	.4byte gUnknown_84541EC

	.byte DECOR_MEOWTH_DOLL
	.string "MEOWTH DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_845506E
	.4byte gUnknown_84541EE

	.byte DECOR_CLEFAIRY_DOLL
	.string "CLEFAIRY DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_845509A
	.4byte gUnknown_84541F0

	.byte DECOR_DITTO_DOLL
	.string "DITTO DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_84550C8
	.4byte gUnknown_84541F2

	.byte DECOR_SMOOCHUM_DOLL
	.string "SMOOCHUM DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_84550F3
	.4byte gUnknown_84541F4

	.byte DECOR_TREECKO_DOLL
	.string "TREECKO DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8455121
	.4byte gUnknown_84541F6

	.byte DECOR_TORCHIC_DOLL
	.string "TORCHIC DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_845514E
	.4byte gUnknown_84541F8

	.byte DECOR_MUDKIP_DOLL
	.string "MUDKIP DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_845517B
	.4byte gUnknown_84541FA

	.byte DECOR_DUSKULL_DOLL
	.string "DUSKULL DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_84551A7
	.4byte gUnknown_84541FC

	.byte DECOR_WYNAUT_DOLL
	.string "WYNAUT DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_84551D4
	.4byte gUnknown_84541FE

	.byte DECOR_BALTOY_DOLL
	.string "BALTOY DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8455200
	.4byte gUnknown_8454200

	.byte DECOR_KECLEON_DOLL
	.string "KECLEON DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_845522C
	.4byte gUnknown_8454202

	.byte DECOR_AZURILL_DOLL
	.string "AZURILL DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8455259
	.4byte gUnknown_8454204

	.byte DECOR_SKITTY_DOLL
	.string "SKITTY DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8455287
	.4byte gUnknown_8454206

	.byte DECOR_SWABLU_DOLL
	.string "SWABLU DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_84552B3
	.4byte gUnknown_8454208

	.byte DECOR_GULPIN_DOLL
	.string "GULPIN DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_84552DF
	.4byte gUnknown_845420A

	.byte DECOR_LOTAD_DOLL
	.string "LOTAD DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_845530B
	.4byte gUnknown_845420C

	.byte DECOR_SEEDOT_DOLL
	.string "SEEDOT DOLL$", 16
	.byte 0x04, 0x00, 0x06
	.2byte 3000, 0
	.4byte gUnknown_8455336
	.4byte gUnknown_845420E

	.byte DECOR_PIKA_CUSHION
	.string "PIKA CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_8455362
	.4byte gUnknown_8454210

	.byte DECOR_ROUND_CUSHION
	.string "ROUND CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_8455392
	.4byte gUnknown_8454212

	.byte DECOR_KISS_CUSHION
	.string "KISS CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_84553C1
	.4byte gUnknown_8454214

	.byte DECOR_ZIGZAG_CUSHION
	.string "ZIGZAG CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_84553F2
	.4byte gUnknown_8454216

	.byte DECOR_SPIN_CUSHION
	.string "SPIN CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_8455424
	.4byte gUnknown_8454218

	.byte DECOR_DIAMOND_CUSHION
	.string "DIAMOND CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_8455453
	.4byte gUnknown_845421A

	.byte DECOR_BALL_CUSHION
	.string "BALL CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_8455483
	.4byte gUnknown_845421C

	.byte DECOR_GRASS_CUSHION
	.string "GRASS CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_84554B0
	.4byte gUnknown_845421E

	.byte DECOR_FIRE_CUSHION
	.string "FIRE CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_84554E3
	.4byte gUnknown_8454220

	.byte DECOR_WATER_CUSHION
	.string "WATER CUSHION$", 16
	.byte 0x04, 0x00, 0x07
	.2byte 2000, 0
	.4byte gUnknown_8455515
	.4byte gUnknown_8454222

	.byte DECOR_SNORLAX_DOLL
	.string "SNORLAX DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_8455548
	.4byte gUnknown_8454224

	.byte DECOR_RHYDON_DOLL
	.string "RHYDON DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_8455573
	.4byte gUnknown_8454226

	.byte DECOR_LAPRAS_DOLL
	.string "LAPRAS DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_845559E
	.4byte gUnknown_8454228

	.byte DECOR_VENUSAUR_DOLL
	.string "VENUSAUR DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_84555C9
	.4byte gUnknown_845422A

	.byte DECOR_CHARIZARD_DOLL
	.string "CHARIZARD DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_84555F4
	.4byte gUnknown_845422C

	.byte DECOR_BLASTOISE_DOLL
	.string "BLASTOISE DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_845561F
	.4byte gUnknown_845422E

	.byte DECOR_WAILMER_DOLL
	.string "WAILMER DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_845564A
	.4byte gUnknown_8454230

	.byte DECOR_REGIROCK_DOLL
	.string "REGIROCK DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_8455675
	.4byte gUnknown_8454232

	.byte DECOR_REGICE_DOLL
	.string "REGICE DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_84556A0
	.4byte gUnknown_8454234

	.byte DECOR_REGISTEEL_DOLL
	.string "REGISTEEL DOLL$", 16
	.byte 0x04, 0x05, 0x06
	.2byte 10000, 0
	.4byte gUnknown_84556CB
	.4byte gUnknown_8454236
