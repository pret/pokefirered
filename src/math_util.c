#include "global.h"
#include "math_util.h"

fx16 Q_8_8_mul(fx16 x, fx16 y)
{
    s32 result;

    result = x;
    result *= y;
    result /= 256;
    return result;
}

fxn16 Q_N_S_mul(u8 s, fxn16 x, fxn16 y)
{
    s32 result;

    result = x;
    result *= y;
    result /= (1 << s);
    return result;
}

fx32 Q_24_8_mul(fx32 x, fx32 y)
{
    s64 result;

    result = x;
    result *= y;
    result /= 256;
    return result;
}

fx16 Q_8_8_div(fx16 x, fx16 y)
{
    if (y == 0)
    {
        return 0;
    }
    return (x << 8) / y;
}

fxn16 Q_N_S_div(u8 s, fxn16 x, fxn16 y)
{
    if (y == 0)
    {
        return 0;
    }
    return (x << s) / y;
}

fx32 Q_24_8_div(fx32 x, fx32 y)
{
    s64 _x;

    if (y == 0)
    {
        return 0;
    }
    _x = x;
    _x *= 256;
    return _x / y;
}

fx16 Q_8_8_inv(fx16 y)
{
    s32 x;

    x = 0x10000;
    return x / y;
}

fxn16 Q_N_S_inv(u8 s, fxn16 y)
{
    s32 x;

    x = 0x100 << s;
    return x / y;
}

fx32 Q_24_8_inv(fx32 y)
{
    s64 x;

    x = 0x10000;
    return x / y;
}
