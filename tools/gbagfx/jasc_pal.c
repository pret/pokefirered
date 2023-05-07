// Copyright (c) 2015 YamaArashi

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include "global.h"
#include "gfx.h"
#include "util.h"

// Read/write JASC palette files.

// Format of a JASC palette file, line by line:
// "JASC-PAL" (signature)
// "0100" (version; seems to always be "0100")
// "<NUMBER_OF_COLORS>" (number of colors in decimal)
//
// <NUMBER_OF_COLORS> times:
// "<RED> <GREEN> <BLUE> <ALPHA (discarded if present)>" (color entry)
//
// Line endings can be \r\n or \n
//
// Each color component is a decimal number from 0 to 255.
// Examples:
// Black - "0 0 0"
// Blue  - "0 0 255"
// Brown - "150 75 0"
// White  - "255 255 255 255"
//                       ^~~ ignored

// 15 chars of color info, \r\n or \n, and \0
#define MAX_LINE_LENGTH 18

int ReadJascPaletteLine(FILE *fp, char *line)
{
    // Read line up to first newline char (inclusive) or [MAX_LINE_LENGTH-1]
    if(fgets(line, MAX_LINE_LENGTH, fp) == NULL)
        return 0;
    line[strcspn(line, "\r\n")] = 0; // Terminate the line at the first newline char
    return 1;
}

void ReadJascPalette(char *path, struct Palette *palette)
{
    char line_buffer[MAX_LINE_LENGTH];
    int red, green, blue;
    int numColors;

    FILE *fp = fopen(path, "r");

    if (!fp)
        FATAL_ERROR("Cannot open JASC-PAL file \"%s\" with error: %s\n", path, strerror(errno));

    // Check JASC-PAL Header
    ReadJascPaletteLine(fp, line_buffer);
    if (strcmp(line_buffer, "JASC-PAL") != 0)
        FATAL_ERROR("Invalid signature, expected \"JASC-PAL\", read: \"%s\"\n",line_buffer);

    ReadJascPaletteLine(fp, line_buffer);
    if (strcmp(line_buffer, "0100") != 0)
        FATAL_ERROR("Unsuported JASC-PAL version.\n");

    // Get number of colors in palette
    ReadJascPaletteLine(fp, line_buffer);
    numColors = strtol(line_buffer, NULL, 10);

    // Check for sensible number of colors
    if (numColors > 0 && numColors <= 256)
    {
        palette->numColors = numColors;
    } else {
        FATAL_ERROR("Out-of-Bounds number of colors specifed: %i. Maximum supported is 256\n", numColors);
    }

    // Get color entries
    for (int i = 0; i < numColors; ++i)
    {
        if (ReadJascPaletteLine(fp, line_buffer) == 0)
            FATAL_ERROR("Failed to read color index %i\n", i);
        if (sscanf(line_buffer, "%d %d %d", &red, &green, &blue) != 3)
            FATAL_ERROR("Invalid color format in color \"%s\"\n", line_buffer);

        palette->colors[i].red = red;
        palette->colors[i].green = green;
        palette->colors[i].blue = blue;
    }
    fclose(fp);
}

void WriteJascPalette(char *path, struct Palette *palette)
{
    FILE *fp = fopen(path, "wb");

    fputs("JASC-PAL\r\n", fp);
    fputs("0100\r\n", fp);
    fprintf(fp, "%d\r\n", palette->numColors);

    for (int i = 0; i < palette->numColors; i++)
    {
        struct Color *color = &palette->colors[i];
        fprintf(fp, "%d %d %d\r\n", color->red, color->green, color->blue);
    }

    fclose(fp);
}
