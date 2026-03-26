gNumMusicPlayers = 4;
gMaxLines = 0;

MEMORY
{
    EWRAM (rwx) : ORIGIN = 0x2000000, LENGTH = 256K
    IWRAM (rwx) : ORIGIN = 0x3000000, LENGTH = 32K
    ROM    (rx) : ORIGIN = 0x8000000, LENGTH = 32M
}

SECTIONS {

    ewram 0x2000000 (NOLOAD) :
    ALIGN(4)
    {
        gHeap = .;

        . = 0x1C000;

        *(ewram_data);
    } > EWRAM

    iwram 0x3000000 (NOLOAD) :
    ALIGN(4)
    {
        /* .bss starts at 0x3000000 */
        *(.bss*);
        /* .bss.code starts at 0x3001AA8 */
        src/m4a.o(.bss.code);

        /* COMMON starts at 0x30022A8 */
        *(COMMON);
        *(common_data);
        end = .;
        __end__ = .;
    } > IWRAM

    . = 0x8000000;

    .text :
    ALIGN(4)
    {
        src/rom_header.o(.text*);
        src/rom_header_gf.o(.text.*);
        src/crt0.o(.text);
        src/main.o(.text);
        *(.text*);
    } > ROM =0

    script_data :
    ALIGN(4)
    {
    	*(script_data);
    } > ROM =0

    .data :
    ALIGN(4)
    {
    	*(.data*);
    } > ROM =0

    .rodata :
    ALIGN(4)
    {
    	*(.rodata*);
    } > ROM =0

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
