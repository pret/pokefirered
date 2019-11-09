const struct BattleTowerPokemonTemplate gBattleTowerLevel100Mons[] =
{
	{
		.species = SPECIES_LINOONE,
		.heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
		.teamFlags = 0x42,
		.moves = {
			MOVE_SLASH,
			MOVE_GROWL,
			MOVE_TAIL_WHIP,
			MOVE_SAND_ATTACK
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_MIGHTYENA,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_BITE,
			MOVE_HOWL,
			MOVE_ODOR_SLEUTH,
			MOVE_SCARY_FACE
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_BEAUTIFLY,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_GIGA_DRAIN,
			MOVE_GUST,
			MOVE_STUN_SPORE,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_DUSTOX,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_PSYBEAM,
			MOVE_GUST,
			MOVE_DOUBLE_TEAM,
			MOVE_SILVER_WIND
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_LOMBRE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_ASTONISH,
			MOVE_GROWL,
			MOVE_MEGA_DRAIN,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LONELY,
	},
	{
		.species = SPECIES_NUZLEAF,
		.heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
		.teamFlags = 0x01,
		.moves = {
			MOVE_BULLET_SEED,
			MOVE_RAZOR_WIND,
			MOVE_FAINT_ATTACK,
			MOVE_GROWTH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SWELLOW,
		.heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
		.teamFlags = 0x42,
		.moves = {
			MOVE_AERIAL_ACE,
			MOVE_GROWL,
			MOVE_ENDEAVOR,
			MOVE_FOCUS_ENERGY
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_PELIPPER,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x02,
		.moves = {
			MOVE_SURF,
			MOVE_WATER_SPORT,
			MOVE_PROTECT,
			MOVE_SUPERSONIC
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x42,
		.moves = {
			MOVE_MACH_PUNCH,
			MOVE_MEGA_DRAIN,
			MOVE_HEADBUTT,
			MOVE_STUN_SPORE
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_NINJASK,
		.heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_SCRATCH,
			MOVE_SCREECH,
			MOVE_LEECH_LIFE,
			MOVE_FLASH
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_BITE,
			MOVE_FLY,
			MOVE_SUPERSONIC,
			MOVE_HAZE
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_MAWILE,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x03,
		.moves = {
			MOVE_VICE_GRIP,
			MOVE_SWEET_SCENT,
			MOVE_ASTONISH,
			MOVE_STRENGTH
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_NOSEPASS,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_ROCK_THROW,
			MOVE_SANDSTORM,
			MOVE_HARDEN,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_DELCATTY,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x42,
		.moves = {
			MOVE_DOUBLE_SLAP,
			MOVE_TAIL_WHIP,
			MOVE_ATTRACT,
			MOVE_CHARM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_CAMERUPT,
		.heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
		.teamFlags = 0x01,
		.moves = {
			MOVE_EMBER,
			MOVE_TAKE_DOWN,
			MOVE_GROWL,
			MOVE_SANDSTORM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_ORAN_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_POISON_GAS,
			MOVE_MINIMIZE,
			MOVE_SLUDGE,
			MOVE_SCREECH
		},
		.evSpread = F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_SANDSLASH,
		.heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
		.teamFlags = 0x03,
		.moves = {
			MOVE_SLASH,
			MOVE_SAND_ATTACK,
			MOVE_DEFENSE_CURL,
			MOVE_SWIFT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SPINDA,
		.heldItem = BATTLE_TOWER_ITEM_SILK_SCARF,
		.teamFlags = 0x42,
		.moves = {
			MOVE_UPROAR,
			MOVE_WATER_PULSE,
			MOVE_THRASH,
			MOVE_SAFEGUARD
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_WHISCASH,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_TICKLE,
			MOVE_MUD_SPORT,
			MOVE_WATER_GUN,
			MOVE_WATER_SPORT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_CACTURNE,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x01,
		.moves = {
			MOVE_POISON_STING,
			MOVE_PIN_MISSILE,
			MOVE_ABSORB,
			MOVE_COTTON_SPORE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_JIGGLYPUFF,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x42,
		.moves = {
			MOVE_SING,
			MOVE_ROLLOUT,
			MOVE_POUND,
			MOVE_LIGHT_SCREEN
		},
		.evSpread = F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MARILL,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x42,
		.moves = {
			MOVE_BUBBLE_BEAM,
			MOVE_DEFENSE_CURL,
			MOVE_RAIN_DANCE,
			MOVE_IRON_TAIL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MAGNETON,
		.heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_THUNDER_SHOCK,
			MOVE_SUPERSONIC,
			MOVE_FLASH,
			MOVE_SCREECH
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_CARVANHA,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x01,
		.moves = {
			MOVE_BITE,
			MOVE_RAGE,
			MOVE_SCARY_FACE,
			MOVE_LEER
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_KECLEON,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_THIEF,
			MOVE_LICK,
			MOVE_BIND,
			MOVE_FURY_SWIPES
		},
		.evSpread = F_EV_SPREAD_DEFENSE,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_NINETALES,
		.heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
		.teamFlags = 0x02,
		.moves = {
			MOVE_EMBER,
			MOVE_CONFUSE_RAY,
			MOVE_FIRE_SPIN,
			MOVE_SAFEGUARD
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_LONELY,
	},
	{
		.species = SPECIES_RAICHU,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x42,
		.moves = {
			MOVE_SHOCK_WAVE,
			MOVE_GROWL,
			MOVE_DOUBLE_TEAM,
			MOVE_LIGHT_SCREEN
		},
		.evSpread = F_EV_SPREAD_DEFENSE,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_SEALEO,
		.heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
		.teamFlags = 0x01,
		.moves = {
			MOVE_ICE_BALL,
			MOVE_WATER_GUN,
			MOVE_ENCORE,
			MOVE_HAIL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_GRAVELER,
		.heldItem = BATTLE_TOWER_ITEM_HARD_STONE,
		.teamFlags = 0x01,
		.moves = {
			MOVE_ROCK_THROW,
			MOVE_MUD_SPORT,
			MOVE_SANDSTORM,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_SHUPPET,
		.heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
		.teamFlags = 0x03,
		.moves = {
			MOVE_NIGHT_SHADE,
			MOVE_WILL_O_WISP,
			MOVE_SCREECH,
			MOVE_KNOCK_OFF
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LUVDISC,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_ATTRACT,
			MOVE_FLAIL,
			MOVE_SWEET_KISS,
			MOVE_WATER_PULSE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_LANTURN,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_THUNDER_WAVE,
			MOVE_SUPERSONIC,
			MOVE_WATER_GUN,
			MOVE_SPARK
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_CORSOLA,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_MIRROR_COAT,
			MOVE_BUBBLE,
			MOVE_HARDEN,
			MOVE_LIGHT_SCREEN
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_WAILMER,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SURF,
			MOVE_ROAR,
			MOVE_GROWL,
			MOVE_MIST
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_RHYDON,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_TAKE_DOWN,
			MOVE_SCARY_FACE,
			MOVE_TAIL_WHIP,
			MOVE_ROAR
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_DODRIO,
		.heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
		.teamFlags = 0x05,
		.moves = {
			MOVE_FURY_ATTACK,
			MOVE_PURSUIT,
			MOVE_AERIAL_ACE,
			MOVE_AGILITY
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x05,
		.moves = {
			MOVE_FURY_SWIPES,
			MOVE_TAIL_WHIP,
			MOVE_DISABLE,
			MOVE_PSYCH_UP
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_BELLOSSOM,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_GIGA_DRAIN,
			MOVE_POISON_POWDER,
			MOVE_STUN_SPORE,
			MOVE_ACID
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_TROPIUS,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x05,
		.moves = {
			MOVE_STOMP,
			MOVE_RAZOR_LEAF,
			MOVE_GUST,
			MOVE_SYNTHESIS
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SABLEYE,
		.heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_NIGHT_SHADE,
			MOVE_FAKE_OUT,
			MOVE_PSYCH_UP,
			MOVE_DETECT
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x03,
		.moves = {
			MOVE_SONIC_BOOM,
			MOVE_SCREECH,
			MOVE_SPARK,
			MOVE_SELF_DESTRUCT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_TENTACRUEL,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x01,
		.moves = {
			MOVE_ACID,
			MOVE_WATER_PULSE,
			MOVE_BARRIER,
			MOVE_WRAP
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_CLAYDOL,
		.heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_ANCIENT_POWER,
			MOVE_MUD_SLAP,
			MOVE_RAPID_SPIN,
			MOVE_CONFUSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_GRUMPIG,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_PSYBEAM,
			MOVE_PSYCH_UP,
			MOVE_BOUNCE,
			MOVE_MAGIC_COAT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_CRAWDAUNT,
		.heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
		.teamFlags = 0x05,
		.moves = {
			MOVE_CRABHAMMER,
			MOVE_BUBBLE_BEAM,
			MOVE_BRICK_BREAK,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_SEVIPER,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0x01,
		.moves = {
			MOVE_POISON_TAIL,
			MOVE_GLARE,
			MOVE_WRAP,
			MOVE_THIEF
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_ZANGOOSE,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_FURY_CUTTER,
			MOVE_LEER,
			MOVE_QUICK_ATTACK,
			MOVE_DETECT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ALTARIA,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x03,
		.moves = {
			MOVE_DRAGON_BREATH,
			MOVE_SING,
			MOVE_SAFEGUARD,
			MOVE_TAKE_DOWN
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ROSELIA,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_LEECH_SEED,
			MOVE_MEGA_DRAIN,
			MOVE_GROWTH,
			MOVE_STUN_SPORE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_VOLBEAT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x09,
		.moves = {
			MOVE_SIGNAL_BEAM,
			MOVE_CONFUSE_RAY,
			MOVE_DOUBLE_TEAM,
			MOVE_LIGHT_SCREEN
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ILLUMISE,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_CHARM,
			MOVE_ENCORE,
			MOVE_SOLAR_BEAM,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_MAGNET,
		.teamFlags = 0x03,
		.moves = {
			MOVE_BITE,
			MOVE_HOWL,
			MOVE_THUNDER_WAVE,
			MOVE_SPARK
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_MAWILE,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_CRUNCH,
			MOVE_IRON_DEFENSE,
			MOVE_TORMENT,
			MOVE_SANDSTORM
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x05,
		.moves = {
			MOVE_ARM_THRUST,
			MOVE_FAKE_OUT,
			MOVE_WHIRLWIND,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_SKARMORY,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x01,
		.moves = {
			MOVE_STEEL_WING,
			MOVE_AGILITY,
			MOVE_TAUNT,
			MOVE_FLY
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_TORKOAL,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_FIRE_SPIN,
			MOVE_SMOKESCREEN,
			MOVE_BODY_SLAM,
			MOVE_AMNESIA
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_GYARADOS,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_THRASH,
			MOVE_DRAGON_RAGE,
			MOVE_TWISTER,
			MOVE_HYDRO_PUMP
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_MIGHTYENA,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_CRUNCH,
			MOVE_HOWL,
			MOVE_IRON_TAIL,
			MOVE_TORMENT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_LINOONE,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x06,
		.moves = {
			MOVE_SLASH,
			MOVE_ATTRACT,
			MOVE_SHOCK_WAVE,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MASQUERAIN,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_TOXIC,
			MOVE_STUN_SPORE,
			MOVE_SUNNY_DAY,
			MOVE_SOLAR_BEAM
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x06,
		.moves = {
			MOVE_BULLET_SEED,
			MOVE_SLAM,
			MOVE_SCREECH,
			MOVE_DETECT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x06,
		.moves = {
			MOVE_DOUBLE_KICK,
			MOVE_FLAMETHROWER,
			MOVE_DOUBLE_TEAM,
			MOVE_ROAR
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x49,
		.moves = {
			MOVE_SURF,
			MOVE_MUD_SHOT,
			MOVE_MUD_SPORT,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x49,
		.moves = {
			MOVE_DRAGON_BREATH,
			MOVE_FLY,
			MOVE_TOXIC,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x49,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_SMOKESCREEN,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_CORSOLA,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_ANCIENT_POWER,
			MOVE_MIRROR_COAT,
			MOVE_SAFEGUARD,
			MOVE_REFLECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_RHYDON,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x41,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_IRON_TAIL,
			MOVE_ROAR,
			MOVE_THUNDERBOLT
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x06,
		.moves = {
			MOVE_MEGAHORN,
			MOVE_COUNTER,
			MOVE_PROTECT,
			MOVE_LEER
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_GIRAFARIG,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_CRUNCH,
			MOVE_BATON_PASS,
			MOVE_AGILITY
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_XATU,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_FLY,
			MOVE_CONFUSE_RAY,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_DODRIO,
		.heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
		.teamFlags = 0x03,
		.moves = {
			MOVE_DRILL_PECK,
			MOVE_TRI_ATTACK,
			MOVE_PURSUIT,
			MOVE_TORMENT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SERIOUS,
	},
	{
		.species = SPECIES_VILEPLUME,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x89,
		.moves = {
			MOVE_POISON_POWDER,
			MOVE_STUN_SPORE,
			MOVE_SLEEP_POWDER,
			MOVE_PETAL_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_MODEST,
	},
	{
		.species = SPECIES_MEDICHAM,
		.heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
		.teamFlags = 0x06,
		.moves = {
			MOVE_FOCUS_PUNCH,
			MOVE_LIGHT_SCREEN,
			MOVE_BULK_UP,
			MOVE_PSYCHIC
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_ABSOL,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x06,
		.moves = {
			MOVE_SLASH,
			MOVE_SWORDS_DANCE,
			MOVE_DOUBLE_TEAM,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_DUSCLOPS,
		.heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
		.teamFlags = 0x4B,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_WILL_O_WISP,
			MOVE_NIGHT_SHADE,
			MOVE_DISABLE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_SHUPPET,
		.heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
		.teamFlags = 0x43,
		.moves = {
			MOVE_GRUDGE,
			MOVE_SHADOW_BALL,
			MOVE_CURSE,
			MOVE_KNOCK_OFF
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_CASTFORM,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x82,
		.moves = {
			MOVE_WEATHER_BALL,
			MOVE_HAIL,
			MOVE_SUNNY_DAY,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SPEED,
		.nature = NATURE_MODEST,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x02,
		.moves = {
			MOVE_SURF,
			MOVE_REFRESH,
			MOVE_RECOVER,
			MOVE_RAIN_DANCE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_SHARPEDO,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_CRUNCH,
			MOVE_FOCUS_ENERGY,
			MOVE_SCARY_FACE,
			MOVE_SCREECH
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x06,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SAND_ATTACK,
			MOVE_DRAGON_BREATH,
			MOVE_SAND_TOMB
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_TRAPINCH,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_TOXIC,
			MOVE_SAND_TOMB,
			MOVE_CRUNCH,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_LUNATONE,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x43,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_ROCK_THROW,
			MOVE_HYPNOSIS,
			MOVE_LIGHT_SCREEN
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SOLROCK,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x43,
		.moves = {
			MOVE_SOLAR_BEAM,
			MOVE_SUNNY_DAY,
			MOVE_COSMIC_POWER,
			MOVE_CALM_MIND
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_BALTOY,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x43,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE,
			MOVE_REFLECT,
			MOVE_SELF_DESTRUCT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_CRAWDAUNT,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x06,
		.moves = {
			MOVE_CRABHAMMER,
			MOVE_SURF,
			MOVE_PROTECT,
			MOVE_BRICK_BREAK
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_WHISCASH,
		.heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
		.teamFlags = 0x06,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_TICKLE,
			MOVE_AMNESIA,
			MOVE_SURF
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SEVIPER,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x09,
		.moves = {
			MOVE_POISON_TAIL,
			MOVE_CRUNCH,
			MOVE_GIGA_DRAIN,
			MOVE_HAZE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_MAGCARGO,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x89,
		.moves = {
			MOVE_FLAMETHROWER,
			MOVE_LIGHT_SCREEN,
			MOVE_AMNESIA,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
		.teamFlags = 0x09,
		.moves = {
			MOVE_KARATE_CHOP,
			MOVE_SEISMIC_TOSS,
			MOVE_BRICK_BREAK,
			MOVE_LOW_KICK
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_SWALOT,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x86,
		.moves = {
			MOVE_YAWN,
			MOVE_WATER_PULSE,
			MOVE_SHADOW_BALL,
			MOVE_SLUDGE_BOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x0C,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_GIGA_DRAIN,
			MOVE_FURY_CUTTER,
			MOVE_DETECT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x0C,
		.moves = {
			MOVE_BLAZE_KICK,
			MOVE_FLAMETHROWER,
			MOVE_PROTECT,
			MOVE_QUICK_ATTACK
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x4C,
		.moves = {
			MOVE_SURF,
			MOVE_MUD_SHOT,
			MOVE_MUD_SLAP,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MIGHTYENA,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
		.teamFlags = 0x04,
		.moves = {
			MOVE_CRUNCH,
			MOVE_HOWL,
			MOVE_SWAGGER,
			MOVE_SHADOW_BALL
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_LINOONE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x04,
		.moves = {
			MOVE_SLASH,
			MOVE_REST,
			MOVE_BELLY_DRUM,
			MOVE_THUNDERBOLT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_BEAUTIFLY,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x08,
		.moves = {
			MOVE_GIGA_DRAIN,
			MOVE_ATTRACT,
			MOVE_MORNING_SUN,
			MOVE_STUN_SPORE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_DUSTOX,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x08,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_SILVER_WIND,
			MOVE_MOONLIGHT,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x0C,
		.moves = {
			MOVE_FAKE_OUT,
			MOVE_HYDRO_PUMP,
			MOVE_ICE_BEAM,
			MOVE_UPROAR
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_SHIFTRY,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x0C,
		.moves = {
			MOVE_FRUSTRATION,
			MOVE_GIGA_DRAIN,
			MOVE_TORMENT,
			MOVE_SWAGGER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_SWELLOW,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x88,
		.moves = {
			MOVE_FLY,
			MOVE_ENDEAVOR,
			MOVE_AERIAL_ACE,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
		.teamFlags = 0x4A,
		.moves = {
			MOVE_HYPNOSIS,
			MOVE_DREAM_EATER,
			MOVE_PSYCHIC,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x0C,
		.moves = {
			MOVE_DYNAMIC_PUNCH,
			MOVE_MIND_READER,
			MOVE_SNATCH,
			MOVE_MEGA_DRAIN
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_VIGOROTH,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x04,
		.moves = {
			MOVE_SLASH,
			MOVE_UPROAR,
			MOVE_ENCORE,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_NINJASK,
		.heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
		.teamFlags = 0x04,
		.moves = {
			MOVE_FURY_CUTTER,
			MOVE_GIGA_DRAIN,
			MOVE_SWORDS_DANCE,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_SHEDINJA,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0xCA,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_SOLAR_BEAM,
			MOVE_SUNNY_DAY,
			MOVE_GRUDGE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_LOUDRED,
		.heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
		.teamFlags = 0x04,
		.moves = {
			MOVE_HYPER_VOICE,
			MOVE_HOWL,
			MOVE_SHADOW_BALL,
			MOVE_TORMENT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x04,
		.moves = {
			MOVE_ARM_THRUST,
			MOVE_BULK_UP,
			MOVE_BRICK_BREAK,
			MOVE_HIDDEN_POWER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
		.teamFlags = 0x88,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_SHADOW_BALL,
			MOVE_FUTURE_SIGHT,
			MOVE_DISABLE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0x88,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_TOXIC,
			MOVE_MEAN_LOOK,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MAWILE,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x04,
		.moves = {
			MOVE_CRUNCH,
			MOVE_IRON_DEFENSE,
			MOVE_FAKE_TEARS,
			MOVE_POISON_FANG
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_AGGRON,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x45,
		.moves = {
			MOVE_METAL_CLAW,
			MOVE_FLAMETHROWER,
			MOVE_METAL_SOUND,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GOLEM,
		.heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
		.teamFlags = 0xC5,
		.moves = {
			MOVE_ROLLOUT,
			MOVE_DEFENSE_CURL,
			MOVE_DOUBLE_TEAM,
			MOVE_SELF_DESTRUCT
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_MAGNET,
		.teamFlags = 0x04,
		.moves = {
			MOVE_THUNDER,
			MOVE_RAIN_DANCE,
			MOVE_THUNDER_WAVE,
			MOVE_CHARGE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_VOLBEAT,
		.heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
		.teamFlags = 0x08,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_SIGNAL_BEAM,
			MOVE_MOONLIGHT,
			MOVE_TAIL_GLOW
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_ILLUMISE,
		.heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
		.teamFlags = 0x08,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_FLATTER,
			MOVE_WISH,
			MOVE_ENCORE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MASQUERAIN,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x88,
		.moves = {
			MOVE_GIGA_DRAIN,
			MOVE_SILVER_WIND,
			MOVE_STUN_SPORE,
			MOVE_TOXIC
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_ROSELIA,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x08,
		.moves = {
			MOVE_PETAL_DANCE,
			MOVE_GROWTH,
			MOVE_SYNTHESIS,
			MOVE_GRASS_WHISTLE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_IMPISH,
	},
	{
		.species = SPECIES_DELCATTY,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x08,
		.moves = {
			MOVE_SING,
			MOVE_ATTRACT,
			MOVE_DOUBLE_SLAP,
			MOVE_HEAL_BELL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_SEAKING,
		.heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
		.teamFlags = 0x88,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_SURF,
			MOVE_ATTRACT,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_GYARADOS,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_EARTHQUAKE,
			MOVE_DRAGON_RAGE,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CALM,
	},
	{
		.species = SPECIES_SWALOT,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x42,
		.moves = {
			MOVE_STOCKPILE,
			MOVE_SWALLOW,
			MOVE_SPIT_UP,
			MOVE_YAWN
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_MAGCARGO,
		.heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_ROCK_SLIDE,
			MOVE_FIRE_BLAST,
			MOVE_BODY_SLAM,
			MOVE_LIGHT_SCREEN
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LONELY,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_FLAMETHROWER,
			MOVE_ACID_ARMOR,
			MOVE_DISABLE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_SPINDA,
		.heldItem = BATTLE_TOWER_ITEM_SILK_SCARF,
		.teamFlags = 0x42,
		.moves = {
			MOVE_DIZZY_PUNCH,
			MOVE_TEETER_DANCE,
			MOVE_PSYCH_UP,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_MODEST,
	},
	{
		.species = SPECIES_ALTARIA,
		.heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
		.teamFlags = 0x03,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_DRAGON_BREATH,
			MOVE_DRAGON_DANCE,
			MOVE_REFRESH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_ZANGOOSE,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_CRUSH_CLAW,
			MOVE_TAUNT,
			MOVE_SWORDS_DANCE,
			MOVE_DETECT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_SEVIPER,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_SWAGGER,
			MOVE_TAUNT,
			MOVE_GLARE,
			MOVE_POISON_TAIL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_GRUMPIG,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x42,
		.moves = {
			MOVE_TOXIC,
			MOVE_BOUNCE,
			MOVE_CONFUSE_RAY,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_CACTURNE,
		.heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
		.teamFlags = 0x41,
		.moves = {
			MOVE_NEEDLE_ARM,
			MOVE_INGRAIN,
			MOVE_SPIKES,
			MOVE_COTTON_SPORE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_CLAYDOL,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SANDSTORM,
			MOVE_COSMIC_POWER,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_TENTACRUEL,
		.heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
		.teamFlags = 0xC1,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_HYDRO_PUMP,
			MOVE_BARRIER,
			MOVE_SUPERSONIC
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WIGGLYTUFF,
		.heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_SING,
			MOVE_FOCUS_PUNCH,
			MOVE_DISABLE,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_ADAMANT,
	},
	{
		.species = SPECIES_AZUMARILL,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0xC2,
		.moves = {
			MOVE_SURF,
			MOVE_ATTRACT,
			MOVE_DEFENSE_CURL,
			MOVE_ROLLOUT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_RASH,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_MIRROR_COAT,
			MOVE_LIGHT_SCREEN,
			MOVE_SELF_DESTRUCT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x42,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_ATTRACT,
			MOVE_RECOVER,
			MOVE_REFRESH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_KECLEON,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x43,
		.moves = {
			MOVE_SKILL_SWAP,
			MOVE_ANCIENT_POWER,
			MOVE_WATER_PULSE,
			MOVE_THUNDERBOLT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_DUSCLOPS,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x43,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_CURSE,
			MOVE_REST,
			MOVE_MEAN_LOOK
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_ABSOL,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_SLASH,
			MOVE_SWORDS_DANCE,
			MOVE_DOUBLE_TEAM,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_NINETALES,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0xC2,
		.moves = {
			MOVE_FLAMETHROWER,
			MOVE_CONFUSE_RAY,
			MOVE_DOUBLE_TEAM,
			MOVE_WILL_O_WISP
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_PIKACHU,
		.heldItem = BATTLE_TOWER_ITEM_LIGHT_BALL,
		.teamFlags = 0xC2,
		.moves = {
			MOVE_THUNDER_WAVE,
			MOVE_THUNDER,
			MOVE_RAIN_DANCE,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_VILEPLUME,
		.heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_GIGA_DRAIN,
			MOVE_SLEEP_POWDER,
			MOVE_MOONLIGHT,
			MOVE_SLUDGE_BOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_DONPHAN,
		.heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
		.teamFlags = 0x41,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_DOUBLE_EDGE,
			MOVE_IRON_TAIL,
			MOVE_FISSURE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_QUIRKY,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
		.teamFlags = 0xC3,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
		.teamFlags = 0x43,
		.moves = {
			MOVE_ICE_BEAM,
			MOVE_BODY_SLAM,
			MOVE_ENCORE,
			MOVE_HAIL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_RELICANTH,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x41,
		.moves = {
			MOVE_YAWN,
			MOVE_MUD_SPORT,
			MOVE_DOUBLE_EDGE,
			MOVE_SANDSTORM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LONELY,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x43,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_ICE_BEAM,
			MOVE_HYDRO_PUMP,
			MOVE_AGILITY
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_CRADILY,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x43,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_INGRAIN,
			MOVE_ANCIENT_POWER,
			MOVE_GIGA_DRAIN
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_ARMALDO,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x43,
		.moves = {
			MOVE_SLASH,
			MOVE_ROCK_SLIDE,
			MOVE_EARTHQUAKE,
			MOVE_WATER_PULSE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
		.teamFlags = 0x41,
		.moves = {
			MOVE_METAL_CLAW,
			MOVE_PSYCHIC,
			MOVE_LIGHT_SCREEN,
			MOVE_AGILITY
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x42,
		.moves = {
			MOVE_DRAGON_BREATH,
			MOVE_CRUNCH,
			MOVE_FLAMETHROWER,
			MOVE_AERIAL_ACE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_MIGHTYENA,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_CRUNCH,
			MOVE_YAWN,
			MOVE_FACADE,
			MOVE_HOWL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LINOONE,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x02,
		.moves = {
			MOVE_HYPER_BEAM,
			MOVE_FACADE,
			MOVE_ATTRACT,
			MOVE_TRICK
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_SURF,
			MOVE_FOCUS_PUNCH,
			MOVE_FAKE_OUT,
			MOVE_SYNTHESIS
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_EXPLOUD,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_UPROAR,
			MOVE_EARTHQUAKE,
			MOVE_ICE_BEAM,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SWELLOW,
		.heldItem = BATTLE_TOWER_ITEM_LANSAT_BERRY,
		.teamFlags = 0x02,
		.moves = {
			MOVE_FACADE,
			MOVE_SUPERSONIC,
			MOVE_WING_ATTACK,
			MOVE_ENDEAVOR
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_PELIPPER,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x82,
		.moves = {
			MOVE_STOCKPILE,
			MOVE_SWALLOW,
			MOVE_SPIT_UP,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x01,
		.moves = {
			MOVE_DYNAMIC_PUNCH,
			MOVE_COUNTER,
			MOVE_BULK_UP,
			MOVE_MIND_READER
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SHEDINJA,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_RETURN,
			MOVE_DOUBLE_TEAM,
			MOVE_TOXIC,
			MOVE_SHADOW_BALL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_EXPLOUD,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_HYPER_BEAM,
			MOVE_SUPERSONIC,
			MOVE_FLAMETHROWER,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x01,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_COUNTER,
			MOVE_FACADE,
			MOVE_FAKE_OUT
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x83,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_ENCORE,
			MOVE_DISABLE,
			MOVE_RECOVER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x81,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_AIR_CUTTER,
			MOVE_TORMENT,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SABLEYE,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x83,
		.moves = {
			MOVE_TOXIC,
			MOVE_DETECT,
			MOVE_RECOVER,
			MOVE_TORMENT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_MAWILE,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x02,
		.moves = {
			MOVE_CRUNCH,
			MOVE_SWORDS_DANCE,
			MOVE_IRON_DEFENSE,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_AGGRON,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_DOUBLE_EDGE,
			MOVE_IRON_DEFENSE,
			MOVE_ROAR,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_GOLEM,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_ROCK_SLIDE,
			MOVE_FLAMETHROWER,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_NOSEPASS,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x81,
		.moves = {
			MOVE_THUNDER_WAVE,
			MOVE_ROCK_SLIDE,
			MOVE_TORMENT,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x02,
		.moves = {
			MOVE_THUNDER,
			MOVE_CRUNCH,
			MOVE_THUNDER_WAVE,
			MOVE_QUICK_ATTACK
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_ROSELIA,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x82,
		.moves = {
			MOVE_GRASS_WHISTLE,
			MOVE_LEECH_SEED,
			MOVE_GIGA_DRAIN,
			MOVE_GROWTH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_DELCATTY,
		.heldItem = BATTLE_TOWER_ITEM_STARF_BERRY,
		.teamFlags = 0x02,
		.moves = {
			MOVE_ASSIST,
			MOVE_SING,
			MOVE_ATTRACT,
			MOVE_SUBSTITUTE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_TROPIUS,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0xC2,
		.moves = {
			MOVE_RAZOR_LEAF,
			MOVE_EARTHQUAKE,
			MOVE_ATTRACT,
			MOVE_SYNTHESIS
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_SWALOT,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x03,
		.moves = {
			MOVE_YAWN,
			MOVE_SLUDGE_BOMB,
			MOVE_ATTRACT,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
		.teamFlags = 0x01,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_BULK_UP,
			MOVE_LOW_KICK,
			MOVE_BRICK_BREAK
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_CAMERUPT,
		.heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
		.teamFlags = 0x40,
		.moves = {
			MOVE_ERUPTION,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_SLIDE,
			MOVE_OVERHEAT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_MAGCARGO,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x03,
		.moves = {
			MOVE_FLAMETHROWER,
			MOVE_ROCK_SLIDE,
			MOVE_EARTHQUAKE,
			MOVE_REFLECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WEEZING,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x81,
		.moves = {
			MOVE_WILL_O_WISP,
			MOVE_HYPER_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_DESTINY_BOND
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_SPINDA,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x82,
		.moves = {
			MOVE_TRICK,
			MOVE_TEETER_DANCE,
			MOVE_FOCUS_PUNCH,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_SKARMORY,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x01,
		.moves = {
			MOVE_DRILL_PECK,
			MOVE_STEEL_WING,
			MOVE_TORMENT,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ALTARIA,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x02,
		.moves = {
			MOVE_SING,
			MOVE_DRAGON_CLAW,
			MOVE_ICE_BEAM,
			MOVE_EARTHQUAKE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_GRUMPIG,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x82,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_CONFUSE_RAY,
			MOVE_CALM_MIND,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_SHIFTRY,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x20,
		.moves = {
			MOVE_SWAGGER,
			MOVE_FRUSTRATION,
			MOVE_ATTRACT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_CLAYDOL,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x20,
		.moves = {
			MOVE_COSMIC_POWER,
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x33,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_COUNTER,
			MOVE_BELLY_DRUM,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_NOSEPASS,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x20,
		.moves = {
			MOVE_ROCK_SLIDE,
			MOVE_THUNDER_WAVE,
			MOVE_EARTHQUAKE,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_LAX,
	},
	{
		.species = SPECIES_DUSCLOPS,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x33,
		.moves = {
			MOVE_SHADOW_PUNCH,
			MOVE_WILL_O_WISP,
			MOVE_CONFUSE_RAY,
			MOVE_DESTINY_BOND
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_SEAKING,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0x20,
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
		.teamFlags = 0x73,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_ERUPTION,
			MOVE_ROCK_SLIDE,
			MOVE_FISSURE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_LANTURN,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x13,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_SURF,
			MOVE_THUNDER_WAVE,
			MOVE_CONFUSE_RAY
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_WEEZING,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x33,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_THUNDERBOLT,
			MOVE_FIRE_BLAST,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WHISCASH,
		.heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
		.teamFlags = 0x20,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_SPARK,
			MOVE_FISSURE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_AGGRON,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x51,
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
		.species = SPECIES_KECLEON,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x12,
		.moves = {
			MOVE_TRICK,
			MOVE_FOCUS_PUNCH,
			MOVE_ATTRACT,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_SHARPEDO,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x11,
		.moves = {
			MOVE_CRUNCH,
			MOVE_DOUBLE_EDGE,
			MOVE_SURF,
			MOVE_SWAGGER
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ABSOL,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x12,
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
		.teamFlags = 0x72,
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
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x20,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_SLUDGE_BOMB,
			MOVE_BARRIER,
			MOVE_MIRROR_COAT
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_SABLEYE,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x32,
		.moves = {
			MOVE_SHADOW_BALL,
			MOVE_TOXIC,
			MOVE_RECOVER,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WOBBUFFET,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x20,
		.moves = {
			MOVE_ENCORE,
			MOVE_COUNTER,
			MOVE_MIRROR_COAT,
			MOVE_DESTINY_BOND
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_MILD,
	},
	{
		.species = SPECIES_RHYDON,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x71,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_MEGAHORN,
			MOVE_BRICK_BREAK,
			MOVE_HORN_DRILL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_GLALIE,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x31,
		.moves = {
			MOVE_CRUNCH,
			MOVE_BLIZZARD,
			MOVE_HAIL,
			MOVE_SHEER_COLD
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_EARTHQUAKE,
			MOVE_DRAGON_CLAW,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_BLAZE_KICK,
			MOVE_COUNTER,
			MOVE_ENDURE,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_SURF,
			MOVE_EARTHQUAKE,
			MOVE_MIRROR_COAT,
			MOVE_BLIZZARD
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDERBOLT,
			MOVE_DESTINY_BOND,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x15,
		.moves = {
			MOVE_SPORE,
			MOVE_FOCUS_PUNCH,
			MOVE_MACH_PUNCH,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x58,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_FIRE_PUNCH,
			MOVE_ICE_PUNCH,
			MOVE_RECOVER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x15,
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
		.species = SPECIES_GYARADOS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x55,
		.moves = {
			MOVE_HYPER_BEAM,
			MOVE_EARTHQUAKE,
			MOVE_SURF,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_BOLD,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x58,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_CONFUSE_RAY,
			MOVE_AIR_CUTTER,
			MOVE_DOUBLE_TEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x5D,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_FLAMETHROWER,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_THUNDER_WAVE,
			MOVE_ROAR,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x60,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_PROTECT,
			MOVE_MIRROR_COAT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x64,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_FLAMETHROWER,
			MOVE_THUNDERBOLT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x1C,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_FLAMETHROWER,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x5C,
		.moves = {
			MOVE_SURF,
			MOVE_THUNDERBOLT,
			MOVE_RECOVER,
			MOVE_CONFUSE_RAY
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_NINETALES,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x4A,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_TOXIC,
			MOVE_FIRE_SPIN,
			MOVE_HEAT_WAVE
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_RAICHU,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x5A,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_THUNDER_WAVE,
			MOVE_REVERSAL,
			MOVE_IRON_TAIL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x55,
		.moves = {
			MOVE_SURF,
			MOVE_CROSS_CHOP,
			MOVE_ICE_BEAM,
			MOVE_DIG
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x5D,
		.moves = {
			MOVE_MEGAHORN,
			MOVE_EARTHQUAKE,
			MOVE_ENDURE,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_WALREIN,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x26,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_EARTHQUAKE,
			MOVE_SHEER_COLD
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
		.teamFlags = 0x5B,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_DRAGON_BREATH,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x0D,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_CRUNCH,
			MOVE_FIRE_BLAST
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_NAUGHTY,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x3D,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_REGIROCK,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_ANCIENT_POWER,
			MOVE_THUNDERBOLT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_REGICE,
		.heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_ICE_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_EARTHQUAKE,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_REGISTEEL,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_METAL_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_THUNDERBOLT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x0E,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_THUNDERBOLT,
			MOVE_RECOVER,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x0D,
		.moves = {
			MOVE_LUSTER_PURGE,
			MOVE_THUNDERBOLT,
			MOVE_RECOVER,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_SURF,
			MOVE_TOXIC,
			MOVE_RECOVER,
			MOVE_MIRROR_COAT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_SLAKING,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x15,
		.moves = {
			MOVE_YAWN,
			MOVE_FOCUS_PUNCH,
			MOVE_COUNTER,
			MOVE_SLACK_OFF
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x8C,
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
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_BLAZE_KICK,
			MOVE_EARTHQUAKE,
			MOVE_ROCK_SLIDE,
			MOVE_QUICK_ATTACK
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_MUDDY_WATER,
			MOVE_MUD_SHOT,
			MOVE_MIRROR_COAT,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDERBOLT,
			MOVE_HYPNOSIS,
			MOVE_DREAM_EATER
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SPORE,
			MOVE_COUNTER,
			MOVE_SKY_UPPERCUT,
			MOVE_GIGA_DRAIN
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x58,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDER_PUNCH,
			MOVE_FIRE_PUNCH,
			MOVE_RECOVER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x04,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_COUNTER,
			MOVE_ENDURE,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_GYARADOS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x44,
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
		.teamFlags = 0x48,
		.moves = {
			MOVE_TOXIC,
			MOVE_CONFUSE_RAY,
			MOVE_ATTRACT,
			MOVE_FLY
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x5D,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_COUNTER,
			MOVE_EARTHQUAKE,
			MOVE_FACADE
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_THUNDER,
			MOVE_THUNDER_WAVE,
			MOVE_QUICK_ATTACK,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x60,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_LIGHT_SCREEN,
			MOVE_MIRROR_COAT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x64,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_GIGA_DRAIN,
			MOVE_FLAMETHROWER,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x1C,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_IRON_TAIL,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x5C,
		.moves = {
			MOVE_BLIZZARD,
			MOVE_THUNDERBOLT,
			MOVE_PSYCHIC,
			MOVE_RECOVER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_DODRIO,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x5A,
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
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x4A,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_THUNDER_WAVE,
			MOVE_ATTRACT,
			MOVE_FOCUS_PUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x45,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_CROSS_CHOP,
			MOVE_BLIZZARD,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x5D,
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
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x26,
		.moves = {
			MOVE_SURF,
			MOVE_BLIZZARD,
			MOVE_ROCK_SLIDE,
			MOVE_SHEER_COLD
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x5C,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_ICE_BEAM,
			MOVE_DRAGON_BREATH,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
		.teamFlags = 0x1D,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_CRUNCH,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x3D,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE,
			MOVE_SHADOW_BALL
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_REGIROCK,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_THUNDERBOLT,
			MOVE_FOCUS_PUNCH,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_REGICE,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_ICE_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_HAIL,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_REGISTEEL,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_METAL_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_ANCIENT_POWER,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x1E,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
		.teamFlags = 0x1D,
		.moves = {
			MOVE_LUSTER_PURGE,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_HYDRO_PUMP,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_MIRROR_COAT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_SLAKING,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x15,
		.moves = {
			MOVE_YAWN,
			MOVE_FOCUS_PUNCH,
			MOVE_COUNTER,
			MOVE_PURSUIT
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_DOCILE,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_LEAF_BLADE,
			MOVE_ROCK_TOMB,
			MOVE_DRAGON_CLAW,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_BLAZIKEN,
		.heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_FOCUS_PUNCH,
			MOVE_COUNTER,
			MOVE_SWAGGER,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SWAMPERT,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x8C,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_ATTRACT,
			MOVE_REST
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_GARDEVOIR,
		.heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDERBOLT,
			MOVE_ATTRACT,
			MOVE_WILL_O_WISP
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_BRELOOM,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x05,
		.moves = {
			MOVE_SPORE,
			MOVE_FOCUS_PUNCH,
			MOVE_MACH_PUNCH,
			MOVE_COUNTER
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
		.teamFlags = 0x58,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_TRICK,
			MOVE_RECOVER,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_HARIYAMA,
		.heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
		.teamFlags = 0x05,
		.moves = {
			MOVE_REVENGE,
			MOVE_COUNTER,
			MOVE_FOCUS_PUNCH,
			MOVE_REVERSAL
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_RAIN_DANCE,
			MOVE_LEECH_SEED,
			MOVE_GIGA_DRAIN,
			MOVE_DIVE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_CROBAT,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x48,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_CONFUSE_RAY,
			MOVE_SHADOW_BALL,
			MOVE_SNATCH
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x5D,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_FIRE_BLAST,
			MOVE_LOW_KICK,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_MANECTRIC,
		.heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
		.teamFlags = 0x08,
		.moves = {
			MOVE_THUNDERBOLT,
			MOVE_THUNDER_WAVE,
			MOVE_ATTRACT,
			MOVE_CRUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_ELECTRODE,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x60,
		.moves = {
			MOVE_THUNDER,
			MOVE_SWIFT,
			MOVE_MIRROR_COAT,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_BASHFUL,
	},
	{
		.species = SPECIES_MUK,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x64,
		.moves = {
			MOVE_SLUDGE_BOMB,
			MOVE_FLAMETHROWER,
			MOVE_THUNDERBOLT,
			MOVE_SHADOW_PUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_FLYGON,
		.heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
		.teamFlags = 0x0C,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_EARTHQUAKE,
			MOVE_FIRE_BLAST,
			MOVE_SANDSTORM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_TIMID,
	},
	{
		.species = SPECIES_STARMIE,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x4C,
		.moves = {
			MOVE_SURF,
			MOVE_THUNDERBOLT,
			MOVE_ICE_BEAM,
			MOVE_PSYCHIC
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LUDICOLO,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x4A,
		.moves = {
			MOVE_LEECH_SEED,
			MOVE_ATTRACT,
			MOVE_DOUBLE_TEAM,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_SKARMORY,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x4B,
		.moves = {
			MOVE_DRILL_PECK,
			MOVE_STEEL_WING,
			MOVE_ATTRACT,
			MOVE_PURSUIT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
		.nature = NATURE_SASSY,
	},
	{
		.species = SPECIES_GOLDUCK,
		.heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
		.teamFlags = 0x49,
		.moves = {
			MOVE_SURF,
			MOVE_PSYCHIC,
			MOVE_ICE_BEAM,
			MOVE_CROSS_CHOP
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_JOLLY,
	},
	{
		.species = SPECIES_HERACROSS,
		.heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
		.teamFlags = 0x5D,
		.moves = {
			MOVE_MEGAHORN,
			MOVE_EARTHQUAKE,
			MOVE_FOCUS_PUNCH,
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
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_KINGDRA,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x5C,
		.moves = {
			MOVE_SURF,
			MOVE_BLIZZARD,
			MOVE_HYPER_BEAM,
			MOVE_FLAIL
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
		.teamFlags = 0x1D,
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
		.teamFlags = 0x3D,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_PSYCHIC,
			MOVE_EARTHQUAKE,
			MOVE_HYPER_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_REGIROCK,
		.heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_EARTHQUAKE,
			MOVE_THUNDERBOLT,
			MOVE_SUPERPOWER,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_REGICE,
		.heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_ICE_BEAM,
			MOVE_THUNDERBOLT,
			MOVE_ANCIENT_POWER,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
		.nature = NATURE_CAREFUL,
	},
	{
		.species = SPECIES_REGISTEEL,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x3C,
		.moves = {
			MOVE_METAL_CLAW,
			MOVE_THUNDERBOLT,
			MOVE_HYPER_BEAM,
			MOVE_EXPLOSION
		},
		.evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_GENTLE,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x1E,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_THUNDERBOLT,
			MOVE_EARTHQUAKE,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
		.teamFlags = 0x1D,
		.moves = {
			MOVE_LUSTER_PURGE,
			MOVE_THUNDERBOLT,
			MOVE_EARTHQUAKE,
			MOVE_ICE_BEAM
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_MILOTIC,
		.heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
		.teamFlags = 0x1A,
		.moves = {
			MOVE_SURF,
			MOVE_ICE_BEAM,
			MOVE_RECOVER,
			MOVE_ATTRACT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_BRAVE,
	},
	{
		.species = SPECIES_ALTARIA,
		.heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
		.teamFlags = 0x0A,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_ICE_BEAM,
			MOVE_SING,
			MOVE_FLAMETHROWER
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_SCEPTILE,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x9C,
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
		.teamFlags = 0x9C,
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
		.teamFlags = 0x9C,
		.moves = {
			MOVE_SURF,
			MOVE_EARTHQUAKE,
			MOVE_ICE_BEAM,
			MOVE_ROCK_TOMB
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_SHEDINJA,
		.heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
		.teamFlags = 0x20,
		.moves = {
			MOVE_CONFUSE_RAY,
			MOVE_SHADOW_BALL,
			MOVE_TOXIC,
			MOVE_GRUDGE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
	{
		.species = SPECIES_METAGROSS,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x1D,
		.moves = {
			MOVE_METEOR_MASH,
			MOVE_EARTHQUAKE,
			MOVE_DOUBLE_TEAM,
			MOVE_PROTECT
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
		.nature = NATURE_NAIVE,
	},
	{
		.species = SPECIES_ALAKAZAM,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x58,
		.moves = {
			MOVE_PSYCHIC,
			MOVE_THUNDER_PUNCH,
			MOVE_ICE_PUNCH,
			MOVE_FIRE_PUNCH
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_HASTY,
	},
	{
		.species = SPECIES_LATIAS,
		.heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
		.teamFlags = 0x1E,
		.moves = {
			MOVE_MIST_BALL,
			MOVE_THUNDERBOLT,
			MOVE_ICE_BEAM,
			MOVE_DRAGON_CLAW
		},
		.evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
		.nature = NATURE_QUIET,
	},
	{
		.species = SPECIES_LATIOS,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x1D,
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
		.species = SPECIES_SALAMENCE,
		.heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
		.teamFlags = 0x1D,
		.moves = {
			MOVE_DRAGON_CLAW,
			MOVE_FLAMETHROWER,
			MOVE_EARTHQUAKE,
			MOVE_AERIAL_ACE
		},
		.evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
		.nature = NATURE_RELAXED,
	},
	{
		.species = SPECIES_MACHAMP,
		.heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
		.teamFlags = 0x5D,
		.moves = {
			MOVE_CROSS_CHOP,
			MOVE_EARTHQUAKE,
			MOVE_LOW_KICK,
			MOVE_ROCK_SLIDE
		},
		.evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
		.nature = NATURE_HARDY,
	},
};
