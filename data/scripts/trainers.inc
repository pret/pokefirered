Route3_EventScript_1A93C9:: @ 81A93C9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_BEN, 0, Text_183560, Text_1835A0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A93F0
	msgbox Text_1835B4, MSGBOX_AUTOCLOSE
	end

EventScript_1A93F0:: @ 81A93F0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_BEN, 0, Text_1C149D, Text_1835A0
	msgbox Text_1835B4, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_1A9407:: @ 81A9407
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_CALVIN, 0, Text_183786, Text_1837BD
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A942E
	msgbox Text_1837CF, MSGBOX_AUTOCLOSE
	end

EventScript_1A942E:: @ 81A942E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_CALVIN, 0, Text_1C1588, Text_1837BD
	msgbox Text_1837CF, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_1A9445:: @ 81A9445
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_COLTON, 0, Text_1834E6, Text_183509
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A946C
	msgbox Text_18351C, MSGBOX_AUTOCLOSE
	end

EventScript_1A946C:: @ 81A946C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_COLTON, 0, Text_1C147A, Text_183509
	msgbox Text_18351C, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_1A9483:: @ 81A9483
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_GREG, 0, Text_183682, Text_1836B3
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A94AA
	msgbox Text_1836D9, MSGBOX_AUTOCLOSE
	end

EventScript_1A94AA:: @ 81A94AA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_GREG, 0, Text_1C1521, Text_1836B3
	msgbox Text_1836D9, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_1A94C1:: @ 81A94C1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_JAMES, 0, Text_183807, Text_183837
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A94E8
	msgbox Text_183849, MSGBOX_AUTOCLOSE
	end

EventScript_1A94E8:: @ 81A94E8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_JAMES, 0, Text_1C15C5, Text_183837
	msgbox Text_183849, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_1A94FF:: @ 81A94FF
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_JANICE, 0, Text_183616, Text_18363F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9526
	msgbox Text_18364C, MSGBOX_AUTOCLOSE
	end

EventScript_1A9526:: @ 81A9526
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_JANICE, 0, Text_1C14F3, Text_18363F
	msgbox Text_18364C, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_1A953D:: @ 81A953D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_SALLY, 0, Text_18371B, Text_183746
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9564
	msgbox Text_18374F, MSGBOX_AUTOCLOSE
	end

EventScript_1A9564:: @ 81A9564
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_SALLY, 0, Text_1C155D, Text_183746
	msgbox Text_18374F, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_1A957B:: @ 81A957B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_ROBIN, 0, Text_18387A, Text_183891
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A95A2
	msgbox Text_18389C, MSGBOX_AUTOCLOSE
	end

EventScript_1A95A2:: @ 81A95A2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_ROBIN, 0, Text_1C15F9, Text_183891
	msgbox Text_18389C, MSGBOX_AUTOCLOSE
	end

Route4_EventScript_1A95B9:: @ 81A95B9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_CRISSY, 0, Text_183906, Text_183938
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A95E0
	msgbox Text_183957, MSGBOX_AUTOCLOSE
	end

EventScript_1A95E0:: @ 81A95E0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_CRISSY, 0, Text_1C160F, Text_183938
	msgbox Text_183957, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_1A95F7:: @ 81A95F7
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_TIMMY, 0, Text_188F76, Text_188F95
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A961E
	msgbox Text_188FA7, MSGBOX_AUTOCLOSE
	end

EventScript_1A961E:: @ 81A961E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_TIMMY, 0, Text_1C3657, Text_188F95
	msgbox Text_188FA7, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_1A9635:: @ 81A9635
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_CALE, 0, Text_18901B, Text_18908C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A965C
	msgbox Text_18909E, MSGBOX_AUTOCLOSE
	end

EventScript_1A965C:: @ 81A965C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_CALE, 0, Text_1C36DA, Text_18908C
	msgbox Text_18909E, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_1A9673:: @ 81A9673
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_RELI, 0, Text_188F2C, Text_188F46
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A969A
	msgbox Text_188F53, MSGBOX_AUTOCLOSE
	end

EventScript_1A969A:: @ 81A969A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_RELI, 0, Text_1C3624, Text_188F46
	msgbox Text_188F53, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_1A96B1:: @ 81A96B1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_ALI, 0, Text_188FC9, Text_188FE7
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A96D8
	msgbox Text_188FF9, MSGBOX_AUTOCLOSE
	end

EventScript_1A96D8:: @ 81A96D8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_ALI, 0, Text_1C3685, Text_188FE7
	msgbox Text_188FF9, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_1A96EF:: @ 81A96EF
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_SHANE, 0, Text_188E74, Text_188E94
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9716
	msgbox Text_188EA3, MSGBOX_AUTOCLOSE
	end

EventScript_1A9716:: @ 81A9716
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_SHANE, 0, Text_1C35EE, Text_188E94
	msgbox Text_188EA3, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_1A972D:: @ 81A972D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_ETHAN, 0, Text_188ED9, Text_188EFA
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9754
	msgbox Text_188F0A, MSGBOX_AUTOCLOSE
	end

EventScript_1A9754:: @ 81A9754
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_ETHAN, 0, Text_1C360E, Text_188EFA
	msgbox Text_188F0A, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A976B:: @ 81A976B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_JOEY, 0, Text_1890C0, Text_1890E6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9792
	msgbox Text_1890F5, MSGBOX_AUTOCLOSE
	end

EventScript_1A9792:: @ 81A9792
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_JOEY, 0, Text_1C33E7, Text_1890E6
	msgbox Text_1890F5, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A97A9:: @ 81A97A9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_DAN, 0, Text_189165, Text_1891A6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A97D0
	msgbox Text_1891B3, MSGBOX_AUTOCLOSE
	end

EventScript_1A97D0:: @ 81A97D0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_DAN, 0, Text_1C3404, Text_1891A6
	msgbox Text_1891B3, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A97E7:: @ 81A97E7
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_CHAD, 0, Text_1892A9, Text_1892D9
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A980E
	msgbox Text_1892EF, MSGBOX_AUTOCLOSE
	end

EventScript_1A980E:: @ 81A980E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_CHAD, 0, Text_1C34D4, Text_1892D9
	msgbox Text_1892EF, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A9825:: @ 81A9825
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_KELSEY, 0, Text_189247, Text_189261
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A984C
	msgbox Text_189281, MSGBOX_AUTOCLOSE
	end

EventScript_1A984C:: @ 81A984C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_KELSEY, 0, Text_1C349C, Text_189261
	msgbox Text_189281, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A9863:: @ 81A9863
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_HALEY, 0, Text_189333, Text_189364
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A988A
	msgbox Text_189378, MSGBOX_AUTOCLOSE
	end

EventScript_1A988A:: @ 81A988A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_HALEY, 0, Text_1C350A, Text_189364
	msgbox Text_189378, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A98A1:: @ 81A98A1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_FRANKLIN, 0, Text_1893A7, Text_1893EA
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A98C8
	msgbox Text_1893FB, MSGBOX_AUTOCLOSE
	end

EventScript_1A98C8:: @ 81A98C8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_FRANKLIN, 0, Text_1C353B, Text_1893EA
	msgbox Text_1893FB, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A98DF:: @ 81A98DF
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_NOB, 0, Text_189423, Text_189459
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9906
	msgbox Text_18947E, MSGBOX_AUTOCLOSE
	end

EventScript_1A9906:: @ 81A9906
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_NOB, 0, Text_1C357E, Text_189459
	msgbox Text_18947E, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A991D:: @ 81A991D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_WAYNE, 0, Text_1894DE, Text_18950A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9944
	msgbox Text_18951C, MSGBOX_AUTOCLOSE
	end

EventScript_1A9944:: @ 81A9944
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_WAYNE, 0, Text_1C35BC, Text_18950A
	msgbox Text_18951C, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_1A995B:: @ 81A995B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_FLINT, 0, Text_1891EB, Text_189212
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9982
	msgbox Text_18921D, MSGBOX_AUTOCLOSE
	end

EventScript_1A9982:: @ 81A9982
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_FLINT, 0, Text_1C3445, Text_189212
	msgbox Text_18921D, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_1A9999:: @ 81A9999
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_KEIGO, 0, Text_183E9F, Text_183EC0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A99C0
	msgbox Text_183ED4, MSGBOX_AUTOCLOSE
	end

EventScript_1A99C0:: @ 81A99C0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_KEIGO, 0, Text_1C16E2, Text_183EC0
	msgbox Text_183ED4, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_1A99D7:: @ 81A99D7
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_ELIJAH, 0, Text_183FF0, Text_18401A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A99FE
	msgbox Text_18402B, MSGBOX_AUTOCLOSE
	end

EventScript_1A99FE:: @ 81A99FE
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_ELIJAH, 0, Text_1C176B, Text_18401A
	msgbox Text_18402B, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_1A9A15:: @ 81A9A15
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_RICKY, 0, Text_183E04, Text_183E2A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9A3C
	msgbox Text_183E3C, MSGBOX_AUTOCLOSE
	end

EventScript_1A9A3C:: @ 81A9A3C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_RICKY, 0, Text_1C163C, Text_183E2A
	msgbox Text_183E3C, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_1A9A53:: @ 81A9A53
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_JEFF, 0, Text_183F07, Text_183F24
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9A7A
	msgbox Text_183F51, MSGBOX_AUTOCLOSE
	end

EventScript_1A9A7A:: @ 81A9A7A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_JEFF, 0, Text_1C1723, Text_183F24
	msgbox Text_183F51, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_1A9A91:: @ 81A9A91
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_NANCY, 0, Text_183E4E, Text_183E79
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9AB8
	msgbox Text_183E8D, MSGBOX_AUTOCLOSE
	end

EventScript_1A9AB8:: @ 81A9AB8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_NANCY, 0, Text_1C166D, Text_183E79
	msgbox Text_183E8D, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_1A9ACF:: @ 81A9ACF
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_ISABELLE, 0, Text_183F90, Text_183FAB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9AF6
	msgbox Text_183FC4, MSGBOX_AUTOCLOSE
	end

EventScript_1A9AF6:: @ 81A9AF6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_ISABELLE, 0, Text_1C1746, Text_183FAB
	msgbox Text_183FC4, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9B0D:: @ 81A9B0D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_EDDIE, 0, Text_184FBD, Text_184FD8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9B34
	msgbox Text_184FEF, MSGBOX_AUTOCLOSE
	end

EventScript_1A9B34:: @ 81A9B34
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_EDDIE, 0, Text_1C1DB5, Text_184FD8
	msgbox Text_184FEF, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9B4B:: @ 81A9B4B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_DILLON, 0, Text_18506A, Text_18509B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9B72
	msgbox Text_1850CF, MSGBOX_AUTOCLOSE
	end

EventScript_1A9B72:: @ 81A9B72
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_DILLON, 0, Text_1C1E1F, Text_18509B
	msgbox Text_1850CF, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9B89:: @ 81A9B89
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_YASU, 0, Text_18517B, Text_1851AC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9BB0
	msgbox Text_1851D2, MSGBOX_AUTOCLOSE
	end

EventScript_1A9BB0:: @ 81A9BB0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_YASU, 0, Text_1C1EE2, Text_1851AC
	msgbox Text_1851D2, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9BC7:: @ 81A9BC7
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_DAVE, 0, Text_185285, Text_1852C1
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9BEE
	msgbox Text_1852E3, MSGBOX_AUTOCLOSE
	end

EventScript_1A9BEE:: @ 81A9BEE
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_DAVE, 0, Text_1C1F40, Text_1852C1
	msgbox Text_1852E3, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9C05:: @ 81A9C05
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_ENGINEER_BRAXTON, 0, Text_185011, Text_185037
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9C2C
	msgbox Text_18504A, MSGBOX_AUTOCLOSE
	end

EventScript_1A9C2C:: @ 81A9C2C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_ENGINEER_BRAXTON, 0, Text_1C1DE1, Text_185037
	msgbox Text_18504A, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9C43:: @ 81A9C43
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_ENGINEER_BERNIE, 0, Text_185236, Text_185250
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9C6A
	msgbox Text_185266, MSGBOX_AUTOCLOSE
	end

EventScript_1A9C6A:: @ 81A9C6A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_ENGINEER_BERNIE, 0, Text_1C1F1D, Text_185250
	msgbox Text_185266, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9C81:: @ 81A9C81
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_GAMER_HUGO, 0, Text_184F01, Text_184F15
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9CA8
	msgbox Text_184F2E, MSGBOX_AUTOCLOSE
	end

EventScript_1A9CA8:: @ 81A9CA8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_GAMER_HUGO, 0, Text_1C1D50, Text_184F15
	msgbox Text_184F2E, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9CBF:: @ 81A9CBF
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_GAMER_JASPER, 0, Text_184F5D, Text_184F7E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9CE6
	msgbox Text_184F8E, MSGBOX_AUTOCLOSE
	end

EventScript_1A9CE6:: @ 81A9CE6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_GAMER_JASPER, 0, Text_1C1D79, Text_184F7E
	msgbox Text_184F8E, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9CFD:: @ 81A9CFD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_GAMER_DIRK, 0, Text_1850E9, Text_185105
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9D24
	msgbox Text_185114, MSGBOX_AUTOCLOSE
	end

EventScript_1A9D24:: @ 81A9D24
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_GAMER_DIRK, 0, Text_1C1E57, Text_185105
	msgbox Text_185114, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_1A9D3B:: @ 81A9D3B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_GAMER_DARIAN, 0, Text_185135, Text_18514E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9D62
	msgbox Text_185161, MSGBOX_AUTOCLOSE
	end

EventScript_1A9D62:: @ 81A9D62
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_GAMER_DARIAN, 0, Text_1C1E9F, Text_18514E
	msgbox Text_185161, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9D79:: @ 81A9D79
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_BRENT, 0, Text_184A2F, Text_184A6A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9DA0
	msgbox Text_184A8C, MSGBOX_AUTOCLOSE
	end

EventScript_1A9DA0:: @ 81A9DA0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_BRENT, 0, Text_1C1B83, Text_184A6A
	msgbox Text_184A8C, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9DB7:: @ 81A9DB7
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BUG_CATCHER_CONNER, 0, Text_184B18, Text_184B32
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9DDE
	msgbox Text_184B3B, MSGBOX_AUTOCLOSE
	end

EventScript_1A9DDE:: @ 81A9DDE
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BUG_CATCHER_CONNER, 0, Text_1C1BDC, Text_184B32
	msgbox Text_184B3B, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9DF5:: @ 81A9DF5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_CHRIS, 0, Text_184844, Text_18487E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9E1C
	msgbox Text_184890, MSGBOX_AUTOCLOSE
	end

EventScript_1A9E1C:: @ 81A9E1C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_CHRIS, 0, Text_1C1A5D, Text_18487E
	msgbox Text_184890, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9E33:: @ 81A9E33
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_DREW, 0, Text_18489E, Text_1848CC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9E5A
	msgbox Text_1848DE, MSGBOX_AUTOCLOSE
	end

EventScript_1A9E5A:: @ 81A9E5A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_DREW, 0, Text_1C1A9B, Text_1848CC
	msgbox Text_1848DE, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9E71:: @ 81A9E71
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_ALICIA, 0, Text_1847B7, Text_1847DF
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9E98
	msgbox Text_1847F0, MSGBOX_AUTOCLOSE
	end

EventScript_1A9E98:: @ 81A9E98
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_ALICIA, 0, Text_1C1A2E, Text_1847DF
	msgbox Text_1847F0, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9EAF:: @ 81A9EAF
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_CAITLIN, 0, Text_1848FF, Text_18491C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9ED6
	msgbox Text_184931, MSGBOX_AUTOCLOSE
	end

EventScript_1A9ED6:: @ 81A9ED6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_CAITLIN, 0, Text_1C1AFB, Text_18491C
	msgbox Text_184931, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9EED:: @ 81A9EED
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_ALAN, 0, Text_184ABE, Text_184AD5
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9F14
	msgbox Text_184AF1, MSGBOX_AUTOCLOSE
	end

EventScript_1A9F14:: @ 81A9F14
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_ALAN, 0, Text_1C1BBE, Text_184AD5
	msgbox Text_184AF1, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9F2B:: @ 81A9F2B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_BRICE, 0, Text_1849DF, Text_184A04
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9F52
	msgbox Text_184A11, MSGBOX_AUTOCLOSE
	end

EventScript_1A9F52:: @ 81A9F52
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_BRICE, 0, Text_1C1B5E, Text_184A04
	msgbox Text_184A11, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_1A9F69:: @ 81A9F69
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_JEREMY, 0, Text_18495E, Text_18497F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9F90
	msgbox Text_1849B0, MSGBOX_AUTOCLOSE
	end

EventScript_1A9F90:: @ 81A9F90
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_JEREMY, 0, Text_1C1B37, Text_18497F
	msgbox Text_1849B0, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_1A9FA7:: @ 81A9FA7
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_HEIDI, 0, Text_184CF1, Text_184D31
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1A9FCE
	msgbox Text_184D4D, MSGBOX_AUTOCLOSE
	end

EventScript_1A9FCE:: @ 81A9FCE
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_HEIDI, 0, Text_1C1C9A, Text_184D31
	msgbox Text_184D4D, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_1A9FE5:: @ 81A9FE5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_CAROL, 0, Text_184E04, Text_184E3B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA00C
	msgbox Text_184E5E, MSGBOX_AUTOCLOSE
	end

EventScript_1AA00C:: @ 81AA00C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_CAROL, 0, Text_1C1D14, Text_184E3B
	msgbox Text_184E5E, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_1AA023:: @ 81AA023
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_POKEMANIAC_MARK, 0, Text_184B8A, Text_184BE5
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA04A
	msgbox Text_184BFB, MSGBOX_AUTOCLOSE
	end

EventScript_1AA04A:: @ 81AA04A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_POKEMANIAC_MARK, 0, Text_1C1BFA, Text_184BE5
	msgbox Text_184BFB, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_1AA061:: @ 81AA061
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_POKEMANIAC_HERMAN, 0, Text_184C86, Text_184CA7
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA088
	msgbox Text_184CBB, MSGBOX_AUTOCLOSE
	end

EventScript_1AA088:: @ 81AA088
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_POKEMANIAC_HERMAN, 0, Text_1C1C76, Text_184CA7
	msgbox Text_184CBB, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_1AA09F:: @ 81AA09F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_CLARK, 0, Text_184C1D, Text_184C2D
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA0C6
	msgbox Text_184C60, MSGBOX_AUTOCLOSE
	end

EventScript_1AA0C6:: @ 81AA0C6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_CLARK, 0, Text_1C1C4F, Text_184C2D
	msgbox Text_184C60, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_1AA0DD:: @ 81AA0DD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_TRENT, 0, Text_184DAA, Text_184DCE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA104
	msgbox Text_184DE4, MSGBOX_AUTOCLOSE
	end

EventScript_1AA104:: @ 81AA104
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_TRENT, 0, Text_1C1CD3, Text_184DCE
	msgbox Text_184DE4, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA11B:: @ 81AA11B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_PAIGE, 0, Text_1841ED, Text_184210
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA142
	msgbox Text_18421B, MSGBOX_AUTOCLOSE
	end

EventScript_1AA142:: @ 81AA142
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_PAIGE, 0, Text_1C1834, Text_184210
	msgbox Text_18421B, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA159:: @ 81AA159
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_ANDREA, 0, Text_184321, Text_184346
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA180
	msgbox Text_184350, MSGBOX_AUTOCLOSE
	end

EventScript_1AA180:: @ 81AA180
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_ANDREA, 0, Text_1C18AA, Text_184346
	msgbox Text_184350, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA197:: @ 81AA197
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_MEGAN, 0, Text_18437A, Text_1843A6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA1BE
	msgbox Text_1843D2, MSGBOX_AUTOCLOSE
	end

EventScript_1AA1BE:: @ 81AA1BE
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_MEGAN, 0, Text_1C18DC, Text_1843A6
	msgbox Text_1843D2, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA1D5:: @ 81AA1D5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LASS_JULIA, 0, Text_1844AC, Text_1844D6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA1FC
	msgbox Text_1844FD, MSGBOX_AUTOCLOSE
	end

EventScript_1AA1FC:: @ 81AA1FC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LASS_JULIA, 0, Text_1C1955, Text_1844D6
	msgbox Text_1844FD, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA213:: @ 81AA213
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SUPER_NERD_AIDAN, 0, Text_1840C5, Text_184100
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA23A
	msgbox Text_18410E, MSGBOX_AUTOCLOSE
	end

EventScript_1AA23A:: @ 81AA23A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SUPER_NERD_AIDAN, 0, Text_1C1793, Text_184100
	msgbox Text_18410E, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA251:: @ 81AA251
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SUPER_NERD_GLENN, 0, Text_18417C, Text_1841B6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA278
	msgbox Text_1841C8, MSGBOX_AUTOCLOSE
	end

EventScript_1AA278:: @ 81AA278
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SUPER_NERD_GLENN, 0, Text_1C17F1, Text_1841B6
	msgbox Text_1841C8, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA28F:: @ 81AA28F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SUPER_NERD_LESLIE, 0, Text_184257, Text_18427A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA2B6
	msgbox Text_1842B3, MSGBOX_AUTOCLOSE
	end

EventScript_1AA2B6:: @ 81AA2B6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SUPER_NERD_LESLIE, 0, Text_1C1873, Text_18427A
	msgbox Text_1842B3, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA2CD:: @ 81AA2CD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_GAMER_STAN, 0, Text_18412F, Text_18414D
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA2F4
	msgbox Text_184162, MSGBOX_AUTOCLOSE
	end

EventScript_1AA2F4:: @ 81AA2F4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_GAMER_STAN, 0, Text_1C17CD, Text_18414D
	msgbox Text_184162, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA30B:: @ 81AA30B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_GAMER_RICH, 0, Text_184432, Text_18444F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA332
	msgbox Text_184466, MSGBOX_AUTOCLOSE
	end

EventScript_1AA332:: @ 81AA332
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_GAMER_RICH, 0, Text_1C191F, Text_18444F
	msgbox Text_184466, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA349:: @ 81AA349
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_ELI_ANNE, 0, Text_1845A4, Text_1845D0, Text_184616
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA374
	msgbox Text_1845F2, MSGBOX_AUTOCLOSE
	end

EventScript_1AA374:: @ 81AA374
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_ELI_ANNE, 0, Text_1C19E5, Text_1845D0, Text_184616
	msgbox Text_1845F2, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA38F:: @ 81AA38F
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_ELI_ANNE, 0, Text_18464A, Text_184675, Text_1846AF
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA3BA
	msgbox Text_18468B, MSGBOX_AUTOCLOSE
	end

EventScript_1AA3BA:: @ 81AA3BA
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_ELI_ANNE, 0, Text_1C1A0D, Text_184675, Text_1846AF
	msgbox Text_18468B, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA3D5:: @ 81AA3D5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_RICARDO, 0, Text_1846E2, Text_1846FC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA3FC
	msgbox Text_184719, MSGBOX_AUTOCLOSE
	end

EventScript_1AA3FC:: @ 81AA3FC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_RICARDO, 0, Text_1C199C, Text_1846FC
	msgbox Text_184719, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_1AA413:: @ 81AA413
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_JAREN, 0, Text_184742, Text_184767
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA43A
	msgbox Text_18477A, MSGBOX_AUTOCLOSE
	end

EventScript_1AA43A:: @ 81AA43A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_JAREN, 0, Text_1C19BC, Text_184767
	msgbox Text_18477A, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA451:: @ 81AA451
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_NED, 0, Text_185402, Text_18541B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA478
	msgbox Text_185432, MSGBOX_AUTOCLOSE
	end

EventScript_1AA478:: @ 81AA478
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_NED, 0, Text_1C1F9D, Text_18541B
	msgbox Text_185432, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA48F:: @ 81AA48F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_CHIP, 0, Text_18544E, Text_185475
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA4B6
	msgbox Text_185488, MSGBOX_AUTOCLOSE
	end

EventScript_1AA4B6:: @ 81AA4B6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_CHIP, 0, Text_1C1FD8, Text_185475
	msgbox Text_185488, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA4CD:: @ 81AA4CD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_HANK, 0, Text_1855E1, Text_185606
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA4F4
	msgbox Text_185616, MSGBOX_AUTOCLOSE
	end

EventScript_1AA4F4:: @ 81AA4F4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_HANK, 0, Text_1C209C, Text_185606
	msgbox Text_185616, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA50B:: @ 81AA50B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_ELLIOT, 0, Text_185682, Text_1856D0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA532
	msgbox Text_1856DF, MSGBOX_AUTOCLOSE
	end

EventScript_1AA532:: @ 81AA532
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_ELLIOT, 0, Text_1C20D4, Text_1856D0
	msgbox Text_1856DF, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA549:: @ 81AA549
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_ANDREW, 0, Text_18570E, Text_185744
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA570
	msgbox Text_18574D, MSGBOX_AUTOCLOSE
	end

EventScript_1AA570:: @ 81AA570
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_ANDREW, 0, Text_1C2134, Text_185744
	msgbox Text_18574D, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA587:: @ 81AA587
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_ROCKER_LUCA, 0, Text_185547, Text_18559B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA5AE
	msgbox Text_1855A6, MSGBOX_AUTOCLOSE
	end

EventScript_1AA5AE:: @ 81AA5AE
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_ROCKER_LUCA, 0, Text_1C203B, Text_18559B
	msgbox Text_1855A6, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA5C5:: @ 81AA5C5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_JUSTIN, 0, Text_1854B9, Text_1854ED
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA5EC
	msgbox Text_1854F2, MSGBOX_AUTOCLOSE
	end

EventScript_1AA5EC:: @ 81AA5EC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_JUSTIN, 0, Text_1C2008, Text_1854ED
	msgbox Text_1854F2, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA603:: @ 81AA603
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_YOUNG_COUPLE_GIA_JES, 0, Text_1857C5, Text_1857F1, Text_185842
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA62E
	msgbox Text_18581F, MSGBOX_AUTOCLOSE
	end

EventScript_1AA62E:: @ 81AA62E
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_YOUNG_COUPLE_GIA_JES, 0, Text_1C216B, Text_1857F1, Text_185842
	msgbox Text_18581F, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_1AA649:: @ 81AA649
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_YOUNG_COUPLE_GIA_JES, 0, Text_1858A6, Text_1858D0, Text_185908
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA674
	msgbox Text_1858E2, MSGBOX_AUTOCLOSE
	end

EventScript_1AA674:: @ 81AA674
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_YOUNG_COUPLE_GIA_JES, 0, Text_1C219B, Text_1858D0, Text_185908
	msgbox Text_1858E2, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA68F:: @ 81AA68F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_JARED, 0, Text_185D05, Text_185D1D
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA6B6
	msgbox Text_185D33, MSGBOX_AUTOCLOSE
	end

EventScript_1AA6B6:: @ 81AA6B6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_JARED, 0, Text_1C236B, Text_185D1D
	msgbox Text_185D33, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA6CD:: @ 81AA6CD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BEAUTY_LOLA, 0, Text_185BFC, Text_185C1F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA6F4
	msgbox Text_185C35, MSGBOX_AUTOCLOSE
	end

EventScript_1AA6F4:: @ 81AA6F4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BEAUTY_LOLA, 0, Text_1C2306, Text_185C1F
	msgbox Text_185C35, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA70B:: @ 81AA70B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BEAUTY_SHEILA, 0, Text_185C69, Text_185C95
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA732
	msgbox Text_185CA8, MSGBOX_AUTOCLOSE
	end

EventScript_1AA732:: @ 81AA732
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BEAUTY_SHEILA, 0, Text_1C2340, Text_185C95
	msgbox Text_185CA8, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA749:: @ 81AA749
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_SEBASTIAN, 0, Text_185955, Text_18597E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA770
	msgbox Text_1859A2, MSGBOX_AUTOCLOSE
	end

EventScript_1AA770:: @ 81AA770
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_SEBASTIAN, 0, Text_1C21EE, Text_18597E
	msgbox Text_1859A2, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA787:: @ 81AA787
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_PERRY, 0, Text_185B8F, Text_185BCA
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA7AE
	msgbox Text_185BDB, MSGBOX_AUTOCLOSE
	end

EventScript_1AA7AE:: @ 81AA7AE
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_PERRY, 0, Text_1C22CA, Text_185BCA
	msgbox Text_185BDB, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA7C5:: @ 81AA7C5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_ROBERT, 0, Text_185D3D, Text_185D7B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA7EC
	msgbox Text_185D89, MSGBOX_AUTOCLOSE
	end

EventScript_1AA7EC:: @ 81AA7EC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_ROBERT, 0, Text_1C2383, Text_185D7B
	msgbox Text_185D89, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA803:: @ 81AA803
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_ALMA, 0, Text_185B12, Text_185B48
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA82A
	msgbox Text_185B67, MSGBOX_AUTOCLOSE
	end

EventScript_1AA82A:: @ 81AA82A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_ALMA, 0, Text_1C2299, Text_185B48
	msgbox Text_185B67, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA841:: @ 81AA841
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_SUSIE, 0, Text_1859CF, Text_1859EC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA868
	msgbox Text_1859F9, MSGBOX_AUTOCLOSE
	end

EventScript_1AA868:: @ 81AA868
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_SUSIE, 0, Text_1C220C, Text_1859EC
	msgbox Text_1859F9, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA87F:: @ 81AA87F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_VALERIE, 0, Text_185A37, Text_185A56
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA8A6
	msgbox Text_185A62, MSGBOX_AUTOCLOSE
	end

EventScript_1AA8A6:: @ 81AA8A6
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_VALERIE, 0, Text_1C223C, Text_185A56
	msgbox Text_185A62, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_1AA8BD:: @ 81AA8BD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_GWEN, 0, Text_185A91, Text_185AC1
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA8E4
	msgbox Text_185ADE, MSGBOX_AUTOCLOSE
	end

EventScript_1AA8E4:: @ 81AA8E4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_GWEN, 0, Text_1C225B, Text_185AC1
	msgbox Text_185ADE, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AA8FB:: @ 81AA8FB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_MALIK, 0, Text_186344, Text_186362
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA922
	msgbox Text_18636E, MSGBOX_AUTOCLOSE
	end

EventScript_1AA922:: @ 81AA922
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_MALIK, 0, Text_1C25D6, Text_186362
	msgbox Text_18636E, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AA939:: @ 81AA939
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_LUKAS, 0, Text_1861F7, Text_186223
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA960
	msgbox Text_186239, MSGBOX_AUTOCLOSE
	end

EventScript_1AA960:: @ 81AA960
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_LUKAS, 0, Text_1C2531, Text_186223
	msgbox Text_186239, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AA977:: @ 81AA977
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_ISAAC, 0, Text_186263, Text_186291
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA99E
	msgbox Text_18629D, MSGBOX_AUTOCLOSE
	end

EventScript_1AA99E:: @ 81AA99E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_ISAAC, 0, Text_1C2572, Text_186291
	msgbox Text_18629D, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AA9B5:: @ 81AA9B5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_GERALD, 0, Text_1862BD, Text_1862EF
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AA9DC
	msgbox Text_1862F8, MSGBOX_AUTOCLOSE
	end

EventScript_1AA9DC:: @ 81AA9DC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_GERALD, 0, Text_1C259E, Text_1862EF
	msgbox Text_1862F8, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AA9F3:: @ 81AA9F3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_DONALD, 0, Text_1860D9, Text_18610A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAA1A
	msgbox Text_18611D, MSGBOX_AUTOCLOSE
	end

EventScript_1AAA1A:: @ 81AAA1A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_DONALD, 0, Text_1C24CB, Text_18610A
	msgbox Text_18611D, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AAA31:: @ 81AAA31
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_BENNY, 0, Text_18618E, Text_1861B3
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAA58
	msgbox Text_1861BE, MSGBOX_AUTOCLOSE
	end

EventScript_1AAA58:: @ 81AAA58
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_BENNY, 0, Text_1C2505, Text_1861B3
	msgbox Text_1861BE, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AAA6F:: @ 81AAA6F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_CARTER, 0, Text_185E4D, Text_185E81
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAA96
	msgbox Text_185E9C, MSGBOX_AUTOCLOSE
	end

EventScript_1AAA96:: @ 81AAA96
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_CARTER, 0, Text_1C23C1, Text_185E81
	msgbox Text_185E9C, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AAAAD:: @ 81AAAAD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_MITCH, 0, Text_185EDF, Text_185F0B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAAD4
	msgbox Text_185F1A, MSGBOX_AUTOCLOSE
	end

EventScript_1AAAD4:: @ 81AAAD4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_MITCH, 0, Text_1C23EF, Text_185F0B
	msgbox Text_185F1A, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AAAEB:: @ 81AAAEB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_BECK, 0, Text_185F46, Text_185FAE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAB12
	msgbox Text_185FBB, MSGBOX_AUTOCLOSE
	end

EventScript_1AAB12:: @ 81AAB12
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_BECK, 0, Text_1C2425, Text_185FAE
	msgbox Text_185FBB, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AAB29:: @ 81AAB29
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_MARLON, 0, Text_186021, Text_18607C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAB50
	msgbox Text_186091, MSGBOX_AUTOCLOSE
	end

EventScript_1AAB50:: @ 81AAB50
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_MARLON, 0, Text_1C2461, Text_18607C
	msgbox Text_186091, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AAB67:: @ 81AAB67
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_KIRI_JAN, 0, Text_1863B7, Text_1863EA, Text_18642E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAB92
	msgbox Text_18640D, MSGBOX_AUTOCLOSE
	end

EventScript_1AAB92:: @ 81AAB92
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_KIRI_JAN, 0, Text_1C25FB, Text_1863EA, Text_18642E
	msgbox Text_18640D, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_1AABAD:: @ 81AABAD
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_KIRI_JAN, 0, Text_18645B, Text_186487, Text_1864D3
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AABD8
	msgbox Text_18649C, MSGBOX_AUTOCLOSE
	end

EventScript_1AABD8:: @ 81AABD8
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_KIRI_JAN, 0, Text_1C261B, Text_186487, Text_1864D3
	msgbox Text_18649C, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AABF3:: @ 81AABF3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_ERNEST, 0, Text_1868B6, Text_1868E8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAC1A
	msgbox Text_1868F1, MSGBOX_AUTOCLOSE
	end

EventScript_1AAC1A:: @ 81AAC1A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_ERNEST, 0, Text_1C27E7, Text_1868E8
	msgbox Text_1868F1, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AAC31:: @ 81AAC31
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_ALEX, 0, Text_186936, Text_186968
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAC58
	msgbox Text_18697C, MSGBOX_AUTOCLOSE
	end

EventScript_1AAC58:: @ 81AAC58
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_ALEX, 0, Text_1C2814, Text_186968
	msgbox Text_18697C, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AAC6F:: @ 81AAC6F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BEAUTY_GRACE, 0, Text_18678B, Text_1867C1
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAC96
	msgbox Text_1867DA, MSGBOX_AUTOCLOSE
	end

EventScript_1AAC96:: @ 81AAC96
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BEAUTY_GRACE, 0, Text_1C2753, Text_1867C1
	msgbox Text_1867DA, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AACAD:: @ 81AACAD
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BEAUTY_OLIVIA, 0, Text_18680C, Text_186841
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AACD4
	msgbox Text_18686F, MSGBOX_AUTOCLOSE
	end

EventScript_1AACD4:: @ 81AACD4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BEAUTY_OLIVIA, 0, Text_1C279D, Text_186841
	msgbox Text_18686F, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AACEB:: @ 81AACEB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_EDWIN, 0, Text_18664F, Text_18667A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAD12
	msgbox Text_18668D, MSGBOX_AUTOCLOSE
	end

EventScript_1AAD12:: @ 81AAD12
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_EDWIN, 0, Text_1C26D3, Text_18667A
	msgbox Text_18668D, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AAD29:: @ 81AAD29
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_CHESTER, 0, Text_1866D1, Text_186707
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAD50
	msgbox Text_18671A, MSGBOX_AUTOCLOSE
	end

EventScript_1AAD50:: @ 81AAD50
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_CHESTER, 0, Text_1C2717, Text_186707
	msgbox Text_18671A, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AAD67:: @ 81AAD67
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_YAZMIN, 0, Text_186A22, Text_186A40
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAD8E
	msgbox Text_186A55, MSGBOX_AUTOCLOSE
	end

EventScript_1AAD8E:: @ 81AAD8E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_YAZMIN, 0, Text_1C287D, Text_186A40
	msgbox Text_186A55, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AADA5:: @ 81AADA5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_KINDRA, 0, Text_18650B, Text_186549
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AADCC
	msgbox Text_18655A, MSGBOX_AUTOCLOSE
	end

EventScript_1AADCC:: @ 81AADCC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_KINDRA, 0, Text_1C2650, Text_186549
	msgbox Text_18655A, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AADE3:: @ 81AADE3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_BECKY, 0, Text_1865D3, Text_186612
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAE0A
	msgbox Text_18661D, MSGBOX_AUTOCLOSE
	end

EventScript_1AAE0A:: @ 81AAE0A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_BECKY, 0, Text_1C268D, Text_186612
	msgbox Text_18661D, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AAE21:: @ 81AAE21
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_CELIA, 0, Text_1869BA, Text_1869E6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAE48
	msgbox Text_1869F4, MSGBOX_AUTOCLOSE
	end

EventScript_1AAE48:: @ 81AAE48
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_CELIA, 0, Text_1C2846, Text_1869E6
	msgbox Text_1869F4, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AAE5F:: @ 81AAE5F
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_CRUSH_KIN_RON_MYA, 0, Text_186A95, Text_186ACB, Text_186B46
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAE8A
	msgbox Text_186B0A, MSGBOX_AUTOCLOSE
	end

EventScript_1AAE8A:: @ 81AAE8A
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_CRUSH_KIN_RON_MYA, 0, Text_1C28A1, Text_186ACB, Text_186B46
	msgbox Text_186B0A, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_1AAEA5:: @ 81AAEA5
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_CRUSH_KIN_RON_MYA, 0, Text_186B89, Text_186BB1, Text_186BFE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAED0
	msgbox Text_186BD2, MSGBOX_AUTOCLOSE
	end

EventScript_1AAED0:: @ 81AAED0
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_CRUSH_KIN_RON_MYA, 0, Text_1C28EC, Text_186BB1, Text_186BFE
	msgbox Text_186BD2, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AAEEB:: @ 81AAEEB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_LAO, 0, Text_186C4D, Text_186C5F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAF12
	msgbox Text_186C75, MSGBOX_AUTOCLOSE
	end

EventScript_1AAF12:: @ 81AAF12
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_LAO, 0, Text_1C2913, Text_186C5F
	msgbox Text_186C75, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AAF29:: @ 81AAF29
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_HIDEO, 0, Text_186D39, Text_186D52
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAF50
	msgbox Text_186D5A, MSGBOX_AUTOCLOSE
	end

EventScript_1AAF50:: @ 81AAF50
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_HIDEO, 0, Text_1C297B, Text_186D52
	msgbox Text_186D5A, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AAF67:: @ 81AAF67
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_RUBEN, 0, Text_186E86, Text_186EB4
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAF8E
	msgbox Text_186EC7, MSGBOX_AUTOCLOSE
	end

EventScript_1AAF8E:: @ 81AAF8E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_RUBEN, 0, Text_1C29EB, Text_186EB4
	msgbox Text_186EC7, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AAFA5:: @ 81AAFA5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_KOJI, 0, Text_186CA2, Text_186CBB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AAFCC
	msgbox Text_186CC5, MSGBOX_AUTOCLOSE
	end

EventScript_1AAFCC:: @ 81AAFCC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_KOJI, 0, Text_1C2925, Text_186CBB
	msgbox Text_186CC5, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AAFE3:: @ 81AAFE3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_LUKE, 0, Text_186CE5, Text_186D06
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB00A
	msgbox Text_186D16, MSGBOX_AUTOCLOSE
	end

EventScript_1AB00A:: @ 81AB00A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_LUKE, 0, Text_1C2944, Text_186D06
	msgbox Text_186D16, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AB021:: @ 81AB021
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_CAMRON, 0, Text_186DD9, Text_186E0D
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB048
	msgbox Text_186E1C, MSGBOX_AUTOCLOSE
	end

EventScript_1AB048:: @ 81AB048
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_CAMRON, 0, Text_1C29B0, Text_186E0D
	msgbox Text_186E1C, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AB05F:: @ 81AB05F
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_YOUNG_COUPLE_LEA_JED, 0, Text_186FBD, Text_186FFA, Text_187057
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB08A
	msgbox Text_187027, MSGBOX_AUTOCLOSE
	end

EventScript_1AB08A:: @ 81AB08A
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_YOUNG_COUPLE_LEA_JED, 0, Text_1C2A19, Text_186FFA, Text_187057
	msgbox Text_187027, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_1AB0A5:: @ 81AB0A5
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_YOUNG_COUPLE_LEA_JED, 0, Text_187097, Text_1870CC, Text_187120
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB0D0
	msgbox Text_1870F9, MSGBOX_AUTOCLOSE
	end

EventScript_1AB0D0:: @ 81AB0D0
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_YOUNG_COUPLE_LEA_JED, 0, Text_1C2A53, Text_1870CC, Text_187120
	msgbox Text_1870F9, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB0EB:: @ 81AB0EB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_BILLY, 0, Text_1872BD, Text_1872E3
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB112
	msgbox Text_1872EB, MSGBOX_AUTOCLOSE
	end

EventScript_1AB112:: @ 81AB112
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_BILLY, 0, Text_1C2B06, Text_1872E3
	msgbox Text_1872EB, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB129:: @ 81AB129
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_NIKOLAS, 0, Text_18730A, Text_187325
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB150
	msgbox Text_187333, MSGBOX_AUTOCLOSE
	end

EventScript_1AB150:: @ 81AB150
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_NIKOLAS, 0, Text_1C2B2C, Text_187325
	msgbox Text_187333, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB167:: @ 81AB167
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_JAXON, 0, Text_187456, Text_187472
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB18E
	msgbox Text_187479, MSGBOX_AUTOCLOSE
	end

EventScript_1AB18E:: @ 81AB18E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_JAXON, 0, Text_1C2BE6, Text_187472
	msgbox Text_187479, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB1A5:: @ 81AB1A5
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_WILLIAM, 0, Text_18749B, Text_1874B6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB1CC
	msgbox Text_1874C9, MSGBOX_AUTOCLOSE
	end

EventScript_1AB1CC:: @ 81AB1CC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_WILLIAM, 0, Text_1C2C10, Text_1874B6
	msgbox Text_1874C9, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB1E3:: @ 81AB1E3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_RAUL, 0, Text_18717E, Text_1871AE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB20A
	msgbox Text_1871BA, MSGBOX_AUTOCLOSE
	end

EventScript_1AB20A:: @ 81AB20A
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_RAUL, 0, Text_1C2A88, Text_1871AE
	msgbox Text_1871BA, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB221:: @ 81AB221
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_ISAIAH, 0, Text_187228, Text_187254
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB248
	msgbox Text_18725A, MSGBOX_AUTOCLOSE
	end

EventScript_1AB248:: @ 81AB248
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_ISAIAH, 0, Text_1C2AC4, Text_187254
	msgbox Text_18725A, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB25F:: @ 81AB25F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_ZEEK, 0, Text_187362, Text_187395
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB286
	msgbox Text_18739F, MSGBOX_AUTOCLOSE
	end

EventScript_1AB286:: @ 81AB286
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_ZEEK, 0, Text_1C2B5E, Text_187395
	msgbox Text_18739F, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB29D:: @ 81AB29D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_JAMAL, 0, Text_1873D1, Text_1873EB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB2C4
	msgbox Text_1873FF, MSGBOX_AUTOCLOSE
	end

EventScript_1AB2C4:: @ 81AB2C4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_JAMAL, 0, Text_1C2B9C, Text_1873EB
	msgbox Text_1873FF, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB2DB:: @ 81AB2DB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CUE_BALL_COREY, 0, Text_18741D, Text_187429
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB302
	msgbox Text_187432, MSGBOX_AUTOCLOSE
	end

EventScript_1AB302:: @ 81AB302
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CUE_BALL_COREY, 0, Text_1C2BDA, Text_187429
	msgbox Text_187432, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_1AB319:: @ 81AB319
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIKER_VIRGIL, 0, Text_18727D, Text_187295
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB340
	msgbox Text_1872A5, MSGBOX_AUTOCLOSE
	end

EventScript_1AB340:: @ 81AB340
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIKER_VIRGIL, 0, Text_1C2AF0, Text_187295
	msgbox Text_1872A5, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_1AB357:: @ 81AB357
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_WILTON, 0, Text_187640, Text_187672
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB37E
	msgbox Text_187677, MSGBOX_AUTOCLOSE
	end

EventScript_1AB37E:: @ 81AB37E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_WILTON, 0, Text_1C2C2B, Text_187672
	msgbox Text_187677, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_1AB395:: @ 81AB395
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_RAMIRO, 0, Text_18768C, Text_1876B3
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB3BC
	msgbox Text_1876C5, MSGBOX_AUTOCLOSE
	end

EventScript_1AB3BC:: @ 81AB3BC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_RAMIRO, 0, Text_1C2C7B, Text_1876B3
	msgbox Text_1876C5, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_1AB3D3:: @ 81AB3D3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_JACOB, 0, Text_187704, Text_187726
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB3FA
	msgbox Text_18772C, MSGBOX_AUTOCLOSE
	end

EventScript_1AB3FA:: @ 81AB3FA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_JACOB, 0, Text_1C2CA8, Text_187726
	msgbox Text_18772C, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB411:: @ 81AB411
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_RICHARD, 0, Text_1877A3, Text_1877DF
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB438
	msgbox Text_1877EE, MSGBOX_AUTOCLOSE
	end

EventScript_1AB438:: @ 81AB438
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_RICHARD, 0, Text_1C2CEE, Text_1877DF
	msgbox Text_1877EE, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB44F:: @ 81AB44F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_REECE, 0, Text_187811, Text_18783E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB476
	msgbox Text_187852, MSGBOX_AUTOCLOSE
	end

EventScript_1AB476:: @ 81AB476
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_REECE, 0, Text_1C2D19, Text_18783E
	msgbox Text_187852, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB48D:: @ 81AB48D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_MATTHEW, 0, Text_187884, Text_1878A5
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB4B4
	msgbox Text_1878B1, MSGBOX_AUTOCLOSE
	end

EventScript_1AB4B4:: @ 81AB4B4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_MATTHEW, 0, Text_1C2D4B, Text_1878A5
	msgbox Text_1878B1, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB4CB:: @ 81AB4CB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_DOUGLAS, 0, Text_1878DD, Text_1878F8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB4F2
	msgbox Text_1878FE, MSGBOX_AUTOCLOSE
	end

EventScript_1AB4F2:: @ 81AB4F2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_DOUGLAS, 0, Text_1C2D7D, Text_1878F8
	msgbox Text_1878FE, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB509:: @ 81AB509
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_DAVID, 0, Text_187925, Text_187955
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB530
	msgbox Text_18795B, MSGBOX_AUTOCLOSE
	end

EventScript_1AB530:: @ 81AB530
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_DAVID, 0, Text_1C2DA7, Text_187955
	msgbox Text_18795B, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB547:: @ 81AB547
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_TONY, 0, Text_187985, Text_1879C3
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB56E
	msgbox Text_1879D3, MSGBOX_AUTOCLOSE
	end

EventScript_1AB56E:: @ 81AB56E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_TONY, 0, Text_1C2DE9, Text_1879C3
	msgbox Text_1879D3, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB585:: @ 81AB585
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_AXLE, 0, Text_187AFA, Text_187B25
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB5AC
	msgbox Text_187B35, MSGBOX_AUTOCLOSE
	end

EventScript_1AB5AC:: @ 81AB5AC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_AXLE, 0, Text_1C2EC0, Text_187B25
	msgbox Text_187B35, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB5C3:: @ 81AB5C3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_ANYA, 0, Text_187A11, Text_187A44
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB5EA
	msgbox Text_187A50, MSGBOX_AUTOCLOSE
	end

EventScript_1AB5EA:: @ 81AB5EA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_ANYA, 0, Text_1C2E4A, Text_187A44
	msgbox Text_187A50, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB601:: @ 81AB601
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_ALICE, 0, Text_187A9E, Text_187AC1
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB628
	msgbox Text_187ACA, MSGBOX_AUTOCLOSE
	end

EventScript_1AB628:: @ 81AB628
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_ALICE, 0, Text_1C2E9D, Text_187AC1
	msgbox Text_187ACA, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB63F:: @ 81AB63F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_CONNIE, 0, Text_187B5D, Text_187B85
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB666
	msgbox Text_187B94, MSGBOX_AUTOCLOSE
	end

EventScript_1AB666:: @ 81AB666
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_CONNIE, 0, Text_1C2EFC, Text_187B85
	msgbox Text_187B94, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB67D:: @ 81AB67D
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_SIS_AND_BRO_LIA_LUC, 0, Text_187C32, Text_187C6F, Text_187CF2
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB6A8
	msgbox Text_187C9E, MSGBOX_AUTOCLOSE
	end

EventScript_1AB6A8:: @ 81AB6A8
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_SIS_AND_BRO_LIA_LUC, 0, Text_1C2F41, Text_187C6F, Text_187CF2
	msgbox Text_187C9E, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_1AB6C3:: @ 81AB6C3
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_SIS_AND_BRO_LIA_LUC, 0, Text_187D45, Text_187D7E, Text_187DE8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB6EE
	msgbox Text_187DAD, MSGBOX_AUTOCLOSE
	end

EventScript_1AB6EE:: @ 81AB6EE
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_SIS_AND_BRO_LIA_LUC, 0, Text_1C2FAE, Text_187D7E, Text_187DE8
	msgbox Text_187DAD, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB709:: @ 81AB709
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_BARRY, 0, Text_187E40, Text_187E7B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB730
	msgbox Text_187E83, MSGBOX_AUTOCLOSE
	end

EventScript_1AB730:: @ 81AB730
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_BARRY, 0, Text_1C2FF3, Text_187E7B
	msgbox Text_187E83, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB747:: @ 81AB747
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_DEAN, 0, Text_187FDB, Text_187FF7
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB76E
	msgbox Text_187FFE, MSGBOX_AUTOCLOSE
	end

EventScript_1AB76E:: @ 81AB76E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_DEAN, 0, Text_1C30B0, Text_187FF7
	msgbox Text_187FFE, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB785:: @ 81AB785
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_DARRIN, 0, Text_18802E, Text_18805C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB7AC
	msgbox Text_18806D, MSGBOX_AUTOCLOSE
	end

EventScript_1AB7AC:: @ 81AB7AC
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_DARRIN, 0, Text_1C30ED, Text_18805C
	msgbox Text_18806D, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB7C3:: @ 81AB7C3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_TIFFANY, 0, Text_187F24, Text_187F5A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB7EA
	msgbox Text_187F61, MSGBOX_AUTOCLOSE
	end

EventScript_1AB7EA:: @ 81AB7EA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_TIFFANY, 0, Text_1C305F, Text_187F5A
	msgbox Text_187F61, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB801:: @ 81AB801
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_NORA, 0, Text_1880F8, Text_188119
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB828
	msgbox Text_188139, MSGBOX_AUTOCLOSE
	end

EventScript_1AB828:: @ 81AB828
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_NORA, 0, Text_1C3149, Text_188119
	msgbox Text_188139, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB83F:: @ 81AB83F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_MELISSA, 0, Text_188218, Text_18825C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB866
	msgbox Text_18827B, MSGBOX_AUTOCLOSE
	end

EventScript_1AB866:: @ 81AB866
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_MELISSA, 0, Text_1C31C4, Text_18825C
	msgbox Text_18827B, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB87D:: @ 81AB87D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_SHIRLEY, 0, Text_187EBB, Text_187EED
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB8A4
	msgbox Text_187EF6, MSGBOX_AUTOCLOSE
	end

EventScript_1AB8A4:: @ 81AB8A4
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_SHIRLEY, 0, Text_1C302E, Text_187EED
	msgbox Text_187EF6, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB8BB:: @ 81AB8BB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_ROGER, 0, Text_18808E, Text_1880AB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB8E2
	msgbox Text_1880C8, MSGBOX_AUTOCLOSE
	end

EventScript_1AB8E2:: @ 81AB8E2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_ROGER, 0, Text_1C312C, Text_1880AB
	msgbox Text_1880C8, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB8F9:: @ 81AB8F9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_MISSY, 0, Text_188165, Text_1881A3
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB920
	msgbox Text_1881B8, MSGBOX_AUTOCLOSE
	end

EventScript_1AB920:: @ 81AB920
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_MISSY, 0, Text_1C3185, Text_1881A3
	msgbox Text_1881B8, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_1AB937:: @ 81AB937
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_IRENE, 0, Text_187F78, Text_187F92
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB95E
	msgbox Text_187FA3, MSGBOX_AUTOCLOSE
	end

EventScript_1AB95E:: @ 81AB95E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_IRENE, 0, Text_1C3095, Text_187F92
	msgbox Text_187FA3, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_1AB975:: @ 81AB975
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_RONALD, 0, Text_18835A, Text_188383
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB99C
	msgbox Text_188389, MSGBOX_AUTOCLOSE
	end

EventScript_1AB99C:: @ 81AB99C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_RONALD, 0, Text_1C3208, Text_188383
	msgbox Text_188389, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_1AB9B3:: @ 81AB9B3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_CLAUDE, 0, Text_1885D8, Text_1885F8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AB9DA
	msgbox Text_188632, MSGBOX_AUTOCLOSE
	end

EventScript_1AB9DA:: @ 81AB9DA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_CLAUDE, 0, Text_1C331D, Text_1885F8
	msgbox Text_188632, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_1AB9F1:: @ 81AB9F1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_WADE, 0, Text_1883C6, Text_1883E9
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABA18
	msgbox Text_18841D, MSGBOX_AUTOCLOSE
	end

EventScript_1ABA18:: @ 81ABA18
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_WADE, 0, Text_1C3231, Text_1883E9
	msgbox Text_18841D, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_1ABA2F:: @ 81ABA2F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_NOLAN, 0, Text_18868C, Text_1886AE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABA56
	msgbox Text_1886C5, MSGBOX_AUTOCLOSE
	end

EventScript_1ABA56:: @ 81ABA56
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_NOLAN, 0, Text_1C3356, Text_1886AE
	msgbox Text_1886C5, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_1ABA6D:: @ 81ABA6D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_SPENCER, 0, Text_18843C, Text_18845F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABA94
	msgbox Text_188465, MSGBOX_AUTOCLOSE
	end

EventScript_1ABA94:: @ 81ABA94
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_SPENCER, 0, Text_1C3264, Text_18845F
	msgbox Text_188465, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_1ABAAB:: @ 81ABAAB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_JACK, 0, Text_1884D4, Text_1884F0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABAD2
	msgbox Text_1884FF, MSGBOX_AUTOCLOSE
	end

EventScript_1ABAD2:: @ 81ABAD2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_JACK, 0, Text_1C3298, Text_1884F0
	msgbox Text_1884FF, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_1ABAE9:: @ 81ABAE9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_JEROME, 0, Text_18851F, Text_188543
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABB10
	msgbox Text_188555, MSGBOX_AUTOCLOSE
	end

EventScript_1ABB10:: @ 81ABB10
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_JEROME, 0, Text_1C32D3, Text_188543
	msgbox Text_188555, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_1ABB27:: @ 81ABB27
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_ROLAND, 0, Text_188592, Text_1885B2
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABB4E
	msgbox Text_1885BF, MSGBOX_AUTOCLOSE
	end

EventScript_1ABB4E:: @ 81ABB4E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_ROLAND, 0, Text_1C32FD, Text_1885B2
	msgbox Text_1885BF, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_1ABB65:: @ 81ABB65
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_SIS_AND_BRO_LIL_IAN, 0, Text_1886E2, Text_188712, Text_18875E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABB90
	msgbox Text_188734, MSGBOX_AUTOCLOSE
	end

EventScript_1ABB90:: @ 81ABB90
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_SIS_AND_BRO_LIL_IAN, 0, Text_1C3378, Text_188712, Text_18875E
	msgbox Text_188734, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_1ABBAB:: @ 81ABBAB
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_SIS_AND_BRO_LIL_IAN, 0, Text_1887B4, Text_1887F1, Text_188850
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABBD6
	msgbox Text_188812, MSGBOX_AUTOCLOSE
	end

EventScript_1ABBD6:: @ 81ABBD6
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_SIS_AND_BRO_LIL_IAN, 0, Text_1C33AE, Text_1887F1, Text_188850
	msgbox Text_188812, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABBF1:: @ 81ABBF1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_MARIA, 0, Text_18961F, Text_18964D
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABC18
	msgbox Text_189657, MSGBOX_AUTOCLOSE
	end

EventScript_1ABC18:: @ 81ABC18
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_MARIA, 0, Text_1C37B5, Text_18964D
	msgbox Text_189657, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABC2F:: @ 81ABC2F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_ABIGAIL, 0, Text_18968C, Text_1896AC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABC56
	msgbox Text_1896C1, MSGBOX_AUTOCLOSE
	end

EventScript_1ABC56:: @ 81ABC56
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_ABIGAIL, 0, Text_1C37E7, Text_1896AC
	msgbox Text_1896C1, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABC6D:: @ 81ABC6D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_FINN, 0, Text_1896F9, Text_189728
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABC94
	msgbox Text_189740, MSGBOX_AUTOCLOSE
	end

EventScript_1ABC94:: @ 81ABC94
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_FINN, 0, Text_1C3807, Text_189728
	msgbox Text_189740, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABCAB:: @ 81ABCAB
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_GARRETT, 0, Text_189767, Text_1897A4
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABCD2
	msgbox Text_1897C5, MSGBOX_AUTOCLOSE
	end

EventScript_1ABCD2:: @ 81ABCD2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_GARRETT, 0, Text_1C3835, Text_1897A4
	msgbox Text_1897C5, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABCE9:: @ 81ABCE9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_TOMMY, 0, Text_1897FF, Text_189833
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABD10
	msgbox Text_18984B, MSGBOX_AUTOCLOSE
	end

EventScript_1ABD10:: @ 81ABD10
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_TOMMY, 0, Text_1C386A, Text_189833
	msgbox Text_18984B, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABD27:: @ 81ABD27
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CRUSH_GIRL_SHARON, 0, Text_189883, Text_1898AB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABD4E
	msgbox Text_1898C4, MSGBOX_AUTOCLOSE
	end

EventScript_1ABD4E:: @ 81ABD4E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CRUSH_GIRL_SHARON, 0, Text_1C389F, Text_1898AB
	msgbox Text_1898C4, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABD65:: @ 81ABD65
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CRUSH_GIRL_TANYA, 0, Text_1898F0, Text_18991B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABD8C
	msgbox Text_18992C, MSGBOX_AUTOCLOSE
	end

EventScript_1ABD8C:: @ 81ABD8C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CRUSH_GIRL_TANYA, 0, Text_1C38CA, Text_18991B
	msgbox Text_18992C, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABDA3:: @ 81ABDA3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BLACK_BELT_SHEA, 0, Text_189950, Text_18998C
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABDCA
	msgbox Text_189998, MSGBOX_AUTOCLOSE
	end

EventScript_1ABDCA:: @ 81ABDCA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BLACK_BELT_SHEA, 0, Text_1C38FA, Text_18998C
	msgbox Text_189998, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABDE1:: @ 81ABDE1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BLACK_BELT_HUGH, 0, Text_1899CE, Text_189A0A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABE08
	msgbox Text_189A13, MSGBOX_AUTOCLOSE
	end

EventScript_1ABE08:: @ 81ABE08
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BLACK_BELT_HUGH, 0, Text_1C3943, Text_189A0A
	msgbox Text_189A13, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABE1F:: @ 81ABE1F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CAMPER_BRYCE, 0, Text_189A53, Text_189A92
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABE46
	msgbox Text_189A9F, MSGBOX_AUTOCLOSE
	end

EventScript_1ABE46:: @ 81ABE46
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CAMPER_BRYCE, 0, Text_1C3987, Text_189A92
	msgbox Text_189A9F, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABE5D:: @ 81ABE5D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PICNICKER_CLAIRE, 0, Text_189ACB, Text_189B0B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABE84
	msgbox Text_189B24, MSGBOX_AUTOCLOSE
	end

EventScript_1ABE84:: @ 81ABE84
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PICNICKER_CLAIRE, 0, Text_1C39C6, Text_189B0B
	msgbox Text_189B24, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABE9B:: @ 81ABE9B
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_CRUSH_KIN_MIK_KIA, 0, Text_189B4D, Text_189B84, Text_189BDE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABEC6
	msgbox Text_189BA3, MSGBOX_AUTOCLOSE
	end

EventScript_1ABEC6:: @ 81ABEC6
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_CRUSH_KIN_MIK_KIA, 0, Text_1C3A05, Text_189B84, Text_189BDE
	msgbox Text_189BA3, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_1ABEE1:: @ 81ABEE1
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_CRUSH_KIN_MIK_KIA, 0, Text_189C33, Text_189C62, Text_189CAB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABF0C
	msgbox Text_189C7E, MSGBOX_AUTOCLOSE
	end

EventScript_1ABF0C:: @ 81ABF0C
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_CRUSH_KIN_MIK_KIA, 0, Text_1C3A55, Text_189C62, Text_189CAB
	msgbox Text_189C7E, MSGBOX_AUTOCLOSE
	end

OneIsland_TreasureBeach_EventScript_1ABF27:: @ 81ABF27
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_AMARA, 0, Text_189D5A, Text_189D8B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABF4E
	msgbox Text_189DA3, MSGBOX_AUTOCLOSE
	end

EventScript_1ABF4E:: @ 81ABF4E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_AMARA, 0, Text_1C3773, Text_189D8B
	msgbox Text_189DA3, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_1ABF65:: @ 81ABF65
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_AROMA_LADY_NIKKI, 0, Text_189E42, Text_189E72
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABF8C
	msgbox Text_189E9E, MSGBOX_AUTOCLOSE
	end

EventScript_1ABF8C:: @ 81ABF8C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_AROMA_LADY_NIKKI, 0, Text_1C3AA7, Text_189E72
	msgbox Text_189E9E, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_1ABFA3:: @ 81ABFA3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_AROMA_LADY_VIOLET, 0, Text_189ED4, Text_189EFA
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ABFCA
	msgbox Text_189F21, MSGBOX_AUTOCLOSE
	end

EventScript_1ABFCA:: @ 81ABFCA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_AROMA_LADY_VIOLET, 0, Text_1C3ABF, Text_189EFA
	msgbox Text_189F21, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_1ABFE1:: @ 81ABFE1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TUBER_AMIRA, 0, Text_189F63, Text_189F9A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC008
	msgbox Text_189FA8, MSGBOX_AUTOCLOSE
	end

EventScript_1AC008:: @ 81AC008
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_TUBER_AMIRA, 0, Text_1C3AF2, Text_189F9A
	msgbox Text_189FA8, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_1AC01F:: @ 81AC01F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TUBER_ALEXIS, 0, Text_189FDB, Text_189FEE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC046
	msgbox Text_18A000, MSGBOX_AUTOCLOSE
	end

EventScript_1AC046:: @ 81AC046
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_TUBER_ALEXIS, 0, Text_1C3B1D, Text_189FEE
	msgbox Text_18A000, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_1AC05D:: @ 81AC05D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_TISHA, 0, Text_18A01F, Text_18A053
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC084
	msgbox Text_18A082, MSGBOX_AUTOCLOSE
	end

EventScript_1AC084:: @ 81AC084
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_TISHA, 0, Text_1C3B30, Text_18A053
	msgbox Text_18A082, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_1AC09B:: @ 81AC09B
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_JOY_MEG, 0, Text_18A0C4, Text_18A0F7, Text_18A138
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC0C6
	msgbox Text_18A106, MSGBOX_AUTOCLOSE
	end

EventScript_1AC0C6:: @ 81AC0C6
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_JOY_MEG, 0, Text_1C3B6E, Text_18A0F7, Text_18A138
	msgbox Text_18A106, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_1AC0E1:: @ 81AC0E1
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_JOY_MEG, 0, Text_18A179, Text_18A1A3, Text_18A1CD
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC10C
	msgbox Text_18A1B2, MSGBOX_AUTOCLOSE
	end

EventScript_1AC10C:: @ 81AC10C
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_JOY_MEG, 0, Text_1C3B99, Text_18A1A3, Text_18A1CD
	msgbox Text_18A1B2, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_1AC127:: @ 81AC127
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PAINTER_DAISY, 0, Text_18A3E2, Text_18A40E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC14E
	msgbox Text_18A430, MSGBOX_AUTOCLOSE
	end

EventScript_1AC14E:: @ 81AC14E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PAINTER_DAISY, 0, Text_1C3BF6, Text_18A40E
	msgbox Text_18A430, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_1AC165:: @ 81AC165
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PAINTER_CELINA, 0, Text_18A461, Text_18A49E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC18C
	msgbox Text_18A4C6, MSGBOX_AUTOCLOSE
	end

EventScript_1AC18C:: @ 81AC18C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PAINTER_CELINA, 0, Text_1C3C28, Text_18A49E
	msgbox Text_18A4C6, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_1AC1A3:: @ 81AC1A3
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PAINTER_RAYNA, 0, Text_18A50E, Text_18A535
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC1CA
	msgbox Text_18A555, MSGBOX_AUTOCLOSE
	end

EventScript_1AC1CA:: @ 81AC1CA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PAINTER_RAYNA, 0, Text_1C3C70, Text_18A535
	msgbox Text_18A555, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_1AC1E1:: @ 81AC1E1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LADY_JACKI, 0, Text_18A5B9, Text_18A5EE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC208
	msgbox Text_18A601, MSGBOX_AUTOCLOSE
	end

EventScript_1AC208:: @ 81AC208
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LADY_JACKI, 0, Text_1C3CB0, Text_18A5EE
	msgbox Text_18A601, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_1AC21F:: @ 81AC21F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_LADY_GILLIAN, 0, Text_18A645, Text_18A67F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC246
	msgbox Text_18A699, MSGBOX_AUTOCLOSE
	end

EventScript_1AC246:: @ 81AC246
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_LADY_GILLIAN, 0, Text_1C3CF1, Text_18A67F
	msgbox Text_18A699, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_1AC25D:: @ 81AC25D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_YOUNGSTER_DESTIN, 0, Text_18A6DA, Text_18A6FE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC284
	msgbox Text_18A715, MSGBOX_AUTOCLOSE
	end

EventScript_1AC284:: @ 81AC284
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_YOUNGSTER_DESTIN, 0, Text_1C3D47, Text_18A6FE
	msgbox Text_18A715, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_1AC29B:: @ 81AC29B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_TOBY, 0, Text_18A74A, Text_18A786
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC2C2
	msgbox Text_18A7AC, MSGBOX_AUTOCLOSE
	end

EventScript_1AC2C2:: @ 81AC2C2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_TOBY, 0, Text_1C3D73, Text_18A786
	msgbox Text_18A7AC, MSGBOX_AUTOCLOSE
	end

FiveIsland_WaterLabyrinth_EventScript_1AC2D9:: @ 81AC2D9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PKMN_BREEDER_ALIZE, 0, Text_18AAD5, Text_18AB0B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC300
	msgbox Text_18AB37, MSGBOX_AUTOCLOSE
	end

EventScript_1AC300:: @ 81AC300
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PKMN_BREEDER_ALIZE, 0, Text_1C3BB7, Text_18AB0B
	msgbox Text_18AB37, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_1AC317:: @ 81AC317
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_MILO, 0, Text_18AE50, Text_18AEA8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC33E
	msgbox Text_18AEB6, MSGBOX_AUTOCLOSE
	end

EventScript_1AC33E:: @ 81AC33E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_MILO, 0, Text_1C3DA2, Text_18AEA8
	msgbox Text_18AEB6, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_1AC355:: @ 81AC355
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_CHAZ, 0, Text_18AEDC, Text_18AF39
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC37C
	msgbox Text_18AF45, MSGBOX_AUTOCLOSE
	end

EventScript_1AC37C:: @ 81AC37C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_CHAZ, 0, Text_1C3E0F, Text_18AF39
	msgbox Text_18AF45, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_1AC393:: @ 81AC393
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_BIRD_KEEPER_HAROLD, 0, Text_18AF72, Text_18AFCC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC3BA
	msgbox Text_18AFF2, MSGBOX_AUTOCLOSE
	end

EventScript_1AC3BA:: @ 81AC3BA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_BIRD_KEEPER_HAROLD, 0, Text_1C3E6A, Text_18AFCC
	msgbox Text_18AFF2, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC3D1:: @ 81AC3D1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_FISHERMAN_TYLOR, 0, Text_18B400, Text_18B43B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC3F8
	msgbox Text_18B451, MSGBOX_AUTOCLOSE
	end

EventScript_1AC3F8:: @ 81AC3F8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_FISHERMAN_TYLOR, 0, Text_1C3ED0, Text_18B43B
	msgbox Text_18B451, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC40F:: @ 81AC40F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_MYMO, 0, Text_18B48F, Text_18B4C5
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC436
	msgbox Text_18B4D1, MSGBOX_AUTOCLOSE
	end

EventScript_1AC436:: @ 81AC436
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_MYMO, 0, Text_1C3F11, Text_18B4C5
	msgbox Text_18B4D1, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC44D:: @ 81AC44D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_NICOLE, 0, Text_18B4FA, Text_18B539
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC474
	msgbox Text_18B573, MSGBOX_AUTOCLOSE
	end

EventScript_1AC474:: @ 81AC474
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_NICOLE, 0, Text_1C3F51, Text_18B539
	msgbox Text_18B573, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC48B:: @ 81AC48B
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_SIS_AND_BRO_AVA_GEB, 0, Text_18B5C8, Text_18B5F4, Text_18B660
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC4B6
	msgbox Text_18B62E, MSGBOX_AUTOCLOSE
	end

EventScript_1AC4B6:: @ 81AC4B6
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_SIS_AND_BRO_AVA_GEB, 0, Text_1C3F7B, Text_18B5F4, Text_18B660
	msgbox Text_18B62E, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC4D1:: @ 81AC4D1
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_SIS_AND_BRO_AVA_GEB, 0, Text_18B6C1, Text_18B6EF, Text_18B762
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC4FC
	msgbox Text_18B720, MSGBOX_AUTOCLOSE
	end

EventScript_1AC4FC:: @ 81AC4FC
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_SIS_AND_BRO_AVA_GEB, 0, Text_1C3FB3, Text_18B6EF, Text_18B762
	msgbox Text_18B720, MSGBOX_AUTOCLOSE
	end

SixIsland_GreenPath_EventScript_1AC517:: @ 81AC517
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PSYCHIC_JACLYN, 0, Text_18B7B0, Text_18B7F0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC53E
	msgbox Text_18B7FD, MSGBOX_AUTOCLOSE
	end

EventScript_1AC53E:: @ 81AC53E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PSYCHIC_JACLYN, 0, Text_1C3FE9, Text_18B7F0
	msgbox Text_18B7FD, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC555:: @ 81AC555
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_AROMA_LADY_ROSE, 0, Text_18B896, Text_18B8C8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC57C
	msgbox Text_18B8F7, MSGBOX_AUTOCLOSE
	end

EventScript_1AC57C:: @ 81AC57C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_AROMA_LADY_ROSE, 0, Text_1C4028, Text_18B8C8
	msgbox Text_18B8F7, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC593:: @ 81AC593
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_JUGGLER_EDWARD, 0, Text_18B959, Text_18B988
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC5BA
	msgbox Text_18B9A5, MSGBOX_AUTOCLOSE
	end

EventScript_1AC5BA:: @ 81AC5BA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_JUGGLER_EDWARD, 0, Text_1C4057, Text_18B988
	msgbox Text_18B9A5, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC5D1:: @ 81AC5D1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_MALE_SAMIR, 0, Text_18B9EC, Text_18BA47
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC5F8
	msgbox Text_18BA57, MSGBOX_AUTOCLOSE
	end

EventScript_1AC5F8:: @ 81AC5F8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_MALE_SAMIR, 0, Text_1C407F, Text_18BA47
	msgbox Text_18BA57, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC60F:: @ 81AC60F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_SWIMMER_FEMALE_DENISE, 0, Text_18BA86, Text_18BAC0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC636
	msgbox Text_18BAE0, MSGBOX_AUTOCLOSE
	end

EventScript_1AC636:: @ 81AC636
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_SWIMMER_FEMALE_DENISE, 0, Text_1C40D9, Text_18BAC0
	msgbox Text_18BAE0, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC64D:: @ 81AC64D
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_MIU_MIA, 0, Text_18BBBA, Text_18BBE2, Text_18BC24
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC678
	msgbox Text_18BBF6, MSGBOX_AUTOCLOSE
	end

EventScript_1AC678:: @ 81AC678
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_MIU_MIA, 0, Text_1C4138, Text_18BBE2, Text_18BC24
	msgbox Text_18BBF6, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC693:: @ 81AC693
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_TWINS_MIU_MIA, 0, Text_18BC5A, Text_18BC84, Text_18BCCF
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC6BE
	msgbox Text_18BCAE, MSGBOX_AUTOCLOSE
	end

EventScript_1AC6BE:: @ 81AC6BE
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_TWINS_MIU_MIA, 0, Text_1C4166, Text_18BC84, Text_18BCCF
	msgbox Text_18BCAE, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC6D9:: @ 81AC6D9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_EARL, 0, Text_18BB2D, Text_18BB62
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC700
	msgbox Text_18BB8B, MSGBOX_AUTOCLOSE
	end

EventScript_1AC700:: @ 81AC700
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_EARL, 0, Text_1C40FA, Text_18BB62
	msgbox Text_18BB8B, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC717:: @ 81AC717
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_RUIN_MANIAC_STANLY, 0, Text_18BE5D, Text_18BE9B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC73E
	msgbox Text_18BEA0, MSGBOX_AUTOCLOSE
	end

EventScript_1AC73E:: @ 81AC73E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_RUIN_MANIAC_STANLY, 0, Text_1C4196, Text_18BE9B
	msgbox Text_18BEA0, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC755:: @ 81AC755
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_RUIN_MANIAC_FOSTER, 0, Text_18BF05, Text_18BF33
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC77C
	msgbox Text_18BF6C, MSGBOX_AUTOCLOSE
	end

EventScript_1AC77C:: @ 81AC77C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_RUIN_MANIAC_FOSTER, 0, Text_1C41D4, Text_18BF33
	msgbox Text_18BF6C, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC793:: @ 81AC793
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_RUIN_MANIAC_LARRY, 0, Text_18BFC5, Text_18C03B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC7BA
	msgbox Text_18C04C, MSGBOX_AUTOCLOSE
	end

EventScript_1AC7BA:: @ 81AC7BA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_RUIN_MANIAC_LARRY, 0, Text_1C4210, Text_18C03B
	msgbox Text_18C04C, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC7D1:: @ 81AC7D1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_HIKER_DARYL, 0, Text_18C09C, Text_18C0BB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC7F8
	msgbox Text_18C0EA, MSGBOX_AUTOCLOSE
	end

EventScript_1AC7F8:: @ 81AC7F8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_HIKER_DARYL, 0, Text_1C4280, Text_18C0BB
	msgbox Text_18C0EA, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC80F:: @ 81AC80F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_POKEMANIAC_HECTOR, 0, Text_18C10A, Text_18C140
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC836
	msgbox Text_18C17A, MSGBOX_AUTOCLOSE
	end

EventScript_1AC836:: @ 81AC836
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_POKEMANIAC_HECTOR, 0, Text_1C42A0, Text_18C140
	msgbox Text_18C17A, MSGBOX_AUTOCLOSE
	end

SevenIsland_TrainerTower_EventScript_1AC84D:: @ 81AC84D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PSYCHIC_DARIO, 0, Text_18C1ED, Text_18C205
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC874
	msgbox Text_18C20E, MSGBOX_AUTOCLOSE
	end

EventScript_1AC874:: @ 81AC874
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PSYCHIC_DARIO, 0, Text_1C42D6, Text_18C205
	msgbox Text_18C20E, MSGBOX_AUTOCLOSE
	end

SevenIsland_TrainerTower_EventScript_1AC88B:: @ 81AC88B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PSYCHIC_RODETTE, 0, Text_18C283, Text_18C2BC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC8B2
	msgbox Text_18C2D5, MSGBOX_AUTOCLOSE
	end

EventScript_1AC8B2:: @ 81AC8B2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PSYCHIC_RODETTE, 0, Text_1C42EE, Text_18C2BC
	msgbox Text_18C2D5, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC8C9:: @ 81AC8C9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_AROMA_LADY_MIAH, 0, Text_18C3BC, Text_18C3E7
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC8F0
	msgbox Text_18C3FF, MSGBOX_AUTOCLOSE
	end

EventScript_1AC8F0:: @ 81AC8F0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_AROMA_LADY_MIAH, 0, Text_1C4327, Text_18C3E7
	msgbox Text_18C3FF, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC907:: @ 81AC907
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_YOUNG_COUPLE_EVE_JON, 0, Text_18C632, Text_18C662, Text_18C6AB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC932
	msgbox Text_18C683, MSGBOX_AUTOCLOSE
	end

EventScript_1AC932:: @ 81AC932
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_YOUNG_COUPLE_EVE_JON, 0, Text_1C4416, Text_18C662, Text_18C6AB
	msgbox Text_18C683, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC94D:: @ 81AC94D
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_YOUNG_COUPLE_EVE_JON, 0, Text_18C700, Text_18C73B, Text_18C7BD
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC978
	msgbox Text_18C773, MSGBOX_AUTOCLOSE
	end

EventScript_1AC978:: @ 81AC978
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_YOUNG_COUPLE_EVE_JON, 0, Text_1C444C, Text_18C73B, Text_18C7BD
	msgbox Text_18C773, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC993:: @ 81AC993
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_JUGGLER_MASON, 0, Text_18C44B, Text_18C473
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC9BA
	msgbox Text_18C4BA, MSGBOX_AUTOCLOSE
	end

EventScript_1AC9BA:: @ 81AC9BA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_JUGGLER_MASON, 0, Text_1C4374, Text_18C473
	msgbox Text_18C4BA, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC9D1:: @ 81AC9D1
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PKMN_RANGER_NICOLAS, 0, Text_18C500, Text_18C543
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1AC9F8
	msgbox Text_18C54B, MSGBOX_AUTOCLOSE
	end

EventScript_1AC9F8:: @ 81AC9F8
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PKMN_RANGER_NICOLAS, 0, Text_1C43AD, Text_18C543
	msgbox Text_18C54B, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1ACA0F:: @ 81ACA0F
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PKMN_RANGER_MADELINE, 0, Text_18C5AA, Text_18C5CD
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACA36
	msgbox Text_18C5F5, MSGBOX_AUTOCLOSE
	end

EventScript_1ACA36:: @ 81ACA36
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PKMN_RANGER_MADELINE, 0, Text_1C43EC, Text_18C5CD
	msgbox Text_18C5F5, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACA4D:: @ 81ACA4D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_CRUSH_GIRL_CYNDY, 0, Text_18C887, Text_18C8A6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACA74
	msgbox Text_18C8C2, MSGBOX_AUTOCLOSE
	end

EventScript_1ACA74:: @ 81ACA74
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_CRUSH_GIRL_CYNDY, 0, Text_1C4491, Text_18C8A6
	msgbox Text_18C8C2, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACA8B:: @ 81ACA8B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_TAMER_EVAN, 0, Text_18C8FD, Text_18C980
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACAB2
	msgbox Text_18C999, MSGBOX_AUTOCLOSE
	end

EventScript_1ACAB2:: @ 81ACAB2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_TAMER_EVAN, 0, Text_1C44CB, Text_18C980
	msgbox Text_18C999, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACAC9:: @ 81ACAC9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PKMN_RANGER_JACKSON, 0, Text_18CA2F, Text_18CA6F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACAF0
	msgbox Text_18CA9C, MSGBOX_AUTOCLOSE
	end

EventScript_1ACAF0:: @ 81ACAF0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PKMN_RANGER_JACKSON, 0, Text_1C454E, Text_18CA6F
	msgbox Text_18CA9C, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACB07:: @ 81ACB07
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PKMN_RANGER_KATELYN, 0, Text_18CB16, Text_18CB3E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACB2E
	msgbox Text_18CB6C, MSGBOX_AUTOCLOSE
	end

EventScript_1ACB2E:: @ 81ACB2E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PKMN_RANGER_KATELYN, 0, Text_1C458E, Text_18CB3E
	msgbox Text_18CB6C, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACB45:: @ 81ACB45
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_COOLTRAINER_LEROY, 0, Text_18CBB4, Text_18CBE0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACB6C
	msgbox Text_18CC09, MSGBOX_AUTOCLOSE
	end

EventScript_1ACB6C:: @ 81ACB6C
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_COOLTRAINER_LEROY, 0, Text_1C45C2, Text_18CBE0
	msgbox Text_18CC09, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACB83:: @ 81ACB83
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_COOLTRAINER_MICHELLE, 0, Text_18CC4F, Text_18CCAE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACBAA
	msgbox Text_18CCEA, MSGBOX_AUTOCLOSE
	end

EventScript_1ACBAA:: @ 81ACBAA
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_COOLTRAINER_MICHELLE, 0, Text_1C45FB, Text_18CCAE
	msgbox Text_18CCEA, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACBC1:: @ 81ACBC1
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_COOL_COUPLE_LEX_NYA, 0, Text_18CD49, Text_18CD75, Text_18CDE2
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACBEC
	msgbox Text_18CD9C, MSGBOX_AUTOCLOSE
	end

EventScript_1ACBEC:: @ 81ACBEC
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_COOL_COUPLE_LEX_NYA, 0, Text_1C4662, Text_18CD75, Text_18CDE2
	msgbox Text_18CD9C, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACC07:: @ 81ACC07
	trainerbattle TRAINER_BATTLE_DOUBLE, TRAINER_COOL_COUPLE_LEX_NYA, 0, Text_18CE20, Text_18CE5A, Text_18CEF4
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACC32
	msgbox Text_18CE78, MSGBOX_AUTOCLOSE
	end

EventScript_1ACC32:: @ 81ACC32
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, TRAINER_COOL_COUPLE_LEX_NYA, 0, Text_1C4699, Text_18CE5A, Text_18CEF4
	msgbox Text_18CE78, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_1ACC4D:: @ 81ACC4D
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_RUIN_MANIAC_BRANDON, 0, Text_18CFFB, Text_18D02A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACC74
	msgbox Text_18D061, MSGBOX_AUTOCLOSE
	end

EventScript_1ACC74:: @ 81ACC74
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_RUIN_MANIAC_BRANDON, 0, Text_1C46D3, Text_18D02A
	msgbox Text_18D061, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_1ACC8B:: @ 81ACC8B
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_RUIN_MANIAC_BENJAMIN, 0, Text_18D0D9, Text_18D108
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACCB2
	msgbox Text_18D125, MSGBOX_AUTOCLOSE
	end

EventScript_1ACCB2:: @ 81ACCB2
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_RUIN_MANIAC_BENJAMIN, 0, Text_1C470A, Text_18D108
	msgbox Text_18D125, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_1ACCC9:: @ 81ACCC9
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_PAINTER_EDNA, 0, Text_18D18F, Text_18D1B5
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACCF0
	msgbox Text_18D1E3, MSGBOX_AUTOCLOSE
	end

EventScript_1ACCF0:: @ 81ACCF0
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_PAINTER_EDNA, 0, Text_1C4739, Text_18D1B5
	msgbox Text_18D1E3, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_1ACD07:: @ 81ACD07
	trainerbattle TRAINER_BATTLE_SINGLE, TRAINER_GENTLEMAN_CLIFFORD, 0, Text_18D22F, Text_18D26D
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if eq, EventScript_1ACD2E
	msgbox Text_18D284, MSGBOX_AUTOCLOSE
	end

EventScript_1ACD2E:: @ 81ACD2E
	trainerbattle TRAINER_BATTLE_REMATCH, TRAINER_GENTLEMAN_CLIFFORD, 0, Text_1C476A, Text_18D26D
	msgbox Text_18D284, MSGBOX_AUTOCLOSE
	end
