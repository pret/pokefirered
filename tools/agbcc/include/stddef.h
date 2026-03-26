#ifndef _STDDEF_H
#define _STDDEF_H

/* Signed type of difference of two pointers.  */

typedef long int ptrdiff_t;

/* Unsigned type of `sizeof' something.  */

typedef unsigned long int size_t;

/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

typedef int wchar_t;

/* A null pointer constant.  */

/* in case <stdio.h> has defined it. */
#undef NULL
#define NULL ((void *)0)

/* Offset of member MEMBER in a struct of type TYPE.  */

#define offsetof(TYPE, MEMBER) ((size_t)&((TYPE *)0)->MEMBER)

#endif /* _STDDEF_H */
