Route3_EventScript_Ben:: @ 81A93C9
	trainerbattle_single TRAINER_YOUNGSTER_BEN, Route3_Text_BenIntro, Route3_Text_BenDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_BenRematch
	msgbox Route3_Text_BenPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_BenRematch:: @ 81A93F0
	trainerbattle_rematch TRAINER_YOUNGSTER_BEN, Route3_Text_BenRematchIntro, Route3_Text_BenDefeat
	msgbox Route3_Text_BenPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_Calvin:: @ 81A9407
	trainerbattle_single TRAINER_YOUNGSTER_CALVIN, Route3_Text_CalvinIntro, Route3_Text_CalvinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_CalvinRematch
	msgbox Route3_Text_CalvinPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_CalvinRematch:: @ 81A942E
	trainerbattle_rematch TRAINER_YOUNGSTER_CALVIN, Route3_Text_CalvinRematchIntro, Route3_Text_CalvinDefeat
	msgbox Route3_Text_CalvinPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_Colton:: @ 81A9445
	trainerbattle_single TRAINER_BUG_CATCHER_COLTON, Route3_Text_ColtonIntro, Route3_Text_ColtonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_ColtonRematch
	msgbox Route3_Text_ColtonPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_ColtonRematch:: @ 81A946C
	trainerbattle_rematch TRAINER_BUG_CATCHER_COLTON, Route3_Text_ColtonRematchIntro, Route3_Text_ColtonDefeat
	msgbox Route3_Text_ColtonPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_Greg:: @ 81A9483
	trainerbattle_single TRAINER_BUG_CATCHER_GREG, Route3_Text_GregIntro, Route3_Text_GregDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_GregRematch
	msgbox Route3_Text_GregPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_GregRematch:: @ 81A94AA
	trainerbattle_rematch TRAINER_BUG_CATCHER_GREG, Route3_Text_GregRematchIntro, Route3_Text_GregDefeat
	msgbox Route3_Text_GregPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_James:: @ 81A94C1
	trainerbattle_single TRAINER_BUG_CATCHER_JAMES, Route3_Text_JamesIntro, Route3_Text_JamesDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_JamesRematch
	msgbox Route3_Text_JamesPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_JamesRematch:: @ 81A94E8
	trainerbattle_rematch TRAINER_BUG_CATCHER_JAMES, Route3_Text_JamesRematchIntro, Route3_Text_JamesDefeat
	msgbox Route3_Text_JamesPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_Janice:: @ 81A94FF
	trainerbattle_single TRAINER_LASS_JANICE, Route3_Text_JaniceIntro, Route3_Text_JaniceDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_JaniceRematch
	msgbox Route3_Text_JanicePostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_JaniceRematch:: @ 81A9526
	trainerbattle_rematch TRAINER_LASS_JANICE, Route3_Text_JaniceRematchIntro, Route3_Text_JaniceDefeat
	msgbox Route3_Text_JanicePostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_Sally:: @ 81A953D
	trainerbattle_single TRAINER_LASS_SALLY, Route3_Text_SallyIntro, Route3_Text_SallyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_SallyRematch
	msgbox Route3_Text_SallyPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_SallyRematch:: @ 81A9564
	trainerbattle_rematch TRAINER_LASS_SALLY, Route3_Text_SallyRematchIntro, Route3_Text_SallyDefeat
	msgbox Route3_Text_SallyPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_Robin:: @ 81A957B
	trainerbattle_single TRAINER_LASS_ROBIN, Route3_Text_RobinIntro, Route3_Text_RobinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route3_EventScript_RobinRematch
	msgbox Route3_Text_RobinPostBattle, MSGBOX_AUTOCLOSE
	end

Route3_EventScript_RobinRematch:: @ 81A95A2
	trainerbattle_rematch TRAINER_LASS_ROBIN, Route3_Text_RobinRematchIntro, Route3_Text_RobinDefeat
	msgbox Route3_Text_RobinPostBattle, MSGBOX_AUTOCLOSE
	end

Route4_EventScript_Crissy:: @ 81A95B9
	trainerbattle_single TRAINER_LASS_CRISSY, Route4_Text_CrissyIntro, Route4_Text_CrissyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route4_EventScript_CrissyRematch
	msgbox Route4_Text_CrissyPostBattle, MSGBOX_AUTOCLOSE
	end

Route4_EventScript_CrissyRematch:: @ 81A95E0
	trainerbattle_rematch TRAINER_LASS_CRISSY, Route4_Text_CrissyRematchIntro, Route4_Text_CrissyDefeat
	msgbox Route4_Text_CrissyPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_Timmy:: @ 81A95F7
	trainerbattle_single TRAINER_YOUNGSTER_TIMMY, Route24_Text_TimmyIntro, Route24_Text_TimmyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route24_EventScript_TimmyRematch
	msgbox Route24_Text_TimmyPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_TimmyRematch:: @ 81A961E
	trainerbattle_rematch TRAINER_YOUNGSTER_TIMMY, Route24_Text_TimmyRematchIntro, Route24_Text_TimmyDefeat
	msgbox Route24_Text_TimmyPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_Cale:: @ 81A9635
	trainerbattle_single TRAINER_BUG_CATCHER_CALE, Route24_Text_CaleIntro, Route24_Text_CaleDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route24_EventScript_CaleRematch
	msgbox Route24_Text_CalePostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_CaleRematch:: @ 81A965C
	trainerbattle_rematch TRAINER_BUG_CATCHER_CALE, Route24_Text_CaleRematchIntro, Route24_Text_CaleDefeat
	msgbox Route24_Text_CalePostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_Reli:: @ 81A9673
	trainerbattle_single TRAINER_LASS_RELI, Route24_Text_ReliIntro, Route24_Text_ReliDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route24_EventScript_ReliRematch
	msgbox Route24_Text_ReliPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_ReliRematch:: @ 81A969A
	trainerbattle_rematch TRAINER_LASS_RELI, Route24_Text_ReliRematchIntro, Route24_Text_ReliDefeat
	msgbox Route24_Text_ReliPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_Ali:: @ 81A96B1
	trainerbattle_single TRAINER_LASS_ALI, Route24_Text_AliIntro, Route24_Text_AliDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route24_EventScript_AliRematch
	msgbox Route24_Text_AliPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_AliRematch:: @ 81A96D8
	trainerbattle_rematch TRAINER_LASS_ALI, Route24_Text_AliRematchIntro, Route24_Text_AliDefeat
	msgbox Route24_Text_AliPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_Shane:: @ 81A96EF
	trainerbattle_single TRAINER_CAMPER_SHANE, Route24_Text_ShaneIntro, Route24_Text_ShaneDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route24_EventScript_ShaneRematch
	msgbox Route24_Text_ShanePostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_ShaneRematch:: @ 81A9716
	trainerbattle_rematch TRAINER_CAMPER_SHANE, Route24_Text_ShaneRematchIntro, Route24_Text_ShaneDefeat
	msgbox Route24_Text_ShanePostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_Ethan:: @ 81A972D
	trainerbattle_single TRAINER_CAMPER_ETHAN, Route24_Text_EthanIntro, Route24_Text_EthanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route24_EventScript_EthanRematch
	msgbox Route24_Text_EthanPostBattle, MSGBOX_AUTOCLOSE
	end

Route24_EventScript_EthanRematch:: @ 81A9754
	trainerbattle_rematch TRAINER_CAMPER_ETHAN, Route24_Text_EthanRematchIntro, Route24_Text_EthanDefeat
	msgbox Route24_Text_EthanPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Joey:: @ 81A976B
	trainerbattle_single TRAINER_YOUNGSTER_JOEY, Route25_Text_JoeyIntro, Route25_Text_JoeyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_JoeyRematch
	msgbox Route25_Text_JoeyPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_JoeyRematch:: @ 81A9792
	trainerbattle_rematch TRAINER_YOUNGSTER_JOEY, Route25_Text_JoeyRematchIntro, Route25_Text_JoeyDefeat
	msgbox Route25_Text_JoeyPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Dan:: @ 81A97A9
	trainerbattle_single TRAINER_YOUNGSTER_DAN, Route25_Text_DanIntro, Route25_Text_DanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_DanRematch
	msgbox Route25_Text_DanPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_DanRematch:: @ 81A97D0
	trainerbattle_rematch TRAINER_YOUNGSTER_DAN, Route25_Text_DanRematchIntro, Route25_Text_DanDefeat
	msgbox Route25_Text_DanPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Chad:: @ 81A97E7
	trainerbattle_single TRAINER_YOUNGSTER_CHAD, Route25_Text_ChadIntro, Route25_Text_ChadDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_ChadRematch
	msgbox Route25_Text_ChadPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_ChadRematch:: @ 81A980E
	trainerbattle_rematch TRAINER_YOUNGSTER_CHAD, Route25_Text_ChadRematchIntro, Route25_Text_ChadDefeat
	msgbox Route25_Text_ChadPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Kelsey:: @ 81A9825
	trainerbattle_single TRAINER_PICNICKER_KELSEY, Route25_Text_KelseyIntro, Route25_Text_KelseyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_KelseyRematch
	msgbox Route25_Text_KelseyPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_KelseyRematch:: @ 81A984C
	trainerbattle_rematch TRAINER_PICNICKER_KELSEY, Route25_Text_KelseyRematchIntro, Route25_Text_KelseyDefeat
	msgbox Route25_Text_KelseyPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Haley:: @ 81A9863
	trainerbattle_single TRAINER_LASS_HALEY, Route25_Text_HaleyIntro, Route25_Text_HaleyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_HaleyRematch
	msgbox Route25_Text_HaleyPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_HaleyRematch:: @ 81A988A
	trainerbattle_rematch TRAINER_LASS_HALEY, Route25_Text_HaleyRematchIntro, Route25_Text_HaleyDefeat
	msgbox Route25_Text_HaleyPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Franklin:: @ 81A98A1
	trainerbattle_single TRAINER_HIKER_FRANKLIN, Route25_Text_FranklinIntro, Route25_Text_FranklinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_FranklinRematch
	msgbox Route25_Text_FranklinPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_FranklinRematch:: @ 81A98C8
	trainerbattle_rematch TRAINER_HIKER_FRANKLIN, Route25_Text_FranklinRematchIntro, Route25_Text_FranklinDefeat
	msgbox Route25_Text_FranklinPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Nob:: @ 81A98DF
	trainerbattle_single TRAINER_HIKER_NOB, Route25_Text_NobIntro, Route25_Text_NobDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_NobRematch
	msgbox Route25_Text_NobPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_NobRematch:: @ 81A9906
	trainerbattle_rematch TRAINER_HIKER_NOB, Route25_Text_NobRematchIntro, Route25_Text_NobDefeat
	msgbox Route25_Text_NobPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Wayne:: @ 81A991D
	trainerbattle_single TRAINER_HIKER_WAYNE, Route25_Text_WayneIntro, Route25_Text_WayneDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_WayneRematch
	msgbox Route25_Text_WaynePostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_WayneRematch:: @ 81A9944
	trainerbattle_rematch TRAINER_HIKER_WAYNE, Route25_Text_WayneRematchIntro, Route25_Text_WayneDefeat
	msgbox Route25_Text_WaynePostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_Flint:: @ 81A995B
	trainerbattle_single TRAINER_CAMPER_FLINT, Route25_Text_FlintIntro, Route25_Text_FlintDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route25_EventScript_FlintRematch
	msgbox Route25_Text_FlintPostBattle, MSGBOX_AUTOCLOSE
	end

Route25_EventScript_FlintRematch:: @ 81A9982
	trainerbattle_rematch TRAINER_CAMPER_FLINT, Route25_Text_FlintRematchIntro, Route25_Text_FlintDefeat
	msgbox Route25_Text_FlintPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_Keigo:: @ 81A9999
	trainerbattle_single TRAINER_BUG_CATCHER_KEIGO, Route6_Text_KeigoIntro, Route6_Text_KeigoDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route6_EventScript_KeigoRematch
	msgbox Route6_Text_KeigoPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_KeigoRematch:: @ 81A99C0
	trainerbattle_rematch TRAINER_BUG_CATCHER_KEIGO, Route6_Text_KeigoRematchIntro, Route6_Text_KeigoDefeat
	msgbox Route6_Text_KeigoPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_Elijah:: @ 81A99D7
	trainerbattle_single TRAINER_BUG_CATCHER_ELIJAH, Route6_Text_ElijahIntro, Route6_Text_ElijahDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route6_EventScript_ElijahRematch
	msgbox Route6_Text_ElijahPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_ElijahRematch:: @ 81A99FE
	trainerbattle_rematch TRAINER_BUG_CATCHER_ELIJAH, Route6_Text_ElijahRematchIntro, Route6_Text_ElijahDefeat
	msgbox Route6_Text_ElijahPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_Ricky:: @ 81A9A15
	trainerbattle_single TRAINER_CAMPER_RICKY, Route6_Text_RickyIntro, Route6_Text_RickyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route6_EventScript_RickyRematch
	msgbox Route6_Text_RickyPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_RickyRematch:: @ 81A9A3C
	trainerbattle_rematch TRAINER_CAMPER_RICKY, Route6_Text_RickyRematchIntro, Route6_Text_RickyDefeat
	msgbox Route6_Text_RickyPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_Jeff:: @ 81A9A53
	trainerbattle_single TRAINER_CAMPER_JEFF, Route6_Text_JeffIntro, Route6_Text_JeffDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route6_EventScript_JeffRematch
	msgbox Route6_Text_JeffPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_JeffRematch:: @ 81A9A7A
	trainerbattle_rematch TRAINER_CAMPER_JEFF, Route6_Text_JeffRematchIntro, Route6_Text_JeffDefeat
	msgbox Route6_Text_JeffPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_Nancy:: @ 81A9A91
	trainerbattle_single TRAINER_PICNICKER_NANCY, Route6_Text_NancyIntro, Route6_Text_NancyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route6_EventScript_NancyRematch
	msgbox Route6_Text_NancyPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_NancyRematch:: @ 81A9AB8
	trainerbattle_rematch TRAINER_PICNICKER_NANCY, Route6_Text_NancyRematchIntro, Route6_Text_NancyDefeat
	msgbox Route6_Text_NancyPostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_Isabelle:: @ 81A9ACF
	trainerbattle_single TRAINER_PICNICKER_ISABELLE, Route6_Text_IsabelleIntro, Route6_Text_IsabelleDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route6_EventScript_IsabelleRematch
	msgbox Route6_Text_IsabellePostBattle, MSGBOX_AUTOCLOSE
	end

Route6_EventScript_IsabelleRematch:: @ 81A9AF6
	trainerbattle_rematch TRAINER_PICNICKER_ISABELLE, Route6_Text_IsabelleRematchIntro, Route6_Text_IsabelleDefeat
	msgbox Route6_Text_IsabellePostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Eddie:: @ 81A9B0D
	trainerbattle_single TRAINER_YOUNGSTER_EDDIE, Route11_Text_EddieIntro, Route11_Text_EddieDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_EddieRematch
	msgbox Route11_Text_EddiePostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_EddieRematch:: @ 81A9B34
	trainerbattle_rematch TRAINER_YOUNGSTER_EDDIE, Route11_Text_EddieRematchIntro, Route11_Text_EddieDefeat
	msgbox Route11_Text_EddiePostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Dillon:: @ 81A9B4B
	trainerbattle_single TRAINER_YOUNGSTER_DILLON, Route11_Text_DillonIntro, Route11_Text_DillonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_DillonRematch
	msgbox Route11_Text_DillonPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_DillonRematch:: @ 81A9B72
	trainerbattle_rematch TRAINER_YOUNGSTER_DILLON, Route11_Text_DillonRematchIntro, Route11_Text_DillonDefeat
	msgbox Route11_Text_DillonPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Yasu:: @ 81A9B89
	trainerbattle_single TRAINER_YOUNGSTER_YASU, Route11_Text_YasuIntro, Route11_Text_YasuDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_YasuRematch
	msgbox Route11_Text_YasuPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_YasuRematch:: @ 81A9BB0
	trainerbattle_rematch TRAINER_YOUNGSTER_YASU, Route11_Text_YasuRematchIntro, Route11_Text_YasuDefeat
	msgbox Route11_Text_YasuPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Dave:: @ 81A9BC7
	trainerbattle_single TRAINER_YOUNGSTER_DAVE, Route11_Text_DaveIntro, Route11_Text_DaveDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_DaveRematch
	msgbox Route11_Text_DavePostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_DaveRematch:: @ 81A9BEE
	trainerbattle_rematch TRAINER_YOUNGSTER_DAVE, Route11_Text_DaveRematchIntro, Route11_Text_DaveDefeat
	msgbox Route11_Text_DavePostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Braxton:: @ 81A9C05
	trainerbattle_single TRAINER_ENGINEER_BRAXTON, Route11_Text_BraxtonIntro, Route11_Text_BraxtonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_BraxtonRematch
	msgbox Route11_Text_BraxtonPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_BraxtonRematch:: @ 81A9C2C
	trainerbattle_rematch TRAINER_ENGINEER_BRAXTON, Route11_Text_BraxtonRematchIntro, Route11_Text_BraxtonDefeat
	msgbox Route11_Text_BraxtonPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Bernie:: @ 81A9C43
	trainerbattle_single TRAINER_ENGINEER_BERNIE, Route11_Text_BernieIntro, Route11_Text_BernieDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_BernieRematch
	msgbox Route11_Text_BerniePostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_BernieRematch:: @ 81A9C6A
	trainerbattle_rematch TRAINER_ENGINEER_BERNIE, Route11_Text_BernieRematchIntro, Route11_Text_BernieDefeat
	msgbox Route11_Text_BerniePostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Hugo:: @ 81A9C81
	trainerbattle_single TRAINER_GAMER_HUGO, Route11_Text_HugoIntro, Route11_Text_HugoDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_HugoRematch
	msgbox Route11_Text_HugoPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_HugoRematch:: @ 81A9CA8
	trainerbattle_rematch TRAINER_GAMER_HUGO, Route11_Text_HugoRematchIntro, Route11_Text_HugoDefeat
	msgbox Route11_Text_HugoPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Jasper:: @ 81A9CBF
	trainerbattle_single TRAINER_GAMER_JASPER, Route11_Text_JasperIntro, Route11_Text_JasperDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_JasperRematch
	msgbox Route11_Text_JasperPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_JasperRematch:: @ 81A9CE6
	trainerbattle_rematch TRAINER_GAMER_JASPER, Route11_Text_JasperRematchIntro, Route11_Text_JasperDefeat
	msgbox Route11_Text_JasperPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Dirk:: @ 81A9CFD
	trainerbattle_single TRAINER_GAMER_DIRK, Route11_Text_DirkIntro, Route11_Text_DirkDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_DirkRematch
	msgbox Route11_Text_DirkPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_DirkRematch:: @ 81A9D24
	trainerbattle_rematch TRAINER_GAMER_DIRK, Route11_Text_DirkRematchIntro, Route11_Text_DirkDefeat
	msgbox Route11_Text_DirkPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_Darian:: @ 81A9D3B
	trainerbattle_single TRAINER_GAMER_DARIAN, Route11_Text_DarianIntro, Route11_Text_DarianDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route11_EventScript_DarianRematch
	msgbox Route11_Text_DarianPostBattle, MSGBOX_AUTOCLOSE
	end

Route11_EventScript_DarianRematch:: @ 81A9D62
	trainerbattle_rematch TRAINER_GAMER_DARIAN, Route11_Text_DarianRematchIntro, Route11_Text_DarianDefeat
	msgbox Route11_Text_DarianPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Brent:: @ 81A9D79
	trainerbattle_single TRAINER_BUG_CATCHER_BRENT, Route9_Text_BrentIntro, Route9_Text_BrentDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_BrentRematch
	msgbox Route9_Text_BrentPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_BrentRematch:: @ 81A9DA0
	trainerbattle_rematch TRAINER_BUG_CATCHER_BRENT, Route9_Text_BrentRematchIntro, Route9_Text_BrentDefeat
	msgbox Route9_Text_BrentPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Conner:: @ 81A9DB7
	trainerbattle_single TRAINER_BUG_CATCHER_CONNER, Route9_Text_ConnerIntro, Route9_Text_ConnerDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_ConnerRematch
	msgbox Route9_Text_ConnerPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_ConnerRematch:: @ 81A9DDE
	trainerbattle_rematch TRAINER_BUG_CATCHER_CONNER, Route9_Text_ConnerRematchIntro, Route9_Text_ConnerDefeat
	msgbox Route9_Text_ConnerPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Chris:: @ 81A9DF5
	trainerbattle_single TRAINER_CAMPER_CHRIS, Route9_Text_ChrisIntro, Route9_Text_ChrisDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_ChrisRematch
	msgbox Route9_Text_ChrisPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_ChrisRematch:: @ 81A9E1C
	trainerbattle_rematch TRAINER_CAMPER_CHRIS, Route9_Text_ChrisRematchIntro, Route9_Text_ChrisDefeat
	msgbox Route9_Text_ChrisPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Drew:: @ 81A9E33
	trainerbattle_single TRAINER_CAMPER_DREW, Route9_Text_DrewIntro, Route9_Text_DrewDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_DrewRematch
	msgbox Route9_Text_DrewPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_DrewRematch:: @ 81A9E5A
	trainerbattle_rematch TRAINER_CAMPER_DREW, Route9_Text_DrewRematchIntro, Route9_Text_DrewDefeat
	msgbox Route9_Text_DrewPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Alicia:: @ 81A9E71
	trainerbattle_single TRAINER_PICNICKER_ALICIA, Route9_Text_AliciaIntro, Route9_Text_AliciaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_AliciaRematch
	msgbox Route9_Text_AliciaPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_AliciaRematch:: @ 81A9E98
	trainerbattle_rematch TRAINER_PICNICKER_ALICIA, Route9_Text_AliciaRematchIntro, Route9_Text_AliciaDefeat
	msgbox Route9_Text_AliciaPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Caitlin:: @ 81A9EAF
	trainerbattle_single TRAINER_PICNICKER_CAITLIN, Route9_Text_CaitlinIntro, Route9_Text_CaitlinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_CaitlinRematch
	msgbox Route9_Text_CaitlinPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_CaitlinRematch:: @ 81A9ED6
	trainerbattle_rematch TRAINER_PICNICKER_CAITLIN, Route9_Text_CaitlinRematchIntro, Route9_Text_CaitlinDefeat
	msgbox Route9_Text_CaitlinPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Alan:: @ 81A9EED
	trainerbattle_single TRAINER_HIKER_ALAN, Route9_Text_AlanIntro, Route9_Text_AlanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_AlanRematch
	msgbox Route9_Text_AlanPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_AlanRematch:: @ 81A9F14
	trainerbattle_rematch TRAINER_HIKER_ALAN, Route9_Text_AlanRematchIntro, Route9_Text_AlanDefeat
	msgbox Route9_Text_AlanPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Brice:: @ 81A9F2B
	trainerbattle_single TRAINER_HIKER_BRICE, Route9_Text_BriceIntro, Route9_Text_BriceDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_BriceRematch
	msgbox Route9_Text_BricePostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_BriceRematch:: @ 81A9F52
	trainerbattle_rematch TRAINER_HIKER_BRICE, Route9_Text_BriceRematchIntro, Route9_Text_BriceDefeat
	msgbox Route9_Text_BricePostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_Jeremy:: @ 81A9F69
	trainerbattle_single TRAINER_HIKER_JEREMY, Route9_Text_JeremyIntro, Route9_Text_JeremyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route9_EventScript_JeremyRematch
	msgbox Route9_Text_JeremyPostBattle, MSGBOX_AUTOCLOSE
	end

Route9_EventScript_JeremyRematch:: @ 81A9F90
	trainerbattle_rematch TRAINER_HIKER_JEREMY, Route9_Text_JeremyRematchIntro, Route9_Text_JeremyDefeat
	msgbox Route9_Text_JeremyPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_Heidi:: @ 81A9FA7
	trainerbattle_single TRAINER_PICNICKER_HEIDI, Route10_Text_HeidiIntro, Route10_Text_HeidiDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route10_EventScript_HeidiRematch
	msgbox Route10_Text_HeidiPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_HeidiRematch:: @ 81A9FCE
	trainerbattle_rematch TRAINER_PICNICKER_HEIDI, Route10_Text_HeidiRematchIntro, Route10_Text_HeidiDefeat
	msgbox Route10_Text_HeidiPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_Carol:: @ 81A9FE5
	trainerbattle_single TRAINER_PICNICKER_CAROL, Route10_Text_CarolIntro, Route10_Text_CarolDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route10_EventScript_CarolRematch
	msgbox Route10_Text_CarolPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_CarolRematch:: @ 81AA00C
	trainerbattle_rematch TRAINER_PICNICKER_CAROL, Route10_Text_CarolRematchIntro, Route10_Text_CarolDefeat
	msgbox Route10_Text_CarolPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_Mark:: @ 81AA023
	trainerbattle_single TRAINER_POKEMANIAC_MARK, Route10_Text_MarkIntro, Route10_Text_MarkDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route10_EventScript_MarkRematch
	msgbox Route10_Text_MarkPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_MarkRematch:: @ 81AA04A
	trainerbattle_rematch TRAINER_POKEMANIAC_MARK, Route10_Text_MarkRematchIntro, Route10_Text_MarkDefeat
	msgbox Route10_Text_MarkPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_Herman:: @ 81AA061
	trainerbattle_single TRAINER_POKEMANIAC_HERMAN, Route10_Text_HermanIntro, Route10_Text_HermanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route10_EventScript_HermanRematch
	msgbox Route10_Text_HermanPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_HermanRematch:: @ 81AA088
	trainerbattle_rematch TRAINER_POKEMANIAC_HERMAN, Route10_Text_HermanRematchIntro, Route10_Text_HermanDefeat
	msgbox Route10_Text_HermanPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_Clark:: @ 81AA09F
	trainerbattle_single TRAINER_HIKER_CLARK, Route10_Text_ClarkIntro, Route10_Text_ClarkDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route10_EventScript_ClarkRematch
	msgbox Route10_Text_ClarkPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_ClarkRematch:: @ 81AA0C6
	trainerbattle_rematch TRAINER_HIKER_CLARK, Route10_Text_ClarkRematchIntro, Route10_Text_ClarkDefeat
	msgbox Route10_Text_ClarkPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_Trent:: @ 81AA0DD
	trainerbattle_single TRAINER_HIKER_TRENT, Route10_Text_TrentIntro, Route10_Text_TrentDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route10_EventScript_TrentRematch
	msgbox Route10_Text_TrentPostBattle, MSGBOX_AUTOCLOSE
	end

Route10_EventScript_TrentRematch:: @ 81AA104
	trainerbattle_rematch TRAINER_HIKER_TRENT, Route10_Text_TrentRematchIntro, Route10_Text_TrentDefeat
	msgbox Route10_Text_TrentPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Paige:: @ 81AA11B
	trainerbattle_single TRAINER_LASS_PAIGE, Route8_Text_PaigeIntro, Route8_Text_PaigeDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_PaigeRematch
	msgbox Route8_Text_PaigePostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_PaigeRematch:: @ 81AA142
	trainerbattle_rematch TRAINER_LASS_PAIGE, Route8_Text_PaigeRematchIntro, Route8_Text_PaigeDefeat
	msgbox Route8_Text_PaigePostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Andrea:: @ 81AA159
	trainerbattle_single TRAINER_LASS_ANDREA, Route8_Text_AndreaIntro, Route8_Text_AndreaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_AndreaRematch
	msgbox Route8_Text_AndreaPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_AndreaRematch:: @ 81AA180
	trainerbattle_rematch TRAINER_LASS_ANDREA, Route8_Text_AndreaRematchIntro, Route8_Text_AndreaDefeat
	msgbox Route8_Text_AndreaPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Megan:: @ 81AA197
	trainerbattle_single TRAINER_LASS_MEGAN, Route8_Text_MeganIntro, Route8_Text_MeganDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_MeganRematch
	msgbox Route8_Text_MeganPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_MeganRematch:: @ 81AA1BE
	trainerbattle_rematch TRAINER_LASS_MEGAN, Route8_Text_MeganRematchIntro, Route8_Text_MeganDefeat
	msgbox Route8_Text_MeganPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Julia:: @ 81AA1D5
	trainerbattle_single TRAINER_LASS_JULIA, Route8_Text_JuliaIntro, Route8_Text_JuliaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_JuliaRematch
	msgbox Route8_Text_JuliaPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_JuliaRematch:: @ 81AA1FC
	trainerbattle_rematch TRAINER_LASS_JULIA, Route8_Text_JuliaRematchIntro, Route8_Text_JuliaDefeat
	msgbox Route8_Text_JuliaPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Aidan:: @ 81AA213
	trainerbattle_single TRAINER_SUPER_NERD_AIDAN, Route8_Text_AidanIntro, Route8_Text_AidanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_AidanRematch
	msgbox Route8_Text_AidanPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_AidanRematch:: @ 81AA23A
	trainerbattle_rematch TRAINER_SUPER_NERD_AIDAN, Route8_Text_AidanRematchIntro, Route8_Text_AidanDefeat
	msgbox Route8_Text_AidanPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Glenn:: @ 81AA251
	trainerbattle_single TRAINER_SUPER_NERD_GLENN, Route8_Text_GlennIntro, Route8_Text_GlennDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_GlennRematch
	msgbox Route8_Text_GlennPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_GlennRematch:: @ 81AA278
	trainerbattle_rematch TRAINER_SUPER_NERD_GLENN, Route8_Text_GlennRematchIntro, Route8_Text_GlennDefeat
	msgbox Route8_Text_GlennPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Leslie:: @ 81AA28F
	trainerbattle_single TRAINER_SUPER_NERD_LESLIE, Route8_Text_LeslieIntro, Route8_Text_LeslieDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_LeslieRematch
	msgbox Route8_Text_LesliePostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_LeslieRematch:: @ 81AA2B6
	trainerbattle_rematch TRAINER_SUPER_NERD_LESLIE, Route8_Text_LeslieRematchIntro, Route8_Text_LeslieDefeat
	msgbox Route8_Text_LesliePostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Stan:: @ 81AA2CD
	trainerbattle_single TRAINER_GAMER_STAN, Route8_Text_StanIntro, Route8_Text_StanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_StanRematch
	msgbox Route8_Text_StanPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_StanRematch:: @ 81AA2F4
	trainerbattle_rematch TRAINER_GAMER_STAN, Route8_Text_StanRematchIntro, Route8_Text_StanDefeat
	msgbox Route8_Text_StanPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Rich:: @ 81AA30B
	trainerbattle_single TRAINER_GAMER_RICH, Route8_Text_RichIntro, Route8_Text_RichDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_RichRematch
	msgbox Route8_Text_RichPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_RichRematch:: @ 81AA332
	trainerbattle_rematch TRAINER_GAMER_RICH, Route8_Text_RichRematchIntro, Route8_Text_RichDefeat
	msgbox Route8_Text_RichPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Eli:: @ 81AA349
	trainerbattle_double TRAINER_TWINS_ELI_ANNE, Route8_Text_EliIntro, Route8_Text_EliDefeat, Route8_Text_EliNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_EliRematch
	msgbox Route8_Text_EliPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_EliRematch:: @ 81AA374
	trainerbattle_rematch_double TRAINER_TWINS_ELI_ANNE, Route8_Text_EliRematchIntro, Route8_Text_EliDefeat, Route8_Text_EliNotEnoughMons
	msgbox Route8_Text_EliPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Anne:: @ 81AA38F
	trainerbattle_double TRAINER_TWINS_ELI_ANNE, Route8_Text_AnneIntro, Route8_Text_AnneDefeat, Route8_Text_AnneNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_AnneRematch
	msgbox Route8_Text_AnnePostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_AnneRematch:: @ 81AA3BA
	trainerbattle_rematch_double TRAINER_TWINS_ELI_ANNE, Route8_Text_AnneRematchIntro, Route8_Text_AnneDefeat, Route8_Text_AnneNotEnoughMons
	msgbox Route8_Text_AnnePostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Ricardo:: @ 81AA3D5
	trainerbattle_single TRAINER_BIKER_RICARDO, Route8_Text_RicardoIntro, Route8_Text_RicardoDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_RicardoRematch
	msgbox Route8_Text_RicardoPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_RicardoRematch:: @ 81AA3FC
	trainerbattle_rematch TRAINER_BIKER_RICARDO, Route8_Text_RicardoRematchIntro, Route8_Text_RicardoDefeat
	msgbox Route8_Text_RicardoPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_Jaren:: @ 81AA413
	trainerbattle_single TRAINER_BIKER_JAREN, Route8_Text_JarenIntro, Route8_Text_JarenDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route8_EventScript_JarenRematch
	msgbox Route8_Text_JarenPostBattle, MSGBOX_AUTOCLOSE
	end

Route8_EventScript_JarenRematch:: @ 81AA43A
	trainerbattle_rematch TRAINER_BIKER_JAREN, Route8_Text_JarenRematchIntro, Route8_Text_JarenDefeat
	msgbox Route8_Text_JarenPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Ned:: @ 81AA451
	trainerbattle_single TRAINER_FISHERMAN_NED, Route12_Text_NedIntro, Route12_Text_NedDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_NedRematch
	msgbox Route12_Text_NedPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_NedRematch:: @ 81AA478
	trainerbattle_rematch TRAINER_FISHERMAN_NED, Route12_Text_NedRematchIntro, Route12_Text_NedDefeat
	msgbox Route12_Text_NedPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Chip:: @ 81AA48F
	trainerbattle_single TRAINER_FISHERMAN_CHIP, Route12_Text_ChipIntro, Route12_Text_ChipDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_ChipRematch
	msgbox Route12_Text_ChipPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_ChipRematch:: @ 81AA4B6
	trainerbattle_rematch TRAINER_FISHERMAN_CHIP, Route12_Text_ChipRematchIntro, Route12_Text_ChipDefeat
	msgbox Route12_Text_ChipPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Hank:: @ 81AA4CD
	trainerbattle_single TRAINER_FISHERMAN_HANK, Route12_Text_HankIntro, Route12_Text_HankDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_HankRematch
	msgbox Route12_Text_HankPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_HankRematch:: @ 81AA4F4
	trainerbattle_rematch TRAINER_FISHERMAN_HANK, Route12_Text_HankRematchIntro, Route12_Text_HankDefeat
	msgbox Route12_Text_HankPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Elliot:: @ 81AA50B
	trainerbattle_single TRAINER_FISHERMAN_ELLIOT, Route12_Text_ElliotIntro, Route12_Text_ElliotDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_ElliotRematch
	msgbox Route12_Text_ElliotPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_ElliotRematch:: @ 81AA532
	trainerbattle_rematch TRAINER_FISHERMAN_ELLIOT, Route12_Text_ElliotRematchIntro, Route12_Text_ElliotDefeat
	msgbox Route12_Text_ElliotPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Andrew:: @ 81AA549
	trainerbattle_single TRAINER_FISHERMAN_ANDREW, Route12_Text_AndrewIntro, Route12_Text_AndrewDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_AndrewRematch
	msgbox Route12_Text_AndrewPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_AndrewRematch:: @ 81AA570
	trainerbattle_rematch TRAINER_FISHERMAN_ANDREW, Route12_Text_AndrewRematchIntro, Route12_Text_AndrewDefeat
	msgbox Route12_Text_AndrewPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Luca:: @ 81AA587
	trainerbattle_single TRAINER_ROCKER_LUCA, Route12_Text_LucaIntro, Route12_Text_LucaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_LucaRematch
	msgbox Route12_Text_LucaPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_LucaRematch:: @ 81AA5AE
	trainerbattle_rematch TRAINER_ROCKER_LUCA, Route12_Text_LucaRematchIntro, Route12_Text_LucaDefeat
	msgbox Route12_Text_LucaPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Justin:: @ 81AA5C5
	trainerbattle_single TRAINER_CAMPER_JUSTIN, Route12_Text_JustinIntro, Route12_Text_JustinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_JustinRematch
	msgbox Route12_Text_JustinPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_JustinRematch:: @ 81AA5EC
	trainerbattle_rematch TRAINER_CAMPER_JUSTIN, Route12_Text_JustinRematchIntro, Route12_Text_JustinDefeat
	msgbox Route12_Text_JustinPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Jes:: @ 81AA603
	trainerbattle_double TRAINER_YOUNG_COUPLE_GIA_JES, Route12_Text_JesIntro, Route12_Text_JesDefeat, Route12_Text_JesNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_JesRematch
	msgbox Route12_Text_JesPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_JesRematch:: @ 81AA62E
	trainerbattle_rematch_double TRAINER_YOUNG_COUPLE_GIA_JES, Route12_Text_JesRematchIntro, Route12_Text_JesDefeat, Route12_Text_JesNotEnoughMons
	msgbox Route12_Text_JesPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_Gia:: @ 81AA649
	trainerbattle_double TRAINER_YOUNG_COUPLE_GIA_JES, Route12_Text_GiaIntro, Route12_Text_GiaDefeat, Route12_Text_GiaNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route12_EventScript_GiaRematch
	msgbox Route12_Text_GiaPostBattle, MSGBOX_AUTOCLOSE
	end

Route12_EventScript_GiaRematch:: @ 81AA674
	trainerbattle_rematch_double TRAINER_YOUNG_COUPLE_GIA_JES, Route12_Text_GiaRematchIntro, Route12_Text_GiaDefeat, Route12_Text_GiaNotEnoughMons
	msgbox Route12_Text_GiaPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Jared:: @ 81AA68F
	trainerbattle_single TRAINER_BIKER_JARED, Route13_Text_JaredIntro, Route13_Text_JaredDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_JaredRematch
	msgbox Route13_Text_JaredPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_JaredRematch:: @ 81AA6B6
	trainerbattle_rematch TRAINER_BIKER_JARED, Route13_Text_JaredRematchIntro, Route13_Text_JaredDefeat
	msgbox Route13_Text_JaredPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Lola:: @ 81AA6CD
	trainerbattle_single TRAINER_BEAUTY_LOLA, Route13_Text_LolaIntro, Route13_Text_LolaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_LolaRematch
	msgbox Route13_Text_LolaPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_LolaRematch:: @ 81AA6F4
	trainerbattle_rematch TRAINER_BEAUTY_LOLA, Route13_Text_LolaRematchIntro, Route13_Text_LolaDefeat
	msgbox Route13_Text_LolaPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Sheila:: @ 81AA70B
	trainerbattle_single TRAINER_BEAUTY_SHEILA, Route13_Text_SheilaIntro, Route13_Text_SheilaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_SheilaRematch
	msgbox Route13_Text_SheilaPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_SheilaRematch:: @ 81AA732
	trainerbattle_rematch TRAINER_BEAUTY_SHEILA, Route13_Text_SheilaRematchIntro, Route13_Text_SheilaDefeat
	msgbox Route13_Text_SheilaPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Sebastian:: @ 81AA749
	trainerbattle_single TRAINER_BIRD_KEEPER_SEBASTIAN, Route13_Text_SebastianIntro, Route13_Text_SebastianDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_SebastianRematch
	msgbox Route13_Text_SebastianPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_SebastianRematch:: @ 81AA770
	trainerbattle_rematch TRAINER_BIRD_KEEPER_SEBASTIAN, Route13_Text_SebastianRematchIntro, Route13_Text_SebastianDefeat
	msgbox Route13_Text_SebastianPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Perry:: @ 81AA787
	trainerbattle_single TRAINER_BIRD_KEEPER_PERRY, Route13_Text_PerryIntro, Route13_Text_PerryDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_PerryRematch
	msgbox Route13_Text_PerryPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_PerryRematch:: @ 81AA7AE
	trainerbattle_rematch TRAINER_BIRD_KEEPER_PERRY, Route13_Text_PerryRematchIntro, Route13_Text_PerryDefeat
	msgbox Route13_Text_PerryPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Robert:: @ 81AA7C5
	trainerbattle_single TRAINER_BIRD_KEEPER_ROBERT, Route13_Text_RobertIntro, Route13_Text_RobertDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_RobertRematch
	msgbox Route13_Text_RobertPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_RobertRematch:: @ 81AA7EC
	trainerbattle_rematch TRAINER_BIRD_KEEPER_ROBERT, Route13_Text_RobertRematchIntro, Route13_Text_RobertDefeat
	msgbox Route13_Text_RobertPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Alma:: @ 81AA803
	trainerbattle_single TRAINER_PICNICKER_ALMA, Route13_Text_AlmaIntro, Route13_Text_AlmaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_AlmaRematch
	msgbox Route13_Text_AlmaPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_AlmaRematch:: @ 81AA82A
	trainerbattle_rematch TRAINER_PICNICKER_ALMA, Route13_Text_AlmaRematchIntro, Route13_Text_AlmaDefeat
	msgbox Route13_Text_AlmaPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Susie:: @ 81AA841
	trainerbattle_single TRAINER_PICNICKER_SUSIE, Route13_Text_SusieIntro, Route13_Text_SusieDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_SusieRematch
	msgbox Route13_Text_SusiePostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_SusieRematch:: @ 81AA868
	trainerbattle_rematch TRAINER_PICNICKER_SUSIE, Route13_Text_SusieRematchIntro, Route13_Text_SusieDefeat
	msgbox Route13_Text_SusiePostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Valerie:: @ 81AA87F
	trainerbattle_single TRAINER_PICNICKER_VALERIE, Route13_Text_ValerieIntro, Route13_Text_ValerieDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_ValerieRematch
	msgbox Route13_Text_ValeriePostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_ValerieRematch:: @ 81AA8A6
	trainerbattle_rematch TRAINER_PICNICKER_VALERIE, Route13_Text_ValerieRematchIntro, Route13_Text_ValerieDefeat
	msgbox Route13_Text_ValeriePostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_Gwen:: @ 81AA8BD
	trainerbattle_single TRAINER_PICNICKER_GWEN, Route13_Text_GwenIntro, Route13_Text_GwenDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route13_EventScript_GwenRematch
	msgbox Route13_Text_GwenPostBattle, MSGBOX_AUTOCLOSE
	end

Route13_EventScript_GwenRematch:: @ 81AA8E4
	trainerbattle_rematch TRAINER_PICNICKER_GWEN, Route13_Text_GwenRematchIntro, Route13_Text_GwenDefeat
	msgbox Route13_Text_GwenPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Malik:: @ 81AA8FB
	trainerbattle_single TRAINER_BIKER_MALIK, Route14_Text_MalikIntro, Route14_Text_MalikDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_MalikRematch
	msgbox Route14_Text_MalikPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_MalikRematch:: @ 81AA922
	trainerbattle_rematch TRAINER_BIKER_MALIK, Route14_Text_MalikRematchIntro, Route14_Text_MalikDefeat
	msgbox Route14_Text_MalikPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Lukas:: @ 81AA939
	trainerbattle_single TRAINER_BIKER_LUKAS, Route14_Text_LukasIntro, Route14_Text_LukasDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_LukasRematch
	msgbox Route14_Text_LukasPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_LukasRematch:: @ 81AA960
	trainerbattle_rematch TRAINER_BIKER_LUKAS, Route14_Text_LukasRematchIntro, Route14_Text_LukasDefeat
	msgbox Route14_Text_LukasPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Isaac:: @ 81AA977
	trainerbattle_single TRAINER_BIKER_ISAAC, Route14_Text_IsaacIntro, Route14_Text_IsaacDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_IsaacRematch
	msgbox Route14_Text_IsaacPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_IsaacRematch:: @ 81AA99E
	trainerbattle_rematch TRAINER_BIKER_ISAAC, Route14_Text_IsaacRematchIntro, Route14_Text_IsaacDefeat
	msgbox Route14_Text_IsaacPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Gerald:: @ 81AA9B5
	trainerbattle_single TRAINER_BIKER_GERALD, Route14_Text_GeraldIntro, Route14_Text_GeraldDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_GeraldRematch
	msgbox Route14_Text_GeraldPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_GeraldRematch:: @ 81AA9DC
	trainerbattle_rematch TRAINER_BIKER_GERALD, Route14_Text_GeraldRematchIntro, Route14_Text_GeraldDefeat
	msgbox Route14_Text_GeraldPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Donald:: @ 81AA9F3
	trainerbattle_single TRAINER_BIRD_KEEPER_DONALD, Route14_Text_DonaldIntro, Route14_Text_DonaldDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_DonaldRematch
	msgbox Route14_Text_DonaldPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_DonaldRematch:: @ 81AAA1A
	trainerbattle_rematch TRAINER_BIRD_KEEPER_DONALD, Route14_Text_DonaldRematchIntro, Route14_Text_DonaldDefeat
	msgbox Route14_Text_DonaldPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Benny:: @ 81AAA31
	trainerbattle_single TRAINER_BIRD_KEEPER_BENNY, Route14_Text_BennyIntro, Route14_Text_BennyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_BennyRematch
	msgbox Route14_Text_BennyPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_BennyRematch:: @ 81AAA58
	trainerbattle_rematch TRAINER_BIRD_KEEPER_BENNY, Route14_Text_BennyRematchIntro, Route14_Text_BennyDefeat
	msgbox Route14_Text_BennyPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Carter:: @ 81AAA6F
	trainerbattle_single TRAINER_BIRD_KEEPER_CARTER, Route14_Text_CarterIntro, Route14_Text_CarterDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_CarterRematch
	msgbox Route14_Text_CarterPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_CarterRematch:: @ 81AAA96
	trainerbattle_rematch TRAINER_BIRD_KEEPER_CARTER, Route14_Text_CarterRematchIntro, Route14_Text_CarterDefeat
	msgbox Route14_Text_CarterPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Mitch:: @ 81AAAAD
	trainerbattle_single TRAINER_BIRD_KEEPER_MITCH, Route14_Text_MitchIntro, Route14_Text_MitchDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_MitchRematch
	msgbox Route14_Text_MitchPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_MitchRematch:: @ 81AAAD4
	trainerbattle_rematch TRAINER_BIRD_KEEPER_MITCH, Route14_Text_MitchRematchIntro, Route14_Text_MitchDefeat
	msgbox Route14_Text_MitchPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Beck:: @ 81AAAEB
	trainerbattle_single TRAINER_BIRD_KEEPER_BECK, Route14_Text_BeckIntro, Route14_Text_BeckDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_BeckRematch
	msgbox Route14_Text_BeckPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_BeckRematch:: @ 81AAB12
	trainerbattle_rematch TRAINER_BIRD_KEEPER_BECK, Route14_Text_BeckRematchIntro, Route14_Text_BeckDefeat
	msgbox Route14_Text_BeckPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Marlon:: @ 81AAB29
	trainerbattle_single TRAINER_BIRD_KEEPER_MARLON, Route14_Text_MarlonIntro, Route14_Text_MarlonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_MarlonRematch
	msgbox Route14_Text_MarlonPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_MarlonRematch:: @ 81AAB50
	trainerbattle_rematch TRAINER_BIRD_KEEPER_MARLON, Route14_Text_MarlonRematchIntro, Route14_Text_MarlonDefeat
	msgbox Route14_Text_MarlonPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Kiri:: @ 81AAB67
	trainerbattle_double TRAINER_TWINS_KIRI_JAN, Route14_Text_KiriIntro, Route14_Text_KiriDefeat, Route14_Text_KiriNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_KiriRematch
	msgbox Route14_Text_KiriPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_KiriRematch:: @ 81AAB92
	trainerbattle_rematch_double TRAINER_TWINS_KIRI_JAN, Route14_Text_KiriRematchIntro, Route14_Text_KiriDefeat, Route14_Text_KiriNotEnoughMons
	msgbox Route14_Text_KiriPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_Jan:: @ 81AABAD
	trainerbattle_double TRAINER_TWINS_KIRI_JAN, Route14_Text_JanIntro, Route14_Text_JanDefeat, Route14_Text_JanNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route14_EventScript_JanRematch
	msgbox Route14_Text_JanPostBattle, MSGBOX_AUTOCLOSE
	end

Route14_EventScript_JanRematch:: @ 81AABD8
	trainerbattle_rematch_double TRAINER_TWINS_KIRI_JAN, Route14_Text_JanRematchIntro, Route14_Text_JanDefeat, Route14_Text_JanNotEnoughMons
	msgbox Route14_Text_JanPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Ernest:: @ 81AABF3
	trainerbattle_single TRAINER_BIKER_ERNEST, Route15_Text_ErnestIntro, Route15_Text_ErnestDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_ErnestRematch
	msgbox Route15_Text_ErnestPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_ErnestRematch:: @ 81AAC1A
	trainerbattle_rematch TRAINER_BIKER_ERNEST, Route15_Text_ErnestRematchIntro, Route15_Text_ErnestDefeat
	msgbox Route15_Text_ErnestPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Alex:: @ 81AAC31
	trainerbattle_single TRAINER_BIKER_ALEX, Route15_Text_AlexIntro, Route15_Text_AlexDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_AlexRematch
	msgbox Route15_Text_AlexPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_AlexRematch:: @ 81AAC58
	trainerbattle_rematch TRAINER_BIKER_ALEX, Route15_Text_AlexRematchIntro, Route15_Text_AlexDefeat
	msgbox Route15_Text_AlexPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Grace:: @ 81AAC6F
	trainerbattle_single TRAINER_BEAUTY_GRACE, Route15_Text_GraceIntro, Route15_Text_GraceDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_GraceRematch
	msgbox Route15_Text_GracePostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_GraceRematch:: @ 81AAC96
	trainerbattle_rematch TRAINER_BEAUTY_GRACE, Route15_Text_GraceRematchIntro, Route15_Text_GraceDefeat
	msgbox Route15_Text_GracePostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Olivia:: @ 81AACAD
	trainerbattle_single TRAINER_BEAUTY_OLIVIA, Route15_Text_OliviaIntro, Route15_Text_OliviaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_OliviaRematch
	msgbox Route15_Text_OliviaPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_OliviaRematch:: @ 81AACD4
	trainerbattle_rematch TRAINER_BEAUTY_OLIVIA, Route15_Text_OliviaRematchIntro, Route15_Text_OliviaDefeat
	msgbox Route15_Text_OliviaPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Edwin:: @ 81AACEB
	trainerbattle_single TRAINER_BIRD_KEEPER_EDWIN, Route15_Text_EdwinIntro, Route15_Text_EdwinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_EdwinRematch
	msgbox Route15_Text_EdwinPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_EdwinRematch:: @ 81AAD12
	trainerbattle_rematch TRAINER_BIRD_KEEPER_EDWIN, Route15_Text_EdwinRematchIntro, Route15_Text_EdwinDefeat
	msgbox Route15_Text_EdwinPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Chester:: @ 81AAD29
	trainerbattle_single TRAINER_BIRD_KEEPER_CHESTER, Route15_Text_ChesterIntro, Route15_Text_ChesterDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_ChesterRematch
	msgbox Route15_Text_ChesterPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_ChesterRematch:: @ 81AAD50
	trainerbattle_rematch TRAINER_BIRD_KEEPER_CHESTER, Route15_Text_ChesterRematchIntro, Route15_Text_ChesterDefeat
	msgbox Route15_Text_ChesterPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Yazmin:: @ 81AAD67
	trainerbattle_single TRAINER_PICNICKER_YAZMIN, Route15_Text_YazminIntro, Route15_Text_YazminDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_YazminRematch
	msgbox Route15_Text_YazminPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_YazminRematch:: @ 81AAD8E
	trainerbattle_rematch TRAINER_PICNICKER_YAZMIN, Route15_Text_YazminRematchIntro, Route15_Text_YazminDefeat
	msgbox Route15_Text_YazminPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Kindra:: @ 81AADA5
	trainerbattle_single TRAINER_PICNICKER_KINDRA, Route15_Text_KindraIntro, Route15_Text_KindraDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_KindraRematch
	msgbox Route15_Text_KindraPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_KindraRematch:: @ 81AADCC
	trainerbattle_rematch TRAINER_PICNICKER_KINDRA, Route15_Text_KindraRematchIntro, Route15_Text_KindraDefeat
	msgbox Route15_Text_KindraPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Becky:: @ 81AADE3
	trainerbattle_single TRAINER_PICNICKER_BECKY, Route15_Text_BeckyIntro, Route15_Text_BeckyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_BeckyRematch
	msgbox Route15_Text_BeckyPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_BeckyRematch:: @ 81AAE0A
	trainerbattle_rematch TRAINER_PICNICKER_BECKY, Route15_Text_BeckyRematchIntro, Route15_Text_BeckyDefeat
	msgbox Route15_Text_BeckyPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Celia:: @ 81AAE21
	trainerbattle_single TRAINER_PICNICKER_CELIA, Route15_Text_CeliaIntro, Route15_Text_CeliaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_CeliaRematch
	msgbox Route15_Text_CeliaPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_CeliaRematch:: @ 81AAE48
	trainerbattle_rematch TRAINER_PICNICKER_CELIA, Route15_Text_CeliaRematchIntro, Route15_Text_CeliaDefeat
	msgbox Route15_Text_CeliaPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Mya:: @ 81AAE5F
	trainerbattle_double TRAINER_CRUSH_KIN_RON_MYA, Route15_Text_MyaIntro, Route15_Text_MyaDefeat, Route15_Text_MyaNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_MyaRematch
	msgbox Route15_Text_MyaPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_MyaRematch:: @ 81AAE8A
	trainerbattle_rematch_double TRAINER_CRUSH_KIN_RON_MYA, Route15_Text_MyaRematchIntro, Route15_Text_MyaDefeat, Route15_Text_MyaNotEnoughMons
	msgbox Route15_Text_MyaPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_Ron:: @ 81AAEA5
	trainerbattle_double TRAINER_CRUSH_KIN_RON_MYA, Route15_Text_RonIntro, Route15_Text_RonDefeat, Route15_Text_RonNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route15_EventScript_RonRematch
	msgbox Route15_Text_RonPostBattle, MSGBOX_AUTOCLOSE
	end

Route15_EventScript_RonRematch:: @ 81AAED0
	trainerbattle_rematch_double TRAINER_CRUSH_KIN_RON_MYA, Route15_Text_RonRematchIntro, Route15_Text_RonDefeat, Route15_Text_RonNotEnoughMons
	msgbox Route15_Text_RonPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Lao:: @ 81AAEEB
	trainerbattle_single TRAINER_BIKER_LAO, Route16_Text_LaoIntro, Route16_Text_LaoDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_LaoRematch
	msgbox Route16_Text_LaoPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_LaoRematch:: @ 81AAF12
	trainerbattle_rematch TRAINER_BIKER_LAO, Route16_Text_LaoRematchIntro, Route16_Text_LaoDefeat
	msgbox Route16_Text_LaoPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Hideo:: @ 81AAF29
	trainerbattle_single TRAINER_BIKER_HIDEO, Route16_Text_HideoIntro, Route16_Text_HideoDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_HideoRematch
	msgbox Route16_Text_HideoPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_HideoRematch:: @ 81AAF50
	trainerbattle_rematch TRAINER_BIKER_HIDEO, Route16_Text_HideoRematchIntro, Route16_Text_HideoDefeat
	msgbox Route16_Text_HideoPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Ruben:: @ 81AAF67
	trainerbattle_single TRAINER_BIKER_RUBEN, Route16_Text_RubenIntro, Route16_Text_RubenDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_RubenRematch
	msgbox Route16_Text_RubenPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_RubenRematch:: @ 81AAF8E
	trainerbattle_rematch TRAINER_BIKER_RUBEN, Route16_Text_RubenRematchIntro, Route16_Text_RubenDefeat
	msgbox Route16_Text_RubenPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Koji:: @ 81AAFA5
	trainerbattle_single TRAINER_CUE_BALL_KOJI, Route16_Text_KojiIntro, Route16_Text_KojiDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_KojiRematch
	msgbox Route16_Text_KojiPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_KojiRematch:: @ 81AAFCC
	trainerbattle_rematch TRAINER_CUE_BALL_KOJI, Route16_Text_KojiRematchIntro, Route16_Text_KojiDefeat
	msgbox Route16_Text_KojiPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Luke:: @ 81AAFE3
	trainerbattle_single TRAINER_CUE_BALL_LUKE, Route16_Text_LukeIntro, Route16_Text_LukeDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_LukeRematch
	msgbox Route16_Text_LukePostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_LukeRematch:: @ 81AB00A
	trainerbattle_rematch TRAINER_CUE_BALL_LUKE, Route16_Text_LukeRematchIntro, Route16_Text_LukeDefeat
	msgbox Route16_Text_LukePostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Camron:: @ 81AB021
	trainerbattle_single TRAINER_CUE_BALL_CAMRON, Route16_Text_CamronIntro, Route16_Text_CamronDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_CamronRematch
	msgbox Route16_Text_CamronPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_CamronRematch:: @ 81AB048
	trainerbattle_rematch TRAINER_CUE_BALL_CAMRON, Route16_Text_CamronRematchIntro, Route16_Text_CamronDefeat
	msgbox Route16_Text_CamronPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Jed:: @ 81AB05F
	trainerbattle_double TRAINER_YOUNG_COUPLE_LEA_JED, Route16_Text_JedIntro, Route16_Text_JedDefeat, Route16_Text_JedNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_JedRematch
	msgbox Route16_Text_JedPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_JedRematch:: @ 81AB08A
	trainerbattle_rematch_double TRAINER_YOUNG_COUPLE_LEA_JED, Route16_Text_JedRematchIntro, Route16_Text_JedDefeat, Route16_Text_JedNotEnoughMons
	msgbox Route16_Text_JedPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_Lea:: @ 81AB0A5
	trainerbattle_double TRAINER_YOUNG_COUPLE_LEA_JED, Route16_Text_LeaIntro, Route16_Text_LeaDefeat, Route16_Text_LeaNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route16_EventScript_LeaRematch
	msgbox Route16_Text_LeaPostBattle, MSGBOX_AUTOCLOSE
	end

Route16_EventScript_LeaRematch:: @ 81AB0D0
	trainerbattle_rematch_double TRAINER_YOUNG_COUPLE_LEA_JED, Route16_Text_LeaRematchIntro, Route16_Text_LeaDefeat, Route16_Text_LeaNotEnoughMons
	msgbox Route16_Text_LeaPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Billy:: @ 81AB0EB
	trainerbattle_single TRAINER_BIKER_BILLY, Route17_Text_BillyIntro, Route17_Text_BillyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_BillyRematch
	msgbox Route17_Text_BillyPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_BillyRematch:: @ 81AB112
	trainerbattle_rematch TRAINER_BIKER_BILLY, Route17_Text_BillyRematchIntro, Route17_Text_BillyDefeat
	msgbox Route17_Text_BillyPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Nikolas:: @ 81AB129
	trainerbattle_single TRAINER_BIKER_NIKOLAS, Route17_Text_NikolasIntro, Route17_Text_NikolasDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_NikolasRematch
	msgbox Route17_Text_NikolasPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_NikolasRematch:: @ 81AB150
	trainerbattle_rematch TRAINER_BIKER_NIKOLAS, Route17_Text_NikolasRematchIntro, Route17_Text_NikolasDefeat
	msgbox Route17_Text_NikolasPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Jaxon:: @ 81AB167
	trainerbattle_single TRAINER_BIKER_JAXON, Route17_Text_JaxonIntro, Route17_Text_JaxonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_JaxonRematch
	msgbox Route17_Text_JaxonPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_JaxonRematch:: @ 81AB18E
	trainerbattle_rematch TRAINER_BIKER_JAXON, Route17_Text_JaxonRematchIntro, Route17_Text_JaxonDefeat
	msgbox Route17_Text_JaxonPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_William:: @ 81AB1A5
	trainerbattle_single TRAINER_BIKER_WILLIAM, Route17_Text_WilliamIntro, Route17_Text_WilliamDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_WilliamRematch
	msgbox Route17_Text_WilliamPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_WilliamRematch:: @ 81AB1CC
	trainerbattle_rematch TRAINER_BIKER_WILLIAM, Route17_Text_WilliamRematchIntro, Route17_Text_WilliamDefeat
	msgbox Route17_Text_WilliamPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Raul:: @ 81AB1E3
	trainerbattle_single TRAINER_CUE_BALL_RAUL, Route17_Text_RaulIntro, Route17_Text_RaulDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_RaulRematch
	msgbox Route17_Text_RaulPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_RaulRematch:: @ 81AB20A
	trainerbattle_rematch TRAINER_CUE_BALL_RAUL, Route17_Text_RaulRematchIntro, Route17_Text_RaulDefeat
	msgbox Route17_Text_RaulPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Isaiah:: @ 81AB221
	trainerbattle_single TRAINER_CUE_BALL_ISAIAH, Route17_Text_IsaiahIntro, Route17_Text_IsaiahDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_IsaiahRematch
	msgbox Route17_Text_IsaiahPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_IsaiahRematch:: @ 81AB248
	trainerbattle_rematch TRAINER_CUE_BALL_ISAIAH, Route17_Text_IsaiahRematchIntro, Route17_Text_IsaiahDefeat
	msgbox Route17_Text_IsaiahPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Zeek:: @ 81AB25F
	trainerbattle_single TRAINER_CUE_BALL_ZEEK, Route17_Text_ZeekIntro, Route17_Text_ZeekDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_ZeekRematch
	msgbox Route17_Text_ZeekPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_ZeekRematch:: @ 81AB286
	trainerbattle_rematch TRAINER_CUE_BALL_ZEEK, Route17_Text_ZeekRematchIntro, Route17_Text_ZeekDefeat
	msgbox Route17_Text_ZeekPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Jamal:: @ 81AB29D
	trainerbattle_single TRAINER_CUE_BALL_JAMAL, Route17_Text_JamalIntro, Route17_Text_JamalDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_JamalRematch
	msgbox Route17_Text_JamalPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_JamalRematch:: @ 81AB2C4
	trainerbattle_rematch TRAINER_CUE_BALL_JAMAL, Route17_Text_JamalRematchIntro, Route17_Text_JamalDefeat
	msgbox Route17_Text_JamalPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Corey:: @ 81AB2DB
	trainerbattle_single TRAINER_CUE_BALL_COREY, Route17_Text_CoreyIntro, Route17_Text_CoreyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_CoreyRematch
	msgbox Route17_Text_CoreyPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_CoreyRematch:: @ 81AB302
	trainerbattle_rematch TRAINER_CUE_BALL_COREY, Route17_Text_CoreyRematchIntro, Route17_Text_CoreyDefeat
	msgbox Route17_Text_CoreyPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_Virgil:: @ 81AB319
	trainerbattle_single TRAINER_BIKER_VIRGIL, Route17_Text_VirgilIntro, Route17_Text_VirgilDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route17_EventScript_VirgilRematch
	msgbox Route17_Text_VirgilPostBattle, MSGBOX_AUTOCLOSE
	end

Route17_EventScript_VirgilRematch:: @ 81AB340
	trainerbattle_rematch TRAINER_BIKER_VIRGIL, Route17_Text_VirgilRematchIntro, Route17_Text_VirgilDefeat
	msgbox Route17_Text_VirgilPostBattle, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_Wilton:: @ 81AB357
	trainerbattle_single TRAINER_BIRD_KEEPER_WILTON, Route18_Text_WiltonIntro, Route18_Text_WiltonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route18_EventScript_WiltonRematch
	msgbox Route18_Text_WiltonPostBattle, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_WiltonRematch:: @ 81AB37E
	trainerbattle_rematch TRAINER_BIRD_KEEPER_WILTON, Route18_Text_WiltonRematchIntro, Route18_Text_WiltonDefeat
	msgbox Route18_Text_WiltonPostBattle, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_Ramiro:: @ 81AB395
	trainerbattle_single TRAINER_BIRD_KEEPER_RAMIRO, Route18_Text_RamiroIntro, Route18_Text_RamiroDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route18_EventScript_RamiroRematch
	msgbox Route18_Text_RamiroPostBattle, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_RamiroRematch:: @ 81AB3BC
	trainerbattle_rematch TRAINER_BIRD_KEEPER_RAMIRO, Route18_Text_RamiroRematchIntro, Route18_Text_RamiroDefeat
	msgbox Route18_Text_RamiroPostBattle, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_Jacob:: @ 81AB3D3
	trainerbattle_single TRAINER_BIRD_KEEPER_JACOB, Route18_Text_JacobIntro, Route18_Text_JacobDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route18_EventScript_JacobRematch
	msgbox Route18_Text_JacobPostBattle, MSGBOX_AUTOCLOSE
	end

Route18_EventScript_JacobRematch:: @ 81AB3FA
	trainerbattle_rematch TRAINER_BIRD_KEEPER_JACOB, Route18_Text_JacobRematchIntro, Route18_Text_JacobDefeat
	msgbox Route18_Text_JacobPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Richard:: @ 81AB411
	trainerbattle_single TRAINER_SWIMMER_MALE_RICHARD, Route19_Text_RichardIntro, Route19_Text_RichardDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_RichardRematch
	msgbox Route19_Text_RichardPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_RichardRematch:: @ 81AB438
	trainerbattle_rematch TRAINER_SWIMMER_MALE_RICHARD, Route19_Text_RichardRematchIntro, Route19_Text_RichardDefeat
	msgbox Route19_Text_RichardPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Reece:: @ 81AB44F
	trainerbattle_single TRAINER_SWIMMER_MALE_REECE, Route19_Text_ReeceIntro, Route19_Text_ReeceDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_ReeceRematch
	msgbox Route19_Text_ReecePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_ReeceRematch:: @ 81AB476
	trainerbattle_rematch TRAINER_SWIMMER_MALE_REECE, Route19_Text_ReeceRematchIntro, Route19_Text_ReeceDefeat
	msgbox Route19_Text_ReecePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Matthew:: @ 81AB48D
	trainerbattle_single TRAINER_SWIMMER_MALE_MATTHEW, Route19_Text_MatthewIntro, Route19_Text_MatthewDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_MatthewRematch
	msgbox Route19_Text_MatthewPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_MatthewRematch:: @ 81AB4B4
	trainerbattle_rematch TRAINER_SWIMMER_MALE_MATTHEW, Route19_Text_MatthewRematchIntro, Route19_Text_MatthewDefeat
	msgbox Route19_Text_MatthewPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Douglas:: @ 81AB4CB
	trainerbattle_single TRAINER_SWIMMER_MALE_DOUGLAS, Route19_Text_DouglasIntro, Route19_Text_DouglasDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_DouglasRematch
	msgbox Route19_Text_DouglasPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_DouglasRematch:: @ 81AB4F2
	trainerbattle_rematch TRAINER_SWIMMER_MALE_DOUGLAS, Route19_Text_DouglasRematchIntro, Route19_Text_DouglasDefeat
	msgbox Route19_Text_DouglasPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_David:: @ 81AB509
	trainerbattle_single TRAINER_SWIMMER_MALE_DAVID, Route19_Text_DavidIntro, Route19_Text_DavidDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_DavidRematch
	msgbox Route19_Text_DavidPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_DavidRematch:: @ 81AB530
	trainerbattle_rematch TRAINER_SWIMMER_MALE_DAVID, Route19_Text_DavidRematchIntro, Route19_Text_DavidDefeat
	msgbox Route19_Text_DavidPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Tony:: @ 81AB547
	trainerbattle_single TRAINER_SWIMMER_MALE_TONY, Route19_Text_TonyIntro, Route19_Text_TonyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_TonyRematch
	msgbox Route19_Text_TonyPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_TonyRematch:: @ 81AB56E
	trainerbattle_rematch TRAINER_SWIMMER_MALE_TONY, Route19_Text_TonyRematchIntro, Route19_Text_TonyDefeat
	msgbox Route19_Text_TonyPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Axle:: @ 81AB585
	trainerbattle_single TRAINER_SWIMMER_MALE_AXLE, Route19_Text_AxleIntro, Route19_Text_AxleDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_AxleRematch
	msgbox Route19_Text_AxlePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_AxleRematch:: @ 81AB5AC
	trainerbattle_rematch TRAINER_SWIMMER_MALE_AXLE, Route19_Text_AxleRematchIntro, Route19_Text_AxleDefeat
	msgbox Route19_Text_AxlePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Anya:: @ 81AB5C3
	trainerbattle_single TRAINER_SWIMMER_FEMALE_ANYA, Route19_Text_AnyaIntro, Route19_Text_AnyaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_AnyaRematch
	msgbox Route19_Text_AnyaPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_AnyaRematch:: @ 81AB5EA
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_ANYA, Route19_Text_AnyaRematchIntro, Route19_Text_AnyaDefeat
	msgbox Route19_Text_AnyaPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Alice:: @ 81AB601
	trainerbattle_single TRAINER_SWIMMER_FEMALE_ALICE, Route19_Text_AliceIntro, Route19_Text_AliceDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_AliceRematch
	msgbox Route19_Text_AlicePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_AliceRematch:: @ 81AB628
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_ALICE, Route19_Text_AliceRematchIntro, Route19_Text_AliceDefeat
	msgbox Route19_Text_AlicePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Connie:: @ 81AB63F
	trainerbattle_single TRAINER_SWIMMER_FEMALE_CONNIE, Route19_Text_ConnieIntro, Route19_Text_ConnieDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_ConnieRematch
	msgbox Route19_Text_ConniePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_ConnieRematch:: @ 81AB666
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_CONNIE, Route19_Text_ConnieRematchIntro, Route19_Text_ConnieDefeat
	msgbox Route19_Text_ConniePostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Lia:: @ 81AB67D
	trainerbattle_double TRAINER_SIS_AND_BRO_LIA_LUC, Route19_Text_LiaIntro, Route19_Text_LiaDefeat, Route19_Text_LiaNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_LiaRematch
	msgbox Route19_Text_LiaPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_LiaRematch:: @ 81AB6A8
	trainerbattle_rematch_double TRAINER_SIS_AND_BRO_LIA_LUC, Route19_Text_LiaRematchIntro, Route19_Text_LiaDefeat, Route19_Text_LiaNotEnoughMons
	msgbox Route19_Text_LiaPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_Luc:: @ 81AB6C3
	trainerbattle_double TRAINER_SIS_AND_BRO_LIA_LUC, Route19_Text_LucIntro, Route19_Text_LucDefeat, Route19_Text_LucNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route19_EventScript_LucRematch
	msgbox Route19_Text_LucPostBattle, MSGBOX_AUTOCLOSE
	end

Route19_EventScript_LucRematch:: @ 81AB6EE
	trainerbattle_rematch_double TRAINER_SIS_AND_BRO_LIA_LUC, Route19_Text_LucRematchIntro, Route19_Text_LucDefeat, Route19_Text_LucNotEnoughMons
	msgbox Route19_Text_LucPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Barry:: @ 81AB709
	trainerbattle_single TRAINER_SWIMMER_MALE_BARRY, Route20_Text_BarryIntro, Route20_Text_BarryDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_BarryRematch
	msgbox Route20_Text_BarryPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_BarryRematch:: @ 81AB730
	trainerbattle_rematch TRAINER_SWIMMER_MALE_BARRY, Route20_Text_BarryRematchIntro, Route20_Text_BarryDefeat
	msgbox Route20_Text_BarryPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Dean:: @ 81AB747
	trainerbattle_single TRAINER_SWIMMER_MALE_DEAN, Route20_Text_DeanIntro, Route20_Text_DeanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_DeanRematch
	msgbox Route20_Text_DeanPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_DeanRematch:: @ 81AB76E
	trainerbattle_rematch TRAINER_SWIMMER_MALE_DEAN, Route20_Text_DeanRematchIntro, Route20_Text_DeanDefeat
	msgbox Route20_Text_DeanPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Darrin:: @ 81AB785
	trainerbattle_single TRAINER_SWIMMER_MALE_DARRIN, Route20_Text_DarrinIntro, Route20_Text_DarrinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_DarrinRematch
	msgbox Route20_Text_DarrinPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_DarrinRematch:: @ 81AB7AC
	trainerbattle_rematch TRAINER_SWIMMER_MALE_DARRIN, Route20_Text_DarrinRematchIntro, Route20_Text_DarrinDefeat
	msgbox Route20_Text_DarrinPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Tiffany:: @ 81AB7C3
	trainerbattle_single TRAINER_SWIMMER_FEMALE_TIFFANY, Route20_Text_TiffanyIntro, Route20_Text_TiffanyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_TiffanyRematch
	msgbox Route20_Text_TiffanyPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_TiffanyRematch:: @ 81AB7EA
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_TIFFANY, Route20_Text_TiffanyRematchIntro, Route20_Text_TiffanyDefeat
	msgbox Route20_Text_TiffanyPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Nora:: @ 81AB801
	trainerbattle_single TRAINER_SWIMMER_FEMALE_NORA, Route20_Text_NoraIntro, Route20_Text_NoraDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_NoraRematch
	msgbox Route20_Text_NoraPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_NoraRematch:: @ 81AB828
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_NORA, Route20_Text_NoraRematchIntro, Route20_Text_NoraDefeat
	msgbox Route20_Text_NoraPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Melissa:: @ 81AB83F
	trainerbattle_single TRAINER_SWIMMER_FEMALE_MELISSA, Route20_Text_MelissaIntro, Route20_Text_MelissaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_MelissaRematch
	msgbox Route20_Text_MelissaPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_MelissaRematch:: @ 81AB866
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_MELISSA, Route20_Text_MelissaRematchIntro, Route20_Text_MelissaDefeat
	msgbox Route20_Text_MelissaPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Shirley:: @ 81AB87D
	trainerbattle_single TRAINER_SWIMMER_FEMALE_SHIRLEY, Route20_Text_ShirleyIntro, Route20_Text_ShirleyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_ShirleyRematch
	msgbox Route20_Text_ShirleyPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_ShirleyRematch:: @ 81AB8A4
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_SHIRLEY, Route20_Text_ShirleyRematchIntro, Route20_Text_ShirleyDefeat
	msgbox Route20_Text_ShirleyPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Roger:: @ 81AB8BB
	trainerbattle_single TRAINER_BIRD_KEEPER_ROGER, Route20_Text_RogerIntro, Route20_Text_RogerDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_RogerRematch
	msgbox Route20_Text_RogerPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_RogerRematch:: @ 81AB8E2
	trainerbattle_rematch TRAINER_BIRD_KEEPER_ROGER, Route20_Text_RogerRematchIntro, Route20_Text_RogerDefeat
	msgbox Route20_Text_RogerPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Missy:: @ 81AB8F9
	trainerbattle_single TRAINER_PICNICKER_MISSY, Route20_Text_MissyIntro, Route20_Text_MissyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_MissyRematch
	msgbox Route20_Text_MissyPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_MissyRematch:: @ 81AB920
	trainerbattle_rematch TRAINER_PICNICKER_MISSY, Route20_Text_MissyRematchIntro, Route20_Text_MissyDefeat
	msgbox Route20_Text_MissyPostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_Irene:: @ 81AB937
	trainerbattle_single TRAINER_PICNICKER_IRENE, Route20_Text_IreneIntro, Route20_Text_IreneDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route20_EventScript_IreneRematch
	msgbox Route20_Text_IrenePostBattle, MSGBOX_AUTOCLOSE
	end

Route20_EventScript_IreneRematch:: @ 81AB95E
	trainerbattle_rematch TRAINER_PICNICKER_IRENE, Route20_Text_IreneRematchIntro, Route20_Text_IreneDefeat
	msgbox Route20_Text_IrenePostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_Ronald:: @ 81AB975
	trainerbattle_single TRAINER_FISHERMAN_RONALD, Route21_North_Text_RonaldIntro, Route21_North_Text_RonaldDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_North_EventScript_RonaldRematch
	msgbox Route21_North_Text_RonaldPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_RonaldRematch:: @ 81AB99C
	trainerbattle_rematch TRAINER_FISHERMAN_RONALD, Route21_North_Text_RonaldRematchIntro, Route21_North_Text_RonaldDefeat
	msgbox Route21_North_Text_RonaldPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_Claude:: @ 81AB9B3
	trainerbattle_single TRAINER_FISHERMAN_CLAUDE, Route21_South_Text_ClaudeIntro, Route21_South_Text_ClaudeDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_South_EventScript_ClaudeRematch
	msgbox Route21_South_Text_ClaudePostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_ClaudeRematch:: @ 81AB9DA
	trainerbattle_rematch TRAINER_FISHERMAN_CLAUDE, Route21_South_Text_ClaudeRematchIntro, Route21_South_Text_ClaudeDefeat
	msgbox Route21_South_Text_ClaudePostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_Wade:: @ 81AB9F1
	trainerbattle_single TRAINER_FISHERMAN_WADE, Route21_North_Text_WadeIntro, Route21_North_Text_WadeDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_North_EventScript_WadeRematch
	msgbox Route21_North_Text_WadePostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_WadeRematch:: @ 81ABA18
	trainerbattle_rematch TRAINER_FISHERMAN_WADE, Route21_North_Text_WadeRematchIntro, Route21_North_Text_WadeDefeat
	msgbox Route21_North_Text_WadePostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_Nolan:: @ 81ABA2F
	trainerbattle_single TRAINER_FISHERMAN_NOLAN, Route21_South_Text_NolanIntro, Route21_South_Text_NolanDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_South_EventScript_NolanRematch
	msgbox Route21_South_Text_NolanPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_NolanRematch:: @ 81ABA56
	trainerbattle_rematch TRAINER_FISHERMAN_NOLAN, Route21_South_Text_NolanRematchIntro, Route21_South_Text_NolanDefeat
	msgbox Route21_South_Text_NolanPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_Spencer:: @ 81ABA6D
	trainerbattle_single TRAINER_SWIMMER_MALE_SPENCER, Route21_North_Text_SpencerIntro, Route21_North_Text_SpencerDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_North_EventScript_SpencerRematch
	msgbox Route21_North_Text_SpencerPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_SpencerRematch:: @ 81ABA94
	trainerbattle_rematch TRAINER_SWIMMER_MALE_SPENCER, Route21_North_Text_SpencerRematchIntro, Route21_North_Text_SpencerDefeat
	msgbox Route21_North_Text_SpencerPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_Jack:: @ 81ABAAB
	trainerbattle_single TRAINER_SWIMMER_MALE_JACK, Route21_South_Text_JackIntro, Route21_South_Text_JackDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_South_EventScript_JackRematch
	msgbox Route21_South_Text_JackPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_JackRematch:: @ 81ABAD2
	trainerbattle_rematch TRAINER_SWIMMER_MALE_JACK, Route21_South_Text_JackRematchIntro, Route21_South_Text_JackDefeat
	msgbox Route21_South_Text_JackPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_Jerome:: @ 81ABAE9
	trainerbattle_single TRAINER_SWIMMER_MALE_JEROME, Route21_South_Text_JeromeIntro, Route21_South_Text_JeromeDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_South_EventScript_JeromeRematch
	msgbox Route21_South_Text_JeromePostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_JeromeRematch:: @ 81ABB10
	trainerbattle_rematch TRAINER_SWIMMER_MALE_JEROME, Route21_South_Text_JeromeRematchIntro, Route21_South_Text_JeromeDefeat
	msgbox Route21_South_Text_JeromePostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_Roland:: @ 81ABB27
	trainerbattle_single TRAINER_SWIMMER_MALE_ROLAND, Route21_South_Text_RolandIntro, Route21_South_Text_RolandDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_South_EventScript_RolandRematch
	msgbox Route21_South_Text_RolandPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_South_EventScript_RolandRematch:: @ 81ABB4E
	trainerbattle_rematch TRAINER_SWIMMER_MALE_ROLAND, Route21_South_Text_RolandRematchIntro, Route21_South_Text_RolandDefeat
	msgbox Route21_South_Text_RolandPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_Lil:: @ 81ABB65
	trainerbattle_double TRAINER_SIS_AND_BRO_LIL_IAN, Route21_North_Text_LilIntro, Route21_North_Text_LilDefeat, Route21_North_Text_LilNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_North_EventScript_LilRematch
	msgbox Route21_North_Text_LilPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_LilRematch:: @ 81ABB90
	trainerbattle_rematch_double TRAINER_SIS_AND_BRO_LIL_IAN, Route21_North_Text_LilRematchIntro, Route21_North_Text_LilDefeat, Route21_North_Text_LilNotEnoughMons
	msgbox Route21_North_Text_LilPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_Ian:: @ 81ABBAB
	trainerbattle_double TRAINER_SIS_AND_BRO_LIL_IAN, Route21_North_Text_IanIntro, Route21_North_Text_IanDefeat, Route21_North_Text_IanNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq Route21_North_EventScript_IanRematch
	msgbox Route21_North_Text_IanPostBattle, MSGBOX_AUTOCLOSE
	end

Route21_North_EventScript_IanRematch:: @ 81ABBD6
	trainerbattle_rematch_double TRAINER_SIS_AND_BRO_LIL_IAN, Route21_North_Text_IanRematchIntro, Route21_North_Text_IanDefeat, Route21_North_Text_IanNotEnoughMons
	msgbox Route21_North_Text_IanPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Maria:: @ 81ABBF1
	trainerbattle_single TRAINER_SWIMMER_FEMALE_MARIA, OneIsland_KindleRoad_Text_MariaIntro, OneIsland_KindleRoad_Text_MariaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_MariaRematch
	msgbox OneIsland_KindleRoad_Text_MariaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_MariaRematch:: @ 81ABC18
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_MARIA, OneIsland_KindleRoad_Text_MariaRematchIntro, OneIsland_KindleRoad_Text_MariaDefeat
	msgbox OneIsland_KindleRoad_Text_MariaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Abigail:: @ 81ABC2F
	trainerbattle_single TRAINER_SWIMMER_FEMALE_ABIGAIL, OneIsland_KindleRoad_Text_AbigailIntro, OneIsland_KindleRoad_Text_AbigailDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_AbigailRematch
	msgbox OneIsland_KindleRoad_Text_AbigailPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_AbigailRematch:: @ 81ABC56
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_ABIGAIL, OneIsland_KindleRoad_Text_AbigailRematchIntro, OneIsland_KindleRoad_Text_AbigailDefeat
	msgbox OneIsland_KindleRoad_Text_AbigailPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Finn:: @ 81ABC6D
	trainerbattle_single TRAINER_SWIMMER_MALE_FINN, OneIsland_KindleRoad_Text_FinnIntro, OneIsland_KindleRoad_Text_FinnDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_FinnRematch
	msgbox OneIsland_KindleRoad_Text_FinnPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_FinnRematch:: @ 81ABC94
	trainerbattle_rematch TRAINER_SWIMMER_MALE_FINN, OneIsland_KindleRoad_Text_FinnRematchIntro, OneIsland_KindleRoad_Text_FinnDefeat
	msgbox OneIsland_KindleRoad_Text_FinnPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Garrett:: @ 81ABCAB
	trainerbattle_single TRAINER_SWIMMER_MALE_GARRETT, OneIsland_KindleRoad_Text_GarrettIntro, OneIsland_KindleRoad_Text_GarrettDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_GarrettRematch
	msgbox OneIsland_KindleRoad_Text_GarrettPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_GarrettRematch:: @ 81ABCD2
	trainerbattle_rematch TRAINER_SWIMMER_MALE_GARRETT, OneIsland_KindleRoad_Text_GarrettRematchIntro, OneIsland_KindleRoad_Text_GarrettDefeat
	msgbox OneIsland_KindleRoad_Text_GarrettPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Tommy:: @ 81ABCE9
	trainerbattle_single TRAINER_FISHERMAN_TOMMY, OneIsland_KindleRoad_Text_TommyIntro, OneIsland_KindleRoad_Text_TommyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_TommyRematch
	msgbox OneIsland_KindleRoad_Text_TommyPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_TommyRematch:: @ 81ABD10
	trainerbattle_rematch TRAINER_FISHERMAN_TOMMY, OneIsland_KindleRoad_Text_TommyRematchIntro, OneIsland_KindleRoad_Text_TommyDefeat
	msgbox OneIsland_KindleRoad_Text_TommyPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Sharon:: @ 81ABD27
	trainerbattle_single TRAINER_CRUSH_GIRL_SHARON, OneIsland_KindleRoad_Text_SharonIntro, OneIsland_KindleRoad_Text_SharonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_SharonRematch
	msgbox OneIsland_KindleRoad_Text_SharonPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_SharonRematch:: @ 81ABD4E
	trainerbattle_rematch TRAINER_CRUSH_GIRL_SHARON, OneIsland_KindleRoad_Text_SharonRematchIntro, OneIsland_KindleRoad_Text_SharonDefeat
	msgbox OneIsland_KindleRoad_Text_SharonPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Tanya:: @ 81ABD65
	trainerbattle_single TRAINER_CRUSH_GIRL_TANYA, OneIsland_KindleRoad_Text_TanyaIntro, OneIsland_KindleRoad_Text_TanyaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_TanyaRematch
	msgbox OneIsland_KindleRoad_Text_TanyaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_TanyaRematch:: @ 81ABD8C
	trainerbattle_rematch TRAINER_CRUSH_GIRL_TANYA, OneIsland_KindleRoad_Text_TanyaRematchIntro, OneIsland_KindleRoad_Text_TanyaDefeat
	msgbox OneIsland_KindleRoad_Text_TanyaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Shea:: @ 81ABDA3
	trainerbattle_single TRAINER_BLACK_BELT_SHEA, OneIsland_KindleRoad_Text_SheaIntro, OneIsland_KindleRoad_Text_SheaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_SheaRematch
	msgbox OneIsland_KindleRoad_Text_SheaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_SheaRematch:: @ 81ABDCA
	trainerbattle_rematch TRAINER_BLACK_BELT_SHEA, OneIsland_KindleRoad_Text_SheaRematchIntro, OneIsland_KindleRoad_Text_SheaDefeat
	msgbox OneIsland_KindleRoad_Text_SheaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Hugh:: @ 81ABDE1
	trainerbattle_single TRAINER_BLACK_BELT_HUGH, OneIsland_KindleRoad_Text_HughIntro, OneIsland_KindleRoad_Text_HughDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_HughRematch
	msgbox OneIsland_KindleRoad_Text_HughPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_HughRematch:: @ 81ABE08
	trainerbattle_rematch TRAINER_BLACK_BELT_HUGH, OneIsland_KindleRoad_Text_HughRematchIntro, OneIsland_KindleRoad_Text_HughDefeat
	msgbox OneIsland_KindleRoad_Text_HughPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Bryce:: @ 81ABE1F
	trainerbattle_single TRAINER_CAMPER_BRYCE, OneIsland_KindleRoad_Text_BryceIntro, OneIsland_KindleRoad_Text_BryceDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_BryceRematch
	msgbox OneIsland_KindleRoad_Text_BrycePostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_BryceRematch:: @ 81ABE46
	trainerbattle_rematch TRAINER_CAMPER_BRYCE, OneIsland_KindleRoad_Text_BryceRematchIntro, OneIsland_KindleRoad_Text_BryceDefeat
	msgbox OneIsland_KindleRoad_Text_BrycePostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Claire:: @ 81ABE5D
	trainerbattle_single TRAINER_PICNICKER_CLAIRE, OneIsland_KindleRoad_Text_ClaireIntro, OneIsland_KindleRoad_Text_ClaireDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_ClaireRematch
	msgbox OneIsland_KindleRoad_Text_ClairePostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_ClaireRematch:: @ 81ABE84
	trainerbattle_rematch TRAINER_PICNICKER_CLAIRE, OneIsland_KindleRoad_Text_ClaireRematchIntro, OneIsland_KindleRoad_Text_ClaireDefeat
	msgbox OneIsland_KindleRoad_Text_ClairePostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Kia:: @ 81ABE9B
	trainerbattle_double TRAINER_CRUSH_KIN_MIK_KIA, OneIsland_KindleRoad_Text_KiaIntro, OneIsland_KindleRoad_Text_KiaDefeat, OneIsland_KindleRoad_Text_KiaNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_KiaRematch
	msgbox OneIsland_KindleRoad_Text_KiaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_KiaRematch:: @ 81ABEC6
	trainerbattle_rematch_double TRAINER_CRUSH_KIN_MIK_KIA, OneIsland_KindleRoad_Text_KiaRematchIntro, OneIsland_KindleRoad_Text_KiaDefeat, OneIsland_KindleRoad_Text_KiaNotEnoughMons
	msgbox OneIsland_KindleRoad_Text_KiaPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_Mik:: @ 81ABEE1
	trainerbattle_double TRAINER_CRUSH_KIN_MIK_KIA, OneIsland_KindleRoad_Text_MikIntro, OneIsland_KindleRoad_Text_MikDefeat, OneIsland_KindleRoad_Text_MikNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_KindleRoad_EventScript_MikRematch
	msgbox OneIsland_KindleRoad_Text_MikPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_KindleRoad_EventScript_MikRematch:: @ 81ABF0C
	trainerbattle_rematch_double TRAINER_CRUSH_KIN_MIK_KIA, OneIsland_KindleRoad_Text_MikRematchIntro, OneIsland_KindleRoad_Text_MikDefeat, OneIsland_KindleRoad_Text_MikNotEnoughMons
	msgbox OneIsland_KindleRoad_Text_MikPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_TreasureBeach_EventScript_Amara:: @ 81ABF27
	trainerbattle_single TRAINER_SWIMMER_FEMALE_AMARA, OneIsland_TreasureBeach_Text_AmaraIntro, OneIsland_TreasureBeach_Text_AmaraDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq OneIsland_TreasureBeach_EventScript_AmaraRematch
	msgbox OneIsland_TreasureBeach_Text_AmaraPostBattle, MSGBOX_AUTOCLOSE
	end

OneIsland_TreasureBeach_EventScript_AmaraRematch:: @ 81ABF4E
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_AMARA, OneIsland_TreasureBeach_Text_AmaraRematchIntro, OneIsland_TreasureBeach_Text_AmaraDefeat
	msgbox OneIsland_TreasureBeach_Text_AmaraPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_Nikki:: @ 81ABF65
	trainerbattle_single TRAINER_AROMA_LADY_NIKKI, ThreeIsland_BondBridge_Text_NikkiIntro, ThreeIsland_BondBridge_Text_NikkiDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq ThreeIsland_BondBridge_EventScript_NikkiRematch
	msgbox ThreeIsland_BondBridge_Text_NikkiPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_NikkiRematch:: @ 81ABF8C
	trainerbattle_rematch TRAINER_AROMA_LADY_NIKKI, ThreeIsland_BondBridge_Text_NikkiRematchIntro, ThreeIsland_BondBridge_Text_NikkiDefeat
	msgbox ThreeIsland_BondBridge_Text_NikkiPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_Violet:: @ 81ABFA3
	trainerbattle_single TRAINER_AROMA_LADY_VIOLET, ThreeIsland_BondBridge_Text_VioletIntro, ThreeIsland_BondBridge_Text_VioletDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq ThreeIsland_BondBridge_EventScript_VioletRematch
	msgbox ThreeIsland_BondBridge_Text_VioletPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_VioletRematch:: @ 81ABFCA
	trainerbattle_rematch TRAINER_AROMA_LADY_VIOLET, ThreeIsland_BondBridge_Text_VioletRematchIntro, ThreeIsland_BondBridge_Text_VioletDefeat
	msgbox ThreeIsland_BondBridge_Text_VioletPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_Amira:: @ 81ABFE1
	trainerbattle_single TRAINER_TUBER_AMIRA, ThreeIsland_BondBridge_Text_AmiraIntro, ThreeIsland_BondBridge_Text_AmiraDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq ThreeIsland_BondBridge_EventScript_AmiraRematch
	msgbox ThreeIsland_BondBridge_Text_AmiraPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_AmiraRematch:: @ 81AC008
	trainerbattle_rematch TRAINER_TUBER_AMIRA, ThreeIsland_BondBridge_Text_AmiraRematchIntro, ThreeIsland_BondBridge_Text_AmiraDefeat
	msgbox ThreeIsland_BondBridge_Text_AmiraPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_Alexis:: @ 81AC01F
	trainerbattle_single TRAINER_TUBER_ALEXIS, ThreeIsland_BondBridge_Text_AlexisIntro, ThreeIsland_BondBridge_Text_AlexisDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq ThreeIsland_BondBridge_EventScript_AlexisRematch
	msgbox ThreeIsland_BondBridge_Text_AlexisPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_AlexisRematch:: @ 81AC046
	trainerbattle_rematch TRAINER_TUBER_ALEXIS, ThreeIsland_BondBridge_Text_AlexisRematchIntro, ThreeIsland_BondBridge_Text_AlexisDefeat
	msgbox ThreeIsland_BondBridge_Text_AlexisPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_Tisha:: @ 81AC05D
	trainerbattle_single TRAINER_SWIMMER_FEMALE_TISHA, ThreeIsland_BondBridge_Text_TishaIntro, ThreeIsland_BondBridge_Text_TishaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq ThreeIsland_BondBridge_EventScript_TishaRematch
	msgbox ThreeIsland_BondBridge_Text_TishaPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_TishaRematch:: @ 81AC084
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_TISHA, ThreeIsland_BondBridge_Text_TishaRematchIntro, ThreeIsland_BondBridge_Text_TishaDefeat
	msgbox ThreeIsland_BondBridge_Text_TishaPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_Joy:: @ 81AC09B
	trainerbattle_double TRAINER_TWINS_JOY_MEG, ThreeIsland_BondBridge_Text_JoyIntro, ThreeIsland_BondBridge_Text_JoyDefeat, ThreeIsland_BondBridge_Text_JoyNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq ThreeIsland_BondBridge_EventScript_JoyRematch
	msgbox ThreeIsland_BondBridge_Text_JoyPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_JoyRematch:: @ 81AC0C6
	trainerbattle_rematch_double TRAINER_TWINS_JOY_MEG, ThreeIsland_BondBridge_Text_JoyRematchIntro, ThreeIsland_BondBridge_Text_JoyDefeat, ThreeIsland_BondBridge_Text_JoyNotEnoughMons
	msgbox ThreeIsland_BondBridge_Text_JoyPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_Meg:: @ 81AC0E1
	trainerbattle_double TRAINER_TWINS_JOY_MEG, ThreeIsland_BondBridge_Text_MegIntro, ThreeIsland_BondBridge_Text_MegDefeat, ThreeIsland_BondBridge_Text_MegNotEnoughMons
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq ThreeIsland_BondBridge_EventScript_MegRematch
	msgbox ThreeIsland_BondBridge_Text_MegPostBattle, MSGBOX_AUTOCLOSE
	end

ThreeIsland_BondBridge_EventScript_MegRematch:: @ 81AC10C
	trainerbattle_rematch_double TRAINER_TWINS_JOY_MEG, ThreeIsland_BondBridge_Text_MegRematchIntro, ThreeIsland_BondBridge_Text_MegDefeat, ThreeIsland_BondBridge_Text_MegNotEnoughMons
	msgbox ThreeIsland_BondBridge_Text_MegPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_Daisy:: @ 81AC127
	trainerbattle_single TRAINER_PAINTER_DAISY, FiveIsland_ResortGorgeous_Text_DaisyIntro, FiveIsland_ResortGorgeous_Text_DaisyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_ResortGorgeous_EventScript_DaisyRematch
	msgbox FiveIsland_ResortGorgeous_Text_DaisyPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_DaisyRematch:: @ 81AC14E
	trainerbattle_rematch TRAINER_PAINTER_DAISY, FiveIsland_ResortGorgeous_Text_DaisyRematchIntro, FiveIsland_ResortGorgeous_Text_DaisyDefeat
	msgbox FiveIsland_ResortGorgeous_Text_DaisyPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_Celina:: @ 81AC165
	trainerbattle_single TRAINER_PAINTER_CELINA, FiveIsland_ResortGorgeous_Text_CelinaIntro, FiveIsland_ResortGorgeous_Text_CelinaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_ResortGorgeous_EventScript_CelinaRematch
	msgbox FiveIsland_ResortGorgeous_Text_CelinaPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_CelinaRematch:: @ 81AC18C
	trainerbattle_rematch TRAINER_PAINTER_CELINA, FiveIsland_ResortGorgeous_Text_CelinaRematchIntro, FiveIsland_ResortGorgeous_Text_CelinaDefeat
	msgbox FiveIsland_ResortGorgeous_Text_CelinaPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_Rayna:: @ 81AC1A3
	trainerbattle_single TRAINER_PAINTER_RAYNA, FiveIsland_ResortGorgeous_Text_RaynaIntro, FiveIsland_ResortGorgeous_Text_RaynaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_ResortGorgeous_EventScript_RaynaRematch
	msgbox FiveIsland_ResortGorgeous_Text_RaynaPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_RaynaRematch:: @ 81AC1CA
	trainerbattle_rematch TRAINER_PAINTER_RAYNA, FiveIsland_ResortGorgeous_Text_RaynaRematchIntro, FiveIsland_ResortGorgeous_Text_RaynaDefeat
	msgbox FiveIsland_ResortGorgeous_Text_RaynaPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_Jacki:: @ 81AC1E1
	trainerbattle_single TRAINER_LADY_JACKI, FiveIsland_ResortGorgeous_Text_JackiIntro, FiveIsland_ResortGorgeous_Text_JackiDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_ResortGorgeous_EventScript_JackiRematch
	msgbox FiveIsland_ResortGorgeous_Text_JackiPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_JackiRematch:: @ 81AC208
	trainerbattle_rematch TRAINER_LADY_JACKI, FiveIsland_ResortGorgeous_Text_JackiRematchIntro, FiveIsland_ResortGorgeous_Text_JackiDefeat
	msgbox FiveIsland_ResortGorgeous_Text_JackiPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_Gillian:: @ 81AC21F
	trainerbattle_single TRAINER_LADY_GILLIAN, FiveIsland_ResortGorgeous_Text_GillianIntro, FiveIsland_ResortGorgeous_Text_GillianDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_ResortGorgeous_EventScript_GillianRematch
	msgbox FiveIsland_ResortGorgeous_Text_GillianPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_GillianRematch:: @ 81AC246
	trainerbattle_rematch TRAINER_LADY_GILLIAN, FiveIsland_ResortGorgeous_Text_GillianRematchIntro, FiveIsland_ResortGorgeous_Text_GillianDefeat
	msgbox FiveIsland_ResortGorgeous_Text_GillianPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_Destin:: @ 81AC25D
	trainerbattle_single TRAINER_YOUNGSTER_DESTIN, FiveIsland_ResortGorgeous_Text_DestinIntro, FiveIsland_ResortGorgeous_Text_DestinDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_ResortGorgeous_EventScript_DestinRematch
	msgbox FiveIsland_ResortGorgeous_Text_DestinPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_DestinRematch:: @ 81AC284
	trainerbattle_rematch TRAINER_YOUNGSTER_DESTIN, FiveIsland_ResortGorgeous_Text_DestinRematchIntro, FiveIsland_ResortGorgeous_Text_DestinDefeat
	msgbox FiveIsland_ResortGorgeous_Text_DestinPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_Toby:: @ 81AC29B
	trainerbattle_single TRAINER_SWIMMER_MALE_TOBY, FiveIsland_ResortGorgeous_Text_TobyIntro, FiveIsland_ResortGorgeous_Text_TobyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_ResortGorgeous_EventScript_TobyRematch
	msgbox FiveIsland_ResortGorgeous_Text_TobyPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_ResortGorgeous_EventScript_TobyRematch:: @ 81AC2C2
	trainerbattle_rematch TRAINER_SWIMMER_MALE_TOBY, FiveIsland_ResortGorgeous_Text_TobyRematchIntro, FiveIsland_ResortGorgeous_Text_TobyDefeat
	msgbox FiveIsland_ResortGorgeous_Text_TobyPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_WaterLabyrinth_EventScript_Alize:: @ 81AC2D9
	trainerbattle_single TRAINER_PKMN_BREEDER_ALIZE, FiveIsland_WaterLabyrinth_Text_AlizeIntro, FiveIsland_WaterLabyrinth_Text_AlizeDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_WaterLabyrinth_EventScript_AlizeRematch
	msgbox FiveIsland_WaterLabyrinth_Text_AlizePostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_WaterLabyrinth_EventScript_AlizeRematch:: @ 81AC300
	trainerbattle_rematch TRAINER_PKMN_BREEDER_ALIZE, FiveIsland_WaterLabyrinth_Text_AlizeRematchIntro, FiveIsland_WaterLabyrinth_Text_AlizeDefeat
	msgbox FiveIsland_WaterLabyrinth_Text_AlizePostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_Milo:: @ 81AC317
	trainerbattle_single TRAINER_BIRD_KEEPER_MILO, FiveIsland_MemorialPillar_Text_MiloIntro, FiveIsland_MemorialPillar_Text_MiloDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_MemorialPillar_EventScript_MiloRematch
	msgbox FiveIsland_MemorialPillar_Text_MiloPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_MiloRematch:: @ 81AC33E
	trainerbattle_rematch TRAINER_BIRD_KEEPER_MILO, FiveIsland_MemorialPillar_Text_MiloRematchIntro, FiveIsland_MemorialPillar_Text_MiloDefeat
	msgbox FiveIsland_MemorialPillar_Text_MiloPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_Chaz:: @ 81AC355
	trainerbattle_single TRAINER_BIRD_KEEPER_CHAZ, FiveIsland_MemorialPillar_Text_ChazIntro, FiveIsland_MemorialPillar_Text_ChazDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_MemorialPillar_EventScript_ChazRematch
	msgbox FiveIsland_MemorialPillar_Text_ChazPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_ChazRematch:: @ 81AC37C
	trainerbattle_rematch TRAINER_BIRD_KEEPER_CHAZ, FiveIsland_MemorialPillar_Text_ChazRematchIntro, FiveIsland_MemorialPillar_Text_ChazDefeat
	msgbox FiveIsland_MemorialPillar_Text_ChazPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_Harold:: @ 81AC393
	trainerbattle_single TRAINER_BIRD_KEEPER_HAROLD, FiveIsland_MemorialPillar_Text_HaroldIntro, FiveIsland_MemorialPillar_Text_HaroldDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq FiveIsland_MemorialPillar_EventScript_HaroldRematch
	msgbox FiveIsland_MemorialPillar_Text_HaroldPostBattle, MSGBOX_AUTOCLOSE
	end

FiveIsland_MemorialPillar_EventScript_HaroldRematch:: @ 81AC3BA
	trainerbattle_rematch TRAINER_BIRD_KEEPER_HAROLD, FiveIsland_MemorialPillar_Text_HaroldRematchIntro, FiveIsland_MemorialPillar_Text_HaroldDefeat
	msgbox FiveIsland_MemorialPillar_Text_HaroldPostBattle, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC3D1:: @ 81AC3D1
	trainerbattle_single TRAINER_FISHERMAN_TYLOR, Text_18B400, Text_18B43B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC3F8
	msgbox Text_18B451, MSGBOX_AUTOCLOSE
	end

EventScript_1AC3F8:: @ 81AC3F8
	trainerbattle_rematch TRAINER_FISHERMAN_TYLOR, Text_1C3ED0, Text_18B43B
	msgbox Text_18B451, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC40F:: @ 81AC40F
	trainerbattle_single TRAINER_SWIMMER_MALE_MYMO, Text_18B48F, Text_18B4C5
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC436
	msgbox Text_18B4D1, MSGBOX_AUTOCLOSE
	end

EventScript_1AC436:: @ 81AC436
	trainerbattle_rematch TRAINER_SWIMMER_MALE_MYMO, Text_1C3F11, Text_18B4C5
	msgbox Text_18B4D1, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC44D:: @ 81AC44D
	trainerbattle_single TRAINER_SWIMMER_FEMALE_NICOLE, Text_18B4FA, Text_18B539
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC474
	msgbox Text_18B573, MSGBOX_AUTOCLOSE
	end

EventScript_1AC474:: @ 81AC474
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_NICOLE, Text_1C3F51, Text_18B539
	msgbox Text_18B573, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC48B:: @ 81AC48B
	trainerbattle_double TRAINER_SIS_AND_BRO_AVA_GEB, Text_18B5C8, Text_18B5F4, Text_18B660
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC4B6
	msgbox Text_18B62E, MSGBOX_AUTOCLOSE
	end

EventScript_1AC4B6:: @ 81AC4B6
	trainerbattle_rematch_double TRAINER_SIS_AND_BRO_AVA_GEB, Text_1C3F7B, Text_18B5F4, Text_18B660
	msgbox Text_18B62E, MSGBOX_AUTOCLOSE
	end

SixIsland_OutcastIsland_EventScript_1AC4D1:: @ 81AC4D1
	trainerbattle_double TRAINER_SIS_AND_BRO_AVA_GEB, Text_18B6C1, Text_18B6EF, Text_18B762
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC4FC
	msgbox Text_18B720, MSGBOX_AUTOCLOSE
	end

EventScript_1AC4FC:: @ 81AC4FC
	trainerbattle_rematch_double TRAINER_SIS_AND_BRO_AVA_GEB, Text_1C3FB3, Text_18B6EF, Text_18B762
	msgbox Text_18B720, MSGBOX_AUTOCLOSE
	end

SixIsland_GreenPath_EventScript_1AC517:: @ 81AC517
	trainerbattle_single TRAINER_PSYCHIC_JACLYN, Text_18B7B0, Text_18B7F0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC53E
	msgbox Text_18B7FD, MSGBOX_AUTOCLOSE
	end

EventScript_1AC53E:: @ 81AC53E
	trainerbattle_rematch TRAINER_PSYCHIC_JACLYN, Text_1C3FE9, Text_18B7F0
	msgbox Text_18B7FD, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC555:: @ 81AC555
	trainerbattle_single TRAINER_AROMA_LADY_ROSE, Text_18B896, Text_18B8C8
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC57C
	msgbox Text_18B8F7, MSGBOX_AUTOCLOSE
	end

EventScript_1AC57C:: @ 81AC57C
	trainerbattle_rematch TRAINER_AROMA_LADY_ROSE, Text_1C4028, Text_18B8C8
	msgbox Text_18B8F7, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC593:: @ 81AC593
	trainerbattle_single TRAINER_JUGGLER_EDWARD, Text_18B959, Text_18B988
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC5BA
	msgbox Text_18B9A5, MSGBOX_AUTOCLOSE
	end

EventScript_1AC5BA:: @ 81AC5BA
	trainerbattle_rematch TRAINER_JUGGLER_EDWARD, Text_1C4057, Text_18B988
	msgbox Text_18B9A5, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC5D1:: @ 81AC5D1
	trainerbattle_single TRAINER_SWIMMER_MALE_SAMIR, Text_18B9EC, Text_18BA47
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC5F8
	msgbox Text_18BA57, MSGBOX_AUTOCLOSE
	end

EventScript_1AC5F8:: @ 81AC5F8
	trainerbattle_rematch TRAINER_SWIMMER_MALE_SAMIR, Text_1C407F, Text_18BA47
	msgbox Text_18BA57, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC60F:: @ 81AC60F
	trainerbattle_single TRAINER_SWIMMER_FEMALE_DENISE, Text_18BA86, Text_18BAC0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC636
	msgbox Text_18BAE0, MSGBOX_AUTOCLOSE
	end

EventScript_1AC636:: @ 81AC636
	trainerbattle_rematch TRAINER_SWIMMER_FEMALE_DENISE, Text_1C40D9, Text_18BAC0
	msgbox Text_18BAE0, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC64D:: @ 81AC64D
	trainerbattle_double TRAINER_TWINS_MIU_MIA, Text_18BBBA, Text_18BBE2, Text_18BC24
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC678
	msgbox Text_18BBF6, MSGBOX_AUTOCLOSE
	end

EventScript_1AC678:: @ 81AC678
	trainerbattle_rematch_double TRAINER_TWINS_MIU_MIA, Text_1C4138, Text_18BBE2, Text_18BC24
	msgbox Text_18BBF6, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC693:: @ 81AC693
	trainerbattle_double TRAINER_TWINS_MIU_MIA, Text_18BC5A, Text_18BC84, Text_18BCCF
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC6BE
	msgbox Text_18BCAE, MSGBOX_AUTOCLOSE
	end

EventScript_1AC6BE:: @ 81AC6BE
	trainerbattle_rematch_double TRAINER_TWINS_MIU_MIA, Text_1C4166, Text_18BC84, Text_18BCCF
	msgbox Text_18BCAE, MSGBOX_AUTOCLOSE
	end

SixIsland_WaterPath_EventScript_1AC6D9:: @ 81AC6D9
	trainerbattle_single TRAINER_HIKER_EARL, Text_18BB2D, Text_18BB62
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC700
	msgbox Text_18BB8B, MSGBOX_AUTOCLOSE
	end

EventScript_1AC700:: @ 81AC700
	trainerbattle_rematch TRAINER_HIKER_EARL, Text_1C40FA, Text_18BB62
	msgbox Text_18BB8B, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC717:: @ 81AC717
	trainerbattle_single TRAINER_RUIN_MANIAC_STANLY, Text_18BE5D, Text_18BE9B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC73E
	msgbox Text_18BEA0, MSGBOX_AUTOCLOSE
	end

EventScript_1AC73E:: @ 81AC73E
	trainerbattle_rematch TRAINER_RUIN_MANIAC_STANLY, Text_1C4196, Text_18BE9B
	msgbox Text_18BEA0, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC755:: @ 81AC755
	trainerbattle_single TRAINER_RUIN_MANIAC_FOSTER, Text_18BF05, Text_18BF33
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC77C
	msgbox Text_18BF6C, MSGBOX_AUTOCLOSE
	end

EventScript_1AC77C:: @ 81AC77C
	trainerbattle_rematch TRAINER_RUIN_MANIAC_FOSTER, Text_1C41D4, Text_18BF33
	msgbox Text_18BF6C, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC793:: @ 81AC793
	trainerbattle_single TRAINER_RUIN_MANIAC_LARRY, Text_18BFC5, Text_18C03B
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC7BA
	msgbox Text_18C04C, MSGBOX_AUTOCLOSE
	end

EventScript_1AC7BA:: @ 81AC7BA
	trainerbattle_rematch TRAINER_RUIN_MANIAC_LARRY, Text_1C4210, Text_18C03B
	msgbox Text_18C04C, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC7D1:: @ 81AC7D1
	trainerbattle_single TRAINER_HIKER_DARYL, Text_18C09C, Text_18C0BB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC7F8
	msgbox Text_18C0EA, MSGBOX_AUTOCLOSE
	end

EventScript_1AC7F8:: @ 81AC7F8
	trainerbattle_rematch TRAINER_HIKER_DARYL, Text_1C4280, Text_18C0BB
	msgbox Text_18C0EA, MSGBOX_AUTOCLOSE
	end

SixIsland_RuinValley_EventScript_1AC80F:: @ 81AC80F
	trainerbattle_single TRAINER_POKEMANIAC_HECTOR, Text_18C10A, Text_18C140
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC836
	msgbox Text_18C17A, MSGBOX_AUTOCLOSE
	end

EventScript_1AC836:: @ 81AC836
	trainerbattle_rematch TRAINER_POKEMANIAC_HECTOR, Text_1C42A0, Text_18C140
	msgbox Text_18C17A, MSGBOX_AUTOCLOSE
	end

SevenIsland_TrainerTower_EventScript_1AC84D:: @ 81AC84D
	trainerbattle_single TRAINER_PSYCHIC_DARIO, Text_18C1ED, Text_18C205
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC874
	msgbox Text_18C20E, MSGBOX_AUTOCLOSE
	end

EventScript_1AC874:: @ 81AC874
	trainerbattle_rematch TRAINER_PSYCHIC_DARIO, Text_1C42D6, Text_18C205
	msgbox Text_18C20E, MSGBOX_AUTOCLOSE
	end

SevenIsland_TrainerTower_EventScript_1AC88B:: @ 81AC88B
	trainerbattle_single TRAINER_PSYCHIC_RODETTE, Text_18C283, Text_18C2BC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC8B2
	msgbox Text_18C2D5, MSGBOX_AUTOCLOSE
	end

EventScript_1AC8B2:: @ 81AC8B2
	trainerbattle_rematch TRAINER_PSYCHIC_RODETTE, Text_1C42EE, Text_18C2BC
	msgbox Text_18C2D5, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC8C9:: @ 81AC8C9
	trainerbattle_single TRAINER_AROMA_LADY_MIAH, Text_18C3BC, Text_18C3E7
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC8F0
	msgbox Text_18C3FF, MSGBOX_AUTOCLOSE
	end

EventScript_1AC8F0:: @ 81AC8F0
	trainerbattle_rematch TRAINER_AROMA_LADY_MIAH, Text_1C4327, Text_18C3E7
	msgbox Text_18C3FF, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC907:: @ 81AC907
	trainerbattle_double TRAINER_YOUNG_COUPLE_EVE_JON, Text_18C632, Text_18C662, Text_18C6AB
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC932
	msgbox Text_18C683, MSGBOX_AUTOCLOSE
	end

EventScript_1AC932:: @ 81AC932
	trainerbattle_rematch_double TRAINER_YOUNG_COUPLE_EVE_JON, Text_1C4416, Text_18C662, Text_18C6AB
	msgbox Text_18C683, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC94D:: @ 81AC94D
	trainerbattle_double TRAINER_YOUNG_COUPLE_EVE_JON, Text_18C700, Text_18C73B, Text_18C7BD
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC978
	msgbox Text_18C773, MSGBOX_AUTOCLOSE
	end

EventScript_1AC978:: @ 81AC978
	trainerbattle_rematch_double TRAINER_YOUNG_COUPLE_EVE_JON, Text_1C444C, Text_18C73B, Text_18C7BD
	msgbox Text_18C773, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC993:: @ 81AC993
	trainerbattle_single TRAINER_JUGGLER_MASON, Text_18C44B, Text_18C473
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC9BA
	msgbox Text_18C4BA, MSGBOX_AUTOCLOSE
	end

EventScript_1AC9BA:: @ 81AC9BA
	trainerbattle_rematch TRAINER_JUGGLER_MASON, Text_1C4374, Text_18C473
	msgbox Text_18C4BA, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1AC9D1:: @ 81AC9D1
	trainerbattle_single TRAINER_PKMN_RANGER_NICOLAS, Text_18C500, Text_18C543
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1AC9F8
	msgbox Text_18C54B, MSGBOX_AUTOCLOSE
	end

EventScript_1AC9F8:: @ 81AC9F8
	trainerbattle_rematch TRAINER_PKMN_RANGER_NICOLAS, Text_1C43AD, Text_18C543
	msgbox Text_18C54B, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_Entrance_EventScript_1ACA0F:: @ 81ACA0F
	trainerbattle_single TRAINER_PKMN_RANGER_MADELINE, Text_18C5AA, Text_18C5CD
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACA36
	msgbox Text_18C5F5, MSGBOX_AUTOCLOSE
	end

EventScript_1ACA36:: @ 81ACA36
	trainerbattle_rematch TRAINER_PKMN_RANGER_MADELINE, Text_1C43EC, Text_18C5CD
	msgbox Text_18C5F5, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACA4D:: @ 81ACA4D
	trainerbattle_single TRAINER_CRUSH_GIRL_CYNDY, Text_18C887, Text_18C8A6
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACA74
	msgbox Text_18C8C2, MSGBOX_AUTOCLOSE
	end

EventScript_1ACA74:: @ 81ACA74
	trainerbattle_rematch TRAINER_CRUSH_GIRL_CYNDY, Text_1C4491, Text_18C8A6
	msgbox Text_18C8C2, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACA8B:: @ 81ACA8B
	trainerbattle_single TRAINER_TAMER_EVAN, Text_18C8FD, Text_18C980
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACAB2
	msgbox Text_18C999, MSGBOX_AUTOCLOSE
	end

EventScript_1ACAB2:: @ 81ACAB2
	trainerbattle_rematch TRAINER_TAMER_EVAN, Text_1C44CB, Text_18C980
	msgbox Text_18C999, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACAC9:: @ 81ACAC9
	trainerbattle_single TRAINER_PKMN_RANGER_JACKSON, Text_18CA2F, Text_18CA6F
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACAF0
	msgbox Text_18CA9C, MSGBOX_AUTOCLOSE
	end

EventScript_1ACAF0:: @ 81ACAF0
	trainerbattle_rematch TRAINER_PKMN_RANGER_JACKSON, Text_1C454E, Text_18CA6F
	msgbox Text_18CA9C, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACB07:: @ 81ACB07
	trainerbattle_single TRAINER_PKMN_RANGER_KATELYN, Text_18CB16, Text_18CB3E
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACB2E
	msgbox Text_18CB6C, MSGBOX_AUTOCLOSE
	end

EventScript_1ACB2E:: @ 81ACB2E
	trainerbattle_rematch TRAINER_PKMN_RANGER_KATELYN, Text_1C458E, Text_18CB3E
	msgbox Text_18CB6C, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACB45:: @ 81ACB45
	trainerbattle_single TRAINER_COOLTRAINER_LEROY, Text_18CBB4, Text_18CBE0
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACB6C
	msgbox Text_18CC09, MSGBOX_AUTOCLOSE
	end

EventScript_1ACB6C:: @ 81ACB6C
	trainerbattle_rematch TRAINER_COOLTRAINER_LEROY, Text_1C45C2, Text_18CBE0
	msgbox Text_18CC09, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACB83:: @ 81ACB83
	trainerbattle_single TRAINER_COOLTRAINER_MICHELLE, Text_18CC4F, Text_18CCAE
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACBAA
	msgbox Text_18CCEA, MSGBOX_AUTOCLOSE
	end

EventScript_1ACBAA:: @ 81ACBAA
	trainerbattle_rematch TRAINER_COOLTRAINER_MICHELLE, Text_1C45FB, Text_18CCAE
	msgbox Text_18CCEA, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACBC1:: @ 81ACBC1
	trainerbattle_double TRAINER_COOL_COUPLE_LEX_NYA, Text_18CD49, Text_18CD75, Text_18CDE2
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACBEC
	msgbox Text_18CD9C, MSGBOX_AUTOCLOSE
	end

EventScript_1ACBEC:: @ 81ACBEC
	trainerbattle_rematch_double TRAINER_COOL_COUPLE_LEX_NYA, Text_1C4662, Text_18CD75, Text_18CDE2
	msgbox Text_18CD9C, MSGBOX_AUTOCLOSE
	end

SevenIsland_SevaultCanyon_EventScript_1ACC07:: @ 81ACC07
	trainerbattle_double TRAINER_COOL_COUPLE_LEX_NYA, Text_18CE20, Text_18CE5A, Text_18CEF4
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_1ACC32
	msgbox Text_18CE78, MSGBOX_AUTOCLOSE
	end

EventScript_1ACC32:: @ 81ACC32
	trainerbattle_rematch_double TRAINER_COOL_COUPLE_LEX_NYA, Text_1C4699, Text_18CE5A, Text_18CEF4
	msgbox Text_18CE78, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_Brandon:: @ 81ACC4D
	trainerbattle_single TRAINER_RUIN_MANIAC_BRANDON, SevenIsland_TanobyRuins_Text_BrandonIntro, SevenIsland_TanobyRuins_Text_BrandonDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq SevenIsland_TanobyRuins_EventScript_RematchBrandon
	msgbox SevenIsland_TanobyRuins_Text_BrandonPostBattle, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_RematchBrandon:: @ 81ACC74
	trainerbattle_rematch TRAINER_RUIN_MANIAC_BRANDON, SevenIsland_TanobyRuins_Text_BrandonRematchIntro, SevenIsland_TanobyRuins_Text_BrandonDefeat
	msgbox SevenIsland_TanobyRuins_Text_BrandonPostBattle, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_Benjamin:: @ 81ACC8B
	trainerbattle_single TRAINER_RUIN_MANIAC_BENJAMIN, SevenIsland_TanobyRuins_Text_BenjaminIntro, SevenIsland_TanobyRuins_Text_BenjaminDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq SevenIsland_TanobyRuins_EventScript_RematchBenjamin
	msgbox SevenIsland_TanobyRuins_Text_BenjaminPostBattle, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_RematchBenjamin:: @ 81ACCB2
	trainerbattle_rematch TRAINER_RUIN_MANIAC_BENJAMIN, SevenIsland_TanobyRuins_Text_BenjaminRematchIntro, SevenIsland_TanobyRuins_Text_BenjaminDefeat
	msgbox SevenIsland_TanobyRuins_Text_BenjaminPostBattle, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_Edna:: @ 81ACCC9
	trainerbattle_single TRAINER_PAINTER_EDNA, SevenIsland_TanobyRuins_Text_EdnaIntro, SevenIsland_TanobyRuins_Text_EdnaDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq SevenIsland_TanobyRuins_EventScript_RematchEdna
	msgbox SevenIsland_TanobyRuins_Text_EdnaPostBattle, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_RematchEdna:: @ 81ACCF0
	trainerbattle_rematch TRAINER_PAINTER_EDNA, SevenIsland_TanobyRuins_Text_EdnaRematchIntro, SevenIsland_TanobyRuins_Text_EdnaDefeat
	msgbox SevenIsland_TanobyRuins_Text_EdnaPostBattle, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_Clifford:: @ 81ACD07
	trainerbattle_single TRAINER_GENTLEMAN_CLIFFORD, SevenIsland_TanobyRuins_Text_CliffordIntro, SevenIsland_TanobyRuins_Text_CliffordDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, TRUE
	goto_if_eq SevenIsland_TanobyRuins_EventScript_RematchClifford
	msgbox SevenIsland_TanobyRuins_Text_CliffordPostBattle, MSGBOX_AUTOCLOSE
	end

SevenIsland_TanobyRuins_EventScript_RematchClifford:: @ 81ACD2E
	trainerbattle_rematch TRAINER_GENTLEMAN_CLIFFORD, SevenIsland_TanobyRuins_Text_CliffordRematchIntro, SevenIsland_TanobyRuins_Text_CliffordDefeat
	msgbox SevenIsland_TanobyRuins_Text_CliffordPostBattle, MSGBOX_AUTOCLOSE
	end
