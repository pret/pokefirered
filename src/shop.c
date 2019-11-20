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

EWRAM_DATA struct ShopData gShopData = {0};
EWRAM_DATA u8 gUnknown_2039950 = 0;

//Functions
static u8 sub_809AB7C(u8 a0);


// external defines
extern const struct WindowTemplate gUnknown_83DF0BC[];	//sShopMenuWindowTemplates
extern const struct MenuAction gUnknown_83DF09C[];	//sShopMenuActions_BuySellQuit

extern u8 sub_809AB7C(u8 a);
extern void sub_809AC10(u8 taskId);






#ifdef NONMATCHING
u8 sub_809AAB0(u8 a0)
{
	u32 v1, v2;
	u8* v3;

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
	gShopData.martType = (u16) (v1 | v2);
	
	gUnknown_2039950 = AddWindow(gUnknown_83DF0BC);		//sShop
	SetStdWindowBorderStyle(gUnknown_2039950, 0);
	PrintTextArray(gUnknown_2039950, 2, GetMenuCursorDimensionByFont(2, 0), 2, 16, 3, gUnknown_83DF09C);
	Menu_InitCursor(gUnknown_2039950, 2, 0, 2, 16, 3, 0);
	PutWindowTilemap(gUnknown_2039950);
	CopyWindowToVram(gUnknown_2039950, 1);
	return CreateTask(sub_809AC10, 8);
}
#else
NAKED
u8 sub_809AAB0(u8 a0)
{
	asm_unified("\tpush {r4-r6,lr}\n"
				"\tsub sp, 0xC\n"
				"\tlsls r0, 24\n"
				"\tlsrs r0, 24\n"
				"\tbl sub_809AB7C\n"
				"\tldr r4, _0809AAE8 @ =gUnknown_2039934\n"
				"\tmovs r1, 0xF\n"
				"\tands r1, r0\n"
				"\tldrb r2, [r4, 0x16]\n"
				"\tmovs r0, 0x10\n"
				"\tnegs r0, r0\n"
				"\tands r0, r2\n"
				"\torrs r0, r1\n"
				"\tstrb r0, [r4, 0x16]\n"
				"\tmovs r0, 0\n"
				"\tstrh r0, [r4, 0xC]\n"
				"\tbl ContextNpcGetTextColor\n"
				"\tlsls r0, 24\n"
				"\tcmp r0, 0\n"
				"\tbne _0809AAF0\n"
				"\tldrh r0, [r4, 0x16]\n"
				"\tldr r1, _0809AAEC @ =0xfffffe0f\n"
				"\tands r1, r0\n"
				"\tmovs r0, 0x40\n"
				"\tb _0809AAF8\n"
				"\t.align 2, 0\n"
				"_0809AAE8: .4byte gUnknown_2039934\n"
				"_0809AAEC: .4byte 0xfffffe0f\n"
				"_0809AAF0:\n"
				"\tldrh r0, [r4, 0x16]\n"
				"\tldr r1, _0809AB68 @ =0xfffffe0f\n"
				"\tands r1, r0\n"
				"\tmovs r0, 0x50\n"
				"_0809AAF8:\n"
				"\torrs r1, r0\n"
				"\tstrh r1, [r4, 0x16]\n"
				"\tldr r4, _0809AB6C @ =gUnknown_2039950\n"
				"\tldr r0, _0809AB70 @ =gUnknown_83DF0BC\n"
				"\tbl AddWindow\n"
				"\tstrb r0, [r4]\n"
				"\tldrb r0, [r4]\n"
				"\tmovs r1, 0\n"
				"\tbl SetStdWindowBorderStyle\n"
				"\tmovs r0, 0x2\n"
				"\tmovs r1, 0\n"
				"\tbl GetMenuCursorDimensionByFont\n"
				"\tadds r2, r0, 0\n"
				"\tlsls r2, 24\n"
				"\tlsrs r2, 24\n"
				"\tldrb r0, [r4]\n"
				"\tmovs r6, 0x10\n"
				"\tstr r6, [sp]\n"
				"\tmovs r5, 0x3\n"
				"\tstr r5, [sp, 0x4]\n"
				"\tldr r1, _0809AB74 @ =gUnknown_83DF09C\n"
				"\tstr r1, [sp, 0x8]\n"
				"\tmovs r1, 0x2\n"
				"\tmovs r3, 0x2\n"
				"\tbl PrintTextArray\n"
				"\tldrb r0, [r4]\n"
				"\tstr r6, [sp]\n"
				"\tstr r5, [sp, 0x4]\n"
				"\tmovs r1, 0\n"
				"\tstr r1, [sp, 0x8]\n"
				"\tmovs r1, 0x2\n"
				"\tmovs r2, 0\n"
				"\tmovs r3, 0x2\n"
				"\tbl Menu_InitCursor\n"
				"\tldrb r0, [r4]\n"
				"\tbl PutWindowTilemap\n"
				"\tldrb r0, [r4]\n"
				"\tmovs r1, 0x1\n"
				"\tbl CopyWindowToVram\n"
				"\tldr r0, _0809AB78 @ =sub_809AC10\n"
				"\tmovs r1, 0x8\n"
				"\tbl CreateTask\n"
				"\tlsls r0, 24\n"
				"\tlsrs r0, 24\n"
				"\tadd sp, 0xC\n"
				"\tpop {r4-r6}\n"
				"\tpop {r1}\n"
				"\tbx r1\n"
				"\t.align 2, 0\n"
				"_0809AB68: .4byte 0xfffffe0f\n"
				"_0809AB6C: .4byte gUnknown_2039950\n"
				"_0809AB70: .4byte gUnknown_83DF0BC\n"
				"_0809AB74: .4byte gUnknown_83DF09C\n"
				"_0809AB78: .4byte sub_809AC10\n");
}
#endif

static u8 sub_809AB7C(u8 a0)
{
	u16 pocket;
	
	if (a0 != 0)
		return a0;
	else if (a0 >= gShopData.itemCount)
		return FALSE;
	else if (gShopData.itemList[0] == 0)
		return FALSE;
	else
	{
		while (ItemId_GetPocket(gShopData.itemCount[i]) != 0)
		{
			if (ItemId_GetPocket(gShopData.itemCount[i] == POCKET_TM_CASE)
				return 1;
			
		}
	}

		
	
}








