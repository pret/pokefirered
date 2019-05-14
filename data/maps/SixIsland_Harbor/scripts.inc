SixIsland_Harbor_MapScripts:: @ 8171E47
    .byte 0

SixIsland_Harbor_EventScript_171E48:: @ 8171E48
    lock
    faceplayer
    message Text_181726
    waitmessage
    setvar VAR_0x8004, 6
    goto EventScript_1A900F
    end
