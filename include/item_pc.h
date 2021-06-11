#ifndef GUARD_ITEM_PC_H
#define GUARD_ITEM_PC_H

enum {
    ITEMPC_FIRST,
    ITEMPC_RETURN,
    ITEMPC_MODE_COUNT,
};

void ItemPc_Init(u8 kind, MainCallback callback);
void ItemPc_SetInitializedFlag(bool8 flag);

#endif //GUARD_ITEM_PC_H
