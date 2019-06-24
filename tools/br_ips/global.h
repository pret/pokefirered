#ifndef GUARD_BR_IPS_GLOBAL_H
#define GUARD_BR_IPS_GLOBAL_H

#ifdef _MSC_VER

#define FATAL_ERROR(format, ...)          \
do {                                      \
    fprintf(stderr, format, __VA_ARGS__); \
    exit(1);                              \
} while (0)

#else

#define FATAL_ERROR(format, ...)            \
do {                                        \
    fprintf(stderr, format, ##__VA_ARGS__); \
    exit(1);                                \
} while (0)

#endif // _MSC_VER

typedef struct Hunk {
    uint32_t offset;
    size_t size;
} hunk_t;

#endif //GUARD_BR_IPS_GLOBAL_H
