#ifndef GUARD_FIELD_MESSAGE_BOX_H
#define GUARD_FIELD_MESSAGE_BOX_H

#include "global.h"

bool8 ShowFieldMessage(const u8 *message);
bool8 sub_8098238(const u8 *message);
bool8 ShowFieldAutoScrollMessage(const u8 *message);
void HideFieldMessageBox(void);
bool8 IsFieldMessageBoxHidden(void);
bool8 textbox_any_visible(void);
void sub_8069348(void);

#endif // GUARD_FIELD_MESSAGE_BOX_H
