#include "pokemon_groups.h"

#include "data.h"
#include "global.h"
#include "global.fieldmap.h"
#include "random.h"
#include "region_map.h"

// Starter groups only take game seed into account.
// All other groups also take route seed into account.

const u16 gGroup_GrassStarterStage1[] =
{
  /*SIZE=*/3,
  SPECIES_BULBASAUR,
  SPECIES_CHIKORITA,
  SPECIES_TREECKO,
};

const u16 gGroup_GrassStarterStage2[] =
{
  /*SIZE=*/3,
  SPECIES_IVYSAUR,
  SPECIES_BAYLEEF,
  SPECIES_GROVYLE,
};

const u16 gGroup_GrassStarterStage3[] =
{
  /*SIZE=*/3,
  SPECIES_VENUSAUR,
  SPECIES_MEGANIUM,
  SPECIES_SCEPTILE,
};

const u16 gGroup_FireStarterStage1[] =
{
  /*SIZE=*/3,
  SPECIES_CHARMANDER,
  SPECIES_CYNDAQUIL,
  SPECIES_TORCHIC,
};

const u16 gGroup_FireStarterStage2[] =
{
  /*SIZE=*/3,
  SPECIES_CHARMELEON,
  SPECIES_QUILAVA,
  SPECIES_COMBUSKEN,
};

const u16 gGroup_FireStarterStage3[] =
{
  /*SIZE=*/3,
  SPECIES_CHARIZARD,
  SPECIES_TYPHLOSION,
  SPECIES_BLAZIKEN,
};

const u16 gGroup_WaterStarterStage1[] =
{
  /*SIZE=*/3,
  SPECIES_SQUIRTLE,
  SPECIES_TOTODILE,
  SPECIES_MUDKIP,
};

const u16 gGroup_WaterStarterStage2[] =
{
  /*SIZE=*/3,
  SPECIES_WARTORTLE,
  SPECIES_CROCONAW,
  SPECIES_MARSHTOMP,
};

const u16 gGroup_WaterStarterStage3[] =
{
  /*SIZE=*/3,
  SPECIES_BLASTOISE,
  SPECIES_FERALIGATR,
  SPECIES_SWAMPERT,
};


const u16 gGroup_BirdStage1[] =
{
  /*SIZE =*/6,
  SPECIES_PIDGEY,
  SPECIES_SPEAROW,
  SPECIES_DODUO,
  SPECIES_FARFETCHD,
  SPECIES_HOOTHOOT,
  SPECIES_TAILLOW,
};

const u16 gGroup_BirdStage2[] =
{
  /*SIZE=*/6,
  SPECIES_PIDGEOTTO,
  SPECIES_FEAROW,
  SPECIES_DODRIO,
  SPECIES_FARFETCHD,
  SPECIES_NOCTOWL,
  SPECIES_SWELLOW,
};

const u16 gGroup_BirdStage3[] =
{
  /*SIZE=*/6,
  SPECIES_PIDGEOT,
  SPECIES_FEAROW,
  SPECIES_DODRIO,
  SPECIES_FARFETCHD,
  SPECIES_NOCTOWL,
  SPECIES_SWELLOW,
};

const u16 gGroup_BugStage1[] =
{
  /*SIZE=*/6,
  SPECIES_CATERPIE,
  SPECIES_WEEDLE,
  SPECIES_LEDYBA,
  SPECIES_SPINARAK,
  SPECIES_WURMPLE,
  //SPECIES_WURMPLE,
  SPECIES_YANMA,
};

const u16 gGroup_BugStage2[] =
{
  /*SIZE=*/8,
  SPECIES_METAPOD,
  SPECIES_KAKUNA,
  SPECIES_LEDIAN,
  SPECIES_ARIADOS,
  SPECIES_SILCOON,
  SPECIES_CASCOON,
  SPECIES_VOLBEAT,
  SPECIES_ILLUMISE,
};

const u16 gGroup_BugStage3[] =
{
  /*SIZE=*/6,
  SPECIES_BUTTERFREE,
  SPECIES_BEEDRILL,
  SPECIES_LEDIAN,
  SPECIES_ARIADOS,
  SPECIES_BEAUTIFLY,
  SPECIES_DUSTOX,
  // Maybe Volbeat and Illumise?
};

const u16 gGroup_NormalStage1[] =
{
  /*SIZE =*/7,
  SPECIES_RATTATA,
  SPECIES_MEOWTH,
  SPECIES_SENTRET,
  SPECIES_ZIGZAGOON,
  SPECIES_POOCHYENA,
  SPECIES_SKITTY,
  SPECIES_WHISMUR,
};

const u16 gGroup_NormalStage2[] =
{
  /*SIZE =*/7,
  SPECIES_RATICATE,
  SPECIES_PERSIAN,
  SPECIES_FURRET,
  SPECIES_LINOONE,
  SPECIES_MIGHTYENA,
  SPECIES_DELCATTY,
  SPECIES_LOUDRED,
};

const u16 gGroup_GroundRockStage1[] =
{
  /*SIZE =*/16,
  SPECIES_SANDSHREW,
  SPECIES_NIDORAN_F,
  SPECIES_NIDORAN_M,
  SPECIES_DIGLETT,
  SPECIES_GEODUDE,
  SPECIES_ONIX,
  SPECIES_CUBONE,
  SPECIES_RHYHORN,
  SPECIES_SUDOWOODO,
  SPECIES_GLIGAR,
  SPECIES_PHANPY,
  SPECIES_NOSEPASS,
  SPECIES_ARON,
  SPECIES_LUNATONE,
  SPECIES_BALTOY,
  SPECIES_TRAPINCH,
};

const u16 gGroup_GroundRockStage2[] =
{
  /*SIZE =*/16,
  SPECIES_SANDSLASH,
  SPECIES_NIDORINA,
  SPECIES_NIDORINO,
  SPECIES_DUGTRIO,
  SPECIES_GRAVELER,
  SPECIES_STEELIX,
  SPECIES_MAROWAK,
  SPECIES_RHYDON,
  SPECIES_SUDOWOODO,
  SPECIES_GLIGAR,
  SPECIES_DONPHAN,
  SPECIES_NOSEPASS,
  SPECIES_LAIRON,
  SPECIES_LUNATONE,
  SPECIES_CLAYDOL,
  SPECIES_VIBRAVA,
};

const u16 gGroup_GroundRockStage3[] =
{
  /*SIZE =*/16,
  SPECIES_SANDSLASH,
  SPECIES_NIDOQUEEN,
  SPECIES_NIDOKING,
  SPECIES_DUGTRIO,
  SPECIES_GOLEM,
  SPECIES_STEELIX,
  SPECIES_MAROWAK,
  SPECIES_RHYDON,
  SPECIES_SUDOWOODO,
  SPECIES_GLIGAR,
  SPECIES_DONPHAN,
  SPECIES_NOSEPASS,
  SPECIES_AGGRON,
  SPECIES_LUNATONE,
  SPECIES_CLAYDOL,
  SPECIES_FLYGON,
};

const u16 gGroup_FightingPsychicStage1[] =
{
  /*SIZE =*/14,
  SPECIES_MANKEY,
  SPECIES_MACHOP,
  SPECIES_DROWZEE,
  SPECIES_EXEGGCUTE,
  SPECIES_GIRAFARIG,
  SPECIES_NATU,
  SPECIES_AIPOM,
  SPECIES_TYROGUE,
  SPECIES_WYNAUT,
  SPECIES_MAKUHITA,
  SPECIES_MEDITITE,
  SPECIES_SPOINK,
  SPECIES_SOLROCK,
  SPECIES_CHIMECHO,
};

const u16 gGroup_FightingPsychicStage2[] =
{
  /*SIZE =*/14,
  SPECIES_PRIMEAPE,
  SPECIES_MACHOKE,
  SPECIES_HYPNO,
  SPECIES_EXEGGUTOR,
  SPECIES_GIRAFARIG,
  SPECIES_XATU,
  SPECIES_AIPOM,
  SPECIES_HITMONTOP,
  SPECIES_WOBBUFFET,
  SPECIES_MEDICHAM,
  SPECIES_HARIYAMA,
  SPECIES_GRUMPIG,
  SPECIES_SOLROCK,
  SPECIES_CHIMECHO,
};

const u16 gGroup_RarePsychicStage1[] =
{
  /*SIZE =*/5,
  SPECIES_ABRA,
  SPECIES_MR_MIME,
  SPECIES_SMOOCHUM,
  SPECIES_RALTS,
  SPECIES_BELDUM,
};

const u16 gGroup_RarePsychicStage2[] =
{
  /*SIZE =*/5,
  SPECIES_KADABRA,
  SPECIES_MR_MIME,
  SPECIES_JYNX,
  SPECIES_KIRLIA,
  SPECIES_METANG,
};

const u16 gGroup_RarePsychicStage3[] =
{
  /*SIZE =*/5,
  SPECIES_ALAKAZAM,
  SPECIES_MR_MIME,
  SPECIES_JYNX,
  SPECIES_GARDEVOIR,
  SPECIES_METAGROSS,
};

const u16 gGroup_MtMoonPlusStage1[] =
{
  /*SIZE =*/13,
  SPECIES_ZUBAT,
  SPECIES_CLEFAIRY,
  SPECIES_JIGGLYPUFF,
  SPECIES_PARAS,
  SPECIES_SNUBBULL,
  SPECIES_MURKROW,
  SPECIES_DUNSPARCE,
  SPECIES_SHUCKLE,
  SPECIES_SMEARGLE,
  SPECIES_SPINDA,
  SPECIES_NINCADA,
  SPECIES_MAWILE,
  SPECIES_KABUTO,
};

const u16 gGroup_MtMoonPlusStage2[] =
{
  /*SIZE =*/13,
  SPECIES_GOLBAT,
  SPECIES_CLEFABLE,
  SPECIES_WIGGLYTUFF,
  SPECIES_PARASECT,
  SPECIES_GRANBULL,
  SPECIES_MURKROW,
  SPECIES_DUNSPARCE,
  SPECIES_SHUCKLE,
  SPECIES_SMEARGLE,
  SPECIES_SPINDA,
  SPECIES_NINJASK,
  SPECIES_MAWILE,
  SPECIES_KABUTOPS,
};

const u16 gGroup_FirePoisonStage1[] =
{
  /*SIZE =*/13,
  SPECIES_EKANS,
  SPECIES_VULPIX,
  SPECIES_GROWLITHE,
  SPECIES_PONYTA,
  SPECIES_GRIMER,
  SPECIES_KOFFING,
  SPECIES_MAGBY,
  SPECIES_SLUGMA,
  SPECIES_HOUNDOUR,
  SPECIES_GULPIN,
  SPECIES_NUMEL,
  SPECIES_SEVIPER,
  SPECIES_TORKOAL,
};

const u16 gGroup_FirePoisonStage2[] =
{
  /*SIZE =*/13,
  SPECIES_ARBOK,
  SPECIES_NINETALES,
  SPECIES_ARCANINE,
  SPECIES_RAPIDASH,
  SPECIES_MUK,
  SPECIES_WEEZING,
  SPECIES_MAGMAR,
  SPECIES_MAGCARGO,
  SPECIES_HOUNDOOM,
  SPECIES_SWALOT,
  SPECIES_CAMERUPT,
  SPECIES_SEVIPER,
  SPECIES_TORKOAL,
};

const u16 gGroup_GrassBugGroup1[] =
{
  /*SIZE =*/18,
  SPECIES_ODDISH,
  SPECIES_VENONAT,
  SPECIES_BELLSPROUT,
  SPECIES_TANGELA,
  SPECIES_PINSIR,
  SPECIES_SCYTHER,
  SPECIES_HOPPIP,
  SPECIES_SUNKERN,
  SPECIES_PINECO,
  SPECIES_HERACROSS,
  SPECIES_SHROOMISH,
  SPECIES_LOTAD,
  SPECIES_SEEDOT,
  SPECIES_CACNEA,
  SPECIES_ROSELIA,
  SPECIES_TROPIUS,
  SPECIES_LILEEP,
  SPECIES_ANORITH,
};

const u16 gGroup_GrassBugGroup2[] =
{
  /*SIZE =*/18,
  SPECIES_GLOOM,
  SPECIES_VENOMOTH,
  SPECIES_WEEPINBELL,
  SPECIES_TANGELA,
  SPECIES_PINSIR,
  SPECIES_SCYTHER,
  SPECIES_SKIPLOOM,
  SPECIES_SUNFLORA,
  SPECIES_PINECO,
  SPECIES_HERACROSS,
  SPECIES_BRELOOM,
  SPECIES_LOMBRE,
  SPECIES_NUZLEAF,
  SPECIES_CACTURNE,
  SPECIES_ROSELIA,
  SPECIES_TROPIUS,
  SPECIES_LILEEP,
  SPECIES_ANORITH,
};

const u16 gGroup_GrassBugStage3[] =
{
  /*SIZE =*/18,
  SPECIES_VILEPLUME,
  SPECIES_VENOMOTH,
  SPECIES_VICTREEBEL,
  SPECIES_TANGELA,
  SPECIES_PINSIR,
  SPECIES_SCIZOR,
  SPECIES_JUMPLUFF,
  SPECIES_SUNFLORA,
  SPECIES_FORRETRESS,
  SPECIES_HERACROSS,
  SPECIES_BRELOOM,
  SPECIES_LUDICOLO,
  SPECIES_SHIFTRY,
  SPECIES_CACTURNE,
  SPECIES_BELLOSSOM,
  SPECIES_TROPIUS,
  SPECIES_CRADILY,
  SPECIES_ARMALDO,
};

const u16 gGroup_WaterStage1[] =
{
  /*SIZE =*/29,
  SPECIES_PSYDUCK,
  SPECIES_POLIWAG,
  SPECIES_TENTACOOL,
  SPECIES_SLOWPOKE,
  SPECIES_SEEL,
  SPECIES_SHELLDER,
  SPECIES_KRABBY,
  SPECIES_HORSEA,
  SPECIES_GOLDEEN,
  SPECIES_STARYU,
  SPECIES_MAGIKARP,
  SPECIES_OMANYTE,
  SPECIES_CHINCHOU,
  SPECIES_MARILL,
  SPECIES_WOOPER,
  SPECIES_LUVDISC,
  SPECIES_CORSOLA,
  SPECIES_REMORAID,
  SPECIES_MANTINE,
  SPECIES_WINGULL,
  SPECIES_SURSKIT,
  SPECIES_WAILMER,
  SPECIES_FEEBAS,
  SPECIES_CARVANHA,
  SPECIES_SPHEAL,
  SPECIES_CLAMPERL,
  SPECIES_BARBOACH,
  SPECIES_QWILFISH,
  SPECIES_CORPHISH,
};

const u16 gGroup_WaterStage2[] =
{
  /*SIZE =*/29,
  SPECIES_GOLDUCK,
  SPECIES_POLIWHIRL,
  SPECIES_TENTACRUEL,
  SPECIES_SLOWBRO,
  SPECIES_DEWGONG,
  SPECIES_CLOYSTER,
  SPECIES_KINGLER,
  SPECIES_SEADRA,
  SPECIES_SEAKING,
  SPECIES_STARMIE,
  SPECIES_POLITOED,
  SPECIES_OMASTAR,
  SPECIES_LANTURN,
  SPECIES_AZUMARILL,
  SPECIES_QUAGSIRE,
  SPECIES_LAPRAS,
  SPECIES_RELICANTH,
  SPECIES_OCTILLERY,
  SPECIES_MANTINE,
  SPECIES_PELIPPER,
  SPECIES_MASQUERAIN,
  SPECIES_WAILORD,
  SPECIES_GOREBYSS,
  SPECIES_SHARPEDO,
  SPECIES_SEALEO,
  SPECIES_HUNTAIL,
  SPECIES_WHISCASH,
  SPECIES_QWILFISH,
  SPECIES_CRAWDAUNT,
};

const u16 gGroup_WaterStage3[] =
{
  /*SIZE =*/29,
  SPECIES_GOLDUCK,
  SPECIES_POLIWRATH,
  SPECIES_TENTACRUEL,
  SPECIES_SLOWKING,
  SPECIES_DEWGONG,
  SPECIES_CLOYSTER,
  SPECIES_KINGLER,
  SPECIES_KINGDRA,
  SPECIES_SEAKING,
  SPECIES_STARMIE,
  SPECIES_GYARADOS,
  SPECIES_OMASTAR,
  SPECIES_LANTURN,
  SPECIES_AZUMARILL,
  SPECIES_QUAGSIRE,
  SPECIES_LAPRAS,
  SPECIES_RELICANTH,
  SPECIES_OCTILLERY,
  SPECIES_MANTINE,
  SPECIES_PELIPPER,
  SPECIES_MASQUERAIN,
  SPECIES_WAILORD,
  SPECIES_MILOTIC,
  SPECIES_SHARPEDO,
  SPECIES_WALREIN,
  SPECIES_HUNTAIL,
  SPECIES_WHISCASH,
  SPECIES_QWILFISH,
  SPECIES_CRAWDAUNT,
};

const u16 gGroup_IceStage1[] =
{
  /*SIZE =*/4,
  SPECIES_SEEL,
  SPECIES_SPHEAL,
  SPECIES_SWINUB,
  SPECIES_SNORUNT,
};

const u16 gGroup_IceStage2[] =
{
  /*SIZE =*/4,
  SPECIES_DEWGONG,
  SPECIES_SEALEO,
  SPECIES_PILOSWINE,
  SPECIES_GLALIE,
};

const u16 gGroup_ElectricStage1[] =
{
  /*SIZE =*/8,
  SPECIES_PIKACHU,
  SPECIES_MAGNEMITE,
  SPECIES_VOLTORB,
  SPECIES_ELEKID,
  SPECIES_MAREEP,
  SPECIES_ELECTRIKE,
  SPECIES_PLUSLE,
  SPECIES_MINUN,
};

const u16 gGroup_ElectricStage2[] =
{
  /*SIZE =*/6,
  SPECIES_RAICHU,
  SPECIES_MAGNETON,
  SPECIES_ELECTRODE,
  SPECIES_ELECTABUZZ,
  SPECIES_FLAAFFY,
  SPECIES_MANECTRIC,
};

const u16 gGroup_GhostStage1[] =
{
  /*SIZE =*/5,
  SPECIES_GASTLY,
  SPECIES_MISDREAVUS,
  SPECIES_DUSKULL,
  SPECIES_SHUPPET,
  SPECIES_SABLEYE,
};

const u16 gGroup_GhostStage2[] =
{
  /*SIZE =*/5,
  SPECIES_HAUNTER,
  SPECIES_MISDREAVUS,
  SPECIES_DUSCLOPS,
  SPECIES_BANETTE,
  SPECIES_SABLEYE,
};

const u16 gGroup_GhostStage3[] =
{
  /*SIZE =*/5,
  SPECIES_GENGAR,
  SPECIES_MISDREAVUS,
  SPECIES_DUSCLOPS,
  SPECIES_BANETTE,
  SPECIES_SABLEYE,
};

const u16 gGroup_MiscRare[] =
{
  /*SIZE =*/27,
  SPECIES_DITTO,
  SPECIES_EEVEE,
  SPECIES_LICKITUNG,
  SPECIES_CHANSEY,
  SPECIES_KANGASKHAN,
  SPECIES_TAUROS,
  SPECIES_PORYGON,
  SPECIES_AERODACTYL,
  SPECIES_DRATINI,
  SPECIES_MEW,
  SPECIES_SNEASEL,
  SPECIES_TEDDIURSA,
  SPECIES_STANTLER,
  SPECIES_MILTANK,
  SPECIES_TOGEPI,
  SPECIES_DELIBIRD,
  SPECIES_SKARMORY,
  SPECIES_LARVITAR,
  SPECIES_CELEBI,
  SPECIES_KECLEON,
  SPECIES_SWABLU,
  SPECIES_SLAKOTH,
  SPECIES_ABSOL,
  SPECIES_ZANGOOSE,
  SPECIES_CASTFORM,
  SPECIES_BAGON,
  SPECIES_JIRACHI,
};

const u16* const gMonGroups[] =
{
    [SPECIES_NONE] = NULL,

    [SPECIES_BULBASAUR] = gGroup_GrassStarterStage1,
    [SPECIES_IVYSAUR] = gGroup_GrassStarterStage2,
    [SPECIES_VENUSAUR] = gGroup_GrassStarterStage3,

    [SPECIES_CHARMANDER] = gGroup_FireStarterStage1,
    [SPECIES_CHARMELEON] = gGroup_FireStarterStage2,
    [SPECIES_CHARIZARD] = gGroup_FireStarterStage3,

    [SPECIES_SQUIRTLE] = gGroup_WaterStarterStage1,
    [SPECIES_WARTORTLE] = gGroup_WaterStarterStage2,
    [SPECIES_BLASTOISE] = gGroup_WaterStarterStage3,

    [SPECIES_CATERPIE] = gGroup_BugStage1,
    [SPECIES_METAPOD] = gGroup_BugStage2,
    [SPECIES_BUTTERFREE] = gGroup_BugStage3,

    [SPECIES_WEEDLE] = gGroup_BugStage1,
    [SPECIES_KAKUNA] = gGroup_BugStage2,
    [SPECIES_BEEDRILL] = gGroup_BugStage3,

    [SPECIES_PIDGEY] = gGroup_BirdStage1,
    [SPECIES_PIDGEOTTO] = gGroup_BirdStage2,
    [SPECIES_PIDGEOT] = gGroup_BirdStage3,

    [SPECIES_RATTATA] = gGroup_NormalStage1,
    [SPECIES_RATICATE] = gGroup_NormalStage2,

    [SPECIES_SPEAROW] = gGroup_BirdStage1,
    [SPECIES_FEAROW] = gGroup_BirdStage2,

    [SPECIES_EKANS] = gGroup_FirePoisonStage1,
    [SPECIES_ARBOK] = gGroup_FirePoisonStage2,

    // Pikachu doesn't map to the electric group in order to
    // give Viridian forest more variety. The power plant
    // wild rates have been tweaked to make sure that only
    // electric pokemon are catchable there.
    [SPECIES_PIKACHU] = gGroup_MtMoonPlusStage1,
    [SPECIES_RAICHU] = gGroup_ElectricStage2,

    [SPECIES_SANDSHREW] = gGroup_GroundRockStage1,
    [SPECIES_SANDSLASH] = gGroup_GroundRockStage2,

    [SPECIES_NIDORAN_F] = gGroup_GroundRockStage1,
    [SPECIES_NIDORINA] = gGroup_GroundRockStage2,
    [SPECIES_NIDOQUEEN] = gGroup_GroundRockStage3,

    [SPECIES_NIDORAN_M] = gGroup_GroundRockStage1,
    [SPECIES_NIDORINO] = gGroup_GroundRockStage2,
    [SPECIES_NIDOKING] = gGroup_GroundRockStage3,

    [SPECIES_CLEFAIRY] = gGroup_MtMoonPlusStage1,
    [SPECIES_CLEFABLE] = gGroup_MtMoonPlusStage2,

    [SPECIES_VULPIX] = gGroup_FirePoisonStage1,
    [SPECIES_NINETALES] = gGroup_FirePoisonStage2,

    [SPECIES_JIGGLYPUFF] = gGroup_MtMoonPlusStage1,
    [SPECIES_WIGGLYTUFF] = gGroup_MtMoonPlusStage2,

    [SPECIES_ZUBAT] = gGroup_MtMoonPlusStage1,
    [SPECIES_GOLBAT] = gGroup_MtMoonPlusStage2,

    [SPECIES_ODDISH] = gGroup_GrassBugGroup1,
    [SPECIES_GLOOM] = gGroup_GrassBugGroup2,
    [SPECIES_VILEPLUME] = gGroup_GrassBugStage3,

    [SPECIES_PARAS] = gGroup_MtMoonPlusStage1,
    [SPECIES_PARASECT] = gGroup_MtMoonPlusStage2,

    [SPECIES_VENONAT] = gGroup_GrassBugGroup1,
    [SPECIES_VENOMOTH] = gGroup_GrassBugGroup2,

    [SPECIES_DIGLETT] = gGroup_GroundRockStage1,
    [SPECIES_DUGTRIO] = gGroup_GroundRockStage2,

    [SPECIES_MEOWTH] = gGroup_NormalStage1,
    [SPECIES_PERSIAN] = gGroup_NormalStage2,

    [SPECIES_PSYDUCK] = gGroup_WaterStage1,
    [SPECIES_GOLDUCK] = gGroup_WaterStage2,

    [SPECIES_MANKEY] = gGroup_FightingPsychicStage1,
    [SPECIES_PRIMEAPE] = gGroup_FightingPsychicStage2,

    [SPECIES_GROWLITHE] = gGroup_FirePoisonStage1,
    [SPECIES_ARCANINE] = gGroup_FirePoisonStage2,

    [SPECIES_POLIWAG] = gGroup_WaterStage1,
    [SPECIES_POLIWHIRL] = gGroup_WaterStage2,
    [SPECIES_POLIWRATH] = gGroup_WaterStage3,

    [SPECIES_ABRA] = gGroup_RarePsychicStage1,
    [SPECIES_KADABRA] = gGroup_RarePsychicStage2,
    [SPECIES_ALAKAZAM] = gGroup_RarePsychicStage3,

    // Machamp is the only 3rd stage fighting
    // type, so it wasn't worth making a stage
    // 3 mapping for it.
    [SPECIES_MACHOP] = gGroup_FightingPsychicStage1,
    [SPECIES_MACHOKE] = gGroup_FightingPsychicStage2,
    [SPECIES_MACHAMP] = NULL,

    [SPECIES_BELLSPROUT] = gGroup_GrassBugGroup1,
    [SPECIES_WEEPINBELL] = gGroup_GrassBugGroup2,
    [SPECIES_VICTREEBEL] = gGroup_GrassBugStage3,

    [SPECIES_TENTACOOL] = gGroup_WaterStage1,
    [SPECIES_TENTACRUEL] = gGroup_WaterStage2,

    [SPECIES_GEODUDE] = gGroup_GroundRockStage1,
    [SPECIES_GRAVELER] = gGroup_GroundRockStage2,
    [SPECIES_GOLEM] = gGroup_GroundRockStage3,

    [SPECIES_PONYTA] = gGroup_FirePoisonStage1,
    [SPECIES_RAPIDASH] = gGroup_FirePoisonStage2,

    [SPECIES_SLOWPOKE] = gGroup_WaterStage1,
    [SPECIES_SLOWBRO] = gGroup_WaterStage2,

    [SPECIES_MAGNEMITE] = gGroup_ElectricStage1,
    [SPECIES_MAGNETON] = gGroup_ElectricStage2,

    [SPECIES_FARFETCHD] = gGroup_BirdStage1,

    [SPECIES_DODUO] = gGroup_BirdStage1,
    [SPECIES_DODRIO] = gGroup_BirdStage2,

    // Seel and Dewgong are in the Ice and Water
    // groups, but map to Ice.
    [SPECIES_SEEL] = gGroup_IceStage1,
    [SPECIES_DEWGONG] = gGroup_IceStage2,

    [SPECIES_GRIMER] = gGroup_FirePoisonStage1,
    [SPECIES_MUK] = gGroup_FirePoisonStage2,

    [SPECIES_SHELLDER] = gGroup_WaterStage1,
    [SPECIES_CLOYSTER] = gGroup_WaterStage2,

    // Ampharos is the only 3rd stage electric
    // type, so it wasn't worth making a stage
    // 3 mapping for it.
    [SPECIES_GASTLY] = gGroup_GhostStage1,
    [SPECIES_HAUNTER] = gGroup_GhostStage2,
    [SPECIES_GENGAR] = NULL,

    [SPECIES_ONIX] = gGroup_GroundRockStage1,

    [SPECIES_DROWZEE] = gGroup_FightingPsychicStage1,
    [SPECIES_HYPNO] = gGroup_FightingPsychicStage2,

    [SPECIES_KRABBY] = gGroup_WaterStage1,
    [SPECIES_KINGLER] = gGroup_WaterStage2,

    [SPECIES_VOLTORB] = gGroup_ElectricStage1,
    [SPECIES_ELECTRODE] = gGroup_ElectricStage2,

    [SPECIES_EXEGGCUTE] = gGroup_FightingPsychicStage1,
    [SPECIES_EXEGGUTOR] = gGroup_FightingPsychicStage2,

    [SPECIES_CUBONE] = gGroup_GroundRockStage1,
    [SPECIES_MAROWAK] = gGroup_GroundRockStage2,

    [SPECIES_HITMONLEE] = NULL,
    [SPECIES_HITMONCHAN] = NULL,

    // In gGroup_MiscRare.
    [SPECIES_LICKITUNG] = NULL,

    [SPECIES_KOFFING] = gGroup_FirePoisonStage1,
    [SPECIES_WEEZING] = gGroup_FirePoisonStage2,

    [SPECIES_RHYHORN] = gGroup_GroundRockStage1,
    [SPECIES_RHYDON] = gGroup_GroundRockStage2,

    // In gGroup_MiscRare.
    [SPECIES_CHANSEY] = NULL,

    [SPECIES_TANGELA] = gGroup_GrassBugGroup1,

    // In gGroup_MiscRare.
    [SPECIES_KANGASKHAN] = NULL,

    [SPECIES_HORSEA] = gGroup_WaterStage1,
    [SPECIES_SEADRA] = gGroup_WaterStage2,

    [SPECIES_GOLDEEN] = gGroup_WaterStage1,
    [SPECIES_SEAKING] = gGroup_WaterStage2,

    [SPECIES_STARYU] = gGroup_WaterStage1,
    [SPECIES_STARMIE] = gGroup_WaterStage2,

    // Maps to stage 2 due to relatively high base
    // stat total.
    [SPECIES_MR_MIME] = gGroup_RarePsychicStage2,

    [SPECIES_SCYTHER] = gGroup_GrassBugGroup1,

    [SPECIES_JYNX] = gGroup_RarePsychicStage2,

    [SPECIES_ELECTABUZZ] = gGroup_ElectricStage2,

    [SPECIES_MAGMAR] = gGroup_FirePoisonStage2,

    [SPECIES_PINSIR] = gGroup_GrassBugGroup1,

    // In gGroup_MiscRare.
    [SPECIES_TAUROS] = NULL,

    // Magikarp maps to stage 1, and isn't
    // in stage 2 to give Politoad a spot.
    // Gyarados maps to group 3 only due to
    // base stat total / move pool.
    [SPECIES_MAGIKARP] = gGroup_WaterStage1,
    [SPECIES_GYARADOS] = gGroup_WaterStage3,

    // Lapras replaces Luvdisc in stage 2
    [SPECIES_LAPRAS] = gGroup_WaterStage2,

    // In gGroup_MiscRare, but maps to fighting/psychic
    // because Ditto isn't good competitively.
    [SPECIES_DITTO] = gGroup_FightingPsychicStage1,

    // Eevee is in gGroup_MiscRare.
    [SPECIES_EEVEE] = NULL,
    [SPECIES_VAPOREON] = NULL,
    [SPECIES_JOLTEON] = NULL,
    [SPECIES_FLAREON] = NULL,

    // In gGroup_MiscRare.
    [SPECIES_PORYGON] = NULL,

    [SPECIES_OMANYTE] = gGroup_WaterStage1,
    [SPECIES_OMASTAR] = gGroup_WaterStage2,

    [SPECIES_KABUTO] = gGroup_MtMoonPlusStage1,
    [SPECIES_KABUTOPS] = gGroup_MtMoonPlusStage2,

    // In gGroup_MiscRare.
    [SPECIES_AERODACTYL] = NULL,

    // Only catchable via overworld event.
    [SPECIES_SNORLAX] = NULL,
    [SPECIES_ARTICUNO] = NULL,
    [SPECIES_ZAPDOS] = NULL,
    [SPECIES_MOLTRES] = NULL,

    // In gGroup_MiscRare.
    [SPECIES_DRATINI] = NULL,
    [SPECIES_DRAGONAIR] = NULL,
    [SPECIES_DRAGONITE] = NULL,

    // Only catchable via overworld event.
    [SPECIES_MEWTWO] = NULL,

    // In gGroup_MiscRare.
    [SPECIES_MEW] = NULL,

    [SPECIES_CHIKORITA] = gGroup_GrassStarterStage1,
    [SPECIES_BAYLEEF] = gGroup_GrassStarterStage2,
    [SPECIES_MEGANIUM] = gGroup_GrassStarterStage3,

    [SPECIES_CYNDAQUIL] = gGroup_FireStarterStage1,
    [SPECIES_QUILAVA] = gGroup_FireStarterStage2,
    [SPECIES_TYPHLOSION] = gGroup_FireStarterStage3,

    [SPECIES_TOTODILE] = gGroup_WaterStarterStage1,
    [SPECIES_CROCONAW] = gGroup_WaterStarterStage2,
    [SPECIES_FERALIGATR] = gGroup_WaterStarterStage3,

    [SPECIES_SENTRET] = gGroup_NormalStage1,
    [SPECIES_FURRET] = gGroup_NormalStage2,

    [SPECIES_HOOTHOOT] = gGroup_BirdStage1,
    [SPECIES_NOCTOWL] = gGroup_BirdStage2,

    [SPECIES_LEDYBA] = gGroup_BugStage1,
    [SPECIES_LEDIAN] = gGroup_BugStage2,

    [SPECIES_SPINARAK] = gGroup_BugStage1,
    [SPECIES_ARIADOS] = gGroup_BugStage2,

    // Not catchable in the wild.
    [SPECIES_CROBAT] = NULL,

    [SPECIES_CHINCHOU] = gGroup_WaterStage1,
    [SPECIES_LANTURN] = gGroup_WaterStage2,

    // Pre-evolutions that evolve via happiness
    // aren't emphasized, because this romhack
    // is for timed challenges.
    [SPECIES_PICHU] = NULL,
    [SPECIES_CLEFFA] = NULL,
    [SPECIES_IGGLYBUFF] = NULL,

    // Togepi is in gGroup_MiscRare.
    [SPECIES_TOGEPI] = NULL,
    [SPECIES_TOGETIC] = NULL,

    [SPECIES_NATU] = gGroup_FightingPsychicStage1,
    [SPECIES_XATU] = gGroup_FightingPsychicStage2,

    // Ampharos is the only 3rd stage electric
    // type, so it wasn't worth making a stage
    // 3 mapping for it.
    [SPECIES_MAREEP] = gGroup_ElectricStage1,
    [SPECIES_FLAAFFY] = gGroup_ElectricStage2,
    [SPECIES_AMPHAROS] = NULL,

    // Bellossom replaces Roselia in stage 3.
    [SPECIES_BELLOSSOM] = gGroup_GrassBugStage3,

    [SPECIES_MARILL] = gGroup_WaterStage1,
    [SPECIES_AZUMARILL] = gGroup_WaterStage2,

    [SPECIES_SUDOWOODO] = gGroup_GroundRockStage1,

    // Politoad takes Magikarp's spot in stage 2.
    [SPECIES_POLITOED] = gGroup_WaterStage2,

    [SPECIES_HOPPIP] = gGroup_GrassBugGroup1,
    [SPECIES_SKIPLOOM] = gGroup_GrassBugGroup2,
    [SPECIES_JUMPLUFF] = gGroup_GrassBugStage3,

    // Aipom is in the fighting group because it
    // kind of looks like Mankey.
    [SPECIES_AIPOM] = gGroup_FightingPsychicStage1,

    [SPECIES_SUNKERN] = gGroup_GrassBugGroup1,
    [SPECIES_SUNFLORA] = gGroup_GrassBugGroup2,

    // Yanma is replaced with Volbeat/Illumise
    // in later stages.
    [SPECIES_YANMA] = gGroup_BugStage1,

    [SPECIES_WOOPER] = gGroup_WaterStage1,
    [SPECIES_QUAGSIRE] = gGroup_WaterStage2,

    // Not catchable in the wild.
    [SPECIES_ESPEON] = NULL,
    [SPECIES_UMBREON] = NULL,

    [SPECIES_MURKROW] = gGroup_MtMoonPlusStage1,

    [SPECIES_SLOWKING] = gGroup_WaterStage3,

    [SPECIES_MISDREAVUS] = gGroup_GhostStage1,

    // Not catchable in the wild.
    [SPECIES_UNOWN] = NULL,

    [SPECIES_WOBBUFFET] = gGroup_FightingPsychicStage2,

    [SPECIES_GIRAFARIG] = gGroup_FightingPsychicStage1,

    // Forretress maps to stage 3 because of
    // relative power.
    [SPECIES_PINECO] = gGroup_GrassBugGroup1,
    [SPECIES_FORRETRESS] = gGroup_GrassBugStage3,

    [SPECIES_DUNSPARCE] = gGroup_MtMoonPlusStage1,

    [SPECIES_GLIGAR] = gGroup_GroundRockStage1,

    [SPECIES_STEELIX] = gGroup_GroundRockStage2,

    [SPECIES_SNUBBULL] = gGroup_MtMoonPlusStage1,
    [SPECIES_GRANBULL] = gGroup_MtMoonPlusStage2,

    [SPECIES_QWILFISH] = gGroup_WaterStage1,

    // Forretress maps to stage 3 because of
    // relative power.
    [SPECIES_SCIZOR] = gGroup_GrassBugStage3,

    [SPECIES_SHUCKLE] = gGroup_MtMoonPlusStage1,

    [SPECIES_HERACROSS] = gGroup_GrassBugGroup1,

    // In gGroup_MiscRare.
    [SPECIES_SNEASEL] = NULL,

    // Teddiursa is in gGroup_MiscRare.
    [SPECIES_TEDDIURSA] = NULL,
    [SPECIES_URSARING] = NULL,

    [SPECIES_SLUGMA] = gGroup_FirePoisonStage1,
    [SPECIES_MAGCARGO] = gGroup_FirePoisonStage2,

    [SPECIES_SWINUB] = gGroup_IceStage1,
    [SPECIES_PILOSWINE] = gGroup_IceStage2,

    // Corsola is replaced in later stages.
    [SPECIES_CORSOLA] = gGroup_WaterStage1,


    [SPECIES_REMORAID] = gGroup_WaterStage1,
    [SPECIES_OCTILLERY] = gGroup_WaterStage2,

    // In gGroup_MiscRare.
    [SPECIES_DELIBIRD] = NULL,

    [SPECIES_MANTINE] = gGroup_WaterStage1,

    // In gGroup_MiscRare.
    [SPECIES_SKARMORY] = gGroup_MiscRare,

    [SPECIES_HOUNDOUR] = gGroup_FirePoisonStage1,
    [SPECIES_HOUNDOOM] = gGroup_FirePoisonStage2,

    [SPECIES_KINGDRA] = gGroup_WaterStage3,

    [SPECIES_PHANPY] = gGroup_GroundRockStage1,
    [SPECIES_DONPHAN] = gGroup_GroundRockStage2,

    // Not catchable in the wild.
    [SPECIES_PORYGON2] = NULL,

    // In gGroup_MiscRare.
    [SPECIES_STANTLER] = NULL,
    [SPECIES_SMEARGLE] = NULL,

    [SPECIES_TYROGUE] = gGroup_FightingPsychicStage1,

    [SPECIES_HITMONTOP] = gGroup_FightingPsychicStage2,

    [SPECIES_SMOOCHUM] = gGroup_RarePsychicStage1,

    [SPECIES_ELEKID] = gGroup_ElectricStage1,

    [SPECIES_MAGBY] = gGroup_FirePoisonStage1,

    // In gGroup_MiscRare.
    [SPECIES_MILTANK] = NULL,

    // Not catchable in the wild.
    [SPECIES_BLISSEY] = NULL,
    [SPECIES_RAIKOU] = NULL,
    [SPECIES_ENTEI] = NULL,
    [SPECIES_SUICUNE] = NULL,

    // Larvitar is in gGroup_MiscRare.
    [SPECIES_LARVITAR] = NULL,
    [SPECIES_PUPITAR] = NULL,
    [SPECIES_TYRANITAR] = NULL,

    // Not catchable in the wild.
    [SPECIES_LUGIA] = NULL,
    [SPECIES_HO_OH] = NULL,

    // In gGroup_MiscRare.
    [SPECIES_CELEBI] = NULL,

    // Not catchable in the wild.
    [SPECIES_OLD_UNOWN_B] = NULL,
    [SPECIES_OLD_UNOWN_C] = NULL,
    [SPECIES_OLD_UNOWN_D] = NULL,
    [SPECIES_OLD_UNOWN_E] = NULL,
    [SPECIES_OLD_UNOWN_F] = NULL,
    [SPECIES_OLD_UNOWN_G] = NULL,
    [SPECIES_OLD_UNOWN_H] = NULL,
    [SPECIES_OLD_UNOWN_I] = NULL,
    [SPECIES_OLD_UNOWN_J] = NULL,
    [SPECIES_OLD_UNOWN_K] = NULL,
    [SPECIES_OLD_UNOWN_L] = NULL,
    [SPECIES_OLD_UNOWN_M] = NULL,
    [SPECIES_OLD_UNOWN_N] = NULL,
    [SPECIES_OLD_UNOWN_O] = NULL,
    [SPECIES_OLD_UNOWN_P] = NULL,
    [SPECIES_OLD_UNOWN_Q] = NULL,
    [SPECIES_OLD_UNOWN_R] = NULL,
    [SPECIES_OLD_UNOWN_S] = NULL,
    [SPECIES_OLD_UNOWN_T] = NULL,
    [SPECIES_OLD_UNOWN_U] = NULL,
    [SPECIES_OLD_UNOWN_V] = NULL,
    [SPECIES_OLD_UNOWN_W] = NULL,
    [SPECIES_OLD_UNOWN_X] = NULL,
    [SPECIES_OLD_UNOWN_Y] = NULL,
    [SPECIES_OLD_UNOWN_Z] = NULL,

    [SPECIES_TREECKO] = gGroup_GrassStarterStage1,
    [SPECIES_GROVYLE] = gGroup_GrassStarterStage2,
    [SPECIES_SCEPTILE] = gGroup_GrassStarterStage3,

    [SPECIES_TORCHIC] = gGroup_FireStarterStage1,
    [SPECIES_COMBUSKEN] = gGroup_FireStarterStage2,
    [SPECIES_BLAZIKEN] = gGroup_FireStarterStage3,

    [SPECIES_MUDKIP] = gGroup_WaterStarterStage1,
    [SPECIES_MARSHTOMP] = gGroup_WaterStarterStage2,
    [SPECIES_SWAMPERT] = gGroup_WaterStarterStage3,

    [SPECIES_POOCHYENA] = gGroup_NormalStage1,
    [SPECIES_MIGHTYENA] = gGroup_NormalStage2,

    [SPECIES_ZIGZAGOON] = gGroup_NormalStage1,
    [SPECIES_LINOONE] = gGroup_NormalStage2,

    // TODO(alecshearer): Double check if it
    // makes sense for Wurple to be in stage 1
    // twice.
    [SPECIES_WURMPLE] = gGroup_BugStage1,
    [SPECIES_SILCOON] = gGroup_BugStage2,
    [SPECIES_BEAUTIFLY] = gGroup_BugStage3,
    [SPECIES_CASCOON] = gGroup_BugStage3,
    [SPECIES_DUSTOX] = gGroup_BugStage3,

    [SPECIES_LOTAD] = gGroup_GrassBugGroup1,
    [SPECIES_LOMBRE] = gGroup_GrassBugGroup2,
    [SPECIES_LUDICOLO] = gGroup_GrassBugStage3,

    [SPECIES_SEEDOT] = gGroup_GrassBugGroup1,
    [SPECIES_NUZLEAF] = gGroup_GrassBugGroup2,
    [SPECIES_SHIFTRY] = gGroup_GrassBugStage3,

    // Shedinja is in gGroup_MiscRare.
    [SPECIES_NINCADA] = gGroup_MtMoonPlusStage1,
    [SPECIES_NINJASK] = gGroup_MtMoonPlusStage2,
    [SPECIES_SHEDINJA] = NULL,

    [SPECIES_TAILLOW] = gGroup_BirdStage1,
    [SPECIES_SWELLOW] = gGroup_BirdStage2,

    [SPECIES_SHROOMISH] = gGroup_GrassBugGroup1,
    [SPECIES_BRELOOM] = gGroup_GrassBugGroup2,

    [SPECIES_SPINDA] = gGroup_MtMoonPlusStage1,

    [SPECIES_WINGULL] = gGroup_WaterStage1,
    [SPECIES_PELIPPER] = gGroup_WaterStage2,

    [SPECIES_SURSKIT] = gGroup_WaterStage1,
    [SPECIES_MASQUERAIN] = gGroup_WaterStage2,

    [SPECIES_WAILMER] = gGroup_WaterStage1,
    [SPECIES_WAILORD] = gGroup_WaterStage2,

    [SPECIES_SKITTY] = gGroup_NormalStage1,
    [SPECIES_DELCATTY] = gGroup_NormalStage2,

    // In gGroup_MiscRare.
    [SPECIES_KECLEON] = NULL,

    [SPECIES_BALTOY] = gGroup_GroundRockStage1,
    [SPECIES_CLAYDOL] = gGroup_GroundRockStage2,

    [SPECIES_NOSEPASS] = gGroup_GroundRockStage1,

    [SPECIES_TORKOAL] = gGroup_FirePoisonStage1,

    [SPECIES_SABLEYE] = gGroup_GhostStage1,

    [SPECIES_BARBOACH] = gGroup_WaterStage1,
    [SPECIES_WHISCASH] = gGroup_WaterStage2,

    // Luvdisc is replaced in later stages.
    [SPECIES_LUVDISC] = gGroup_WaterStage1,

    [SPECIES_CORPHISH] = gGroup_WaterStage1,
    [SPECIES_CRAWDAUNT] = gGroup_WaterStage2,

    // Gorebyss replaces Feebas in stage 2.
    // Milotic is in stage 3 due to rarity.
    [SPECIES_FEEBAS] = gGroup_WaterStage1,
    [SPECIES_MILOTIC] = gGroup_WaterStage3,

    [SPECIES_CARVANHA] = gGroup_WaterStage1,
    [SPECIES_SHARPEDO] = gGroup_WaterStage2,

    [SPECIES_TRAPINCH] = gGroup_GroundRockStage1,
    [SPECIES_VIBRAVA] = gGroup_GroundRockStage2,
    [SPECIES_FLYGON] = gGroup_GroundRockStage3,

    [SPECIES_MAKUHITA] = gGroup_FightingPsychicStage1,
    [SPECIES_HARIYAMA] = gGroup_FightingPsychicStage2,

    [SPECIES_ELECTRIKE] = gGroup_ElectricStage1,
    [SPECIES_MANECTRIC] = gGroup_ElectricStage2,

    [SPECIES_NUMEL] = gGroup_FirePoisonStage1,
    [SPECIES_CAMERUPT] = gGroup_FirePoisonStage2,

    // Like Seel and Dewgong, Spheal and co. are
    // in the Ice and Water groups, but map to Ice.
    //
    // Walrein is the only 3rd stage ice type, so
    // it wasn't worth making a stage.
    [SPECIES_SPHEAL] = gGroup_IceStage1,
    [SPECIES_SEALEO] = gGroup_IceStage2,
    [SPECIES_WALREIN] = NULL,

    [SPECIES_CACNEA] = gGroup_GrassBugGroup1,
    [SPECIES_CACTURNE] = gGroup_GrassBugGroup2,

    [SPECIES_SNORUNT] = gGroup_IceStage1,
    [SPECIES_GLALIE] = gGroup_IceStage2,

    [SPECIES_LUNATONE] = gGroup_GroundRockStage1,

    [SPECIES_SOLROCK] = gGroup_FightingPsychicStage1,

    // Pre-evolutions that evolve via happiness
    // aren't emphasized, because this romhack
    // is for timed challenges.
    [SPECIES_AZURILL] = NULL,

    [SPECIES_SPOINK] = gGroup_FightingPsychicStage1,
    [SPECIES_GRUMPIG] = gGroup_FightingPsychicStage2,

    [SPECIES_PLUSLE] = gGroup_ElectricStage1,

    [SPECIES_MINUN] = gGroup_ElectricStage2,

    [SPECIES_MAWILE] = gGroup_MtMoonPlusStage1,

    [SPECIES_MEDITITE] = gGroup_FightingPsychicStage1,
    [SPECIES_MEDICHAM] = gGroup_FightingPsychicStage2,

    // Swablu is in gGroup_MiscRare.
    [SPECIES_SWABLU] = NULL,
    [SPECIES_ALTARIA] = NULL,

    [SPECIES_WYNAUT] = gGroup_FightingPsychicStage1,

    [SPECIES_DUSKULL] = gGroup_GhostStage1,
    [SPECIES_DUSCLOPS] = gGroup_GhostStage2,

    // Roselia is replaced in stage 3 by Bellossom.
    [SPECIES_ROSELIA] = gGroup_GrassBugStage3,

    // Slakoth is in gGroup_MiscRare.
    [SPECIES_SLAKOTH] = NULL,
    [SPECIES_VIGOROTH] = NULL,
    [SPECIES_SLAKING] = NULL,

    [SPECIES_GULPIN] = gGroup_FirePoisonStage1,
    [SPECIES_SWALOT] = gGroup_FirePoisonStage2,

    [SPECIES_TROPIUS] = gGroup_GrassBugGroup1,

    // Exploud is the only 3rd stage normal
    // type, so it wasn't worth making a stage
    // 3 mapping for it.
    [SPECIES_WHISMUR] = gGroup_NormalStage1,
    [SPECIES_LOUDRED] = gGroup_NormalStage2,
    [SPECIES_EXPLOUD] = NULL,

    // Gorebyss is only in stage 2.
    [SPECIES_CLAMPERL] = gGroup_WaterStage1,
    [SPECIES_HUNTAIL] = gGroup_WaterStage2,
    [SPECIES_GOREBYSS] = gGroup_WaterStage2,

    // In gGroup_MiscRare.
    [SPECIES_ABSOL] = NULL,

    [SPECIES_SHUPPET] = gGroup_GhostStage1,
    [SPECIES_BANETTE] = gGroup_GhostStage2,

    [SPECIES_SEVIPER] = gGroup_FirePoisonStage1,

    // In gGroup_MiscRare.
    [SPECIES_ZANGOOSE] = NULL,

    // Relicanth replaces Corsola in stages 2 and 3.
    [SPECIES_RELICANTH] = gGroup_WaterStage2,

    [SPECIES_ARON] = gGroup_GroundRockStage1,
    [SPECIES_LAIRON] = gGroup_GroundRockStage2,
    [SPECIES_AGGRON] = gGroup_GroundRockStage3,

    // In gGroup_MiscRare.
    [SPECIES_CASTFORM] = NULL,

    [SPECIES_VOLBEAT] = gGroup_BugStage2,

    [SPECIES_ILLUMISE] = gGroup_BugStage3,

    // Cradily is in stage 3 because of rarity.
    [SPECIES_LILEEP] = gGroup_GrassBugGroup1,
    [SPECIES_CRADILY] = gGroup_GrassBugStage3,

    // Cradily is in stage 3 because of rarity.
    [SPECIES_ANORITH] = gGroup_GrassBugGroup1,
    [SPECIES_ARMALDO] = gGroup_GrassBugStage3,

    [SPECIES_RALTS] = gGroup_RarePsychicStage1,
    [SPECIES_KIRLIA] = gGroup_RarePsychicStage2,
    [SPECIES_GARDEVOIR] = gGroup_RarePsychicStage3,

    // Bagon is in gGroup_MiscRare.
    [SPECIES_BAGON] = NULL,
    [SPECIES_SHELGON] = NULL,
    [SPECIES_SALAMENCE] = NULL,

    [SPECIES_BELDUM] = gGroup_RarePsychicStage1,
    [SPECIES_METANG] = gGroup_RarePsychicStage2,
    [SPECIES_METAGROSS] = gGroup_RarePsychicStage3,

    // Not catchable in the wild.
    [SPECIES_REGIROCK] = NULL,
    [SPECIES_REGICE] = NULL,
    [SPECIES_REGISTEEL] = NULL,
    [SPECIES_KYOGRE] = NULL,
    [SPECIES_GROUDON] = NULL,
    [SPECIES_RAYQUAZA] = NULL,
    [SPECIES_LATIAS] = NULL,
    [SPECIES_LATIOS] = NULL,

    // In gGroup_MiscRare.
    [SPECIES_JIRACHI] = NULL,

    // Not catchable in the wild.
    [SPECIES_DEOXYS] = NULL,

    [SPECIES_CHIMECHO] = gGroup_FightingPsychicStage1,

    // Not catchable in the wild.
    [SPECIES_EGG] = NULL,
    [SPECIES_UNOWN_B] = NULL,
    [SPECIES_UNOWN_C] = NULL,
    [SPECIES_UNOWN_D] = NULL,
    [SPECIES_UNOWN_E] = NULL,
    [SPECIES_UNOWN_F] = NULL,
    [SPECIES_UNOWN_G] = NULL,
    [SPECIES_UNOWN_H] = NULL,
    [SPECIES_UNOWN_I] = NULL,
    [SPECIES_UNOWN_J] = NULL,
    [SPECIES_UNOWN_K] = NULL,
    [SPECIES_UNOWN_L] = NULL,
    [SPECIES_UNOWN_M] = NULL,
    [SPECIES_UNOWN_N] = NULL,
    [SPECIES_UNOWN_O] = NULL,
    [SPECIES_UNOWN_P] = NULL,
    [SPECIES_UNOWN_Q] = NULL,
    [SPECIES_UNOWN_R] = NULL,
    [SPECIES_UNOWN_S] = NULL,
    [SPECIES_UNOWN_T] = NULL,
    [SPECIES_UNOWN_U] = NULL,
    [SPECIES_UNOWN_V] = NULL,
    [SPECIES_UNOWN_W] = NULL,
    [SPECIES_UNOWN_X] = NULL,
    [SPECIES_UNOWN_Y] = NULL,
    [SPECIES_UNOWN_Z] = NULL,
    [SPECIES_UNOWN_EMARK] = NULL,
    [SPECIES_UNOWN_QMARK] = NULL,
};

// https://stackoverflow.com/questions/2351087/what-is-the-best-32bit-hash-function-for-short-strings-tag-names
u32 Hash(const u8 *str)
{
  s8 i;
  u32 h = str[0];
  for (i = 1; str[i] + str[i-1]; ++i) {
    h = 37 * h + str[i];
  }
  return h;
}

// https://stackoverflow.com/questions/2590677/how-do-i-combine-hash-values-in-c0x.
// See also https://github.com/HowardHinnant/hash_append/issues/7
u32 HashCombine(u32 h1, u32 h2)
{
  return h1 ^ (h2 + 0x9e3779b9 + (h1 << 6) + (h1 >> 2));
}

u16 IndexInto(const u16 *group, u32 hash) {
  // group[0] has the group size.
  return group[(hash % group[0]) + 1];
}

u16 GameHash() {
  static u64 gGameHash;
  if (gGameHash == 0) {
    gGameHash = Hash(gSaveBlock1Ptr->rivalName);
  }
  return gGameHash;
}

u16 MapHash() {
  static u64 gMapHash;
  static u8 gLastRegionMapSectionId;
  if (gLastRegionMapSectionId != gMapHeader.regionMapSectionId) {
    u8 mapName[32];
    memset(mapName, 0, 32);
    GetMapNameGeneric(mapName, gMapHeader.regionMapSectionId);
    gMapHash = Hash(mapName);
    gLastRegionMapSectionId = gMapHeader.regionMapSectionId;
  }
  return gMapHash;
}

u16 GetSpeciesFromGroup(u16 species, u16 manual_random) {
  const u16 *group;
  s8 random;
  u64 combinedHash;

  if (species >= sizeof(gMonGroups) || gMonGroups[species] == NULL) {
    return species;
  }

  group = gMonGroups[species];

  // If this is a starter, just use the game hash.
  if ((group == gGroup_GrassStarterStage1) ||
      (group == gGroup_GrassStarterStage2) ||
      (group == gGroup_GrassStarterStage3) ||
      (group == gGroup_FireStarterStage1) ||
      (group == gGroup_FireStarterStage2) ||
      (group == gGroup_FireStarterStage3) ||
      (group == gGroup_WaterStarterStage1) ||
      (group == gGroup_WaterStarterStage2) ||
      (group == gGroup_WaterStarterStage3)) {
    // Int divide by 3 to preserve evolution chain.
    //
    // Don't take route into account, so that rival
    // has the same starter throughout the game.
    gSpeciesNames[(species + 2) / 3];

    // combinedHash = HashCombine(GameHash(), (species + 2) / 3 * 31);
    combinedHash = HashCombine(GameHash(), Hash(gSpeciesNames[(species + 2) / 3]));
    return IndexInto(group, combinedHash);
  }

  if (random == 0) {
    // 2% chance that the player found the "rare" species
    // that is unique to the current route. We overwrite
    // `group` and ignore `species`.
    group = gGroup_MiscRare;
    combinedHash = HashCombine(GameHash(), MapHash());
  } else if (random <= 17) {
    // 34% chance the player found the less-common mapping
    // to `species`.
    combinedHash = HashCombine(GameHash(), MapHash() + species);
  } else {
    // 64% chance the player found the more-common mapping
    // to `species`.
    combinedHash = HashCombine(MapHash() , GameHash() - species);
  }

  return IndexInto(group, combinedHash);
}

