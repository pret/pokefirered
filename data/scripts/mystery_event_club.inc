PewterCity_PokemonCenter_1F_EventScript_1BEE16:: @ 81BEE16
	lock
	faceplayer
	compare VAR_TEMP_1, 1
	goto_if eq, EventScript_1BEE3A
	checkflag FLAG_SYS_SET_TRAINER_CARD_PROFILE
	goto_if TRUE, EventScript_1BEECD
	msgbox Text_1BEF88
	goto EventScript_1BEE44
	end

EventScript_1BEE3A:: @ 81BEE3A
	msgbox gUnknown_81BF36A
	release
	end

EventScript_1BEE44:: @ 81BEE44
	message Text_1BF017
	waitmessage
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO_2, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BEE8F
	case 1, EventScript_1BEEC3
	case 2, EventScript_1BEE81
	case SCR_MENU_CANCEL, EventScript_1BEEC3
	end

EventScript_1BEE81:: @ 81BEE81
	msgbox gUnknown_81BF053
	goto EventScript_1BEE44
	end

EventScript_1BEE8F:: @ 81BEE8F
	msgbox gUnknown_81BF166
	closemessage
	goto EventScript_1BEF5A
	end

EventScript_1BEE9E:: @ 81BEE9E
	msgbox gUnknown_81BF1B2
	release
	end

EventScript_1BEEA8:: @ 81BEEA8
	setvar VAR_TEMP_1, 1
	setvar VAR_0x8004, 0
	special Special_BufferEasyChatMessage
	waitmessage
	delay 80
	msgbox gUnknown_81BF28E
	release
	end

EventScript_1BEEC3:: @ 81BEEC3
	msgbox gUnknown_81BF17B
	release
	end

EventScript_1BEECD:: @ 81BEECD
	msgbox gUnknown_81BF1E8
	goto EventScript_1BEEDB
	end

EventScript_1BEEDB:: @ 81BEEDB
	message Text_1BF1FB
	waitmessage
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO_2, FALSE
	switch VAR_RESULT
	case 0, EventScript_1BEF26
	case 1, EventScript_1BEF35
	case 2, EventScript_1BEF18
	case SCR_MENU_CANCEL, EventScript_1BEF35
	end

EventScript_1BEF18:: @ 81BEF18
	msgbox gUnknown_81BF053
	goto EventScript_1BEEDB
	end

EventScript_1BEF26:: @ 81BEF26
	msgbox gUnknown_81BF222
	closemessage
	goto EventScript_1BEF5A
	end

EventScript_1BEF35:: @ 81BEF35
	msgbox gUnknown_81BF252
	release
	end

EventScript_1BEF3F:: @ 81BEF3F
	setvar VAR_TEMP_1, 1
	setvar VAR_0x8004, 0
	special Special_BufferEasyChatMessage
	waitmessage
	delay 80
	msgbox gUnknown_81BF30D
	release
	end

EventScript_1BEF5A:: @ 81BEF5A
	setvar VAR_0x8004, 0
	call EventScript_1A6AC0
	lock
	faceplayer
	compare VAR_0x8004, 0
	goto_if eq, EventScript_1BEF3F
	compare VAR_RESULT, 0
	goto_if eq, EventScript_1BEE9E
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1BEEA8
	end

Text_1BEF88:: @ 81BEF88
	.string "Hi, glad to meet you!\p"
	.string "…That's unfriendly of you.\n"
	.string "How about saying hi back?\p"
	.string "So, come on, tell me about\n"
	.string "yourself.\p"
	.string "I'd love to hear your profile!$"

Text_1BF017:: @ 81BF017
	.string "Tell me something good about\n"
	.string "yourself. What's your profile?$"

gUnknown_81BF053:: @ 81BF053
	.string "A profile is written using four\n"
	.string "words or phrases.\p"
	.string "There're plenty of words to choose\n"
	.string "from for your profile.\p"
	.string "The words and phrases are placed\n"
	.string "in several convenient groups.\p"
	.string "First, choose a group, then choose\n"
	.string "a word or phrase.\p"
	.string "…It's easier than it sounds.\n"
	.string "Why don't you try it?$"

gUnknown_81BF166:: @ 81BF166
	.string "What's your profile?$"

gUnknown_81BF17B:: @ 81BF17B
	.string "Aww… Don't be like that.\n"
	.string "You can tell me your profile.$"

gUnknown_81BF1B2:: @ 81BF1B2
	.string "Oh, you've decided not to?\n"
	.string "You're fickle, aren't you?$"

gUnknown_81BF1E8:: @ 81BF1E8
	.string "Hi!\n"
	.string "We meet again!$"

Text_1BF1FB:: @ 81BF1FB
	.string "Would you like to change your\n"
	.string "profile?$"

gUnknown_81BF222:: @ 81BF222
	.string "What are you like now?\n"
	.string "I'd really like to know.$"

gUnknown_81BF252:: @ 81BF252
	.string "Okay, you like your profile the\n"
	.string "way it is.\p"
	.string "I think so, too.$"

gUnknown_81BF28E:: @ 81BF28E
	.string "Hmhm…\p"
	.string "Your profile really says something\n"
	.string "about who you are.\p"
	.string "Now that I know you better, it \n"
	.string "makes us better friends than ever!$"

gUnknown_81BF30D:: @ 81BF30D
	.string "Oh, I've heard that before…\p"
	.string "My cousin, who lives far away,\n"
	.string "always used to say that, I think.$"

gUnknown_81BF36A:: @ 81BF36A
	.string "Please tell me more about\n"
	.string "yourself next time!$"
