SSAnne_Kitchen_MapScripts:: @ 8160AB2
	.byte 0

SSAnne_Kitchen_EventScript_160AB3:: @ 8160AB3
	loadword 0, gUnknown_81733F8
	callstd 2
	end

SSAnne_Kitchen_EventScript_160ABC:: @ 8160ABC
	loadword 0, gUnknown_8173429
	callstd 2
	end

SSAnne_Kitchen_EventScript_160AC5:: @ 8160AC5
	loadword 0, gUnknown_8173462
	callstd 2
	end

SSAnne_Kitchen_EventScript_160ACE:: @ 8160ACE
	lock
	faceplayer
	loadword 0, gUnknown_8173570
	callstd 4
	random 3
	copyvar VAR_0x8008, VAR_RESULT
	compare_var_to_value VAR_0x8008, 0
	call_if 1, EventScript_160B03
	compare_var_to_value VAR_0x8008, 1
	call_if 1, EventScript_160B0C
	compare_var_to_value VAR_0x8008, 2
	call_if 1, EventScript_160B15
	release
	end

EventScript_160B03:: @ 8160B03
	loadword 0, gUnknown_817359F
	callstd 4
	return

EventScript_160B0C:: @ 8160B0C
	loadword 0, gUnknown_81735DF
	callstd 4
	return

EventScript_160B15:: @ 8160B15
	loadword 0, gUnknown_8173611
	callstd 4
	return

SSAnne_Kitchen_EventScript_160B1E:: @ 8160B1E
	loadword 0, gUnknown_81734A0
	callstd 2
	end

SSAnne_Kitchen_EventScript_160B27:: @ 8160B27
	loadword 0, gUnknown_81734D3
	callstd 2
	end

SSAnne_Kitchen_EventScript_160B30:: @ 8160B30
	loadword 0, gUnknown_817353E
	callstd 2
	end
