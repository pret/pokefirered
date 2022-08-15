EventScript_RemoveStaticMon::
    fadescreen FADE_TO_BLACK
    removeobject VAR_LAST_TALKED
    fadescreen FADE_FROM_BLACK
    release
    end

EventScript_MonFlewAway::
    fadescreen FADE_TO_BLACK
    removeobject VAR_LAST_TALKED
    fadescreen FADE_FROM_BLACK
    bufferspeciesname STR_VAR_1, VAR_0x8004
    msgbox Text_MonFlewAway
    release
    end

EventScript_AwakenSnorlax::
    message Text_PlayedPokeFlute
    waitmessage
    playfanfare MUS_POKE_FLUTE
    waitfanfare
    msgbox Text_SnorlaxWokeUp
    return
