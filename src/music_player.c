#include "mp2k_common.h"
#include "music_player.h"
#include "gba/types.h"
#include "gba/m4a_internal.h"
#include "platform.h"

// Don't uncomment this. vvvvv
// #define POKEMON_EXTENSIONS
#define MIXED_AUDIO_BUFFER_SIZE 4907

static u32 MidiKeyToFreq(struct WaveData2 *wav, u8 key, u8 pitch);
extern void * const gMPlayJumpTableTemplate[];
extern const u8 gScaleTable[];
extern const u32 gFreqTable[];
extern const u8 gClockTable[];
float audioBuffer [MIXED_AUDIO_BUFFER_SIZE];

u32 umul3232H32(u32 a, u32 b) {
    u64 result = a;
    result *= b;
    return result >> 32;
}

void SoundMainBTM(void *ptr)
{
    CpuFill32(0, ptr, 0x40);
}

// Removes chan from the doubly-linked list of channels associated with chan->track.
// Gonna rename this to like "FreeChannel" or something, similar to VGMS
void MP2KClearChain(struct MixerSource *chan) {
    struct MP2KTrack *track = chan->track;
    if (chan->track == NULL) {
        return;
    }
    struct MixerSource *next = chan->next;
    struct MixerSource *prev = chan->prev;
    
    if (prev != NULL) {
        prev->next = next;
    } else {
        track->chan = next;
    }
    
    if (next != NULL) {
        next->prev = prev;
    }
    
    chan->track = NULL;
}

// In case newer compilers are too dumb to remove this logic at compile time.
#define SKIP_GBA_BIOS_CHECKS
// #define NOT_GBA

#if defined(SKIP_GBA_BIOS_CHECKS) || defined(NOT_GBA)
#define VERIFY_PTR(x) do; while (0)
#else
#define VERIFY_PTR(x) do {\
    uintptr_t y = (uintptr_t)(x);\
    if (y < EWRAM_START && (y < (uintptr_t)&gMPlayJumpTableTemplate || y >= 0x40000)) {\
        ret = 0;\
    }\
} while (0)
#endif

static u8 SafeDereferenceU8(u8 *addr) {
    u8 ret = *addr;
    VERIFY_PTR(addr);
    return ret;
}

static u32 SafeDereferenceU32(u32 *addr) {
    u32 ret = *addr;
    VERIFY_PTR(addr);
    return ret;
}

static u8 *SafeDereferenceU8Ptr(u8 **addr) {
    u8 *ret = *addr;
    VERIFY_PTR(addr);
    return ret;
}

static u32 *SafeDereferenceU32Ptr(u32 **addr) {
    u32 *ret = *addr;
    VERIFY_PTR(addr);
    return ret;
}

static struct WaveData2 *SafeDereferenceWavDataPtr(struct WaveData2 **addr) {
    struct WaveData2 *ret = *addr;
    VERIFY_PTR(addr);
    return ret;
}

static struct MP2KInstrument *SafeDereferenceMP2KInstrumentPtr(struct MP2KInstrument **addr) {
    struct MP2KInstrument *ret = *addr;
    VERIFY_PTR(addr);
    return ret;
}

static void *SafeDereferenceVoidPtr(void **addr) {
    void *ret = *addr;
    VERIFY_PTR(addr);
    return ret;
}

#ifndef NOT_GBA
// I read an article about undefined behavior today so I'm feeling especially cautious
// I'm definitely bringing this onto compiler explorer for some laughs... heh...
// ...Sorry
struct MP2KInstrument SafeDereferenceMP2KInstrument(struct MP2KInstrument *addr) {
    struct MP2KInstrument instrument;
    if (addr->type == SafeDereferenceU8(&addr->type)
     && addr->drumKey == SafeDereferenceU8(&addr->drumKey)
     && addr->cgbLength == SafeDereferenceU8(&addr->cgbLength)
     && addr->panSweep == SafeDereferenceU8(&addr->panSweep)) {
         instrument.type = addr->type;
         instrument.drumKey = addr->drumKey;
         instrument.cgbLength = addr->cgbLength;
         instrument.panSweep = addr->panSweep;
    } else {
        instrument.type = 0;
        instrument.drumKey = 0;
        instrument.cgbLength = 0;
        instrument.panSweep = 0;
    }
    
    // I don't know how much the optimizer can eff with weird union stuff so I might as well go through
    // all the steps to check which union member to access...?
    if (instrument.type & 0xC0) {
        if (addr->group == SafeDereferenceMP2KInstrumentPtr(&addr->group)) {
            instrument.group = addr->group;
        } else {
            instrument.group = NULL;
        }
        
        if (addr->keySplitTable == SafeDereferenceU8Ptr(&addr->keySplitTable)) {
            instrument.keySplitTable = addr->keySplitTable;
        } else {
            instrument.keySplitTable = NULL;
        }
        return instrument;
    } else if (instrument.type & 0x7) {
        if ((instrument.type & 0x7) == 3) {
            if (addr->cgb3Sample == SafeDereferenceU32Ptr(&addr->cgb3Sample)) {
                instrument.cgb3Sample = addr->cgb3Sample;
            } else {
                instrument.cgb3Sample = NULL;
            }
        } else {
            if (addr->squareNoiseConfig == SafeDereferenceU32(&addr->squareNoiseConfig)) {
                instrument.squareNoiseConfig = addr->squareNoiseConfig;
            } else {
                instrument.squareNoiseConfig = 0;
            }
        }
    } else {
        if (addr->wav == SafeDereferenceWavDataPtr(&addr->wav)) {
            instrument.wav = addr->wav;
        } else {
            instrument.wav = NULL;
        }
    }
    
    if (addr->attack == SafeDereferenceU8(&addr->attack)
     && addr->decay == SafeDereferenceU8(&addr->decay)
     && addr->sustain == SafeDereferenceU8(&addr->sustain)
     && addr->release == SafeDereferenceU8(&addr->release)) {
        instrument.attack = addr->attack;
        instrument.decay = addr->decay;
        instrument.sustain = addr->sustain;
        instrument.release = addr->release;
    } else {
        instrument.attack = 0;
        instrument.decay = 0;
        instrument.sustain = 0;
        instrument.release = 0;
    }
    return instrument;
}
#endif

#undef VERIFY_PTR

u8 ConsumeTrackByte(struct MP2KTrack *track) {
    u8 *ptr = track->cmdPtr++;
    return SafeDereferenceU8(ptr);
}

void MPlayJumpTableCopy(void **mplayJumpTable) {
    for (uf8 i = 0; i < 36; i++) {
        mplayJumpTable[i] = SafeDereferenceVoidPtr(&gMPlayJumpTableTemplate[i]);
    }
}

// Ends the current track. (Fine as in the Italian musical word, not English)
void MP2K_event_fine(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    struct MP2KTrack *r5 = track;
    for (struct MixerSource *chan = track->chan; chan != NULL; chan = chan->next) {
        if (chan->status & 0xC7) {
            chan->status |= 0x40;
        }
        MP2KClearChain(chan);
    }
    track->status = 0;
}

// Sets the track's cmdPtr to the specified address.
void MP2K_event_goto(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
#ifdef NOT_GBA
    u8 *addr;
    memcpy(&addr, track->cmdPtr, sizeof(u8 *));
    track->cmdPtr = addr;
#else
    u8 *cmdPtr = track->cmdPtr;
    uintptr_t addr = 0;
    for (size_t i = sizeof(uintptr_t) - 1; i > 0; i--) {
        addr |= cmdPtr[i];
        addr <<= 8;
    }
    addr |= SafeDereferenceU8(cmdPtr);
    track->cmdPtr = (u8*)addr;
#endif
}

// Sets the track's cmdPtr to the specified address after backing up its current position.
void MP2K_event_patt(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    u8 level = track->patternLevel;
    if (level < 3) {
        track->patternStack[level] = track->cmdPtr + sizeof(u8 *);
        track->patternLevel++;
        MP2K_event_goto(unused, track);
    } else {
        // Stop playing this track, as an indication to the music programmer that they need to quit
        // nesting patterns so darn much.
        MP2K_event_fine(unused, track);
    }
}

// Marks the end of the current pattern, if there is one, by resetting the pattern to the
// most recently saved value.
void MP2K_event_pend(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    if (track->patternLevel != 0) {
        u8 index = --track->patternLevel;
        track->cmdPtr = track->patternStack[index];
    }
}

// Loops back until a REPT event has been reached the specified number of times
void MP2K_event_rept(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    if (*track->cmdPtr == 0) {
        // "Repeat 0 times" == loop forever
        track->cmdPtr++;
        MP2K_event_goto(unused, track);
    } else {
        u8 repeatCount = ++track->repeatCount;
        if (repeatCount < ConsumeTrackByte(track)) {
            MP2K_event_goto(unused, track);
        } else {
            track->repeatCount = 0;
            track->cmdPtr += sizeof(u8) + sizeof(u8 *);
        }
    }
}

// Sets the note priority for new notes in this track.
void MP2K_event_prio(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->priority = ConsumeTrackByte(track);
}

// Sets the BPM of all tracks to the specified tempo (in beats per half-minute, because 255 as a max tempo
// kinda sucks but 510 is plenty).
void MP2K_event_tempo(struct MP2KPlayerState *player, struct MP2KTrack *track) {
    u16 bpm = ConsumeTrackByte(track);
    bpm *= 2;
    player->tempoRawBPM = bpm;
    player->tempoInterval = (bpm * player->tempoScale) / 256;
}

void MP2K_event_keysh(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->keyShift = ConsumeTrackByte(track);
    track->status |= 0xC;
}

void MP2K_event_voice(struct MP2KPlayerState *player, struct MP2KTrack *track) {
    u8 voice = *(track->cmdPtr++);
    struct MP2KInstrument *instrument = &player->voicegroup[voice];
#ifdef NOT_GBA
    track->instrument = *instrument;
#else
    track->instrument = SafeDereferenceMP2KInstrument(instrument);
#endif
}

void MP2K_event_vol(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->vol = ConsumeTrackByte(track);
    track->status |= 0x3;
}

void MP2K_event_pan(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->pan = ConsumeTrackByte(track) - 0x40;
    track->status |= 0x3;
}

void MP2K_event_bend(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->bend = ConsumeTrackByte(track) - 0x40;
    track->status |= 0xC;
}

void MP2K_event_bendr(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->bendRange = ConsumeTrackByte(track);
    track->status |= 0xC;
}

void MP2K_event_lfodl(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->lfoDelay = ConsumeTrackByte(track);
}

void MP2K_event_modt(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    u8 type = ConsumeTrackByte(track);
    if (type != track->modType) {
        track->modType = type;
        track->status |= 0xF;
    }
}

void MP2K_event_tune(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->tune = ConsumeTrackByte(track) - 0x40;
    track->status |= 0xC;
}

void MP2K_event_port(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    // I'm really curious whether any games actually use this event...
#ifdef NOT_GBA
    // I assume anything done by this command will get immediately overwritten by CgbSound?
    track->cmdPtr += 2;
#else
    vu8* offset = (vu8 *)(REG_ADDR_NR10 + *(track->cmdPtr++));
    *offset = ConsumeTrackByte(track);
#endif
}

void MP2KPlayerMain(void *voidPtrPlayer) {
    struct MP2KPlayerState *player = (struct MP2KPlayerState *)voidPtrPlayer;
    struct SoundMixerState *mixer = SOUND_INFO_PTR;
    
    if (player->lockStatus != PLAYER_UNLOCKED) {
        return;
    }
    player->lockStatus = PLAYER_LOCKED;
    
    if (player->nextPlayerFunc != NULL) {
        player->nextPlayerFunc(player->nextPlayer);
    }
    
    if (player->status & MUSICPLAYER_STATUS_PAUSE) {
        goto returnEarly;
    }
    FadeOutBody(voidPtrPlayer);
    if (player->status & MUSICPLAYER_STATUS_PAUSE) {
        goto returnEarly;
    }
    
    player->tempoCounter += player->tempoInterval;
    while (player->tempoCounter >= 150) {
        u16 trackBits = 0;
        for (u32 i = 0; i < player->trackCount; i++) {
            struct MP2KTrack *currentTrack = player->tracks + i;
            struct MixerSource *chan;
            if ((currentTrack->status & MPT_FLG_EXIST) == 0) {
                continue;
            }
            trackBits |= (1 << i);
            
            chan = currentTrack->chan;
            while (chan != NULL) {
                if(chan->gateTime == 0) {
                    //chan = chan->next;
                    chan->status |= SOUND_CHANNEL_SF_STOP;
                    break;
                }
                if ((chan->status & SOUND_CHANNEL_SF_ON) == 0) {
                    ClearChain(chan);
                } else if (chan->gateTime != 0 && --chan->gateTime == 0) {
                    chan->status |= SOUND_CHANNEL_SF_STOP;
                }
                chan = chan->next;
            }
            if (currentTrack->status & MPT_FLG_START) {
                CpuFill32(0, currentTrack, 0x40);
                currentTrack->status = MPT_FLG_EXIST;
                currentTrack->bendRange = 2;
                currentTrack->volPublic = 64;
                currentTrack->lfoSpeed = 22;
                currentTrack->instrument.type = 1;
            }
            
            while (currentTrack->wait == 0) {
                u8 event = *currentTrack->cmdPtr;
                if (event < 0x80) {
                    event = currentTrack->runningStatus;
                } else {
                    currentTrack->cmdPtr++;
                    if (event >= 0xBD) {
                        currentTrack->runningStatus = event;
                    }
                }
                
                if (event >= 0xCF) {
                    mixer->mp2kEventNxxFunc(event - 0xCF, player, currentTrack);
                } else if (event >= 0xB1) {
                    void (*eventFunc)(struct MP2KPlayerState *, struct MP2KTrack *);
                    player->cmd = event - 0xB1;
                    eventFunc = mixer->mp2kEventFuncTable[player->cmd];
                    eventFunc(player, currentTrack);
                    
                    if (currentTrack->status == 0) {
                        goto nextTrack;
                    }
                } else {
                    currentTrack->wait = gClockTable[event - 0x80];
                }
            }
            currentTrack->wait--;
            
            if (currentTrack->lfoSpeed != 0 && currentTrack->modDepth != 0) {
                if (currentTrack->lfoDelayCounter != 0U) {
                    currentTrack->lfoDelayCounter--;
                    goto nextTrack;
                }
                
                currentTrack->lfoSpeedCounter += currentTrack->lfoSpeed;
                
                s8 r;
                if (currentTrack->lfoSpeedCounter >= 0x40U && currentTrack->lfoSpeedCounter < 0xC0U) {
                    r = 128 - currentTrack->lfoSpeedCounter;
                } else if (currentTrack->lfoSpeedCounter >= 0xC0U) {
                    // Unsigned -> signed casts where the value is out of range are implementation defined.
                    // Why not add a few extra lines to make behavior the same for literally everyone?
                    r = currentTrack->lfoSpeedCounter - 256;
                } else {
                    r = currentTrack->lfoSpeedCounter;
                }
                r = FLOOR_DIV_POW2(currentTrack->modDepth * r, 64);
                
                if (r != currentTrack->modCalculated) {
                    currentTrack->modCalculated = r;
                    if (currentTrack->modType == 0) {
                        currentTrack->status |= MPT_FLG_PITCHG;
                    } else {
                        currentTrack->status |= MPT_FLG_VOLCHG;
                    }
                }
            }
            
            nextTrack:;
        }
        player->clock++;
        if (trackBits == 0) {
            player->status = MUSICPLAYER_STATUS_PAUSE;
            goto returnEarly;
        }
        player->status = trackBits;
        player->tempoCounter -= 150;
    }

    u32 i = 0;

    do {
        printf( "probleman2\n");
        struct MP2KTrack *track = player->tracks + i;

        if ((track->status & MPT_FLG_EXIST) == 0 || (track->status & 0xF) == 0) {
            continue;
        }
        TrkVolPitSet(player, track);

        for (struct MixerSource *chan = track->chan; chan != NULL; chan = chan->next) {
            printf( "probleman3 %d\n",chan->status);
            if(chan->status & SOUND_CHANNEL_SF_STOP){ break;}
            if ((chan->status & 0xC7) == 0) {
                ClearChain(chan);
                continue;
            }
            u8 cgbType = chan->type & 0x7;
            if (track->status & MPT_FLG_VOLCHG) {
                ChnVolSetAsm(chan, track);
                if (cgbType != 0) {
                    chan->cgbStatus |= 1;
                }
            }
            if (track->status & MPT_FLG_PITCHG) {
                s32 key = chan->key + track->keyShiftCalculated;
                if (key < 0) {
                    key = 0;
                }
                if (cgbType != 0) {
                    chan->freq = mixer->cgbCalcFreqFunc(cgbType, key, track->pitchCalculated);
                    chan->cgbStatus |= 0x2;
                } else {
                    chan->freq = MidiKeyToFreq(chan->wav, key, track->pitchCalculated);
                }
            }
        }
        track->status &= ~0xF;
    }
    while(++i < player->trackCount);
        printf("problema3\n");
returnEarly: ;
    player->lockStatus = PLAYER_UNLOCKED;
}

void TrackStop(struct MP2KPlayerState *player, struct MP2KTrack *track) {
    if (track->status & 0x80) {
        for (struct MixerSource *chan = track->chan; chan != NULL; chan = chan->next) {
            if (chan->status != 0) {
                u8 cgbType = chan->type & 0x7;
                if (cgbType != 0) {
                    struct SoundMixerState *mixer = SOUND_INFO_PTR;
                    mixer->cgbNoteOffFunc(cgbType);
                }
                chan->status = 0;
            }
            chan->track = NULL;
        }
        track->chan = NULL;
    }
}

void ChnVolSetAsm(struct MixerSource *chan, struct MP2KTrack *track) {
    s8 forcedPan = chan->rhythmPan;
    u32 rightVolume = (u8)(forcedPan + 128) * chan->velocity * track->volRightCalculated / 128 / 128;
    if (rightVolume > 0xFF) {
        rightVolume = 0xFF;
    }
    chan->rightVol = rightVolume;
    
    u32 leftVolume = (u8)(127 - forcedPan) * chan->velocity * track->volLeftCalculated / 128 / 128;
    if (leftVolume > 0xFF) {
        leftVolume = 0xFF;
    }
    chan->leftVol = leftVolume;
}

void MP2K_event_nxx(u8 clock, struct MP2KPlayerState *player, struct MP2KTrack *track) { // ply_note
    struct SoundMixerState *mixer = SOUND_INFO_PTR;
    
    // A note can be anywhere from 1 to 4 bytes long. First is always the note length...
    track->gateTime = gClockTable[clock];
    if (*track->cmdPtr < 0x80) {
        // Then the note name...
        track->key = *(track->cmdPtr++);
        if (*track->cmdPtr < 0x80) {
            // Then the velocity...
            track->velocity = *(track->cmdPtr++);
            if (*track->cmdPtr < 0x80) {
                // Then a number to add ticks to get exotic or more precise note lengths without TIE.
                track->gateTime += *(track->cmdPtr++);
            }
        }
    }
    
    // sp14
    s8 forcedPan = 0;
    // First r4, then r9
    struct MP2KInstrument *instrument = &track->instrument;
    // sp8
    u8 key = track->key;
    u8 type = instrument->type;
    
    if (type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL)) {
        u8 instrumentIndex;
        if (instrument->type & TONEDATA_TYPE_SPL) {
            instrumentIndex = instrument->keySplitTable[track->key];
        } else {
            instrumentIndex = track->key;
        }
        
        instrument = instrument->group + instrumentIndex;
        if (instrument->type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL)) {
            return;
        }
        if (type & TONEDATA_TYPE_RHY) {
            if (instrument->panSweep & 0x80) {
                forcedPan = ((s8)(instrument->panSweep & 0x7F) - 0x40) * 2;
            }
            key = instrument->drumKey;
        }
    }
    
    // sp10
    uf16 priority = player->priority + track->priority;
    if (priority > 0xFF) {
        priority = 0xFF;
    }
    
    u8 cgbType = instrument->type & TONEDATA_TYPE_CGB;
    struct MixerSource *chan;
    
    if (cgbType != 0) {
        if (mixer->cgbChans == NULL) {
            return;
        }
        // There's only one CgbChannel of a given type, so we don't need to loop to find it.
        chan = mixer->cgbChans + cgbType - 1;
        
        // If this channel is running and not stopped,
        if ((chan->status & SOUND_CHANNEL_SF_ON) 
        && (chan->status & SOUND_CHANNEL_SF_STOP) == 0) {
            // then make sure this note is higher priority (or same priority but from a later track).
            if (chan->priority > priority || (chan->priority == priority && chan->track < track)) {
                return;
            }
        }
    } else {
        uf16 p = priority;
        struct MP2KTrack *t = track;
        bool32 foundStoppingChannel = FALSE;
        chan = NULL;
        u8 maxChans = mixer->numChans;
        struct MixerSource *currChan = mixer->chans;
        
        for (uf8 i = 0; i < maxChans; i++, currChan++) {
            if ((currChan->status & SOUND_CHANNEL_SF_ON) == 0) {
                // Hey, we found a completely inactive channel! Let's use that.
                chan = currChan;
                break;
            }
            
            if (currChan->status & SOUND_CHANNEL_SF_STOP && !foundStoppingChannel) {
                // In the absence of a completely finalized channel, we can take over one that's about to
                // finalize. That's a tier above any channel that's currently playing a note.
                foundStoppingChannel = TRUE;
                p = currChan->priority;
                t = currChan->track;
                chan = currChan;
            } else if ((currChan->status & SOUND_CHANNEL_SF_STOP && foundStoppingChannel)
                   || ((currChan->status & SOUND_CHANNEL_SF_STOP) == 0 && !foundStoppingChannel)) {
                // The channel we're checking is on the same tier, so check the priority and track order
                if (currChan->priority < p) {
                    p = currChan->priority;
                    t = currChan->track;
                    chan = currChan;
                } else if (currChan->priority == p && currChan->track > t) {
                    t = currChan->track;
                    chan = currChan;
                } else if (currChan->priority == p && currChan->track == t) {
                    chan = currChan;
                }
            }
        }
        
    }
    
    if (chan == NULL) {
        return;
    }
    ClearChain(chan);
    
    chan->prev = NULL;
    chan->next = track->chan;
    if (track->chan != NULL) {
        track->chan->prev = chan;
    }
    track->chan = chan;
    chan->track = track;
    
    track->lfoDelayCounter = track->lfoDelay;
    if (track->lfoDelay != 0) {
        ClearModM(track);
    }
    TrkVolPitSet(player, track);
    
    chan->gateTime = track->gateTime;
    chan->untransposedKey = track->key;
    chan->velocity = track->velocity;
    chan->priority = priority;
    chan->key = key;
    chan->rhythmPan = forcedPan;
    chan->type = instrument->type;
    chan->wav = instrument->wav;
    chan->attack = instrument->attack;
    chan->decay = instrument->decay;
    chan->sustain = instrument->sustain;
    chan->release = instrument->release;
    chan->echoVol = track->echoVolume;
    chan->echoLen = track->echoLength;
    ChnVolSetAsm(chan, track);
    
    // Avoid promoting keyShiftCalculated to u8 by splitting the addition into a separate statement
    sf16 transposedKey = chan->key;
    transposedKey += track->keyShiftCalculated;
    if (transposedKey < 0) {
        transposedKey = 0;
    }
    
    if (cgbType != 0) {
        //struct CgbChannel *cgbChan = (struct CgbChannel *)chan;
        chan->length = instrument->cgbLength;
        if (instrument->panSweep & 0x80 || (instrument->panSweep & 0x70) == 0) {
            chan->sweep = 8;
        } else {
            chan->sweep = instrument->panSweep;
        }
        
        chan->freq = mixer->cgbCalcFreqFunc(cgbType, transposedKey, track->pitchCalculated);
    } else {
#ifdef POKEMON_EXTENSIONS
        chan->ct = track->ct;
#endif
        chan->freq = MidiKeyToFreq(chan->wav, transposedKey, track->pitchCalculated);
    }
    
    chan->status = SOUND_CHANNEL_SF_START;
    track->status &= ~0xF;
}

void MP2K_event_endtie(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    u8 key = *track->cmdPtr;
    if (key < 0x80) {
        track->key = key;
        track->cmdPtr++;
    } else {
        key = track->key;
    }
    
    struct MixerSource *chan = track->chan;
    while (chan != NULL) {
        if (chan->status & 0x83 && (chan->status & 0x40) == 0 && chan->untransposedKey == key) {
            chan->status |= 0x40;
            return;
        }
        chan = chan->next;
    }
}

void MP2K_event_lfos(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->lfoSpeed = *(track->cmdPtr++);
    if (track->lfoSpeed == 0) {
        ClearModM(track);
    }
}

void MP2K_event_mod(struct MP2KPlayerState *unused, struct MP2KTrack *track) {
    track->modDepth = *(track->cmdPtr++);
    if (track->modDepth == 0) {
        ClearModM(track);
    }
}

void m4aSoundVSync(void)
{
    struct SoundMixerState *mixer = SOUND_INFO_PTR;
    if(mixer->lockStatus-PLAYER_UNLOCKED <= 1)
    {
        s32 samplesPerFrame = mixer->samplesPerFrame * 2;
        float *m4aBuffer = mixer->outBuffer;
        float *cgbBuffer = cgb_get_buffer();
        s32 dmaCounter = mixer->dmaCounter;

        if (dmaCounter > 1) {
            m4aBuffer += samplesPerFrame * (mixer->framesPerDmaCycle - (dmaCounter - 1));
        }

        for(u32 i = 0; i < samplesPerFrame; i++)
            audioBuffer[i] = m4aBuffer[i] + cgbBuffer[i];

        Platform_QueueAudio(audioBuffer, samplesPerFrame * 4);
        if((s8)(--mixer->dmaCounter) <= 0)
            mixer->dmaCounter = mixer->framesPerDmaCycle;
    }

}

#if 0
// In:
// - wav: pointer to sample
// - key: the note after being transposed. If pitch bend puts it between notes, then the note below.
// - pitch: how many 256ths of a semitone above `key` the current note is.
// Out:
// - The frequency in Hz at which the sample should be played back.

u32 MidiKeyToFreq(struct WaveData2 *wav, u8 key, u8 pitch) {
    if (key > 178) {
        key = 178;
        pitch = 255;
    }
    
    // Alternatively, note = key % 12 and octave = 14 - (key / 12)
    u8 note = gScaleTable[key] & 0xF;
    u8 octave = gScaleTable[key] >> 4;
    u8 nextNote = gScaleTable[key + 1] & 0xF;
    u8 nextOctave = gScaleTable[key + 1] >> 4;
    
    u32 baseFreq1 = gFreqTable[note] >> octave;
    u32 baseFreq2 = gFreqTable[nextNote] >> nextOctave;
    
    u32 freqDifference = umul3232H32(baseFreq2 - baseFreq1, pitch << 24);
    // This is added by me. The real GBA and GBA BIOS don't verify this address, and as a result the
    // BIOS's memory can be dumped.
    u32 freq = SafeDereferenceU32(&wav->freq);
    return umul3232H32(freq, baseFreq1 + freqDifference);
}
#endif
