#include "global.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "window.h"
#include "field_specials.h"
#include "task.h"
#include "item.h"
#include "main.h"
#include "sound.h"

// enums
// RAM symbols
// Function Declarations
// Data Definitions


struct ShopData {
	/*0x00*/ void (*callback)(void);
	/*0x04*/ const u16 *itemList;
	/*0x08*/ u32 itemPrice;
	/*0x0C*/ u16 cursorPos;
	/*0x0E*/ u16 _;
	/*0x10*/ u16 itemCount;
	/*0x12*/ u16 field12;
	/*0x14*/ u16 field14;
	/*0x16*/ u16 martType:4;	// 0x1 if tm list
             u16 unk16_4:5;
             u16 unk16_9:7;
	//INCOMPLETE
};

EWRAM_DATA struct ShopData gShopData = {0};
EWRAM_DATA u8 gUnknown_2039950 = 0;

//Function Declarations
static u8 sub_809AB7C(bool32 a0);
static void sub_809AC10(u8 taskId);

// external defines
extern const struct WindowTemplate gUnknown_83DF0BC[];	//sShopMenuWindowTemplates
extern const struct MenuAction gUnknown_83DF09C[];	//sShopMenuActions_BuySellQuit

extern void sub_809AC5C(u8 taskId);
extern void sub_809AC98(u8 taskId);
extern void sub_809ACF8(u8 taskId);

//Data Definitions
static const struct MenuAction sShopMenuActions_BuySellQuit[] =
{
	{gUnknown_8416738, {.void_u8 = sub_809AC5C}},
	{gUnknown_841673C, {.void_u8 = sub_809AC98}},
	{gUnknown_8416741, {.void_u8 = sub_809ACF8}}
    //{ gText_ShopBuy, {.void_u8=Task_HandleShopMenuBuy} },
    //{ gText_ShopSell, {.void_u8=Task_HandleShopMenuSell} },
    //{ gText_ShopQuit, {.void_u8=Task_HandleShopMenuQuit} }
};


// Functions
u8 sub_809AAB0(u8 a0)
{
	gShopData.martType = sub_809AB7C(a0) & 0xF;
	gShopData.cursorPos = 0;
	if (!(ContextNpcGetTextColor()))
		gShopData.unk16_4 = 4;
	else
		gShopData.unk16_4 = 5;
	
	gUnknown_2039950 = AddWindow(gUnknown_83DF0BC);		//sShop
	SetStdWindowBorderStyle(gUnknown_2039950, 0);
	PrintTextArray(gUnknown_2039950, 2, GetMenuCursorDimensionByFont(2, 0), 2, 16, 3, gUnknown_83DF09C);
	Menu_InitCursor(gUnknown_2039950, 2, 0, 2, 16, 3, 0);
	PutWindowTilemap(gUnknown_2039950);
	CopyWindowToVram(gUnknown_2039950, 1);
	return CreateTask(sub_809AC10, 8);
}

static u8 sub_809AB7C(u32 a0)
{	
	u16 retVal, i;
	if (a0)
        return (u8)a0;
    goto MAIN;
    RETURN_1:
    return 1;

	MAIN:
    i = 0;
    if (i >= gShopData.itemCount)
        goto RETURN_0;
    else if (gShopData.itemList[0] == 0)
        goto RETURN_0;

    while (gShopData.itemList[i] != 0)
    {
        if (ItemId_GetPocket(gShopData.itemList[i]) == POCKET_TM_CASE)
            goto RETURN_1;
        ++i;
        if (i >= gShopData.itemCount)
            goto RETURN_0;
        else if (gShopData.itemList[i] == 0)
            goto RETURN_0;
    }
    RETURN_0:
    return 0;
}

/*
void (const u16 *list)	//SetShopItemsForSale
{
	u16 i;
	gShopData.itemList = list;
	gShopData.itemCount = 0;
	if (list[0] == 0)
		return;
	
	i = 0;
	while (list[i] != 0)
	{
		gShopData.itemCount++;
		if (list[i] == 0)
			return;
		i++;
	}
}
*/

//#ifdef NONMATCHING
// WHAT THE FUCK IS UP WITH THIS FUNCTION
void sub_809ABD8(const u16 *items)
{    
    //const u16* mart = items;
    u16 item;
    gShopData.itemList = items;
    gShopData.itemCount = 0;
	
	while (1)
	{
		item = items[++gShopData.itemCount];
	}
}
/*
#else
NAKED
void sub_809ABD8(const u16 *items)
	asm_unified("\t
*/

//SetShopMenuCallback
void sub_809AC04(MainCallback callback)
{
	gShopData.callback = callback;
}

//Task_ShopMenu
static void sub_809AC10(u8 taskId)
{
	s8 a0 = Menu_ProcessInputNoWrapAround();
	if (a0 == -2)
		return;
	
	if (a0 == -1)
	{
		PlaySE(5);
		sub_809ACF8(taskId);
		return;
	}
	gUnknown_83DF09C.func.void_u8(Menu_GetCursorPos());
}

