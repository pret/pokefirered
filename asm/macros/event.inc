	@ Does nothing.
	.macro nop
	.byte 0x00
	.endm

	@ Does nothing.
	.macro nop1
	.byte 0x01
	.endm

	@ Terminates script execution.
	.macro end
	.byte 0x02
	.endm

	@ Jumps back to after the last-executed call statement, and continues script execution from there.
	.macro return
	.byte 0x03
	.endm

	@ Jumps to destination and continues script execution from there. The location of the calling script is remembered and can be returned to later.
	.macro call destination:req
	.byte 0x04
	.4byte \destination
	.endm

	@ Jumps to destination and continues script execution from there.
	.macro goto destination:req
	.byte 0x05
	.4byte \destination
	.endm

	@ If the result of the last comparison matches condition (see Comparison operators), jumps to destination and continues script execution from there.
	.macro goto_if condition:req, destination:req
	.byte 0x06
	.byte \condition
	.4byte \destination
	.endm

	@ If the result of the last comparison matches condition (see Comparison operators), calls destination.
	.macro call_if condition:req, destination:req
	.byte 0x07
	.byte \condition
	.4byte \destination
	.endm

	@ Jumps to the standard function at index function.
	.macro gotostd function:req
	.byte 0x08
	.byte \function
	.endm

	@ Calls the standard function at index function.
	.macro callstd function:req
	.byte 0x09
	.byte \function
	.endm

	@ If the result of the last comparison matches condition (see Comparison operators), jumps to the standard function at index function.
	.macro gotostd_if condition:req, function:req
	.byte 0x0a
	.byte \condition
	.byte \function
	.endm

	@ If the result of the last comparison matches condition (see Comparison operators), calls the standard function at index function.
	.macro callstd_if condition:req, function:req
	.byte 0x0b
	.byte \condition
	.byte \function
	.endm

	@ Executes a script stored in a default RAM location.
	.macro gotoram
	.byte 0x0c
	.endm

	@ Terminates script execution and "resets the script RAM".
	.macro killscript
	.byte 0x0d
	.endm

	@ Sets mystery event status
	.macro setmysteryeventstatus value:req
	.byte 0x0e
	.byte \value
	.endm

	@ Sets the specified script bank to immediate value.
	.macro loadword destination:req, value:req
	.byte 0x0f
	.byte \destination
	.4byte \value
	.endm

	@ Sets the specified script bank to immediate value.
	.macro loadbyte destination:req, value:req
	.byte 0x10
	.byte \destination
	.byte \value
	.endm

	@ Sets the byte at offset to value.
	.macro writebytetoaddr value:req, offset:req
	.byte 0x11
	.byte \value
	.4byte \offset
	.endm

	@ Copies the byte value at source into the specified script bank.
	.macro loadbytefromaddr destination:req, source:req
	.byte 0x12
	.byte \destination
	.4byte \source
	.endm

	@ Not sure. Judging from XSE's description I think it takes the least-significant byte in bank source and writes it to destination.
	.macro setptrbyte source:req, destination:req
	.byte 0x13
	.byte \source
	.4byte \destination
	.endm

	@ Copies the contents of bank source into bank destination.
	.macro copylocal destination:req, source:req
	.byte 0x14
	.byte \destination
	.byte \source
	.endm

	@ Copies the byte at source to destination, replacing whatever byte was previously there.
	.macro copybyte destination:req, source:req
	.byte 0x15
	.4byte \destination
	.4byte \source
	.endm

	@ Changes the value of destination to value.
	.macro setvar destination:req, value:req
	.byte 0x16
	.2byte \destination
	.2byte \value
	.endm

	@ Changes the value of destination by adding value to it. Overflow is not prevented (0xFFFF + 1 = 0x0000).
	.macro addvar destination:req, value:req
	.byte 0x17
	.2byte \destination
	.2byte \value
	.endm

	@ Changes the value of destination by subtracting value to it. Overflow is not prevented (0x0000 - 1 = 0xFFFF).
	.macro subvar destination:req, value:req
	.byte 0x18
	.2byte \destination
	.2byte \value
	.endm

	@ Copies the value of source into destination.
	.macro copyvar destination:req, source:req
	.byte 0x19
	.2byte \destination
	.2byte \source
	.endm

	@ If source is not a variable, then this function acts like setvar. Otherwise, it acts like copyvar.
	.macro setorcopyvar destination:req, source:req
	.byte 0x1a
	.2byte \destination
	.2byte \source
	.endm

	@ Compares the values of script banks a and b, after forcing the values to bytes.
	.macro compare_local_to_local byte1:req, byte2:req
	.byte 0x1b
	.byte \byte1
	.byte \byte2
	.endm

	@ Compares the least-significant byte of the value of script bank a to a fixed byte value (b).
	.macro compare_local_to_value a:req, b:req
	.byte 0x1c
	.byte \a
	.byte \b
	.endm

	@ Compares the least-significant byte of the value of script bank a to the byte located at offset b.
	.macro compare_local_to_addr a:req, b:req
	.byte 0x1d
	.byte \a
	.4byte \b
	.endm

	@ Compares the byte located at offset a to the least-significant byte of the value of script bank b.
	.macro compare_addr_to_local a:req, b:req
	.byte 0x1e
	.4byte \a
	.byte \b
	.endm

	@ Compares the byte located at offset a to a fixed byte value (b).
	.macro compare_addr_to_value a:req, b:req
	.byte 0x1f
	.4byte \a
	.byte \b
	.endm

	@ Compares the byte located at offset a to the byte located at offset b.
	.macro compare_addr_to_addr a:req, b:req
	.byte 0x20
	.4byte \a
	.4byte \b
	.endm

	@ Compares the value of `var` to a fixed word value (b).
	.macro compare_var_to_value var:req, value:req
	.byte 0x21
	.2byte \var
	.2byte \value
	.endm

	@ Compares the value of `var` to the value of `var2`.
	.macro compare_var_to_var var1:req, var2:req
	.byte 0x22
	.2byte \var1
	.2byte \var2
	.endm

	@ Generic compare macro which attempts to deduce argument types based on their values
	@ Any values between 0x4000 to 0x40FF and 0x8000 to 0x8014 are considered event variable identifiers
	.macro compare var:req, arg:req
		.if ((\arg >= VARS_START && \arg <= VARS_END) || (\arg >= SPECIAL_VARS_START && \arg <= SPECIAL_VARS_END))
			compare_var_to_var \var, \arg
		.else
			compare_var_to_value \var, \arg
		.endif
	.endm

	@ Calls the native C function stored at `func`.
	.macro callnative func:req
	.byte 0x23
	.4byte \func
	.endm

	@ Replaces the script with the function stored at `func`. Execution returns to the bytecode script when func returns TRUE.
	.macro gotonative func:req
	.byte 0x24
	.4byte \func
	.endm

	@ Calls a special function; that is, a piece of ASM code designed for use by scripts and listed in a table of pointers.
	.macro special function:req
	.byte 0x25
	.2byte SPECIAL_\function
	.endm

	@ Calls a special function. That function's output (if any) will be written to the variable you specify.
	.macro specialvar output:req, function:req
	.byte 0x26
	.2byte \output
	.2byte SPECIAL_\function
	.endm

	@ Blocks script execution until a command or ASM code manually unblocks it. Generally used with specific commands and specials. If this command runs, and a subsequent command or piece of ASM does not unblock state, the script will remain blocked indefinitely (essentially a hang).
	.macro waitstate
	.byte 0x27
	.endm

	@ Blocks script execution for time (frames? milliseconds?).
	.macro delay time:req
	.byte 0x28
	.2byte \time
	.endm

	@ Sets a to 1.
	.macro setflag a:req
	.byte 0x29
	.2byte \a
	.endm

	@ Sets a to 0.
	.macro clearflag a:req
	.byte 0x2a
	.2byte \a
	.endm

	@ Compares a to 1.
	.macro checkflag a:req
	.byte 0x2b
	.2byte \a
	.endm

	@ In FireRed, this command is a nop.
	.macro initclock hour:req minute:req
	.byte 0x2c
	.endm

	@ In FireRed, this command is a nop.
	.macro dodailyevents
	.byte 0x2d
	.endm

	@ Resets the values of variables VAR_0x8000, VAR_0x8001, and VAR_0x8002.
	.macro gettime
	.byte 0x2e
	.endm

	@ Plays the specified (sound_number) sound. Only one sound may play at a time, with newer ones interrupting older ones.
	.macro playse sound_number:req
	.byte 0x2f
	.2byte \sound_number
	.endm

	@ Blocks script execution until the currently-playing sound (triggered by sound) finishes playing.
	.macro waitse
	.byte 0x30
	.endm

	@ Plays the specified (fanfare_number) fanfare.
	.macro playfanfare fanfare_number:req
	.byte 0x31
	.2byte \fanfare_number
	.endm

	@ Blocks script execution until all currently-playing fanfares finish.
	.macro waitfanfare
	.byte 0x32
	.endm

	@ Plays the specified (song_number) song. The byte is apparently supposed to be 0x00.
	.macro playbgm song_number:req, unknown:req
	.byte 0x33
	.2byte \song_number
	.byte \unknown
	.endm

	@ Plays the specified (song_number) song.
	.macro savebgm song_number:req
	.byte 0x34
	.2byte \song_number
	.endm

	@ Crossfades the currently-playing song into the map's default song.
	.macro fadedefaultbgm
	.byte 0x35
	.endm

	@ Crossfades the currently-playng song into the specified (song_number) song.
	.macro fadenewbgm song_number:req
	.byte 0x36
	.2byte \song_number
	.endm

	@ Fades out the currently-playing song.
	.macro fadeoutbgm speed:req
	.byte 0x37
	.byte \speed
	.endm

	@ Fades the currently-playing song back in.
	.macro fadeinbgm speed:req
	.byte 0x38
	.byte \speed
	.endm

	@ Sends the player to Warp warp on Map bank.map. If the specified warp is 0xFF, then the player will instead be sent to (x, y) on the map.
	.macro warp map:req, warp:req, x:req, y:req
	.byte 0x39
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Clone of warp that does not play a sound effect.
	.macro warpsilent map:req, warp:req, x:req, y:req
	.byte 0x3a
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Clone of warp that uses "a walking effect".
	.macro warpdoor map:req, warp:req, x:req, y:req
	.byte 0x3b
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Warps the player to another map using a hole animation.
	.macro warphole map:req
	.byte 0x3c
	map \map
	.endm

	@ Clone of warp that uses a teleport effect. It is apparently only used in R/S/E.[source]
	.macro warpteleport map:req, warp:req, x:req, y:req
	.byte 0x3d
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Clone of warp. Used by an (unused?) Safari Zone script to return the player to the gatehouse and end the Safari Game.
	.macro setwarp map:req, warp:req, x:req, y:req
	.byte 0x3e
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Sets a default warp place. If a warp tries to send the player to Warp 127 on Map 127.127, they will instead be sent here. Useful when a map has warps that need to go to script-controlled locations (i.e. elevators).
	.macro setdynamicwarp map:req, warp:req, x:req, y:req
	.byte 0x3f
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Clone of warp3, except that this writes data to different offsets...
	.macro setdivewarp map:req, warp:req, x:req, y:req
	.byte 0x40
	map \map
	.byte \warp
	.2byte \x
	.2byte \x
	.endm

	@ Clone of warp3, except that this writes data to different offsets...
	.macro setholewarp map:req, warp:req, x:req, y:req
	.byte 0x41
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Retrieves the player's zero-indexed X- and Y-coordinates in the map, and stores them in the specified variables.
	.macro getplayerxy x:req, y:req
	.byte 0x42
	.2byte \x
	.2byte \y
	.endm

	@ Retrieves the number of Pokemon in the player's party, and stores that number in VAR_RESULT.
	.macro getpartysize
	.byte 0x43
	.endm

	@ Attempts to add quantity of item index to the player's Bag. If the player has enough room, the item will be added and VAR_RESULT will be set to TRUE; otherwise, VAR_RESULT is set to FALSE.
	.macro additem index:req, quantity=1
	.byte 0x44
	.2byte \index
	.2byte \quantity
	.endm

	@ Removes quantity of item index from the player's Bag.
	.macro removeitem index:req, quantity=1
	.byte 0x45
	.2byte \index
	.2byte \quantity
	.endm

	@ Checks if the player has enough space in their Bag to hold quantity more of item index. Sets VAR_RESULT to TRUE if there is room, or FALSE is there is no room.
	.macro checkitemspace index:req, quantity:req
	.byte 0x46
	.2byte \index
	.2byte \quantity
	.endm

	@ Checks if the player has quantity or more of item index in their Bag. Sets VAR_RESULT to TRUE if the player has enough of the item, or FALSE if they have fewer than quantity of the item.
	.macro checkitem index:req, quantity:req
	.byte 0x47
	.2byte \index
	.2byte \quantity
	.endm

	@ Checks which Bag pocket the specified item belongs in, and writes the pocket value (POCKET_*) to VAR_RESULT. This script is used to show the name of the proper Bag pocket when the player receives an item via callstd (simplified to giveitem in XSE).
	.macro checkitemtype index:req
	.byte 0x48
	.2byte \index
	.endm

	@ Adds a quantity amount of item index to the player's PC. Both arguments can be variables.
	.macro addpcitem index:req, quantity:req
	.byte 0x49
	.2byte \index
	.2byte \quantity
	.endm

	@ Checks for quantity amount of item index in the player's PC. Both arguments can be variables.
	.macro checkpcitem index:req, quantity:req
	.byte 0x4a
	.2byte \index
	.2byte \quantity
	.endm

	@ In FireRed, this command is a nop. (The argument is read, but not used for anything.)
	.macro adddecor decoration:req
	.byte 0x4b
	.2byte \decoration
	.endm

	@ In FireRed, this command is a nop. (The argument is read, but not used for anything.)
	.macro removedecor decoration:req
	.byte 0x4c
	.2byte \decoration
	.endm

	@ In FireRed, this command is a nop. (The argument is read, but not used for anything.)
	.macro hasdecor decoration:req
	.byte 0x4d
	.2byte \decoration
	.endm

	@ In FireRed, this command is a nop. (The argument is read, but not used for anything.)
	.macro checkdecor decoration:req
	.byte 0x4e
	.2byte \decoration
	.endm

	@ Applies the movement data at movements to the specified (index) Object. Also closes any standard message boxes that are still open.
	@ If no map is specified, then the current map is used.
	.macro applymovement index:req, movements:req, mapGroup, mapNum
		.ifb \mapGroup
			.byte 0x4f
			.2byte \index
			.4byte \movements
		.else
			.byte 0x50
			.2byte \index
			.4byte \movements
			.byte \mapGroup
			.byte \mapNum
		.endif
	.endm

	@ Blocks script execution until the movements being applied to the specified (index) Object finish. If the specified Object is 0x0000, then the command will block script execution until all Objects affected by applymovement finish their movements. If the specified Object is not currently being manipulated with applymovement, then this command does nothing.
	@ If no map is specified, then the current map is used.
	.macro waitmovement index:req, mapGroup, mapNum
		.ifb \mapGroup
			.byte 0x51
			.2byte \index
		.else
			.byte 0x52
			.2byte \index
			.byte \mapGroup
			.byte \mapNum
		.endif
	.endm

	@ Attempts to hide the specified (localId) Object on the specified (map_group, map_num) map, by setting its visibility flag if it has a valid one. If the Object does not have a valid visibility flag, this command does nothing.
	@ If no map is specified, then the current map is used.
	.macro removeobject localId:req, mapGroup, mapNum
		.ifb \mapGroup
			.byte 0x53
			.2byte \localId
		.else
			.byte 0x54
			.2byte \localId
			.byte \mapGroup
			.byte \mapNum
		.endif
	.endm

	.macro addobject localId:req, mapGroup, mapNum
		.ifb \mapGroup
			.byte 0x55
			.2byte \localId
		.else
			.byte 0x56
			.2byte \localId
			.byte \mapGroup
			.byte \mapNum
		.endif
	.endm

	@ Sets the specified (index) Object's position on the current map.
	.macro setobjectxy index:req, x:req, y:req
	.byte 0x57
	.2byte \index
	.2byte \x
	.2byte \y
	.endm

	.macro showobject index:req, map:req
	.byte 0x58
	.2byte \index
	map \map
	.endm

	.macro hideobject index:req, map:req
	.byte 0x59
	.2byte \index
	map \map
	.endm

	@ If the script was called by an Object, then that Object will turn to face toward the metatile that the player is standing on.
	.macro faceplayer
	.byte 0x5a
	.endm

	.macro turnobject index:req, direction:req
	.byte 0x5b
	.2byte \index
	.byte \direction
	.endm

	@ If the Trainer flag for Trainer index is not set, this command does absolutely nothing.
	.macro trainerbattle type:req, trainer:req, word:req, pointer1:req, pointer2, pointer3, pointer4
		.byte 0x5c
		.byte \type
		.2byte \trainer
		.2byte \word
		.if \type == TRAINER_BATTLE_SINGLE
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
		.elseif \type == TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
			.4byte \pointer3 @ event script
		.elseif \type == TRAINER_BATTLE_CONTINUE_SCRIPT
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
			.4byte \pointer3 @ event script
		.elseif \type == TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT
			.4byte \pointer1 @ text
		.elseif \type == TRAINER_BATTLE_DOUBLE
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
			.4byte \pointer3 @ text
		.elseif \type == TRAINER_BATTLE_REMATCH
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
		.elseif \type == TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
			.4byte \pointer3 @ text
			.4byte \pointer4 @ event script
		.elseif \type == TRAINER_BATTLE_REMATCH_DOUBLE
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
			.4byte \pointer3 @ text
		.elseif \type == TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
			.4byte \pointer3 @ text
			.4byte \pointer4 @ event script
		.elseif \type == TRAINER_BATTLE_EARLY_RIVAL
			.4byte \pointer1 @ text
			.4byte \pointer2 @ text
		.endif
	.endm

	NO_MUSIC = FALSE

	@ Starts a single trainer battle, takes a trainer, intro text, loss text, and an optional event script
	@ when used with an event script, you can also pass in an optional flag to disable music
	.macro trainerbattle_single trainer:req, intro_text:req, lose_text:req, event_script=FALSE, music=TRUE
	.if \event_script == FALSE
	trainerbattle TRAINER_BATTLE_SINGLE, \trainer, 0, \intro_text, \lose_text
	.elseif \music == TRUE
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, \trainer, 0, \intro_text, \lose_text, \event_script
	.else
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC, \trainer, 0, \intro_text, \lose_text, \event_script
	.endif
	.endm

	@ Starts a double trainer battle, takes a trainer, intro text, loss text, text for when you have too few pokemon
	@ and an optional event script, when used with an event script you can pass in an optional flag to disable music
	.macro trainerbattle_double trainer:req, intro_text:req, lose_text:req, not_enough_pkmn_text:req, event_script=FALSE, music=TRUE
	.if \event_script == FALSE
	trainerbattle TRAINER_BATTLE_DOUBLE, \trainer, 0, \intro_text, \lose_text, \not_enough_pkmn_text
	.elseif \music == TRUE
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE, \trainer, 0, \intro_text, \lose_text, \not_enough_pkmn_text, \event_script
	.else
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC, \trainer, 0, \intro_text, \lose_text, \not_enough_pkmn_text, \event_script
	.endif
	.endm

	@ Starts a rematch battle, takes a trainer, intro text and loss text
	.macro trainerbattle_rematch trainer:req, intro_text:req, lose_text:req
	trainerbattle TRAINER_BATTLE_REMATCH, \trainer, 0, \intro_text, \lose_text
	.endm

	@ Starts a rematch double battle, takes a trainer, intro text, loss text, and text for when you have too few pokemon
	.macro trainerbattle_rematch_double trainer:req, intro_text:req, lose_text:req, not_enough_pkmn_text:req
	trainerbattle TRAINER_BATTLE_REMATCH_DOUBLE, \trainer, 0, \intro_text, \lose_text, \not_enough_pkmn_text
	.endm

	@ Starts a trainer battle, skipping intro text, takes a trainer and loss text
	.macro trainerbattle_no_intro trainer:req, lose_text:req
	trainerbattle TRAINER_BATTLE_SINGLE_NO_INTRO_TEXT, \trainer, 0, \lose_text
	.endm

	@ Starts a trainer battle with victory text if the player loses. If flags is nonzero, the player will be healed after battle (and its assumed to be the tutorial battle)
	.macro trainerbattle_earlyrival trainer:req, flags:req, defeat_text:req, victory_text:req
	trainerbattle TRAINER_BATTLE_EARLY_RIVAL, \trainer, \flags, \defeat_text, \victory_text
	.endm

	@ Starts a trainer battle using the battle information stored in RAM (usually by trainerbattle, which actually calls this command behind-the-scenes), and blocks script execution until the battle finishes.
	.macro battlebegin
	.byte 0x5d
	.endm

	.macro ontrainerbattleend
	.byte 0x5e
	.endm

	.macro ontrainerbattleendgoto
	.byte 0x5f
	.endm

	@ Compares Flag (trainer + 0x500) to 1. (If the flag is set, then the trainer has been defeated by the player.)
	.macro checktrainerflag trainer:req
	.byte 0x60
	.2byte \trainer
	.endm

	@ Sets Flag (trainer + 0x500). (I didn't make a mistake. The command names actually are backwards.)
	.macro settrainerflag trainer:req
	.byte 0x61
	.2byte \trainer
	.endm

	@ Clears Flag (trainer + 0x500). (I didn't make a mistake. The command names actually are backwards.)
	.macro cleartrainerflag trainer:req
	.byte 0x62
	.2byte \trainer
	.endm

	.macro setobjectxyperm index:req, x:req, y:req
	.byte 0x63
	.2byte \index
	.2byte \x
	.2byte \y
	.endm

	.macro moveobjectoffscreen index:req
	.byte 0x64
	.2byte \index
	.endm

	.macro setobjectmovementtype word:req, byte:req
	.byte 0x65
	.2byte \word
	.byte \byte
	.endm

	@ If a standard message box (or its text) is being drawn on-screen, this command blocks script execution until the box and its text have been fully drawn.
	.macro waitmessage
	.byte 0x66
	.endm

	@ Starts displaying a standard message box containing the specified text. If text is a pointer, then the string at that offset will be loaded and used. If text is script bank 0, then the value of script bank 0 will be treated as a pointer to the text. (You can use loadpointer to place a string pointer in a script bank.)
	.macro message text:req
	.byte 0x67
	.4byte \text
	.endm

	@ Holds the current message box open until the player presses a key. The message box is then closed.
	.macro closemessage
	.byte 0x68
	.endm

	@ Ceases movement for all Objects on-screen.
	.macro lockall
	.byte 0x69
	.endm

	@ If the script was called by an Object, then that Object's movement will cease.
	.macro lock
	.byte 0x6a
	.endm

	@ Resumes normal movement for all Objects on-screen, and closes any standard message boxes that are still open.
	.macro releaseall
	.byte 0x6b
	.endm

	@ If the script was called by an Object, then that Object's movement will resume. This command also closes any standard message boxes that are still open.
	.macro release
	.byte 0x6c
	.endm

	@ Blocks script execution until the player presses any key.
	.macro waitbuttonpress
	.byte 0x6d
	.endm

	@ Displays a YES/NO multichoice box at the specified coordinates, and blocks script execution until the user makes a selection. Their selection is stored in VAR_RESULT as NO (0) or YES (1). Pressing B is equivalent to answering NO
	.macro yesnobox x:req, y:req
	.byte 0x6e
	.byte \x
	.byte \y
	.endm

	@ Displays a multichoice box from which the user can choose a selection, and blocks script execution until a selection is made. Lists of options are predefined and the one to be used is specified with list. If b is set to a non-zero value, then the user will not be allowed to back out of the multichoice with the B button.
	.macro multichoice x:req, y:req, list:req, b:req
	.byte 0x6f
	.byte \x
	.byte \y
	.byte \list
	.byte \b
	.endm

	@ Displays a multichoice box from which the user can choose a selection, and blocks script execution until a selection is made. Lists of options are predefined and the one to be used is specified with list. The default argument determines the initial position of the cursor when the box is first opened; it is zero-indexed, and if it is too large, it is treated as 0x00. If b is set to a non-zero value, then the user will not be allowed to back out of the multichoice with the B button.
	.macro multichoicedefault x:req, y:req, list:req, default:req, b:req
	.byte 0x70
	.byte \x
	.byte \y
	.byte \list
	.byte \default
	.byte \b
	.endm

	@ Displays a multichoice box from which the user can choose a selection, and blocks script execution until a selection is made. Lists of options are predefined and the one to be used is specified with list. The per_row argument determines how many list items will be shown on a single row of the box.
	.macro multichoicegrid x:req, y:req, list:req, per_row:req, b:req
	.byte 0x71
	.byte \x
	.byte \y
	.byte \list
	.byte \per_row
	.byte \b
	.endm

	.macro drawbox
	.byte 0x72
	.endm

	.macro erasebox byte1:req, byte2:req, byte3:req, byte4:req
	.byte 0x73
	.byte \byte1
	.byte \byte2
	.byte \byte3
	.byte \byte4
	.endm

	.macro drawboxtext
	.byte 0x74
	.endm

	@ Displays a box containing the front sprite for the specified (species) Pokemon species.
	.macro drawmonpic species:req, x:req, y:req
	.byte 0x75
	.2byte \species
	.byte \x
	.byte \y
	.endm

	@ Hides all boxes displayed with drawmonpic.
	.macro erasemonpic
	.byte 0x76
	.endm

	@ Draws an image of the winner of the contest. In FireRed, this command is a nop. (The argument is discarded.)
	.macro drawcontestwinner a:req
	.byte 0x77
	.byte \a
	.endm

	@ Displays the string at pointer as braille text in a standard message box. The string must be formatted to use braille characters.
	.macro braillemessage text:req
	.byte 0x78
	.4byte \text
	.endm

	@ Gives the player one of the specified (species) Pokemon at level level holding item. The trailing 0s are unused parameters
	.macro givemon species:req, level:req, item:req
	.byte 0x79
	.2byte \species
	.byte \level
	.2byte \item
	.4byte 0x0
	.4byte 0x0
	.byte 0
	.endm

	.macro giveegg species:req
	.byte 0x7a
	.2byte \species
	.endm

	.macro setmonmove byte1:req, byte2:req, word:req
	.byte 0x7b
	.byte \byte1
	.byte \byte2
	.2byte \word
	.endm

	@ Checks if at least one Pokemon in the player's party knows the specified (index) attack. If so, VAR_RESULT is set to the (zero-indexed) slot number of the first Pokemon that knows the move. If not, VAR_RESULT is set to PARTY_SIZE. VAR_0x8004 is also set to this Pokemon's species.
	.macro checkpartymove index:req
	.byte 0x7c
	.2byte \index
	.endm

	@ Writes the name of the Pokemon at index species to the specified buffer.
	.macro getspeciesname out:req, species:req
	.byte 0x7d
	.byte \out
	.2byte \species
	.endm

	@ Writes the name of the species of the first Pokémon in the player's party to the specified buffer.
	.macro getfirstpartymonname out:req
	.byte 0x7e
	.byte \out
	.endm

	@ Writes the nickname of the Pokemon in slot slot (zero-indexed) of the player's party to the specified buffer. If an empty or invalid slot is specified, ten spaces ("") are written to the buffer.
	.macro getpartymonname out:req, slot:req
	.byte 0x7f
	.byte \out
	.2byte \slot
	.endm

	@ Writes the name of the item at index item to the specified buffer. If the specified index is larger than the number of items in the game (0x176), the name of item 0 ("????????") is buffered instead.
	.macro getitemname out:req, item:req
	.byte 0x80
	.byte \out
	.2byte \item
	.endm

	@ Writes the name of the decoration at index decoration to the specified buffer. In FireRed, this command is a nop.
	.macro getdecorname out:req, decoration:req
	.byte 0x81
	.byte \out
	.2byte \decoration
	.endm

	@ Writes the name of the move at index move to the specified buffer.
	.macro getmovename out:req, move:req
	.byte 0x82
	.byte \out
	.2byte \move
	.endm

	@ Converts the value of input to a decimal string, and writes that string to the specified buffer.
	.macro getnumberstring out:req, input:req
	.byte 0x83
	.byte \out
	.2byte \input
	.endm

	@ Writes the standard string identified by index to the specified buffer. This command has no protections in place at all, so specifying an invalid standard string (e.x. 0x2B) can and usually will cause data corruption.
	.macro getstdstring out:req, index:req
	.byte 0x84
	.byte \out
	.2byte \index
	.endm

	@ Copies the string at offset to the specified buffer.
	.macro getstring out:req, offset:req
	.byte 0x85
	.byte \out
	.4byte \offset
	.endm

	@ Opens the Pokemart system, offering the specified products for sale.
	.macro pokemart products:req
	.byte 0x86
	.4byte \products
	.endm

	@ Opens the Pokemart system and treats the list of items as decorations.
	.macro pokemartdecor products:req
	.byte 0x87
	.4byte \products
	.endm

	@ Apparent clone of pokemart.
	.macro pokemartbp products:req
	.byte 0x88
	.4byte \products
	.endm

	@ Starts up the slot machine minigame.
	.macro playslotmachine word:req
	.byte 0x89
	.2byte \word
	.endm

	@ In FireRed, this command is a nop.
	.macro plantberrytree
	.byte 0x8a
	.endm

	@ In FireRed, this command sets the byte at 0x03000EA8 to 0x01. I do not know what that means.
	.macro choosecontestpkmn
	.byte 0x8b
	.endm

	@ In FireRed, this command is a nop.
	.macro startcontest
	.byte 0x8c
	.endm

	@ In FireRed, this command is a nop.
	.macro showcontestresults
	.byte 0x8d
	.endm

	@ In FireRed, this command is a nop.
	.macro contestlinktransfer
	.byte 0x8e
	.endm

	@ Stores a random integer between 0 and limit in VAR_RESULT.
	.macro random limit:req
	.byte 0x8f
	.2byte \limit
	.endm

	@ If check is 0x00, this command adds value to the player's money.
	.macro addmoney value:req, check:req
	.byte 0x90
	.4byte \value
	.byte \check
	.endm

	@ If check is 0x00, this command subtracts value from the player's money.
	.macro removemoney value:req, check:req
	.byte 0x91
	.4byte \value
	.byte \check
	.endm

	@ If check is 0x00, this command will check if the player has money >= value; VAR_RESULT is set to TRUE if the player has enough money, or FALSE if they do not.
	.macro checkmoney value:req, check:req
	.byte 0x92
	.4byte \value
	.byte \check
	.endm

	@ Spawns a secondary box showing how much money the player has.
	.macro showmoneybox x:req, y:req, check:req
	.byte 0x93
	.byte \x
	.byte \y
	.byte \check
	.endm

	@ Hides the secondary box spawned by showmoney.
	@ The two arguments are unused.
	@ They are retained here for backwards compatibility with Ruby/Sapphire.
	.macro hidemoneybox x:req, y:req
	.byte 0x94
	.byte \x
	.byte \y
	.endm

	@ Updates the secondary box spawned by showmoney. Consumes but does not use arguments.
	.macro updatemoneybox x:req, y:req, check:req
	.byte 0x95
	.byte \x
	.byte \y
	.byte \check
	.endm

	@ In FireRed, this command is a nop.
	.macro getpricereduction
	.byte 0x96
	.endm

	@ Fades the screen to black or back, using the specified effect. Effect 0x00 fades in, and effect 0x01 fades out. I don't know if other effects exist.
	.macro fadescreen effect:req
	.byte 0x97
	.byte \effect
	.endm

	@ Fades the screen to and from black and white. Mode 0x00 fades from black, mode 0x01 fades out to black, mode 0x2 fades in from white, and mode 0x3 fades out to white. Other modes may exist.
	.macro fadescreenspeed effect:req, speed:req
	.byte 0x98
	.byte \effect
	.byte \speed
	.endm

	.macro setflashradius word:req
	.byte 0x99
	.2byte \word
	.endm

	.macro animateflash byte:req
	.byte 0x9a
	.byte \byte
	.endm

	.macro messageautoscroll pointer:req
	.byte 0x9b
	.4byte \pointer
	.endm

	@ Executes the specified field move animation.
	.macro dofieldeffect animation:req
	.byte 0x9c
	.2byte \animation
	.endm

	@ Sets up the field effect argument argument with the value value.
	.macro setfieldeffectarg argument:req, param:req
	.byte 0x9d
	.byte \argument
	.2byte \param
	.endm

	@ Blocks script execution until all playing field move animations complete.
	.macro waitfieldeffect animation:req
	.byte 0x9e
	.2byte \animation
	.endm

	@ Sets which healing place the player will return to if all of the Pokemon in their party faint.
	.macro setrespawn heallocation:req
	.byte 0x9f
	.2byte \heallocation
	.endm

	@ Checks the player's gender. If male, then MALE (0) is stored in VAR_RESULT. If female, then FEMALE (1) is stored in VAR_RESULT.
	.macro checkplayergender
	.byte 0xa0
	.endm

	@ Plays the specified (species) Pokemon's cry. You can use waitcry to block script execution until the sound finishes.
	.macro playmoncry species:req, effect:req
	.byte 0xa1
	.2byte \species
	.2byte \effect
	.endm

	@ Changes the metatile at (x, y) on the current map.
	.macro setmetatile x:req, y:req, metatile_number:req, tile_attrib:req
	.byte 0xa2
	.2byte \x
	.2byte \y
	.2byte \metatile_number
	.2byte \tile_attrib
	.endm

	@ Queues a weather change to the default weather for the map.
	.macro resetweather
	.byte 0xa3
	.endm

	@ Queues a weather change to type weather.
	.macro setweather type:req
	.byte 0xa4
	.2byte \type
	.endm

	@ Executes the weather change queued with resetweather or setweather. The current weather will smoothly fade into the queued weather.
	.macro doweather
	.byte 0xa5
	.endm

	@ This command manages cases in which maps have tiles that change state when stepped on (specifically, cracked/breakable floors).
	.macro setstepcallback subroutine:req
	.byte 0xa6
	.byte \subroutine
	.endm

	.macro setmaplayoutindex index:req
	.byte 0xa7
	.2byte \index
	.endm

	.macro setobjectpriority index:req, map:req, priority:req
	.byte 0xa8
	.2byte \index
	map \map
	.byte \priority
	.endm

	.macro resetobjectpriority index:req, map:req
	.byte 0xa9
	.2byte \index
	map \map
	.endm

	.macro createvobject sprite:req, byte2:req, x:req, y:req, elevation:req, direction:req
	.byte 0xaa
	.byte \sprite
	.byte \byte2
	.2byte \x
	.2byte \y
	.byte \elevation
	.byte \direction
	.endm

	.macro turnvobject index:req, direction:req
	.byte 0xab
	.byte \index
	.byte \direction
	.endm

	@ Opens the door metatile at (X, Y) with an animation.
	.macro opendoor x:req, y:req
	.byte 0xac
	.2byte \x
	.2byte \y
	.endm

	@ Closes the door metatile at (X, Y) with an animation.
	.macro closedoor x:req, y:req
	.byte 0xad
	.2byte \x
	.2byte \y
	.endm

	@ Waits for the door animation started with opendoor or closedoor to finish.
	.macro waitdooranim
	.byte 0xae
	.endm

	@ Sets the door tile at (x, y) to be open without an animation.
	.macro setdooropen x:req, y:req
	.byte 0xaf
	.2byte \x
	.2byte \y
	.endm

	@ Sets the door tile at (x, y) to be closed without an animation.
	.macro setdoorclosed2 x:req, y:req
	.byte 0xb0
	.2byte \x
	.2byte \y
	.endm

	@ In Emerald, this command consumes its parameters and does nothing. In FireRed, this command is a nop.
	.macro addelevmenuitem
	.byte 0xb1
	.endm

	@ In FireRed and Emerald, this command is a nop.
	.macro showelevmenu
	.byte 0xb2
	.endm

	.macro checkcoins out:req
	.byte 0xb3
	.2byte \out
	.endm

	.macro addcoins count:req
	.byte 0xb4
	.2byte \count
	.endm

	.macro removecoins word:req
	.byte 0xb5
	.2byte \word
	.endm

	@ Prepares to start a wild battle against a species at Level level holding item. Running this command will not affect normal wild battles. You start the prepared battle with dowildbattle.
	.macro setwildbattle species:req, level:req, item:req
	.byte 0xb6
	.2byte \species
	.byte \level
	.2byte \item
	.endm

	@ Starts a wild battle against the Pokemon generated by setwildbattle. Blocks script execution until the battle finishes.
	.macro dowildbattle
	.byte 0xb7
	.endm

	.macro setvaddress long:req
	.byte 0xb8
	.4byte \long
	.endm

	.macro vgoto pointer:req
	.byte 0xb9
	.4byte \pointer
	.endm

	.macro vcall pointer:req
	.byte 0xba
	.4byte \pointer
	.endm

	.macro vgoto_if byte:req, pointer:req
	.byte 0xbb
	.byte \byte
	.4byte \pointer
	.endm

	.macro vcall_if byte:req, pointer:req
	.byte 0xbc
	.byte \byte
	.4byte \pointer
	.endm

	.macro vmessage pointer:req
	.byte 0xbd
	.4byte \pointer
	.endm

	.macro vloadptr pointer:req
	.byte 0xbe
	.4byte \pointer
	.endm

	.macro vbufferstring byte:req, pointer:req
	.byte 0xbf
	.byte \byte
	.4byte \pointer
	.endm

	@ Spawns a secondary box showing how many Coins the player has.
	.macro showcoinsbox x:req, y:req
	.byte 0xc0
	.byte \x
	.byte \y
	.endm

	@ Hides the secondary box spawned by showcoins. It consumes its arguments but doesn't use them.
	.macro hidecoinsbox x:req, y:req
	.byte 0xc1
	.byte \x
	.byte \y
	.endm

	@ Updates the secondary box spawned by showcoins. It consumes its arguments but doesn't use them.
	.macro updatecoinsbox x:req, y:req
	.byte 0xc2
	.byte \x
	.byte \y
	.endm

	@ Increases the value of the specified game stat by 1. The stat's value will not be allowed to exceed 0x00FFFFFF.
	.macro incrementgamestat stat:req
	.byte 0xc3
	.byte \stat
	.endm

	@ Sets the destination that using an Escape Rope or Dig will take the player to.
	.macro setescapewarp map:req, warp:req, x:req, y:req
	.byte 0xc4
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Blocks script execution until cry finishes.
	.macro waitmoncry
	.byte 0xc5
	.endm

	@ Writes the name of the specified (box) PC box to the specified buffer.
	.macro bufferboxname out:req, box:req
	.byte 0xc6
	.byte \out
	.2byte \box
	.endm

	@ Sets the color of the text in standard message boxes. 0x00 produces blue (male) text, 0x01 produces red (female) text, 0xFF resets the color to the default for the current OW's gender, and all other values produce black text.
	.macro textcolor color:req
	.byte 0xc7
	.byte \color
	.endm

	@ The exact purpose of this command is unknown, but it is related to the blue help-text box that appears on the bottom of the screen when the Main Menu is opened.
	.macro loadhelp pointer:req
	.byte 0xc8
	.4byte \pointer
	.endm

	@ The exact purpose of this command is unknown, but it is related to the blue help-text box that appears on the bottom of the screen when the Main Menu is opened.
	.macro unloadhelp
	.byte 0xc9
	.endm

	@ After using this command, all standard message boxes will use the signpost frame.
	.macro signmsg
	.byte 0xca
	.endm

	@ Ends the effects of signmsg, returning message box frames to normal.
	.macro normalmsg
	.byte 0xcb
	.endm

	@ Compares the value of a hidden variable to a dword.
	.macro comparehiddenvar a:req, value:req
	.byte 0xcc
	.byte \a
	.4byte \value
	.endm

	@ Sets the Pokemon in the specified slot of the player party's eventLegal bit.
	.macro setmoneventlegal slot:req
	.byte 0xcd
	.2byte \slot
	.endm

	@ Checks if the Pokemon in the specified slot of the player's party has its eventLegal bit set. If it isn't set,
	@ VAR_RESULT is TRUE. If the bit is set (or if the specified slot is empty or invalid), VAR_RESULT is FALSE.
	.macro checkmoneventlegal slot:req
	.byte 0xce
	.2byte \slot
	.endm

	@ Depending on factors I haven't managed to understand yet, this command may cause script execution to jump to the offset specified by the pointer at 0x020375C0.
	.macro execram
	.byte 0xcf
	.endm

	@ Sets worldmapflag to 1. This allows the player to Fly to the corresponding map, if that map has a flightspot.
	.macro setworldmapflag worldmapflag:req
	.byte 0xd0
	.2byte \worldmapflag
	.endm

	@ Clone of warpteleport? It is apparently only used in FR/LG, and only with specials.[source]
	.macro warpteleport2 map:req, warp:req, x:req, y:req
	.byte 0xd1
	map \map
	.byte \warp
	.2byte \x
	.2byte \y
	.endm

	@ Changes the location where the player caught the Pokemon in the specified slot of their party.
	.macro setmonmetlocation slot:req, location:req
	.byte 0xd2
	.2byte \slot
	.byte \location
	.endm

	.macro getbraillestringwidth pointer:req
	.byte 0xd3
	.4byte \pointer
	.endm

	.macro bufferitemnameplural out:req, item:req, quantity:req
	.byte 0xd4
	.byte \out
	.2byte \item
	.2byte \quantity
	.endm


@ Supplementary

	.macro goto_if_unset flag:req, dest:req
	checkflag \flag
	goto_if FALSE, \dest
	.endm

	.macro goto_if_set flag:req, dest:req
	checkflag \flag
	goto_if TRUE, \dest
	.endm

	.macro goto_if_lt dest:req @ LESS THAN
	goto_if 0, \dest
	.endm	

	.macro goto_if_eq dest:req @ EQUAL
	goto_if 1, \dest
	.endm

	.macro goto_if_gt dest:req @ GREATER THAN
	goto_if 2, \dest
	.endm

	.macro goto_if_le dest:req @ LESS THAN OR EQUAL
	goto_if 3, \dest
	.endm

	.macro goto_if_ge dest:req @ GREATER THAN OR EQUAL
	goto_if 4, \dest
	.endm

	.macro goto_if_ne dest:req @ NOT EQUAL
	goto_if 5, \dest
	.endm

	.macro call_if_unset flag:req, dest:req
	checkflag \flag
	call_if FALSE, \dest
	.endm

	.macro call_if_set flag:req, dest:req
	checkflag \flag
	call_if TRUE, \dest
	.endm

	.macro call_if_lt dest:req @ LESS THAN
	call_if 0, \dest
	.endm	

	.macro call_if_eq dest:req @ EQUAL
	call_if 1, \dest
	.endm

	.macro call_if_gt dest:req @ GREATER THAN
	call_if 2, \dest
	.endm

	.macro call_if_le dest:req @ LESS THAN OR EQUAL
	call_if 3, \dest
	.endm

	.macro call_if_ge dest:req @ GREATER THAN OR EQUAL
	call_if 4, \dest
	.endm

	.macro call_if_ne dest:req @ NOT EQUAL
	call_if 5, \dest
	.endm

	.macro vgoto_if_eq dest:req
	vgoto_if TRUE, \dest
	.endm

	.macro vgoto_if_ne dest:req
	vgoto_if FALSE, \dest
	.endm

	.macro vgoto_if_set flag:req, dest:req
	checkflag \flag
	vgoto_if TRUE, \dest
	.endm

	.macro vgoto_if_unset flag:req, dest:req
	checkflag \flag
	vgoto_if FALSE, \dest
	.endm

	.macro goto_if_defeated trainer:req, dest:req
	checktrainerflag \trainer
	goto_if TRUE, \dest
	.endm

	.macro goto_if_not_defeated trainer:req, dest:req
	checktrainerflag \trainer
	goto_if FALSE, \dest
	.endm

	.macro call_if_defeated trainer:req, dest:req
	checktrainerflag \trainer
	call_if TRUE, \dest
	.endm

	.macro call_if_not_defeated trainer:req, dest:req
	checktrainerflag \trainer
	call_if FALSE, \dest
	.endm

	.macro switch var:req
	copyvar VAR_0x8000, \var
	.endm

	.macro case condition:req, dest:req
	compare VAR_0x8000, \condition
	goto_if_eq \dest
	.endm

	.macro msgbox text:req, type=MSGBOX_DEFAULT
	loadword 0, \text
	callstd \type
	.endm

	@ Callstd ids
	STD_OBTAIN_ITEM = 0
	STD_FIND_ITEM = 1

	MSGBOX_NPC = 2
	MSGBOX_SIGN = 3
	MSGBOX_DEFAULT = 4
	MSGBOX_YESNO = 5
	MSGBOX_AUTOCLOSE = 6

	STD_OBTAIN_DECOR = 7
	STD_PUT_ITEM_AWAY = 8
	STD_RECEIVED_ITEM = 9

	YES = 1
	NO  = 0

	.macro giveitem item:req, amount=1
	setorcopyvar VAR_0x8000, \item
	setorcopyvar VAR_0x8001, \amount
	callstd STD_OBTAIN_ITEM
	.endm

	.macro finditem item:req, amount=1
	setorcopyvar VAR_0x8000, \item
	setorcopyvar VAR_0x8001, \amount
	callstd STD_FIND_ITEM
	.endm

	.macro putitemaway item:req, amount=1
	setorcopyvar VAR_0x8000, \item
	setorcopyvar VAR_0x8001, \amount
	callstd STD_PUT_ITEM_AWAY
	.endm

	.macro giveitem_msg msg:req, item:req, amount=1, fanfare=MUS_LEVEL_UP
	additem \item, \amount
	msgreceiveditem \msg, \item, \amount, \fanfare
	.endm

	.macro msgreceiveditem msg:req, item:req, amount=1, fanfare=MUS_LEVEL_UP
	loadword 0, \msg
	setorcopyvar VAR_0x8000, \item
	setorcopyvar VAR_0x8001, \amount
	setorcopyvar VAR_0x8002, \fanfare
	callstd STD_RECEIVED_ITEM
	.endm

	.macro famechecker person:req, index:req, function=SetFlavorTextFlagFromSpecialVars
	setvar VAR_0x8004, \person
	setvar VAR_0x8005, \index
	special \function
	.endm

	.macro set_gym_trainers gym:req
	setvar VAR_0x8008, \gym
	call EventScript_SetGymTrainers
	.endm

	@ Jumps to dest if the Quest Log is currently showing playback scenes (dest is usually a release/end)
	.macro goto_if_questlog dest:req
	special GetQuestLogState
	compare VAR_RESULT, 2
	goto_if_eq \dest
	.endm

	.macro braillemessage_wait text:req
	setvar VAR_0x8006, 0
	braillemessage \text
	getbraillestringwidth \text
	call EventScript_BrailleCursorWaitButton
	.endm
