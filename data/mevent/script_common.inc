gMEventSrvScript_UnableToSend::
	.4byte 0x12, 0x10, gMEventClientScript_UnableToRecv @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x0a, NULL @ RETURN (can't send)

	.4byte 0x12, 0x10, gMEventClientScript_CommError @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x0b, NULL @ RETURN (comm error)

	.4byte 0x12, 0x10, gMEventClientScript_OtherTrainerCanceled @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x09, NULL @ RETURN (other trn canceled)

gMEventSrvScript_OtherTrnHasNews::
	.4byte 0x12, 0x10, gMEventClientScript_AlreadyHadNews @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x07, NULL @ RETURN (other trn has news)

gMEventSrvScript_SentNewsSuccess::
	.4byte 0x12, 0x28, gMEventClientScript_ReceiveNewsAndValidate @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x0e, 0x00, NULL @ SEND_NEWS
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x13, NULL @ RECV
	.4byte 0x08, 0x00, NULL @ READWORD
	.4byte 0x04, 0x01, gMEventSrvScript_OtherTrnHasNews @ BRANCH_EQ
	.4byte 0x12, 0x10, gMEventClientScript_RecvNewsSuccess @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x03, NULL @ RETURN (news sent to)

gMEventSrvScript_SendCardSuccess::
	.4byte 0x12, 0x30, gMEventClientScript_ReceiveCardAndReturnSuccess @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x0d, 0x00, NULL @ SEND_CARD
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x0f, 0x00, NULL @ BUFFER_SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x02, NULL @ RETURN (card sent to)

gMEventSrvScript_AskClientToOverwriteCard::
	.4byte 0x12, 0x28, gMEventClientScript_AskWouldLikeToTossCard @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x13, NULL @ RECV
	.4byte 0x08, 0x00, NULL @ READWORD
	.4byte 0x04, 0x00, gMEventSrvScript_SendCardSuccess @ BRANCH_EQ
	.4byte 0x03, 0x00, gMEventSrvScript_OtherTrainerCanceled @ BRANCH

gMEventSrvScript_OtherTrnHasCard::
	.4byte 0x12, 0x10, gMEventClientScript_AlreadyHadCard @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x05, NULL @ RETURN (other trn has card)

	.4byte 0x12, 0x10, gMEventClientScript_NothingSentOver @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x14, NULL @ RECV
	.4byte 0x00, 0x00, NULL @ RETURN (nothing sent over)

gMEventSrvScript_SendNews:: @ 8468B6C
	.4byte 0x1b, 0x00, NULL @ BUFFER_SAVED_NEWS
	.4byte 0x12, 0x20, gMEventClientScript_Send1442CC @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x11, NULL @ RECV
	.4byte 0x05, 0x00, NULL @ READ_1442CC
	.4byte 0x06, 0x00, NULL @ VALID_1442CC
	.4byte 0x04, 0x00, gMEventSrvScript_UnableToSend @ BRANCH_EQ
	.4byte 0x03, 0x00, gMEventSrvScript_SentNewsSuccess @ BRANCH

gMEventSrvScript_SendCard:: @ 8468BCC
	.4byte 0x1a, 0x00, NULL @ BUFFER_SAVED_CARD
	.4byte 0x1c, 0x00, NULL @ RAM_SCRIPT_IF_VALID
	.4byte 0x12, 0x20, gMEventClientScript_Send1442CC @ SEND
	.4byte 0x01, 0x00, NULL @ WAIT SEND
	.4byte 0x02, 0x11, NULL @ RECV
	.4byte 0x05, 0x00, NULL @ READ_1442CC
	.4byte 0x06, 0x00, NULL @ VALID_1442CC
	.4byte 0x04, 0x00, gMEventSrvScript_UnableToSend @ BRANCH_EQ
	.4byte 0x07, 0x00, NULL @ CHECK_1442CC_14
	.4byte 0x04, 0x02, gMEventSrvScript_AskClientToOverwriteCard @ BRANCH_EQ
	.4byte 0x04, 0x00, gMEventSrvScript_SendCardSuccess @ BRANCH_EQ
	.4byte 0x03, 0x00, gMEventSrvScript_OtherTrnHasCard @ BRANCH
