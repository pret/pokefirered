#include "compressAlgo.h"

std::vector<ShortCopy> getShortCopies(std::vector<unsigned short> input, size_t minLength)
{
    std::vector<ShortCopy> copies;
    for (size_t startIndex = 1; startIndex < input.size(); startIndex++)
    {
        size_t longestLength = 0;
        size_t longestOffset;
        for (size_t searchOffset = 1; searchOffset <= startIndex && searchOffset < 32767; searchOffset++)
        {
            size_t currLength = 0;
            while (input[startIndex + currLength] == input[startIndex + currLength - searchOffset]
                && startIndex + currLength < input.size())
                currLength++;
            if (currLength > longestLength)
            {
                longestLength = currLength;
                longestOffset = searchOffset;
            }
        }

        if (longestLength > 32767)
            longestLength = 32767;
        if (longestLength >= minLength)
        {
            std::vector<unsigned short>::const_iterator start = input.begin() + startIndex;
            std::vector<unsigned short>::const_iterator end = input.begin() + startIndex + longestLength;
            copies.push_back(ShortCopy(startIndex, longestLength, longestOffset, std::vector<unsigned short>(start, end)));
            copies[copies.size() - 1].firstSymbol = input[startIndex - 1];
            startIndex += longestLength;
        }
    }
    std::vector<unsigned short> checkVec(input.size());
    for (ShortCopy copy : copies)
        for (size_t i = 0; i <= copy.length; i++)
            checkVec[copy.index + i - 1]++;
    size_t currStart = 0;
    size_t currLength = 1;
    unsigned short prevSym = checkVec[0];
    for (size_t i = 1; i < checkVec.size(); i++)
    {
        unsigned short currSym = checkVec[i];
        if (currSym == 0 && prevSym == 0)
            currLength++;
        else if (currSym == 0 && prevSym == 1)
        {
            currStart = i;
            currLength = 1;
        }
        else if (currSym == 1 && prevSym == 0)
        {
            std::vector<unsigned short>::const_iterator start = input.begin() + currStart;
            std::vector<unsigned short>::const_iterator end = input.begin() + currStart + currLength;
            copies.push_back(ShortCopy(currStart, currLength, 0, std::vector<unsigned short>(start, end)));
        }
        prevSym = currSym;
    }
    if (prevSym == 0)
    {
        std::vector<unsigned short>::const_iterator start = input.begin() + currStart;
        std::vector<unsigned short>::const_iterator end = input.begin() + currStart + currLength;
        copies.push_back(ShortCopy(currStart, currLength, 0, std::vector<unsigned short>(start, end)));
    }

    return copies;
}


bool verifyShortCopies(std::vector<ShortCopy> *pCopies, std::vector<unsigned short> *pImage)
{
    std::vector<unsigned short> decodedImage(pImage->size());
    for (ShortCopy copy : (*pCopies))
    {
        if (copy.offset == 0)
        {
            for (size_t i = 0; i < copy.length; i++)
                decodedImage[copy.index + i] = copy.usSequence[i];
        }
        else
        {
            decodedImage[copy.index - 1] = copy.firstSymbol;
            for (size_t i = 0; i < copy.length; i++)
                decodedImage[copy.index + i] = (*pImage)[copy.index + i - copy.offset];
        }
    }
    for (size_t i = 0; i < decodedImage.size(); i++)
        if (decodedImage[i] != (*pImage)[i])
            return false;
    return true;
}

SortedShortElement::SortedShortElement() {}

SortedShortElement::SortedShortElement(size_t index, ShortCopy copy)
{
    this->index = index;
    this->copy = copy;
    isCopy = true;
}

std::vector<ShortCompressionInstruction> getShortInstructions(std::vector<ShortCopy> copies, size_t lengthMod)
{
    std::vector<ShortCompressionInstruction> instructions;
    std::vector<SortedShortElement> unsortedElements;
    std::vector<SortedShortElement> sortedElements;

    for (ShortCopy copy : copies)
        unsortedElements.push_back(SortedShortElement(copy.index, copy));

    while (unsortedElements.size() != 0)
    {
        size_t smallestIndex = 0;
        for (size_t i = 0; i < unsortedElements.size(); i++)
        {
            if (unsortedElements[i].index < unsortedElements[smallestIndex].index)
            {
                smallestIndex = i;
            }
        }
        sortedElements.push_back(unsortedElements[smallestIndex]);
        unsortedElements.erase(unsortedElements.begin() + smallestIndex);
    }
    for (size_t i = 0; i < sortedElements.size(); i++)
    {
        ShortCompressionInstruction currInstruction;
        currInstruction.index = sortedElements[i].index;
        currInstruction.offset = sortedElements[i].copy.offset;
        currInstruction.length = sortedElements[i].copy.length;
        currInstruction.symbols = sortedElements[i].copy.usSequence;
        currInstruction.firstSymbol = sortedElements[i].copy.firstSymbol;
        currInstruction.buildBytes();
        instructions.push_back(currInstruction);
    }
    return instructions;
}

void ShortCompressionInstruction::buildBytes()
{
    if (offset != 0)
    {
        //  Current pattern either exists earlier in the image
        //  or it's a long run of the same value
        size_t currLength = length;
        loBytes.push_back(currLength & LO_LOW_BITS_MASK);
        currLength = currLength >> LO_NUM_LOW_BITS;
        if (currLength != 0)
        {
            loBytes[loBytes.size() - 1] += LO_CONTINUE_BIT;
            loBytes.push_back(currLength & BYTE_MASK);
        }
        size_t currOffset = offset;
        loBytes.push_back(currOffset & LO_LOW_BITS_MASK);
        currOffset = currOffset >> LO_NUM_LOW_BITS;
        if (currOffset != 0)
        {
            loBytes[loBytes.size() - 1] += LO_CONTINUE_BIT;
            loBytes.push_back(currOffset & BYTE_MASK);
        }
        symShorts.push_back(firstSymbol);
    }
    else
    {
        //  The current pattern doesn't exist earlier in the image
        //  it has to be written section by section
        //  Set LENGTH parameter to 0, and use OFFSET parameter as length
        loBytes.push_back(0);
        size_t currLength = length;
        loBytes.push_back(currLength & LO_LOW_BITS_MASK);
        currLength = currLength >> LO_NUM_LOW_BITS;
        if (currLength != 0)
        {
            loBytes[loBytes.size() - 1] += LO_CONTINUE_BIT;
            loBytes.push_back(currLength & BYTE_MASK);
        }
        for (unsigned short currSymbol : symbols)
            symShorts.push_back(currSymbol);
    }
}

void CompressionInstruction::buildBytes()
{
    std::vector<unsigned char> currBytes;
    if (offset != 0)
    {
        size_t currLength = length;
        currBytes.push_back(currLength & 0x7f);
        currLength = currLength >> 7;
        if (currLength != 0)
        {
            currBytes[currBytes.size() - 1] += 128;
            currBytes.push_back(currLength & 0xff);
        }
        size_t currOffset = offset;
        currBytes.push_back(currOffset & 0x7f);
        currOffset = currOffset >> 7;
        if (currOffset != 0)
        {
            currBytes[currBytes.size() - 1] += 128;
            currBytes.push_back(currOffset & 0xff);
        }
        currBytes.push_back(firstSymbol);
    }
    else
    {
        currBytes.push_back(0);
        size_t currLength = length;
        currBytes.push_back(currLength & 0x7f);
        currLength = currLength >> 7;
        if (currLength != 0)
        {
            currBytes[currBytes.size() - 1] += 128;
            currBytes.push_back(currLength & 0xff);
        }
        for (unsigned char currSymbol : symbols)
            currBytes.push_back(currSymbol);
    }
    bytes = currBytes;
}

std::vector<unsigned char> getLosFromInstructions(std::vector<ShortCompressionInstruction> instructions)
{
    std::vector<unsigned char> loVec;
    for (ShortCompressionInstruction instruction : instructions)
    {
        for (unsigned char uc : instruction.loBytes)
            loVec.push_back(uc);
    }
    return loVec;
}

std::vector<unsigned short> getSymsFromInstructions(std::vector<ShortCompressionInstruction> instructions)
{
    std::vector<unsigned short> symvec;
    for (ShortCompressionInstruction instruction : instructions)
    {
        for (unsigned short uc : instruction.symShorts)
            symvec.push_back(uc);
    }
    return symvec;
}

std::vector<unsigned short> decodeBytesShort(std::vector<unsigned char> *pLoVec, std::vector<unsigned short> *pSymVec)
{
    std::vector<unsigned short> decodedImage;
    size_t loIndex = 0;
    size_t symIndex = 0;
    while (loIndex < pLoVec->size())
    {
        size_t currLength = 0;
        size_t currOffset = 0;
        currLength += (*pLoVec)[loIndex] & LO_LOW_BITS_MASK;
        loIndex++;
        if (((*pLoVec)[loIndex-1] & LO_CONTINUE_BIT) == LO_CONTINUE_BIT)
        {
            currLength += (*pLoVec)[loIndex] << LO_NUM_LOW_BITS;
            loIndex++;
        }
        currOffset += (*pLoVec)[loIndex] & LO_LOW_BITS_MASK;
        loIndex++;
        if (((*pLoVec)[loIndex-1] & LO_CONTINUE_BIT) == LO_CONTINUE_BIT)
        {
            currOffset += (*pLoVec)[loIndex] << LO_NUM_LOW_BITS;
            loIndex++;
        }
        if (currLength != 0)
        {
            decodedImage.push_back((*pSymVec)[symIndex]);
            symIndex++;
            for (size_t i = 0; i < currLength; i++)
                decodedImage.push_back(decodedImage[decodedImage.size() - currOffset]);
        }
        else
        {
            for (size_t i = 0; i < currOffset; i++)
            {
                decodedImage.push_back((*pSymVec)[symIndex]);
                symIndex++;
            }
        }
    }
    return decodedImage;
}

bool verifyBytesShort(std::vector<unsigned char> *pLoVec, std::vector<unsigned short> *pSymVec, std::vector<unsigned short> *pImage)
{
    std::vector<unsigned short> shorts = decodeBytesShort(pLoVec, pSymVec);
    return compareVectorsShort(&shorts, pImage);
}

bool compareVectorsShort(std::vector<unsigned short> *pVec1, std::vector<unsigned short> *pVec2)
{
    if (pVec1->size() != pVec2->size())
        return false;
    for (size_t i = 0; i < pVec1->size(); i++)
        if ((*pVec1)[i] != (*pVec2)[i])
            return false;
    return true;
}

std::vector<unsigned char> readFileAsUC(std::string filePath)
{
    std::ifstream iStream;
    iStream.open(filePath.c_str(), std::ios::binary);
    if (!iStream.is_open())
    {
        fprintf(stderr, "Error: Couldn't open %s for reading bytes\n", filePath.c_str());
        return std::vector<unsigned char>(0);
    }
    iStream.ignore( std::numeric_limits<std::streamsize>::max() );
    std::streamsize size = iStream.gcount();
    iStream.clear();
    iStream.seekg( 0, std::ios_base::beg );
    std::vector<unsigned char> ucVec(size);
    iStream.read((char*)(&ucVec[0]), size);
    iStream.close();
    return ucVec;
}

CompressedImage processImage(std::string fileName, InputSettings settings)
{
    CompressedImage image;
    std::vector<unsigned char> input = readFileAsUC(fileName);
    if (settings.useFrames)
    {
        /*
        //  Determine number of frames
        size_t totalPixels = input.size()*2;
        //  Split input and append
        size_t smallFrames = totalPixels/OVERWORLD_16X16;
        size_t largeFrames = totalPixels/OVERWORLD_32X32;
        */
    }
    else
    {
        image = processImageData(input, settings, fileName);
    }
    return image;
}

CompressedImage processImageFrames(std::string fileName, InputSettings settings)
{
    CompressedImage image;
    std::vector<unsigned char> input = readFileAsUC(fileName);
    std::vector<std::vector<unsigned char>> allInputs(4);
    size_t totalSize = input.size();
    size_t partialSize = totalSize/4;
    size_t subIndex = 0;
    size_t inputIndex = 0;
    std::vector<size_t> frameOffsets;
    for (unsigned char currChar : input)
    {
        frameOffsets.push_back(image.otherBits.size());
        if (subIndex == partialSize)
        {
            subIndex = 0;
            inputIndex++;
        }
        allInputs[inputIndex].push_back(currChar);
        subIndex++;
    }
    for (size_t i = 0; i < 4; i++)
    {
        CompressedImage tempImage = processImageData(allInputs[i], settings, fileName);
        for (unsigned int currVal : tempImage.writeVec)
            image.otherBits.push_back(currVal);
    }
    unsigned int header = IS_FRAME_CONTAINER;
    image.writeVec.push_back(header);
    for (size_t i = 0; i < 4; i++)
        image.writeVec.push_back((unsigned int)frameOffsets[i]);
    for (unsigned int currVal : image.otherBits)
        image.writeVec.push_back(currVal);
    image.isValid = true;

    return image;
}

CompressedImage processImageData(std::vector<unsigned char> input, InputSettings settings, std::string fileName)
{
    CompressedImage bestImage;
    CompressionMode someMode;
    bool hasImage = false;
    std::vector<unsigned char> rawBase = input;
    std::vector<unsigned short> usBase(rawBase.size()/2);
    memcpy(usBase.data(), rawBase.data(), rawBase.size());
    size_t baseLZsize = 0;
    bool byteFail = false;
    bool copyFail = false;
    bool compressionFail = false;
    bool uIntConversionFail = false;
    if (settings.shouldCompare)
    {
        std::string lzName = fileName + ".lz";
        baseLZsize = getFileSize(lzName);
    }
    std::vector<unsigned char> bestLO;
    std::vector<unsigned short> bestSym;
    std::vector<ShortCompressionInstruction> bestInstructions;
    for (size_t minCodeLength = 2; minCodeLength <= 15; minCodeLength++)
    {
        std::vector<ShortCopy> shortCopies = getShortCopies(usBase, minCodeLength);
        if (!verifyShortCopies(&shortCopies, &usBase))
        {
            copyFail = true;
            continue;
        }
        std::vector<ShortCompressionInstruction> shortInstructions = getShortInstructions(shortCopies, minCodeLength-1);
        std::vector<unsigned char> loVec = getLosFromInstructions(shortInstructions);
        std::vector<unsigned short> symVec = getSymsFromInstructions(shortInstructions);
        if (!verifyBytesShort(&loVec, &symVec, &usBase))
        {
            byteFail = true;
            continue;
        }
        CompressionMode mode = BASE_ONLY;
        //std::vector<CompressionMode> modesToUse = {ENCODE_SYMS};
        std::vector<CompressionMode> modesToUse = {BASE_ONLY, ENCODE_SYMS, ENCODE_DELTA_SYMS, ENCODE_LO, ENCODE_BOTH, ENCODE_BOTH_DELTA_SYMS};
        if (fileName.find("test/compression/") != std::string::npos)
        {
            if (fileName.find("mode_0.4bpp") != std::string::npos)
                modesToUse = {BASE_ONLY};
            else if (fileName.find("mode_1.4bpp") != std::string::npos)
                modesToUse = {ENCODE_SYMS};
            else if (fileName.find("mode_2.4bpp") != std::string::npos)
                modesToUse = {ENCODE_DELTA_SYMS};
            else if (fileName.find("mode_3.4bpp") != std::string::npos)
                modesToUse = {ENCODE_LO};
            else if (fileName.find("mode_4.4bpp") != std::string::npos)
                modesToUse = {ENCODE_BOTH};
            else if (fileName.find("mode_5.4bpp") != std::string::npos)
                modesToUse = {ENCODE_BOTH_DELTA_SYMS};
            else if (fileName.find("test/compression/table_") != std::string::npos)
                modesToUse = {ENCODE_SYMS};

            if (modesToUse.size() == 1)
            {
                settings.canDeltaSyms = true;
                settings.canEncodeLO = true;
                settings.canEncodeSyms = true;
            }
        }

        for (CompressionMode currMode : modesToUse)
        {
            mode = currMode;
            if (!settings.canDeltaSyms
             && (mode == ENCODE_DELTA_SYMS
              || mode == ENCODE_BOTH_DELTA_SYMS))
                continue;
            if (!settings.canEncodeLO
             && (mode == ENCODE_LO
              || mode == ENCODE_BOTH
              || mode == ENCODE_BOTH_DELTA_SYMS))
                continue;
            if (!settings.canEncodeSyms
             && (mode == ENCODE_SYMS
              || mode == ENCODE_BOTH
              || mode == ENCODE_DELTA_SYMS
              || mode == ENCODE_BOTH_DELTA_SYMS))
                continue;
            CompressedImage image = fillCompressVecNew(loVec, symVec, mode,rawBase.size(), fileName);
            if (!verifyCompressionShort(&image, &usBase))
            {
                compressionFail = true;
                continue;
            }
            std::vector<unsigned int> uiVec = getUIntVecFromData(&image);
            std::vector<unsigned short> decodedImage = readRawDataVecs(&uiVec);
            if (!compareVectorsShort(&decodedImage, &usBase))
            {
                uIntConversionFail = true;
                continue;
            }
            image.compressedSize = uiVec.size() * 4;
            if (!hasImage)
            {
                bestLO = loVec;
                bestSym = symVec;
                bestInstructions = shortInstructions;
                bestImage = image;
                hasImage = true;
                bestImage.writeVec = uiVec;
                someMode = mode;
            }
            else if (image.compressedSize < bestImage.compressedSize)
            {
                bestLO = loVec;
                bestSym = symVec;
                bestInstructions = shortInstructions;
                bestImage = image;
                hasImage = true;
                bestImage.writeVec = uiVec;
                someMode = mode;
            }
        }
    }
    bestImage.mode = someMode;
    bestImage.fileName = fileName;
    bestImage.lzSize = baseLZsize;
    bestImage.rawNumBytes = rawBase.size();
    if (hasImage)
        bestImage.isValid = true;
    else
    {
        fprintf(stderr, "Failed to compress image %s\nErrors: ", fileName.c_str());
        if (copyFail)
            fprintf(stderr, "CopyProcessing ");
        if (byteFail)
            fprintf(stderr, "ByteConversion ");
        if (compressionFail)
            fprintf(stderr, "Compression ");
        if (uIntConversionFail)
            fprintf(stderr, "uIntConversion ");
        printf("\n");
    }
    return bestImage;
}

CompressedImage getDataFromUIntVec(std::vector<unsigned int> *pInput)
{
    CompressedImage image = readNewHeader(pInput);

    size_t readIndex = 2;

    bool loEncoded = isModeLoEncoded(image.mode);
    bool symEncoded = isModeSymEncoded(image.mode);

    if (loEncoded)
    {
        image.loFreqs[0] = (*pInput)[readIndex];
        image.loFreqs[1] = (*pInput)[readIndex + 1];
        image.loFreqs[2] = (*pInput)[readIndex + 2];
        readIndex += 3;
    }
    if (symEncoded)
    {
        image.symFreqs[0] = (*pInput)[readIndex];
        image.symFreqs[1] = (*pInput)[readIndex + 1];
        image.symFreqs[2] = (*pInput)[readIndex + 2];
        readIndex += 3;
    }
    if (loEncoded || symEncoded)
    {
        for (size_t i = 0; i < image.bitreamSize; i++)
        {
            image.tANSbits.push_back((*pInput)[readIndex]);
            readIndex++;
        }
    }
    std::vector<unsigned char> remainders;
    while (readIndex < pInput->size())
    {
        unsigned int currInt = (*pInput)[readIndex];
        for (size_t i = 0; i < 4; i++)
            remainders.push_back((currInt >> (8*i)) & 0xff);
        readIndex++;
    }
    size_t remIndex = 0;
    if (!symEncoded)
    {
        for (size_t i = 0; i < image.symSize; i++)
        {
            unsigned short currSym = remainders[remIndex];
            remIndex++;
            currSym += remainders[remIndex] << 8;
            remIndex++;
            image.symVec.push_back(currSym);
        }
    }
    if (!loEncoded)
    {
        for (size_t i = 0; i < image.loSize; i++)
        {
            unsigned char currChar = remainders[remIndex];
            remIndex++;
            image.loVec.push_back(currChar);
        }
    }

    return image;
}

bool verifyCompressionShort(CompressedImage *pInput, std::vector<unsigned short> *pImage)
{
    std::vector<unsigned short> decodedImage = decodeImageShort(pInput);
    return compareVectorsShort(&decodedImage, pImage);
}

std::vector<unsigned short> decodeImageShort(CompressedImage *pInput)
{
    DataVecs dataVecs = decodeDataVectorsNew(pInput);
    return decodeBytesShort(&dataVecs.loVec, &dataVecs.symVec);
}

DataVecs decodeDataVectorsNew(CompressedImage *pInput)
{
    CompressedImage headerValues = readNewHeader(&pInput->headers);
    size_t loSize = headerValues.loSize;
    size_t symSize = headerValues.symSize;
    CompressionMode mode = headerValues.mode;
    bool loEncoded = isModeLoEncoded(mode);
    bool symEncoded = isModeSymEncoded(mode);
    bool symDelta = isModeSymDelta(mode);
    std::vector<int> loFreqs = unpackFrequencies(&pInput->loFreqs[0]);
    std::vector<int> symFreqs = unpackFrequencies(&pInput->symFreqs[0]);
    std::vector<unsigned char> symbols = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    std::vector<DecodeCol> loDecode;
    std::vector<DecodeCol> symDecode;

    std::vector<unsigned char> loVec(loSize);
    std::vector<unsigned short> symVec(symSize);
    std::vector<unsigned char> loNibbles(loSize*2);
    std::vector<unsigned char> symNibbles(symSize*4);

    if (loEncoded)
    {
        loDecode = createDecodingTable(symbols, loFreqs);
    }
    if (symEncoded)
    {
        symDecode = createDecodingTable(symbols, symFreqs);
    }

    std::vector<unsigned int> allBits(pInput->tANSbits.size()*32);
    size_t currIndex = 0;
    for (unsigned int ui : pInput->tANSbits)
        for (size_t i = 0; i < 32; i++)
        {
            unsigned int currVal = (ui >> i) & 0x1;
            allBits[currIndex] = currVal;
            currIndex++;
        }

    if (!symEncoded)
        for (size_t i = 0; i < symSize; i++)
            symVec[i] = pInput->symVec[i];
    if (!loEncoded)
        for (size_t i = 0; i < loSize; i++)
            loVec[i] = pInput->loVec[i];

    size_t bitIndex = 0;
    int currState = pInput->initialState;
    if (loEncoded)
    {
        bitIndex = decodeNibbles(loDecode, &allBits, &currState, &loNibbles, bitIndex, loSize*2);
    }
    if (loEncoded)
        for (size_t i = 0; i < loVec.size(); i++)
            loVec[i] = loNibbles[2*i] + (loNibbles[2*i + 1] << 4);

    if (symEncoded)
    {
        bitIndex = decodeNibbles(symDecode, &allBits, &currState, &symNibbles, bitIndex, symSize*4);
        if (symDelta)
            deltaDecode(&symNibbles, symNibbles.size());
    }
    if (symEncoded)
        for (size_t i = 0; i < symVec.size(); i++)
            for (size_t j = 0; j < 4; j++)
                symVec[i] += (unsigned short)symNibbles[i*4 + j] << (j*4);

    DataVecs returnData;
    returnData.loVec = loVec;
    returnData.symVec = symVec;
    return returnData;
}

void analyzeImages(std::vector<CompressedImage> *allImages, std::mutex *imageMutex, FileDispatcher *dispatcher, std::mutex *dispatchMutex, InputSettings settings)
{
    std::string fileName = "Initial Value";
    while (fileName != "")
    {
        dispatchMutex->lock();
        fileName = dispatcher->requestFileName();
        dispatchMutex->unlock();
        if (fileName == "")
            break;
        std::string uncompressedFileName = fileName.substr(0, fileName.size()-3);
        CompressedImage currImage = processImage(uncompressedFileName, settings);

        imageMutex->lock();
        allImages->push_back(currImage);
        imageMutex->unlock();
    }
}

ShortCopy::ShortCopy() {}
ShortCopy::ShortCopy(size_t index, size_t length, size_t offset, std::vector<unsigned short> usSequence)
{
    this->index = index;
    this->length = length;
    this->offset = offset;
    this->usSequence = usSequence;
}

std::vector<int> getNormalizedCounts(std::vector<size_t> input)
{
    std::vector<int> tempVec(16);
    for (size_t i = 0; i < input.size(); i++)
        tempVec[i] = input[i];
    tempVec = normalizeCounts(tempVec, TANS_TABLE_SIZE);
    bool shouldAdjust = false;
    for (int i = 0; i < 16; i++)
        if (tempVec[i] == TANS_TABLE_SIZE)
        {
            shouldAdjust = true;
            tempVec[i]--;
        }
    if (shouldAdjust)
        for (size_t i = 0; i < 16; i++)
            if (tempVec[i] == 0)
            {
                tempVec[i]++;
                break;
            }
    std::vector<int> returnVec(16);
    for (size_t i = 0; i < 16; i++)
        returnVec[i] = tempVec[i];
    return returnVec;
}

std::vector<unsigned int> getFreqWriteInts(std::vector<int> input)
{
    std::vector<unsigned int> returnVec(3);
    for (size_t i = 0; i < 5; i++)
    {
        unsigned int val1 = input[i];
        unsigned int val2 = input[5 + i];
        unsigned int val3 = input[10 + i];
        val1 = val1 << (i*6);
        val2 = val2 << (i*6);
        val3 = val3 << (i*6);
        returnVec[0] += val1;
        returnVec[1] += val2;
        returnVec[2] += val3;
    }
    unsigned int lastVal = input[15];
    returnVec[0] += (lastVal & 0x3) << 30;
    returnVec[1] += (lastVal & 0xc) << 28;
    returnVec[2] += (lastVal & 0x30) << 26;
    return returnVec;
}

std::vector<int> unpackFrequencies(unsigned int pInts[3])
{
    std::vector<int> returnVec;
    int freq15 = 0;
    for (size_t i = 0; i < 3; i++)
    {
        for (size_t j = 0; j < 5; j++)
        {
            int currVal = (pInts[i] >> (6*j)) & 0x3f;
            returnVec.push_back(currVal);
        }
        freq15 += ((pInts[i] >> 30) & 0x3) << (2*i);
    }
    returnVec.push_back(freq15);
    return returnVec;
}

int findInitialState(EncodeCol encodeCol, unsigned char firstSymbol)
{
    for (size_t i = 0; i < encodeCol.symbols.size(); i++)
    {
        if (encodeCol.symbols[i].symbol == firstSymbol)
            return encodeCol.symbols[i].nextState;
    }
    return -1;
}
/*
    mode        5

    state       6       11
    bitstream   12      23  8628 max so far, divide by 4
    loLength    12      23  2922 max so far
    symLength   14      37  14k max so far
    imageSize   10      47  16384 max so far, divide by 16

    u32:5   mode+lz
    u32:10  image size, divided by 32
    u32:14  symlength, divided by 2

    u32:6   state
    u32:12  bitstream, in ints
    u32:12  loLength, in bytes
*/
std::vector<unsigned int> getNewHeaders(CompressionMode mode, size_t imageSize, size_t symLength, int initialState, size_t bitstreamSize, size_t loLength)
{
    if (initialState == -1)
        initialState = 0;
    std::vector<unsigned int> returnVec(2);

    returnVec[0] += (unsigned int)mode;     //  4 bits
    returnVec[0] += (imageSize/IMAGE_SIZE_MODIFIER) << IMAGE_SIZE_OFFSET;    //  14 bits
    returnVec[0] += (symLength) << SYM_SIZE_OFFSET;    //  14 bits
                                            //  32 total

    returnVec[1] += initialState;           //  6 bits
    returnVec[1] += bitstreamSize << BITSTREAM_SIZE_OFFSET;     //  13 bits
    returnVec[1] += loLength << LO_SIZE_OFFSET;         //  13 bits

    return returnVec;
}

CompressedImage readNewHeader(std::vector<unsigned int> *pInput)
{
    CompressedImage image;
    std::vector<unsigned int> headers(2);
    headers[0] = (*pInput)[0];
    headers[1] = (*pInput)[1];
    image.mode = (CompressionMode)(headers[0] & MODE_MASK);
    image.rawNumBytes = ((headers[0] >> IMAGE_SIZE_OFFSET) & IMAGE_SIZE_MASK) * IMAGE_SIZE_MODIFIER;
    image.symSize = ((headers[0] >> SYM_SIZE_OFFSET) & SYM_SIZE_MASK);

    image.initialState = headers[1] & INITIAL_STATE_MASK;
    image.bitreamSize = (headers[1] >> BITSTREAM_SIZE_OFFSET) & BITSTREAM_SIZE_MASK;
    image.loSize = (headers[1] >> LO_SIZE_OFFSET) & LO_SIZE_MASK;
    image.headers = headers;
    return image;
}

InputSettings::InputSettings() {}

InputSettings::InputSettings(bool canEncodeLO, bool canEncodeSyms, bool canDeltaSyms)
{
    this->canEncodeLO = canEncodeLO;
    this->canEncodeSyms = canEncodeSyms;
    this->canDeltaSyms = canDeltaSyms;
}

std::vector<unsigned int> getUIntVecFromData(CompressedImage *pImage)
{
    CompressedImage otherImage = readNewHeader(&pImage->headers);
    std::vector<unsigned int> returnVec;
    returnVec.push_back(pImage->headers[0]);
    returnVec.push_back(pImage->headers[1]);
    if (isModeLoEncoded(otherImage.mode))
        for (size_t i = 0; i < 3; i++)
            returnVec.push_back(pImage->loFreqs[i]);
    if (isModeSymEncoded(otherImage.mode))
        for (size_t i = 0; i < 3; i++)
            returnVec.push_back(pImage->symFreqs[i]);
    if (isModeLoEncoded(otherImage.mode) || isModeSymEncoded(otherImage.mode))
        for (unsigned int ui : pImage->tANSbits)
            returnVec.push_back(ui);
    unsigned int currInt = 0;
    unsigned int currOffset = 0;
    if (!isModeSymEncoded(otherImage.mode))
    {
        for (size_t i = 0; i < pImage->symVec.size(); i++)
        {
            currInt += pImage->symVec[i] << (8*(currOffset % 4));
            currOffset += 2;
            if (currOffset % 4 == 0)
            {
                returnVec.push_back(currInt);
                currInt = 0;
            }
        }
    }
    if (!isModeLoEncoded(otherImage.mode))
    {
        for (size_t i = 0; i < pImage->loVec.size(); i++)
        {
            currInt += 0;
            currInt += pImage->loVec[i] << (8*(currOffset % 4));
            currOffset++;
            if (currOffset % 4 == 0)
            {
                returnVec.push_back(currInt);
                currInt = 0;
            }
        }
    }
    if (currOffset != 0)
        returnVec.push_back(currInt);
    return returnVec;
}

bool verifyUIntVecShort(std::vector<unsigned int> *pInput, std::vector<unsigned short> *pImage)
{
    CompressedImage image = getDataFromUIntVec(pInput);
    return verifyCompressionShort(&image, pImage);
}

std::vector<unsigned int> readFileAsUInt(std::string filePath)
{
    std::vector<unsigned int> returnVec;
    std::vector<unsigned char> ucVec;
    std::ifstream iStream;
    iStream.open(filePath.c_str(), std::ios::binary);
    if (!iStream.is_open())
    {
        fprintf(stderr, "Error: Couldn't open file %s for reading\n", filePath.c_str());
        return returnVec;
    }
    iStream.ignore( std::numeric_limits<std::streamsize>::max() );
    std::streamsize size = iStream.gcount();
    ucVec.resize(size);
    iStream.clear();
    iStream.seekg( 0, std::ios_base::beg );
    iStream.read((char*)(&ucVec[0]), size);
    iStream.close();
    unsigned int *pUInt = reinterpret_cast<unsigned int *>(ucVec.data());
    for (size_t i = 0; i < ucVec.size()/4; i++)
        returnVec.push_back(pUInt[i]);
    return returnVec;
}

bool isModeLoEncoded(CompressionMode mode)
{
    if (mode == ENCODE_LO
     || mode == ENCODE_BOTH
     || mode == ENCODE_BOTH_DELTA_SYMS)
        return true;
    return false;
}

bool isModeSymEncoded(CompressionMode mode)
{
    if (mode == ENCODE_SYMS
     || mode == ENCODE_DELTA_SYMS
     || mode == ENCODE_BOTH
     || mode == ENCODE_BOTH_DELTA_SYMS)
        return true;
    return false;
}

bool isModeSymDelta(CompressionMode mode)
{
    if (mode == ENCODE_DELTA_SYMS
     || mode == ENCODE_BOTH_DELTA_SYMS)
        return true;
    return false;
}

CompressedImage fillCompressVecNew(std::vector<unsigned char> loVec, std::vector<unsigned short> symVec, CompressionMode mode, size_t imageBytes, std::string name)
{
    CompressedImage image;
    bool loEncoded = isModeLoEncoded(mode);
    bool symEncoded = isModeSymEncoded(mode);
    bool symDelta = isModeSymDelta(mode);

    std::vector<unsigned char> loNibbles(2*loVec.size());
    std::vector<unsigned char> symNibbles(4*symVec.size());
    std::vector<DecodeCol> loDecode;
    std::vector<DecodeCol> symDecode;
    std::vector<unsigned char> symbols = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    if (loEncoded)
    {
        for (size_t i = 0; i < loVec.size(); i++)
        {
            loNibbles[2*i] = (loVec)[i] & 0xf;
            loNibbles[2*i + 1] = ((loVec)[i] >> 4) & 0xf;
        }
        std::vector<size_t> loCounts(16);
        for (unsigned char uc : loNibbles)
            loCounts[uc]++;
        std::vector<int> loFreqs = getNormalizedCounts(loCounts);
        std::vector<unsigned int> freqs = getFreqWriteInts(loFreqs);
        image.loFreqs[0] = freqs[0];
        image.loFreqs[1] = freqs[1];
        image.loFreqs[2] = freqs[2];
        loDecode = createDecodingTable(symbols, loFreqs);
    }
    if (symEncoded)
    {
        for (size_t i = 0; i < symVec.size(); i++)
        {
            for (size_t j = 0; j < 4; j++)
                symNibbles[4*i + j] = (symVec[i] >> (4*j)) & 0xf;
        }
        std::vector<size_t> symCounts(16);
        if (symDelta)
            deltaEncode(&symNibbles, symNibbles.size());
        for (unsigned char uc : symNibbles)
            symCounts[uc]++;
        std::vector<int> symFreqs = getNormalizedCounts(symCounts);
        symFreqs = getTestFreqs(symFreqs, name);
        std::vector<unsigned int> freqs = getFreqWriteInts(symFreqs);
        image.symFreqs[0] = freqs[0];
        image.symFreqs[1] = freqs[1];
        image.symFreqs[2] = freqs[2];
        symDecode = createDecodingTable(symbols, symFreqs);
    }
    int currState = -1;
    std::vector<unsigned int> bitstream;
    if (symEncoded)
    {
        std::vector<unsigned char> reversedVec;
        for (size_t i = 0; i < symNibbles.size(); i++)
            reversedVec.push_back(symNibbles[symNibbles.size() - i - 1]);
        std::vector<EncodeCol> symEncode = createEncodingTable(symDecode, symbols);
        size_t startIndex = 0;
        if (currState == -1)
        {
            currState = findInitialState(symEncode[0], reversedVec[0]) - TANS_TABLE_SIZE;
            startIndex = 1;
        }
        for (size_t i = startIndex; i < reversedVec.size(); i++)
            currState = encodeSingleSymbol(symEncode[currState], reversedVec[i], &bitstream) - TANS_TABLE_SIZE;
    }
    if (loEncoded)
    {
        std::vector<unsigned char> reversedVec;
        for (size_t i = 0; i < loNibbles.size(); i++)
            reversedVec.push_back(loNibbles[loNibbles.size() - i - 1]);
        std::vector<EncodeCol> loEncode = createEncodingTable(loDecode, symbols);
        size_t startIndex = 0;
        if (currState == -1)
        {
            currState = findInitialState(loEncode[0], reversedVec[0]) - TANS_TABLE_SIZE;
            startIndex = 1;
        }
        for (size_t i = startIndex; i < reversedVec.size(); i++)
            currState = encodeSingleSymbol(loEncode[currState], reversedVec[i], &bitstream) - TANS_TABLE_SIZE;
    }
    std::vector<unsigned int> reversedBitstream(bitstream.size());
    for (size_t i = 0; i < bitstream.size(); i++)
        reversedBitstream[reversedBitstream.size() - 1 - i] = bitstream[i];
    bitstream = reversedBitstream;
    std::vector<unsigned int> checkBits = bitstream;
    int checkState = currState;

    size_t currBitIndex = 0;
    if (loEncoded)
    {
        std::vector<unsigned char> checkLoNibbles(loNibbles.size());
        currBitIndex = decodeNibbles(loDecode, &checkBits, &checkState, &checkLoNibbles, currBitIndex, loNibbles.size());
        for (size_t i = 0; i < loNibbles.size(); i++)
            if (loNibbles[i] != checkLoNibbles[i])
            {
                fprintf(stderr, "LO Mismatch\n");
                break;
            }
    }
    if (symEncoded)
    {
        std::vector<unsigned char> checkSymNibbles(symNibbles.size());
        currBitIndex = decodeNibbles(symDecode, &checkBits, &checkState, &checkSymNibbles, currBitIndex, symNibbles.size());
        for (size_t i = 0; i < symNibbles.size(); i++)
            if (symNibbles[i] != checkSymNibbles[i])
            {
                fprintf(stderr, "Symbol Mismatch\n");
                break;
            }
    }

    std::vector<unsigned int> tANSbits;
    unsigned int currInt = 0;
    for (size_t i = 0; i < bitstream.size(); i++)
    {
        currInt += bitstream[i] << (i%32);
        if ((i+1) % 32 == 0)
        {
            tANSbits.push_back(currInt);
            currInt = 0;
        }
    }
    if (bitstream.size() % 32 != 0)
        tANSbits.push_back(currInt);
    image.headers = getNewHeaders(mode, imageBytes, symVec.size(), currState, tANSbits.size(), loVec.size());
    image.tANSbits = tANSbits;
    image.symVec = symVec;
    image.loVec = loVec;
    image.initialState = currState;
    return image;
}

size_t decodeNibbles(std::vector<DecodeCol> decodeTable, std::vector<unsigned int> *bits, int *currState, std::vector<unsigned char> *nibbleVec, size_t currBitIndex, size_t numNibbles)
{
    for (size_t i = 0; i < numNibbles; i++)
    {
        (*nibbleVec)[i] = decodeTable[*currState].symbol;
        int currK = decodeTable[*currState].k;
        int nextState = decodeTable[*currState].y << currK;
        for (size_t j = 0; j < currK; j++)
        {
            nextState += (*bits)[currBitIndex] << j;
            currBitIndex++;
        }
        *currState = nextState - TANS_TABLE_SIZE;
    }
    return currBitIndex;
}

std::vector<unsigned short> readRawDataVecs(std::vector<unsigned int> *pInput)
{
    std::vector<unsigned short> imageVec;
    CompressedImage readImage = readNewHeader(pInput);
    bool loEncoded = isModeLoEncoded(readImage.mode);
    bool symEncoded = isModeSymEncoded(readImage.mode);
    bool symDelta = isModeSymDelta(readImage.mode);
    size_t readIndex = 2;
    std::vector<unsigned int> tANSbits;
    std::vector<unsigned int> allBits;
    std::vector<unsigned short> symVec(readImage.symSize);
    std::vector<unsigned char> loVec(readImage.loSize);
    std::vector<DecodeCol> symDecode(TANS_TABLE_SIZE);
    std::vector<DecodeCol> loDecode(TANS_TABLE_SIZE);
    int currState = readImage.initialState;
    if (loEncoded)
    {
        for (size_t i = 0; i < 3; i++)
            readImage.loFreqs[i] = (*pInput)[readIndex + i];
        readIndex += 3;
        std::vector<int> loFreqs = unpackFrequencies(&readImage.loFreqs[0]);
        size_t currCol = 0;
        for (size_t i = 0; i < 16; i++)
        {
            for (size_t j = 0; j < loFreqs[i]; j++)
            {
                loDecode[currCol].state = TANS_TABLE_SIZE + currCol;
                loDecode[currCol].symbol = i;
                loDecode[currCol].y = loFreqs[i] + j;
                int currK = 0;
                while ((loDecode[currCol].y << currK) < TANS_TABLE_SIZE)
                    currK++;
                loDecode[currCol].k = currK;
                currCol++;
            }
        }
    }
    if (symEncoded)
    {
        for (size_t i = 0; i < 3; i++)
            readImage.symFreqs[i] = (*pInput)[readIndex + i];
        readIndex += 3;
        std::vector<int> symFreqs = unpackFrequencies(&readImage.symFreqs[0]);
        size_t currCol = 0;
        for (size_t i = 0; i < 16; i++)
        {
            for (size_t j = 0; j < symFreqs[i]; j++)
            {
                symDecode[currCol].state = TANS_TABLE_SIZE + currCol;
                symDecode[currCol].symbol = i;
                symDecode[currCol].y = symFreqs[i] + j;
                int currK = 0;
                while ((symDecode[currCol].y << currK) < TANS_TABLE_SIZE)
                    currK++;
                symDecode[currCol].k = currK;
                currCol++;
            }
        }
    }
    if (loEncoded || symEncoded)
    {
        tANSbits.resize(readImage.bitreamSize);
        for (size_t i = 0; i < readImage.bitreamSize; i++)
            tANSbits[i] = (*pInput)[readIndex + i];
        readIndex += readImage.bitreamSize;
        allBits.resize(tANSbits.size()*32);
        size_t currIndex = 0;
        for (unsigned int ui : tANSbits)
        {
            for (size_t i = 0; i < 32; i++)
            {
                unsigned int currVal = (ui >> i) & 0x1;
                allBits[currIndex] = currVal;
                currIndex++;
            }
        }
    }
    bool leftOverValues = false;
    if (!symEncoded)
    {
        for (size_t i = 0; i < readImage.symSize; i++)
        {
            symVec[i] = ((*pInput)[readIndex] >> (16*(i%2))) & 0xffff;
            if ((i+1) % 2 == 0)
            {
                readIndex++;
                leftOverValues = false;
            }
            else
            {
                leftOverValues = true;
            }
        }
    }
    if (!loEncoded)
    {
        size_t offsetMod = 0;
        if (leftOverValues)
            offsetMod = 2;
        for (size_t i = 0; i < readImage.loSize; i++)
        {
            loVec[i] = ((*pInput)[readIndex] >> (8*((i%4) + offsetMod))) & 0xff;
            if ((i+offsetMod+1) % 4 == 0)
                readIndex++;
        }
    }
    size_t bitIndex = 0;
    if (loEncoded)
    {
        std::vector<unsigned char> loNibbles(readImage.loSize*2);
        bitIndex = decodeNibbles(loDecode, &allBits, &currState, &loNibbles, bitIndex, readImage.loSize*2);
        for (size_t i = 0; i < readImage.loSize; i++)
            loVec[i] = loNibbles[2*i] + (loNibbles[2*i + 1] << 4);
    }
    if (symEncoded)
    {
        std::vector<unsigned char> symNibbles(readImage.symSize*4);
        bitIndex = decodeNibbles(symDecode, &allBits, &currState, &symNibbles, bitIndex, readImage.symSize*4);
        if (symDelta)
            deltaDecode(&symNibbles, symNibbles.size());
        for (size_t i = 0; i < readImage.symSize; i++)
            for (size_t j = 0; j < 4; j++)
                symVec[i] += (unsigned short)symNibbles[i*4 + j] << (4*j);
    }
    imageVec = decodeBytesShort(&loVec, &symVec);
    return imageVec;
}

void deltaEncode(std::vector<unsigned char> *buffer, int length)
{
    unsigned char last = 0;
    for (int i = 0; i < length; i++)
    {
        unsigned char current =(*buffer)[i];
        (*buffer)[i] = (current-last) & 0xf;
        last = current;
    }
}

void deltaDecode(std::vector<unsigned char> *buffer, int length)
{
    unsigned char last = 0;
    for (int i = 0; i < length; i++)
    {
        unsigned char delta =(*buffer)[i];
        (*buffer)[i] = (delta+last) & 0xf;
        last = (*buffer)[i];
    }
}

std::vector<int> getTestFreqs(std::vector<int> freqs, std::string name)
{
    if (name.find("test/compression/table_") == std::string::npos)
        return freqs;
    if (name.find("table_63_1") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 63;
        freqs[1] = 1;
    }
    if (name.find("table_62_2") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 62;
        freqs[1] = 2;
    }
    if (name.find("table_61_3") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 61;
        freqs[1] = 3;
    }
    if (name.find("table_60_4") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 60;
        freqs[1] = 4;
    }
    if (name.find("table_59_5") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 59;
        freqs[1] = 5;
    }
    if (name.find("table_58_6") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 58;
        freqs[1] = 6;
    }
    if (name.find("table_57_7") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 57;
        freqs[1] = 7;
    }
    if (name.find("table_56_8") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 56;
        freqs[1] = 8;
    }
    if (name.find("table_55_9") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 55;
        freqs[1] = 9;
    }
    if (name.find("table_54_10") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 54;
        freqs[1] = 10;
    }
    if (name.find("table_53_11") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 53;
        freqs[1] = 11;
    }
    if (name.find("table_52_12") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 52;
        freqs[1] = 12;
    }
    if (name.find("table_51_13") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 51;
        freqs[1] = 13;
    }
    if (name.find("table_50_14") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 50;
        freqs[1] = 14;
    }
    if (name.find("table_49_15") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 49;
        freqs[1] = 15;
    }
    if (name.find("table_48_16") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 48;
        freqs[1] = 16;
    }
    if (name.find("table_47_17") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 47;
        freqs[1] = 17;
    }
    if (name.find("table_46_18") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 46;
        freqs[1] = 18;
    }
    if (name.find("table_45_19") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 45;
        freqs[1] = 19;
    }
    if (name.find("table_44_20") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 44;
        freqs[1] = 20;
    }
    if (name.find("table_43_21") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 43;
        freqs[1] = 21;
    }
    if (name.find("table_42_22") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 42;
        freqs[1] = 22;
    }
    if (name.find("table_41_23") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 41;
        freqs[1] = 23;
    }
    if (name.find("table_40_24") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 40;
        freqs[1] = 24;
    }
    if (name.find("table_39_25") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 39;
        freqs[1] = 25;
    }
    if (name.find("table_38_26") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 38;
        freqs[1] = 26;
    }
    if (name.find("table_37_27") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 37;
        freqs[1] = 27;
    }
    if (name.find("table_36_28") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 36;
        freqs[1] = 28;
    }
    if (name.find("table_35_29") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 35;
        freqs[1] = 29;
    }
    if (name.find("table_34_30") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 34;
        freqs[1] = 30;
    }
    if (name.find("table_33_31") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 33;
        freqs[1] = 31;
    }
    if (name.find("table_32_32") != std::string::npos)
    {
        freqs.clear();
        freqs.resize(16);
        freqs[0] = 32;
        freqs[1] = 32;
    }
    return freqs;
}
