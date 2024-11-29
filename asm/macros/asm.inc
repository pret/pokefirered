.ifndef GUARD_ASM_MACROS_ASM_INC
.set GUARD_ASM_MACROS_ASM_INC, 1
	
	.macro inc x:req
	.set \x, \x + 1
	.endm

	.macro enum_start x=0
	.set __enum__, \x
	.endm

	.macro enum constant:req
	.equiv \constant, __enum__
	inc __enum__
	.endm

.endif @ GUARD_ASM_MACROS_ASM_INC
