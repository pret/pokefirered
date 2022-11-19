#include "global.h"
#include "mystery_gift_server.h"

extern const struct mevent_server_cmd gServerScript_ClientCanceledCard[];

// Unreferenced
const u8 gUnknown_84687A0[] = _("You have collected all STAMPs!\nWant to input a CARD as a prize?");

/* CLIENT SCRIPTS */

const struct mevent_client_cmd gMEventClientScript_InitialListen[] = { // 84687E0
    CLI_RECEIVE(0x10),
    CLI_JUMPBUF
};

const struct mevent_client_cmd gMEventClientScript_Send1442CC[] = {
    CLI_SNDHEAD,
    CLI_WAITSND,
    CLI_RECEIVE(0x10),
    CLI_JUMPBUF
};

const struct mevent_client_cmd gMEventClientScript_UnableToRecv[] = { // can't accept card or news
    CLI_SENDALL,
    CLI_RETURN(0x0a)
};

const struct mevent_client_cmd gMEventClientScript_CommError[] = { // comm error
    CLI_SENDALL,
    CLI_RETURN(0x0b)
};

const struct mevent_client_cmd gMEventClientScript_NothingSentOver[] = { // nothing sent
    CLI_SENDALL,
    CLI_RETURN(0x00)
};

const struct mevent_client_cmd gMEventClientScript_ReceiveCardAndReturnSuccess[] = { // card success
    CLI_RECEIVE(0x16),
    CLI_RECVSAV,
    CLI_RECEIVE(0x19),
    CLI_RECVRAM,
    CLI_SENDALL,
    CLI_RETURN(0x02)
};

const struct mevent_client_cmd gMEventClientScript_ReceiveNewsAndValidate[] = {
    CLI_RECEIVE(0x17),
    CLI_VLDNEWS,
    CLI_WAITSND,
    CLI_RECEIVE(0x10),
    CLI_JUMPBUF
};

const struct mevent_client_cmd gMEventClientScript_AlreadyHadNews[] = { // already had news
    CLI_SENDALL,
    CLI_RETURN(0x07)
};

const struct mevent_client_cmd gMEventClientScript_RecvNewsSuccess[] = { // news success
    CLI_SENDALL,
    CLI_RETURN(0x03)
};

const struct mevent_client_cmd gMEventClientScript_AskWouldLikeToTossCard[] = {
    CLI_REQWORD,
    CLI_SNDWORD,
    CLI_WAITSND,
    CLI_RECEIVE(0x10),
    CLI_JUMPBUF
};

const struct mevent_client_cmd gMEventClientScript_OtherTrainerCanceled[] = { // comm canceled
    CLI_SENDALL,
    CLI_RETURN(0x09)
};

const struct mevent_client_cmd gMEventClientScript_AlreadyHadCard[] = { // already had card
    CLI_SENDALL,
    CLI_RETURN(0x05)
};

const struct mevent_client_cmd gMEventClientScript_SuccessFromBuffer[] = { // success from buffer
    CLI_RECEIVE(0x15),
    CLI_RECVBUF,
    CLI_SENDALL,
    CLI_RETURN(0x0d)
};

/* SERVER SCRIPTS */

const struct mevent_server_cmd gMEventSrvScript_UnableToSend[] = {
    SRV_SEND(0x10, gMEventClientScript_UnableToRecv),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x0a)
};

const struct mevent_server_cmd gUnknown_8468950[] = {
    SRV_SEND(0x10, gMEventClientScript_CommError),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x0b)
};

const struct mevent_server_cmd gUnknown_8468980[] = {
    SRV_SEND(0x10, gMEventClientScript_OtherTrainerCanceled),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x09)
};

const struct mevent_server_cmd gMEventSrvScript_OtherTrnHasNews[] = {
    SRV_SEND(0x10, gMEventClientScript_AlreadyHadNews),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x07)
};

const struct mevent_server_cmd gMEventSrvScript_SentNewsSuccess[] = {
    SRV_SEND(0x28, gMEventClientScript_ReceiveNewsAndValidate),
    SRV_WAITSND,
    SRV_SEND_NEWS,
    SRV_WAITSND,
    SRV_RECV(0x13),
    SRV_READWORD,
    SRV_BRANCHIF(0x01, gMEventSrvScript_OtherTrnHasNews),
    SRV_SEND(0x10, gMEventClientScript_RecvNewsSuccess),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x03)
};

const struct mevent_server_cmd gMEventSrvScript_SendCardSuccess[] = {
    SRV_SEND(0x30, gMEventClientScript_ReceiveCardAndReturnSuccess),
    SRV_WAITSND,
    SRV_SEND_CARD,
    SRV_WAITSND,
    SRV_BUFFER_SEND,
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x02)
};

const struct mevent_server_cmd gMEventSrvScript_AskClientToOverwriteCard[] = {
    SRV_SEND(0x28, gMEventClientScript_AskWouldLikeToTossCard),
    SRV_WAITSND,
    SRV_RECV(0x13),
    SRV_READWORD,
    SRV_BRANCHIF(0x00, gMEventSrvScript_SendCardSuccess),
    SRV_BRANCH(gServerScript_ClientCanceledCard)
};

const struct mevent_server_cmd gMEventSrvScript_OtherTrnHasCard[] = {
    SRV_SEND(0x10, gMEventClientScript_AlreadyHadCard),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x05)
};

const struct mevent_server_cmd gUnknown_8468B3C[] = {
    SRV_SEND(0x10, gMEventClientScript_NothingSentOver),
    SRV_WAITSND,
    SRV_RECV(0x14),
    SRV_RETURN(0x00)
};

const struct mevent_server_cmd gMEventSrvScript_SendNews[] = {
    SRV_BUFFER_NEWS,
    SRV_SEND(0x20, gMEventClientScript_Send1442CC),
    SRV_WAITSND,
    SRV_RECV(0x11),
    SRV_READ_1442CC,
    SRV_VALID_1442CC,
    SRV_BRANCHIF(0x00, gMEventSrvScript_UnableToSend),
    SRV_BRANCH(gMEventSrvScript_SentNewsSuccess)
};

const struct mevent_server_cmd gMEventSrvScript_SendCard[] = {
    SRV_BUFFER_CARD,
    SRV_RAM_SCRIPT_IF_VALID,
    SRV_SEND(0x20, gMEventClientScript_Send1442CC),
    SRV_WAITSND,
    SRV_RECV(0x11),
    SRV_READ_1442CC,
    SRV_VALID_1442CC,
    SRV_BRANCHIF(0x00, gMEventSrvScript_UnableToSend),
    SRV_CHECK_1442CC_14,
    SRV_BRANCHIF(0x02, gMEventSrvScript_AskClientToOverwriteCard),
    SRV_BRANCHIF(0x00, gMEventSrvScript_SendCardSuccess),
    SRV_BRANCH(gMEventSrvScript_OtherTrnHasCard)
};
