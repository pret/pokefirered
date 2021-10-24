#ifndef GUARD_FIELD_MESSAGE_BOX_H
#define GUARD_FIELD_MESSAGE_BOX_H

#include "global.h"

bool8 ShowFieldMessage(const u8 *message);
bool8 ShowFieldAutoScrollMessage(const u8 *message);
void HideFieldMessageBox(void);
bool8 IsFieldMessageBoxHidden(void);
bool8 textbox_any_visible(void);
void InitFieldMessageBox(void);

#endif // GUARD_FIELD_MESSAGE_BOX_H
