#ifndef GUARD_DMA3_H
#define GUARD_DMA3_H

#include "global.h"

// Maximum amount of data we will transfer in one operation
#define MAX_DMA_BLOCK_SIZE 0x1000

#define DMA_REQUEST_COPY32 1
#define DMA_REQUEST_FILL32 2
#define DMA_REQUEST_COPY16 3
#define DMA_REQUEST_FILL16 4

#define DMA3_16BIT 0
#define DMA3_32BIT 1

#define Dma3CopyLarge_(src, dest, size, bit)               \
{                                                          \
    const void *_src = src;                                \
    void *_dest = dest;                                    \
    u32 _size = size;                                      \
    while (1)                                              \
    {                                                      \
        if (_size <= MAX_DMA_BLOCK_SIZE)                   \
        {                                                  \
            DmaCopy##bit(3, _src, _dest, _size);           \
            break;                                         \
        }                                                  \
        DmaCopy##bit(3, _src, _dest, MAX_DMA_BLOCK_SIZE);  \
        _src += MAX_DMA_BLOCK_SIZE;                        \
        _dest += MAX_DMA_BLOCK_SIZE;                       \
        _size -= MAX_DMA_BLOCK_SIZE;                       \
    }                                                      \
}

#define Dma3CopyLarge16_(src, dest, size) Dma3CopyLarge_(src, dest, size, 16)
#define Dma3CopyLarge32_(src, dest, size) Dma3CopyLarge_(src, dest, size, 32)

#define Dma3FillLarge_(value, dest, size, bit)             \
{                                                          \
    void *_dest = dest;                                    \
    u32 _size = size;                                      \
    while (1)                                              \
    {                                                      \
        if (_size <= MAX_DMA_BLOCK_SIZE)                   \
        {                                                  \
            DmaFill##bit(3, value, _dest, _size);          \
            break;                                         \
        }                                                  \
        DmaFill##bit(3, value, _dest, MAX_DMA_BLOCK_SIZE); \
        _dest += MAX_DMA_BLOCK_SIZE;                       \
        _size -= MAX_DMA_BLOCK_SIZE;                       \
    }                                                      \
}

#define Dma3FillLarge16_(value, dest, size) Dma3FillLarge_(value, dest, size, 16)
#define Dma3FillLarge32_(value, dest, size) Dma3FillLarge_(value, dest, size, 32)

// Cancel pending DMA3 requests
void ClearDma3Requests(void);

// Handle pending DMA3 requests
void ProcessDma3Requests(void);

// Copy size bytes from src to dest.
// mode takes a DMA3_*BIT macro
// Returns the request index
s16 RequestDma3Copy(const void *src, void *dest, u16 size, u8 mode);

// Fill size bytes at dest with value.
// mode takes a DMA3_*BIT macro
// Returns the request index
s16 RequestDma3Fill(s32 value, void *dest, u16 size, u8 mode);

// index is the return value from RequestDma3*
// if index = -1, will check if any request is pending
// otherwise, checks if the specified request is pending
// Returns -1 if pending, 0 otherwise
s16 WaitDma3Request(s16 index);

#endif // GUARD_DMA3_H
