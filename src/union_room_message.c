#include "global.h"
#include "link_rfu.h"
#include "mystery_gift_server.h"
#include "mystery_gift_client.h"
#include "constants/union_room.h"

ALIGNED(4) const u8 gText_UR_EmptyString[] = _("");
ALIGNED(4) const u8 gText_UR_Colon[] = _(":");
ALIGNED(4) const u8 gText_UR_ID[] = _("{ID}");
ALIGNED(4) const u8 gText_UR_PleaseStartOver[] = _("Hay que empezar de nuevo.");
ALIGNED(4) const u8 gText_UR_WirelessSearchCanceled[] = _("Se ha cancelado la COMUNICACIÓN\nINALÁMBRICA.");
ALIGNED(4) static const u8 sText_AwaitingCommunucation2[] = _("ともだちからの れんらくを\nまっています");
ALIGNED(4) const u8 gText_UR_AwaitingCommunication[] = _("Para la opción {SHADOW DYNAMIC_COLOR4}{STR_VAR_1}{SHADOW LIGHT_GRAY},\nfaltan jugadores por comunicarse.");
ALIGNED(4) const u8 gText_UR_AwaitingLinkPressStart[] = _("Para la opción {SHADOW DYNAMIC_COLOR4}{STR_VAR_1}{SHADOW LIGHT_GRAY},\npulsa START cuando estéis listos.");

ALIGNED(4) static const u8 sText_SingleBattle[] = _("シングルバトルを かいさいする");
ALIGNED(4) static const u8 sText_DoubleBattle[] = _("ダブルバトルを かいさいする");
ALIGNED(4) static const u8 sText_MultiBattle[] = _("マルチバトルを かいさいする");
ALIGNED(4) static const u8 sText_TradePokemon[] = _("ポケモンこうかんを かいさいする");
ALIGNED(4) static const u8 sText_Chat[] = _("チャットを かいさいする");
ALIGNED(4) static const u8 sText_DistWonderCard[] = _("ふしぎなカードをくばる");
ALIGNED(4) static const u8 sText_DistWonderNews[] = _("ふしぎなニュースをくばる");
ALIGNED(4) static const u8 sText_DistMysteryEvent[] = _("ふしぎなできごとを かいさいする");
ALIGNED(4) static const u8 sText_HoldPokemonJump[] = _("なわとびを かいさいする");
ALIGNED(4) static const u8 sText_HoldBerryCrush[] = _("きのみマッシャーを かいさいする");
ALIGNED(4) static const u8 sText_HoldBerryPicking[] = _("きのみどりを かいさいする");
ALIGNED(4) static const u8 sText_HoldSpinTrade[] = _("ぐるぐるこうかんを かいさいする");
ALIGNED(4) static const u8 sText_HoldSpinShop[] = _("ぐるぐるショップを かいさいする");

// Unused
static const u8 *const sLinkGroupActionTexts[] = {
    sText_SingleBattle,
    sText_DoubleBattle,
    sText_MultiBattle,
    sText_TradePokemon,
    sText_Chat,
    sText_DistWonderCard,
    sText_DistWonderNews,
    sText_DistWonderCard,
    sText_HoldPokemonJump,
    sText_HoldBerryCrush,
    sText_HoldBerryPicking,
    sText_HoldBerryPicking,
    sText_HoldSpinTrade,
    sText_HoldSpinShop
};

static const u8 sText_1PlayerNeeded[] = _("Falta 1\njugador.");
static const u8 sText_2PlayersNeeded[] = _("Faltan 2\njugad.");
static const u8 sText_3PlayersNeeded[] = _("Faltan 3\njugad.");
static const u8 sText_4PlayersNeeded[] = _("あと4にん\nひつよう");
static const u8 sText_2PlayerMode[] = _("MODO DE 2\nJUGADORES");
static const u8 sText_3PlayerMode[] = _("MODO DE 3\nJUGADORES");
static const u8 sText_4PlayerMode[] = _("MODO DE 4\nJUGADORES");
static const u8 sText_5PlayerMode[] = _("MODO DE 5\nJUGADORES");

const u8 *const gTexts_UR_PlayersNeededOrMode[][5] = {
    { // 2 players required
        sText_1PlayerNeeded,
        sText_2PlayerMode
    },
    { // 4 players required
        sText_3PlayersNeeded,
        sText_2PlayersNeeded,
        sText_1PlayerNeeded,
        sText_4PlayerMode
    },
    { // 2-5 players required
        sText_1PlayerNeeded,
        sText_2PlayerMode,
        sText_3PlayerMode,
        sText_4PlayerMode,
        sText_5PlayerMode
    },
    { // 3-5 players required
        sText_2PlayersNeeded,
        sText_1PlayerNeeded,
        sText_3PlayerMode,
        sText_4PlayerMode,
        sText_5PlayerMode
    }
};

ALIGNED(4) const u8 gText_UR_BButtonCancel[] = _("{B_BUTTON}SALIR");
ALIGNED(4) static const u8 sText_SearchingForParticipants[] = _("ため\nさんかしゃ ぼしゅうちゅう です！");
ALIGNED(4) const u8 gText_UR_PlayerContactedYouForXAccept[] = _("{SHADOW DYNAMIC_COLOR4}{STR_VAR_2}{SHADOW LIGHT_GRAY} quiere\n{SHADOW DYNAMIC_COLOR4}{STR_VAR_1}{SHADOW LIGHT_GRAY}. ¿Aceptas?");
ALIGNED(4) const u8 gText_UR_PlayerContactedYouShareX[] = _("{SHADOW DYNAMIC_COLOR4}{STR_VAR_2}{SHADOW LIGHT_GRAY} se ha conectado.\n¿Compartes {SHADOW DYNAMIC_COLOR4}{STR_VAR_1}{SHADOW LIGHT_GRAY}?");
ALIGNED(4) const u8 gText_UR_PlayerContactedYouAddToMembers[] = _("{STR_VAR_2} se ha conectado.\n¿Añadir al grupo?");
ALIGNED(4) const u8 gText_UR_AreTheseMembersOK[] = _("¿Está bien este grupo\npara {STR_VAR_1}?");
ALIGNED(4) const u8 gText_UR_CancelModeWithTheseMembers[] = _("¿Cancelas {STR_VAR_1}\npara este grupo?");
ALIGNED(4) const u8 gText_UR_AnOKWasSentToPlayer[] = _("Se ha enviado el “OK”\na {STR_VAR_1}.");

ALIGNED(4) static const u8 sText_OtherTrainerUnavailableNow[] = _("Parece que el otro {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} no\nestá disponible en este momento...\p");
ALIGNED(4) static const u8 sText_CantTransmitTrainerTooFar[] = _("No puedes comunicarte con nadie\nque esté muy lejos.\p");
ALIGNED(4) static const u8 sText_TrainersNotReadyYet[] = _("Hay ENTRENADORES que no están\nlistos todavía.\p");

const u8 *const gTexts_UR_CantTransmitToTrainer[] = {
    sText_CantTransmitTrainerTooFar,
    sText_TrainersNotReadyYet
};

ALIGNED(4) const u8 gText_UR_ModeWithTheseMembersWillBeCanceled[] = _("Se cancelará {STR_VAR_1}\npara este grupo.{PAUSE 90}");
ALIGNED(4) static const u8 sText_MemberNoLongerAvailable[] = _("Hay un miembro del grupo que\nno puede seguir disponible.\p");

const u8 *const gTexts_UR_PlayerUnavailable[] = {
    sText_OtherTrainerUnavailableNow,
    sText_MemberNoLongerAvailable
};

ALIGNED(4) static const u8 sText_TrainerAppearsUnavailable[] = _("No parece que el otro {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \nesté disponible...\p");
ALIGNED(4) const u8 gText_UR_PlayerSentBackOK[] = _("¡{STR_VAR_1} envió\ntambién un “OK”!");
ALIGNED(4) const u8 gText_UR_PlayerOKdRegistration[] = _("{STR_VAR_1} te ha\nadmitido en el grupo.");
ALIGNED(4) static const u8 sText_PlayerRepliedNo[] = _("{STR_VAR_1} responde\ncon un “No”...\p");
ALIGNED(4) const u8 gText_UR_AwaitingOtherMembers[] = _("Para la opción {STR_VAR_1},\nfaltan jugadores.");
ALIGNED(4) const u8 gText_UR_QuitBeingMember[] = _("¿Te sales del grupo?");
ALIGNED(4) static const u8 sText_StoppedBeingMember[] = _("Ya no eres del grupo.\p");

const u8 *const gTexts_UR_PlayerDisconnected[] = {
    [RFU_STATUS_OK]                  = NULL,
    [RFU_STATUS_FATAL_ERROR]         = sText_MemberNoLongerAvailable,
    [RFU_STATUS_CONNECTION_ERROR]    = sText_TrainerAppearsUnavailable,
    [RFU_STATUS_CHILD_SEND_COMPLETE] = NULL,
    [RFU_STATUS_NEW_CHILD_DETECTED]  = NULL,
    [RFU_STATUS_JOIN_GROUP_OK]       = NULL,
    [RFU_STATUS_JOIN_GROUP_NO]       = sText_PlayerRepliedNo,
    [RFU_STATUS_WAIT_ACK_JOIN_GROUP] = NULL,
    [RFU_STATUS_LEAVE_GROUP_NOTICE]  = NULL,
    [RFU_STATUS_LEAVE_GROUP]         = sText_StoppedBeingMember
};

ALIGNED(4) const u8 gText_UR_WirelessLinkEstablished[] = _("Se ha establecido la COMUNICACIÓN\nINALÁMBRICA.");
ALIGNED(4) const u8 gText_UR_WirelessLinkDropped[] = _("Se ha cortado la COMUNICACIÓN\nINALÁMBRICA.");
ALIGNED(4) const u8 gText_UR_LinkWithFriendDropped[] = _("Se ha perdido la comunicación\ncon tu amigo...");
ALIGNED(4) static const u8 sText_PlayerRepliedNo2[] = _("{STR_VAR_1} contesta\nque “No”...");

const u8 *const gTexts_UR_LinkDropped[] = {
    [RFU_STATUS_OK]                  = NULL,
    [RFU_STATUS_FATAL_ERROR]         = gText_UR_LinkWithFriendDropped,
    [RFU_STATUS_CONNECTION_ERROR]    = gText_UR_LinkWithFriendDropped,
    [RFU_STATUS_CHILD_SEND_COMPLETE] = NULL,
    [RFU_STATUS_NEW_CHILD_DETECTED]  = NULL,
    [RFU_STATUS_JOIN_GROUP_OK]       = NULL,
    [RFU_STATUS_JOIN_GROUP_NO]       = sText_PlayerRepliedNo2,
    [RFU_STATUS_WAIT_ACK_JOIN_GROUP] = NULL,
    [RFU_STATUS_LEAVE_GROUP_NOTICE]  = NULL,
    [RFU_STATUS_LEAVE_GROUP]         = NULL
};

ALIGNED(4) static const u8 sText_DoYouWantXMode[] = _("¿Eliges {STR_VAR_2}?");
ALIGNED(4) static const u8 sText_DoYouWantXMode2[] = _("¿Eliges {STR_VAR_2}?");

// Unused
static const u8 *const sDoYouWantModeTexts[] = {
    sText_DoYouWantXMode,
    sText_DoYouWantXMode2
};

ALIGNED(4) static const u8 sText_CommunicatingPleaseWait[] = _("はなしかけています…\nしょうしょう おまちください"); // Unused
ALIGNED(4) const u8 gText_UR_AwaitingPlayersResponseAboutTrade[] = _("Awaiting {STR_VAR_1}'s response about\nthe trade…");

ALIGNED(4) static const u8 sText_Communicating[] = _("Comunicando{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.");
ALIGNED(4) static const u8 sText_CommunicatingWithPlayer[] = _("Comunicando con {STR_VAR_1}{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.");
ALIGNED(4) static const u8 sText_PleaseWaitAWhile[] = _("Please wait a while{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.");

const u8 *const gTexts_UR_CommunicatingWait[] = {
    sText_Communicating,
    sText_CommunicatingWithPlayer,
    sText_PleaseWaitAWhile
};

ALIGNED(4) static const u8 sText_HiDoSomethingMale[] = _("¡Hola! ¿Querias algo?");
ALIGNED(4) static const u8 sText_HiDoSomethingFemale[] = _("¿Qué tal? ¿Quieres algo?");
ALIGNED(4) static const u8 sText_HiDoSomethingAgainMale[] = _("{STR_VAR_1}: ¡Anda,\ncoincidimos de nuevo! ¿Y bien?");
ALIGNED(4) static const u8 sText_HiDoSomethingAgainFemale[] = _("{STR_VAR_1}: ¡Eh, {PLAYER}!\n¿Qué te gustaría hacer?");

const u8 *const gTexts_UR_HiDoSomething[][GENDER_COUNT] = {
    {
        sText_HiDoSomethingMale,
        sText_HiDoSomethingFemale
    }, {
        sText_HiDoSomethingAgainMale,
        sText_HiDoSomethingAgainFemale
    }
};

ALIGNED(4) static const u8 sText_DoSomethingMale[] = _("¿Quieres hacer algo?");
ALIGNED(4) static const u8 sText_DoSomethingFemale[] = _("¿Te gustaría hacer algo?");
ALIGNED(4) static const u8 sText_DoSomethingAgainMale[] = _("{STR_VAR_1}: ¿Qué\nte apetecería hacer?");
ALIGNED(4) static const u8 sText_DoSomethingAgainFemale[] = _("{STR_VAR_1}‘また なにかする？");

// Unused
static const u8 *const sDoSomethingTexts[][GENDER_COUNT] = {
    {
        sText_DoSomethingMale,
        sText_DoSomethingFemale
    }, {
        sText_DoSomethingAgainMale,
        sText_DoSomethingAgainMale // was probably supposed to be sText_DoSomethingAgainFemale
    }
};

ALIGNED(4) static const u8 sText_SomebodyHasContactedYou[] = _("Se están comunicando contigo.{PAUSE 60}");
ALIGNED(4) static const u8 sText_PlayerHasContactedYou[] = _("{STR_VAR_1} está\nen conexión contigo.{PAUSE 60}");

const u8 *const gTexts_UR_PlayerContactedYou[] = {
    sText_SomebodyHasContactedYou,
    sText_PlayerHasContactedYou
};

ALIGNED(4) static const u8 sText_AwaitingResponseFromTrainer[] = _("Esperando respuesta del otro\n{SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} ...");
ALIGNED(4) static const u8 sText_AwaitingResponseFromPlayer[] = _("Esperando respuesta de\n{STR_VAR_1}...");

const u8 *const gTexts_UR_AwaitingResponse[] = {
    sText_AwaitingResponseFromTrainer,
    sText_AwaitingResponseFromPlayer
};

ALIGNED(4) static const u8 sText_AwaitingResponseCancelBButton[] = _("あいての ていあんを まっています\nビーボタンで キャンセル");

ALIGNED(4) const u8 gText_UR_ShowTrainerCard[] = _("El otro {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY}  te ha mostrado\nsu FICHA de {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} .\p¿Quieres enseñarle la tuya?");
ALIGNED(4) const u8 gText_UR_BattleChallenge[] = _("El otro {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY}  te reta\na luchar.\p¿Aceptas el desafío?");
ALIGNED(4) const u8 gText_UR_ChatInvitation[] = _("El otro {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY}  te invita\na chatear.\p¿Te apetece chatear un rato?");
ALIGNED(4) const u8 gText_UR_OfferToTradeMon[] = _("Te proponen cambiar tu {DYNAMIC 0x01}\nde nivel {DYNAMIC 0x00}\ppor {DYNAMIC 0x03},\nde nivel {DYNAMIC 0x02}.\p¿Te parece buen trato?");
ALIGNED(4) const u8 gText_UR_OfferToTradeEgg[] = _("Hay alguien que quiere el\nHUEVO que tienes registrado.\l¿Se lo das?");
ALIGNED(4) const u8 gText_UR_ChatDropped[] = _("Se ha interrumpido el chat.\p");
ALIGNED(4) const u8 gText_UR_OfferDeclined1[] = _("Has decidido que no.\p");
ALIGNED(4) const u8 gText_UR_OfferDeclined2[] = _("Has decidido que no.\p");
ALIGNED(4) const u8 gText_UR_ChatEnded[] = _("Se ha finalizado el chat.\p");

// Unused
static const u8 *const sInvitationTexts[] = {
    gText_UR_ShowTrainerCard,
    gText_UR_BattleChallenge,
    gText_UR_ChatInvitation,
    gText_UR_OfferToTradeMon
};

ALIGNED(4) static const u8 sText_JoinChatMale[] = _("¡Eh, hola! ¡Estamos chateando!\n¿Te apuntas?");
ALIGNED(4) static const u8 sText_PlayerJoinChatMale[] = _("{STR_VAR_1}: ¡Eh, {PLAYER}!\n¡Estamos chateando!\l¿Te apuntas?");
ALIGNED(4) static const u8 sText_JoinChatFemale[] = _("¡Anda, hola! ¡Estamos chateando!\n¿Te apuntas?");
ALIGNED(4) static const u8 sText_PlayerJoinChatFemale[] = _("{STR_VAR_1}: ¡Hola, {PLAYER}!\n¡Estamos chateando!\l¿Te apuntas?");

const u8 *const gTexts_UR_JoinChat[][GENDER_COUNT] = {
    {
        sText_JoinChatMale,
        sText_JoinChatFemale
    }, {
        sText_PlayerJoinChatMale,
        sText_PlayerJoinChatFemale
    }
};

ALIGNED(4) const u8 gText_UR_TrainerAppearsBusy[] = _("(?)... Parece que el {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \nestá comunicando...\p");
ALIGNED(4) static const u8 sText_WaitForBattleMale[] = _("Quieres luchar, ¿eh?\nVale, pero dame un poco de tiempo.");
ALIGNED(4) static const u8 sText_WaitForChatMale[] = _("¿Quieres chatear?\nGenial, pero espera un momento.");
ALIGNED(4) static const u8 sText_ShowTrainerCardMale[] = _("¿Te gusta mi FICHA de {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} ?");
ALIGNED(4) static const u8 sText_WaitForBattleFemale[] = _("¿Un combate? ¡Hecho!\nDeja sólo que me prepare.");
ALIGNED(4) static const u8 sText_WaitForChatFemale[] = _("¿Chatear? ¡Por mí, perfecto!\nDame sólo un segundo.");
ALIGNED(4) static const u8 sText_ShowTrainerCardFemale[] = _("Mira, te dejo que veas mi FICHA\nde {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} .");

const u8 *const gTexts_UR_WaitOrShowCard[GENDER_COUNT][4] = {
    {
        sText_WaitForBattleMale,
        sText_WaitForChatMale,
        NULL,
        sText_ShowTrainerCardMale
    }, {
        sText_WaitForBattleFemale,
        sText_WaitForChatFemale,
        NULL,
        sText_ShowTrainerCardFemale
    }
};

ALIGNED(4) static const u8 sText_WaitForChatMale2[] = _("チャットだね！\nわかった ちょっと まってて！");
ALIGNED(4) static const u8 sText_DoneWaitingBattleMale[] = _("¡Gracias por esperar!\n¡Empecemos el combate!{PAUSE 60}");
ALIGNED(4) static const u8 sText_DoneWaitingChatMale[] = _("¡Bueno, a chatear se ha dicho!{PAUSE 60}");
ALIGNED(4) static const u8 sText_DoneWaitingBattleFemale[] = _("Perdona que te haya hecho\nesperar. ¡Ya estoy!{PAUSE 60}");
ALIGNED(4) static const u8 sText_DoneWaitingChatFemale[] = _("Perdona que te haya hecho\nesperar. ¡A chatear!{PAUSE 60}");
ALIGNED(4) static const u8 sText_TradeWillBeStarted[] = _("El intercambio va a comenzar.{PAUSE 60}");
ALIGNED(4) static const u8 sText_BattleWillBeStarted[] = _("El combate va a comenzar.{PAUSE 60}");
ALIGNED(4) static const u8 sText_EnteringChat[] = _("Entrando en el chat...{PAUSE 60}");

const u8 *const gTexts_UR_StartActivity[][GENDER_COUNT][3] = {
    {
        {
            sText_BattleWillBeStarted,
            sText_EnteringChat,
            sText_TradeWillBeStarted
        }, {
            sText_BattleWillBeStarted,
            sText_EnteringChat,
            sText_TradeWillBeStarted
        }
    }, {
        {
            sText_DoneWaitingBattleMale,
            sText_DoneWaitingChatMale,
            sText_TradeWillBeStarted
        }, {
            sText_DoneWaitingBattleFemale,
            sText_DoneWaitingChatFemale,
            sText_TradeWillBeStarted
        }
    }
};

ALIGNED(4) static const u8 sText_BattleDeclinedMale[] = _("Lo siento, pero mis POKéMON\nno se encuentran muy allá...\lDejémoslo para otra ocasión.\p");
ALIGNED(4) static const u8 sText_BattleDeclinedFemale[] = _("No sabes cómo lo siento, pero mis\nPOKéMON no se encuentran bien...\lYa lucharemos en otro momento.\p");


const u8 *const gTexts_UR_BattleDeclined[GENDER_COUNT] = {
    sText_BattleDeclinedMale,
    sText_BattleDeclinedFemale
};

ALIGNED(4) static const u8 sText_ShowTrainerCardDeclinedMale[] = _("¿Mmm? ¿Dónde habré puesto\nmi FICHA de {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} ?...\l¡Bueno, otra vez será!\p");
ALIGNED(4) static const u8 sText_ShowTrainerCardDeclinedFemale[] = _("Eh..., no sé dónde he metido\nmi FICHA de ENTRENADOR...\l¡Te la enseñaré en otra ocasión!\p");

const u8 *const gTexts_UR_ShowTrainerCardDeclined[GENDER_COUNT] = {
    sText_ShowTrainerCardDeclinedMale,
    sText_ShowTrainerCardDeclinedFemale
};

ALIGNED(4) static const u8 sText_IfYouWantToDoSomethingMale[] = _("Cuando quieras que hagamos algo,\n¡ya sabes dónde estoy!\p");
ALIGNED(4) static const u8 sText_IfYouWantToDoSomethingFemale[] = _("Cuando quieras que hagamos algo\nme lo dices, ¿eh?\p");

const u8 *const gTexts_UR_IfYouWantToDoSomething[GENDER_COUNT] = {
    sText_IfYouWantToDoSomethingMale,
    sText_IfYouWantToDoSomethingFemale
};

ALIGNED(4) const u8 gText_UR_TrainerBattleBusy[] = _("¡Anda, si yo tenía que hacer\nun montón de cosas!\lOtra vez será, ¡lo siento!\p");
ALIGNED(4) const u8 gText_UR_NeedTwoMonsOfLevel30OrLower1[] = _("Para luchar, necesitas dos POKéMON\nde nivel inferior a 30.\p");
ALIGNED(4) const u8 gText_UR_NeedTwoMonsOfLevel30OrLower2[] = _("Si quieres luchar, necesitas dos\nPOKéMON de nivel inferior a 30.\p");

ALIGNED(4) static const u8 sText_DeclineChatMale[] = _("Bueno, hasta la próxima.\p");
ALIGNED(4) static const u8 stext_DeclineChatFemale[] = _("Oh...\nBueno, ya nos veremos.\p");

// Response from partner when player declines chat
const u8 *const gTexts_UR_DeclineChat[GENDER_COUNT] = {
    sText_DeclineChatMale,
    stext_DeclineChatFemale
};

ALIGNED(4) static const u8 sText_ChatDeclinedMale[] = _("Lo siento, ahora mismo no me\nviene bien.\lYa chatearemos en otro momento.\p");
ALIGNED(4) static const u8 sText_ChatDeclinedFemale[] = _("Lo siento, ahora tengo mucho\nque hacer.\lYa chatearemos en otra ocasión.\p");

// Response from partner when they decline chat
const u8 *const gTexts_UR_ChatDeclined[GENDER_COUNT] = {
    sText_ChatDeclinedMale,
    sText_ChatDeclinedFemale
};

ALIGNED(4) static const u8 sText_YoureToughMale[] = _("¡Guauuu!\n¡Sí que sois fuertes!\p");
ALIGNED(4) static const u8 sText_UsedGoodMoveMale[] = _("¡Qué movimiento tan genial!\n¡Qué estrategia tan buena!\p");
ALIGNED(4) static const u8 sText_BattleSurpriseMale[] = _("¡Qué pasada!\n¡Alucinante!\p");
ALIGNED(4) static const u8 sText_SwitchedMonsMale[] = _("¿Pero cómo se puede usar a\nese POKéMON en una situación así?\p");
ALIGNED(4) static const u8 sText_YoureToughFemale[] = _("Ese POKéMON sí que está bien\nentrenado...\p");
ALIGNED(4) static const u8 sText_UsedGoodMoveFemale[] = _("¡Eso es! ¡Ése es el movimiento\nque hay que usar aquí!\p");
ALIGNED(4) static const u8 sText_BattleSurpriseFemale[] = _("¡Es impresionante!\n¿Pero cómo se puede luchar así?\p");
ALIGNED(4) static const u8 sText_SwitchedMonsFemale[] = _("¡No se puede cambiar de POKéMON\nen un momento mejor!\p");

const u8 *const gTexts_UR_BattleReaction[GENDER_COUNT][4] = {
    {
        sText_YoureToughMale,
        sText_UsedGoodMoveMale,
        sText_BattleSurpriseMale,
        sText_SwitchedMonsMale
    }, {
        sText_YoureToughFemale,
        sText_UsedGoodMoveFemale,
        sText_BattleSurpriseFemale,
        sText_SwitchedMonsFemale
    }
};

ALIGNED(4) static const u8 sText_LearnedSomethingMale[] = _("¡Hay cosas que se aprenden\ndesde pequeño!\p");
ALIGNED(4) static const u8 sText_ThatsFunnyMale[] = _("¡Parad ya, que me parto de risa\n:-O!\p");
ALIGNED(4) static const u8 sText_RandomChatMale1[] = _("Anda, qué curioso...\p");
ALIGNED(4) static const u8 sText_RandomChatMale2[] = _("Mmmm... ¿Cómo?\n¿He entendido bien?\p");
ALIGNED(4) static const u8 sText_LearnedSomethingFemale[] = _("Anda...\nNo tenía ni idea...\p");
ALIGNED(4) static const u8 sText_ThatsFunnyFemale[] = _("¿De qué va la cosa?\p");
ALIGNED(4) static const u8 sText_RandomChatFemale1[] = _("¡Eso mismo digo yo!\p");
ALIGNED(4) static const u8 sText_RandomChatFemale2[] = _("Eh...\n¡Así es!\p");

const u8 *const gTexts_UR_ChatReaction[GENDER_COUNT][4] = {
    {
        sText_LearnedSomethingMale,
        sText_ThatsFunnyMale,
        sText_RandomChatMale1,
        sText_RandomChatMale2
    }, {
        sText_LearnedSomethingFemale,
        sText_ThatsFunnyFemale,
        sText_RandomChatFemale1,
        sText_RandomChatFemale2
    }
};

ALIGNED(4) static const u8 sText_ShowedTrainerCardMale1[] = _("Mira mi FICHA de {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} .\p");
ALIGNED(4) static const u8 sText_ShowedTrainerCardMale2[] = _("Espero que nos conozcamos mejor.\p");
ALIGNED(4) static const u8 sText_ShowedTrainerCardFemale1[] = _("Está bien enseñarse las FICHAS\nde {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY}  para conocerse.\p");
ALIGNED(4) static const u8 sText_ShowedTrainerCardFemale2[] = _("Me alegro de conocerte.\n¡Espero que tú también!\p");

const u8 *const gTexts_UR_TrainerCardReaction[GENDER_COUNT][2] = {
    {
        sText_ShowedTrainerCardMale1,
        sText_ShowedTrainerCardMale2
    }, {
        sText_ShowedTrainerCardFemale1,
        sText_ShowedTrainerCardFemale2
    }
};

ALIGNED(4) static const u8 sText_MaleTraded1[] = _("¡Yuuuujuu!\n¡Siempre he querido este POKéMON!\p");
ALIGNED(4) static const u8 sText_MaleTraded2[] = _("¡Por fin! ¡Menos mal que se pueden\nconseguir POKéMON por intercambio!\p");
ALIGNED(4) static const u8 sText_FemaleTraded1[] = _("¡Estoy intercambiando POKéMON!\p");
ALIGNED(4) static const u8 sText_FemaleTraded2[] = _("¡Qué ganas de tener ese POKéMON!\p");

const u8 *const gTexts_UR_TradeReaction[GENDER_COUNT][4] = {
    {
        sText_MaleTraded1,
        sText_MaleTraded2
    }, {
        sText_FemaleTraded1,
        sText_FemaleTraded2
    }
};

const u8 gText_UR_XCheckedTradingBoard[] = _("{STR_VAR_1} echó un ojo al PANEL\nde los INTERCAMBIOS.\p");
ALIGNED(4) const u8 gText_UR_RegisterMonAtTradingBoard[] = _("Éste es el PANEL de los\nINTERCAMBIOS.\pAquí se pueden registrar POKéMON\ny ofrecerlos para intercambio.\p¿Quieres registrar a algún\nPOKéMON?");
ALIGNED(4) const u8 gText_UR_TradingBoardInfo[] = _("El PANEL de los INTERCAMBIOS\n"
                                                    "se usa para ofrecer POKéMON\l"
                                                    "para intercambio.\p"
                                                    "Lo único que hay que hacer es\n"
                                                    "registrar al POKéMON que quieras\l"
                                                    "intercambiar.\p"
                                                    "Habrá algún {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \n"
                                                    "que ofrezca otro a cambio.\p"
                                                    "Esperamos que registres a muchos\n"
                                                    "y hagas un montón de intercambios.\p"
                                                    "¿Qué, te animas?");
ALIGNED(4) static const u8 sText_ThankYouForRegistering[] = _("こうかんけいじばん の とうろくが\nかんりょう しました\pごりよう ありがとう\nございました！\p");
ALIGNED(4) static const u8 sText_NobodyHasRegistered[] = _("けいじばんに だれも ポケモンを\nとうろく していません\p\n");
ALIGNED(4) const u8 gText_UR_ChooseRequestedMonType[] = _("Elige el tipo de POKéMON que\nte gustaría recibir.\n");
ALIGNED(4) const u8 gText_UR_WhichMonWillYouOffer[] = _("¿A qué miembro de tu equipo\nPOKéMON ofreces en el intercambio?\p");
ALIGNED(4) const u8 gText_UR_RegistrationCanceled[] = _("Se ha cancelado el registro.\p");
ALIGNED(4) const u8 gText_UR_RegistraionCompleted[] = _("Se ha finalizado el registro.\p");
ALIGNED(4) const u8 gText_UR_TradeCanceled[] = _("Se ha cancelado el intercambio.\p");
ALIGNED(4) const u8 gText_UR_CancelRegistrationOfMon[] = _("¿Cancelas el registro\nde tu {STR_VAR_1} de nivel {STR_VAR_2}?");
ALIGNED(4) const u8 gText_UR_CancelRegistrationOfEgg[] = _("¿Cancelas el registro\nde tu HUEVO?");
ALIGNED(4) const u8 gText_UR_RegistrationCanceled2[] = _("Se ha cancelado el registro.\p");
ALIGNED(4) static const u8 sText_TradeTrainersWillBeListed[] = _("こうかんを きぼうしているひとを\nひょうじします");
ALIGNED(4) static const u8 sText_ChooseTrainerToTradeWith2[] = _("こうかん したい トレーナーを\nえらんで ください");
ALIGNED(4) const u8 gText_UR_AskTrainerToMakeTrade[] = _("¿Quieres preguntarle a {STR_VAR_1}\nsi quiere realizar un intercambio?");
ALIGNED(4) static const u8 sText_AwaitingResponseFromTrainer2[] = _("……\nあいての へんじを まっています");
ALIGNED(4) static const u8 sText_NotRegisteredAMonForTrade[] = _("あなたが こうかんにだす\nポケモンが とうろくされていません\p");
ALIGNED(4) const u8 gText_UR_DontHaveTypeTrainerWants[] = _("{STR_VAR_1} quiere un\nPKMN de tipo {STR_VAR_2},\ly no tienes...\p");
ALIGNED(4) const u8 gText_UR_DontHaveEggTrainerWants[] = _("{STR_VAR_1} quiere un HUEVO,\ny tú no tienes...\p");

ALIGNED(4) static const u8 sText_PlayerCantTradeForYourMon[] = _("Ahora mismo, {STR_VAR_1} no\npuede ofrecerte nada\lpor tu POKéMON.\p");
ALIGNED(4) static const u8 sText_CantTradeForPartnersMon[] = _("Ahora mismo, no puedes hacer\nningún intercambio por el\lPOKéMON de {STR_VAR_1}.\p");

// Unused
static const u8 *const sCantTradeMonTexts[] = {
    sText_PlayerCantTradeForYourMon,
    sText_CantTradeForPartnersMon
};

ALIGNED(4) const u8 gText_UR_TradeOfferRejected[] = _("Tu oferta ha sido rechazada.\p");
ALIGNED(4) const u8 gText_UR_EggTrade[] = _("INTERCAMBIO DE HUEVO");
ALIGNED(4) const u8 gText_UR_ChooseJoinCancel[] = _("{DPAD_UPDOWN}SEL.  {A_BUTTON}PARTICIPAR  {B_BUTTON}ATRÁS");
ALIGNED(4) const u8 gText_UR_ChooseTrainer[] = _("Selecciona a un {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} .");
ALIGNED(4) static const u8 sText_ChooseTrainerSingleBattle[] = _("Selecciona a un {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \npara un COMBATE INDIVIDUAL.");
ALIGNED(4) static const u8 sText_ChooseTrainerDoubleBattle[] = _("Selecciona a un {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \npara un COMBATE DOBLE.");
ALIGNED(4) static const u8 sText_ChooseLeaderMultiBattle[] = _("Selecciona al LÍDER para\nun COMBATE MÚLTIPLE.");
ALIGNED(4) static const u8 sText_ChooseTrainerToTradeWith[] = _("Selecciona a un {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \npara realizar un intercambio.");
ALIGNED(4) static const u8 sText_ChooseTrainerToShareWonderCards[] = _("Selecciona al {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY}  que\ncomparte TARJETAS MISTERIOSAS.");
ALIGNED(4) static const u8 sText_ChooseTrainerToShareWonderNews[] = _("Selecciona al {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY}  que\ncomparte NOTICIAS MISTERIOSAS.");
ALIGNED(4) static const u8 sText_ChooseLeaderPokemonJump[] = _("¡SALTO POKéMON!\nSelecciona al LÍDER.");
ALIGNED(4) static const u8 sText_ChooseLeaderBerryCrush[] = _("¡MACHACABAYAS!\nSelecciona al LÍDER.");
ALIGNED(4) static const u8 sText_ChooseLeaderBerryPicking[] = _("¡DODRIO A POR BAYAS!\nSelecciona al LÍDER.");

const u8 *const gTexts_UR_ChooseTrainer[] = {
    [LINK_GROUP_SINGLE_BATTLE] = sText_ChooseTrainerSingleBattle,
    [LINK_GROUP_DOUBLE_BATTLE] = sText_ChooseTrainerDoubleBattle,
    [LINK_GROUP_MULTI_BATTLE]  = sText_ChooseLeaderMultiBattle,
    [LINK_GROUP_TRADE]         = sText_ChooseTrainerToTradeWith,
    [LINK_GROUP_POKEMON_JUMP]  = sText_ChooseLeaderPokemonJump,
    [LINK_GROUP_BERRY_CRUSH]   = sText_ChooseLeaderBerryCrush,
    [LINK_GROUP_BERRY_PICKING] = sText_ChooseLeaderBerryPicking,
    [LINK_GROUP_WONDER_CARD]   = sText_ChooseTrainerToShareWonderCards,
    [LINK_GROUP_WONDER_NEWS]   = sText_ChooseTrainerToShareWonderNews
};

ALIGNED(4) const u8 gText_UR_SearchingForWirelessSystemWait[] = _("Buscando el sistema de\nCOMUNICACIÓN INALÁMBRICA...");
ALIGNED(4) static const u8 sText_MustHaveTwoMonsForDoubleBattle[] = _("ダブルバトルでは 2ひき いじょうの\nポケモンが ひつようです\p");
ALIGNED(4) const u8 gText_UR_AwaitingPlayersResponse[] = _("Esperando respuesta de {STR_VAR_1}...");
ALIGNED(4) const u8 gText_UR_PlayerHasBeenAskedToRegisterYouPleaseWait[] = _("Se le ha pedido a {STR_VAR_1}\nque te registre en el grupo...");
ALIGNED(4) const u8 gText_UR_AwaitingResponseFromWirelessSystem[] = _("Esperando respuesta del sistema\nde COMUNICACIÓN INALÁMBRICA...");
ALIGNED(4) static const u8 sText_PleaseWaitForOtherTrainersToGather[] = _("ほかの さんかしゃが そろうまで\nしょうしょう おまちください");

ALIGNED(4) static const u8 sText_NoCardsSharedRightNow[] = _("En este momento no parece que\nse estén compartiendo TARJETAS.");
ALIGNED(4) static const u8 sText_NoNewsSharedRightNow[] = _("En este momento no parece que\nse estén compartiendo NOTICIAS.");

const u8 *const gTexts_UR_NoWonderShared[] = {
    sText_NoCardsSharedRightNow,
    sText_NoNewsSharedRightNow
};

ALIGNED(4) const u8 gText_UR_Battle[] = _("COMBATE");
ALIGNED(4) const u8 gText_UR_Chat2[] = _("CHAT");
ALIGNED(4) const u8 gText_UR_Greetings[] = _("ENCUENTR.");
ALIGNED(4) const u8 gText_UR_Exit[] = _("SALIR");

ALIGNED(4) const u8 gText_UR_Exit2[] = _("SALIR");
ALIGNED(4) const u8 gText_UR_Info[] = _("INFO.");
ALIGNED(4) const u8 gText_UR_NameWantedOfferLv[] = _("NOMBRE{CLEAR_TO 0x3C}QUIERE{CLEAR_TO 0x6E}DA{CLEAR_TO 0xC6}NV.");

ALIGNED(4) const u8 gText_UR_SingleBattle[] = _("COMB. INDIVIDUAL");
ALIGNED(4) const u8 gText_UR_DoubleBattle[] = _("COMBATE DOBLE");
ALIGNED(4) const u8 gText_UR_MultiBattle[] = _("COMBATE MÚLTIPLE");
ALIGNED(4) const u8 gText_UR_PokemonTrades[] = _("INTERCAMBIOS PKMN");
ALIGNED(4) const u8 gText_UR_Chat[] = _("CHAT");
ALIGNED(4) const u8 gText_UR_Cards[] = _("TARJETAS");
ALIGNED(4) const u8 gText_UR_WonderCards[] = _("TARJETAS MIST.");
ALIGNED(4) const u8 gText_UR_WonderNews[] = _("NOTICIAS MIST.");
ALIGNED(4) const u8 gText_UR_PokemonJump[] = _("SALTO POKéMON");
ALIGNED(4) const u8 gText_UR_BerryCrush[] = _("MACHACABAYAS");
ALIGNED(4) const u8 gText_UR_BerryPicking[] = _("A POR BAYAS");
ALIGNED(4) const u8 gText_UR_Search[] = _("BUSCAR");
ALIGNED(4) const u8 gText_UR_SpinTrade[] = _("ぐるぐるこうかん");
ALIGNED(4) const u8 gText_UR_ItemTrade[] = _("アイテムトレード");

ALIGNED(4) static const u8 sText_ItsNormalCard[] = _("¡Es NORMAL!");
ALIGNED(4) static const u8 sText_ItsBronzeCard[] = _("¡Es de color BRONCE!");
ALIGNED(4) static const u8 sText_ItsCopperCard[] = _("¡Es de color COBRE!");
ALIGNED(4) static const u8 sText_ItsSilverCard[] = _("¡Es de color PLATA!");
ALIGNED(4) static const u8 sText_ItsGoldCard[] = _("¡Es de color ORO!");

const u8 *const gTexts_UR_CardColor[] = {
    sText_ItsNormalCard,
    sText_ItsBronzeCard,
    sText_ItsCopperCard,
    sText_ItsSilverCard,
    sText_ItsGoldCard
};

ALIGNED(4) const u8 gText_UR_TrainerCardInfoPage1[] = _("Ésta es la FICHA de {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \nde {DYNAMIC 0} {DYNAMIC 1}...\l{DYNAMIC 2}\pPOKéDEX: {DYNAMIC 3}\nTIEMPO J.:    {DYNAMIC 4}:{DYNAMIC 5}\p");
ALIGNED(4) const u8 gText_UR_TrainerCardInfoPage2[] = _("COMBATES.: {DYNAMIC 0} V  {DYNAMIC 2} D\nINTERCAMBIOS:  {DYNAMIC 3}\p“{DYNAMIC 4} {DYNAMIC 5}\n{DYNAMIC 6} {DYNAMIC 7}”\p");
ALIGNED(4) static const u8 sText_GladToMeetYouMale[] = _("{DYNAMIC 1}: ¡Me alegro de conocerte!{PAUSE 60}");
ALIGNED(4) static const u8 sText_GladToMeetYouFemale[] = _("{DYNAMIC 1}: ¡Es un placer conocerte!{PAUSE 60}");

const u8 *const gTexts_UR_GladToMeetYou[GENDER_COUNT] = {
    sText_GladToMeetYouMale,
    sText_GladToMeetYouFemale
};

ALIGNED(4) const u8 gText_UR_FinishedCheckingPlayersTrainerCard[] = _("Leída la FICHA de {SHADOW DYNAMIC_COLOR4}ENTRENADOR{SHADOW LIGHT_GRAY} \nde {DYNAMIC 1}.{PAUSE 60}");
ALIGNED(4) static const u8 sText_CanceledReadingCard[] = _("Cancelada la lectura de la TARJETA.");

static const struct MysteryGiftClientCmd sClientScript_DynamicError[] = {
    {CLI_RECV, MG_LINKID_DYNAMIC_MSG},
    {CLI_COPY_MSG},
    {CLI_SEND_READY_END},
    {CLI_RETURN, CLI_MSG_BUFFER_FAILURE}
};

const struct MysteryGiftServerCmd gServerScript_ClientCanceledCard[] = {
    {SVR_LOAD_CLIENT_SCRIPT, PTR_ARG(sClientScript_DynamicError)},
    {SVR_SEND},
    {SVR_LOAD_MSG, PTR_ARG(sText_CanceledReadingCard)},
    {SVR_SEND},
    {SVR_RECV, MG_LINKID_READY_END},
    {SVR_RETURN, SVR_MSG_CLIENT_CANCELED}
};
