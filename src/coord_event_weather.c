#include "global.h"

void nullsub_27(void) {}
void nullsub_28(void) {}
void nullsub_29(void) {}
void nullsub_30(void) {}
void nullsub_31(void) {}
void nullsub_32(void) {}
void nullsub_33(void) {}
void nullsub_34(void) {}
void nullsub_35(void) {}
void nullsub_36(void) {}
void nullsub_37(void) {}
void nullsub_38(void) {}
void nullsub_39(void) {}

struct {
    u8 weatherId;
    void (*callback)(void);
} const gUnknown_83A72A8[] = {
    {0x01, nullsub_27},
    {0x02, nullsub_28},
    {0x03, nullsub_29},
    {0x04, nullsub_30},
    {0x05, nullsub_31},
    {0x06, nullsub_32},
    {0x07, nullsub_33},
    {0x08, nullsub_34},
    {0x09, nullsub_35},
    {0x0a, nullsub_36},
    {0x0b, nullsub_37},
    {0x14, nullsub_38},
    {0x15, nullsub_39}
};

void trigger_activate_weather(u8 weatherId)
{
    u8 i;
    for (i = 0; i < NELEMS(gUnknown_83A72A8); i++)
    {
        if (gUnknown_83A72A8[i].weatherId == weatherId)
        {
            gUnknown_83A72A8[i].callback();
            return;
        }
    }
}
