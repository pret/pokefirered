#include <cstdio>
#include <cstring>
#include <cstdint>
#include <vector>
#include <string>
#include "ramscrgen.h"
#include "elf.h"

#define SHN_COMMON 0xFFF2

static std::string s_elfPath;
static std::string s_archiveFilePath;
static std::string s_archiveObjectPath;

static FILE *s_file;

static std::uint32_t s_sectionHeaderOffset;
static int s_sectionHeaderEntrySize;
static int s_sectionCount;
static int s_shstrtabIndex;

static std::uint32_t s_symtabOffset;
static std::uint32_t s_strtabOffset;
static std::uint32_t s_pseudoCommonSectionIndex;

static std::uint32_t s_symbolCount;
static std::uint32_t s_elfFileOffset;

struct Symbol
{
    std::uint32_t nameOffset;
    std::uint32_t size;
};

static void Seek(long offset)
{
    if (std::fseek(s_file, s_elfFileOffset + offset, SEEK_SET) != 0)
        FATAL_ERROR("error: failed to seek to %ld in \"%s\"", offset, s_elfPath.c_str());
}

static void Skip(long offset)
{
    if (std::fseek(s_file, offset, SEEK_CUR) != 0)
        FATAL_ERROR("error: failed to skip %ld bytes in \"%s\"", offset, s_elfPath.c_str());
}

static std::uint32_t ReadInt8()
{
    int c = std::fgetc(s_file);

    if (c < 0)
        FATAL_ERROR("error: unexpected EOF when reading ELF file \"%s\"\n", s_elfPath.c_str());

    return c;
}

static std::uint32_t ReadInt16()
{
    std::uint32_t val = 0;
    val |= ReadInt8();
    val |= ReadInt8() << 8;
    return val;
}

static std::uint32_t ReadInt32()
{
    std::uint32_t val = 0;
    val |= ReadInt8();
    val |= ReadInt8() << 8;
    val |= ReadInt8() << 16;
    val |= ReadInt8() << 24;
    return val;
}

static std::string ReadString()
{
    std::string s;
    char c;

    while ((c = ReadInt8()) != 0)
        s += c;

    return s;
}

static void VerifyElfIdent()
{
    char expectedMagic[4] = { 0x7F, 'E', 'L', 'F' };
    char magic[4];

    if (std::fread(magic, 4, 1, s_file) != 1)
        FATAL_ERROR("error: failed to read ELF magic from \"%s\"\n", s_elfPath.c_str());

    if (std::memcmp(magic, expectedMagic, 4) != 0)
        FATAL_ERROR("error: ELF magic did not match in \"%s\"\n", s_elfPath.c_str());

    if (std::fgetc(s_file) != 1)
        FATAL_ERROR("error: \"%s\" not 32-bit ELF\n", s_elfPath.c_str());

    if (std::fgetc(s_file) != 1)
        FATAL_ERROR("error: \"%s\" not little-endian ELF\n", s_elfPath.c_str());
}

static void ReadElfHeader()
{
    Seek(0x20);
    s_sectionHeaderOffset = ReadInt32();
    Seek(0x2E);
    s_sectionHeaderEntrySize = ReadInt16();
    s_sectionCount = ReadInt16();
    s_shstrtabIndex = ReadInt16();
}

static std::string GetSectionName(std::uint32_t shstrtabOffset, int index)
{
    Seek(s_sectionHeaderOffset + s_sectionHeaderEntrySize * index);
    std::uint32_t nameOffset = ReadInt32();
    Seek(shstrtabOffset + nameOffset);
    return ReadString();
}

static void FindTableOffsets()
{
    s_symtabOffset = 0;
    s_strtabOffset = 0;
    s_pseudoCommonSectionIndex = 0;

    Seek(s_sectionHeaderOffset + s_sectionHeaderEntrySize * s_shstrtabIndex + 0x10);
    std::uint32_t shstrtabOffset = ReadInt32();

    for (int i = 0; i < s_sectionCount; i++)
    {
        std::string name = GetSectionName(shstrtabOffset, i);

        if (name == ".symtab")
        {
            if (s_symtabOffset)
                FATAL_ERROR("error: mutiple .symtab sections found in \"%s\"\n", s_elfPath.c_str());
            Seek(s_sectionHeaderOffset + s_sectionHeaderEntrySize * i + 0x10);
            s_symtabOffset = ReadInt32();
            std::uint32_t size = ReadInt32();
            s_symbolCount = size / 16;
        }
        else if (name == ".strtab")
        {
            if (s_strtabOffset)
                FATAL_ERROR("error: mutiple .strtab sections found in \"%s\"\n", s_elfPath.c_str());
            Seek(s_sectionHeaderOffset + s_sectionHeaderEntrySize * i + 0x10);
            s_strtabOffset = ReadInt32();
        } else if (name == "common_data") {
            if (s_pseudoCommonSectionIndex) {
                FATAL_ERROR("error: mutiple common_data sections found in \"%s\"\n", s_elfPath.c_str());
            }
            s_pseudoCommonSectionIndex = i;
        }
    }

    if (!s_symtabOffset)
        FATAL_ERROR("error: couldn't find .symtab section in \"%s\"\n", s_elfPath.c_str());

    if (!s_strtabOffset)
        FATAL_ERROR("error: couldn't find .strtab section in \"%s\"\n", s_elfPath.c_str());
}

static std::vector<std::pair<std::string, std::uint32_t>> GetCommonSymbols_Shared()
{
    VerifyElfIdent();
    ReadElfHeader();
    FindTableOffsets();

    std::vector<std::pair<std::string, std::uint32_t>> commonSymbols;

    if (s_pseudoCommonSectionIndex) {
        std::vector<Symbol> commonSymbolVec;
    
        Seek(s_symtabOffset);
    
        for (std::uint32_t i = 0; i < s_symbolCount; i++)
        {
            Symbol sym;
            sym.nameOffset = ReadInt32();
            Skip(4);
            sym.size = ReadInt32();
            Skip(2);
            std::uint16_t sectionIndex = ReadInt16();
            if (sectionIndex == s_pseudoCommonSectionIndex)
                commonSymbolVec.push_back(sym);
        }
    
        for (const Symbol& sym : commonSymbolVec)
        {
            Seek(s_strtabOffset + sym.nameOffset);
            std::string name = ReadString();
            if (name == "$d" || name == "") {
                continue;
            }
            commonSymbols.emplace_back(name, sym.size);
        }
    }

    return commonSymbols;
}

std::vector<std::pair<std::string, std::uint32_t>> GetCommonSymbols(std::string sourcePath, std::string path)
{
    s_elfFileOffset = 0;
    if (path[0] == '*')
        FATAL_ERROR("error: library common syms are unsupported (filename: \"%s\")\n", path.c_str());

    s_elfPath = sourcePath + "/" + path;
    s_file = std::fopen(s_elfPath.c_str(), "rb");

    if (s_file == NULL)
        FATAL_ERROR("error: failed to open \"%s\" for reading\n", path.c_str());

    return GetCommonSymbols_Shared();
}
