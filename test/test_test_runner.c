#include "global.h"
#include "test/test.h"

TEST("Tests resume after CRASH")
{
    KNOWN_CRASHING;
    void (*f)(void) = NULL;
    f();
}
