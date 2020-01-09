EventScript_1A922D:: @ 81A922D
    fadescreen 1
    removeobject VAR_LAST_TALKED
    fadescreen 0
    release
    end

EventScript_1A9236:: @ 81A9236
    fadescreen 1
    removeobject VAR_LAST_TALKED
    fadescreen 0
    getspeciesname 0, VAR_0x8004
    msgbox Text_1A63C4
    release
    end

EventScript_1A924B:: @ 81A924B
    message Text_1853E8
    waitmessage
    playfanfare MUS_POKEFUE
    waitfanfare
    msgbox Text_185354
    return
