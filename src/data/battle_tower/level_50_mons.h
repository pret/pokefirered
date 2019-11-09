const struct BattleTowerPokemonTemplate gBattleTowerLevel50Mons[] =
{
	{
		.species = SPECIES_PIKACHU,
		.heldItem = BATTLE_TOWER_ITEM_ORAN_BERRY,
		.teamFlags = 0x42,
		.moves = {
			MOVE_QUICK_ATTACK,
			MOVE_THUNDER_WAVE,
			MOVE_THUNDER_SHOCK,
			MOVE_GROWL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_BEAUTIFLY,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x41,
		.moves = {
			MOVE_ABSORB,
			MOVE_STUN_SPORE,
			MOVE_GUST,
			MOVE_SAFEGUARD
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_SWELLOW,
		.heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
		.teamFlags = 0x07,
		.moves = {
			MOVE_PECK,
			MOVE_WING_ATTACK,
			MOVE_AERIAL_ACE,
			MOVE_AGILITY
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_HAIL,
			MOVE_ENCORE,
			MOVE_ICE_BALL,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_SEAKING,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x07,
		.moves = {
			MOVE_PECK,
			MOVE_FLAIL,
			MOVE_FURY_ATTACK,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_TORCHIC,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x42,
		.moves = {
			MOVE_FIRE_SPIN,
			MOVE_PROTECT,
			MOVE_SAND_ATTACK,
			MOVE_SLASH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_MASQUERAIN,
		.heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
		.teamFlags = 0x41,
		.moves = {
			MOVE_STUN_SPORE,
			MOVE_WATER_SPORT,
			MOVE_QUICK_ATTACK,
			MOVE_GUST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_ILLUMISE,
		.heldItem = BATTLE_TOWER_ITEM_NONE,
		.teamFlags = 0x41,
		.moves = {
			MOVE_FLATTER,
			MOVE_COVET,
			MOVE_WISH,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_DELCATTY,
		.heldItem = BATTLE_TOWER_ITEM_SILK_SCARF,
		.teamFlags = 0x42,
		.moves = {
			MOVE_ATTRACT,
			MOVE_TAIL_WHIP,
			MOVE_FAINT_ATTACK,
			MOVE_DIG
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LONELY,
	},
	{
		.species = SPECIES_KECLEON,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_TAIL_WHIP,
			MOVE_SLASH,
			MOVE_LICK,
			MOVE_SCREECH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_MIGHTYENA,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_BITE,
			MOVE_TAKE_DOWN,
			MOVE_ROAR,
			MOVE_HOWL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SLAKING,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
		.teamFlags = 0x05,
		.moves = {
			MOVE_FAINT_ATTACK,
			MOVE_COUNTER,
			MOVE_SCRATCH,
			MOVE_TAUNT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_MACHOKE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_LEER,
			MOVE_DIG,
			MOVE_LOW_KICK,
			MOVE_FOCUS_PUNCH
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_RHYDON,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_STRENGTH,
			MOVE_ROCK_TOMB,
			MOVE_STOMP,
			MOVE_ROCK_SMASH
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_CACTURNE,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_POISON_STING,
			MOVE_GROWTH,
			MOVE_ABSORB,
			MOVE_SOLAR_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ZIGZAGOON,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_FLAIL,
			MOVE_SAND_ATTACK,
			MOVE_REST,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_DODRIO,
		.heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
		.teamFlags = 0x03,
		.moves = {
			MOVE_PURSUIT,
			MOVE_TRI_ATTACK,
			MOVE_GROWL,
			MOVE_AGILITY
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_WHISCASH,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_WATER_GUN,
			MOVE_AMNESIA,
			MOVE_MAGNITUDE,
			MOVE_MUD_SLAP
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_NINJASK,
		.heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
		.teamFlags = 0x41,
		.moves = {
			MOVE_SAND_ATTACK,
			MOVE_FURY_CUTTER,
			MOVE_AGILITY,
			MOVE_HARDEN
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_DUSCLOPS,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_PROTECT,
			MOVE_NIGHT_SHADE,
			MOVE_ASTONISH,
			MOVE_WILL_O_WISP
		},
		.evSpread = F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_CAMERUPT,
		.heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
		.teamFlags = 0x07,
		.moves = {
			MOVE_DIG,
			MOVE_EMBER,
			MOVE_GROWL,
			MOVE_ROCK_SMASH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_SPINDA,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x4A,
		.moves = {
			MOVE_TEETER_DANCE,
			MOVE_FLAIL,
			MOVE_PSYCH_UP,
			MOVE_DOUBLE_EDGE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_SEVIPER,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x09,
		.moves = {
			MOVE_SCREECH,
			MOVE_GLARE,
			MOVE_DIG,
			MOVE_POISON_FANG
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x49,
		.moves = {
			MOVE_SAND_ATTACK,
			MOVE_SAND_TOMB,
			MOVE_FACADE,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_AZUMARILL,
		.heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
		.teamFlags = 0x42,
		.moves = {
			MOVE_BUBBLE_BEAM,
			MOVE_TAIL_WHIP,
			MOVE_RAIN_DANCE,
			MOVE_ROLLOUT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ZANGOOSE,
		.heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
		.teamFlags = 0x07,
		.moves = {
			MOVE_STRENGTH,
			MOVE_TAUNT,
			MOVE_CRUSH_CLAW,
			MOVE_DETECT
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MEDICHAM,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x07,
		.moves = {
			MOVE_REVERSAL,
			MOVE_MEDITATE,
			MOVE_CONFUSION,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_ROSELIA,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_GROWTH,
			MOVE_MEGA_DRAIN,
			MOVE_TOXIC,
			MOVE_CUT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_SWALOT,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_STOCKPILE,
			MOVE_SPIT_UP,
			MOVE_SLUDGE,
			MOVE_POISON_GAS
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MAGNETON,
		.heldItem = BATTLE_TOWER_ITEM_MAGNET,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_SUPERSONIC,
			MOVE_THUNDER_WAVE,
			MOVE_SCREECH,
			MOVE_TRI_ATTACK
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
		.teamFlags = 0x09,
		.moves = {
			MOVE_CONFUSION,
			MOVE_TOXIC,
			MOVE_TORMENT,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_RELICANTH,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x01,
		.moves = {
			MOVE_SURF,
			MOVE_ANCIENT_POWER,
			MOVE_ROCK_TOMB,
			MOVE_HARDEN
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_NINETALES,
		.heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_FIRE_SPIN,
			MOVE_QUICK_ATTACK,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_SHARPEDO,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
		.teamFlags = 0x05,
		.moves = {
			MOVE_BITE,
			MOVE_SKULL_BASH,
			MOVE_RAIN_DANCE,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_GIRAFARIG,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x03,
		.moves = {
			MOVE_STRENGTH,
			MOVE_PSYBEAM,
			MOVE_AGILITY,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_PELIPPER,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_MIST,
			MOVE_STOCKPILE,
			MOVE_SWALLOW,
			MOVE_SPIT_UP
		},
		.evSpread = F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_SABLEYE,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_SHADOW_BALL,
			MOVE_NIGHT_SHADE,
			MOVE_SNATCH,
			MOVE_FAKE_OUT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_LUNATONE,
		.heldItem = BATTLE_TOWER_ITEM_HARD_STONE,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_COSMIC_POWER,
			MOVE_SANDSTORM,
			MOVE_PSYCHIC,
			MOVE_ROCK_THROW
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_NONE,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_THIEF,
			MOVE_FAKE_OUT,
			MOVE_SURF,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GRUMPIG,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_ODOR_SLEUTH,
			MOVE_CONFUSE_RAY,
			MOVE_MAGIC_COAT,
			MOVE_PSYCHIC
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_CUT,
			MOVE_LEECH_SEED,
			MOVE_MEGA_DRAIN,
			MOVE_STUN_SPORE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_WAILORD,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x03,
		.moves = {
			MOVE_WATER_SPOUT,
			MOVE_ROLLOUT,
			MOVE_MIST,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_WEEZING,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SMOG,
			MOVE_SELF_DESTRUCT,
			MOVE_TOXIC,
			MOVE_SLUDGE_BOMB
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_KADABRA,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_FUTURE_SIGHT,
			MOVE_FOCUS_PUNCH,
			MOVE_SKILL_SWAP,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_MAGNET,
		.teamFlags = 0x07,
		.moves = {
			MOVE_THUNDER_WAVE,
			MOVE_BITE,
			MOVE_SPARK,
			MOVE_QUICK_ATTACK
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_RAICHU,
		.heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_QUICK_ATTACK,
			MOVE_AGILITY,
			MOVE_LIGHT_SCREEN,
			MOVE_THUNDERBOLT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_XATU,
		.heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
		.teamFlags = 0x03,
		.moves = {
			MOVE_NIGHT_SHADE,
			MOVE_PECK,
			MOVE_CONFUSE_RAY,
			MOVE_FUTURE_SIGHT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_LOUDRED,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_UPROAR,
			MOVE_STOMP,
			MOVE_SCREECH,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_MODEST,
	},
	{
		.species = SPECIES_SOLROCK,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x03,
		.moves = {
			MOVE_ROCK_THROW,
			MOVE_SUNNY_DAY,
			MOVE_SOLAR_BEAM,
			MOVE_SANDSTORM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_CLAYDOL,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x03,
		.moves = {
			MOVE_SANDSTORM,
			MOVE_REFLECT,
			MOVE_ROCK_TOMB,
			MOVE_STRENGTH
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_CRAWDAUNT,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x03,
		.moves = {
			MOVE_WATER_PULSE,
			MOVE_KNOCK_OFF,
			MOVE_HARDEN,
			MOVE_CUT
		},
		.evSpread = F_EV_SPREAD_HP,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_GOLBAT,
		.heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
		.teamFlags = 0x09,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_WING_ATTACK,
			MOVE_MEAN_LOOK,
			MOVE_BITE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_BELLOSSOM,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_SOLAR_BEAM,
			MOVE_PETAL_DANCE,
			MOVE_SWEET_SCENT,
			MOVE_BULLET_SEED
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_DONPHAN,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x05,
		.moves = {
			MOVE_ROCK_SMASH,
			MOVE_RAPID_SPIN,
			MOVE_FLAIL,
			MOVE_HORN_ATTACK
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_NOSEPASS,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_SANDSTORM,
			MOVE_ROCK_SLIDE,
			MOVE_BLOCK,
			MOVE_THUNDER_WAVE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_PINSIR,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SWORDS_DANCE,
			MOVE_HARDEN,
			MOVE_CUT,
			MOVE_SEISMIC_TOSS
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_DISABLE,
			MOVE_PSYCH_UP,
			MOVE_WATER_PULSE,
			MOVE_BRICK_BREAK
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SHIFTRY,
		.heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
		.teamFlags = 0x07,
		.moves = {
			MOVE_TORMENT,
			MOVE_EXTRASENSORY,
			MOVE_SOLAR_BEAM,
			MOVE_AERIAL_ACE
		},
		.evSpread = F_EV_SPREAD_DEFENSE,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_DUSTOX,
		.heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
		.teamFlags = 0x01,
		.moves = {
			MOVE_CONFUSION,
			MOVE_SILVER_WIND,
			MOVE_PSYBEAM,
			MOVE_WHIRLWIND
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_SHUPPET,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x03,
		.moves = {
			MOVE_WILL_O_WISP,
			MOVE_NIGHT_SHADE,
			MOVE_FAINT_ATTACK,
			MOVE_CURSE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SEAKING,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x07,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_SURF,
			MOVE_HORN_ATTACK,
			MOVE_HORN_DRILL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE,
		.nature = NATURE_LONELY,
	},
	{
		.species = SPECIES_SKARMORY,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x07,
		.moves = {
			MOVE_STEEL_WING,
			MOVE_SAND_ATTACK,
			MOVE_SWIFT,
			MOVE_AGILITY
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_TORKOAL,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x43,
		.moves = {
			MOVE_FLAMETHROWER,
			MOVE_IRON_DEFENSE,
			MOVE_BODY_SLAM,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_GOLEM,
		.heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_MAGNITUDE,
			MOVE_EXPLOSION,
			MOVE_STRENGTH,
			MOVE_SANDSTORM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
		.teamFlags = 0x41,
		.moves = {
			MOVE_REFLECT,
			MOVE_PSYCHIC,
			MOVE_IMPRISON,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_SANDSLASH,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x07,
		.moves = {
			MOVE_SANDSTORM,
			MOVE_SLASH,
			MOVE_EARTHQUAKE,
			MOVE_SWIFT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_WOBBUFFET,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_COUNTER,
			MOVE_MIRROR_COAT,
			MOVE_SAFEGUARD,
			MOVE_DESTINY_BOND
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_TENTACRUEL,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_CONSTRICT,
			MOVE_SURF,
			MOVE_HYPER_BEAM,
			MOVE_SCREECH
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_TROPIUS,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SUNNY_DAY,
			MOVE_SOLAR_BEAM,
			MOVE_SYNTHESIS,
			MOVE_RAZOR_LEAF
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_MAWILE,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x43,
		.moves = {
			MOVE_IRON_DEFENSE,
			MOVE_SLUDGE_BOMB,
			MOVE_CRUNCH,
			MOVE_STRENGTH
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_SLUDGE,
			MOVE_ACID_ARMOR,
			MOVE_GIGA_DRAIN,
			MOVE_DISABLE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MAGCARGO,
		.heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
		.teamFlags = 0x0D,
		.moves = {
			MOVE_FLAMETHROWER,
			MOVE_ROCK_THROW,
			MOVE_HARDEN,
			MOVE_AMNESIA
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_LINOONE,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x07,
		.moves = {
			MOVE_HEADBUTT,
			MOVE_TAIL_WHIP,
			MOVE_SURF,
			MOVE_DIG
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_LIGHT_SCREEN,
			MOVE_THUNDERBOLT,
			MOVE_SWIFT,
			MOVE_ROLLOUT
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_DUSCLOPS,
		.heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
		.teamFlags = 0x09,
		.moves = {
			MOVE_MEAN_LOOK,
			MOVE_NIGHT_SHADE,
			MOVE_SKILL_SWAP,
			MOVE_SHADOW_BALL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_VILEPLUME,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_TOXIC,
			MOVE_MOONLIGHT,
			MOVE_GIGA_DRAIN,
			MOVE_STUN_SPORE
		},
		.evSpread = F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_BITE,
			MOVE_HAZE,
			MOVE_WING_ATTACK,
			MOVE_STEEL_WING
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_CORSOLA,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_RECOVER,
			MOVE_MIRROR_COAT,
			MOVE_HAIL,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_RAPID_SPIN,
			MOVE_WATER_PULSE,
			MOVE_REFLECT,
			MOVE_SKILL_SWAP
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_EXPLOUD,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x41,
		.moves = {
			MOVE_HYPER_BEAM,
			MOVE_HOWL,
			MOVE_UPROAR,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_PSYBEAM,
			MOVE_SNATCH,
			MOVE_REFLECT,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x05,
		.moves = {
			MOVE_HORN_ATTACK,
			MOVE_COUNTER,
			MOVE_REVERSAL,
			MOVE_LEER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_CASTFORM,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_WEATHER_BALL,
			MOVE_SUNNY_DAY,
			MOVE_RAIN_DANCE,
			MOVE_HAIL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_VIGOROTH,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_FOCUS_PUNCH,
			MOVE_REVERSAL,
			MOVE_COUNTER,
			MOVE_TAUNT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_DUSKULL,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x09,
		.moves = {
			MOVE_TOXIC,
			MOVE_CONFUSE_RAY,
			MOVE_SHADOW_BALL,
			MOVE_WILL_O_WISP
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_LANTURN,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x07,
		.moves = {
			MOVE_FLAIL,
			MOVE_SURF,
			MOVE_SPARK,
			MOVE_TAKE_DOWN
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x05,
		.moves = {
			MOVE_STRENGTH,
			MOVE_FAKE_OUT,
			MOVE_FACADE,
			MOVE_SAND_ATTACK
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x43,
		.moves = {
			MOVE_AGILITY,
			MOVE_DIVE,
			MOVE_ICE_BEAM,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GYARADOS,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x41,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_SURF,
			MOVE_WATER_PULSE,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_AGGRON,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x45,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_BRICK_BREAK,
			MOVE_METAL_CLAW,
			MOVE_ROAR
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_ABSOL,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0xC7,
		.moves = {
			MOVE_SWORDS_DANCE,
			MOVE_IRON_TAIL,
			MOVE_SLASH,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_SWELLOW,
		.heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
		.teamFlags = 0x0F,
		.moves = {
			MOVE_DOUBLE_TEAM,
			MOVE_FLY,
			MOVE_TOXIC,
			MOVE_STEEL_WING
		},
		.evSpread = 0,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
		.teamFlags = 0x05,
		.moves = {
			MOVE_STRENGTH,
			MOVE_CROSS_CHOP,
			MOVE_EARTHQUAKE,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
		.teamFlags = 0x41,
		.moves = {
			MOVE_PROTECT,
			MOVE_ICE_BEAM,
			MOVE_HYPER_BEAM,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x41,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_DRAGON_CLAW,
			MOVE_AGILITY,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
		.teamFlags = 0x41,
		.moves = {
			MOVE_BLAZE_KICK,
			MOVE_MIRROR_MOVE,
			MOVE_EARTHQUAKE,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_ALTARIA,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x43,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_DRAGON_DANCE,
			MOVE_TOXIC,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
		.teamFlags = 0x43,
		.moves = {
			MOVE_BRICK_BREAK,
			MOVE_WATER_PULSE,
			MOVE_RAIN_DANCE,
			MOVE_FOCUS_PUNCH
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_SABLEYE,
		.heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
		.teamFlags = 0x49,
		.moves = {
			MOVE_SHADOW_BALL,
			MOVE_SNATCH,
			MOVE_DIG,
			MOVE_CONFUSE_RAY
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ZANGOOSE,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
		.teamFlags = 0x0F,
		.moves = {
			MOVE_FACADE,
			MOVE_THUNDERBOLT,
			MOVE_CRUSH_CLAW,
			MOVE_DETECT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_LINOONE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x0F,
		.moves = {
			MOVE_IRON_TAIL,
			MOVE_HEADBUTT,
			MOVE_ATTRACT,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WHISCASH,
		.heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
		.teamFlags = 0x07,
		.moves = {
			MOVE_MUD_SLAP,
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_AMNESIA
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_SOLROCK,
		.heldItem = BATTLE_TOWER_ITEM_HARD_STONE,
		.teamFlags = 0x43,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_LIGHT_SCREEN,
			MOVE_ROCK_SLIDE,
			MOVE_CONFUSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x03,
		.moves = {
			MOVE_RECOVER,
			MOVE_RAIN_DANCE,
			MOVE_SURF,
			MOVE_CONFUSE_RAY
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_CACTURNE,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x0F,
		.moves = {
			MOVE_INGRAIN,
			MOVE_LEECH_SEED,
			MOVE_PROTECT,
			MOVE_FRUSTRATION
		},
		.evSpread = 0,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SHIFTRY,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_FRUSTRATION,
			MOVE_HYPER_BEAM,
			MOVE_GIGA_DRAIN,
			MOVE_TORMENT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_MAGNET,
		.teamFlags = 0x0F,
		.moves = {
			MOVE_THUNDER,
			MOVE_THUNDER_WAVE,
			MOVE_IRON_TAIL,
			MOVE_ROAR
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_KECLEON,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_FOCUS_PUNCH,
			MOVE_IRON_TAIL,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_PINSIR,
		.heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
		.teamFlags = 0x8D,
		.moves = {
			MOVE_GUILLOTINE,
			MOVE_SUBMISSION,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_METANG,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x05,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SHADOW_BALL,
			MOVE_PSYCHIC,
			MOVE_METEOR_MASH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_CLAYDOL,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x43,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SELF_DESTRUCT,
			MOVE_SANDSTORM,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_MASQUERAIN,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_TOXIC,
			MOVE_SILVER_WIND,
			MOVE_ATTRACT,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_RELICANTH,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0xC5,
		.moves = {
			MOVE_ROCK_TOMB,
			MOVE_DOUBLE_EDGE,
			MOVE_SURF,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x0D,
		.moves = {
			MOVE_SURF,
			MOVE_ENCORE,
			MOVE_BLIZZARD,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WAILORD,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_WATER_SPOUT,
			MOVE_REST,
			MOVE_AMNESIA,
			MOVE_HAIL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_GIRAFARIG,
		.heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
		.teamFlags = 0x4F,
		.moves = {
			MOVE_DOUBLE_TEAM,
			MOVE_CRUNCH,
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MEDICHAM,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x4B,
		.moves = {
			MOVE_CALM_MIND,
			MOVE_REVERSAL,
			MOVE_ROCK_TOMB,
			MOVE_PSYCHIC
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_TROPIUS,
		.heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
		.teamFlags = 0xC7,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SYNTHESIS,
			MOVE_RAZOR_LEAF,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_NINJASK,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x05,
		.moves = {
			MOVE_DOUBLE_TEAM,
			MOVE_SLASH,
			MOVE_SWORDS_DANCE,
			MOVE_LEECH_LIFE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_CAMERUPT,
		.heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
		.teamFlags = 0x0D,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_OVERHEAT,
			MOVE_SUNNY_DAY,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_SHARPEDO,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x05,
		.moves = {
			MOVE_CRUNCH,
			MOVE_SURF,
			MOVE_EARTHQUAKE,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WIGGLYTUFF,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x0E,
		.moves = {
			MOVE_PROTECT,
			MOVE_TOXIC,
			MOVE_DOUBLE_TEAM,
			MOVE_DIG
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_SEVIPER,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_HAZE,
			MOVE_CRUNCH,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_CRADILY,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0xC1,
		.moves = {
			MOVE_ROCK_TOMB,
			MOVE_CONFUSE_RAY,
			MOVE_INGRAIN,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ARMALDO,
		.heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
		.teamFlags = 0xC1,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SANDSTORM,
			MOVE_PROTECT,
			MOVE_SLASH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MAGNETON,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x0D,
		.moves = {
			MOVE_ZAP_CANNON,
			MOVE_SUPERSONIC,
			MOVE_TOXIC,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_LANTURN,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x06,
		.moves = {
			MOVE_THUNDER,
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_SWALOT,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x8B,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_SNATCH,
			MOVE_ENCORE,
			MOVE_BODY_SLAM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SKARMORY,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x81,
		.moves = {
			MOVE_STEEL_WING,
			MOVE_AGILITY,
			MOVE_TORMENT,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_DONPHAN,
		.heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
		.teamFlags = 0x0D,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_FLAIL,
			MOVE_ROAR,
			MOVE_IRON_TAIL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x41,
		.moves = {
			MOVE_FACADE,
			MOVE_REVERSAL,
			MOVE_MEGAHORN,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_BANETTE,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x83,
		.moves = {
			MOVE_SHADOW_BALL,
			MOVE_HYPER_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_SKILL_SWAP
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_SANDSLASH,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x0F,
		.moves = {
			MOVE_SANDSTORM,
			MOVE_TOXIC,
			MOVE_SLASH,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_CRAWDAUNT,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x05,
		.moves = {
			MOVE_GUILLOTINE,
			MOVE_CRABHAMMER,
			MOVE_BLIZZARD,
			MOVE_SLUDGE_BOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_GRUMPIG,
		.heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
		.teamFlags = 0x8B,
		.moves = {
			MOVE_MAGIC_COAT,
			MOVE_PSYCHIC,
			MOVE_REFLECT,
			MOVE_CONFUSE_RAY
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LONELY,
	},
	{
		.species = SPECIES_RHYDON,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x45,
		.moves = {
			MOVE_IRON_TAIL,
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_FIRE_BLAST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x8B,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_REFLECT,
			MOVE_RECOVER,
			MOVE_SKILL_SWAP
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_DUSCLOPS,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_SHADOW_BALL,
			MOVE_WILL_O_WISP,
			MOVE_BLIZZARD,
			MOVE_PSYCHIC
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_TORKOAL,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x09,
		.moves = {
			MOVE_FLAMETHROWER,
			MOVE_AMNESIA,
			MOVE_IRON_TAIL,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_SCREECH,
			MOVE_EXPLOSION,
			MOVE_MIRROR_COAT,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_IRON_TAIL,
			MOVE_FOCUS_PUNCH,
			MOVE_DOUBLE_TEAM,
			MOVE_LEECH_SEED
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_THUNDERBOLT,
			MOVE_FLAMETHROWER,
			MOVE_FOCUS_PUNCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_WEEZING,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x05,
		.moves = {
			MOVE_EXPLOSION,
			MOVE_SLUDGE_BOMB,
			MOVE_SHADOW_BALL,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_RAICHU,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x4E,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_DOUBLE_TEAM,
			MOVE_FOCUS_PUNCH,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_TENTACRUEL,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x09,
		.moves = {
			MOVE_DOUBLE_TEAM,
			MOVE_TOXIC,
			MOVE_SURF,
			MOVE_SLUDGE_BOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_EXPLOUD,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_BLIZZARD,
			MOVE_FLAMETHROWER,
			MOVE_EARTHQUAKE,
			MOVE_RETURN
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_XATU,
		.heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
		.teamFlags = 0x43,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_REST,
			MOVE_CONFUSE_RAY,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_GOLEM,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_EXPLOSION,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_TOMB,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x83,
		.moves = {
			MOVE_SURF,
			MOVE_ATTRACT,
			MOVE_CALM_MIND,
			MOVE_BLIZZARD
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_NINETALES,
		.heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
		.teamFlags = 0x4A,
		.moves = {
			MOVE_FLAMETHROWER,
			MOVE_ATTRACT,
			MOVE_TOXIC,
			MOVE_CONFUSE_RAY
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x13,
		.moves = {
			MOVE_DOUBLE_TEAM,
			MOVE_REST,
			MOVE_SURF,
			MOVE_DRAGON_BREATH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_SLAKING,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x03,
		.moves = {
			MOVE_CURSE,
			MOVE_AMNESIA,
			MOVE_YAWN,
			MOVE_FOCUS_PUNCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_GYARADOS,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_THUNDER,
			MOVE_EARTHQUAKE,
			MOVE_HYDRO_PUMP,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x21,
		.moves = {
			MOVE_BELLY_DRUM,
			MOVE_ENDURE,
			MOVE_EARTHQUAKE,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_ABSOL,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_FAINT_ATTACK,
			MOVE_DOUBLE_EDGE,
			MOVE_SHADOW_BALL,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_ALTARIA,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x83,
		.moves = {
			MOVE_DRAGON_DANCE,
			MOVE_MIRROR_MOVE,
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
		.teamFlags = 0x11,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_FOCUS_PUNCH,
			MOVE_ROCK_TOMB,
			MOVE_ENCORE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x43,
		.moves = {
			MOVE_CRUNCH,
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x33,
		.moves = {
			MOVE_COUNTER,
			MOVE_ROCK_SLIDE,
			MOVE_FOCUS_PUNCH,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_GLALIE,
		.heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
		.teamFlags = 0x81,
		.moves = {
			MOVE_BLIZZARD,
			MOVE_CRUNCH,
			MOVE_ICY_WIND,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_HUNTAIL,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0xA1,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_HYDRO_PUMP,
			MOVE_CRUNCH,
			MOVE_BLIZZARD
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
		.teamFlags = 0xD3,
		.moves = {
			MOVE_SURF,
			MOVE_ATTRACT,
			MOVE_RECOVER,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_GOREBYSS,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x83,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_SURF,
			MOVE_BLIZZARD,
			MOVE_SHADOW_BALL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x53,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_ENDEAVOR,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x53,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_MUD_SHOT,
			MOVE_BLIZZARD
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_AGGRON,
		.heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
		.teamFlags = 0x41,
		.moves = {
			MOVE_DOUBLE_EDGE,
			MOVE_FLAMETHROWER,
			MOVE_IRON_TAIL,
			MOVE_BLIZZARD
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_CRADILY,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0xE1,
		.moves = {
			MOVE_STOCKPILE,
			MOVE_SPIT_UP,
			MOVE_SWALLOW,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_ARMALDO,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0xC1,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_HYPER_BEAM,
			MOVE_SLASH,
			MOVE_SWORDS_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x82,
		.moves = {
			MOVE_FOCUS_PUNCH,
			MOVE_COUNTER,
			MOVE_MACH_PUNCH,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x83,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_SURF,
			MOVE_PROTECT,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_SHIFTRY,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x03,
		.moves = {
			MOVE_TORMENT,
			MOVE_FAINT_ATTACK,
			MOVE_SHADOW_BALL,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_TROPIUS,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_SUNNY_DAY,
			MOVE_SYNTHESIS,
			MOVE_SOLAR_BEAM,
			MOVE_LEECH_SEED
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_GRUMPIG,
		.heldItem = BATTLE_TOWER_ITEM_MACHO_BRACE,
		.teamFlags = 0x23,
		.moves = {
			MOVE_TRICK,
			MOVE_SKILL_SWAP,
			MOVE_PSYCHIC,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_TORKOAL,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x81,
		.moves = {
			MOVE_IRON_DEFENSE,
			MOVE_TOXIC,
			MOVE_REST,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_NONE,
		.teamFlags = 0x03,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_CRUNCH,
			MOVE_ROAR,
			MOVE_THIEF
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_PINSIR,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0x61,
		.moves = {
			MOVE_GUILLOTINE,
			MOVE_EARTHQUAKE,
			MOVE_DOUBLE_TEAM,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x93,
		.moves = {
			MOVE_LIGHT_SCREEN,
			MOVE_THUNDERBOLT,
			MOVE_SURF,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x51,
		.moves = {
			MOVE_MEGAHORN,
			MOVE_REVERSAL,
			MOVE_EARTHQUAKE,
			MOVE_COUNTER
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
		.teamFlags = 0x83,
		.moves = {
			MOVE_BLIZZARD,
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x13,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_RECOVER,
			MOVE_ENCORE,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x93,
		.moves = {
			MOVE_SURF,
			MOVE_BLIZZARD,
			MOVE_RECOVER,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_REGICE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x11,
		.moves = {
			MOVE_REST,
			MOVE_CURSE,
			MOVE_BLIZZARD,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_REGISTEEL,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x11,
		.moves = {
			MOVE_REST,
			MOVE_IRON_DEFENSE,
			MOVE_THUNDERBOLT,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_REGIROCK,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x91,
		.moves = {
			MOVE_ROCK_TOMB,
			MOVE_EARTHQUAKE,
			MOVE_THUNDERBOLT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_DUSCLOPS,
		.heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
		.teamFlags = 0x20,
		.moves = {
			MOVE_SHADOW_BALL,
			MOVE_EARTHQUAKE,
			MOVE_BLIZZARD,
			MOVE_DESTINY_BOND
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_SEAKING,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0xB2,
		.moves = {
			MOVE_HORN_DRILL,
			MOVE_AGILITY,
			MOVE_SLEEP_TALK,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_CAMERUPT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x00,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_ERUPTION,
			MOVE_ROCK_SLIDE,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_LANTURN,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x82,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_SURF,
			MOVE_THUNDER_WAVE,
			MOVE_BLIZZARD
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_WEEZING,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x20,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_THUNDERBOLT,
			MOVE_FIRE_BLAST,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_WHISCASH,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_ROCK_TOMB,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_AGGRON,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x11,
		.moves = {
			MOVE_DOUBLE_EDGE,
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_CACTURNE,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x63,
		.moves = {
			MOVE_DYNAMIC_PUNCH,
			MOVE_COUNTER,
			MOVE_FAINT_ATTACK,
			MOVE_GIGA_DRAIN
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_SHARPEDO,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x01,
		.moves = {
			MOVE_CRUNCH,
			MOVE_DOUBLE_EDGE,
			MOVE_SURF,
			MOVE_SWAGGER
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_ABSOL,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x82,
		.moves = {
			MOVE_DOUBLE_EDGE,
			MOVE_FACADE,
			MOVE_SWORDS_DANCE,
			MOVE_QUICK_ATTACK
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WAILORD,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0x23,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_EARTHQUAKE,
			MOVE_ATTRACT,
			MOVE_FISSURE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_TENTACRUEL,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x21,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_SLUDGE_BOMB,
			MOVE_GIGA_DRAIN,
			MOVE_MIRROR_COAT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0xA2,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_SURF,
			MOVE_TOXIC,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WOBBUFFET,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x23,
		.moves = {
			MOVE_ENCORE,
			MOVE_COUNTER,
			MOVE_MIRROR_COAT,
			MOVE_DESTINY_BOND
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_RHYDON,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x21,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_MEGAHORN,
			MOVE_HORN_DRILL,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_GLALIE,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x21,
		.moves = {
			MOVE_CRUNCH,
			MOVE_BLIZZARD,
			MOVE_HAIL,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x13,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_EARTHQUAKE,
			MOVE_DRAGON_CLAW,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x17,
		.moves = {
			MOVE_BLAZE_KICK,
			MOVE_ROCK_TOMB,
			MOVE_ENDURE,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x17,
		.moves = {
			MOVE_SURF,
			MOVE_EARTHQUAKE,
			MOVE_MUD_SHOT,
			MOVE_BLIZZARD
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x19,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDERBOLT,
			MOVE_DESTINY_BOND,
			MOVE_WILL_O_WISP
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0xF6,
		.moves = {
			MOVE_SPORE,
			MOVE_FOCUS_PUNCH,
			MOVE_BRICK_BREAK,
			MOVE_SLUDGE_BOMB
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
		.teamFlags = 0x1B,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDER_PUNCH,
			MOVE_REFLECT,
			MOVE_RECOVER
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_SHIFTRY,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x89,
		.moves = {
			MOVE_FAINT_ATTACK,
			MOVE_SHADOW_BALL,
			MOVE_DOUBLE_TEAM,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x85,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_EARTHQUAKE,
			MOVE_FACADE,
			MOVE_FAKE_OUT
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x49,
		.moves = {
			MOVE_ATTRACT,
			MOVE_CONFUSE_RAY,
			MOVE_BITE,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x15,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_FLAMETHROWER,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x0B,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_THUNDER_WAVE,
			MOVE_ROAR,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x27,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_PROTECT,
			MOVE_MIRROR_COAT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_FLAMETHROWER,
			MOVE_THUNDERBOLT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x4D,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_FLAMETHROWER,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x1B,
		.moves = {
			MOVE_SURF,
			MOVE_THUNDERBOLT,
			MOVE_RECOVER,
			MOVE_CONFUSE_RAY
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_DODRIO,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x2B,
		.moves = {
			MOVE_DRILL_PECK,
			MOVE_TRI_ATTACK,
			MOVE_AGILITY,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_RAICHU,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_THUNDER_WAVE,
			MOVE_REVERSAL,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_SURF,
			MOVE_CROSS_CHOP,
			MOVE_ICE_BEAM,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x54,
		.moves = {
			MOVE_MEGAHORN,
			MOVE_ROCK_TOMB,
			MOVE_ENDURE,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x06,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_EARTHQUAKE,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x1D,
		.moves = {
			MOVE_SURF,
			MOVE_TOXIC,
			MOVE_PROTECT,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x9C,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_CRUNCH,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x15,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE,
			MOVE_LIGHT_SCREEN
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_REGIROCK,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0xB5,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_ANCIENT_POWER,
			MOVE_FOCUS_PUNCH,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_REGICE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x96,
		.moves = {
			MOVE_ICE_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_DOUBLE_TEAM,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_REGISTEEL,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x94,
		.moves = {
			MOVE_METAL_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_THUNDERBOLT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x96,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_THUNDERBOLT,
			MOVE_REST,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x95,
		.moves = {
			MOVE_LUSTER_PURGE,
			MOVE_REFLECT,
			MOVE_RECOVER,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x96,
		.moves = {
			MOVE_SURF,
			MOVE_TOXIC,
			MOVE_RECOVER,
			MOVE_MIRROR_COAT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_SLAKING,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_HYPER_BEAM,
			MOVE_EARTHQUAKE,
			MOVE_NONE,
			MOVE_NONE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x1F,
		.moves = {
			MOVE_GIGA_DRAIN,
			MOVE_DOUBLE_TEAM,
			MOVE_LEECH_SEED,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x17,
		.moves = {
			MOVE_BLAZE_KICK,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_SLIDE,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x17,
		.moves = {
			MOVE_MUDDY_WATER,
			MOVE_MUD_SHOT,
			MOVE_MIRROR_COAT,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x7B,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_SHADOW_BALL,
			MOVE_DESTINY_BOND,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x56,
		.moves = {
			MOVE_SPORE,
			MOVE_COUNTER,
			MOVE_IRON_TAIL,
			MOVE_GIGA_DRAIN
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDER_PUNCH,
			MOVE_FIRE_PUNCH,
			MOVE_RECOVER
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_ROCK_TOMB,
			MOVE_ENDURE,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_GYARADOS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x0C,
		.moves = {
			MOVE_HYPER_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_EARTHQUAKE,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x49,
		.moves = {
			MOVE_TOXIC,
			MOVE_CONFUSE_RAY,
			MOVE_ATTRACT,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x15,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_COUNTER,
			MOVE_EARTHQUAKE,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x63,
		.moves = {
			MOVE_THUNDER,
			MOVE_THUNDER_WAVE,
			MOVE_REST,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x07,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_SCREECH,
			MOVE_MIRROR_COAT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_MODEST,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x45,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_GIGA_DRAIN,
			MOVE_ROCK_TOMB,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x4D,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_IRON_TAIL,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x1B,
		.moves = {
			MOVE_LIGHT_SCREEN,
			MOVE_THUNDERBOLT,
			MOVE_SURF,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_NINETALES,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_OVERHEAT,
			MOVE_FLAMETHROWER,
			MOVE_IRON_TAIL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_GOLEM,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x25,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_ROAR,
			MOVE_FIRE_BLAST,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x27,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_CROSS_CHOP,
			MOVE_BLIZZARD,
			MOVE_PSYCH_UP
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x55,
		.moves = {
			MOVE_MEGAHORN,
			MOVE_EARTHQUAKE,
			MOVE_COUNTER,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x36,
		.moves = {
			MOVE_SURF,
			MOVE_BLIZZARD,
			MOVE_ROCK_SLIDE,
			MOVE_SHEER_COLD
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x5C,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_PROTECT,
			MOVE_DRAGON_BREATH,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x9D,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_FLAMETHROWER,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x15,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_REGIROCK,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x95,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_ROCK_TOMB,
			MOVE_FACADE,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_REGICE,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x96,
		.moves = {
			MOVE_BLIZZARD,
			MOVE_THUNDERBOLT,
			MOVE_HAIL,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_REGISTEEL,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x94,
		.moves = {
			MOVE_METAL_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_ANCIENT_POWER,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x96,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_REFLECT,
			MOVE_RECOVER,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x95,
		.moves = {
			MOVE_LUSTER_PURGE,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0xD6,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_KECLEON,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x69,
		.moves = {
			MOVE_TRICK,
			MOVE_REST,
			MOVE_IRON_TAIL,
			MOVE_DISABLE
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x5F,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_EARTHQUAKE,
			MOVE_REST,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x7F,
		.moves = {
			MOVE_FOCUS_PUNCH,
			MOVE_COUNTER,
			MOVE_SWAGGER,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x57,
		.moves = {
			MOVE_IRON_TAIL,
			MOVE_CURSE,
			MOVE_DOUBLE_TEAM,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x3B,
		.moves = {
			MOVE_SHADOW_BALL,
			MOVE_PSYCHIC,
			MOVE_REST,
			MOVE_IMPRISON
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x56,
		.moves = {
			MOVE_SPORE,
			MOVE_FOCUS_PUNCH,
			MOVE_SLUDGE_BOMB,
			MOVE_IRON_TAIL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_TRICK,
			MOVE_RECOVER,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x65,
		.moves = {
			MOVE_REVENGE,
			MOVE_COUNTER,
			MOVE_FOCUS_PUNCH,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x54,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_PROTECT,
			MOVE_TOXIC,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x4B,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_BITE,
			MOVE_AIR_CUTTER,
			MOVE_SHADOW_BALL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x75,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_ROCK_SLIDE,
			MOVE_DYNAMIC_PUNCH,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_THUNDER_WAVE,
			MOVE_ATTRACT,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x64,
		.moves = {
			MOVE_THUNDER,
			MOVE_DOUBLE_TEAM,
			MOVE_MIRROR_COAT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x49,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_FLAMETHROWER,
			MOVE_THUNDERBOLT,
			MOVE_SHADOW_PUNCH
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0xCD,
		.moves = {
			MOVE_PROTECT,
			MOVE_DIG,
			MOVE_TOXIC,
			MOVE_SANDSTORM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x5B,
		.moves = {
			MOVE_SURF,
			MOVE_THUNDERBOLT,
			MOVE_BLIZZARD,
			MOVE_PSYCHIC
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_LEECH_SEED,
			MOVE_DIVE,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_RAICHU,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x4A,
		.moves = {
			MOVE_THUNDER,
			MOVE_REVERSAL,
			MOVE_FACADE,
			MOVE_IRON_TAIL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_SURF,
			MOVE_PSYCHIC,
			MOVE_ICE_BEAM,
			MOVE_IRON_TAIL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x15,
		.moves = {
			MOVE_MEGAHORN,
			MOVE_EARTHQUAKE,
			MOVE_FACADE,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0x26,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_FISSURE,
			MOVE_SHEER_COLD
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x4D,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_BLIZZARD,
			MOVE_HYPER_BEAM,
			MOVE_DISABLE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x9C,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_FIRE_BLAST,
			MOVE_HYDRO_PUMP
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0xB5,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_PSYCHIC,
			MOVE_PURSUIT,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_REGIROCK,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x95,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_TOXIC,
			MOVE_SUPERPOWER,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_REGICE,
		.heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
		.teamFlags = 0x96,
		.moves = {
			MOVE_ICE_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_ANCIENT_POWER,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_REGISTEEL,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0xB4,
		.moves = {
			MOVE_CURSE,
			MOVE_AMNESIA,
			MOVE_RETURN,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x92,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_THUNDERBOLT,
			MOVE_EARTHQUAKE,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x91,
		.moves = {
			MOVE_LUSTER_PURGE,
			MOVE_THUNDERBOLT,
			MOVE_EARTHQUAKE,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0xB2,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_SLAKING,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x65,
		.moves = {
			MOVE_YAWN,
			MOVE_SLASH,
			MOVE_COUNTER,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0xDF,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_DETECT,
			MOVE_DRAGON_CLAW,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0xD7,
		.moves = {
			MOVE_BLAZE_KICK,
			MOVE_SKY_UPPERCUT,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x5F,
		.moves = {
			MOVE_SURF,
			MOVE_EARTHQUAKE,
			MOVE_ICE_BEAM,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_SHEDINJA,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0xDB,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_SHADOW_BALL,
			MOVE_TOXIC,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x94,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_PSYCHIC,
			MOVE_SHADOW_BALL,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GRUMPIG,
		.heldItem = BATTLE_TOWER_ITEM_MACHO_BRACE,
		.teamFlags = 0x4B,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_CONFUSE_RAY,
			MOVE_TRICK,
			MOVE_REFLECT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x92,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_RECOVER,
			MOVE_ATTRACT,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x91,
		.moves = {
			MOVE_LUSTER_PURGE,
			MOVE_THUNDERBOLT,
			MOVE_ICE_BEAM,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_SURF,
			MOVE_THUNDERBOLT,
			MOVE_PSYCHIC,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x14,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_COUNTER,
			MOVE_ROCK_TOMB,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
};
