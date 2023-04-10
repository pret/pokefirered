TILESETGFXDIR := data/tilesets
FONTGFXDIR := graphics/fonts
FAMECHECKERGFXDIR := graphics/fame_checker
INTERFACEGFXDIR := graphics/interface
PARTYMENUGFXDIR := graphics/party_menu
BTLANMSPRGFXDIR := graphics/battle_anims/sprites
UNUSEDGFXDIR := graphics/unused
UNKNOWNGFXDIR := graphics/unknown
BATINTGFXDIR := graphics/battle_interface
MASKSGFXDIR := graphics/battle_anims/masks
BATTRANSGFXDIR := graphics/battle_transitions
TYPESGFXDIR := graphics/types
RAYQUAZAGFXDIR := graphics/rayquaza_scene
ROULETTEGFXDIR := graphics/roulette
SLOTMACHINEGFXDIR := graphics/slot_machine
PSSGFXDIR := graphics/pokemon_storage
EVENTOBJGFXDIR := graphics/object_events
FIELDEFFECTSGFXDIR := graphics/field_effects
MISCGFXDIR := graphics/misc
TEXTWINDOWGFXDIR := graphics/text_window
TEACHYTVGFXDIR := graphics/teachy_tv
SSANNEGFXDIR := graphics/ss_anne
ITEMPCGFXDIR := graphics/item_pc
TITLESCREENGFXDIR := graphics/title_screen
CREDITSGFXDIR := graphics/credits
ITEMMENUGFXDIR := graphics/item_menu
INTROGFXDIR := graphics/intro
BATTLETERRAINGFXDIR := graphics/battle_terrain
BERRYPOUCHGFXDIR := graphics/berry_pouch
HALLOFFAMEGFXDIR := graphics/hall_of_fame
MAPPREVIEWGFXDIR := graphics/map_preview
NAMINGGFXDIR := graphics/naming_screen
WALLPAPERGFXDIR := graphics/pokemon_storage/wallpapers
JPCONTESTGFXDIR := graphics/contest/japanese

types := normal fight flying poison ground rock bug ghost steel mystery fire water grass electric psychic ice dragon dark
contest_types := cool beauty cute smart tough

CASTFORMGFXDIR := graphics/pokemon/castform
$(CASTFORMGFXDIR)/front.4bpp: $(CASTFORMGFXDIR)/normal/front.4bpp \
											$(CASTFORMGFXDIR)/sunny/front.4bpp \
											$(CASTFORMGFXDIR)/rainy/front.4bpp \
											$(CASTFORMGFXDIR)/snowy/front.4bpp
	@cat $^ >$@

$(CASTFORMGFXDIR)/back.4bpp: $(CASTFORMGFXDIR)/normal/back.4bpp \
									 $(CASTFORMGFXDIR)/sunny/back.4bpp \
									 $(CASTFORMGFXDIR)/rainy/back.4bpp \
									 $(CASTFORMGFXDIR)/snowy/back.4bpp
	@cat $^ >$@

$(CASTFORMGFXDIR)/normal.gbapal: $(CASTFORMGFXDIR)/normal/normal.gbapal \
									 $(CASTFORMGFXDIR)/sunny/normal.gbapal \
									 $(CASTFORMGFXDIR)/rainy/normal.gbapal \
									 $(CASTFORMGFXDIR)/snowy/normal.gbapal
	@cat $^ >$@

$(CASTFORMGFXDIR)/shiny.gbapal: $(CASTFORMGFXDIR)/normal/shiny.gbapal \
									$(CASTFORMGFXDIR)/sunny/shiny.gbapal \
									$(CASTFORMGFXDIR)/rainy/shiny.gbapal \
									$(CASTFORMGFXDIR)/snowy/shiny.gbapal
	@cat $^ >$@

$(FONTGFXDIR)/latin_small.latfont: $(FONTGFXDIR)/latin_small.png
	$(GFX) $< $@

$(FONTGFXDIR)/japanese_small.fwjpnfont: $(FONTGFXDIR)/japanese_small.png
	$(GFX) $< $@

$(FONTGFXDIR)/japanese_tall.fwjpnfont: $(FONTGFXDIR)/japanese_tall.png
	$(GFX) $< $@

$(FONTGFXDIR)/latin_normal.latfont: $(FONTGFXDIR)/latin_normal.png
	$(GFX) $< $@

$(FONTGFXDIR)/japanese_normal.fwjpnfont: $(FONTGFXDIR)/japanese_normal.png
	$(GFX) $< $@

$(FONTGFXDIR)/latin_male.latfont: $(FONTGFXDIR)/latin_male.png
	$(GFX) $< $@

$(FONTGFXDIR)/japanese_male.fwjpnfont: $(FONTGFXDIR)/japanese_male.png
	$(GFX) $< $@

$(FONTGFXDIR)/latin_female.latfont: $(FONTGFXDIR)/latin_female.png
	$(GFX) $< $@

$(FONTGFXDIR)/japanese_female.fwjpnfont: $(FONTGFXDIR)/japanese_female.png
	$(GFX) $< $@

$(FONTGFXDIR)/braille.fwjpnfont: $(FONTGFXDIR)/braille.png
	$(GFX) $< $@

$(FONTGFXDIR)/japanese_bold.fwjpnfont: $(FONTGFXDIR)/japanese_bold.png
	$(GFX) $< $@

graphics/title_screen/pokemon_logo.gbapal: %.gbapal: %.pal
	$(GFX) $< $@ -num_colors 224

graphics/pokemon_jump/bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 63 -Wnum_tiles

$(MISCGFXDIR)/japanese_hof.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 29 -Wnum_tiles

$(MISCGFXDIR)/markings2.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 25 -Wnum_tiles

$(INTERFACEGFXDIR)/menu.gbapal: $(INTERFACEGFXDIR)/menu_0.gbapal \
						$(INTERFACEGFXDIR)/menu_1.gbapal
	@cat $^ >$@

$(BTLANMSPRGFXDIR)/ice_cube.4bpp: $(BTLANMSPRGFXDIR)/ice_cube_0.4bpp \
						  $(BTLANMSPRGFXDIR)/ice_cube_1.4bpp \
						  $(BTLANMSPRGFXDIR)/ice_cube_2.4bpp \
						  $(BTLANMSPRGFXDIR)/ice_cube_3.4bpp
	@cat $^ >$@

$(UNUSEDGFXDIR)/obi_palpak1.gbapal: $(UNUSEDGFXDIR)/old_pal1.gbapal \
									$(UNUSEDGFXDIR)/old_pal2.gbapal \
									$(UNUSEDGFXDIR)/old_pal3.gbapal
	@cat $^ >$@

$(UNUSEDGFXDIR)/obi_palpak3.gbapal: $(UNUSEDGFXDIR)/old_pal5.gbapal \
									$(UNUSEDGFXDIR)/old_pal6.gbapal \
									$(UNUSEDGFXDIR)/old_pal7.gbapal
	@cat $^ >$@

$(UNUSEDGFXDIR)/obi1.4bpp: $(UNUSEDGFXDIR)/old_bulbasaur.4bpp \
						   $(UNUSEDGFXDIR)/old_charizard.4bpp
	@cat $^ >$@

$(UNUSEDGFXDIR)/obi2.4bpp: $(UNUSEDGFXDIR)/old_bulbasaur2.4bpp \
						   $(UNUSEDGFXDIR)/old_battle_interface_1.4bpp \
						   $(UNUSEDGFXDIR)/old_battle_interface_2.4bpp \
						   $(UNUSEDGFXDIR)/old_battle_interface_3.4bpp
	@cat $^ >$@

$(INTERFACEGFXDIR)/hp_numbers.4bpp: $(INTERFACEGFXDIR)/hp_bar_anim.4bpp \
							$(INTERFACEGFXDIR)/numbers1.4bpp \
							$(INTERFACEGFXDIR)/numbers2.4bpp
	@cat $^ >$@

$(UNUSEDGFXDIR)/redyellowgreen_frame.bin: $(UNUSEDGFXDIR)/red_frame.bin \
										  $(UNUSEDGFXDIR)/yellow_frame.bin \
										  $(UNUSEDGFXDIR)/green_frame.bin \
										  $(UNUSEDGFXDIR)/blank_frame.bin
	@cat $^ >$@

$(UNUSEDGFXDIR)/color_frames.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 353 -Wnum_tiles

$(BATINTGFXDIR)/unused_window2bar.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 5 -Wnum_tiles

$(BATINTGFXDIR)/level_up_banner.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 36 -Wnum_tiles

$(BATINTGFXDIR)/textbox.gbapal: $(BATINTGFXDIR)/textbox1.gbapal $(BATINTGFXDIR)/textbox2.gbapal
	cat $^ > $@

$(JPCONTESTGFXDIR)/composite_1.4bpp: $(JPCONTESTGFXDIR)/frame_1.4bpp \
								  $(JPCONTESTGFXDIR)/floor.4bpp \
								  $(JPCONTESTGFXDIR)/frame_2.4bpp \
								  $(JPCONTESTGFXDIR)/symbols.4bpp \
								  $(JPCONTESTGFXDIR)/meter.4bpp \
								  $(JPCONTESTGFXDIR)/classes.4bpp \
								  $(JPCONTESTGFXDIR)/numbers_2.4bpp
	@cat $^ >$@

$(JPCONTESTGFXDIR)/composite_2.4bpp: $(JPCONTESTGFXDIR)/interface.4bpp \
									$(JPCONTESTGFXDIR)/audience.4bpp
	@cat $^ >$@

$(JPCONTESTGFXDIR)/voltage.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 36 -Wnum_tiles

$(BTLANMSPRGFXDIR)/ice_crystals.4bpp: $(BTLANMSPRGFXDIR)/ice_crystals_0.4bpp \
						  $(BTLANMSPRGFXDIR)/ice_crystals_1.4bpp \
						  $(BTLANMSPRGFXDIR)/ice_crystals_2.4bpp \
						  $(BTLANMSPRGFXDIR)/ice_crystals_3.4bpp \
						  $(BTLANMSPRGFXDIR)/ice_crystals_4.4bpp
	@cat $^ >$@

$(BTLANMSPRGFXDIR)/mud_sand.4bpp: $(BTLANMSPRGFXDIR)/mud_sand_0.4bpp \
						  $(BTLANMSPRGFXDIR)/mud_sand_1.4bpp
	@cat $^ >$@

$(BTLANMSPRGFXDIR)/flower.4bpp: $(BTLANMSPRGFXDIR)/flower_0.4bpp \
						  $(BTLANMSPRGFXDIR)/flower_1.4bpp
	@cat $^ >$@

$(BTLANMSPRGFXDIR)/spark.4bpp: $(BTLANMSPRGFXDIR)/spark_0.4bpp \
						  $(BTLANMSPRGFXDIR)/spark_1.4bpp
	@cat $^ >$@

$(MASKSGFXDIR)/unused_level_up.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 14 -Wnum_tiles

$(BATTRANSGFXDIR)/vs_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 16 -Wnum_tiles

$(PARTYMENUGFXDIR)/bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 62 -Wnum_tiles

$(TYPESGFXDIR)/move_types.4bpp: $(types:%=$(TYPESGFXDIR)/%.4bpp) $(contest_types:%=$(TYPESGFXDIR)/contest_%.4bpp)
	@cat $^ >$@

$(TYPESGFXDIR)/move_types.gbapal: $(TYPESGFXDIR)/move_types_1.gbapal \
							   $(TYPESGFXDIR)/move_types_2.gbapal \
							   $(TYPESGFXDIR)/move_types_3.gbapal
	@cat $^ >$@

$(INTERFACEGFXDIR)/bag_screen.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 53 -Wnum_tiles

$(RAYQUAZAGFXDIR)/rayquaza.8bpp: %.8bpp: %.png
	$(GFX) $< $@ -num_tiles 227 -Wnum_tiles

$(RAYQUAZAGFXDIR)/overcast.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 313 -Wnum_tiles

$(RAYQUAZAGFXDIR)/rayquaza_fly1.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 124 -Wnum_tiles

$(RAYQUAZAGFXDIR)/rayquaza_tail_fix.4bpp: $(RAYQUAZAGFXDIR)/rayquaza_tail.4bpp
	cp $< $@
	head -c 12 /dev/zero >> $@

$(RAYQUAZAGFXDIR)/chase_streaks.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 19 -Wnum_tiles

$(RAYQUAZAGFXDIR)/rayquaza_chase.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 155 -Wnum_tiles

graphics/picture_frame/frame5.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 86 -Wnum_tiles

$(ROULETTEGFXDIR)/roulette_tilt.4bpp: $(ROULETTEGFXDIR)/shroomish.4bpp \
									  $(ROULETTEGFXDIR)/tailow.4bpp
	@cat $^ >$@

$(ROULETTEGFXDIR)/poke_icons2.4bpp: $(ROULETTEGFXDIR)/wynaut.4bpp \
									$(ROULETTEGFXDIR)/azurill.4bpp \
									$(ROULETTEGFXDIR)/skitty.4bpp \
									$(ROULETTEGFXDIR)/makuhita.4bpp
	@cat $^ >$@

$(UNUSEDGFXDIR)/intro_birch_beauty.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 822 -Wnum_tiles

$(PSSGFXDIR)/forest_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 55 -Wnum_tiles

$(PSSGFXDIR)/forest.4bpp: $(PSSGFXDIR)/forest_frame.4bpp $(PSSGFXDIR)/forest_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/city_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 52 -Wnum_tiles

$(PSSGFXDIR)/city.4bpp: $(PSSGFXDIR)/city_frame.4bpp $(PSSGFXDIR)/city_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/desert.4bpp: $(PSSGFXDIR)/desert_frame.4bpp $(PSSGFXDIR)/desert_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/savanna_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 45 -Wnum_tiles

$(PSSGFXDIR)/savanna_bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 23 -Wnum_tiles

$(PSSGFXDIR)/savanna.4bpp: $(PSSGFXDIR)/savanna_frame.4bpp $(PSSGFXDIR)/savanna_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/crag_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 49 -Wnum_tiles

$(PSSGFXDIR)/crag.4bpp: $(PSSGFXDIR)/crag_frame.4bpp $(PSSGFXDIR)/crag_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/volcano_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 56 -Wnum_tiles

$(PSSGFXDIR)/volcano.4bpp: $(PSSGFXDIR)/volcano_frame.4bpp $(PSSGFXDIR)/volcano_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/snow_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 57 -Wnum_tiles

$(PSSGFXDIR)/snow.4bpp: $(PSSGFXDIR)/snow_frame.4bpp $(PSSGFXDIR)/snow_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/cave_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 55 -Wnum_tiles

$(PSSGFXDIR)/cave.4bpp: $(PSSGFXDIR)/cave_frame.4bpp $(PSSGFXDIR)/cave_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/beach_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 46 -Wnum_tiles

$(PSSGFXDIR)/beach_bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 23 -Wnum_tiles

$(PSSGFXDIR)/beach.4bpp: $(PSSGFXDIR)/beach_frame.4bpp $(PSSGFXDIR)/beach_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/seafloor_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 54 -Wnum_tiles

$(PSSGFXDIR)/seafloor.4bpp: $(PSSGFXDIR)/seafloor_frame.4bpp $(PSSGFXDIR)/seafloor_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/river_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 51 -Wnum_tiles

$(PSSGFXDIR)/river_bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 11 -Wnum_tiles

$(PSSGFXDIR)/river.4bpp: $(PSSGFXDIR)/river_frame.4bpp $(PSSGFXDIR)/river_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/sky_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 45 -Wnum_tiles

$(PSSGFXDIR)/sky.4bpp: $(PSSGFXDIR)/sky_frame.4bpp $(PSSGFXDIR)/sky_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/polkadot_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 54 -Wnum_tiles

$(PSSGFXDIR)/polkadot.4bpp: $(PSSGFXDIR)/polkadot_frame.4bpp $(PSSGFXDIR)/polkadot_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/pokecenter_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 35 -Wnum_tiles

$(PSSGFXDIR)/pokecenter.4bpp: $(PSSGFXDIR)/pokecenter_frame.4bpp $(PSSGFXDIR)/pokecenter_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/machine_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 33 -Wnum_tiles

$(PSSGFXDIR)/machine.4bpp: $(PSSGFXDIR)/machine_frame.4bpp $(PSSGFXDIR)/machine_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/plain_frame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 18 -Wnum_tiles

$(PSSGFXDIR)/plain.4bpp: $(PSSGFXDIR)/plain_frame.4bpp $(PSSGFXDIR)/plain_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/friends_frame1.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 57 -Wnum_tiles

$(PSSGFXDIR)/friends_frame2.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 57 -Wnum_tiles

$(PSSGFXDIR)/zigzagoon.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/zigzagoon_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/screen.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/screen_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/horizontal.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/horizontal_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/diagonal.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/diagonal_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/block.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/block_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/ribbon.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/ribbon_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/pokecenter2.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/pokecenter2_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/frame.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/frame_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/blank.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/blank_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/circles.4bpp: $(PSSGFXDIR)/friends_frame1.4bpp $(PSSGFXDIR)/circles_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/azumarill.4bpp: $(PSSGFXDIR)/friends_frame2.4bpp $(PSSGFXDIR)/azumarill_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/pikachu.4bpp: $(PSSGFXDIR)/friends_frame2.4bpp $(PSSGFXDIR)/pikachu_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/legendary.4bpp: $(PSSGFXDIR)/friends_frame2.4bpp $(PSSGFXDIR)/legendary_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/dusclops.4bpp: $(PSSGFXDIR)/friends_frame2.4bpp $(PSSGFXDIR)/dusclops_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/ludicolo.4bpp: $(PSSGFXDIR)/friends_frame2.4bpp $(PSSGFXDIR)/ludicolo_bg.4bpp
	@cat $^ >$@

$(PSSGFXDIR)/whiscash.4bpp: $(PSSGFXDIR)/friends_frame2.4bpp $(PSSGFXDIR)/whiscash_bg.4bpp
	@cat $^ >$@

$(FIELDEFFECTSGFXDIR)/pics/underwater_bubbles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 4

$(FIELDEFFECTSGFXDIR)/pics/bike_tire_tracks.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 2

$(FIELDEFFECTSGFXDIR)/pics/sand_disguise.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 4

$(FIELDEFFECTSGFXDIR)/pics/mountain_disguise.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 4

$(FIELDEFFECTSGFXDIR)/pics/tree_disguise.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 4

$(INTERFACEGFXDIR)/selector_outline.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 8 -Wnum_tiles

graphics/tm_case/tm_case.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 91 -Wnum_tiles

$(PKNAVGFXDIR)/header.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 53 -Wnum_tiles

$(PKNAVGFXDIR)/outline.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 53 -Wnum_tiles
	
$(PKNAVGFXDIR)/ui_matchcall.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 13 -Wnum_tiles

$(INTERFACEGFXDIR)/region_map.8bpp: %.8bpp: %.png
	$(GFX) $< $@ -num_tiles 232 -Wnum_tiles

$(INTERFACEGFXDIR)/region_map_affine.8bpp: %.8bpp: %.png
	$(GFX) $< $@ -num_tiles 233 -Wnum_tiles

$(MISCGFXDIR)/birch_help.4bpp: $(MISCGFXDIR)/birch_bag.4bpp $(MISCGFXDIR)/birch_grass.4bpp
	@cat $^ >$@
	
$(FAMECHECKERGFXDIR)/spinning_pokeball.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 15 -Wnum_tiles

$(FAMECHECKERGFXDIR)/bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 165 -Wnum_tiles

graphics/seagallop/water.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 41 -Wnum_tiles

graphics/link/321start.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 4 -mheight 4

$(TEXTWINDOWGFXDIR)/signpost.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 19 -Wnum_tiles

$(SLOTMACHINEGFXDIR)/firered/combos_window.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 66 -Wnum_tiles

$(SLOTMACHINEGFXDIR)/firered/bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 138 -Wnum_tiles

$(SLOTMACHINEGFXDIR)/leafgreen/bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 134 -Wnum_tiles

$(TEACHYTVGFXDIR)/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 233 -Wnum_tiles

$(SSANNEGFXDIR)/smoke.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 17 -Wnum_tiles

$(ITEMPCGFXDIR)/bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 82 -Wnum_tiles

$(TITLESCREENGFXDIR)/firered/box_art_mon.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 135 -Wnum_tiles

$(TITLESCREENGFXDIR)/leafgreen/box_art_mon.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 123 -Wnum_tiles

POKEDEXAREAMARKERSDATADIR := graphics/pokedex/area_markers

POKEDEXAREAMARKERFILES := \
	$(POKEDEXAREAMARKERSDATADIR)/marker_0.4bpp \
	$(POKEDEXAREAMARKERSDATADIR)/marker_1.4bpp \
	$(POKEDEXAREAMARKERSDATADIR)/marker_2.4bpp \
	$(POKEDEXAREAMARKERSDATADIR)/marker_3.4bpp \
	$(POKEDEXAREAMARKERSDATADIR)/marker_4.4bpp \
	$(POKEDEXAREAMARKERSDATADIR)/marker_5.4bpp \
	$(POKEDEXAREAMARKERSDATADIR)/marker_6.4bpp

$(POKEDEXAREAMARKERSDATADIR)/marker.4bpp: $(POKEDEXAREAMARKERFILES)
	cat $^ > $@

graphics/pokemon/heracross/unk_icon.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 4 -mheight 4

graphics/misc/emoticons.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 2

$(ITEMMENUGFXDIR)/bg.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 55 -Wnum_tiles

$(INTROGFXDIR)/scene_1/grass.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 397 -Wnum_tiles

$(INTROGFXDIR)/scene_2/plants.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 17 -Wnum_tiles

$(INTROGFXDIR)/scene_2/nidorino_close.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 170 -Wnum_tiles

$(INTROGFXDIR)/scene_2/gengar_close.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 114 -Wnum_tiles

$(INTROGFXDIR)/scene_3/gengar_anim.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 348 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/building/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 77 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/cave/anim.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 106 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/cave/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 84 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/grass/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 98 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/indoor/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 77 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/longgrass/anim.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 133 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/longgrass/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 98 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/mountain/anim.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 47 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/pond/anim.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 36 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/pond/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 75 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/sand/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 83 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/underwater/anim.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 26 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/underwater/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 85 -Wnum_tiles

$(BATTLETERRAINGFXDIR)/water/terrain.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 81 -Wnum_tiles

$(BERRYPOUCHGFXDIR)/background.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 52 -Wnum_tiles

$(HALLOFFAMEGFXDIR)/hall_of_fame.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 29 -Wnum_tiles

$(TILESETGFXDIR)/primary/general/anim/water_current_landwatersedge/7.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 47 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/altering_cave/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 391 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/berry_forest/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 395 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/digletts_cave/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 398 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/dotted_hole/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 317 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/icefall_cave/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 399 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/lost_cave/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 404 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/monean_chamber/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 326 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/mt_ember/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 355 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/mt_moon/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 364 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/pokemon_mansion/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 388 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/pokemon_tower/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 290 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/power_plant/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 368 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/rock_tunnel/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 407 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/rocket_hideout/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 194 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/rocket_warehouse/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 234 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/safari_zone/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 330 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/seafoam_islands/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 408 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/silph_co/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 355 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/victory_road/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 375 -Wnum_tiles

$(MAPPREVIEWGFXDIR)/viridian_forest/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 389 -Wnum_tiles

$(NAMINGGFXDIR)/cursor.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 5 -Wnum_tiles

$(NAMINGGFXDIR)/cursor_squished.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 5 -Wnum_tiles

$(NAMINGGFXDIR)/cursor_filled.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 5 -Wnum_tiles


$(WALLPAPERGFXDIR)/beach/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 60 -Wnum_tiles

$(WALLPAPERGFXDIR)/cave/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 61 -Wnum_tiles

$(WALLPAPERGFXDIR)/city/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 40 -Wnum_tiles

$(WALLPAPERGFXDIR)/crag/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 54 -Wnum_tiles

$(WALLPAPERGFXDIR)/desert/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 52 -Wnum_tiles

$(WALLPAPERGFXDIR)/forest/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 53 -Wnum_tiles

$(WALLPAPERGFXDIR)/pokecenter/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 57 -Wnum_tiles

$(WALLPAPERGFXDIR)/river/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 63 -Wnum_tiles

$(WALLPAPERGFXDIR)/savanna/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 45 -Wnum_tiles

$(WALLPAPERGFXDIR)/seafloor/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 53 -Wnum_tiles

$(WALLPAPERGFXDIR)/simple/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 25 -Wnum_tiles

$(WALLPAPERGFXDIR)/sky/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 52 -Wnum_tiles

$(WALLPAPERGFXDIR)/snow/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 51 -Wnum_tiles

$(WALLPAPERGFXDIR)/stars/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 37 -Wnum_tiles

$(WALLPAPERGFXDIR)/tiles/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 31 -Wnum_tiles

$(WALLPAPERGFXDIR)/volcano/tiles.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles 57 -Wnum_tiles
