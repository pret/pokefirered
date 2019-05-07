FiveIsland_WaterLabyrinth_MapScripts:: @ 816884D
    .byte 0

FiveIsland_WaterLabyrinth_EventScript_16884E:: @ 816884E
    special sub_8110AB4
    compare_var_to_value VAR_RESULT, 2
    goto_if 1, EventScript_1A7AE0
    special sub_8112364
    lock
    faceplayer
    checkflag FLAG_0x2DA
    goto_if 1, EventScript_1688E3
    checkflag FLAG_0x2DB
    goto_if 1, EventScript_16892C
    loadword 0, gUnknown_818A80D
    callstd 4
    specialvar VAR_RESULT, sub_80CA76C
    compare_var_to_value VAR_RESULT, 6
    goto_if 1, EventScript_1688AC
    loadword 0, gUnknown_818A88F
    callstd 4
    release
    end

EventScript_168895:: @ 8168895
    setvar VAR_0x8004, 1
    setvar VAR_0x8005, 2
    special SetFlavorTextFlagFromSpecialVars
    loadword 0, gUnknown_818AA0C
    callstd 4
    release
    end

EventScript_1688AC:: @ 81688AC
    loadword 0, gUnknown_818A8A6
    callstd 4
    goto EventScript_1688BA
    end

EventScript_1688BA:: @ 81688BA
    countpokemon
    compare_var_to_value VAR_RESULT, 6
    goto_if 1, EventScript_16891F
    setflag FLAG_0x2DA
    giveegg SPECIES_TOGEPI
    textcolor 3
    playfanfare MUS_FANFA1
    message Text_18A91F
    waitfanfare
    waitmessage
    call EventScript_1A6675
    goto EventScript_1688E3
    end

EventScript_1688E3:: @ 81688E3
    getspeciesname 1, SPECIES_TOGEPI
    setvar VAR_0x8004, 175
    specialvar VAR_RESULT, sub_80CD0F4
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_168895
    getspeciesname 1, SPECIES_TOGETIC
    setvar VAR_0x8004, 176
    specialvar VAR_RESULT, sub_80CD0F4
    compare_var_to_value VAR_RESULT, 1
    goto_if 1, EventScript_168895
    loadword 0, gUnknown_818A9C0
    callstd 4
    release
    end

EventScript_16891F:: @ 816891F
    setflag FLAG_0x2DB
    loadword 0, gUnknown_818A940
    callstd 4
    release
    end

EventScript_16892C:: @ 816892C
    goto EventScript_1688BA
    end
