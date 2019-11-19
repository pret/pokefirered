#include "global.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "window.h"
#include "field_specials.h"
#include "task.h"



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
			 u16 unk16_1:5;
			 u16 unk16_2:7;
	//INCOMPLETE
};


// external defines
extern const struct WindowTemplate gUnknown_83DF0BC[];	//sShopMenuWindowTemplates
extern const struct MenuAction gUnknown_83DF09C[];	//sShopMenuActions_BuySellQuit

extern u8 sub_809AB7C(u8 a);
extern void sub_809AC10(u8 taskId);

EWRAM_DATA struct ShopData gShopData = {0};
EWRAM_DATA u8 gUnknown_2039950 = 0;



u8 sub_809AAB0(u8 a0)
{
	u32 v1, v2;
	
	//gShopData.martType = (sub_809AB7C(a0) & 0xF) | ((u8) gShopData.martType & 0xF0);
	gShopData.martType = sub_809AB7C(a0);
	gShopData.cursorPos = 0;
	if (!(ContextNpcGetTextColor()))
	{
		v1 = (u16) gShopData.unk16_1;
		v1 = ~(0x1F0);
		//v1 = (s16) gShopData.unk16_1 & 0xFFFFFE0F;
		//v1 = gShopData.unk16_1 & (u32) 0xFFFFFE0F;
		//v1 &= 0xFE0F;
		v2 = 0x40;
	}
	else
	{
		v1 = (u16) gShopData.unk16_1;
		v1 = ~(0x1F0);
		v2 = 0x50;
	}
	gShopData.martType = v1 | v2;
	gUnknown_2039950 = AddWindow(gUnknown_83DF0BC);		//sShop
	SetStdWindowBorderStyle(gUnknown_2039950, 0);
	PrintTextArray(gUnknown_2039950, 2, GetMenuCursorDimensionByFont(2, 0), 2, 16, 3, gUnknown_83DF09C);
	Menu_InitCursor(gUnknown_2039950, 2, 0, 2, 16, 3, 0);
	PutWindowTilemap(gUnknown_2039950);
	CopyWindowToVram(gUnknown_2039950, 1);
	return CreateTask(sub_809AC10, 8);
}
