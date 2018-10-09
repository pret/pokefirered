#include "global.h"
#include "songs.h"
#include "sound.h"
#include "task.h"
#include "malloc.h"
#include "field_map_obj.h"
#include "new_menu_helpers.h"
#include "item_use.h"
#include "event_scripts.h"
#include "event_data.h"
#include "script.h"
#include "map_obj_lock.h"
#include "field_specials.h"
#include "item_menu.h"
#include "field_effect.h"
#include "script_movement.h"
#include "battle.h"
#include "battle_setup.h"
#include "random.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "map_obj_8097404.h"
#include "unk_810c3a4.h"
#include "vs_seeker.h"

// static types
struct UnkStruct_845318C
{
    u16 unk_0[6];
    u16 unk_c;
    u16 unk_e;
};

extern u16 gUnknown_20370D2;
extern struct MapObject gUnknown_2036E38[MAP_OBJECTS_COUNT];
extern u8 gUnknown_3005074;

// static declarations
static EWRAM_DATA struct VsSeekerStruct *gUnknown_203ADB8 = NULL;

static void sub_810C730(u8 taskId);
static void sub_810C760(u8 taskId);
static void sub_810C808(void);
static void sub_810C8EC(u8 taskId);
static bool8 sub_810C96C(void);
static u8 sub_810C9A8(const struct UnkStruct_845318C *);
static u8 sub_810CD14(const u16 *, u8);
static u8 sub_810CD80(const struct UnkStruct_845318C *, u16);
static u8 sub_810CDB4(const struct UnkStruct_845318C *, u16);
static int sub_810CE10(const struct UnkStruct_845318C * a0, u16 a1);
static bool8 sub_810CED0(const struct UnkStruct_845318C *, u16);
static u8 sub_810CF90(u8);
static u16 sub_810D074(const u8 *);
static int sub_810D084(const struct UnkStruct_845318C *, u16);
static bool32 sub_810D0A8(u32);
static bool8 sub_810D0FC(struct VsSeekerSubstruct *);
static u8 sub_810D164(const struct UnkStruct_845318C *, u16, u8 *);
static u8 sub_810D1CC(void);
static void sub_810D24C(struct VsSeekerSubstruct *, const u8 *);
static u8 sub_810D280(int, u16);
static void sub_810D304(void);

// rodata
static const struct UnkStruct_845318C gUnknown_845318C[] = {
    { {0x0059, 0x0065, 0xffff, 0x01f2, 0x01f3, 0x0000},
      0x0003, 0x0015 },
    { {0x005a, 0x005a, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0015 },
    { {0x0069, 0x02d9, 0xffff, 0x02da, 0xffff, 0x02db},
      0x0003, 0x0015 },
    { {0x006a, 0x006a, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0015 },
    { {0x006b, 0x006b, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0015 },
    { {0x0074, 0x01fb, 0xffff, 0x01fc, 0x0000, 0x0000},
      0x0003, 0x0015 },
    { {0x0075, 0x0075, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0015 },
    { {0x0076, 0x0076, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0015 },
    { {0x0077, 0x0077, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0016 },
    { {0x005c, 0x01f7, 0xffff, 0x01f8, 0xffff, 0x01f9},
      0x0003, 0x002b },
    { {0x006e, 0x006e, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002b },
    { {0x007a, 0x01f5, 0xffff, 0x01f6, 0x0000, 0x0000},
      0x0003, 0x002b },
    { {0x007b, 0x007b, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002b },
    { {0x008f, 0x008f, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002b },
    { {0x0090, 0x0090, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002b },
    { {0x005d, 0x005d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002c },
    { {0x005e, 0x005e, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002c },
    { {0x005f, 0x01f4, 0xffff, 0x01fa, 0x01fd, 0x0000},
      0x0003, 0x002c },
    { {0x0099, 0x026d, 0xffff, 0x026e, 0x026f, 0x0000},
      0x0003, 0x002c },
    { {0x007d, 0x007d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002c },
    { {0x00b6, 0xffff, 0x01fe, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002c },
    { {0x00b7, 0x00b7, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002c },
    { {0x00b8, 0x00b8, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002c },
    { {0x01d7, 0x01d7, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002c },
    { {0x006f, 0x006f, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0018 },
    { {0x0070, 0x0070, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0018 },
    { {0x0091, 0x0270, 0xffff, 0x0271, 0xffff, 0x0272},
      0x0003, 0x0018 },
    { {0x0092, 0x0273, 0xffff, 0x0274, 0xffff, 0x0275},
      0x0003, 0x0018 },
    { {0x0097, 0x0097, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0018 },
    { {0x0098, 0x0276, 0xffff, 0x0277, 0x0278, 0x0000},
      0x0003, 0x0018 },
    { {0x0061, 0x0061, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x0062, 0x0062, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x0063, 0xffff, 0x0279, 0xffff, 0x027a, 0x0000},
      0x0003, 0x001d },
    { {0x0064, 0x0064, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x00dd, 0x00dd, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x00de, 0xffff, 0xffff, 0x027b, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x0102, 0x0102, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x0103, 0x0103, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x0104, 0x0104, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x0105, 0xffff, 0xffff, 0x027c, 0x0000, 0x0000},
      0x0003, 0x001d },
    { {0x0072, 0x0072, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001b },
    { {0x0073, 0x0073, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001b },
    { {0x0094, 0xffff, 0x027d, 0x027e, 0xffff, 0x027f},
      0x0003, 0x001b },
    { {0x0095, 0x0095, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001b },
    { {0x009a, 0xffff, 0x0280, 0x0281, 0xffff, 0x0282},
      0x0003, 0x001b },
    { {0x009b, 0x009b, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001b },
    { {0x00b9, 0x00b9, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001b },
    { {0x00ba, 0x00ba, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001b },
    { {0x01d1, 0xffff, 0xffff, 0x0283, 0x0000, 0x0000},
      0x0003, 0x001b },
    { {0x009c, 0x009c, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001c },
    { {0x009d, 0x009d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001c },
    { {0x00a2, 0xffff, 0xffff, 0x0252, 0xffff, 0x0284},
      0x0003, 0x001c },
    { {0x00a3, 0xffff, 0xffff, 0x0285, 0xffff, 0x0286},
      0x0003, 0x001c },
    { {0x00bb, 0x00bb, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001c },
    { {0x00bc, 0xffff, 0xffff, 0x0287, 0x0000, 0x0000},
      0x0003, 0x001c },
    { {0x0080, 0x0080, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x0081, 0x0081, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x0082, 0xffff, 0x0288, 0xffff, 0x0289, 0x0000},
      0x0003, 0x001a },
    { {0x0083, 0x0083, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x00ab, 0x00ab, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x00ac, 0xffff, 0xffff, 0x028a, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x00ad, 0x00ad, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x0106, 0x0106, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x0108, 0xffff, 0xffff, 0x028b, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x01e4, 0xffff, 0xffff, 0x0215, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x0217, 0x0217, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x0218, 0xffff, 0xffff, 0x028c, 0x0000, 0x0000},
      0x0003, 0x001a },
    { {0x00e1, 0x00e1, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001e },
    { {0x00e2, 0x00e2, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001e },
    { {0x00e3, 0x00e3, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001e },
    { {0x00e4, 0xffff, 0xffff, 0x028d, 0x0000, 0x0000},
      0x0003, 0x001e },
    { {0x00e9, 0x00e9, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001e },
    { {0x011d, 0xffff, 0xffff, 0x028e, 0x0000, 0x0000},
      0x0003, 0x001e },
    { {0x01dd, 0x01dd, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001e },
    { {0x01e6, 0xffff, 0xffff, 0x02c2, 0xffff, 0x02c3},
      0x0003, 0x001e },
    { {0x00c3, 0x00c3, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001f },
    { {0x010c, 0x010c, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001f },
    { {0x010d, 0xffff, 0xffff, 0xffff, 0x028f, 0x0000},
      0x0003, 0x001f },
    { {0x012c, 0x012c, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001f },
    { {0x012d, 0x012d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001f },
    { {0x012e, 0xffff, 0xffff, 0x0290, 0x0291, 0x0000},
      0x0003, 0x001f },
    { {0x01d2, 0x01d2, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001f },
    { {0x01d3, 0xffff, 0xffff, 0x0292, 0x0293, 0x0294},
      0x0003, 0x001f },
    { {0x01d4, 0x01d4, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001f },
    { {0x01d5, 0x01d5, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x001f },
    { {0x00c4, 0x00c4, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x00cf, 0xffff, 0xffff, 0xffff, 0x0295, 0x0000},
      0x0003, 0x0020 },
    { {0x00d0, 0x00d0, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x00d1, 0x00d1, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x012f, 0x012f, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x0130, 0xffff, 0xffff, 0x0296, 0x0297, 0x0000},
      0x0003, 0x0020 },
    { {0x0139, 0x0139, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x013a, 0x013a, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x013b, 0x013b, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x013c, 0xffff, 0xffff, 0x0298, 0x0299, 0x0000},
      0x0003, 0x0020 },
    { {0x01e7, 0x01e7, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0020 },
    { {0x00c5, 0x00c5, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0021 },
    { {0x00c6, 0x00c6, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0021 },
    { {0x0111, 0xffff, 0xffff, 0xffff, 0x029a, 0x0000},
      0x0003, 0x0021 },
    { {0x0112, 0x0112, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0021 },
    { {0x0131, 0x0131, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0021 },
    { {0x0132, 0xffff, 0xffff, 0x029b, 0x029c, 0x0000},
      0x0003, 0x0021 },
    { {0x01de, 0x01de, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0021 },
    { {0x01df, 0x01df, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0021 },
    { {0x01e0, 0xffff, 0xffff, 0x029d, 0x029e, 0x029f},
      0x0003, 0x0021 },
    { {0x01e1, 0x01e1, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0021 },
    { {0x01e8, 0xffff, 0xffff, 0x02a0, 0x02a1, 0x02a2},
      0x0003, 0x0021 },
    { {0x00c7, 0x00c7, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0022 },
    { {0x00c9, 0x00c9, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0022 },
    { {0x00ca, 0xffff, 0xffff, 0xffff, 0x02a3, 0x0000},
      0x0003, 0x0022 },
    { {0x00f9, 0x00f9, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0022 },
    { {0x00fa, 0x00fa, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0022 },
    { {0x00fb, 0xffff, 0xffff, 0xffff, 0x02a4, 0x0000},
      0x0003, 0x0022 },
    { {0x01e9, 0x01e9, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0022 },
    { {0x00cb, 0x00cb, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0023 },
    { {0x00cc, 0x00cc, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0023 },
    { {0x00cd, 0xffff, 0xffff, 0xffff, 0x02a5, 0x0000},
      0x0003, 0x0023 },
    { {0x00ce, 0x00ce, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0023 },
    { {0x00fc, 0x00fc, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0023 },
    { {0x00fd, 0xffff, 0xffff, 0xffff, 0x02a6, 0x0000},
      0x0003, 0x0023 },
    { {0x00fe, 0x00fe, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0023 },
    { {0x00ff, 0x00ff, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0023 },
    { {0x0100, 0xffff, 0xffff, 0xffff, 0x02a7, 0x0000},
      0x0003, 0x0023 },
    { {0x01d6, 0x01d6, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0023 },
    { {0x0133, 0x0133, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0024 },
    { {0x0134, 0x0134, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0024 },
    { {0x0135, 0xffff, 0xffff, 0x02a8, 0x02a9, 0x0000},
      0x0003, 0x0024 },
    { {0x00eb, 0x00eb, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x00ec, 0x00ec, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x00ed, 0xffff, 0xffff, 0xffff, 0x02dc, 0x0000},
      0x0003, 0x0025 },
    { {0x00ee, 0x00ee, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x00ef, 0x00ef, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x00f0, 0xffff, 0xffff, 0xffff, 0x02dd, 0x0000},
      0x0003, 0x0025 },
    { {0x00f1, 0x00f1, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x0114, 0x0114, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x0115, 0xffff, 0xffff, 0xffff, 0x02aa, 0x0000},
      0x0003, 0x0025 },
    { {0x0116, 0x0116, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x01ea, 0x01ea, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0025 },
    { {0x00f2, 0x00f2, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0026 },
    { {0x00f3, 0x00f3, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0026 },
    { {0x00f4, 0xffff, 0xffff, 0xffff, 0xffff, 0x02ab},
      0x0003, 0x0026 },
    { {0x010e, 0x010e, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0026 },
    { {0x010f, 0x010f, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0026 },
    { {0x0110, 0xffff, 0xffff, 0xffff, 0x02de, 0x0000},
      0x0003, 0x0026 },
    { {0x0117, 0x0117, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0026 },
    { {0x0136, 0x0136, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0026 },
    { {0x01d8, 0xffff, 0xffff, 0xffff, 0x02ac, 0x02ad},
      0x0003, 0x0026 },
    { {0x01d9, 0x01d9, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0026 },
    { {0x00e5, 0x00e5, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0027 },
    { {0x00e6, 0x00e6, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0027 },
    { {0x00e7, 0xffff, 0xffff, 0xffff, 0x02ae, 0x0000},
      0x0003, 0x0027 },
    { {0x00e8, 0x00e8, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0027 },
    { {0x00f5, 0x00f5, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0027 },
    { {0x00f6, 0xffff, 0xffff, 0xffff, 0x02af, 0x0000},
      0x0003, 0x0027 },
    { {0x00f7, 0x00f7, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0027 },
    { {0x00f8, 0x00f8, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0027 },
    { {0x01eb, 0xffff, 0xffff, 0xffff, 0x02b0, 0x02b1},
      0x0003, 0x0027 },
    { {0x0223, 0x0223, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002d },
    { {0x0224, 0x0224, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002d },
    { {0x0225, 0xffff, 0xffff, 0xffff, 0x02b2, 0x0000},
      0x0003, 0x002d },
    { {0x0226, 0x0226, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002d },
    { {0x0227, 0x0227, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002d },
    { {0x0206, 0xffff, 0xffff, 0xffff, 0x02b3, 0x02b4},
      0x0003, 0x002d },
    { {0x0228, 0xffff, 0xffff, 0xffff, 0x02b5, 0x02b6},
      0x0003, 0x002d },
    { {0x0229, 0xffff, 0xffff, 0xffff, 0x02b7, 0x02b8},
      0x0003, 0x002d },
    { {0x022a, 0xffff, 0xffff, 0xffff, 0x02b9, 0x02ba},
      0x0003, 0x002d },
    { {0x022b, 0x022b, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002d },
    { {0x022c, 0x022c, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002d },
    { {0x022d, 0xffff, 0xffff, 0xffff, 0x02bb, 0x02bc},
      0x0003, 0x002d },
    { {0x0222, 0x0222, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x002e },
    { {0x020b, 0x020b, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0030 },
    { {0x022e, 0x022e, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0030 },
    { {0x0207, 0xffff, 0xffff, 0xffff, 0x02bd, 0x0000},
      0x0003, 0x0030 },
    { {0x022f, 0x022f, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0030 },
    { {0x0231, 0x0231, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0030 },
    { {0x0230, 0xffff, 0xffff, 0xffff, 0x02be, 0x0000},
      0x0003, 0x0030 },
    { {0x020e, 0x020e, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0036 },
    { {0x0232, 0x0232, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0036 },
    { {0x0233, 0xffff, 0xffff, 0xffff, 0xffff, 0x02bf},
      0x0003, 0x0036 },
    { {0x020d, 0x020d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0036 },
    { {0x0234, 0x0234, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0036 },
    { {0x0235, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c0},
      0x0003, 0x0036 },
    { {0x0236, 0x0236, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0036 },
    { {0x0208, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c1},
      0x0003, 0x0037 },
    { {0x023a, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c4},
      0x0003, 0x0039 },
    { {0x023b, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c5},
      0x0003, 0x0039 },
    { {0x023c, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c6},
      0x0003, 0x0039 },
    { {0x023d, 0x023d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003a },
    { {0x023e, 0x023e, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003a },
    { {0x023f, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c7},
      0x0003, 0x003a },
    { {0x0240, 0x0240, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003a },
    { {0x0205, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c8},
      0x0003, 0x003b },
    { {0x0241, 0x0241, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003c },
    { {0x0123, 0x0123, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003c },
    { {0x0242, 0xffff, 0xffff, 0xffff, 0xffff, 0x02c9},
      0x0003, 0x003c },
    { {0x0243, 0x0243, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003c },
    { {0x0244, 0x0244, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003c },
    { {0x0245, 0xffff, 0xffff, 0xffff, 0xffff, 0x02ca},
      0x0003, 0x003c },
    { {0x020c, 0x020c, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003d },
    { {0x0246, 0x0246, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003d },
    { {0x0247, 0xffff, 0xffff, 0xffff, 0xffff, 0x02cb},
      0x0003, 0x003d },
    { {0x0248, 0x0248, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003d },
    { {0x0249, 0xffff, 0xffff, 0xffff, 0xffff, 0x02cc},
      0x0003, 0x003d },
    { {0x024a, 0xffff, 0xffff, 0xffff, 0xffff, 0x02cd},
      0x0003, 0x003e },
    { {0x024b, 0xffff, 0xffff, 0xffff, 0xffff, 0x02ce},
      0x0003, 0x003e },
    { {0x024c, 0x024c, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003f },
    { {0x024d, 0x024d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x003f },
    { {0x024e, 0xffff, 0xffff, 0xffff, 0xffff, 0x02cf},
      0x0003, 0x003f },
    { {0x0209, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d0},
      0x0003, 0x003f },
    { {0x020a, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d1},
      0x0003, 0x003f },
    { {0x024f, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d2},
      0x0003, 0x0040 },
    { {0x0251, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d3},
      0x0003, 0x0040 },
    { {0x0254, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d4},
      0x0003, 0x0040 },
    { {0x0256, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d5},
      0x0003, 0x0040 },
    { {0x0257, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d6},
      0x0003, 0x0040 },
    { {0x0258, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d7},
      0x0003, 0x0040 },
    { {0x0259, 0xffff, 0xffff, 0xffff, 0xffff, 0x02d8},
      0x0003, 0x0040 },
    { {0x025a, 0x025a, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0041 },
    { {0x025b, 0x025b, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0041 },
    { {0x025c, 0x025c, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0041 },
    { {0x025d, 0x025d, 0x0000, 0x0000, 0x0000, 0x0000},
      0x0003, 0x0041 }
};

static const u8 gUnknown_8453F5C[] = { 0x1c, 0x1c, 0x1c, 0xfe };
static const u8 gUnknown_8453F60[] = { 0x62, 0xfe };
static const u8 gUnknown_8453F62[] = { 0x64, 0xfe };
static const u8 gUnknown_8453F64[] = { 0x2d, 0x65, 0xfe };
static const u8 gUnknown_8453F67[] = { 0x08, 0x08, 0x07, 0x09, 0x0a };


// text
void sub_810C670(u8 taskId)
{
    u8 i;
    u8 respval;

    for (i = 0; i < 16; i++)
        gTasks[taskId].data[i] = 0;

    gUnknown_203ADB8 = AllocZeroed(sizeof(struct VsSeekerStruct));
    sub_810C808();
    respval = sub_810C96C();
    if (respval == 0)
    {
        Free(gUnknown_203ADB8);
        DisplayItemMessageOnField(taskId, 2, gUnknown_81C137C, sub_80A1E0C);
    }
    else if (respval == 1)
    {
        Free(gUnknown_203ADB8);
        DisplayItemMessageOnField(taskId, 2, gUnknown_81C13D6, sub_80A1E0C);
    }
    else if (respval == 2)
    {
        sub_80A2294(4, 0, gUnknown_203AD30, 0xffff);
        FieldEffectStart(FLDEFF_UNK_41); // TODO: name this enum
        gTasks[taskId].func = sub_810C730;
        gTasks[taskId].data[0] = 15;
    }
}

static void sub_810C730(u8 taskId)
{
    if (--gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].func = sub_810C760;
        gTasks[taskId].data[1] = 16;
    }
}

static void sub_810C760(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 2 && --data[1] == 0)
    {
        PlaySE(SE_BASABASA);
        data[1] = 11;
        data[2]++;
    }

    if (!FieldEffectActiveListContains(FLDEFF_UNK_41))
    {
        data[1] = 0;
        data[2] = 0;
        sub_810C604();
        gUnknown_203ADB8->unk_431_3 = sub_810C9A8(gUnknown_845318C);
        ScriptMovement_StartObjectMovementScript(0xFF, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, gUnknown_8453F5C);
        gTasks[taskId].func = sub_810C8EC;
    }
}

static void sub_810C808(void)
{
    struct MapObjectTemplate *templates = gSaveBlock1Ptr->mapObjectTemplates;
    u8 fieldObjectId = 0;
    u8 vsSeekerObjectIdx = 0;
    s32 mapObjectIdx;

    for (mapObjectIdx = 0; mapObjectIdx < gMapHeader.events->mapObjectCount; mapObjectIdx++)
    {
        if (templates[mapObjectIdx].unkC == 1 || templates[mapObjectIdx].unkC == 3)
        {
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_0 = templates[mapObjectIdx].script;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_4 = sub_810D074(templates[mapObjectIdx].script);
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_6 = templates[mapObjectIdx].localId;
            TryGetFieldObjectIdByLocalIdAndMap(templates[mapObjectIdx].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &fieldObjectId);
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_7 = fieldObjectId;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_8 = gUnknown_2036E38[fieldObjectId].coords2.x - 7;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_a = gUnknown_2036E38[fieldObjectId].coords2.y - 7;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_c = templates[mapObjectIdx].graphicsId;
            vsSeekerObjectIdx++;
        }
    }
    gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_6 = 0xFF;
}

static void sub_810C8EC(u8 taskId)
{
    if (ScriptMovement_IsObjectMovementFinished(0xFF, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup))
    {
        if (gUnknown_203ADB8->unk_431_3 == 0)
        {
            DisplayItemMessageOnField(taskId, 2, gUnknown_81C1429, sub_80A1E0C);
        }
        else
        {
            if (gUnknown_203ADB8->unk_431_3 == 2)
                sub_810D304();
            sub_80F6F54(0, 1);
            sub_80696C0();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        Free(gUnknown_203ADB8);
    }
}

u8 sub_810C96C(void)
{
    u8 vsSeekerChargeSteps = gSaveBlock1Ptr->trainerRematchStepCounter;
    if (vsSeekerChargeSteps == 100)
    {
        if (sub_810D1CC() == 0xFF)
            return 1;
        else
            return 2;
    }
    else
    {
        TV_PrintIntToStringVar(0, 100 - vsSeekerChargeSteps);
        return 0;
    }
}

// Nonmatching due to register roulette
#ifdef NONMATCHING
static u8 sub_810C9A8(const struct UnkStruct_845318C * a0)
{
    u16 r8 = 0;
    u8 sp0 = 0;
    int vsSeekerIdx;

    for (vsSeekerIdx = 0; gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_6 != 0xFF; vsSeekerIdx++)
    {
        if (sub_810D0FC(&gUnknown_203ADB8->unk_000[vsSeekerIdx]) == 1)
        {
            r8 = gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_4;
            if (!HasTrainerAlreadyBeenFought(r8))
            {
                sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F60);
                gUnknown_203ADB8->unk_431_0 = 1;
            }
            else
            {
                u8 r7 = sub_810D164(a0, r8, &sp0);
                if (r7 == 0)
                {
                    sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F62);
                    gUnknown_203ADB8->unk_431_1 = 1;
                }
                else
                {
                    u16 rval = Random() % 100;
                    u8 r0 = sub_810D280(vsSeekerIdx, r8);
                    if (r0 == 2)
                        rval = 100;
                    else if (r0 == 1)
                        rval = 0;
                    if (rval < 30)
                    {
                        sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F62);
                        gUnknown_203ADB8->unk_431_1 = 1;
                    }
                    else
                    {
                        gSaveBlock1Ptr->trainerRematches[gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_6] = r7;
                        npc_coords_shift_still(&gUnknown_2036E38[gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_7]);
                        sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F64);
                        gUnknown_203ADB8->unk_400[gUnknown_203ADB8->unk_430] = r8;
                        gUnknown_203ADB8->unk_420[gUnknown_203ADB8->unk_430] = sub_810CF90(gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_c);
                        gUnknown_203ADB8->unk_430++;
                        gUnknown_203ADB8->unk_431_2 = 1;
                    }
                }
            }
        }
    }

    if (gUnknown_203ADB8->unk_431_2)
    {
        PlaySE(SE_PIN);
        FlagSet(0x801); // TODO: make this an enum
        sub_810C640();
        return 2;
    }
    if (gUnknown_203ADB8->unk_431_0)
        return 1;
    return 0;
}
#else
NAKED
static u8 sub_810C9A8(const struct UnkStruct_845318C * a0)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tmov r8, r0\n"
                "\tmov r0, sp\n"
                "\tmov r1, r8\n"
                "\tstrb r1, [r0]\n"
                "\tmovs r2, 0\n"
                "\tmov r9, r2\n"
                "\tldr r4, _0810CA14 @ =gUnknown_203ADB8\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x6]\n"
                "\tcmp r0, 0xFF\n"
                "\tbne _0810C9D0\n"
                "\tb _0810CB2C\n"
                "_0810C9D0:\n"
                "\tadds r6, r4, 0\n"
                "\tmovs r3, 0x86\n"
                "\tlsls r3, 3\n"
                "\tmov r10, r3\n"
                "\tmovs r5, 0\n"
                "_0810C9DA:\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tbl sub_810D0FC\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _0810C9EC\n"
                "\tb _0810CB18\n"
                "_0810C9EC:\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, r5\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tmov r8, r0\n"
                "\tbl HasTrainerAlreadyBeenFought\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _0810CA20\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CA18 @ =gUnknown_8453F60\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tldr r0, _0810CA1C @ =0x00000431\n"
                "\tadds r2, r0\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x1\n"
                "\tb _0810CB14\n"
                "\t.align 2, 0\n"
                "_0810CA14: .4byte gUnknown_203ADB8\n"
                "_0810CA18: .4byte gUnknown_8453F60\n"
                "_0810CA1C: .4byte 0x00000431\n"
                "_0810CA20:\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tmov r1, r8\n"
                "\tmov r2, sp\n"
                "\tbl sub_810D164\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tcmp r7, 0\n"
                "\tbne _0810CA50\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CA48 @ =gUnknown_8453F62\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tldr r3, _0810CA4C @ =0x00000431\n"
                "\tadds r2, r3\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x2\n"
                "\tb _0810CB14\n"
                "\t.align 2, 0\n"
                "_0810CA48: .4byte gUnknown_8453F62\n"
                "_0810CA4C: .4byte 0x00000431\n"
                "_0810CA50:\n"
                "\tbl Random\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmovs r1, 0x64\n"
                "\tbl __umodsi3\n"
                "\tlsls r0, 16\n"
                "\tlsrs r4, r0, 16\n"
                "\tmov r0, r9\n"
                "\tmov r1, r8\n"
                "\tbl sub_810D280\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x2\n"
                "\tbne _0810CA76\n"
                "\tmovs r4, 0x64\n"
                "\tb _0810CA7C\n"
                "_0810CA76:\n"
                "\tcmp r0, 0x1\n"
                "\tbne _0810CA7C\n"
                "\tmovs r4, 0\n"
                "_0810CA7C:\n"
                "\tcmp r4, 0x1D\n"
                "\tbhi _0810CAA0\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CA98 @ =gUnknown_8453F62\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tldr r0, _0810CA9C @ =0x00000431\n"
                "\tadds r2, r0\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x2\n"
                "\tb _0810CB14\n"
                "\t.align 2, 0\n"
                "_0810CA98: .4byte gUnknown_8453F62\n"
                "_0810CA9C: .4byte 0x00000431\n"
                "_0810CAA0:\n"
                "\tldr r0, _0810CB54 @ =gSaveBlock1Ptr\n"
                "\tldr r1, [r0]\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r2, _0810CB58 @ =0x0000063a\n"
                "\tadds r1, r2\n"
                "\tldrb r0, [r0, 0x6]\n"
                "\tadds r1, r0\n"
                "\tstrb r7, [r1]\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tlsls r0, r1, 3\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0810CB5C @ =gUnknown_2036E38\n"
                "\tadds r0, r1\n"
                "\tbl npc_coords_shift_still\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CB60 @ =gUnknown_8453F64\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tmov r3, r10\n"
                "\tadds r0, r2, r3\n"
                "\tldrb r1, [r0]\n"
                "\tlsls r1, 1\n"
                "\tmovs r3, 0x80\n"
                "\tlsls r3, 3\n"
                "\tadds r0, r2, r3\n"
                "\tadds r0, r1\n"
                "\tmov r1, r8\n"
                "\tstrh r1, [r0]\n"
                "\tadds r2, r5\n"
                "\tldrb r0, [r2, 0xC]\n"
                "\tbl sub_810CF90\n"
                "\tldr r1, [r6]\n"
                "\tmov r3, r10\n"
                "\tadds r2, r1, r3\n"
                "\tmovs r3, 0x84\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tldrb r2, [r2]\n"
                "\tadds r1, r2\n"
                "\tstrb r0, [r1]\n"
                "\tldr r1, [r6]\n"
                "\tadd r1, r10\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r6]\n"
                "\tldr r0, _0810CB64 @ =0x00000431\n"
                "\tadds r2, r0\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x4\n"
                "_0810CB14:\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r2]\n"
                "_0810CB18:\n"
                "\tadds r5, 0x10\n"
                "\tmovs r1, 0x1\n"
                "\tadd r9, r1\n"
                "\tldr r4, _0810CB68 @ =gUnknown_203ADB8\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, r5\n"
                "\tldrb r0, [r0, 0x6]\n"
                "\tcmp r0, 0xFF\n"
                "\tbeq _0810CB2C\n"
                "\tb _0810C9DA\n"
                "_0810CB2C:\n"
                "\tldr r2, _0810CB68 @ =gUnknown_203ADB8\n"
                "\tldr r0, [r2]\n"
                "\tldr r3, _0810CB64 @ =0x00000431\n"
                "\tadds r0, r3\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x4\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _0810CB70\n"
                "\tmovs r0, 0x15\n"
                "\tbl PlaySE\n"
                "\tldr r0, _0810CB6C @ =0x00000801\n"
                "\tbl FlagSet\n"
                "\tbl sub_810C640\n"
                "\tmovs r0, 0x2\n"
                "\tb _0810CB7E\n"
                "\t.align 2, 0\n"
                "_0810CB54: .4byte gSaveBlock1Ptr\n"
                "_0810CB58: .4byte 0x0000063a\n"
                "_0810CB5C: .4byte gUnknown_2036E38\n"
                "_0810CB60: .4byte gUnknown_8453F64\n"
                "_0810CB64: .4byte 0x00000431\n"
                "_0810CB68: .4byte gUnknown_203ADB8\n"
                "_0810CB6C: .4byte 0x00000801\n"
                "_0810CB70:\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _0810CB7C\n"
                "\tmovs r0, 0\n"
                "\tb _0810CB7E\n"
                "_0810CB7C:\n"
                "\tmovs r0, 0x1\n"
                "_0810CB7E:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
#endif

void sub_810CB90(void)
{
    u8 sp0 = 0;
    struct MapObjectTemplate *r4 = gSaveBlock1Ptr->mapObjectTemplates;
    int r9 = sub_810CE10(gUnknown_845318C, gTrainerBattleOpponent_A);

    if (r9 != -1)
    {
        int r8;

        for (r8 = 0; r8 < gMapHeader.events->mapObjectCount; r8++)
        {
            if ((r4[r8].unkC == 1 || r4[r8].unkC == 3) && r9 == sub_810CE10(gUnknown_845318C, sub_810D074(r4[r8].script)))
            {
                struct MapObject *r4_2;

                TryGetFieldObjectIdByLocalIdAndMap(r4[r8].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &sp0);
                r4_2 = &gUnknown_2036E38[sp0];
                sub_810CF54(&r4[r8]);
                sub_805FE7C(r4_2, gUnknown_8453F67[r4_2->mapobj_unk_18]);
                gSaveBlock1Ptr->trainerRematches[r4[r8].localId] = 0;
                if (gUnknown_3005074 == sp0)
                    r4_2->animPattern = gUnknown_8453F67[r4_2->mapobj_unk_18];
                else
                    r4_2->animPattern = 0x08;
            }
        }
    }
}

static void sub_810CCA0(const u16 * a0, u8 * a1)
{
    switch (*a1)
    {
        case 0:
            break;
        case 1:
            if (!FlagGet(FLAG_0x292))
                *a1 = sub_810CD14(a0, *a1);
            break;
        case 2:
            if (!FlagGet(FLAG_SYS_NATIONAL_DEX))
                *a1 = sub_810CD14(a0, *a1);
            break;
        case 3:
            if (!FlagGet(FLAG_SYS_CAVE_SHIP))
                *a1 = sub_810CD14(a0, *a1);
            break;
        case 4:
            if (!FlagGet(FLAG_TRAINER_FLAG_START + 0x32c))
                *a1 = sub_810CD14(a0, *a1);
            break;
        case 5:
            if (!FlagGet(FLAG_TRAINER_FLAG_START + 0x344))
                *a1 = sub_810CD14(a0, *a1);
            break;
    }
}

static u8 sub_810CD14(const u16 * a0, u8 a1)
{
    while (--a1 != 0)
    {
        const u16 *r0 = a0 + a1;
        if (*r0 != 0xFFFF)
            return a1;
    }
    return 0;
}

u8 sub_810CD4C(void) // unreferenced, or reference not disassembled
{
    if (sub_810CD80(gUnknown_845318C, gTrainerBattleOpponent_A))
    {
        return 1;
    }
    return sub_810CDB4(gUnknown_845318C, gTrainerBattleOpponent_A);
}

static bool8 sub_810CD80(const struct UnkStruct_845318C *a0, u16 a1)
{
    int r1 = sub_810D084(a0, a1);

    if (r1 == -1)
        return FALSE;
    if (r1 >= 0 && r1 < 0xdd)
    {
        if (sub_810D0A8(gUnknown_20370D2))
            return TRUE;
    }
    return FALSE;
}

static bool8 sub_810CDB4(const struct UnkStruct_845318C *a0, u16 a1)
{
    int r1 = sub_810D084(a0, a1);

    if (r1 == -1)
        return FALSE;
    if (!HasTrainerAlreadyBeenFought(a0[r1].unk_0[0]))
        return FALSE;
    return TRUE;
}

void sub_810CDE8(void)
{
    gSaveBlock1Ptr->trainerRematches[gUnknown_20370D2] = 0;
    sub_80803FC();
}

static int sub_810CE10(const struct UnkStruct_845318C * a0, u16 a1)
{
    u32 r1;
    s32 r3;

    for (r1 = 0; r1 < 0xdd; r1++)
    {
        for (r3 = 0; r3 < 6; r3++)
        {
            u16 r0;
            if (a0[r1].unk_0[r3] == 0)
                break;
            r0 = a0[r1].unk_0[r3];
            if (r0 == 0xFFFF)
                continue;
            if (r0 == a1)
                return r1;
        }
    }

    return -1;
}

int sub_810CE64(u16 a0)
{
    u8 sp0;
    u8 sp1;
    sp1 = sub_810D164(gUnknown_845318C, a0, &sp0);
    if (!sp1)
        return 0;
    sub_810CCA0(gUnknown_845318C[sp0].unk_0, &sp1);
    return gUnknown_845318C[sp0].unk_0[sp1];
}

u8 sub_810CEB4(void) // unreferenced, or reference not disassembled
{
    return sub_810CED0(gUnknown_845318C, gTrainerBattleOpponent_A);
}

static bool8 sub_810CED0(const struct UnkStruct_845318C * a0, u16 a1)
{
    int r1 = sub_810CE10(a0, a1);

    if (r1 == -1)
        return FALSE;
    if ((u32)r1 >= 0xdd)
        return FALSE;
    if (!sub_810D0A8(gUnknown_20370D2))
        return FALSE;
    return TRUE;
}

bool8 sub_810CF04(u8 a0)
{
    struct MapObject *r1 = &gUnknown_2036E38[a0];

    if (r1->active && gMapHeader.events->mapObjectCount >= r1->localId && gSprites[r1->spriteId].data[0] == a0)
        return TRUE;
    return FALSE;
}

u8 sub_810CF54(struct MapObjectTemplate * unused)
{
    u16 r1 = Random() % 4;

    switch (r1)
    {
        case 0:
            return 7;
        case 1:
            return 8;
        case 2:
            return 9;
        case 3:
            return 10;
        default:
            return 8;
    }
}

static u8 sub_810CF90(u8 a0)
{
    switch (a0)
    {
        case 0x11:
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x16:
        case 0x17:
        case 0x18:
        case 0x19:
        case 0x1a:
        case 0x1c:
        case 0x1d:
        case 0x1e:
        case 0x25:
        case 0x27:
        case 0x28:
        case 0x29:
        case 0x2a:
        case 0x2d:
        case 0x2e:
        case 0x36:
        case 0x38:
        case 0x3e:
            return 0x4e;
        case 0x24:
        case 0x2b:
        case 0x2c:
            return 0x4f;
        default:
            return 0x4d;
    }
}

static u16 sub_810D074(const u8 *a0)
{
    u16 retval;

    a0 += 2;
    retval = a0[0];
    retval |= a0[1] << 8;
    return retval;
}

static int sub_810D084(const struct UnkStruct_845318C * a0, u16 a1)
{
    u32 r3;

    for (r3 = 0; r3 < 0xdd; r3++)
    {
        if (a0[r3].unk_0[0] == a1)
            return r3;
    }

    return -1;
}

static bool32 sub_810D0A8(u32 a0)
{
    if (!gSaveBlock1Ptr->trainerRematches[a0])
        return FALSE;
    return TRUE;
}

void sub_810D0D0(void)
{
    u8 i;

    for (i = 0; i < 100; i++)
        gSaveBlock1Ptr->trainerRematches[i] = 0;
}

static bool8 sub_810D0FC(struct VsSeekerSubstruct * a0)
{
    s16 x;
    s16 y;

    PlayerGetDestCoords(&x, &y);
    x -= 7;
    y -= 7;

    if (   x - 7 <= a0->unk_8
        && x + 7 >= a0->unk_8
        && y - 5 <= a0->unk_a
        && y + 5 >= a0->unk_a
        && sub_810CF04(a0->unk_7) == 1)
        return TRUE;
    return FALSE;
}

static u8 sub_810D164(const struct UnkStruct_845318C * a0, u16 a1, u8 * a2)
{
    u32 r4;
    int r5;

    for (r4 = 0; r4 < 0xdd; r4++)
    {
        if (a0[r4].unk_0[0] == a1)
        {
            *a2 = r4;
            for (r5 = 1; r5 < 6; r5++)
            {
                if (a0[r4].unk_0[r5] == 0)
                    return r5 - 1;
                if (a0[r4].unk_0[r5] == 0xffff)
                    continue;
                if (HasTrainerAlreadyBeenFought(a0[r4].unk_0[r5]))
                    continue;
                return r5;
            }
            return r5 - 1;
        }
    }

    *a2 = 0;
    return 0;
}

static u8 sub_810D1CC(void)
{
    u8 sp0;
    u8 r5;

    for (r5 = 0; gUnknown_203ADB8->unk_000[r5].unk_6 != 0xFF; r5++)
    {
        if (sub_810D0FC(&gUnknown_203ADB8->unk_000[r5]) == 1)
        {
            if (HasTrainerAlreadyBeenFought(gUnknown_203ADB8->unk_000[r5].unk_4) != 1 || sub_810D164(gUnknown_845318C, gUnknown_203ADB8->unk_000[r5].unk_4, &sp0))
                return gUnknown_203ADB8->unk_000[r5].unk_6;
        }
    }

    return 0xFF;
}

static void sub_810D24C(struct VsSeekerSubstruct * a0, const u8 * a1)
{
    npc_sync_anim_pause_bits(&gUnknown_2036E38[a0->unk_7]);
    ScriptMovement_StartObjectMovementScript(a0->unk_6, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, a1);
}

static u8 sub_810D280(int a0, u16 a1)
{
    int r5;
    int r3;

    for (r5 = 0; r5 < a0; r5++)
    {
        if (sub_810D0FC(&gUnknown_203ADB8->unk_000[r5]) == 1 && gUnknown_203ADB8->unk_000[r5].unk_4 == a1)
        {
            for (r3 = 0; r3 < gUnknown_203ADB8->unk_430; r3++)
            {
                if (gUnknown_203ADB8->unk_400[r3] == gUnknown_203ADB8->unk_000[r5].unk_4)
                    return 2;
            }
            return 1;
        }
    }
    return 0;
}

static void sub_810D304(void)
{
    u8 sp0 = 0;
    s32 r7;
    s32 r8;

    for (r7 = 0; r7 < gUnknown_203ADB8->unk_430; r7++)
    {
        for (r8 = 0; gUnknown_203ADB8->unk_000[r8].unk_6 != 0xFF; r8++)
        {
            if (gUnknown_203ADB8->unk_000[r8].unk_4 == gUnknown_203ADB8->unk_400[r7])
            {
                struct MapObject *r4 = &gUnknown_2036E38[gUnknown_203ADB8->unk_000[r8].unk_7];
                if (sub_810CF04(gUnknown_203ADB8->unk_000[r8].unk_7) == 1)
                    npc_set_running_behaviour_etc(r4, gUnknown_203ADB8->unk_420[r7]);
                sub_805FE7C(r4, gUnknown_203ADB8->unk_420[r7]);
                gSaveBlock1Ptr->trainerRematches[gUnknown_203ADB8->unk_000[r8].unk_6] = sub_810D164(gUnknown_845318C, gUnknown_203ADB8->unk_000[r8].unk_4, &sp0);
            }
        }
    }
}
