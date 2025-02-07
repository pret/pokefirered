# 1 "data/maps/CeruleanCity_House1/scripts.pory"

# 2 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_MapScripts::
# 3 "data/maps/CeruleanCity_House1/scripts.pory"
	.byte 0
# 4 "data/maps/CeruleanCity_House1/scripts.pory"

# 5 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_BadgeGuy::
# 6 "data/maps/CeruleanCity_House1/scripts.pory"
	lock
# 7 "data/maps/CeruleanCity_House1/scripts.pory"
	faceplayer
# 8 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_BadgesHaveAmazingSecrets
# 9 "data/maps/CeruleanCity_House1/scripts.pory"
	message CeruleanCity_House1_Text_DescribeWhichBadge
# 10 "data/maps/CeruleanCity_House1/scripts.pory"
	waitmessage
# 11 "data/maps/CeruleanCity_House1/scripts.pory"
	setvar VAR_0x8004, LISTMENU_BADGES
# 12 "data/maps/CeruleanCity_House1/scripts.pory"
	special ListMenu
# 13 "data/maps/CeruleanCity_House1/scripts.pory"
	waitstate
# 14 "data/maps/CeruleanCity_House1/scripts.pory"
	switch VAR_RESULT
# 15 "data/maps/CeruleanCity_House1/scripts.pory"
	case 0, CeruleanCity_House1_EventScript_DescribeBoulderBadge
# 16 "data/maps/CeruleanCity_House1/scripts.pory"
	case 1, CeruleanCity_House1_EventScript_DescribeCascadeBadge
# 17 "data/maps/CeruleanCity_House1/scripts.pory"
	case 2, CeruleanCity_House1_EventScript_DescribeThunderBadge
# 18 "data/maps/CeruleanCity_House1/scripts.pory"
	case 3, CeruleanCity_House1_EventScript_DescribeRainbowBadge
# 19 "data/maps/CeruleanCity_House1/scripts.pory"
	case 4, CeruleanCity_House1_EventScript_DescribeSoulBadge
# 20 "data/maps/CeruleanCity_House1/scripts.pory"
	case 5, CeruleanCity_House1_EventScript_DescribeMarshBadge
# 21 "data/maps/CeruleanCity_House1/scripts.pory"
	case 6, CeruleanCity_House1_EventScript_DescribeVolcanoBadge
# 22 "data/maps/CeruleanCity_House1/scripts.pory"
	case 7, CeruleanCity_House1_EventScript_DescribeEarthBadge
# 23 "data/maps/CeruleanCity_House1/scripts.pory"
	case 8, CeruleanCity_House1_EventScript_StopDescribingBadges
# 24 "data/maps/CeruleanCity_House1/scripts.pory"
	case 127, CeruleanCity_House1_EventScript_StopDescribingBadges
# 25 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 26 "data/maps/CeruleanCity_House1/scripts.pory"

# 27 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeAnotherBadge::
# 28 "data/maps/CeruleanCity_House1/scripts.pory"
	message CeruleanCity_House1_Text_DescribeWhichBadge
# 29 "data/maps/CeruleanCity_House1/scripts.pory"
	waitmessage
# 30 "data/maps/CeruleanCity_House1/scripts.pory"
	special ReturnToListMenu
# 31 "data/maps/CeruleanCity_House1/scripts.pory"
	waitstate
# 32 "data/maps/CeruleanCity_House1/scripts.pory"
	switch VAR_RESULT
# 33 "data/maps/CeruleanCity_House1/scripts.pory"
	case 0, CeruleanCity_House1_EventScript_DescribeBoulderBadge
# 34 "data/maps/CeruleanCity_House1/scripts.pory"
	case 1, CeruleanCity_House1_EventScript_DescribeCascadeBadge
# 35 "data/maps/CeruleanCity_House1/scripts.pory"
	case 2, CeruleanCity_House1_EventScript_DescribeThunderBadge
# 36 "data/maps/CeruleanCity_House1/scripts.pory"
	case 3, CeruleanCity_House1_EventScript_DescribeRainbowBadge
# 37 "data/maps/CeruleanCity_House1/scripts.pory"
	case 4, CeruleanCity_House1_EventScript_DescribeSoulBadge
# 38 "data/maps/CeruleanCity_House1/scripts.pory"
	case 5, CeruleanCity_House1_EventScript_DescribeMarshBadge
# 39 "data/maps/CeruleanCity_House1/scripts.pory"
	case 6, CeruleanCity_House1_EventScript_DescribeVolcanoBadge
# 40 "data/maps/CeruleanCity_House1/scripts.pory"
	case 7, CeruleanCity_House1_EventScript_DescribeEarthBadge
# 41 "data/maps/CeruleanCity_House1/scripts.pory"
	case 8, CeruleanCity_House1_EventScript_StopDescribingBadges
# 42 "data/maps/CeruleanCity_House1/scripts.pory"
	case 127, CeruleanCity_House1_EventScript_StopDescribingBadges
# 43 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 44 "data/maps/CeruleanCity_House1/scripts.pory"

# 45 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeBoulderBadge::
# 46 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_AttackStatFlash
# 47 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 48 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 49 "data/maps/CeruleanCity_House1/scripts.pory"

# 50 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeCascadeBadge::
# 51 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_ObeyLv30Cut
# 52 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 53 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 54 "data/maps/CeruleanCity_House1/scripts.pory"

# 55 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeThunderBadge::
# 56 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_SpeedStatFly
# 57 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 58 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 59 "data/maps/CeruleanCity_House1/scripts.pory"

# 60 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeRainbowBadge::
# 61 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_ObeyLv50Strength
# 62 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 63 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 64 "data/maps/CeruleanCity_House1/scripts.pory"

# 65 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeSoulBadge::
# 66 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_DefenseStatSurf
# 67 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 68 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 69 "data/maps/CeruleanCity_House1/scripts.pory"

# 70 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeMarshBadge::
# 71 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_ObeyLv70RockSmash
# 72 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 73 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 74 "data/maps/CeruleanCity_House1/scripts.pory"

# 75 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeVolcanoBadge::
# 76 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_SpStatsWaterfall
# 77 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 78 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 79 "data/maps/CeruleanCity_House1/scripts.pory"

# 80 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_DescribeEarthBadge::
# 81 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_AllMonsWillObeyYou
# 82 "data/maps/CeruleanCity_House1/scripts.pory"
	goto CeruleanCity_House1_EventScript_DescribeAnotherBadge
# 83 "data/maps/CeruleanCity_House1/scripts.pory"
	end
# 84 "data/maps/CeruleanCity_House1/scripts.pory"

# 85 "data/maps/CeruleanCity_House1/scripts.pory"
CeruleanCity_House1_EventScript_StopDescribingBadges::
# 86 "data/maps/CeruleanCity_House1/scripts.pory"
	msgbox CeruleanCity_House1_Text_ComeVisitAnytime
# 87 "data/maps/CeruleanCity_House1/scripts.pory"
	release
# 88 "data/maps/CeruleanCity_House1/scripts.pory"
	end
