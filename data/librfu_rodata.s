	.section .rodata

	.set VERSION_MAJOR, 1
	.set VERSION_MINOR, 0
	.set VERSION_REVISION, 24

	.align 2
_Str_RfuHeader::
	.byte 2, 14, 0, 10, 9, 5, 7, 2
	.byte 0, 15, 1, 3, 3, 0, 31, 0
	.byte 3, 22, 18, 14, 13, 9, 11, 3
	.byte 15, 15, 1, 3, 3, 0, 0x7f, 0

	.ascii "RFU_V"
	.byte VERSION_MAJOR + 0x30
	.byte VERSION_MINOR + 0x30
	.byte (VERSION_REVISION / 10) + 0x30
	.byte (VERSION_REVISION % 10) + 0x30
	.byte 0

	.align 2
_Str_RFU_MBOOT::
	.asciz "RFU-MBOOT"

	.align 2
_Str_Sio32ID::
	.asciz "NINTENDOSio32ID_030820"

