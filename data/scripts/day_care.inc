Route5_PokemonDayCare_EventScript_1BF398:: @ 81BF398
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	showmoneybox 0, 0, 0
	specialvar VAR_RESULT, IsThereMonInRoute5Daycare
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BF46E
	msgbox Text_19DD66, 5
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BF3DD
	msgbox Text_19DDB2
	goto EventScript_1BF541
	end

EventScript_1BF3DD:: @ 81BF3DD
	specialvar VAR_RESULT, CountPartyNonEggMons
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BF452
	msgbox Text_19DDBE
	fadescreen 1
	hidemoneybox 0, 0
	special ChooseSendDaycareMon
	waitstate
	showmoneybox 0, 0, 0
	compare VAR_0x8004, 6
	goto_if_ge EventScript_1BF444
	specialvar VAR_RESULT, CountPartyAliveNonEggMons_IgnoreVar0x8004Slot
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1BF460
	specialvar VAR_0x8005, GetSelectedMonNickAndSpecies
	msgbox Text_19DDF9
	waitse
	playmoncry VAR_0x8005, 0
	msgbox Text_19DE24
	waitmoncry
	special PutMonInRoute5Daycare
	incrementgamestat GAME_STAT_USED_DAYCARE
	goto EventScript_1BF541
	end

EventScript_1BF444:: @ 81BF444
	msgbox Text_19DDDC
	goto EventScript_1BF541
	end

EventScript_1BF452:: @ 81BF452
	msgbox Text_19DEF5
	goto EventScript_1BF541
	end

EventScript_1BF460:: @ 81BF460
	msgbox Text_19DF1D
	goto EventScript_1BF541
	end

EventScript_1BF46E:: @ 81BF46E
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, GetNumLevelsGainedForRoute5DaycareMon
	compare VAR_RESULT, 0
	call_if_ne EventScript_1BF4AA
	compare VAR_RESULT, 0
	call_if_eq EventScript_1BF4B3
	special GetCostToWithdrawRoute5DaycareMon
	msgbox Text_19DE80, 5
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BF4BC
	goto EventScript_1BF444
	end

EventScript_1BF4AA:: @ 81BF4AA
	msgbox Text_19DF56
	return

EventScript_1BF4B3:: @ 81BF4B3
	msgbox Text_19DE3C
	return

EventScript_1BF4BC:: @ 81BF4BC
	specialvar VAR_RESULT, CalculatePlayerPartyCount
	compare VAR_RESULT, PARTY_SIZE
	goto_if_eq EventScript_1BF533
	specialvar VAR_RESULT, IsEnoughForCostInVar0x8005
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1BF4EA
	msgbox Text_19E001
	goto EventScript_1BF541
	end

EventScript_1BF4EA:: @ 81BF4EA
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, TakePokemonFromRoute5Daycare
	special SubtractMoneyFromVar0x8005
	updatemoneybox 0, 0, 0
	copyvar VAR_0x8008, VAR_RESULT
	getpartysize
	subvar VAR_RESULT, 1
	getpartymonname 0, VAR_RESULT
	copyvar VAR_RESULT, VAR_0x8008
	msgbox Text_19DEAF
	textcolor 3
	waitse
	playmoncry VAR_RESULT, 0
	msgbox Text_19DECF
	call EventScript_1A6675
	waitmoncry
	goto EventScript_1BF541
	end

EventScript_1BF533:: @ 81BF533
	msgbox Text_19DFC2
	goto EventScript_1BF541
	end

EventScript_1BF541:: @ 81BF541
	hidemoneybox 0, 0
	release
	end

EventScript_81BF546:: @ 81BF546
	lockall
	msgbox Text_1BFB5A
	special EggHatch
	waitstate
	releaseall
	end

gUnknown_81BF555:: @ 81BF555
	.string "I'm the DAY-CARE MAN.\p"
	.string "I help take care of the precious\n"
	.string "POKéMON of TRAINERS.\p"
	.string "If you'd like me to raise your\n"
	.string "POKéMON, have a word with my wife.$"

gUnknown_81BF5E3:: @ 81BF5E3
	.string "Ah, it's you!\p"
	.string "We were raising your POKéMON, and\n"
	.string "my goodness, were we surprised!\p"
	.string "Your POKéMON had an EGG!\p"
	.string "We don't know how it got there,\n"
	.string "but your POKéMON had it.\p"
	.string "You do want it, yes?$"

gUnknown_81BF69A:: @ 81BF69A
	.string "Ah, it's you! Good to see you.\n"
	.string "Your {STR_VAR_1}'s doing fine.$"

gUnknown_81BF6CF:: @ 81BF6CF
	.string "Well then, I'll keep it.\n"
	.string "Thanks!$"

gUnknown_81BF6F0:: @ 81BF6F0
	.string "You have no room for it…\n"
	.string "Come back when you've made room.$"

Text_1BF72A:: @ 81BF72A
	.string "{PLAYER} received the EGG from\n"
	.string "the DAY-CARE MAN.$"

gUnknown_81BF755:: @ 81BF755
	.string "Take good care of it.$"

Text_1BF76B:: @ 81BF76B
	.string "ポケモンを　ひきとりたい　ときは\n"
	.string "ばさんに　いって　おくれ$"

gUnknown_81BF789:: @ 81BF789
	.string "Ah, it's you! Your {STR_VAR_1} and\n"
	.string "{STR_VAR_2} are doing fine.$"

gUnknown_81BF7B6:: @ 81BF7B6
	.string "I really will keep it.\n"
	.string "You do want this, yes?$"

gUnknown_81BF7E4:: @ 81BF7E4
	.string "I'm the DAY-CARE LADY.\p"
	.string "We can raise POKéMON for you.\p"
	.string "Would you like us to raise one?$"

gUnknown_81BF839:: @ 81BF839
	.string "Which POKéMON should we raise for\n"
	.string "you?$"

gUnknown_81BF860:: @ 81BF860
	.string "Fine, we'll raise your {STR_VAR_1}\n"
	.string "for a while.\p"
	.string "Come back for it later.$"

gUnknown_81BF89F:: @ 81BF89F
	.string "We can raise two of your POKéMON.\p"
	.string "Would you like us to raise one\n"
	.string "more POKéMON for you?$"

gUnknown_81BF8F6:: @ 81BF8F6
	.string "My husband was looking for you.$"

gUnknown_81BF916:: @ 81BF916
	.string "Oh, fine, then.\n"
	.string "Come again.$"

gUnknown_81BF932:: @ 81BF932
	.string "You don't have enough money…$"

gUnknown_81BF94F:: @ 81BF94F
	.string "Will you take back the other one,\n"
	.string "too?$"

gUnknown_81BF976:: @ 81BF976
	.string "Fine.\n"
	.string "Come again.$"

gUnknown_81BF988:: @ 81BF988
	.string "Ah, it's you!\n"
	.string "Good to see you.\p"
	.string "Your POKéMON can only be doing\n"
	.string "good!$"

gUnknown_81BF9CC:: @ 81BF9CC
	.string "By level, your {STR_VAR_1} has\n"
	.string "grown by {STR_VAR_2}.$"

gUnknown_81BF9EF:: @ 81BF9EF
	.string "Your POKéMON party is full.\n"
	.string "Make room, then come see me.$"

Text_1BFA28:: @ 81BFA28
	.string "どっちの　ポケモンを　ひきとるかい？$"

gUnknown_81BFA3B:: @ 81BFA3B
	.string "If you want your {STR_VAR_1} back,\n"
	.string "it will cost ¥{STR_VAR_2}.$"

gUnknown_81BFA67:: @ 81BFA67
	.string "Perfect!\n"
	.string "Here's your POKéMON.$"

gUnknown_81BFA85:: @ 81BFA85
	.string "{PLAYER} took back {STR_VAR_1} from\n"
	.string "the DAY-CARE LADY.$"

gUnknown_81BFAAD:: @ 81BFAAD
	.string "Oh? But you have just one\n"
	.string "POKéMON.\p"
	.string "Come back another time.$"

gUnknown_81BFAE8:: @ 81BFAE8
	.string "Will you take your POKéMON back?$"

gUnknown_81BFB09:: @ 81BFB09
	.string "If you leave me that POKéMON,\n"
	.string "what will you battle with?\p"
	.string "Come back another time.$"

Text_1BFB5A:: @ 81BFB5A
	.string "Huh?$"
