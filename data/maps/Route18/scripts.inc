Route18_MapScripts:: @ 81681F6
    map_script 3, Route18_MapScript1_168201
    map_script 4, Route18_MapScript2_168211
    .byte 0

Route18_MapScript1_168201:: @ 8168201
    compare_var_to_value VAR_0x405E, 1
    call_if 1, EventScript_16820D
    end

EventScript_16820D:: @ 816820D
    setflag 2096
    return

Route18_MapScript2_168211:: @ 8168211
    map_script_2 VAR_0x405E, 1, EventScript_16821B
    .2byte 0

EventScript_16821B:: @ 816821B
    special sub_80CA630
    end

Route18_EventScript_16821F:: @ 816821F
    loadword 0, gUnknown_8187757
    callstd 3
    end

Route18_EventScript_168228:: @ 8168228
    loadword 0, gUnknown_818777C
    callstd 3
    end
