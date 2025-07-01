@ Note: ROM header data is empty space here.
@ It's populated by gbafix using data provided in the Makefile.

Start::
	b Init

RomHeaderNintendoLogo::
	.space 156

RomHeaderGameTitle::
	.space 12

RomHeaderGameCode::
	.space 4

RomHeaderMakerCode::
	.space 2

RomHeaderMagic::
	.byte 0

RomHeaderMainUnitCode::
	.byte 0

RomHeaderDeviceType::
	.byte 0

RomHeaderReserved1::
	.space 7

RomHeaderSoftwareVersion::
	.byte 0

RomHeaderChecksum::
	.byte 0

RomHeaderReserved2::
	.space 2

	.word 0

GPIOPortData::
	.hword 0

GPIOPortDirection::
	.hword 0

GPIOPortReadEnable::
	.hword 0

	.space 6

	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
