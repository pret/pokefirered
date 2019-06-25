#define _POSIX_C_SOURCE 200808L // Don't use GNU getline
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "global.h"

static const char SPLASH[] = "IPS patch creator for undisassembled data\n"
                             "Created by PikalaxALT on 23 June 2019 All Rights Reserved\n";

static const char HELP[] = "br_ips\n"
                           "This utility is meant to be run with no arguments in the project root of a PRET AGB disassembly.\n"
                           "baserom.gba and ld_script.txt are required files which must be present in the project root.\n"
                           "ld_script.txt is a GNU linker script. For more details, see\n"
                           "https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_chapter/ld_3.html#SEC6.\n"
                           "All ELF targets in the linker script with Makefile rules \"%.o: %.s\" must have their sources present\n"
                           "at the indicated paths relative to the project root.\n"
                           "\n"
                           "Options:\n"
                           "    -h - show this message and exit\n";

static int getline(char ** lineptr, size_t * n, FILE * stream) {
    // Static implementation of GNU getline
    int i = 0;
    int c;
    if (n == NULL || lineptr == NULL || stream == NULL) return -1;
    size_t size = *n;
    char * buf = *lineptr;
    if (buf == NULL || size < 4) {
        size = 128;
        *lineptr = buf = realloc(buf, 128);
    }
    if (buf == NULL) return -1;
    while (1) {
        c = getc(stream);
        if (c == EOF) break;
        buf[i++] = c;
        if (c == '\n') break;
        if (i == size - 1) {
            size <<= 1;
            buf = realloc(buf, size);
            if (buf == NULL) return -1;     
            *lineptr = buf;
            *n = size;
        }
    }
    if (i == 0) return -1;
    buf[i] = 0;
    return i;
}

static void getIncbinsFromFile(hunk_t ** hunks, size_t * num, size_t * maxnum, const char * fname, char ** strbuf, size_t * buffersize) {
    // Recursively find incbinned segments and encode them as hunks.
    FILE * file = fopen(fname, "r");
    if (file == NULL) FATAL_ERROR("unable to open file \"%s\" for reading\n", fname);
    hunk_t * data = *hunks;
    size_t nhunks = *num;
    size_t maxnhunks = *maxnum;
    int line_n = 0; // for error prints
    while (getline(strbuf, buffersize, file) > 0) {
        line_n++;
        // If another file is included by this one, recurse into it.
        char * include = strstr(*strbuf, ".include");
        if (include != NULL) {
            char incfname[128];
            include = strchr(include, '"');
            if (include == NULL) FATAL_ERROR("%s:%d: malformed include\n", fname, line_n);
            include++;
            char * endq_p = strchr(include, '"');
            if (endq_p == NULL) FATAL_ERROR("%s:%d: malformed include\n", fname, line_n);
            *endq_p = 0;
            strcpy(incfname, include);
            getIncbinsFromFile(&data, &nhunks, &maxnhunks, incfname, strbuf, buffersize);
            continue;
        }
        // Check for a .incbin "baserom.gba" directive
        char * line = strstr(*strbuf, ".incbin");
        if (line == NULL) continue;
        line = strstr(line + sizeof(".incbin"), "\"baserom.gba\",");
        if (line == NULL) continue;
        line += sizeof("\"baserom.gba\",") - 1;
        uint32_t incbinOffset;
        // Enforce the structure .incbin "baserom.gba", offset, size
        // Data cannot be located at offset 0, as that is the entry
        // point (ARM code).
        do {
            if (*line == 0) FATAL_ERROR("%s:%d: malformed incbin\n", fname, line_n);
            incbinOffset = strtoul(line, &line, 0);
            line++;
        } while (incbinOffset == 0);
        size_t incbinSize;
        do {
            if (*line == 0) FATAL_ERROR("%s:%d: malformed incbin\n", fname, line_n);
            incbinSize = strtoul(line, &line, 0);
            line++;
        } while (incbinSize == 0);
        // Offset must fit in three bytes
        if (incbinOffset >= 0x01000000) FATAL_ERROR("%s:%d: offset exceeds encodable limit\n", fname, line_n);
        // Avoid confusion with the end sentinel
        if (incbinOffset == 0x454F46) { // "EOF"
            incbinOffset--;
            incbinSize++;
        }
        // Cannot read past a certain point due to format restrictions
        if (incbinOffset + incbinSize > 0xFFFFFF + 0xFFFF) FATAL_ERROR("%s:%d: size exceeds encodable limit\n", fname, line_n);
        // Break up the incbin into hunks of maximum size 0xFFFF
        do {
            size_t trueSize = incbinSize <= 0xFFFF ? incbinSize : 0xFFFF;
            if (nhunks >= maxnhunks) {
                maxnhunks <<= 1;
                data = realloc(data, maxnhunks * sizeof(hunk_t));
                if (data == NULL) FATAL_ERROR("unable to reallocate hunks buffer\n");
            }
            data[nhunks].offset = incbinOffset;
            data[nhunks].size = trueSize;
            incbinOffset += trueSize;
            incbinSize -= trueSize;
            if (incbinOffset == 0x454F46) {
                incbinOffset--;
                data[nhunks].size--;
                incbinSize++;
            }
            nhunks++;
        } while (incbinSize > 0);
    }
    // Error check
    if (!feof(file)) FATAL_ERROR("getline\n");
    fclose(file);
    *hunks = data;
    *num = nhunks;
    *maxnum = maxnhunks;
}

static hunk_t * getAllIncbins(FILE * ld_script, size_t * num_p) {
    // Parse the ld script.
    // Strict adherence to syntax is expected.
    char * line = NULL;
    size_t linesiz = 0;
    char fname_buf[128];
    size_t maxnum = 256;
    size_t num = 0;
    // Allocate the hunks array.
    hunk_t * hunks = malloc(256 * sizeof(hunk_t));
    if (hunks == NULL) FATAL_ERROR("failed to allocate hunks buffer\n");
    while (getline(&line, &linesiz, ld_script) > 0) {
        char * endptr;
        // We only expect hunks in rodata, script_data, and gfx_data sections.
        if ((endptr = strstr(line, ".o(.rodata);")) == NULL
         && (endptr = strstr(line, ".o(script_data);")) == NULL
         && (endptr = strstr(line, ".o(gfx_data);")) == NULL) continue;
        char * startptr = line;
        // Skip whitespace.
        while (isspace(*startptr)) startptr++;
        if (strstr(startptr, ".a:") != NULL) continue; // no hunks in libs
        if (strstr(startptr, "src/") == startptr) continue; // no hunks in src/
        // Replace the extension with .s and truncate the string
        endptr[1] = 's';
        endptr[2] = 0;
        // We're reusing the already-allocated string buffer, so
        // copy the filename to the stack for use in error prints.
        strcpy(fname_buf, startptr);
        getIncbinsFromFile(&hunks, &num, &maxnum, fname_buf, &line, &linesiz);
    }
    // Error check
    if (!feof(ld_script)) FATAL_ERROR("getline\n");
    free(line);
    *num_p = num;
    return hunks;
}

static int cmp_baserom(const void * a, const void * b) {
    // Comparison function for sorting Hunk structs.
    // For more details, please refer to the qsort man pages.
    // See also the function "collapseIncbins" below.
    const hunk_t * aa = (const hunk_t *)a;
    const hunk_t * bb = (const hunk_t *)b;
    return (aa->offset > bb->offset) - (aa->offset < bb->offset);
}

static void collapseIncbins(hunk_t * hunks, size_t * num_p) {
    // This function merges adjacent hunks where possible.
    size_t num = *num_p;
    // Sort the array by offset increasing.
    qsort(hunks, num, sizeof(hunk_t), cmp_baserom);
    // We stop at num - 1 because we need to be able to look one
    // entry ahead in the hunks array.
    for (int i = 0; i < num - 1; i++) {
        // Loop until the next hunk is not adjacent to the current.
        while (hunks[i].offset + hunks[i].size == hunks[i + 1].offset) {
            // If this hunk cannot be merged with the next, proceed to the next.
            if (hunks[i].size == 0xFFFF || (hunks[i].size == 0xFFFE && hunks[i + 1].offset == 0x454F45)) break;
            // If this hunk is empty, remove it.
            if (hunks[i].size == 0) {
                int j;
                // Find the next non-empty hunk
                for (j = i + 1; j < num; j++) {
                    if (hunks[j].size != 0) break;
                }
                if (j == num) {
                    // All remaining hunks are empty
                    num = i;
                    break;
                }
                // Compaction
                // Use a for loop instead of memcpy to avoid UB from
                // overlapping buffers.
                for (int k = 0; k < num - j; k++) hunks[i + k] = hunks[j + k];
                num -= j - i;
                if (i >= num - 1) break;
            }
            else
            {
                // Combine this hunk with the next
                hunks[i].size += hunks[i + 1].size;
                if (hunks[i].size > 0xFFFF) {
                    // Split the hunk back up, it's too big to encode.
                    // Set the earlier hunk to the maximum permitted size,
                    // and the following hunk to the remainder.
                    hunks[i + 1].size = hunks[i].size - 0xFFFF;
                    hunks[i].size = 0xFFFF;
                    hunks[i + 1].offset = hunks[i].offset + 0xFFFF;
                    // If this operation would confuse the hunk with the
                    // EOF sentinel, fix that.
                    if (hunks[i + 1].offset == 0x454F46) {
                        hunks[i].size--;
                        hunks[i + 1].offset--;
                        hunks[i + 1].size++;
                    }
                    break;
                } else {
                    // Compaction
                    // Use a for loop instead of memcpy to avoid UB from
                    // overlapping buffers.
                    for (int j = i + 1; j < num - 1; j++) hunks[j] = hunks[j + 1];
                    num--;
                    if (i >= num - 1) break;
                }
            }
        }
    }
    *num_p = num;
}

static void writePatch(const char * filename, const hunk_t * hunks, size_t num, FILE * rom) {
    // Create an IPS patch.
    // The file is headed with a magic code which is "PATCH" in ASCII.
    // Following that are the "hunks": 3-byte offset, 2-byte size, and
    // the literal data. The file is ended with "EOF", again in ASCII.
    // For that reason, an offset of 0x454F46 cannot be encoded directly.
    // Offset and size are encoded big-endian.
    FILE * file = fopen(filename, "wb");
    if (file == NULL) FATAL_ERROR("unable to open file \"%s\" for writing\n", filename);
    // Maximum hunk size is 65535 bytes. For convenience, we allocate a
    // round 65536 (0x10000). This has no effect on memory consumption,
    // as malloc will round this up anyway.
    char * readbuf = malloc(0x10000);
    if (readbuf == NULL) FATAL_ERROR("failed to allocate write buffer\n");
    fwrite("PATCH", 1, 5, file); // magic
    for (int i = 0; i < num; i++) {
        // Encode the offset
        uint32_t offset = hunks[i].offset;
        putc(offset >> 16, file);
        putc(offset >>  8, file);
        putc(offset >>  0, file);
        // Encode the size
        size_t size = hunks[i].size;
        putc(size >> 8, file);
        putc(size >> 0, file);
        // Yank the data straight from the ROM
        if (fseek(rom, offset, SEEK_SET)) FATAL_ERROR("seek\n");
        if (fread(readbuf, 1, size, rom) != size) FATAL_ERROR("read\n");
        if (fwrite(readbuf, 1, size, file) != size) FATAL_ERROR("write\n");
    }
    free(readbuf);
    // Write the EOF magic
    fwrite("EOF", 1, 3, file);
    fclose(file);
}

// This script takes no arguments.
int main(int argc, char ** argv) {
    // Show a friendly message
    puts(SPLASH);
    // If requested, show help message
    if (argc >= 2 && strcmp(argv[1], "-h") == 0) {
        puts(HELP);
        return 0;
    }
    // This script expects to be in a PRET AGB disassembly project root.
    // Required files include baserom.gba, ld_script.txt, and all paths
    // referenced in ld_script.txt relative to the project root.
    FILE * rom = fopen("baserom.gba", "rb");
    if (rom == NULL) FATAL_ERROR("unable to open \"baserom.gba\" for reading\n");
    FILE * ld_script = fopen("ld_script.txt", "r");
    if (ld_script == NULL) FATAL_ERROR("unable to open \"ld_script.txt\" for reading\n");
    // Find all instances where segments of baserom.gba are incbinned literaly.
    size_t num = 0;
    hunk_t * hunks = getAllIncbins(ld_script, &num);
    fclose(ld_script);
    if (num == 0) {
        // If this line is printed, the script was unable to find any
        // `.incbin "baserom.gba"` lines.
        // If this is incorrect, please contact the developer.
        puts("No baserom.gba hunks found!\n"
             "If there are baserom.gba hunks in this project,\n"
             "please ping PikalaxALT on the pret discord,\n"
             "channel #gen-3-help.\n");
    } else {
        // Merge neighboring hunks to reduce the number of hunks.
        collapseIncbins(hunks, &num);
        // Encode the hunks in the IPS patch.
        writePatch("baserom.ips", hunks, num, rom);
        // Communicate status to the user.
        puts("IPS file created at baserom.ips\n");
    }
    // Clean up and return.
    fclose(rom);
    free(hunks);
    return 0;
}
