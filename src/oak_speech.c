#include "global.h"
#include "main.h"
#include "decompress.h"
#include "task.h"
#include "malloc.h"
#include "gpu_regs.h"
#include "wild_encounter.h"
#include "palette.h"
#include "blend_palette.h"
#include "text.h"
#include "window.h"
#include "text_window.h"
#include "bg.h"
#include "menu.h"
#include "help_system.h"
#include "new_menu_helpers.h"
#include "pokemon_3.h"
#include "sound.h"
#include "event_scripts.h"
#include "scanline_effect.h"
#include "string_util.h"
#include "pokeball.h"
#include "naming_screen.h"
#include "math_util.h"
#include "overworld.h"
#include "constants/species.h"
#include "constants/songs.h"

struct OakSpeechResources
{
    void * unk_0000;
    u8 filler_0004[0x4];
    void * unk_0008;
    u8 filler_000C[4];
    u16 unk_0010;
    u16 unk_0012;
    u16 unk_0014[4];
    u8 unk_001C[3];
    u8 unk_001F;
    u8 filler_0020[0x1800];
    u8 bg2TilemapBuffer[0x400];
    u8 bg1TilemapBuffer[0x800];
}; //size=0x2420

EWRAM_DATA struct OakSpeechResources * sOakSpeechResources = NULL;

void sub_812E9F8(u8 taskId);
void sub_812EB58(u8 taskId);
void sub_812EEB0(void);
void sub_812F0B0(u8 taskId);
void sub_812F180(u8 taskId);
void sub_812F274(u8 taskId);
void sub_812F33C(u8 taskId);
void sub_812F4A8(u8 taskId);
void sub_812F72C(u8 taskId);
void sub_812F7C0(u8 taskId);
void sub_812F880(u8 taskId);
void sub_812F880(u8 taskId);
void sub_812F944(u8 taskId);
void sub_812F9EC(u8 taskId);
void sub_812FA78(u8 taskId);
void sub_812FB4C(u8 taskId);
void sub_812FBF0(u8 taskId);
void sub_812FC68(u8 taskId);
void sub_812FD78(u8 taskId);
void sub_812FDC0(u8 taskId);
void sub_812FE88(u8 taskId);
void sub_812FFA4(u8 taskId);
void sub_812FFF0(u8 taskId);
void sub_8130050(u8 taskId);
void sub_81300A0(u8 taskId);
void sub_8130160(u8 taskId);
void sub_8130324(u8 taskId);
void sub_81303B4(u8 taskId);
void sub_8130464(u8 taskId);
void sub_8130554(u8 taskId);
void sub_8130650(u8 taskId);
void sub_8130694(u8 taskId);
void sub_81306D4(u8 taskId);
void sub_813071C(u8 taskId);
void sub_81307D0(u8 taskId);
void sub_8130858(u8 taskId);
void sub_81308D0(u8 taskId);
void sub_8130914(u8 taskId);
void sub_8130940(u8 taskId);
void sub_8130980(u8 taskId);
void sub_8130A38(u8 taskId);
void sub_8130A80(u8 taskId);
void sub_8130ADC(u8 taskId);
void sub_8130B10(u8 taskId);
void sub_8130BA8(u8 taskId);
void sub_8130BF0(u8 taskId);
void sub_8130C20(u8 taskId);

static void CB2_ReturnFromNamingScreen(void);
static void CreateNidoranFSprite(u8 taskId);
void sub_8130FD4(u8 taskId, u8 state);
void sub_8131168(u8 taskId, u8 state);
void sub_81311F4(u8 arg0, u8 state);
void sub_8131310(void);
void sub_813144C(u8 taskId, u8 state);
void sub_81315CC(u8 taskId, u8 state);
void sub_8131660(u8 taskId, u8 state);
void sub_8131754(u8 arg0, u8 namePick);

extern const u8 gUnknown_8415D2C[];
extern const u8 gUnknown_8415D48[];
extern const u8 gUnknown_8415D50[];
extern const u8 gUnknown_8415D93[];
extern const u8 gUnknown_8415D97[];

extern const struct CompressedSpriteSheet gUnknown_8235194[];
extern const struct CompressedSpritePalette gUnknown_82373F4;

const u8 gUnknown_845FD54[][5] = {
    [SPECIES_BULBASAUR - 1] = {0x16, 0x1b, 0x30, 0x16, 0x29},
    [SPECIES_IVYSAUR - 1] = {0x14, 0x1b, 0x30, 0x15, 0x2a},
    [SPECIES_VENUSAUR - 1] = {0x1b, 0x20, 0x20, 0x1b, 0x33},
    [SPECIES_CHARMANDER - 1] = {0x14, 0x0f, 0x38, 0x13, 0x1e},
    [SPECIES_CHARMELEON - 1] = {0x0d, 0x11, 0x30, 0x0f, 0x22},
    [SPECIES_CHARIZARD - 1] = {0x1b, 0x07, 0x28, 0x1a, 0x19},
    [SPECIES_SQUIRTLE - 1] = {0x19, 0x13, 0x30, 0x1a, 0x22},
    [SPECIES_WARTORTLE - 1] = {0x16, 0x13, 0x30, 0x17, 0x21},
    [SPECIES_BLASTOISE - 1] = {0x12, 0x08, 0x28, 0x15, 0x19},
    [SPECIES_CATERPIE - 1] = {0x15, 0x14, 0x30, 0x13, 0x24},
    [SPECIES_METAPOD - 1] = {0x13, 0x1d, 0x30, 0x18, 0x2a},
    [SPECIES_BUTTERFREE - 1] = {0x12, 0x1b, 0x08, 0x12, 0x2a},
    [SPECIES_WEEDLE - 1] = {0x16, 0x1c, 0x30, 0x15, 0x2b},
    [SPECIES_KAKUNA - 1] = {0x19, 0x13, 0x30, 0x1a, 0x24},
    [SPECIES_BEEDRILL - 1] = {0x19, 0x16, 0x08, 0x19, 0x25},
    [SPECIES_PIDGEY - 1] = {0x15, 0x12, 0x30, 0x12, 0x1e},
    [SPECIES_PIDGEOTTO - 1] = {0x24, 0x0e, 0x30, 0x1f, 0x1e},
    [SPECIES_PIDGEOT - 1] = {0x0c, 0x13, 0x08, 0x0a, 0x23},
    [SPECIES_RATTATA - 1] = {0x17, 0x1e, 0x30, 0x18, 0x2d},
    [SPECIES_RATICATE - 1] = {0x12, 0x14, 0x30, 0x10, 0x26},
    [SPECIES_SPEAROW - 1] = {0x15, 0x14, 0x30, 0x15, 0x1f},
    [SPECIES_FEAROW - 1] = {0x0c, 0x27, 0x00, 0x0b, 0x3f},
    [SPECIES_EKANS - 1] = {0x11, 0x0f, 0x30, 0x14, 0x1d},
    [SPECIES_ARBOK - 1] = {0x1b, 0x01, 0x28, 0x1d, 0x10},
    [SPECIES_PIKACHU - 1] = {0x19, 0x13, 0x30, 0x1a, 0x1f},
    [SPECIES_RAICHU - 1] = {0x19, 0x14, 0x28, 0x1c, 0x22},
    [SPECIES_SANDSHREW - 1] = {0x17, 0x16, 0x30, 0x18, 0x25},
    [SPECIES_SANDSLASH - 1] = {0x11, 0x13, 0x28, 0x13, 0x22},
    [SPECIES_NIDORAN_F - 1] = {0x16, 0x15, 0x30, 0x18, 0x21},
    [SPECIES_NIDORINA - 1] = {0x1f, 0x17, 0x30, 0x1e, 0x28},
    [SPECIES_NIDOQUEEN - 1] = {0x10, 0x0b, 0x28, 0x13, 0x1c},
    [SPECIES_NIDORAN_M - 1] = {0x15, 0x22, 0x28, 0x15, 0x31},
    [SPECIES_NIDORINO - 1] = {0x13, 0x1e, 0x28, 0x1b, 0x2d},
    [SPECIES_NIDOKING - 1] = {0x12, 0x15, 0x28, 0x13, 0x27},
    [SPECIES_CLEFAIRY - 1] = {0x19, 0x14, 0x30, 0x1b, 0x24},
    [SPECIES_CLEFABLE - 1] = {0x1c, 0x12, 0x30, 0x1d, 0x21},
    [SPECIES_VULPIX - 1] = {0x10, 0x16, 0x30, 0x0e, 0x25},
    [SPECIES_NINETALES - 1] = {0x28, 0x10, 0x28, 0x27, 0x1e},
    [SPECIES_JIGGLYPUFF - 1] = {0x1d, 0x15, 0x30, 0x1e, 0x25},
    [SPECIES_WIGGLYTUFF - 1] = {0x1a, 0x12, 0x30, 0x1c, 0x22},
    [SPECIES_ZUBAT - 1] = {0x14, 0x1d, 0x08, 0x14, 0x29},
    [SPECIES_GOLBAT - 1] = {0x23, 0x1a, 0x00, 0x21, 0x2e},
    [SPECIES_ODDISH - 1] = {0x1d, 0x20, 0x28, 0x1d, 0x2b},
    [SPECIES_GLOOM - 1] = {0x1c, 0x18, 0x28, 0x1c, 0x27},
    [SPECIES_VILEPLUME - 1] = {0x1c, 0x1e, 0x28, 0x1d, 0x2a},
    [SPECIES_PARAS - 1] = {0x1d, 0x1a, 0x30, 0x1c, 0x27},
    [SPECIES_PARASECT - 1] = {0x1e, 0x1c, 0x28, 0x20, 0x2e},
    [SPECIES_VENONAT - 1] = {0x1b, 0x16, 0x10, 0x1a, 0x29},
    [SPECIES_VENOMOTH - 1] = {0x12, 0x19, 0x08, 0x16, 0x27},
    [SPECIES_DIGLETT - 1] = {0x1e, 0x16, 0x30, 0x1c, 0x23},
    [SPECIES_DUGTRIO - 1] = {0x1a, 0x11, 0x30, 0x1a, 0x1f},
    [SPECIES_MEOWTH - 1] = {0x1c, 0x16, 0x30, 0x1c, 0x23},
    [SPECIES_PERSIAN - 1] = {0x13, 0x13, 0x30, 0x13, 0x21},
    [SPECIES_PSYDUCK - 1] = {0x1c, 0x13, 0x30, 0x17, 0x29},
    [SPECIES_GOLDUCK - 1] = {0x17, 0x12, 0x28, 0x17, 0x22},
    [SPECIES_MANKEY - 1] = {0x1c, 0x15, 0x30, 0x1b, 0x23},
    [SPECIES_PRIMEAPE - 1] = {0x1e, 0x16, 0x30, 0x1a, 0x27},
    [SPECIES_GROWLITHE - 1] = {0x14, 0x17, 0x30, 0x14, 0x24},
    [SPECIES_ARCANINE - 1] = {0x0f, 0x09, 0x28, 0x0c, 0x19},
    [SPECIES_POLIWAG - 1] = {0x15, 0x14, 0x30, 0x13, 0x1f},
    [SPECIES_POLIWHIRL - 1] = {0x1f, 0x10, 0x30, 0x1e, 0x17},
    [SPECIES_POLIWRATH - 1] = {0x22, 0x0c, 0x30, 0x21, 0x18},
    [SPECIES_ABRA - 1] = {0x1f, 0x13, 0x30, 0x1f, 0x21},
    [SPECIES_KADABRA - 1] = {0x1b, 0x12, 0x30, 0x1c, 0x25},
    [SPECIES_ALAKAZAM - 1] = {0x1c, 0x11, 0x28, 0x1d, 0x26},
    [SPECIES_MACHOP - 1] = {0x1b, 0x11, 0x30, 0x1b, 0x1e},
    [SPECIES_MACHOKE - 1] = {0x1d, 0x11, 0x30, 0x1d, 0x1f},
    [SPECIES_MACHAMP - 1] = {0x1a, 0x0d, 0x28, 0x1c, 0x1b},
    [SPECIES_BELLSPROUT - 1] = {0x15, 0x0e, 0x30, 0x0e, 0x1c},
    [SPECIES_WEEPINBELL - 1] = {0x1a, 0x1c, 0x10, 0x15, 0x32},
    [SPECIES_VICTREEBEL - 1] = {0x1e, 0x0f, 0x30, 0x1c, 0x1b},
    [SPECIES_TENTACOOL - 1] = {0x1a, 0x15, 0x30, 0x1e, 0x26},
    [SPECIES_TENTACRUEL - 1] = {0x1b, 0x10, 0x28, 0x1c, 0x26},
    [SPECIES_GEODUDE - 1] = {0x1c, 0x20, 0x28, 0x1d, 0x2d},
    [SPECIES_GRAVELER - 1] = {0x1d, 0x19, 0x28, 0x1e, 0x26},
    [SPECIES_GOLEM - 1] = {0x19, 0x1b, 0x28, 0x1c, 0x27},
    [SPECIES_PONYTA - 1] = {0x0f, 0x11, 0x30, 0x0e, 0x23},
    [SPECIES_RAPIDASH - 1] = {0x2f, 0x0f, 0x28, 0x2b, 0x1e},
    [SPECIES_SLOWPOKE - 1] = {0x14, 0x1f, 0x28, 0x15, 0x2f},
    [SPECIES_SLOWBRO - 1] = {0x0e, 0x0d, 0x28, 0x0c, 0x1f},
    [SPECIES_MAGNEMITE - 1] = {0x20, 0x1b, 0x10, 0x1f, 0x29},
    [SPECIES_MAGNETON - 1] = {0x1f, 0x14, 0x08, 0x1f, 0x22},
    [SPECIES_FARFETCHD - 1] = {0x16, 0x14, 0x30, 0x16, 0x29},
    [SPECIES_DODUO - 1] = {0x11, 0x16, 0x30, 0x0d, 0x2c},
    [SPECIES_DODRIO - 1] = {0x1d, 0x04, 0x28, 0x0e, 0x07},
    [SPECIES_SEEL - 1] = {0x1b, 0x24, 0x20, 0x17, 0x35},
    [SPECIES_DEWGONG - 1] = {0x12, 0x0a, 0x30, 0x0e, 0x1a},
    [SPECIES_GRIMER - 1] = {0x1f, 0x10, 0x30, 0x1d, 0x25},
    [SPECIES_MUK - 1] = {0x17, 0x0f, 0x30, 0x19, 0x22},
    [SPECIES_SHELLDER - 1] = {0x1a, 0x18, 0x30, 0x17, 0x29},
    [SPECIES_CLOYSTER - 1] = {0x19, 0x1e, 0x28, 0x1d, 0x2c},
    [SPECIES_GASTLY - 1] = {0x1a, 0x1f, 0x08, 0x19, 0x30},
    [SPECIES_HAUNTER - 1] = {0x20, 0x14, 0x08, 0x1d, 0x26},
    [SPECIES_GENGAR - 1] = {0x1a, 0x16, 0x30, 0x19, 0x28},
    [SPECIES_ONIX - 1] = {0x1f, 0x24, 0x20, 0x28, 0x36},
    [SPECIES_DROWZEE - 1] = {0x1a, 0x0e, 0x30, 0x1a, 0x1e},
    [SPECIES_HYPNO - 1] = {0x1c, 0x12, 0x30, 0x19, 0x24},
    [SPECIES_KRABBY - 1] = {0x1d, 0x1d, 0x30, 0x1a, 0x2b},
    [SPECIES_KINGLER - 1] = {0x1e, 0x1f, 0x28, 0x1c, 0x30},
    [SPECIES_VOLTORB - 1] = {0x1c, 0x1b, 0x30, 0x1b, 0x2b},
    [SPECIES_ELECTRODE - 1] = {0x1c, 0x18, 0x30, 0x1d, 0x2e},
    [SPECIES_EXEGGCUTE - 1] = {0x21, 0x17, 0x30, 0x20, 0x24},
    [SPECIES_EXEGGUTOR - 1] = {0x1c, 0x17, 0x28, 0x1b, 0x25},
    [SPECIES_CUBONE - 1] = {0x1b, 0x12, 0x30, 0x1b, 0x22},
    [SPECIES_MAROWAK - 1] = {0x14, 0x0f, 0x30, 0x11, 0x23},
    [SPECIES_HITMONLEE - 1] = {0x2e, 0x11, 0x30, 0x28, 0x22},
    [SPECIES_HITMONCHAN - 1] = {0x22, 0x0e, 0x30, 0x1e, 0x1d},
    [SPECIES_LICKITUNG - 1] = {0x14, 0x11, 0x30, 0x14, 0x24},
    [SPECIES_KOFFING - 1] = {0x1e, 0x14, 0x10, 0x1d, 0x20},
    [SPECIES_WEEZING - 1] = {0x11, 0x0d, 0x10, 0x0f, 0x1c},
    [SPECIES_RHYHORN - 1] = {0x0e, 0x23, 0x20, 0x14, 0x33},
    [SPECIES_RHYDON - 1] = {0x0d, 0x12, 0x28, 0x17, 0x22},
    [SPECIES_CHANSEY - 1] = {0x1a, 0x0d, 0x30, 0x1a, 0x1a},
    [SPECIES_TANGELA - 1] = {0x1c, 0x18, 0x30, 0x1d, 0x29},
    [SPECIES_KANGASKHAN - 1] = {0x1b, 0x06, 0x28, 0x1c, 0x14},
    [SPECIES_HORSEA - 1] = {0x1c, 0x14, 0x30, 0x16, 0x23},
    [SPECIES_SEADRA - 1] = {0x10, 0x17, 0x30, 0x09, 0x2a},
    [SPECIES_GOLDEEN - 1] = {0x16, 0x23, 0x20, 0x15, 0x34},
    [SPECIES_SEAKING - 1] = {0x16, 0x0f, 0x30, 0x10, 0x18},
    [SPECIES_STARYU - 1] = {0x1c, 0x18, 0x30, 0x1a, 0x26},
    [SPECIES_STARMIE - 1] = {0x1d, 0x13, 0x30, 0x1b, 0x20},
    [SPECIES_MR_MIME - 1] = {0x24, 0x11, 0x30, 0x25, 0x1e},
    [SPECIES_SCYTHER - 1] = {0x10, 0x19, 0x28, 0x12, 0x27},
    [SPECIES_JYNX - 1] = {0x1b, 0x0f, 0x30, 0x19, 0x1c},
    [SPECIES_ELECTABUZZ - 1] = {0x14, 0x11, 0x30, 0x17, 0x20},
    [SPECIES_MAGMAR - 1] = {0x10, 0x0e, 0x30, 0x0b, 0x19},
    [SPECIES_PINSIR - 1] = {0x1d, 0x1c, 0x28, 0x20, 0x2b},
    [SPECIES_TAUROS - 1] = {0x11, 0x1d, 0x28, 0x13, 0x2e},
    [SPECIES_MAGIKARP - 1] = {0x16, 0x15, 0x30, 0x13, 0x23},
    [SPECIES_GYARADOS - 1] = {0x0b, 0x18, 0x28, 0x16, 0x29},
    [SPECIES_LAPRAS - 1] = {0x16, 0x08, 0x28, 0x15, 0x16},
    [SPECIES_DITTO - 1] = {0x24, 0x12, 0x30, 0x1f, 0x20},
    [SPECIES_EEVEE - 1] = {0x16, 0x16, 0x30, 0x16, 0x23},
    [SPECIES_VAPOREON - 1] = {0x18, 0x23, 0x28, 0x18, 0x30},
    [SPECIES_JOLTEON - 1] = {0x14, 0x1b, 0x30, 0x16, 0x28},
    [SPECIES_FLAREON - 1] = {0x16, 0x17, 0x30, 0x14, 0x25},
    [SPECIES_PORYGON - 1] = {0x18, 0x12, 0x30, 0x10, 0x23},
    [SPECIES_OMANYTE - 1] = {0x1d, 0x1d, 0x30, 0x1c, 0x2b},
    [SPECIES_OMASTAR - 1] = {0x16, 0x1a, 0x30, 0x19, 0x2d},
    [SPECIES_KABUTO - 1] = {0x1b, 0x16, 0x30, 0x1a, 0x27},
    [SPECIES_KABUTOPS - 1] = {0x15, 0x11, 0x30, 0x15, 0x1f},
    [SPECIES_AERODACTYL - 1] = {0x13, 0x1d, 0x00, 0x14, 0x30},
    [SPECIES_SNORLAX - 1] = {0x35, 0x09, 0x30, 0x2e, 0x14},
    [SPECIES_ARTICUNO - 1] = {0x18, 0x0b, 0x18, 0x17, 0x17},
    [SPECIES_ZAPDOS - 1] = {0x0e, 0x0e, 0x10, 0x04, 0x28},
    [SPECIES_MOLTRES - 1] = {0x0b, 0x2a, 0x08, 0x0b, 0x38},
    [SPECIES_DRATINI - 1] = {0x0d, 0x12, 0x30, 0x0b, 0x21},
    [SPECIES_DRAGONAIR - 1] = {0x18, 0x0e, 0x30, 0x13, 0x1c},
    [SPECIES_DRAGONITE - 1] = {0x1b, 0x07, 0x18, 0x19, 0x17},
    [SPECIES_MEWTWO - 1] = {0x2b, 0x09, 0x28, 0x2c, 0x18},
    [SPECIES_MEW - 1] = {0x19, 0x14, 0x10, 0x1f, 0x21},
    [SPECIES_CHIKORITA - 1] = {0x1b, 0x17, 0x30, 0x1b, 0x24},
    [SPECIES_BAYLEEF - 1] = {0x1d, 0x10, 0x30, 0x20, 0x1d},
    [SPECIES_MEGANIUM - 1] = {0x05, 0x0d, 0x28, 0x0d, 0x1b},
    [SPECIES_CYNDAQUIL - 1] = {0x11, 0x1b, 0x30, 0x14, 0x27},
    [SPECIES_QUILAVA - 1] = {0x25, 0x18, 0x30, 0x27, 0x26},
    [SPECIES_TYPHLOSION - 1] = {0x09, 0x10, 0x28, 0x10, 0x1c},
    [SPECIES_TOTODILE - 1] = {0x16, 0x10, 0x30, 0x19, 0x20},
    [SPECIES_CROCONAW - 1] = {0x16, 0x10, 0x30, 0x18, 0x21},
    [SPECIES_FERALIGATR - 1] = {0x0e, 0x0a, 0x28, 0x08, 0x1a},
    [SPECIES_SENTRET - 1] = {0x1e, 0x0a, 0x30, 0x1d, 0x15},
    [SPECIES_FURRET - 1] = {0x21, 0x0e, 0x30, 0x21, 0x19},
    [SPECIES_HOOTHOOT - 1] = {0x1d, 0x15, 0x30, 0x1c, 0x24},
    [SPECIES_NOCTOWL - 1] = {0x19, 0x0e, 0x30, 0x18, 0x1c},
    [SPECIES_LEDYBA - 1] = {0x1b, 0x15, 0x30, 0x1c, 0x24},
    [SPECIES_LEDIAN - 1] = {0x18, 0x12, 0x10, 0x1c, 0x21},
    [SPECIES_SPINARAK - 1] = {0x20, 0x20, 0x28, 0x20, 0x2d},
    [SPECIES_ARIADOS - 1] = {0x17, 0x23, 0x28, 0x15, 0x30},
    [SPECIES_CROBAT - 1] = {0x22, 0x1e, 0x08, 0x23, 0x2b},
    [SPECIES_CHINCHOU - 1] = {0x1f, 0x1d, 0x30, 0x1f, 0x29},
    [SPECIES_LANTURN - 1] = {0x10, 0x23, 0x28, 0x19, 0x33},
    [SPECIES_PICHU - 1] = {0x1e, 0x17, 0x30, 0x1e, 0x24},
    [SPECIES_CLEFFA - 1] = {0x1c, 0x18, 0x30, 0x1e, 0x26},
    [SPECIES_IGGLYBUFF - 1] = {0x1f, 0x19, 0x30, 0x1f, 0x24},
    [SPECIES_TOGEPI - 1] = {0x21, 0x15, 0x30, 0x1f, 0x20},
    [SPECIES_TOGETIC - 1] = {0x1b, 0x10, 0x30, 0x1c, 0x1c},
    [SPECIES_NATU - 1] = {0x1c, 0x17, 0x30, 0x15, 0x21},
    [SPECIES_XATU - 1] = {0x1b, 0x08, 0x30, 0x19, 0x14},
    [SPECIES_MAREEP - 1] = {0x16, 0x15, 0x30, 0x15, 0x24},
    [SPECIES_FLAAFFY - 1] = {0x19, 0x12, 0x30, 0x18, 0x21},
    [SPECIES_AMPHAROS - 1] = {0x0f, 0x0a, 0x30, 0x10, 0x1b},
    [SPECIES_BELLOSSOM - 1] = {0x1f, 0x13, 0x30, 0x1f, 0x20},
    [SPECIES_MARILL - 1] = {0x1d, 0x15, 0x30, 0x1d, 0x22},
    [SPECIES_AZUMARILL - 1] = {0x1a, 0x12, 0x30, 0x17, 0x1f},
    [SPECIES_SUDOWOODO - 1] = {0x20, 0x10, 0x30, 0x20, 0x1f},
    [SPECIES_POLITOED - 1] = {0x1d, 0x0f, 0x30, 0x1e, 0x20},
    [SPECIES_HOPPIP - 1] = {0x23, 0x25, 0x08, 0x25, 0x33},
    [SPECIES_SKIPLOOM - 1] = {0x1e, 0x18, 0x08, 0x1c, 0x27},
    [SPECIES_JUMPLUFF - 1] = {0x1d, 0x21, 0x08, 0x20, 0x2f},
    [SPECIES_AIPOM - 1] = {0x1e, 0x29, 0x18, 0x1e, 0x35},
    [SPECIES_SUNKERN - 1] = {0x1f, 0x20, 0x08, 0x24, 0x2e},
    [SPECIES_SUNFLORA - 1] = {0x1c, 0x0c, 0x30, 0x1b, 0x19},
    [SPECIES_YANMA - 1] = {0x1b, 0x28, 0x08, 0x16, 0x35},
    [SPECIES_WOOPER - 1] = {0x1d, 0x13, 0x30, 0x1f, 0x21},
    [SPECIES_QUAGSIRE - 1] = {0x15, 0x09, 0x30, 0x12, 0x18},
    [SPECIES_ESPEON - 1] = {0x11, 0x1b, 0x30, 0x11, 0x29},
    [SPECIES_UMBREON - 1] = {0x23, 0x15, 0x30, 0x23, 0x22},
    [SPECIES_MURKROW - 1] = {0x24, 0x13, 0x30, 0x20, 0x22},
    [SPECIES_SLOWKING - 1] = {0x1e, 0x13, 0x28, 0x1d, 0x25},
    [SPECIES_MISDREAVUS - 1] = {0x28, 0x21, 0x08, 0x26, 0x2e},
    [SPECIES_UNOWN - 1] = {0x20, 0x17, 0x08, 0x1f, 0x21},
    [SPECIES_WOBBUFFET - 1] = {0x1d, 0x09, 0x30, 0x1d, 0x1a},
    [SPECIES_GIRAFARIG - 1] = {0x0b, 0x0d, 0x28, 0x11, 0x1d},
    [SPECIES_PINECO - 1] = {0x1d, 0x12, 0x10, 0x19, 0x25},
    [SPECIES_FORRETRESS - 1] = {0x19, 0x17, 0x08, 0x1e, 0x26},
    [SPECIES_DUNSPARCE - 1] = {0x10, 0x1b, 0x30, 0x0c, 0x2d},
    [SPECIES_GLIGAR - 1] = {0x1e, 0x13, 0x08, 0x1d, 0x23},
    [SPECIES_STEELIX - 1] = {0x0c, 0x0d, 0x28, 0x0d, 0x1c},
    [SPECIES_SNUBBULL - 1] = {0x1b, 0x15, 0x30, 0x1a, 0x23},
    [SPECIES_GRANBULL - 1] = {0x1c, 0x09, 0x30, 0x19, 0x18},
    [SPECIES_QWILFISH - 1] = {0x1f, 0x26, 0x20, 0x1d, 0x33},
    [SPECIES_SCIZOR - 1] = {0x15, 0x0f, 0x10, 0x1a, 0x1a},
    [SPECIES_SHUCKLE - 1] = {0x25, 0x0a, 0x30, 0x24, 0x18},
    [SPECIES_HERACROSS - 1] = {0x18, 0x19, 0x28, 0x1a, 0x26},
    [SPECIES_SNEASEL - 1] = {0x1c, 0x13, 0x30, 0x1d, 0x24},
    [SPECIES_TEDDIURSA - 1] = {0x1e, 0x12, 0x30, 0x1b, 0x23},
    [SPECIES_URSARING - 1] = {0x1e, 0x04, 0x28, 0x1d, 0x14},
    [SPECIES_SLUGMA - 1] = {0x20, 0x18, 0x30, 0x20, 0x28},
    [SPECIES_MAGCARGO - 1] = {0x16, 0x11, 0x30, 0x17, 0x23},
    [SPECIES_SWINUB - 1] = {0x1c, 0x18, 0x30, 0x1b, 0x25},
    [SPECIES_PILOSWINE - 1] = {0x18, 0x23, 0x20, 0x18, 0x36},
    [SPECIES_CORSOLA - 1] = {0x19, 0x1d, 0x28, 0x19, 0x2b},
    [SPECIES_REMORAID - 1] = {0x15, 0x1f, 0x28, 0x13, 0x2b},
    [SPECIES_OCTILLERY - 1] = {0x1c, 0x11, 0x30, 0x1a, 0x20},
    [SPECIES_DELIBIRD - 1] = {0x1d, 0x11, 0x30, 0x1b, 0x1f},
    [SPECIES_MANTINE - 1] = {0x16, 0x1e, 0x28, 0x1f, 0x27},
    [SPECIES_SKARMORY - 1] = {0x1e, 0x00, 0x28, 0x13, 0x07},
    [SPECIES_HOUNDOUR - 1] = {0x25, 0x11, 0x30, 0x25, 0x1f},
    [SPECIES_HOUNDOOM - 1] = {0x0d, 0x13, 0x30, 0x0d, 0x24},
    [SPECIES_KINGDRA - 1] = {0x0e, 0x13, 0x28, 0x0a, 0x2c},
    [SPECIES_PHANPY - 1] = {0x1b, 0x11, 0x30, 0x19, 0x24},
    [SPECIES_DONPHAN - 1] = {0x11, 0x15, 0x30, 0x19, 0x2c},
    [SPECIES_PORYGON2 - 1] = {0x18, 0x11, 0x30, 0x11, 0x20},
    [SPECIES_STANTLER - 1] = {0x15, 0x15, 0x28, 0x17, 0x28},
    [SPECIES_SMEARGLE - 1] = {0x18, 0x10, 0x30, 0x1b, 0x25},
    [SPECIES_TYROGUE - 1] = {0x1e, 0x12, 0x30, 0x1f, 0x1f},
    [SPECIES_HITMONTOP - 1] = {0x1a, 0x39, 0x10, 0x1a, 0x2b},
    [SPECIES_SMOOCHUM - 1] = {0x20, 0x18, 0x30, 0x21, 0x26},
    [SPECIES_ELEKID - 1] = {0x1d, 0x14, 0x30, 0x1d, 0x23},
    [SPECIES_MAGBY - 1] = {0x1c, 0x15, 0x30, 0x1a, 0x24},
    [SPECIES_MILTANK - 1] = {0x18, 0x0e, 0x30, 0x18, 0x1e},
    [SPECIES_BLISSEY - 1] = {0x1d, 0x09, 0x30, 0x1d, 0x19},
    [SPECIES_RAIKOU - 1] = {0x29, 0x0c, 0x28, 0x27, 0x1e},
    [SPECIES_ENTEI - 1] = {0x08, 0x09, 0x28, 0x0b, 0x18},
    [SPECIES_SUICUNE - 1] = {0x23, 0x1d, 0x28, 0x26, 0x2c},
    [SPECIES_LARVITAR - 1] = {0x1c, 0x18, 0x30, 0x1a, 0x24},
    [SPECIES_PUPITAR - 1] = {0x1b, 0x19, 0x30, 0x1b, 0x28},
    [SPECIES_TYRANITAR - 1] = {0x06, 0x0b, 0x28, 0x0d, 0x19},
    [SPECIES_LUGIA - 1] = {0x08, 0x2a, 0x08, 0x14, 0x34},
    [SPECIES_HO_OH - 1] = {0x0d, 0x25, 0x08, 0x0e, 0x34},
    [SPECIES_CELEBI - 1] = {0x15, 0x21, 0x08, 0x1a, 0x2b},
    [SPECIES_OLD_UNOWN_B - 1] = {0x1f, 0x12, 0x08, 0x1e, 0x1c},
    [SPECIES_OLD_UNOWN_C - 1] = {0x20, 0x17, 0x08, 0x1f, 0x21},
    [SPECIES_OLD_UNOWN_D - 1] = {0x1c, 0x19, 0x08, 0x1b, 0x23},
    [SPECIES_OLD_UNOWN_E - 1] = {0x21, 0x19, 0x08, 0x20, 0x23},
    [SPECIES_OLD_UNOWN_F - 1] = {0x1b, 0x13, 0x08, 0x1a, 0x1d},
    [SPECIES_OLD_UNOWN_G - 1] = {0x20, 0x16, 0x08, 0x1f, 0x21},
    [SPECIES_OLD_UNOWN_H - 1] = {0x20, 0x19, 0x08, 0x1f, 0x23},
    [SPECIES_OLD_UNOWN_I - 1] = {0x20, 0x19, 0x08, 0x1f, 0x23},
    [SPECIES_OLD_UNOWN_J - 1] = {0x20, 0x16, 0x08, 0x1f, 0x20},
    [SPECIES_OLD_UNOWN_K - 1] = {0x1d, 0x1a, 0x08, 0x1c, 0x24},
    [SPECIES_OLD_UNOWN_L - 1] = {0x20, 0x16, 0x08, 0x1f, 0x1f},
    [SPECIES_OLD_UNOWN_M - 1] = {0x20, 0x1c, 0x08, 0x1f, 0x26},
    [SPECIES_OLD_UNOWN_N - 1] = {0x20, 0x1a, 0x08, 0x1f, 0x23},
    [SPECIES_OLD_UNOWN_O - 1] = {0x20, 0x1a, 0x08, 0x1f, 0x23},
    [SPECIES_OLD_UNOWN_P - 1] = {0x20, 0x16, 0x08, 0x1f, 0x20},
    [SPECIES_OLD_UNOWN_Q - 1] = {0x1d, 0x16, 0x08, 0x1c, 0x20},
    [SPECIES_OLD_UNOWN_R - 1] = {0x20, 0x15, 0x08, 0x1f, 0x1f},
    [SPECIES_OLD_UNOWN_S - 1] = {0x20, 0x19, 0x08, 0x1f, 0x23},
    [SPECIES_OLD_UNOWN_T - 1] = {0x20, 0x1e, 0x08, 0x1f, 0x28},
    [SPECIES_OLD_UNOWN_U - 1] = {0x20, 0x17, 0x08, 0x1f, 0x21},
    [SPECIES_OLD_UNOWN_V - 1] = {0x1e, 0x1e, 0x08, 0x1d, 0x28},
    [SPECIES_OLD_UNOWN_W - 1] = {0x20, 0x1d, 0x08, 0x1f, 0x27},
    [SPECIES_OLD_UNOWN_X - 1] = {0x20, 0x19, 0x08, 0x1f, 0x23},
    [SPECIES_OLD_UNOWN_Y - 1] = {0x20, 0x15, 0x08, 0x1f, 0x1f},
    [SPECIES_OLD_UNOWN_Z - 1] = {0x20, 0x19, 0x08, 0x1f, 0x23},
    [SPECIES_TREECKO - 1] = {0x1a, 0x0f, 0x30, 0x19, 0x20},
    [SPECIES_GROVYLE - 1] = {0x0d, 0x05, 0x10, 0x05, 0x13},
    [SPECIES_SCEPTILE - 1] = {0x10, 0x04, 0x28, 0x0c, 0x12},
    [SPECIES_TORCHIC - 1] = {0x17, 0x18, 0x30, 0x15, 0x25},
    [SPECIES_COMBUSKEN - 1] = {0x20, 0x12, 0x28, 0x1e, 0x20},
    [SPECIES_BLAZIKEN - 1] = {0x1a, 0x07, 0x28, 0x1d, 0x13},
    [SPECIES_MUDKIP - 1] = {0x1b, 0x1d, 0x28, 0x19, 0x2c},
    [SPECIES_MARSHTOMP - 1] = {0x1d, 0x11, 0x30, 0x1c, 0x20},
    [SPECIES_SWAMPERT - 1] = {0x1b, 0x11, 0x28, 0x1b, 0x23},
    [SPECIES_POOCHYENA - 1] = {0x14, 0x12, 0x30, 0x0f, 0x20},
    [SPECIES_MIGHTYENA - 1] = {0x09, 0x0d, 0x28, 0x09, 0x1c},
    [SPECIES_ZIGZAGOON - 1] = {0x0b, 0x1a, 0x30, 0x09, 0x2b},
    [SPECIES_LINOONE - 1] = {0x0d, 0x28, 0x18, 0x0b, 0x37},
    [SPECIES_WURMPLE - 1] = {0x21, 0x17, 0x30, 0x1f, 0x26},
    [SPECIES_SILCOON - 1] = {0x13, 0x1c, 0x30, 0x11, 0x2a},
    [SPECIES_BEAUTIFLY - 1] = {0x0f, 0x1b, 0x08, 0x0e, 0x28},
    [SPECIES_CASCOON - 1] = {0x14, 0x1d, 0x30, 0x11, 0x2c},
    [SPECIES_DUSTOX - 1] = {0x14, 0x19, 0x08, 0x16, 0x26},
    [SPECIES_LOTAD - 1] = {0x19, 0x25, 0x28, 0x17, 0x32},
    [SPECIES_LOMBRE - 1] = {0x22, 0x10, 0x30, 0x29, 0x1d},
    [SPECIES_LUDICOLO - 1] = {0x1c, 0x0f, 0x28, 0x1b, 0x24},
    [SPECIES_SEEDOT - 1] = {0x1b, 0x17, 0x30, 0x18, 0x28},
    [SPECIES_NUZLEAF - 1] = {0x20, 0x0d, 0x30, 0x1a, 0x1d},
    [SPECIES_SHIFTRY - 1] = {0x32, 0x11, 0x28, 0x2e, 0x23},
    [SPECIES_NINCADA - 1] = {0x18, 0x1a, 0x30, 0x17, 0x28},
    [SPECIES_NINJASK - 1] = {0x17, 0x21, 0x00, 0x17, 0x2f},
    [SPECIES_SHEDINJA - 1] = {0x16, 0x19, 0x08, 0x18, 0x2a},
    [SPECIES_TAILLOW - 1] = {0x17, 0x10, 0x30, 0x14, 0x1e},
    [SPECIES_SWELLOW - 1] = {0x0c, 0x0a, 0x28, 0x05, 0x16},
    [SPECIES_SHROOMISH - 1] = {0x1f, 0x16, 0x30, 0x1d, 0x23},
    [SPECIES_BRELOOM - 1] = {0x25, 0x0c, 0x30, 0x23, 0x19},
    [SPECIES_SPINDA - 1] = {0x21, 0x16, 0x30, 0x1f, 0x27},
    [SPECIES_WINGULL - 1] = {0x1a, 0x16, 0x10, 0x15, 0x26},
    [SPECIES_PELIPPER - 1] = {0x1d, 0x0a, 0x10, 0x09, 0x1b},
    [SPECIES_SURSKIT - 1] = {0x1d, 0x16, 0x30, 0x1c, 0x25},
    [SPECIES_MASQUERAIN - 1] = {0x1a, 0x21, 0x08, 0x14, 0x30},
    [SPECIES_WAILMER - 1] = {0x17, 0x17, 0x30, 0x16, 0x28},
    [SPECIES_WAILORD - 1] = {0x17, 0x03, 0x30, 0x09, 0x13},
    [SPECIES_SKITTY - 1] = {0x24, 0x1a, 0x30, 0x22, 0x2a},
    [SPECIES_DELCATTY - 1] = {0x1e, 0x12, 0x30, 0x1c, 0x21},
    [SPECIES_KECLEON - 1] = {0x19, 0x10, 0x30, 0x13, 0x1e},
    [SPECIES_BALTOY - 1] = {0x1d, 0x15, 0x30, 0x1b, 0x22},
    [SPECIES_CLAYDOL - 1] = {0x1e, 0x0d, 0x28, 0x1d, 0x24},
    [SPECIES_NOSEPASS - 1] = {0x1f, 0x10, 0x30, 0x15, 0x23},
    [SPECIES_TORKOAL - 1] = {0x0e, 0x19, 0x28, 0x0a, 0x27},
    [SPECIES_SABLEYE - 1] = {0x1e, 0x16, 0x30, 0x1d, 0x27},
    [SPECIES_BARBOACH - 1] = {0x17, 0x12, 0x30, 0x15, 0x1e},
    [SPECIES_WHISCASH - 1] = {0x18, 0x20, 0x28, 0x17, 0x31},
    [SPECIES_LUVDISC - 1] = {0x19, 0x0f, 0x30, 0x13, 0x1c},
    [SPECIES_CORPHISH - 1] = {0x1f, 0x14, 0x30, 0x1d, 0x23},
    [SPECIES_CRAWDAUNT - 1] = {0x14, 0x0c, 0x28, 0x18, 0x23},
    [SPECIES_FEEBAS - 1] = {0x18, 0x1e, 0x28, 0x16, 0x2f},
    [SPECIES_MILOTIC - 1] = {0x20, 0x0c, 0x28, 0x1f, 0x1d},
    [SPECIES_CARVANHA - 1] = {0x16, 0x19, 0x30, 0x13, 0x22},
    [SPECIES_SHARPEDO - 1] = {0x19, 0x0c, 0x28, 0x17, 0x27},
    [SPECIES_TRAPINCH - 1] = {0x29, 0x13, 0x30, 0x17, 0x18},
    [SPECIES_VIBRAVA - 1] = {0x10, 0x27, 0x20, 0x0e, 0x34},
    [SPECIES_FLYGON - 1] = {0x22, 0x07, 0x10, 0x21, 0x13},
    [SPECIES_MAKUHITA - 1] = {0x22, 0x13, 0x30, 0x1c, 0x23},
    [SPECIES_HARIYAMA - 1] = {0x24, 0x0f, 0x28, 0x26, 0x1c},
    [SPECIES_ELECTRIKE - 1] = {0x11, 0x18, 0x30, 0x14, 0x27},
    [SPECIES_MANECTRIC - 1] = {0x2f, 0x18, 0x28, 0x2e, 0x29},
    [SPECIES_NUMEL - 1] = {0x10, 0x1a, 0x30, 0x0d, 0x2a},
    [SPECIES_CAMERUPT - 1] = {0x0d, 0x22, 0x28, 0x0e, 0x36},
    [SPECIES_SPHEAL - 1] = {0x1e, 0x0f, 0x30, 0x18, 0x1f},
    [SPECIES_SEALEO - 1] = {0x1c, 0x09, 0x30, 0x1a, 0x18},
    [SPECIES_WALREIN - 1] = {0x19, 0x01, 0x28, 0x10, 0x16},
    [SPECIES_CACNEA - 1] = {0x1f, 0x17, 0x30, 0x1d, 0x29},
    [SPECIES_CACTURNE - 1] = {0x1d, 0x0e, 0x28, 0x1d, 0x1b},
    [SPECIES_SNORUNT - 1] = {0x1e, 0x16, 0x30, 0x1e, 0x26},
    [SPECIES_GLALIE - 1] = {0x1a, 0x1c, 0x08, 0x1a, 0x31},
    [SPECIES_LUNATONE - 1] = {0x1c, 0x16, 0x08, 0x19, 0x2c},
    [SPECIES_SOLROCK - 1] = {0x18, 0x18, 0x10, 0x17, 0x31},
    [SPECIES_AZURILL - 1] = {0x1b, 0x10, 0x30, 0x18, 0x1f},
    [SPECIES_SPOINK - 1] = {0x21, 0x14, 0x30, 0x1b, 0x28},
    [SPECIES_GRUMPIG - 1] = {0x14, 0x10, 0x30, 0x15, 0x20},
    [SPECIES_PLUSLE - 1] = {0x1c, 0x16, 0x08, 0x1d, 0x25},
    [SPECIES_MINUN - 1] = {0x21, 0x16, 0x08, 0x1f, 0x26},
    [SPECIES_MAWILE - 1] = {0x2d, 0x14, 0x30, 0x2f, 0x24},
    [SPECIES_MEDITITE - 1] = {0x1f, 0x17, 0x30, 0x1e, 0x25},
    [SPECIES_MEDICHAM - 1] = {0x21, 0x0f, 0x28, 0x1e, 0x1d},
    [SPECIES_SWABLU - 1] = {0x1b, 0x16, 0x10, 0x17, 0x23},
    [SPECIES_ALTARIA - 1] = {0x1d, 0x0b, 0x10, 0x1a, 0x1a},
    [SPECIES_WYNAUT - 1] = {0x1a, 0x15, 0x30, 0x1b, 0x26},
    [SPECIES_DUSKULL - 1] = {0x10, 0x18, 0x08, 0x14, 0x2e},
    [SPECIES_DUSCLOPS - 1] = {0x1c, 0x0f, 0x30, 0x1a, 0x28},
    [SPECIES_ROSELIA - 1] = {0x1e, 0x11, 0x30, 0x1d, 0x20},
    [SPECIES_SLAKOTH - 1] = {0x19, 0x1e, 0x30, 0x18, 0x2f},
    [SPECIES_VIGOROTH - 1] = {0x10, 0x12, 0x28, 0x14, 0x24},
    [SPECIES_SLAKING - 1] = {0x37, 0x0f, 0x30, 0x29, 0x21},
    [SPECIES_GULPIN - 1] = {0x1b, 0x18, 0x30, 0x17, 0x26},
    [SPECIES_SWALOT - 1] = {0x1f, 0x06, 0x30, 0x15, 0x13},
    [SPECIES_TROPIUS - 1] = {0x18, 0x0a, 0x28, 0x20, 0x18},
    [SPECIES_WHISMUR - 1] = {0x1f, 0x19, 0x30, 0x1d, 0x29},
    [SPECIES_LOUDRED - 1] = {0x1c, 0x12, 0x28, 0x22, 0x27},
    [SPECIES_EXPLOUD - 1] = {0x10, 0x10, 0x28, 0x1a, 0x2a},
    [SPECIES_CLAMPERL - 1] = {0x20, 0x1a, 0x30, 0x1e, 0x26},
    [SPECIES_HUNTAIL - 1] = {0x13, 0x1e, 0x28, 0x15, 0x33},
    [SPECIES_GOREBYSS - 1] = {0x0d, 0x1f, 0x28, 0x03, 0x32},
    [SPECIES_ABSOL - 1] = {0x2a, 0x11, 0x28, 0x2a, 0x22},
    [SPECIES_SHUPPET - 1] = {0x16, 0x19, 0x08, 0x17, 0x27},
    [SPECIES_BANETTE - 1] = {0x1c, 0x14, 0x08, 0x1b, 0x23},
    [SPECIES_SEVIPER - 1] = {0x0e, 0x0d, 0x30, 0x0b, 0x1e},
    [SPECIES_ZANGOOSE - 1] = {0x18, 0x0c, 0x28, 0x15, 0x1a},
    [SPECIES_RELICANTH - 1] = {0x0c, 0x1f, 0x30, 0x09, 0x2d},
    [SPECIES_ARON - 1] = {0x18, 0x1c, 0x30, 0x1a, 0x2c},
    [SPECIES_LAIRON - 1] = {0x0b, 0x21, 0x30, 0x12, 0x2f},
    [SPECIES_AGGRON - 1] = {0x10, 0x0b, 0x28, 0x16, 0x1b},
    [SPECIES_CASTFORM - 1] = {0x1d, 0x18, 0x08, 0x1b, 0x26},
    [SPECIES_VOLBEAT - 1] = {0x25, 0x15, 0x08, 0x21, 0x25},
    [SPECIES_ILLUMISE - 1] = {0x20, 0x12, 0x08, 0x1f, 0x20},
    [SPECIES_LILEEP - 1] = {0x1e, 0x11, 0x30, 0x1f, 0x1e},
    [SPECIES_CRADILY - 1] = {0x12, 0x16, 0x28, 0x15, 0x28},
    [SPECIES_ANORITH - 1] = {0x1c, 0x1e, 0x30, 0x1b, 0x2b},
    [SPECIES_ARMALDO - 1] = {0x15, 0x05, 0x28, 0x14, 0x13},
    [SPECIES_RALTS - 1] = {0x1f, 0x17, 0x30, 0x20, 0x23},
    [SPECIES_KIRLIA - 1] = {0x1c, 0x12, 0x30, 0x1f, 0x1e},
    [SPECIES_GARDEVOIR - 1] = {0x35, 0x07, 0x28, 0x32, 0x14},
    [SPECIES_BAGON - 1] = {0x17, 0x13, 0x30, 0x16, 0x26},
    [SPECIES_SHELGON - 1] = {0x19, 0x1b, 0x30, 0x19, 0x2c},
    [SPECIES_SALAMENCE - 1] = {0x09, 0x11, 0x30, 0x0a, 0x21},
    [SPECIES_BELDUM - 1] = {0x16, 0x19, 0x08, 0x18, 0x23},
    [SPECIES_METANG - 1] = {0x22, 0x0f, 0x10, 0x1f, 0x21},
    [SPECIES_METAGROSS - 1] = {0x24, 0x1b, 0x28, 0x22, 0x2b},
    [SPECIES_REGIROCK - 1] = {0x16, 0x07, 0x28, 0x14, 0x12},
    [SPECIES_REGICE - 1] = {0x19, 0x0c, 0x28, 0x17, 0x19},
    [SPECIES_REGISTEEL - 1] = {0x19, 0x0d, 0x28, 0x19, 0x19},
    [SPECIES_KYOGRE - 1] = {0x0e, 0x19, 0x28, 0x0b, 0x26},
    [SPECIES_GROUDON - 1] = {0x04, 0x0b, 0x28, 0x0a, 0x19},
    [SPECIES_RAYQUAZA - 1] = {0x0c, 0x0e, 0x10, 0x0e, 0x1f},
    [SPECIES_LATIAS - 1] = {0x1e, 0x0c, 0x10, 0x23, 0x19},
    [SPECIES_LATIOS - 1] = {0x05, 0x0e, 0x10, 0x05, 0x1d},
    [SPECIES_JIRACHI - 1] = {0x1c, 0x15, 0x08, 0x1e, 0x22},
    [SPECIES_DEOXYS - 1] = {0x1b, 0x08, 0x28, 0x1c, 0x16},
    [SPECIES_CHIMECHO - 1] = {0x1d, 0x0c, 0x08, 0x1c, 0x1a},
    [SPECIES_OLD_UNOWN_EMARK - 1] = {0x20, 0x21, 0x08, 0x20, 0x2b},
    [SPECIES_OLD_UNOWN_QMARK - 1] = {0x20, 0x23, 0x08, 0x20, 0x2d}
};

ALIGNED(4) const u16 gUnknown_8460568[] = INCBIN_U16("data/oak_speech/unk_8460568.gbapal");
const u32 gUnknown_84605E8[] = INCBIN_U32("data/oak_speech/unk_84605E8.4bpp.lz");
const u32 gUnknown_8460BA8[] = INCBIN_U32("data/oak_speech/unk_8460BA8.bin.lz");
const u32 gUnknown_8460CA4[] = INCBIN_U32("data/oak_speech/unk_8460CA4.4bpp.lz");
const u32 gUnknown_8460CE8[] = INCBIN_U32("data/oak_speech/unk_8460CE8.bin.lz");

extern const u16 gUnknown_8460D94[];
extern const u16 gUnknown_8460E34[];

extern const struct BgTemplate gUnknown_8462E58[3];
extern const struct WindowTemplate *const gUnknown_8462EB4[3];
extern const struct WindowTemplate gUnknown_8462EC0;
extern const struct WindowTemplate gUnknown_8462EC8;
extern const struct WindowTemplate gUnknown_8462ED0;
extern const struct TextColor gUnknown_8462EE8;
extern const struct TextColor gUnknown_8462EEC;
extern const u8 *const gUnknown_8462EF0[];
extern const struct CompressedSpriteSheet gUnknown_8462EFC[3];
extern const struct CompressedSpriteSheet gUnknown_8462F14;
extern const struct SpritePalette gUnknown_8462F1C;
extern const struct SpritePalette gUnknown_8462F24;
extern const struct SpriteTemplate gUnknown_8462F50[3];
extern const struct SpriteTemplate gUnknown_846302C[3];
extern const u8 *const gUnknown_8463074[];

void sub_812E944(u8 a0, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5)
{
    u8 taskId = CreateTask(sub_812E9F8, a5);
    gTasks[taskId].data[0] = a0 << 8;
    gTasks[taskId].data[1] = a1 << 8;
    gTasks[taskId].data[2] = a2;
    gTasks[taskId].data[3] = a3;
    gTasks[taskId].data[4] = (a2 - a0) * 256 / a4;
    gTasks[taskId].data[5] = (a3 - a1) * 256 / a4;
    gTasks[taskId].data[8] = a4;
    SetGpuReg(REG_OFFSET_BLDALPHA, (a1 << 8) | a0);
}

bool8 sub_812E9E4(void)
{
    return FuncIsActiveTask(sub_812E9F8);
}

void sub_812E9F8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[8] != 0)
    {
        if (data[6] == 0)
        {
            data[0] += data[4];
            data[6] = 1;
        }
        else
        {
            if (--data[8] != 0)
            {
                data[1] += data[5];
            }
            else
            {
                data[0] = data[2] << 8;
                data[1] = data[3] << 8;
            }
            data[6] = 0;
        }
        SetGpuReg(REG_OFFSET_BLDALPHA, (data[1] & ~0xFF) | ((u16)data[0] >> 8));
        if (data[8] == 0)
            DestroyTask(taskId);
    }
}

u8 sub_812EA78(u16 species, u32 personality, u8 a2)
{
    if (species == SPECIES_UNOWN)
    {
        u8 unownLetter = GetUnownLetterByPersonality(personality);
        switch (unownLetter)
        {
        case 0:
            break;
        case 26:
            species = SPECIES_OLD_UNOWN_EMARK;
            break;
        case 27:
            species = SPECIES_OLD_UNOWN_QMARK;
            break;
        default:
            species = SPECIES_OLD_UNOWN_B + unownLetter - 1;
            break;
        }
    }
    if (species != SPECIES_NONE && a2 < 5)
    {
        species--;
        if (gUnknown_845FD54[species][a2] != 0xFF)
            return gUnknown_845FD54[species][a2];
    }
    return 32;
}

s8 sub_812EAE4(u16 species, u32 personality, u8 a2)
{
    return sub_812EA78(species, personality, a2) - 32;
}

void sub_812EAFC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_812EB10(void)
{
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_812EB2C(void)
{
    gPlttBufferUnfaded[0] = RGB_BLACK;
    gPlttBufferFaded[0]   = RGB_BLACK;
    CreateTask(sub_812EB58, 0);
    SetMainCallback2(sub_812EB10);
}

void sub_812EB58(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetHBlankCallback(NULL);
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT + sizeof(u16), PLTT_SIZE - 2);
        ResetPaletteFade();
        ScanlineEffect_Stop();
        ResetSpriteData();
        FreeAllSpritePalettes();
        reset_temp_tile_data_buffers();
        sub_812B1F0(2);
        break;
    case 1:
        sOakSpeechResources = AllocZeroed(sizeof(*sOakSpeechResources));
        sub_8044AF0(1, 1);
        break;
    case 2:
        SetGpuReg(REG_OFFSET_WIN0H, 0);
        SetGpuReg(REG_OFFSET_WIN0V, 0);
        SetGpuReg(REG_OFFSET_WIN1H, 0);
        SetGpuReg(REG_OFFSET_WIN1V, 0);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        break;
    case 3:
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(1, gUnknown_8462E58, NELEMS(gUnknown_8462E58));
        SetBgTilemapBuffer(1, sOakSpeechResources->bg1TilemapBuffer);
        SetBgTilemapBuffer(2, sOakSpeechResources->bg2TilemapBuffer);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        gSpriteCoordOffsetX = 0;
        gSpriteCoordOffsetY = 0;
        break;
    case 4:
        gPaletteFade.bufferTransferDisabled = TRUE;
        sub_80F6C6C();
        sub_80F6C98();
        sub_80F77CC(0xD0);
        LoadPalette(gUnknown_8460568, 0x000, 0x080);
        LoadPalette(stdpal_get(2) + 15, 0x000, 0x002);
        break;
    case 5:
        sOakSpeechResources->unk_001F = sub_80F78A8();
        gTextFlags.flag_0 = TRUE;
        decompress_and_copy_tile_data_to_vram(1, gUnknown_84605E8, 0, 0, 0);
        break;
    case 6:
        if (free_temp_tile_data_buffers_if_possible())
            return;
        sub_80F6F54(0, 1);
        FillBgTilemapBufferRect_Palette0(1, 0x0000,  0,  0, 32, 32);
        CopyBgTilemapBufferToVram(1);
        break;
    case 7:
        sub_810F558(0, 30, 0, 13, 0x1C4);
        FillBgTilemapBufferRect_Palette0(1, 0xD00F,  0,  0, 30, 2);
        FillBgTilemapBufferRect_Palette0(1, 0xD002,  0,  2, 30, 1);
        FillBgTilemapBufferRect_Palette0(1, 0xD00E,  0, 19, 30, 1);
        sub_812EEB0();
        gPaletteFade.bufferTransferDisabled = FALSE;
        gTasks[taskId].data[5] = sub_8006300(0, 0xE6, 0x95, 0, 0);
        BlendPalettes(0xFFFFFFFF, 0x10, 0x00);
        break;
    case 10:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        ShowBg(0);
        ShowBg(1);
        SetVBlankCallback(sub_812EAFC);
        PlayBGM(323);
        gTasks[taskId].func = sub_812F0B0;
        gMain.state = 0;
        return;
    }

    gMain.state++;
}

void sub_812EEB0(void)
{
    sub_810F650(gUnknown_8415D2C, gUnknown_8415D48, 0, 0, 1);
    sOakSpeechResources->unk_0014[0] = AddWindow(gUnknown_8462EB4[sOakSpeechResources->unk_0012]);
    PutWindowTilemap(sOakSpeechResources->unk_0014[0]);
    FillWindowPixelBuffer(sOakSpeechResources->unk_0014[0], 0x00);
    AddTextPrinterParametrized2(sOakSpeechResources->unk_0014[0], 2, 2, 0, 1, 1, &gUnknown_8462EE8, 0, gUnknown_81C582D);
    CopyWindowToVram(sOakSpeechResources->unk_0014[0], 3);
    FillBgTilemapBufferRect_Palette0(1, 0x3000, 1, 3, 5, 16);
    CopyBgTilemapBufferToVram(1);
}

void sub_812EF50(u8 taskId)
{
    u8 i = 0;
    u8 r7 = sOakSpeechResources->unk_0012 - 1;
    if (sOakSpeechResources->unk_0012 == 0)
    {
        sub_812EEB0();
    }
    else
    {
        sub_810F5E8(gUnknown_8415D50, 0, 1);
        for (i = 0; i < 3; i++)
        {
            sOakSpeechResources->unk_0014[i] = AddWindow(&gUnknown_8462EB4[sOakSpeechResources->unk_0012][i]);
            PutWindowTilemap(sOakSpeechResources->unk_0014[i]);
            FillWindowPixelBuffer(sOakSpeechResources->unk_0014[i], 0x00);
            AddTextPrinterParametrized2(sOakSpeechResources->unk_0014[i], 2, 6, 0, 1, 1, &gUnknown_8462EE8, 0, gUnknown_8463074[i + r7 * 3]);
            CopyWindowToVram(sOakSpeechResources->unk_0014[i], 3);
        }

        if (sOakSpeechResources->unk_0012 == 1)
        {
            CopyToBgTilemapBufferRect(1, gUnknown_8460D94, 1, 3, 5, 16);
        }
        else
        {
            CopyToBgTilemapBufferRect(1, gUnknown_8460E34, 1, 3, 5, 16);
        }
        CopyBgTilemapBufferToVram(1);
    }
    BeginNormalPaletteFade(0xFFFFDFFF, -1, 16, 0, stdpal_get(2)[15]);
    gTasks[taskId].func = sub_812F0B0;
}

void sub_812F0B0(u8 taskId)
{
    if (!gPaletteFade.active && JOY_NEW((A_BUTTON | B_BUTTON)))
    {
        if (JOY_NEW(A_BUTTON))
        {
            gTasks[taskId].data[15] = 1;
            if (sOakSpeechResources->unk_0012 < 2)
            {
                BeginNormalPaletteFade(0xFFFFDFFF, -1, 0, 16, stdpal_get(2)[15]);
            }
        }
        else
        {
            if (sOakSpeechResources->unk_0012 != 0)
            {
                gTasks[taskId].data[15] = -1;
                BeginNormalPaletteFade(0xFFFFDFFF, -1, 0, 16, stdpal_get(2)[15]);
            }
            else
                return;
        }
    }
    else
        return;
    PlaySE(SE_SELECT);
    gTasks[taskId].func = sub_812F180;
}

void sub_812F180(u8 taskId)
{
    u8 r8 = 0;
    u8 i;

    if (!gPaletteFade.active)
    {
        switch (sOakSpeechResources->unk_0012) {
        case 0:
            r8 = 1;
            break;
        case 1:
        case 2:
            r8 = 3;
            break;
        }
        sOakSpeechResources->unk_0012 += gTasks[taskId].data[15];
        if (sOakSpeechResources->unk_0012 < 3)
        {
            for (i = 0; i < r8; i++)
            {
                FillWindowPixelBuffer(sOakSpeechResources->unk_0014[i], 0x00);
                ClearWindowTilemap(sOakSpeechResources->unk_0014[i]);
                CopyWindowToVram(sOakSpeechResources->unk_0014[i], 3);
                RemoveWindow(sOakSpeechResources->unk_0014[i]);
                sOakSpeechResources->unk_0014[i] = 0;
            }
            gTasks[taskId].func = sub_812EF50;
        }
        else
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 2, 0, 16, 0);
            gTasks[taskId].func = sub_812F274;
        }
    }
}

void sub_812F274(u8 taskId)
{
    u8 i = 0;

    if (!gPaletteFade.active)
    {
        for (i = 0; i < 3; i++)
        {
            FillWindowPixelBuffer(sOakSpeechResources->unk_0014[i], 0x00);
            ClearWindowTilemap(sOakSpeechResources->unk_0014[i]);
            CopyWindowToVram(sOakSpeechResources->unk_0014[i], 3);
            RemoveWindow(sOakSpeechResources->unk_0014[i]);
            sOakSpeechResources->unk_0014[i] = 0;
        }
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 2, 30, 18);
        CopyBgTilemapBufferToVram(1);
        sub_8006398(gTasks[taskId].data[5]);
        sOakSpeechResources->unk_0014[0] = RGB_BLACK;
        LoadPalette(sOakSpeechResources->unk_0014, 0, 2);
        gTasks[taskId].data[3] = 32;
        gTasks[taskId].func = sub_812F33C;
    }
}

void sub_812F33C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u32 sp14 = 0;

    if (data[3] != 0)
        data[3]--;
    else
    {
        PlayBGM(324);
        sub_810F71C();
        sub_810F5E8(gUnknown_8415D48, 0, 1);
        sOakSpeechResources->unk_0008 = malloc_and_decompress(gUnknown_8460BA8, &sp14);
        CopyToBgTilemapBufferRect(1, sOakSpeechResources->unk_0008, 0, 2, 30, 19);
        CopyBgTilemapBufferToVram(1);
        Free(sOakSpeechResources->unk_0008);
        sOakSpeechResources->unk_0008 = NULL;
        data[14] = AddWindow(&gUnknown_8462EC0);
        PutWindowTilemap(data[14]);
        FillWindowPixelBuffer(data[14], 0x00);
        CopyWindowToVram(data[14], 3);
        sOakSpeechResources->unk_0012 = 0;
        gMain.state = 0;
        data[15] = 16;
        AddTextPrinterParametrized2(data[14], 2, 3, 5, 1, 0, &gUnknown_8462EEC, 0, gUnknown_8462EF0[0]);
        data[5] = sub_8006300(0, 0xe2, 0x91, 0, 0);
        gSprites[data[5]].oam.objMode = ST_OAM_OBJ_BLEND;
        gSprites[data[5]].oam.priority = 0;
        sub_8130FD4(taskId, 0);
        BeginNormalPaletteFade(0xFFFFFFFF, 2, 16, 0, 0);
        gTasks[taskId].func = sub_812F4A8;
    }
}

void sub_812F4A8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    switch (gMain.state)
    {
    case 0:
        if (!gPaletteFade.active)
        {
            SetGpuReg(REG_OFFSET_WIN0H, 0x00F0);
            SetGpuReg(REG_OFFSET_WIN0V, 0x10A0);
            SetGpuReg(REG_OFFSET_WININ, 0x003F);
            SetGpuReg(REG_OFFSET_WINOUT, 0x001F);
            SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
            gMain.state = 1;
        }
        break;
    case 1:
        if (JOY_NEW((A_BUTTON | B_BUTTON)))
        {
            if (JOY_NEW(A_BUTTON))
            {
                sOakSpeechResources->unk_0012++;
            }
            else if (sOakSpeechResources->unk_0012 != 0)
            {
                sOakSpeechResources->unk_0012--;
            }
            else
            {
                break;
            }
            PlaySE(SE_SELECT);
            if (sOakSpeechResources->unk_0012 == 3)
            {
                gMain.state = 4;
            }
            else
            {
                SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1);
                SetGpuReg(REG_OFFSET_BLDALPHA, (16 - data[15]) | data[15]);
                gMain.state++;
            }
        }
        break;
    case 2:
        data[15] -= 2;
        SetGpuReg(REG_OFFSET_BLDALPHA, ((16 - data[15]) << 8) | data[15]);
        if (data[15] <= 0)
        {
            FillWindowPixelBuffer(data[14], 0x00);
            AddTextPrinterParametrized2(data[14], 2, 3, 5, 1, 0, &gUnknown_8462EEC, 0, gUnknown_8462EF0[sOakSpeechResources->unk_0012]);
            if (sOakSpeechResources->unk_0012 == 0)
            {
                sub_810F71C();
                sub_810F5E8(gUnknown_8415D48, 0, 1);
            }
            else
            {
                sub_810F71C();
                sub_810F5E8(gUnknown_8415D50, 0, 1);
            }
            gMain.state++;
        }
        break;
    case 3:
        data[15] += 2;
        SetGpuReg(REG_OFFSET_BLDALPHA, ((16 - data[15]) << 8) | data[15]);
        if (data[15] >= 16)
        {
            data[15] = 16;
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            SetGpuReg(REG_OFFSET_BLDALPHA, 0);
            gMain.state = 1;
        }
        break;
    case 4:
        sub_8006398(gTasks[taskId].data[5]);
        PlayBGM(325);
        data[15] = 24;
        gMain.state++;
        break;
    default:
        if (data[15] != 0)
            data[15]--;
        else
        {
            gMain.state = 0;
            sOakSpeechResources->unk_0012 = 0;
            SetGpuReg(REG_OFFSET_WIN0H, 0);
            SetGpuReg(REG_OFFSET_WIN0V, 0);
            SetGpuReg(REG_OFFSET_WININ, 0);
            SetGpuReg(REG_OFFSET_WINOUT, 0);
            ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
            BeginNormalPaletteFade(0xFFFFFFFF, 2, 0, 16, RGB_BLACK);
            gTasks[taskId].func = sub_812F72C;
        }
        break;
    }
}

void sub_812F72C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        sub_810F740();
        FillWindowPixelBuffer(data[14], 0x00);
        ClearWindowTilemap(data[14]);
        CopyWindowToVram(data[14], 3);
        RemoveWindow(data[14]);
        data[14] = 0;
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(1);
        sub_8131168(taskId, 0);
        data[3] = 80;
        gTasks[taskId].func = sub_812F7C0;
    }
}

void sub_812F7C0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u32 size = 0;

    if (data[3] != 0)
        data[3]--;
    else
    {
        sOakSpeechResources->unk_0000 = malloc_and_decompress(gUnknown_8460CA4, &size);
        LoadBgTiles(1, sOakSpeechResources->unk_0000, size, 0);
        CopyToBgTilemapBuffer(1, gUnknown_8460CE8, 0, 0);
        CopyBgTilemapBufferToVram(1);
        CreateNidoranFSprite(taskId);
        sub_81311F4(3, 0);
        sub_8130FD4(taskId, 1);
        PlayBGM(292);
        BeginNormalPaletteFade(0xFFFFFFFF, 5, 16, 0, RGB_BLACK);
        data[3] = 80;
        ShowBg(2);
        gTasks[taskId].func = sub_812F880;
    }
}

#define OaksSpeechPrintMessage(str, speed) ({ \
    sub_80F6EE4(0, FALSE);\
    if (str != gStringVar4) \
    { \
        StringExpandPlaceholders(gStringVar4, str); \
        AddTextPrinterParametrized(0, 4, gStringVar4, speed, NULL, 2, 1, 3); \
    } \
    else \
    { \
        AddTextPrinterParametrized(0, 4, str, speed, NULL, 2, 1, 3); \
    } \
    CopyWindowToVram(0, 3); \
})

void sub_812F880(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        if (data[3] != 0)
            data[3]--;
        else
        {
            OaksSpeechPrintMessage(gUnknown_81C5C78, sOakSpeechResources->unk_001F);
            gTasks[taskId].func = sub_812F944;
        }
    }
}

void sub_812F944(u8 taskId)
{
    if (!IsTextPrinterActive(0))
    {
        OaksSpeechPrintMessage(gUnknown_81C5D06, sOakSpeechResources->unk_001F);
        gTasks[taskId].data[3] = 30;
        gTasks[taskId].func = sub_812F9EC;
    }
}

void sub_812F9EC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 spriteId;

    if (!IsTextPrinterActive(0))
    {
        if (data[3] != 0)
            data[3]--;
        // else {
        spriteId = gTasks[taskId].data[4];
        gSprites[spriteId].invisible = FALSE;
        gSprites[spriteId].data[0] = 0;
        CreatePokeballSpriteToReleaseMon(spriteId, gSprites[spriteId].oam.paletteNum, 0x64, 0x42, 0, 0, 32, 0xFFFF1FFF);
        gTasks[taskId].func = sub_812FA78;
        gTasks[taskId].data[3] = 0;
        // }
    }
}

void sub_812FA78(u8 taskId)
{
    if (IsCryFinished())
    {
        if (gTasks[taskId].data[3] >= 96)
            gTasks[taskId].func = sub_812FB4C;
    }
    if (gTasks[taskId].data[3] < 0x4000)
    {
        gTasks[taskId].data[3]++;
        if (gTasks[taskId].data[3] == 32)
        {
            OaksSpeechPrintMessage(gUnknown_81C5D12, sOakSpeechResources->unk_001F);
            PlayCry1(SPECIES_NIDORAN_F, 0);
        }
    }
}

void sub_812FB4C(u8 taskId)
{
    if (!IsTextPrinterActive(0))
    {
        OaksSpeechPrintMessage(gUnknown_81C5D4B, sOakSpeechResources->unk_001F);
        gTasks[taskId].func = sub_812FBF0;
    }
}

void sub_812FBF0(u8 taskId)
{
    u8 spriteId;

    if (!IsTextPrinterActive(0))
    {
        sub_80F6F54(0, 1);
        spriteId = gTasks[taskId].data[4];
        gTasks[taskId].data[6] = sub_804BB98(spriteId, gSprites[spriteId].oam.paletteNum, 0x64, 0x42, 0, 0, 32, 0xFFFF1F3F);
        gTasks[taskId].data[3] = 48;
        gTasks[taskId].data[0] = 64;
        gTasks[taskId].func = sub_812FC68;
    }
}

void sub_812FC68(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[0] != 0)
    {
        if (data[0] < 24)
        {
            gSprites[data[4]].pos1.y--;
        }
        data[0]--;
    }
    else
    {
        if (data[3] == 48)
        {
            DestroySprite(&gSprites[data[4]]);
            DestroySprite(&gSprites[data[6]]);
        }
        if (data[3] != 0)
        {
            data[3]--;
        }
        else
        {
            OaksSpeechPrintMessage(gUnknown_81C5DBD, sOakSpeechResources->unk_001F);
            gTasks[taskId].func = sub_812FD78;
        }
    }
}

void sub_812FD78(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!IsTextPrinterActive(0))
    {
        sub_80F6F54(0, 1);
        sub_813144C(taskId, 2);
        data[3] = 48;
        gTasks[taskId].func = sub_812FDC0;
    }
}

void sub_812FDC0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 0)
    {
        if (data[3] != 0)
            data[3]--;
        else
        {
            data[1] = -60;
            sub_8131310();
            OaksSpeechPrintMessage(gUnknown_81C59D5, sOakSpeechResources->unk_001F);
            gTasks[taskId].func = sub_812FE88;
        }
    }
}

void sub_812FE88(u8 taskId)
{
    if (!IsTextPrinterActive(0))
    {
        gTasks[taskId].data[13] = AddWindow(&gUnknown_8462EC8);
        PutWindowTilemap(gTasks[taskId].data[13]);
        SetWindowBorderStyle(gTasks[taskId].data[13], 1, sub_80F796C(), 14);
        FillWindowPixelBuffer(gTasks[taskId].data[13], 0x11);
        sOakSpeechResources->unk_001C[0] = 1;
        sOakSpeechResources->unk_001C[1] = 2;
        sOakSpeechResources->unk_001C[2] = 3;
        box_print(gTasks[taskId].data[13], 2, 8, 1, sOakSpeechResources->unk_001C, 0, gUnknown_8415D93);
        sOakSpeechResources->unk_001C[0] = 1;
        sOakSpeechResources->unk_001C[1] = 2;
        sOakSpeechResources->unk_001C[2] = 3;
        box_print(gTasks[taskId].data[13], 2, 8, 17, sOakSpeechResources->unk_001C, 0, gUnknown_8415D97);
        sub_810F7D8(gTasks[taskId].data[13], 2, 0, 1, GetFontAttribute(2, 1) + 2, 2, 0);
        CopyWindowToVram(gTasks[taskId].data[13], 3);
        gTasks[taskId].func = sub_812FFA4;
    }
}

void sub_812FFA4(u8 taskId)
{
    s8 input = ProcessMenuInputNoWrapAround();
    switch (input)
    {
    case 0:
        gSaveBlock2Ptr->playerGender = MALE;
        break;
    case 1:
        gSaveBlock2Ptr->playerGender = FEMALE;
        break;
    case -1:
    case -2:
        return;
    }
    gTasks[taskId].func = sub_812FFF0;

}

void sub_812FFF0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    sub_810F4D8(data[13], 1);
    RemoveWindow(data[13]);
    data[13] = 0;
    sub_80F6F54(0, 1);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
    gTasks[taskId].func = sub_8130050;
}

void sub_8130050(u8 taskId)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
        sub_81311F4(MALE, 0);
    else
        sub_81311F4(FEMALE, 0);
    sub_81315CC(taskId, 2);
    gTasks[taskId].data[3] = 32;
    gTasks[taskId].func = sub_81300A0;
}

void sub_81300A0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 0)
    {
        if (data[3] != 0)
            data[3]--;
        else
        {
            data[1] = 0;
            OaksSpeechPrintMessage(gUnknown_81C5DEA, sOakSpeechResources->unk_001F);
            gTasks[taskId].func = sub_8130160;
        }
    }
}

void sub_8130160(u8 taskId)
{
    if (!IsTextPrinterActive(0))
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        sOakSpeechResources->unk_0010 = 0;
        gTasks[taskId].func = sub_81303B4;
    }
}
void sub_81301B0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!IsTextPrinterActive(0))
    {
        if (data[1] > -60)
        {
            data[1] -= 2;
            gSpriteCoordOffsetX += 2;
            ChangeBgX(2, 0x200, 2);
        }
        else
        {
            data[1] = -60;
            sub_8131660(taskId, sOakSpeechResources->unk_0010);
            gTasks[taskId].func = sub_8130324;
        }
    }
}

void sub_8130228(u8 taskId)
{
    sub_8131660(taskId, sOakSpeechResources->unk_0010);
    if (sOakSpeechResources->unk_0010 == 0)
    {
        OaksSpeechPrintMessage(gUnknown_81C5DEA, 0);
    }
    else
    {
        OaksSpeechPrintMessage(gUnknown_81C5E91, 0);
    }
    gTasks[taskId].func = sub_8130324;
}

void sub_8130324(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s8 input = ProcessMenuInput();
    switch (input)
    {
    case 1:
    case 2:
    case 3:
    case 4:
        PlaySE(SE_SELECT);
        sub_810F4D8(data[13], TRUE);
        RemoveWindow(data[13]);
        sub_8131754(sOakSpeechResources->unk_0010, input - 1);
        data[15] = 1;
        gTasks[taskId].func = sub_8130464;
        break;
    case 0:
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].func = sub_81303B4;
        break;
    case -1:
        break;
    }
}

void sub_81303B4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_8131754(sOakSpeechResources->unk_0010, 0);
        if (sOakSpeechResources->unk_0010 == 0)
        {
            DoNamingScreen(0, gSaveBlock2Ptr->playerName, gSaveBlock2Ptr->playerGender, 0, 0, CB2_ReturnFromNamingScreen);
        }
        else
        {
            sub_810F4D8(gTasks[taskId].data[13], 1);
            RemoveWindow(gTasks[taskId].data[13]);
            DoNamingScreen(4, gSaveBlock1Ptr->rivalName, 0, 0, 0, CB2_ReturnFromNamingScreen);
        }
        sub_8131168(taskId, 1);
        FreeAllWindowBuffers();
    }
}

void sub_8130464(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        if (data[15] == 1)
        {
            if (sOakSpeechResources->unk_0010 == 0)
            {
                StringExpandPlaceholders(gStringVar4, gUnknown_81C5E13);
            }
            else
            {
                StringExpandPlaceholders(gStringVar4, gUnknown_81C5EB5);
            }
            OaksSpeechPrintMessage(gStringVar4, sOakSpeechResources->unk_001F);
            data[15] = 0;
            data[3] = 25;
        }
        else if (!IsTextPrinterActive(0))
        {
            if (data[3] != 0)
                data[3]--;
            else
            {
                sub_810FF60(&gUnknown_8462ED0, 2, 0, 2, sub_80F796C(), 14, 0);
                gTasks[taskId].func = sub_8130554;
            }
        }
    }
}

void sub_8130554(u8 taskId)
{
    s8 input = ProcessMenuInputNoWrap_();
    switch (input)
    {
    case 0:
        PlaySE(SE_SELECT);
        gTasks[taskId].data[3] = 40;
        if (sOakSpeechResources->unk_0010 == 0)
        {
            sub_80F6F54(0, 1);
            sub_813144C(taskId, 2);
            gTasks[taskId].func = sub_8130650;
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, gUnknown_81C5EC5);
            OaksSpeechPrintMessage(gStringVar4, sOakSpeechResources->unk_001F);
            gTasks[taskId].func = sub_8130694;
        }
        break;
    case 1:
    case -1:
        PlaySE(SE_SELECT);
        if (sOakSpeechResources->unk_0010 == 0)
            gTasks[taskId].func = sub_8130160;
        else
            gTasks[taskId].func = sub_8130228;
        break;
    }
}

void sub_8130650(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 0)
    {
        sub_8131310();
        if (data[3] != 0)
            data[3]--;
        else
            gTasks[taskId].func = sub_81306D4;
    }
}

void sub_8130694(u8 taskId)
{
    if (!IsTextPrinterActive(0))
    {
        sub_80F6F54(0, 1);
        sub_813144C(taskId, 2);
        gTasks[taskId].func = sub_81307D0;
    }
}

void sub_81306D4(u8 taskId)
{
    ChangeBgX(2, 0, 0);
    gTasks[taskId].data[1] = 0;
    gSpriteCoordOffsetX = 0;
    sub_81311F4(2, 0);
    sub_81315CC(taskId, 2);
    gTasks[taskId].func = sub_813071C;
}

void sub_813071C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 0)
    {
        OaksSpeechPrintMessage(gUnknown_81C5E2E, sOakSpeechResources->unk_001F);
        sOakSpeechResources->unk_0010 = 1;
        gTasks[taskId].func = sub_81301B0;
    }
}

void sub_81307D0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 0)
    {
        sub_8131310();
        if (data[3] != 0)
            data[3]--;
        else
        {
            if (gSaveBlock2Ptr->playerGender == MALE)
                sub_81311F4(MALE, 0);
            else
                sub_81311F4(FEMALE, 0);
            gTasks[taskId].data[1] = 0;
            gSpriteCoordOffsetX = 0;
            ChangeBgX(2, 0, 0);
            sub_81315CC(taskId, 2);
            gTasks[taskId].func = sub_8130858;
        }
    }
}

void sub_8130858(u8 taskId)
{
    if (gTasks[taskId].data[2] != 0)
    {
        StringExpandPlaceholders(gStringVar4, gUnknown_81C5EF4);
        OaksSpeechPrintMessage(gStringVar4, sOakSpeechResources->unk_001F);
        gTasks[taskId].data[3] = 30;
        gTasks[taskId].func = sub_81308D0;
    }
}

void sub_81308D0(u8 taskId)
{
    if (!IsTextPrinterActive(0))
    {
        if (gTasks[taskId].data[3] != 0)
            gTasks[taskId].data[3]--;
        else
        {
            FadeOutBGM(4);
            gTasks[taskId].func = sub_8130914;
        }
    }
}

void sub_8130914(u8 taskId)
{
    sOakSpeechResources->unk_0012 = 0;
    sub_8130A38(taskId);
    sub_8130ADC(taskId);
    sub_8130940(taskId);
}

void sub_8130940(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    SetBgAttribute(2, 6, 1);
    data[0] = 0;
    data[1] = 0;
    data[2] = 256;
    data[15] = 0;
    gTasks[taskId].func = sub_8130980;
}

void sub_8130980(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s16 x, y;
    u16 r0;

    sOakSpeechResources->unk_0012++;
    if (sOakSpeechResources->unk_0012 % 20 == 0)
    {
        if (sOakSpeechResources->unk_0012 == 40)
            PlaySE(SE_FU_ZUZUZU);
        r0 = data[2];
        data[2] -= 32;
        x = sub_80D8B90(r0 - 8);
        y = sub_80D8B90(data[2] - 16);
        SetBgAffine(2, 0x7800, 0x5400, 0x78, 0x54, x, y, 0);
        if (data[2] <= 96)
        {
            data[15] = 1;
            data[0] = 36;
            gTasks[taskId].func = sub_8130BA8;
        }
    }
}

void sub_8130A38(u8 taskId)
{
    u8 taskId2 = CreateTask(sub_8130A80, 1);
    s16 * data = gTasks[taskId2].data;
    data[0] = 0;
    data[1] = 0;
    data[2] = 0;
    data[15] = 0;
    BeginNormalPaletteFade(0xFFFF0FCF, 4, 0, 16, RGB_BLACK);
}

void sub_8130A80(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        if (data[1] != 0)
        {
            DestroyTask(taskId);
            sub_8131168(taskId, 1);
        }
        else
        {
            data[1]++;
            BeginNormalPaletteFade(0x0000F000, 0, 0, 16, RGB_BLACK);
        }
    }
}

void sub_8130ADC(u8 taskId)
{
    u8 taskId2 = CreateTask(sub_8130B10, 2);
    s16 * data = gTasks[taskId2].data;
    data[0] = 8;
    data[1] = 0;
    data[2] = 8;
    data[14] = 0;
    data[15] = 0;
}

void sub_8130B10(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 i;

    if (data[0] != 0)
        data[0]--;
    else
    {
        if (data[1] <= 0 && data[2] != 0)
            data[2]--;
        BlendPalette(0x40, 0x20, data[14], RGB_WHITE);
        data[14]++;
        data[1]--;
        data[0] = data[2];
        if (data[14] > 14)
        {
            for (i = 0; i < 32; i++)
            {
                gPlttBufferFaded[i + 0x40] = RGB_WHITE;
                gPlttBufferUnfaded[i + 0x40] = RGB_WHITE;
            }
            DestroyTask(taskId);
        }
    }
}

void sub_8130BA8(u8 taskId)
{
    if (gTasks[taskId].data[0] != 0)
        gTasks[taskId].data[0]--;
    else
    {
        BeginNormalPaletteFade(0x00000030, 2, 0, 16, RGB_BLACK);
        gTasks[taskId].func = sub_8130BF0;
    }
}

void sub_8130BF0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gTasks[taskId].func = sub_8130C20;
    }
}

void sub_8130C20(u8 taskId)
{
    FreeAllWindowBuffers();
    sub_8044D80();
    Free(sOakSpeechResources);
    sOakSpeechResources = NULL;
    gTextFlags.flag_0 = FALSE;
    SetMainCallback2(CB2_NewGame);
    DestroyTask(taskId);
}

static void CB2_ReturnFromNamingScreen(void)
{
    u8 taskId;

    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, RGB_BLACK, PLTT + sizeof(u16), PLTT_SIZE - sizeof(u16));
        ResetPaletteFade();
        ScanlineEffect_Stop();
        ResetSpriteData();
        FreeAllSpritePalettes();
        reset_temp_tile_data_buffers();
        break;
    case 1:
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(1, gUnknown_8462E58, NELEMS(gUnknown_8462E58));
        SetBgTilemapBuffer(1, sOakSpeechResources->bg1TilemapBuffer);
        SetBgTilemapBuffer(2, sOakSpeechResources->bg2TilemapBuffer);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        break;
    case 2:
        SetGpuReg(REG_OFFSET_WIN0H, 0);
        SetGpuReg(REG_OFFSET_WIN0V, 0);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        break;
    case 3:
        FreeAllWindowBuffers();
        sub_80F6C6C();
        sub_80F6C98();
        LoadPalette(gUnknown_8460568, 0, 0xe0);
        break;
    case 4:
        decompress_and_copy_tile_data_to_vram(1, gUnknown_8460CA4, 0, 0, 0);
        break;
    case 5:
        if (free_temp_tile_data_buffers_if_possible())
            return;
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
        CopyToBgTilemapBuffer(1, gUnknown_8460CE8, 0, 0);
        FillBgTilemapBufferRect_Palette0(2, 0x000, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        break;
    case 6:
        taskId = CreateTask(sub_8130464, 0);
        if (sOakSpeechResources->unk_0010 == 0)
        {
            if (gSaveBlock2Ptr->playerGender == MALE)
                sub_81311F4(MALE, 0);
            else
                sub_81311F4(FEMALE, 0);
        }
        else
            sub_81311F4(2, 0);
        gTasks[taskId].data[1] = -60;
        gSpriteCoordOffsetX += 60;
        ChangeBgX(2, -0x3C00, 0);
        sub_8130FD4(taskId, 1);
        gTasks[taskId].data[15] = 1;
        break;
    case 7:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        ShowBg(0);
        ShowBg(1);
        ShowBg(2);
        EnableInterrupts(INTR_FLAG_VBLANK);
        SetVBlankCallback(sub_812EAFC);
        gTextFlags.flag_0 = TRUE;
        SetMainCallback2(sub_812EB10);
        return;
    }

    gMain.state++;
}

static void CreateNidoranFSprite(u8 taskId)
{
    u8 spriteId;

    DecompressPicFromTable(gUnknown_8235194, sub_8044E00(0), SPECIES_NIDORAN_F);
    sub_800F078(&gUnknown_82373F4);
    sub_803F7D4(SPECIES_NIDORAN_F, 0);
    spriteId = CreateSprite(&gMultiuseSpriteTemplate, 0x60, 0x60, 1);
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].oam.priority = 1;
    gSprites[spriteId].invisible = TRUE;
    gTasks[taskId].data[4] = spriteId;
}

void sub_8130FB8(struct Sprite * sprite)
{
    sprite->pos2.y = gSprites[sprite->data[0]].animCmdIndex;
}

void sub_8130FD4(u8 taskId, u8 state)
{
    u8 spriteId;
    u8 i = 0;

    switch (state)
    {
    case 0:
        LoadCompressedObjectPic(&gUnknown_8462EFC[0]);
        LoadCompressedObjectPic(&gUnknown_8462EFC[1]);
        LoadCompressedObjectPic(&gUnknown_8462EFC[2]);
        LoadSpritePalette(&gUnknown_8462F1C);
        spriteId = CreateSprite(&gUnknown_846302C[0], 0x10, 0x11, 2);
        gSprites[spriteId].oam.priority = 0;
        gTasks[taskId].data[7] = spriteId;
        spriteId = CreateSprite(&gUnknown_846302C[1], 0x10, 0x09, 3);
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].data[0] = gTasks[taskId].data[7];
        gSprites[spriteId].callback = sub_8130FB8;
        gTasks[taskId].data[8] = spriteId;
        spriteId = CreateSprite(&gUnknown_846302C[2], 0x18, 0x0D, 1);
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].data[0] = gTasks[taskId].data[7];
        gSprites[spriteId].callback = sub_8130FB8;
        gTasks[taskId].data[9] = spriteId;
        break;
    case 1:
        LoadCompressedObjectPic(&gUnknown_8462F14);
        LoadSpritePalette(&gUnknown_8462F24);
        for (i = 0; i < 3; i++)
        {
            spriteId = CreateSprite(&gUnknown_8462F50[i], i * 32 + 88, 0x70, 1);
            gSprites[spriteId].oam.priority = 2;
            gSprites[spriteId].animPaused = TRUE;
            gSprites[spriteId].coordOffsetEnabled = TRUE;
            gTasks[taskId].data[7 + i] = spriteId;
        }
        break;
    }
}
