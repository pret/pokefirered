#ifndef SOUND_MIXER_H
#define SOUND_MIXER_H

#include "gba/types.h"
#include "music_player.h"

#define MIXER_UNLOCKED 0x68736D53
#define MIXER_LOCKED PLAYER_UNLOCKED+1

struct MP2KPlayerState;

struct MixerSource {
    u8 status;
    u8 type;
    u8 rightVol;
    u8 leftVol;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 key;
    u8 envelopeVol;
    union {
        u8 envelopeVolR;
        u8 envelopeGoal;
    }__attribute__((packed));
    union {
        u8 envelopeVolL;
        u8 envelopeCtr;
    }__attribute__((packed));
    u8 echoVol;
    u8 echoLen;
    u8 padding1;
    u8 padding2;
    u8 gateTime;
    u8 untransposedKey;
    u8 velocity;
    u8 priority;
    u8 rhythmPan;
    u8 padding3;
    u8 padding4;
    u8 padding5;
    union {
        u32 ct;
        struct {
            u8 padding6;
            u8 sustainGoal;
            u8 nrx4;
            u8 pan;
        };
    };
    union {
        float fw;
        struct {
            u8 panMask;
            u8 cgbStatus;
            u8 length;
            u8 sweep;
        };
    };
    u32 freq;
    union {
        u32 *newCgb3Sample;
        struct WaveData *wav;
    };
    union {
        u32 *oldCgb3Sample;
        s8 *current;
    };
    struct MP2KTrack *track;
    struct MixerSource *prev;
    struct MixerSource *next;
    u32 padding7; //d4
    u32 blockCount; // bdpcm block count
};

enum { MAX_SAMPLE_CHANNELS = 12 };
enum { MIXED_AUDIO_BUFFER_SIZE = 4907 };

struct SoundMixerState {
    vu32 lockStatus;
    vu8 dmaCounter;
    u8 reverb;
    u8 numChans;
    u8 masterVol;
    u8 freqOption;
    u8 extensionFlags;
    u8 cgbCounter15;
    u8 framesPerDmaCycle;
    u8 maxScanlines;
    u8 padding1;
    u8 padding2;
    u8 padding3;
    s32 samplesPerFrame;
    s32 sampleRate;
    float sampleRateReciprocal;
    struct MixerSource *cgbChans;
    void (*firstPlayerFunc)(void *player);
    void *firstPlayer;
    void (*cgbMixerFunc)(void);
    void (*cgbNoteOffFunc)(u8 chan);
    u32 (*cgbCalcFreqFunc)(u8 chan, u8 key, u8 pitch);
    void (**mp2kEventFuncTable)();
    void (*mp2kEventNxxFunc)(u8 clock, struct MP2KPlayerState *player, struct MP2KTrack *track);
    void *reserved1; // In poke* this is called "ExtVolPit"
    void *reserved2;
    void *reserved3;
    void *reversed4;
    void *reserved5;
    struct MixerSource chans[MAX_SAMPLE_CHANNELS];
    __attribute__((aligned(4))) float outBuffer[MIXED_AUDIO_BUFFER_SIZE * 2];
    //s8 outBuffer[MIXED_AUDIO_BUFFER_SIZE * 2];
};

typedef void (*MixerRamFunc)(struct SoundMixerState *, u32, u16, s8 *, u16);

#ifndef NOT_GBA
#undef REG_VCOUNT
#define REG_VCOUNT (*(vu8*)REG_ADDR_VCOUNT)
#endif
#endif//SOUND_MIXER_H
