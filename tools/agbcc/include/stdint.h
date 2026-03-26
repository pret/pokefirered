/* Copyright (C) 2008-2016 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.18  Integer types  <stdint.h>
 */

#ifndef _STDINT_H
#define _STDINT_H

#include "limits.h"

/* 7.8.1.1 Exact-width integer types */

typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long long int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;

/* 7.8.1.2 Minimum-width integer types */

typedef signed char int_least8_t;
typedef short int_least16_t;
typedef int int_least32_t;
typedef long long int_least64_t;
typedef unsigned char uint_least8_t;
typedef unsigned short uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long uint_least64_t;

/* 7.8.1.3 Fastest minimum-width integer types */

typedef int int_fast8_t;
typedef int int_fast16_t;
typedef int int_fast32_t;
typedef long long int_fast64_t;
typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long uint_fast64_t;

/* 7.8.1.4 Integer types capable of holding object pointers */

typedef int intptr_t;
typedef unsigned int uintptr_t;

/* 7.8.1.5 Greatest-width integer types */

typedef long long intmax_t;
typedef unsigned long long uintmax_t;

/* 7.18.2 Limits of specified-width integer types */

#undef INT8_MIN
#define INT8_MIN SCHAR_MIN
#undef INT8_MAX
#define INT8_MAX SCHAR_MAX
#undef UINT8_MAX
#define UINT8_MAX UCHAR_MAX

#undef INT16_MIN
#define INT16_MIN SHRT_MIN
#undef INT16_MAX
#define INT16_MAX SHRT_MAX
#undef UINT16_MAX
#define UINT16_MAX USHRT_MAX

#undef INT32_MIN
#define INT32_MIN INT_MIN
#undef INT32_MAX
#define INT32_MAX INT_MAX
#undef UINT32_MAX
#define UINT32_MAX UINT_MAX

#undef INT64_MIN
#define INT64_MIN LONG_LONG_MIN
#undef INT64_MAX
#define INT64_MAX LONG_LONG_MAX
#undef UINT64_MAX
#define UINT64_MAX ULONG_LONG_MAX

#undef INT_LEAST8_MIN
#define INT_LEAST8_MIN SCHAR_MIN
#undef INT_LEAST8_MAX
#define INT_LEAST8_MAX SCHAR_MAX
#undef UINT_LEAST8_MAX
#define UINT_LEAST8_MAX UCHAR_MAX

#undef INT_LEAST16_MIN
#define INT_LEAST16_MIN SHRT_MIN
#undef INT_LEAST16_MAX
#define INT_LEAST16_MAX SHRT_MAX
#undef UINT_LEAST16_MAX
#define UINT_LEAST16_MAX USHRT_MAX

#undef INT_LEAST32_MIN
#define INT_LEAST32_MIN INT_MIN
#undef INT_LEAST32_MAX
#define INT_LEAST32_MAX INT_MAX
#undef UINT_LEAST32_MAX
#define UINT_LEAST32_MAX UINT_MAX

#undef INT_LEAST64_MIN
#define INT_LEAST64_MIN LONG_LONG_MIN
#undef INT_LEAST64_MAX
#define INT_LEAST64_MAX LONG_LONG_MAX
#undef UINT_LEAST64_MAX
#define UINT_LEAST64_MAX ULONG_LONG_MAX

#undef INT_FAST8_MIN
#define INT_FAST8_MIN INT_MIN
#undef INT_FAST8_MAX
#define INT_FAST8_MAX INT_MAX
#undef UINT_FAST8_MAX
#define UINT_FAST8_MAX UINT_MAX

#undef INT_FAST16_MIN
#define INT_FAST16_MIN INT_MIN
#undef INT_FAST16_MAX
#define INT_FAST16_MAX INT_MAX
#undef UINT_FAST16_MAX
#define UINT_FAST16_MAX UINT_MAX

#undef INT_FAST32_MIN
#define INT_FAST32_MIN INT_MIN
#undef INT_FAST32_MAX
#define INT_FAST32_MAX INT_MAX
#undef UINT_FAST32_MAX
#define UINT_FAST32_MAX UINT_MAX

#undef INT_FAST64_MIN
#define INT_FAST64_MIN LONG_LONG_MIN
#undef INT_FAST64_MAX
#define INT_FAST64_MAX LONG_LONG_MAX
#undef UINT_FAST64_MAX
#define UINT_FAST64_MAX ULONG_LONG_MAX

#undef INTPTR_MIN
#define INTPTR_MIN INT_MIN
#undef INTPTR_MAX
#define INTPTR_MAX INT_MAX
#undef UINTPTR_MAX
#define UINTPTR_MAX UINT_MAX

#undef INTMAX_MIN
#define INTMAX_MIN LONG_LONG_MIN
#undef INTMAX_MAX
#define INTMAX_MAX LONG_LONG_MAX
#undef UINTMAX_MAX
#define UINTMAX_MAX ULONG_LONG_MAX

/* 7.18.3 Limits of other integer types */

#undef PTRDIFF_MIN
#define PTRDIFF_MIN INT_MIN
#undef PTRDIFF_MAX
#define PTRDIFF_MAX INT_MAX

#undef SIZE_MAX
#define SIZE_MAX UINT_MAX

#undef WCHAR_MIN
#define WCHAR_MIN INT_MIN
#undef WCHAR_MAX
#define WCHAR_MAX INT_MAX

#endif /* _STDINT_H */
