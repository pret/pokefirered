SSAnne_2F_Corridor_MapScripts:: @ 81608DE
    .byte 0

SSAnne_2F_Corridor_EventScript_1608DF:: @ 81608DF
    lockall
    setvar VAR_0x4001, 0
    goto EventScript_160903

EventScript_1608EA:: @ 81608EA
    end

SSAnne_2F_Corridor_EventScript_1608EB:: @ 81608EB
    lockall
    setvar VAR_0x4001, 1
    goto EventScript_160903

EventScript_1608F6:: @ 81608F6
    end

SSAnne_2F_Corridor_EventScript_1608F7:: @ 81608F7
    lockall
    setvar VAR_0x4001, 2
    goto EventScript_160903

EventScript_160902:: @ 8160902
    end

EventScript_160903:: @ 8160903
    textcolor 0
    playse SE_KAIDAN
    delay 5
    playbgm BGM_FRLG_RIVAL, 0
    addobject 1
    delay 10
    applymovement 1, Movement_1A75ED
    waitmovement 0
    delay 20
    compare_var_to_value VAR_0x4001, 0
    call_if 1, EventScript_1609AD
    compare_var_to_value VAR_0x4001, 1
    call_if 1, EventScript_1609B8
    compare_var_to_value VAR_0x4001, 2
    call_if 1, EventScript_1609CA
    loadword 0, gUnknown_8173035
    callstd 4
    setvar VAR_LAST_TALKED, 1
    compare_var_to_value VAR_STARTER_MON, 2
    call_if 1, EventScript_1609DC
    compare_var_to_value VAR_STARTER_MON, 1
    call_if 1, EventScript_1609E7
    compare_var_to_value VAR_STARTER_MON, 0
    call_if 1, EventScript_1609F2
    loadword 0, gUnknown_8173164
    callstd 4
    closemessage
    delay 10
    playbgm BGM_FRLG_RIVAL_POSTBATTLE, 0
    compare_var_to_value VAR_0x4001, 0
    call_if 1, EventScript_1609FD
    compare_var_to_value VAR_0x4001, 1
    call_if 1, EventScript_160A08
    compare_var_to_value VAR_0x4001, 2
    call_if 1, EventScript_160A13
    fadedefaultbgm
    removeobject 1
    setvar VAR_0x405B, 1
    releaseall
    end

EventScript_1609AD:: @ 81609AD
    applymovement 1, Movement_160A2A
    waitmovement 0
    return

EventScript_1609B8:: @ 81609B8
    applymovement 1, Movement_160A2E
    applymovement 255, Movement_160A24
    waitmovement 0
    return

EventScript_1609CA:: @ 81609CA
    applymovement 255, Movement_160A1E
    applymovement 1, Movement_160A34
    waitmovement 0
    return

EventScript_1609DC:: @ 81609DC
    trainerbattle 3, 426, 0, Text_173110
    return

EventScript_1609E7:: @ 81609E7
    trainerbattle 3, 427, 0, Text_173110
    return

EventScript_1609F2:: @ 81609F2
    trainerbattle 3, 428, 0, Text_173110
    return

EventScript_1609FD:: @ 81609FD
    applymovement 1, Movement_160A3B
    waitmovement 0
    return

EventScript_160A08:: @ 8160A08
    applymovement 1, Movement_160A44
    waitmovement 0
    return

EventScript_160A13:: @ 8160A13
    applymovement 1, Movement_160A4C
    waitmovement 0
    return

Movement_160A1E:: @ 8160A1E
    step_1c
    step_1c
    step_1c
    step_1c
    step_2f
    step_end

Movement_160A24:: @ 8160A24
    step_1c
    step_1c
    step_1c
    step_1c
    step_2f
    step_end

Movement_160A2A:: @ 8160A2A
    step_10
    step_10
    step_10
    step_end

Movement_160A2E:: @ 8160A2E
    step_10
    step_10
    step_10
    step_10
    step_30
    step_end

Movement_160A34:: @ 8160A34
    step_10
    step_10
    step_10
    step_10
    step_13
    step_1a
    step_end

Movement_160A3B:: @ 8160A3B
    step_13
    step_10
    step_10
    step_10
    step_10
    step_10
    step_10
    step_10
    step_end

Movement_160A44:: @ 8160A44
    step_10
    step_10
    step_10
    step_10
    step_10
    step_10
    step_10
    step_end

Movement_160A4C:: @ 8160A4C
    step_10
    step_10
    step_10
    step_10
    step_10
    step_10
    step_10
    step_end

SSAnne_2F_Corridor_EventScript_160A54:: @ 8160A54
    loadword 0, gUnknown_8172FC3
    callstd 2
    end
