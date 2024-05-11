// Trainer party data exists for all of the RS trainer classes, but
// are only filled with one of the following placeholder pokemon.
// The actual FRLG trainer party data starts after these.
#define DUMMY_TRAINER_MON           \
    {                               \
        .lvl = 5,                   \
        .species = SPECIES_EKANS,   \
    }

#define DUMMY_TRAINER_MON_IV        \
    {                               \
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),                  \
        .lvl = 5,                   \
        .species = SPECIES_EKANS,   \
    }

// Copy of Swimmer Male Finn's party
#define DUMMY_TRAINER_STARMIE       \
    {                               \
        .lvl = 38,                  \
        .species = SPECIES_STARMIE, \
    }

static const struct TrainerMon sParty_AquaLeader[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_AquaGruntM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_AquaGruntF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSAromaLady[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSRuinManiac[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_Interviewer[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSTuberF[] = {DUMMY_TRAINER_STARMIE};
static const struct TrainerMon sParty_RSTuberM[] = {DUMMY_TRAINER_STARMIE};
static const struct TrainerMon sParty_RSCooltrainerM[] = {DUMMY_TRAINER_MON_IV};
static const struct TrainerMon sParty_RSCooltrainerF[] = {DUMMY_TRAINER_MON_IV};
static const struct TrainerMon sParty_HexManiac[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSLady[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSBeauty[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RichBoy[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSPokemaniac[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSSwimmerM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSBlackBelt[] = {DUMMY_TRAINER_MON_IV};
static const struct TrainerMon sParty_Guitarist[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_Kindler[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSCamper[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BugManiac[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSPsychicM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSPsychicF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSGentleman[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_EliteFourSidney[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_EliteFourPhoebe[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderRoxanne[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderBrawly[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderTateLiza[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_SchoolKidM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_SchoolKidF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_SrAndJr[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_PokefanM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_PokefanF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_ExpertM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_ExpertF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSYoungster[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSChampion[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSFisherman[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_CyclingTriathleteM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_CyclingTriathleteF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RunningTriathleteM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RunningTriathleteF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_SwimmingTriathleteM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_SwimmingTriathleteF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_DragonTamer[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSBirdKeeper[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_NinjaBoy[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BattleGirl[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_ParasolLady[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSSwimmerF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSPicnicker[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSTwins[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSSailor[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BoarderM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BoarderF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_Collector[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_Wally[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_Brendan[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_Brendan2[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_Brendan3[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_May[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_May2[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_May3[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSPkmnBreederM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSPkmnBreederF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSPkmnRangerM[] = {DUMMY_TRAINER_MON_IV};
static const struct TrainerMon sParty_RSPkmnRangerF[] = {DUMMY_TRAINER_MON_IV};
static const struct TrainerMon sParty_MagmaLeader[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_MagmaGruntM[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_MagmaGruntF[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSLass[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSBugCatcher[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSHiker[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSYoungCouple[] = {DUMMY_TRAINER_MON, DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_OldCouple[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_RSSisAndBro[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_AquaAdminMatt[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_AquaAdminShelly[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_MagmaAdminTabitha[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_MagmaAdminCourtney[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderWattson[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderFlannery[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderNorman[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderWinona[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_LeaderWallace[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_EliteFourGlacia[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_EliteFourDrake[] = {DUMMY_TRAINER_MON};

// Start of actual trainer data
static const struct TrainerMon sParty_YoungsterBen[] = {
    {
        .lvl = 11,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 11,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_YoungsterCalvin[] = {
    {
        .lvl = 14,
        .species = SPECIES_SPEAROW,
    },
};

static const struct TrainerMon sParty_YoungsterJosh[] = {
    {
        .lvl = 10,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 10,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 10,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_YoungsterTimmy[] = {
    {
        .lvl = 14,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 14,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_YoungsterJoey[] = {
    {
        .lvl = 15,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 15,
        .species = SPECIES_SPEAROW,
    },
};

static const struct TrainerMon sParty_YoungsterDan[] = {
    {
        .lvl = 17,
        .species = SPECIES_SLOWPOKE,
    },
};

static const struct TrainerMon sParty_YoungsterChad[] = {
    {
        .lvl = 14,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 14,
        .species = SPECIES_SANDSHREW,
    },
};

static const struct TrainerMon sParty_YoungsterTyler[] = {
    {
        .lvl = 21,
        .species = SPECIES_NIDORAN_M,
    },
};

static const struct TrainerMon sParty_YoungsterEddie[] = {
    {
        .lvl = 21,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_YoungsterDillon[] = {
    {
        .lvl = 19,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 19,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_YoungsterYasu[] = {
    {
        .lvl = 17,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 17,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 17,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_YoungsterDave[] = {
    {
        .lvl = 18,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 18,
        .species = SPECIES_NIDORINO,
    },
};

static const struct TrainerMon sParty_YoungsterBen2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 17,
        .species = SPECIES_RATTATA,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 17,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_BugCatcherRick[] = {
    {
        .lvl = 6,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 6,
        .species = SPECIES_CATERPIE,
    },
};

static const struct TrainerMon sParty_BugCatcherDoug[] = {
    {
        .lvl = 7,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 7,
        .species = SPECIES_KAKUNA,
    },
    {
        .lvl = 7,
        .species = SPECIES_WEEDLE,
    },
};

static const struct TrainerMon sParty_BugCatcherSammy[] = {
    {
        .lvl = 9,
        .species = SPECIES_WEEDLE,
    },
};

static const struct TrainerMon sParty_BugCatcherColton[] = {
    {
        .lvl = 10,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 10,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 10,
        .species = SPECIES_CATERPIE,
    },
};

static const struct TrainerMon sParty_BugCatcherGreg[] = {
    {
        .lvl = 9,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 9,
        .species = SPECIES_KAKUNA,
    },
    {
        .lvl = 9,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 9,
        .species = SPECIES_METAPOD,
    },
};

static const struct TrainerMon sParty_BugCatcherJames[] = {
    {
        .lvl = 11,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 11,
        .species = SPECIES_METAPOD,
    },
};

static const struct TrainerMon sParty_BugCatcherKent[] = {
    {
        .lvl = 11,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 11,
        .species = SPECIES_KAKUNA,
    },
};

static const struct TrainerMon sParty_BugCatcherRobby[] = {
    {
        .lvl = 10,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 10,
        .species = SPECIES_METAPOD,
    },
    {
        .lvl = 10,
        .species = SPECIES_CATERPIE,
    },
};

static const struct TrainerMon sParty_BugCatcherCale[] = {
    {
        .lvl = 10,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 10,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 10,
        .species = SPECIES_METAPOD,
    },
    {
        .lvl = 10,
        .species = SPECIES_KAKUNA,
    },
};

static const struct TrainerMon sParty_BugCatcherKeigo[] = {
    {
        .lvl = 16,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 16,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 16,
        .species = SPECIES_WEEDLE,
    },
};

static const struct TrainerMon sParty_BugCatcherElijah[] = {
    {
        .lvl = 20,
        .species = SPECIES_BUTTERFREE,
    },
};

static const struct TrainerMon sParty_BugCatcher2[] = {
    {
        .lvl = 18,
        .species = SPECIES_METAPOD,
    },
    {
        .lvl = 18,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 18,
        .species = SPECIES_VENONAT,
    },
};

static const struct TrainerMon sParty_BugCatcherBrent[] = {
    {
        .lvl = 19,
        .species = SPECIES_BEEDRILL,
    },
    {
        .lvl = 19,
        .species = SPECIES_BEEDRILL,
    },
};

static const struct TrainerMon sParty_BugCatcherConner[] = {
    {
        .lvl = 20,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 20,
        .species = SPECIES_WEEDLE,
    },
    {
        .lvl = 20,
        .species = SPECIES_VENONAT,
    },
};

static const struct TrainerMon sParty_LassJanice[] = {
    {
        .lvl = 9,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 9,
        .species = SPECIES_PIDGEY,
    },
};

static const struct TrainerMon sParty_LassSally[] = {
    {
        .lvl = 10,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 10,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_LassRobin[] = {
    {
        .lvl = 14,
        .species = SPECIES_JIGGLYPUFF,
    },
};

static const struct TrainerMon sParty_LassCrissy[] = {
    {
        .lvl = 31,
        .species = SPECIES_PARAS,
    },
    {
        .lvl = 31,
        .species = SPECIES_PARAS,
    },
    {
        .lvl = 31,
        .species = SPECIES_PARASECT,
    },
};

static const struct TrainerMon sParty_LassMiriam[] = {
    {
        .lvl = 11,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 11,
        .species = SPECIES_BELLSPROUT,
    },
};

static const struct TrainerMon sParty_LassIris[] = {
    {
        .lvl = 14,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_LassReli[] = {
    {
        .lvl = 16,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 16,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_LassAli[] = {
    {
        .lvl = 12,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 12,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 12,
        .species = SPECIES_BELLSPROUT,
    },
};

static const struct TrainerMon sParty_Lass2[] = {
    {
        .lvl = 15,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 15,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_LassHaley[] = {
    {
        .lvl = 13,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 13,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 13,
        .species = SPECIES_ODDISH,
    },
};

static const struct TrainerMon sParty_LassAnn[] = {
    {
        .lvl = 18,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 18,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_LassDawn[] = {
    {
        .lvl = 18,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 18,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_LassPaige[] = {
    {
        .lvl = 23,
        .species = SPECIES_NIDORAN_F,
    },
    {
        .lvl = 23,
        .species = SPECIES_NIDORINA,
    },
};

static const struct TrainerMon sParty_LassAndrea[] = {
    {
        .lvl = 24,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 24,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 24,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_LassMegan[] = {
    {
        .lvl = 19,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 19,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 19,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 19,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 19,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_LassJulia[] = {
    {
        .lvl = 22,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .lvl = 22,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_LassKay[] = {
    {
        .lvl = 23,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 23,
        .species = SPECIES_WEEPINBELL,
    },
};

static const struct TrainerMon sParty_LassLisa[] = {
    {
        .lvl = 23,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 23,
        .species = SPECIES_GLOOM,
    },
};

static const struct TrainerMon sParty_SailorEdmond[] = {
    {
        .lvl = 18,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 18,
        .species = SPECIES_SHELLDER,
    },
};

static const struct TrainerMon sParty_SailorTrevor[] = {
    {
        .lvl = 17,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 17,
        .species = SPECIES_TENTACOOL,
    },
};

static const struct TrainerMon sParty_SailorLeonard[] = {
    {
        .lvl = 21,
        .species = SPECIES_SHELLDER,
    },
};

static const struct TrainerMon sParty_SailorDuncan[] = {
    {
        .lvl = 17,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 17,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 17,
        .species = SPECIES_TENTACOOL,
    },
};

static const struct TrainerMon sParty_SailorHuey[] = {
    {
        .lvl = 18,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 18,
        .species = SPECIES_STARYU,
    },
};

static const struct TrainerMon sParty_SailorDylan[] = {
    {
        .lvl = 17,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 17,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 17,
        .species = SPECIES_HORSEA,
    },
};

static const struct TrainerMon sParty_SailorPhillip[] = {
    {
        .lvl = 20,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_SailorDwayne[] = {
    {
        .lvl = 21,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 21,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_CamperLiam[] = {
    {
        .lvl = 10,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_TACKLE, MOVE_DEFENSE_CURL, MOVE_NONE, MOVE_NONE},
    },
    {
        .lvl = 11,
        .species = SPECIES_SANDSHREW,
        .moves = {MOVE_SCRATCH, MOVE_DEFENSE_CURL, MOVE_SAND_ATTACK, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_CamperShane[] = {
    {
        .lvl = 14,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 14,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_CamperEthan[] = {
    {
        .lvl = 18,
        .species = SPECIES_MANKEY,
    },
};

static const struct TrainerMon sParty_CamperRicky[] = {
    {
        .lvl = 20,
        .species = SPECIES_SQUIRTLE,
    },
};

static const struct TrainerMon sParty_CamperJeff[] = {
    {
        .lvl = 16,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 16,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_Camper2[] = {DUMMY_TRAINER_MON};

static const struct TrainerMon sParty_CamperChris[] = {
    {
        .lvl = 21,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 21,
        .species = SPECIES_CHARMANDER,
    },
};

static const struct TrainerMon sParty_CamperDrew[] = {
    {
        .lvl = 19,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 19,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 19,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 19,
        .species = SPECIES_SANDSHREW,
    },
};

static const struct TrainerMon sParty_PicnickerDiana[] = {
    {
        .lvl = 19,
        .species = SPECIES_GOLDEEN,
    },
};

static const struct TrainerMon sParty_PicnickerNancy[] = {
    {
        .lvl = 16,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 16,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_PicnickerIsabelle[] = {
    {
        .lvl = 16,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 16,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 16,
        .species = SPECIES_PIDGEY,
    },
};

static const struct TrainerMon sParty_PicnickerKelsey[] = {
    {
        .lvl = 15,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 15,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_PicnickerAlicia[] = {
    {
        .lvl = 18,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 18,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 18,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 18,
        .species = SPECIES_BELLSPROUT,
    },
};

static const struct TrainerMon sParty_PicnickerCaitlin[] = {
    {
        .lvl = 23,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_PicnickerHeidi[] = {
    {
        .lvl = 20,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 20,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_PicnickerCarol[] = {
    {
        .lvl = 21,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 21,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_PicnickerSofia[] = {
    {
        .lvl = 21,
        .species = SPECIES_JIGGLYPUFF,
    },
    {
        .lvl = 21,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 21,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_PicnickerMartha[] = {
    {
        .lvl = 22,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 22,
        .species = SPECIES_BULBASAUR,
    },
};

static const struct TrainerMon sParty_PicnickerTina[] = {
    {
        .lvl = 24,
        .species = SPECIES_BULBASAUR,
    },
    {
        .lvl = 24,
        .species = SPECIES_IVYSAUR,
    },
};

static const struct TrainerMon sParty_PicnickerHannah[] = {
    {
        .lvl = 24,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 24,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 24,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 24,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 24,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_PokemaniacMark[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 29,
        .species = SPECIES_RHYHORN,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 29,
        .species = SPECIES_LICKITUNG,
    },
};

static const struct TrainerMon sParty_PokemaniacHerman[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 20,
        .species = SPECIES_CUBONE,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 20,
        .species = SPECIES_SLOWPOKE,
    },
};

static const struct TrainerMon sParty_PokemaniacCooper[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 20,
        .species = SPECIES_SLOWPOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 20,
        .species = SPECIES_SLOWPOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 20,
        .species = SPECIES_SLOWPOKE,
    },
};

static const struct TrainerMon sParty_PokemaniacSteve[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 22,
        .species = SPECIES_CHARMANDER,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 22,
        .species = SPECIES_CUBONE,
    },
};

static const struct TrainerMon sParty_PokemaniacWinston[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 25,
        .species = SPECIES_SLOWPOKE,
    },
};

static const struct TrainerMon sParty_PokemaniacDawson[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 40,
        .species = SPECIES_CHARMELEON,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 40,
        .species = SPECIES_LAPRAS,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 40,
        .species = SPECIES_LICKITUNG,
    },
};

static const struct TrainerMon sParty_PokemaniacAshton[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 23,
        .species = SPECIES_CUBONE,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 23,
        .species = SPECIES_SLOWPOKE,
    },
};

static const struct TrainerMon sParty_SuperNerdJovan[] = {
    {
        .lvl = 11,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 11,
        .species = SPECIES_VOLTORB,
    },
};

static const struct TrainerMon sParty_SuperNerdMiguel[] = {
    {
        .lvl = 12,
        .species = SPECIES_GRIMER,
    },
    {
        .lvl = 12,
        .species = SPECIES_VOLTORB,
    },
    {
        .lvl = 12,
        .species = SPECIES_KOFFING,
    },
};

static const struct TrainerMon sParty_SuperNerdAidan[] = {
    {
        .lvl = 20,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_TACKLE, MOVE_CHARGE},
    },
    {
        .lvl = 20,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE, MOVE_POISON_GAS},
    },
    {
        .lvl = 20,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_TACKLE, MOVE_CHARGE},
    },
    {
        .lvl = 20,
        .species = SPECIES_MAGNEMITE,
        .moves = {MOVE_SONIC_BOOM, MOVE_SUPERSONIC, MOVE_THUNDER_SHOCK, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_SuperNerdGlenn[] = {
    {
        .lvl = 22,
        .species = SPECIES_GRIMER,
    },
    {
        .lvl = 22,
        .species = SPECIES_MUK,
    },
    {
        .lvl = 22,
        .species = SPECIES_GRIMER,
    },
};

static const struct TrainerMon sParty_SuperNerdLeslie[] = {
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SLUDGE, MOVE_SMOKESCREEN, MOVE_SMOG, MOVE_SELF_DESTRUCT},
    },
};

static const struct TrainerMon sParty_SuperNerd1[] = {
    {
        .lvl = 22,
        .species = SPECIES_KOFFING,
    },
    {
        .lvl = 22,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 22,
        .species = SPECIES_WEEZING,
    },
};

static const struct TrainerMon sParty_SuperNerd2[] = {
    {
        .lvl = 20,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 20,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 20,
        .species = SPECIES_KOFFING,
    },
    {
        .lvl = 20,
        .species = SPECIES_MAGNEMITE,
    },
};

static const struct TrainerMon sParty_SuperNerd3[] = {
    {
        .lvl = 24,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 24,
        .species = SPECIES_VOLTORB,
    },
};

static const struct TrainerMon sParty_SuperNerdErik[] = {
    {
        .lvl = 36,
        .species = SPECIES_VULPIX,
    },
    {
        .lvl = 36,
        .species = SPECIES_VULPIX,
    },
    {
        .lvl = 36,
        .species = SPECIES_NINETALES,
    },
};

static const struct TrainerMon sParty_SuperNerdAvery[] = {
    {
        .lvl = 34,
        .species = SPECIES_PONYTA,
    },
    {
        .lvl = 34,
        .species = SPECIES_CHARMANDER,
    },
    {
        .lvl = 34,
        .species = SPECIES_VULPIX,
    },
    {
        .lvl = 34,
        .species = SPECIES_GROWLITHE,
    },
};

static const struct TrainerMon sParty_SuperNerdDerek[] = {
    {
        .lvl = 41,
        .species = SPECIES_RAPIDASH,
    },
};

static const struct TrainerMon sParty_SuperNerdZac[] = {
    {
        .lvl = 37,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 37,
        .species = SPECIES_VULPIX,
    },
};

static const struct TrainerMon sParty_HikerMarcos[] = {
    {
        .lvl = 10,
        .species = SPECIES_GEODUDE,
    },
    {
        .lvl = 10,
        .species = SPECIES_GEODUDE,
    },
    {
        .lvl = 10,
        .species = SPECIES_ONIX,
    },
};

static const struct TrainerMon sParty_HikerFranklin[] = {
    {
        .lvl = 15,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 15,
        .species = SPECIES_GEODUDE,
    },
};

static const struct TrainerMon sParty_HikerNob[] = {
    {
        .lvl = 13,
        .species = SPECIES_GEODUDE,
    },
    {
        .lvl = 13,
        .species = SPECIES_GEODUDE,
    },
    {
        .lvl = 13,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 13,
        .species = SPECIES_GEODUDE,
    },
};

static const struct TrainerMon sParty_HikerWayne[] = {
    {
        .lvl = 17,
        .species = SPECIES_ONIX,
    },
};

static const struct TrainerMon sParty_HikerAlan[] = {
    {
        .lvl = 21,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
    {
        .lvl = 21,
        .species = SPECIES_ONIX,
        .moves = {MOVE_HARDEN, MOVE_ROCK_THROW, MOVE_BIND, MOVE_SCREECH},
    },
};

static const struct TrainerMon sParty_HikerBrice[] = {
    {
        .lvl = 20,
        .species = SPECIES_GEODUDE,
    },
    {
        .lvl = 20,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 20,
        .species = SPECIES_GEODUDE,
    },
};

static const struct TrainerMon sParty_HikerClark[] = {
    {
        .lvl = 21,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
    {
        .lvl = 21,
        .species = SPECIES_ONIX,
        .moves = {MOVE_HARDEN, MOVE_ROCK_THROW, MOVE_BIND, MOVE_SCREECH},
    },
};

static const struct TrainerMon sParty_HikerTrent[] = {
    {
        .lvl = 19,
        .species = SPECIES_ONIX,
    },
    {
        .lvl = 19,
        .species = SPECIES_GRAVELER,
    },
};

static const struct TrainerMon sParty_HikerDudley[] = {
    {
        .lvl = 21,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
    {
        .lvl = 21,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
    {
        .lvl = 21,
        .species = SPECIES_GRAVELER,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
};

static const struct TrainerMon sParty_HikerAllen[] = {
    {
        .lvl = 25,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
};

static const struct TrainerMon sParty_HikerEric[] = {
    {
        .lvl = 20,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 20,
        .species = SPECIES_ONIX,
    },
};

static const struct TrainerMon sParty_HikerLenny[] = {
    {
        .lvl = 19,
        .species = SPECIES_GEODUDE,
    },
    {
        .lvl = 19,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 19,
        .species = SPECIES_GEODUDE,
    },
    {
        .lvl = 19,
        .species = SPECIES_GEODUDE,
    },
};

static const struct TrainerMon sParty_HikerOliver[] = {
    {
        .lvl = 20,
        .species = SPECIES_ONIX,
    },
    {
        .lvl = 20,
        .species = SPECIES_ONIX,
    },
    {
        .lvl = 20,
        .species = SPECIES_GEODUDE,
    },
};

static const struct TrainerMon sParty_HikerLucas[] = {
    {
        .lvl = 21,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
    {
        .lvl = 21,
        .species = SPECIES_GRAVELER,
        .moves = {MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
};

static const struct TrainerMon sParty_BikerJared[] = {
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_POISON_GAS},
    },
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_BikerMalik[] = {
    {
        .lvl = 29,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 29,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
};

static const struct TrainerMon sParty_BikerErnest[] = {
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE, MOVE_POUND},
    },
};

static const struct TrainerMon sParty_BikerAlex[] = {
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_BikerLao[] = {
    {
        .lvl = 29,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
    {
        .lvl = 29,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_Biker1[] = {DUMMY_TRAINER_MON};

static const struct TrainerMon sParty_BikerHideo[] = {
    {
        .lvl = 33,
        .species = SPECIES_WEEZING,
    },
};

static const struct TrainerMon sParty_BikerRuben[] = {
    {
        .lvl = 28,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_BikerBilly[] = {
    {
        .lvl = 33,
        .species = SPECIES_MUK,
    },
};

static const struct TrainerMon sParty_BikerNikolas[] = {
    {
        .lvl = 29,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SPARK, MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_CHARGE},
    },
    {
        .lvl = 29,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SPARK, MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_CHARGE},
    },
};

static const struct TrainerMon sParty_BikerJaxon[] = {
    {
        .lvl = 29,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SLUDGE, MOVE_SMOKESCREEN, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 29,
        .species = SPECIES_MUK,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
};

static const struct TrainerMon sParty_BikerWilliam[] = {
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SELF_DESTRUCT, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_BikerLukas[] = {
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_BikerIsaac[] = {
    {
        .lvl = 28,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_BikerGerald[] = {
    {
        .lvl = 29,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 29,
        .species = SPECIES_MUK,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
};

static const struct TrainerMon sParty_Burglar1[] = {
    {
        .lvl = 29,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 29,
        .species = SPECIES_VULPIX,
    },
};

static const struct TrainerMon sParty_Burglar2[] = {
    {
        .lvl = 33,
        .species = SPECIES_GROWLITHE,
    },
};

static const struct TrainerMon sParty_Burglar3[] = {
    {
        .lvl = 28,
        .species = SPECIES_VULPIX,
    },
    {
        .lvl = 28,
        .species = SPECIES_CHARMANDER,
    },
    {
        .lvl = 28,
        .species = SPECIES_PONYTA,
    },
};

static const struct TrainerMon sParty_BurglarQuinn[] = {
    {
        .lvl = 36,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 36,
        .species = SPECIES_VULPIX,
    },
    {
        .lvl = 36,
        .species = SPECIES_NINETALES,
    },
};

static const struct TrainerMon sParty_BurglarRamon[] = {
    {
        .lvl = 41,
        .species = SPECIES_PONYTA,
    },
};

static const struct TrainerMon sParty_BurglarDusty[] = {
    {
        .lvl = 37,
        .species = SPECIES_VULPIX,
    },
    {
        .lvl = 37,
        .species = SPECIES_GROWLITHE,
    },
};

static const struct TrainerMon sParty_BurglarArnie[] = {
    {
        .lvl = 34,
        .species = SPECIES_CHARMANDER,
    },
    {
        .lvl = 34,
        .species = SPECIES_CHARMELEON,
    },
};

static const struct TrainerMon sParty_Burglar4[] = {
    {
        .lvl = 34,
        .species = SPECIES_CHARMANDER,
    },
    {
        .lvl = 34,
        .species = SPECIES_CHARMELEON,
    },
};

static const struct TrainerMon sParty_BurglarSimon[] = {
    {
        .lvl = 38,
        .species = SPECIES_NINETALES,
    },
};

static const struct TrainerMon sParty_BurglarLewis[] = {
    {
        .lvl = 34,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 34,
        .species = SPECIES_PONYTA,
    },
};

static const struct TrainerMon sParty_EngineerBaily[] = {
    {
        .lvl = 21,
        .species = SPECIES_VOLTORB,
    },
    {
        .lvl = 21,
        .species = SPECIES_MAGNEMITE,
    },
};

static const struct TrainerMon sParty_EngineerBraxton[] = {
    {
        .lvl = 21,
        .species = SPECIES_MAGNEMITE,
    },
};

static const struct TrainerMon sParty_EngineerBernie[] = {
    {
        .lvl = 18,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 18,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 18,
        .species = SPECIES_MAGNETON,
    },
};

static const struct TrainerMon sParty_FishermanDale[] = {
    {
        .lvl = 17,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 17,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 17,
        .species = SPECIES_GOLDEEN,
    },
};

static const struct TrainerMon sParty_FishermanBarny[] = {
    {
        .lvl = 17,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 17,
        .species = SPECIES_STARYU,
    },
    {
        .lvl = 17,
        .species = SPECIES_SHELLDER,
    },
};

static const struct TrainerMon sParty_FishermanNed[] = {
    {
        .lvl = 22,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 22,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 22,
        .species = SPECIES_GOLDEEN,
    },
};

static const struct TrainerMon sParty_FishermanChip[] = {
    {
        .lvl = 24,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 24,
        .species = SPECIES_GOLDEEN,
    },
};

static const struct TrainerMon sParty_FishermanHank[] = {
    {
        .lvl = 27,
        .species = SPECIES_GOLDEEN,
    },
};

static const struct TrainerMon sParty_FishermanElliot[] = {
    {
        .lvl = 21,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 21,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 21,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 21,
        .species = SPECIES_HORSEA,
    },
};

static const struct TrainerMon sParty_FishermanRonald[] = {
    {
        .lvl = 28,
        .species = SPECIES_SEAKING,
    },
    {
        .lvl = 28,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 28,
        .species = SPECIES_SEAKING,
    },
    {
        .lvl = 28,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_FishermanClaude[] = {
    {
        .lvl = 31,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 31,
        .species = SPECIES_CLOYSTER,
    },
};

static const struct TrainerMon sParty_FishermanWade[] = {
    {
        .lvl = 27,
        .species = SPECIES_MAGIKARP,
    },
    {
        .lvl = 27,
        .species = SPECIES_MAGIKARP,
    },
    {
        .lvl = 27,
        .species = SPECIES_MAGIKARP,
    },
    {
        .lvl = 27,
        .species = SPECIES_MAGIKARP,
    },
    {
        .lvl = 27,
        .species = SPECIES_MAGIKARP,
    },
    {
        .lvl = 27,
        .species = SPECIES_MAGIKARP,
    },
};

static const struct TrainerMon sParty_FishermanNolan[] = {
    {
        .lvl = 33,
        .species = SPECIES_SEAKING,
    },
    {
        .lvl = 33,
        .species = SPECIES_GOLDEEN,
    },
};

static const struct TrainerMon sParty_FishermanAndrew[] = {
    {
        .lvl = 24,
        .species = SPECIES_MAGIKARP,
    },
    {
        .lvl = 24,
        .species = SPECIES_MAGIKARP,
    },
};

static const struct TrainerMon sParty_SwimmerMaleLuis[] = {
    {
        .lvl = 16,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 16,
        .species = SPECIES_SHELLDER,
    },
};

static const struct TrainerMon sParty_SwimmerMaleRichard[] = {
    {
        .lvl = 30,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 30,
        .species = SPECIES_SHELLDER,
    },
};

static const struct TrainerMon sParty_SwimmerMaleReece[] = {
    {
        .lvl = 29,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 29,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 29,
        .species = SPECIES_STARYU,
    },
};

static const struct TrainerMon sParty_SwimmerMaleMatthew[] = {
    {
        .lvl = 30,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 30,
        .species = SPECIES_POLIWHIRL,
    },
};

static const struct TrainerMon sParty_SwimmerMaleDouglas[] = {
    {
        .lvl = 27,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 27,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 27,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 27,
        .species = SPECIES_GOLDEEN,
    },
};

static const struct TrainerMon sParty_SwimmerMaleDavid[] = {
    {
        .lvl = 29,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 29,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 29,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_SwimmerMaleTony[] = {
    {
        .lvl = 30,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 30,
        .species = SPECIES_HORSEA,
    },
};

static const struct TrainerMon sParty_SwimmerMaleAxle[] = {
    {
        .lvl = 27,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 27,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 27,
        .species = SPECIES_STARYU,
    },
    {
        .lvl = 27,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 27,
        .species = SPECIES_TENTACRUEL,
    },
};

static const struct TrainerMon sParty_SwimmerMaleBarry[] = {
    {
        .lvl = 31,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 31,
        .species = SPECIES_CLOYSTER,
    },
};

static const struct TrainerMon sParty_SwimmerMaleDean[] = {
    {
        .lvl = 35,
        .species = SPECIES_STARYU,
    },
};

static const struct TrainerMon sParty_SwimmerMaleDarrin[] = {
    {
        .lvl = 28,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 28,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 28,
        .species = SPECIES_SEADRA,
    },
    {
        .lvl = 28,
        .species = SPECIES_HORSEA,
    },
};

static const struct TrainerMon sParty_SwimmerMaleSpencer[] = {
    {
        .lvl = 33,
        .species = SPECIES_SEADRA,
    },
    {
        .lvl = 33,
        .species = SPECIES_TENTACRUEL,
    },
};

static const struct TrainerMon sParty_SwimmerMaleJack[] = {
    {
        .lvl = 37,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_SwimmerMaleJerome[] = {
    {
        .lvl = 33,
        .species = SPECIES_STARYU,
    },
    {
        .lvl = 33,
        .species = SPECIES_WARTORTLE,
    },
};

static const struct TrainerMon sParty_SwimmerMaleRoland[] = {
    {
        .lvl = 32,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .lvl = 32,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 32,
        .species = SPECIES_SEADRA,
    },
};

static const struct TrainerMon sParty_CueBallKoji[] = {
    {
        .lvl = 28,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 28,
        .species = SPECIES_MANKEY,
    },
    {
        .lvl = 28,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_CueBallLuke[] = {
    {
        .lvl = 29,
        .species = SPECIES_MANKEY,
    },
    {
        .lvl = 29,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_CueBallCamron[] = {
    {
        .lvl = 29,
        .species = SPECIES_MANKEY,
    },
    {
        .lvl = 29,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_CueBallRaul[] = {
    {
        .lvl = 29,
        .species = SPECIES_MANKEY,
    },
    {
        .lvl = 29,
        .species = SPECIES_PRIMEAPE,
    },
};

static const struct TrainerMon sParty_CueBallIsaiah[] = {
    {
        .lvl = 29,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 29,
        .species = SPECIES_MACHAMP,
    },
};

static const struct TrainerMon sParty_CueBallZeek[] = {
    {
        .lvl = 33,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_CueBallJamal[] = {
    {
        .lvl = 26,
        .species = SPECIES_MANKEY,
    },
    {
        .lvl = 26,
        .species = SPECIES_MANKEY,
    },
    {
        .lvl = 26,
        .species = SPECIES_MACHAMP,
    },
    {
        .lvl = 26,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_CueBallCorey[] = {
    {
        .lvl = 29,
        .species = SPECIES_PRIMEAPE,
    },
    {
        .lvl = 29,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_CueBallChase[] = {
    {
        .lvl = 31,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 31,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 31,
        .species = SPECIES_TENTACRUEL,
    },
};

static const struct TrainerMon sParty_GamerHugo[] = {
    {
        .lvl = 18,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 18,
        .species = SPECIES_HORSEA,
    },
};

static const struct TrainerMon sParty_GamerJasper[] = {
    {
        .lvl = 18,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 18,
        .species = SPECIES_ODDISH,
    },
};

static const struct TrainerMon sParty_GamerDirk[] = {
    {
        .lvl = 18,
        .species = SPECIES_VOLTORB,
    },
    {
        .lvl = 18,
        .species = SPECIES_MAGNEMITE,
    },
};

static const struct TrainerMon sParty_GamerDarian[] = {
    {
        .lvl = 18,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 18,
        .species = SPECIES_VULPIX,
    },
};

static const struct TrainerMon sParty_GamerStan[] = {
    {
        .lvl = 22,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 22,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 22,
        .species = SPECIES_POLIWHIRL,
    },
};

static const struct TrainerMon sParty_Gamer1[] = {DUMMY_TRAINER_MON};

static const struct TrainerMon sParty_GamerRich[] = {
    {
        .lvl = 24,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 24,
        .species = SPECIES_VULPIX,
    },
};

static const struct TrainerMon sParty_BeautyBridget[] = {
    {
        .lvl = 21,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 21,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 21,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 21,
        .species = SPECIES_BELLSPROUT,
    },
};

static const struct TrainerMon sParty_BeautyTamia[] = {
    {
        .lvl = 24,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 24,
        .species = SPECIES_BELLSPROUT,
    },
};

static const struct TrainerMon sParty_BeautyLori[] = {
    {
        .lvl = 24,
        .species = SPECIES_EXEGGCUTE,
    },
};

static const struct TrainerMon sParty_BeautyLola[] = {
    {
        .lvl = 27,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 27,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 27,
        .species = SPECIES_RATTATA,
    },
};

static const struct TrainerMon sParty_BeautySheila[] = {
    {
        .lvl = 29,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .lvl = 29,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleTiffany[] = {
    {
        .lvl = 35,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleNora[] = {
    {
        .lvl = 30,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 30,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 30,
        .species = SPECIES_CLOYSTER,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleMelissa[] = {
    {
        .lvl = 31,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 31,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_BeautyGrace[] = {
    {
        .lvl = 29,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .lvl = 29,
        .species = SPECIES_WIGGLYTUFF,
    },
};

static const struct TrainerMon sParty_BeautyOlivia[] = {
    {
        .lvl = 29,
        .species = SPECIES_BULBASAUR,
    },
    {
        .lvl = 29,
        .species = SPECIES_IVYSAUR,
    },
};

static const struct TrainerMon sParty_BeautyLauren[] = {
    {
        .lvl = 33,
        .species = SPECIES_WEEPINBELL,
    },
    {
        .lvl = 33,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 33,
        .species = SPECIES_WEEPINBELL,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleAnya[] = {
    {
        .lvl = 27,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 27,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 27,
        .species = SPECIES_SEAKING,
    },
    {
        .lvl = 27,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 27,
        .species = SPECIES_POLIWAG,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleAlice[] = {
    {
        .lvl = 30,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 30,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleConnie[] = {
    {
        .lvl = 29,
        .species = SPECIES_STARYU,
    },
    {
        .lvl = 29,
        .species = SPECIES_STARYU,
    },
    {
        .lvl = 29,
        .species = SPECIES_STARYU,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleShirley[] = {
    {
        .lvl = 30,
        .species = SPECIES_SEADRA,
    },
    {
        .lvl = 30,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 30,
        .species = SPECIES_SEADRA,
    },
};

static const struct TrainerMon sParty_PsychicJohan[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 31,
        .species = SPECIES_KADABRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 31,
        .species = SPECIES_SLOWPOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 31,
        .species = SPECIES_MR_MIME,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 31,
        .species = SPECIES_KADABRA,
    },
};

static const struct TrainerMon sParty_PsychicTyron[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 34,
        .species = SPECIES_MR_MIME,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 34,
        .species = SPECIES_KADABRA,
    },
};

static const struct TrainerMon sParty_PsychicCameron[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 33,
        .species = SPECIES_SLOWPOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 33,
        .species = SPECIES_SLOWPOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 33,
        .species = SPECIES_SLOWBRO,
    },
};

static const struct TrainerMon sParty_PsychicPreston[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 38,
        .species = SPECIES_SLOWBRO,
    },
};

static const struct TrainerMon sParty_RockerRandall[] = {
    {
        .lvl = 20,
        .species = SPECIES_VOLTORB,
    },
    {
        .lvl = 20,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 20,
        .species = SPECIES_VOLTORB,
    },
};

static const struct TrainerMon sParty_RockerLuca[] = {
    {
        .lvl = 29,
        .species = SPECIES_VOLTORB,
    },
    {
        .lvl = 29,
        .species = SPECIES_ELECTRODE,
    },
};

static const struct TrainerMon sParty_JugglerDalton[] = {
    {
        .lvl = 29,
        .species = SPECIES_KADABRA,
    },
    {
        .lvl = 29,
        .species = SPECIES_MR_MIME,
    },
};

static const struct TrainerMon sParty_JugglerNelson[] = {
    {
        .lvl = 41,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 41,
        .species = SPECIES_HYPNO,
    },
    {
        .lvl = 41,
        .species = SPECIES_KADABRA,
    },
    {
        .lvl = 41,
        .species = SPECIES_KADABRA,
    },
};

static const struct TrainerMon sParty_JugglerKirk[] = {
    {
        .lvl = 31,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 31,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 31,
        .species = SPECIES_KADABRA,
    },
    {
        .lvl = 31,
        .species = SPECIES_DROWZEE,
    },
};

static const struct TrainerMon sParty_JugglerShawn[] = {
    {
        .lvl = 34,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 34,
        .species = SPECIES_HYPNO,
    },
};

static const struct TrainerMon sParty_JugglerGregory[] = {
    {
        .lvl = 48,
        .species = SPECIES_MR_MIME,
        .moves = {MOVE_PSYCHIC, MOVE_ROLE_PLAY, MOVE_DOUBLE_SLAP, MOVE_ENCORE},
    },
};

static const struct TrainerMon sParty_JugglerEdward[] = {
    {
        .lvl = 46,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SWIFT, MOVE_LIGHT_SCREEN, MOVE_SPARK, MOVE_SONIC_BOOM},
    },
    {
        .lvl = 46,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SWIFT, MOVE_LIGHT_SCREEN, MOVE_SPARK, MOVE_SONIC_BOOM},
    },
    {
        .lvl = 47,
        .species = SPECIES_ELECTRODE,
        .moves = {MOVE_SWIFT, MOVE_SPARK, MOVE_SELF_DESTRUCT, MOVE_SONIC_BOOM},
    },
    {
        .lvl = 48,
        .species = SPECIES_MR_MIME,
        .moves = {MOVE_PSYCHIC, MOVE_ROLE_PLAY, MOVE_REFLECT, MOVE_ENCORE},
    },
};

static const struct TrainerMon sParty_JugglerKayden[] = {
    {
        .lvl = 38,
        .species = SPECIES_HYPNO,
    },
};

static const struct TrainerMon sParty_JugglerNate[] = {
    {
        .lvl = 34,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 34,
        .species = SPECIES_KADABRA,
    },
};

static const struct TrainerMon sParty_TamerPhil[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 34,
        .species = SPECIES_SANDSLASH,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 34,
        .species = SPECIES_ARBOK,
    },
};

static const struct TrainerMon sParty_TamerEdgar[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 33,
        .species = SPECIES_ARBOK,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 33,
        .species = SPECIES_SANDSLASH,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 33,
        .species = SPECIES_ARBOK,
    },
};

static const struct TrainerMon sParty_TamerJason[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 43,
        .species = SPECIES_RHYHORN,
    },
};

static const struct TrainerMon sParty_TamerCole[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 39,
        .species = SPECIES_ARBOK,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 39,
        .species = SPECIES_TAUROS,
    },
};

static const struct TrainerMon sParty_TamerVincent[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 44,
        .species = SPECIES_PERSIAN,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 44,
        .species = SPECIES_GOLDUCK,
    },
};

static const struct TrainerMon sParty_TamerJohn[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 42,
        .species = SPECIES_RHYHORN,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 42,
        .species = SPECIES_PRIMEAPE,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 42,
        .species = SPECIES_ARBOK,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 42,
        .species = SPECIES_TAUROS,
    },
};

static const struct TrainerMon sParty_BirdKeeperSebastian[] = {
    {
        .lvl = 29,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 29,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_BirdKeeperPerry[] = {
    {
        .lvl = 25,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 25,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 25,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 25,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 25,
        .species = SPECIES_SPEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperRobert[] = {
    {
        .lvl = 26,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 26,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .lvl = 26,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 26,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperDonald[] = {
    {
        .lvl = 33,
        .species = SPECIES_FARFETCHD,
    },
};

static const struct TrainerMon sParty_BirdKeeperBenny[] = {
    {
        .lvl = 29,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 29,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperEdwin[] = {
    {
        .lvl = 26,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .lvl = 26,
        .species = SPECIES_FARFETCHD,
    },
    {
        .lvl = 26,
        .species = SPECIES_DODUO,
    },
    {
        .lvl = 26,
        .species = SPECIES_PIDGEY,
    },
};

static const struct TrainerMon sParty_BirdKeeperChester[] = {
    {
        .lvl = 28,
        .species = SPECIES_DODRIO,
    },
    {
        .lvl = 28,
        .species = SPECIES_DODUO,
    },
    {
        .lvl = 28,
        .species = SPECIES_DODUO,
    },
};

static const struct TrainerMon sParty_BirdKeeperWilton[] = {
    {
        .lvl = 29,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 29,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperRamiro[] = {
    {
        .lvl = 34,
        .species = SPECIES_DODRIO,
    },
};

static const struct TrainerMon sParty_BirdKeeperJacob[] = {
    {
        .lvl = 26,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 26,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 26,
        .species = SPECIES_FEAROW,
    },
    {
        .lvl = 26,
        .species = SPECIES_SPEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperRoger[] = {
    {
        .lvl = 30,
        .species = SPECIES_FEAROW,
    },
    {
        .lvl = 30,
        .species = SPECIES_FEAROW,
    },
    {
        .lvl = 30,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_BirdKeeperReed[] = {
    {
        .lvl = 39,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .lvl = 39,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .lvl = 39,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 39,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_BirdKeeperKeith[] = {
    {
        .lvl = 39,
        .species = SPECIES_FARFETCHD,
    },
    {
        .lvl = 39,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperCarter[] = {
    {
        .lvl = 28,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 28,
        .species = SPECIES_DODUO,
    },
    {
        .lvl = 28,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_BirdKeeperMitch[] = {
    {
        .lvl = 26,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 26,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 26,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 26,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperBeck[] = {
    {
        .lvl = 29,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .lvl = 29,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperMarlon[] = {
    {
        .lvl = 28,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 28,
        .species = SPECIES_DODUO,
    },
    {
        .lvl = 28,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BlackBeltKoichi[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltMike[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 31,
        .species = SPECIES_MANKEY,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 31,
        .species = SPECIES_MANKEY,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 31,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltHideki[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 32,
        .species = SPECIES_MACHOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 32,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltAaron[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 36,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltHitoshi[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 31,
        .species = SPECIES_MACHOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 31,
        .species = SPECIES_MANKEY,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 31,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltAtsushi[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 40,
        .species = SPECIES_MACHOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 40,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltKiyo[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 43,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltTakashi[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_MACHOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltDaisuke[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 43,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 43,
        .species = SPECIES_MACHOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 43,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_RivalOaksLabSquirtle[] = {
    {
        .lvl = 5,
        .species = SPECIES_SQUIRTLE,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_NONE, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_RivalOaksLabBulbasaur[] = {
    {
        .lvl = 5,
        .species = SPECIES_BULBASAUR,
        .moves = {MOVE_TACKLE, MOVE_GROWL, MOVE_NONE, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_RivalOaksLabCharmander[] = {
    {
        .lvl = 5,
        .species = SPECIES_CHARMANDER,
        .moves = {MOVE_SCRATCH, MOVE_GROWL, MOVE_NONE, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_RivalRoute22EarlySquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 9,
        .species = SPECIES_PIDGEY,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_NONE, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 9,
        .species = SPECIES_SQUIRTLE,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_NONE, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_RivalRoute22EarlyBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 9,
        .species = SPECIES_PIDGEY,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_NONE, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 9,
        .species = SPECIES_BULBASAUR,
        .moves = {MOVE_TACKLE, MOVE_GROWL, MOVE_NONE, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_RivalRoute22EarlyCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 9,
        .species = SPECIES_PIDGEY,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_NONE, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 9,
        .species = SPECIES_CHARMANDER,
        .moves = {MOVE_SCRATCH, MOVE_GROWL, MOVE_NONE, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_RivalCeruleanSquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 17,
        .species = SPECIES_PIDGEOTTO,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 16,
        .species = SPECIES_ABRA,
        .moves = {MOVE_TELEPORT, MOVE_NONE, MOVE_NONE, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 15,
        .species = SPECIES_RATTATA,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_QUICK_ATTACK, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 18,
        .species = SPECIES_SQUIRTLE,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_WITHDRAW, MOVE_WATER_GUN},
    },
};

static const struct TrainerMon sParty_RivalCeruleanBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 17,
        .species = SPECIES_PIDGEOTTO,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 16,
        .species = SPECIES_ABRA,
        .moves = {MOVE_TELEPORT, MOVE_NONE, MOVE_NONE, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 15,
        .species = SPECIES_RATTATA,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_QUICK_ATTACK, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 18,
        .species = SPECIES_BULBASAUR,
        .moves = {MOVE_SLEEP_POWDER, MOVE_POISON_POWDER, MOVE_VINE_WHIP, MOVE_LEECH_SEED},
    },
};

static const struct TrainerMon sParty_RivalCeruleanCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 17,
        .species = SPECIES_PIDGEOTTO,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 16,
        .species = SPECIES_ABRA,
        .moves = {MOVE_TELEPORT, MOVE_NONE, MOVE_NONE, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 15,
        .species = SPECIES_RATTATA,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_QUICK_ATTACK, MOVE_NONE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 18,
        .species = SPECIES_CHARMANDER,
        .moves = {MOVE_METAL_CLAW, MOVE_EMBER, MOVE_GROWL, MOVE_SCRATCH},
    },
};

static const struct TrainerMon sParty_ScientistTed[] = {
    {
        .lvl = 29,
        .species = SPECIES_ELECTRODE,
    },
    {
        .lvl = 29,
        .species = SPECIES_WEEZING,
    },
};

static const struct TrainerMon sParty_ScientistConnor[] = {
    {
        .lvl = 26,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_SELF_DESTRUCT},
    },
    {
        .lvl = 26,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_ScientistJerry[] = {
    {
        .lvl = 28,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 28,
        .species = SPECIES_VOLTORB,
    },
    {
        .lvl = 28,
        .species = SPECIES_MAGNETON,
    },
};

static const struct TrainerMon sParty_ScientistJose[] = {
    {
        .lvl = 29,
        .species = SPECIES_ELECTRODE,
        .moves = {MOVE_SPARK, MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_TACKLE},
    },
    {
        .lvl = 29,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_ScientistRodney[] = {
    {
        .lvl = 33,
        .species = SPECIES_ELECTRODE,
    },
};

static const struct TrainerMon sParty_ScientistBeau[] = {
    {
        .lvl = 26,
        .species = SPECIES_MAGNETON,
        .moves = {MOVE_SPARK, MOVE_THUNDER_WAVE, MOVE_SONIC_BOOM, MOVE_SUPERSONIC},
    },
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_MAGNEMITE,
        .moves = {MOVE_SPARK, MOVE_THUNDER_WAVE, MOVE_SONIC_BOOM, MOVE_SUPERSONIC},
    },
};

static const struct TrainerMon sParty_ScientistTaylor[] = {
    {
        .lvl = 25,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SPARK, MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 25,
        .species = SPECIES_MAGNETON,
        .moves = {MOVE_THUNDER_WAVE, MOVE_SONIC_BOOM, MOVE_SUPERSONIC, MOVE_THUNDER_SHOCK},
    },
    {
        .lvl = 25,
        .species = SPECIES_MAGNEMITE,
        .moves = {MOVE_THUNDER_WAVE, MOVE_SONIC_BOOM, MOVE_SUPERSONIC, MOVE_THUNDER_SHOCK},
    },
    {
        .lvl = 25,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_SELF_DESTRUCT},
    },
};

static const struct TrainerMon sParty_ScientistJoshua[] = {
    {
        .lvl = 29,
        .species = SPECIES_ELECTRODE,
    },
    {
        .lvl = 29,
        .species = SPECIES_MUK,
    },
};

static const struct TrainerMon sParty_ScientistParker[] = {
    {
        .lvl = 29,
        .species = SPECIES_GRIMER,
    },
    {
        .lvl = 29,
        .species = SPECIES_ELECTRODE,
    },
};

static const struct TrainerMon sParty_ScientistEd[] = {
    {
        .lvl = 28,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SPARK, MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_TACKLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_TACKLE, MOVE_SMOG},
    },
    {
        .lvl = 28,
        .species = SPECIES_MAGNETON,
        .moves = {MOVE_SPARK, MOVE_THUNDER_WAVE, MOVE_SONIC_BOOM, MOVE_SUPERSONIC},
    },
};

static const struct TrainerMon sParty_ScientistTravis[] = {
    {
        .lvl = 29,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 29,
        .species = SPECIES_KOFFING,
    },
};

static const struct TrainerMon sParty_ScientistBraydon[] = {
    {
        .lvl = 33,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 33,
        .species = SPECIES_MAGNETON,
    },
    {
        .lvl = 33,
        .species = SPECIES_VOLTORB,
    },
};

static const struct TrainerMon sParty_ScientistIvan[] = {
    {
        .lvl = 34,
        .species = SPECIES_MAGNEMITE,
    },
    {
        .lvl = 34,
        .species = SPECIES_ELECTRODE,
    },
};

static const struct TrainerMon sParty_BossGiovanni[] = {
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 25,
        .species = SPECIES_ONIX,
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 24,
        .species = SPECIES_RHYHORN,
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 29,
        .species = SPECIES_KANGASKHAN,
    },
};

static const struct TrainerMon sParty_BossGiovanni2[] = {
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 37,
        .species = SPECIES_NIDORINO,
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 35,
        .species = SPECIES_KANGASKHAN,
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 37,
        .species = SPECIES_RHYHORN,
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 41,
        .species = SPECIES_NIDOQUEEN,
    },
};

static const struct TrainerMon sParty_LeaderGiovanni[] = {
    {
        .lvl = 45,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_TAKE_DOWN, MOVE_ROCK_BLAST, MOVE_SCARY_FACE, MOVE_EARTHQUAKE},
    },
    {
        .lvl = 42,
        .species = SPECIES_DUGTRIO,
        .moves = {MOVE_SLASH, MOVE_SAND_TOMB, MOVE_MUD_SLAP, MOVE_EARTHQUAKE},
    },
    {
        .lvl = 44,
        .species = SPECIES_NIDOQUEEN,
        .moves = {MOVE_BODY_SLAM, MOVE_DOUBLE_KICK, MOVE_POISON_STING, MOVE_EARTHQUAKE},
    },
    {
        .lvl = 45,
        .species = SPECIES_NIDOKING,
        .moves = {MOVE_THRASH, MOVE_DOUBLE_KICK, MOVE_POISON_STING, MOVE_EARTHQUAKE},
    },
    {
        .lvl = 50,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_TAKE_DOWN, MOVE_ROCK_BLAST, MOVE_SCARY_FACE, MOVE_EARTHQUAKE},
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt[] = {
    {
        .lvl = 13,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 13,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt2[] = {
    {
        .lvl = 11,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 11,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 11,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt3[] = {
    {
        .lvl = 11,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 11,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt4[] = {
    {
        .lvl = 13,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 13,
        .species = SPECIES_SANDSHREW,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt5[] = {
    {
        .lvl = 17,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 17,
        .species = SPECIES_DROWZEE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt6[] = {
    {
        .lvl = 15,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 15,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt7[] = {
    {
        .lvl = 20,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 20,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt8[] = {
    {
        .lvl = 21,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 21,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt9[] = {
    {
        .lvl = 21,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 21,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt10[] = {
    {
        .lvl = 20,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE, MOVE_HARDEN},
    },
    {
        .lvl = 20,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOG, MOVE_TACKLE, MOVE_POISON_GAS, MOVE_NONE},
    },
    {
        .lvl = 20,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOG, MOVE_TACKLE, MOVE_POISON_GAS, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt11[] = {
    {
        .lvl = 19,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 19,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 19,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 19,
        .species = SPECIES_RATTATA,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt12[] = {
    {
        .lvl = 22,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE, MOVE_HARDEN},
    },
    {
        .lvl = 22,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE, MOVE_POISON_GAS},
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt13[] = {
    {
        .lvl = 17,
        .species = SPECIES_ZUBAT,
        .moves = {MOVE_BITE, MOVE_ASTONISH, MOVE_SUPERSONIC, MOVE_LEECH_LIFE},
    },
    {
        .lvl = 17,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOG, MOVE_TACKLE, MOVE_POISON_GAS, MOVE_NONE},
    },
    {
        .lvl = 17,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_SLUDGE, MOVE_DISABLE, MOVE_HARDEN, MOVE_POUND},
    },
    {
        .lvl = 17,
        .species = SPECIES_ZUBAT,
        .moves = {MOVE_BITE, MOVE_ASTONISH, MOVE_SUPERSONIC, MOVE_LEECH_LIFE},
    },
    {
        .lvl = 17,
        .species = SPECIES_RATICATE,
        .moves = {MOVE_HYPER_FANG, MOVE_QUICK_ATTACK, MOVE_TAIL_WHIP, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt14[] = {
    {
        .lvl = 20,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 20,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 20,
        .species = SPECIES_DROWZEE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt15[] = {
    {
        .lvl = 21,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 21,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt16[] = {
    {
        .lvl = 23,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 23,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 23,
        .species = SPECIES_SANDSLASH,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt17[] = {
    {
        .lvl = 23,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 23,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 23,
        .species = SPECIES_ARBOK,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt18[] = {
    {
        .lvl = 21,
        .species = SPECIES_KOFFING,
    },
    {
        .lvl = 21,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt19[] = {
    {
        .lvl = 25,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 25,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 25,
        .species = SPECIES_GOLBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt20[] = {
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
    },
    {
        .lvl = 26,
        .species = SPECIES_DROWZEE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt21[] = {
    {
        .lvl = 23,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 23,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 23,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 23,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt22[] = {
    {
        .lvl = 26,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt23[] = {
    {
        .lvl = 29,
        .species = SPECIES_CUBONE,
    },
    {
        .lvl = 29,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt24[] = {
    {
        .lvl = 25,
        .species = SPECIES_GOLBAT,
    },
    {
        .lvl = 25,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 25,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 25,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 25,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt25[] = {
    {
        .lvl = 28,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 28,
        .species = SPECIES_HYPNO,
    },
    {
        .lvl = 28,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt26[] = {
    {
        .lvl = 29,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 29,
        .species = SPECIES_DROWZEE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt27[] = {
    {
        .lvl = 28,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 28,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 28,
        .species = SPECIES_CUBONE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt28[] = {
    {
        .lvl = 33,
        .species = SPECIES_ARBOK,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt29[] = {
    {
        .lvl = 33,
        .species = SPECIES_HYPNO,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt30[] = {
    {
        .lvl = 29,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 29,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt31[] = {
    {
        .lvl = 28,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 28,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 28,
        .species = SPECIES_GOLBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt32[] = {
    {
        .lvl = 26,
        .species = SPECIES_RATICATE,
        .moves = {MOVE_SCARY_FACE, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK, MOVE_TAIL_WHIP},
    },
    {
        .lvl = 26,
        .species = SPECIES_ARBOK,
        .moves = {MOVE_GLARE, MOVE_BITE, MOVE_POISON_STING, MOVE_LEER},
    },
    {
        .lvl = 26,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 26,
        .species = SPECIES_GOLBAT,
        .moves = {MOVE_WING_ATTACK, MOVE_BITE, MOVE_ASTONISH, MOVE_SUPERSONIC},
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt33[] = {
    {
        .lvl = 29,
        .species = SPECIES_CUBONE,
    },
    {
        .lvl = 29,
        .species = SPECIES_CUBONE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt34[] = {
    {
        .lvl = 29,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 29,
        .species = SPECIES_SANDSLASH,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt35[] = {
    {
        .lvl = 26,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 26,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 26,
        .species = SPECIES_GOLBAT,
    },
    {
        .lvl = 26,
        .species = SPECIES_RATTATA,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt36[] = {
    {
        .lvl = 28,
        .species = SPECIES_WEEZING,
    },
    {
        .lvl = 28,
        .species = SPECIES_GOLBAT,
    },
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt37[] = {
    {
        .lvl = 28,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 28,
        .species = SPECIES_GRIMER,
    },
    {
        .lvl = 28,
        .species = SPECIES_MACHOP,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt38[] = {
    {
        .lvl = 28,
        .species = SPECIES_GOLBAT,
    },
    {
        .lvl = 28,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 28,
        .species = SPECIES_HYPNO,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt39[] = {
    {
        .lvl = 33,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt40[] = {
    {
        .lvl = 25,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 25,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 25,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 25,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 25,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt41[] = {
    {
        .lvl = 32,
        .species = SPECIES_CUBONE,
    },
    {
        .lvl = 32,
        .species = SPECIES_DROWZEE,
    },
    {
        .lvl = 32,
        .species = SPECIES_MAROWAK,
    },
};

static const struct TrainerMon sParty_CooltrainerSamuel[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_SANDSLASH,
        .moves = {MOVE_SLASH, MOVE_SWIFT, MOVE_SAND_ATTACK, MOVE_POISON_STING},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_SANDSLASH,
        .moves = {MOVE_SLASH, MOVE_SWIFT, MOVE_SAND_ATTACK, MOVE_POISON_STING},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_TAKE_DOWN, MOVE_ROCK_BLAST, MOVE_FURY_ATTACK, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 39,
        .species = SPECIES_NIDORINO,
        .moves = {MOVE_FURY_ATTACK, MOVE_HORN_ATTACK, MOVE_POISON_STING, MOVE_DOUBLE_KICK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 39,
        .species = SPECIES_NIDOKING,
        .moves = {MOVE_THRASH, MOVE_DOUBLE_KICK, MOVE_POISON_STING, MOVE_FOCUS_ENERGY},
    },
};

static const struct TrainerMon sParty_CooltrainerGeorge[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_EXEGGUTOR,
        .moves = {MOVE_EGG_BOMB, MOVE_CONFUSION, MOVE_STUN_SPORE, MOVE_SLEEP_POWDER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_SANDSLASH,
        .moves = {MOVE_FURY_SWIPES, MOVE_SWIFT, MOVE_POISON_STING, MOVE_SAND_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_CLOYSTER,
        .moves = {MOVE_SPIKE_CANNON, MOVE_SPIKES, MOVE_AURORA_BEAM, MOVE_SUPERSONIC},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_ELECTRODE,
        .moves = {MOVE_SPARK, MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_LIGHT_SCREEN},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_ARCANINE,
        .moves = {MOVE_FLAME_WHEEL, MOVE_ROAR, MOVE_BITE, MOVE_TAKE_DOWN},
    },
};

static const struct TrainerMon sParty_CooltrainerColby[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 41,
        .species = SPECIES_KINGLER,
        .moves = {MOVE_GUILLOTINE, MOVE_STOMP, MOVE_MUD_SHOT, MOVE_BUBBLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_POLIWHIRL,
        .moves = {MOVE_BODY_SLAM, MOVE_DOUBLE_SLAP, MOVE_WATER_GUN, MOVE_HYPNOSIS},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_TENTACRUEL,
        .moves = {MOVE_BARRIER, MOVE_WRAP, MOVE_BUBBLE_BEAM, MOVE_ACID},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_SEADRA,
        .moves = {MOVE_WATER_GUN, MOVE_SMOKESCREEN, MOVE_TWISTER, MOVE_LEER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 43,
        .species = SPECIES_BLASTOISE,
        .moves = {MOVE_WATER_GUN, MOVE_BITE, MOVE_RAPID_SPIN, MOVE_RAIN_DANCE},
    },
};

static const struct TrainerMon sParty_CooltrainerPaul[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_SLOWPOKE,
        .moves = {MOVE_HEADBUTT, MOVE_CONFUSION, MOVE_WATER_GUN, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_SHELLDER,
        .moves = {MOVE_AURORA_BEAM, MOVE_CLAMP, MOVE_SUPERSONIC, MOVE_LEER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_KINGLER,
        .moves = {MOVE_GUILLOTINE, MOVE_STOMP, MOVE_MUD_SHOT, MOVE_BUBBLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_STARMIE,
        .moves = {MOVE_BUBBLE_BEAM, MOVE_SWIFT, MOVE_RECOVER, MOVE_RAPID_SPIN},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_GOLDUCK,
        .moves = {MOVE_CONFUSION, MOVE_SCRATCH, MOVE_SCREECH, MOVE_DISABLE},
    },
};

static const struct TrainerMon sParty_CooltrainerRolando[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_RATICATE,
        .moves = {MOVE_SUPER_FANG, MOVE_PURSUIT, MOVE_SCARY_FACE, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_IVYSAUR,
        .moves = {MOVE_RAZOR_LEAF, MOVE_SLEEP_POWDER, MOVE_SWEET_SCENT, MOVE_SYNTHESIS},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_WARTORTLE,
        .moves = {MOVE_WATER_GUN, MOVE_BITE, MOVE_RAPID_SPIN, MOVE_TAIL_WHIP},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_CHARMELEON,
        .moves = {MOVE_FLAMETHROWER, MOVE_SLASH, MOVE_SMOKESCREEN, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_CHARIZARD,
        .moves = {MOVE_FLAMETHROWER, MOVE_WING_ATTACK, MOVE_SMOKESCREEN, MOVE_SCARY_FACE},
    },
};

static const struct TrainerMon sParty_CooltrainerGilbert[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PIDGEOTTO,
        .moves = {MOVE_WING_ATTACK, MOVE_FEATHER_DANCE, MOVE_WHIRLWIND, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_FEAROW,
        .moves = {MOVE_DRILL_PECK, MOVE_MIRROR_MOVE, MOVE_PURSUIT, MOVE_LEER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PERSIAN,
        .moves = {MOVE_PAY_DAY, MOVE_FAINT_ATTACK, MOVE_SCREECH, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_LICKITUNG,
        .moves = {MOVE_SLAM, MOVE_DISABLE, MOVE_WRAP, MOVE_SUPERSONIC},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_TAUROS,
        .moves = {MOVE_HORN_ATTACK, MOVE_SCARY_FACE, MOVE_SWAGGER, MOVE_TAIL_WHIP},
    },
};

static const struct TrainerMon sParty_CooltrainerOwen[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NIDORINO,
        .moves = {MOVE_SCRATCH, MOVE_POISON_STING, MOVE_DOUBLE_KICK, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NIDORINA,
        .moves = {MOVE_HORN_ATTACK, MOVE_POISON_STING, MOVE_DOUBLE_KICK, MOVE_LEER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_RATICATE,
        .moves = {MOVE_SUPER_FANG, MOVE_PURSUIT, MOVE_SCARY_FACE, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_SANDSLASH,
        .moves = {MOVE_FURY_SWIPES, MOVE_SWIFT, MOVE_SLASH, MOVE_POISON_STING},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_ROCK_BLAST, MOVE_SCARY_FACE, MOVE_STOMP, MOVE_TAIL_WHIP},
    },
};

static const struct TrainerMon sParty_CooltrainerBerke[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_SEEL,
        .moves = {MOVE_TAKE_DOWN, MOVE_AURORA_BEAM, MOVE_ICY_WIND, MOVE_GROWL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_GRAVELER,
        .moves = {MOVE_ROCK_BLAST, MOVE_MAGNITUDE, MOVE_ROCK_THROW, MOVE_MUD_SPORT},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_KINGLER,
        .moves = {MOVE_GUILLOTINE, MOVE_STOMP, MOVE_MUD_SHOT, MOVE_BUBBLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_ONIX,
        .moves = {MOVE_SLAM, MOVE_SANDSTORM, MOVE_DRAGON_BREATH, MOVE_ROCK_THROW},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_CLOYSTER,
        .moves = {MOVE_SPIKE_CANNON, MOVE_AURORA_BEAM, MOVE_SUPERSONIC, MOVE_PROTECT},
    },
};

static const struct TrainerMon sParty_CooltrainerYuji[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_SANDSLASH,
        .moves = {MOVE_SLASH, MOVE_SWIFT, MOVE_SAND_ATTACK, MOVE_POISON_STING},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_GRAVELER,
        .moves = {MOVE_ROCK_BLAST, MOVE_MAGNITUDE, MOVE_MUD_SPORT, MOVE_DEFENSE_CURL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_ONIX,
        .moves = {MOVE_DRAGON_BREATH, MOVE_SANDSTORM, MOVE_ROCK_THROW, MOVE_BIND},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_GRAVELER,
        .moves = {MOVE_ROCK_BLAST, MOVE_MAGNITUDE, MOVE_ROLLOUT, MOVE_DEFENSE_CURL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_MAROWAK,
        .moves = {MOVE_BONEMERANG, MOVE_HEADBUTT, MOVE_LEER, MOVE_GROWL},
    },
};

static const struct TrainerMon sParty_CooltrainerWarren[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_MAROWAK,
        .moves = {MOVE_BONEMERANG, MOVE_HEADBUTT, MOVE_LEER, MOVE_GROWL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_MAROWAK,
        .moves = {MOVE_BONEMERANG, MOVE_HEADBUTT, MOVE_LEER, MOVE_GROWL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_TAKE_DOWN, MOVE_ROCK_BLAST, MOVE_FURY_ATTACK, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 39,
        .species = SPECIES_NIDORINA,
        .moves = {MOVE_FURY_SWIPES, MOVE_BITE, MOVE_POISON_STING, MOVE_DOUBLE_KICK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 39,
        .species = SPECIES_NIDOQUEEN,
        .moves = {MOVE_BODY_SLAM, MOVE_BITE, MOVE_POISON_STING, MOVE_DOUBLE_KICK},
    },
};

static const struct TrainerMon sParty_CooltrainerMary[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_BELLSPROUT,
        .moves = {MOVE_WRAP, MOVE_STUN_SPORE, MOVE_POISON_POWDER, MOVE_GROWTH},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_ODDISH,
        .moves = {MOVE_POISON_POWDER, MOVE_STUN_SPORE, MOVE_ABSORB, MOVE_SWEET_SCENT},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_WEEPINBELL,
        .moves = {MOVE_VINE_WHIP, MOVE_STUN_SPORE, MOVE_POISON_POWDER, MOVE_GROWTH},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_GLOOM,
        .moves = {MOVE_ABSORB, MOVE_STUN_SPORE, MOVE_POISON_POWDER, MOVE_SWEET_SCENT},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_IVYSAUR,
        .moves = {MOVE_RAZOR_LEAF, MOVE_SLEEP_POWDER, MOVE_VINE_WHIP, MOVE_LEECH_SEED},
    },
};

static const struct TrainerMon sParty_CooltrainerCaroline[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_BELLSPROUT,
        .moves = {MOVE_RAZOR_LEAF, MOVE_ACID, MOVE_STUN_SPORE, MOVE_POISON_POWDER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_WEEPINBELL,
        .moves = {MOVE_RAZOR_LEAF, MOVE_ACID, MOVE_SLEEP_POWDER, MOVE_POISON_POWDER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_VICTREEBEL,
        .moves = {MOVE_RAZOR_LEAF, MOVE_ACID, MOVE_STUN_SPORE, MOVE_SLEEP_POWDER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PARAS,
        .moves = {MOVE_GROWTH, MOVE_SLASH, MOVE_LEECH_LIFE, MOVE_STUN_SPORE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PARASECT,
        .moves = {MOVE_SPORE, MOVE_SLASH, MOVE_LEECH_LIFE, MOVE_POISON_POWDER},
    },
};

static const struct TrainerMon sParty_CooltrainerAlexa[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_CLEFAIRY,
        .moves = {MOVE_LIGHT_SCREEN, MOVE_COSMIC_POWER, MOVE_DOUBLE_SLAP, MOVE_ENCORE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_JIGGLYPUFF,
        .moves = {MOVE_SING, MOVE_BODY_SLAM, MOVE_ROLLOUT, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PERSIAN,
        .moves = {MOVE_PAY_DAY, MOVE_FAINT_ATTACK, MOVE_BITE, MOVE_SCREECH},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_DEWGONG,
        .moves = {MOVE_SHEER_COLD, MOVE_TAKE_DOWN, MOVE_REST, MOVE_AURORA_BEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_CHANSEY,
        .moves = {MOVE_SING, MOVE_EGG_BOMB, MOVE_SOFT_BOILED, MOVE_MINIMIZE},
    },
};

static const struct TrainerMon sParty_CooltrainerShannon[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_BEEDRILL,
        .moves = {MOVE_PIN_MISSILE, MOVE_TWINEEDLE, MOVE_AGILITY, MOVE_PURSUIT},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_BUTTERFREE,
        .moves = {MOVE_SAFEGUARD, MOVE_PSYBEAM, MOVE_GUST, MOVE_SUPERSONIC},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PARASECT,
        .moves = {MOVE_SPORE, MOVE_LEECH_LIFE, MOVE_SLASH, MOVE_GROWTH},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_VENONAT,
        .moves = {MOVE_PSYBEAM, MOVE_STUN_SPORE, MOVE_LEECH_LIFE, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_VENOMOTH,
        .moves = {MOVE_PSYBEAM, MOVE_GUST, MOVE_SUPERSONIC, MOVE_LEECH_LIFE},
    },
};

static const struct TrainerMon sParty_CooltrainerNaomi[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PERSIAN,
        .moves = {MOVE_FURY_SWIPES, MOVE_SCREECH, MOVE_FAINT_ATTACK, MOVE_PAY_DAY},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PONYTA,
        .moves = {MOVE_AGILITY, MOVE_TAKE_DOWN, MOVE_FIRE_SPIN, MOVE_STOMP},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_RAPIDASH,
        .moves = {MOVE_FURY_ATTACK, MOVE_FIRE_SPIN, MOVE_STOMP, MOVE_GROWL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_VULPIX,
        .moves = {MOVE_FLAMETHROWER, MOVE_CONFUSE_RAY, MOVE_QUICK_ATTACK, MOVE_IMPRISON},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NINETALES,
        .moves = {MOVE_SAFEGUARD, MOVE_WILL_O_WISP, MOVE_CONFUSE_RAY, MOVE_FIRE_SPIN},
    },
};

static const struct TrainerMon sParty_CooltrainerBrooke[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_TANGELA,
        .moves = {MOVE_SLAM, MOVE_BIND, MOVE_MEGA_DRAIN, MOVE_INGRAIN},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_GLOOM,
        .moves = {MOVE_ACID, MOVE_MOONLIGHT, MOVE_SLEEP_POWDER, MOVE_STUN_SPORE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_VILEPLUME,
        .moves = {MOVE_MEGA_DRAIN, MOVE_ACID, MOVE_STUN_SPORE, MOVE_AROMATHERAPY},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_IVYSAUR,
        .moves = {MOVE_RAZOR_LEAF, MOVE_SWEET_SCENT, MOVE_GROWL, MOVE_LEECH_SEED},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_VENUSAUR,
        .moves = {MOVE_RAZOR_LEAF, MOVE_GROWTH, MOVE_SLEEP_POWDER, MOVE_POISON_POWDER},
    },
};

static const struct TrainerMon sParty_CooltrainerAustina[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_HORN_DRILL, MOVE_ROCK_BLAST, MOVE_SCARY_FACE, MOVE_STOMP},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NIDORINA,
        .moves = {MOVE_DOUBLE_KICK, MOVE_FURY_SWIPES, MOVE_BITE, MOVE_FLATTER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NIDOQUEEN,
        .moves = {MOVE_BODY_SLAM, MOVE_DOUBLE_KICK, MOVE_BITE, MOVE_GROWL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NIDORINO,
        .moves = {MOVE_HORN_ATTACK, MOVE_POISON_STING, MOVE_FOCUS_ENERGY, MOVE_LEER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NIDOKING,
        .moves = {MOVE_THRASH, MOVE_DOUBLE_KICK, MOVE_POISON_STING, MOVE_PECK},
    },
};

static const struct TrainerMon sParty_CooltrainerJulie[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PERSIAN,
        .moves = {MOVE_FURY_SWIPES, MOVE_BITE, MOVE_SCREECH, MOVE_FAINT_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_NINETALES,
        .moves = {MOVE_FLAMETHROWER, MOVE_WILL_O_WISP, MOVE_CONFUSE_RAY, MOVE_GRUDGE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_RAPIDASH,
        .moves = {MOVE_FURY_ATTACK, MOVE_FIRE_SPIN, MOVE_TAKE_DOWN, MOVE_AGILITY},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_PIKACHU,
        .moves = {MOVE_THUNDERBOLT, MOVE_THUNDER_WAVE, MOVE_DOUBLE_TEAM, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 42,
        .species = SPECIES_RAICHU,
        .moves = {MOVE_THUNDER, MOVE_THUNDER_WAVE, MOVE_SLAM, MOVE_DOUBLE_TEAM},
    },
};

static const struct TrainerMon sParty_EliteFourLorelei[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 52,
        .species = SPECIES_NINETALES_ALOLAN,
        .ability = ABILITY_SNOW_WARNING,
        .heldItem = ITEM_ICY_ROCK,
        .nature = NATURE_TIMID,
        .moves = {MOVE_BLIZZARD, MOVE_MOONBLAST, MOVE_AURORA_VEIL, MOVE_CHILLING_WATER},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 51,
        .species = SPECIES_GLACEON,
        .ability = ABILITY_SNOW_CLOAK,
        .heldItem = ITEM_CHOICE_SPECS,
        .nature = NATURE_TIMID,
        .moves = {MOVE_ICE_BEAM, MOVE_SHADOW_BALL, MOVE_BLIZZARD, MOVE_ALLURING_VOICE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 52,
        .species = SPECIES_CLOYSTER,
        .ability = ABILITY_SKILL_LINK,
        .heldItem = ITEM_FOCUS_SASH,
        .nature = NATURE_JOLLY,
        .moves = {MOVE_SHELL_SMASH, MOVE_ICICLE_SPEAR, MOVE_ICE_SHARD, MOVE_SPIKES},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 54,
        .species = SPECIES_MR_RIME,
        .ability = ABILITY_ICE_BODY,
        .heldItem = ITEM_LIGHT_CLAY,
        .nature = NATURE_MODEST,
        .moves = {MOVE_HAIL, MOVE_PSYCHIC, MOVE_FREEZE_DRY, MOVE_ICE_BEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 54,
        .species = SPECIES_ARTICUNO,
        .ability = ABILITY_SNOW_CLOAK,
        .heldItem = ITEM_HEAVY_DUTY_BOOTS,
        .nature = NATURE_TIMID,
        .moves = {MOVE_BLIZZARD, MOVE_ROOST, MOVE_EXTRASENSORY, MOVE_ICE_BEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 54,
        .species = SPECIES_LAPRAS,
        .ability = ABILITY_SHELL_ARMOR,
        .heldItem = ITEM_LEFTOVERS,
        .nature = NATURE_CALM,
        .moves = {MOVE_SURF, MOVE_ICE_BEAM, MOVE_CALM_MIND, MOVE_PERISH_SONG},
    },
};

static const struct TrainerMon sParty_EliteFourBruno[] = {
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 51,
        .species = SPECIES_ONIX,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_EARTHQUAKE, MOVE_ROCK_TOMB, MOVE_IRON_TAIL, MOVE_ROAR},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 53,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SKY_UPPERCUT, MOVE_MACH_PUNCH, MOVE_ROCK_TOMB, MOVE_COUNTER},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 53,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_MEGA_KICK, MOVE_FORESIGHT, MOVE_BRICK_BREAK, MOVE_FACADE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 54,
        .species = SPECIES_ONIX,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_DOUBLE_EDGE, MOVE_EARTHQUAKE, MOVE_IRON_TAIL, MOVE_SAND_TOMB},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 56,
        .species = SPECIES_MACHAMP,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_CROSS_CHOP, MOVE_BULK_UP, MOVE_SCARY_FACE, MOVE_ROCK_TOMB},
    },
};

static const struct TrainerMon sParty_EliteFourAgatha[] = {
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 54,
        .species = SPECIES_GENGAR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SHADOW_PUNCH, MOVE_CONFUSE_RAY, MOVE_TOXIC, MOVE_DOUBLE_TEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 54,
        .species = SPECIES_GOLBAT,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_CONFUSE_RAY, MOVE_POISON_FANG, MOVE_AIR_CUTTER, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 53,
        .species = SPECIES_HAUNTER,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPNOSIS, MOVE_DREAM_EATER, MOVE_CURSE, MOVE_MEAN_LOOK},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 56,
        .species = SPECIES_ARBOK,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SLUDGE_BOMB, MOVE_SCREECH, MOVE_IRON_TAIL, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 58,
        .species = SPECIES_GENGAR,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_SHADOW_BALL, MOVE_SLUDGE_BOMB, MOVE_HYPNOSIS, MOVE_NIGHTMARE},
    },
};

static const struct TrainerMon sParty_EliteFourLance[] = {
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 56,
        .species = SPECIES_GYARADOS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_DRAGON_RAGE, MOVE_TWISTER, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 54,
        .species = SPECIES_DRAGONAIR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_SAFEGUARD, MOVE_DRAGON_RAGE, MOVE_OUTRAGE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 54,
        .species = SPECIES_DRAGONAIR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_SAFEGUARD, MOVE_THUNDER_WAVE, MOVE_OUTRAGE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 58,
        .species = SPECIES_AERODACTYL,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_ANCIENT_POWER, MOVE_WING_ATTACK, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 60,
        .species = SPECIES_DRAGONITE,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_HYPER_BEAM, MOVE_SAFEGUARD, MOVE_OUTRAGE, MOVE_WING_ATTACK},
    },
};

static const struct TrainerMon sParty_LeaderBrock[] = {
    {
        .lvl = 12,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_TACKLE, MOVE_DEFENSE_CURL, MOVE_NONE, MOVE_NONE},
    },
    {
        .lvl = 14,
        .species = SPECIES_ONIX,
        .moves = {MOVE_TACKLE, MOVE_BIND, MOVE_ROCK_TOMB, MOVE_NONE},
    },
};

static const struct TrainerMon sParty_LeaderMisty[] = {
    {
        .lvl = 18,
        .species = SPECIES_STARYU,
        .moves = {MOVE_TACKLE, MOVE_HARDEN, MOVE_RECOVER, MOVE_WATER_PULSE},
    },
    {
        .lvl = 21,
        .species = SPECIES_STARMIE,
        .moves = {MOVE_SWIFT, MOVE_RECOVER, MOVE_RAPID_SPIN, MOVE_WATER_PULSE},
    },
};

static const struct TrainerMon sParty_LeaderLtSurge[] = {
    {
        .lvl = 21,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SONIC_BOOM, MOVE_TACKLE, MOVE_SCREECH, MOVE_SHOCK_WAVE},
    },
    {
        .lvl = 18,
        .species = SPECIES_PIKACHU,
        .moves = {MOVE_QUICK_ATTACK, MOVE_THUNDER_WAVE, MOVE_DOUBLE_TEAM, MOVE_SHOCK_WAVE},
    },
    {
        .lvl = 24,
        .species = SPECIES_RAICHU,
        .moves = {MOVE_QUICK_ATTACK, MOVE_THUNDER_WAVE, MOVE_DOUBLE_TEAM, MOVE_SHOCK_WAVE},
    },
};

static const struct TrainerMon sParty_LeaderErika[] = {
    {
        .lvl = 29,
        .species = SPECIES_VICTREEBEL,
        .moves = {MOVE_STUN_SPORE, MOVE_ACID, MOVE_POISON_POWDER, MOVE_GIGA_DRAIN},
    },
    {
        .lvl = 24,
        .species = SPECIES_TANGELA,
        .moves = {MOVE_POISON_POWDER, MOVE_CONSTRICT, MOVE_INGRAIN, MOVE_GIGA_DRAIN},
    },
    {
        .lvl = 29,
        .species = SPECIES_VILEPLUME,
        .moves = {MOVE_SLEEP_POWDER, MOVE_ACID, MOVE_STUN_SPORE, MOVE_GIGA_DRAIN},
    },
};

static const struct TrainerMon sParty_LeaderKoga[] = {
    {
        .lvl = 37,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SELF_DESTRUCT, MOVE_SLUDGE, MOVE_SMOKESCREEN, MOVE_TOXIC},
    },
    {
        .lvl = 39,
        .species = SPECIES_MUK,
        .moves = {MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_ACID_ARMOR, MOVE_TOXIC},
    },
    {
        .lvl = 37,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SELF_DESTRUCT, MOVE_SLUDGE, MOVE_SMOKESCREEN, MOVE_TOXIC},
    },
    {
        .lvl = 43,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_TACKLE, MOVE_SLUDGE, MOVE_SMOKESCREEN, MOVE_TOXIC},
    },
};

static const struct TrainerMon sParty_LeaderBlaine[] = {
    {
        .lvl = 42,
        .species = SPECIES_GROWLITHE,
        .moves = {MOVE_BITE, MOVE_ROAR, MOVE_TAKE_DOWN, MOVE_FIRE_BLAST},
    },
    {
        .lvl = 40,
        .species = SPECIES_PONYTA,
        .moves = {MOVE_STOMP, MOVE_BOUNCE, MOVE_FIRE_SPIN, MOVE_FIRE_BLAST},
    },
    {
        .lvl = 42,
        .species = SPECIES_RAPIDASH,
        .moves = {MOVE_STOMP, MOVE_BOUNCE, MOVE_FIRE_SPIN, MOVE_FIRE_BLAST},
    },
    {
        .lvl = 47,
        .species = SPECIES_ARCANINE,
        .moves = {MOVE_BITE, MOVE_ROAR, MOVE_TAKE_DOWN, MOVE_FIRE_BLAST},
    },
};

static const struct TrainerMon sParty_LeaderSabrina[] = {
    {
        .lvl = 38,
        .species = SPECIES_KADABRA,
        .moves = {MOVE_PSYBEAM, MOVE_REFLECT, MOVE_FUTURE_SIGHT, MOVE_CALM_MIND},
    },
    {
        .lvl = 37,
        .species = SPECIES_MR_MIME,
        .moves = {MOVE_BARRIER, MOVE_PSYBEAM, MOVE_BATON_PASS, MOVE_CALM_MIND},
    },
    {
        .lvl = 38,
        .species = SPECIES_VENOMOTH,
        .moves = {MOVE_PSYBEAM, MOVE_GUST, MOVE_LEECH_LIFE, MOVE_SUPERSONIC},
    },
    {
        .lvl = 43,
        .species = SPECIES_ALAKAZAM,
        .moves = {MOVE_PSYCHIC, MOVE_RECOVER, MOVE_FUTURE_SIGHT, MOVE_CALM_MIND},
    },
};

static const struct TrainerMon sParty_GentlemanThomas[] = {
    {
        .lvl = 18,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 18,
        .species = SPECIES_GROWLITHE,
    },
};

static const struct TrainerMon sParty_GentlemanArthur[] = {
    {
        .lvl = 19,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 19,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_GentlemanTucker[] = {
    {
        .lvl = 23,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_GentlemanNorton[] = {
    {
        .lvl = 48,
        .species = SPECIES_PERSIAN,
    },
};

static const struct TrainerMon sParty_GentlemanWalter[] = {
    {
        .lvl = 17,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 17,
        .species = SPECIES_PONYTA,
    },
};

static const struct TrainerMon sParty_RivalSsAnneSquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 19,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 16,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 18,
        .species = SPECIES_KADABRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 20,
        .species = SPECIES_WARTORTLE,
    },
};

static const struct TrainerMon sParty_RivalSsAnneBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 19,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 16,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 18,
        .species = SPECIES_KADABRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 20,
        .species = SPECIES_IVYSAUR,
    },
};

static const struct TrainerMon sParty_RivalSsAnneCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 19,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 16,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 18,
        .species = SPECIES_KADABRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 20,
        .species = SPECIES_CHARMELEON,
    },
};

static const struct TrainerMon sParty_RivalPokemonTowerSquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 25,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 23,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_EXEGGCUTE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 20,
        .species = SPECIES_KADABRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 25,
        .species = SPECIES_WARTORTLE,
    },
};

static const struct TrainerMon sParty_RivalPokemonTowerBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 25,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 23,
        .species = SPECIES_GYARADOS,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 20,
        .species = SPECIES_KADABRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 25,
        .species = SPECIES_IVYSAUR,
    },
};

static const struct TrainerMon sParty_RivalPokemonTowerCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 25,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 23,
        .species = SPECIES_EXEGGCUTE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 22,
        .species = SPECIES_GYARADOS,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 20,
        .species = SPECIES_KADABRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 25,
        .species = SPECIES_CHARMELEON,
    },
};

static const struct TrainerMon sParty_RivalSilphSquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 35,
        .species = SPECIES_EXEGGCUTE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 35,
        .species = SPECIES_ALAKAZAM,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 40,
        .species = SPECIES_BLASTOISE,
    },
};

static const struct TrainerMon sParty_RivalSilphBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_GYARADOS,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 35,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 35,
        .species = SPECIES_ALAKAZAM,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 40,
        .species = SPECIES_VENUSAUR,
    },
};

static const struct TrainerMon sParty_RivalSilphCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_EXEGGCUTE,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 35,
        .species = SPECIES_GYARADOS,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 35,
        .species = SPECIES_ALAKAZAM,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 40,
        .species = SPECIES_CHARIZARD,
    },
};

static const struct TrainerMon sParty_RivalRoute22LateSquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 47,
        .species = SPECIES_PIDGEOT,
        .moves = {MOVE_FEATHER_DANCE, MOVE_WING_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_TAKE_DOWN, MOVE_HORN_DRILL, MOVE_ROCK_BLAST, MOVE_FURY_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_GROWLITHE,
        .moves = {MOVE_FLAME_WHEEL, MOVE_TAKE_DOWN, MOVE_LEER, MOVE_AGILITY},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_EXEGGCUTE,
        .moves = {MOVE_SOLAR_BEAM, MOVE_SLEEP_POWDER, MOVE_POISON_POWDER, MOVE_STUN_SPORE},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 47,
        .species = SPECIES_ALAKAZAM,
        .moves = {MOVE_PSYCHIC, MOVE_CALM_MIND, MOVE_FUTURE_SIGHT, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 53,
        .species = SPECIES_BLASTOISE,
        .moves = {MOVE_WATER_GUN, MOVE_RAIN_DANCE, MOVE_BITE, MOVE_RAPID_SPIN},
    },
};

static const struct TrainerMon sParty_RivalRoute22LateBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 47,
        .species = SPECIES_PIDGEOT,
        .moves = {MOVE_FEATHER_DANCE, MOVE_WING_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_TAKE_DOWN, MOVE_HORN_DRILL, MOVE_ROCK_BLAST, MOVE_FURY_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_GYARADOS,
        .moves = {MOVE_HYDRO_PUMP, MOVE_TWISTER, MOVE_LEER, MOVE_RAIN_DANCE},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_GROWLITHE,
        .moves = {MOVE_FLAME_WHEEL, MOVE_TAKE_DOWN, MOVE_LEER, MOVE_AGILITY},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 47,
        .species = SPECIES_ALAKAZAM,
        .moves = {MOVE_PSYCHIC, MOVE_CALM_MIND, MOVE_FUTURE_SIGHT, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 53,
        .species = SPECIES_VENUSAUR,
        .moves = {MOVE_RAZOR_LEAF, MOVE_SWEET_SCENT, MOVE_GROWTH, MOVE_SYNTHESIS},
    },
};

static const struct TrainerMon sParty_RivalRoute22LateCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 47,
        .species = SPECIES_PIDGEOT,
        .moves = {MOVE_FEATHER_DANCE, MOVE_WING_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_RHYHORN,
        .moves = {MOVE_TAKE_DOWN, MOVE_HORN_DRILL, MOVE_ROCK_BLAST, MOVE_FURY_ATTACK},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_EXEGGCUTE,
        .moves = {MOVE_SOLAR_BEAM, MOVE_SLEEP_POWDER, MOVE_POISON_POWDER, MOVE_STUN_SPORE},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 45,
        .species = SPECIES_GYARADOS,
        .moves = {MOVE_HYDRO_PUMP, MOVE_TWISTER, MOVE_LEER, MOVE_RAIN_DANCE},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 47,
        .species = SPECIES_ALAKAZAM,
        .moves = {MOVE_PSYCHIC, MOVE_CALM_MIND, MOVE_FUTURE_SIGHT, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(30, 30, 30, 30, 30, 30),
        .lvl = 53,
        .species = SPECIES_CHARIZARD,
        .moves = {MOVE_FLAMETHROWER, MOVE_WING_ATTACK, MOVE_SLASH, MOVE_SCARY_FACE},
    },
};

static const struct TrainerMon sParty_ChampionFirstSquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_PIDGEOT,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_AERIAL_ACE, MOVE_FEATHER_DANCE, MOVE_SAND_ATTACK, MOVE_WHIRLWIND},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 57,
        .species = SPECIES_ALAKAZAM,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_PSYCHIC, MOVE_FUTURE_SIGHT, MOVE_RECOVER, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_RHYDON,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_TAKE_DOWN, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_ARCANINE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_EXTREME_SPEED, MOVE_FLAMETHROWER, MOVE_ROAR, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 61,
        .species = SPECIES_EXEGGUTOR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_GIGA_DRAIN, MOVE_EGG_BOMB, MOVE_SLEEP_POWDER, MOVE_LIGHT_SCREEN},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 63,
        .species = SPECIES_BLASTOISE,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_HYDRO_PUMP, MOVE_RAIN_DANCE, MOVE_SKULL_BASH, MOVE_BITE},
    },
};

static const struct TrainerMon sParty_ChampionFirstBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_PIDGEOT,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_AERIAL_ACE, MOVE_FEATHER_DANCE, MOVE_SAND_ATTACK, MOVE_WHIRLWIND},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 57,
        .species = SPECIES_ALAKAZAM,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_PSYCHIC, MOVE_FUTURE_SIGHT, MOVE_RECOVER, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_RHYDON,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_TAKE_DOWN, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_GYARADOS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYDRO_PUMP, MOVE_DRAGON_RAGE, MOVE_BITE, MOVE_THRASH},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 61,
        .species = SPECIES_ARCANINE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_EXTREME_SPEED, MOVE_FLAMETHROWER, MOVE_ROAR, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 63,
        .species = SPECIES_VENUSAUR,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_SOLAR_BEAM, MOVE_SYNTHESIS, MOVE_SUNNY_DAY, MOVE_GROWTH},
    },
};

static const struct TrainerMon sParty_ChampionFirstCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_PIDGEOT,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_AERIAL_ACE, MOVE_FEATHER_DANCE, MOVE_SAND_ATTACK, MOVE_WHIRLWIND},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 57,
        .species = SPECIES_ALAKAZAM,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_PSYCHIC, MOVE_FUTURE_SIGHT, MOVE_RECOVER, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_RHYDON,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_TAKE_DOWN, MOVE_EARTHQUAKE, MOVE_ROCK_TOMB, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 59,
        .species = SPECIES_EXEGGUTOR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_GIGA_DRAIN, MOVE_EGG_BOMB, MOVE_SLEEP_POWDER, MOVE_LIGHT_SCREEN},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 61,
        .species = SPECIES_GYARADOS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYDRO_PUMP, MOVE_DRAGON_RAGE, MOVE_BITE, MOVE_THRASH},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 63,
        .species = SPECIES_CHARIZARD,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_FIRE_BLAST, MOVE_AERIAL_ACE, MOVE_SLASH, MOVE_FIRE_SPIN},
    },
};

static const struct TrainerMon sParty_ChannelerPatricia[] = {
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerCarly[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerHope[] = {
    {
        .lvl = 23,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerPaula[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerLaurel[] = {
    {
        .lvl = 23,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 23,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerJody[] = {
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerTammy[] = {
    {
        .lvl = 23,
        .species = SPECIES_HAUNTER,
    },
};

static const struct TrainerMon sParty_ChannelerRuth[] = {
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerKarina[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerJanae[] = {
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerAngelica[] = {
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerEmilia[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerJennifer[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_Channeler1[] = {
    {
        .lvl = 23,
        .species = SPECIES_HAUNTER,
    },
};

static const struct TrainerMon sParty_Channeler2[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_Channeler3[] = {
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_Channeler4[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_Channeler5[] = {
    {
        .lvl = 22,
        .species = SPECIES_HAUNTER,
    },
};

static const struct TrainerMon sParty_Channeler6[] = {
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 22,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_Channeler7[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_Channeler8[] = {
    {
        .lvl = 24,
        .species = SPECIES_GASTLY,
    },
};

static const struct TrainerMon sParty_ChannelerAmanda[] = {
    {
        .lvl = 34,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 34,
        .species = SPECIES_HAUNTER,
    },
};

static const struct TrainerMon sParty_ChannelerStacy[] = {
    {
        .lvl = 38,
        .species = SPECIES_HAUNTER,
    },
};

static const struct TrainerMon sParty_ChannelerTasha[] = {
    {
        .lvl = 33,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 33,
        .species = SPECIES_GASTLY,
    },
    {
        .lvl = 33,
        .species = SPECIES_HAUNTER,
    },
};

static const struct TrainerMon sParty_HikerJeremy[] = {
    {
        .lvl = 20,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 20,
        .species = SPECIES_ONIX,
    },
};

static const struct TrainerMon sParty_PicnickerAlma[] = {
    {
        .lvl = 28,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 28,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 28,
        .species = SPECIES_HORSEA,
    },
};

static const struct TrainerMon sParty_PicnickerSusie[] = {
    {
        .lvl = 24,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 24,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 24,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 24,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 24,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_PicnickerValerie[] = {
    {
        .lvl = 30,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 30,
        .species = SPECIES_POLIWAG,
    },
};

static const struct TrainerMon sParty_PicnickerGwen[] = {
    {
        .lvl = 27,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 27,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 27,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 27,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_BikerVirgil[] = {
    {
        .lvl = 28,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
    {
        .lvl = 28,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_CamperFlint[] = {
    {
        .lvl = 14,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 14,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_PicnickerMissy[] = {
    {
        .lvl = 31,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 31,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_PicnickerIrene[] = {
    {
        .lvl = 30,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 30,
        .species = SPECIES_HORSEA,
    },
    {
        .lvl = 30,
        .species = SPECIES_SEEL,
    },
};

static const struct TrainerMon sParty_PicnickerDana[] = {
    {
        .lvl = 20,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 20,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 20,
        .species = SPECIES_PIDGEY,
    },
};

static const struct TrainerMon sParty_PicnickerAriana[] = {
    {
        .lvl = 19,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 19,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 19,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 19,
        .species = SPECIES_BELLSPROUT,
    },
};

static const struct TrainerMon sParty_PicnickerLeah[] = {
    {
        .lvl = 22,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 22,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_CamperJustin[] = {
    {
        .lvl = 29,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 29,
        .species = SPECIES_NIDORINO,
    },
};

static const struct TrainerMon sParty_PicnickerYazmin[] = {
    {
        .lvl = 29,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 29,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 29,
        .species = SPECIES_TANGELA,
    },
};

static const struct TrainerMon sParty_PicnickerKindra[] = {
    {
        .lvl = 28,
        .species = SPECIES_GLOOM,
    },
    {
        .lvl = 28,
        .species = SPECIES_ODDISH,
    },
    {
        .lvl = 28,
        .species = SPECIES_ODDISH,
    },
};

static const struct TrainerMon sParty_PicnickerBecky[] = {
    {
        .lvl = 29,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 29,
        .species = SPECIES_RAICHU,
    },
};

static const struct TrainerMon sParty_PicnickerCelia[] = {
    {
        .lvl = 33,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_GentlemanBrooks[] = {
    {
        .lvl = 23,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_GentlemanLamar[] = {
    {
        .lvl = 17,
        .species = SPECIES_GROWLITHE,
    },
    {
        .lvl = 17,
        .species = SPECIES_PONYTA,
    },
};

static const struct TrainerMon sParty_TwinsEliAnne[] = {
    {
        .lvl = 22,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .lvl = 22,
        .species = SPECIES_JIGGLYPUFF,
    },
};

static const struct TrainerMon sParty_CoolCoupleRayTyra[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 45,
        .species = SPECIES_NIDOQUEEN,
        .moves = {MOVE_SUPERPOWER, MOVE_BODY_SLAM, MOVE_DOUBLE_KICK, MOVE_POISON_STING},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 45,
        .species = SPECIES_NIDOKING,
        .moves = {MOVE_MEGAHORN, MOVE_THRASH, MOVE_DOUBLE_KICK, MOVE_POISON_STING},
    },
};

static const struct TrainerMon sParty_YoungCoupleGiaJes[] = {
    {
        .lvl = 24,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .lvl = 24,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_TwinsKiriJan[] = {
    {
        .lvl = 29,
        .species = SPECIES_CHARMANDER,
    },
    {
        .lvl = 29,
        .species = SPECIES_SQUIRTLE,
    },
};

static const struct TrainerMon sParty_CrushKinRonMya[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 29,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 29,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_YoungCoupleLeaJed[] = {
    {
        .lvl = 29,
        .species = SPECIES_RAPIDASH,
    },
    {
        .lvl = 29,
        .species = SPECIES_NINETALES,
    },
};

static const struct TrainerMon sParty_SisAndBroLiaLuc[] = {
    {
        .lvl = 30,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 30,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_SisAndBroLilIan[] = {
    {
        .lvl = 33,
        .species = SPECIES_SEADRA,
    },
    {
        .lvl = 33,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_BugCatcher3[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BugCatcher4[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BugCatcher5[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BugCatcher6[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BugCatcher7[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_BugCatcher8[] = {DUMMY_TRAINER_MON};

static const struct TrainerMon sParty_YoungsterBen3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_EKANS,
    },
};

static const struct TrainerMon sParty_YoungsterBen4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 48,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 48,
        .species = SPECIES_ARBOK,
    },
};

static const struct TrainerMon sParty_YoungsterChad2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 20,
        .species = SPECIES_EKANS,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 20,
        .species = SPECIES_SANDSHREW,
    },
};

static const struct TrainerMon sParty_LassReli2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 20,
        .species = SPECIES_PIDGEY,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 20,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_LassReli3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_NIDORINA,
    },
};

static const struct TrainerMon sParty_YoungsterTimmy2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 19,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 19,
        .species = SPECIES_EKANS,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 19,
        .species = SPECIES_ZUBAT,
    },
};

static const struct TrainerMon sParty_YoungsterTimmy3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_EKANS,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_GOLBAT,
    },
};

static const struct TrainerMon sParty_YoungsterTimmy4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_ARBOK,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_GOLBAT,
    },
};

static const struct TrainerMon sParty_YoungsterChad3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_ARBOK,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_SANDSHREW,
    },
};

static const struct TrainerMon sParty_LassJanice2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 20,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 20,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_LassJanice3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_YoungsterChad4[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_ARBOK,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_SANDSLASH,
    },
};

static const struct TrainerMon sParty_HikerFranklin2[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 25,
        .species = SPECIES_MACHOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 25,
        .species = SPECIES_GRAVELER,
    },
};

static const struct TrainerMon sParty_PkmnProfProfOak[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_PlayerBrendan[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_PlayerMay[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_PlayerRed[] = {DUMMY_TRAINER_MON};
static const struct TrainerMon sParty_PlayerLeaf[] = {DUMMY_TRAINER_MON};

static const struct TrainerMon sParty_TeamRocketGrunt42[] = {
    {
        .lvl = 49,
        .species = SPECIES_HOUNDOUR,
    },
    {
        .lvl = 49,
        .species = SPECIES_HOUNDOUR,
    },
};

static const struct TrainerMon sParty_PsychicJaclyn[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_NATU,
        .moves = {MOVE_NIGHT_SHADE, MOVE_CONFUSE_RAY, MOVE_FUTURE_SIGHT, MOVE_WISH},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_SLOWBRO,
        .moves = {MOVE_PSYCHIC, MOVE_HEADBUTT, MOVE_AMNESIA, MOVE_YAWN},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 49,
        .species = SPECIES_KADABRA,
        .moves = {MOVE_PSYCHIC, MOVE_FUTURE_SIGHT, MOVE_RECOVER, MOVE_REFLECT},
    },
};

static const struct TrainerMon sParty_CrushGirlSharon[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 37,
        .species = SPECIES_MANKEY,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 37,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_TuberAmira[] = {
    {
        .lvl = 34,
        .species = SPECIES_POLIWAG,
    },
    {
        .lvl = 35,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .lvl = 34,
        .species = SPECIES_POLIWAG,
    },
};

static const struct TrainerMon sParty_PkmnBreederAlize[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 48,
        .species = SPECIES_PIKACHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 48,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 48,
        .species = SPECIES_MARILL,
    },
};

static const struct TrainerMon sParty_PkmnRangerNicolas[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 51,
        .species = SPECIES_WEEPINBELL,
        .moves = {MOVE_RAZOR_LEAF, MOVE_ACID, MOVE_SWEET_SCENT, MOVE_WRAP},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 51,
        .species = SPECIES_VICTREEBEL,
        .moves = {MOVE_RAZOR_LEAF, MOVE_ACID, MOVE_SLEEP_POWDER, MOVE_STUN_SPORE},
    },
};

static const struct TrainerMon sParty_PkmnRangerMadeline[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 51,
        .species = SPECIES_GLOOM,
        .moves = {MOVE_PETAL_DANCE, MOVE_ACID, MOVE_SWEET_SCENT, MOVE_POISON_POWDER},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 51,
        .species = SPECIES_VILEPLUME,
        .moves = {MOVE_PETAL_DANCE, MOVE_MOONLIGHT, MOVE_ACID, MOVE_STUN_SPORE},
    },
};

static const struct TrainerMon sParty_AromaLadyNikki[] = {
    {
        .lvl = 37,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .lvl = 37,
        .species = SPECIES_WEEPINBELL,
    },
};

static const struct TrainerMon sParty_RuinManiacStanly[] = {
    {
        .lvl = 48,
        .species = SPECIES_GRAVELER,
    },
    {
        .lvl = 48,
        .species = SPECIES_ONIX,
    },
    {
        .lvl = 48,
        .species = SPECIES_GRAVELER,
    },
};

static const struct TrainerMon sParty_LadyJacki[] = {
    {
        .lvl = 48,
        .species = SPECIES_HOPPIP,
        .heldItem = ITEM_STARDUST,
    },
    {
        .lvl = 50,
        .species = SPECIES_SKIPLOOM,
        .heldItem = ITEM_STARDUST,
    },
};

static const struct TrainerMon sParty_PainterDaisy[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 50,
        .species = SPECIES_SMEARGLE,
        .moves = {MOVE_DYNAMIC_PUNCH, MOVE_DIZZY_PUNCH, MOVE_FOCUS_PUNCH, MOVE_MEGA_PUNCH},
    },
};

static const struct TrainerMon sParty_BikerGoon[] = {
    {
        .lvl = 37,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_HAZE, MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_TACKLE},
    },
    {
        .lvl = 37,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_ACID_ARMOR, MOVE_SCREECH, MOVE_MINIMIZE, MOVE_SLUDGE},
    },
};

static const struct TrainerMon sParty_BikerGoon2[] = {
    {
        .lvl = 38,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_HAZE, MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_TACKLE},
    },
};

static const struct TrainerMon sParty_BikerGoon3[] = {
    {
        .lvl = 38,
        .species = SPECIES_GRIMER,
    },
};

static const struct TrainerMon sParty_Biker2[] = {DUMMY_TRAINER_MON};

static const struct TrainerMon sParty_BugCatcherAnthony[] = {
    {
        .lvl = 7,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 8,
        .species = SPECIES_CATERPIE,
    },
};

static const struct TrainerMon sParty_BugCatcherCharlie[] = {
    {
        .lvl = 7,
        .species = SPECIES_METAPOD,
    },
    {
        .lvl = 7,
        .species = SPECIES_CATERPIE,
    },
    {
        .lvl = 7,
        .species = SPECIES_METAPOD,
    },
};

static const struct TrainerMon sParty_TwinsEliAnne2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_JIGGLYPUFF,
    },
};

static const struct TrainerMon sParty_YoungsterJohnson[] = {
    {
        .lvl = 33,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 33,
        .species = SPECIES_EKANS,
    },
    {
        .lvl = 34,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_BikerRicardo[] = {
    {
        .lvl = 22,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE, MOVE_POISON_GAS},
    },
    {
        .lvl = 22,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_SLUDGE, MOVE_SMOG, MOVE_TACKLE, MOVE_POISON_GAS},
    },
    {
        .lvl = 23,
        .species = SPECIES_GRIMER,
        .moves = {MOVE_MINIMIZE, MOVE_SLUDGE, MOVE_DISABLE, MOVE_POUND},
    },
};

static const struct TrainerMon sParty_BikerJaren[] = {
    {
        .lvl = 24,
        .species = SPECIES_GRIMER,
    },
    {
        .lvl = 24,
        .species = SPECIES_GRIMER,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt43[] = {
    {
        .lvl = 37,
        .species = SPECIES_CUBONE,
    },
    {
        .lvl = 37,
        .species = SPECIES_MAROWAK,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt44[] = {
    {
        .lvl = 35,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 35,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 35,
        .species = SPECIES_SANDSHREW,
    },
    {
        .lvl = 35,
        .species = SPECIES_SANDSLASH,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt45[] = {
    {
        .lvl = 38,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 38,
        .species = SPECIES_ZUBAT,
    },
    {
        .lvl = 38,
        .species = SPECIES_GOLBAT,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt46[] = {
    {
        .lvl = 48,
        .species = SPECIES_MUK,
    },
    {
        .lvl = 48,
        .species = SPECIES_GOLBAT,
    },
    {
        .lvl = 48,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt47[] = {
    {
        .lvl = 48,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 48,
        .species = SPECIES_MACHOP,
    },
    {
        .lvl = 48,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt48[] = {
    {
        .lvl = 49,
        .species = SPECIES_HYPNO,
    },
    {
        .lvl = 49,
        .species = SPECIES_HYPNO,
    },
};

static const struct TrainerMon sParty_TeamRocketAdmin[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 52,
        .species = SPECIES_MUK,
        .moves = {MOVE_SLUDGE_BOMB, MOVE_SCREECH, MOVE_MINIMIZE, MOVE_ROCK_TOMB},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 53,
        .species = SPECIES_ARBOK,
        .moves = {MOVE_SLUDGE_BOMB, MOVE_BITE, MOVE_EARTHQUAKE, MOVE_IRON_TAIL},
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 54,
        .species = SPECIES_VILEPLUME,
        .moves = {MOVE_SLUDGE_BOMB, MOVE_GIGA_DRAIN, MOVE_SLEEP_POWDER, MOVE_STUN_SPORE},
    },
};

static const struct TrainerMon sParty_TeamRocketAdmin2[] = {
    {
        .iv = TRAINER_PARTY_IVS(24, 24, 24, 24, 24, 24),
        .lvl = 53,
        .species = SPECIES_GOLBAT,
        .moves = {MOVE_CONFUSE_RAY, MOVE_SLUDGE_BOMB, MOVE_AIR_CUTTER, MOVE_SHADOW_BALL},
    },
    {
        .iv = TRAINER_PARTY_IVS(24, 24, 24, 24, 24, 24),
        .lvl = 54,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_SLUDGE_BOMB, MOVE_THUNDERBOLT, MOVE_EXPLOSION, MOVE_SHADOW_BALL},
    },
    {
        .iv = TRAINER_PARTY_IVS(24, 24, 24, 24, 24, 24),
        .lvl = 55,
        .species = SPECIES_HOUNDOOM,
        .moves = {MOVE_FLAMETHROWER, MOVE_CRUNCH, MOVE_IRON_TAIL, MOVE_SHADOW_BALL},
    },
};

static const struct TrainerMon sParty_ScientistGideon[] = {
    {
        .lvl = 46,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SWIFT, MOVE_SCREECH, MOVE_SPARK, MOVE_SONIC_BOOM},
    },
    {
        .lvl = 46,
        .species = SPECIES_ELECTRODE,
        .moves = {MOVE_SPARK, MOVE_SONIC_BOOM, MOVE_SCREECH, MOVE_CHARGE},
    },
    {
        .lvl = 46,
        .species = SPECIES_MAGNEMITE,
        .moves = {MOVE_SCREECH, MOVE_SWIFT, MOVE_SPARK, MOVE_THUNDER_WAVE},
    },
    {
        .lvl = 46,
        .species = SPECIES_MAGNETON,
        .moves = {MOVE_TRI_ATTACK, MOVE_SPARK, MOVE_THUNDER_WAVE, MOVE_SONIC_BOOM},
    },
    {
        .lvl = 46,
        .species = SPECIES_PORYGON,
        .moves = {MOVE_TRI_ATTACK, MOVE_CONVERSION, MOVE_RECOVER, MOVE_PSYBEAM},
    },
};

static const struct TrainerMon sParty_SwimmerFemaleAmara[] = {
    {
        .lvl = 36,
        .species = SPECIES_SEEL,
    },
    {
        .lvl = 36,
        .species = SPECIES_SEEL,
    },
    {
        .lvl = 36,
        .species = SPECIES_DEWGONG,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleMaria[] = {
    {
        .lvl = 37,
        .species = SPECIES_SEADRA,
    },
    {
        .lvl = 37,
        .species = SPECIES_SEADRA,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleAbigail[] = {
    {
        .lvl = 35,
        .species = SPECIES_PSYDUCK,
    },
    {
        .lvl = 36,
        .species = SPECIES_PSYDUCK,
    },
    {
        .lvl = 37,
        .species = SPECIES_GOLDUCK,
    },
};

static const struct TrainerMon sParty_SwimmerMaleFinn[] = {
    {
        .lvl = 38,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_SwimmerMaleGarrett[] = {
    {
        .lvl = 35,
        .species = SPECIES_SHELLDER,
    },
    {
        .lvl = 35,
        .species = SPECIES_CLOYSTER,
    },
    {
        .lvl = 38,
        .species = SPECIES_WARTORTLE,
    },
};

static const struct TrainerMon sParty_FishermanTommy[] = {
    {
        .lvl = 33,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 33,
        .species = SPECIES_GOLDEEN,
    },
    {
        .lvl = 35,
        .species = SPECIES_SEAKING,
    },
    {
        .lvl = 35,
        .species = SPECIES_SEAKING,
    },
    {
        .lvl = 35,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_CrushGirlTanya[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 38,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 38,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltShea[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_MACHOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltHugh[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_MACHOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CamperBryce[] = {
    {
        .lvl = 36,
        .species = SPECIES_NIDORINO,
    },
    {
        .lvl = 36,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 36,
        .species = SPECIES_SANDSLASH,
    },
};

static const struct TrainerMon sParty_PicnickerClaire[] = {
    {
        .lvl = 35,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 35,
        .species = SPECIES_MEOWTH,
    },
    {
        .lvl = 35,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 35,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_CrushKinMikKia[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 39,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 39,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_AromaLadyViolet[] = {
    {
        .lvl = 36,
        .species = SPECIES_BULBASAUR,
    },
    {
        .lvl = 36,
        .species = SPECIES_IVYSAUR,
    },
    {
        .lvl = 36,
        .species = SPECIES_IVYSAUR,
    },
};

static const struct TrainerMon sParty_TuberAlexis[] = {
    {
        .lvl = 34,
        .species = SPECIES_STARYU,
    },
    {
        .lvl = 34,
        .species = SPECIES_STARYU,
    },
    {
        .lvl = 34,
        .species = SPECIES_KRABBY,
    },
    {
        .lvl = 34,
        .species = SPECIES_KRABBY,
    },
};

static const struct TrainerMon sParty_TwinsJoyMeg[] = {
    {
        .lvl = 37,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .lvl = 37,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleTisha[] = {
    {
        .lvl = 38,
        .species = SPECIES_KINGLER,
    },
};

static const struct TrainerMon sParty_PainterCelina[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 50,
        .species = SPECIES_SMEARGLE,
        .moves = {MOVE_FLY, MOVE_DIG, MOVE_DIVE, MOVE_BOUNCE},
    },
};

static const struct TrainerMon sParty_PainterRayna[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 50,
        .species = SPECIES_SMEARGLE,
        .moves = {MOVE_CROSS_CHOP, MOVE_MEGAHORN, MOVE_DOUBLE_EDGE, MOVE_SELF_DESTRUCT},
    },
};

static const struct TrainerMon sParty_LadyGillian[] = {
    {
        .lvl = 47,
        .species = SPECIES_MAREEP,
        .heldItem = ITEM_STARDUST,
    },
    {
        .lvl = 48,
        .species = SPECIES_MAREEP,
        .heldItem = ITEM_STARDUST,
    },
    {
        .lvl = 49,
        .species = SPECIES_FLAAFFY,
        .heldItem = ITEM_NUGGET,
    },
};

static const struct TrainerMon sParty_YoungsterDestin[] = {
    {
        .lvl = 48,
        .species = SPECIES_RATICATE,
    },
    {
        .lvl = 48,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_SwimmerMaleToby[] = {
    {
        .lvl = 48,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .lvl = 48,
        .species = SPECIES_TENTACOOL,
    },
    {
        .lvl = 48,
        .species = SPECIES_TENTACRUEL,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt49[] = {
    {
        .lvl = 48,
        .species = SPECIES_RATTATA,
    },
    {
        .lvl = 48,
        .species = SPECIES_GRIMER,
    },
    {
        .lvl = 48,
        .species = SPECIES_MUK,
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt50[] = {
    {
        .lvl = 49,
        .species = SPECIES_KOFFING,
        .moves = {MOVE_MEMENTO, MOVE_HAZE, MOVE_SMOKESCREEN, MOVE_SLUDGE},
    },
    {
        .lvl = 49,
        .species = SPECIES_WEEZING,
        .moves = {MOVE_HAZE, MOVE_SMOKESCREEN, MOVE_SLUDGE, MOVE_SELF_DESTRUCT},
    },
};

static const struct TrainerMon sParty_TeamRocketGrunt51[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 48,
        .species = SPECIES_EKANS,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 48,
        .species = SPECIES_GLOOM,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 48,
        .species = SPECIES_GLOOM,
    },
};

static const struct TrainerMon sParty_BirdKeeperMilo[] = {
    {
        .lvl = 47,
        .species = SPECIES_PIDGEY,
    },
    {
        .lvl = 49,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_BirdKeeperChaz[] = {
    {
        .lvl = 47,
        .species = SPECIES_SPEAROW,
    },
    {
        .lvl = 49,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperHarold[] = {
    {
        .lvl = 47,
        .species = SPECIES_HOOTHOOT,
    },
    {
        .lvl = 49,
        .species = SPECIES_NOCTOWL,
    },
};

static const struct TrainerMon sParty_FishermanTylor[] = {
    {
        .lvl = 49,
        .species = SPECIES_QWILFISH,
    },
    {
        .lvl = 49,
        .species = SPECIES_QWILFISH,
    },
};

static const struct TrainerMon sParty_SwimmerMaleMymo[] = {
    {
        .lvl = 49,
        .species = SPECIES_KINGLER,
    },
    {
        .lvl = 49,
        .species = SPECIES_WARTORTLE,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleNicole[] = {
    {
        .lvl = 50,
        .species = SPECIES_MARILL,
    },
};

static const struct TrainerMon sParty_SisAndBroAvaGeb[] = {
    {
        .lvl = 50,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .lvl = 50,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_AromaLadyRose[] = {
    {
        .lvl = 49,
        .species = SPECIES_SUNKERN,
    },
    {
        .lvl = 49,
        .species = SPECIES_SUNFLORA,
    },
};

static const struct TrainerMon sParty_SwimmerMaleSamir[] = {
    {
        .lvl = 50,
        .species = SPECIES_GYARADOS,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleDenise[] = {
    {
        .lvl = 49,
        .species = SPECIES_CHINCHOU,
    },
    {
        .lvl = 49,
        .species = SPECIES_LANTURN,
    },
};

static const struct TrainerMon sParty_TwinsMiuMia[] = {
    {
        .lvl = 50,
        .species = SPECIES_PIKACHU,
    },
    {
        .lvl = 50,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_HikerEarl[] = {
    {
        .lvl = 49,
        .species = SPECIES_ONIX,
    },
    {
        .lvl = 49,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_RuinManiacFoster[] = {
    {
        .lvl = 50,
        .species = SPECIES_GOLEM,
    },
};

static const struct TrainerMon sParty_RuinManiacLarry[] = {
    {
        .lvl = 49,
        .species = SPECIES_MACHOKE,
    },
    {
        .lvl = 49,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_HikerDaryl[] = {
    {
        .lvl = 50,
        .species = SPECIES_SUDOWOODO,
    },
};

static const struct TrainerMon sParty_PokemaniacHector[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 49,
        .species = SPECIES_RHYHORN,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 49,
        .species = SPECIES_KANGASKHAN,
    },
};

static const struct TrainerMon sParty_PsychicDario[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 52,
        .species = SPECIES_GIRAFARIG,
        .moves = {MOVE_CRUNCH, MOVE_PSYBEAM, MOVE_ODOR_SLEUTH, MOVE_AGILITY},
    },
};

static const struct TrainerMon sParty_PsychicRodette[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_NATU,
        .moves = {MOVE_NIGHT_SHADE, MOVE_CONFUSE_RAY, MOVE_WISH, MOVE_FUTURE_SIGHT},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_DROWZEE,
        .moves = {MOVE_PSYCHIC, MOVE_DISABLE, MOVE_PSYCH_UP, MOVE_FUTURE_SIGHT},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 50,
        .species = SPECIES_HYPNO,
        .moves = {MOVE_PSYCHIC, MOVE_HYPNOSIS, MOVE_PSYCH_UP, MOVE_FUTURE_SIGHT},
    },
};

static const struct TrainerMon sParty_AromaLadyMiah[] = {
    {
        .lvl = 50,
        .species = SPECIES_BELLOSSOM,
    },
    {
        .lvl = 50,
        .species = SPECIES_BELLOSSOM,
    },
};

static const struct TrainerMon sParty_YoungCoupleEveJon[] = {
    {
        .lvl = 50,
        .species = SPECIES_GOLDUCK,
    },
    {
        .lvl = 50,
        .species = SPECIES_PSYDUCK,
    },
};

static const struct TrainerMon sParty_JugglerMason[] = {
    {
        .lvl = 47,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SWIFT, MOVE_LIGHT_SCREEN, MOVE_SPARK, MOVE_SONIC_BOOM},
    },
    {
        .lvl = 47,
        .species = SPECIES_PINECO,
        .moves = {MOVE_SPIKES, MOVE_BIDE, MOVE_RAPID_SPIN, MOVE_TAKE_DOWN},
    },
    {
        .lvl = 47,
        .species = SPECIES_VOLTORB,
        .moves = {MOVE_SWIFT, MOVE_LIGHT_SCREEN, MOVE_SPARK, MOVE_SONIC_BOOM},
    },
    {
        .lvl = 47,
        .species = SPECIES_PINECO,
        .moves = {MOVE_SPIKES, MOVE_BIDE, MOVE_RAPID_SPIN, MOVE_EXPLOSION},
    },
};

static const struct TrainerMon sParty_CrushGirlCyndy[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 48,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 48,
        .species = SPECIES_HITMONTOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 48,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushGirlJocelyn[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 38,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 38,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_TamerEvan[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 48,
        .species = SPECIES_SANDSLASH,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 48,
        .species = SPECIES_LICKITUNG,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 49,
        .species = SPECIES_URSARING,
    },
};

static const struct TrainerMon sParty_PokemaniacMark2[] = {
    {
        .iv = TRAINER_PARTY_IVS(10, 10, 10, 10, 10, 10),
        .lvl = 33,
        .species = SPECIES_RHYHORN,
    },
    {
        .iv = TRAINER_PARTY_IVS(10, 10, 10, 10, 10, 10),
        .lvl = 33,
        .species = SPECIES_LICKITUNG,
    },
};

static const struct TrainerMon sParty_PkmnRangerLogan[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 37,
        .species = SPECIES_EXEGGCUTE,
        .moves = {MOVE_SLEEP_POWDER, MOVE_POISON_POWDER, MOVE_STUN_SPORE, MOVE_CONFUSION},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 40,
        .species = SPECIES_EXEGGUTOR,
        .moves = {MOVE_EGG_BOMB, MOVE_STOMP, MOVE_CONFUSION, MOVE_HYPNOSIS},
    },
};

static const struct TrainerMon sParty_PkmnRangerJackson[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 49,
        .species = SPECIES_TANGELA,
        .moves = {MOVE_SLAM, MOVE_MEGA_DRAIN, MOVE_BIND, MOVE_INGRAIN},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 49,
        .species = SPECIES_EXEGGCUTE,
        .moves = {MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_BARRAGE, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 49,
        .species = SPECIES_EXEGGUTOR,
        .moves = {MOVE_CONFUSION, MOVE_EGG_BOMB, MOVE_SLEEP_POWDER, MOVE_STOMP},
    },
};

static const struct TrainerMon sParty_PkmnRangerBeth[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_BELLSPROUT,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_GLOOM,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 38,
        .species = SPECIES_GLOOM,
    },
};

static const struct TrainerMon sParty_PkmnRangerKatelyn[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 52,
        .species = SPECIES_CHANSEY,
        .moves = {MOVE_EGG_BOMB, MOVE_DEFENSE_CURL, MOVE_MINIMIZE, MOVE_SOFT_BOILED},
    },
};

static const struct TrainerMon sParty_CooltrainerLeroy[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 47,
        .species = SPECIES_RHYDON,
        .moves = {MOVE_TAKE_DOWN, MOVE_HORN_DRILL, MOVE_ROCK_BLAST, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_SLOWBRO,
        .moves = {MOVE_PSYCHIC, MOVE_HEADBUTT, MOVE_AMNESIA, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 47,
        .species = SPECIES_KANGASKHAN,
        .moves = {MOVE_DIZZY_PUNCH, MOVE_BITE, MOVE_ENDURE, MOVE_REVERSAL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_MACHOKE,
        .moves = {MOVE_CROSS_CHOP, MOVE_VITAL_THROW, MOVE_REVENGE, MOVE_SEISMIC_TOSS},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 50,
        .species = SPECIES_URSARING,
        .moves = {MOVE_SLASH, MOVE_FAINT_ATTACK, MOVE_SNORE, MOVE_REST},
    },
};

static const struct TrainerMon sParty_CooltrainerMichelle[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 47,
        .species = SPECIES_PERSIAN,
        .moves = {MOVE_SLASH, MOVE_SCREECH, MOVE_FAINT_ATTACK, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 47,
        .species = SPECIES_DEWGONG,
        .moves = {MOVE_ICE_BEAM, MOVE_TAKE_DOWN, MOVE_ICY_WIND, MOVE_GROWL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_NINETALES,
        .moves = {MOVE_FLAMETHROWER, MOVE_CONFUSE_RAY, MOVE_WILL_O_WISP, MOVE_GRUDGE},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_RAPIDASH,
        .moves = {MOVE_BOUNCE, MOVE_AGILITY, MOVE_FIRE_SPIN, MOVE_TAKE_DOWN},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 50,
        .species = SPECIES_GIRAFARIG,
        .moves = {MOVE_CRUNCH, MOVE_PSYBEAM, MOVE_STOMP, MOVE_ODOR_SLEUTH},
    },
};

static const struct TrainerMon sParty_CoolCoupleLexNya[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 52,
        .species = SPECIES_MILTANK,
        .moves = {MOVE_BODY_SLAM, MOVE_MILK_DRINK, MOVE_GROWL, MOVE_DEFENSE_CURL},
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 52,
        .species = SPECIES_TAUROS,
        .moves = {MOVE_THRASH, MOVE_HORN_ATTACK, MOVE_PURSUIT, MOVE_SWAGGER},
    },
};

static const struct TrainerMon sParty_RuinManiacBrandon[] = {
    {
        .lvl = 50,
        .species = SPECIES_ONIX,
    },
};

static const struct TrainerMon sParty_RuinManiacBenjamin[] = {
    {
        .lvl = 48,
        .species = SPECIES_GEODUDE,
        .moves = {MOVE_EARTHQUAKE, MOVE_ROCK_BLAST, MOVE_ROLLOUT, MOVE_SELF_DESTRUCT},
    },
    {
        .lvl = 48,
        .species = SPECIES_GRAVELER,
        .moves = {MOVE_EARTHQUAKE, MOVE_ROCK_BLAST, MOVE_ROCK_THROW, MOVE_SELF_DESTRUCT},
    },
    {
        .lvl = 48,
        .species = SPECIES_GRAVELER,
        .moves = {MOVE_EARTHQUAKE, MOVE_ROCK_BLAST, MOVE_ROCK_THROW, MOVE_SELF_DESTRUCT},
    },
};

static const struct TrainerMon sParty_PainterEdna[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 50,
        .species = SPECIES_SMEARGLE,
        .moves = {MOVE_FAKE_OUT, MOVE_EXTREME_SPEED, MOVE_PROTECT, MOVE_QUICK_ATTACK},
    },
};

static const struct TrainerMon sParty_GentlemanClifford[] = {
    {
        .lvl = 49,
        .species = SPECIES_MAROWAK,
    },
    {
        .lvl = 49,
        .species = SPECIES_GOLDUCK,
    },
};

static const struct TrainerMon sParty_LadySelphy[] = {
    {
        .lvl = 49,
        .species = SPECIES_PERSIAN,
        .heldItem = ITEM_NUGGET,
        .moves = {MOVE_PAY_DAY, MOVE_BITE, MOVE_TAUNT, MOVE_TORMENT},
    },
    {
        .lvl = 49,
        .species = SPECIES_PERSIAN,
        .heldItem = ITEM_NUGGET,
        .moves = {MOVE_PAY_DAY, MOVE_SCRATCH, MOVE_TORMENT, MOVE_TAUNT},
    },
};

static const struct TrainerMon sParty_RuinManiacLawson[] = {
    {
        .lvl = 47,
        .species = SPECIES_ONIX,
    },
    {
        .lvl = 48,
        .species = SPECIES_GRAVELER,
    },
    {
        .lvl = 49,
        .species = SPECIES_MAROWAK,
    },
};

static const struct TrainerMon sParty_PsychicLaura[] = {
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_NATU,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 48,
        .species = SPECIES_NATU,
    },
    {
        .iv = TRAINER_PARTY_IVS(12, 12, 12, 12, 12, 12),
        .lvl = 49,
        .species = SPECIES_XATU,
    },
};

static const struct TrainerMon sParty_PkmnBreederBethany[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 50,
        .species = SPECIES_CHANSEY,
    },
};

static const struct TrainerMon sParty_PkmnBreederAllison[] = {
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 48,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 48,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .iv = TRAINER_PARTY_IVS(3, 3, 3, 3, 3, 3),
        .lvl = 48,
        .species = SPECIES_CLEFABLE,
    },
};

static const struct TrainerMon sParty_BugCatcherGarret[] = {
    {
        .lvl = 49,
        .species = SPECIES_HERACROSS,
    },
};

static const struct TrainerMon sParty_BugCatcherJonah[] = {
    {
        .lvl = 45,
        .species = SPECIES_YANMA,
    },
    {
        .lvl = 45,
        .species = SPECIES_BEEDRILL,
    },
    {
        .lvl = 46,
        .species = SPECIES_YANMA,
    },
    {
        .lvl = 47,
        .species = SPECIES_BEEDRILL,
    },
};

static const struct TrainerMon sParty_BugCatcherVance[] = {
    {
        .lvl = 48,
        .species = SPECIES_VENONAT,
    },
    {
        .lvl = 48,
        .species = SPECIES_VENOMOTH,
    },
};

static const struct TrainerMon sParty_YoungsterNash[] = {
    {
        .lvl = 47,
        .species = SPECIES_WEEPINBELL,
    },
    {
        .lvl = 47,
        .species = SPECIES_WEEPINBELL,
    },
    {
        .lvl = 49,
        .species = SPECIES_VICTREEBEL,
    },
};

static const struct TrainerMon sParty_YoungsterCordell[] = {
    {
        .lvl = 48,
        .species = SPECIES_FARFETCHD,
    },
    {
        .lvl = 48,
        .species = SPECIES_FARFETCHD,
    },
};

static const struct TrainerMon sParty_LassDalia[] = {
    {
        .lvl = 46,
        .species = SPECIES_HOPPIP,
    },
    {
        .lvl = 47,
        .species = SPECIES_HOPPIP,
    },
    {
        .lvl = 47,
        .species = SPECIES_SKIPLOOM,
    },
    {
        .lvl = 48,
        .species = SPECIES_SKIPLOOM,
    },
};

static const struct TrainerMon sParty_LassJoana[] = {
    {
        .lvl = 49,
        .species = SPECIES_SNUBBULL,
    },
};

static const struct TrainerMon sParty_CamperRiley[] = {
    {
        .lvl = 49,
        .species = SPECIES_PINSIR,
    },
    {
        .lvl = 50,
        .species = SPECIES_HERACROSS,
    },
};

static const struct TrainerMon sParty_PicnickerMarcy[] = {
    {
        .lvl = 48,
        .species = SPECIES_PARAS,
    },
    {
        .lvl = 48,
        .species = SPECIES_PARAS,
    },
    {
        .lvl = 49,
        .species = SPECIES_PARASECT,
    },
};

static const struct TrainerMon sParty_RuinManiacLayton[] = {
    {
        .lvl = 48,
        .species = SPECIES_SANDSLASH,
    },
    {
        .lvl = 48,
        .species = SPECIES_ONIX,
    },
    {
        .lvl = 48,
        .species = SPECIES_SANDSLASH,
    },
};

static const struct TrainerMon sParty_PicnickerKelsey2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 21,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 21,
        .species = SPECIES_NIDORAN_F,
    },
};

static const struct TrainerMon sParty_PicnickerKelsey3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_NIDORINO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_NIDORINA,
    },
};

static const struct TrainerMon sParty_PicnickerKelsey4[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_NIDORINO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_NIDORINA,
    },
};

static const struct TrainerMon sParty_CamperRicky2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 22,
        .species = SPECIES_SQUIRTLE,
    },
};

static const struct TrainerMon sParty_CamperRicky3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_WARTORTLE,
    },
};

static const struct TrainerMon sParty_CamperRicky4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_WARTORTLE,
    },
};

static const struct TrainerMon sParty_CamperJeff2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 21,
        .species = SPECIES_SPEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 21,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_CamperJeff3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_CamperJeff4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_PicnickerIsabelle2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 21,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 21,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 18,
        .species = SPECIES_PIDGEY,
    },
};

static const struct TrainerMon sParty_PicnickerIsabelle3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 26,
        .species = SPECIES_PIDGEOTTO,
    },
};

static const struct TrainerMon sParty_PicnickerIsabelle4[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 50,
        .species = SPECIES_PIDGEOT,
    },
};

static const struct TrainerMon sParty_YoungsterYasu2[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 22,
        .species = SPECIES_RATTATA,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 22,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 22,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_YoungsterYasu3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_RATICATE,
    },
};

static const struct TrainerMon sParty_EngineerBernie2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_MAGNETON,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_MAGNETON,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_MAGNETON,
    },
};

static const struct TrainerMon sParty_GamerDarian2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_VULPIX,
    },
};

static const struct TrainerMon sParty_CamperChris2[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 24,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 24,
        .species = SPECIES_CHARMANDER,
    },
};

static const struct TrainerMon sParty_CamperChris3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 29,
        .species = SPECIES_CHARMELEON,
    },
};

static const struct TrainerMon sParty_CamperChris4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_ARCANINE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_CHARMELEON,
    },
};

static const struct TrainerMon sParty_PicnickerAlicia2[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 25,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_PicnickerAlicia3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_PERSIAN,
    },
};

static const struct TrainerMon sParty_PicnickerAlicia4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_PERSIAN,
    },
};

static const struct TrainerMon sParty_HikerJeremy2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_MACHOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_ONIX,
    },
};

static const struct TrainerMon sParty_PokemaniacMark3[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 54,
        .species = SPECIES_RHYDON,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 54,
        .species = SPECIES_LICKITUNG,
    },
};

static const struct TrainerMon sParty_PokemaniacHerman2[] = {
    {
        .iv = TRAINER_PARTY_IVS(10, 10, 10, 10, 10, 10),
        .lvl = 29,
        .species = SPECIES_MAROWAK,
    },
    {
        .iv = TRAINER_PARTY_IVS(10, 10, 10, 10, 10, 10),
        .lvl = 29,
        .species = SPECIES_SLOWBRO,
    },
};

static const struct TrainerMon sParty_PokemaniacHerman3[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 54,
        .species = SPECIES_MAROWAK,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 54,
        .species = SPECIES_SLOWBRO,
    },
};

static const struct TrainerMon sParty_HikerTrent2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 31,
        .species = SPECIES_ONIX,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 31,
        .species = SPECIES_GRAVELER,
    },
};

static const struct TrainerMon sParty_LassMegan2[] = {
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 22,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 22,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 23,
        .species = SPECIES_NIDORAN_M,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 21,
        .species = SPECIES_MEOWTH,
    },
    {
        .iv = TRAINER_PARTY_IVS(4, 4, 4, 4, 4, 4),
        .lvl = 22,
        .species = SPECIES_PIKACHU,
    },
};

static const struct TrainerMon sParty_LassMegan3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 46,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_NIDORINO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PERSIAN,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_RAICHU,
    },
};

static const struct TrainerMon sParty_SuperNerdGlenn2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_MUK,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_MUK,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_MUK,
    },
};

static const struct TrainerMon sParty_GamerRich2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_GROWLITHE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_VULPIX,
    },
};

static const struct TrainerMon sParty_BikerJaren2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_MUK,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_MUK,
    },
};

static const struct TrainerMon sParty_FishermanElliot2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_CLOYSTER,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_SEAKING,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_SEADRA,
    },
};

static const struct TrainerMon sParty_RockerLuca2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 33,
        .species = SPECIES_ELECTRODE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 33,
        .species = SPECIES_ELECTRODE,
    },
};

static const struct TrainerMon sParty_BeautySheila2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_PERSIAN,
    },
};

static const struct TrainerMon sParty_BirdKeeperRobert2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperRobert3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_PicnickerSusie2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_MEOWTH,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_PIKACHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_MEOWTH,
    },
};

static const struct TrainerMon sParty_PicnickerSusie3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PERSIAN,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PIKACHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_PERSIAN,
    },
};

static const struct TrainerMon sParty_PicnickerSusie4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_PERSIAN,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_RAICHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_PERSIAN,
    },
};

static const struct TrainerMon sParty_BikerLukas2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_KOFFING,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_KOFFING,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_MUK,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_WEEZING,
    },
};

static const struct TrainerMon sParty_BirdKeeperBenny2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 32,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 32,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperBenny3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperMarlon2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_DODUO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperMarlon3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_DODRIO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BeautyGrace2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_PIDGEOT,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_WIGGLYTUFF,
    },
};

static const struct TrainerMon sParty_BirdKeeperChester2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_DODRIO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_DODRIO,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_DODUO,
    },
};

static const struct TrainerMon sParty_BirdKeeperChester3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_DODRIO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_DODRIO,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_DODRIO,
    },
};

static const struct TrainerMon sParty_PicnickerBecky2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 32,
        .species = SPECIES_PIKACHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 32,
        .species = SPECIES_RAICHU,
    },
};

static const struct TrainerMon sParty_PicnickerBecky3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_PIKACHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_RAICHU,
    },
};

static const struct TrainerMon sParty_PicnickerBecky4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_RAICHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_RAICHU,
    },
};

static const struct TrainerMon sParty_CrushKinRonMya2[] = {
    {
        .iv = TRAINER_PARTY_IVS(13, 13, 13, 13, 13, 13),
        .lvl = 33,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(13, 13, 13, 13, 13, 13),
        .lvl = 33,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushKinRonMya3[] = {
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 51,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 51,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushKinRonMya4[] = {
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 56,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 56,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BikerRuben2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_WEEZING,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_WEEZING,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 48,
        .species = SPECIES_WEEZING,
    },
};

static const struct TrainerMon sParty_CueBallCamron2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_PRIMEAPE,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_BikerJaxon2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_WEEZING,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_MUK,
    },
};

static const struct TrainerMon sParty_CueBallIsaiah2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_MACHOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_MACHAMP,
    },
};

static const struct TrainerMon sParty_CueBallCorey2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_PRIMEAPE,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_MACHAMP,
    },
};

static const struct TrainerMon sParty_BirdKeeperJacob2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_SPEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 28,
        .species = SPECIES_SPEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperJacob3[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleAlice2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_SEAKING,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_SwimmerMaleDarrin2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_SEADRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_SEADRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_SEADRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_SEADRA,
    },
};

static const struct TrainerMon sParty_PicnickerMissy2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_SEAKING,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_PicnickerMissy3[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_SEAKING,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_FishermanWade2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_MAGIKARP,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_MAGIKARP,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_MAGIKARP,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_MAGIKARP,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_MAGIKARP,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_MAGIKARP,
    },
};

static const struct TrainerMon sParty_SwimmerMaleJack2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 50,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_SisAndBroLilIan2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 50,
        .species = SPECIES_SEADRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 50,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_SisAndBroLilIan3[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_SEADRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_SwimmerMaleFinn2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 50,
        .species = SPECIES_STARMIE,
    },
};

static const struct TrainerMon sParty_CrushGirlSharon2[] = {
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 50,
        .species = SPECIES_MANKEY,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 50,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushGirlSharon3[] = {
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 55,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 55,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushGirlTanya2[] = {
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 50,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 50,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushGirlTanya3[] = {
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 55,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 55,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltShea2[] = {
    {
        .iv = TRAINER_PARTY_IVS(21, 21, 21, 21, 21, 21),
        .lvl = 50,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(21, 21, 21, 21, 21, 21),
        .lvl = 50,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltShea3[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_MACHAMP,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltHugh2[] = {
    {
        .iv = TRAINER_PARTY_IVS(21, 21, 21, 21, 21, 21),
        .lvl = 50,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(21, 21, 21, 21, 21, 21),
        .lvl = 50,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_BlackBeltHugh3[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_MACHAMP,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushKinMikKia2[] = {
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 51,
        .species = SPECIES_MACHOKE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(15, 15, 15, 15, 15, 15),
        .lvl = 51,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_CrushKinMikKia3[] = {
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 56,
        .species = SPECIES_MACHAMP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 56,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_TuberAmira2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 47,
        .species = SPECIES_POLIWHIRL,
    },
};

static const struct TrainerMon sParty_TwinsJoyMeg2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_CLEFAIRY,
    },
};

static const struct TrainerMon sParty_PainterRayna2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_SMEARGLE,
        .moves = {MOVE_CROSS_CHOP, MOVE_MEGAHORN, MOVE_DOUBLE_EDGE, MOVE_SELF_DESTRUCT},
    },
};

static const struct TrainerMon sParty_YoungsterDestin2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 53,
        .species = SPECIES_RATICATE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 53,
        .species = SPECIES_PIDGEOT,
    },
};

static const struct TrainerMon sParty_PkmnBreederAlize2[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 53,
        .species = SPECIES_PIKACHU,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 53,
        .species = SPECIES_CLEFAIRY,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 53,
        .species = SPECIES_MARILL,
    },
};

static const struct TrainerMon sParty_YoungCoupleGiaJes2[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_NIDORINA,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 30,
        .species = SPECIES_NIDORINO,
    },
};

static const struct TrainerMon sParty_YoungCoupleGiaJes3[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_NIDOKING,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_NIDOQUEEN,
    },
};

static const struct TrainerMon sParty_BirdKeeperMilo2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 53,
        .species = SPECIES_PIDGEOTTO,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_PIDGEOT,
    },
};

static const struct TrainerMon sParty_BirdKeeperChaz2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 53,
        .species = SPECIES_FEAROW,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_FEAROW,
    },
};

static const struct TrainerMon sParty_BirdKeeperHarold2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 53,
        .species = SPECIES_NOCTOWL,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_NOCTOWL,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleNicole2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_MARILL,
    },
};

static const struct TrainerMon sParty_PsychicJaclyn2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 52,
        .species = SPECIES_NATU,
        .moves = {MOVE_PSYCHIC, MOVE_CONFUSE_RAY, MOVE_FUTURE_SIGHT, MOVE_WISH},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 52,
        .species = SPECIES_SLOWBRO,
        .moves = {MOVE_PSYCHIC, MOVE_HEADBUTT, MOVE_AMNESIA, MOVE_YAWN},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 54,
        .species = SPECIES_KADABRA,
        .moves = {MOVE_PSYCHIC, MOVE_FUTURE_SIGHT, MOVE_RECOVER, MOVE_REFLECT},
    },
};

static const struct TrainerMon sParty_SwimmerMaleSamir2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 55,
        .species = SPECIES_GYARADOS,
    },
};

static const struct TrainerMon sParty_HikerEarl2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_ONIX,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_MACHAMP,
    },
};

static const struct TrainerMon sParty_RuinManiacLarry2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_MACHOKE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_MACHOKE,
    },
};

static const struct TrainerMon sParty_PokemaniacHector2[] = {
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 55,
        .species = SPECIES_RHYDON,
    },
    {
        .iv = TRAINER_PARTY_IVS(18, 18, 18, 18, 18, 18),
        .lvl = 55,
        .species = SPECIES_KANGASKHAN,
    },
};

static const struct TrainerMon sParty_PsychicDario2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 56,
        .species = SPECIES_GIRAFARIG,
        .moves = {MOVE_CRUNCH, MOVE_PSYBEAM, MOVE_ODOR_SLEUTH, MOVE_AGILITY},
    },
};

static const struct TrainerMon sParty_PsychicRodette2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 53,
        .species = SPECIES_NATU,
        .moves = {MOVE_PSYCHIC, MOVE_CONFUSE_RAY, MOVE_WISH, MOVE_FUTURE_SIGHT},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 53,
        .species = SPECIES_HYPNO,
        .moves = {MOVE_PSYCHIC, MOVE_DISABLE, MOVE_PSYCH_UP, MOVE_FUTURE_SIGHT},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 53,
        .species = SPECIES_HYPNO,
        .moves = {MOVE_PSYCHIC, MOVE_HYPNOSIS, MOVE_PSYCH_UP, MOVE_FUTURE_SIGHT},
    },
};

static const struct TrainerMon sParty_JugglerMason2[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_ELECTRODE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_PINECO,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_ELECTRODE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 52,
        .species = SPECIES_PINECO,
    },
};

static const struct TrainerMon sParty_PkmnRangerNicolas2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_VICTREEBEL,
        .moves = {MOVE_RAZOR_LEAF, MOVE_ACID, MOVE_STUN_SPORE, MOVE_WRAP},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_VICTREEBEL,
        .moves = {MOVE_RAZOR_LEAF, MOVE_ACID, MOVE_SLEEP_POWDER, MOVE_SLAM},
    },
};

static const struct TrainerMon sParty_PkmnRangerMadeline2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_VILEPLUME,
        .moves = {MOVE_PETAL_DANCE, MOVE_MOONLIGHT, MOVE_ACID, MOVE_SLEEP_POWDER},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_VILEPLUME,
        .moves = {MOVE_PETAL_DANCE, MOVE_MOONLIGHT, MOVE_ACID, MOVE_STUN_SPORE},
    },
};

static const struct TrainerMon sParty_CrushGirlCyndy2[] = {
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 54,
        .species = SPECIES_PRIMEAPE,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 54,
        .species = SPECIES_HITMONTOP,
        .heldItem = ITEM_BLACK_BELT,
    },
    {
        .iv = TRAINER_PARTY_IVS(20, 20, 20, 20, 20, 20),
        .lvl = 54,
        .species = SPECIES_MACHAMP,
        .heldItem = ITEM_BLACK_BELT,
    },
};

static const struct TrainerMon sParty_TamerEvan2[] = {
    {
        .iv = TRAINER_PARTY_IVS(19, 19, 19, 19, 19, 19),
        .lvl = 52,
        .species = SPECIES_SANDSLASH,
    },
    {
        .iv = TRAINER_PARTY_IVS(19, 19, 19, 19, 19, 19),
        .lvl = 52,
        .species = SPECIES_LICKITUNG,
    },
    {
        .iv = TRAINER_PARTY_IVS(19, 19, 19, 19, 19, 19),
        .lvl = 55,
        .species = SPECIES_URSARING,
    },
};

static const struct TrainerMon sParty_PkmnRangerJackson2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 53,
        .species = SPECIES_TANGELA,
        .moves = {MOVE_SLAM, MOVE_MEGA_DRAIN, MOVE_BIND, MOVE_INGRAIN},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 54,
        .species = SPECIES_EXEGGUTOR,
        .moves = {MOVE_CONFUSION, MOVE_EGG_BOMB, MOVE_STUN_SPORE, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_EXEGGUTOR,
        .moves = {MOVE_CONFUSION, MOVE_EGG_BOMB, MOVE_SLEEP_POWDER, MOVE_STOMP},
    },
};

static const struct TrainerMon sParty_PkmnRangerKatelyn2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 56,
        .species = SPECIES_CHANSEY,
        .moves = {MOVE_EGG_BOMB, MOVE_DEFENSE_CURL, MOVE_MINIMIZE, MOVE_SOFT_BOILED},
    },
};

static const struct TrainerMon sParty_CooltrainerLeroy2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 52,
        .species = SPECIES_RHYDON,
        .moves = {MOVE_EARTHQUAKE, MOVE_HORN_DRILL, MOVE_ROCK_BLAST, MOVE_SCARY_FACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 54,
        .species = SPECIES_SLOWBRO,
        .moves = {MOVE_PSYCHIC, MOVE_HEADBUTT, MOVE_AMNESIA, MOVE_DISABLE},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 52,
        .species = SPECIES_KANGASKHAN,
        .moves = {MOVE_DIZZY_PUNCH, MOVE_BITE, MOVE_ENDURE, MOVE_REVERSAL},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 52,
        .species = SPECIES_MACHAMP,
        .moves = {MOVE_CROSS_CHOP, MOVE_VITAL_THROW, MOVE_REVENGE, MOVE_SEISMIC_TOSS},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 55,
        .species = SPECIES_URSARING,
        .moves = {MOVE_SLASH, MOVE_FAINT_ATTACK, MOVE_SNORE, MOVE_REST},
    },
};

static const struct TrainerMon sParty_CooltrainerMichelle2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 53,
        .species = SPECIES_PERSIAN,
        .moves = {MOVE_SLASH, MOVE_SCREECH, MOVE_FAINT_ATTACK, MOVE_BITE},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 53,
        .species = SPECIES_DEWGONG,
        .moves = {MOVE_ICE_BEAM, MOVE_TAKE_DOWN, MOVE_ICY_WIND, MOVE_SHEER_COLD},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 54,
        .species = SPECIES_NINETALES,
        .moves = {MOVE_FLAMETHROWER, MOVE_CONFUSE_RAY, MOVE_WILL_O_WISP, MOVE_GRUDGE},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 54,
        .species = SPECIES_RAPIDASH,
        .moves = {MOVE_BOUNCE, MOVE_AGILITY, MOVE_FIRE_SPIN, MOVE_TAKE_DOWN},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 56,
        .species = SPECIES_GIRAFARIG,
        .moves = {MOVE_CRUNCH, MOVE_PSYBEAM, MOVE_STOMP, MOVE_ODOR_SLEUTH},
    },
};

static const struct TrainerMon sParty_CoolCoupleLexNya2[] = {
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 57,
        .species = SPECIES_MILTANK,
        .moves = {MOVE_BODY_SLAM, MOVE_MILK_DRINK, MOVE_GROWL, MOVE_DEFENSE_CURL},
    },
    {
        .iv = TRAINER_PARTY_IVS(26, 26, 26, 26, 26, 26),
        .lvl = 57,
        .species = SPECIES_TAUROS,
        .moves = {MOVE_TAKE_DOWN, MOVE_SCARY_FACE, MOVE_PURSUIT, MOVE_SWAGGER},
    },
};

static const struct TrainerMon sParty_BugCatcherColton2[] = {
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 19,
        .species = SPECIES_METAPOD,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 19,
        .species = SPECIES_WEEDLE,
    },
    {
        .iv = TRAINER_PARTY_IVS(2, 2, 2, 2, 2, 2),
        .lvl = 19,
        .species = SPECIES_METAPOD,
    },
};

static const struct TrainerMon sParty_BugCatcherColton3[] = {
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_BUTTERFREE,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_KAKUNA,
    },
    {
        .iv = TRAINER_PARTY_IVS(7, 7, 7, 7, 7, 7),
        .lvl = 27,
        .species = SPECIES_BUTTERFREE,
    },
};

static const struct TrainerMon sParty_BugCatcherColton4[] = {
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 51,
        .species = SPECIES_BUTTERFREE,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 54,
        .species = SPECIES_BEEDRILL,
    },
    {
        .iv = TRAINER_PARTY_IVS(14, 14, 14, 14, 14, 14),
        .lvl = 51,
        .species = SPECIES_BUTTERFREE,
    },
};

static const struct TrainerMon sParty_SwimmerMaleMatthew2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_POLIWRATH,
    },
};

static const struct TrainerMon sParty_SwimmerMaleTony2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_SEADRA,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_SEADRA,
    },
};

static const struct TrainerMon sParty_SwimmerFemaleMelissa2[] = {
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_POLIWHIRL,
    },
    {
        .iv = TRAINER_PARTY_IVS(9, 9, 9, 9, 9, 9),
        .lvl = 49,
        .species = SPECIES_SEAKING,
    },
};

static const struct TrainerMon sParty_EliteFourLorelei2[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 64,
        .species = SPECIES_DEWGONG,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_ICE_BEAM, MOVE_SURF, MOVE_SIGNAL_BEAM, MOVE_DOUBLE_TEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 63,
        .species = SPECIES_CLOYSTER,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_ICE_BEAM, MOVE_SURF, MOVE_SUPERSONIC, MOVE_RAIN_DANCE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 63,
        .species = SPECIES_PILOSWINE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_BLIZZARD, MOVE_EARTHQUAKE, MOVE_DOUBLE_EDGE, MOVE_ROCK_SLIDE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 66,
        .species = SPECIES_JYNX,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_ICE_BEAM, MOVE_PSYCHIC, MOVE_LOVELY_KISS, MOVE_ATTRACT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 66,
        .species = SPECIES_LAPRAS,
        .heldItem = ITEM_CHERI_BERRY,
        .moves = {MOVE_ICE_BEAM, MOVE_SURF, MOVE_PSYCHIC, MOVE_THUNDER},
    },
};

static const struct TrainerMon sParty_EliteFourBruno2[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 65,
        .species = SPECIES_STEELIX,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_EARTHQUAKE, MOVE_IRON_TAIL, MOVE_CRUNCH, MOVE_ROCK_TOMB},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 65,
        .species = SPECIES_HITMONCHAN,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SKY_UPPERCUT, MOVE_MACH_PUNCH, MOVE_ROCK_SLIDE, MOVE_COUNTER},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 65,
        .species = SPECIES_HITMONLEE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_MEGA_KICK, MOVE_FORESIGHT, MOVE_EARTHQUAKE, MOVE_ROCK_SLIDE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 66,
        .species = SPECIES_STEELIX,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_EARTHQUAKE, MOVE_IRON_TAIL, MOVE_CRUNCH, MOVE_DRAGON_BREATH},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 68,
        .species = SPECIES_MACHAMP,
        .heldItem = ITEM_PERSIM_BERRY,
        .moves = {MOVE_CROSS_CHOP, MOVE_EARTHQUAKE, MOVE_BRICK_BREAK, MOVE_ROCK_SLIDE},
    },
};

static const struct TrainerMon sParty_EliteFourAgatha2[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 66,
        .species = SPECIES_GENGAR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SHADOW_BALL, MOVE_PSYCHIC, MOVE_CONFUSE_RAY, MOVE_HYPNOSIS},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 66,
        .species = SPECIES_CROBAT,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SLUDGE_BOMB, MOVE_AIR_CUTTER, MOVE_SHADOW_BALL, MOVE_CONFUSE_RAY},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 65,
        .species = SPECIES_MISDREAVUS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SHADOW_BALL, MOVE_PSYCHIC, MOVE_THUNDERBOLT, MOVE_ATTRACT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 68,
        .species = SPECIES_ARBOK,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_SLUDGE_BOMB, MOVE_EARTHQUAKE, MOVE_GIGA_DRAIN, MOVE_DOUBLE_TEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 70,
        .species = SPECIES_GENGAR,
        .heldItem = ITEM_CHESTO_BERRY,
        .moves = {MOVE_SHADOW_BALL, MOVE_PSYCHIC, MOVE_THUNDERBOLT, MOVE_SLUDGE_BOMB},
    },
};

static const struct TrainerMon sParty_EliteFourLance2[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 68,
        .species = SPECIES_GYARADOS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_DRAGON_DANCE, MOVE_EARTHQUAKE, MOVE_THUNDER_WAVE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 66,
        .species = SPECIES_DRAGONITE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_EARTHQUAKE, MOVE_DRAGON_CLAW, MOVE_FLAMETHROWER},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 66,
        .species = SPECIES_KINGDRA,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_DRAGON_DANCE, MOVE_SURF, MOVE_ICE_BEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 70,
        .species = SPECIES_AERODACTYL,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYPER_BEAM, MOVE_ANCIENT_POWER, MOVE_AERIAL_ACE, MOVE_EARTHQUAKE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 72,
        .species = SPECIES_DRAGONITE,
        .heldItem = ITEM_PERSIM_BERRY,
        .moves = {MOVE_HYPER_BEAM, MOVE_OUTRAGE, MOVE_THUNDERBOLT, MOVE_ICE_BEAM},
    },
};

static const struct TrainerMon sParty_ChampionRematchSquirtle[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 72,
        .species = SPECIES_HERACROSS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_MEGAHORN, MOVE_EARTHQUAKE, MOVE_COUNTER, MOVE_ROCK_TOMB},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_ALAKAZAM,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_PSYCHIC, MOVE_SHADOW_BALL, MOVE_CALM_MIND, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 72,
        .species = SPECIES_TYRANITAR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_CRUNCH, MOVE_EARTHQUAKE, MOVE_THUNDERBOLT, MOVE_AERIAL_ACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_ARCANINE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_EXTREME_SPEED, MOVE_OVERHEAT, MOVE_AERIAL_ACE, MOVE_IRON_TAIL},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_EXEGGUTOR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_GIGA_DRAIN, MOVE_PSYCHIC, MOVE_SLEEP_POWDER, MOVE_LIGHT_SCREEN},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 75,
        .species = SPECIES_BLASTOISE,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_HYDRO_PUMP, MOVE_ICE_BEAM, MOVE_EARTHQUAKE, MOVE_RAIN_DANCE},
    },
};

static const struct TrainerMon sParty_ChampionRematchBulbasaur[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 72,
        .species = SPECIES_HERACROSS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_MEGAHORN, MOVE_EARTHQUAKE, MOVE_COUNTER, MOVE_ROCK_TOMB},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_ALAKAZAM,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_PSYCHIC, MOVE_SHADOW_BALL, MOVE_CALM_MIND, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 72,
        .species = SPECIES_TYRANITAR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_CRUNCH, MOVE_EARTHQUAKE, MOVE_THUNDERBOLT, MOVE_AERIAL_ACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_GYARADOS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYDRO_PUMP, MOVE_DRAGON_DANCE, MOVE_EARTHQUAKE, MOVE_HYPER_BEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_ARCANINE,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_EXTREME_SPEED, MOVE_OVERHEAT, MOVE_AERIAL_ACE, MOVE_IRON_TAIL},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 75,
        .species = SPECIES_VENUSAUR,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_SOLAR_BEAM, MOVE_SLUDGE_BOMB, MOVE_EARTHQUAKE, MOVE_SUNNY_DAY},
    },
};

static const struct TrainerMon sParty_ChampionRematchCharmander[] = {
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 72,
        .species = SPECIES_HERACROSS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_MEGAHORN, MOVE_EARTHQUAKE, MOVE_COUNTER, MOVE_ROCK_TOMB},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_ALAKAZAM,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_PSYCHIC, MOVE_SHADOW_BALL, MOVE_CALM_MIND, MOVE_REFLECT},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 72,
        .species = SPECIES_TYRANITAR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_CRUNCH, MOVE_EARTHQUAKE, MOVE_THUNDERBOLT, MOVE_AERIAL_ACE},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_EXEGGUTOR,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_GIGA_DRAIN, MOVE_PSYCHIC, MOVE_SLEEP_POWDER, MOVE_LIGHT_SCREEN},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 73,
        .species = SPECIES_GYARADOS,
        .heldItem = ITEM_NONE,
        .moves = {MOVE_HYDRO_PUMP, MOVE_DRAGON_DANCE, MOVE_EARTHQUAKE, MOVE_HYPER_BEAM},
    },
    {
        .iv = TRAINER_PARTY_IVS(31, 31, 31, 31, 31, 31),
        .lvl = 75,
        .species = SPECIES_CHARIZARD,
        .heldItem = ITEM_SITRUS_BERRY,
        .moves = {MOVE_FIRE_BLAST, MOVE_DRAGON_CLAW, MOVE_AERIAL_ACE, MOVE_EARTHQUAKE},
    },
};

static const struct TrainerMon sParty_CueBallPaxton[] = {
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 39,
        .species = SPECIES_WEEZING,
    },
    {
        .iv = TRAINER_PARTY_IVS(6, 6, 6, 6, 6, 6),
        .lvl = 39,
        .species = SPECIES_MUK,
    },
};

static const struct TrainerMon sParty_TestBattle[] = {
    {
        .lvl = 14,
        .species = SPECIES_VENUSAUR,
        .heldItem = ITEM_VENUSAURITE,
    },
    {
        .lvl = 14,
        .species = SPECIES_CHARIZARD,
    },
        {
        .lvl = 14,
        .species = SPECIES_BLASTOISE,
    },
};
