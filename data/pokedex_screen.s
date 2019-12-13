#include "constants/region_map.h"
#include "constants/flags.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.section .rodata
	.align 2

gUnknown_843FAB0:: @ 843FAB0
	.4byte gMonFootprint_Bulbasaur
	.4byte gMonFootprint_Bulbasaur
	.4byte gMonFootprint_Ivysaur
	.4byte gMonFootprint_Venusaur
	.4byte gMonFootprint_Charmander
	.4byte gMonFootprint_Charmeleon
	.4byte gMonFootprint_Charizard
	.4byte gMonFootprint_Squirtle
	.4byte gMonFootprint_Wartortle
	.4byte gMonFootprint_Blastoise
	.4byte gMonFootprint_Caterpie
	.4byte gMonFootprint_Metapod
	.4byte gMonFootprint_Butterfree
	.4byte gMonFootprint_Weedle
	.4byte gMonFootprint_Kakuna
	.4byte gMonFootprint_Beedrill
	.4byte gMonFootprint_Pidgey
	.4byte gMonFootprint_Pidgeotto
	.4byte gMonFootprint_Pidgeot
	.4byte gMonFootprint_Rattata
	.4byte gMonFootprint_Raticate
	.4byte gMonFootprint_Spearow
	.4byte gMonFootprint_Fearow
	.4byte gMonFootprint_Ekans
	.4byte gMonFootprint_Arbok
	.4byte gMonFootprint_Pikachu
	.4byte gMonFootprint_Raichu
	.4byte gMonFootprint_Sandshrew
	.4byte gMonFootprint_Sandslash
	.4byte gMonFootprint_NidoranF
	.4byte gMonFootprint_Nidorina
	.4byte gMonFootprint_Nidoqueen
	.4byte gMonFootprint_NidoranM
	.4byte gMonFootprint_Nidorino
	.4byte gMonFootprint_Nidoking
	.4byte gMonFootprint_Clefairy
	.4byte gMonFootprint_Clefable
	.4byte gMonFootprint_Vulpix
	.4byte gMonFootprint_Ninetales
	.4byte gMonFootprint_Jigglypuff
	.4byte gMonFootprint_Wigglytuff
	.4byte gMonFootprint_Zubat
	.4byte gMonFootprint_Golbat
	.4byte gMonFootprint_Oddish
	.4byte gMonFootprint_Gloom
	.4byte gMonFootprint_Vileplume
	.4byte gMonFootprint_Paras
	.4byte gMonFootprint_Parasect
	.4byte gMonFootprint_Venonat
	.4byte gMonFootprint_Venomoth
	.4byte gMonFootprint_Diglett
	.4byte gMonFootprint_Dugtrio
	.4byte gMonFootprint_Meowth
	.4byte gMonFootprint_Persian
	.4byte gMonFootprint_Psyduck
	.4byte gMonFootprint_Golduck
	.4byte gMonFootprint_Mankey
	.4byte gMonFootprint_Primeape
	.4byte gMonFootprint_Growlithe
	.4byte gMonFootprint_Arcanine
	.4byte gMonFootprint_Poliwag
	.4byte gMonFootprint_Poliwhirl
	.4byte gMonFootprint_Poliwrath
	.4byte gMonFootprint_Abra
	.4byte gMonFootprint_Kadabra
	.4byte gMonFootprint_Alakazam
	.4byte gMonFootprint_Machop
	.4byte gMonFootprint_Machoke
	.4byte gMonFootprint_Machamp
	.4byte gMonFootprint_Bellsprout
	.4byte gMonFootprint_Weepinbell
	.4byte gMonFootprint_Victreebel
	.4byte gMonFootprint_Tentacool
	.4byte gMonFootprint_Tentacruel
	.4byte gMonFootprint_Geodude
	.4byte gMonFootprint_Graveler
	.4byte gMonFootprint_Golem
	.4byte gMonFootprint_Ponyta
	.4byte gMonFootprint_Rapidash
	.4byte gMonFootprint_Slowpoke
	.4byte gMonFootprint_Slowbro
	.4byte gMonFootprint_Magnemite
	.4byte gMonFootprint_Magneton
	.4byte gMonFootprint_Farfetchd
	.4byte gMonFootprint_Doduo
	.4byte gMonFootprint_Dodrio
	.4byte gMonFootprint_Seel
	.4byte gMonFootprint_Dewgong
	.4byte gMonFootprint_Grimer
	.4byte gMonFootprint_Muk
	.4byte gMonFootprint_Shellder
	.4byte gMonFootprint_Cloyster
	.4byte gMonFootprint_Gastly
	.4byte gMonFootprint_Haunter
	.4byte gMonFootprint_Gengar
	.4byte gMonFootprint_Onix
	.4byte gMonFootprint_Drowzee
	.4byte gMonFootprint_Hypno
	.4byte gMonFootprint_Krabby
	.4byte gMonFootprint_Kingler
	.4byte gMonFootprint_Voltorb
	.4byte gMonFootprint_Electrode
	.4byte gMonFootprint_Exeggcute
	.4byte gMonFootprint_Exeggutor
	.4byte gMonFootprint_Cubone
	.4byte gMonFootprint_Marowak
	.4byte gMonFootprint_Hitmonlee
	.4byte gMonFootprint_Hitmonchan
	.4byte gMonFootprint_Lickitung
	.4byte gMonFootprint_Koffing
	.4byte gMonFootprint_Weezing
	.4byte gMonFootprint_Rhyhorn
	.4byte gMonFootprint_Rhydon
	.4byte gMonFootprint_Chansey
	.4byte gMonFootprint_Tangela
	.4byte gMonFootprint_Kangaskhan
	.4byte gMonFootprint_Horsea
	.4byte gMonFootprint_Seadra
	.4byte gMonFootprint_Goldeen
	.4byte gMonFootprint_Seaking
	.4byte gMonFootprint_Staryu
	.4byte gMonFootprint_Starmie
	.4byte gMonFootprint_Mrmime
	.4byte gMonFootprint_Scyther
	.4byte gMonFootprint_Jynx
	.4byte gMonFootprint_Electabuzz
	.4byte gMonFootprint_Magmar
	.4byte gMonFootprint_Pinsir
	.4byte gMonFootprint_Tauros
	.4byte gMonFootprint_Magikarp
	.4byte gMonFootprint_Gyarados
	.4byte gMonFootprint_Lapras
	.4byte gMonFootprint_Ditto
	.4byte gMonFootprint_Eevee
	.4byte gMonFootprint_Vaporeon
	.4byte gMonFootprint_Jolteon
	.4byte gMonFootprint_Flareon
	.4byte gMonFootprint_Porygon
	.4byte gMonFootprint_Omanyte
	.4byte gMonFootprint_Omastar
	.4byte gMonFootprint_Kabuto
	.4byte gMonFootprint_Kabutops
	.4byte gMonFootprint_Aerodactyl
	.4byte gMonFootprint_Snorlax
	.4byte gMonFootprint_Articuno
	.4byte gMonFootprint_Zapdos
	.4byte gMonFootprint_Moltres
	.4byte gMonFootprint_Dratini
	.4byte gMonFootprint_Dragonair
	.4byte gMonFootprint_Dragonite
	.4byte gMonFootprint_Mewtwo
	.4byte gMonFootprint_Mew
	.4byte gMonFootprint_Chikorita
	.4byte gMonFootprint_Bayleef
	.4byte gMonFootprint_Meganium
	.4byte gMonFootprint_Cyndaquil
	.4byte gMonFootprint_Quilava
	.4byte gMonFootprint_Typhlosion
	.4byte gMonFootprint_Totodile
	.4byte gMonFootprint_Croconaw
	.4byte gMonFootprint_Feraligatr
	.4byte gMonFootprint_Sentret
	.4byte gMonFootprint_Furret
	.4byte gMonFootprint_Hoothoot
	.4byte gMonFootprint_Noctowl
	.4byte gMonFootprint_Ledyba
	.4byte gMonFootprint_Ledian
	.4byte gMonFootprint_Spinarak
	.4byte gMonFootprint_Ariados
	.4byte gMonFootprint_Crobat
	.4byte gMonFootprint_Chinchou
	.4byte gMonFootprint_Lanturn
	.4byte gMonFootprint_Pichu
	.4byte gMonFootprint_Cleffa
	.4byte gMonFootprint_Igglybuff
	.4byte gMonFootprint_Togepi
	.4byte gMonFootprint_Togetic
	.4byte gMonFootprint_Natu
	.4byte gMonFootprint_Xatu
	.4byte gMonFootprint_Mareep
	.4byte gMonFootprint_Flaaffy
	.4byte gMonFootprint_Ampharos
	.4byte gMonFootprint_Bellossom
	.4byte gMonFootprint_Marill
	.4byte gMonFootprint_Azumarill
	.4byte gMonFootprint_Sudowoodo
	.4byte gMonFootprint_Politoed
	.4byte gMonFootprint_Hoppip
	.4byte gMonFootprint_Skiploom
	.4byte gMonFootprint_Jumpluff
	.4byte gMonFootprint_Aipom
	.4byte gMonFootprint_Sunkern
	.4byte gMonFootprint_Sunflora
	.4byte gMonFootprint_Yanma
	.4byte gMonFootprint_Wooper
	.4byte gMonFootprint_Quagsire
	.4byte gMonFootprint_Espeon
	.4byte gMonFootprint_Umbreon
	.4byte gMonFootprint_Murkrow
	.4byte gMonFootprint_Slowking
	.4byte gMonFootprint_Misdreavus
	.4byte gMonFootprint_Unown
	.4byte gMonFootprint_Wobbuffet
	.4byte gMonFootprint_Girafarig
	.4byte gMonFootprint_Pineco
	.4byte gMonFootprint_Forretress
	.4byte gMonFootprint_Dunsparce
	.4byte gMonFootprint_Gligar
	.4byte gMonFootprint_Steelix
	.4byte gMonFootprint_Snubbull
	.4byte gMonFootprint_Granbull
	.4byte gMonFootprint_Qwilfish
	.4byte gMonFootprint_Scizor
	.4byte gMonFootprint_Shuckle
	.4byte gMonFootprint_Heracross
	.4byte gMonFootprint_Sneasel
	.4byte gMonFootprint_Teddiursa
	.4byte gMonFootprint_Ursaring
	.4byte gMonFootprint_Slugma
	.4byte gMonFootprint_Magcargo
	.4byte gMonFootprint_Swinub
	.4byte gMonFootprint_Piloswine
	.4byte gMonFootprint_Corsola
	.4byte gMonFootprint_Remoraid
	.4byte gMonFootprint_Octillery
	.4byte gMonFootprint_Delibird
	.4byte gMonFootprint_Mantine
	.4byte gMonFootprint_Skarmory
	.4byte gMonFootprint_Houndour
	.4byte gMonFootprint_Houndoom
	.4byte gMonFootprint_Kingdra
	.4byte gMonFootprint_Phanpy
	.4byte gMonFootprint_Donphan
	.4byte gMonFootprint_Porygon2
	.4byte gMonFootprint_Stantler
	.4byte gMonFootprint_Smeargle
	.4byte gMonFootprint_Tyrogue
	.4byte gMonFootprint_Hitmontop
	.4byte gMonFootprint_Smoochum
	.4byte gMonFootprint_Elekid
	.4byte gMonFootprint_Magby
	.4byte gMonFootprint_Miltank
	.4byte gMonFootprint_Blissey
	.4byte gMonFootprint_Raikou
	.4byte gMonFootprint_Entei
	.4byte gMonFootprint_Suicune
	.4byte gMonFootprint_Larvitar
	.4byte gMonFootprint_Pupitar
	.4byte gMonFootprint_Tyranitar
	.4byte gMonFootprint_Lugia
	.4byte gMonFootprint_HoOh
	.4byte gMonFootprint_Celebi
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_QuestionMark
	.4byte gMonFootprint_Treecko
	.4byte gMonFootprint_Grovyle
	.4byte gMonFootprint_Sceptile
	.4byte gMonFootprint_Torchic
	.4byte gMonFootprint_Combusken
	.4byte gMonFootprint_Blaziken
	.4byte gMonFootprint_Mudkip
	.4byte gMonFootprint_Marshtomp
	.4byte gMonFootprint_Swampert
	.4byte gMonFootprint_Poochyena
	.4byte gMonFootprint_Mightyena
	.4byte gMonFootprint_Zigzagoon
	.4byte gMonFootprint_Linoone
	.4byte gMonFootprint_Wurmple
	.4byte gMonFootprint_Silcoon
	.4byte gMonFootprint_Beautifly
	.4byte gMonFootprint_Cascoon
	.4byte gMonFootprint_Dustox
	.4byte gMonFootprint_Lotad
	.4byte gMonFootprint_Lombre
	.4byte gMonFootprint_Ludicolo
	.4byte gMonFootprint_Seedot
	.4byte gMonFootprint_Nuzleaf
	.4byte gMonFootprint_Shiftry
	.4byte gMonFootprint_Nincada
	.4byte gMonFootprint_Ninjask
	.4byte gMonFootprint_Shedinja
	.4byte gMonFootprint_Taillow
	.4byte gMonFootprint_Swellow
	.4byte gMonFootprint_Shroomish
	.4byte gMonFootprint_Breloom
	.4byte gMonFootprint_Spinda
	.4byte gMonFootprint_Wingull
	.4byte gMonFootprint_Pelipper
	.4byte gMonFootprint_Surskit
	.4byte gMonFootprint_Masquerain
	.4byte gMonFootprint_Wailmer
	.4byte gMonFootprint_Wailord
	.4byte gMonFootprint_Skitty
	.4byte gMonFootprint_Delcatty
	.4byte gMonFootprint_Kecleon
	.4byte gMonFootprint_Baltoy
	.4byte gMonFootprint_Claydol
	.4byte gMonFootprint_Nosepass
	.4byte gMonFootprint_Torkoal
	.4byte gMonFootprint_Sableye
	.4byte gMonFootprint_Barboach
	.4byte gMonFootprint_Whiscash
	.4byte gMonFootprint_Luvdisc
	.4byte gMonFootprint_Corphish
	.4byte gMonFootprint_Crawdaunt
	.4byte gMonFootprint_Feebas
	.4byte gMonFootprint_Milotic
	.4byte gMonFootprint_Carvanha
	.4byte gMonFootprint_Sharpedo
	.4byte gMonFootprint_Trapinch
	.4byte gMonFootprint_Vibrava
	.4byte gMonFootprint_Flygon
	.4byte gMonFootprint_Makuhita
	.4byte gMonFootprint_Hariyama
	.4byte gMonFootprint_Electrike
	.4byte gMonFootprint_Manectric
	.4byte gMonFootprint_Numel
	.4byte gMonFootprint_Camerupt
	.4byte gMonFootprint_Spheal
	.4byte gMonFootprint_Sealeo
	.4byte gMonFootprint_Walrein
	.4byte gMonFootprint_Cacnea
	.4byte gMonFootprint_Cacturne
	.4byte gMonFootprint_Snorunt
	.4byte gMonFootprint_Glalie
	.4byte gMonFootprint_Lunatone
	.4byte gMonFootprint_Solrock
	.4byte gMonFootprint_Azurill
	.4byte gMonFootprint_Spoink
	.4byte gMonFootprint_Grumpig
	.4byte gMonFootprint_Plusle
	.4byte gMonFootprint_Minun
	.4byte gMonFootprint_Mawile
	.4byte gMonFootprint_Meditite
	.4byte gMonFootprint_Medicham
	.4byte gMonFootprint_Swablu
	.4byte gMonFootprint_Altaria
	.4byte gMonFootprint_Wynaut
	.4byte gMonFootprint_Duskull
	.4byte gMonFootprint_Dusclops
	.4byte gMonFootprint_Roselia
	.4byte gMonFootprint_Slakoth
	.4byte gMonFootprint_Vigoroth
	.4byte gMonFootprint_Slaking
	.4byte gMonFootprint_Gulpin
	.4byte gMonFootprint_Swalot
	.4byte gMonFootprint_Tropius
	.4byte gMonFootprint_Whismur
	.4byte gMonFootprint_Loudred
	.4byte gMonFootprint_Exploud
	.4byte gMonFootprint_Clamperl
	.4byte gMonFootprint_Huntail
	.4byte gMonFootprint_Gorebyss
	.4byte gMonFootprint_Absol
	.4byte gMonFootprint_Shuppet
	.4byte gMonFootprint_Banette
	.4byte gMonFootprint_Seviper
	.4byte gMonFootprint_Zangoose
	.4byte gMonFootprint_Relicanth
	.4byte gMonFootprint_Aron
	.4byte gMonFootprint_Lairon
	.4byte gMonFootprint_Aggron
	.4byte gMonFootprint_Castform
	.4byte gMonFootprint_Volbeat
	.4byte gMonFootprint_Illumise
	.4byte gMonFootprint_Lileep
	.4byte gMonFootprint_Cradily
	.4byte gMonFootprint_Anorith
	.4byte gMonFootprint_Armaldo
	.4byte gMonFootprint_Ralts
	.4byte gMonFootprint_Kirlia
	.4byte gMonFootprint_Gardevoir
	.4byte gMonFootprint_Bagon
	.4byte gMonFootprint_Shelgon
	.4byte gMonFootprint_Salamence
	.4byte gMonFootprint_Beldum
	.4byte gMonFootprint_Metang
	.4byte gMonFootprint_Metagross
	.4byte gMonFootprint_Regirock
	.4byte gMonFootprint_Regice
	.4byte gMonFootprint_Registeel
	.4byte gMonFootprint_Kyogre
	.4byte gMonFootprint_Groudon
	.4byte gMonFootprint_Rayquaza
	.4byte gMonFootprint_Latias
	.4byte gMonFootprint_Latios
	.4byte gMonFootprint_Jirachi
	.4byte gMonFootprint_Deoxys
	.4byte gMonFootprint_Chimecho
	.4byte gMonFootprint_Bulbasaur

gUnknown_8440124:: @ 8440124 bin.lz
	.incbin "baserom.gba", 0x440124, 0x150

gUnknown_8440274:: @ 8440274 4bpp.lz
	.incbin "baserom.gba", 0x440274, 0x138

gUnknown_84403AC:: @ 84403AC 4bpp.lz
	.incbin "baserom.gba", 0x4403AC, 0x11C

gUnknown_84404C8:: @ 84404C8 gbapal
	.incbin "baserom.gba", 0x4404C8, 0x200

gUnknown_84406C8:: @ 84406C8 data16
	.2byte 0x46d8, 0x531a

gUnknown_84406CC:: @ 84406CC data16
	.2byte 0x3e9a

gUnknown_84406CE:: @ 84406CE data16
	.2byte 0x4efb, 0x3e5c, 0x4edc, 0x361e, 0x4abd, 0x3e5c, 0x4edc, 0x3e9a, 0x4efb

gUnknown_84406E0:: @ 84406E0 gbapal
	.incbin "baserom.gba", 0x4406E0, 0x200

gUnknown_84408E0::
	.incbin "baserom.gba", 0x4408E0, 0x2F8

gUnknown_8440BD8::
	.incbin "baserom.gba", 0x440BD8, 0x318

gUnknown_8440EF0:: @ 8440EF0 bin.lz
	.incbin "baserom.gba", 0x440EF0, 0x23C

gUnknown_844112C::
	.incbin "baserom.gba", 0x44112C, 0x390

gUnknown_84414BC::
	.incbin "baserom.gba", 0x4414BC, 0x584

gUnknown_8441A40::
	.incbin "baserom.gba", 0x441A40, 0x314

gUnknown_8441D54::
	.incbin "baserom.gba", 0x441D54, 0x2B0

gUnknown_8442004::
	.incbin "baserom.gba", 0x442004, 0x238

gUnknown_844223C::
	.incbin "baserom.gba", 0x44223C, 0x2A8

gUnknown_84424E4::
	.incbin "baserom.gba", 0x4424E4, 0x354

gUnknown_8442838::
	.incbin "baserom.gba", 0x442838, 0x388

gUnknown_8442BC0::
	.incbin "baserom.gba", 0x442BC0, 0x338

gUnknown_8442EF8::
	.incbin "baserom.gba", 0x442EF8, 0x294

gUnknown_844318C::
	.incbin "baserom.gba", 0x44318C, 0x294

gUnknown_8443420::
	.incbin "baserom.gba", 0x443420, 0x20

gUnknown_8443440::
	.incbin "baserom.gba", 0x443440, 0x20

gUnknown_8443460:: @ 8443460 gbapal
	.incbin "baserom.gba", 0x443460, 0x20

gUnknown_8443480::
	.incbin "baserom.gba", 0x443480, 0x20

gUnknown_84434A0::
	.incbin "baserom.gba", 0x4434A0, 0x40

gUnknown_84434E0::
	.incbin "baserom.gba", 0x4434E0, 0x20

gUnknown_8443500::
	.incbin "baserom.gba", 0x443500, 0x20

gUnknown_8443520::
	.incbin "baserom.gba", 0x443520, 0x20

gUnknown_8443540::
	.incbin "baserom.gba", 0x443540, 0x20

gUnknown_8443560::
	.incbin "baserom.gba", 0x443560, 0x20

gUnknown_8443580::
	.incbin "baserom.gba", 0x443580, 0x20

gUnknown_84435A0::
	.incbin "baserom.gba", 0x4435A0, 0x20

gUnknown_84435C0::
	.incbin "baserom.gba", 0x4435C0, 0x20

gUnknown_84435E0::
	.incbin "baserom.gba", 0x4435E0, 0x20

gUnknown_8443600:: @ 8443600 4bpp
	.incbin "baserom.gba", 0x443600, 0x20

gUnknown_8443620:: @ 8443620 bin.lz
	.incbin "baserom.gba", 0x443620, 0x2F0

gUnknown_8443910:: @ 8443910
	.incbin "baserom.gba", 0x443910, 0x78

gUnknown_8443988:: @ 8443988
	.incbin "baserom.gba", 0x443988, 0x74

gUnknown_84439FC:: @ 84439FC
	.incbin "baserom.gba", 0x4439FC, 0x7C

gUnknown_8443A78:: @ 8443A78
	.incbin "baserom.gba", 0x443A78, 0x80

gUnknown_8443AF8:: @ 8443AF8
	.incbin "baserom.gba", 0x443AF8, 0xB8

gUnknown_8443BB0:: @ 8443BB0
	.incbin "baserom.gba", 0x443BB0, 0xA4

gUnknown_8443C54:: @ 8443C54
	.incbin "baserom.gba", 0x443C54, 0xAC

gUnknown_8443D00:: @ 8443D00 4bpp
	.incbin "baserom.gba", 0x443D00, 0x2C0

gUnknown_8443FC0:: @ 8443FC0
	.2byte NATIONAL_DEX_OLD_UNOWN_B
	.2byte NATIONAL_DEX_OLD_UNOWN_C
	.2byte NATIONAL_DEX_OLD_UNOWN_D
	.2byte NATIONAL_DEX_OLD_UNOWN_E
	.2byte NATIONAL_DEX_OLD_UNOWN_F
	.2byte NATIONAL_DEX_OLD_UNOWN_G
	.2byte NATIONAL_DEX_OLD_UNOWN_H
	.2byte NATIONAL_DEX_OLD_UNOWN_I
	.2byte NATIONAL_DEX_OLD_UNOWN_J
	.2byte NATIONAL_DEX_OLD_UNOWN_K
	.2byte NATIONAL_DEX_OLD_UNOWN_L
	.2byte NATIONAL_DEX_OLD_UNOWN_M
	.2byte NATIONAL_DEX_OLD_UNOWN_N
	.2byte NATIONAL_DEX_OLD_UNOWN_O
	.2byte NATIONAL_DEX_OLD_UNOWN_P
	.2byte NATIONAL_DEX_OLD_UNOWN_Q
	.2byte NATIONAL_DEX_OLD_UNOWN_R
	.2byte NATIONAL_DEX_OLD_UNOWN_S
	.2byte NATIONAL_DEX_OLD_UNOWN_T
	.2byte NATIONAL_DEX_OLD_UNOWN_U
	.2byte NATIONAL_DEX_OLD_UNOWN_V
	.2byte NATIONAL_DEX_OLD_UNOWN_W
	.2byte NATIONAL_DEX_OLD_UNOWN_X
	.2byte NATIONAL_DEX_OLD_UNOWN_Y
	.2byte NATIONAL_DEX_OLD_UNOWN_Z
	.2byte NATIONAL_DEX_ABRA
	.2byte NATIONAL_DEX_ABSOL
	.2byte NATIONAL_DEX_AERODACTYL
	.2byte NATIONAL_DEX_AGGRON
	.2byte NATIONAL_DEX_AIPOM
	.2byte NATIONAL_DEX_ALAKAZAM
	.2byte NATIONAL_DEX_ALTARIA
	.2byte NATIONAL_DEX_AMPHAROS
	.2byte NATIONAL_DEX_ANORITH
	.2byte NATIONAL_DEX_ARBOK
	.2byte NATIONAL_DEX_ARCANINE
	.2byte NATIONAL_DEX_ARIADOS
	.2byte NATIONAL_DEX_ARMALDO
	.2byte NATIONAL_DEX_ARON
	.2byte NATIONAL_DEX_ARTICUNO
	.2byte NATIONAL_DEX_AZUMARILL
	.2byte NATIONAL_DEX_AZURILL
	.2byte NATIONAL_DEX_BAGON
	.2byte NATIONAL_DEX_BALTOY
	.2byte NATIONAL_DEX_BANETTE
	.2byte NATIONAL_DEX_BARBOACH
	.2byte NATIONAL_DEX_BAYLEEF
	.2byte NATIONAL_DEX_BEAUTIFLY
	.2byte NATIONAL_DEX_BEEDRILL
	.2byte NATIONAL_DEX_BELDUM
	.2byte NATIONAL_DEX_BELLOSSOM
	.2byte NATIONAL_DEX_BELLSPROUT
	.2byte NATIONAL_DEX_BLASTOISE
	.2byte NATIONAL_DEX_BLAZIKEN
	.2byte NATIONAL_DEX_BLISSEY
	.2byte NATIONAL_DEX_BRELOOM
	.2byte NATIONAL_DEX_BULBASAUR
	.2byte NATIONAL_DEX_BUTTERFREE
	.2byte NATIONAL_DEX_CACNEA
	.2byte NATIONAL_DEX_CACTURNE
	.2byte NATIONAL_DEX_CAMERUPT
	.2byte NATIONAL_DEX_CARVANHA
	.2byte NATIONAL_DEX_CASCOON
	.2byte NATIONAL_DEX_CASTFORM
	.2byte NATIONAL_DEX_CATERPIE
	.2byte NATIONAL_DEX_CELEBI
	.2byte NATIONAL_DEX_CHANSEY
	.2byte NATIONAL_DEX_CHARIZARD
	.2byte NATIONAL_DEX_CHARMANDER
	.2byte NATIONAL_DEX_CHARMELEON
	.2byte NATIONAL_DEX_CHIKORITA
	.2byte NATIONAL_DEX_CHIMECHO
	.2byte NATIONAL_DEX_CHINCHOU
	.2byte NATIONAL_DEX_CLAMPERL
	.2byte NATIONAL_DEX_CLAYDOL
	.2byte NATIONAL_DEX_CLEFABLE
	.2byte NATIONAL_DEX_CLEFAIRY
	.2byte NATIONAL_DEX_CLEFFA
	.2byte NATIONAL_DEX_CLOYSTER
	.2byte NATIONAL_DEX_COMBUSKEN
	.2byte NATIONAL_DEX_CORPHISH
	.2byte NATIONAL_DEX_CORSOLA
	.2byte NATIONAL_DEX_CRADILY
	.2byte NATIONAL_DEX_CRAWDAUNT
	.2byte NATIONAL_DEX_CROBAT
	.2byte NATIONAL_DEX_CROCONAW
	.2byte NATIONAL_DEX_CUBONE
	.2byte NATIONAL_DEX_CYNDAQUIL
	.2byte NATIONAL_DEX_DELCATTY
	.2byte NATIONAL_DEX_DELIBIRD
	.2byte NATIONAL_DEX_DEOXYS
	.2byte NATIONAL_DEX_DEWGONG
	.2byte NATIONAL_DEX_DIGLETT
	.2byte NATIONAL_DEX_DITTO
	.2byte NATIONAL_DEX_DODRIO
	.2byte NATIONAL_DEX_DODUO
	.2byte NATIONAL_DEX_DONPHAN
	.2byte NATIONAL_DEX_DRAGONAIR
	.2byte NATIONAL_DEX_DRAGONITE
	.2byte NATIONAL_DEX_DRATINI
	.2byte NATIONAL_DEX_DROWZEE
	.2byte NATIONAL_DEX_DUGTRIO
	.2byte NATIONAL_DEX_DUNSPARCE
	.2byte NATIONAL_DEX_DUSCLOPS
	.2byte NATIONAL_DEX_DUSKULL
	.2byte NATIONAL_DEX_DUSTOX
	.2byte NATIONAL_DEX_EEVEE
	.2byte NATIONAL_DEX_EKANS
	.2byte NATIONAL_DEX_ELECTABUZZ
	.2byte NATIONAL_DEX_ELECTRIKE
	.2byte NATIONAL_DEX_ELECTRODE
	.2byte NATIONAL_DEX_ELEKID
	.2byte NATIONAL_DEX_ENTEI
	.2byte NATIONAL_DEX_ESPEON
	.2byte NATIONAL_DEX_EXEGGCUTE
	.2byte NATIONAL_DEX_EXEGGUTOR
	.2byte NATIONAL_DEX_EXPLOUD
	.2byte NATIONAL_DEX_FARFETCHD
	.2byte NATIONAL_DEX_FEAROW
	.2byte NATIONAL_DEX_FEEBAS
	.2byte NATIONAL_DEX_FERALIGATR
	.2byte NATIONAL_DEX_FLAAFFY
	.2byte NATIONAL_DEX_FLAREON
	.2byte NATIONAL_DEX_FLYGON
	.2byte NATIONAL_DEX_FORRETRESS
	.2byte NATIONAL_DEX_FURRET
	.2byte NATIONAL_DEX_GARDEVOIR
	.2byte NATIONAL_DEX_GASTLY
	.2byte NATIONAL_DEX_GENGAR
	.2byte NATIONAL_DEX_GEODUDE
	.2byte NATIONAL_DEX_GIRAFARIG
	.2byte NATIONAL_DEX_GLALIE
	.2byte NATIONAL_DEX_GLIGAR
	.2byte NATIONAL_DEX_GLOOM
	.2byte NATIONAL_DEX_GOLBAT
	.2byte NATIONAL_DEX_GOLDEEN
	.2byte NATIONAL_DEX_GOLDUCK
	.2byte NATIONAL_DEX_GOLEM
	.2byte NATIONAL_DEX_GOREBYSS
	.2byte NATIONAL_DEX_GRANBULL
	.2byte NATIONAL_DEX_GRAVELER
	.2byte NATIONAL_DEX_GRIMER
	.2byte NATIONAL_DEX_GROUDON
	.2byte NATIONAL_DEX_GROVYLE
	.2byte NATIONAL_DEX_GROWLITHE
	.2byte NATIONAL_DEX_GRUMPIG
	.2byte NATIONAL_DEX_GULPIN
	.2byte NATIONAL_DEX_GYARADOS
	.2byte NATIONAL_DEX_HARIYAMA
	.2byte NATIONAL_DEX_HAUNTER
	.2byte NATIONAL_DEX_HERACROSS
	.2byte NATIONAL_DEX_HITMONCHAN
	.2byte NATIONAL_DEX_HITMONLEE
	.2byte NATIONAL_DEX_HITMONTOP
	.2byte NATIONAL_DEX_HO_OH
	.2byte NATIONAL_DEX_HOOTHOOT
	.2byte NATIONAL_DEX_HOPPIP
	.2byte NATIONAL_DEX_HORSEA
	.2byte NATIONAL_DEX_HOUNDOOM
	.2byte NATIONAL_DEX_HOUNDOUR
	.2byte NATIONAL_DEX_HUNTAIL
	.2byte NATIONAL_DEX_HYPNO
	.2byte NATIONAL_DEX_IGGLYBUFF
	.2byte NATIONAL_DEX_ILLUMISE
	.2byte NATIONAL_DEX_IVYSAUR
	.2byte NATIONAL_DEX_JIGGLYPUFF
	.2byte NATIONAL_DEX_JIRACHI
	.2byte NATIONAL_DEX_JOLTEON
	.2byte NATIONAL_DEX_JUMPLUFF
	.2byte NATIONAL_DEX_JYNX
	.2byte NATIONAL_DEX_KABUTO
	.2byte NATIONAL_DEX_KABUTOPS
	.2byte NATIONAL_DEX_KADABRA
	.2byte NATIONAL_DEX_KAKUNA
	.2byte NATIONAL_DEX_KANGASKHAN
	.2byte NATIONAL_DEX_KECLEON
	.2byte NATIONAL_DEX_KINGDRA
	.2byte NATIONAL_DEX_KINGLER
	.2byte NATIONAL_DEX_KIRLIA
	.2byte NATIONAL_DEX_KOFFING
	.2byte NATIONAL_DEX_KRABBY
	.2byte NATIONAL_DEX_KYOGRE
	.2byte NATIONAL_DEX_LAIRON
	.2byte NATIONAL_DEX_LANTURN
	.2byte NATIONAL_DEX_LAPRAS
	.2byte NATIONAL_DEX_LARVITAR
	.2byte NATIONAL_DEX_LATIAS
	.2byte NATIONAL_DEX_LATIOS
	.2byte NATIONAL_DEX_LEDIAN
	.2byte NATIONAL_DEX_LEDYBA
	.2byte NATIONAL_DEX_LICKITUNG
	.2byte NATIONAL_DEX_LILEEP
	.2byte NATIONAL_DEX_LINOONE
	.2byte NATIONAL_DEX_LOMBRE
	.2byte NATIONAL_DEX_LOTAD
	.2byte NATIONAL_DEX_LOUDRED
	.2byte NATIONAL_DEX_LUDICOLO
	.2byte NATIONAL_DEX_LUGIA
	.2byte NATIONAL_DEX_LUNATONE
	.2byte NATIONAL_DEX_LUVDISC
	.2byte NATIONAL_DEX_MACHAMP
	.2byte NATIONAL_DEX_MACHOKE
	.2byte NATIONAL_DEX_MACHOP
	.2byte NATIONAL_DEX_MAGBY
	.2byte NATIONAL_DEX_MAGCARGO
	.2byte NATIONAL_DEX_MAGIKARP
	.2byte NATIONAL_DEX_MAGMAR
	.2byte NATIONAL_DEX_MAGNEMITE
	.2byte NATIONAL_DEX_MAGNETON
	.2byte NATIONAL_DEX_MAKUHITA
	.2byte NATIONAL_DEX_MANECTRIC
	.2byte NATIONAL_DEX_MANKEY
	.2byte NATIONAL_DEX_MANTINE
	.2byte NATIONAL_DEX_MAREEP
	.2byte NATIONAL_DEX_MARILL
	.2byte NATIONAL_DEX_MAROWAK
	.2byte NATIONAL_DEX_MARSHTOMP
	.2byte NATIONAL_DEX_MASQUERAIN
	.2byte NATIONAL_DEX_MAWILE
	.2byte NATIONAL_DEX_MEDICHAM
	.2byte NATIONAL_DEX_MEDITITE
	.2byte NATIONAL_DEX_MEGANIUM
	.2byte NATIONAL_DEX_MEOWTH
	.2byte NATIONAL_DEX_METAGROSS
	.2byte NATIONAL_DEX_METANG
	.2byte NATIONAL_DEX_METAPOD
	.2byte NATIONAL_DEX_MEW
	.2byte NATIONAL_DEX_MEWTWO
	.2byte NATIONAL_DEX_MIGHTYENA
	.2byte NATIONAL_DEX_MILOTIC
	.2byte NATIONAL_DEX_MILTANK
	.2byte NATIONAL_DEX_MINUN
	.2byte NATIONAL_DEX_MISDREAVUS
	.2byte NATIONAL_DEX_MOLTRES
	.2byte NATIONAL_DEX_MR_MIME
	.2byte NATIONAL_DEX_MUDKIP
	.2byte NATIONAL_DEX_MUK
	.2byte NATIONAL_DEX_MURKROW
	.2byte NATIONAL_DEX_NATU
	.2byte NATIONAL_DEX_NIDOKING
	.2byte NATIONAL_DEX_NIDOQUEEN
	.2byte NATIONAL_DEX_NIDORAN_F
	.2byte NATIONAL_DEX_NIDORAN_M
	.2byte NATIONAL_DEX_NIDORINA
	.2byte NATIONAL_DEX_NIDORINO
	.2byte NATIONAL_DEX_NINCADA
	.2byte NATIONAL_DEX_NINETALES
	.2byte NATIONAL_DEX_NINJASK
	.2byte NATIONAL_DEX_NOCTOWL
	.2byte NATIONAL_DEX_NOSEPASS
	.2byte NATIONAL_DEX_NUMEL
	.2byte NATIONAL_DEX_NUZLEAF
	.2byte NATIONAL_DEX_OCTILLERY
	.2byte NATIONAL_DEX_ODDISH
	.2byte NATIONAL_DEX_OMANYTE
	.2byte NATIONAL_DEX_OMASTAR
	.2byte NATIONAL_DEX_ONIX
	.2byte NATIONAL_DEX_PARAS
	.2byte NATIONAL_DEX_PARASECT
	.2byte NATIONAL_DEX_PELIPPER
	.2byte NATIONAL_DEX_PERSIAN
	.2byte NATIONAL_DEX_PHANPY
	.2byte NATIONAL_DEX_PICHU
	.2byte NATIONAL_DEX_PIDGEOT
	.2byte NATIONAL_DEX_PIDGEOTTO
	.2byte NATIONAL_DEX_PIDGEY
	.2byte NATIONAL_DEX_PIKACHU
	.2byte NATIONAL_DEX_PILOSWINE
	.2byte NATIONAL_DEX_PINECO
	.2byte NATIONAL_DEX_PINSIR
	.2byte NATIONAL_DEX_PLUSLE
	.2byte NATIONAL_DEX_POLITOED
	.2byte NATIONAL_DEX_POLIWAG
	.2byte NATIONAL_DEX_POLIWHIRL
	.2byte NATIONAL_DEX_POLIWRATH
	.2byte NATIONAL_DEX_PONYTA
	.2byte NATIONAL_DEX_POOCHYENA
	.2byte NATIONAL_DEX_PORYGON
	.2byte NATIONAL_DEX_PORYGON2
	.2byte NATIONAL_DEX_PRIMEAPE
	.2byte NATIONAL_DEX_PSYDUCK
	.2byte NATIONAL_DEX_PUPITAR
	.2byte NATIONAL_DEX_QUAGSIRE
	.2byte NATIONAL_DEX_QUILAVA
	.2byte NATIONAL_DEX_QWILFISH
	.2byte NATIONAL_DEX_RAICHU
	.2byte NATIONAL_DEX_RAIKOU
	.2byte NATIONAL_DEX_RALTS
	.2byte NATIONAL_DEX_RAPIDASH
	.2byte NATIONAL_DEX_RATICATE
	.2byte NATIONAL_DEX_RATTATA
	.2byte NATIONAL_DEX_RAYQUAZA
	.2byte NATIONAL_DEX_REGICE
	.2byte NATIONAL_DEX_REGIROCK
	.2byte NATIONAL_DEX_REGISTEEL
	.2byte NATIONAL_DEX_RELICANTH
	.2byte NATIONAL_DEX_REMORAID
	.2byte NATIONAL_DEX_RHYDON
	.2byte NATIONAL_DEX_RHYHORN
	.2byte NATIONAL_DEX_ROSELIA
	.2byte NATIONAL_DEX_SABLEYE
	.2byte NATIONAL_DEX_SALAMENCE
	.2byte NATIONAL_DEX_SANDSHREW
	.2byte NATIONAL_DEX_SANDSLASH
	.2byte NATIONAL_DEX_SCEPTILE
	.2byte NATIONAL_DEX_SCIZOR
	.2byte NATIONAL_DEX_SCYTHER
	.2byte NATIONAL_DEX_SEADRA
	.2byte NATIONAL_DEX_SEAKING
	.2byte NATIONAL_DEX_SEALEO
	.2byte NATIONAL_DEX_SEEDOT
	.2byte NATIONAL_DEX_SEEL
	.2byte NATIONAL_DEX_SENTRET
	.2byte NATIONAL_DEX_SEVIPER
	.2byte NATIONAL_DEX_SHARPEDO
	.2byte NATIONAL_DEX_SHEDINJA
	.2byte NATIONAL_DEX_SHELGON
	.2byte NATIONAL_DEX_SHELLDER
	.2byte NATIONAL_DEX_SHIFTRY
	.2byte NATIONAL_DEX_SHROOMISH
	.2byte NATIONAL_DEX_SHUCKLE
	.2byte NATIONAL_DEX_SHUPPET
	.2byte NATIONAL_DEX_SILCOON
	.2byte NATIONAL_DEX_SKARMORY
	.2byte NATIONAL_DEX_SKIPLOOM
	.2byte NATIONAL_DEX_SKITTY
	.2byte NATIONAL_DEX_SLAKING
	.2byte NATIONAL_DEX_SLAKOTH
	.2byte NATIONAL_DEX_SLOWBRO
	.2byte NATIONAL_DEX_SLOWKING
	.2byte NATIONAL_DEX_SLOWPOKE
	.2byte NATIONAL_DEX_SLUGMA
	.2byte NATIONAL_DEX_SMEARGLE
	.2byte NATIONAL_DEX_SMOOCHUM
	.2byte NATIONAL_DEX_SNEASEL
	.2byte NATIONAL_DEX_SNORLAX
	.2byte NATIONAL_DEX_SNORUNT
	.2byte NATIONAL_DEX_SNUBBULL
	.2byte NATIONAL_DEX_SOLROCK
	.2byte NATIONAL_DEX_SPEAROW
	.2byte NATIONAL_DEX_SPHEAL
	.2byte NATIONAL_DEX_SPINARAK
	.2byte NATIONAL_DEX_SPINDA
	.2byte NATIONAL_DEX_SPOINK
	.2byte NATIONAL_DEX_SQUIRTLE
	.2byte NATIONAL_DEX_STANTLER
	.2byte NATIONAL_DEX_STARMIE
	.2byte NATIONAL_DEX_STARYU
	.2byte NATIONAL_DEX_STEELIX
	.2byte NATIONAL_DEX_SUDOWOODO
	.2byte NATIONAL_DEX_SUICUNE
	.2byte NATIONAL_DEX_SUNFLORA
	.2byte NATIONAL_DEX_SUNKERN
	.2byte NATIONAL_DEX_SURSKIT
	.2byte NATIONAL_DEX_SWABLU
	.2byte NATIONAL_DEX_SWALOT
	.2byte NATIONAL_DEX_SWAMPERT
	.2byte NATIONAL_DEX_SWELLOW
	.2byte NATIONAL_DEX_SWINUB
	.2byte NATIONAL_DEX_TAILLOW
	.2byte NATIONAL_DEX_TANGELA
	.2byte NATIONAL_DEX_TAUROS
	.2byte NATIONAL_DEX_TEDDIURSA
	.2byte NATIONAL_DEX_TENTACOOL
	.2byte NATIONAL_DEX_TENTACRUEL
	.2byte NATIONAL_DEX_TOGEPI
	.2byte NATIONAL_DEX_TOGETIC
	.2byte NATIONAL_DEX_TORCHIC
	.2byte NATIONAL_DEX_TORKOAL
	.2byte NATIONAL_DEX_TOTODILE
	.2byte NATIONAL_DEX_TRAPINCH
	.2byte NATIONAL_DEX_TREECKO
	.2byte NATIONAL_DEX_TROPIUS
	.2byte NATIONAL_DEX_TYPHLOSION
	.2byte NATIONAL_DEX_TYRANITAR
	.2byte NATIONAL_DEX_TYROGUE
	.2byte NATIONAL_DEX_UMBREON
	.2byte NATIONAL_DEX_UNOWN
	.2byte NATIONAL_DEX_URSARING
	.2byte NATIONAL_DEX_VAPOREON
	.2byte NATIONAL_DEX_VENOMOTH
	.2byte NATIONAL_DEX_VENONAT
	.2byte NATIONAL_DEX_VENUSAUR
	.2byte NATIONAL_DEX_VIBRAVA
	.2byte NATIONAL_DEX_VICTREEBEL
	.2byte NATIONAL_DEX_VIGOROTH
	.2byte NATIONAL_DEX_VILEPLUME
	.2byte NATIONAL_DEX_VOLBEAT
	.2byte NATIONAL_DEX_VOLTORB
	.2byte NATIONAL_DEX_VULPIX
	.2byte NATIONAL_DEX_WAILMER
	.2byte NATIONAL_DEX_WAILORD
	.2byte NATIONAL_DEX_WALREIN
	.2byte NATIONAL_DEX_WARTORTLE
	.2byte NATIONAL_DEX_WEEDLE
	.2byte NATIONAL_DEX_WEEPINBELL
	.2byte NATIONAL_DEX_WEEZING
	.2byte NATIONAL_DEX_WHISCASH
	.2byte NATIONAL_DEX_WHISMUR
	.2byte NATIONAL_DEX_WIGGLYTUFF
	.2byte NATIONAL_DEX_WINGULL
	.2byte NATIONAL_DEX_WOBBUFFET
	.2byte NATIONAL_DEX_WOOPER
	.2byte NATIONAL_DEX_WURMPLE
	.2byte NATIONAL_DEX_WYNAUT
	.2byte NATIONAL_DEX_XATU
	.2byte NATIONAL_DEX_YANMA
	.2byte NATIONAL_DEX_ZANGOOSE
	.2byte NATIONAL_DEX_ZAPDOS
	.2byte NATIONAL_DEX_ZIGZAGOON
	.2byte NATIONAL_DEX_ZUBAT

gUnknown_84442F6:: @ 84442F6
	.2byte NATIONAL_DEX_GASTLY
	.2byte NATIONAL_DEX_HAUNTER
	.2byte NATIONAL_DEX_HOPPIP
	.2byte NATIONAL_DEX_DIGLETT
	.2byte NATIONAL_DEX_CASTFORM
	.2byte NATIONAL_DEX_KOFFING
	.2byte NATIONAL_DEX_IGGLYBUFF
	.2byte NATIONAL_DEX_MISDREAVUS
	.2byte NATIONAL_DEX_CHIMECHO
	.2byte NATIONAL_DEX_SKIPLOOM
	.2byte NATIONAL_DEX_JIRACHI
	.2byte NATIONAL_DEX_SWABLU
	.2byte NATIONAL_DEX_SHEDINJA
	.2byte NATIONAL_DEX_TOGEPI
	.2byte NATIONAL_DEX_SURSKIT
	.2byte NATIONAL_DEX_PIDGEY
	.2byte NATIONAL_DEX_SUNKERN
	.2byte NATIONAL_DEX_BARBOACH
	.2byte NATIONAL_DEX_PICHU
	.2byte NATIONAL_DEX_AZURILL
	.2byte NATIONAL_DEX_ROSELIA
	.2byte NATIONAL_DEX_NATU
	.2byte NATIONAL_DEX_SPEAROW
	.2byte NATIONAL_DEX_MURKROW
	.2byte NATIONAL_DEX_SHUPPET
	.2byte NATIONAL_DEX_TAILLOW
	.2byte NATIONAL_DEX_EXEGGCUTE
	.2byte NATIONAL_DEX_TORCHIC
	.2byte NATIONAL_DEX_LOTAD
	.2byte NATIONAL_DEX_CATERPIE
	.2byte NATIONAL_DEX_JUMPLUFF
	.2byte NATIONAL_DEX_CLEFFA
	.2byte NATIONAL_DEX_WEEDLE
	.2byte NATIONAL_DEX_TOGETIC
	.2byte NATIONAL_DEX_DRATINI
	.2byte NATIONAL_DEX_RATTATA
	.2byte NATIONAL_DEX_MASQUERAIN
	.2byte NATIONAL_DEX_WURMPLE
	.2byte NATIONAL_DEX_QWILFISH
	.2byte NATIONAL_DEX_MEW
	.2byte NATIONAL_DEX_SHELLDER
	.2byte NATIONAL_DEX_SEEDOT
	.2byte NATIONAL_DEX_DITTO
	.2byte NATIONAL_DEX_BELLSPROUT
	.2byte NATIONAL_DEX_PLUSLE
	.2byte NATIONAL_DEX_MEOWTH
	.2byte NATIONAL_DEX_MINUN
	.2byte NATIONAL_DEX_SHROOMISH
	.2byte NATIONAL_DEX_CELEBI
	.2byte NATIONAL_DEX_CORSOLA
	.2byte NATIONAL_DEX_TREECKO
	.2byte NATIONAL_DEX_SPINDA
	.2byte NATIONAL_DEX_UNOWN
	.2byte NATIONAL_DEX_PARAS
	.2byte NATIONAL_DEX_ODDISH
	.2byte NATIONAL_DEX_JIGGLYPUFF
	.2byte NATIONAL_DEX_NINCADA
	.2byte NATIONAL_DEX_BELLOSSOM
	.2byte NATIONAL_DEX_MAGNEMITE
	.2byte NATIONAL_DEX_PIKACHU
	.2byte NATIONAL_DEX_SMOOCHUM
	.2byte NATIONAL_DEX_SENTRET
	.2byte NATIONAL_DEX_WEEPINBELL
	.2byte NATIONAL_DEX_CHIKORITA
	.2byte NATIONAL_DEX_SWINUB
	.2byte NATIONAL_DEX_EEVEE
	.2byte NATIONAL_DEX_KRABBY
	.2byte NATIONAL_DEX_CUBONE
	.2byte NATIONAL_DEX_RALTS
	.2byte NATIONAL_DEX_BULBASAUR
	.2byte NATIONAL_DEX_EKANS
	.2byte NATIONAL_DEX_NIDORAN_F
	.2byte NATIONAL_DEX_PINECO
	.2byte NATIONAL_DEX_FEEBAS
	.2byte NATIONAL_DEX_OMANYTE
	.2byte NATIONAL_DEX_ZUBAT
	.2byte NATIONAL_DEX_CLEFAIRY
	.2byte NATIONAL_DEX_MUDKIP
	.2byte NATIONAL_DEX_SNUBBULL
	.2byte NATIONAL_DEX_MAREEP
	.2byte NATIONAL_DEX_CYNDAQUIL
	.2byte NATIONAL_DEX_HORSEA
	.2byte NATIONAL_DEX_CHARMANDER
	.2byte NATIONAL_DEX_SUNFLORA
	.2byte NATIONAL_DEX_MARILL
	.2byte NATIONAL_DEX_WOOPER
	.2byte NATIONAL_DEX_SPINARAK
	.2byte NATIONAL_DEX_GLOOM
	.2byte NATIONAL_DEX_LUVDISC
	.2byte NATIONAL_DEX_TEDDIURSA
	.2byte NATIONAL_DEX_NIDORAN_M
	.2byte NATIONAL_DEX_SQUIRTLE
	.2byte NATIONAL_DEX_WINGULL
	.2byte NATIONAL_DEX_TOTODILE
	.2byte NATIONAL_DEX_WEEZING
	.2byte NATIONAL_DEX_VULPIX
	.2byte NATIONAL_DEX_METAPOD
	.2byte NATIONAL_DEX_SILCOON
	.2byte NATIONAL_DEX_MAGIKARP
	.2byte NATIONAL_DEX_KAKUNA
	.2byte NATIONAL_DEX_GULPIN
	.2byte NATIONAL_DEX_VOLTORB
	.2byte NATIONAL_DEX_LEDYBA
	.2byte NATIONAL_DEX_HOUNDOUR
	.2byte NATIONAL_DEX_SKITTY
	.2byte NATIONAL_DEX_SABLEYE
	.2byte NATIONAL_DEX_MEDITITE
	.2byte NATIONAL_DEX_CORPHISH
	.2byte NATIONAL_DEX_AIPOM
	.2byte NATIONAL_DEX_CASCOON
	.2byte NATIONAL_DEX_MAWILE
	.2byte NATIONAL_DEX_KABUTO
	.2byte NATIONAL_DEX_WIGGLYTUFF
	.2byte NATIONAL_DEX_SANDSHREW
	.2byte NATIONAL_DEX_REMORAID
	.2byte NATIONAL_DEX_NINJASK
	.2byte NATIONAL_DEX_CHINCHOU
	.2byte NATIONAL_DEX_POLIWAG
	.2byte NATIONAL_DEX_ANORITH
	.2byte NATIONAL_DEX_VENOMOTH
	.2byte NATIONAL_DEX_BANETTE
	.2byte NATIONAL_DEX_IVYSAUR
	.2byte NATIONAL_DEX_FLAAFFY
	.2byte NATIONAL_DEX_POOCHYENA
	.2byte NATIONAL_DEX_WYNAUT
	.2byte NATIONAL_DEX_DUNSPARCE
	.2byte NATIONAL_DEX_XATU
	.2byte NATIONAL_DEX_DUSKULL
	.2byte NATIONAL_DEX_FARFETCHD
	.2byte NATIONAL_DEX_TRAPINCH
	.2byte NATIONAL_DEX_GOLDEEN
	.2byte NATIONAL_DEX_ELECTRIKE
	.2byte NATIONAL_DEX_VIBRAVA
	.2byte NATIONAL_DEX_VICTREEBEL
	.2byte NATIONAL_DEX_BAYLEEF
	.2byte NATIONAL_DEX_DELIBIRD
	.2byte NATIONAL_DEX_WHISMUR
	.2byte NATIONAL_DEX_DRAGONAIR
	.2byte NATIONAL_DEX_SNORUNT
	.2byte NATIONAL_DEX_ZIGZAGOON
	.2byte NATIONAL_DEX_ILLUMISE
	.2byte NATIONAL_DEX_VOLBEAT
	.2byte NATIONAL_DEX_RATICATE
	.2byte NATIONAL_DEX_VILEPLUME
	.2byte NATIONAL_DEX_QUILAVA
	.2byte NATIONAL_DEX_CHARMELEON
	.2byte NATIONAL_DEX_GROWLITHE
	.2byte NATIONAL_DEX_COMBUSKEN
	.2byte NATIONAL_DEX_MACHOP
	.2byte NATIONAL_DEX_ABRA
	.2byte NATIONAL_DEX_NIDORINO
	.2byte NATIONAL_DEX_PSYDUCK
	.2byte NATIONAL_DEX_SWELLOW
	.2byte NATIONAL_DEX_NINETALES
	.2byte NATIONAL_DEX_NIDORINA
	.2byte NATIONAL_DEX_POLIWHIRL
	.2byte NATIONAL_DEX_GEODUDE
	.2byte NATIONAL_DEX_KIRLIA
	.2byte NATIONAL_DEX_SHUCKLE
	.2byte NATIONAL_DEX_ALTARIA
	.2byte NATIONAL_DEX_CARVANHA
	.2byte NATIONAL_DEX_TYROGUE
	.2byte NATIONAL_DEX_HOOTHOOT
	.2byte NATIONAL_DEX_MAGBY
	.2byte NATIONAL_DEX_BALTOY
	.2byte NATIONAL_DEX_GROVYLE
	.2byte NATIONAL_DEX_KECLEON
	.2byte NATIONAL_DEX_LANTURN
	.2byte NATIONAL_DEX_WARTORTLE
	.2byte NATIONAL_DEX_GOREBYSS
	.2byte NATIONAL_DEX_RELICANTH
	.2byte NATIONAL_DEX_ELEKID
	.2byte NATIONAL_DEX_WHISCASH
	.2byte NATIONAL_DEX_LILEEP
	.2byte NATIONAL_DEX_NUMEL
	.2byte NATIONAL_DEX_SLAKOTH
	.2byte NATIONAL_DEX_JOLTEON
	.2byte NATIONAL_DEX_CROCONAW
	.2byte NATIONAL_DEX_FLAREON
	.2byte NATIONAL_DEX_SEADRA
	.2byte NATIONAL_DEX_ESPEON
	.2byte NATIONAL_DEX_HUNTAIL
	.2byte NATIONAL_DEX_UMBREON
	.2byte NATIONAL_DEX_MARSHTOMP
	.2byte NATIONAL_DEX_NUZLEAF
	.2byte NATIONAL_DEX_SNEASEL
	.2byte NATIONAL_DEX_MANKEY
	.2byte NATIONAL_DEX_PELIPPER
	.2byte NATIONAL_DEX_BEAUTIFLY
	.2byte NATIONAL_DEX_OCTILLERY
	.2byte NATIONAL_DEX_AZUMARILL
	.2byte NATIONAL_DEX_WOBBUFFET
	.2byte NATIONAL_DEX_VAPOREON
	.2byte NATIONAL_DEX_SANDSLASH
	.2byte NATIONAL_DEX_PARASECT
	.2byte NATIONAL_DEX_BEEDRILL
	.2byte NATIONAL_DEX_MUK
	.2byte NATIONAL_DEX_PIDGEOTTO
	.2byte NATIONAL_DEX_GRIMER
	.2byte NATIONAL_DEX_RAICHU
	.2byte NATIONAL_DEX_PONYTA
	.2byte NATIONAL_DEX_ELECTABUZZ
	.2byte NATIONAL_DEX_VENONAT
	.2byte NATIONAL_DEX_SPOINK
	.2byte NATIONAL_DEX_DUSCLOPS
	.2byte NATIONAL_DEX_MEDICHAM
	.2byte NATIONAL_DEX_DUSTOX
	.2byte NATIONAL_DEX_PERSIAN
	.2byte NATIONAL_DEX_BUTTERFREE
	.2byte NATIONAL_DEX_PRIMEAPE
	.2byte NATIONAL_DEX_DROWZEE
	.2byte NATIONAL_DEX_FURRET
	.2byte NATIONAL_DEX_PORYGON2
	.2byte NATIONAL_DEX_LOMBRE
	.2byte NATIONAL_DEX_LINOONE
	.2byte NATIONAL_DEX_DELCATTY
	.2byte NATIONAL_DEX_CRAWDAUNT
	.2byte NATIONAL_DEX_DUGTRIO
	.2byte NATIONAL_DEX_ARIADOS
	.2byte NATIONAL_DEX_PHANPY
	.2byte NATIONAL_DEX_POLITOED
	.2byte NATIONAL_DEX_STARYU
	.2byte NATIONAL_DEX_CHANSEY
	.2byte NATIONAL_DEX_OMASTAR
	.2byte NATIONAL_DEX_TANGELA
	.2byte NATIONAL_DEX_SLUGMA
	.2byte NATIONAL_DEX_HOUNDOOM
	.2byte NATIONAL_DEX_LEDIAN
	.2byte NATIONAL_DEX_SLOWPOKE
	.2byte NATIONAL_DEX_PORYGON
	.2byte NATIONAL_DEX_MIGHTYENA
	.2byte NATIONAL_DEX_YANMA
	.2byte NATIONAL_DEX_FEAROW
	.2byte NATIONAL_DEX_SUDOWOODO
	.2byte NATIONAL_DEX_SEAKING
	.2byte NATIONAL_DEX_BRELOOM
	.2byte NATIONAL_DEX_DODUO
	.2byte NATIONAL_DEX_PIDGEOT
	.2byte NATIONAL_DEX_SPHEAL
	.2byte NATIONAL_DEX_CLEFABLE
	.2byte NATIONAL_DEX_LATIAS
	.2byte NATIONAL_DEX_MANECTRIC
	.2byte NATIONAL_DEX_ZANGOOSE
	.2byte NATIONAL_DEX_KABUTOPS
	.2byte NATIONAL_DEX_GENGAR
	.2byte NATIONAL_DEX_LOUDRED
	.2byte NATIONAL_DEX_JYNX
	.2byte NATIONAL_DEX_NOCTOWL
	.2byte NATIONAL_DEX_GIRAFARIG
	.2byte NATIONAL_DEX_BAGON
	.2byte NATIONAL_DEX_MAGMAR
	.2byte NATIONAL_DEX_MAROWAK
	.2byte NATIONAL_DEX_TENTACOOL
	.2byte NATIONAL_DEX_VIGOROTH
	.2byte NATIONAL_DEX_BLISSEY
	.2byte NATIONAL_DEX_ABSOL
	.2byte NATIONAL_DEX_ALAKAZAM
	.2byte NATIONAL_DEX_HITMONTOP
	.2byte NATIONAL_DEX_GARDEVOIR
	.2byte NATIONAL_DEX_GRANBULL
	.2byte NATIONAL_DEX_HITMONLEE
	.2byte NATIONAL_DEX_HITMONCHAN
	.2byte NATIONAL_DEX_SKARMORY
	.2byte NATIONAL_DEX_CACNEA
	.2byte NATIONAL_DEX_BLAZIKEN
	.2byte NATIONAL_DEX_SCEPTILE
	.2byte NATIONAL_DEX_SEVIPER
	.2byte NATIONAL_DEX_CLAMPERL
	.2byte NATIONAL_DEX_ZAPDOS
	.2byte NATIONAL_DEX_HERACROSS
	.2byte NATIONAL_DEX_POLIWRATH
	.2byte NATIONAL_DEX_MR_MIME
	.2byte NATIONAL_DEX_PINSIR
	.2byte NATIONAL_DEX_LUDICOLO
	.2byte NATIONAL_DEX_TENTACRUEL
	.2byte NATIONAL_DEX_GOLBAT
	.2byte NATIONAL_DEX_MAGCARGO
	.2byte NATIONAL_DEX_ARTICUNO
	.2byte NATIONAL_DEX_PILOSWINE
	.2byte NATIONAL_DEX_SCYTHER
	.2byte NATIONAL_DEX_KADABRA
	.2byte NATIONAL_DEX_SMEARGLE
	.2byte NATIONAL_DEX_AERODACTYL
	.2byte NATIONAL_DEX_SHIFTRY
	.2byte NATIONAL_DEX_KINGLER
	.2byte NATIONAL_DEX_NIDOQUEEN
	.2byte NATIONAL_DEX_MAGNETON
	.2byte NATIONAL_DEX_ARON
	.2byte NATIONAL_DEX_LATIOS
	.2byte NATIONAL_DEX_MOLTRES
	.2byte NATIONAL_DEX_CRADILY
	.2byte NATIONAL_DEX_DEOXYS
	.2byte NATIONAL_DEX_AMPHAROS
	.2byte NATIONAL_DEX_NIDOKING
	.2byte NATIONAL_DEX_GLIGAR
	.2byte NATIONAL_DEX_ARBOK
	.2byte NATIONAL_DEX_LICKITUNG
	.2byte NATIONAL_DEX_ELECTRODE
	.2byte NATIONAL_DEX_ARMALDO
	.2byte NATIONAL_DEX_MACHOKE
	.2byte NATIONAL_DEX_STANTLER
	.2byte NATIONAL_DEX_GRUMPIG
	.2byte NATIONAL_DEX_LARVITAR
	.2byte NATIONAL_DEX_CROBAT
	.2byte NATIONAL_DEX_QUAGSIRE
	.2byte NATIONAL_DEX_MILTANK
	.2byte NATIONAL_DEX_HYPNO
	.2byte NATIONAL_DEX_GOLDUCK
	.2byte NATIONAL_DEX_CACTURNE
	.2byte NATIONAL_DEX_SLOWBRO
	.2byte NATIONAL_DEX_TYPHLOSION
	.2byte NATIONAL_DEX_SLOWKING
	.2byte NATIONAL_DEX_KANGASKHAN
	.2byte NATIONAL_DEX_STARMIE
	.2byte NATIONAL_DEX_SWALOT
	.2byte NATIONAL_DEX_TORKOAL
	.2byte NATIONAL_DEX_SWAMPERT
	.2byte NATIONAL_DEX_FLYGON
	.2byte NATIONAL_DEX_EXPLOUD
	.2byte NATIONAL_DEX_DODRIO
	.2byte NATIONAL_DEX_BLASTOISE
	.2byte NATIONAL_DEX_MAKUHITA
	.2byte NATIONAL_DEX_SEALEO
	.2byte NATIONAL_DEX_TAUROS
	.2byte NATIONAL_DEX_SHARPEDO
	.2byte NATIONAL_DEX_FERALIGATR
	.2byte NATIONAL_DEX_SEEL
	.2byte NATIONAL_DEX_CHARIZARD
	.2byte NATIONAL_DEX_RAPIDASH
	.2byte NATIONAL_DEX_BELDUM
	.2byte NATIONAL_DEX_NOSEPASS
	.2byte NATIONAL_DEX_VENUSAUR
	.2byte NATIONAL_DEX_TROPIUS
	.2byte NATIONAL_DEX_MEGANIUM
	.2byte NATIONAL_DEX_SALAMENCE
	.2byte NATIONAL_DEX_GRAVELER
	.2byte NATIONAL_DEX_CLAYDOL
	.2byte NATIONAL_DEX_SHELGON
	.2byte NATIONAL_DEX_RHYHORN
	.2byte NATIONAL_DEX_SCIZOR
	.2byte NATIONAL_DEX_DEWGONG
	.2byte NATIONAL_DEX_RHYDON
	.2byte NATIONAL_DEX_DONPHAN
	.2byte NATIONAL_DEX_EXEGGUTOR
	.2byte NATIONAL_DEX_LAIRON
	.2byte NATIONAL_DEX_MEWTWO
	.2byte NATIONAL_DEX_URSARING
	.2byte NATIONAL_DEX_FORRETRESS
	.2byte NATIONAL_DEX_MACHAMP
	.2byte NATIONAL_DEX_WAILMER
	.2byte NATIONAL_DEX_SLAKING
	.2byte NATIONAL_DEX_CLOYSTER
	.2byte NATIONAL_DEX_WALREIN
	.2byte NATIONAL_DEX_PUPITAR
	.2byte NATIONAL_DEX_KINGDRA
	.2byte NATIONAL_DEX_SOLROCK
	.2byte NATIONAL_DEX_ARCANINE
	.2byte NATIONAL_DEX_MILOTIC
	.2byte NATIONAL_DEX_LUNATONE
	.2byte NATIONAL_DEX_REGICE
	.2byte NATIONAL_DEX_RAIKOU
	.2byte NATIONAL_DEX_SUICUNE
	.2byte NATIONAL_DEX_ENTEI
	.2byte NATIONAL_DEX_HO_OH
	.2byte NATIONAL_DEX_TYRANITAR
	.2byte NATIONAL_DEX_METANG
	.2byte NATIONAL_DEX_REGISTEEL
	.2byte NATIONAL_DEX_RAYQUAZA
	.2byte NATIONAL_DEX_ONIX
	.2byte NATIONAL_DEX_DRAGONITE
	.2byte NATIONAL_DEX_LUGIA
	.2byte NATIONAL_DEX_LAPRAS
	.2byte NATIONAL_DEX_CAMERUPT
	.2byte NATIONAL_DEX_MANTINE
	.2byte NATIONAL_DEX_REGIROCK
	.2byte NATIONAL_DEX_GYARADOS
	.2byte NATIONAL_DEX_HARIYAMA
	.2byte NATIONAL_DEX_GLALIE
	.2byte NATIONAL_DEX_GOLEM
	.2byte NATIONAL_DEX_KYOGRE
	.2byte NATIONAL_DEX_AGGRON
	.2byte NATIONAL_DEX_WAILORD
	.2byte NATIONAL_DEX_STEELIX
	.2byte NATIONAL_DEX_SNORLAX
	.2byte NATIONAL_DEX_METAGROSS
	.2byte NATIONAL_DEX_GROUDON

gUnknown_84445FA:: @ 84445FA
	.2byte NATIONAL_DEX_DIGLETT
	.2byte NATIONAL_DEX_AZURILL
	.2byte NATIONAL_DEX_NATU
	.2byte NATIONAL_DEX_WEEDLE
	.2byte NATIONAL_DEX_PICHU
	.2byte NATIONAL_DEX_CLEFFA
	.2byte NATIONAL_DEX_TOGEPI
	.2byte NATIONAL_DEX_CASTFORM
	.2byte NATIONAL_DEX_IGGLYBUFF
	.2byte NATIONAL_DEX_CATERPIE
	.2byte NATIONAL_DEX_TAILLOW
	.2byte NATIONAL_DEX_DITTO
	.2byte NATIONAL_DEX_EEVEE
	.2byte NATIONAL_DEX_ROSELIA
	.2byte NATIONAL_DEX_SPEAROW
	.2byte NATIONAL_DEX_PIDGEY
	.2byte NATIONAL_DEX_SUNKERN
	.2byte NATIONAL_DEX_SHELLDER
	.2byte NATIONAL_DEX_RATTATA
	.2byte NATIONAL_DEX_MAGNEMITE
	.2byte NATIONAL_DEX_PARAS
	.2byte NATIONAL_DEX_WURMPLE
	.2byte NATIONAL_DEX_JIRACHI
	.2byte NATIONAL_DEX_CUBONE
	.2byte NATIONAL_DEX_MUDKIP
	.2byte NATIONAL_DEX_WOOPER
	.2byte NATIONAL_DEX_HORSEA
	.2byte NATIONAL_DEX_MEOWTH
	.2byte NATIONAL_DEX_NIDORAN_F
	.2byte NATIONAL_DEX_SWINUB
	.2byte NATIONAL_DEX_MEW
	.2byte NATIONAL_DEX_SWABLU
	.2byte NATIONAL_DEX_ARON
	.2byte NATIONAL_DEX_PLUSLE
	.2byte NATIONAL_DEX_MINUN
	.2byte NATIONAL_DEX_EXEGGCUTE
	.2byte NATIONAL_DEX_PIKACHU
	.2byte NATIONAL_DEX_BELLOSSOM
	.2byte NATIONAL_DEX_GULPIN
	.2byte NATIONAL_DEX_ZIGZAGOON
	.2byte NATIONAL_DEX_SHROOMISH
	.2byte NATIONAL_DEX_OMANYTE
	.2byte NATIONAL_DEX_CACNEA
	.2byte NATIONAL_DEX_KRABBY
	.2byte NATIONAL_DEX_RALTS
	.2byte NATIONAL_DEX_HOPPIP
	.2byte NATIONAL_DEX_TORCHIC
	.2byte NATIONAL_DEX_CLAMPERL
	.2byte NATIONAL_DEX_GEODUDE
	.2byte NATIONAL_DEX_MARILL
	.2byte NATIONAL_DEX_BARBOACH
	.2byte NATIONAL_DEX_SMOOCHUM
	.2byte NATIONAL_DEX_VOLTORB
	.2byte NATIONAL_DEX_NINCADA
	.2byte NATIONAL_DEX_SABLEYE
	.2byte NATIONAL_DEX_MURKROW
	.2byte NATIONAL_DEX_QWILFISH
	.2byte NATIONAL_DEX_SQUIRTLE
	.2byte NATIONAL_DEX_TREECKO
	.2byte NATIONAL_DEX_BALTOY
	.2byte NATIONAL_DEX_ODDISH
	.2byte NATIONAL_DEX_LOTAD
	.2byte NATIONAL_DEX_JIGGLYPUFF
	.2byte NATIONAL_DEX_SURSKIT
	.2byte NATIONAL_DEX_CYNDAQUIL
	.2byte NATIONAL_DEX_KABUTO
	.2byte NATIONAL_DEX_LINOONE
	.2byte NATIONAL_DEX_TORKOAL
	.2byte NATIONAL_DEX_NIDORAN_M
	.2byte NATIONAL_DEX_SPINARAK
	.2byte NATIONAL_DEX_MANKEY
	.2byte NATIONAL_DEX_SEEDOT
	.2byte NATIONAL_DEX_POOCHYENA
	.2byte NATIONAL_DEX_PHANPY
	.2byte NATIONAL_DEX_UNOWN
	.2byte NATIONAL_DEX_CHINCHOU
	.2byte NATIONAL_DEX_PORYGON2
	.2byte NATIONAL_DEX_POLIWAG
	.2byte NATIONAL_DEX_BAGON
	.2byte NATIONAL_DEX_FEEBAS
	.2byte NATIONAL_DEX_SHUPPET
	.2byte NATIONAL_DEX_TOTODILE
	.2byte NATIONAL_DEX_CELEBI
	.2byte NATIONAL_DEX_WYNAUT
	.2byte NATIONAL_DEX_SANDSHREW
	.2byte NATIONAL_DEX_CHIMECHO
	.2byte NATIONAL_DEX_LUVDISC
	.2byte NATIONAL_DEX_HOUNDOUR
	.2byte NATIONAL_DEX_SILCOON
	.2byte NATIONAL_DEX_ELECTRIKE
	.2byte NATIONAL_DEX_CHARMANDER
	.2byte NATIONAL_DEX_MEDITITE
	.2byte NATIONAL_DEX_WINGULL
	.2byte NATIONAL_DEX_REMORAID
	.2byte NATIONAL_DEX_CORPHISH
	.2byte NATIONAL_DEX_CORSOLA
	.2byte NATIONAL_DEX_ILLUMISE
	.2byte NATIONAL_DEX_SNUBBULL
	.2byte NATIONAL_DEX_VULPIX
	.2byte NATIONAL_DEX_LARVITAR
	.2byte NATIONAL_DEX_BELDUM
	.2byte NATIONAL_DEX_WHISMUR
	.2byte NATIONAL_DEX_PINECO
	.2byte NATIONAL_DEX_ELEKID
	.2byte NATIONAL_DEX_CLEFAIRY
	.2byte NATIONAL_DEX_SHUCKLE
	.2byte NATIONAL_DEX_TEDDIURSA
	.2byte NATIONAL_DEX_KAKUNA
	.2byte NATIONAL_DEX_SKITTY
	.2byte NATIONAL_DEX_TOGETIC
	.2byte NATIONAL_DEX_GOLDEEN
	.2byte NATIONAL_DEX_MAWILE
	.2byte NATIONAL_DEX_MAREEP
	.2byte NATIONAL_DEX_SKIPLOOM
	.2byte NATIONAL_DEX_KOFFING
	.2byte NATIONAL_DEX_DUGTRIO
	.2byte NATIONAL_DEX_CASCOON
	.2byte NATIONAL_DEX_NUMEL
	.2byte NATIONAL_DEX_ANORITH
	.2byte NATIONAL_DEX_VOLBEAT
	.2byte NATIONAL_DEX_HOOTHOOT
	.2byte NATIONAL_DEX_TRAPINCH
	.2byte NATIONAL_DEX_SPOINK
	.2byte NATIONAL_DEX_METAPOD
	.2byte NATIONAL_DEX_BELLSPROUT
	.2byte NATIONAL_DEX_SNORUNT
	.2byte NATIONAL_DEX_RATICATE
	.2byte NATIONAL_DEX_MARSHTOMP
	.2byte NATIONAL_DEX_SWELLOW
	.2byte NATIONAL_DEX_MAGBY
	.2byte NATIONAL_DEX_GROWLITHE
	.2byte NATIONAL_DEX_MISDREAVUS
	.2byte NATIONAL_DEX_BULBASAUR
	.2byte NATIONAL_DEX_TYROGUE
	.2byte NATIONAL_DEX_SLUGMA
	.2byte NATIONAL_DEX_SLAKOTH
	.2byte NATIONAL_DEX_KIRLIA
	.2byte NATIONAL_DEX_AIPOM
	.2byte NATIONAL_DEX_JOLTEON
	.2byte NATIONAL_DEX_NIDORINA
	.2byte NATIONAL_DEX_AZUMARILL
	.2byte NATIONAL_DEX_SHEDINJA
	.2byte NATIONAL_DEX_MACHOP
	.2byte NATIONAL_DEX_NINJASK
	.2byte NATIONAL_DEX_MASQUERAIN
	.2byte NATIONAL_DEX_DUSKULL
	.2byte NATIONAL_DEX_SUNFLORA
	.2byte NATIONAL_DEX_JUMPLUFF
	.2byte NATIONAL_DEX_STARYU
	.2byte NATIONAL_DEX_FLAAFFY
	.2byte NATIONAL_DEX_SPHEAL
	.2byte NATIONAL_DEX_PSYDUCK
	.2byte NATIONAL_DEX_MAGCARGO
	.2byte NATIONAL_DEX_FARFETCHD
	.2byte NATIONAL_DEX_ZUBAT
	.2byte NATIONAL_DEX_PORYGON
	.2byte NATIONAL_DEX_SENTRET
	.2byte NATIONAL_DEX_CARVANHA
	.2byte NATIONAL_DEX_GLOOM
	.2byte NATIONAL_DEX_RAICHU
	.2byte NATIONAL_DEX_MAGIKARP
	.2byte NATIONAL_DEX_SNEASEL
	.2byte NATIONAL_DEX_LAIRON
	.2byte NATIONAL_DEX_COMBUSKEN
	.2byte NATIONAL_DEX_OCTILLERY
	.2byte NATIONAL_DEX_NIDORINO
	.2byte NATIONAL_DEX_FLAREON
	.2byte NATIONAL_DEX_DELIBIRD
	.2byte NATIONAL_DEX_TENTACOOL
	.2byte NATIONAL_DEX_ABRA
	.2byte NATIONAL_DEX_GROVYLE
	.2byte NATIONAL_DEX_WHISCASH
	.2byte NATIONAL_DEX_QUILAVA
	.2byte NATIONAL_DEX_ESPEON
	.2byte NATIONAL_DEX_GRIMER
	.2byte NATIONAL_DEX_CHIKORITA
	.2byte NATIONAL_DEX_GRUMPIG
	.2byte NATIONAL_DEX_NOSEPASS
	.2byte NATIONAL_DEX_PERSIAN
	.2byte NATIONAL_DEX_MIGHTYENA
	.2byte NATIONAL_DEX_VENONAT
	.2byte NATIONAL_DEX_MAGNETON
	.2byte NATIONAL_DEX_PONYTA
	.2byte NATIONAL_DEX_MAKUHITA
	.2byte NATIONAL_DEX_LUNATONE
	.2byte NATIONAL_DEX_SANDSLASH
	.2byte NATIONAL_DEX_DROWZEE
	.2byte NATIONAL_DEX_TANGELA
	.2byte NATIONAL_DEX_PRIMEAPE
	.2byte NATIONAL_DEX_LEDYBA
	.2byte NATIONAL_DEX_WIGGLYTUFF
	.2byte NATIONAL_DEX_PARASECT
	.2byte NATIONAL_DEX_OMASTAR
	.2byte NATIONAL_DEX_LOUDRED
	.2byte NATIONAL_DEX_WARTORTLE
	.2byte NATIONAL_DEX_GRAVELER
	.2byte NATIONAL_DEX_UMBREON
	.2byte NATIONAL_DEX_LILEEP
	.2byte NATIONAL_DEX_POLIWHIRL
	.2byte NATIONAL_DEX_VAPOREON
	.2byte NATIONAL_DEX_BEEDRILL
	.2byte NATIONAL_DEX_MAROWAK
	.2byte NATIONAL_DEX_WEEPINBELL
	.2byte NATIONAL_DEX_RELICANTH
	.2byte NATIONAL_DEX_RHYHORN
	.2byte NATIONAL_DEX_IVYSAUR
	.2byte NATIONAL_DEX_KECLEON
	.2byte NATIONAL_DEX_NUZLEAF
	.2byte NATIONAL_DEX_BEAUTIFLY
	.2byte NATIONAL_DEX_PIDGEOTTO
	.2byte NATIONAL_DEX_ARIADOS
	.2byte NATIONAL_DEX_SEEL
	.2byte NATIONAL_DEX_POLITOED
	.2byte NATIONAL_DEX_CROCONAW
	.2byte NATIONAL_DEX_CHANSEY
	.2byte NATIONAL_DEX_BANETTE
	.2byte NATIONAL_DEX_DONPHAN
	.2byte NATIONAL_DEX_STARMIE
	.2byte NATIONAL_DEX_CHARMELEON
	.2byte NATIONAL_DEX_PILOSWINE
	.2byte NATIONAL_DEX_BUTTERFREE
	.2byte NATIONAL_DEX_VIBRAVA
	.2byte NATIONAL_DEX_ELECTABUZZ
	.2byte NATIONAL_DEX_CRAWDAUNT
	.2byte NATIONAL_DEX_DELCATTY
	.2byte NATIONAL_DEX_ALTARIA
	.2byte NATIONAL_DEX_SHELGON
	.2byte NATIONAL_DEX_NINETALES
	.2byte NATIONAL_DEX_GLIGAR
	.2byte NATIONAL_DEX_SEALEO
	.2byte NATIONAL_DEX_SPINDA
	.2byte NATIONAL_DEX_PUPITAR
	.2byte NATIONAL_DEX_SLOWPOKE
	.2byte NATIONAL_DEX_SOLROCK
	.2byte NATIONAL_DEX_MILTANK
	.2byte NATIONAL_DEX_FEAROW
	.2byte NATIONAL_DEX_VILEPLUME
	.2byte NATIONAL_DEX_MUK
	.2byte NATIONAL_DEX_FORRETRESS
	.2byte NATIONAL_DEX_SUDOWOODO
	.2byte NATIONAL_DEX_ABSOL
	.2byte NATIONAL_DEX_YANMA
	.2byte NATIONAL_DEX_DUSTOX
	.2byte NATIONAL_DEX_LICKITUNG
	.2byte NATIONAL_DEX_SMEARGLE
	.2byte NATIONAL_DEX_LANTURN
	.2byte NATIONAL_DEX_ELECTRODE
	.2byte NATIONAL_DEX_LOMBRE
	.2byte NATIONAL_DEX_BRELOOM
	.2byte NATIONAL_DEX_BAYLEEF
	.2byte NATIONAL_DEX_SEADRA
	.2byte NATIONAL_DEX_WEEZING
	.2byte NATIONAL_DEX_PELIPPER
	.2byte NATIONAL_DEX_METANG
	.2byte NATIONAL_DEX_NIDOQUEEN
	.2byte NATIONAL_DEX_CACTURNE
	.2byte NATIONAL_DEX_SHIFTRY
	.2byte NATIONAL_DEX_MEDICHAM
	.2byte NATIONAL_DEX_ZANGOOSE
	.2byte NATIONAL_DEX_KABUTOPS
	.2byte NATIONAL_DEX_KINGLER
	.2byte NATIONAL_DEX_KADABRA
	.2byte NATIONAL_DEX_SEAKING
	.2byte NATIONAL_DEX_CLEFABLE
	.2byte NATIONAL_DEX_MAGMAR
	.2byte NATIONAL_DEX_WOBBUFFET
	.2byte NATIONAL_DEX_GASTLY
	.2byte NATIONAL_DEX_MR_MIME
	.2byte NATIONAL_DEX_POLIWRATH
	.2byte NATIONAL_DEX_TAUROS
	.2byte NATIONAL_DEX_LATIAS
	.2byte NATIONAL_DEX_AMPHAROS
	.2byte NATIONAL_DEX_VIGOROTH
	.2byte NATIONAL_DEX_LEDIAN
	.2byte NATIONAL_DEX_GOLEM
	.2byte NATIONAL_DEX_WALREIN
	.2byte NATIONAL_DEX_DODUO
	.2byte NATIONAL_DEX_HOUNDOOM
	.2byte NATIONAL_DEX_NIDOKING
	.2byte NATIONAL_DEX_JYNX
	.2byte NATIONAL_DEX_HITMONCHAN
	.2byte NATIONAL_DEX_STANTLER
	.2byte NATIONAL_DEX_GRANBULL
	.2byte NATIONAL_DEX_HITMONTOP
	.2byte NATIONAL_DEX_QUAGSIRE
	.2byte NATIONAL_DEX_CLAYDOL
	.2byte NATIONAL_DEX_SWAMPERT
	.2byte NATIONAL_DEX_BLISSEY
	.2byte NATIONAL_DEX_LUDICOLO
	.2byte NATIONAL_DEX_EXPLOUD
	.2byte NATIONAL_DEX_DUNSPARCE
	.2byte NATIONAL_DEX_PINSIR
	.2byte NATIONAL_DEX_CLOYSTER
	.2byte NATIONAL_DEX_MACHOKE
	.2byte NATIONAL_DEX_GIRAFARIG
	.2byte NATIONAL_DEX_PIDGEOT
	.2byte NATIONAL_DEX_XATU
	.2byte NATIONAL_DEX_CRADILY
	.2byte NATIONAL_DEX_HITMONLEE
	.2byte NATIONAL_DEX_VENOMOTH
	.2byte NATIONAL_DEX_GENGAR
	.2byte NATIONAL_DEX_HERACROSS
	.2byte NATIONAL_DEX_GLALIE
	.2byte NATIONAL_DEX_SCYTHER
	.2byte NATIONAL_DEX_SALAMENCE
	.2byte NATIONAL_DEX_MANECTRIC
	.2byte NATIONAL_DEX_ARMALDO
	.2byte NATIONAL_DEX_ALAKAZAM
	.2byte NATIONAL_DEX_HYPNO
	.2byte NATIONAL_DEX_NOCTOWL
	.2byte NATIONAL_DEX_TENTACRUEL
	.2byte NATIONAL_DEX_DUSCLOPS
	.2byte NATIONAL_DEX_ZAPDOS
	.2byte NATIONAL_DEX_GOLBAT
	.2byte NATIONAL_DEX_METAGROSS
	.2byte NATIONAL_DEX_GARDEVOIR
	.2byte NATIONAL_DEX_BLASTOISE
	.2byte NATIONAL_DEX_SLOWBRO
	.2byte NATIONAL_DEX_HAUNTER
	.2byte NATIONAL_DEX_MACHAMP
	.2byte NATIONAL_DEX_REGIROCK
	.2byte NATIONAL_DEX_SWALOT
	.2byte NATIONAL_DEX_SCEPTILE
	.2byte NATIONAL_DEX_SKARMORY
	.2byte NATIONAL_DEX_GOLDUCK
	.2byte NATIONAL_DEX_DEOXYS
	.2byte NATIONAL_DEX_VICTREEBEL
	.2byte NATIONAL_DEX_RAPIDASH
	.2byte NATIONAL_DEX_CHARIZARD
	.2byte NATIONAL_DEX_HUNTAIL
	.2byte NATIONAL_DEX_DEWGONG
	.2byte NATIONAL_DEX_ARTICUNO
	.2byte NATIONAL_DEX_TYPHLOSION
	.2byte NATIONAL_DEX_AERODACTYL
	.2byte NATIONAL_DEX_GOREBYSS
	.2byte NATIONAL_DEX_URSARING
	.2byte NATIONAL_DEX_MEGANIUM
	.2byte NATIONAL_DEX_REGICE
	.2byte NATIONAL_DEX_SCIZOR
	.2byte NATIONAL_DEX_KINGDRA
	.2byte NATIONAL_DEX_DRATINI
	.2byte NATIONAL_DEX_DODRIO
	.2byte NATIONAL_DEX_SHARPEDO
	.2byte NATIONAL_DEX_CROBAT
	.2byte NATIONAL_DEX_FURRET
	.2byte NATIONAL_DEX_ARCANINE
	.2byte NATIONAL_DEX_RAIKOU
	.2byte NATIONAL_DEX_BLAZIKEN
	.2byte NATIONAL_DEX_CAMERUPT
	.2byte NATIONAL_DEX_RHYDON
	.2byte NATIONAL_DEX_REGISTEEL
	.2byte NATIONAL_DEX_EKANS
	.2byte NATIONAL_DEX_FLYGON
	.2byte NATIONAL_DEX_TROPIUS
	.2byte NATIONAL_DEX_LATIOS
	.2byte NATIONAL_DEX_SUICUNE
	.2byte NATIONAL_DEX_MOLTRES
	.2byte NATIONAL_DEX_VENUSAUR
	.2byte NATIONAL_DEX_EXEGGUTOR
	.2byte NATIONAL_DEX_SLOWKING
	.2byte NATIONAL_DEX_TYRANITAR
	.2byte NATIONAL_DEX_SLAKING
	.2byte NATIONAL_DEX_WAILMER
	.2byte NATIONAL_DEX_MEWTWO
	.2byte NATIONAL_DEX_AGGRON
	.2byte NATIONAL_DEX_SNORLAX
	.2byte NATIONAL_DEX_MANTINE
	.2byte NATIONAL_DEX_ENTEI
	.2byte NATIONAL_DEX_DRAGONITE
	.2byte NATIONAL_DEX_KANGASKHAN
	.2byte NATIONAL_DEX_HARIYAMA
	.2byte NATIONAL_DEX_FERALIGATR
	.2byte NATIONAL_DEX_LAPRAS
	.2byte NATIONAL_DEX_SEVIPER
	.2byte NATIONAL_DEX_ARBOK
	.2byte NATIONAL_DEX_GROUDON
	.2byte NATIONAL_DEX_HO_OH
	.2byte NATIONAL_DEX_DRAGONAIR
	.2byte NATIONAL_DEX_KYOGRE
	.2byte NATIONAL_DEX_LUGIA
	.2byte NATIONAL_DEX_MILOTIC
	.2byte NATIONAL_DEX_GYARADOS
	.2byte NATIONAL_DEX_RAYQUAZA
	.2byte NATIONAL_DEX_ONIX
	.2byte NATIONAL_DEX_STEELIX
	.2byte NATIONAL_DEX_WAILORD

gUnknown_84448FE:: @ 84448FE
	.2byte NATIONAL_DEX_RATTATA
	.2byte NATIONAL_DEX_RATICATE
	.2byte NATIONAL_DEX_CLEFAIRY
	.2byte NATIONAL_DEX_CLEFABLE
	.2byte NATIONAL_DEX_JIGGLYPUFF
	.2byte NATIONAL_DEX_WIGGLYTUFF
	.2byte NATIONAL_DEX_MEOWTH
	.2byte NATIONAL_DEX_PERSIAN
	.2byte NATIONAL_DEX_LICKITUNG
	.2byte NATIONAL_DEX_CHANSEY
	.2byte NATIONAL_DEX_KANGASKHAN
	.2byte NATIONAL_DEX_TAUROS
	.2byte NATIONAL_DEX_DITTO
	.2byte NATIONAL_DEX_EEVEE
	.2byte NATIONAL_DEX_PORYGON
	.2byte NATIONAL_DEX_SNORLAX
	.2byte NATIONAL_DEX_SENTRET
	.2byte NATIONAL_DEX_FURRET
	.2byte NATIONAL_DEX_CLEFFA
	.2byte NATIONAL_DEX_IGGLYBUFF
	.2byte NATIONAL_DEX_TOGEPI
	.2byte NATIONAL_DEX_AIPOM
	.2byte NATIONAL_DEX_DUNSPARCE
	.2byte NATIONAL_DEX_SNUBBULL
	.2byte NATIONAL_DEX_GRANBULL
	.2byte NATIONAL_DEX_TEDDIURSA
	.2byte NATIONAL_DEX_URSARING
	.2byte NATIONAL_DEX_PORYGON2
	.2byte NATIONAL_DEX_STANTLER
	.2byte NATIONAL_DEX_SMEARGLE
	.2byte NATIONAL_DEX_MILTANK
	.2byte NATIONAL_DEX_BLISSEY
	.2byte NATIONAL_DEX_VIGOROTH
	.2byte NATIONAL_DEX_SLAKING
	.2byte NATIONAL_DEX_SEALEO
	.2byte NATIONAL_DEX_WALREIN
	.2byte NATIONAL_DEX_CLAMPERL
	.2byte NATIONAL_DEX_LUVDISC
	.2byte NATIONAL_DEX_BAGON
	.2byte NATIONAL_DEX_SHELGON
	.2byte NATIONAL_DEX_MILOTIC
	.2byte NATIONAL_DEX_ROSELIA
	.2byte NATIONAL_DEX_GULPIN
	.2byte NATIONAL_DEX_MEDICHAM
	.2byte NATIONAL_DEX_LATIAS
	.2byte NATIONAL_DEX_JIRACHI
	.2byte NATIONAL_DEX_SWALOT
	.2byte NATIONAL_DEX_TREECKO
	.2byte NATIONAL_DEX_GROVYLE
	.2byte NATIONAL_DEX_SCEPTILE
	.2byte NATIONAL_DEX_TORCHIC
	.2byte NATIONAL_DEX_COMBUSKEN
	.2byte NATIONAL_DEX_BLAZIKEN
	.2byte NATIONAL_DEX_MUDKIP
	.2byte NATIONAL_DEX_MARSHTOMP
	.2byte NATIONAL_DEX_SWAMPERT
	.2byte NATIONAL_DEX_POOCHYENA
	.2byte NATIONAL_DEX_MIGHTYENA
	.2byte NATIONAL_DEX_ZIGZAGOON
	.2byte NATIONAL_DEX_LINOONE
	.2byte NATIONAL_DEX_WURMPLE
	.2byte NATIONAL_DEX_SILCOON
	.2byte NATIONAL_DEX_BEAUTIFLY
	.2byte NATIONAL_DEX_CASCOON
	.2byte NATIONAL_DEX_DUSTOX
	.2byte NATIONAL_DEX_LOTAD
	.2byte NATIONAL_DEX_LOMBRE
	.2byte NATIONAL_DEX_LUDICOLO
	.2byte NATIONAL_DEX_SEEDOT
	.2byte NATIONAL_DEX_NUZLEAF
	.2byte NATIONAL_DEX_SHIFTRY
	.2byte NATIONAL_DEX_TAILLOW
	.2byte NATIONAL_DEX_PIDGEY
	.2byte NATIONAL_DEX_PIDGEOTTO
	.2byte NATIONAL_DEX_PIDGEOT
	.2byte NATIONAL_DEX_SPEAROW
	.2byte NATIONAL_DEX_FEAROW
	.2byte NATIONAL_DEX_FARFETCHD
	.2byte NATIONAL_DEX_DODUO
	.2byte NATIONAL_DEX_DODRIO
	.2byte NATIONAL_DEX_HOOTHOOT
	.2byte NATIONAL_DEX_NOCTOWL
	.2byte NATIONAL_DEX_TOGETIC
	.2byte NATIONAL_DEX_ARON
	.2byte NATIONAL_DEX_LAIRON
	.2byte NATIONAL_DEX_CHIMECHO
	.2byte NATIONAL_DEX_GIRAFARIG
	.2byte NATIONAL_DEX_MANKEY
	.2byte NATIONAL_DEX_PRIMEAPE
	.2byte NATIONAL_DEX_MACHOP
	.2byte NATIONAL_DEX_MACHOKE
	.2byte NATIONAL_DEX_MACHAMP
	.2byte NATIONAL_DEX_HITMONLEE
	.2byte NATIONAL_DEX_HITMONCHAN
	.2byte NATIONAL_DEX_TYROGUE
	.2byte NATIONAL_DEX_HITMONTOP
	.2byte NATIONAL_DEX_ZANGOOSE
	.2byte NATIONAL_DEX_SEVIPER
	.2byte NATIONAL_DEX_DUSCLOPS
	.2byte NATIONAL_DEX_TROPIUS
	.2byte NATIONAL_DEX_EKANS
	.2byte NATIONAL_DEX_ARBOK
	.2byte NATIONAL_DEX_NIDORAN_F
	.2byte NATIONAL_DEX_NIDORINA
	.2byte NATIONAL_DEX_NIDORAN_M
	.2byte NATIONAL_DEX_NIDORINO
	.2byte NATIONAL_DEX_GRIMER
	.2byte NATIONAL_DEX_MUK
	.2byte NATIONAL_DEX_KOFFING
	.2byte NATIONAL_DEX_WEEZING
	.2byte NATIONAL_DEX_HUNTAIL
	.2byte NATIONAL_DEX_GOREBYSS
	.2byte NATIONAL_DEX_REGISTEEL
	.2byte NATIONAL_DEX_ZUBAT
	.2byte NATIONAL_DEX_GOLBAT
	.2byte NATIONAL_DEX_CROBAT
	.2byte NATIONAL_DEX_NIDOQUEEN
	.2byte NATIONAL_DEX_NIDOKING
	.2byte NATIONAL_DEX_SANDSHREW
	.2byte NATIONAL_DEX_SANDSLASH
	.2byte NATIONAL_DEX_DIGLETT
	.2byte NATIONAL_DEX_DUGTRIO
	.2byte NATIONAL_DEX_CUBONE
	.2byte NATIONAL_DEX_MAROWAK
	.2byte NATIONAL_DEX_PHANPY
	.2byte NATIONAL_DEX_DONPHAN
	.2byte NATIONAL_DEX_CACTURNE
	.2byte NATIONAL_DEX_OLD_UNOWN_T
	.2byte NATIONAL_DEX_GLIGAR
	.2byte NATIONAL_DEX_RHYHORN
	.2byte NATIONAL_DEX_RHYDON
	.2byte NATIONAL_DEX_CARVANHA
	.2byte NATIONAL_DEX_SHARPEDO
	.2byte NATIONAL_DEX_SWABLU
	.2byte NATIONAL_DEX_ALTARIA
	.2byte NATIONAL_DEX_SUDOWOODO
	.2byte NATIONAL_DEX_WAILMER
	.2byte NATIONAL_DEX_OLD_UNOWN_P
	.2byte NATIONAL_DEX_AERODACTYL
	.2byte NATIONAL_DEX_GEODUDE
	.2byte NATIONAL_DEX_GRAVELER
	.2byte NATIONAL_DEX_GOLEM
	.2byte NATIONAL_DEX_ONIX
	.2byte NATIONAL_DEX_LARVITAR
	.2byte NATIONAL_DEX_PUPITAR
	.2byte NATIONAL_DEX_OLD_UNOWN_E
	.2byte NATIONAL_DEX_OLD_UNOWN_F
	.2byte NATIONAL_DEX_OMANYTE
	.2byte NATIONAL_DEX_OMASTAR
	.2byte NATIONAL_DEX_KABUTO
	.2byte NATIONAL_DEX_KABUTOPS
	.2byte NATIONAL_DEX_OLD_UNOWN_C
	.2byte NATIONAL_DEX_OLD_UNOWN_D
	.2byte NATIONAL_DEX_ARMALDO
	.2byte NATIONAL_DEX_FEEBAS
	.2byte NATIONAL_DEX_TYRANITAR
	.2byte NATIONAL_DEX_CATERPIE
	.2byte NATIONAL_DEX_METAPOD
	.2byte NATIONAL_DEX_PINSIR
	.2byte NATIONAL_DEX_PINECO
	.2byte NATIONAL_DEX_NINCADA
	.2byte NATIONAL_DEX_NINJASK
	.2byte NATIONAL_DEX_WHISMUR
	.2byte NATIONAL_DEX_DEOXYS
	.2byte NATIONAL_DEX_OLD_UNOWN_B
	.2byte NATIONAL_DEX_HERACROSS
	.2byte NATIONAL_DEX_BUTTERFREE
	.2byte NATIONAL_DEX_SCYTHER
	.2byte NATIONAL_DEX_LEDYBA
	.2byte NATIONAL_DEX_LEDIAN
	.2byte NATIONAL_DEX_YANMA
	.2byte NATIONAL_DEX_SHEDINJA
	.2byte NATIONAL_DEX_MINUN
	.2byte NATIONAL_DEX_SABLEYE
	.2byte NATIONAL_DEX_WEEDLE
	.2byte NATIONAL_DEX_KAKUNA
	.2byte NATIONAL_DEX_BEEDRILL
	.2byte NATIONAL_DEX_VENONAT
	.2byte NATIONAL_DEX_VENOMOTH
	.2byte NATIONAL_DEX_SPINARAK
	.2byte NATIONAL_DEX_ARIADOS
	.2byte NATIONAL_DEX_LOUDRED
	.2byte NATIONAL_DEX_DELCATTY
	.2byte NATIONAL_DEX_SHUCKLE
	.2byte NATIONAL_DEX_MAWILE
	.2byte NATIONAL_DEX_FORRETRESS
	.2byte NATIONAL_DEX_SCIZOR
	.2byte NATIONAL_DEX_PLUSLE
	.2byte NATIONAL_DEX_PARAS
	.2byte NATIONAL_DEX_PARASECT
	.2byte NATIONAL_DEX_MISDREAVUS
	.2byte NATIONAL_DEX_REGIROCK
	.2byte NATIONAL_DEX_REGICE
	.2byte NATIONAL_DEX_SNORUNT
	.2byte NATIONAL_DEX_GLALIE
	.2byte NATIONAL_DEX_GASTLY
	.2byte NATIONAL_DEX_HAUNTER
	.2byte NATIONAL_DEX_GENGAR
	.2byte NATIONAL_DEX_DUSKULL
	.2byte NATIONAL_DEX_OLD_UNOWN_R
	.2byte NATIONAL_DEX_SKARMORY
	.2byte NATIONAL_DEX_STEELIX
	.2byte NATIONAL_DEX_KYOGRE
	.2byte NATIONAL_DEX_GROUDON
	.2byte NATIONAL_DEX_RAYQUAZA
	.2byte NATIONAL_DEX_OLD_UNOWN_M
	.2byte NATIONAL_DEX_OLD_UNOWN_N
	.2byte NATIONAL_DEX_OLD_UNOWN_O
	.2byte NATIONAL_DEX_OLD_UNOWN_X
	.2byte NATIONAL_DEX_CHARMANDER
	.2byte NATIONAL_DEX_CHARMELEON
	.2byte NATIONAL_DEX_VULPIX
	.2byte NATIONAL_DEX_NINETALES
	.2byte NATIONAL_DEX_GROWLITHE
	.2byte NATIONAL_DEX_ARCANINE
	.2byte NATIONAL_DEX_PONYTA
	.2byte NATIONAL_DEX_RAPIDASH
	.2byte NATIONAL_DEX_MAGMAR
	.2byte NATIONAL_DEX_FLAREON
	.2byte NATIONAL_DEX_CYNDAQUIL
	.2byte NATIONAL_DEX_QUILAVA
	.2byte NATIONAL_DEX_TYPHLOSION
	.2byte NATIONAL_DEX_SLUGMA
	.2byte NATIONAL_DEX_MAGBY
	.2byte NATIONAL_DEX_ENTEI
	.2byte NATIONAL_DEX_RALTS
	.2byte NATIONAL_DEX_WAILORD
	.2byte NATIONAL_DEX_KIRLIA
	.2byte NATIONAL_DEX_GARDEVOIR
	.2byte NATIONAL_DEX_CHARIZARD
	.2byte NATIONAL_DEX_MOLTRES
	.2byte NATIONAL_DEX_HO_OH
	.2byte NATIONAL_DEX_BARBOACH
	.2byte NATIONAL_DEX_WHISCASH
	.2byte NATIONAL_DEX_MAGCARGO
	.2byte NATIONAL_DEX_SQUIRTLE
	.2byte NATIONAL_DEX_WARTORTLE
	.2byte NATIONAL_DEX_BLASTOISE
	.2byte NATIONAL_DEX_PSYDUCK
	.2byte NATIONAL_DEX_GOLDUCK
	.2byte NATIONAL_DEX_POLIWAG
	.2byte NATIONAL_DEX_POLIWHIRL
	.2byte NATIONAL_DEX_SEEL
	.2byte NATIONAL_DEX_SHELLDER
	.2byte NATIONAL_DEX_KRABBY
	.2byte NATIONAL_DEX_KINGLER
	.2byte NATIONAL_DEX_HORSEA
	.2byte NATIONAL_DEX_SEADRA
	.2byte NATIONAL_DEX_GOLDEEN
	.2byte NATIONAL_DEX_SEAKING
	.2byte NATIONAL_DEX_STARYU
	.2byte NATIONAL_DEX_MAGIKARP
	.2byte NATIONAL_DEX_VAPOREON
	.2byte NATIONAL_DEX_TOTODILE
	.2byte NATIONAL_DEX_CROCONAW
	.2byte NATIONAL_DEX_FERALIGATR
	.2byte NATIONAL_DEX_MARILL
	.2byte NATIONAL_DEX_AZUMARILL
	.2byte NATIONAL_DEX_POLITOED
	.2byte NATIONAL_DEX_REMORAID
	.2byte NATIONAL_DEX_OCTILLERY
	.2byte NATIONAL_DEX_SUICUNE
	.2byte NATIONAL_DEX_SURSKIT
	.2byte NATIONAL_DEX_VOLBEAT
	.2byte NATIONAL_DEX_ILLUMISE
	.2byte NATIONAL_DEX_GRUMPIG
	.2byte NATIONAL_DEX_TRAPINCH
	.2byte NATIONAL_DEX_VIBRAVA
	.2byte NATIONAL_DEX_SALAMENCE
	.2byte NATIONAL_DEX_BELDUM
	.2byte NATIONAL_DEX_METANG
	.2byte NATIONAL_DEX_SPOINK
	.2byte NATIONAL_DEX_OLD_UNOWN_S
	.2byte NATIONAL_DEX_POLIWRATH
	.2byte NATIONAL_DEX_GYARADOS
	.2byte NATIONAL_DEX_MANTINE
	.2byte NATIONAL_DEX_ELECTRIKE
	.2byte NATIONAL_DEX_MANECTRIC
	.2byte NATIONAL_DEX_TENTACOOL
	.2byte NATIONAL_DEX_TENTACRUEL
	.2byte NATIONAL_DEX_QWILFISH
	.2byte NATIONAL_DEX_WOOPER
	.2byte NATIONAL_DEX_QUAGSIRE
	.2byte NATIONAL_DEX_MASQUERAIN
	.2byte NATIONAL_DEX_SHROOMISH
	.2byte NATIONAL_DEX_CAMERUPT
	.2byte NATIONAL_DEX_TORKOAL
	.2byte NATIONAL_DEX_CORSOLA
	.2byte NATIONAL_DEX_LATIOS
	.2byte NATIONAL_DEX_EXPLOUD
	.2byte NATIONAL_DEX_MAKUHITA
	.2byte NATIONAL_DEX_HARIYAMA
	.2byte NATIONAL_DEX_CHINCHOU
	.2byte NATIONAL_DEX_LANTURN
	.2byte NATIONAL_DEX_SLOWPOKE
	.2byte NATIONAL_DEX_SLOWBRO
	.2byte NATIONAL_DEX_STARMIE
	.2byte NATIONAL_DEX_SLOWKING
	.2byte NATIONAL_DEX_DEWGONG
	.2byte NATIONAL_DEX_CLOYSTER
	.2byte NATIONAL_DEX_LAPRAS
	.2byte NATIONAL_DEX_KINGDRA
	.2byte NATIONAL_DEX_FLYGON
	.2byte NATIONAL_DEX_CACNEA
	.2byte NATIONAL_DEX_SPINDA
	.2byte NATIONAL_DEX_TANGELA
	.2byte NATIONAL_DEX_CHIKORITA
	.2byte NATIONAL_DEX_BAYLEEF
	.2byte NATIONAL_DEX_MEGANIUM
	.2byte NATIONAL_DEX_BELLOSSOM
	.2byte NATIONAL_DEX_SUNKERN
	.2byte NATIONAL_DEX_SUNFLORA
	.2byte NATIONAL_DEX_SWELLOW
	.2byte NATIONAL_DEX_WINGULL
	.2byte NATIONAL_DEX_PELIPPER
	.2byte NATIONAL_DEX_AZURILL
	.2byte NATIONAL_DEX_AGGRON
	.2byte NATIONAL_DEX_CLAYDOL
	.2byte NATIONAL_DEX_MEDITITE
	.2byte NATIONAL_DEX_HOPPIP
	.2byte NATIONAL_DEX_SKIPLOOM
	.2byte NATIONAL_DEX_JUMPLUFF
	.2byte NATIONAL_DEX_RELICANTH
	.2byte NATIONAL_DEX_BULBASAUR
	.2byte NATIONAL_DEX_IVYSAUR
	.2byte NATIONAL_DEX_VENUSAUR
	.2byte NATIONAL_DEX_ODDISH
	.2byte NATIONAL_DEX_GLOOM
	.2byte NATIONAL_DEX_VILEPLUME
	.2byte NATIONAL_DEX_BELLSPROUT
	.2byte NATIONAL_DEX_WEEPINBELL
	.2byte NATIONAL_DEX_VICTREEBEL
	.2byte NATIONAL_DEX_SPHEAL
	.2byte NATIONAL_DEX_EXEGGCUTE
	.2byte NATIONAL_DEX_EXEGGUTOR
	.2byte NATIONAL_DEX_NOSEPASS
	.2byte NATIONAL_DEX_SKITTY
	.2byte NATIONAL_DEX_LILEEP
	.2byte NATIONAL_DEX_PIKACHU
	.2byte NATIONAL_DEX_RAICHU
	.2byte NATIONAL_DEX_VOLTORB
	.2byte NATIONAL_DEX_ELECTRODE
	.2byte NATIONAL_DEX_ELECTABUZZ
	.2byte NATIONAL_DEX_JOLTEON
	.2byte NATIONAL_DEX_PICHU
	.2byte NATIONAL_DEX_MAREEP
	.2byte NATIONAL_DEX_FLAAFFY
	.2byte NATIONAL_DEX_AMPHAROS
	.2byte NATIONAL_DEX_ELEKID
	.2byte NATIONAL_DEX_RAIKOU
	.2byte NATIONAL_DEX_LUNATONE
	.2byte NATIONAL_DEX_SOLROCK
	.2byte NATIONAL_DEX_SHUPPET
	.2byte NATIONAL_DEX_BANETTE
	.2byte NATIONAL_DEX_ZAPDOS
	.2byte NATIONAL_DEX_MAGNEMITE
	.2byte NATIONAL_DEX_MAGNETON
	.2byte NATIONAL_DEX_ABRA
	.2byte NATIONAL_DEX_KADABRA
	.2byte NATIONAL_DEX_ALAKAZAM
	.2byte NATIONAL_DEX_DROWZEE
	.2byte NATIONAL_DEX_HYPNO
	.2byte NATIONAL_DEX_MR_MIME
	.2byte NATIONAL_DEX_MEWTWO
	.2byte NATIONAL_DEX_MEW
	.2byte NATIONAL_DEX_ESPEON
	.2byte NATIONAL_DEX_UNOWN
	.2byte NATIONAL_DEX_WOBBUFFET
	.2byte NATIONAL_DEX_OLD_UNOWN_G
	.2byte NATIONAL_DEX_OLD_UNOWN_H
	.2byte NATIONAL_DEX_OLD_UNOWN_I
	.2byte NATIONAL_DEX_CASTFORM
	.2byte NATIONAL_DEX_KECLEON
	.2byte NATIONAL_DEX_OLD_UNOWN_Z
	.2byte NATIONAL_DEX_WYNAUT
	.2byte NATIONAL_DEX_OLD_UNOWN_Y
	.2byte NATIONAL_DEX_NATU
	.2byte NATIONAL_DEX_XATU
	.2byte NATIONAL_DEX_LUGIA
	.2byte NATIONAL_DEX_CELEBI
	.2byte NATIONAL_DEX_CRADILY
	.2byte NATIONAL_DEX_ANORITH
	.2byte NATIONAL_DEX_OLD_UNOWN_Q
	.2byte NATIONAL_DEX_ARTICUNO
	.2byte NATIONAL_DEX_DELIBIRD
	.2byte NATIONAL_DEX_SWINUB
	.2byte NATIONAL_DEX_PILOSWINE
	.2byte NATIONAL_DEX_CORPHISH
	.2byte NATIONAL_DEX_CRAWDAUNT
	.2byte NATIONAL_DEX_BALTOY
	.2byte NATIONAL_DEX_JYNX
	.2byte NATIONAL_DEX_SMOOCHUM
	.2byte NATIONAL_DEX_DRATINI
	.2byte NATIONAL_DEX_DRAGONAIR
	.2byte NATIONAL_DEX_OLD_UNOWN_J
	.2byte NATIONAL_DEX_OLD_UNOWN_K
	.2byte NATIONAL_DEX_DRAGONITE
	.2byte NATIONAL_DEX_ABSOL
	.2byte NATIONAL_DEX_OLD_UNOWN_L
	.2byte NATIONAL_DEX_OLD_UNOWN_U
	.2byte NATIONAL_DEX_OLD_UNOWN_V
	.2byte NATIONAL_DEX_OLD_UNOWN_W
	.2byte NATIONAL_DEX_UMBREON
	.2byte NATIONAL_DEX_BRELOOM
	.2byte NATIONAL_DEX_SLAKOTH
	.2byte NATIONAL_DEX_METAGROSS
	.2byte NATIONAL_DEX_MURKROW
	.2byte NATIONAL_DEX_NUMEL
	.2byte NATIONAL_DEX_HOUNDOUR
	.2byte NATIONAL_DEX_HOUNDOOM
	.2byte NATIONAL_DEX_SNEASEL

	.section .rodata.after @ pokedex.c erroneously carved out?

gUnknown_8451EBC:: @ 8451EBC BgTemplate
	.4byte 0x00000050
	@ {
	@   .bg = 0,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 5,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 0,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00001049
	@ {
	@   .bg = 1,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 4,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 1,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x0000206a
	@ {
	@   .bg = 2,
	@   .charBaseIndex = 2,
	@   .mapBaseIndex = 6,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 2,
	@   .baseTile = 0x0000
	@ }
	.4byte 0x00003073
	@ {
	@   .bg = 3,
	@   .charBaseIndex = 0,
	@   .mapBaseIndex = 7,
	@   .screenSize = 0,
	@   .paletteMode = 0,
	@   .priority = 3,
	@   .baseTile = 0x0000
	@ }

gUnknown_8451ECC:: @ 8451ECC WindowTemplate
	.byte 0, 0, 0, 30, 2, 15
	.2byte 0x03c4
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 30,
	@   .height = 2,
	@   .paletteNum = 15,
	@   .baseBlock = 0x03c4
	@ }
	.byte 0, 0, 18, 30, 2, 15
	.2byte 0x0388
	@ {
	@   .bg = 0,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 18,
	@   .width = 30,
	@   .height = 2,
	@   .paletteNum = 15,
	@   .baseBlock = 0x0388
	@ }
	.byte 255, 0, 0, 0, 0, 0
	.2byte 0x0000
	@ {
	@   .bg = 255,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 0,
	@   .height = 0,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_8451EE4:: @ 8451EE4 PokedexScreenData
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	.byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

gUnknown_8451F54:: @ 8451F54 WindowTemplate
	.byte 1, 1, 2, 20, 16, 0
	.2byte 0x0008
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 1,
	@   .tilemapTop = 2,
	@   .width = 20,
	@   .height = 16,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0008
	@ }

gUnknown_8451F5C:: @ 8451F5C WindowTemplate
	.byte 1, 21, 11, 8, 6, 1
	.2byte 0x0148
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 11,
	@   .width = 8,
	@   .height = 6,
	@   .paletteNum = 1,
	@   .baseBlock = 0x0148
	@ }

gUnknown_8451F64:: @ 8451F64 WindowTemplate
	.byte 1, 21, 2, 9, 9, 0
	.2byte 0x0178
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 2,
	@   .width = 9,
	@   .height = 9,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0178
	@ }

gUnknown_8451F6C::
	.4byte gUnknown_8415EFB, -3
	.4byte gUnknown_8415E95, 9
	.4byte gUnknown_8415DE0, -3
	.4byte gUnknown_8415DF7, 0
	.4byte gUnknown_8415E09, 1
	.4byte gUnknown_8415E18, 2
	.4byte gUnknown_8415E2D, 3
	.4byte gUnknown_8415E39, 4
	.4byte gUnknown_8415E46, 5
	.4byte gUnknown_8415E57, 6
	.4byte gUnknown_8415E6D, 7
	.4byte gUnknown_8415E7B, 8
	.4byte gUnknown_8415E88, -3
	.4byte gUnknown_8415EA4, 10
	.4byte gUnknown_8415ED5, 11
	.4byte gUnknown_8415EDF, 12
	.4byte gUnknown_8415EED, 13
	.4byte gUnknown_8415EB0, -3
	.4byte gUnknown_8415EC7, -2

gUnknown_8452004:: @ 8452004 ListMenuTemplate
	.4byte gUnknown_8451F6C
	.4byte sub_8102EC0
	.4byte sub_8102F48
	.2byte 19, 9
	.byte 0, 0, 12, 4
	.byte 0x12, 0x30, 0x01, 0x02

gUnknown_845201C::
	.4byte gUnknown_8415EFB, -3
	.4byte gUnknown_8415F0E, 9
	.4byte gUnknown_8415F24, 14
	.4byte gUnknown_8415DE0, -3
	.4byte gUnknown_8415DF7, 0
	.4byte gUnknown_8415E09, 1
	.4byte gUnknown_8415E18, 2
	.4byte gUnknown_8415E2D, 3
	.4byte gUnknown_8415E39, 4
	.4byte gUnknown_8415E46, 5
	.4byte gUnknown_8415E57, 6
	.4byte gUnknown_8415E6D, 7
	.4byte gUnknown_8415E7B, 8
	.4byte gUnknown_8415E88, -3
	.4byte gUnknown_8415EA4, 10
	.4byte gUnknown_8415ED5, 11
	.4byte gUnknown_8415EDF, 12
	.4byte gUnknown_8415EED, 13
	.4byte gUnknown_8415EB0, -3
	.4byte gUnknown_8415EC7, -2

gUnknown_84520BC:: @ 84520BC ListMenuTemplate
	.4byte gUnknown_845201C
	.4byte sub_8102EC0
	.4byte sub_8102F48
	.2byte 20, 9
	.byte 0, 0, 12, 4
	.byte 0x12, 0x30, 0x01, 0x02

gUnknown_84520D4:: @ 84520D4 ScrollArrowsTemplate
	.byte 2, 200, 19, 3, 200, 141
	.2byte 0, 10, 2000, 65535
	.byte 1
	.align 2

gUnknown_84520E4:: @ 84520E4 ScrollArrowsTemplate
	.byte 2, 200, 19, 3, 200, 141
	.2byte 0, 11, 2000, 65535
	.byte 1
	.align 2

gUnknown_84520F4:: @ 84520F4 struct { dataptr; dataptr; }
	.4byte gUnknown_84414BC, gUnknown_84434A0
	.4byte gUnknown_844112C, gUnknown_8443480
	.4byte gUnknown_8442838, gUnknown_8443580
	.4byte gUnknown_8442004, gUnknown_8443520
	.4byte gUnknown_84408E0, gUnknown_8443420
	.4byte gUnknown_8441A40, gUnknown_84434E0
	.4byte gUnknown_84424E4, gUnknown_8443560
	.4byte gUnknown_8440BD8, gUnknown_8443440
	.4byte gUnknown_8441D54, gUnknown_8443500
	.4byte gUnknown_844223C, gUnknown_8443540
	.4byte gUnknown_8E9C16C, gUnknown_8E9C14C
	.4byte gUnknown_8442BC0, gUnknown_84435A0
	.4byte gUnknown_8442EF8, gUnknown_84435C0
	.4byte gUnknown_844318C, gUnknown_84435E0
	.4byte gUnknown_844223C, gUnknown_8443540

gUnknown_845216C:: @ 845216C WindowTemplate
	.byte 1, 2, 2, 23, 16, 0
	.2byte 0x0008
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 2,
	@   .width = 23,
	@   .height = 16,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0008
	@ }

gUnknown_8452174:: @ 8452174 ListMenuTemplate
	.4byte gUnknown_8451F6C
	.4byte ListMenuDefaultCursorMoveFunc
	.4byte sub_8103A40
	.2byte 0, 9
	.byte 0, 0, 56, 4
	.byte 0x12, 0x30, 0x41, 0x02

gUnknown_845218C:: @ 845218C ListMenuWindowRect
	.byte 0x00, 0x00, 0x05, 0x10, 0x00, 0x00, 0x00, 0x00

gUnknown_8452194::
	.incbin "baserom.gba", 0x452194, 0x20

gUnknown_84521B4:: @ 84521B4 ScrollArrowsTemplate
	.byte 2, 200, 19, 3, 200, 141
	.2byte 0, 0, 2000, 65535
	.byte 1
	.align 2

gUnknown_84521C4:: @ 84521C4 WindowTemplate
	.byte 2, 0, 0, 8, 8, 0
	.2byte 0x0000
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 8,
	@   .height = 8,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_84521CC:: @ 84521CC WindowTemplate
	.byte 1, 0, 0, 8, 5, 0
	.2byte 0x0000
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 0,
	@   .width = 8,
	@   .height = 5,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0000
	@ }

gUnknown_84521D4:: @ 84521D4 WindowTemplate
	.byte 1, 19, 3, 8, 8, 9
	.2byte 0x01a8
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 19,
	@   .tilemapTop = 3,
	@   .width = 8,
	@   .height = 8,
	@   .paletteNum = 9,
	@   .baseBlock = 0x01a8
	@ }

gUnknown_84521DC:: @ 84521DC WindowTemplate
	.byte 1, 2, 3, 13, 8, 0
	.2byte 0x01e8
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 3,
	@   .width = 13,
	@   .height = 8,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01e8
	@ }

gUnknown_84521E4:: @ 84521E4 WindowTemplate
	.byte 1, 0, 11, 30, 7, 0
	.2byte 0x0250
	@ {
	@   .bg = 1,
	@   .tilemapLeft = 0,
	@   .tilemapTop = 11,
	@   .width = 30,
	@   .height = 7,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0250
	@ }

gUnknown_84521EC:: @ 84521EC WindowTemplate
	.byte 2, 1, 2, 4, 4, 10
	.2byte 0x01a8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 1,
	@   .tilemapTop = 2,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 10,
	@   .baseBlock = 0x01a8
	@ }

gUnknown_84521F4:: @ 84521F4 WindowTemplate
	.byte 2, 5, 2, 8, 3, 0
	.2byte 0x01b8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 5,
	@   .tilemapTop = 2,
	@   .width = 8,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01b8
	@ }

gUnknown_84521FC:: @ 84521FC WindowTemplate
	.byte 2, 2, 7, 10, 2, 0
	.2byte 0x01d0
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 2,
	@   .tilemapTop = 7,
	@   .width = 10,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01d0
	@ }

gUnknown_8452204:: @ 8452204 WindowTemplate
	.byte 2, 18, 2, 10, 2, 0
	.2byte 0x01e4
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 18,
	@   .tilemapTop = 2,
	@   .width = 10,
	@   .height = 2,
	@   .paletteNum = 0,
	@   .baseBlock = 0x01e4
	@ }

gUnknown_845220C:: @ 845220C WindowTemplate
	.byte 2, 5, 5, 8, 2, 11
	.2byte 0x01f8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 5,
	@   .tilemapTop = 5,
	@   .width = 8,
	@   .height = 2,
	@   .paletteNum = 11,
	@   .baseBlock = 0x01f8
	@ }

gUnknown_8452214:: @ 8452214 WindowTemplate
	.byte 2, 17, 4, 12, 9, 0
	.2byte 0x0208
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 17,
	@   .tilemapTop = 4,
	@   .width = 12,
	@   .height = 9,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0208
	@ }

gUnknown_845221C::
	.byte 2, 13, 4, 4, 3, 0
	.2byte 0x0274
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 4,
	@   .width = 4,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0274
	@ }

gUnknown_8452224::
	.byte 2, 13, 7, 4, 3, 0
	.2byte 0x0280
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 7,
	@   .width = 4,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0280
	@ }

gUnknown_845222C::
	.byte 2, 13, 10, 4, 3, 0
	.2byte 0x028c
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 10,
	@   .width = 4,
	@   .height = 3,
	@   .paletteNum = 0,
	@   .baseBlock = 0x028c
	@ }

gUnknown_8452234::
	.byte 2, 13, 13, 4, 4, 0
	.2byte 0x0298
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 13,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x0298
	@ }

gUnknown_845223C::
	.byte 2, 17, 13, 4, 4, 0
	.2byte 0x02a8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 17,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x02a8
	@ }

gUnknown_8452244::
	.byte 2, 21, 13, 4, 4, 0
	.2byte 0x02b8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 21,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x02b8
	@ }

gUnknown_845224C::
	.byte 2, 25, 13, 4, 4, 0
	.2byte 0x02c8
	@ {
	@   .bg = 2,
	@   .tilemapLeft = 25,
	@   .tilemapTop = 13,
	@   .width = 4,
	@   .height = 4,
	@   .paletteNum = 0,
	@   .baseBlock = 0x02c8
	@ }

gUnknown_8452254:: @ 8452254 struct { dataptr; dataptr; }
	.4byte gUnknown_845221C, gUnknown_8443910
	.4byte gUnknown_8452224, gUnknown_8443988
	.4byte gUnknown_845222C, gUnknown_84439FC
	.4byte gUnknown_8452234, gUnknown_8443A78
	.4byte gUnknown_845223C, gUnknown_8443AF8
	.4byte gUnknown_8452244, gUnknown_8443BB0
	.4byte gUnknown_845224C, gUnknown_8443C54

gUnknown_845228C:: @ 845228C bin
	.incbin "baserom.gba", 0x45228C, 0x80

gUnknown_845230C::
	.incbin "baserom.gba", 0x45230C, 0x4

gUnknown_8452310::
	.incbin "baserom.gba", 0x452310, 0x8

gUnknown_8452318::
	.incbin "baserom.gba", 0x452318, 0xC

gUnknown_8452324::
	.incbin "baserom.gba", 0x452324, 0x10

gUnknown_8452334:: @ 8452334 dataptr
	.4byte gUnknown_845230C
	.4byte gUnknown_8452310
	.4byte gUnknown_8452318
	.4byte gUnknown_8452324

gUnknown_8452344:: @ 8452344 dataptr
	.4byte gUnknown_8415DF7
	.4byte gUnknown_8415E09
	.4byte gUnknown_8415E18
	.4byte gUnknown_8415E2D
	.4byte gUnknown_8415E39
	.4byte gUnknown_8415E46
	.4byte gUnknown_8415E57
	.4byte gUnknown_8415E6D
	.4byte gUnknown_8415E7B

gUnknown_8452368:: @ 8452368 gbapal
	.incbin "baserom.gba", 0x452368, 0x20

gUnknown_8452388:: @ 8452388 data16
	.incbin "baserom.gba", 0x452388, 0x12C

gUnknown_84524B4:: @ 84524B4 ScrollArrowsTemplate
	.byte 0, 16, 80, 1, 224, 80
	.2byte 0, 0, 2000, 65535
	.byte 1
	.align 2

gUnknown_84524C4:: @ 84524C4 CursorStruct
	.byte 0, 160
	.2byte 64, 40, 2002, 65535
	.byte 4, 0

gUnknown_84524D0:: @ 84524D0
	.2byte SPECIES_RATTATA
	.2byte SPECIES_RATICATE
	.2byte SPECIES_SENTRET
	.2byte SPECIES_FURRET

gUnknown_84524D8:: @ 84524D8
	.2byte SPECIES_ZIGZAGOON
	.2byte SPECIES_LINOONE
	.2byte SPECIES_POOCHYENA
	.2byte SPECIES_MIGHTYENA

gUnknown_84524E0:: @ 84524E0
	.2byte SPECIES_NIDORAN_F
	.2byte SPECIES_NIDORINA
	.2byte SPECIES_NIDOQUEEN

gUnknown_84524E6:: @ 84524E6
	.2byte SPECIES_NIDORAN_M
	.2byte SPECIES_NIDORINO
	.2byte SPECIES_NIDOKING

gUnknown_84524EC:: @ 84524EC
	.2byte SPECIES_DODUO
	.2byte SPECIES_DODRIO
	.2byte SPECIES_TAILLOW
	.2byte SPECIES_SWELLOW

gUnknown_84524F4:: @ 84524F4
	.2byte SPECIES_TANGELA
	.2byte SPECIES_ROSELIA
	.2byte SPECIES_SUNKERN
	.2byte SPECIES_SUNFLORA

gUnknown_84524FC:: @ 84524FC
	.2byte SPECIES_HOPPIP
	.2byte SPECIES_SKIPLOOM
	.2byte SPECIES_JUMPLUFF

gUnknown_8452502:: @ 8452502
	.2byte SPECIES_ODDISH
	.2byte SPECIES_GLOOM
	.2byte SPECIES_VILEPLUME
	.2byte SPECIES_BELLOSSOM

gUnknown_845250A:: @ 845250A
	.2byte SPECIES_EKANS
	.2byte SPECIES_ARBOK

gUnknown_845250E:: @ 845250E
	.2byte SPECIES_IGGLYBUFF
	.2byte SPECIES_JIGGLYPUFF
	.2byte SPECIES_WIGGLYTUFF

gUnknown_8452514:: @ 8452514
	.2byte SPECIES_MAREEP
	.2byte SPECIES_FLAAFFY
	.2byte SPECIES_AMPHAROS

gUnknown_845251A:: @ 845251A
	.2byte SPECIES_FARFETCHD
	.2byte SPECIES_LICKITUNG

gUnknown_845251E:: @ 845251E
	.2byte SPECIES_SCYTHER
	.2byte SPECIES_SCIZOR

gUnknown_8452522:: @ 8452522
	.2byte SPECIES_DROWZEE
	.2byte SPECIES_HYPNO
	.2byte SPECIES_GULPIN
	.2byte SPECIES_SWALOT

gUnknown_845252A:: @ 845252A
	.2byte SPECIES_KANGASKHAN
	.2byte SPECIES_GIRAFARIG

gUnknown_845252E:: @ 845252E
	.2byte SPECIES_TAUROS
	.2byte SPECIES_MILTANK

gUnknown_8452532:: @ 8452532
	.2byte SPECIES_VULPIX
	.2byte SPECIES_NINETALES
	.2byte SPECIES_PONYTA
	.2byte SPECIES_RAPIDASH

gUnknown_845253A:: @ 845253A
	.2byte SPECIES_ELEKID
	.2byte SPECIES_ELECTABUZZ
	.2byte SPECIES_ELECTRIKE
	.2byte SPECIES_MANECTRIC

gUnknown_8452542:: @ 8452542
	.2byte SPECIES_ZANGOOSE
	.2byte SPECIES_SEVIPER

gUnknown_8452546:: @ 8452546
	.2byte SPECIES_PLUSLE
	.2byte SPECIES_MINUN

gUnknown_845254A:: @ 845254A
	.2byte SPECIES_GROWLITHE
	.2byte SPECIES_ARCANINE

gUnknown_845254E:: @ 845254E
	.2byte SPECIES_CASTFORM
	.2byte SPECIES_CHIMECHO

gUnknown_8452552:: @ 8452552
	.2byte SPECIES_BULBASAUR
	.2byte SPECIES_IVYSAUR
	.2byte SPECIES_VENUSAUR

gUnknown_8452558:: @ 8452558
	.2byte SPECIES_CHIKORITA
	.2byte SPECIES_BAYLEEF
	.2byte SPECIES_MEGANIUM

gUnknown_845255E:: @ 845255E
	.2byte SPECIES_CYNDAQUIL
	.2byte SPECIES_QUILAVA
	.2byte SPECIES_TYPHLOSION

gUnknown_8452564:: @ 8452564
	.2byte SPECIES_TORCHIC
	.2byte SPECIES_COMBUSKEN
	.2byte SPECIES_BLAZIKEN

gUnknown_845256A:: @ 845256A
	.2byte SPECIES_RAIKOU
	.2byte SPECIES_ENTEI
	.2byte SPECIES_SUICUNE

gUnknown_8452570:: @ 8452570
	.2byte SPECIES_CATERPIE
	.2byte SPECIES_METAPOD
	.2byte SPECIES_BUTTERFREE

gUnknown_8452576:: @ 8452576
	.2byte SPECIES_WEEDLE
	.2byte SPECIES_KAKUNA
	.2byte SPECIES_BEEDRILL

gUnknown_845257C:: @ 845257C
	.2byte SPECIES_WURMPLE
	.2byte SPECIES_SILCOON
	.2byte SPECIES_BEAUTIFLY

gUnknown_8452582:: @ 8452582
	.2byte SPECIES_CASCOON
	.2byte SPECIES_DUSTOX

gUnknown_8452586:: @ 8452586
	.2byte SPECIES_PIDGEY
	.2byte SPECIES_PIDGEOTTO
	.2byte SPECIES_PIDGEOT

gUnknown_845258C:: @ 845258C
	.2byte SPECIES_HOOTHOOT
	.2byte SPECIES_NOCTOWL
	.2byte SPECIES_NATU
	.2byte SPECIES_XATU

gUnknown_8452594:: @ 8452594
	.2byte SPECIES_PICHU
	.2byte SPECIES_PIKACHU
	.2byte SPECIES_RAICHU

gUnknown_845259A:: @ 845259A
	.2byte SPECIES_BELLSPROUT
	.2byte SPECIES_WEEPINBELL
	.2byte SPECIES_VICTREEBEL

gUnknown_84525A0:: @ 84525A0
	.2byte SPECIES_PARAS
	.2byte SPECIES_PARASECT
	.2byte SPECIES_SHROOMISH
	.2byte SPECIES_BRELOOM

gUnknown_84525A8:: @ 84525A8
	.2byte SPECIES_SEEDOT
	.2byte SPECIES_NUZLEAF
	.2byte SPECIES_SHIFTRY

gUnknown_84525AE:: @ 84525AE
	.2byte SPECIES_VENONAT
	.2byte SPECIES_VENOMOTH
	.2byte SPECIES_YANMA

gUnknown_84525B4:: @ 84525B4
	.2byte SPECIES_LEDYBA
	.2byte SPECIES_LEDIAN
	.2byte SPECIES_SPINARAK
	.2byte SPECIES_ARIADOS

gUnknown_84525BC:: @ 84525BC
	.2byte SPECIES_NINCADA
	.2byte SPECIES_NINJASK
	.2byte SPECIES_SHEDINJA

gUnknown_84525C2:: @ 84525C2
	.2byte SPECIES_VOLBEAT
	.2byte SPECIES_ILLUMISE

gUnknown_84525C6:: @ 84525C6
	.2byte SPECIES_PINECO
	.2byte SPECIES_FORRETRESS

gUnknown_84525CA:: @ 84525CA
	.2byte SPECIES_SLAKOTH
	.2byte SPECIES_VIGOROTH
	.2byte SPECIES_SLAKING

gUnknown_84525D0:: @ 84525D0
	.2byte SPECIES_SKITTY
	.2byte SPECIES_DELCATTY

gUnknown_84525D4:: @ 84525D4
	.2byte SPECIES_MURKROW
	.2byte SPECIES_SNEASEL

gUnknown_84525D8:: @ 84525D8
	.2byte SPECIES_EXEGGCUTE
	.2byte SPECIES_EXEGGUTOR
	.2byte SPECIES_SUDOWOODO

gUnknown_84525DE:: @ 84525DE
	.2byte SPECIES_AIPOM
	.2byte SPECIES_STANTLER
	.2byte SPECIES_KECLEON

gUnknown_84525E4:: @ 84525E4
	.2byte SPECIES_PINSIR
	.2byte SPECIES_HERACROSS

gUnknown_84525E8:: @ 84525E8
	.2byte SPECIES_SWABLU
	.2byte SPECIES_ALTARIA
	.2byte SPECIES_TROPIUS

gUnknown_84525EE:: @ 84525EE
	.2byte SPECIES_DUSKULL
	.2byte SPECIES_DUSCLOPS

gUnknown_84525F2:: @ 84525F2
	.2byte SPECIES_TOGEPI
	.2byte SPECIES_TOGETIC

gUnknown_84525F6:: @ 84525F6
	.2byte SPECIES_TREECKO
	.2byte SPECIES_GROVYLE
	.2byte SPECIES_SCEPTILE

gUnknown_84525FC:: @ 84525FC
	.2byte SPECIES_CELEBI

gUnknown_84525FE:: @ 84525FE
	.2byte SPECIES_GOLDEEN
	.2byte SPECIES_SEAKING

gUnknown_8452602:: @ 8452602
	.2byte SPECIES_MAGIKARP
	.2byte SPECIES_GYARADOS
	.2byte SPECIES_KRABBY
	.2byte SPECIES_KINGLER

gUnknown_845260A:: @ 845260A
	.2byte SPECIES_CORPHISH
	.2byte SPECIES_CRAWDAUNT
	.2byte SPECIES_BARBOACH
	.2byte SPECIES_WHISCASH

gUnknown_8452612:: @ 8452612
	.2byte SPECIES_LOTAD
	.2byte SPECIES_LOMBRE
	.2byte SPECIES_LUDICOLO

gUnknown_8452618:: @ 8452618
	.2byte SPECIES_SURSKIT
	.2byte SPECIES_MASQUERAIN

gUnknown_845261C:: @ 845261C
	.2byte SPECIES_PSYDUCK
	.2byte SPECIES_GOLDUCK
	.2byte SPECIES_WOOPER
	.2byte SPECIES_QUAGSIRE

gUnknown_8452624:: @ 8452624
	.2byte SPECIES_POLIWAG
	.2byte SPECIES_POLIWHIRL
	.2byte SPECIES_POLIWRATH
	.2byte SPECIES_POLITOED

gUnknown_845262C:: @ 845262C
	.2byte SPECIES_AZURILL
	.2byte SPECIES_MARILL
	.2byte SPECIES_AZUMARILL

gUnknown_8452632:: @ 8452632
	.2byte SPECIES_SLOWPOKE
	.2byte SPECIES_SLOWBRO
	.2byte SPECIES_SLOWKING

gUnknown_8452638:: @ 8452638
	.2byte SPECIES_FEEBAS
	.2byte SPECIES_MILOTIC

gUnknown_845263C:: @ 845263C
	.2byte SPECIES_ANORITH
	.2byte SPECIES_ARMALDO

gUnknown_8452640:: @ 8452640
	.2byte SPECIES_DRATINI
	.2byte SPECIES_DRAGONAIR
	.2byte SPECIES_DRAGONITE

gUnknown_8452646:: @ 8452646
	.2byte SPECIES_SQUIRTLE
	.2byte SPECIES_WARTORTLE
	.2byte SPECIES_BLASTOISE

gUnknown_845264C:: @ 845264C
	.2byte SPECIES_TOTODILE
	.2byte SPECIES_CROCONAW
	.2byte SPECIES_FERALIGATR

gUnknown_8452652:: @ 8452652
	.2byte SPECIES_MUDKIP
	.2byte SPECIES_MARSHTOMP
	.2byte SPECIES_SWAMPERT

gUnknown_8452658:: @ 8452658
	.2byte SPECIES_LATIAS
	.2byte SPECIES_LATIOS

gUnknown_845265C:: @ 845265C
	.2byte SPECIES_TENTACOOL
	.2byte SPECIES_TENTACRUEL

gUnknown_8452660:: @ 8452660
	.2byte SPECIES_WINGULL
	.2byte SPECIES_PELIPPER

gUnknown_8452664:: @ 8452664
	.2byte SPECIES_STARYU
	.2byte SPECIES_STARMIE

gUnknown_8452668:: @ 8452668
	.2byte SPECIES_CHINCHOU
	.2byte SPECIES_LANTURN
	.2byte SPECIES_REMORAID
	.2byte SPECIES_OCTILLERY

gUnknown_8452670:: @ 8452670
	.2byte SPECIES_SHELLDER
	.2byte SPECIES_CLOYSTER

gUnknown_8452674:: @ 8452674
	.2byte SPECIES_CLAMPERL
	.2byte SPECIES_HUNTAIL
	.2byte SPECIES_GOREBYSS

gUnknown_845267A:: @ 845267A
	.2byte SPECIES_QWILFISH
	.2byte SPECIES_CORSOLA
	.2byte SPECIES_MANTINE
	.2byte SPECIES_LUVDISC

gUnknown_8452682:: @ 8452682
	.2byte SPECIES_SEEL
	.2byte SPECIES_DEWGONG

gUnknown_8452686:: @ 8452686
	.2byte SPECIES_SPHEAL
	.2byte SPECIES_SEALEO
	.2byte SPECIES_WALREIN

gUnknown_845268C:: @ 845268C
	.2byte SPECIES_CARVANHA
	.2byte SPECIES_SHARPEDO
	.2byte SPECIES_WAILMER
	.2byte SPECIES_WAILORD

gUnknown_8452694:: @ 8452694
	.2byte SPECIES_HORSEA
	.2byte SPECIES_SEADRA
	.2byte SPECIES_KINGDRA

gUnknown_845269A:: @ 845269A
	.2byte SPECIES_RELICANTH

gUnknown_845269C:: @ 845269C
	.2byte SPECIES_LAPRAS

gUnknown_845269E:: @ 845269E
	.2byte SPECIES_OMANYTE
	.2byte SPECIES_OMASTAR
	.2byte SPECIES_KABUTO
	.2byte SPECIES_KABUTOPS

gUnknown_84526A6:: @ 84526A6
	.2byte SPECIES_LILEEP
	.2byte SPECIES_CRADILY

gUnknown_84526AA:: @ 84526AA
	.2byte SPECIES_KYOGRE

gUnknown_84526AC:: @ 84526AC
	.2byte SPECIES_ZUBAT
	.2byte SPECIES_GOLBAT
	.2byte SPECIES_CROBAT

gUnknown_84526B2:: @ 84526B2
	.2byte SPECIES_DIGLETT
	.2byte SPECIES_DUGTRIO
	.2byte SPECIES_ONIX
	.2byte SPECIES_STEELIX

gUnknown_84526BA:: @ 84526BA
	.2byte SPECIES_SWINUB
	.2byte SPECIES_PILOSWINE
	.2byte SPECIES_SNORUNT
	.2byte SPECIES_GLALIE

gUnknown_84526C2:: @ 84526C2
	.2byte SPECIES_WHISMUR
	.2byte SPECIES_LOUDRED
	.2byte SPECIES_EXPLOUD

gUnknown_84526C8:: @ 84526C8
	.2byte SPECIES_MISDREAVUS
	.2byte SPECIES_DUNSPARCE
	.2byte SPECIES_NOSEPASS

gUnknown_84526CE:: @ 84526CE
	.2byte SPECIES_SABLEYE
	.2byte SPECIES_MAWILE

gUnknown_84526D2:: @ 84526D2
	.2byte SPECIES_GASTLY
	.2byte SPECIES_HAUNTER
	.2byte SPECIES_GENGAR

gUnknown_84526D8:: @ 84526D8
	.2byte SPECIES_WYNAUT
	.2byte SPECIES_WOBBUFFET

gUnknown_84526DC:: @ 84526DC
	.2byte SPECIES_LUNATONE
	.2byte SPECIES_SOLROCK

gUnknown_84526E0:: @ 84526E0
	.2byte SPECIES_REGIROCK
	.2byte SPECIES_REGICE
	.2byte SPECIES_REGISTEEL

gUnknown_84526E6:: @ 84526E6
	.2byte SPECIES_GEODUDE
	.2byte SPECIES_GRAVELER
	.2byte SPECIES_GOLEM

gUnknown_84526EC:: @ 84526EC
	.2byte SPECIES_MANKEY
	.2byte SPECIES_PRIMEAPE
	.2byte SPECIES_SPOINK
	.2byte SPECIES_GRUMPIG

gUnknown_84526F4:: @ 84526F4
	.2byte SPECIES_MACHOP
	.2byte SPECIES_MACHOKE
	.2byte SPECIES_MACHAMP

gUnknown_84526FA:: @ 84526FA
	.2byte SPECIES_CLEFFA
	.2byte SPECIES_CLEFAIRY
	.2byte SPECIES_CLEFABLE

gUnknown_8452700:: @ 8452700
	.2byte SPECIES_CUBONE
	.2byte SPECIES_MAROWAK

gUnknown_8452704:: @ 8452704
	.2byte SPECIES_SLUGMA
	.2byte SPECIES_MAGCARGO
	.2byte SPECIES_NUMEL
	.2byte SPECIES_CAMERUPT

gUnknown_845270C:: @ 845270C
	.2byte SPECIES_MAKUHITA
	.2byte SPECIES_HARIYAMA
	.2byte SPECIES_MEDITITE
	.2byte SPECIES_MEDICHAM

gUnknown_8452714:: @ 8452714
	.2byte SPECIES_SHUCKLE
	.2byte SPECIES_TEDDIURSA
	.2byte SPECIES_URSARING
	.2byte SPECIES_DELIBIRD

gUnknown_845271C:: @ 845271C
	.2byte SPECIES_GLIGAR
	.2byte SPECIES_SPINDA

gUnknown_8452720:: @ 8452720
	.2byte SPECIES_MAGBY
	.2byte SPECIES_MAGMAR
	.2byte SPECIES_TORKOAL

gUnknown_8452726:: @ 8452726
	.2byte SPECIES_ARON
	.2byte SPECIES_LAIRON
	.2byte SPECIES_AGGRON

gUnknown_845272C:: @ 845272C
	.2byte SPECIES_LARVITAR
	.2byte SPECIES_PUPITAR
	.2byte SPECIES_TYRANITAR

gUnknown_8452732:: @ 8452732
	.2byte SPECIES_SNORLAX

gUnknown_8452734:: @ 8452734
	.2byte SPECIES_ABSOL

gUnknown_8452736:: @ 8452736
	.2byte SPECIES_AERODACTYL

gUnknown_8452738:: @ 8452738
	.2byte SPECIES_CHARMANDER
	.2byte SPECIES_CHARMELEON
	.2byte SPECIES_CHARIZARD

gUnknown_845273E:: @ 845273E
	.2byte SPECIES_JIRACHI

gUnknown_8452740:: @ 8452740
	.2byte SPECIES_SPEAROW
	.2byte SPECIES_FEAROW

gUnknown_8452744:: @ 8452744
	.2byte SPECIES_SANDSHREW
	.2byte SPECIES_SANDSLASH
	.2byte SPECIES_RHYHORN
	.2byte SPECIES_RHYDON

gUnknown_845274C:: @ 845274C
	.2byte SPECIES_MAGNEMITE
	.2byte SPECIES_MAGNETON

gUnknown_8452750:: @ 8452750
	.2byte SPECIES_HOUNDOUR
	.2byte SPECIES_HOUNDOOM
	.2byte SPECIES_PHANPY
	.2byte SPECIES_DONPHAN

gUnknown_8452758:: @ 8452758
	.2byte SPECIES_CACNEA
	.2byte SPECIES_CACTURNE

gUnknown_845275C:: @ 845275C
	.2byte SPECIES_TRAPINCH
	.2byte SPECIES_VIBRAVA
	.2byte SPECIES_FLYGON

gUnknown_8452762:: @ 8452762
	.2byte SPECIES_SKARMORY

gUnknown_8452764:: @ 8452764
	.2byte SPECIES_BALTOY
	.2byte SPECIES_CLAYDOL

gUnknown_8452768:: @ 8452768
	.2byte SPECIES_BAGON
	.2byte SPECIES_SHELGON
	.2byte SPECIES_SALAMENCE

gUnknown_845276E:: @ 845276E
	.2byte SPECIES_BELDUM
	.2byte SPECIES_METANG
	.2byte SPECIES_METAGROSS

gUnknown_8452774:: @ 8452774
	.2byte SPECIES_GROUDON

gUnknown_8452776:: @ 8452776
	.2byte SPECIES_MEOWTH
	.2byte SPECIES_PERSIAN
	.2byte SPECIES_SNUBBULL
	.2byte SPECIES_GRANBULL

gUnknown_845277E:: @ 845277E
	.2byte SPECIES_GRIMER
	.2byte SPECIES_MUK
	.2byte SPECIES_KOFFING
	.2byte SPECIES_WEEZING

gUnknown_8452786:: @ 8452786
	.2byte SPECIES_SHUPPET
	.2byte SPECIES_BANETTE

gUnknown_845278A:: @ 845278A
	.2byte SPECIES_ABRA
	.2byte SPECIES_KADABRA
	.2byte SPECIES_ALAKAZAM

gUnknown_8452790:: @ 8452790
	.2byte SPECIES_RALTS
	.2byte SPECIES_KIRLIA
	.2byte SPECIES_GARDEVOIR

gUnknown_8452796:: @ 8452796
	.2byte SPECIES_SMOOCHUM
	.2byte SPECIES_JYNX
	.2byte SPECIES_MR_MIME
	.2byte SPECIES_SMEARGLE

gUnknown_845279E:: @ 845279E
	.2byte SPECIES_TYROGUE
	.2byte SPECIES_HITMONLEE
	.2byte SPECIES_HITMONCHAN
	.2byte SPECIES_HITMONTOP

gUnknown_84527A6:: @ 84527A6
	.2byte SPECIES_CHANSEY
	.2byte SPECIES_BLISSEY

gUnknown_84527AA:: @ 84527AA
	.2byte SPECIES_VOLTORB
	.2byte SPECIES_ELECTRODE
	.2byte SPECIES_PORYGON
	.2byte SPECIES_PORYGON2

gUnknown_84527B2:: @ 84527B2
	.2byte SPECIES_DITTO

gUnknown_84527B4:: @ 84527B4
	.2byte SPECIES_EEVEE
	.2byte SPECIES_VAPOREON
	.2byte SPECIES_JOLTEON
	.2byte SPECIES_FLAREON

gUnknown_84527BC:: @ 84527BC
	.2byte SPECIES_ESPEON
	.2byte SPECIES_UMBREON

gUnknown_84527C0:: @ 84527C0
	.2byte SPECIES_UNOWN

gUnknown_84527C2:: @ 84527C2
	.2byte SPECIES_ARTICUNO
	.2byte SPECIES_ZAPDOS
	.2byte SPECIES_MOLTRES

gUnknown_84527C8:: @ 84527C8
	.2byte SPECIES_LUGIA

gUnknown_84527CA:: @ 84527CA
	.2byte SPECIES_HO_OH

gUnknown_84527CC:: @ 84527CC
	.2byte SPECIES_RAYQUAZA

gUnknown_84527CE:: @ 84527CE
	.2byte SPECIES_DEOXYS

gUnknown_84527D0:: @ 84527D0
	.2byte SPECIES_MEWTWO

gUnknown_84527D2:: @ 84527D2
	.2byte SPECIES_MEW

gUnknown_84527D4::
	.4byte gUnknown_84524D0, 4
	.4byte gUnknown_84524D8, 4
	.4byte gUnknown_84524E0, 3
	.4byte gUnknown_84524E6, 3
	.4byte gUnknown_84524EC, 4
	.4byte gUnknown_84524F4, 4
	.4byte gUnknown_84524FC, 3
	.4byte gUnknown_8452502, 4
	.4byte gUnknown_845250A, 2
	.4byte gUnknown_845250E, 3
	.4byte gUnknown_8452514, 3
	.4byte gUnknown_845251A, 2
	.4byte gUnknown_845251E, 2
	.4byte gUnknown_8452522, 4
	.4byte gUnknown_845252A, 2
	.4byte gUnknown_845252E, 2
	.4byte gUnknown_8452532, 4
	.4byte gUnknown_845253A, 4
	.4byte gUnknown_8452542, 2
	.4byte gUnknown_8452546, 2
	.4byte gUnknown_845254A, 2
	.4byte gUnknown_845254E, 2
	.4byte gUnknown_8452552, 3
	.4byte gUnknown_8452558, 3
	.4byte gUnknown_845255E, 3
	.4byte gUnknown_8452564, 3
	.4byte gUnknown_845256A, 3

gUnknown_84528AC::
	.4byte gUnknown_8452570, 3
	.4byte gUnknown_8452576, 3
	.4byte gUnknown_845257C, 3
	.4byte gUnknown_8452582, 2
	.4byte gUnknown_8452586, 3
	.4byte gUnknown_845258C, 4
	.4byte gUnknown_8452594, 3
	.4byte gUnknown_845259A, 3
	.4byte gUnknown_84525A0, 4
	.4byte gUnknown_84525A8, 3
	.4byte gUnknown_84525AE, 3
	.4byte gUnknown_84525B4, 4
	.4byte gUnknown_84525BC, 3
	.4byte gUnknown_84525C2, 2
	.4byte gUnknown_84525C6, 2
	.4byte gUnknown_84525CA, 3
	.4byte gUnknown_84525D0, 2
	.4byte gUnknown_84525D4, 2
	.4byte gUnknown_84525D8, 3
	.4byte gUnknown_84525DE, 3
	.4byte gUnknown_84525E4, 2
	.4byte gUnknown_84525E8, 3
	.4byte gUnknown_84525EE, 2
	.4byte gUnknown_84525F2, 2
	.4byte gUnknown_84525F6, 3
	.4byte gUnknown_84525FC, 1

gUnknown_845297C::
	.4byte gUnknown_84525FE, 2
	.4byte gUnknown_8452602, 4
	.4byte gUnknown_845260A, 4
	.4byte gUnknown_8452612, 3
	.4byte gUnknown_8452618, 2
	.4byte gUnknown_845261C, 4
	.4byte gUnknown_8452624, 4
	.4byte gUnknown_845262C, 3
	.4byte gUnknown_8452632, 3
	.4byte gUnknown_8452638, 2
	.4byte gUnknown_845263C, 2
	.4byte gUnknown_8452640, 3
	.4byte gUnknown_8452646, 3
	.4byte gUnknown_845264C, 3
	.4byte gUnknown_8452652, 3
	.4byte gUnknown_8452658, 2

gUnknown_84529FC::
	.4byte gUnknown_845265C, 2
	.4byte gUnknown_8452660, 2
	.4byte gUnknown_8452664, 2
	.4byte gUnknown_8452668, 4
	.4byte gUnknown_8452670, 2
	.4byte gUnknown_8452674, 3
	.4byte gUnknown_845267A, 4
	.4byte gUnknown_8452682, 2
	.4byte gUnknown_8452686, 3
	.4byte gUnknown_845268C, 4
	.4byte gUnknown_8452694, 3
	.4byte gUnknown_845269A, 1
	.4byte gUnknown_845269C, 1
	.4byte gUnknown_845269E, 4
	.4byte gUnknown_84526A6, 2
	.4byte gUnknown_84526AA, 1

gUnknown_8452A7C::
	.4byte gUnknown_84526AC, 3
	.4byte gUnknown_84526B2, 4
	.4byte gUnknown_84526BA, 4
	.4byte gUnknown_84526C2, 3
	.4byte gUnknown_84526C8, 3
	.4byte gUnknown_84526CE, 2
	.4byte gUnknown_84526D2, 3
	.4byte gUnknown_84526D8, 2
	.4byte gUnknown_84526DC, 2
	.4byte gUnknown_84526E0, 3

gUnknown_8452ACC::
	.4byte gUnknown_84526E6, 3
	.4byte gUnknown_84526EC, 4
	.4byte gUnknown_84526F4, 3
	.4byte gUnknown_84526FA, 3
	.4byte gUnknown_8452700, 2
	.4byte gUnknown_8452704, 4
	.4byte gUnknown_845270C, 4
	.4byte gUnknown_8452714, 4
	.4byte gUnknown_845271C, 2
	.4byte gUnknown_8452720, 3
	.4byte gUnknown_8452726, 3
	.4byte gUnknown_845272C, 3
	.4byte gUnknown_8452732, 1
	.4byte gUnknown_8452734, 1
	.4byte gUnknown_8452736, 1
	.4byte gUnknown_8452738, 3
	.4byte gUnknown_845273E, 1

gUnknown_8452B54::
	.4byte gUnknown_8452740, 2
	.4byte gUnknown_8452744, 4
	.4byte gUnknown_845274C, 2
	.4byte gUnknown_8452750, 4
	.4byte gUnknown_8452758, 2
	.4byte gUnknown_845275C, 3
	.4byte gUnknown_8452762, 1
	.4byte gUnknown_8452764, 2
	.4byte gUnknown_8452768, 3
	.4byte gUnknown_845276E, 3
	.4byte gUnknown_8452774, 1

gUnknown_8452BAC::
	.4byte gUnknown_8452776, 4
	.4byte gUnknown_845277E, 4
	.4byte gUnknown_8452786, 2
	.4byte gUnknown_845278A, 3
	.4byte gUnknown_8452790, 3
	.4byte gUnknown_8452796, 4
	.4byte gUnknown_845279E, 4
	.4byte gUnknown_84527A6, 2
	.4byte gUnknown_84527AA, 4
	.4byte gUnknown_84527B2, 1
	.4byte gUnknown_84527B4, 4
	.4byte gUnknown_84527BC, 2

gUnknown_8452C0C::
	.4byte gUnknown_84527C0, 1
	.4byte gUnknown_84527C2, 3
	.4byte gUnknown_84527C8, 1
	.4byte gUnknown_84527CA, 1
	.4byte gUnknown_84527CC, 1
	.4byte gUnknown_84527CE, 1
	.4byte gUnknown_84527D0, 1
	.4byte gUnknown_84527D2, 1

gUnknown_8452C4C:: @ 8452C4C struct { dataptr; data8; }
	.4byte gUnknown_84527D4, 27
	.4byte gUnknown_84528AC, 26
	.4byte gUnknown_845297C, 16
	.4byte gUnknown_84529FC, 16
	.4byte gUnknown_8452A7C, 10
	.4byte gUnknown_8452ACC, 17
	.4byte gUnknown_8452B54, 11
	.4byte gUnknown_8452BAC, 12
	.4byte gUnknown_8452C0C, 8
