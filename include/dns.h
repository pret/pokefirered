#ifndef GUARD_DNS_UTILS_H
#define GUARD_DNS_UTILS_H

#define USE_DNS_IN_BATTLE   TRUE

#define DNS_PAL_EXCEPTION   FALSE
#define DNS_PAL_ACTIVE      TRUE

struct LightingColour 
{
    u8 paletteNum;
    u8 colourNum;
    u16 lightColour;
};

struct DnsPalExceptions 
{
    bool8 pal[32];
};

void DnsTransferPlttBuffer(void *src, void *dest);
void DnsApplyFilters(void);

#endif // GUARD_DNS_UTILS_H