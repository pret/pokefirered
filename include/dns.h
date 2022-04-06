#ifndef GUARD_DNS_UTILS_H
#define GUARD_DNS_UTILS_H

#define USE_DNS_IN_BATTLE   TRUE

#define DNS_PAL_EXCEPTION   FALSE
#define DNS_PAL_ACTIVE      TRUE

struct DNSPalExceptions 
{
    bool8 pal[32];
};

void DNSTransferPlttBuffer(void *src, void *dest);
void DNSApplyFilters(void);

#endif // GUARD_DNS_UTILS_H
