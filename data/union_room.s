#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_8456C74:: @ 8456C74
	.word gUnknown_84571AC
	.word gUnknown_8459394
	.word gUnknown_84593A4
	.word gUnknown_84593B4
	.word gUnknown_84593C4
	.word gUnknown_84593D4
	.word gUnknown_84593E4
	.word gUnknown_84593F4
	.word gUnknown_84593DC
	.word gUnknown_8459400
	.word gUnknown_8459410
	.word gUnknown_845941C
	.word gUnknown_845942C
	.word gUnknown_8459434
	.word gUnknown_8459440
	.word gUnknown_84571AC
	.word gUnknown_84571AC
	.word gUnknown_84571AC
	.word gUnknown_84571AC
	.word gUnknown_84571AC
	.word gUnknown_84571AC
	.word gUnknown_84593E4
	.word gUnknown_84593F4

gUnknown_8456CD0:: @ 8456CD0
	.byte 0x00, 0x00, 0x00, 0x1E, 0x02, 0x0F @ window template
	.2byte 0x0008

	@ pal table?
gUnknown_8456CD8:: @ 8456CD8
	.2byte 0x0201, 0x0000
	.2byte 0x0202, 0x0000
	.2byte 0x0403, 0x0000
	.2byte 0x0204, 0x0000
	.2byte 0x2509, 0x0000
	.2byte 0x250A, 0x0000
	.2byte 0x350B, 0x0000
	.2byte 0x350D, 0x0000
	.2byte 0x350E, 0x0000

gUnknown_8456CFC:: @ 8456CFC
	.byte 0x00, 0x01, 0x03, 0x0D, 0x0A, 0x0F @ window template
	.2byte 0x0044

gUnknown_8456D04:: @ 8456D04
	.byte 0x00, 0x10, 0x03, 0x07, 0x04, 0x0F @ window template
	.2byte 0x00C6
	
gUnknown_8456D0C:: @ 8456D0C
	.word gUnknown_84571AC, 0
	.word gUnknown_84571AC, 1
	.word gUnknown_84571AC, 2
	.word gUnknown_84571AC, 3
	.word gUnknown_84571AC, 4

gUnknown_8456D34:: @ 8456D34
	.word gUnknown_8456D0C 
	.word NULL
	.word sub_81164C8
	.2byte 0x0005
	.2byte 0x0005
	.byte 0x00, 0x00, 0x01, 0x00, 0x20, 0x31, 0x10, 0x42

gUnknown_8456D4C:: @ 8456D4C
	.byte 0x00, 0x01, 0x03, 0x11, 0x0A, 0x0F @ window template
	.2byte 0x0044

gUnknown_8456D54:: @ 8456D54
	.byte 0x00, 0x14, 0x03, 0x07, 0x04, 0x0F @ window template
	.2byte 0x00EE

gUnknown_8456D5C:: @ 8456D5C
	.word gUnknown_84571AC, 0 
	.word gUnknown_84571AC, 1 
	.word gUnknown_84571AC, 2 
	.word gUnknown_84571AC, 3 
	.word gUnknown_84571AC, 4 
	.word gUnknown_84571AC, 5 
	.word gUnknown_84571AC, 6 
	.word gUnknown_84571AC, 7 
	.word gUnknown_84571AC, 8 
	.word gUnknown_84571AC, 9 
	.word gUnknown_84571AC, 10
	.word gUnknown_84571AC, 11
	.word gUnknown_84571AC, 12
	.word gUnknown_84571AC, 13
	.word gUnknown_84571AC, 14
	.word gUnknown_84571AC, 15

gUnknown_8456DDC:: @ 8456DDC
	.word gUnknown_8456D5C
	.word ListMenuDefaultCursorMoveFunc
	.word sub_8116F94
	.2byte 0x0010
	.2byte 0x0005
	.byte 0x00, 0x00, 0x08, 0x00, 0x20, 0x31, 0x50, 0x02

gUnknown_8456DF4:: @ 8456DF4
	.byte 0x00, 0x14, 0x06, 0x08, 0x07, 0x0F @ window template?
	.2byte 0x0001

gUnknown_8456DFC:: @ 8456DFC
	.word gUnknown_8459354, 0x00000208
	.word gUnknown_8459344, 0x00000241
	.word gUnknown_845934C, 0x00000245
	.word gUnknown_8459360, 0x00000040

gUnknown_8456E1C:: @ 8456E1C
	.word gUnknown_8456DFC
	.word ListMenuDefaultCursorMoveFunc
	.word NULL
	.2byte 0x0004
	.2byte 0x0004
	.byte 0x00, 0x00, 0x08, 0x00, 0x20, 0x31, 0x01, 0x02

gUnknown_8456E34:: @ 8456E34
	.byte 0x00, 0x12, 0x08, 0x0B, 0x05, 0x0F @ window template
	.2byte 0x0001

gUnknown_8456E3C:: @ 8456E3C
	.word gText_Register, 1
	.word gUnknown_8459370, 2
	.word gUnknown_8459360, 3

gUnknown_8456E54:: @ 8456E54
	.word gUnknown_8456E3C
	.word ListMenuDefaultCursorMoveFunc
	.word NULL
	.2byte 0x0003
	.2byte 0x0003
	.byte 0x00, 0x00, 0x08, 0x00, 0x20, 0x31, 0x01, 0x02

gUnknown_8456E6C:: @ 8456E6C
	.byte 0x00, 0x14, 0x02, 0x09, 0x0B, 0x0F @ window template
	.2byte 0x0001

gUnknown_8456E74:: @ 8456E74
	.word gTypeNames + 0x00, 0
	.word gTypeNames + 0x46, 10
	.word gTypeNames + 0x4D, 11
	.word gTypeNames + 0x5B, 13
	.word gTypeNames + 0x54, 12
	.word gTypeNames + 0x69, 15
	.word gTypeNames + 0x1C, 4
	.word gTypeNames + 0x23, 5
	.word gTypeNames + 0x0E, 2
	.word gTypeNames + 0x62, 14
	.word gTypeNames + 0x07, 1
	.word gTypeNames + 0x15, 3
	.word gTypeNames + 0x2A, 6
	.word gTypeNames + 0x31, 7
	.word gTypeNames + 0x70, 16
	.word gTypeNames + 0x38, 8
	.word gTypeNames + 0x77, 17
	.word gUnknown_8459360, 18

gUnknown_8456F04:: @ 8456F04
	.word gUnknown_8456E74
	.word ListMenuDefaultCursorMoveFunc
	.word NULL
	.2byte 0x0012
	.2byte 0x0006
	.byte 0x00, 0x00, 0x08, 0x00, 0x22, 0x31, 0x01, 0x02

gUnknown_8456F1C:: @ 8456F1C
	.byte 0x00, 0x01, 0x01, 0x1C, 0x02, 0x0D @ window template
	.2byte 0x0001

gUnknown_8456F24:: @ 8456F24
	.byte 0x00, 0x01, 0x05, 0x1C, 0x0A, 0x0D @ window template
	.2byte 0x0039

gUnknown_8456F2C:: @ 8456F2C
	.word gUnknown_84571AC, -3
	.word gUnknown_84571AC, 0
	.word gUnknown_84571AC, 1
	.word gUnknown_84571AC, 2
	.word gUnknown_84571AC, 3
	.word gUnknown_84571AC, 4
	.word gUnknown_84571AC, 5
	.word gUnknown_84571AC, 6
	.word gUnknown_84571AC, 7
	.word gUnknown_8459368, 8

gUnknown_8456F7C:: @ 8456F7C
	.word gUnknown_8456F2C
	.word ListMenuDefaultCursorMoveFunc
	.word sub_811ACA4
	.2byte 0x000A 
	.2byte 0x0005 
	.byte 0x00, 0x00, 0x0C, 0x00, 0xE2, 0xDF, 0x09, 0x02

	@ unused window template?
	.byte 0x00, 0x01, 0x05, 0x1C, 0x0A, 0x0D
	.2byte 0x0039

gUnknown_8456F9C:: @ 8456F9C
	.word gUnknown_84571AC, 0
	.word gUnknown_84571AC, 1
	.word gUnknown_84571AC, 2
	.word gUnknown_84571AC, 3
	.word gUnknown_84571AC, 4
	.word gUnknown_84571AC, 5
	.word gUnknown_84571AC, 6
	.word gUnknown_84571AC, 7
	.word gUnknown_84571AC, 8
	.word gUnknown_84571AC, 9
	.word gUnknown_84571AC, 10
	.word gUnknown_84571AC, 11
	.word gUnknown_84571AC, 12
	.word gUnknown_84571AC, 13
	.word gUnknown_84571AC, 14
	.word gUnknown_84571AC, 15

gUnknown_845701C:: @ 845701C
	.word gUnknown_8456F9C
	.word ListMenuDefaultCursorMoveFunc
	.word nullsub_92
	.2byte 0x0010
	.2byte 0x0004
	.byte 0x00, 0x00, 0x08, 0x01, 0x20, 0x31, 0x41, 0x02

gUnknown_8457034:: @ 8457034
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	
	@ starts at gUnknown_082F0474 in pokeemerald, union link groups
gUnknown_845704C:: @ 845704C
	.byte 0x01, 0xFF, 0x00, 0x00
gUnknown_8457050:: @ 8457050
	.byte 0x02, 0xFF, 0x00, 0x00
gUnknown_8457054:: @ 8457054
	.byte 0x03, 0xFF, 0x00, 0x00
gUnknown_8457058:: @ 8457058	
	.byte 0x04, 0xFF, 0x00, 0x00
gUnknown_845705C:: @ 845705C
	.byte 0x09, 0xFF, 0x00, 0x00
gUnknown_8457060:: @ 8457060
	.byte 0x0A, 0xFF, 0x00, 0x00
gUnknown_8457064:: @ 8457064
	.byte 0x0B, 0xFF, 0x00, 0x00
gUnknown_8457068:: @ 8457068
	.byte 0x15, 0xFF, 0x00, 0x00
gUnknown_845706C:: @ 845706C
	.byte 0x16, 0xFF, 0x00, 0x00
gUnknown_8457070:: @ 8457070
	.byte 0x40, 0x41, 0x44, 0x45, 0x48, 0x51, 0x52, 0x53, 0x54, 0xFF, 0x00, 0x00
gUnknown_845707C:: @ 845707C
	.byte 0x0C, 0xFF, 0x00, 0x00
gUnknown_8457080:: @ 8457080
	.byte 0x01, 0x02, 0x03, 0x04, 0x09, 0x0A, 0x0B, 0x15, 0x16, 0x0D, 0xFF, 0x00
gUnknown_845708C:: @ 845708C
	.byte 0x01, 0x02, 0x03, 0x04, 0x0A, 0xFF, 0x00, 0x00

gUnknown_8457094:: @ 8457094
	.word gUnknown_845704C
	.word gUnknown_8457050
	.word gUnknown_8457054
	.word gUnknown_8457058
	.word gUnknown_845705C
	.word gUnknown_8457060
	.word gUnknown_8457064
	.word gUnknown_8457068
	.word gUnknown_845706C
	.word gUnknown_8457070
	.word gUnknown_845707C
	.word gUnknown_8457080
	.word gUnknown_845708C

gUnknown_84570C8:: @ 84570C8
	.byte 0x01, 0x02, 0x03, 0x04, 0x09, 0x0A, 0x0B, 0x15, 0x16, 0xF7, 0x00, 0xAF, 0xF7, 0x01, 0xFF, 0x00

gUnknown_84570D8:: @ 84570D8
	.byte 0x29, 0x36, 0x27, 0x12, 0x13, 0x14, 0x19, 0x1A, 0x00, 0x00, 0x2A, 0x3A, 0x28, 0x16, 0x17, 0x18, 0x1C, 0x1D, 0x00, 0x00

gUnknown_84570EC:: @ 84570EC
	.2byte 0x0004
	.2byte 0x0006
	.2byte 0x000D
	.2byte 0x0008
	.2byte 0x000A
	.2byte 0x0006
	.2byte 0x0001
	.2byte 0x0008
	.2byte 0x000D
	.2byte 0x0004
	.2byte 0x0007
	.2byte 0x0004
	.2byte 0x0001
	.2byte 0x0004
	.2byte 0x0007
	.2byte 0x0008

gUnknown_845710C:: @ 845710C
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x01

gUnknown_8457116:: @ 8457116
	.byte 0x00, 0x02, 0x01, 0x04, 0x03

gUnknown_845711B:: @ 845711B
	.byte 0x01, 0x03, 0x01, 0x04, 0x02

gUnknown_8457120:: @ 8457120
	.byte 0x09, 0x08, 0x07, 0x02, 0x06, 0x05, 0x04, 0x03, 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x69, 0x00, 0x6A, 0x00

	.align 2
gUnknown_8457138:: @ 8457138
	abspath "rfu_union_tool.c"

	.align 2
gUnknown_8457174:: @ 8457174
	.asciz "0"

	.align 2
gUnknown_8457178:: @ 8457178
	.asciz "UnionObjWork != NULL"

gUnknown_845718D:: @ 845718D
	.byte 0xA4, 0xFE

gUnknown_845718F:: @ 845718F
	.byte 0xA5, 0xFE, 0x00, 0x00, 0x00

gUnknown_8457194:: @ 8457194
	.2byte 0x01FC, 0x0000 @ BgTemplate

gUnknown_8457198:: @ 8457198
	.byte 0x00, 0x02, 0x0F, 0x1A, 0x04, 0x0E @ window template
	.2byte 0x0014

	@ ???
	.byte -1, 0, 0, 0
	.byte 0, 0, 0, 0

gUnknown_84571A8:: @ 84571A8
	.byte 0x01, 0x02, 0x03, 0x00

gUnknown_84571AC:: @ 84571AC
	.string "$"

	.align 2
gUnknown_84571B0:: @ 84571B0
	.string ":$"

	.align 2
gUnknown_84571B4:: @ 84571B4
	.string "{EXTRA 7}$"

	.align 2
gUnknown_84571B8:: @ 84571B8
	.string "Please start over from the beginning.$"

	.align 2
gUnknown_84571E0:: @ 84571E0
	.string "The WIRELESS COMMUNICATION\n"
	.string "SYSTEM search has been canceled.$"

	.align 2
	.string "ともだちからの れんらくを\n" @ something about waiting for a friend to connect?
	.string "まっています$"

	.align 2
gUnknown_8457234:: @ 8457234
	.string "{STR_VAR_1}! Awaiting\n"
	.string "communication from another player.$"

	.align 2
gUnknown_8457264:: @ 8457264
	.string "{STR_VAR_1}! Awaiting link!\n"
	.string "Press START when everyone's ready.$"

	.align 2
gJPText_SingleBattle::
	.string "シングルバトルを かいさいする$"

	.align 2
gJPText_DoubleBattle::
	.string "ダブルバトルを かいさいする$"

	.align 2
gJPText_MultiBattle::
	.string "マルチバトルを かいさいする$"

	.align 2
gJPText_TradePokemon::
	.string "ポケモンこうかんを かいさいする$"

	.align 2
gJPText_Chat::
	.string "チャットを かいさいする$"

	.align 2
gJPText_DistWonderCard::
	.string "ふしぎなカードをくばる$"

	.align 2
gJPText_DistWonderNews::
	.string "ふしぎなニュースをくばる$"

	.align 2
unref_text_union_room_1::
	.string "ふしぎなできごとを かいさいする$"

	.align 2
gJPText_HoldPokemonJump::
	.string "なわとびを かいさいする$"

	.align 2
gJPText_HoldBerryCrush::
	.string "きのみマッシャーを かいさいする$"

	.align 2
gJPText_HoldBerryPicking::
	.string "きのみどりを かいさいする$"

	.align 2
gJPText_HoldSpinTrade::
	.string "ぐるぐるこうかんを かいさいする$"

	.align 2
gJPText_HoldSpinShop::
	.string "ぐるぐるショップを かいさいする$"

	.align 2
unref_text_ptrs_union_room_0::
	.word gJPText_SingleBattle
	.word gJPText_DoubleBattle
	.word gJPText_MultiBattle
	.word gJPText_TradePokemon
	.word gJPText_Chat
	.word gJPText_DistWonderCard
	.word gJPText_DistWonderNews
	.word gJPText_DistWonderCard
	.word gJPText_HoldPokemonJump
	.word gJPText_HoldBerryCrush
	.word gJPText_HoldBerryPicking
	.word gJPText_HoldBerryPicking
	.word gJPText_HoldSpinTrade
	.word gJPText_HoldSpinShop

gText_1PlayerNeeded::
	.string "1 player\n"
	.string "needed.$"
gText_2PlayersNeeded::
	.string "2 players\n"
	.string "needed.$"
gText_3PlayersNeeded::
	.string "3 players\n"
	.string "needed.$"
gText_4PlayersNeeded:: @ uhhhh this one is JP but not the others??? but its english in emerald???
	.string "あと4にん\n"
	.string "ひつよう$"
gText_2PlayerMode::
	.string "2-PLAYER\n"
	.string "MODE$"
gText_3PlayerMode::
	.string "3-PLAYER\n"
	.string "MODE$"
gText_4PlayerMode::
	.string "4-PLAYER\n"
	.string "MODE$"
gText_5PlayerMode::
	.string "5-PLAYER\n"
	.string "MODE$"

gUnknown_845742C:: @ 845742C
	.word gText_1PlayerNeeded
	.word gText_2PlayerMode
	.word NULL
	.word NULL
	.word NULL

	.word gText_3PlayersNeeded
	.word gText_2PlayersNeeded
	.word gText_1PlayerNeeded
	.word gText_4PlayerMode
	.word NULL

	.word gText_1PlayerNeeded
	.word gText_2PlayerMode
	.word gText_3PlayerMode
	.word gText_4PlayerMode
	.word gText_5PlayerMode

	.word gText_2PlayersNeeded
	.word gText_1PlayerNeeded
	.word gText_3PlayerMode
	.word gText_4PlayerMode
	.word gText_5PlayerMode

	@ Huh? No 4 ptrs here from pokeemerald?

	.align 2
gUnknown_845747C:: @ 845747C
	.string "{B_BUTTON}CANCEL$"

	.align 2
unref_text_union_room_2::
	.string "ため\nさんかしゃ ぼしゅうちゅう です！$"

	.align 2
gUnknown_84574A0:: @ 84574A0
	.string "{STR_VAR_2} contacted you for\n{STR_VAR_1}. Accept?$"

	.align 2
gUnknown_84574C4:: @ 84574C4
	.string "{STR_VAR_2} contacted you.\nWill you share {STR_VAR_1}?$"

	.align 2
gUnknown_84574EC:: @ 84574EC
	.string "{STR_VAR_2} contacted you.\nAdd to the members?$"

	.align 2
gUnknown_8457514:: @ 8457514
	.string "{STR_VAR_1}!\nAre these members OK?$"

	.align 2
gUnknown_8457530:: @ 8457530
	.string "Cancel {STR_VAR_1} MODE\nwith these members?$"

	.align 2
gUnknown_8457554:: @ 8457554
	.string "An “OK” was sent\nto {STR_VAR_1}.$"

	.align 2
gUnknown_845756C:: @ 845756C	
	.string "The other TRAINER doesn't appear\nto be available now…\p$"

	.align 2
gUnknown_84575A4:: @ 84575A4
	.string "You can't transmit with a TRAINER\nwho is too far away.\p$"

	.align 2
gUnknown_84575DC:: @ 84575DC
	.string "The other TRAINER(S) is/are not\nready yet.\p$"

	.align 2
gUnknown_8457608:: @ 8457608
	.word gUnknown_84575A4
	.word gUnknown_84575DC

	.align 2
gUnknown_8457610:: @ 8457610
	.string "The {STR_VAR_1} MODE with\nthese members will be canceled.{PAUSE 90}$"

	.align 2
gUnknown_8457644:: @ 8457644
	.string "There is a member who can no\nlonger remain available.\p$"

	.align 2
gUnknown_845767C:: @ 845767C
	.word gUnknown_845756C
	.word gUnknown_8457644

	.align 2
gUnknown_8457684:: @ 8457684
	.string "The other TRAINER appears\nunavailable…\p$"

	.align 2
gUnknown_84576AC:: @ 84576AC
	.string "{STR_VAR_1} sent back an “OK”!$"

	.align 2
gUnknown_84576C4:: @ 84576C4
	.string "{STR_VAR_1} OK'd your registration as\na member.$"

	.align 2
gUnknown_84576EC:: @ 84576EC
	.string "{STR_VAR_1} replied, “No…”\p$"

	.align 2
gUnknown_8457700:: @ 8457700
	.string "{STR_VAR_1}!\nAwaiting other members!$"

	.align 2
gUnknown_845771C:: @ 845771C
	.string "Quit being a member?$"

	.align 2
gUnknown_8457734:: @ 8457734	
	.string "You stopped being a member.\p$"

	.align 2
gUnknown_8457754:: @ 8457754
	.word NULL
	.word gUnknown_8457644
	.word gUnknown_8457684
	.word NULL
	.word NULL
	.word NULL
	.word gUnknown_84576EC
	.word NULL
	.word NULL
	.word gUnknown_8457734

	.align 2
gUnknown_845777C:: @ 845777C
	.string "The WIRELESS COMMUNICATION\nSYSTEM link has been established.$"

	.align 2
gUnknown_84577BC:: @ 84577BC
	.string "The WIRELESS COMMUNICATION\nSYSTEM link has been dropped…$"

	.align 2
gUnknown_84577F8:: @ 84577F8
	.string "The link with your friend has been\ndropped…$"

	.align 2
gUnknown_8457824:: @ 8457824
	.string "{STR_VAR_1} replied, “No…”$"

	.align 2
gUnknown_8457838:: @ 8457838
	.word NULL
	.word gUnknown_84577F8
	.word gUnknown_84577F8
	.word NULL
	.word NULL
	.word NULL
	.word gUnknown_8457824
	.word NULL
	.word NULL
	.word NULL

	.align 2
gUnknown_8457860:: @ 8457860
	.string "Do you want the {STR_VAR_2}\nMODE?$"

	.align 2
gUnknown_845787C:: @ 845787C
	.string "Do you want the {STR_VAR_2}\nMODE?$"

	.align 2
gUnknown_8457898:: @ 8457898
	.word gUnknown_8457860
	.word gUnknown_845787C

	.align 2
gUnknown_84578A0:: @ 84578A0
	.string "はなしかけています…\n" @ Communicating... please wait
	.string "しょうしょう おまちください$"

	.align 2
gUnknown_84578BC:: @ 84578BC
	.string "Awaiting {STR_VAR_1}'s response about\nthe trade…$"

	.align 2
gUnknown_84578E4:: @ 84578E4
	.string "Communicating{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.$"

	.align 2
gUnknown_8457950:: @ 8457950
	.string "Communicating with {STR_VAR_1}{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.$"

	.align 2
gUnknown_84579BC:: @ 84579BC
	.string "Please wait a while{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.$"

	.align 2
gUnknown_8457A34:: @ 8457A34
	.word gUnknown_84578E4
	.word gUnknown_8457950
	.word gUnknown_84579BC

	.align 2
gUnknown_8457A40:: @ 8457A40
	.string "Hiya! Is there something that you\nwanted to do?$"

	.align 2
gUnknown_8457A70:: @ 8457A70
	.string "Hello!\nWould you like to do something?$"

	.align 2
gUnknown_8457A98:: @ 8457A98
	.string "{STR_VAR_1}: Hiya, we meet again!\nWhat are you up for this time?$"

	.align 2
gUnknown_8457AD0:: @ 8457AD0
	.string "{STR_VAR_1}: Oh! {PLAYER}, hello!\nWould you like to do something?$"

	.align 2
gUnknown_8457B04:: @ 8457B04
	.word gUnknown_8457A40
	.word gUnknown_8457A70
	.word gUnknown_8457A98
	.word gUnknown_8457AD0

	.align 2
gUnknown_8457B14:: @ 8457B14
	.string "Want to do something?$"

	.align 2
gUnknown_8457B2C:: @ 8457B2C
	.string "Would you like to do something?$"

	.align 2
gUnknown_8457B4C:: @ 8457B4C
	.string "{STR_VAR_1}: What would you like to\ndo now?$"

	.align 2
gUnknown_8457B70:: @ 8457B70
	.string "{STR_VAR_1}‘また なにかする？$" @ Want to do anything else?

	.align 2
gUnknown_8457B80:: @ 8457B80
	.word gUnknown_8457B14
	.word gUnknown_8457B2C
	.word gUnknown_8457B4C
	.word gUnknown_8457B4C

	.align 2
gUnknown_8457B90:: @ 8457B90
	.string "Somebody has contacted you.{PAUSE 60}$"

	.align 2
gUnknown_8457BA0:: @ 8457BA0
	.string "{STR_VAR_1} has contacted you.{PAUSE 60}$"

	.align 2
gUnknown_8457BCC:: @ 8457BCC
	.word gUnknown_8457B90
	.word gUnknown_8457BA0

	.align 2
gUnknown_8457BD4:: @ 8457BD4
	.string "Awaiting a response from\nthe other TRAINER…$"

	.align 2
gUnknown_8457C00:: @ 8457C00
	.string "Awaiting a response from\n{STR_VAR_1}…$"

	.align 2
gUnknown_8457C20:: @ 8457C20
	.word gUnknown_8457BD4
	.word gUnknown_8457C00

	.align 2
gUnknown_8457C28:: @ 8457C28
	.string "あいての ていあんを まっています\n"
	.string "ビーボタンで キャンセル$"

	.align 2
gUnknown_8457C48:: @ 8457C48
	.string "The other TRAINER showed\n"
	.string "you their TRAINER CARD.\p"
	.string "Would you like to show your\n"
	.string "TRAINER CARD?$"

	.align 2
gUnknown_8457CA4:: @ 8457CA4
	.string "The other TRAINER challenges you\n"
	.string "to battle.\p"
	.string "Will you accept the battle\n"
	.string "challenge?$"

	.align 2
gUnknown_8457CF8:: @ 8457CF8
	.string "The other TRAINER invites you\n"
	.string "to chat.\p"
	.string "Will you accept the chat\n"
	.string "invitation?$"

	.align 2
gUnknown_8457D44:: @ 8457D44
	.string "There is an offer to trade your\n"
	.string "registered Lv. {DYNAMIC 0} {DYNAMIC 1}\p"
	.string "in exchange for a\n"
	.string "Lv. {DYNAMIC 2} {DYNAMIC 3}.\p"
	.string "Will you accept this trade\n"
	.string "offer?$"

	.align 2
gUnknown_8457DB8:: @ 8457DB8
	.string "There is an offer to trade your\n"
	.string "registered EGG.\l"
	.string "Will you accept this trade offer?$"

	.align 2
gUnknown_8457E0C:: @ 8457E0C
	.string "The chat has been dropped.\p$"

gUnknown_8457E28:: @ 8457E28
	.string "You declined the offer.\p$"

	.align 2
gUnknown_8457E44:: @ 8457E44
	.string "You declined the offer.\p$"

	.align 2
gUnknown_8457E60:: @ 8457E60
	.string "The chat was ended.\p$"
	.align 2

gUnknown_8457E78::
	.4byte gUnknown_8457C48
	.4byte gUnknown_8457CA4
	.4byte gUnknown_8457CF8
	.4byte gUnknown_8457D44

	.align 2
gUnknown_8457E88::
	.string "Oh, hey! We're in a chat right now.\n"
	.string "Want to join us?$"

	.align 2
gUnknown_8457EC0::
	.string "{STR_VAR_1}: Hey, {PLAYER}!\n"
	.string "We're having a chat right now.\l"
	.string "Want to join us?$"

	.align 2
gUnknown_8457F00::
	.string "Oh, hi! We're having a chat now.\n"
	.string "Would you like to join us?$"

	.align 2
gUnknown_8457F3C::
	.string "{STR_VAR_1}: Oh, hi, {PLAYER}!\n"
	.string "We're having a chat now.\l"
	.string "Would you like to join us?$"

	.align 2
gUnknown_8457F80:: @ 8457F80
	.4byte gUnknown_8457E88
	.4byte gUnknown_8457F00
	.4byte gUnknown_8457EC0
	.4byte gUnknown_8457F3C

gUnknown_8457F90:: @ 8457F90
	.string "……\n"
	.string "The TRAINER appears to be busy…\p$"

	.align 2
gUnknown_8457FB4::
	.string "A battle, huh?\n"
	.string "All right, just give me some time.$"

	.align 2
gUnknown_8457FE8::
	.string "You want to chat, huh?\n"
	.string "Sure, just wait a little.$"

	.align 2
gUnknown_845801C::
	.string "Sure thing! As my “Greetings,”\n"
	.string "here's my TRAINER CARD.$"

	.align 2
gUnknown_8458054::
	.string "A battle? Of course, but I need\n"
	.string "time to get ready.$"

	.align 2
gUnknown_8458088::
	.string "Did you want to chat?\n"
	.string "Okay, but please wait a moment.$"

	.align 2
gUnknown_84580C0::
	.string "As my introduction, I'll show you\n"
	.string "my TRAINER CARD.$"

	.align 2
gUnknown_84580F4:: @ 84580F4
	.4byte gUnknown_8457FB4
	.4byte gUnknown_8457FE8
	.4byte 0
	.4byte gUnknown_845801C
	.4byte gUnknown_8458054
	.4byte gUnknown_8458088
	.4byte 0
	.4byte gUnknown_84580C0

	.align 2
	.string "チャットだね！\n" @ You want to chat, huh? Sure, just wait a little.
	.string "わかった ちょっと まってて！$"

	.align 2
gUnknown_845812C::
	.string "Thanks for waiting!\n"
	.string "Let's get our battle started!{PAUSE 60}$"

	.align 2
gUnknown_8458164::
	.string "All right!\n"
	.string "Let's chat!{PAUSE 60}$"

	.align 2
gUnknown_8458180::
	.string "Sorry I made you wait!\n"
	.string "Let's get started!{PAUSE 60}$"

	.align 2
gUnknown_84581B0::
	.string "Sorry I made you wait!\n"
	.string "Let's chat.{PAUSE 60}$"

	.align 2
gUnknown_84581D8::
	.string "The trade will be started.{PAUSE 60}$"

	.align 2
gUnknown_84581F8::
	.string "The battle will be started.{PAUSE 60}$"

	.align 2
gUnknown_8458218::
	.string "Entering the chat…{PAUSE 60}$"

	.align 2
gUnknown_8458230:: @ 8458230
	.4byte gUnknown_84581F8
	.4byte gUnknown_8458218
	.4byte gUnknown_84581D8
	.4byte gUnknown_84581F8
	.4byte gUnknown_8458218
	.4byte gUnknown_84581D8
	.4byte gUnknown_845812C
	.4byte gUnknown_8458164
	.4byte gUnknown_84581D8
	.4byte gUnknown_8458180
	.4byte gUnknown_84581B0
	.4byte gUnknown_84581D8

gUnknown_8458260::
	.string "Sorry! My POKéMON don't seem to\n"
	.string "be feeling too well right now.\l"
	.string "Let me battle you another time.\p$"

gUnknown_84582C0::
	.string "I'm terribly sorry, but my POKéMON\n"
	.string "aren't feeling well…\p"
	.string "Let's battle another time.\p$"

gUnknown_8458314:: @ 8458314
	.4byte gUnknown_8458260
	.4byte gUnknown_84582C0

	.align 2
gUnknown_845831C::
	.string "Huh? My TRAINER CARD…\n"
	.string "Where'd it go now?\l"
	.string "Sorry! I'll show you another time!\p$"

	.align 2
gUnknown_845836C::
	.string "Oh? Now where did I put my\n"
	.string "TRAINER CARD?…\l"
	.string "Sorry! I'll show you later!\p$"

	.align 2
gUnknown_84583B4:: @ 84583B4
	.4byte gUnknown_845831C
	.4byte gUnknown_845836C

	.align 2
gUnknown_84583BC::
	.string "If you want to do something with\n"
	.string "me, just give me a shout!\p$"
	.align 2
gUnknown_84583F8::
	.string "If you want to do something with\n"
	.string "me, don't be shy.\p$"

	.align 2
gUnknown_845842C:: @ 845842C
	.4byte gUnknown_84583BC
	.4byte gUnknown_84583F8

gUnknown_8458434:: @ 8458434
	.string "Whoops! Sorry, but I have to do\n"
	.string "something else.\l"
	.string "Another time, okay?\p$"

	.align 2
gUnknown_845847C:: @ 845847C
	.string "If you want to battle, you need\n"
	.string "two POKéMON that are below\l"
	.string "Lv. 30.\p$"

gUnknown_84584C0:: @ 84584C0
	.string "For a battle, you need two\n"
	.string "POKéMON that are below Lv. 30.\p$"

	.align 2
gUnknown_84584FC::
	.string "Oh, all right.\n"
	.string "Come see me anytime, okay?\p$"

	.align 2
gUnknown_8458528::
	.string "Oh…\n"
	.string "Please come by anytime.\p$"

	.align 2
gUnknown_8458548:: @ 8458548
	.4byte gUnknown_84584FC
	.4byte gUnknown_8458528

	.align 2
gUnknown_8458550::
	.string "Oh, sorry!\n"
	.string "I just can't right this instant.\l"
	.string "Let's chat another time.\p$"

	.align 2
gUnknown_8458598::
	.string "Oh, I'm sorry.\n"
	.string "I have too much to do right now.\l"
	.string "Let's chat some other time.\p$"

	.align 2
gUnknown_84585E8:: @ 84585E8
	.4byte gUnknown_8458550
	.4byte gUnknown_8458598

	.align 2
gUnknown_84585F0::
	.string "Whoa!\n"
	.string "I can tell you're pretty tough!\p$"

	.align 2
gUnknown_8458618::
	.string "You used that move?\n"
	.string "That's good strategy!\p$"

	.align 2
gUnknown_8458644::
	.string "Way to go!\n"
	.string "That was an eye-opener!\p$"

	.align 2
gUnknown_8458668::
	.string "Oh! How could you use that\n"
	.string "POKéMON in that situation?\p$"

	.align 2
gUnknown_84586A0::
	.string "That POKéMON…\n"
	.string "It's been raised really well!\p$"

	.align 2
gUnknown_84586D0::
	.string "That's it!\n"
	.string "This is the right move now!\p$"

	.align 2
gUnknown_84586F8::
	.string "That's awesome!\n"
	.string "You can battle that way?\p$"

	.align 2
gUnknown_8458724::
	.string "You have exquisite timing for\n"
	.string "switching POKéMON!\p$"

	.align 2
gUnknown_8458758:: @ 8458758
	.4byte gUnknown_84585F0
	.4byte gUnknown_8458618
	.4byte gUnknown_8458644
	.4byte gUnknown_8458668
	.4byte gUnknown_84586A0
	.4byte gUnknown_84586D0
	.4byte gUnknown_84586F8
	.4byte gUnknown_8458724

	.align 2
gUnknown_8458778::
	.string "Oh, I see!\n"
	.string "This is educational!\p$"

	.align 2
gUnknown_845879C::
	.string "Don't say anything funny anymore!\n"
	.string "I'm sore from laughing!\p$"

	.align 2
gUnknown_84587D8::
	.string "Oh?\n"
	.string "Something like that happened.\p$"

	.align 2
gUnknown_84587FC::
	.string "Hmhm… What?\n"
	.string "So is this what you're saying?\p$"

	.align 2
gUnknown_8458828::
	.string "Is that right?\n"
	.string "I didn't know that.\p$"

	.align 2
gUnknown_845884C::
	.string "Ahaha!\n"
	.string "What is that about?\p$"

	.align 2
gUnknown_8458868::
	.string "Yes, that's exactly it!\n"
	.string "That's what I meant.\p$"

	.align 2
gUnknown_8458898::
	.string "In other words…\n"
	.string "Yes! That's right!\p$"

	.align 2
gUnknown_84588BC:: @ 84588BC
	.4byte gUnknown_8458778
	.4byte gUnknown_845879C
	.4byte gUnknown_84587D8
	.4byte gUnknown_84587FC
	.4byte gUnknown_8458828
	.4byte gUnknown_845884C
	.4byte gUnknown_8458868
	.4byte gUnknown_8458898

	.align 2
gUnknown_84588DC::
	.string "I'm just showing my TRAINER CARD\n"
	.string "as my way of greeting.\p$"

	.align 2
gUnknown_8458918::
	.string "I hope I get to know you better!\p$"

	.align 2
gUnknown_845893C::
	.string "We're showing each other our\n"
	.string "TRAINER CARDS to get acquainted.\p$"

	.align 2
gUnknown_845897C::
	.string "Glad to meet you.\n"
	.string "Please don't be a stranger!\p$"

	.align 2
gUnknown_84589AC:: @ 84589AC
	.4byte gUnknown_84588DC
	.4byte gUnknown_8458918
	.4byte gUnknown_845893C
	.4byte gUnknown_845897C

	.align 2
gUnknown_84589BC::
	.string "Yeahah!\n"
	.string "I really wanted this POKéMON!\p$"

	.align 2
gUnknown_84589E4::
	.string "Finally, a trade got me that\n"
	.string "POKéMON I'd wanted a long time.\p$"

	.align 2
gUnknown_8458A24::
	.string "I'm trading POKéMON right now.\p$"

	.align 2
gUnknown_8458A44::
	.string "I finally got that POKéMON I\n"
	.string "wanted in a trade!\p$"

	.align 2
gUnknown_8458A78:: @ 8458A78
	.4byte gUnknown_84589BC
	.4byte gUnknown_84589E4
	.4byte NULL
	.4byte NULL
	.4byte gUnknown_8458A24
	.4byte gUnknown_8458A44
	.4byte NULL
	.4byte NULL

gUnknown_8458A98:: @ 8458A98
	.string "{STR_VAR_1} checked the\n"
	.string "TRADING BOARD.\p$"

	.align 2
gUnknown_8458AB8:: @ 8458AB8
	.string "Welcome to the TRADING BOARD.\p"
	.string "You may register your POKéMON\n"
	.string "and offer it up for a trade.\p"
	.string "Would you like to register one of\n"
	.string "your POKéMON?$"

	.align 2
gUnknown_8458B44:: @ 8458B44
	.string "This TRADING BOARD is used for\n"
	.string "offering a POKéMON for a trade.\p"
	.string "All you need to do is register a\n"
	.string "POKéMON for a trade.\p"
	.string "Another TRAINER may offer a party\n"
	.string "POKéMON in return for the trade.\p"
	.string "We hope you will register POKéMON\n"
	.string "and trade them with many, many\l"
	.string "other TRAINERS.\p"
	.string "Would you like to register one of\n"
	.string "your POKéMON?$"

	.align 2
	.string "こうかんけいじばん の とうろくが\n"
	.string "かんりょう しました\p"
	.string "ごりよう ありがとう\n"
	.string "ございました！\p$"

	.align 2
	.string "けいじばんに だれも ポケモンを\n"
	.string "とうろく していません\p\n$"

	.align 2
gUnknown_8458CD4:: @ 8458CD4
	.string "Please choose the type of POKéMON\n"
	.string "that you would like in the trade.\n$"

	.align 2
gUnknown_8458D1C:: @ 8458D1C
	.string "Which of your party POKéMON will\n"
	.string "you offer in trade?\p$"

	.align 2
gUnknown_8458D54:: @ 8458D54
	.string "Registration has been canceled.\p$"

	.align 2
gUnknown_8458D78:: @ 8458D78
	.string "Registration has been completed.\p$"

	.align 2
gUnknown_8458D9C:: @ 8458D9C
	.string "The trade has been canceled.\p$"

	.align 2
gUnknown_8458DBC:: @ 8458DBC
	.string "Cancel the registration of your\n"
	.string "Lv. {STR_VAR_2} {STR_VAR_1}?$"

	.align 2
gUnknown_8458DE8:: @ 8458DE8
	.string "Cancel the registration of your\n"
	.string "EGG?$"

	.align 2
gUnknown_8458E10:: @ 8458E10
	.string "The registration has been canceled.\p$"

	.align 2
	.string "こうかんを きぼうしているひとを\n"
	.string "ひょうじします$"

	.align 2
	.string "こうかん したい トレーナーを\n"
	.string "えらんで ください$"

	.align 2
gUnknown_8458E70:: @ 8458E70
	.string "Would you like to ask {STR_VAR_1} to\n"
	.string "make a trade?$"

	.align 2
	.string "……\n"
	.string "あいての へんじを まっています$"

	.align 2
	.string "あなたが こうかんにだす\n"
	.string "ポケモンが とうろくされていません\p$"

	.align 2
gUnknown_8458ED0:: @ 8458ED0
	.string "You don't have a {STR_VAR_2}-type\n"
	.string "POKéMON that {STR_VAR_1} wants.\p$"

	.align 2
gUnknown_8458F04:: @ 8458F04
	.string "You don't have an EGG that\n"
	.string "{STR_VAR_1} wants.\p$"

	.align 2
gUnknown_8458F2C:: @ 8458F2C
	.string "{STR_VAR_1} can't make a trade for\n"
	.string "your POKéMON right now.\p$"

	.align 2
gUnknown_8458F60:: @ 8458F60
	.string "You can't make a trade for\n"
	.string "{STR_VAR_1}'s POKéMON right now.\p$"

	.align 2
gUnknown_8458F94:: @ 8458F94
	.word gUnknown_8458F2C
	.word gUnknown_8458F60

gUnknown_8458F9C:: @ 8458F9C
	.string "Your trade offer was rejected.\p$"

gUnknown_8458FBC:: @ 8458FBC
	.string "EGG TRADE$"

	.align 2
gUnknown_8458FC8:: @ 8458FC8
	.string "{DPAD_UPDOWN}CHOOSE  {A_BUTTON}JOIN  {B_BUTTON}CANCEL$"

	.align 2
gUnknown_8458FE4:: @ 8458FE4
	.string "Please choose a TRAINER.$"

	.align 2
gUnknown_8459000::
	.string "Please choose a TRAINER for\n"
	.string "a SINGLE BATTLE.$"

	.align 2
gUnknown_8459030::
	.string "Please choose a TRAINER for\n"
	.string "a DOUBLE BATTLE.$"

	.align 2
gUnknown_8459060::
	.string "Please choose the LEADER\n"
	.string "for a MULTI BATTLE.$"

	.align 2
gUnknown_8459090::
	.string "Please choose the TRAINER to\n"
	.string "trade with.$"

	.align 2
gUnknown_84590BC::
	.string "Please choose the TRAINER who is\n"
	.string "sharing WONDER CARDS.$"

	.align 2
gUnknown_84590F4::
	.string "Please choose the TRAINER who is\n"
	.string "sharing WONDER NEWS.$"

	.align 2
gUnknown_845912C::
	.string "Jump with mini POKéMON!\n"
	.string "Please choose the LEADER.$"

	.align 2
gUnknown_8459160::
	.string "BERRY CRUSH!\n"
	.string "Please choose the LEADER.$"

	.align 2
gUnknown_8459188::
	.string "DODRIO BERRY-PICKING!\n"
	.string "Please choose the LEADER.$"

	.align 2
gUnknown_84591B8:: @ 84591B8
	.4byte gUnknown_8459000
	.4byte gUnknown_8459030
	.4byte gUnknown_8459060
	.4byte gUnknown_8459090
	.4byte gUnknown_845912C
	.4byte gUnknown_8459160
	.4byte gUnknown_8459188
	.4byte gUnknown_84590BC
	.4byte gUnknown_84590F4

	.align 2
gUnknown_84591DC:: @ 84591DC
	.string "Searching for a WIRELESS\n"
	.string "COMMUNICATION SYSTEM. Wait...$"

	.align 2
	.string "ダブルバトルでは 2ひき いじょうの\n"
	.string "ポケモンが ひつようです\p$"

	.align 2
gUnknown_8459238:: @ 8459238
	.string "Awaiting {STR_VAR_1}'s response…$"

	.align 2
gUnknown_8459250:: @ 8459250
	.string "{STR_VAR_1} has been asked to register\n"
	.string "you as a member. Please wait.$"

	.align 2
gUnknown_845928C:: @ 845928C
	.string "Awaiting a response from the\n"
	.string "WIRELESS COMMUNICATION SYSTEM.$"
	
	.align 2
	.string "ほかの さんかしゃが そろうまで\n"
	.string "しょうしょう おまちください$"

	.align 2
gUnknown_84592E8:: @ 84592E8
	.string "No CARDS appear to be shared \n"
	.string "right now.$"

	.align 2
gUnknown_8459314:: @ 8459314
	.string "No NEWS appears to be shared\n"
	.string "right now.$"

gUnknown_845933C:: @ 845933C
	.word gUnknown_84592E8
	.word gUnknown_8459314

	.align 2
gUnknown_8459344:: @ 8459344
	.string "BATTLE$"

	.align 2
gUnknown_845934C:: @ 845934C
	.string "CHAT$"

	.align 2
gUnknown_8459354:: @ 8459354
	.string "GREETINGS$"

	.align 2
gUnknown_8459360:: @ 8459360
	.string "EXIT$"

	.align 2
gUnknown_8459368:: @ 8459368
	.string "EXIT$"

	.align 2
gUnknown_8459370:: @ 8459370
	.string "INFO$"

	.align 2
gUnknown_8459378:: @ 8459378
	.string "NAME{CLEAR_TO 0x3C}WANTED{CLEAR_TO 0x6E}OFFER{CLEAR_TO 0xC6}LV.$"

	.align 2
gUnknown_8459394:: @ 8459394
	.string "SINGLE BATTLE$"

	.align 2
gUnknown_84593A4:: @ 84593A4
	.string "DOUBLE BATTLE$"

	.align 2
gUnknown_84593B4:: @ 84593B4
	.string "MULTI BATTLE$"

	.align 2
gUnknown_84593C4:: @ 84593C4
	.string "POKéMON TRADES$"

	.align 2
gUnknown_84593D4:: @ 84593D4
	.string "CHAT$"

	.align 2
gUnknown_84593DC:: @ 84593DC
	.string "CARDS$"

	.align 2
gUnknown_84593E4:: @ 84593E4
	.string "WONDER CARDS$"

	.align 2
gUnknown_84593F4:: @ 84593F4
	.string "WONDER NEWS$"

	.align 2
gUnknown_8459400:: @ 8459400
	.string "POKéMON JUMP$"

	.align 2
gUnknown_8459410:: @ 8459410
	.string "BERRY CRUSH$"

	.align 2
gUnknown_845941C:: @ 845941C
	.string "BERRY-PICKING$"

	.align 2
gUnknown_845942C:: @ 845942C
	.string "SEARCH$"

	.align 2
gUnknown_8459434:: @ 8459434
	.string "ぐるぐるこうかん$"

	.align 2
gUnknown_8459440:: @ 8459440
	.string "アイテムトレード$"

	.align 2
gUnknown_845944C:: @ 845944C
	.string "It's a NORMAL CARD.$"

	.align 2
gUnknown_8459460:: @ 459460
	.string "It's a BRONZE CARD!$"

	.align 2
gUnknown_8459474:: @ 8459474
	.string "It's a COPPER CARD!$"

	.align 2
gUnknown_8459488:: @ 8459488
	.string "It's a SILVER CARD!$"

	.align 2
gUnknown_845949C:: @ 845949C
	.string "It's a GOLD CARD!$"

	.align 2
gUnknown_84594B0:: @ 84594B0
	.word gUnknown_845944C
	.word gUnknown_8459460
	.word gUnknown_8459474
	.word gUnknown_8459488
	.word gUnknown_845949C

	.align 2
gUnknown_84594C4:: @ 84594C4
	.string "This is {SPECIAL_F7 0x00} {SPECIAL_F7 0x01}'s\nTRAINER CARD…\l{SPECIAL_F7 0x02}\pPOKéDEX: {SPECIAL_F7 0x03}\nTIME:    {SPECIAL_F7 0x04}:{SPECIAL_F7 0x05}\p$"

	.align 2
gUnknown_8459504:: @ 8459504
	.string "BATTLES: {SPECIAL_F7 0x00} WINS  {SPECIAL_F7 0x02} LOSSES\nTRADES:  {SPECIAL_F7 0x03} TIMES\p“{SPECIAL_F7 0x04} {SPECIAL_F7 0x05}\n{SPECIAL_F7 0x06} {SPECIAL_F7 0x07}”\p$"

	.align 2
gUnknown_8459544:: @ 8459544
	.string "{SPECIAL_F7 0x01}: Glad to have met you!{PAUSE 60}$"

	.align 2
gUnknown_8459564:: @ 8459564
	.string "{SPECIAL_F7 0x01}: Glad to meet you!{PAUSE 60}$"

	.align 2
gUnknown_8459580:: @ 8459580
	.word gUnknown_8459544
	.word gUnknown_8459564

	.align 2
gUnknown_8459588:: @ 8459588
	.string "Finished checking {SPECIAL_F7 0x01}'s\nTRAINER CARD.{PAUSE 60}$"

	.align 2
gUnknown_84595B0::
	.string "Canceled reading the Card.$"

	.align 2
gUnknown_84595CC::
	.4byte 0x02, 0x15 @ RECEIVE ID(0x15)
	.4byte 0x0c, 0x00 @ READ PACKET AND COMPUTER SOMETHING
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x0e @ RETURN 0x0e

gMEventSrvScript_OtherTrainerCanceled:: @ 84595EC @ referenced in mevent/script_common.inc
	.4byte 0x12, 0x20, gUnknown_84595CC @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x14, 0x1b, gUnknown_84595B0 @ SEND_STR
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x09, NULL @ RETURN (other trainer canceled)
