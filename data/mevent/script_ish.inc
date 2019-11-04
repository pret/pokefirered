gMEventClientScript_IntialListen:: @ 84687E0
	.4byte 0x02, 0x10 @ RECEIVE ID(0x10)
	.4byte 0x04, 0x00 @ JUMP TO RECEIVE BUFFER

gMEventClientScript_Send1442CC::
	.4byte 0x08, 0x00 @ SEND HEADER MAYBE
	.4byte 0x03, 0x00 @ WAIT SEND
	.4byte 0x02, 0x10 @ RECEIVE ID(0x10)
	.4byte 0x04, 0x00 @ JUMP TO RECEIVE BUFFER

gMEventClientScript_UnableToRecv:: @ can't accept card or news
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x0a @ RETURN 0x0a

gMEventClientScript_CommError:: @ comm error
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x0b @ RETURN 0x0b

gMEventClientScript_NothingSentOver:: @ nothing sent
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x00 @ RETURN 0x00

gMEventClientScript_ReceiveCardAndReturnSuccess:: @ card success
	.4byte 0x02, 0x16 @ RECEIVE ID(0x16)
	.4byte 0x0a, 0x00 @ RECEIVE_TO_SAVE_FILE
	.4byte 0x02, 0x19 @ RECEIVE ID(0x19)
	.4byte 0x11, 0x00 @ RECEIVE_TO_RAM_SCRIPT
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x02 @ RETURN 0x02

gMEventClientScript_ReceiveNewsAndValidate::
	.4byte 0x02, 0x17 @ RECEIVE ID(0x17)
	.4byte 0x09, 0x00 @ VALIDATE NEWS
	.4byte 0x03, 0x00 @ WAIT SEND
	.4byte 0x02, 0x10 @ RECEIVE ID(0x10)
	.4byte 0x04, 0x00 @ JUMP TO RECEIVE BUFFER

gMEventClientScript_AlredyHadNews:: @ already had news
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x07 @ RETURN 0x07

gMEventClientScript_RecvNewsSuccess:: @ news success
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x03 @ RETURN 0x03

gMEventClientScript_AskWouldLikeToTossCard::
	.4byte 0x0d, 0x00 @ REQUEST PARAMETER
	.4byte 0x0e, 0x00 @ SEND PARAMETER
	.4byte 0x03, 0x00 @ WAIT SEND
	.4byte 0x02, 0x10 @ RECEIVE ID(0x10)
	.4byte 0x04, 0x00 @ JUMP TO RECEIVE BUFFER

gMEventClientScript_OtherTrainerCanceled:: @ comm cancelled
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x09 @ RETURN 0x09

gMEventClientScript_AlreadyHadCard:: @ already had card
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x05 @ RETURN 0x05

gMEventClientScript_SuccessFromBuffer:: @ success from buffer
	.4byte 0x02, 0x15 @ RECEIVE ID(0x15)
	.4byte 0x0c, 0x00 @ READ PACKET AND COMPUTE SOMETHING
	.4byte 0x14, 0x00 @ SEND ALL
	.4byte 0x01, 0x0d @ RETURN 0x0d
