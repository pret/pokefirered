#ifndef MUSIC_PLAYER_H
#define MUSIC_PLAYER_H

#include "gba/types.h"
//#include "m4a.h"
#include "sound_mixer.h"

#define PLAYER_UNLOCKED 0x68736D53
#define PLAYER_LOCKED PLAYER_UNLOCKED+1

struct WaveData2
{
    u8 compressionFlags1;
    u8 compressionFlags2;
    u8 compressionFlags3;
    u8 loopFlags;
    u32 freq;  // 22.10 fixed width decimal, freq of C4. Or just the frequency of C14.
    u32 loopStart;
    u32 size; // number of samples
    s8 data[]; // samples
};


struct MP2KInstrument {
    u8 type;
    u8 drumKey;
    u8 cgbLength;
    u8 panSweep;
    union {
        struct WaveData *wav;
        struct MP2KInstrument *group;
        u32 *cgb3Sample;
        u32 squareNoiseConfig;
    };
    union {
        struct {
            u8 attack;
            u8 decay;
            u8 sustain;
            u8 release;
        };
        u8 *keySplitTable;
    };
};

struct MP2KTrack {
    u8 status;
    u8 wait;
    u8 patternLevel;
    u8 repeatCount;
    u8 gateTime; // 0 if TIE
    u8 key;
    u8 velocity;
    u8 runningStatus;
    s8 keyShiftCalculated; // Calculated by TrkVolPitSet using fields below. Units: semitones
    u8 pitchCalculated;    // Calculated by TrkVolPitSet using fields below. Units: 256ths of a semitone
    s8 keyShift;           // Units: semitones
    s8 keyShiftPublic;     // Units: semitones
    s8 tune;               // Units: 64ths of a semitone
    u8 pitchPublic;        // Units: 256ths of a semitone
    s8 bend;               // Units: (bendRange / 64)ths of a semitone
    u8 bendRange;
    u8 volRightCalculated;
    u8 volLeftCalculated;
    u8 vol;
    u8 volPublic; // Used both for fades and MPlayVolumeControl
    s8 pan;
    s8 panPublic;
    s8 modCalculated;   // Pitch units: 16ths of a semitone
    u8 modDepth;
    u8 modType;
    u8 lfoSpeed;
    u8 lfoSpeedCounter;
    u8 lfoDelay;
    u8 lfoDelayCounter;
    u8 priority;
    u8 echoVolume;
    u8 echoLength;
    struct MixerSource *chan;
    struct MP2KInstrument instrument;
    u8 gap[10];
    u16 unk_3A;
    u32 ct;
    u8 *cmdPtr;
    u8 *patternStack[3];
};

struct MP2KPlayerState {
    struct MP2KSongHeader *songHeader;
    vu32 status;
    u8 trackCount;
    u8 priority;
    u8 cmd;
    bool8 checkSongPriority;
    u32 clock;
    u8 padding[8];
    u8 *memaccArea;
    u16 tempoRawBPM; // 150 initially... this doesn't seem right but whatever
    u16 tempoScale; // 0x100 initially
    u16 tempoInterval; // 150 initially
    u16 tempoCounter;
    u16 fadeInterval;
    u16 fadeCounter;
    u16 isFadeTemporary:1;
    u16 isFadeIn:1;
    u16 fadeVolume:7;
    u16 :7; // padding
    struct MP2KTrack *tracks;
    struct MP2KInstrument *voicegroup;
    vu32 lockStatus;
    void (*nextPlayerFunc)(void *);
    void *nextPlayer;
};

struct MP2KPlayerCtor {
    struct MP2KPlayerState *player;
    struct MP2KTrack *tracks;
    u8 trackCount;
    u8 padding;
    bool16 checkSongPriority;
};

void clear_modM(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_endtie(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_lfos(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_mod(struct MP2KPlayerState *unused, struct MP2KTrack *track);
#endif
