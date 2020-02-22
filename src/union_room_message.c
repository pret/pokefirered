#include "global.h"
#include "mevent_server.h"
#include "constants/union_room.h"

ALIGNED(4) const u8 gUnionRoomActivity_Blank[] = _("");
ALIGNED(4) const u8 gUnknown_84571B0[] = _(":");
ALIGNED(4) const u8 gUnknown_84571B4[] = _("{ID}");
ALIGNED(4) const u8 gUnknown_84571B8[] = _("Please start over from the beginning.");
ALIGNED(4) const u8 gUnknown_84571E0[] = _("The WIRELESS COMMUNICATION\nSYSTEM search has been canceled.");
ALIGNED(4) const u8 gUnref_845721C[] = _("ともだちからの れんらくを\nまっています");
ALIGNED(4) const u8 gUnknown_8457234[] = _("{STR_VAR_1}! Awaiting\ncommunication from another player.");
ALIGNED(4) const u8 gUnknown_8457264[] = _("{STR_VAR_1}! Awaiting link!\nPress START when everyone's ready.");

ALIGNED(4) const u8 gJPText_SingleBattle[] = _("シングルバトルを かいさいする");
ALIGNED(4) const u8 gJPText_DoubleBattle[] = _("ダブルバトルを かいさいする");
ALIGNED(4) const u8 gJPText_MultiBattle[] = _("マルチバトルを かいさいする");
ALIGNED(4) const u8 gJPText_TradePokemon[] = _("ポケモンこうかんを かいさいする");
ALIGNED(4) const u8 gJPText_Chat[] = _("チャットを かいさいする");
ALIGNED(4) const u8 gJPText_DistWonderCard[] = _("ふしぎなカードをくばる");
ALIGNED(4) const u8 gJPText_DistWonderNews[] = _("ふしぎなニュースをくばる");
ALIGNED(4) const u8 unref_text_union_room_1[] = _("ふしぎなできごとを かいさいする");
ALIGNED(4) const u8 gJPText_HoldPokemonJump[] = _("なわとびを かいさいする");
ALIGNED(4) const u8 gJPText_HoldBerryCrush[] = _("きのみマッシャーを かいさいする");
ALIGNED(4) const u8 gJPText_HoldBerryPicking[] = _("きのみどりを かいさいする");
ALIGNED(4) const u8 gJPText_HoldSpinTrade[] = _("ぐるぐるこうかんを かいさいする");
ALIGNED(4) const u8 gJPText_HoldSpinShop[] = _("ぐるぐるショップを かいさいする");

const u8 *const unref_text_ptrs_union_room_0[] = {
    gJPText_SingleBattle,
    gJPText_DoubleBattle,
    gJPText_MultiBattle,
    gJPText_TradePokemon,
    gJPText_Chat,
    gJPText_DistWonderCard,
    gJPText_DistWonderNews,
    gJPText_DistWonderCard,
    gJPText_HoldPokemonJump,
    gJPText_HoldBerryCrush,
    gJPText_HoldBerryPicking,
    gJPText_HoldBerryPicking,
    gJPText_HoldSpinTrade,
    gJPText_HoldSpinShop
};

const u8 gText_1PlayerNeeded[] = _("1 player\nneeded.");
const u8 gText_2PlayersNeeded[] = _("2 players\nneeded.");
const u8 gText_3PlayersNeeded[] = _("3 players\nneeded.");
const u8 gText_4PlayersNeeded[] = _("あと4にん\nひつよう");
const u8 gText_2PlayerMode[] = _("2-PLAYER\nMODE");
const u8 gText_3PlayerMode[] = _("3-PLAYER\nMODE");
const u8 gText_4PlayerMode[] = _("4-PLAYER\nMODE");
const u8 gText_5PlayerMode[] = _("5-PLAYER\nMODE");

const u8 *const gUnknown_845742C[][5] = {
    {
        gText_1PlayerNeeded,
        gText_2PlayerMode
    }, {
        gText_3PlayersNeeded,
        gText_2PlayersNeeded,
        gText_1PlayerNeeded,
        gText_4PlayerMode
    }, {
        gText_1PlayerNeeded,
        gText_2PlayerMode,
        gText_3PlayerMode,
        gText_4PlayerMode,
        gText_5PlayerMode
    }, {
        gText_2PlayersNeeded,
        gText_1PlayerNeeded,
        gText_3PlayerMode,
        gText_4PlayerMode,
        gText_5PlayerMode
    }
};

ALIGNED(4) const u8 gUnknown_845747C[] = _("{B_BUTTON}CANCEL");
ALIGNED(4) const u8 unref_text_union_room_2[] = _("ため\nさんかしゃ ぼしゅうちゅう です！");
ALIGNED(4) const u8 gUnknown_84574A0[] = _("{STR_VAR_2} contacted you for\n{STR_VAR_1}. Accept?");
ALIGNED(4) const u8 gUnknown_84574C4[] = _("{STR_VAR_2} contacted you.\nWill you share {STR_VAR_1}?");
ALIGNED(4) const u8 gUnknown_84574EC[] = _("{STR_VAR_2} contacted you.\nAdd to the members?");
ALIGNED(4) const u8 gUnknown_8457514[] = _("{STR_VAR_1}!\nAre these members OK?");
ALIGNED(4) const u8 gUnknown_8457530[] = _("Cancel {STR_VAR_1} MODE\nwith these members?");
ALIGNED(4) const u8 gUnknown_8457554[] = _("An “OK” was sent\nto {STR_VAR_1}.");

ALIGNED(4) const u8 gUnknown_845756C[] = _("The other TRAINER doesn't appear\nto be available now…\p");
ALIGNED(4) const u8 gUnknown_84575A4[] = _("You can't transmit with a TRAINER\nwho is too far away.\p");
ALIGNED(4) const u8 gUnknown_84575DC[] = _("The other TRAINER(S) is/are not\nready yet.\p");

const u8 *const gUnknown_8457608[] = {
    gUnknown_84575A4,
    gUnknown_84575DC
};

ALIGNED(4) const u8 gUnknown_8457610[] = _("The {STR_VAR_1} MODE with\nthese members will be canceled.{PAUSE 90}");
ALIGNED(4) const u8 gUnknown_8457644[] = _("There is a member who can no\nlonger remain available.\p");

const u8 *const gUnknown_845767C[] = {
    gUnknown_845756C,
    gUnknown_8457644
};

ALIGNED(4) const u8 gUnknown_8457684[] = _("The other TRAINER appears\nunavailable…\p");
ALIGNED(4) const u8 gUnknown_84576AC[] = _("{STR_VAR_1} sent back an “OK”!");
ALIGNED(4) const u8 gUnknown_84576C4[] = _("{STR_VAR_1} OK'd your registration as\na member.");
ALIGNED(4) const u8 gUnknown_84576EC[] = _("{STR_VAR_1} replied, “No…”\p");
ALIGNED(4) const u8 gUnknown_8457700[] = _("{STR_VAR_1}!\nAwaiting other members!");
ALIGNED(4) const u8 gUnknown_845771C[] = _("Quit being a member?");
ALIGNED(4) const u8 gUnknown_8457734[] = _("You stopped being a member.\p");

const u8 *const gUnknown_8457754[] = {
    NULL,
    gUnknown_8457644,
    gUnknown_8457684,
    NULL,
    NULL,
    NULL,
    gUnknown_84576EC,
    NULL,
    NULL,
    gUnknown_8457734
};

ALIGNED(4) const u8 gUnknown_845777C[] = _("The WIRELESS COMMUNICATION\nSYSTEM link has been established.");
ALIGNED(4) const u8 gUnknown_84577BC[] = _("The WIRELESS COMMUNICATION\nSYSTEM link has been dropped…");

ALIGNED(4) const u8 gUnknown_84577F8[] = _("The link with your friend has been\ndropped…");
ALIGNED(4) const u8 gUnknown_8457824[] = _("{STR_VAR_1} replied, “No…”");

const u8 *const gUnknown_8457838[] = {
    NULL,
    gUnknown_84577F8,
    gUnknown_84577F8,
    NULL,
    NULL,
    NULL,
    gUnknown_8457824,
    NULL,
    NULL,
    NULL
};

ALIGNED(4) const u8 gUnknown_8457860[] = _("Do you want the {STR_VAR_2}\nMODE?");
ALIGNED(4) const u8 gUnknown_845787C[] = _("Do you want the {STR_VAR_2}\nMODE?");

const u8 *const gUnknown_8457898[] = {
    gUnknown_8457860,
    gUnknown_845787C
};

ALIGNED(4) const u8 gUnknown_84578A0[] = _("はなしかけています…\nしょうしょう おまちください");
ALIGNED(4) const u8 gUnknown_84578BC[] = _("Awaiting {STR_VAR_1}'s response about\nthe trade…");

ALIGNED(4) const u8 gUnknown_84578E4[] = _("Communicating{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.");
ALIGNED(4) const u8 gUnknown_8457950[] = _("Communicating with {STR_VAR_1}{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.");
ALIGNED(4) const u8 gUnknown_84579BC[] = _("Please wait a while{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.\n{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.{PAUSE 15}.");

const u8 *const gURText_PleaseWaitMsgs[] = {
    gUnknown_84578E4,
    gUnknown_8457950,
    gUnknown_84579BC
};

ALIGNED(4) const u8 gUnknown_8457A40[] = _("Hiya! Is there something that you\nwanted to do?");
ALIGNED(4) const u8 gUnknown_8457A70[] = _("Hello!\nWould you like to do something?");
ALIGNED(4) const u8 gUnknown_8457A98[] = _("{STR_VAR_1}: Hiya, we meet again!\nWhat are you up for this time?");
ALIGNED(4) const u8 gUnknown_8457AD0[] = _("{STR_VAR_1}: Oh! {PLAYER}, hello!\nWould you like to do something?");

const u8 *const gURText_FriendPromptsForActivity[][2] = {
    {
        gUnknown_8457A40,
        gUnknown_8457A70
    }, {
        gUnknown_8457A98,
        gUnknown_8457AD0
    }
};

ALIGNED(4) const u8 gUnknown_8457B14[] = _("Want to do something?");
ALIGNED(4) const u8 gUnknown_8457B2C[] = _("Would you like to do something?");
ALIGNED(4) const u8 gUnknown_8457B4C[] = _("{STR_VAR_1}: What would you like to\ndo now?");
ALIGNED(4) const u8 gUnknown_8457B70[] = _("{STR_VAR_1}‘また なにかする？");

const u8 *const gUnknown_8457B80[] = {
    gUnknown_8457B14,
    gUnknown_8457B2C,
    gUnknown_8457B4C,
    gUnknown_8457B4C
};

ALIGNED(4) const u8 gUnknown_8457B90[] = _("Somebody has contacted you.{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_8457BA0[] = _("{STR_VAR_1} has contacted you.{PAUSE 60}");

const u8 *const gUnknown_8457BCC[] = {
    gUnknown_8457B90,
    gUnknown_8457BA0
};

ALIGNED(4) const u8 gUnknown_8457BD4[] = _("Awaiting a response from\nthe other TRAINER…");
ALIGNED(4) const u8 gUnknown_8457C00[] = _("Awaiting a response from\n{STR_VAR_1}…");

const u8 *const gUnknown_8457C20[] = {
    gUnknown_8457BD4,
    gUnknown_8457C00
};

ALIGNED(4) const u8 gUnknown_8457C28[] = _("あいての ていあんを まっています\nビーボタンで キャンセル");
ALIGNED(4) const u8 gUnknown_8457C48[] = _("The other TRAINER showed\nyou their TRAINER CARD.\pWould you like to show your\nTRAINER CARD?");
ALIGNED(4) const u8 gUnknown_8457CA4[] = _("The other TRAINER challenges you\nto battle.\pWill you accept the battle\nchallenge?");
ALIGNED(4) const u8 gUnknown_8457CF8[] = _("The other TRAINER invites you\nto chat.\pWill you accept the chat\ninvitation?");
ALIGNED(4) const u8 gUnknown_8457D44[] = _("There is an offer to trade your\nregistered Lv. {DYNAMIC 0} {DYNAMIC 1}\pin exchange for a\nLv. {DYNAMIC 2} {DYNAMIC 3}.\pWill you accept this trade\noffer?");
ALIGNED(4) const u8 gUnknown_8457DB8[] = _("There is an offer to trade your\nregistered EGG.\lWill you accept this trade offer?");
ALIGNED(4) const u8 gUnknown_8457E0C[] = _("The chat has been dropped.\p");
ALIGNED(4) const u8 gUnknown_8457E28[] = _("You declined the offer.\p");
ALIGNED(4) const u8 gUnknown_8457E44[] = _("You declined the offer.\p");
ALIGNED(4) const u8 gUnknown_8457E60[] = _("The chat was ended.\p");

const u8 *const gUnknown_8457E78[] = {
    gUnknown_8457C48,
    gUnknown_8457CA4,
    gUnknown_8457CF8,
    gUnknown_8457D44
};

ALIGNED(4) const u8 gUnknown_8457E88[] = _("Oh, hey! We're in a chat right now.\nWant to join us?");
ALIGNED(4) const u8 gUnknown_8457EC0[] = _("{STR_VAR_1}: Hey, {PLAYER}!\nWe're having a chat right now.\lWant to join us?");
ALIGNED(4) const u8 gUnknown_8457F00[] = _("Oh, hi! We're having a chat now.\nWould you like to join us?");
ALIGNED(4) const u8 gUnknown_8457F3C[] = _("{STR_VAR_1}: Oh, hi, {PLAYER}!\nWe're having a chat now.\lWould you like to join us?");

const u8 *const gUnknown_8457F80[][2] = {
    {
        gUnknown_8457E88,
        gUnknown_8457F00
    }, {
        gUnknown_8457EC0,
        gUnknown_8457F3C
    }
};

ALIGNED(4) const u8 gUnknown_8457F90[] = _("……\nThe TRAINER appears to be busy…\p");

ALIGNED(4) const u8 gUnknown_8457FB4[] = _("A battle, huh?\nAll right, just give me some time.");
ALIGNED(4) const u8 gUnknown_8457FE8[] = _("You want to chat, huh?\nSure, just wait a little.");
ALIGNED(4) const u8 gUnknown_845801C[] = _("Sure thing! As my “Greetings,”\nhere's my TRAINER CARD.");
ALIGNED(4) const u8 gUnknown_8458054[] = _("A battle? Of course, but I need\ntime to get ready.");
ALIGNED(4) const u8 gUnknown_8458088[] = _("Did you want to chat?\nOkay, but please wait a moment.");
ALIGNED(4) const u8 gUnknown_84580C0[] = _("As my introduction, I'll show you\nmy TRAINER CARD.");

const u8 *const gResponseToURoomActivityInviteStringPtrs[][4] = {
    {
        gUnknown_8457FB4,
        gUnknown_8457FE8,
        NULL,
        gUnknown_845801C
    }, {
        gUnknown_8458054,
        gUnknown_8458088,
        NULL,
        gUnknown_84580C0
    }
};

ALIGNED(4) const u8 gUnref_8458104[] = _("チャットだね！\nわかった ちょっと まってて！");
ALIGNED(4) const u8 gUnknown_845812C[] = _("Thanks for waiting!\nLet's get our battle started!{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_8458164[] = _("All right!\nLet's chat!{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_8458180[] = _("Sorry I made you wait!\nLet's get started!{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_84581B0[] = _("Sorry I made you wait!\nLet's chat.{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_84581D8[] = _("The trade will be started.{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_84581F8[] = _("The battle will be started.{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_8458218[] = _("Entering the chat…{PAUSE 60}");

const u8 *const gUnknown_8458230[][2][3] = {
    {
        {
            gUnknown_84581F8,
            gUnknown_8458218,
            gUnknown_84581D8
        }, {
            gUnknown_84581F8,
            gUnknown_8458218,
            gUnknown_84581D8
        }
    }, {
        {
            gUnknown_845812C,
            gUnknown_8458164,
            gUnknown_84581D8
        }, {
            gUnknown_8458180,
            gUnknown_84581B0,
            gUnknown_84581D8
        }
    }
};

ALIGNED(4) const u8 gUnknown_8458260[] = _("Sorry! My POKéMON don't seem to\nbe feeling too well right now.\lLet me battle you another time.\p");
ALIGNED(4) const u8 gUnknown_84582C0[] = _("I'm terribly sorry, but my POKéMON\naren't feeling well…\pLet's battle another time.\p");

const u8 *const gUnknown_8458314[] = {
    gUnknown_8458260,
    gUnknown_84582C0
};

ALIGNED(4) const u8 gUnknown_845831C[] = _("Huh? My TRAINER CARD…\nWhere'd it go now?\lSorry! I'll show you another time!\p");
ALIGNED(4) const u8 gUnknown_845836C[] = _("Oh? Now where did I put my\nTRAINER CARD?…\lSorry! I'll show you later!\p");

const u8 *const gUnknown_84583B4[] = {
    gUnknown_845831C,
    gUnknown_845836C
};

ALIGNED(4) const u8 gUnknown_84583BC[] = _("If you want to do something with\nme, just give me a shout!\p");
ALIGNED(4) const u8 gUnknown_84583F8[] = _("If you want to do something with\nme, don't be shy.\p");

const u8 *const gUnknown_845842C[] = {
    gUnknown_84583BC,
    gUnknown_84583F8
};

ALIGNED(4) const u8 gUnknown_8458434[] = _("Whoops! Sorry, but I have to do\nsomething else.\lAnother time, okay?\p");
ALIGNED(4) const u8 gUnknown_845847C[] = _("If you want to battle, you need\ntwo POKéMON that are below\lLv. 30.\p");
ALIGNED(4) const u8 gUnknown_84584C0[] = _("For a battle, you need two\nPOKéMON that are below Lv. 30.\p");
ALIGNED(4) const u8 gUnknown_84584FC[] = _("Oh, all right.\nCome see me anytime, okay?\p");
ALIGNED(4) const u8 gUnknown_8458528[] = _("Oh…\nPlease come by anytime.\p");

const u8 *const gUnknown_8458548[] = {
    gUnknown_84584FC,
    gUnknown_8458528
};

ALIGNED(4) const u8 gUnknown_8458550[] = _("Oh, sorry!\nI just can't right this instant.\lLet's chat another time.\p");
ALIGNED(4) const u8 gUnknown_8458598[] = _("Oh, I'm sorry.\nI have too much to do right now.\lLet's chat some other time.\p");

const u8 *const gUnknown_84585E8[] = {
    gUnknown_8458550,
    gUnknown_8458598
};

ALIGNED(4) const u8 gUnknown_84585F0[] = _("Whoa!\nI can tell you're pretty tough!\p");
ALIGNED(4) const u8 gUnknown_8458618[] = _("You used that move?\nThat's good strategy!\p");
ALIGNED(4) const u8 gUnknown_8458644[] = _("Way to go!\nThat was an eye-opener!\p");
ALIGNED(4) const u8 gUnknown_8458668[] = _("Oh! How could you use that\nPOKéMON in that situation?\p");
ALIGNED(4) const u8 gUnknown_84586A0[] = _("That POKéMON…\nIt's been raised really well!\p");
ALIGNED(4) const u8 gUnknown_84586D0[] = _("That's it!\nThis is the right move now!\p");
ALIGNED(4) const u8 gUnknown_84586F8[] = _("That's awesome!\nYou can battle that way?\p");
ALIGNED(4) const u8 gUnknown_8458724[] = _("You have exquisite timing for\nswitching POKéMON!\p");

const u8 *const gUnknown_8458758[][4] = {
    {
        gUnknown_84585F0,
        gUnknown_8458618,
        gUnknown_8458644,
        gUnknown_8458668
    }, {
        gUnknown_84586A0,
        gUnknown_84586D0,
        gUnknown_84586F8,
        gUnknown_8458724
    }
};

ALIGNED(4) const u8 gUnknown_8458778[] = _("Oh, I see!\nThis is educational!\p");
ALIGNED(4) const u8 gUnknown_845879C[] = _("Don't say anything funny anymore!\nI'm sore from laughing!\p");
ALIGNED(4) const u8 gUnknown_84587D8[] = _("Oh?\nSomething like that happened.\p");
ALIGNED(4) const u8 gUnknown_84587FC[] = _("Hmhm… What?\nSo is this what you're saying?\p");
ALIGNED(4) const u8 gUnknown_8458828[] = _("Is that right?\nI didn't know that.\p");
ALIGNED(4) const u8 gUnknown_845884C[] = _("Ahaha!\nWhat is that about?\p");
ALIGNED(4) const u8 gUnknown_8458868[] = _("Yes, that's exactly it!\nThat's what I meant.\p");
ALIGNED(4) const u8 gUnknown_8458898[] = _("In other words…\nYes! That's right!\p");

const u8 *const gUnknown_84588BC[][4] = {
    {
        gUnknown_8458778,
        gUnknown_845879C,
        gUnknown_84587D8,
        gUnknown_84587FC
    }, {
        gUnknown_8458828,
        gUnknown_845884C,
        gUnknown_8458868,
        gUnknown_8458898
    }
};

ALIGNED(4) const u8 gUnknown_84588DC[] = _("I'm just showing my TRAINER CARD\nas my way of greeting.\p");
ALIGNED(4) const u8 gUnknown_8458918[] = _("I hope I get to know you better!\p");
ALIGNED(4) const u8 gUnknown_845893C[] = _("We're showing each other our\nTRAINER CARDS to get acquainted.\p");
ALIGNED(4) const u8 gUnknown_845897C[] = _("Glad to meet you.\nPlease don't be a stranger!\p");

const u8 *const gUnknown_84589AC[][2] = {
    {
        gUnknown_84588DC,
        gUnknown_8458918
    }, {
        gUnknown_845893C,
        gUnknown_845897C
    }
};

ALIGNED(4) const u8 gUnknown_84589BC[] = _("Yeahah!\nI really wanted this POKéMON!\p");
ALIGNED(4) const u8 gUnknown_84589E4[] = _("Finally, a trade got me that\nPOKéMON I'd wanted a long time.\p");
ALIGNED(4) const u8 gUnknown_8458A24[] = _("I'm trading POKéMON right now.\p");
ALIGNED(4) const u8 gUnknown_8458A44[] = _("I finally got that POKéMON I\nwanted in a trade!\p");

const u8 *const gUnknown_8458A78[][4] = {
    {
        gUnknown_84589BC,
        gUnknown_84589E4
    }, {
        gUnknown_8458A24,
        gUnknown_8458A44
    }
};

const u8 gUnknown_8458A98[] = _("{STR_VAR_1} checked the\nTRADING BOARD.\p");
ALIGNED(4) const u8 gUnknown_8458AB8[] = _("Welcome to the TRADING BOARD.\pYou may register your POKéMON\nand offer it up for a trade.\pWould you like to register one of\nyour POKéMON?");
ALIGNED(4) const u8 gUnknown_8458B44[] = _("This TRADING BOARD is used for\noffering a POKéMON for a trade.\pAll you need to do is register a\nPOKéMON for a trade.\pAnother TRAINER may offer a party\nPOKéMON in return for the trade.\pWe hope you will register POKéMON\nand trade them with many, many\lother TRAINERS.\pWould you like to register one of\nyour POKéMON?");
ALIGNED(4) const u8 gUnref_ThankYouForComing_JP[] = _("こうかんけいじばん の とうろくが\nかんりょう しました\pごりよう ありがとう\nございました！\p");
ALIGNED(4) const u8 gUnref_NoOneRegisteredMon[] = _("けいじばんに だれも ポケモンを\nとうろく していません\p\n");

ALIGNED(4) const u8 gURText_PleaseChooseTypeOfMon[] = _("Please choose the type of POKéMON\nthat you would like in the trade.\n");
ALIGNED(4) const u8 gUnknown_8458D1C[] = _("Which of your party POKéMON will\nyou offer in trade?\p");
ALIGNED(4) const u8 gUnknown_8458D54[] = _("Registration has been canceled.\p");
ALIGNED(4) const u8 gUnknown_8458D78[] = _("Registration has been completed.\p");
ALIGNED(4) const u8 gUnknown_8458D9C[] = _("The trade has been canceled.\p");
ALIGNED(4) const u8 gUnknown_8458DBC[] = _("Cancel the registration of your\nLv. {STR_VAR_2} {STR_VAR_1}?");
ALIGNED(4) const u8 gUnknown_8458DE8[] = _("Cancel the registration of your\nEGG?");
ALIGNED(4) const u8 gUnknown_8458E10[] = _("The registration has been canceled.\p");
ALIGNED(4) const u8 gUnref_ShowPeopleWhoLikeYou_JP[] = _("こうかんを きぼうしているひとを\nひょうじします");
ALIGNED(4) const u8 gUnref_PleaseChooseTrainerYouWant[] = _("こうかん したい トレーナーを\nえらんで ください");
ALIGNED(4) const u8 gUnknown_8458E70[] = _("Would you like to ask {STR_VAR_1} to\nmake a trade?");
ALIGNED(4) const u8 gUnref_ImWaitingForAnswer[] = _("……\nあいての へんじを まっています");
ALIGNED(4) const u8 gUnref_MonSentOutIsNotRegistered[] = _("あなたが こうかんにだす\nポケモンが とうろくされていません\p");
ALIGNED(4) const u8 gUnknown_8458ED0[] = _("You don't have a {STR_VAR_2}-type\nPOKéMON that {STR_VAR_1} wants.\p");
ALIGNED(4) const u8 gUnknown_8458F04[] = _("You don't have an EGG that\n{STR_VAR_1} wants.\p");
ALIGNED(4) const u8 gUnknown_8458F2C[] = _("{STR_VAR_1} can't make a trade for\nyour POKéMON right now.\p");
ALIGNED(4) const u8 gUnknown_8458F60[] = _("You can't make a trade for\n{STR_VAR_1}'s POKéMON right now.\p");

const u8 *const gUnknown_8458F94[] = {
    gUnknown_8458F2C,
    gUnknown_8458F60
};

ALIGNED(4) const u8 gUnknown_8458F9C[] = _("Your trade offer was rejected.\p");
ALIGNED(4) const u8 gText_EggTrade[] = _("EGG TRADE");
ALIGNED(4) const u8 gUnknown_8458FC8[] = _("{DPAD_UPDOWN}CHOOSE  {A_BUTTON}JOIN  {B_BUTTON}CANCEL");
ALIGNED(4) const u8 gUnknown_8458FE4[] = _("Please choose a TRAINER.");

ALIGNED(4) const u8 gUnknown_8459000[] = _("Please choose a TRAINER for\na SINGLE BATTLE.");
ALIGNED(4) const u8 gUnknown_8459030[] = _("Please choose a TRAINER for\na DOUBLE BATTLE.");
ALIGNED(4) const u8 gUnknown_8459060[] = _("Please choose the LEADER\nfor a MULTI BATTLE.");
ALIGNED(4) const u8 gUnknown_8459090[] = _("Please choose the TRAINER to\ntrade with.");
ALIGNED(4) const u8 gUnknown_84590BC[] = _("Please choose the TRAINER who is\nsharing WONDER CARDS.");
ALIGNED(4) const u8 gUnknown_84590F4[] = _("Please choose the TRAINER who is\nsharing WONDER NEWS.");
ALIGNED(4) const u8 gUnknown_845912C[] = _("Jump with mini POKéMON!\nPlease choose the LEADER.");
ALIGNED(4) const u8 gUnknown_8459160[] = _("BERRY CRUSH!\nPlease choose the LEADER.");
ALIGNED(4) const u8 gUnknown_8459188[] = _("DODRIO BERRY-PICKING!\nPlease choose the LEADER.");

const u8 *const gUnknown_84591B8[] = {
    [LINK_GROUP_SINGLE_BATTLE] = gUnknown_8459000,
    [LINK_GROUP_DOUBLE_BATTLE] = gUnknown_8459030,
    [LINK_GROUP_MULTI_BATTLE]  = gUnknown_8459060,
    [LINK_GROUP_TRADE]         = gUnknown_8459090,
    [LINK_GROUP_POKEMON_JUMP]  = gUnknown_845912C,
    [LINK_GROUP_BERRY_CRUSH]   = gUnknown_8459160,
    [LINK_GROUP_BERRY_PICKING] = gUnknown_8459188,
    [LINK_GROUP_WONDER_CARD]   = gUnknown_84590BC,
    [LINK_GROUP_WONDER_NEWS]   = gUnknown_84590F4
};

ALIGNED(4) const u8 gUnknown_84591DC[] = _("Searching for a WIRELESS\nCOMMUNICATION SYSTEM. Wait...");
ALIGNED(4) const u8 gUnref_NeedAtLeast2InDblBtl[] = _("ダブルバトルでは 2ひき いじょうの\nポケモンが ひつようです\p");
ALIGNED(4) const u8 gUnknown_8459238[] = _("Awaiting {STR_VAR_1}'s response…");
ALIGNED(4) const u8 gUnknown_8459250[] = _("{STR_VAR_1} has been asked to register\nyou as a member. Please wait.");
ALIGNED(4) const u8 gUnknown_845928C[] = _("Awaiting a response from the\nWIRELESS COMMUNICATION SYSTEM.");
ALIGNED(4) const u8 gUnref_PlsWaitLittleWHile[] = _("ほかの さんかしゃが そろうまで\nしょうしょう おまちください");

ALIGNED(4) const u8 gUnknown_84592E8[] = _("No CARDS appear to be shared \nright now.");
ALIGNED(4) const u8 gUnknown_8459314[] = _("No NEWS appears to be shared\nright now.");

const u8 *const gUnknown_845933C[] = {
    gUnknown_84592E8,
    gUnknown_8459314
};

ALIGNED(4) const u8 gUnknown_8459344[] = _("BATTLE");
ALIGNED(4) const u8 gUnknown_845934C[] = _("CHAT");
ALIGNED(4) const u8 gUnknown_8459354[] = _("GREETINGS");
ALIGNED(4) const u8 gUnknown_8459360[] = _("EXIT");

ALIGNED(4) const u8 gUnknown_8459368[] = _("EXIT");
ALIGNED(4) const u8 gUnknown_8459370[] = _("INFO");
ALIGNED(4) const u8 gUnknown_8459378[] = _("NAME{CLEAR_TO 0x3C}WANTED{CLEAR_TO 0x6E}OFFER{CLEAR_TO 0xC6}LV.");

ALIGNED(4) const u8 gUnionRoomActivity_SingleBattle[] = _("SINGLE BATTLE");
ALIGNED(4) const u8 gUnionRoomActivity_DoubleBattle[] = _("DOUBLE BATTLE");
ALIGNED(4) const u8 gUnionRoomActivity_MultiBattle[] = _("MULTI BATTLE");
ALIGNED(4) const u8 gUnionRoomActivity_PokemonTrades[] = _("POKéMON TRADES");
ALIGNED(4) const u8 gUnionRoomActivity_Chat[] = _("CHAT");
ALIGNED(4) const u8 gUnionRoomActivity_Cards[] = _("CARDS");
ALIGNED(4) const u8 gUnionRoomActivity_WonderCards[] = _("WONDER CARDS");
ALIGNED(4) const u8 gunionRoomActivity_WonderNews[] = _("WONDER NEWS");
ALIGNED(4) const u8 gUnionRoomActivity_PokemonJump[] = _("POKéMON JUMP");
ALIGNED(4) const u8 gUnionRoomActivity_BerryCrush[] = _("BERRY CRUSH");
ALIGNED(4) const u8 gUnionRoomActivity_BerryPicking[] = _("BERRY-PICKING");
ALIGNED(4) const u8 gUnionRoomActivity_Search[] = _("SEARCH");
ALIGNED(4) const u8 gUnionRoomActivity_SpinTradeJP[] = _("ぐるぐるこうかん");
ALIGNED(4) const u8 gUnionRoomActivity_ItemTradeJP[] = _("アイテムトレード");

ALIGNED(4) const u8 gUnknown_845944C[] = _("It's a NORMAL CARD.");
ALIGNED(4) const u8 gUnknown_8459460[] = _("It's a BRONZE CARD!");
ALIGNED(4) const u8 gUnknown_8459474[] = _("It's a COPPER CARD!");
ALIGNED(4) const u8 gUnknown_8459488[] = _("It's a SILVER CARD!");
ALIGNED(4) const u8 gUnknown_845949C[] = _("It's a GOLD CARD!");

const u8 *const gUnknown_84594B0[] = {
    gUnknown_845944C,
    gUnknown_8459460,
    gUnknown_8459474,
    gUnknown_8459488,
    gUnknown_845949C
};

ALIGNED(4) const u8 gUnknown_84594C4[] = _("This is {SPECIAL_F7 0x00} {SPECIAL_F7 0x01}'s\nTRAINER CARD…\l{SPECIAL_F7 0x02}\pPOKéDEX: {SPECIAL_F7 0x03}\nTIME:    {SPECIAL_F7 0x04}:{SPECIAL_F7 0x05}\p");
ALIGNED(4) const u8 gUnknown_8459504[] = _("BATTLES: {SPECIAL_F7 0x00} WINS  {SPECIAL_F7 0x02} LOSSES\nTRADES:  {SPECIAL_F7 0x03} TIMES\p“{SPECIAL_F7 0x04} {SPECIAL_F7 0x05}\n{SPECIAL_F7 0x06} {SPECIAL_F7 0x07}”\p");

ALIGNED(4) const u8 gUnknown_8459544[] = _("{SPECIAL_F7 0x01}: Glad to have met you!{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_8459564[] = _("{SPECIAL_F7 0x01}: Glad to meet you!{PAUSE 60}");

const u8 *const gUnknown_8459580[] = {
    gUnknown_8459544,
    gUnknown_8459564
};

ALIGNED(4) const u8 gUnknown_8459588[] = _("Finished checking {SPECIAL_F7 0x01}'s\nTRAINER CARD.{PAUSE 60}");
ALIGNED(4) const u8 gUnknown_84595B0[] = _("Canceled reading the Card.");

const struct mevent_client_cmd gUnknown_84595CC[] = {
    CLI_RECEIVE(0x15),
    CLI_RECVBUF,
    CLI_SENDALL,
    CLI_RETURN(0x0e)
};

const struct mevent_server_cmd gMEventSrvScript_OtherTrainerCanceled[] = {
    SRV_SEND(0x20, gUnknown_84595CC),
    SRV_WAITSND,
    SRV_SENDSTR(0x1b, gUnknown_84595B0),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x09)
};
