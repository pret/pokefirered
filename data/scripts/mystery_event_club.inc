.equ GAVE_PROFILE,  VAR_TEMP_1

MysteryEventClub_EventScript_Woman:: @ 81BEE16
	lock
	faceplayer
	compare GAVE_PROFILE, TRUE
	goto_if_eq EventScript_AlreadyGaveProfile
	goto_if_set FLAG_SYS_SET_TRAINER_CARD_PROFILE, EventScript_GivenProfileBefore
	msgbox Text_IdLoveToHearYourProfile
	goto EventScript_AskForProfile
	end

EventScript_AlreadyGaveProfile: @ 81BEE3A
	msgbox Text_TellMoreNextTime
	release
	end

EventScript_AskForProfile: @ 81BEE44
	message Text_TellMeWhatsYourProfile
	waitmessage
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO_2, FALSE
	switch VAR_RESULT
	case 0, EventScript_AcceptGiveProfile
	case 1, EventScript_DeclineGiveProfile
	case 2, EventScript_ProfileInfo
	case SCR_MENU_CANCEL, EventScript_DeclineGiveProfile
	end

EventScript_ProfileInfo: @ 81BEE81
	msgbox Text_ExplainProfile
	goto EventScript_AskForProfile
	end

EventScript_AcceptGiveProfile: @ 81BEE8F
	msgbox Text_WhatsYourProfile
	closemessage
	goto EventScript_GiveProfile
	end

EventScript_CancelGiveProfile: @ 81BEE9E
	msgbox Text_DecidedNotTo
	release
	end

EventScript_GaveProfile: @ 81BEEA8
	setvar GAVE_PROFILE, TRUE
	setvar VAR_0x8004, 0
	special ShowEasyChatMessage
	waitmessage
	delay 80
	msgbox Text_ProfileSaysSomethingAboutYou
	release
	end

EventScript_DeclineGiveProfile: @ 81BEEC3
	msgbox Text_DontBeLikeThat
	release
	end

EventScript_GivenProfileBefore: @ 81BEECD
	msgbox Text_HiWeMeetAgain
	goto EventScript_AskForNewProfile
	end

EventScript_AskForNewProfile: @ 81BEEDB
	message Text_ChangeYourProfile
	waitmessage
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO_2, FALSE
	switch VAR_RESULT
	case 0, EventScript_AcceptGiveNewProfile
	case 1, EventScript_DeclineGiveNewProfile
	case 2, EventScript_ProfileInfo2
	case SCR_MENU_CANCEL, EventScript_DeclineGiveNewProfile
	end

EventScript_ProfileInfo2: @ 81BEF18
	msgbox Text_ExplainProfile
	goto EventScript_AskForNewProfile
	end

EventScript_AcceptGiveNewProfile: @ 81BEF26
	msgbox Text_WhatAreYouLikeNow
	closemessage
	goto EventScript_GiveProfile
	end

EventScript_DeclineGiveNewProfile: @ 81BEF35
	msgbox Text_LikeProfileWayItIs
	release
	end

EventScript_GaveSpecialProfile: @ 81BEF3F
	setvar GAVE_PROFILE, TRUE
	setvar VAR_0x8004, 0
	special ShowEasyChatMessage
	waitmessage
	delay 80
	msgbox Text_HeardThatBefore
	release
	end

EventScript_GiveProfile: @ 81BEF5A
	setvar VAR_0x8004, EASY_CHAT_TYPE_PROFILE
	call Common_ShowEasyChatScreen
	lock
	faceplayer
	compare VAR_0x8004, 0
	goto_if_eq EventScript_GaveSpecialProfile
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_CancelGiveProfile
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_GaveProfile
	end

Text_IdLoveToHearYourProfile: @ 81BEF88
	.string "Hi, glad to meet you!\p"
	.string "…That's unfriendly of you.\n"
	.string "How about saying hi back?\p"
	.string "So, come on, tell me about\n"
	.string "yourself.\p"
	.string "I'd love to hear your profile!$"

Text_TellMeWhatsYourProfile: @ 81BF017
	.string "Tell me something good about\n"
	.string "yourself. What's your profile?$"

Text_ExplainProfile: @ 81BF053
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

Text_WhatsYourProfile: @ 81BF166
	.string "What's your profile?$"

Text_DontBeLikeThat: @ 81BF17B
	.string "Aww… Don't be like that.\n"
	.string "You can tell me your profile.$"

Text_DecidedNotTo: @ 81BF1B2
	.string "Oh, you've decided not to?\n"
	.string "You're fickle, aren't you?$"

Text_HiWeMeetAgain: @ 81BF1E8
	.string "Hi!\n"
	.string "We meet again!$"

Text_ChangeYourProfile: @ 81BF1FB
	.string "Would you like to change your\n"
	.string "profile?$"

Text_WhatAreYouLikeNow: @ 81BF222
	.string "What are you like now?\n"
	.string "I'd really like to know.$"

Text_LikeProfileWayItIs: @ 81BF252
	.string "Okay, you like your profile the\n"
	.string "way it is.\p"
	.string "I think so, too.$"

Text_ProfileSaysSomethingAboutYou: @ 81BF28E
	.string "Hmhm…\p"
	.string "Your profile really says something\n"
	.string "about who you are.\p"
	.string "Now that I know you better, it \n"
	.string "makes us better friends than ever!$"

Text_HeardThatBefore: @ 81BF30D
	.string "Oh, I've heard that before…\p"
	.string "My cousin, who lives far away,\n"
	.string "always used to say that, I think.$"

Text_TellMoreNextTime: @ 81BF36A
	.string "Please tell me more about\n"
	.string "yourself next time!$"
