	.section script_data, "aw", %progbits

    .include "data/script_cmd_table.inc"

    .align 2
gSpecialVars:: @ 815FD0C
	.4byte gSpecialVar_0x8000
	.4byte gSpecialVar_0x8001
	.4byte gSpecialVar_0x8002
	.4byte gSpecialVar_0x8003
	.4byte gSpecialVar_0x8004
	.4byte gSpecialVar_0x8005
	.4byte gSpecialVar_0x8006
	.4byte gSpecialVar_0x8007
	.4byte gSpecialVar_0x8008
	.4byte gSpecialVar_0x8009
	.4byte gSpecialVar_0x800A
	.4byte gSpecialVar_0x800B
	.4byte gSpecialVar_Facing
	.4byte gSpecialVar_Result
	.4byte gSpecialVar_ItemId
	.4byte gSpecialVar_LastTalked
	.4byte gSpecialVar_MonBoxId
	.4byte gSpecialVar_MonBoxPos
	.4byte gUnknown_20370DA
	.4byte gUnknown_20370DC
	.4byte gUnknown_20370DE

    .include "data/specials.inc"

    .align 2
gStdScripts:: @ 8160450
	.4byte gStdScript_81A667B
	.4byte gStdScript_81A67B3
	.4byte gStdScript_81A4E3F
	.4byte gStdScript_81A4E4A
	.4byte gStdScript_81A4E54
	.4byte gStdScript_81A4E5C
	.4byte gStdScript_81A501F
	.4byte gStdScript_81A676C
	.4byte gStdScript_81A8E58
	.4byte gStdScript_81A4E66
gStdScriptsEnd::

gUnknown_8160478:: @ 8160478
	.incbin "baserom.gba", 0x160478, 0x886C

gUnknown_8168CE4:: @ 8168CE4
	.incbin "baserom.gba", 0x168CE4, 0x33

gUnknown_8168D17:: @ 8168D17
	.incbin "baserom.gba", 0x168D17, 0x3C128

gStdScript_81A4E3F::
    .incbin "baserom.gba", 0x1A4E3F, 0xB

gStdScript_81A4E4A::
    .incbin "baserom.gba", 0x1A4E4A, 0xA

gStdScript_81A4E54::
    .incbin "baserom.gba", 0x1A4E54, 0x8

gStdScript_81A4E5C::
    .incbin "baserom.gba", 0x1A4E5C, 0xA

gStdScript_81A4E66::
    .incbin "baserom.gba", 0x1A4E66, 0x4E

gUnknown_81A4EB4:: @ 81A4EB4
	.incbin "baserom.gba", 0x1A4EB4, 0xD

gUnknown_81A4EC1:: @ 81A4EC1
	.incbin "baserom.gba", 0x1A4EC1, 0x28

gUnknown_81A4EE9:: @ 81A4EE9
	.incbin "baserom.gba", 0x1A4EE9, 0x38

gUnknown_81A4F21:: @ 81A4F21
	.incbin "baserom.gba", 0x1A4F21, 0x1D

gUnknown_81A4F3E:: @ 81A4F3E
	.incbin "baserom.gba", 0x1A4F3E, 0x35

gUnknown_81A4F73:: @ 81A4F73
	.incbin "baserom.gba", 0x1A4F73, 0xAC

gStdScript_81A501F::
    .incbin "baserom.gba", 0x1A501F, 0x6B

gUnknown_81A508A:: @ 81A508A
	.incbin "baserom.gba", 0x1A508A, 0x3EC

gUnknown_81A5476:: @ 81A5476
	.incbin "baserom.gba", 0x1A5476, 0x100B

gUnknown_81A6481:: @ 81A6481
	.incbin "baserom.gba", 0x1A6481, 0xCA

gUnknown_81A654B:: @ 81A654B
	.incbin "baserom.gba", 0x1A654B, 0x130

gStdScript_81A667B::
    .incbin "baserom.gba", 0x1A667B, 0xF1

gStdScript_81A676C::
    .incbin "baserom.gba", 0x1A676C, 0x47

gStdScript_81A67B3::
    .incbin "baserom.gba", 0x1A67B3, 0x90

gUnknown_81A6843:: @ 81A6843
	.incbin "baserom.gba", 0x1A6843, 0x112

gUnknown_81A6955:: @ 81A6955
	.incbin "baserom.gba", 0x1A6955, 0x173

gUnknown_81A6AC8:: @ 81A6AC8
	.incbin "baserom.gba", 0x1A6AC8, 0x45

gUnknown_81A6B0D:: @ 81A6B0D
	.incbin "baserom.gba", 0x1A6B0D, 0x125

gUnknown_81A6C32:: @ 81A6C32
	.incbin "baserom.gba", 0x1A6C32, 0xE5

gUnknown_81A6D17:: @ 81A6D17
	.incbin "baserom.gba", 0x1A6D17, 0x56

gUnknown_81A6D6D:: @ 81A6D6D
	.incbin "baserom.gba", 0x1A6D6D, 0x72

gUnknown_81A6DDF:: @ 81A6DDF
	.incbin "baserom.gba", 0x1A6DDF, 0x57

gUnknown_81A6E36:: @ 81A6E36
	.incbin "baserom.gba", 0x1A6E36, 0x6E

gUnknown_81A6EA4:: @ 81A6EA4
	.incbin "baserom.gba", 0x1A6EA4, 0x67

gUnknown_81A6F0B:: @ 81A6F0B
	.incbin "baserom.gba", 0x1A6F0B, 0x66

gUnknown_81A6F71:: @ 81A6F71
	.incbin "baserom.gba", 0x1A6F71, 0x3A

gUnknown_81A6FAB:: @ 81A6FAB
	.incbin "baserom.gba", 0x1A6FAB, 0x46

gUnknown_81A6FF1:: @ 81A6FF1
	.incbin "baserom.gba", 0x1A6FF1, 0x40

gUnknown_81A7031:: @ 81A7031
	.incbin "baserom.gba", 0x1A7031, 0x32

gUnknown_81A7063:: @ 81A7063
	.incbin "baserom.gba", 0x1A7063, 0x42

gUnknown_81A70A5:: @ 81A70A5
	.incbin "baserom.gba", 0x1A70A5, 0x33

gUnknown_81A70D8:: @ 81A70D8
	.incbin "baserom.gba", 0x1A70D8, 0x30

gUnknown_81A7108:: @ 81A7108
	.incbin "baserom.gba", 0x1A7108, 0x2F

gUnknown_81A7137:: @ 81A7137
	.incbin "baserom.gba", 0x1A7137, 0x3E

gUnknown_81A7175:: @ 81A7175
	.incbin "baserom.gba", 0x1A7175, 0x491

gUnknown_81A7606:: @ 81A7606
	.incbin "baserom.gba", 0x1A7606, 0x9

gUnknown_81A760F:: @ 81A760F
	.incbin "baserom.gba", 0x1A760F, 0x9

gUnknown_81A7618:: @ 81A7618
	.incbin "baserom.gba", 0x1A7618, 0x9

gUnknown_81A7621:: @ 81A7621
	.incbin "baserom.gba", 0x1A7621, 0x9

gUnknown_81A762A:: @ 81A762A
	.incbin "baserom.gba", 0x1A762A, 0x9

gUnknown_81A7633:: @ 81A7633
	.incbin "baserom.gba", 0x1A7633, 0x9

gUnknown_81A763C:: @ 81A763C
	.incbin "baserom.gba", 0x1A763C, 0x9

gUnknown_81A7645:: @ 81A7645
	.incbin "baserom.gba", 0x1A7645, 0x9

gUnknown_81A764E:: @ 81A764E
	.incbin "baserom.gba", 0x1A764E, 0x9

gUnknown_81A7657:: @ 81A7657
	.incbin "baserom.gba", 0x1A7657, 0x9

gUnknown_81A7660:: @ 81A7660
	.incbin "baserom.gba", 0x1A7660, 0x9

gUnknown_81A7669:: @ 81A7669
	.incbin "baserom.gba", 0x1A7669, 0x9

gUnknown_81A7672:: @ 81A7672
	.incbin "baserom.gba", 0x1A7672, 0x9

gUnknown_81A767B:: @ 81A767B
	.incbin "baserom.gba", 0x1A767B, 0x9

gUnknown_81A7684:: @ 81A7684
	.incbin "baserom.gba", 0x1A7684, 0x9

gUnknown_81A768D:: @ 81A768D
	.incbin "baserom.gba", 0x1A768D, 0x9

gUnknown_81A7696:: @ 81A7696
	.incbin "baserom.gba", 0x1A7696, 0x9

gUnknown_81A769F:: @ 81A769F
	.incbin "baserom.gba", 0x1A769F, 0x9

gUnknown_81A76A8:: @ 81A76A8
	.incbin "baserom.gba", 0x1A76A8, 0x9

gUnknown_81A76B1:: @ 81A76B1
	.incbin "baserom.gba", 0x1A76B1, 0x9

gUnknown_81A76BA:: @ 81A76BA
	.incbin "baserom.gba", 0x1A76BA, 0x9

gUnknown_81A76C3:: @ 81A76C3
	.incbin "baserom.gba", 0x1A76C3, 0x9

gUnknown_81A76CC:: @ 81A76CC
	.incbin "baserom.gba", 0x1A76CC, 0x9

gUnknown_81A76D5:: @ 81A76D5
	.incbin "baserom.gba", 0x1A76D5, 0x9

gUnknown_81A76DE:: @ 81A76DE
	.incbin "baserom.gba", 0x1A76DE, 0x9

gUnknown_81A76E7:: @ 81A76E7
	.incbin "baserom.gba", 0x1A76E7, 0x9

gUnknown_81A76F0:: @ 81A76F0
	.incbin "baserom.gba", 0x1A76F0, 0x9

gUnknown_81A76F9:: @ 81A76F9
	.incbin "baserom.gba", 0x1A76F9, 0x9

gUnknown_81A7702:: @ 81A7702
	.incbin "baserom.gba", 0x1A7702, 0x9E

gUnknown_81A77A0:: @ 81A77A0
	.incbin "baserom.gba", 0x1A77A0, 0x33B

gUnknown_81A7ADB:: @ 81A7ADB
	.incbin "baserom.gba", 0x1A7ADB, 0x5

gUnknown_81A7AE0:: @ 81A7AE0
	.incbin "baserom.gba", 0x1A7AE0, 0x120D

gUnknown_81A8CED:: @ 81A8CED
	.incbin "baserom.gba", 0x1A8CED, 0x5C

gUnknown_81A8D49:: @ 81A8D49
	.incbin "baserom.gba", 0x1A8D49, 0x4E

gUnknown_81A8D97:: @ 81A8D97
	.incbin "baserom.gba", 0x1A8D97, 0x41

gUnknown_81A8DD8:: @ 81A8DD8
	.incbin "baserom.gba", 0x1A8DD8, 0x25

gUnknown_81A8DFD:: @ 81A8DFD
	.incbin "baserom.gba", 0x1A8DFD, 0x5B

gStdScript_81A8E58::
    .incbin "baserom.gba", 0x1A8E58, 0x42AE

	.include "data/text/fame_checker.inc"

gUnknown_81B2E6F:: @ 81B2E6F
	.incbin "baserom.gba", 0x1B2E6F, 0x15A

gUnknown_81B2FC9:: @ 81B2FC9
	.incbin "baserom.gba", 0x1B2FC9, 0x88DE

gUnknown_81BB8A7:: @ 81BB8A7
	.incbin "baserom.gba", 0x1BB8A7, 0x1C

gUnknown_81BB8C3:: @ 81BB8C3
	.incbin "baserom.gba", 0x1BB8C3, 0xC

gUnknown_81BB8CF:: @ 81BB8CF
	.incbin "baserom.gba", 0x1BB8CF, 0xC

gUnknown_81BB8DB:: @ 81BB8DB
	.incbin "baserom.gba", 0x1BB8DB, 0x1D

gUnknown_81BB8F8:: @ 81BB8F8
	.incbin "baserom.gba", 0x1BB8F8, 0x1D

gUnknown_81BB915:: @ 81BB915
	.incbin "baserom.gba", 0x1BB915, 0x1D

gUnknown_81BB932:: @ 81BB932
	.incbin "baserom.gba", 0x1BB932, 0x1E

gUnknown_81BB950:: @ 81BB950
	.incbin "baserom.gba", 0x1BB950, 0xC

gUnknown_81BB95C:: @ 81BB95C
	.incbin "baserom.gba", 0x1BB95C, 0x24

gUnknown_81BB980:: @ 81BB980
	.incbin "baserom.gba", 0x1BB980, 0x1

gUnknown_81BB981:: @ 81BB981
	.incbin "baserom.gba", 0x1BB981, 0x11

gUnknown_81BB992:: @ 81BB992
	.incbin "baserom.gba", 0x1BB992, 0x11

gUnknown_81BB9A3:: @ 81BB9A3
	.incbin "baserom.gba", 0x1BB9A3, 0x31

gUnknown_81BB9D4:: @ 81BB9D4
	.incbin "baserom.gba", 0x1BB9D4, 0x1C

gUnknown_81BB9F0:: @ 81BB9F0
	.incbin "baserom.gba", 0x1BB9F0, 0xC

gUnknown_81BB9FC:: @ 81BB9FC
	.incbin "baserom.gba", 0x1BB9FC, 0x5DC

gUnknown_81BBFD8:: @ 81BBFD8
	.incbin "baserom.gba", 0x1BBFD8, 0x4D4

gUnknown_81BC4AC:: @ 81BC4AC
	.incbin "baserom.gba", 0x1BC4AC, 0x22

gUnknown_81BC4CE:: @ 81BC4CE
	.incbin "baserom.gba", 0x1BC4CE, 0x3F

gUnknown_81BC50D:: @ 81BC50D
	.incbin "baserom.gba", 0x1BC50D, 0x3F

gUnknown_81BC54C:: @ 81BC54C
	.incbin "baserom.gba", 0x1BC54C, 0x1A1F

gUnknown_81BDF6B:: @ 81BDF6B
	.incbin "baserom.gba", 0x1BDF6B, 0xF9

gUnknown_81BE064:: @ 81BE064
	.incbin "baserom.gba", 0x1BE064, 0x10A

gUnknown_81BE16E:: @ 81BE16E
	.incbin "baserom.gba", 0x1BE16E, 0x149

gUnknown_81BE2B7:: @ 81BE2B7
	.incbin "baserom.gba", 0x1BE2B7, 0x48

gUnknown_81BE2FF:: @ 81BE2FF
	.incbin "baserom.gba", 0x1BE2FF, 0x265

gUnknown_81BE564:: @ 81BE564
	.incbin "baserom.gba", 0x1BE564, 0xFE2

gUnknown_81BF546:: @ 81BF546
	.incbin "baserom.gba", 0x1BF546, 0x619

gUnknown_81BFB5F:: @ 81BFB5F
	.incbin "baserom.gba", 0x1BFB5F, 0x6

gUnknown_81BFB65:: @ 81BFB65
	.incbin "baserom.gba", 0x1BFB65, 0x22

gUnknown_81BFB87:: @ 81BFB87
	.incbin "baserom.gba", 0x1BFB87, 0x23

gUnknown_81BFBAA:: @ 81BFBAA
	.incbin "baserom.gba", 0x1BFBAA, 0x1B

gUnknown_81BFBC5:: @ 81BFBC5
	.incbin "baserom.gba", 0x1BFBC5, 0x12

gUnknown_81BFBD7:: @ 81BFBD7
	.incbin "baserom.gba", 0x1BFBD7, 0x178A

gUnknown_81C1361:: @ 81C1361
	.incbin "baserom.gba", 0x1C1361, 0x1B

gUnknown_81C137C:: @ 81C137C
	.incbin "baserom.gba", 0x1C137C, 0x5A

gUnknown_81C13D6:: @ 81C13D6
	.incbin "baserom.gba", 0x1C13D6, 0x53

gUnknown_81C1429:: @ 81C1429
	.incbin "baserom.gba", 0x1C1429, 0x4073

gUnknown_81C549C:: @ 81C549C
	.incbin "baserom.gba", 0x1C549C, 0xBF

gUnknown_81C555B:: @ 81C555B
	.incbin "baserom.gba", 0x1C555B, 0x6E

gUnknown_81C55C9:: @ 81C55C9
	.incbin "baserom.gba", 0x1C55C9, 0x21

gUnknown_81C55EA:: @ 81C55EA
	.incbin "baserom.gba", 0x1C55EA, 0x3B

gUnknown_81C5625:: @ 81C5625
	.incbin "baserom.gba", 0x1C5625, 0x22

gUnknown_81C5647:: @ 81C5647
	.incbin "baserom.gba", 0x1C5647, 0x23

gUnknown_81C566A:: @ 81C566A
	.incbin "baserom.gba", 0x1C566A, 0xE5

gOtherText_NewName:: @ 81C574F
	.string "NEW NAME$"

gNameChoice_Green:: @ 81C5758
	.string "GREEN$"

gNameChoice_Red:: @ 81C575E
	.string "RED$"

gNameChoice_Leaf:: @ 81C5762
	.string "LEAF$"

gNameChoice_Fire:: @ 81C5767
	.string "FIRE$"

gNameChoice_Gary:: @ 81C576C
	.string "GARY$"

gNameChoice_Kaz:: @ 81C5771
	.string "KAZ$"

gNameChoice_Toru:: @ 81C5775
	.string "TORU$"

gNameChoice_Ash:: @ 81C577A
	.string "ASH$"

gNameChoice_Kene:: @ 81C577E
	.string "KENE$"

gNameChoice_Geki:: @ 81C5783
	.string "GEKI$"

gNameChoice_Jak:: @ 81C5788
	.string "JAK$"

gNameChoice_Janne:: @ 81C578C
	.string "JANNE$"

gNameChoice_Jonn:: @ 81C5792
	.string "JONN$"

gNameChoice_Kamon:: @ 81C5797
	.string "KAMON$"

gNameChoice_Karl:: @ 81C579D
	.string "KARL$"

gNameChoice_Taylor:: @ 81C57A2
	.string "TAYLOR$"

gNameChoice_Oscar:: @ 81C57A9
	.string "OSCAR$"

gNameChoice_Hiro:: @ 81C57AF
	.string "HIRO$"

gNameChoice_Max:: @ 81C57B4
	.string "MAX$"

gNameChoice_Jon:: @ 81C57B8
	.string "JON$"

gNameChoice_Ralph:: @ 81C57BC
	.string "RALPH$"

gNameChoice_Kay:: @ 81C57C2
	.string "KAY$"

gNameChoice_Tosh:: @ 81C57C6
	.string "TOSH$"

gNameChoice_Roak:: @ 81C57CB
	.string "ROAK$"

gNameChoice_Omi:: @ 81C57D0
	.string "OMI$"

gNameChoice_Jodi:: @ 81C57D4
	.string "JODI$"

gNameChoice_Amanda:: @ 81C57D9
	.string "AMANDA$"

gNameChoice_Hillary:: @ 81C57E0
	.string "HILLARY$"

gNameChoice_Makey:: @ 81C57E8
	.string "MAKEY$"

gNameChoice_Michi:: @ 81C57EE
	.string "MICHI$"

gNameChoice_Paula:: @ 81C57F4
	.string "PAULA$"

gNameChoice_June:: @ 81C57FA
	.string "JUNE$"

gNameChoice_Cassie:: @ 81C57FF
	.string "CASSIE$"

gNameChoice_Rey:: @ 81C5806
	.string "REY$"

gNameChoice_Seda:: @ 81C580A
	.string "SEDA$"

gNameChoice_Kiko:: @ 81C580F
	.string "KIKO$"

gNameChoice_Mina:: @ 81C5814
	.string "MINA$"

gNameChoice_Norie:: @ 81C5819
	.string "NORIE$"

gNameChoice_Sai:: @ 81C581F
	.string "SAI$"

gNameChoice_Momo:: @ 81C5823
	.string "MOMO$"

gNameChoice_Suzi:: @ 81C5828
	.string "SUZI$"

gNewGame_HelpDocs1:: @ 81C582D
	.string "The various buttons will be explained in\n"
	.string "the order of their importance.$"

gNewGame_HelpDocs2:: @ 81C5875
	.string "Moves the main character.\n"
	.string "Also used to choose various data\n"
	.string "headings.$"

gNewGame_HelpDocs3:: @ 81C58BA
	.string "Used to confirm a choice, check\n"
	.string "things, chat, and scroll text.$"

gNewGame_HelpDocs4:: @ 81C58F9
	.string "Used to exit, cancel a choice,\n"
	.string "and cancel a mode.$"

gNewGame_HelpDocs5:: @ 81C592B
	.string "Press this button to open the\n"
	.string "MENU.$"

gNewGame_HelpDocs6:: @ 81C594F
	.string "Used to shift items and to use\n"
	.string "a registered item.$"

gNewGame_HelpDocs7:: @ 81C5981
	.string "If you need help playing the\n"
	.string "game, or on how to do things,\n"
	.string "press the L or R Button.$"

gOakText_AskPlayerGender:: @ 81C59D5
	.string "Now tell me. Are you a boy?\n"
	.string "Or are you a girl?$"

gNewGameAdventureIntro1::
	.string "In the world which you are about to\n"
	.string "enter, you will embark on a grand\n"
	.string "adventure with you as the hero.\n"
	.string "\n"
	.string "Speak to people and check things\n"
	.string "wherever you go, be it towns, roads,\n"
	.string "or caves. Gather information and\n"
	.string "hints from every source.$"

gNewGameAdventureIntro2::
	.string "New paths will open to you by helping\n"
	.string "people in need, overcoming challenges,\n"
	.string "and solving mysteries.\n"
	.string "\n"
	.string "At times, you will be challenged by\n"
	.string "others and attacked by wild creatures.\n"
	.string "Be brave and keep pushing on.$"

gNewGameAdventureIntro3::
	.string "Through your adventure, we hope\n"
	.string "that you will interact with all sorts\n"
	.string "of people and achieve personal growth.\n"
	.string "That is our biggest objective.\n"
	.string "\n"
	.string "Press the A Button, and let your\n"
	.string "adventure begin!$"

gOakText_WelcomeToTheWorld:: @ 81C5C78
	.string "Hello, there!\n"
	.string "Glad to meet you!\pWelcome to the world of POKéMON!\pMy name is OAK.\pPeople affectionately refer to me\n"
	.string "as the POKéMON PROFESSOR.\p$"

gOakText_WorldInhabited1:: @ 81C5D06
	.string "This world…$"

gOakText_WorldInhabited2:: @ 81C5D12
	.string "…is inhabited far and wide by\n"
	.string "creatures called POKéMON.\p$"

gOakText_PetsBattlingStudy:: @ 81C5D4B
	.string "For some people, POKéMON are pets.\n"
	.string "Others use them for battling.\pAs for myself…\pI study POKéMON as a profession.\p$"

gOakText_TellMeALittleAboutYourself:: @ 81C5DBD
	.string "But first, tell me a little about\n"
	.string "yourself.\p$"

gOakText_AskPlayerName:: @ 81C5DEA
	.string "Let’s begin with your name.\n"
	.string "What is it?\p$"

gOakText_FinalizePlayerName:: @ 81C5E13
	.string "Right…\n"
	.string "So your name is {PLAYER}.$"

gOakText_IntroduceRival:: @ 81C5E2E
	.string "This is my grandson.\pHe’s been your rival since you both\n"
	.string "were babies.\p…Erm, what was his name now?$"

gOakText_AskRivalName:: @ 81C5E91
	.string "Your rival’s name, what was it now?$"

gOakText_ConfirmRivalName:: @ 81C5EB5
	.string "…Er, was it {RIVAL}?$"

gOakText_RememberRivalName:: @ 81C5EC5
	.string "That’s right! I remember now!\n"
	.string "His name is {RIVAL}!\p$"

gOakText_LegendAboutToUnfold:: @ 81C5EF4
	.string "{PLAYER}!\pYour very own POKéMON legend is\n"
	.string "about to unfold!\pA world of dreams and adventures\n"
	.string "with POKéMON awaits! Let’s go!$"

@ pokedude data
	.incbin "baserom.gba", 0x1C5F69, 0x983
