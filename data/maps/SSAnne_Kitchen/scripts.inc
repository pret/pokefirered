SSAnne_Kitchen_MapScripts:: @ 8160AB2
	.byte 0

SSAnne_Kitchen_EventScript_160AB3:: @ 8160AB3
	msgbox gUnknown_81733F8, MSGBOX_NPC
	end

SSAnne_Kitchen_EventScript_160ABC:: @ 8160ABC
	msgbox gUnknown_8173429, MSGBOX_NPC
	end

SSAnne_Kitchen_EventScript_160AC5:: @ 8160AC5
	msgbox gUnknown_8173462, MSGBOX_NPC
	end

SSAnne_Kitchen_EventScript_160ACE:: @ 8160ACE
	lock
	faceplayer
	msgbox gUnknown_8173570
	random 3
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, 0
	call_if_eq EventScript_160B03
	compare VAR_0x8008, 1
	call_if_eq EventScript_160B0C
	compare VAR_0x8008, 2
	call_if_eq EventScript_160B15
	release
	end

EventScript_160B03:: @ 8160B03
	msgbox gUnknown_817359F
	return

EventScript_160B0C:: @ 8160B0C
	msgbox gUnknown_81735DF
	return

EventScript_160B15:: @ 8160B15
	msgbox gUnknown_8173611
	return

SSAnne_Kitchen_EventScript_160B1E:: @ 8160B1E
	msgbox gUnknown_81734A0, MSGBOX_NPC
	end

SSAnne_Kitchen_EventScript_160B27:: @ 8160B27
	msgbox gUnknown_81734D3, MSGBOX_NPC
	end

SSAnne_Kitchen_EventScript_160B30:: @ 8160B30
	msgbox gUnknown_817353E, MSGBOX_NPC
	end
