#ifndef GUARD_OW_SYNCHRONIZE_H
#define GUARD_OW_SYNCHRONIZE_H

enum GeneratedMonOrigin 
{
    WILDMON_ORIGIN,
    STATIC_WILDMON_ORIGIN,
    ROAMER_ORIGIN,
    GIFTMON_ORIGIN
};

u32 GetSynchronizedNature(enum GeneratedMonOrigin origin, u32 species);
u32 GetSynchronizedGender(enum GeneratedMonOrigin origin, u32 species);

#endif // GUARD_OW_SYNCHRONIZE_H
