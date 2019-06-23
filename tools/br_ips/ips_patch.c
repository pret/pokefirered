#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

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

static const char SPLASH[] = "Small IPS patch utility\n"
                             "Created by PikalaxALT on 23 June 2019 All Rights Reserved\n";

int main(int argc, char ** argv) {
    puts(SPLASH);
    if (argc != 4) FATAL_ERROR("usage: %s ROM PATCH OUT\n", argv[0]);
    FILE * rom = fopen(argv[1], "rb");
    if (rom == NULL) FATAL_ERROR("failed to open file \"%s\" for reading\n", argv[1]);
    FILE * patch = fopen(argv[2], "rb");
    if (patch == NULL) FATAL_ERROR("failed to open file \"%s\" for reading\n", argv[2]);
    FILE * out = fopen(argv[3], "wb");
    if (patch == NULL) FATAL_ERROR("failed to open file \"%s\" for writing\n", argv[3]);
    char magic[5];
    if (fread(magic, 1, 5, patch) != 5) FATAL_ERROR("read magic\n");
    if (memcmp(magic, "PATCH", 5) != 0) FATAL_ERROR("malformed IPS patch\n");
    fseek(rom, 0, SEEK_END);
    size_t romsize = ftell(rom);
    fseek(rom, 0, SEEK_SET);
    char * buffer = malloc(romsize);
    if (buffer == NULL) FATAL_ERROR("failed to allocate dest buffer\n");
    if (fread(buffer, 1, romsize, rom) != romsize) FATAL_ERROR("read ROM\n");
    fclose(rom);
    while (1) {
        uint32_t offset;
        size_t size;
        
        offset = (unsigned char)getc(patch) << 16;
        offset |= (unsigned char)getc(patch) << 8;
        offset |= (unsigned char)getc(patch);
        if (offset == 0x454F46) break;
        size = (unsigned char)getc(patch) << 8;
        size |= (unsigned char)getc(patch);
        if (fread(buffer + offset, 1, size, patch) != size) FATAL_ERROR("read segment\n");
    }
    fclose(patch);
    fwrite(buffer, 1, romsize, out);
    fclose(out);
    free(buffer);
    return 0;
}
