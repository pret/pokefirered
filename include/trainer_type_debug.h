#ifndef GUARD_TRAINER_TYPE_DEBUG_H
#define GUARD_TRAINER_TYPE_DEBUG_H

#include "config.h"

#if !defined(NDEBUG) && defined(TRAINER_TYPE_DEBUG_LOG) && TRAINER_TYPE_DEBUG_LOG
#include "gba/isagbprint.h"
#define TRAINER_TYPE_DEBUG_LOGF(fmt, ...) DebugPrintf("[TTL] " fmt, ##__VA_ARGS__)
#else
#define TRAINER_TYPE_DEBUG_LOGF(fmt, ...) ((void)0)
#endif

#endif // GUARD_TRAINER_TYPE_DEBUG_H