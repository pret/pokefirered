@ status 1
.equiv SLP, 0x07
.equiv PSN, 0x08
.equiv BRN, 0x10
.equiv FRZ, 0x20
.equiv PAR, 0x40
.equiv TOX, 0x80

@ status 2
.equiv S_CONFUSED,     0x00000007
.equiv S_CONTINUE,     0x00001000
.equiv S_TEMP_TRAP,    0x0000E000 @ Wrap, Bind, etc.
.equiv S_INFATUATED,   0x000F0000
.equiv S_FOCUS_ENERGY, 0x00100000
.equiv S_SUBSTITUTE,   0x01000000
.equiv S_MEAN_LOOK,    0x04000000
.equiv S_NIGHTMARE,    0x08000000
.equiv S_CURSED,       0x10000000
.equiv S_FORESIGHT,    0x20000000
.equiv S_TORMENT,      0x80000000

@ status 3
.equiv S_LEECH_SEED,  0x00000004
.equiv S_ALWAYS_HIT,  0x00000010
.equiv S_PERISH_SONG, 0x00000020
.equiv S_ROOTED,      0x00000400
.equiv S_YAWN,        0x00001800
.equiv S_IMPRISONED,  0x00002000
.equiv S_MUD_SPORT,   0x00010000
.equiv S_WATER_SPORT, 0x00020000

@ status 4
.equiv S_REFLECT,      0x0001
.equiv S_LIGHT_SCREEN, 0x0002
.equiv S_SPIKES,       0x0010
.equiv S_SAFEGUARD,    0x0020
.equiv S_FUTURE_SIGHT, 0x0040
.equiv S_MIST,         0x0100

.equiv TARGET, 0
.equiv USER, 1

.equiv WEATHER_SUN, 0
.equiv WEATHER_RAIN, 1
.equiv WEATHER_SANDSTORM, 2
.equiv WEATHER_HAIL, 3

	enum_start 1
	enum ATTACK
	enum DEFENSE
	enum SPEED
	enum SP_ATTACK
	enum SP_DEFENSE
	enum ACCURACY
	enum EVASION

@ status animation table
.equiv B_ANIM_STATUS_PSN,              0x0
.equiv B_ANIM_STATUS_CONFUSION,        0x1
.equiv B_ANIM_STATUS_BRN,              0x2
.equiv B_ANIM_STATUS_INFATUATION,      0x3
.equiv B_ANIM_STATUS_SLP,              0x4
.equiv B_ANIM_STATUS_PRZ,              0x5
.equiv B_ANIM_STATUS_FRZ,              0x6
.equiv B_ANIM_STATUS_CURSED,           0x7
.equiv B_ANIM_STATUS_NIGHTMARE,        0x8
.equiv B_ANIM_STATUS_WRAPPED,          0x9

@ general animation table
.equiv B_ANIM_CASTFORM_CHANGE,         0x0
.equiv B_ANIM_STATS_CHANGE,            0x1
.equiv B_ANIM_SUBSTITUTE_FADE,         0x2
.equiv B_ANIM_SUBSTITUTE_APPEAR,       0x3
.equiv B_ANIM_POKEBLOCK_THROW,         0x4
.equiv B_ANIM_ITEM_KNOCKOFF,           0x5
.equiv B_ANIM_TURN_TRAP,               0x6
.equiv B_ANIM_ITEM_EFFECT,             0x7
.equiv B_ANIM_SMOKEBALL_ESCAPE,        0x8
.equiv B_ANIM_HANGED_ON,               0x9
.equiv B_ANIM_RAIN_CONTINUES,          0xA
.equiv B_ANIM_SUN_CONTINUES,           0xB
.equiv B_ANIM_SANDSTORM_CONTINUES,     0xC
.equiv B_ANIM_HAIL_CONTINUES,          0xD
.equiv B_ANIM_LEECH_SEED_DRAIN,        0xE
.equiv B_ANIM_MON_HIT,                 0xF
.equiv B_ANIM_ITEM_STEAL,              0x10
.equiv B_ANIM_SNATCH_MOVE,             0x11
.equiv B_ANIM_FUTURE_SIGHT_HIT,        0x12
.equiv B_ANIM_DOOM_DESIRE_HIT,         0x13
.equiv B_ANIM_FOCUS_PUNCH_SET_UP,      0x14
.equiv B_ANIM_INGRAIN_HEAL,            0x15
.equiv B_ANIM_WISH_HEAL,               0x16

@ special animation table
.equiv B_ANIM_LVL_UP,                  0x0
.equiv B_ANIM_SWITCH_OUT_PLAYER_MON,   0x1
.equiv B_ANIM_SWITCH_OUT_OPPONENT_MON, 0x2
.equiv B_ANIM_BALL_THROW,              0x3
.equiv B_ANIM_SAFARI_BALL_THROW,       0x4
.equiv B_ANIM_SUBSTITUTE_TO_MON,       0x5
.equiv B_ANIM_MON_TO_SUBSTITUTE,       0x6
