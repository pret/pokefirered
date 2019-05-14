UnknownMap_00_04_MapScripts:: @ 816047C
    map_script 5, UnknownMap_00_04_MapScript1_160487
    map_script 3, UnknownMap_00_04_MapScript2_1604BB
    .byte 0

UnknownMap_00_04_MapScript1_160487:: @ 8160487
    setflag FLAG_0x063
    setflag FLAG_0x064
    setflag FLAG_0x065
    setflag FLAG_0x066
    setflag FLAG_0x067
    setflag FLAG_0x068
    setflag FLAG_0x069
    setflag FLAG_0x06A
    removeobject 9
    removeobject 8
    removeobject 7
    removeobject 2
    removeobject 6
    removeobject 5
    removeobject 4
    removeobject 3
    special UnionRoomSpecial
    end

UnknownMap_00_04_MapScript2_1604BB:: @ 81604BB
    end

UnknownMap_00_04_EventScript_1604BC:: @ 81604BC
    lock
    faceplayer
    setvar VAR_RESULT, 1
    waitstate
    release
    end

UnknownMap_00_04_EventScript_1604C6:: @ 81604C6
    lock
    faceplayer
    setvar VAR_RESULT, 2
    waitstate
    release
    end

UnknownMap_00_04_EventScript_1604D0:: @ 81604D0
    lock
    faceplayer
    setvar VAR_RESULT, 3
    waitstate
    release
    end

UnknownMap_00_04_EventScript_1604DA:: @ 81604DA
    lock
    faceplayer
    setvar VAR_RESULT, 4
    waitstate
    release
    end

UnknownMap_00_04_EventScript_1604E4:: @ 81604E4
    lock
    faceplayer
    setvar VAR_RESULT, 5
    waitstate
    release
    end

UnknownMap_00_04_EventScript_1604EE:: @ 81604EE
    lock
    faceplayer
    setvar VAR_RESULT, 6
    waitstate
    release
    end

UnknownMap_00_04_EventScript_1604F8:: @ 81604F8
    lock
    faceplayer
    setvar VAR_RESULT, 7
    waitstate
    release
    end

UnknownMap_00_04_EventScript_160502:: @ 8160502
    lock
    faceplayer
    setvar VAR_RESULT, 8
    waitstate
    release
    end

UnknownMap_00_04_EventScript_16050C:: @ 816050C
    lock
    faceplayer
    setvar VAR_RESULT, 9
    waitstate
    release
    end

UnknownMap_00_04_EventScript_160516:: @ 8160516
    lockall
    setvar VAR_RESULT, 10
    waitstate
    releaseall
    end
