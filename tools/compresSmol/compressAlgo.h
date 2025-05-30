#ifndef COMPRES_SMOL
#define COMPRES_SMOL
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <iostream>
#include <mutex>
#include <thread>
#include <string>
#include <bitset>
#include "fileDispatcher.h"
#include "tANS.h"

#define OVERWORLD_16X16         256
#define OVERWORLD_32X32         1024

#define TANS_TABLE_SIZE         64
#define LO_CONTINUE_BIT         0x80
#define LO_LOW_BITS_MASK        0x7f
#define LO_NUM_LOW_BITS         0x7
#define BYTE_MASK               0xff
#define SHORT_MASK              0xffff
#define NIBBLE_MASK             0xf
#define NUM_SHORT_BITS          0xf
#define LENGTH_MOD_MASK         0xf
#define INITIAL_STATE_MASK      0x3f
#define MODE_MASK               0x1f
#define IMAGE_SIZE_MASK         0x3fff
#define IMAGE_SIZE_OFFSET       4
#define SYM_SIZE_MASK           0x3fff
#define SYM_SIZE_OFFSET         18
#define BITSTREAM_SIZE_MASK     0x1fff
#define BITSTREAM_SIZE_OFFSET   6
#define LO_SIZE_MASK            0x1fff
#define LO_SIZE_OFFSET          19

#define IMAGE_SIZE_MODIFIER     4

enum CompressionMode {
    LZ77 = 0,
    BASE_ONLY = 1,
    ENCODE_SYMS = 2,
    ENCODE_DELTA_SYMS = 3,
    ENCODE_LO = 4,
    ENCODE_BOTH = 5,
    ENCODE_BOTH_DELTA_SYMS = 6,
    IS_FRAME_CONTAINER = 7,
    IS_TILEMAP = 8,
};

struct ShortCopy {
    size_t index;
    size_t length;
    size_t offset;
    unsigned short firstSymbol;
    std::vector<unsigned short> usSequence;
    ShortCopy();
    ShortCopy(size_t index, size_t length, size_t offset, std::vector<unsigned short> usSequence);
};

struct CompressionInstruction {
    size_t length;
    size_t offset;
    size_t index;
    unsigned char firstSymbol;
    std::vector<unsigned char> symbols;
    std::vector<unsigned char> bytes;
    void buildBytes();
    bool verifyInstruction();
};

struct ShortCompressionInstruction {
    size_t length;
    size_t offset;
    size_t index;
    unsigned short firstSymbol;
    std::vector<unsigned short> symbols;
    std::vector<unsigned char> loBytes;
    std::vector<unsigned short> symShorts;
    void buildBytes();
    bool verifyInstruction();
};

struct SortedShortElement {
    size_t index;
    ShortCopy copy;
    bool isRun = false;
    bool isCopy = false;
    SortedShortElement();
    SortedShortElement(size_t index, ShortCopy copy);
};

struct CompressedImage {
    std::string fileName;
    CompressionMode mode;
    size_t lzSize;
    size_t loSize;
    size_t symSize;
    size_t bitreamSize = 0;
    size_t rawNumBytes;
    int initialState;
    std::vector<unsigned int> headers;
    unsigned int loFreqs[3];
    unsigned int symFreqs[3];
    size_t compressedSize;
    bool isValid = false;
    std::vector<unsigned int> writeVec;
    std::vector<unsigned int> tANSbits;
    std::vector<unsigned int> otherBits;
    std::vector<unsigned short> symVec;
    std::vector<unsigned char> loVec;
};

struct InputSettings {
    bool canEncodeLO = true;
    bool canEncodeSyms = true;
    bool canDeltaSyms = true;
    bool shouldCompare = false;
    bool useFrames = false;
    InputSettings();
    InputSettings(bool canEncodeLO, bool canEncodeSyms, bool canDeltaSyms);
};

struct DataVecs {
    std::vector<unsigned char> loVec;
    std::vector<unsigned short> symVec;
};

void analyzeImages(std::vector<CompressedImage> *allImages, std::mutex *imageMutex, FileDispatcher *dispatcher, std::mutex *dispatchMutex, InputSettings settings);

CompressedImage processImage(std::string fileName, InputSettings settings);
CompressedImage processImageFrames(std::string fileName, InputSettings settings);
CompressedImage processImageData(std::vector<unsigned char> input, InputSettings settings, std::string fileName);

std::vector<unsigned int> readFileAsUInt(std::string filePath);

size_t getCompressedSize(CompressedImage *pImage);

std::vector<ShortCopy> getShortCopies(std::vector<unsigned short> input, size_t minLength);
bool verifyShortCopies(std::vector<ShortCopy> *pCopies, std::vector<unsigned short> *pImage);

std::vector<int> getNormalizedCounts(std::vector<size_t> input);
std::vector<unsigned int> getFreqWriteInts(std::vector<int> input);
std::vector<unsigned int> getNewHeaders(CompressionMode mode, size_t imageSize, size_t symLength, int initialState, size_t bitstreamSize, size_t loLength);
int findInitialState(EncodeCol encodeCol, unsigned char firstSymbol);
CompressedImage fillCompressVecNew(std::vector<unsigned char> loVec, std::vector<unsigned short> symVec, CompressionMode mode, size_t imageBytes, std::string name);
std::vector<ShortCompressionInstruction> getShortInstructions(std::vector<ShortCopy> copies, size_t lengthMod);
std::vector<unsigned char> getLosFromInstructions(std::vector<ShortCompressionInstruction> instructions);
std::vector<unsigned short> getSymsFromInstructions(std::vector<ShortCompressionInstruction> instructions);
std::vector<int> unpackFrequencies(unsigned int pInts[3]);
CompressedImage getDataFromUIntVec(std::vector<unsigned int> *pInput);
CompressedImage readNewHeader(std::vector<unsigned int> *pInput);
std::vector<unsigned int> getUIntVecFromData(CompressedImage *pImage);

std::vector<unsigned short> decodeBytesShort(std::vector<unsigned char> *pLoVec, std::vector<unsigned short> *pSymVec);
std::vector<unsigned short> decodeImageShort(CompressedImage *pInput);
DataVecs decodeDataVectorsNew(CompressedImage *pInput);

size_t decodeNibbles(std::vector<DecodeCol> decodeTable, std::vector<unsigned int> *bits, int *currState, std::vector<unsigned char> *nibbleVec, size_t currBitIndex, size_t numNibbles);

bool compareVectorsShort(std::vector<unsigned short> *pVec1, std::vector<unsigned short> *pVec2);

bool verifyCompressionShort(CompressedImage *pInput, std::vector<unsigned short> *pImage);
bool verifyBytesShort(std::vector<unsigned char> *pLoVec, std::vector<unsigned short> *pSymVec, std::vector<unsigned short> *pImage);
bool verifyUIntVecShort(std::vector<unsigned int> *pInput, std::vector<unsigned short> *pImage);

std::vector<unsigned short> readRawDataVecs(std::vector<unsigned int> *pInput);

bool isModeLoEncoded(CompressionMode mode);
bool isModeSymEncoded(CompressionMode mode);
bool isModeSymDelta(CompressionMode mode);

void deltaEncode(std::vector<unsigned char> *buffer, int length);
void deltaDecode(std::vector<unsigned char> *buffer, int length);

std::vector<int> getTestFreqs(std::vector<int> freqs, std::string name);
#endif
