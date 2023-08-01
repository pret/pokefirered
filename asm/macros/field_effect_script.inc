@ The first .byte argument of each macro below is an index into gFieldEffectScriptFuncs

	.macro loadtiles address:req
	.byte 0
	.4byte \address
	.endm

	.macro loadfadedpal address:req
	.byte 1
	.4byte \address
	.endm

	.macro loadpal address:req
	.byte 2
	.4byte \address
	.endm

	.macro callnative address:req
	.byte 3
	.4byte \address
	.endm

	.macro end
	.byte 4
	.endm

	.macro loadgfx_callnative tiles_address:req, palette_address:req, function_address:req
	.byte 5
	.4byte \tiles_address
	.4byte \palette_address
	.4byte \function_address
	.endm

	.macro loadtiles_callnative tiles_address:req, function_address:req
	.byte 6
	.4byte \tiles_address
	.4byte \function_address
	.endm

	.macro loadfadedpal_callnative palette_address:req, function_address:req
	.byte 7
	.4byte \palette_address
	.4byte \function_address
	.endm
