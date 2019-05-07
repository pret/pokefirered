SilphCo_Elevator_MapScripts:: @ 8161F6E
    .byte 0

SilphCo_Elevator_EventScript_161F6F:: @ 8161F6F
    lockall
    setvar VAR_0x8004, 1
    checkflag FLAG_0x002
    call_if 0, EventScript_1A7AB9
    copyvar VAR_0x8005, VAR_0x403A
    special sub_80CB580
    message Text_1A535C
    waitmessage
    setvar VAR_0x8004, 1
    specialvar VAR_RESULT, sub_80CB328
    special sub_80CB7C4
    waitstate
    copyvar VAR_0x8000, VAR_RESULT
    compare_var_to_value VAR_0x8000, 0
    goto_if 1, EventScript_1621BF
    compare_var_to_value VAR_0x8000, 1
    goto_if 1, EventScript_162197
    compare_var_to_value VAR_0x8000, 2
    goto_if 1, EventScript_16216F
    compare_var_to_value VAR_0x8000, 3
    goto_if 1, EventScript_162147
    compare_var_to_value VAR_0x8000, 4
    goto_if 1, EventScript_16211F
    compare_var_to_value VAR_0x8000, 5
    goto_if 1, EventScript_1620F7
    compare_var_to_value VAR_0x8000, 6
    goto_if 1, EventScript_1620CF
    compare_var_to_value VAR_0x8000, 7
    goto_if 1, EventScript_1620A7
    compare_var_to_value VAR_0x8000, 8
    goto_if 1, EventScript_16207F
    compare_var_to_value VAR_0x8000, 9
    goto_if 1, EventScript_162057
    compare_var_to_value VAR_0x8000, 10
    goto_if 1, EventScript_16202F
    compare_var_to_value VAR_0x8000, 11
    goto_if 1, EventScript_1621E7
    compare_var_to_value VAR_0x8000, 127
    goto_if 1, EventScript_1621E7
    end

EventScript_16202F:: @ 816202F
    setvar VAR_0x8006, 4
    setdynamicwarp MAP_SILPHCO_1F, 255, 22, 3
    compare_var_to_value VAR_0x403A, 4
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 4
    goto EventScript_1621E7

EventScript_162056:: @ 8162056
    end

EventScript_162057:: @ 8162057
    setvar VAR_0x8006, 5
    setdynamicwarp MAP_SILPHCO_2F, 255, 22, 3
    compare_var_to_value VAR_0x403A, 5
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 5
    goto EventScript_1621E7

EventScript_16207E:: @ 816207E
    end

EventScript_16207F:: @ 816207F
    setvar VAR_0x8006, 6
    setdynamicwarp MAP_SILPHCO_3F, 255, 22, 3
    compare_var_to_value VAR_0x403A, 6
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 6
    goto EventScript_1621E7

EventScript_1620A6:: @ 81620A6
    end

EventScript_1620A7:: @ 81620A7
    setvar VAR_0x8006, 7
    setdynamicwarp MAP_SILPHCO_4F, 255, 22, 3
    compare_var_to_value VAR_0x403A, 7
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 7
    goto EventScript_1621E7

EventScript_1620CE:: @ 81620CE
    end

EventScript_1620CF:: @ 81620CF
    setvar VAR_0x8006, 8
    setdynamicwarp MAP_SILPHCO_5F, 255, 22, 3
    compare_var_to_value VAR_0x403A, 8
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 8
    goto EventScript_1621E7

EventScript_1620F6:: @ 81620F6
    end

EventScript_1620F7:: @ 81620F7
    setvar VAR_0x8006, 9
    setdynamicwarp MAP_SILPHCO_6F, 255, 20, 3
    compare_var_to_value VAR_0x403A, 9
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 9
    goto EventScript_1621E7

EventScript_16211E:: @ 816211E
    end

EventScript_16211F:: @ 816211F
    setvar VAR_0x8006, 10
    setdynamicwarp MAP_SILPHCO_7F, 255, 23, 3
    compare_var_to_value VAR_0x403A, 10
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 10
    goto EventScript_1621E7

EventScript_162146:: @ 8162146
    end

EventScript_162147:: @ 8162147
    setvar VAR_0x8006, 11
    setdynamicwarp MAP_SILPHCO_8F, 255, 22, 3
    compare_var_to_value VAR_0x403A, 11
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 11
    goto EventScript_1621E7

EventScript_16216E:: @ 816216E
    end

EventScript_16216F:: @ 816216F
    setvar VAR_0x8006, 12
    setdynamicwarp MAP_SILPHCO_9F, 255, 24, 3
    compare_var_to_value VAR_0x403A, 12
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 12
    goto EventScript_1621E7

EventScript_162196:: @ 8162196
    end

EventScript_162197:: @ 8162197
    setvar VAR_0x8006, 13
    setdynamicwarp MAP_SILPHCO_10F, 255, 13, 3
    compare_var_to_value VAR_0x403A, 13
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 13
    goto EventScript_1621E7

EventScript_1621BE:: @ 81621BE
    end

EventScript_1621BF:: @ 81621BF
    setvar VAR_0x8006, 14
    setdynamicwarp MAP_SILPHCO_11F, 255, 13, 3
    compare_var_to_value VAR_0x403A, 14
    goto_if 1, EventScript_1621E7
    call EventScript_1621EC
    setvar VAR_0x403A, 14
    goto EventScript_1621E7

EventScript_1621E6:: @ 81621E6
    end

EventScript_1621E7:: @ 81621E7
    special sub_80CB63C
    releaseall
    end

EventScript_1621EC:: @ 81621EC
    special sub_80CB63C
    closemessage
    waitse
    special sub_80CB498
    waitstate
    setflag FLAG_0x002
    return
