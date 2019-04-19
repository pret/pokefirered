	.include "asm/macros/m4a.inc"
	.include "asm/macros/music_voice.inc"
	.section .rodata

voicegroup_pokemon_cry:: @ 8489C8C
	.incbin "baserom.gba", 0x489C8C, 0x2C88

gCryTable:: @ 848C914
	.incbin "baserom.gba", 0x48C914, 0x1230

gCryTable2:: @ 848DB44
	.incbin "baserom.gba", 0x48DB44, 0x1230

gUnknown_848ED74:: @ 848ED74
	.incbin "baserom.gba", 0x48ED74, 0x14528

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

gSong_86B5640:: @ 0x86B5640
	.incbin "baserom.gba", 0x6B5640, 0x20

gSong_86B5660:: @ 0x86B5660
	.incbin "baserom.gba", 0x6B5660, 0x2C

gSong_86B568C:: @ 0x86B568C
	.incbin "baserom.gba", 0x6B568C, 0x24

gSong_86B56B0:: @ 0x86B56B0
	.incbin "baserom.gba", 0x6B56B0, 0x44

gSong_86B56F4:: @ 0x86B56F4
	.incbin "baserom.gba", 0x6B56F4, 0x2C

gSong_86B5720:: @ 0x86B5720
	.incbin "baserom.gba", 0x6B5720, 0x1C

gSong_86B573C:: @ 0x86B573C
	.incbin "baserom.gba", 0x6B573C, 0x1C

gSong_86B5758:: @ 0x86B5758
	.incbin "baserom.gba", 0x6B5758, 0x1C

gSong_86B5774:: @ 0x86B5774
	.incbin "baserom.gba", 0x6B5774, 0x34

gSong_86B57A8:: @ 0x86B57A8
	.incbin "baserom.gba", 0x6B57A8, 0x24

gSong_86B57CC:: @ 0x86B57CC
	.incbin "baserom.gba", 0x6B57CC, 0x1C

gSong_86B57E8:: @ 0x86B57E8
	.incbin "baserom.gba", 0x6B57E8, 0x2C

gSong_86B5814:: @ 0x86B5814
	.incbin "baserom.gba", 0x6B5814, 0x4C

gSong_86B5860:: @ 0x86B5860
	.incbin "baserom.gba", 0x6B5860, 0x7C

gSong_86B58DC:: @ 0x86B58DC
	.incbin "baserom.gba", 0x6B58DC, 0x54

gSong_86B5930:: @ 0x86B5930
	.incbin "baserom.gba", 0x6B5930, 0x54

gSong_86B5984:: @ 0x86B5984
	.incbin "baserom.gba", 0x6B5984, 0x50

gSong_86B59D4:: @ 0x86B59D4
	.incbin "baserom.gba", 0x6B59D4, 0x1C

gSong_86B59F0:: @ 0x86B59F0
	.incbin "baserom.gba", 0x6B59F0, 0x54

gSong_86B5A44:: @ 0x86B5A44
	.incbin "baserom.gba", 0x6B5A44, 0x48

gSong_86B5A8C:: @ 0x86B5A8C
	.incbin "baserom.gba", 0x6B5A8C, 0x2C

gSong_86B5AB8:: @ 0x86B5AB8
	.incbin "baserom.gba", 0x6B5AB8, 0x24

gSong_86B5ADC:: @ 0x86B5ADC
	.incbin "baserom.gba", 0x6B5ADC, 0x24

gSong_86B5B00:: @ 0x86B5B00
	.incbin "baserom.gba", 0x6B5B00, 0x84

gSong_86B5B84:: @ 0x86B5B84
	.incbin "baserom.gba", 0x6B5B84, 0x2C

gSong_86B5BB0:: @ 0x86B5BB0
	.incbin "baserom.gba", 0x6B5BB0, 0x30

gSong_86B5BE0:: @ 0x86B5BE0
	.incbin "baserom.gba", 0x6B5BE0, 0x180

gSong_86B5D60:: @ 0x86B5D60
	.incbin "baserom.gba", 0x6B5D60, 0x24

gSong_86B5D84:: @ 0x86B5D84
	.incbin "baserom.gba", 0x6B5D84, 0x24

gSong_86B5DA8:: @ 0x86B5DA8
	.incbin "baserom.gba", 0x6B5DA8, 0x24

gSong_86B5DCC:: @ 0x86B5DCC
	.incbin "baserom.gba", 0x6B5DCC, 0x30

gSong_86B5DFC:: @ 0x86B5DFC
	.incbin "baserom.gba", 0x6B5DFC, 0x24

gSong_86B5E20:: @ 0x86B5E20
	.incbin "baserom.gba", 0x6B5E20, 0x4C

gSong_86B5E6C:: @ 0x86B5E6C
	.incbin "baserom.gba", 0x6B5E6C, 0x38

gSong_86B5EA4:: @ 0x86B5EA4
	.incbin "baserom.gba", 0x6B5EA4, 0x54

gSong_86B5EF8:: @ 0x86B5EF8
	.incbin "baserom.gba", 0x6B5EF8, 0x3C

gSong_86B5F34:: @ 0x86B5F34
	.incbin "baserom.gba", 0x6B5F34, 0x58

gSong_86B5F8C:: @ 0x86B5F8C
	.incbin "baserom.gba", 0x6B5F8C, 0x44

gSong_86B5FD0:: @ 0x86B5FD0
	.incbin "baserom.gba", 0x6B5FD0, 0x3C

gSong_86B600C:: @ 0x86B600C
	.incbin "baserom.gba", 0x6B600C, 0x40

gSong_86B604C:: @ 0x86B604C
	.incbin "baserom.gba", 0x6B604C, 0x2C

gSong_86B6078:: @ 0x86B6078
	.incbin "baserom.gba", 0x6B6078, 0x3C

gSong_86B60B4:: @ 0x86B60B4
	.incbin "baserom.gba", 0x6B60B4, 0xAC

gSong_86B6160:: @ 0x86B6160
	.incbin "baserom.gba", 0x6B6160, 0x78

gSong_86B61D8:: @ 0x86B61D8
	.incbin "baserom.gba", 0x6B61D8, 0x2C

gSong_86B6204:: @ 0x86B6204
	.incbin "baserom.gba", 0x6B6204, 0x34

gSong_86B6238:: @ 0x86B6238
	.incbin "baserom.gba", 0x6B6238, 0x2C

gSong_86B6264:: @ 0x86B6264
	.incbin "baserom.gba", 0x6B6264, 0x44

gSong_86B62A8:: @ 0x86B62A8
	.incbin "baserom.gba", 0x6B62A8, 0x2C

gSong_86B62D4:: @ 0x86B62D4
	.incbin "baserom.gba", 0x6B62D4, 0x2C

gSong_86B6300:: @ 0x86B6300
	.incbin "baserom.gba", 0x6B6300, 0x2C

gSong_86B632C:: @ 0x86B632C
	.incbin "baserom.gba", 0x6B632C, 0x2C

gSong_86B6358:: @ 0x86B6358
	.incbin "baserom.gba", 0x6B6358, 0x54

gSong_86B63AC:: @ 0x86B63AC
	.incbin "baserom.gba", 0x6B63AC, 0x44

gSong_86B63F0:: @ 0x86B63F0
	.incbin "baserom.gba", 0x6B63F0, 0x34

gSong_86B6424:: @ 0x86B6424
	.incbin "baserom.gba", 0x6B6424, 0x38

gSong_86B645C:: @ 0x86B645C
	.incbin "baserom.gba", 0x6B645C, 0x38

gSong_86B6494:: @ 0x86B6494
	.incbin "baserom.gba", 0x6B6494, 0x38

gSong_86B64CC:: @ 0x86B64CC
	.incbin "baserom.gba", 0x6B64CC, 0x38

gSong_86B6504:: @ 0x86B6504
	.incbin "baserom.gba", 0x6B6504, 0x38

gSong_86B653C:: @ 0x86B653C
	.incbin "baserom.gba", 0x6B653C, 0x38

gSong_86B6574:: @ 0x86B6574
	.incbin "baserom.gba", 0x6B6574, 0x38

gSong_86B65AC:: @ 0x86B65AC
	.incbin "baserom.gba", 0x6B65AC, 0x34

gSong_86B65E0:: @ 0x86B65E0
	.incbin "baserom.gba", 0x6B65E0, 0x24

gSong_86B6604:: @ 0x86B6604
	.incbin "baserom.gba", 0x6B6604, 0x4C

gSong_86B6650:: @ 0x86B6650
	.incbin "baserom.gba", 0x6B6650, 0x60

gSong_86B66B0:: @ 0x86B66B0
	.incbin "baserom.gba", 0x6B66B0, 0x34

gSong_86B66E4:: @ 0x86B66E4
	.incbin "baserom.gba", 0x6B66E4, 0x30

gSong_86B6714:: @ 0x86B6714
	.incbin "baserom.gba", 0x6B6714, 0x38

gSong_86B674C:: @ 0x86B674C
	.incbin "baserom.gba", 0x6B674C, 0x44

gSong_86B6790:: @ 0x86B6790
	.incbin "baserom.gba", 0x6B6790, 0x30

gSong_86B67C0:: @ 0x86B67C0
	.incbin "baserom.gba", 0x6B67C0, 0x28

gSong_86B67E8:: @ 0x86B67E8
	.incbin "baserom.gba", 0x6B67E8, 0x68

gSong_86B6850:: @ 0x86B6850
	.incbin "baserom.gba", 0x6B6850, 0x3C

gSong_86B688C:: @ 0x86B688C
	.incbin "baserom.gba", 0x6B688C, 0x40

gSong_86B68CC:: @ 0x86B68CC
	.incbin "baserom.gba", 0x6B68CC, 0x3C

gSong_86B6908:: @ 0x86B6908
	.incbin "baserom.gba", 0x6B6908, 0x40

gSong_86B6948:: @ 0x86B6948
	.incbin "baserom.gba", 0x6B6948, 0x3C

gSong_86B6984:: @ 0x86B6984
	.incbin "baserom.gba", 0x6B6984, 0x40

gSong_86B69C4:: @ 0x86B69C4
	.incbin "baserom.gba", 0x6B69C4, 0x68

gSong_86B6A2C:: @ 0x86B6A2C
	.incbin "baserom.gba", 0x6B6A2C, 0x50

gSong_86B6A7C:: @ 0x86B6A7C
	.incbin "baserom.gba", 0x6B6A7C, 0x3C

gSong_86B6AB8:: @ 0x86B6AB8
	.incbin "baserom.gba", 0x6B6AB8, 0x30

gSong_86B6AE8:: @ 0x86B6AE8
	.incbin "baserom.gba", 0x6B6AE8, 0x4C

gSong_86B6B34:: @ 0x86B6B34
	.incbin "baserom.gba", 0x6B6B34, 0x24

gSong_86B6B58:: @ 0x86B6B58
	.incbin "baserom.gba", 0x6B6B58, 0x54

gSong_86B6BAC:: @ 0x86B6BAC
	.incbin "baserom.gba", 0x6B6BAC, 0x94

gSong_86B6C40:: @ 0x86B6C40
	.incbin "baserom.gba", 0x6B6C40, 0x3C

gSong_86B6C7C:: @ 0x86B6C7C
	.incbin "baserom.gba", 0x6B6C7C, 0x24

gSong_86B6CA0:: @ 0x86B6CA0
	.incbin "baserom.gba", 0x6B6CA0, 0x64

gSong_86B6D04:: @ 0x86B6D04
	.incbin "baserom.gba", 0x6B6D04, 0x68

gSong_86B6D6C:: @ 0x86B6D6C
	.incbin "baserom.gba", 0x6B6D6C, 0x28

gSong_86B6D94:: @ 0x86B6D94
	.incbin "baserom.gba", 0x6B6D94, 0x34

gSong_86B6DC8:: @ 0x86B6DC8
	.incbin "baserom.gba", 0x6B6DC8, 0x2C

gSong_86B6DF4:: @ 0x86B6DF4
	.incbin "baserom.gba", 0x6B6DF4, 0x7C

gSong_86B6E70:: @ 0x86B6E70
	.incbin "baserom.gba", 0x6B6E70, 0xC0

gSong_86B6F30:: @ 0x86B6F30
	.incbin "baserom.gba", 0x6B6F30, 0xE8

gSong_86B7018:: @ 0x86B7018
	.incbin "baserom.gba", 0x6B7018, 0x118

gSong_86B7130:: @ 0x86B7130
	.incbin "baserom.gba", 0x6B7130, 0x24

gSong_86B7154:: @ 0x86B7154
	.incbin "baserom.gba", 0x6B7154, 0x114

gSong_86B7268:: @ 0x86B7268
	.incbin "baserom.gba", 0x6B7268, 0x2C

gSong_86B7294:: @ 0x86B7294
	.incbin "baserom.gba", 0x6B7294, 0x34

gSong_86B72C8:: @ 0x86B72C8
	.incbin "baserom.gba", 0x6B72C8, 0x64

gSong_86B732C:: @ 0x86B732C
	.incbin "baserom.gba", 0x6B732C, 0x68

gSong_86B7394:: @ 0x86B7394
	.incbin "baserom.gba", 0x6B7394, 0x1FC

gSong_86B7590:: @ 0x86B7590
	.incbin "baserom.gba", 0x6B7590, 0x8C

gSong_86B761C:: @ 0x86B761C
	.incbin "baserom.gba", 0x6B761C, 0x50

gSong_86B766C:: @ 0x86B766C
	.incbin "baserom.gba", 0x6B766C, 0x2C

gSong_86B7698:: @ 0x86B7698
	.incbin "baserom.gba", 0x6B7698, 0x20

gSong_86B76B8:: @ 0x86B76B8
	.incbin "baserom.gba", 0x6B76B8, 0x3C

gSong_86B76F4:: @ 0x86B76F4
	.incbin "baserom.gba", 0x6B76F4, 0x94

gSong_86B7788:: @ 0x86B7788
	.incbin "baserom.gba", 0x6B7788, 0x6C

gSong_86B77F4:: @ 0x86B77F4
	.incbin "baserom.gba", 0x6B77F4, 0x48

gSong_86B783C:: @ 0x86B783C
	.incbin "baserom.gba", 0x6B783C, 0xC4

gSong_86B7900:: @ 0x86B7900
	.incbin "baserom.gba", 0x6B7900, 0x54

gSong_86B7954:: @ 0x86B7954
	.incbin "baserom.gba", 0x6B7954, 0x80

gSong_86B79D4:: @ 0x86B79D4
	.incbin "baserom.gba", 0x6B79D4, 0x38

gSong_86B7A0C:: @ 0x86B7A0C
	.incbin "baserom.gba", 0x6B7A0C, 0x34

gSong_86B7A40:: @ 0x86B7A40
	.incbin "baserom.gba", 0x6B7A40, 0x40

gSong_86B7A80:: @ 0x86B7A80
	.incbin "baserom.gba", 0x6B7A80, 0x78

gSong_86B7AF8:: @ 0x86B7AF8
	.incbin "baserom.gba", 0x6B7AF8, 0x80

gSong_86B7B78:: @ 0x86B7B78
	.incbin "baserom.gba", 0x6B7B78, 0x58

gSong_86B7BD0:: @ 0x86B7BD0
	.incbin "baserom.gba", 0x6B7BD0, 0xA4

gSong_86B7C74:: @ 0x86B7C74
	.incbin "baserom.gba", 0x6B7C74, 0x4C

gSong_86B7CC0:: @ 0x86B7CC0
	.incbin "baserom.gba", 0x6B7CC0, 0x7C

gSong_86B7D3C:: @ 0x86B7D3C
	.incbin "baserom.gba", 0x6B7D3C, 0x4C

gSong_86B7D88:: @ 0x86B7D88
	.incbin "baserom.gba", 0x6B7D88, 0x34

gSong_86B7DBC:: @ 0x86B7DBC
	.incbin "baserom.gba", 0x6B7DBC, 0x4C

gSong_86B7E08:: @ 0x86B7E08
	.incbin "baserom.gba", 0x6B7E08, 0x60

gSong_86B7E68:: @ 0x86B7E68
	.incbin "baserom.gba", 0x6B7E68, 0x4C

gSong_86B7EB4:: @ 0x86B7EB4
	.incbin "baserom.gba", 0x6B7EB4, 0x84

gSong_86B7F38:: @ 0x86B7F38
	.incbin "baserom.gba", 0x6B7F38, 0x54

gSong_86B7F8C:: @ 0x86B7F8C
	.incbin "baserom.gba", 0x6B7F8C, 0xCC

gSong_86B8058:: @ 0x86B8058
	.incbin "baserom.gba", 0x6B8058, 0xA0

gSong_86B80F8:: @ 0x86B80F8
	.incbin "baserom.gba", 0x6B80F8, 0x3C

gSong_86B8134:: @ 0x86B8134
	.incbin "baserom.gba", 0x6B8134, 0x4C

gSong_86B8180:: @ 0x86B8180
	.incbin "baserom.gba", 0x6B8180, 0x84

gSong_86B8204:: @ 0x86B8204
	.incbin "baserom.gba", 0x6B8204, 0x70

gSong_86B8274:: @ 0x86B8274
	.incbin "baserom.gba", 0x6B8274, 0xD4

gSong_86B8348:: @ 0x86B8348
	.incbin "baserom.gba", 0x6B8348, 0xA4

gSong_86B83EC:: @ 0x86B83EC
	.incbin "baserom.gba", 0x6B83EC, 0x70

gSong_86B845C:: @ 0x86B845C
	.incbin "baserom.gba", 0x6B845C, 0x74

gSong_86B84D0:: @ 0x86B84D0
	.incbin "baserom.gba", 0x6B84D0, 0xE0

gSong_86B85B0:: @ 0x86B85B0
	.incbin "baserom.gba", 0x6B85B0, 0x3C

gSong_86B85EC:: @ 0x86B85EC
	.incbin "baserom.gba", 0x6B85EC, 0x68

gSong_86B8654:: @ 0x86B8654
	.incbin "baserom.gba", 0x6B8654, 0x7C

gSong_86B86D0:: @ 0x86B86D0
	.incbin "baserom.gba", 0x6B86D0, 0x4C

gSong_86B871C:: @ 0x86B871C
	.incbin "baserom.gba", 0x6B871C, 0x48

gSong_86B8764:: @ 0x86B8764
	.incbin "baserom.gba", 0x6B8764, 0x68

gSong_86B87CC:: @ 0x86B87CC
	.incbin "baserom.gba", 0x6B87CC, 0x9C

gSong_86B8868:: @ 0x86B8868
	.incbin "baserom.gba", 0x6B8868, 0x164

gSong_86B89CC:: @ 0x86B89CC
	.incbin "baserom.gba", 0x6B89CC, 0x68

gSong_86B8A34:: @ 0x86B8A34
	.incbin "baserom.gba", 0x6B8A34, 0x44

gSong_86B8A78:: @ 0x86B8A78
	.incbin "baserom.gba", 0x6B8A78, 0x7C

gSong_86B8AF4:: @ 0x86B8AF4
	.incbin "baserom.gba", 0x6B8AF4, 0x6C

gSong_86B8B60:: @ 0x86B8B60
	.incbin "baserom.gba", 0x6B8B60, 0x80

gSong_86B8BE0:: @ 0x86B8BE0
	.incbin "baserom.gba", 0x6B8BE0, 0x80

gSong_86B8C60:: @ 0x86B8C60
	.incbin "baserom.gba", 0x6B8C60, 0x9C

gSong_86B8CFC:: @ 0x86B8CFC
	.incbin "baserom.gba", 0x6B8CFC, 0x4C

gSong_86B8D48:: @ 0x86B8D48
	.incbin "baserom.gba", 0x6B8D48, 0x40

gSong_86B8D88:: @ 0x86B8D88
	.incbin "baserom.gba", 0x6B8D88, 0x78

gSong_86B8E00:: @ 0x86B8E00
	.incbin "baserom.gba", 0x6B8E00, 0x3C

gSong_86B8E3C:: @ 0x86B8E3C
	.incbin "baserom.gba", 0x6B8E3C, 0x58

gSong_86B8E94:: @ 0x86B8E94
	.incbin "baserom.gba", 0x6B8E94, 0xC8

gSong_86B8F5C:: @ 0x86B8F5C
	.incbin "baserom.gba", 0x6B8F5C, 0xF4

gSong_86B9050:: @ 0x86B9050
	.incbin "baserom.gba", 0x6B9050, 0x110

gSong_86B9160:: @ 0x86B9160
	.incbin "baserom.gba", 0x6B9160, 0x88

gSong_86B91E8:: @ 0x86B91E8
	.incbin "baserom.gba", 0x6B91E8, 0x48

gSong_86B9230:: @ 0x86B9230
	.incbin "baserom.gba", 0x6B9230, 0x60

gSong_86B9290:: @ 0x86B9290
	.incbin "baserom.gba", 0x6B9290, 0x4C

gSong_86B92DC:: @ 0x86B92DC
	.incbin "baserom.gba", 0x6B92DC, 0x88

gSong_86B9364:: @ 0x86B9364
	.incbin "baserom.gba", 0x6B9364, 0xBC

gSong_86B9420:: @ 0x86B9420
	.incbin "baserom.gba", 0x6B9420, 0x58

gSong_86B9478:: @ 0x86B9478
	.incbin "baserom.gba", 0x6B9478, 0x7C

gSong_86B94F4:: @ 0x86B94F4
	.incbin "baserom.gba", 0x6B94F4, 0xC8

gSong_86B95BC:: @ 0x86B95BC
	.incbin "baserom.gba", 0x6B95BC, 0xBC

gSong_86B9678:: @ 0x86B9678
	.incbin "baserom.gba", 0x6B9678, 0xEC

gSong_86B9764:: @ 0x86B9764
	.incbin "baserom.gba", 0x6B9764, 0x40

gSong_86B97A4:: @ 0x86B97A4
	.incbin "baserom.gba", 0x6B97A4, 0x5C

gSong_86B9800:: @ 0x86B9800
	.incbin "baserom.gba", 0x6B9800, 0x38

gSong_86B9838:: @ 0x86B9838
	.incbin "baserom.gba", 0x6B9838, 0xB4

gSong_86B98EC:: @ 0x86B98EC
	.incbin "baserom.gba", 0x6B98EC, 0xA0

gSong_86B998C:: @ 0x86B998C
	.incbin "baserom.gba", 0x6B998C, 0x68

gSong_86B99F4:: @ 0x86B99F4
	.incbin "baserom.gba", 0x6B99F4, 0x124

gSong_86B9B18:: @ 0x86B9B18
	.incbin "baserom.gba", 0x6B9B18, 0x7C

gSong_86B9B94:: @ 0x86B9B94
	.incbin "baserom.gba", 0x6B9B94, 0x5C

gSong_86B9BF0:: @ 0x86B9BF0
	.incbin "baserom.gba", 0x6B9BF0, 0x38

gSong_86B9C28:: @ 0x86B9C28
	.incbin "baserom.gba", 0x6B9C28, 0x50

gSong_86B9C78:: @ 0x86B9C78
	.incbin "baserom.gba", 0x6B9C78, 0x8C

gSong_86B9D04:: @ 0x86B9D04
	.incbin "baserom.gba", 0x6B9D04, 0x64

gSong_86B9D68:: @ 0x86B9D68
	.incbin "baserom.gba", 0x6B9D68, 0x78

gSong_86B9DE0:: @ 0x86B9DE0
	.incbin "baserom.gba", 0x6B9DE0, 0x68

gSong_86B9E48:: @ 0x86B9E48
	.incbin "baserom.gba", 0x6B9E48, 0x154

gSong_86B9F9C:: @ 0x86B9F9C
	.incbin "baserom.gba", 0x6B9F9C, 0xD4

gSong_86BA070:: @ 0x86BA070
	.incbin "baserom.gba", 0x6BA070, 0x110

gSong_86BA180:: @ 0x86BA180
	.incbin "baserom.gba", 0x6BA180, 0xE4

gSong_86BA264:: @ 0x86BA264
	.incbin "baserom.gba", 0x6BA264, 0xE0

gSong_86BA344:: @ 0x86BA344
	.incbin "baserom.gba", 0x6BA344, 0x4C

gSong_86BA390:: @ 0x86BA390
	.incbin "baserom.gba", 0x6BA390, 0x8C

gSong_86BA41C:: @ 0x86BA41C
	.incbin "baserom.gba", 0x6BA41C, 0x190

gSong_86BA5AC:: @ 0x86BA5AC
	.incbin "baserom.gba", 0x6BA5AC, 0x1A0

gSong_86BA74C:: @ 0x86BA74C
	.incbin "baserom.gba", 0x6BA74C, 0x70

gSong_86BA7BC:: @ 0x86BA7BC
	.incbin "baserom.gba", 0x6BA7BC, 0x50

gSong_86BA80C:: @ 0x86BA80C
	.incbin "baserom.gba", 0x6BA80C, 0x124

gSong_86BA930:: @ 0x86BA930
	.incbin "baserom.gba", 0x6BA930, 0x80

gSong_86BA9B0:: @ 0x86BA9B0
	.incbin "baserom.gba", 0x6BA9B0, 0xF0

gSong_86BAAA0:: @ 0x86BAAA0
	.incbin "baserom.gba", 0x6BAAA0, 0x64

gSong_86BAB04:: @ 0x86BAB04
	.incbin "baserom.gba", 0x6BAB04, 0x5C

gSong_86BAB60:: @ 0x86BAB60
	.incbin "baserom.gba", 0x6BAB60, 0xB4

gSong_86BAC14:: @ 0x86BAC14
	.incbin "baserom.gba", 0x6BAC14, 0x1FC

gSong_86BAE10:: @ 0x86BAE10
	.incbin "baserom.gba", 0x6BAE10, 0x120

gSong_86BAF30:: @ 0x86BAF30
	.incbin "baserom.gba", 0x6BAF30, 0x170

gSong_86BB0A0:: @ 0x86BB0A0
	.incbin "baserom.gba", 0x6BB0A0, 0x70

gSong_86BB110:: @ 0x86BB110
	.incbin "baserom.gba", 0x6BB110, 0x98

gSong_86BB1A8:: @ 0x86BB1A8
	.incbin "baserom.gba", 0x6BB1A8, 0x38

gSong_86BB1E0:: @ 0x86BB1E0
	.incbin "baserom.gba", 0x6BB1E0, 0xD8

gSong_86BB2B8:: @ 0x86BB2B8
	.incbin "baserom.gba", 0x6BB2B8, 0xD8

gSong_86BB390:: @ 0x86BB390
	.incbin "baserom.gba", 0x6BB390, 0xAC

gSong_86BB43C:: @ 0x86BB43C
	.incbin "baserom.gba", 0x6BB43C, 0x98

gSong_86BB4D4:: @ 0x86BB4D4
	.incbin "baserom.gba", 0x6BB4D4, 0x98

gSong_86BB56C:: @ 0x86BB56C
	.incbin "baserom.gba", 0x6BB56C, 0xA8

gSong_86BB614:: @ 0x86BB614
	.incbin "baserom.gba", 0x6BB614, 0x4C

gSong_86BB660:: @ 0x86BB660
	.incbin "baserom.gba", 0x6BB660, 0xFC

gSong_86BB75C:: @ 0x86BB75C
	.incbin "baserom.gba", 0x6BB75C, 0x94

gSong_86BB7F0:: @ 0x86BB7F0
	.incbin "baserom.gba", 0x6BB7F0, 0x64

gSong_86BB854:: @ 0x86BB854
	.incbin "baserom.gba", 0x6BB854, 0x9C

gSong_86BB8F0:: @ 0x86BB8F0
	.incbin "baserom.gba", 0x6BB8F0, 0x208

gSong_86BBAF8:: @ 0x86BBAF8
	.incbin "baserom.gba", 0x6BBAF8, 0xFC

gSong_86BBBF4:: @ 0x86BBBF4
	.incbin "baserom.gba", 0x6BBBF4, 0xF0

gSong_86BBCE4:: @ 0x86BBCE4
	.incbin "baserom.gba", 0x6BBCE4, 0x84

gSong_86BBD68:: @ 0x86BBD68
	.incbin "baserom.gba", 0x6BBD68, 0x74

gSong_86BBDDC:: @ 0x86BBDDC
	.incbin "baserom.gba", 0x6BBDDC, 0x180

gSong_86BBF5C:: @ 0x86BBF5C
	.incbin "baserom.gba", 0x6BBF5C, 0x104

gSong_86BC060:: @ 0x86BC060
	.incbin "baserom.gba", 0x6BC060, 0x60

gSong_86BC0C0:: @ 0x86BC0C0
	.incbin "baserom.gba", 0x6BC0C0, 0x70

gSong_86BC130:: @ 0x86BC130
	.incbin "baserom.gba", 0x6BC130, 0x11C

gSong_86BC24C:: @ 0x86BC24C
	.incbin "baserom.gba", 0x6BC24C, 0xA4

gSong_86BC2F0:: @ 0x86BC2F0
	.incbin "baserom.gba", 0x6BC2F0, 0x170

gSong_86BC460:: @ 0x86BC460
	.incbin "baserom.gba", 0x6BC460, 0x134

gSong_86BC594:: @ 0x86BC594
	.incbin "baserom.gba", 0x6BC594, 0x84

gSong_86BC618:: @ 0x86BC618
	.incbin "baserom.gba", 0x6BC618, 0x58

gSong_86BC670:: @ 0x86BC670
	.incbin "baserom.gba", 0x6BC670, 0x30

gSong_86BC6A0:: @ 0x86BC6A0
	.incbin "baserom.gba", 0x6BC6A0, 0x38

gSong_86BC6D8:: @ 0x86BC6D8
	.incbin "baserom.gba", 0x6BC6D8, 0x8C

gSong_86BC764:: @ 0x86BC764
	.incbin "baserom.gba", 0x6BC764, 0x38

gSong_86BC79C:: @ 0x86BC79C
	.incbin "baserom.gba", 0x6BC79C, 0x44

gSong_86BC7E0:: @ 0x86BC7E0
	.incbin "baserom.gba", 0x6BC7E0, 0x40

gSong_86BC820:: @ 0x86BC820
	.incbin "baserom.gba", 0x6BC820, 0x28

gSong_86BC848:: @ 0x86BC848
	.incbin "baserom.gba", 0x6BC848, 0xB8

gSong_86BC900:: @ 0x86BC900
	.incbin "baserom.gba", 0x6BC900, 0x74

gSong_86BC974:: @ 0x86BC974
	.incbin "baserom.gba", 0x6BC974, 0x6C

gSong_86BC9E0:: @ 0x86BC9E0
	.incbin "baserom.gba", 0x6BC9E0, 0x48

gSong_86BCA28:: @ 0x86BCA28
	.incbin "baserom.gba", 0x6BCA28, 0xE0

gSong_86BCB08:: @ 0x86BCB08
	.incbin "baserom.gba", 0x6BCB08, 0xC0

gSong_86BCBC8:: @ 0x86BCBC8
	.incbin "baserom.gba", 0x6BCBC8, 0x34

gSong_86BCBFC:: @ 0x86BCBFC
	.incbin "baserom.gba", 0x6BCBFC, 0xBC

gSong_86BCCB8:: @ 0x86BCCB8
	.incbin "baserom.gba", 0x6BCCB8, 0xE0

gSong_86BCD98:: @ 0x86BCD98
	.incbin "baserom.gba", 0x6BCD98, 0x14C

gSong_86BCEE4:: @ 0x86BCEE4
	.incbin "baserom.gba", 0x6BCEE4, 0x19C

gSong_86BD080:: @ 0x86BD080
	.incbin "baserom.gba", 0x6BD080, 0x2D8

gSong_86BD358:: @ 0x86BD358
	.incbin "baserom.gba", 0x6BD358, 0x18C

gSong_86BD4E4:: @ 0x86BD4E4
	.incbin "baserom.gba", 0x6BD4E4, 0xD8

gSong_86BD5BC:: @ 0x86BD5BC
	.incbin "baserom.gba", 0x6BD5BC, 0x6C

gSong_86BD628:: @ 0x86BD628
	.incbin "baserom.gba", 0x6BD628, 0x570

gSong_86BDB98:: @ 0x86BDB98
	.incbin "baserom.gba", 0x6BDB98, 0xE2C

gSong_86BE9C4:: @ 0x86BE9C4
	.incbin "baserom.gba", 0x6BE9C4, 0x10A4

gSong_86BFA68:: @ 0x86BFA68
	.incbin "baserom.gba", 0x6BFA68, 0x358

gSong_86BFDC0:: @ 0x86BFDC0
	.incbin "baserom.gba", 0x6BFDC0, 0x220

gSong_86BFFE0:: @ 0x86BFFE0
	.incbin "baserom.gba", 0x6BFFE0, 0x140

gSong_86C0120:: @ 0x86C0120
	.incbin "baserom.gba", 0x6C0120, 0xE4

gSong_86C0204:: @ 0x86C0204
	.incbin "baserom.gba", 0x6C0204, 0xF8

gSong_86C02FC:: @ 0x86C02FC
	.incbin "baserom.gba", 0x6C02FC, 0x4E8

gSong_86C07E4:: @ 0x86C07E4
	.incbin "baserom.gba", 0x6C07E4, 0xF3C

gSong_86C1720:: @ 0x86C1720
	.incbin "baserom.gba", 0x6C1720, 0x1C24

gSong_86C3344:: @ 0x86C3344
	.incbin "baserom.gba", 0x6C3344, 0xA0C

gSong_86C3D50:: @ 0x86C3D50
	.incbin "baserom.gba", 0x6C3D50, 0x298

gSong_86C3FE8:: @ 0x86C3FE8
	.incbin "baserom.gba", 0x6C3FE8, 0xB00

gSong_86C4AE8:: @ 0x86C4AE8
	.incbin "baserom.gba", 0x6C4AE8, 0x1074

gSong_86C5B5C:: @ 0x86C5B5C
	.incbin "baserom.gba", 0x6C5B5C, 0xED4

gSong_86C6A30:: @ 0x86C6A30
	.incbin "baserom.gba", 0x6C6A30, 0xD2C

gSong_86C775C:: @ 0x86C775C
	.incbin "baserom.gba", 0x6C775C, 0x54

gSong_86C77B0:: @ 0x86C77B0
	.incbin "baserom.gba", 0x6C77B0, 0xC14

gSong_86C83C4:: @ 0x86C83C4
	.incbin "baserom.gba", 0x6C83C4, 0x3C0

gSong_86C8784:: @ 0x86C8784
	.incbin "baserom.gba", 0x6C8784, 0x3B8

gSong_86C8B3C:: @ 0x86C8B3C
	.incbin "baserom.gba", 0x6C8B3C, 0x4A8

gSong_86C8FE4:: @ 0x86C8FE4
	.incbin "baserom.gba", 0x6C8FE4, 0xABC

gSong_86C9AA0:: @ 0x86C9AA0
	.incbin "baserom.gba", 0x6C9AA0, 0x1218

gSong_86CACB8:: @ 0x86CACB8
	.incbin "baserom.gba", 0x6CACB8, 0x1450

gSong_86CC108:: @ 0x86CC108
	.incbin "baserom.gba", 0x6CC108, 0x123C

gSong_86CD344:: @ 0x86CD344
	.incbin "baserom.gba", 0x6CD344, 0x4010

gSong_86D1354:: @ 0x86D1354
	.incbin "baserom.gba", 0x6D1354, 0xA88

gSong_86D1DDC:: @ 0x86D1DDC
	.incbin "baserom.gba", 0x6D1DDC, 0x870

gSong_86D264C:: @ 0x86D264C
	.incbin "baserom.gba", 0x6D264C, 0xF3C

gSong_86D3588:: @ 0x86D3588
	.incbin "baserom.gba", 0x6D3588, 0xD74

gSong_86D42FC:: @ 0x86D42FC
	.incbin "baserom.gba", 0x6D42FC, 0xD40

gSong_86D503C:: @ 0x86D503C
	.incbin "baserom.gba", 0x6D503C, 0x1AE4

gSong_86D6B20:: @ 0x86D6B20
	.incbin "baserom.gba", 0x6D6B20, 0x2B74

gSong_86D9694:: @ 0x86D9694
	.incbin "baserom.gba", 0x6D9694, 0x117C

gSong_86DA810:: @ 0x86DA810
	.incbin "baserom.gba", 0x6DA810, 0x27D0

gSong_86DCFE0:: @ 0x86DCFE0
	.incbin "baserom.gba", 0x6DCFE0, 0x864

gSong_86DD844:: @ 0x86DD844
	.incbin "baserom.gba", 0x6DD844, 0x79C

gSong_86DDFE0:: @ 0x86DDFE0
	.incbin "baserom.gba", 0x6DDFE0, 0x98C

gSong_86DE96C:: @ 0x86DE96C
	.incbin "baserom.gba", 0x6DE96C, 0xA60

gSong_86DF3CC:: @ 0x86DF3CC
	.incbin "baserom.gba", 0x6DF3CC, 0x12A4

gSong_86E0670:: @ 0x86E0670
	.incbin "baserom.gba", 0x6E0670, 0x978

gSong_86E0FE8:: @ 0x86E0FE8
	.incbin "baserom.gba", 0x6E0FE8, 0x8CC

gSong_86E18B4:: @ 0x86E18B4
	.incbin "baserom.gba", 0x6E18B4, 0x16F4

gSong_86E2FA8:: @ 0x86E2FA8
	.incbin "baserom.gba", 0x6E2FA8, 0xA3C

gSong_86E39E4:: @ 0x86E39E4
	.incbin "baserom.gba", 0x6E39E4, 0xB80

gSong_86E4564:: @ 0x86E4564
	.incbin "baserom.gba", 0x6E4564, 0x1180

gSong_86E56E4:: @ 0x86E56E4
	.incbin "baserom.gba", 0x6E56E4, 0x538

gSong_86E5C1C:: @ 0x86E5C1C
	.incbin "baserom.gba", 0x6E5C1C, 0xEF0

gSong_86E6B0C:: @ 0x86E6B0C
	.incbin "baserom.gba", 0x6E6B0C, 0xE14

gSong_86E7920:: @ 0x86E7920
	.incbin "baserom.gba", 0x6E7920, 0xEF0

gSong_86E8810:: @ 0x86E8810
	.incbin "baserom.gba", 0x6E8810, 0x83C

gSong_86E904C:: @ 0x86E904C
	.incbin "baserom.gba", 0x6E904C, 0x7D4

gSong_86E9820:: @ 0x86E9820
	.incbin "baserom.gba", 0x6E9820, 0x200

gSong_86E9A20:: @ 0x86E9A20
	.incbin "baserom.gba", 0x6E9A20, 0x200

gSong_86E9C20:: @ 0x86E9C20
	.incbin "baserom.gba", 0x6E9C20, 0x370

gSong_86E9F90:: @ 0x86E9F90
	.incbin "baserom.gba", 0x6E9F90, 0x170

gSong_86EA100:: @ 0x86EA100
	.incbin "baserom.gba", 0x6EA100, 0x904

gSong_86EAA04:: @ 0x86EAA04
	.incbin "baserom.gba", 0x6EAA04, 0x438

gSong_86EAE3C:: @ 0x86EAE3C
	.incbin "baserom.gba", 0x6EAE3C, 0x8C

gSong_86EAEC8:: @ 0x86EAEC8
	.incbin "baserom.gba", 0x6EAEC8, 0x1D0

gSong_86EB098:: @ 0x86EB098
	.incbin "baserom.gba", 0x6EB098, 0xBC

gSong_86EB154:: @ 0x86EB154
	.incbin "baserom.gba", 0x6EB154, 0xF74

gSong_86EC0C8:: @ 0x86EC0C8
	.incbin "baserom.gba", 0x6EC0C8, 0xF7C

gSong_86ED044:: @ 0x86ED044
	.incbin "baserom.gba", 0x6ED044, 0xA5C

gSong_86EDAA0:: @ 0x86EDAA0
	.incbin "baserom.gba", 0x6EDAA0, 0x480

gSong_86EDF20:: @ 0x86EDF20
	.incbin "baserom.gba", 0x6EDF20, 0xF2C

gSong_86EEE4C:: @ 0x86EEE4C
	.incbin "baserom.gba", 0x6EEE4C, 0x1404

gSong_86F0250:: @ 0x86F0250
	.incbin "baserom.gba", 0x6F0250, 0x4F0

gSong_86F0740:: @ 0x86F0740
	.incbin "baserom.gba", 0x6F0740, 0xEC0

gSong_86F1600:: @ 0x86F1600
	.incbin "baserom.gba", 0x6F1600, 0x121C

gSong_86F281C:: @ 0x86F281C
	.incbin "baserom.gba", 0x6F281C, 0xEF4

gSong_86F3710:: @ 0x86F3710
	.incbin "baserom.gba", 0x6F3710, 0x1028

gSong_86F4738:: @ 0x86F4738
	.incbin "baserom.gba", 0x6F4738, 0xF30

gSong_86F5668:: @ 0x86F5668
	.incbin "baserom.gba", 0x6F5668, 0x1C4

gSong_86F582C:: @ 0x86F582C
	.incbin "baserom.gba", 0x6F582C, 0x2188

gSong_86F79B4:: @ 0x86F79B4
	.incbin "baserom.gba", 0x6F79B4, 0x1178

gSong_86F8B2C:: @ 0x86F8B2C
	.incbin "baserom.gba", 0x6F8B2C, 0x12B8

gSong_86F9DE4:: @ 0x86F9DE4
	.incbin "baserom.gba", 0x6F9DE4, 0x444

gSong_86FA228:: @ 0x86FA228
	.incbin "baserom.gba", 0x6FA228, 0x948

gSong_86FAB70:: @ 0x86FAB70
	.incbin "baserom.gba", 0x6FAB70, 0xA00

gSong_86FB570:: @ 0x86FB570
	.incbin "baserom.gba", 0x6FB570, 0x840

gSong_86FBDB0:: @ 0x86FBDB0
	.incbin "baserom.gba", 0x6FBDB0, 0xDC

gSong_86FBE8C:: @ 0x86FBE8C
	.incbin "baserom.gba", 0x6FBE8C, 0x18
