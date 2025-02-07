# 1 "data/maps/CeruleanCity_House4/scripts.pory"

# 2 "data/maps/CeruleanCity_House4/scripts.pory"
.set LOCALID_WONDER_NEWS_BERRY_MAN, 1
# 3 "data/maps/CeruleanCity_House4/scripts.pory"

# 4 "data/maps/CeruleanCity_House4/scripts.pory"
.set REWARD_TYPE, VAR_0x8004
# 5 "data/maps/CeruleanCity_House4/scripts.pory"
.set REWARD_ITEM, VAR_0x8008
# 6 "data/maps/CeruleanCity_House4/scripts.pory"

# 7 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_MapScripts::
# 8 "data/maps/CeruleanCity_House4/scripts.pory"
	.byte 0
# 9 "data/maps/CeruleanCity_House4/scripts.pory"

# 10 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_WonderNewsBerryMan::
# 11 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 12 "data/maps/CeruleanCity_House4/scripts.pory"
	special QuestLog_CutRecording
# 13 "data/maps/CeruleanCity_House4/scripts.pory"
	lock
# 14 "data/maps/CeruleanCity_House4/scripts.pory"
	specialvar REWARD_TYPE, WonderNews_GetRewardInfo
# 15 "data/maps/CeruleanCity_House4/scripts.pory"
	copyvar REWARD_ITEM, VAR_RESULT
# 16 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq REWARD_TYPE, NEWS_REWARD_NONE,       CeruleanCity_House4_EventScript_NoNews
# 17 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq REWARD_TYPE, NEWS_REWARD_RECV_SMALL, CeruleanCity_House4_EventScript_Reward_RecvSmall
# 18 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq REWARD_TYPE, NEWS_REWARD_RECV_BIG,   CeruleanCity_House4_EventScript_Reward_RecvBig
# 19 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq REWARD_TYPE, NEWS_REWARD_WAITING,    CeruleanCity_House4_EventScript_Waiting
# 20 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq REWARD_TYPE, NEWS_REWARD_SENT_SMALL, CeruleanCity_House4_EventScript_Reward_SentSmall
# 21 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq REWARD_TYPE, NEWS_REWARD_SENT_BIG,   CeruleanCity_House4_EventScript_Reward_SentBig
# 22 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq REWARD_TYPE, NEWS_REWARD_AT_MAX,     CeruleanCity_House4_EventScript_AtMax
# 23 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 24 "data/maps/CeruleanCity_House4/scripts.pory"

# 25 "data/maps/CeruleanCity_House4/scripts.pory"
@ Mystery Gift is not enabled, or the player has no saved Wonder News
# 26 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_NoNews::
# 27 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_NothingEntertaining
# 28 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 29 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 30 "data/maps/CeruleanCity_House4/scripts.pory"

# 31 "data/maps/CeruleanCity_House4/scripts.pory"
@ Small reward for receiving Wonder News from friend
# 32 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_Reward_RecvSmall::
# 33 "data/maps/CeruleanCity_House4/scripts.pory"
	call CeruleanCity_House4_EventScript_MovementReactionToNews
# 34 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_NewNewsInformativeHaveThis
# 35 "data/maps/CeruleanCity_House4/scripts.pory"
	giveitem REWARD_ITEM
# 36 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_House4_EventScript_NoRoomForBerries
# 37 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 38 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 39 "data/maps/CeruleanCity_House4/scripts.pory"

# 40 "data/maps/CeruleanCity_House4/scripts.pory"
@ Big reward for receiving Wonder News from non-friend source
# 41 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_Reward_RecvBig::
# 42 "data/maps/CeruleanCity_House4/scripts.pory"
	call CeruleanCity_House4_EventScript_MovementReactionToNews
# 43 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_IncredibleNewsHaveBerries
# 44 "data/maps/CeruleanCity_House4/scripts.pory"
	giveitem REWARD_ITEM, 4
# 45 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_House4_EventScript_NoRoomForBerries
# 46 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 47 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 48 "data/maps/CeruleanCity_House4/scripts.pory"

# 49 "data/maps/CeruleanCity_House4/scripts.pory"
@ Player has not recently sent Wonder News
# 50 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_Waiting::
# 51 "data/maps/CeruleanCity_House4/scripts.pory"
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Common_Movement_FacePlayer
# 52 "data/maps/CeruleanCity_House4/scripts.pory"
	waitmovement 0
# 53 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_WishCouldShareNewsWithOthers
# 54 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 55 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 56 "data/maps/CeruleanCity_House4/scripts.pory"

# 57 "data/maps/CeruleanCity_House4/scripts.pory"
@ Small reward for sending Wonder News every 1-3 times
# 58 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_Reward_SentSmall::
# 59 "data/maps/CeruleanCity_House4/scripts.pory"
	call CeruleanCity_House4_EventScript_MovementReactionToNews
# 60 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_ThanksForSpreadingNewsTakeThis
# 61 "data/maps/CeruleanCity_House4/scripts.pory"
	giveitem REWARD_ITEM
# 62 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_House4_EventScript_NoRoomForBerries
# 63 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 64 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 65 "data/maps/CeruleanCity_House4/scripts.pory"

# 66 "data/maps/CeruleanCity_House4/scripts.pory"
@ Big reward for sending Wonder News every 4th time
# 67 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_Reward_SentBig::
# 68 "data/maps/CeruleanCity_House4/scripts.pory"
	call CeruleanCity_House4_EventScript_MovementReactionToNews
# 69 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_MagnificentNewsSpreadHaveBerries
# 70 "data/maps/CeruleanCity_House4/scripts.pory"
	giveitem REWARD_ITEM, 4
# 71 "data/maps/CeruleanCity_House4/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, CeruleanCity_House4_EventScript_NoRoomForBerries
# 72 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 73 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 74 "data/maps/CeruleanCity_House4/scripts.pory"

# 75 "data/maps/CeruleanCity_House4/scripts.pory"
@ Player has hit reward limit and must wait to receive new rewards
# 76 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_AtMax::
# 77 "data/maps/CeruleanCity_House4/scripts.pory"
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Common_Movement_FacePlayer
# 78 "data/maps/CeruleanCity_House4/scripts.pory"
	waitmovement 0
# 79 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_EnjoyingMyselfWithAllSortsOfNews
# 80 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 81 "data/maps/CeruleanCity_House4/scripts.pory"
	end
# 82 "data/maps/CeruleanCity_House4/scripts.pory"

# 83 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_MovementReactionToNews::
# 84 "data/maps/CeruleanCity_House4/scripts.pory"
	playse SE_PIN
# 85 "data/maps/CeruleanCity_House4/scripts.pory"
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Common_Movement_ExclamationMark
# 86 "data/maps/CeruleanCity_House4/scripts.pory"
	waitmovement 0
# 87 "data/maps/CeruleanCity_House4/scripts.pory"
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Common_Movement_FacePlayer
# 88 "data/maps/CeruleanCity_House4/scripts.pory"
	waitmovement 0
# 89 "data/maps/CeruleanCity_House4/scripts.pory"
	applymovement LOCALID_WONDER_NEWS_BERRY_MAN, Common_Movement_Delay48
# 90 "data/maps/CeruleanCity_House4/scripts.pory"
	waitmovement 0
# 91 "data/maps/CeruleanCity_House4/scripts.pory"
	return
# 92 "data/maps/CeruleanCity_House4/scripts.pory"

# 93 "data/maps/CeruleanCity_House4/scripts.pory"
CeruleanCity_House4_EventScript_NoRoomForBerries::
# 94 "data/maps/CeruleanCity_House4/scripts.pory"
	msgbox CeruleanCity_House4_Text_YourBerryPouchIsFull
# 95 "data/maps/CeruleanCity_House4/scripts.pory"
	release
# 96 "data/maps/CeruleanCity_House4/scripts.pory"
	end
