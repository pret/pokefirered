#include "global.h"
#include "gflib.h"
#include "task.h"
#include "wild_encounter.h"
#include "constants/menu.h"

// Not actually "old" given these were introduced in Gen 3,
// but they're used as equivalents here alongside the other OLD_UNOWN
#define SPECIES_OLD_UNOWN_EMARK (NUM_SPECIES + 0)
#define SPECIES_OLD_UNOWN_QMARK (NUM_SPECIES + 1)

static void Task_SmoothBlendLayers(u8 taskId);

static const u8 sMonPosAttributes[][PSA_MON_ATTR_COUNT] = {
                                  // TMHM_X, TMHM_Y, Y_OFFSET, ITEM_X, ITEM_Y
    [SPECIES_BULBASAUR       - 1] = {22, 27, 48, 22, 41},
    [SPECIES_IVYSAUR         - 1] = {20, 27, 48, 21, 42},
    [SPECIES_VENUSAUR        - 1] = {27, 32, 32, 27, 51},
    [SPECIES_CHARMANDER      - 1] = {20, 15, 56, 19, 30},
    [SPECIES_CHARMELEON      - 1] = {13, 17, 48, 15, 34},
    [SPECIES_CHARIZARD       - 1] = {27,  7, 40, 26, 25},
    [SPECIES_SQUIRTLE        - 1] = {25, 19, 48, 26, 34},
    [SPECIES_WARTORTLE       - 1] = {22, 19, 48, 23, 33},
    [SPECIES_BLASTOISE       - 1] = {18,  8, 40, 21, 25},
    [SPECIES_CATERPIE        - 1] = {21, 20, 48, 19, 36},
    [SPECIES_METAPOD         - 1] = {19, 29, 48, 24, 42},
    [SPECIES_BUTTERFREE      - 1] = {18, 27,  8, 18, 42},
    [SPECIES_WEEDLE          - 1] = {22, 28, 48, 21, 43},
    [SPECIES_KAKUNA          - 1] = {25, 19, 48, 26, 36},
    [SPECIES_BEEDRILL        - 1] = {25, 22,  8, 25, 37},
    [SPECIES_PIDGEY          - 1] = {21, 18, 48, 18, 30},
    [SPECIES_PIDGEOTTO       - 1] = {36, 14, 48, 31, 30},
    [SPECIES_PIDGEOT         - 1] = {12, 19,  8, 10, 35},
    [SPECIES_RATTATA         - 1] = {23, 30, 48, 24, 45},
    [SPECIES_RATICATE        - 1] = {18, 20, 48, 16, 38},
    [SPECIES_SPEAROW         - 1] = {21, 20, 48, 21, 31},
    [SPECIES_FEAROW          - 1] = {12, 39,  0, 11, 63},
    [SPECIES_EKANS           - 1] = {17, 15, 48, 20, 29},
    [SPECIES_ARBOK           - 1] = {27,  1, 40, 29, 16},
    [SPECIES_PIKACHU         - 1] = {25, 19, 48, 26, 31},
    [SPECIES_RAICHU          - 1] = {25, 20, 40, 28, 34},
    [SPECIES_SANDSHREW       - 1] = {23, 22, 48, 24, 37},
    [SPECIES_SANDSLASH       - 1] = {17, 19, 40, 19, 34},
    [SPECIES_NIDORAN_F       - 1] = {22, 21, 48, 24, 33},
    [SPECIES_NIDORINA        - 1] = {31, 23, 48, 30, 40},
    [SPECIES_NIDOQUEEN       - 1] = {16, 11, 40, 19, 28},
    [SPECIES_NIDORAN_M       - 1] = {21, 34, 40, 21, 49},
    [SPECIES_NIDORINO        - 1] = {19, 30, 40, 27, 45},
    [SPECIES_NIDOKING        - 1] = {18, 21, 40, 19, 39},
    [SPECIES_CLEFAIRY        - 1] = {25, 20, 48, 27, 36},
    [SPECIES_CLEFABLE        - 1] = {28, 18, 48, 29, 33},
    [SPECIES_VULPIX          - 1] = {16, 22, 48, 14, 37},
    [SPECIES_NINETALES       - 1] = {40, 16, 40, 39, 30},
    [SPECIES_JIGGLYPUFF      - 1] = {29, 21, 48, 30, 37},
    [SPECIES_WIGGLYTUFF      - 1] = {26, 18, 48, 28, 34},
    [SPECIES_ZUBAT           - 1] = {20, 29,  8, 20, 41},
    [SPECIES_GOLBAT          - 1] = {35, 26,  0, 33, 46},
    [SPECIES_ODDISH          - 1] = {29, 32, 40, 29, 43},
    [SPECIES_GLOOM           - 1] = {28, 24, 40, 28, 39},
    [SPECIES_VILEPLUME       - 1] = {28, 30, 40, 29, 42},
    [SPECIES_PARAS           - 1] = {29, 26, 48, 28, 39},
    [SPECIES_PARASECT        - 1] = {30, 28, 40, 32, 46},
    [SPECIES_VENONAT         - 1] = {27, 22, 16, 26, 41},
    [SPECIES_VENOMOTH        - 1] = {18, 25,  8, 22, 39},
    [SPECIES_DIGLETT         - 1] = {30, 22, 48, 28, 35},
    [SPECIES_DUGTRIO         - 1] = {26, 17, 48, 26, 31},
    [SPECIES_MEOWTH          - 1] = {28, 22, 48, 28, 35},
    [SPECIES_PERSIAN         - 1] = {19, 19, 48, 19, 33},
    [SPECIES_PSYDUCK         - 1] = {28, 19, 48, 23, 41},
    [SPECIES_GOLDUCK         - 1] = {23, 18, 40, 23, 34},
    [SPECIES_MANKEY          - 1] = {28, 21, 48, 27, 35},
    [SPECIES_PRIMEAPE        - 1] = {30, 22, 48, 26, 39},
    [SPECIES_GROWLITHE       - 1] = {20, 23, 48, 20, 36},
    [SPECIES_ARCANINE        - 1] = {15,  9, 40, 12, 25},
    [SPECIES_POLIWAG         - 1] = {21, 20, 48, 19, 31},
    [SPECIES_POLIWHIRL       - 1] = {31, 16, 48, 30, 23},
    [SPECIES_POLIWRATH       - 1] = {34, 12, 48, 33, 24},
    [SPECIES_ABRA            - 1] = {31, 19, 48, 31, 33},
    [SPECIES_KADABRA         - 1] = {27, 18, 48, 28, 37},
    [SPECIES_ALAKAZAM        - 1] = {28, 17, 40, 29, 38},
    [SPECIES_MACHOP          - 1] = {27, 17, 48, 27, 30},
    [SPECIES_MACHOKE         - 1] = {29, 17, 48, 29, 31},
    [SPECIES_MACHAMP         - 1] = {26, 13, 40, 28, 27},
    [SPECIES_BELLSPROUT      - 1] = {21, 14, 48, 14, 28},
    [SPECIES_WEEPINBELL      - 1] = {26, 28, 16, 21, 50},
    [SPECIES_VICTREEBEL      - 1] = {30, 15, 48, 28, 27},
    [SPECIES_TENTACOOL       - 1] = {26, 21, 48, 30, 38},
    [SPECIES_TENTACRUEL      - 1] = {27, 16, 40, 28, 38},
    [SPECIES_GEODUDE         - 1] = {28, 32, 40, 29, 45},
    [SPECIES_GRAVELER        - 1] = {29, 25, 40, 30, 38},
    [SPECIES_GOLEM           - 1] = {25, 27, 40, 28, 39},
    [SPECIES_PONYTA          - 1] = {15, 17, 48, 14, 35},
    [SPECIES_RAPIDASH        - 1] = {47, 15, 40, 43, 30},
    [SPECIES_SLOWPOKE        - 1] = {20, 31, 40, 21, 47},
    [SPECIES_SLOWBRO         - 1] = {14, 13, 40, 12, 31},
    [SPECIES_MAGNEMITE       - 1] = {32, 27, 16, 31, 41},
    [SPECIES_MAGNETON        - 1] = {31, 20,  8, 31, 34},
    [SPECIES_FARFETCHD       - 1] = {22, 20, 48, 22, 41},
    [SPECIES_DODUO           - 1] = {17, 22, 48, 13, 44},
    [SPECIES_DODRIO          - 1] = {29,  4, 40, 14, 7},
    [SPECIES_SEEL            - 1] = {27, 36, 32, 23, 53},
    [SPECIES_DEWGONG         - 1] = {18, 10, 48, 14, 26},
    [SPECIES_GRIMER          - 1] = {31, 16, 48, 29, 37},
    [SPECIES_MUK             - 1] = {23, 15, 48, 25, 34},
    [SPECIES_SHELLDER        - 1] = {26, 24, 48, 23, 41},
    [SPECIES_CLOYSTER        - 1] = {25, 30, 40, 29, 44},
    [SPECIES_GASTLY          - 1] = {26, 31,  8, 25, 48},
    [SPECIES_HAUNTER         - 1] = {32, 20,  8, 29, 38},
    [SPECIES_GENGAR          - 1] = {26, 22, 48, 25, 40},
    [SPECIES_ONIX            - 1] = {31, 36, 32, 40, 54},
    [SPECIES_DROWZEE         - 1] = {26, 14, 48, 26, 30},
    [SPECIES_HYPNO           - 1] = {28, 18, 48, 25, 36},
    [SPECIES_KRABBY          - 1] = {29, 29, 48, 26, 43},
    [SPECIES_KINGLER         - 1] = {30, 31, 40, 28, 48},
    [SPECIES_VOLTORB         - 1] = {28, 27, 48, 27, 43},
    [SPECIES_ELECTRODE       - 1] = {28, 24, 48, 29, 46},
    [SPECIES_EXEGGCUTE       - 1] = {33, 23, 48, 32, 36},
    [SPECIES_EXEGGUTOR       - 1] = {28, 23, 40, 27, 37},
    [SPECIES_CUBONE          - 1] = {27, 18, 48, 27, 34},
    [SPECIES_MAROWAK         - 1] = {20, 15, 48, 17, 35},
    [SPECIES_HITMONLEE       - 1] = {46, 17, 48, 40, 34},
    [SPECIES_HITMONCHAN      - 1] = {34, 14, 48, 30, 29},
    [SPECIES_LICKITUNG       - 1] = {20, 17, 48, 20, 36},
    [SPECIES_KOFFING         - 1] = {30, 20, 16, 29, 32},
    [SPECIES_WEEZING         - 1] = {17, 13, 16, 15, 28},
    [SPECIES_RHYHORN         - 1] = {14, 35, 32, 20, 51},
    [SPECIES_RHYDON          - 1] = {13, 18, 40, 23, 34},
    [SPECIES_CHANSEY         - 1] = {26, 13, 48, 26, 26},
    [SPECIES_TANGELA         - 1] = {28, 24, 48, 29, 41},
    [SPECIES_KANGASKHAN      - 1] = {27,  6, 40, 28, 20},
    [SPECIES_HORSEA          - 1] = {28, 20, 48, 22, 35},
    [SPECIES_SEADRA          - 1] = {16, 23, 48,  9, 42},
    [SPECIES_GOLDEEN         - 1] = {22, 35, 32, 21, 52},
    [SPECIES_SEAKING         - 1] = {22, 15, 48, 16, 24},
    [SPECIES_STARYU          - 1] = {28, 24, 48, 26, 38},
    [SPECIES_STARMIE         - 1] = {29, 19, 48, 27, 32},
    [SPECIES_MR_MIME         - 1] = {36, 17, 48, 37, 30},
    [SPECIES_SCYTHER         - 1] = {16, 25, 40, 18, 39},
    [SPECIES_JYNX            - 1] = {27, 15, 48, 25, 28},
    [SPECIES_ELECTABUZZ      - 1] = {20, 17, 48, 23, 32},
    [SPECIES_MAGMAR          - 1] = {16, 14, 48, 11, 25},
    [SPECIES_PINSIR          - 1] = {29, 28, 40, 32, 43},
    [SPECIES_TAUROS          - 1] = {17, 29, 40, 19, 46},
    [SPECIES_MAGIKARP        - 1] = {22, 21, 48, 19, 35},
    [SPECIES_GYARADOS        - 1] = {11, 24, 40, 22, 41},
    [SPECIES_LAPRAS          - 1] = {22,  8, 40, 21, 22},
    [SPECIES_DITTO           - 1] = {36, 18, 48, 31, 32},
    [SPECIES_EEVEE           - 1] = {22, 22, 48, 22, 35},
    [SPECIES_VAPOREON        - 1] = {24, 35, 40, 24, 48},
    [SPECIES_JOLTEON         - 1] = {20, 27, 48, 22, 40},
    [SPECIES_FLAREON         - 1] = {22, 23, 48, 20, 37},
    [SPECIES_PORYGON         - 1] = {24, 18, 48, 16, 35},
    [SPECIES_OMANYTE         - 1] = {29, 29, 48, 28, 43},
    [SPECIES_OMASTAR         - 1] = {22, 26, 48, 25, 45},
    [SPECIES_KABUTO          - 1] = {27, 22, 48, 26, 39},
    [SPECIES_KABUTOPS        - 1] = {21, 17, 48, 21, 31},
    [SPECIES_AERODACTYL      - 1] = {19, 29,  0, 20, 48},
    [SPECIES_SNORLAX         - 1] = {53,  9, 48, 46, 20},
    [SPECIES_ARTICUNO        - 1] = {24, 11, 24, 23, 23},
    [SPECIES_ZAPDOS          - 1] = {14, 14, 16,  4, 40},
    [SPECIES_MOLTRES         - 1] = {11, 42,  8, 11, 56},
    [SPECIES_DRATINI         - 1] = {13, 18, 48, 11, 33},
    [SPECIES_DRAGONAIR       - 1] = {24, 14, 48, 19, 28},
    [SPECIES_DRAGONITE       - 1] = {27,  7, 24, 25, 23},
    [SPECIES_MEWTWO          - 1] = {43,  9, 40, 44, 24},
    [SPECIES_MEW             - 1] = {25, 20, 16, 31, 33},
    [SPECIES_CHIKORITA       - 1] = {27, 23, 48, 27, 36},
    [SPECIES_BAYLEEF         - 1] = {29, 16, 48, 32, 29},
    [SPECIES_MEGANIUM        - 1] = { 5, 13, 40, 13, 27},
    [SPECIES_CYNDAQUIL       - 1] = {17, 27, 48, 20, 39},
    [SPECIES_QUILAVA         - 1] = {37, 24, 48, 39, 38},
    [SPECIES_TYPHLOSION      - 1] = { 9, 16, 40, 16, 28},
    [SPECIES_TOTODILE        - 1] = {22, 16, 48, 25, 32},
    [SPECIES_CROCONAW        - 1] = {22, 16, 48, 24, 33},
    [SPECIES_FERALIGATR      - 1] = {14, 10, 40,  8, 26},
    [SPECIES_SENTRET         - 1] = {30, 10, 48, 29, 21},
    [SPECIES_FURRET          - 1] = {33, 14, 48, 33, 25},
    [SPECIES_HOOTHOOT        - 1] = {29, 21, 48, 28, 36},
    [SPECIES_NOCTOWL         - 1] = {25, 14, 48, 24, 28},
    [SPECIES_LEDYBA          - 1] = {27, 21, 48, 28, 36},
    [SPECIES_LEDIAN          - 1] = {24, 18, 16, 28, 33},
    [SPECIES_SPINARAK        - 1] = {32, 32, 40, 32, 45},
    [SPECIES_ARIADOS         - 1] = {23, 35, 40, 21, 48},
    [SPECIES_CROBAT          - 1] = {34, 30,  8, 35, 43},
    [SPECIES_CHINCHOU        - 1] = {31, 29, 48, 31, 41},
    [SPECIES_LANTURN         - 1] = {16, 35, 40, 25, 51},
    [SPECIES_PICHU           - 1] = {30, 23, 48, 30, 36},
    [SPECIES_CLEFFA          - 1] = {28, 24, 48, 30, 38},
    [SPECIES_IGGLYBUFF       - 1] = {31, 25, 48, 31, 36},
    [SPECIES_TOGEPI          - 1] = {33, 21, 48, 31, 32},
    [SPECIES_TOGETIC         - 1] = {27, 16, 48, 28, 28},
    [SPECIES_NATU            - 1] = {28, 23, 48, 21, 33},
    [SPECIES_XATU            - 1] = {27,  8, 48, 25, 20},
    [SPECIES_MAREEP          - 1] = {22, 21, 48, 21, 36},
    [SPECIES_FLAAFFY         - 1] = {25, 18, 48, 24, 33},
    [SPECIES_AMPHAROS        - 1] = {15, 10, 48, 16, 27},
    [SPECIES_BELLOSSOM       - 1] = {31, 19, 48, 31, 32},
    [SPECIES_MARILL          - 1] = {29, 21, 48, 29, 34},
    [SPECIES_AZUMARILL       - 1] = {26, 18, 48, 23, 31},
    [SPECIES_SUDOWOODO       - 1] = {32, 16, 48, 32, 31},
    [SPECIES_POLITOED        - 1] = {29, 15, 48, 30, 32},
    [SPECIES_HOPPIP          - 1] = {35, 37,  8, 37, 51},
    [SPECIES_SKIPLOOM        - 1] = {30, 24,  8, 28, 39},
    [SPECIES_JUMPLUFF        - 1] = {29, 33,  8, 32, 47},
    [SPECIES_AIPOM           - 1] = {30, 41, 24, 30, 53},
    [SPECIES_SUNKERN         - 1] = {31, 32,  8, 36, 46},
    [SPECIES_SUNFLORA        - 1] = {28, 12, 48, 27, 25},
    [SPECIES_YANMA           - 1] = {27, 40,  8, 22, 53},
    [SPECIES_WOOPER          - 1] = {29, 19, 48, 31, 33},
    [SPECIES_QUAGSIRE        - 1] = {21,  9, 48, 18, 24},
    [SPECIES_ESPEON          - 1] = {17, 27, 48, 17, 41},
    [SPECIES_UMBREON         - 1] = {35, 21, 48, 35, 34},
    [SPECIES_MURKROW         - 1] = {36, 19, 48, 32, 34},
    [SPECIES_SLOWKING        - 1] = {30, 19, 40, 29, 37},
    [SPECIES_MISDREAVUS      - 1] = {40, 33,  8, 38, 46},
    [SPECIES_UNOWN           - 1] = {32, 23,  8, 31, 33},
    [SPECIES_WOBBUFFET       - 1] = {29,  9, 48, 29, 26},
    [SPECIES_GIRAFARIG       - 1] = {11, 13, 40, 17, 29},
    [SPECIES_PINECO          - 1] = {29, 18, 16, 25, 37},
    [SPECIES_FORRETRESS      - 1] = {25, 23,  8, 30, 38},
    [SPECIES_DUNSPARCE       - 1] = {16, 27, 48, 12, 45},
    [SPECIES_GLIGAR          - 1] = {30, 19,  8, 29, 35},
    [SPECIES_STEELIX         - 1] = {12, 13, 40, 13, 28},
    [SPECIES_SNUBBULL        - 1] = {27, 21, 48, 26, 35},
    [SPECIES_GRANBULL        - 1] = {28,  9, 48, 25, 24},
    [SPECIES_QWILFISH        - 1] = {31, 38, 32, 29, 51},
    [SPECIES_SCIZOR          - 1] = {21, 15, 16, 26, 26},
    [SPECIES_SHUCKLE         - 1] = {37, 10, 48, 36, 24},
    [SPECIES_HERACROSS       - 1] = {24, 25, 40, 26, 38},
    [SPECIES_SNEASEL         - 1] = {28, 19, 48, 29, 36},
    [SPECIES_TEDDIURSA       - 1] = {30, 18, 48, 27, 35},
    [SPECIES_URSARING        - 1] = {30,  4, 40, 29, 20},
    [SPECIES_SLUGMA          - 1] = {32, 24, 48, 32, 40},
    [SPECIES_MAGCARGO        - 1] = {22, 17, 48, 23, 35},
    [SPECIES_SWINUB          - 1] = {28, 24, 48, 27, 37},
    [SPECIES_PILOSWINE       - 1] = {24, 35, 32, 24, 54},
    [SPECIES_CORSOLA         - 1] = {25, 29, 40, 25, 43},
    [SPECIES_REMORAID        - 1] = {21, 31, 40, 19, 43},
    [SPECIES_OCTILLERY       - 1] = {28, 17, 48, 26, 32},
    [SPECIES_DELIBIRD        - 1] = {29, 17, 48, 27, 31},
    [SPECIES_MANTINE         - 1] = {22, 30, 40, 31, 39},
    [SPECIES_SKARMORY        - 1] = {30,  0, 40, 19, 7},
    [SPECIES_HOUNDOUR        - 1] = {37, 17, 48, 37, 31},
    [SPECIES_HOUNDOOM        - 1] = {13, 19, 48, 13, 36},
    [SPECIES_KINGDRA         - 1] = {14, 19, 40, 10, 44},
    [SPECIES_PHANPY          - 1] = {27, 17, 48, 25, 36},
    [SPECIES_DONPHAN         - 1] = {17, 21, 48, 25, 44},
    [SPECIES_PORYGON2        - 1] = {24, 17, 48, 17, 32},
    [SPECIES_STANTLER        - 1] = {21, 21, 40, 23, 40},
    [SPECIES_SMEARGLE        - 1] = {24, 16, 48, 27, 37},
    [SPECIES_TYROGUE         - 1] = {30, 18, 48, 31, 31},
    [SPECIES_HITMONTOP       - 1] = {26, 57, 16, 26, 43},
    [SPECIES_SMOOCHUM        - 1] = {32, 24, 48, 33, 38},
    [SPECIES_ELEKID          - 1] = {29, 20, 48, 29, 35},
    [SPECIES_MAGBY           - 1] = {28, 21, 48, 26, 36},
    [SPECIES_MILTANK         - 1] = {24, 14, 48, 24, 30},
    [SPECIES_BLISSEY         - 1] = {29,  9, 48, 29, 25},
    [SPECIES_RAIKOU          - 1] = {41, 12, 40, 39, 30},
    [SPECIES_ENTEI           - 1] = { 8,  9, 40, 11, 24},
    [SPECIES_SUICUNE         - 1] = {35, 29, 40, 38, 44},
    [SPECIES_LARVITAR        - 1] = {28, 24, 48, 26, 36},
    [SPECIES_PUPITAR         - 1] = {27, 25, 48, 27, 40},
    [SPECIES_TYRANITAR       - 1] = { 6, 11, 40, 13, 25},
    [SPECIES_LUGIA           - 1] = { 8, 42,  8, 20, 52},
    [SPECIES_HO_OH           - 1] = {13, 37,  8, 14, 52},
    [SPECIES_CELEBI          - 1] = {21, 33,  8, 26, 43},
    [SPECIES_OLD_UNOWN_B     - 1] = {31, 18,  8, 30, 28},
    [SPECIES_OLD_UNOWN_C     - 1] = {32, 23,  8, 31, 33},
    [SPECIES_OLD_UNOWN_D     - 1] = {28, 25,  8, 27, 35},
    [SPECIES_OLD_UNOWN_E     - 1] = {33, 25,  8, 32, 35},
    [SPECIES_OLD_UNOWN_F     - 1] = {27, 19,  8, 26, 29},
    [SPECIES_OLD_UNOWN_G     - 1] = {32, 22,  8, 31, 33},
    [SPECIES_OLD_UNOWN_H     - 1] = {32, 25,  8, 31, 35},
    [SPECIES_OLD_UNOWN_I     - 1] = {32, 25,  8, 31, 35},
    [SPECIES_OLD_UNOWN_J     - 1] = {32, 22,  8, 31, 32},
    [SPECIES_OLD_UNOWN_K     - 1] = {29, 26,  8, 28, 36},
    [SPECIES_OLD_UNOWN_L     - 1] = {32, 22,  8, 31, 31},
    [SPECIES_OLD_UNOWN_M     - 1] = {32, 28,  8, 31, 38},
    [SPECIES_OLD_UNOWN_N     - 1] = {32, 26,  8, 31, 35},
    [SPECIES_OLD_UNOWN_O     - 1] = {32, 26,  8, 31, 35},
    [SPECIES_OLD_UNOWN_P     - 1] = {32, 22,  8, 31, 32},
    [SPECIES_OLD_UNOWN_Q     - 1] = {29, 22,  8, 28, 32},
    [SPECIES_OLD_UNOWN_R     - 1] = {32, 21,  8, 31, 31},
    [SPECIES_OLD_UNOWN_S     - 1] = {32, 25,  8, 31, 35},
    [SPECIES_OLD_UNOWN_T     - 1] = {32, 30,  8, 31, 40},
    [SPECIES_OLD_UNOWN_U     - 1] = {32, 23,  8, 31, 33},
    [SPECIES_OLD_UNOWN_V     - 1] = {30, 30,  8, 29, 40},
    [SPECIES_OLD_UNOWN_W     - 1] = {32, 29,  8, 31, 39},
    [SPECIES_OLD_UNOWN_X     - 1] = {32, 25,  8, 31, 35},
    [SPECIES_OLD_UNOWN_Y     - 1] = {32, 21,  8, 31, 31},
    [SPECIES_OLD_UNOWN_Z     - 1] = {32, 25,  8, 31, 35},
    [SPECIES_TREECKO         - 1] = {26, 15, 48, 25, 32},
    [SPECIES_GROVYLE         - 1] = {13,  5, 16,  5, 19},
    [SPECIES_SCEPTILE        - 1] = {16,  4, 40, 12, 18},
    [SPECIES_TORCHIC         - 1] = {23, 24, 48, 21, 37},
    [SPECIES_COMBUSKEN       - 1] = {32, 18, 40, 30, 32},
    [SPECIES_BLAZIKEN        - 1] = {26,  7, 40, 29, 19},
    [SPECIES_MUDKIP          - 1] = {27, 29, 40, 25, 44},
    [SPECIES_MARSHTOMP       - 1] = {29, 17, 48, 28, 32},
    [SPECIES_SWAMPERT        - 1] = {27, 17, 40, 27, 35},
    [SPECIES_POOCHYENA       - 1] = {20, 18, 48, 15, 32},
    [SPECIES_MIGHTYENA       - 1] = { 9, 13, 40,  9, 28},
    [SPECIES_ZIGZAGOON       - 1] = {11, 26, 48,  9, 43},
    [SPECIES_LINOONE         - 1] = {13, 40, 24, 11, 55},
    [SPECIES_WURMPLE         - 1] = {33, 23, 48, 31, 38},
    [SPECIES_SILCOON         - 1] = {19, 28, 48, 17, 42},
    [SPECIES_BEAUTIFLY       - 1] = {15, 27,  8, 14, 40},
    [SPECIES_CASCOON         - 1] = {20, 29, 48, 17, 44},
    [SPECIES_DUSTOX          - 1] = {20, 25,  8, 22, 38},
    [SPECIES_LOTAD           - 1] = {25, 37, 40, 23, 50},
    [SPECIES_LOMBRE          - 1] = {34, 16, 48, 41, 29},
    [SPECIES_LUDICOLO        - 1] = {28, 15, 40, 27, 36},
    [SPECIES_SEEDOT          - 1] = {27, 23, 48, 24, 40},
    [SPECIES_NUZLEAF         - 1] = {32, 13, 48, 26, 29},
    [SPECIES_SHIFTRY         - 1] = {50, 17, 40, 46, 35},
    [SPECIES_NINCADA         - 1] = {24, 26, 48, 23, 40},
    [SPECIES_NINJASK         - 1] = {23, 33,  0, 23, 47},
    [SPECIES_SHEDINJA        - 1] = {22, 25,  8, 24, 42},
    [SPECIES_TAILLOW         - 1] = {23, 16, 48, 20, 30},
    [SPECIES_SWELLOW         - 1] = {12, 10, 40,  5, 22},
    [SPECIES_SHROOMISH       - 1] = {31, 22, 48, 29, 35},
    [SPECIES_BRELOOM         - 1] = {37, 12, 48, 35, 25},
    [SPECIES_SPINDA          - 1] = {33, 22, 48, 31, 39},
    [SPECIES_WINGULL         - 1] = {26, 22, 16, 21, 38},
    [SPECIES_PELIPPER        - 1] = {29, 10, 16,  9, 27},
    [SPECIES_SURSKIT         - 1] = {29, 22, 48, 28, 37},
    [SPECIES_MASQUERAIN      - 1] = {26, 33,  8, 20, 48},
    [SPECIES_WAILMER         - 1] = {23, 23, 48, 22, 40},
    [SPECIES_WAILORD         - 1] = {23,  3, 48,  9, 19},
    [SPECIES_SKITTY          - 1] = {36, 26, 48, 34, 42},
    [SPECIES_DELCATTY        - 1] = {30, 18, 48, 28, 33},
    [SPECIES_KECLEON         - 1] = {25, 16, 48, 19, 30},
    [SPECIES_BALTOY          - 1] = {29, 21, 48, 27, 34},
    [SPECIES_CLAYDOL         - 1] = {30, 13, 40, 29, 36},
    [SPECIES_NOSEPASS        - 1] = {31, 16, 48, 21, 35},
    [SPECIES_TORKOAL         - 1] = {14, 25, 40, 10, 39},
    [SPECIES_SABLEYE         - 1] = {30, 22, 48, 29, 39},
    [SPECIES_BARBOACH        - 1] = {23, 18, 48, 21, 30},
    [SPECIES_WHISCASH        - 1] = {24, 32, 40, 23, 49},
    [SPECIES_LUVDISC         - 1] = {25, 15, 48, 19, 28},
    [SPECIES_CORPHISH        - 1] = {31, 20, 48, 29, 35},
    [SPECIES_CRAWDAUNT       - 1] = {20, 12, 40, 24, 35},
    [SPECIES_FEEBAS          - 1] = {24, 30, 40, 22, 47},
    [SPECIES_MILOTIC         - 1] = {32, 12, 40, 31, 29},
    [SPECIES_CARVANHA        - 1] = {22, 25, 48, 19, 34},
    [SPECIES_SHARPEDO        - 1] = {25, 12, 40, 23, 39},
    [SPECIES_TRAPINCH        - 1] = {41, 19, 48, 23, 24},
    [SPECIES_VIBRAVA         - 1] = {16, 39, 32, 14, 52},
    [SPECIES_FLYGON          - 1] = {34,  7, 16, 33, 19},
    [SPECIES_MAKUHITA        - 1] = {34, 19, 48, 28, 35},
    [SPECIES_HARIYAMA        - 1] = {36, 15, 40, 38, 28},
    [SPECIES_ELECTRIKE       - 1] = {17, 24, 48, 20, 39},
    [SPECIES_MANECTRIC       - 1] = {47, 24, 40, 46, 41},
    [SPECIES_NUMEL           - 1] = {16, 26, 48, 13, 42},
    [SPECIES_CAMERUPT        - 1] = {13, 34, 40, 14, 54},
    [SPECIES_SPHEAL          - 1] = {30, 15, 48, 24, 31},
    [SPECIES_SEALEO          - 1] = {28,  9, 48, 26, 24},
    [SPECIES_WALREIN         - 1] = {25,  1, 40, 16, 22},
    [SPECIES_CACNEA          - 1] = {31, 23, 48, 29, 41},
    [SPECIES_CACTURNE        - 1] = {29, 14, 40, 29, 27},
    [SPECIES_SNORUNT         - 1] = {30, 22, 48, 30, 38},
    [SPECIES_GLALIE          - 1] = {26, 28,  8, 26, 49},
    [SPECIES_LUNATONE        - 1] = {28, 22,  8, 25, 44},
    [SPECIES_SOLROCK         - 1] = {24, 24, 16, 23, 49},
    [SPECIES_AZURILL         - 1] = {27, 16, 48, 24, 31},
    [SPECIES_SPOINK          - 1] = {33, 20, 48, 27, 40},
    [SPECIES_GRUMPIG         - 1] = {20, 16, 48, 21, 32},
    [SPECIES_PLUSLE          - 1] = {28, 22,  8, 29, 37},
    [SPECIES_MINUN           - 1] = {33, 22,  8, 31, 38},
    [SPECIES_MAWILE          - 1] = {45, 20, 48, 47, 36},
    [SPECIES_MEDITITE        - 1] = {31, 23, 48, 30, 37},
    [SPECIES_MEDICHAM        - 1] = {33, 15, 40, 30, 29},
    [SPECIES_SWABLU          - 1] = {27, 22, 16, 23, 35},
    [SPECIES_ALTARIA         - 1] = {29, 11, 16, 26, 26},
    [SPECIES_WYNAUT          - 1] = {26, 21, 48, 27, 38},
    [SPECIES_DUSKULL         - 1] = {16, 24,  8, 20, 46},
    [SPECIES_DUSCLOPS        - 1] = {28, 15, 48, 26, 40},
    [SPECIES_ROSELIA         - 1] = {30, 17, 48, 29, 32},
    [SPECIES_SLAKOTH         - 1] = {25, 30, 48, 24, 47},
    [SPECIES_VIGOROTH        - 1] = {16, 18, 40, 20, 36},
    [SPECIES_SLAKING         - 1] = {55, 15, 48, 41, 33},
    [SPECIES_GULPIN          - 1] = {27, 24, 48, 23, 38},
    [SPECIES_SWALOT          - 1] = {31,  6, 48, 21, 19},
    [SPECIES_TROPIUS         - 1] = {24, 10, 40, 32, 24},
    [SPECIES_WHISMUR         - 1] = {31, 25, 48, 29, 41},
    [SPECIES_LOUDRED         - 1] = {28, 18, 40, 34, 39},
    [SPECIES_EXPLOUD         - 1] = {16, 16, 40, 26, 42},
    [SPECIES_CLAMPERL        - 1] = {32, 26, 48, 30, 38},
    [SPECIES_HUNTAIL         - 1] = {19, 30, 40, 21, 51},
    [SPECIES_GOREBYSS        - 1] = {13, 31, 40,  3, 50},
    [SPECIES_ABSOL           - 1] = {42, 17, 40, 42, 34},
    [SPECIES_SHUPPET         - 1] = {22, 25,  8, 23, 39},
    [SPECIES_BANETTE         - 1] = {28, 20,  8, 27, 35},
    [SPECIES_SEVIPER         - 1] = {14, 13, 48, 11, 30},
    [SPECIES_ZANGOOSE        - 1] = {24, 12, 40, 21, 26},
    [SPECIES_RELICANTH       - 1] = {12, 31, 48,  9, 45},
    [SPECIES_ARON            - 1] = {24, 28, 48, 26, 44},
    [SPECIES_LAIRON          - 1] = {11, 33, 48, 18, 47},
    [SPECIES_AGGRON          - 1] = {16, 11, 40, 22, 27},
    [SPECIES_CASTFORM        - 1] = {29, 24,  8, 27, 38},
    [SPECIES_VOLBEAT         - 1] = {37, 21,  8, 33, 37},
    [SPECIES_ILLUMISE        - 1] = {32, 18,  8, 31, 32},
    [SPECIES_LILEEP          - 1] = {30, 17, 48, 31, 30},
    [SPECIES_CRADILY         - 1] = {18, 22, 40, 21, 40},
    [SPECIES_ANORITH         - 1] = {28, 30, 48, 27, 43},
    [SPECIES_ARMALDO         - 1] = {21,  5, 40, 20, 19},
    [SPECIES_RALTS           - 1] = {31, 23, 48, 32, 35},
    [SPECIES_KIRLIA          - 1] = {28, 18, 48, 31, 30},
    [SPECIES_GARDEVOIR       - 1] = {53,  7, 40, 50, 20},
    [SPECIES_BAGON           - 1] = {23, 19, 48, 22, 38},
    [SPECIES_SHELGON         - 1] = {25, 27, 48, 25, 44},
    [SPECIES_SALAMENCE       - 1] = { 9, 17, 48, 10, 33},
    [SPECIES_BELDUM          - 1] = {22, 25,  8, 24, 35},
    [SPECIES_METANG          - 1] = {34, 15, 16, 31, 33},
    [SPECIES_METAGROSS       - 1] = {36, 27, 40, 34, 43},
    [SPECIES_REGIROCK        - 1] = {22,  7, 40, 20, 18},
    [SPECIES_REGICE          - 1] = {25, 12, 40, 23, 25},
    [SPECIES_REGISTEEL       - 1] = {25, 13, 40, 25, 25},
    [SPECIES_KYOGRE          - 1] = {14, 25, 40, 11, 38},
    [SPECIES_GROUDON         - 1] = { 4, 11, 40, 10, 25},
    [SPECIES_RAYQUAZA        - 1] = {12, 14, 16, 14, 31},
    [SPECIES_LATIAS          - 1] = {30, 12, 16, 35, 25},
    [SPECIES_LATIOS          - 1] = { 5, 14, 16,  5, 29},
    [SPECIES_JIRACHI         - 1] = {28, 21,  8, 30, 34},
#if defined(FIRERED)
    [SPECIES_DEOXYS          - 1] = {27,  8, 40, 28, 22},
#elif defined(LEAFGREEN)
    [SPECIES_DEOXYS          - 1] = {26,  9, 40, 26, 23},
#endif
    [SPECIES_CHIMECHO        - 1] = {29, 12,  8, 28, 26},
    [SPECIES_OLD_UNOWN_EMARK - 1] = {32, 33,  8, 32, 43},
    [SPECIES_OLD_UNOWN_QMARK - 1] = {32, 35,  8, 32, 45}
};

void AddTextPrinterParameterized3(u8 windowId, u8 fontId, u8 x, u8 y, const u8 * color, s8 speed, const u8 * str)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = printer.x;
    printer.currentY = printer.y;
    printer.letterSpacing = GetFontAttribute(fontId, FONTATTR_LETTER_SPACING);
    printer.lineSpacing = GetFontAttribute(fontId, FONTATTR_LINE_SPACING);
    printer.unk = 0;
    printer.fgColor = color[1];
    printer.bgColor = color[0];
    printer.shadowColor = color[2];
    AddTextPrinter(&printer, speed, NULL);
}

void AddTextPrinterParameterized4(u8 windowId, u8 fontId, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, const u8 *color, s8 speed, const u8 *str)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = printer.x;
    printer.currentY = printer.y;
    printer.letterSpacing = letterSpacing;
    printer.lineSpacing = lineSpacing;
    printer.unk = 0;
    printer.fgColor = color[1];
    printer.bgColor = color[0];
    printer.shadowColor = color[2];
    AddTextPrinter(&printer, speed, NULL);
}

void AddTextPrinterParameterized5(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 speed, void (*callback)(struct TextPrinterTemplate *, u16), u8 letterSpacing, u8 lineSpacing)
{
    struct TextPrinterTemplate printer;

    printer.currentChar = str;
    printer.windowId = windowId;
    printer.fontId = fontId;
    printer.x = x;
    printer.y = y;
    printer.currentX = x;
    printer.currentY = y;
    printer.letterSpacing = letterSpacing;
    printer.lineSpacing = lineSpacing;
    printer.unk = 0;
    printer.fgColor = GetFontAttribute(fontId, FONTATTR_COLOR_FOREGROUND);
    printer.bgColor = GetFontAttribute(fontId, FONTATTR_COLOR_BACKGROUND);
    printer.shadowColor = GetFontAttribute(fontId, FONTATTR_COLOR_SHADOW);
    AddTextPrinter(&printer, speed, callback);
}

void Menu_PrintFormatIntlPlayerName(u8 windowId, const u8 * src, u16 x, u16 y)
{
    s32 i;

    for (i = 0; gSaveBlock2Ptr->playerName[i] != EOS; i++)
        ;

    StringExpandPlaceholders(gStringVar4, src);
    if (i != 5)
    {
        AddTextPrinterParameterized(windowId, FONT_NORMAL, gStringVar4, x, y, 0xFF, NULL);
    }
    else
    {
        AddTextPrinterParameterized5(windowId, FONT_NORMAL, gStringVar4, x, y, 0xFF, NULL, 0, 0);
    }
}

static void UnusedBlitBitmapRect(const struct Bitmap *src, struct Bitmap *dst, u16 srcX, u16 srcY, u16 dstX, u16 dstY, u16 width, u16 height)
{
    s32 loopSrcY, loopDstY, loopSrcX, loopDstX, xEnd, yEnd, multiplierSrcY, multiplierDstY;
    u16 toOrr;
    u8 *pixelsSrc;
    u8 *pixelsDst;

    if (dst->width - dstX < width)
        xEnd = dst->width - dstX + srcX;
    else
        xEnd = width + srcX;

    if (dst->height - dstY < height)
        yEnd = srcY + dst->height - dstY;
    else
        yEnd = srcY + height;
    multiplierSrcY = (src->width + (src->width & 7)) >> 3;
    multiplierDstY = (dst->width + (dst->width & 7)) >> 3;
    for (loopSrcY = srcY, loopDstY = dstY; loopSrcY < yEnd; loopSrcY++, loopDstY++)
    {
        for (loopSrcX = srcX, loopDstX = dstX; loopSrcX < xEnd; loopSrcX++, loopDstX++)
        {
            pixelsSrc = (u8 *)(src->pixels + ((loopSrcX >> 1) & 3) + ((loopSrcX >> 3) << 5) + (((loopSrcY >> 3) * multiplierSrcY) << 5) + ((u32)(loopSrcY << 0x1d) >> 0x1B));
            pixelsDst = (u8 *)(dst->pixels + ((loopDstX >> 1) & 3) + ((loopDstX >> 3) << 5) + ((( loopDstY >> 3) * multiplierDstY) << 5) + ((u32)( loopDstY << 0x1d) >> 0x1B));

            if ((u32)pixelsDst & 0x1)
            {
                pixelsDst--;
                if (loopDstX & 0x1)
                {
                    toOrr = *(vu16 *)pixelsDst & 0x0fff;
                    if (loopSrcX & 0x1)
                        toOrr |= ((*pixelsSrc & 0xf0) << 8);
                    else
                        toOrr |= ((*pixelsSrc & 0x0f) << 12);
                }
                else
                {
                    toOrr = *(vu16 *)pixelsDst & 0xf0ff;
                    if (loopSrcX & 0x1)
                        toOrr |= ((*pixelsSrc & 0xf0) << 4);
                    else
                        toOrr |= ((*pixelsSrc & 0x0f) << 8);
                }
            }
            else
            {
                if (loopDstX & 1)
                {
                    toOrr = *(vu16 *)pixelsDst & 0xff0f;
                    if (loopSrcX & 1)
                        toOrr |= ((*pixelsSrc & 0xf0) << 0);
                    else
                        toOrr |= ((*pixelsSrc & 0x0f) << 4);
                }
                else
                {
                    toOrr = *(vu16 *)pixelsDst & 0xfff0;
                    if (loopSrcX & 1)
                        toOrr |= ((*pixelsSrc & 0xf0) >> 4);
                    else
                        toOrr |= ((*pixelsSrc & 0x0f) >> 0);
                }
            }
            *(vu16 *)pixelsDst = toOrr;
        }
    }
}

#define tEvA data[0]
#define tEvB data[1]
#define tEvAEnd data[2]
#define tEvBEnd data[3]
#define tEvADelta data[4]
#define tEvBDelta data[5]
#define tEvWhich data[6]
#define tEvStepCount data[8]

void StartBlendTask(u8 eva_start, u8 evb_start, u8 eva_end, u8 evb_end, u8 ev_step, u8 priority)
{
    u8 taskId = CreateTask(Task_SmoothBlendLayers, priority);
    gTasks[taskId].tEvA = eva_start << 8;
    gTasks[taskId].tEvB = evb_start << 8;
    gTasks[taskId].tEvAEnd = eva_end;
    gTasks[taskId].tEvBEnd = evb_end;
    gTasks[taskId].tEvADelta = (eva_end - eva_start) * 256 / ev_step;
    gTasks[taskId].tEvBDelta = (evb_end - evb_start) * 256 / ev_step;
    gTasks[taskId].tEvStepCount = ev_step;
    SetGpuReg(REG_OFFSET_BLDALPHA, (evb_start << 8) | eva_start);
}

bool8 IsBlendTaskActive(void)
{
    return FuncIsActiveTask(Task_SmoothBlendLayers);
}

static void Task_SmoothBlendLayers(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (tEvStepCount != 0)
    {
        if (tEvWhich == 0)
        {
            tEvA += tEvADelta;
            tEvWhich = 1;
        }
        else
        {
            if (--tEvStepCount != 0)
            {
                tEvB += tEvBDelta;
            }
            else
            {
                tEvA = tEvAEnd << 8;
                tEvB = tEvBEnd << 8;
            }
            tEvWhich = 0;
        }
        SetGpuReg(REG_OFFSET_BLDALPHA, (tEvB & ~0xFF) | ((u16)tEvA >> 8));
        if (tEvStepCount == 0)
            DestroyTask(taskId);
    }
}

u8 Menu2_GetMonPosAttribute(u16 species, u32 personality, u8 attributeId)
{
    if (species == SPECIES_UNOWN)
    {
        u8 unownLetter = GetUnownLetterByPersonalityLoByte(personality);
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
    if (species != SPECIES_NONE && attributeId < PSA_MON_ATTR_COUNT)
    {
        species--;
        if (sMonPosAttributes[species][attributeId] != 0xFF)
            return sMonPosAttributes[species][attributeId];
    }
    return 32;
}

s8 Menu2_GetStarSpritePosAttribute(u16 species, u32 personality, u8 attributeId)
{
    return Menu2_GetMonPosAttribute(species, personality, attributeId) - 32;
}
