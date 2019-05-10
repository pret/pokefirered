SSAnne_1F_Room11_MapScripts:: @ 8164559
    map_script 3, SSAnne_1F_Room11_MapScript1_16455F
    .byte 0

SSAnne_1F_Room11_MapScript1_16455F:: @ 816455F
    setworldmapflag 2237
    getplayerxy VAR_0x4001, VAR_0x4002
    compare_var_to_value VAR_0x4001, 50
    call_if 4, EventScript_16457E
    compare_var_to_value VAR_0x4001, 49
    call_if 3, EventScript_164587
    end

EventScript_16457E:: @ 816457E
    setescapewarp MAP_SIX_ISLAND_GREENPATH, 255, 64, 10
    return

EventScript_164587:: @ 8164587
    setescapewarp MAP_SIX_ISLAND_GREENPATH, 255, 45, 10
    return

SSAnne_1F_Room11_EventScript_164590:: @ 8164590
    trainerbattle 0, 609, 0, Text_17BF3A, Text_17BF66
    loadword 0, gUnknown_817BF97
    callstd 6
    end

SSAnne_1F_Room11_EventScript_1645A7:: @ 81645A7
    trainerbattle 0, 610, 0, Text_17BFEB, Text_17C028
    loadword 0, gUnknown_817C056
    callstd 6
    end

SSAnne_1F_Room11_EventScript_1645BE:: @ 81645BE
    trainerbattle 0, 611, 0, Text_17C0BE, Text_17C0F2
    loadword 0, gUnknown_817C113
    callstd 6
    end

SSAnne_1F_Room11_EventScript_1645D5:: @ 81645D5
    trainerbattle 0, 612, 0, Text_17C155, Text_17C196
    loadword 0, gUnknown_817C1D0
    callstd 6
    end

SSAnne_1F_Room11_EventScript_1645EC:: @ 81645EC
    trainerbattle 0, 613, 0, Text_17C246, Text_17C275
    loadword 0, gUnknown_817C2A4
    callstd 6
    end

SSAnne_1F_Room11_EventScript_164603:: @ 8164603
    trainerbattle 0, 614, 0, Text_17C2D9, Text_17C30D
    loadword 0, gUnknown_817C31C
    callstd 6
    end

SSAnne_1F_Room11_EventScript_16461A:: @ 816461A
    trainerbattle 0, 615, 0, Text_17C373, Text_17C3A5
    loadword 0, gUnknown_817C3CE
    callstd 6
    end

SSAnne_1F_Room11_EventScript_164631:: @ 8164631
    trainerbattle 0, 616, 0, Text_17C42B, Text_17C458
    loadword 0, gUnknown_817C490
    callstd 6
    end

SSAnne_1F_Room11_EventScript_164648:: @ 8164648
    trainerbattle 0, 617, 0, Text_17C4FE, Text_17C552
    loadword 0, gUnknown_817C590
    callstd 6
    end

SSAnne_1F_Room11_EventScript_16465F:: @ 816465F
    trainerbattle 0, 618, 0, Text_17C5DB, Text_17C609
    loadword 0, gUnknown_817C615
    callstd 6
    end

SSAnne_1F_Room11_EventScript_164676:: @ 8164676
    trainerbattle 0, 619, 0, Text_17C63E, Text_17C660
    loadword 0, gUnknown_817C68E
    callstd 6
    end

SSAnne_1F_Room11_EventScript_16468D:: @ 816468D
    trainerbattle 0, 620, 0, Text_17C6C9, Text_17C6FB
    loadword 0, gUnknown_817C728
    callstd 6
    end
