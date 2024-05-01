@ commands
	.macro attackcanceler
	.byte 0x0
	.endm

	.macro accuracycheck param0:req, param1:req
	.byte 0x1
	.4byte \param0
	.2byte \param1
	.endm

	.macro attackstring
	.byte 0x2
	.endm

	.macro ppreduce
	.byte 0x3
	.endm

	.macro critcalc
	.byte 0x4
	.endm

	.macro damagecalc
	.byte 0x5
	.endm

	.macro typecalc
	.byte 0x6
	.endm

	.macro adjustdamage
	.byte 0x7
	.endm

	.macro multihitresultmessage
	.byte 0x8
	.endm

	.macro attackanimation
	.byte 0x9
	.endm

	.macro waitanimation
	.byte 0xa
	.endm

	.macro healthbarupdate battler:req
	.byte 0xb
	.byte \battler
	.endm

	.macro datahpupdate battler:req
	.byte 0xc
	.byte \battler
	.endm

	.macro critmessage
	.byte 0xd
	.endm

	.macro effectivenesssound
	.byte 0xe
	.endm

	.macro resultmessage
	.byte 0xf
	.endm

	.macro printstring id:req
	.byte 0x10
	.2byte \id
	.endm

	.macro printselectionstring id:req
	.byte 0x11
	.2byte \id
	.endm

	.macro waitmessage param0:req
	.byte 0x12
	.2byte \param0
	.endm

	.macro printfromtable ptr:req
	.byte 0x13
	.4byte \ptr
	.endm

	.macro printselectionstringfromtable ptr:req
	.byte 0x14
	.4byte \ptr
	.endm

	.macro setadditionaleffects
	.byte 0x15
	.endm

	.macro seteffectprimary moveEffect=0
	.if \moveEffect != 0
		setmoveeffect \moveEffect
	.endif
	.byte 0x16
	.endm

	.macro seteffectsecondary moveEffect=0
	.if \moveEffect != 0
		setmoveeffect \moveEffect
	.endif
	.byte 0x17
	.endm

	.macro clearstatusfromeffect battler:req
	.byte 0x18
	.byte \battler
	.endm

	.macro tryfaintmon battler:req
	.byte 0x19
	.byte \battler
	.byte FALSE
	.4byte NULL
	.endm

	.macro tryfaintmon_spikes battler:req, instr:req
	.byte 0x19
	.byte \battler
	.byte TRUE
	.4byte \instr
	.endm

	.macro dofaintanimation battler:req
	.byte 0x1a
	.byte \battler
	.endm

	.macro cleareffectsonfaint battler:req
	.byte 0x1b
	.byte \battler
	.endm

	.macro jumpifstatus battler:req, flags:req, jumpInstr:req
	.byte 0x1c
	.byte \battler
	.4byte \flags
	.4byte \jumpInstr
	.endm

	.macro jumpifstatus2 battler:req, flags:req, jumpInstr:req
	.byte 0x1d
	.byte \battler
	.4byte \flags
	.4byte \jumpInstr
	.endm

	.macro jumpifability battler:req, ability:req, jumpInstr:req
	.byte 0x1e
	.byte \battler
	.2byte \ability
	.4byte \jumpInstr
	.endm

	.macro jumpifsideaffecting battler:req, flags:req, jumpInstr:req
	.byte 0x1f
	.byte \battler
	.4byte \flags
	.4byte \jumpInstr
	.endm

	.macro jumpifstat battler:req, comparison:req, stat:req, value:req, jumpInstr:req
	.byte 0x20
	.byte \battler
	.byte \comparison
	.byte \stat
	.byte \value
	.4byte \jumpInstr
	.endm

	.macro jumpifstatus3condition battler:req, flags:req, jumpIfTrue:req, jumpInstr:req
	.byte 0x21
	.byte \battler
	.4byte \flags
	.byte \jumpIfTrue
	.4byte \jumpInstr
	.endm

	.macro jumpbasedontype battler:req, type:req, jumpIfType:req, jumpInstr:req
	.byte 0x22
	.byte \battler
	.byte \type
	.byte \jumpIfType
	.4byte \jumpInstr
	.endm

	.macro jumpiftype battler:req, type:req, jumpInstr:req
	jumpbasedontype \battler, \type, TRUE, \jumpInstr
	.endm

	.macro jumpifnottype battler:req, type:req, jumpInstr:req
	jumpbasedontype \battler, \type, FALSE, \jumpInstr
	.endm

	.macro getexp battler:req
	.byte 0x23
	.byte \battler
	.endm

	.macro checkteamslost jumpInstr:req
	.byte 0x24
	.4byte \jumpInstr
	.endm

	.macro movevaluescleanup
	.byte 0x25
	.endm

	.macro setmultihit value:req
	.byte 0x26
	.byte \value
	.endm

	.macro decrementmultihit loopInstr:req
	.byte 0x27
	.4byte \loopInstr
	.endm

	.macro goto instr:req
	.byte 0x28
	.4byte \instr
	.endm

	.macro jumpifbyte comparison:req, bytePtr:req, value:req, jumpInstr:req
	.byte 0x29
	.byte \comparison
	.4byte \bytePtr
	.byte \value
	.4byte \jumpInstr
	.endm

	.macro jumpifhalfword comparison:req, halfwordPtr:req, value:req, jumpInstr:req
	.byte 0x2a
	.byte \comparison
	.4byte \halfwordPtr
	.2byte \value
	.4byte \jumpInstr
	.endm

	.macro jumpifword comparison:req, wordPtr:req, value:req, jumpInstr:req
	.byte 0x2b
	.byte \comparison
	.4byte \wordPtr
	.4byte \value
	.4byte \jumpInstr
	.endm

	.macro jumpifarrayequal array1:req, array2:req, size:req, jumpInstr:req
	.byte 0x2c
	.4byte \array1
	.4byte \array2
	.byte \size
	.4byte \jumpInstr
	.endm

	.macro jumpifarraynotequal array1:req, array2:req, size:req, jumpInstr:req
	.byte 0x2d
	.4byte \array1
	.4byte \array2
	.byte \size
	.4byte \jumpInstr
	.endm

	.macro setbyte bytePtr:req, value:req
	.byte 0x2e
	.4byte \bytePtr
	.byte \value
	.endm

	.macro addbyte bytePtr:req, value:req
	.byte 0x2f
	.4byte \bytePtr
	.byte \value
	.endm

	.macro subbyte bytePtr:req, value:req
	.byte 0x30
	.4byte \bytePtr
	.byte \value
	.endm

	.macro copyarray dest:req, src:req, size:req
	.byte 0x31
	.4byte \dest
	.4byte \src
	.byte \size
	.endm

	.macro copyarraywithindex dest:req, src:req, indexPtr:req, size:req
	.byte 0x32
	.4byte \dest
	.4byte \src
	.4byte \indexPtr
	.byte \size
	.endm

	.macro orbyte bytePtr:req, value:req
	.byte 0x33
	.4byte \bytePtr
	.byte \value
	.endm

	.macro orhalfword halfwordPtr:req, value:req
	.byte 0x34
	.4byte \halfwordPtr
	.2byte \value
	.endm

	.macro orword wordPtr:req, value:req
	.byte 0x35
	.4byte \wordPtr
	.4byte \value
	.endm

	.macro bicbyte bytePtr:req, value:req
	.byte 0x36
	.4byte \bytePtr
	.byte \value
	.endm

	.macro bichalfword halfwordPtr:req, value:req
	.byte 0x37
	.4byte \halfwordPtr
	.2byte \value
	.endm

	.macro bicword wordPtr:req, value:req
	.byte 0x38
	.4byte \wordPtr
	.4byte \value
	.endm

	.macro pause frames:req
	.byte 0x39
	.2byte \frames
	.endm

	.macro waitstate
	.byte 0x3a
	.endm

	.macro healthbar_update battler:req
	.byte 0x3b
	.byte \battler
	.endm

	.macro return
	.byte 0x3c
	.endm

	.macro end
	.byte 0x3d
	.endm

	.macro end2
	.byte 0x3e
	.endm

	.macro end3
	.byte 0x3f
	.endm

	@ unused5
	@.macro jumpifaffectedbyprotect ptr:req
	@.byte 0x40
	@.4byte \ptr
	@.endm

	.macro call instr:req
	.byte 0x41
	.4byte \instr
	.endm

	.macro setroost
	.byte 0x42
	.endm

	.macro jumpifabilitypresent ability:req, jumpInstr:req
	.byte 0x43
	.2byte \ability
	.4byte \jumpInstr
	.endm

	.macro endselectionscript
	.byte 0x44
	.endm

	.macro playanimation battler:req, animId:req, argPtr=NULL
	.byte 0x45
	.byte \battler
	.byte \animId
	.4byte \argPtr
	.endm

	.macro playanimation_var battler:req, animIdPtr:req, argPtr=NULL
	.byte 0x46
	.byte \battler
	.4byte \animIdPtr
	.4byte \argPtr
	.endm

	.macro setgraphicalstatchangevalues
	.byte 0x47
	.endm

	.macro playstatchangeanimation battler:req, stats:req, flags:req
	.byte 0x48
	.byte \battler
	.byte \stats
	.byte \flags
	.endm

	.macro moveend endMode:req, endState:req
	.byte 0x49
	.byte \endMode
	.byte \endState
	.endm

	@ Help macros for 5 uses of moveend command

	@ All cases
	.macro moveendall
	setbyte sMOVEEND_STATE, 0
	moveend 0, 0
	.endm

	@ Chosen case
	.macro moveendcase case:req
	setbyte sMOVEEND_STATE, \case
	moveend 1, 0
	.endm

	@ All cases from (inclusive)
	.macro moveendfrom from:req
	setbyte sMOVEEND_STATE, \from
	moveend 0, 0
	.endm

	@ All cases from 0 to (not inclusive)
	.macro moveendto to:req
	setbyte sMOVEEND_STATE, 0
	moveend 2, \to
	.endm

	@ Cases from (inclusive) to (not inclusive)
	.macro moveendfromto from:req, to:req
	setbyte sMOVEEND_STATE, \from
	moveend 2, \to
	.endm

	.macro sethealblock failInstr:req
	.byte 0x4a
	.4byte \failInstr
	.endm

	.macro returnatktoball
	.byte 0x4b
	.endm

	.macro getswitchedmondata battler:req
	.byte 0x4c
	.byte \battler
	.endm

	.macro switchindataupdate battler:req
	.byte 0x4d
	.byte \battler
	.endm

	.macro switchinanim battler:req, dontClearSubstitute:req
	.byte 0x4e
	.byte \battler
	.byte \dontClearSubstitute
	.endm

	.macro jumpifcantswitch battler:req, jumpInstr:req
	.byte 0x4f
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro openpartyscreen battler:req, failInstr:req
	.byte 0x50
	.byte \battler
	.4byte \failInstr
	.endm

	.macro switchhandleorder battler:req, state:req
	.byte 0x51
	.byte \battler
	.byte \state
	.endm

	.macro switchineffects battler:req
	.byte 0x52
	.byte \battler
	.endm

	.macro trainerslidein battler:req
	.byte 0x53
	.byte \battler
	.endm

	.macro playse song:req
	.byte 0x54
	.2byte \song
	.endm

	.macro fanfare song:req
	.byte 0x55
	.2byte \song
	.endm

	.macro playfaintcry battler:req
	.byte 0x56
	.byte \battler
	.endm

	.macro endlinkbattle
	.byte 0x57
	.endm

	.macro returntoball battler:req, changingForm:req
	.byte 0x58
	.byte \battler
	.byte \changingForm
	.endm

	.macro handlelearnnewmove learnedMoveInstr:req, nothingToLearnInstr:req, isFirstMove:req
	.byte 0x59
	.4byte \learnedMoveInstr
	.4byte \nothingToLearnInstr
	.byte \isFirstMove
	.endm

	.macro yesnoboxlearnmove forgotMoveInstr:req
	.byte 0x5a
	.4byte \forgotMoveInstr
	.endm

	.macro yesnoboxstoplearningmove noInstr:req
	.byte 0x5b
	.4byte \noInstr
	.endm

	.macro hitanimation battler:req
	.byte 0x5c
	.byte \battler
	.endm

	.macro getmoneyreward
	.byte 0x5d
	.endm

	.macro updatebattlermoves battler:req
	.byte 0x5e
	.byte \battler
	.endm

	.macro swapattackerwithtarget
	.byte 0x5f
	.endm

	.macro incrementgamestat stat:req
	.byte 0x60
	.byte \stat
	.endm

	.macro drawpartystatussummary battler:req
	.byte 0x61
	.byte \battler
	.endm

	.macro hidepartystatussummary battler:req
	.byte 0x62
	.byte \battler
	.endm

	.macro jumptocalledmove param0:req
	.byte 0x63
	.byte \param0
	.endm

	.macro statusanimation battler:req
	.byte 0x64
	.byte \battler
	.endm

	.macro status2animation battler:req, status2:req
	.byte 0x65
	.byte \battler
	.4byte \status2
	.endm

	.macro chosenstatusanimation battler:req, param1:req, param2:req
	.byte 0x66
	.byte \battler
	.byte \param1
	.4byte \param2
	.endm

	.macro yesnobox
	.byte 0x67
	.endm

	.macro cancelallactions
	.byte 0x68
	.endm

	.macro adjustsetdamage
	.byte 0x69
	.endm

	.macro removeitem battler:req
	.byte 0x6a
	.byte \battler
	.endm

	.macro atknameinbuff1
	.byte 0x6b
	.endm

	.macro drawlvlupbox
	.byte 0x6c
	.endm

	.macro resetsentmonsvalue
	.byte 0x6d
	.endm

	.macro setatktoplayer0
	.byte 0x6e
	.endm

	.macro makevisible battler:req
	.byte 0x6f
	.byte \battler
	.endm

	.macro recordability battler:req
	.byte 0x70
	.byte \battler
	.endm

	.macro buffermovetolearn
	.byte 0x71
	.endm

	.macro jumpifplayerran ptr:req
	.byte 0x72
	.4byte \ptr
	.endm

	.macro hpthresholds battler:req
	.byte 0x73
	.byte \battler
	.endm

	.macro hpthresholds2 battler:req
	.byte 0x74
	.byte \battler
	.endm

	.macro useitemonopponent
	.byte 0x75
	.endm

	.macro various battler:req, param1:req
	.byte 0x76
	.byte \battler
	.byte \param1
	.endm

	.macro setprotectlike
	.byte 0x77
	.endm

	.macro tryexplosion
	.byte 0x78
	.endm

	.macro setatkhptozero
	.byte 0x79
	.endm

	.macro jumpifnexttargetvalid ptr:req
	.byte 0x7a
	.4byte \ptr
	.endm

	.macro tryhealhalfhealth param0:req, battler:req
	.byte 0x7b
	.4byte \param0
	.byte \battler
	.endm

	.macro trymirrormove
	.byte 0x7c
	.endm

	.macro setrain
	.byte 0x7d
	.endm

	.macro setreflect
	.byte 0x7e
	.endm

	.macro setseeded
	.byte 0x7f
	.endm

	.macro manipulatedamage mode:req
	.byte 0x80
	.byte \mode
	.endm

	.macro trysetrest param0:req
	.byte 0x81
	.4byte \param0
	.endm

	.macro jumpifnotfirstturn ptr:req
	.byte 0x82
	.4byte \ptr
	.endm

	.macro nop
	.byte 0x83
	.endm

	.macro jumpifcantmakeasleep param0:req
	.byte 0x84
	.4byte \param0
	.endm

	.macro stockpile
	.byte 0x85
	.endm

	.macro stockpiletobasedamage param0:req
	.byte 0x86
	.4byte \param0
	.endm

	.macro stockpiletohpheal param0:req
	.byte 0x87
	.4byte \param0
	.endm

	.macro negativedamage
	.byte 0x88
	.endm

	.macro statbuffchange param0:req, param1:req
	.byte 0x89
	.2byte \param0
	.4byte \param1
	.endm

	.macro normalisebuffs
	.byte 0x8a
	.endm

	.macro setbide
	.byte 0x8b
	.endm

	.macro confuseifrepeatingattackends
	.byte 0x8c
	.endm

	.macro setmultihitcounter param0:req
	.byte 0x8d
	.byte \param0
	.endm

	.macro initmultihitstring
	.byte 0x8e
	.endm

	.macro forcerandomswitch param0:req
	.byte 0x8f
	.4byte \param0
	.endm

	.macro tryconversiontypechange param0:req
	.byte 0x90
	.4byte \param0
	.endm

	.macro givepaydaymoney
	.byte 0x91
	.endm

	.macro setlightscreen
	.byte 0x92
	.endm

	.macro tryKO param0:req
	.byte 0x93
	.4byte \param0
	.endm

	.macro damagetohalftargethp
	.byte 0x94
	.endm

	.macro setsandstorm
	.byte 0x95
	.endm

	.macro weatherdamage
	.byte 0x96
	.endm

	.macro tryinfatuating param0:req
	.byte 0x97
	.4byte \param0
	.endm

	.macro updatestatusicon battler:req
	.byte 0x98
	.byte \battler
	.endm

	.macro setmist
	.byte 0x99
	.endm

	.macro setfocusenergy
	.byte 0x9a
	.endm

	.macro transformdataexecution
	.byte 0x9b
	.endm

	.macro setsubstitute
	.byte 0x9c
	.endm

	.macro mimicattackcopy param0:req
	.byte 0x9d
	.4byte \param0
	.endm

	.macro metronome
	.byte 0x9e
	.endm

	.macro dmgtolevel
	.byte 0x9f
	.endm

	.macro psywavedamageeffect
	.byte 0xa0
	.endm

	.macro counterdamagecalculator param0:req
	.byte 0xa1
	.4byte \param0
	.endm

	.macro mirrorcoatdamagecalculator param0:req
	.byte 0xa2
	.4byte \param0
	.endm

	.macro disablelastusedattack param0:req
	.byte 0xa3
	.4byte \param0
	.endm

	.macro trysetencore param0:req
	.byte 0xa4
	.4byte \param0
	.endm

	.macro painsplitdmgcalc param0:req
	.byte 0xa5
	.4byte \param0
	.endm

	.macro settypetorandomresistance param0:req
	.byte 0xa6
	.4byte \param0
	.endm

	.macro setalwayshitflag
	.byte 0xa7
	.endm

	.macro copymovepermanently param0:req
	.byte 0xa8
	.4byte \param0
	.endm

	.macro trychoosesleeptalkmove param0:req
	.byte 0xa9
	.4byte \param0
	.endm

	.macro setdestinybond
	.byte 0xaa
	.endm

	.macro trysetdestinybondtohappen
	.byte 0xab
	.endm

	.macro remaininghptopower
	.byte 0xac
	.endm

	.macro tryspiteppreduce param0:req
	.byte 0xad
	.4byte \param0
	.endm

	.macro healpartystatus
	.byte 0xae
	.endm

	.macro cursetarget param0:req
	.byte 0xaf
	.4byte \param0
	.endm

	.macro trysetspikes param0:req
	.byte 0xb0
	.4byte \param0
	.endm

	.macro setforesight
	.byte 0xb1
	.endm

	.macro trysetperishsong param0:req
	.byte 0xb2
	.4byte \param0
	.endm

	.macro rolloutdamagecalculation
	.byte 0xb3
	.endm

	.macro jumpifconfusedandstatmaxed stat:req, ptr:req
	.byte 0xb4
	.byte \stat
	.4byte \ptr
	.endm

	.macro furycuttercalc
	.byte 0xb5
	.endm

	.macro friendshiptodamagecalculation
	.byte 0xb6
	.endm

	.macro presentdamagecalculation
	.byte 0xb7
	.endm

	.macro setsafeguard
	.byte 0xb8
	.endm

	.macro magnitudedamagecalculation
	.byte 0xb9
	.endm

	.macro jumpifnopursuitswitchdmg param0:req
	.byte 0xba
	.4byte \param0
	.endm

	.macro setsunny
	.byte 0xbb
	.endm

	.macro maxattackhalvehp param0:req
	.byte 0xbc
	.4byte \param0
	.endm

	.macro copyfoestats param0:req
	.byte 0xbd
	.4byte \param0
	.endm

	.macro rapidspinfree
	.byte 0xbe
	.endm

	.macro setdefensecurlbit
	.byte 0xbf
	.endm

	.macro recoverbasedonsunlight param0:req
	.byte 0xc0
	.4byte \param0
	.endm

	.macro hiddenpowercalc
	.byte 0xc1
	.endm

	.macro selectfirstvalidtarget
	.byte 0xc2
	.endm

	.macro trysetfutureattack param0:req
	.byte 0xc3
	.4byte \param0
	.endm

	.macro trydobeatup param0:req, param1:req
	.byte 0xc4
	.4byte \param0
	.4byte \param1
	.endm

	.macro setsemiinvulnerablebit
	.byte 0xc5
	.endm

	.macro clearsemiinvulnerablebit
	.byte 0xc6
	.endm

	.macro setminimize
	.byte 0xc7
	.endm

	.macro sethail
	.byte 0xc8
	.endm

	.macro trymemento ptr:req
	.byte 0xc9
	.4byte \ptr
	.endm

	.macro setforcedtarget
	.byte 0xca
	.endm

	.macro setcharge battler:req
	.byte 0xcb
	.byte \battler
	.endm

	.macro callterrainattack
	.byte 0xcc
	.endm

	.macro cureifburnedparalysedorpoisoned param0:req
	.byte 0xcd
	.4byte \param0
	.endm

	.macro settorment param0:req
	.byte 0xce
	.4byte \param0
	.endm

	.macro jumpifnodamage param0:req
	.byte 0xcf
	.4byte \param0
	.endm

	.macro settaunt param0:req
	.byte 0xd0
	.4byte \param0
	.endm

	.macro trysethelpinghand param0:req
	.byte 0xd1
	.4byte \param0
	.endm

	.macro tryswapitems param0:req
	.byte 0xd2
	.4byte \param0
	.endm

	.macro trycopyability param0:req
	.byte 0xd3
	.4byte \param0
	.endm

	.macro trywish param0:req, param1:req
	.byte 0xd4
	.byte \param0
	.4byte \param1
	.endm

	.macro settoxicspikes param0:req
	.byte 0xd5
	.4byte \param0
	.endm

	.macro setgastroacid failInstr:req
	.byte 0xd6
	.4byte \failInstr
	.endm

	.macro setyawn param0:req
	.byte 0xd7
	.4byte \param0
	.endm

	.macro setdamagetohealthdifference param0:req
	.byte 0xd8
	.4byte \param0
	.endm

	.macro scaledamagebyhealthratio
	.byte 0xd9
	.endm

	.macro tryswapabilities param0:req
	.byte 0xda
	.4byte \param0
	.endm

	.macro tryimprison param0:req
	.byte 0xdb
	.4byte \param0
	.endm

	.macro setstealthrock failInstr:req
	.byte 0xdc
	.4byte \failInstr
	.endm

	.macro weightdamagecalculation
	.byte 0xdd
	.endm

	.macro assistattackselect param0:req
	.byte 0xde
	.4byte \param0
	.endm

	.macro trysetmagiccoat param0:req
	.byte 0xdf
	.4byte \param0
	.endm

	.macro trysetsnatch param0:req
	.byte 0xe0
	.4byte \param0
	.endm

	.macro trygetintimidatetarget param0:req
	.byte 0xe1
	.4byte \param0
	.endm

	.macro switchoutabilities battler:req
	.byte 0xe2
	.byte \battler
	.endm

	.macro jumpifhasnohp battler:req, param1:req
	.byte 0xe3
	.byte \battler
	.4byte \param1
	.endm

	.macro getsecretpowereffect
	.byte 0xe4
	.endm

	.macro pickup
	.byte 0xe5
	.endm

	.macro docastformchangeanimation
	.byte 0xe6
	.endm

	.macro trycastformdatachange
	.byte 0xe7
	.endm

	.macro settypebasedhalvers param0:req
	.byte 0xe8
	.4byte \param0
	.endm

	.macro jumpifsubstituteblocks jumpInstr:req
	.byte 0xe9
	.4byte \jumpInstr
	.endm

	.macro tryrecycleitem param0:req
	.byte 0xea
	.4byte \param0
	.endm

	.macro settypetoterrain param0:req
	.byte 0xeb
	.4byte \param0
	.endm

	.macro pursuitrelated param0:req
	.byte 0xec
	.4byte \param0
	.endm

	.macro snatchsetbattlers
	.byte 0xed
	.endm

	.macro removelightscreenreflect
	.byte 0xee
	.endm

	.macro handleballthrow
	.byte 0xef
	.endm

	.macro givecaughtmon
	.byte 0xf0
	.endm

	.macro trysetcaughtmondexflags param0:req
	.byte 0xf1
	.4byte \param0
	.endm

	.macro displaydexinfo
	.byte 0xf2
	.endm

	.macro trygivecaughtmonnick param0:req
	.byte 0xf3
	.4byte \param0
	.endm

	.macro subattackerhpbydmg
	.byte 0xf4
	.endm

	.macro removeattackerstatus1
	.byte 0xf5
	.endm

	.macro finishaction
	.byte 0xf6
	.endm

	.macro finishturn
	.byte 0xf7
	.endm

	.macro callnative func:req
	.byte 0xff
	.4byte \func
	.endm

@ various command changed to more readable macros
	.macro cancelmultiturnmoves battler:req
	various \battler, VARIOUS_CANCEL_MULTI_TURN_MOVES
	.endm

	.macro setmagiccoattarget battler:req
	various \battler, VARIOUS_SET_MAGIC_COAT_TARGET
	.endm

	.macro getifcantrunfrombattle battler:req
	various \battler, VARIOUS_IS_RUNNING_IMPOSSIBLE
	.endm

	.macro getmovetarget battler:req
	various \battler, VARIOUS_GET_MOVE_TARGET
	.endm

	.macro getbattlerfainted battler:req
	various \battler, VARIOUS_GET_BATTLER_FAINTED
	.endm

	.macro resetintimidatetracebits battler:req
	various \battler, VARIOUS_RESET_INTIMIDATE_TRACE_BITS
	.endm

	.macro updatechoicemoveonlvlup battler:req
	various \battler, VARIOUS_UPDATE_CHOICE_MOVE_ON_LVL_UP
	.endm

	.macro resetplayerfainted
	various BS_ATTACKER, VARIOUS_RESET_PLAYER_FAINTED
	.endm

	.macro getbattlersforrecall
	various BS_ATTACKER, VARIOUS_GET_BATTLERS_FOR_RECALL
	.endm

	.macro returnopponentmon1toball
	various BS_ATTACKER, VARIOUS_RETURN_OPPONENT_MON1
	.endm

	.macro returnopponentmon2toball
	various BS_ATTACKER, VARIOUS_RETURN_OPPONENT_MON2
	.endm

	.macro checkpokeflute battler:req
	various \battler, VARIOUS_CHECK_POKEFLUTE
	.endm

	.macro waitfanfare battler:req
	various \battler, VARIOUS_WAIT_FANFARE
	.endm

	@ pokeemerald

	.macro handleformchange battler:req, case:req
	various \battler, VARIOUS_HANDLE_FORM_CHANGE
	.byte \case
	.endm

	.macro playmoveanimation battler:req, move:req
	various \battler, VARIOUS_PLAY_MOVE_ANIMATION
	.2byte \move
	.endm
	
	.macro showabilitypopup battler:req
	various \battler, VARIOUS_ABILITY_POPUP
	.endm

	.macro updateabilitypopup battler:req
	various \battler, VARIOUS_UPDATE_ABILITY_POPUP
	.endm

	.macro setlastuseditem battler:req
	various \battler, VARIOUS_SET_LAST_USED_ITEM
	.endm	
	
	.macro jumpifholdeffect battler:req, holdEffect:req, jumpInstr:req, equal=TRUE
	various \battler, VARIOUS_JUMP_IF_HOLD_EFFECT
	.byte \holdEffect
	.4byte \jumpInstr
	.byte \equal
	.endm

	.macro savetarget
	various BS_TARGET, VARIOUS_SAVE_TARGET
	.endm

	.macro restoretarget
	various BS_TARGET, VARIOUS_RESTORE_TARGET
	.endm

	.macro spectralthiefprintstats
	various BS_ATTACKER, VARIOUS_SPECTRAL_THIEF
	.endm

	.macro trytoclearprimalweather
	various BS_ATTACKER, VARIOUS_TRY_TO_CLEAR_PRIMAL_WEATHER
	.endm

	.macro consumeberry battler:req, fromBattler:req
	various \battler, VARIOUS_CONSUME_BERRY
	.byte \fromBattler
	.endm

	.macro tryroomservice battler:req, failInstr:req
	various \battler, VARIOUS_ROOM_SERVICE
	.4byte \failInstr
	.endm

	.macro trywindriderpower battler:req, failInstr:req
	various \battler, VARIOUS_TRY_WIND_RIDER_POWER
	.4byte \failInstr
	.endm

	.macro curestatus battler:req
	various \battler, VARIOUS_CURE_STATUS
	.endm

	.macro jumpifnoally battler:req, jumpInstr:req
	various \battler, VARIOUS_JUMP_IF_NO_ALLY
	.4byte \jumpInstr
	.endm

	.macro tryfriskmsg battler:req
	various \battler, VARIOUS_TRY_FRISK
	.endm

	.macro destroyabilitypopup
	various BS_ABILITY_BATTLER, VARIOUS_DESTROY_ABILITY_POPUP
	.endm

	.macro jumpiftargetally jumpInstr:req
	various BS_ATTACKER, VARIOUS_JUMP_IF_TARGET_ALLY
	.4byte \jumpInstr
	.endm

	.macro jumpifabsent battler:req, jumpInstr:req
	various \battler, VARIOUS_JUMP_IF_ABSENT
	.4byte \jumpInstr
	.endm

	.macro switchinabilities battler:req
	various \battler, VARIOUS_SWITCHIN_ABILITIES
	.endm

	.macro spriteignore0hp value:req
	various BS_ATTACKER, VARIOUS_SET_SPRITEIGNORE0HP
	.byte \value
	.endm

	.macro updatenick battler:req
	various \battler, VARIOUS_UPDATE_NICK
	.endm

	.macro doterrainseed battler:req, failInstr:req
	various \battler, VARIOUS_TERRAIN_SEED
	.4byte \failInstr
	.endm

	.macro activateterrainchangeabilities battler:req
	various \battler, VARIOUS_ACTIVATE_TERRAIN_CHANGE_ABILITIES
	.endm

	.macro activateweatherchangeabilities battler:req
	various \battler, VARIOUS_ACTIVATE_WEATHER_CHANGE_ABILITIES
	.endm

	.macro gettotemboost jumpInstr:req
	various BS_ATTACKER, VARIOUS_TOTEM_BOOST
	.4byte \jumpInstr
	.endm

	.macro makeinvisible battler:req
	various \battler, VARIOUS_MAKE_INVISIBLE
	.endm

	.macro activateitemeffects battler:req
	various \battler, VARIOUS_MOVEEND_ITEM_EFFECTS
	.endm

	.macro setoutcomeonteleport battler:req
	various \battler, VARIOUS_SET_TELEPORT_OUTCOME
	.endm

	.macro restorepp battler:req
	various \battler, VARIOUS_RESTORE_PP
	.endm

	.macro clearstatus battler:req
	various \battler, VARIOUS_CLEAR_STATUS
	.endm

	.macro setattackertostickywebuser
	various BS_TARGET, VARIOUS_SET_ATTACKER_STICKY_WEB_USER
	.endm

@ helpful macros
	.macro setstatchanger stat:req, stages:req, down:req
	setbyte sSTATCHANGER, \stat | \stages << 4 | \down << 7
	.endm

	.macro setmoveeffect effect:req
	sethword sMOVE_EFFECT, \effect
	.endm

	.macro chosenstatus1animation battler:req, status:req
	chosenstatusanimation \battler, 0x0, \status
	.endm

	.macro chosenstatus2animation battler:req, status:req
	chosenstatusanimation \battler, 0x1, \status
	.endm

	.macro sethword dst:req, value:req
	setbyte \dst, (\value) & 0xFF
	setbyte \dst + 1, ((\value) >> 8) & 0xFF
	.endm

	.macro setword dst:req, value:req
	setbyte \dst, (\value) & 0xFF
	setbyte \dst + 1, ((\value) >> 8) & 0xFF
	setbyte \dst + 2, ((\value) >> 16) & 0xFF
	setbyte \dst + 3, ((\value) >> 24) & 0xFF
	.endm

	.macro copybyte dst:req, src:req
	copyarray \dst, \src, 0x1
	.endm

	.macro copyhword dst:req, src:req
	copyarray \dst, \src, 0x2
	.endm

	.macro copyword dst:req, src:req
	copyarray \dst, \src, 0x4
	.endm

	.macro jumpifbytenotequal byte1:req, byte2:req, jumpptr:req
	jumpifarraynotequal \byte1, \byte2, 0x1, \jumpptr
	.endm

	.macro jumpifbyteequal byte1:req, byte2:req, jumpptr:req
	jumpifarrayequal \byte1, \byte2, 0x1, \jumpptr
	.endm

	.macro jumpifmove move:req, jumpptr:req
	jumpifhalfword CMP_EQUAL, gCurrentMove, \move, \jumpptr
	.endm

	.macro jumpifnotmove move:req, jumpptr:req
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, \move, \jumpptr
	.endm

	.macro jumpifstatus3 battler:req, status:req, jumpptr:req
	jumpifstatus3condition \battler, \status, 0x0, \jumpptr
	.endm

	.macro jumpifnostatus3 battler:req, status:req, jumpptr:req
	jumpifstatus3condition \battler, \status, 0x1, \jumpptr
	.endm

	.macro jumpifmovehadnoeffect jumpptr:req
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, MOVE_RESULT_NO_EFFECT, \jumpptr
	.endm

	.macro jumpifbattletype flags:req, jumpptr:req
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, \flags, \jumpptr
	.endm

	.macro jumpifnotbattletype flags:req, jumpptr:req
	jumpifword CMP_NO_COMMON_BITS, gBattleTypeFlags, \flags, \jumpptr
	.endm

	.macro jumpifnoholdeffect battler:req, holdEffect:req, jumpInstr:req
	jumpifholdeffect \battler, \holdEffect, \jumpInstr, FALSE
	.endm

	@ Tries to increase or decrease a battler's stat's stat stage by a specified amount. If impossible, jumps to \script.
	.macro modifybattlerstatstage battler:req, stat:req, mode:req, amount:req, script:req, animation:req, customString

	@ \mode parameters
	INCREASE = FALSE
	DECREASE = TRUE

	@ \animation parameters
	ANIM_OFF = FALSE
	ANIM_ON = TRUE

	setstatchanger \stat, \amount, \mode
	statbuffchange STAT_CHANGE_ALLOW_PTR, \script
	setgraphicalstatchangevalues
	.if \animation == TRUE
		playanimation \battler, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	.endif
	.ifnb \customString
		printstring \customString
	.else
		.if \mode == DECREASE
			printfromtable gStatDownStringIds
		.else
		.if \mode == INCREASE
			printfromtable gStatUpStringIds
		.endif
		.endif
	.endif
	waitmessage B_WAIT_TIME_LONG
	.endm

	.macro setallytonexttarget jumpInstr:req
	jumpifbyte CMP_GREATER_THAN, gBattlerTarget, 0x1, 1f
	addbyte gBattlerTarget, 0x2
	goto \jumpInstr
	1:
	subbyte gBattlerTarget, 0x2
	goto \jumpInstr
	.endm

	.macro dmg_1_8_targethp
	manipulatedamage DMG_1_8_TARGET_HP
	.endm

	.macro jumpifsafeguard jumpInstr:req
	jumpifability BS_ATTACKER, ABILITY_INFILTRATOR, 1f
	jumpifsideaffecting BS_TARGET, SIDE_STATUS_SAFEGUARD, \jumpInstr
	1:
	.endm

	.macro dmgtomaxattackerhp
	manipulatedamage DMG_FULL_ATTACKER_HP
	.endm

@ callnative macros
	.macro itemrestorehp jumpInstr:req
	callnative BS_ItemRestoreHP
	.4byte \jumpInstr
	.endm

	.macro itemcurestatus jumpInstr:req
	callnative BS_ItemCureStatus
	.4byte \jumpInstr
	.endm

	.macro itemincreasestat
	callnative BS_ItemIncreaseStat
	.endm

	.macro itemrestorepp
	callnative BS_ItemRestorePP
	.endm
	
	@ returns B_SIDE_x to gBattleCommunication[0]
	.macro getbattlerside battler:req
	callnative BS_GetBattlerSide
	.byte \battler
	.endm

	.macro flushtextbox
	printstring STRINGID_EMPTYSTRING3
	waitmessage 1
	.endm

	.macro tryrevertweatherform
	callnative BS_TryRevertWeatherForm
	.endm

	@ Used by effects that may proc Symbiosis but do not call removeitem.
	.macro trysymbiosis
	callnative BS_TrySymbiosis
	.endm

	@ Will jump to script pointer if the specified battler has or has not fainted.
	.macro jumpiffainted battler:req, value:req, ptr:req
	getbattlerfainted \battler
	jumpifbyte CMP_EQUAL, gBattleCommunication, \value, \ptr
	.endm

	.macro jumpifflowerveilattacker jumpInstr:req
	jumpifnottype BS_ATTACKER, TYPE_GRASS, 1f
	jumpifability BS_ATTACKER_SIDE, ABILITY_FLOWER_VEIL, \jumpInstr
	1:
	.endm

	.macro itemstatchangeeffects battler:req
	callnative BS_RunStatChangeItems
	.byte \battler
	.endm

	.macro dostockpilestatchangeswearoff, battler:req, statChangeInstr:req
	callnative BS_DoStockpileStatChangesWearOff
	.byte \battler
	.4byte \statChangeInstr
	.endm

	.macro handleprimalreversion battler:req, case:req
	callnative BS_HandlePrimalReversion
	.byte \battler
	.byte \case
	.endm

	
