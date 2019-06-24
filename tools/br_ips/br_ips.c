#define _POSIX_C_SOURCE 200808L // Don't use GNU getline
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

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

#ifndef _SSIZE_T
#define _SSIZE_T
typedef int ssize_t;
#endif // _SSIZE_T

static const char SPLASH[] = "IPS patch creator for undisassembled data\n"
                             "Created by PikalaxALT on 23 June 2019 All Rights Reserved\n";

struct Baserom {
    uint32_t offset;
    size_t size;
};

static ssize_t getline(char ** lineptr, size_t * n, FILE * stream) {
    ssize_t i = 0;
    int c;
    size_t size = *n;
    char * buf = *lineptr;
    if (size == 0) {
        size = BUFSIZ;
        buf = realloc(buf, BUFSIZ);
    }
    if (buf == NULL) return -1;
    do {
        if (feof(stream)) return -1;
        c = getc(stream);
        buf[i++] = c;
        if (i == size) {
            size <<= 1;
            buf = realloc(buf, size);
            if (buf == NULL) return -1;     
        }
    } while (c != '\n');
    
    *lineptr = buf;
    *n = size;
    return i;
}

static void getIncbinsFromFile(struct Baserom ** incbins, size_t * num, size_t * maxnum, const char * fname, char ** strbuf, size_t * buffersize) {
    FILE * file = fopen(fname, "r");
    if (file == NULL) FATAL_ERROR("unable to open file \"%s\" for reading\n", fname);
    struct Baserom * data = *incbins;
    size_t nincbins = *num;
    size_t maxnincbins = *maxnum;
    int line_n = 0;
    while (getline(strbuf, buffersize, file) > 0) {
        line_n++;
        char * nl_p = strchr(*strbuf, '\n');
        if (nl_p != NULL) *nl_p = 0;
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
            getIncbinsFromFile(&data, &nincbins, &maxnincbins, incfname, strbuf, buffersize);
            continue;
        }
        char * line = strstr(*strbuf, ".incbin");
        if (line == NULL) continue;
        line = strstr(line + sizeof(".incbin"), "\"baserom.gba\",");
        if (line == NULL) continue;
        line += sizeof("\"baserom.gba\",") - 1;
        uint32_t incbinOffset;
        do {
            if (*line == 0) FATAL_ERROR("%s:%d: malformed incbin\n", fname, line_n);
            incbinOffset = strtoul(line, &line, 0);
            line++;
        } while (incbinOffset == 0);
        ssize_t incbinSize;
        do {
            if (*line == 0) FATAL_ERROR("%s:%d: malformed incbin\n", fname, line_n);
            incbinSize = strtoul(line, &line, 0);
            line++;
        } while (incbinSize == 0);
        if (incbinOffset >= 0x01000000) FATAL_ERROR("%s:%d: offset exceeds encodable limit\n", fname, line_n);
        if (incbinOffset == 0x454F46) { // "EOF"
            incbinOffset--;
            incbinSize++;
        }
        if (incbinOffset + incbinSize >= 0xFFFFFF + 0xFFFF) FATAL_ERROR("%s:%d: size exceeds encodable limit\n", fname, line_n);
        do {
            size_t trueSize = incbinSize <= 0xFFFF ? incbinSize : 0xFFFF;
            if (nincbins >= maxnincbins) {
                maxnincbins <<= 1;
                data = realloc(data, maxnincbins * sizeof(struct Baserom));
                if (data == NULL) FATAL_ERROR("unable to reallocate incbins buffer\n");
            }
            data[nincbins].offset = incbinOffset;
            data[nincbins].size = trueSize;
            incbinOffset += trueSize;
            incbinSize -= trueSize;
            if (incbinOffset == 0x454F46) {
                incbinOffset--;
                data[nincbins].size--;
                incbinSize++;
            }
            nincbins++;
        } while (incbinSize > 0);
    }
    if (!feof(file)) FATAL_ERROR("getline\n");
    fclose(file);
    *incbins = data;
    *num = nincbins;
    *maxnum = maxnincbins;
}

static struct Baserom * getAllIncbins(FILE * ld_script, size_t * num_p) {
    char * line = NULL;
    size_t linesiz = 0;
    char fname_buf[128];
    size_t maxnum = 256;
    size_t num = 0;
    struct Baserom * incbins = malloc(256 * sizeof(struct Baserom));
    if (incbins == NULL) FATAL_ERROR("failed to allocate incbins buffer\n");
    while (getline(&line, &linesiz, ld_script) > 0) {
        char * endptr;
        if ((endptr = strstr(line, ".o(.rodata);")) == NULL
         && (endptr = strstr(line, ".o(script_data);")) == NULL
         && (endptr = strstr(line, ".o(gfx_data);")) == NULL) continue;
        char * startptr = line;
        while (isspace(*startptr)) startptr++;
        if (strstr(startptr, ".a:") != NULL) continue; // no incbins in libs
        if (strstr(startptr, "src/") == startptr) continue; // no incbins in src/
        endptr[1] = 's';
        endptr[2] = 0;
        strcpy(fname_buf, startptr);
        getIncbinsFromFile(&incbins, &num, &maxnum, fname_buf, &line, &linesiz);
    }
    if (!feof(ld_script)) FATAL_ERROR("getline\n");
    free(line);
    *num_p = num;
    return incbins;
}

static int cmp_baserom(const void * a, const void * b) {
    const struct Baserom * aa = (const struct Baserom *)a;
    const struct Baserom * bb = (const struct Baserom *)b;
    return (aa->offset > bb->offset) - (aa->offset < bb->offset);
}

static void collapseIncbins(struct Baserom * incbins, size_t * num_p) {
    size_t num = *num_p;
    qsort(incbins, num, sizeof(struct Baserom), cmp_baserom);
    for (int i = 0; i < num - 1; i++) {
        while (incbins[i].offset + incbins[i].size == incbins[i + 1].offset) {
            if (incbins[i].size == 0xFFFF) break;
            while (incbins[i].size == 0) {
                for (int j = i; j < num - 1; j++) incbins[j] = incbins[j + 1];
                num--;
                if (i == num - 1) break;
            }
            if (i == num - 1) break;
            incbins[i].size += incbins[i + 1].size;
            if (incbins[i].size > 0xFFFF) {
                incbins[i + 1].size = incbins[i].size - 0xFFFF;
                incbins[i].size = 0xFFFF;
                incbins[i + 1].offset = incbins[i].offset + 0xFFFF;
                if (incbins[i + 1].offset == 0x454F46) {
                    incbins[i].size--;
                    incbins[i + 1].offset--;
                    incbins[i + 1].size++;
                }
                break;
            } else {
                for (int j = i + 1; j < num - 1; j++) incbins[j] = incbins[j + 1];
                num--;
                if (i == num - 1) break;
            }
        }
    }
    *num_p = num;
}

static void writePatch(const char * filename, const struct Baserom * incbins, size_t num, FILE * rom) {
    FILE * file = fopen(filename, "wb");
    if (file == NULL) FATAL_ERROR("unable to open file \"%s\" for writing\n", filename);
    char * readbuf = malloc(0x10000);
    if (readbuf == NULL) FATAL_ERROR("failed to allocate write buffer\n");
    fwrite("PATCH", 1, 5, file); // magic
    for (int i = 0; i < num; i++) {
        uint32_t offset = incbins[i].offset;
        putc(offset >> 16, file);
        putc(offset >>  8, file);
        putc(offset >>  0, file);
        size_t size = incbins[i].size;
        putc(size >> 8, file);
        putc(size >> 0, file);
        if (fseek(rom, offset, SEEK_SET)) FATAL_ERROR("seek\n");
        if (fread(readbuf, 1, size, rom) != size) FATAL_ERROR("read\n");
        if (fwrite(readbuf, 1, size, file) != size) FATAL_ERROR("write\n");
    }
    free(readbuf);
    fwrite("EOF", 1, 3, file);
    fclose(file);
}

int main() {
    puts(SPLASH);
    FILE * rom = fopen("baserom.gba", "rb");
    if (rom == NULL) FATAL_ERROR("unable to open \"baserom.gba\" for reading\n");
    FILE * ld_script = fopen("ld_script.txt", "r");
    if (ld_script == NULL) FATAL_ERROR("unable to open \"ld_script.txt\" for reading\n");
    size_t num = 0;
    struct Baserom * incbins = getAllIncbins(ld_script, &num);
    fclose(ld_script);
    if (num == 0) {
        puts("No baserom.gba incbins found!\n");
    } else {        
        collapseIncbins(incbins, &num);
        writePatch("baserom.ips", incbins, num, rom);
    }
    fclose(rom);
    free(incbins);
    puts("IPS file created at baserom.ips\n");
    return 0;
}
