@ commands
	.macro attackcanceler
	.byte 0x0
	.endm

	.macro accuracycheck failInstr:req, move:req
	.byte 0x1
	.4byte \failInstr
	.2byte \move
	.endm

	.macro printattackstring
	.byte 0x2
	.endm

	.macro unused0x3
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

	.macro printsavedstring
	printstring 0
	.endm

	.macro printselectionstring id:req
	.byte 0x11
	.2byte \id
	.endm

	.macro waitmessage time:req
	.byte 0x12
	.2byte \time
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
	1:
	.byte 0x15
	jumpifhalfword CMP_EQUAL, sMOVE_EFFECT, MOVE_EFFECT_CONTINUE, 1b
	.endm

	.macro seteffectprimary battler:req, effectBattler:req, moveEffect=0
	.if \moveEffect != 0
		setmoveeffect \moveEffect
	.endif
	.byte 0x16
	.byte \battler
	.byte \effectBattler
	.endm

	.macro seteffectsecondary battler:req, effectBattler:req, moveEffect=0
	.if \moveEffect != 0
		setmoveeffect \moveEffect
	.endif
	.byte 0x17
	.byte \battler
	.byte \effectBattler
	.endm

	.macro clearvolatile battler:req, volatile:req
	.byte 0x18
	.byte \battler
	.byte \volatile
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

	.macro jumpifvolatile battler:req, volatile:req, jumpInstr:req
	.byte 0x1d
	.byte \battler
	.byte \volatile
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

	.macro unused_0x21
	.byte 0x21
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

	.macro setchargingturn
	.byte 0x40
	.endm

	.macro waitstate
	.byte 0x3a
	.endm

	.macro absorbhealthbarupdate battler:req
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

	.macro jumpfifsemiinvulnerable battler:req, state:req, jumpInstr:req
	.byte 0x47
	.byte \battler
	.byte \state
	.4byte \jumpInstr
	.endm

	.macro unused_0x48
	.byte 0x48
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

	.macro switchinanim battler:req, dontClearTransform:req, dontClearSubstitute:req
	.byte 0x4e
	.byte \battler
	.byte \dontClearTransform
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

	.macro trainerslidein position:req
	.byte 0x53
	.byte \position
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

	.macro jumptocalledmove notChosenMove:req
	.byte 0x63
	.byte \notChosenMove
	.endm

	.macro statusanimation battler:req, status=0, isVolatile=FALSE
	.byte 0x64
	.byte \battler
	.4byte \status
	.byte \isVolatile
	.endm

	.macro volatileanimation battler:req, volatile:req
	statusanimation \battler, \volatile, TRUE
	.endm

	.macro yesnobox
	.byte 0x67
	.endm

	.macro cancelallactions
	.byte 0x68
	.endm

	.macro setgravity failInstr:req
	.byte 0x69
	.4byte \failInstr
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

	.macro jumpifplayerran jumpInstr:req
	.byte 0x72
	.4byte \jumpInstr
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

	.macro various battler:req, id:req
	.byte 0x76
	.byte \battler
	.byte \id
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

	.macro jumpifnexttargetvalid jumpInstr:req
	.byte 0x7a
	.4byte \jumpInstr
	.endm

	.macro tryhealhalfhealth battler:req, failInstr:req
	.byte 0x7b
	.byte \battler
	.4byte \failInstr
	.endm

	.macro trymirrormove
	.byte 0x7c
	.endm

	.macro setfieldweather weather:req
	.byte 0x7d
	.byte \weather
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

	.macro trysetrest
	.byte 0x81
	.endm

	.macro unused_0x82
	.byte 0x82
	.endm

	.macro unused_0x83
	.byte 0x83
	.endm

	.macro jumpifuproarwakes jumpInstr:req
	.byte 0x84
	.4byte \jumpInstr
	.endm

	.macro stockpile id:req
	.byte 0x85
	.byte \id
	.endm

	.macro stockpiletobasedamage
	.byte 0x86
	.endm

	.macro stockpiletohpheal failInstr:req
	.byte 0x87
	.4byte \failInstr
	.endm

	.macro removestockpilecounters
	callnative BS_RemoveStockpileCounters
	.endm

	.macro setdrainedhp
	.byte 0x88
	.endm

	.macro statbuffchange battler:req, flags:req, failInstr:req, stats=0
	.byte 0x89
	.byte \battler
	.2byte \flags
	.4byte \failInstr
	.byte \stats
	.endm

	.macro normalisebuffs
	.byte 0x8a
	.endm

	.macro setbide
	.byte 0x8b
	.endm

	.macro twoturnmoveschargestringandanimation
	.byte 0x8c
	.4byte 1f @animation then attack string
	@default - attack string then animation
	printsavedstring
	waitmessage B_WAIT_TIME_LONG
	attackanimation
	waitanimation
	goto 2f
	1:
	attackanimation
	waitanimation
	printsavedstring
	waitmessage B_WAIT_TIME_LONG
	2:
	.endm

	.macro trynonvolatilestatus
	.byte 0x8d
	.endm

	.macro initmultihitstring
	.byte 0x8e
	.endm

	.macro forcerandomswitch failInstr:req
	.byte 0x8f
	.4byte \failInstr
	.endm

	.macro tryconversiontypechange failInstr:req
	.byte 0x90
	.4byte \failInstr
	.endm

	.macro givepaydaymoney
	.byte 0x91
	.endm

	.macro setlightscreen
	.byte 0x92
	.endm

	.macro tryKO failInstr:req
	.byte 0x93
	.4byte \failInstr
	.endm

	.macro checknonvolatiletrigger nonVolatile:req, failInstr:req
	.byte 0x94
	.2byte \nonVolatile
	.4byte \failInstr
	.endm

	.macro copybidedmg
	.byte 0x95
	.endm

	.macro animatewildpokemonafterfailedpokeball battler:req
	.byte 0x96
	.byte \battler
	.endm

	.macro tryinfatuating failInstr:req
	.byte 0x97
	.4byte \failInstr
	.endm

	.macro updatestatusicon battler:req
	.byte 0x98
	.byte \battler
	.endm

	.macro setmist
	.byte 0x99
	.endm

	.macro setfocusenergy battler:req
	.byte 0x9a
	.byte \battler
	.endm

	.macro transformdataexecution
	.byte 0x9b
	.endm

	.macro setsubstitute
	.byte 0x9c
	.endm

	.macro mimicattackcopy failInstr:req
	.byte 0x9d
	.4byte \failInstr
	.endm

	.macro setcalledmove
	.byte 0x9e
	.endm

	.macro unused_0x9f
	.byte 0x9f
	.endm

	.macro unused_0xA0
	.byte 0xa0
	.endm

	.macro counterdamagecalculator failInstr:req
	.byte 0xa1
	.4byte \failInstr
	.endm

	.macro mirrorcoatdamagecalculator failInstr:req
	.byte 0xa2
	.4byte \failInstr
	.endm

	.macro disablelastusedattack failInstr:req
	.byte 0xa3
	.4byte \failInstr
	.endm

	.macro trysetencore failInstr:req
	.byte 0xa4
	.4byte \failInstr
	.endm

	.macro painsplitdmgcalc failInstr:req
	.byte 0xa5
	.4byte \failInstr
	.endm

	.macro settypetorandomresistance failInstr:req
	.byte 0xa6
	.4byte \failInstr
	.endm

	.macro setalwayshitflag
	.byte 0xa7
	.endm

	.macro copymovepermanently failInstr:req
	.byte 0xa8
	.4byte \failInstr
	.endm

	.macro trychoosesleeptalkmove failInstr:req
	.byte 0xa9
	.4byte \failInstr
	.endm

	.macro trysetdestinybond failInstr:req
	.byte 0xaa
	.4byte \failInstr
	.endm

	.macro trysetdestinybondtohappen
	.byte 0xab
	.endm

	.macro settailwind failInstr:req
	.byte 0xac
	.4byte \failInstr
	.endm

	.macro tryspiteppreduce failInstr:req
	.byte 0xad
	.4byte \failInstr
	.endm

	.macro healpartystatus
	.byte 0xae
	.endm

	.macro cursetarget failInstr:req
	.byte 0xaf
	.4byte \failInstr
	.endm

	.macro trysetspikes failInstr:req
	.byte 0xb0
	.4byte \failInstr
	.endm

	.macro setvolatile battler:req, volatile:req, value=TRUE
	.byte 0xb1
	.byte \battler
	.byte \volatile
	.byte \value
	.endm

	.macro trysetperishsong failInstr:req
	.byte 0xb2
	.4byte \failInstr
	.endm

	.macro handlerollout
	.byte 0xb3
	.endm

	.macro jumpifconfusedandstatmaxed stat:req, jumpInstr:req
	.byte 0xb4
	.byte \stat
	.4byte \jumpInstr
	.endm

	.macro handlefurycutter
	.byte 0xb5
	.endm

	.macro setembargo failInstr:req
	.byte 0xb6
	.4byte \failInstr
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

	.macro jumpifnopursuitswitchdmg jumpInstr:req
	.byte 0xba
	.4byte \jumpInstr
	.endm

	.macro tryrestorehpberry battler:req
	.byte 0xbb
	.byte \battler
	.endm

	.macro halvehp failInstr:req
	.byte 0xbc
	.4byte \failInstr
	.endm

	.macro copyfoestats
	.byte 0xbd
	.endm

	.macro rapidspinfree
	.byte 0xbe
	.endm

	.macro recoverbasedonsunlight failInstr:req
	.byte 0xc0
	.4byte \failInstr
	.endm

	.macro setstickyweb failInstr:req
	.byte 0xc1
	.4byte \failInstr
	.endm

	.macro selectfirstvalidtarget
	.byte 0xc2
	.endm

	.macro setfutureattack
	.byte 0xc3
	.endm

	.macro trydobeatup endInstr:req, failInstr:req
	.byte 0xc4
	.4byte \endInstr
	.4byte \failInstr
	.endm

	.macro setsemiinvulnerablebit clear=FALSE
	.byte 0xc5
	.byte \clear
	.endm

	.macro clearsemiinvulnerablebit
	setsemiinvulnerablebit TRUE
	.endm

	.macro tryfiretwoturnmovenowbyeffect battler:req, checkChargeTurnEffects:req, jumpInstr:req
	.byte 0xc6
	.byte \battler
	.byte \checkChargeTurnEffects
	.4byte \jumpInstr
	.endm

	.macro tryfiretwoturnmovewithoutcharging battler:req, jumpInstr:req
	tryfiretwoturnmovenowbyeffect \battler, TRUE, \jumpInstr
	.endm

	.macro tryfiretwoturnmoveaftercharging battler:req, jumpInstr:req
	tryfiretwoturnmovenowbyeffect \battler, FALSE, \jumpInstr
	.endm

	.macro unused_0xC7
	.byte 0xc7
	.endm

	.macro unused_c8
	.byte 0xc8
	.endm

	.macro trymemento failInstr:req
	.byte 0xc9
	.4byte \failInstr
	.endm

	.macro setforcedtarget
	.byte 0xca
	.endm

	.macro setcharge battler:req
	.byte 0xcb
	.byte \battler
	.endm

	.macro callenvironmentattack
	.byte 0xcc
	.endm

	.macro curestatuswithmove failInstr:req
	.byte 0xcd
	.4byte \failInstr
	.endm

	.macro settorment failInstr:req
	.byte 0xce
	.4byte \failInstr
	.endm

	.macro jumpifnodamage jumpInstr:req
	.byte 0xcf
	.4byte \jumpInstr
	.endm

	.macro settaunt failInstr:req
	.byte 0xd0
	.4byte \failInstr
	.endm

	.macro trysethelpinghand failInstr:req
	.byte 0xd1
	.4byte \failInstr
	.endm

	.macro tryswapitems failInstr:req
	.byte 0xd2
	.4byte \failInstr
	.endm

	.macro trycopyability battler:req, failInstr:req
	.byte 0xd3
	.byte \battler
	.4byte \failInstr
	.endm

	.macro trywish failInstr:req
	.byte 0xd4
	.4byte \failInstr
	.endm

	.macro settoxicspikes failInstr:req
	.byte 0xd5
	.4byte \failInstr
	.endm

	.macro setgastroacid failInstr:req
	.byte 0xd6
	.4byte \failInstr
	.endm

	.macro setyawn failInstr:req
	.byte 0xd7
	.4byte \failInstr
	.endm

	.macro setdamagetohealthdifference failInstr:req
	.byte 0xd8
	.4byte \failInstr
	.endm

	.macro setroom
	.byte 0xd9
	.endm

	.macro tryswapabilities failInstr:req
	.byte 0xda
	.4byte \failInstr
	.endm

	.macro tryimprison failInstr:req
	.byte 0xdb
	.4byte \failInstr
	.endm

	.macro setstealthrock failInstr:req
	.byte 0xdc
	.4byte \failInstr
	.endm

	.macro trysetvolatile battler:req, _volatile:req, failInstr:req
	.byte 0xdd
	.byte \battler
	.byte \_volatile
	.4byte \failInstr
	.endm

	.macro assistattackselect failInstr:req
	.byte 0xde
	.4byte \failInstr
	.endm

	.macro trysetmagiccoat failInstr:req
	.byte 0xdf
	.4byte \failInstr
	.endm

	.macro trysetsnatch failInstr:req
	.byte 0xe0
	.4byte \failInstr
	.endm

	.macro unused2 ptr:req
	.byte 0xe1
	.4byte \ptr
	.endm

	.macro switchoutabilities battler:req
	.byte 0xe2
	.byte \battler
	.endm

	.macro jumpifhasnohp battler:req, jumpInstr:req
	.byte 0xe3
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro unused_0xE4
	.byte 0xe4
	.endm

	.macro pickup
	.byte 0xe5
	.endm

	.macro unused_0xE6
	.byte 0xe6
	.endm

	.macro unused_0xE7
	.byte 0xe7
	.endm

	.macro settypebasedhalvers failInstr:req
	.byte 0xe8
	.4byte \failInstr
	.endm

	.macro jumpifsubstituteblocks jumpInstr:req
	.byte 0xe9
	.4byte \jumpInstr
	.endm

	.macro tryrecycleitem failInstr:req
	.byte 0xea
	.4byte \failInstr
	.endm

	.macro settypetoenvironment failInstr:req
	.byte 0xeb
	.4byte \failInstr
	.endm

	.macro pursuitdoubles failInstr:req
	.byte 0xec
	.4byte \failInstr
	.endm

	.macro snatchsetbattlers
	.byte 0xed
	.endm

	.macro removescreens
	.byte 0xee
	.endm

	.macro handleballthrow
	.byte 0xef
	.endm

	.macro givecaughtmon passInstr:req
	.byte 0xf0
	.4byte \passInstr
	.endm

	.macro trysetcaughtmondexflags failInstr:req
	.byte 0xf1
	.4byte \failInstr
	.endm

	.macro displaydexinfo
	.byte 0xf2
	.endm

	.macro trygivecaughtmonnick
	.byte 0xf3
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

	.macro trainerslideout position:req
	.byte 0xf8
	.byte \position
	.endm

	.macro settelekinesis failInstr:req
	.byte 0xf9
	.4byte \failInstr
	.endm

	.macro swapstatstages stat:req
	.byte 0xfa
	.byte \stat
	.endm

	.macro averagestats stat:req
	.byte 0xfb
	.byte \stat
	.endm

	.macro jumpifcaptivateaffected jumpInstr:req
	.byte 0xfc
	.4byte \jumpInstr
	.endm

	.macro setnonvolatilestatus trigger:req
	.byte 0xfd
	.byte \trigger
	.endm

	.macro tryworryseed failInstr:req
	.byte 0xfe
	.4byte \failInstr
	.endm

	.macro callnative func:req
	.byte 0xff
	.4byte \func
	.endm

	.macro savetarget
	callnative BS_SaveTarget
	.endm

	.macro restoretarget
	callnative BS_RestoreTarget
	.endm

	.macro saveattacker
	callnative BS_SaveAttacker
	.endm

	.macro restoreattacker
	callnative BS_RestoreAttacker
	.endm

	.macro jumpifintimidateabilityprevented
	callnative BS_JumpIfIntimidateAbilityPrevented
	.endm

	.macro metalburstdamagecalculator failInstr:req
	callnative BS_CalcMetalBurstDmg
	.4byte \failInstr
	.endm

	.macro allyswitchswapbattlers
	callnative BS_AllySwitchSwapBattler
	.endm

	.macro tryallyswitch jumpInstr:req
	callnative BS_TryAllySwitch
	.4byte \jumpInstr
	.endm

	.macro dostockpilestatchangeswearoff, battler:req, statChangeInstr:req
	callnative BS_DoStockpileStatChangesWearOff
	.byte \battler
	.4byte \statChangeInstr
	.endm

	.macro jumpifmorethanhalfHP battler:req, jumpInstr:req
	callnative BS_JumpIfMoreThanHalfHP
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro itemrestorehp jumpInstr:req, restoreBattlerInstr:req
	callnative BS_ItemRestoreHP
	.4byte \jumpInstr
	.4byte \restoreBattlerInstr
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

	.macro tryrevertweatherform
	callnative BS_TryRevertWeatherForm
	.endm

	.macro trysetoctolock failInstr:req
	callnative BS_TrySetOctolock
	.4byte \failInstr
	.endm

	.macro setpledge jumpInstr:req
	callnative BS_SetPledge
	.4byte \jumpInstr
	.endm

	.macro setpledgestatus battler:req, sidestatus:req
	callnative BS_SetPledgeStatus
	.byte \battler
	.4byte \sidestatus
	.endm

	.macro setzeffect
	callnative BS_SetZEffect
	.endm

	@ Used by effects that may proc Symbiosis but do not call removeitem.
	.macro trysymbiosis battler:req
	callnative BS_TrySymbiosis
    .byte \battler
	.endm

	@ returns B_SIDE_x to gBattleCommunication[0]
	.macro getbattlerside battler:req
	callnative BS_GetBattlerSide
	.byte \battler
	.endm

	.macro checkparentalbondcounter counter:req, ptr:req
	callnative BS_CheckParentalBondCounter
	.byte \counter
	.4byte \ptr
	.endm

	.macro jumpifcantloseitem battler:req, ptr:req
	callnative BS_JumpIfCantLoseItem
	.byte \battler
	.4byte \ptr
	.endm

	.macro handlemegaevo battler:req, case:req
	callnative BS_HandleMegaEvolution
	.byte \battler
	.byte \case
	.endm

	.macro handleprimalreversion battler:req, case:req
	callnative BS_HandlePrimalReversion
	.byte \battler
	.byte \case
	.endm

	.macro handleultraburst battler:req, case:req
	callnative BS_HandleUltraBurst
	.byte \battler
	.byte \case
	.endm

	.macro jumpifshelltrap battler:req, jumpInstr:req
	callnative BS_JumpIfShellTrap
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro jumpifelectricabilityaffected battler:req, ability:req, jumpInstr:req
	callnative BS_JumpIfElectricAbilityAffected
	.byte \battler
	.2byte \ability
	.4byte \jumpInstr
	.endm

	.macro setterrain failInstr:req
	callnative BS_SetTerrain
	.4byte \failInstr
	.endm

	.macro jumpifterrainaffected battler:req, terrainFlags:req, jumpInstr:req
	callnative BS_JumpIfTerrainAffected
	.byte \battler
	.4byte \terrainFlags
	.4byte \jumpInstr
	.endm

	.macro tryreflecttype failInstr:req
	callnative BS_TryReflectType
	.4byte \failInstr
	.endm

	@ Used to active a different Max Move effects.
	.macro setmaxmoveeffect
	callnative BS_SetMaxMoveEffect
	.endm

	.macro setsteelsurge, failInstr:req
	callnative BS_SetSteelsurge
	.4byte \failInstr
	.endm

	.macro trysetparalysis, ptr:req
	callnative BS_TrySetParalysis
	.4byte \ptr
	.endm

	.macro trysetpoison, ptr:req
	callnative BS_TrySetPoison
	.4byte \ptr
	.endm

	.macro trysetpoisonparalysis, ptr:req
	callnative BS_TrySetPoisonParalyzis
	.4byte \ptr
	.endm

	.macro tryseteffectspore, ptr:req
	callnative BS_TrySetEffectSpore
	.4byte \ptr
	.endm

	.macro trysetconfusion, ptr:req
	callnative BS_TrySetConfusion
	.4byte \ptr
	.endm

	.macro trysetinfatuation, ptr:req
	callnative BS_TrySetInfatuation
	.4byte \ptr
	.endm

	.macro trysetescapeprevention, ptr:req
	callnative BS_TrySetEscapePrevention
	.4byte \ptr
	.endm

	.macro trysettorment, ptr:req
	callnative BS_TrySetTorment
	.4byte \ptr
	.endm

	.macro tryhealsixthhealth, ptr:req
	callnative BS_HealOneSixth
	.4byte \ptr
	.endm

	.macro tryrecycleberry, ptr:req
	callnative BS_TryRecycleBerry
	.4byte \ptr
	.endm

	.macro updatedynamax
	callnative BS_UpdateDynamax
	.endm

	.macro jumpiftargetdynamaxed, ptr:req
	callnative BS_JumpIfDynamaxed
	.4byte \ptr
	.endm

	.macro undodynamax battler:req
	callnative BS_UndoDynamax
	.byte \battler
	.endm

	.macro trytrainerslidezmovemsg
	callnative BS_TryTrainerSlideZMoveMsg
	.endm

	.macro trytrainerslidemegaevolutionmsg
	callnative BS_TryTrainerSlideMegaEvolutionMsg
	.endm

	.macro trytrainerslidedynamaxmsg
	callnative BS_TryTrainerSlideDynamaxMsg
	.endm

	.macro tryhealpulse failInstr:req
	callnative BS_TryHealPulse
	.4byte \failInstr
	.endm

	.macro trydefog clear:req, failInstr:req
	callnative BS_TryDefog
	.byte \clear
	.4byte \failInstr
	.endm

	.macro trytriggerstatusform
	callnative BS_TryTriggerStatusForm
	.endm

	.macro tryupperhand failInstr:req
	callnative BS_TryUpperHand
	.4byte \failInstr
	.endm

	.macro tryupdaterecoiltracker
	callnative BS_TryUpdateRecoilTracker
	.endm

	.macro tryupdateleaderscresttracker
	callnative BS_TryUpdateLeadersCrestTracker
	.endm

	.macro trytidyup clear:req, jumpInstr:req
	callnative BS_TryTidyUp
	.byte \clear
	.4byte \jumpInstr
	.endm

	.macro trygulpmissile
	callnative BS_TryGulpMissile
	.endm

	.macro tryactivategulpmissile
	callnative BS_TryActivateGulpMissile
	.endm

	.macro tryquash failInstr:req
	callnative BS_TryQuash
	.4byte \failInstr
	.endm

	.macro copyfoesstatincrease battler:req, failInstr:req
	callnative BS_CopyFoesStatIncrease
	.byte \battler
	.4byte \failInstr
	.endm

	.macro removeweather
	callnative BS_RemoveWeather
	.endm

	.macro applyterastallization
	callnative BS_ApplyTerastallization
	.endm

	.macro jumpifsleepclause jumpInstr:req
	callnative BS_JumpIfSleepClause
	.4byte \jumpInstr
	.endm

	.macro ficklebeamdamagecalculation
	callnative BS_FickleBeamDamageCalculation
	.endm

	.macro trytarshot failInstr:req
	callnative BS_TryTarShot
	.4byte \failInstr
	.endm

	.macro jumpifteainvulnerable battler:req, jumpInstr:req
	callnative BS_TeatimeInvul
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro jumpifteanoberry failInstr:req
	callnative BS_TeatimeTargets
	.4byte \failInstr
	.endm

	.macro trywindriderpower battler:req, failInstr:req
	callnative BS_TryWindRiderPower
	.byte \battler
	.4byte \failInstr
	.endm

	.macro activateweatherchangeabilities battler:req
	callnative BS_ActivateWeatherChangeAbilities
	.byte \battler
	.endm

	.macro activateterrainchangeabilities battler:req
	callnative BS_ActivateTerrainChangeAbilities
	.byte \battler
	.endm

    .macro resetterrainabilityflags
    callnative BS_ResetTerrainAbilityFlags
    .endm

	@ Stores Healing Wish effect.
	.macro storehealingwish battler:req
	callnative BS_StoreHealingWish
	.byte \battler
	.endm

	.macro tryrevivalblessing, failInstr:req
	callnative BS_TryRevivalBlessing
	.4byte \failInstr
	.endm

	.macro jumpifblockedbysoundproof battler:req, failInstr:req
	callnative BS_JumpIfBlockedBySoundproof
	.byte \battler
	.4byte \failInstr
	.endm

	.macro setmagiccoattarget
	callnative BS_SetMagicCoatTarget
	.endm

	.macro jumpifcommanderactive jumpInstr:req
	callnative BS_JumpIfCommanderActive
	.4byte \jumpInstr
	.endm

	.macro checkpokeflute
	callnative BS_CheckPokeFlute
	.endm

	.macro waitfanfare
	callnative BS_WaitFanfare
	.endm

	.macro setbeakblast
	callnative BS_SetBeakBlast
	.endm

	.macro cantarshotwork failInstr:req
	callnative BS_CanTarShotWork
	.4byte \failInstr
	.endm

	.macro removeterrain
	callnative BS_RemoveTerrain
	.endm

	.macro tryspectralthiefsteal jumpInstr:req
	callnative BS_TrySpectralThiefSteal
	.4byte \jumpInstr
	.endm

	.macro spectralthiefprintstats
	callnative BS_SpectralThiefPrintStats
	.endm

	.macro setmoveresultflags flags:req
	callnative BS_SetMoveResultFlags
	.2byte \flags
	.endm

	.macro clearmoveresultflags flags:req
	callnative BS_ClearMoveResultFlags
	.2byte \flags
	.endm

	.macro jumpifmoveresultflags flags:req failInstr:req
	callnative BS_JumpIfMoveResultFlags
	.2byte \flags
	.4byte \failInstr
	.endm

	.macro jumpifcriticalhit failInstr:req
	callnative BS_JumpIfCriticalHit
	.4byte \failInstr
	.endm

	.macro jumpifcangigantamax battler:req, jumpInstr:req
	callnative BS_JumpIfCanGigantamax
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro jumpiflastuseditemholdeffect holdEffect:req, secondaryId:req, jumpInstr:req
	callnative BS_JumpIfLastUsedItemHoldEffect
	.byte \holdEffect
	.2byte \secondaryId
	.4byte \jumpInstr
	.endm

	.macro swapsidestatuses
	callnative BS_CourtChangeSwapSideStatuses
	.endm

	.macro swapstats stat:req
	callnative BS_SwapStats
	.byte \stat
	.endm

	.macro restoresavedmove
	callnative BS_RestoreSavedMove
	.endm

@ helpful macros
	.macro setstatchanger stat:req, stages:req, down:req
	setbyte sSTATCHANGER, \stat | \stages << 3 | \down << 7
	.endm

	.macro setmoveeffect effect:req
	sethword sMOVE_EFFECT, \effect
	sethword sSAVED_MOVE_EFFECT, \effect
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

	.macro jumpifbytenotequal byte1:req, byte2:req, jumpInstr:req
	jumpifarraynotequal \byte1, \byte2, 0x1, \jumpInstr
	.endm

	.macro jumpifbyteequal byte1:req, byte2:req, jumpInstr:req
	jumpifarrayequal \byte1, \byte2, 0x1, \jumpInstr
	.endm

	.macro jumpifmove move:req, jumpInstr:req
	jumpifhalfword CMP_EQUAL, gCurrentMove, \move, \jumpInstr
	.endm

	.macro jumpifnotmove move:req, jumpInstr:req
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, \move, \jumpInstr
	.endm

	.macro jumpifnotchosenmove move:req, jumpInstr:req
	jumpifhalfword CMP_NOT_EQUAL, gChosenMove, \move, \jumpInstr
	.endm

	.macro jumpifmovehadnoeffect jumpInstr:req
	jumpifmoveresultflags MOVE_RESULT_NO_EFFECT, \jumpInstr
	.endm

	.macro jumpifside battler:req, side:req, equalJumpInstr:req
	getbattlerside \battler
	jumpifbyte CMP_EQUAL, gBattleCommunication, \side, \equalJumpInstr
	.endm

	.macro jumpifbattletype flags:req, jumpInstr:req
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, \flags, \jumpInstr
	.endm

	.macro jumpifnotbattletype flags:req, jumpInstr:req
	jumpifword CMP_NO_COMMON_BITS, gBattleTypeFlags, \flags, \jumpInstr
	.endm

	.macro dmg_1_8_targethp
	manipulatedamage DMG_1_8_TARGET_HP
	.endm

	.macro dmgtomaxattackerhp
	manipulatedamage DMG_FULL_ATTACKER_HP
	.endm

	.macro jumpifflowerveil jumpInstr:req
	jumpifnottype BS_TARGET, TYPE_GRASS, 1f
	jumpifability BS_TARGET_SIDE, ABILITY_FLOWER_VEIL, \jumpInstr
	1:
	.endm

	.macro jumpifflowerveilattacker jumpInstr:req
	jumpifnottype BS_ATTACKER, TYPE_GRASS, 1f
	jumpifability BS_ATTACKER_SIDE, ABILITY_FLOWER_VEIL, \jumpInstr
	1:
	.endm

	.macro jumpifabilitycantbesuppressed battler:req, jumpInstr:req
	callnative BS_JumpIfAbilityCantBeSuppressed
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro tryactivateabilityshield battler:req
	callnative BS_TryActivateAbilityShield
	.byte \battler
	.endm

	.macro trysynchronoise jumpInstr:req
	callnative BS_TrySynchronoise
	.4byte \jumpInstr
	.endm

	.macro jumpifroarfails jumpInstr:req
	callnative BS_JumpIfRoarFails
	.4byte \jumpInstr
	.endm

	.macro jumpifabsent battler:req, jumpInstr:req
	callnative BS_JumpIfAbsent
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro jumpifnoholdeffect battler:req, holdEffect:req, jumpInstr:req
	jumpifholdeffect \battler, \holdEffect, \jumpInstr, FALSE
	.endm

	.macro jumpifholdeffect battler:req, holdEffect:req, jumpInstr:req, equal:req
	callnative BS_JumpIfHoldEffect
	.byte \battler
	.byte \holdEffect
	.4byte \jumpInstr
	.byte \equal
	.endm

	.macro jumpifnoally battler:req, jumpInstr:req
	callnative BS_JumpIfNoAlly
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro infatuatewithbattler battler:req, infatuateWith:req
	callnative BS_InfatuateWithBattler
	.byte \battler
	.byte \infatuateWith
	.endm

	.macro setlastuseditem battler:req
	callnative BS_SetLastUsedItem
	.byte \battler
	.endm

	.macro trysetfairylock failInstr:req
	callnative BS_TrySetFairyLock
	.4byte \failInstr
	.endm

	.macro getstatvalue stat:req
	callnative BS_GetStatValue
	.byte \stat
	.endm

	.macro jumpiffullhp battler:req, jumpInstr:req
	callnative BS_JumpIfFullHp
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro tryfriskmessage
	callnative BS_TryFriskMessage
	.endm

	.macro settracedability battler:req
	callnative BS_SetTracedAbility
	.byte \battler
	.endm

	.macro tryillusionoff battler:req
	callnative BS_TryIllusionOff
	.byte \battler
	.endm

	.macro setspriteignore0hp ignore0HP:req
	callnative BS_SetSpriteIgnore0Hp
	.byte \ignore0HP
	.endm

	.macro updatenick
	callnative BS_UpdateNick
	.endm

	.macro jumpifnotberry battler:req, jumpInstr:req
	callnative BS_JumpIfNotBerry
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro gravityonairbornemons
	callnative BS_GravityOnAirborneMons
	.endm

	.macro tryacupressure failInstr:req
	callnative BS_TryAcupressure
	.4byte \failInstr
	.endm

	.macro cancelmultiturnmoves
	callnative BS_CancelMultiTurnMoves
	.endm

	.macro isrunningimpossible
	callnative BS_IsRunningImpossible
	.endm

	.macro getmovetarget
	callnative BS_GetMoveTarget
	.endm

	@ Will jump to script pointer if the specified battler has or has not fainted.
	.macro jumpiffainted battler:req, value:req, ptr:req
	getbattlerfainted \battler
	jumpifbyte CMP_EQUAL, gBattleCommunication, \value, \ptr
	.endm

	.macro getbattlerfainted battler:req
	callnative BS_GetBattlerFainted
	.byte \battler
	.endm

	.macro resetswitchinabilitybits
	callnative BS_ResetSwitchInAbilityBits
	.endm

	.macro updatechoicemoveonlvlup
	callnative BS_UpdateChoiceMoveOnLvlUp
	.endm

	.macro resetplayerfainted
	callnative BS_ResetPlayerFainted
	.endm

	.macro palaceflavortext
	callnative BS_PalaceFlavorText
	.endm

	.macro arenajudgmentwindow
	callnative BS_ArenaJudgmentWindow
	.endm

	.macro arenaopponentmonlost
	callnative BS_ArenaOpponentMonLost
	.endm

	.macro arenaplayermonlost
	callnative BS_ArenaPlayerMonLost
	.endm

	.macro arenabothmonslost
	callnative BS_ArenaBothMonsLost
	.endm

	.macro forfeityesnobox
	callnative BS_ForfeitYesNoBox
	.endm

	.macro drawarenareftextbox
	callnative BS_DrawArenaRefTextBox
	.endm

	.macro erasearenareftextbox
	callnative BS_EraseArenaRefTextBox
	.endm

	.macro arenajudgmentstring id:req
	callnative BS_ArenaJudgmentString
	.byte \id
	.endm

	.macro arenawaitmessage id:req
	callnative BS_ArenaWaitMessage
	.byte \id
	.endm

	.macro waitcry
	callnative BS_WaitCry
	.endm

	.macro returnopponentmon1toball
	callnative BS_ReturnOpponentMon1ToBall
	.endm

	.macro returnopponentmon2toball
	callnative BS_ReturnOpponentMon2ToBall
	.endm

	.macro volumedown
	callnative BS_VolumeDown
	.endm

	.macro volumeup
	callnative BS_VolumeUp
	.endm

	.macro setalreadystatusedmoveattempt
	callnative BS_SetAlreadyStatusedMoveAttempt
	.endm

	.macro palacetryescapestatus
	callnative BS_PalaceTryEscapeStatus
	.endm

	.macro setteleportoutcome battler:req
	callnative BS_SetTeleportOutcome
	.byte \battler
	.endm

	.macro playtrainerdefeatedmusic
	callnative BS_PlayTrainerDefeatedMusic
	.endm

	.macro stattextbuffer
	callnative BS_StatTextBuffer
	.endm

	.macro switchinabilities battler:req
	callnative BS_SwitchinAbilities
	.byte \battler
	.endm

	.macro instanthpdrop
	callnative BS_InstantHpDrop
	.endm

	.macro clearstatus
	callnative BS_ClearStatus
	.endm

	.macro restoremovepp
	callnative BS_RestoreMovePp
	.endm

	.macro tryactivatereceiver battler:req
	callnative BS_TryActivateReceiver
	.byte \battler
	.endm

	.macro tryactivatesoulheart
	callnative BS_TryActivateSoulheart
	.endm

	.macro playmoveanimation move:req
	callnative BS_PlayMoveAnimation
	.2byte \move
	.endm

	.macro setluckychant failInstr:req
	callnative BS_SetLuckyChant
	.4byte \failInstr
	.endm

	.macro setsimplebeam failInstr:req
	callnative BS_SetSimpleBeam
	.4byte \failInstr
	.endm

	.macro tryentrainment failInstr:req
	callnative BS_TryEntrainment
	.4byte \failInstr
	.endm

	.macro setlastusedability
	callnative BS_SetLastUsedAbility
	.endm

	.macro invertstatstages
	callnative BS_InvertStatStages
	.endm

	.macro tryelectrify failInstr:req
	callnative BS_TryElectrify
	.4byte \failInstr
	.endm

	.macro trysoak failInstr:req
	callnative BS_TrySoak
	.4byte \failInstr
	.endm

	.macro handleformchange battler:req, case_:req
	callnative BS_HandleFormChange
	.byte \battler
	.byte \case_
	.endm

	.macro tryautotomize failInstr:req
	callnative BS_TryAutotomize
	.4byte \failInstr
	.endm

	.macro tryinstruct failInstr:req
	callnative BS_TryInstruct
	.4byte \failInstr
	.endm

	.macro showabilitypopup
	callnative BS_ShowAbilityPopup
	.endm

	.macro updateabilitypopup
	callnative BS_UpdateAbilityPopup
	.endm

	.macro jumpiftargetally jumpInstr:req
	callnative BS_JumpIfTargetAlly
	.4byte \jumpInstr
	.endm

	.macro trypsychoshift failInstr:req sleepClauseFailInstr:req
	callnative BS_TryPsychoShift
	.4byte \failInstr
	.4byte \sleepClauseFailInstr
	.endm

	.macro curestatus battler:req
	callnative BS_CureStatus
	.byte \battler
	.endm

	.macro powertrick
	callnative BS_PowerTrick
	.endm

	.macro tryafteryou failInstr:req
	callnative BS_TryAfterYou
	.4byte \failInstr
	.endm

	.macro trybestow failInstr:req
	callnative BS_TryBestow
	.4byte \failInstr
	.endm

	.macro handletrainerslidemsg battler:req, case_:req
	callnative BS_HandleTrainerSlideMsg
	.byte \battler
	.byte \case_
	.endm

	.macro trytrainerslidemsgfirstoff battler:req
	callnative BS_TryTrainerSlideMsgFirstOff
	.byte \battler
	.endm

	.macro trytrainerslidemsglaston battler:req
	callnative BS_TryTrainerSlideMsgLastOn
	.byte \battler
	.endm

	.macro setauroraveil
	callnative BS_SetAuroraVeil
	.endm

	.macro trythirdtype failInstr:req
	callnative BS_TryThirdType
	.4byte \failInstr
	.endm

	.macro destroyabilitypopup
	callnative BS_DestroyAbilityPopup
	.endm

	.macro gettotemboost jumpInstr:req
	callnative BS_GetTotemBoost
	.4byte \jumpInstr
	.endm

	.macro activateitemeffects
	callnative BS_ActivateItemEffects
	.endm

	.macro tryroomservice battler:req, failInstr:req
	callnative BS_TryRoomService
	.byte \battler
	.4byte \failInstr
	.endm

	.macro tryterrainseed battler:req, failInstr:req
	callnative BS_TryTerrainSeed
	.byte \battler
	.4byte \failInstr
	.endm

	.macro makeinvisible battler:req
	callnative BS_MakeInvisible
	.byte \battler
	.endm

	.macro jumpifteamhealthy jumpInstr:req
	callnative BS_JumpIfTeamHealthy
	.4byte \jumpInstr
	.endm

	.macro tryhealquarterhealth battler:req, failInstr:req
	callnative BS_TryHealQuarterHealth
	.byte \battler
	.4byte \failInstr
	.endm

	.macro jumpifunder200 jumpInstr:req
	callnative BS_JumpIfUnder200
	.4byte \jumpInstr
	.endm

	.macro setskydrop
	callnative BS_SetSkyDrop
	.endm

	.macro clearskydrop failInstr:req
	callnative BS_ClearSkyDrop
	.4byte \failInstr
	.endm

	.macro skydropyawn
	callnative BS_SkyDropYawn
	.endm

	.macro jumpifpranksterblocked jumpInstr:req
	callnative BS_JumpIfPranksterBlocked
	.4byte \jumpInstr
	.endm

	.macro trytoclearprimalweather
	callnative BS_TryToClearPrimalWeather
	.endm

	.macro tryendneutralizinggas
	callnative BS_TryEndNeutralizingGas
	.endm

	.macro getrototillertargets failInstr:req
	callnative BS_GetRototillerTargets
	.4byte \failInstr
	.endm

	.macro jumpifnotrototilleraffected jumpInstr:req
	callnative BS_JumpIfNotRototillerAffected
	.4byte \jumpInstr
	.endm

	.macro consumeberry battler:req, fromBattler:req
	callnative BS_ConsumeBerry
	.byte \battler
	.byte \fromBattler
	.endm

	.macro jumpifweatheraffected flags:req, jumpInstr:req
	callnative BS_JumpIfWeatherAffected
	.2byte \flags
	.4byte \jumpInstr
	.endm

	.macro jumpifspecies species:req, jumpInstr:req
	callnative BS_JumpIfSpecies
	.2byte \species
	.4byte \jumpInstr
	.endm

	.macro jumpifleafguardprotected battler:req, jumpInstr:req
	callnative BS_JumpIfLeafGuardProtected
	.byte \battler
	.4byte \jumpInstr
	.endm

	.macro setattackertostickywebuser
	callnative BS_SetAttackerToStickyWebUser
	.endm

	.macro cutonethirdhpandraisestats failInstr:req
	callnative BS_CutOneThirdHpAndRaiseStats
	.4byte \failInstr
	.endm

	.macro setpoltergeistmessage failInstr:req
	callnative BS_SetPoltergeistMessage
	.4byte \failInstr
	.endm

	.macro curecertainstatuses
	callnative BS_CureCertainStatuses
	.endm

	.macro tryresetnegativestatstages
	callnative BS_TryResetNegativeStatStages
	.endm

	.macro jumpiflastuseditemberry jumpInstr:req
	callnative BS_JumpIfLastUsedItemBerry
	.4byte \jumpInstr
	.endm

	.macro savebattleritem
	callnative BS_SaveBattlerItem
	.endm

	.macro restorebattleritem
	callnative BS_RestoreBattlerItem
	.endm

	.macro battleritemtolastuseditem
	callnative BS_BattlerItemToLastUsedItem
	.endm

@ various remaining from pokefirered
	.macro getbattlersforrecall
	callnative BS_GetBattlersForRecall
	.endm

	.macro setallytonexttarget jumpInstr:req
	jumpifbyte CMP_GREATER_THAN, gBattlerTarget, 0x1, 1f
	addbyte gBattlerTarget, 0x2
	goto \jumpInstr
	1:
	subbyte gBattlerTarget, 0x2
	goto \jumpInstr
	.endm

	.macro setallytonextattacker jumpInstr:req
	jumpifbyte CMP_GREATER_THAN, gBattlerAttacker, 0x1, 1f
	addbyte gBattlerAttacker, 0x2
	goto \jumpInstr
	1:
	subbyte gBattlerAttacker, 0x2
	goto \jumpInstr
	.endm

	.macro jumpifsafeguard jumpInstr:req
	jumpifability BS_ATTACKER, ABILITY_INFILTRATOR, 1f
	jumpifsideaffecting BS_TARGET, SIDE_STATUS_SAFEGUARD, \jumpInstr
	1:
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
	.if \animation == FALSE
		setbyte sSTAT_ANIM_PLAYED, TRUE
	.endif
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, \script
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

	.macro flushtextbox
	printstring STRINGID_EMPTYSTRING3
	waitmessage 1
	.endm

	.macro jumpifnowhiteout jumpInstr:req
	callnative BS_JumpIfNoWhiteOut
	.4byte \jumpInstr
	.endm

	.macro tryboosterenergy onFieldStatus:req
	callnative BS_TryBoosterEnergy
	.byte \onFieldStatus
	.endm

	.macro jumpifgenconfiglowerthan tag:req, gen:req, jumpInstr:req
	callnative BS_JumpIfGenConfigLowerThan
	.2byte \tag
	.byte \gen
	.4byte \jumpInstr
	.endm
