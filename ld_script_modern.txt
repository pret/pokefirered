gNumMusicPlayers = 4;
gMaxLines = 0;

SECTIONS {
    . = 0x2000000;

    ewram (NOLOAD) :
    ALIGN(4)
    {
        gHeap = .;

        . = 0x1C000;

        *(ewram_data);

        . = 0x40000;
    }

    . = 0x3000000;

    iwram (NOLOAD) :
    ALIGN(4)
    {
        /* .bss starts at 0x3000000 */
        *(.bss*);
        /* .bss.code starts at 0x3001AA8 */
        src/m4a.o(.bss.code);

        /* COMMON starts at 0x30022A8 */
        *(COMMON);
        end = .;
        __end__ = .;
        . = 0x8000;
    }

    . = 0x8000000;

    .text :
    ALIGN(4)
    {
        src/rom_header.o(.text*);
        src/rom_header_gf.o(.text.*);
        src/crt0.o(.text);
        src/main.o(.text);
        *(.text*);
    } =0

    script_data :
    ALIGN(4)
    {
    	*(script_data);
    } =0

    .data :
    ALIGN(4)
    {
    	*(.data*);
    } =0

    .rodata :
    ALIGN(4)
    {
    	*(.rodata*);
    } =0

    /* DWARF 2 sections */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    .debug_info     0 : { *(.debug_info) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}
