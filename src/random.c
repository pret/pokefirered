#include "global.h"
#include "random.h"

// The number 1103515245 comes from the example implementation
// of rand and srand in the ISO C standard.

u32 gRngValue;

u16 Random(void)
{
    gRngValue = ISO_RANDOMIZE1(gRngValue);
    return gRngValue >> 16;
}


u16 SeededRandom(u16 seed) {
    return ISO_RANDOMIZE1(seed);
}

void SeedRng(u16 seed)
{
    gRngValue = seed;
}
