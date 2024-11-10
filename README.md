# Pokémon Challenge

A fork of https://github.com/pret/pokefirered that deterministically
seeds wild Pokémon, trainer Pokémon, and items based on the Rival
name specified at the beginning of the game.

NOTE: This ROM hack and README are a work-in-progress.

Other changes:
 - Faster movement and text
 - Physical/special split
 - Gen IV learnsets (though some moves aren't implemented properly)
 - Modified overworld Pokémon encounters
 - Slightly modified wild encounters:
   - In the Power Plant, Pikachu is replaced with Plusle
   - In the Safari Zone, Dratini is replaced with Gyarados
   - In the Safari Zone, Dragonair is replaced with Starmie

## Pokémon groups

Each Pokémon belongs to a group. Based on the Rival name specified at the
beginning of the game, Pokémon encountered in the normal FireRed game are
deterministically replaced with Pokémon from their group, as described below.

### Wild encounters

For every game map (i.e. route, dungeon room) in the game, each Pokémon species
that is normally discoverable in the wild is deterministically replaced with 2
species from its group. For example, Pidgey might be replaced by {Taillow, Hoothoot} 
in Route 1, and {Doduo, Pidgey} in Route 2. There's a ~66% and ~33% chance of
encountering the 2 replacements, respectively. 

Additionally, each non-water game map is deterministically assigned a single
"rare" Pokémon from the `Rare2Percent` group. There is a 2% chance of encountering
the "rare" Pokémon in each map.

**Example:** In the original game, there's a 50% chance of encountering Pidgey
in Route 1. In our first example above, there will be a ~33% chance of encountering
Taillow and 17% chance of encountering Hoothoot. There will also be a fixed 2% chance
of encountering the "rare" species assigned to the route; e.g. Dratini.

### Trainer battles

Trainer Pokémon are deterministically replaced with a single Pokémon from their group.

### Group list

NOTE: Groups above `Rare2Percent` in the list below contain species that can be found in
the wild before the Elite Four. Groups after `Rare2Percent` contain species that can only
be encountered in trainer battles or in the postgame. This can be useful when attempting
to determine which Pokémon are catchable in each route.

| Normal1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/019.png "RATTATA") ![](https://www.serebii.net/pokedex-swsh/icon/052.png "MEOWTH") ![](https://www.serebii.net/pokedex-swsh/icon/161.png "SENTRET") ![](https://www.serebii.net/pokedex-swsh/icon/190.png "AIPOM") ![](https://www.serebii.net/pokedex-swsh/icon/209.png "SNUBBULL") ![](https://www.serebii.net/pokedex-swsh/icon/261.png "POOCHYENA") ![](https://www.serebii.net/pokedex-swsh/icon/263.png "ZIGZAGOON") ![](https://www.serebii.net/pokedex-swsh/icon/300.png "SKITTY") ![](https://www.serebii.net/pokedex-swsh/icon/327.png "SPINDA") |

| Normal2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/020.png "RATICATE") ![](https://www.serebii.net/pokedex-swsh/icon/053.png "PERSIAN") ![](https://www.serebii.net/pokedex-swsh/icon/162.png "FURRET") ![](https://www.serebii.net/pokedex-swsh/icon/210.png "GRANBULL") ![](https://www.serebii.net/pokedex-swsh/icon/216.png "TEDDIURSA") ![](https://www.serebii.net/pokedex-swsh/icon/234.png "STANTLER") ![](https://www.serebii.net/pokedex-swsh/icon/262.png "MIGHTYENA") ![](https://www.serebii.net/pokedex-swsh/icon/264.png "LINOONE") ![](https://www.serebii.net/pokedex-swsh/icon/301.png "DELCATTY") |

| Bird1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/016.png "PIDGEY") ![](https://www.serebii.net/pokedex-swsh/icon/021.png "SPEAROW") ![](https://www.serebii.net/pokedex-swsh/icon/083.png "FARFETCHD") ![](https://www.serebii.net/pokedex-swsh/icon/084.png "DODUO") ![](https://www.serebii.net/pokedex-swsh/icon/163.png "HOOTHOOT") ![](https://www.serebii.net/pokedex-swsh/icon/198.png "MURKROW") ![](https://www.serebii.net/pokedex-swsh/icon/276.png "TAILLOW") |

| Bird2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/017.png "PIDGEOTTO") ![](https://www.serebii.net/pokedex-swsh/icon/022.png "FEAROW") ![](https://www.serebii.net/pokedex-swsh/icon/085.png "DODRIO") ![](https://www.serebii.net/pokedex-swsh/icon/164.png "NOCTOWL") ![](https://www.serebii.net/pokedex-swsh/icon/225.png "DELIBIRD") ![](https://www.serebii.net/pokedex-swsh/icon/227.png "SKARMORY") ![](https://www.serebii.net/pokedex-swsh/icon/277.png "SWELLOW") |

| Bug1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/010.png "CATERPIE") ![](https://www.serebii.net/pokedex-swsh/icon/013.png "WEEDLE") ![](https://www.serebii.net/pokedex-swsh/icon/048.png "VENONAT") ![](https://www.serebii.net/pokedex-swsh/icon/165.png "LEDYBA") ![](https://www.serebii.net/pokedex-swsh/icon/167.png "SPINARAK") ![](https://www.serebii.net/pokedex-swsh/icon/193.png "YANMA") ![](https://www.serebii.net/pokedex-swsh/icon/204.png "PINECO") ![](https://www.serebii.net/pokedex-swsh/icon/265.png "WURMPLE") |

| Bug2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/011.png "METAPOD") ![](https://www.serebii.net/pokedex-swsh/icon/014.png "KAKUNA") ![](https://www.serebii.net/pokedex-swsh/icon/046.png "PARAS") ![](https://www.serebii.net/pokedex-swsh/icon/266.png "SILCOON") ![](https://www.serebii.net/pokedex-swsh/icon/268.png "CASCOON") ![](https://www.serebii.net/pokedex-swsh/icon/290.png "NINCADA") ![](https://www.serebii.net/pokedex-swsh/icon/313.png "VOLBEAT") ![](https://www.serebii.net/pokedex-swsh/icon/314.png "ILLUMISE") |

| Bug3 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/012.png "BUTTERFREE") ![](https://www.serebii.net/pokedex-swsh/icon/015.png "BEEDRILL") ![](https://www.serebii.net/pokedex-swsh/icon/047.png "PARASECT") ![](https://www.serebii.net/pokedex-swsh/icon/049.png "VENOMOTH") ![](https://www.serebii.net/pokedex-swsh/icon/166.png "LEDIAN") ![](https://www.serebii.net/pokedex-swsh/icon/168.png "ARIADOS") ![](https://www.serebii.net/pokedex-swsh/icon/205.png "FORRETRESS") ![](https://www.serebii.net/pokedex-swsh/icon/267.png "BEAUTIFLY") ![](https://www.serebii.net/pokedex-swsh/icon/269.png "DUSTOX") ![](https://www.serebii.net/pokedex-swsh/icon/291.png "NINJASK") |

| Cave1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/050.png "DIGLETT") ![](https://www.serebii.net/pokedex-swsh/icon/066.png "MACHOP") ![](https://www.serebii.net/pokedex-swsh/icon/074.png "GEODUDE") ![](https://www.serebii.net/pokedex-swsh/icon/207.png "GLIGAR") ![](https://www.serebii.net/pokedex-swsh/icon/213.png "SHUCKLE") ![](https://www.serebii.net/pokedex-swsh/icon/220.png "SWINUB") ![](https://www.serebii.net/pokedex-swsh/icon/236.png "TYROGUE") ![](https://www.serebii.net/pokedex-swsh/icon/293.png "WHISMUR") ![](https://www.serebii.net/pokedex-swsh/icon/296.png "MAKUHITA") ![](https://www.serebii.net/pokedex-swsh/icon/299.png "NOSEPASS") ![](https://www.serebii.net/pokedex-swsh/icon/304.png "ARON") ![](https://www.serebii.net/pokedex-swsh/icon/307.png "MEDITITE") ![](https://www.serebii.net/pokedex-swsh/icon/345.png "LILEEP") ![](https://www.serebii.net/pokedex-swsh/icon/347.png "ANORITH") |

| Cave2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/051.png "DUGTRIO") ![](https://www.serebii.net/pokedex-swsh/icon/067.png "MACHOKE") ![](https://www.serebii.net/pokedex-swsh/icon/075.png "GRAVELER") ![](https://www.serebii.net/pokedex-swsh/icon/095.png "ONIX") ![](https://www.serebii.net/pokedex-swsh/icon/106.png "HITMONLEE") ![](https://www.serebii.net/pokedex-swsh/icon/107.png "HITMONCHAN") ![](https://www.serebii.net/pokedex-swsh/icon/215.png "SNEASEL") ![](https://www.serebii.net/pokedex-swsh/icon/237.png "HITMONTOP") ![](https://www.serebii.net/pokedex-swsh/icon/294.png "LOUDRED") ![](https://www.serebii.net/pokedex-swsh/icon/297.png "HARIYAMA") ![](https://www.serebii.net/pokedex-swsh/icon/305.png "LAIRON") ![](https://www.serebii.net/pokedex-swsh/icon/361.png "SNORUNT") |

| Spooky1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/035.png "CLEFAIRY") ![](https://www.serebii.net/pokedex-swsh/icon/039.png "JIGGLYPUFF") ![](https://www.serebii.net/pokedex-swsh/icon/041.png "ZUBAT") ![](https://www.serebii.net/pokedex-swsh/icon/042.png "GOLBAT") ![](https://www.serebii.net/pokedex-swsh/icon/092.png "GASTLY") ![](https://www.serebii.net/pokedex-swsh/icon/104.png "CUBONE") ![](https://www.serebii.net/pokedex-swsh/icon/140.png "KABUTO") ![](https://www.serebii.net/pokedex-swsh/icon/206.png "DUNSPARCE") ![](https://www.serebii.net/pokedex-swsh/icon/302.png "SABLEYE") ![](https://www.serebii.net/pokedex-swsh/icon/303.png "MAWILE") ![](https://www.serebii.net/pokedex-swsh/icon/337.png "LUNATONE") ![](https://www.serebii.net/pokedex-swsh/icon/343.png "BALTOY") ![](https://www.serebii.net/pokedex-swsh/icon/353.png "SHUPPET") ![](https://www.serebii.net/pokedex-swsh/icon/355.png "DUSKULL") |

| Spooky2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/036.png "CLEFABLE") ![](https://www.serebii.net/pokedex-swsh/icon/040.png "WIGGLYTUFF") ![](https://www.serebii.net/pokedex-swsh/icon/093.png "HAUNTER") ![](https://www.serebii.net/pokedex-swsh/icon/105.png "MAROWAK") ![](https://www.serebii.net/pokedex-swsh/icon/200.png "MISDREAVUS") ![](https://www.serebii.net/pokedex-swsh/icon/344.png "CLAYDOL") ![](https://www.serebii.net/pokedex-swsh/icon/354.png "BANETTE") ![](https://www.serebii.net/pokedex-swsh/icon/356.png "DUSCLOPS") |

| GrassRareBug1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/043.png "ODDISH") ![](https://www.serebii.net/pokedex-swsh/icon/069.png "BELLSPROUT") ![](https://www.serebii.net/pokedex-swsh/icon/102.png "EXEGGCUTE") ![](https://www.serebii.net/pokedex-swsh/icon/114.png "TANGELA") ![](https://www.serebii.net/pokedex-swsh/icon/187.png "HOPPIP") ![](https://www.serebii.net/pokedex-swsh/icon/191.png "SUNKERN") ![](https://www.serebii.net/pokedex-swsh/icon/270.png "LOTAD") ![](https://www.serebii.net/pokedex-swsh/icon/273.png "SEEDOT") ![](https://www.serebii.net/pokedex-swsh/icon/285.png "SHROOMISH") ![](https://www.serebii.net/pokedex-swsh/icon/315.png "ROSELIA") ![](https://www.serebii.net/pokedex-swsh/icon/331.png "CACNEA") |

| GrassRareBug2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/044.png "GLOOM") ![](https://www.serebii.net/pokedex-swsh/icon/070.png "WEEPINBELL") ![](https://www.serebii.net/pokedex-swsh/icon/123.png "SCYTHER") ![](https://www.serebii.net/pokedex-swsh/icon/127.png "PINSIR") ![](https://www.serebii.net/pokedex-swsh/icon/188.png "SKIPLOOM") ![](https://www.serebii.net/pokedex-swsh/icon/192.png "SUNFLORA") ![](https://www.serebii.net/pokedex-swsh/icon/214.png "HERACROSS") ![](https://www.serebii.net/pokedex-swsh/icon/271.png "LOMBRE") ![](https://www.serebii.net/pokedex-swsh/icon/274.png "NUZLEAF") ![](https://www.serebii.net/pokedex-swsh/icon/332.png "CACTURNE") |

| Urban1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/081.png "MAGNEMITE") ![](https://www.serebii.net/pokedex-swsh/icon/088.png "GRIMER") ![](https://www.serebii.net/pokedex-swsh/icon/100.png "VOLTORB") ![](https://www.serebii.net/pokedex-swsh/icon/109.png "KOFFING") ![](https://www.serebii.net/pokedex-swsh/icon/132.png "DITTO") ![](https://www.serebii.net/pokedex-swsh/icon/137.png "PORYGON") ![](https://www.serebii.net/pokedex-swsh/icon/218.png "SLUGMA") ![](https://www.serebii.net/pokedex-swsh/icon/238.png "SMOOCHUM") ![](https://www.serebii.net/pokedex-swsh/icon/239.png "ELEKID") ![](https://www.serebii.net/pokedex-swsh/icon/240.png "MAGBY") ![](https://www.serebii.net/pokedex-swsh/icon/311.png "PLUSLE") ![](https://www.serebii.net/pokedex-swsh/icon/312.png "MINUN") |

| Urban2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/082.png "MAGNETON") ![](https://www.serebii.net/pokedex-swsh/icon/089.png "MUK") ![](https://www.serebii.net/pokedex-swsh/icon/101.png "ELECTRODE") ![](https://www.serebii.net/pokedex-swsh/icon/110.png "WEEZING") ![](https://www.serebii.net/pokedex-swsh/icon/122.png "MR_MIME") ![](https://www.serebii.net/pokedex-swsh/icon/124.png "JYNX") ![](https://www.serebii.net/pokedex-swsh/icon/125.png "ELECTABUZZ") ![](https://www.serebii.net/pokedex-swsh/icon/126.png "MAGMAR") ![](https://www.serebii.net/pokedex-swsh/icon/219.png "MAGCARGO") ![](https://www.serebii.net/pokedex-swsh/icon/233.png "PORYGON2") |

| Overworld |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/023.png "EKANS") ![](https://www.serebii.net/pokedex-swsh/icon/025.png "PIKACHU") ![](https://www.serebii.net/pokedex-swsh/icon/027.png "SANDSHREW") ![](https://www.serebii.net/pokedex-swsh/icon/029.png "NIDORAN_F") ![](https://www.serebii.net/pokedex-swsh/icon/032.png "NIDORAN_M") ![](https://www.serebii.net/pokedex-swsh/icon/037.png "VULPIX") ![](https://www.serebii.net/pokedex-swsh/icon/056.png "MANKEY") ![](https://www.serebii.net/pokedex-swsh/icon/058.png "GROWLITHE") ![](https://www.serebii.net/pokedex-swsh/icon/063.png "ABRA") ![](https://www.serebii.net/pokedex-swsh/icon/077.png "PONYTA") ![](https://www.serebii.net/pokedex-swsh/icon/096.png "DROWZEE") ![](https://www.serebii.net/pokedex-swsh/icon/108.png "LICKITUNG") ![](https://www.serebii.net/pokedex-swsh/icon/111.png "RHYHORN") ![](https://www.serebii.net/pokedex-swsh/icon/113.png "CHANSEY") ![](https://www.serebii.net/pokedex-swsh/icon/115.png "KANGASKHAN") ![](https://www.serebii.net/pokedex-swsh/icon/128.png "TAUROS") ![](https://www.serebii.net/pokedex-swsh/icon/177.png "NATU") ![](https://www.serebii.net/pokedex-swsh/icon/179.png "MAREEP") ![](https://www.serebii.net/pokedex-swsh/icon/185.png "SUDOWOODO") ![](https://www.serebii.net/pokedex-swsh/icon/203.png "GIRAFARIG") ![](https://www.serebii.net/pokedex-swsh/icon/228.png "HOUNDOUR") ![](https://www.serebii.net/pokedex-swsh/icon/231.png "PHANPY") ![](https://www.serebii.net/pokedex-swsh/icon/241.png "MILTANK") ![](https://www.serebii.net/pokedex-swsh/icon/280.png "RALTS") ![](https://www.serebii.net/pokedex-swsh/icon/309.png "ELECTRIKE") ![](https://www.serebii.net/pokedex-swsh/icon/316.png "GULPIN") ![](https://www.serebii.net/pokedex-swsh/icon/322.png "NUMEL") ![](https://www.serebii.net/pokedex-swsh/icon/324.png "TORKOAL") ![](https://www.serebii.net/pokedex-swsh/icon/325.png "SPOINK") ![](https://www.serebii.net/pokedex-swsh/icon/335.png "ZANGOOSE") ![](https://www.serebii.net/pokedex-swsh/icon/336.png "SEVIPER") ![](https://www.serebii.net/pokedex-swsh/icon/338.png "SOLROCK") ![](https://www.serebii.net/pokedex-swsh/icon/352.png "KECLEON") ![](https://www.serebii.net/pokedex-swsh/icon/357.png "TROPIUS") ![](https://www.serebii.net/pokedex-swsh/icon/358.png "CHIMECHO") ![](https://www.serebii.net/pokedex-swsh/icon/359.png "ABSOL") |

| SafariZone |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/018.png "PIDGEOT") ![](https://www.serebii.net/pokedex-swsh/icon/024.png "ARBOK") ![](https://www.serebii.net/pokedex-swsh/icon/026.png "RAICHU") ![](https://www.serebii.net/pokedex-swsh/icon/028.png "SANDSLASH") ![](https://www.serebii.net/pokedex-swsh/icon/030.png "NIDORINA") ![](https://www.serebii.net/pokedex-swsh/icon/031.png "NIDOQUEEN") ![](https://www.serebii.net/pokedex-swsh/icon/033.png "NIDORINO") ![](https://www.serebii.net/pokedex-swsh/icon/034.png "NIDOKING") ![](https://www.serebii.net/pokedex-swsh/icon/038.png "NINETALES") ![](https://www.serebii.net/pokedex-swsh/icon/045.png "VILEPLUME") ![](https://www.serebii.net/pokedex-swsh/icon/057.png "PRIMEAPE") ![](https://www.serebii.net/pokedex-swsh/icon/059.png "ARCANINE") ![](https://www.serebii.net/pokedex-swsh/icon/062.png "POLIWRATH") ![](https://www.serebii.net/pokedex-swsh/icon/071.png "VICTREEBEL") ![](https://www.serebii.net/pokedex-swsh/icon/078.png "RAPIDASH") ![](https://www.serebii.net/pokedex-swsh/icon/097.png "HYPNO") ![](https://www.serebii.net/pokedex-swsh/icon/103.png "EXEGGUTOR") ![](https://www.serebii.net/pokedex-swsh/icon/112.png "RHYDON") ![](https://www.serebii.net/pokedex-swsh/icon/131.png "LAPRAS") ![](https://www.serebii.net/pokedex-swsh/icon/142.png "AERODACTYL") ![](https://www.serebii.net/pokedex-swsh/icon/143.png "SNORLAX") ![](https://www.serebii.net/pokedex-swsh/icon/169.png "CROBAT") ![](https://www.serebii.net/pokedex-swsh/icon/178.png "XATU") ![](https://www.serebii.net/pokedex-swsh/icon/180.png "FLAAFFY") ![](https://www.serebii.net/pokedex-swsh/icon/181.png "AMPHAROS") ![](https://www.serebii.net/pokedex-swsh/icon/182.png "BELLOSSOM") ![](https://www.serebii.net/pokedex-swsh/icon/189.png "JUMPLUFF") ![](https://www.serebii.net/pokedex-swsh/icon/199.png "SLOWKING") ![](https://www.serebii.net/pokedex-swsh/icon/217.png "URSARING") ![](https://www.serebii.net/pokedex-swsh/icon/229.png "HOUNDOOM") ![](https://www.serebii.net/pokedex-swsh/icon/232.png "DONPHAN") ![](https://www.serebii.net/pokedex-swsh/icon/272.png "LUDICOLO") ![](https://www.serebii.net/pokedex-swsh/icon/275.png "SHIFTRY") ![](https://www.serebii.net/pokedex-swsh/icon/286.png "BRELOOM") ![](https://www.serebii.net/pokedex-swsh/icon/310.png "MANECTRIC") ![](https://www.serebii.net/pokedex-swsh/icon/317.png "SWALOT") ![](https://www.serebii.net/pokedex-swsh/icon/323.png "CAMERUPT") ![](https://www.serebii.net/pokedex-swsh/icon/326.png "GRUMPIG") ![](https://www.serebii.net/pokedex-swsh/icon/365.png "WALREIN") |

| Fish1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/072.png "TENTACOOL") ![](https://www.serebii.net/pokedex-swsh/icon/090.png "SHELLDER") ![](https://www.serebii.net/pokedex-swsh/icon/098.png "KRABBY") ![](https://www.serebii.net/pokedex-swsh/icon/116.png "HORSEA") ![](https://www.serebii.net/pokedex-swsh/icon/118.png "GOLDEEN") ![](https://www.serebii.net/pokedex-swsh/icon/129.png "MAGIKARP") ![](https://www.serebii.net/pokedex-swsh/icon/170.png "CHINCHOU") ![](https://www.serebii.net/pokedex-swsh/icon/211.png "QWILFISH") ![](https://www.serebii.net/pokedex-swsh/icon/222.png "CORSOLA") ![](https://www.serebii.net/pokedex-swsh/icon/223.png "REMORAID") ![](https://www.serebii.net/pokedex-swsh/icon/226.png "MANTINE") ![](https://www.serebii.net/pokedex-swsh/icon/318.png "CARVANHA") ![](https://www.serebii.net/pokedex-swsh/icon/320.png "WAILMER") ![](https://www.serebii.net/pokedex-swsh/icon/339.png "BARBOACH") ![](https://www.serebii.net/pokedex-swsh/icon/341.png "CORPHISH") ![](https://www.serebii.net/pokedex-swsh/icon/349.png "FEEBAS") ![](https://www.serebii.net/pokedex-swsh/icon/366.png "CLAMPERL") ![](https://www.serebii.net/pokedex-swsh/icon/369.png "RELICANTH") ![](https://www.serebii.net/pokedex-swsh/icon/370.png "LUVDISC") |

| Fish2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/073.png "TENTACRUEL") ![](https://www.serebii.net/pokedex-swsh/icon/099.png "KINGLER") ![](https://www.serebii.net/pokedex-swsh/icon/117.png "SEADRA") ![](https://www.serebii.net/pokedex-swsh/icon/119.png "SEAKING") ![](https://www.serebii.net/pokedex-swsh/icon/130.png "GYARADOS") ![](https://www.serebii.net/pokedex-swsh/icon/171.png "LANTURN") ![](https://www.serebii.net/pokedex-swsh/icon/224.png "OCTILLERY") ![](https://www.serebii.net/pokedex-swsh/icon/319.png "SHARPEDO") ![](https://www.serebii.net/pokedex-swsh/icon/321.png "WAILORD") ![](https://www.serebii.net/pokedex-swsh/icon/340.png "WHISCASH") ![](https://www.serebii.net/pokedex-swsh/icon/342.png "CRAWDAUNT") ![](https://www.serebii.net/pokedex-swsh/icon/367.png "HUNTAIL") ![](https://www.serebii.net/pokedex-swsh/icon/368.png "GOREBYSS") |

| LeggedWater1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/054.png "PSYDUCK") ![](https://www.serebii.net/pokedex-swsh/icon/060.png "POLIWAG") ![](https://www.serebii.net/pokedex-swsh/icon/079.png "SLOWPOKE") ![](https://www.serebii.net/pokedex-swsh/icon/086.png "SEEL") ![](https://www.serebii.net/pokedex-swsh/icon/120.png "STARYU") ![](https://www.serebii.net/pokedex-swsh/icon/138.png "OMANYTE") ![](https://www.serebii.net/pokedex-swsh/icon/183.png "MARILL") ![](https://www.serebii.net/pokedex-swsh/icon/194.png "WOOPER") ![](https://www.serebii.net/pokedex-swsh/icon/278.png "WINGULL") ![](https://www.serebii.net/pokedex-swsh/icon/283.png "SURSKIT") ![](https://www.serebii.net/pokedex-swsh/icon/363.png "SPHEAL") |

| LeggedWater2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/055.png "GOLDUCK") ![](https://www.serebii.net/pokedex-swsh/icon/061.png "POLIWHIRL") ![](https://www.serebii.net/pokedex-swsh/icon/080.png "SLOWBRO") ![](https://www.serebii.net/pokedex-swsh/icon/087.png "DEWGONG") ![](https://www.serebii.net/pokedex-swsh/icon/091.png "CLOYSTER") ![](https://www.serebii.net/pokedex-swsh/icon/121.png "STARMIE") ![](https://www.serebii.net/pokedex-swsh/icon/139.png "OMASTAR") ![](https://www.serebii.net/pokedex-swsh/icon/141.png "KABUTOPS") ![](https://www.serebii.net/pokedex-swsh/icon/184.png "AZUMARILL") ![](https://www.serebii.net/pokedex-swsh/icon/186.png "POLITOED") ![](https://www.serebii.net/pokedex-swsh/icon/195.png "QUAGSIRE") ![](https://www.serebii.net/pokedex-swsh/icon/279.png "PELIPPER") ![](https://www.serebii.net/pokedex-swsh/icon/284.png "MASQUERAIN") ![](https://www.serebii.net/pokedex-swsh/icon/364.png "SEALEO") |

| Rare2Percent |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/133.png "EEVEE") ![](https://www.serebii.net/pokedex-swsh/icon/147.png "DRATINI") ![](https://www.serebii.net/pokedex-swsh/icon/176.png "TOGETIC") ![](https://www.serebii.net/pokedex-swsh/icon/246.png "LARVITAR") ![](https://www.serebii.net/pokedex-swsh/icon/287.png "SLAKOTH") ![](https://www.serebii.net/pokedex-swsh/icon/328.png "TRAPINCH") ![](https://www.serebii.net/pokedex-swsh/icon/333.png "SWABLU") ![](https://www.serebii.net/pokedex-swsh/icon/351.png "CASTFORM") ![](https://www.serebii.net/pokedex-swsh/icon/371.png "BAGON") ![](https://www.serebii.net/pokedex-swsh/icon/374.png "BELDUM") ![](https://www.serebii.net/pokedex-swsh/icon/001.png "BULBASAUR") ![](https://www.serebii.net/pokedex-swsh/icon/152.png "CHIKORITA") ![](https://www.serebii.net/pokedex-swsh/icon/252.png "TREECKO") ![](https://www.serebii.net/pokedex-swsh/icon/004.png "CHARMANDER") ![](https://www.serebii.net/pokedex-swsh/icon/155.png "CYNDAQUIL") ![](https://www.serebii.net/pokedex-swsh/icon/255.png "TORCHIC") ![](https://www.serebii.net/pokedex-swsh/icon/007.png "SQUIRTLE") ![](https://www.serebii.net/pokedex-swsh/icon/158.png "TOTODILE") ![](https://www.serebii.net/pokedex-swsh/icon/258.png "MUDKIP") |

| GrassStarter1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/001.png "BULBASAUR") ![](https://www.serebii.net/pokedex-swsh/icon/152.png "CHIKORITA") ![](https://www.serebii.net/pokedex-swsh/icon/252.png "TREECKO") |

| GrassStarter2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/002.png "IVYSAUR") ![](https://www.serebii.net/pokedex-swsh/icon/153.png "BAYLEEF") ![](https://www.serebii.net/pokedex-swsh/icon/253.png "GROVYLE") |

| GrassStarter3 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/003.png "VENUSAUR") ![](https://www.serebii.net/pokedex-swsh/icon/154.png "MEGANIUM") ![](https://www.serebii.net/pokedex-swsh/icon/254.png "SCEPTILE") |

| FireStarter1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/004.png "CHARMANDER") ![](https://www.serebii.net/pokedex-swsh/icon/155.png "CYNDAQUIL") ![](https://www.serebii.net/pokedex-swsh/icon/255.png "TORCHIC") |

| FireStarter2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/005.png "CHARMELEON") ![](https://www.serebii.net/pokedex-swsh/icon/156.png "QUILAVA") ![](https://www.serebii.net/pokedex-swsh/icon/256.png "COMBUSKEN") |

| FireStarter3 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/006.png "CHARIZARD") ![](https://www.serebii.net/pokedex-swsh/icon/157.png "TYPHLOSION") ![](https://www.serebii.net/pokedex-swsh/icon/257.png "BLAZIKEN") |

| WaterStarter1 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/007.png "SQUIRTLE") ![](https://www.serebii.net/pokedex-swsh/icon/158.png "TOTODILE") ![](https://www.serebii.net/pokedex-swsh/icon/258.png "MUDKIP") |

| WaterStarter2 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/008.png "WARTORTLE") ![](https://www.serebii.net/pokedex-swsh/icon/159.png "CROCONAW") ![](https://www.serebii.net/pokedex-swsh/icon/259.png "MARSHTOMP") |

| WaterStarter3 |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/009.png "BLASTOISE") ![](https://www.serebii.net/pokedex-swsh/icon/160.png "FERALIGATR") ![](https://www.serebii.net/pokedex-swsh/icon/260.png "SWAMPERT") |

| CeruleanCave |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/064.png "KADABRA") ![](https://www.serebii.net/pokedex-swsh/icon/076.png "GOLEM") ![](https://www.serebii.net/pokedex-swsh/icon/148.png "DRAGONAIR") ![](https://www.serebii.net/pokedex-swsh/icon/208.png "STEELIX") ![](https://www.serebii.net/pokedex-swsh/icon/221.png "PILOSWINE") ![](https://www.serebii.net/pokedex-swsh/icon/247.png "PUPITAR") ![](https://www.serebii.net/pokedex-swsh/icon/281.png "KIRLIA") ![](https://www.serebii.net/pokedex-swsh/icon/288.png "VIGOROTH") ![](https://www.serebii.net/pokedex-swsh/icon/295.png "EXPLOUD") ![](https://www.serebii.net/pokedex-swsh/icon/306.png "AGGRON") ![](https://www.serebii.net/pokedex-swsh/icon/308.png "MEDICHAM") ![](https://www.serebii.net/pokedex-swsh/icon/329.png "VIBRAVA") ![](https://www.serebii.net/pokedex-swsh/icon/346.png "CRADILY") ![](https://www.serebii.net/pokedex-swsh/icon/348.png "ARMALDO") ![](https://www.serebii.net/pokedex-swsh/icon/372.png "SHELGON") ![](https://www.serebii.net/pokedex-swsh/icon/375.png "METANG") |

| Powerful |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/065.png "ALAKAZAM") ![](https://www.serebii.net/pokedex-swsh/icon/068.png "MACHAMP") ![](https://www.serebii.net/pokedex-swsh/icon/094.png "GENGAR") ![](https://www.serebii.net/pokedex-swsh/icon/149.png "DRAGONITE") ![](https://www.serebii.net/pokedex-swsh/icon/212.png "SCIZOR") ![](https://www.serebii.net/pokedex-swsh/icon/230.png "KINGDRA") ![](https://www.serebii.net/pokedex-swsh/icon/242.png "BLISSEY") ![](https://www.serebii.net/pokedex-swsh/icon/248.png "TYRANITAR") ![](https://www.serebii.net/pokedex-swsh/icon/282.png "GARDEVOIR") ![](https://www.serebii.net/pokedex-swsh/icon/289.png "SLAKING") ![](https://www.serebii.net/pokedex-swsh/icon/330.png "FLYGON") ![](https://www.serebii.net/pokedex-swsh/icon/334.png "ALTARIA") ![](https://www.serebii.net/pokedex-swsh/icon/350.png "MILOTIC") ![](https://www.serebii.net/pokedex-swsh/icon/362.png "GLALIE") ![](https://www.serebii.net/pokedex-swsh/icon/373.png "SALAMENCE") ![](https://www.serebii.net/pokedex-swsh/icon/376.png "METAGROSS") |

| Eevee |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/134.png "VAPOREON") ![](https://www.serebii.net/pokedex-swsh/icon/135.png "JOLTEON") ![](https://www.serebii.net/pokedex-swsh/icon/136.png "FLAREON") ![](https://www.serebii.net/pokedex-swsh/icon/196.png "ESPEON") ![](https://www.serebii.net/pokedex-swsh/icon/197.png "UMBREON") |

| Legendary |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/144.png "ARTICUNO") ![](https://www.serebii.net/pokedex-swsh/icon/145.png "ZAPDOS") ![](https://www.serebii.net/pokedex-swsh/icon/146.png "MOLTRES") ![](https://www.serebii.net/pokedex-swsh/icon/243.png "RAIKOU") ![](https://www.serebii.net/pokedex-swsh/icon/244.png "ENTEI") ![](https://www.serebii.net/pokedex-swsh/icon/245.png "SUICUNE") ![](https://www.serebii.net/pokedex-swsh/icon/251.png "CELEBI") ![](https://www.serebii.net/pokedex-swsh/icon/377.png "REGIROCK") ![](https://www.serebii.net/pokedex-swsh/icon/378.png "REGICE") ![](https://www.serebii.net/pokedex-swsh/icon/379.png "REGISTEEL") ![](https://www.serebii.net/pokedex-swsh/icon/380.png "LATIAS") ![](https://www.serebii.net/pokedex-swsh/icon/381.png "LATIOS") ![](https://www.serebii.net/pokedex-swsh/icon/385.png "JIRACHI") |

| Uber |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/150.png "MEWTWO") ![](https://www.serebii.net/pokedex-swsh/icon/151.png "MEW") ![](https://www.serebii.net/pokedex-swsh/icon/249.png "LUGIA") ![](https://www.serebii.net/pokedex-swsh/icon/250.png "HO_OH") ![](https://www.serebii.net/pokedex-swsh/icon/292.png "SHEDINJA") ![](https://www.serebii.net/pokedex-swsh/icon/382.png "KYOGRE") ![](https://www.serebii.net/pokedex-swsh/icon/383.png "GROUDON") ![](https://www.serebii.net/pokedex-swsh/icon/384.png "RAYQUAZA") ![](https://www.serebii.net/pokedex-swsh/icon/386.png "DEOXYS") |

| Unused |
| --- |
|![](https://www.serebii.net/pokedex-swsh/icon/172.png "PICHU") ![](https://www.serebii.net/pokedex-swsh/icon/173.png "CLEFFA") ![](https://www.serebii.net/pokedex-swsh/icon/174.png "IGGLYBUFF") ![](https://www.serebii.net/pokedex-swsh/icon/175.png "TOGEPI") ![](https://www.serebii.net/pokedex-swsh/icon/201.png "UNOWN") ![](https://www.serebii.net/pokedex-swsh/icon/202.png "WOBBUFFET") ![](https://www.serebii.net/pokedex-swsh/icon/235.png "SMEARGLE") ![](https://www.serebii.net/pokedex-swsh/icon/298.png "AZURILL") ![](https://www.serebii.net/pokedex-swsh/icon/360.png "WYNAUT") |

