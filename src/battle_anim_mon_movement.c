#include "global.h"

void sub_80990AC(struct Sprite * sprite);
void sub_8099144(struct Sprite * sprite);
void sub_80991B4(struct Sprite * sprite);
void sub_80992E0(struct Sprite * sprite);
void sub_8099394(struct Sprite * sprite);

const struct SpriteTemplate gUnknown_83D4E4C[] = {
    {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80990AC
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8099144
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80991B4
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80992E0
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8099394
    }
};
