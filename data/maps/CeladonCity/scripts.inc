CeladonCity_MapScripts:: @ 8166C8F
    map_script 3, CeladonCity_MapScript1_166C95
    .byte 0

CeladonCity_MapScript1_166C95:: @ 8166C95
    setworldmapflag 2198
    end

CeladonCity_EventScript_166C99:: @ 8166C99
    loadword 0, gUnknown_817FEC3
    callstd 2
    end

CeladonCity_EventScript_166CA2:: @ 8166CA2
    lock
    loadword 0, gUnknown_817FF1C
    callstd 4
    release
    end

CeladonCity_EventScript_166CAD:: @ 8166CAD
    loadword 0, gUnknown_817FF4A
    callstd 2
    end

CeladonCity_EventScript_166CB6:: @ 8166CB6
    loadword 0, gUnknown_817FFC5
    callstd 2
    end

CeladonCity_EventScript_166CBF:: @ 8166CBF
    goto EventScript_1C4A86
    end

CeladonCity_EventScript_166CC5:: @ 8166CC5
    lock
    faceplayer
    loadword 0, gUnknown_818001B
    callstd 4
    closemessage
    applymovement 2, Movement_1A75E5
    waitmovement 0
    release
    end

CeladonCity_EventScript_166CDC:: @ 8166CDC
    lock
    faceplayer
    waitse
    playmoncry SPECIES_POLIWRATH, 0
    loadword 0, gUnknown_8180075
    callstd 4
    closemessage
    waitmoncry
    applymovement 3, Movement_1A75E5
    waitmovement 0
    release
    end

CeladonCity_EventScript_166CFA:: @ 8166CFA
    loadword 0, gUnknown_81800C2
    callstd 2
    end

CeladonCity_EventScript_166D03:: @ 8166D03
    loadword 0, gUnknown_818008C
    callstd 2
    end

CeladonCity_EventScript_166D0C:: @ 8166D0C
    loadword 0, gUnknown_8180300
    callstd 2
    end

CeladonCity_EventScript_166D15:: @ 8166D15
    loadword 0, gUnknown_81804E1
    callstd 2
    end

CeladonCity_EventScript_166D1E:: @ 8166D1E
    loadword 0, gUnknown_81800E1
    callstd 3
    end

CeladonCity_EventScript_166D27:: @ 8166D27
    loadword 0, gUnknown_818017A
    callstd 3
    end

CeladonCity_EventScript_166D30:: @ 8166D30
    lockall
    setvar VAR_0x8004, 5
    setvar VAR_0x8005, 0
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_81801A2
    callstd 4
    releaseall
    end

CeladonCity_EventScript_166D48:: @ 8166D48
    loadword 0, gUnknown_81801E5
    callstd 3
    end

CeladonCity_EventScript_166D51:: @ 8166D51
    loadword 0, gUnknown_81801F5
    callstd 3
    end

CeladonCity_EventScript_166D5A:: @ 8166D5A
    loadword 0, gUnknown_8180224
    callstd 3
    end

CeladonCity_EventScript_166D63:: @ 8166D63
    loadword 0, gUnknown_81802A4
    callstd 3
    end

CeladonCity_EventScript_166D6C:: @ 8166D6C
    loadword 0, gUnknown_81802CF
    callstd 3
    end
