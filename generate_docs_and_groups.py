# import markdown

pokes = [
  ('NONE', 'NULL'),

  ('BULBASAUR', 'GrassStarter1'),
  ('IVYSAUR', 'GrassStarter2'),
  ('VENUSAUR', 'GrassStarter3'),

  ('CHARMANDER', 'FireStarter1'),
  ('CHARMELEON', 'FireStarter2'),
  ('CHARIZARD', 'FireStarter3'),

  ('SQUIRTLE', 'WaterStarter1'),
  ('WARTORTLE', 'WaterStarter2'),
  ('BLASTOISE', 'WaterStarter3'),

  ('CATERPIE', 'GrassBug1'),
  ('METAPOD', 'GrassBug1'),
  ('BUTTERFREE', 'GrassBug3'),

  ('WEEDLE', 'GrassBug1'),
  ('KAKUNA', 'GrassBug1'),
  ('BEEDRILL', 'GrassBug3'),

  ('PIDGEY', 'NormalFlying1'),
  ('PIDGEOTTO', 'NormalFlying2'),
  ('PIDGEOT', 'SafariZone'),

  ('RATTATA', 'NormalFlying1'),
  ('RATICATE', 'NormalFlying2'),

  ('SPEAROW', 'NormalFlying1'),
  ('FEAROW', 'NormalFlying2'),

  ('EKANS', 'Overworld'),
  ('ARBOK', 'SafariZone'),

  ('PIKACHU', 'Overworld'),
  ('RAICHU', 'SafariZone'),

  ('SANDSHREW', 'Overworld'),
  ('SANDSLASH', 'SafariZone'),

  ('NIDORAN_F', 'Overworld'),
  ('NIDORINA', 'SafariZone'),
  ('NIDOQUEEN', 'SafariZone'),

  ('NIDORAN_M', 'Overworld'),
  ('NIDORINO', 'SafariZone'),
  ('NIDOKING', 'SafariZone'),

  ('CLEFAIRY', 'Spooky1'),
  ('CLEFABLE', 'Spooky2'),

  ('VULPIX', 'Overworld'),
  ('NINETALES', 'SafariZone'),

  ('JIGGLYPUFF', 'Spooky1'),
  ('WIGGLYTUFF', 'Spooky2'),

  ('ZUBAT', 'Cave1'),
  ('GOLBAT', 'Spooky1'),

  ('ODDISH', 'GrassBug2'),
  ('GLOOM', 'GrassBug3'),
  ('VILEPLUME', 'SafariZone'),

  ('PARAS', 'Cave1'),
  ('PARASECT', 'SafariZone'),

  ('VENONAT', 'GrassBug2'),
  ('VENOMOTH', 'SafariZone'),

  ('DIGLETT', 'Cave1'),
  ('DUGTRIO', 'Cave2'),

  ('MEOWTH', 'Overworld'),
  ('PERSIAN', 'SafariZone'),

  ('PSYDUCK', 'WaterIce1'),
  ('GOLDUCK', 'SafariZone'),

  ('MANKEY', 'Overworld'),
  ('PRIMEAPE', 'SafariZone'),

  ('GROWLITHE', 'Overworld'),
  ('ARCANINE', 'SafariZone'),

  ('POLIWAG', 'WaterIce1'),
  ('POLIWHIRL', 'WaterIce2'),
  ('POLIWRATH', 'NotCatchable'),

  ('ABRA', 'Overworld'),
  ('KADABRA', 'SafariZone'),
  ('ALAKAZAM', 'NotCatchable'),

  ('MACHOP', 'Cave1'),
  ('MACHOKE', 'Cave2'),
  ('MACHAMP', 'NotCatchable'),

  ('BELLSPROUT', 'GrassBug2'),
  ('WEEPINBELL', 'GrassBug3'),
  ('VICTREEBEL', 'SafariZone'),

  ('TENTACOOL', 'WaterIce1'),
  ('TENTACRUEL', 'WaterIce2'),

  ('GEODUDE', 'Cave1'),
  ('GRAVELER', 'Cave2'),
  ('GOLEM', 'NotCatchable'),

  ('PONYTA', 'Overworld'),
  ('RAPIDASH', 'SafariZone'),

  ('SLOWPOKE', 'WaterIce1'),
  ('SLOWBRO', 'WaterIce2'),

  ('MAGNEMITE', 'Urban1'),
  ('MAGNETON', 'Urban2'),

  ('FARFETCHD', 'NormalFlying1'),

  ('DODUO', 'NormalFlying2'),
  ('DODRIO', 'NormalFlying2'),

  ('SEEL', 'WaterIce1'),
  ('DEWGONG', 'WaterIce2'),

  ('GRIMER', 'Urban1'),
  ('MUK', 'Urban2'),

  ('SHELLDER', 'WaterIce1'),
  ('CLOYSTER', 'WaterIce2'),

  ('GASTLY', 'Spooky1'),
  ('HAUNTER', 'Spooky2'),
  ('GENGAR', 'NotCatchable'),

  ('ONIX', 'Cave2'),

  ('DROWZEE', 'Overworld'),
  ('HYPNO', 'SafariZone'),

  ('KRABBY', 'WaterIce1'),
  ('KINGLER', 'WaterIce2'),

  ('VOLTORB', 'Urban1'),
  ('ELECTRODE', 'Urban2'),

  ('EXEGGCUTE', 'GrassBug2'),
  ('EXEGGUTOR', 'SafariZone'),

  ('CUBONE', 'Spooky1'),
  ('MAROWAK', 'Spooky2'),

  ('HITMONLEE', 'Cave2'),
  ('HITMONCHAN', 'Cave2'),

  ('LICKITUNG', 'Overworld'),

  ('KOFFING', 'Urban1'),
  ('WEEZING', 'Urban2'),

  ('RHYHORN', 'SafariZone'),
  ('RHYDON', 'SafariZone'),

  ('CHANSEY', 'SafariZone'),

  ('TANGELA', 'GrassBug2'),

  ('KANGASKHAN', 'SafariZone'),

  ('HORSEA', 'WaterIce1'),
  ('SEADRA', 'WaterIce2'),

  ('GOLDEEN', 'WaterIce1'),
  ('SEAKING', 'WaterIce2'),

  ('STARYU', 'WaterIce1'),
  ('STARMIE', 'WaterIce2'),

  ('MR_MIME', 'Urban1'),

  ('SCYTHER', 'GrassBug2'),

  ('JYNX', 'Urban1'),

  ('ELECTABUZZ', 'Urban1'),

  ('MAGMAR', 'Urban1'),

  ('PINSIR', 'GrassBug2'),

  ('TAUROS', 'SafariZone'),

  ('MAGIKARP', 'WaterIce1'),
  ('GYARADOS', 'WaterIce2'),

  ('LAPRAS', 'WaterIce2'),

  ('DITTO', 'Urban1'),

  ('EEVEE', 'Urban1'),
  ('VAPOREON', 'WaterIce2'),
  ('JOLTEON', 'Urban2'),
  ('FLAREON', 'Urban2'),

  ('PORYGON', 'Urban1'),

  ('OMANYTE', 'WaterIce1'),
  ('OMASTAR', 'WaterIce2'),

  ('KABUTO', 'WaterIce1'),
  ('KABUTOPS', 'WaterIce2'),

  ('AERODACTYL', 'SafariZone'),

  ('SNORLAX', 'SafariZone'),

  ('ARTICUNO', 'Legendary'),
  ('ZAPDOS', 'Legendary'),
  ('MOLTRES', 'Legendary'),

  ('DRATINI', 'WaterIce1'),
  ('DRAGONAIR', 'CeruleanCave'),
  ('DRAGONITE', 'NotCatchable'),

  ('MEWTWO', 'NotInGame'),

  ('MEW', 'NotInGame'),

  ('CHIKORITA', 'GrassStarter1'),
  ('BAYLEEF', 'GrassStarter2'),
  ('MEGANIUM', 'GrassStarter3'),

  ('CYNDAQUIL', 'FireStarter1'),
  ('QUILAVA', 'FireStarter2'),
  ('TYPHLOSION', 'FireStarter3'),

  ('TOTODILE', 'WaterStarter1'),
  ('CROCONAW', 'WaterStarter2'),
  ('FERALIGATR', 'WaterStarter3'),

  ('SENTRET', 'NormalFlying1'),
  ('FURRET', 'NormalFlying2'),

  ('HOOTHOOT', 'NormalFlying1'),
  ('NOCTOWL', 'NormalFlying2'),

  ('LEDYBA', 'GrassBug1'),
  ('LEDIAN', 'GrassBug2'),

  ('SPINARAK', 'GrassBug1'),
  ('ARIADOS', 'GrassBug2'),

  ('CROBAT', 'Spooky2'),

  ('CHINCHOU', 'WaterIce1'),
  ('LANTURN', 'WaterIce2'),

  ('PICHU', 'EarlyBoost'),
  ('CLEFFA', 'Spooky1'),
  ('IGGLYBUFF', 'Spooky1'),

  ('TOGEPI', 'EarlyBoost'),
  ('TOGETIC', 'Urban1'),

  ('NATU', 'NormalFlying1'),
  ('XATU', 'NormalFlying2'),

  ('MAREEP', 'Overworld'),
  ('FLAAFFY', 'SafariZone'),
  ('AMPHAROS', 'SafariZone'),

  ('BELLOSSOM', 'SafariZone'),

  ('MARILL', 'WaterIce1'),
  ('AZUMARILL', 'WaterIce2'),

  ('SUDOWOODO', 'Overworld'),

  ('POLITOED', 'NotCatchable'),

  ('HOPPIP', 'NormalFlying1'),
  ('SKIPLOOM', 'GrassBug2'),
  ('JUMPLUFF', 'GrassBug3'),

  ('AIPOM', 'NormalFlying1'),

  ('SUNKERN', 'GrassBug1'),
  ('SUNFLORA', 'GrassBug2'),

  ('YANMA', 'GrassBug1'),

  ('WOOPER', 'WaterIce1'),
  ('QUAGSIRE', 'WaterIce2'),

  ('ESPEON', 'Spooky2'),
  ('UMBREON', 'Cave2'),

  ('MURKROW', 'Spooky1'),

  ('SLOWKING', 'SafariZone'),

  ('MISDREAVUS', 'Spooky1'),

  ('UNOWN', 'NotInGame'),

  ('WOBBUFFET', 'NotInGame'),

  ('GIRAFARIG', 'Overworld'),

  ('PINECO', 'GrassBug1'),
  ('FORRETRESS', 'GrassBug3'),

  ('DUNSPARCE', 'Cave1'),

  ('GLIGAR', 'Cave1'),

  ('STEELIX', 'Cave2'),

  ('SNUBBULL', 'NormalFlying1'),
  ('GRANBULL', 'NormalFlying2'),

  ('QWILFISH', 'WaterIce1'),

  ('SCIZOR', 'SafariZone'),

  ('SHUCKLE', 'Cave1'),

  ('HERACROSS', 'GrassBug2'),

  ('SNEASEL', 'Cave1'),

  ('TEDDIURSA', 'NormalFlying1'),
  ('URSARING', 'NormalFlying2'),

  ('SLUGMA', 'Urban1'),
  ('MAGCARGO', 'Urban2'),

  ('SWINUB', 'Cave1'),
  ('PILOSWINE', 'Cave2'),

  ('CORSOLA', 'WaterIce1'),

  ('REMORAID', 'WaterIce1'),
  ('OCTILLERY', 'WaterIce2'),

  ('DELIBIRD', 'NormalFlying1'),

  ('MANTINE', 'WaterIce1'),

  ('SKARMORY', 'NormalFlying2'),

  ('HOUNDOUR', 'Overworld'),
  ('HOUNDOOM', 'SafariZone'),

  ('KINGDRA', 'NotCatchable'),

  ('PHANPY', 'Overworld'),
  ('DONPHAN', 'SafariZone'),

  ('PORYGON2', 'Urban2'),

  ('STANTLER', 'NormalFlying1'),
  ('SMEARGLE', 'NotInGame'),

  ('TYROGUE', 'Cave1'),

  ('HITMONTOP', 'Cave2'),

  ('SMOOCHUM', 'EarlyBoost'),

  ('ELEKID', 'EarlyBoost'),

  ('MAGBY', 'EarlyBoost'),

  ('MILTANK', 'Overworld'),

  ('BLISSEY', 'SafariZone'),

  ('RAIKOU', 'NotInGame'),
  ('ENTEI', 'NotInGame'),
  ('SUICUNE', 'NotInGame'),

  ('LARVITAR', 'Spooky1'),
  ('PUPITAR', 'CeruleanCave'),
  ('TYRANITAR', 'NotCatchable'),

  ('LUGIA', 'NotInGame'),
  ('HO_OH', 'NotInGame'),

  ('CELEBI', 'NotInGame'),

  ('TREECKO', 'GrassStarter1'),
  ('GROVYLE', 'GrassStarter2'),
  ('SCEPTILE', 'GrassStarter3'),

  ('TORCHIC', 'FireStarter1'),
  ('COMBUSKEN', 'FireStarter2'),
  ('BLAZIKEN', 'FireStarter3'),

  ('MUDKIP', 'WaterStarter1'),
  ('MARSHTOMP', 'WaterStarter2'),
  ('SWAMPERT', 'WaterStarter3'),

  ('POOCHYENA', 'NormalFlying1'),
  ('MIGHTYENA', 'NormalFlying2'),

  ('ZIGZAGOON', 'NormalFlying1'),
  ('LINOONE', 'NormalFlying2'),

  ('WURMPLE', 'GrassBug1'),
  ('SILCOON', 'GrassBug1'),
  ('BEAUTIFLY', 'GrassBug3'),
  ('CASCOON', 'Cave1'),
  ('DUSTOX', 'GrassBug3'),

  ('LOTAD', 'GrassBug2'),
  ('LOMBRE', 'GrassBug3'),
  ('LUDICOLO', 'SafariZone'),

  ('SEEDOT', 'GrassBug2'),
  ('NUZLEAF', 'GrassBug3'),
  ('SHIFTRY', 'SafariZone'),

  ('TAILLOW', 'NormalFlying1'),
  ('SWELLOW', 'NormalFlying2'),

  ('WINGULL', 'WaterIce1'),
  ('PELIPPER', 'WaterIce2'),

  ('RALTS', 'Overworld'),
  ('KIRLIA', 'SafariZone'),
  ('GARDEVOIR', 'NotCatchable'),

  ('SURSKIT', 'WaterIce1'),
  ('MASQUERAIN', 'WaterIce2'),

  ('SHROOMISH', 'GrassBug2'),
  ('BRELOOM', 'GrassBug3'),

  ('SLAKOTH', 'Overworld'),
  ('VIGOROTH', 'SafariZone'),
  ('SLAKING', 'NotCatchable'),

  ('NINCADA', 'GrassBug1'),
  ('NINJASK', 'GrassBug3'),
  ('SHEDINJA', 'NotInGame'),

  ('WHISMUR', 'Cave1'),
  ('LOUDRED', 'Cave2'),
  ('EXPLOUD', 'NotCatchable'),

  ('MAKUHITA', 'Cave1'),
  ('HARIYAMA', 'Cave2'),

  ('AZURILL', 'EarlyBoost'),

  ('NOSEPASS', 'Cave1'),

  ('SKITTY', 'Overworld'),
  ('DELCATTY', 'SafariZone'),

  ('SABLEYE', 'Spooky1'),

  ('MAWILE', 'Spooky1'),

  ('ARON', 'Cave1'),
  ('LAIRON', 'Cave2'),
  ('AGGRON', 'NotCatchable'),

  ('MEDITITE', 'Cave1'),
  ('MEDICHAM', 'Cave2'),

  ('ELECTRIKE', 'Overworld'),
  ('MANECTRIC', 'SafariZone'),

  ('PLUSLE', 'Urban1'),

  ('MINUN', 'NotInGame'),

  ('VOLBEAT', 'GrassBug1'),

  ('ILLUMISE', 'GrassBug2'),

  ('ROSELIA', 'GrassBug2'),

  ('GULPIN', 'Overworld'),
  ('SWALOT', 'SafariZone'),

  ('CARVANHA', 'WaterIce1'),
  ('SHARPEDO', 'WaterIce2'),

  ('WAILMER', 'WaterIce1'),
  ('WAILORD', 'WaterIce2'),

  ('NUMEL', 'Overworld'),
  ('CAMERUPT', 'SafariZone'),

  ('TORKOAL', 'SafariZone'),

  ('SPOINK', 'Overworld'),
  ('GRUMPIG', 'SafariZone'),

  ('SPINDA', 'NormalFlying1'),

  ('TRAPINCH', 'Overworld'),
  ('VIBRAVA', 'CeruleanCave'),
  ('FLYGON', 'NotCatchable'),

  ('CACNEA', 'GrassBug2'),
  ('CACTURNE', 'GrassBug3'),

  ('SWABLU', 'NormalFlying1'),
  ('ALTARIA', 'NormalFlying2'),

  ('ZANGOOSE', 'Overworld'),

  ('SEVIPER', 'Overworld'),

  ('LUNATONE', 'Cave1'),

  ('SOLROCK', 'Overworld'),

  ('BARBOACH', 'WaterIce1'),
  ('WHISCASH', 'WaterIce2'),

  ('CORPHISH', 'WaterIce1'),
  ('CRAWDAUNT', 'WaterIce2'),

  ('BALTOY', 'Spooky1'),
  ('CLAYDOL', 'Spooky2'),

  ('LILEEP', 'GrassBug2'),
  ('CRADILY', 'GrassBug3'),

  ('ANORITH', 'Cave1'),
  ('ARMALDO', 'Cave2'),

  ('FEEBAS', 'WaterIce1'),
  ('MILOTIC', 'WaterIce2'),

  ('CASTFORM', 'NotInGame'),

  ('KECLEON', 'Overworld'),

  ('SHUPPET', 'Spooky1'),
  ('BANETTE', 'Spooky2'),

  ('DUSKULL', 'Spooky1'),
  ('DUSCLOPS', 'Spooky2'),

  ('TROPIUS', 'Overworld'),

  ('CHIMECHO', 'Overworld'),

  ('ABSOL', 'Overworld'),

  ('WYNAUT', 'NotInGame'),

  ('SNORUNT', 'Cave1'),
  ('GLALIE', 'Cave2'),

  ('SPHEAL', 'WaterIce1'),
  ('SEALEO', 'WaterIce2'),
  ('WALREIN', 'SafariZone'),

  ('CLAMPERL', 'WaterIce1'),
  ('HUNTAIL', 'WaterIce2'),
  ('GOREBYSS', 'WaterIce2'),

  ('RELICANTH', 'WaterIce1'),

  ('LUVDISC', 'NotInGame'),

  ('BAGON', 'GrassBug2'),
  ('SHELGON', 'CeruleanCave'),
  ('SALAMENCE', 'NotCatchable'),

  ('BELDUM', 'Urban1'),
  ('METANG', 'CeruleanCave'),
  ('METAGROSS', 'NotCatchable'),

  ('REGIROCK', 'NotInGame'),
  ('REGICE', 'NotInGame'),
  ('REGISTEEL', 'NotInGame'),

  ('LATIAS', 'NotInGame'),
  ('LATIOS', 'NotInGame'),

  ('KYOGRE', 'NotInGame'),
  ('GROUDON', 'NotInGame'),
  ('DUSKNOIR', 'NotInGame'),

  ('JIRACHI', 'NotInGame'),

  ('DEOXYS', 'NotInGame'),

  ('TURTWIG', 'NULL'),
  ('GROTLE', 'NULL'),
  ('TORTERRA', 'NULL'),
  ('CHIMCHAR', 'NULL'),
  ('MONFERNO', 'NULL'),
  ('INFERNAPE', 'NULL'),
  ('PIPLUP', 'NULL'),
  ('PRINPLUP', 'NULL'),
  ('EMPOLEON', 'NULL'),
  ('STARLY', 'NULL'),
  ('STARAVIA', 'NULL'),
  ('STARAPTOR', 'NULL'),
  ('BIDOOF', 'NULL'),
  ('BIBAREL', 'NULL'),
  ('KRICKETOT', 'NULL'),
  ('KRICKETUNE', 'NULL'),
  ('SHINX', 'NULL'),
  ('LUXIO', 'NULL'),
  ('LUXRAY', 'NULL'),
  ('BUDEW', 'EarlyBoost'),
  ('ROSERADE', 'GrassBug3'),
  ('CRANIDOS', 'NULL'),
  ('RAMPARDOS', 'NULL'),
  ('SHIELDON', 'NULL'),
  ('BASTIODON', 'NULL'),
  ('BURMY', 'NULL'),
  ('WORMADAM', 'NULL'),
  ('MOTHIM', 'NULL'),
  ('COMBEE', 'NULL'),
  ('VESPIQUEN', 'NULL'),
  ('PACHIRISU', 'NULL'),
  ('BUIZEL', 'NULL'),
  ('FLOATZEL', 'NULL'),
  ('CHERUBI', 'NULL'),
  ('CHERRIM', 'NULL'),
  ('SHELLOS', 'NULL'),
  ('GASTRODON', 'NULL'),
  ('AMBIPOM', 'NormalFlying2'),
  ('DRIFLOON', 'NULL'),
  ('DRIFBLIM', 'NULL'),
  ('BUNEARY', 'NULL'),
  ('LOPUNNY', 'NULL'),
  ('MISMAGIUS', 'Spooky2'),
  ('HONCHKROW', 'Spooky2'),
  ('GLAMEOW', 'NULL'),
  ('PURUGLY', 'NULL'),
  ('CHINGLING', 'NotInGame'),
  ('STUNKY', 'NULL'),
  ('SKUNTANK', 'NULL'),
  ('BRONZOR', 'NULL'),
  ('BRONZONG', 'NULL'),
  ('BONSLY', 'NotInGame'),
  ('MIME_JR', 'EarlyBoost'),
  ('HAPPINY', 'Overworld'),
  ('CHATOT', 'NULL'),
  ('SPIRITOMB', 'NULL'),
  ('GIBLE', 'NULL'),
  ('GABITE', 'NULL'),
  ('GARCHOMP', 'NULL'),
  ('MUNCHLAX', 'Overworld'),
  ('RIOLU', 'NULL'),
  ('LUCARIO', 'NULL'),
  ('HIPPOPOTAS', 'NULL'),
  ('HIPPOWDON', 'NULL'),
  ('SKORUPI', 'NULL'),
  ('DRAPION', 'NULL'),
  ('CROAGUNK', 'NULL'),
  ('TOXICROAK', 'NULL'),
  ('CARNIVINE', 'NULL'),
  ('FINNEON', 'NULL'),
  ('LUMINEON', 'NULL'),
  ('MANTYKE', 'NotInGame'),
  ('SNOVER', 'NULL'),
  ('ABOMASNOW', 'NULL'),
  ('WEAVILE', 'Cave2'),
  ('MAGNEZONE', 'NotCatchable'),
  ('LICKILICKY', 'SafariZone'),
  ('RHYPERIOR', 'NotCatchable'),
  ('TANGROWTH', 'GrassBug3'),
  ('ELECTIVIRE', 'Urban2'),
  ('MAGMORTAR', 'Urban2'),
  ('TOGEKISS', 'Urban2'),
  ('YANMEGA', 'GrassBug3'),
  ('LEAFEON', 'GrassBug3'),
  ('GLACEON', 'WaterIce2'),
  ('GLISCOR', 'Cave2'),
  ('MAMOSWINE', 'NotCatchable'),
  ('PORYGON_Z', 'NotCatchable'),
  ('GALLADE', 'NotCatchable'),
  ('PROBOPASS', 'Cave2'),
  ('DUSKNOIR', 'NotCatchable'),
  ('FROSLASS', 'Spooky2'),
  ('ROTOM', 'NULL'),
  ('UXIE', 'NULL'),
  ('MESPRIT', 'NULL'),
  ('AZELF', 'NULL'),
  ('DIALGA', 'NULL'),
  ('PALKIA', 'NULL'),
  ('HEATRAN', 'NULL'),
  ('REGIGIGAS', 'NULL'),
  ('GIRATINA', 'NULL'),
  ('CRESSELIA', 'NULL'),
  ('PHIONE', 'NULL'),
  ('MANAPHY', 'NULL'),
  ('DARKRAI', 'NULL'),
  ('SHAYMIN', 'NULL'),
  ('ARCEUS', 'NULL'),

  ('OLD_UNOWN_B', 'NULL'),
  ('OLD_UNOWN_C', 'NULL'),
  ('OLD_UNOWN_D', 'NULL'),
  ('OLD_UNOWN_E', 'NULL'),
  ('OLD_UNOWN_F', 'NULL'),
  ('OLD_UNOWN_G', 'NULL'),
  ('OLD_UNOWN_H', 'NULL'),
  ('OLD_UNOWN_I', 'NULL'),
  ('OLD_UNOWN_J', 'NULL'),
  ('OLD_UNOWN_K', 'NULL'),
  ('OLD_UNOWN_L', 'NULL'),
  ('OLD_UNOWN_M', 'NULL'),
  ('OLD_UNOWN_N', 'NULL'),
  ('OLD_UNOWN_O', 'NULL'),
  ('OLD_UNOWN_P', 'NULL'),
  ('OLD_UNOWN_Q', 'NULL'),
  ('OLD_UNOWN_R', 'NULL'),
  ('OLD_UNOWN_S', 'NULL'),
  ('OLD_UNOWN_T', 'NULL'),
  ('OLD_UNOWN_U', 'NULL'),
  ('OLD_UNOWN_V', 'NULL'),
  ('OLD_UNOWN_W', 'NULL'),
  ('OLD_UNOWN_X', 'NULL'),
  ('OLD_UNOWN_Y', 'NULL'),
  ('OLD_UNOWN_Z', 'NULL'),

  ('EGG', 'NULL'),
  ('UNOWN_B', 'NULL'),
  ('UNOWN_C', 'NULL'),
  ('UNOWN_D', 'NULL'),
  ('UNOWN_E', 'NULL'),
  ('UNOWN_F', 'NULL'),
  ('UNOWN_G', 'NULL'),
  ('UNOWN_H', 'NULL'),
  ('UNOWN_I', 'NULL'),
  ('UNOWN_J', 'NULL'),
  ('UNOWN_K', 'NULL'),
  ('UNOWN_L', 'NULL'),
  ('UNOWN_M', 'NULL'),
  ('UNOWN_N', 'NULL'),
  ('UNOWN_O', 'NULL'),
  ('UNOWN_P', 'NULL'),
  ('UNOWN_Q', 'NULL'),
  ('UNOWN_R', 'NULL'),
  ('UNOWN_S', 'NULL'),
  ('UNOWN_T', 'NULL'),
  ('UNOWN_U', 'NULL'),
  ('UNOWN_V', 'NULL'),
  ('UNOWN_W', 'NULL'),
  ('UNOWN_X', 'NULL'),
  ('UNOWN_Y', 'NULL'),
  ('UNOWN_Z', 'NULL'),
  ('UNOWN_EMARK', 'NULL'),
  ('UNOWN_QMARK', 'NULL'),
]

c_top = '''
#ifndef GUARD_AUTOGENERATED_POKEMON_GROUPS_H
#define GUARD_AUTOGENERATED_POKEMON_GROUPS_H

// +------------------------------------------------------+
// | !!! AUTOGENERATED BY generate_docs_and_groups.py !!! |
// +------------------------------------------------------+

#include "data.h"
#include "global.h"

'''

c_bottom = 'const u16* const gMonGroups[] =\n{\n  [SPECIES_NONE] = NULL,\n'

groups = {
  'EarlyBoost': [],
  'NormalFlying1': [],
  'NormalFlying2': [],
  'Cave1': [],
  'Cave2': [],
  'GrassBug1': [],
  'GrassBug2': [],
  'GrassBug3': [],
  'Spooky1': [],
  'Spooky2': [],
  'Urban1': [],
  'Urban2': [],
  'WaterIce1': [],
  'WaterIce2': [],
  'Overworld': [],
  'SafariZone': [],
  'CeruleanCave': [],
  'NotCatchable': [],
  'Legendary': [],
  'NotInGame': [],
}

def rel_nat_dex_pos(x):
  # Machop, Gastly, Togetic, Trapinch, and Happiny
  # are much better than their dex numbers suggest.
  if x in set([66, 92, 176, 328, 440]):
    return 0.9
  if x <= 151:
    return x / 151
  if x <= 251:
    # Johto dex is small and has good pokemon, so scale them.
    return (x - 151) / (251 - 151) * 0.95 + 0.025
  if x <= 386:
    return (x - 251) / (386 - 251)
  return (x - 386) / (494 - 386)

sorted_dex_nums = sorted([x for x in range(1, 494)], key=rel_nat_dex_pos)
for pokedex_num in sorted_dex_nums:
  (poke_name, group_name) = pokes[pokedex_num]
  if group_name == 'NULL':
    continue
  if group_name not in groups:
    groups[group_name] = []
  groups[group_name].append((pokedex_num, poke_name))
  if group_name != 'NotInGame':
    c_bottom += '  [SPECIES_' + poke_name + '] = gGroup_' + group_name + ',\n'
c_bottom += '};\n'

for starter_group in ['GrassStarter1', 'FireStarter1', 'WaterStarter1']:
  groups['EarlyBoost'].extend(groups[starter_group])

md = ''

for group_name, pokes_with_id in groups.items():
  if group_name == 'NULL':
    continue

  not_starter_group = 'Starter' not in group_name

  if not_starter_group:
    md += '| ' + group_name + ' |\n| --- |\n|'
  if group_name != "NotInGame":
    c = 'const u16 gGroup_' + group_name + '[] =\n{\n  /*SIZE=*/' + str(len(pokes_with_id)) + ',\n'
  else:
    c = ''

  for (poke_id, poke_name) in pokes_with_id:
    if not_starter_group:
      dex_num = str(poke_id).rjust(3, '0')
      image_url = 'https://www.serebii.net/pokedex-swsh/icon/' + dex_num + '.png'
      link_url = 'https://www.serebii.net/pokedex-dp/' + dex_num + '.shtml'
      md += '[![](' + image_url + " '" + poke_name + "')](" + link_url + ')'
    if group_name != "NotInGame":
      c += '  SPECIES_' + poke_name + ',\n'

  if not_starter_group:
    md += '|\n\n'
  if group_name != "NotInGame":
    c_top += c + '};\n\n'

with open('README.md', 'w') as md_file:
  md_file.write('''# Pokémon Challenge

A fork of https://github.com/pret/pokefirered that is meant to be played by multiple players in a timed challenge. The game doesn't support link battles -- players can battle using [Pokémon Showdown](https://pokemonshowdown.com/).

Major changes:
 - **Deterministic game seed:** Wild Pokémon, trainer Pokémon, and overworld items are randomized based on the Rival name specified at the beginning of the game. All non-key overworld items contain TMs. Some items may be randomly placed on water or in unreachable areas.
 - **Time limit:** After 5 hours pass, the player is locked in the Celadon Department Store. A PC and free Move Relearner are added to the Department Store. The game clock doesn't decrease while the START menu is active, including when the player is using the Pokémon summary screen, bag, etc. outside of battle.
 - **Level band:** Pokémon stop gaining experience if they become too overleveled compared to the rest of the team. Rare candies also stop working.
 - **Level scaling:** Wild and trainer Pokémon levels increase based on the player's party Pokémon levels and badge count.
 - **Gen 4 Pokemon, Moves, Abilities, & Items:** Most Gen 4 Pokémon in Gen 1-3 families (e.g. Munchlax, Weavile) are added, with Gen IV HG/SS learnsets and abilities. Many Gen IV moves and abilities aren't implemented properly, and instead placeholder effects. The full Pokémon list at the bottom of this page.
 - **New TMs and learnsets:** 60+ TMs are added to the game. Non-TM Egg moves and level 40+ moves are now also learned at level 1. TMs can teach moves that were previously only learnable via breeding or move tutors (NOTE: this is not currently supported for all moves, fix coming soon). 

Other changes:
 - Faster movement and text. Hold B to use normal walking speed.
 - Start the game with balls, healing items, the Old Rod, 6 Exp Shares, and more.
 - Starter Pokémon are randomized based on the game seed. There is still one grass, water, and fire starter, and they will be chosen from the gen 1-3 starters.
 - Move tutors give the player a random TM instead. Purchasable, winnable, and gift TMs are randomized.
 - Gym leaders give the player a Rare Candy in addition to a TM upon earning a badge.
 - Legendary birds give the player a Rare Candy upon defeat.
 - Overworld Pokémon (e.g. Snorlax, Articuno) can't be caught.
 - Physical/special split.
 - Pokémon that evolve above level 45 now evolve at level 45 instead.
 - Gift Pokémon are replaced with Dunsparce.
 - Game Corner prize Pokémon are replaced with baby Pokémon.
 - The Department Store desks on 5F now sell select battle items instead of their usual ones (notably excluding Choice Band). See full list [here](https://github.com/alecwshearer/poke-challenge/blob/master/data/maps/CeladonCity_DepartmentStore_5F/scripts.inc).
 - Items aren't sellable.
 - HMs are deletable without the Move Deleter.
 - Trade and happiness evolutions have been replaced with a new "Trade+ Stone", or Sun Stone & Moon Stone in cases where one Pokémon can evolve into multiple others (e.g. Eevee into Espeon or Umbreon). See full list [here](https://github.com/alecwshearer/poke-challenge/blob/master/src/data/pokemon/evolution.h).
 - Hidden items have been removed, except for Coins in the Game Corner.
 - Player finds the Good Rod where the Old Rod used to be, and Super Rod where Good Rod used to be. The Super Rod can also still be found at its original location.
 - The PC is accessible from the start menu. Pokémon no longer heal when sent to the PC.
 - Flash is no longer required in Rock Tunnel.
 - Player gets 10x the number of steps in the Safari Zone.
 - Shiny Pokémon odds are increased 10x.
 - Party menu shortcut for giving/taking Exp Shares.
 - The Arena Trap ability has been removed from the game.
 - Safari Balls are 53% more effective, which makes them 15% more effective than Ultra Balls.
 - Pewter, Cerulean, and Vermillion Marts sell Revives.
 - Some early events are skipped; e.g. the Old Man.
 - Slightly modified wild encounters:
   - Dragonair -> Seadra
   - Wobbuffet -> Dragonair
   - Unown -> Zubat
   - Smeargle -> Zubat

## Level band / level cap

A 5 level band is in place. A portion of the player's team must be within 5 levels, inclusive, of each other;
e.g. a range of 30-35 is valid but 30-36 isn’t. The number of Pokémon that must be within the band is equal
to the number of badges the player has plus 1. For example, the player has 3 badges, they must have 4 Pokémon
within 5 levels (inclusive) of each other. If the highest leveled Pokémon exceeds the top of the band (also called
the _level cap_), it will stop gaining experience until it is back within the band. Other party Pokémon holding an
EXP share will still gain EXP, but the Pokémon outside of the band won’t gain EXP (and the EXP it would have gained
won’t be distributed to the other party Pokémon).

The game will issue warnings when a Pokémon is near the current level cap, or the cap at the next badge. The latter
warning can be disabled in the OPTION menu.

## Level scaling

### Wild encounters

Wild Pokémon levels are scaled based on party Pokémon levels and the level that the wild Pokémon is
supposed to be at. This is done by replacing the highest party Pokémon level with the level that the
wild Pokémon is supposed to be at, and then taking the average level of party Pokémon that are required
to be within the level band, rounded down (floored).

#### Example

Input:
 - **Number of badges:** 3
 - **Required Pokémon in band:** 3 + 1 = 4
 - **Party Pokémon levels:** 25, 24, 22, 21, 12
 - **Level the wild Pokémon is supposed to be at:** 14

Output:
 - **Scaled level:** ⌊(14 + 24 + 22 + 21) / 4⌋ = ⌊81 / 4⌋ = 20

#### Exception for high level Pokémon

To disincentivize players from rushing to later routes to catch all of their Pokémon, wild Pokémon that
are supposed to be at level greater than or equal to the player's highest Pokémon will have their level
multiplied by 0.67 before it is plugged into the scaling formula.

### Trainer battles

Trainer Pokémon levels are increased based on the number of badges the player has. For each odd numbered badge,
odd numbered trainer Pokémon levels are increased by 1. For each even numbered badge, even numbered trainer
Pokémon levels are increased by 1.

#### Example

| Player badge count  | Trainer party levels     |
| ------------------- | ------------------------ |
| 0 (vanilla FireRed) |   10,   10,   11,   11   |
| 1                   | **11**, 10, **12**, 11   |
| 2                   |   11, **11**, 12, **12** |
| 3                   | **12**, 11, **13**, 12   |
| 4                   |   12, **12**, 13, **13** |
| 5                   | **13**, 12, **14**, 13   |
| 6                   |   13, **13**, 14, **14** |
| 7                   | **14**, 13, **15**, 14   |
| 8                   |   14, **14**, 15, **15** |

## Pokémon randomization

Each Pokémon belongs to a group. Based on the Rival name specified at the
beginning of the game, Pokémon encountered in the normal FireRed game are
replaced with Pokémon from their group, as described below.

### Wild encounters

For every "map set" (e.g. Route 1, Mt. Moon) in the game:
  - Non-fishing Pokémon with an encounter rate less than or equal to 20% are
  deterministically replaced with 1 species from their group.
  - Non-fishing Pokémon with an encounter rate greater than 20%
  are deterministically replaced with 2 species from their group. There is a ~66%
  and ~33% chance of encountering the 2 replacements, respectively. More powerful
  Pokémon are more likely to be the 33% replacement than the 66% one.
  - All fishing Pokémon are deterministically replaced with 1 species from their
  group, regardless of encounter rate.

#### Map sets

A "map set" gropus is a collection of game locations that use the same Pokémon
replacement mappings. Note that this is a term specific to this ROM-hack, and is
different than the "map group" concept in the FR/LG source code.

The list of map sets is below. Any map that isn't in this list is in its own map set:
- Mt. Moon 1F, B1F, B2F
- Rock Tunnel 1F, B1F
- Diglett's Cave North Entrace, South Entrance, B1F
- Pokémon Tower 4F, 5F, 6F
- Pokémon Tower 7F, 8F
- Pokémon Mansion 1F, B1F
- Pokémon Mansion 2F, 3F
- Seafoam Islands 1F, B1F, B2F
- Seafoam Islands B3F, B4F
- Victory Road 1F, 2F, 3F
- Mt. Ember Summit Path 1F, 2F, 3F

#### Early boost

Additionally, each non-water game map (not map set) is deterministically assigned a
single Pokémon from the `EarlyBoost` group. The chance of finding one of these
Pokémon starts at 4%, and decreases by 0.5% for each badge you have.

#### Example

![Mt. Moon map set example](map_set_example.png "Mt. Moon Map Set")

In Mt. Moon, each species is replaced with 1 or 2 species from their group, depending
on the catch rate. We see that Paras' second replacement is only encounterable on
floor B1F, because that's the only floor where Paras has a catch rate >20% in the
original game. The EarlyBoost Pokémon will have a rate of 0-4%, depending on the number
of badges the player has (other rates will be adjusted acordingly).

### Trainer battles

Trainer Pokémon are deterministically replaced with a single Pokémon from their group.

### Group list

''' + md)

with open('include/autogenerated_pokemon_groups.h', 'w') as c_file:
  c_file.write(c_top + c_bottom + '\n#endif\n')

