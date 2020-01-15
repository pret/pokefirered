#include "global.h"
#include "event_data.h"
#include "event_scripts.h"
#include "field_player_avatar.h"
#include "help_system.h"
#include "item.h"
#include "link.h"
#include "overworld.h"
#include "pokedex.h"
#include "quest_log.h"
#include "save.h"
#include "save_location.h"
#include "sound.h"
#include "strings.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/songs.h"

static EWRAM_DATA u16 sSomeVariable = 0;
static EWRAM_DATA u8 gUnknown_203B0EE = 0;

u8 gUnknown_3005E9C[4];
u16 gSomeVariableBackup;

static bool32 IsCurrentMapInArray(const u16 * mapIdxs);
static void sub_812B520(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
static void sub_812B614(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
static bool8 sub_812B754(void);
static bool8 sub_812B780(u8);
static bool8 sub_812BB10(void);

static void sub_812BF5C(void);
static void sub_812BF74(const u8 *);
static void sub_812BF94(struct HelpSystemListMenu * a0);
static void sub_812BF9C(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);

static const u8 *const gUnknown_845B080[] = {
    gUnknown_81B2DF8,
    gUnknown_81B2E1C,
    gUnknown_81B2E2E,
    gUnknown_81B2E48,
    gUnknown_81B2E58,
    gUnknown_81B2E6A
};

static const u8 *const gUnknown_845B098[] = {
    gUnknown_81B2E88,
    gUnknown_81B2EC8,
    gUnknown_81B2F00,
    gUnknown_81B2F43,
    gUnknown_81B2F74,
    gUnknown_81B2FA9
};

static const u8 *const gUnknown_845B0B0[] = {
    NULL,
    gUnknown_81B3083,
    gUnknown_81B30A9,
    gUnknown_81B30C1,
    gUnknown_81B30DC,
    gUnknown_81B30FC,
    gUnknown_81B311F,
    gUnknown_81B3140,
    gUnknown_81B314F,
    gUnknown_81B3168,
    gUnknown_81B3189,
    gUnknown_81B31AE,
    gUnknown_81B31D3,
    gUnknown_81B31EC,
    gUnknown_81B31FF,
    gUnknown_81B3215,
    gUnknown_81B3226,
    gUnknown_81B3243,
    gUnknown_81B3261,
    gUnknown_81B3276,
    gUnknown_81B3290,
    gUnknown_81B32B6,
    gUnknown_81B32CD,
    gUnknown_81B32E3,
    gUnknown_81B32F9,
    gUnknown_81B330B,
    gUnknown_81B332B,
    gUnknown_81B3344,
    gUnknown_81B335C,
    gUnknown_81B3373,
    gUnknown_81B338C,
    gUnknown_81B33A6,
    gUnknown_81B33CA,
    gUnknown_81B33EA,
    gUnknown_81B3402,
    gUnknown_81B3427,
    gUnknown_81B3440,
    gUnknown_81B3457,
    gUnknown_81B346F,
    gUnknown_81B3481,
    gUnknown_81B349B,
    gUnknown_81B34B7,
    gUnknown_81B34D6,
    gUnknown_81B34F6,
    gUnknown_81B3516
};

static const u8 *const gUnknown_845B164[] = {
    NULL,
    gUnknown_81B3525,
    gUnknown_81B35E6,
    gUnknown_81B36EB,
    gUnknown_81B379A,
    gUnknown_81B3849,
    gUnknown_81B3876,
    gUnknown_81B3972,
    gUnknown_81B3A51,
    gUnknown_81B3ACC,
    gUnknown_81B3BB6,
    gUnknown_81B3C99,
    gUnknown_81B3D1B,
    gUnknown_81B3DE3,
    gUnknown_81B3EBC,
    gUnknown_81B3F7F,
    gUnknown_81B406C,
    gUnknown_81B410B,
    gUnknown_81B41D7,
    gUnknown_81B42B3,
    gUnknown_81B439D,
    gUnknown_81B4483,
    gUnknown_81B457C,
    gUnknown_81B4645,
    gUnknown_81B470A,
    gUnknown_81B47F0,
    gUnknown_81B48C6,
    gUnknown_81B497A,
    gUnknown_81B4A72,
    gUnknown_81B4B65,
    gUnknown_81B4C54,
    gUnknown_81B4D26,
    gUnknown_81B4E0B,
    gUnknown_81B4ED8,
    gUnknown_81B4FB2,
    gUnknown_81B4FFD,
    gUnknown_81B50FF,
    gUnknown_81B51B1,
    gUnknown_81B5272,
    gUnknown_81B5325,
    gUnknown_81B5382,
    gUnknown_81B547C,
    gUnknown_81B54E1,
    gUnknown_81B5589,
    gUnknown_81B55F4
};

static const u8 *const gUnknown_845B218[] = {
    NULL,
    gUnknown_81B56E3,
    gUnknown_81B56F4,
    gUnknown_81B5705,
    gUnknown_81B5717,
    gUnknown_81B5728,
    gUnknown_81B5737,
    gUnknown_81B5744,
    gUnknown_81B5754,
    gUnknown_81B5767,
    gUnknown_81B577B,
    gUnknown_81B5787,
    gUnknown_81B5795,
    gUnknown_81B57A5,
    gUnknown_81B57B8,
    gUnknown_81B57CF,
    gUnknown_81B57DE,
    gUnknown_81B57EE,
    gUnknown_81B580D,
    gUnknown_81B5824,
    gUnknown_81B5834,
    gUnknown_81B583F,
    gUnknown_81B5850,
    gUnknown_81B5863,
    gUnknown_81B5875,
    gUnknown_81B5884,
    gUnknown_81B5893,
    gUnknown_81B58A4,
    gUnknown_81B58BC,
    gUnknown_81B58D3,
    gUnknown_81B58E5,
    gUnknown_81B58FD,
    gUnknown_81B590E,
    gUnknown_81B591D,
    gUnknown_81B592E,
    gUnknown_81B593E,
    gUnknown_81B5950,
    gUnknown_81B595D,
    gUnknown_81B5974,
    gUnknown_81B5989,
    gUnknown_81B59A7,
    gUnknown_81B59BF,
    gUnknown_81B59D6,
    gUnknown_81B59E8,
    gUnknown_81B59F5,
    gUnknown_81B5A0D,
    gUnknown_81B5A1B,
    gUnknown_81B5A29,
    gUnknown_81B5A37
};

static const u8 *const gUnknown_845B2DC[] = {
    NULL,
    gUnknown_81B5A4D,
    gUnknown_81B5B0C,
    gUnknown_81B5B7D,
    gUnknown_81B5C13,
    gUnknown_81B5CDF,
    gUnknown_81B5D87,
    gUnknown_81B5E41,
    gUnknown_81B5F10,
    gUnknown_81B5FA6,
    gUnknown_81B606C,
    gUnknown_81B6140,
    gUnknown_81B6203,
    gUnknown_81B62E4,
    gUnknown_81B6397,
    gUnknown_81B6478,
    gUnknown_81B6525,
    gUnknown_81B65E7,
    gUnknown_81B66BA,
    gUnknown_81B678E,
    gUnknown_81B6883,
    gUnknown_81B68CD,
    gUnknown_81B69B9,
    gUnknown_81B6A9A,
    gUnknown_81B6B6E,
    gUnknown_81B6C4F,
    gUnknown_81B6D4A,
    gUnknown_81B6E02,
    gUnknown_81B6EC1,
    gUnknown_81B6FA8,
    gUnknown_81B7075,
    gUnknown_81B7108,
    gUnknown_81B71EA,
    gUnknown_81B723B,
    gUnknown_81B7319,
    gUnknown_81B73E8,
    gUnknown_81B747E,
    gUnknown_81B752C,
    gUnknown_81B7611,
    gUnknown_81B7692,
    gUnknown_81B771E,
    gUnknown_81B77DD,
    gUnknown_81B7884,
    gUnknown_81B7931,
    gUnknown_81B79CB,
    gUnknown_81B7A60,
    gUnknown_81B7AEE,
    gUnknown_81B7BBE,
    gUnknown_81B7C57
};

static const u8 *const gUnknown_845B3A0[] = {
    NULL,
    gUnknown_81B7CC1,
    gUnknown_81B7CC4,
    gUnknown_81B7CD9,
    gUnknown_81B7CDF,
    gUnknown_81B7CE6,
    gUnknown_81B7CEE,
    gUnknown_81B7CF6,
    gUnknown_81B7CFE,
    gUnknown_81B7D04,
    gUnknown_81B7D12,
    gUnknown_81B7D17,
    gUnknown_81B7D1A,
    gUnknown_81B7D1F,
    gUnknown_81B7D27,
    gUnknown_81B7D2D,
    gUnknown_81B7D37,
    gUnknown_81B7D3E,
    gUnknown_81B7D45,
    gUnknown_81B7D48,
    gUnknown_81B7D4E,
    gUnknown_81B7D57,
    gUnknown_81B7D5B,
    gUnknown_81B7D61,
    gUnknown_81B7D6B,
    gUnknown_81B7D76,
    gUnknown_81B7D7E,
    gUnknown_81B7D88,
    gUnknown_81B7D8F,
    gUnknown_81B7D9A,
    gUnknown_81B7DA7,
    gUnknown_81B7DB4,
    gUnknown_81B7DBA,
    gUnknown_81B7DC6,
    gUnknown_81B7DCC,
    gUnknown_81B7DD3,
    gUnknown_81B7DD6,
    gUnknown_81B7DD9,
    gUnknown_81B7DE1,
    gUnknown_81B7DEB,
    gUnknown_81B7DFA,
    gUnknown_81B7E02,
    gUnknown_81B7E09,
    gUnknown_81B7E0F
};

static const u8 *const gUnknown_845B450[] = {
    NULL,
    gUnknown_81B7E16,
    gUnknown_81B7F0A,
    gUnknown_81B800A,
    gUnknown_81B80EC,
    gUnknown_81B81C2,
    gUnknown_81B8256,
    gUnknown_81B8348,
    gUnknown_81B83EF,
    gUnknown_81B847B,
    gUnknown_81B8550,
    gUnknown_81B8647,
    gUnknown_81B86E2,
    gUnknown_81B87B8,
    gUnknown_81B8897,
    gUnknown_81B8924,
    gUnknown_81B8A04,
    gUnknown_81B8A84,
    gUnknown_81B8B62,
    gUnknown_81B8C18,
    gUnknown_81B8C94,
    gUnknown_81B8D1D,
    gUnknown_81B8DD4,
    gUnknown_81B8E67,
    gUnknown_81B8F4D,
    gUnknown_81B901B,
    gUnknown_81B90A7,
    gUnknown_81B90E8,
    gUnknown_81B9170,
    gUnknown_81B91C2,
    gUnknown_81B91F9,
    gUnknown_81B92B8,
    gUnknown_81B92ED,
    gUnknown_81B93D8,
    gUnknown_81B9439,
    gUnknown_81B9497,
    gUnknown_81B9560,
    gUnknown_81B9656,
    gUnknown_81B9749,
    gUnknown_81B984F,
    gUnknown_81B991C,
    gUnknown_81B99C4,
    gUnknown_81B9AA2,
    gUnknown_81B9B2F
};

static const u8 *const gUnknown_845B500[] = {
    NULL,
    gUnknown_81B9BB7,
    gUnknown_81B9BC7,
    gUnknown_81B9BD0,
    gUnknown_81B9BE1,
    gUnknown_81B9BF5,
    gUnknown_81B9C09,
    gUnknown_81B9C1D
};

static const u8 *const gUnknown_845B520[] = {
    NULL,
    gUnknown_81B9C2F,
    gUnknown_81B9D04,
    gUnknown_81B9DC5,
    gUnknown_81B9E75,
    gUnknown_81B9F09,
    gUnknown_81B9FCE,
    gUnknown_81BA027
};

static const u8 *const gUnknown_845B540[] = {
    NULL,
    gUnknown_81BA0F1,
    gUnknown_81BA10D,
    gUnknown_81BA121,
    gUnknown_81BA138,
    gUnknown_81BA14C,
    gUnknown_81BA163,
    gUnknown_81BA17A,
    gUnknown_81BA194,
    gUnknown_81BA1AC,
    gUnknown_81BA1C7,
    gUnknown_81BA1DC,
    gUnknown_81BA1F4,
    gUnknown_81BA209,
    gUnknown_81BA221,
    gUnknown_81BA234,
    gUnknown_81BA24A,
    gUnknown_81BA260,
    gUnknown_81BA279,
    gUnknown_81BA291,
    gUnknown_81BA2AC,
    gUnknown_81BA2C2,
    gUnknown_81BA2DB,
    gUnknown_81BA2F1,
    gUnknown_81BA30A,
    gUnknown_81BA320,
    gUnknown_81BA339,
    gUnknown_81BA34E,
    gUnknown_81BA366,
    gUnknown_81BA37C,
    gUnknown_81BA395,
    gUnknown_81BA3A9,
    gUnknown_81BA3C0,
    gUnknown_81BA3D5,
    gUnknown_81BA3ED,
    gUnknown_81BA400
};

static const u8 *const gUnknown_845B5D0[] = {
    NULL,
    gUnknown_81BA416,
    gUnknown_81BA4E6,
    gUnknown_81BA539,
    gUnknown_81BA595,
    gUnknown_81BA5F2,
    gUnknown_81BA66F,
    gUnknown_81BA6C9,
    gUnknown_81BA71F,
    gUnknown_81BA796,
    gUnknown_81BA7E9,
    gUnknown_81BA862,
    gUnknown_81BA8D3,
    gUnknown_81BA92A,
    gUnknown_81BA98D,
    gUnknown_81BA9F1,
    gUnknown_81BAA44,
    gUnknown_81BAAB6,
    gUnknown_81BAB18,
    gUnknown_81BAB7A,
    gUnknown_81BABCC,
    gUnknown_81BAC29,
    gUnknown_81BAC89,
    gUnknown_81BACC4,
    gUnknown_81BAD20,
    gUnknown_81BAD60,
    gUnknown_81BADA2,
    gUnknown_81BADF7,
    gUnknown_81BAEA8,
    gUnknown_81BAF01,
    gUnknown_81BAF6B,
    gUnknown_81BAFCA,
    gUnknown_81BB02E,
    gUnknown_81BB084,
    gUnknown_81BB0DF,
    gUnknown_81BB156
};


static const u8 gUnknown_845B660[] = {
    0x01, 0x02, 0x03, 0xff
};

static const u8 gUnknown_845B664[] = {
    0x01, 0x02, 0x03, 0xff
};

static const u8 gUnknown_845B668[] = {
    0x13, 0xff
};

static const u8 gUnknown_845B66A[] = {
    0x01, 0x02, 0x03, 0xff
};

static const u8 gUnknown_845B66E[] = {
    0x01, 0x25, 0xff
};

static const u8 gUnknown_845B671[] = {
    0x02, 0x03, 0x04, 0x05, 0x11, 0xff
};

static const u8 gUnknown_845B677[] = {
    0x09, 0x01, 0xff
};

static const u8 gUnknown_845B67A[] = {
    0x02, 0x03, 0xff
};

static const u8 gUnknown_845B67D[] = {
    0x09, 0x0a, 0x0b, 0x11, 0x0c, 0x10, 0xff
};

static const u8 gUnknown_845B684[] = {
    0x09, 0x01, 0x04, 0x05, 0x06, 0x07, 0x08, 0x02, 0x0d, 0xff
};

static const u8 gUnknown_845B68E[] = {
    0x09, 0x03, 0x0a, 0x0f, 0x12, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B696[] = {
    0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x12, 0xff
};

static const u8 gUnknown_845B6A1[] = {
    0x16, 0x17, 0x18, 0xff
};

static const u8 gUnknown_845B6A5[] = {
    0x0a, 0xff
};

static const u8 gUnknown_845B6A7[] = {
    0x11, 0x0e, 0x19, 0x1a, 0x1b, 0xff
};

static const u8 gUnknown_845B6AD[] = {
    0x0a, 0xff
};

static const u8 gUnknown_845B6AF[] = {
    0x0b, 0xff
};

static const u8 gUnknown_845B6B1[] = {
    0x2b, 0x19, 0x1a, 0xff
};

static const u8 gUnknown_845B6B5[] = {
    0x0c, 0xff
};

static const u8 gUnknown_845B6B7[] = {
    0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0xff
};

static const u8 gUnknown_845B6BF[] = {
    0x02, 0x03, 0x04, 0xff
};

static const u8 gUnknown_845B6C3[] = {
    0x01, 0x02, 0x03, 0x07, 0xff
};

static const u8 gUnknown_845B6C8[] = {
    0x02, 0x04, 0x05, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B6CE[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B6E2[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x28, 0xff
};

static const u8 gUnknown_845B6E9[] = {
    0x02, 0x05, 0x06, 0x0a, 0x23, 0x24, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B6F2[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0x14, 0xff
};

static const u8 gUnknown_845B707[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x28, 0xff
};

static const u8 gUnknown_845B70E[] = {
    0x03, 0x07, 0x04, 0x05, 0x06, 0xff
};

static const u8 gUnknown_845B714[] = {
    0x02, 0x05, 0x06, 0x0a, 0x23, 0x24, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B71D[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B731[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x0c, 0x0e, 0x16, 0x17, 0x18, 0x15, 0xff
};

static const u8 gUnknown_845B73D[] = {
    0x06, 0x0a, 0x23, 0x24, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B744[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B758[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x15, 0xff
};

static const u8 gUnknown_845B75F[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B783[] = {
    0x02, 0x0a, 0x04, 0x05, 0x06, 0x07, 0x0d, 0x27, 0x08, 0x0b, 0x21, 0x23, 0x24, 0x2c, 0x09, 0x0e, 0x16, 0x17, 0x0f, 0x10, 0x11, 0x1a, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B7A7[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B7BB[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0xff
};

static const u8 gUnknown_845B7C4[] = {
    0x02, 0x0a, 0x04, 0x05, 0x06, 0x07, 0x0d, 0x27, 0x08, 0x0b, 0x21, 0x23, 0x24, 0x2c, 0x09, 0x0e, 0x16, 0x17, 0x0f, 0x10, 0x11, 0x1a, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B7E8[] = {
    0x1f, 0x01, 0x02, 0x06, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B7F1[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0x28, 0xff
};

static const u8 gUnknown_845B7FB[] = {
    0x0a, 0x07, 0x0d, 0x27, 0x08, 0x0b, 0x21, 0x23, 0x24, 0x2c, 0x09, 0x0e, 0x16, 0x0f, 0x10, 0x11, 0x1a, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B81A[] = {
    0x1f, 0x01, 0x02, 0x06, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B823[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0xff
};

static const u8 gUnknown_845B82C[] = {
    0x07, 0x27, 0x08, 0x2c, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B83E[] = {
    0x1f, 0x01, 0x02, 0x06, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B847[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0xff
};

static const u8 gUnknown_845B850[] = {
    0x0f, 0x1b, 0x1d, 0x11, 0x12, 0x15, 0x17, 0x16, 0x1f, 0x20, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B85D[] = {
    0x20, 0x21, 0x22, 0x23, 0x24, 0x07, 0x09, 0x2b, 0xff
};

static const u8 gUnknown_845B866[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0x27, 0x15, 0xff
};

static const u8 gUnknown_845B878[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B89C[] = {
    0x0f, 0x1b, 0x1d, 0x11, 0x12, 0x16, 0x1f, 0x20, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B8A7[] = {
    0x20, 0x21, 0x22, 0x23, 0x24, 0x07, 0x2b, 0xff
};

static const u8 gUnknown_845B8AF[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0x27, 0x15, 0xff
};

static const u8 gUnknown_845B8C1[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B8E5[] = {
    0x0f, 0x1b, 0x1d, 0x11, 0x12, 0x16, 0x1f, 0x20, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B8F0[] = {
    0x20, 0x21, 0x22, 0x23, 0x24, 0x07, 0x2b, 0xff
};

static const u8 gUnknown_845B8F8[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0x27, 0x15, 0xff
};

static const u8 gUnknown_845B90A[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B92E[] = {
    0x29, 0x2a, 0x2b, 0xff
};

static const u8 gUnknown_845B932[] = {
    0x2d, 0x2e, 0x2f, 0x2b, 0xff
};

static const u8 gUnknown_845B937[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B947[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B96B[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B978[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B985[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B992[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B99F[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B9AC[] = {
    0x26, 0x27, 0x28, 0x29, 0x2a, 0xff
};

static const u8 gUnknown_845B9B2[] = {
    0x26, 0x27, 0x28, 0x29, 0x2a, 0xff
};

static const u8 gUnknown_845B9B8[] = {
    0x26, 0x27, 0x28, 0x29, 0x2a, 0xff
};

static const u8 gUnknown_845B9BE[] = {
    0x09, 0x01, 0x02, 0x03, 0x23, 0x25, 0x24, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0b, 0x0c, 0x0d, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x27, 0x15, 0x26, 0x16, 0x17, 0x18, 0x1a, 0x0e, 0x1b, 0xff
};

static const u8 *const gUnknown_845B9E0[] = {
    NULL, NULL, NULL, NULL, NULL,
    NULL, NULL, NULL, gUnknown_845B660, NULL,
    NULL, NULL, NULL, gUnknown_845B664, NULL,
    NULL, gUnknown_845B668, NULL, gUnknown_845B66A, NULL,
    NULL, gUnknown_845B66E, NULL, NULL, NULL,
    NULL, gUnknown_845B671, gUnknown_845B677, NULL, NULL,
    NULL, gUnknown_845B67A, gUnknown_845B67D, NULL, NULL,
    NULL, NULL, gUnknown_845B684, NULL, NULL,
    NULL, NULL, gUnknown_845B68E, NULL, NULL,
    NULL, gUnknown_845B696, gUnknown_845B6A1, NULL, NULL,
    NULL, gUnknown_845B6A5, gUnknown_845B6A7, NULL, NULL,
    NULL, gUnknown_845B6AD, NULL, NULL, NULL,
    NULL, gUnknown_845B6AF, gUnknown_845B6B1, NULL, NULL,
    NULL, gUnknown_845B6B5, gUnknown_845B6B7, NULL, NULL,
    gUnknown_845B6BF, NULL, NULL, gUnknown_845B6C3, NULL,
    gUnknown_845B6C8, gUnknown_845B6CE, gUnknown_845B6E2, NULL, NULL,
    gUnknown_845B6E9, gUnknown_845B6F2, gUnknown_845B707, gUnknown_845B70E, NULL,
    gUnknown_845B714, gUnknown_845B71D, gUnknown_845B731, NULL, NULL,
    gUnknown_845B73D, gUnknown_845B744, gUnknown_845B758, NULL, gUnknown_845B75F,
    gUnknown_845B783, gUnknown_845B7A7, gUnknown_845B7BB, NULL, NULL,
    gUnknown_845B7C4, gUnknown_845B7E8, gUnknown_845B7F1, NULL, NULL,
    gUnknown_845B7FB, gUnknown_845B81A, gUnknown_845B823, NULL, NULL,
    gUnknown_845B82C, gUnknown_845B83E, gUnknown_845B847, NULL, NULL,
    gUnknown_845B850, gUnknown_845B85D, gUnknown_845B866, NULL, gUnknown_845B878,
    gUnknown_845B89C, gUnknown_845B8A7, gUnknown_845B8AF, NULL, gUnknown_845B8C1,
    gUnknown_845B8E5, gUnknown_845B8F0, gUnknown_845B8F8, NULL, gUnknown_845B90A,
    gUnknown_845B92E, gUnknown_845B932, gUnknown_845B937, NULL, gUnknown_845B947,
    NULL, gUnknown_845B96B, NULL, NULL, NULL,
    NULL, gUnknown_845B978, NULL, NULL, NULL,
    NULL, gUnknown_845B985, NULL, NULL, NULL,
    NULL, gUnknown_845B992, NULL, NULL, NULL,
    NULL, gUnknown_845B99F, NULL, NULL, NULL,
    NULL, gUnknown_845B9AC, NULL, NULL, NULL,
    NULL, gUnknown_845B9B2, NULL, NULL, NULL,
    NULL, gUnknown_845B9B8, NULL, NULL, NULL,
    NULL, NULL, NULL, NULL, NULL
};

static const u16 unref_845BCB0[] = INCBIN_U16("graphics/help_system/unk_845BCB0.bin");

static const u8 gUnknown_845C4B0[] = {
    3, 0, 1, 2, 4, 5
};

static const u8 gUnknown_845C4B6[][6] = {
    {0, 0, 0, 0, 0, 1},
    {0, 0, 0, 1, 0, 1},
    {0, 0, 0, 1, 0, 1},
    {0, 1, 0, 1, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 1, 0, 0, 1},
    {0, 1, 1, 0, 0, 1},
    {0, 0, 1, 0, 0, 1},
    {0, 0, 1, 0, 0, 1},
    {0, 1, 1, 0, 0, 1},
    {0, 1, 1, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 1, 0, 0, 1},
    {0, 1, 1, 0, 0, 1},
    {1, 0, 0, 1, 0, 1},
    {1, 1, 1, 0, 0, 1},
    {1, 1, 1, 1, 0, 1},
    {1, 1, 1, 0, 0, 1},
    {1, 1, 1, 0, 1, 1},
    {1, 1, 1, 0, 0, 1},
    {1, 1, 1, 0, 0, 1},
    {1, 1, 1, 0, 0, 1},
    {1, 1, 1, 0, 0, 1},
    {1, 1, 1, 0, 1, 1},
    {1, 1, 1, 0, 1, 1},
    {1, 1, 1, 0, 1, 1},
    {1, 1, 1, 0, 1, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1},
    {0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0}
};

static const u16 sMartMaps[] = {
    MAP_VIRIDIAN_CITY_MART,
    MAP_PEWTER_CITY_MART,
    MAP_CERULEAN_CITY_MART,
    MAP_LAVENDER_TOWN_MART,
    MAP_VERMILION_CITY_MART,
    MAP_CELADON_CITY_DEPARTMENT_STORE_1F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_2F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_3F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_4F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_5F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_ROOF,
    MAP_CELADON_CITY_DEPARTMENT_STORE_ELEVATOR,
    MAP_FUCHSIA_CITY_MART,
    MAP_CINNABAR_ISLAND_MART,
    MAP_SAFFRON_CITY_MART,
    MAP_THREE_ISLAND_MART,
    MAP_FOUR_ISLAND_MART,
    MAP_SEVEN_ISLAND_MART,
    MAP_SIX_ISLAND_MART,
    MAP_UNDEFINED
};

static const u16 sGymMaps[] = {
    MAP_PEWTER_CITY_GYM,
    MAP_CERULEAN_CITY_GYM,
    MAP_VERMILION_CITY_GYM,
    MAP_CELADON_CITY_GYM,
    MAP_FUCHSIA_CITY_GYM,
    MAP_SAFFRON_CITY_GYM,
    MAP_CINNABAR_ISLAND_GYM,
    MAP_VIRIDIAN_CITY_GYM,
    MAP_UNDEFINED
};

static const u8 sDungeonMaps[][3] = {
    { MAP_GROUP(VIRIDIAN_FOREST), MAP_NUM(VIRIDIAN_FOREST), 1 },
    { MAP_GROUP(MT_MOON_1F), MAP_NUM(MT_MOON_1F), 3 },
    { MAP_GROUP(ROCK_TUNNEL_1F), MAP_NUM(ROCK_TUNNEL_1F), 2 },
    { MAP_GROUP(DIGLETTS_CAVE_NORTH_ENTRANCE), MAP_NUM(DIGLETTS_CAVE_NORTH_ENTRANCE), 3 },
    { MAP_GROUP(SEAFOAM_ISLANDS_1F), MAP_NUM(SEAFOAM_ISLANDS_1F), 5 },
    { MAP_GROUP(VICTORY_ROAD_1F), MAP_NUM(VICTORY_ROAD_1F), 3 },
    { MAP_GROUP(CERULEAN_CAVE_1F), MAP_NUM(CERULEAN_CAVE_1F), 3 },
    { MAP_GROUP(MT_EMBER_RUBY_PATH_B4F), MAP_NUM(MT_EMBER_RUBY_PATH_B4F), 1 },
    { MAP_GROUP(MT_EMBER_SUMMIT_PATH_1F), MAP_NUM(MT_EMBER_SUMMIT_PATH_1F), 3 },
    { MAP_GROUP(MT_EMBER_RUBY_PATH_B5F), MAP_NUM(MT_EMBER_RUBY_PATH_B5F), 7 },
    { MAP_GROUP(THREE_ISLAND_BERRY_FOREST), MAP_NUM(THREE_ISLAND_BERRY_FOREST), 1 },
    { MAP_GROUP(SIX_ISLAND_PATTERN_BUSH), MAP_NUM(SIX_ISLAND_PATTERN_BUSH), 1 },
    { MAP_GROUP(FIVE_ISLAND_LOST_CAVE_ENTRANCE), MAP_NUM(FIVE_ISLAND_LOST_CAVE_ENTRANCE), 15 },
    { MAP_GROUP(FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE), MAP_NUM(FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE), 4 },
    { MAP_GROUP(SIX_ISLAND_ALTERING_CAVE), MAP_NUM(SIX_ISLAND_ALTERING_CAVE), 1 },
    { MAP_GROUP(SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER), MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER), 7 }
};

void HelpSystem_SetSomeVariable(u8 a0)
{
    sSomeVariable = a0;
}

void HelpSystem_SetSomeVariable2(u8 a0)
{
    switch (sSomeVariable)
    {
    case 23:
    case 24:
    case 25:
    case 26:
        if (a0 == 9 || a0 == 5 || a0 == 6 || a0 == 7 || a0 == 8)
            break;
        // fallthrough
    default:
        sSomeVariable = a0;
        break;
    }
}

void Special_SetSomeVariable(void)
{
    sSomeVariable = gSpecialVar_0x8004;
}

void HelpSystem_BackupSomeVariable(void)
{
    gSomeVariableBackup = sSomeVariable;
}

void HelpSystem_RestoreSomeVariable(void)
{
    sSomeVariable = gSomeVariableBackup;
}

static bool32 IsInMartMap(void)
{
    return IsCurrentMapInArray(sMartMaps);
}

static bool32 IsInGymMap(void)
{
    return IsCurrentMapInArray(sGymMaps);
}

static bool32 IsCurrentMapInArray(const u16 * mapIdxs)
{
    u16 mapIdx = (gSaveBlock1Ptr->location.mapGroup << 8) + gSaveBlock1Ptr->location.mapNum;
    s32 i;

    for (i = 0; mapIdxs[i] != MAP_UNDEFINED; i++)
    {
        if (mapIdxs[i] == mapIdx)
            return TRUE;
    }

    return FALSE;
}

static bool8 IsInDungeonMap(void)
{
    u8 i, j;

    for (i = 0; i < 16; i++)
    {
        for (j = 0; j < sDungeonMaps[i][2]; j++)
        {
            if (
                   sDungeonMaps[i][0] == gSaveBlock1Ptr->location.mapGroup
                && sDungeonMaps[i][1] + j == gSaveBlock1Ptr->location.mapNum
                && (i != 15 /* TANOBY */ || FlagGet(FLAG_SYS_UNLOCKED_TANOBY_RUINS) == TRUE)
            )
                return TRUE;
        }
    }

    return FALSE;
}

void sub_812B35C(void)
{
    sub_812B4B8();
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        HelpSystem_SetSomeVariable2(0x16);
    else if (IsInDungeonMap())
        HelpSystem_SetSomeVariable2(0x15);
    else if (is_light_level_8_or_9(gMapHeader.mapType))
    {
        if ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F)) || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_2F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_2F)))
            HelpSystem_SetSomeVariable2(0x0E);
        else if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PROFESSOR_OAKS_LAB) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PROFESSOR_OAKS_LAB))
            HelpSystem_SetSomeVariable2(0x0F);
        else if (IsCurMapPokeCenter() == TRUE)
            HelpSystem_SetSomeVariable2(0x10);
        else if (IsInMartMap() == TRUE)
            HelpSystem_SetSomeVariable2(0x11);
        else if (IsInGymMap() == TRUE)
            HelpSystem_SetSomeVariable2(0x12);
        else
            HelpSystem_SetSomeVariable2(0x13);
    }
    else
        HelpSystem_SetSomeVariable2(0x14);
}

bool8 sub_812B40C(void)
{
    if (gUnknown_203B0EE == 1)
        return FALSE;

    if (gSaveFileStatus != SAVE_STATUS_EMPTY && gSaveFileStatus != SAVE_STATUS_INVALID && FlagGet(FLAG_SYS_SAW_HELP_SYSTEM_INTRO))
        return FALSE;

    FlagSet(FLAG_SYS_SAW_HELP_SYSTEM_INTRO);
    gUnknown_203B0EE = 1;
    return TRUE;
}

bool8 sub_812B45C(void)
{
    if (gReceivedRemoteLinkPlayers == 1)
        return FALSE;
    return TRUE;
}

void HelpSystem_Disable(void)
{
    gHelpSystemEnabled = FALSE;
}

void HelpSystem_Enable(void)
{
    if (gQuestLogState != 2 && gQuestLogState != 3)
    {
        gHelpSystemEnabled = TRUE;
        sub_812B4B8();
    }
}

void sub_812B4AC(void)
{
    gUnknown_203F175 = 1;
}

void sub_812B4B8(void)
{
    gUnknown_203F175 = 0;
}

static void sub_812B4C4(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    a0->sub.items = a1;
    a0->sub.totalItems = 1;
    a0->sub.maxShowed = 1;
    a0->sub.left = 1;
    a0->sub.top = 4;
}

static void sub_812B4D8(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    sub_812B4C4(a0, a1);
    sub_812B520(a0, a1);
    sub_812BF74(gUnknown_841DFAC);
    HelpSystem_InitListMenuController(a0, 0, gUnknown_3005E9C[2]);
    sub_812BF9C(a0, a1);
    sub_813BDA4(1);
    sub_813BD5C(1);
}

static void sub_812B520(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    u8 i;
    u8 r4 = 0;
    for (i = 0; i < 6; i++)
    {
        if (gUnknown_845C4B6[sSomeVariable][gUnknown_845C4B0[i]] == 1)
        {
            a1[r4].label = gUnknown_845B080[gUnknown_845C4B0[i]];
            a1[r4].index = gUnknown_845C4B0[i];
            r4++;
        }
    }
    a1[r4 - 1].index = -2;
    a0->sub.totalItems = r4;
    a0->sub.maxShowed = r4;
    a0->sub.left = 0;
}

static void sub_812B5A8(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    sub_813BDE8(0);
    sub_813BFC0(0);
    sub_813BE78(1);
    sub_812B4C4(a0, a1);
    sub_812B614(a0, a1);
    sub_812BF74(gUnknown_841DFC9);
    HelpSystem_InitListMenuController(a0, a0->field_0C, a0->field_0D);
    HelpSystem_PrintTextAt(gUnknown_845B080[gUnknown_3005E9C[1]], 0, 0);
    sub_813BDA4(1);
    sub_813BD5C(1);
}

static void sub_812B614(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    u8 r6 = 0;
    const u8 * r3 = gUnknown_845B9E0[sSomeVariable * 5 + gUnknown_3005E9C[1]];
    u8 i;
    for (i = 0; r3[i] != 0xFF; i++)
    {
        if (sub_812B780(r3[i]) == TRUE)
        {
            if (gUnknown_3005E9C[1] == 0)
                a1[r6].label = gUnknown_845B0B0[r3[i]];
            else if (gUnknown_3005E9C[1] == 1)
                a1[r6].label = gUnknown_845B218[r3[i]];
            else if (gUnknown_3005E9C[1] == 2)
                a1[r6].label = gUnknown_845B3A0[r3[i]];
            else if (gUnknown_3005E9C[1] == 3)
                a1[r6].label = gUnknown_845B500[r3[i]];
            else
                a1[r6].label = gUnknown_845B540[r3[i]];
            a1[r6].index = r3[i];
            r6++;
        }
    }
    if (sub_812B754() == TRUE)
    {
        for (i = 0, r3 = gUnknown_845B9BE; r3[i] != 0xFF; i++)
        {
            a1[r6].label = gUnknown_845B3A0[r3[i]];
            a1[r6].index = r3[i];
            r6++;
        }
    }
    a1[r6].label = gUnknown_81B2E6F;
    a1[r6].index = -2;
    r6++;
    a0->sub.totalItems = r6;
    a0->sub.maxShowed = 7;
    a0->sub.left = 0;
    a0->sub.top = 21;
}

static bool8 sub_812B754(void)
{
    if (FlagGet(FLAG_DEFEATED_BROCK) == TRUE && gUnknown_3005E9C[1] == 2)
        return TRUE;
    return FALSE;
}

static bool8 sub_812B780(u8 id)
{
    u8 i = 0;

    if (gUnknown_3005E9C[1] == 0)
    {
        switch (id)
        {
        case 1:
        case 2:
        case 3:
        case 5:
        case 8:
        case 34:
        case 38:
        case 41:
        case 42:
        case 43:
            return TRUE;
        case 4:
            return FlagGet(FLAG_VISITED_OAKS_LAB);
        case 6:
        case 10:
        case 16:
        case 19:
        case 22:
        case 35:
        case 36:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_CITY);
        case 7:
            return FlagGet(FLAG_WORLD_MAP_VERMILION_CITY);
        case 11:
        case 24:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST);
        case 9:
        case 13:
        case 14:
        case 15:
        case 17:
        case 18:
        case 20:
        case 26:
        case 29:
        case 31:
        case 37:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case 21:
        case 23:
            return FlagGet(FLAG_SYS_POKEDEX_GET);
        case 12:
        case 25:
        case 27:
        case 30:
        case 32:
        case 33:
            return FlagGet(FLAG_BADGE01_GET);
        case 28:
        case 40:
            return sub_812BB10();
        case 39:
            return FlagGet(FLAG_GOT_FAME_CHECKER);
        case 44:
            return FlagGet(FLAG_WORLD_MAP_PEWTER_CITY);
        }
        return FALSE;
    }
    if (gUnknown_3005E9C[1] == 1)
    {
        switch (id)
        {
        case 06:
        case 10:
        case 11:
        case 12:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 31:
        case 36:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 45:
        case 46:
        case 47:
            return TRUE;
        case 1:
        case 30:
        case 37:
            return FlagGet(FLAG_SYS_POKEDEX_GET);
        case 14:
            return CheckBagHasItem(ITEM_TOWN_MAP, 1);
        case 2:
        case 3:
        case 5:
        case 7:
        case 8:
        case 9:
        case 13:
        case 32:
        case 33:
        case 35:
        case 43:
        case 44:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case 4:
        case 34:
            if (GetKantoPokedexCount(1) > 1)
                return TRUE;
            return FALSE;
        case 15:
            return FlagGet(FLAG_BADGE01_GET);
        case 16:
        case 17:
            return sub_812BB10();
        case 18:
            return FlagGet(FLAG_GOT_BICYCLE);
        case 48:
            return FlagGet(FLAG_SYS_GAME_CLEAR);
        }
        return FALSE;
    }
    if (gUnknown_3005E9C[1] == 2)
    {
        if (sub_812B754() == TRUE)
        {
            for (i = 0; gUnknown_845B9BE[i] != 0xFF; i++)
            {
                if (gUnknown_845B9BE[i] == id)
                    return FALSE;
            }
        }
        switch (id)
        {
        case 14:
        case 17:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 38:
            return TRUE;
        case 1:
        case 2:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 16:
        case 19:
        case 20:
        case 21:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case 36:
        case 37:
            return sub_812BB10();
        case 3:
        case 15:
        case 18:
        case 39:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST);
        }
        return TRUE;
    }
    if (gUnknown_3005E9C[1] == 3)
    {
        switch (id)
        {
        case 5:
            return FlagGet(FLAG_BADGE01_GET);
        case 6:
            return FlagGet(FLAG_BADGE02_GET);
        }
        return TRUE;
    }
    if (gUnknown_3005E9C[1] == 4)
    {
        return TRUE;
    }

    return FALSE;
}

static bool8 sub_812BB10(void)
{
    if (FlagGet(FLAG_GOT_HM01) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM02) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM03) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM04) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM05) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM06) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_HIDE_FOUR_ISLAND_ICEFALL_CAVE_1F_HM07) == TRUE)
        return TRUE;
    return FALSE;
}

bool8 sub_812BB9C(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    switch (a0->field_0E)
    {
    case  8:
        return sub_812BC54(a0, a1);
    case  9:
        return sub_812BC80(a0, a1);
    case 10:
        return sub_812BCA8(a0, a1);
    case  0:
        return sub_812BCD0(a0, a1);
    case  1:
        return sub_812BD2C(a0, a1);
    case  2:
        return sub_812BD64(a0, a1);
    case  3:
        return sub_812BD98(a0, a1);
    case  4:
        return sub_812BE10(a0, a1);
    case  5:
        return sub_812BEEC(a0, a1);
    case  6:
        return sub_812BF18(a0, a1);
    }
    return FALSE;
}

bool8 sub_812BC54(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    sub_812BF74(gUnknown_841DFA5);
    sub_812BF5C();
    sub_813BDA4(1);
    sub_813BD5C(1);
    a0->field_0E = 9;
    return TRUE;
}

bool8 sub_812BC80(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        a0->field_0E = 10;
    }
    return TRUE;
}

bool8 sub_812BCA8(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    gUnknown_3005E9C[2] = 0;
    sub_812BF94(a0);
    sub_812B4D8(a0, a1);
    a0->field_0E = 0;
    return TRUE;
}

bool8 sub_812BCD0(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    s32 v0 = HelpSystem_GetMenuInput();
    switch (v0)
    {
    case -6:
    case -2:
        return FALSE;
    case -5:
    case -4:
        sub_812BF9C(a0, a1);
        break;
    case -3:
    case -1:
        break;
    default:
        gUnknown_3005E9C[1] = v0;
        a0->field_0E = 1;
        break;
    }
    return TRUE;
}

bool8 sub_812BD2C(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    gUnknown_3005E9C[0] = 1;
    gUnknown_3005E9C[2] = a0->field_0D;
    sub_812BF94(a0);
    sub_812B5A8(a0, a1);
    sub_813C75C();
    HelpSystem_SetInputDelay(2);
    a0->field_0E = 3;
    return TRUE;
}

bool8 sub_812BD64(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    sub_813C004(0, 0);
    sub_813C004(1, 0);
    gUnknown_3005E9C[0] = 0;
    sub_812B4D8(a0, a1);
    a0->field_0E = 0;
    return TRUE;
}

bool8 sub_812BD98(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    s32 v0 = HelpSystem_GetMenuInput();
    switch (v0)
    {
    case -6:
        return FALSE;
    case -2:
        a0->field_0E = 2;
        break;
    case -5:
    case -4:
    case -3:
    case -1:
        break;
    default:
        gUnknown_3005E9C[3] = v0;
        a0->field_0E = 4;
        break;
    }
    return TRUE;
}

void sub_812BDEC(void)
{
    HelpSystem_PrintTextAt(gUnknown_845B080[gUnknown_3005E9C[1]], 0, 0);
}

bool8 sub_812BE10(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    gUnknown_3005E9C[0] = 2;
    sub_813BDA4(0);
    HelpSystem_FillPanel1();
    sub_812BF74(gUnknown_841DFBE);
    sub_813BDE8(1);
    sub_813BEE4(1);

    if (gUnknown_3005E9C[1] == 0)
    {
        HelpSystem_PrintTwoStrings(gUnknown_845B0B0[gUnknown_3005E9C[3]], gUnknown_845B164[gUnknown_3005E9C[3]]);
    }
    else if (gUnknown_3005E9C[1] == 1)
    {
        HelpSystem_PrintTwoStrings(gUnknown_845B218[gUnknown_3005E9C[3]], gUnknown_845B2DC[gUnknown_3005E9C[3]]);
    }
    else if (gUnknown_3005E9C[1] == 2)
    {
        HelpSystem_PrintTwoStrings(gUnknown_845B3A0[gUnknown_3005E9C[3]], gUnknown_845B450[gUnknown_3005E9C[3]]);
    }
    else if (gUnknown_3005E9C[1] == 3)
    {
        HelpSystem_PrintTwoStrings(gUnknown_845B500[gUnknown_3005E9C[3]], gUnknown_845B520[gUnknown_3005E9C[3]]);
    }
    else
    {
        HelpSystem_PrintTwoStrings(gUnknown_845B540[gUnknown_3005E9C[3]], gUnknown_845B5D0[gUnknown_3005E9C[3]]);
    }
    sub_813BDA4(1);
    sub_813BD5C(1);
    a0->field_0E = 6;
    return TRUE;
}

bool8 sub_812BEEC(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    gUnknown_3005E9C[0] = 1;
    sub_812B5A8(a0, a1);
    sub_813C75C();
    HelpSystem_SetInputDelay(2);
    a0->field_0E = 3;
    return TRUE;
}

bool8 sub_812BF18(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    if (JOY_NEW(B_BUTTON) || JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        a0->field_0E = 5;
        return TRUE;
    }
    if (JOY_NEW(L_BUTTON | R_BUTTON))
        return FALSE;
    return TRUE;
}

static void sub_812BF5C(void)
{
    HelpSystem_FillPanel1();
    HelpSystem_PrintTextAt(gUnknown_81B2FC9, 0, 0);
}

static void sub_812BF74(const u8 * str)
{
    HelpSystem_FillPanel2();
    HelpSystem_PrintTextRightAlign_Row52(str);
}

u8 sub_812BF88(void)
{
    return gUnknown_3005E9C[0];
}

static void sub_812BF94(struct HelpSystemListMenu * a0)
{
    a0->field_0C = 0;
    a0->field_0D = 0;
}

static void sub_812BF9C(struct HelpSystemListMenu * a0, struct ListMenuItem * a1)
{
    s32 index = a1[a0->field_0C + a0->field_0D].index;
    if (index == -2)
        HelpSystem_PrintText_813C584(gUnknown_845B098[5]);
    else
        HelpSystem_PrintText_813C584(gUnknown_845B098[index]);
    sub_813BE30(1);
}
