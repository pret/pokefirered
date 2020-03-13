#include "global.h"
#include "battle_string_ids.h"
#include "battle.h"
#include "palette.h"
#include "battle_anim.h"
#include "string_util.h"
#include "text.h"
#include "window.h"
#include "strings.h"
#include "battle_message.h"
#include "link.h"
#include "event_scripts.h"
#include "event_data.h"
#include "item.h"
#include "battle_tower.h"
#include "trainer_tower.h"
#include "battle_setup.h"
#include "field_specials.h"
#include "new_menu_helpers.h"
#include "battle_controllers.h"
#include "graphics.h"
#include "constants/moves.h"
#include "constants/items.h"
#include "constants/trainer_classes.h"

struct BattleWindowText
{
    u8 fillValue;
    u8 fontId;
    u8 x;
    u8 y;
    u8 letterSpacing;
    u8 lineSpacing;
    u8 speed;
    u8 fgColor;
    u8 bgColor;
    u8 shadowColor;
};

static EWRAM_DATA u8 sBattlerAbilities[MAX_BATTLERS_COUNT] = {};
static EWRAM_DATA struct BattleMsgData *sBattleMsgDataPtr = NULL;

static void ChooseMoveUsedParticle(u8 *textPtr);
static void ChooseTypeOfMoveUsedString(u8 *textPtr);
static void ExpandBattleTextBuffPlaceholders(const u8 *src, u8 *dst);

const u8 gUnknown_83FB218[] = _("");
const u8 gUnknown_83FB219[] = _("{B_TRAINER1_LOSE_TEXT}");
const u8 gUnknown_83FB21C[] = _("{B_TRAINER2_CLASS}");
const u8 gUnknown_83FB21F[] = _("{B_TRAINER1_NAME}: {B_OPPONENT_MON1_NAME}, come back!");
const u8 gUnknown_83FB232[] = _("{B_TRAINER1_WIN_TEXT}");
const u8 gUnknown_83FB235[] = _("{B_TRAINER1_NAME}: {B_OPPONENT_MON2_NAME}, come back!");
const u8 gUnknown_83FB248[] = _("{B_TRAINER1_NAME}: {B_OPPONENT_MON1_NAME} and\n{B_OPPONENT_MON2_NAME}, come back!");
const u8 gUnknown_83FB262[] = _("{B_TRAINER2_NAME}");
const u8 gUnknown_83FB265[] = _("{B_BUFF1} gained{B_BUFF2}\n{B_TRAINER2_LOSE_TEXT} EXP. Points!\p");
const u8 gUnknown_83FB282[] = _("");
const u8 gUnknown_83FB283[] = _(" a boosted");
const u8 gUnknown_83FB28E[] = _("{B_BUFF1} grew to\nLV. {B_BUFF2}!{WAIT_SE}\p");
const u8 gUnknown_83FB2A4[] = _("{B_BUFF1} learned\n{B_BUFF2}!{WAIT_SE}\p");
const u8 gUnknown_83FB2B6[] = _("{B_BUFF1} is trying to\nlearn {B_BUFF2}.\p");
const u8 gUnknown_83FB2D1[] = _("But, {B_BUFF1} can't learn\nmore than four moves.\p");
const u8 gUnknown_83FB2FC[] = _("Delete a move to make\nroom for {B_BUFF2}?");
const u8 gUnknown_83FB31F[] = _("{B_BUFF1} forgot\n{B_BUFF2}.\p");
const u8 gUnknown_83FB32E[] = _("{PAUSE 32}Stop learning\n{B_BUFF2}?");
const u8 gUnknown_83FB343[] = _("{B_BUFF1} did not learn\n{B_BUFF2}.\p");
const u8 gUnknown_83FB359[] = _("Use next POKéMON?");
const u8 gUnknown_83FB36B[] = _("{B_ATK_NAME_WITH_PREFIX}'s\nattack missed!");
const u8 gUnknown_83FB37F[] = _("{B_DEF_NAME_WITH_PREFIX}\nprotected itself!");
const u8 gUnknown_83FB394[] = _("{B_DEF_NAME_WITH_PREFIX} avoided\ndamage with {B_DEF_ABILITY}!");
const u8 gUnknown_83FB3AF[] = _("{B_DEF_NAME_WITH_PREFIX} makes GROUND\nmoves miss with {B_DEF_ABILITY}!");
const u8 gUnknown_83FB3D3[] = _("{B_DEF_NAME_WITH_PREFIX} avoided\nthe attack!");
const u8 gUnknown_83FB3EA[] = _("It doesn't affect\n{B_DEF_NAME_WITH_PREFIX}…");
const u8 gUnknown_83FB400[] = _("{B_ATK_NAME_WITH_PREFIX}\nfainted!\p");
const u8 gUnknown_83FB40D[] = _("{B_DEF_NAME_WITH_PREFIX}\nfainted!\p");
const u8 gUnknown_83FB41A[] = _("{B_PLAYER_NAME} got ¥{B_BUFF1}\nfor winning!\p");
const u8 gUnknown_83FB433[] = _("{B_PLAYER_NAME} is out of\nusable POKéMON!\p");
const u8 gUnknown_83FB451[] = _("{B_PLAYER_NAME} panicked and lost ¥{B_BUFF1}…\p… … … …\p{B_PLAYER_NAME} whited out!{PAUSE_UNTIL_PRESS}");
const u8 gUnknown_83FB484[] = _("{B_PLAYER_NAME} is out of\nusable POKéMON!\pPlayer lost against\n{B_TRAINER1_CLASS} {B_TRAINER1_NAME}!{PAUSE_UNTIL_PRESS}");
const u8 gUnknown_83FB4BE[] = _("{B_PLAYER_NAME} paid ¥{B_BUFF1} as the prize\nmoney…\p… … … …\p{B_PLAYER_NAME} whited out!{PAUSE_UNTIL_PRESS}");
const u8 gUnknown_83FB4F7[] = _("{B_PLAYER_NAME} whited out!{PAUSE_UNTIL_PRESS}");
const u8 gUnknown_83FB508[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX} prevents\nescape with {B_SCR_ACTIVE_ABILITY}!\p");
const u8 gUnknown_83FB525[] = _("Can't escape!\p");
const u8 gUnknown_83FB534[] = _("{B_ATK_NAME_WITH_PREFIX} can't escape!");
const u8 gUnknown_83FB545[] = _("Hit {B_BUFF1} time(s)!");
const u8 gUnknown_83FB555[] = _("{B_EFF_NAME_WITH_PREFIX}\nfell asleep!");
const u8 gUnknown_83FB565[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nmade {B_EFF_NAME_WITH_PREFIX} sleep!");
const u8 gUnknown_83FB57C[] = _("{B_DEF_NAME_WITH_PREFIX} is\nalready asleep!");
const u8 gUnknown_83FB592[] = _("{B_ATK_NAME_WITH_PREFIX} is\nalready asleep!");
const u8 gUnknown_83FB5A8[] = _("{B_DEF_NAME_WITH_PREFIX}\nwasn't affected!");
const u8 gUnknown_83FB5BC[] = _("{B_EFF_NAME_WITH_PREFIX}\nwas poisoned!");
const u8 gUnknown_83FB5CD[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\npoisoned {B_EFF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FB5E2[] = _("{B_ATK_NAME_WITH_PREFIX} is hurt\nby poison!");
const u8 gUnknown_83FB5F8[] = _("{B_DEF_NAME_WITH_PREFIX} is already\npoisoned.");
const u8 gUnknown_83FB610[] = _("{B_EFF_NAME_WITH_PREFIX} is badly\npoisoned!");
const u8 gUnknown_83FB626[] = _("{B_DEF_NAME_WITH_PREFIX} had its\nenergy drained!");
const u8 gUnknown_83FB641[] = _("{B_EFF_NAME_WITH_PREFIX} was burned!");
const u8 gUnknown_83FB650[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nburned {B_EFF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FB663[] = _("{B_ATK_NAME_WITH_PREFIX} is hurt\nby its burn!");
const u8 gUnknown_83FB67B[] = _("{B_DEF_NAME_WITH_PREFIX} already\nhas a burn.");
const u8 gUnknown_83FB692[] = _("{B_EFF_NAME_WITH_PREFIX} was\nfrozen solid!");
const u8 gUnknown_83FB6A7[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nfroze {B_EFF_NAME_WITH_PREFIX} solid!");
const u8 gUnknown_83FB6BF[] = _("{B_ATK_NAME_WITH_PREFIX} is\nfrozen solid!");
const u8 gUnknown_83FB6D3[] = _("{B_DEF_NAME_WITH_PREFIX} was\ndefrosted!");
const u8 gUnknown_83FB6E5[] = _("{B_ATK_NAME_WITH_PREFIX} was\ndefrosted!");
const u8 gUnknown_83FB6F7[] = _("{B_ATK_NAME_WITH_PREFIX} was\ndefrosted by {B_CURRENT_MOVE}!");
const u8 gUnknown_83FB70F[] = _("{B_EFF_NAME_WITH_PREFIX} is paralyzed!\nIt may be unable to move!");
const u8 gUnknown_83FB73A[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nparalyzed {B_EFF_NAME_WITH_PREFIX}!\lIt may be unable to move!");
const u8 gUnknown_83FB76A[] = _("{B_ATK_NAME_WITH_PREFIX} is paralyzed!\nIt can't move!");
const u8 gUnknown_83FB78A[] = _("{B_DEF_NAME_WITH_PREFIX} is\nalready paralyzed!");
const u8 gUnknown_83FB7A3[] = _("{B_DEF_NAME_WITH_PREFIX} was\nhealed of paralysis!");
const u8 gUnknown_83FB7BF[] = _("{B_DEF_NAME_WITH_PREFIX}'s\ndream was eaten!");
const u8 gUnknown_83FB7D5[] = _("{B_ATK_NAME_WITH_PREFIX}'s {B_BUFF1}\nwon't go higher!");
const u8 gUnknown_83FB7EE[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_BUFF1}\nwon't go lower!");
const u8 gUnknown_83FB806[] = _("Your team's {B_BUFF1}\nstopped working!");
const u8 gUnknown_83FB826[] = _("The foe's {B_BUFF1}\nstopped working!");
const u8 gUnknown_83FB844[] = _("{B_ATK_NAME_WITH_PREFIX} is\nconfused!");
const u8 gUnknown_83FB854[] = _("{B_ATK_NAME_WITH_PREFIX} snapped\nout of confusion!");
const u8 gUnknown_83FB871[] = _("{B_EFF_NAME_WITH_PREFIX} became\nconfused!");
const u8 gUnknown_83FB885[] = _("{B_DEF_NAME_WITH_PREFIX} is\nalready confused!");
const u8 gUnknown_83FB89D[] = _("{B_DEF_NAME_WITH_PREFIX}\nfell in love!");
const u8 gUnknown_83FB8AE[] = _("{B_ATK_NAME_WITH_PREFIX} is in love\nwith {B_SCR_ACTIVE_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FB8C5[] = _("{B_ATK_NAME_WITH_PREFIX} is\nimmobilized by love!");
const u8 gUnknown_83FB8E0[] = _("{B_DEF_NAME_WITH_PREFIX} was\nblown away!");
const u8 gUnknown_83FB8F3[] = _("{B_ATK_NAME_WITH_PREFIX} transformed\ninto the {B_BUFF1} type!");
const u8 gUnknown_83FB914[] = _("{B_ATK_NAME_WITH_PREFIX} flinched!");
const u8 gUnknown_83FB921[] = _("{B_DEF_NAME_WITH_PREFIX} regained\nhealth!");
const u8 gUnknown_83FB935[] = _("{B_DEF_NAME_WITH_PREFIX}'s\nHP is full!");
const u8 gUnknown_83FB946[] = _("{B_ATK_PREFIX2}'s {B_CURRENT_MOVE}\nraised SP. DEF!");
const u8 gUnknown_83FB95E[] = _("{B_ATK_PREFIX2}'s {B_CURRENT_MOVE}\nraised SP. DEF a little!");
const u8 gUnknown_83FB97F[] = _("{B_ATK_PREFIX2}'s {B_CURRENT_MOVE}\nraised DEFENSE!");
const u8 gUnknown_83FB997[] = _("{B_ATK_PREFIX2}'s {B_CURRENT_MOVE}\nraised DEFENSE a little!");
const u8 gUnknown_83FB9B8[] = _("{B_ATK_PREFIX2}'s party is covered\nby a veil!");
const u8 gUnknown_83FB9D9[] = _("{B_DEF_NAME_WITH_PREFIX}'s party is protected\nby SAFEGUARD!");
const u8 gUnknown_83FB9FF[] = _("{B_ATK_PREFIX3}'s party is no longer\nprotected by SAFEGUARD!");
const u8 gUnknown_83FBA2F[] = _("{B_ATK_NAME_WITH_PREFIX} went\nto sleep!");
const u8 gUnknown_83FBA41[] = _("{B_ATK_NAME_WITH_PREFIX} slept and\nbecame healthy!");
const u8 gUnknown_83FBA5E[] = _("{B_ATK_NAME_WITH_PREFIX} whipped\nup a whirlwind!");
const u8 gUnknown_83FBA79[] = _("{B_ATK_NAME_WITH_PREFIX} took\nin sunlight!");
const u8 gUnknown_83FBA8E[] = _("{B_ATK_NAME_WITH_PREFIX} lowered\nits head!");
const u8 gUnknown_83FBAA3[] = _("{B_ATK_NAME_WITH_PREFIX} is glowing!");
const u8 gUnknown_83FBAB2[] = _("{B_ATK_NAME_WITH_PREFIX} flew\nup high!");
const u8 gUnknown_83FBAC3[] = _("{B_ATK_NAME_WITH_PREFIX} dug a hole!");
const u8 gUnknown_83FBAD2[] = _("{B_ATK_NAME_WITH_PREFIX} hid\nunderwater!");
const u8 gUnknown_83FBAE5[] = _("{B_ATK_NAME_WITH_PREFIX} sprang up!");
const u8 gUnknown_83FBAF3[] = _("{B_DEF_NAME_WITH_PREFIX} was squeezed by\n{B_ATK_NAME_WITH_PREFIX}'s BIND!");
const u8 gUnknown_83FBB11[] = _("{B_DEF_NAME_WITH_PREFIX} was trapped\nin the vortex!");
const u8 gUnknown_83FBB2F[] = _("{B_DEF_NAME_WITH_PREFIX} was trapped\nby SAND TOMB!");
const u8 gUnknown_83FBB4C[] = _("{B_DEF_NAME_WITH_PREFIX} was WRAPPED by\n{B_ATK_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FBB62[] = _("{B_ATK_NAME_WITH_PREFIX} CLAMPED\n{B_DEF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FBB71[] = _("{B_ATK_NAME_WITH_PREFIX} is hurt\nby {B_BUFF1}!");
const u8 gUnknown_83FBB83[] = _("{B_ATK_NAME_WITH_PREFIX} was freed\nfrom {B_BUFF1}!");
const u8 gUnknown_83FBB99[] = _("{B_ATK_NAME_WITH_PREFIX} kept going\nand crashed!");
const u8 gBattleText_MistShroud[] = _("{B_ATK_PREFIX2} became\nshrouded in MIST!");
const u8 gUnknown_83FBBD0[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX} is protected\nby MIST!");
const u8 gBattleText_GetPumped[] = _("{B_ATK_NAME_WITH_PREFIX} is getting\npumped!");
const u8 gUnknown_83FBBFF[] = _("{B_ATK_NAME_WITH_PREFIX} is hit\nwith recoil!");
const u8 gUnknown_83FBC16[] = _("{B_ATK_NAME_WITH_PREFIX} protected\nitself!");
const u8 gUnknown_83FBC2B[] = _("{B_ATK_NAME_WITH_PREFIX} is buffeted\nby the sandstorm!");
const u8 gUnknown_83FBC4C[] = _("{B_ATK_NAME_WITH_PREFIX} is pelted\nby HAIL!");
const u8 gUnknown_83FBC62[] = _("{B_ATK_PREFIX1}'s {B_BUFF1}\nwore off!");
const u8 gUnknown_83FBC74[] = _("{B_DEF_NAME_WITH_PREFIX} was seeded!");
const u8 gUnknown_83FBC83[] = _("{B_DEF_NAME_WITH_PREFIX} evaded\nthe attack!");
const u8 gUnknown_83FBC99[] = _("{B_ATK_NAME_WITH_PREFIX}'s health is\nsapped by LEECH SEED!");
const u8 gUnknown_83FBCBE[] = _("{B_ATK_NAME_WITH_PREFIX} is fast\nasleep.");
const u8 gUnknown_83FBCD1[] = _("{B_ATK_NAME_WITH_PREFIX} woke up!");
const u8 gUnknown_83FBCDD[] = _("But {B_SCR_ACTIVE_NAME_WITH_PREFIX}'s UPROAR\nkept it awake!");
const u8 gUnknown_83FBCFC[] = _("{B_ATK_NAME_WITH_PREFIX} woke up\nin the UPROAR!");
const u8 gUnknown_83FBD16[] = _("{B_ATK_NAME_WITH_PREFIX} caused\nan UPROAR!");
const u8 gUnknown_83FBD2B[] = _("{B_ATK_NAME_WITH_PREFIX} is making\nan UPROAR!");
const u8 gUnknown_83FBD43[] = _("{B_ATK_NAME_WITH_PREFIX} calmed down.");
const u8 gUnknown_83FBD53[] = _("But {B_DEF_NAME_WITH_PREFIX} can't\nsleep in an UPROAR!");
const u8 gUnknown_83FBD74[] = _("{B_ATK_NAME_WITH_PREFIX} STOCKPILED\n{B_BUFF1}!");
const u8 gUnknown_83FBD86[] = _("{B_ATK_NAME_WITH_PREFIX} can't\nSTOCKPILE any more!");
const u8 gUnknown_83FBDA3[] = _("But {B_DEF_NAME_WITH_PREFIX} can't\nsleep in an UPROAR!");
const u8 gUnknown_83FBDC4[] = _("But the UPROAR kept\n{B_DEF_NAME_WITH_PREFIX} awake!");
const u8 gUnknown_83FBDE2[] = _("{B_DEF_NAME_WITH_PREFIX} stayed awake\nusing its {B_DEF_ABILITY}!");
const u8 gUnknown_83FBE00[] = _("{B_ATK_NAME_WITH_PREFIX} is storing\nenergy!");
const u8 gUnknown_83FBE16[] = _("{B_ATK_NAME_WITH_PREFIX} unleashed\nenergy!");
const u8 gUnknown_83FBE2B[] = _("{B_ATK_NAME_WITH_PREFIX} became\nconfused due to fatigue!");
const u8 gUnknown_83FBE4E[] = _("{B_PLAYER_NAME} picked up\n¥{B_BUFF1}!\p");
const u8 gUnknown_83FBE61[] = _("{B_DEF_NAME_WITH_PREFIX} is\nunaffected!");
const u8 gUnknown_83FBE73[] = _("{B_ATK_NAME_WITH_PREFIX} transformed\ninto {B_BUFF1}!");
const u8 gUnknown_83FBE8B[] = _("{B_ATK_NAME_WITH_PREFIX} made\na SUBSTITUTE!");
const u8 gUnknown_83FBEA1[] = _("{B_ATK_NAME_WITH_PREFIX} already\nhas a SUBSTITUTE!");
const u8 gUnknown_83FBEBE[] = _("The SUBSTITUTE took damage\nfor {B_DEF_NAME_WITH_PREFIX}!\p");
const u8 gUnknown_83FBEE2[] = _("{B_DEF_NAME_WITH_PREFIX}'s\nSUBSTITUTE faded!\p");
const u8 gUnknown_83FBEFA[] = _("{B_ATK_NAME_WITH_PREFIX} must\nrecharge!");
const u8 gUnknown_83FBF0C[] = _("{B_DEF_NAME_WITH_PREFIX}'s RAGE\nis building!");
const u8 gUnknown_83FBF23[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_BUFF1}\nwas disabled!");
const u8 gUnknown_83FBF39[] = _("{B_ATK_NAME_WITH_PREFIX} is disabled\nno more!");
const u8 gUnknown_83FBF51[] = _("{B_DEF_NAME_WITH_PREFIX} got\nan ENCORE!");
const u8 gUnknown_83FBF63[] = _("{B_ATK_NAME_WITH_PREFIX}'s ENCORE\nended!");
const u8 gUnknown_83FBF76[] = _("{B_ATK_NAME_WITH_PREFIX} took aim\nat {B_DEF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FBF89[] = _("{B_ATK_NAME_WITH_PREFIX} SKETCHED\n{B_BUFF1}!");
const u8 gUnknown_83FBF99[] = _("{B_ATK_NAME_WITH_PREFIX} is trying\nto take its foe with it!");
const u8 gUnknown_83FBFBF[] = _("{B_DEF_NAME_WITH_PREFIX} took\n{B_ATK_NAME_WITH_PREFIX} with it!");
const u8 gUnknown_83FBFD3[] = _("Reduced {B_DEF_NAME_WITH_PREFIX}'s\n{B_BUFF1} by {B_BUFF2}!");
const u8 gUnknown_83FBFEA[] = _("{B_ATK_NAME_WITH_PREFIX} stole\n{B_DEF_NAME_WITH_PREFIX}'s {B_LAST_ITEM}!");
const u8 gUnknown_83FBFFC[] = _("{B_DEF_NAME_WITH_PREFIX} can't\nescape now!");
const u8 gUnknown_83FC011[] = _("{B_DEF_NAME_WITH_PREFIX} fell into\na NIGHTMARE!");
const u8 gUnknown_83FC02B[] = _("{B_ATK_NAME_WITH_PREFIX} is locked\nin a NIGHTMARE!");
const u8 gUnknown_83FC048[] = _("{B_ATK_NAME_WITH_PREFIX} cut its own HP and\nlaid a CURSE on {B_DEF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FC072[] = _("{B_ATK_NAME_WITH_PREFIX} is afflicted\nby the CURSE!");
const u8 gUnknown_83FC090[] = _("SPIKES were scattered all around\nthe opponent's side!");
const u8 gUnknown_83FC0C6[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX} is hurt\nby SPIKES!");
const u8 gUnknown_83FC0DC[] = _("{B_ATK_NAME_WITH_PREFIX} identified\n{B_DEF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FC0EE[] = _("{B_ATK_NAME_WITH_PREFIX}'s PERISH count\nfell to {B_BUFF1}!");
const u8 gUnknown_83FC10C[] = _("{B_ATK_NAME_WITH_PREFIX} braced\nitself!");
const u8 gUnknown_83FC11E[] = _("{B_DEF_NAME_WITH_PREFIX} ENDURED\nthe hit!");
const u8 gUnknown_83FC132[] = _("MAGNITUDE {B_BUFF1}!");
const u8 gUnknown_83FC140[] = _("{B_ATK_NAME_WITH_PREFIX} cut its own HP\nand maximized ATTACK!");
const u8 gUnknown_83FC168[] = _("{B_ATK_NAME_WITH_PREFIX} copied\n{B_DEF_NAME_WITH_PREFIX}'s stat changes!");
const u8 gUnknown_83FC185[] = _("{B_ATK_NAME_WITH_PREFIX} got free of\n{B_DEF_NAME_WITH_PREFIX}'s {B_BUFF1}!");
const u8 gUnknown_83FC19D[] = _("{B_ATK_NAME_WITH_PREFIX} shed\nLEECH SEED!");
const u8 gUnknown_83FC1B1[] = _("{B_ATK_NAME_WITH_PREFIX} blew away\nSPIKES!");
const u8 gUnknown_83FC1C6[] = _("{B_ATK_NAME_WITH_PREFIX} fled from\nbattle!");
const u8 gUnknown_83FC1DB[] = _("{B_ATK_NAME_WITH_PREFIX} foresaw\nan attack!");
const u8 gUnknown_83FC1F1[] = _("{B_DEF_NAME_WITH_PREFIX} took the\n{B_BUFF1} attack!");
const u8 gUnknown_83FC208[] = _("{B_ATK_NAME_WITH_PREFIX} chose\n{B_CURRENT_MOVE} as its destiny!");
const u8 gUnknown_83FC224[] = _("{B_BUFF1}'s attack!");
const u8 gUnknown_83FC231[] = _("{B_ATK_NAME_WITH_PREFIX} became the\ncenter of attention!");
const u8 gUnknown_83FC254[] = _("{B_ATK_NAME_WITH_PREFIX} began\ncharging power!");
const u8 gUnknown_83FC26D[] = _("NATURE POWER turned into\n{B_CURRENT_MOVE}!");
const u8 gUnknown_83FC28A[] = _("{B_ATK_NAME_WITH_PREFIX}'s status\nreturned to normal!");
const u8 gUnknown_83FC2AA[] = _("{B_DEF_NAME_WITH_PREFIX} was subjected\nto TORMENT!");
const u8 gUnknown_83FC2C7[] = _("{B_ATK_NAME_WITH_PREFIX} is tightening\nits focus!");
const u8 gUnknown_83FC2E3[] = _("{B_DEF_NAME_WITH_PREFIX} fell for\nthe TAUNT!");
const u8 gUnknown_83FC2FA[] = _("{B_ATK_NAME_WITH_PREFIX} is ready to\nhelp {B_DEF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FC312[] = _("{B_ATK_NAME_WITH_PREFIX} switched\nitems with its opponent!");
const u8 gUnknown_83FC337[] = _("{B_ATK_NAME_WITH_PREFIX} obtained\n{B_BUFF1}.");
const u8 gUnknown_83FC347[] = _("{B_DEF_NAME_WITH_PREFIX} obtained\n{B_BUFF2}.");
const u8 gUnknown_83FC357[] = _("{B_ATK_NAME_WITH_PREFIX} obtained\n{B_BUFF1}.\p{B_DEF_NAME_WITH_PREFIX} obtained\n{B_BUFF2}.");
const u8 gUnknown_83FC377[] = _("{B_ATK_NAME_WITH_PREFIX} copied\n{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}!");
const u8 gUnknown_83FC38A[] = _("{B_ATK_NAME_WITH_PREFIX} made a WISH!");
const u8 gUnknown_83FC39A[] = _("{B_BUFF1}'s WISH\ncame true!");
const u8 gUnknown_83FC3AF[] = _("{B_ATK_NAME_WITH_PREFIX} planted its roots!");
const u8 gUnknown_83FC3C5[] = _("{B_ATK_NAME_WITH_PREFIX} absorbed\nnutrients with its roots!");
const u8 gUnknown_83FC3EB[] = _("{B_DEF_NAME_WITH_PREFIX} anchored\nitself with its roots!");
const u8 gUnknown_83FC40E[] = _("{B_ATK_NAME_WITH_PREFIX} made\n{B_DEF_NAME_WITH_PREFIX} drowsy!");
const u8 gUnknown_83FC421[] = _("{B_ATK_NAME_WITH_PREFIX} knocked off\n{B_DEF_NAME_WITH_PREFIX}'s {B_LAST_ITEM}!");
const u8 gUnknown_83FC439[] = _("{B_ATK_NAME_WITH_PREFIX} swapped abilities\nwith its opponent!");
const u8 gUnknown_83FC461[] = _("{B_ATK_NAME_WITH_PREFIX} sealed the\nopponent's moveシsス!");
const u8 gUnknown_83FC483[] = _("{B_ATK_NAME_WITH_PREFIX} wants the\nopponent to bear a GRUDGE!");
const u8 gUnknown_83FC4AB[] = _("{B_ATK_NAME_WITH_PREFIX}'s {B_BUFF1} lost\nall its PP due to the GRUDGE!");
const u8 gUnknown_83FC4D6[] = _("{B_ATK_NAME_WITH_PREFIX} shrouded\nitself in {B_CURRENT_MOVE}!");
const u8 gUnknown_83FC4F0[] = _("{B_ATK_NAME_WITH_PREFIX}'s {B_CURRENT_MOVE}\nwas bounced back by MAGIC COAT!");
const u8 gUnknown_83FC518[] = _("{B_ATK_NAME_WITH_PREFIX} waits for its foe\nto make a move!");
const u8 gUnknown_83FC53D[] = _("{B_DEF_NAME_WITH_PREFIX} SNATCHED\n{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s move!");
const u8 gUnknown_83FC554[] = _("Electricity's power was\nweakened!");
const u8 gUnknown_83FC576[] = _("Fire's power was\nweakened!");
const u8 gUnknown_83FC591[] = _("{B_ATK_NAME_WITH_PREFIX} found\none {B_LAST_ITEM}!");
const u8 gUnknown_83FC5A2[] = _("A soothing aroma wafted\nthrough the area!");
const u8 gUnknown_83FC5CC[] = _("Items can't be used now.{PAUSE 64}");
const u8 gUnknown_83FC5E8[] = _("For {B_SCR_ACTIVE_NAME_WITH_PREFIX},\n{B_LAST_ITEM} {B_BUFF1}");
const u8 gUnknown_83FC5F6[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX} used\n{B_LAST_ITEM} to hustle!");
const u8 gUnknown_83FC60C[] = _("{B_ATK_NAME_WITH_PREFIX} lost its\nfocus and couldn't move!");
const u8 gUnknown_83FC631[] = _("{B_DEF_NAME_WITH_PREFIX} was\ndragged out!\p");
const u8 gUnknown_83FC646[] = _("The wall shattered!");
const u8 gUnknown_83FC65A[] = _("But it had no effect!");
const u8 gUnknown_83FC670[] = _("{B_ACTIVE_NAME_WITH_PREFIX} has no\nmoves left!\p");
const u8 gUnknown_83FC687[] = _("{B_ACTIVE_NAME_WITH_PREFIX}'s {B_CURRENT_MOVE}\nis disabled!\p");
const u8 gUnknown_83FC69D[] = _("{B_ACTIVE_NAME_WITH_PREFIX} can't use the same\nmove in a row due to the TORMENT!\p");
const u8 gUnknown_83FC6D6[] = _("{B_ACTIVE_NAME_WITH_PREFIX} can't use\n{B_CURRENT_MOVE} after the TAUNT!\p");
const u8 gUnknown_83FC6F8[] = _("{B_ACTIVE_NAME_WITH_PREFIX} can't use the\nsealed {B_CURRENT_MOVE}!\p");
const u8 gUnknown_83FC715[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nmade it rain!");
const u8 gUnknown_83FC72B[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nraised its SPEED!");
const u8 gUnknown_83FC745[] = _("{B_DEF_NAME_WITH_PREFIX} was protected\nby {B_DEF_ABILITY}!");
const u8 gUnknown_83FC75D[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nprevents {B_ATK_NAME_WITH_PREFIX}\lfrom using {B_CURRENT_MOVE}!");
const u8 gUnknown_83FC780[] = _("{B_DEF_NAME_WITH_PREFIX} restored HP\nusing its {B_DEF_ABILITY}!");
const u8 gUnknown_83FC79D[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nmade {B_CURRENT_MOVE} useless!");
const u8 gUnknown_83FC7B6[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nmade it the {B_BUFF1} type!");
const u8 gUnknown_83FC7D3[] = _("{B_EFF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nprevents paralysis!");
const u8 gUnknown_83FC7EF[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nprevents romance!");
const u8 gUnknown_83FC809[] = _("{B_EFF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nprevents poisoning!");
const u8 gUnknown_83FC825[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nprevents confusion!");
const u8 gUnknown_83FC841[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nraised its FIRE power!");
const u8 gUnknown_83FC860[] = _("{B_DEF_NAME_WITH_PREFIX} anchors\nitself with {B_DEF_ABILITY}!");
const u8 gUnknown_83FC87B[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\ncuts {B_DEF_NAME_WITH_PREFIX}'s ATTACK!");
const u8 gUnknown_83FC895[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nprevents stat loss!");
const u8 gUnknown_83FC8B1[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nhurt {B_ATK_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FC8C2[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX} TRACED\n{B_BUFF1}'s {B_BUFF2}!");
const u8 gUnknown_83FC8D5[] = _("{B_EFF_NAME_WITH_PREFIX}'s {B_EFF_ABILITY}\nprevents burns!");
const u8 gUnknown_83FC8ED[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nblocks {B_CURRENT_MOVE}!");
const u8 gUnknown_83FC900[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nblocks {B_CURRENT_MOVE}!");
const u8 gUnknown_83FC913[] = _("{B_ATK_NAME_WITH_PREFIX}'s {B_ATK_ABILITY}\nrestored its HP a little!");
const u8 gUnknown_83FC935[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nwhipped up a sandstorm!");
const u8 gUnknown_83FC955[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nintensified the sun's rays!");
const u8 gUnknown_83FC979[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nprevents {B_BUFF1} loss!");
const u8 gUnknown_83FC993[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\ninfatuated {B_ATK_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FC9AA[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nmade {B_CURRENT_MOVE} ineffective!");
const u8 gUnknown_83FC9C7[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\ncured its {B_BUFF1} problem!");
const u8 gUnknown_83FC9E5[] = _("It sucked up the\nLIQUID OOZE!");
const u8 gUnknown_83FCA03[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX} transformed!");
const u8 gUnknown_83FCA13[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\ntook the attack!");
const u8 gText_PkmnsXPreventsSwitching[] = _("{B_BUFF1}'s {B_LAST_ABILITY}\nprevents switching!\p");
const u8 gUnknown_83FCA49[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_DEF_ABILITY}\nprevented {B_SCR_ACTIVE_NAME_WITH_PREFIX}'s\l{B_BUFF1} from working!");
const u8 gUnknown_83FCA71[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nmade it ineffective!");
const u8 gUnknown_83FCA8E[] = _("{B_EFF_NAME_WITH_PREFIX}'s {B_EFF_ABILITY}\nprevents flinching!");
const u8 gUnknown_83FCAAA[] = _("{B_ATK_NAME_WITH_PREFIX}'s {B_ATK_ABILITY}\nprevents {B_DEF_NAME_WITH_PREFIX}'s\l{B_DEF_ABILITY} from working!");
const u8 gUnknown_83FCAD1[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\ncured its {B_BUFF1} problem!");
const u8 gUnknown_83FCAEF[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_SCR_ACTIVE_ABILITY}\nhad no effect on {B_EFF_NAME_WITH_PREFIX}!");
const u8 gUnknown_83FCB0C[] = _("{B_ATK_NAME_WITH_PREFIX} is too scared to move!");
const u8 gUnknown_83FCB26[] = _("GHOST: Get out…… Get out……");
const u8 gUnknown_83FCB41[] = _("sharply ");
const u8 gBattleText_Rose[] = _("rose!");
const u8 gUnknown_83FCB50[] = _("harshly ");
const u8 gUnknown_83FCB59[] = _("fell!");
const u8 gUnknown_83FCB5F[] = _("{B_ATK_NAME_WITH_PREFIX}'s {B_BUFF1}\n{B_BUFF2}");
const u8 gBattleText_UnknownString3[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_BUFF1}\n{B_BUFF2}");
const u8 gUnknown_83FCB75[] = _("Using {B_LAST_ITEM}, the {B_BUFF1}\nof {B_SCR_ACTIVE_NAME_WITH_PREFIX} {B_BUFF2}");
const u8 gUnknown_83FCB8F[] = _("{B_ATK_NAME_WITH_PREFIX}'s {B_BUFF1}\n{B_BUFF2}");
const u8 gUnknown_83FCB9A[] = _("{B_DEF_NAME_WITH_PREFIX}'s {B_BUFF1}\n{B_BUFF2}");
const u8 gUnknown_83FCBA5[] = _("{B_ATK_NAME_WITH_PREFIX}'s stats won't\ngo any higher!");
const u8 gUnknown_83FCBC5[] = _("{B_DEF_NAME_WITH_PREFIX}'s stats won't\ngo any lower!");
const u8 gUnknown_83FCBE4[] = _("A critical hit!");
const u8 gUnknown_83FCBF4[] = _("It's a one-hit KO!");
const u8 gUnknown_83FCC07[] = _("{PAUSE 32}1, {PAUSE 15}2, and{PAUSE 15}… {PAUSE 15}… {PAUSE 15}… {PAUSE 15}{PLAY_SE SE_KON}Poof!\p");
const u8 gUnknown_83FCC33[] = _("And…\p");
const u8 gUnknown_83FCC39[] = _("HM moves can't be\nforgotten now.\p");
const u8 gUnknown_83FCC5B[] = _("It's not very effective…");
const u8 gUnknown_83FCC74[] = _("It's super effective!");
static const u8 sText_GotAwaySafely[] = _("{PLAY_SE SE_NIGERU}Got away safely!\p");
const u8 gUnknown_83FCCA0[] = _("{PLAY_SE SE_NIGERU}{B_ATK_NAME_WITH_PREFIX} fled\nusing its {B_LAST_ITEM}!\p");
const u8 gUnknown_83FCCBB[] = _("{PLAY_SE SE_NIGERU}{B_ATK_NAME_WITH_PREFIX} fled\nusing {B_ATK_ABILITY}!\p");
const u8 gUnknown_83FCCD2[] = _("{PLAY_SE SE_NIGERU}Wild {B_BUFF1} fled!");
static const u8 sText_PlayerDefeatedLinkTrainer[] = _("Player defeated\n{B_LINK_OPPONENT1_NAME}!");
static const u8 sText_TwoLinkTrainersDefeated[] = _("Player beat {B_LINK_OPPONENT1_NAME}\nand {B_LINK_OPPONENT2_NAME}!");
static const u8 sText_PlayerLostAgainstLinkTrainer[] = _("Player lost against\n{B_LINK_OPPONENT1_NAME}!");
static const u8 sText_PlayerLostToTwo[] = _("Player lost to {B_LINK_OPPONENT1_NAME}\nand {B_LINK_OPPONENT2_NAME}!");
static const u8 sText_PlayerBattledToDrawLinkTrainer[] = _("Player battled to a draw against\n{B_LINK_OPPONENT1_NAME}!");
static const u8 sText_PlayerBattledToDrawVsTwo[] = _("Player battled to a draw against\n{B_LINK_OPPONENT1_NAME} and {B_LINK_OPPONENT2_NAME}!");
const u8 gUnknown_83FCD92[] = _("{PLAY_SE SE_NIGERU}{B_LINK_OPPONENT1_NAME} fled!");
static const u8 sText_TwoWildFled[] = _("{PLAY_SE SE_NIGERU}{B_LINK_OPPONENT1_NAME} and\n{B_LINK_OPPONENT2_NAME} fled!");
const u8 gUnknown_83FCDB3[] = _("No! There's no running\nfrom a TRAINER battle!\p");
const u8 gUnknown_83FCDE2[] = _("Can't escape!\p");
const u8 gUnknown_83FCDF1[] = _("");
const u8 gUnknown_83FCDF2[] = _("But nothing happened!");
const u8 gUnknown_83FCE08[] = _("But it failed!");
const u8 gUnknown_83FCE17[] = _("It hurt itself in its\nconfusion!");
const u8 gUnknown_83FCE38[] = _("The MIRROR MOVE failed!");
const u8 gUnknown_83FCE50[] = _("It started to rain!");
const u8 gUnknown_83FCE64[] = _("A downpour started!");
const u8 gUnknown_83FCE78[] = _("Rain continues to fall.");
const u8 gUnknown_83FCE90[] = _("The downpour continues.");
const u8 gUnknown_83FCEA8[] = _("The rain stopped.");
const u8 gUnknown_83FCEBA[] = _("A sandstorm brewed!");
const u8 gUnknown_83FCECE[] = _("The sandstorm rages.");
const u8 gUnknown_83FCEE3[] = _("The sandstorm subsided.");
const u8 gUnknown_83FCEFB[] = _("The sunlight got bright!");
const u8 gUnknown_83FCF14[] = _("The sunlight is strong.");
const u8 gUnknown_83FCF2C[] = _("The sunlight faded.");
const u8 gUnknown_83FCF40[] = _("It started to hail!");
const u8 gUnknown_83FCF54[] = _("Hail continues to fall.");
const u8 gUnknown_83FCF6C[] = _("The hail stopped.");
const u8 gUnknown_83FCF7E[] = _("But it failed to SPIT UP\na thing!");
const u8 gUnknown_83FCFA0[] = _("But it failed to SWALLOW\na thing!");
const u8 gUnknown_83FCFC2[] = _("The wind turned into a\nHEAT WAVE!");
const u8 gUnknown_83FCFE4[] = _("All stat changes were\neliminated!");
const u8 gUnknown_83FD006[] = _("Coins scattered everywhere!");
const u8 gUnknown_83FD022[] = _("It was too weak to make\na SUBSTITUTE!");
const u8 gUnknown_83FD048[] = _("The battlers shared\ntheir pain!");
const u8 gUnknown_83FD068[] = _("A bell chimed!");
const u8 gUnknown_83FD077[] = _("All affected POKéMON will\nfaint in three turns!");
const u8 gUnknown_83FD0A7[] = _("There's no PP left for\nthis move!\p");
const u8 gUnknown_83FD0CA[] = _("But there was no PP left\nfor the move!");
const u8 gUnknown_83FD0F1[] = _("{B_ATK_NAME_WITH_PREFIX} ignored\norders while asleep!");
const u8 gUnknown_83FD111[] = _("{B_ATK_NAME_WITH_PREFIX} ignored\norders!");
const u8 gUnknown_83FD124[] = _("{B_ATK_NAME_WITH_PREFIX} began to nap!");
const u8 gUnknown_83FD135[] = _("{B_ATK_NAME_WITH_PREFIX} is\nloafing around!");
const u8 gUnknown_83FD14B[] = _("{B_ATK_NAME_WITH_PREFIX} won't\nobey!");
const u8 gUnknown_83FD15A[] = _("{B_ATK_NAME_WITH_PREFIX} turned away!");
const u8 gUnknown_83FD16A[] = _("{B_ATK_NAME_WITH_PREFIX} pretended\nnot to notice!");
const u8 gUnknown_83FD186[] = _("{B_TRAINER1_CLASS} {B_TRAINER1_NAME} is\nabout to use {B_BUFF2}.\pWill {B_PLAYER_NAME} change\nPOKéMON?");
const u8 gUnknown_83FD1B8[] = _("{B_ATK_NAME_WITH_PREFIX} learned\n{B_BUFF1}!");
static const u8 sText_PlayerDefeatedLinkTrainerTrainer1[] = _("Player defeated\n{B_TRAINER1_CLASS} {B_TRAINER1_NAME}!\p");
const u8 gUnknown_83FD1DF[] = _("{B_PLAYER_NAME} threw a ROCK\nat the {B_OPPONENT_MON1_NAME}!");
const u8 gUnknown_83FD1FA[] = _("{B_PLAYER_NAME} threw some BAIT\nat the {B_OPPONENT_MON1_NAME}!");
const u8 gUnknown_83FD218[] = _("{B_OPPONENT_MON1_NAME} is watching\ncarefully!");
const u8 gUnknown_83FD232[] = _("{B_OPPONENT_MON1_NAME} is angry!");
const u8 gUnknown_83FD23F[] = _("{B_OPPONENT_MON1_NAME} is eating!");
const u8 gUnknown_83FD24D[] = _("{PLAY_SE SE_PINPON}ANNOUNCER: You're out of\nSAFARI BALLS! Game over!\p");
static const u8 sText_WildPkmnAppeared[] = _("Wild {B_OPPONENT_MON1_NAME} appeared!\p");
static const u8 sText_WildPkmnAppeared2[] = _("Wild {B_OPPONENT_MON1_NAME} appeared!\p");
static const u8 sText_WildPkmnAppearedPause[] = _("Wild {B_OPPONENT_MON1_NAME} appeared!{PAUSE 127}");
static const u8 sText_TwoWildPkmnAppeared[] = _("Wild {B_OPPONENT_MON1_NAME} and\n{B_OPPONENT_MON2_NAME} appeared!\p");
const u8 gUnknown_83FD2D9[] = _("The GHOST appeared!\pDarn!\nThe GHOST can't be ID'd!\p");
const u8 gUnknown_83FD30D[] = _("The GHOST appeared!\p");
const u8 gUnknown_83FD322[] = _("SILPH SCOPE unveiled the GHOST's\nidentity!");
const u8 gUnknown_83FD34D[] = _("The GHOST was MAROWAK!\p\n");
static const u8 sText_Trainer1WantsToBattle[] = _("{B_TRAINER1_CLASS} {B_TRAINER1_NAME}\nwould like to battle!\p");
static const u8 sText_LinkTrainerWantsToBattle[] = _("{B_LINK_OPPONENT1_NAME}\nwants to battle!");
static const u8 sText_TwoLinkTrainersWantToBattle[] = _("{B_LINK_OPPONENT1_NAME} and {B_LINK_OPPONENT2_NAME}\nwant to battle!");
static const u8 sText_Trainer1SentOutPkmn[] = _("{B_TRAINER1_CLASS} {B_TRAINER1_NAME} sent\nout {B_OPPONENT_MON1_NAME}!{PAUSE 60}");
static const u8 sText_Trainer1SentOutTwoPkmn[] = _("{B_TRAINER1_CLASS} {B_TRAINER1_NAME} sent\nout {B_OPPONENT_MON1_NAME} and {B_OPPONENT_MON2_NAME}!{PAUSE 60}");
static const u8 sText_Trainer1SentOutPkmn2[] = _("{B_TRAINER1_CLASS} {B_TRAINER1_NAME} sent\nout {B_BUFF1}!");
static const u8 sText_LinkTrainerSentOutPkmn[] = _("{B_LINK_OPPONENT1_NAME} sent out\n{B_OPPONENT_MON1_NAME}!");
static const u8 sText_LinkTrainerSentOutTwoPkmn[] = _("{B_LINK_OPPONENT1_NAME} sent out\n{B_OPPONENT_MON1_NAME} and {B_OPPONENT_MON2_NAME}!");
static const u8 sText_TwoLinkTrainersSentOutPkmn[] = _("{B_LINK_OPPONENT1_NAME} sent out {B_LINK_OPPONENT_MON1_NAME}!\n{B_LINK_OPPONENT2_NAME} sent out {B_LINK_OPPONENT_MON2_NAME}!");
static const u8 sText_LinkTrainerSentOutPkmn2[] = _("{B_LINK_OPPONENT1_NAME} sent out\n{B_BUFF1}!");
static const u8 sText_LinkTrainerMultiSentOutPkmn[] = _("{B_LINK_SCR_TRAINER_NAME} sent out\n{B_BUFF1}!");
static const u8 sText_GoPkmn[] = _("Go! {B_PLAYER_MON1_NAME}!");
static const u8 sText_GoTwoPkmn[] = _("Go! {B_PLAYER_MON1_NAME} and\n{B_PLAYER_MON2_NAME}!");
static const u8 sText_GoPkmn2[] = _("Go! {B_BUFF1}!");
static const u8 sText_DoItPkmn[] = _("Do it! {B_BUFF1}!");
static const u8 sText_GoForItPkmn[] = _("Go for it, {B_BUFF1}!");
static const u8 sText_YourFoesWeakGetEmPkmn[] = _("Your foe's weak!\nGet 'em, {B_BUFF1}!");
static const u8 sText_LinkPartnerSentOutPkmnGoPkmn[] = _("{B_LINK_PARTNER_NAME} sent out {B_LINK_PLAYER_MON2_NAME}!\nGo! {B_LINK_PLAYER_MON1_NAME}!");
static const u8 sText_PkmnThatsEnough[] = _("{B_BUFF1}, that's enough!\nCome back!");
static const u8 sText_PkmnComeBack[] = _("{B_BUFF1}, come back!");
static const u8 sText_PkmnOkComeBack[] = _("{B_BUFF1}, OK!\nCome back!");
const u8 sText_PkmnGoodComeBack[] = _("{B_BUFF1}, good!\nCome back!");
static const u8 sText_Trainer1WithdrewPkmn[] = _("{B_TRAINER1_CLASS} {B_TRAINER1_NAME}\nwithdrew {B_BUFF1}!");
static const u8 sText_LinkTrainer1WithdrewPkmn[] = _("{B_LINK_OPPONENT1_NAME} withdrew\n{B_BUFF1}!");
static const u8 sText_LinkTrainer2WithdrewPkmn[] = _("{B_LINK_SCR_TRAINER_NAME} withdrew\n{B_BUFF1}!");
static const u8 sText_WildPkmnPrefix[] = _("Wild ");
static const u8 sText_FoePkmnPrefix[] = _("Foe ");
static const u8 sText_FoePkmnPrefix2[] = _("Foe");
static const u8 sText_AllyPkmnPrefix[] = _("Ally");
static const u8 sText_FoePkmnPrefix3[] = _("Foe");
static const u8 sText_AllyPkmnPrefix2[] = _("Ally");
static const u8 sText_FoePkmnPrefix4[] = _("Foe");
static const u8 sText_AllyPkmnPrefix3[] = _("Ally");
static const u8 sText_AttackerUsedX[] = _("{B_ATK_NAME_WITH_PREFIX} used\n{B_BUFF2}");
static const u8 sText_ExclamationMark[] = _("!");
static const u8 sText_ExclamationMark2[] = _("!");
static const u8 sText_ExclamationMark3[] = _("!");
static const u8 sText_ExclamationMark4[] = _("!");
static const u8 sText_ExclamationMark5[] = _("!");

static const u8 sText_HP2[] = _("HP");
static const u8 sText_Attack2[] = _("ATTACK");
static const u8 sText_Defense2[] = _("DEFENSE");
static const u8 sText_Speed[] = _("SPEED");
static const u8 sText_SpAtk2[] = _("SP. ATK");
static const u8 sText_SpDef2[] = _("SP. DEF");
static const u8 sText_Accuracy[] = _("accuracy");
static const u8 sText_Evasiveness[] = _("evasiveness");

const u8 *const gStatNamesTable[] = {
    sText_HP2,
    sText_Attack2,
    sText_Defense2,
    sText_Speed,
    sText_SpAtk2,
    sText_SpDef2,
    sText_Accuracy,
    sText_Evasiveness
};

static const u8 sText_PokeblockWasTooSpicy[] = _("was too spicy!"); //
static const u8 sText_PokeblockWasTooDry[] = _("was too dry!");
static const u8 sText_PokeblockWasTooSweet[] = _("was too sweet!");
static const u8 sText_PokeblockWasTooBitter[] = _("was too bitter!");
static const u8 sText_PokeblockWasTooSour[] = _("was too sour!");

const u8 *const gPokeblockWasTooXStringTable[] = {
    sText_PokeblockWasTooSpicy,
    sText_PokeblockWasTooDry,
    sText_PokeblockWasTooSweet,
    sText_PokeblockWasTooBitter,
    sText_PokeblockWasTooSour
};

static const u8 sText_PlayerUsedItem[] = _("{B_PLAYER_NAME} used\n{B_LAST_ITEM}!");
static const u8 sText_OldManUsedItem[] = _("The old man used\n{B_LAST_ITEM}!");
static const u8 sText_PokedudeUsedItem[] = _("The POKé DUDE used\n{B_LAST_ITEM}!");
static const u8 sText_Trainer1UsedItem[] = _("{B_TRAINER1_CLASS} {B_TRAINER1_NAME}\nused {B_LAST_ITEM}!");
static const u8 sText_TrainerBlockedBall[] = _("The TRAINER blocked the BALL!");
static const u8 sText_DontBeAThief[] = _("Don't be a thief!");
static const u8 sText_ItDodgedBall[] = _("It dodged the thrown BALL!\nThis POKéMON can't be caught!");
static const u8 sText_YouMissedPkmn[] = _("You missed the POKéMON!");
static const u8 sText_PkmnBrokeFree[] = _("Oh, no!\nThe POKéMON broke free!");
static const u8 sText_ItAppearedCaught[] = _("Aww!\nIt appeared to be caught!");
static const u8 sText_AarghAlmostHadIt[] = _("Aargh!\nAlmost had it!");
static const u8 sText_ShootSoClose[] = _("Shoot!\nIt was so close, too!");
const u8 gUnknown_83FD78A[] = _("よけられた!\nこいつは つかまりそうにないぞ!");
static const u8 sText_GotchaPkmnCaught[] = _("Gotcha!\n{B_OPPONENT_MON1_NAME} was caught!{WAIT_SE}{PLAY_BGM MUS_GET_YASEI}\p");
static const u8 sText_GotchaPkmnCaught2[] = _("Gotcha!\n{B_OPPONENT_MON1_NAME} was caught!{WAIT_SE}{PLAY_BGM MUS_GET_YASEI}{PAUSE 127}");
static const u8 sText_GiveNicknameCaptured[] = _("Give a nickname to the\ncaptured {B_OPPONENT_MON1_NAME}?");
static const u8 sText_PkmnSentToPC[] = _("{B_OPPONENT_MON1_NAME} was sent to\n{B_PC_CREATOR_NAME} PC.");
static const u8 sText_Someones[] = _("someone's");
static const u8 sText_Bills[] = _("BILL's");
const u8 gUnknown_83FD82B[] = _("{B_OPPONENT_MON1_NAME}'s data was\nadded to the POKéDEX.\p");
const u8 gUnknown_83FD850[] = _("It is raining.");
const u8 gUnknown_83FD85F[] = _("A sandstorm is raging.");
const u8 gUnknown_83FD876[] = _("The BOX is full!\nYou can't catch any more!\p");
static const u8 sText_EnigmaBerry[] = _("ENIGMA BERRY");
static const u8 sText_BerrySuffix[] = _(" BERRY");
const u8 gUnknown_83FD8B6[] = _("ナゾ");
const u8 gUnknown_83FD8B9[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\ncured paralysis!");
const u8 gUnknown_83FD8D2[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\ncured poison!");
const u8 gUnknown_83FD8E8[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nhealed its burn!");
const u8 gUnknown_83FD901[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\ndefrosted it!");
const u8 gUnknown_83FD917[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nwoke it from its sleep!");
const u8 gUnknown_83FD937[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nsnapped it out of confusion!");
const u8 gUnknown_83FD95C[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\ncured its {B_BUFF1} problem!");
const u8 gUnknown_83FD97A[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nnormalized its status!");
const u8 gUnknown_83FD999[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nrestored health!");
const u8 gUnknown_83FD9B2[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nrestored {B_BUFF1}'s PP!");
const u8 gUnknown_83FD9CC[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nrestored its status!");
const u8 gUnknown_83FD9E9[] = _("{B_SCR_ACTIVE_NAME_WITH_PREFIX}'s {B_LAST_ITEM}\nrestored its HP a little!");
const u8 gUnknown_83FDA0B[] = _("{B_LAST_ITEM}'s effect allows only\n{B_CURRENT_MOVE} to be used!\p");
const u8 gUnknown_83FDA33[] = _("{B_DEF_NAME_WITH_PREFIX} hung on\nusing its {B_LAST_ITEM}!");
const u8 gUnknown_83FDA4C[] = _("");
const u8 gUnknown_83FDA4D[] = _("{B_PLAYER_NAME} played the {B_LAST_ITEM}.\pNow, that's a catchy tune!");
const u8 gUnknown_83FDA7A[] = _("{B_PLAYER_NAME} played the\n{B_LAST_ITEM}.");
const u8 gUnknown_83FDA8C[] = _("The POKéMON hearing the FLUTE\nawoke!");
const u8 gUnknown_83FDAB1[] = _("You throw a BALL now, right?\nI… I'll do my best!");
const u8 gUnknown_83FDAE2[] = _("OAK: Oh, for Pete's sake…\nSo pushy, as always.\p{B_PLAYER_NAME}.\pYou've never had a POKéMON battle\nbefore, have you?\pA POKéMON battle is when TRAINERS\npit their POKéMON against each\lother.\p");
const u8 gUnknown_83FDB92[] = _("The TRAINER that makes the other\nTRAINER's POKéMON faint by lowering\ltheir HP to “0,” wins.\p");
const u8 gUnknown_83FDBEF[] = _("But rather than talking about it,\nyou'll learn more from experience.\pTry battling and see for yourself.\p");
const u8 gUnknown_83FDC58[] = _("OAK: Inflicting damage on the foe\nis the key to any battle.\p");
const u8 gUnknown_83FDC95[] = _("OAK: Lowering the foe's stats\nwill put you at an advantage.\p");
const u8 gUnknown_83FDCD2[] = _("OAK: Keep your eyes on your\nPOKéMON's HP.\pIt will faint if the HP drops to\n“0.”\p");
const u8 gUnknown_83FDD23[] = _("OAK: No! There's no running away\nfrom a TRAINER POKéMON battle!\p");
const u8 gUnknown_83FDD64[] = _("OAK: Hm! Excellent!\pIf you win, you earn prize money,\nand your POKéMON will grow!\pBattle other TRAINERS and make\nyour POKéMON strong!\p");
const u8 gUnknown_83FDDEB[] = _("OAK: Hm…\nHow disappointing…\pIf you win, you earn prize money,\nand your POKéMON grow.\pBut if you lose, {B_PLAYER_NAME}, you end\nup paying prize money…\pHowever, since you had no warning\nthis time, I'll pay for you.\pBut things won't be this way once\nyou step outside these doors.\pThat's why you must strengthen your\nPOKéMON by battling wild POKéMON.\p");

const u8 *const gBattleStringsTable[] = {
    gUnknown_83FB219,
    gUnknown_83FB265,
    gUnknown_83FB28E,
    gUnknown_83FB2A4,
    gUnknown_83FB2B6,
    gUnknown_83FB2D1,
    gUnknown_83FB2FC,
    gUnknown_83FB31F,
    gUnknown_83FB32E,
    gUnknown_83FB343,
    gUnknown_83FD1B8,
    gUnknown_83FB36B,
    gUnknown_83FB37F,
    gUnknown_83FCBA5,
    gUnknown_83FB394,
    gUnknown_83FB3EA,
    gUnknown_83FB400,
    gUnknown_83FB40D,
    gUnknown_83FB41A,
    gUnknown_83FB433,
    gUnknown_83FB451,
    gUnknown_83FB508,
    gUnknown_83FB545,
    gUnknown_83FB555,
    gUnknown_83FB565,
    gUnknown_83FB57C,
    gUnknown_83FB592,
    gUnknown_83FB5A8,
    gUnknown_83FB5BC,
    gUnknown_83FB5CD,
    gUnknown_83FB5E2,
    gUnknown_83FB5F8,
    gUnknown_83FB610,
    gUnknown_83FB626,
    gUnknown_83FB641,
    gUnknown_83FB650,
    gUnknown_83FB663,
    gUnknown_83FB692,
    gUnknown_83FB6A7,
    gUnknown_83FB6BF,
    gUnknown_83FB6D3,
    gUnknown_83FB6E5,
    gUnknown_83FB6F7,
    gUnknown_83FB70F,
    gUnknown_83FB73A,
    gUnknown_83FB76A,
    gUnknown_83FB78A,
    gUnknown_83FB7A3,
    gUnknown_83FB7BF,
    gUnknown_83FB7D5,
    gUnknown_83FB7EE,
    gUnknown_83FB806,
    gUnknown_83FB826,
    gUnknown_83FB844,
    gUnknown_83FB854,
    gUnknown_83FB871,
    gUnknown_83FB885,
    gUnknown_83FB89D,
    gUnknown_83FB8AE,
    gUnknown_83FB8C5,
    gUnknown_83FB8E0,
    gUnknown_83FB8F3,
    gUnknown_83FB914,
    gUnknown_83FB921,
    gUnknown_83FB935,
    gUnknown_83FB946,
    gUnknown_83FB97F,
    gUnknown_83FB9B8,
    gUnknown_83FB9D9,
    gUnknown_83FB9FF,
    gUnknown_83FBA2F,
    gUnknown_83FBA41,
    gUnknown_83FBA5E,
    gUnknown_83FBA79,
    gUnknown_83FBA8E,
    gUnknown_83FBAA3,
    gUnknown_83FBAB2,
    gUnknown_83FBAC3,
    gUnknown_83FBAF3,
    gUnknown_83FBB11,
    gUnknown_83FBB4C,
    gUnknown_83FBB62,
    gUnknown_83FBB71,
    gUnknown_83FBB83,
    gUnknown_83FBB99,
    gBattleText_MistShroud,
    gUnknown_83FBBD0,
    gBattleText_GetPumped,
    gUnknown_83FBBFF,
    gUnknown_83FBC16,
    gUnknown_83FBC2B,
    gUnknown_83FBC4C,
    gUnknown_83FBC74,
    gUnknown_83FBC83,
    gUnknown_83FBC99,
    gUnknown_83FBCBE,
    gUnknown_83FBCD1,
    gUnknown_83FBCDD,
    gUnknown_83FBCFC,
    gUnknown_83FBD16,
    gUnknown_83FBD2B,
    gUnknown_83FBD43,
    gUnknown_83FBD53,
    gUnknown_83FBD74,
    gUnknown_83FBD86,
    gUnknown_83FBDA3,
    gUnknown_83FBDC4,
    gUnknown_83FBDE2,
    gUnknown_83FBE00,
    gUnknown_83FBE16,
    gUnknown_83FBE2B,
    gUnknown_83FBE4E,
    gUnknown_83FBE61,
    gUnknown_83FBE73,
    gUnknown_83FBE8B,
    gUnknown_83FBEA1,
    gUnknown_83FBEBE,
    gUnknown_83FBEE2,
    gUnknown_83FBEFA,
    gUnknown_83FBF0C,
    gUnknown_83FBF23,
    gUnknown_83FC687,
    gUnknown_83FBF39,
    gUnknown_83FBF51,
    gUnknown_83FBF63,
    gUnknown_83FBF76,
    gUnknown_83FBF89,
    gUnknown_83FBF99,
    gUnknown_83FBFBF,
    gUnknown_83FBFD3,
    gUnknown_83FBFEA,
    gUnknown_83FBFFC,
    gUnknown_83FC011,
    gUnknown_83FC02B,
    gUnknown_83FC048,
    gUnknown_83FC072,
    gUnknown_83FC090,
    gUnknown_83FC0C6,
    gUnknown_83FC0DC,
    gUnknown_83FC0EE,
    gUnknown_83FC10C,
    gUnknown_83FC11E,
    gUnknown_83FC132,
    gUnknown_83FC140,
    gUnknown_83FC168,
    gUnknown_83FC185,
    gUnknown_83FC19D,
    gUnknown_83FC1B1,
    gUnknown_83FC1C6,
    gUnknown_83FC1DB,
    gUnknown_83FC1F1,
    gUnknown_83FC224,
    gUnknown_83FC231,
    gUnknown_83FC254,
    gUnknown_83FC26D,
    gUnknown_83FC28A,
    gUnknown_83FC670,
    gUnknown_83FC2AA,
    gUnknown_83FC69D,
    gUnknown_83FC2C7,
    gUnknown_83FC2E3,
    gUnknown_83FC6D6,
    gUnknown_83FC2FA,
    gUnknown_83FC312,
    gUnknown_83FC377,
    gUnknown_83FC38A,
    gUnknown_83FC39A,
    gUnknown_83FC3AF,
    gUnknown_83FC3C5,
    gUnknown_83FC3EB,
    gUnknown_83FC40E,
    gUnknown_83FC421,
    gUnknown_83FC439,
    gUnknown_83FC461,
    gUnknown_83FC6F8,
    gUnknown_83FC483,
    gUnknown_83FC4AB,
    gUnknown_83FC4D6,
    gUnknown_83FC4F0,
    gUnknown_83FC518,
    gUnknown_83FC53D,
    gUnknown_83FC715,
    gUnknown_83FC72B,
    gUnknown_83FC745,
    gUnknown_83FC75D,
    gUnknown_83FC780,
    gUnknown_83FC7B6,
    gUnknown_83FC7D3,
    gUnknown_83FC7EF,
    gUnknown_83FC809,
    gUnknown_83FC825,
    gUnknown_83FC841,
    gUnknown_83FC860,
    gUnknown_83FC87B,
    gUnknown_83FC895,
    gUnknown_83FC8B1,
    gUnknown_83FC8C2,
    gUnknown_83FCB41,
    gBattleText_Rose,
    gUnknown_83FCB50,
    gUnknown_83FCB59,
    gUnknown_83FCB5F,
    gBattleText_UnknownString3,
    gUnknown_83FCB8F,
    gUnknown_83FCB9A,
    gUnknown_83FCBE4,
    gUnknown_83FCBF4,
    gUnknown_83FCC07,
    gUnknown_83FCC33,
    gUnknown_83FCC5B,
    gUnknown_83FCC74,
    sText_GotAwaySafely,
    gUnknown_83FCCD2,
    gUnknown_83FCDB3,
    gUnknown_83FCDE2,
    gUnknown_83FCDF1,
    gUnknown_83FCDF2,
    gUnknown_83FCE08,
    gUnknown_83FCE17,
    gUnknown_83FCE38,
    gUnknown_83FCE50,
    gUnknown_83FCE64,
    gUnknown_83FCE78,
    gUnknown_83FCE90,
    gUnknown_83FCEA8,
    gUnknown_83FCEBA,
    gUnknown_83FCECE,
    gUnknown_83FCEE3,
    gUnknown_83FCEFB,
    gUnknown_83FCF14,
    gUnknown_83FCF2C,
    gUnknown_83FCF40,
    gUnknown_83FCF54,
    gUnknown_83FCF6C,
    gUnknown_83FCF7E,
    gUnknown_83FCFA0,
    gUnknown_83FCFC2,
    gUnknown_83FCFE4,
    gUnknown_83FD006,
    gUnknown_83FD022,
    gUnknown_83FD048,
    gUnknown_83FD068,
    gUnknown_83FD077,
    gUnknown_83FD0A7,
    gUnknown_83FD0CA,
    sText_PlayerUsedItem,
    sText_OldManUsedItem,
    sText_TrainerBlockedBall,
    sText_DontBeAThief,
    sText_ItDodgedBall,
    sText_YouMissedPkmn,
    sText_PkmnBrokeFree,
    sText_ItAppearedCaught,
    sText_AarghAlmostHadIt,
    sText_ShootSoClose,
    sText_GotchaPkmnCaught,
    sText_GotchaPkmnCaught2,
    sText_GiveNicknameCaptured,
    sText_PkmnSentToPC,
    gUnknown_83FD82B,
    gUnknown_83FD850,
    gUnknown_83FD85F,
    gUnknown_83FB525,
    gUnknown_83FD0F1,
    gUnknown_83FD111,
    gUnknown_83FD124,
    gUnknown_83FD135,
    gUnknown_83FD14B,
    gUnknown_83FD15A,
    gUnknown_83FD16A,
    gUnknown_83FD186,
    gUnknown_83FD1DF,
    gUnknown_83FD1FA,
    gUnknown_83FD218,
    gUnknown_83FD232,
    gUnknown_83FD23F,
    gUnknown_83FB218,
    gUnknown_83FB218,
    gUnknown_83FD24D,
    gUnknown_83FD8B9,
    gUnknown_83FD8D2,
    gUnknown_83FD8E8,
    gUnknown_83FD901,
    gUnknown_83FD917,
    gUnknown_83FD937,
    gUnknown_83FD95C,
    gUnknown_83FD999,
    gUnknown_83FD9B2,
    gUnknown_83FD9CC,
    gUnknown_83FD9E9,
    gUnknown_83FDA0B,
    gUnknown_83FDA33,
    gUnknown_83FDA4C,
    gUnknown_83FC8D5,
    gUnknown_83FC8ED,
    gUnknown_83FC913,
    gUnknown_83FC935,
    gUnknown_83FC979,
    gUnknown_83FC993,
    gUnknown_83FC9AA,
    gUnknown_83FC9C7,
    gUnknown_83FC9E5,
    gUnknown_83FCA03,
    gUnknown_83FC554,
    gUnknown_83FC576,
    gUnknown_83FBAD2,
    gUnknown_83FBAE5,
    gUnknown_83FCC39,
    gUnknown_83FC591,
    sText_PlayerDefeatedLinkTrainerTrainer1,
    gUnknown_83FC5A2,
    gUnknown_83FC5CC,
    gUnknown_83FC5E8,
    gUnknown_83FCB75,
    gUnknown_83FC5F6,
    gUnknown_83FC79D,
    gUnknown_83FBB2F,
    gUnknown_83FB282,
    gUnknown_83FB283,
    gUnknown_83FC955,
    gUnknown_83FB3AF,
    gUnknown_83FDAB1,
    gUnknown_83FCA13,
    gUnknown_83FC208,
    gUnknown_83FC60C,
    gUnknown_83FB359,
    gUnknown_83FCCA0,
    gUnknown_83FCCBB,
    gUnknown_83FC631,
    gUnknown_83FCA49,
    gUnknown_83FD97A,
    sText_Trainer1UsedItem,
    gUnknown_83FD876,
    gUnknown_83FB3D3,
    gUnknown_83FCA71,
    gUnknown_83FCA8E,
    gUnknown_83FB67B,
    gUnknown_83FCBC5,
    gUnknown_83FC900,
    gUnknown_83FBC62,
    gUnknown_83FB997,
    gUnknown_83FB95E,
    gUnknown_83FC646,
    gUnknown_83FCAAA,
    gUnknown_83FCAD1,
    gUnknown_83FB534,
    gUnknown_83FC337,
    gUnknown_83FC347,
    gUnknown_83FC357,
    gUnknown_83FC65A,
    gUnknown_83FCAEF,
    gUnknown_83FDD64,
    gUnknown_83FDDEB,
    gUnknown_83FB484,
    gUnknown_83FB4BE,
    Text_MonSentToBoxInSomeonesPC,
    Text_MonSentToBoxInBillsPC,
    Text_MonSentToBoxSomeonesBoxFull,
    Text_MonSentToBoxBillsBoxFull,
    sText_PokedudeUsedItem,
    gUnknown_83FDA4D,
    gUnknown_83FDA7A,
    gUnknown_83FDA8C,
    gUnknown_83FB21C,
    gUnknown_83FB262,
    gUnknown_83FB4F7,
    gUnknown_83FCB0C,
    gUnknown_83FCB26,
    gUnknown_83FD322,
    gUnknown_83FD34D,
    gUnknown_83FB21F,
    gUnknown_83FB232,
    gUnknown_83FB235,
    gUnknown_83FB248
};

const u16 gMissStringIds[] = {
    STRINGID_ATTACKMISSED,
    STRINGID_PKMNPROTECTEDITSELF,
    STRINGID_PKMNAVOIDEDATTACK,
    STRINGID_AVOIDEDDAMAGE,
    STRINGID_PKMNMAKESGROUNDMISS
};

const u16 gNoEscapeStringIds[] = {
    STRINGID_CANTESCAPE,
    STRINGID_DONTLEAVEBIRCH,
    STRINGID_PREVENTSESCAPE,
    STRINGID_CANTESCAPE2,
    STRINGID_ATTACKERCANTESCAPE
};

const u16 gMoveWeatherChangeStringIds[] = {
    STRINGID_STARTEDTORAIN,
    STRINGID_DOWNPOURSTARTED,
    STRINGID_BUTITFAILED,
    STRINGID_SANDSTORMBREWED,
    STRINGID_SUNLIGHTGOTBRIGHT,
    STRINGID_STARTEDHAIL
};

const u16 gSandstormHailContinuesStringIds[] = {
    STRINGID_SANDSTORMRAGES,
    STRINGID_HAILCONTINUES
};

const u16 gSandstormHailDmgStringIds[] = {
    STRINGID_PKMNBUFFETEDBYSANDSTORM,
    STRINGID_PKMNPELTEDBYHAIL
};

const u16 gSandstormHailEndStringIds[] = {
    STRINGID_SANDSTORMSUBSIDED,
    STRINGID_HAILSTOPPED
};

const u16 gRainContinuesStringIds[] = {
    STRINGID_RAINCONTINUES,
    STRINGID_DOWNPOURCONTINUES,
    STRINGID_RAINSTOPPED
};

const u16 gProtectLikeUsedStringIds[] = {
    STRINGID_PKMNPROTECTEDITSELF2,
    STRINGID_PKMNBRACEDITSELF,
    STRINGID_BUTITFAILED
};

const u16 gReflectLightScreenSafeguardStringIds[] = {
    STRINGID_BUTITFAILED,
    STRINGID_PKMNRAISEDDEF,
    STRINGID_PKMNRAISEDDEFALITTLE,
    STRINGID_PKMNRAISEDSPDEF,
    STRINGID_PKMNRAISEDSPDEFALITTLE,
    STRINGID_PKMNCOVEREDBYVEIL
};

const u16 gLeechSeedStringIds[] = {
    STRINGID_PKMNSEEDED,
    STRINGID_PKMNEVADEDATTACK,
    STRINGID_ITDOESNTAFFECT,
    STRINGID_PKMNSAPPEDBYLEECHSEED,
    STRINGID_ITSUCKEDLIQUIDOOZE
};

const u16 gRestUsedStringIds[] = {
    STRINGID_PKMNWENTTOSLEEP,
    STRINGID_PKMNSLEPTHEALTHY
};

const u16 gUproarOverTurnStringIds[] = {
    STRINGID_PKMNMAKINGUPROAR,
    STRINGID_PKMNCALMEDDOWN
};

const u16 gStockpileUsedStringIds[] = {
    STRINGID_PKMNSTOCKPILED,
    STRINGID_PKMNCANTSTOCKPILE
};

const u16 gWokeUpStringIds[] = {
    STRINGID_PKMNWOKEUP,
    STRINGID_PKMNWOKEUPINUPROAR
};

const u16 gSwallowFailStringIds[] = {
    STRINGID_FAILEDTOSWALLOW,
    STRINGID_PKMNHPFULL
};

const u16 gUproarAwakeStringIds[] = {
    STRINGID_PKMNCANTSLEEPINUPROAR2,
    STRINGID_UPROARKEPTPKMNAWAKE,
    STRINGID_PKMNSTAYEDAWAKEUSING
};

const u16 gStatUpStringIds[] = {
    STRINGID_PKMNSSTATCHANGED,
    STRINGID_PKMNSSTATCHANGED2,
    STRINGID_STATSWONTINCREASE,
    STRINGID_EMPTYSTRING3,
    STRINGID_USINGXTHEYOFZN,
    STRINGID_PKMNUSEDXTOGETPUMPED
};

const u16 gStatDownStringIds[] = {
    STRINGID_PKMNSSTATCHANGED3,
    STRINGID_PKMNSSTATCHANGED4,
    STRINGID_STATSWONTDECREASE,
    STRINGID_EMPTYSTRING3
};

const u16 gFirstTurnOfTwoStringIds[] = {
    STRINGID_PKMNWHIPPEDWHIRLWIND,
    STRINGID_PKMNTOOKSUNLIGHT,
    STRINGID_PKMNLOWEREDHEAD,
    STRINGID_PKMNISGLOWING,
    STRINGID_PKMNFLEWHIGH,
    STRINGID_PKMNDUGHOLE,
    STRINGID_PKMNHIDUNDERWATER,
    STRINGID_PKMNSPRANGUP
};

const u16 gWrappedStringIds[] = {
    STRINGID_PKMNSQUEEZEDBYBIND,
    STRINGID_PKMNWRAPPEDBY,
    STRINGID_PKMNTRAPPEDINVORTEX,
    STRINGID_PKMNCLAMPED,
    STRINGID_PKMNTRAPPEDINVORTEX,
    STRINGID_PKMNTRAPPEDBYSANDTOMB
};

const u16 gMistUsedStringIds[] = {
    STRINGID_PKMNSHROUDEDINMIST,
    STRINGID_BUTITFAILED
};

const u16 gFocusEnergyUsedStringIds[] = {
    STRINGID_PKMNGETTINGPUMPED,
    STRINGID_BUTITFAILED
};

const u16 gTransformUsedStringIds[] = {
    STRINGID_PKMNTRANSFORMEDINTO,
    STRINGID_BUTITFAILED
};

const u16 gSubsituteUsedStringIds[] = {
    STRINGID_PKMNMADESUBSTITUTE,
    STRINGID_TOOWEAKFORSUBSTITUTE
};

const u16 gGotPoisonedStringIds[] = {
    STRINGID_PKMNWASPOISONED,
    STRINGID_PKMNPOISONEDBY
};

const u16 gGotParalyzedStringIds[] = {
    STRINGID_PKMNWASPARALYZED,
    STRINGID_PKMNWASPARALYZEDBY
};

const u16 gFellAsleepStringIds[] = {
    STRINGID_PKMNFELLASLEEP,
    STRINGID_PKMNMADESLEEP
};

const u16 gGotBurnedStringIds[] = {
    STRINGID_PKMNWASBURNED,
    STRINGID_PKMNBURNEDBY
};

const u16 gGotFrozenStringIds[] = {
    STRINGID_PKMNWASFROZEN,
    STRINGID_PKMNFROZENBY
};

const u16 gGotDefrostedStringIds[] = {
    STRINGID_PKMNWASDEFROSTED2,
    STRINGID_PKMNWASDEFROSTEDBY
};

const u16 gKOFailedStringIds[] = {
    STRINGID_ATTACKMISSED,
    STRINGID_PKMNUNAFFECTED
};

const u16 gAttractUsedStringIds[] = {
    STRINGID_PKMNFELLINLOVE,
    STRINGID_PKMNSXINFATUATEDY
};

const u16 gLeechSeedDrainStringIds[] = {
    STRINGID_PKMNENERGYDRAINED,
    STRINGID_ITSUCKEDLIQUIDOOZE
};

const u16 gSportsUsedStringIds[] = {
    STRINGID_ELECTRICITYWEAKENED,
    STRINGID_FIREWEAKENED
};

const u16 gPartyStatusHealStringIds[] = {
    STRINGID_BELLCHIMED,
    STRINGID_BELLCHIMED,
    STRINGID_BELLCHIMED,
    STRINGID_BELLCHIMED,
    STRINGID_SOOTHINGAROMA
};

const u16 gFutureMoveUsedStringIds[] = {
    STRINGID_PKMNFORESAWATTACK,
    STRINGID_PKMNCHOSEXASDESTINY
};

const u16 gBallEscapeStringIds[] = {
    STRINGID_PKMNBROKEFREE,
    STRINGID_ITAPPEAREDCAUGHT,
    STRINGID_AARGHALMOSTHADIT,
    STRINGID_SHOOTSOCLOSE
};

const u16 gWeatherContinuesStringIds[] = {
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_SANDSTORMISRAGING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_SUNLIGHTSTRONG,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING,
    STRINGID_ITISRAINING
};

const u16 gInobedientStringIds[] = {
    STRINGID_PKMNLOAFING,
    STRINGID_PKMNWONTOBEY,
    STRINGID_PKMNTURNEDAWAY,
    STRINGID_PKMNPRETENDNOTNOTICE
};

const u16 gSafariPokeblockResultStringIds[] = {
    STRINGID_PKMNWATCHINGCAREFULLY,
    STRINGID_PKMNANGRY,
    STRINGID_PKMNEATING
};

const u16 gTrainerItemCuredStatusStringIds[] = {
    STRINGID_PKMNSITEMSNAPPEDOUT,
    STRINGID_PKMNSITEMCUREDPARALYSIS,
    STRINGID_PKMNSITEMDEFROSTEDIT,
    STRINGID_PKMNSITEMHEALEDBURN,
    STRINGID_PKMNSITEMCUREDPOISON,
    STRINGID_PKMNSITEMWOKEIT
};

const u16 gBerryEffectStringIds[] = {
    STRINGID_PKMNSITEMCUREDPROBLEM,
    STRINGID_PKMNSITEMNORMALIZEDSTATUS
};

const u16 gBRNPreventionStringIds[] = {
    STRINGID_PKMNSXPREVENTSBURNS,
    STRINGID_PKMNSXPREVENTSYSZ,
    STRINGID_PKMNSXHADNOEFFECTONY
};

const u16 gPRLZPreventionStringIds[] = {
    STRINGID_PKMNPREVENTSPARALYSISWITH,
    STRINGID_PKMNSXPREVENTSYSZ,
    STRINGID_PKMNSXHADNOEFFECTONY
};

const u16 gPSNPreventionStringIds[] = {
    STRINGID_PKMNPREVENTSPOISONINGWITH,
    STRINGID_PKMNSXPREVENTSYSZ,
    STRINGID_PKMNSXHADNOEFFECTONY
};

const u16 gItemSwapStringIds[] = {
    STRINGID_PKMNOBTAINEDX,
    STRINGID_PKMNOBTAINEDX2,
    STRINGID_PKMNOBTAINEDXYOBTAINEDZ
};

const u16 gFlashFireStringIds[] = {
    STRINGID_PKMNRAISEDFIREPOWERWITH,
    STRINGID_PKMNSXMADEYINEFFECTIVE
};

const u16 gCaughtMonStringIds[] = {
    STRINGID_PKMNTRANSFERREDSOMEONESPC,
    STRINGID_PKMNTRANSFERREDBILLSPC,
    STRINGID_PKMNBOXSOMEONESPCFULL,
    STRINGID_PKMNBOXBILLSPCFULL
};

const u16 gDoubleBattleRecallStrings[] = {
    STRINGID_TRAINER1MON1COMEBACK,
    STRINGID_TRAINER1MON1COMEBACK,
    STRINGID_TRAINER1MON2COMEBACK,
    STRINGID_TRAINER1MON1AND2COMEBACK
};

const u16 gTrappingMoves[] = {
    MOVE_BIND,
    MOVE_WRAP,
    MOVE_FIRE_SPIN,
    MOVE_CLAMP,
    MOVE_WHIRLPOOL,
    MOVE_SAND_TOMB,
    0xFFFF
};

const u8 gText_PkmnIsEvolving[] = _("What?\n{STR_VAR_1} is evolving!");
const u8 gText_CongratsPkmnEvolved[] = _("Congratulations! Your {STR_VAR_1}\nevolved into {STR_VAR_2}!{WAIT_SE}\p");
const u8 gText_PkmnStoppedEvolving[] = _("Huh? {STR_VAR_1}\nstopped evolving!\p");
const u8 gText_EllipsisQuestionMark[] = _("……?\p");
const u8 gText_WhatWillPkmnDo[] = _("What will\n{B_ACTIVE_NAME_WITH_PREFIX} do?");
const u8 gUnknown_83FE6E6[] = _("What will {B_PLAYER_NAME}\nthrow?");
const u8 gUnknown_83FE6FA[] = _("What will the\nold man do?");
const u8 gText_LinkStandby[] = _("{PAUSE 16}Link standby…");
const u8 gUnknown_83FE725[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW 13 14 15}FIGHT{CLEAR_TO 56}BAG\nPOKéMON{CLEAR_TO 56}RUN");
const u8 gUnknown_83FE747[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW 13 14 15}BALL{CLEAR_TO 56}BAIT\nROCK{CLEAR_TO 56}RUN");
const u8 gText_MoveInterfacePP[] = _("PP ");
const u8 gText_MoveInterfaceType[] = _("TYPE/");
const u8 gUnknown_83FE770[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW 13 14 15}");
const u8 gUnknown_83FE779[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW 13 14 15}どの わざを\nわすれさせたい?");
const u8 gText_BattleYesNoChoice[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW 13 14 15}Yes\nNo");
const u8 gText_BattleSwitchWhich[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW 13 14 15}Switch\nwhich?");
const u8 gUnknown_83FE7B6[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW 13 14 15}");
const u8 gUnknown_83FE7BF[] = _("{RIGHT_ARROW_2}");
const u8 gUnknown_83FE7C2[] = _("{PLUS}");
const u8 gUnknown_83FE7C5[] = _("-");

const u8 gUnknown_83FE7C7[] = _("{SIZE 0}Max{SIZE 2} HP");
const u8 gUnknown_83FE7D4[] = _("ATTACK ");
const u8 gUnknown_83FE7DC[] = _("DEFENSE");
const u8 gUnknown_83FE7E4[] = _("SP. ATK");
const u8 gUnknown_83FE7EC[] = _("SP. DEF");

const u8 *const gUnknown_83FE7F4[] = {
    gUnknown_83FE7C7,
    gUnknown_83FE7E4,
    gUnknown_83FE7D4,
    gUnknown_83FE7EC,
    gUnknown_83FE7DC,
    sText_Speed
};

const u8 gText_SafariBalls[] = _("{HIGHLIGHT 2}SAFARI BALLS"); //
const u8 gText_HighlightRed_Left[] = _("{HIGHLIGHT 2}Left: ");
const u8 gText_HighlightRed[] = _("{HIGHLIGHT 2}");
const u8 gText_Sleep[] = _("sleep");
const u8 gText_Poison[] = _("poison");
const u8 gText_Burn[] = _("burn");
const u8 gText_Paralysis[] = _("paralysis");
const u8 gText_Ice[] = _("ice");
const u8 gText_Confusion[] = _("confusion");
const u8 gText_Love[] = _("love");
const u8 gUnknown_83FE859[] = _("  ");
const u8 gUnknown_83FE85C[] = _("\n");
const u8 gUnknown_83FE85E[] = _("\n");
const u8 gUnknown_83FE860[] = _(" is");
const u8 gUnknown_83FE864[] = _(" is");
const u8 gText_BadEgg[] = _("Bad EGG");
const u8 gUnknown_83FE870[] = _("ミツル");
const u8 gText_Win[] = _("{HIGHLIGHT 0}Win");
const u8 gText_Loss[] = _("{HIGHLIGHT 0}Loss");
const u8 gText_Draw[] = _("{HIGHLIGHT 0}Draw");
static const u8 sText_SpaceIs[] = _(" is");
static const u8 sText_ApostropheS[] = _("'s");
const u8 gUnknown_83FE892[] = _("a NORMAL move");
const u8 gUnknown_83FE8A0[] = _("a FIGHTING move");
const u8 gUnknown_83FE8B0[] = _("a FLYING move");
const u8 gUnknown_83FE8BE[] = _("a POISON move");
const u8 gUnknown_83FE8CC[] = _("a GROUND move");
const u8 gUnknown_83FE8DA[] = _("a ROCK move");
const u8 gUnknown_83FE8E6[] = _("a BUG move");
const u8 gUnknown_83FE8F1[] = _("a GHOST move");
const u8 gUnknown_83FE8FE[] = _("a STEEL move");
const u8 gUnknown_83FE90B[] = _("a ??? move");
const u8 gUnknown_83FE916[] = _("a FIRE move");
const u8 gUnknown_83FE922[] = _("a WATER move");
const u8 gUnknown_83FE92F[] = _("a GRASS move");
const u8 gUnknown_83FE93C[] = _("an ELECTRIC move");
const u8 gUnknown_83FE94D[] = _("a PSYCHIC move");
const u8 gUnknown_83FE95C[] = _("an ICE move");
const u8 gUnknown_83FE968[] = _("a DRAGON move");
const u8 gUnknown_83FE976[] = _("a DARK move");
const u8 gText_TimeBoard[] = _("TIME BOARD");
const u8 gText_ClearTime[] = _("CLEAR TIME"); // Unused
const u8 gText_XMinYZSec[] = _("{STR_VAR_1}MIN. {STR_VAR_2}.{STR_VAR_3}SEC.");
const u8 gUnknown_83FE9A9[] = _("1F");
const u8 gUnknown_83FE9AC[] = _("2F");
const u8 gUnknown_83FE9AF[] = _("3F");
const u8 gUnknown_83FE9B2[] = _("4F");
const u8 gUnknown_83FE9B5[] = _("5F");
const u8 gUnknown_83FE9B8[] = _("6F");
const u8 gUnknown_83FE9BB[] = _("7F");
const u8 gUnknown_83FE9BE[] = _("8F");

const u8 *const gTrainerTowerChallengeTypeTexts[NUM_TOWER_CHALLENGE_TYPES] = {
    gOtherText_Single,
    gOtherText_Double,
    gOtherText_Knockout,
    gOtherText_Mixed
};

const u8 gUnknown_83FE9D4[] = _("{PLAY_SE SE_NIGERU}{B_TRAINER1_CLASS} {B_TRAINER1_NAME} fled!"); //
static const u8 sText_PlayerLostAgainstTrainer1[] = _("Player lost against\n{B_TRAINER1_CLASS} {B_TRAINER1_NAME}!");
static const u8 sText_PlayerBattledToDrawTrainer1[] = _("Player battled to a draw against\n{B_TRAINER1_CLASS} {B_TRAINER1_NAME}!");

static const u8 *const sATypeMove_Table[] = {
    gUnknown_83FE892,
    gUnknown_83FE8A0,
    gUnknown_83FE8B0,
    gUnknown_83FE8BE,
    gUnknown_83FE8CC,
    gUnknown_83FE8DA,
    gUnknown_83FE8E6,
    gUnknown_83FE8F1,
    gUnknown_83FE8FE,
    gUnknown_83FE90B,
    gUnknown_83FE916,
    gUnknown_83FE922,
    gUnknown_83FE92F,
    gUnknown_83FE93C,
    gUnknown_83FE94D,
    gUnknown_83FE95C,
    gUnknown_83FE968,
    gUnknown_83FE976
};

static const u16 sGrammarMoveUsedTable[] = {
    MOVE_SWORDS_DANCE,
    MOVE_STRENGTH,
    MOVE_GROWTH,
    MOVE_HARDEN,
    MOVE_MINIMIZE,
    MOVE_SMOKESCREEN,
    MOVE_WITHDRAW,
    MOVE_DEFENSE_CURL,
    MOVE_EGG_BOMB,
    MOVE_SMOG,
    MOVE_BONE_CLUB,
    MOVE_FLASH,
    MOVE_SPLASH,
    MOVE_ACID_ARMOR,
    MOVE_BONEMERANG,
    MOVE_REST,
    MOVE_SHARPEN,
    MOVE_SUBSTITUTE,
    MOVE_MIND_READER,
    MOVE_SNORE,
    MOVE_PROTECT,
    MOVE_SPIKES,
    MOVE_ENDURE,
    MOVE_ROLLOUT,
    MOVE_SWAGGER,
    MOVE_SLEEP_TALK,
    MOVE_HIDDEN_POWER,
    MOVE_PSYCH_UP,
    MOVE_EXTREME_SPEED,
    MOVE_FOLLOW_ME,
    MOVE_TRICK,
    MOVE_ASSIST,
    MOVE_INGRAIN,
    MOVE_KNOCK_OFF,
    MOVE_CAMOUFLAGE,
    MOVE_ASTONISH,
    MOVE_ODOR_SLEUTH,
    MOVE_GRASS_WHISTLE,
    MOVE_SHEER_COLD,
    MOVE_MUDDY_WATER,
    MOVE_IRON_DEFENSE,
    MOVE_BOUNCE,
    MOVE_NONE,

    MOVE_TELEPORT,
    MOVE_RECOVER,
    MOVE_BIDE,
    MOVE_AMNESIA,
    MOVE_FLAIL,
    MOVE_TAUNT,
    MOVE_BULK_UP,
    MOVE_NONE,

    MOVE_MEDITATE,
    MOVE_AGILITY,
    MOVE_MIMIC,
    MOVE_DOUBLE_TEAM,
    MOVE_BARRAGE,
    MOVE_TRANSFORM,
    MOVE_STRUGGLE,
    MOVE_SCARY_FACE,
    MOVE_CHARGE,
    MOVE_WISH,
    MOVE_BRICK_BREAK,
    MOVE_YAWN,
    MOVE_FEATHER_DANCE,
    MOVE_TEETER_DANCE,
    MOVE_MUD_SPORT,
    MOVE_FAKE_TEARS,
    MOVE_WATER_SPORT,
    MOVE_CALM_MIND,
    MOVE_NONE,

    MOVE_POUND,
    MOVE_SCRATCH,
    MOVE_VICE_GRIP,
    MOVE_WING_ATTACK,
    MOVE_FLY,
    MOVE_BIND,
    MOVE_SLAM,
    MOVE_HORN_ATTACK,
    MOVE_WRAP,
    MOVE_THRASH,
    MOVE_TAIL_WHIP,
    MOVE_LEER,
    MOVE_BITE,
    MOVE_GROWL,
    MOVE_ROAR,
    MOVE_SING,
    MOVE_PECK,
    MOVE_ABSORB,
    MOVE_STRING_SHOT,
    MOVE_EARTHQUAKE,
    MOVE_FISSURE,
    MOVE_DIG,
    MOVE_TOXIC,
    MOVE_SCREECH,
    MOVE_METRONOME,
    MOVE_LICK,
    MOVE_CLAMP,
    MOVE_CONSTRICT,
    MOVE_POISON_GAS,
    MOVE_BUBBLE,
    MOVE_SLASH,
    MOVE_SPIDER_WEB,
    MOVE_NIGHTMARE,
    MOVE_CURSE,
    MOVE_FORESIGHT,
    MOVE_CHARM,
    MOVE_ATTRACT,
    MOVE_ROCK_SMASH,
    MOVE_UPROAR,
    MOVE_SPIT_UP,
    MOVE_SWALLOW,
    MOVE_TORMENT,
    MOVE_FLATTER,
    MOVE_ROLE_PLAY,
    MOVE_ENDEAVOR,
    MOVE_TICKLE,
    MOVE_COVET,
    MOVE_NONE
};

// code
void BufferStringBattle(u16 stringId)
{
    s32 i;
    const u8 *stringPtr = NULL;

    sBattleMsgDataPtr = (struct BattleMsgData*)(&gBattleBufferA[gActiveBattler][4]);
    gLastUsedItem = sBattleMsgDataPtr->lastItem;
    gLastUsedAbility = sBattleMsgDataPtr->lastAbility;
    gBattleScripting.battler = sBattleMsgDataPtr->scrActive;
    *(&gBattleStruct->field_52) = sBattleMsgDataPtr->unk1605E;
    *(&gBattleStruct->hpScale) = sBattleMsgDataPtr->hpScale;
    gPotentialItemEffectBattler = sBattleMsgDataPtr->itemEffectBattler;
    *(&gBattleStruct->stringMoveType) = sBattleMsgDataPtr->moveType;

    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        sBattlerAbilities[i] = sBattleMsgDataPtr->abilities[i];
    }
    for (i = 0; i < TEXT_BUFF_ARRAY_COUNT; i++)
    {
        gBattleTextBuff1[i] = sBattleMsgDataPtr->textBuffs[0][i];
        gBattleTextBuff2[i] = sBattleMsgDataPtr->textBuffs[1][i];
        gBattleTextBuff3[i] = sBattleMsgDataPtr->textBuffs[2][i];
    }

    switch (stringId)
    {
    case STRINGID_INTROMSG: // first battle msg
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                {
                    stringPtr = sText_TwoLinkTrainersWantToBattle;
                }
                else
                {
                    if (gTrainerBattleOpponent_A == TRAINER_OPPONENT_C00)
                        stringPtr = sText_Trainer1WantsToBattle;
                    else
                        stringPtr = sText_LinkTrainerWantsToBattle;
                }
            }
            else
            {
                stringPtr = sText_Trainer1WantsToBattle;
            }
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_GHOST)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_GHOST_UNVEILED)
                    stringPtr = gUnknown_83FD30D;
                else
                    stringPtr = gUnknown_83FD2D9;
            }
            else if (gBattleTypeFlags & BATTLE_TYPE_LEGENDARY)
                stringPtr = sText_WildPkmnAppeared2;
            else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) // interesting, looks like they had something planned for wild double battles
                stringPtr = sText_TwoWildPkmnAppeared;
            else if (gBattleTypeFlags & BATTLE_TYPE_OLD_MAN_TUTORIAL)
                stringPtr = sText_WildPkmnAppearedPause;
            else
                stringPtr = sText_WildPkmnAppeared;
        }
        break;
    case STRINGID_INTROSENDOUT: // poke first send-out
        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = sText_LinkPartnerSentOutPkmnGoPkmn;
                else
                    stringPtr = sText_GoTwoPkmn;
            }
            else
            {
                stringPtr = sText_GoPkmn;
            }
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = sText_TwoLinkTrainersSentOutPkmn;
                else if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                    stringPtr = sText_LinkTrainerSentOutTwoPkmn;
                else
                    stringPtr = sText_Trainer1SentOutTwoPkmn;
            }
            else
            {
                if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
                    stringPtr = sText_Trainer1SentOutPkmn;
                else if (gTrainerBattleOpponent_A == TRAINER_OPPONENT_C00)
                    stringPtr = sText_Trainer1SentOutPkmn;
                else
                    stringPtr = sText_LinkTrainerSentOutPkmn;
            }
        }
        break;
    case STRINGID_RETURNMON: // sending poke to ball msg
        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        {
            if (*(&gBattleStruct->hpScale) == 0)
                stringPtr = sText_PkmnThatsEnough;
            else if (*(&gBattleStruct->hpScale) == 1 || gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                stringPtr = sText_PkmnComeBack;
            else if (*(&gBattleStruct->hpScale) == 2)
                stringPtr = sText_PkmnOkComeBack;
            else
                stringPtr = sText_PkmnGoodComeBack;
        }
        else
        {
            if (gTrainerBattleOpponent_A == TRAINER_LINK_OPPONENT)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = sText_LinkTrainer2WithdrewPkmn;
                else
                    stringPtr = sText_LinkTrainer1WithdrewPkmn;
            }
            else
            {
                stringPtr = sText_Trainer1WithdrewPkmn;
            }
        }
        break;
    case STRINGID_SWITCHINMON: // switch-in msg
        if (GetBattlerSide(gBattleScripting.battler) == B_SIDE_PLAYER)
        {
            if (*(&gBattleStruct->hpScale) == 0 || gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                stringPtr = sText_GoPkmn2;
            else if (*(&gBattleStruct->hpScale) == 1)
                stringPtr = sText_DoItPkmn;
            else if (*(&gBattleStruct->hpScale) == 2)
                stringPtr = sText_GoForItPkmn;
            else
                stringPtr = sText_YourFoesWeakGetEmPkmn;
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                    stringPtr = sText_LinkTrainerMultiSentOutPkmn;
                else if (gTrainerBattleOpponent_A == TRAINER_OPPONENT_C00)
                    stringPtr = sText_Trainer1SentOutPkmn2;
                else
                    stringPtr = sText_LinkTrainerSentOutPkmn2;
            }
            else
            {
                stringPtr = sText_Trainer1SentOutPkmn2;
            }
        }
        break;
    case STRINGID_USEDMOVE: // pokemon used a move msg
        ChooseMoveUsedParticle(gBattleTextBuff1); // buff1 doesn't appear in the string, leftover from japanese move names

        if (sBattleMsgDataPtr->currentMove >= MOVES_COUNT)
            StringCopy(gBattleTextBuff2, sATypeMove_Table[*(&gBattleStruct->stringMoveType)]);
        else
            StringCopy(gBattleTextBuff2, gMoveNames[sBattleMsgDataPtr->currentMove]);

        ChooseTypeOfMoveUsedString(gBattleTextBuff2);
        stringPtr = sText_AttackerUsedX;
        break;
    case STRINGID_BATTLEEND: // battle end
        if (gBattleTextBuff1[0] & B_OUTCOME_LINK_BATTLE_RAN)
        {
            gBattleTextBuff1[0] &= ~(B_OUTCOME_LINK_BATTLE_RAN);
            if (GetBattlerSide(gActiveBattler) == B_SIDE_OPPONENT && gBattleTextBuff1[0] != B_OUTCOME_DREW)
                gBattleTextBuff1[0] ^= (B_OUTCOME_LOST | B_OUTCOME_WON);

            if (gBattleTextBuff1[0] == B_OUTCOME_LOST || gBattleTextBuff1[0] == B_OUTCOME_DREW)
                stringPtr = sText_GotAwaySafely;
            else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
                stringPtr = sText_TwoWildFled;
            else if (gTrainerBattleOpponent_A == TRAINER_OPPONENT_C00)
                stringPtr = gUnknown_83FE9D4;
            else
                stringPtr = gUnknown_83FCD92;
        }
        else
        {
            if (GetBattlerSide(gActiveBattler) == B_SIDE_OPPONENT && gBattleTextBuff1[0] != B_OUTCOME_DREW)
                gBattleTextBuff1[0] ^= (B_OUTCOME_LOST | B_OUTCOME_WON);

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                switch (gBattleTextBuff1[0])
                {
                case B_OUTCOME_WON:
                    stringPtr = sText_TwoLinkTrainersDefeated;
                    break;
                case B_OUTCOME_LOST:
                    stringPtr = sText_PlayerLostToTwo;
                    break;
                case B_OUTCOME_DREW:
                    stringPtr = sText_PlayerBattledToDrawVsTwo;
                    break;
                }
            }
            else if (gTrainerBattleOpponent_A == TRAINER_OPPONENT_C00)
            {
                switch (gBattleTextBuff1[0])
                {
                case B_OUTCOME_WON:
                    stringPtr = sText_PlayerDefeatedLinkTrainerTrainer1;
                    break;
                case B_OUTCOME_LOST:
                    stringPtr = sText_PlayerLostAgainstTrainer1;
                    break;
                case B_OUTCOME_DREW:
                    stringPtr = sText_PlayerBattledToDrawTrainer1;
                    break;
                }
            }
            else
            {
                switch (gBattleTextBuff1[0])
                {
                case B_OUTCOME_WON:
                    stringPtr = sText_PlayerDefeatedLinkTrainer;
                    break;
                case B_OUTCOME_LOST:
                    stringPtr = sText_PlayerLostAgainstLinkTrainer;
                    break;
                case B_OUTCOME_DREW:
                    stringPtr = sText_PlayerBattledToDrawLinkTrainer;
                    break;
                }
            }
        }
        break;
    default: // load a string from the table
        if (stringId >= BATTLESTRINGS_COUNT + BATTLESTRINGS_ID_ADDER)
        {
            gDisplayedStringBattle[0] = EOS;
            return;
        }
        else
        {
            stringPtr = gBattleStringsTable[stringId - BATTLESTRINGS_ID_ADDER];
        }
        break;
    }

    BattleStringExpandPlaceholdersToDisplayedString(stringPtr);
}

u32 BattleStringExpandPlaceholdersToDisplayedString(const u8* src)
{
    BattleStringExpandPlaceholders(src, gDisplayedStringBattle);
}

static const u8* TryGetStatusString(u8 *src)
{
    u32 i;
    u8 status[] = _("$$$$$$$");
    u32 chars1, chars2;
    u8* statusPtr;

    statusPtr = status;
    for (i = 0; i < 8; i++)
    {
        if (*src == EOS)
            break;
        *statusPtr = *src;
        src++;
        statusPtr++;
    }

    chars1 = *(u32*)(&status[0]);
    chars2 = *(u32*)(&status[4]);

    for (i = 0; i < NELEMS(gStatusConditionStringsTable); i++)
    {
        if (chars1 == *(u32*)(&gStatusConditionStringsTable[i][0][0])
            && chars2 == *(u32*)(&gStatusConditionStringsTable[i][0][4]))
            return gStatusConditionStringsTable[i][1];
    }
    return NULL;
}

#define HANDLE_NICKNAME_STRING_CASE(battlerId, monIndex)                \
    if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)                     \
    {                                                                   \
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)                     \
            toCpy = sText_FoePkmnPrefix;                                \
        else                                                            \
            toCpy = sText_WildPkmnPrefix;                               \
        while (*toCpy != EOS)                                           \
        {                                                               \
            dst[dstId] = *toCpy;                                        \
            dstId++;                                                    \
            toCpy++;                                                    \
        }                                                               \
        GetMonData(&gEnemyParty[monIndex], MON_DATA_NICKNAME, text);    \
    }                                                                   \
    else                                                                \
    {                                                                   \
        GetMonData(&gPlayerParty[monIndex], MON_DATA_NICKNAME, text);   \
    }                                                                   \
    StringGetEnd10(text);                                               \
    toCpy = text;

u32 BattleStringExpandPlaceholders(const u8 *src, u8 *dst)
{
    u32 dstId = 0; // if they used dstId, why not use srcId as well?
    const u8 *toCpy = NULL;
    u8 text[30];
    u8 multiplayerId;
    s32 i;

    multiplayerId = GetMultiplayerId();

    while (*src != EOS)
    {
        if (*src == PLACEHOLDER_BEGIN)
        {
            src++;
            switch (*src)
            {
            case B_TXT_BUFF1:
                if (gBattleTextBuff1[0] == B_BUFF_PLACEHOLDER_BEGIN)
                {
                    ExpandBattleTextBuffPlaceholders(gBattleTextBuff1, gStringVar1);
                    toCpy = gStringVar1;
                }
                else
                {
                    toCpy = TryGetStatusString(gBattleTextBuff1);
                    if (toCpy == NULL)
                        toCpy = gBattleTextBuff1;
                }
                break;
            case B_TXT_BUFF2:
                if (gBattleTextBuff2[0] == B_BUFF_PLACEHOLDER_BEGIN)
                {
                    ExpandBattleTextBuffPlaceholders(gBattleTextBuff2, gStringVar2);
                    toCpy = gStringVar2;
                }
                else
                    toCpy = gBattleTextBuff2;
                break;
            case B_TXT_BUFF3:
                if (gBattleTextBuff3[0] == B_BUFF_PLACEHOLDER_BEGIN)
                {
                    ExpandBattleTextBuffPlaceholders(gBattleTextBuff3, gStringVar3);
                    toCpy = gStringVar3;
                }
                else
                    toCpy = gBattleTextBuff3;
                break;
            case B_TXT_COPY_VAR_1:
                toCpy = gStringVar1;
                break;
            case B_TXT_COPY_VAR_2:
                toCpy = gStringVar2;
                break;
            case B_TXT_COPY_VAR_3:
                toCpy = gStringVar3;
                break;
            case B_TXT_PLAYER_MON1_NAME: // first player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_OPPONENT_MON1_NAME: // first enemy poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_PLAYER_MON2_NAME: // second player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT)]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_OPPONENT_MON2_NAME: // second enemy poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT)]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_LINK_PLAYER_MON1_NAME: // link first player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerId].id]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_LINK_OPPONENT_MON1_NAME: // link first opponent poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerId].id ^ 1]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_LINK_PLAYER_MON2_NAME: // link second player poke name
                GetMonData(&gPlayerParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerId].id ^ 2]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_LINK_OPPONENT_MON2_NAME: // link second opponent poke name
                GetMonData(&gEnemyParty[gBattlerPartyIndexes[gLinkPlayers[multiplayerId].id ^ 3]],
                           MON_DATA_NICKNAME, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_ATK_NAME_WITH_PREFIX_MON1: // attacker name with prefix, only battlerId 0/1
                HANDLE_NICKNAME_STRING_CASE(gBattlerAttacker,
                                            gBattlerPartyIndexes[GetBattlerAtPosition(GET_BATTLER_SIDE(gBattlerAttacker))])
                break;
            case B_TXT_ATK_PARTNER_NAME: // attacker partner name
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
                    GetMonData(
                        &gPlayerParty[gBattlerPartyIndexes[GetBattlerAtPosition(GET_BATTLER_SIDE(gBattlerAttacker)) +
                                                           2]], MON_DATA_NICKNAME, text);
                else
                    GetMonData(
                        &gEnemyParty[gBattlerPartyIndexes[GetBattlerAtPosition(GET_BATTLER_SIDE(gBattlerAttacker)) +
                                                          2]], MON_DATA_NICKNAME, text);

                StringGetEnd10(text);
                toCpy = text;
                break;
            case B_TXT_ATK_NAME_WITH_PREFIX: // attacker name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBattlerAttacker, gBattlerPartyIndexes[gBattlerAttacker])
                break;
            case B_TXT_DEF_NAME_WITH_PREFIX: // target name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBattlerTarget, gBattlerPartyIndexes[gBattlerTarget])
                break;
            case B_TXT_EFF_NAME_WITH_PREFIX: // effect battlerId name with prefix
                HANDLE_NICKNAME_STRING_CASE(gEffectBattler, gBattlerPartyIndexes[gEffectBattler])
                break;
            case B_TXT_ACTIVE_NAME_WITH_PREFIX: // active battlerId name with prefix
                HANDLE_NICKNAME_STRING_CASE(gActiveBattler, gBattlerPartyIndexes[gActiveBattler])
                break;
            case B_TXT_SCR_ACTIVE_NAME_WITH_PREFIX: // scripting active battlerId name with prefix
                HANDLE_NICKNAME_STRING_CASE(gBattleScripting.battler, gBattlerPartyIndexes[gBattleScripting.battler])
                break;
            case B_TXT_CURRENT_MOVE: // current move name
                if (sBattleMsgDataPtr->currentMove >= MOVES_COUNT)
                    toCpy = (const u8 *)&sATypeMove_Table[gBattleStruct->stringMoveType];
                else
                    toCpy = gMoveNames[sBattleMsgDataPtr->currentMove];
                break;
            case B_TXT_LAST_MOVE: // originally used move name
                if (sBattleMsgDataPtr->originallyUsedMove >= MOVES_COUNT)
                    toCpy = (const u8 *)&sATypeMove_Table[gBattleStruct->stringMoveType];
                else
                    toCpy = gMoveNames[sBattleMsgDataPtr->originallyUsedMove];
                break;
            case B_TXT_LAST_ITEM: // last used item
                if (gBattleTypeFlags & BATTLE_TYPE_LINK)
                {
                    if (gLastUsedItem == ITEM_ENIGMA_BERRY)
                    {
                        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
                        {
                            if ((gBattleStruct->multiplayerId != 0 && (gPotentialItemEffectBattler & BIT_SIDE))
                                || (gBattleStruct->multiplayerId == 0 && !(gPotentialItemEffectBattler & BIT_SIDE)))
                            {
                                StringCopy(text, gEnigmaBerries[gPotentialItemEffectBattler].name);
                                StringAppend(text, sText_BerrySuffix);
                                toCpy = text;
                            }
                            else
                            {
                                toCpy = sText_EnigmaBerry;
                            }
                        }
                        else
                        {
                            if (gLinkPlayers[gBattleStruct->multiplayerId].id == gPotentialItemEffectBattler)
                            {
                                StringCopy(text, gEnigmaBerries[gPotentialItemEffectBattler].name);
                                StringAppend(text, sText_BerrySuffix);
                                toCpy = text;
                            }
                            else
                                toCpy = sText_EnigmaBerry;
                        }
                    }
                    else
                    {
                        CopyItemName(gLastUsedItem, text);
                        toCpy = text;
                    }
                }
                else
                {
                    CopyItemName(gLastUsedItem, text);
                    toCpy = text;
                }
                break;
            case B_TXT_LAST_ABILITY: // last used ability
                toCpy = gAbilityNames[gLastUsedAbility];
                break;
            case B_TXT_ATK_ABILITY: // attacker ability
                toCpy = gAbilityNames[sBattlerAbilities[gBattlerAttacker]];
                break;
            case B_TXT_DEF_ABILITY: // target ability
                toCpy = gAbilityNames[sBattlerAbilities[gBattlerTarget]];
                break;
            case B_TXT_SCR_ACTIVE_ABILITY: // scripting active ability
                toCpy = gAbilityNames[sBattlerAbilities[gBattleScripting.battler]];
                break;
            case B_TXT_EFF_ABILITY: // effect battlerId ability
                toCpy = gAbilityNames[sBattlerAbilities[gEffectBattler]];
                break;
            case B_TXT_TRAINER1_CLASS: // trainer class name
                if (gTrainerBattleOpponent_A == SECRET_BASE_OPPONENT)
                    toCpy = gTrainerClassNames[GetSecretBaseTrainerNameIndex()];
                else if (gTrainerBattleOpponent_A == TRAINER_OPPONENT_C00)
                    toCpy = gTrainerClassNames[sub_80447F0()];
                else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                    toCpy = gTrainerClassNames[GetBattleTowerTrainerClassNameId()];
                else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
                    toCpy = gTrainerClassNames[GetTrainerTowerOpponentClass()];
                else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
                    toCpy = gTrainerClassNames[GetEreaderTrainerClassId()];
                else
                    toCpy = gTrainerClassNames[gTrainers[gTrainerBattleOpponent_A].trainerClass];
                break;
            case B_TXT_TRAINER1_NAME: // trainer1 name
                if (gTrainerBattleOpponent_A == SECRET_BASE_OPPONENT)
                {
                    for (i = 0; i < (s32)NELEMS(gBattleResources->secretBase->trainerName); i++)
                        text[i] = gBattleResources->secretBase->trainerName[i];
                    text[i] = EOS;
                    toCpy = text;
                }
                if (gTrainerBattleOpponent_A == TRAINER_OPPONENT_C00)
                {
                    toCpy = gLinkPlayers[multiplayerId ^ BIT_SIDE].name;
                }
                else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                {
                    GetBattleTowerTrainerName(text);
                }
                else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
                {
                    GetTrainerTowerOpponentName(text);
                    toCpy = text;
                }
                else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
                {
                    CopyEReaderTrainerName5(text);
                    toCpy = text;
                }
                else
                {
                    if (gTrainers[gTrainerBattleOpponent_A].trainerClass == CLASS_RIVAL
                     || gTrainers[gTrainerBattleOpponent_A].trainerClass == CLASS_RIVAL_2
                     || gTrainers[gTrainerBattleOpponent_A].trainerClass == CLASS_CHAMPION_2)
                        toCpy = GetExpandedPlaceholder(PLACEHOLDER_ID_RIVAL);
                    else
                        toCpy = gTrainers[gTrainerBattleOpponent_A].trainerName;
                }
                break;
            case B_TXT_LINK_PLAYER_NAME: // link player name
                toCpy = gLinkPlayers[multiplayerId].name;
                break;
            case B_TXT_LINK_PARTNER_NAME: // link partner name
                toCpy = gLinkPlayers[GetBattlerMultiplayerId(BATTLE_PARTNER(gLinkPlayers[multiplayerId].id))].name;
                break;
            case B_TXT_LINK_OPPONENT1_NAME: // link opponent 1 name
                toCpy = gLinkPlayers[GetBattlerMultiplayerId(BATTLE_OPPOSITE(gLinkPlayers[multiplayerId].id))].name;
                break;
            case B_TXT_LINK_OPPONENT2_NAME: // link opponent 2 name
                toCpy = gLinkPlayers[GetBattlerMultiplayerId(
                    BATTLE_PARTNER(BATTLE_OPPOSITE(gLinkPlayers[multiplayerId].id)))].name;
                break;
            case B_TXT_LINK_SCR_TRAINER_NAME: // link scripting active name
                toCpy = gLinkPlayers[GetBattlerMultiplayerId(gBattleScripting.battler)].name;
                break;
            case B_TXT_PLAYER_NAME: // player name
                toCpy = gSaveBlock2Ptr->playerName;
                break;
            case B_TXT_TRAINER1_LOSE_TEXT: // trainerA lose text
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
                {
                    GetTrainerTowerOpponentLoseText(gStringVar4, 0);
                    toCpy = gStringVar4;
                }
                else
                {
                    toCpy = GetTrainerALoseText();
                }
                break;
            case B_TXT_TRAINER1_WIN_TEXT: // trainerA win text
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
                {
                    GetTrainerTowerOpponentWinText(gStringVar4, 0);
                    toCpy = gStringVar4;
                }
                else
                {
                    toCpy = GetTrainerWonSpeech();
                }
                break;
            case B_TXT_TRAINER2_LOSE_TEXT:
                GetTrainerTowerOpponentLoseText(gStringVar4, 1);
                toCpy = gStringVar4;
                break;
            case B_TXT_TRAINER2_WIN_TEXT:
                GetTrainerTowerOpponentWinText(gStringVar4, 1);
                toCpy = gStringVar4;
                break;
            case B_TXT_26: // ?
                HANDLE_NICKNAME_STRING_CASE(gBattleScripting.battler, *(&gBattleStruct->field_52))
                break;
            case B_TXT_PC_CREATOR_NAME: // lanette pc
                if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC))
                    toCpy = sText_Bills;
                else
                    toCpy = sText_Someones;
                break;
            case B_TXT_ATK_PREFIX2:
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
                    toCpy = sText_AllyPkmnPrefix2;
                else
                    toCpy = sText_FoePkmnPrefix3;
                break;
            case B_TXT_DEF_PREFIX2:
                if (GetBattlerSide(gBattlerTarget) == B_SIDE_PLAYER)
                    toCpy = sText_AllyPkmnPrefix2;
                else
                    toCpy = sText_FoePkmnPrefix3;
                break;
            case B_TXT_ATK_PREFIX1:
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
                    toCpy = sText_AllyPkmnPrefix;
                else
                    toCpy = sText_FoePkmnPrefix2;
                break;
            case B_TXT_DEF_PREFIX1:
                if (GetBattlerSide(gBattlerTarget) == B_SIDE_PLAYER)
                    toCpy = sText_AllyPkmnPrefix;
                else
                    toCpy = sText_FoePkmnPrefix2;
                break;
            case B_TXT_ATK_PREFIX3:
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
                    toCpy = sText_AllyPkmnPrefix3;
                else
                    toCpy = sText_FoePkmnPrefix4;
                break;
            case B_TXT_DEF_PREFIX3:
                if (GetBattlerSide(gBattlerTarget) == B_SIDE_PLAYER)
                    toCpy = sText_AllyPkmnPrefix3;
                else
                    toCpy = sText_FoePkmnPrefix4;
                break;
            }

            // missing if (toCpy != NULL) check
            while (*toCpy != EOS)
            {
                dst[dstId] = *toCpy;
                dstId++;
                toCpy++;
            }
            if (*src == B_TXT_TRAINER1_LOSE_TEXT || *src == B_TXT_TRAINER1_WIN_TEXT
             || *src == B_TXT_TRAINER2_LOSE_TEXT || *src == B_TXT_TRAINER2_WIN_TEXT)
            {
                dst[dstId] = EXT_CTRL_CODE_BEGIN;
                dstId++;
                dst[dstId] = 9;
                dstId++;
            }
        }
        else
        {
            dst[dstId] = *src;
            dstId++;
        }
        src++;
    }

    dst[dstId] = *src;
    dstId++;

    return dstId;
}

static void ExpandBattleTextBuffPlaceholders(const u8 *src, u8 *dst)
{
    u32 srcId = 1;
    u32 value = 0;
    u8 text[12];
    u16 hword;

    *dst = EOS;
    while (src[srcId] != B_BUFF_EOS)
    {
        switch (src[srcId])
        {
        case B_BUFF_STRING: // battle string
            hword = T1_READ_16(&src[srcId + 1]);
            StringAppend(dst, gBattleStringsTable[hword - BATTLESTRINGS_ID_ADDER]);
            srcId += 3;
            break;
        case B_BUFF_NUMBER: // int to string
            switch (src[srcId + 1])
            {
            case 1:
                value = src[srcId + 3];
                break;
            case 2:
                value = T1_READ_16(&src[srcId + 3]);
                break;
            case 4:
                value = T1_READ_32(&src[srcId + 3]);
                break;
            }
            ConvertIntToDecimalStringN(dst, value, STR_CONV_MODE_LEFT_ALIGN, src[srcId + 2]);
            srcId += src[srcId + 1] + 3;
            break;
        case B_BUFF_MOVE: // move name
            StringAppend(dst, gMoveNames[T1_READ_16(&src[srcId + 1])]);
            srcId += 3;
            break;
        case B_BUFF_TYPE: // type name
            StringAppend(dst, gTypeNames[src[srcId + 1]]);
            srcId += 2;
            break;
        case B_BUFF_MON_NICK_WITH_PREFIX: // poke nick with prefix
            if (GetBattlerSide(src[srcId + 1]) == B_SIDE_PLAYER)
            {
                GetMonData(&gPlayerParty[src[srcId + 2]], MON_DATA_NICKNAME, text);
            }
            else
            {
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    StringAppend(dst, sText_FoePkmnPrefix);
                else
                    StringAppend(dst, sText_WildPkmnPrefix);

                GetMonData(&gEnemyParty[src[srcId + 2]], MON_DATA_NICKNAME, text);
            }
            StringGetEnd10(text);
            StringAppend(dst, text);
            srcId += 3;
            break;
        case B_BUFF_STAT: // stats
            StringAppend(dst, gStatNamesTable[src[srcId + 1]]);
            srcId += 2;
            break;
        case B_BUFF_SPECIES: // species name
            GetSpeciesName(dst, T1_READ_16(&src[srcId + 1]));
            srcId += 3;
            break;
        case B_BUFF_MON_NICK: // poke nick without prefix
            if (GetBattlerSide(src[srcId + 1]) == B_SIDE_PLAYER)
                GetMonData(&gPlayerParty[src[srcId + 2]], MON_DATA_NICKNAME, dst);
            else
                GetMonData(&gEnemyParty[src[srcId + 2]], MON_DATA_NICKNAME, dst);
            StringGetEnd10(dst);
            srcId += 3;
            break;
        case B_BUFF_NEGATIVE_FLAVOR: // flavor table
            StringAppend(dst, gPokeblockWasTooXStringTable[src[srcId + 1]]);
            srcId += 2;
            break;
        case B_BUFF_ABILITY: // ability names
            StringAppend(dst, gAbilityNames[src[srcId + 1]]);
            srcId += 2;
            break;
        case B_BUFF_ITEM: // item name
            hword = T1_READ_16(&src[srcId + 1]);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                if (hword == ITEM_ENIGMA_BERRY)
                {
                    if (gLinkPlayers[gBattleStruct->multiplayerId].id == gPotentialItemEffectBattler)
                    {
                        StringCopy(dst, gEnigmaBerries[gPotentialItemEffectBattler].name);
                        StringAppend(dst, sText_BerrySuffix);
                    }
                    else
                    {
                        StringAppend(dst, sText_EnigmaBerry);
                    }
                }
                else
                {
                    CopyItemName(hword, dst);
                }
            }
            else
            {
                CopyItemName(hword, dst);
            }
            srcId += 3;
            break;
        }
    }
}

// Loads one of two text strings into the provided buffer. This is functionally
// unused, since the value loaded into the buffer is not read; it loaded one of
// two particles (either "は" or "の") which works in tandem with ChooseTypeOfMoveUsedString
// below to effect changes in the meaning of the line.
static void ChooseMoveUsedParticle(u8* textBuff)
{
    s32 counter = 0;
    u32 i = 0;

    while (counter != MAX_MON_MOVES)
    {
        if (sGrammarMoveUsedTable[i] == 0)
            counter++;
        if (sGrammarMoveUsedTable[i++] == sBattleMsgDataPtr->currentMove)
            break;
    }

    if (counter >= 0)
    {
        if (counter <= 2)
            StringCopy(textBuff, sText_SpaceIs); // is
        else if (counter <= MAX_MON_MOVES)
            StringCopy(textBuff, sText_ApostropheS); // 's
    }
}

// Appends "!" to the text buffer `dst`. In the original Japanese this looked
// into the table of moves at sGrammarMoveUsedTable and varied the line accordingly.
//
// sText_ExclamationMark was a plain "!", used for any attack not on the list.
// It resulted in the translation "<NAME>'s <ATTACK>!".
//
// sText_ExclamationMark2 was "を つかった！". This resulted in the translation
// "<NAME> used <ATTACK>!", which was used for all attacks in English.
//
// sText_ExclamationMark3 was "した！". This was used for those moves whose
// names were verbs, such as Recover, and resulted in translations like "<NAME>
// recovered itself!".
//
// sText_ExclamationMark4 was "を した！" This resulted in a translation of
// "<NAME> did an <ATTACK>!".
//
// sText_ExclamationMark5 was " こうげき！" This resulted in a translation of
// "<NAME>'s <ATTACK> attack!".
static void ChooseTypeOfMoveUsedString(u8* dst)
{
    s32 counter = 0;
    s32 i = 0;

    while (*dst != EOS)
        dst++;

    while (counter != MAX_MON_MOVES)
    {
        if (sGrammarMoveUsedTable[i] == MOVE_NONE)
            counter++;
        if (sGrammarMoveUsedTable[i++] == sBattleMsgDataPtr->currentMove)
            break;
    }

    switch (counter)
    {
    case 0:
        StringCopy(dst, sText_ExclamationMark);
        break;
    case 1:
        StringCopy(dst, sText_ExclamationMark2);
        break;
    case 2:
        StringCopy(dst, sText_ExclamationMark3);
        break;
    case 3:
        StringCopy(dst, sText_ExclamationMark4);
        break;
    case 4:
        StringCopy(dst, sText_ExclamationMark5);
        break;
    }
}

static const struct BattleWindowText sTextOnWindowsInfo_Normal[] = {
    {PIXEL_FILL(0xf), 2, 0x02, 2, 0, 2, 1, 0x1, 0xf, 0x6},
    {PIXEL_FILL(0xf), 2, 0x02, 2, 0, 2, 0, 0x1, 0xf, 0x6},
    {PIXEL_FILL(0xe), 1, 0x00, 2, 0, 2, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 0, 0x00, 1, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 0, 0x00, 1, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 0, 0x00, 1, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 0, 0x00, 1, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 0, 0x00, 2, 0, 0, 0, 0xc, 0xe, 0xb},
    {PIXEL_FILL(0xe), 0, 0x00, 2, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 1, 0x0a, 2, 0, 2, 0, 0xc, 0xe, 0xb},
    {PIXEL_FILL(0xe), 1, 0x00, 2, 0, 2, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 1, 0x00, 2, 0, 2, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 2, 0x00, 0, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0x0), 0, 0x20, 0, 0, 0, 0, 0x1, 0x0, 0x2},
    {PIXEL_FILL(0xe), 2, 0x00, 2, 1, 2, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 2, 0x00, 2, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 2, 0x00, 2, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 2, 0x00, 2, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 2, 0x00, 2, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 2, 0x00, 2, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0xe), 2, 0x00, 2, 0, 0, 0, 0xd, 0xe, 0xf},
    {PIXEL_FILL(0x0), 2, 0x00, 2, 0, 0, 0, 0x1, 0x0, 0x6},
    {PIXEL_FILL(0x0), 2, 0x00, 2, 0, 0, 0, 0x1, 0x0, 0x6},
    {PIXEL_FILL(0x0), 2, 0x00, 2, 0, 0, 0, 0x1, 0x0, 0x6},
    {PIXEL_FILL(0x1), 4, 0x00, 1, 0, 1, 1, 0x2, 0x1, 0x3}
};

const u8 gUnknown_83FEC90[] = {0x04, 0x05, 0x02, 0x02};

void BattlePutTextOnWindow(const u8 *text, u8 windowId) {
    bool32 copyToVram;
    struct TextPrinterTemplate printerTemplate;
    u8 speed;
    int x;
    u8 context;

    u8 textFlags = windowId & 0xC0;
    windowId &= 0x3F;
    if (!(textFlags & 0x80))
        FillWindowPixelBuffer(windowId, sTextOnWindowsInfo_Normal[windowId].fillValue);
    if (textFlags & 0x40) {
        context = ContextNpcGetTextColor();
        printerTemplate.fontId = gUnknown_83FEC90[context];
    }
    else {
        printerTemplate.fontId = sTextOnWindowsInfo_Normal[windowId].fontId;
    }
    switch (windowId)
    {
    case 15 ... 20:
        x = (48 - GetStringWidth(sTextOnWindowsInfo_Normal[windowId].fontId, text,
                                 sTextOnWindowsInfo_Normal[windowId].letterSpacing)) / 2;
        break;
    case 21 ... 23:
        x = (64 - GetStringWidth(sTextOnWindowsInfo_Normal[windowId].fontId, text,
                                 sTextOnWindowsInfo_Normal[windowId].letterSpacing)) / 2;
        break;
    default:
        x = sTextOnWindowsInfo_Normal[windowId].x;
        break;
    }
    if (x < 0)
        x = 0;
    printerTemplate.currentChar = text;
    printerTemplate.windowId = windowId;
    printerTemplate.x = x;
    printerTemplate.y = sTextOnWindowsInfo_Normal[windowId].y;
    printerTemplate.currentX = printerTemplate.x;
    printerTemplate.currentY = printerTemplate.y;
    printerTemplate.letterSpacing = sTextOnWindowsInfo_Normal[windowId].letterSpacing;
    printerTemplate.lineSpacing = sTextOnWindowsInfo_Normal[windowId].lineSpacing;
    printerTemplate.unk = 0;
    printerTemplate.fgColor = sTextOnWindowsInfo_Normal[windowId].fgColor;
    printerTemplate.bgColor = sTextOnWindowsInfo_Normal[windowId].bgColor;
    printerTemplate.shadowColor = sTextOnWindowsInfo_Normal[windowId].shadowColor;
    if (windowId == 24)
        gTextFlags.useAlternateDownArrow = FALSE;
    else
        gTextFlags.useAlternateDownArrow = TRUE;

    if ((gBattleTypeFlags & BATTLE_TYPE_LINK) || ((gBattleTypeFlags & BATTLE_TYPE_POKEDUDE) && windowId != 24))
        gTextFlags.autoScroll = TRUE;
    else
        gTextFlags.autoScroll = FALSE;

    if (windowId == 0 || windowId == 24)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            speed = 1;
        else
            speed = GetTextSpeedSetting();
        gTextFlags.canABSpeedUpPrint = TRUE;
    }
    else
    {
        speed = sTextOnWindowsInfo_Normal[windowId].speed;
        gTextFlags.canABSpeedUpPrint = FALSE;
    }

    AddTextPrinter(&printerTemplate, speed, NULL);
    if (!(textFlags & 0x80))
    {
        PutWindowTilemap(windowId);
        CopyWindowToVram(windowId, 3);
    }
}

bool8 sub_80D89B0(u16 stringId)
{
    if (stringId == STRINGID_TRAINER1LOSETEXT || stringId == STRINGID_TRAINER2CLASS || stringId == STRINGID_TRAINER1WINTEXT || stringId == STRINGID_TRAINER2NAME)
        return TRUE;
    return FALSE;
}

void SetPpNumbersPaletteInMoveSelection(void)
{
    struct ChooseMoveStruct *chooseMoveStruct = (struct ChooseMoveStruct*)(&gBattleBufferA[gActiveBattler][4]);
    const u16 *palPtr = gUnknown_8D2FBB4;
    u8 var = GetCurrentPpToMaxPpState(chooseMoveStruct->currentPp[gMoveSelectionCursor[gActiveBattler]],
                                      chooseMoveStruct->maxPp[gMoveSelectionCursor[gActiveBattler]]);

    gPlttBufferUnfaded[92] = palPtr[(var * 2) + 0];
    gPlttBufferUnfaded[91] = palPtr[(var * 2) + 1];

    CpuCopy16(&gPlttBufferUnfaded[92], &gPlttBufferFaded[92], sizeof(u16));
    CpuCopy16(&gPlttBufferUnfaded[91], &gPlttBufferFaded[91], sizeof(u16));
}

u8 GetCurrentPpToMaxPpState(u8 currentPp, u8 maxPp)
{
    if (maxPp == currentPp)
    {
        return 3;
    }
    else if (maxPp <= 2)
    {
        if (currentPp > 1)
            return 3;
        else
            return 2 - currentPp;
    }
    else if (maxPp <= 7)
    {
        if (currentPp > 2)
            return 3;
        else
            return 2 - currentPp;
    }
    else
    {
        if (currentPp == 0)
            return 2;
        if (currentPp <= maxPp / 4)
            return 1;
        if (currentPp > maxPp / 2)
            return 3;
    }

    return 0;
}
