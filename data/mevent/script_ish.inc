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
