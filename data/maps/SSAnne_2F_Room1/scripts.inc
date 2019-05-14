SSAnne_2F_Room1_MapScripts:: @ 8160C96
    .byte 0

SSAnne_2F_Room1_EventScript_160C97:: @ 8160C97
    lock
    faceplayer
    message Text_173CE3
    waitmessage
    setvar VAR_0x8004, 143
    special sub_80CBDCC
    drawmonpic SPECIES_SNORLAX, 10, 3
    waitbuttonpress
    erasemonpic
    release
    end
