#ifndef GUARD_OAK_SPEECH_H
#define GUARD_OAK_SPEECH_H

void OakSpeech_StartBlendTask(u8 eva_start, u8 evb_start, u8 eva_end, u8 evb_end, u8 ev_step, u8 priority);
bool8 OakSpeech_IsBlendTaskActive(void);

#endif //GUARD_OAK_SPEECH_H
