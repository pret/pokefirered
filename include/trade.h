#ifndef GUARD_TRADE_H
#define GUARD_TRADE_H

#include "global.h"
#include "librfu.h"
#include "constants/trade.h"

extern struct MailStruct gLinkPartnerMail[6];
extern u8 gSelectedTradeMonPositions[2];

extern const u16 gUnknown_826601C[];
void CB2_ReturnFromLinkTrade(void);
s32 sub_804FB34(void);
s32 CanRegisterMonForTradingBoard(struct UnkLinkRfuStruct_02022B14Substruct rfuPlayer, u16 species2, u16 species, u8 isObedientBitSet);
s32 GetUnionRoomTradeMessageId(struct UnkLinkRfuStruct_02022B14Substruct rfuPlayer, struct UnkLinkRfuStruct_02022B14Substruct rfuPartner, u16 playerSpecies2, u16 partnerSpecies, u8 requestedType, u16 playerSpecies, u8 isObedientBitSet);

#endif //GUARD_TRADE_H
