#include "global.h"
#include "generational_changes.h"
#include "malloc.h"
#include "constants/generational_changes.h"
#include "config/pokerus.h"

#define UNPACK_BATTLE_CONFIG_GEN_CHANGES(_name, _field, ...) ._field = B_##_name,
#define UNPACK_POKEMON_CONFIG_GEN_CHANGES(_name, _field, ...) ._field = P_##_name,

const struct GenChanges sConfigChanges =
{
    BATTLE_CONFIG_DEFINITIONS(UNPACK_BATTLE_CONFIG_GEN_CHANGES)
    POKEMON_CONFIG_DEFINITIONS(UNPACK_POKEMON_CONFIG_GEN_CHANGES)
    /* Expands to:
    .critChance     = B_CRIT_CHANCE,
    .critMultiplier = B_CRIT_MULTIPLIER,
    */
};

#if TESTING
EWRAM_DATA struct GenChanges *gConfigChangesTestOverride = NULL;
#define UNPACK_CONFIG_OVERRIDE_GETTERS(_name, _field, ...)   case CONFIG_##_name: return gConfigChangesTestOverride->_field;
#define UNPACK_CONFIG_GETTERS(_name, _field, ...) case CONFIG_##_name: return sConfigChanges._field;
#define UNPACK_CONFIG_CLAMPER(_name, _field, _typeMaxValue, ...) case CONFIG_##_name: clampedValue = min(GET_CONFIG_MAXIMUM(_typeMaxValue), newValue); break;
#define UNPACK_CONFIG_SETTERS(_name, _field, _typeMaxValue, ...) case CONFIG_##_name: gConfigChangesTestOverride->_field = clampedValue; break;

#else

#define UNPACK_CONFIG_OVERRIDE_GETTERS(_name, _field, ...) case CONFIG_##_name: return sConfigChanges._field;
#define UNPACK_CONFIG_GETTERS(_name, _field, ...) case CONFIG_##_name: return sConfigChanges._field;
#define UNPACK_CONFIG_CLAMPER(_name, _field, ...) case CONFIG_##_name: return 0;
#define UNPACK_CONFIG_SETTERS(_name, _field, ...) case CONFIG_##_name: return;
#endif

u32 GetConfig(enum ConfigTag _genConfig)
{
#if TESTING
    if (gConfigChangesTestOverride == NULL)
    {
        switch (_genConfig)
        {
            BATTLE_CONFIG_DEFINITIONS(UNPACK_CONFIG_GETTERS)
            POKEMON_CONFIG_DEFINITIONS(UNPACK_CONFIG_GETTERS)
        /* Expands to:
            case CONFIG_CRIT_CHANCE:
                return gConfigChangesTestOverride->critChance;
        */
            default:
                return 0;
        }
    }
    else
#endif
    {
        switch (_genConfig)
        {
            BATTLE_CONFIG_DEFINITIONS(UNPACK_CONFIG_OVERRIDE_GETTERS)
            POKEMON_CONFIG_DEFINITIONS(UNPACK_CONFIG_OVERRIDE_GETTERS)
        /* Expands to:
            case CONFIG_CRIT_CHANCE:
                 return sConfigChanges.critChance;
        */
            default: // Invalid config tag
                return 0;
        }
     }
}

#if TESTING
u32 GetClampedValue(enum ConfigTag _genConfig, u32 newValue)
{
    u32 clampedValue = 0;
    switch(_genConfig)
    {
        BATTLE_CONFIG_DEFINITIONS(UNPACK_CONFIG_CLAMPER)
        POKEMON_CONFIG_DEFINITIONS(UNPACK_CONFIG_CLAMPER)
        default:
            return 0;
    }
    return clampedValue;
}
#endif

void SetConfig(enum ConfigTag _genConfig, u32 _value)
{
#if TESTING
    // Clamping is done here instead of the switch due to an internal compiler error!
    u32 clampedValue = GetClampedValue(_genConfig, _value);
    switch (_genConfig)
    {
        BATTLE_CONFIG_DEFINITIONS(UNPACK_CONFIG_SETTERS)
        POKEMON_CONFIG_DEFINITIONS(UNPACK_CONFIG_SETTERS)
    /* Expands to:
    #if TESTING
        case CONFIG_CRIT_CHANCE:
            gConfigChangesTestOverride->critChance = clampedValue;
            break;
    #else
        case CONFIG_CRIT_CHANCE:
            return;
    #endif
    */
        default: // Invalid config tag
            return;
    }
#endif
}

#if TESTING
void TestInitConfigData(void)
{
    gConfigChangesTestOverride = Alloc(sizeof(sConfigChanges));
    memcpy(gConfigChangesTestOverride, &sConfigChanges, sizeof(sConfigChanges));
}

void TestFreeConfigData(void)
{
    TRY_FREE_AND_SET_NULL(gConfigChangesTestOverride)
}
#endif
