SixIsland_GreenPath_MapScripts:: @ 8168B2D
	.byte 0

SixIsland_GreenPath_EventScript_RightRouteSign:: @ 8168B2E
	msgbox SixIsland_GreenPath_Text_LeftRouteSign, MSGBOX_SIGN
	end

SixIsland_GreenPath_EventScript_LeftRouteSign:: @ 8168B37
	msgbox SixIsland_GreenPath_Text_RightRouteSign, MSGBOX_SIGN
	end
