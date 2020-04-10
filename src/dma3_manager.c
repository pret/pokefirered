#include "global.h"
#include "dma3.h"

#define MAX_DMA_REQUESTS 128

static struct {
    /* 0x00 */ const u8 *src;
    /* 0x04 */ u8 *dest;
    /* 0x08 */ u16 size;
    /* 0x0A */ u16 mode;
    /* 0x0C */ u32 value;
} gDma3Requests[128];

static volatile bool8 gDma3ManagerLocked;
static u8 gDma3RequestCursor;

void ClearDma3Requests(void)
{
    int i;

    gDma3ManagerLocked = TRUE;
    gDma3RequestCursor = 0;

    for(i = 0; i < (u8)NELEMS(gDma3Requests); i++)
    {
        gDma3Requests[i].size = 0;
        gDma3Requests[i].src = 0;
        gDma3Requests[i].dest = 0;
    }

    gDma3ManagerLocked = FALSE;
}

void ProcessDma3Requests(void)
{
    u16 bytesTransferred;

    if (gDma3ManagerLocked)
        return;

    bytesTransferred = 0;

    // as long as there are DMA requests to process (unless size or vblank is an issue), do not exit
    while (gDma3Requests[gDma3RequestCursor].size != 0)
    {
        bytesTransferred += gDma3Requests[gDma3RequestCursor].size;

        if (bytesTransferred > 40 * 1024)
            return; // don't transfer more than 40 KiB
        if (*(u8 *)REG_ADDR_VCOUNT > 224)
            return; // we're about to leave vblank, stop

        switch (gDma3Requests[gDma3RequestCursor].mode)
        {
        case DMA_REQUEST_COPY32: // regular 32-bit copy
            Dma3CopyLarge32_(gDma3Requests[gDma3RequestCursor].src,
                             gDma3Requests[gDma3RequestCursor].dest,
                             gDma3Requests[gDma3RequestCursor].size);
            break;
        case DMA_REQUEST_FILL32: // repeat a single 32-bit value across RAM
            Dma3FillLarge32_(gDma3Requests[gDma3RequestCursor].value,
                             gDma3Requests[gDma3RequestCursor].dest,
                             gDma3Requests[gDma3RequestCursor].size);
            break;
        case DMA_REQUEST_COPY16:    // regular 16-bit copy
            Dma3CopyLarge16_(gDma3Requests[gDma3RequestCursor].src,
                             gDma3Requests[gDma3RequestCursor].dest,
                             gDma3Requests[gDma3RequestCursor].size);
            break;
        case DMA_REQUEST_FILL16: // repeat a single 16-bit value across RAM
            Dma3FillLarge16_(gDma3Requests[gDma3RequestCursor].value,
                             gDma3Requests[gDma3RequestCursor].dest,
                             gDma3Requests[gDma3RequestCursor].size);
            break;
        }

        // Free the request
        gDma3Requests[gDma3RequestCursor].src = NULL;
        gDma3Requests[gDma3RequestCursor].dest = NULL;
        gDma3Requests[gDma3RequestCursor].size = 0;
        gDma3Requests[gDma3RequestCursor].mode = 0;
        gDma3Requests[gDma3RequestCursor].value = 0;
        gDma3RequestCursor++;

        if (gDma3RequestCursor >= MAX_DMA_REQUESTS) // loop back to the first DMA request
            gDma3RequestCursor = 0;
    }
}

s16 RequestDma3Copy(const void *src, void *dest, u16 size, u8 mode)
{
    int cursor;
    int var = 0;

    gDma3ManagerLocked = 1;

    cursor = gDma3RequestCursor;
    while(1)
    {
        if(!gDma3Requests[cursor].size) // an empty copy was found and the current cursor will be returned.
        {
            gDma3Requests[cursor].src = src;
            gDma3Requests[cursor].dest = dest;
            gDma3Requests[cursor].size = size;

            if(mode == DMA3_32BIT)
                gDma3Requests[cursor].mode = DMA_REQUEST_COPY32;
            else
                gDma3Requests[cursor].mode = DMA_REQUEST_COPY16;

            gDma3ManagerLocked = FALSE;
            return (s16)cursor;
        }
        if(++cursor >= 0x80) // loop back to start.
        {
            cursor = 0;
        }
        if(++var >= 0x80) // max checks were made. all resulted in failure.
        {
            break;
        }
    }
    gDma3ManagerLocked = FALSE;
    return -1;
}

s16 RequestDma3Fill(s32 value, void *dest, u16 size, u8 mode)
{
    int cursor;
    int var = 0;

    cursor = gDma3RequestCursor;
    gDma3ManagerLocked = 1;

    while(1)
    {
        if(!gDma3Requests[cursor].size)
        {
            gDma3Requests[cursor].dest = dest;
            gDma3Requests[cursor].size = size;
            gDma3Requests[cursor].mode = mode;
            gDma3Requests[cursor].value = value;

            if(mode == DMA3_32BIT)
                gDma3Requests[cursor].mode = DMA_REQUEST_FILL32;
            else
                gDma3Requests[cursor].mode = DMA_REQUEST_FILL16;

            gDma3ManagerLocked = FALSE;
            return (s16)cursor;
        }
        if(++cursor >= 0x80) // loop back to start.
        {
            cursor = 0;
        }
        if(++var >= 0x80) // max checks were made. all resulted in failure.
        {
            break;
        }
    }
    gDma3ManagerLocked = FALSE;
    return -1;
}

s16 WaitDma3Request(s16 index)
{
    int current = 0;

    if (index == -1)
    {
        for (; current < 0x80; current ++)
            if (gDma3Requests[current].size)
                return -1;

        return 0;
    }

    if (gDma3Requests[index].size)
        return -1;

    return 0;
}
