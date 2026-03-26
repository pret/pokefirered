/* stdarg.h for GNU.
   Note that the type used in va_arg is supposed to match the
   actual type **after default promotions**.
   Thus, va_arg (..., short) is not valid.  */

#ifndef _STDARG_H
#define _STDARG_H

typedef void *__gnuc_va_list;

/* Amount of space required in an argument list for an arg of type TYPE.
   TYPE may alternatively be an expression whose type is used.  */
#define __va_rounded_size(TYPE) \
    (((sizeof (TYPE) + sizeof (int) - 1) / sizeof (int)) * sizeof (int))

#define va_start(AP, LASTARG) \
    (AP = ((__gnuc_va_list) __builtin_next_arg(LASTARG)))

#define va_end(AP) ((void)0)

/* We cast to void * and then to TYPE * because this avoids
   a warning about increasing the alignment requirement.
   This is for little-endian machines; small args are padded upward.  */
#define va_arg(AP, TYPE) \
    (AP = (__gnuc_va_list)((char *)(AP) + __va_rounded_size(TYPE)), \
     *((TYPE *)(void *)((char *)(AP) - __va_rounded_size(TYPE))))

/* Copy __gnuc_va_list into another variable of this type.  */
#define __va_copy(dest, src) (dest) = (src)

typedef __gnuc_va_list va_list;

#endif /* not _STDARG_H */
