	.include "asm/macros/m4a.inc"
	.include "asm/macros/music_voice.inc"
	.section .rodata

voicegroup000:: @ 8489C8C
	.incbin "baserom.gba", 0x489C8C, 0xF24

voicegroup012:: @ 848ABB0
	.incbin "baserom.gba", 0x48ABB0, 0x4C8

voicegroup026:: @ 848B078
	.incbin "baserom.gba", 0x48B078, 0x3FC

voicegroup120:: @ 848B474
	.incbin "baserom.gba", 0x48B474, 0x444

voicegroup119:: @ 848B8B8
	.incbin "baserom.gba", 0x48B8B8, 0x444

voicegroup081:: @ 848BCFC
	.incbin "baserom.gba", 0x48BCFC, 0x18

voicegroup127:: @ 848BD14
	.incbin "baserom.gba", 0x48BD14, 0x600

voicegroup128:: @ 848C314
	.incbin "baserom.gba", 0x48C314, 0x600

	.align 2
gCryTable:: @ 848C914
	cry Cry_Bulbasaur
    cry Cry_Ivysaur
    cry Cry_Venusaur
    cry Cry_Charmander
    cry Cry_Charmeleon
    cry Cry_Charizard
    cry Cry_Squirtle
    cry Cry_Wartortle
    cry Cry_Blastoise
    cry Cry_Caterpie
    cry Cry_Metapod
    cry Cry_Butterfree
    cry Cry_Weedle
    cry Cry_Kakuna
    cry Cry_Beedrill
    cry Cry_Pidgey
    cry Cry_Pidgeotto
    cry Cry_Pidgeot
    cry Cry_Rattata
    cry Cry_Raticate
    cry Cry_Spearow
    cry Cry_Fearow
    cry Cry_Ekans
    cry Cry_Arbok
    cry Cry_Pikachu
    cry Cry_Raichu
    cry Cry_Sandshrew
    cry Cry_Sandslash
    cry Cry_NidoranF
    cry Cry_Nidorina
    cry Cry_Nidoqueen
    cry Cry_NidoranM
    cry Cry_Nidorino
    cry Cry_Nidoking
    cry Cry_Clefairy
    cry Cry_Clefable
    cry Cry_Vulpix
    cry Cry_Ninetales
    cry Cry_Jigglypuff
    cry Cry_Wigglytuff
    cry Cry_Zubat
    cry Cry_Golbat
    cry Cry_Oddish
    cry Cry_Gloom
    cry Cry_Vileplume
    cry Cry_Paras
    cry Cry_Parasect
    cry Cry_Venonat
    cry Cry_Venomoth
    cry Cry_Diglett
    cry Cry_Dugtrio
    cry Cry_Meowth
    cry Cry_Persian
    cry Cry_Psyduck
    cry Cry_Golduck
    cry Cry_Mankey
    cry Cry_Primeape
    cry Cry_Growlithe
    cry Cry_Arcanine
    cry Cry_Poliwag
    cry Cry_Poliwhirl
    cry Cry_Poliwrath
    cry Cry_Abra
    cry Cry_Kadabra
    cry Cry_Alakazam
    cry Cry_Machop
    cry Cry_Machoke
    cry Cry_Machamp
    cry Cry_Bellsprout
    cry Cry_Weepinbell
    cry Cry_Victreebel
    cry Cry_Tentacool
    cry Cry_Tentacruel
    cry Cry_Geodude
    cry Cry_Graveler
    cry Cry_Golem
    cry Cry_Ponyta
    cry Cry_Rapidash
    cry Cry_Slowpoke
    cry Cry_Slowbro
    cry Cry_Magnemite
    cry Cry_Magneton
    cry Cry_Farfetchd
    cry Cry_Doduo
    cry Cry_Dodrio
    cry Cry_Seel
    cry Cry_Dewgong
    cry Cry_Grimer
    cry Cry_Muk
    cry Cry_Shellder
    cry Cry_Cloyster
    cry Cry_Gastly
    cry Cry_Haunter
    cry Cry_Gengar
    cry Cry_Onix
    cry Cry_Drowzee
    cry Cry_Hypno
    cry Cry_Krabby
    cry Cry_Kingler
    cry Cry_Voltorb
    cry Cry_Electrode
    cry Cry_Exeggcute
    cry Cry_Exeggutor
    cry Cry_Cubone
    cry Cry_Marowak
    cry Cry_Hitmonlee
    cry Cry_Hitmonchan
    cry Cry_Lickitung
    cry Cry_Koffing
    cry Cry_Weezing
    cry Cry_Rhyhorn
    cry Cry_Rhydon
    cry Cry_Chansey
    cry Cry_Tangela
    cry Cry_Kangaskhan
    cry Cry_Horsea
    cry Cry_Seadra
    cry Cry_Goldeen
    cry Cry_Seaking
    cry Cry_Staryu
    cry Cry_Starmie
    cry Cry_MrMime
    cry Cry_Scyther
    cry Cry_Jynx
    cry Cry_Electabuzz
    cry Cry_Magmar
    cry Cry_Pinsir
    cry Cry_Tauros
    cry Cry_Magikarp
    cry Cry_Gyarados
    cry Cry_Lapras
    cry Cry_Ditto
    cry Cry_Eevee
    cry Cry_Vaporeon
    cry Cry_Jolteon
    cry Cry_Flareon
    cry Cry_Porygon
    cry Cry_Omanyte
    cry Cry_Omastar
    cry Cry_Kabuto
    cry Cry_Kabutops
    cry Cry_Aerodactyl
    cry Cry_Snorlax
    cry Cry_Articuno
    cry Cry_Zapdos
    cry Cry_Moltres
    cry Cry_Dratini
    cry Cry_Dragonair
    cry Cry_Dragonite
    cry Cry_Mewtwo
    cry Cry_Mew
    cry Cry_Chikorita
    cry Cry_Bayleef
    cry Cry_Meganium
    cry Cry_Cyndaquil
    cry Cry_Quilava
    cry Cry_Typhlosion
    cry Cry_Totodile
    cry Cry_Croconaw
    cry Cry_Feraligatr
    cry Cry_Sentret
    cry Cry_Furret
    cry Cry_Hoothoot
    cry Cry_Noctowl
    cry Cry_Ledyba
    cry Cry_Ledian
    cry Cry_Spinarak
    cry Cry_Ariados
    cry Cry_Crobat
    cry Cry_Chinchou
    cry Cry_Lanturn
    cry Cry_Pichu
    cry Cry_Cleffa
    cry Cry_Igglybuff
    cry Cry_Togepi
    cry Cry_Togetic
    cry Cry_Natu
    cry Cry_Xatu
    cry Cry_Mareep
    cry Cry_Flaaffy
    cry Cry_Ampharos
    cry Cry_Bellossom
    cry Cry_Marill
    cry Cry_Azumarill
    cry Cry_Sudowoodo
    cry Cry_Politoed
    cry Cry_Hoppip
    cry Cry_Skiploom
    cry Cry_Jumpluff
    cry Cry_Aipom
    cry Cry_Sunkern
    cry Cry_Sunflora
    cry Cry_Yanma
    cry Cry_Wooper
    cry Cry_Quagsire
    cry Cry_Espeon
    cry Cry_Umbreon
    cry Cry_Murkrow
    cry Cry_Slowking
    cry Cry_Misdreavus
    cry Cry_Unown
    cry Cry_Wobbuffet
    cry Cry_Girafarig
    cry Cry_Pineco
    cry Cry_Forretress
    cry Cry_Dunsparce
    cry Cry_Gligar
    cry Cry_Steelix
    cry Cry_Snubbull
    cry Cry_Granbull
    cry Cry_Qwilfish
    cry Cry_Scizor
    cry Cry_Shuckle
    cry Cry_Heracross
    cry Cry_Sneasel
    cry Cry_Teddiursa
    cry Cry_Ursaring
    cry Cry_Slugma
    cry Cry_Magcargo
    cry Cry_Swinub
    cry Cry_Piloswine
    cry Cry_Corsola
    cry Cry_Remoraid
    cry Cry_Octillery
    cry Cry_Delibird
    cry Cry_Mantine
    cry Cry_Skarmory
    cry Cry_Houndour
    cry Cry_Houndoom
    cry Cry_Kingdra
    cry Cry_Phanpy
    cry Cry_Donphan
    cry Cry_Porygon2
    cry Cry_Stantler
    cry Cry_Smeargle
    cry Cry_Tyrogue
    cry Cry_Hitmontop
    cry Cry_Smoochum
    cry Cry_Elekid
    cry Cry_Magby
    cry Cry_Miltank
    cry Cry_Blissey
    cry Cry_Raikou
    cry Cry_Entei
    cry Cry_Suicune
    cry Cry_Larvitar
    cry Cry_Pupitar
    cry Cry_Tyranitar
    cry Cry_Lugia
    cry Cry_HoOh
    cry Cry_Celebi
    cry Cry_Kecleon
    cry Cry_Roselia
    cry Cry_Torkoal
    cry Cry_Electrike
    cry Cry_Manectric
    cry Cry_Duskull
    cry Cry_Latias
    cry Cry_Wynaut
    cry Cry_Seviper
    cry Cry_Sharpedo
    cry Cry_Zangoose
    cry Cry_Azurill
    cry Cry_Swablu
    cry Cry_Altaria
    cry Cry_Unused265
    cry Cry_Taillow
    cry Cry_Swellow
    cry Cry_Unused268
    cry Cry_Spinda
    cry Cry_Torchic
    cry Cry_Combusken
    cry Cry_Blaziken
    cry Cry_Treecko
    cry Cry_Grovyle
    cry Cry_Sceptile
    cry Cry_Mudkip
    cry Cry_Marshtomp
    cry Cry_Swampert
    cry Cry_Pelipper
    cry Cry_Wingull
    cry Cry_Banette
    cry Cry_Shuppet
    cry Cry_Lotad
    cry Cry_Lombre
    cry Cry_Ludicolo
    cry Cry_Seedot
    cry Cry_Nuzleaf
    cry Cry_Shiftry
    cry Cry_Carvanha
    cry Cry_Wurmple
    cry Cry_Silcoon
    cry Cry_Beautifly
    cry Cry_Cascoon
    cry Cry_Dustox
    cry Cry_Ralts
    cry Cry_Kirlia
    cry Cry_Gardevoir
    cry Cry_Slakoth
    cry Cry_Vigoroth
    cry Cry_Slaking
    cry Cry_Nincada
    cry Cry_Ninjask
    cry Cry_Shedinja
    cry Cry_Makuhita
    cry Cry_Hariyama
    cry Cry_Nosepass
    cry Cry_Glalie
    cry Cry_Plusle
    cry Cry_Minun
    cry Cry_Surskit
    cry Cry_Masquerain
    cry Cry_Skitty
    cry Cry_Delcatty
    cry Cry_Gulpin
    cry Cry_Swalot
    cry Cry_Numel
    cry Cry_Camerupt
    cry Cry_Barboach
    cry Cry_Whiscash
    cry Cry_Corphish
    cry Cry_Crawdaunt
    cry Cry_Spoink
    cry Cry_Grumpig
    cry Cry_Trapinch
    cry Cry_Vibrava
    cry Cry_Flygon
    cry Cry_Cacnea
    cry Cry_Cacturne
    cry Cry_Baltoy
    cry Cry_Claydol
    cry Cry_Lunatone
    cry Cry_Solrock
    cry Cry_Feebas
    cry Cry_Milotic
    cry Cry_Absol
    cry Cry_Meditite
    cry Cry_Medicham
    cry Cry_Spheal
    cry Cry_Sealeo
    cry Cry_Walrein
    cry Cry_Clamperl
    cry Cry_Huntail
    cry Cry_Gorebyss
    cry Cry_Lileep
    cry Cry_Cradily
    cry Cry_Anorith
    cry Cry_Armaldo
    cry Cry_Beldum
    cry Cry_Metang
    cry Cry_Metagross
    cry Cry_Bagon
    cry Cry_Shelgon
    cry Cry_Regirock
    cry Cry_Regice
    cry Cry_Registeel
    cry Cry_Castform
    cry Cry_Volbeat
    cry Cry_Illumise
    cry Cry_Poochyena
    cry Cry_Mightyena
    cry Cry_Dusclops
    cry Cry_Sableye
    cry Cry_Mawile
    cry Cry_Aron
    cry Cry_Lairon
    cry Cry_Aggron
    cry Cry_Relicanth
    cry Cry_Luvdisc
    cry Cry_Groudon
    cry Cry_Kyogre
    cry Cry_Rayquaza
    cry Cry_Salamence
    cry Cry_Breloom
    cry Cry_Shroomish
    cry Cry_Linoone
    cry Cry_Tropius
    cry Cry_Wailmer
    cry Cry_Zigzagoon
    cry Cry_Exploud
    cry Cry_Loudred
    cry Cry_Wailord
    cry Cry_Whismur
    cry Cry_Snorunt
    cry Cry_Latios
    cry Cry_Jirachi
    cry Cry_Deoxys
    cry Cry_Chimecho

	.align 2
gCryTable2:: @ 848DB44
	cry2 Cry_Bulbasaur
    cry2 Cry_Ivysaur
    cry2 Cry_Venusaur
    cry2 Cry_Charmander
    cry2 Cry_Charmeleon
    cry2 Cry_Charizard
    cry2 Cry_Squirtle
    cry2 Cry_Wartortle
    cry2 Cry_Blastoise
    cry2 Cry_Caterpie
    cry2 Cry_Metapod
    cry2 Cry_Butterfree
    cry2 Cry_Weedle
    cry2 Cry_Kakuna
    cry2 Cry_Beedrill
    cry2 Cry_Pidgey
    cry2 Cry_Pidgeotto
    cry2 Cry_Pidgeot
    cry2 Cry_Rattata
    cry2 Cry_Raticate
    cry2 Cry_Spearow
    cry2 Cry_Fearow
    cry2 Cry_Ekans
    cry2 Cry_Arbok
    cry2 Cry_Pikachu
    cry2 Cry_Raichu
    cry2 Cry_Sandshrew
    cry2 Cry_Sandslash
    cry2 Cry_NidoranF
    cry2 Cry_Nidorina
    cry2 Cry_Nidoqueen
    cry2 Cry_NidoranM
    cry2 Cry_Nidorino
    cry2 Cry_Nidoking
    cry2 Cry_Clefairy
    cry2 Cry_Clefable
    cry2 Cry_Vulpix
    cry2 Cry_Ninetales
    cry2 Cry_Jigglypuff
    cry2 Cry_Wigglytuff
    cry2 Cry_Zubat
    cry2 Cry_Golbat
    cry2 Cry_Oddish
    cry2 Cry_Gloom
    cry2 Cry_Vileplume
    cry2 Cry_Paras
    cry2 Cry_Parasect
    cry2 Cry_Venonat
    cry2 Cry_Venomoth
    cry2 Cry_Diglett
    cry2 Cry_Dugtrio
    cry2 Cry_Meowth
    cry2 Cry_Persian
    cry2 Cry_Psyduck
    cry2 Cry_Golduck
    cry2 Cry_Mankey
    cry2 Cry_Primeape
    cry2 Cry_Growlithe
    cry2 Cry_Arcanine
    cry2 Cry_Poliwag
    cry2 Cry_Poliwhirl
    cry2 Cry_Poliwrath
    cry2 Cry_Abra
    cry2 Cry_Kadabra
    cry2 Cry_Alakazam
    cry2 Cry_Machop
    cry2 Cry_Machoke
    cry2 Cry_Machamp
    cry2 Cry_Bellsprout
    cry2 Cry_Weepinbell
    cry2 Cry_Victreebel
    cry2 Cry_Tentacool
    cry2 Cry_Tentacruel
    cry2 Cry_Geodude
    cry2 Cry_Graveler
    cry2 Cry_Golem
    cry2 Cry_Ponyta
    cry2 Cry_Rapidash
    cry2 Cry_Slowpoke
    cry2 Cry_Slowbro
    cry2 Cry_Magnemite
    cry2 Cry_Magneton
    cry2 Cry_Farfetchd
    cry2 Cry_Doduo
    cry2 Cry_Dodrio
    cry2 Cry_Seel
    cry2 Cry_Dewgong
    cry2 Cry_Grimer
    cry2 Cry_Muk
    cry2 Cry_Shellder
    cry2 Cry_Cloyster
    cry2 Cry_Gastly
    cry2 Cry_Haunter
    cry2 Cry_Gengar
    cry2 Cry_Onix
    cry2 Cry_Drowzee
    cry2 Cry_Hypno
    cry2 Cry_Krabby
    cry2 Cry_Kingler
    cry2 Cry_Voltorb
    cry2 Cry_Electrode
    cry2 Cry_Exeggcute
    cry2 Cry_Exeggutor
    cry2 Cry_Cubone
    cry2 Cry_Marowak
    cry2 Cry_Hitmonlee
    cry2 Cry_Hitmonchan
    cry2 Cry_Lickitung
    cry2 Cry_Koffing
    cry2 Cry_Weezing
    cry2 Cry_Rhyhorn
    cry2 Cry_Rhydon
    cry2 Cry_Chansey
    cry2 Cry_Tangela
    cry2 Cry_Kangaskhan
    cry2 Cry_Horsea
    cry2 Cry_Seadra
    cry2 Cry_Goldeen
    cry2 Cry_Seaking
    cry2 Cry_Staryu
    cry2 Cry_Starmie
    cry2 Cry_MrMime
    cry2 Cry_Scyther
    cry2 Cry_Jynx
    cry2 Cry_Electabuzz
    cry2 Cry_Magmar
    cry2 Cry_Pinsir
    cry2 Cry_Tauros
    cry2 Cry_Magikarp
    cry2 Cry_Gyarados
    cry2 Cry_Lapras
    cry2 Cry_Ditto
    cry2 Cry_Eevee
    cry2 Cry_Vaporeon
    cry2 Cry_Jolteon
    cry2 Cry_Flareon
    cry2 Cry_Porygon
    cry2 Cry_Omanyte
    cry2 Cry_Omastar
    cry2 Cry_Kabuto
    cry2 Cry_Kabutops
    cry2 Cry_Aerodactyl
    cry2 Cry_Snorlax
    cry2 Cry_Articuno
    cry2 Cry_Zapdos
    cry2 Cry_Moltres
    cry2 Cry_Dratini
    cry2 Cry_Dragonair
    cry2 Cry_Dragonite
    cry2 Cry_Mewtwo
    cry2 Cry_Mew
    cry2 Cry_Chikorita
    cry2 Cry_Bayleef
    cry2 Cry_Meganium
    cry2 Cry_Cyndaquil
    cry2 Cry_Quilava
    cry2 Cry_Typhlosion
    cry2 Cry_Totodile
    cry2 Cry_Croconaw
    cry2 Cry_Feraligatr
    cry2 Cry_Sentret
    cry2 Cry_Furret
    cry2 Cry_Hoothoot
    cry2 Cry_Noctowl
    cry2 Cry_Ledyba
    cry2 Cry_Ledian
    cry2 Cry_Spinarak
    cry2 Cry_Ariados
    cry2 Cry_Crobat
    cry2 Cry_Chinchou
    cry2 Cry_Lanturn
    cry2 Cry_Pichu
    cry2 Cry_Cleffa
    cry2 Cry_Igglybuff
    cry2 Cry_Togepi
    cry2 Cry_Togetic
    cry2 Cry_Natu
    cry2 Cry_Xatu
    cry2 Cry_Mareep
    cry2 Cry_Flaaffy
    cry2 Cry_Ampharos
    cry2 Cry_Bellossom
    cry2 Cry_Marill
    cry2 Cry_Azumarill
    cry2 Cry_Sudowoodo
    cry2 Cry_Politoed
    cry2 Cry_Hoppip
    cry2 Cry_Skiploom
    cry2 Cry_Jumpluff
    cry2 Cry_Aipom
    cry2 Cry_Sunkern
    cry2 Cry_Sunflora
    cry2 Cry_Yanma
    cry2 Cry_Wooper
    cry2 Cry_Quagsire
    cry2 Cry_Espeon
    cry2 Cry_Umbreon
    cry2 Cry_Murkrow
    cry2 Cry_Slowking
    cry2 Cry_Misdreavus
    cry2 Cry_Unown
    cry2 Cry_Wobbuffet
    cry2 Cry_Girafarig
    cry2 Cry_Pineco
    cry2 Cry_Forretress
    cry2 Cry_Dunsparce
    cry2 Cry_Gligar
    cry2 Cry_Steelix
    cry2 Cry_Snubbull
    cry2 Cry_Granbull
    cry2 Cry_Qwilfish
    cry2 Cry_Scizor
    cry2 Cry_Shuckle
    cry2 Cry_Heracross
    cry2 Cry_Sneasel
    cry2 Cry_Teddiursa
    cry2 Cry_Ursaring
    cry2 Cry_Slugma
    cry2 Cry_Magcargo
    cry2 Cry_Swinub
    cry2 Cry_Piloswine
    cry2 Cry_Corsola
    cry2 Cry_Remoraid
    cry2 Cry_Octillery
    cry2 Cry_Delibird
    cry2 Cry_Mantine
    cry2 Cry_Skarmory
    cry2 Cry_Houndour
    cry2 Cry_Houndoom
    cry2 Cry_Kingdra
    cry2 Cry_Phanpy
    cry2 Cry_Donphan
    cry2 Cry_Porygon2
    cry2 Cry_Stantler
    cry2 Cry_Smeargle
    cry2 Cry_Tyrogue
    cry2 Cry_Hitmontop
    cry2 Cry_Smoochum
    cry2 Cry_Elekid
    cry2 Cry_Magby
    cry2 Cry_Miltank
    cry2 Cry_Blissey
    cry2 Cry_Raikou
    cry2 Cry_Entei
    cry2 Cry_Suicune
    cry2 Cry_Larvitar
    cry2 Cry_Pupitar
    cry2 Cry_Tyranitar
    cry2 Cry_Lugia
    cry2 Cry_HoOh
    cry2 Cry_Celebi
    cry2 Cry_Kecleon
    cry2 Cry_Roselia
    cry2 Cry_Torkoal
    cry2 Cry_Electrike
    cry2 Cry_Manectric
    cry2 Cry_Duskull
    cry2 Cry_Latias
    cry2 Cry_Wynaut
    cry2 Cry_Seviper
    cry2 Cry_Sharpedo
    cry2 Cry_Zangoose
    cry2 Cry_Azurill
    cry2 Cry_Swablu
    cry2 Cry_Altaria
    cry2 Cry_Unused265
    cry2 Cry_Taillow
    cry2 Cry_Swellow
    cry2 Cry_Unused268
    cry2 Cry_Spinda
    cry2 Cry_Torchic
    cry2 Cry_Combusken
    cry2 Cry_Blaziken
    cry2 Cry_Treecko
    cry2 Cry_Grovyle
    cry2 Cry_Sceptile
    cry2 Cry_Mudkip
    cry2 Cry_Marshtomp
    cry2 Cry_Swampert
    cry2 Cry_Pelipper
    cry2 Cry_Wingull
    cry2 Cry_Banette
    cry2 Cry_Shuppet
    cry2 Cry_Lotad
    cry2 Cry_Lombre
    cry2 Cry_Ludicolo
    cry2 Cry_Seedot
    cry2 Cry_Nuzleaf
    cry2 Cry_Shiftry
    cry2 Cry_Carvanha
    cry2 Cry_Wurmple
    cry2 Cry_Silcoon
    cry2 Cry_Beautifly
    cry2 Cry_Cascoon
    cry2 Cry_Dustox
    cry2 Cry_Ralts
    cry2 Cry_Kirlia
    cry2 Cry_Gardevoir
    cry2 Cry_Slakoth
    cry2 Cry_Vigoroth
    cry2 Cry_Slaking
    cry2 Cry_Nincada
    cry2 Cry_Ninjask
    cry2 Cry_Shedinja
    cry2 Cry_Makuhita
    cry2 Cry_Hariyama
    cry2 Cry_Nosepass
    cry2 Cry_Glalie
    cry2 Cry_Plusle
    cry2 Cry_Minun
    cry2 Cry_Surskit
    cry2 Cry_Masquerain
    cry2 Cry_Skitty
    cry2 Cry_Delcatty
    cry2 Cry_Gulpin
    cry2 Cry_Swalot
    cry2 Cry_Numel
    cry2 Cry_Camerupt
    cry2 Cry_Barboach
    cry2 Cry_Whiscash
    cry2 Cry_Corphish
    cry2 Cry_Crawdaunt
    cry2 Cry_Spoink
    cry2 Cry_Grumpig
    cry2 Cry_Trapinch
    cry2 Cry_Vibrava
    cry2 Cry_Flygon
    cry2 Cry_Cacnea
    cry2 Cry_Cacturne
    cry2 Cry_Baltoy
    cry2 Cry_Claydol
    cry2 Cry_Lunatone
    cry2 Cry_Solrock
    cry2 Cry_Feebas
    cry2 Cry_Milotic
    cry2 Cry_Absol
    cry2 Cry_Meditite
    cry2 Cry_Medicham
    cry2 Cry_Spheal
    cry2 Cry_Sealeo
    cry2 Cry_Walrein
    cry2 Cry_Clamperl
    cry2 Cry_Huntail
    cry2 Cry_Gorebyss
    cry2 Cry_Lileep
    cry2 Cry_Cradily
    cry2 Cry_Anorith
    cry2 Cry_Armaldo
    cry2 Cry_Beldum
    cry2 Cry_Metang
    cry2 Cry_Metagross
    cry2 Cry_Bagon
    cry2 Cry_Shelgon
    cry2 Cry_Regirock
    cry2 Cry_Regice
    cry2 Cry_Registeel
    cry2 Cry_Castform
    cry2 Cry_Volbeat
    cry2 Cry_Illumise
    cry2 Cry_Poochyena
    cry2 Cry_Mightyena
    cry2 Cry_Dusclops
    cry2 Cry_Sableye
    cry2 Cry_Mawile
    cry2 Cry_Aron
    cry2 Cry_Lairon
    cry2 Cry_Aggron
    cry2 Cry_Relicanth
    cry2 Cry_Luvdisc
    cry2 Cry_Groudon
    cry2 Cry_Kyogre
    cry2 Cry_Rayquaza
    cry2 Cry_Salamence
    cry2 Cry_Breloom
    cry2 Cry_Shroomish
    cry2 Cry_Linoone
    cry2 Cry_Tropius
    cry2 Cry_Wailmer
    cry2 Cry_Zigzagoon
    cry2 Cry_Exploud
    cry2 Cry_Loudred
    cry2 Cry_Wailord
    cry2 Cry_Whismur
    cry2 Cry_Snorunt
    cry2 Cry_Latios
    cry2 Cry_Jirachi
    cry2 Cry_Deoxys
    cry2 Cry_Chimecho

voicegroup129:: @ 848ED74
	.incbin "baserom.gba", 0x48ED74, 0x600

voicegroup130:: @ 848F374
	.incbin "baserom.gba", 0x48F374, 0x600

voicegroup131:: @ 848F974
	.incbin "baserom.gba", 0x48F974, 0x600

voicegroup132:: @ 848FF74
	.incbin "baserom.gba", 0x48FF74, 0x600

voicegroup133:: @ 8490574
	.incbin "baserom.gba", 0x490574, 0x600

voicegroup134:: @ 8490B74
	.incbin "baserom.gba", 0x490B74, 0x438

voicegroup135:: @ 8490FAC
	.incbin "baserom.gba", 0x490FAC, 0x3E4

voicegroup136:: @ 8491390
	.incbin "baserom.gba", 0x491390, 0x600

voicegroup137:: @ 8491990
	.incbin "baserom.gba", 0x491990, 0x600

voicegroup138:: @ 8491F90
	.incbin "baserom.gba", 0x491F90, 0x600

voicegroup139:: @ 8492590
	.incbin "baserom.gba", 0x492590, 0x600

voicegroup140:: @ 8492B90
	.incbin "baserom.gba", 0x492B90, 0x30

voicegroup141:: @ 8492BC0
	.incbin "baserom.gba", 0x492BC0, 0x600

voicegroup142:: @ 84931C0
	.incbin "baserom.gba", 0x4931C0, 0x3F0

voicegroup143:: @ 84935B0
	.incbin "baserom.gba", 0x4935B0, 0x600

voicegroup144:: @ 8493BB0
	.incbin "baserom.gba", 0x493BB0, 0x600

voicegroup145:: @ 84941B0
	.incbin "baserom.gba", 0x4941B0, 0x600

voicegroup146:: @ 84947B0
	.incbin "baserom.gba", 0x4947B0, 0x600

voicegroup147:: @ 8494DB0
	.incbin "baserom.gba", 0x494DB0, 0x3F0

voicegroup148:: @ 84951A0
	.incbin "baserom.gba", 0x4951A0, 0x600

voicegroup149:: @ 84957A0
	.incbin "baserom.gba", 0x4957A0, 0x45C

voicegroup150:: @ 8495BFC
	.incbin "baserom.gba", 0x495BFC, 0x600

voicegroup151:: @ 84961FC
	.incbin "baserom.gba", 0x4961FC, 0x420

voicegroup152:: @ 849661C
	.incbin "baserom.gba", 0x49661C, 0x600

voicegroup153:: @ 8496C1C
	.incbin "baserom.gba", 0x496C1C, 0x600

voicegroup154:: @ 849721C
	.incbin "baserom.gba", 0x49721C, 0x45C

voicegroup155:: @ 8497678
	.incbin "baserom.gba", 0x497678, 0x600

voicegroup156:: @ 8497C78
	.incbin "baserom.gba", 0x497C78, 0x600

voicegroup157:: @ 8498278
	.incbin "baserom.gba", 0x498278, 0x600

voicegroup158:: @ 8498878
	.incbin "baserom.gba", 0x498878, 0x600

voicegroup159:: @ 8498E78
	.incbin "baserom.gba", 0x498E78, 0x600

voicegroup160:: @ 8499478
	.incbin "baserom.gba", 0x499478, 0x420

voicegroup161:: @ 8499898
	.incbin "baserom.gba", 0x499898, 0x600

voicegroup162:: @ 8499E98
	.incbin "baserom.gba", 0x499E98, 0x45C

voicegroup163:: @ 849A2F4
	.incbin "baserom.gba", 0x49A2F4, 0x600

voicegroup164:: @ 849A8F4
	.incbin "baserom.gba", 0x49A8F4, 0x600

voicegroup165:: @ 849AEF4
	.incbin "baserom.gba", 0x49AEF4, 0x600

voicegroup166:: @ 849B4F4
	.incbin "baserom.gba", 0x49B4F4, 0x600

voicegroup167:: @ 849BAF4
	.incbin "baserom.gba", 0x49BAF4, 0x600

voicegroup168:: @ 849C0F4
	.incbin "baserom.gba", 0x49C0F4, 0x600

voicegroup169:: @ 849C6F4
	.incbin "baserom.gba", 0x49C6F4, 0x600

voicegroup170:: @ 849CCF4
	.incbin "baserom.gba", 0x49CCF4, 0x3F0

voicegroup171:: @ 849D0E4
	.incbin "baserom.gba", 0x49D0E4, 0x444

voicegroup172:: @ 849D528
	.incbin "baserom.gba", 0x49D528, 0x600

voicegroup173:: @ 849DB28
	.incbin "baserom.gba", 0x49DB28, 0x600

voicegroup174:: @ 849E128
	.incbin "baserom.gba", 0x49E128, 0x75C

voicegroup175:: @ 849E884
	.incbin "baserom.gba", 0x49E884, 0x8E8

voicegroup178:: @ 849F16C
	.incbin "baserom.gba", 0x49F16C, 0x420

voicegroup179:: @ 849F58C
	.incbin "baserom.gba", 0x49F58C, 0x420

voicegroup180:: @ 849F9AC
	.incbin "baserom.gba", 0x49F9AC, 0x600

voicegroup181:: @ 849FFAC
	.incbin "baserom.gba", 0x49FFAC, 0x234

voicegroup182:: @ 84A01E0
	.incbin "baserom.gba", 0x4A01E0, 0x420

voicegroup183:: @ 84A0600
	.incbin "baserom.gba", 0x4A0600, 0x600

voicegroup184:: @ 84A0C00
	.incbin "baserom.gba", 0x4A0C00, 0x408

voicegroup185:: @ 84A1008
	.incbin "baserom.gba", 0x4A1008, 0x600

voicegroup186:: @ 84A1608
	.incbin "baserom.gba", 0x4A1608, 0x600

voicegroup187:: @ 84A1C08
	.incbin "baserom.gba", 0x4A1C08, 0x600

voicegroup188:: @ 84A2208
	.incbin "baserom.gba", 0x4A2208, 0x600

voicegroup189:: @ 84A2808
	.incbin "baserom.gba", 0x4A2808, 0xA94

	.include "sound/music_player_table.inc"
	.include "sound/song_table.inc"

	.align 2
gDirectSoundWaveData_0:: @ 84A3DA8
	.incbin "baserom.gba", 0x4A3DA8, 0x6BE1C

	.align 2
Cry_Bulbasaur:: @ 850FBC4
	.incbin "sound/direct_sound_samples/cry_bulbasaur.bin"

	.align 2
Cry_Ivysaur:: @ 8510C50
	.incbin "sound/direct_sound_samples/cry_ivysaur.bin"

	.align 2
Cry_Venusaur:: @ 8511CE0
	.incbin "sound/direct_sound_samples/cry_venusaur.bin"

	.align 2
Cry_Charmander:: @ 8513038
	.incbin "sound/direct_sound_samples/cry_charmander.bin"

	.align 2
Cry_Charmeleon:: @ 8513EA8
	.incbin "sound/direct_sound_samples/cry_charmeleon.bin"

	.align 2
Cry_Charizard:: @ 8514D28
	.incbin "sound/direct_sound_samples/cry_charizard.bin"

	.align 2
Cry_Squirtle:: @ 8516070
	.incbin "sound/direct_sound_samples/cry_squirtle.bin"

	.align 2
Cry_Wartortle:: @ 8516EE4
	.incbin "sound/direct_sound_samples/cry_wartortle.bin"

	.align 2
Cry_Blastoise:: @ 8518024
	.incbin "sound/direct_sound_samples/cry_blastoise.bin"

	.align 2
Cry_Caterpie:: @ 851936C
	.incbin "sound/direct_sound_samples/cry_caterpie.bin"

	.align 2
Cry_Metapod:: @ 8519BC4
	.incbin "sound/direct_sound_samples/cry_metapod.bin"

	.align 2
Cry_Butterfree:: @ 851B314
	.incbin "sound/direct_sound_samples/cry_butterfree.bin"

	.align 2
Cry_Weedle:: @ 851BD1C
	.incbin "sound/direct_sound_samples/cry_weedle.bin"

	.align 2
Cry_Kakuna:: @ 851CD60
	.incbin "sound/direct_sound_samples/cry_kakuna.bin"

	.align 2
Cry_Beedrill:: @ 851DF9C
	.incbin "sound/direct_sound_samples/cry_beedrill.bin"

	.align 2
Cry_Pidgey:: @ 851F2F8
	.incbin "sound/direct_sound_samples/cry_pidgey.bin"

	.align 2
Cry_Pidgeotto:: @ 851F6E0
	.incbin "sound/direct_sound_samples/cry_pidgeotto.bin"

	.align 2
Cry_Pidgeot:: @ 85205E8
	.incbin "sound/direct_sound_samples/cry_pidgeot.bin"

	.align 2
Cry_Rattata:: @ 852171C
	.incbin "sound/direct_sound_samples/cry_rattata.bin"

	.align 2
Cry_Raticate:: @ 8521EFC
	.incbin "sound/direct_sound_samples/cry_raticate.bin"

	.align 2
Cry_Spearow:: @ 8522880
	.incbin "sound/direct_sound_samples/cry_spearow.bin"

	.align 2
Cry_Fearow:: @ 8523A24
	.incbin "sound/direct_sound_samples/cry_fearow.bin"

	.align 2
Cry_Ekans:: @ 8524B60
	.incbin "sound/direct_sound_samples/cry_ekans.bin"

	.align 2
Cry_Arbok:: @ 8525EAC
	.incbin "sound/direct_sound_samples/cry_arbok.bin"

	.align 2
Cry_Pikachu:: @ 8527204
	.incbin "sound/direct_sound_samples/cry_pikachu.bin"

	.align 2
Cry_Raichu:: @ 85282AC
	.incbin "sound/direct_sound_samples/cry_raichu.bin"

	.align 2
Cry_Sandshrew:: @ 8529A6C
	.incbin "sound/direct_sound_samples/cry_sandshrew.bin"

	.align 2
Cry_Sandslash:: @ 852A3C0
	.incbin "sound/direct_sound_samples/cry_sandslash.bin"

	.align 2
Cry_NidoranF:: @ 852B150
	.incbin "sound/direct_sound_samples/cry_nidoran_f.bin"

	.align 2
Cry_Nidorina:: @ 852BB00
	.incbin "sound/direct_sound_samples/cry_nidorina.bin"

	.align 2
Cry_Nidoqueen:: @ 852C7C8
	.incbin "sound/direct_sound_samples/cry_nidoqueen.bin"

	.align 2
Cry_NidoranM:: @ 852D8A8
	.incbin "sound/direct_sound_samples/cry_nidoran_m.bin"

	.align 2
Cry_Nidorino:: @ 852E310
	.incbin "sound/direct_sound_samples/cry_nidorino.bin"

	.align 2
Cry_Nidoking:: @ 852EF24
	.incbin "sound/direct_sound_samples/cry_nidoking.bin"

	.align 2
Cry_Clefairy:: @ 8530790
	.incbin "sound/direct_sound_samples/cry_clefairy.bin"

	.align 2
Cry_Clefable:: @ 8531000
	.incbin "sound/direct_sound_samples/cry_clefable.bin"

	.align 2
Cry_Vulpix:: @ 8531A90
	.incbin "sound/direct_sound_samples/cry_vulpix.bin"

	.align 2
Cry_Ninetales:: @ 8533260
	.incbin "sound/direct_sound_samples/cry_ninetales.bin"

	.align 2
Cry_Jigglypuff:: @ 8534ACC
	.incbin "sound/direct_sound_samples/cry_jigglypuff.bin"

	.align 2
Cry_Wigglytuff:: @ 8535030
	.incbin "sound/direct_sound_samples/cry_wigglytuff.bin"

	.align 2
Cry_Zubat:: @ 85356F8
	.incbin "sound/direct_sound_samples/cry_zubat.bin"

	.align 2
Cry_Golbat:: @ 8536A64
	.incbin "sound/direct_sound_samples/cry_golbat.bin"

	.align 2
Cry_Oddish:: @ 8537DC8
	.incbin "sound/direct_sound_samples/cry_oddish.bin"

	.align 2
Cry_Gloom:: @ 8538C64
	.incbin "sound/direct_sound_samples/cry_gloom.bin"

	.align 2
Cry_Vileplume:: @ 85398E0
	.incbin "sound/direct_sound_samples/cry_vileplume.bin"

	.align 2
Cry_Paras:: @ 853B27C
	.incbin "sound/direct_sound_samples/cry_paras.bin"

	.align 2
Cry_Parasect:: @ 853CE70
	.incbin "sound/direct_sound_samples/cry_parasect.bin"

	.align 2
Cry_Venonat:: @ 853ECD8
	.incbin "sound/direct_sound_samples/cry_venonat.bin"

	.align 2
Cry_Venomoth:: @ 853FC58
	.incbin "sound/direct_sound_samples/cry_venomoth.bin"

	.align 2
Cry_Diglett:: @ 8540C5C
	.incbin "sound/direct_sound_samples/cry_diglett.bin"

	.align 2
Cry_Dugtrio:: @ 8541FCC
	.incbin "sound/direct_sound_samples/cry_dugtrio.bin"

	.align 2
Cry_Meowth:: @ 8543338
	.incbin "sound/direct_sound_samples/cry_meowth.bin"

	.align 2
Cry_Persian:: @ 8543CC8
	.incbin "sound/direct_sound_samples/cry_persian.bin"

	.align 2
Cry_Psyduck:: @ 8544FA4
	.incbin "sound/direct_sound_samples/cry_psyduck.bin"

	.align 2
Cry_Golduck:: @ 8545CCC
	.incbin "sound/direct_sound_samples/cry_golduck.bin"

	.align 2
Cry_Mankey:: @ 8546814
	.incbin "sound/direct_sound_samples/cry_mankey.bin"

	.align 2
Cry_Primeape:: @ 8547874
	.incbin "sound/direct_sound_samples/cry_primeape.bin"

	.align 2
Cry_Growlithe:: @ 85488A4
	.incbin "sound/direct_sound_samples/cry_growlithe.bin"

	.align 2
Cry_Arcanine:: @ 8549608
	.incbin "sound/direct_sound_samples/cry_arcanine.bin"

	.align 2
Cry_Poliwag:: @ 854A744
	.incbin "sound/direct_sound_samples/cry_poliwag.bin"

	.align 2
Cry_Poliwhirl:: @ 854B260
	.incbin "sound/direct_sound_samples/cry_poliwhirl.bin"

	.align 2
Cry_Poliwrath:: @ 854B908
	.incbin "sound/direct_sound_samples/cry_poliwrath.bin"

	.align 2
Cry_Abra:: @ 854C42C
	.incbin "sound/direct_sound_samples/cry_abra.bin"

	.align 2
Cry_Kadabra:: @ 854DB90
	.incbin "sound/direct_sound_samples/cry_kadabra.bin"

	.align 2
Cry_Alakazam:: @ 854F678
	.incbin "sound/direct_sound_samples/cry_alakazam.bin"

	.align 2
Cry_Machop:: @ 8551614
	.incbin "sound/direct_sound_samples/cry_machop.bin"

	.align 2
Cry_Machoke:: @ 8552378
	.incbin "sound/direct_sound_samples/cry_machoke.bin"

	.align 2
Cry_Machamp:: @ 8553108
	.incbin "sound/direct_sound_samples/cry_machamp.bin"

	.align 2
Cry_Bellsprout:: @ 8554190
	.incbin "sound/direct_sound_samples/cry_bellsprout.bin"

	.align 2
Cry_Weepinbell:: @ 855491C
	.incbin "sound/direct_sound_samples/cry_weepinbell.bin"

	.align 2
Cry_Victreebel:: @ 85557BC
	.incbin "sound/direct_sound_samples/cry_victreebel.bin"

	.align 2
Cry_Tentacool:: @ 8556B08
	.incbin "sound/direct_sound_samples/cry_tentacool.bin"

	.align 2
Cry_Tentacruel:: @ 8557AF8
	.incbin "sound/direct_sound_samples/cry_tentacruel.bin"

	.align 2
Cry_Geodude:: @ 85591F4
	.incbin "sound/direct_sound_samples/cry_geodude.bin"

	.align 2
Cry_Graveler:: @ 855A9A8
	.incbin "sound/direct_sound_samples/cry_graveler.bin"

	.align 2
Cry_Golem:: @ 855C590
	.incbin "sound/direct_sound_samples/cry_golem.bin"

	.align 2
Cry_Ponyta:: @ 855D3BC
	.incbin "sound/direct_sound_samples/cry_ponyta.bin"

	.align 2
Cry_Rapidash:: @ 855E2CC
	.incbin "sound/direct_sound_samples/cry_rapidash.bin"

	.align 2
Cry_Slowpoke:: @ 855F56C
	.incbin "sound/direct_sound_samples/cry_slowpoke.bin"

	.align 2
Cry_Slowbro:: @ 855FCD4
	.incbin "sound/direct_sound_samples/cry_slowbro.bin"

	.align 2
Cry_Magnemite:: @ 8560A44
	.incbin "sound/direct_sound_samples/cry_magnemite.bin"

	.align 2
Cry_Magneton:: @ 8561D88
	.incbin "sound/direct_sound_samples/cry_magneton.bin"

	.align 2
Cry_Farfetchd:: @ 8563570
	.incbin "sound/direct_sound_samples/cry_farfetchd.bin"

	.align 2
Cry_Doduo:: @ 8563CEC
	.incbin "sound/direct_sound_samples/cry_doduo.bin"

	.align 2
Cry_Dodrio:: @ 8565030
	.incbin "sound/direct_sound_samples/cry_dodrio.bin"

	.align 2
Cry_Seel:: @ 85663A8
	.incbin "sound/direct_sound_samples/cry_seel.bin"

	.align 2
Cry_Dewgong:: @ 8567598
	.incbin "sound/direct_sound_samples/cry_dewgong.bin"

	.align 2
Cry_Grimer:: @ 8568ABC
	.incbin "sound/direct_sound_samples/cry_grimer.bin"

	.align 2
Cry_Muk:: @ 8569544
	.incbin "sound/direct_sound_samples/cry_muk.bin"

	.align 2
Cry_Shellder:: @ 856A404
	.incbin "sound/direct_sound_samples/cry_shellder.bin"

	.align 2
Cry_Cloyster:: @ 856B378
	.incbin "sound/direct_sound_samples/cry_cloyster.bin"

	.align 2
Cry_Gastly:: @ 856C83C
	.incbin "sound/direct_sound_samples/cry_gastly.bin"

	.align 2
Cry_Haunter:: @ 856DF8C
	.incbin "sound/direct_sound_samples/cry_haunter.bin"

	.align 2
Cry_Gengar:: @ 856F70C
	.incbin "sound/direct_sound_samples/cry_gengar.bin"

	.align 2
Cry_Onix:: @ 85705CC
	.incbin "sound/direct_sound_samples/cry_onix.bin"

	.align 2
Cry_Drowzee:: @ 8571E90
	.incbin "sound/direct_sound_samples/cry_drowzee.bin"

	.align 2
Cry_Hypno:: @ 8573BA8
	.incbin "sound/direct_sound_samples/cry_hypno.bin"

	.align 2
Cry_Krabby:: @ 85758AC
	.incbin "sound/direct_sound_samples/cry_krabby.bin"

	.align 2
Cry_Kingler:: @ 85770F8
	.incbin "sound/direct_sound_samples/cry_kingler.bin"

	.align 2
Cry_Voltorb:: @ 8578950
	.incbin "sound/direct_sound_samples/cry_voltorb.bin"

	.align 2
Cry_Electrode:: @ 857A214
	.incbin "sound/direct_sound_samples/cry_electrode.bin"

	.align 2
Cry_Exeggcute:: @ 857BB4C
	.incbin "sound/direct_sound_samples/cry_exeggcute.bin"

	.align 2
Cry_Exeggutor:: @ 857CE2C
	.incbin "sound/direct_sound_samples/cry_exeggutor.bin"

	.align 2
Cry_Cubone:: @ 857EE10
	.incbin "sound/direct_sound_samples/cry_cubone.bin"

	.align 2
Cry_Marowak:: @ 857FD30
	.incbin "sound/direct_sound_samples/cry_marowak.bin"

	.align 2
Cry_Hitmonlee:: @ 8580BA0
	.incbin "sound/direct_sound_samples/cry_hitmonlee.bin"

	.align 2
Cry_Hitmonchan:: @ 8581E4C
	.incbin "sound/direct_sound_samples/cry_hitmonchan.bin"

	.align 2
Cry_Lickitung:: @ 8583024
	.incbin "sound/direct_sound_samples/cry_lickitung.bin"

	.align 2
Cry_Koffing:: @ 8583F4C
	.incbin "sound/direct_sound_samples/cry_koffing.bin"

	.align 2
Cry_Weezing:: @ 85853A8
	.incbin "sound/direct_sound_samples/cry_weezing.bin"

	.align 2
Cry_Rhyhorn:: @ 8586954
	.incbin "sound/direct_sound_samples/cry_rhyhorn.bin"

	.align 2
Cry_Rhydon:: @ 8587CC0
	.incbin "sound/direct_sound_samples/cry_rhydon.bin"

	.align 2
Cry_Chansey:: @ 858912C
	.incbin "sound/direct_sound_samples/cry_chansey.bin"

	.align 2
Cry_Tangela:: @ 8589FF8
	.incbin "sound/direct_sound_samples/cry_tangela.bin"

	.align 2
Cry_Kangaskhan:: @ 858AF14
	.incbin "sound/direct_sound_samples/cry_kangaskhan.bin"

	.align 2
Cry_Horsea:: @ 858C1C8
	.incbin "sound/direct_sound_samples/cry_horsea.bin"

	.align 2
Cry_Seadra:: @ 858CB44
	.incbin "sound/direct_sound_samples/cry_seadra.bin"

	.align 2
Cry_Goldeen:: @ 858D3B0
	.incbin "sound/direct_sound_samples/cry_goldeen.bin"

	.align 2
Cry_Seaking:: @ 858DD88
	.incbin "sound/direct_sound_samples/cry_seaking.bin"

	.align 2
Cry_Staryu:: @ 858F0E0
	.incbin "sound/direct_sound_samples/cry_staryu.bin"

	.align 2
Cry_Starmie:: @ 85904C8
	.incbin "sound/direct_sound_samples/cry_starmie.bin"

	.align 2
Cry_MrMime:: @ 85919A4
	.incbin "sound/direct_sound_samples/cry_mr_mime.bin"

	.align 2
Cry_Scyther:: @ 8592C94
	.incbin "sound/direct_sound_samples/cry_scyther.bin"

	.align 2
Cry_Jynx:: @ 85939F0
	.incbin "sound/direct_sound_samples/cry_jynx.bin"

	.align 2
Cry_Electabuzz:: @ 8596964
	.incbin "sound/direct_sound_samples/cry_electabuzz.bin"

	.align 2
Cry_Magmar:: @ 8598848
	.incbin "sound/direct_sound_samples/cry_magmar.bin"

	.align 2
Cry_Pinsir:: @ 85997C4
	.incbin "sound/direct_sound_samples/cry_pinsir.bin"

	.align 2
Cry_Tauros:: @ 859A420
	.incbin "sound/direct_sound_samples/cry_tauros.bin"

	.align 2
Cry_Magikarp:: @ 859B674
	.incbin "sound/direct_sound_samples/cry_magikarp.bin"

	.align 2
Cry_Gyarados:: @ 859C97C
	.incbin "sound/direct_sound_samples/cry_gyarados.bin"

	.align 2
Cry_Lapras:: @ 859DDB0
	.incbin "sound/direct_sound_samples/cry_lapras.bin"

	.align 2
Cry_Ditto:: @ 859EC84
	.incbin "sound/direct_sound_samples/cry_ditto.bin"

	.align 2
Cry_Eevee:: @ 859F7A0
	.incbin "sound/direct_sound_samples/cry_eevee.bin"

	.align 2
Cry_Vaporeon:: @ 85A05D8
	.incbin "sound/direct_sound_samples/cry_vaporeon.bin"

	.align 2
Cry_Jolteon:: @ 85A1BF0
	.incbin "sound/direct_sound_samples/cry_jolteon.bin"

	.align 2
Cry_Flareon:: @ 85A2BC4
	.incbin "sound/direct_sound_samples/cry_flareon.bin"

	.align 2
Cry_Porygon:: @ 85A3B48
	.incbin "sound/direct_sound_samples/cry_porygon.bin"

	.align 2
Cry_Omanyte:: @ 85A4F54
	.incbin "sound/direct_sound_samples/cry_omanyte.bin"

	.align 2
Cry_Omastar:: @ 85A5CAC
	.incbin "sound/direct_sound_samples/cry_omastar.bin"

	.align 2
Cry_Kabuto:: @ 85A6A00
	.incbin "sound/direct_sound_samples/cry_kabuto.bin"

	.align 2
Cry_Kabutops:: @ 85A7654
	.incbin "sound/direct_sound_samples/cry_kabutops.bin"

	.align 2
Cry_Aerodactyl:: @ 85A8410
	.incbin "sound/direct_sound_samples/cry_aerodactyl.bin"

	.align 2
Cry_Snorlax:: @ 85A9C6C
	.incbin "sound/direct_sound_samples/cry_snorlax.bin"

	.align 2
Cry_Articuno:: @ 85AA1A8
	.incbin "sound/direct_sound_samples/cry_articuno.bin"

	.align 2
Cry_Zapdos:: @ 85AB950
	.incbin "sound/direct_sound_samples/cry_zapdos.bin"

	.align 2
Cry_Moltres:: @ 85AC8C8
	.incbin "sound/direct_sound_samples/cry_moltres.bin"

	.align 2
Cry_Dratini:: @ 85AE074
	.incbin "sound/direct_sound_samples/cry_dratini.bin"

	.align 2
Cry_Dragonair:: @ 85AEC10
	.incbin "sound/direct_sound_samples/cry_dragonair.bin"

	.align 2
Cry_Dragonite:: @ 85AFCB8
	.incbin "sound/direct_sound_samples/cry_dragonite.bin"

	.align 2
Cry_Mewtwo:: @ 85B0FC4
	.incbin "sound/direct_sound_samples/cry_mewtwo.bin"

	.align 2
Cry_Mew:: @ 85B2E2C
	.incbin "sound/direct_sound_samples/cry_mew.bin"

	.align 2
Cry_Chikorita:: @ 85B4C94
	.incbin "sound/direct_sound_samples/cry_chikorita.bin"

	.align 2
Cry_Bayleef:: @ 85B51D4
	.incbin "sound/direct_sound_samples/cry_bayleef.bin"

	.align 2
Cry_Meganium:: @ 85B5AA0
	.incbin "sound/direct_sound_samples/cry_meganium.bin"

	.align 2
Cry_Cyndaquil:: @ 85B6AD8
	.incbin "sound/direct_sound_samples/cry_cyndaquil.bin"

	.align 2
Cry_Quilava:: @ 85B71DC
	.incbin "sound/direct_sound_samples/cry_quilava.bin"

	.align 2
Cry_Typhlosion:: @ 85B7DC4
	.incbin "sound/direct_sound_samples/cry_typhlosion.bin"

	.align 2
Cry_Totodile:: @ 85BA3D4
	.incbin "sound/direct_sound_samples/cry_totodile.bin"

	.align 2
Cry_Croconaw:: @ 85BB62C
	.incbin "sound/direct_sound_samples/cry_croconaw.bin"

	.align 2
Cry_Feraligatr:: @ 85BCA68
	.incbin "sound/direct_sound_samples/cry_feraligatr.bin"

	.align 2
Cry_Sentret:: @ 85BE3EC
	.incbin "sound/direct_sound_samples/cry_sentret.bin"

	.align 2
Cry_Furret:: @ 85BE814
	.incbin "sound/direct_sound_samples/cry_furret.bin"

	.align 2
Cry_Hoothoot:: @ 85BEE5C
	.incbin "sound/direct_sound_samples/cry_hoothoot.bin"

	.align 2
Cry_Noctowl:: @ 85BF940
	.incbin "sound/direct_sound_samples/cry_noctowl.bin"

	.align 2
Cry_Ledyba:: @ 85C0E70
	.incbin "sound/direct_sound_samples/cry_ledyba.bin"

	.align 2
Cry_Ledian:: @ 85C1568
	.incbin "sound/direct_sound_samples/cry_ledian.bin"

	.align 2
Cry_Spinarak:: @ 85C1DCC
	.incbin "sound/direct_sound_samples/cry_spinarak.bin"

	.align 2
Cry_Ariados:: @ 85C2B30
	.incbin "sound/direct_sound_samples/cry_ariados.bin"

	.align 2
Cry_Crobat:: @ 85C3784
	.incbin "sound/direct_sound_samples/cry_crobat.bin"

	.align 2
Cry_Chinchou:: @ 85C4EB4
	.incbin "sound/direct_sound_samples/cry_chinchou.bin"

	.align 2
Cry_Lanturn:: @ 85C5B64
	.incbin "sound/direct_sound_samples/cry_lanturn.bin"

	.align 2
Cry_Pichu:: @ 85C65F0
	.incbin "sound/direct_sound_samples/cry_pichu.bin"

	.align 2
Cry_Cleffa:: @ 85C6D44
	.incbin "sound/direct_sound_samples/cry_cleffa.bin"

	.align 2
Cry_Igglybuff:: @ 85C7334
	.incbin "sound/direct_sound_samples/cry_igglybuff.bin"

	.align 2
Cry_Togepi:: @ 85C7A30
	.incbin "sound/direct_sound_samples/cry_togepi.bin"

	.align 2
Cry_Togetic:: @ 85C8518
	.incbin "sound/direct_sound_samples/cry_togetic.bin"

	.align 2
Cry_Natu:: @ 85C8C18
	.incbin "sound/direct_sound_samples/cry_natu.bin"

	.align 2
Cry_Xatu:: @ 85C96A8
	.incbin "sound/direct_sound_samples/cry_xatu.bin"

	.align 2
Cry_Mareep:: @ 85CA574
	.incbin "sound/direct_sound_samples/cry_mareep.bin"

	.align 2
Cry_Flaaffy:: @ 85CACCC
	.incbin "sound/direct_sound_samples/cry_flaaffy.bin"

	.align 2
Cry_Ampharos:: @ 85CBA80
	.incbin "sound/direct_sound_samples/cry_ampharos.bin"

	.align 2
Cry_Bellossom:: @ 85CCB00
	.incbin "sound/direct_sound_samples/cry_bellossom.bin"

	.align 2
Cry_Marill:: @ 85CD918
	.incbin "sound/direct_sound_samples/cry_marill.bin"

	.align 2
Cry_Azumarill:: @ 85CE62C
	.incbin "sound/direct_sound_samples/cry_azumarill.bin"

	.align 2
Cry_Sudowoodo:: @ 85CF718
	.incbin "sound/direct_sound_samples/cry_sudowoodo.bin"

	.align 2
Cry_Politoed:: @ 85D0748
	.incbin "sound/direct_sound_samples/cry_politoed.bin"

	.align 2
Cry_Hoppip:: @ 85D198C
	.incbin "sound/direct_sound_samples/cry_hoppip.bin"

	.align 2
Cry_Skiploom:: @ 85D21F8
	.incbin "sound/direct_sound_samples/cry_skiploom.bin"

	.align 2
Cry_Jumpluff:: @ 85D2F00
	.incbin "sound/direct_sound_samples/cry_jumpluff.bin"

	.align 2
Cry_Aipom:: @ 85D3F3C
	.incbin "sound/direct_sound_samples/cry_aipom.bin"

	.align 2
Cry_Sunkern:: @ 85D4D5C
	.incbin "sound/direct_sound_samples/cry_sunkern.bin"

	.align 2
Cry_Sunflora:: @ 85D5570
	.incbin "sound/direct_sound_samples/cry_sunflora.bin"

	.align 2
Cry_Yanma:: @ 85D6550
	.incbin "sound/direct_sound_samples/cry_yanma.bin"

	.align 2
Cry_Wooper:: @ 85D7658
	.incbin "sound/direct_sound_samples/cry_wooper.bin"

	.align 2
Cry_Quagsire:: @ 85D7DB8
	.incbin "sound/direct_sound_samples/cry_quagsire.bin"

	.align 2
Cry_Espeon:: @ 85D8B18
	.incbin "sound/direct_sound_samples/cry_espeon.bin"

	.align 2
Cry_Umbreon:: @ 85D9ECC
	.incbin "sound/direct_sound_samples/cry_umbreon.bin"

	.align 2
Cry_Murkrow:: @ 85DAE4C
	.incbin "sound/direct_sound_samples/cry_murkrow.bin"

	.align 2
Cry_Slowking:: @ 85DBF10
	.incbin "sound/direct_sound_samples/cry_slowking.bin"

	.align 2
Cry_Misdreavus:: @ 85DD6F4
	.incbin "sound/direct_sound_samples/cry_misdreavus.bin"

	.align 2
Cry_Unown:: @ 85DE294
	.incbin "sound/direct_sound_samples/cry_unown.bin"

	.align 2
Cry_Wobbuffet:: @ 85DEFBC
	.incbin "sound/direct_sound_samples/cry_wobbuffet.bin"

	.align 2
Cry_Girafarig:: @ 85E0458
	.incbin "sound/direct_sound_samples/cry_girafarig.bin"

	.align 2
Cry_Pineco:: @ 85E130C
	.incbin "sound/direct_sound_samples/cry_pineco.bin"

	.align 2
Cry_Forretress:: @ 85E206C
	.incbin "sound/direct_sound_samples/cry_forretress.bin"

	.align 2
Cry_Dunsparce:: @ 85E3474
	.incbin "sound/direct_sound_samples/cry_dunsparce.bin"

	.align 2
Cry_Gligar:: @ 85E4454
	.incbin "sound/direct_sound_samples/cry_gligar.bin"

	.align 2
Cry_Steelix:: @ 85E5074
	.incbin "sound/direct_sound_samples/cry_steelix.bin"

	.align 2
Cry_Snubbull:: @ 85E769C
	.incbin "sound/direct_sound_samples/cry_snubbull.bin"

	.align 2
Cry_Granbull:: @ 85E8510
	.incbin "sound/direct_sound_samples/cry_granbull.bin"

	.align 2
Cry_Qwilfish:: @ 85E9CB4
	.incbin "sound/direct_sound_samples/cry_qwilfish.bin"

	.align 2
Cry_Scizor:: @ 85EA850
	.incbin "sound/direct_sound_samples/cry_scizor.bin"

	.align 2
Cry_Shuckle:: @ 85EBF4C
	.incbin "sound/direct_sound_samples/cry_shuckle.bin"

	.align 2
Cry_Heracross:: @ 85EC980
	.incbin "sound/direct_sound_samples/cry_heracross.bin"

	.align 2
Cry_Sneasel:: @ 85EDBD4
	.incbin "sound/direct_sound_samples/cry_sneasel.bin"

	.align 2
Cry_Teddiursa:: @ 85EE4F8
	.incbin "sound/direct_sound_samples/cry_teddiursa.bin"

	.align 2
Cry_Ursaring:: @ 85EF584
	.incbin "sound/direct_sound_samples/cry_ursaring.bin"

	.align 2
Cry_Slugma:: @ 85F135C
	.incbin "sound/direct_sound_samples/cry_slugma.bin"

	.align 2
Cry_Magcargo:: @ 85F2474
	.incbin "sound/direct_sound_samples/cry_magcargo.bin"

	.align 2
Cry_Swinub:: @ 85F397C
	.incbin "sound/direct_sound_samples/cry_swinub.bin"

	.align 2
Cry_Piloswine:: @ 85F4624
	.incbin "sound/direct_sound_samples/cry_piloswine.bin"

	.align 2
Cry_Corsola:: @ 85F5318
	.incbin "sound/direct_sound_samples/cry_corsola.bin"

	.align 2
Cry_Remoraid:: @ 85F5FF8
	.incbin "sound/direct_sound_samples/cry_remoraid.bin"

	.align 2
Cry_Octillery:: @ 85F6A88
	.incbin "sound/direct_sound_samples/cry_octillery.bin"

	.align 2
Cry_Delibird:: @ 85F84CC
	.incbin "sound/direct_sound_samples/cry_delibird.bin"

	.align 2
Cry_Mantine:: @ 85F9500
	.incbin "sound/direct_sound_samples/cry_mantine.bin"

	.align 2
Cry_Skarmory:: @ 85FA4C8
	.incbin "sound/direct_sound_samples/cry_skarmory.bin"

	.align 2
Cry_Houndour:: @ 85FBCD0
	.incbin "sound/direct_sound_samples/cry_houndour.bin"

	.align 2
Cry_Houndoom:: @ 85FC978
	.incbin "sound/direct_sound_samples/cry_houndoom.bin"

	.align 2
Cry_Kingdra:: @ 85FDD28
	.incbin "sound/direct_sound_samples/cry_kingdra.bin"

	.align 2
Cry_Phanpy:: @ 85FEB00
	.incbin "sound/direct_sound_samples/cry_phanpy.bin"

	.align 2
Cry_Donphan:: @ 85FF650
	.incbin "sound/direct_sound_samples/cry_donphan.bin"

	.align 2
Cry_Porygon2:: @ 8600774
	.incbin "sound/direct_sound_samples/cry_porygon2.bin"

	.align 2
Cry_Stantler:: @ 860172C
	.incbin "sound/direct_sound_samples/cry_stantler.bin"

	.align 2
Cry_Smeargle:: @ 8602DA8
	.incbin "sound/direct_sound_samples/cry_smeargle.bin"

	.align 2
Cry_Tyrogue:: @ 86037DC
	.incbin "sound/direct_sound_samples/cry_tyrogue.bin"

	.align 2
Cry_Hitmontop:: @ 8604804
	.incbin "sound/direct_sound_samples/cry_hitmontop.bin"

	.align 2
Cry_Smoochum:: @ 86055E4
	.incbin "sound/direct_sound_samples/cry_smoochum.bin"

	.align 2
Cry_Elekid:: @ 8606198
	.incbin "sound/direct_sound_samples/cry_elekid.bin"

	.align 2
Cry_Magby:: @ 8606C24
	.incbin "sound/direct_sound_samples/cry_magby.bin"

	.align 2
Cry_Miltank:: @ 8607A94
	.incbin "sound/direct_sound_samples/cry_miltank.bin"

	.align 2
Cry_Blissey:: @ 8608970
	.incbin "sound/direct_sound_samples/cry_blissey.bin"

	.align 2
Cry_Raikou:: @ 8609A04
	.incbin "sound/direct_sound_samples/cry_raikou.bin"

	.align 2
Cry_Entei:: @ 860AB74
	.incbin "sound/direct_sound_samples/cry_entei.bin"

	.align 2
Cry_Suicune:: @ 860BFE8
	.incbin "sound/direct_sound_samples/cry_suicune.bin"

	.align 2
Cry_Larvitar:: @ 860D230
	.incbin "sound/direct_sound_samples/cry_larvitar.bin"

	.align 2
Cry_Pupitar:: @ 860DEE0
	.incbin "sound/direct_sound_samples/cry_pupitar.bin"

	.align 2
Cry_Tyranitar:: @ 860E750
	.incbin "sound/direct_sound_samples/cry_tyranitar.bin"

	.align 2
Cry_Lugia:: @ 860FEB0
	.incbin "sound/direct_sound_samples/cry_lugia.bin"

	.align 2
Cry_HoOh:: @ 86124A8
	.incbin "sound/direct_sound_samples/cry_ho_oh.bin"

	.align 2
Cry_Celebi:: @ 8613B3C
	.incbin "sound/direct_sound_samples/cry_celebi.bin"

	.align 2
Cry_Kecleon:: @ 86149B4
	.incbin "sound/direct_sound_samples/cry_kecleon.bin"

	.align 2
Cry_Roselia:: @ 8615214
	.incbin "sound/direct_sound_samples/cry_roselia.bin"

	.align 2
Cry_Torkoal:: @ 8615CD4
	.incbin "sound/direct_sound_samples/cry_torkoal.bin"

	.align 2
Cry_Electrike:: @ 8616620
	.incbin "sound/direct_sound_samples/cry_electrike.bin"

	.align 2
Cry_Manectric:: @ 861727C
	.incbin "sound/direct_sound_samples/cry_manectric.bin"

	.align 2
Cry_Duskull:: @ 8618784
	.incbin "sound/direct_sound_samples/cry_duskull.bin"

	.align 2
Cry_Latias:: @ 861921C
	.incbin "sound/direct_sound_samples/cry_latias.bin"

	.align 2
Cry_Wynaut:: @ 8619E4C
	.incbin "sound/direct_sound_samples/cry_wynaut.bin"

	.align 2
Cry_Seviper:: @ 861AC2C
	.incbin "sound/direct_sound_samples/cry_seviper.bin"

	.align 2
Cry_Sharpedo:: @ 861B7CC
	.incbin "sound/direct_sound_samples/cry_sharpedo.bin"

	.align 2
Cry_Zangoose:: @ 861CED8
	.incbin "sound/direct_sound_samples/cry_zangoose.bin"

	.align 2
Cry_Azurill:: @ 861D868
	.incbin "sound/direct_sound_samples/cry_azurill.bin"

	.align 2
Cry_Swablu:: @ 861E2D0
	.incbin "sound/direct_sound_samples/cry_swablu.bin"

	.align 2
Cry_Altaria:: @ 861E868
	.incbin "sound/direct_sound_samples/cry_altaria.bin"

	.align 2
Cry_Unused265:: @ 861F384
	.incbin "sound/direct_sound_samples/cry_unused_265.bin"

	.align 2
Cry_Taillow:: @ 861FCD8
	.incbin "sound/direct_sound_samples/cry_taillow.bin"

	.align 2
Cry_Swellow:: @ 86202D8
	.incbin "sound/direct_sound_samples/cry_swellow.bin"

	.align 2
Cry_Unused268:: @ 8620BDC
	.incbin "sound/direct_sound_samples/cry_unused_268.bin"

	.align 2
Cry_Spinda:: @ 8621D8C
	.incbin "sound/direct_sound_samples/cry_spinda.bin"

	.align 2
Cry_Torchic:: @ 86229F8
	.incbin "sound/direct_sound_samples/cry_torchic.bin"

	.align 2
Cry_Combusken:: @ 86233A0
	.incbin "sound/direct_sound_samples/cry_combusken.bin"

	.align 2
Cry_Blaziken:: @ 8625074
	.incbin "sound/direct_sound_samples/cry_blaziken.bin"

	.align 2
Cry_Treecko:: @ 8626FF4
	.incbin "sound/direct_sound_samples/cry_treecko.bin"

	.align 2
Cry_Grovyle:: @ 8627B9C
	.incbin "sound/direct_sound_samples/cry_grovyle.bin"

	.align 2
Cry_Sceptile:: @ 8629010
	.incbin "sound/direct_sound_samples/cry_sceptile.bin"

	.align 2
Cry_Mudkip:: @ 862AA2C
	.incbin "sound/direct_sound_samples/cry_mudkip.bin"

	.align 2
Cry_Marshtomp:: @ 862B1B0
	.incbin "sound/direct_sound_samples/cry_marshtomp.bin"

	.align 2
Cry_Swampert:: @ 862C2B4
	.incbin "sound/direct_sound_samples/cry_swampert.bin"

	.align 2
Cry_Pelipper:: @ 862D934
	.incbin "sound/direct_sound_samples/cry_pelipper.bin"

	.align 2
Cry_Wingull:: @ 862E4FC
	.incbin "sound/direct_sound_samples/cry_wingull.bin"

	.align 2
Cry_Banette:: @ 862F13C
	.incbin "sound/direct_sound_samples/cry_banette.bin"

	.align 2
Cry_Shuppet:: @ 862FDE4
	.incbin "sound/direct_sound_samples/cry_shuppet.bin"

	.align 2
Cry_Lotad:: @ 8630624
	.incbin "sound/direct_sound_samples/cry_lotad.bin"

	.align 2
Cry_Lombre:: @ 8630A8C
	.incbin "sound/direct_sound_samples/cry_lombre.bin"

	.align 2
Cry_Ludicolo:: @ 8631920
	.incbin "sound/direct_sound_samples/cry_ludicolo.bin"

	.align 2
Cry_Seedot:: @ 86329F0
	.incbin "sound/direct_sound_samples/cry_seedot.bin"

	.align 2
Cry_Nuzleaf:: @ 863321C
	.incbin "sound/direct_sound_samples/cry_nuzleaf.bin"

	.align 2
Cry_Shiftry:: @ 8633D84
	.incbin "sound/direct_sound_samples/cry_shiftry.bin"

	.align 2
Cry_Carvanha:: @ 8635148
	.incbin "sound/direct_sound_samples/cry_carvanha.bin"

	.align 2
Cry_Wurmple:: @ 8635B5C
	.incbin "sound/direct_sound_samples/cry_wurmple.bin"

	.align 2
Cry_Silcoon:: @ 8636428
	.incbin "sound/direct_sound_samples/cry_silcoon.bin"

	.align 2
Cry_Beautifly:: @ 8637454
	.incbin "sound/direct_sound_samples/cry_beautifly.bin"

	.align 2
Cry_Cascoon:: @ 8637C8C
	.incbin "sound/direct_sound_samples/cry_cascoon.bin"

	.align 2
Cry_Dustox:: @ 8638CD0
	.incbin "sound/direct_sound_samples/cry_dustox.bin"

	.align 2
Cry_Ralts:: @ 863997C
	.incbin "sound/direct_sound_samples/cry_ralts.bin"

	.align 2
Cry_Kirlia:: @ 863A398
	.incbin "sound/direct_sound_samples/cry_kirlia.bin"

	.align 2
Cry_Gardevoir:: @ 863AFC8
	.incbin "sound/direct_sound_samples/cry_gardevoir.bin"

	.align 2
Cry_Slakoth:: @ 863C82C
	.incbin "sound/direct_sound_samples/cry_slakoth.bin"

	.align 2
Cry_Vigoroth:: @ 863D0B0
	.incbin "sound/direct_sound_samples/cry_vigoroth.bin"

	.align 2
Cry_Slaking:: @ 863DF08
	.incbin "sound/direct_sound_samples/cry_slaking.bin"

	.align 2
Cry_Nincada:: @ 863E8F4
	.incbin "sound/direct_sound_samples/cry_nincada.bin"

	.align 2
Cry_Ninjask:: @ 863EF64
	.incbin "sound/direct_sound_samples/cry_ninjask.bin"

	.align 2
Cry_Shedinja:: @ 863FB8C
	.incbin "sound/direct_sound_samples/cry_shedinja.bin"

	.align 2
Cry_Makuhita:: @ 8640344
	.incbin "sound/direct_sound_samples/cry_makuhita.bin"

	.align 2
Cry_Hariyama:: @ 8640AA0
	.incbin "sound/direct_sound_samples/cry_hariyama.bin"

	.align 2
Cry_Nosepass:: @ 8641B58
	.incbin "sound/direct_sound_samples/cry_nosepass.bin"

	.align 2
Cry_Glalie:: @ 86428BC
	.incbin "sound/direct_sound_samples/cry_glalie.bin"

	.align 2
Cry_Plusle:: @ 8643DA0
	.incbin "sound/direct_sound_samples/cry_plusle.bin"

	.align 2
Cry_Minun:: @ 864469C
	.incbin "sound/direct_sound_samples/cry_minun.bin"

	.align 2
Cry_Surskit:: @ 86456A4
	.incbin "sound/direct_sound_samples/cry_surskit.bin"

	.align 2
Cry_Masquerain:: @ 8646124
	.incbin "sound/direct_sound_samples/cry_masquerain.bin"

	.align 2
Cry_Skitty:: @ 86474D8
	.incbin "sound/direct_sound_samples/cry_skitty.bin"

	.align 2
Cry_Delcatty:: @ 8647BEC
	.incbin "sound/direct_sound_samples/cry_delcatty.bin"

	.align 2
Cry_Gulpin:: @ 8649104
	.incbin "sound/direct_sound_samples/cry_gulpin.bin"

	.align 2
Cry_Swalot:: @ 8649908
	.incbin "sound/direct_sound_samples/cry_swalot.bin"

	.align 2
Cry_Numel:: @ 864AA68
	.incbin "sound/direct_sound_samples/cry_numel.bin"

	.align 2
Cry_Camerupt:: @ 864B3B4
	.incbin "sound/direct_sound_samples/cry_camerupt.bin"

	.align 2
Cry_Barboach:: @ 864CAD4
	.incbin "sound/direct_sound_samples/cry_barboach.bin"

	.align 2
Cry_Whiscash:: @ 864D410
	.incbin "sound/direct_sound_samples/cry_whiscash.bin"

	.align 2
Cry_Corphish:: @ 864E50C
	.incbin "sound/direct_sound_samples/cry_corphish.bin"

	.align 2
Cry_Crawdaunt:: @ 864F110
	.incbin "sound/direct_sound_samples/cry_crawdaunt.bin"

	.align 2
Cry_Spoink:: @ 86509C8
	.incbin "sound/direct_sound_samples/cry_spoink.bin"

	.align 2
Cry_Grumpig:: @ 8651108
	.incbin "sound/direct_sound_samples/cry_grumpig.bin"

	.align 2
Cry_Trapinch:: @ 8651DA8
	.incbin "sound/direct_sound_samples/cry_trapinch.bin"

	.align 2
Cry_Vibrava:: @ 86527CC
	.incbin "sound/direct_sound_samples/cry_vibrava.bin"

	.align 2
Cry_Flygon:: @ 86535D0
	.incbin "sound/direct_sound_samples/cry_flygon.bin"

	.align 2
Cry_Cacnea:: @ 8654FD8
	.incbin "sound/direct_sound_samples/cry_cacnea.bin"

	.align 2
Cry_Cacturne:: @ 86558C8
	.incbin "sound/direct_sound_samples/cry_cacturne.bin"

	.align 2
Cry_Baltoy:: @ 8656F78
	.incbin "sound/direct_sound_samples/cry_baltoy.bin"

	.align 2
Cry_Claydol:: @ 8657BFC
	.incbin "sound/direct_sound_samples/cry_claydol.bin"

	.align 2
Cry_Lunatone:: @ 8658F5C
	.incbin "sound/direct_sound_samples/cry_lunatone.bin"

	.align 2
Cry_Solrock:: @ 865A758
	.incbin "sound/direct_sound_samples/cry_solrock.bin"

	.align 2
Cry_Feebas:: @ 865B784
	.incbin "sound/direct_sound_samples/cry_feebas.bin"

	.align 2
Cry_Milotic:: @ 865BF58
	.incbin "sound/direct_sound_samples/cry_milotic.bin"

	.align 2
Cry_Absol:: @ 865E69C
	.incbin "sound/direct_sound_samples/cry_absol.bin"

	.align 2
Cry_Meditite:: @ 865F118
	.incbin "sound/direct_sound_samples/cry_meditite.bin"

	.align 2
Cry_Medicham:: @ 865F938
	.incbin "sound/direct_sound_samples/cry_medicham.bin"

	.align 2
Cry_Spheal:: @ 86609BC
	.incbin "sound/direct_sound_samples/cry_spheal.bin"

	.align 2
Cry_Sealeo:: @ 8660F70
	.incbin "sound/direct_sound_samples/cry_sealeo.bin"

	.align 2
Cry_Walrein:: @ 8661B48
	.incbin "sound/direct_sound_samples/cry_walrein.bin"

	.align 2
Cry_Clamperl:: @ 8663F94
	.incbin "sound/direct_sound_samples/cry_clamperl.bin"

	.align 2
Cry_Huntail:: @ 86651E4
	.incbin "sound/direct_sound_samples/cry_huntail.bin"

	.align 2
Cry_Gorebyss:: @ 86661CC
	.incbin "sound/direct_sound_samples/cry_gorebyss.bin"

	.align 2
Cry_Lileep:: @ 8667838
	.incbin "sound/direct_sound_samples/cry_lileep.bin"

	.align 2
Cry_Cradily:: @ 86681E0
	.incbin "sound/direct_sound_samples/cry_cradily.bin"

	.align 2
Cry_Anorith:: @ 8669F10
	.incbin "sound/direct_sound_samples/cry_anorith.bin"

	.align 2
Cry_Armaldo:: @ 866AAC8
	.incbin "sound/direct_sound_samples/cry_armaldo.bin"

	.align 2
Cry_Beldum:: @ 866C19C
	.incbin "sound/direct_sound_samples/cry_beldum.bin"

	.align 2
Cry_Metang:: @ 866CB3C
	.incbin "sound/direct_sound_samples/cry_metang.bin"

	.align 2
Cry_Metagross:: @ 866DE10
	.incbin "sound/direct_sound_samples/cry_metagross.bin"

	.align 2
Cry_Bagon:: @ 8670588
	.incbin "sound/direct_sound_samples/cry_bagon.bin"

	.align 2
Cry_Shelgon:: @ 8670D5C
	.incbin "sound/direct_sound_samples/cry_shelgon.bin"

	.align 2
Cry_Regirock:: @ 8672164
	.incbin "sound/direct_sound_samples/cry_regirock.bin"

	.align 2
Cry_Regice:: @ 8674140
	.incbin "sound/direct_sound_samples/cry_regice.bin"

	.align 2
Cry_Registeel:: @ 8676140
	.incbin "sound/direct_sound_samples/cry_registeel.bin"

	.align 2
Cry_Castform:: @ 8677844
	.incbin "sound/direct_sound_samples/cry_castform.bin"

	.align 2
Cry_Volbeat:: @ 86784DC
	.incbin "sound/direct_sound_samples/cry_volbeat.bin"

	.align 2
Cry_Illumise:: @ 8679064
	.incbin "sound/direct_sound_samples/cry_illumise.bin"

	.align 2
Cry_Poochyena:: @ 867A17C
	.incbin "sound/direct_sound_samples/cry_poochyena.bin"

	.align 2
Cry_Mightyena:: @ 867AAC4
	.incbin "sound/direct_sound_samples/cry_mightyena.bin"

	.align 2
Cry_Dusclops:: @ 867BE50
	.incbin "sound/direct_sound_samples/cry_dusclops.bin"

	.align 2
Cry_Sableye:: @ 867CC08
	.incbin "sound/direct_sound_samples/cry_sableye.bin"

	.align 2
Cry_Mawile:: @ 867D7AC
	.incbin "sound/direct_sound_samples/cry_mawile.bin"

	.align 2
Cry_Aron:: @ 867E32C
	.incbin "sound/direct_sound_samples/cry_aron.bin"

	.align 2
Cry_Lairon:: @ 867EC58
	.incbin "sound/direct_sound_samples/cry_lairon.bin"

	.align 2
Cry_Aggron:: @ 8680130
	.incbin "sound/direct_sound_samples/cry_aggron.bin"

	.align 2
Cry_Relicanth:: @ 8681AD4
	.incbin "sound/direct_sound_samples/cry_relicanth.bin"

	.align 2
Cry_Luvdisc:: @ 8682F04
	.incbin "sound/direct_sound_samples/cry_luvdisc.bin"

	.align 2
Cry_Groudon:: @ 86833E0
	.incbin "sound/direct_sound_samples/cry_groudon.bin"

	.align 2
Cry_Kyogre:: @ 86858EC
	.incbin "sound/direct_sound_samples/cry_kyogre.bin"

	.align 2
Cry_Rayquaza:: @ 8687CA4
	.incbin "sound/direct_sound_samples/cry_rayquaza.bin"

	.align 2
Cry_Salamence:: @ 86899D0
	.incbin "sound/direct_sound_samples/cry_salamence.bin"

	.align 2
Cry_Breloom:: @ 868B2EC
	.incbin "sound/direct_sound_samples/cry_breloom.bin"

	.align 2
Cry_Shroomish:: @ 868BFAC
	.incbin "sound/direct_sound_samples/cry_shroomish.bin"

	.align 2
Cry_Linoone:: @ 868C884
	.incbin "sound/direct_sound_samples/cry_linoone.bin"

	.align 2
Cry_Tropius:: @ 868E720
	.incbin "sound/direct_sound_samples/cry_tropius.bin"

	.align 2
Cry_Wailmer:: @ 86907E4
	.incbin "sound/direct_sound_samples/cry_wailmer.bin"

	.align 2
Cry_Zigzagoon:: @ 8692444
	.incbin "sound/direct_sound_samples/cry_zigzagoon.bin"

	.align 2
Cry_Exploud:: @ 8692FD4
	.incbin "sound/direct_sound_samples/cry_exploud.bin"

	.align 2
Cry_Loudred:: @ 8694C1C
	.incbin "sound/direct_sound_samples/cry_loudred.bin"

	.align 2
Cry_Wailord:: @ 8695944
	.incbin "sound/direct_sound_samples/cry_wailord.bin"

	.align 2
Cry_Whismur:: @ 8698354
	.incbin "sound/direct_sound_samples/cry_whismur.bin"

	.align 2
Cry_Snorunt:: @ 8698B78
	.incbin "sound/direct_sound_samples/cry_snorunt.bin"

	.align 2
Cry_Latios:: @ 8699C80
	.incbin "sound/direct_sound_samples/cry_latios.bin"

	.align 2
Cry_Jirachi:: @ 869B278
	.incbin "sound/direct_sound_samples/cry_jirachi.bin"

	.align 2
Cry_Deoxys:: @ 869BFFC
	.incbin "sound/direct_sound_samples/cry_deoxys.bin"

	.align 2
Cry_Chimecho:: @ 869D4D0
	.incbin "sound/direct_sound_samples/cry_chimecho.bin"

	.align 2
	.incbin "baserom.gba", 0x69DEE0, 0x17760
