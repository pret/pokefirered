#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "global.h"

static const char SPLASH[] = "Small IPS patch utility\n"
                             "Created by PikalaxALT on 23 June 2019 All Rights Reserved\n";

static const char HELP[] = "ips_patch [-h] ROM PATCH OUT\n"
                           "\n"
                           "    ROM - input ROM file\n"
                           "    PATCH - IPS patch file to apply\n"
                           "    OUT - path to write patched ROM\n"
                           "\n"
                           "Options:\n"
                           "    -h - show this message and exit\n";

int main(int argc, char ** argv) {
    // Show a friendly message
    puts(SPLASH);
    // If requested, show help message
    if (argc >= 2 && strcmp(argv[1], "-h") == 0) {
        puts(HELP);
        return 0;
    }
    // Enforce CLI syntax
    if (argc != 4) FATAL_ERROR("usage: %s [-h] ROM PATCH OUT\n", argv[0]);
    FILE * rom = fopen(argv[1], "rb");
    if (rom == NULL) FATAL_ERROR("failed to open file \"%s\" for reading\n", argv[1]);
    FILE * patch = fopen(argv[2], "rb");
    if (patch == NULL) FATAL_ERROR("failed to open file \"%s\" for reading\n", argv[2]);
    FILE * out = fopen(argv[3], "wb");
    if (patch == NULL) FATAL_ERROR("failed to open file \"%s\" for writing\n", argv[3]);
    // IPS magic header
    char magic[5];
    if (fread(magic, 1, 5, patch) != 5) FATAL_ERROR("read magic\n");
    if (memcmp(magic, "PATCH", 5) != 0) FATAL_ERROR("malformed IPS patch\n");
    // Read the ROM into allocated memory.
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
        // Read each hunk into the buffer, overwriting previous data.
        // If two or more hunks overlap, the newest one is retained.
        // A good IPS patch creator will avoid this.
        offset = (unsigned char)getc(patch) << 16;
        offset |= (unsigned char)getc(patch) << 8;
        offset |= (unsigned char)getc(patch);
        if (offset == 0x454F46) break; // end sentinel "EOF"
        size = (unsigned char)getc(patch) << 8;
        size |= (unsigned char)getc(patch);
        if (offset + size > romsize) FATAL_ERROR("segment extends past end of ROM\n");
        if (fread(buffer + offset, 1, size, patch) != size) FATAL_ERROR("read segment\n");
    }
    fclose(patch);
    // Write the patched ROM
    fwrite(buffer, 1, romsize, out);
    fclose(out);
    free(buffer);
    return 0;
}
