PewterCity_Gym_Text_BrockNoEsta::
.string "{COLOR DARK_GRAY}Lo siento, pero {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY} no está en el\n"
.string "gimnasio en este momento. \p"
.string "Está dando una charla en el\n"
.string "{SHADOW DYNAMIC_COLOR4}MUSEO DE CIENCIA{SHADOW LIGHT_GRAY}.\p"
.string "No puedes desafiarlo hasta que\n"
.string "regrese.$"

PewterCity_Gym_Text_BrockIntro::
.string "{COLOR DARK_GRAY}{SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY}: Ah, ¡has venido al fin!\p"
.string "Lamento haberte hecho esperar.\n"
.string "Pero ahora que estoy aquí...\p"
.string "Soy {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY}, el líder de este\n"
.string "gimnasio.\p"
.string "Soy un experto en {SHADOW DYNAMIC_COLOR4}POKÉMON{SHADOW LIGHT_GRAY} tipo {SHADOW DYNAMIC_COLOR4}ROCA{SHADOW LIGHT_GRAY},\n"
.string "aunque puede que aún te sorprenda.\p"
.string "¡Veamos si tienes lo necesario para\n"
.string "derrotarme!{PLAY_BGM}{MUS_ENCOUNTER_GYM_LEADER}$"




@ NOTE: This defeat text actually causes a buffer overflow. It's too long for the gDisplayedStringBattle
@ buffer that it's put into, and it stomps all over the gBattleTextBuffs after, as well as the otherwise
@ unused array after that, sFlickerArray. Perhaps that's the reason why said array exists.
PewterCity_Gym_Text_BrockDefeat::
.string "TE SUBESTIMÉ...\p"
.string "PERO LO LOGRASTE, ASÍ QUE AQUÍ TIENES\n"
.string "LA {SHADOW LIGHT_RED}MEDALLA ROCA{SHADOW GREEN}.\p"
.string "{FONT_NORMAL}{SHADOW LIGHT_RED}{PLAYER}{SHADOW GREEN} RECIBIÓ LA {SHADOW LIGHT_RED}MEDALLA ROCA{SHADOW GREEN}.{PAUSE_MUSIC}{PLAY_BGM}{MUS_OBTAIN_BADGE}{PAUSE 0xFE}{PAUSE 0x56}{RESUME_MUSIC}\p"
.string "ES UNA MEDALLA OFICIAL DE LA LIGA\n"
.string "POKÉMON.\p"
.string "¡HARÁ QUE TUS POKÉMON SEAN MÁS FUERTES!\n"
.string "ADEMÁS, AHORA PODRÁS USAR DESTELLO\l"
.string "CUANDO QUIERAS.$"

PewterCity_Gym_Text_TakeThisWithYou::
    .string "{COLOR DARK_GRAY}¡Espera!\n"
    .string "Toma esto, te puede servir...$"

PewterCity_Gym_Text_ReceivedTM39FromBrock::
    .string "{COLOR DARK_GRAY}{SHADOW DYNAMIC_COLOR4}{PLAYER}{SHADOW LIGHT_GRAY} recibió {SHADOW DYNAMIC_COLOR4}TM39{SHADOW LIGHT_GRAY}\n"
    .string "de manos de {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY}.$"

PewterCity_Gym_Text_ExplainTM39::
    .string "{COLOR DARK_GRAY}Una {SHADOW DYNAMIC_COLOR4}MT{SHADOW LIGHT_GRAY} (Máquina Técnica) contiene\n"
    .string "una técnica para {SHADOW DYNAMIC_COLOR4}POKéMON{SHADOW LIGHT_GRAY}.\p"

    .string "Usar una {SHADOW DYNAMIC_COLOR4}MT{SHADOW LIGHT_GRAY} enseña el movimiento\n"
    .string "que contiene a un {SHADOW DYNAMIC_COLOR4}POKéMON{SHADOW LIGHT_GRAY}.\p"

    .string "Las {SHADOW DYNAMIC_COLOR4}MT{SHADOW LIGHT_GRAY} solo pueden usarse una vez.\l"
    .string "Así que, cuando uses una, elige\n"
    .string "con cuidado al {SHADOW DYNAMIC_COLOR4}POKéMON{SHADOW LIGHT_GRAY}.\p"

    .string "De todos modos...\n"
    .string "La {SHADOW DYNAMIC_COLOR4}MT39{SHADOW LIGHT_GRAY} contiene {SHADOW DYNAMIC_COLOR4}TUMBA ROCAS{SHADOW LIGHT_GRAY}.\p"
    .string "Lanza rocas al rival y\n"
    .string "reduce su {SHADOW DYNAMIC_COLOR4}VELOCIDAD{SHADOW LIGHT_GRAY}.$"

PewterCity_Gym_Text_BrockPostBattle::
    .string "{COLOR DARK_GRAY}¡En el mundo hay todo tipo de\n"
    .string "{SHADOW DYNAMIC_COLOR4}ENTRENADORES{SHADOW LIGHT_GRAY}!\p"
    .string "¡Parece que eres muy buena\n"
    .string "entrenando {SHADOW DYNAMIC_COLOR4}POKÉMON{SHADOW LIGHT_GRAY}!\p"
    .string "¡Ve al {SHADOW DYNAMIC_COLOR4}GIMNASIO{SHADOW LIGHT_GRAY} de {SHADOW DYNAMIC_COLOR4}CELESTE{SHADOW LIGHT_GRAY} y\n"
    .string "pon a prueba tus habilidades!$"

PewterCity_Gym_Text_DontHaveRoomForThis::
    .string "You don't have room for this.$"

PewterCity_Gym_Text_LiamIntro::
    .string "{COLOR DARK_GRAY}¡Alto ahí, principiante!\p"
    .string "¡Todavía te faltan años luz para\n"
    .string "poder desafiar a {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY}!$"

PewterCity_Gym_Text_LiamDefeat::
    .string "¡QUÉ SORPRESA!\p"
    .string "¡LOS AÑOS LUZ NO SON TIEMPO,\n"
    .string "MIDEN LA DISTANCIA!$"

PewterCity_Gym_Text_LiamPostBattle::
    .string "{COLOR DARK_GRAY}¡Eres bastante fuerte, pero aún no\n"
    .string "estás al nivel de {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY}!$"

PewterCity_Gym_Text_GustavoIntro::
    .string "{COLOR DARK_GRAY}¡He estado entrenando duro en las\n"
    .string "montañas!\p"
    .string "¿Te atreves a desafiarme?$"

PewterCity_Gym_Text_GustavoDefeat::
    .string "PARECE QUE TENDRÉ QUE VOLVER A\n"
    .string "ENTRENAR MÁS DURO.$"

PewterCity_Gym_Text_GustavoPostBattle::
.string "{COLOR DARK_GRAY}¡{SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY} también es duro, pero seguro\n"
.string "puedes con él!$"



PewterCity_Gym_Text_LetMeTakeYouToTheTop::
    .string "¡Puedo decirte lo que se necesita\n"
    .string "para ser un {SHADOW DYNAMIC_COLOR4}CAMPEÓN POKéMON{SHADOW LIGHT_GRAY}!\p"
    .string "¡No soy {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY}, pero puedo\n"
    .string "enseñarte cómo ganar!\p"
    .string "¡Déjame guiarte hacia la victoria!$"

PewterCity_Gym_Text_LetsGetHappening::
    .string "¡Muy bien!\n"
    .string "¡Vamos allá!$"

PewterCity_Gym_Text_TryDifferentPartyOrders::
    .string "¡El último {SHADOW DYNAMIC_COLOR4}POKéMON{SHADOW LIGHT_GRAY} que enviaré a\n"
    .string "luchar te sorprenderá con sus ataques\l"
    .string "de {SHADOW DYNAMIC_COLOR4}TIPO VOLADOR{SHADOW LIGHT_GRAY}!\p"
    .string "Cambiar el orden de tus {SHADOW DYNAMIC_COLOR4}POKéMON{SHADOW LIGHT_GRAY}\n"
    .string "podría facilitarte las cosas\l"
    .string "durante el combate.$"

PewterCity_Gym_Text_ItsFreeLetsGetHappening::
    .string "¡Es gratis!\n"
    .string "¡Vamos, anímate!$"

PewterCity_Gym_Text_YoureChampMaterial::
    .string "¡Lo sabía!\n"
    .string "¡Tienes talento!$"

PewterCity_Gym_Text_GymStatue::
    .string "{SHADOW DYNAMIC_COLOR4}LÍDER del GIMNASIO POKéMON\n"
    .string "de PLATEADA{SHADOW LIGHT_GRAY}: BROCK\p"
    .string "{SHADOW DYNAMIC_COLOR4}ENTRENADOR GANADOR{SHADOW LIGHT_GRAY}:\n"
    .string "{RIVAL}$"

PewterCity_Gym_Text_GymStatuePlayerWon::
    .string "{SHADOW DYNAMIC_COLOR4}LÍDER del GIMNASIO POKéMON\n"
    .string "de PLATEADA{SHADOW LIGHT_GRAY}: BROCK\p"
    .string "{SHADOW DYNAMIC_COLOR4}ENTRENADORES GANADORES{SHADOW LIGHT_GRAY}\n"
    .string "{RIVAL} y {PLAYER}$"

