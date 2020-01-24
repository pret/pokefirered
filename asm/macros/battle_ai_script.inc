	.macro if_random_less_than percent:req, ptr:req
	.byte 0x00
	.byte \percent
	.4byte \ptr
	.endm

	@ unused
	.macro if_random_greater_than percent:req, ptr:req
	.byte 0x01
	.byte \percent
	.4byte \ptr
	.endm

	@ unused
	.macro if_random_equal ptr:req
	.byte 0x02
	.4byte \ptr
	.endm

	@ unused
	.macro if_random_not_equal ptr:req
	.byte 0x03
	.4byte \ptr
	.endm

	.macro score score:req
	.byte 0x04
	.byte \score
	.endm

	.macro if_hp_less_than battler:req, percent:req, ptr:req
	.byte 0x05
	.byte \battler
	.byte \percent
	.4byte \ptr
	.endm

	.macro if_hp_more_than battler:req, percent:req, ptr:req
	.byte 0x06
	.byte \battler
	.byte \percent
	.4byte \ptr
	.endm

	.macro if_hp_equal battler:req, percent:req, ptr:req
	.byte 0x07
	.byte \battler
	.byte \percent
	.4byte \ptr
	.endm

	.macro if_hp_not_equal battler:req, percent:req, ptr:req
	.byte 0x08
	.byte \battler
	.byte \percent
	.4byte \ptr
	.endm

	.macro if_status battler:req, status:req, ptr:req
	.byte 0x09
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_not_status battler:req, status:req, ptr:req
	.byte 0x0a
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_status2 battler:req, status:req, ptr:req
	.byte 0x0b
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_not_status2 battler:req, status:req, ptr:req
	.byte 0x0c
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_status3 battler:req, status:req, ptr:req
	.byte 0x0d
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_not_status3 battler:req, status:req, ptr:req
	.byte 0x0e
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_side_affecting battler:req, status:req, ptr:req
	.byte 0x0f
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_not_side_affecting battler:req, status:req, ptr:req
	.byte 0x10
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro if_less_than value:req, ptr:req
	.byte 0x11
	.byte \value
	.4byte \ptr
	.endm

	.macro if_more_than value:req, ptr:req
	.byte 0x12
	.byte \value
	.4byte \ptr
	.endm

	.macro if_equal value:req, ptr:req
	.byte 0x13
	.byte \value
	.4byte \ptr
	.endm

	.macro if_not_equal value:req, ptr:req
	.byte 0x14
	.byte \value
	.4byte \ptr
	.endm

	.macro if_less_than_ptr value:req, ptr:req
	.byte 0x15
	.4byte \value
	.4byte \ptr
	.endm

	.macro if_more_than_ptr value:req, ptr:req
	.byte 0x16
	.4byte \value
	.4byte \ptr
	.endm

	.macro if_equal_ptr value:req, ptr:req
	.byte 0x17
	.4byte \value
	.4byte \ptr
	.endm

	.macro if_not_equal_ptr value:req, ptr:req
	.byte 0x18
	.4byte \value
	.4byte \ptr
	.endm

	.macro if_move move:req, ptr:req
	.byte 0x19
	.2byte \move
	.4byte \ptr
	.endm

	.macro if_not_move move:req, ptr:req
	.byte 0x1a
	.2byte \move
	.4byte \ptr
	.endm

	.macro if_in_bytes list:req, ptr:req
	.byte 0x1b
	.4byte \list
	.4byte \ptr
	.endm

	.macro if_not_in_bytes list:req, ptr:req
	.byte 0x1c
	.4byte \list
	.4byte \ptr
	.endm

	.macro if_in_hwords list:req, ptr:req
	.byte 0x1d
	.4byte \list
	.4byte \ptr
	.endm

	.macro if_not_in_hwords list:req, ptr:req
	.byte 0x1e
	.4byte \list
	.4byte \ptr
	.endm

	.macro if_user_has_attacking_move ptr:req
	.byte 0x1f
	.4byte \ptr
	.endm

	.macro if_user_has_no_attacking_moves ptr:req
	.byte 0x20
	.4byte \ptr
	.endm

	.macro get_turn_count
	.byte 0x21
	.endm

	.macro get_type byte:req
	.byte 0x22
	.byte \byte
	.endm

	@ unused
	.macro get_considered_move_power
	.byte 0x23
	.endm

	.macro get_how_powerful_move_is
	.byte 0x24
	.endm

	.macro get_last_used_move battler:req
	.byte 0x25
	.byte \battler
	.endm

	.macro if_equal_ type:req, ptr:req
	.byte 0x26
	.byte \type
	.4byte \ptr
	.endm

	@ unused
	.macro if_not_equal_ type:req, ptr:req
	.byte 0x27
	.byte \type
	.4byte \ptr
	.endm

	.macro if_would_go_first battler:req, ptr:req
	.byte 0x28
	.byte \battler
	.4byte \ptr
	.endm

	.macro if_would_not_go_first battler:req, ptr:req
	.byte 0x29
	.byte \battler
	.4byte \ptr
	.endm

	@ nullsub
	.macro ai_2a
	.byte 0x2a
	.endm

	@ nullsub
	.macro ai_2b
	.byte 0x2b
	.endm

	.macro count_alive_pokemon battler:req
	.byte 0x2c
	.byte \battler
	.endm

	@ unused
	.macro get_considered_move
	.byte 0x2d
	.endm

	.macro get_considered_move_effect
	.byte 0x2e
	.endm

	.macro get_ability battler:req
	.byte 0x2f
	.byte \battler
	.endm

	@ unused
	.macro get_highest_type_effectiveness
	.byte 0x30
	.endm

	.macro if_type_effectiveness effectiveness:req, ptr:req
	.byte 0x31
	.byte \effectiveness
	.4byte \ptr
	.endm

	@ nullsub
	.macro ai_32
	.byte 0x32
	.endm

	@ nullsub
	.macro ai_33
	.byte 0x33
	.endm

	.macro if_status_in_party battler:req, status:req, ptr:req
	.byte 0x34
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	@ bugged
	.macro if_status_not_in_party battler:req, status:req, ptr:req
	.byte 0x35
	.byte \battler
	.4byte \status
	.4byte \ptr
	.endm

	.macro get_weather
	.byte 0x36
	.endm

	.macro if_effect byte:req, ptr:req
	.byte 0x37
	.byte \byte
	.4byte \ptr
	.endm

	.macro if_not_effect byte:req, ptr:req
	.byte 0x38
	.byte \byte
	.4byte \ptr
	.endm

	.macro if_stat_level_less_than battler:req, stat:req, level:req, ptr:req
	.byte 0x39
	.byte \battler
	.byte \stat
	.byte \level
	.4byte \ptr
	.endm

	.macro if_stat_level_more_than battler:req, stat:req, level:req, ptr:req
	.byte 0x3a
	.byte \battler
	.byte \stat
	.byte \level
	.4byte \ptr
	.endm

	.macro if_stat_level_equal battler:req, stat:req, level:req, ptr:req
	.byte 0x3b
	.byte \battler
	.byte \stat
	.byte \level
	.4byte \ptr
	.endm

	.macro if_stat_level_not_equal battler:req, stat:req, level:req, ptr:req
	.byte 0x3c
	.byte \battler
	.byte \stat
	.byte \level
	.4byte \ptr
	.endm

	.macro if_can_faint ptr:req
	.byte 0x3d
	.4byte \ptr
	.endm

	.macro if_cant_faint ptr:req
	.byte 0x3e
	.4byte \ptr
	.endm

	@ unused
	.macro if_has_move battler:req, move:req, ptr:req
	.byte 0x3f
	.byte \battler
	.2byte \move
	.4byte \ptr
	.endm

	@ unused
	.macro if_doesnt_have_move battler:req, move:req, ptr:req
	.byte 0x40
	.byte \battler
	.2byte \move
	.4byte \ptr
	.endm

	.macro if_has_move_with_effect battler:req, effect:req, ptr:req
	.byte 0x41
	.byte \battler
	.byte \effect
	.4byte \ptr
	.endm

	.macro if_doesnt_have_move_with_effect battler:req, effect:req, ptr:req
	.byte 0x42
	.byte \battler
	.byte \effect
	.4byte \ptr
	.endm

	.macro if_any_move_disabled_or_encored battler:req, byte:req, ptr:req
	.byte 0x43
	.byte \battler
	.byte \byte
	.4byte \ptr
	.endm

	.macro if_curr_move_disabled_or_encored battler:req, ptr:req
	.byte 0x44
	.byte \battler
	.4byte \ptr
	.endm

	.macro flee
	.byte 0x45
	.endm

	.macro if_random_safari_flee ptr:req
	.byte 0x46
	.4byte \ptr
	.endm

	.macro watch
	.byte 0x47
	.endm

	.macro get_hold_effect battler:req
	.byte 0x48
	.byte \battler
	.endm

	.macro get_gender battler:req
	.byte 0x49
	.byte \battler
	.endm

	.macro is_first_turn_for battler:req
	.byte 0x4a
	.byte \battler
	.endm

	.macro get_stockpile_count battler:req
	.byte 0x4b
	.byte \battler
	.endm

	.macro is_double_battle
	.byte 0x4c
	.endm

	.macro get_used_held_item battler:req
	.byte 0x4d
	.byte \battler
	.endm

	.macro get_move_type_from_result
	.byte 0x4e
	.endm

	.macro get_move_power_from_result
	.byte 0x4f
	.endm

	.macro get_move_effect_from_result
	.byte 0x50
	.endm

	.macro get_protect_count battler:req
	.byte 0x51
	.byte \battler
	.endm

	@ nullsub
	.macro ai_52
	.byte 0x52
	.endm

	@ nullsub
	.macro ai_53
	.byte 0x53
	.endm

	@ nullsub
	.macro ai_54
	.byte 0x54
	.endm

	@ nullsub
	.macro ai_55
	.byte 0x55
	.endm

	@ nullsub
	.macro ai_56
	.byte 0x56
	.endm

	@ nullsub
	.macro ai_57
	.byte 0x57
	.endm

	@ unused
	.macro call ptr:req
	.byte 0x58
	.4byte \ptr
	.endm

	.macro goto ptr:req
	.byte 0x59
	.4byte \ptr
	.endm

	.macro end
	.byte 0x5a
	.endm

	.macro if_level_cond cond:req, ptr:req
	.byte 0x5b
	.byte \cond
	.4byte \ptr
	.endm

	.macro if_user_higher_level ptr:req
	if_level_cond 0, \ptr
	.endm

	.macro if_target_higher_level ptr:req
	if_level_cond 1, \ptr
	.endm

	.macro if_equal_levels ptr:req
	if_level_cond 2, \ptr
	.endm

	@ unused
	.macro if_target_taunted ptr:req
	.byte 0x5c
	.4byte \ptr
	.endm

	.macro if_target_not_taunted ptr:req
	.byte 0x5d
	.4byte \ptr
	.endm

@ useful script macros
	.macro get_curr_move_type
	get_type AI_TYPE_MOVE
	.endm
	
	.macro get_user_type1
	get_type AI_TYPE1_USER
	.endm
	
	.macro get_user_type2
	get_type AI_TYPE2_USER
	.endm
	
	.macro get_target_type1
	get_type AI_TYPE1_TARGET
	.endm
	
	.macro get_target_type2
	get_type AI_TYPE2_TARGET
	.endm

	.macro if_target_faster ptr:req
	if_would_go_first 1, \ptr
	.endm
	
	.macro if_user_faster ptr:req
	if_would_go_first 0, \ptr
	.endm

	.macro if_double_battle ptr:req
	is_double_battle
	if_equal 1, \ptr
	.endm
	
	.macro if_not_double_battle ptr:req
	is_double_battle
	if_equal 0, \ptr
	.endm

	.macro if_any_move_disabled battler:req, ptr:req
	if_any_move_disabled_or_encored \battler, 0, \ptr
	.endm
	
	.macro if_any_move_encored battler:req, ptr:req
	if_any_move_disabled_or_encored \battler, 1, \ptr
	.endm
