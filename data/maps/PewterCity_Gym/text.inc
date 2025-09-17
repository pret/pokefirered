PewterCity_Gym_Text_BrockNoEsta::
.string "Lo siento, pero {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY} no está en el\n"
.string "{SHADOW DYNAMIC_COLOR4}GIMNASIO{SHADOW LIGHT_GRAY} en este momento. \p"
.string "Está dando una charla en el\n"
.string "{SHADOW DYNAMIC_COLOR4}MUSEO DE CIENCIA{SHADOW LIGHT_GRAY}.\p"
.string "No puedes desafiarlo hasta que\n"
.string "regrese.$"

PewterCity_Gym_Text_BrockIntro::
    .string "¡Hola! Me alegra que hayas llegado\n"
    .string "hasta aquí.\p"
    .string "Perdona la espera.\n"
    .string "Gracias por venir a desafiarme.\p"
    .string "Entreno {SHADOW DYNAMIC_COLOR4}POKÉMON{SHADOW LIGHT_GRAY} de tipo {SHADOW DYNAMIC_COLOR4}ROCA{SHADOW LIGHT_GRAY},\n"
    .string "fuertes y resistentes como tierra.\p"
    .string "¡Quiero ver de lo que eres capaz,\n"
    .string "así que hagamos un gran combate!{PLAY_BGM}{MUS_ENCOUNTER_GYM_LEADER}$"




@ NOTE: This defeat text actually causes a buffer overflow. It's too long for the gDisplayedStringBattle
@ buffer that it's put into, and it stomps all over the gBattleTextBuffs after, as well as the otherwise
@ unused array after that, sFlickerArray. Perhaps that's the reason why said array exists.
PewterCity_Gym_Text_BrockDefeat::
    .string "EN ESTA OCASIÓN TÚ HAS SIDO\n"
    .string "MÁS FUERTE...$"

PewterCity_Gym_Text_TakeThisWithYou::
    .string "Mi defensa no resistió los ataques de\n"
    .string "tus {SHADOW DYNAMIC_COLOR4}POKéMON{SHADOW LIGHT_GRAY}.\p"
    .string "Eres incluso más fuerte de lo que\n"
    .string "imaginaba.\p"
    .string "Toma, acepta esta medalla.$"

PewterCity_Gym_Text_BrockDefeatedTakeBadge::
    .string "{COLOR DARK_GRAY}{SHADOW DYNAMIC_COLOR4}{PLAYER}{SHADOW LIGHT_GRAY} recibió {SHADOW DYNAMIC_COLOR4}MEDALLA ROCA{SHADOW LIGHT_GRAY}\n"
    .string "de manos de {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY}.$"

PewterCity_Gym_Text_ExplainTM39::
    .string "Gracias, {SHADOW DYNAMIC_COLOR4}{PLAYER}{SHADOW LIGHT_GRAY}.\n"
    .string "¡Ha sido un gran combate!\p"
    .string "Como muestra de aprecio, quiero\n"
    .string "darte el movimiento {SHADOW DYNAMIC_COLOR4}TUMBA ROCAS{SHADOW LIGHT_GRAY}.\p"
    .string "Lanzando rocas reduce la velocidad\n"
    .string "del rival.$"

PewterCity_Gym_Text_BrockDefeatedTakeMT::
    .string "{COLOR DARK_GRAY}{SHADOW DYNAMIC_COLOR4}{PLAYER}{SHADOW LIGHT_GRAY} recibió {SHADOW DYNAMIC_COLOR4}MT39{SHADOW LIGHT_GRAY}\n"
    .string "de manos de {SHADOW DYNAMIC_COLOR4}BROCK{SHADOW LIGHT_GRAY}.$"

PewterCity_Gym_Text_BrockPostBattle::
    .string "El mundo es enorme...\p"
    .string "Encontrarás muchos {SHADOW DYNAMIC_COLOR4}ENTRENADORES{SHADOW LIGHT_GRAY}\n"
    .string "tan fuertes como tú.\p"
    .string "Espera y verás...\p"
    .string "Yo también seguiré haciéndome\n"
    .string "más fuerte.$"

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
    .string "luchar te sorprenderá con sus\l"
    .string "ataques de {SHADOW DYNAMIC_COLOR4}TIPO ROCA{SHADOW LIGHT_GRAY}!\p"
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

