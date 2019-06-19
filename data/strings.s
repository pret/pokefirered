	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata
	.align 2
gExpandedPlaceholder_Empty:: @ 8415A20
	.incbin "baserom.gba", 0x415A20, 0x1

gExpandedPlaceholder_Kun:: @ 8415A21
	.incbin "baserom.gba", 0x415A21, 0x1

gExpandedPlaceholder_Chan:: @ 8415A22
	.incbin "baserom.gba", 0x415A22, 0xA

gExpandedPlaceholder_Ruby:: @ 8415A2C
	.incbin "baserom.gba", 0x415A2C, 0x5

gExpandedPlaceholder_Aqua:: @ 8415A31
	.incbin "baserom.gba", 0x415A31, 0x5

gExpandedPlaceholder_Magma:: @ 8415A36
	.incbin "baserom.gba", 0x415A36, 0x6

gExpandedPlaceholder_Archie:: @ 8415A3C
	.incbin "baserom.gba", 0x415A3C, 0x7

gExpandedPlaceholder_Maxie:: @ 8415A43
	.incbin "baserom.gba", 0x415A43, 0x6

gExpandedPlaceholder_Kyogre:: @ 8415A49
	.incbin "baserom.gba", 0x415A49, 0x7

gExpandedPlaceholder_Groudon:: @ 8415A50
	.incbin "baserom.gba", 0x415A50, 0x8

gExpandedPlaceholder_Red:: @ 8415A58
	.incbin "baserom.gba", 0x415A58, 0x4

gExpandedPlaceholder_Green:: @ 8415A5C
	.incbin "baserom.gba", 0x415A5C, 0x6

gText_EggNickname:: @ 8415A62
	.incbin "baserom.gba", 0x415A62, 0x4

gText_Pokemon:: @ 8415A66
	.incbin "baserom.gba", 0x415A66, 0x8

gUnknown_8415A6E:: @ 8415A6E
	.incbin "baserom.gba", 0x415A6E, 0x9

gUnknown_8415A77:: @ 8415A77
	.incbin "baserom.gba", 0x415A77, 0x20

gUnknown_8415A97:: @ 8415A97
	.incbin "baserom.gba", 0x415A97, 0xD

gUnknown_8415AA4:: @ 8415AA4
	.incbin "baserom.gba", 0x415AA4, 0x27

gUnknown_8415ACB:: @ 8415ACB
	.incbin "baserom.gba", 0x415ACB, 0x134

gUnknown_8415BFF:: @ 8415BFF
	.incbin "baserom.gba", 0x415BFF, 0x43

gUnknown_8415C42:: @ 8415C42
	.incbin "baserom.gba", 0x415C42, 0x22

gUnknown_8415C64:: @ 8415C64
	.incbin "baserom.gba", 0x415C64, 0x84

gUnknown_8415CE8:: @ 8415CE8
	.incbin "baserom.gba", 0x415CE8, 0x44

gText_Controls:: @ 8415D2C
	.string "CONTROLS$"

	.align 2
gUnknown_8415D38:: @ 8415D2C
	.string "{KEYGFX_DPAD_UP_DOWN}えらぶ {KEYGFX_A_BUTTON}けってい$"

	.align 2
gText_ABUTTONNext:: @ 8415D48
	.string "{KEYGFX_A_BUTTON}NEXT$"

	.align 2
gText_ABUTTONNext_BBUTTONBack:: @ 8415D50
	.string "{KEYGFX_A_BUTTON}NEXT {KEYGFX_B_BUTTON}BACK$"

	.align 2
gText_UPDOWNPick_ABUTTONNext_BBUTTONBack:: @ 8415D60
	.string "{KEYGFX_DPAD_UP_DOWN}PICK {KEYGFX_A_BUTTON}NEXT {KEYGFX_B_BUTTON}CANCEL$"

	.align 2
gText_UPDOWNPick_ABUTTONBBUTTONCancel:: @ 8415D78
	.string "{KEYGFX_DPAD_UP_DOWN}PICK {KEYGFX_A_BUTTON}{KEYGFX_B_BUTTON}CANCEL$"

	.align 2
gText_ABUTTONExit:: @ 8415D8C
	.string "{KEYGFX_A_BUTTON}EXIT$"

gText_Boy:: @ 8415D93
	.string "BOY$"

gText_Girl:: @ 8415D97
	.string "GIRL$"

gUnknown_8415D9C:: @ 8415D9C
	.incbin "baserom.gba", 0x415D9C, 0x1C

gUnknown_8415DB8:: @ 8415DB8
	.incbin "baserom.gba", 0x415DB8, 0xC

gUnknown_8415DC4:: @ 8415DC4
	.incbin "baserom.gba", 0x415DC4, 0x6

gUnknown_8415DCA:: @ 8415DCA
	.incbin "baserom.gba", 0x415DCA, 0x7

gUnknown_8415DD1:: @ 8415DD1
	.incbin "baserom.gba", 0x415DD1, 0x6

gUnknown_8415DD7:: @ 8415DD7
	.incbin "baserom.gba", 0x415DD7, 0x166

gUnknown_8415F3D:: @ 8415F3D
	.incbin "baserom.gba", 0x415F3D, 0xD

gUnknown_8415F4A:: @ 8415F4A
	.incbin "baserom.gba", 0x415F4A, 0x7

gText_PickOKExit:: @ 8415F51
	.incbin "baserom.gba", 0x415F51, 0x15

gUnknown_8415F66:: @ 8415F66
	.incbin "baserom.gba", 0x415F66, 0x6

gUnknown_8415F6C:: @ 8415F6C
	.incbin "baserom.gba", 0x415F6C, 0x23

gUnknown_8415F8F:: @ 8415F8F
	.incbin "baserom.gba", 0x415F8F, 0x9

gUnknown_8415F98:: @ 8415F98
	.incbin "baserom.gba", 0x415F98, 0x3

gUnknown_8415F9B:: @ 8415F9B
	.incbin "baserom.gba", 0x415F9B, 0x5

gUnknown_8415FA0:: @ 8415FA0
	.incbin "baserom.gba", 0x415FA0, 0xD

gUnknown_8415FAD:: @ 8415FAD
	.incbin "baserom.gba", 0x415FAD, 0x6

gUnknown_8415FB3:: @ 8415FB3
	.incbin "baserom.gba", 0x415FB3, 0x15

gUnknown_8415FC8:: @ 8415FC8
	.incbin "baserom.gba", 0x415FC8, 0x7

gUnknown_8415FCF:: @ 8415FCF
	.incbin "baserom.gba", 0x415FCF, 0x19

gUnknown_8415FE8:: @ 8415FE8
	.incbin "baserom.gba", 0x415FE8, 0x5

gUnknown_8415FED:: @ 8415FED
	.incbin "baserom.gba", 0x415FED, 0x5

gUnknown_8415FF2:: @ 8415FF2
	.incbin "baserom.gba", 0x415FF2, 0xD

gUnknown_8415FFF:: @ 8415FFF
	.incbin "baserom.gba", 0x415FFF, 0x3

gUnknown_8416002:: @ 8416002
	.incbin "baserom.gba", 0x416002, 0x6

gUnknown_8416008:: @ 8416008
	.incbin "baserom.gba", 0x416008, 0x88

gUnknown_8416090:: @ 8416090
	.incbin "baserom.gba", 0x416090, 0x24

gUnknown_84160B4:: @ 84160B4
	.incbin "baserom.gba", 0x4160B4, 0x14

gUnknown_84160C8:: @ 84160C8
	.incbin "baserom.gba", 0x4160C8, 0x24

gUnknown_84160EC:: @ 84160EC
	.incbin "baserom.gba", 0x4160EC, 0x8

gUnknown_84160F4:: @ 84160F4
	.incbin "baserom.gba", 0x4160F4, 0x8

gUnknown_84160FC:: @ 84160FC
	.incbin "baserom.gba", 0x4160FC, 0x8

gUnknown_8416104:: @ 8416104
	.incbin "baserom.gba", 0x416104, 0x47

gUnknown_841614B:: @ 841614B
	.incbin "baserom.gba", 0x41614B, 0x2F

gUnknown_841617A:: @ 841617A
	.incbin "baserom.gba", 0x41617A, 0x7

gUnknown_8416181:: @ 8416181
	.incbin "baserom.gba", 0x416181, 0x7

gUnknown_8416188:: @ 8416188
	.incbin "baserom.gba", 0x416188, 0x8

gUnknown_8416190:: @ 8416190
	.string "TIME$"

gUnknown_8416195::
	.string "どこへ とびますか?$"

gOtherText_Use::
	.string "USE$"

gUnknown_84161A4::
	.string "TOSS$"

gUnknown_84161A9::
	.string "REGISTER$"

gOtherText_Give::
	.string "GIVE$"

gUnknown_84161B7::
	.string "けってい$"

gUnknown_84161BC::
	.string "WALK$"

gFameCheckerText_Cancel:: @ 84161C1
	.string "CANCEL$"

gOtherText_Exit:: @ 84161C8
	.string "EXIT$"

gUnknown_84161CD:: @ 84161CD
	.string "$"

gUnknown_84161CE::
	.string "キャンセル$"

gUnknown_84161D4::
	.string "ITEM$"

gUnknown_84161D9::
	.string "MAIL$"

gUnknown_84161DE::
	.string "TAKE$"

gUnknown_84161E3::
	.string "STORE$"

gUnknown_84161E9::
	.string "CHECK$"

gUnknown_84161EF:: @ 84161EF
	.string "NONE$"

gUnknown_84161F4::
	.string "OPEN$"

gUnknown_84161F9::
	.string "DESELECT$"

gUnknown_8416202:: @ 8416202
	.string "???$"

gUnknown_8416206::
	.string "?????$"

gUnknown_841620C:: @ 841620C
	.string "/$"

gUnknown_841620E:: @ 841620E
	.string "-$"

gUnknown_8416210:: @ 8416210
	.string "--$"

gText_ThreeHyphens:: @ 8416213
	.string "---$"

gUnknown_8416217:: @ 8416217
	.string "-------$"

gUnknown_841621F:: @ 841621F
	.string "♂$"

gUnknown_8416221:: @ 8416221
	.string "♀$"

gText_Lv:: @ 8416223
	.string "{EXTRA_LV}$"

gOtherText_UnkF9_08_Clear_01:: @ 8416226
	.string "{EXTRA_NO}{CLEAR 0x01}$"

gUnknown_841622C::
	.string "{EXTRA_PLUS}$"

gUnknown_841622F::
	.string "{ESCAPE 0x03}$"

gUnknown_8416233::
	.string "{EXTRA_ID}{EXTRA_NO}$"

gUnknown_8416238:: @ 8416238
	.string "{EXTRA_PP}$"

gFameCheckerText_ListMenuCursor:: @ 841623B
	.string "▶$"

gUnknown_841623D:: @ 841623D
	.string "YES\n"
	.string "NO$"

gUnknown_8416244::
	.string "Go back to the\n"
	.string "previous menu.$"

gUnknown_8416262:: @ 8416262
	.string "What would you like to do?$"

gUnknown_841627D::
	.string "POKéDEX$"

gUnknown_8416285:: @ 8416285
	.string "BAG$"

gUnknown_8416289::
	.string "ポケナビ$"

gUnknown_841628E::
	.string "{PLAYER}$"

gUnknown_8416291::
	.string "SAVE$"

gUnknown_8416296::
	.string "OPTION$"

gUnknown_841629D::
	.string "EXIT$"

gUnknown_84162A2::
	.string "RETIRE$"

gUnknown_84162A9:: @ 84162A9
	.string "{STR_VAR_1}/{STR_VAR_2}\n"
	.string "BALLS  {STR_VAR_3}$"

gText_TimesStrVar1:: @ 84162B9
	.string "×{STR_VAR_1}$"

gUnknown_84162BD:: @ 84162BD
	.string " BERRY$"

gText_Coins:: @ 84162C4
	.incbin "baserom.gba", 0x4162C4, 0x24

gText_DepositItem:: @ 84162E8
	.string "DEPOSIT ITEM$"

gUnknown_84162F5:: @ 84162F5
	.incbin "baserom.gba", 0x4162F5, 0xA

gOtherText_StrVar1:: @ 84162FF
	.string "{STR_VAR_1}"

gText_IsSelected:: @ 8416301
	.string " is\n"
	.string "selected.$"

gUnknown_841630F:: @ 841630F
	.incbin "baserom.gba", 0x41630F, 0x1B

gText_ThereIsNoPokemon:: @ 841632A
	.string "There is no\n"
	.string "POKéMON.$"

gOtherText_WhereShouldTheStrVar1BePlaced:: @ 841633F
	.string "Where should the {STR_VAR_1}\n"
	.string "be placed?$"

gText_ItemCantBeHeld:: @ 841635E
	.string "The {STR_VAR_1} can't be held.$"

gUnknown_8416374:: @ 8416374
	.incbin "baserom.gba", 0x416374, 0x1B

gUnknown_841638F:: @ 841638F
	.incbin "baserom.gba", 0x41638F, 0x18

gUnknown_84163A7:: @ 84163A7
	.incbin "baserom.gba", 0x4163A7, 0x14

gUnknown_84163BB:: @ 84163BB
	.incbin "baserom.gba", 0x4163BB, 0x20

gUnknown_84163DB:: @ 84163DB
	.incbin "baserom.gba", 0x4163DB, 0x19

gUnknown_84163F4:: @ 84163F4
	.incbin "baserom.gba", 0x4163F4, 0x15

gUnknown_8416409:: @ 8416409
	.incbin "baserom.gba", 0x416409, 0x1C

gUnknown_8416425:: @ 8416425
	.incbin "baserom.gba", 0x416425, 0x2C

gUnknown_8416451:: @ 8416451
	.incbin "baserom.gba", 0x416451, 0x25

gUnknown_8416476:: @ 8416476
	.incbin "baserom.gba", 0x416476, 0x48

gUnknown_84164BE:: @ 84164BE
	.incbin "baserom.gba", 0x4164BE, 0x55

gUnknown_8416513:: @ 8416513
	.incbin "baserom.gba", 0x416513, 0x24

gUnknown_8416537:: @ 8416537
	.incbin "baserom.gba", 0x416537, 0x55

gUnknown_841658C:: @ 841658C
	.incbin "baserom.gba", 0x41658C, 0x12

gUnknown_841659E:: @ 841659E
	.incbin "baserom.gba", 0x41659E, 0x34

gUnknown_84165D2:: @ 84165D2
	.incbin "baserom.gba", 0x4165D2, 0x2E

gUnknown_8416600:: @ 8416600
	.incbin "baserom.gba", 0x416600, 0x31

gUnknown_8416631:: @ 8416631
	.incbin "baserom.gba", 0x416631, 0x13

gUnknown_8416644:: @ 8416644
	.incbin "baserom.gba", 0x416644, 0x11

gOtherText_Powder:: @ 8416655
	.string "POWDER$"

gUnknown_841665C:: @ 841665C
	.string "Played the POKé FLUTE.\p"
	.string "Now, that's a catchy tune!{PAUSE_UNTIL_PRESS}$"

gUnknown_8416690:: @ 8416690
	.string "Played the POKé FLUTE.$"

gUnknown_84166A7:: @ 84166A7
	.string "The POKé FLUTE awakened sleeping\n"
	.string "POKéMON.{PAUSE_UNTIL_PRESS}$"

gText_TMCase:: @ 84166D3
	.string "TM CASE$"

gText_Close:: @ 84166DB
	.string "CLOSE$"

gText_TMCaseWillBePutAway:: @ 84166E1
	.string "The TM CASE will be\n"
	.string "put away.$"

gText_FontSize0:: @ 84166FF
	.string "{SIZE 0}$"

gText_FontSize2:: @ 8416703
	.string "{SIZE 2}$"

gUnknown_8416707:: @ 8416707
	.string "  $"

gUnknown_841670A:: @ 841670A
	.incbin "baserom.gba", 0x41670A, 0xC

gUnknown_8416716:: @ 8416716
	.incbin "baserom.gba", 0x416716, 0x33

gUnknown_8416749:: @ 8416749
	.incbin "baserom.gba", 0x416749, 0xE

gUnknown_8416757:: @ 8416757
	.incbin "baserom.gba", 0x416757, 0xF

gUnknown_8416766:: @ 8416766
	.incbin "baserom.gba", 0x416766, 0x28

gUnknown_841678E:: @ 841678E
	.incbin "baserom.gba", 0x41678E, 0x59

gUnknown_84167E7:: @ 84167E7
	.incbin "baserom.gba", 0x4167E7, 0x5B

gUnknown_8416842:: @ 8416842
	.incbin "baserom.gba", 0x416842, 0x1F

gUnknown_8416861:: @ 8416861
	.incbin "baserom.gba", 0x416861, 0x3D

gUnknown_841689E:: @ 841689E
	.incbin "baserom.gba", 0x41689E, 0x53

gText_OhNoICantBuyThat:: @ 84168F1
	.string "{STR_VAR_1}? Oh, no.\n"
	.string "I can't buy that.{PAUSE_UNTIL_PRESS}$"

gText_HowManyWouldYouLikeToSell:: @ 8416911
	.string "{STR_VAR_1}?\n"
	.string "How many would you like to sell?$"

gText_ICanPayThisMuch_WouldThatBeOkay:: @ 8416936
	.string "I can pay ¥{STR_VAR_3}.\n"
	.string "Would that be okay?$"

gText_TurnedOverItemsWorthYen:: @ 8416959
	.incbin "baserom.gba", 0x416959, 0x21

gText_PokedollarVar1:: @ 841697A
	.incbin "baserom.gba", 0x41697A, 0x48

gUnknown_84169C2:: @ 84169C2
	.incbin "baserom.gba", 0x4169C2, 0x3

gUnknown_84169C5:: @ 84169C5
	.incbin "baserom.gba", 0x4169C5, 0x8

gUnknown_84169CD:: @ 84169CD
	.incbin "baserom.gba", 0x4169CD, 0x8

gUnknown_84169D5:: @ 84169D5
	.incbin "baserom.gba", 0x4169D5, 0x4

gUnknown_84169D9:: @ 84169D9
	.incbin "baserom.gba", 0x4169D9, 0x3

gUnknown_84169DC:: @ 84169DC
	.incbin "baserom.gba", 0x4169DC, 0x1C

gUnknown_84169F8:: @ 84169F8
	.string "This can't be used on\n"
	.string "that POKéMON.{PAUSE_UNTIL_PRESS}$"

gUnknown_8416A1E:: @ 8416A1E
	.incbin "baserom.gba", 0x416A1E, 0x1C

gUnknown_8416A3A:: @ 8416A3A
	.incbin "baserom.gba", 0x416A3A, 0x1B

gUnknown_8416A55:: @ 8416A55
	.incbin "baserom.gba", 0x416A55, 0x20

gUnknown_8416A75:: @ 8416A75
	.incbin "baserom.gba", 0x416A75, 0x23

gUnknown_8416A98:: @ 8416A98
	.incbin "baserom.gba", 0x416A98, 0x33

gUnknown_8416ACB:: @ 8416ACB
	.incbin "baserom.gba", 0x416ACB, 0x17

gUnknown_8416AE2:: @ 8416AE2
	.incbin "baserom.gba", 0x416AE2, 0x34

gUnknown_8416B16:: @ 8416B16
	.incbin "baserom.gba", 0x416B16, 0x28

gUnknown_8416B3E:: @ 8416B3E
	.incbin "baserom.gba", 0x416B3E, 0x26

gUnknown_8416B64:: @ 8416B64
	.incbin "baserom.gba", 0x416B64, 0x22

gUnknown_8416B86:: @ 8416B86
	.incbin "baserom.gba", 0x416B86, 0x20

gUnknown_8416BA6:: @ 8416BA6
	.incbin "baserom.gba", 0x416BA6, 0x1D

gUnknown_8416BC3:: @ 8416BC3
	.incbin "baserom.gba", 0x416BC3, 0x38

gUnknown_8416BFB:: @ 8416BFB
	.incbin "baserom.gba", 0x416BFB, 0x2F

gUnknown_8416C2A:: @ 8416C2A
	.incbin "baserom.gba", 0x416C2A, 0x1F

gUnknown_8416C49:: @ 8416C49
	.incbin "baserom.gba", 0x416C49, 0x46

gUnknown_8416C8F:: @ 8416C8F
	.incbin "baserom.gba", 0x416C8F, 0x1D

gUnknown_8416CAC:: @ 8416CAC
	.incbin "baserom.gba", 0x416CAC, 0x1B

gUnknown_8416CC7:: @ 8416CC7
	.incbin "baserom.gba", 0x416CC7, 0x23

gUnknown_8416CEA:: @ 8416CEA
	.incbin "baserom.gba", 0x416CEA, 0x2D

gUnknown_8416D17:: @ 8416D17
	.incbin "baserom.gba", 0x416D17, 0x38

gUnknown_8416D4F:: @ 8416D4F
	.incbin "baserom.gba", 0x416D4F, 0x29

gUnknown_8416D78:: @ 8416D78
	.incbin "baserom.gba", 0x416D78, 0x3B

gUnknown_8416DB3:: @ 8416DB3
	.incbin "baserom.gba", 0x416DB3, 0xF

gUnknown_8416DC2:: @ 8416DC2
	.incbin "baserom.gba", 0x416DC2, 0x35

gUnknown_8416DF7:: @ 8416DF7
	.incbin "baserom.gba", 0x416DF7, 0x74

gUnknown_8416E6B:: @ 8416E6B
	.incbin "baserom.gba", 0x416E6B, 0x19

gUnknown_8416E84:: @ 8416E84
	.incbin "baserom.gba", 0x416E84, 0x20

gUnknown_8416EA4:: @ 8416EA4
	.incbin "baserom.gba", 0x416EA4, 0x22

gUnknown_8416EC6:: @ 8416EC6
	.incbin "baserom.gba", 0x416EC6, 0x4A

gUnknown_8416F10:: @ 8416F10
	.incbin "baserom.gba", 0x416F10, 0x17

gUnknown_8416F27:: @ 8416F27
	.string "{STR_VAR_1}'s HP was restored\n"
	.string "by {STR_VAR_2} point(s).{PAUSE_UNTIL_PRESS}$"

gUnknown_8416F4E:: @ 8416F4E
	.incbin "baserom.gba", 0x416F4E, 0x21

gUnknown_8416F6F:: @ 8416F6F
	.incbin "baserom.gba", 0x416F6F, 0x1D

gUnknown_8416F8C:: @ 8416F8C
	.incbin "baserom.gba", 0x416F8C, 0xE

gUnknown_8416F9A:: @ 8416F9A
	.incbin "baserom.gba", 0x416F9A, 0x18

gUnknown_8416FB2:: @ 8416FB2
	.incbin "baserom.gba", 0x416FB2, 0x15

gUnknown_8416FC7:: @ 8416FC7
	.incbin "baserom.gba", 0x416FC7, 0x26

gUnknown_8416FED:: @ 8416FED
	.incbin "baserom.gba", 0x416FED, 0x15

gUnknown_8417002:: @ 8417002
	.incbin "baserom.gba", 0x417002, 0x15

gUnknown_8417017:: @ 8417017
	.incbin "baserom.gba", 0x417017, 0x1B

gUnknown_8417032:: @ 8417032
	.incbin "baserom.gba", 0x417032, 0x20

gUnknown_8417052:: @ 8417052
	.incbin "baserom.gba", 0x417052, 0x23

gUnknown_8417075:: @ 8417075
	.incbin "baserom.gba", 0x417075, 0x47

gUnknown_84170BC:: @ 84170BC
	.incbin "baserom.gba", 0x4170BC, 0x24

gUnknown_84170E0:: @ 84170E0
	.incbin "baserom.gba", 0x4170E0, 0x377

gUnknown_8417457:: @ 8417457
	.incbin "baserom.gba", 0x417457, 0x3D

gUnknown_8417494:: @ 8417494
	.incbin "baserom.gba", 0x417494, 0x181

gUnknown_8417615:: @ 8417615
	.incbin "baserom.gba", 0x417615, 0x2B

gUnknown_8417640:: @ 8417640
	.incbin "baserom.gba", 0x417640, 0x34

gUnknown_8417674:: @ 8417674
	.incbin "baserom.gba", 0x417674, 0x7

gUnknown_841767B:: @ 841767B
	.incbin "baserom.gba", 0x41767B, 0x12

gUnknown_841768D:: @ 841768D
	.incbin "baserom.gba", 0x41768D, 0x9

gUnknown_8417696:: @ 8417696
	.incbin "baserom.gba", 0x417696, 0x22

gUnknown_84176B8:: @ 84176B8
	.incbin "baserom.gba", 0x4176B8, 0x17

gUnknown_84176CF:: @ 84176CF
	.incbin "baserom.gba", 0x4176CF, 0x2F

gUnknown_84176FE:: @ 84176FE
	.incbin "baserom.gba", 0x4176FE, 0x76

gUnknown_8417774:: @ 8417774
	.incbin "baserom.gba", 0x417774, 0x16

gText_NoMoreRoomInBag:: @ 841778A
	.string "There is no more\n"
	.string "room in the BAG.$"

gText_WithdrawHowMany:: @ 84177AC
	.string "Withdraw how many\n"
	.string "{STR_VAR_1}(s)?$"

gText_WithdrewQuantItem:: @ 84177C5
	.string "Withdrew {STR_VAR_2}\n"
	.string "{STR_VAR_1}(s).$"

gOtherText_Read::
	.string "READ$"

gOtherText_MoveToBag::
	.string "MOVE TO BAG$"

gOtherText_Give2::
	.string "GIVE$"

gUnknown_84177EE:: @ 84177EE
	.incbin "baserom.gba", 0x4177EE, 0x18

gUnknown_8417806:: @ 8417806
	.incbin "baserom.gba", 0x417806, 0x2A

gUnknown_8417830:: @ 8417830
	.incbin "baserom.gba", 0x417830, 0x28

gUnknown_8417858:: @ 8417858
	.incbin "baserom.gba", 0x417858, 0x13

gUnknown_841786B:: @ 841786B
	.incbin "baserom.gba", 0x41786B, 0x3C

gText_WithdrawItem:: @ 84178A7
	.string "WITHDRAW\n"
	.string "ITEM$"

gText_Withdraw::
	.string "WITHDRAW$"

gText_ReturnToPC:: @ 84178BE
	.string "Return to the PC.$"

gUnknown_84178D0:: @ 84178D0
	.incbin "baserom.gba", 0x4178D0, 0xA

gUnknown_84178DA:: @ 84178DA
	.incbin "baserom.gba", 0x4178DA, 0x5E

gUnknown_8417938:: @ 8417938
	.incbin "baserom.gba", 0x417938, 0x4

gUnknown_841793C:: @ 841793C
	.incbin "baserom.gba", 0x41793C, 0x263

gUnknown_8417B9F:: @ 8417B9F
	.incbin "baserom.gba", 0x417B9F, 0xD

gUnknown_8417BAC:: @ 8417BAC
	.incbin "baserom.gba", 0x417BAC, 0xA

gUnknown_8417BB6:: @ 8417BB6
	.incbin "baserom.gba", 0x417BB6, 0x8

gUnknown_8417BBE:: @ 8417BBE
	.incbin "baserom.gba", 0x417BBE, 0xD

gUnknown_8417BCB:: @ 8417BCB
	.incbin "baserom.gba", 0x417BCB, 0x8

gUnknown_8417BD3:: @ 8417BD3
	.incbin "baserom.gba", 0x417BD3, 0x5A

gUnknown_8417C2D:: @ 8417C2D
	.incbin "baserom.gba", 0x417C2D, 0x1C0

gUnknown_8417DED:: @ 8417DED
	.incbin "baserom.gba", 0x417DED, 0x1CC

gUnknown_8417FB9:: @ 8417FB9
	.incbin "baserom.gba", 0x417FB9, 0x2

gUnknown_8417FBB:: @ 8417FBB
	.incbin "baserom.gba", 0x417FBB, 0x8

gUnknown_8417FC3:: @ 8417FC3
	.incbin "baserom.gba", 0x417FC3, 0x9

gUnknown_8417FCC:: @ 8417FCC
	.incbin "baserom.gba", 0x417FCC, 0x4

gUnknown_8417FD0:: @ 8417FD0
	.incbin "baserom.gba", 0x417FD0, 0xA5

gUnknown_8418075:: @ 8418075
	.incbin "baserom.gba", 0x418075, 0xFF

gUnknown_8418174:: @ 8418174
	.incbin "baserom.gba", 0x418174, 0x14

gUnknown_8418188:: @ 8418188
	.incbin "baserom.gba", 0x418188, 0x1C

gUnknown_84181A4:: @ 84181A4
	.incbin "baserom.gba", 0x4181A4, 0x12

gUnknown_84181B6:: @ 84181B6
	.incbin "baserom.gba", 0x4181B6, 0x8

gUnknown_84181BE:: @ 84181BE
	.incbin "baserom.gba", 0x4181BE, 0x5

gFameCheckerText_FameCheckerWillBeClosed:: @ 84181C3
	.string "The FAME CHECKER will be closed.$"

gFameCheckerText_ClearTextbox:: @ 84181E4
	.string "\n"
	.string "                              $"

gUnknown_8418204:: @ 8418204
	.incbin "baserom.gba", 0x00418204, 0x48c

gUnknown_8418690:: @ 8418690
	.incbin "baserom.gba", 0x418690, 0x20

gUnknown_84186B0:: @ 84186B0
	.incbin "baserom.gba", 0x4186B0, 0x1D

gUnknown_84186CD:: @ 84186CD
	.incbin "baserom.gba", 0x4186CD, 0x26A

gUnknown_8418937:: @ 8418937
	.incbin "baserom.gba", 0x418937, 0x1F

gUnknown_8418956:: @ 8418956
	.incbin "baserom.gba", 0x418956, 0x8A

gUnknown_84189E0:: @ 84189E0
	.incbin "baserom.gba", 0x4189E0, 0xE

gUnknown_84189EE:: @ 84189EE
	.incbin "baserom.gba", 0x4189EE, 0x22D

gUnknown_8418C1B:: @ 8418C1B
	.string "POKéMON CENTER$"

gUnknown_8418C2A:: @ 8418C2A
	.incbin "baserom.gba", 0x418C2A, 0x59

gUnknown_8418C83:: @ 8418C83
	.incbin "baserom.gba", 0x418C83, 0x56

gUnknown_8418CD9:: @ 8418CD9
	.string "The backup memory is damaged or\n"
	.string "the game's battery has run dry.\n"
	.string "The game can be played, but its\n"
	.string "progress cannot be saved.\n"
	.string "“Please press the A Button.”$"

gUnknown_8418D70:: @ 8418D70
	.incbin "baserom.gba", 0x418D70, 0x99

gUnknown_8418E09:: @ 8418E09
	.incbin "baserom.gba", 0x418E09, 0x6E

gUnknown_8418E77:: @ 8418E77
	.incbin "baserom.gba", 0x418E77, 0x13

gUnknown_8418E8A:: @ 8418E8A
	.incbin "baserom.gba", 0x418E8A, 0x1

gUnknown_8418E8B:: @ 8418E8B
	.incbin "baserom.gba", 0x418E8B, 0x2

gUnknown_8418E8D:: @ 8418E8D
	.incbin "baserom.gba", 0x418E8D, 0x8

gUnknown_8418E95:: @ 8418E95
	.incbin "baserom.gba", 0x418E95, 0x9

gUnknown_8418E9E:: @ 8418E9E
	.incbin "baserom.gba", 0x418E9E, 0x9

gUnknown_8418EA7:: @ 8418EA7
	.incbin "baserom.gba", 0x418EA7, 0x9

gUnknown_8418EB0:: @ 8418EB0
	.incbin "baserom.gba", 0x418EB0, 0x5

gUnknown_8418EB5:: @ 8418EB5
	.incbin "baserom.gba", 0x418EB5, 0x7

gUnknown_8418EBC:: @ 8418EBC
	.incbin "baserom.gba", 0x418EBC, 0x7

gUnknown_8418EC3:: @ 8418EC3
	.string "No data$"

gUnknown_8418ECB:: @ 8418ECB
	@ Viridian Forest
	.string "A deep and sprawling forest that\n"
	.string "extends around VIRIDIAN CITY.\n"
	.string "A natural maze, many people\n"
	.string "become lost inside.$"

gUnknown_8418F3A:: @ 8418F3A
	@ Mt. Moon
	.string "A mystical mountain that is known\n"
	.string "for its frequent meteor falls.\n"
	.string "The shards of stars that fall\n"
	.string "here are known as MOON STONES.$"

gUnknown_8418FB8:: @ 8418FB8
	@ Diglett's Cave
	.string "A seemingly plain tunnel that was\n"
	.string "dug by wild DIGLETT.\n"
	.string "It is famous for connecting\n"
	.string "ROUTES 2 and 11.$"

gUnknown_841901C:: @ 841901C
	@ Victory Road
	.string "A tunnel situated on ROUTE 23.\n"
	.string "It earned its name because it\n"
	.string "must be traveled by all TRAINERS\n"
	.string "aiming for the top.$"

gUnknown_841908E:: @ 841908E
	@ Pokémon Mansion
	.string "A decrepit, burned-down mansion\n"
	.string "on CINNABAR ISLAND.\n"
	.string "It got its name because a famous\n"
	.string "POKéMON researcher lived there.$"

gUnknown_8419103:: @ 8419103
	@ Safari Zone
	.string "An amusement park outside FUCHSIA\n"
	.string "CITY where many rare POKéMON can\n"
	.string "be observed in the wild.\n"
	.string "Catch them in a popular game!$"

gUnknown_841917D:: @ 841917D
	@ Rock Tunnel
	.string "A naturally formed underground\n"
	.string "tunnel. Because it has not been\n"
	.string "developed, it is inky dark inside.\n"
	.string "A light is needed to get through.$"

gUnknown_8419201:: @ 8419201
	@ Seafoam Islands
	.string "A pair of islands that is situated\n"
	.string "on ROUTE 20.\n"
	.string "The two islands are shaped the\n"
	.string "same, as if they were twins.$"

gUnknown_841926D:: @ 841926D
	@ Pokémon Tower
	.string "A tower that houses the graves of\n"
	.string "countless POKéMON.\n"
	.string "Many people visit it daily to pay\n"
	.string "their respects to the fallen.$"

gUnknown_84192E2:: @ 84192E2
	@ Cerulean Cave
	.string "A mysterious cave that is filled\n"
	.string "with terribly tough POKéMON.\n"
	.string "It is so dangerous, the POKéMON\n"
	.string "LEAGUE is in charge of it.$"

gUnknown_841935B:: @ 841935B
	@ Power Plant
	.string "A power plant that was abandoned\n"
	.string "years ago, though some of the\n"
	.string "machines still work. It is infested\n"
	.string "with electric POKéMON.$"

gUnknown_84193D5:: @ 84193D5
	@ Mt. Ember
	.string "Supposedly an inactive volcano.\n"
	.string "However, there are persistent\n"
	.string "reports that the peak blazes\n"
	.string "with fire at night.$"

gUnknown_8419444:: @ 8419444
	@ Berry Forest
	.string "A forest on a small islet off the\n"
	.string "coast of THREE ISLAND. BERRIES\n"
	.string "grow wildly in profusion, quickly\n"
	.string "replenishing those that fall off.$"

gUnknown_84194C9:: @ 84194C9
	@ Icefall Cave
	.string "A cave which is covered by water\n"
	.string "and ice on FOUR ISLAND.\n"
	.string "It seems like the end of the cave\n"
	.string "is connected to the ocean.$"

gUnknown_841953F:: @ 841953F
	@ Lost Cave
	.string "A bewildering cave off the coast\n"
	.string "of RESORT GORGEOUS.\n"
	.string "Some curious thrill seekers have\n"
	.string "never emerged from it.$"

gUnknown_84195AC:: @ 84195AC
	@ Tanoby Ruins
	.string "An ancient ruin that is rumored to\n"
	.string "be home to a peculiar POKéMON.\n"
	.string "However, so far, the POKéMON\n"
	.string "remains an unconfirmed rumor.$"

gUnknown_8419629:: @ 8419629
	@ Altering Cave
	.string "This island has been known by this\n"
	.string "name since the distant past.\n"
	.string "No one today knows where it got\n"
	.string "this name, however.$"

gUnknown_841969D:: @ 841969D
	@ Pattern Bush
	.string "A lush and bush-like area. \n"
	.string "In it are patterns where no grass\n"
	.string "grows. Some study it in the belief\n"
	.string "that a secret is concealed.$"

gUnknown_841971A:: @ 841971A
	@ Dotted Hole
	.string "A mysterious, just-discovered\n"
	.string "ruin from an ancient time.\n"
	.string "It got its name from the six dots\n"
	.string "on its door.$"

gUnknown_8419782:: @ 8419782
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Met in a trade.$"

gUnknown_841979D:: @ 841979D
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Met in a trade.$"

gUnknown_84197B8:: @ 84197B8
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Met in a fateful encounter when\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

gUnknown_84197ED:: @ 84197ED
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Met in a fateful encounter when\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

gUnknown_8419822:: @ 8419822
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Met in {UNKNOWN_F7 0x02} at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

gUnknown_8419841:: @ 8419841
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Met in {UNKNOWN_F7 0x02} at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

gUnknown_8419860:: @ 8419860
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Apparently met in {UNKNOWN_F7 0x02}\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

gUnknown_841988A:: @ 841988A
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Apparently met in {UNKNOWN_F7 0x02}\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

gUnknown_84198B4:: @ 84198B4
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Hatched: {UNKNOWN_F7 0x02}\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

gUnknown_84198D5:: @ 84198D5
	.string "{UNKNOWN_F7 0x00} nature.\n"
	.string "Hatched: {UNKNOWN_F7 0x02}\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}.$"

@ TODO: Replace this gibberish with the proper Hiragana
gUnknown_84198F6:: @ 84198F6
	.string "{UNKNOWN_F7 0x00}ßÓÁÉË {EXTRA_LV}{UNKNOWN_F7 0x01}çÑÊ\n"
	.string "{UNKNOWN_F7 0x02}で ÉÇっŒ ùÂだ$"

gUnknown_8419913:: @ 8419913
	.string "{UNKNOWN_F7 0x00}ÓÁÉË {EXTRA_LV}{UNKNOWN_F7 0x01}çÑÊ\n"
	.string "{UNKNOWN_F7 0x02}で ÉÇっŒ ùÂだ$"

gUnknown_841992F:: @ 841992F
	.string "{UNKNOWN_F7 0x00} nature. Met in a fateful\n"
	.string "encounter (hatched: {UNKNOWN_F7 0x02}\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}).$"

gUnknown_841996D:: @ 841996D
	.string "{UNKNOWN_F7 0x00} nature. Met in a fateful\n"
	.string "encounter (hatched: {UNKNOWN_F7 0x02}\n"
	.string "at {EXTRA_LV} {UNKNOWN_F7 0x01}).$"

gUnknown_84199AB:: @ 84199AB
	.string "{UNKNOWN_F7 0x00} nature. Apparently met in\n"
	.string "a fateful encounter (hatched:\n"
	.string "{UNKNOWN_F7 0x02} at {EXTRA_LV} {UNKNOWN_F7 0x01}).$"

gUnknown_84199F4:: @ 84199F4
	.incbin "baserom.gba", 0x4199F4, 0x217

gUnknown_8419C0B:: @ 8419C0B
	.incbin "baserom.gba", 0x419C0B, 0x8

gUnknown_8419C13:: @ 8419C13
	.incbin "baserom.gba", 0x419C13, 0xA

gUnknown_8419C1D:: @ 8419C1D
	.incbin "baserom.gba", 0x419C1D, 0xD

gUnknown_8419C2A:: @ 8419C2A
	.incbin "baserom.gba", 0x419C2A, 0xF

gUnknown_8419C39:: @ 8419C39
	.incbin "baserom.gba", 0x419C39, 0xC

gUnknown_8419C45:: @ 8419C45
	.incbin "baserom.gba", 0x419C45, 0x8

gUnknown_8419C4D:: @ 8419C4D
	.incbin "baserom.gba", 0x419C4D, 0xC

gUnknown_8419C59:: @ 8419C59
	.incbin "baserom.gba", 0x419C59, 0x9

gUnknown_8419C62:: @ 8419C62
	.incbin "baserom.gba", 0x419C62, 0x10

gUnknown_8419C72:: @ 8419C72
	.incbin "baserom.gba", 0x419C72, 0x9

gUnknown_8419C7B:: @ 8419C7B
	.incbin "baserom.gba", 0x419C7B, 0x7

gUnknown_8419C82:: @ 8419C82
	.incbin "baserom.gba", 0x419C82, 0x10

gUnknown_8419C92:: @ 8419C92
	.incbin "baserom.gba", 0x419C92, 0x10

gUnknown_8419CA2:: @ 8419CA2
	.incbin "baserom.gba", 0x419CA2, 0x7

gUnknown_8419CA9:: @ 8419CA9
	.incbin "baserom.gba", 0x419CA9, 0x10

gUnknown_8419CB9:: @ 8419CB9
	.incbin "baserom.gba", 0x419CB9, 0x21

gUnknown_8419CDA:: @ 8419CDA
	.incbin "baserom.gba", 0x419CDA, 0x7

gUnknown_8419CE1:: @ 8419CE1
	.incbin "baserom.gba", 0x419CE1, 0x6

gUnknown_8419CE7:: @ 8419CE7
	.incbin "baserom.gba", 0x419CE7, 0x6

gUnknown_8419CED:: @ 8419CED
	.incbin "baserom.gba", 0x419CED, 0x2

gUnknown_8419CEF:: @ 8419CEF
	.incbin "baserom.gba", 0x419CEF, 0x8

gUnknown_8419CF7:: @ 8419CF7
	.incbin "baserom.gba", 0x419CF7, 0x1

gUnknown_8419CF8:: @ 8419CF8
	.incbin "baserom.gba", 0x419CF8, 0x5

gUnknown_8419CFD:: @ 8419CFD
	.incbin "baserom.gba", 0x419CFD, 0xD

gUnknown_8419D0A:: @ 8419D0A
	.incbin "baserom.gba", 0x419D0A, 0x10

gUnknown_8419D1A:: @ 8419D1A
	.incbin "baserom.gba", 0x419D1A, 0x35

gUnknown_8419D4F:: @ 8419D4F
	.incbin "baserom.gba", 0x419D4F, 0x8

gUnknown_8419D57:: @ 8419D57
	.incbin "baserom.gba", 0x419D57, 0xF

gUnknown_8419D66:: @ 8419D66
	.incbin "baserom.gba", 0x419D66, 0x17

gUnknown_8419D7D:: @ 8419D7D
	.incbin "baserom.gba", 0x419D7D, 0xC

gUnknown_8419D89:: @ 8419D89
	.incbin "baserom.gba", 0x419D89, 0x43

gUnknown_8419DCC:: @ 8419DCC
	.incbin "baserom.gba", 0x419DCC, 0x86

gUnknown_8419E52:: @ 8419E52
	.incbin "baserom.gba", 0x419E52, 0x5

gUnknown_8419E57:: @ 8419E57
	.incbin "baserom.gba", 0x419E57, 0xFD

gUnknown_8419F54:: @ 8419F54
	.string "SAVING…\n"
	.string "DON'T TURN OFF THE POWER.$"

// Start menu option descriptions
gUnknown_8419F76:: @ 8419F76 // Pokedex
	.string "A device that records POKéMON secrets\n"
	.string "upon meeting or catching them.$"

gUnknown_8419FBB:: @ 8419FBB // Pokemon
	.string "Check and organize POKéMON that are\n"
	.string "traveling with you in your party.$"

gUnknown_841A001:: @ 841A001 // Bag
	.string "Equipped with pockets for storing items\n"
	.string "you bought, received, or found.$"

gUnknown_841A049:: @ 841A049 // {PLAYER}
	.string "Check your money and other game data.$"

gUnknown_841A06F:: @ 841A06F // Save
	.string "Save your game with a complete record\n"
	.string "of your progress to take a break.$"

gUnknown_841A0B7:: @ 841A0B7 // Options
	.string "Adjust various game settings such as text\n"
	.string "speed, game rules, etc.$"

gUnknown_841A0F9:: @ 841A0F9 // Quit
	.string "Close this MENU window.$"

gUnknown_841A111:: @ 841A111 // Retire
	.string "Retire from the SAFARI GAME and return to\n"
	.string "the registration counter.$"

	.include "data/text/quest_log.inc"

gUnknown_841B285:: @ 841B285
	.incbin "baserom.gba", 0x41B285, 0xE

gUnknown_841B293:: @ 841B293
	.incbin "baserom.gba", 0x41B293, 0x2

gUnknown_841B295:: @ 841B295
	.incbin "baserom.gba", 0x41B295, 0x12

gUnknown_841B2A7:: @ 841B2A7
	.incbin "baserom.gba", 0x41B2A7, 0x35

gUnknown_841B2DC:: @ 841B2DC
	.incbin "baserom.gba", 0x41B2DC, 0x9

gUnknown_841B2E5:: @ 841B2E5
	.incbin "baserom.gba", 0x41B2E5, 0x8

gUnknown_841B2ED:: @ 841B2ED
	.incbin "baserom.gba", 0x41B2ED, 0x4

gUnknown_841B2F1:: @ 841B2F1
	.incbin "baserom.gba", 0x41B2F1, 0x15

gUnknown_841B306:: @ 841B306
	.incbin "baserom.gba", 0x41B306, 0xF

gUnknown_841B315:: @ 841B315
	.incbin "baserom.gba", 0x41B315, 0x6

gUnknown_841B31B:: @ 841B31B
	.incbin "baserom.gba", 0x41B31B, 0xE

gUnknown_841B329:: @ 841B329
	.incbin "baserom.gba", 0x41B329, 0x5

gUnknown_841B32E:: @ 841B32E
	.incbin "baserom.gba", 0x41B32E, 0x7C

gUnknown_841B3AA:: @ 841B3AA
	.incbin "baserom.gba", 0x41B3AA, 0x14

gUnknown_841B3BE:: @ 841B3BE
	.incbin "baserom.gba", 0x41B3BE, 0x152

gUnknown_841B510:: @ 841B510
	.incbin "baserom.gba", 0x41B510, 0x6

gUnknown_841B516:: @ 841B516
	.incbin "baserom.gba", 0x41B516, 0x8

gUnknown_841B51E:: @ 841B51E
	.incbin "baserom.gba", 0x41B51E, 0x6

gUnknown_841B524:: @ 841B524
	.incbin "baserom.gba", 0x41B524, 0x7

gUnknown_841B52B:: @ 841B52B
	.incbin "baserom.gba", 0x41B52B, 0x6

gUnknown_841B531:: @ 841B531
	.incbin "baserom.gba", 0x41B531, 0x4

gUnknown_841B535:: @ 841B535
	.incbin "baserom.gba", 0x41B535, 0x6

gUnknown_841B53B:: @ 841B53B
	.incbin "baserom.gba", 0x41B53B, 0x6

gUnknown_841B541:: @ 841B541
	.incbin "baserom.gba", 0x41B541, 0xA

gUnknown_841B54B:: @ 841B54B
	.incbin "baserom.gba", 0x41B54B, 0x9

gUnknown_841B554:: @ 841B554
	.incbin "baserom.gba", 0x41B554, 0x62

gUnknown_841B5B6:: @ 841B5B6
	.incbin "baserom.gba", 0x41B5B6, 0x58

gUnknown_841B60E:: @ 841B60E
	.incbin "baserom.gba", 0x41B60E, 0xB

gUnknown_841B619:: @ 841B619
	.incbin "baserom.gba", 0x41B619, 0x6B

gUnknown_841B684:: @ 841B684
	.incbin "baserom.gba", 0x41B684, 0xB

gUnknown_841B68F:: @ 841B68F
	.incbin "baserom.gba", 0x41B68F, 0x9

gUnknown_841B698:: @ 841B698
	.incbin "baserom.gba", 0x41B698, 0x6

gUnknown_841B69E:: @ 841B69E
	.incbin "baserom.gba", 0x41B69E, 0x1B

gUnknown_841B6B9:: @ 841B6B9
	.incbin "baserom.gba", 0x41B6B9, 0x1C

gUnknown_841B6D5:: @ 841B6D5
	.incbin "baserom.gba", 0x41B6D5, 0x7

gUnknown_841B6DC:: @ 841B6DC
	.incbin "baserom.gba", 0x41B6DC, 0x7

gUnknown_841B6E3:: @ 841B6E3
	.incbin "baserom.gba", 0x41B6E3, 0x8

gUnknown_841B6EB:: @ 841B6EB
	.incbin "baserom.gba", 0x41B6EB, 0x1

gUnknown_841B6EC:: @ 841B6EC
	.incbin "baserom.gba", 0x41B6EC, 0x7

gUnknown_841B6F3:: @ 841B6F3
	.incbin "baserom.gba", 0x41B6F3, 0xA

gText_HatchedFromEgg:: @ 841B6FD
	.incbin "baserom.gba", 0x41B6FD, 0x19

gText_NickHatchPrompt:: @ 841B716
	.incbin "baserom.gba", 0x41B716, 0x31

gUnknown_841B747:: @ 841B747
	.incbin "baserom.gba", 0x41B747, 0x24

gUnknown_841B76B:: @ 841B76B
	.incbin "baserom.gba", 0x41B76B, 0xE

gUnknown_841B779:: @ 841B779
	.incbin "baserom.gba", 0x41B779, 0x2B

	.include "data/text/teachy_tv.inc"

gString_Bill:: @ 841CB3C
	.string "BILL$"

gString_Someone:: @ 841CB41
	.string "SOMEONE$"

gString_Help:: @ 841CB49
	.string "HELP$"

gString_HelpSystem_ClearTo8:: @ 841CB4E
	.string "{CLEAR_TO 8}$"

gUnknown_841CB52:: @ 841CB52
	.string " points$"

gUnknown_841CB5A:: @ 841CB5A
	.string " time(s)$"

gUnknown_841CB63:: @ 841CB63
	.string "POKéMON JUMP RECORDS$"

	.string "Jumps in a row:$"

	.string "Best score:$"

	.string "EXCELLENTS in a row:$"

gUnknown_841CBA9:: @ 841CBA9
	.string "Awesome score! You've\n"
	.string "won {UNKNOWN_F7 01} {UNKNOWN_F7 00}!$"

gUnknown_841CBCA:: @ 841CBCA
	.string "There's no room left now.$"

gUnknown_841CBE4:: @ 841CBE4
	.string "You can't hold any more!$"

gUnknown_841CBFD:: @ 841CBFD
	.string "Want to play again?$"

gUnknown_841CC11:: @ 841CC11
	.string "Somebody dropped out.\n"
	.string "The link will be canceled.$"

gUnknown_841CC42:: @ 841CC42
	.string "SAVING…\n"
	.string "DON'T TURN OFF THE POWER.$"

gUnknown_841CC64:: @ 841CC64
	.string "Communication standby…$"

	.string "SAVING...\n"
	.string "DON'T TURN OFF THE POWER.$"

	.string "DODRIO BERRY-PICKING RECORDS$"

	.string "BERRIES picked:$"

	.string "Best score:$"

	.string "BERRIES picked in a row with\n"
	.string "five players:$"

gUnknown_841CD03:: @ 841CD03
	.string "Announcing BERRY-PICKING results!$"

gUnknown_841CD25:: @ 841CD25
	.string "10P     30P     50P     {EXTRA 0xDD}50P$"

gUnknown_841CD43:: @ 841CD43
	.string "Announcing rankings!$"

gUnknown_841CD58:: @ 841CD58
	.string "Announcing prizes!$"

	.string "1:$"

	.string "2:$"

	.string "3:$"

	.string "4:$"

	.string "5:$"

gUnknown_841CD7A:: @ 841CD7A
	.string "The first-place winner gets\n"
	.string "this {UNKNOWN_F7 00}!$"

gUnknown_841CD9F:: @ 841CD9F
	.string "You can't hold any more...$"

gUnknown_841CDBA:: @ 841CDBA
	.string "It filled its storage space.$"

gUnknown_841CDD7:: @ 841CDD7
	.string "Want to play again?$"

gUnknown_841CDEB:: @ 841CDEB
	.string "Somebody dropped out.\n"
	.string "The link will be canceled.$"

gUnknown_841CE1C:: @ 841CE1C
	.string " points$"

gUnknown_841CE24:: @ 841CE24
	.string "Communication standby…$"

	.string " Are you ready to BERRY-CRUSH?\n"
	.string "Please pick a BERRY for use.\p"
	.string "$"

	.string "Please wait while each member\n"
	.string "chooses a BERRY.$"

	.string " {PAUSE_MUSIC}{PLAY_BGM MUS_FANFA1}You ended up with {STR_VAR_1} units of\n"
	.string "silky-smooth BERRY POWDER.{RESUME_MUSIC}\p"
	.string "Your total amount of BERRY POWDER\n"
	.string "is {STR_VAR_2}.\p"
	.string "$"

	.string " Recording your game results in the\n"
	.string "save file.\n"
	.string "Please wait.$"

	.string " Want to play BERRY CRUSH again?$"

	.string "You have no BERRIES.\n"
	.string "The game will be canceled.$"

	.string "A member dropped out.\n"
	.string "The game will be canceled.$"

	.string "   Time's up.\p"
	.string "Good BERRY POWDER could not be\n"
	.string "made…\p"
	.string "$"

	.string "   Communication standby…$"

	.align 2
gUnknown_841D020:: @ 841D020
	.incbin "baserom.gba", 0x41D020, 0xC

gUnknown_841D02C:: @ 841D02C
	.incbin "baserom.gba", 0x41D02C, 0x24

gUnknown_841D050:: @ 841D050
	.incbin "baserom.gba", 0x41D050, 0x8

gUnknown_841D058:: @ 841D058
	.incbin "baserom.gba", 0x41D058, 0x10

gUnknown_841D068:: @ 841D068
	.incbin "baserom.gba", 0x41D068, 0xC

gUnknown_841D074:: @ 841D074
	.incbin "baserom.gba", 0x41D074, 0x4

gUnknown_841D078:: @ 841D078
	.incbin "baserom.gba", 0x41D078, 0x8

gUnknown_841D080:: @ 841D080
	.incbin "baserom.gba", 0x41D080, 0x8

gUnknown_841D088:: @ 841D088
	.incbin "baserom.gba", 0x41D088, 0x8

gUnknown_841D090:: @ 841D090
	.incbin "baserom.gba", 0x41D090, 0x8

gUnknown_841D098:: @ 841D098
	.incbin "baserom.gba", 0x41D098, 0xC

gUnknown_841D0A4:: @ 841D0A4
	.incbin "baserom.gba", 0x41D0A4, 0x4

gUnknown_841D0A8:: @ 841D0A8
	.incbin "baserom.gba", 0x41D0A8, 0x18

gUnknown_841D0C0:: @ 841D0C0
	.incbin "baserom.gba", 0x41D0C0, 0x58

gUnknown_841D118:: @ 841D118
	.incbin "baserom.gba", 0x41D118, 0xC

gUnknown_841D124:: @ 841D124
	.incbin "baserom.gba", 0x41D124, 0x18

gUnknown_841D13C:: @ 841D13C
	.incbin "baserom.gba", 0x41D13C, 0xC

gUnknown_841D148:: @ 841D148
	.incbin "baserom.gba", 0x41D148, 0x6

gUnknown_841D14E:: @ 841D14E
	.incbin "baserom.gba", 0x41D14E, 0x1B

gUnknown_841D169:: @ 841D169
	.incbin "baserom.gba", 0x41D169, 0x15

gUnknown_841D17E:: @ 841D17E
	.incbin "baserom.gba", 0x41D17E, 0xF

gUnknown_841D18D:: @ 841D18D
	.incbin "baserom.gba", 0x41D18D, 0xB

gUnknown_841D198:: @ 841D198
	.incbin "baserom.gba", 0x41D198, 0xCB8

gJPText_MysteryGift:: @ 841DE50
	.string "$"

gJPText_DecideStop:: @ 841DE51
	.string "$"

gUnknown_841DE52:: @ 841DE52
	.string "$"

gUnknown_841DE53:: @ 841DE53
	.string "$"

gUnknown_841DE54:: @ 841DE54
	.string "$"

gUnknown_841DE55:: @ 841DE55
	.incbin "baserom.gba", 0x41DE55, 0x27 @ japanese

gUnknown_841DE7C:: @ 841DE7C
	.string "$"

gUnknown_841DE7D:: @ 841DE7D
	.string "$"

gUnknown_841DE7E:: @ 841DE7E
	.incbin "baserom.gba", 0x0041de7e, 0x17 @ japanese

gUnknown_841DE95:: @ 841DE95
	.string "$"

gUnknown_841DE96:: @ 841DE96
	.string "$"

gUnknown_841DE97:: @ 841DE97
	.string "$"

gUnknown_841DE98:: @ 841DE98
	.string "$"

gUnknown_841DE99:: @ 841DE99
	.string "$"

gUnknown_841DE9A:: @ 841DE9A
	.string "$"

gUnknown_841DE9B:: @ 841DE9B
	.string "$"

gUnknown_841DE9C:: @ 841DE9C
	.string "$"

gUnknown_841DE9D:: @ 841DE9D
	.string "Communication error…\n"
	.string "Please check all connections,\n"
	.string "then turn the power OFF and ON.$"

gUnknown_841DEF0:: @ 841DEF0
	.string "Communication error…$"

gUnknown_841DF05:: @ 841DF05
	.string "Move closer to your link partner(s).\n"
	.string "Avoid obstacles between partners.$"

gUnknown_841DF4C:: @ 841DF4C
	.string "A Button: Registration Counter$"

gUnknown_841DF6B:: @ 841DF6B
	.string "A Button: Title Screen$"

gUnknown_841DF82:: @ 841DF82
	.string "{STR_VAR_1}P LINK$"

gUnknown_841DF8B:: @ 841DF8B
	.string "BRONZE$"

gUnknown_841DF92:: @ 841DF92
	.string "COPPER$"

gUnknown_841DF99:: @ 841DF99
	.string "SILVER$"

gUnknown_841DFA0:: @ 841DFA0
	.string "GOLD$"

gUnknown_841DFA5:: @ 841DFA5
	.string "{KEYGFX_A_BUTTON}NEXT$"

gUnknown_841DFAC:: @ 841DFAC
	.string "{KEYGFX_DPAD_UP_DOWN}PICK {KEYGFX_A_BUTTON}OK {KEYGFX_B_BUTTON}END$"

gUnknown_841DFBE:: @ 841DFBE
	.string "{KEYGFX_A_BUTTON}{KEYGFX_B_BUTTON}CANCEL$"

gUnknown_841DFC9:: @ 841DFC9
	.string "{KEYGFX_DPAD_UP_DOWN}PICK {KEYGFX_A_BUTTON}OK {KEYGFX_B_BUTTON}CANCEL$"

	@ easy chat categories
	.string "POKéMON$"

	.string "TRAINER$"

	.string "STATUS$"

	.string "BATTLE$"

	.string "GREETINGS$"

	.string "PEOPLE$"

	.string "VOICES$"

	.string "SPEECH$"

	.string "ENDINGS$"

	.string "FEELINGS$"

	.string "CONDITIONS$"

	.string "ACTIONS$"

	.string "LIFESTYLE$"

	.string "HOBBIES$"

	.string "TIME$"

	.string "MISC.$"

	.string "ADJECTIVES$"

	.string "EVENTS$"

	.string "MOVE 1$"

	.string "MOVE 2$"

	.string "TRENDY SAYING$"

	.string "POKéMON2$"

	@ trade-related
gUnknown_841E093:: @ 841E093
	.string "???$"

	.string "$"

	.string "Lv$"

	.string "---$"

gUnknown_841E09F:: @ 841E09F
	.string "????$"

	.string "$"

gUnknown_841E0A5:: @ 841E0A5
	.string "Is this trade okay?$"

	.string "CANCEL$"

	.string "Choose a POKéMON.$"

	.string "SUMMARY$"

	.string "TRADE$"

	.string "Cancel trade?$"

	.string "Press the B Button to exit.$"

	.string "SUMMARY$"

	.string "TRADE$"

	.string "{COLOR RED}{HIGHLIGHT DARK_GREY}{SHADOW GREEN}Communication standby…\n"
	.string "Please wait.$"

	.string "{COLOR RED}{HIGHLIGHT DARK_GREY}{SHADOW GREEN}The trade has been canceled.$"

	.string "{COLOR RED}{HIGHLIGHT DARK_GREY}{SHADOW GREEN}That's your only POKéMON\n"
	.string "for battle.$"

	.string "{COLOR RED}{HIGHLIGHT DARK_GREY}{SHADOW GREEN}Waiting for your friend\n"
	.string "to finish…$"

	.string "Your friend wants\n"
	.string "to trade POKéMON.$"

gUnknown_841E1E9:: @ 841E1E9
	.string "{STR_VAR_2} will be\n"
	.string "sent to {STR_VAR_1}.$"

gUnknown_841E200:: @ 841E200
	.string "Bye-bye, {STR_VAR_2}!$"

gUnknown_841E20D:: @ 841E20D
	.string "{STR_VAR_1} sent over {STR_VAR_3}.$"

gUnknown_841E21E:: @ 841E21E
	.string "Take good care of {STR_VAR_3}!$"

gUnknown_841E234:: @ 841E234
	.string "From $"

gUnknown_841E23A:: @ 841E23A
	.string "$"

gUnknown_841E23B:: @ 841E23B
	.string "$"

gUnknown_841E23C:: @ 841E23C
	.string "$"

gUnknown_841E23D:: @ 841E23D
	.string "$"

gUnknown_841E23E:: @ 841E23E
	.string "$"

gUnknown_841E23F:: @ 841E23F
	.string "$"

gUnknown_841E240:: @ 841E240
	.string "$"

gUnknown_841E241:: @ 841E241
	.string "$"

gUnknown_841E242:: @ 841E242
	.string "$"

gUnknown_841E243:: @ 841E243
	.string "$"

gUnknown_841E244:: @ 841E244
	.string "$"

gUnknown_841E245:: @ 841E245
	.string "Wireless Communication Status$"

gUnknown_841E263:: @ 841E263
	.string "People trading:$"

gUnknown_841E273:: @ 841E273
	.string "People battling:$"

gUnknown_841E284:: @ 841E284
	.string "People in the UNION ROOM:$"

gUnknown_841E29E:: @ 841E29E
	.string "People communicating:$"

gUnknown_841E2B4:: @ 841E2B4
	.string "{UNKNOWN_F7 0x00} players$"

gUnknown_841E2BF:: @ 841E2BF
	.string "{UNKNOWN_F7 0x01} player$"

gUnknown_841E2C9:: @ 841E2C9
	.string "{UNKNOWN_F7 0x02} players$"

gUnknown_841E2D4:: @ 841E2D4
	.string "{UNKNOWN_F7 0x03} players$"

gUnknown_841E2DF:: @ 841E2DF
	.incbin "baserom.gba", 0x41e2df, 0xd

gUnknown_841E2EC:: @ 841E2EC
	.incbin "baserom.gba", 0x41e2ec, 0x9

gUnknown_841E2F5:: @ 841E2F5
	.incbin "baserom.gba", 0x41e2f5, 0x2d

gUnknown_841E322:: @ 841E322
	.string "{EXTRA_ID}$"

gUnknown_841E325:: @ 841E325
	.string "Communication standby…$"

gDaycareText_GetAlongVeryWell:: @ 841E33C
	.string "The two seem to get along\n"
	.string "very well.$"

gDaycareText_GetAlong:: @ 841E361
	.string "The two seem to get along.$"

gDaycareText_DontLikeOther:: @ 841E37C
	.string "The two don't seem to like\n"
	.string "each other much.$"

gDaycareText_PlayOther:: @ 841E3A8
	.string "The two prefer to play with other\n"
	.string "POKéMON than each other.$"

gUnknown_841E3E3:: @ 841E3E3
	.incbin "baserom.gba", 0x41E3E3, 0x18

gUnknown_841E3FB:: @ 841E3FB
	.incbin "baserom.gba", 0x41E3FB, 0xA

gUnknown_841E405:: @ 841E405
	.incbin "baserom.gba", 0x41E405, 0xF

gUnknown_841E414:: @ 841E414
	.incbin "baserom.gba", 0x41E414, 0x6D

gUnknown_841E481:: @ 841E481
	.incbin "baserom.gba", 0x41E481, 0x12

gUnknown_841E493:: @ 841E493
	.incbin "baserom.gba", 0x41E493, 0x2D

gUnknown_841E4C0:: @ 841E4C0
	.incbin "baserom.gba", 0x41E4C0, 0x22

gUnknown_841E4E2:: @ 841E4E2
	.incbin "baserom.gba", 0x41E4E2, 0x2A

gUnknown_841E50C:: @ 841E50C
	.incbin "baserom.gba", 0x41E50C, 0x2C

gUnknown_841E538:: @ 841E538
	.incbin "baserom.gba", 0x41E538, 0x3A

gUnknown_841E572:: @ 841E572
	.incbin "baserom.gba", 0x41E572, 0x1B

gUnknown_841E58D:: @ 841E58D
	.incbin "baserom.gba", 0x41E58D, 0x17

gFameCheckerText_MainScreenUI:: @ 841E5A4
	.string "{KEYGFX_START_BUTTON}PICK {KEYGFX_DPAD_UP_DOWN}SELECT {KEYGFX_A_BUTTON}OK$"

gFameCheckerText_PickScreenUI:: @ 841E5B9
	.string "{KEYGFX_START_BUTTON}PICK {KEYGFX_DPAD_UP_DOWN}SELECT {KEYGFX_B_BUTTON}CANCEL$"

gFameCheckerText_FlavorTextUI:: @ 841E5D2
	.string "{KEYGFX_DPAD_ANY}PICK {KEYGFX_A_BUTTON}READ {KEYGFX_B_BUTTON}CANCEL$"

gFameCheckerOakName:: @ 841E5E9
	.string "OAK$"

gFameCheckerDaisyName:: @ 841E5ED
	.string "DAISY$"

gFameCheckerBillName:: @ 841E5F3
	.string "BILL$"

gFameCheckerMrFujiName:: @ 841E5F8
	.string "FUJI$"

gText_VarietyOfEventsImportedWireless:: @ 841E5FD
	.string "A variety of events will be imported\n"
	.string "over Wireless Communication.$"

gText_WonderCardsInPossession:: @ 841E63F
	.string "Read the WONDER CARDS in your\n"
	.string "possession.$"

gText_ReadNewsThatArrived:: @ 841E669
	.string "Read the NEWS that arrived.$"

gText_ReturnToTitle:: @ 841E685
	.string "Return to the title screen.$"

gText_DontHaveCardNewOneInput:: @ 841E6A1
	.string "You don't have a WONDER CARD,\n"
	.string "so a new CARD will be input.$"

gText_DontHaveNewsNewOneInput:: @ 841E6DC
	.string "You don't have any WONDER NEWS,\n"
	.string "so new NEWS will be input.$"

gText_WhereShouldCardBeAccessed:: @ 841E717
	.string "Where should the WONDER CARD\n"
	.string "be accessed?$"

gText_WhereShouldNewsBeAccessed:: @ 841E741
	.string "Where should the WONDER NEWS\n"
	.string "be accessed?$"

gUnknown_841E76B:: @ 841E76B
	.string "Link standby...\n"
	.string "... ... B Button: Cancel$"

gText_Communicating:: @ 841E794
	.string "Communicating…$"

gText_CommunicationCompleted:: @ 841E7A3
	.string "Communication completed.$"

gText_CommunicationError:: @ 841E7BC
	.string "Communication error.$"

gText_CommunicationCanceled:: @ 841E7D1
	.string "Communication has been canceled.$"

gText_ThrowAwayWonderCard:: @ 841E7F2
	.string "Throw away the WONDER CARD\n"
	.string "and input a new CARD?$"

gText_HaventReceivedCardsGift:: @ 841E823
	.string "You haven't received the CARD's gift\n"
	.string "yet. Input a new CARD anyway?$"

gText_WonderCardReceivedFrom:: @ 841E866
	.string "A WONDER CARD has been received\n"
	.string "from {STR_VAR_1}.$"

gText_WonderNewsReceivedFrom:: @ 841E88F
	.string "A WONDER NEWS item has been\n"
	.string "received from {STR_VAR_1}.$"

gText_WonderCardReceived:: @ 841E8BD
	.string "A new WONDER CARD has been\n"
	.string "received.$"

gText_WonderNewsReceived:: @ 841E8E2
	.string "A new WONDER NEWS item has been\n"
	.string "received.$"

gText_NewStampReceived:: @ 841E90C
	.string "A new STAMP has been received.$"

gText_NewTrainerReceived:: @ 841E92B
	.string "A new TRAINER has arrived.$"

gText_AlreadyHadCard:: @ 841E946
	.string "You already had that\n"
	.string "WONDER CARD.$"

gText_AlreadyHadNews:: @ 841E968
	.string "You already had that\n"
	.string "WONDER NEWS item.$"

gText_AlreadyHadStamp:: @ 841E98F
	.string "You already had that\n"
	.string "STAMP.$"

gText_NoMoreRoomForStamps:: @ 841E9AB
	.string "There's no more room for adding\n"
	.string "STAMPS.$"

gText_RecordUploadedViaWireless:: @ 841E9D3
	.string "Your record has been uploaded via\n"
	.string "WIRELESS COMMUNICATION.$"

gText_CantAcceptCardFromTrainer:: @ 841EA0D
	.string "You can't accept a WONDER CARD\n"
	.string "from this TRAINER.$"

gText_CantAcceptNewsFromTrainer:: @ 841EA3F
	.string "You can't accept WONDER NEWS\n"
	.string "from this TRAINER.$"

gText_NothingSentOver:: @ 841EA6F
	.string "Nothing was sent over…$"

gText_WhatToDoWithCards:: @ 841EA86
	.string "What would you like to do\n"
	.string "with the WONDER CARDS?$"

gText_WhatToDoWithNews:: @ 841EAB7
	.string "What would you like to do\n"
	.string "with the WONDER NEWS?$"

gText_SendingWonderCard:: @ 841EAE7
	.string "Sending your WONDER CARD…$"

gText_SendingWonderNews:: @ 841EB01
	.string "Sending your WONDER NEWS item…$"

gText_WonderCardSentTo:: @ 841EB20
	.string "Your WONDER CARD has been sent\n"
	.string "to {STR_VAR_1}.$"

gText_WonderNewsSentTo:: @ 841EB46
	.string "Your WONDER NEWS item has been\n"
	.string "sent to {STR_VAR_1}.$"

gText_StampSentTo:: @ 841EB71
	.string "A STAMP has been sent to {STR_VAR_1}.$"

gText_GiftSentTo:: @ 841EB8E
	.string "A GIFT has been sent to {STR_VAR_1}.$"

gText_OtherTrainerHasCard:: @ 841EBAA
	.string "The other TRAINER has the same\n"
	.string "WONDER CARD already.$"

gText_OtherTrainerHasNews:: @ 841EBDE
	.string "The other TRAINER has the same\n"
	.string "WONDER NEWS already.$"

gText_OtherTrainerHasStamp:: @ 841EC12
	.string "The other TRAINER has the same\n"
	.string "STAMP already.$"

gText_OtherTrainerCanceled:: @ 841EC40
	.string "The other TRAINER canceled\n"
	.string "communication.$"

gText_CantSendGiftToTrainer:: @ 841EC6A
	.string "You can't send a MYSTERY GIFT to\n"
	.string "this TRAINER.$"

gText_IfThrowAwayCardEventWontHappen:: @ 841EC99
	.string "If you throw away the CARD,\n"
	.string "its event won't happen. Okay?$"

gText_OkayToDiscardNews:: @ 841ECD3
	.string "Is it okay to discard this\n"
	.string "NEWS item?$"

gText_HaventReceivedGiftOkayToDiscard:: @ 841ECF9
	.string "You haven't received the\n"
	.string "GIFT. Is it okay to discard?$"

gText_DataWillBeSaved:: @ 841ED2F
	.string "Data will be saved.\n"
	.string "Please wait.$"

gText_SaveCompletedPressA:: @ 841ED50
	.string "Save completed.\n"
	.string "Please press the A Button.$"

gText_WonderCardThrownAway:: @ 841ED7B
	.string "The WONDER CARD was thrown away.$"

gText_WonderNewsThrownAway:: @ 841ED9C
	.string "The WONDER NEWS was thrown away.$"

gText_MysteryGift:: @ 841EDBD
	.string "MYSTERY GIFT$"

gText_PickOKCancel:: @ 841EDCA
	.string "{KEYGFX_DPAD_UP_DOWN}PICK {KEYGFX_A_BUTTON}OK {KEYGFX_B_BUTTON}EXIT$"

gText_WonderCards::
	.string "WONDER CARDS$"

gText_WonderNews::
	.string "WONDER NEWS$"

gText_WirelessCommunication::
	.string "WIRELESS COMMUNICATION$"

gText_Friend2::
	.string "FRIEND$"

gText_Exit3::
	.string "EXIT$"

gText_Receive::
	.string "RECEIVE$"

gText_Send::
	.string "SEND$"

gText_Toss::
	.string "TOSS$"

gUnknown_841EE2B:: @ 841EE2B
	.incbin "baserom.gba", 0x41EE2B, 0x17
