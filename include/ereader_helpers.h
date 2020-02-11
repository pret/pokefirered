#ifndef GUARD_EREADER_HELPERS_H
#define GUARD_EREADER_HELPERS_H

void EReaderHelper_SerialCallback(void);
void EReaderHelper_Timer3Callback(void);
void EReaderHelper_SaveRegsState(void);
void EReaderHelper_ClearsSendRecvMgr(void);
void EReaderHelper_RestoreRegsState(void);
u16 EReaderHandleTransfer(u8, size_t, const void *, void *);

#endif //GUARD_EREADER_HELPERS_H
