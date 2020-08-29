EventScript_RemoveStaticMon:: @ 81A922D
    fadescreen FADE_TO_BLACK
    removeobject VAR_LAST_TALKED
    fadescreen FADE_FROM_BLACK
    release
    end

EventScript_MonFlewAway:: @ 81A9236
    fadescreen FADE_TO_BLACK
    removeobject VAR_LAST_TALKED
    fadescreen FADE_FROM_BLACK
    getspeciesname 0, VAR_0x8004
    msgbox Text_MonFlewAway
    release
    end

EventScript_AwakenSnorlax:: @ 81A924B
    message Text_PlayedPokeFlute
    waitmessage
    playfanfare MUS_POKE_FLUTE
    waitfanfare
    msgbox Text_SnorlaxWokeUp
    return
