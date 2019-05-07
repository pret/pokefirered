FuchsiaCity_House1_MapScripts:: @ 816D6C5
    .byte 0

FuchsiaCity_House1_EventScript_16D6C6:: @ 816D6C6
    loadword 0, gUnknown_8198BBB
    callstd 2
    end

FuchsiaCity_House1_EventScript_16D6CF:: @ 816D6CF
    lock
    faceplayer
    setvar VAR_0x8004, 13
    setvar VAR_0x8005, 2
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_8198C1F
    callstd 4
    release
    end

FuchsiaCity_House1_EventScript_16D6E8:: @ 816D6E8
    loadword 0, gUnknown_8198C7B
    callstd 2
    end
