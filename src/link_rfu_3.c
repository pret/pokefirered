#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "event_data.h"
#include "link.h"
#include "link_rfu.h"
#include "random.h"

static EWRAM_DATA u8 gWirelessStatusIndicatorSpriteId = 0;

static const u16 gWirelessLinkIconPalette[] = INCBIN_U16("graphics/interface/wireless_link_icon.gbapal");

static const u32 gWirelessLinkIconPic[] = INCBIN_U32("graphics/interface/wireless_link_icon.4bpp.lz");

static const u8 sWireless_ASCIItoRSETable[] = {
    0xff, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x37,
    0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
    0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
    0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
    0x00, 0xab, 0xb5, 0xb6, 0xb1, 0x00, 0x00, 0x00,
    0x00, 0x00, 0xb2, 0xf1, 0x00, 0xae, 0xad, 0xba,
    0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8,
    0xa9, 0xaa, 0x00, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f,
    0x00, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf, 0xc0, 0xc1,
    0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9,
    0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xd0, 0xd1,
    0xd2, 0xd3, 0xd4, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6,
    0x00, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0xdb,
    0xdc, 0xdd, 0xde, 0xdf, 0xe0, 0xe1, 0xe2, 0xe3,
    0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0xeb,
    0xec, 0xed, 0xee, 0x2d, 0x2f, 0x30, 0x31, 0x32,
    0x33, 0x34, 0x35, 0x36, 0x50, 0x00, 0x01, 0x02,
    0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a,
    0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12,
    0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a,
    0x1b, 0xad, 0xb3, 0xb4, 0x00, 0xaf, 0x7d, 0x7f,
    0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0xa0,
    0xae, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
    0x58, 0x59, 0x5a, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f,
    0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
    0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f,
    0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77,
    0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7e, 0xb0, 0xac,
    0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23,
    0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b,
    0x2c, 0x2e, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c,
    0x8d, 0x8e, 0x8f, 0x90, 0x91, 0x92, 0x93, 0x94
};

static const u8 sWireless_RSEtoASCIITable[] = {
    0x20, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c,
    0x8d, 0x8e, 0x8f, 0x90, 0x91, 0x92, 0x93, 0x94,
    0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b, 0x9c,
    0x9d, 0x9e, 0x9f, 0xa0, 0xe0, 0xe1, 0xe2, 0xe3,
    0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0xeb,
    0xec, 0xed, 0xee, 0xef, 0xf0, 0x7b, 0xf1, 0x7c,
    0x7d, 0x7e, 0x7f, 0x80, 0x81, 0x82, 0x83, 0x07,
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
    0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f,
    0x84, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6, 0xb7,
    0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf,
    0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7,
    0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf,
    0xd0, 0xd1, 0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xd7,
    0xd8, 0xd9, 0xda, 0xdb, 0xdc, 0xa6, 0xdd, 0xa7,
    0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xf2,
    0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa,
    0xfb, 0xfc, 0xfd, 0xfe, 0xff, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x06, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
    0xaf, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36,
    0x37, 0x38, 0x39, 0x21, 0xdf, 0xa1, 0xb0, 0xa5,
    0xde, 0x24, 0x2a, 0xa2, 0xa3, 0x22, 0x23, 0x20,
    0xa4, 0x20, 0x2f, 0x41, 0x42, 0x43, 0x44, 0x45,
    0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d,
    0x4e, 0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55,
    0x56, 0x57, 0x58, 0x59, 0x5a, 0x61, 0x62, 0x63,
    0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b,
    0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73,
    0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x20,
    0x20, 0x2b, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f, 0x20,
    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00
};

static const struct OamData sWirelessStatusIndicatorOamData =
    {
        .y = 0,
        .affineMode = ST_OAM_AFFINE_OFF,
        .objMode = ST_OAM_OBJ_NORMAL,
        .bpp = ST_OAM_4BPP,
        .shape = SPRITE_SHAPE(16x16),
        .x = 0,
        .size = SPRITE_SIZE(16x16),
        .tileNum = 0,
        .priority = 0,
        .paletteNum = 0,
    };

static const union AnimCmd sWirelessStatusIndicatorAnim0[] = {
    // 3 bars
    ANIMCMD_FRAME( 4,  5),
    ANIMCMD_FRAME( 8,  5),
    ANIMCMD_FRAME(12,  5),
    ANIMCMD_FRAME(16, 10),
    ANIMCMD_FRAME(12,  5),
    ANIMCMD_FRAME( 8,  5),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sWirelessStatusIndicatorAnim1[] = {
    // 2 bars
    ANIMCMD_FRAME( 4,  5),
    ANIMCMD_FRAME( 8,  5),
    ANIMCMD_FRAME(12, 10),
    ANIMCMD_FRAME( 8,  5),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sWirelessStatusIndicatorAnim2[] = {
    // 1 bar
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sWirelessStatusIndicatorAnim3[] = {
    // searching
    ANIMCMD_FRAME( 4, 10),
    ANIMCMD_FRAME(20, 10),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sWirelessStatusIndicatorAnim4[] = {
    // error
    ANIMCMD_FRAME(24, 10),
    ANIMCMD_FRAME( 4, 10),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sWirelessStatusIndicatorAnims[] = {
    sWirelessStatusIndicatorAnim0,
    sWirelessStatusIndicatorAnim1,
    sWirelessStatusIndicatorAnim2,
    sWirelessStatusIndicatorAnim3,
    sWirelessStatusIndicatorAnim4
};

static const struct CompressedSpriteSheet sWirelessStatusIndicatorSpriteSheet = {
    gWirelessLinkIconPic, 0x0380, 0xD431
};

static const struct SpritePalette sWirelessStatusIndicatorSpritePalette = {
    gWirelessLinkIconPalette, 0xD432
};

static const struct SpriteTemplate sWirelessStatusIndicatorSpriteTemplate = {
    0xD431,
    0xD432,
    &sWirelessStatusIndicatorOamData,
    sWirelessStatusIndicatorAnims,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

void RFU_queue_20_70_reset(struct UnkRfuStruct_2_Sub_124 *queue)
{
    s32 i;
    s32 j;

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 70; j++)
        {
            queue->slots[i][j] = 0;
        }
    }
    queue->send_slot = 0;
    queue->recv_slot = 0;
    queue->count = 0;
    queue->full = 0;
}

void RFU_queue_40_14_reset(struct RfuSendQueue *ptr)
{
    s32 i;
    s32 j;

    for (i = 0; i < 40; i++)
    {
        for (j = 0; j < 14; j++)
        {
            ptr->slots[i][j] = 0;
        }
    }
    ptr->send_slot = 0;
    ptr->recv_slot = 0;
    ptr->count = 0;
    ptr->full = 0;
}

static void RFU_queue_2_256_reset(struct UnkRfuStruct_Sub_Unused *ptr)
{
    s32 i;
    s32 j;

    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < 256; j++)
        {
            ptr->slots[i][j] = 0;
        }
    }
    ptr->send_slot = 0;
    ptr->recv_slot = 0;
    ptr->count = 0;
    ptr->full = 0;
}

void RFU_queue_20_70_recv(struct UnkRfuStruct_2_Sub_124 *queue, u8 *data)
{
    s32 i;
    u16 imeBak;
    u8 count;

    if (queue->count < 20)
    {
        imeBak = REG_IME;
        REG_IME = 0;
        count = 0;
        for (i = 0; i < 70; i += 14)
        {
            if (data[i] == 0 && data[i + 1] == 0)
            {
                count++;
            }
        }
        if (count != 5)
        {
            for (i = 0; i < 70; i++)
            {
                queue->slots[queue->recv_slot][i] = data[i];
            }
            queue->recv_slot++;
            queue->recv_slot %= 20;
            queue->count++;
            for (i = 0; i < 70; i++)
            {
                data[i] = 0;
            }
        }
        REG_IME = imeBak;
    }
    else
    {
        queue->full = 1;
    }
}

void RFU_queue_40_14_recv(struct RfuSendQueue *queue, u8 *data)
{
    s32 i;
    u16 imeBak;

    if (queue->count < 40)
    {
        imeBak = REG_IME;
        REG_IME = 0;
        for (i = 0; i < 14; i++)
        {
            if (data[i] != 0)
            {
                break;
            }
        }
        if (i != 14)
        {
            for (i = 0; i < 14; i++)
            {
                queue->slots[queue->recv_slot][i] = data[i];
            }
            queue->recv_slot++;
            queue->recv_slot %= 40;
            queue->count++;
            for (i = 0; i < 14; i++)
            {
                data[i] = 0;
            }
        }
        REG_IME = imeBak;
    }
    else
    {
        queue->full = 1;
    }
}

bool8 RFU_queue_20_70_send(struct UnkRfuStruct_2_Sub_124 *queue, u8 *dest)
{
    u16 imeBak;
    s32 i;

    imeBak = REG_IME;
    REG_IME = 0;
    if (queue->recv_slot == queue->send_slot || queue->full)
    {
        for (i = 0; i < 70; i++)
        {
            dest[i] = 0;
        }
        REG_IME = imeBak;
        return FALSE;
    }
    for (i = 0; i < 70; i++)
    {
        dest[i] = queue->slots[queue->send_slot][i];
    }
    queue->send_slot++;
    queue->send_slot %= 20;
    queue->count--;
    REG_IME = imeBak;
    return TRUE;
}

bool8 RFU_queue_40_14_send(struct RfuSendQueue *queue, u8 *dest)
{
    s32 i;
    u16 imeBak;

    if (queue->recv_slot == queue->send_slot || queue->full != 0)
    {
        return FALSE;
    }
    imeBak = REG_IME;
    REG_IME = 0;
    for (i = 0; i < 14; i++)
    {
        dest[i] = queue->slots[queue->send_slot][i];
    }
    queue->send_slot++;
    queue->send_slot %= 40;
    queue->count--;
    REG_IME = imeBak;
    return TRUE;
}

void RFU_queue_2_14_recv(struct UnkRfuStruct_2_Sub_c1c *queue, const u8 *data)
{
    s32 i;

    if (data[1] == 0)
    {
        RFU_queue_2_14_send(queue, NULL);
    }
    else
    {
        for (i = 0; i < 14; i++)
        {
            queue->slots[queue->recv_slot][i] = data[i];
        }
        queue->recv_slot++;
        queue->recv_slot %= 2;
        if (queue->count < 2)
        {
            queue->count++;
        }
        else
        {
            queue->send_slot = queue->recv_slot;
        }
    }
}

bool8 RFU_queue_2_14_send(struct UnkRfuStruct_2_Sub_c1c *queue, u8 *dest)
{
    s32 i;

    if (queue->count == 0)
    {
        return FALSE;
    }
    if (dest != NULL)
    {
        for (i = 0; i < 14; i++)
        {
            dest[i] = queue->slots[queue->send_slot][i];
        }
    }
    queue->send_slot++;
    queue->send_slot %= 2;
    queue->count--;
    return TRUE;
}

static void RFU_queue_2_256_recv(struct UnkRfuStruct_Sub_Unused *queue, u8 *data)
{
    s32 i;

    if (queue->count < 2)
    {
        for (i = 0; i < 256; i++)
        {
            queue->slots[queue->recv_slot][i] = data[i];
        }
        queue->recv_slot++;
        queue->recv_slot %= 2;
        queue->count++;
    }
    else
    {
        queue->full = 1;
    }
}

static bool8 RFU_queue_2_256_send(struct UnkRfuStruct_Sub_Unused *queue, u8 *send)
{
    s32 i;

    if (queue->recv_slot == queue->send_slot || queue->full)
    {
        return FALSE;
    }
    for (i = 0; i < 256; i++)
    {
        send[i] = queue->slots[queue->send_slot][i];
    }
    queue->send_slot++;
    queue->send_slot %= 2;
    queue->count--;
    return TRUE;
}

static void sub_80FC9B8(u8 *q1, u8 mode)
{
    s32 i;
    u8 rval;
    u16 r5 = 0;
    static u8 counter;

    switch (mode)
    {
        case 0:
            for (i = 0; i < 200; i++)
            {
                q1[i] = i + 1;
                r5 += i + 1;
            }
            *((u16 *)(q1 + i)) = r5;
            break;
        case 1:
            for (i = 0; i < 100; i++)
            {
                q1[i] = i + 1;
                r5 += i + 1;
            }
            *((u16 *)(q1 + 200)) = r5;
            break;
        case 2:
            for (i = 0; i < 200; i++)
            {
                rval = Random();
                q1[i] = rval;
                r5 += rval;
            }
            *((u16 *)(q1 + i)) = r5;
            break;
        case 3:
            for (i = 0; i < 200; i++)
            {
                q1[i] = i + 1 + counter;
                r5 += (i + 1 + counter) & 0xFF;
            }
            *((u16 *)(q1 + i)) = r5;
            counter++;
            break;
    }
}

static void PkmnStrToASCII(u8 *q1, const u8 *q2)
{
    s32 i;

    for (i = 0; q2[i] != EOS; i++)
    {
        q1[i] = sWireless_RSEtoASCIITable[q2[i]];
    }
    q1[i] = 0;
}

static void ASCIIToPkmnStr(u8 *q1, const u8 *q2)
{
    s32 i;

    for (i = 0; q2[i] != 0; i++)
    {
        q1[i] = sWireless_ASCIItoRSETable[q2[i]];
    }
    q1[i] = EOS;
}

static u8 GetConnectedChildStrength(u8 maxFlags)
{
    u8 flagCount = 0;
    u8 flags = gRfuLinkStatus->connSlotFlag;
    u8 i;

    if (gRfuLinkStatus->parentChild == MODE_PARENT)
    {
        for (i = 0; i < 4; i++)
        {
            if (flags & 1)
            {
                if (maxFlags == flagCount + 1)
                {
                    return gRfuLinkStatus->strength[i];
                    break; // This break is needed to match
                }
                flagCount++;
            }
            flags >>= 1;
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (flags & 1)
                return gRfuLinkStatus->strength[i];
            flags >>= 1;
        }
    }
    return 0;
}

void InitHostRFUtgtGname(struct GFtgtGname *data, u8 activity, bool32 started, s32 child_sprite_genders)
{
    s32 i;

    for (i = 0; i < 2; i++)
    {
        data->unk_00.playerTrainerId[i] = gSaveBlock2Ptr->playerTrainerId[i];
    }
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        data->child_sprite_gender[i] = child_sprite_genders;
        child_sprite_genders >>= 8;
    }
    data->playerGender = gSaveBlock2Ptr->playerGender;
    data->activity = activity;
    data->started = started;
    data->unk_00.language = GAME_LANGUAGE;
    data->unk_00.version = GAME_VERSION;
    data->unk_00.hasNews = FALSE;
    data->unk_00.hasCard = FALSE;
    data->unk_00.unk_00_6 = 0;
    data->unk_00.isChampion = FlagGet(FLAG_SYS_CAN_LINK_WITH_RS);
    data->unk_00.hasNationalDex = IsNationalPokedexEnabled();
    data->unk_00.gameClear = FlagGet(FLAG_SYS_GAME_CLEAR);
}

/*
 * ==========================================================
 * Returns 1 if parent, 0 if child or neutral.
 * If partner serial number is valid, copies gname and uname.
 * Otherwise, blanks these.
 * ==========================================================
 */
bool8 LinkRfu_GetNameIfCompatible(struct GFtgtGname *gname, u8 *uname, u8 idx)
{
    bool8 retVal;

    if (lman.parent_child == MODE_PARENT)
    {
        retVal = TRUE;
        if (RfuSerialNumberIsValid(gRfuLinkStatus->partner[idx].serialNo) && ((gRfuLinkStatus->getNameFlag >> idx) & 1))
        {
            memcpy(gname, &gRfuLinkStatus->partner[idx].gname, RFU_GAME_NAME_LENGTH);
            memcpy(uname, gRfuLinkStatus->partner[idx].uname, RFU_USER_NAME_LENGTH);
        }
        else
        {
            memset(gname, 0, RFU_GAME_NAME_LENGTH);
            memset(uname, 0, RFU_USER_NAME_LENGTH);
        }
    }
    else
    {
        retVal = FALSE;
        if (RfuSerialNumberIsValid(gRfuLinkStatus->partner[idx].serialNo))
        {
            memcpy(gname, &gRfuLinkStatus->partner[idx].gname, RFU_GAME_NAME_LENGTH);
            memcpy(uname, gRfuLinkStatus->partner[idx].uname, RFU_USER_NAME_LENGTH);
        }
        else
        {
            memset(gname, 0, RFU_GAME_NAME_LENGTH);
            memset(uname, 0, RFU_USER_NAME_LENGTH);
        }
    }
    return retVal;
}

/*
 * ==========================================================
 * Specific check for serial number 0x7F7D,
 * which comes from ???
 * ==========================================================
 */
bool8 LinkRfu_GetNameIfSerial7F7D(struct GFtgtGname *gname, u8 *uname, u8 idx)
{
    bool8 retVal = FALSE;
    if (gRfuLinkStatus->partner[idx].serialNo == 0x7F7D)
    {
        memcpy(gname, gRfuLinkStatus->partner[idx].gname, RFU_GAME_NAME_LENGTH);
        memcpy(uname, gRfuLinkStatus->partner[idx].uname, RFU_USER_NAME_LENGTH);
        retVal = TRUE;
    }
    else
    {
        memset(gname, 0, RFU_GAME_NAME_LENGTH);
        memset(uname, 0, RFU_USER_NAME_LENGTH);
    }
    return retVal;
}

void LinkRfu3_SetGnameUnameFromStaticBuffers(struct GFtgtGname *gname, u8 *uname)
{
    memcpy(gname, &gHostRFUtgtGnameBuffer, RFU_GAME_NAME_LENGTH);
    memcpy(uname, gHostRFUtgtUnameBuffer, RFU_USER_NAME_LENGTH);
}

void CreateWirelessStatusIndicatorSprite(u8 x, u8 y)
{
    u8 sprId;

    if (x == 0 && y == 0)
    {
        x = 0xE7;
        y = 0x08;
    }
    if (gRfuLinkStatus->parentChild == MODE_PARENT)
    {
        sprId = CreateSprite(&sWirelessStatusIndicatorSpriteTemplate, x, y, 0);
        gSprites[sprId].data[7] = 0x1234;
        gSprites[sprId].data[6] = GetSpriteTileStartByTag(sWirelessStatusIndicatorSpriteSheet.tag);
        gSprites[sprId].invisible = TRUE;
        gWirelessStatusIndicatorSpriteId = sprId;
    }
    else
    {
        gWirelessStatusIndicatorSpriteId = CreateSprite(&sWirelessStatusIndicatorSpriteTemplate, x, y, 0);
        gSprites[gWirelessStatusIndicatorSpriteId].data[7] = 0x1234;
        gSprites[gWirelessStatusIndicatorSpriteId].data[6] = GetSpriteTileStartByTag(sWirelessStatusIndicatorSpriteSheet.tag);
        gSprites[gWirelessStatusIndicatorSpriteId].invisible = TRUE;
    }
}

void DestroyWirelessStatusIndicatorSprite(void)
{
    if (gSprites[gWirelessStatusIndicatorSpriteId].data[7] == 0x1234)
    {
        gSprites[gWirelessStatusIndicatorSpriteId].data[7] = 0;
        DestroySprite(&gSprites[gWirelessStatusIndicatorSpriteId]);
        gMain.oamBuffer[125] = gDummyOamData;
        CpuCopy16(&gDummyOamData, (struct OamData *)OAM + 125, sizeof(struct OamData));
    }
}

void LoadWirelessStatusIndicatorSpriteGfx(void)
{
    if (GetSpriteTileStartByTag(sWirelessStatusIndicatorSpriteSheet.tag) == 0xFFFF)
    {
        LoadCompressedSpriteSheet(&sWirelessStatusIndicatorSpriteSheet);
    }
    LoadSpritePalette(&sWirelessStatusIndicatorSpritePalette);
    gWirelessStatusIndicatorSpriteId = 0xFF;
}

static u8 GetParentSignalStrength(void)
{
    u8 i;
    u8 flags = gRfuLinkStatus->connSlotFlag;
    for (i = 0; i < RFU_CHILD_MAX; i++)
    {
        if (flags & 1)
        {
            return gRfuLinkStatus->strength[i];
        }
        flags >>= 1;
    }
    return 0;
}

static void SetAndRestartWirelessStatusIndicatorAnim(struct Sprite *sprite, s32 signalStrengthAnimNum)
{
    if (sprite->data[2] != signalStrengthAnimNum)
    {
        sprite->data[2] = signalStrengthAnimNum;
        sprite->data[3] = 0;
        sprite->data[4] = 0;
    }
}

void UpdateWirelessStatusIndicatorSprite(void)
{
    if (gWirelessStatusIndicatorSpriteId != 0xFF && gSprites[gWirelessStatusIndicatorSpriteId].data[7] == 0x1234)
    {
        struct Sprite *sprite = &gSprites[gWirelessStatusIndicatorSpriteId];
        u8 signalStrength = RFU_LINK_ICON_LEVEL4_MAX;
        u8 i = 0;
        if (gRfuLinkStatus->parentChild == MODE_PARENT)
        {
            for (i = 0; i < GetLinkPlayerCount() - 1; i++)
            {
                if (signalStrength >= GetConnectedChildStrength(i + 1))
                {
                    signalStrength = GetConnectedChildStrength(i + 1);
                }
            }
        }
        else
        {
            signalStrength = GetParentSignalStrength();
        }
        if (sub_80FC1B0() == TRUE)
        {
            sprite->data[0] = 4;
        }
        else if (signalStrength <= RFU_LINK_ICON_LEVEL1_MAX)
        {
            sprite->data[0] = 3;
        }
        else if (signalStrength >= RFU_LINK_ICON_LEVEL2_MIN && signalStrength <= RFU_LINK_ICON_LEVEL2_MAX)
        {
            sprite->data[0] = 2;
        }
        else if (signalStrength >= RFU_LINK_ICON_LEVEL3_MIN && signalStrength <= RFU_LINK_ICON_LEVEL3_MAX)
        {
            sprite->data[0] = 1;
        }
        else if (signalStrength >= RFU_LINK_ICON_LEVEL4_MIN)
        {
            sprite->data[0] = 0;
        }
        if (sprite->data[0] != sprite->data[1])
        {
            SetAndRestartWirelessStatusIndicatorAnim(sprite, sprite->data[0]);
            sprite->data[1] = sprite->data[0];
        }
        if (sprite->anims[sprite->data[2]][sprite->data[4]].frame.duration < sprite->data[3])
        {
            sprite->data[4]++;
            sprite->data[3] = 0;
            if (sprite->anims[sprite->data[2]][sprite->data[4]].type == -2)
            {
                sprite->data[4] = 0;
            }
        }
        else
        {
            sprite->data[3]++;
        }
        gMain.oamBuffer[125] = sWirelessStatusIndicatorOamData;
        gMain.oamBuffer[125].x = sprite->pos1.x + sprite->centerToCornerVecX;
        gMain.oamBuffer[125].y = sprite->pos1.y + sprite->centerToCornerVecY;
        gMain.oamBuffer[125].paletteNum = sprite->oam.paletteNum;
        gMain.oamBuffer[125].tileNum = sprite->data[6] + sprite->anims[sprite->data[2]][sprite->data[4]].frame.imageValue;
        CpuCopy16(gMain.oamBuffer + 125, (struct OamData *)OAM + 125, sizeof(struct OamData));
        if (RfuGetErrorStatus() == 1)
        {
            DestroyWirelessStatusIndicatorSprite();
        }
    }
}

static void CopyTrainerRecord(struct TrainerNameRecord *dest, u32 trainerId, const u8 *name)
{
    int i;
    dest->trainerId = trainerId;
    for (i = 0; i < 7; i++)
    {
        if (name[i] == EOS)
            break;
        dest->trainerName[i] = name[i];
    }
    dest->trainerName[i] = EOS;
}

static void ZeroName(u8 *name)
{
    s32 i;

    for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++)
    {
        *name++ = 0;
    }
}

static bool32 NameIsEmpty(const u8 *name)
{
    s32 i;

    for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++)
    {
        if (*name++ != 0)
        {
            return FALSE;
        }
    }
    return TRUE;
}

// Save the currently connected players into the trainer records, shifting all previous records down.
void RecordMixTrainerNames(void)
{
    if (gWirelessCommType != 0)
    {
        s32 i;
        s32 j;
        s32 nextSpace;
        s32 connectedTrainerRecordIndices[5];
        struct TrainerNameRecord *newRecords = AllocZeroed(20 * sizeof(struct TrainerNameRecord));

        // Check if we already have a record saved for connected trainers.
        for (i = 0; i < GetLinkPlayerCount(); i++)
        {
            connectedTrainerRecordIndices[i] = -1;
            for (j = 0; j < 20; j++)
            {
                if ((u16)gLinkPlayers[i].trainerId ==  gSaveBlock1Ptr->trainerNameRecords[j].trainerId && StringCompare(gLinkPlayers[i].name, gSaveBlock1Ptr->trainerNameRecords[j].trainerName) == 0)
                {
                    connectedTrainerRecordIndices[i] = j;
                }
            }
        }

        // Save the connected trainers first, at the top of the list.
        nextSpace = 0;
        for (i = 0; i < GetLinkPlayerCount(); i++)
        {
            if (i != GetMultiplayerId() && gLinkPlayers[i].language != LANGUAGE_JAPANESE)
            {
                CopyTrainerRecord(&newRecords[nextSpace], (u16)gLinkPlayers[i].trainerId, gLinkPlayers[i].name);

                // If we already had a record for this trainer, wipe it so that the next step doesn't duplicate it.
                if (connectedTrainerRecordIndices[i] >= 0)
                {
                    ZeroName(gSaveBlock1Ptr->trainerNameRecords[connectedTrainerRecordIndices[i]].trainerName);
                }
                nextSpace++;
            }
        }

        // Copy all non-empty records to the new list, in the order they appear on the old list. If the list is full,
        // the last (oldest) records will be dropped.
        for (i = 0; i < 20; i++)
        {
            if (!NameIsEmpty(gSaveBlock1Ptr->trainerNameRecords[i].trainerName))
            {
                CopyTrainerRecord(&newRecords[nextSpace], gSaveBlock1Ptr->trainerNameRecords[i].trainerId, gSaveBlock1Ptr->trainerNameRecords[i].trainerName);
                if (++nextSpace >= 20)
                {
                    break;
                }
            }
        }

        // Finalize the new list, and clean up.
        memcpy(gSaveBlock1Ptr->trainerNameRecords, newRecords, 20 * sizeof(struct TrainerNameRecord));
        Free(newRecords);
    }
}

bool32 PlayerHasMetTrainerBefore(u16 id, u8 *name)
{
    s32 i;

    for (i = 0; i < 20; i++)
    {
        if (StringCompareN(gSaveBlock1Ptr->trainerNameRecords[i].trainerName, name, 7) == 0 && gSaveBlock1Ptr->trainerNameRecords[i].trainerId == id)
        {
            return TRUE;
        }
        if (NameIsEmpty(gSaveBlock1Ptr->trainerNameRecords[i].trainerName))
        {
            return FALSE;
        }
    }
    return FALSE;
}
