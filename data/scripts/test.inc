Test_EventScript_NPC:: @ 81C5552
	msgbox Test_Text_WelcomeToWorldOfPokemon, MSGBOX_NPC
	end

EventScript_TestSignpostMsg:: @ 81C555B
	msgbox Test_Text_ThisIsASignpost, MSGBOX_SIGN
	end

Test_EventScript_CoordEvent:: @ 81C5564
	msgbox Test_Text_ThisIsACoordEvent, MSGBOX_SIGN
	end

Test_Text_WelcomeToWorldOfPokemon:: @ 81C556D
	.string "テストよう　メッセージです！\n"
	.string "ポケモンの　せかいへ　ようこそ！$"

Test_Text_ThisIsASignpost:: @ 81C558D
	.string "テストよう　メッセージです！\n"
	.string "かんばん　です$"

Test_Text_ThisIsACoordEvent:: @ 81C55A4
	.string "テストよう　メッセージです！\n"
	.string "ざひょう　チェックの　イベントです$"

	.align 2
Test_Text_Empty:: @ 81C55C8
	.string "$"
