#include "global.h"
#include "librfu.h"
#include "link_rfu.h"
#include "link.h"
#include "sloopsvc.h"

#if REVISION >= 0xA

typedef struct _SloopSvc47Params {
    // BUGBUG: gHostRfuGameData certainly didn't change size, ResetHostRfuGameData still zeroes 13 bytes
    u8 HostRfuGameData[0x10];
    u8 HostRfuUsername[RFU_USER_NAME_LENGTH];
} SloopSvc47Params;

static u8 sBadWordAsciiString[256];

COMMON_DATA SloopSvc47Params gSvc47Params = {0};
COMMON_DATA struct RfuLinkStatus *gSloopRfuLinkStatus = NULL;

// Syscall functions for the extra syscalls handled by the Sloop emulator.
#define SLOOP_SVC_CLOBBERS "r0", "r1", "r2", "r3", "memory"

// Unreferenced. Sets a flag to true (default true) (svc_41 sets it to false)
void svc_40(void) {
    asm volatile("swi 0x40");
}

// Unreferenced. Sets a flag to false (default true) (svc_40 sets it to true)
void svc_41(void) {
    asm volatile("swi 0x41");
}

// Called by rfu_REQ_configGameData.
void svc_47(void) {
    u8* params = gSvc47Params.HostRfuGameData;
    memcpy(params, &gHostRfuGameData, sizeof(gSvc47Params.HostRfuGameData));
    memcpy(&params[sizeof(gSvc47Params.HostRfuGameData)], gHostRfuUsername, sizeof(gSvc47Params.HostRfuUsername));
    asm volatile(
        "movs r0, %0 \n"
        "swi 0x47 \n"
        :
        : "l"(params)
        : SLOOP_SVC_CLOBBERS
    );
    gSloopRfuLinkStatus = gRfuLinkStatus;
}

// Called by rfu_REQ_startSearchChild.
void svc_42(void) {
    asm volatile("swi 0x42");
}

// Called from rfu_LMAN_manager_entity.
u32 svc_49(void) {
    u32 ret;
    asm volatile(
        "swi 0x49 \n"
        "movs %0, r0 \n"
        : "=l"(ret)
        :
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}

// Called by rfu_REQ_startSearchParent and rfu_STC_readParentCandidateList.
void svc_45_rfu_link_status(void) {
    asm volatile(
        "movs r0, %0 \n"
        "swi 0x45 \n"
        :
        : "l"(gRfuLinkStatus)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by rfu_LMAN_REQ_callback
u32 svc_4a(void) {
    u32 ret;
    asm volatile(
        "swi 0x4a \n"
        "movs %0, r0 \n"
        : "=l"(ret)
        :
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}

// Called by rfu_REQ_startConnectParent
void svc_43(u16 pid) {
    asm volatile(
        "movs r0, %0 \n"
        "swi 0x43 \n"
        :
        : "l"(pid)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by rfu_REQ_stopMode, ...
void svc_44(void) {
    asm volatile("swi 0x44");
}

// Called by Task_WirelessCommunicationScreen
u32 svc_53(void) {
    u32 ret;
    asm volatile(
        "swi 0x53 \n"
        "movs %0, r0 \n"
        : "=l"(ret)
        :
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}

// Called by HandleLinkConnection
u32 svc_51(void) {
    u32 ret;
    asm volatile(
        "swi 0x51 \n"
        "movs %0, r0 \n"
        : "=l"(ret)
        :
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}

// Called by RfuMain1 and SpawnGroupLeaderAndMembers.
// SpawnGroupLeaderAndMembers will exit early in the SpawnGroupLeader case if retval has bit 0 unset.
// RfuMain1 will reseed the RNG by gHostRfuGameData->compatibility.playerTrainerId if retval has bit 1 set.
u32 svc_4b(void) {
    u32 ret;
    asm volatile(
        "swi 0x4b \n"
        "movs %0, r0 \n"
        : "=l"(ret)
        :
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}

// Called by TryWriteSector.
void svc_WriteSector(u8 sector, u8* data) {
    asm volatile(
        "movs r0, %0 \n"
        "movs r1, %1 \n"
        "swi 0x48 \n"
        :
        : "l"(sector), "l"(data)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by HandleReplaceSector.
void svc_ReplaceSector(u8 sector, u8* data) {
    asm volatile(
        "movs r0, %0 \n"
        "movs r1, %1 \n"
        "swi 0x56 \n"
        :
        : "l"(sector), "l"(data)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by various save-related functions.
// This writes the save out (handler calls a function using fopen/fwrite/fclose)
void svc_FinishSave(void) {
    asm volatile("swi 0x4c");
}

// Called by Task_RunUnionRoom and ListMenuHandler_AllItemsAvailable.
// This handler calls functions from the parental controls library.
// ListMenuHandler_AllItemsAvailable returns -2 if this returns zero.
// The Task_RunUnionRoom case auto-declines if this returns zero.
// Probably returns zero if "free communication" is denied by parental control settings.
u32 svc_CommsAllowedByParentalControls(void) {
    u32 ret;
    asm volatile(
        "swi 0x54 \n"
        "movs %0, r0 \n"
        : "=l"(ret)
        :
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}

static inline u32 call_svc_BadWordCheck(u8* string, int arg2) {
    u32 ret;
    asm volatile(
        "movs r0, %1\n"
        "movs r1, %2\n"
        "swi 0x4d\n"
        "movs %0, r0\n"
        : "=l" (ret)
        : "l" (string), "l" (arg2)
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}
// Called by naming screen MainState_PressedOKButton,
// ChatEntryRoutine_SendMessage and union room RegisterTextAtRow.
// This does the bad word checks.
// The text buffer passed in is sanitised, and zero returned if sanitisation occured(?)/badwords present(?)
u32 svc_BadWordCheck(u8* str) {
    u32 ret;
    PkmnStrToASCII((u8*)sBadWordAsciiString, str);
    ret = call_svc_BadWordCheck((u8*)sBadWordAsciiString, 0);
    ASCIIToPkmnStr(str, (u8*)sBadWordAsciiString);
    return ret;
}

// Called by various cases of Task_TryJoinLinkGroup and Task_TryBecomeLinkLeader.
void svc_4f(u32 arg) {
    asm volatile(
        "movs r0, %0 \n"
        "swi 0x4f \n"
        :
        : "l"(arg)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by a wrapper function called by Task_TryBecomeLinkLeader.
// The wrapper function is equivalent to "return !svc_50();"
// Return value is ORed with gReceivedRemoteLinkPlayers.
u32 svc_50(void) {
    u32 ret;
    asm volatile(
        "swi 0x50 \n"
        "movs %0, r0 \n"
        : "=l"(ret)
        :
        : SLOOP_SVC_CLOBBERS
    );
    return ret;
}

// Called by InitMainCallbacks and MoveSaveBlocks_ResetHeap.
// Lets the emulator know where SaveBlock2 is located in memory.
// Emulator appears to use this to get saveBlock2->optionsButtonMode to check against L_EQUALS_A.
void svc_SetSaveBlock2(struct SaveBlock2* saveBlock2) {
    asm volatile(
        "movs r0, %0 \n"
        "swi 0x55 \n"
        :
        : "l"(saveBlock2)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by AgbMain, as its first action before RegisterRamReset.
void svc_stubbed(void) {
	// No operation.
}

// Called by ScrCmd_givemon when the party is empty.
// This lets the emulator know what starter was picked (saved in play report / telemetry data)
void svc_SetStarter(u32 species) {
    asm volatile(
        "movs r0, %0 \n"
        "swi 0x57 \n"
        :
        : "l"(species)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by Task_StartActivity
// This lets the emulator know the current union room activity.
void svc_SetActivity(u32 activity) {
    asm volatile(
        "movs r0, %0 \n"
        "swi 0x61 \n"
        :
        : "l"(activity)
        : SLOOP_SVC_CLOBBERS
    );
}

// Called by CB2_PrintErrorMessage.
// This causes the emulator to increment some variable (link error counter, probably).
void svc_IncrementLinkError(void) {
    asm volatile("swi 0x62");
}


#endif